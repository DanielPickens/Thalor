// +build !noasm !appengine
// Code generated by asm2asm, DO NOT EDIT.

#include "go_asm.h"
#include "funcdata.h"
#include "textflag.h"

TEXT ·__i64toa_entry__(SB), NOSPLIT, $16
	NO_LOCAL_POINTERS
	WORD $0x100000a0 // adr x0, .+20
	MOVD R0, ret(FP)
	RET
	  // .p2align 3, 0x00
lCPI0_0:
	WORD $0x147b20c5
	WORD $0x80003334
	// // .word 8389
// .word 5243
// .word 13108
// .word 32768

lCPI0_1:
	WORD $0x08000080
	WORD $0x80002000
	// // .word 128
// .word 2048
// .word 8192
// .word 32768

lCPI0_2:
	WORD $0x08040201
	WORD $0x80402010
	WORD $0x08040201
	WORD $0x80402010
	// // .byte 1
// .byte 2
// .byte 4
// .byte 8
// .byte 16
// .byte 32
// .byte 64
// .byte 128
// .byte 1
// .byte 2
// .byte 4
// .byte 8
// .byte 16
// .byte 32
// .byte 64
// .byte 128

lCPI0_3:
	WORD $0x09010800
	WORD $0x0b030a02
	WORD $0x0d050c04
	WORD $0x0f070e06
	// // .byte 0
// .byte 8
// .byte 1
// .byte 9
// .byte 2
// .byte 10
// .byte 3
// .byte 11
// .byte 4
// .byte 12
// .byte 5
// .byte 13
// .byte 6
// .byte 14
// .byte 7
// .byte 15

_i64toa:
	WORD $0xd10083ff  // sub	sp, sp, #32
	WORD $0xa900fbfd  // stp	fp, lr, [sp, #8]
	WORD $0xa93ffbfd  // stp	fp, lr, [sp, #-8]
	WORD $0xd10023fd  // sub	fp, sp, #8
	WORD $0xb7f80641  // tbnz	x1, #63, LBB0_10 $200(%rip)
	WORD $0xd344fc28  // lsr	x8, x1, #4
	WORD $0xf109c11f  // cmp	x8, #624
	WORD $0x540008e8  // b.hi	LBB0_13 $284(%rip)
	WORD $0x53023c28  // ubfx	w8, w1, #2, #14
	WORD $0x52828f69  // mov	w9, #5243
	WORD $0x1b097d08  // mul	w8, w8, w9
	WORD $0x53117d08  // lsr	w8, w8, #17
	WORD $0xd37f7d09  // ubfiz	x9, x8, #1, #32
	WORD $0x52800c8a  // mov	w10, #100
	WORD $0x1b0a8508  // msub	w8, w8, w10, w1
	WORD $0x92403d08  // and	x8, x8, #0xffff
	WORD $0xd37ff908  // lsl	x8, x8, #1
	WORD $0x710fa03f  // cmp	w1, #1000
	WORD $0x540000e3  // b.lo	LBB0_4 $28(%rip)
Lloh0:
	WORD $0x100054ea  // adr	x10, _Digits $2716(%rip)
Lloh1:
	WORD $0x9100014a  // add	x10, x10, _Digits@PAGEOFF $0(%rip)
	WORD $0x3869694a  // ldrb	w10, [x10, x9]
	WORD $0x3900000a  // strb	w10, [x0]
	WORD $0x5280002a  // mov	w10, #1
	WORD $0x14000004  // b	LBB0_6 $16(%rip)
LBB0_4:
	WORD $0x7101903f  // cmp	w1, #100
	WORD $0x540002e3  // b.lo	LBB0_9 $92(%rip)
	WORD $0x5280000a  // mov	w10, #0
LBB0_6:
Lloh2:
	WORD $0x100053cb  // adr	x11, _Digits $2680(%rip)
Lloh3:
	WORD $0x9100016b  // add	x11, x11, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b294169  // add	x9, x11, w9, uxtw
	WORD $0x3940052b  // ldrb	w11, [x9, #1]
	WORD $0x11000549  // add	w9, w10, #1
	WORD $0x382a480b  // strb	w11, [x0, w10, uxtw]
LBB0_7:
Lloh4:
	WORD $0x1000530a  // adr	x10, _Digits $2656(%rip)
Lloh5:
	WORD $0x9100014a  // add	x10, x10, _Digits@PAGEOFF $0(%rip)
	WORD $0x3868694b  // ldrb	w11, [x10, x8]
	WORD $0x1100052a  // add	w10, w9, #1
	WORD $0x3829480b  // strb	w11, [x0, w9, uxtw]
LBB0_8:
Lloh6:
	WORD $0x10005269  // adr	x9, _Digits $2636(%rip)
Lloh7:
	WORD $0x91000129  // add	x9, x9, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b282128  // add	x8, x9, w8, uxth
	WORD $0x39400509  // ldrb	w9, [x8, #1]
	WORD $0x11000548  // add	w8, w10, #1
	WORD $0x382a4809  // strb	w9, [x0, w10, uxtw]
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_9:
	WORD $0x52800009  // mov	w9, #0
	WORD $0x5280000a  // mov	w10, #0
	WORD $0x7100283f  // cmp	w1, #10
	WORD $0x54fffdc2  // b.hs	LBB0_7 $-72(%rip)
	WORD $0x17fffff2  // b	LBB0_8 $-56(%rip)
LBB0_10:
	WORD $0x528005a9  // mov	w9, #45
	WORD $0xaa0003e8  // mov	x8, x0
	WORD $0x35247509  // strb	w9, [x8], #1
	WORD $0xcb0103e9  // neg	x9, x1
	WORD $0xd344fd2a  // lsr	x10, x9, #4
	WORD $0xf109c15f  // cmp	x10, #624
	WORD $0x54001068  // b.hi	LBB0_28 $524(%rip)
	WORD $0x53023d2a  // ubfx	w10, w9, #2, #14
	WORD $0x52828f6b  // mov	w11, #5243
	WORD $0x1b0b7d4a  // mul	w10, w10, w11
	WORD $0x53117d4a  // lsr	w10, w10, #17
	WORD $0xd37f7d4b  // ubfiz	x11, x10, #1, #32
	WORD $0x52800c8c  // mov	w12, #100
	WORD $0x1b0ca54a  // msub	w10, w10, w12, w9
	WORD $0x92403d4a  // and	x10, x10, #0xffff
	WORD $0xd37ff94a  // lsl	x10, x10, #1
	WORD $0x710fa13f  // cmp	w9, #1000
	WORD $0x540004e3  // b.lo	LBB0_16 $156(%rip)
Lloh8:
	WORD $0x10004e49  // adr	x9, _Digits $2504(%rip)
Lloh9:
	WORD $0x91000129  // add	x9, x9, _Digits@PAGEOFF $0(%rip)
	WORD $0x386b6929  // ldrb	w9, [x9, x11]
	WORD $0x39000109  // strb	w9, [x8]
	WORD $0x52800029  // mov	w9, #1
	WORD $0x14000024  // b	LBB0_18 $144(%rip)
