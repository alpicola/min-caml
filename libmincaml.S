.text
min_caml_create_array:
	move	r4, r2
	move	r2, r30
	bgtz	r4, create_array.loop
	jr	r31
create_array.loop:
	sw	r3, 0(r30)
	addi	r30, r30, 1
	addi	r4, r4, -1
	bgtz	r4, create_array.loop
	jr	r31
min_caml_create_float_array:
	move	r4, r2
	move	r2, r30
	bgtz	r4, create_float_array.loop
	jr	r31
create_float_array.loop:
	swf	f1, 0(r30)
	addi	r30, r30, 1
	addi	r4, r4, -1
	bgtz	r4, create_float_array.loop
	jr	r31
min_caml_sin:
	fclt	r2, f1, f0 # sign
	fabs	f1, f1
	fli	f2, 3.1415927 # pi
	lui	r3, 0x4000
	imvf	f6, r3        # 2.0
	lui	r3, 0x3f00
	imvf	f7, r3        # 0.5
	fmul	f3, f2, f6    # pi*2
	fmul	f4, f2, f7    # pi/2
	fmul	f5, f4, f7    # pi/4
	li	r3, 1
sin.div_2pi:
	fblt	f1, f3, sin.cont
	fmove	f8, f3
sin.div_2pi.1:
	fmul	f8, f8, f6
	fbge	f1, f8, sin.div_2pi.1
	fmul	f8, f8, f7
sin.div_2pi.2:
	fblt	f1, f8, sin.div_2pi.3
	fsub	f1, f1, f8
sin.div_2pi.3:
	fmul	f8, f8, f7
	fbge	f1, f3, sin.div_2pi.2
sin.cont:
	fblt	f1, f2, sin.cont.1
	fsub	f1, f1, f2
	sub	r2, r3, r2
sin.cont.1:
	fblt	f1, f4, sin.cont.2
	fsub	f1, f2, f1
sin.cont.2:
	fble	f1, f5, sin.kernel
	fsub	f1, f4, f1
	j	cos.kernel
sin.kernel:
	fmul	f2, f1, f1 # x^2
	lui	r3, 0xb94d
	ori	r3, r3, 0x64b6
	imvf	f3, r3 # -0.00019587841
	fmul	f3, f2, f3
	lui	r3, 0x3c08
	ori	r3, r3, 0x8666
	imvf	f4, r3 # 0.008332824
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0xbe2a
	ori	r3, r3, 0xaaac
	imvf	f4, r3 # -0.16666668
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0x3f80
	imvf	f4, r3 # 1.0
	fadd	f3, f3, f4
	fmul	f1, f1, f3
	blez	r2, sin.kernel.1
	fneg	f1, f1
sin.kernel.1:
	jr	r31
min_caml_cos:
	move	r2, r0 # sign
	fabs	f1, f1
	fli	f2, 3.1415927 # pi
	lui	r3, 0x4000
	imvf	f6, r3        # 2.0
	lui	r3, 0x3f00
	imvf	f7, r3        # 0.5
	fmul	f3, f2, f6    # pi*2
	fmul	f4, f2, f7    # pi/2
	fmul	f5, f4, f7    # pi/4
	li	r3, 1
cos.div_2pi:
	fblt	f1, f3, cos.cont 
	fmove	f8, f3
cos.div_2pi.1:
	fmul	f8, f8, f6	
	fbge	f1, f8, cos.div_2pi.1
	fmul	f8, f8, f7
cos.div_2pi.2:
	fblt	f1, f8, cos.div_2pi.3
	fsub	f1, f1, f8
cos.div_2pi.3:
	fmul	f8, f8, f7
	fbge	f1, f3, cos.div_2pi.2
cos.cont:
	fblt	f1, f2, cos.cont.1
	fsub	f1, f1, f2
	sub	r2, r3, r2
cos.cont.1:
	fblt	f1, f4, cos.cont.2
	fsub	f1, f2, f1
	sub	r2, r3, r2
