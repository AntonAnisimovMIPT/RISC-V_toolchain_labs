	.file	"quadratic_equation_solver.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	addi	sp,sp,-80
	sd	ra,72(sp)
	fsd	fs0,56(sp)
	fsd	fs1,48(sp)
	fsd	fs2,40(sp)
	fsd	fs3,32(sp)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	addi	a3,sp,8
	addi	a2,sp,16
	addi	a1,sp,24
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	call	__isoc99_scanf
	fld	fs1,16(sp)
	fld	fs0,24(sp)
	fmul.d	fs2,fs1,fs1
	lui	a5,%hi(.LC2)
	fld	fa5,%lo(.LC2)(a5)
	fmul.d	fa5,fs0,fa5
	fld	fa4,8(sp)
	fmul.d	fa5,fa5,fa4
	fsub.d	fs2,fs2,fa5
	fmv.d.x	fa5,zero
	fgt.d	a5,fs2,fa5
	bne	a5,zero,.L9
	fmv.d.x	fa5,zero
	feq.d	a5,fs2,fa5
	beq	a5,zero,.L5
	fneg.d	fa5,fs1
	fadd.d	fs0,fs0,fs0
	fdiv.d	fa5,fa5,fs0
	fmv.x.d	a1,fa5
	lui	a0,%hi(.LC4)
	addi	a0,a0,%lo(.LC4)
	call	printf
	j	.L4
.L9:
	fmv.d	fa0,fs2
	call	sqrt
	fmv.d	fs3,fa0
	fadd.d	fs0,fs0,fs0
	fmv.d	fa0,fs2
	call	sqrt
	fneg.d	fa5,fs1
	fsub.d	fa5,fa5,fa0
	fsub.d	fs3,fs3,fs1
	fdiv.d	fa5,fa5,fs0
	fmv.x.d	a2,fa5
	fdiv.d	fa5,fs3,fs0
	fmv.x.d	a1,fa5
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
.L4:
	li	a0,0
	ld	ra,72(sp)
	fld	fs0,56(sp)
	fld	fs1,48(sp)
	fld	fs2,40(sp)
	fld	fs3,32(sp)
	addi	sp,sp,80
	jr	ra
.L5:
	fadd.d	fs0,fs0,fs0
	fneg.d	fa5,fs1
	fdiv.d	fs1,fa5,fs0
	fneg.d	fa0,fs2
	call	sqrt
	fdiv.d	fa5,fa0,fs0
	fmv.x.d	a2,fa5
	fmv.x.d	a4,fa5
	fmv.x.d	a3,fs1
	fmv.x.d	a1,fs1
	lui	a0,%hi(.LC5)
	addi	a0,a0,%lo(.LC5)
	call	printf
	j	.L4
	.size	main, .-main
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	0
	.word	1074790400
	.ident	"GCC: () 12.2.1 20221101"
	.section	.note.GNU-stack,"",@progbits