LBB0_13:
	WORD $0x529c2008  // mov	w8, #57600
	WORD $0x72a0bea8  // movk	w8, #1525, lsl #16
	WORD $0xeb08003f  // cmp	x1, x8
	WORD $0x540011c2  // b.hs	LBB0_31 $568(%rip)
	WORD $0x5282eb28  // mov	w8, #5977
	WORD $0x72ba36e8  // movk	w8, #53687, lsl #16
	WORD $0x92407c29  // and	x9, x1, #0xffffffff
	WORD $0x9ba87d28  // umull	x8, w9, w8
	WORD $0xd36dfd08  // lsr	x8, x8, #45
	WORD $0x529bd06a  // mov	w10, #56963
	WORD $0x72a8636a  // movk	w10, #17179, lsl #16
	WORD $0x9baa7d29  // umull	x9, w9, w10
	WORD $0xd371fd29  // lsr	x9, x9, #49
	WORD $0x927f312a  // and	x10, x9, #0x3ffe
	WORD $0x53023d09  // ubfx	w9, w8, #2, #14
	WORD $0x52828f6b  // mov	w11, #5243
	WORD $0x1b0b7d29  // mul	w9, w9, w11
	WORD $0x53117d29  // lsr	w9, w9, #17
	WORD $0x52800c8b  // mov	w11, #100
	WORD $0x1b0ba129  // msub	w9, w9, w11, w8
	WORD $0x92403d29  // and	x9, x9, #0xffff
	WORD $0xd37ff929  // lsl	x9, x9, #1
	WORD $0x5292cfeb  // mov	w11, #38527
	WORD $0x72a0130b  // movk	w11, #152, lsl #16
	WORD $0x6b0b003f  // cmp	w1, w11
	WORD $0x54000409  // b.ls	LBB0_21 $128(%rip)
Lloh10:
	WORD $0x10004a4b  // adr	x11, _Digits $2376(%rip)
Lloh11:
	WORD $0x9100016b  // add	x11, x11, _Digits@PAGEOFF $0(%rip)
	WORD $0x386a696b  // ldrb	w11, [x11, x10]
	WORD $0x3900000b  // strb	w11, [x0]
	WORD $0x5280002c  // mov	w12, #1
	WORD $0x1400001f  // b	LBB0_23 $124(%rip)
LBB0_16:
	WORD $0x7101913f  // cmp	w9, #100
	WORD $0x540008a3  // b.lo	LBB0_26 $276(%rip)
	WORD $0x52800009  // mov	w9, #0
LBB0_18:
Lloh12:
	WORD $0x1000492c  // adr	x12, _Digits $2340(%rip)
Lloh13:
	WORD $0x9100018c  // add	x12, x12, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b2b418b  // add	x11, x12, w11, uxtw
	WORD $0x3940056c  // ldrb	w12, [x11, #1]
	WORD $0x1100052b  // add	w11, w9, #1
	WORD $0x3829490c  // strb	w12, [x8, w9, uxtw]
LBB0_19:
Lloh14:
	WORD $0x10004869  // adr	x9, _Digits $2316(%rip)
Lloh15:
	WORD $0x91000129  // add	x9, x9, _Digits@PAGEOFF $0(%rip)
	WORD $0x386a6929  // ldrb	w9, [x9, x10]
	WORD $0x1100056c  // add	w12, w11, #1
	WORD $0x382b4909  // strb	w9, [x8, w11, uxtw]
LBB0_20:
Lloh16:
	WORD $0x100047c9  // adr	x9, _Digits $2296(%rip)
Lloh17:
	WORD $0x91000129  // add	x9, x9, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b2a2129  // add	x9, x9, w10, uxth
	WORD $0x3940052a  // ldrb	w10, [x9, #1]
	WORD $0x11000589  // add	w9, w12, #1
	WORD $0x382c490a  // strb	w10, [x8, w12, uxtw]
	WORD $0x11000528  // add	w8, w9, #1
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_21:
	WORD $0x528847eb  // mov	w11, #16959
	WORD $0x72a001eb  // movk	w11, #15, lsl #16
	WORD $0x6b0b003f  // cmp	w1, w11
	WORD $0x540005e9  // b.ls	LBB0_27 $188(%rip)
	WORD $0x5280000c  // mov	w12, #0
LBB0_23:
Lloh18:
	WORD $0x100045cb  // adr	x11, _Digits $2232(%rip)
Lloh19:
	WORD $0x9100016b  // add	x11, x11, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b2a416a  // add	x10, x11, w10, uxtw
	WORD $0x3940054a  // ldrb	w10, [x10, #1]
	WORD $0x1100058b  // add	w11, w12, #1
	WORD $0x382c480a  // strb	w10, [x0, w12, uxtw]
LBB0_24:
Lloh20:
	WORD $0x1000450a  // adr	x10, _Digits $2208(%rip)
Lloh21:
	WORD $0x9100014a  // add	x10, x10, _Digits@PAGEOFF $0(%rip)
	WORD $0x3869694c  // ldrb	w12, [x10, x9]
	WORD $0x1100056a  // add	w10, w11, #1
	WORD $0x382b480c  // strb	w12, [x0, w11, uxtw]
LBB0_25:
	WORD $0x5284e20b  // mov	w11, #10000
	WORD $0x1b0b8508  // msub	w8, w8, w11, w1
	WORD $0x53023d0b  // ubfx	w11, w8, #2, #14
	WORD $0x52828f6c  // mov	w12, #5243
	WORD $0x1b0c7d6b  // mul	w11, w11, w12
	WORD $0x53117d6b  // lsr	w11, w11, #17
	WORD $0x52800c8c  // mov	w12, #100
	WORD $0x1b0ca168  // msub	w8, w11, w12, w8
	WORD $0x92403d08  // and	x8, x8, #0xffff
	WORD $0xd37ff908  // lsl	x8, x8, #1
Lloh22:
	WORD $0x1000432c  // adr	x12, _Digits $2148(%rip)
Lloh23:
	WORD $0x9100018c  // add	x12, x12, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b292189  // add	x9, x12, w9, uxth
	WORD $0x39400529  // ldrb	w9, [x9, #1]
	WORD $0x8b2a400d  // add	x13, x0, w10, uxtw
	WORD $0x390001a9  // strb	w9, [x13]
	WORD $0x786b5989  // ldrh	w9, [x12, w11, uxtw #1]
	WORD $0x752471a9  // sturh	w9, [x13, #1]
	WORD $0x38686989  // ldrb	w9, [x12, x8]
	WORD $0x39000da9  // strb	w9, [x13, #3]
	WORD $0x927f3908  // and	x8, x8, #0xfffe
	WORD $0x8b080188  // add	x8, x12, x8
	WORD $0x39400509  // ldrb	w9, [x8, #1]
	WORD $0x11001548  // add	w8, w10, #5
	WORD $0x390011a9  // strb	w9, [x13, #4]
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_26:
	WORD $0x5280000b  // mov	w11, #0
	WORD $0x5280000c  // mov	w12, #0
	WORD $0x7100293f  // cmp	w9, #10
	WORD $0x54fff802  // b.hs	LBB0_19 $-256(%rip)
	WORD $0x17ffffc4  // b	LBB0_20 $-240(%rip)