cos.cont.2:
	fble	f1, f5, cos.kernel
	fsub	f1, f4, f1
	j	sin.kernel
cos.kernel:
	fmul	f1, f1, f1 # x^2
	lui	r3, 0xbab3
	ori	r3, r3, 0x8106
	imvf	f2, r3 # -0.0013695068
	fmul	f2, f2, f1
	lui	r3, 0x3d2a
	ori	r3, r3, 0xa789
	imvf	f3, r3 # 0.04166368 
	fadd	f2, f2, f3
	fmul	f2, f2, f1
	fsub	f2, f2, f7
	fmul	f2, f2, f1
	lui	r3, 0x3f80
	imvf	f3, r3 # 1.0
	fadd	f1, f2, f3
	blez	r2, cos.kernel.1
	fneg	f1, f1
cos.kernel.1:
	jr	r31
min_caml_atan:
	fclt	r2, f1, f0 # sign
	fabs	f1, f1
	lui	r3, 0x3ee0
	imvf	f2, r3     # 0.4375
	move	r10, r31
atan:
	fbge	f1, f2, atan.large
	jal	atan.kernel
	blez	r2, atan.1
	fneg	f1, f1
atan.1:
	jr	r10
atan.large:
	lui	r3, 0x401c
	imvf	f2, r3     # 2.4375
	lui	r3, 0x3f80
	imvf	f4, r3     # 1.0
	fbge	f1, f2, atan.large.large
	fsub	f3, f1, f4
	fadd	f4, f1, f4
	fdiv	f1, f3, f4
	jal	atan.kernel
	fli	f2, 0.7853982 # pi/4
	fadd	f1, f1, f2
	blez	r2, atan.1
	fneg	f1, f1
atan.large.1:
	jr	r10
atan.large.large:
	fdiv	f1, f4, f1
	jal	atan.kernel
	fli	f2, 1.5707964 # pi/2
	fsub	f1, f2, f1
	blez	r2, atan.large.large.1
	fneg	f1, f1
atan.large.large.1:
	jr	r10
atan.kernel:
	fmul	f2, f1, f1 # x^2
	lui	r3, 0x3d75
	ori	r3, r3, 0xe7c5
	imvf	f3, r3 # 0.060035485
	fmul	f3, f2, f3
	lui	r3, 0xbdb7
	ori	r3, r3, 0xd66e
	imvf	f4, r3 # -0.08976446
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0x3de3
	ori	r3, r3, 0x8e38
	imvf	f4, r3 # 0.111111104
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0xbe12
	ori	r3, r3, 0x4925
	imvf	f4, r3 # -0.142857142
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0x3e4c
	ori	r3, r3, 0xcccd
	imvf	f4, r3 # 0.2
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0xbeaa
	ori	r3, r3, 0xaaaa
	imvf	f4, r3 # -0.3333333
	fadd	f3, f3, f4
	fmul	f3, f2, f3
	lui	r3, 0x3f80
	imvf	f4, r3 # 1.0
	fadd	f3, f3, f4
	fmul	f1, f1, f3
	jr	r31
min_caml_float_of_int:
	lui	r3, 0x80   # 8388608 = 2 ^ 23
	lui	r4, 0x4b00
	imvf	f4, r4     # 8388608.0
	bltz	r2, float_of_int.neg
	bge	r2, r3, float_of_int.large
	or	r2, r2, r4
	imvf	f2, r2
	fsub	f1, f2, f4
	jr	r31
float_of_int.large:
	srl	r5, r2, 23
	sll	r2, r2, 9
	srl	r2, r2, 9
	or	r2, r2, r4
	imvf	f2, r2
	fsub	f1, f2, f4
float_of_int.large.1:
	fadd	f1, f1, f4
	addi	r5, r5, -1
	bgtz	r5, float_of_int.large.1
	jr	r31
float_of_int.neg:
	neg	r2, r2
	bge	r2, r3, float_of_int.neg.large
	or	r2, r2, r4
	imvf	f2, r2
	fsub	f1, f2, f4
	fneg	f1, f1
	jr	r31
