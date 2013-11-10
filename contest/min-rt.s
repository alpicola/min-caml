.text
	j	_min_caml_start
xor.2594:
	li	r4, 0
	bne	r2, r4, beq_else.7489
	move	r2, r3
	jr	r31
beq_else.7489:
	li	r2, 0
	bne	r3, r2, beq_else.7490
	li	r2, 1
	jr	r31
beq_else.7490:
	li	r2, 0
	jr	r31
sgn.2597:
	fcseq	r2, f1, f0
	li	r3, 0
	bne	r2, r3, beq_else.7491
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7492
	fli	f1, -1.
	jr	r31
beq_else.7492:
	fli	f1, 1.
	jr	r31
beq_else.7491:
	fli	f1, 0.
	jr	r31
fneg_cond.2599:
	li	r3, 0
	bne	r2, r3, beq_else.7493
	fneg	f1, f1
	jr	r31
beq_else.7493:
	jr	r31
add_mod5.2602:
	add	r2, r2, r3
	li	r3, 5
	bgt	r3, r2, ble_else.7494
	addi	r2, r2, -5
	jr	r31
ble_else.7494:
	jr	r31
vecset.2605:
	swf	f1, 0(r2)
	swf	f2, 1(r2)
	swf	f3, 2(r2)
	jr	r31
vecfill.2610:
	swf	f1, 0(r2)
	swf	f1, 1(r2)
	swf	f1, 2(r2)
	jr	r31
vecbzero.2613:
	fli	f1, 0.
	j	vecfill.2610
veccpy.2615:
	lwf	f1, 0(r3)
	swf	f1, 0(r2)
	lwf	f1, 1(r3)
	swf	f1, 1(r2)
	lwf	f1, 2(r3)
	swf	f1, 2(r2)
	jr	r31
vecunit_sgn.2623:
	lwf	f1, 0(r2)
	fmul	f1, f1, f1
	lwf	f2, 1(r2)
	fmul	f2, f2, f2
	fadd	f1, f1, f2
	lwf	f2, 2(r2)
	fmul	f2, f2, f2
	fadd	f1, f1, f2
	fsqrt	f1, f1
	fcseq	r4, f1, f0
	li	r5, 0
	bne	r4, r5, beq_else.7498
	li	r4, 0
	bne	r3, r4, beq_else.7500
	fli	f2, 1.
	fdiv	f1, f2, f1
	j	beq_cont.7501
beq_else.7500:
	fli	f2, -1.
	fdiv	f1, f2, f1
beq_cont.7501:
	j	beq_cont.7499
beq_else.7498:
	fli	f1, 1.
beq_cont.7499:
	lwf	f2, 0(r2)
	fmul	f2, f2, f1
	swf	f2, 0(r2)
	lwf	f2, 1(r2)
	fmul	f2, f2, f1
	swf	f2, 1(r2)
	lwf	f2, 2(r2)
	fmul	f1, f2, f1
	swf	f1, 2(r2)
	jr	r31
