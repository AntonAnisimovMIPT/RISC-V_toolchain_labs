	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.file	"quadratic_equation_solver.c"
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function main
.LCPI0_0:
	.quad	0xc010000000000000              # double -4
	.text
	.globl	main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sd	ra, 104(sp)                     # 8-byte Folded Spill
	sd	s0, 96(sp)                      # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
	li	a0, 0
	sw	a0, -20(s0)
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	call	printf@plt
.Lpcrel_hi1:
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi1)
	addi	a1, s0, -32
	addi	a2, s0, -40
	addi	a3, s0, -48
	call	__isoc99_scanf@plt
	fld	fa5, -40(s0)
	fld	fa4, -32(s0)
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(.LCPI0_0)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi2)
	fld	fa3, 0(a0)
	fmul.d	fa4, fa4, fa3
	fld	fa3, -48(s0)
	fmul.d	fa4, fa4, fa3
	fmadd.d	fa5, fa5, fa5, fa4
	fsd	fa5, -56(s0)
	fld	fa4, -56(s0)
	fmv.d.x	fa5, zero
	flt.d	a0, fa5, fa4
	beqz	a0, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	fld	fa5, -40(s0)
	fsd	fa5, -104(s0)                   # 8-byte Folded Spill
	fld	fa0, -56(s0)
	call	sqrt@plt
	fld	fa5, -104(s0)                   # 8-byte Folded Reload
	fsub.d	fa5, fa0, fa5
	fld	fa4, -32(s0)
	fadd.d	fa4, fa4, fa4
	fdiv.d	fa5, fa5, fa4
	fsd	fa5, -64(s0)
	fld	fa5, -40(s0)
	fneg.d	fa5, fa5
	fsd	fa5, -96(s0)                    # 8-byte Folded Spill
	fld	fa0, -56(s0)
	call	sqrt@plt
	fld	fa5, -96(s0)                    # 8-byte Folded Reload
	fsub.d	fa5, fa5, fa0
	fld	fa4, -32(s0)
	fadd.d	fa4, fa4, fa4
	fdiv.d	fa5, fa5, fa4
	fsd	fa5, -72(s0)
	ld	a2, -72(s0)
	ld	a1, -64(s0)
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
	call	printf@plt
	j	.LBB0_6
.LBB0_2:
	fld	fa5, -56(s0)
	fmv.d.x	fa4, zero
	feq.d	a0, fa5, fa4
	beqz	a0, .LBB0_4
	j	.LBB0_3
.LBB0_3:
	fld	fa5, -40(s0)
	fneg.d	fa5, fa5
	fld	fa4, -32(s0)
	fadd.d	fa4, fa4, fa4
	fdiv.d	fa5, fa5, fa4
	fsd	fa5, -72(s0)
	fsd	fa5, -64(s0)
	ld	a1, -64(s0)
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.L.str.3)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	call	printf@plt
	j	.LBB0_5
.LBB0_4:
	fld	fa5, -40(s0)
	fneg.d	fa5, fa5
	fld	fa4, -32(s0)
	fadd.d	fa4, fa4, fa4
	fdiv.d	fa5, fa5, fa4
	fsd	fa5, -80(s0)
	fld	fa5, -56(s0)
	fneg.d	fa0, fa5
	call	sqrt@plt
	fld	fa5, -32(s0)
	fadd.d	fa5, fa5, fa5
	fdiv.d	fa5, fa0, fa5
	fsd	fa5, -88(s0)
	ld	a4, -88(s0)
	ld	a3, -80(s0)
.Lpcrel_hi5:
	auipc	a0, %pcrel_hi(.L.str.4)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi5)
	mv	a1, a3
	mv	a2, a4
	call	printf@plt
	j	.LBB0_5
.LBB0_5:
	j	.LBB0_6
.LBB0_6:
	li	a0, 0
	ld	ra, 104(sp)                     # 8-byte Folded Reload
	ld	s0, 96(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Input a, b, c (in format a b c): "
	.size	.L.str, 34

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"%lf %lf %lf"
	.size	.L.str.1, 12

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"two real roots: %.2f and %.2f\n"
	.size	.L.str.2, 31

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"one real root: %.2f\n"
	.size	.L.str.3, 21

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"two complex roots: %.2f + %.2fi and %.2f - %.2fi\n"
	.size	.L.str.4, 50

	.ident	"Syntacore clang version 17.0.0 (SC git:/tools/llvm/llvm-project/ 8e902e1e697c9e34f6e4e91bf560a764435008a2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
	.addrsig_sym __isoc99_scanf
	.addrsig_sym sqrt