LBB0_27:
	WORD $0x5280000b  // mov	w11, #0
	WORD $0x5280000a  // mov	w10, #0
	WORD $0x53057c2c  // lsr	w12, w1, #5
	WORD $0x7130d59f  // cmp	w12, #3125
	WORD $0x54fffaa2  // b.hs	LBB0_24 $-172(%rip)
	WORD $0x17ffffd9  // b	LBB0_25 $-156(%rip)
LBB0_28:
	WORD $0x529c200a  // mov	w10, #57600
	WORD $0x72a0beaa  // movk	w10, #1525, lsl #16
	WORD $0xeb0a013f  // cmp	x9, x10
	WORD $0x54001662  // b.hs	LBB0_39 $716(%rip)
	WORD $0x5282eb2a  // mov	w10, #5977
	WORD $0x72ba36ea  // movk	w10, #53687, lsl #16
	WORD $0x9baa7d2a  // umull	x10, w9, w10
	WORD $0xd36dfd4a  // lsr	x10, x10, #45
	WORD $0x529bd06b  // mov	w11, #56963
	WORD $0x72a8636b  // movk	w11, #17179, lsl #16
	WORD $0x92407d2c  // and	x12, x9, #0xffffffff
	WORD $0x9bab7d8b  // umull	x11, w12, w11
	WORD $0xd371fd6b  // lsr	x11, x11, #49
	WORD $0x927f316c  // and	x12, x11, #0x3ffe
	WORD $0x53023d4b  // ubfx	w11, w10, #2, #14
	WORD $0x52828f6d  // mov	w13, #5243
	WORD $0x1b0d7d6b  // mul	w11, w11, w13
	WORD $0x53117d6b  // lsr	w11, w11, #17
	WORD $0x52800c8d  // mov	w13, #100
	WORD $0x1b0da96b  // msub	w11, w11, w13, w10
	WORD $0x92403d6b  // and	x11, x11, #0xffff
	WORD $0xd37ff96b  // lsl	x11, x11, #1
	WORD $0x5292cfed  // mov	w13, #38527
	WORD $0x72a0130d  // movk	w13, #152, lsl #16
	WORD $0x6b0d013f  // cmp	w9, w13
	WORD $0x54000d29  // b.ls	LBB0_33 $420(%rip)
Lloh24:
	WORD $0x10003c2d  // adr	x13, _Digits $1924(%rip)
Lloh25:
	WORD $0x910001ad  // add	x13, x13, _Digits@PAGEOFF $0(%rip)
	WORD $0x386c69ad  // ldrb	w13, [x13, x12]
	WORD $0x3900010d  // strb	w13, [x8]
	WORD $0x5280002e  // mov	w14, #1
	WORD $0x14000068  // b	LBB0_35 $416(%rip)
LBB0_31:
	WORD $0xd2adf82a  // mov	x10, #1874919424
	WORD $0xf2d0de4a  // movk	x10, #34546, lsl #32
	WORD $0xf2e0046a  // movk	x10, #35, lsl #48
	WORD $0xeb0a003f  // cmp	x1, x10
	WORD $0x54001ea2  // b.hs	LBB0_41 $980(%rip)
	WORD $0xd299dfa9  // mov	x9, #52989
	WORD $0xf2b08c29  // movk	x9, #33889, lsl #16
	WORD $0xf2cee229  // movk	x9, #30481, lsl #32
	WORD $0xf2f57989  // movk	x9, #43980, lsl #48
	WORD $0x9bc97c29  // umulh	x9, x1, x9
	WORD $0xd35afd29  // lsr	x9, x9, #26
	WORD $0x1b088528  // msub	w8, w9, w8, w1
	WORD $0x6f00e400  // movi.2d	v0, #0000000000000000
	WORD $0x6f00e401  // movi.2d	v1, #0000000000000000
	WORD $0x4e041d21  // mov.s	v1[0], w9
	WORD $0x0ea12822  // xtn.2s	v2, v1
	WORD $0x5282eb29  // mov	w9, #5977
	WORD $0x72ba36e9  // movk	w9, #53687, lsl #16
	WORD $0x0e040d23  // dup.2s	v3, w9
	WORD $0x2ea3c042  // umull.2d	v2, v2, v3
	WORD $0x6f530442  // ushr.2d	v2, v2, #45
	WORD $0x0ea12844  // xtn.2s	v4, v2
	WORD $0x5284e209  // mov	w9, #10000
	WORD $0x0e040d25  // dup.2s	v5, w9
	WORD $0x2ea5c084  // umull.2d	v4, v4, v5
	WORD $0x6ea48421  // sub.4s	v1, v1, v4
	WORD $0x4e413841  // zip1.8h	v1, v2, v1
	WORD $0x4f425421  // shl.2d	v1, v1, #2
	WORD $0x4e413821  // zip1.8h	v1, v1, v1
	WORD $0x4e813821  // zip1.4s	v1, v1, v1
Lloh26:
	WORD $0x10ffdee9  // adr	x9, lCPI0_0 $-1060(%rip)
Lloh27:
	WORD $0xfd400122  // ldr	d2, [x9, lCPI0_0@PAGEOFF] $0(%rip)
	WORD $0x2e62c024  // umull.4s	v4, v1, v2
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e62c021  // umull.4s	v1, v1, v2
	WORD $0x4e415881  // uzp2.8h	v1, v4, v1
Lloh28:
	WORD $0x10ffde69  // adr	x9, lCPI0_1 $-1076(%rip)
Lloh29:
	WORD $0xfd400124  // ldr	d4, [x9, lCPI0_1@PAGEOFF] $0(%rip)
	WORD $0x2e64c026  // umull.4s	v6, v1, v4
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e64c021  // umull.4s	v1, v1, v4
	WORD $0x4e4158c1  // uzp2.8h	v1, v6, v1
	WORD $0x4f008546  // movi.8h	v6, #10
	WORD $0x4e669c27  // mul.8h	v7, v1, v6
	WORD $0x4f5054e7  // shl.2d	v7, v7, #16
	WORD $0x6e678421  // sub.8h	v1, v1, v7
	WORD $0x4e041d00  // mov.s	v0[0], w8
	WORD $0x0ea12807  // xtn.2s	v7, v0
	WORD $0x2ea3c0e3  // umull.2d	v3, v7, v3
	WORD $0x6f530463  // ushr.2d	v3, v3, #45
	WORD $0x0ea12867  // xtn.2s	v7, v3
	WORD $0x2ea5c0e5  // umull.2d	v5, v7, v5
	WORD $0x6ea58400  // sub.4s	v0, v0, v5
	WORD $0x4e403860  // zip1.8h	v0, v3, v0
	WORD $0x4f425400  // shl.2d	v0, v0, #2
	WORD $0x4e403800  // zip1.8h	v0, v0, v0
	WORD $0x4e803800  // zip1.4s	v0, v0, v0
	WORD $0x2e62c003  // umull.4s	v3, v0, v2
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e62c000  // umull.4s	v0, v0, v2
	WORD $0x4e405860  // uzp2.8h	v0, v3, v0
	WORD $0x2e64c002  // umull.4s	v2, v0, v4
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e64c000  // umull.4s	v0, v0, v4
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x4e669c02  // mul.8h	v2, v0, v6
	WORD $0x4f505442  // shl.2d	v2, v2, #16
	WORD $0x6e628400  // sub.8h	v0, v0, v2
	WORD $0x2e212821  // sqxtun.8b	v1, v1
	WORD $0x6e212801  // sqxtun2.16b	v1, v0
	WORD $0x4f01e600  // movi.16b	v0, #48
	WORD $0x4e208420  // add.16b	v0, v1, v0
	WORD $0x4e209821  // cmeq.16b	v1, v1, #0