veciprod.2626:
	lwf	f1, 0(r2)
	lwf	f2, 0(r3)
	fmul	f1, f1, f2
	lwf	f2, 1(r2)
	lwf	f3, 1(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lwf	f2, 2(r2)
	lwf	f3, 2(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jr	r31
veciprod2.2629:
	lwf	f4, 0(r2)
	fmul	f1, f4, f1
	lwf	f4, 1(r2)
	fmul	f2, f4, f2
	fadd	f1, f1, f2
	lwf	f2, 2(r2)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jr	r31
vecaccum.2634:
	lwf	f2, 0(r2)
	lwf	f3, 0(r3)
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	swf	f2, 0(r2)
	lwf	f2, 1(r2)
	lwf	f3, 1(r3)
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	swf	f2, 1(r2)
	lwf	f2, 2(r2)
	lwf	f3, 2(r3)
	fmul	f1, f1, f3
	fadd	f1, f2, f1
	swf	f1, 2(r2)
	jr	r31
vecadd.2638:
	lwf	f1, 0(r2)
	lwf	f2, 0(r3)
	fadd	f1, f1, f2
	swf	f1, 0(r2)
	lwf	f1, 1(r2)
	lwf	f2, 1(r3)
	fadd	f1, f1, f2
	swf	f1, 1(r2)
	lwf	f1, 2(r2)
	lwf	f2, 2(r3)
	fadd	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
vecscale.2644:
	lwf	f2, 0(r2)
	fmul	f2, f2, f1
	swf	f2, 0(r2)
	lwf	f2, 1(r2)
	fmul	f2, f2, f1
	swf	f2, 1(r2)
	lwf	f2, 2(r2)
	fmul	f1, f2, f1
	swf	f1, 2(r2)
	jr	r31
vecaccumv.2647:
	lwf	f1, 0(r2)
	lwf	f2, 0(r3)
	lwf	f3, 0(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	swf	f1, 0(r2)
	lwf	f1, 1(r2)
	lwf	f2, 1(r3)
	lwf	f3, 1(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	swf	f1, 1(r2)
	lwf	f1, 2(r2)
	lwf	f2, 2(r3)
	lwf	f3, 2(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
o_texturetype.2651:
	lw	r2, 0(r2)
	jr	r31
o_form.2653:
	lw	r2, 1(r2)
	jr	r31
o_reflectiontype.2655:
	lw	r2, 2(r2)
	jr	r31
o_isinvert.2657:
	lw	r2, 6(r2)
	jr	r31
o_isrot.2659:
	lw	r2, 3(r2)
	jr	r31
o_param_a.2661:
	lw	r2, 4(r2)
	lwf	f1, 0(r2)
	jr	r31
o_param_b.2663:
	lw	r2, 4(r2)
	lwf	f1, 1(r2)
	jr	r31
o_param_c.2665:
	lw	r2, 4(r2)
	lwf	f1, 2(r2)
	jr	r31
o_param_abc.2667:
	lw	r2, 4(r2)
	jr	r31
o_param_x.2669:
	lw	r2, 5(r2)
	lwf	f1, 0(r2)
	jr	r31
o_param_y.2671:
	lw	r2, 5(r2)
	lwf	f1, 1(r2)
	jr	r31
o_param_z.2673:
	lw	r2, 5(r2)
	lwf	f1, 2(r2)
	jr	r31
o_diffuse.2675:
	lw	r2, 7(r2)
	lwf	f1, 0(r2)
	jr	r31
o_hilight.2677:
	lw	r2, 7(r2)
	lwf	f1, 1(r2)
	jr	r31
o_color_red.2679:
	lw	r2, 8(r2)
	lwf	f1, 0(r2)
	jr	r31
o_color_green.2681:
	lw	r2, 8(r2)
	lwf	f1, 1(r2)
	jr	r31
o_color_blue.2683:
	lw	r2, 8(r2)
	lwf	f1, 2(r2)
	jr	r31
o_param_r1.2685:
	lw	r2, 9(r2)
	lwf	f1, 0(r2)
	jr	r31
o_param_r2.2687:
	lw	r2, 9(r2)
	lwf	f1, 1(r2)
	jr	r31
o_param_r3.2689:
	lw	r2, 9(r2)
	lwf	f1, 2(r2)
	jr	r31
o_param_ctbl.2691:
	lw	r2, 10(r2)
	jr	r31
p_rgb.2693:
	lw	r2, 0(r2)
	jr	r31
p_intersection_points.2695:
	lw	r2, 1(r2)
	jr	r31
p_surface_ids.2697:
	lw	r2, 2(r2)
	jr	r31
p_calc_diffuse.2699:
	lw	r2, 3(r2)
	jr	r31
p_energy.2701:
	lw	r2, 4(r2)
	jr	r31
p_received_ray_20percent.2703:
	lw	r2, 5(r2)
	jr	r31
p_group_id.2705:
	lw	r2, 6(r2)
	lw	r2, 0(r2)
	jr	r31
p_set_group_id.2707:
	lw	r2, 6(r2)
	sw	r3, 0(r2)
	jr	r31
p_nvectors.2710:
	lw	r2, 7(r2)
	jr	r31
d_vec.2712:
	lw	r2, 0(r2)
	jr	r31
d_const.2714:
	lw	r2, 1(r2)
	jr	r31
r_surface_id.2716:
	lw	r2, 0(r2)
	jr	r31
r_dvec.2718:
	lw	r2, 1(r2)
	jr	r31
r_bright.2720:
	lwf	f1, 6(r2)
	jr	r31
rad.2722:
	fli	f2, 0.017453293
	fmul	f1, f1, f2
	jr	r31
read_screen_settings.2724:
	la	r2, min_caml_screen
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_read_float
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r2, 0(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_screen
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_read_float
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r2, -1(r29)
	swf	f1, 1(r2)
	la	r2, min_caml_screen
	sw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_read_float
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -2(r29)
	swf	f1, 2(r2)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_read_float
	addi	r29, r29, 4
	lw	r31, -3(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	rad.2722
	addi	r29, r29, 4
	lw	r31, -3(r29)
	swf	f1, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_cos
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	swf	f1, -4(r29)
	fmove	f1, f2
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	min_caml_sin
	addi	r29, r29, 6
	lw	r31, -5(r29)
	swf	f1, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_read_float
	addi	r29, r29, 7
	lw	r31, -6(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	rad.2722
	addi	r29, r29, 7
	lw	r31, -6(r29)
	swf	f1, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_cos
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	swf	f1, -7(r29)
	fmove	f1, f2
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	min_caml_sin
	addi	r29, r29, 9
	lw	r31, -8(r29)
	la	r2, min_caml_screenz_dir
	lwf	f2, -4(r29)
	fmul	f3, f2, f1
	fli	f4, 200.
	fmul	f3, f3, f4
	swf	f3, 0(r2)
	la	r2, min_caml_screenz_dir
	fli	f3, -200.
	lwf	f4, -5(r29)
	fmul	f3, f4, f3
	swf	f3, 1(r2)
	la	r2, min_caml_screenz_dir
	lwf	f3, -7(r29)
	fmul	f5, f2, f3
	fli	f6, 200.
	fmul	f5, f5, f6
	swf	f5, 2(r2)
	la	r2, min_caml_screenx_dir
	swf	f3, 0(r2)
	la	r2, min_caml_screenx_dir
	fli	f5, 0.
	swf	f5, 1(r2)
	la	r2, min_caml_screenx_dir
	fneg	f5, f1
	swf	f5, 2(r2)
	la	r2, min_caml_screeny_dir
	fneg	f5, f4
	fmul	f1, f5, f1
	swf	f1, 0(r2)
	la	r2, min_caml_screeny_dir
	fneg	f1, f2
	swf	f1, 1(r2)
	la	r2, min_caml_screeny_dir
	fneg	f1, f4
	fmul	f1, f1, f3
	swf	f1, 2(r2)
	la	r2, min_caml_viewpoint
	la	r3, min_caml_screen
	lwf	f1, 0(r3)
	la	r3, min_caml_screenz_dir
	lwf	f2, 0(r3)
	fsub	f1, f1, f2
	swf	f1, 0(r2)
	la	r2, min_caml_viewpoint
	la	r3, min_caml_screen
	lwf	f1, 1(r3)
	la	r3, min_caml_screenz_dir
	lwf	f2, 1(r3)
	fsub	f1, f1, f2
	swf	f1, 1(r2)
	la	r2, min_caml_viewpoint
	la	r3, min_caml_screen
	lwf	f1, 2(r3)
	la	r3, min_caml_screenz_dir
	lwf	f2, 2(r3)
	fsub	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
read_light.2726:
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_read_int
	addi	r29, r29, 1
	lw	r31, 0(r29)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_read_float
	addi	r29, r29, 1
	lw	r31, 0(r29)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	rad.2722
	addi	r29, r29, 1
	lw	r31, 0(r29)
	swf	f1, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_sin
	addi	r29, r29, 2
	lw	r31, -1(r29)
	la	r2, min_caml_light
	fneg	f1, f1
	swf	f1, 1(r2)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_read_float
	addi	r29, r29, 2
	lw	r31, -1(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	rad.2722
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lwf	f2, 0(r29)
	swf	f1, -1(r29)
	fmove	f1, f2
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_cos
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, -1(r29)
	swf	f1, -2(r29)
	fmove	f1, f2
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_sin
	addi	r29, r29, 4
	lw	r31, -3(r29)
	la	r2, min_caml_light
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	swf	f1, 0(r2)
	lwf	f1, -1(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_cos
	addi	r29, r29, 4
	lw	r31, -3(r29)
	la	r2, min_caml_light
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	swf	f1, 2(r2)
	la	r2, min_caml_beam
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_read_float
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -3(r29)
	swf	f1, 0(r2)
	jr	r31
rotate_quadratic_matrix.2728:
	lwf	f1, 0(r3)
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_cos
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r2, -1(r29)
	lwf	f2, 0(r2)
	swf	f1, -2(r29)
	fmove	f1, f2
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_sin
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -1(r29)
	lwf	f2, 1(r2)
	swf	f1, -3(r29)
	fmove	f1, f2
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_cos
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -1(r29)
	lwf	f2, 1(r2)
	swf	f1, -4(r29)
	fmove	f1, f2
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	min_caml_sin
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	lwf	f2, 2(r2)
	swf	f1, -5(r29)
	fmove	f1, f2
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_cos
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -1(r29)
	lwf	f2, 2(r2)
	swf	f1, -6(r29)
	fmove	f1, f2
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_sin
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	lwf	f3, -4(r29)
	fmul	f4, f3, f2
	lwf	f5, -5(r29)
	lwf	f6, -3(r29)
	fmul	f7, f6, f5
	fmul	f7, f7, f2
	lwf	f8, -2(r29)
	fmul	f9, f8, f1
	fsub	f7, f7, f9
	fmul	f9, f8, f5
	fmul	f9, f9, f2
	fmul	f10, f6, f1
	fadd	f9, f9, f10
	fmul	f10, f3, f1
	fmul	f11, f6, f5
	fmul	f11, f11, f1
	fmul	f12, f8, f2
	fadd	f11, f11, f12
	fmul	f12, f8, f5
	fmul	f1, f12, f1
	fmul	f2, f6, f2
	fsub	f1, f1, f2
	fneg	f2, f5
	fmul	f5, f6, f3
	fmul	f3, f8, f3
	lw	r2, 0(r29)
	lwf	f6, 0(r2)
	lwf	f8, 1(r2)
	lwf	f12, 2(r2)
	fmul	f13, f4, f4
	fmul	f13, f6, f13
	fmul	f14, f10, f10
	fmul	f14, f8, f14
	fadd	f13, f13, f14
	fmul	f14, f2, f2
	fmul	f14, f12, f14
	fadd	f13, f13, f14
	swf	f13, 0(r2)
	fmul	f13, f7, f7
	fmul	f13, f6, f13
	fmul	f14, f11, f11
	fmul	f14, f8, f14
	fadd	f13, f13, f14
	fmul	f14, f5, f5
	fmul	f14, f12, f14
	fadd	f13, f13, f14
	swf	f13, 1(r2)
	fmul	f13, f9, f9
	fmul	f13, f6, f13
	fmul	f14, f1, f1
	fmul	f14, f8, f14
	fadd	f13, f13, f14
	fmul	f14, f3, f3
	fmul	f14, f12, f14
	fadd	f13, f13, f14
	swf	f13, 2(r2)
	fli	f13, 2.
	fmul	f14, f6, f7
	fmul	f14, f14, f9
	fmul	f15, f8, f11
	fmul	f15, f15, f1
	fadd	f14, f14, f15
	fmul	f15, f12, f5
	fmul	f15, f15, f3
	fadd	f14, f14, f15
	fmul	f13, f13, f14
	lw	r2, -1(r29)
	swf	f13, 0(r2)
	fli	f13, 2.
	fmul	f14, f6, f4
	fmul	f9, f14, f9
	fmul	f14, f8, f10
	fmul	f1, f14, f1
	fadd	f1, f9, f1
	fmul	f9, f12, f2
	fmul	f3, f9, f3
	fadd	f1, f1, f3
	fmul	f1, f13, f1
	swf	f1, 1(r2)
	fli	f1, 2.
	fmul	f3, f6, f4
	fmul	f3, f3, f7
	fmul	f4, f8, f10
	fmul	f4, f4, f11
	fadd	f3, f3, f4
	fmul	f2, f12, f2
	fmul	f2, f2, f5
	fadd	f2, f3, f2
	fmul	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
read_nth_object.2731:
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_read_int
	addi	r29, r29, 2
	lw	r31, -1(r29)
	li	r3, -1
	bne	r2, r3, beq_else.7511
	li	r2, 0
	jr	r31
beq_else.7511:
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_read_int
	addi	r29, r29, 3
	lw	r31, -2(r29)
	sw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_read_int
	addi	r29, r29, 4
	lw	r31, -3(r29)
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_read_int
	addi	r29, r29, 5
	lw	r31, -4(r29)
	li	r3, 3
	fli	f1, 0.
	sw	r2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	min_caml_create_float_array
	addi	r29, r29, 6
	lw	r31, -5(r29)
	sw	r2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_read_float
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -5(r29)
	swf	f1, 0(r2)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_read_float
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -5(r29)
	swf	f1, 1(r2)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_read_float
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -5(r29)
	swf	f1, 2(r2)
	li	r3, 3
	fli	f1, 0.
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_create_float_array
	addi	r29, r29, 7
	lw	r31, -6(r29)
	sw	r2, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_read_float
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -6(r29)
	swf	f1, 0(r2)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_read_float
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -6(r29)
	swf	f1, 1(r2)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_read_float
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -6(r29)
	swf	f1, 2(r2)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_read_float
	addi	r29, r29, 8
	lw	r31, -7(r29)
	fclt	r2, f1, f0
	li	r3, 2
	fli	f1, 0.
	sw	r2, -7(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	min_caml_create_float_array
	addi	r29, r29, 9
	lw	r31, -8(r29)
	sw	r2, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	min_caml_read_float
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r2, -8(r29)
	swf	f1, 0(r2)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	min_caml_read_float
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r2, -8(r29)
	swf	f1, 1(r2)
	li	r3, 3
	fli	f1, 0.
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	min_caml_create_float_array
	addi	r29, r29, 10
	lw	r31, -9(r29)
	sw	r2, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	min_caml_read_float
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r2, -9(r29)
	swf	f1, 0(r2)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	min_caml_read_float
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r2, -9(r29)
	swf	f1, 1(r2)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	min_caml_read_float
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r2, -9(r29)
	swf	f1, 2(r2)
	li	r3, 3
	fli	f1, 0.
	move	r2, r3
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	min_caml_create_float_array
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r3, 0
	lw	r4, -4(r29)
	bne	r4, r3, beq_else.7512
	j	beq_cont.7513
beq_else.7512:
	sw	r2, -10(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	min_caml_read_float
	addi	r29, r29, 12
	lw	r31, -11(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	rad.2722
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lw	r2, -10(r29)
	swf	f1, 0(r2)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	min_caml_read_float
	addi	r29, r29, 12
	lw	r31, -11(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	rad.2722
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lw	r2, -10(r29)
	swf	f1, 1(r2)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	min_caml_read_float
	addi	r29, r29, 12
	lw	r31, -11(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	rad.2722
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lw	r2, -10(r29)
	swf	f1, 2(r2)
beq_cont.7513:
	li	r3, 2
	lw	r4, -2(r29)
	bne	r4, r3, beq_else.7514
	li	r3, 1
	j	beq_cont.7515
beq_else.7514:
	lw	r3, -7(r29)
beq_cont.7515:
	li	r5, 4
	fli	f1, 0.
	sw	r3, -11(r29)
	sw	r2, -10(r29)
	move	r2, r5
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	min_caml_create_float_array
	addi	r29, r29, 13
	lw	r31, -12(r29)
	move	r3, r30
	addi	r30, r30, 15
	sw	r2, 10(r3)
	lw	r2, -10(r29)
	sw	r2, 9(r3)
	lw	r4, -9(r29)
	sw	r4, 8(r3)
	lw	r4, -8(r29)
	sw	r4, 7(r3)
	lw	r4, -11(r29)
	sw	r4, 6(r3)
	lw	r4, -6(r29)
	sw	r4, 5(r3)
	lw	r4, -5(r29)
	sw	r4, 4(r3)
	lw	r5, -4(r29)
	sw	r5, 3(r3)
	lw	r6, -3(r29)
	sw	r6, 2(r3)
	lw	r6, -2(r29)
	sw	r6, 1(r3)
	lw	r7, -1(r29)
	sw	r7, 0(r3)
	la	r7, min_caml_objects
	lw	r8, 0(r29)
	swx	r3, r7, r8
	li	r3, 3
	bne	r6, r3, beq_else.7516
	lwf	f1, 0(r4)
	fcseq	r3, f1, f0
	li	r6, 0
	bne	r3, r6, beq_else.7518
	swf	f1, -12(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	sgn.2597
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -12(r29)
	fmul	f2, f2, f2
	fdiv	f1, f1, f2
	j	beq_cont.7519
beq_else.7518:
	fli	f1, 0.
beq_cont.7519:
	lw	r2, -5(r29)
	swf	f1, 0(r2)
	lwf	f1, 1(r2)
	fcseq	r3, f1, f0
	li	r4, 0
	bne	r3, r4, beq_else.7520
	swf	f1, -13(r29)
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	sgn.2597
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -13(r29)
	fmul	f2, f2, f2
	fdiv	f1, f1, f2
	j	beq_cont.7521
beq_else.7520:
	fli	f1, 0.
beq_cont.7521:
	lw	r2, -5(r29)
	swf	f1, 1(r2)
	lwf	f1, 2(r2)
	fcseq	r3, f1, f0
	li	r4, 0
	bne	r3, r4, beq_else.7522
	swf	f1, -14(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	sgn.2597
	addi	r29, r29, 16
	lw	r31, -15(r29)
	lwf	f2, -14(r29)
	fmul	f2, f2, f2
	fdiv	f1, f1, f2
	j	beq_cont.7523
beq_else.7522:
	fli	f1, 0.
beq_cont.7523:
	lw	r2, -5(r29)
	swf	f1, 2(r2)
	j	beq_cont.7517
beq_else.7516:
	li	r3, 2
	bne	r6, r3, beq_else.7524
	li	r3, 0
	lw	r6, -7(r29)
	bne	r6, r3, beq_else.7526
	li	r3, 1
	j	beq_cont.7527
beq_else.7526:
	li	r3, 0
beq_cont.7527:
	move	r2, r4
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	vecunit_sgn.2623
	addi	r29, r29, 16
	lw	r31, -15(r29)
	j	beq_cont.7525
beq_else.7524:
beq_cont.7525:
beq_cont.7517:
	li	r2, 0
	lw	r3, -4(r29)
	bne	r3, r2, beq_else.7528
	j	beq_cont.7529
beq_else.7528:
	lw	r2, -5(r29)
	lw	r3, -10(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	rotate_quadratic_matrix.2728
	addi	r29, r29, 16
	lw	r31, -15(r29)
beq_cont.7529:
	li	r2, 1
	jr	r31
read_object.2733:
	li	r3, 60
	bgt	r3, r2, ble_else.7530
	jr	r31
ble_else.7530:
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	read_nth_object.2731
	addi	r29, r29, 2
	lw	r31, -1(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7532
	la	r2, min_caml_n_objects
	lw	r3, 0(r29)
	sw	r3, 0(r2)
	jr	r31
beq_else.7532:
	lw	r2, 0(r29)
	addi	r2, r2, 1
	j	read_object.2733
read_all_object.2735:
	li	r2, 0
	j	read_object.2733
read_net_item.2737:
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_read_int
	addi	r29, r29, 2
	lw	r31, -1(r29)
	li	r3, -1
	bne	r2, r3, beq_else.7534
	lw	r2, 0(r29)
	addi	r2, r2, 1
	li	r3, -1
	j	min_caml_create_array
beq_else.7534:
	lw	r3, 0(r29)
	addi	r4, r3, 1
	sw	r2, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	read_net_item.2737
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, 0(r29)
	lw	r4, -1(r29)
	swx	r4, r2, r3
	jr	r31
read_or_network.2739:
	li	r3, 0
	sw	r2, 0(r29)
	move	r2, r3
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	read_net_item.2737
	addi	r29, r29, 2
	lw	r31, -1(r29)
	move	r3, r2
	lw	r2, 0(r3)
	li	r4, -1
	bne	r2, r4, beq_else.7535
	lw	r2, 0(r29)
	addi	r2, r2, 1
	j	min_caml_create_array
beq_else.7535:
	lw	r2, 0(r29)
	addi	r4, r2, 1
	sw	r3, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	read_or_network.2739
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, 0(r29)
	lw	r4, -1(r29)
	swx	r4, r2, r3
	jr	r31
read_and_network.2741:
	li	r3, 0
	sw	r2, 0(r29)
	move	r2, r3
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	read_net_item.2737
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r2)
	li	r4, -1
	bne	r3, r4, beq_else.7536
	jr	r31
beq_else.7536:
	la	r3, min_caml_and_net
	lw	r4, 0(r29)
	swx	r2, r3, r4
	addi	r2, r4, 1
	j	read_and_network.2741
read_parameter.2743:
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	read_screen_settings.2724
	addi	r29, r29, 1
	lw	r31, 0(r29)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	read_light.2726
	addi	r29, r29, 1
	lw	r31, 0(r29)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	read_all_object.2735
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 0
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	read_and_network.2741
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_or_net
	li	r3, 0
	sw	r2, 0(r29)
	move	r2, r3
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	read_or_network.2739
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	sw	r2, 0(r3)
	jr	r31
solver_rect_surface.2745:
	lwfx	f4, r3, r4
	fcseq	r7, f4, f0
	li	r8, 0
	bne	r7, r8, beq_else.7539
	swf	f3, 0(r29)
	sw	r6, -1(r29)
	swf	f2, -2(r29)
	sw	r5, -3(r29)
	swf	f1, -4(r29)
	sw	r4, -5(r29)
	sw	r3, -6(r29)
	sw	r2, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_abc.2667
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lw	r3, -7(r29)
	sw	r2, -8(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_isinvert.2657
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r3, -5(r29)
	lw	r4, -6(r29)
	lwfx	f1, r4, r3
	fclt	r5, f1, f0
	move	r3, r5
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	xor.2594
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r3, -5(r29)
	lw	r4, -8(r29)
	lwfx	f1, r4, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	fneg_cond.2599
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -4(r29)
	fsub	f1, f1, f2
	lw	r2, -5(r29)
	lw	r3, -6(r29)
	lwfx	f2, r3, r2
	fdiv	f1, f1, f2
	lw	r2, -3(r29)
	lwfx	f2, r3, r2
	fmul	f2, f1, f2
	lwf	f3, -2(r29)
	fadd	f2, f2, f3
	fabs	f2, f2
	lw	r4, -8(r29)
	lwfx	f3, r4, r2
	fclt	r2, f2, f3
	li	r5, 0
	bne	r2, r5, beq_else.7540
	li	r2, 0
	jr	r31
beq_else.7540:
	lw	r2, -1(r29)
	lwfx	f2, r3, r2
	fmul	f2, f1, f2
	lwf	f3, 0(r29)
	fadd	f2, f2, f3
	fabs	f2, f2
	lwfx	f3, r4, r2
	fclt	r2, f2, f3
	li	r3, 0
	bne	r2, r3, beq_else.7541
	li	r2, 0
	jr	r31
beq_else.7541:
	la	r2, min_caml_solver_dist
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
beq_else.7539:
	li	r2, 0
	jr	r31
solver_rect.2754:
	li	r4, 0
	li	r5, 1
	li	r6, 2
	swf	f1, 0(r29)
	swf	f3, -1(r29)
	swf	f2, -2(r29)
	sw	r3, -3(r29)
	sw	r2, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	solver_rect_surface.2745
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7542
	li	r4, 1
	li	r5, 2
	li	r6, 0
	lwf	f1, -2(r29)
	lwf	f2, -1(r29)
	lwf	f3, 0(r29)
	lw	r2, -4(r29)
	lw	r3, -3(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	solver_rect_surface.2745
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7543
	li	r4, 2
	li	r5, 0
	li	r6, 1
	lwf	f1, -1(r29)
	lwf	f2, 0(r29)
	lwf	f3, -2(r29)
	lw	r2, -4(r29)
	lw	r3, -3(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	solver_rect_surface.2745
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7544
	li	r2, 0
	jr	r31
beq_else.7544:
	li	r2, 3
	jr	r31
beq_else.7543:
	li	r2, 2
	jr	r31
beq_else.7542:
	li	r2, 1
	jr	r31
solver_surface.2760:
	swf	f3, 0(r29)
	swf	f2, -1(r29)
	swf	f1, -2(r29)
	sw	r3, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_abc.2667
	addi	r29, r29, 5
	lw	r31, -4(r29)
	move	r3, r2
	lw	r2, -3(r29)
	sw	r3, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	veciprod.2626
	addi	r29, r29, 6
	lw	r31, -5(r29)
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7545
	li	r2, 0
	jr	r31
beq_else.7545:
	la	r2, min_caml_solver_dist
	lwf	f2, -2(r29)
	lwf	f3, -1(r29)
	lwf	f4, 0(r29)
	lw	r3, -4(r29)
	sw	r2, -5(r29)
	swf	f1, -6(r29)
	move	r2, r3
	fmove	f1, f2
	fmove	f2, f3
	fmove	f3, f4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	veciprod2.2629
	addi	r29, r29, 8
	lw	r31, -7(r29)
	fneg	f1, f1
	lwf	f2, -6(r29)
	fdiv	f1, f1, f2
	lw	r2, -5(r29)
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
quadratic.2766:
	fmul	f4, f1, f1
	swf	f1, 0(r29)
	swf	f3, -1(r29)
	sw	r2, -2(r29)
	swf	f2, -3(r29)
	swf	f4, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_a.2661
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	lwf	f2, -3(r29)
	fmul	f3, f2, f2
	lw	r2, -2(r29)
	swf	f1, -5(r29)
	swf	f3, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_b.2663
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	lwf	f2, -5(r29)
	fadd	f1, f2, f1
	lwf	f2, -1(r29)
	fmul	f3, f2, f2
	lw	r2, -2(r29)
	swf	f1, -7(r29)
	swf	f3, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_c.2665
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fmul	f1, f2, f1
	lwf	f2, -7(r29)
	fadd	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_isrot.2659
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7546
	lwf	f1, -9(r29)
	jr	r31
beq_else.7546:
	lwf	f1, -1(r29)
	lwf	f2, -3(r29)
	fmul	f3, f2, f1
	lw	r2, -2(r29)
	swf	f3, -10(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_param_r1.2685
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lwf	f2, -10(r29)
	fmul	f1, f2, f1
	lwf	f2, -9(r29)
	fadd	f1, f2, f1
	lwf	f2, 0(r29)
	lwf	f3, -1(r29)
	fmul	f3, f3, f2
	lw	r2, -2(r29)
	swf	f1, -11(r29)
	swf	f3, -12(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	o_param_r2.2687
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -12(r29)
	fmul	f1, f2, f1
	lwf	f2, -11(r29)
	fadd	f1, f2, f1
	lwf	f2, -3(r29)
	lwf	f3, 0(r29)
	fmul	f2, f3, f2
	lw	r2, -2(r29)
	swf	f1, -13(r29)
	swf	f2, -14(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	o_param_r3.2689
	addi	r29, r29, 16
	lw	r31, -15(r29)
	lwf	f2, -14(r29)
	fmul	f1, f2, f1
	lwf	f2, -13(r29)
	fadd	f1, f2, f1
	jr	r31
bilinear.2771:
	fmul	f7, f1, f4
	swf	f4, 0(r29)
	swf	f1, -1(r29)
	swf	f6, -2(r29)
	swf	f3, -3(r29)
	sw	r2, -4(r29)
	swf	f5, -5(r29)
	swf	f2, -6(r29)
	swf	f7, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_a.2661
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fmul	f1, f2, f1
	lwf	f2, -5(r29)
	lwf	f3, -6(r29)
	fmul	f4, f3, f2
	lw	r2, -4(r29)
	swf	f1, -8(r29)
	swf	f4, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_param_b.2663
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lwf	f2, -9(r29)
	fmul	f1, f2, f1
	lwf	f2, -8(r29)
	fadd	f1, f2, f1
	lwf	f2, -2(r29)
	lwf	f3, -3(r29)
	fmul	f4, f3, f2
	lw	r2, -4(r29)
	swf	f1, -10(r29)
	swf	f4, -11(r29)
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	o_param_c.2665
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -11(r29)
	fmul	f1, f2, f1
	lwf	f2, -10(r29)
	fadd	f1, f2, f1
	lw	r2, -4(r29)
	swf	f1, -12(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	o_isrot.2659
	addi	r29, r29, 14
	lw	r31, -13(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7547
	lwf	f1, -12(r29)
	jr	r31
beq_else.7547:
	lwf	f1, -5(r29)
	lwf	f2, -3(r29)
	fmul	f3, f2, f1
	lwf	f4, -2(r29)
	lwf	f5, -6(r29)
	fmul	f6, f5, f4
	fadd	f3, f3, f6
	lw	r2, -4(r29)
	swf	f3, -13(r29)
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	o_param_r1.2685
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -13(r29)
	fmul	f1, f2, f1
	lwf	f2, -2(r29)
	lwf	f3, -1(r29)
	fmul	f2, f3, f2
	lwf	f4, 0(r29)
	lwf	f5, -3(r29)
	fmul	f5, f5, f4
	fadd	f2, f2, f5
	lw	r2, -4(r29)
	swf	f1, -14(r29)
	swf	f2, -15(r29)
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	o_param_r2.2687
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -15(r29)
	fmul	f1, f2, f1
	lwf	f2, -14(r29)
	fadd	f1, f2, f1
	lwf	f2, -5(r29)
	lwf	f3, -1(r29)
	fmul	f2, f3, f2
	lwf	f3, 0(r29)
	lwf	f4, -6(r29)
	fmul	f3, f4, f3
	fadd	f2, f2, f3
	lw	r2, -4(r29)
	swf	f1, -16(r29)
	swf	f2, -17(r29)
	sw	r31, -18(r29)
	addi	r29, r29, -19
	jal	o_param_r3.2689
	addi	r29, r29, 19
	lw	r31, -18(r29)
	lwf	f2, -17(r29)
	fmul	f1, f2, f1
	lwf	f2, -16(r29)
	fadd	f1, f2, f1
	sw	r31, -18(r29)
	addi	r29, r29, -19
	jal	min_caml_fhalf
	addi	r29, r29, 19
	lw	r31, -18(r29)
	lwf	f2, -12(r29)
	fadd	f1, f2, f1
	jr	r31
solver_second.2779:
	lwf	f4, 0(r3)
	lwf	f5, 1(r3)
	lwf	f6, 2(r3)
	swf	f3, 0(r29)
	swf	f2, -1(r29)
	swf	f1, -2(r29)
	sw	r2, -3(r29)
	sw	r3, -4(r29)
	fmove	f3, f6
	fmove	f2, f5
	fmove	f1, f4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	quadratic.2766
	addi	r29, r29, 6
	lw	r31, -5(r29)
	fcseq	r2, f1, f0
	li	r3, 0
	bne	r2, r3, beq_else.7548
	lw	r2, -4(r29)
	lwf	f2, 0(r2)
	lwf	f3, 1(r2)
	lwf	f4, 2(r2)
	lwf	f5, -2(r29)
	lwf	f6, -1(r29)
	lwf	f7, 0(r29)
	lw	r2, -3(r29)
	swf	f1, -5(r29)
	fmove	f1, f2
	fmove	f2, f3
	fmove	f3, f4
	fmove	f4, f5
	fmove	f5, f6
	fmove	f6, f7
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	bilinear.2771
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -2(r29)
	lwf	f3, -1(r29)
	lwf	f4, 0(r29)
	lw	r2, -3(r29)
	swf	f1, -6(r29)
	fmove	f1, f2
	fmove	f2, f3
	fmove	f3, f4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	quadratic.2766
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -3(r29)
	swf	f1, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_form.2653
	addi	r29, r29, 9
	lw	r31, -8(r29)
	li	r3, 3
	bne	r2, r3, beq_else.7549
	fli	f1, 1.
	lwf	f2, -7(r29)
	fsub	f1, f2, f1
	j	beq_cont.7550
beq_else.7549:
	lwf	f1, -7(r29)
beq_cont.7550:
	lwf	f2, -6(r29)
	fmul	f3, f2, f2
	lwf	f4, -5(r29)
	fmul	f1, f4, f1
	fsub	f1, f3, f1
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7551
	li	r2, 0
	jr	r31
beq_else.7551:
	fsqrt	f1, f1
	lw	r2, -3(r29)
	swf	f1, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_isinvert.2657
	addi	r29, r29, 10
	lw	r31, -9(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7552
	lwf	f1, -8(r29)
	fneg	f1, f1
	j	beq_cont.7553
beq_else.7552:
	lwf	f1, -8(r29)
beq_cont.7553:
	la	r2, min_caml_solver_dist
	lwf	f2, -6(r29)
	fsub	f1, f1, f2
	lwf	f2, -5(r29)
	fdiv	f1, f1, f2
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
beq_else.7548:
	li	r2, 0
	jr	r31
solver.2785:
	la	r5, min_caml_objects
	lwx	r2, r5, r2
	lwf	f1, 0(r4)
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r4, -2(r29)
	swf	f1, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_x.2669
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	lwf	f2, 1(r2)
	lw	r3, -1(r29)
	swf	f1, -4(r29)
	swf	f2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_y.2671
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -5(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	lwf	f2, 2(r2)
	lw	r2, -1(r29)
	swf	f1, -6(r29)
	swf	f2, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_z.2673
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fsub	f1, f2, f1
	lw	r2, -1(r29)
	swf	f1, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_form.2653
	addi	r29, r29, 10
	lw	r31, -9(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7554
	lwf	f1, -4(r29)
	lwf	f2, -6(r29)
	lwf	f3, -8(r29)
	lw	r2, -1(r29)
	lw	r3, 0(r29)
	j	solver_rect.2754
beq_else.7554:
	li	r3, 2
	bne	r2, r3, beq_else.7555
	lwf	f1, -4(r29)
	lwf	f2, -6(r29)
	lwf	f3, -8(r29)
	lw	r2, -1(r29)
	lw	r3, 0(r29)
	j	solver_surface.2760
beq_else.7555:
	lwf	f1, -4(r29)
	lwf	f2, -6(r29)
	lwf	f3, -8(r29)
	lw	r2, -1(r29)
	lw	r3, 0(r29)
	j	solver_second.2779
solver_rect_fast.2789:
	lwf	f4, 0(r4)
	fsub	f4, f4, f1
	lwf	f5, 1(r4)
	fmul	f4, f4, f5
	lwf	f5, 1(r3)
	fmul	f5, f4, f5
	fadd	f5, f5, f2
	fabs	f5, f5
	swf	f1, 0(r29)
	swf	f2, -1(r29)
	sw	r4, -2(r29)
	sw	r2, -3(r29)
	swf	f3, -4(r29)
	swf	f4, -5(r29)
	sw	r3, -6(r29)
	swf	f5, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_b.2663
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7556
	li	r2, 0
	j	beq_cont.7557
beq_else.7556:
	lw	r2, -6(r29)
	lwf	f1, 2(r2)
	lwf	f2, -5(r29)
	fmul	f1, f2, f1
	lwf	f3, -4(r29)
	fadd	f1, f1, f3
	fabs	f1, f1
	lw	r3, -3(r29)
	swf	f1, -8(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_c.2665
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7558
	li	r2, 0
	j	beq_cont.7559
beq_else.7558:
	lw	r2, -2(r29)
	lwf	f1, 1(r2)
	fcseq	r3, f1, f0
	li	r4, 0
	bne	r3, r4, beq_else.7560
	li	r2, 1
	j	beq_cont.7561
beq_else.7560:
	li	r2, 0
beq_cont.7561:
beq_cont.7559:
beq_cont.7557:
	li	r3, 0
	bne	r2, r3, beq_else.7562
	lw	r2, -2(r29)
	lwf	f1, 2(r2)
	lwf	f2, -1(r29)
	fsub	f1, f1, f2
	lwf	f3, 3(r2)
	fmul	f1, f1, f3
	lw	r3, -6(r29)
	lwf	f3, 0(r3)
	fmul	f3, f1, f3
	lwf	f4, 0(r29)
	fadd	f3, f3, f4
	fabs	f3, f3
	lw	r4, -3(r29)
	swf	f1, -9(r29)
	swf	f3, -10(r29)
	move	r2, r4
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_param_a.2661
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lwf	f2, -10(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7563
	li	r2, 0
	j	beq_cont.7564
beq_else.7563:
	lw	r2, -6(r29)
	lwf	f1, 2(r2)
	lwf	f2, -9(r29)
	fmul	f1, f2, f1
	lwf	f3, -4(r29)
	fadd	f1, f1, f3
	fabs	f1, f1
	lw	r3, -3(r29)
	swf	f1, -11(r29)
	move	r2, r3
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	o_param_c.2665
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -11(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7565
	li	r2, 0
	j	beq_cont.7566
beq_else.7565:
	lw	r2, -2(r29)
	lwf	f1, 3(r2)
	fcseq	r3, f1, f0
	li	r4, 0
	bne	r3, r4, beq_else.7567
	li	r2, 1
	j	beq_cont.7568
beq_else.7567:
	li	r2, 0
beq_cont.7568:
beq_cont.7566:
beq_cont.7564:
	li	r3, 0
	bne	r2, r3, beq_else.7569
	lw	r2, -2(r29)
	lwf	f1, 4(r2)
	lwf	f2, -4(r29)
	fsub	f1, f1, f2
	lwf	f2, 5(r2)
	fmul	f1, f1, f2
	lw	r3, -6(r29)
	lwf	f2, 0(r3)
	fmul	f2, f1, f2
	lwf	f3, 0(r29)
	fadd	f2, f2, f3
	fabs	f2, f2
	lw	r4, -3(r29)
	swf	f1, -12(r29)
	swf	f2, -13(r29)
	move	r2, r4
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	o_param_a.2661
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -13(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7570
	li	r2, 0
	j	beq_cont.7571
beq_else.7570:
	lw	r2, -6(r29)
	lwf	f1, 1(r2)
	lwf	f2, -12(r29)
	fmul	f1, f2, f1
	lwf	f3, -1(r29)
	fadd	f1, f1, f3
	fabs	f1, f1
	lw	r2, -3(r29)
	swf	f1, -14(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	o_param_b.2663
	addi	r29, r29, 16
	lw	r31, -15(r29)
	lwf	f2, -14(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7572
	li	r2, 0
	j	beq_cont.7573
beq_else.7572:
	lw	r2, -2(r29)
	lwf	f1, 5(r2)
	fcseq	r2, f1, f0
	li	r3, 0
	bne	r2, r3, beq_else.7574
	li	r2, 1
	j	beq_cont.7575
beq_else.7574:
	li	r2, 0
beq_cont.7575:
beq_cont.7573:
beq_cont.7571:
	li	r3, 0
	bne	r2, r3, beq_else.7576
	li	r2, 0
	jr	r31
beq_else.7576:
	la	r2, min_caml_solver_dist
	lwf	f1, -12(r29)
	swf	f1, 0(r2)
	li	r2, 3
	jr	r31
beq_else.7569:
	la	r2, min_caml_solver_dist
	lwf	f1, -9(r29)
	swf	f1, 0(r2)
	li	r2, 2
	jr	r31
beq_else.7562:
	la	r2, min_caml_solver_dist
	lwf	f1, -5(r29)
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
solver_surface_fast.2796:
	lwf	f4, 0(r3)
	fclt	r2, f4, f0
	li	r4, 0
	bne	r2, r4, beq_else.7577
	li	r2, 0
	jr	r31
beq_else.7577:
	la	r2, min_caml_solver_dist
	lwf	f4, 1(r3)
	fmul	f1, f4, f1
	lwf	f4, 2(r3)
	fmul	f2, f4, f2
	fadd	f1, f1, f2
	lwf	f2, 3(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
solver_second_fast.2802:
	lwf	f4, 0(r3)
	fcseq	r4, f4, f0
	li	r5, 0
	bne	r4, r5, beq_else.7578
	lwf	f5, 1(r3)
	fmul	f5, f5, f1
	lwf	f6, 2(r3)
	fmul	f6, f6, f2
	fadd	f5, f5, f6
	lwf	f6, 3(r3)
	fmul	f6, f6, f3
	fadd	f5, f5, f6
	sw	r3, 0(r29)
	swf	f4, -1(r29)
	swf	f5, -2(r29)
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	quadratic.2766
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -3(r29)
	swf	f1, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_form.2653
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 3
	bne	r2, r3, beq_else.7579
	fli	f1, 1.
	lwf	f2, -4(r29)
	fsub	f1, f2, f1
	j	beq_cont.7580
beq_else.7579:
	lwf	f1, -4(r29)
beq_cont.7580:
	lwf	f2, -2(r29)
	fmul	f3, f2, f2
	lwf	f4, -1(r29)
	fmul	f1, f4, f1
	fsub	f1, f3, f1
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7581
	li	r2, 0
	jr	r31
beq_else.7581:
	lw	r2, -3(r29)
	swf	f1, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_isinvert.2657
	addi	r29, r29, 7
	lw	r31, -6(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7582
	la	r2, min_caml_solver_dist
	lwf	f1, -5(r29)
	fsqrt	f1, f1
	lwf	f2, -2(r29)
	fsub	f1, f2, f1
	lw	r3, 0(r29)
	lwf	f2, 4(r3)
	fmul	f1, f1, f2
	swf	f1, 0(r2)
	j	beq_cont.7583
beq_else.7582:
	la	r2, min_caml_solver_dist
	lwf	f1, -5(r29)
	fsqrt	f1, f1
	lwf	f2, -2(r29)
	fadd	f1, f2, f1
	lw	r3, 0(r29)
	lwf	f2, 4(r3)
	fmul	f1, f1, f2
	swf	f1, 0(r2)
beq_cont.7583:
	li	r2, 1
	jr	r31
beq_else.7578:
	li	r2, 0
	jr	r31
solver_fast.2808:
	la	r5, min_caml_objects
	lwx	r5, r5, r2
	lwf	f1, 0(r4)
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r5, -2(r29)
	sw	r4, -3(r29)
	swf	f1, -4(r29)
	move	r2, r5
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_x.2669
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -4(r29)
	fsub	f1, f2, f1
	lw	r2, -3(r29)
	lwf	f2, 1(r2)
	lw	r3, -2(r29)
	swf	f1, -5(r29)
	swf	f2, -6(r29)
	move	r2, r3
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_y.2671
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fsub	f1, f2, f1
	lw	r2, -3(r29)
	lwf	f2, 2(r2)
	lw	r2, -2(r29)
	swf	f1, -7(r29)
	swf	f2, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_z.2673
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fsub	f1, f2, f1
	lw	r2, -1(r29)
	swf	f1, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	d_const.2714
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r3, 0(r29)
	lwx	r2, r2, r3
	lw	r3, -2(r29)
	sw	r2, -10(r29)
	move	r2, r3
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_form.2653
	addi	r29, r29, 12
	lw	r31, -11(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7584
	lw	r2, -1(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	d_vec.2712
	addi	r29, r29, 12
	lw	r31, -11(r29)
	move	r3, r2
	lwf	f1, -5(r29)
	lwf	f2, -7(r29)
	lwf	f3, -9(r29)
	lw	r2, -2(r29)
	lw	r4, -10(r29)
	j	solver_rect_fast.2789
beq_else.7584:
	li	r3, 2
	bne	r2, r3, beq_else.7585
	lwf	f1, -5(r29)
	lwf	f2, -7(r29)
	lwf	f3, -9(r29)
	lw	r2, -2(r29)
	lw	r3, -10(r29)
	j	solver_surface_fast.2796
beq_else.7585:
	lwf	f1, -5(r29)
	lwf	f2, -7(r29)
	lwf	f3, -9(r29)
	lw	r2, -2(r29)
	lw	r3, -10(r29)
	j	solver_second_fast.2802
solver_surface_fast2.2812:
	lwf	f1, 0(r3)
	fclt	r2, f1, f0
	li	r5, 0
	bne	r2, r5, beq_else.7586
	li	r2, 0
	jr	r31
beq_else.7586:
	la	r2, min_caml_solver_dist
	lwf	f1, 0(r3)
	lwf	f2, 3(r4)
	fmul	f1, f1, f2
	swf	f1, 0(r2)
	li	r2, 1
	jr	r31
solver_second_fast2.2819:
	lwf	f4, 0(r3)
	fcseq	r5, f4, f0
	li	r6, 0
	bne	r5, r6, beq_else.7587
	lwf	f5, 1(r3)
	fmul	f1, f5, f1
	lwf	f5, 2(r3)
	fmul	f2, f5, f2
	fadd	f1, f1, f2
	lwf	f2, 3(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lwf	f2, 3(r4)
	fmul	f3, f1, f1
	fmul	f2, f4, f2
	fsub	f2, f3, f2
	fclt	r4, f0, f2
	li	r5, 0
	bne	r4, r5, beq_else.7588
	li	r2, 0
	jr	r31
beq_else.7588:
	sw	r3, 0(r29)
	swf	f1, -1(r29)
	swf	f2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_isinvert.2657
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7589
	la	r2, min_caml_solver_dist
	lwf	f1, -2(r29)
	fsqrt	f1, f1
	lwf	f2, -1(r29)
	fsub	f1, f2, f1
	lw	r3, 0(r29)
	lwf	f2, 4(r3)
	fmul	f1, f1, f2
	swf	f1, 0(r2)
	j	beq_cont.7590
beq_else.7589:
	la	r2, min_caml_solver_dist
	lwf	f1, -2(r29)
	fsqrt	f1, f1
	lwf	f2, -1(r29)
	fadd	f1, f2, f1
	lw	r3, 0(r29)
	lwf	f2, 4(r3)
	fmul	f1, f1, f2
	swf	f1, 0(r2)
beq_cont.7590:
	li	r2, 1
	jr	r31
beq_else.7587:
	li	r2, 0
	jr	r31
solver_fast2.2826:
	la	r4, min_caml_objects
	lwx	r4, r4, r2
	sw	r4, 0(r29)
	sw	r2, -1(r29)
	sw	r3, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_param_ctbl.2691
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lwf	f1, 0(r2)
	lwf	f2, 1(r2)
	lwf	f3, 2(r2)
	lw	r3, -2(r29)
	sw	r2, -3(r29)
	swf	f3, -4(r29)
	swf	f2, -5(r29)
	swf	f1, -6(r29)
	move	r2, r3
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	d_const.2714
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r3, -1(r29)
	lwx	r2, r2, r3
	lw	r3, 0(r29)
	sw	r2, -7(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_form.2653
	addi	r29, r29, 9
	lw	r31, -8(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7591
	lw	r2, -2(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	d_vec.2712
	addi	r29, r29, 9
	lw	r31, -8(r29)
	move	r3, r2
	lwf	f1, -6(r29)
	lwf	f2, -5(r29)
	lwf	f3, -4(r29)
	lw	r2, 0(r29)
	lw	r4, -7(r29)
	j	solver_rect_fast.2789
beq_else.7591:
	li	r3, 2
	bne	r2, r3, beq_else.7592
	lwf	f1, -6(r29)
	lwf	f2, -5(r29)
	lwf	f3, -4(r29)
	lw	r2, 0(r29)
	lw	r3, -7(r29)
	lw	r4, -3(r29)
	j	solver_surface_fast2.2812
beq_else.7592:
	lwf	f1, -6(r29)
	lwf	f2, -5(r29)
	lwf	f3, -4(r29)
	lw	r2, 0(r29)
	lw	r3, -7(r29)
	lw	r4, -3(r29)
	j	solver_second_fast2.2819
setup_rect_table.2829:
	li	r4, 6
	fli	f1, 0.
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_create_float_array
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	lwf	f1, 0(r3)
	fcseq	r4, f1, f0
	li	r5, 0
	bne	r4, r5, beq_else.7593
	lw	r4, 0(r29)
	sw	r2, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_isinvert.2657
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -1(r29)
	lwf	f1, 0(r3)
	fclt	r4, f1, f0
	move	r3, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	xor.2594
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, 0(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_a.2661
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	fneg_cond.2599
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -2(r29)
	swf	f1, 0(r2)
	fli	f1, 1.
	lw	r3, -1(r29)
	lwf	f2, 0(r3)
	fdiv	f1, f1, f2
	swf	f1, 1(r2)
	j	beq_cont.7594
beq_else.7593:
	fli	f1, 0.
	swf	f1, 1(r2)
beq_cont.7594:
	lwf	f1, 1(r3)
	fcseq	r4, f1, f0
	li	r5, 0
	bne	r4, r5, beq_else.7595
	lw	r4, 0(r29)
	sw	r2, -2(r29)
	move	r2, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_isinvert.2657
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -1(r29)
	lwf	f1, 1(r3)
	fclt	r4, f1, f0
	move	r3, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	xor.2594
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, 0(r29)
	sw	r2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_b.2663
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	fneg_cond.2599
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -2(r29)
	swf	f1, 2(r2)
	fli	f1, 1.
	lw	r3, -1(r29)
	lwf	f2, 1(r3)
	fdiv	f1, f1, f2
	swf	f1, 3(r2)
	j	beq_cont.7596
beq_else.7595:
	fli	f1, 0.
	swf	f1, 3(r2)
beq_cont.7596:
	lwf	f1, 2(r3)
	fcseq	r4, f1, f0
	li	r5, 0
	bne	r4, r5, beq_else.7597
	lw	r4, 0(r29)
	sw	r2, -2(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_isinvert.2657
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, -1(r29)
	lwf	f1, 2(r3)
	fclt	r4, f1, f0
	move	r3, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	xor.2594
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, 0(r29)
	sw	r2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_c.2665
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	fneg_cond.2599
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -2(r29)
	swf	f1, 4(r2)
	fli	f1, 1.
	lw	r3, -1(r29)
	lwf	f2, 2(r3)
	fdiv	f1, f1, f2
	swf	f1, 5(r2)
	j	beq_cont.7598
beq_else.7597:
	fli	f1, 0.
	swf	f1, 5(r2)
beq_cont.7598:
	jr	r31
setup_surface_table.2832:
	li	r4, 4
	fli	f1, 0.
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_create_float_array
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	lwf	f1, 0(r3)
	lw	r4, 0(r29)
	sw	r2, -2(r29)
	swf	f1, -3(r29)
	move	r2, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_a.2661
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fmul	f1, f2, f1
	lw	r2, -1(r29)
	lwf	f2, 1(r2)
	lw	r3, 0(r29)
	swf	f1, -4(r29)
	swf	f2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_b.2663
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -5(r29)
	fmul	f1, f2, f1
	lwf	f2, -4(r29)
	fadd	f1, f2, f1
	lw	r2, -1(r29)
	lwf	f2, 2(r2)
	lw	r2, 0(r29)
	swf	f1, -6(r29)
	swf	f2, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_c.2665
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fmul	f1, f2, f1
	lwf	f2, -6(r29)
	fadd	f1, f2, f1
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7599
	fli	f1, 0.
	lw	r2, -2(r29)
	swf	f1, 0(r2)
	j	beq_cont.7600
beq_else.7599:
	fli	f2, -1.
	fdiv	f2, f2, f1
	lw	r2, -2(r29)
	swf	f2, 0(r2)
	lw	r3, 0(r29)
	swf	f1, -8(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_a.2661
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fdiv	f1, f1, f2
	fneg	f1, f1
	lw	r2, -2(r29)
	swf	f1, 1(r2)
	lw	r3, 0(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_b.2663
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fdiv	f1, f1, f2
	fneg	f1, f1
	lw	r2, -2(r29)
	swf	f1, 2(r2)
	lw	r3, 0(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_c.2665
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fdiv	f1, f1, f2
	fneg	f1, f1
	lw	r2, -2(r29)
	swf	f1, 3(r2)
beq_cont.7600:
	jr	r31
setup_second_table.2835:
	li	r4, 5
	fli	f1, 0.
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_create_float_array
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	lwf	f1, 0(r3)
	lwf	f2, 1(r3)
	lwf	f3, 2(r3)
	lw	r4, 0(r29)
	sw	r2, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	quadratic.2766
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -1(r29)
	lwf	f2, 0(r2)
	lw	r3, 0(r29)
	swf	f1, -3(r29)
	swf	f2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_a.2661
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	fneg	f1, f1
	lw	r2, -1(r29)
	lwf	f2, 1(r2)
	lw	r3, 0(r29)
	swf	f1, -5(r29)
	swf	f2, -6(r29)
	move	r2, r3
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_b.2663
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	fneg	f1, f1
	lw	r2, -1(r29)
	lwf	f2, 2(r2)
	lw	r3, 0(r29)
	swf	f1, -7(r29)
	swf	f2, -8(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_c.2665
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -8(r29)
	fmul	f1, f2, f1
	fneg	f1, f1
	lw	r2, -2(r29)
	lwf	f2, -3(r29)
	swf	f2, 0(r2)
	lw	r3, 0(r29)
	swf	f1, -9(r29)
	move	r2, r3
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_isrot.2659
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7601
	lw	r2, -2(r29)
	lwf	f1, -5(r29)
	swf	f1, 1(r2)
	lwf	f1, -7(r29)
	swf	f1, 2(r2)
	lwf	f1, -9(r29)
	swf	f1, 3(r2)
	j	beq_cont.7602
beq_else.7601:
	lw	r2, -1(r29)
	lwf	f1, 2(r2)
	lw	r3, 0(r29)
	swf	f1, -10(r29)
	move	r2, r3
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_param_r2.2687
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lwf	f2, -10(r29)
	fmul	f1, f2, f1
	lw	r2, -1(r29)
	lwf	f2, 1(r2)
	lw	r3, 0(r29)
	swf	f1, -11(r29)
	swf	f2, -12(r29)
	move	r2, r3
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	o_param_r3.2689
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -12(r29)
	fmul	f1, f2, f1
	lwf	f2, -11(r29)
	fadd	f1, f2, f1
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	min_caml_fhalf
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -5(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, 1(r2)
	lw	r3, -1(r29)
	lwf	f1, 2(r3)
	lw	r4, 0(r29)
	swf	f1, -13(r29)
	move	r2, r4
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	o_param_r1.2685
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -13(r29)
	fmul	f1, f2, f1
	lw	r2, -1(r29)
	lwf	f2, 0(r2)
	lw	r3, 0(r29)
	swf	f1, -14(r29)
	swf	f2, -15(r29)
	move	r2, r3
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	o_param_r3.2689
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -15(r29)
	fmul	f1, f2, f1
	lwf	f2, -14(r29)
	fadd	f1, f2, f1
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	min_caml_fhalf
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -7(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, 2(r2)
	lw	r3, -1(r29)
	lwf	f1, 1(r3)
	lw	r4, 0(r29)
	swf	f1, -16(r29)
	move	r2, r4
	sw	r31, -17(r29)
	addi	r29, r29, -18
	jal	o_param_r1.2685
	addi	r29, r29, 18
	lw	r31, -17(r29)
	lwf	f2, -16(r29)
	fmul	f1, f2, f1
	lw	r2, -1(r29)
	lwf	f2, 0(r2)
	lw	r2, 0(r29)
	swf	f1, -17(r29)
	swf	f2, -18(r29)
	sw	r31, -19(r29)
	addi	r29, r29, -20
	jal	o_param_r2.2687
	addi	r29, r29, 20
	lw	r31, -19(r29)
	lwf	f2, -18(r29)
	fmul	f1, f2, f1
	lwf	f2, -17(r29)
	fadd	f1, f2, f1
	sw	r31, -19(r29)
	addi	r29, r29, -20
	jal	min_caml_fhalf
	addi	r29, r29, 20
	lw	r31, -19(r29)
	lwf	f2, -9(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, 3(r2)
beq_cont.7602:
	lwf	f1, -3(r29)
	fcseq	r3, f1, f0
	li	r4, 0
	bne	r3, r4, beq_else.7603
	fli	f2, 1.
	fdiv	f1, f2, f1
	swf	f1, 4(r2)
	j	beq_cont.7604
beq_else.7603:
beq_cont.7604:
	jr	r31
iter_setup_dirvec_constants.2838:
	bltz	r3, bge_else.7605
	la	r4, min_caml_objects
	lwx	r4, r4, r3
	sw	r3, 0(r29)
	sw	r4, -1(r29)
	sw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	d_const.2714
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -2(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	d_vec.2712
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -1(r29)
	sw	r2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_form.2653
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7606
	lw	r2, -4(r29)
	lw	r3, -1(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	setup_rect_table.2829
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, 0(r29)
	lw	r4, -3(r29)
	swx	r2, r4, r3
	j	beq_cont.7607
beq_else.7606:
	li	r3, 2
	bne	r2, r3, beq_else.7608
	lw	r2, -4(r29)
	lw	r3, -1(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	setup_surface_table.2832
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, 0(r29)
	lw	r4, -3(r29)
	swx	r2, r4, r3
	j	beq_cont.7609
beq_else.7608:
	lw	r2, -4(r29)
	lw	r3, -1(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	setup_second_table.2835
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, 0(r29)
	lw	r4, -3(r29)
	swx	r2, r4, r3
beq_cont.7609:
beq_cont.7607:
	addi	r3, r3, -1
	lw	r2, -2(r29)
	j	iter_setup_dirvec_constants.2838
bge_else.7605:
	jr	r31
setup_dirvec_constants.2841:
	la	r3, min_caml_n_objects
	lw	r3, 0(r3)
	addi	r3, r3, -1
	j	iter_setup_dirvec_constants.2838
setup_startp_constants.2843:
	bltz	r3, bge_else.7611
	la	r4, min_caml_objects
	lwx	r4, r4, r3
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r4, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_param_ctbl.2691
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -2(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_form.2653
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -1(r29)
	lwf	f1, 0(r3)
	lw	r4, -2(r29)
	sw	r2, -4(r29)
	swf	f1, -5(r29)
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_x.2669
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -5(r29)
	fsub	f1, f2, f1
	lw	r2, -3(r29)
	swf	f1, 0(r2)
	lw	r3, -1(r29)
	lwf	f1, 1(r3)
	lw	r4, -2(r29)
	swf	f1, -6(r29)
	move	r2, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_y.2671
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fsub	f1, f2, f1
	lw	r2, -3(r29)
	swf	f1, 1(r2)
	lw	r3, -1(r29)
	lwf	f1, 2(r3)
	lw	r4, -2(r29)
	swf	f1, -7(r29)
	move	r2, r4
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_z.2673
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fsub	f1, f2, f1
	lw	r2, -3(r29)
	swf	f1, 2(r2)
	li	r3, 2
	lw	r4, -4(r29)
	bne	r4, r3, beq_else.7612
	lw	r3, -2(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_abc.2667
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lw	r3, -3(r29)
	lwf	f1, 0(r3)
	lwf	f2, 1(r3)
	lwf	f3, 2(r3)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	veciprod2.2629
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lw	r2, -3(r29)
	swf	f1, 3(r2)
	j	beq_cont.7613
beq_else.7612:
	li	r3, 2
	bgt	r4, r3, ble_else.7614
	j	ble_cont.7615
ble_else.7614:
	lwf	f1, 0(r2)
	lwf	f2, 1(r2)
	lwf	f3, 2(r2)
	lw	r3, -2(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	quadratic.2766
	addi	r29, r29, 9
	lw	r31, -8(r29)
	li	r2, 3
	lw	r3, -4(r29)
	bne	r3, r2, beq_else.7616
	fli	f2, 1.
	fsub	f1, f1, f2
	j	beq_cont.7617
beq_else.7616:
beq_cont.7617:
	lw	r2, -3(r29)
	swf	f1, 3(r2)
ble_cont.7615:
beq_cont.7613:
	lw	r2, 0(r29)
	addi	r3, r2, -1
	lw	r2, -1(r29)
	j	setup_startp_constants.2843
bge_else.7611:
	jr	r31
setup_startp.2846:
	la	r3, min_caml_startp_fast
	sw	r2, 0(r29)
	move	r27, r3
	move	r3, r2
	move	r2, r27
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	veccpy.2615
	addi	r29, r29, 2
	lw	r31, -1(r29)
	la	r2, min_caml_n_objects
	lw	r2, 0(r2)
	addi	r3, r2, -1
	lw	r2, 0(r29)
	j	setup_startp_constants.2843
is_rect_outside.2848:
	fabs	f1, f1
	swf	f3, 0(r29)
	sw	r2, -1(r29)
	swf	f2, -2(r29)
	swf	f1, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_a.2661
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7619
	li	r2, 0
	j	beq_cont.7620
beq_else.7619:
	lwf	f1, -2(r29)
	fabs	f1, f1
	lw	r2, -1(r29)
	swf	f1, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_b.2663
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -4(r29)
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7621
	li	r2, 0
	j	beq_cont.7622
beq_else.7621:
	lwf	f1, 0(r29)
	fabs	f1, f1
	lw	r2, -1(r29)
	swf	f1, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_c.2665
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -5(r29)
	fclt	r2, f2, f1
beq_cont.7622:
beq_cont.7620:
	li	r3, 0
	bne	r2, r3, beq_else.7623
	lw	r2, -1(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_isinvert.2657
	addi	r29, r29, 7
	lw	r31, -6(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7624
	li	r2, 1
	jr	r31
beq_else.7624:
	li	r2, 0
	jr	r31
beq_else.7623:
	lw	r2, -1(r29)
	j	o_isinvert.2657
is_plane_outside.2853:
	sw	r2, 0(r29)
	swf	f3, -1(r29)
	swf	f2, -2(r29)
	swf	f1, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_abc.2667
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f1, -3(r29)
	lwf	f2, -2(r29)
	lwf	f3, -1(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	veciprod2.2629
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, 0(r29)
	swf	f1, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_isinvert.2657
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -4(r29)
	fclt	r3, f1, f0
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	xor.2594
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7625
	li	r2, 1
	jr	r31
beq_else.7625:
	li	r2, 0
	jr	r31
is_second_outside.2858:
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	quadratic.2766
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r2, 0(r29)
	swf	f1, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_form.2653
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 3
	bne	r2, r3, beq_else.7626
	fli	f1, 1.
	lwf	f2, -1(r29)
	fsub	f1, f2, f1
	j	beq_cont.7627
beq_else.7626:
	lwf	f1, -1(r29)
beq_cont.7627:
	lw	r2, 0(r29)
	swf	f1, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_isinvert.2657
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lwf	f1, -2(r29)
	fclt	r3, f1, f0
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	xor.2594
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7628
	li	r2, 1
	jr	r31
beq_else.7628:
	li	r2, 0
	jr	r31
is_outside.2863:
	swf	f3, 0(r29)
	swf	f2, -1(r29)
	sw	r2, -2(r29)
	swf	f1, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_x.2669
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_param_y.2671
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -1(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_z.2673
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, 0(r29)
	fsub	f1, f2, f1
	lw	r2, -2(r29)
	swf	f1, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_form.2653
	addi	r29, r29, 8
	lw	r31, -7(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7629
	lwf	f1, -4(r29)
	lwf	f2, -5(r29)
	lwf	f3, -6(r29)
	lw	r2, -2(r29)
	j	is_rect_outside.2848
beq_else.7629:
	li	r3, 2
	bne	r2, r3, beq_else.7630
	lwf	f1, -4(r29)
	lwf	f2, -5(r29)
	lwf	f3, -6(r29)
	lw	r2, -2(r29)
	j	is_plane_outside.2853
beq_else.7630:
	lwf	f1, -4(r29)
	lwf	f2, -5(r29)
	lwf	f3, -6(r29)
	lw	r2, -2(r29)
	j	is_second_outside.2858
check_all_inside.2868:
	lwx	r4, r3, r2
	li	r5, -1
	bne	r4, r5, beq_else.7631
	li	r2, 1
	jr	r31
beq_else.7631:
	la	r5, min_caml_objects
	lwx	r4, r5, r4
	swf	f3, 0(r29)
	swf	f2, -1(r29)
	swf	f1, -2(r29)
	sw	r3, -3(r29)
	sw	r2, -4(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	is_outside.2863
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7632
	lw	r2, -4(r29)
	addi	r2, r2, 1
	lwf	f1, -2(r29)
	lwf	f2, -1(r29)
	lwf	f3, 0(r29)
	lw	r3, -3(r29)
	j	check_all_inside.2868
beq_else.7632:
	li	r2, 0
	jr	r31
shadow_check_and_group.2874:
	lwx	r4, r3, r2
	li	r5, -1
	bne	r4, r5, beq_else.7633
	li	r2, 0
	jr	r31
beq_else.7633:
	lwx	r4, r3, r2
	la	r5, min_caml_light_dirvec
	la	r6, min_caml_intersection_point
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r4, -2(r29)
	move	r3, r5
	move	r2, r4
	move	r4, r6
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solver_fast.2808
	addi	r29, r29, 4
	lw	r31, -3(r29)
	la	r3, min_caml_solver_dist
	lwf	f1, 0(r3)
	li	r3, 0
	bne	r2, r3, beq_else.7634
	li	r2, 0
	j	beq_cont.7635
beq_else.7634:
	fli	f2, -0.2
	fclt	r2, f1, f2
beq_cont.7635:
	li	r3, 0
	bne	r2, r3, beq_else.7636
	la	r2, min_caml_objects
	lw	r3, -2(r29)
	lwx	r2, r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_isinvert.2657
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7637
	li	r2, 0
	jr	r31
beq_else.7637:
	lw	r2, -1(r29)
	addi	r2, r2, 1
	lw	r3, 0(r29)
	j	shadow_check_and_group.2874
beq_else.7636:
	fli	f2, 0.01
	fadd	f1, f1, f2
	la	r2, min_caml_light
	lwf	f2, 0(r2)
	fmul	f2, f2, f1
	la	r2, min_caml_intersection_point
	lwf	f3, 0(r2)
	fadd	f2, f2, f3
	la	r2, min_caml_light
	lwf	f3, 1(r2)
	fmul	f3, f3, f1
	la	r2, min_caml_intersection_point
	lwf	f4, 1(r2)
	fadd	f3, f3, f4
	la	r2, min_caml_light
	lwf	f4, 2(r2)
	fmul	f1, f4, f1
	la	r2, min_caml_intersection_point
	lwf	f4, 2(r2)
	fadd	f1, f1, f4
	li	r2, 0
	lw	r3, 0(r29)
	fmove	f31, f3
	fmove	f3, f1
	fmove	f1, f2
	fmove	f2, f31
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	check_all_inside.2868
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7638
	lw	r2, -1(r29)
	addi	r2, r2, 1
	lw	r3, 0(r29)
	j	shadow_check_and_group.2874
beq_else.7638:
	li	r2, 1
	jr	r31
shadow_check_one_or_group.2877:
	lwx	r4, r3, r2
	li	r5, -1
	bne	r4, r5, beq_else.7639
	li	r2, 0
	jr	r31
beq_else.7639:
	la	r5, min_caml_and_net
	lwx	r4, r5, r4
	li	r5, 0
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	move	r3, r4
	move	r2, r5
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	shadow_check_and_group.2874
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7640
	lw	r2, -1(r29)
	addi	r2, r2, 1
	lw	r3, 0(r29)
	j	shadow_check_one_or_group.2877
beq_else.7640:
	li	r2, 1
	jr	r31
shadow_check_one_or_matrix.2880:
	lwx	r4, r3, r2
	lw	r5, 0(r4)
	li	r6, -1
	bne	r5, r6, beq_else.7641
	li	r2, 0
	jr	r31
beq_else.7641:
	li	r6, 99
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	bne	r5, r6, beq_else.7642
	li	r2, 1
	j	beq_cont.7643
beq_else.7642:
	la	r6, min_caml_light_dirvec
	la	r7, min_caml_intersection_point
	move	r4, r7
	move	r3, r6
	move	r2, r5
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solver_fast.2808
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7644
	li	r2, 0
	j	beq_cont.7645
beq_else.7644:
	la	r2, min_caml_solver_dist
	lwf	f1, 0(r2)
	fli	f2, -0.1
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7646
	li	r2, 0
	j	beq_cont.7647
beq_else.7646:
	li	r2, 1
	lw	r3, 0(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	shadow_check_one_or_group.2877
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7648
	li	r2, 0
	j	beq_cont.7649
beq_else.7648:
	li	r2, 1
beq_cont.7649:
beq_cont.7647:
beq_cont.7645:
beq_cont.7643:
	li	r3, 0
	bne	r2, r3, beq_else.7650
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	j	shadow_check_one_or_matrix.2880
beq_else.7650:
	li	r2, 1
	lw	r3, 0(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	shadow_check_one_or_group.2877
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7651
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	j	shadow_check_one_or_matrix.2880
beq_else.7651:
	li	r2, 1
	jr	r31
solve_each_element.2883:
	lwx	r5, r3, r2
	li	r6, -1
	bne	r5, r6, beq_else.7652
	jr	r31
beq_else.7652:
	la	r6, min_caml_startp
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	sw	r5, -3(r29)
	move	r3, r4
	move	r2, r5
	move	r4, r6
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	solver.2785
	addi	r29, r29, 5
	lw	r31, -4(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7654
	la	r2, min_caml_objects
	lw	r3, -3(r29)
	lwx	r2, r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_isinvert.2657
	addi	r29, r29, 5
	lw	r31, -4(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7655
	jr	r31
beq_else.7655:
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	solve_each_element.2883
beq_else.7654:
	la	r3, min_caml_solver_dist
	lwf	f1, 0(r3)
	fli	f2, 0.
	fclt	r3, f2, f1
	li	r4, 0
	bne	r3, r4, beq_else.7657
	j	beq_cont.7658
beq_else.7657:
	la	r3, min_caml_tmin
	lwf	f2, 0(r3)
	fclt	r3, f1, f2
	li	r4, 0
	bne	r3, r4, beq_else.7659
	j	beq_cont.7660
beq_else.7659:
	fli	f2, 0.01
	fadd	f1, f1, f2
	lw	r3, 0(r29)
	lwf	f2, 0(r3)
	fmul	f2, f2, f1
	la	r4, min_caml_startp
	lwf	f3, 0(r4)
	fadd	f2, f2, f3
	lwf	f3, 1(r3)
	fmul	f3, f3, f1
	la	r4, min_caml_startp
	lwf	f4, 1(r4)
	fadd	f3, f3, f4
	lwf	f4, 2(r3)
	fmul	f4, f4, f1
	la	r4, min_caml_startp
	lwf	f5, 2(r4)
	fadd	f4, f4, f5
	li	r4, 0
	lw	r5, -1(r29)
	sw	r2, -4(r29)
	swf	f4, -5(r29)
	swf	f3, -6(r29)
	swf	f2, -7(r29)
	swf	f1, -8(r29)
	move	r3, r5
	move	r2, r4
	fmove	f1, f2
	fmove	f2, f3
	fmove	f3, f4
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	check_all_inside.2868
	addi	r29, r29, 10
	lw	r31, -9(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7661
	j	beq_cont.7662
beq_else.7661:
	la	r2, min_caml_tmin
	lwf	f1, -8(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_intersection_point
	lwf	f1, -7(r29)
	lwf	f2, -6(r29)
	lwf	f3, -5(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	vecset.2605
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r2, min_caml_intersected_object_id
	lw	r3, -3(r29)
	sw	r3, 0(r2)
	la	r2, min_caml_intsec_rectside
	lw	r3, -4(r29)
	sw	r3, 0(r2)
beq_cont.7662:
beq_cont.7660:
beq_cont.7658:
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	solve_each_element.2883
solve_one_or_network.2887:
	lwx	r5, r3, r2
	li	r6, -1
	bne	r5, r6, beq_else.7663
	jr	r31
beq_else.7663:
	la	r6, min_caml_and_net
	lwx	r5, r6, r5
	li	r6, 0
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	move	r3, r5
	move	r2, r6
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solve_each_element.2883
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	solve_one_or_network.2887
trace_or_matrix.2891:
	lwx	r5, r3, r2
	lw	r6, 0(r5)
	li	r7, -1
	bne	r6, r7, beq_else.7665
	jr	r31
beq_else.7665:
	li	r7, 99
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	bne	r6, r7, beq_else.7667
	li	r6, 1
	move	r3, r5
	move	r2, r6
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solve_one_or_network.2887
	addi	r29, r29, 4
	lw	r31, -3(r29)
	j	beq_cont.7668
beq_else.7667:
	la	r7, min_caml_startp
	sw	r5, -3(r29)
	move	r3, r4
	move	r2, r6
	move	r4, r7
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	solver.2785
	addi	r29, r29, 5
	lw	r31, -4(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7669
	j	beq_cont.7670
beq_else.7669:
	la	r2, min_caml_solver_dist
	lwf	f1, 0(r2)
	la	r2, min_caml_tmin
	lwf	f2, 0(r2)
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7671
	j	beq_cont.7672
beq_else.7671:
	li	r2, 1
	lw	r3, -3(r29)
	lw	r4, 0(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	solve_one_or_network.2887
	addi	r29, r29, 5
	lw	r31, -4(r29)
beq_cont.7672:
beq_cont.7670:
beq_cont.7668:
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	trace_or_matrix.2891
judge_intersection.2895:
	la	r3, min_caml_tmin
	fli	f1, 1000000000.
	swf	f1, 0(r3)
	li	r3, 0
	la	r4, min_caml_or_net
	lw	r4, 0(r4)
	move	r27, r4
	move	r4, r2
	move	r2, r3
	move	r3, r27
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	trace_or_matrix.2891
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_tmin
	lwf	f1, 0(r2)
	fli	f2, -0.1
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7673
	li	r2, 0
	jr	r31
beq_else.7673:
	fli	f2, 100000000.
	fclt	r2, f1, f2
	jr	r31
solve_each_element_fast.2897:
	sw	r4, 0(r29)
	sw	r2, -1(r29)
	sw	r3, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	d_vec.2712
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -1(r29)
	lw	r4, -2(r29)
	lwx	r5, r4, r3
	li	r6, -1
	bne	r5, r6, beq_else.7674
	jr	r31
beq_else.7674:
	lw	r6, 0(r29)
	sw	r2, -3(r29)
	sw	r5, -4(r29)
	move	r3, r6
	move	r2, r5
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	solver_fast2.2826
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7676
	la	r2, min_caml_objects
	lw	r3, -4(r29)
	lwx	r2, r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_isinvert.2657
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7677
	jr	r31
beq_else.7677:
	lw	r2, -1(r29)
	addi	r2, r2, 1
	lw	r3, -2(r29)
	lw	r4, 0(r29)
	j	solve_each_element_fast.2897
beq_else.7676:
	la	r3, min_caml_solver_dist
	lwf	f1, 0(r3)
	fli	f2, 0.
	fclt	r3, f2, f1
	li	r4, 0
	bne	r3, r4, beq_else.7679
	j	beq_cont.7680
beq_else.7679:
	la	r3, min_caml_tmin
	lwf	f2, 0(r3)
	fclt	r3, f1, f2
	li	r4, 0
	bne	r3, r4, beq_else.7681
	j	beq_cont.7682
beq_else.7681:
	fli	f2, 0.01
	fadd	f1, f1, f2
	lw	r3, -3(r29)
	lwf	f2, 0(r3)
	fmul	f2, f2, f1
	la	r4, min_caml_startp_fast
	lwf	f3, 0(r4)
	fadd	f2, f2, f3
	lwf	f3, 1(r3)
	fmul	f3, f3, f1
	la	r4, min_caml_startp_fast
	lwf	f4, 1(r4)
	fadd	f3, f3, f4
	lwf	f4, 2(r3)
	fmul	f4, f4, f1
	la	r3, min_caml_startp_fast
	lwf	f5, 2(r3)
	fadd	f4, f4, f5
	li	r3, 0
	lw	r4, -2(r29)
	sw	r2, -5(r29)
	swf	f4, -6(r29)
	swf	f3, -7(r29)
	swf	f2, -8(r29)
	swf	f1, -9(r29)
	move	r2, r3
	move	r3, r4
	fmove	f1, f2
	fmove	f2, f3
	fmove	f3, f4
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	check_all_inside.2868
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7683
	j	beq_cont.7684
beq_else.7683:
	la	r2, min_caml_tmin
	lwf	f1, -9(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_intersection_point
	lwf	f1, -8(r29)
	lwf	f2, -7(r29)
	lwf	f3, -6(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	vecset.2605
	addi	r29, r29, 11
	lw	r31, -10(r29)
	la	r2, min_caml_intersected_object_id
	lw	r3, -4(r29)
	sw	r3, 0(r2)
	la	r2, min_caml_intsec_rectside
	lw	r3, -5(r29)
	sw	r3, 0(r2)
beq_cont.7684:
beq_cont.7682:
beq_cont.7680:
	lw	r2, -1(r29)
	addi	r2, r2, 1
	lw	r3, -2(r29)
	lw	r4, 0(r29)
	j	solve_each_element_fast.2897
solve_one_or_network_fast.2901:
	lwx	r5, r3, r2
	li	r6, -1
	bne	r5, r6, beq_else.7685
	jr	r31
beq_else.7685:
	la	r6, min_caml_and_net
	lwx	r5, r6, r5
	li	r6, 0
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	move	r3, r5
	move	r2, r6
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solve_each_element_fast.2897
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	solve_one_or_network_fast.2901
trace_or_matrix_fast.2905:
	lwx	r5, r3, r2
	lw	r6, 0(r5)
	li	r7, -1
	bne	r6, r7, beq_else.7687
	jr	r31
beq_else.7687:
	li	r7, 99
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	bne	r6, r7, beq_else.7689
	li	r6, 1
	move	r3, r5
	move	r2, r6
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	solve_one_or_network_fast.2901
	addi	r29, r29, 4
	lw	r31, -3(r29)
	j	beq_cont.7690
beq_else.7689:
	sw	r5, -3(r29)
	move	r3, r4
	move	r2, r6
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	solver_fast2.2826
	addi	r29, r29, 5
	lw	r31, -4(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7691
	j	beq_cont.7692
beq_else.7691:
	la	r2, min_caml_solver_dist
	lwf	f1, 0(r2)
	la	r2, min_caml_tmin
	lwf	f2, 0(r2)
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7693
	j	beq_cont.7694
beq_else.7693:
	li	r2, 1
	lw	r3, -3(r29)
	lw	r4, 0(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	solve_one_or_network_fast.2901
	addi	r29, r29, 5
	lw	r31, -4(r29)
beq_cont.7694:
beq_cont.7692:
beq_cont.7690:
	lw	r2, -2(r29)
	addi	r2, r2, 1
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	trace_or_matrix_fast.2905
judge_intersection_fast.2909:
	la	r3, min_caml_tmin
	fli	f1, 1000000000.
	swf	f1, 0(r3)
	li	r3, 0
	la	r4, min_caml_or_net
	lw	r4, 0(r4)
	move	r27, r4
	move	r4, r2
	move	r2, r3
	move	r3, r27
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	trace_or_matrix_fast.2905
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_tmin
	lwf	f1, 0(r2)
	fli	f2, -0.1
	fclt	r2, f2, f1
	li	r3, 0
	bne	r2, r3, beq_else.7695
	li	r2, 0
	jr	r31
beq_else.7695:
	fli	f2, 100000000.
	fclt	r2, f1, f2
	jr	r31
get_nvector_rect.2911:
	la	r3, min_caml_intsec_rectside
	lw	r3, 0(r3)
	la	r4, min_caml_nvector
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	vecbzero.2613
	addi	r29, r29, 3
	lw	r31, -2(r29)
	la	r2, min_caml_nvector
	lw	r3, -1(r29)
	addi	r4, r3, -1
	addi	r3, r3, -1
	lw	r5, 0(r29)
	lwfx	f1, r5, r3
	sw	r4, -2(r29)
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	sgn.2597
	addi	r29, r29, 5
	lw	r31, -4(r29)
	fneg	f1, f1
	lw	r2, -2(r29)
	lw	r3, -3(r29)
	swfx	f1, r3, r2
	jr	r31
get_nvector_plane.2913:
	la	r3, min_caml_nvector
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_param_a.2661
	addi	r29, r29, 3
	lw	r31, -2(r29)
	fneg	f1, f1
	lw	r2, -1(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_param_b.2663
	addi	r29, r29, 4
	lw	r31, -3(r29)
	fneg	f1, f1
	lw	r2, -2(r29)
	swf	f1, 1(r2)
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_c.2665
	addi	r29, r29, 5
	lw	r31, -4(r29)
	fneg	f1, f1
	lw	r2, -3(r29)
	swf	f1, 2(r2)
	jr	r31
get_nvector_second.2915:
	la	r3, min_caml_intersection_point
	lwf	f1, 0(r3)
	sw	r2, 0(r29)
	swf	f1, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_param_x.2669
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, -1(r29)
	fsub	f1, f2, f1
	la	r2, min_caml_intersection_point
	lwf	f2, 1(r2)
	lw	r2, 0(r29)
	swf	f1, -2(r29)
	swf	f2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_param_y.2671
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fsub	f1, f2, f1
	la	r2, min_caml_intersection_point
	lwf	f2, 2(r2)
	lw	r2, 0(r29)
	swf	f1, -4(r29)
	swf	f2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_z.2673
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lwf	f2, -5(r29)
	fsub	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_a.2661
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_b.2663
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_param_c.2665
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_isrot.2659
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7698
	la	r2, min_caml_nvector
	lwf	f1, -7(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_nvector
	lwf	f1, -8(r29)
	swf	f1, 1(r2)
	la	r2, min_caml_nvector
	lwf	f1, -9(r29)
	swf	f1, 2(r2)
	j	beq_cont.7699
beq_else.7698:
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -10(r29)
	move	r2, r3
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_param_r3.2689
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -11(r29)
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	o_param_r2.2687
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	lwf	f3, -11(r29)
	fadd	f1, f3, f1
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	min_caml_fhalf
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -7(r29)
	fadd	f1, f2, f1
	lw	r2, -10(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -12(r29)
	move	r2, r3
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	o_param_r3.2689
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -13(r29)
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	o_param_r1.2685
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	lwf	f2, -13(r29)
	fadd	f1, f2, f1
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	min_caml_fhalf
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -8(r29)
	fadd	f1, f2, f1
	lw	r2, -12(r29)
	swf	f1, 1(r2)
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -14(r29)
	move	r2, r3
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	o_param_r2.2687
	addi	r29, r29, 16
	lw	r31, -15(r29)
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, -15(r29)
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	o_param_r1.2685
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	lwf	f2, -15(r29)
	fadd	f1, f2, f1
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	min_caml_fhalf
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -9(r29)
	fadd	f1, f2, f1
	lw	r2, -14(r29)
	swf	f1, 2(r2)
beq_cont.7699:
	la	r2, min_caml_nvector
	lw	r3, 0(r29)
	sw	r2, -16(r29)
	move	r2, r3
	sw	r31, -17(r29)
	addi	r29, r29, -18
	jal	o_isinvert.2657
	addi	r29, r29, 18
	lw	r31, -17(r29)
	move	r3, r2
	lw	r2, -16(r29)
	j	vecunit_sgn.2623
get_nvector.2917:
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_form.2653
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7700
	lw	r2, -1(r29)
	j	get_nvector_rect.2911
beq_else.7700:
	li	r3, 2
	bne	r2, r3, beq_else.7701
	lw	r2, 0(r29)
	j	get_nvector_plane.2913
beq_else.7701:
	lw	r2, 0(r29)
	j	get_nvector_second.2915
utexture.2920:
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_texturetype.2651
	addi	r29, r29, 3
	lw	r31, -2(r29)
	la	r3, min_caml_texture_color
	lw	r4, -1(r29)
	sw	r2, -2(r29)
	sw	r3, -3(r29)
	move	r2, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_color_red.2679
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -3(r29)
	swf	f1, 0(r2)
	la	r2, min_caml_texture_color
	lw	r3, -1(r29)
	sw	r2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_color_green.2681
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -4(r29)
	swf	f1, 1(r2)
	la	r2, min_caml_texture_color
	lw	r3, -1(r29)
	sw	r2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_color_blue.2683
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -5(r29)
	swf	f1, 2(r2)
	li	r2, 1
	lw	r3, -2(r29)
	bne	r3, r2, beq_else.7702
	lw	r2, 0(r29)
	lwf	f1, 0(r2)
	lw	r3, -1(r29)
	swf	f1, -6(r29)
	move	r2, r3
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	o_param_x.2669
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fsub	f1, f2, f1
	fli	f2, 0.05
	fmul	f2, f1, f2
	swf	f1, -7(r29)
	fmove	f1, f2
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	min_caml_floor
	addi	r29, r29, 9
	lw	r31, -8(r29)
	fli	f2, 20.
	fmul	f1, f1, f2
	lwf	f2, -7(r29)
	fsub	f1, f2, f1
	fli	f2, 10.
	fclt	r2, f1, f2
	lw	r3, 0(r29)
	lwf	f1, 2(r3)
	lw	r3, -1(r29)
	sw	r2, -8(r29)
	swf	f1, -9(r29)
	move	r2, r3
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_param_z.2673
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lwf	f2, -9(r29)
	fsub	f1, f2, f1
	fli	f2, 0.05
	fmul	f2, f1, f2
	swf	f1, -10(r29)
	fmove	f1, f2
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	min_caml_floor
	addi	r29, r29, 12
	lw	r31, -11(r29)
	fli	f2, 20.
	fmul	f1, f1, f2
	lwf	f2, -10(r29)
	fsub	f1, f2, f1
	fli	f2, 10.
	fclt	r2, f1, f2
	la	r3, min_caml_texture_color
	li	r4, 0
	lw	r5, -8(r29)
	bne	r5, r4, beq_else.7703
	li	r4, 0
	bne	r2, r4, beq_else.7705
	fli	f1, 255.
	j	beq_cont.7706
beq_else.7705:
	fli	f1, 0.
beq_cont.7706:
	j	beq_cont.7704
beq_else.7703:
	li	r4, 0
	bne	r2, r4, beq_else.7707
	fli	f1, 0.
	j	beq_cont.7708
beq_else.7707:
	fli	f1, 255.
beq_cont.7708:
beq_cont.7704:
	swf	f1, 1(r3)
	jr	r31
beq_else.7702:
	li	r2, 2
	bne	r3, r2, beq_else.7710
	lw	r2, 0(r29)
	lwf	f1, 1(r2)
	fli	f2, 0.25
	fmul	f1, f1, f2
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	min_caml_sin
	addi	r29, r29, 12
	lw	r31, -11(r29)
	fmul	f1, f1, f1
	la	r2, min_caml_texture_color
	fli	f2, 255.
	fmul	f2, f2, f1
	swf	f2, 0(r2)
	la	r2, min_caml_texture_color
	fli	f2, 255.
	fli	f3, 1.
	fsub	f1, f3, f1
	fmul	f1, f2, f1
	swf	f1, 1(r2)
	jr	r31
beq_else.7710:
	li	r2, 3
	bne	r3, r2, beq_else.7712
	lw	r2, 0(r29)
	lwf	f1, 0(r2)
	lw	r3, -1(r29)
	swf	f1, -11(r29)
	move	r2, r3
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	o_param_x.2669
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -11(r29)
	fsub	f1, f2, f1
	lw	r2, 0(r29)
	lwf	f2, 2(r2)
	lw	r2, -1(r29)
	swf	f1, -12(r29)
	swf	f2, -13(r29)
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	o_param_z.2673
	addi	r29, r29, 15
	lw	r31, -14(r29)
	lwf	f2, -13(r29)
	fsub	f1, f2, f1
	lwf	f2, -12(r29)
	fmul	f2, f2, f2
	fmul	f1, f1, f1
	fadd	f1, f2, f1
	fsqrt	f1, f1
	fli	f2, 10.
	fdiv	f1, f1, f2
	swf	f1, -14(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	min_caml_floor
	addi	r29, r29, 16
	lw	r31, -15(r29)
	lwf	f2, -14(r29)
	fsub	f1, f2, f1
	fli	f2, 3.1415927
	fmul	f1, f1, f2
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	min_caml_cos
	addi	r29, r29, 16
	lw	r31, -15(r29)
	fmul	f1, f1, f1
	la	r2, min_caml_texture_color
	fli	f2, 255.
	fmul	f2, f1, f2
	swf	f2, 1(r2)
	la	r2, min_caml_texture_color
	fli	f2, 1.
	fsub	f1, f2, f1
	fli	f2, 255.
	fmul	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
beq_else.7712:
	li	r2, 4
	bne	r3, r2, beq_else.7714
	lw	r2, 0(r29)
	lwf	f1, 0(r2)
	lw	r3, -1(r29)
	swf	f1, -15(r29)
	move	r2, r3
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	o_param_x.2669
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -15(r29)
	fsub	f1, f2, f1
	lw	r2, -1(r29)
	swf	f1, -16(r29)
	sw	r31, -17(r29)
	addi	r29, r29, -18
	jal	o_param_a.2661
	addi	r29, r29, 18
	lw	r31, -17(r29)
	fsqrt	f1, f1
	lwf	f2, -16(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	lwf	f2, 2(r2)
	lw	r3, -1(r29)
	swf	f1, -17(r29)
	swf	f2, -18(r29)
	move	r2, r3
	sw	r31, -19(r29)
	addi	r29, r29, -20
	jal	o_param_z.2673
	addi	r29, r29, 20
	lw	r31, -19(r29)
	lwf	f2, -18(r29)
	fsub	f1, f2, f1
	lw	r2, -1(r29)
	swf	f1, -19(r29)
	sw	r31, -20(r29)
	addi	r29, r29, -21
	jal	o_param_c.2665
	addi	r29, r29, 21
	lw	r31, -20(r29)
	fsqrt	f1, f1
	lwf	f2, -19(r29)
	fmul	f1, f2, f1
	lwf	f2, -17(r29)
	fmul	f3, f2, f2
	fmul	f4, f1, f1
	fadd	f3, f3, f4
	fabs	f4, f2
	fli	f5, 0.0001
	fclt	r2, f4, f5
	li	r3, 0
	swf	f3, -20(r29)
	bne	r2, r3, beq_else.7715
	fdiv	f1, f1, f2
	fabs	f1, f1
	sw	r31, -21(r29)
	addi	r29, r29, -22
	jal	min_caml_atan
	addi	r29, r29, 22
	lw	r31, -21(r29)
	fli	f2, 30.
	fmul	f1, f1, f2
	fli	f2, 3.1415927
	fdiv	f1, f1, f2
	j	beq_cont.7716
beq_else.7715:
	fli	f1, 15.
beq_cont.7716:
	swf	f1, -21(r29)
	sw	r31, -22(r29)
	addi	r29, r29, -23
	jal	min_caml_floor
	addi	r29, r29, 23
	lw	r31, -22(r29)
	lwf	f2, -21(r29)
	fsub	f1, f2, f1
	lw	r2, 0(r29)
	lwf	f2, 1(r2)
	lw	r2, -1(r29)
	swf	f1, -22(r29)
	swf	f2, -23(r29)
	sw	r31, -24(r29)
	addi	r29, r29, -25
	jal	o_param_y.2671
	addi	r29, r29, 25
	lw	r31, -24(r29)
	lwf	f2, -23(r29)
	fsub	f1, f2, f1
	lw	r2, -1(r29)
	swf	f1, -24(r29)
	sw	r31, -25(r29)
	addi	r29, r29, -26
	jal	o_param_b.2663
	addi	r29, r29, 26
	lw	r31, -25(r29)
	fsqrt	f1, f1
	lwf	f2, -24(r29)
	fmul	f1, f2, f1
	lwf	f2, -20(r29)
	fabs	f3, f2
	fli	f4, 0.0001
	fclt	r2, f3, f4
	li	r3, 0
	bne	r2, r3, beq_else.7717
	fdiv	f1, f1, f2
	fabs	f1, f1
	sw	r31, -25(r29)
	addi	r29, r29, -26
	jal	min_caml_atan
	addi	r29, r29, 26
	lw	r31, -25(r29)
	fli	f2, 30.
	fmul	f1, f1, f2
	fli	f2, 3.1415927
	fdiv	f1, f1, f2
	j	beq_cont.7718
beq_else.7717:
	fli	f1, 15.
beq_cont.7718:
	swf	f1, -25(r29)
	sw	r31, -26(r29)
	addi	r29, r29, -27
	jal	min_caml_floor
	addi	r29, r29, 27
	lw	r31, -26(r29)
	lwf	f2, -25(r29)
	fsub	f1, f2, f1
	fli	f2, 0.15
	fli	f3, 0.5
	lwf	f4, -22(r29)
	fsub	f3, f3, f4
	fmul	f3, f3, f3
	fsub	f2, f2, f3
	fli	f3, 0.5
	fsub	f1, f3, f1
	fmul	f1, f1, f1
	fsub	f1, f2, f1
	fclt	r2, f1, f0
	li	r3, 0
	bne	r2, r3, beq_else.7719
	j	beq_cont.7720
beq_else.7719:
	fli	f1, 0.
beq_cont.7720:
	la	r2, min_caml_texture_color
	fli	f2, 255.
	fmul	f1, f2, f1
	fli	f2, 0.3
	fdiv	f1, f1, f2
	swf	f1, 2(r2)
	jr	r31
beq_else.7714:
	jr	r31
add_light.2923:
	fclt	r2, f0, f1
	li	r3, 0
	swf	f3, 0(r29)
	swf	f2, -1(r29)
	bne	r2, r3, beq_else.7723
	j	beq_cont.7724
beq_else.7723:
	la	r2, min_caml_rgb
	la	r3, min_caml_texture_color
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	vecaccum.2634
	addi	r29, r29, 3
	lw	r31, -2(r29)
beq_cont.7724:
	lwf	f1, -1(r29)
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7725
	jr	r31
beq_else.7725:
	fmul	f1, f1, f1
	fmul	f1, f1, f1
	lwf	f2, 0(r29)
	fmul	f1, f1, f2
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 0(r3)
	fadd	f2, f2, f1
	swf	f2, 0(r2)
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 1(r3)
	fadd	f2, f2, f1
	swf	f2, 1(r2)
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 2(r3)
	fadd	f1, f2, f1
	swf	f1, 2(r2)
	jr	r31
trace_reflections.2927:
	bltz	r2, bge_else.7728
	la	r4, min_caml_reflections
	lwx	r4, r4, r2
	sw	r2, 0(r29)
	swf	f2, -1(r29)
	sw	r3, -2(r29)
	swf	f1, -3(r29)
	sw	r4, -4(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	r_dvec.2718
	addi	r29, r29, 6
	lw	r31, -5(r29)
	sw	r2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	judge_intersection_fast.2909
	addi	r29, r29, 7
	lw	r31, -6(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7729
	j	beq_cont.7730
beq_else.7729:
	la	r2, min_caml_intersected_object_id
	lw	r2, 0(r2)
	li	r3, 4
	mul	r2, r3
	mflo	r2
	la	r3, min_caml_intsec_rectside
	lw	r3, 0(r3)
	add	r2, r2, r3
	lw	r3, -4(r29)
	sw	r2, -6(r29)
	move	r2, r3
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	r_surface_id.2716
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r3, -6(r29)
	bne	r3, r2, beq_else.7731
	li	r2, 0
	la	r3, min_caml_or_net
	lw	r3, 0(r3)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	shadow_check_one_or_matrix.2880
	addi	r29, r29, 8
	lw	r31, -7(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7733
	la	r2, min_caml_nvector
	lw	r3, -5(r29)
	sw	r2, -7(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	d_vec.2712
	addi	r29, r29, 9
	lw	r31, -8(r29)
	move	r3, r2
	lw	r2, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	veciprod.2626
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lw	r2, -4(r29)
	swf	f1, -8(r29)
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	r_bright.2720
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -3(r29)
	fmul	f3, f1, f2
	lwf	f4, -8(r29)
	fmul	f3, f3, f4
	lw	r2, -5(r29)
	swf	f3, -9(r29)
	swf	f1, -10(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	d_vec.2712
	addi	r29, r29, 12
	lw	r31, -11(r29)
	move	r3, r2
	lw	r2, -2(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	veciprod.2626
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lwf	f2, -10(r29)
	fmul	f2, f2, f1
	lwf	f1, -9(r29)
	lwf	f3, -1(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	add_light.2923
	addi	r29, r29, 12
	lw	r31, -11(r29)
	j	beq_cont.7734
beq_else.7733:
beq_cont.7734:
	j	beq_cont.7732
beq_else.7731:
beq_cont.7732:
beq_cont.7730:
	lw	r2, 0(r29)
	addi	r2, r2, -1
	lwf	f1, -3(r29)
	lwf	f2, -1(r29)
	lw	r3, -2(r29)
	j	trace_reflections.2927
bge_else.7728:
	jr	r31
trace_ray.2932:
	li	r5, 4
	bgt	r2, r5, ble_else.7736
	swf	f2, 0(r29)
	sw	r4, -1(r29)
	swf	f1, -2(r29)
	sw	r2, -3(r29)
	sw	r3, -4(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	p_surface_ids.2697
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, -4(r29)
	sw	r2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	judge_intersection.2895
	addi	r29, r29, 7
	lw	r31, -6(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7737
	li	r2, -1
	lw	r3, -3(r29)
	lw	r4, -5(r29)
	swx	r2, r4, r3
	li	r2, 0
	bne	r3, r2, beq_else.7738
	jr	r31
beq_else.7738:
	la	r3, min_caml_light
	lw	r2, -4(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	veciprod.2626
	addi	r29, r29, 7
	lw	r31, -6(r29)
	fneg	f1, f1
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7740
	jr	r31
beq_else.7740:
	fmul	f2, f1, f1
	fmul	f1, f2, f1
	lwf	f2, -2(r29)
	fmul	f1, f1, f2
	la	r2, min_caml_beam
	lwf	f2, 0(r2)
	fmul	f1, f1, f2
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 0(r3)
	fadd	f2, f2, f1
	swf	f2, 0(r2)
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 1(r3)
	fadd	f2, f2, f1
	swf	f2, 1(r2)
	la	r2, min_caml_rgb
	la	r3, min_caml_rgb
	lwf	f2, 2(r3)
	fadd	f1, f2, f1
	swf	f1, 2(r2)
	jr	r31
beq_else.7737:
	la	r2, min_caml_intersected_object_id
	lw	r2, 0(r2)
	la	r3, min_caml_objects
	lwx	r3, r3, r2
	sw	r2, -6(r29)
	sw	r3, -7(r29)
	move	r2, r3
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_reflectiontype.2655
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lw	r3, -7(r29)
	sw	r2, -8(r29)
	move	r2, r3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	o_diffuse.2675
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lwf	f2, -2(r29)
	fmul	f1, f1, f2
	lw	r2, -7(r29)
	lw	r3, -4(r29)
	swf	f1, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	get_nvector.2917
	addi	r29, r29, 11
	lw	r31, -10(r29)
	la	r2, min_caml_startp
	la	r3, min_caml_intersection_point
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	veccpy.2615
	addi	r29, r29, 11
	lw	r31, -10(r29)
	la	r3, min_caml_intersection_point
	lw	r2, -7(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	utexture.2920
	addi	r29, r29, 11
	lw	r31, -10(r29)
	li	r2, 4
	lw	r3, -6(r29)
	mul	r3, r2
	mflo	r2
	la	r3, min_caml_intsec_rectside
	lw	r3, 0(r3)
	add	r2, r2, r3
	lw	r3, -3(r29)
	lw	r4, -5(r29)
	swx	r2, r4, r3
	lw	r2, -1(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	p_intersection_points.2695
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r3, -3(r29)
	lwx	r2, r2, r3
	la	r4, min_caml_intersection_point
	move	r3, r4
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	veccpy.2615
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r2, -1(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	p_calc_diffuse.2699
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lw	r3, -7(r29)
	sw	r2, -10(r29)
	move	r2, r3
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	o_diffuse.2675
	addi	r29, r29, 12
	lw	r31, -11(r29)
	fli	f2, 0.5
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7743
	li	r2, 1
	lw	r3, -3(r29)
	lw	r4, -10(r29)
	swx	r2, r4, r3
	lw	r2, -1(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	p_energy.2701
	addi	r29, r29, 12
	lw	r31, -11(r29)
	lw	r3, -3(r29)
	lwx	r4, r2, r3
	la	r5, min_caml_texture_color
	sw	r2, -11(r29)
	move	r3, r5
	move	r2, r4
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	veccpy.2615
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lw	r2, -3(r29)
	lw	r3, -11(r29)
	lwx	r3, r3, r2
	fli	f1, 0.00390625
	lwf	f2, -9(r29)
	fmul	f1, f1, f2
	move	r2, r3
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	vecscale.2644
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lw	r2, -1(r29)
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	p_nvectors.2710
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lw	r3, -3(r29)
	lwx	r2, r2, r3
	la	r4, min_caml_nvector
	move	r3, r4
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	veccpy.2615
	addi	r29, r29, 13
	lw	r31, -12(r29)
	j	beq_cont.7744
beq_else.7743:
	li	r2, 0
	lw	r3, -3(r29)
	lw	r4, -10(r29)
	swx	r2, r4, r3
beq_cont.7744:
	fli	f1, -2.
	la	r3, min_caml_nvector
	lw	r2, -4(r29)
	swf	f1, -12(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	veciprod.2626
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -12(r29)
	fmul	f1, f2, f1
	la	r3, min_caml_nvector
	lw	r2, -4(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	vecaccum.2634
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lw	r2, -7(r29)
	sw	r31, -13(r29)
	addi	r29, r29, -14
	jal	o_hilight.2677
	addi	r29, r29, 14
	lw	r31, -13(r29)
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	li	r2, 0
	la	r3, min_caml_or_net
	lw	r3, 0(r3)
	swf	f1, -13(r29)
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	shadow_check_one_or_matrix.2880
	addi	r29, r29, 15
	lw	r31, -14(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7745
	la	r2, min_caml_nvector
	la	r3, min_caml_light
	sw	r31, -14(r29)
	addi	r29, r29, -15
	jal	veciprod.2626
	addi	r29, r29, 15
	lw	r31, -14(r29)
	fneg	f1, f1
	lwf	f2, -9(r29)
	fmul	f1, f1, f2
	la	r3, min_caml_light
	lw	r2, -4(r29)
	swf	f1, -14(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	veciprod.2626
	addi	r29, r29, 16
	lw	r31, -15(r29)
	fneg	f2, f1
	lwf	f1, -14(r29)
	lwf	f3, -13(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	add_light.2923
	addi	r29, r29, 16
	lw	r31, -15(r29)
	j	beq_cont.7746
beq_else.7745:
beq_cont.7746:
	la	r2, min_caml_intersection_point
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	setup_startp.2846
	addi	r29, r29, 16
	lw	r31, -15(r29)
	la	r2, min_caml_n_reflections
	lw	r2, 0(r2)
	addi	r2, r2, -1
	lwf	f1, -9(r29)
	lwf	f2, -13(r29)
	lw	r3, -4(r29)
	sw	r31, -15(r29)
	addi	r29, r29, -16
	jal	trace_reflections.2927
	addi	r29, r29, 16
	lw	r31, -15(r29)
	fli	f1, 0.1
	lwf	f2, -2(r29)
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7747
	jr	r31
beq_else.7747:
	li	r2, 4
	lw	r3, -3(r29)
	bgt	r2, r3, ble_else.7749
	j	ble_cont.7750
ble_else.7749:
	addi	r2, r3, 1
	li	r4, -1
	lw	r5, -5(r29)
	swx	r4, r5, r2
ble_cont.7750:
	li	r2, 2
	lw	r4, -8(r29)
	bne	r4, r2, beq_else.7751
	fli	f1, 1.
	lw	r2, -7(r29)
	swf	f1, -15(r29)
	sw	r31, -16(r29)
	addi	r29, r29, -17
	jal	o_diffuse.2675
	addi	r29, r29, 17
	lw	r31, -16(r29)
	lwf	f2, -15(r29)
	fsub	f1, f2, f1
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	lw	r2, -3(r29)
	addi	r2, r2, 1
	la	r3, min_caml_tmin
	lwf	f2, 0(r3)
	lwf	f3, 0(r29)
	fadd	f2, f3, f2
	lw	r3, -4(r29)
	lw	r4, -1(r29)
	j	trace_ray.2932
beq_else.7751:
	jr	r31
ble_else.7736:
	jr	r31
trace_diffuse_ray.2938:
	swf	f1, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	judge_intersection_fast.2909
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7754
	jr	r31
beq_else.7754:
	la	r2, min_caml_objects
	la	r3, min_caml_intersected_object_id
	lw	r3, 0(r3)
	lwx	r2, r2, r3
	lw	r3, -1(r29)
	sw	r2, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	d_vec.2712
	addi	r29, r29, 4
	lw	r31, -3(r29)
	move	r3, r2
	lw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	get_nvector.2917
	addi	r29, r29, 4
	lw	r31, -3(r29)
	la	r3, min_caml_intersection_point
	lw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	utexture.2920
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r2, 0
	la	r3, min_caml_or_net
	lw	r3, 0(r3)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	shadow_check_one_or_matrix.2880
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7756
	la	r2, min_caml_nvector
	la	r3, min_caml_light
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	veciprod.2626
	addi	r29, r29, 4
	lw	r31, -3(r29)
	fneg	f1, f1
	fclt	r2, f0, f1
	li	r3, 0
	bne	r2, r3, beq_else.7757
	fli	f1, 0.
	j	beq_cont.7758
beq_else.7757:
beq_cont.7758:
	la	r2, min_caml_diffuse_ray
	lwf	f2, 0(r29)
	fmul	f1, f2, f1
	lw	r3, -2(r29)
	sw	r2, -3(r29)
	swf	f1, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	o_diffuse.2675
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f2, -4(r29)
	fmul	f1, f2, f1
	la	r3, min_caml_texture_color
	lw	r2, -3(r29)
	j	vecaccum.2634
beq_else.7756:
	jr	r31
iter_trace_diffuse_rays.2941:
	bltz	r5, bge_else.7760
	lwx	r6, r2, r5
	sw	r4, 0(r29)
	sw	r5, -1(r29)
	sw	r2, -2(r29)
	sw	r3, -3(r29)
	move	r2, r6
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	d_vec.2712
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	veciprod.2626
	addi	r29, r29, 5
	lw	r31, -4(r29)
	fclt	r2, f1, f0
	li	r3, 0
	bne	r2, r3, beq_else.7761
	lw	r2, -1(r29)
	lw	r3, -2(r29)
	lwx	r4, r3, r2
	fli	f2, 150.
	fdiv	f1, f1, f2
	move	r2, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	trace_diffuse_ray.2938
	addi	r29, r29, 5
	lw	r31, -4(r29)
	j	beq_cont.7762
beq_else.7761:
	lw	r2, -1(r29)
	addi	r3, r2, 1
	lw	r4, -2(r29)
	lwx	r3, r4, r3
	fli	f2, -150.
	fdiv	f1, f1, f2
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	trace_diffuse_ray.2938
	addi	r29, r29, 5
	lw	r31, -4(r29)
beq_cont.7762:
	lw	r2, -1(r29)
	addi	r5, r2, -2
	lw	r2, -2(r29)
	lw	r3, -3(r29)
	lw	r4, 0(r29)
	j	iter_trace_diffuse_rays.2941
bge_else.7760:
	jr	r31
trace_diffuse_rays.2946:
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	move	r2, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	setup_startp.2846
	addi	r29, r29, 4
	lw	r31, -3(r29)
	li	r5, 118
	lw	r2, -2(r29)
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	iter_trace_diffuse_rays.2941
trace_diffuse_ray_80percent.2950:
	li	r5, 0
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	bne	r2, r5, beq_else.7764
	j	beq_cont.7765
beq_else.7764:
	la	r5, min_caml_dirvecs
	lw	r5, 0(r5)
	move	r2, r5
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	trace_diffuse_rays.2946
	addi	r29, r29, 4
	lw	r31, -3(r29)
beq_cont.7765:
	li	r2, 1
	lw	r3, -2(r29)
	bne	r3, r2, beq_else.7766
	j	beq_cont.7767
beq_else.7766:
	la	r2, min_caml_dirvecs
	lw	r2, 1(r2)
	lw	r4, -1(r29)
	lw	r5, 0(r29)
	move	r3, r4
	move	r4, r5
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	trace_diffuse_rays.2946
	addi	r29, r29, 4
	lw	r31, -3(r29)
beq_cont.7767:
	li	r2, 2
	lw	r3, -2(r29)
	bne	r3, r2, beq_else.7768
	j	beq_cont.7769
beq_else.7768:
	la	r2, min_caml_dirvecs
	lw	r2, 2(r2)
	lw	r4, -1(r29)
	lw	r5, 0(r29)
	move	r3, r4
	move	r4, r5
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	trace_diffuse_rays.2946
	addi	r29, r29, 4
	lw	r31, -3(r29)
beq_cont.7769:
	li	r2, 3
	lw	r3, -2(r29)
	bne	r3, r2, beq_else.7770
	j	beq_cont.7771
beq_else.7770:
	la	r2, min_caml_dirvecs
	lw	r2, 3(r2)
	lw	r4, -1(r29)
	lw	r5, 0(r29)
	move	r3, r4
	move	r4, r5
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	trace_diffuse_rays.2946
	addi	r29, r29, 4
	lw	r31, -3(r29)
beq_cont.7771:
	li	r2, 4
	lw	r3, -2(r29)
	bne	r3, r2, beq_else.7772
	jr	r31
beq_else.7772:
	la	r2, min_caml_dirvecs
	lw	r2, 4(r2)
	lw	r3, -1(r29)
	lw	r4, 0(r29)
	j	trace_diffuse_rays.2946
calc_diffuse_using_1point.2954:
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	sw	r2, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	p_nvectors.2710
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -1(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	p_intersection_points.2695
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -1(r29)
	sw	r2, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	p_energy.2701
	addi	r29, r29, 6
	lw	r31, -5(r29)
	la	r3, min_caml_diffuse_ray
	lw	r4, 0(r29)
	lw	r5, -2(r29)
	lwx	r5, r5, r4
	sw	r2, -5(r29)
	move	r2, r3
	move	r3, r5
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	veccpy.2615
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -1(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	p_group_id.2705
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, 0(r29)
	lw	r4, -3(r29)
	lwx	r4, r4, r3
	lw	r5, -4(r29)
	lwx	r5, r5, r3
	move	r3, r4
	move	r4, r5
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	trace_diffuse_ray_80percent.2950
	addi	r29, r29, 7
	lw	r31, -6(r29)
	la	r2, min_caml_rgb
	lw	r3, 0(r29)
	lw	r4, -5(r29)
	lwx	r3, r4, r3
	la	r4, min_caml_diffuse_ray
	j	vecaccumv.2647
calc_diffuse_using_5points.2957:
	lwx	r3, r3, r2
	sw	r6, 0(r29)
	sw	r5, -1(r29)
	sw	r4, -2(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, -3(r29)
	addi	r4, r3, -1
	lw	r5, -2(r29)
	lwx	r4, r5, r4
	sw	r2, -4(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, -3(r29)
	lw	r4, -2(r29)
	lwx	r5, r4, r3
	sw	r2, -5(r29)
	move	r2, r5
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, -3(r29)
	addi	r4, r3, 1
	lw	r5, -2(r29)
	lwx	r4, r5, r4
	sw	r2, -6(r29)
	move	r2, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r3, -3(r29)
	lw	r4, -1(r29)
	lwx	r4, r4, r3
	sw	r2, -7(r29)
	move	r2, r4
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 9
	lw	r31, -8(r29)
	la	r3, min_caml_diffuse_ray
	lw	r4, 0(r29)
	lw	r5, -4(r29)
	lwx	r5, r5, r4
	sw	r2, -8(r29)
	move	r2, r3
	move	r3, r5
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	veccpy.2615
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r2, min_caml_diffuse_ray
	lw	r3, 0(r29)
	lw	r4, -5(r29)
	lwx	r4, r4, r3
	move	r3, r4
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	vecadd.2638
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r2, min_caml_diffuse_ray
	lw	r3, 0(r29)
	lw	r4, -6(r29)
	lwx	r4, r4, r3
	move	r3, r4
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	vecadd.2638
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r2, min_caml_diffuse_ray
	lw	r3, 0(r29)
	lw	r4, -7(r29)
	lwx	r4, r4, r3
	move	r3, r4
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	vecadd.2638
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r2, min_caml_diffuse_ray
	lw	r3, 0(r29)
	lw	r4, -8(r29)
	lwx	r4, r4, r3
	move	r3, r4
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	vecadd.2638
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r2, -3(r29)
	lw	r3, -2(r29)
	lwx	r2, r3, r2
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	p_energy.2701
	addi	r29, r29, 10
	lw	r31, -9(r29)
	la	r3, min_caml_rgb
	lw	r4, 0(r29)
	lwx	r2, r2, r4
	la	r4, min_caml_diffuse_ray
	move	r27, r3
	move	r3, r2
	move	r2, r27
	j	vecaccumv.2647
do_without_neighbors.2963:
	li	r4, 4
	bgt	r3, r4, ble_else.7774
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	p_surface_ids.2697
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	lwx	r2, r2, r3
	bltz	r2, bge_else.7775
	lw	r2, 0(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	p_calc_diffuse.2699
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, -1(r29)
	lwx	r2, r2, r3
	li	r4, 0
	bne	r2, r4, beq_else.7776
	j	beq_cont.7777
beq_else.7776:
	lw	r2, 0(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	calc_diffuse_using_1point.2954
	addi	r29, r29, 3
	lw	r31, -2(r29)
beq_cont.7777:
	lw	r2, -1(r29)
	addi	r3, r2, 1
	lw	r2, 0(r29)
	j	do_without_neighbors.2963
bge_else.7775:
	jr	r31
ble_else.7774:
	jr	r31
neighbors_exist.2966:
	la	r4, min_caml_image_size
	lw	r4, 1(r4)
	addi	r5, r3, 1
	bgt	r4, r5, ble_else.7780
	li	r2, 0
	jr	r31
ble_else.7780:
	bgtz	r3, ble_else.7781
	li	r2, 0
	jr	r31
ble_else.7781:
	la	r3, min_caml_image_size
	lw	r3, 0(r3)
	addi	r4, r2, 1
	bgt	r3, r4, ble_else.7782
	li	r2, 0
	jr	r31
ble_else.7782:
	bgtz	r2, ble_else.7783
	li	r2, 0
	jr	r31
ble_else.7783:
	li	r2, 1
	jr	r31
get_surface_id.2970:
	sw	r3, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	p_surface_ids.2697
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	lwx	r2, r2, r3
	jr	r31
neighbors_are_available.2973:
	lwx	r7, r4, r2
	sw	r4, 0(r29)
	sw	r5, -1(r29)
	sw	r6, -2(r29)
	sw	r2, -3(r29)
	sw	r3, -4(r29)
	move	r3, r6
	move	r2, r7
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	get_surface_id.2970
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r3, -3(r29)
	lw	r4, -4(r29)
	lwx	r4, r4, r3
	lw	r5, -2(r29)
	sw	r2, -5(r29)
	move	r3, r5
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	get_surface_id.2970
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, -5(r29)
	bne	r2, r3, beq_else.7784
	lw	r2, -3(r29)
	lw	r4, -1(r29)
	lwx	r4, r4, r2
	lw	r5, -2(r29)
	move	r3, r5
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	get_surface_id.2970
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, -5(r29)
	bne	r2, r3, beq_else.7785
	lw	r2, -3(r29)
	addi	r4, r2, -1
	lw	r5, 0(r29)
	lwx	r4, r5, r4
	lw	r6, -2(r29)
	move	r3, r6
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	get_surface_id.2970
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, -5(r29)
	bne	r2, r3, beq_else.7786
	lw	r2, -3(r29)
	addi	r2, r2, 1
	lw	r4, 0(r29)
	lwx	r2, r4, r2
	lw	r4, -2(r29)
	move	r3, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	get_surface_id.2970
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r3, -5(r29)
	bne	r2, r3, beq_else.7787
	li	r2, 1
	jr	r31
beq_else.7787:
	li	r2, 0
	jr	r31
beq_else.7786:
	li	r2, 0
	jr	r31
beq_else.7785:
	li	r2, 0
	jr	r31
beq_else.7784:
	li	r2, 0
	jr	r31
try_exploit_neighbors.2979:
	lwx	r8, r5, r2
	li	r9, 4
	bgt	r7, r9, ble_else.7788
	sw	r3, 0(r29)
	sw	r8, -1(r29)
	sw	r7, -2(r29)
	sw	r6, -3(r29)
	sw	r5, -4(r29)
	sw	r4, -5(r29)
	sw	r2, -6(r29)
	move	r3, r7
	move	r2, r8
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	get_surface_id.2970
	addi	r29, r29, 8
	lw	r31, -7(r29)
	bltz	r2, bge_else.7789
	lw	r2, -6(r29)
	lw	r3, -5(r29)
	lw	r4, -4(r29)
	lw	r5, -3(r29)
	lw	r6, -2(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	neighbors_are_available.2973
	addi	r29, r29, 8
	lw	r31, -7(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7790
	lw	r2, -6(r29)
	lw	r3, -4(r29)
	lwx	r2, r3, r2
	lw	r3, -2(r29)
	j	do_without_neighbors.2963
beq_else.7790:
	lw	r2, -1(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	p_calc_diffuse.2699
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r6, -2(r29)
	lwx	r2, r2, r6
	li	r3, 0
	bne	r2, r3, beq_else.7791
	j	beq_cont.7792
beq_else.7791:
	lw	r2, -6(r29)
	lw	r3, -5(r29)
	lw	r4, -4(r29)
	lw	r5, -3(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	calc_diffuse_using_5points.2957
	addi	r29, r29, 8
	lw	r31, -7(r29)
beq_cont.7792:
	lw	r2, -2(r29)
	addi	r7, r2, 1
	lw	r2, -6(r29)
	lw	r3, 0(r29)
	lw	r4, -5(r29)
	lw	r5, -4(r29)
	lw	r6, -3(r29)
	j	try_exploit_neighbors.2979
bge_else.7789:
	jr	r31
ble_else.7788:
	jr	r31
write_ppm_header.2986:
	li	r2, 80
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_char
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 54
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_char
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 10
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_char
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_image_size
	lw	r2, 0(r2)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_int
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 32
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_char
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_image_size
	lw	r2, 1(r2)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_int
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 32
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_char
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 255
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_print_int
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 10
	j	min_caml_print_char
write_rgb_element.2988:
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_int_of_float
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r3, 255
	bgt	r2, r3, ble_else.7795
	bltz	r2, bge_else.7797
	j	bge_cont.7798
bge_else.7797:
	li	r2, 0
bge_cont.7798:
	j	ble_cont.7796
ble_else.7795:
	li	r2, 255
ble_cont.7796:
	j	min_caml_print_char
write_rgb.2990:
	la	r2, min_caml_rgb
	lwf	f1, 0(r2)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	write_rgb_element.2988
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_rgb
	lwf	f1, 1(r2)
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	write_rgb_element.2988
	addi	r29, r29, 1
	lw	r31, 0(r29)
	la	r2, min_caml_rgb
	lwf	f1, 2(r2)
	j	write_rgb_element.2988
pretrace_diffuse_rays.2992:
	li	r4, 4
	bgt	r3, r4, ble_else.7799
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	get_surface_id.2970
	addi	r29, r29, 3
	lw	r31, -2(r29)
	bltz	r2, bge_else.7800
	lw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	p_calc_diffuse.2699
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, 0(r29)
	lwx	r2, r2, r3
	li	r4, 0
	bne	r2, r4, beq_else.7801
	j	beq_cont.7802
beq_else.7801:
	lw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	p_group_id.2705
	addi	r29, r29, 3
	lw	r31, -2(r29)
	la	r3, min_caml_diffuse_ray
	sw	r2, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	vecbzero.2613
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, -1(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	p_nvectors.2710
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, -1(r29)
	sw	r2, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	p_intersection_points.2695
	addi	r29, r29, 5
	lw	r31, -4(r29)
	la	r3, min_caml_dirvecs
	lw	r4, -2(r29)
	lwx	r3, r3, r4
	lw	r4, 0(r29)
	lw	r5, -3(r29)
	lwx	r5, r5, r4
	lwx	r2, r2, r4
	move	r4, r2
	move	r2, r3
	move	r3, r5
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	trace_diffuse_rays.2946
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, -1(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	p_received_ray_20percent.2703
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r3, 0(r29)
	lwx	r2, r2, r3
	la	r4, min_caml_diffuse_ray
	move	r3, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	veccpy.2615
	addi	r29, r29, 5
	lw	r31, -4(r29)
beq_cont.7802:
	lw	r2, 0(r29)
	addi	r3, r2, 1
	lw	r2, -1(r29)
	j	pretrace_diffuse_rays.2992
bge_else.7800:
	jr	r31
ble_else.7799:
	jr	r31
pretrace_pixels.2995:
	bltz	r3, bge_else.7805
	la	r5, min_caml_scan_pitch
	lwf	f4, 0(r5)
	la	r5, min_caml_image_center
	lw	r5, 0(r5)
	sub	r5, r3, r5
	sw	r4, 0(r29)
	sw	r3, -1(r29)
	sw	r2, -2(r29)
	swf	f3, -3(r29)
	swf	f2, -4(r29)
	swf	f1, -5(r29)
	swf	f4, -6(r29)
	move	r2, r5
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	min_caml_float_of_int
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f2, -6(r29)
	fmul	f1, f2, f1
	la	r2, min_caml_ptrace_dirvec
	la	r3, min_caml_screenx_dir
	lwf	f2, 0(r3)
	fmul	f2, f1, f2
	lwf	f3, -5(r29)
	fadd	f2, f2, f3
	swf	f2, 0(r2)
	la	r2, min_caml_ptrace_dirvec
	la	r3, min_caml_screenx_dir
	lwf	f2, 1(r3)
	fmul	f2, f1, f2
	lwf	f4, -4(r29)
	fadd	f2, f2, f4
	swf	f2, 1(r2)
	la	r2, min_caml_ptrace_dirvec
	la	r3, min_caml_screenx_dir
	lwf	f2, 2(r3)
	fmul	f1, f1, f2
	lwf	f2, -3(r29)
	fadd	f1, f1, f2
	swf	f1, 2(r2)
	la	r2, min_caml_ptrace_dirvec
	li	r3, 0
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	vecunit_sgn.2623
	addi	r29, r29, 8
	lw	r31, -7(r29)
	la	r2, min_caml_rgb
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	vecbzero.2613
	addi	r29, r29, 8
	lw	r31, -7(r29)
	la	r2, min_caml_startp
	la	r3, min_caml_viewpoint
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	veccpy.2615
	addi	r29, r29, 8
	lw	r31, -7(r29)
	li	r2, 0
	fli	f1, 1.
	la	r3, min_caml_ptrace_dirvec
	lw	r4, -1(r29)
	lw	r5, -2(r29)
	lwx	r6, r5, r4
	fli	f2, 0.
	move	r4, r6
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	trace_ray.2932
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -1(r29)
	lw	r3, -2(r29)
	lwx	r4, r3, r2
	move	r2, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	p_rgb.2693
	addi	r29, r29, 8
	lw	r31, -7(r29)
	la	r3, min_caml_rgb
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	veccpy.2615
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -1(r29)
	lw	r3, -2(r29)
	lwx	r4, r3, r2
	lw	r5, 0(r29)
	move	r3, r5
	move	r2, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	p_set_group_id.2707
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -1(r29)
	lw	r3, -2(r29)
	lwx	r4, r3, r2
	li	r5, 0
	move	r3, r5
	move	r2, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	pretrace_diffuse_rays.2992
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -1(r29)
	addi	r2, r2, -1
	li	r3, 1
	lw	r4, 0(r29)
	sw	r2, -7(r29)
	move	r2, r4
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	add_mod5.2602
	addi	r29, r29, 9
	lw	r31, -8(r29)
	move	r4, r2
	lwf	f1, -5(r29)
	lwf	f2, -4(r29)
	lwf	f3, -3(r29)
	lw	r2, -2(r29)
	lw	r3, -7(r29)
	j	pretrace_pixels.2995
bge_else.7805:
	jr	r31
pretrace_line.3002:
	la	r5, min_caml_scan_pitch
	lwf	f1, 0(r5)
	la	r5, min_caml_image_center
	lw	r5, 1(r5)
	sub	r3, r3, r5
	sw	r4, 0(r29)
	sw	r2, -1(r29)
	swf	f1, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_float_of_int
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lwf	f2, -2(r29)
	fmul	f1, f2, f1
	la	r2, min_caml_screeny_dir
	lwf	f2, 0(r2)
	fmul	f2, f1, f2
	la	r2, min_caml_screenz_dir
	lwf	f3, 0(r2)
	fadd	f2, f2, f3
	la	r2, min_caml_screeny_dir
	lwf	f3, 1(r2)
	fmul	f3, f1, f3
	la	r2, min_caml_screenz_dir
	lwf	f4, 1(r2)
	fadd	f3, f3, f4
	la	r2, min_caml_screeny_dir
	lwf	f4, 2(r2)
	fmul	f1, f1, f4
	la	r2, min_caml_screenz_dir
	lwf	f4, 2(r2)
	fadd	f1, f1, f4
	la	r2, min_caml_image_size
	lw	r2, 0(r2)
	addi	r3, r2, -1
	lw	r2, -1(r29)
	lw	r4, 0(r29)
	fmove	f31, f3
	fmove	f3, f1
	fmove	f1, f2
	fmove	f2, f31
	j	pretrace_pixels.2995
scan_pixel.3006:
	la	r7, min_caml_image_size
	lw	r7, 0(r7)
	bgt	r7, r2, ble_else.7807
	jr	r31
ble_else.7807:
	la	r7, min_caml_rgb
	lwx	r8, r5, r2
	sw	r4, 0(r29)
	sw	r5, -1(r29)
	sw	r6, -2(r29)
	sw	r3, -3(r29)
	sw	r2, -4(r29)
	sw	r7, -5(r29)
	move	r2, r8
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	p_rgb.2693
	addi	r29, r29, 7
	lw	r31, -6(r29)
	move	r3, r2
	lw	r2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	veccpy.2615
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -4(r29)
	lw	r3, -3(r29)
	lw	r4, -2(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	neighbors_exist.2966
	addi	r29, r29, 7
	lw	r31, -6(r29)
	li	r3, 0
	bne	r2, r3, beq_else.7809
	lw	r2, -4(r29)
	lw	r3, -1(r29)
	lwx	r4, r3, r2
	li	r5, 0
	move	r3, r5
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	do_without_neighbors.2963
	addi	r29, r29, 7
	lw	r31, -6(r29)
	j	beq_cont.7810
beq_else.7809:
	li	r7, 0
	lw	r2, -4(r29)
	lw	r3, -3(r29)
	lw	r4, 0(r29)
	lw	r5, -1(r29)
	lw	r6, -2(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	try_exploit_neighbors.2979
	addi	r29, r29, 7
	lw	r31, -6(r29)
beq_cont.7810:
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	write_rgb.2990
	addi	r29, r29, 7
	lw	r31, -6(r29)
	lw	r2, -4(r29)
	addi	r2, r2, 1
	lw	r3, -3(r29)
	lw	r4, 0(r29)
	lw	r5, -1(r29)
	lw	r6, -2(r29)
	j	scan_pixel.3006
scan_line.3012:
	la	r7, min_caml_image_size
	lw	r7, 1(r7)
	bgt	r7, r2, ble_else.7811
	jr	r31
ble_else.7811:
	la	r7, min_caml_image_size
	lw	r7, 1(r7)
	addi	r7, r7, -1
	sw	r6, 0(r29)
	sw	r5, -1(r29)
	sw	r4, -2(r29)
	sw	r3, -3(r29)
	sw	r2, -4(r29)
	bgt	r7, r2, ble_else.7813
	j	ble_cont.7814
ble_else.7813:
	addi	r7, r2, 1
	move	r4, r6
	move	r3, r7
	move	r2, r5
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	pretrace_line.3002
	addi	r29, r29, 6
	lw	r31, -5(r29)
ble_cont.7814:
	li	r2, 0
	lw	r3, -4(r29)
	lw	r4, -3(r29)
	lw	r5, -2(r29)
	lw	r6, -1(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	scan_pixel.3006
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -4(r29)
	addi	r2, r2, 1
	li	r3, 2
	lw	r4, 0(r29)
	sw	r2, -5(r29)
	move	r2, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	add_mod5.2602
	addi	r29, r29, 7
	lw	r31, -6(r29)
	move	r6, r2
	lw	r2, -5(r29)
	lw	r3, -2(r29)
	lw	r4, -1(r29)
	lw	r5, -3(r29)
	j	scan_line.3012
create_float5x3array.3018:
	li	r2, 3
	fli	f1, 0.
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_create_float_array
	addi	r29, r29, 1
	lw	r31, 0(r29)
	move	r3, r2
	li	r2, 5
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_create_array
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r3, 3
	fli	f1, 0.
	sw	r2, 0(r29)
	move	r2, r3
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_float_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	sw	r2, 1(r3)
	li	r2, 3
	fli	f1, 0.
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_float_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	sw	r2, 2(r3)
	li	r2, 3
	fli	f1, 0.
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_float_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	sw	r2, 3(r3)
	li	r2, 3
	fli	f1, 0.
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_float_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r3, 0(r29)
	sw	r2, 4(r3)
	move	r2, r3
	jr	r31
create_pixel.3020:
	li	r2, 3
	fli	f1, 0.
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_create_float_array
	addi	r29, r29, 1
	lw	r31, 0(r29)
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	create_float5x3array.3018
	addi	r29, r29, 2
	lw	r31, -1(r29)
	li	r3, 5
	li	r4, 0
	sw	r2, -1(r29)
	move	r2, r3
	move	r3, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_create_array
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 5
	li	r4, 0
	sw	r2, -2(r29)
	move	r2, r3
	move	r3, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_create_array
	addi	r29, r29, 4
	lw	r31, -3(r29)
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	create_float5x3array.3018
	addi	r29, r29, 5
	lw	r31, -4(r29)
	sw	r2, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	create_float5x3array.3018
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 1
	li	r4, 0
	sw	r2, -5(r29)
	move	r2, r3
	move	r3, r4
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	min_caml_create_array
	addi	r29, r29, 7
	lw	r31, -6(r29)
	sw	r2, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	create_float5x3array.3018
	addi	r29, r29, 8
	lw	r31, -7(r29)
	move	r3, r30
	addi	r30, r30, 8
	sw	r2, 7(r3)
	lw	r2, -6(r29)
	sw	r2, 6(r3)
	lw	r2, -5(r29)
	sw	r2, 5(r3)
	lw	r2, -4(r29)
	sw	r2, 4(r3)
	lw	r2, -3(r29)
	sw	r2, 3(r3)
	lw	r2, -2(r29)
	sw	r2, 2(r3)
	lw	r2, -1(r29)
	sw	r2, 1(r3)
	lw	r2, 0(r29)
	sw	r2, 0(r3)
	move	r2, r3
	jr	r31
init_line_elements.3022:
	bltz	r3, bge_else.7815
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	create_pixel.3020
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, 0(r29)
	lw	r4, -1(r29)
	swx	r2, r4, r3
	addi	r3, r3, -1
	move	r2, r4
	j	init_line_elements.3022
bge_else.7815:
	jr	r31
create_pixelline.3025:
	la	r2, min_caml_image_size
	lw	r2, 0(r2)
	sw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	create_pixel.3020
	addi	r29, r29, 2
	lw	r31, -1(r29)
	move	r3, r2
	lw	r2, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	la	r3, min_caml_image_size
	lw	r3, 0(r3)
	addi	r3, r3, -2
	j	init_line_elements.3022
tan.3027:
	swf	f1, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_sin
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lwf	f2, 0(r29)
	swf	f1, -1(r29)
	fmove	f1, f2
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_cos
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, -1(r29)
	fdiv	f1, f2, f1
	jr	r31
adjust_position.3029:
	fmul	f1, f1, f1
	fli	f3, 0.1
	fadd	f1, f1, f3
	fsqrt	f1, f1
	fli	f3, 1.
	fdiv	f3, f3, f1
	swf	f1, 0(r29)
	swf	f2, -1(r29)
	fmove	f1, f3
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_atan
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, -1(r29)
	fmul	f1, f1, f2
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	tan.3027
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, 0(r29)
	fmul	f1, f1, f2
	jr	r31
calc_dirvec.3032:
	li	r5, 5
	bgt	r5, r2, ble_else.7816
	fmul	f3, f1, f1
	fmul	f4, f2, f2
	fadd	f3, f3, f4
	fli	f4, 1.
	fadd	f3, f3, f4
	fsqrt	f3, f3
	fdiv	f1, f1, f3
	fdiv	f2, f2, f3
	fli	f4, 1.
	fdiv	f3, f4, f3
	la	r2, min_caml_dirvecs
	lwx	r2, r2, r3
	lwx	r3, r2, r4
	sw	r2, 0(r29)
	sw	r4, -1(r29)
	swf	f3, -2(r29)
	swf	f2, -3(r29)
	swf	f1, -4(r29)
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -4(r29)
	lwf	f2, -3(r29)
	lwf	f3, -2(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	vecset.2605
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	addi	r3, r2, 40
	lw	r4, 0(r29)
	lwx	r3, r4, r3
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -3(r29)
	fneg	f3, f1
	lwf	f2, -4(r29)
	lwf	f4, -2(r29)
	fmove	f1, f2
	fmove	f2, f4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	vecset.2605
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	addi	r3, r2, 80
	lw	r4, 0(r29)
	lwx	r3, r4, r3
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -4(r29)
	fneg	f2, f1
	lwf	f3, -3(r29)
	fneg	f4, f3
	lwf	f5, -2(r29)
	fmove	f3, f4
	fmove	f1, f5
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	vecset.2605
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	addi	r3, r2, 1
	lw	r4, 0(r29)
	lwx	r3, r4, r3
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -4(r29)
	fneg	f2, f1
	lwf	f3, -3(r29)
	fneg	f4, f3
	lwf	f5, -2(r29)
	fneg	f6, f5
	fmove	f3, f6
	fmove	f1, f2
	fmove	f2, f4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	vecset.2605
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	addi	r3, r2, 41
	lw	r4, 0(r29)
	lwx	r3, r4, r3
	move	r2, r3
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -4(r29)
	fneg	f2, f1
	lwf	f3, -2(r29)
	fneg	f4, f3
	lwf	f5, -3(r29)
	fmove	f3, f5
	fmove	f1, f2
	fmove	f2, f4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	vecset.2605
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lw	r2, -1(r29)
	addi	r2, r2, 81
	lw	r3, 0(r29)
	lwx	r2, r3, r2
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	lwf	f1, -2(r29)
	fneg	f1, f1
	lwf	f2, -4(r29)
	lwf	f3, -3(r29)
	j	vecset.2605
ble_else.7816:
	swf	f3, -5(r29)
	sw	r4, -1(r29)
	sw	r3, -6(r29)
	swf	f4, -7(r29)
	sw	r2, -8(r29)
	fmove	f1, f2
	fmove	f2, f3
	sw	r31, -9(r29)
	addi	r29, r29, -10
	jal	adjust_position.3029
	addi	r29, r29, 10
	lw	r31, -9(r29)
	lw	r2, -8(r29)
	addi	r2, r2, 1
	lwf	f2, -7(r29)
	swf	f1, -9(r29)
	sw	r2, -10(r29)
	sw	r31, -11(r29)
	addi	r29, r29, -12
	jal	adjust_position.3029
	addi	r29, r29, 12
	lw	r31, -11(r29)
	fmove	f2, f1
	lwf	f1, -9(r29)
	lwf	f3, -5(r29)
	lwf	f4, -7(r29)
	lw	r2, -10(r29)
	lw	r3, -6(r29)
	lw	r4, -1(r29)
	j	calc_dirvec.3032
calc_dirvecs.3040:
	bltz	r2, bge_else.7817
	sw	r2, 0(r29)
	swf	f1, -1(r29)
	sw	r4, -2(r29)
	sw	r3, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_float_of_int
	addi	r29, r29, 5
	lw	r31, -4(r29)
	fli	f2, 0.2
	fmul	f1, f1, f2
	fli	f2, 0.9
	fsub	f3, f1, f2
	li	r2, 0
	fli	f1, 0.
	fli	f2, 0.
	lwf	f4, -1(r29)
	lw	r3, -3(r29)
	lw	r4, -2(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	calc_dirvec.3032
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, 0(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	min_caml_float_of_int
	addi	r29, r29, 5
	lw	r31, -4(r29)
	fli	f2, 0.2
	fmul	f1, f1, f2
	fli	f2, 0.1
	fadd	f3, f1, f2
	li	r2, 0
	fli	f1, 0.
	fli	f2, 0.
	lw	r3, -2(r29)
	addi	r4, r3, 2
	lwf	f4, -1(r29)
	lw	r5, -3(r29)
	move	r3, r5
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	calc_dirvec.3032
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lw	r2, 0(r29)
	addi	r2, r2, -1
	li	r3, 1
	lw	r4, -3(r29)
	sw	r2, -4(r29)
	move	r2, r4
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	add_mod5.2602
	addi	r29, r29, 6
	lw	r31, -5(r29)
	move	r3, r2
	lwf	f1, -1(r29)
	lw	r2, -4(r29)
	lw	r4, -2(r29)
	j	calc_dirvecs.3040
bge_else.7817:
	jr	r31
calc_dirvec_rows.3045:
	bltz	r2, bge_else.7819
	sw	r2, 0(r29)
	sw	r4, -1(r29)
	sw	r3, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_float_of_int
	addi	r29, r29, 4
	lw	r31, -3(r29)
	fli	f2, 0.2
	fmul	f1, f1, f2
	fli	f2, 0.9
	fsub	f1, f1, f2
	li	r2, 4
	lw	r3, -2(r29)
	lw	r4, -1(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	calc_dirvecs.3040
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, 0(r29)
	addi	r2, r2, -1
	li	r3, 2
	lw	r4, -2(r29)
	sw	r2, -3(r29)
	move	r2, r4
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	add_mod5.2602
	addi	r29, r29, 5
	lw	r31, -4(r29)
	move	r3, r2
	lw	r2, -1(r29)
	addi	r4, r2, 4
	lw	r2, -3(r29)
	j	calc_dirvec_rows.3045
bge_else.7819:
	jr	r31
create_dirvec.3049:
	li	r2, 3
	fli	f1, 0.
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	min_caml_create_float_array
	addi	r29, r29, 1
	lw	r31, 0(r29)
	move	r3, r2
	la	r2, min_caml_n_objects
	lw	r2, 0(r2)
	sw	r3, 0(r29)
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	min_caml_create_array
	addi	r29, r29, 2
	lw	r31, -1(r29)
	move	r3, r30
	addi	r30, r30, 6
	sw	r2, 1(r3)
	lw	r2, 0(r29)
	sw	r2, 0(r3)
	move	r2, r3
	jr	r31
create_dirvec_elements.3051:
	bltz	r3, bge_else.7821
	sw	r3, 0(r29)
	sw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	create_dirvec.3049
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r3, 0(r29)
	lw	r4, -1(r29)
	swx	r2, r4, r3
	addi	r3, r3, -1
	move	r2, r4
	j	create_dirvec_elements.3051
bge_else.7821:
	jr	r31
create_dirvecs.3054:
	bltz	r2, bge_else.7823
	la	r3, min_caml_dirvecs
	li	r4, 120
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	sw	r4, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	create_dirvec.3049
	addi	r29, r29, 4
	lw	r31, -3(r29)
	move	r3, r2
	lw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	min_caml_create_array
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r3, 0(r29)
	lw	r4, -1(r29)
	swx	r2, r4, r3
	la	r2, min_caml_dirvecs
	lwx	r2, r2, r3
	li	r4, 118
	move	r3, r4
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	create_dirvec_elements.3051
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lw	r2, 0(r29)
	addi	r2, r2, -1
	j	create_dirvecs.3054
bge_else.7823:
	jr	r31
init_dirvec_constants.3056:
	bltz	r3, bge_else.7825
	lwx	r4, r2, r3
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	move	r2, r4
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	setup_dirvec_constants.2841
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lw	r2, -1(r29)
	addi	r3, r2, -1
	lw	r2, 0(r29)
	j	init_dirvec_constants.3056
bge_else.7825:
	jr	r31
init_vecset_constants.3059:
	bltz	r2, bge_else.7827
	la	r3, min_caml_dirvecs
	lwx	r3, r3, r2
	li	r4, 119
	sw	r2, 0(r29)
	move	r2, r3
	move	r3, r4
	sw	r31, -1(r29)
	addi	r29, r29, -2
	jal	init_dirvec_constants.3056
	addi	r29, r29, 2
	lw	r31, -1(r29)
	lw	r2, 0(r29)
	addi	r2, r2, -1
	j	init_vecset_constants.3059
bge_else.7827:
	jr	r31
init_dirvecs.3061:
	li	r2, 4
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	create_dirvecs.3054
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 9
	li	r3, 0
	li	r4, 0
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	calc_dirvec_rows.3045
	addi	r29, r29, 1
	lw	r31, 0(r29)
	li	r2, 4
	j	init_vecset_constants.3059
add_reflection.3063:
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	swf	f1, -2(r29)
	swf	f4, -3(r29)
	swf	f3, -4(r29)
	swf	f2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	create_dirvec.3049
	addi	r29, r29, 7
	lw	r31, -6(r29)
	sw	r2, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	d_vec.2712
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lwf	f1, -5(r29)
	lwf	f2, -4(r29)
	lwf	f3, -3(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	vecset.2605
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, -6(r29)
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	setup_dirvec_constants.2841
	addi	r29, r29, 8
	lw	r31, -7(r29)
	la	r2, min_caml_reflections
	move	r3, r30
	addi	r30, r30, 11
	lwf	f1, -2(r29)
	swf	f1, 6(r3)
	lw	r4, -6(r29)
	sw	r4, 1(r3)
	lw	r4, -1(r29)
	sw	r4, 0(r3)
	lw	r4, 0(r29)
	swx	r3, r2, r4
	jr	r31
setup_rect_reflection.3070:
	li	r4, 4
	mul	r2, r4
	mflo	r2
	la	r4, min_caml_n_reflections
	lw	r4, 0(r4)
	fli	f1, 1.
	sw	r4, 0(r29)
	sw	r2, -1(r29)
	swf	f1, -2(r29)
	move	r2, r3
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	o_diffuse.2675
	addi	r29, r29, 4
	lw	r31, -3(r29)
	lwf	f2, -2(r29)
	fsub	f1, f2, f1
	la	r2, min_caml_light
	lwf	f2, 0(r2)
	fneg	f2, f2
	la	r2, min_caml_light
	lwf	f3, 1(r2)
	fneg	f3, f3
	la	r2, min_caml_light
	lwf	f4, 2(r2)
	fneg	f4, f4
	lw	r2, -1(r29)
	addi	r3, r2, 1
	la	r4, min_caml_light
	lwf	f5, 0(r4)
	lw	r4, 0(r29)
	swf	f3, -3(r29)
	swf	f4, -4(r29)
	swf	f2, -5(r29)
	swf	f1, -6(r29)
	move	r2, r4
	fmove	f2, f5
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	add_reflection.3063
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, 0(r29)
	addi	r3, r2, 1
	lw	r4, -1(r29)
	addi	r5, r4, 2
	la	r6, min_caml_light
	lwf	f3, 1(r6)
	lwf	f1, -6(r29)
	lwf	f2, -5(r29)
	lwf	f4, -4(r29)
	move	r2, r3
	move	r3, r5
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	add_reflection.3063
	addi	r29, r29, 8
	lw	r31, -7(r29)
	lw	r2, 0(r29)
	addi	r3, r2, 2
	lw	r4, -1(r29)
	addi	r4, r4, 3
	la	r5, min_caml_light
	lwf	f4, 2(r5)
	lwf	f1, -6(r29)
	lwf	f2, -5(r29)
	lwf	f3, -3(r29)
	move	r2, r3
	move	r3, r4
	sw	r31, -7(r29)
	addi	r29, r29, -8
	jal	add_reflection.3063
	addi	r29, r29, 8
	lw	r31, -7(r29)
	la	r2, min_caml_n_reflections
	lw	r3, 0(r29)
	addi	r3, r3, 3
	sw	r3, 0(r2)
	jr	r31
setup_surface_reflection.3073:
	li	r4, 4
	mul	r2, r4
	mflo	r2
	addi	r2, r2, 1
	la	r4, min_caml_n_reflections
	lw	r4, 0(r4)
	fli	f1, 1.
	sw	r2, 0(r29)
	sw	r4, -1(r29)
	sw	r3, -2(r29)
	swf	f1, -3(r29)
	move	r2, r3
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	o_diffuse.2675
	addi	r29, r29, 5
	lw	r31, -4(r29)
	lwf	f2, -3(r29)
	fsub	f1, f2, f1
	la	r2, min_caml_light
	lw	r3, -2(r29)
	swf	f1, -4(r29)
	sw	r2, -5(r29)
	move	r2, r3
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	o_param_abc.2667
	addi	r29, r29, 7
	lw	r31, -6(r29)
	move	r3, r2
	lw	r2, -5(r29)
	sw	r31, -6(r29)
	addi	r29, r29, -7
	jal	veciprod.2626
	addi	r29, r29, 7
	lw	r31, -6(r29)
	fli	f2, 2.
	lw	r2, -2(r29)
	swf	f1, -6(r29)
	swf	f2, -7(r29)
	sw	r31, -8(r29)
	addi	r29, r29, -9
	jal	o_param_a.2661
	addi	r29, r29, 9
	lw	r31, -8(r29)
	lwf	f2, -7(r29)
	fmul	f1, f2, f1
	lwf	f2, -6(r29)
	fmul	f1, f1, f2
	la	r2, min_caml_light
	lwf	f3, 0(r2)
	fsub	f1, f1, f3
	fli	f3, 2.
	lw	r2, -2(r29)
	swf	f1, -8(r29)
	swf	f3, -9(r29)
	sw	r31, -10(r29)
	addi	r29, r29, -11
	jal	o_param_b.2663
	addi	r29, r29, 11
	lw	r31, -10(r29)
	lwf	f2, -9(r29)
	fmul	f1, f2, f1
	lwf	f2, -6(r29)
	fmul	f1, f1, f2
	la	r2, min_caml_light
	lwf	f3, 1(r2)
	fsub	f1, f1, f3
	fli	f3, 2.
	lw	r2, -2(r29)
	swf	f1, -10(r29)
	swf	f3, -11(r29)
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	o_param_c.2665
	addi	r29, r29, 13
	lw	r31, -12(r29)
	lwf	f2, -11(r29)
	fmul	f1, f2, f1
	lwf	f2, -6(r29)
	fmul	f1, f1, f2
	la	r2, min_caml_light
	lwf	f2, 2(r2)
	fsub	f4, f1, f2
	lwf	f1, -4(r29)
	lwf	f2, -8(r29)
	lwf	f3, -10(r29)
	lw	r2, -1(r29)
	lw	r3, 0(r29)
	sw	r31, -12(r29)
	addi	r29, r29, -13
	jal	add_reflection.3063
	addi	r29, r29, 13
	lw	r31, -12(r29)
	la	r2, min_caml_n_reflections
	lw	r3, -1(r29)
	addi	r3, r3, 1
	sw	r3, 0(r2)
	jr	r31
setup_reflections.3076:
	bltz	r2, bge_else.7832
	la	r3, min_caml_objects
	lwx	r3, r3, r2
	sw	r2, 0(r29)
	sw	r3, -1(r29)
	move	r2, r3
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_reflectiontype.2655
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 2
	bne	r2, r3, beq_else.7833
	lw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_diffuse.2675
	addi	r29, r29, 3
	lw	r31, -2(r29)
	fli	f2, 1.
	fclt	r2, f1, f2
	li	r3, 0
	bne	r2, r3, beq_else.7834
	jr	r31
beq_else.7834:
	lw	r2, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	o_form.2653
	addi	r29, r29, 3
	lw	r31, -2(r29)
	li	r3, 1
	bne	r2, r3, beq_else.7836
	lw	r2, 0(r29)
	lw	r3, -1(r29)
	j	setup_rect_reflection.3070
beq_else.7836:
	li	r3, 2
	bne	r2, r3, beq_else.7837
	lw	r2, 0(r29)
	lw	r3, -1(r29)
	j	setup_surface_reflection.3073
beq_else.7837:
	jr	r31
beq_else.7833:
	jr	r31
bge_else.7832:
	jr	r31
rt.3078:
	la	r4, min_caml_image_size
	sw	r2, 0(r4)
	la	r4, min_caml_image_size
	sw	r3, 1(r4)
	la	r4, min_caml_image_center
	li	r5, 2
	div	r2, r5
	mfhi	r5
	sw	r5, 0(r4)
	la	r4, min_caml_image_center
	li	r5, 2
	div	r3, r5
	mfhi	r3
	sw	r3, 1(r4)
	la	r3, min_caml_scan_pitch
	fli	f1, 128.
	sw	r3, 0(r29)
	swf	f1, -1(r29)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	min_caml_float_of_int
	addi	r29, r29, 3
	lw	r31, -2(r29)
	lwf	f2, -1(r29)
	fdiv	f1, f2, f1
	lw	r2, 0(r29)
	swf	f1, 0(r2)
	sw	r31, -2(r29)
	addi	r29, r29, -3
	jal	create_pixelline.3025
	addi	r29, r29, 3
	lw	r31, -2(r29)
	sw	r2, -2(r29)
	sw	r31, -3(r29)
	addi	r29, r29, -4
	jal	create_pixelline.3025
	addi	r29, r29, 4
	lw	r31, -3(r29)
	sw	r2, -3(r29)
	sw	r31, -4(r29)
	addi	r29, r29, -5
	jal	create_pixelline.3025
	addi	r29, r29, 5
	lw	r31, -4(r29)
	sw	r2, -4(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	read_parameter.2743
	addi	r29, r29, 6
	lw	r31, -5(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	write_ppm_header.2986
	addi	r29, r29, 6
	lw	r31, -5(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	init_dirvecs.3061
	addi	r29, r29, 6
	lw	r31, -5(r29)
	la	r2, min_caml_light_dirvec
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	d_vec.2712
	addi	r29, r29, 6
	lw	r31, -5(r29)
	la	r3, min_caml_light
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	veccpy.2615
	addi	r29, r29, 6
	lw	r31, -5(r29)
	la	r2, min_caml_light_dirvec
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	setup_dirvec_constants.2841
	addi	r29, r29, 6
	lw	r31, -5(r29)
	la	r2, min_caml_n_objects
	lw	r2, 0(r2)
	addi	r2, r2, -1
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	setup_reflections.3076
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r3, 0
	li	r4, 0
	lw	r2, -3(r29)
	sw	r31, -5(r29)
	addi	r29, r29, -6
	jal	pretrace_line.3002
	addi	r29, r29, 6
	lw	r31, -5(r29)
	li	r2, 0
	li	r6, 2
	lw	r3, -2(r29)
	lw	r4, -3(r29)
	lw	r5, -4(r29)
	j	scan_line.3012
_min_caml_start: # main entry point
   # main program start
	li	r2, 128
	li	r3, 128
	sw	r31, 0(r29)
	addi	r29, r29, -1
	jal	rt.3078
	addi	r29, r29, 1
	lw	r31, 0(r29)
   # main program end
	halt
