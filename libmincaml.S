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
min_caml_print_int:
	ow	r2
	jr	r31