Lloh30:
	WORD $0x10ffda08  // adr	x8, lCPI0_2 $-1216(%rip)
Lloh31:
	WORD $0x3dc00102  // ldr	q2, [x8, lCPI0_2@PAGEOFF] $0(%rip)
	WORD $0x4e221c21  // and.16b	v1, v1, v2
Lloh32:
	WORD $0x10ffda28  // adr	x8, lCPI0_3 $-1212(%rip)
Lloh33:
	WORD $0x3dc00102  // ldr	q2, [x8, lCPI0_3@PAGEOFF] $0(%rip)
	WORD $0x4e020021  // tbl.16b	v1, { v1 }, v2
	WORD $0x4e71b821  // addv.8h	h1, v1
	WORD $0x1e260028  // fmov	w8, s1
	WORD $0x2a2803e8  // mvn	w8, w8
	WORD $0x32114108  // orr	w8, w8, #0xffff8000
	WORD $0x5ac00108  // rbit	w8, w8
	WORD $0x5ac01108  // clz	w8, w8
Lloh34:
	WORD $0x10003709  // adr	x9, _VecShiftShuffles $1760(%rip)
Lloh35:
	WORD $0x91000129  // add	x9, x9, _VecShiftShuffles@PAGEOFF $0(%rip)
	WORD $0x3ce85921  // ldr	q1, [x9, w8, uxtw #4]
	WORD $0x4f04e5e2  // movi.16b	v2, #143
	WORD $0x4e221c21  // and.16b	v1, v1, v2
	WORD $0x4e010000  // tbl.16b	v0, { v0 }, v1
	WORD $0x3d800000  // str	q0, [x0]
	WORD $0x52800209  // mov	w9, #16
	WORD $0x4b080128  // sub	w8, w9, w8
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_33:
	WORD $0x528847ed  // mov	w13, #16959
	WORD $0x72a001ed  // movk	w13, #15, lsl #16
	WORD $0x6b0d013f  // cmp	w9, w13
	WORD $0x54000569  // b.ls	LBB0_38 $172(%rip)
	WORD $0x5280000e  // mov	w14, #0
LBB0_35:
Lloh36:
	WORD $0x10002e8d  // adr	x13, _Digits $1488(%rip)
Lloh37:
	WORD $0x910001ad  // add	x13, x13, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b2c41ac  // add	x12, x13, w12, uxtw
	WORD $0x3940058c  // ldrb	w12, [x12, #1]
	WORD $0x110005cd  // add	w13, w14, #1
	WORD $0x382e490c  // strb	w12, [x8, w14, uxtw]
LBB0_36:
Lloh38:
	WORD $0x10002dcc  // adr	x12, _Digits $1464(%rip)
Lloh39:
	WORD $0x9100018c  // add	x12, x12, _Digits@PAGEOFF $0(%rip)
	WORD $0x386b698e  // ldrb	w14, [x12, x11]
	WORD $0x110005ac  // add	w12, w13, #1
	WORD $0x382d490e  // strb	w14, [x8, w13, uxtw]
LBB0_37:
	WORD $0x5284e20d  // mov	w13, #10000
	WORD $0x1b0da549  // msub	w9, w10, w13, w9
	WORD $0x53023d2a  // ubfx	w10, w9, #2, #14
	WORD $0x52828f6d  // mov	w13, #5243
	WORD $0x1b0d7d4a  // mul	w10, w10, w13
	WORD $0x53117d4a  // lsr	w10, w10, #17
	WORD $0x52800c8d  // mov	w13, #100
	WORD $0x1b0da549  // msub	w9, w10, w13, w9
	WORD $0x92403d29  // and	x9, x9, #0xffff
	WORD $0xd37ff929  // lsl	x9, x9, #1
Lloh40:
	WORD $0x10002bed  // adr	x13, _Digits $1404(%rip)
Lloh41:
	WORD $0x910001ad  // add	x13, x13, _Digits@PAGEOFF $0(%rip)
	WORD $0x8b2b21ab  // add	x11, x13, w11, uxth
	WORD $0x3940056b  // ldrb	w11, [x11, #1]
	WORD $0x8b2c4108  // add	x8, x8, w12, uxtw
	WORD $0x3900010b  // strb	w11, [x8]
	WORD $0x786a59aa  // ldrh	w10, [x13, w10, uxtw #1]
	WORD $0x7524710a  // sturh	w10, [x8, #1]
	WORD $0x386969aa  // ldrb	w10, [x13, x9]
	WORD $0x39000d0a  // strb	w10, [x8, #3]
	WORD $0x927f3929  // and	x9, x9, #0xfffe
	WORD $0x8b0901a9  // add	x9, x13, x9
	WORD $0x3940052a  // ldrb	w10, [x9, #1]
	WORD $0x11001589  // add	w9, w12, #5
	WORD $0x3900110a  // strb	w10, [x8, #4]
	WORD $0x11000528  // add	w8, w9, #1
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_38:
	WORD $0x5280000d  // mov	w13, #0
	WORD $0x5280000c  // mov	w12, #0
	WORD $0x53057d2e  // lsr	w14, w9, #5
	WORD $0x7130d5df  // cmp	w14, #3125
	WORD $0x54fffb22  // b.hs	LBB0_36 $-156(%rip)
	WORD $0x17ffffdd  // b	LBB0_37 $-140(%rip)
LBB0_39:
	WORD $0xd2adf82c  // mov	x12, #1874919424
	WORD $0xf2d0de4c  // movk	x12, #34546, lsl #32
	WORD $0xf2e0046c  // movk	x12, #35, lsl #48
	WORD $0xeb0c013f  // cmp	x9, x12
	WORD $0x540019e2  // b.hs	LBB0_47 $828(%rip)
	WORD $0xd299dfab  // mov	x11, #52989
	WORD $0xf2b08c2b  // movk	x11, #33889, lsl #16
	WORD $0xf2cee22b  // movk	x11, #30481, lsl #32
	WORD $0xf2f5798b  // movk	x11, #43980, lsl #48
	WORD $0x9bcb7d2b  // umulh	x11, x9, x11
	WORD $0xd35afd6b  // lsr	x11, x11, #26
	WORD $0x1b0aa569  // msub	w9, w11, w10, w9
	WORD $0x6f00e400  // movi.2d	v0, #0000000000000000
	WORD $0x6f00e401  // movi.2d	v1, #0000000000000000
	WORD $0x4e041d61  // mov.s	v1[0], w11
	WORD $0x0ea12822  // xtn.2s	v2, v1
	WORD $0x5282eb2a  // mov	w10, #5977
	WORD $0x72ba36ea  // movk	w10, #53687, lsl #16
	WORD $0x0e040d43  // dup.2s	v3, w10
	WORD $0x2ea3c042  // umull.2d	v2, v2, v3
	WORD $0x6f530442  // ushr.2d	v2, v2, #45
	WORD $0x0ea12844  // xtn.2s	v4, v2
	WORD $0x5284e20a  // mov	w10, #10000
	WORD $0x0e040d45  // dup.2s	v5, w10
	WORD $0x2ea5c084  // umull.2d	v4, v4, v5
	WORD $0x6ea48421  // sub.4s	v1, v1, v4
	WORD $0x4e413841  // zip1.8h	v1, v2, v1
	WORD $0x4f425421  // shl.2d	v1, v1, #2
	WORD $0x4e413821  // zip1.8h	v1, v1, v1
	WORD $0x4e813821  // zip1.4s	v1, v1, v1
