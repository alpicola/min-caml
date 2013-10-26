min_caml_create_array:
	move	r4, r2
	move	r2, r30
	bgtz	r4, create_array.loop
	jr	r31
create_array.loop:
	sw	r3, 0(r30)
	addi	r30, r30, 4
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
	addi	r30, r30, 4
	addi	r4, r4, -1
	bgtz	r4, create_float_array.loop
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
	fli	f1, 1.0
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
	fblt	f1, f0, truncate.neg
	sw	r31, 0(r29)
	addi	r29, r29, -4
	jal	min_caml_floor
	addi	r29, r29, 4
	lw	r31, 0(r29)
	j	min_caml_int_of_float
truncate.neg:
	fneg	f1, f1
	sw	r31, 0(r29)
	addi	r29, r29, -4
	jal	min_caml_floor
	addi	r29, r29, 4
	lw	r31, 0(r29)
	fneg	f1, f1
	sw	r31, 0(r29)
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
	li	r3, 10
	li	r4, 100
	li	r5, 1000
	bltz	r2, print_int.neg
print_int.pos:
	blt	r2, r5, print_int.pos.1000
print_int.pos.large:
	mul	r5, r5
	mflo	r8 # 1000000
	bge	r2, r8, print_int.pos.large.large
	div	r2, r5
	mfhi	r2
	mflo	r9
	move	r27, r31
	jal	print_int.pos.1000
	move	r2, r9
	move	r31, r27
	j	print_int.pos.1000.1
print_int.pos.large.large:
	div	r2, r8
	mfhi	r2
	mflo	r9
	move	r27, r31
	jal	print_int.pos.10000
	move	r2, r9
	move	r31, r27
	j	print_int.pos.1000000.1
print_int.neg:
	li	r8, 45
	ob	r8
	neg	r2, r2
	j	print_int.pos
print_int.pos.1000000:
	div	r2, r7
	mfhi	r8
	blez	r8, print_int.pos.100000
	addi	r8, r8, 48
	ob	r8
	mflo	r2
	j	print_int.pos.100000.1
print_int.pos.100000:
	div	r2, r6
	mfhi	r8
	blez	r8, print_int.pos.10000
	addi	r8, r8, 48
	ob	r8
	mflo	r2
	j	print_int.pos.10000.1
print_int.pos.10000:
	div	r2, r5
	mfhi	r8
	blez	r8, print_int.pos.1000
	addi	r8, r8, 48
	ob	r8
	mflo	r2
	j	print_int.pos.1000.1
print_int.pos.1000:
	div	r2, r4
	mfhi	r8
	blez	r8, print_int.pos.100
	addi	r8, r8, 48
	ob	r8
	mflo	r2
	j	print_int.pos.100.1
print_int.pos.100:
	div	r2, r3
	mfhi	r8
	blez	r8, print_int.pos.10
	addi	r8, r8, 48
	ob	r8
	mflo	r2
print_int.pos.10:
	addi	r2, r2, 48
	ob	r2
	jr	r31
print_int.pos.1000000.1:
	li	r6, 10000
	mul	r6, r3
	mflo	r7 # 100000
	div	r2, r7
	mfhi	r8
	addi	r8, r8, 48
	ob	r8
	mflo	r2
print_int.pos.100000.1:
	div	r2, r6
	mfhi	r8
	addi	r8, r8, 48
	ob	r8
	mflo	r2
print_int.pos.10000.1:
	div	r2, r5
	mfhi	r8
	addi	r8, r8, 48
	ob	r8
	mflo	r2
print_int.pos.1000.1:
	div	r2, r4
	mfhi	r8
	addi	r8, r8, 48
	ob	r8
	mflo	r2
print_int.pos.100.1:
	div	r2, r3
	mfhi	r8
	addi	r8, r8, 48
	ob	r8
	mflo	r2
	addi	r2, r2, 48
	ob	r2
	jr	r31
min_caml_print_newline:
	li	r2, 10
	ob	r2
	jr	r31