float_of_int.neg.large:
	srl	r5, r2, 23
	sll	r2, r2, 9
	srl	r2, r2, 9
	or	r2, r2, r4
	imvf	f2, r2
	fsub	f1, f2, f4
float_of_int.neg.large.1:
	fadd	f1, f1, f4
	addi	r5, r5, -1
	bgtz	r5, float_of_int.neg.large.1
	fneg	f1, f1
	jr	r31
min_caml_int_of_float:
	lui	r3, 0x4b00
	imvf	f3, r3     # 8388608.0
	fblt	f1, f0, int_of_float.neg
	fbge	f1, f3, int_of_float.large 
	fadd	f1, f1, f3
	fmvi	r2, f1
	sub	r2, r2, r3
	jr	r31
int_of_float.large:
	move	r2, r0
int_of_float.large.loop:
	fsub	f1, f1, f3
	addi	r2, r2, 1
	fbge	f1, f3, int_of_float.large.loop
	sll	r2, r2, 23
	fadd	f1, f1, f3
	fmvi	r4, f1
	sub	r4, r4, r3
	or	r2, r2, r4
	jr	r31
int_of_float.neg:
	fneg	f1, f1
	fbge	f1, f3, int_of_float.neg.large 
	fadd	f1, f1, f3
	fmvi	r2, f1
	sub	r2, r3, r2
	jr	r31
int_of_float.neg.large:
	move	r2, r0
int_of_float.neg.large.loop:
	fsub	f1, f1, f3
	addi	r2, r2, 1
	fbge	f1, f3, int_of_float.neg.large.loop
	sll	r2, r2, 23
	fadd	f1, f1, f3
	fmvi	r4, f1
	sub	r4, r4, r3
	or	r2, r2, r4
	neg	r2, r2
	jr	r31
min_caml_floor:
	lui	r3, 0x4b00
	imvf	f3, r3     # 8388608.0
	fblt	f1, f0, floor.neg
	fblt	f1, f3, floor.small
	jr	r31
floor.small:
	fadd	f2, f1, f3
	fsub	f2, f2, f3
	fbgt	f2, f1, floor.small.ceil
	fmove	f1, f2
	jr	r31
floor.small.ceil:
	lui	r3, 0x3f80
	imvf	f1, r3 # 1.0
	fsub	f1, f2, f1
	jr	r31
floor.neg:
	fneg	f2, f1
	fblt	f2, f3, floor.neg.small
	jr	r31
floor.neg.small:
	fadd	f2, f2, f3
	fsub	f2, f2, f3
	fneg	f2, f2
	fbgt	f2, f1, floor.small.ceil
	fmove	f1, f2
	jr	r31
min_caml_truncate: # for min-caml/test
	move	r10, r31
	fblt	f1, f0, truncate.neg
	jal	min_caml_floor
	move	r31, r10
	j	min_caml_int_of_float
truncate.neg:
	fneg	f1, f1
	jal	min_caml_floor
	fneg	f1, f1
	move	r31, r10
	j	min_caml_int_of_float
min_caml_fhalf:
	fli	f2, 0.5
	fmul	f1, f1, f2
	jr	r31
min_caml_fsqr:
	fmul	f1, f1, f1
	jr	r31
min_caml_sqrt:
	fsqrt	f1, f1
	jr	r31
min_caml_fabs:
	fabs	f1, f1
	jr	r31
min_caml_fneg:
	fneg	f1, f1
	jr	r31
min_caml_div: # naive implemetion
	move	r4, r2
	move	r2, r0
	beq	r0, r3, div.end
	bgez	r4, div.pos
div.neg:
	neg	r4, r4
	bgtz	r3, div.loop.neg
	neg	r3, r3
	j	div.loop.pos
div.pos:
	bgtz	r3, div.loop.pos
	neg	r3, r3
	j	div.loop.neg