Lloh42:
	WORD $0x10ffcc2a  // adr	x10, lCPI0_0 $-1660(%rip)
Lloh43:
	WORD $0xfd400142  // ldr	d2, [x10, lCPI0_0@PAGEOFF] $0(%rip)
	WORD $0x2e62c024  // umull.4s	v4, v1, v2
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e62c021  // umull.4s	v1, v1, v2
	WORD $0x4e415881  // uzp2.8h	v1, v4, v1
Lloh44:
	WORD $0x10ffcbaa  // adr	x10, lCPI0_1 $-1676(%rip)
Lloh45:
	WORD $0xfd400144  // ldr	d4, [x10, lCPI0_1@PAGEOFF] $0(%rip)
	WORD $0x2e64c026  // umull.4s	v6, v1, v4
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e64c021  // umull.4s	v1, v1, v4
	WORD $0x4e4158c1  // uzp2.8h	v1, v6, v1
	WORD $0x4f008546  // movi.8h	v6, #10
	WORD $0x4e669c27  // mul.8h	v7, v1, v6
	WORD $0x4f5054e7  // shl.2d	v7, v7, #16
	WORD $0x6e678421  // sub.8h	v1, v1, v7
	WORD $0x4e041d20  // mov.s	v0[0], w9
	WORD $0x0ea12807  // xtn.2s	v7, v0
	WORD $0x2ea3c0e3  // umull.2d	v3, v7, v3
	WORD $0x6f530463  // ushr.2d	v3, v3, #45
	WORD $0x0ea12867  // xtn.2s	v7, v3
	WORD $0x2ea5c0e5  // umull.2d	v5, v7, v5
	WORD $0x6ea58400  // sub.4s	v0, v0, v5
	WORD $0x4e403860  // zip1.8h	v0, v3, v0
	WORD $0x4f425400  // shl.2d	v0, v0, #2
	WORD $0x4e403800  // zip1.8h	v0, v0, v0
	WORD $0x4e803800  // zip1.4s	v0, v0, v0
	WORD $0x2e62c003  // umull.4s	v3, v0, v2
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e62c000  // umull.4s	v0, v0, v2
	WORD $0x4e405860  // uzp2.8h	v0, v3, v0
	WORD $0x2e64c002  // umull.4s	v2, v0, v4
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e64c000  // umull.4s	v0, v0, v4
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x4e669c02  // mul.8h	v2, v0, v6
	WORD $0x4f505442  // shl.2d	v2, v2, #16
	WORD $0x6e628400  // sub.8h	v0, v0, v2
	WORD $0x2e212821  // sqxtun.8b	v1, v1
	WORD $0x6e212801  // sqxtun2.16b	v1, v0
	WORD $0x4f01e600  // movi.16b	v0, #48
	WORD $0x4e208420  // add.16b	v0, v1, v0
	WORD $0x4e209821  // cmeq.16b	v1, v1, #0
Lloh46:
	WORD $0x10ffc749  // adr	x9, lCPI0_2 $-1816(%rip)
Lloh47:
	WORD $0x3dc00122  // ldr	q2, [x9, lCPI0_2@PAGEOFF] $0(%rip)
	WORD $0x4e221c21  // and.16b	v1, v1, v2
Lloh48:
	WORD $0x10ffc769  // adr	x9, lCPI0_3 $-1812(%rip)
Lloh49:
	WORD $0x3dc00122  // ldr	q2, [x9, lCPI0_3@PAGEOFF] $0(%rip)
	WORD $0x4e020021  // tbl.16b	v1, { v1 }, v2
	WORD $0x4e71b821  // addv.8h	h1, v1
	WORD $0x1e260029  // fmov	w9, s1
	WORD $0x2a2903e9  // mvn	w9, w9
	WORD $0x32114129  // orr	w9, w9, #0xffff8000
	WORD $0x5ac00129  // rbit	w9, w9
	WORD $0x5ac01129  // clz	w9, w9
Lloh50:
	WORD $0x1000244a  // adr	x10, _VecShiftShuffles $1160(%rip)
Lloh51:
	WORD $0x9100014a  // add	x10, x10, _VecShiftShuffles@PAGEOFF $0(%rip)
	WORD $0x3ce95941  // ldr	q1, [x10, w9, uxtw #4]
	WORD $0x4f04e5e2  // movi.16b	v2, #143
	WORD $0x4e221c21  // and.16b	v1, v1, v2
	WORD $0x4e010000  // tbl.16b	v0, { v0 }, v1
	WORD $0x3d524700  // str	q0, [x8]
	WORD $0x52800208  // mov	w8, #16
	WORD $0x4b090109  // sub	w9, w8, w9
	WORD $0x11000528  // add	w8, w9, #1
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_41:
	WORD $0xd28f0ae9  // mov	x9, #30807
	WORD $0xf2b62269  // movk	x9, #45331, lsl #16
	WORD $0xf2cca5e9  // movk	x9, #25903, lsl #32
	WORD $0xf2e734a9  // movk	x9, #14757, lsl #48
	WORD $0x9bc97c29  // umulh	x9, x1, x9
	WORD $0xd373fd2b  // lsr	x11, x9, #51
	WORD $0x7100257f  // cmp	w11, #9
	WORD $0x540000a8  // b.hi	LBB0_43 $20(%rip)
	WORD $0x1100c169  // add	w9, w11, #48
	WORD $0x39000009  // strb	w9, [x0]
	WORD $0x52800029  // mov	w9, #1
	WORD $0x1400001b  // b	LBB0_46 $108(%rip)
LBB0_43:
	WORD $0x71018d7f  // cmp	w11, #99
	WORD $0x540000e8  // b.hi	LBB0_45 $28(%rip)
Lloh52:
	WORD $0x10001a89  // adr	x9, _Digits $848(%rip)
Lloh53:
	WORD $0x91000129  // add	x9, x9, _Digits@PAGEOFF $0(%rip)
	WORD $0x786b5929  // ldrh	w9, [x9, w11, uxtw #1]
	WORD $0x79000009  // strh	w9, [x0]
	WORD $0x52800049  // mov	w9, #2
	WORD $0x14000013  // b	LBB0_46 $76(%rip)
LBB0_45:
	WORD $0x5280a3e9  // mov	w9, #1311
	WORD $0x1b097d69  // mul	w9, w11, w9
	WORD $0x53117d29  // lsr	w9, w9, #17
	WORD $0x321c052c  // orr	w12, w9, #0x30
	WORD $0x3900000c  // strb	w12, [x0]
	WORD $0x52800c8c  // mov	w12, #100
	WORD $0x1b0cad29  // msub	w9, w9, w12, w11
	WORD $0x92403d29  // and	x9, x9, #0xffff
	WORD $0xd37ff929  // lsl	x9, x9, #1
