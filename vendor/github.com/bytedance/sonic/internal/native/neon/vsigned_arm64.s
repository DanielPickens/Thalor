// +build !noasm !appengine
// Code generated by asm2asm, DO NOT EDIT.

#include "go_asm.h"
#include "funcdata.h"
#include "textflag.h"

TEXT ·__vsigned_entry__(SB), NOSPLIT, $16
	NO_LOCAL_POINTERS
	WORD $0x100000a0 // adr x0, .+20
	MOVD R0, ret(FP)
	RET
	  // .p2align 2, 0x00
_vsigned:
	WORD $0xd10083ff  // sub	sp, sp, #32
	WORD $0xa900fbfd  // stp	fp, lr, [sp, #8]
	WORD $0xa93ffbfd  // stp	fp, lr, [sp, #-8]
	WORD $0xd10023fd  // sub	fp, sp, #8
	WORD $0xf9400028  // ldr	x8, [x1]
	WORD $0xa940240a  // ldp	x10, x9, [x0]
	WORD $0x5252472b  // mov	w11, #9
	WORD $0xa900fc5f  // stp	xzr, xzr, [x2, #8]
	WORD $0xf900004b  // str	x11, [x2]
	WORD $0xf940002b  // ldr	x11, [x1]
	WORD $0xf9000c4b  // str	x11, [x2, #24]
	WORD $0xeb09011f  // cmp	x8, x9
	WORD $0x54000642  // b.hs	LBB0_12 $200(%rip)
	WORD $0x3868694c  // ldrb	w12, [x10, x8]
	WORD $0x7100b59f  // cmp	w12, #45
	WORD $0x540006a1  // b.ne	LBB0_13 $212(%rip)
	WORD $0x91000508  // add	x8, x8, #1
	WORD $0xeb09011f  // cmp	x8, x9
	WORD $0x54000582  // b.hs	LBB0_12 $176(%rip)
	WORD $0x3868694c  // ldrb	w12, [x10, x8]
	WORD $0x9280000b  // mov	x11, #-1
	WORD $0x5100e98d  // sub	w13, w12, #58
	WORD $0x31002dbf  // cmn	w13, #11
	WORD $0x54000629  // b.ls	LBB0_14 $196(%rip)
LBB0_4:
	WORD $0x7100c19f  // cmp	w12, #48
	WORD $0x54000181  // b.ne	LBB0_6 $48(%rip)
	WORD $0x8b08014c  // add	x12, x10, x8
	WORD $0x3940058c  // ldrb	w12, [x12, #1]
	WORD $0x5100b98c  // sub	w12, w12, #46
	WORD $0x7100dd9f  // cmp	w12, #55
	WORD $0x5280002d  // mov	w13, #1
	WORD $0x9acc21ac  // lsl	x12, x13, x12
	WORD $0xb20903ed  // mov	x13, #36028797027352576
	WORD $0xf280002d  // movk	x13, #1
	WORD $0x8a0d018c  // and	x12, x12, x13
	WORD $0xfa409984  // ccmp	x12, #0, #4, ls
	WORD $0x540007e0  // b.eq	LBB0_22 $252(%rip)
LBB0_6:
	WORD $0xd280000c  // mov	x12, #0
	WORD $0x5252474d  // mov	w13, #10
LBB0_7:
	WORD $0xeb08013f  // cmp	x9, x8
	WORD $0x540006c0  // b.eq	LBB0_21 $216(%rip)
	WORD $0x3868694e  // ldrb	w14, [x10, x8]
	WORD $0x5100c1ce  // sub	w14, w14, #48
	WORD $0x710025df  // cmp	w14, #9
	WORD $0x54000448  // b.hi	LBB0_15 $136(%rip)
	WORD $0x9b4d7d8f  // smulh	x15, x12, x13
	WORD $0x8b0c098c  // add	x12, x12, x12, lsl #2
	WORD $0xd37ff98c  // lsl	x12, x12, #1
	WORD $0xeb8cfdff  // cmp	x15, x12, asr #63
	WORD $0x540000c1  // b.ne	LBB0_11 $24(%rip)
	WORD $0x91000508  // add	x8, x8, #1
	WORD $0x92401dce  // and	x14, x14, #0xff
	WORD $0x9b2e7d6e  // smull	x14, w11, w14
	WORD $0xab0e018c  // adds	x12, x12, x14
	WORD $0x54fffe27  // b.vc	LBB0_7 $-60(%rip)
LBB0_11:
	WORD $0xd1000508  // sub	x8, x8, #1
	WORD $0xf9000028  // str	x8, [x1]
	WORD $0x92800088  // mov	x8, #-5
	WORD $0xf9000048  // str	x8, [x2]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_12:
	WORD $0xf9000029  // str	x9, [x1]
	WORD $0x92800008  // mov	x8, #-1
	WORD $0xf9000048  // str	x8, [x2]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_13:
	WORD $0x5280002b  // mov	w11, #1
	WORD $0x5100e98d  // sub	w13, w12, #58
	WORD $0x31002dbf  // cmn	w13, #11
	WORD $0x54fffa28  // b.hi	LBB0_4 $-188(%rip)
LBB0_14:
	WORD $0xf9000028  // str	x8, [x1]
	WORD $0x92800028  // mov	x8, #-2
	WORD $0xf9000048  // str	x8, [x2]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_15:
	WORD $0xeb09011f  // cmp	x8, x9
	WORD $0x540001c2  // b.hs	LBB0_20 $56(%rip)
	WORD $0x38686949  // ldrb	w9, [x10, x8]
	WORD $0x7100b93f  // cmp	w9, #46
	WORD $0x540000a0  // b.eq	LBB0_19 $20(%rip)
	WORD $0x7101153f  // cmp	w9, #69
	WORD $0x54000060  // b.eq	LBB0_19 $12(%rip)
	WORD $0x7101953f  // cmp	w9, #101
	WORD $0x540000e1  // b.ne	LBB0_20 $28(%rip)
LBB0_19:
	WORD $0xf9000028  // str	x8, [x1]
	WORD $0x928000a8  // mov	x8, #-6
	WORD $0xf9000048  // str	x8, [x2]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_20:
	WORD $0xaa0803e9  // mov	x9, x8
LBB0_21:
	WORD $0xf9000029  // str	x9, [x1]
	WORD $0xf900084c  // str	x12, [x2, #16]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_22:
	WORD $0x91000508  // add	x8, x8, #1
	WORD $0xf9000028  // str	x8, [x1]
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
	  // .p2align 2, 0x00
_MASK_USE_NUMBER:
	WORD $0x00000002  // .long 2

TEXT ·__vsigned(SB), NOSPLIT, $0-24
	NO_LOCAL_POINTERS

_entry:
	MOVD 16(g), R16
	SUB $96, RSP, R17
	CMP  R16, R17
	BLS  _stack_grow

_vsigned:
	MOVD s+0(FP), R0
	MOVD p+8(FP), R1
	MOVD v+16(FP), R2
	MOVD ·_subr__vsigned(SB), R11
	WORD $0x1000005e // adr x30, .+8
	JMP (R11)
	RET

_stack_grow:
	MOVD R30, R3
	CALL runtime·morestack_noctxt<>(SB)
	JMP  _entry