div.loop.pos:
	sub	r4, r4, r3
	bgez	r4, div.loop.pos.0
	jr	r31
div.loop.pos.0:
	sub	r4, r4, r3
	addi	r2, r2, 1
	bgez	r4, div.loop.pos.0
	jr	r31
div.loop.neg:
	sub	r4, r4, r3
	bgez	r4, div.loop.neg.0
	jr	r31
div.loop.neg.0:
	sub	r4, r4, r3
	addi	r2, r2, -1
	bgez	r4, div.loop.neg.0
div.end:
	jr	r31
min_caml_read_int:
	iw	r2
	jr	r31
min_caml_read_float:
	iwf	f1
	jr	r31
min_caml_print_byte:
min_caml_print_char:
	ob	r2
	jr	r31
min_caml_print_int:
	li	r4, 10
	li	r5, 100
	li	r6, 1000
	bltz	r2, print_int.neg
print_int.pos:
	move	r10, r31
	blt	r2, r6, print_int.pos.1000
print_int.pos.large:
	mul	r6, r6
	mflo	r9 # 1000000
	bge	r2, r9, print_int.pos.large.large
	move	r3, r6
	jal	print_int.div
	move	r7, r2
	move	r9, r10
	move	r2, r3
	jal	print_int.pos.1000.2
	move	r2, r7
	move	r10, r9
	j	print_int.pos.1000.1
print_int.pos.large.large:
	move	r3, r9
	jal	print_int.div
	move	r7, r2
	move	r9, r10
	move	r2, r3
	jal	print_int.pos.10000.2
	move	r2, r7
	move	r10, r9
	j	print_int.pos.1000000.1
print_int.neg:
	li	r3, 45
	ob	r3
	neg	r2, r2
	j	print_int.pos
print_int.pos.10000:
	move	r3, r6
	jal	print_int.div
	blez	r3, print_int.pos.1000
	addi	r3, r3, 48
	ob	r3
	j	print_int.pos.1000.1
print_int.pos.1000:
	move	r3, r5
	jal	print_int.div
	blez	r3, print_int.pos.100
	addi	r3, r3, 48
	ob	r3
	j	print_int.pos.100.1
print_int.pos.100:
	move	r3, r4
	jal	print_int.div
	blez	r3, print_int.pos.10
	addi	r3, r3, 48
	ob	r3
print_int.pos.10:
	addi	r2, r2, 48
	ob	r2
	jr	r10
print_int.pos.1000000.1:
	li	r7, 10000
	mul	r7, r4
	mflo	r8 # 100000
	move	r3, r8
	jal	print_int.div
	addi	r3, r3, 48
	ob	r3
print_int.pos.100000.1:
	move	r3, r7
	jal	print_int.div
	addi	r3, r3, 48
	ob	r3
print_int.pos.10000.1:
	move	r3, r6
	jal	print_int.div
	addi	r3, r3, 48
	ob	r3
print_int.pos.1000.1:
	move	r3, r5
	jal	print_int.div
	addi	r3, r3, 48
	ob	r3
print_int.pos.100.1:
	move	r3, r4
	jal	print_int.div
	addi	r3, r3, 48
	ob	r3
	addi	r2, r2, 48
	ob	r2
	jr	r10
print_int.pos.1000.2:
	move	r10, r31
	j	print_int.pos.1000
print_int.pos.10000.2:
	move	r10, r31
	j	print_int.pos.10000
print_int.div:
	move	r8, r3
	move	r3, r0
	sub	r2, r2, r8
	bgez	r2, print_int.div.loop
	add	r2, r2, r8
	jr	r31
print_int.div.loop:
	sub	r2, r2, r8
	addi	r3, r3, 1
	bgez	r2, print_int.div.loop
	add	r2, r2, r8
	jr	r31
min_caml_print_newline:
	li	r2, 10
	ob	r2
	jr	r31
min_caml_dump:
	dump	r2
	jr	r31
min_caml_dump_float:
	dumpf	f1
	jr	r31