Lloh54:
	WORD $0x100018ac  // adr	x12, _Digits $788(%rip)
Lloh55:
	WORD $0x9100018c  // add	x12, x12, _Digits@PAGEOFF $0(%rip)
	WORD $0x3869698d  // ldrb	w13, [x12, x9]
	WORD $0x3900040d  // strb	w13, [x0, #1]
	WORD $0x927f3929  // and	x9, x9, #0xfffe
	WORD $0x8b090189  // add	x9, x12, x9
	WORD $0x39400529  // ldrb	w9, [x9, #1]
	WORD $0x39000809  // strb	w9, [x0, #2]
	WORD $0x52800069  // mov	w9, #3
LBB0_46:
	WORD $0x9b0a856a  // msub	x10, x11, x10, x1
	WORD $0xd299dfab  // mov	x11, #52989
	WORD $0xf2b08c2b  // movk	x11, #33889, lsl #16
	WORD $0xf2cee22b  // movk	x11, #30481, lsl #32
	WORD $0xf2f5798b  // movk	x11, #43980, lsl #48
	WORD $0x9bcb7d4b  // umulh	x11, x10, x11
	WORD $0xd35afd6b  // lsr	x11, x11, #26
	WORD $0x6f00e400  // movi.2d	v0, #0000000000000000
	WORD $0x6f00e401  // movi.2d	v1, #0000000000000000
	WORD $0x4e041d61  // mov.s	v1[0], w11
	WORD $0x5282eb2c  // mov	w12, #5977
	WORD $0x72ba36ec  // movk	w12, #53687, lsl #16
	WORD $0x0e040d82  // dup.2s	v2, w12
	WORD $0x0ea12823  // xtn.2s	v3, v1
	WORD $0x2ea2c063  // umull.2d	v3, v3, v2
	WORD $0x6f530463  // ushr.2d	v3, v3, #45
	WORD $0x5284e20c  // mov	w12, #10000
	WORD $0x0e040d84  // dup.2s	v4, w12
	WORD $0x0ea12865  // xtn.2s	v5, v3
	WORD $0x2ea4c0a5  // umull.2d	v5, v5, v4
	WORD $0x6ea58421  // sub.4s	v1, v1, v5
	WORD $0x4e413861  // zip1.8h	v1, v3, v1
	WORD $0x4f425421  // shl.2d	v1, v1, #2
	WORD $0x4e413821  // zip1.8h	v1, v1, v1
	WORD $0x4e813821  // zip1.4s	v1, v1, v1
Lloh56:
	WORD $0x10ffbbac  // adr	x12, lCPI0_0 $-2188(%rip)
Lloh57:
	WORD $0xfd400183  // ldr	d3, [x12, lCPI0_0@PAGEOFF] $0(%rip)
	WORD $0x2e63c025  // umull.4s	v5, v1, v3
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e63c021  // umull.4s	v1, v1, v3
	WORD $0x4e4158a1  // uzp2.8h	v1, v5, v1
Lloh58:
	WORD $0x10ffbb2c  // adr	x12, lCPI0_1 $-2204(%rip)
Lloh59:
	WORD $0xfd400185  // ldr	d5, [x12, lCPI0_1@PAGEOFF] $0(%rip)
	WORD $0x2e65c026  // umull.4s	v6, v1, v5
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e65c021  // umull.4s	v1, v1, v5
	WORD $0x4e4158c1  // uzp2.8h	v1, v6, v1
	WORD $0x4f008546  // movi.8h	v6, #10
	WORD $0x4e669c27  // mul.8h	v7, v1, v6
	WORD $0x4f5054e7  // shl.2d	v7, v7, #16
	WORD $0x6e678421  // sub.8h	v1, v1, v7
	WORD $0x1b08a968  // msub	w8, w11, w8, w10
	WORD $0x4e041d00  // mov.s	v0[0], w8
	WORD $0x0ea12807  // xtn.2s	v7, v0
	WORD $0x2ea2c0e2  // umull.2d	v2, v7, v2
	WORD $0x6f530442  // ushr.2d	v2, v2, #45
	WORD $0x0ea12847  // xtn.2s	v7, v2
	WORD $0x2ea4c0e4  // umull.2d	v4, v7, v4
	WORD $0x6ea48400  // sub.4s	v0, v0, v4
	WORD $0x4e403840  // zip1.8h	v0, v2, v0
	WORD $0x4f425400  // shl.2d	v0, v0, #2
	WORD $0x4e403800  // zip1.8h	v0, v0, v0
	WORD $0x4e803800  // zip1.4s	v0, v0, v0
	WORD $0x2e63c002  // umull.4s	v2, v0, v3
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e63c000  // umull.4s	v0, v0, v3
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x2e65c002  // umull.4s	v2, v0, v5
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e65c000  // umull.4s	v0, v0, v5
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x4e669c02  // mul.8h	v2, v0, v6
	WORD $0x4f505442  // shl.2d	v2, v2, #16
	WORD $0x6e628400  // sub.8h	v0, v0, v2
	WORD $0x2e212821  // sqxtun.8b	v1, v1
	WORD $0x6e212801  // sqxtun2.16b	v1, v0
	WORD $0x4f01e600  // movi.16b	v0, #48
	WORD $0x4e208420  // add.16b	v0, v1, v0
	WORD $0x3ca94800  // str	q0, [x0, w9, uxtw]
	WORD $0x321c0128  // orr	w8, w9, #0x10
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
LBB0_47:
	WORD $0xd28f0aeb  // mov	x11, #30807
	WORD $0xf2b6226b  // movk	x11, #45331, lsl #16
	WORD $0xf2cca5eb  // movk	x11, #25903, lsl #32
	WORD $0xf2e734ab  // movk	x11, #14757, lsl #48
	WORD $0x9bcb7d2b  // umulh	x11, x9, x11
	WORD $0xd373fd6d  // lsr	x13, x11, #51
	WORD $0x710025bf  // cmp	w13, #9
	WORD $0x540000a8  // b.hi	LBB0_49 $20(%rip)
	WORD $0x1100c1ab  // add	w11, w13, #48
	WORD $0x3900010b  // strb	w11, [x8]
	WORD $0x5280002b  // mov	w11, #1
	WORD $0x1400001c  // b	LBB0_52 $112(%rip)
LBB0_49:
	WORD $0x71018dbf  // cmp	w13, #99
	WORD $0x540000e8  // b.hi	LBB0_51 $28(%rip)
Lloh60:
	WORD $0x10000c8b  // adr	x11, _Digits $400(%rip)
Lloh61:
	WORD $0x9100016b  // add	x11, x11, _Digits@PAGEOFF $0(%rip)
	WORD $0x786d596b  // ldrh	w11, [x11, w13, uxtw #1]
	WORD $0x7524700b  // sturh	w11, [x0, #1]
	WORD $0x5280004b  // mov	w11, #2
	WORD $0x14000014  // b	LBB0_52 $80(%rip)
