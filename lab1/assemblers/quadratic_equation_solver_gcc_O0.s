	.file	"quadratic_equation_solver.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"Input a, b, c (in format a b c): "
	.align	3
.LC1:
	.string	"%lf %lf %lf"
	.align	3
.LC3:
	.string	"two real roots: %.2f and %.2f\n"
	.align	3
.LC4:
	.string	"one real root: %.2f\n"
	.align	3
.LC5:
	.string	"two complex roots: %.2f + %.2fi and %.2f - %.2fi\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	fsd	fs0,72(sp)
	addi	s0,sp,96
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	printf
	addi	a3,s0,-96
	addi	a4,s0,-88
	addi	a5,s0,-80
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	__isoc99_scanf
	fld	fa4,-88(s0)
	fld	fa5,-88(s0)
	fmul.d	fa4,fa4,fa5
	fld	fa3,-80(s0)
	lui	a5,%hi(.LC2)
	fld	fa5,%lo(.LC2)(a5)
	fmul.d	fa3,fa3,fa5
	fld	fa5,-96(s0)
	fmul.d	fa5,fa3,fa5
	fsub.d	fa5,fa4,fa5
	fsd	fa5,-40(s0)
	fld	fa5,-40(s0)
	fmv.d.x	fa4,zero
	fgt.d	a5,fa5,fa4
	beq	a5,zero,.L8
	fld	fa0,-40(s0)
	call	sqrt
	fmv.d	fa4,fa0
	fld	fa5,-88(s0)
	fsub.d	fa4,fa4,fa5
	fld	fa5,-80(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-72(s0)
	fld	fa5,-88(s0)
	fneg.d	fs0,fa5
	fld	fa0,-40(s0)
	call	sqrt
	fmv.d	fa5,fa0
	fsub.d	fa4,fs0,fa5
	fld	fa5,-80(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-64(s0)
	ld	a2,-64(s0)
	ld	a1,-72(s0)
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	j	.L4
.L8:
	fld	fa5,-40(s0)
	fmv.d.x	fa4,zero
	feq.d	a5,fa5,fa4
	beq	a5,zero,.L5
	fld	fa5,-88(s0)
	fneg.d	fa4,fa5
	fld	fa5,-80(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-64(s0)
	fld	fa5,-64(s0)
	fsd	fa5,-72(s0)
	ld	a1,-72(s0)
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	j	.L4
.L5:
	fld	fa5,-88(s0)
	fneg.d	fa4,fa5
	fld	fa5,-80(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	fld	fa5,-40(s0)
	fneg.d	fa5,fa5
	fmv.d	fa0,fa5
	call	sqrt
	fmv.d	fa4,fa0
	fld	fa5,-80(s0)
	fadd.d	fa5,fa5,fa5
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-56(s0)
	ld	a4,-56(s0)
	ld	a3,-48(s0)
	ld	a2,-56(s0)
	ld	a1,-48(s0)
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
.L4:
	li	a5,0
	mv	a0,a5
	ld	ra,88(sp)
	ld	s0,80(sp)
	fld	fs0,72(sp)
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC2:
	.word	0
	.word	1074790400
	.ident	"GCC: () 12.2.1 20221101"
	.section	.note.GNU-stack,"",@progbits
