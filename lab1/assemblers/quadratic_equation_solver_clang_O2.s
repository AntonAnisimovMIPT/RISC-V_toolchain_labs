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
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	fsd	fs0, 56(sp)                     # 8-byte Folded Spill
	fsd	fs1, 48(sp)                     # 8-byte Folded Spill
	fsd	fs2, 40(sp)                     # 8-byte Folded Spill
	fsd	fs3, 32(sp)                     # 8-byte Folded Spill
	.cfi_offset ra, -8
	.cfi_offset s0, -16
	.cfi_offset fs0, -24
	.cfi_offset fs1, -32
	.cfi_offset fs2, -40
	.cfi_offset fs3, -48
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	call	printf@plt
.Lpcrel_hi1:
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a1, sp, 24
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi1)
	addi	a2, sp, 16
	addi	a3, sp, 8
	call	__isoc99_scanf@plt
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(.LCPI0_0)
	fld	fa5, 24(sp)
	fld	fa4, %pcrel_lo(.Lpcrel_hi2)(a0)
	fld	fa3, 8(sp)
	fld	fs2, 16(sp)
	fmul.d	fa4, fa5, fa4
	fmul.d	fa4, fa4, fa3
	fmadd.d	fs0, fs2, fs2, fa4
	fmv.d.x	fa4, zero
	flt.d	a0, fa4, fs0
	beqz	a0, .LBB0_4
# %bb.1:
	fsqrt.d	fs1, fs0
	feq.d	s0, fs1, fs1
	fmv.d	fa0, fs1
	beqz	s0, .LBB0_9
.LBB0_2:
	fld	fa5, 24(sp)
	fsub.d	fa4, fa0, fs2
	fadd.d	fa5, fa5, fa5
	fdiv.d	fs2, fa4, fa5
	fld	fa5, 16(sp)
	fneg.d	fs3, fa5
	beqz	s0, .LBB0_10
.LBB0_3:
	fld	fa5, 24(sp)
	fsub.d	fa4, fs3, fs1
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(.L.str.2)
	fmv.x.d	a1, fs2
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
	fadd.d	fa5, fa5, fa5
	fdiv.d	fa5, fa4, fa5
	fmv.x.d	a2, fa5
	call	printf@plt
	j	.LBB0_8
.LBB0_4:
	fadd.d	fa5, fa5, fa5
	fneg.d	fa3, fs2
	feq.d	a0, fs0, fa4
	fdiv.d	fs1, fa3, fa5
	beqz	a0, .LBB0_6
# %bb.5:
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.L.str.3)
	fmv.x.d	a1, fs1
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	call	printf@plt
	j	.LBB0_8
.LBB0_6:
	fneg.d	fa5, fs0
	fsqrt.d	fa0, fa5
	feq.d	a0, fa0, fa0
	beqz	a0, .LBB0_11
.LBB0_7:
	fld	fa5, 24(sp)
	fmv.x.d	a1, fs1
.Lpcrel_hi5:
	auipc	a0, %pcrel_hi(.L.str.4)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi5)
	mv	a3, a1
	fadd.d	fa5, fa5, fa5
	fdiv.d	fa5, fa0, fa5
	fmv.x.d	a2, fa5
	mv	a4, a2
	call	printf@plt
.LBB0_8:
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	li	a0, 0
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	fld	fs0, 56(sp)                     # 8-byte Folded Reload
	fld	fs1, 48(sp)                     # 8-byte Folded Reload
	fld	fs2, 40(sp)                     # 8-byte Folded Reload
	fld	fs3, 32(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.LBB0_9:
	fmv.d	fa0, fs0
	call	sqrt@plt
	j	.LBB0_2
.LBB0_10:
	fmv.d	fa0, fs0
	call	sqrt@plt
	fmv.d	fs1, fa0
	j	.LBB0_3
.LBB0_11:
	fmv.d	fa0, fa5
	call	sqrt@plt
	j	.LBB0_7
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