LBB0_51:
	WORD $0x53023dab  // ubfx	w11, w13, #2, #14
	WORD $0x52828f6e  // mov	w14, #5243
	WORD $0x1b0e7d6b  // mul	w11, w11, w14
	WORD $0x53117d6b  // lsr	w11, w11, #17
	WORD $0x321c056e  // orr	w14, w11, #0x30
	WORD $0x3900040e  // strb	w14, [x0, #1]
	WORD $0x52800c8e  // mov	w14, #100
	WORD $0x1b0eb56b  // msub	w11, w11, w14, w13
	WORD $0x92403d6b  // and	x11, x11, #0xffff
	WORD $0xd37ff96b  // lsl	x11, x11, #1
Lloh62:
	WORD $0x10000a8e  // adr	x14, _Digits $336(%rip)
Lloh63:
	WORD $0x910001ce  // add	x14, x14, _Digits@PAGEOFF $0(%rip)
	WORD $0x386b69cf  // ldrb	w15, [x14, x11]
	WORD $0x3900080f  // strb	w15, [x0, #2]
	WORD $0x927f396b  // and	x11, x11, #0xfffe
	WORD $0x8b0b01cb  // add	x11, x14, x11
	WORD $0x3940056b  // ldrb	w11, [x11, #1]
	WORD $0x39000c0b  // strb	w11, [x0, #3]
	WORD $0x5280006b  // mov	w11, #3
LBB0_52:
	WORD $0x9b0ca5a9  // msub	x9, x13, x12, x9
	WORD $0xd299dfac  // mov	x12, #52989
	WORD $0xf2b08c2c  // movk	x12, #33889, lsl #16
	WORD $0xf2cee22c  // movk	x12, #30481, lsl #32
	WORD $0xf2f5798c  // movk	x12, #43980, lsl #48
	WORD $0x9bcc7d2c  // umulh	x12, x9, x12
	WORD $0xd35afd8c  // lsr	x12, x12, #26
	WORD $0x6f00e400  // movi.2d	v0, #0000000000000000
	WORD $0x6f00e401  // movi.2d	v1, #0000000000000000
	WORD $0x4e041d81  // mov.s	v1[0], w12
	WORD $0x5282eb2d  // mov	w13, #5977
	WORD $0x72ba36ed  // movk	w13, #53687, lsl #16
	WORD $0x0e040da2  // dup.2s	v2, w13
	WORD $0x0ea12823  // xtn.2s	v3, v1
	WORD $0x2ea2c063  // umull.2d	v3, v3, v2
	WORD $0x6f530463  // ushr.2d	v3, v3, #45
	WORD $0x5284e20d  // mov	w13, #10000
	WORD $0x0e040da4  // dup.2s	v4, w13
	WORD $0x0ea12865  // xtn.2s	v5, v3
	WORD $0x2ea4c0a5  // umull.2d	v5, v5, v4
	WORD $0x6ea58421  // sub.4s	v1, v1, v5
	WORD $0x4e413861  // zip1.8h	v1, v3, v1
	WORD $0x4f425421  // shl.2d	v1, v1, #2
	WORD $0x4e413821  // zip1.8h	v1, v1, v1
	WORD $0x4e813821  // zip1.4s	v1, v1, v1
Lloh64:
	WORD $0x10ffad8d  // adr	x13, lCPI0_0 $-2640(%rip)
Lloh65:
	WORD $0xfd4001a3  // ldr	d3, [x13, lCPI0_0@PAGEOFF] $0(%rip)
	WORD $0x2e63c025  // umull.4s	v5, v1, v3
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e63c021  // umull.4s	v1, v1, v3
	WORD $0x4e4158a1  // uzp2.8h	v1, v5, v1
Lloh66:
	WORD $0x10ffad0d  // adr	x13, lCPI0_1 $-2656(%rip)
Lloh67:
	WORD $0xfd4001a5  // ldr	d5, [x13, lCPI0_1@PAGEOFF] $0(%rip)
	WORD $0x2e65c026  // umull.4s	v6, v1, v5
	WORD $0x6e014021  // ext.16b	v1, v1, v1, #8
	WORD $0x2e65c021  // umull.4s	v1, v1, v5
	WORD $0x4e4158c1  // uzp2.8h	v1, v6, v1
	WORD $0x4f008546  // movi.8h	v6, #10
	WORD $0x4e669c27  // mul.8h	v7, v1, v6
	WORD $0x4f5054e7  // shl.2d	v7, v7, #16
	WORD $0x6e678421  // sub.8h	v1, v1, v7
	WORD $0x1b0aa589  // msub	w9, w12, w10, w9
	WORD $0x4e041d20  // mov.s	v0[0], w9
	WORD $0x0ea12807  // xtn.2s	v7, v0
	WORD $0x2ea2c0e2  // umull.2d	v2, v7, v2
	WORD $0x6f530442  // ushr.2d	v2, v2, #45
	WORD $0x0ea12847  // xtn.2s	v7, v2
	WORD $0x2ea4c0e4  // umull.2d	v4, v7, v4
	WORD $0x6ea48400  // sub.4s	v0, v0, v4
	WORD $0x4e403840  // zip1.8h	v0, v2, v0
	WORD $0x4f425400  // shl.2d	v0, v0, #2
	WORD $0x4e403800  // zip1.8h	v0, v0, v0
	WORD $0x4e803800  // zip1.4s	v0, v0, v0
	WORD $0x2e63c002  // umull.4s	v2, v0, v3
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e63c000  // umull.4s	v0, v0, v3
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x2e65c002  // umull.4s	v2, v0, v5
	WORD $0x6e004000  // ext.16b	v0, v0, v0, #8
	WORD $0x2e65c000  // umull.4s	v0, v0, v5
	WORD $0x4e405840  // uzp2.8h	v0, v2, v0
	WORD $0x4e669c02  // mul.8h	v2, v0, v6
	WORD $0x4f505442  // shl.2d	v2, v2, #16
	WORD $0x6e628400  // sub.8h	v0, v0, v2
	WORD $0x2e212821  // sqxtun.8b	v1, v1
	WORD $0x6e212801  // sqxtun2.16b	v1, v0
	WORD $0x4f01e600  // movi.16b	v0, #48
	WORD $0x4e208420  // add.16b	v0, v1, v0
	WORD $0x3cab4900  // str	q0, [x8, w11, uxtw]
	WORD $0x321c0169  // orr	w9, w11, #0x10
	WORD $0x11000528  // add	w8, w9, #1
	WORD $0xaa0803e0  // mov	x0, x8
	WORD $0xa940fbfd  // ldp	fp, lr, [sp, #8]
	WORD $0x910083ff  // add	sp, sp, #32
	WORD $0xd65f03c0  // ret
_Digits:
	WORD $0x31303030  // .ascii 4, '0001020304050607'
	WORD $0x33303230  // .ascii 4, '0203040506070809'
	WORD $0x35303430  // .ascii 4, '0405060708091011'
	WORD $0x37303630  // .ascii 4, '0607080910111213'
	WORD $0x39303830  // .ascii 4, '0809101112131415'
	WORD $0x31313031  // .ascii 4, '1011121314151617'
	WORD $0x33313231  // .ascii 4, '1213141516171819'
	WORD $0x35313431  // .ascii 4, '1415161718192021'
	WORD $0x37313631  // .ascii 4, '1617181920212223'
	WORD $0x39313831  // .ascii 4, '1819202122232425'
	WORD $0x31323032  // .ascii 4, '2021222324252627'
	WORD $0x33323232  // .ascii 4, '2223242526272829'
	WORD $0x35323432  // .ascii 4, '2425262728293031'
	WORD $0x37323632  // .ascii 4, '2627282930313233'
	WORD $0x39323832  // .ascii 4, '2829303132333435'
	WORD $0x31333033  // .ascii 4, '3031323334353637'
	WORD $0x33333233  // .ascii 4, '3233343536373839'
	WORD $0x35333433  // .ascii 4, '3435363738394041'
	WORD $0x37333633  // .ascii 4, '3637383940414243'
	WORD $0x39333833  // .ascii 4, '3839404142434445'
	WORD $0x31343034  // .ascii 4, '4041424344454647'
	WORD $0x33343234  // .ascii 4, '4243444546474849'
	WORD $0x35343434  // .ascii 4, '4445464748495051'
	WORD $0x37343634  // .ascii 4, '4647484950515253'
	WORD $0x39343834  // .ascii 4, '4849505152535455'
	WORD $0x31353035  // .ascii 4, '5051525354555657'
	WORD $0x33353235  // .ascii 4, '5253545556575859'
	WORD $0x35353435  // .ascii 4, '5455565758596061'
	WORD $0x37353635  // .ascii 4, '5657585960616263'
	WORD $0x39353835  // .ascii 4, '5859606162636465'
	WORD $0x31363036  // .ascii 4, '6061626364656667'
	WORD $0x33363236  // .ascii 4, '6263646566676869'
	WORD $0x35363436  // .ascii 4, '6465666768697071'
	WORD $0x37363636  // .ascii 4, '6667686970717273'
	WORD $0x39363836  // .ascii 4, '6869707172737475'
	WORD $0x31373037  // .ascii 4, '7071727374757677'
	WORD $0x33373237  // .ascii 4, '7273747576777879'
	WORD $0x35373437  // .ascii 4, '7475767778798081'
	WORD $0x37373637  // .ascii 4, '7677787980818283'
	WORD $0x39373837  // .ascii 4, '7879808182838485'
	WORD $0x31383038  // .ascii 4, '8081828384858687'
	WORD $0x33383238  // .ascii 4, '8283848586878889'
	WORD $0x35383438  // .ascii 4, '8485868788899091'
	WORD $0x37383638  // .ascii 4, '8687888990919293'
	WORD $0x39383838  // .ascii 4, '8889909192939495'
	WORD $0x31393039  // .ascii 4, '9091929394959697'
	WORD $0x33393239  // .ascii 4, '9293949596979899'
	WORD $0x35393439  // .ascii 4, '949596979899'
	WORD $0x37393639  // .ascii 4, '96979899'
	WORD $0x39393839  // .ascii 4, '9899'
	  // .p2align 4, 0x00
_VecShiftShuffles:
	WORD $0x03020100  // .ascii 4, '\x00\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f'
	WORD $0x07060504  // .ascii 4, '\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\x01\x02\x03\x04'
	WORD $0x0b0a0908  // .ascii 4, '\x08\t\n\x0b\x0c\r\x0e\x0f\x01\x02\x03\x04\x05\x06\x07\x08'
	WORD $0x0f0e0d0c  // .ascii 4, '\x0c\r\x0e\x0f\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c'
	WORD $0x04030201  // .ascii 4, '\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff'
	WORD $0x08070605  // .ascii 4, '\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\x02\x03\x04\x05'
	WORD $0x0c0b0a09  // .ascii 4, '\t\n\x0b\x0c\r\x0e\x0f\xff\x02\x03\x04\x05\x06\x07\x08\t'
	WORD $0xff0f0e0d  // .ascii 4, '\r\x0e\x0f\xff\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r'
	WORD $0x05040302  // .ascii 4, '\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff'
	WORD $0x09080706  // .ascii 4, '\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\x03\x04\x05\x06'
	WORD $0x0d0c0b0a  // .ascii 4, '\n\x0b\x0c\r\x0e\x0f\xff\xff\x03\x04\x05\x06\x07\x08\t\n'
	WORD $0xffff0f0e  // .ascii 4, '\x0e\x0f\xff\xff\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e'
	WORD $0x06050403  // .ascii 4, '\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff'
	WORD $0x0a090807  // .ascii 4, '\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\x04\x05\x06\x07'
	WORD $0x0e0d0c0b  // .ascii 4, '\x0b\x0c\r\x0e\x0f\xff\xff\xff\x04\x05\x06\x07\x08\t\n\x0b'
	WORD $0xffffff0f  // .ascii 4, '\x0f\xff\xff\xff\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f'
	WORD $0x07060504  // .ascii 4, '\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff'
	WORD $0x0b0a0908  // .ascii 4, '\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\x05\x06\x07\x08'
	WORD $0x0f0e0d0c  // .ascii 4, '\x0c\r\x0e\x0f\xff\xff\xff\xff\x05\x06\x07\x08\t\n\x0b\x0c'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff'
	WORD $0x08070605  // .ascii 4, '\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff'
	WORD $0x0c0b0a09  // .ascii 4, '\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\x06\x07\x08\t'
	WORD $0xff0f0e0d  // .ascii 4, '\r\x0e\x0f\xff\xff\xff\xff\xff\x06\x07\x08\t\n\x0b\x0c\r'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff'
	WORD $0x09080706  // .ascii 4, '\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff'
	WORD $0x0d0c0b0a  // .ascii 4, '\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff\x07\x08\t\n'
	WORD $0xffff0f0e  // .ascii 4, '\x0e\x0f\xff\xff\xff\xff\xff\xff\x07\x08\t\n\x0b\x0c\r\x0e'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff'
	WORD $0x0a090807  // .ascii 4, '\x07\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff\xff'
	WORD $0x0e0d0c0b  // .ascii 4, '\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff\xff\x08\t\n\x0b'
	WORD $0xffffff0f  // .ascii 4, '\x0f\xff\xff\xff\xff\xff\xff\xff\x08\t\n\x0b\x0c\r\x0e\x0f'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff'
	WORD $0x0b0a0908  // .ascii 4, '\x08\t\n\x0b\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff\xff\xff'
	WORD $0x0f0e0d0c  // .ascii 4, '\x0c\r\x0e\x0f\xff\xff\xff\xff\xff\xff\xff\xff'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff\xff\xff\xff\xff'
	WORD $0xffffffff  // .ascii 4, '\xff\xff\xff\xff'

TEXT ·__i64toa(SB), NOSPLIT, $0-24
	NO_LOCAL_POINTERS

_entry:
	MOVD 16(g), R16
	SUB $96, RSP, R17
	CMP  R16, R17
	BLS  _stack_grow

_i64toa:
	MOVD out+0(FP), R0
	MOVD val+8(FP), R1
	MOVD ·_subr__i64toa(SB), R11
	WORD $0x1000005e // adr x30, .+8
	JMP (R11)
	MOVD R0, ret+16(FP)
	RET

_stack_grow:
	MOVD R30, R3
	CALL runtime·morestack_noctxt<>(SB)
	JMP  _entry
