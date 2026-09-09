/* Binary-derived Cortex-M4 instructions and constant tables. */
.syntax unified
.cpu cortex-m4
.thumb

.section .text.vocoder_block_0,"ax",%progbits
.balign 4
.global asm_unpack
.type asm_unpack, %function
.thumb_func
asm_unpack:
    push	{r3, r4, r5, r6, r7, lr}
    movs	r4, r0
    movs	r5, r1
    uxtb	r2, r2
    subs	r0, r2, #1
    movs	r1, #8
    sdiv	r0, r0, r1
    adds	r6, r0, #1
    uxtb	r2, r2
    movs	r0, #8
    sdiv	r7, r2, r0
    mls	r7, r7, r0, r2
    uxtb	r2, r2
    lsls	r2, r2, #1
    movs	r1, #0
    movs	r0, r4
    bl .Lcode_2487
    uxtb	r7, r7
    cmp	r7, #0
    beq.n .Lcode_2139
    movs	r0, #0
    b.n .Lcode_2113
.Lcode_2096:
    uxtb	r0, r0
    ldrb	r2, [r0, r5]
    uxtb	r1, r1
    ldr	r3, .Lliteral_2165
    ldrb	r3, [r1, r3]
    tst	r2, r3
    beq.n .Lcode_2108
    uxtb	r0, r0
    lsls	r2, r0, #3
    uxtab	r2, r2, r1
    movs	r3, #1
    strh.w	r3, [r4, r2, lsl #1]
.Lcode_2108:
    .inst.n 0x1c49 @ adds	r1, r1, #1
.Lcode_2109:
    uxtb	r1, r1
    cmp	r1, #8
    bcc.n .Lcode_2096
    .inst.n 0x1c40 @ adds	r0, r0, #1
.Lcode_2113:
    uxtb	r0, r0
    uxtb	r6, r6
    subs	r1, r6, #1
    cmp	r0, r1
    bge.n .Lcode_2120
    movs	r1, #0
    b.n .Lcode_2109
.Lcode_2120:
    movs	r1, #0
.Lcode_2121:
    uxtb	r1, r1
    uxtb	r7, r7
    cmp	r1, r7
    bcs.n .Lcode_2164
    uxtb	r0, r0
    ldrb	r2, [r0, r5]
    uxtb	r1, r1
    ldr	r3, .Lliteral_2165
    ldrb	r3, [r1, r3]
    tst	r2, r3
    beq.n .Lcode_2137
    uxtb	r0, r0
    lsls	r2, r0, #3
    uxtab	r2, r2, r1
    movs	r3, #1
    strh.w	r3, [r4, r2, lsl #1]
.Lcode_2137:
    .inst.n 0x1c49 @ adds	r1, r1, #1
    b.n .Lcode_2121
.Lcode_2139:
    movs	r0, #0
    b.n .Lcode_2158
.Lcode_2141:
    uxtb	r0, r0
    ldrb	r2, [r0, r5]
    uxtb	r1, r1
    ldr	r3, .Lliteral_2165
    ldrb	r3, [r1, r3]
    tst	r2, r3
    beq.n .Lcode_2153
    uxtb	r0, r0
    lsls	r2, r0, #3
    uxtab	r2, r2, r1
    movs	r3, #1
    strh.w	r3, [r4, r2, lsl #1]
.Lcode_2153:
    .inst.n 0x1c49 @ adds	r1, r1, #1
.Lcode_2154:
    uxtb	r1, r1
    cmp	r1, #8
    bcc.n .Lcode_2141
    .inst.n 0x1c40 @ adds	r0, r0, #1
.Lcode_2158:
    uxtb	r0, r0
    uxtb	r6, r6
    cmp	r0, r6
    bcs.n .Lcode_2164
    movs	r1, #0
    b.n .Lcode_2154
.Lcode_2164:
    pop	{r0, r4, r5, r6, r7, pc}
    .byte 0x00
    .byte 0x00
    .word 0x2000e148
    .word 0x41f0e92d
    .word 0x000d0004
    .word 0x27000016
    .word 0x0800f05f
    .word 0x1e70b2f6
    .word 0xfb902108
    .word 0x1c42f0f1
    .word 0x00202100
    .word 0xfbe6f008
    .word 0xe0112000
    .word 0xf815b2c0
    .word 0x07c91010
    .word 0xb2c0d50b
    .word 0xf01008c7
    .word 0xb2ff0807
    .word 0x22805d39
    .word 0xf208fa52
    .word 0xb2ff4311
    .word 0x1c405539
    .word 0xb2f6b2c0
    .word 0xd3e942b0
    .word 0x81f0e8bd
    .word 0xb082b510
    .word 0x4929221b
    .word 0x78004829
    .word 0x4c29231b
    .word 0x4000fb03
    .word 0xfbcaf008
    .word 0x78004825
    .word 0xd0032800
    .word 0x21004823
    .word 0xe0027001
    .word 0x21014821
    .word 0xab007001
    .word 0x21012201
    .word 0x68004813
    .word 0xf813f7fd
    .word 0xb510bd13
    .word 0x221bb082
    .word 0x481c4913
    .word 0x231b7800
    .word 0xfb034c1b
    .word 0xf0084000
    .word 0x4818fbab
    .word 0x28007800
    .word 0x4816d003
    .word 0x70012100
    .word 0x4814e002
    .word 0x70012101
    .word 0x2201ab00
    .word 0x48042102
    .word 0xf7fc6800
    .word 0xbd13fff4
    .word 0x2000de60
    .word 0x2000de62
    .word 0x2001d234
    .word 0x20011224
    .word 0x20011c8e
    .word 0x2001d228
    .word 0x20011e14
    .word 0x2001d40a
    .word 0x2001cba0
    .word 0x20011a1c
    .word 0x20011a64
.Lliteral_2165:
    .word asm_unpack_masks

.section .text.vocoder_block_1,"ax",%progbits
.balign 4
.Lcode_2166:
.global asm_memset_bytes
.type asm_memset_bytes, %function
.thumb_func
asm_memset_bytes:
    bfi	r2, r2, #8, #8
    bfi	r2, r2, #16, #16
.global asm_fill_pattern_bytes
.type asm_fill_pattern_bytes, %function
.thumb_func
asm_fill_pattern_bytes:
    adds	r0, r0, r1
    ands.w	r3, r0, #3
    beq.n .Lcode_2178
    subs	r1, r1, r3
    bcc.n .Lcode_2198
    lsls	r3, r3, #31
    it	mi
    strbmi.w	r2, [r0, #-1]!
    it	cs
    strhcs.w	r2, [r0, #-2]!
.Lcode_2178:
    movs	r3, r2
    push	{r4, r5}
    mov	r4, r2
    mov	r5, r2
.Lcode_2182:
    subs	r1, #16
    it	cs
    stmdbcs	r0!, {r2, r3, r4, r5}
    bhi.n .Lcode_2182
    lsls	r1, r1, #29
    it	cs
    stmdbcs	r0!, {r2, r3}
    it	mi
    strmi.w	r2, [r0, #-4]!
    lsls	r1, r1, #2
    it	cs
    strhcs.w	r2, [r0, #-2]!
    it	mi
    strbmi.w	r2, [r0, #-1]!
    pop	{r4, r5}
    bx	lr
.Lcode_2198:
    adds	r1, r1, r3
    it	ne
    strbne.w	r2, [r0, #-1]!
    lsls	r3, r1, #31
    it	cs
    strbcs.w	r2, [r0, #-1]!
    bx	lr
    .byte 0x18
    .byte 0x00

.section .text.vocoder_block_2,"ax",%progbits
.balign 4
.Lcode_2209:
.global asm_run_encoder_analysis
.type asm_run_encoder_analysis, %function
.thumb_func
asm_run_encoder_analysis:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    rsb	r5, r2, #380
    mov	r7, r2
    add.w	r2, r0, r2, lsl #1
    adds	r5, #3
    add.w	r6, r0, #4992
    add.w	r2, r2, #4992
    sub.w	sp, sp, #548
    adds	r2, #36
    sxth	r5, r5
    adds	r6, #36
    mov	r4, r0
    mov	sl, r3
    mov	r8, r1
    movs	r3, #0
    mov	r1, r2
    mov	r0, r6
    mov	r2, r5
    ldrsh.w	r9, [sp, #584]
    strh.w	r3, [sp, #542]
    bl .Lcode_2496
    tst.w	sl, #256
    add.w	r5, r4, r5, lsl #1
    beq.n .Lcode_2304
    add.w	r0, r5, #4992
    adds	r0, #36
    mov	r1, r8
    mov	r2, r7
    bl .Lcode_2496
.Lcode_2238:
    add.w	r8, r4, #540
    mov	r1, r8
    add.w	r0, r4, #1056
    mov.w	r2, #258
    bl .Lcode_2496
    ldrh.w	r3, [r4, #1574]
    add.w	r5, r4, #24
    mov	r1, r5
    strh.w	r3, [r4, #1576]
    mov.w	r2, #258
    mov	r0, r8
    bl .Lcode_2496
    ldrh.w	r3, [r4, #1572]
    ldr	r2, .Lliteral_2311
    strh.w	r3, [r4, #1574]
    mov.w	ip, #199
    mov.w	lr, #0
    stmia.w	sp, {ip, lr}
    add.w	r1, r4, #5056
    mov.w	lr, #8
    adds	r1, #28
    add.w	fp, sp, #24
    str.w	lr, [sp, #12]
    mvn.w	r3, #6
    mov.w	lr, #1
    mov	r0, r5
    str.w	lr, [sp, #16]
    str.w	fp, [sp, #8]
    bl .Lcode_2642
    add.w	r8, r4, #2336
    mov	lr, r0
    strh.w	lr, [r4, #1572]
    add.w	r8, r8, #24
    and.w	lr, sl, #128
    stmia.w	sp, {r7, r8, lr}
    add.w	ip, r4, #5760
    add.w	lr, sp, #536
    add.w	ip, ip, #56
    add.w	r0, r4, #2896
    mov	r1, r5
    mov	r2, r9
    mov	r3, r6
    add.w	lr, lr, #6
    str.w	lr, [sp, #12]
    str.w	ip, [sp, #16]
    bl .Lcode_2764
    ldrsh.w	lr, [sp, #542]
    str	r7, [sp, #0]
    mov	r1, r9
    mov	r2, r6
    mov	r3, fp
    mov	r0, r5
    str.w	r8, [sp, #4]
    str.w	lr, [sp, #8]
    bl .Lcode_3993
    ldrsh.w	r3, [r4, #2744]
    ldrsh.w	r2, [r4, #1572]
    str	r3, [sp, #4]
    add.w	r0, r4, #4928
    adds	r0, #48
    mov	r1, r5
    mov	r3, sl
    str.w	r9, [sp]
    bl .Lcode_4484
    add.w	sp, sp, #548
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_2304:
    add.w	r1, r5, #4992
    adds	r1, #36
    mov	r0, r4
    mov	r2, r8
    mov	r3, r7
    bl .Lcode_4642
    b.n .Lcode_2238
.Lliteral_2311:
    .word .Ldata_20696
.global asm_encode_thing
.type asm_encode_thing, %function
.thumb_func
asm_encode_thing:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    sub	sp, #8
    cmp	r3, #76
    it	lt
    movlt	r3, #76
    ldrsh.w	r5, [sp, #32]
    ldr	r6, [sp, #44]
    ldrsh.w	r4, [sp, #36]
    cmp	r3, #84
    it	ge
    movge	r3, #84
    mov	r8, r1
    mov	r7, r0
    mov	r1, r2
    mov	r0, r6
    mov	r2, r3
    mov	r3, r5
    str	r4, [sp, #0]
    bl .Lcode_2209
    ands.w	r0, r4, #1
    beq.n .Lcode_2344
    ands.w	r4, r5, #8192
    bne.n .Lcode_2346
.Lcode_2335:
    sxth	r4, r4
    mov	r0, r7
    mov	r1, r8
    mov	r2, r5
    ldrsh.w	r3, [sp, #40]
    str	r6, [sp, #0]
    str	r4, [sp, #4]
    bl .Lcode_4678
    sxth	r0, r0
.Lcode_2344:
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_2346:
    add.w	r0, r6, #2336
    add.w	r1, r6, #1584
    add.w	r2, r6, #5760
    adds	r0, #24
    adds	r1, #10
    adds	r2, #34
    bl .Lcode_2407
    movw	r3, #21771
    smulbb	r4, r0, r3
    ubfx	r4, r4, #14, #16
    b.n .Lcode_2335
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_3,"ax",%progbits
.balign 4
.global asm_decode_wav
.type asm_decode_wav, %function
.thumb_func
asm_decode_wav:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub	sp, #152
    cmp	r1, #76
    ite	ge
    movge	r6, r1
    movlt	r6, #76
    ldr	r4, [sp, #192]
    ldrsh.w	r5, [sp, #188]
    mov	r9, r3
    movs	r3, #80
    mov	r7, r0
    mov	sl, r2
    cmp	r6, #84
    it	ge
    movge	r6, #84
    strh.w	r3, [r4, #372]
    cbz	r5, .Lcode_2384
    add.w	r0, r4, #1004
    mov	r1, r7
    mov	r2, r6
    mov	r3, r5
    str	r4, [sp, #0]
    bl .Lcode_5850
    movs	r0, #0
.Lcode_2381:
    sxth	r0, r0
    add	sp, #152
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_2384:
    add.w	r8, sp, #16
    mov	r1, r5
    movs	r2, #68
    mov	r0, r8
    bl .Lcode_2535
    mov	r1, r9
    add.w	lr, r4, #1004
    ldrsh.w	r2, [sp, #184]
    str.w	lr, [sp]
    mov	r3, r6
    mov	r0, sl
    str.w	r8, [sp, #4]
    str	r4, [sp, #8]
    bl .Lcode_6302
    mov	r1, r7
    mov	r9, r0
    mov	r2, r6
    mov	r0, r8
    mov	r3, r5
    str	r4, [sp, #0]
    bl .Lcode_5850
    uxth.w	r0, r9
    b.n .Lcode_2381
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_4,"ax",%progbits
.balign 4
.Lcode_2407:
.global asm_update_encoder_metric
.type asm_update_encoder_metric, %function
.thumb_func
asm_update_encoder_metric:
    stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldrsh.w	r3, [r2]
    ldrsh.w	r8, [r0, #74]
    ldrh.w	ip, [r2, #18]
    lsls	r7, r3, #16
    mov.w	r8, r8, lsl #16
    rsb	r5, r7, r8
    lsrs	r5, r5, #16
    sxth.w	r6, ip
    sxth	r4, r5
    rsb	r9, r6, #0
    cmp	r4, r9
    bge.n .Lcode_2423
    rsb	r5, ip, #0
    uxth	r5, r5
    sxth	r4, r5
.Lcode_2423:
    ldrsh.w	ip, [r0, #80]
    cmp	r4, r6
    mov.w	ip, ip, lsl #16
    ble.n .Lcode_2464
    ldrh	r3, [r2, #10]
    ldrsh.w	r1, [r2, #20]
.Lcode_2429:
    smulbb	r3, r5, r3
    add.w	r3, r7, r3, lsl #1
    lsrs	r3, r3, #16
    strh	r3, [r2, #0]
    sxth	r3, r3
.Lcode_2434:
    ldrh	r4, [r2, #8]
    sxth	r0, r4
    cmp	r3, r0
    it	lt
    movlt	r3, r0
    ldrsh.w	r0, [r2, #2]
    it	lt
    strhlt	r4, [r2, #0]
    lsls	r3, r3, #16
    ldrh	r4, [r2, #4]
    rsb	r0, r3, r0, lsl #16
    asrs	r5, r0, #16
    cmp.w	r0, r4, lsl #16
    bgt.n .Lcode_2453
    ldrsh.w	r4, [r2, #6]
    cmp	r5, r4
    it	ge
    movge	r4, r5
    uxth	r4, r4
.Lcode_2453:
    rsb	r3, ip, r3
    asrs	r3, r3, #16
    cmp	r3, r1
    bge.n .Lcode_2462
    lsls	r0, r3, #12
    bl .Lcode_6534
    lsls	r0, r0, #20
    smultb	r4, r0, r4
    ubfx	r4, r4, #15, #16
.Lcode_2462:
    sxth	r0, r4
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.Lcode_2464:
    cmp	r4, #0
    ble.n .Lcode_2469
    ldrh	r3, [r2, #12]
    ldrsh.w	r1, [r2, #20]
    b.n .Lcode_2429
.Lcode_2469:
    ldrsh.w	r0, [r0, #246]
    cmp.w	r0, #16384
    ble.n .Lcode_2482
    ldrsh.w	r1, [r1, #10]
    movw	r3, #3275
    cmp	r1, r3
    ldrsh.w	r1, [r2, #20]
    bgt.n .Lcode_2485
    rsb	r8, ip, r8
    cmp.w	r1, r8, asr #16
    bge.n .Lcode_2485
    ldrh	r3, [r2, #14]
    b.n .Lcode_2429
.Lcode_2482:
    cmp.w	r0, #8192
    ldrsh.w	r1, [r2, #20]
    ble.n .Lcode_2434
.Lcode_2485:
    ldrh	r3, [r2, #16]
    b.n .Lcode_2429
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_5,"ax",%progbits
.balign 4
.Lcode_2487:
.global asm_fill_bytes
.type asm_fill_bytes, %function
.thumb_func
asm_fill_bytes:
    push	{r4, lr}
    movs	r4, r0
    movs	r0, r2
    movs	r2, r1
    movs	r1, r0
    movs	r0, r4
    bl .Lcode_2166
    movs	r0, r4
    pop	{r4, pc}

.section .text.vocoder_block_6,"ax",%progbits
.balign 4
.Lcode_2496:
.global asm_copy_i16
.type asm_copy_i16, %function
.thumb_func
asm_copy_i16:
    cmp	r2, #0
    push	{r4, r5, r6, r7}
    ble.n .Lcode_2533
    eor.w	r3, r0, r1
    lsls	r3, r3, #30
    bmi.n .Lcode_2528
    lsls	r3, r1, #30
    bpl.n .Lcode_2507
    ldrh.w	r3, [r1], #2
    strh.w	r3, [r0], #2
    subs	r2, #1
.Lcode_2507:
    subs	r7, r2, #1
    cmp	r7, #0
    ble.n .Lcode_2526
    subs	r2, #2
    lsrs	r2, r2, #1
    adds	r6, r0, #4
    mov	r4, r1
    add.w	r6, r6, r2, lsl #2
    mov	r3, r0
.Lcode_2516:
    ldr.w	r5, [r4], #4
    str.w	r5, [r3], #4
    cmp	r3, r6
    bne.n .Lcode_2516
    adds	r3, r2, #1
    lsls	r3, r3, #2
    subs	r7, #2
    adds	r0, r0, r3
    adds	r1, r1, r3
    sub.w	r7, r7, r2, lsl #1
.Lcode_2526:
    adds	r2, r7, #1
    beq.n .Lcode_2533
.Lcode_2528:
    add.w	r2, r0, r2, lsl #1
.Lcode_2529:
    ldrh.w	r3, [r1], #2
    strh.w	r3, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_2529
.Lcode_2533:
    pop	{r4, r5, r6, r7}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_2535:
.global asm_fill_i16
.type asm_fill_i16, %function
.thumb_func
asm_fill_i16:
    lsls	r3, r1, #16
    cmp	r2, #0
    push	{r4, r5, r6}
    add.w	r3, r3, r3, lsr #16
    ble.n .Lcode_2561
    lsls	r6, r0, #30
    itt	mi
    strhmi.w	r1, [r0], #2
    submi	r2, #1
    subs	r6, r2, #1
    cmp	r6, #0
    ble.n .Lcode_2559
    subs	r2, #2
    lsrs	r2, r2, #1
    adds	r5, r0, #4
    add.w	r5, r5, r2, lsl #2
    mov	r4, r0
.Lcode_2552:
    str.w	r3, [r4], #4
    cmp	r4, r5
    bne.n .Lcode_2552
    adds	r3, r2, #1
    subs	r6, #2
    add.w	r0, r0, r3, lsl #2
    sub.w	r6, r6, r2, lsl #1
.Lcode_2559:
    cbnz	r6, .Lcode_2561
    strh.w	r1, [r0], #2
.Lcode_2561:
    pop	{r4, r5, r6}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_2563:
.global asm_multiply_symmetric
.type asm_multiply_symmetric, %function
.thumb_func
asm_multiply_symmetric:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl}
    ldr	r4, [sp, #32]
    ldr	r6, [sp, #28]
    asrs	r5, r4, #1
    subs	r7, r5, #1
    lsls	r7, r7, #1
    mov.w	ip, r5, lsl #1
    add.w	r9, r6, r7
    add.w	r8, r1, ip
    adds	r7, r1, r7
    cmp	r3, #0
    bne.n .Lcode_2606
    add.w	sl, r2, #4294967295
    add.w	sl, r0, sl, lsl #1
.Lcode_2577:
    lsls	r3, r4, #31
    bpl.n .Lcode_2587
    ldrh.w	r6, [r6, r5, lsl #1]
    ldrh.w	r3, [r1, r5, lsl #1]
    smulbb	r3, r6, r3
    lsls	r3, r3, #1
    add.w	r3, r3, #32768
    asrs	r3, r3, #16
    strh.w	r3, [r0], #2
    add.w	r8, r8, #2
.Lcode_2587:
    add	ip, r0
.Lcode_2588:
    ldrh.w	r3, [r9], #-2
    ldrh.w	r1, [r8], #2
    smulbb	r1, r3, r1
    add.w	r1, r1, #16384
    asrs	r1, r1, #15
    strh.w	r1, [r0], #2
    ldrh.w	r1, [r7], #-2
    smulbb	r3, r3, r1
    add.w	r3, r3, #16384
    asrs	r3, r3, #15
    cmp	r0, ip
    strh.w	r3, [sl], #-2
    bne.n .Lcode_2588
    subs	r2, r2, r4
    sxth	r2, r2
    movs	r1, #0
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl}
    b.w .Lcode_2535
.Lcode_2606:
    add.w	r0, r0, r3, lsl #1
    sub.w	sl, r0, #2
    b.n .Lcode_2577
    .byte 0x00
    .byte 0xbf
.Lcode_2609:
.global asm_windowed_real_fft_energy
.type asm_windowed_real_fft_energy, %function
.thumb_func
asm_windowed_real_fft_energy:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #12
    add	r4, sp, #52
    ldmia.w	r4, {r4, r8, r9}
    ldr	r5, [sp, #44]
    movs	r6, #1
    lsl.w	r6, r6, r8
    mov	lr, r3
    mov	r7, r2
    str	r5, [sp, #4]
    mov	r2, r6
    ldr	r3, [sp, #48]
    str.w	lr, [sp]
    mov	r5, r0
    mov	r0, r4
    bl .Lcode_2563
    ldr	r1, [sp, #40]
    mov	r0, r4
    adds	r1, r7, r1
    mov	r2, r8
    mov	r3, r9
    bl .Lcode_7371
    mov	r7, r0
    cbz	r5, .Lcode_2639
    add.w	r6, r9, r6, asr #1
    lsls	r7, r0, #1
    sxth	r2, r6
    mov	r0, r5
    mov	r1, r4
    bl .Lcode_7615
.Lcode_2639:
    mov	r0, r7
    add	sp, #12
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_2642:
.global asm_normalized_windowed_fft_energy
.type asm_normalized_windowed_fft_energy, %function
.thumb_func
asm_normalized_windowed_fft_energy:
    push	{r4, r5, r6, r7, lr}
    sub.w	sp, sp, #548
    mov	r6, r0
    ldr	r4, [sp, #568]
    sxth	r7, r4
    mov	r5, r2
    add	r0, sp, #28
    mov	r2, r7
    mov	r7, r3
    movs	r3, #0
    str	r3, [sp, #540]
    bl .Lcode_2496
    add	r0, sp, #28
    mov	r1, r0
    mov	r2, r4
    add	r3, sp, #540
    bl .Lcode_7675
    str	r4, [sp, #4]
    ldr	r4, [sp, #572]
    ldr	r2, [sp, #540]
    str	r4, [sp, #8]
    ldr	r4, [sp, #576]
    str	r7, [sp, #0]
    str	r4, [sp, #12]
    ldr	r4, [sp, #580]
    str	r4, [sp, #16]
    ldr	r4, [sp, #584]
    mov	r0, r6
    add	r1, sp, #28
    mov	r3, r5
    str	r4, [sp, #20]
    bl .Lcode_2609
    add.w	sp, sp, #548
    pop	{r4, r5, r6, r7, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_2676:
.global asm_update_gain_if_above_threshold
.type asm_update_gain_if_above_threshold, %function
.thumb_func
asm_update_gain_if_above_threshold:
    lsls	r2, r2, #16
    cmp	r3, #4
    push	{r4, lr}
    mov	r4, r0
    ble.n .Lcode_2725
    subs	r3, #5
    ldrsh.w	r0, [sp, #12]
    lsls.w	r3, r2, r3
    cmp.w	r0, r3, asr #16
    bge.n .Lcode_2730
.Lcode_2686:
    ldrsh.w	r3, [sp, #8]
    lsls	r1, r1, #16
    rsb	r1, r1, r3, lsl #16
    ldr	r3, [sp, #20]
    sub.w	r1, r1, r3, lsl #16
    cmp	r1, #0
    ble.n .Lcode_2732
    asrs	r1, r1, #16
    ldrsh.w	r0, [sp, #16]
    cmp.w	r1, #512
    it	ge
    movge.w	r1, #512
    mul.w	r0, r0, r1
    lsls	r0, r0, #1
    mov	r1, r0
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r0, r1
    asrs	r0, r0, #16
    movs	r2, #3
    rsb	r1, r1, #8
    bl .Lcode_6911
    ldrh	r3, [r4, #0]
    smulbb	r0, r0, r3
    lsls	r3, r0, #1
    lsls	r0, r0, #4
    cmp.w	r3, r0, asr #3
    itt	ne
    mvnne.w	r0, #2147483648
    eorne.w	r0, r0, r3, asr #31
    asrs	r0, r0, #16
    strh	r0, [r4, #0]
    movs	r0, #0
    pop	{r4, pc}
.Lcode_2725:
    rsb	r3, r3, #5
    ldrsh.w	r0, [sp, #12]
    asrs.w	r3, r2, r3
    cmp.w	r0, r3, asr #16
    blt.n .Lcode_2686
.Lcode_2730:
    movs	r0, #1
    pop	{r4, pc}
.Lcode_2732:
    movs	r0, #1
    pop	{r4, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_2734:
.global asm_ratio_of_i32_sums
.type asm_ratio_of_i32_sums, %function
.thumb_func
asm_ratio_of_i32_sums:
    push	{r4, r5, lr}
    sub	sp, #20
    mov	r4, r1
    mov	r5, r2
    movs	r1, #128
    add	r2, sp, #8
    str	r4, [sp, #8]
    str	r3, [sp, #12]
    bl .Lcode_7468
    movs	r1, #128
    mov	r4, r0
    add	r2, sp, #12
    mov	r0, r5
    bl .Lcode_7468
    lsrs	r0, r0, #16
    bne.n .Lcode_2761
    mvn.w	r3, #12
    str	r3, [sp, #12]
    movw	r2, #26843
.Lcode_2753:
    ldr	r1, [sp, #32]
    mov	r0, r4
    str	r1, [sp, #0]
    ldr	r1, [sp, #8]
    bl .Lcode_6721
    sxth	r0, r0
    add	sp, #20
    pop	{r4, r5, pc}
.Lcode_2761:
    sxth	r2, r0
    ldr	r3, [sp, #12]
    b.n .Lcode_2753
    .byte 0x00
    .byte 0xbf
.Lcode_2764:
.global asm_analyze_encoder_frame
.type asm_analyze_encoder_frame, %function
.thumb_func
asm_analyze_encoder_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #1920
    sub	sp, #4
    add	r4, sp, #676
    str	r3, [sp, #156]
    str	r0, [sp, #60]
    ldr	r5, [sp, #156]
    ldr.w	r0, [sp, #1960]
    str	r2, [sp, #152]
    str	r0, [sp, #8]
    mov	r2, r4
    add.w	r3, sp, #1904
    str	r1, [sp, #120]
    str	r5, [sp, #0]
    add.w	r1, sp, #1256
    movw	r5, #383
    ldr	r0, [sp, #60]
    str	r5, [sp, #4]
    bl .Lcode_7836
    ldr	r5, [sp, #60]
    str	r0, [sp, #140]
    ldrsh.w	r2, [r5, #1580]
    ldr.w	r0, [sp, #1964]
    ldr.w	r3, [sp, #1904]
    lsls	r2, r2, #1
    adds	r2, #7
    mov	r1, r4
    bl .Lcode_8020
    ldr	r4, [sp, #152]
    ldr	r5, [sp, #140]
    cmp	r4, #0
    uxth	r5, r5
    str	r5, [sp, #148]
    ble.w .Lcode_3848
    mvn.w	r3, #29
    ldr	r4, [sp, #60]
    str.w	r3, [sp, #1908]
    add.w	r1, sp, #1728
    add.w	r3, sp, #1600
    add.w	r0, r4, #1568
    adds	r3, #4
    adds	r1, #4
    movs	r2, #0
.Lcode_2807:
    str.w	r2, [r3, #4]!
    cmp	r3, r1
    bne.n .Lcode_2807
    movs	r1, #7
    bl .Lcode_7417
    ldr.w	r5, [sp, #1964]
    movs	r3, #0
    ldrh.w	r7, [r5, #114]
    ldrh.w	r6, [r5, #82]
    str.w	r3, [sp, #1916]
    add.w	r4, r5, #84
    mov	fp, r0
    movs	r5, #1
.Lcode_2820:
    ldrsh.w	r0, [r4], #2
    sxth	r2, r6
    ldrsh.w	r1, [r4, #30]
    sxth	r3, r7
    bl .Lcode_6768
    adds	r5, #1
    uxth	r5, r5
    cbz	r0, .Lcode_2830
    ldrh.w	r6, [r4, #-2]
    ldrh	r7, [r4, #30]
.Lcode_2830:
    cmp	r5, #16
    bne.n .Lcode_2820
    ldr.w	r4, [sp, #1964]
    add.w	lr, sp, #1904
    add.w	lr, lr, #12
    add.w	r5, r4, #334
    movs	r1, #0
    movs	r4, #8
    str.w	lr, [sp, #136]
    mov	r8, lr
.Lcode_2840:
    ldrsh.w	r2, [r5, #2]!
    sxth	r0, r1
    ldrsh.w	r3, [r5, #32]
    ldr.w	r1, [sp, #1916]
    str.w	r8, [sp]
    bl .Lcode_6611
    subs	r4, #1
    uxth	r4, r4
    uxth	r1, r0
    cmp	r4, #0
    bne.n .Lcode_2840
    ldr.w	r4, [sp, #1964]
    ldrh.w	r5, [r4, #384]
    sxth	r4, r1
    mov	r0, r4
    ldr.w	r1, [sp, #1916]
    movw	r2, #31250
    mvn.w	r3, #9
    bl .Lcode_6768
    cmp	r0, #0
    beq.w .Lcode_3851
    movs	r5, #1
    str	r5, [sp, #132]
.Lcode_2863:
    ldr.w	r4, [sp, #1964]
    movs	r1, #8
    add.w	r0, r4, #80
    movs	r2, #0
    movs	r3, #0
    movs	r6, #1
    b.n .Lcode_2876
.Lcode_2870:
    subs	r1, #1
    subs	r4, #5
    uxth	r1, r1
    lsls	r5, r4
    smlal	r2, r3, r6, r5
    cbz	r1, .Lcode_2888
.Lcode_2876:
    ldrsh.w	r5, [r0, #2]!
    ldrsh.w	r4, [r0, #32]
    lsls	r5, r5, #16
    cmp	r4, #4
    bgt.n .Lcode_2870
    subs	r1, #1
    rsb	r4, r4, #5
    uxth	r1, r1
    asrs	r5, r4
    smlal	r2, r3, r6, r5
    cmp	r1, #0
    bne.n .Lcode_2876
.Lcode_2888:
    lsrs	r1, r2, #3
    orr.w	r1, r1, r3, lsl #29
    mov.w	r3, #36864
    asrs	r2, r1, #16
    movt	r3, #65535
    movs	r5, #5
    movs	r4, #1
    cmp	r2, r3
    it	lt
    movlt	r2, r3
    str	r5, [sp, #112]
    str	r4, [sp, #64]
.Lcode_2900:
    ldr	r4, [sp, #60]
    ldr	r5, [sp, #148]
    str.w	fp, [sp, #48]
    add.w	r4, r4, #1568
    sxth	r5, r5
    str	r4, [sp, #88]
    ldr	r4, [sp, #60]
    str	r5, [sp, #80]
    sub.w	r3, r5, #9
    add.w	r3, r4, r3, lsl #1
    ldr.w	r4, [sp, #1964]
    str	r3, [sp, #76]
    str	r4, [sp, #84]
    add.w	r4, sp, #1256
    str	r4, [sp, #72]
    movs	r4, #0
    str	r4, [sp, #52]
    ldr	r4, [sp, #88]
    adds	r4, #12
    str	r4, [sp, #88]
    movw	r4, #56798
    movt	r4, #65535
    rsb	r0, r5, #58
    add.w	sl, sp, #740
    str	r4, [sp, #124]
    movw	r4, #48060
    add.w	r1, sl, r0, lsl #1
    add.w	r9, sp, #1864
    lsls	r2, r2, #16
    add	r5, sp, #164
    sxth	r0, r0
    movt	r4, #65535
    str	r1, [sp, #92]
    str	r2, [sp, #144]
    str.w	r9, [sp, #68]
    str	r0, [sp, #96]
    add.w	r8, sp, #1736
    str	r4, [sp, #128]
    mov	r7, r5
    str.w	sl, [sp, #104]
.Lcode_2940:
    movs	r5, #0
    str	r5, [sp, #28]
    ldr	r5, [sp, #76]
    ldr	r4, [sp, #52]
    str	r5, [sp, #40]
    ldr	r5, [sp, #72]
    str	r7, [sp, #108]
    lsls	r4, r4, #1
    str	r4, [sp, #56]
    str	r5, [sp, #44]
    mov	r4, r7
    movs	r5, #0
    ldr	r7, [sp, #104]
    str	r5, [sp, #32]
    str	r5, [sp, #100]
    str	r5, [sp, #116]
    str	r5, [sp, #36]
.Lcode_2957:
    ldr	r1, [sp, #40]
    ldr	r2, [sp, #96]
    mov	r0, r7
    bl .Lcode_2496
    ldr	r0, [sp, #92]
    ldr	r1, [sp, #44]
    ldr	r2, [sp, #80]
    bl .Lcode_2496
    ldr	r5, [sp, #88]
    ldr.w	sl, [sp, #48]
    movs	r6, #6
.Lcode_2968:
    ldrsh.w	r2, [r5, #2]!
    ldrsh.w	r1, [r5, #2]
    ldrsh.w	r3, [r5, #-14]
    str.w	sl, [sp]
    add.w	r0, r7, r2, lsl #1
    subs	r2, r1, r2
    mov	r1, r0
    bl .Lcode_7784
    subs	r6, #1
    bne.n .Lcode_2968
    ldr	r5, [sp, #60]
    ldrsh.w	r2, [r5, #1594]
    ldrsh.w	r3, [r5, #1580]
    ldr	r5, [sp, #48]
    add.w	r0, r7, r2, lsl #1
    mov	r1, r0
    str	r5, [sp, #0]
    rsb	r2, r2, #58
    movs	r5, #58
    bl .Lcode_7784
    str	r5, [sp, #4]
    movs	r5, #29
    str	r5, [sp, #8]
    mov	r0, r4
    movs	r5, #6
    mov	r1, r7
    ldr	r2, [sp, #48]
    ldr	r3, .Lliteral_3041
    str	r5, [sp, #16]
    str	r6, [sp, #0]
    str	r7, [sp, #12]
    str	r6, [sp, #20]
    bl .Lcode_2609
    ldr	r5, [sp, #32]
    str	r6, [r4, #4]
    add.w	lr, sp, #1896
    mov	ip, r0
    str.w	r0, [lr, r5]
    ldr	r5, [sp, #64]
    str	r6, [r4, #0]
    cmp	r5, #0
    beq.w .Lcode_3307
    ldr	r5, [sp, #52]
    cmp	r5, #0
    bne.w .Lcode_3322
    ldr.w	r5, [sp, #1964]
    ldrsh.w	r3, [r5, #310]
    ldrsh.w	r2, [r5, #308]
    ldr	r5, [sp, #36]
    lsls	r3, r3, #15
    cmp	r5, #1
    add.w	r3, r3, r2, lsl #15
    bne.n .Lcode_3028
    ldr.w	r5, [sp, #1964]
    ldrsh.w	r2, [r5, #290]
    ldrsh.w	r1, [r5, #274]
    lsls	r2, r2, #16
    add.w	r2, r2, r1, lsl #16
    sub.w	r3, r2, r3, asr #1
    lsls	r3, r3, #1
.Lcode_3028:
    subs.w	r3, r3, #301989888
    bmi.w .Lcode_3804
    mov.w	r5, #16384
    movs	r2, #0
    mov.w	sl, #16384
    mov.w	fp, #0
    mov.w	lr, #1
    str	r5, [sp, #100]
.Lcode_3036:
    str.w	lr, [sp, #116]
.Lcode_3037:
    mov	r6, r4
    mov	r1, r8
    mov	r5, r4
    b.n .Lcode_3043
.Lliteral_3041:
    .word .Ldata_20715
.Lcode_3042:
    ldr.w	r2, [r6, #4]!
.Lcode_3043:
    asrs	r4, r2, #31
    mul.w	r0, r2, fp
    mla	r0, sl, r4, r0
    umull	r2, r3, r2, sl
    lsrs	r2, r2, #15
    adds	r3, r0, r3
    orr.w	r2, r2, r3, lsl #17
    str.w	r2, [r1], #4
    cmp	r1, r9
    bne.n .Lcode_3042
    mov	r4, r5
    ldr	r5, [sp, #52]
    add	ip, lr
    cbnz	r5, .Lcode_3082
    ldr	r5, [sp, #100]
    add.w	r1, sp, #1896
    sxth	r0, r5
    ldr	r5, [sp, #32]
    asrs	r6, r0, #31
    ldr.w	lr, [r1, r5]
    adds	r1, r4, #4
    adds	r4, #132
.Lcode_3065:
    ldr.w	r2, [r1, #-4]
    asrs	r5, r2, #31
    mul.w	r3, r2, r6
    mla	r5, r0, r5, r3
    umull	r2, r3, r2, r0
    lsrs	r2, r2, #15
    adds	r3, r5, r3
    orr.w	r2, r2, r3, lsl #17
    str.w	r2, [r1, #-4]
    adds	r1, #4
    cmp	r1, r4
    bne.n .Lcode_3065
    ldr	r4, [sp, #116]
    ldr	r5, [sp, #32]
    add.w	r3, lr, r4
    add.w	lr, sp, #1896
    str.w	r3, [lr, r5]
.Lcode_3082:
    ldr.w	r6, [sp, #1908]
    cmp	r6, ip
    blt.w .Lcode_3316
.Lcode_3085:
    mov	r2, ip
    mov	r1, r8
    mov	ip, r6
    add.w	r3, sp, #1608
    mov	r6, r2
.Lcode_3090:
    rsb	r6, r6, ip
    add.w	r5, r3, #128
    add.w	r2, sp, #1608
.Lcode_3093:
    ldr.w	r4, [r3], #4
    ldr.w	r0, [r1], #4
    asrs	r0, r6
    cmp	r3, r5
    qadd	r0, r0, r4
    str.w	r0, [r2], #4
    bne.n .Lcode_3093
    ldr	r4, [sp, #36]
    ldr	r5, [sp, #44]
    str.w	ip, [sp, #1908]
    adds	r4, #1
    str	r4, [sp, #36]
    ldr	r4, [sp, #56]
    adds	r5, #22
    adds	r4, #1
    str	r5, [sp, #44]
    str	r4, [sp, #56]
    ldr	r5, [sp, #40]
    ldr	r4, [sp, #32]
    adds	r5, #98
    adds	r4, #4
    str	r5, [sp, #40]
    str	r4, [sp, #32]
    ldr	r5, [sp, #28]
    ldr	r4, [sp, #36]
    adds	r5, #2
    cmp	r4, #2
    str	r5, [sp, #28]
    bne.w .Lcode_3305
    ldr	r5, [sp, #72]
    ldr.w	r0, [sp, #1896]
    ldr.w	r4, [sp, #1900]
    ldr	r7, [sp, #108]
    adds	r5, #44
    cmp	r0, r4
    str	r5, [sp, #72]
    blt.w .Lcode_3319
    mov	r3, r4
    ldr	r6, [sp, #104]
    mov	r4, r0
    mov	r5, r7
    mov	r0, r3
.Lcode_3135:
    subs	r0, r4, r0
    movs	r3, #0
.Lcode_3137:
    ldr	r2, [r6, r3]
    ldr	r1, [r5, r3]
    asrs	r2, r0
    qadd	r2, r2, r1
    str	r2, [r7, r3]
    adds	r3, #4
    cmp	r3, #128
    bne.n .Lcode_3137
    ldr	r5, [sp, #68]
    str.w	r4, [sp, #1912]
    str	r4, [r5, #0]
    mov	r0, r7
    mov	r1, r7
    movs	r2, #32
    add.w	r3, sp, #1912
    bl .Lcode_7763
    ldr.w	r3, [sp, #1912]
    ldr	r4, [sp, #52]
    str.w	r3, [r5], #4
    str	r5, [sp, #68]
    ldr	r5, [sp, #76]
    adds	r4, #1
    adds	r5, #196
    str	r4, [sp, #52]
    str	r5, [sp, #76]
    ldr	r4, [sp, #84]
    ldr	r5, [sp, #52]
    adds	r4, #4
    adds	r7, #64
    cmp	r5, #8
    str	r4, [sp, #84]
    bne.w .Lcode_2940
    add.w	r3, sp, #1904
    add	r0, sp, #676
    add.w	r1, sp, #1608
    movs	r2, #32
    adds	r3, #4
    bl .Lcode_7763
.Lcode_3175:
    ldr	r4, [sp, #148]
    ldr.w	fp, [sp, #80]
    rsb	r9, r4, #49
    ldr	r4, [sp, #140]
    sxth.w	r9, r9
    rsb	r5, r4, #49
    lsls	r7, r4, #2
    ldr	r4, [sp, #60]
    mov	sl, r9
    ldr.w	r9, [sp, #60]
    add.w	r5, r4, r5, lsl #1
    add.w	r6, sp, #1256
    movs	r4, #0
    mov.w	r8, #98
    subs	r7, #98
.Lcode_3190:
    adds	r1, r7, r5
    mla	r0, r8, r4, r9
    mov	r2, sl
    bl .Lcode_2496
    adds	r4, #1
    mov	r0, r5
    mov	r1, r6
    mov	r2, fp
    bl .Lcode_2496
    adds	r5, #98
    adds	r6, #22
    cmp	r4, #16
    bne.n .Lcode_3190
    ldr	r5, [sp, #152]
    cmp	r5, #0
    ble.w .Lcode_3399
    add.w	sl, sp, #740
    movs	r5, #255
    movs	r4, #0
    ldr	r1, [sp, #156]
    ldr	r2, .Lliteral_3425
    str	r5, [sp, #0]
    mvn.w	r3, #6
    movs	r5, #8
    mov	r0, sl
    str	r4, [sp, #4]
    str	r5, [sp, #12]
    str	r4, [sp, #16]
    str.w	sl, [sp, #8]
    bl .Lcode_2642
    ldr	r4, [sp, #120]
    ldr.w	lr, [sp, #1964]
    ldrsh.w	r5, [r4, #2330]
    ldr	r2, [sp, #120]
    add.w	r1, r4, #1568
    mov	fp, r0
    add.w	r0, r4, #1552
    ldrsh.w	r4, [lr, #384]
    str	r5, [sp, #4]
    ldrsh.w	r5, [sp, #1968]
    str	r4, [sp, #20]
    str	r5, [sp, #8]
    ldr.w	r5, [sp, #1972]
    ldr	r4, [sp, #120]
    str	r5, [sp, #12]
    ldr.w	r5, [sp, #1976]
    str	r2, [sp, #0]
    adds	r1, #2
    adds	r0, #4
    add	r2, sp, #676
    mov	r3, sl
    add.w	r4, r4, #1584
    str	r5, [sp, #16]
    str	r4, [sp, #28]
    bl .Lcode_9647
    ldr	r5, [sp, #120]
    ldrh.w	r2, [r5, #2332]
    ldrh.w	r3, [r5, #2330]
    strh.w	r2, [r5, #2334]
    adds	r4, #6
    mov	r1, r0
    strh.w	r3, [r5, #2332]
    mov	r0, r4
    add.w	r3, sp, #1864
    add	r2, sp, #164
    str	r4, [sp, #32]
    bl .Lcode_10818
    ldrsh.w	r1, [r5, #1570]
    strh.w	r0, [r5, #2330]
    movw	r3, #14169
    cmp	r1, r3
    bgt.w .Lcode_3406
    cmp.w	r1, #4096
    bgt.w .Lcode_3409
    ldr.w	r5, [sp, #1972]
    ldrsh.w	r3, [r5]
    cmp	r3, #0
    bne.w .Lcode_3409
    mov	r9, r3
.Lcode_3269:
    add.w	r4, sp, #1728
    adds	r4, #4
    add.w	r3, sp, #1792
    movs	r6, #5
    mov	r5, r4
    mov	r8, r4
    uxth.w	fp, fp
    adds	r3, #4
    movs	r2, #1
    mov.w	r7, #18432
    mov	r4, r6
.Lcode_3280:
    subs	r4, #1
    add.w	r1, sl, #4
    uxth.w	ip, r4
    add.w	ip, r1, ip, lsl #2
    mov	r6, sl
    movs	r0, #0
    movs	r1, #0
    mov	lr, r4
.Lcode_3288:
    ldr.w	r4, [r6], #4
    smlal	r0, r1, r2, r4
    cmp	r6, ip
    bne.n .Lcode_3288
    lsrs	r0, r0, #2
    orr.w	r0, r0, r1, lsl #30
    smull	r0, r1, r0, r7
    lsrs	r0, r0, #15
    orr.w	r0, r0, r1, lsl #17
    str.w	r0, [r5, #4]!
    uxth.w	r4, lr
    adds	r4, #1
    cmp	r5, r3
    add.w	sl, sl, r4, lsl #2
    beq.w .Lcode_3426
    movs	r4, #8
    b.n .Lcode_3280
.Lcode_3305:
    mov	r4, r7
    b.n .Lcode_2957
.Lcode_3307:
    ldr	r3, [sp, #64]
.Lcode_3308:
    ldr	r2, [r4, r3]
    str.w	r2, [r8, r3]
    adds	r3, #4
    cmp	r3, #128
    bne.n .Lcode_3308
    ldr.w	r6, [sp, #1908]
    cmp	r6, ip
    bge.w .Lcode_3085
.Lcode_3316:
    add.w	r1, sp, #1608
    mov	r3, r8
    b.n .Lcode_3090
.Lcode_3319:
    mov	r6, r7
    ldr	r5, [sp, #104]
    b.n .Lcode_3135
.Lcode_3322:
    ldr.w	lr, [sp, #56]
    ldr	r0, [sp, #84]
    ldr	r1, [sp, #28]
    ldr	r2, [sp, #124]
    mov.w	r5, lr, lsl #11
    adds	r3, r0, r1
    ldr.w	lr, [sp, #112]
    ldrsh.w	r6, [r3, #82]
    mul.w	r0, r2, r5
    ldr	r2, [sp, #128]
    rsb	r1, lr, #5
    mul.w	r5, r2, r5
    add.w	r0, r0, #268435456
    ldr.w	lr, [sp, #144]
    ldrsh.w	r2, [r3, #114]
    lsls	r0, r1
    add.w	r5, r5, #3489660928
    add	r0, lr
    lsls.w	r1, r5, r1
    cmp	r0, r1
    ite	lt
    movlt	sl, r0
    movge	sl, r1
    ldr	r0, [sp, #112]
    lsls	r6, r6, #16
    subs	r5, r2, r0
    bmi.n .Lcode_3402
    lsls.w	r5, r6, r5
.Lcode_3350:
    ldr	r0, [sp, #132]
    cbz	r0, .Lcode_3355
    ldr	r1, [sp, #56]
    cmp	r1, #8
    bgt.w .Lcode_3743
.Lcode_3355:
    subs.w	r5, sl, r5
    bmi.w .Lcode_3777
.Lcode_3357:
    mov.w	sl, #16384
    mov.w	fp, #0
    mov.w	lr, #1
    ldr	r2, [r4, #0]
    b.n .Lcode_3037
.Lcode_3362:
    ldr.w	r5, [sp, #1964]
    ldrh.w	r0, [r5, #72]
    ldrsh.w	r2, [r5, #82]
    ldrsh.w	r3, [r5, #114]
    movw	r1, #10885
    smulbb	r0, r0, r1
    lsls	r0, r0, #1
    add.w	r0, r0, #4110417920
    asrs	r0, r0, #16
    movs	r1, #7
    bl .Lcode_6791
    cbz	r0, .Lcode_3399
    ldrsh.w	r0, [r5, #86]
    ldrsh.w	r1, [r5, #118]
    ldrsh.w	r2, [r5, #82]
    ldrsh.w	r3, [r5, #114]
    bl .Lcode_6791
    cbz	r0, .Lcode_3399
    ldr	r4, [sp, #120]
    ldrh.w	r3, [r4, #1592]
    movw	r2, #6553
    sxth	r1, r3
    cmp	r1, r2
    bgt.n .Lcode_3399
    ldrh.w	r2, [r4, #1590]
    ldr	r5, [sp, #120]
    smulbb	r3, r2, r3
    sbfx	r3, r3, #15, #16
    add.w	r3, r3, r3, lsl #2
    lsls	r2, r3, #13
    lsls	r3, r3, #16
    cmp.w	r2, r3, asr #3
    itt	ne
    mvnne.w	r3, #2147483648
    eorne.w	r3, r3, r2, asr #31
    asrs	r3, r3, #16
    strh.w	r3, [r5, #1590]
.Lcode_3399:
    add.w	sp, sp, #900
    add.w	sp, sp, #1024
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_3402:
    ldr	r5, [sp, #112]
    subs	r2, r5, r2
    asrs.w	r5, r6, r2
    b.n .Lcode_3350
.Lcode_3406:
    ubfx	r1, r1, #1, #16
    strh.w	r1, [r5, #1570]
    sxth	r1, r1
.Lcode_3409:
    ldr	r0, [sp, #32]
    mov	r2, sl
    bl .Lcode_10605
    ldr.w	r4, [sp, #1972]
    ldrh.w	r9, [r4]
    cmp.w	r9, #0
    beq.w .Lcode_3269
    ldr	r5, [sp, #120]
    ldrsh.w	r2, [r5, #1604]
    movw	r3, #6552
    cmp	r2, r3
    bgt.w .Lcode_3269
    adds	r3, #1
    strh.w	r3, [r5, #1604]
    ldrh.w	r9, [r4]
    b.n .Lcode_3269
.Lliteral_3425:
    .word .Ldata_20697
.Lcode_3426:
    mov	r4, r8
    movs	r0, #0
    movs	r1, #0
    movs	r5, #1
.Lcode_3430:
    ldr.w	r2, [r4, #4]!
    smlal	r0, r1, r5, r2
    cmp	r4, r3
    bne.n .Lcode_3430
    orrs.w	lr, r0, r1
    beq.w .Lcode_3839
    sxth	r2, r1
    cmp	r2, #0
    mov	r5, r0
    blt.w .Lcode_3976
    mov	r1, r2
.Lcode_3441:
    clz	r1, r1
    cmp	r1, #32
    itt	eq
    clzeq	r1, r0
    addeq	r1, #32
    subs.w	r4, r1, #33
    bmi.w .Lcode_3962
    lsls.w	r0, r5, r4
    movs	r2, #163
    smull	r0, r1, r0, r2
    uxth.w	r2, fp
    mov.w	fp, r0, lsr #15
    orr.w	fp, fp, r1, lsl #17
    subs	r4, r2, r4
    mov.w	fp, fp, asr #16
    uxth	r1, r4
.Lcode_3457:
    adds	r1, #3
    uxth	r1, r1
    str	r1, [sp, #36]
    cmp.w	r9, #0
    bne.n .Lcode_3495
    ldr	r4, [sp, #28]
    ldr.w	lr, [sp, #28]
    add.w	r5, r4, #14
    add.w	r7, lr, #22
    add.w	r4, sp, #1776
    movw	r6, #6553
.Lcode_3468:
    ldrsh.w	r0, [r5], #2
    add.w	r1, r0, r0, lsl #2
    sxth	r1, r1
    cmp	r0, r6
    mov.w	lr, r1, asr #31
    bgt.n .Lcode_3492
    ldr.w	r8, [r4, #-8]
    ldr.w	r0, [r4, #-4]
    mov.w	sl, r8, asr #31
    mov.w	ip, r0, asr #31
    mul.w	sl, r1, sl
    mul.w	ip, r1, ip
    mla	sl, r8, lr, sl
    umull	r8, r9, r1, r8
    mla	lr, r0, lr, ip
    umull	r0, r1, r1, r0
    add	r1, lr
    add	r9, sl
    mov.w	lr, r8, lsr #15
    lsrs	r0, r0, #15
    orr.w	lr, lr, r9, lsl #17
    orr.w	r0, r0, r1, lsl #17
    str.w	lr, [r4, #-8]
    str.w	r0, [r4, #-4]
.Lcode_3492:
    adds	r4, #8
    cmp	r5, r7
    bne.n .Lcode_3468
.Lcode_3495:
    add.w	r6, sp, #1760
    adds	r6, #4
    mov	r4, r6
    movs	r0, #0
    movs	r1, #0
    movs	r7, #1
.Lcode_3501:
    ldr.w	r5, [r4, #4]!
    smlal	r0, r1, r7, r5
    cmp	r4, r3
    bne.n .Lcode_3501
    orrs.w	r3, r0, r1
    beq.w .Lcode_3845
    sxth	r3, r1
    cmp	r3, #0
    mov	r4, r0
    blt.w .Lcode_3959
    mov	r1, r3
.Lcode_3512:
    clz	r1, r1
    cmp	r1, #32
    itt	eq
    clzeq	r1, r0
    addeq	r1, #32
    subs.w	r0, r1, #33
    bmi.w .Lcode_3950
    subs	r3, r2, r0
    lsls.w	r0, r4, r0
    uxth	r3, r3
    mov.w	sl, r0, asr #16
.Lcode_3523:
    adds	r3, #3
    add.w	lr, sp, #1904
    add.w	lr, lr, #12
    adds	r2, #3
    uxth	r3, r3
    ldr.w	r4, [sp, #1964]
    str.w	fp, [sp, #44]
    str	r3, [sp, #40]
    mov	fp, sl
    uxth	r7, r2
    movs	r5, #8
    str.w	lr, [sp, #136]
    movw	r8, #32604
    mov.w	r9, #163
    mov	sl, lr
.Lcode_3538:
    ldr.w	r3, [r6, #4]!
    ldrh.w	lr, [r4, #336]
    ldrsh.w	r1, [r4, #368]
    str.w	sl, [sp]
    mov	r0, r3
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    uxth	r0, r0
    sxth	r2, r0
    lsls.w	r2, r3, r2
    smull	r2, r3, r2, r9
    lsrs	r2, r2, #15
    smulbb	lr, lr, r8
    orr.w	r2, r2, r3, lsl #17
    subs	r3, r7, r0
    asrs	r2, r2, #16
    sxth	r3, r3
    mov.w	r0, lr, asr #15
    bl .Lcode_6611
    adds	r5, #1
    ldr.w	r3, [sp, #1916]
    strh.w	r0, [r4, #336]
    uxth	r5, r5
    strh.w	r3, [r4, #368]
    adds	r4, #2
    cmp	r5, #16
    bne.n .Lcode_3538
    movs	r6, #0
    ldr.w	r4, [sp, #1964]
    mov	sl, fp
    mov	r7, r6
    mov	r1, r6
    ldr.w	fp, [sp, #44]
    ldr	r6, [sp, #136]
    add.w	r5, r4, #334
    movs	r4, #8
.Lcode_3578:
    ldrsh.w	r2, [r5, #2]!
    sxth	r0, r7
    ldrsh.w	r3, [r5, #32]
    str	r6, [sp, #0]
    sxth	r1, r1
    bl .Lcode_6611
    adds	r4, #1
    uxth	r4, r4
    cmp	r4, #16
    uxth	r7, r0
    ldrh.w	r1, [sp, #1916]
    bne.n .Lcode_3578
    ldr.w	r5, [sp, #1964]
    ldr	r4, [sp, #136]
    ldrh.w	r0, [r5, #316]
    mov	r6, r1
    movw	r3, #32604
    ldrsh.w	r1, [r5, #318]
    ldr	r5, [sp, #36]
    str	r4, [sp, #0]
    smulbb	r0, r0, r3
    mov	r2, fp
    sxth	r3, r5
    asrs	r0, r0, #15
    bl .Lcode_6611
    ldr.w	r5, [sp, #1964]
    ldr.w	lr, [sp, #40]
    ldrsh.w	r3, [r5, #386]
    strh.w	r0, [r5, #316]
    sxth	r4, r7
    rsb	r2, r4, r4, lsl #5
    ldr.w	r0, [sp, #1964]
    ldr.w	r1, [sp, #1916]
    rsb	r2, r4, r2, lsl #2
    lsls	r3, r3, #1
    rsb	r2, r4, r2, lsl #3
    sxth.w	r5, lr
    sxth	r6, r6
    strh.w	r1, [r0, #318]
    strh.w	r3, [r0, #386]
    sbfx	r2, r2, #15, #16
    mov	r0, sl
    mov	r1, r5
    mov	r3, r6
    bl .Lcode_6768
    cmp	r0, #0
    bne.w .Lcode_3899
    ldr.w	r5, [sp, #1964]
    ldrh.w	r3, [r5, #386]
.Lcode_3627:
    ands.w	r3, r3, #15
    bne.w .Lcode_3889
    ldr.w	r4, [sp, #1964]
    strh.w	r3, [r4, #384]
.Lcode_3631:
    ldr.w	r5, [sp, #1964]
    ldr	r3, .Lliteral_3888
    ldrsh.w	r4, [r5, #68]
    ldr	r5, [sp, #120]
    ldrb	r0, [r3, #0]
    ldrb.w	r1, [r5, #2330]
    ldrb.w	r2, [r5, #2334]
    ldrb	r1, [r3, r1]
    ldrb	r2, [r3, r2]
    ubfx	r3, r4, #2, #3
    cmp	r3, #0
    beq.w .Lcode_3843
    add.w	r0, r1, r0, lsl #1
    adds	r0, r0, r2
.Lcode_3645:
    ldr	r4, [sp, #120]
    ldrsh.w	r3, [r4, #1580]
    cmp.w	r3, #8192
    sxth	r0, r0
    ble.n .Lcode_3653
    ldrsh.w	r3, [r4, #1584]
    cmp.w	r3, #8192
    bgt.n .Lcode_3655
.Lcode_3653:
    cmp	r0, #3
    bgt.w .Lcode_3362
.Lcode_3655:
    ldr.w	r5, [sp, #1964]
    ldrsh.w	r1, [r5, #290]
    ldrsh.w	r2, [r5, #82]
    ldrsh.w	r3, [r5, #114]
    mov.w	r5, #47104
    lsls	r0, r0, #24
    movt	r5, #65535
    asrs	r4, r0, #16
    mov.w	r6, #1152
    str	r5, [sp, #4]
    ldr	r0, [sp, #32]
    str	r6, [sp, #0]
    movw	r5, #17080
    str	r5, [sp, #8]
    str	r4, [sp, #12]
    bl .Lcode_2676
    ldr.w	r5, [sp, #1964]
    ldrsh.w	r1, [r5, #292]
    ldrsh.w	r2, [r5, #86]
    ldrsh.w	r3, [r5, #118]
    ldr	r5, [sp, #120]
    str	r4, [sp, #12]
    add.w	r0, r5, #1592
    mov.w	r5, #45056
    movt	r5, #65535
    str	r5, [sp, #4]
    mov.w	r6, #1024
    movw	r5, #12984
    str	r5, [sp, #8]
    str	r6, [sp, #0]
    bl .Lcode_2676
    ldr.w	r5, [sp, #1964]
    ldrsh.w	r1, [r5, #294]
    ldrsh.w	r2, [r5, #90]
    ldrsh.w	r3, [r5, #122]
    str	r4, [sp, #12]
    ldr	r4, [sp, #28]
    add.w	r0, r4, #10
    mov.w	r4, #44032
    movt	r4, #65535
    mov.w	r5, #896
    str	r4, [sp, #4]
    movw	r4, #8888
    str	r5, [sp, #0]
    str	r4, [sp, #8]
    bl .Lcode_2676
    ldr.w	r5, [sp, #1964]
    ldrh.w	r0, [r5, #72]
    ldrsh.w	r2, [r5, #82]
    ldrsh.w	r3, [r5, #114]
    movw	r1, #10885
    smulbb	r0, r0, r1
    lsls	r0, r0, #1
    add.w	r0, r0, #4076863488
    asrs	r0, r0, #16
    movs	r1, #7
    bl .Lcode_6791
    cmp	r0, #0
    beq.w .Lcode_3399
    ldrsh.w	r3, [r5, #250]
    cmp.w	r3, #7168
    bge.w .Lcode_3399
    ldrsh.w	r0, [r5, #86]
    ldrsh.w	r1, [r5, #118]
    ldrsh.w	r2, [r5, #82]
    ldrsh.w	r3, [r5, #114]
    bl .Lcode_6791
    cmp	r0, #0
    beq.w .Lcode_3399
    ldr	r4, [sp, #120]
    ldrh.w	r3, [r4, #2330]
    lsls	r2, r3, #25
    bne.w .Lcode_3399
    ldrh.w	r3, [r4, #2334]
    lsls	r3, r3, #25
    bne.w .Lcode_3399
    ldrsh.w	r2, [r5, #72]
    ldrsh.w	r3, [r5, #314]
    subs	r3, r2, r3
    cmp.w	r3, #5632
    ble.w .Lcode_3399
    ldrsh.w	r2, [r4, #1590]
    movw	r3, #7208
    cmp	r2, r3
    bgt.w .Lcode_3399
    adds	r3, #1
    strh.w	r3, [r4, #1590]
    b.n .Lcode_3399
.Lcode_3743:
    ldrsh.w	r1, [r3, #352]
    ldrsh.w	r0, [r3, #320]
    str.w	ip, [sp, #24]
    bl .Lcode_6814
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    uxth	r1, r3
    rsb	r3, r1, #15
    ldr.w	lr, [sp, #112]
    ldr.w	ip, [sp, #24]
    sxth	r6, r3
    mov	r2, r0
    sxth	r3, r1
    rsb	r0, lr, r6
    lsls	r2, r3
    cmp	r0, #0
    ble.w .Lcode_3947
    lsls.w	r1, r2, r0
    asrs.w	r3, r1, r0
    cmp	r2, r3
    itt	ne
    mvnne.w	r3, #2147483648
    eorne.w	r1, r3, r2, asr #31
.Lcode_3771:
    asrs	r3, r1, #16
    cmp.w	r3, r5, asr #16
    it	gt
    lslgt	r5, r3, #16
    subs.w	r5, sl, r5
    bpl.w .Lcode_3357
.Lcode_3777:
    asrs	r3, r5, #31
    lsls	r3, r3, #14
    orr.w	r3, r3, r5, lsr #18
    ubfx	r5, r5, #1, #17
    orr.w	r5, r5, r3, lsl #17
    asrs	r0, r5, #9
    ldr	r1, [sp, #136]
    str.w	ip, [sp, #24]
    bl .Lcode_6866
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth.w	lr, r3
    lsl.w	r3, r0, lr
    lsrs	r2, r3, #16
    ldr.w	r3, [sp, #1916]
    ldr.w	ip, [sp, #24]
    sxth.w	sl, r2
    rsb	lr, lr, r3
    sxth.w	lr, lr
    mov.w	fp, sl, asr #31
    ldr	r2, [r4, #0]
    b.w .Lcode_3037
.Lcode_3804:
    movw	r2, #21856
    smull	r2, r3, r3, r2
    lsrs	r0, r2, #15
    orr.w	r0, r0, r3, lsl #17
    ldr	r1, [sp, #136]
    str.w	ip, [sp, #24]
    asrs	r0, r0, #9
    bl .Lcode_6866
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r2, r3
    ldr.w	r3, [sp, #1916]
    lsls	r0, r2
    subs	r5, r3, r2
    lsrs	r0, r0, #16
    str	r0, [sp, #100]
    mov	r1, r5
    sxth	r0, r0
    movw	r2, #20971
    mvn.w	r3, #5
    bl .Lcode_6791
    ldr.w	ip, [sp, #24]
    cmp	r0, #0
    bne.n .Lcode_3881
    ldr.w	lr, [sp, #100]
    ldr	r2, [r4, #0]
    sxth.w	sl, lr
    mov.w	fp, sl, asr #31
    sxth.w	lr, r5
    b.w .Lcode_3036
.Lcode_3839:
    uxth.w	r2, fp
    mov	r1, r2
    mov.w	fp, #0
    b.n .Lcode_3457
.Lcode_3843:
    mov	r0, r3
    b.n .Lcode_3645
.Lcode_3845:
    mov	r3, r2
    mov.w	sl, #0
    b.n .Lcode_3523
.Lcode_3848:
    sxth	r4, r5
    str	r4, [sp, #80]
    b.w .Lcode_3175
.Lcode_3851:
    mov	r0, r4
    ldr.w	r1, [sp, #1916]
    movw	r2, #3125
    mvn.w	r3, #9
    bl .Lcode_6768
    cmp	r0, #0
    bne.n .Lcode_3912
.Lcode_3858:
    ldr.w	r4, [sp, #1964]
    ldrsh.w	r3, [r4, #80]
    sxth	r5, r5
    cmn.w	r3, #7680
    str	r5, [sp, #132]
    bgt.w .Lcode_2863
    mov.w	r2, #45056
    sxth	r0, r6
    sxth	r1, r7
    movt	r2, #65535
    movs	r3, #5
    bl .Lcode_6768
    cmp	r0, #0
    bne.w .Lcode_2863
    ldrsh.w	r2, [r4, #72]
    ldrsh.w	r3, [r4, #80]
    subs	r3, r2, r3
    cmp.w	r3, #3840
    blt.w .Lcode_2863
    str	r0, [sp, #112]
    mov	r2, r0
    str	r0, [sp, #64]
    b.w .Lcode_2900
.Lcode_3881:
    movw	r5, #20971
    ldr	r2, [r4, #0]
    str	r5, [sp, #100]
    movw	sl, #20971
    mov.w	fp, #0
    mvn.w	lr, #5
    b.w .Lcode_3036
    .byte 0x00
    .byte 0xbf
.Lliteral_3888:
    .word .Ldata_20707
.Lcode_3889:
    mov	r0, r4
    mov	r1, r6
    movw	r2, #31250
    mvn.w	r3, #9
    bl .Lcode_6768
    cbz	r0, .Lcode_3926
    ldr.w	r5, [sp, #1964]
    movs	r3, #1
    strh.w	r3, [r5, #384]
    b.n .Lcode_3631
.Lcode_3899:
    mov	r1, r5
    mvn.w	r3, #15
    mov	r0, sl
    mov.w	r2, #2000
    bl .Lcode_6768
    ldr.w	r5, [sp, #1964]
    ldrh.w	r3, [r5, #386]
    cmp	r0, #0
    beq.w .Lcode_3627
    orr.w	r3, r3, #1
    uxth	r3, r3
    strh.w	r3, [r5, #386]
    b.n .Lcode_3627
.Lcode_3912:
    ldr.w	lr, [sp, #1964]
    ldrh.w	r1, [lr, #316]
    ldrsh.w	r3, [lr, #318]
    movw	r2, #18022
    smulbb	r2, r1, r2
    asrs	r2, r2, #15
    mov	r0, r4
    ldr.w	r1, [sp, #1916]
    bl .Lcode_6768
    cmp	r0, #0
    beq.n .Lcode_3858
    movs	r4, #1
    str	r4, [sp, #132]
    b.w .Lcode_2863
.Lcode_3926:
    mov	r0, r4
    mov	r1, r6
    movw	r2, #2500
    mvn.w	r3, #12
    bl .Lcode_6768
    cmp	r0, #0
    beq.n .Lcode_3979
    ldr.w	r5, [sp, #1964]
    ldrh.w	r1, [r5, #316]
    ldrsh.w	r3, [r5, #318]
    movw	r2, #26214
.Lcode_3937:
    smulbb	r2, r1, r2
    asrs	r2, r2, #15
    mov	r0, r4
    mov	r1, r6
    bl .Lcode_6768
    cmp	r0, #0
    beq.w .Lcode_3631
    movs	r3, #1
    strh.w	r3, [r5, #384]
    b.n .Lcode_3631
.Lcode_3947:
    rsb	r3, r6, lr
    asrs.w	r1, r2, r3
    b.n .Lcode_3771
.Lcode_3950:
    negs	r0, r0
    subs	r1, #1
    lsls	r3, r1
    lsrs	r4, r0
    orr.w	sl, r3, r4
    adds	r0, r2, r0
    uxth	r3, r0
    mov.w	sl, sl, asr #16
    b.n .Lcode_3523
.Lcode_3959:
    mvns	r1, r3
    mvns	r0, r4
    b.n .Lcode_3512
.Lcode_3962:
    negs	r4, r4
    subs	r1, #1
    lsls	r2, r1
    lsrs	r5, r4
    orr.w	r0, r2, r5
    movs	r2, #163
    smull	r0, r1, r0, r2
    uxth.w	r2, fp
    mov.w	fp, r0, lsr #15
    orr.w	fp, fp, r1, lsl #17
    adds	r4, r2, r4
    mov.w	fp, fp, asr #16
    uxth	r1, r4
    b.n .Lcode_3457
.Lcode_3976:
    mvns	r1, r2
    mvns	r0, r5
    b.n .Lcode_3441
.Lcode_3979:
    mov	r0, r4
    mov	r1, r6
    movw	r2, #3125
    mvn.w	r3, #9
    bl .Lcode_6768
    cbnz	r0, .Lcode_3988
    ldr.w	r4, [sp, #1964]
    strh.w	r0, [r4, #384]
    b.n .Lcode_3631
.Lcode_3988:
    ldr.w	r5, [sp, #1964]
    movw	r2, #18022
    ldrh.w	r1, [r5, #316]
    ldrsh.w	r3, [r5, #318]
    b.n .Lcode_3937
    .byte 0x00
    .byte 0xbf
.Lcode_3993:
.global asm_update_complex_spectral_analysis
.type asm_update_complex_spectral_analysis, %function
.thumb_func
asm_update_complex_spectral_analysis:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add.w	r5, r0, #1584
    sub	sp, #100
    adds	r6, r5, #6
    mov	r4, r0
    str	r6, [sp, #44]
    ldrsh.w	r0, [r0, #1548]
    ldrsh.w	lr, [r4, #1750]
    str	r3, [sp, #48]
    mov	r6, r1
    ldr	r1, [sp, #44]
    str	r0, [sp, #0]
    asrs	r3, r0, #1
    add.w	r7, r4, #1664
    adds	r7, #6
    str	r2, [sp, #68]
    str	r1, [sp, #4]
    mov	r2, r3
    add.w	r0, r4, #1760
    ldr	r1, [sp, #48]
    str	r7, [sp, #8]
    mov	r3, r4
    str.w	lr, [sp, #12]
    bl .Lcode_11047
    cmp	r6, #0
    ble.n .Lcode_4074
    ldr	r3, [sp, #140]
    ldrh.w	r2, [r4, #1580]
    ldrh.w	r3, [r3, #384]
    movw	r1, #13107
    str	r3, [sp, #80]
    sxth	r3, r2
    cmp	r3, r1
    bgt.w .Lcode_4125
    movw	r1, #6553
    cmp	r3, r1
    bgt.w .Lcode_4366
    ldrsh.w	ip, [r4, #1584]
    movw	r1, #13107
    cmp	ip, r1
    ble.w .Lcode_4373
.Lcode_4034:
    subs	r1, #1
    cmp	r3, r1
    bgt.w .Lcode_4465
.Lcode_4037:
    ldrh.w	r3, [r4, #1570]
    strh.w	r2, [r4, #1582]
    strh.w	r3, [r4, #1572]
    b.n .Lcode_4133
.Lcode_4041:
    ldrsh.w	r6, [r4, #1832]
    movw	r0, #65533
    movt	r0, #65535
    subs	r0, r0, r6
    cmp	r0, #0
    ble.w .Lcode_4407
    lsls.w	r6, r2, r0
    asrs.w	r0, r6, r0
    cmp	r0, r2
    beq.w .Lcode_4409
.Lcode_4051:
    ldrsh.w	r0, [r4, #1834]
    movw	r6, #65533
    movt	r6, #65535
    subs	r6, r6, r0
    cmp	r6, #0
    mov.w	lr, #0
    ble.w .Lcode_4422
.Lcode_4058:
    lsls.w	r0, r2, r6
    asrs.w	r6, r0, r6
    cmp	r6, r2
    beq.w .Lcode_4448
    movw	r0, #32767
.Lcode_4063:
    ldrsh	r7, [r5, r3]
    sxth	r6, r0
    cmp	r7, r6
    bge.n .Lcode_4070
    cmp.w	lr, #0
    beq.n .Lcode_4070
    strh	r0, [r5, r3]
.Lcode_4070:
    adds	r1, #1
    adds	r3, #2
    cmp	r1, #8
    bne.w .Lcode_4329
.Lcode_4074:
    add.w	r6, r4, #1984
    adds	r6, #14
    add.w	r0, r4, #2144
    mov	r1, r6
    movs	r2, #80
    adds	r0, #14
    bl .Lcode_2496
    add.w	r5, r4, #1824
    ldrh.w	r2, [r4, #2322]
    ldrh.w	r3, [r4, #2324]
    strh.w	r2, [r4, #2326]
    adds	r5, #14
    mov	r1, r5
    movs	r2, #80
    strh.w	r3, [r4, #2328]
    mov	r0, r6
    bl .Lcode_2496
    ldr	r6, [sp, #136]
    ldrh.w	r2, [r4, #2318]
    ldrh.w	r3, [r4, #2320]
    ldr.w	r9, [sp, #68]
    strh.w	r2, [r4, #2322]
    rsb	r1, r6, #114
    sbfx	r1, r1, #0, #15
    add.w	r1, r9, r1, lsl #2
    movs	r2, #80
    strh.w	r3, [r4, #2324]
    ldr	r0, [sp, #48]
    bl .Lcode_2496
    ldr	r3, .Lliteral_4124
    ldr	r1, [sp, #48]
    movs	r2, #15
    mov	r0, r5
    bl .Lcode_11535
    rsb	r1, r6, #134
    sbfx	r1, r1, #0, #15
    add.w	r1, r9, r1, lsl #2
    movs	r2, #80
    strh.w	r0, [r4, #2318]
    ldr	r0, [sp, #48]
    bl .Lcode_2496
    add.w	r0, r4, #1904
    adds	r0, #14
    ldr	r1, [sp, #48]
    ldr	r3, .Lliteral_4124
    movs	r2, #15
    bl .Lcode_11535
    strh.w	r0, [r4, #2320]
    add	sp, #100
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lliteral_4124:
    .word .Ldata_20658
.Lcode_4125:
    ldrh.w	r1, [r4, #1584]
    movw	r0, #13106
    sxth.w	ip, r1
    cmp	ip, r0
    bgt.w .Lcode_4368
.Lcode_4130:
    ldrh.w	r3, [r4, #1574]
    strh.w	r1, [r4, #1582]
    strh.w	r3, [r4, #1572]
.Lcode_4133:
    ldrsh.w	r1, [r4, #1550]
    ldrsh.w	r3, [r4, #1548]
    mov	r2, r4
    add	r6, sp, #88
    add.w	r0, r4, #516
    str	r6, [sp, #0]
    bl .Lcode_2734
    ldrsh.w	r6, [r4, #1754]
    ldrh.w	r3, [r4, #1750]
    ldr	r2, [sp, #88]
    str	r6, [sp, #36]
    add.w	r6, r5, #86
    add.w	r9, r5, #38
    adds	r2, r2, r3
    str	r0, [sp, #60]
    str	r6, [sp, #56]
    sxth	r3, r3
    add.w	ip, r5, #22
    str.w	r9, [sp, #52]
    str	r3, [sp, #32]
    mov	r1, r9
    ldr	r0, [sp, #56]
    ldr	r3, [sp, #44]
    ldr.w	r9, [sp, #60]
    strh.w	r2, [r4, #1752]
    add.w	r6, r5, #102
    mov	r2, ip
    adds	r5, #12
.Lcode_4161:
    ldrh.w	r7, [r0], #2
    ldrsh.w	lr, [r3], #2
    ldrsh.w	r8, [r1], #2
    smulbb	r7, r9, r7
    cmp	r8, lr
    it	lt
    movlt	lr, r8
    sbfx	r7, r7, #15, #16
    cmp	r3, r5
    strh.w	lr, [r2], #2
    strh.w	r7, [r6], #2
    bne.n .Lcode_4161
    add.w	r9, r4, #1680
    add.w	r6, r4, #1696
    str.w	r9, [sp, #72]
    str	r6, [sp, #76]
    add.w	r9, r9, #12
    adds	r6, #12
    str.w	r9, [sp, #40]
    str	r6, [sp, #64]
    str.w	ip, [sp, #24]
    movs	r5, #0
    str	r4, [sp, #84]
.Lcode_4184:
    ldr.w	r9, [sp, #56]
    ldr	r6, [sp, #44]
    add.w	r3, r9, r5
    adds	r1, r6, r5
    ldr	r6, [sp, #64]
    ldrh	r4, [r3, #6]
    ldr.w	r9, [sp, #52]
    ldrh	r3, [r6, r5]
    ldrh.w	lr, [r1, #6]
    add.w	r2, r9, r5
    mov.w	r9, r3, lsl #16
    mov.w	fp, r4, lsl #16
    str.w	r9, [sp, #20]
    mov	r8, r9
    ldr.w	r9, [sp, #32]
    ldrh	r6, [r2, #6]
    cmp.w	r8, #0
    it	lt
    mvnlt.w	r8, r8
    itt	ne
    clzne	r8, r8
    subne.w	r8, r8, #1
    mov	sl, fp
    cmp.w	sl, #0
    it	lt
    mvnlt.w	sl, sl
    itt	ne
    clzne	sl, sl
    subne.w	sl, sl, #1
    sxth.w	sl, sl
    rsb	ip, sl, r9
    ldr.w	r9, [sp, #36]
    sxth.w	r8, r8
    smulbb	lr, r4, lr
    rsb	r1, r8, r9
    mov.w	lr, lr, lsl #1
    ldr.w	r9, [sp, #32]
    smulbb	r6, r3, r6
    mov	r7, lr
    cmp	r7, #0
    it	lt
    mvnlt	r7, r7
    itt	ne
    clzne	r7, r7
    subne	r7, #1
    sxth	r7, r7
    lsls	r6, r6, #1
    rsb	r2, r7, r9
    ldr.w	r9, [sp, #36]
    mov	r0, r6
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    sxth	r0, r0
    rsb	r9, r0, r9
    cmp	r1, ip
    ite	ge
    movge	r3, r1
    movlt	r3, ip
    str.w	r9, [sp, #28]
    ldr.w	r9, [sp, #20]
    adds	r3, #1
    lsl.w	sl, fp, sl
    ldr.w	fp, [sp, #28]
    lsl.w	r8, r9, r8
    subs	r1, r3, r1
    cmp	fp, r2
    it	lt
    movlt	fp, r2
    asr.w	r8, r8, r1
    rsb	ip, ip, r3
    ldr	r1, [sp, #28]
    add.w	fp, fp, #1
    asr.w	sl, sl, ip
    lsls.w	r0, r6, r0
    add	sl, r8
    rsb	r2, r2, fp
    rsb	r6, r1, fp
    lsl.w	r7, lr, r7
    mov	r1, sl
    asrs	r7, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    asrs	r0, r6
    sxth.w	r9, r1
    adds	r7, r7, r0
    lsl.w	sl, sl, r9
    mov	r1, r7
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    lsrs.w r2, sl, #16
    bne.w .Lcode_4426
    ldr	r6, [sp, #24]
    movw	r2, #32767
    strh	r2, [r6, #6]
.Lcode_4290:
    ldr.w	r9, [sp, #60]
    ldr	r6, [sp, #40]
    smulbb	r4, r9, r4
    sbfx	r4, r4, #15, #16
    ldr.w	r9, [sp, #24]
    strh.w	r4, [r6], #2
    adds	r5, #2
    add.w	r9, r9, #2
    cmp	r5, #10
    str	r6, [sp, #40]
    str.w	r9, [sp, #24]
    bne.w .Lcode_4184
    ldr	r6, [sp, #72]
    ldr	r4, [sp, #84]
    adds	r3, r6, #6
    mov	r5, r3
    add.w	r0, r6, #22
    movs	r2, #0
.Lcode_4308:
    ldrsh.w	r1, [r3], #2
    cmp	r3, r0
    orr.w	r2, r2, r1
    bne.n .Lcode_4308
    cbnz	r2, .Lcode_4319
    ldr.w	r9, [sp, #76]
    movs	r2, #1
    add.w	r3, r9, #6
.Lcode_4316:
    strh.w	r2, [r3, #-2]!
    cmp	r5, r3
    bne.n .Lcode_4316
.Lcode_4319:
    movs	r3, #0
    mov	r2, r3
    ldrsh.w	sl, [r4, #1584]
    ldr.w	fp, [sp, #80]
    add.w	r9, r4, #1784
    add.w	r5, r4, #1800
    add.w	ip, r4, #1816
    mov	r1, r3
    movt	r2, #26214
    movw	r8, #3275
.Lcode_4329:
    cmp.w	fp, #0
    beq.w .Lcode_4041
    cmp	r1, #4
    ble.w .Lcode_4041
    ldrsh.w	r0, [r4, #1836]
    movw	r6, #65533
    movt	r6, #65535
    subs	r6, r6, r0
    cmp	r6, #0
    ble.w .Lcode_4454
    lsls.w	r0, r2, r6
    asrs.w	r6, r0, r6
    cmp	r6, r2
    beq.w .Lcode_4460
    movw	r0, #32767
.Lcode_4344:
    ldrsh.w	r7, [ip, r3]
    sxth	r6, r0
    cmp	r7, r6
    it	lt
    strhlt.w	r0, [ip, r3]
    movw	r6, #65533
    ldrsh.w	r0, [r4, #1834]
    movt	r6, #65535
    subs	r6, r6, r0
    cmp	r6, #0
    ble.w .Lcode_4450
    lsls.w	r0, r2, r6
    asrs.w	r6, r0, r6
    cmp	r6, r2
    beq.w .Lcode_4458
    movw	r0, #32767
.Lcode_4360:
    ldrsh	r7, [r5, r3]
    sxth	r6, r0
    cmp	r7, r6
    bge.w .Lcode_4070
    strh	r0, [r5, r3]
    b.n .Lcode_4070
.Lcode_4366:
    ldrh.w	r1, [r4, #1584]
    sxth.w	ip, r1
.Lcode_4368:
    cmp.w	ip, r3, asr #1
    blt.w .Lcode_4130
    movw	r1, #13107
    cmp	ip, r1
    bgt.w .Lcode_4034
.Lcode_4373:
    movw	r1, #6553
    cmp	ip, r1
    bgt.w .Lcode_4465
.Lcode_4376:
    ldrh.w	r6, [r4, #1570]
    ldrsh.w	r7, [r4, #1574]
    lsls	r1, r6, #16
    lsls	r7, r7, #16
    asrs	r0, r1, #1
    asrs	r2, r7, #1
    add.w	lr, r0, r2
    mov.w	lr, lr, asr #16
    add	ip, r3
    strh.w	lr, [r4, #1572]
    movw	lr, #3275
    mov.w	ip, ip, asr #1
    cmp	r3, lr
    strh.w	ip, [r4, #1582]
    bgt.w .Lcode_4133
    subs	r1, r1, r2
    bmi.n .Lcode_4472
.Lcode_4393:
    movw	r3, #6553
    smulbb	r3, r6, r3
    subs.w	r3, r1, r3, lsl #1
    bmi.n .Lcode_4468
    subs	r3, r7, r0
    bmi.n .Lcode_4476
.Lcode_4399:
    movw	r2, #3276
    smulbb	r6, r6, r2
    subs.w	r6, r3, r6, lsl #1
    bpl.w .Lcode_4133
    adds	r3, r7, r0
    asrs	r3, r3, #16
    strh.w	r3, [r4, #1572]
    b.n .Lcode_4133
.Lcode_4407:
    adds	r6, #3
    asrs.w	r6, r2, r6
.Lcode_4409:
    ldrsh.w	r0, [r9, r3]
    cmp.w	r0, r6, asr #16
    ble.w .Lcode_4051
    ldrsh.w	r0, [r4, #1834]
    movw	r6, #65533
    movt	r6, #65535
    cmp	sl, r8
    rsb	r6, r0, r6
    ite	gt
    movgt.w	lr, #0
    movle.w	lr, #1
    cmp	r6, #0
    bgt.w .Lcode_4058
.Lcode_4422:
    adds	r0, #3
    asrs.w	r0, r2, r0
    lsrs	r0, r0, #16
    b.n .Lcode_4063
.Lcode_4426:
    sxth	r1, r1
    lsls.w	r0, r7, r1
    sxth	r2, r2
    rsb	r1, r1, fp
    rsb	r3, r9, r3
    add	r6, sp, #92
    str	r6, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #92]
    lsls	r0, r0, #16
    lsls.w	r2, r0, r3
    asrs.w	r1, r2, r3
    cmp	r3, #0
    ble.n .Lcode_4462
    cmp	r0, r1
    itt	ne
    mvnne.w	r9, #2147483648
    eorne.w	r2, r9, r0, asr #31
.Lcode_4444:
    ldr	r6, [sp, #24]
    asrs	r2, r2, #16
    strh	r2, [r6, #6]
    b.n .Lcode_4290
.Lcode_4448:
    lsrs	r0, r0, #16
    b.n .Lcode_4063
.Lcode_4450:
    adds	r0, #3
    asrs.w	r0, r2, r0
    lsrs	r0, r0, #16
    b.n .Lcode_4360
.Lcode_4454:
    adds	r0, #3
    asrs.w	r0, r2, r0
    lsrs	r0, r0, #16
    b.n .Lcode_4344
.Lcode_4458:
    lsrs	r0, r0, #16
    b.n .Lcode_4360
.Lcode_4460:
    lsrs	r0, r0, #16
    b.n .Lcode_4344
.Lcode_4462:
    negs	r3, r3
    asrs.w	r2, r0, r3
    b.n .Lcode_4444
.Lcode_4465:
    cmp.w	r3, ip, asr #1
    bge.w .Lcode_4376
    b.n .Lcode_4037
.Lcode_4468:
    add.w	r3, r0, r2, asr #1
    asrs	r3, r3, #16
    strh.w	r3, [r4, #1572]
    b.n .Lcode_4133
.Lcode_4472:
    cmp.w	r1, #2147483648
    beq.n .Lcode_4480
    negs	r1, r1
    b.n .Lcode_4393
.Lcode_4476:
    cmp.w	r3, #2147483648
    beq.n .Lcode_4482
    negs	r3, r3
    b.n .Lcode_4399
.Lcode_4480:
    mvn.w	r1, #2147483648
    b.n .Lcode_4393
.Lcode_4482:
    mvn.w	r3, #2147483648
    b.n .Lcode_4399
.Lcode_4484:
.global asm_update_spectral_classification
.type asm_update_spectral_classification, %function
.thumb_func
asm_update_spectral_classification:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #20
    ands.w	r3, r3, #4096
    mov	r4, r0
    ldr	r5, [sp, #48]
    bne.n .Lcode_4499
    add.w	r1, r0, r5, lsl #2
    mov	r4, r1
    add.w	r2, r0, r5, lsl #1
    strh	r3, [r1, #14]
    movs	r1, #255
    strh	r1, [r2, #10]
    strh	r3, [r4, #16]
.Lcode_4497:
    add	sp, #20
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_4499:
    add.w	r8, r5, #2
    add.w	r7, r0, r8, lsl #2
    mov.w	r9, r5, lsl #2
    add.w	r6, r0, r9
    ldrh	r3, [r7, #6]
    ldrh.w	ip, [r6, #16]
    ldrsh.w	lr, [sp, #52]
    strh.w	r3, [sp, #12]
    add	r0, sp, #12
    movs	r3, #0
    strh.w	ip, [sp, #14]
    stmia.w	sp, {r4, lr}
    bl .Lcode_12247
    cmp	r0, #255
    beq.n .Lcode_4525
    ldrh.w	r3, [sp, #12]
    add.w	r5, r4, r5, lsl #1
    strh	r3, [r7, #6]
    ldrh.w	r3, [sp, #14]
    strh	r0, [r5, #10]
    strh	r3, [r6, #16]
    uxth	r0, r0
    movs	r3, #2
    strh	r3, [r4, #6]
    strh	r0, [r4, #8]
    b.n .Lcode_4497
.Lcode_4525:
    ldrh	r0, [r4, #8]
    sxth	r3, r0
    cmp	r3, #127
    bgt.n .Lcode_4543
    cmp	r3, #19
    beq.n .Lcode_4556
    cmp	r3, #58
    beq.n .Lcode_4556
.Lcode_4533:
    add.w	r5, r4, r5, lsl #1
    add.w	r8, r4, r8, lsl #2
    add	r9, r4
    movs	r0, #255
    movs	r3, #0
    strh.w	r3, [r8, #6]
    strh	r0, [r5, #10]
    strh.w	r3, [r9, #16]
    strh	r0, [r4, #8]
    b.n .Lcode_4497
.Lcode_4543:
    ldrh	r3, [r4, #6]
    sxth	r2, r3
    cmp	r2, #0
    ble.n .Lcode_4533
    add.w	r5, r4, r5, lsl #1
    movw	r2, #45057
    subs	r3, #1
    strh	r2, [r7, #6]
    strh	r0, [r5, #10]
    strh	r3, [r4, #6]
    strh	r2, [r6, #16]
    strh	r0, [r4, #8]
    b.n .Lcode_4497
.Lcode_4556:
    ldrh	r3, [r4, #6]
    sxth	r2, r3
    cmp	r2, #0
    ble.n .Lcode_4533
    add.w	r5, r4, r5, lsl #1
    subs	r3, #1
    strh	r0, [r5, #10]
    strh	r3, [r4, #6]
    strh	r0, [r4, #8]
    b.n .Lcode_4497
    .byte 0x00
    .byte 0xbf
.Lcode_4566:
.global asm_filter_i32_state6
.type asm_filter_i32_state6, %function
.thumb_func
asm_filter_i32_state6:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    sub	sp, #40
    mov	r9, r3
    str	r2, [sp, #36]
    ldr.w	sl, [sp, #36]
    str	r0, [sp, #24]
    ldr.w	r0, [sl, #16]
    str	r1, [sp, #28]
    ldr	r2, [r2, #0]
    ldr.w	r7, [sl, #4]
    ldr.w	ip, [sl, #8]
    ldr.w	r8, [sl, #12]
    str	r0, [sp, #32]
    ldr.w	r3, [sl, #20]
    mov.w	fp, #1
    b.n .Lcode_4587
.Lcode_4582:
    mov	r3, r8
    str.w	ip, [sp, #32]
    mov	r8, r2
    mov	ip, r4
    mov	r2, r6
.Lcode_4587:
    movw	r1, #30891
    smull	r0, r1, r7, r1
    ldr.w	sl, [sp, #24]
    strd	r0, r1, [sp]
    movw	r1, #31776
    ldr.w	r6, [sl], #4
    ldr	r7, [sp, #0]
    str.w	sl, [sp, #24]
    smull	r0, r1, r8, r1
    strd	r0, r1, [sp, #8]
    movw	r1, #30895
    smull	r0, r1, r3, r1
    ldr.w	sl, [sp, #8]
    strd	r0, r1, [sp, #16]
    lsrs	r3, r7, #15
    mov.w	r0, sl, lsr #15
    ldr	r7, [sp, #16]
    ldr.w	sl, [sp, #4]
    lsrs	r1, r7, #15
    orr.w	r3, r3, sl, lsl #17
    asrs	r5, r6, #31
    mov.w	r7, #4294967295
    ldr.w	sl, [sp, #12]
    mov	r4, r6
    smlal	r4, r5, r7, r2
    ldr	r2, [sp, #20]
    smlal	r4, r5, fp, r3
    orr.w	r0, r0, sl, lsl #17
    orr.w	r1, r1, r2, lsl #17
    mvn.w	sl, #1
    mov	r2, r4
    mov	r3, r5
    smlal	r2, r3, sl, ip
    ldr.w	sl, [sp, #32]
    smlal	r2, r3, fp, sl
    mov.w	sl, #2
    smlal	r2, r3, sl, r0
    mov.w	r0, #4294967295
    smlal	r2, r3, r0, r1
    ldr	r1, [sp, #28]
    str.w	r2, [r1], #4
    adds.w	r9, r9, r0
    mov	r7, r4
    str	r1, [sp, #28]
    bne.n .Lcode_4582
    ldr	r7, [sp, #36]
    str	r6, [r7, #0]
    str	r4, [r7, #4]
    str	r4, [r7, #8]
    str	r2, [r7, #12]
    str.w	ip, [r7, #16]
    str.w	r8, [r7, #20]
    add	sp, #40
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
.Lcode_4642:
.global asm_filter_i16_state6
.type asm_filter_i16_state6, %function
.thumb_func
asm_filter_i16_state6:
    push	{r4, r5, r6, r7, lr}
    lsls	r6, r3, #1
    sub	sp, #340
    mov	r4, r1
    mov	r7, r0
    adds	r5, r2, r6
    mov	r1, sp
.Lcode_4649:
    ldrsh.w	r0, [r2], #2
    lsls	r0, r0, #14
    cmp	r2, r5
    str.w	r0, [r1], #4
    bne.n .Lcode_4649
    add	r5, sp, #0
    mov	r0, r5
    mov	r1, r5
    mov	r2, r7
    bl .Lcode_4566
    adds	r6, r4, r6
    movw	r0, #30890
    mvn.w	r7, #2147483648
    mov.w	r1, #32768
.Lcode_4663:
    ldr.w	r2, [r5], #4
    smull	r2, r3, r2, r0
    lsrs	r2, r2, #15
    orr.w	r2, r2, r3, lsl #17
    lsls	r3, r2, #2
    cmp.w	r2, r3, asr #2
    it	ne
    eorne.w	r3, r7, r2, asr #31
    qadd	r3, r1, r3
    asrs	r3, r3, #16
    strh.w	r3, [r4], #2
    cmp	r4, r6
    bne.n .Lcode_4663
    add	sp, #340
    pop	{r4, r5, r6, r7, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_4678:
.global asm_encode_frame_controller
.type asm_encode_frame_controller, %function
.thumb_func
asm_encode_frame_controller:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #468
    ldr	r4, [sp, #504]
    ldrsh.w	r5, [sp, #508]
    str	r0, [sp, #60]
    add.w	r7, r4, #4992
    str	r5, [sp, #52]
    ldrsh.w	r0, [r7, #10]
    str	r1, [sp, #64]
    mov	r5, r2
    str	r3, [sp, #48]
    cbnz	r0, .Lcode_4691
    bic.w	r5, r2, #2048
.Lcode_4691:
    ldrh.w	r8, [r4, #2428]
    ldrh.w	r2, [r4, #1584]
    str.w	r8, [sp, #56]
    strh.w	r2, [sp, #360]
    add.w	r8, r4, #1600
    add.w	r2, r4, #4608
    add.w	ip, r4, #1856
    adds	r2, #46
    add.w	r0, r4, #1584
    add.w	fp, r8, #14
    add.w	r8, r8, #94
    add.w	r3, r0, #10
    add.w	r6, r4, #2336
    str.w	r8, [sp, #348]
    str	r2, [sp, #400]
    add.w	r8, ip, #6
    ldr	r2, .Lliteral_4855
    str	r3, [sp, #352]
    add.w	lr, r4, #1568
    add.w	r1, r4, #2592
    adds	r3, r6, #6
    adds	r1, #14
    add.w	lr, lr, #4
    str.w	r8, [sp, #372]
    add.w	r8, r4, #1808
    adds	r0, #20
    adds	r7, #10
    str	r3, [sp, #376]
    str.w	lr, [sp, #368]
    ubfx	r3, r5, #6, #1
    ldr.w	lr, [sp, #48]
    str.w	r8, [sp, #384]
    str	r1, [sp, #396]
    ldr.w	r8, [sp, #56]
    ldrh.w	r1, [r4, #2432]
    str	r2, [sp, #404]
    ldrh.w	r2, [r4, #2674]
    str	r0, [sp, #356]
    adds	r6, #24
    add.w	sl, r4, #24
    add.w	r9, r4, #1784
    strh.w	r3, [sp, #394]
    mov	r0, r7
    movs	r3, #0
    str.w	sl, [sp, #364]
    str.w	r9, [sp, #380]
    str.w	ip, [sp, #388]
    strh.w	lr, [sp, #410]
    strh.w	r3, [sp, #408]
    strh.w	r1, [sp, #412]
    strh.w	r2, [sp, #414]
    str.w	fp, [sp, #344]
    strh.w	r8, [sp, #392]
    str	r6, [sp, #416]
    bl .Lcode_4955
    mov	r1, r0
    mov	r0, r6
    bl .Lcode_9392
    ands.w	sl, r5, #16384
    mov	r9, r0
    beq.n .Lcode_4812
    add.w	r2, r4, #4928
    add.w	r8, sp, #452
    ldrh	r1, [r2, #50]
    ldrsh.w	r3, [r2, #52]
    strh.w	r1, [sp, #452]
    strh.w	r1, [sp, #454]
    movs	r1, #1
    str	r3, [sp, #456]
    strh	r1, [r2, #48]
.Lcode_4761:
    ldr	r0, [sp, #52]
    orr.w	r6, r9, #32768
    orr.w	r6, r6, #2
    cmp	r0, #0
    beq.n .Lcode_4809
    ldr.w	lr, [sp, #52]
    ldrsh.w	r1, [sp, #452]
    ldrsh.w	r0, [sp, #454]
    mov.w	r2, lr, lsl #16
    add.w	r1, r2, r1, lsl #16
    add.w	r2, r2, r0, lsl #16
    asrs	r1, r1, #16
    asrs	r2, r2, #16
    strh.w	r1, [sp, #452]
    strh.w	r2, [sp, #454]
    mov.w	sl, #3
    add.w	r9, sp, #420
.Lcode_4778:
    add	r0, sp, #464
    add.w	r1, r4, #5760
    adds	r1, #58
    movs	r2, #1
    strh.w	r3, [r0, #-2]!
    bl .Lcode_5480
    ldrsh.w	r2, [sp, #462]
    str.w	r8, [sp, #16]
    add.w	r4, r4, #2720
    movs	r3, #68
    and.w	r1, r5, #512
    str	r2, [sp, #456]
    add	r0, sp, #208
    str	r2, [sp, #12]
    adds	r4, #28
    add	r2, sp, #344
    stmia.w	sp, {r0, r3, r4}
    str	r1, [sp, #20]
    str	r2, [sp, #36]
    ldr	r0, [sp, #60]
    ldr	r1, [sp, #64]
    str.w	r9, [sp, #24]
    and.w	r5, r5, #128
    add	r2, sp, #72
    str.w	sl, [sp, #28]
    str	r7, [sp, #32]
    str	r5, [sp, #40]
    bl .Lcode_5127
    mov	r0, r6
    add	sp, #468
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_4809:
    mov.w	sl, #3
    add.w	r9, sp, #420
    b.n .Lcode_4778
.Lcode_4812:
    add.w	fp, r4, #4928
    add.w	r8, sp, #452
    add.w	r2, fp, #48
    add	r0, sp, #456
    mov	r1, r8
    bl .Lcode_12897
    cbnz	r0, .Lcode_4833
    strh.w	r0, [fp, #48]
    cmp.w	r9, #0
    bne.n .Lcode_4824
    lsls	r3, r5, #20
    bmi.n .Lcode_4836
.Lcode_4824:
    ldrh.w	r2, [sp, #408]
    ldr.w	lr, [sp, #52]
    ldr	r3, [sp, #456]
    add	r2, lr
    orr.w	r6, r9, #2
    strh.w	r2, [sp, #408]
    mov.w	sl, #1
    add.w	r9, sp, #420
    b.n .Lcode_4778
.Lcode_4833:
    strh.w	sl, [fp, #48]
    ldr	r3, [sp, #456]
    b.n .Lcode_4761
.Lcode_4836:
    add.w	r9, sp, #420
    mov	r1, r6
    mov	r0, r9
    bl .Lcode_9404
    mov	r6, r0
    ldr	r0, [sp, #52]
    cbz	r0, .Lcode_4852
    ldr	r2, [sp, #52]
    mov	r3, r9
    lsls	r1, r2, #16
.Lcode_4846:
    ldrsh.w	r2, [r3]
    add.w	r2, r1, r2, lsl #16
    asrs	r2, r2, #16
    strh.w	r2, [r3], #2
    cmp	r3, r8
    bne.n .Lcode_4846
.Lcode_4852:
    ldr	r3, [sp, #456]
    mov.w	sl, #2
    b.n .Lcode_4778
.Lliteral_4855:
    .word .Lcode_20009 + 1
.Lcode_4856:
.global asm_select_frame_band_candidate
.type asm_select_frame_band_candidate, %function
.thumb_func
asm_select_frame_band_candidate:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub	sp, #32
    mov	r9, r0
    ldr	r4, [sp, #72]
    ldr.w	r8, [sp, #64]
    ldr	r5, [sp, #68]
    ldrh.w	r6, [r4, #70]
    ldr.w	lr, [r4]
    ldrh.w	r7, [r4, #68]
    ldr.w	sl, [r4, #4]
    ldrsh.w	ip, [r4, #48]
    add	r5, r8
    mov	r0, r1
    subs	r7, r7, r6
    mov	r1, r2
    mov	r2, lr
    cmp	r5, #1
    ite	gt
    movgt.w	lr, #2
    movle.w	lr, #1
    mov	r6, r3
    str.w	lr, [sp, #8]
    mov	r3, sl
    add.w	lr, sp, #28
    sxth	r7, r7
    str.w	ip, [sp]
    str.w	lr, [sp, #12]
    str	r5, [sp, #4]
    str	r7, [sp, #16]
    bl .Lcode_12973
    ldr	r3, [r4, #44]
    ldr	r1, [r4, #40]
    ldrsh.w	r2, [r3, r5, lsl #1]
    add.w	r1, r1, r5, lsl #4
    mov	r0, r6
    movs	r3, #0
    rsb	r8, r8, #1
    bl .Lcode_12927
    ldr	r0, [r4, #8]
    ldr	r1, [r4, #12]
    ldrsh.w	r2, [r4, #16]
    mov	r3, r5
    sxth.w	r4, r8
    str	r4, [sp, #0]
    bl .Lcode_13153
    strh.w	r0, [r9, #12]
    add	sp, #32
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_4904:
.global asm_populate_spectral_frame
.type asm_populate_spectral_frame, %function
.thumb_func
asm_populate_spectral_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #28
    mov	r6, r2
    mov	r5, r0
    ldr	r4, [sp, #56]
    adds	r7, r3, r2
    cbnz	r2, .Lcode_4928
    ldrsh.w	r3, [r0]
    cmp	r3, #2
    beq.n .Lcode_4949
    ldrsh.w	lr, [r0, #12]
    ldrsh.w	r9, [r4, #64]
    ldr.w	r8, [r4, #20]
    ldr.w	ip, [r4, #24]
    ldrsh.w	r2, [r0, #4]
    ldr	r3, [r0, #8]
    str	r1, [sp, #0]
    add.w	r0, r0, #16
    mov	r1, lr
    str.w	r9, [sp, #4]
    str.w	r8, [sp, #8]
    str.w	ip, [sp, #12]
    str	r7, [sp, #16]
    bl .Lcode_13261
.Lcode_4928:
    ldrsh.w	r3, [r4, #50]
    cbz	r3, .Lcode_4947
    ldrsh.w	r3, [r5]
    cmp	r3, #3
    beq.n .Lcode_4947
    ldr.w	r8, [r4, #52]
    ldr.w	ip, [r4, #28]
    ldr.w	lr, [r4, #32]
    ldrsh.w	r2, [r4, #66]
    ldr	r1, [r4, #56]
    ldr	r3, [r4, #72]
    ldrsh.w	r0, [r4, #48]
    str	r2, [sp, #20]
    stmia.w	sp, {r8, ip, lr}
    str	r6, [sp, #12]
    str	r7, [sp, #16]
    ldr	r4, [r4, #60]
    mov	r2, r5
    blx	r4
.Lcode_4947:
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_4949:
    ldr	r1, [sp, #60]
    ldrsh.w	r2, [r0, #4]
    adds	r1, #2
    add.w	r0, r0, #16
    bl .Lcode_2496
    b.n .Lcode_4928
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_7,"ax",%progbits
.balign 4
.Lcode_4955:
.global asm_get_second_i16
.type asm_get_second_i16, %function
.thumb_func
asm_get_second_i16:
    ldrsh.w	r0, [r0, #2]
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_4957:
.global asm_initialize_partition_config
.type asm_initialize_partition_config, %function
.thumb_func
asm_initialize_partition_config:
    push	{r4, r5, r6, r7}
    cmp	r1, #0
    beq.n .Lcode_5003
    cmp	r2, #4
    it	ge
    movge	r2, #4
    bic.w	r2, r2, r2, asr #31
    subs	r4, r2, #1
    strh	r2, [r0, #6]
    movs	r2, #9
    movs	r1, #5
    movs	r7, #1
    movs	r6, #7
    movs	r5, #4
    strh	r2, [r0, #14]
    movs	r2, #3
    add.w	r3, r0, #12
    strh	r7, [r0, #0]
    strh	r7, [r0, #2]
    strh	r1, [r0, #8]
    strh	r6, [r0, #10]
    strh	r1, [r0, #12]
    strh	r6, [r0, #16]
    strh	r1, [r0, #18]
    strh	r5, [r0, #20]
    strh	r5, [r0, #22]
    strh	r2, [r0, #24]
    cmp	r4, #3
    bhi.n .Lcode_4994
    tbb	[pc, r4]
.Ldata_4987:
    .byte (.Lcode_5005 - .Ldata_4987) / 2
    .byte (.Lcode_4992 - .Ldata_4987) / 2
    .byte (.Lcode_5008 - .Ldata_4987) / 2
    .byte (.Lcode_4989 - .Ldata_4987) / 2
.Lcode_4989:
    movs	r2, #3
    strh	r2, [r0, #20]
    strh	r2, [r0, #22]
.Lcode_4992:
    movs	r2, #1
    strh	r2, [r0, #24]
.Lcode_4994:
    add.w	r4, r0, #24
    movs	r1, #5
    movs	r2, #12
    b.n .Lcode_4999
.Lcode_4998:
    ldrh.w	r1, [r3, #2]!
.Lcode_4999:
    cmp	r3, r4
    sxtah	r2, r2, r1
    bne.n .Lcode_4998
    strh	r2, [r0, #4]
.Lcode_5003:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_5005:
    movs	r2, #2
    strh	r2, [r0, #24]
    b.n .Lcode_4994
.Lcode_5008:
    movs	r2, #3
    strh	r2, [r0, #22]
    movs	r2, #1
    strh	r2, [r0, #24]
    b.n .Lcode_4994

.section .text.vocoder_block_8,"ax",%progbits
.balign 4
.Lcode_5013:
.global asm_prepare_voicing_frame_pair
.type asm_prepare_voicing_frame_pair, %function
.thumb_func
asm_prepare_voicing_frame_pair:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #28
    ldr	r4, .Lliteral_5098
    ldr	r5, [sp, #84]
    ldrb	r2, [r4, r2]
    ldrsh.w	r4, [r5]
    ldr.w	r9, [sp, #80]
    ldr	r6, [sp, #64]
    ldr.w	sl, [sp, #88]
    mov	r8, r0
    rsb	r2, r2, #49
    mov	r7, r1
    mov	r0, r5
    mov	r1, r4
    mov	r4, r3
    bl .Lcode_4957
    movs	r2, #49
    movs	r1, #0
    mov	r0, r8
    bl .Lcode_2535
    mov	r1, r8
    mov	r0, r7
    bl .Lcode_13469
    uxth.w	r8, r9
    cmp.w	r9, #3
    strh.w	r8, [r6]
    strh.w	r8, [r4]
    beq.n .Lcode_5092
    ldrsh.w	fp, [r5, #8]
    movs	r0, #255
    strh	r0, [r4, #2]
    add.w	lr, sl, #64
    add.w	r1, r6, #8
    add.w	r2, r4, #8
    mov	r3, sl
    add.w	ip, sl, #32
    mov	r0, r9
    stmia.w	sp, {ip, lr}
    str.w	fp, [sp, #8]
    bl .Lcode_13471
    ldrsh.w	r2, [r4, #14]
    ldrsh.w	lr, [r5, #10]
    ldrsh.w	r3, [r6, #14]
    str	r2, [sp, #0]
    mov	r9, r0
    str.w	lr, [sp, #4]
    add.w	r0, sp, #22
    mov.w	lr, #1
    mov	r1, r6
    mov	r2, r4
    str.w	lr, [sp, #8]
    bl .Lcode_13784
    cbz	r0, .Lcode_5083
    movw	r2, #4217
    movs	r3, #56
    ldrh.w	r0, [sp, #22]
    strh	r2, [r6, #12]
    strh	r3, [r6, #4]
    strh	r2, [r4, #12]
    strh	r3, [r4, #4]
.Lcode_5073:
    sxth	r2, r0
    ldrsh.w	r1, [r5, #10]
    mov	r0, r7
    bl .Lcode_13935
    ldrsh.w	r1, [r5, #8]
    mov	r0, r7
    mov	r2, r9
    bl .Lcode_13935
.Lcode_5081:
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5083:
    ldrsh.w	r2, [sp, #92]
    ldrsh.w	r3, [r5, #10]
    str	r2, [sp, #0]
    add.w	r0, r4, #12
    adds	r1, r4, #4
    sxth.w	r2, r8
    bl .Lcode_13944
    strh.w	r0, [sp, #22]
    b.n .Lcode_5073
.Lcode_5092:
    ldr	r0, [sp, #72]
    ldr	r1, [sp, #76]
    mov	r2, r5
    mov	r3, r7
    bl .Lcode_14009
    b.n .Lcode_5081
    .byte 0x00
    .byte 0xbf
.Lliteral_5098:
    .word .Ldata_20778
.Lcode_5099:
.global asm_encode_and_prepare_frame
.type asm_encode_and_prepare_frame, %function
.thumb_func
asm_encode_and_prepare_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    sub	sp, #8
    mov	r6, r3
    ldr	r3, [sp, #32]
    ldr	r4, [sp, #36]
    cmp	r3, #3
    mov	r8, r0
    mov	r7, r1
    mov	r5, r2
    beq.n .Lcode_5120
    movs	r3, #1
    mov	r1, r2
    str	r3, [sp, #0]
    mov	r0, r6
    mov	r2, r4
    mov	r3, r7
    bl .Lcode_14522
    mov	r0, r8
    movs	r1, #0
    mov	r2, r4
    bl .Lcode_14550
.Lcode_5120:
    mov	r0, r6
    mov	r1, r5
    movs	r2, #0
    mov	r3, r4
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    b.w .Lcode_14066
    .byte 0x00
    .byte 0xbf
.Lcode_5127:
.global asm_process_spectral_frame_pair
.type asm_process_spectral_frame_pair, %function
.thumb_func
asm_process_spectral_frame_pair:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #140
    mov	r5, r2
    ldr	r4, [sp, #208]
    ldr	r6, [sp, #212]
    ldrsh.w	r7, [r4, #2]
    ldr.w	ip, [r6, #36]
    ldr.w	sl, [sp, #176]
    ldr.w	r8, [sp, #204]
    adds	r3, r7, #1
    cmp.w	r8, #1
    ldrh.w	r3, [ip, r3, lsl #1]
    strh.w	r3, [sl, #14]
    ldrh.w	r3, [ip, r7, lsl #1]
    mov	r9, r0
    strh	r3, [r2, #14]
    mov	fp, r1
    beq.n .Lcode_5194
.Lcode_5145:
    ldrsh.w	r3, [r4]
    cmp	r3, #0
    bne.n .Lcode_5175
.Lcode_5148:
    cmp.w	r8, #3
    beq.n .Lcode_5164
    ldr	r7, [sp, #200]
    ldrsh.w	r3, [r4, #2]
    ldr	r1, [sp, #184]
    str	r6, [sp, #0]
    movs	r2, #1
    mov	r0, sl
    str	r7, [sp, #4]
    bl .Lcode_4904
    ldrsh.w	r3, [r4, #2]
    ldr	r1, [sp, #184]
    mov	r0, r5
    movs	r2, #0
    stmia.w	sp, {r6, r7}
    bl .Lcode_4904
.Lcode_5164:
    ldrsh.w	r3, [r4]
    cbz	r3, .Lcode_5173
    mov	r0, r9
    add	r1, sp, #132
    mov	r2, r5
    ldr	r3, [sp, #184]
    str.w	r8, [sp]
    str	r4, [sp, #4]
    bl .Lcode_5099
.Lcode_5173:
    add	sp, #140
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5175:
    ldr	r3, [sp, #188]
    ldr	r7, [sp, #184]
    str	r3, [sp, #8]
    ldr	r3, [sp, #192]
    str.w	sl, [sp]
    str	r3, [sp, #12]
    add	r3, sp, #36
    str	r3, [sp, #24]
    ldrsh.w	r3, [sp, #216]
    str	r7, [sp, #4]
    str	r3, [sp, #28]
    mov	r0, r9
    add	r1, sp, #132
    mov	r2, fp
    mov	r3, r5
    str.w	r8, [sp, #16]
    str	r4, [sp, #20]
    bl .Lcode_5013
    b.n .Lcode_5148
.Lcode_5194:
    add	r1, sp, #52
    add	r2, sp, #116
    add	r3, sp, #84
    mov	r0, sl
    str.w	r8, [sp]
    str	r7, [sp, #4]
    str	r6, [sp, #8]
    bl .Lcode_4856
    ldrsh.w	r3, [r4, #2]
    str	r6, [sp, #8]
    movs	r2, #0
    stmia.w	sp, {r2, r3}
    mov	r0, r5
    add	r1, sp, #36
    add	r2, sp, #100
    add	r3, sp, #68
    bl .Lcode_4856
    b.n .Lcode_5145
.Lcode_5212:
.global asm_decode_and_prepare_frame
.type asm_decode_and_prepare_frame, %function
.thumb_func
asm_decode_and_prepare_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #28
    mov	r5, r0
    ldr	r4, [sp, #84]
    ldr.w	r8, [sp, #64]
    ldrh	r1, [r4, #0]
    ldr.w	r9, [sp, #68]
    ldr.w	fp, [sp, #80]
    ldrsh.w	r7, [sp, #96]
    mov	r6, r2
    cbnz	r1, .Lcode_5226
.Lcode_5223:
    sxth	r0, r3
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5226:
    ldr	r3, [sp, #72]
    ldr	r2, .Lliteral_5366
    ldrb	r2, [r2, r3]
    sxth	r1, r1
    rsb	r2, r2, #49
    mov	r0, r4
    bl .Lcode_4957
    add	r0, sp, #16
    mov	r1, r9
    bl .Lcode_13469
    add.w	r0, r9, #12
    mov	r3, r9
    movs	r2, #0
.Lcode_5239:
    ldrsh.w	r1, [r3], #2
    cmp	r3, r0
    add.w	r2, r1, r2, lsl #1
    bne.n .Lcode_5239
    ldrsh.w	r3, [r4]
    cmp	r3, #0
    beq.n .Lcode_5327
    cmp	r2, #63
    beq.n .Lcode_5334
    cmp	r2, #62
    beq.w .Lcode_5350
    cmp	r2, #59
    ite	gt
    movgt	r2, #0
    movle	r2, #1
    uxth	r1, r2
    movs	r3, #255
    strh	r1, [r6, #0]
    strh	r3, [r6, #2]
    strh	r1, [r5, #0]
    strh	r3, [r5, #2]
    cmp	r2, #0
    beq.n .Lcode_5332
    mov.w	sl, #1
.Lcode_5263:
    mov	r2, r4
    mov	r0, r9
    movs	r1, #1
    bl .Lcode_14550
    ldrsh.w	r1, [r4, #10]
    add	r0, sp, #16
    bl .Lcode_14920
    add.w	r9, sp, #24
    ldrsh.w	r1, [r4, #8]
    strh.w	r0, [r9, #-2]!
    add	r0, sp, #16
    bl .Lcode_14920
    ldrsh.w	lr, [r4, #8]
    mov	r3, r0
    add.w	r1, r6, #8
    add.w	r2, r5, #8
    mov	r0, sl
    str.w	lr, [sp]
    bl .Lcode_14929
    mov.w	ip, #0
    ldrsh.w	lr, [r4, #10]
    str.w	ip, [sp]
    mov	r0, r9
    mov	r1, r6
    mov	r2, r5
    mov	r3, ip
    str.w	lr, [sp, #4]
    str.w	ip, [sp, #8]
    bl .Lcode_13784
    cmp	r0, #0
    beq.n .Lcode_5357
    movw	r2, #4217
    movs	r3, #56
    strh	r2, [r6, #12]
    strh	r3, [r6, #4]
    strh	r2, [r5, #12]
    strh	r3, [r5, #4]
.Lcode_5300:
    mov	r1, r5
    mov	r2, r4
    add	r3, sp, #16
    mov	r0, r8
    mov.w	lr, #0
    str.w	lr, [sp]
    bl .Lcode_14522
    ldrsh.w	r2, [fp, #48]
    ldrsh.w	r3, [fp, #36]
    mov	r0, r5
    mov	r1, r8
    bl .Lcode_14949
.Lcode_5312:
    mov	r2, r8
    movs	r3, #0
    mov	r0, r6
    mov	r1, r5
    str	r7, [sp, #0]
    bl .Lcode_15256
    mov	r3, r4
    mov	r0, r8
    mov	r1, r5
    movs	r2, #0
    bl .Lcode_14066
    movs	r3, #0
.Lcode_5324:
    movw	r2, #65533
    strh.w	r2, [r8, #136]
    b.n .Lcode_5223
.Lcode_5327:
    movs	r2, #255
    strh	r3, [r6, #0]
    strh	r2, [r6, #2]
    strh	r3, [r5, #0]
    strh	r2, [r5, #2]
.Lcode_5332:
    movs	r3, #4
    b.n .Lcode_5324
.Lcode_5334:
    movs	r2, #3
    movs	r3, #255
    strh	r2, [r6, #0]
    strh	r3, [r6, #2]
    strh	r2, [r5, #0]
    strh	r3, [r5, #2]
    mov	r0, r5
    mov	r1, r6
    add	r2, sp, #16
    mov	r3, r4
    str.w	r8, [sp]
    bl .Lcode_15400
    cmp	r0, #0
    beq.n .Lcode_5312
    sxth	r3, r0
    b.n .Lcode_5324
.Lcode_5350:
    mov.w	sl, #2
    movs	r3, #255
    strh.w	sl, [r6]
    strh	r3, [r6, #2]
    strh.w	sl, [r5]
    strh	r3, [r5, #2]
    b.n .Lcode_5263
.Lcode_5357:
    mov	r1, r5
    ldrsh.w	lr, [r4, #10]
    ldrsh.w	r0, [r1], #12
    ldrsh.w	r3, [sp, #22]
    str	r7, [sp, #4]
    adds	r2, r5, #4
    str.w	lr, [sp]
    bl .Lcode_15489
    b.n .Lcode_5300
.Lliteral_5366:
    .word .Ldata_20778
.Lcode_5367:
.global asm_spread_spectral_peak
.type asm_spread_spectral_peak, %function
.thumb_func
asm_spread_spectral_peak:
    uxth	r1, r1
    subs	r3, r1, #1
    stmdb	sp!, {r4, r5, r6, r7, r8}
    uxth	r3, r3
    movw	r4, #34817
    movt	r4, #65535
    sxth	r5, r3
    cmp	r2, r4
    it	lt
    movlt	r2, r4
    cmp	r5, #0
    blt.n .Lcode_5397
    add.w	r5, r0, r5, lsl #1
    mov	r6, r2
    mov.w	r8, #67108864
.Lcode_5382:
    ldrsh.w	ip, [r5], #-2
    subs	r3, #1
    lsls	r7, r6, #16
    uxth	r3, r3
    qsub	r7, r7, r8
    asrs	r7, r7, #16
    cmp	ip, r6
    it	lt
    strhlt	r6, [r5, #2]
    cmp	r7, r4
    ite	ge
    movge	r6, r7
    movlt	r6, r4
    tst.w	r3, #32768
    beq.n .Lcode_5382
.Lcode_5397:
    adds	r1, #1
    uxth	r1, r1
    sxth	r3, r1
    cmp	r3, #55
    bgt.n .Lcode_5422
    movw	r6, #34817
    add.w	r0, r0, r3, lsl #1
    mov.w	r7, #67108864
    movt	r6, #65535
.Lcode_5406:
    adds	r1, #1
    ldrsh.w	r5, [r0], #2
    uxth	r1, r1
    lsls	r4, r2, #16
    sxth	r3, r1
    qsub	r4, r4, r7
    asrs	r4, r4, #16
    cmp	r2, r5
    it	gt
    strhgt.w	r2, [r0, #-2]
    cmp	r4, r6
    ite	ge
    movge	r2, r4
    movlt	r2, r6
    cmp	r3, #55
    ble.n .Lcode_5406
.Lcode_5422:
    ldmia.w	sp!, {r4, r5, r6, r7, r8}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_5424:
.global asm_classify_code
.type asm_classify_code, %function
.thumb_func
asm_classify_code:
    uxth	r0, r0
    subs	r3, r0, #5
    uxth	r3, r3
    cmp	r3, #117
    bls.n .Lcode_5448
    sub.w	r3, r0, #128
    uxth	r3, r3
    cmp	r3, #15
    bls.n .Lcode_5445
    sub.w	r3, r0, #144
    uxth	r3, r3
    cmp	r3, #15
    bls.n .Lcode_5451
    subs	r0, #160
    uxth	r0, r0
    cmp	r0, #3
    ite	hi
    movhi	r0, #4
    movls	r0, #3
    sxth	r0, r0
    bx	lr
.Lcode_5445:
    movs	r0, #1
    sxth	r0, r0
    bx	lr
.Lcode_5448:
    movs	r0, #0
    sxth	r0, r0
    bx	lr
.Lcode_5451:
    movs	r0, #2
    sxth	r0, r0
    bx	lr
.Lcode_5454:
.global asm_lookup_partition_value
.type asm_lookup_partition_value, %function
.thumb_func
asm_lookup_partition_value:
    cbnz	r0, .Lcode_5466
    add.w	r1, r1, r1, lsl #2
    lsls	r0, r1, #10
    movw	r3, #65535
    qadd	r0, r3, r0
    lsrs	r0, r0, #16
    subs	r0, #1
    sxth	r0, r0
    bic.w	r0, r0, r0, asr #31
    uxth	r0, r0
    sxth	r0, r0
    bx	lr
.Lcode_5466:
    cmp	r0, #3
    bls.n .Lcode_5471
    movs	r0, #0
    sxth	r0, r0
    bx	lr
.Lcode_5471:
    subs	r1, #128
    add.w	r2, r2, r1, lsl #1
    ldr	r3, .Lliteral_5479
    ldrb	r0, [r3, r2]
    subs	r0, #1
    uxth	r0, r0
    sxth	r0, r0
    bx	lr
.Lliteral_5479:
    .word .Ldata_20709
.Lcode_5480:
.global asm_track_sync_word
.type asm_track_sync_word, %function
.thumb_func
asm_track_sync_word:
    stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr	r5, .Lliteral_5558
    mov	r6, r0
    mov	r4, r1
    adds	r0, r1, #2
    mov	r7, r2
    adds	r1, #4
    movs	r2, #16
    ldrb.w	r9, [r5, #40]
    ldrb.w	sl, [r5, #41]
    ldrb.w	fp, [r5, #42]
    ldrb.w	r8, [r5, #43]
    bl .Lcode_2496
    ldrh	r3, [r6, #0]
    strh	r3, [r4, #34]
    ldrsh.w	r3, [r6]
    cmp	r7, #1
    ite	ne
    movne	r7, #20
    moveq	r7, #0
    cmp	r3, #255
    beq.n .Lcode_5549
    ldrsh.w	r2, [r4]
    cmp	r2, #0
    ble.n .Lcode_5507
    cmp	r3, #18
    bgt.n .Lcode_5530
.Lcode_5507:
    movs	r3, #0
    strh	r3, [r4, #0]
    mov	r2, r4
    movs	r6, #17
    adds	r5, r5, r7
    b.n .Lcode_5515
.Lcode_5513:
    cmp	r3, #17
    beq.n .Lcode_5524
.Lcode_5515:
    ldrb	r1, [r5, r3]
    ldrsh.w	r0, [r2, #2]!
    adds	r3, #1
    cmp	r0, r1
    bne.n .Lcode_5513
    subs	r6, #1
    cmp	r3, #17
    uxth	r6, r6
    bne.n .Lcode_5515
.Lcode_5524:
    sxth	r6, r6
    cmp	r6, #1
    ble.n .Lcode_5553
    movs	r0, #0
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5530:
    cmp	r3, #22
    bgt.n .Lcode_5507
    orr.w	r8, r8, r9, lsl #24
    orr.w	sl, r8, sl, lsl #16
    movw	r3, #3299
    orr.w	fp, sl, fp, lsl #8
    movt	r3, #15463
    eor.w	r3, fp, r3
    rsb	r2, r2, #32
    asrs	r3, r2
    and.w	r3, r3, #1
    rsb	r3, r3, #21
    strh	r3, [r6, #0]
    ldrh	r3, [r4, #0]
    movs	r0, #1
    subs	r3, #1
    strh	r3, [r4, #0]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5549:
    movs	r0, #0
    strh	r0, [r4, #0]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5553:
    movs	r3, #32
    movs	r0, #0
    strh	r3, [r4, #0]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lliteral_5558:
    .word .Ldata_20749
.Lcode_5559:
.global asm_initialize_spectral_frame
.type asm_initialize_spectral_frame, %function
.thumb_func
asm_initialize_spectral_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #12
    mov	r5, r1
    movs	r6, #0
    mov.w	sl, #3
    mov.w	r8, #1
    add.w	r7, r0, #16
    movw	r1, #45057
    str	r2, [sp, #4]
    strh.w	sl, [r0]
    movs	r2, #56
    strh	r6, [r0, #14]
    str.w	r8, [r0, #8]
    mov	r4, r0
    movt	r1, #65535
    mov	r0, r7
    mov	fp, r3
    ldrsh.w	r9, [sp, #48]
    bl .Lcode_2535
    uxth	r2, r5
    subs	r3, r2, #5
    uxth	r3, r3
    cmp	r3, #117
    bls.n .Lcode_5669
    sub.w	r3, r2, #128
    uxth	r3, r3
    cmp	r3, #15
    bhi.w .Lcode_5714
.Lcode_5587:
    movs	r2, #0
    mov	r1, r5
    mov	r0, r8
    str	r3, [sp, #0]
    bl .Lcode_5454
    mov	r1, r5
    mov	sl, r0
    movs	r2, #1
    mov	r0, r8
    bl .Lcode_5454
    ldr	r3, [sp, #0]
    strh	r5, [r4, #2]
    uxth	r2, r0
    adds	r1, r2, #1
    mov	r6, r0
    sxth	r3, r3
    ldr	r0, .Lliteral_5750
    sxth	r1, r1
    ldrh.w	r0, [r0, r3, lsl #1]
    cmp	r1, #9
    it	lt
    movlt	r1, #9
    add.w	r2, r2, sl, lsl #8
    cmp	r1, #56
    it	ge
    movge	r1, #56
    strh	r2, [r4, #6]
    strh	r0, [r4, #12]
    strh	r1, [r4, #4]
    cmp.w	r9, #0
    beq.w .Lcode_5726
    ldr	r2, .Lliteral_5751
    ldrsh.w	r3, [r2, r3, lsl #1]
    ldr	r2, [sp, #4]
    mov.w	fp, fp, lsl #15
    mov.w	lr, r2, lsl #15
    mov.w	r5, #45056
    qadd	lr, fp, lr
    mov.w	lr, lr, asr #16
    mov.w	lr, lr, lsl #16
    lsls	r3, r3, #16
    movt	r5, #65535
    qsub	ip, lr, r3
    mov.w	ip, ip, asr #16
    cmp	ip, r5
    it	lt
    movlt	ip, r5
    movw	r8, #28671
    cmp	ip, r8
    it	ge
    movge	ip, r8
    add.w	r9, sl, #8
    uxth.w	ip, ip
    strh.w	ip, [r4, r9, lsl #1]
    qadd	r9, r3, lr
    mov.w	r9, r9, asr #16
    mov.w	r2, ip, lsl #16
    mov.w	fp, #1342177280
    mov	r0, r7
    qsub	r2, r2, fp
    mov	r1, sl
    asrs	r2, r2, #16
    cmp	r9, r5
    it	ge
    movge	r5, r9
    bl .Lcode_5367
    cmp	r5, r8
    it	lt
    movlt	r8, r5
    add.w	r3, r6, #8
    uxth.w	r8, r8
    mov.w	r2, r8, lsl #16
    strh.w	r8, [r4, r3, lsl #1]
    qsub	fp, r2, fp
    mov	r0, r7
    mov.w	r2, fp, asr #16
    mov	r1, r6
    bl .Lcode_5367
    mov.w	r9, #0
.Lcode_5666:
    sxth.w	r0, r9
    add	sp, #12
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5669:
    mov	r1, r5
    mov	r2, r6
    mov	r0, r6
    bl .Lcode_5454
    mov.w	r1, r0, lsl #24
    mov	r8, r0
    add.w	r1, r1, #16777216
    asrs	r1, r1, #16
    lsls	r0, r5, #20
    strh	r5, [r4, #2]
    strh.w	r8, [r4, #6]
    bl .Lcode_6534
    mov.w	r3, #45056
    add.w	r5, r8, #1
    movt	r3, #65535
    sxth	r5, r5
    cmp	fp, r3
    it	ge
    movge	r3, fp
    movw	r2, #30719
    cmp	r5, #9
    it	lt
    movlt	r5, #9
    cmp	r3, r2
    it	ge
    movge	r3, r2
    add.w	r1, r8, #8
    cmp	r5, #56
    it	ge
    movge	r5, #56
    uxth	r3, r3
    strh	r0, [r4, #12]
    strh	r5, [r4, #4]
    strh.w	r3, [r4, r1, lsl #1]
    cmp.w	r9, #0
    beq.n .Lcode_5666
    lsls	r3, r3, #16
    mov.w	r2, #1342177280
    mov	r0, r7
    qsub	r2, r3, r2
    mov	r1, r8
    asrs	r2, r2, #16
    bl .Lcode_5367
    mov	r9, r6
    b.n .Lcode_5666
.Lcode_5714:
    sub.w	r1, r2, #144
    uxth	r1, r1
    cmp	r1, #15
    bls.n .Lcode_5724
    subs	r2, #160
    uxth	r2, r2
    cmp	r2, sl
    bhi.n .Lcode_5747
    mov	r8, sl
    b.n .Lcode_5587
.Lcode_5724:
    mov.w	r8, #2
    b.n .Lcode_5587
.Lcode_5726:
    mov.w	r3, #45056
    ldr	r1, [sp, #4]
    movt	r3, #65535
    movw	r2, #28671
    add.w	sl, sl, #8
    cmp	r1, r3
    it	lt
    movlt	r1, r3
    adds	r6, #8
    cmp	fp, r3
    it	lt
    movlt	fp, r3
    cmp	r1, r2
    it	ge
    movge	r1, r2
    cmp	fp, r2
    it	lt
    movlt	r2, fp
    strh.w	r1, [r4, sl, lsl #1]
    strh.w	r2, [r4, r6, lsl #1]
    b.n .Lcode_5666
.Lcode_5747:
    strh	r6, [r4, #0]
    mov.w	r9, #4
    b.n .Lcode_5666
    .byte 0x00
    .byte 0xbf
.Lliteral_5750:
    .word .Ldata_20710
.Lliteral_5751:
    .word .Ldata_20708

.section .text.vocoder_block_9,"ax",%progbits
.balign 4
.Lcode_5752:
.global asm_read_bits_msb
.type asm_read_bits_msb, %function
.thumb_func
asm_read_bits_msb:
    mov	r3, r0
    cbz	r1, .Lcode_5761
    add.w	r1, r0, r1, lsl #1
    movs	r0, #0
.Lcode_5756:
    ldrsh.w	r2, [r3], #2
    cmp	r3, r1
    orr.w	r0, r2, r0, lsl #1
    bne.n .Lcode_5756
    bx	lr
.Lcode_5761:
    mov	r0, r1
    bx	lr

.section .text.vocoder_block_10,"ax",%progbits
.balign 4
.Lcode_5763:
.global asm_write_bits_msb
.type asm_write_bits_msb, %function
.thumb_func
asm_write_bits_msb:
    lsls	r3, r2, #1
    push	{r4, r5, r6}
    adds	r1, r1, r3
    cbz	r2, .Lcode_5777
    mov	r4, r1
    subs	r6, r1, r3
.Lcode_5769:
    and.w	r5, r0, #1
    strh.w	r5, [r4, #-2]!
    asrs	r0, r0, #1
    cmp	r4, r6
    bne.n .Lcode_5769
    rsb	r2, r2, #1
    add.w	r1, r1, r2, lsl #1
    subs	r1, #2
.Lcode_5777:
    adds	r0, r1, r3
    pop	{r4, r5, r6}
    bx	lr
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_11,"ax",%progbits
.balign 4
.Lcode_5780:
.global asm_generate_voicing_flags
.type asm_generate_voicing_flags, %function
.thumb_func
asm_generate_voicing_flags:
    ldrsh.w	r3, [r0]
    cmp	r3, #2
    push	{r4, lr}
    mov	r4, r0
    beq.n .Lcode_5815
    cmp	r3, #3
    beq.n .Lcode_5796
    cmp	r3, #1
    beq.n .Lcode_5790
.Lcode_5789:
    pop	{r4, pc}
.Lcode_5790:
    ldr	r1, [r0, #8]
    ldrsh.w	r2, [r0, #12]
    ldrsh.w	r3, [r0, #4]
    ldr.w	r0, [r0, #128]
    ldmia.w	sp!, {r4, lr}
    b.w .Lcode_15563
.Lcode_5796:
    movs	r1, #0
    movs	r2, #56
    ldr.w	r0, [r0, #128]
    bl .Lcode_2535
    ldrsh.w	r0, [r4, #2]
    bl .Lcode_5424
    cmp	r0, #0
    beq.n .Lcode_5820
    blt.n .Lcode_5789
    cmp	r0, #3
    bgt.n .Lcode_5789
    ldrh	r2, [r4, #6]
    ldr.w	r3, [r4, #128]
    lsrs	r0, r2, #8
    uxtb	r1, r2
    movs	r2, #1
    strh.w	r2, [r3, r0, lsl #1]
    strh.w	r2, [r3, r1, lsl #1]
    b.n .Lcode_5789
.Lcode_5815:
    ldr.w	r0, [r0, #128]
    movs	r1, #0
    movs	r2, #56
    ldmia.w	sp!, {r4, lr}
    b.w .Lcode_2535
.Lcode_5820:
    ldrsh.w	r2, [r4, #6]
    ldr.w	r3, [r4, #128]
    movs	r1, #1
    strh.w	r1, [r3, r2, lsl #1]
    pop	{r4, pc}
.Lcode_5825:
.global asm_copy_frame_record
.type asm_copy_frame_record, %function
.thumb_func
asm_copy_frame_record:
    stmdb	sp!, {r4, r5, r6, r7, r8}
    mov	r3, r0
    ldrh	r4, [r1, #14]
    ldrh	r0, [r1, #0]
    ldr.w	r2, [r1, #132]
    ldrh.w	r8, [r1, #2]
    ldrh.w	ip, [r1, #4]
    ldrh	r7, [r1, #6]
    ldr	r6, [r1, #8]
    ldrh	r5, [r1, #12]
    strh	r0, [r3, #0]
    strh	r4, [r3, #14]
    str.w	r2, [r3, #132]
    movs	r4, #0
    adds	r1, #16
    add.w	r0, r3, #16
    movs	r2, #56
    strh.w	r8, [r3, #2]
    strh.w	ip, [r3, #4]
    strh	r7, [r3, #6]
    str	r6, [r3, #8]
    strh	r5, [r3, #12]
    str.w	r4, [r3, #128]
    ldmia.w	sp!, {r4, r5, r6, r7, r8}
    b.w .Lcode_2496

.section .text.vocoder_block_12,"ax",%progbits
.balign 4
.Lcode_5850:
.global asm_synthesize_audio_frame
.type asm_synthesize_audio_frame, %function
.thumb_func
asm_synthesize_audio_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #828
    ldr	r4, [sp, #864]
    str	r0, [sp, #8]
    ldrh.w	r5, [r4, #1982]
    str	r1, [sp, #24]
    add.w	r4, r4, #1136
    str	r4, [sp, #12]
    ldr	r0, [sp, #12]
    str	r2, [sp, #16]
    adds	r0, #4
    ands.w	r1, r5, #1
    mov	r4, r3
    str	r0, [sp, #12]
    bne.n .Lcode_5886
    ldr	r5, [sp, #8]
    ldrsh.w	r3, [r5]
    cmp	r3, #1
    beq.w .Lcode_6257
    ldr	r5, [sp, #864]
    movs	r2, #56
    add.w	r0, r5, #374
    bl .Lcode_2535
    ldr	r5, [sp, #8]
    add.w	r6, r5, #16
.Lcode_5875:
    ldr	r5, [sp, #8]
    add.w	r7, r5, #132
    ldrsh.w	r2, [r5, #4]
    mov	r0, r6
    mov	r1, r7
    bl .Lcode_15518
    ldrsh.w	r3, [r5]
    cmp	r3, #1
    beq.w .Lcode_6278
.Lcode_5884:
    cmp	r3, #2
    beq.w .Lcode_6264
.Lcode_5886:
    ldr	r0, [sp, #8]
    add	r3, sp, #372
    str.w	r3, [r0, #128]
    bl .Lcode_5780
    ldr	r5, [sp, #864]
    ldr	r0, [sp, #12]
    add	r3, sp, #484
    str.w	r3, [r5, #1268]
    bl .Lcode_5780
    ldr	r5, [sp, #8]
    ldrsh.w	r0, [r5, #2]
    cmp	r0, #255
    beq.n .Lcode_5992
    ldr	r4, [sp, #864]
    ldrsh.w	r3, [r4, #1956]
    cmp	r3, #1
    beq.w .Lcode_6183
    bl .Lcode_5424
    ldr	r4, [sp, #8]
    uxtb	r5, r0
    ldrsh.w	r1, [r4, #2]
    movs	r2, #0
    mov	r0, r5
    bl .Lcode_5454
    mov	r4, r0
    ldr	r0, [sp, #8]
    movs	r2, #1
    ldrsh.w	r1, [r0, #2]
    mov	r0, r5
    bl .Lcode_5454
    ldr	r5, [sp, #8]
    ldrsh.w	r6, [r5, #4]
    cmp	r6, #0
    ble.n .Lcode_5935
    mov	r2, r5
    movs	r3, #0
    movw	r5, #1310
.Lcode_5923:
    cmp	r4, r3
    beq.n .Lcode_5931
    cmp	r0, r3
    beq.n .Lcode_5931
    ldrh	r1, [r2, #16]
    smulbb	r1, r1, r5
    asrs	r1, r1, #15
    strh	r1, [r2, #16]
.Lcode_5931:
    adds	r3, #1
    adds	r2, #2
    cmp	r3, r6
    blt.n .Lcode_5923
.Lcode_5935:
    ldr	r5, [sp, #8]
    ldrh	r2, [r5, #2]
    uxth	r3, r2
    sub.w	r1, r3, #128
    uxth	r1, r1
    cmp	r1, #31
    bls.w .Lcode_6236
    subs	r3, #20
    uxth	r3, r3
    cmp	r3, #2
    bls.w .Lcode_6227
.Lcode_5946:
    ldr	r5, [sp, #16]
    lsls	r2, r5, #1
    movs	r1, #0
    sxth	r2, r2
    add	r0, sp, #36
    bl .Lcode_2535
    ldr	r4, [sp, #864]
    ldr	r1, [sp, #16]
    ldr	r3, [sp, #8]
    add.w	r2, r4, #1600
    ldrsh.w	r4, [r4, #1986]
    adds	r2, #12
    add	r0, sp, #36
    str	r4, [sp, #0]
    bl .Lcode_15641
    ldr	r5, [sp, #864]
    ldr	r1, [sp, #16]
    ldrsh.w	r4, [r5, #1986]
    ldr	r5, [sp, #12]
    ldr	r3, [sp, #8]
    str	r5, [sp, #0]
    ldr	r5, [sp, #864]
    str	r4, [sp, #4]
    add.w	r2, r5, #24
    add	r0, sp, #36
    bl .Lcode_16787
    add	r0, sp, #36
    mov	r1, r0
    ldr	r2, [sp, #864]
    ldr	r3, [sp, #16]
    bl .Lcode_4566
    ldr	r4, [sp, #16]
    ldr	r0, [sp, #24]
    str	r4, [sp, #0]
    movs	r1, #15
    movs	r3, #17
    add	r2, sp, #36
    bl .Lcode_7720
    ldr	r5, [sp, #8]
    ldr	r0, [sp, #12]
    movs	r3, #0
    str.w	r3, [r5, #128]
    mov	r1, r5
    bl .Lcode_5825
    add.w	sp, sp, #828
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_5992:
    cmp	r4, #0
    beq.w .Lcode_6270
    ldr	r5, [sp, #864]
    ldrh.w	r0, [r5, #1986]
.Lcode_5996:
    sxth	r0, r0
    movw	r3, #13107
    cmp	r0, r3
    ite	lt
    movlt	r4, r0
    movge	r4, r3
    lsls	r0, r4, #16
    mov	r2, r0
    movw	r3, #65532
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r1, r2
    lsls.w	r2, r0, r1
    movt	r3, #65535
    asrs	r2, r2, #16
    subs	r3, r3, r1
    add	r5, sp, #820
    movs	r1, #1
    mov.w	r0, #1073741824
    str	r5, [sp, #0]
    bl .Lcode_6721
    ldr	r5, [sp, #8]
    mov	r7, r0
    ldrh	r0, [r5, #12]
    sxth	r2, r0
    cmp	r2, r4
    mov	sl, r2
    bge.n .Lcode_6066
    ldr	r5, [sp, #820]
    ldr	r3, [sp, #8]
    uxth	r7, r7
    subs	r5, #4
    lsls	r6, r2, #16
    add.w	r1, r3, #16
    b.n .Lcode_6047
.Lcode_6035:
    lsls	r3, r3, #1
    lsls	r0, r3
.Lcode_6037:
    ldrh.w	lr, [r1]
    lsls	r2, r2, #16
    smultb	r3, r0, lr
    qadd	r2, r6, r2
    lsrs	r0, r2, #16
    sxth	r2, r0
    sbfx	r3, r3, #15, #16
    cmp	r2, r4
    strh.w	r3, [r1], #2
    bge.n .Lcode_6066
.Lcode_6047:
    smulbb	r0, r0, r7
    lsls	r0, r0, #1
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r3
    smultt	r0, r0, r0
    lsls	r0, r0, #1
    subs	r3, r5, r3
    bpl.n .Lcode_6035
    rsb	r3, r3, r3, lsl #31
    lsls	r3, r3, #1
    asrs	r0, r3
    b.n .Lcode_6037
.Lcode_6066:
    ldr	r4, [sp, #8]
    ldrh	r4, [r4, #4]
    sxth	r5, r4
    cmp	r5, #0
    str	r4, [sp, #28]
    str	r5, [sp, #20]
    ble.n .Lcode_6086
    ldr	r4, [sp, #8]
    lsls	r5, r5, #1
    ldrh.w	r6, [r4, #132]
    add.w	r1, r4, #14
    movs	r2, #0
    add	r3, sp, #596
    add	r4, sp, #708
.Lcode_6080:
    ldrh.w	r0, [r1, #2]!
    strh	r6, [r4, r2]
    strh	r0, [r3, r2]
    adds	r2, #2
    cmp	r2, r5
    bne.n .Lcode_6080
.Lcode_6086:
    ldr	r5, [sp, #20]
    mul.w	lr, sl, r5
    ubfx	lr, lr, #3, #16
    sxth.w	ip, lr
    movw	r8, #19661
    cmp	ip, r8
    ble.n .Lcode_6137
    ldr	r4, [sp, #8]
    ldr	r0, [sp, #20]
    ldrh.w	fp, [r4, #132]
    lsls	r5, r5, #1
    add.w	fp, fp, #1
    add	r3, sp, #596
    rsb	r6, r0, r0, lsl #31
    add	r1, sp, #708
    uxth.w	fp, fp
    mov.w	sl, sl, lsl #13
    adds	r2, r1, r5
    adds	r3, r3, r5
    movw	r9, #27307
    lsls	r6, r6, #1
.Lcode_6107:
    adds	r1, r3, r6
    adds	r1, r1, r5
    smulbb	lr, lr, r9
    ldrh.w	r0, [r1, #-2]
    ubfx	lr, lr, #15, #16
    smulbb	r4, lr, r0
    lsls	r4, r4, #1
    mov	r0, r4
    rsb	lr, sl, ip, lsl #16
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    uxth	r0, r0
    sxth.w	ip, r0
    adds	r7, r2, r6
    mov.w	lr, lr, lsr #16
    lsl.w	r4, r4, ip
    adds	r7, r7, r5
    sxth.w	ip, lr
    asrs	r4, r4, #16
    rsb	r0, r0, fp
    subs	r2, #2
    subs	r3, #2
    cmp	ip, r8
    strh.w	r0, [r7, #-2]
    strh.w	r4, [r1, #-2]
    bgt.n .Lcode_6107
.Lcode_6137:
    ldr	r2, [sp, #20]
    ldrsh.w	r0, [sp, #708]
    cmp	r2, #1
    mov	r1, r0
    ble.w .Lcode_6298
    ldr	r5, [sp, #28]
    add	r2, sp, #704
    movs	r4, #2
    adds	r2, #2
    add	r3, sp, #708
    smlabb	r4, r5, r4, r2
.Lcode_6148:
    ldrsh.w	r2, [r3, #2]!
    cmp	r1, r2
    it	lt
    movlt	r1, r2
    cmp	r3, r4
    bne.n .Lcode_6148
.Lcode_6154:
    ldr	r2, [sp, #20]
    ldr	r5, [sp, #8]
    lsls	r6, r2, #1
    add.w	r4, r5, #14
    movs	r2, #0
    add	r3, sp, #596
    b.n .Lcode_6169
.Lcode_6161:
    lsls.w	r0, r5, r7
    adds	r2, #2
    asrs	r0, r0, #16
    cmp	r2, r6
    strh.w	r0, [r4, #2]!
    beq.n .Lcode_6180
.Lcode_6167:
    add	r0, sp, #708
    ldrsh	r0, [r0, r2]
.Lcode_6169:
    ldrsh	r5, [r3, r2]
    lsls	r5, r5, #16
    subs	r7, r0, r1
    bpl.n .Lcode_6161
    subs	r0, r1, r0
    asrs.w	r0, r5, r0
    adds	r2, #2
    asrs	r0, r0, #16
    cmp	r2, r6
    strh.w	r0, [r4, #2]!
    bne.n .Lcode_6167
.Lcode_6180:
    ldr	r4, [sp, #8]
    str.w	r1, [r4, #132]
    b.n .Lcode_5946
.Lcode_6183:
    bl .Lcode_5424
    cmp	r0, #0
    bne.w .Lcode_5946
    ldrsh.w	r3, [r4, #1140]
    cmp	r3, #3
    bne.w .Lcode_5946
    ldrsh.w	r0, [r4, #1142]
    bl .Lcode_5424
    cmp	r0, #0
    bne.w .Lcode_5946
    ldrsh.w	r1, [r4, #1146]
    ldrsh.w	r3, [r5, #6]
    subs	r3, r3, r1
    cmp	r3, #0
    it	lt
    neglt	r3, r3
    cmp	r3, #1
    ble.n .Lcode_6293
    ldr	r5, [sp, #8]
    ldrsh.w	r2, [r5, #2]
    adds	r3, r1, #1
.Lcode_6204:
    ldr	r4, [sp, #864]
    ldrsh.w	r1, [r4, #1142]
    add.w	r0, r1, r1, lsr #31
    asrs	r0, r0, #1
    mla	r0, r2, r3, r0
    bl .Lcode_6588
    ldr	r5, [sp, #8]
    uxth	r2, r0
    sxth	r3, r2
    ldrsh.w	r1, [r5, #2]
    lsls	r3, r3, #4
    cmp	r3, r1
    bgt.n .Lcode_6222
.Lcode_6217:
    adds	r3, #16
    adds	r2, #1
    cmp	r1, r3
    uxth	r2, r2
    bge.n .Lcode_6217
.Lcode_6222:
    subs	r2, #1
    sxth	r1, r2
.Lcode_6224:
    ldr	r0, [sp, #8]
    bl .Lcode_6459
    b.n .Lcode_5946
.Lcode_6227:
    ldr	r4, [sp, #8]
    ldrsh.w	r1, [r4, #6]
    adds	r1, #1
    lsls	r1, r1, #8
    lsls	r0, r2, #20
    sxth	r1, r1
    bl .Lcode_6534
    strh	r0, [r4, #12]
    b.n .Lcode_5946
.Lcode_6236:
    add.w	r5, r0, #8
    ldr	r0, [sp, #8]
    adds	r4, #8
    ldrh.w	r3, [r0, r5, lsl #1]
    ldrh.w	r0, [r0, r4, lsl #1]
    smulbb	r3, r3, r3
    movs	r1, #8
    movs	r2, #4
    smlabb	r0, r0, r0, r3
    bl .Lcode_6971
    ldr	r1, [sp, #8]
    ldrh	r2, [r1, #2]
    uxth	r3, r0
    strh.w	r3, [r1, r5, lsl #1]
    strh.w	r3, [r1, r4, lsl #1]
    uxth	r3, r2
    subs	r3, #20
    uxth	r3, r3
    cmp	r3, #2
    bhi.w .Lcode_5946
    b.n .Lcode_6227
.Lcode_6257:
    add.w	r6, r5, #16
    ldrsh.w	r2, [r5, #4]
    ldr	r5, [sp, #864]
    mov	r1, r6
    add.w	r0, r5, #374
    bl .Lcode_17392
    b.n .Lcode_5875
.Lcode_6264:
    ldr	r5, [sp, #864]
    ldr	r1, [sp, #8]
    add.w	r0, r5, #1264
    adds	r0, #12
    bl .Lcode_5825
    b.n .Lcode_5886
.Lcode_6270:
    ldr	r4, [sp, #864]
    ldr	r5, [sp, #8]
    ldrsh.w	r0, [r4, #1986]
    ldrsh.w	r1, [r5, #12]
    ldr	r2, [r5, #8]
    bl .Lcode_15613
    strh.w	r0, [r4, #1986]
    b.n .Lcode_5996
.Lcode_6278:
    ldr	r5, [sp, #864]
    add.w	r3, r5, #1984
    ldr	r5, [sp, #8]
    ldrsh.w	r1, [r5, #12]
    ldrsh.w	r5, [r5, #4]
    str	r1, [sp, #0]
    adds	r2, r3, #4
    mov	r0, r6
    adds	r3, #6
    mov	r1, r7
    str	r5, [sp, #4]
    bl .Lcode_17475
    ldr	r5, [sp, #8]
    ldrsh.w	r3, [r5]
    b.n .Lcode_5884
.Lcode_6293:
    ldrsh.w	r2, [r5, #2]
    adds	r3, r1, #1
    cmp.w	r2, r3, lsl #4
    bge.n .Lcode_6204
    b.n .Lcode_6224
.Lcode_6298:
    ldr	r3, [sp, #20]
    cmp	r3, #0
    ble.w .Lcode_6180
    b.n .Lcode_6154
    .byte 0x00
    .byte 0xbf
.Lcode_6302:
.global asm_decode_frame_record
.type asm_decode_frame_record, %function
.thumb_func
asm_decode_frame_record:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #60
    mov	r9, r1
    ldr	r4, [sp, #104]
    ldr	r5, [sp, #96]
    ldrsh.w	r6, [r4, #1610]
    ldrsh.w	r7, [r4, #1982]
    ldr.w	fp, [sp, #100]
    orr.w	r8, r2, r6
    lsls	r7, r7, #1
    tst.w	r8, #12
    strh.w	r7, [r4, #1982]
    mov	sl, r3
    beq.n .Lcode_6380
    movs	r7, #0
    add.w	r6, r4, #1408
    mov	r9, r7
    adds	r6, #4
.Lcode_6320:
    ldrh	r3, [r5, #2]
    add	r0, sp, #56
    movs	r2, #0
    add.w	r1, r4, #1992
    strh.w	r3, [r0, #-2]!
    bl .Lcode_5480
    ands.w	sl, r8, #16384
    beq.n .Lcode_6349
    ldrh.w	r1, [r4, #1952]
    ldrh.w	r2, [r4, #1954]
    strh.w	r1, [sp, #54]
.Lcode_6331:
    sxth	r2, r2
    sxth	r1, r1
    mov	r3, r2
    movs	r7, #0
    mov	r0, r5
    str	r7, [sp, #0]
    bl .Lcode_5559
    mov	r0, fp
    mov	r1, r5
    bl .Lcode_5825
    movw	r7, #32770
.Lcode_6342:
    movs	r3, #0
    strh.w	r3, [r4, #1984]
    mov	r0, r6
    bl .Lcode_14108
.Lcode_6346:
    mov	r0, r7
    add	sp, #60
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_6349:
    cmp	r0, #0
    bne.n .Lcode_6416
    tst.w	r8, #8
    bne.n .Lcode_6366
    tst.w	r8, #4
    beq.n .Lcode_6364
.Lcode_6355:
    ldrh.w	r3, [r4, #1982]
    and.w	r3, r3, #14
    cmp	r3, #14
    beq.n .Lcode_6366
    add.w	r1, r4, #1136
    adds	r1, #4
    mov	r0, r5
    bl .Lcode_5825
    b.n .Lcode_6370
.Lcode_6364:
    cmp.w	r9, #0
    beq.n .Lcode_6437
.Lcode_6366:
    add.w	r1, r4, #1264
    adds	r1, #12
    mov	r0, r5
    bl .Lcode_5825
.Lcode_6370:
    mov	r0, fp
    mov	r1, r5
    bl .Lcode_5825
    ldrh.w	r3, [r4, #1982]
    orr.w	r3, r3, #1
    strh.w	r3, [r4, #1982]
    mov	r0, r6
    bl .Lcode_14108
    movs	r7, #32
    b.n .Lcode_6346
.Lcode_6380:
    ldrsh.w	r7, [r4, #1988]
    str	r7, [sp, #44]
    ldrsh.w	r7, [r4, #1990]
    str	r0, [sp, #4]
    str	r7, [sp, #28]
    add.w	r7, r4, #1952
    adds	r7, #4
    add.w	r6, r4, #1408
    movs	r1, #68
    str	r7, [sp, #20]
    ldr	r7, [sp, #44]
    str.w	r9, [sp, #8]
    adds	r6, #4
    add.w	ip, r4, #1560
    and.w	lr, r8, #128
    mov	r0, r5
    mov	r2, fp
    mov	r3, r1
    str	r6, [sp, #0]
    str.w	sl, [sp, #12]
    str.w	ip, [sp, #16]
    str	r7, [sp, #24]
    str.w	lr, [sp, #32]
    bl .Lcode_5212
    cbz	r0, .Lcode_6413
    and.w	r9, r0, #8
    cmp.w	r9, #0
    ite	ne
    movne	r7, #0
    moveq	r7, #1
    it	ne
    movne.w	r9, #1
    b.n .Lcode_6320
.Lcode_6413:
    mov	r7, r0
    mov	r9, r0
    b.n .Lcode_6320
.Lcode_6416:
    ldrsh.w	r0, [sp, #54]
    bl .Lcode_5424
    ldrsh.w	r1, [sp, #54]
    mov	r2, sl
    uxtb	r0, r0
    bl .Lcode_5454
    ldrsh.w	r2, [sp, #54]
    add.w	r3, r0, #8
    mov	r0, r2
    ldrsh.w	r7, [r5, r3, lsl #1]
    bl .Lcode_5424
    ldrsh.w	r1, [sp, #54]
    movs	r2, #1
    uxtb	r0, r0
    bl .Lcode_5454
    adds	r0, #8
    ldrh.w	r1, [sp, #54]
    ldrsh.w	r2, [r5, r0, lsl #1]
    adds	r7, r7, r2
    ubfx	r2, r7, #1, #16
    b.n .Lcode_6331
.Lcode_6437:
    cmp	r7, #0
    bne.n .Lcode_6355
    ldrsh.w	r3, [r5]
    cmp	r3, #2
    beq.w .Lcode_6342
    cmp	r3, #3
    beq.n .Lcode_6455
    cmp	r3, #1
    bne.w .Lcode_6355
    ldrsh.w	r3, [r4, #1956]
    cbnz	r3, .Lcode_6457
    ldrsh.w	r7, [r5, #2]
    movw	r3, #32770
    cmp	r7, #255
    ite	ne
    movne	r7, r3
    moveq	r7, #2
    b.n .Lcode_6342
.Lcode_6455:
    movw	r7, #32770
    b.n .Lcode_6342
.Lcode_6457:
    movs	r7, #2
    b.n .Lcode_6342

.section .text.vocoder_block_13,"ax",%progbits
.balign 4
.Lcode_6459:
.global asm_move_active_harmonic
.type asm_move_active_harmonic, %function
.thumb_func
asm_move_active_harmonic:
    push	{r4, r5, r6, r7, lr}
    mov	r4, r0
    ldrsh.w	r0, [r0, #6]
    ldr.w	r3, [r4, #128]
    add.w	r6, r0, #8
    uxth	r1, r1
    sxth	r2, r1
    ldrh.w	lr, [r4, r6, lsl #1]
    movs	r5, #0
    add.w	r7, r2, #8
    strh.w	r5, [r4, r6, lsl #1]
    strh.w	r5, [r3, r0, lsl #1]
    strh	r1, [r4, #6]
    movs	r1, #1
    strh.w	lr, [r4, r7, lsl #1]
    strh.w	r1, [r3, r2, lsl #1]
    ldrsh.w	r2, [r4, #6]
    ldrsh.w	r0, [r4, #2]
    adds	r2, r2, r1
    lsls	r2, r2, #16
    lsls	r0, r0, #16
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    sub	sp, #20
    lsls	r2, r3
    mov	r1, r0
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r0, r1
    asrs	r2, r2, #16
    rsb	r3, r3, #23
    rsb	r1, r1, #15
    add	r5, sp, #12
    str	r5, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #12]
    lsls	r0, r0, #16
    adds	r2, r3, #4
    blt.n .Lcode_6529
    adds	r3, #4
    lsls	r0, r3
.Lcode_6511:
    ldrh	r2, [r4, #6]
    ldrsh.w	r3, [r4, #4]
    sxth	r1, r2
    asrs	r0, r0, #16
    cmp	r3, r1
    strh	r0, [r4, #12]
    bgt.n .Lcode_6520
    adds	r3, r2, #1
    sxth	r3, r3
.Lcode_6520:
    cmp	r3, #9
    it	lt
    movlt	r3, #9
    cmp	r3, #56
    it	ge
    movge	r3, #56
    strh	r3, [r4, #4]
    add	sp, #20
    pop	{r4, r5, r6, r7, pc}
.Lcode_6529:
    movw	r2, #65532
    movt	r2, #65535
    subs	r2, r2, r3
    asrs	r0, r2
    b.n .Lcode_6511

.section .text.vocoder_block_14,"ax",%progbits
.balign 4
.Lcode_6534:
.global asm_fixed_divide_half
.type asm_fixed_divide_half, %function
.thumb_func
asm_fixed_divide_half:
    eor.w	r3, r1, r0
    cmp	r0, #0
    bge.n .Lcode_6541
    cmp.w	r0, #2147483648
    ite	ne
    negne	r0, r0
    mvneq.w	r0, #2147483648
.Lcode_6541:
    cmp	r1, #0
    bge.n .Lcode_6549
    cmn.w	r1, #32768
    beq.n .Lcode_6548
    negs	r1, r1
    sxth	r1, r1
    b.n .Lcode_6549
.Lcode_6548:
    movw	r1, #32767
.Lcode_6549:
    cmp	r0, r1
    blt.n .Lcode_6554
    sdiv	r0, r0, r1
    asrs	r0, r0, #1
    b.n .Lcode_6555
.Lcode_6554:
    movs	r0, #0
.Lcode_6555:
    cmp	r3, #0
    it	lt
    neglt	r0, r0
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_6559:
.global asm_divide_i32_i16_q14
.type asm_divide_i32_i16_q14, %function
.thumb_func
asm_divide_i32_i16_q14:
    eor.w	r3, r1, r0
    cmp	r0, #0
    bge.n .Lcode_6566
    cmp.w	r0, #2147483648
    ite	ne
    negne	r0, r0
    mvneq.w	r0, #2147483648
.Lcode_6566:
    cmp	r1, #0
    bge.n .Lcode_6574
    cmn.w	r1, #32768
    beq.n .Lcode_6573
    negs	r1, r1
    sxth	r1, r1
    b.n .Lcode_6574
.Lcode_6573:
    movw	r1, #32767
.Lcode_6574:
    cmp	r0, r1
    blt.n .Lcode_6581
    cmp.w	r1, r0, asr #16
    ble.n .Lcode_6583
    sdiv	r0, r0, r1
    asrs	r0, r0, #1
    b.n .Lcode_6584
.Lcode_6581:
    movs	r0, #0
    b.n .Lcode_6584
.Lcode_6583:
    movw	r0, #32767
.Lcode_6584:
    cmp	r3, #0
    it	lt
    neglt	r0, r0
    bx	lr
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_15,"ax",%progbits
.balign 4
.Lcode_6588:
.global asm_fixed_divide
.type asm_fixed_divide, %function
.thumb_func
asm_fixed_divide:
    eor.w	r3, r1, r0
    cmp	r0, #0
    bge.n .Lcode_6595
    cmp.w	r0, #2147483648
    ite	ne
    negne	r0, r0
    mvneq.w	r0, #2147483648
.Lcode_6595:
    cmp	r1, #0
    bge.n .Lcode_6603
    cmn.w	r1, #32768
    beq.n .Lcode_6602
    negs	r1, r1
    sxth	r1, r1
    b.n .Lcode_6603
.Lcode_6602:
    movw	r1, #32767
.Lcode_6603:
    cmp	r0, r1
    ite	ge
    sdivge	r0, r0, r1
    movlt	r0, #0
    cmp	r3, #0
    it	lt
    neglt	r0, r0
    bx	lr
    .byte 0x00
    .byte 0xbf
    .word 0x8000f3af
.Lcode_6611:
.global asm_normalized_add
.type asm_normalized_add, %function
.thumb_func
asm_normalized_add:
    push	{r4, r5, r6}
    ldr	r4, [sp, #12]
    cbz	r0, .Lcode_6617
    subs	r5, r3, r1
    cmp	r5, #31
    ble.n .Lcode_6624
.Lcode_6617:
    cmp	r2, #0
    it	eq
    moveq	r3, #0
    str	r3, [r4, #0]
.Lcode_6621:
    mov	r0, r2
    pop	{r4, r5, r6}
    bx	lr
.Lcode_6624:
    cmp	r2, #0
    beq.n .Lcode_6661
    subs	r5, r1, r3
    cmp	r5, #31
    bgt.n .Lcode_6661
    adds	r5, r1, #1
    cmp	r3, r1
    it	ge
    addge	r5, r3, #1
    lsls	r0, r0, #16
    subs	r6, r1, r5
    itet	mi
    rsbmi	r1, r1, r5
    lslpl	r0, r6
    asrmi	r0, r1
    lsls	r2, r2, #16
    subs.w	ip, r3, r5
    itet	mi
    rsbmi	r3, r3, r5
    lslpl.w	r2, r2, ip
    asrmi	r2, r3
    adds	r1, r0, r2
    mov	r6, r1
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    sxth	r6, r6
    lsl.w	r2, r1, r6
    lsrs	r2, r2, #16
    ite	ne
    rsbne	r6, r6, r5
    moveq	r6, r2
    str	r6, [r4, #0]
    b.n .Lcode_6621
.Lcode_6661:
    str	r1, [r4, #0]
    mov	r2, r0
    b.n .Lcode_6621

.section .text.vocoder_block_16,"ax",%progbits
.balign 4
.Lcode_6664:
.global asm_normalized_subtract
.type asm_normalized_subtract, %function
.thumb_func
asm_normalized_subtract:
    push	{r4, r5, r6}
    ldr	r4, [sp, #12]
    cbz	r0, .Lcode_6670
    subs	r5, r3, r1
    cmp	r5, #31
    ble.n .Lcode_6677
.Lcode_6670:
    cmp	r2, #0
    it	eq
    moveq	r3, #0
    str	r3, [r4, #0]
.Lcode_6674:
    mov	r0, r2
    pop	{r4, r5, r6}
    bx	lr
.Lcode_6677:
    cmp	r2, #0
    beq.n .Lcode_6714
    subs	r5, r1, r3
    cmp	r5, #31
    bgt.n .Lcode_6714
    adds	r5, r1, #1
    cmp	r3, r1
    it	ge
    addge	r5, r3, #1
    lsls	r0, r0, #16
    subs	r6, r1, r5
    itet	mi
    rsbmi	r1, r1, r5
    lslpl	r0, r6
    asrmi	r0, r1
    lsls	r2, r2, #16
    subs	r1, r3, r5
    itet	mi
    rsbmi	r3, r3, r5
    lslpl	r2, r1
    asrmi	r2, r3
    rsb	ip, r0, r2
    mov	r2, ip
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r3, r2
    lsl.w	r1, ip, r3
    lsrs	r2, r1, #16
    ite	ne
    rsbne	r3, r3, r5
    moveq	r3, r2
    str	r3, [r4, #0]
    b.n .Lcode_6674
.Lcode_6714:
    negs	r2, r0
    cmn.w	r0, #32768
    sxth	r2, r2
    str	r1, [r4, #0]
    it	eq
    movweq	r2, #32767
    b.n .Lcode_6674
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_17,"ax",%progbits
.balign 4
.Lcode_6721:
.global asm_normalized_divide
.type asm_normalized_divide, %function
.thumb_func
asm_normalized_divide:
    cmp	r0, #0
    push	{r4, lr}
    eor.w	r4, r2, r0
    bge.n .Lcode_6729
    cmp.w	r0, #2147483648
    ite	eq
    mvneq.w	r0, #2147483648
    negne	r0, r0
.Lcode_6729:
    cmp	r2, #0
    bge.n .Lcode_6737
    cmn.w	r2, #32768
    beq.n .Lcode_6736
    negs	r2, r2
    sxth	r2, r2
    b.n .Lcode_6737
.Lcode_6736:
    movw	r2, #32767
.Lcode_6737:
    cmp.w	r0, r2, lsl #16
    blt.n .Lcode_6741
    asrs	r0, r0, #1
    adds	r1, #1
.Lcode_6741:
    sdiv	r2, r0, r2
    asrs	r0, r2, #1
    cmp	r4, #0
    uxth	r2, r0
    bge.n .Lcode_6748
    negs	r4, r2
    uxth	r2, r4
.Lcode_6748:
    lsls	r2, r2, #16
    mov	r4, r2
    cmp	r4, #0
    it	lt
    mvnlt	r4, r4
    itt	ne
    clzne	r4, r4
    subne	r4, #1
    sxth	r4, r4
    lsl.w	r0, r2, r4
    lsrs.w ip, r0, #16
    it	ne
    rsbne	r1, r3, r1
    ldr	r3, [sp, #8]
    ite	ne
    rsbne	r1, r4, r1
    moveq	r1, ip
    str	r1, [r3, #0]
    sxth.w	r0, ip
    pop	{r4, pc}

.section .text.vocoder_block_18,"ax",%progbits
.balign 4
.Lcode_6768:
.global asm_compare_scaled
.type asm_compare_scaled, %function
.thumb_func
asm_compare_scaled:
    subs	r3, r3, r1
    lsls	r0, r0, #16
    lsls	r2, r2, #16
    cmp	r3, #0
    mvn.w	r1, #31
    bgt.n .Lcode_6780
    cmp	r3, r1
    it	lt
    movlt	r3, r1
    negs	r3, r3
    asrs	r2, r3
    b.n .Lcode_6786
.Lcode_6780:
    negs	r3, r3
    cmp	r3, r1
    it	ge
    movge	r1, r3
    negs	r1, r1
    asrs	r0, r1
.Lcode_6786:
    cmp	r0, r2
    ite	le
    movle	r0, #0
    movgt	r0, #1
    bx	lr

.section .text.vocoder_block_19,"ax",%progbits
.balign 4
.Lcode_6791:
.global asm_compare_scaled_less
.type asm_compare_scaled_less, %function
.thumb_func
asm_compare_scaled_less:
    subs	r3, r3, r1
    lsls	r0, r0, #16
    lsls	r2, r2, #16
    cmp	r3, #0
    mvn.w	r1, #31
    bgt.n .Lcode_6803
    cmp	r3, r1
    it	lt
    movlt	r3, r1
    negs	r3, r3
    asrs	r2, r3
    b.n .Lcode_6809
.Lcode_6803:
    negs	r3, r3
    cmp	r3, r1
    it	ge
    movge	r1, r3
    negs	r1, r1
    asrs	r0, r1
.Lcode_6809:
    cmp	r0, r2
    ite	ge
    movge	r0, #0
    movlt	r0, #1
    bx	lr

.section .text.vocoder_block_20,"ax",%progbits
.balign 4
.Lcode_6814:
.global asm_log2_q15
.type asm_log2_q15, %function
.thumb_func
asm_log2_q15:
    lsls	r0, r0, #16
    push	{r4, r5, r6}
    mov	r3, r0
    mov.w	ip, #32768
    cmp	r3, #0
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r4, r3
    lsls.w	r2, r0, r4
    ldr	r3, .Lliteral_6853
    ldrsh.w	r6, [r3]
    ldrh	r5, [r3, #2]
    sub.w	r2, r2, r6, lsl #16
    smulbt	r0, r5, r2
    ldrsh.w	r5, [r3, #4]
    add.w	r0, ip, r0, lsl #1
    add.w	r0, r5, r0, lsr #16
    smulbt	r0, r0, r2
    ldrsh.w	r5, [r3, #6]
    add.w	r0, ip, r0, lsl #1
    add.w	r0, r5, r0, lsr #16
    smulbt	r0, r0, r2
    ldrsh.w	r5, [r3, #8]
    add.w	r0, ip, r0, lsl #1
    bfc	r0, #0, #16
    lsls	r5, r5, #16
    add.w	r0, r5, r0, asr #1
    smultt	r2, r0, r2
    ldrsh.w	r0, [r3, #10]
    add.w	r2, ip, r2, lsl #1
    lsrs	r2, r2, #16
    lsls	r0, r0, #16
    subs	r4, r1, r4
    add.w	r0, r0, r2, lsl #18
    lsls	r4, r4, #16
    add.w	r0, r4, r0, asr #15
    pop	{r4, r5, r6}
    bx	lr
.Lliteral_6853:
    .word .Ldata_19918
.Lcode_6854:
.global asm_log2_scaled
.type asm_log2_scaled, %function
.thumb_func
asm_log2_scaled:
    push	{r4, lr}
    mov	r4, r2
    bl .Lcode_6814
    rsbs	r3, r4, #15
    it	pl
    lslpl	r0, r3
    bpl.n .Lcode_6863
    subs	r4, #15
    asr.w	r0, r0, r4
.Lcode_6863:
    add.w	r0, r0, #32768
    asrs	r0, r0, #16
    pop	{r4, pc}

.section .text.vocoder_block_21,"ax",%progbits
.balign 4
.Lcode_6866:
.global asm_exp2_q16
.type asm_exp2_q16, %function
.thumb_func
asm_exp2_q16:
    uxth	r3, r0
    push	{r4, r5, lr}
    asrs	r4, r0, #16
    lsrs	r0, r3, #1
    ldr	r3, .Lliteral_6910
    ldrsh.w	ip, [r3]
    smulbb	r5, ip, r0
    lsls	r2, r5, #1
    add.w	r5, r2, #32768
    asrs	r2, r5, #16
    ldrsh.w	r5, [r3, #2]
    lsls	r5, r5, #16
    add.w	r5, r5, r2, lsl #13
    smultb	r5, r5, r0
    lsls	r2, r5, #1
    add.w	r5, r2, #32768
    asrs	r2, r5, #16
    ldrsh.w	r5, [r3, #4]
    lsls	r5, r5, #15
    add.w	r5, r5, r2, lsl #13
    smultb	r5, r5, r0
    lsls	r2, r5, #1
    add.w	r5, r2, #32768
    asrs	r2, r5, #16
    ldrsh.w	r5, [r3, #6]
    lsls	r5, r5, #15
    add.w	r5, r5, r2, lsl #14
    smultb	r5, r5, r0
    lsls	r2, r5, #1
    add.w	r5, r2, #32768
    asrs	r2, r5, #16
    ldrsh.w	r5, [r3, #8]
    lsls	r5, r5, #16
    add.w	r2, r5, r2, lsl #15
    smultb	r0, r2, r0
    lsls	r2, r0, #1
    add.w	r0, r2, #32768
    asrs	r2, r0, #16
    ldrsh.w	r0, [r3, #10]
    lsls	r0, r0, #16
    adds	r3, r4, #1
    str	r3, [r1, #0]
    add.w	r0, r0, r2, lsl #15
    pop	{r4, r5, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_6910:
    .word .Ldata_19912

.section .text.vocoder_block_22,"ax",%progbits
.balign 4
.Lcode_6911:
.global asm_exp2_scaled
.type asm_exp2_scaled, %function
.thumb_func
asm_exp2_scaled:
    push	{r0, r1, r4, lr}
    lsls	r0, r0, #16
    cmp	r1, #14
    mov	r4, r2
    ble.n .Lcode_6919
    subs	r1, #15
    lsl.w	r0, r0, r1
    b.n .Lcode_6921
.Lcode_6919:
    rsb	r1, r1, #15
    asr.w	r0, r0, r1
.Lcode_6921:
    add	r1, sp, #4
    bl .Lcode_6866
    ldr	r3, [sp, #4]
    subs	r2, r3, r4
    itet	mi
    rsbmi	r4, r3, r4
    lslpl	r0, r2
    asrmi	r0, r4
    add.w	r0, r0, #32768
    asrs	r0, r0, #16
    pop	{r2, r3, r4, pc}
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_23,"ax",%progbits
.balign 4
.Lcode_6932:
.global asm_normalized_sqrt
.type asm_normalized_sqrt, %function
.thumb_func
asm_normalized_sqrt:
    push	{r4, r5, lr}
    mov	ip, r0
    cmp.w	ip, #0
    beq.n .Lcode_6969
    it	lt
    mvnlt.w	ip, ip
    itt	ne
    clzne	ip, ip
    subne.w	ip, ip, #1
    sxth.w	r5, ip
    lsl.w	r3, r0, r5
    lsrs	r0, r3, #16
    ldr	r2, [r1, #0]
    ldr	r3, .Lliteral_6970
    subs	r2, r2, r5
    ldrsh.w	r4, [r3, #2]
    ldrh	r5, [r3, #0]
    lsls	r4, r4, #16
    smulbb	ip, r5, r0
    add.w	r5, r4, ip, lsl #1
    ldrsh.w	r4, [r3, #4]
    add.w	r5, r5, #32768
    lsls	r4, r4, #16
    smultb	r0, r5, r0
    add.w	ip, r4, r0, lsl #1
    add.w	r0, ip, #32768
    bfc	r0, #0, #16
    tst.w	r2, #1
    beq.n .Lcode_6964
    ldrsh.w	r3, [r3, #6]
    smultb	r0, r0, r3
    lsls	r0, r0, #1
.Lcode_6964:
    add.w	r0, r0, #32768
    bfc	r0, #0, #16
    adds	r3, r2, #1
    asrs	r2, r3, #1
    str	r2, [r1, #0]
.Lcode_6969:
    pop	{r4, r5, pc}
.Lliteral_6970:
    .word .Ldata_19908

.section .text.vocoder_block_24,"ax",%progbits
.balign 4
.Lcode_6971:
.global asm_sqrt_scaled
.type asm_sqrt_scaled, %function
.thumb_func
asm_sqrt_scaled:
    push	{r4, lr}
    sub	sp, #8
    add.w	ip, sp, #8
    mov	r4, r2
    str.w	r1, [ip, #-4]!
    mov	r1, ip
    bl .Lcode_6932
    ldr	r3, [sp, #4]
    subs	r2, r3, r4
    itet	mi
    rsbmi	r4, r3, r4
    lslpl	r0, r2
    asrmi	r0, r4
    add.w	r0, r0, #32768
    asrs	r0, r0, #16
    add	sp, #8
    pop	{r4, pc}

.section .text.vocoder_block_25,"ax",%progbits
.balign 4
.Lcode_6988:
.global asm_complex_peak_normalization_shift
.type asm_complex_peak_normalization_shift, %function
.thumb_func
asm_complex_peak_normalization_shift:
    push	{r4, lr}
    mov.w	r3, #16777216
    nop
.Lcode_6991:
    ldr.w	r4, [r0], #4
    smuad	r2, r4, r4
    cmp	r3, r2
    it	lt
    movlt	r3, r2
    subs	r1, #1
    bne.n .Lcode_6991
    mov	r0, r3
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    subs	r0, #1
    pop	{r4, pc}
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_26,"ax",%progbits
.balign 4
.Lcode_7007:
.global asm_apply_complex_swap_table
.type asm_apply_complex_swap_table, %function
.thumb_func
asm_apply_complex_swap_table:
    cmp	r1, #32
    stmdb	sp!, {r6, r7, r8, r9, lr}
    beq.n .Lcode_7019
    bgt.n .Lcode_7015
    cmp	r1, #8
    beq.n .Lcode_7020
    cmp	r1, #16
    b.n .Lcode_7016
.Lcode_7015:
    cmp	r1, #64
.Lcode_7016:
    beq.n .Lcode_7020
    ldr	r3, .Lliteral_7034
    b.n .Lcode_7020
.Lcode_7019:
    ldr	r3, .Lliteral_7035
.Lcode_7020:
    ldrsh.w	ip, [r3], #2
    mov	r2, r0
    nop
.Lcode_7023:
    ldrsh.w	r7, [r3], #2
    ldrsh.w	r6, [r3], #2
    add.w	r2, r2, r7, lsl #1
    add.w	r0, r0, r6, lsl #1
    subs.w	ip, ip, #1
    ldr.w	r8, [r2]
    ldr.w	r9, [r0]
    str.w	r9, [r2], #2
    str.w	r8, [r0], #2
    bne.n .Lcode_7023
    ldmia.w	sp!, {r6, r7, r8, r9, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_7034:
    .word .Ldata_20698
.Lliteral_7035:
    .word .Ldata_20703

.section .text.vocoder_block_27,"ax",%progbits
.balign 4
.Lcode_7036:
.global asm_pairwise_complex_butterflies
.type asm_pairwise_complex_butterflies, %function
.thumb_func
asm_pairwise_complex_butterflies:
    add.w	r2, r2, #1
    cmn.w	r2, #1
    stmdb	sp!, {r4, r5, r6, r7}
    add.w	r3, r0, #4
    beq.n .Lcode_7055
    cmp	r2, #1
    beq.n .Lcode_7066
    nop
.Lcode_7044:
    ldr	r5, [r0, #0]
    ldr	r4, [r3, #0]
    shadd16	r7, r4, r5
    shsub16	r2, r5, r4
    str.w	r7, [r0], #8
    str.w	r2, [r3], #8
    subs	r1, #2
    bne.n .Lcode_7044
.Lcode_7052:
    pop	{r4, r5, r6, r7}
    mov.w	ip, #0
    bx	lr
.Lcode_7055:
    ldr	r5, [r0, #0]
    ldr	r4, [r3, #0]
    shadd16	r7, r4, r5
    shsub16	r2, r5, r4
    shadd16	r7, r7, ip
    shadd16	r2, r2, ip
    str.w	r7, [r0], #8
    str.w	r2, [r3], #8
    subs	r1, #2
    bne.n .Lcode_7055
    b.n .Lcode_7052
    .byte 0x00
    .byte 0xbf
.Lcode_7066:
    ldr	r5, [r0, #0]
    ldr	r4, [r3, #0]
    qadd16	r7, r4, r5
    qsub16	r2, r5, r4
    str.w	r7, [r0], #8
    str.w	r2, [r3], #8
    subs	r1, #2
    bne.n .Lcode_7066
    b.n .Lcode_7052
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_28,"ax",%progbits
.balign 4
.Lcode_7075:
.global asm_radix4_matrix_stage
.type asm_radix4_matrix_stage, %function
.thumb_func
asm_radix4_matrix_stage:
    stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r4, r0
    ldr	r0, [sp, #48]
    mov	r5, r1
    cmn.w	r0, #1
    ldr	r6, [sp, #44]
    ldr	r7, [sp, #4]
    mov.w	r7, r7, lsl #2
    str	r7, [sp, #48]
    mov	r0, r4
    mov	r8, r5
    mov.w	r2, r2, lsl #3
    str	r2, [sp, #0]
    beq.n .Lcode_7134
.Lcode_7089:
    ldr.w	r2, [sp]
    ldr.w	sl, [sp, #4]
    ldr.w	fp, .Lliteral_7175
.Lcode_7092:
    ldr.w	lr, [r8]
    ldrd	r4, r5, [fp]
    add.w	fp, fp, r2
    ldrsh.w	r7, [r0]
    smusd	r3, lr, r4
    ldrsh.w	r1, [r0, #2]
    smuadx	r9, lr, r4
    ldr.w	lr, [r8, #4]
    add.w	r4, r3, r7, lsl #15
    add.w	ip, r9, r1, lsl #15
    mov.w	r4, r4, asr #15
    pkhbt	ip, r4, ip, lsl #1
    str.w	ip, [r0], #4
    rsb	r4, r3, r7, lsl #15
    rsb	ip, r9, r1, lsl #15
    ldrsh.w	r7, [r0]
    mov.w	r4, r4, asr #15
    pkhbt	ip, r4, ip, lsl #1
    ldrd	r4, r5, [fp]
    add.w	fp, fp, r2
    smusd	r3, lr, r4
    ldrsh.w	r1, [r0, #2]
    smuadx	r9, lr, r4
    add.w	r4, r3, r7, lsl #15
    str.w	ip, [r8], #8
    add.w	ip, r9, r1, lsl #15
    mov.w	r4, r4, asr #15
    pkhbt	ip, r4, ip, lsl #1
    str.w	ip, [r0], #4
    rsb	r4, r3, r7, lsl #15
    rsb	ip, r9, r1, lsl #15
    mov.w	r4, r4, asr #15
    pkhbt	ip, r4, ip, lsl #1
    subs.w	sl, sl, #2
    str.w	ip, [r8, #-4]
    bne.n .Lcode_7092
    ldr	r7, [sp, #48]
    subs	r6, #1
    add	r0, r7
    add	r8, r7
    bne.n .Lcode_7089
    ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_7134:
    ldr.w	r2, [sp]
    ldr.w	sl, [sp, #4]
    ldr.w	fp, .Lliteral_7175
.Lcode_7137:
    ldr.w	lr, [r8]
    ldrd	r4, r5, [fp]
    add.w	fp, fp, r2
    ldrsh.w	r7, [r0]
    smusd	r3, lr, r4
    ldrsh.w	r1, [r0, #2]
    smuadx	r9, lr, r4
    ldr.w	lr, [r8, #4]
    add.w	r4, r3, r7, lsl #15
    add.w	ip, r9, r1, lsl #15
    pkhtb	ip, ip, r4, asr #16
    str.w	ip, [r0], #4
    rsb	r4, r3, r7, lsl #15
    rsb	ip, r9, r1, lsl #15
    ldrsh.w	r7, [r0]
    pkhtb	ip, ip, r4, asr #16
    ldrd	r4, r5, [fp]
    add.w	fp, fp, r2
    smusd	r3, lr, r4
    ldrsh.w	r1, [r0, #2]
    smuadx	r9, lr, r4
    add.w	r4, r3, r7, lsl #15
    str.w	ip, [r8], #8
    add.w	ip, r9, r1, lsl #15
    pkhtb	ip, ip, r4, asr #16
    str.w	ip, [r0], #4
    rsb	r4, r3, r7, lsl #15
    rsb	ip, r9, r1, lsl #15
    pkhtb	ip, ip, r4, asr #16
    subs.w	sl, sl, #2
    str.w	ip, [r8, #-4]
    bne.n .Lcode_7137
    ldr	r7, [sp, #48]
    subs	r6, #1
    add	r0, r7
    add	r8, r7
    bne.n .Lcode_7134
    ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lliteral_7175:
    .word .Ldata_19900

.section .text.vocoder_block_29,"ax",%progbits
.balign 4
.Lcode_7176:
.global asm_complex_fft_32
.type asm_complex_fft_32, %function
.thumb_func
asm_complex_fft_32:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs	r5, #1
    sub	sp, #28
    lsls	r5, r2
    str	r1, [sp, #16]
    mov	r1, r5
    mov	r4, r0
    str	r2, [sp, #12]
    bl .Lcode_6988
    adds	r3, r0, #1
    cmp	r3, #6
    itt	ls
    ldrls	r2, .Lliteral_7238
    ldrsbls	r7, [r2, r3]
    mov	r1, r5
    it	hi
    movhi	r7, #0
    mov	r6, r0
    mov	r0, r4
    bl .Lcode_7007
    mov	r1, r5
    mov	r0, r4
    mov	r2, r7
    bl .Lcode_7036
    mov.w	sl, r5, asr #2
    str	r5, [sp, #20]
    subs	r6, #2
    mov.w	fp, #128
    mov.w	r8, #2
    mov.w	r9, #1
    mov	r5, r4
    b.n .Lcode_7231
.Lcode_7208:
    tst.w	r9, #1
    bne.n .Lcode_7214
    mov	r0, r5
    ldr	r1, [sp, #20]
    bl .Lcode_6988
    mov	r6, r0
.Lcode_7214:
    cmp	r6, #1
    ite	le
    movle.w	r4, #4294967295
    movgt	r4, #0
    add.w	r1, r5, r8, lsl #2
    mov	r2, fp
    mov	r3, r8
    mov	r0, r5
    str.w	sl, [sp]
    str	r4, [sp, #4]
    bl .Lcode_7075
    mov.w	fp, fp, asr #1
    mov.w	sl, sl, asr #1
    mov.w	r8, r8, lsl #1
    adds	r7, r7, r4
    subs	r6, #2
    add.w	r9, r9, #1
.Lcode_7231:
    ldr	r3, [sp, #12]
    cmp	r9, r3
    blt.n .Lcode_7208
    ldr	r3, [sp, #16]
    subs	r0, r3, r7
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_7238:
    .word .Ldata_20781

.section .text.vocoder_block_30,"ax",%progbits
.balign 4
.Lcode_7239:
.global asm_complex_butterfly_forward
.type asm_complex_butterfly_forward, %function
.thumb_func
asm_complex_butterfly_forward:
    stmdb	sp!, {r4, r5, r6, r7}
.Lcode_7240:
    ldrsh.w	r4, [r0]
    ldrsh.w	r5, [r1]
    ldrsh.w	ip, [r0, #2]
    add.w	r7, r4, r5
    ldrsh.w	r3, [r1, #2]
    rsb	r4, r4, r5
    add.w	r6, ip, r3
    rsb	r3, r3, ip
    mov.w	r7, r7, asr #1
    pkhbt	r3, r7, r3, lsl #15
    mov.w	r6, r6, asr #1
    pkhbt	r4, r6, r4, lsl #15
    str.w	r3, [r0], #4
    subs.w	r2, r2, #1
    str.w	r4, [r1], #-4
    bne.n .Lcode_7240
    pop	{r4, r5, r6, r7}
    bx	lr
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_31,"ax",%progbits
.balign 4
.Lcode_7258:
.global asm_complex_butterfly_inverse
.type asm_complex_butterfly_inverse, %function
.thumb_func
asm_complex_butterfly_inverse:
    stmdb	sp!, {r4, r5, r6, r7}
.Lcode_7259:
    ldrsh.w	r5, [r0]
    ldrsh.w	r4, [r1]
    ldrsh.w	r3, [r0, #2]
    add.w	r7, r5, r4
    ldrsh.w	ip, [r1, #2]
    rsb	r4, r4, r5
    add.w	r6, r3, ip
    rsb	r3, r3, ip
    mov.w	r7, r7, asr #1
    pkhbt	r3, r7, r3, lsl #15
    mov.w	r6, r6, asr #1
    pkhbt	r4, r6, r4, lsl #15
    str.w	r3, [r0], #4
    subs.w	r2, r2, #1
    str.w	r4, [r1], #-4
    bne.n .Lcode_7259
    pop	{r4, r5, r6, r7}
    bx	lr
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_32,"ax",%progbits
.balign 4
.Lcode_7277:
.global asm_radix4_twiddle_butterflies
.type asm_radix4_twiddle_butterflies, %function
.thumb_func
asm_radix4_twiddle_butterflies:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    mov.w	r2, r2, lsl #3
    ldr.w	fp, .Lliteral_7301
    add	fp, r2
    nop
.Lcode_7282:
    ldr.w	r6, [fp]
    add	fp, r2
    ldr	r4, [r1, #0]
    ldrsh.w	r8, [r0]
    smuadx	ip, r4, r6
    ldrsh.w	r7, [r0, #2]
    smusd	r6, r4, r6
    add.w	r5, ip, r7, lsl #15
    add.w	r4, r6, r8, lsl #15
    pkhtb	r5, r5, r4, asr #16
    rsb	r6, r6, r8, lsl #15
    sub.w	ip, ip, r7, lsl #15
    pkhtb	ip, ip, r6, asr #16
    str.w	r5, [r0], #4
    str.w	ip, [r1], #-4
    subs	r3, #1
    bne.n .Lcode_7282
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
    .byte 0x00
    .byte 0xbf
    .word 0x08091b80
.Lliteral_7301:
    .word .Ldata_19900
.Lcode_7302:
.global asm_transform_half_spectrum_stage
.type asm_transform_half_spectrum_stage, %function
.thumb_func
asm_transform_half_spectrum_stage:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs	r5, #1
    lsls	r5, r2
    mov	sl, r1
    ldr	r1, [sp, #32]
    mov.w	r9, #512
    asrs	r6, r5, #2
    asr.w	r9, r9, r2
    mov	r4, r0
    subs	r6, #1
    add.w	r7, r0, r5, lsl #1
    ldrsh.w	r2, [r0]
    cbnz	r1, .Lcode_7319
    ldrsh.w	r1, [r0, #2]
    lsls	r2, r2, #15
    lsls	r1, r1, #15
    b.n .Lcode_7323
.Lcode_7319:
    cbz	r3, .Lcode_7330
    ldrsh.w	r1, [r0, r5, lsl #1]
    lsls	r2, r2, #14
    lsls	r1, r1, #14
.Lcode_7323:
    adds	r0, r1, r2
    subs	r2, r2, r1
    asrs	r0, r0, #16
    asrs	r2, r2, #16
    strh	r0, [r4, #0]
    strh	r2, [r4, #2]
    b.n .Lcode_7341
.Lcode_7330:
    ldrsh.w	r1, [r0, #2]
    lsls	r2, r2, #15
    lsls	r1, r1, #15
    adds	r0, r1, r2
    subs	r2, r2, r1
    asrs	r0, r0, #16
    asrs	r2, r2, #16
    strh	r0, [r4, #0]
    strh.w	r2, [r4, r5, lsl #1]
    strh	r3, [r7, #2]
    strh	r3, [r4, #2]
.Lcode_7341:
    add.w	r8, r4, #4
    subs	r7, #4
    mov	r0, r8
    mov	r1, r7
    mov	r2, r6
    cbz	r3, .Lcode_7349
    bl .Lcode_7258
    b.n .Lcode_7350
.Lcode_7349:
    bl .Lcode_7239
.Lcode_7350:
    asrs	r5, r5, #1
    mov	r2, r9
    mov	r3, r6
    mov	r0, r8
    mov	r1, r7
    bl .Lcode_7277
    ldrsh.w	r2, [r4, r5, lsl #1]
    asrs	r2, r2, #1
    add.w	r3, r4, r5, lsl #1
    strh.w	r2, [r4, r5, lsl #1]
    ldrsh.w	r2, [r3, #2]
    lsls	r2, r2, #16
    cmp.w	r2, #2147483648
    beq.n .Lcode_7366
    negs	r2, r2
    b.n .Lcode_7367
.Lcode_7366:
    mvn.w	r2, #2147483648
.Lcode_7367:
    asrs	r2, r2, #17
    strh	r2, [r3, #2]
    add.w	r0, sl, #1
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_7371:
.global asm_real_fft_forward_64
.type asm_real_fft_forward_64, %function
.thumb_func
asm_real_fft_forward_64:
    push	{r0, r1, r4, r5, r6, lr}
    mov	r6, r2
    subs	r2, #1
    sxth	r2, r2
    mov	r5, r3
    mov	r4, r0
    bl .Lcode_7176
    mov	r2, r6
    mov	r1, r0
    movs	r3, #0
    mov	r0, r4
    str	r5, [sp, #0]
    bl .Lcode_7302
    cbnz	r5, .Lcode_7386
    strh	r5, [r4, #2]
.Lcode_7386:
    pop	{r2, r3, r4, r5, r6, pc}
.Lcode_7387:
.global asm_real_fft_inverse_64
.type asm_real_fft_inverse_64, %function
.thumb_func
asm_real_fft_inverse_64:
    push	{r0, r1, r2, r4, r5, lr}
    mov	r5, r0
    mov	r4, r2
    cbnz	r3, .Lcode_7392
    strh	r3, [r0, #2]
.Lcode_7392:
    str	r3, [sp, #0]
    mov	r2, r4
    movs	r3, #1
    mov	r0, r5
    bl .Lcode_7302
    subs	r2, r4, #1
    mov	r1, r0
    sxth	r2, r2
    mov	r0, r5
    bl .Lcode_7176
    rsb	r4, r4, #1
    adds	r0, r0, r4
    pop	{r1, r2, r3, r4, r5, pc}
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_33,"ax",%progbits
.balign 4
.Lcode_7405:
.global asm_average_i16
.type asm_average_i16, %function
.thumb_func
asm_average_i16:
    push	{r4}
    mov	r3, r0
    add.w	r4, r0, r1, lsl #1
    movs	r0, #0
    nop
.Lcode_7410:
    ldrsh.w	r2, [r3], #2
    cmp	r3, r4
    add	r0, r2
    bne.n .Lcode_7410
    sxth	r1, r1
    pop	{r4}
    b.w .Lcode_6588
    .byte 0x00
    .byte 0xbf
.Lcode_7417:
.global asm_max_i16
.type asm_max_i16, %function
.thumb_func
asm_max_i16:
    mov	r3, r0
    mov.w	r0, #32768
    add.w	r1, r3, r1, lsl #1
    movt	r0, #65535
    nop
.Lcode_7422:
    ldrsh.w	r2, [r3], #2
    cmp	r0, r2
    it	lt
    movlt	r0, r2
    cmp	r3, r1
    bne.n .Lcode_7422
    bx	lr
.Lcode_7429:
.global asm_argmax_i16
.type asm_argmax_i16, %function
.thumb_func
asm_argmax_i16:
    mov.w	r3, #32768
    push	{r4, r5}
    mov	r2, r1
    mov	r5, r1
    movt	r3, #65535
    nop
.Lcode_7435:
    ldrsh.w	r4, [r0], #2
    cmp	r3, r4
    itt	lt
    movlt	r5, r2
    movlt	r3, r4
    subs	r2, #1
    bne.n .Lcode_7435
    subs	r0, r1, r5
    pop	{r4, r5}
    bx	lr
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_34,"ax",%progbits
.balign 4
.Lcode_7445:
.global asm_argmax_i32
.type asm_argmax_i32, %function
.thumb_func
asm_argmax_i32:
    push	{r4, r5}
    mov	r3, r1
    mov	r5, r1
    mov.w	r4, #2147483648
    nop
.Lcode_7450:
    ldr.w	r2, [r0], #4
    cmp	r4, r2
    itt	lt
    movlt	r5, r3
    movlt	r4, r2
    subs	r3, #1
    bne.n .Lcode_7450
    subs	r0, r1, r5
    pop	{r4, r5}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_7460:
.global asm_sum_i16
.type asm_sum_i16, %function
.thumb_func
asm_sum_i16:
    mov	r3, r0
    add.w	r1, r0, r1, lsl #1
    movs	r0, #0
.Lcode_7463:
    ldrsh.w	r2, [r3], #2
    cmp	r3, r1
    add	r0, r2
    bne.n .Lcode_7463
    bx	lr
.Lcode_7468:
.global asm_sum_i32_normalized
.type asm_sum_i32_normalized, %function
.thumb_func
asm_sum_i32_normalized:
    push	{r4, r5, r6, r7}
    mov.w	ip, #1
    mov	r6, r2
    movs	r4, #0
    movs	r5, #0
.Lcode_7473:
    ldr.w	r7, [r0], #4
    smlal	r4, r5, r7, ip
    subs	r1, #1
    bne.n .Lcode_7473
    orrs.w	r3, r4, r5
    it	eq
    moveq	r0, r1
    beq.n .Lcode_7497
    asrs	r2, r5, #31
    mov	r3, r2
    eor.w	r0, r2, r4
    eor.w	r1, r2, r5
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cbnz	r3, .Lcode_7499
    cmp	r0, #0
    ldr	r3, [r6, #0]
    blt.n .Lcode_7515
    clz	r0, r0
    subs	r0, #1
    subs	r3, r3, r0
    lsls.w	r0, r4, r0
    str	r3, [r6, #0]
.Lcode_7497:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_7499:
    sxth	r3, r3
    clz	r3, r3
    rsb	r3, r3, #33
    rsb	r7, r3, #32
    sub.w	r1, r3, #32
    lsrs.w	r2, r4, r3
    lsls.w	r7, r5, r7
    asrs.w	r0, r5, r1
    ldr	r4, [r6, #0]
    orrs	r2, r7
    adds	r3, r4, r3
    str	r3, [r6, #0]
    bics.w	r0, r0, r1, asr #32
    it	cs
    movcs	r0, r2
    b.n .Lcode_7497
.Lcode_7515:
    asrs	r5, r5, #1
    mov.w	r4, r4, rrx
    adds	r3, #1
    str	r3, [r6, #0]
    mov	r0, r4
    b.n .Lcode_7497
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_35,"ax",%progbits
.balign 4
.Lcode_7521:
.global asm_multiply_i16_between_exponents
.type asm_multiply_i16_between_exponents, %function
.thumb_func
asm_multiply_i16_between_exponents:
    push	{r4, r5}
    ldr	r4, [sp, #12]
    ldr	r5, [sp, #8]
    subs	r4, r5, r4
    subs	r4, #15
    bmi.n .Lcode_7536
    add.w	r2, r0, r2, lsl #1
.Lcode_7528:
    ldrsh.w	r5, [r1], #2
    mul.w	r5, r3, r5
    lsls	r5, r4
    strh.w	r5, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7528
.Lcode_7534:
    pop	{r4, r5}
    bx	lr
.Lcode_7536:
    negs	r4, r4
    add.w	r2, r0, r2, lsl #1
.Lcode_7538:
    ldrsh.w	r5, [r1], #2
    mul.w	r5, r3, r5
    asrs	r5, r4
    strh.w	r5, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7538
    b.n .Lcode_7534
.Lcode_7545:
.global asm_scale_i16_vector
.type asm_scale_i16_vector, %function
.thumb_func
asm_scale_i16_vector:
    push	{r4}
    add.w	r2, r0, r2, lsl #1
    nop
.Lcode_7548:
    ldrsh.w	r4, [r1], #2
    mul.w	r4, r3, r4
    sbfx	r4, r4, #15, #16
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7548
    pop	{r4}
    bx	lr
.Lcode_7556:
.global asm_vector_energy
.type asm_vector_energy, %function
.thumb_func
asm_vector_energy:
    push	{r4, r5, r6, r7}
    mov	r6, r0
    movs	r0, #0
    movs	r3, #0
    ands.w	r4, r2, #1
    beq.n .Lcode_7566
    subs	r2, #1
    ldrsh.w	r7, [r1], #2
    smlal	r0, r3, r7, r7
    ble.n .Lcode_7571
.Lcode_7566:
    add.w	r2, r1, r2, lsl #1
.Lcode_7567:
    ldr.w	r7, [r1], #4
    smlald	r0, r3, r7, r7
    cmp	r1, r2
    bne.n .Lcode_7567
.Lcode_7571:
    adds	r4, r0, r0
    adc.w	r5, r3, r3
    orrs.w	r3, r4, r5
    beq.n .Lcode_7606
    asrs	r2, r5, #31
    mov	r3, r2
    eor.w	r0, r2, r4
    eor.w	r1, r2, r5
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cbnz	r3, .Lcode_7592
    cmp	r0, #0
    blt.n .Lcode_7609
    clz	r0, r0
    subs	r3, r0, #1
    lsls.w	r0, r4, r3
    negs	r3, r3
    str	r3, [r6, #0]
.Lcode_7590:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_7592:
    sxth	r3, r3
    clz	r3, r3
    rsb	r3, r3, #33
    rsb	r7, r3, #32
    sub.w	r1, r3, #32
    lsls.w	r7, r5, r7
    lsrs.w	r2, r4, r3
    asrs.w	r0, r5, r1
    orrs	r2, r7
    str	r3, [r6, #0]
    bics.w	r0, r0, r1, asr #32
    it	cs
    movcs	r0, r2
    b.n .Lcode_7590
.Lcode_7606:
    movs	r0, #0
    str	r0, [r6, #0]
    b.n .Lcode_7590
.Lcode_7609:
    asrs	r5, r5, #1
    mov.w	r4, r4, rrx
    movs	r3, #1
    str	r3, [r6, #0]
    mov	r0, r4
    b.n .Lcode_7590
    .byte 0x00
    .byte 0xbf
.Lcode_7615:
.global asm_complex_magnitude_squared
.type asm_complex_magnitude_squared, %function
.thumb_func
asm_complex_magnitude_squared:
    ldr.w	r3, [r1], #4
    smuad	r3, r3, r3
    lsls	r3, r3, #1
    subs	r2, #1
    str.w	r3, [r0], #4
    bne.n .Lcode_7615
    bx	lr
.Lcode_7622:
.global asm_shift_i16
.type asm_shift_i16, %function
.thumb_func
asm_shift_i16:
    cmp	r3, #0
    push	{r4}
    bne.n .Lcode_7630
    cmp	r0, r1
    beq.n .Lcode_7639
    sxth	r2, r2
    pop	{r4}
    b.w .Lcode_2496
.Lcode_7630:
    bgt.n .Lcode_7641
    negs	r3, r3
    add.w	r2, r0, r2, lsl #1
    nop
.Lcode_7634:
    ldrsh.w	r4, [r1], #2
    asrs	r4, r3
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7634
.Lcode_7639:
    pop	{r4}
    bx	lr
.Lcode_7641:
    add.w	r2, r0, r2, lsl #1
    nop
.Lcode_7643:
    ldrsh.w	r4, [r1], #2
    lsls	r4, r3
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7643
    b.n .Lcode_7639

.section .text.vocoder_block_36,"ax",%progbits
.balign 4
.Lcode_7649:
.global asm_vector_normalization_shift
.type asm_vector_normalization_shift, %function
.thumb_func
asm_vector_normalization_shift:
    add.w	r1, r0, r1, lsl #1
    movs	r3, #0
    nop
.Lcode_7652:
    ldrsh.w	r2, [r0], #2
    cmp	r2, #0
    it	lt
    neglt	r2, r2
    cmp	r3, r2
    it	lt
    movlt	r3, r2
    cmp	r0, r1
    bne.n .Lcode_7652
    cmp.w	r3, #32768
    bne.n .Lcode_7673
    movs	r3, #0
    movt	r3, #32767
.Lcode_7665:
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    negs	r0, r3
    bx	lr
.Lcode_7673:
    lsls	r3, r3, #16
    b.n .Lcode_7665
    .byte 0x00
    .byte 0xbf
.Lcode_7675:
.global asm_normalize_i16_vector
.type asm_normalize_i16_vector, %function
.thumb_func
asm_normalize_i16_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    mov	r5, r1
    mov	r8, r0
    mov	r1, r2
    mov	r0, r5
    mov	r7, r2
    mov	r6, r3
    bl .Lcode_7649
    cmp	r8, r5
    it	eq
    cmpeq	r0, #0
    mov	r4, r0
    beq.n .Lcode_7693
    negs	r3, r0
    mov	r1, r5
    mov	r0, r8
    mov	r2, r7
    bl .Lcode_7622
.Lcode_7693:
    ldr	r3, [r6, #0]
    adds	r4, r3, r4
    str	r4, [r6, #0]
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_7697:
.global asm_i32_maximum_magnitude_shift
.type asm_i32_maximum_magnitude_shift, %function
.thumb_func
asm_i32_maximum_magnitude_shift:
    movs	r2, #0
    nop
.Lcode_7699:
    ldr.w	r3, [r0], #4
    cmp.w	r3, #2147483648
    beq.n .Lcode_7718
    cmp	r3, #0
    it	lt
    neglt	r3, r3
    cmp	r2, r3
    it	lt
    movlt	r2, r3
    subs	r1, #1
    bne.n .Lcode_7699
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    negs	r0, r2
    bx	lr
.Lcode_7718:
    movs	r0, #0
    bx	lr
.Lcode_7720:
.global asm_convert_i32_to_i16_rounded
.type asm_convert_i32_to_i16_rounded, %function
.thumb_func
asm_convert_i32_to_i16_rounded:
    subs	r1, r3, r1
    push	{r4, r5, r6, r7}
    cmp	r1, #0
    ldr	r7, [sp, #16]
    ble.n .Lcode_7742
    nop
    add.w	r7, r0, r7, lsl #1
    mvn.w	ip, #2147483648
    mov.w	r6, #32768
.Lcode_7729:
    ldr.w	r4, [r2], #4
    lsls.w	r3, r4, r1
    asrs.w	r5, r3, r1
    cmp	r5, r4
    it	ne
    eorne.w	r3, ip, r4, asr #31
    qadd	r3, r6, r3
    asrs	r3, r3, #16
    strh.w	r3, [r0], #2
    cmp	r0, r7
    bne.n .Lcode_7729
.Lcode_7740:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_7742:
    bne.n .Lcode_7752
    add.w	r7, r0, r7, lsl #1
    mov.w	r1, #32768
.Lcode_7745:
    ldr.w	r3, [r2], #4
    qadd	r3, r1, r3
    asrs	r3, r3, #16
    strh.w	r3, [r0], #2
    cmp	r0, r7
    bne.n .Lcode_7745
    b.n .Lcode_7740
.Lcode_7752:
    negs	r1, r1
    nop
    add.w	r7, r0, r7, lsl #1
.Lcode_7755:
    ldr.w	r3, [r2], #4
    asrs	r3, r1
    add.w	r3, r3, #32768
    asrs	r3, r3, #16
    strh.w	r3, [r0], #2
    cmp	r0, r7
    bne.n .Lcode_7755
    b.n .Lcode_7740
    .byte 0x00
    .byte 0xbf
.Lcode_7763:
.global asm_normalize_i32_to_i16
.type asm_normalize_i32_to_i16, %function
.thumb_func
asm_normalize_i32_to_i16:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    mov	r7, r1
    sub	sp, #8
    mov	r1, r2
    mov	r8, r0
    mov	r0, r7
    mov	r4, r3
    mov	r6, r2
    bl .Lcode_7697
    movs	r3, #0
    mov	r5, r0
    mov	r1, r0
    mov	r2, r7
    mov	r0, r8
    str	r6, [sp, #0]
    bl .Lcode_7720
    ldr	r3, [r4, #0]
    adds	r5, r3, r5
    str	r5, [r4, #0]
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_7784:
.global asm_shift_i16_between_exponents
.type asm_shift_i16_between_exponents, %function
.thumb_func
asm_shift_i16_between_exponents:
    push	{r4}
    cbz	r2, .Lcode_7796
    ldr	r4, [sp, #4]
    subs	r3, r3, r4
    cmp	r3, #0
    ble.n .Lcode_7798
    add.w	r2, r0, r2, lsl #1
.Lcode_7791:
    ldrsh.w	r4, [r1], #2
    lsls	r4, r3
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7791
.Lcode_7796:
    pop	{r4}
    bx	lr
.Lcode_7798:
    negs	r3, r3
    add.w	r2, r0, r2, lsl #1
.Lcode_7800:
    ldrsh.w	r4, [r1], #2
    asrs	r4, r3
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7800
    b.n .Lcode_7796
.Lcode_7806:
.global asm_saturating_shift_i16
.type asm_saturating_shift_i16, %function
.thumb_func
asm_saturating_shift_i16:
    push	{r4, r5, r6, r7}
    ldr	r4, [sp, #16]
    subs	r3, r3, r4
    cmp	r3, #0
    ble.n .Lcode_7827
    nop
    add.w	r2, r0, r2, lsl #1
    mvn.w	r7, #2147483648
.Lcode_7814:
    ldrsh.w	r5, [r1], #2
    lsls	r5, r5, #16
    lsls.w	r4, r5, r3
    asrs.w	r6, r4, r3
    cmp	r6, r5
    it	ne
    eorne.w	r4, r7, r5, asr #31
    asrs	r4, r4, #16
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7814
.Lcode_7825:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_7827:
    negs	r3, r3
    nop
    add.w	r2, r0, r2, lsl #1
.Lcode_7830:
    ldrsh.w	r4, [r1], #2
    asrs	r4, r3
    strh.w	r4, [r0], #2
    cmp	r0, r2
    bne.n .Lcode_7830
    b.n .Lcode_7825
.Lcode_7836:
.global asm_analyze_subframes
.type asm_analyze_subframes, %function
.thumb_func
asm_analyze_subframes:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #1328
    sub	sp, #4
    mov	r6, r0
    ldr.w	r4, [sp, #1376]
    ldrh.w	r0, [r0, #1756]
    str	r1, [sp, #28]
    adds	r0, r4, r0
    uxth	r0, r0
    sbfx	r4, r0, #3, #13
    uxth	r7, r4
    str	r4, [sp, #20]
    lsls	r5, r4, #3
    sub.w	r0, r0, r7, lsl #3
    ldr.w	r4, [sp, #1372]
    uxth	r0, r0
    adds	r5, #28
    rsb	ip, r5, r4
    sxth	r4, r0
    rsb	ip, r4, ip
    ldr.w	r4, [sp, #1368]
    strh.w	r0, [r6, #1756]
    add.w	ip, r4, ip, lsl #1
    add.w	r4, r6, #1584
    str	r4, [sp, #24]
    sxth.w	lr, r5
    mov	r4, r2
    mov	r2, lr
    ldr.w	lr, [sp, #24]
    mov	r1, ip
    add.w	lr, lr, #12
    add	r0, sp, #900
    str.w	lr, [sp, #24]
    mov	r8, r3
    bl .Lcode_2496
    ldr	r1, [sp, #24]
    add	r0, sp, #36
    movs	r2, #80
    bl .Lcode_2496
    add.w	r3, r6, #1568
    adds	r3, #14
    ldr.w	lr, [sp, #20]
    mov	r0, r3
    movs	r1, #0
.Lcode_7880:
    ldrsh.w	r2, [r0, #2]!
    adds	r1, #1
    rsb	r2, lr, r2
    bic.w	r2, r2, r2, asr #31
    cmp	r1, #6
    strh.w	r2, [r0, #-2]
    bne.n .Lcode_7880
    rsb	r7, r7, #58
    strh.w	r7, [r6, #1594]
    movs	r2, #0
    mov.w	r7, #32768
.Lcode_7891:
    ldrsh.w	r0, [r3, #2]!
    ldrsh.w	r1, [r3, #-2]
    subs	r1, r0, r1
    cmp	r1, #0
    itet	gt
    ldrhgt.w	r1, [r3, #-14]
    strhle.w	r7, [r3, #-16]
    strhgt.w	r1, [r3, #-16]
    adds	r2, #1
    cmp	r2, #6
    bne.n .Lcode_7891
    ldr	r2, [sp, #20]
    lsls	r3, r2, #1
    movs	r1, #0
    movs	r2, #32
    str.w	r3, [r8]
    mov	r0, r4
    bl .Lcode_2535
    add.w	r3, sp, #1328
    movs	r2, #0
    add	r0, sp, #900
    str.w	r2, [r3, #-4]!
    mov	r1, r0
    mov	r2, r5
    bl .Lcode_7675
    ldrsh.w	r7, [r6, #1580]
    ldr.w	r8, [sp, #1324]
    cmp	r7, r8
    beq.n .Lcode_7932
    add	r5, sp, #36
    add.w	r9, sp, #196
.Lcode_7922:
    mov	r0, r5
    mov	r1, r5
    movs	r2, #16
    mov	r3, r7
    adds	r5, #32
    str.w	r8, [sp]
    bl .Lcode_7806
    cmp	r5, r9
    ldr.w	r8, [sp, #1324]
    bne.n .Lcode_7922
.Lcode_7932:
    ldr	r2, [sp, #20]
    strh.w	r8, [r6, #1580]
    mov.w	lr, r8, lsl #1
    cmp	r2, #0
    str.w	lr, [sp, #12]
    ble.n .Lcode_8006
    add.w	r5, sp, #1248
    add.w	sl, sp, #198
    mov.w	fp, #0
    add	r6, sp, #900
    adds	r5, #12
    str.w	r8, [sp, #16]
.Lcode_7944:
    add.w	r9, r6, #16
    mov	r7, sl
    str	r4, [sp, #8]
.Lcode_7947:
    add.w	r0, sp, #1120
    movw r4, #:lower16:(.Ldata_20718)
    mov	r1, r6
    movs	r2, #32
    movs	r3, #16
    adds	r0, #12
    movt r4, #:upper16:(.Ldata_20718)
    str	r2, [sp, #4]
    str	r4, [sp, #0]
    bl .Lcode_2563
    add.w	r0, sp, #1120
    adds	r0, #12
    bl .Lcode_17877
    add.w	r1, sp, #1120
    mov	r0, r5
    adds	r1, #12
    movs	r2, #16
    ldrh.w	r8, [sp, #1132]
    adds	r6, #8
    bl .Lcode_7615
    ldr	r4, [sp, #8]
    movs	r3, #0
    mov	lr, r6
    mov	ip, r7
.Lcode_7971:
    ldr	r6, [r4, r3]
    ldr	r7, [r5, r3]
    adds	r2, r4, r3
    adds	r0, r5, r3
    ldr	r1, [r2, #4]
    ldr	r0, [r0, #4]
    add.w	r6, r6, r7, asr #7
    str	r6, [r4, r3]
    adds	r3, #8
    add.w	r1, r1, r0, asr #7
    cmp	r3, #64
    str	r1, [r2, #4]
    bne.n .Lcode_7971
    sxth.w	r8, r8
    bic.w	r8, r8, r8, asr #31
    mov	r6, lr
    mov	r7, ip
    str	r4, [sp, #8]
    strh.w	r8, [ip, #-2]
    movs	r4, #15
    mov	r0, ip
    ldr	r1, [sp, #16]
    ldr	r3, [sp, #12]
    str	r4, [sp, #0]
    add.w	r2, sp, #1264
    adds	r7, #32
    bl .Lcode_18014
    cmp	r6, r9
    bne.n .Lcode_7947
    ldr.w	lr, [sp, #20]
    ldr	r4, [sp, #8]
    add.w	fp, fp, #1
    cmp	lr, fp
    add.w	sl, sl, #64
    bgt.n .Lcode_7944
.Lcode_8006:
    add	r1, sp, #36
    ldr	r2, [sp, #20]
    ldr	r0, [sp, #28]
    bl .Lcode_17961
    ldr	r4, [sp, #20]
    ldr	r0, [sp, #24]
    add.w	lr, sp, #36
    add.w	r1, lr, r4, lsl #6
    movs	r2, #80
    bl .Lcode_2496
    ldr	r0, [sp, #20]
    add	sp, #308
    add.w	sp, sp, #1024
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_8020:
.global asm_update_spectral_energy_state
.type asm_update_spectral_energy_state, %function
.thumb_func
asm_update_spectral_energy_state:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	sl, r0
    sub	sp, #212
    add.w	r5, r0, #274
    ldrh.w	lr, [sl, #252]
    ldrh.w	r0, [r0, #254]
    ldrh.w	r6, [sl, #248]
    ldrh.w	r7, [sl, #250]
    ldrh.w	r4, [sl, #246]
    strh.w	r0, [sl, #256]
    str	r1, [sp, #68]
    str	r2, [sp, #100]
    mov	r1, r5
    movs	r2, #8
    strh.w	lr, [sl, #254]
    strh.w	r6, [sl, #250]
    strh.w	r4, [sl, #248]
    add.w	r0, sl, #290
    strh.w	r7, [sl, #252]
    mov	r6, r3
    bl .Lcode_2496
    ldrh.w	r3, [sl, #308]
    add.w	r4, sl, #258
    movs	r2, #8
    strh.w	r3, [sl, #310]
    mov	r0, r5
    mov	r1, r4
    bl .Lcode_2496
    ldr	r5, [sp, #68]
    ldrh.w	r2, [sl, #306]
    ldr	r3, [r5, #0]
    strh.w	r2, [sl, #308]
    cmp.w	r3, #2147483648
    beq.w .Lcode_9173
    negs	r3, r3
    asrs	r1, r3, #1
    mov	r2, r1
    asrs	r3, r1, #31
.Lcode_8058:
    ldr	r5, [sp, #68]
    movs	r1, #0
.Lcode_8060:
    ldr	r0, [r5, r1]
    adds	r1, #4
    adds	r2, r2, r0
    adc.w	r3, r3, r0, asr #31
    cmp	r1, #64
    bne.n .Lcode_8060
    orrs.w	r7, r2, r3
    bne.w .Lcode_9134
    ldr	r5, [sp, #100]
    adds	r1, r5, #1
    str	r1, [sp, #160]
    movs	r0, #0
.Lcode_8072:
    lsls	r6, r6, #16
    mov	r3, r6
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls.w	r2, r6, r3
    asrs	r2, r2, #16
    rsb	r3, r3, #15
    add	r5, sp, #160
    str	r5, [sp, #0]
    bl .Lcode_6721
    uxth	r0, r0
    cbz	r0, .Lcode_8092
    ldr	r1, [sp, #160]
    cmn.w	r1, #31
    bge.w .Lcode_9267
.Lcode_8092:
    movw	r2, #42497
.Lcode_8093:
    ldrsh.w	r3, [sl, #72]
    strh.w	r2, [sl, #74]
    cmn.w	r3, #5120
    blt.w .Lcode_9156
    movw	r7, #17818
    str	r7, [sp, #112]
.Lcode_8099:
    mov	r3, r6
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    movs	r5, #0
    lsls	r6, r3
    asrs	r2, r6, #16
    mov	r1, r5
    ldrsh.w	r6, [sl, #78]
    str	r5, [sp, #180]
    mov	r0, r5
    str	r5, [sp, #160]
    str	r5, [sp, #164]
    str	r5, [sp, #172]
    movs	r5, #10
    rsb	r3, r3, #15
    str	r5, [sp, #176]
    movt	r0, #23445
    add	r5, sp, #168
    str	r6, [sp, #108]
    str	r5, [sp, #0]
    bl .Lcode_6721
    uxth	r0, r0
    str	r0, [sp, #104]
    str	r4, [sp, #124]
    add.w	r0, sl, #80
    movs	r1, #16
    movs	r2, #0
    movs	r3, #0
    b.n .Lcode_8139
.Lcode_8133:
    subs	r4, #5
    lsls	r5, r4
    adds	r2, r2, r5
    adc.w	r3, r3, r5, asr #31
    subs	r1, #1
    beq.n .Lcode_8150
.Lcode_8139:
    ldrsh.w	r5, [r0, #2]!
    ldrsh.w	r4, [r0, #32]
    lsls	r5, r5, #16
    cmp	r4, #4
    bgt.n .Lcode_8133
    rsb	r4, r4, #5
    asrs	r5, r4
    adds	r2, r2, r5
    adc.w	r3, r3, r5, asr #31
    subs	r1, #1
    bne.n .Lcode_8139
.Lcode_8150:
    lsrs	r2, r2, #4
    orr.w	r2, r2, r3, lsl #28
    mov.w	r3, #42496
    mov.w	ip, r2, asr #16
    movt	r3, #65535
    cmp	ip, r3
    it	lt
    movlt	ip, r3
    mov.w	r7, #13120
    add	r5, sp, #128
    mov	r3, r1
    mov.w	ip, ip, lsl #16
    mov	r4, sl
    mov	r6, r5
    mov	r2, sl
    movw	lr, #1023
    movt	r7, #65531
    b.n .Lcode_8188
.Lcode_8168:
    subs	r0, #5
    lsl.w	r8, r8, r0
    add	r8, ip
    add.w	r8, r8, #671088640
    add.w	r8, r8, r3, lsl #11
    mov.w	r8, r8, asr #16
    cmp	r8, lr
    ble.n .Lcode_8202
.Lcode_8176:
    cmp.w	r8, #10240
    it	ge
    movge.w	r8, #10240
    sub.w	r3, r3, #19456
    uxth.w	r8, r8
    subs	r3, #204
    sxth.w	r0, r8
    adds	r2, #2
    cmp	r3, r7
    strh.w	r8, [r6], #2
    add	r1, r0
    beq.n .Lcode_8211
.Lcode_8188:
    ldrh.w	r8, [r2, #82]
    ldrsh.w	r0, [r2, #114]
    rsb	r8, r8, #0
    cmp	r0, #4
    mov.w	r8, r8, lsl #16
    bgt.n .Lcode_8168
    rsb	r0, r0, #5
    asr.w	r8, r8, r0
    add	r8, ip
    add.w	r8, r8, #671088640
    add.w	r8, r8, r3, lsl #11
    mov.w	r8, r8, asr #16
    cmp	r8, lr
    bgt.n .Lcode_8176
.Lcode_8202:
    sub.w	r3, r3, #19456
    mov.w	r0, #1024
    subs	r3, #204
    mov	r8, r0
    adds	r2, #2
    cmp	r3, r7
    strh.w	r8, [r6], #2
    add	r1, r0
    bne.n .Lcode_8188
.Lcode_8211:
    sbfx	r1, r1, #4, #16
    mvn.w	r0, #4227858432
    bl .Lcode_6534
    add	r2, sp, #160
    uxth	r0, r0
.Lcode_8216:
    ldrh	r3, [r5, #0]
    smulbb	r3, r3, r0
    sbfx	r3, r3, #15, #16
    strh.w	r3, [r5], #2
    cmp	r5, r2
    bne.n .Lcode_8216
    ldrsh.w	r3, [sl, #72]
    cmn.w	r3, #6400
    ble.w .Lcode_9131
    ldrsh.w	r2, [sl, #80]
    subs	r3, r3, r2
    movw	r2, #6553
    smulbb	r3, r3, r2
    asrs	r3, r3, #15
    cmp.w	r3, #512
    it	ge
    movge.w	r3, #512
    cmp.w	r3, #256
    it	lt
    movlt.w	r3, #256
    str	r3, [sp, #96]
.Lcode_8237:
    movs	r0, #0
    movs	r1, #0
    strd	r0, r1, [sp, #56]
    movs	r6, #0
    mov.w	r5, #32000
    str	r6, [sp, #40]
    str	r6, [sp, #76]
    str	r6, [sp, #84]
    str	r6, [sp, #88]
    str	r6, [sp, #92]
    str	r6, [sp, #52]
    str	r6, [sp, #72]
    str	r6, [sp, #64]
    str	r5, [sp, #116]
    str	r6, [sp, #120]
    mov	r9, r6
.Lcode_8253:
    ldr	r5, [sp, #68]
    ldr.w	r2, [sl, r6]
    ldr	r0, [r5, r6]
    ldrsh.w	r5, [sl, #242]
    add	r7, sp, #192
    str	r7, [sp, #0]
    mov	r1, r0
    ldr	r7, [sp, #100]
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    mov	r3, r2
    sxth	r1, r1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r1
    lsls	r2, r3
    subs	r1, r7, r1
    subs	r3, r5, r3
    asrs	r2, r2, #16
    asrs	r0, r0, #16
    bl .Lcode_6611
    ldrh.w	r5, [r4, #82]
    ldrh.w	r7, [r4, #146]
    str	r5, [sp, #20]
    ldrh.w	r5, [r4, #178]
    str	r7, [sp, #24]
    add	r7, sp, #184
    ldrsh.w	r8, [r4, #114]
    str	r5, [sp, #32]
    str	r7, [sp, #0]
    ldr	r5, [sp, #104]
    ldr	r7, [sp, #40]
    uxth	r0, r0
    smulbb	lr, r0, r5
    lsls	r2, r7, #11
    ldr	r5, [sp, #192]
    str	r0, [sp, #28]
    mov.w	lr, lr, lsl #1
    ldr	r0, [sp, #168]
    add.w	r2, r2, #1073741824
    subs	r5, #1
    mov	r1, lr
    mov	r7, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    cmp	r7, #0
    it	lt
    mvnlt	r7, r7
    itt	ne
    clzne	r7, r7
    subne	r7, #1
    sxth	r1, r1
    sxth	r7, r7
    movw	r3, #65506
    add.w	ip, r5, r0
    lsl.w	lr, lr, r1
    lsls	r2, r7
    movt	r3, #65535
    mov.w	r0, lr, asr #16
    rsb	r1, r1, ip
    asrs	r2, r2, #16
    subs	r3, r3, r7
    str	r5, [sp, #192]
    bl .Lcode_6611
    ldr	r5, [sp, #28]
    uxth	r0, r0
    sxth	r5, r5
    str	r5, [sp, #44]
    cmp	r0, #0
    bne.w .Lcode_8875
    mov.w	r5, #32768
    movs	r3, #15
    mov.w	r7, #32768
    str	r3, [sp, #184]
    movt	r5, #65535
    str	r7, [sp, #48]
.Lcode_8342:
    ldr	r7, [sp, #20]
    ldr	r2, [sp, #96]
    sxth.w	fp, r7
    movs	r3, #7
    mov	r0, fp
    mov	r1, r8
    add	r7, sp, #188
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldrh.w	r3, [sl, #312]
    sxth.w	ip, r3
    cmp.w	ip, #7
    bgt.w .Lcode_8851
    ldr	r7, [sp, #20]
    smulbb	r3, r7, r3
    lsls	r3, r3, #1
    add	r7, sp, #208
    mov	r2, r3
    add.w	r8, r8, #15
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    rsb	r1, r2, r8
    str.w	r1, [r7, #-12]!
    lsls.w	r2, r3, r2
    asrs	r0, r2, #16
    ldr	r3, [sp, #184]
    str.w	ip, [sp, #16]
    mov	r2, r5
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldr.w	ip, [sp, #16]
    ldr	r1, [sp, #196]
    str	r7, [sp, #0]
    mov.w	r2, ip, lsl #16
    add.w	r2, r2, #65536
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    lsls	r0, r0, #16
    asrs	r2, r2, #16
    rsb	r3, r3, #15
    bl .Lcode_6721
.Lcode_8395:
    uxth	r0, r0
    movw	r7, #32767
    ldr.w	r8, [sp, #196]
    ldr	r2, [sp, #108]
    str	r0, [sp, #20]
    sxth.w	fp, r0
    movs	r3, #5
    str	r7, [sp, #24]
.Lcode_8403:
    ldr	r7, [sp, #24]
    ldr.w	lr, [sp, #68]
    strh.w	r7, [r4, #146]
    ldr	r7, [sp, #20]
    strh.w	r2, [r4, #210]
    strh.w	r7, [r4, #82]
    strh.w	r3, [r4, #178]
    strh.w	r8, [r4, #114]
    ldr.w	r3, [lr, r6]
    ldr.w	ip, [sp, #184]
    ldr	r7, [sp, #192]
    str.w	r3, [sl, r6]
    str	r7, [sp, #36]
    mov	r3, ip
    mov	r1, r8
    mov	r2, r5
    add	r7, sp, #204
    mov	r0, fp
    str	r7, [sp, #0]
    str.w	ip, [sp, #16]
    bl .Lcode_6664
    uxth	r0, r0
    str	r0, [sp, #20]
    ldr	r7, [sp, #20]
    ldr.w	ip, [sp, #16]
    sxth	r7, r7
    str	r7, [sp, #32]
    ldr	r7, [sp, #204]
    mov	r3, r8
    str	r7, [sp, #24]
    mov	r0, r5
    add	r7, sp, #200
    mov	r1, ip
    mov	r2, fp
    str	r7, [sp, #0]
    bl .Lcode_6664
    ldr	r7, [sp, #32]
    cmp	r7, #0
    ittee	lt
    uxthlt	r0, r0
    ldrlt	r3, [sp, #200]
    ldrge	r3, [sp, #204]
    ldrge	r0, [sp, #20]
    cmp.w	r9, #5
    ble.w .Lcode_8938
.Lcode_8448:
    ldr	r7, [sp, #192]
    str	r7, [sp, #12]
    ldr	r7, [sp, #184]
    str	r7, [sp, #28]
    ldrh.w	r7, [sl, #72]
    str	r7, [sp, #36]
    ldrh.w	r7, [sl, #80]
    add.w	lr, sp, #128
    str	r7, [sp, #80]
    ldr	r7, [sp, #48]
    ldrh.w	ip, [lr, r9, lsl #1]
    cmp	r7, #0
    beq.w .Lcode_8893
    mov.w	r2, r9, lsl #16
    ldr	r7, [sp, #112]
    ldr	r0, [sp, #44]
    str.w	ip, [sp, #16]
    asrs	r2, r2, #5
    rsb	r2, r2, #65536
    sxth	r3, r7
    sbfx	r2, r2, #2, #16
    mul.w	r2, r2, r3
    lsls	r2, r2, #1
    mov	r1, r2
    movw	r3, #65517
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r2, r1
    movt	r3, #65535
    asrs	r2, r2, #16
    subs	r3, r3, r1
    add	r7, sp, #200
    ldr	r1, [sp, #12]
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldr	r7, [sp, #44]
    ldr	r1, [sp, #12]
    ldr	r3, [sp, #200]
    sxth	r2, r0
    lsls	r0, r7, #16
    add	r7, sp, #196
    str	r7, [sp, #0]
    bl .Lcode_6721
    ldr.w	ip, [sp, #16]
    ldr	r3, [sp, #196]
    ldr	r2, [sp, #92]
    add	r7, sp, #208
    smulbb	ip, ip, r0
    ldr.w	r1, [r7, #-44]!
    sbfx	ip, ip, #15, #16
    add.w	lr, r3, #5
    mov	r3, lr
    sxth	r0, r2
    mov	r2, ip
    str.w	ip, [sp, #16]
    str.w	lr, [sp, #196]
    str	r7, [sp, #0]
    bl .Lcode_6611
    mov	r7, r0
    uxth	r7, r7
    mov	r3, r8
    str	r7, [sp, #92]
    ldr	r1, [sp, #28]
    mov	r0, r5
    mov	r2, fp
    add	r7, sp, #204
    str	r7, [sp, #0]
    bl .Lcode_6664
    uxth	r0, r0
    sxth.w	r8, r0
    cmp.w	r8, #0
    str	r0, [sp, #28]
    ldr.w	ip, [sp, #16]
    blt.w .Lcode_8990
.Lcode_8527:
    add	r0, sp, #160
    ldr	r1, [sp, #204]
    str	r0, [sp, #0]
    mul.w	r2, r8, ip
    ldr	r0, [sp, #196]
    ldr	r7, [sp, #88]
    lsls	r2, r2, #1
    add.w	lr, r0, r1
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    rsb	lr, r3, lr
    asrs	r2, r2, #16
    sxth	r0, r7
    ldr	r1, [sp, #160]
    str.w	lr, [sp, #196]
    mov	r3, lr
    bl .Lcode_6611
    ldr	r7, [sp, #36]
    ldr	r3, [sp, #204]
    sxth	r2, r7
    ldr	r7, [sp, #80]
    str	r3, [sp, #196]
    sxth	r1, r7
    subs	r1, r2, r1
    uxth	r0, r0
    cmp.w	r1, #2048
    str	r0, [sp, #88]
    bgt.w .Lcode_8798
    cmn.w	r2, #6400
    blt.w .Lcode_8798
.Lcode_8564:
    ldr	r7, [sp, #64]
    ldr	r1, [sp, #52]
    mov	r2, r8
    sxth	r0, r7
    add	r7, sp, #200
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldr	r7, [sp, #76]
    ldr	r1, [sp, #72]
    ldr	r3, [sp, #200]
    uxth.w	fp, r0
    sxth.w	ip, r7
    add	r0, sp, #204
    sxth.w	r8, fp
    str	r0, [sp, #0]
    mov	r2, r8
    mov	r0, ip
    str.w	ip, [sp, #16]
    bl .Lcode_6664
    sxth	r0, r0
    cmp	r0, #0
    it	gt
    ldrgt	r7, [sp, #200]
    ldr.w	ip, [sp, #16]
    it	gt
    strgt	r7, [sp, #72]
    ldr	r7, [sp, #196]
    it	gt
    strgt.w	fp, [sp, #76]
    str	r7, [sp, #52]
    ldr	r7, [sp, #28]
    it	le
    movle	r8, ip
    str	r7, [sp, #64]
.Lcode_8598:
    tst.w	r9, #1
    bne.w .Lcode_8917
.Lcode_8600:
    ldr	r7, [sp, #24]
    str	r7, [sp, #180]
    cmp.w	r9, #0
    bne.w .Lcode_8987
    ldr	r7, [sp, #32]
    lsls	r3, r7, #16
    ldr	r7, [sp, #24]
    cmp	r7, #4
    ble.w .Lcode_8983
    subs	r2, r7, #5
    lsls.w	r2, r3, r2
.Lcode_8611:
    ldr	r7, [sp, #20]
    asrs	r2, r2, #16
    strh.w	r2, [sl, #306]
    str	r7, [sp, #84]
.Lcode_8615:
    ldr	r3, [sp, #184]
    lsls	r5, r5, #16
    cmp	r3, #6
    ble.w .Lcode_8872
    subs	r3, #7
    lsls	r5, r3
.Lcode_8621:
    ldrd	r0, r1, [sp, #56]
    adds	r6, #4
    adds	r0, r0, r5
    adc.w	r1, r1, r5, asr #31
    ldr	r5, [sp, #40]
    adds	r4, #2
    sub.w	r5, r5, #16384
    cmp	r6, #64
    strd	r0, r1, [sp, #56]
    add.w	r9, r9, #1
    str	r5, [sp, #40]
    bne.w .Lcode_8253
    lsrs	r2, r0, #4
    orr.w	r2, r2, r1, lsl #28
    movw	r3, #19726
    ldrh.w	r1, [sl, #314]
    ldr	r7, [sp, #120]
    ldr	r4, [sp, #116]
    add.w	r2, r2, #117440512
    smultb	r2, r2, r3
    movw	r3, #26214
    smlabb	r3, r1, r3, r2
    sbfx	r3, r3, #15, #16
    add	r6, sp, #184
    str	r6, [sp, #0]
    lsls	r0, r7, #16
    strh.w	r3, [sl, #314]
    sxth	r2, r4
    ldr	r3, [sp, #176]
    ldr	r1, [sp, #172]
    bl .Lcode_6721
    ldr	r3, [sp, #184]
    lsls	r0, r0, #16
    cmp	r3, #2
    bgt.w .Lcode_9123
    rsb	r3, r3, #2
    asrs.w	r2, r0, r3
.Lcode_8658:
    ldr	r5, [sp, #72]
    movw	r3, #6553
    asrs	r2, r2, #16
    mul.w	r8, r3, r8
    cmp	r5, #3
    strh.w	r2, [sl, #244]
    mov.w	r8, r8, lsl #1
    bgt.w .Lcode_9114
    rsb	r2, r5, #3
    asr.w	r2, r8, r2
.Lcode_8668:
    ldr	r3, [sp, #164]
    ldr	r5, [sp, #88]
    ldr	r1, [sp, #160]
    mov.w	r4, #32768
    qadd	r2, r4, r2
    lsrs	r4, r2, #16
    cmp	r3, #2
    it	gt
    ldrgt	r7, [sp, #92]
    add	r0, sp, #160
    ite	gt
    sxthgt	r2, r7
    movle.w	r2, #16384
    str	r0, [sp, #0]
    it	le
    movle	r3, #3
    lsls	r0, r5, #16
    bl .Lcode_6721
    ldr	r3, [sp, #160]
    lsls	r0, r0, #16
    cmp	r3, #3
    ble.w .Lcode_9153
    subs	r2, r3, #3
    lsls.w	r3, r0, r2
    asrs.w	r2, r3, r2
    cmp	r0, r2
    itt	ne
    mvnne.w	r3, #2147483648
    eorne.w	r3, r3, r0, asr #31
.Lcode_8697:
    mov.w	r5, #32768
    ldr	r6, [sp, #100]
    qadd	r3, r5, r3
    asrs	r5, r3, #16
    ldrh.w	r3, [sl, #74]
    strh.w	r6, [sl, #242]
    cmp.w	r5, #16384
    ldrh.w	r2, [sl, #72]
    sxth	r1, r3
    ble.w .Lcode_8804
    cmn.w	r1, #10240
    ble.w .Lcode_8804
    sxth	r0, r2
    cmp	r1, r0
    bgt.w .Lcode_9315
.Lcode_8712:
    movw	r0, #20972
    movw	r1, #32440
    smulbb	r3, r3, r0
    smulbb	r2, r2, r1
    lsls	r0, r3, #1
    lsls	r2, r2, #1
    mov	r1, r0
    mov	r3, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r1, r1
    sxth	r3, r3
    lsls	r0, r1
    lsls	r2, r3
    rsb	r1, r1, #1
    rsb	r3, r3, #7
.Lcode_8738:
    asrs	r0, r0, #16
    asrs	r2, r2, #16
    add	r7, sp, #160
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldr	r3, [sp, #160]
    lsls	r0, r0, #16
    cmp	r3, #6
    bgt.w .Lcode_8848
.Lcode_8747:
    rsb	r2, r3, #7
    asrs.w	r2, r0, r2
.Lcode_8749:
    ldrh.w	r3, [sl, #74]
    lsrs	r2, r2, #16
    sxth	r1, r3
.Lcode_8752:
    ldrsb.w	r6, [sl, #76]
    strh.w	r2, [sl, #72]
    sxth	r4, r4
    cmp	r5, r4
    it	lt
    movlt	r5, r4
    lsls	r6, r6, #8
    lsls	r5, r5, #16
    cmn.w	r6, #23040
    ldrh.w	r7, [sl, #80]
    ldrh.w	r4, [sl, #68]
    ldrh.w	r0, [sl, #312]
    ble.n .Lcode_8781
    cmp	r6, r1
    blt.n .Lcode_8781
    sxth	r6, r0
    cmp	r6, #7
    ble.w .Lcode_9313
    sxth	r2, r2
    mov.w	ip, r2, lsl #16
    movw	r6, #1281
    rsb	r1, ip, r1, lsl #16
    movt	r6, #60416
    cmp	r1, r6
    blt.w .Lcode_9345
    lsls	r1, r4, #31
    bpl.w .Lcode_9356
.Lcode_8779:
    add.w	r5, r5, #4127195136
    add.w	r5, r5, #6717440
.Lcode_8781:
    lsrs	r4, r5, #16
    cmp.w	r5, #65536
    blt.w .Lcode_9176
    strh.w	r4, [sl, #246]
    movs	r3, #1
.Lcode_8786:
    sxth	r2, r0
    cmp	r2, #7
    bgt.n .Lcode_8791
    adds	r0, #1
    strh.w	r0, [sl, #312]
.Lcode_8791:
    ldrsh.w	r2, [sl, #68]
    orr.w	r3, r3, r2, lsl #1
    uxth	r3, r3
    sxth	r0, r3
    strh.w	r3, [sl, #68]
    add	sp, #212
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_8798:
    cmp.w	r9, #0
    bne.w .Lcode_8976
    ubfx	r8, r8, #1, #16
    str.w	r8, [sp, #28]
    sxth.w	r8, r8
    b.n .Lcode_8564
.Lcode_8804:
    sxth	r0, r2
    cmp	r1, r0
    bgt.w .Lcode_8712
    cmp.w	r5, #8192
    bgt.w .Lcode_8712
    cmn.w	r0, #10240
    ble.n .Lcode_8752
    rsb	r2, r0, r0, lsl #10
    movw	r1, #16777
    smulbb	r3, r3, r1
    rsb	r2, r0, r2, lsl #5
    lsls	r2, r2, #1
    lsls	r0, r3, #1
    mov	r6, r0
    mov	r3, r2
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r6, r6
    sxth	r3, r3
    movw	r1, #65534
    lsls	r2, r3
    lsls	r0, r6
    movt	r1, #65535
    rsb	r3, r3, #7
    asrs	r0, r0, #16
    asrs	r2, r2, #16
    subs	r1, r1, r6
    add	r7, sp, #160
    str	r7, [sp, #0]
    bl .Lcode_6611
    ldr	r3, [sp, #160]
    lsls	r0, r0, #16
    cmp	r3, #6
    ble.w .Lcode_8747
.Lcode_8848:
    subs	r2, r3, #7
    lsls.w	r2, r0, r2
    b.n .Lcode_8749
.Lcode_8851:
    sxth	r2, r0
    ldr	r1, [sp, #184]
    ldr	r3, [sp, #188]
    mov	r0, r5
    bl .Lcode_6791
    cmp	r0, #0
    bne.w .Lcode_9038
    ldrsh.w	ip, [r4, #210]
    ldr	r7, [sp, #32]
    cmp.w	ip, #0
    sxth.w	lr, r7
    ldr	r7, [sp, #24]
    bgt.w .Lcode_8997
    sxth.w	fp, r7
    str	r7, [sp, #20]
    movw	r7, #32767
    mov	r8, lr
    ldr	r2, [sp, #108]
    str	r7, [sp, #24]
    movs	r3, #5
    b.n .Lcode_8403
.Lcode_8872:
    rsb	r3, r3, #7
    asrs	r5, r3
    b.n .Lcode_8621
.Lcode_8875:
    sxth	r0, r0
    ldr	r1, [sp, #184]
    bl .Lcode_6814
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r3
    lsrs	r0, r0, #16
    rsb	r3, r3, #15
    str	r0, [sp, #48]
    str	r3, [sp, #184]
    sxth	r5, r0
    b.n .Lcode_8342
.Lcode_8893:
    ldr	r7, [sp, #76]
    ldr	r1, [sp, #72]
    ldr	r3, [sp, #52]
    sxth.w	fp, r7
    ldr	r7, [sp, #64]
    sxth.w	r8, r7
    mov	r0, fp
    mov	r2, r8
    add	r7, sp, #204
    str	r7, [sp, #0]
    bl .Lcode_6664
    sxth	r0, r0
    cmp	r0, #0
    ble.w .Lcode_9081
    ldr	r7, [sp, #52]
    str	r7, [sp, #72]
    ldr	r7, [sp, #48]
    str	r7, [sp, #52]
    ldr	r7, [sp, #64]
    str	r7, [sp, #76]
    ldr	r7, [sp, #52]
    tst.w	r9, #1
    str	r7, [sp, #64]
    beq.w .Lcode_8600
.Lcode_8917:
    add	r7, sp, #208
    ldr.w	lr, [sp, #84]
    ldr.w	r1, [r7, #-28]!
    ldr	r2, [sp, #32]
    ldr	r3, [sp, #24]
    str	r7, [sp, #0]
    sxth.w	r0, lr
    bl .Lcode_6611
    ldr	r3, [sp, #180]
    uxth	r0, r0
    lsls	r2, r0, #16
    cmp	r3, #6
    str	r0, [sp, #84]
    ble.w .Lcode_9035
    subs	r3, #7
    lsls.w	r3, r2, r3
.Lcode_8933:
    ldr	r7, [sp, #124]
    asrs	r3, r3, #16
    strh.w	r3, [r7], #2
    str	r7, [sp, #124]
    b.n .Lcode_8615
.Lcode_8938:
    ldr	r7, [sp, #28]
    ldr.w	lr, [sp, #36]
    smulbb	r0, r7, r0
    lsls	r0, r0, #1
    add	r7, sp, #208
    mov	r2, r0
    add	r3, lr
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    lsl.w	ip, r0, r2
    rsb	lr, r2, r3
    ldr	r2, [sp, #120]
    ldr.w	r1, [r7, #-36]!
    str.w	lr, [sp, #200]
    mov	r3, lr
    sxth	r0, r2
    mov.w	r2, ip, asr #16
    str	r7, [sp, #0]
    bl .Lcode_6611
    add	r7, sp, #208
    ldr	r3, [sp, #116]
    ldr.w	r1, [r7, #-32]!
    ldr	r2, [sp, #44]
    str	r7, [sp, #0]
    mov	lr, r0
    uxth.w	lr, lr
    sxth	r0, r3
    ldr	r3, [sp, #36]
    str.w	lr, [sp, #120]
    bl .Lcode_6611
    uxth	r0, r0
    str	r0, [sp, #116]
    b.n .Lcode_8448
.Lcode_8976:
    cmp.w	r9, #1
    bne.w .Lcode_8564
    add.w	r8, r8, r8, lsl #1
    ubfx	r8, r8, #2, #16
    str.w	r8, [sp, #28]
    sxth.w	r8, r8
    b.n .Lcode_8564
.Lcode_8983:
    ldr	r7, [sp, #24]
    rsb	r2, r7, #5
    asrs.w	r2, r3, r2
    b.n .Lcode_8611
.Lcode_8987:
    ldr	r7, [sp, #20]
    str	r7, [sp, #84]
    b.n .Lcode_8615
.Lcode_8990:
    cmn.w	r8, #32768
    beq.w .Lcode_9099
    rsb	r7, r0, #0
    uxth	r7, r7
    str	r7, [sp, #28]
    sxth.w	r8, r7
    b.n .Lcode_8527
.Lcode_8997:
    sxth	r7, r7
    mov	r2, r7
    str	r7, [sp, #36]
    ldr	r7, [sp, #184]
    str.w	ip, [sp, #16]
    mov	r3, lr
    movs	r1, #2
    str	r7, [sp, #32]
    mov.w	r0, #16384
    add	r7, sp, #200
    str.w	lr, [sp, #196]
    str	r7, [sp, #0]
    bl .Lcode_6664
    mov	r7, r0
    add	r0, sp, #204
    str	r0, [sp, #0]
    movs	r1, #7
    ldr	r2, [sp, #36]
    ldr	r3, [sp, #196]
    ldr	r0, [sp, #96]
    bl .Lcode_6611
    sxth	r2, r7
    str	r0, [sp, #36]
    ldr	r1, [sp, #32]
    ldr	r3, [sp, #200]
    mov	r0, r5
    bl .Lcode_6791
    ldr.w	ip, [sp, #16]
    cmp	r0, #0
    beq.n .Lcode_9086
    ldr	r7, [sp, #32]
    str	r7, [sp, #196]
    ldr	r7, [sp, #48]
    str	r7, [sp, #24]
.Lcode_9031:
    ldr	r7, [sp, #32]
    add.w	r2, ip, #4294967295
    uxth	r3, r7
    b.n .Lcode_8403
.Lcode_9035:
    rsb	r3, r3, #7
    asrs.w	r3, r2, r3
    b.n .Lcode_8933
.Lcode_9038:
    ldr	r7, [sp, #184]
    str.w	r8, [sp, #196]
    mov	r3, r8
    mov	r0, r5
    mov	r1, r7
    mov	r2, fp
    bl .Lcode_6791
    sub.w	r8, r7, #3
    cmp	r0, #0
    bne.n .Lcode_9102
.Lcode_9048:
    movw	r3, #29491
    movw	r1, #26214
.Lcode_9050:
    add	r7, sp, #208
    mul.w	fp, r3, fp
    mul.w	r1, r1, r5
    lsls	r1, r1, #1
    mov.w	fp, fp, lsl #1
    ldr.w	lr, [r7, #-12]!
    mov	r2, r1
    mov	r3, fp
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r2, r2
    sxth	r3, r3
    lsls	r1, r2
    lsl.w	fp, fp, r3
    asrs	r0, r1, #16
    rsb	r3, r3, lr
    rsb	r1, r2, r8
    mov.w	r2, fp, asr #16
    str	r7, [sp, #0]
    bl .Lcode_6611
    b.n .Lcode_8395
.Lcode_9081:
    ldr	r7, [sp, #48]
    mov	r8, fp
    str	r7, [sp, #52]
    str	r7, [sp, #64]
    b.n .Lcode_8598
.Lcode_9086:
    ldr	r7, [sp, #36]
    ldr	r1, [sp, #32]
    ldr	r3, [sp, #204]
    str.w	ip, [sp, #16]
    sxth	r2, r7
    mov	r0, r5
    bl .Lcode_6791
    ldr.w	ip, [sp, #16]
    cmp	r0, #0
    bne.w .Lcode_9219
    ldr	r7, [sp, #196]
    str	r7, [sp, #32]
    b.n .Lcode_9031
.Lcode_9099:
    movw	r8, #32767
    str.w	r8, [sp, #28]
    b.n .Lcode_8527
.Lcode_9102:
    mov.w	r2, #36864
    mov	r0, r5
    mov	r1, r7
    movt	r2, #65535
    movs	r3, #5
    bl .Lcode_6791
    cmp	r0, #0
    beq.n .Lcode_9048
    mov.w	r3, #16384
    mov	r8, r7
    mov	r1, r3
    b.n .Lcode_9050
.Lcode_9114:
    ldr	r6, [sp, #72]
    subs	r3, r6, #3
    lsl.w	r2, r8, r3
    asrs.w	r3, r2, r3
    cmp	r8, r3
    itt	ne
    mvnne.w	r2, #2147483648
    eorne.w	r2, r2, r8, asr #31
    b.n .Lcode_8668
.Lcode_9123:
    subs	r3, #2
    lsls.w	r2, r0, r3
    asrs.w	r3, r2, r3
    cmp	r0, r3
    itt	ne
    mvnne.w	r2, #2147483648
    eorne.w	r2, r2, r0, asr #31
    b.n .Lcode_8658
.Lcode_9131:
    mov.w	r5, #512
    str	r5, [sp, #96]
    b.w .Lcode_8237
.Lcode_9134:
    sxth	r5, r3
    cmp	r5, #0
    mov	r0, r2
    blt.w .Lcode_9293
    mov	r3, r5
    clz	r3, r3
    cmp	r3, #32
    it	eq
    clzeq	r3, r2
    ldr	r7, [sp, #100]
    it	eq
    addeq	r3, #32
    adds	r1, r7, #1
    subs.w	r2, r3, #33
    bmi.w .Lcode_9305
.Lcode_9149:
    subs	r1, r1, r2
    str	r1, [sp, #160]
    lsls	r0, r2
    b.w .Lcode_8072
.Lcode_9153:
    rsb	r3, r3, #3
    asrs.w	r3, r0, r3
    b.n .Lcode_8697
.Lcode_9156:
    add.w	r0, r3, #5120
    movw	r2, #10885
    smulbb	r0, r0, r2
    movw	r2, #64686
    movt	r2, #65535
    asrs	r0, r0, #15
    cmp	r0, r2
    it	lt
    movlt	r0, r2
    movs	r1, #7
    movs	r2, #0
    bl .Lcode_6911
    movw	r3, #17818
    smulbb	r0, r0, r3
    ubfx	r0, r0, #15, #16
    str	r0, [sp, #112]
    b.w .Lcode_8099
.Lcode_9173:
    mvn.w	r2, #3221225472
    movs	r3, #0
    b.w .Lcode_8058
.Lcode_9176:
    movw	r2, #26214
    movw	r0, #29491
    smulbb	r3, r3, r2
    smulbb	r0, r7, r0
    lsls	r5, r3, #1
    lsls	r0, r0, #1
    mov	r2, r5
    mov	r3, r0
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r1, r2
    sxth	r3, r3
    lsls.w	r2, r0, r3
    lsls	r5, r1
    asrs	r2, r2, #16
    strh.w	r4, [sl, #246]
    asrs	r0, r5, #16
    rsb	r3, r3, #7
    rsb	r1, r1, #4
    add	r4, sp, #160
    str	r4, [sp, #0]
    bl .Lcode_6611
    ldr	r3, [sp, #160]
    lsls	r2, r0, #16
    cmp	r3, #6
    bgt.n .Lcode_9290
    rsb	r3, r3, #7
    asrs.w	r3, r2, r3
.Lcode_9214:
    asrs	r3, r3, #16
    strh.w	r3, [sl, #80]
    ldrh.w	r0, [sl, #312]
    movs	r3, #0
    b.n .Lcode_8786
.Lcode_9219:
    ldr	r7, [sp, #24]
    str.w	ip, [sp, #16]
    movw	r3, #29491
    smulbb	r1, r7, r3
    movw	r3, #26214
    mul.w	r3, r3, r5
    lsls	r0, r3, #1
    lsls	r1, r1, #1
    mov	r3, r1
    mov	r2, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r7, r3
    sxth	r2, r2
    ldr	r3, [sp, #32]
    lsls	r0, r2
    lsls	r1, r7
    str	r0, [sp, #24]
    sub.w	lr, r3, #3
    ldr	r3, [sp, #196]
    asrs	r0, r1, #16
    ldr	r1, [sp, #24]
    subs	r7, r3, r7
    rsb	lr, r2, lr
    str	r7, [sp, #200]
    asrs	r2, r1, #16
    mov	r3, lr
    mov	r1, r7
    add	r7, sp, #196
    str	r7, [sp, #0]
    str.w	lr, [sp, #204]
    bl .Lcode_6611
    ldr	r7, [sp, #196]
    ldr.w	ip, [sp, #16]
    str	r7, [sp, #32]
    uxth	r0, r0
    str	r0, [sp, #24]
    b.n .Lcode_9031
.Lcode_9267:
    sxth	r0, r0
    bl .Lcode_6814
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r3
    movw	r2, #24660
    smultb	r2, r0, r2
    rsb	r1, r3, #15
    lsls	r2, r2, #1
    cmp	r1, #4
    ble.n .Lcode_9342
    rsb	r3, r3, #10
    lsls	r2, r3
.Lcode_9286:
    add.w	r2, r2, #78643200
    add.w	r2, r2, #684032
    lsrs	r2, r2, #16
    b.w .Lcode_8093
.Lcode_9290:
    subs	r3, #7
    lsls.w	r3, r2, r3
    b.n .Lcode_9214
.Lcode_9293:
    mvns	r3, r5
    clz	r3, r3
    mvns	r2, r2
    cmp	r3, #32
    it	eq
    clzeq	r3, r2
    ldr	r7, [sp, #100]
    it	eq
    addeq	r3, #32
    adds	r1, r7, #1
    subs.w	r2, r3, #33
    bpl.w .Lcode_9149
.Lcode_9305:
    subs	r3, #1
    negs	r7, r2
    subs	r1, r1, r2
    lsls	r5, r3
    lsrs	r0, r7
    str	r1, [sp, #160]
    orrs	r0, r5
    b.w .Lcode_8072
.Lcode_9313:
    add.w	r5, r5, #3355443200
    b.n .Lcode_8781
.Lcode_9315:
    movw	r1, #26214
    smulbb	r3, r3, r1
    movw	r1, #29491
    smulbb	r2, r2, r1
    lsls	r0, r3, #1
    lsls	r2, r2, #1
    mov	r1, r0
    mov	r3, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r1, r1
    sxth	r3, r3
    lsls	r0, r1
    lsls	r2, r3
    rsb	r1, r1, #4
    rsb	r3, r3, #7
    b.n .Lcode_8738
.Lcode_9342:
    subs	r3, #10
    asrs	r2, r3
    b.n .Lcode_9286
.Lcode_9345:
    cmp.w	r1, #3959422976
    bgt.n .Lcode_9360
    cmp.w	r1, #3791650816
    ble.n .Lcode_9362
    add.w	r1, r1, #503316480
    movw	r2, #39323
    smultb	r2, r1, r2
    lsls	r2, r2, #1
    add.w	r2, r2, #402653184
    subs	r5, r5, r2
    b.n .Lcode_8781
.Lcode_9356:
    sxth	r1, r7
    subs	r2, r2, r1
    cmp.w	r2, #2048
    blt.w .Lcode_8779
.Lcode_9360:
    add.w	r5, r5, #4026531840
    b.n .Lcode_8781
.Lcode_9362:
    cmp.w	r1, #3623878656
    ble.n .Lcode_9371
    add.w	r1, r1, #671088640
    movw	r2, #39322
    smultb	r2, r1, r2
    sbfx	r2, r2, #0, #31
    add.w	r2, r2, #469762048
    subs	r5, r5, r2
    b.n .Lcode_8781
.Lcode_9371:
    cmp.w	r1, #3456106496
    ble.n .Lcode_9390
    sxth	r4, r4
    movs	r2, #18
    movs	r6, #0
.Lcode_9376:
    and.w	ip, r4, #1
    asrs	r4, r4, #1
    subs	r2, #1
    add	r6, ip
    bne.n .Lcode_9376
    cmp	r6, #1
    ble.n .Lcode_9390
    add.w	r1, r1, #838860800
    movw	r2, #39323
    smultb	r2, r1, r2
    lsls	r2, r2, #3
    add.w	r2, r2, #1006632960
    subs	r5, r5, r2
    b.n .Lcode_8781
.Lcode_9390:
    add.w	r5, r5, #3825205248
    b.n .Lcode_8781
.Lcode_9392:
.global asm_test_state_flag
.type asm_test_state_flag, %function
.thumb_func
asm_test_state_flag:
    adds	r1, #2
    movs	r2, #3
    ldrsh.w	r3, [r0, #68]
    lsls	r2, r1
    ands	r3, r2
    beq.n .Lcode_9402
    mov.w	r3, #1024000
    str	r3, [r0, #64]
    mov.w	r0, #1024
    bx	lr
.Lcode_9402:
    mov	r0, r3
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_9404:
.global asm_analyze_energy_trend
.type asm_analyze_energy_trend, %function
.thumb_func
asm_analyze_energy_trend:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs	r4, #0
    mov	sl, r1
    mov	r9, r0
    add.w	r6, r1, #80
    mov.w	r7, #64512
    mov	r8, r4
    b.n .Lcode_9437
.Lcode_9412:
    subs	r3, #5
    lsls	r5, r3
.Lcode_9414:
    lsls	r7, r7, #16
    add.w	r5, r5, #2013265920
    subs	r0, r5, r7
    movs	r1, #5
    asrs	r0, r0, #16
    cmp	r0, #102
    it	lt
    movlt	r0, #102
    mov	r2, r1
    bl .Lcode_6854
    sub.w	r0, r0, #536
    subs	r0, #5
    sxth	r0, r0
    lsrs	r5, r5, #16
    sub.w	r7, r7, #4194304
    cmp	r0, #0
    mov.w	r7, r7, lsr #16
    blt.n .Lcode_9445
    strh.w	r5, [r9, r4]
    adds	r4, #2
    cmp	r4, #32
    sxtah	r8, r8, r5
    beq.n .Lcode_9454
.Lcode_9437:
    ldrsh.w	r5, [r6, #2]!
    ldrsh.w	r3, [r6, #32]
    lsls	r5, r5, #16
    cmp	r3, #4
    bgt.n .Lcode_9412
    rsb	r3, r3, #5
    asrs	r5, r3
    b.n .Lcode_9414
.Lcode_9445:
    lsls	r5, r5, #16
    lsls	r0, r0, #16
    qadd	r5, r0, r5
    lsrs	r5, r5, #16
    strh.w	r5, [r9, r4]
    adds	r4, #2
    cmp	r4, #32
    sxtah	r8, r8, r5
    bne.n .Lcode_9437
.Lcode_9454:
    ldr.w	r2, [sl, #64]
    cmp.w	r8, #65536
    ite	le
    movle.w	r3, #491520
    movgt.w	r3, #245760
    rsb	r2, r2, r8
    adds.w	r3, r3, r2, lsl #6
    bmi.n .Lcode_9464
    movs	r0, #0
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_9464:
    str.w	r8, [sl, #64]
    movs	r0, #2
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_9467:
.global asm_tail_sum_complement
.type asm_tail_sum_complement, %function
.thumb_func
asm_tail_sum_complement:
    push	{r4, r5, r6, lr}
    sub	sp, #16
    lsls	r3, r3, #16
    ldr	r4, [sp, #32]
    cmp	r4, #15
    mov	r6, r0
    mov	r5, r1
    ble.n .Lcode_9507
    sub.w	r1, r4, #16
    lsls.w	r1, r3, r1
    add.w	r1, r1, #65536
    asrs	r1, r1, #16
    add.w	r0, r2, r1, lsl #1
    rsb	r1, r1, #32
    bl .Lcode_7460
    cmp	r0, #0
    ble.n .Lcode_9516
.Lcode_9484:
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls.w	r2, r0, r3
    asrs	r2, r2, #16
    negs	r3, r3
    lsls	r0, r6, #16
    mov	r1, r5
    add	r4, sp, #12
    str	r4, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #12]
    cmp	r3, #0
    ble.n .Lcode_9518
    movs	r0, #0
.Lcode_9504:
    sxth	r0, r0
    add	sp, #16
    pop	{r4, r5, r6, pc}
.Lcode_9507:
    rsb	r1, r4, #16
    asrs.w	r1, r3, r1
    add.w	r1, r1, #65536
    asrs	r1, r1, #16
    add.w	r0, r2, r1, lsl #1
    rsb	r1, r1, #32
    bl .Lcode_7460
    cmp	r0, #0
    bgt.n .Lcode_9484
.Lcode_9516:
    movw	r0, #32767
    b.n .Lcode_9504
.Lcode_9518:
    mov.w	r0, r0, lsl #16
    bne.n .Lcode_9528
.Lcode_9520:
    cmp.w	r0, #2147483648
    beq.n .Lcode_9526
    rsb	r0, r0, #2130706432
    add.w	r0, r0, #16711680
    lsrs	r0, r0, #16
    b.n .Lcode_9504
.Lcode_9526:
    movw	r0, #65534
    b.n .Lcode_9504
.Lcode_9528:
    negs	r3, r3
    asrs	r0, r3
    b.n .Lcode_9520
    .byte 0x00
    .byte 0xbf
.Lcode_9531:
.global asm_sum_normalized_bands
.type asm_sum_normalized_bands, %function
.thumb_func
asm_sum_normalized_bands:
    stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov	r5, r3
    sxth	r3, r3
    mov	r9, r0
    mov	r4, r1
    mov	r0, r2
    mov	r1, r3
    bl .Lcode_6588
    lsls	r5, r5, #9
    asrs	r1, r5, #5
    asrs	r2, r5, #3
    sxth	r3, r0
    rsb	r1, r1, #65536
    adds	r1, r2, r1
    subs	r3, #1
    mla	r3, r2, r3, r1
    mov.w	ip, r5, asr #4
    ldr	r2, [sp, #32]
    asrs	r0, r3, #16
    add.w	r7, ip, r3
    str	r3, [r2, #0]
    rsb	r1, r0, r7, asr #16
    movs	r2, #0
    movs	r3, #0
    mov.w	r8, ip, lsl #1
    movs	r6, #1
.Lcode_9557:
    add.w	r0, r4, r0, lsl #2
.Lcode_9558:
    subs	r1, #1
    ldr.w	r5, [r0], #4
    smlal	r2, r3, r6, r5
    bne.n .Lcode_9558
    add.w	r0, r7, ip
    add	r7, r8
    asrs	r5, r7, #16
    asrs	r0, r0, #16
    cmp	r5, #128
    rsb	r1, r0, r5
    ble.n .Lcode_9557
    cmp	r0, #127
    bgt.n .Lcode_9578
    rsb	r1, r0, #128
    movs	r5, #1
    add.w	r0, r4, r0, lsl #2
.Lcode_9574:
    subs	r1, #1
    ldr.w	r4, [r0], #4
    smlal	r2, r3, r5, r4
    bne.n .Lcode_9574
.Lcode_9578:
    orrs.w	r1, r2, r3
    beq.n .Lcode_9598
    sxth	r1, r3
    cmp	r1, #0
    mov	r0, r2
    blt.n .Lcode_9611
    mov	r3, r1
.Lcode_9585:
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r3, r2
    addeq	r3, #32
    subs.w	r2, r3, #33
    bmi.n .Lcode_9602
    lsls	r0, r2
    negs	r3, r2
    lsrs	r0, r0, #16
    str.w	r3, [r9]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.Lcode_9598:
    movs	r0, #0
    str.w	r0, [r9]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.Lcode_9602:
    negs	r2, r2
    subs	r3, #1
    lsls	r1, r3
    lsrs	r0, r2
    orrs	r0, r1
    lsrs	r0, r0, #16
    str.w	r2, [r9]
    sxth	r0, r0
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.Lcode_9611:
    mvns	r3, r1
    mvns	r2, r2
    b.n .Lcode_9585
.Lcode_9614:
.global asm_refine_table_index_q16
.type asm_refine_table_index_q16, %function
.thumb_func
asm_refine_table_index_q16:
    push	{r3, r4, r5, lr}
    cbz	r0, .Lcode_9622
    cmp	r0, #31
    beq.n .Lcode_9637
    subs	r2, r0, #1
    lsls	r2, r2, #1
    mov	r4, r0
    b.n .Lcode_9624
.Lcode_9622:
    mov	r2, r0
    movs	r4, #1
.Lcode_9624:
    adds	r3, r1, r2
    ldrsh	r1, [r1, r2]
    ldrsh.w	r2, [r3, #4]
    ldrsh.w	r5, [r3, #2]
    lsls	r2, r2, #16
    lsls	r3, r1, #16
    asrs	r1, r2, #1
    add.w	r1, r1, r3, asr #1
    sub.w	r1, r1, r5, lsl #16
    asrs	r1, r1, #16
    bmi.n .Lcode_9640
    lsls	r0, r0, #16
    pop	{r3, r4, r5, pc}
.Lcode_9637:
    movs	r2, #58
    movs	r4, #30
    b.n .Lcode_9624
.Lcode_9640:
    asrs	r2, r2, #2
    rsb	r0, r2, r3, asr #2
    bl .Lcode_6559
    sxth	r0, r0
    lsls	r0, r0, #1
    add.w	r0, r0, r4, lsl #16
    pop	{r3, r4, r5, pc}
.Lcode_9647:
.global asm_track_pitch_analysis
.type asm_track_pitch_analysis, %function
.thumb_func
asm_track_pitch_analysis:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r7, r1
    sub	sp, #108
    ldrh	r4, [r7, #10]
    ldrh.w	ip, [r1, #4]
    ldrh.w	lr, [r1, #14]
    ldrh	r6, [r1, #2]
    ldrh	r5, [r1, #12]
    ldrh	r1, [r1, #0]
    strh	r4, [r7, #14]
    ldr	r4, [sp, #148]
    strh.w	ip, [r7, #8]
    str	r0, [sp, #16]
    mov	r8, r2
    str	r3, [sp, #24]
    strh.w	lr, [r7, #18]
    strh	r6, [r7, #6]
    strh	r5, [r7, #16]
    strh	r1, [r7, #4]
    cmp	r4, #0
    bne.w .Lcode_10193
    strh	r4, [r0, #12]
    movs	r1, #28
    movs	r0, #8
    movs	r4, #4
.Lcode_9672:
    add	r0, r8
    bl .Lcode_7429
    mov	r1, r8
    adds	r0, r4, r0
    bl .Lcode_9614
    mov	r6, r0
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    sxth	r6, r6
    lsls	r0, r6
    movs	r3, #0
    rsb	r6, r6, #15
    lsrs	r0, r0, #16
    str	r6, [sp, #68]
    strh.w	r0, [sp, #56]
    strh.w	r0, [sp, #60]
    str	r6, [sp, #76]
    strh.w	r3, [sp, #62]
    str	r3, [sp, #80]
    strh.w	r3, [sp, #64]
    str	r3, [sp, #84]
    movs	r4, #1
.Lcode_9698:
    mov.w	lr, r4, lsl #16
    add.w	lr, lr, #32768
    mov	r1, lr
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsl.w	lr, lr, r1
    rsb	r1, r1, #15
    adds	r3, r6, r1
    smultb	r5, lr, r0
    lsls	r5, r5, #1
    cmp	r3, #14
    itete	gt
    subgt.w	ip, r3, #15
    rsble	ip, r3, #15
    lslgt.w	r5, r5, ip
    asrle.w	r5, r5, ip
    asrs	r5, r5, #16
    cmp	r5, #31
    sxth	r2, r0
    ble.w .Lcode_9974
    lsls	r2, r2, #16
    cmp	r6, #5
    ble.w .Lcode_10163
.Lcode_9726:
    subs	r4, r6, #6
    lsls.w	r4, r2, r4
.Lcode_9728:
    ldr.w	ip, [sp, #16]
    asrs	r4, r4, #16
    ldrsh.w	r9, [ip, #12]
    movw	r3, #1638
    cmp	r4, r3
    it	lt
    movlt	r4, r3
    cmp.w	r4, #15872
    it	ge
    movge.w	r4, #15872
    cmp.w	r9, #0
    ble.w .Lcode_10287
    ldrsh.w	sl, [r7, #4]
    ldrsh.w	r5, [ip, #4]
    str.w	sl, [sp, #40]
    str	r5, [sp, #32]
.Lcode_9744:
    ldr	r5, [sp, #16]
    ldr	r6, [sp, #16]
    ldrh	r5, [r5, #8]
    ldrh	r6, [r6, #10]
    ldrh.w	ip, [r7, #14]
    str	r5, [sp, #44]
    movw	r3, #6554
    cmp	r4, r3
    str	r6, [sp, #36]
    str.w	ip, [sp, #28]
    ble.w .Lcode_10208
    uxth	r5, r4
    str	r5, [sp, #20]
    sxth	r5, r5
    ldr	r1, [sp, #24]
    mov.w	r2, #65536
    mov	r3, r5
    add	r0, sp, #88
    add	r6, sp, #100
    str	r6, [sp, #0]
    bl .Lcode_9531
    ldr	r1, [sp, #100]
    ldr.w	ip, [sp, #24]
    add.w	r3, r5, r5, lsl #1
    add	r2, sp, #104
    sub.w	r1, r1, r3, lsl #3
    asrs	r1, r1, #16
    movs	r3, #0
    str.w	r3, [r2, #-12]!
    mov	fp, r0
    add.w	r0, ip, r1, lsl #2
    rsb	r1, r1, #128
    bl .Lcode_7468
    ldr	r3, [sp, #88]
    ldr	r2, [sp, #92]
    lsrs	r0, r0, #16
    subs	r1, r3, r2
    mov.w	fp, fp, lsl #16
    itt	mi
    rsbmi	r3, r3, r2
    asrmi.w	fp, fp, r3
    movw	r3, #29789
    it	pl
    lslpl.w	fp, fp, r1
    smulbb	r3, r0, r3
    sub.w	r3, fp, r3, lsl #1
    cmp	r3, #0
    sxth.w	ip, r0
    ble.w .Lcode_10297
    lsls	r1, r5, #5
    add	r2, sp, #104
    ldr	r6, [sp, #24]
    add.w	r1, r1, #65536
    movs	r3, #0
    asrs	r1, r1, #16
    str.w	r3, [r2, #-8]!
    add.w	r0, r6, r1, lsl #2
    rsb	r1, r1, #128
    str.w	ip, [sp, #12]
    bl .Lcode_7468
    ldr	r3, [sp, #92]
    ldr	r2, [sp, #96]
    ldr.w	ip, [sp, #12]
    subs	r1, r3, r2
    mov.w	ip, ip, lsl #16
    itt	mi
    rsbmi	r3, r3, r2
    asrmi.w	ip, ip, r3
    mov.w	fp, r0, lsr #16
    movw	r3, #3276
    it	pl
    lslpl.w	ip, ip, r1
    smulbb	r3, fp, r3
    sub.w	ip, ip, r3, lsl #1
    cmp.w	ip, #0
    ble.w .Lcode_10297
    ldr	r1, [sp, #24]
    mov	r2, r5
    mov	r3, r5
    add	r0, sp, #88
    add	r6, sp, #100
    str	r6, [sp, #0]
    bl .Lcode_9531
    sxth.w	r2, fp
    ldr	r1, [sp, #88]
    ldr	r3, [sp, #96]
    bl .Lcode_10575
    cmp	r0, #0
    mov	fp, r0
    blt.w .Lcode_10297
.Lcode_9834:
    strh.w	fp, [r7, #10]
.Lcode_9835:
    ldr	r6, [sp, #20]
    ldr	r3, [sp, #156]
    ldr.w	ip, [sp, #16]
    strh	r6, [r7, #0]
    movs	r2, #0
    strh	r2, [r3, #0]
    ldrh.w	r8, [r7, #10]
    ldrh.w	r3, [ip, #2]
    ldrh.w	r6, [ip, #10]
    ldrh.w	sl, [r7, #4]
    ldrh	r2, [r7, #14]
    ldrh	r0, [r7, #0]
    ldrh.w	r1, [ip, #4]
    ldrh.w	r4, [ip, #8]
    ldrh.w	r9, [ip, #6]
    str	r3, [sp, #8]
    str	r6, [sp, #52]
    sxth.w	r3, r8
    movw	r6, #3276
    str.w	r8, [sp, #32]
    str.w	sl, [sp, #36]
    str	r2, [sp, #40]
    ldrh.w	fp, [ip]
    ldrh.w	r2, [ip, #12]
    str	r4, [sp, #48]
    sxth.w	r8, r0
    sxth.w	sl, sl
    sxth.w	ip, r1
    cmp	r3, r6
    str.w	r8, [sp, #20]
    str.w	sl, [sp, #24]
    sxth.w	r4, r9
    str.w	ip, [sp, #28]
    bgt.n .Lcode_9875
    movw	r6, #22938
    smulbb	r1, r1, r6
    movw	r6, #9830
    smlabb	r1, r0, r6, r1
    sbfx	r1, r1, #15, #16
    str	r1, [sp, #28]
.Lcode_9875:
    ldr	r1, [sp, #24]
    ldr.w	r8, [sp, #20]
    lsls	r6, r1, #16
    rsbs	r6, r6, r8, lsl #16
    bmi.w .Lcode_10293
    mov	ip, r6
.Lcode_9881:
    movw	r8, #19661
    smulbb	r8, r0, r8
    mov.w	r8, r8, asr #1
    cmp	r8, ip
    ble.w .Lcode_10284
    adds	r2, #1
    uxth	r2, r2
    str	r2, [sp, #44]
.Lcode_9889:
    movw	r1, #6553
    cmp	r3, r1
    ble.w .Lcode_10241
    ldr.w	ip, [sp, #40]
    sxth.w	r2, ip
.Lcode_9894:
    movw	r6, #26214
    smulbb	r6, fp, r6
    ldr.w	ip, [sp, #8]
    ldr.w	r8, [sp, #52]
    lsls	r6, r6, #1
    mov	r1, r6
    sxth.w	sl, ip
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    movw	fp, #29491
    sxth	r1, r1
    ldr.w	ip, [sp, #48]
    lsls	r6, r1
    smulbb	fp, r8, fp
    rsb	r1, r1, sl
    sxth.w	r8, ip
    asrs	r6, r6, #16
    ubfx	fp, fp, #15, #16
.Lcode_9916:
    movw	sl, #29491
    cmp	r1, #0
    mul.w	sl, sl, r6
    it	lt
    rsblt	ip, r1, #0
    mov.w	sl, sl, lsl #1
    it	lt
    asrlt.w	sl, sl, ip
    movw	ip, #26214
    movw	r9, #29491
    mul.w	ip, ip, r4
    it	ge
    lslge.w	sl, sl, r1
    mul.w	r8, r9, r8
    mov.w	ip, ip, asr #2
    qdadd	r8, sl, r8
    movw	r9, #1638
    qadd	ip, r8, ip
    mov.w	ip, ip, asr #16
    ldr.w	r8, [sp, #16]
    ldr.w	sl, [sp, #28]
    strh.w	r1, [r8, #2]
    cmp	ip, r9
    it	lt
    movlt	ip, r9
    cmp.w	ip, #15872
    it	ge
    movge.w	ip, #15872
    strh.w	ip, [r8, #8]
    movw	r1, #13107
    ldr.w	ip, [sp, #44]
    strh.w	r6, [r8]
    cmp	r3, r1
    strh.w	r4, [r8, #6]
    strh.w	fp, [r8, #10]
    strh.w	sl, [r8, #4]
    strh.w	ip, [r8, #12]
    ble.n .Lcode_9957
    subs	r1, #1
    cmp	r2, r1
    ble.w .Lcode_10386
.Lcode_9957:
    movw	r1, #13107
    cmp	r2, r1
    bgt.w .Lcode_10269
    movw	r1, #6554
    cmp	r2, r1
    bgt.w .Lcode_10272
.Lcode_9963:
    ldr	r4, [sp, #20]
    ldr	r6, [sp, #24]
    adds	r3, r3, r2
    adds	r1, r4, r6
    asrs	r1, r1, #1
    asrs	r3, r3, #1
    strh	r1, [r7, #2]
    strh	r3, [r7, #12]
.Lcode_9971:
    mov	r0, r5
    add	sp, #108
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_9974:
    negs	r2, r1
    cmp	r2, #0
    itete	lt
    movlt.w	ip, #1073741824
    movge.w	sl, #1073741824
    asrlt.w	r6, ip, r1
    lslge.w	r6, sl, r2
    sub.w	lr, lr, r6, lsl #1
    smultb	r6, lr, r0
    lsls	r6, r6, #1
    cmp	r3, #14
    itete	gt
    subgt.w	ip, r3, #15
    rsble	ip, r3, #15
    lslgt.w	r6, r6, ip
    asrle.w	r6, r6, ip
    asrs	r6, r6, #16
    mov.w	ip, #536870912
    adds	r6, #1
    cmp	r2, #0
    ite	ge
    lslge.w	ip, ip, r2
    asrlt.w	ip, ip, r1
    add	lr, ip
    cmp	r3, #14
    smultb	r9, lr, r0
    mov.w	r9, r9, lsl #1
    itete	gt
    subgt.w	ip, r3, #15
    rsble	ip, r3, #15
    lslgt.w	r9, r9, ip
    asrle.w	r9, r9, ip
    mov.w	r9, r9, asr #16
    cmp	r2, #0
    add.w	r9, r9, #1
    blt.w .Lcode_10185
    mov.w	r1, #1073741824
    lsls.w	r2, r1, r2
.Lcode_10012:
    add	lr, r2
    smultb	r0, lr, r0
    lsls	r0, r0, #1
    cmp	r3, #14
    itete	gt
    subgt.w	fp, r3, #15
    rsble	fp, r3, #15
    lslgt.w	fp, r0, fp
    asrle.w	fp, r0, fp
    rsb	fp, r9, fp, asr #16
    cmp	r4, #1
    add.w	fp, fp, #1
    add.w	sl, r8, r9, lsl #1
    beq.n .Lcode_10045
    mov	r1, fp
    mov	r0, sl
    bl .Lcode_7429
    mov	r1, r8
    add	r0, r9
    bl .Lcode_9614
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r3
    asrs	r0, r0, #16
    rsb	r3, r3, #15
    str	r3, [sp, #76]
    strh.w	r0, [sp, #60]
.Lcode_10045:
    subs	r5, r5, r6
    adds	r1, r5, #1
    add.w	r0, r8, r6, lsl #1
    bl .Lcode_7460
    mov	r1, fp
    mov	r5, r0
    mov	r0, sl
    bl .Lcode_7460
    subs	r5, r5, r0
    cmp	r5, #0
    mov	r6, r0
    ble.w .Lcode_10166
    mov	r3, r5
    mov	r1, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r3, r3
    sxth	r1, r1
    lsls	r5, r3
    lsls.w	r6, r0, r1
    asrs	r2, r5, #16
    negs	r1, r1
    negs	r3, r3
    mov	r0, r6
    add	r5, sp, #88
    str	r5, [sp, #0]
    bl .Lcode_6721
    ldr	r2, [sp, #88]
    cmp	r2, #7
    bgt.n .Lcode_10166
    beq.w .Lcode_10188
    add.w	r1, r2, #15
.Lcode_10087:
    cmp	r6, #0
    blt.n .Lcode_10172
.Lcode_10089:
    uxth.w	lr, r0
    sxth.w	r6, lr
    mul.w	r6, r6, r4
    lsls	r6, r6, #1
.Lcode_10093:
    mov	r3, r6
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r5, r3
    lsls	r6, r5
    ldrh.w	r3, [sp, #60]
    str	r2, [sp, #72]
    lsrs	r6, r6, #16
    smulbb	r2, r3, r6
    lsls	r2, r2, #1
    subs	r5, r1, r5
    ldr	r1, [sp, #76]
    strh.w	lr, [sp, #58]
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    adds	r1, r5, r1
    asrs	r2, r2, #16
    subs	r3, r1, r3
    add.w	lr, sp, #80
    ldr	r1, [sp, #80]
    ldrsh.w	r0, [sp, #62]
    str.w	lr, [sp]
    bl .Lcode_6611
    sxth	r2, r6
    mul.w	r2, r2, r4
    lsls	r2, r2, #1
    add	r6, sp, #104
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    ldr.w	r1, [r6, #-20]!
    adds	r5, #15
    mov	lr, r0
    asrs	r2, r2, #16
    ldrsh.w	r0, [sp, #64]
    strh.w	lr, [sp, #62]
    subs	r3, r5, r3
    str	r6, [sp, #0]
    bl .Lcode_6611
    uxth	r0, r0
    sxth	r2, r0
    cmp	r2, #0
    strh.w	r0, [sp, #64]
    bgt.n .Lcode_10175
    ldrh.w	r0, [sp, #56]
.Lcode_10155:
    adds	r4, #1
    cmp	r4, #16
    ldr	r6, [sp, #68]
    bne.w .Lcode_9698
    sxth	r2, r0
    lsls	r2, r2, #16
    cmp	r6, #5
    bgt.w .Lcode_9726
.Lcode_10163:
    rsb	r4, r6, #6
    asrs.w	r4, r2, r4
    b.n .Lcode_9728
.Lcode_10166:
    movs	r2, #7
    movs	r1, #22
    cmp	r6, #0
    str	r2, [sp, #88]
    mov.w	r0, #25600
    bge.n .Lcode_10089
.Lcode_10172:
    movs	r6, #0
    mov	lr, r6
    b.n .Lcode_10093
.Lcode_10175:
    ldrsh.w	r0, [sp, #62]
    ldr	r1, [sp, #80]
    ldr	r3, [sp, #84]
    lsls	r0, r0, #16
    add	r5, sp, #68
    str	r5, [sp, #0]
    bl .Lcode_6721
    uxth	r0, r0
    strh.w	r0, [sp, #56]
    b.n .Lcode_10155
.Lcode_10185:
    mov.w	sl, #1073741824
    asr.w	r2, sl, r1
    b.n .Lcode_10012
.Lcode_10188:
    cmp.w	r0, #25600
    it	ge
    movge.w	r0, #25600
    movs	r1, #22
    b.n .Lcode_10087
.Lcode_10193:
    ldr	r5, [sp, #16]
    ldrsh.w	r3, [r5, #12]
    cmp	r3, #2
    ble.n .Lcode_10280
    ldrsh.w	r3, [r5, #4]
    movw	r2, #9215
    cmp	r3, r2
    ble.n .Lcode_10278
    sxth	r1, r1
    cmp	r1, r2
    ble.w .Lcode_10392
    movs	r0, #12
    movs	r1, #26
    movs	r4, #6
    b.n .Lcode_9672
.Lcode_10208:
    movs	r2, #6
    movs	r3, #64
    mov	r1, r4
    mov	r0, r8
    bl .Lcode_18070
    mov	r5, r0
    cmp	r5, #0
    it	lt
    mvnlt	r5, r5
    itt	ne
    clzne	r5, r5
    subne	r5, #1
    sxth	r5, r5
    lsls	r0, r5
    mov.w	ip, r0, asr #16
    negs	r6, r5
    mov	r0, ip
    mov	r3, r4
    mov.w	lr, #6
    mov	r1, r6
    mov	r2, r8
    str.w	ip, [sp, #12]
    str.w	lr, [sp]
    bl .Lcode_9467
    movw	r3, #3276
    cmp	r4, r3
    mov	fp, r0
    ldr.w	ip, [sp, #12]
    bgt.w .Lcode_10411
.Lcode_10237:
    uxth	r4, r4
    str	r4, [sp, #20]
    sxth	r5, r4
    b.n .Lcode_9834
.Lcode_10241:
    ldr.w	sl, [sp, #40]
    sxth.w	r2, sl
    cmp	r2, r1
    bgt.w .Lcode_9894
    cmp	r8, ip
    ble.w .Lcode_9894
    movw	r1, #32113
    smulbb	r9, r9, r1
    movw	r1, #20972
    smulbb	ip, r0, r1
    mov.w	r1, r9, lsl #1
    mov	r4, r6
    add.w	ip, r1, ip, asr #4
    cmp	r4, #0
    it	lt
    mvnlt	r4, r4
    itt	ne
    clzne	r4, r4
    subne	r4, #1
    sxth	r1, r4
    lsls	r6, r1
    add.w	r4, ip, #32768
    negs	r1, r1
    asrs	r6, r6, #16
    asrs	r4, r4, #16
    ldr.w	r8, [sp, #20]
    movw	fp, #32767
    b.n .Lcode_9916
.Lcode_10269:
    subs	r1, #1
    cmp	r3, r1
    ble.n .Lcode_10274
.Lcode_10272:
    cmp.w	r3, r2, asr #1
    bge.w .Lcode_9963
.Lcode_10274:
    ldr	r2, [sp, #32]
    strh	r0, [r7, #2]
    strh	r2, [r7, #12]
    b.n .Lcode_9971
.Lcode_10278:
    cmp.w	r3, #8192
    bge.w .Lcode_10391
.Lcode_10280:
    movs	r0, #8
    movs	r1, #28
    movs	r4, #4
    b.n .Lcode_9672
.Lcode_10284:
    mov.w	sl, #0
    str.w	sl, [sp, #44]
    b.n .Lcode_9889
.Lcode_10287:
    ldr	r6, [sp, #16]
    ldrsh.w	ip, [r7, #4]
    ldrsh.w	sl, [r6, #4]
    str.w	ip, [sp, #40]
    str.w	sl, [sp, #32]
    b.n .Lcode_9744
.Lcode_10293:
    cmp.w	r6, #2147483648
    beq.w .Lcode_10404
    rsb	ip, r6, #0
    b.n .Lcode_9881
.Lcode_10297:
    mov	r1, r4
    movs	r2, #6
    movs	r3, #64
    mov	r0, r8
    bl .Lcode_18070
    mov	r5, r0
    cmp	r5, #0
    it	lt
    mvnlt	r5, r5
    itt	ne
    clzne	r5, r5
    subne	r5, #1
    sxth	r5, r5
    lsls	r0, r5
    negs	r6, r5
    asrs	r0, r0, #16
    mov.w	lr, #6
    mov	r1, r6
    mov	r2, r8
    mov	r3, r4
    str	r0, [sp, #24]
    str.w	lr, [sp]
    bl .Lcode_9467
    mov	fp, r0
.Lcode_10321:
    movs	r2, #5
    movs	r3, #64
    mov	r0, r8
    mov	r1, r4
    bl .Lcode_18070
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls.w	r2, r0, r3
    lsrs	r2, r2, #16
    rsb	ip, r3, #0
    rsb	r5, r5, #1
    sxth	r0, r2
    mvns	r6, r6
    cmp	ip, r5
    str	r0, [sp, #48]
    ble.w .Lcode_10461
    ldr	r5, [sp, #24]
    subs	r3, r6, r3
    lsls	r1, r5, #15
.Lcode_10346:
    movw	r6, #29789
    smulbb	r6, r2, r6
    lsls	r6, r6, #1
    cmp	r3, #0
    ble.w .Lcode_10511
    lsls.w	r0, r6, r3
    asrs.w	r5, r0, r3
    cmp	r6, r5
    itt	ne
    mvnne.w	r0, #2147483648
    eorne.w	r0, r0, r6, asr #31
.Lcode_10357:
    cmp	r0, r1
    ble.n .Lcode_10425
    ldr	r5, [sp, #28]
    sxth	r0, r5
    cmp	r0, fp
    blt.n .Lcode_10413
    movw	r5, #6553
    cmp	r0, r5
    ble.n .Lcode_10413
.Lcode_10366:
    ldr	r6, [sp, #36]
    movw	r0, #3276
    sxth	r5, r6
    cmp	r5, r0
    bgt.w .Lcode_10517
    movw	r0, #23406
    smulbb	r2, r2, r0
    lsls	r5, r2, #1
    cmp	r3, #0
    ble.w .Lcode_10564
    lsls.w	r2, r5, r3
    asrs.w	r0, r2, r3
    cmp	r5, r0
    itt	ne
    mvnne.w	r2, #2147483648
    eorne.w	r2, r2, r5, asr #31
.Lcode_10382:
    cmp	r2, r1
    ble.n .Lcode_10425
    lsls	r5, r4, #15
    b.n .Lcode_10448
.Lcode_10386:
    ldr	r0, [sp, #36]
    ldr	r1, [sp, #40]
    strh	r0, [r7, #2]
    strh	r1, [r7, #12]
    b.n .Lcode_9971
.Lcode_10391:
    sxth	r1, r1
.Lcode_10392:
    movw	r3, #8191
    cmp	r1, r3
    ite	gt
    movgt	r0, #10
    movle	r0, #8
    ite	gt
    movgt	r1, #27
    movle	r1, #28
    ite	gt
    movgt	r4, #5
    movle	r4, #4
    b.w .Lcode_9672
.Lcode_10404:
    movw	r8, #19661
    smulbb	r8, r0, r8
    mov.w	sl, #0
    mov.w	r8, r8, asr #1
    str.w	sl, [sp, #44]
    mvn.w	ip, #2147483648
    b.n .Lcode_9889
.Lcode_10411:
    str.w	ip, [sp, #24]
    b.n .Lcode_10321
.Lcode_10413:
    ldr	r6, [sp, #148]
    cmp	r6, #0
    beq.n .Lcode_10366
    lsls	r2, r4, #16
    asrs	r5, r2, #1
    mov.w	r6, sl, lsl #16
    subs	r0, r5, r6
    bmi.w .Lcode_10545
.Lcode_10421:
    subs	r2, r2, r6
    bmi.w .Lcode_10549
.Lcode_10423:
    cmp	r0, r2
    blt.n .Lcode_10448
.Lcode_10425:
    cmp.w	r9, #2
    ble.w .Lcode_10237
    ldr	r2, [sp, #48]
    lsls	r0, r2, #16
    cmp	r3, #0
    ble.n .Lcode_10508
    lsls.w	r2, r0, r3
    asrs.w	r3, r2, r3
    cmp	r0, r3
    itt	ne
    mvnne.w	r2, #2147483648
    eorne.w	r2, r2, r0, asr #31
.Lcode_10437:
    cmp	r2, r1
    blt.w .Lcode_10237
    lsls	r3, r4, #16
    asrs	r5, r3, #1
    mov.w	sl, sl, lsl #16
    subs.w	r2, r5, sl
    bmi.w .Lcode_10557
.Lcode_10444:
    subs.w	r3, r3, sl
    bmi.w .Lcode_10553
.Lcode_10446:
    cmp	r2, r3
    bge.w .Lcode_10237
.Lcode_10448:
    mov	r3, r4
    ldr	r0, [sp, #48]
    mov	r1, ip
    mov	r2, r8
    movs	r4, #5
    str	r4, [sp, #0]
    bl .Lcode_9467
    add.w	r5, r5, #32768
    lsrs	r5, r5, #16
    str	r5, [sp, #20]
    strh	r0, [r7, #10]
    sxth	r5, r5
    b.n .Lcode_9835
.Lcode_10461:
    movw	r1, #17712
    smulbb	r1, r2, r1
    subs	r3, r6, r3
    lsls	r5, r1, #1
    cmp	r3, #0
    ble.n .Lcode_10514
    lsls.w	r0, r5, r3
    asrs.w	r1, r0, r3
    cmp	r5, r1
    itt	ne
    mvnne.w	r0, #2147483648
    eorne.w	r0, r0, r5, asr #31
.Lcode_10473:
    ldr	r6, [sp, #24]
    lsls	r1, r6, #15
    cmp	r1, r0
    bge.w .Lcode_10346
    lsls	r5, r4, #16
    cmp.w	r9, #2
    ble.n .Lcode_10493
    ldr	r6, [sp, #40]
    movw	r0, #29491
    mul.w	r0, r0, r6
    subs.w	r0, r5, r0, lsl #1
    bmi.n .Lcode_10493
    movw	r0, #29789
    mul.w	r0, r0, r4
    str	r0, [sp, #20]
    lsls	r0, r6, #16
    ldr	r6, [sp, #20]
    rsb	r0, r0, r6, lsl #1
    cmp.w	r0, #65536
    blt.w .Lcode_10346
.Lcode_10493:
    ldr	r6, [sp, #32]
    movw	r0, #27853
    mul.w	r0, r0, r6
    subs.w	r0, r5, r0, lsl #1
    bmi.n .Lcode_10506
    movw	r0, #28494
    mul.w	r0, r0, r4
    str	r0, [sp, #20]
    lsls	r0, r6, #16
    ldr	r6, [sp, #20]
    rsb	r0, r0, r6, lsl #1
    cmp.w	r0, #65536
    blt.w .Lcode_10346
.Lcode_10506:
    asrs	r5, r5, #1
    b.n .Lcode_10448
.Lcode_10508:
    negs	r3, r3
    asrs.w	r2, r0, r3
    b.n .Lcode_10437
.Lcode_10511:
    negs	r0, r3
    asrs.w	r0, r6, r0
    b.n .Lcode_10357
.Lcode_10514:
    negs	r0, r3
    asrs.w	r0, r5, r0
    b.n .Lcode_10473
.Lcode_10517:
    ldr	r5, [sp, #36]
    ldr	r6, [sp, #24]
    ldr	r0, [sp, #48]
    movw	r2, #4915
    smulbb	r2, r5, r2
    lsls	r2, r2, #1
    rsb	r2, r2, #1493172224
    add.w	r2, r2, #10092544
    asrs	r2, r2, #16
    mul.w	r2, r2, r6
    lsls	r6, r2, #1
    lsls	r5, r0, #16
    cmp	r3, #0
    ble.n .Lcode_10561
    lsls.w	r2, r5, r3
    asrs.w	r0, r2, r3
    cmp	r5, r0
    itt	ne
    mvnne.w	r2, #2147483648
    eorne.w	r2, r2, r5, asr #31
.Lcode_10537:
    cmp	r6, r2
    bge.w .Lcode_10425
    ldr	r0, [sp, #44]
    lsls	r2, r4, #16
    asrs	r5, r2, #1
    lsls	r6, r0, #16
    subs	r0, r5, r6
    bpl.w .Lcode_10421
.Lcode_10545:
    cmp.w	r0, #2147483648
    beq.n .Lcode_10567
    negs	r0, r0
    b.n .Lcode_10421
.Lcode_10549:
    cmp.w	r2, #2147483648
    beq.n .Lcode_10569
    negs	r2, r2
    b.n .Lcode_10423
.Lcode_10553:
    cmp.w	r3, #2147483648
    beq.n .Lcode_10573
    negs	r3, r3
    b.n .Lcode_10446
.Lcode_10557:
    cmp.w	r2, #2147483648
    beq.n .Lcode_10571
    negs	r2, r2
    b.n .Lcode_10444
.Lcode_10561:
    negs	r2, r3
    asrs.w	r2, r5, r2
    b.n .Lcode_10537
.Lcode_10564:
    negs	r2, r3
    asrs.w	r2, r5, r2
    b.n .Lcode_10382
.Lcode_10567:
    mvn.w	r0, #2147483648
    b.n .Lcode_10421
.Lcode_10569:
    mvn.w	r2, #2147483648
    b.n .Lcode_10423
.Lcode_10571:
    mvn.w	r2, #2147483648
    b.n .Lcode_10444
.Lcode_10573:
    mvn.w	r3, #2147483648
    b.n .Lcode_10446
    .byte 0x00
    .byte 0xbf
.Lcode_10575:
.global asm_one_minus_normalized_ratio
.type asm_one_minus_normalized_ratio, %function
.thumb_func
asm_one_minus_normalized_ratio:
    push	{r4, lr}
    cmp	r2, #0
    sub	sp, #16
    bgt.n .Lcode_10583
    movw	r0, #32767
.Lcode_10580:
    sxth	r0, r0
    add	sp, #16
    pop	{r4, pc}
.Lcode_10583:
    lsls	r0, r0, #16
    add	r4, sp, #12
    str	r4, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #12]
    cmp	r3, #0
    ble.n .Lcode_10592
    movs	r0, #0
    b.n .Lcode_10580
.Lcode_10592:
    mov.w	r0, r0, lsl #16
    bne.n .Lcode_10602
.Lcode_10594:
    cmp.w	r0, #2147483648
    beq.n .Lcode_10600
    rsb	r0, r0, #2130706432
    add.w	r0, r0, #16711680
    lsrs	r0, r0, #16
    b.n .Lcode_10580
.Lcode_10600:
    movw	r0, #65534
    b.n .Lcode_10580
.Lcode_10602:
    negs	r3, r3
    asrs	r0, r3
    b.n .Lcode_10594
    .byte 0x00
    .byte 0xbf
.Lcode_10605:
.global asm_compare_resampled_bands
.type asm_compare_resampled_bands, %function
.thumb_func
asm_compare_resampled_bands:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #596
    mov	r7, r2
    mov	r3, r7
    mov	r2, r1
    str	r0, [sp, #12]
    movs	r4, #0
    mov	r5, r1
    movw	r9, #65506
    add.w	r1, sp, #478
    add	r0, sp, #32
    str	r4, [sp, #28]
    strh.w	r9, [sp, #476]
    bl .Lcode_18106
    mov	r8, r0
    mov	r1, r8
    add.w	r0, sp, #478
    bl .Lcode_7417
    cmp	r8, r4
    mov	r6, r0
    ble.w .Lcode_10803
    add.w	r1, sp, #478
    add.w	r4, r1, r8, lsl #1
    add	r2, sp, #32
    mov	r3, r1
.Lcode_10630:
    ldrsh.w	r1, [r3], #2
    ldr	r0, [r2, #0]
    subs	r1, r6, r1
    asrs.w	r1, r0, r1
    cmp	r3, r4
    str.w	r1, [r2], #4
    bne.n .Lcode_10630
    mov.w	lr, #0
    add.w	ip, sp, #252
    mov	r2, r5
    mov	r3, r8
    add	r0, sp, #256
    add.w	r1, sp, #478
    str.w	lr, [sp, #252]
    movw	lr, #65506
    str.w	ip, [sp, #16]
    strh.w	lr, [sp, #476]
    str	r7, [sp, #0]
    bl .Lcode_18204
    add.w	r0, sp, #478
    mov	r1, r8
    bl .Lcode_7417
    add	r2, sp, #256
    mov	r7, r0
    add.w	r3, sp, #478
.Lcode_10655:
    ldrsh.w	r1, [r3], #2
    ldr	r0, [r2, #0]
    subs	r1, r7, r1
    asrs.w	r1, r0, r1
    cmp	r3, r4
    str.w	r1, [r2], #4
    bne.n .Lcode_10655
.Lcode_10662:
    mvn.w	r1, #2
    mov	r3, r1
    mov.w	r0, #536870912
    mov	r2, r5
    add	r4, sp, #588
    str	r4, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #588]
    lsls	r0, r0, #16
    cmp	r3, #14
    ble.w .Lcode_10800
    subs	r3, #15
    lsl.w	fp, r0, r3
.Lcode_10675:
    ldr	r5, [sp, #12]
    str	r6, [sp, #20]
    add.w	ip, r5, #16
    mov.w	sl, fp, lsl #1
    str.w	ip, [sp, #12]
    add.w	r4, sl, #32768
    mov.w	ip, #0
    mov	r9, r7
.Lcode_10683:
    asrs	r6, r4, #16
    cmp	r6, r8
    ite	le
    rsble	r6, ip, r6
    rsbgt	r6, ip, r8
    cmp	r6, #0
    blt.w .Lcode_10795
    mov.w	r7, ip, lsl #2
    ldr.w	ip, [sp, #16]
    mov	r1, r6
    add.w	r0, ip, r7
    movs	r2, #0
    movs	r3, #0
    mov	lr, r4
.Lcode_10697:
    ldr.w	r4, [r0], #4
    subs	r1, #1
    adds	r2, r2, r4
    adc.w	r3, r3, r4, asr #31
    adds	r4, r1, #1
    bne.n .Lcode_10697
    mov	r4, lr
    orrs.w	lr, r2, r3
    beq.n .Lcode_10769
    sxth.w	lr, r3
    cmp.w	lr, #0
    mov	r0, r2
    blt.n .Lcode_10792
    mov	r3, lr
.Lcode_10711:
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r3, r2
    addeq	r3, #32
    subs.w	r1, r3, #33
    bmi.n .Lcode_10784
    lsls	r0, r1
    lsrs	r0, r0, #16
    rsb	r1, r1, r9
.Lcode_10721:
    add	r3, sp, #28
    adds	r7, r3, r7
    movs	r2, #0
    movs	r3, #0
    mov	lr, r1
.Lcode_10726:
    ldr.w	r1, [r7], #4
    subs	r6, #1
    adds	r2, r2, r1
    adc.w	r3, r3, r1, asr #31
    adds	r1, r6, #1
    bne.n .Lcode_10726
    orrs.w	r6, r2, r3
    mov	r1, lr
    beq.n .Lcode_10766
    sxth	r6, r3
    cmp	r6, #0
    mov	r7, r2
    blt.n .Lcode_10781
    mov	lr, r6
.Lcode_10740:
    clz	lr, lr
    cmp.w	lr, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	lr, r2, #32
    subs.w	r3, lr, #33
    bmi.n .Lcode_10772
    ldr.w	ip, [sp, #20]
    lsls.w	r2, r7, r3
    lsrs	r2, r2, #16
    rsb	r3, r3, ip
.Lcode_10751:
    sxth	r0, r0
    sxth	r2, r2
    bl .Lcode_10575
    ldrsh.w	r3, [r5], #2
    ldr	r6, [sp, #12]
    cmp	r0, r3
    rsb	ip, fp, r4
    it	lt
    strhlt.w	r0, [r5, #-2]
    cmp	r5, r6
    mov.w	ip, ip, asr #16
    add	r4, sl
    bne.n .Lcode_10683
    add.w	sp, sp, #596
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_10766:
    ldr	r3, [sp, #20]
    movs	r2, #0
    b.n .Lcode_10751
.Lcode_10769:
    mov	r1, r9
    movs	r0, #0
    b.n .Lcode_10721
.Lcode_10772:
    negs	r2, r3
    add.w	lr, lr, #4294967295
    lsl.w	r6, r6, lr
    lsrs.w	r2, r7, r2
    orrs	r2, r6
    ldr	r6, [sp, #20]
    lsrs	r2, r2, #16
    subs	r3, r6, r3
    b.n .Lcode_10751
.Lcode_10781:
    mvn.w	lr, r6
    mvns	r2, r2
    b.n .Lcode_10740
.Lcode_10784:
    subs	r2, r3, #1
    negs	r3, r1
    lsrs.w	r3, r0, r3
    lsl.w	r2, lr, r2
    orrs	r2, r3
    rsb	r1, r1, r9
    lsrs	r0, r2, #16
    b.n .Lcode_10721
.Lcode_10792:
    mvn.w	r3, lr
    mvns	r2, r2
    b.n .Lcode_10711
.Lcode_10795:
    movs	r0, #0
    mov	r1, r9
    ldr	r3, [sp, #20]
    mov	r2, r0
    b.n .Lcode_10751
.Lcode_10800:
    rsb	r3, r3, #15
    asr.w	fp, r0, r3
    b.n .Lcode_10675
.Lcode_10803:
    add.w	ip, sp, #252
    mov	r2, r5
    mov	r3, r8
    add	r0, sp, #256
    add.w	r1, sp, #478
    str.w	ip, [sp, #16]
    str	r7, [sp, #0]
    str	r4, [sp, #252]
    strh.w	r9, [sp, #476]
    bl .Lcode_18204
    add.w	r0, sp, #478
    mov	r1, r8
    bl .Lcode_7417
    mov	r7, r0
    b.n .Lcode_10662
    .byte 0x00
    .byte 0xbf
.Lcode_10818:
.global asm_analyze_spectral_blocks
.type asm_analyze_spectral_blocks, %function
.thumb_func
asm_analyze_spectral_blocks:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #76
    mov	fp, r0
    str	r1, [sp, #8]
    mov	r6, r2
    mov	r7, r3
    mov	r5, r0
    movs	r4, #4
.Lcode_10826:
    subs	r1, r4, #2
    movs	r2, #8
    add.w	r0, fp, r4, lsl #4
    add.w	r1, fp, r1, lsl #4
    bl .Lcode_2496
    adds	r0, r4, #5
    adds	r1, r4, #3
    movs	r2, #8
    add.w	r0, fp, r0, lsl #4
    add.w	r1, fp, r1, lsl #4
    bl .Lcode_2496
    ldrh.w	r3, [r5, #164]
    subs	r4, #1
    strh.w	r3, [r5, #168]
    subs	r5, #2
    cmp	r4, #1
    bne.n .Lcode_10826
    ldr	r0, [sp, #8]
    str	r7, [sp, #16]
    lsls	r3, r0, #16
    mov.w	sl, r3, asr #10
    asrs	r3, r3, #11
    add.w	sl, sl, #65536
    add.w	r3, r3, #65536
    mov.w	sl, sl, asr #16
    asrs	r3, r3, #16
    rsb	r0, sl, #32
    mov	r5, r6
    movs	r4, #0
    add.w	r2, fp, #80
    add.w	sl, r6, sl, lsl #1
    add.w	r6, r6, r3, lsl #1
    rsb	r3, r3, #32
    str	r2, [sp, #20]
    str	r0, [sp, #28]
    str	r6, [sp, #12]
    mov	r8, r4
    str	r3, [sp, #52]
    str.w	fp, [sp, #24]
    b.n .Lcode_10892
.Lcode_10866:
    ldr	r0, [sp, #16]
    ldr	r2, [sp, #20]
    ldr.w	r7, [r0], #4
    strh	r6, [r2, r4]
    sxth	r2, r6
    add	r6, sp, #56
    add	r7, r9
    strh	r7, [r6, r4]
    str	r0, [sp, #16]
    mov	r3, r9
    sxth.w	r0, fp
    mov	r1, ip
    bl .Lcode_10575
    ldr	r6, [sp, #24]
    ldr	r7, [sp, #12]
    strh	r0, [r6, r4]
    movw	r3, #6553
    adds	r4, #2
    cmp	r0, r3
    add.w	r7, r7, #64
    it	le
    addle.w	r8, r8, #1
    cmp	r4, #16
    add.w	r5, r5, #64
    str	r7, [sp, #12]
    beq.w .Lcode_11006
.Lcode_10892:
    mov	r0, sl
    ldr	r1, [sp, #28]
    bl .Lcode_7460
    mov	r7, r0
    cmp	r7, #0
    it	lt
    mvnlt	r7, r7
    itt	ne
    clzne	r7, r7
    subne	r7, #1
    sxth	r7, r7
    movs	r2, #6
    lsls.w	r6, r0, r7
    movs	r3, #64
    ldr	r1, [sp, #8]
    mov	r0, r5
    bl .Lcode_18070
    mov	ip, r0
    cmp.w	ip, #0
    it	lt
    mvnlt.w	ip, ip
    itt	ne
    clzne	ip, ip
    subne.w	ip, ip, #1
    sxth.w	ip, ip
    lsl.w	fp, r0, ip
    ldr	r0, [sp, #8]
    movw	r2, #3277
    lsrs	r6, r6, #16
    cmp	r0, r2
    rsb	ip, ip, #0
    mov.w	fp, fp, lsr #16
    rsb	r9, r7, #0
    mov.w	r8, r8, lsl #1
    add.w	sl, sl, #64
    ble.n .Lcode_10866
    ldr	r1, [sp, #52]
    ldr	r0, [sp, #12]
    str.w	ip, [sp, #4]
    bl .Lcode_7460
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsl.w	lr, r0, r3
    mov.w	lr, lr, lsr #16
    str	r3, [sp, #32]
    ldr	r1, [sp, #8]
    str.w	lr, [sp, #36]
    movs	r2, #5
    movs	r3, #64
    mov	r0, r5
    bl .Lcode_18070
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    ldr	r2, [sp, #36]
    ldr.w	ip, [sp, #4]
    lsls	r0, r3
    lsrs	r0, r0, #16
    str	r0, [sp, #44]
    smulbb	r1, r0, r6
    smulbb	r0, fp, r2
    lsls	r0, r0, #1
    negs	r3, r3
    str	r3, [sp, #40]
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsl.w	lr, r0, r3
    ldr	r0, [sp, #32]
    rsb	r0, r0, ip
    str	r0, [sp, #48]
    lsls	r1, r1, #1
    ldr	r0, [sp, #40]
    mov	r2, r1
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    lsls	r1, r2
    subs	r7, r0, r7
    asrs	r0, r1, #16
    subs	r1, r7, r2
    ldr	r7, [sp, #48]
    mov.w	r2, lr, asr #16
    subs	r3, r7, r3
    bl .Lcode_6768
    ldr.w	ip, [sp, #4]
    cmp	r0, #0
    beq.w .Lcode_10866
    ldr	r6, [sp, #32]
    ldr.w	ip, [sp, #40]
    ldr.w	fp, [sp, #44]
    rsb	r9, r6, #0
    ldr	r6, [sp, #36]
    b.n .Lcode_10866
.Lcode_11006:
    add	r0, sp, #56
    movs	r1, #8
    ldr.w	fp, [sp, #24]
    bl .Lcode_7417
    ldr	r2, [sp, #20]
    add	r5, sp, #72
    add	r3, sp, #56
.Lcode_11013:
    ldrsh.w	r1, [r3], #2
    ldrsh.w	r4, [r2]
    subs	r1, r0, r1
    lsls	r4, r4, #16
    adds	r1, #16
    asrs.w	r1, r4, r1
    cmp	r3, r5
    strh.w	r1, [r2], #2
    bne.n .Lcode_11013
    uxth	r0, r0
    movs	r3, #0
    ldr	r4, [sp, #20]
    strh.w	r0, [fp, #160]
    mov	r2, r3
.Lcode_11027:
    ldrsh	r1, [r4, r3]
    adds	r3, #2
    cmp	r3, #16
    orr.w	r2, r2, r1
    bne.n .Lcode_11027
    cbnz	r2, .Lcode_11045
    ldr	r1, [sp, #20]
    mov	r3, r2
    movs	r2, #1
.Lcode_11036:
    strh	r2, [r1, r3]
    adds	r3, #2
    cmp	r3, #16
    bne.n .Lcode_11036
    movw	r3, #65506
.Lcode_11041:
    sxth.w	r0, r8
    strh.w	r3, [fp, #160]
    add	sp, #76
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_11045:
    mov	r3, r0
    b.n .Lcode_11041
.Lcode_11047:
.global asm_analyze_complex_spectral_ratios
.type asm_analyze_complex_spectral_ratios, %function
.thumb_func
asm_analyze_complex_spectral_ratios:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #1152
    sub	sp, #12
    mov	r8, r2
    str	r0, [sp, #24]
    ldr	r5, [sp, #24]
    ldr	r4, [sp, #24]
    ldrh	r0, [r0, #2]
    ldrh	r6, [r4, #8]
    ldrh	r4, [r4, #14]
    strh	r0, [r5, #4]
    mov	r7, r5
    add.w	r5, r5, #40
    strh	r6, [r7, #10]
    strh	r4, [r7, #16]
    add.w	r0, r7, #56
    str	r1, [sp, #32]
    movs	r2, #8
    mov	r1, r5
    mov	r4, r3
    ldr.w	r6, [sp, #1200]
    bl .Lcode_2496
    ldr.w	fp, [sp, #24]
    ldrh.w	r2, [r7, #74]
    ldrh.w	r0, [fp, #6]
    ldrh.w	r7, [fp]
    ldrh.w	r3, [fp, #12]
    strh.w	r2, [fp, #76]
    add.w	ip, fp, #24
    mov	r1, ip
    movs	r2, #8
    strh.w	r7, [fp, #2]
    strh.w	r0, [fp, #8]
    strh.w	r3, [fp, #14]
    mov	r0, r5
    str.w	ip, [sp, #44]
    bl .Lcode_2496
    ldrh.w	r0, [fp, #72]
    adds	r6, #30
    mov	r1, r4
    mov	r2, r6
    movs	r3, #129
    strh.w	r0, [fp, #74]
    add	r0, sp, #48
    bl .Lcode_18301
    movs	r2, #8
    mov	r5, r0
    mov	r1, r0
    movs	r3, #1
    add	r0, sp, #48
    str.w	r5, [sp, #1144]
    bl .Lcode_7387
    ldrsh.w	r7, [sp, #48]
    ldrsh.w	r5, [sp, #304]
    str.w	r0, [sp, #1144]
    add	r0, sp, #48
    mov	r1, r0
    asrs	r7, r7, #1
    asrs	r5, r5, #1
    movs	r2, #129
    movw	r3, #28919
    strh.w	r7, [sp, #48]
    strh.w	r5, [sp, #304]
    bl .Lcode_7545
    ldr.w	r3, [sp, #1144]
    add.w	r5, sp, #1160
    subs	r3, #2
    str.w	r3, [r5, #-16]!
    add	r0, sp, #48
    mov	r3, r5
    mov	r1, r0
    movs	r2, #129
    bl .Lcode_7675
    movs	r1, #0
    movs	r2, #127
    add.w	r0, sp, #306
    bl .Lcode_2535
    movs	r2, #8
    ldr.w	r1, [sp, #1144]
    movs	r3, #1
    add	r0, sp, #48
    bl .Lcode_7371
    mov	r7, r0
    mov	r2, r7
    add	r0, sp, #48
    add.w	r1, sp, #50
    movs	r3, #128
    str.w	r7, [sp, #1144]
    bl .Lcode_18376
    mov	r1, r4
    mov	r2, r6
    movs	r3, #129
    add	r0, sp, #564
    bl .Lcode_18422
    mov	r4, r0
    add	r0, sp, #48
    mov	r1, r0
    add	r3, sp, #564
    movs	r6, #129
    movs	r2, #0
    str	r6, [sp, #4]
    str	r4, [sp, #0]
    bl .Lcode_18532
    add	r1, sp, #564
    mov	r7, r0
    add.w	r8, r8, #15
    subs	r3, r1, #2
    add	r6, sp, #820
    movw	r0, #32767
.Lcode_11156:
    ldrh.w	r2, [r3, #2]!
    sxth	r1, r2
    cbz	r2, .Lcode_11162
    cmp	r0, r1
    it	ge
    movge	r0, r1
.Lcode_11162:
    cmp	r3, r6
    bne.n .Lcode_11156
    subs	r3, r0, #1
    beq.n .Lcode_11174
    lsls	r3, r3, #16
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    rsb	r3, r3, #15
.Lcode_11174:
    add	r0, sp, #564
    mov	r2, r4
    mov	r1, r0
    movs	r4, #129
    str	r4, [sp, #0]
    bl .Lcode_18556
    mov	r1, r7
    mov	r6, r0
    add	r0, sp, #48
    bl .Lcode_18580
    mov	r9, r0
    ldr	r0, [sp, #32]
    str	r6, [sp, #0]
    mov	r2, r8
    add	r3, sp, #564
    mov	r1, r0
    str	r4, [sp, #4]
    bl .Lcode_18532
    mov	r1, r0
    ldr	r0, [sp, #32]
    bl .Lcode_18580
    ldr.w	r3, [sp, #1212]
    ldr.w	r1, [sp, #1204]
    ldr.w	r2, [sp, #1208]
    mov	r6, r0
    add	r0, sp, #564
    bl .Lcode_18607
    movs	r1, #0
    movs	r2, #12
    add	r0, sp, #564
    bl .Lcode_2535
    ldr	r4, [sp, #32]
    add.w	r0, sp, #1136
    add	r1, sp, #564
    add	r2, sp, #48
    mov	r3, r9
    adds	r0, #12
    stmia.w	sp, {r4, r6}
    movs	r4, #127
    str	r4, [sp, #8]
    bl .Lcode_18710
    mov	r4, r0
    ldrsh.w	r2, [sp, #1148]
    ldrsh.w	r0, [sp, #1150]
    str	r5, [sp, #0]
    mov	r3, r4
    mov	r1, r4
    bl .Lcode_19165
    movw	r3, #44676
    movt	r3, #65535
    ldr.w	r2, [sp, #1144]
    mul.w	r3, r3, r0
    lsls	r3, r3, #1
    cmp	r2, #0
    ble.w .Lcode_11518
    subs	r2, #1
    lsls.w	r5, r3, r2
.Lcode_11231:
    ldrsh.w	r1, [sp, #1150]
    ldrsh.w	r7, [sp, #1148]
    movw	r0, #32769
    movt	r0, #65535
    cmp	r1, r0
    it	lt
    movlt	r1, r0
    uxth	r1, r1
    cmp	r7, r0
    it	ge
    movge	r0, r7
    uxth	r0, r0
    smulbb	lr, r1, r1
    mov.w	lr, lr, lsl #1
    smulbb	r7, r0, r0
    lsls	r7, r7, #1
    mov	r2, lr
    asrs	r3, r2, #31
    asrs	r5, r5, #16
    adds.w	r2, lr, r7
    adc.w	r3, r3, r7, asr #31
    ldr	r7, [sp, #24]
    strh.w	r0, [sp, #1148]
    orrs.w	fp, r2, r3
    strh	r5, [r7, #0]
    strh.w	r1, [sp, #1150]
    beq.n .Lcode_11291
    sxth	r1, r3
    adds	r3, r1, #1
    mov	r0, r2
    it	eq
    mvneq	r2, r2
    clz	r2, r2
    subs	r3, r2, #1
    bmi.w .Lcode_11521
    lsls	r0, r3
    rsb	r3, r3, r4, lsl #1
.Lcode_11268:
    cmp	r0, #0
    ble.n .Lcode_11291
    add.w	r1, sp, #1160
    add.w	r5, sp, #1152
    str.w	r3, [r1, #-4]!
    bl .Lcode_6932
    ldr.w	r3, [sp, #1156]
    str	r5, [sp, #0]
    asrs	r2, r0, #16
    movs	r1, #1
    mov.w	r0, #1073741824
    bl .Lcode_6721
    ldrsh.w	r2, [sp, #1148]
    ldrsh.w	r3, [sp, #1150]
    mul.w	r2, r2, r0
    sbfx	r2, r2, #15, #16
    mul.w	r3, r3, r0
    strh.w	r2, [sp, #1148]
    ldr.w	r2, [sp, #1152]
    sbfx	r3, r3, #15, #16
    strh.w	r3, [sp, #1150]
    adds	r2, r4, r2
    b.n .Lcode_11292
.Lcode_11291:
    movs	r2, #0
.Lcode_11292:
    ldr	r0, [sp, #32]
    str	r6, [sp, #0]
    add.w	r1, sp, #1136
    mov	r3, r0
    movs	r4, #127
    adds	r1, #12
    str	r4, [sp, #4]
    bl .Lcode_18654
    movs	r7, #0
    sxth	r0, r0
    sxth.w	r9, r9
    mov.w	r8, #13
    mov	r3, r7
    mov	r4, r7
    str	r0, [sp, #40]
    str.w	r9, [sp, #28]
    add.w	r6, sp, #1080
    add.w	r5, sp, #1112
    mov	ip, r7
    b.n .Lcode_11347
.Lcode_11312:
    uxth.w	fp, r8
    str.w	r8, [sp, #36]
    add.w	r8, r8, #16
.Lcode_11315:
    ldr	r7, [sp, #32]
    ldr	r2, [sp, #40]
    str.w	ip, [sp, #20]
    lsls	r1, r3, #2
    add.w	lr, sp, #48
    add.w	sl, lr, r1
    mov.w	r9, r4, lsl #1
    adds	r1, r7, r1
    add.w	lr, sp, #1096
    rsb	fp, r3, fp
    ldr	r7, [sp, #28]
    add.w	r0, lr, r9
    sxth.w	fp, fp
    mov	r3, sl
    stmia.w	sp, {r7, fp}
    bl .Lcode_18823
    ldr.w	ip, [sp, #20]
    ldr	r2, [sp, #28]
    mov	lr, r0
    add.w	r1, sp, #1128
    add.w	r0, r1, r9
    strh.w	lr, [r6, ip]
    mov	r1, sl
    mov	r3, fp
    bl .Lcode_18696
    adds	r4, #1
    ldr.w	ip, [sp, #20]
    cmp	r4, #8
    strh.w	r0, [r5, ip]
    add.w	ip, ip, #2
    beq.n .Lcode_11353
    ldr	r3, [sp, #36]
.Lcode_11347:
    cmp	r4, #7
    bne.n .Lcode_11312
    mov.w	fp, #127
    str.w	fp, [sp, #36]
    mov.w	r8, #143
    b.n .Lcode_11315
.Lcode_11353:
    mov	r3, r4
    mov	r1, r6
    add.w	r2, sp, #1096
    mov	r0, r6
    bl .Lcode_18680
    mov	r3, r4
    mov	r7, r0
    mov	r1, r5
    mov	r0, r5
    add.w	r2, sp, #1128
    bl .Lcode_18680
    uxth	r7, r7
    movs	r4, #0
    uxth.w	fp, r0
    str	r7, [sp, #28]
    ldr.w	r8, [sp, #24]
    str.w	fp, [sp, #36]
    mov	r7, r4
    mov.w	r9, #16384
    mov.w	sl, #1
    b.n .Lcode_11382
.Lcode_11374:
    add.w	r2, sp, #1096
    adds	r7, #1
    strh.w	sl, [r2, r4]
    adds	r4, #2
    cmp	r7, #8
    strh.w	r9, [r8, #24]
    add.w	r8, r8, #2
    beq.n .Lcode_11441
.Lcode_11382:
    adds	r1, r6, r4
    adds	r3, r5, r4
    mov	ip, r1
    mov	lr, r3
    ldrsh	r0, [r6, r4]
    ldrsh	r2, [r5, r4]
    cmp	r7, #0
    beq.n .Lcode_11460
    ldrsh.w	r1, [r1, #-2]
    ldrsh.w	r3, [r3, #-2]
    cmp	r7, #7
    add	r0, r1
    add	r2, r3
    bne.n .Lcode_11460
.Lcode_11396:
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    uxth	r3, r3
    sxth.w	lr, r3
    mov	r1, r0
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    lsls.w	r2, r2, lr
    beq.n .Lcode_11374
    ldr.w	fp, [sp, #28]
    uxth	r1, r1
    sxth.w	ip, r1
    rsb	r1, r1, fp
    ldr.w	fp, [sp, #36]
    rsb	r3, r3, fp
    str	r3, [sp, #32]
    add.w	r3, sp, #1096
    ldr.w	fp, [sp, #32]
    ldrsh.w	lr, [r3, r4]
    add.w	r3, sp, #1152
    str	r3, [sp, #0]
    lsl.w	r0, r0, ip
    asrs	r2, r2, #16
    sxth.w	r3, fp
    sxth	r1, r1
    str.w	lr, [sp, #1152]
    bl .Lcode_6721
    ldr.w	r3, [sp, #1152]
    strh.w	r0, [r8, #24]
    add.w	ip, sp, #1096
    adds	r7, #1
    strh.w	r3, [ip, r4]
    adds	r4, #2
    cmp	r7, #8
    add.w	r8, r8, #2
    bne.n .Lcode_11382
.Lcode_11441:
    ldr	r0, [sp, #44]
    ldr.w	fp, [sp, #36]
    add.w	r2, sp, #1096
    mov	r3, r7
    mov	r1, r0
    bl .Lcode_18680
    ldr	r4, [sp, #24]
    ldrsh.w	r2, [r4, #2]
    strh.w	fp, [r4, #18]
    uxth	r3, r0
    cmp	r2, #0
    strh.w	r3, [r4, #72]
    ble.n .Lcode_11457
    ldrsh.w	r2, [r4]
    cmp	r2, #0
    blt.n .Lcode_11465
.Lcode_11457:
    add	sp, #140
    add.w	sp, sp, #1024
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_11460:
    ldrsh.w	r3, [ip, #2]
    ldrsh.w	r1, [lr, #2]
    adds	r0, r0, r3
    adds	r2, r2, r1
    b.n .Lcode_11396
.Lcode_11465:
    ldrsh.w	r2, [r4, #20]
    sxth.w	fp, fp
    cmp	r2, fp
    bgt.n .Lcode_11457
    beq.n .Lcode_11530
.Lcode_11470:
    ldr	r5, [sp, #24]
    ldr	r7, [sp, #24]
    ldrsh.w	r9, [r5, #74]
    sxth	r1, r3
    cmp	r1, r9
    ite	ge
    movge	ip, r1
    movlt	ip, r9
    add.w	ip, ip, #1
    rsb	r5, ip, r9
    rsb	r6, ip, r1
    add.w	r3, r7, #22
    rsb	r8, r1, ip
    rsb	r7, r9, r1
    rsb	ip, r9, ip
    movs	r2, #8
    rsb	r9, r1, r9
    b.n .Lcode_11499
.Lcode_11488:
    ldrsh.w	r0, [r3, #16]
    lsls.w	r4, r1, r6
    lsls	r0, r0, #16
    cmp	r5, #0
    blt.n .Lcode_11508
.Lcode_11493:
    lsls	r0, r5
    subs	r0, r4, r0
    cmp	r0, #0
    blt.n .Lcode_11512
.Lcode_11497:
    subs	r2, #1
    beq.n .Lcode_11457
.Lcode_11499:
    ldrsh.w	r1, [r3, #2]!
    lsls	r1, r1, #16
    cmp	r6, #0
    bge.n .Lcode_11488
    ldrsh.w	r0, [r3, #16]
    lsls	r0, r0, #16
    cmp	r5, #0
    asr.w	r4, r1, r8
    bge.n .Lcode_11493
.Lcode_11508:
    asr.w	r0, r0, ip
    subs	r0, r4, r0
    cmp	r0, #0
    bge.n .Lcode_11497
.Lcode_11512:
    cmp	r7, #0
    blt.n .Lcode_11528
    lsls	r1, r7
.Lcode_11515:
    asrs	r1, r1, #16
    strh	r1, [r3, #16]
    b.n .Lcode_11497
.Lcode_11518:
    rsb	r2, r2, #1
    asrs.w	r5, r3, r2
    b.n .Lcode_11231
.Lcode_11521:
    negs	r5, r3
    adds	r2, #31
    lsls	r1, r2
    lsrs	r0, r5
    orrs	r0, r1
    rsb	r3, r3, r4, lsl #1
    b.n .Lcode_11268
.Lcode_11528:
    asr.w	r1, r1, r9
    b.n .Lcode_11515
.Lcode_11530:
    ldrsh.w	r1, [r4, #12]
    ldrsh.w	r2, [r4, #14]
    cmp	r1, r2
    bge.n .Lcode_11470
    b.n .Lcode_11457
.Lcode_11535:
.global asm_correlate_window_40
.type asm_correlate_window_40, %function
.thumb_func
asm_correlate_window_40:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #188
    add.w	r9, sp, #184
    mov	r5, r1
    str.w	r2, [r9, #-124]!
    mov	r4, r3
    str	r0, [sp, #56]
    movs	r2, #80
    mov	r0, r5
    mov	r3, r9
    bl .Lcode_7675
    add	r0, sp, #144
    add.w	r2, r5, #78
    add.w	r8, r4, #78
    str	r0, [sp, #4]
    mov	ip, r4
    add	r3, sp, #64
    nop
.Lcode_11553:
    ldrh.w	r6, [r2], #-2
    ldrh.w	r0, [ip], #2
    ldrh.w	r1, [r2, #82]
    ldrh.w	r4, [r5], #2
    smulbb	lr, r1, r0
    ldrh.w	r1, [r8], #-2
    ldrh.w	r7, [r5, #78]
    smulbb	r0, r4, r0
    smulbb	r6, r6, r1
    smlabb	r1, r7, r1, lr
    subs	r0, r0, r6
    asrs	r0, r0, #16
    asrs	r1, r1, #16
    ldr	r4, [sp, #4]
    strh	r0, [r3, #0]
    strh	r1, [r3, #2]
    adds	r3, #4
    cmp	r4, r3
    bne.n .Lcode_11553
    add	r0, sp, #64
    mov	r1, r0
    movs	r2, #40
    mov	r3, r9
    bl .Lcode_7675
    ldr	r4, [sp, #56]
    mov.w	sl, #1
    add	r1, sp, #144
    mov.w	fp, #61
    movs	r0, #20
    ldr	r6, .Lliteral_11804
    str.w	fp, [sp, #8]
    str	r4, [sp, #16]
    mov	fp, sl
    str	r0, [sp, #12]
    str	r1, [sp, #20]
    mov	sl, r1
.Lcode_11589:
    ldr	r0, [sp, #12]
    add	r4, sp, #64
    rsb	r2, r0, #159
    mov.w	r8, #0
    mov.w	r9, #0
.Lcode_11594:
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, fp
    it	mi
    addmi	r2, #160
    smlald	r8, r9, r5, r7
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, fp
    smlald	r8, r9, r5, r7
    it	mi
    addmi	r2, #160
    cmp	r4, sl
    bne.n .Lcode_11594
    adds.w	r8, r8, r8
    adc.w	r9, r9, r9
    orrs.w	r1, r8, r9
    beq.w .Lcode_11873
    mov.w	r2, r9, asr #31
    str	r2, [sp, #24]
    str	r2, [sp, #28]
    ldrd	r0, r1, [sp, #24]
    eor.w	r0, r0, r8
    eor.w	r1, r1, r9
    ldrd	r2, r3, [sp, #24]
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cmp	r3, #0
    beq.w .Lcode_11898
    sxth	r3, r3
    clz	r3, r3
    rsb	r1, r3, #33
    rsb	r3, r1, #32
    sub.w	r0, r1, #32
    lsl.w	r4, r9, r3
    lsr.w	r2, r8, r1
    asr.w	r3, r9, r0
    orrs	r2, r4
    ands.w	r2, r2, r0, asr #32
    it	cc
    movcc	r2, r3
    movw	r3, #26214
    smultb	r2, r2, r3
    uxtb	r3, r1
    ubfx	r1, r2, #15, #16
.Lcode_11640:
    ldr	r0, [sp, #16]
    ldr	r4, [sp, #8]
    strh	r1, [r0, #0]
    ldr	r1, [sp, #20]
    add.w	r2, r4, #120
    strb	r3, [r1, #0]
    ldr	r3, [sp, #8]
    cmp	r2, #159
    it	gt
    subgt.w	r2, r4, #40
    adds	r3, #41
    cmp	r3, #159
    add.w	ip, fp, #2
    str	r3, [sp, #12]
    ble.n .Lcode_11658
    ldr	r4, [sp, #8]
    subs	r4, #119
    str	r4, [sp, #12]
.Lcode_11658:
    rsb	r2, r2, #159
    add	r4, sp, #64
    mov.w	r8, #0
    mov.w	r9, #0
.Lcode_11662:
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    it	mi
    addmi	r2, #160
    smlaldx	r8, r9, r5, r7
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    smlaldx	r8, r9, r5, r7
    it	mi
    addmi	r2, #160
    cmp	r4, sl
    bne.n .Lcode_11662
    adds.w	r8, r8, r8
    adc.w	r9, r9, r9
    movs	r3, #0
    orrs.w	r0, r8, r9
    mov	r1, r3
    beq.n .Lcode_11710
    mov.w	r1, r9, asr #31
    str	r1, [sp, #32]
    str	r1, [sp, #36]
    ldrd	r0, r1, [sp, #32]
    eor.w	r0, r0, r8
    eor.w	r1, r1, r9
    ldrd	r2, r3, [sp, #32]
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cmp	r3, #0
    beq.w .Lcode_11887
    sxth	r3, r3
    clz	r3, r3
    rsb	r1, r3, #33
    rsb	r3, r1, #32
    sub.w	r0, r1, #32
    lsl.w	r4, r9, r3
    lsr.w	r2, r8, r1
    asr.w	r3, r9, r0
    orrs	r2, r4
    ands.w	r2, r2, r0, asr #32
    it	cc
    movcc	r2, r3
    movw	r3, #26214
    smultb	r2, r2, r3
    uxtb	r3, r1
    ubfx	r1, r2, #15, #16
.Lcode_11710:
    ldr	r0, [sp, #16]
    ldr	r4, [sp, #12]
    strh	r1, [r0, #2]
    ldr	r1, [sp, #20]
    add.w	r2, r4, #80
    strb	r3, [r1, #1]
    ldr	r3, [sp, #12]
    cmp	r2, #159
    it	gt
    subgt.w	r2, r4, #80
    adds	r3, #41
    cmp	r3, #159
    add.w	ip, fp, #4
    str	r3, [sp, #8]
    ble.n .Lcode_11728
    ldr	r4, [sp, #12]
    subs	r4, #119
    str	r4, [sp, #8]
.Lcode_11728:
    rsb	r2, r2, #159
    add	r4, sp, #64
    mov.w	r8, #0
    mov.w	r9, #0
    nop
.Lcode_11733:
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    it	mi
    addmi	r2, #160
    smlald	r8, r9, r5, r7
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    smlald	r8, r9, r5, r7
    it	mi
    addmi	r2, #160
    cmp	r4, sl
    bne.n .Lcode_11733
    adds.w	r8, r8, r8
    adc.w	r9, r9, r9
    movs	r3, #0
    orrs.w	r0, r8, r9
    mov	r1, r3
    beq.n .Lcode_11781
    mov.w	r1, r9, asr #31
    str	r1, [sp, #40]
    str	r1, [sp, #44]
    ldrd	r0, r1, [sp, #40]
    eor.w	r0, r0, r8
    eor.w	r1, r1, r9
    ldrd	r2, r3, [sp, #40]
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cmp	r3, #0
    beq.w .Lcode_11909
    sxth	r3, r3
    clz	r3, r3
    rsb	r1, r3, #33
    rsb	r3, r1, #32
    sub.w	r0, r1, #32
    lsl.w	r4, r9, r3
    lsr.w	r2, r8, r1
    asr.w	r3, r9, r0
    orrs	r2, r4
    ands.w	r2, r2, r0, asr #32
    it	cc
    movcc	r2, r3
    movw	r3, #26214
    smultb	r2, r2, r3
    uxtb	r3, r1
    ubfx	r1, r2, #15, #16
.Lcode_11781:
    ldr	r0, [sp, #16]
    ldr	r4, [sp, #8]
    strh	r1, [r0, #4]
    ldr	r1, [sp, #20]
    add.w	r2, r4, #40
    strb	r3, [r1, #2]
    ldr	r3, [sp, #8]
    cmp	r2, #159
    it	gt
    subgt.w	r2, r4, #120
    adds	r3, #41
    cmp	r3, #159
    add.w	ip, fp, #6
    str	r3, [sp, #12]
    ble.n .Lcode_11799
    ldr	r4, [sp, #8]
    subs	r4, #119
    str	r4, [sp, #12]
.Lcode_11799:
    rsb	r2, r2, #159
    add	r4, sp, #64
    mov.w	r8, #0
    mov.w	r9, #0
    b.n .Lcode_11805
.Lliteral_11804:
    .word .Ldata_20659
.Lcode_11805:
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    it	mi
    addmi	r2, #160
    smlaldx	r8, r9, r5, r7
    ldr.w	r5, [r4], #4
    ldr.w	r7, [r6, r2, lsl #2]
    subs.w	r2, r2, ip
    smlaldx	r8, r9, r5, r7
    it	mi
    addmi	r2, #160
    cmp	r4, sl
    bne.n .Lcode_11805
    adds.w	r8, r8, r8
    adc.w	r9, r9, r9
    movs	r3, #0
    orrs.w	r0, r8, r9
    mov	r2, r3
    beq.n .Lcode_11853
    mov.w	r1, r9, asr #31
    str	r1, [sp, #48]
    str	r1, [sp, #52]
    ldrd	r0, r1, [sp, #48]
    eor.w	r0, r0, r8
    eor.w	r1, r1, r9
    ldrd	r2, r3, [sp, #48]
    subs	r0, r0, r2
    sbc.w	r1, r1, r3
    uxth	r3, r1
    cmp	r3, #0
    beq.n .Lcode_11876
    sxth	r3, r3
    clz	r3, r3
    rsb	r1, r3, #33
    rsb	r3, r1, #32
    sub.w	r0, r1, #32
    lsl.w	r4, r9, r3
    lsr.w	r2, r8, r1
    asr.w	r3, r9, r0
    orrs	r2, r4
    ands.w	r2, r2, r0, asr #32
    it	cc
    movcc	r2, r3
    movw	r3, #26214
    smultb	r2, r2, r3
    uxtb	r3, r1
    ubfx	r2, r2, #15, #16
.Lcode_11853:
    ldr	r4, [sp, #16]
    ldr	r0, [sp, #20]
    add.w	fp, fp, #8
    strh	r2, [r4, #6]
    adds	r4, #8
    strb	r3, [r0, #3]
    adds	r0, #4
    cmp.w	fp, #81
    str	r4, [sp, #16]
    str	r0, [sp, #20]
    beq.n .Lcode_11920
    ldr	r3, [sp, #12]
    adds	r3, #41
    cmp	r3, #159
    str	r3, [sp, #8]
    ble.w .Lcode_11589
    ldr	r4, [sp, #12]
    subs	r4, #119
    str	r4, [sp, #8]
    b.n .Lcode_11589
.Lcode_11873:
    movs	r3, #0
    mov	r1, r3
    b.n .Lcode_11640
.Lcode_11876:
    cmp	r0, #0
    blt.n .Lcode_11963
    clz	r0, r0
    subs	r0, #1
    lsl.w	r3, r8, r0
    movw	r1, #26214
    smultb	r3, r3, r1
    negs	r0, r0
    ubfx	r2, r3, #15, #16
    uxtb	r3, r0
    b.n .Lcode_11853
.Lcode_11887:
    cmp	r0, #0
    blt.n .Lcode_11977
    clz	r0, r0
    subs	r0, #1
    lsl.w	r3, r8, r0
    movw	r1, #26214
    smultb	r3, r3, r1
    negs	r0, r0
    ubfx	r1, r3, #15, #16
    uxtb	r3, r0
    b.n .Lcode_11710
.Lcode_11898:
    cmp	r0, #0
    blt.n .Lcode_11970
    clz	r0, r0
    subs	r0, #1
    lsl.w	r3, r8, r0
    movw	r1, #26214
    smultb	r3, r3, r1
    negs	r0, r0
    ubfx	r1, r3, #15, #16
    uxtb	r3, r0
    b.n .Lcode_11640
.Lcode_11909:
    cmp	r0, #0
    blt.n .Lcode_11984
    clz	r0, r0
    subs	r0, #1
    lsl.w	r3, r8, r0
    movw	r1, #26214
    smultb	r3, r3, r1
    negs	r0, r0
    ubfx	r1, r3, #15, #16
    uxtb	r3, r0
    b.n .Lcode_11781
.Lcode_11920:
    ldr	r4, [sp, #56]
    mvn.w	r2, #31
    subs	r1, r4, #2
    movs	r3, #0
.Lcode_11924:
    ldrsh.w	r0, [r1, #2]!
    cbz	r0, .Lcode_11931
    add	r4, sp, #144
    ldrsb	r0, [r4, r3]
    cmp	r2, r0
    it	lt
    movlt	r2, r0
.Lcode_11931:
    adds	r3, #1
    cmp	r3, #40
    bne.n .Lcode_11924
    cmn.w	r2, #32
    it	eq
    moveq	r0, r2
    beq.n .Lcode_11961
    ldr	r3, [sp, #56]
    add.w	r0, sp, #143
    add.w	r6, r3, #80
    b.n .Lcode_11947
.Lcode_11942:
    lsls.w	r1, r4, r5
    asrs	r1, r1, #16
    cmp	r3, r6
    strh.w	r1, [r3, #-2]
    beq.n .Lcode_11958
.Lcode_11947:
    ldrsh.w	r4, [r3], #2
    ldrsb.w	r1, [r0, #1]!
    lsls	r4, r4, #16
    subs	r5, r1, r2
    bpl.n .Lcode_11942
    subs	r1, r2, r1
    asrs.w	r1, r4, r1
    asrs	r1, r1, #16
    cmp	r3, r6
    strh.w	r1, [r3, #-2]
    bne.n .Lcode_11947
.Lcode_11958:
    ldr	r0, [sp, #60]
    subs	r0, #4
    adds	r0, r0, r2
.Lcode_11961:
    add	sp, #188
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_11963:
    asrs.w r3, r9, #1
    mov.w	r2, r8, rrx
    movw	r4, #26214
    smultb	r2, r2, r4
    movs	r3, #1
    ubfx	r2, r2, #15, #16
    b.n .Lcode_11853
.Lcode_11970:
    asrs.w r3, r9, #1
    mov.w	r2, r8, rrx
    movw	r4, #26214
    smultb	r2, r2, r4
    movs	r3, #1
    ubfx	r1, r2, #15, #16
    b.n .Lcode_11640
.Lcode_11977:
    asrs.w r3, r9, #1
    mov.w	r2, r8, rrx
    movw	r4, #26214
    smultb	r2, r2, r4
    movs	r3, #1
    ubfx	r1, r2, #15, #16
    b.n .Lcode_11710
.Lcode_11984:
    asrs.w r3, r9, #1
    mov.w	r2, r8, rrx
    movw	r4, #26214
    smultb	r2, r2, r4
    movs	r3, #1
    ubfx	r1, r2, #15, #16
    b.n .Lcode_11781
    .byte 0x00
    .byte 0xbf
.Lcode_11991:
.global asm_align_two_i32_sums
.type asm_align_two_i32_sums, %function
.thumb_func
asm_align_two_i32_sums:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    sub	sp, #8
    add	r4, sp, #8
    mov	r5, r3
    str.w	r3, [r4, #-8]!
    ldr	r3, [sp, #32]
    add.w	r3, r2, r3, lsl #2
    mov	r6, r2
    mov	r7, r0
    mov	r2, sp
    mov	r0, r3
    mov	r4, r1
    movs	r1, #5
    bl .Lcode_7468
    add	r2, sp, #8
    mov	r8, r0
    ldr	r0, [sp, #36]
    str.w	r5, [r2, #-4]!
    movs	r1, #5
    add.w	r0, r6, r0, lsl #2
    bl .Lcode_7468
    ldmia.w	sp, {r1, r2}
    cmp	r1, r2
    ite	ge
    movge	r3, r1
    movlt	r3, r2
    subs	r5, r1, r3
    itet	mi
    rsbmi	r1, r1, r3
    lslpl.w	r8, r8, r5
    asrmi.w	r8, r8, r1
    subs	r1, r2, r3
    bmi.n .Lcode_12032
    lsls.w	r2, r0, r1
.Lcode_12025:
    mov.w	r8, r8, asr #16
    asrs	r2, r2, #16
    strh.w	r8, [r7]
    mov	r0, r3
    strh	r2, [r4, #0]
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_12032:
    subs	r2, r3, r2
    asrs.w	r2, r0, r2
    b.n .Lcode_12025
.Lcode_12035:
.global asm_log_amplitude_clamped
.type asm_log_amplitude_clamped, %function
.thumb_func
asm_log_amplitude_clamped:
    cmn.w	r1, #59
    push	{r4, lr}
    mov	r4, r2
    blt.n .Lcode_12040
    cbnz	r0, .Lcode_12043
.Lcode_12040:
    mov.w	r0, #60416
.Lcode_12041:
    sxth	r0, r0
    pop	{r4, pc}
.Lcode_12043:
    adds	r1, #30
    movs	r2, #5
    bl .Lcode_6854
    adds	r4, r0, r4
    sxth	r4, r4
    cmp.w	r4, #30720
    ble.n .Lcode_12053
    mov.w	r0, #30720
    sxth	r0, r0
    pop	{r4, pc}
.Lcode_12053:
    mov.w	r3, #60416
    movt	r3, #65535
    cmp	r4, r3
    it	ge
    movge	r3, r4
    uxth	r0, r3
    b.n .Lcode_12041
.Lcode_12060:
.global asm_test_weighted_curvature
.type asm_test_weighted_curvature, %function
.thumb_func
asm_test_weighted_curvature:
    adds	r2, #8
    stmdb	sp!, {r4, r5, r6, r7, r8, r9}
    mov	r6, r2
    movs	r5, #0
    movs	r4, #4
.Lcode_12065:
    ldrsh.w	r7, [r6], #-2
    mul.w	r7, r4, r7
    subs	r4, #1
    add.w	r5, r5, r7, lsl #1
    bne.n .Lcode_12065
    mov	r9, r5
    cmp.w	r9, #0
    it	lt
    mvnlt.w	r9, r9
    itt	ne
    clzne	r9, r9
    subne.w	r9, r9, #1
    uxth.w	r9, r9
    sxth.w	r8, r9
    add.w	ip, r3, #15
    lsl.w	r5, r5, r8
    uxth.w	ip, ip
    smultt	r5, r5, r5
    rsb	r9, r9, ip
    mov.w	r8, r5, lsl #1
    uxth.w	r9, r9
    mov	r5, r4
    movs	r4, #4
.Lcode_12088:
    ldrh.w	r6, [r2], #-2
    mul.w	r7, r4, r4
    smulbb	r6, r7, r6
    subs	r4, #1
    add.w	r5, r5, r6, lsl #1
    bne.n .Lcode_12088
    mov	r3, r5
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    uxth	r3, r3
    sxth	r2, r3
    lsls.w	r2, r5, r2
    lsrs	r2, r2, #16
    sxth.w	r9, r9
    rsb	r3, r3, ip
    sxtah	r3, r1, r3
    mov.w	r9, r9, lsl #1
    smulbb	r2, r2, r0
    lsls	r2, r2, #1
    subs.w	r4, r9, r3
    it	pl
    lslpl.w	r8, r8, r4
    movw	r4, #19661
    smulbb	r4, r0, r4
    it	mi
    rsbmi	r9, r9, r3
    ubfx	r4, r4, #15, #16
    it	mi
    asrmi.w	r8, r8, r9
    smulbb	r0, r0, r4
    lsls	r1, r1, #1
    rsb	r8, r8, r2
    lsls	r0, r0, #1
    subs	r2, r1, r3
    bmi.n .Lcode_12134
    lsls	r0, r2
.Lcode_12128:
    cmp	r8, r0
    ite	ge
    movge	r0, #0
    movlt	r0, #1
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9}
    bx	lr
.Lcode_12134:
    subs	r1, r3, r1
    asrs	r0, r1
    b.n .Lcode_12128
    .byte 0x00
    .byte 0xbf
.Lcode_12137:
.global asm_test_weighted_spectral_threshold
.type asm_test_weighted_spectral_threshold, %function
.thumb_func
asm_test_weighted_spectral_threshold:
    cmp	r2, #0
    push	{r4, r5, r6}
    ble.n .Lcode_12171
    adds	r0, #8
    movs	r5, #0
    movs	r4, #4
.Lcode_12143:
    ldrsh.w	r6, [r0], #-2
    mul.w	r6, r4, r6
    subs	r4, #1
    add.w	r5, r5, r6, lsl #1
    bne.n .Lcode_12143
    subs	r0, r1, r3
    bmi.n .Lcode_12173
    lsls	r5, r0
.Lcode_12151:
    ldr	r0, [sp, #16]
    ldrsh.w	r4, [sp, #12]
    mul.w	r0, r0, r2
    mul.w	r2, r2, r4
    add.w	r5, r5, r0, lsl #1
    sbfx	r2, r2, #8, #23
    subs	r5, r5, r2
    bmi.n .Lcode_12169
.Lcode_12159:
    ldr	r3, [sp, #20]
    smull	r2, r3, r3, r2
    lsrs	r2, r2, #15
    orr.w	r2, r2, r3, lsl #17
    cmp.w	r5, r2, asr #5
    ite	ge
    movge	r0, #0
    movlt	r0, #1
.Lcode_12167:
    pop	{r4, r5, r6}
    bx	lr
.Lcode_12169:
    cmp.w	r5, #2147483648
    bne.n .Lcode_12176
.Lcode_12171:
    movs	r0, #0
    b.n .Lcode_12167
.Lcode_12173:
    subs	r3, r3, r1
    asrs	r5, r3
    b.n .Lcode_12151
.Lcode_12176:
    negs	r5, r5
    b.n .Lcode_12159
    .byte 0x00
    .byte 0xbf
.Lcode_12178:
.global asm_test_two_spectral_neighborhoods
.type asm_test_two_spectral_neighborhoods, %function
.thumb_func
asm_test_two_spectral_neighborhoods:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #52
    mov	r5, r3
    ldr.w	r8, [sp, #92]
    ldr	r4, [sp, #88]
    ldr.w	sl, [sp, #100]
    ldrsh.w	r7, [sp, #108]
    str	r4, [sp, #40]
    add.w	lr, r3, r8, lsl #2
    mov	r9, r0
    mov	r6, r2
    add	r0, sp, #16
    movs	r2, #5
    add	r3, sp, #40
    mov	fp, r1
    mov	r1, lr
    bl .Lcode_7763
    add.w	r1, r5, sl, lsl #2
    add	r0, sp, #28
    movs	r2, #5
    add	r3, sp, #44
    str	r4, [sp, #44]
    bl .Lcode_7763
    ldrsh.w	r3, [sp, #96]
    str	r7, [sp, #8]
    stmia.w	sp, {r3, r8}
    add	r0, sp, #16
    ldr	r1, [sp, #40]
    mov	r2, r9
    mov	r3, r6
    bl .Lcode_12137
    cbz	r0, .Lcode_12221
    ldrsh.w	r3, [sp, #104]
    str	r7, [sp, #8]
    stmia.w	sp, {r3, sl}
    add	r0, sp, #28
    ldr	r1, [sp, #44]
    mov	r2, fp
    mov	r3, r6
    bl .Lcode_12137
    adds	r0, #0
    it	ne
    movne	r0, #1
.Lcode_12221:
    sxth	r0, r0
    add	sp, #52
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_12224:
.global asm_select_maximum_five_sum
.type asm_select_maximum_five_sum, %function
.thumb_func
asm_select_maximum_five_sum:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs	r5, #0
    mov	r6, r0
    mov	sl, r1
    mov	r4, r2
    mov	r9, r3
    mov	r7, r5
    mov	r8, r5
.Lcode_12232:
    ldrb.w	r0, [r9, r7]
    movs	r1, #5
    movs	r2, #3
    add.w	r0, r4, r0, lsl #2
    bl .Lcode_19260
    cmp	r0, r8
    itt	ge
    movge	r5, r7
    movge	r8, r0
    adds	r7, #1
    cmp	r7, #4
    bne.n .Lcode_12232
    str.w	r8, [r6]
    str.w	r5, [sl]
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_12247:
.global asm_classify_spectral_frame
.type asm_classify_spectral_frame, %function
.thumb_func
asm_classify_spectral_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #108
    add	r6, sp, #104
    mov	r4, r1
    str.w	r2, [r6, #-36]!
    movs	r1, #128
    mov	r5, r2
    mov	r9, r0
    mov	r2, r6
    mov	r0, r4
    str	r3, [sp, #24]
    bl .Lcode_7468
    lsrs.w r8, r0, #16
    bne.n .Lcode_12265
.Lcode_12261:
    movs	r6, #255
.Lcode_12262:
    mov	r0, r6
    add	sp, #108
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_12265:
    ldr.w	sl, [sp, #68]
    cmn.w	sl, #26
    blt.n .Lcode_12261
    ldr	r6, [sp, #144]
    ldr.w	fp, .Lliteral_12540
    ldrsh.w	r6, [r6, #8]
    ldr	r7, .Lliteral_12533
    str	r6, [sp, #32]
    add	r0, sp, #72
    add	r1, sp, #80
    mov	r2, r4
    mov	r3, fp
    bl .Lcode_12224
    add	r0, sp, #76
    add	r1, sp, #84
    mov	r2, r4
    mov	r3, r7
    bl .Lcode_12224
    ldr	r3, [sp, #80]
    ldr	r2, [sp, #84]
    ldrb.w	r3, [fp, r3]
    ldrb	r6, [r7, r2]
    str	r3, [sp, #0]
    add.w	r1, sp, #98
    mov	r2, r4
    mov	r3, r5
    add	r0, sp, #96
    str	r6, [sp, #4]
    bl .Lcode_11991
    ldr	r2, [sp, #80]
    ldr	r3, [sp, #84]
    str	r0, [sp, #44]
    add.w	r1, r2, r3, lsl #2
    movw r0, #:lower16:(.Ldata_20746)
    and.w	r1, r1, #15
    movt r0, #:upper16:(.Ldata_20746)
    ldrb	r6, [r0, r1]
    ldr	r1, [sp, #32]
    adds	r6, #128
    cmp	r1, r6
    beq.w .Lcode_12530
    ldr	r1, .Lliteral_12534
    ldrb.w	fp, [fp, r2]
    ldrsh.w	r1, [r1, r2, lsl #1]
    ldr	r2, .Lliteral_12535
    ldrsh.w	ip, [sp, #98]
    ldrsh.w	lr, [r2, r3, lsl #1]
    str.w	fp, [sp, #4]
    ldrb.w	fp, [r7, r3]
    str	r1, [sp, #8]
    str.w	lr, [sp, #16]
    ldrsh.w	r0, [sp, #96]
    ldr	r2, [sp, #44]
    str	r5, [sp, #0]
    movw	lr, #20972
    mov	r1, ip
    mov	r3, r4
    str.w	fp, [sp, #12]
    str.w	lr, [sp, #20]
    bl .Lcode_12178
    cmp	r0, #1
    it	ne
    movne	r0, #0
    str	r0, [sp, #36]
.Lcode_12329:
    ldr.w	fp, .Lliteral_12541
    ldr	r7, .Lliteral_12536
    add	r0, sp, #72
    add	r1, sp, #88
    mov	r2, r4
    mov	r3, fp
    bl .Lcode_12224
    add	r0, sp, #76
    add	r1, sp, #92
    mov	r2, r4
    mov	r3, r7
    bl .Lcode_12224
    ldr	r3, [sp, #88]
    ldr	r2, [sp, #92]
    ldrb.w	r3, [fp, r3]
    ldrb.w	lr, [r7, r2]
    str	r3, [sp, #0]
    add.w	r1, sp, #102
    mov	r2, r4
    mov	r3, r5
    add	r0, sp, #100
    str.w	lr, [sp, #4]
    bl .Lcode_11991
    ldr	r2, [sp, #88]
    ldr	r3, [sp, #92]
    str	r0, [sp, #40]
    add.w	r1, r2, r3, lsl #2
    movw r0, #:lower16:(.Ldata_20746)
    and.w	r1, r1, #15
    movt r0, #:upper16:(.Ldata_20746)
    ldrb.w	ip, [r0, r1]
    ldr	r1, [sp, #32]
    add.w	ip, ip, #144
    cmp	r1, ip
    beq.w .Lcode_12556
    ldrsh.w	r1, [sp, #102]
    ldrb.w	fp, [fp, r2]
    str	r1, [sp, #32]
    ldr	r1, .Lliteral_12537
    str.w	fp, [sp, #4]
    ldrsh.w	r1, [r1, r2, lsl #1]
    ldr	r2, .Lliteral_12538
    ldrb.w	fp, [r7, r3]
    ldrsh.w	lr, [r2, r3, lsl #1]
    str	r1, [sp, #8]
    str.w	lr, [sp, #16]
    ldrsh.w	r0, [sp, #100]
    ldr	r1, [sp, #32]
    ldr	r2, [sp, #40]
    str.w	ip, [sp, #28]
    movw	lr, #16777
    mov	r3, r4
    str	r5, [sp, #0]
    str.w	fp, [sp, #12]
    str.w	lr, [sp, #20]
    bl .Lcode_12178
    ldr.w	ip, [sp, #28]
    cmp	r0, #1
    it	ne
    movne	r0, #0
.Lcode_12389:
    ldr	r7, [sp, #36]
    cmp	r7, #0
    beq.w .Lcode_12542
    cmp	r0, #0
    bne.w .Lcode_12776
.Lcode_12394:
    ldrh.w	r0, [sp, #96]
    ldrh.w	r3, [sp, #98]
.Lcode_12396:
    sxth	r0, r0
    sxth	r3, r3
    mov.w	lr, r0, lsl #16
    add.w	r2, r3, r3, lsl #2
    mov.w	r1, lr, asr #4
    lsls	r2, r2, #13
    cmp	r1, r2
    str	r1, [sp, #72]
    str	r2, [sp, #76]
    ble.w .Lcode_12653
.Lcode_12406:
    ldr	r6, [sp, #144]
    ldr	r7, [sp, #68]
    ldrh	r3, [r6, #8]
    str	r7, [sp, #44]
    cmp	r3, #255
    beq.w .Lcode_12558
    uxth	r2, r3
    subs	r1, r2, #5
    uxth	r1, r1
    cmp	r1, #117
    bls.w .Lcode_12558
.Lcode_12417:
    subs	r2, #160
    uxth	r2, r2
    cmp	r2, #3
    bhi.w .Lcode_12722
    sxth	r3, r3
    subs	r3, #160
    str	r3, [sp, #32]
    ldr	r3, .Lliteral_12539
    str	r3, [sp, #36]
.Lcode_12426:
    ldr	r6, [sp, #32]
    ldr	r7, [sp, #36]
    str	r5, [sp, #92]
    ldrb.w	sl, [r7, r6, lsl #1]
    str	r5, [sp, #88]
    lsls	r6, r6, #1
    movs	r1, #5
    add	r2, sp, #88
    adds	r6, r7, r6
    add.w	r0, r4, sl, lsl #2
    bl .Lcode_7468
    ldrb.w	fp, [r6, #1]
    str	r0, [sp, #40]
    movs	r1, #5
    add	r2, sp, #92
    add.w	r0, r4, fp, lsl #2
    bl .Lcode_7468
    ldr	r1, [sp, #88]
    ldr	r2, [sp, #92]
    cmp	r1, r2
    ite	ge
    movge	r3, r1
    movlt	r3, r2
    subs	r6, r1, r3
    bmi.w .Lcode_12772
    ldr	r7, [sp, #40]
    lsls.w	r1, r7, r6
.Lcode_12453:
    subs	r6, r2, r3
    bmi.w .Lcode_12769
    lsls	r0, r6
.Lcode_12456:
    asrs	r0, r0, #16
    asrs	r1, r1, #16
    lsls	r3, r0, #15
    cmp.w	r3, r1, lsl #13
    blt.w .Lcode_12261
    lsls	r1, r1, #15
    cmp.w	r1, r0, lsl #13
    blt.w .Lcode_12261
    rsb	r7, sl, fp
    adds	r1, r7, #7
    add.w	r0, sl, #4294967295
    sxth	r1, r1
    add	r2, sp, #84
    add.w	r0, r4, r0, lsl #2
    str	r7, [sp, #40]
    str	r5, [sp, #84]
    bl .Lcode_7468
    ldr	r1, [sp, #84]
    ldr	r2, [sp, #24]
    asrs	r0, r0, #16
    str	r0, [sp, #36]
    bl .Lcode_12035
    ldr	r7, [sp, #32]
    ldr	r3, [sp, #84]
    str	r0, [sp, #48]
    add.w	r6, r7, #160
    ldr	r7, [sp, #36]
    lsls	r2, r7, #16
    ldr	r7, [sp, #44]
    subs	r1, r3, r7
    mov	ip, r0
    mov.w	r8, r8, lsl #16
    bmi.w .Lcode_12856
    lsls	r2, r1
.Lcode_12490:
    subs.w	r8, r8, r2
    bmi.w .Lcode_12851
.Lcode_12492:
    ldr	r3, [sp, #44]
    ldr	r2, [sp, #24]
    str.w	ip, [sp, #28]
    mov	r1, r8
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsl.w	r0, r8, r1
    asrs	r0, r0, #16
    subs	r1, r3, r1
    bl .Lcode_12035
    mov	r7, r0
    ldr	r0, [sp, #144]
    ldr.w	ip, [sp, #28]
    ldrsh.w	r3, [r0, #8]
    cmp	r6, r3
    beq.w .Lcode_12835
.Lcode_12513:
    mov.w	r8, ip, lsl #16
    movw	r3, #65535
    sub.w	r2, r8, r7, lsl #16
    movt	r3, #9183
    cmp	r2, r3
    ble.w .Lcode_12261
    ldr	r3, [sp, #40]
    cmp	r3, #3
    ble.w .Lcode_12876
.Lcode_12522:
    ldr	r0, [sp, #144]
    add.w	r3, r8, #4227858432
    lsrs	r3, r3, #16
    strh.w	r3, [r9]
    strh.w	r3, [r9, #2]
    strh.w	ip, [r0, #22]
    strh	r7, [r0, #24]
    b.n .Lcode_12262
.Lcode_12530:
    movs	r7, #1
    str	r7, [sp, #36]
    b.n .Lcode_12329
    .byte 0x00
    .byte 0xbf
.Lliteral_12533:
    .word .Ldata_20742
.Lliteral_12534:
    .word .Ldata_20745
.Lliteral_12535:
    .word .Ldata_20743
.Lliteral_12536:
    .word .Ldata_20738
.Lliteral_12537:
    .word .Ldata_20741
.Lliteral_12538:
    .word .Ldata_20739
.Lliteral_12539:
    .word .Ldata_20734
.Lliteral_12540:
    .word .Ldata_20744
.Lliteral_12541:
    .word .Ldata_20740
.Lcode_12542:
    cmp	r0, #0
    beq.w .Lcode_12406
.Lcode_12544:
    ldr	r2, [sp, #88]
    ldrh.w	r0, [sp, #100]
    ldrh.w	r3, [sp, #102]
    str	r2, [sp, #80]
    ldr	r7, [sp, #40]
    ldr	r2, [sp, #92]
    strh.w	r0, [sp, #96]
    strh.w	r3, [sp, #98]
    str	r2, [sp, #84]
    mov	r6, ip
    str	r7, [sp, #44]
    b.n .Lcode_12396
.Lcode_12556:
    movs	r0, #1
    b.n .Lcode_12389
.Lcode_12558:
    movs	r1, #118
    add.w	r0, r4, #20
    bl .Lcode_7445
    adds	r3, r0, #3
    add.w	r3, r4, r3, lsl #2
    movs	r1, #5
    mov	r6, r0
    add	r2, sp, #88
    mov	r0, r3
    str	r3, [sp, #36]
    adds	r6, r6, r1
    str	r5, [sp, #88]
    bl .Lcode_7468
    mov.w	sl, r0, asr #16
    ldr	r1, [sp, #88]
    ldr	r2, [sp, #24]
    mov	r0, sl
    bl .Lcode_12035
    ldr	r3, [sp, #88]
    ldr	r7, [sp, #44]
    str	r0, [sp, #32]
    mov	fp, r0
    subs	r0, r3, r7
    mov.w	r2, r8, lsl #16
    mov.w	r1, sl, lsl #16
    bmi.w .Lcode_12816
    lsls	r1, r0
.Lcode_12585:
    subs	r2, r2, r1
    bmi.w .Lcode_12820
.Lcode_12587:
    ldr	r3, [sp, #44]
    mov	r1, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r2, r1
    asrs	r0, r2, #16
    subs	r1, r3, r1
    ldr	r2, [sp, #24]
    bl .Lcode_12035
    ldr	r7, [sp, #144]
    ldrh	r3, [r7, #8]
    sxth	r2, r3
    cmp	r2, #4
    mov	ip, r0
    ble.n .Lcode_12633
    rsb	lr, r3, r6
    uxth.w	lr, lr
    sxth.w	r1, lr
    cmp	r1, #0
    blt.w .Lcode_12824
    cmp	r1, #1
    ite	gt
    movgt	r1, #0
    movle	r1, #1
.Lcode_12616:
    cbz	r1, .Lcode_12633
    ldr	r7, [sp, #144]
    ldrsh.w	r1, [r7, #22]
    ldrsh.w	ip, [r7, #24]
    rsb	lr, r1, r1, lsl #3
    rsb	r7, ip, ip, lsl #3
    rsb	r1, r1, lr, lsl #12
    rsb	ip, ip, r7, lsl #12
    lsls	r1, r1, #1
    mov.w	ip, ip, lsl #1
    add.w	r1, r1, fp, lsl #13
    add.w	ip, ip, r0, lsl #13
    add.w	r1, r1, #32768
    add.w	ip, ip, #32768
    lsrs	r1, r1, #16
    str	r1, [sp, #32]
    mov.w	ip, ip, lsr #16
.Lcode_12633:
    ldr	r7, [sp, #32]
    ldrsh.w	r1, [sp, #148]
    rsb	r0, ip, r7
    uxth	r0, r0
    cbz	r1, .Lcode_12640
    cmp	r2, #255
    beq.n .Lcode_12714
.Lcode_12640:
    sxth	r0, r0
    movw	r2, #6802
    cmp	r0, r2
    ble.n .Lcode_12710
    cmp	r6, #18
    bgt.n .Lcode_12692
    movw	r2, #8503
    cmp	r0, r2
    bgt.n .Lcode_12687
    ldr	r7, [sp, #68]
    uxth	r2, r3
    str	r7, [sp, #44]
    b.n .Lcode_12417
.Lcode_12653:
    lsls	r3, r3, #16
    add.w	r2, r0, r0, lsl #2
    asrs	r1, r3, #4
    lsls	r2, r2, #13
    cmp	r1, r2
    str	r1, [sp, #72]
    str	r2, [sp, #76]
    bgt.w .Lcode_12406
    sxth.w	r2, r8
    ldr	r7, [sp, #44]
    rsb	r2, r2, r2, lsl #6
    rsb	r2, r2, r2, lsl #6
    adds	r1, r7, #1
    asrs	r3, r3, #1
    lsls	r2, r2, #4
    subs.w	r1, r1, sl
    str	r2, [sp, #76]
    add.w	r3, r3, lr, asr #1
    bmi.w .Lcode_12830
    lsls	r3, r1
.Lcode_12673:
    cmp	r2, r3
    str	r3, [sp, #72]
    bgt.w .Lcode_12406
    ldr	r1, [sp, #44]
    ldr	r2, [sp, #24]
    bl .Lcode_12035
    ldrsh.w	r3, [sp, #98]
    strh.w	r0, [r9]
    ldr	r1, [sp, #44]
    ldr	r2, [sp, #24]
    mov	r0, r3
    bl .Lcode_12035
    strh.w	r0, [r9, #2]
    b.n .Lcode_12262
.Lcode_12687:
    cmp	r6, #10
    bgt.n .Lcode_12692
    movw	r2, #9864
    cmp	r0, r2
    ble.n .Lcode_12710
.Lcode_12692:
    add	r0, sp, #56
    ldr	r1, [sp, #36]
    str.w	ip, [sp, #28]
    movs	r2, #5
    add	r3, sp, #92
    str	r5, [sp, #92]
    bl .Lcode_7763
    ldr.w	fp, [sp, #88]
    ldrsh.w	r3, [sp, #92]
    sxth.w	r1, fp
    mov	r0, sl
    add	r2, sp, #56
    bl .Lcode_12060
    ldr.w	ip, [sp, #28]
    cmp	r0, #0
    bne.w .Lcode_12862
    ldr	r7, [sp, #144]
    ldrh	r3, [r7, #8]
.Lcode_12710:
    ldr	r6, [sp, #68]
    uxth	r2, r3
    str	r6, [sp, #44]
    b.n .Lcode_12417
.Lcode_12714:
    cmp	r6, #87
    ble.n .Lcode_12640
    sxth	r0, r0
    movw	r3, #10884
    cmp	r0, r3
    bgt.n .Lcode_12692
    ldr	r7, [sp, #68]
    str	r7, [sp, #44]
.Lcode_12722:
    ldr	r3, .Lliteral_12896
    ldr.w	fp, [sp, #24]
    str	r3, [sp, #36]
    movs	r6, #0
    str	r6, [sp, #32]
    mov	sl, r6
    mov.w	r3, #4294967295
    ldr	r6, [sp, #36]
    str.w	r9, [sp, #48]
    str.w	r8, [sp, #40]
    mov	r9, r3
    str	r5, [sp, #52]
.Lcode_12734:
    ldrb	r0, [r6, #0]
    ldrb	r7, [r6, #1]
    subs	r7, r7, r0
    mov.w	r8, r7, lsl #16
    add.w	r1, r8, #327680
    asrs	r1, r1, #16
    movs	r2, #3
    add.w	r0, r4, r0, lsl #2
    bl .Lcode_19260
    cmp	r7, #5
    mov	r5, r0
    bgt.n .Lcode_12760
.Lcode_12746:
    cmp	r5, r9
    it	ge
    strge.w	sl, [sp, #32]
    add.w	sl, sl, #1
    it	ge
    movge	r9, r5
    cmp.w	sl, #4
    add.w	r6, r6, #2
    bne.n .Lcode_12734
    ldr.w	r8, [sp, #40]
    ldr.w	r9, [sp, #48]
    ldr	r5, [sp, #52]
    str.w	fp, [sp, #24]
    b.n .Lcode_12426
.Lcode_12760:
    ldrb	r0, [r6, #0]
    sub.w	r1, r8, #327680
    adds	r0, #5
    asrs	r1, r1, #16
    add.w	r0, r4, r0, lsl #2
    movs	r2, #3
    bl .Lcode_19260
    subs	r5, r5, r0
    b.n .Lcode_12746
.Lcode_12769:
    subs	r3, r3, r2
    asrs	r0, r3
    b.n .Lcode_12456
.Lcode_12772:
    ldr	r6, [sp, #40]
    subs	r1, r3, r1
    asrs.w	r1, r6, r1
    b.n .Lcode_12453
.Lcode_12776:
    ldrsh.w	r3, [sp, #102]
    ldrsh.w	lr, [sp, #98]
    ldrsh.w	r1, [sp, #100]
    ldrsh.w	r2, [sp, #96]
    ldr	r7, [sp, #40]
    str.w	ip, [sp, #28]
    lsls	r3, r3, #15
    add.w	r1, r3, r1, lsl #15
    mov.w	lr, lr, lsl #15
    add.w	lr, lr, r2, lsl #15
    mov	r2, r1
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    lsl.w	fp, r1, r2
    mov	r3, lr
    subs	r1, r7, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    ldr	r7, [sp, #44]
    str.w	fp, [sp, #72]
    sxth	r3, r3
    lsl.w	lr, lr, r3
    mov.w	r0, fp, asr #16
    mov.w	r2, lr, asr #16
    subs	r3, r7, r3
    str.w	lr, [sp, #76]
    bl .Lcode_6768
    ldr.w	ip, [sp, #28]
    cmp	r0, #0
    bne.w .Lcode_12544
    b.n .Lcode_12394
.Lcode_12816:
    ldr	r7, [sp, #44]
    subs	r3, r7, r3
    asrs	r1, r3
    b.n .Lcode_12585
.Lcode_12820:
    cmp.w	r2, #2147483648
    beq.n .Lcode_12860
    negs	r2, r2
    b.n .Lcode_12587
.Lcode_12824:
    cmp.w	lr, #32768
    beq.w .Lcode_12633
    sub.w	r7, r1, #4294967295
    negs	r1, r7
    adc.w	r1, r1, r7
    b.n .Lcode_12616
.Lcode_12830:
    ldr	r7, [sp, #44]
    mvns	r1, r7
    add	sl, r1
    asr.w	r3, r3, sl
    b.n .Lcode_12673
.Lcode_12835:
    ldrsh.w	r1, [r0, #24]
    ldrsh.w	r3, [r0, #22]
    rsb	r0, r1, r1, lsl #3
    rsb	r1, r1, r0, lsl #12
    lsls	r1, r1, #1
    rsb	r2, r3, r3, lsl #3
    add.w	r7, r1, r7, lsl #13
    rsb	r3, r3, r2, lsl #12
    ldr	r1, [sp, #48]
    lsls	r3, r3, #1
    add.w	r3, r3, r1, lsl #13
    add.w	ip, r3, #32768
    add.w	r7, r7, #32768
    mov.w	ip, ip, lsr #16
    lsrs	r7, r7, #16
    b.n .Lcode_12513
.Lcode_12851:
    cmp.w	r8, #2147483648
    ite	ne
    rsbne	r8, r8, #0
    mvneq.w	r8, #2147483648
    b.n .Lcode_12492
.Lcode_12856:
    ldr	r7, [sp, #44]
    subs	r3, r7, r3
    asrs	r2, r3
    b.n .Lcode_12490
.Lcode_12860:
    mvn.w	r2, #2147483648
    b.n .Lcode_12587
.Lcode_12862:
    mov.w	r3, #45056
    strh.w	r3, [r9]
    mov	r0, sl
    mov	r1, fp
    ldr	r2, [sp, #24]
    str.w	ip, [sp, #28]
    bl .Lcode_12035
    ldr	r7, [sp, #32]
    strh.w	r0, [r9, #2]
    ldr.w	ip, [sp, #28]
    ldr	r0, [sp, #144]
    strh	r7, [r0, #22]
    strh.w	ip, [r0, #24]
    b.n .Lcode_12262
.Lcode_12876:
    add.w	r1, fp, sl
    adds	r1, #4
    asrs	r1, r1, #1
    subs	r1, #2
    movs	r2, #5
    add.w	r1, r4, r1, lsl #2
    add	r0, sp, #56
    add	r3, sp, #80
    str.w	ip, [sp, #28]
    str	r5, [sp, #80]
    bl .Lcode_7763
    ldrsh.w	r1, [sp, #84]
    ldrsh.w	r3, [sp, #80]
    ldr	r0, [sp, #36]
    add	r2, sp, #56
    bl .Lcode_12060
    cmp	r0, #1
    ldr.w	ip, [sp, #28]
    bne.w .Lcode_12522
    b.n .Lcode_12261
.Lliteral_12896:
    .word .Ldata_20734
.Lcode_12897:
.global asm_select_candidate
.type asm_select_candidate, %function
.thumb_func
asm_select_candidate:
    ldrsh.w	r3, [r2, #10]
    push	{r4, r5}
    movs	r4, #255
    cmp	r3, r4
    str	r4, [r0, #0]
    bne.n .Lcode_12909
    ldrsh.w	r3, [r2, #12]
    cmp	r3, r4
    bne.n .Lcode_12925
    movs	r0, #0
.Lcode_12907:
    pop	{r4, r5}
    bx	lr
.Lcode_12909:
    movs	r3, #0
.Lcode_12910:
    adds	r4, r3, #4
    adds	r5, r3, #2
    add.w	r4, r2, r4, lsl #1
    add.w	r5, r2, r5, lsl #2
    ldrsh.w	r4, [r4, #2]
    ldrh	r5, [r5, #6]
    str	r4, [r0, #0]
    add.w	r3, r2, r3, lsl #2
    strh	r5, [r1, #0]
    ldrh	r3, [r3, #16]
    subs.w	r0, r4, #255
    it	ne
    movne	r0, #1
    strh	r3, [r1, #2]
    b.n .Lcode_12907
.Lcode_12925:
    movs	r3, #1
    b.n .Lcode_12910
    .byte 0x00
    .byte 0xbf
.Lcode_12927:
.global asm_quantize_log_amplitudes
.type asm_quantize_log_amplitudes, %function
.thumb_func
asm_quantize_log_amplitudes:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov	r4, r1
    mov	r5, r2
    mov	r9, r3
    adds	r7, r0, #2
    movs	r6, #8
    mvn.w	sl, #2147483648
    movw	r8, #32767
    b.n .Lcode_12940
.Lcode_12936:
    strh.w	r8, [r7, #-2]
    adds	r7, #2
    subs	r6, #1
    beq.n .Lcode_12966
.Lcode_12940:
    ldrsh.w	r0, [r4], #2
    cmp	r0, #0
    beq.n .Lcode_12936
    mov	r1, r5
    movs	r2, #6
    bl .Lcode_6854
    lsls	r0, r0, #16
    rsb	r3, r0, #4211081216
    add.w	r3, r3, #6094848
    cmp.w	r9, #0
    beq.n .Lcode_12955
    cmp	r6, #4
    itt	le
    rsble	r3, r0, #4177526784
    addle.w	r3, r3, #6094848
.Lcode_12955:
    cmp	r3, #0
    blt.n .Lcode_12967
    lsls	r2, r3, #5
    cmp.w	r3, r2, asr #5
    beq.n .Lcode_12970
    eor.w	r3, sl, r3, asr #31
    lsrs	r3, r3, #16
    strh.w	r3, [r7, #-2]
.Lcode_12963:
    adds	r7, #2
    subs	r6, #1
    bne.n .Lcode_12940
.Lcode_12966:
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_12967:
    movs	r3, #0
    strh.w	r3, [r7, #-2]
    b.n .Lcode_12963
.Lcode_12970:
    lsrs	r3, r2, #16
    strh.w	r3, [r7, #-2]
    b.n .Lcode_12963
    .byte 0x00
    .byte 0xbf
.Lcode_12973:
.global asm_compute_band_weights
.type asm_compute_band_weights, %function
.thumb_func
asm_compute_band_weights:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #52
    mov	r9, r2
    ldr	r4, [sp, #92]
    ldr	r5, [sp, #88]
    ldr.w	fp, [sp, #96]
    ldr.w	sl, [sp, #100]
    mov.w	r8, r4, lsl #4
    mov	r6, r0
    add.w	ip, r3, r8
    movs	r2, #0
.Lcode_12984:
    ldrsh.w	r0, [ip, r2]
    cmp	r0, #1
    it	lt
    movlt	r0, #1
    strh	r0, [r1, r2]
    adds	r2, #2
    cmp	r2, #16
    bne.n .Lcode_12984
    adds	r7, r4, #2
    asrs.w	r3, r5, r7
    ands.w	r3, r3, #1
    bne.n .Lcode_13005
    mov	r2, r3
.Lcode_12997:
    strh	r2, [r6, r3]
    adds	r3, #2
    cmp	r3, #16
    bne.n .Lcode_12997
    movs	r3, #0
    str.w	r3, [sl]
.Lcode_13003:
    add	sp, #52
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_13005:
    mov	r1, ip
    movs	r2, #8
    mov	r0, r6
    bl .Lcode_2496
    movs	r1, #8
    movs	r2, #2
    mov	r0, r6
    bl .Lcode_19286
    ldrsh.w	r3, [r6]
    ldrsh.w	r2, [r6, #2]
    lsls	r3, r3, #15
    negs	r3, r3
    cmp.w	r3, r2, lsl #16
    ite	le
    movle	r1, #0
    movgt	r1, #1
    uxth	r3, r1
    movs	r2, #0
    add.w	r0, r4, fp
    add	r8, r9
    add.w	r0, r9, r0, lsl #4
    str.w	r1, [sl]
    strh.w	r2, [sp, #32]
    strh.w	r2, [sp, #34]
    strh.w	r2, [sp, #36]
    strh.w	r2, [sp, #38]
    strh.w	r3, [sp, #40]
    strh.w	r3, [sp, #42]
    strh.w	r3, [sp, #44]
    strh.w	r3, [sp, #46]
    cbz	r4, .Lcode_13067
    rsb	r3, fp, r7
    asrs.w	r3, r5, r3
    lsls	r3, r3, #31
    bpl.n .Lcode_13067
    add	r7, fp
    asrs	r5, r7
    rsb	r4, fp, r4
    add.w	r9, r9, r4, lsl #4
    tst.w	r5, #1
    it	eq
    moveq	r0, r8
    add.w	r7, r9, #16
    mov	r4, sp
    b.n .Lcode_13055
.Lcode_13050:
    cmp	r2, r1
    bge.w .Lcode_13146
    str.w	r2, [r4], #4
.Lcode_13053:
    cmp	r9, r7
    beq.w .Lcode_13151
.Lcode_13055:
    ldrsh.w	r3, [r9], #2
    ldrsh.w	r2, [r0], #2
    ldrsh.w	r1, [r8], #2
    lsls	r3, r3, #16
    lsls	r2, r2, #16
    lsls	r1, r1, #16
    cmp	r3, r2
    ble.n .Lcode_13050
    cmp	r3, r1
    bge.n .Lcode_13146
    str.w	r3, [r4], #4
    b.n .Lcode_13053
.Lcode_13067:
    add.w	r4, fp, r7
    asrs.w	r4, r5, r4
    and.w	r4, r4, #1
    add.w	r1, r0, #16
    mov	r3, sp
    movw	r7, #4390
    movw	r9, #6553
    movw	ip, #21955
    b.n .Lcode_13083
.Lcode_13076:
    cmp	r2, r7
    bgt.n .Lcode_13140
    smulbb	r2, sl, ip
    lsls	r2, r2, #1
.Lcode_13080:
    cmp	r0, r1
    str.w	r2, [r3], #4
    beq.n .Lcode_13092
.Lcode_13083:
    ldrh.w	r2, [r0], #2
    ldrh.w	sl, [r8], #2
    sxth	r2, r2
    cmp	r4, #0
    bne.n .Lcode_13076
.Lcode_13088:
    mov.w	r2, sl, lsl #16
    cmp	r0, r1
    str.w	r2, [r3], #4
    bne.n .Lcode_13083
.Lcode_13092:
    movs	r3, #0
.Lcode_13093:
    mov	r5, sp
    sxth	r3, r3
    movs	r4, #0
    cmp	r3, #0
    mvn.w	r8, #2147483648
    movw	r7, #32767
    movw	r9, #65534
    ldr.w	r2, [r5], #4
    ble.n .Lcode_13120
.Lcode_13102:
    lsls.w	r0, r2, r3
    asrs.w	r3, r0, r3
    cmp	r2, r3
    it	ne
    eorne.w	r0, r8, r2, asr #31
    lsrs	r0, r0, #16
    bne.n .Lcode_13124
.Lcode_13109:
    strh	r7, [r6, r4]
.Lcode_13110:
    cmp	r4, #14
    beq.w .Lcode_13003
    add	r2, sp, #48
    adds	r3, r2, r4
    adds	r4, #2
    ldrh.w	r3, [r3, #-14]
    ldr.w	r2, [r5], #4
    sxth	r3, r3
    cmp	r3, #0
    bgt.n .Lcode_13102
.Lcode_13120:
    negs	r0, r3
    asrs.w	r0, r2, r0
    lsrs	r0, r0, #16
    beq.n .Lcode_13109
.Lcode_13124:
    movs	r1, #0
    sxth	r0, r0
    bl .Lcode_6814
    movw	r3, #22220
    asrs	r0, r0, #1
    movt	r3, #65535
    subs	r3, r3, r0
    cmp	r3, #0
    blt.n .Lcode_13148
    cmp	r3, r9
    bgt.n .Lcode_13109
    lsls	r3, r3, #15
    add.w	r3, r3, #32768
    asrs	r3, r3, #16
    strh	r3, [r6, r4]
    b.n .Lcode_13110
.Lcode_13140:
    cmp	r2, r9
    bgt.n .Lcode_13088
    add.w	r2, r2, r2, lsl #2
    smulbb	r2, r2, sl
    lsls	r2, r2, #1
    b.n .Lcode_13080
.Lcode_13146:
    str.w	r1, [r4], #4
    b.n .Lcode_13053
.Lcode_13148:
    movs	r3, #0
    strh	r3, [r6, r4]
    b.n .Lcode_13110
.Lcode_13151:
    ldrh.w	r3, [sp, #32]
    b.n .Lcode_13093
    .byte 0x00
    .byte 0xbf
.Lcode_13153:
.global asm_select_spectral_candidate
.type asm_select_spectral_candidate, %function
.thumb_func
asm_select_spectral_candidate:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl}
    cmp	r3, #0
    ldr	r6, [sp, #28]
    ble.n .Lcode_13249
    subs	r4, r3, #1
    adds	r7, r3, #1
    ldrsh.w	r5, [r1, r4, lsl #1]
    ldrh.w	r8, [r1, r7, lsl #1]
    ldrh.w	r9, [r0, r3, lsl #1]
    ldrh.w	r7, [r1, r3, lsl #1]
    ldrh.w	sl, [r0, r4, lsl #1]
    mov.w	ip, r3, lsl #1
    movw	r3, #6553
    cmp	r5, r3
    ble.n .Lcode_13223
    sxth	r4, r7
.Lcode_13169:
    movw	r3, #13107
    cmp	r4, r3
    ble.n .Lcode_13239
    ldrsh.w	r4, [r1, r6, lsl #1]
    subs	r3, #1
    lsls	r6, r6, #1
    cmp	r4, r3
    ble.n .Lcode_13252
    ldrsh.w	r5, [r1]
    movs	r3, #1
    movs	r7, #0
.Lcode_13180:
    ldrsh.w	r4, [r1, #2]!
    lsls	r6, r3, #1
    cmp	r4, r5
    blt.n .Lcode_13254
    lsls	r6, r7, #1
.Lcode_13185:
    adds	r3, #1
    cmp	r3, #5
    bne.n .Lcode_13180
    movw	r3, #13106
    cmp	r5, r3
    ble.n .Lcode_13252
    ldrh	r5, [r0, #0]
    ldrh.w	r6, [r0, #2]!
    sxth	r3, r6
    movs	r4, #4
    subs.w	ip, r3, r2
    bmi.n .Lcode_13211
.Lcode_13197:
    sxth	r1, r5
    subs	r7, r1, r2
    bmi.n .Lcode_13218
.Lcode_13200:
    cmp	ip, r7
    it	ge
    movge	r3, r1
    it	lt
    movlt	r5, r6
    subs	r4, #1
    beq.n .Lcode_13240
    ldrh.w	r6, [r0, #2]!
    sxth	r3, r6
    subs.w	ip, r3, r2
    bpl.n .Lcode_13197
.Lcode_13211:
    cmn.w	ip, #32768
    sxth	r1, r5
    ite	ne
    rsbne	ip, r3, r2
    movweq	ip, #32767
    subs	r7, r1, r2
    bpl.n .Lcode_13200
.Lcode_13218:
    cmn.w	r7, #32768
    ite	ne
    rsbne	r7, r1, r2
    movweq	r7, #32767
    b.n .Lcode_13200
.Lcode_13223:
    lsls	r5, r5, #16
    sxth	r4, r7
    cmp.w	r5, r4, lsl #15
    bge.n .Lcode_13169
    mov.w	r8, r8, lsl #16
    cmp.w	r5, r8, asr #1
    bge.n .Lcode_13169
    mov.w	sl, sl, lsl #16
    mov.w	r9, r9, lsl #16
    mov.w	sl, sl, asr #1
    subs.w	r3, r9, sl
    bmi.n .Lcode_13257
.Lcode_13235:
    cmp.w	r3, sl, asr #2
    bge.n .Lcode_13169
    sbfx	r3, r9, #15, #16
    b.n .Lcode_13240
.Lcode_13239:
    ldrsh.w	r3, [r0, ip]
.Lcode_13240:
    lsls	r2, r3, #16
    lsls	r3, r3, #17
    cmp.w	r2, r3, asr #1
    itt	ne
    mvnne.w	r3, #2147483648
    eorne.w	r3, r3, r2, asr #31
    asrs	r0, r3, #16
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx	lr
.Lcode_13249:
    mov.w	ip, r3, lsl #1
    ldrsh.w	r4, [r1, r3, lsl #1]
    b.n .Lcode_13169
.Lcode_13252:
    ldrsh	r3, [r0, r6]
    b.n .Lcode_13240
.Lcode_13254:
    mov	r7, r3
    mov	r5, r4
    b.n .Lcode_13185
.Lcode_13257:
    cmp.w	r3, #2147483648
    beq.n .Lcode_13169
    negs	r3, r3
    b.n .Lcode_13235
.Lcode_13261:
.global asm_extract_log_spectral_bands
.type asm_extract_log_spectral_bands, %function
.thumb_func
asm_extract_log_spectral_bands:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #36
    str	r1, [sp, #16]
    ldr	r6, [sp, #88]
    ldr	r1, [sp, #84]
    ldr	r4, [sp, #80]
    ldrsh.w	r1, [r1, r6, lsl #1]
    str	r3, [sp, #28]
    str	r1, [sp, #12]
    ldr	r1, [sp, #16]
    str	r2, [sp, #4]
    lsls	r5, r1, #9
    asrs	r7, r5, #5
    add.w	r6, r6, r6, lsl #7
    add.w	r4, r4, r6, lsl #2
    add.w	r7, r7, #32768
    ldr	r6, [sp, #76]
    str	r0, [sp, #24]
    asrs	r1, r7, #16
    asrs	r5, r5, #4
    adds	r6, #170
    cmp	r2, #0
    str	r5, [sp, #8]
    ldr.w	r3, [r4, r1, lsl #2]
    add.w	r5, r4, r1, lsl #2
    uxth	r6, r6
    ble.w .Lcode_13386
    mov.w	sl, r7, lsl #16
    mov.w	sl, sl, lsr #17
    sxth.w	sl, sl
    asrs	r2, r3, #31
    mov.w	r0, sl, asr #31
    mul.w	r2, sl, r2
    mla	r2, r3, r0, r2
    umull	sl, fp, sl, r3
    add	fp, r2
    ldr	r2, [sp, #24]
    mov.w	r8, sl, lsr #15
    lsls	r6, r6, #16
    orr.w	r8, r8, fp, lsl #17
    str	r6, [sp, #20]
    add.w	fp, r2, #2
    mov.w	sl, #0
    movs	r4, #1
    mov	ip, r1
.Lcode_13306:
    ldr	r0, [sp, #8]
    adds	r7, r7, r0
    asrs	r6, r7, #16
    cmp	r6, #127
    it	ge
    movge	r6, #127
    rsb	r8, r8, r3
    rsb	ip, ip, r6
    mov	r2, r8
    add.w	ip, ip, #4294967295
    asrs	r3, r2, #31
    cmp.w	ip, #0
    ubfx	r8, r7, #1, #15
    add.w	r9, r5, #4
    ble.w .Lcode_13419
    movs	r1, #0
.Lcode_13322:
    adds	r1, #1
    cmp	r1, ip
    ldr.w	r0, [r5, #4]!
    smlal	r2, r3, r4, r0
    blt.n .Lcode_13322
    add.w	r5, r9, ip, lsl #2
.Lcode_13328:
    ldr	r1, [r5, #0]
    sxth.w	r0, r8
    mov.w	ip, r1, asr #31
    mov.w	r8, r0, asr #31
    mul.w	ip, r0, ip
    mla	ip, r1, r8, ip
    umull	r0, r1, r0, r1
    add	r1, ip
    mov.w	r8, r0, lsr #15
    orr.w	r8, r8, r1, lsl #17
    adds.w	r2, r2, r8
    adc.w	r3, r3, r8, asr #31
    orrs.w	r1, r2, r3
    beq.n .Lcode_13370
    sxth	r1, r3
    cmp	r1, #0
    mov	r0, r2
    blt.n .Lcode_13416
    mov	ip, r1
.Lcode_13347:
    clz	ip, ip
    cmp.w	ip, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	ip, r2, #32
    subs.w	r3, ip, #33
    bmi.n .Lcode_13408
    ldr	r2, [sp, #12]
    rsb	ip, r3, r2
    lsls.w	r3, r0, r3
.Lcode_13357:
    cmn.w	ip, #59
    blt.n .Lcode_13360
    cbnz	r3, .Lcode_13373
.Lcode_13360:
    ldr	r2, [sp, #4]
    add.w	sl, sl, #1
    movw	r3, #34986
    cmp	sl, r2
    strh.w	r3, [fp, #-2]
    add.w	fp, fp, #2
    beq.n .Lcode_13386
.Lcode_13367:
    ldr	r3, [r5, #0]
    mov	ip, r6
    b.n .Lcode_13306
.Lcode_13370:
    ldr.w	ip, [sp, #12]
    movs	r3, #0
    b.n .Lcode_13357
.Lcode_13373:
    asrs	r0, r3, #16
    movs	r2, #5
    add.w	r1, ip, #30
    bl .Lcode_6854
    ldr	r1, [sp, #20]
    ldr	r2, [sp, #4]
    add.w	r3, r1, r0, lsl #16
    add.w	sl, sl, #1
    asrs	r3, r3, #16
    cmp	sl, r2
    strh.w	r3, [fp, #-2]
    add.w	fp, fp, #2
    bne.n .Lcode_13367
.Lcode_13386:
    ldr	r3, [sp, #28]
    lsls	r3, r3, #31
    bpl.n .Lcode_13406
    ldr	r1, [sp, #16]
    ldr	r0, [sp, #72]
    movw	r3, #13107
    cmp	r1, r3
    ldrh.w	r7, [r0, #128]
    ble.n .Lcode_13421
    sxth	r7, r7
.Lcode_13396:
    movw	r3, #29491
    ldr	r1, [sp, #16]
    mul.w	r3, r3, r7
    movw	r2, #26214
    smulbb	r2, r1, r2
    lsls	r3, r3, #1
    add.w	r3, r3, r2, asr #2
    ldr	r2, [sp, #72]
    asrs	r3, r3, #16
    strh.w	r3, [r2, #128]
.Lcode_13406:
    add	sp, #36
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_13408:
    negs	r2, r3
    add.w	ip, ip, #4294967295
    lsrs.w	r2, r0, r2
    ldr	r0, [sp, #12]
    lsl.w	r1, r1, ip
    rsb	ip, r3, r0
    orr.w	r3, r1, r2
    b.n .Lcode_13357
.Lcode_13416:
    mvn.w	ip, r1
    mvns	r2, r2
    b.n .Lcode_13347
.Lcode_13419:
    mov	r5, r9
    b.n .Lcode_13328
.Lcode_13421:
    ldr	r2, [sp, #16]
    movw	r3, #6554
    cmp	r2, r3
    bgt.n .Lcode_13466
    movw	r3, #4369
    cmp	r2, r3
    ite	le
    movle	r1, #3
    movgt	r1, #2
    ite	le
    movle	r2, #2
    movgt	r2, #1
.Lcode_13433:
    movw	r3, #26214
    ldr	r0, [sp, #16]
    smulbb	r3, r7, r3
    lsls	r3, r3, #1
    mul.w	r1, r1, r0
    rsb	r1, r3, r1, lsl #16
    asrs	r1, r1, #16
    cmp	r1, #0
    sxth	r7, r7
    ble.n .Lcode_13396
    sub.w	r6, r0, r0, lsl #4
    lsls	r5, r0, #16
    ldr	r0, [sp, #24]
    lsls	r6, r6, #9
    add.w	r3, r0, r2, lsl #1
    b.n .Lcode_13451
.Lcode_13449:
    cmp	r1, #0
    ble.n .Lcode_13396
.Lcode_13451:
    ldrsh.w	r0, [r3, #2]
    ldrsh.w	r4, [r3]
    rsb	r1, r5, r1, lsl #16
    subs	r3, #2
    subs	r2, #1
    lsls	r0, r0, #16
    asrs	r1, r1, #16
    qdadd	r0, r0, r6
    mov.w	ip, r0, lsr #16
    cmp.w	r4, r0, asr #16
    it	lt
    strhlt.w	ip, [r3, #2]
    adds	r0, r2, #1
    bne.n .Lcode_13449
    b.n .Lcode_13396
.Lcode_13466:
    movs	r1, #1
    movs	r2, #0
    b.n .Lcode_13433
    .byte 0x00
    .byte 0xbf
.Lcode_13469:
.global asm_store_u32
.type asm_store_u32, %function
.thumb_func
asm_store_u32:
    str	r1, [r0, #0]
    bx	lr
.Lcode_13471:
.global asm_select_voicing_codeword
.type asm_select_voicing_codeword, %function
.thumb_func
asm_select_voicing_codeword:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #140
    cmp	r0, #1
    str	r1, [sp, #32]
    str	r2, [sp, #36]
    beq.n .Lcode_13490
    ldr	r4, [sp, #184]
    ldr	r1, [sp, #36]
    movs	r3, #0
    rsb	r2, r4, #7
    str	r3, [r1, #0]
    ldr	r4, [sp, #32]
    movs	r1, #64
    asrs	r1, r2
    str	r1, [sp, #4]
    str	r3, [r4, #0]
.Lcode_13487:
    ldr	r0, [sp, #4]
    add	sp, #140
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_13490:
    ldr	r1, [sp, #184]
    ldr	r6, [sp, #176]
    sxth.w	sl, r1
    lsl.w	r0, r0, sl
    add.w	ip, sp, #72
    add.w	lr, sp, #104
    add.w	r7, r3, #30
    adds	r6, #30
    uxth.w	fp, r0
    mov	r5, lr
    mov	r4, ip
    add	r1, sp, #40
.Lcode_13502:
    ldrsh.w	r3, [r7], #-2
    ldrsh.w	r2, [r6], #-2
    lsls	r3, r3, #16
    rsb	r9, r3, #2130706432
    add.w	r9, r9, #16711680
    smultt	r9, r9, r9
    mov.w	r9, r9, asr #15
    mov.w	r9, r9, lsl #16
    rsb	r8, r9, #2130706432
    lsls	r2, r2, #16
    smultt	r3, r3, r3
    smultt	r0, r2, r2
    asrs	r3, r3, #15
    lsls	r0, r0, #1
    add.w	r8, r8, #16711680
    smultt	r8, r8, r0
    add	r8, r9
    lsls	r3, r3, #16
    mov.w	r8, r8, asr #16
    rsb	r9, r3, #2130706432
    rsb	r2, r2, #2130706432
    strh.w	r8, [r1], #2
    add.w	r9, r9, #16711680
    add.w	r2, r2, #16711680
    smultt	r0, r9, r0
    smultt	r2, r2, r2
    adds	r0, r3, r0
    lsls	r2, r2, #1
    smultt	r9, r9, r2
    add	r9, r3
    asrs	r0, r0, #16
    mov.w	r9, r9, asr #16
    cmp	r1, ip
    strh.w	r9, [r4], #2
    strh.w	r0, [r5], #2
    bne.n .Lcode_13502
    sxth.w	fp, fp
    cmp.w	fp, #0
    str.w	fp, [sp, #12]
    ble.w .Lcode_13669
    rsb	sl, sl, #7
    movs	r3, #1
    lsl.w	r3, r3, sl
    sxth	r3, r3
    lsls	r3, r3, #2
    str	r3, [sp, #20]
    ldr	r3, [sp, #180]
    ldr	r4, .Lliteral_13679
    mov.w	r9, #0
    movw	r2, #32767
    adds	r3, #32
    str	r2, [sp, #24]
    str	r4, [sp, #8]
    mov	r8, r9
    str.w	r9, [sp, #28]
    mov	sl, r2
    str	r3, [sp, #16]
.Lcode_13559:
    ldr	r1, [sp, #8]
    str.w	r8, [sp, #4]
    ldr.w	r0, [r1, r9]
    ldr	r6, [sp, #16]
    uxth.w	fp, r8
    movs	r1, #0
    movs	r2, #0
    movs	r3, #0
    b.n .Lcode_13578
.Lcode_13568:
    cmp	r4, #2
    it	eq
    ldrheq.w	r5, [ip, r1]
    smulbb	r5, r5, r7
    adds	r1, #2
    adds	r2, r2, r5
    adc.w	r3, r3, r5, asr #31
    asrs	r0, r0, #2
    cmp	r1, #32
    beq.n .Lcode_13592
.Lcode_13578:
    and.w	r4, r0, #3
    cmp	r4, #1
    ldrh.w	r5, [lr, r1]
    ldrh.w	r7, [r6, #-2]!
    bne.n .Lcode_13568
    add	r4, sp, #40
    ldrh	r5, [r4, r1]
    smulbb	r5, r5, r7
    adds	r1, #2
    adds	r2, r2, r5
    adc.w	r3, r3, r5, asr #31
    asrs	r0, r0, #2
    cmp	r1, #32
    bne.n .Lcode_13578
.Lcode_13592:
    orrs.w	r1, r2, r3
    bne.n .Lcode_13604
    ldr	r2, [sp, #184]
    rsb	r3, r2, #7
    lsl.w	r8, r8, r3
    sxth.w	r8, r8
.Lcode_13598:
    ldr	r3, [sp, #8]
    ldr	r0, [sp, #32]
    ldr.w	r2, [r3, r8, lsl #2]
    ldr	r1, [sp, #36]
    bl .Lcode_19386
    b.n .Lcode_13487
.Lcode_13604:
    sxth	r1, r3
    cmp	r1, #0
    mov	r0, r2
    blt.n .Lcode_13652
    mov	r3, r1
.Lcode_13609:
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r3, r2
    addeq	r3, #32
    subs.w	r2, r3, #33
    bmi.n .Lcode_13644
    lsls	r0, r2
    rsb	r2, r2, #1
    uxth	r1, r2
.Lcode_13619:
    lsrs	r0, r0, #16
    beq.n .Lcode_13674
    sxth	r2, r1
    sxth.w	r3, sl
    cmp	r2, r3
    bgt.n .Lcode_13629
    beq.n .Lcode_13655
    str.w	fp, [sp, #28]
    mov	sl, r1
    str	r0, [sp, #24]
.Lcode_13629:
    add.w	r8, r8, #1
    ldr	r2, [sp, #12]
    ldr	r1, [sp, #20]
    sxth.w	r3, r8
    cmp	r2, r3
    add	r9, r1
    bgt.n .Lcode_13559
    ldr	r3, [sp, #28]
    ldr	r4, [sp, #184]
    sxth	r3, r3
    rsb	r8, r4, #7
    lsl.w	r8, r3, r8
    str	r3, [sp, #4]
    sxth.w	r8, r8
    b.n .Lcode_13598
.Lcode_13644:
    negs	r2, r2
    subs	r3, #1
    lsls.w	r3, r1, r3
    lsrs	r0, r2
    adds	r2, #1
    orrs	r0, r3
    uxth	r1, r2
    b.n .Lcode_13619
.Lcode_13652:
    mvns	r3, r1
    mvns	r2, r2
    b.n .Lcode_13609
.Lcode_13655:
    ldr	r2, [sp, #24]
    ldr	r4, [sp, #24]
    sxth	r3, r2
    sxth	r2, r0
    cmp	r2, r3
    ldr	r3, [sp, #28]
    it	lt
    movlt	r4, r0
    it	lt
    movlt	r3, fp
    str	r3, [sp, #28]
    mov	sl, r1
    str	r4, [sp, #24]
    b.n .Lcode_13629
.Lcode_13669:
    ldr	r1, .Lliteral_13679
    mov.w	r8, #0
    str	r1, [sp, #8]
    str.w	r8, [sp, #4]
    b.n .Lcode_13598
.Lcode_13674:
    ldr	r4, [sp, #184]
    rsb	r3, r4, #7
    lsl.w	r8, r8, r3
    sxth.w	r8, r8
    b.n .Lcode_13598
.Lliteral_13679:
    .word .Ldata_20695
.Lcode_13680:
.global asm_adjust_harmonic_index
.type asm_adjust_harmonic_index, %function
.thumb_func
asm_adjust_harmonic_index:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    mov.w	lr, r1, lsl #16
    mov	r5, lr
    cmp	r5, #0
    it	lt
    mvnlt	r5, r5
    itt	ne
    clzne	r5, r5
    subne	r5, #1
    sxth	r5, r5
    lsl.w	lr, lr, r5
    sub	sp, #16
    mov.w	lr, lr, asr #16
    rsb	r5, r5, #15
    mov	r4, r1
    movs	r1, #8
    mov	r6, r0
    mov	r8, r2
    mov	r7, r3
    mov.w	r0, #1090519040
    mov	r3, r5
    mov	r2, lr
    add.w	r5, sp, r1
    str	r5, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #40]
    mov	r5, r0
    cbnz	r3, .Lcode_13732
    ldr	r2, [sp, #8]
    ldrh	r7, [r6, #0]
    movw	r3, #65529
    movt	r3, #65535
    subs	r3, r3, r2
    lsls	r0, r7, #17
    cmp	r3, #0
    add.w	r0, r0, #65536
    blt.n .Lcode_13773
.Lcode_13717:
    mov.w	r1, #3204448256
    lsls	r1, r3
.Lcode_13719:
    asrs	r0, r0, #16
    mul.w	r0, r5, r0
    add.w	r0, r1, r0, lsl #1
    adds	r1, r2, #7
    bge.n .Lcode_13729
    asrs	r0, r3
.Lcode_13725:
    add.w	r0, r0, #32768
    asrs	r0, r0, #16
    add	sp, #16
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_13729:
    adds	r2, #7
    lsls	r0, r2
    b.n .Lcode_13725
.Lcode_13732:
    mov.w	r0, r8, lsl #16
    asrs	r0, r0, #1
    add.w	r0, r0, #545259520
    mov	r1, r0
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r0, r1
    ldr	r3, [sp, #8]
    add.w	lr, sp, #12
    rsb	r1, r1, #8
    mov	r2, r5
    str.w	lr, [sp]
    bl .Lcode_6721
    ldr	r3, [sp, #12]
    lsls	r0, r0, #16
    cmp	r3, #14
    bgt.n .Lcode_13777
    rsb	r3, r3, #15
    asrs.w	r3, r0, r3
    asrs	r3, r3, #16
    cmp	r4, r3
    bgt.n .Lcode_13782
.Lcode_13759:
    subs	r4, #1
.Lcode_13760:
    cmp	r4, r7
    ldr	r2, [sp, #8]
    movw	r3, #65529
    it	le
    bicle.w	r7, r4, r4, asr #31
    movt	r3, #65535
    uxth	r7, r7
    subs	r3, r3, r2
    lsls	r0, r7, #17
    cmp	r3, #0
    strh	r7, [r6, #0]
    add.w	r0, r0, #65536
    bge.n .Lcode_13717
.Lcode_13773:
    adds	r1, r2, #7
    mov.w	r4, #3204448256
    asrs.w	r1, r4, r1
    b.n .Lcode_13719
.Lcode_13777:
    subs	r3, #15
    lsls.w	r3, r0, r3
    asrs	r3, r3, #16
    cmp	r4, r3
    ble.n .Lcode_13759
.Lcode_13782:
    bic.w	r4, r3, r3, asr #31
    b.n .Lcode_13760
.Lcode_13784:
.global asm_combine_harmonic_indices
.type asm_combine_harmonic_indices, %function
.thumb_func
asm_combine_harmonic_indices:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #28
    mov	r5, r1
    ldr	r6, [sp, #64]
    ldr	r1, [sp, #60]
    ldr.w	ip, [r5, #8]
    mov	r4, r2
    mov	r7, r0
    ldr	r2, [r2, #8]
    cmp	r6, #0
    beq.n .Lcode_13867
    ldrsh.w	r8, [r4]
    sub.w	r0, r8, #1
    rsbs	r8, r0, #0
    adc.w	r8, r8, r0
.Lcode_13799:
    orr.w	r0, r2, ip
    tst.w	r0, #1431655765
    bne.n .Lcode_13860
    cmp.w	r8, #0
    beq.n .Lcode_13860
    tst.w	ip, #2863311530
    ite	eq
    moveq	r0, #0
    movne	r0, #1
    tst.w	r2, #2863311530
    ite	eq
    moveq	r2, #0
    movne	r2, #1
    cbnz	r0, .Lcode_13815
    cmp	r2, #0
    beq.n .Lcode_13860
.Lcode_13815:
    cmp	r6, #0
    beq.n .Lcode_13869
    sub.w	ip, r1, #6
    mov.w	r8, #60
    lsl.w	r8, r8, ip
    add.w	r8, r8, #4294967295
.Lcode_13821:
    cmp	r0, #0
    beq.n .Lcode_13871
    cmp	r2, #0
    beq.n .Lcode_13874
    asrs	r2, r1, #1
    mov.w	r9, #1
    lsls	r0, r1, #31
    lsl.w	r9, r9, r2
    bpl.n .Lcode_13833
    movw	r2, #23170
    mul.w	r9, r2, r9
    sbfx	r9, r9, #14, #16
.Lcode_13833:
    cmp	r6, #0
    beq.n .Lcode_13896
    mov	r1, r9
    mov	r2, r3
    add	r0, sp, #20
    mov	r3, r8
    str	r6, [sp, #0]
    bl .Lcode_13680
    mov	r3, r8
    strh	r0, [r5, #14]
    mov	r1, r9
    ldr	r2, [sp, #56]
    str	r6, [sp, #0]
    add.w	r0, sp, #22
    bl .Lcode_13680
    ldrh.w	r3, [sp, #20]
    ldrh.w	r2, [sp, #22]
    strh	r0, [r4, #14]
    mla	r9, r9, r2, r3
    sxth.w	r9, r9
    cmp	r8, r9
    it	ge
    bicge.w	r8, r9, r9, asr #31
    uxth.w	r8, r8
    strh.w	r8, [r7]
    movs	r0, #1
    b.n .Lcode_13864
.Lcode_13860:
    movs	r3, #0
    strh	r3, [r4, #14]
    mov	r0, r3
    strh	r3, [r5, #14]
.Lcode_13864:
    sxth	r0, r0
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_13867:
    mov.w	r8, #1
    b.n .Lcode_13799
.Lcode_13869:
    mov	r8, r6
    b.n .Lcode_13821
.Lcode_13871:
    cbnz	r2, .Lcode_13885
    movs	r0, #1
    b.n .Lcode_13864
.Lcode_13874:
    mov.w	r9, #1
    strh	r2, [r4, #14]
    lsl.w	r1, r9, r1
    mov	r2, r3
    mov	r0, r7
    mov	r3, r8
    str	r6, [sp, #0]
    bl .Lcode_13680
    strh	r0, [r5, #14]
    mov	r0, r9
    b.n .Lcode_13864
.Lcode_13885:
    mov.w	r9, #1
    strh	r0, [r5, #14]
    lsl.w	r1, r9, r1
    mov	r0, r7
    ldr	r2, [sp, #56]
    str	r6, [sp, #0]
    mov	r3, r8
    bl .Lcode_13680
    strh	r0, [r4, #14]
    mov	r0, r9
    b.n .Lcode_13864
.Lcode_13896:
    ldrsh.w	r0, [r7]
    str	r3, [sp, #12]
    sxth.w	r1, r9
    bl .Lcode_6588
    ldrh	r1, [r7, #0]
    ldr	r3, [sp, #12]
    uxth	r2, r0
    mls	r1, r9, r2, r1
    sxth	r0, r2
    cmp	r9, r0
    uxth	r1, r1
    strh.w	r2, [sp, #22]
    strh.w	r1, [sp, #20]
    it	le
    addle.w	r2, r9, #4294967295
    sxth	r1, r1
    it	le
    strhle.w	r2, [sp, #22]
    cmp	r9, r1
    bgt.n .Lcode_13918
    add.w	r2, r9, #4294967295
    strh.w	r2, [sp, #20]
.Lcode_13918:
    mov	r2, r3
    movs	r6, #0
    mov	r1, r9
    mov	r3, r8
    add	r0, sp, #20
    str	r6, [sp, #0]
    bl .Lcode_13680
    mov	r1, r9
    strh	r0, [r5, #14]
    ldr	r2, [sp, #56]
    str	r6, [sp, #0]
    add.w	r0, sp, #22
    mov	r3, r8
    bl .Lcode_13680
    strh	r0, [r4, #14]
    movs	r0, #1
    b.n .Lcode_13864
.Lcode_13935:
.global asm_write_bits_cursor
.type asm_write_bits_cursor, %function
.thumb_func
asm_write_bits_cursor:
    mov	r3, r1
    push	{r4, lr}
    ldr	r1, [r0, #0]
    mov	r4, r0
    mov	r0, r2
    mov	r2, r3
    bl .Lcode_5763
    str	r0, [r4, #0]
    pop	{r4, pc}
.Lcode_13944:
.global asm_quantize_pitch_index
.type asm_quantize_pitch_index, %function
.thumb_func
asm_quantize_pitch_index:
    cmp	r2, #1
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    mov	r5, r0
    mov	r6, r1
    beq.n .Lcode_13954
    cmp	r2, #2
    beq.n .Lcode_13993
    movs	r4, #0
    sxth	r0, r4
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_13954:
    subs	r3, #6
    movs	r7, #60
    ldrsh.w	r0, [r0]
    mvn.w	r1, #3
    lsls	r7, r3
    bl .Lcode_6814
    cmp.w	r0, #2147483648
    mov.w	r8, r7, lsl #1
    beq.n .Lcode_14003
    negs	r0, r0
    sbfx	r0, r0, #4, #16
    sub.w	r0, r0, #17408
    subs	r0, #253
    sxth	r0, r0
.Lcode_13968:
    mul.w	r0, r0, r8
    movw	r1, #21668
    bl .Lcode_6588
    sxth	r4, r0
    cmp	r4, #0
    blt.n .Lcode_14006
    cmp	r7, r4
    it	le
    suble	r4, r7, #1
    lsls	r3, r4, #1
    movw	r0, #10834
    mla	r0, r3, r0, r0
    uxth	r4, r4
.Lcode_13981:
    sxth.w	r1, r8
    bl .Lcode_6588
    lsls	r2, r0, #16
    rsb	r2, r2, #3137339392
    add.w	r2, r2, #196608
    mov	r0, r5
    asrs	r2, r2, #16
    mov	r1, r6
    ldrsh.w	r3, [sp, #24]
    bl .Lcode_19437
    sxth	r0, r4
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_13993:
    subs	r3, #6
    movs	r4, #62
    lsls	r4, r3
    movw	r3, #16423
    strh	r3, [r0, #0]
    uxth	r4, r4
    movs	r3, #15
    strh	r3, [r1, #0]
    sxth	r0, r4
    ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
.Lcode_14003:
    movw	r0, #47874
    movt	r0, #65535
    b.n .Lcode_13968
.Lcode_14006:
    movs	r4, #0
    movw	r0, #10834
    b.n .Lcode_13981
    .byte 0x00
    .byte 0xbf
.Lcode_14009:
.global asm_write_repeated_frame_code
.type asm_write_repeated_frame_code, %function
.thumb_func
asm_write_repeated_frame_code:
    stmdb	sp!, {r4, r5, r6, r7, r8, lr}
    mov	r6, r0
    mov	r4, r1
    mov	r7, r2
    movs	r1, #6
    movs	r2, #63
    mov	r0, r3
    mov	r5, r3
    bl .Lcode_13935
    cmp	r6, #127
    ble.n .Lcode_14047
    ldrsh.w	r2, [r4]
    ldrsh.w	r3, [r4, #2]
    adds	r3, r2, r3
    asrs	r3, r3, #1
    cmp.w	r3, #28672
    blt.n .Lcode_14059
.Lcode_14026:
    mov.w	r8, #1
    movs	r2, #63
.Lcode_14028:
    movs	r1, #6
    mov	r0, r5
    bl .Lcode_13935
    ldrsh.w	r4, [r7, #4]
    subs	r4, #13
    asrs	r4, r4, #3
    cmp	r4, #0
    ble.n .Lcode_14042
.Lcode_14036:
    movs	r1, #8
    mov	r0, r5
    mov	r2, r6
    bl .Lcode_13935
    subs	r4, #1
    bne.n .Lcode_14036
.Lcode_14042:
    mov	r0, r5
    movs	r1, #1
    mov	r2, r8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
    b.w .Lcode_13935
.Lcode_14047:
    ldrh	r3, [r4, #2]
.Lcode_14048:
    sxth	r3, r3
    add.w	r3, r3, r3, lsl #4
    mov.w	r8, r3, lsl #5
    add.w	r8, r8, #1114112
    mov.w	r8, r8, asr #17
    cmp.w	r8, #127
    bgt.n .Lcode_14026
    bic.w	r8, r8, r8, asr #31
    mov.w	r2, r8, asr #1
    and.w	r8, r8, #1
    b.n .Lcode_14028
.Lcode_14059:
    mov.w	r2, #45056
    movt	r2, #65535
    cmp	r3, r2
    it	lt
    movlt	r3, r2
    uxth	r3, r3
    b.n .Lcode_14048
.Lcode_14066:
.global asm_prepare_extended_frame
.type asm_prepare_extended_frame, %function
.thumb_func
asm_prepare_extended_frame:
    push	{r3, r4, r5, r6, r7, lr}
    mov	r5, r1
    ldrh	r1, [r1, #0]
    ldrh	r3, [r5, #6]
    mov	r4, r0
    ldrh	r0, [r5, #2]
    strh	r3, [r4, #6]
    cmp	r1, #1
    strh	r1, [r4, #0]
    strh	r0, [r4, #2]
    mov	r3, r2
    beq.n .Lcode_14085
    movs	r3, #0
    str	r3, [r4, #8]
    strh.w	r3, [r4, #138]
    strh	r3, [r4, #14]
    movs	r3, #0
    strh.w	r3, [r4, #134]
    pop	{r3, r4, r5, r6, r7, pc}
.Lcode_14085:
    ldrh	r2, [r5, #4]
    ldrh.w	lr, [r5, #12]
    ldr	r7, [r5, #8]
    ldrh	r6, [r5, #14]
    strh	r2, [r4, #4]
    add.w	r1, r5, #16
    sxth	r2, r2
    strh.w	lr, [r4, #12]
    strh.w	r3, [r4, #138]
    add.w	r0, r4, #16
    str	r7, [r4, #8]
    strh	r6, [r4, #14]
    bl .Lcode_2496
    ldrh	r2, [r5, #4]
    sxth	r3, r2
    adds	r3, #7
    rsb	r2, r2, #56
    ldrsh.w	r1, [r5, r3, lsl #1]
    sxth	r2, r2
    bl .Lcode_2535
    movs	r3, #0
    strh.w	r3, [r4, #134]
    pop	{r3, r4, r5, r6, r7, pc}
.Lcode_14108:
.global asm_increment_counter_100
.type asm_increment_counter_100, %function
.thumb_func
asm_increment_counter_100:
    ldrh.w	r3, [r0, #134]
    sxth	r2, r3
    cmp	r2, #99
    bgt.n .Lcode_14114
    adds	r3, #1
    strh.w	r3, [r0, #134]
.Lcode_14114:
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_14115:
.global asm_quantize_residual_spectrum
.type asm_quantize_residual_spectrum, %function
.thumb_func
asm_quantize_residual_spectrum:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrh	r6, [r1, #4]
    ldrsh.w	r4, [r0, #4]
    sub	sp, #236
    sxth	r7, r6
    str	r1, [sp, #44]
    mov	r5, r0
    mov	r1, r7
    mov.w	r0, #524288
    str	r6, [sp, #40]
    str	r3, [sp, #24]
    str	r7, [sp, #28]
    str	r2, [sp, #48]
    bl .Lcode_6534
    mov.w	r8, r4, lsl #25
    smultb	r8, r8, r0
    ldr	r6, [sp, #44]
    ldr	r1, [sp, #28]
    sbfx	r8, r8, #11, #20
    add.w	r4, r6, #16
    mov	r3, r8
    movs	r0, #0
    add	r6, sp, #56
    b.n .Lcode_14147
.Lcode_14139:
    ldrsh.w	lr, [r5, #16]
    mov.w	lr, lr, lsl #16
    mov.w	r2, lr, asr #16
    subs	r1, #1
    strh.w	r2, [r6], #2
    add.w	r0, r0, lr, asr #6
    add	r3, r8
    beq.n .Lcode_14174
.Lcode_14147:
    asrs	r2, r3, #16
    cmp	r2, #55
    it	ge
    movge	r2, #55
    ubfx	r7, r3, #1, #15
    add.w	lr, r2, #7
    cmp	r2, #0
    beq.n .Lcode_14139
    ldrh.w	lr, [r5, lr, lsl #1]
    smulbb	ip, r7, lr
    mov.w	ip, ip, lsl #1
    cmp.w	ip, #2147483648
    ite	ne
    rsbne	ip, ip, #0
    mvneq.w	ip, #2147483648
    adds	r2, #8
    sxth.w	lr, lr
    add.w	lr, ip, lr, lsl #16
    ldrh.w	ip, [r5, r2, lsl #1]
    smulbb	ip, r7, ip
    add.w	lr, lr, ip, lsl #1
    mov.w	r2, lr, asr #16
    subs	r1, #1
    strh.w	r2, [r6], #2
    add.w	r0, r0, lr, asr #6
    add	r3, r8
    bne.n .Lcode_14147
.Lcode_14174:
    ldr	r7, [sp, #28]
    lsls	r1, r7, #25
    asrs	r1, r1, #16
    bl .Lcode_6534
    movw	r3, #21299
    smulbb	r5, r0, r3
    lsls	r5, r5, #1
    cmp.w	r5, #2147483648
    beq.w .Lcode_14520
    negs	r5, r5
    asrs	r5, r5, #1
.Lcode_14185:
    ldr	r6, [sp, #40]
    add	r3, sp, #56
    mov.w	sl, #2
    smlabb	sl, r6, sl, r3
    movw	r0, #21299
    mvn.w	r6, #2147483648
.Lcode_14191:
    ldrh.w	r1, [r3], #2
    smlabb	r1, r1, r0, r5
    lsls	r2, r1, #1
    cmp.w	r1, r2, asr #1
    it	ne
    eorne.w	r2, r6, r1, asr #31
    asrs	r2, r2, #16
    cmp	r3, sl
    strh.w	r2, [r3, #-2]
    bne.n .Lcode_14191
    ldr	r7, [sp, #28]
    ldr	r3, .Lliteral_14428
    sub.w	r2, r7, #9
    add	r5, sp, #184
    ldrsh.w	r2, [r3, r2, lsl #1]
    add.w	fp, sp, #200
    mov	r3, r5
.Lcode_14208:
    and.w	r1, r2, #15
    adds	r1, #2
    str.w	r1, [r3], #4
    asrs	r2, r2, #4
    cmp	r3, fp
    bne.n .Lcode_14208
    ldr	r6, [sp, #276]
    cmp	r6, #0
    bne.w .Lcode_14435
    ldr	r7, [sp, #28]
    add	r6, sp, #168
    adds	r7, #8
    str	r7, [sp, #52]
    str	r6, [sp, #36]
.Lcode_14222:
    ldr	r6, [sp, #24]
    ldr	r7, [sp, #272]
    ldrsh.w	r2, [r6, #14]
    ldr	r6, [sp, #276]
    str	r7, [sp, #8]
    mov.w	r8, #3
    movs	r7, #0
    mov	r1, r8
    ldr	r3, .Lliteral_14429
    strh.w	r7, [sp, #168]
    add.w	r0, sp, #170
    movs	r7, #9
    stmia.w	sp, {r7, r8}
    str	r6, [sp, #12]
    bl .Lcode_19490
    ldr	r7, [sp, #24]
    ldr	r6, [sp, #272]
    ldrsh.w	r2, [r7, #16]
    str	r6, [sp, #8]
    movs	r7, #4
    ldr	r6, [sp, #276]
    ldr	r3, .Lliteral_14430
    str	r6, [sp, #12]
    mov.w	lr, #7
    mov	r1, r7
    add	r0, sp, #176
    str.w	lr, [sp]
    str	r7, [sp, #4]
    bl .Lcode_19490
    ldr	r6, [sp, #24]
    ldr	r2, .Lliteral_14431
    str.w	r8, [sp, #228]
    add.w	r9, r6, #18
    add	r6, sp, #216
    str	r6, [sp, #32]
    mov	r6, r5
    mov	r8, r4
    str	r2, [sp, #204]
    str	r4, [sp, #20]
    ldr	r2, .Lliteral_14432
    ldr.w	r4, [r6], #4
    ldr	r3, .Lliteral_14433
    str	r2, [sp, #208]
    subs	r1, r4, #2
    ldr	r2, .Lliteral_14434
    str	r3, [sp, #200]
    movs	r0, #5
    cmp	r1, #0
    str	r2, [sp, #212]
    str	r0, [sp, #216]
    mov	lr, r0
    str	r7, [sp, #220]
    str	r7, [sp, #224]
    str.w	fp, [sp, #24]
    ldrsh.w	r2, [r9], #2
    add.w	r0, r8, #4
    ble.n .Lcode_14305
.Lcode_14279:
    movs	r7, #4
    str	r7, [sp, #4]
    ldr	r7, [sp, #272]
    str.w	lr, [sp]
    str	r7, [sp, #8]
    ldr	r7, [sp, #276]
    cmp	r1, #4
    it	ge
    movge	r1, #4
    str	r7, [sp, #12]
    bl .Lcode_19490
.Lcode_14290:
    cmp	r6, fp
    beq.n .Lcode_14314
.Lcode_14292:
    ldr	r7, [sp, #24]
    ldrsh.w	r2, [r9], #2
    ldr.w	r3, [r7, #4]!
    add.w	r8, r8, r4, lsl #1
    str	r7, [sp, #24]
    ldr.w	r4, [r6], #4
    ldr	r7, [sp, #32]
    subs	r1, r4, #2
    ldr.w	lr, [r7, #4]!
    cmp	r1, #0
    str	r7, [sp, #32]
    add.w	r0, r8, #4
    bgt.n .Lcode_14279
.Lcode_14305:
    ldr	r7, [sp, #276]
    ldr	r0, [sp, #272]
    mov	r1, r2
    cmp	r7, #0
    beq.w .Lcode_14426
    movs	r2, #0
    bl .Lcode_13935
    cmp	r6, fp
    bne.n .Lcode_14292
.Lcode_14314:
    movs	r1, #8
    ldr	r0, [sp, #36]
    ldr	r4, [sp, #20]
    mov	r2, r1
    bl .Lcode_19687
    ldr	r3, [sp, #36]
    movw	r6, #23170
.Lcode_14321:
    ldrsh.w	r1, [r3]
    ldrsh.w	r2, [r3, #2]
    lsls	r1, r1, #15
    lsls	r2, r2, #15
    subs	r0, r1, r2
    smultb	r0, r0, r6
    adds	r2, r1, r2
    asrs	r2, r2, #16
    asrs	r0, r0, #15
    strh	r2, [r3, #0]
    strh	r0, [r3, #2]
    adds	r3, #4
    cmp	r3, r5
    bne.n .Lcode_14321
    ldr	r7, [sp, #36]
    mov	r6, r4
    mov	r8, r5
    mov	r9, r4
.Lcode_14339:
    ldrh	r2, [r7, #0]
    ldr.w	r4, [r8], #4
    ldrh	r3, [r7, #2]
    strh	r2, [r6, #0]
    strh	r3, [r6, #2]
    mov	r0, r6
    movs	r2, #6
    mov	r1, r4
    bl .Lcode_19687
    adds	r7, #4
    cmp	fp, r8
    add.w	r6, r6, r4, lsl #1
    bne.n .Lcode_14339
    ldr	r0, [sp, #28]
    movs	r1, #15
    movs	r2, #5
    bl .Lcode_6854
    ldr	r6, [sp, #48]
    ldr	r7, [sp, #40]
    subs	r0, r6, r0
    smulbb	r0, r7, r0
    ldr	r6, [sp, #36]
    mov	r4, r9
    lsls	r0, r0, #1
    movs	r3, #0
.Lcode_14364:
    ldrsh	r2, [r6, r3]
    ldr	r1, [r5, r3]
    adds	r3, #4
    mul.w	r2, r1, r2
    cmp	r3, #16
    sub.w	r0, r0, r2, lsl #1
    bne.n .Lcode_14364
    ldr	r1, [sp, #28]
    bl .Lcode_6534
    ldr	r6, [sp, #40]
    lsls	r0, r0, #16
    movs	r5, #2
    smlabb	r5, r6, r5, r4
    asrs	r0, r0, #1
    mov	r1, r4
    mvn.w	r6, #2147483648
.Lcode_14380:
    ldrsh.w	r2, [r4], #2
    add.w	r2, r0, r2, lsl #15
    lsls	r3, r2, #1
    cmp.w	r2, r3, asr #1
    it	ne
    eorne.w	r3, r6, r2, asr #31
    asrs	r3, r3, #16
    cmp	r4, r5
    strh.w	r3, [r4, #-2]
    bne.n .Lcode_14380
    mov.w	r4, #34816
    add	r0, sp, #56
    mvn.w	r6, #2147483648
    movt	r4, #65535
    movw	r5, #30719
.Lcode_14395:
    ldrsh.w	r2, [r0], #2
    ldrsh.w	r3, [r1], #2
    lsls	r2, r2, #15
    add.w	r2, r2, r3, lsl #15
    lsls	r3, r2, #1
    cmp.w	r2, r3, asr #1
    it	ne
    eorne.w	r3, r6, r2, asr #31
    asrs	r2, r3, #16
    cmp	r2, r4
    it	lt
    movlt	r2, r4
    cmp	r2, r5
    it	ge
    movge	r2, r5
    uxth	r2, r2
    cmp	r0, sl
    strh.w	r2, [r1, #-2]
    bne.n .Lcode_14395
    ldr	r7, [sp, #44]
    ldr	r6, [sp, #52]
    add.w	r3, r7, r6, lsl #1
    ldr	r7, [sp, #28]
    rsbs	r1, r7, #56
    beq.n .Lcode_14424
    add.w	r1, r3, r1, lsl #1
.Lcode_14421:
    strh.w	r2, [r3], #2
    cmp	r3, r1
    bne.n .Lcode_14421
.Lcode_14424:
    add	sp, #236
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_14426:
    bl .Lcode_14920
    b.n .Lcode_14290
.Lliteral_14428:
    .word .Ldata_19899
.Lliteral_14429:
    .word .Ldata_19897
.Lliteral_14430:
    .word .Ldata_19896
.Lliteral_14431:
    .word .Ldata_19894
.Lliteral_14432:
    .word .Ldata_19893
.Lliteral_14433:
    .word .Ldata_19895
.Lliteral_14434:
    .word .Ldata_19892
.Lcode_14435:
    ldr	r7, [sp, #40]
    movw	r6, #32769
    mov.w	lr, #2
    smlabb	lr, r7, lr, r4
    mov	r3, r4
    add	r2, sp, #56
    movt	r6, #65535
    movw	r7, #32767
.Lcode_14443:
    ldrsh.w	r0, [r3]
    ldrsh.w	r1, [r2], #2
    subs	r1, r0, r1
    cmp	r1, r6
    it	lt
    movlt	r1, r6
    cmp	r1, r7
    it	ge
    movge	r1, r7
    strh.w	r1, [r3], #2
    cmp	r3, lr
    bne.n .Lcode_14443
    ldr	r7, [sp, #28]
    adds	r7, #8
    add	r6, sp, #168
    str	r7, [sp, #52]
    ldr	r7, [sp, #44]
    str	r6, [sp, #36]
    add.w	r6, r7, #16
    ldr	r7, [sp, #36]
    mov	r9, r5
    mov	r8, r4
.Lcode_14465:
    ldr.w	r4, [r9], #4
    movs	r2, #6
    mov	r0, r6
    mov	r1, r4
    bl .Lcode_19286
    ldrh	r2, [r6, #0]
    ldrh	r3, [r6, #2]
    strh	r2, [r7, #0]
    subs	r2, r4, #6
    add.w	r0, r6, #12
    strh	r3, [r7, #2]
    movs	r1, #0
    sxth	r2, r2
    adds	r7, #4
    bl .Lcode_2535
    cmp	r7, r5
    add.w	r6, r6, r4, lsl #1
    bne.n .Lcode_14465
    movw	r0, #32769
    ldr	r3, [sp, #36]
    mov	r4, r8
    movw	lr, #23170
    movt	r0, #65535
    movw	r6, #32767
.Lcode_14489:
    ldrh	r2, [r3, #2]
    ldrsh.w	r1, [r3]
    smulbb	r2, r2, lr
    lsls	r1, r1, #15
    lsls	r2, r2, #1
    adds	r7, r1, r2
    subs	r2, r1, r2
    asrs	r7, r7, #15
    asrs	r2, r2, #15
    cmp	r7, r0
    it	lt
    movlt	r7, r0
    cmp	r2, r0
    it	lt
    movlt	r2, r0
    cmp	r7, r6
    it	ge
    movge	r7, r6
    cmp	r2, r6
    it	ge
    movge	r2, r6
    strh	r7, [r3, #0]
    strh	r2, [r3, #2]
    adds	r3, #4
    cmp	r3, r5
    bne.n .Lcode_14489
    movs	r1, #8
    ldr	r0, [sp, #36]
    mov	r2, r1
    bl .Lcode_19286
    b.n .Lcode_14222
.Lcode_14520:
    mvn.w	r5, #3221225472
    b.n .Lcode_14185
    .byte 0x00
    .byte 0xbf
.Lcode_14522:
.global asm_quantize_spectral_frame
.type asm_quantize_spectral_frame, %function
.thumb_func
asm_quantize_spectral_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    mov	r4, r1
    mov	lr, r1
    sub	sp, #28
    ldrsh.w	r1, [lr], #16
    ldrsh.w	ip, [r4, #4]
    ldrsh.w	r8, [r2, #12]
    ldr.w	r9, [sp, #56]
    str.w	r8, [sp, #4]
    mov	r7, r3
    mov	r5, r2
    mov	r6, r0
    mov	r2, lr
    mov	r3, ip
    add.w	lr, r0, #132
    add.w	r0, sp, #22
    str.w	r9, [sp, #12]
    str.w	lr, [sp]
    str	r7, [sp, #8]
    bl .Lcode_19737
    ldrsh.w	r2, [sp, #22]
    mov	r0, r6
    mov	r1, r4
    mov	r3, r5
    stmia.w	sp, {r7, r9}
    bl .Lcode_14115
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_14550:
.global asm_reorder_spectral_blocks
.type asm_reorder_spectral_blocks, %function
.thumb_func
asm_reorder_spectral_blocks:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl}
    sub	sp, #388
    cbnz	r1, .Lcode_14567
    ldrsh.w	r6, [r2, #4]
    cmp	r6, #0
    ble.w .Lcode_14918
    lsls	r6, r6, #1
    mov	r3, r1
    mov	r4, sp
.Lcode_14559:
    ldrh	r5, [r0, r3]
    strh	r5, [r4, r3]
    adds	r3, #2
    cmp	r3, r6
    bne.n .Lcode_14559
.Lcode_14564:
    mov	ip, r0
    mov	r5, sp
    b.n .Lcode_14570
.Lcode_14567:
    mov	r4, sp
    mov	r5, r0
    mov	ip, sp
.Lcode_14570:
    add.w	r7, r5, #8
    mov	r3, ip
.Lcode_14572:
    ldrh.w	r6, [r5], #2
    cmp	r5, r7
    strh.w	r6, [r3], #2
    bne.n .Lcode_14572
    add.w	ip, ip, #8
    ldrsh.w	r8, [r2, #10]
    cmp	r1, #0
    bne.w .Lcode_14916
    add.w	r5, r4, r8, lsl #1
.Lcode_14581:
    add.w	r7, r5, #8
    mov	r3, ip
.Lcode_14583:
    ldrh.w	r6, [r5], #2
    cmp	r5, r7
    strh.w	r6, [r3], #2
    bne.n .Lcode_14583
    add.w	r3, ip, #8
    cmp	r1, #0
    bne.w .Lcode_14912
    ldrsh.w	r5, [r2, #8]
    add	r8, r5
    add.w	r5, r4, r8, lsl #1
.Lcode_14593:
    add.w	ip, r5, #8
    mov	r6, r3
.Lcode_14595:
    ldrh.w	r7, [r5], #2
    cmp	r5, ip
    strh.w	r7, [r6], #2
    bne.n .Lcode_14595
    adds	r3, #8
    mov	ip, r5
    cmp	r1, #0
    bne.w .Lcode_14908
    ldrsh.w	r5, [r2, #12]
    add	r8, r5
    add.w	ip, r4, r8, lsl #1
.Lcode_14606:
    mov	r5, ip
    add.w	r7, r3, #16
.Lcode_14608:
    ldrh.w	r6, [r5], #2
    strh.w	r6, [r3], #2
    cmp	r3, r7
    bne.n .Lcode_14608
    add.w	r5, ip, #16
    cmp	r1, #0
    bne.w .Lcode_14904
    ldrsh.w	r5, [r2, #14]
    add	r8, r5
    add.w	r5, r4, r8, lsl #1
.Lcode_14618:
    add.w	ip, r5, #8
    mov	r6, r3
.Lcode_14620:
    ldrh.w	r7, [r5], #2
    cmp	r5, ip
    strh.w	r7, [r6], #2
    bne.n .Lcode_14620
    adds	r3, #8
    cmp	r1, #0
    bne.w .Lcode_14900
    ldrsh.w	r5, [r2, #16]
    add	r8, r5
    add.w	r5, r4, r8, lsl #1
.Lcode_14630:
    add.w	ip, r5, #8
    mov	r6, r3
.Lcode_14632:
    ldrh.w	r7, [r5], #2
    cmp	r5, ip
    strh.w	r7, [r6], #2
    bne.n .Lcode_14632
    ldrsh.w	r7, [r2, #18]
    adds	r3, #8
    add	r7, r8
    cmp	r1, #0
    bne.w .Lcode_14898
    add.w	r5, r4, r7, lsl #1
.Lcode_14642:
    ldrh	r6, [r5, #0]
    strh	r6, [r3, #0]
    ldrh	r6, [r5, #2]
    strh	r6, [r3, #2]
    ldrh.w	ip, [r5, #4]
    strh.w	ip, [r3, #4]
    adds	r6, r3, #6
    ldrsh.w	r3, [r2, #20]
    adds	r5, #6
    adds	r3, r3, r7
    cmp	r1, #0
    bne.w .Lcode_14896
    add.w	r5, r4, r3, lsl #1
.Lcode_14655:
    ldrh	r7, [r5, #0]
    strh	r7, [r6, #0]
    ldrh	r7, [r5, #2]
    strh	r7, [r6, #2]
    ldrh	r7, [r5, #4]
    strh	r7, [r6, #4]
    cmp	r1, #0
    bne.w .Lcode_14885
    ldrsh.w	r5, [r2, #22]
    adds	r5, r5, r3
    add.w	r3, r6, #8
    ldrh.w	r5, [r4, r5, lsl #1]
    strh	r5, [r6, #6]
    ldrsh.w	r6, [r2, #10]
    ldrsh.w	r7, [r2, #8]
    adds	r5, r6, #4
    add.w	r5, r4, r5, lsl #1
    sub.w	r8, r7, #4
.Lcode_14673:
    cmp.w	r8, #0
    ble.n .Lcode_14685
    mov.w	r8, r8, lsl #1
    mov	r6, r5
    add.w	ip, r3, r8
.Lcode_14678:
    ldrh.w	r7, [r6], #2
    strh.w	r7, [r3], #2
    cmp	r3, ip
    bne.n .Lcode_14678
    ldrsh.w	r6, [r2, #10]
    ldrsh.w	r7, [r2, #8]
    add	r5, r8
.Lcode_14685:
    cmp	r1, #0
    bne.w .Lcode_14879
    adds	r5, r6, r7
    ldrsh.w	r7, [r2, #12]
    adds	r5, #4
    add.w	r5, r4, r5, lsl #1
    subs	r7, #4
.Lcode_14692:
    cmp	r7, #0
    ble.n .Lcode_14703
    mov.w	r8, r7, lsl #1
    mov	r6, r5
    add.w	ip, r3, r8
.Lcode_14697:
    ldrh.w	r7, [r6], #2
    strh.w	r7, [r3], #2
    cmp	r3, ip
    bne.n .Lcode_14697
    ldrsh.w	r6, [r2, #10]
    add	r5, r8
.Lcode_14703:
    subs	r7, r6, #4
    cmp	r1, #0
    bne.w .Lcode_14877
    add	r5, sp, #8
.Lcode_14707:
    cmp	r7, #0
    ble.n .Lcode_14718
    mov.w	r8, r7, lsl #1
    mov	r6, r5
    add.w	ip, r3, r8
.Lcode_14712:
    ldrh.w	r7, [r6], #2
    strh.w	r7, [r3], #2
    cmp	r3, ip
    bne.n .Lcode_14712
    ldrsh.w	r6, [r2, #10]
    add	r5, r8
.Lcode_14718:
    ldrsh.w	ip, [r2, #8]
    ldrsh.w	r8, [r2, #12]
    ldrsh.w	r7, [r2, #14]
    ldrh.w	sl, [r2, #16]
    add	ip, r6
    add	ip, r8
    add	ip, r7
    cmp	r1, #0
    add.w	r6, ip, #4
    it	eq
    moveq	r5, r3
    add.w	r3, r4, r6, lsl #1
    bne.n .Lcode_14734
    mov	r6, r3
    mov	r3, r5
    mov	r5, r6
.Lcode_14734:
    sxth.w	sl, sl
    cmp.w	sl, #4
    ble.n .Lcode_14750
    add.w	r9, r3, sl, lsl #1
    mov	r7, r5
    sub.w	r9, r9, #8
    mov	r6, r3
.Lcode_14741:
    ldrh.w	r8, [r7], #2
    strh.w	r8, [r6], #2
    cmp	r6, r9
    bne.n .Lcode_14741
    sub.w	r6, sl, #4
    lsls	r6, r6, #1
    ldrsh.w	r7, [r2, #14]
    adds	r3, r3, r6
    adds	r5, r5, r6
.Lcode_14750:
    cmp	r1, #0
    bne.w .Lcode_14872
    add.w	r5, ip, #8
    subs	r5, r5, r7
    add.w	r5, r4, r5, lsl #1
    subs	r7, #8
.Lcode_14756:
    cmp	r7, #0
    ble.n .Lcode_14766
    mov.w	r9, r7, lsl #1
    add.w	r8, r5, r9
    mov	r6, r3
.Lcode_14761:
    ldrh.w	r7, [r5], #2
    cmp	r5, r8
    strh.w	r7, [r6], #2
    bne.n .Lcode_14761
    add	r3, r9
.Lcode_14766:
    cmp	r1, #0
    bne.w .Lcode_14865
    ldrsh.w	r5, [r2, #16]
    ldrsh.w	r8, [r2, #18]
    add	ip, r5
    add.w	r5, ip, #4
    add.w	r5, r4, r5, lsl #1
    sub.w	r9, r8, #4
.Lcode_14774:
    cmp.w	r9, #0
    ble.n .Lcode_14785
    mov.w	r9, r9, lsl #1
    mov	r6, r5
    add.w	r8, r3, r9
.Lcode_14779:
    ldrh.w	r7, [r6], #2
    strh.w	r7, [r3], #2
    cmp	r3, r8
    bne.n .Lcode_14779
    ldrsh.w	r8, [r2, #18]
    add	r5, r9
.Lcode_14785:
    add	ip, r8
    ldrsh.w	r6, [r2, #20]
    cmp	r1, #0
    bne.n .Lcode_14861
    add.w	r5, ip, #3
    add.w	r5, r4, r5, lsl #1
    subs	r7, r6, #3
.Lcode_14792:
    cmp	r7, #0
    ble.n .Lcode_14803
    mov.w	r9, r7, lsl #1
    add.w	r8, r5, r9
    mov	r6, r3
.Lcode_14797:
    ldrh.w	r7, [r5], #2
    cmp	r5, r8
    strh.w	r7, [r6], #2
    bne.n .Lcode_14797
    ldrsh.w	r6, [r2, #20]
    add	r3, r9
.Lcode_14803:
    add.w	r8, r6, ip
    ldrsh.w	r6, [r2, #22]
    cmp	r1, #0
    bne.n .Lcode_14857
    add.w	r5, r8, #3
    add.w	r5, r4, r5, lsl #1
    sub.w	r9, r6, #3
.Lcode_14810:
    cmp.w	r9, #0
    ble.n .Lcode_14821
    mov.w	r9, r9, lsl #1
    mov	r6, r5
    add.w	ip, r3, r9
.Lcode_14815:
    ldrh.w	r7, [r6], #2
    strh.w	r7, [r3], #2
    cmp	r3, ip
    bne.n .Lcode_14815
    ldrsh.w	r6, [r2, #22]
    add	r5, r9
.Lcode_14821:
    cmp	r1, #0
    bne.n .Lcode_14851
    add.w	r5, r6, r8
    ldrsh.w	r7, [r2, #24]
    adds	r5, #1
    add.w	r5, r4, r5, lsl #1
    subs	r7, #1
.Lcode_14828:
    cmp	r7, #0
    ble.n .Lcode_14835
    add.w	r7, r5, r7, lsl #1
.Lcode_14831:
    ldrh.w	r6, [r5], #2
    cmp	r5, r7
    strh.w	r6, [r3], #2
    bne.n .Lcode_14831
.Lcode_14835:
    cbz	r1, .Lcode_14848
    ldrsh.w	r3, [r2, #4]
    cmp	r3, #0
    ble.n .Lcode_14848
    movs	r3, #0
    mov	r1, r3
.Lcode_14841:
    ldrh	r5, [r4, r3]
    strh	r5, [r0, r3]
    ldrsh.w	r5, [r2, #4]
    adds	r1, #1
    adds	r3, #2
    cmp	r5, r1
    bgt.n .Lcode_14841
.Lcode_14848:
    add	sp, #388
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx	lr
.Lcode_14851:
    add.w	r3, r6, r8
    ldrsh.w	r7, [r2, #24]
    adds	r3, #1
    add.w	r3, r4, r3, lsl #1
    subs	r7, #1
    b.n .Lcode_14828
.Lcode_14857:
    add.w	r3, r8, #3
    add.w	r3, r4, r3, lsl #1
    sub.w	r9, r6, #3
    b.n .Lcode_14810
.Lcode_14861:
    add.w	r3, ip, #3
    add.w	r3, r4, r3, lsl #1
    subs	r7, r6, #3
    b.n .Lcode_14792
.Lcode_14865:
    ldrsh.w	r3, [r2, #16]
    ldrsh.w	r8, [r2, #18]
    add	ip, r3
    add.w	r3, ip, #4
    add.w	r3, r4, r3, lsl #1
    sub.w	r9, r8, #4
    b.n .Lcode_14774
.Lcode_14872:
    add.w	r3, ip, #8
    subs	r3, r3, r7
    add.w	r3, r4, r3, lsl #1
    subs	r7, #8
    b.n .Lcode_14756
.Lcode_14877:
    add	r3, sp, #8
    b.n .Lcode_14707
.Lcode_14879:
    adds	r3, r7, r6
    ldrsh.w	r7, [r2, #12]
    adds	r3, #4
    add.w	r3, r4, r3, lsl #1
    subs	r7, #4
    b.n .Lcode_14692
.Lcode_14885:
    ldrsh.w	ip, [r2, #22]
    ldrsh.w	r6, [r2, #10]
    ldrh.w	r8, [r5, #6]
    ldrsh.w	r7, [r2, #8]
    add	ip, r3
    adds	r3, r6, #4
    strh.w	r8, [r4, ip, lsl #1]
    adds	r5, #8
    add.w	r3, r4, r3, lsl #1
    sub.w	r8, r7, #4
    b.n .Lcode_14673
.Lcode_14896:
    add.w	r6, r4, r3, lsl #1
    b.n .Lcode_14655
.Lcode_14898:
    add.w	r3, r4, r7, lsl #1
    b.n .Lcode_14642
.Lcode_14900:
    ldrsh.w	r3, [r2, #16]
    add	r8, r3
    add.w	r3, r4, r8, lsl #1
    b.n .Lcode_14630
.Lcode_14904:
    ldrsh.w	r3, [r2, #14]
    add	r8, r3
    add.w	r3, r4, r8, lsl #1
    b.n .Lcode_14618
.Lcode_14908:
    ldrsh.w	r3, [r2, #12]
    add	r8, r3
    add.w	r3, r4, r8, lsl #1
    b.n .Lcode_14606
.Lcode_14912:
    ldrsh.w	r3, [r2, #8]
    add	r8, r3
    add.w	r3, r4, r8, lsl #1
    b.n .Lcode_14593
.Lcode_14916:
    add.w	ip, r4, r8, lsl #1
    b.n .Lcode_14581
.Lcode_14918:
    mov	r4, sp
    b.n .Lcode_14564
.Lcode_14920:
.global asm_read_bits_cursor
.type asm_read_bits_cursor, %function
.thumb_func
asm_read_bits_cursor:
    push	{r3, r4, r5, lr}
    mov	r4, r0
    ldr	r0, [r0, #0]
    mov	r5, r1
    bl .Lcode_5752
    ldr	r3, [r4, #0]
    add.w	r5, r3, r5, lsl #1
    str	r5, [r4, #0]
    pop	{r3, r4, r5, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_14929:
.global asm_decode_spread_codeword
.type asm_decode_spread_codeword, %function
.thumb_func
asm_decode_spread_codeword:
    push	{r4}
    cmp	r0, #1
    ldr	r4, [sp, #4]
    beq.n .Lcode_14938
    movs	r3, #0
    str	r3, [r2, #0]
    str	r3, [r1, #0]
    pop	{r4}
    bx	lr
.Lcode_14938:
    rsb	r4, r4, #7
    lsls	r3, r4
    ldr	r0, .Lliteral_14948
    sxth	r3, r3
    ldr.w	r3, [r0, r3, lsl #2]
    mov	r0, r1
    mov	r1, r2
    mov	r2, r3
    pop	{r4}
    b.w .Lcode_19386
.Lliteral_14948:
    .word .Ldata_20695
.Lcode_14949:
.global asm_adjust_harmonic_samples
.type asm_adjust_harmonic_samples, %function
.thumb_func
asm_adjust_harmonic_samples:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r4, r0
    sub	sp, #156
    ldrsh.w	r0, [r0, #4]
    add.w	lr, r4, #16
    add	r7, sp, #144
    mov	r6, r1
    mov	r9, r2
    mov	r1, lr
    mov	r2, r0
    mov	r0, r7
    mov	r8, r3
    bl .Lcode_7556
    ldrsh.w	r2, [r4, #4]
    str	r7, [sp, #0]
    lsls	r2, r2, #16
    ldr	r7, [sp, #144]
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    adds	r7, #8
    lsls	r2, r3
    asrs	r2, r2, #16
    rsb	r3, r3, #15
    mov	r1, r7
    str	r7, [sp, #144]
    bl .Lcode_6721
    movs	r2, #4
    lsls	r0, r0, #16
    ldr	r1, [sp, #144]
    bl .Lcode_6971
    ldrh.w	r2, [r6, #130]
    movs	r3, #4
    uxth	r0, r0
    lsls	r7, r0, #16
    str	r3, [sp, #144]
    mov.w	r1, #134217728
    lsls	r3, r2, #16
    qsub	r1, r3, r1
    qsub	r1, r1, r7
    cmp	r1, #0
    blt.w .Lcode_15150
    sub.w	r3, r3, #1310720
    asrs	r3, r3, #16
    strh.w	r3, [r6, #130]
.Lcode_14999:
    cmp.w	r9, #3
    bgt.n .Lcode_15003
    cmp.w	r8, #1
    ble.w .Lcode_15145
.Lcode_15003:
    mov	r0, r6
    add	r2, sp, #152
    ldrh.w	r1, [r0, #16]!
    movs	r3, #0
    strh.w	r1, [r2, #-128]!
    b.n .Lcode_15010
.Lcode_15009:
    ldrh.w	r1, [r0, #2]!
.Lcode_15010:
    adds	r3, #1
    cmp	r3, #56
    strh.w	r1, [r2, #2]!
    bne.n .Lcode_15009
    ldrsh.w	r2, [r6, #12]
    ldrsh.w	r0, [r4, #12]
    ldrh.w	r7, [sp, #136]
    ldrsh.w	lr, [r6, #130]
    strh.w	r7, [sp, #138]
    lsls	r2, r2, #16
    lsls	r0, r0, #16
    movw	r1, #65532
    mov	r6, r2
    mov	r3, r1
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    movt	r1, #65535
    sxth.w	ip, r6
    mov	r6, r0
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    sxth	r6, r6
    lsls	r0, r6
    subs	r1, r1, r6
    lsl.w	r2, r2, ip
    movt	r3, #65535
    mov.w	r6, r8, lsl #27
    asrs	r2, r2, #16
    rsb	r3, ip, r3
    asrs	r6, r6, #1
    strh.w	r7, [sp, #140]
    strh.w	r7, [sp, #142]
    add	r7, sp, #148
    mov.w	lr, lr, lsl #16
    rsb	r6, r6, #738197504
    str	r7, [sp, #0]
    qadd	r6, lr, r6
    bl .Lcode_6721
    ldrsh.w	sl, [r4, #4]
    movs	r2, #0
    movw	r1, #34817
    sxth	r0, r0
    asrs	r6, r6, #16
    movt	r1, #65535
    adds	r3, r2, #1
    mov	r9, r0
    lsls	r6, r6, #16
    str	r1, [sp, #16]
    cmp	r2, sl
    mul.w	r1, r9, r3
    str	r6, [sp, #12]
    mov.w	fp, #268435456
    str.w	sl, [sp, #20]
    mov.w	r1, r1, lsl #1
    bge.n .Lcode_15145
.Lcode_15073:
    ldr	r0, [sp, #148]
    ldrh	r6, [r4, #12]
    cmp	r0, #0
    blt.n .Lcode_15147
    lsls	r1, r0
.Lcode_15078:
    asrs	r0, r1, #16
    add	r7, sp, #152
    ubfx	r1, r1, #1, #15
    add.w	ip, r7, r0, lsl #1
    mov.w	r8, r1, lsl #16
    ldrh.w	r7, [ip, #-128]
    ldrsh.w	r0, [ip, #-126]
    rsb	r8, r8, #2130706432
    adds	r2, #8
    add.w	r8, r8, #16711680
    smultb	r8, r8, r7
    mla	r8, r0, r1, r8
    add.w	ip, r3, r3, lsl #1
    ldrsh.w	r7, [r4, r2, lsl #1]
    mov.w	ip, ip, lsl #17
    sbfx	r8, r8, #15, #16
    lsls	r7, r7, #16
    smultb	ip, ip, r6
    mov.w	r8, r8, lsl #16
    qsub	r1, r7, r8
    qsub	r1, r1, fp
    cmp	r1, #0
    sbfx	ip, ip, #8, #16
    ble.n .Lcode_15139
    ldr	r0, [sp, #12]
    cmp.w	ip, #4096
    it	ge
    movge.w	ip, #4096
    sub.w	ip, r0, ip, lsl #16
    qsub	ip, r7, ip
    cmp.w	ip, #0
    mov.w	r6, ip, asr #16
    ble.n .Lcode_15139
    cmp.w	r6, #1024
    it	ge
    movge.w	r6, #1024
    ldr	r1, [sp, #8]
    qsub	r7, r8, r7
    asrs	r7, r7, #16
    smull	r5, r1, r7, r6
    qadd	r0, r5, r5
    str	r1, [sp, #8]
    lsls	r1, r0, #4
    cmp.w	r0, r1, asr #4
    itt	ne
    mvnne.w	r6, #2147483648
    eorne.w	r1, r6, r0, asr #31
    ldrsh.w	r0, [r4, r2, lsl #1]
    ldr	r7, [sp, #16]
    ldr.w	sl, [sp, #20]
    lsls	r0, r0, #16
    qadd	r1, r0, r1
    asrs	r1, r1, #16
    cmp	r1, r7
    it	lt
    movlt	r1, r7
    movw	r0, #30719
    cmp	r1, r0
    it	ge
    movge	r1, r0
    strh.w	r1, [r4, r2, lsl #1]
.Lcode_15139:
    mov	r2, r3
    adds	r3, r2, #1
    mul.w	r1, r9, r3
    cmp	r2, sl
    mov.w	r1, r1, lsl #1
    blt.n .Lcode_15073
.Lcode_15145:
    add	sp, #156
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_15147:
    negs	r0, r0
    asrs	r1, r0
    b.n .Lcode_15078
.Lcode_15150:
    movw	r3, #32112
    smulbb	r3, r2, r3
    movw	r2, #20971
    smulbb	r0, r0, r2
    lsls	r3, r3, #1
    add.w	r3, r3, r0, asr #4
    asrs	r3, r3, #16
    strh.w	r3, [r6, #130]
    b.n .Lcode_14999
.Lcode_15159:
.global asm_resample_step_q16
.type asm_resample_step_q16, %function
.thumb_func
asm_resample_step_q16:
    cmp	r0, r1
    push	{r3, r4, r5, lr}
    beq.n .Lcode_15201
    lsls	r1, r1, #16
    mov	r3, r1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r1, r3
    movw	r4, #65532
    movt	r4, #65535
    asrs	r1, r1, #16
    subs	r4, r4, r3
    lsls	r3, r0, #16
    cmp	r0, r1
    bge.n .Lcode_15189
    mov	r0, r3
    bl .Lcode_6534
    mvn.w	r5, #3
    subs	r3, r5, r4
    lsls	r0, r0, #16
    cmp	r3, #14
    ble.n .Lcode_15197
.Lcode_15186:
    subs	r3, #15
    lsls	r0, r3
    pop	{r3, r4, r5, pc}
.Lcode_15189:
    asrs	r3, r3, #1
    mov	r0, r3
    bl .Lcode_6534
    mvn.w	r5, #2
    subs	r3, r5, r4
    lsls	r0, r0, #16
    cmp	r3, #14
    bgt.n .Lcode_15186
.Lcode_15197:
    subs	r4, r4, r5
    adds	r4, #15
    asrs	r0, r4
    pop	{r3, r4, r5, pc}
.Lcode_15201:
    mov.w	r0, #65536
    pop	{r3, r4, r5, pc}
.Lcode_15203:
.global asm_resample_spectrum
.type asm_resample_spectrum, %function
.thumb_func
asm_resample_spectrum:
    push	{r4, r5, r6, r7, lr}
    ldrh	r5, [r3, #0]
    sub	sp, #124
    mov	r4, r0
    strh.w	r5, [sp]
    add.w	r6, sp, #114
    add.w	r0, sp, #2
    b.n .Lcode_15212
.Lcode_15211:
    ldrh.w	r5, [r3, #2]!
.Lcode_15212:
    strh.w	r5, [r0], #2
    cmp	r0, r6
    bne.n .Lcode_15211
    mov	r0, r1
    mov	r1, r2
    strh.w	r5, [sp, #114]
    strh.w	r5, [sp, #116]
    strh.w	r5, [sp, #118]
    bl .Lcode_15159
    ldr	r6, [sp, #144]
    mov	r2, r0
    add.w	r6, r4, r6, lsl #1
    b.n .Lcode_15243
.Lcode_15225:
    adds	r1, r3, #1
    cmp	r1, #60
    it	eq
    moveq	r1, #59
.Lcode_15229:
    add.w	ip, sp, #120
    add.w	r3, ip, r3, lsl #1
    add.w	r1, ip, r1, lsl #1
    ldrh.w	r3, [r3, #-120]
    ldrh.w	r1, [r1, #-120]
    smulbb	r3, r3, r7
    lsls	r3, r3, #1
    smulbb	r5, r1, r5
    qdadd	r5, r3, r5
    asrs	r5, r5, #16
    strh.w	r5, [r4], #2
    cmp	r4, r6
    add	r2, r0
    beq.n .Lcode_15254
.Lcode_15243:
    ubfx	r5, r2, #1, #15
    lsls	r7, r5, #16
    rsb	r7, r7, #2130706432
    asrs	r3, r2, #16
    add.w	r7, r7, #16711680
    lsrs	r7, r7, #16
    cmp	r3, #59
    ble.n .Lcode_15225
    movs	r3, #59
    mov	r1, r3
    b.n .Lcode_15229
.Lcode_15254:
    add	sp, #124
    pop	{r4, r5, r6, r7, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_15256:
.global asm_interpolate_frame_state
.type asm_interpolate_frame_state, %function
.thumb_func
asm_interpolate_frame_state:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldrsh.w	r3, [r1, #2]
    cmp	r3, #255
    sub	sp, #232
    mov	r5, r1
    mov	r6, r0
    mov	r4, r2
    bne.n .Lcode_15267
    ldrsh.w	r3, [r2, #2]
    cmp	r3, #255
    beq.n .Lcode_15272
.Lcode_15267:
    mov	r0, r6
    mov	r1, r5
    bl .Lcode_19831
.Lcode_15270:
    add	sp, #232
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_15272:
    ldrsh.w	r3, [r2]
    cmp	r3, #2
    beq.w .Lcode_15365
    ldrsh.w	r2, [r1]
    cmp	r2, #2
    beq.n .Lcode_15349
    ldr	r3, [r4, #8]
    ldr	r2, [r0, #8]
    tst.w	r3, #1431655765
    beq.n .Lcode_15284
    tst.w	r2, #2863311530
    beq.n .Lcode_15360
.Lcode_15284:
    ldrsh.w	r0, [r5, #12]
.Lcode_15285:
    uxth	r3, r0
    sxth	r0, r3
    strh	r3, [r6, #12]
    bl .Lcode_19411
    ldrh	r3, [r5, #2]
    ldrsh.w	r2, [r5, #12]
    ldrsh.w	r1, [r6, #12]
    strh	r3, [r6, #2]
    uxth	r7, r0
    add.w	r3, r5, #16
    strh	r7, [r6, #4]
    sxth	r5, r7
    add	r0, sp, #120
    str	r5, [sp, #0]
    bl .Lcode_15203
    ldrsh.w	r5, [r6, #4]
    ldrsh.w	r2, [r4, #12]
    ldrsh.w	r1, [r6, #12]
    str	r5, [sp, #0]
    add.w	r3, r4, #16
    add	r0, sp, #8
    bl .Lcode_15203
    ldrh	r3, [r6, #4]
    add	r2, sp, #8
    movw	r7, #34817
    mov.w	ip, #2
    add.w	r0, r6, #16
    sxth.w	sl, r3
    smlabb	ip, r3, ip, r2
    add	r4, sp, #120
    mov	r1, r2
    movw	r9, #30719
    movt	r7, #65535
.Lcode_15318:
    ldrsh.w	r8, [r4], #2
    ldrsh.w	r5, [r1], #2
    mov.w	r8, r8, lsl #16
    mov	r2, r8
    lsls	r5, r5, #16
    asrs	r3, r2, #31
    adds.w	r2, r8, r5
    adc.w	r3, r3, r5, asr #31
    asrs	r3, r3, #1
    mov.w	r2, r2, rrx
    asrs	r2, r2, #16
    cmp	r2, r9
    it	ge
    movge	r2, r9
    cmp	r2, r7
    it	lt
    movlt	r2, r7
    uxth	r2, r2
    cmp	r1, ip
    strh.w	r2, [r0], #2
    bne.n .Lcode_15318
    ldrsh.w	r3, [r6, #4]
    add.w	sl, sl, #8
    rsbs	r3, r3, #56
    add.w	r6, r6, sl, lsl #1
    beq.n .Lcode_15270
    add.w	r3, r6, r3, lsl #1
.Lcode_15345:
    strh.w	r2, [r6], #2
    cmp	r6, r3
    bne.n .Lcode_15345
    b.n .Lcode_15270
.Lcode_15349:
    ldrsh.w	r2, [r4, #134]
    cmp	r2, #1
    ble.n .Lcode_15381
.Lcode_15352:
    mov	r1, r5
    bl .Lcode_19831
.Lcode_15354:
    ldrsh.w	r3, [r6, #14]
    cmp	r3, #0
    ble.n .Lcode_15386
    sub.w	r3, r3, #20480
    strh	r3, [r6, #14]
    b.n .Lcode_15270
.Lcode_15360:
    ldr	r3, [r1, #8]
    tst.w	r3, #1431655765
    bne.n .Lcode_15392
    ldrsh.w	r0, [r4, #12]
    b.n .Lcode_15285
.Lcode_15365:
    ldr	r7, [r6, #8]
    ldrh	r4, [r6, #14]
    bl .Lcode_19831
    ldrsh.w	r3, [r5]
    str	r7, [r6, #8]
    cmp	r3, #2
    strh	r4, [r6, #14]
    beq.w .Lcode_15270
    add.w	r3, r6, #16
    adds	r6, #128
.Lcode_15375:
    ldrsh.w	r2, [r3]
    asrs	r2, r2, #1
    strh.w	r2, [r3], #2
    cmp	r3, r6
    bne.n .Lcode_15375
    b.n .Lcode_15270
.Lcode_15381:
    cmp	r3, #3
    beq.n .Lcode_15352
    mov	r1, r4
    bl .Lcode_19831
    b.n .Lcode_15354
.Lcode_15386:
    ldr	r3, [r6, #8]
    and.w	r3, r3, #1431655765
    str	r3, [r6, #8]
    movs	r3, #0
    strh	r3, [r6, #14]
    b.n .Lcode_15270
.Lcode_15392:
    ldrh	r0, [r1, #12]
    ldrh	r3, [r4, #12]
    smulbb	r0, r0, r3
    lsls	r0, r0, #1
    mvn.w	r1, #7
    mvn.w	r2, #3
    bl .Lcode_6971
    b.n .Lcode_15285
    .byte 0x00
    .byte 0xbf
.Lcode_15400:
.global asm_decode_spectral_frame_block
.type asm_decode_spectral_frame_block, %function
.thumb_func
asm_decode_spectral_frame_block:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #36
    mov	r4, r2
    str	r1, [sp, #12]
    mov	r5, r0
    movs	r1, #6
    mov	r0, r2
    mov	r7, r3
    bl .Lcode_14920
    movs	r1, #6
    mov	r0, r4
    bl .Lcode_14920
    movs	r1, #0
    mov	r6, r0
    movs	r2, #8
    add	r0, sp, #16
    bl .Lcode_2535
    ldrsh.w	sl, [r7, #4]
    sub.w	sl, sl, #13
    mov.w	sl, sl, asr #3
    lsls	r6, r6, #1
    cmp.w	sl, #0
    ble.n .Lcode_15482
    add	r7, sp, #16
    mov.w	fp, sl, lsl #1
    mov	r8, r7
    add.w	r9, r7, fp
.Lcode_15427:
    movs	r1, #8
    mov	r0, r4
    bl .Lcode_14920
    strh.w	r0, [r7], #2
    cmp	r7, r9
    bne.n .Lcode_15427
    ldrh.w	r0, [sp, #16]
    cmp.w	sl, #1
    sxth	r7, r0
    ble.n .Lcode_15486
    ldr	r1, .Lliteral_15488
    add.w	r3, sp, #14
    ldrb.w	lr, [r1]
    add	fp, r3
    movs	r3, #0
.Lcode_15442:
    ldrsh.w	r2, [r8, #2]!
    eors	r2, r7
    uxtb	r2, r2
    cmp	r8, fp
    ldrb	r2, [r1, r2]
    add	r2, lr
    add	r3, r2
    bne.n .Lcode_15442
.Lcode_15450:
    ldrh.w	r2, [sp, #18]
    eors	r0, r2
    tst.w	r0, #240
    bne.n .Lcode_15456
    cmp	r3, #5
    ble.n .Lcode_15480
.Lcode_15456:
    movw	r7, #65535
.Lcode_15457:
    movs	r1, #1
    mov	r0, r4
    bl .Lcode_14920
    orr.w	r2, r0, r6
    lsls	r2, r2, #17
    movw	r3, #30962
    sub.w	r2, r2, #1114112
    smultb	r2, r2, r3
    sbfx	r2, r2, #8, #16
    movs	r4, #0
    sxth	r1, r7
    mov	r0, r5
    mov	r3, r2
    str	r4, [sp, #0]
    bl .Lcode_5559
    mov	r4, r0
    cbnz	r0, .Lcode_15477
    ldr	r0, [sp, #12]
    mov	r1, r5
    bl .Lcode_19831
.Lcode_15477:
    mov	r0, r4
    add	sp, #36
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_15480:
    uxth	r7, r7
    b.n .Lcode_15457
.Lcode_15482:
    ldrh.w	r0, [sp, #16]
    movs	r3, #0
    sxth	r7, r0
    b.n .Lcode_15450
.Lcode_15486:
    movs	r3, #0
    b.n .Lcode_15450
.Lliteral_15488:
    .word .Ldata_20707
.Lcode_15489:
.global asm_decode_pitch_parameters
.type asm_decode_pitch_parameters, %function
.thumb_func
asm_decode_pitch_parameters:
    push	{r4, r5, r6, lr}
    cmp	r0, #1
    mov	r5, r2
    mov	r4, r1
    ldr	r2, [sp, #16]
    ldrsh.w	r6, [sp, #20]
    beq.n .Lcode_15501
    movw	r3, #16423
    strh	r3, [r1, #0]
    movs	r3, #15
    strh	r3, [r5, #0]
    pop	{r4, r5, r6, pc}
.Lcode_15501:
    subs	r2, #6
    movs	r1, #120
    lsls	r3, r3, #1
    lsls	r1, r2
    movw	r0, #10834
    mla	r0, r3, r0, r0
    sxth	r1, r1
    bl .Lcode_6588
    lsls	r2, r0, #16
    rsb	r2, r2, #3137339392
    add.w	r2, r2, #196608
    asrs	r2, r2, #16
    mov	r0, r4
    mov	r1, r5
    mov	r3, r6
    ldmia.w	sp!, {r4, r5, r6, lr}
    b.w .Lcode_19437
.Lcode_15518:
.global asm_expand_log_spectrum
.type asm_expand_log_spectrum, %function
.thumb_func
asm_expand_log_spectrum:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov.w	r3, #32768
    mov.w	r7, r2, lsl #1
    mov	r8, r2
    movw	r2, #34817
    mov	sl, r1
    adds	r5, r0, r7
    movt	r3, #65535
    movt	r2, #65535
    movw	r4, #30719
.Lcode_15528:
    ldrsh.w	r1, [r0]
    cmp	r1, r2
    it	lt
    movlt	r1, r2
    cmp	r1, r4
    it	ge
    movge	r1, r4
    strh.w	r1, [r0], #2
    cmp	r3, r1
    it	lt
    movlt	r3, r1
    cmp	r0, r5
    bne.n .Lcode_15528
    lsls	r6, r3, #16
    asrs	r6, r6, #11
    rsb	r9, r7, r0
    add.w	r6, r6, #65536
    asrs	r6, r6, #16
    mov	r5, r9
    mov	r4, r8
.Lcode_15548:
    ldrsh.w	r0, [r5]
    movs	r1, #4
    mov	r2, r6
    bl .Lcode_6911
    subs	r4, #1
    strh.w	r0, [r5], #2
    bne.n .Lcode_15548
    rsb	r8, r8, #56
    subs	r6, #15
    sxth.w	r2, r8
    add.w	r0, r9, r7
    mov	r1, r4
    str.w	r6, [sl]
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    b.w .Lcode_2535
    .byte 0x00
    .byte 0xbf
.Lcode_15563:
    push	{r4, r5, r6, r7}
    sub	sp, #32
    add	r6, sp, #32
    mov	r4, sp
.Lcode_15567:
    and.w	r5, r1, #3
    strh.w	r5, [r4], #2
    asrs	r1, r1, #2
    cmp	r4, r6
    bne.n .Lcode_15567
    lsls	r2, r2, #2
    ldrsh.w	r6, [sp, #30]
    add.w	r7, r0, r3, lsl #1
    mov	r4, r2
    b.n .Lcode_15592
.Lcode_15577:
    cmp.w	ip, #16
    ldrsh.w	r5, [r5, #-32]
    beq.n .Lcode_15611
    add	r1, sp, #32
    add.w	ip, r1, ip, lsl #1
    ldrsh.w	r1, [ip, #-32]
.Lcode_15583:
    orrs	r1, r5
    cmp	r1, #2
    ite	le
    uxthle	r1, r1
    movgt	r1, #1
    strh.w	r1, [r0], #2
    cmp	r0, r7
    add	r4, r2
    beq.n .Lcode_15601
.Lcode_15592:
    asrs	r1, r4, #16
    add.w	ip, sp, #32
    cmp	r1, #15
    add.w	r5, ip, r1, lsl #1
    add.w	ip, r1, #1
    ble.n .Lcode_15577
    mov	r1, r6
    mov	r5, r6
    b.n .Lcode_15583
.Lcode_15601:
    rsbs	r3, r3, #56
    beq.n .Lcode_15608
    add.w	r3, r0, r3, lsl #1
    movs	r2, #0
.Lcode_15605:
    strh.w	r2, [r0], #2
    cmp	r0, r3
    bne.n .Lcode_15605
.Lcode_15608:
    add	sp, #32
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_15611:
    mov	r1, r6
    b.n .Lcode_15583
    .byte 0x00
    .byte 0xbf
.Lcode_15613:
.global asm_smooth_if_mask_majority
.type asm_smooth_if_mask_majority, %function
.thumb_func
asm_smooth_if_mask_majority:
    and.w	r2, r2, #1431655765
    push	{r4, r5, r6}
    lsrs	r5, r2, #8
    ldr	r3, .Lliteral_15640
    lsrs	r4, r2, #16
    uxtb	r6, r2
    uxtb	r5, r5
    uxtb	r4, r4
    ldrb	r6, [r3, r6]
    ldrb	r5, [r3, r5]
    ldrb	r4, [r3, r4]
    lsrs	r2, r2, #24
    adds	r5, r6, r5
    ldrb	r2, [r3, r2]
    adds	r3, r5, r4
    adds	r3, r3, r2
    cmp	r3, #7
    ble.n .Lcode_15638
    movw	r3, #29491
    smulbb	r0, r0, r3
    movw	r3, #26214
    smulbb	r1, r1, r3
    lsls	r0, r0, #1
    add.w	r0, r0, r1, asr #2
    asrs	r0, r0, #16
.Lcode_15638:
    pop	{r4, r5, r6}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lliteral_15640:
    .word .Ldata_20707
.Lcode_15641:
.global asm_synthesize_excitation_frame
.type asm_synthesize_excitation_frame, %function
.thumb_func
asm_synthesize_excitation_frame:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldrsh.w	r5, [r2, #338]
    sub.w	sp, sp, #796
    cmp	r1, #128
    str	r2, [sp, #60]
    mov	fp, r1
    str	r0, [sp, #76]
    mov	r7, r3
    str	r5, [sp, #44]
    ble.w .Lcode_16169
    movs	r3, #8
    movs	r1, #1
.Lcode_15653:
    lsls.w	r2, r1, r3
    adds	r3, #1
    cmp	r2, fp
    blt.n .Lcode_15653
    str	r3, [sp, #68]
    ldr.w	r8, [sp, #68]
    movs	r3, #1
    lsl.w	r3, r3, r8
    str	r3, [sp, #64]
.Lcode_15662:
    mov.w	r2, fp, lsl #16
    mov	r3, r2
    mov.w	r0, #5242880
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    mov	r1, r0
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r0, r1
    negs	r3, r3
    negs	r1, r1
    asrs	r2, r2, #16
    add.w	r9, sp, #780
    str.w	r9, [sp]
    bl .Lcode_6721
    ldr	r3, [sp, #780]
    lsls	r0, r0, #16
    cmp	r3, #14
    ble.w .Lcode_16044
    subs	r3, #15
    lsl.w	lr, r0, r3
.Lcode_15694:
    ldr	r4, .Lliteral_15895
    ldrh	r3, [r4, #0]
    cmp.w	fp, #1
    strh.w	r3, [sp, #608]
    ble.n .Lcode_15719
    mov	r2, lr
    movs	r3, #1
.Lcode_15701:
    asrs	r0, r2, #16
    adds	r1, r0, #1
    ldrh.w	r0, [r4, r0, lsl #1]
    ldrh.w	r5, [r4, r1, lsl #1]
    ubfx	r1, r2, #1, #15
    smulbb	r6, r0, r1
    lsls	r6, r6, #1
    rsb	r0, r6, r0, lsl #16
    smulbb	r1, r1, r5
    add.w	r8, sp, #792
    add.w	ip, r8, r3, lsl #1
    add.w	r1, r0, r1, lsl #1
    adds	r3, #1
    asrs	r1, r1, #16
    cmp	fp, r3
    strh.w	r1, [ip, #-184]
    add	r2, lr
    bgt.n .Lcode_15701
.Lcode_15719:
    mov.w	sl, fp, lsl #1
    add	r0, sp, #792
    ldrsh.w	r3, [r7]
    ldrh.w	r1, [r4, #160]
    str.w	sl, [sp, #52]
    add.w	r2, r0, sl
    cmp	r3, #3
    strh.w	r1, [r2, #-184]
    beq.w .Lcode_16147
    ldr.w	r8, [sp, #60]
    cmp.w	fp, #0
    add.w	r3, r8, #2
    ble.w .Lcode_16176
    ldr	r5, [sp, #52]
    add.w	sl, sp, #96
    add.w	r8, sp, #608
    str.w	sl, [sp, #56]
    mov	r0, r3
    add.w	r6, r8, r5
    mov	r1, sl
    mov	r2, r8
.Lcode_15740:
    ldrh.w	r4, [r2], #2
    ldrh.w	r5, [r0], #2
    smulbb	r4, r5, r4
    sbfx	r4, r4, #15, #16
    cmp	r2, r6
    strh.w	r4, [r1], #2
    bne.n .Lcode_15740
    ldr.w	r8, [sp, #52]
    ldr.w	sl, [sp, #60]
    add.w	r5, sl, r8
    add.w	sl, sp, #608
    add.w	r1, sl, r8
    ldr.w	sl, [sp, #56]
    adds	r5, #2
    add.w	r6, sl, r8
.Lcode_15755:
    rsb	r8, fp, #84
    cmp.w	r8, #0
    str.w	r8, [sp, #72]
    ble.n .Lcode_15770
    mov	r2, r5
    mov.w	r5, r8, lsl #1
    adds	r4, r2, r5
.Lcode_15762:
    ldrh.w	r0, [r2], #2
    cmp	r2, r4
    strh.w	r0, [r3], #2
    bne.n .Lcode_15762
    ldr.w	sl, [sp, #60]
    add.w	r3, sl, r5
    adds	r3, #2
    mov	r5, r2
.Lcode_15770:
    cmp.w	fp, #0
    ble.n .Lcode_15798
    ldr.w	r8, [sp, #52]
    ldr.w	lr, [sp, #60]
    add.w	r4, r3, r8
    movs	r0, #173
.Lcode_15776:
    ldrh.w	r2, [lr]
    smulbb	r2, r2, r0
    add.w	r2, r2, #13824
    adds	r2, #25
    uxth	r2, r2
    strh.w	r2, [lr]
    strh.w	r2, [r3], #2
    cmp	r3, r4
    bne.n .Lcode_15776
    ldr.w	sl, [sp, #52]
    subs	r5, #170
    rsb	r4, sl, r1
    mov	r3, r6
.Lcode_15789:
    ldrh.w	r2, [r1], #-2
    ldrh.w	r0, [r5, #2]!
    smulbb	r2, r0, r2
    sbfx	r2, r2, #15, #16
    cmp	r1, r4
    strh.w	r2, [r3], #2
    bne.n .Lcode_15789
    ldr	r5, [sp, #52]
    adds	r6, r6, r5
.Lcode_15798:
    ldr.w	r8, [sp, #64]
    rsb	r2, fp, fp, lsl #15
    add.w	r2, r8, r2, lsl #1
    movs	r1, #0
    sxth	r2, r2
    mov	r0, r6
    bl .Lcode_2535
    movs	r1, #0
    mov	r3, r1
    ldr	r2, [sp, #68]
    ldr	r0, [sp, #56]
    bl .Lcode_7371
    ldrsh.w	r2, [r7]
    ldrh	r6, [r7, #4]
    ldr.w	sl, [sp, #64]
    ldr	r5, [sp, #64]
    ldr.w	r3, [r7, #128]
    sub.w	r1, r2, #2
    negs	r2, r1
    sxth.w	lr, r6
    adc.w	r2, r2, r1
    mov.w	sl, sl, asr #1
    cmp.w	r5, #512
    ite	ne
    movne	r5, #121
    moveq	r5, #242
    cmp.w	lr, #0
    mov	r8, r0
    str	r2, [sp, #24]
    str.w	sl, [sp, #16]
    str	r5, [sp, #80]
    ble.w .Lcode_16174
    movs	r5, #2
    add.w	r2, r7, #16
    smlabb	r5, r6, r5, r3
    movs	r4, #0
.Lcode_15834:
    ldrh.w	r0, [r2], #2
    ldrh.w	r1, [r3], #2
    lsls	r0, r0, #16
    cbnz	r1, .Lcode_15841
    cmp	r4, r0
    it	lt
    movlt	r4, r0
.Lcode_15841:
    cmp	r3, r5
    bne.n .Lcode_15834
.Lcode_15843:
    ldr	r5, [sp, #24]
    mov	ip, r4
    cmp.w	ip, #0
    it	lt
    mvnlt.w	ip, ip
    itt	ne
    clzne	ip, ip
    subne.w	ip, ip, #1
    cmp	r5, #0
    bne.w .Lcode_16047
    mul.w	lr, lr, fp
    movw	r3, #17243
    smulbb	r3, lr, r3
    lsls	r0, r3, #1
    mov	r1, r9
    movs	r3, #17
    str.w	ip, [sp, #12]
    str	r3, [sp, #780]
    bl .Lcode_6932
    ldr	r2, [sp, #780]
    ldr.w	ip, [sp, #12]
    lsrs	r0, r0, #16
    str	r0, [sp, #32]
.Lcode_15866:
    ldrsh.w	r3, [r7, #12]
    ldr.w	r8, [sp, #64]
    ldr	r0, [sp, #56]
    str.w	ip, [sp, #12]
    mul.w	r3, r8, r3
    sbfx	r3, r3, #3, #28
    add.w	r8, r3, #65536
    mov.w	r6, r8, asr #17
    str	r3, [sp, #20]
    lsls	r4, r6, #1
    rsb	r3, ip, r2
    adds	r3, #2
    movs	r1, #0
    mov	r2, r4
    str	r3, [sp, #28]
    bl .Lcode_2535
    ldrsh.w	r3, [r7, #4]
    ldr.w	ip, [sp, #12]
    cmp	r3, #0
    mov.w	r8, r8, asr #1
    mov	r5, r0
    ble.w .Lcode_16182
    rsb	r0, ip, #0
    str.w	fp, [sp, #84]
    mov	sl, r7
    movs	r4, #0
    str	r0, [sp, #48]
    mov	fp, ip
    b.n .Lcode_15927
    .byte 0x00
    .byte 0xbf
.Lliteral_15895:
    .word .Ldata_20711
.Lcode_15896:
    ldr	r3, [sp, #24]
    cmp	r3, #0
    beq.w .Lcode_16065
    ldrh.w	r3, [sl, #16]
    ldr	r0, [sp, #32]
    ldr	r2, [sp, #780]
    smulbb	r3, r0, r3
    mov.w	ip, r6, lsl #1
    lsls	r3, r3, #1
.Lcode_15905:
    cmp.w	fp, #0
    it	lt
    ldrlt	r0, [sp, #48]
    ldr	r1, [sp, #28]
    ite	ge
    lslge.w	r3, r3, fp
    asrlt	r3, r0
    rsb	r2, fp, r2
    asrs	r3, r3, #16
    str	r2, [sp, #0]
    str	r1, [sp, #4]
    mov	r0, r5
    mov	r1, r5
    mov	r2, ip
    bl .Lcode_7521
    ldrsh.w	r3, [r7, #4]
    adds	r4, #1
    cmp	r4, r3
    add.w	r5, r5, r6, lsl #2
    add.w	sl, sl, #2
    bge.n .Lcode_15950
.Lcode_15926:
    mov	r6, r9
.Lcode_15927:
    ldr	r1, [sp, #20]
    ldr.w	r3, [r7, #128]
    ldr	r2, [sp, #16]
    ldrsh.w	r3, [r3, r4, lsl #1]
    add	r8, r1
    mov.w	r9, r8, asr #16
    cmp	r9, r2
    it	ge
    movge	r9, r2
    rsb	r6, r6, r9
    cmp	r3, #0
    beq.n .Lcode_15896
    lsls	r2, r6, #1
    mov	r0, r5
    movs	r1, #0
    sxth	r2, r2
    bl .Lcode_2535
    ldrsh.w	r3, [r7, #4]
    adds	r4, #1
    cmp	r4, r3
    add.w	r5, r5, r6, lsl #2
    add.w	sl, sl, #2
    blt.n .Lcode_15926
.Lcode_15950:
    ldr.w	fp, [sp, #84]
.Lcode_15951:
    ldr	r5, [sp, #16]
    ldr.w	r8, [sp, #80]
    ldr.w	sl, [sp, #64]
    rsb	r2, r8, r5
    rsb	r9, r9, r5
    cmp	r9, r2
    it	ge
    movge	r2, r9
    ldr	r5, [sp, #56]
    sub.w	r0, sl, r2, lsl #1
    lsls	r2, r2, #1
    movs	r1, #0
    add.w	r0, r5, r0, lsl #1
    sxth	r2, r2
    bl .Lcode_2535
    ldrsh.w	r3, [sp, #832]
    ldr	r0, [sp, #56]
    mul.w	r3, sl, r3
    sbfx	r2, r3, #19, #12
    lsls	r2, r2, #1
    movs	r1, #0
    bl .Lcode_2535
    ldr.w	r1, [r7, #132]
    ldr.w	r8, [sp, #28]
    ldr	r0, [sp, #56]
    ldr	r2, [sp, #68]
    movs	r3, #0
    add	r1, r8
    bl .Lcode_7387
    ldr	r5, [sp, #60]
    uxth.w	sl, r0
    cmp.w	fp, #0
    str.w	sl, [sp, #32]
    add.w	r4, r5, #170
    ble.w .Lcode_16167
.Lcode_15986:
    ldr.w	r8, [sp, #52]
    ldr	r5, [sp, #56]
    str	r0, [sp, #16]
    add.w	sl, sp, #608
    add.w	r9, r5, r8
    add.w	ip, sl, r8
    ldr.w	r8, [sp, #44]
    str.w	r9, [sp, #20]
    mov	lr, sl
    rsb	r1, r0, #2
    rsb	sl, r8, #2
    sub.w	r7, r8, #2
    str.w	sl, [sp, #24]
    subs	r6, r0, #2
    str	r1, [sp, #28]
    ldr.w	r9, [sp, #76]
    str.w	fp, [sp, #48]
    ldr	r3, [sp, #88]
    ldr	r2, [sp, #92]
    b.n .Lcode_16028
.Lcode_16006:
    ldr.w	fp, [sp, #24]
    asr.w	r0, r1, fp
.Lcode_16008:
    ldrsh.w	r1, [r5], #2
    ldrsh.w	r8, [lr], #2
    ldr.w	sl, [sp, #36]
    smull	r3, sl, r1, r8
    str.w	sl, [sp, #36]
    ldr.w	sl, [sp, #16]
    qadd	r8, r3, r3
    cmp.w	sl, #2
    lsl.w	r1, r8, r6
    asr.w	fp, r1, r6
    bgt.w .Lcode_16115
    ldr.w	fp, [sp, #28]
    asr.w	r1, r8, fp
    ldr.w	fp, [sp, #20]
    ldr.w	r8, [r9]
    qadd	r1, r1, r0
    cmp	r5, fp
    qadd	r1, r8, r1
    str.w	r1, [r9], #4
    beq.w .Lcode_16126
.Lcode_16028:
    ldr.w	sl, [sp, #44]
    ldrsh.w	r1, [r4], #2
    ldrsh.w	r0, [ip], #-2
    ldr.w	r8, [sp, #40]
    smull	r2, r8, r1, r0
    qadd	r1, r2, r2
    lsls.w	r0, r1, r7
    cmp.w	sl, #2
    str.w	r8, [sp, #40]
    asr.w	r8, r0, r7
    ble.n .Lcode_16006
    cmp	r1, r8
    itt	ne
    mvnne.w	r8, #2147483648
    eorne.w	r0, r8, r1, asr #31
    b.n .Lcode_16008
.Lcode_16044:
    rsb	r3, r3, #15
    asr.w	lr, r0, r3
    b.n .Lcode_15694
.Lcode_16047:
    movw	r3, #17243
    smulbb	r3, r6, r3
    lsls	r0, r3, #1
    mov	r1, r9
    movs	r3, #17
    str	r3, [sp, #780]
    str.w	ip, [sp, #12]
    bl .Lcode_6932
    ldr	r3, [sp, #780]
    ldr.w	ip, [sp, #12]
    add.w	r2, r8, #1
    adds	r2, r2, r3
    movw	r3, #22522
    smultb	r3, r0, r3
    ubfx	r3, r3, #15, #16
    str	r2, [sp, #780]
    str	r3, [sp, #32]
    b.n .Lcode_15866
.Lcode_16065:
    mov.w	ip, r6, lsl #1
    mov	r1, r5
    mov	r2, ip
    add	r0, sp, #784
    str.w	ip, [sp, #12]
    bl .Lcode_7556
    asrs	r1, r0, #16
    cmp	r1, #0
    ldr.w	ip, [sp, #12]
    ble.n .Lcode_16112
    lsls	r0, r6, #16
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r0, r3
    rsb	r2, r3, #15
    cmp.w	r1, r0, asr #16
    str	r2, [sp, #788]
    bgt.n .Lcode_16092
    rsb	r3, r3, #16
    asrs	r0, r0, #1
    str	r3, [sp, #788]
.Lcode_16092:
    str.w	ip, [sp, #12]
    bl .Lcode_6534
    ldr	r2, [sp, #788]
    ldr	r3, [sp, #784]
    add	r1, sp, #788
    subs	r3, r2, r3
    lsls	r0, r0, #16
    str	r3, [sp, #788]
    bl .Lcode_6932
    ldr	r1, [sp, #32]
    ldrh.w	r2, [sl, #16]
    ldr.w	ip, [sp, #12]
    smultb	r3, r0, r1
    ubfx	r3, r3, #15, #16
    smulbb	r3, r3, r2
    ldr	r1, [sp, #788]
    lsls	r3, r3, #1
.Lcode_16109:
    ldr	r2, [sp, #780]
    adds	r2, r1, r2
    b.n .Lcode_15905
.Lcode_16112:
    ldr	r3, [sp, #24]
    mov	r1, r3
    b.n .Lcode_16109
.Lcode_16115:
    cmp	r8, fp
    ldr.w	fp, [sp, #20]
    itt	ne
    mvnne.w	sl, #2147483648
    eorne.w	r1, sl, r8, asr #31
    cmp	r5, fp
    ldr.w	r8, [r9]
    qadd	r1, r1, r0
    qadd	r1, r8, r1
    str.w	r1, [r9], #4
    bne.w .Lcode_16028
.Lcode_16126:
    ldr.w	fp, [sp, #48]
    ldr	r5, [sp, #60]
    ldr.w	r8, [sp, #56]
    ldr.w	sl, [sp, #52]
    add.w	r4, r5, fp, lsl #1
    adds	r4, #170
    add.w	r1, r8, sl
.Lcode_16133:
    ldr	r5, [sp, #52]
    sxth.w	r2, fp
    subs	r0, r4, r5
    bl .Lcode_2496
    ldr.w	r8, [sp, #72]
    mov	r0, r4
    sxth.w	r2, r8
    movs	r1, #0
    bl .Lcode_2535
    ldr.w	sl, [sp, #32]
    ldr.w	fp, [sp, #60]
    strh.w	sl, [fp, #338]
    add.w	sp, sp, #796
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_16147:
    ldr	r5, [sp, #60]
    movs	r1, #0
    adds	r0, r5, #2
    movs	r2, #84
    mov.w	sl, #0
    add.w	r8, sp, #96
    rsb	r5, fp, #84
    str.w	r8, [sp, #56]
    bl .Lcode_2535
    ldr	r0, [sp, #56]
    str.w	sl, [sp, #32]
    mov	r1, sl
    mov.w	r2, #256
    bl .Lcode_2535
    str	r5, [sp, #72]
    ldr	r5, [sp, #60]
    ldr	r0, [sp, #32]
    cmp.w	fp, #0
    add.w	r4, r5, #170
    bgt.w .Lcode_15986
.Lcode_16167:
    ldr	r1, [sp, #56]
    b.n .Lcode_16133
.Lcode_16169:
    mov.w	sl, #256
    movs	r5, #8
    str.w	sl, [sp, #64]
    str	r5, [sp, #68]
    b.n .Lcode_15662
.Lcode_16174:
    movs	r4, #0
    b.n .Lcode_15843
.Lcode_16176:
    add	r5, sp, #96
    str	r5, [sp, #56]
    ldr	r6, [sp, #56]
    mov	r5, r3
    add	r1, sp, #608
    b.n .Lcode_15755
.Lcode_16182:
    mov	r9, r6
    b.n .Lcode_15951
    .byte 0x00
    .byte 0xbf
.Lcode_16184:
.global asm_accumulate_interpolated_samples
.type asm_accumulate_interpolated_samples, %function
.thumb_func
asm_accumulate_interpolated_samples:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    sub	sp, #24
    ldrsh.w	r6, [sp, #64]
    ldrsh.w	r5, [sp, #68]
    str	r6, [sp, #4]
    ldr	r6, [sp, #56]
    ldrsh.w	r4, [sp, #60]
    ldr	r6, [r6, #0]
    cmp	r5, #0
    str	r6, [sp, #12]
    ble.n .Lcode_16267
    subs	r5, #1
    uxth	r5, r5
    str	r5, [sp, #20]
    ldr	r5, [sp, #4]
    ldr.w	ip, .Lliteral_16278
    lsls	r5, r5, #16
    add.w	fp, r6, #4
    str	r5, [sp, #8]
    mov	r5, r6
    ldr	r6, [sp, #20]
    lsls	r2, r2, #5
    add.w	fp, fp, r6, lsl #2
    negs	r6, r4
    str	r6, [sp, #16]
    mov	sl, r2
    mov	r7, r3
    b.n .Lcode_16218
.Lcode_16212:
    lsls	r3, r4
    ldr	r6, [r5, #0]
    qadd	r3, r6, r3
    str.w	r3, [r5], #4
    cmp	r5, fp
    beq.n .Lcode_16262
.Lcode_16218:
    ldr	r6, [r0, #0]
    ubfx	r3, r6, #16, #8
    adds	r2, r3, #1
    ldrsh.w	r3, [r1, r3, lsl #1]
    ldrsh.w	r2, [r1, r2, lsl #1]
    lsls	r3, r3, #15
    rsb	r2, r3, r2, lsl #15
    ubfx	r9, r6, #1, #15
    add	r6, sl
    lsrs	r2, r2, #16
    str	r6, [r0, #0]
    ldr	r6, [sp, #4]
    sbfx	r8, r7, #6, #16
    smulbb	r2, r9, r2
    mov.w	r8, r8, lsl #16
    add.w	r3, r3, r2, lsl #1
    cbz	r6, .Lcode_16253
    asrs.w r6, r8, #6
    bmi.n .Lcode_16273
    mov.w	r8, r8, asr #22
    add.w	r9, r8, #1
    uxth	r6, r6
.Lcode_16240:
    ldrsh.w	r2, [ip, r8, lsl #1]
    ldrsh.w	r8, [ip, r9, lsl #1]
    mul.w	r9, r6, r2
    rsb	r2, r9, r2, lsl #16
    mla	r2, r6, r8, r2
    asrs	r2, r2, #16
    rsb	r2, r2, #32768
    sbfx	r2, r2, #1, #16
    smull	r2, r3, r2, r3
    lsrs	r2, r2, #15
    orr.w	r3, r2, r3, lsl #17
    ldr	r2, [sp, #8]
    adds	r7, r7, r2
.Lcode_16253:
    cmp	r4, #0
    bge.n .Lcode_16212
    ldr	r6, [sp, #16]
    asrs	r3, r6
    ldr	r6, [r5, #0]
    qadd	r3, r6, r3
    str.w	r3, [r5], #4
    cmp	r5, fp
    bne.n .Lcode_16218
.Lcode_16262:
    ldr	r2, [sp, #20]
    ldr	r4, [sp, #12]
    adds	r5, r2, #1
    add.w	r4, r4, r5, lsl #2
    str	r4, [sp, #12]
.Lcode_16267:
    ldr	r5, [sp, #12]
    ldr	r6, [sp, #56]
    str	r5, [r6, #0]
    add	sp, #24
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
.Lcode_16273:
    negs	r6, r6
    mov.w	r8, r6, asr #16
    add.w	r9, r8, #1
    uxth	r6, r6
    b.n .Lcode_16240
.Lliteral_16278:
    .word .Ldata_19902
.Lcode_16279:
.global asm_build_inverse_spectrum
.type asm_build_inverse_spectrum, %function
.thumb_func
asm_build_inverse_spectrum:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #20
    mov	r7, r0
    ldr	r4, [sp, #68]
    ldr.w	r8, [sp, #72]
    ldr	r6, [sp, #56]
    ldr.w	fp, [sp, #60]
    ldr	r5, [sp, #76]
    str	r1, [sp, #12]
    cmp	r8, r4
    stmia.w	sp, {r2, r3}
    bge.w .Lcode_16411
    mov.w	lr, r8, lsl #1
    movs	r3, #0
    add.w	r0, r6, lr
    mov	r2, r8
    mov	r9, r3
    add	lr, fp
    b.n .Lcode_16301
.Lcode_16298:
    adds	r3, #2
    cmp	r2, r4
    beq.n .Lcode_16313
.Lcode_16301:
    ldrsh	r1, [r0, r3]
    adds	r2, #1
    cmp	r5, r1
    bne.n .Lcode_16298
    ldrsh.w	r1, [lr, r3]
    lsls	r1, r1, #16
    cmp	r9, r1
    it	lt
    movlt	r9, r1
    adds	r3, #2
    cmp	r2, r4
    bne.n .Lcode_16301
.Lcode_16313:
    mov.w	r2, #256
    mov	r0, r7
    movs	r1, #0
    bl .Lcode_2535
    cmp.w	r9, #0
    it	lt
    mvnlt.w	r9, r9
    itt	ne
    clzne	r9, r9
    subne.w	r9, r9, #1
    rsb	r2, r9, #0
    str	r2, [sp, #8]
    ldr	r0, .Lliteral_16415
    mov	r2, r8
    mov.w	r8, #0
    b.n .Lcode_16332
.Lcode_16329:
    adds	r2, #1
    cmp	r4, r2
    ble.n .Lcode_16381
.Lcode_16332:
    ldrsh.w	r1, [r6, r2, lsl #1]
    lsls	r3, r2, #1
    cmp	r1, r5
    bne.n .Lcode_16329
    ldr.w	sl, [sp, #4]
    ldr.w	ip, [sp]
    ldrsh.w	r1, [sl, r2, lsl #1]
    adds	r2, #1
    mla	r1, r2, ip, r1
    lsls	r1, r1, #10
    add.w	r1, r1, #32768
    and.w	ip, r1, #2147483648
    lsls	r1, r1, #7
    add.w	r1, ip, r1, lsr #1
    asrs	r1, r1, #6
    bmi.n .Lcode_16399
    lsrs	r1, r1, #16
    lsls	r1, r1, #16
.Lcode_16350:
    ubfx	r1, r1, #16, #9
    ldrh.w	sl, [fp, r3]
    ldrh.w	ip, [r0, r1, lsl #1]
    cmp.w	r9, #0
    smulbb	ip, sl, ip
    it	lt
    ldrlt.w	sl, [sp, #8]
    mov.w	ip, ip, lsl #1
    ite	ge
    lslge.w	ip, ip, r9
    asrlt.w	ip, ip, sl
    lsls	r1, r1, #16
    mov.w	ip, ip, asr #16
    add.w	r1, r1, #25165824
    strh.w	ip, [r7, r2, lsl #2]
    ubfx	r1, r1, #16, #9
    ldrh.w	r3, [fp, r3]
    ldrh.w	r1, [r0, r1, lsl #1]
    smulbb	r1, r3, r1
    lsls	r1, r1, #1
    cmp.w	r9, #0
    itet	lt
    ldrlt.w	ip, [sp, #8]
    lslge.w	r1, r1, r9
    asrlt.w	r1, r1, ip
    add.w	r3, r7, r2, lsl #2
    asrs	r1, r1, #16
    cmp	r4, r2
    strh	r1, [r3, #2]
    add.w	r8, r8, #1
    bgt.n .Lcode_16332
.Lcode_16381:
    ldr	r1, [sp, #64]
    ldr	r2, [sp, #8]
    ldr.w	sl, [sp, #12]
    adds	r1, #23
    adds	r1, r1, r2
    uxth	r1, r1
    strh.w	r1, [sl]
    cmp.w	r8, #0
    bne.n .Lcode_16404
.Lcode_16390:
    ldr.w	ip, [sp, #12]
    movw	r3, #65504
    strh.w	r3, [ip]
    mov.w	r8, #0
.Lcode_16394:
    ldrh	r3, [r7, #0]
    mov	r0, r8
    strh.w	r3, [r7, #512]
    add	sp, #20
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_16399:
    negs	r1, r1
    lsrs	r1, r1, #16
    lsls	r1, r1, #16
    negs	r1, r1
    b.n .Lcode_16350
.Lcode_16404:
    sxth	r1, r1
    mov	r0, r7
    movs	r2, #8
    movs	r3, #0
    bl .Lcode_7387
    strh.w	r0, [sl]
    b.n .Lcode_16394
.Lcode_16411:
    movs	r1, #0
    mov.w	r2, #256
    bl .Lcode_2535
    b.n .Lcode_16390
    .byte 0x00
    .byte 0xbf
.Lliteral_16415:
    .word .Ldata_19902
.Lcode_16416:
.global asm_synthesize_interpolated_segment
.type asm_synthesize_interpolated_segment, %function
.thumb_func
asm_synthesize_interpolated_segment:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r5, r2
    lsls	r2, r1, #16
    cmp	r5, #14
    itete	gt
    subgt.w	r8, r5, #15
    rsble	r8, r5, #15
    lslgt.w	r8, r2, r8
    asrle.w	r8, r2, r8
    lsls	r6, r3, #16
    mov	r7, r1
    mov	r2, r6
    movw	r3, #65532
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r1, r2
    sub	sp, #44
    lsls.w	r2, r6, r1
    movt	r3, #65535
    asrs	r2, r2, #16
    subs	r3, r3, r1
    add.w	lr, sp, #36
    movs	r1, #1
    mov	r9, r0
    mov.w	r0, #1073741824
    str.w	lr, [sp]
    bl .Lcode_6721
    mov	r1, r5
    mov	r2, r0
    ldr	r3, [sp, #36]
    mov	r0, r7
    add	r5, sp, #32
    str	r5, [sp, #0]
    bl .Lcode_6611
    ldr	r3, [sp, #32]
    movw	r4, #65535
    lsls	r0, r0, #16
    qadd	r4, r4, r8
    asrs	r4, r4, #16
    cmp	r3, #14
    mov.w	sl, r4, lsl #16
    ble.n .Lcode_16550
    subs	r3, #15
    lsls.w	r3, r0, r3
    asrs	r2, r3, #16
.Lcode_16465:
    cmp	r2, #166
    ite	lt
    movlt	r5, r2
    movge	r5, #166
    cmp	r5, #150
    bgt.n .Lcode_16548
    add.w	fp, r5, #16
    cmp.w	fp, #0
    ble.n .Lcode_16546
.Lcode_16474:
    rsb	r8, r8, sl
    ubfx	r8, r8, #1, #16
    sub.w	ip, r3, r2, lsl #16
    lsrs	r6, r6, #16
    smulbb	r1, r6, r8
    sbfx	ip, ip, #0, #17
    mov.w	r8, r8, lsl #16
    bic.w	ip, ip, #1
    sbfx	r1, r1, #10, #21
    cmp	r4, #0
    str	r1, [sp, #24]
    mov.w	r3, r8, asr #15
    add.w	ip, ip, #983040
    blt.n .Lcode_16559
    lsls	r2, r4, #2
    mov	r7, r4
.Lcode_16490:
    add.w	sl, r4, #16
    ldrsh.w	r4, [sp, #84]
    rsb	lr, r7, sl
    subs	r4, #16
    add	r2, r9
    cmp.w	lr, #0
    str	r2, [sp, #28]
    uxth	r4, r4
    ble.n .Lcode_16554
    sxth.w	r9, r6
    add.w	r8, sp, #24
    sxth.w	lr, lr
    movs	r7, #1
    sxth	r4, r4
    add	r6, sp, #28
    mov	r0, r8
    ldr	r1, [sp, #80]
    str	r7, [sp, #8]
    mov	r2, r9
    str.w	ip, [sp, #20]
    str	r6, [sp, #0]
    str	r4, [sp, #4]
    str.w	lr, [sp, #12]
    bl .Lcode_16184
    ldr.w	ip, [sp, #20]
    mov	r7, sl
.Lcode_16516:
    subs	r5, r5, r7
    adds	r5, #1
    cmp	r5, #0
    ble.n .Lcode_16533
    sxth	r2, r5
    movs	r3, #0
    str	r2, [sp, #12]
    mov	r0, r8
    ldr	r1, [sp, #80]
    str.w	ip, [sp, #20]
    mov	r2, r9
    str	r6, [sp, #0]
    str	r4, [sp, #4]
    str	r3, [sp, #8]
    bl .Lcode_16184
    ldr.w	ip, [sp, #20]
    adds	r7, r7, r5
.Lcode_16533:
    rsb	r7, r7, fp
    mov.w	r3, #4294967295
    adds	r7, #1
    sxth	r7, r7
    str	r3, [sp, #8]
    mov	r0, r8
    ldr	r1, [sp, #80]
    str	r6, [sp, #0]
    mov	r2, r9
    mov	r3, ip
    str	r4, [sp, #4]
    str	r7, [sp, #12]
    bl .Lcode_16184
.Lcode_16546:
    add	sp, #44
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_16548:
    mov.w	fp, #166
    b.n .Lcode_16474
.Lcode_16550:
    rsb	r3, r3, #15
    asrs.w	r3, r0, r3
    asrs	r2, r3, #16
    b.n .Lcode_16465
.Lcode_16554:
    sxth.w	r9, r6
    add.w	r8, sp, #24
    add	r6, sp, #28
    sxth	r4, r4
    b.n .Lcode_16516
.Lcode_16559:
    negs	r2, r4
    smulbb	r2, r2, r6
    cmn.w	r4, #16
    add.w	r1, r1, r2, lsl #5
    ite	lt
    addlt.w	r3, r3, #1048576
    rsbge	r3, sl, r3
    cmp	r5, #0
    str	r1, [sp, #24]
    blt.n .Lcode_16572
    movs	r2, #0
    mov	r7, r2
    b.n .Lcode_16490
.Lcode_16572:
    adds	r1, r5, #1
    movs	r2, #0
    add.w	ip, ip, r1, lsl #16
    mov	r7, r2
    b.n .Lcode_16490
.Lcode_16577:
.global asm_synthesize_harmonic_series
.type asm_synthesize_harmonic_series, %function
.thumb_func
asm_synthesize_harmonic_series:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #140
    ldr	r5, [sp, #200]
    ldrsh.w	r4, [sp, #188]
    str	r0, [sp, #40]
    cmp	r5, #0
    str	r4, [sp, #28]
    str	r1, [sp, #32]
    ldrsh.w	r4, [sp, #192]
    str	r2, [sp, #36]
    str	r3, [sp, #44]
    ble.w .Lcode_16775
    ldr	r5, [sp, #196]
    mul.w	r1, r4, r4
    mul.w	r3, r5, r5
    lsls	r1, r1, #1
    lsls	r3, r3, #1
    mov	fp, r1
    mov	r2, r3
    cmp.w	fp, #0
    it	lt
    mvnlt.w	fp, fp
    itt	ne
    clzne	fp, fp
    subne.w	fp, fp, #1
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth.w	fp, fp
    sxth	r2, r2
    lsl.w	r1, r1, fp
    lsls	r3, r2
    smultt	r3, r1, r3
    lsls	r3, r3, #1
    str	r3, [sp, #20]
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    mul.w	r4, r4, r5
    str	r3, [sp, #24]
    lsls	r4, r4, #1
    rsb	fp, fp, #22
    ldr.w	lr, [sp, #24]
    str	r4, [sp, #16]
    mov	r3, r4
    rsb	fp, r2, fp
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    mov.w	r8, r5, lsl #16
    add.w	r9, sp, #52
    add.w	sl, sp, #92
    movs	r5, #0
    add	r4, sp, #132
    rsb	fp, lr, fp
    str	r3, [sp, #12]
    b.n .Lcode_16667
.Lcode_16645:
    sub.w	r1, r3, #15
    lsls.w	r1, r2, r1
.Lcode_16647:
    rsb	r1, r8, r1
    cmp	r1, #0
    blt.n .Lcode_16662
    mov	r0, r8
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    sxth	r0, r0
    rsb	r3, r0, #15
    lsl.w	r0, r8, r0
    str	r3, [sp, #132]
    lsrs	r0, r0, #16
.Lcode_16662:
    ldr.w	lr, [sp, #200]
    strh.w	r0, [r9], #2
    cmp	r5, lr
    strh.w	r3, [sl], #2
    beq.n .Lcode_16757
.Lcode_16667:
    ldr	r0, [sp, #184]
    ldr	r1, [sp, #196]
    ldr.w	lr, [sp, #28]
    str.w	fp, [sp, #132]
    adds	r5, #1
    rsb	r7, r0, r5, lsl #16
    mov	r6, r7
    cmp	r6, #0
    it	lt
    mvnlt	r6, r6
    itt	ne
    clzne	r6, r6
    subne	r6, #1
    sxth	r6, r6
    lsls	r7, r6
    asrs	r7, r7, #16
    mul.w	r7, r7, r1
    lsls	r7, r7, #1
    mov	r3, r7
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r7, r3
    lsrs	r7, r7, #16
    smulbb	r2, r7, lr
    lsls	r2, r2, #1
    ldr.w	lr, [sp, #24]
    ldr	r1, [sp, #20]
    str	r4, [sp, #0]
    rsb	r6, r6, #31
    subs	r6, r6, r3
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsl.w	r0, r1, lr
    lsls	r2, r3
    subs	r1, r6, #4
    asrs	r2, r2, #16
    subs	r3, r1, r3
    asrs	r0, r0, #16
    mov	r1, fp
    bl .Lcode_6611
    mov	r1, r4
    lsls	r0, r0, #16
    bl .Lcode_6932
    ldr	r1, [sp, #16]
    ldr	r3, [sp, #12]
    str	r4, [sp, #0]
    mov	lr, r0
    cmp.w	lr, #0
    it	lt
    mvnlt.w	lr, lr
    itt	ne
    clzne	lr, lr
    subne.w	lr, lr, #1
    sxth.w	lr, lr
    lsl.w	r2, r0, lr
    lsls.w	r0, r1, r3
    ldr	r3, [sp, #132]
    rsb	lr, lr, r3
    ldr	r3, [sp, #12]
    str.w	lr, [sp, #132]
    asrs	r2, r2, #16
    rsb	r1, r3, #11
    asrs	r0, r0, #16
    mov	r3, lr
    bl .Lcode_6611
    ldr	r3, [sp, #132]
    str	r4, [sp, #0]
    sxth	r2, r0
    mov	r1, r6
    lsls	r0, r7, #16
    bl .Lcode_6721
    ldr	r3, [sp, #132]
    uxth	r0, r0
    lsls	r2, r0, #16
    cmp	r3, #14
    bgt.w .Lcode_16645
    rsb	r1, r3, #15
    asrs.w	r1, r2, r1
    b.n .Lcode_16647
.Lcode_16757:
    ldrsh.w	r5, [sp, #180]
    ldr.w	r9, [sp, #40]
    ldr.w	r8, [sp, #44]
    ldr	r7, [sp, #176]
    mov.w	r6, lr, lsl #1
    movs	r4, #0
.Lcode_16763:
    add	r0, sp, #52
    add	r3, sp, #92
    ldrsh	r1, [r0, r4]
    ldrsh	r2, [r3, r4]
    str	r7, [sp, #0]
    mov	r0, r9
    mov	r3, r8
    adds	r4, #2
    str	r5, [sp, #4]
    bl .Lcode_16416
    cmp	r4, r6
    bne.n .Lcode_16763
.Lcode_16775:
    ldr	r4, [sp, #200]
    add	r5, sp, #136
    subs	r3, r4, #1
    add.w	r3, r5, r3, lsl #1
    ldr	r4, [sp, #32]
    ldrh.w	r2, [r3, #-84]
    ldr	r5, [sp, #36]
    ldrh.w	r3, [r3, #-44]
    strh	r2, [r4, #0]
    strh	r3, [r5, #0]
    add	sp, #140
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_16787:
.global asm_synthesize_frame_transition
.type asm_synthesize_frame_transition, %function
.thumb_func
asm_synthesize_frame_transition:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub.w	sp, sp, #796
    mov	r7, r3
    ldr	r5, [sp, #832]
    ldr	r3, [r3, #8]
    ldr	r4, [r5, #8]
    str	r0, [sp, #32]
    tst.w	r4, #1431655765
    ite	eq
    moveq	r5, #0
    movne	r5, #1
    mov.w	r4, r1, lsl #16
    tst.w	r3, #1431655765
    ite	eq
    moveq.w	fp, #0
    movne.w	fp, #1
    mov	r6, r2
    str	r5, [sp, #40]
    mov	r3, r4
    add	r5, sp, #792
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r2, r3
    rsb	r3, r2, #15
    str.w	r3, [r5, #-12]!
    ldrh.w	lr, [r6, #340]
    ldr.w	ip, [r6, #344]
    str	r4, [sp, #44]
    lsls.w	r2, r4, r2
    mov	sl, r1
    asrs	r2, r2, #16
    movs	r1, #1
    mov.w	r0, #1073741824
    str	r5, [sp, #0]
    strh.w	lr, [sp, #788]
    strh.w	ip, [sp, #790]
    bl .Lcode_6721
    ldr.w	r4, [r6, #336]
    ldr	r5, [sp, #832]
    str	r4, [sp, #56]
    ldrh	r5, [r5, #12]
    ldr	r4, [sp, #40]
    str	r5, [sp, #72]
    uxth	r0, r0
    str	r0, [sp, #68]
    ldrh	r3, [r7, #12]
    cbnz	r4, .Lcode_16868
    cmp.w	fp, #0
    beq.w .Lcode_17373
    sxth	r1, r3
    mul.w	r1, r1, sl
    ldr	r4, [sp, #56]
    ldr	r5, [sp, #40]
    str	r3, [sp, #72]
    sbfx	r1, r1, #3, #28
    adds	r1, r4, r1
    mov	r2, r1
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    lsls	r1, r2
    rsb	r2, r2, #15
    cmp	r2, #14
    str	r5, [sp, #96]
    str	r5, [sp, #100]
    str	r5, [sp, #92]
    bgt.n .Lcode_16891
.Lcode_16862:
    rsb	r2, r2, #15
    asrs.w	r2, r1, r2
    asrs	r4, r2, #16
    str	r2, [sp, #52]
    str	r4, [sp, #48]
    b.n .Lcode_16896
.Lcode_16868:
    cmp.w	fp, #0
    bne.w .Lcode_17266
    ldr	r4, [sp, #72]
    ldr	r5, [sp, #56]
    str.w	fp, [sp, #96]
    sxth	r1, r4
    mul.w	r1, r1, sl
    sbfx	r1, r1, #3, #28
    adds	r1, r5, r1
    mov	r3, r1
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r1, r3
    rsb	r2, r3, #15
    str.w	fp, [sp, #100]
    str.w	fp, [sp, #92]
.Lcode_16889:
    cmp	r2, #14
    ble.n .Lcode_16862
.Lcode_16891:
    subs	r2, #15
    lsls.w	r2, r1, r2
    asrs	r5, r2, #16
    str	r2, [sp, #52]
    str	r5, [sp, #48]
.Lcode_16896:
    add	r5, sp, #108
    mov	r1, r6
    movs	r2, #168
    mov	r0, r5
    bl .Lcode_2496
    add	r0, sp, #444
    movs	r1, #0
    movs	r2, #168
    bl .Lcode_2535
    ldr	r4, [sp, #40]
    cmp	r4, #0
    beq.w .Lcode_17323
    ldr	r4, [sp, #48]
    cmp	r4, #0
    ble.w .Lcode_17323
    ldr	r4, [sp, #832]
    ldr	r0, [sp, #56]
    ldr	r2, [sp, #92]
    ldr.w	lr, [sp, #72]
    ldrsh.w	r3, [r4, #12]
    ldrsh.w	r4, [r6, #462]
    str	r0, [sp, #8]
    add.w	r1, r6, #464
    str	r1, [sp, #60]
    ldr	r0, [sp, #60]
    str.w	sl, [sp, #20]
    sxth	r1, r2
    sxth.w	r2, lr
    stmia.w	sp, {r0, r4}
    str	r2, [sp, #16]
    ldr	r4, [sp, #48]
    str	r1, [sp, #12]
    add	r2, sp, #784
    mov	r0, r5
    add	r1, sp, #788
    adds	r2, #6
    str	r4, [sp, #24]
    bl .Lcode_16577
.Lcode_16934:
    sxth.w	r4, sl
    cmp	r4, #0
    str	r4, [sp, #64]
    ldrh.w	r3, [sp, #780]
    ble.n .Lcode_16977
    ldr	r4, [sp, #68]
    ldr	r0, [r5, #0]
    sxth	r3, r3
    add.w	r8, sl, #4294967295
    lsls	r1, r4, #16
    rsb	r9, r3, #0
    uxth.w	r8, r8
    lsls.w	r2, r1, r3
    asr.w	r9, r1, r9
    add.w	r8, r8, #1
    movs	r1, #0
    cmp	r3, r1
    it	ge
    movge	r9, r2
    mov.w	r8, r8, lsl #2
    mov	lr, r1
    ldr	r4, [sp, #32]
    b.n .Lcode_16958
.Lcode_16957:
    ldr	r0, [r5, r1]
.Lcode_16958:
    mov.w	r2, lr, lsr #16
    sxth	r2, r2
    mov.w	ip, r0, asr #31
    asrs	r3, r2, #31
    mul.w	ip, r2, ip
    mla	ip, r0, r3, ip
    umull	r2, r3, r2, r0
    add	r3, ip
    lsrs	r2, r2, #15
    orr.w	r2, r2, r3, lsl #17
    subs	r0, r0, r2
    ldr	r3, [r4, r1]
    qadd	r0, r3, r0
    str	r0, [r4, r1]
    qadd	lr, r9, lr
    adds	r1, #4
    cmp	r1, r8
    bne.n .Lcode_16957
    str	r4, [sp, #32]
.Lcode_16977:
    movs	r1, #0
    mov.w	r2, #336
    mov	r0, r5
    bl .Lcode_2535
    ldrsh.w	lr, [r7, #12]
    ldr.w	r4, [r7, #128]
    ldrsh.w	r0, [sp, #836]
    str	r4, [sp, #80]
    mov.w	r2, lr, lsl #16
    ldr.w	r4, [r7, #132]
    movw	r1, #65532
    lsls	r0, r0, #16
    mov	ip, r2
    mov	r3, r1
    cmp.w	ip, #0
    it	lt
    mvnlt.w	ip, ip
    itt	ne
    clzne	ip, ip
    subne.w	ip, ip, #1
    mov.w	lr, lr, lsl #5
    sxth.w	ip, ip
    str	r4, [sp, #84]
    mov	r8, r0
    ldrsh.w	r4, [r7, #4]
    cmp.w	r8, #0
    it	lt
    mvnlt.w	r8, r8
    itt	ne
    clzne	r8, r8
    subne.w	r8, r8, #1
    lsl.w	r2, r2, ip
    sxth.w	r8, r8
    rsb	lr, lr, #0
    movt	r1, #65535
    movt	r3, #65535
    rsb	r3, ip, r3
    lsl.w	r0, r0, r8
    ubfx	ip, lr, #5, #16
    rsb	r1, r8, r1
    add.w	lr, sp, #784
    asrs	r2, r2, #16
    str	r4, [sp, #88]
    str.w	lr, [sp]
    str.w	ip, [sp, #36]
    bl .Lcode_6721
    ldr	r3, [sp, #784]
    ldr.w	ip, [sp, #36]
    add.w	r4, r7, #16
    cmp	r3, #14
    add.w	r8, r6, #462
    add.w	r9, r6, #350
    str	r4, [sp, #76]
    mov.w	lr, r0, lsl #16
    ble.w .Lcode_17347
    subs	r3, #15
    lsl.w	lr, lr, r3
.Lcode_17034:
    ldr	r4, [sp, #80]
    ldr	r0, [sp, #60]
    str	r4, [sp, #0]
    ldr	r4, [sp, #76]
    str	r4, [sp, #4]
    ldr	r4, [sp, #84]
    add.w	lr, lr, #32768
    mov.w	lr, lr, asr #16
    str	r4, [sp, #8]
    ldr	r4, [sp, #88]
    str.w	lr, [sp, #16]
    sxth.w	r2, ip
    mov.w	lr, #2
    mov	r1, r8
    mov	r3, r9
    str	r4, [sp, #12]
    str.w	lr, [sp, #20]
    bl .Lcode_16279
    cmp	r0, #0
    bne.w .Lcode_17240
.Lcode_17054:
    cmp.w	fp, #0
    beq.w .Lcode_17183
    ldr	r4, [sp, #100]
    cmp	r4, #0
    beq.w .Lcode_17350
    ldr.w	r3, [r6, #336]
    ldr	r4, [sp, #832]
    ldrh	r2, [r4, #12]
    lsls	r4, r3, #1
    str	r4, [sp, #56]
    ldr	r4, [sp, #52]
    rsb	ip, r3, r4
    ldr	r4, [sp, #56]
    cmp.w	r4, #65536
    blt.n .Lcode_17107
    sub.w	r4, r4, #65536
    cmp.w	r4, #2147483648
    str	r4, [sp, #56]
    beq.w .Lcode_17383
    negs	r3, r4
    asrs	r1, r3, #1
.Lcode_17075:
    lsls	r0, r2, #16
    mov	r2, r0
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth.w	lr, r2
    lsl.w	r0, r0, lr
    str	r0, [sp, #48]
    ldr	r4, [sp, #48]
    str.w	ip, [sp, #36]
    movw	r3, #65532
    mov	r2, r1
    movt	r3, #65535
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    lsls.w	r0, r1, r2
    rsb	r3, lr, r3
    rsb	r1, r2, #15
    add.w	lr, r6, #344
    asrs	r2, r4, #16
    str.w	lr, [sp]
    bl .Lcode_6721
    ldr.w	ip, [sp, #36]
    strh.w	r0, [r6, #340]
.Lcode_17107:
    ldr	r4, [sp, #72]
    sxth	r3, r4
    ldr	r4, [sp, #92]
    lsls	r1, r4, #17
    ldr	r4, [sp, #56]
    lsls	r2, r3, #16
    lsls	r3, r3, #17
    lsrs	r1, r1, #16
    str.w	r4, [r6, #336]
    cmp.w	r2, r3, asr #1
    ldr	r4, [sp, #56]
    str	r1, [sp, #92]
    it	ne
    mvnne.w	r3, #2147483648
    add.w	ip, r4, ip, lsl #1
    it	ne
    eorne.w	r3, r3, r2, asr #31
    lsrs	r3, r3, #16
    mov.w	r4, ip, asr #16
    str.w	ip, [sp, #52]
    str	r3, [sp, #72]
    str	r4, [sp, #48]
.Lcode_17129:
    ldrsh.w	r2, [r7, #12]
    ldr.w	lr, [r7, #132]
    ldr.w	r3, [r7, #128]
    ldrsh.w	ip, [r7, #4]
    ldr	r4, [sp, #76]
    str.w	lr, [sp, #8]
    lsls	r2, r2, #5
    negs	r2, r2
    mov.w	lr, #0
    ubfx	r2, r2, #5, #16
    str	r3, [sp, #0]
    sxth	r2, r2
    mov	r1, r8
    mov	r3, r9
    str.w	lr, [sp, #16]
    ldr	r0, [sp, #60]
    str	r4, [sp, #4]
    mov.w	lr, #1
    str.w	ip, [sp, #12]
    str.w	lr, [sp, #20]
    bl .Lcode_16279
    ldrsh.w	r0, [r6, #462]
    ldr	r4, [sp, #60]
    ldrsh.w	r1, [r6, #340]
    ldrsh.w	r2, [r6, #344]
    ldrsh.w	r3, [r7, #12]
    str	r0, [sp, #4]
    mov	r0, r5
    str	r4, [sp, #0]
    bl .Lcode_16416
    ldr	r4, [sp, #48]
    cmp	r4, #0
    ble.n .Lcode_17183
    ldr	r4, [sp, #60]
    ldrsh.w	r1, [r6, #462]
    ldrsh.w	r3, [r7, #12]
    str	r4, [sp, #0]
    ldr	r4, [sp, #92]
    str	r1, [sp, #4]
    sxth	r0, r4
    ldr	r4, [sp, #72]
    str	r0, [sp, #12]
    sxth	r2, r4
    ldr	r4, [sp, #56]
    str	r2, [sp, #16]
    str	r4, [sp, #8]
    add	r2, sp, #784
    ldr	r4, [sp, #48]
    str.w	sl, [sp, #20]
    mov	r0, r5
    add	r1, sp, #788
    adds	r2, #6
    str	r4, [sp, #24]
    bl .Lcode_16577
.Lcode_17183:
    ldr	r4, [sp, #52]
    ldr.w	lr, [sp, #48]
    ldrh.w	r2, [sp, #780]
    sub.w	r3, r4, lr, lsl #16
    ldr	r4, [sp, #64]
    str.w	r3, [r6, #336]
    cmp	r4, #0
    ble.n .Lcode_17227
    ldr	r4, [sp, #68]
    sxth	r2, r2
    add.w	lr, sl, #4294967295
    lsls	r3, r4, #16
    rsb	ip, r2, #0
    uxth.w	lr, lr
    lsls.w	r0, r3, r2
    asr.w	ip, r3, ip
    movs	r1, #0
    add.w	lr, lr, #1
    cmp	r2, r1
    it	ge
    movge	ip, r0
    ldr	r3, [r5, #0]
    ldr	r4, [sp, #32]
    mov.w	lr, lr, lsl #2
    mov	r0, r1
    b.n .Lcode_17210
.Lcode_17209:
    ldr	r3, [r5, r1]
.Lcode_17210:
    lsrs	r2, r0, #16
    sxth	r2, r2
    asrs	r7, r3, #31
    mov.w	r8, r2, asr #31
    mul.w	r7, r2, r7
    mla	r7, r3, r8, r7
    umull	r2, r3, r2, r3
    adds	r3, r7, r3
    lsrs	r2, r2, #15
    ldr	r7, [r4, r1]
    qadd	r0, ip, r0
    orr.w	r2, r2, r3, lsl #17
    qadd	r2, r2, r7
    str	r2, [r4, r1]
    adds	r1, #4
    cmp	r1, lr
    bne.n .Lcode_17209
.Lcode_17227:
    add.w	r1, r5, sl, lsl #2
    mov	r0, r6
    movs	r2, #168
    bl .Lcode_2496
    ldr	r5, [sp, #40]
    cmp	r5, #0
    bne.n .Lcode_17326
    cmp.w	fp, #0
    bne.n .Lcode_17326
    strh.w	fp, [r6, #340]
    str.w	fp, [r6, #344]
.Lcode_17238:
    add.w	sp, sp, #796
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_17240:
    ldr	r4, [sp, #60]
    ldrsh.w	r3, [r7, #14]
    ldrsh.w	lr, [r7, #12]
    ldrsh.w	r0, [r6, #462]
    str	r4, [sp, #0]
    ldr	r4, [sp, #44]
    str	r0, [sp, #4]
    add.w	r3, r4, r3, lsl #8
    sub.w	r2, r3, #1048576
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    uxth	r1, r3
    sxth	r3, r1
    lsls.w	r3, r2, r3
    rsb	r2, r1, #15
    sxth	r2, r2
    asrs	r1, r3, #16
    mov	r0, r5
    mov	r3, lr
    bl .Lcode_16416
    b.n .Lcode_17054
.Lcode_17266:
    movw	r0, #19660
    sxth	r2, r3
    sxth	r1, r5
    smulbb	r3, r3, r0
    cmp.w	r1, r3, asr #15
    mov	r0, r2
    bge.n .Lcode_17287
    add.w	r3, r2, r2, lsl #1
    add.w	r3, r3, r3, lsl #4
    add.w	r3, r3, r3, lsl #8
    sbfx	r3, r3, #15, #16
    cmp	r1, r3
    ble.n .Lcode_17287
    cmp.w	r1, #16384
    bge.n .Lcode_17287
    movs	r5, #0
    movs	r4, #1
    asrs	r2, r2, #1
    str	r5, [sp, #96]
    str	r4, [sp, #100]
    b.n .Lcode_17300
.Lcode_17287:
    ldr	r5, [sp, #72]
    movw	r3, #13653
    smulbb	r3, r5, r3
    cmp.w	r0, r3, asr #15
    ble.n .Lcode_17297
    add.w	r3, r1, r1, lsl #2
    cmp.w	r0, r3, asr #3
    bge.n .Lcode_17379
    cmp.w	r0, #16384
    blt.n .Lcode_17385
.Lcode_17297:
    movs	r4, #0
    str	r4, [sp, #96]
    str	r4, [sp, #100]
.Lcode_17300:
    lsls	r1, r1, #16
    lsls	r2, r2, #16
    asrs	r3, r1, #1
    add.w	r3, r3, r2, asr #1
    asrs	r3, r3, #16
    mul.w	r3, r3, sl
    ldr	r5, [sp, #56]
    sbfx	r3, r3, #3, #28
    adds	r3, r5, r3
    subs	r1, r2, r1
    lsrs	r1, r1, #16
    mov	r2, r3
    cmp	r2, #0
    it	lt
    mvnlt	r2, r2
    itt	ne
    clzne	r2, r2
    subne	r2, #1
    sxth	r2, r2
    str	r1, [sp, #92]
    lsls.w	r1, r3, r2
    rsb	r2, r2, #15
    b.n .Lcode_16889
.Lcode_17323:
    add.w	r4, r6, #464
    str	r4, [sp, #60]
    b.n .Lcode_16934
.Lcode_17326:
    ldr	r4, [sp, #44]
    ldr	r3, [sp, #44]
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    uxth	r3, r3
    sxth	r0, r3
    lsls.w	r0, r4, r0
    rsb	r1, r3, #15
    ldrsh.w	r2, [sp, #788]
    ldrsh.w	r3, [sp, #790]
    asrs	r0, r0, #16
    sxth	r1, r1
    add.w	r4, r6, #344
    str	r4, [sp, #0]
    bl .Lcode_6664
    strh.w	r0, [r6, #340]
    b.n .Lcode_17238
.Lcode_17347:
    rsb	r3, r3, #15
    asr.w	lr, lr, r3
    b.n .Lcode_17034
.Lcode_17350:
    ldr	r4, [sp, #96]
    cmp	r4, #0
    beq.w .Lcode_17129
    ldr.w	r3, [r6, #336]
    asrs	r4, r3, #1
    str	r4, [sp, #56]
    ldr	r4, [sp, #52]
    subs	r3, r4, r3
    ldr	r4, [sp, #92]
    sbfx	r1, r4, #1, #15
    ldr	r4, [sp, #72]
    sbfx	r2, r4, #1, #15
    ldr	r4, [sp, #56]
    add.w	r3, r4, r3, asr #1
    str.w	r4, [r6, #336]
    uxth	r1, r1
    uxth	r2, r2
    asrs	r4, r3, #16
    str	r3, [sp, #52]
    str	r1, [sp, #92]
    str	r2, [sp, #72]
    str	r4, [sp, #48]
    b.n .Lcode_17129
.Lcode_17373:
    str.w	fp, [sp, #48]
    str.w	fp, [sp, #52]
    str.w	fp, [sp, #92]
    str.w	fp, [sp, #100]
    str.w	fp, [sp, #96]
    b.n .Lcode_16896
.Lcode_17379:
    movs	r5, #0
    str	r5, [sp, #96]
    str	r5, [sp, #100]
    b.n .Lcode_17300
.Lcode_17383:
    mvn.w	r1, #3221225472
    b.n .Lcode_17075
.Lcode_17385:
    lsls	r2, r0, #17
    movs	r4, #1
    movs	r5, #0
    asrs	r2, r2, #16
    str	r4, [sp, #96]
    str	r5, [sp, #100]
    b.n .Lcode_17300
.Lcode_17392:
.global asm_filter_log_spectrum
.type asm_filter_log_spectrum, %function
.thumb_func
asm_filter_log_spectrum:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #212
    movs	r3, #0
    mov	r4, r2
    mov	r5, r0
    sxth	r2, r2
    add	r0, sp, #40
    mov	r6, r1
    strh.w	r3, [sp, #38]
    bl .Lcode_2496
    subs	r3, r4, #1
    cmp	r4, #63
    ldrh.w	r2, [r6, r3, lsl #1]
    bgt.n .Lcode_17419
    movs	r6, #0
    add.w	r3, sp, r6
    add.w	r1, r4, #19
    add.w	r1, r3, r1, lsl #1
    lsls	r2, r2, #16
    mov	r3, r4
    movt	r6, #1477
.Lcode_17413:
    adds	r3, #1
    qsub	r2, r2, r6
    asrs	r0, r2, #16
    cmp	r3, #64
    strh.w	r0, [r1, #2]!
    bne.n .Lcode_17413
.Lcode_17419:
    cmp	r4, #45
    ble.n .Lcode_17472
    add.w	r3, sp, #166
    mov.w	r8, r4, lsl #1
    add	r0, sp, #256
    mov	r2, r3
    rsb	r0, r8, r0
.Lcode_17426:
    ldrh.w	r1, [r3, #-2]!
    cmp	r3, r0
    strh.w	r1, [r2, #2]!
    bne.n .Lcode_17426
.Lcode_17430:
    add.w	r2, sp, #38
    mov	lr, sp
    sub.w	r0, sp, #2
    add	r3, sp, #36
.Lcode_17434:
    ldrh.w	r1, [r2, #2]!
    strh.w	r1, [r3], #-2
    cmp	r3, r0
    bne.n .Lcode_17434
    add	r3, sp, #0
    add.w	r9, r3, r8
    mov	ip, r5
.Lcode_17441:
    ldr	r6, .Lliteral_17474
    add.w	r2, lr, #46
    sub.w	r7, lr, #40
    mov	r3, lr
    movs	r0, #0
.Lcode_17446:
    ldrh.w	fp, [r2, #-4]
    ldrh.w	r1, [r6], #2
    ldrh.w	sl, [r3, #38]
    smulbb	fp, fp, r1
    subs	r3, #4
    add.w	r0, r0, fp, lsl #1
    smulbb	r1, r1, sl
    adds	r2, #4
    cmp	r3, r7
    sub.w	r0, r0, r1, lsl #1
    bne.n .Lcode_17446
    and.w	r3, r0, #2147483648
    lsls	r0, r0, #2
    add.w	r0, r3, r0, lsr #1
    add.w	lr, lr, #2
    asrs	r0, r0, #16
    cmp	lr, r9
    strh.w	r0, [ip], #2
    bne.n .Lcode_17441
    rsb	r2, r4, #56
    sxth	r2, r2
    add.w	r0, r5, r8
    movs	r1, #0
    bl .Lcode_2535
    add	sp, #212
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_17472:
    mov.w	r8, r4, lsl #1
    b.n .Lcode_17430
.Lliteral_17474:
    .word .Ldata_20766
.Lcode_17475:
.global asm_apply_adaptive_spectral_attenuation
.type asm_apply_adaptive_spectral_attenuation, %function
.thumb_func
asm_apply_adaptive_spectral_attenuation:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #172
    mov	r4, r0
    ldr	r6, [r1, #0]
    str	r2, [sp, #32]
    mov	r5, r1
    add	r0, sp, #156
    mov	r1, r4
    ldr	r2, [sp, #212]
    str	r3, [sp, #36]
    bl .Lcode_7556
    mov.w	fp, r6, lsl #1
    ldr	r6, [sp, #156]
    lsrs	r0, r0, #16
    add	r6, fp
    sxth	r7, r0
    str	r7, [sp, #28]
    str	r6, [sp, #156]
    cmp	r7, #0
    beq.n .Lcode_17533
    ldr	r7, [sp, #208]
    ldr.w	r9, .Lliteral_17876
    str	r4, [sp, #8]
    mov.w	r8, r7, lsl #10
    ldr	r7, [sp, #212]
    str	r5, [sp, #24]
    movs	r2, #0
    movs	r3, #0
    mov.w	r8, r8, asr #4
    strd	r2, r3, [sp, #16]
    add.w	sl, r4, r7, lsl #1
    add.w	ip, sp, #44
    mov	r7, r0
    mov	r3, r4
    mov	r2, r8
.Lcode_17510:
    asrs	r1, r2, #16
    ldrh.w	r0, [r3], #2
    ldrh.w	r1, [r9, r1, lsl #1]
    smulbb	r0, r0, r0
    ldrd	r4, r5, [sp, #16]
    ubfx	r0, r0, #15, #16
    smulbb	r0, r1, r0
    lsls	r0, r0, #1
    adds	r4, r4, r0
    adc.w	r5, r5, r0, asr #31
    cmp	r3, sl
    strh.w	r1, [ip], #2
    strd	r4, r5, [sp, #16]
    add	r2, r8
    bne.n .Lcode_17510
    ldrd	r2, r3, [sp, #16]
    orrs	r3, r2
    mov	r0, r7
    ldr	r4, [sp, #8]
    ldr	r5, [sp, #24]
    bne.w .Lcode_17796
    mov.w	r8, #0
    b.n .Lcode_17535
.Lcode_17533:
    ldr.w	fp, [sp, #28]
    mov	r8, fp
.Lcode_17535:
    ldr	r3, [sp, #36]
    ldr	r7, [sp, #32]
    ldrsh.w	r2, [r3]
    ldrh	r1, [r7, #0]
    movw	r3, #31130
    smulbb	r1, r1, r3
    cmp	r2, r6
    ite	ge
    movge	r3, r2
    movlt	r3, r6
    lsls	r1, r1, #1
    subs	r7, r2, r3
    bmi.w .Lcode_17833
    lsls.w	r2, r1, r7
.Lcode_17549:
    movw	r7, #26214
    smulbb	r7, r0, r7
    subs	r1, r6, #4
    lsls	r7, r7, #1
    subs	r1, r1, r3
    bmi.w .Lcode_17829
    lsls	r7, r1
.Lcode_17556:
    adds	r2, r2, r7
    mov	r1, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r2, r1
    beq.n .Lcode_17570
    subs	r1, r3, r1
    cmn.w	r1, #16
    bge.w .Lcode_17793
.Lcode_17570:
    movw	r1, #65519
    movw	r2, #32767
.Lcode_17572:
    ldr	r7, [sp, #32]
    ldr	r3, [sp, #36]
    strh	r2, [r7, #0]
    ldr	r7, [sp, #28]
    strh	r1, [r3, #0]
    cmp	r7, #0
    ble.w .Lcode_17788
    mov.w	r9, r6, lsl #1
    smulbb	r0, r0, r0
    add.w	r9, r9, #1
    lsls	r0, r0, #1
    sub.w	r3, r9, r6, lsl #1
    asrs	r0, r3
    cmp.w	r8, #0
    beq.w .Lcode_17790
    mul.w	r7, r8, r8
    lsls	r7, r7, #1
    rsbs	r3, r9, fp, lsl #1
    bmi.w .Lcode_17864
    lsls	r7, r3
.Lcode_17592:
    rsb	ip, r7, r0
    asrs.w ip, ip, #16
    beq.w .Lcode_17842
    adds	r7, r0, r7
    asrs	r7, r7, #16
.Lcode_17597:
    ldr	r2, [sp, #28]
    ldr	r3, [sp, #208]
    mul.w	r1, ip, r2
    sbfx	r1, r1, #15, #16
    mul.w	r1, r1, r3
    lsls	r1, r1, #1
    mov	sl, r1
    cmp.w	sl, #0
    it	lt
    mvnlt.w	sl, sl
    itt	ne
    clzne	sl, sl
    subne.w	sl, sl, #1
    sxth.w	sl, sl
    lsl.w	r1, r1, sl
    movw	r0, #5033
    asrs	r1, r1, #16
    movt	r0, #15568
    bl .Lcode_6534
    uxth	r0, r0
    sxth	r2, r0
    mul.w	r2, r7, r2
    lsls	r2, r2, #1
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    add.w	r1, r6, r9
    lsls	r2, r3
    rsb	r1, r1, #4
    asrs	r2, r2, #16
    add	sl, r1
    str	r2, [sp, #16]
    bne.w .Lcode_17826
    negs	r7, r3
.Lcode_17636:
    ldr	r1, [sp, #28]
    mul.w	ip, r8, r1
    ubfx	ip, ip, #15, #16
    smulbb	ip, r0, ip
    sbfx	ip, ip, #15, #16
    mov.w	ip, ip, lsl #15
    mov	r3, ip
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsl.w	ip, ip, r3
    asrs.w ip, ip, #16
    bne.w .Lcode_17821
    rsb	fp, r3, #0
.Lcode_17654:
    ldr	r3, [r5, #0]
    ldr	r2, [sp, #212]
    str.w	ip, [sp, #12]
    asrs	r6, r2, #3
    adds	r2, r3, #1
    str	r2, [sp, #0]
    mov	r0, r4
    mov	r1, r4
    mov	r2, r6
    bl .Lcode_7784
    cmp	r7, fp
    ldr.w	ip, [sp, #12]
    ble.w .Lcode_17836
    ldr	r3, [sp, #16]
    adds	r2, r7, #1
    mov.w	lr, r3, lsl #16
    rsb	sl, r2, fp
    mov.w	r3, #4294967295
.Lcode_17672:
    lsls	r1, r6, #1
    rsb	r8, r7, r2
    add	r7, sp, #44
    add.w	r9, r7, r1
    ldr	r7, [sp, #212]
    str	r4, [sp, #36]
    rsb	fp, fp, r2
    lsl.w	r0, lr, r3
    asr.w	r8, lr, r8
    subs	r6, r7, r6
    str.w	fp, [sp, #32]
    adds	r7, r4, r1
    ands.w	r8, r8, r3, asr #32
    it	cc
    movcc	r8, r0
    mov.w	fp, #1
    str	r2, [sp, #16]
    mov	r4, ip
    b.n .Lcode_17708
.Lcode_17691:
    mov	r3, r0
.Lcode_17692:
    rsb	r3, r3, #1
    asrs	r0, r3
.Lcode_17694:
    asrs	r0, r0, #16
    movw	r1, #19661
    cmp	r0, r1
    str.w	fp, [sp, #160]
    bgt.w .Lcode_17819
    cmp.w	r0, #8192
    it	lt
    movlt.w	r0, #8192
.Lcode_17702:
    ldrsh.w	r3, [r7]
    mul.w	r0, r0, r3
    sbfx	r0, r0, #15, #16
    subs	r6, #1
    strh.w	r0, [r7], #2
    beq.n .Lcode_17742
.Lcode_17708:
    ldrsh.w	r0, [r9], #2
    mul.w	r0, r4, r0
    lsls	r0, r0, #1
    cmp.w	sl, #0
    itet	lt
    ldrlt	r2, [sp, #32]
    lslge.w	r0, r0, sl
    asrlt	r0, r2
    subs.w	r0, r8, r0
    beq.n .Lcode_17691
    ldr	r3, [sp, #16]
    add	r1, sp, #160
    str	r3, [sp, #160]
    bl .Lcode_6932
    ldrh	r2, [r7, #0]
    ldr	r3, [r5, #0]
    smultb	r0, r0, r2
    ldr	r2, [sp, #160]
    lsls	r0, r0, #1
    adds	r3, r2, r3
    add	r1, sp, #160
    str	r3, [sp, #160]
    bl .Lcode_6932
    ldr	r3, [sp, #160]
    cmp	r3, #1
    ble.w .Lcode_17874
    ldrsh.w	r3, [r7]
    str.w	fp, [sp, #160]
    movw	r0, #19661
    mul.w	r0, r0, r3
    sbfx	r0, r0, #15, #16
    subs	r6, #1
    strh.w	r0, [r7], #2
    bne.n .Lcode_17708
.Lcode_17742:
    ldr	r2, [r5, #0]
    ldr	r4, [sp, #36]
    ldr	r7, [sp, #156]
    adds	r2, #1
    mov	r3, r5
    str	r2, [r5, #0]
    mov	r0, r4
    mov	r1, r4
    ldr	r2, [sp, #212]
    bl .Lcode_7675
    ldr	r2, [sp, #212]
    add	r0, sp, #160
    mov	r1, r4
    bl .Lcode_7556
    ldr	r2, [r5, #0]
    ldr	r3, [sp, #160]
    add.w	r3, r3, r2, lsl #1
    asrs	r2, r0, #16
    str	r3, [sp, #160]
    beq.n .Lcode_17788
    ldr	r1, [sp, #28]
    add.w	r8, sp, #164
    lsls	r0, r1, #16
    mov	r1, r7
    str.w	r8, [sp]
    bl .Lcode_6721
    mov	r1, r8
    lsls	r0, r0, #16
    bl .Lcode_6932
    ldr	r2, [sp, #212]
    asrs	r3, r0, #16
    mov	r1, r4
    mov	r0, r4
    bl .Lcode_7545
    ldr	r2, [r5, #0]
    ldr	r3, [sp, #164]
    adds	r3, r2, r3
    cmp	r3, #0
    str	r3, [r5, #0]
    ble.n .Lcode_17788
    mov	r0, r4
    mov	r1, r4
    ldr	r2, [sp, #212]
    str	r6, [sp, #0]
    bl .Lcode_7806
    str	r6, [r5, #0]
.Lcode_17788:
    add	sp, #172
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_17790:
    mov.w	ip, r0, asr #16
    mov	r7, ip
    b.n .Lcode_17597
.Lcode_17793:
    lsrs	r2, r2, #16
    uxth	r1, r1
    b.n .Lcode_17572
.Lcode_17796:
    ldrh.w	r7, [sp, #20]
    sxth	r3, r7
    cmp	r3, #0
    ldr	r7, [sp, #16]
    blt.n .Lcode_17861
    ldr	r1, [sp, #16]
    mov	r2, r3
.Lcode_17803:
    clz	r2, r2
    cmp	r2, #32
    itt	eq
    clzeq	r2, r1
    addeq	r2, #32
    subs.w	r1, r2, #33
    bmi.n .Lcode_17867
    lsls	r7, r1
    rsb	fp, r1, fp
.Lcode_17812:
    movw	r3, #32769
    mov.w	r8, r7, asr #16
    movt	r3, #65535
    cmn.w	r8, #32768
    it	eq
    moveq	r8, r3
    b.n .Lcode_17535
.Lcode_17819:
    movw	r0, #19661
    b.n .Lcode_17702
.Lcode_17821:
    add	fp, r6
    add	fp, sl
    add.w	fp, fp, #2
    rsb	fp, r3, fp
    b.n .Lcode_17654
.Lcode_17826:
    add.w	r7, r9, sl
    subs	r7, r7, r3
    b.n .Lcode_17636
.Lcode_17829:
    rsb	r1, r6, #4
    adds	r1, r3, r1
    asrs	r7, r1
    b.n .Lcode_17556
.Lcode_17833:
    subs	r2, r3, r2
    asrs.w	r2, r1, r2
    b.n .Lcode_17549
.Lcode_17836:
    ldr	r1, [sp, #16]
    add.w	r2, fp, #1
    mov.w	lr, r1, lsl #16
    subs	r3, r7, r2
    mov.w	sl, #4294967295
    b.n .Lcode_17672
.Lcode_17842:
    ldr	r7, [sp, #212]
    ldr	r3, [r5, #0]
    str.w	ip, [sp, #12]
    asrs	r6, r7, #3
    mov	r2, r6
    adds	r7, r3, #1
    mov	r0, r4
    mov	r1, r4
    str	r7, [sp, #0]
    bl .Lcode_7784
    ldr.w	ip, [sp, #12]
    mov.w	lr, #0
    mov.w	r3, #4294967295
    movt	lr, #32767
    movs	r2, #1
    mov	fp, ip
    mov	r7, ip
    mov.w	sl, #4294967295
    b.n .Lcode_17672
.Lcode_17861:
    mvns	r2, r3
    mvns	r1, r7
    b.n .Lcode_17803
.Lcode_17864:
    sub.w	r3, r9, fp, lsl #1
    asrs	r7, r3
    b.n .Lcode_17592
.Lcode_17867:
    subs	r2, #1
    rsb	ip, r1, #0
    lsls	r3, r2
    lsr.w	r7, r7, ip
    orrs	r7, r3
    rsb	fp, r1, fp
    b.n .Lcode_17812
.Lcode_17874:
    beq.w .Lcode_17694
    b.n .Lcode_17692
    .byte 0x00
    .byte 0xbf
.Lliteral_17876:
    .word .Ldata_19902

.section .text.vocoder_block_37,"ax",%progbits
.balign 4
.Lcode_17877:
.global asm_transform_32_symmetric
.type asm_transform_32_symmetric, %function
.thumb_func
asm_transform_32_symmetric:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    ldrsh.w	r2, [r0]
    sub	sp, #76
    ubfx	r2, r2, #1, #16
    add	r3, sp, #0
    strh.w	r2, [sp, #2]
    mov	r4, r0
    add.w	ip, sp, #34
    mov	r1, r0
    sxth	r2, r2
    adds	r3, #4
.Lcode_17888:
    ldrsh.w	r5, [r1, #62]
    ldrsh.w	r6, [r4, #2]!
    adds	r7, r6, r5
    asrs	r7, r7, #1
    strh.w	r7, [r3], #2
    subs	r5, r6, r5
    asrs	r5, r5, #1
    subs	r1, #2
    cmp	r3, ip
    add	r2, r7
    strh	r5, [r3, #30]
    bne.n .Lcode_17888
    nop
    ldrsh.w	r3, [r0, #32]
    ldr	r1, .Lliteral_17960
    ubfx	r3, r3, #1, #16
    strh.w	r3, [sp, #34]
    sxtah	r3, r2, r3
    asrs	r3, r3, #3
    movs.w	r8, #0
    strh	r3, [r0, #0]
    strh.w	r8, [r0, #2]
    adds	r0, #4
.Lcode_17911:
    ldrsh.w	r2, [sp, #2]
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #4]
    lsls	r2, r2, #15
    asrs	r3, r2, #31
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #12]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #20]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #28]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    lsrs.w r2, r2, #18
    orr.w	r2, r2, r3, lsl #14
    strh.w	r2, [r0, r8]
    mov.w	r2, #0
    ldrd	r4, r5, [r1], #8
    mov.w	r3, #0
    ldrd	r6, r7, [sp, #36]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #44]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #52]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    ldrd	r4, r5, [r1], #8
    ldrd	r6, r7, [sp, #60]
    smlald	r2, r3, r6, r4
    smlald	r2, r3, r7, r5
    adds.w	r5, r0, r8
    lsrs.w r2, r2, #18
    adds.w	r8, r8, #4
    orr.w	r2, r2, r3, lsl #14
    cmp.w	r8, #60
    strh	r2, [r5, #2]
    bne.n .Lcode_17911
    add	sp, #76
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_17960:
    .word .Ldata_20670

.section .text.vocoder_block_38,"ax",%progbits
.balign 4
.Lcode_17961:
.global asm_polyphase_filter_16
.type asm_polyphase_filter_16, %function
.thumb_func
asm_polyphase_filter_16:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    ldr	r5, .Lliteral_18013
    sub	sp, #8
    ldr	r4, [r5, #0]
    ldr	r3, [r5, #4]
    mov.w	r2, r2, lsl #1
    mov.w	fp, #16
    str	r2, [sp, #4]
    nop
.Lcode_17970:
    ldr	r2, [sp, #4]
    mov	r9, r0
    add.w	sl, r0, r2
    mov	r2, r1
.Lcode_17974:
    ldrh	r7, [r2, #0]
    ldrh.w	r8, [r2, #32]
    smulbb	r7, r7, r4
    ldrh.w	r6, [r2, #64]
    add.w	r7, r7, #32768
    smlabt	r7, r8, r4, r7
    ldrh.w	r8, [r2, #96]
    smlabb	r7, r6, r3, r7
    smulbb	r5, r6, r4
    ldrh.w	r6, [r2, #128]
    smlabt	r7, r8, r3, r7
    smlabt	r5, r8, r4, r5
    ldrh.w	r8, [r2, #160]
    smlabb	r7, r6, r3, r7
    smlabb	r5, r6, r3, r5
    ldrh.w	r6, [r2, #192]
    smlabt	r7, r8, r4, r7
    smlabt	r5, r8, r3, r5
    ldrh.w	r8, [r2, #224]
    smlabb	r7, r6, r4, r7
    add.w	r2, r2, #256
    smlabb	r5, r6, r3, r5
    mov.w	r7, r7, asr #16
    add.w	r5, r5, #32768
    ldrh.w	r6, [r2], #-128
    smlabt	r5, r8, r4, r5
    strh.w	r7, [r0], #4
    smlabb	r5, r6, r4, r5
    mov.w	r5, r5, asr #16
    strh.w	r5, [r0, #-2]
    cmp	r0, sl
    bne.n .Lcode_17974
    subs.w	fp, fp, #1
    add.w	r1, r1, #2
    add.w	r0, r9, #22
    bne.n .Lcode_17970
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lliteral_18013:
    .word .Ldata_20716
.Lcode_18014:
.global asm_sqrt_i32_vector
.type asm_sqrt_i32_vector, %function
.thumb_func
asm_sqrt_i32_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl}
    ldr	r4, .Lliteral_18069
    uxth.w	r8, r3
    ldrsh.w	r6, [r4, #2]
    ldrsh.w	r5, [r4, #4]
    ldr	r3, [sp, #28]
    ldrh	r7, [r4, #0]
    ldrh	r4, [r4, #6]
    sxth	r1, r1
    lsls	r5, r5, #16
    lsls	r6, r6, #16
    add.w	r5, r5, #32768
    add.w	r6, r6, #32768
    add.w	r9, r0, r3, lsl #1
    nop
.Lcode_18029:
    ldr.w	r3, [r2], #4
    mov	ip, r8
    mov	sl, r3
    cbz	r3, .Lcode_18056
    clz	sl, sl
    sub.w	sl, sl, #1
    uxth.w	sl, sl
    sxth.w	ip, sl
    lsl.w	r3, r3, ip
    smulbt	ip, r7, r3
    add.w	ip, r6, ip, lsl #1
    smultt	r3, ip, r3
    add.w	r3, r5, r3, lsl #1
    rsb	sl, sl, r8
    uxth.w	sl, sl
    bfc	r3, #0, #16
    tst.w	sl, #1
    it	ne
    smultbne	r3, r3, r4
    uxth.w	ip, sl
    it	ne
    lslne	r3, r3, #1
    add.w	r3, r3, #32768
    sxth.w	ip, ip
    add.w	ip, ip, #1
    bfc	r3, #0, #16
    ubfx	ip, ip, #1, #16
.Lcode_18056:
    sxth.w	ip, ip
    subs.w	sl, ip, r1
    itet	mi
    rsbmi	ip, ip, r1
    lslpl.w	r3, r3, sl
    asrmi.w	r3, r3, ip
    add.w	r3, r3, #32768
    asrs	r3, r3, #16
    strh.w	r3, [r0], #2
    cmp	r0, r9
    bne.n .Lcode_18029
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lliteral_18069:
    .word .Ldata_19908
.Lcode_18070:
.global asm_sum_adaptive_intervals
.type asm_sum_adaptive_intervals, %function
.thumb_func
asm_sum_adaptive_intervals:
    stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    lsls	r1, r1, #16
    asrs	r5, r3, #1
    cmp	r2, #14
    mov	r8, r0
    ble.n .Lcode_18101
    sub.w	r7, r2, #15
    lsls.w	r7, r1, r7
.Lcode_18078:
    sub.w	r4, r7, r7, asr #2
    add.w	r4, r4, #65536
    asrs	r3, r4, #16
    cmp	r5, r3
    ble.n .Lcode_18104
    asrs	r7, r7, #1
    movs	r6, #0
    mov.w	r9, r7, lsl #1
.Lcode_18086:
    adds	r1, r4, r7
    asrs	r1, r1, #16
    cmp	r1, r5
    ite	le
    rsble	r1, r3, r1
    rsbgt	r1, r3, r5
    add.w	r0, r8, r3, lsl #1
    bl .Lcode_7460
    add	r4, r9
    asrs	r3, r4, #16
    cmp	r5, r3
    add	r6, r0
    bgt.n .Lcode_18086
.Lcode_18099:
    mov	r0, r6
    ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.Lcode_18101:
    rsb	r7, r2, #15
    asrs.w	r7, r1, r7
    b.n .Lcode_18078
.Lcode_18104:
    movs	r6, #0
    b.n .Lcode_18099
    .byte 0x00
    .byte 0xbf
.Lcode_18106:
.global asm_integrate_resampled_to_end
.type asm_integrate_resampled_to_end, %function
.thumb_func
asm_integrate_resampled_to_end:
    lsls	r2, r2, #9
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    asrs	r4, r2, #4
    add.w	r4, r4, #32768
    asrs	r5, r4, #16
    mov.w	sl, r4, lsl #16
    mov.w	r7, sl, lsr #16
    ldr.w	r4, [r3, r5, lsl #2]
    asrs	r2, r2, #3
    orr.w	r7, r7, r5, lsl #16
    mov.w	sl, sl, lsr #17
    smull	sl, fp, sl, r4
    sub	sp, #24
    adds	r7, r2, r7
    mov.w	ip, sl, lsr #15
    mov.w	r9, r7, asr #16
    rsb	r6, r5, r9
    orr.w	ip, ip, fp, lsl #17
    str	r2, [sp, #20]
    add.w	r5, r3, r5, lsl #2
    add.w	r8, r1, #2
    mov	fp, r0
    mov.w	sl, #0
.Lcode_18129:
    rsb	ip, ip, #0
    mov	r2, ip
    asrs	r2, r2, #31
    str.w	ip, [sp]
    str	r2, [sp, #4]
    mov	r0, r5
    mov	r1, r6
    ldrd	r2, r3, [sp]
    b.n .Lcode_18139
.Lcode_18138:
    ldr.w	r4, [r0, #4]!
.Lcode_18139:
    adds	r2, r2, r4
    adc.w	r3, r3, r4, asr #31
    subs	r1, #1
    bne.n .Lcode_18138
    subs	r0, r6, #1
    add.w	r0, r5, r0, lsl #2
    lsls	r4, r7, #16
    ldr	r7, [r0, #4]
    mov.w	ip, r4, lsr #17
    strd	r2, r3, [sp]
    smull	r2, r3, ip, r7
    mov.w	ip, r2, lsr #15
    orr.w	ip, ip, r3, lsl #17
    strd	r2, r3, [sp, #8]
    ldrd	r2, r3, [sp]
    adds.w	r2, r2, ip
    adc.w	r3, r3, ip, asr #31
    add.w	r5, r5, r6, lsl #2
    orrs.w	r6, r2, r3
    bne.n .Lcode_18174
    strh.w	r1, [r8, #-2]
.Lcode_18160:
    mov.w	r7, r9, lsl #16
    ldr	r2, [sp, #20]
    str.w	r1, [fp], #4
    orr.w	r4, r7, r4, lsr #16
    adds	r7, r2, r4
    asrs	r2, r7, #16
    cmp	r2, #127
    add.w	sl, sl, #1
    add.w	r8, r8, #2
    bgt.n .Lcode_18190
    rsb	r6, r9, r2
    ldr	r4, [r0, #4]
    mov	r9, r2
    b.n .Lcode_18129
.Lcode_18174:
    sxth	r6, r3
    cmp	r6, #0
    mov	r7, r2
    blt.n .Lcode_18201
    mov	r3, r6
.Lcode_18179:
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	r3, r2, #32
    subs.w	r1, r3, #33
    bmi.n .Lcode_18194
    negs	r3, r1
    strh.w	r3, [r8, #-2]
    lsls.w	r1, r7, r1
    b.n .Lcode_18160
.Lcode_18190:
    mov	r0, sl
    add	sp, #24
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
.Lcode_18194:
    negs	r2, r1
    subs	r3, #1
    lsls.w	r3, r6, r3
    lsrs.w	r1, r7, r2
    strh.w	r2, [r8, #-2]
    orrs	r1, r3
    b.n .Lcode_18160
.Lcode_18201:
    mvns	r3, r6
    mvns	r2, r2
    b.n .Lcode_18179
    .byte 0x00
    .byte 0xbf
.Lcode_18204:
.global asm_integrate_resampled_intervals
.type asm_integrate_resampled_intervals, %function
.thumb_func
asm_integrate_resampled_intervals:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    lsls	r2, r2, #9
    asrs	r4, r2, #4
    sub	sp, #8
    add.w	r2, r4, r2, asr #5
    add.w	r2, r2, #32768
    asrs	r7, r2, #16
    str	r4, [sp, #4]
    mov	fp, r0
    mov	sl, r3
    sxth	r2, r2
    adds	r6, r1, #2
.Lcode_18216:
    ldr	r3, [sp, #40]
    lsls	r1, r2, #16
    ldr.w	r4, [r3, r7, lsl #2]
    ldr	r3, [sp, #4]
    lsls	r0, r7, #16
    mov.w	r8, r1, lsr #17
    orr.w	r0, r0, r1, lsr #16
    smull	r8, r9, r8, r4
    adds	r0, r3, r0
    mov.w	r1, r8, lsr #15
    ldr	r3, [sp, #40]
    asrs	r5, r0, #16
    orr.w	r1, r1, r9, lsl #17
    cmp	r5, #127
    it	ge
    movge	r5, #127
    negs	r1, r1
    rsb	ip, r7, r5
    add.w	r7, r3, r7, lsl #2
    mov	r2, r1
    asrs	r3, r1, #31
    mov	r8, r7
    mov	r1, ip
    b.n .Lcode_18241
.Lcode_18240:
    ldr.w	r4, [r8, #4]!
.Lcode_18241:
    adds	r2, r2, r4
    adc.w	r3, r3, r4, asr #31
    subs	r1, #1
    bne.n .Lcode_18240
    lsls	r0, r0, #16
    ldr.w	r4, [r7, ip, lsl #2]
    mov.w	r8, r0, lsr #17
    smull	r8, r9, r8, r4
    mov.w	r4, r8, lsr #15
    orr.w	r4, r4, r9, lsl #17
    adds	r2, r2, r4
    adc.w	r3, r3, r4, asr #31
    orrs.w	r4, r2, r3
    bne.n .Lcode_18269
    strh.w	r1, [r6, #-2]
.Lcode_18256:
    lsrs	r0, r0, #16
    ldr	r4, [sp, #4]
    str.w	r1, [fp], #4
    orr.w	r5, r0, r5, lsl #16
    adds	r5, r4, r5
    asrs	r7, r5, #16
    adds	r6, #2
    subs.w	sl, sl, #1
    sxth	r2, r5
    bne.n .Lcode_18216
    add	sp, #8
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
.Lcode_18269:
    sxth	r4, r3
    cmp	r4, #0
    mov	r7, r2
    blt.n .Lcode_18285
    mov	r3, r4
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	r3, r2, #32
    subs.w	r1, r3, #33
    bmi.n .Lcode_18294
.Lcode_18281:
    negs	r3, r1
    strh.w	r3, [r6, #-2]
    lsls.w	r1, r7, r1
    b.n .Lcode_18256
.Lcode_18285:
    mvns	r3, r4
    clz	r3, r3
    mvns	r2, r2
    cmp	r3, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	r3, r2, #32
    subs.w	r1, r3, #33
    bpl.n .Lcode_18281
.Lcode_18294:
    negs	r2, r1
    subs	r1, r3, #1
    lsls.w	r1, r4, r1
    lsrs	r7, r2
    strh.w	r2, [r6, #-2]
    orrs	r1, r7
    b.n .Lcode_18256
.Lcode_18301:
.global asm_log_i32_vector
.type asm_log_i32_vector, %function
.thumb_func
asm_log_i32_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r6, r3
    ldr	r3, .Lliteral_18375
    sub	sp, #28
    str	r2, [sp, #20]
    ldrsh.w	r2, [r3]
    ldrsh.w	fp, [r3, #4]
    lsls	r2, r2, #16
    ldrsh.w	sl, [r3, #6]
    mov	r4, r1
    str	r2, [sp, #4]
    ldrh	r1, [r3, #2]
    ldrsh.w	r2, [r3, #8]
    ldrsh.w	r3, [r3, #10]
    lsls	r2, r2, #16
    lsls	r3, r3, #16
    str	r1, [sp, #8]
    mov.w	fp, fp, lsl #16
    mov.w	sl, sl, lsl #16
    str	r2, [sp, #12]
    str	r3, [sp, #16]
    adds	r5, r0, #2
    mov.w	r7, #32768
.Lcode_18324:
    ldr.w	r9, [r4], #4
    mov.w	r0, r9
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne.w	r8, r0, #1
    lsl.w	r9, r9, r8
    asrs.w r9, r9, #16
    strh.w	r7, [r5, #-2]
    beq.n .Lcode_18368
    nop
    mov.w	r9, r9, lsl #16
    ldr	r2, [sp, #4]
    ldr	r1, [sp, #8]
    rsb	r9, r2, r9
    smulbt	r3, r1, r9
    add.w	r3, r7, r3, lsl #1
    add.w	r3, r3, fp
    smultt	r3, r3, r9
    add.w	r3, r7, r3, lsl #1
    add.w	r3, r3, sl
    smultt	r3, r3, r9
    add.w	r3, r7, r3, lsl #1
    ldr.w	r2, [sp, #12]
    add.w	r3, r2, r3, asr #1
    smultt	r3, r3, r9
    ldr.w	r2, [sp, #20]
    add.w	r3, r7, r3, lsl #1
    ldr.w	r1, [sp, #16]
    rsb	r8, r8, r2
    lsrs.w r3, r3, #16
    add.w	r3, r1, r3, lsl #18
    mov.w	r8, r8, lsl #16
    add.w	r3, r8, r3, asr #15
    lsls.w r2, r3, #10
    cmp.w	r3, r2, asr #10
    itt	ne
    mvnne.w	r1, #2147483648
    eorne.w	r2, r1, r3, asr #31
    qadd	r2, r7, r2
    asrs	r2, r2, #16
    strh.w	r2, [r5, #-2]
.Lcode_18368:
    movs	r2, #0
    subs	r6, #1
    strh.w	r2, [r5], #4
    bne.n .Lcode_18324
    movs	r0, #4
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_18375:
    .word .Ldata_19918
.Lcode_18376:
.global asm_generate_complex_phasors
.type asm_generate_complex_phasors, %function
.thumb_func
asm_generate_complex_phasors:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bic.w	r6, r2, r2, asr #31
    subs	r2, r6, r2
    cbz	r6, .Lcode_18385
    rsb	r4, r6, #31
    mov.w	r8, #1
    lsl.w	r8, r8, r4
    add.w	r8, r8, #4294967295
    b.n .Lcode_18386
.Lcode_18385:
    mvn.w	r8, #2147483648
.Lcode_18386:
    ldr	r5, .Lliteral_18421
    movs	r4, #0
    mov.w	r8, r8, asr #16
    nop
.Lcode_18390:
    ldrsh.w	ip, [r1], #4
    asr.w	ip, ip, r2
    and.w	ip, ip, r8
    lsl.w	ip, ip, r6
    mov.w	r7, ip, lsl #26
    mov.w	ip, ip, asr #6
    ldr.w	r9, [r5, ip, lsl #1]
    lsrs.w r7, r7, #17
    smulbb	sl, r9, r7
    mov.w	fp, r9, lsl #16
    mov.w	sl, sl, lsl #1
    smultb	r9, r9, r7
    rsb	sl, sl, fp
    add.w	ip, ip, #384
    add.w	r9, sl, r9, lsl #1
    mov.w	ip, ip, lsl #23
    mov.w	r9, r9, asr #16
    mov.w	ip, ip, lsr #23
    strh.w	r9, [r0], #2
    ldr.w	r9, [r5, ip, lsl #1]
    mov.w	sl, r9, lsl #16
    smulbb	ip, r9, r7
    smultb	r7, r9, r7
    mov.w	r9, ip, lsl #1
    rsb	r9, r9, sl
    add.w	r7, r9, r7, lsl #1
    asrs	r7, r7, #16
    subs	r3, #1
    strh.w	r7, [r0], #2
    bne.n .Lcode_18390
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_18421:
    .word .Ldata_19902
.Lcode_18422:
.global asm_fourth_root_vector
.type asm_fourth_root_vector, %function
.thumb_func
asm_fourth_root_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	r5, r1
    ldr	r1, .Lliteral_18531
    mov	r6, r3
    ldrsh.w	r3, [r1, #2]
    sub	sp, #44
    lsls	r3, r3, #16
    str	r3, [sp, #16]
    ldrsh.w	r3, [r1, #4]
    add.w	r9, r2, #3
    lsls	r3, r3, #16
    str	r3, [sp, #20]
    ldrsh.w	r3, [r1, #6]
    mov	r7, r2
    lsls	r3, r3, #16
    str	r3, [sp, #24]
    ldrsh.w	r3, [r1, #8]
    ldrh	r2, [r1, #0]
    lsls	r3, r3, #15
    mov.w	r9, r9, asr #2
    str	r3, [sp, #28]
    mov	sl, r6
    mov	r3, r6
    str.w	r9, [sp, #36]
    str	r2, [sp, #12]
    mov	fp, r0
    mov	r6, r0
    mov.w	ip, #32768
    nop
.Lcode_18451:
    ldr.w	r4, [r5], #4
    mov	r0, r4
    cmp	r4, #0
    beq.n .Lcode_18508
    str	r1, [sp, #8]
    str	r3, [sp, #4]
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    sxth	r0, r0
    lsls	r4, r0
    rsb	r8, r0, r7
    ldr	r0, [sp, #12]
    smulbt	r2, r0, r4
    add.w	r2, ip, r2, lsl #1
    ldr	r0, [sp, #16]
    bfc	r2, #0, #16
    adds	r2, r2, r0
    smultt	r2, r2, r4
    add.w	r2, ip, r2, lsl #1
    ldr	r0, [sp, #20]
    bfc	r2, #0, #16
    adds	r2, r2, r0
    smultt	r2, r2, r4
    add.w	r2, ip, r2, lsl #1
    ldr	r0, [sp, #24]
    bfc	r2, #0, #16
    adds	r2, r2, r0
    smultt	r4, r2, r4
    add.w	r4, ip, r4, lsl #1
    ldr	r2, [sp, #28]
    bfc	r4, #0, #16
    add.w	r4, r2, r4, asr #1
    mov	r0, r4
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    add.w	r8, r8, #1
    sxth	r0, r0
    lsls	r4, r0
    rsb	r0, r0, r8
    ands.w	r2, r0, #3
    ldr	r1, [sp, #8]
    ldr	r3, [sp, #4]
    beq.n .Lcode_18508
    adds	r2, #4
    ldrh.w	r2, [r1, r2, lsl #1]
    adds	r0, #1
    smultb	r4, r4, r2
    add.w	r4, ip, r4, lsl #1
    bfc	r4, #0, #16
.Lcode_18508:
    adds	r0, #3
    asrs	r0, r0, #2
    subs.w	r2, r0, r9
    bmi.n .Lcode_18514
    lsls	r4, r2
    b.n .Lcode_18516
.Lcode_18514:
    rsb	r0, r0, r9
    asrs	r4, r0
.Lcode_18516:
    add.w	r4, r4, #32768
    asrs	r4, r4, #16
    subs.w	sl, sl, #1
    strh.w	r4, [fp], #2
    bne.n .Lcode_18451
    mov	r4, r6
    mov	r0, r4
    mov	r2, r3
    mov	r6, r3
    mov	r1, r4
    add	r3, sp, #36
    bl .Lcode_7675
    ldr	r0, [sp, #36]
    add	sp, #44
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_18531:
    .word .Ldata_19903
.Lcode_18532:
.global asm_multiply_complex_by_real
.type asm_multiply_complex_by_real, %function
.thumb_func
asm_multiply_complex_by_real:
    push	{r0, r1, r2, r4, r5, r6, r7, lr}
    ldr	r4, [sp, #32]
    ldr	r6, [sp, #36]
    adds	r2, r2, r4
    str	r2, [sp, #4]
    mov	r5, r6
    mov	r4, r0
    nop
.Lcode_18540:
    ldr.w	lr, [r1], #4
    ldrh.w	r7, [r3], #2
    smulbb	r2, lr, r7
    sbfx	r2, r2, #15, #16
    strh.w	r2, [r4], #2
    smultb	r7, lr, r7
    sbfx	r7, r7, #15, #16
    subs.w	r5, r5, #1
    strh.w	r7, [r4], #2
    bne.n .Lcode_18540
    mov	r1, r0
    lsls	r2, r6, #1
    add	r3, sp, #4
    bl .Lcode_7675
    ldr	r0, [sp, #4]
    pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.Lcode_18556:
.global asm_reciprocal_vector
.type asm_reciprocal_vector, %function
.thumb_func
asm_reciprocal_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    cmp	r3, #0
    mov	r4, r1
    mov	r5, r2
    ldr	r7, [sp, #32]
    mov.w	r8, #32768
    blt.n .Lcode_18565
    lsl.w	r8, r8, r3
    b.n .Lcode_18567
.Lcode_18565:
    negs	r2, r3
    asr.w	r8, r8, r2
.Lcode_18567:
    rsb	r9, r3, #16
    mov	r6, r0
    movw	sl, #32767
.Lcode_18570:
    ldrsh.w	r1, [r4], #2
    strh.w	sl, [r6], #2
    cbz	r1, .Lcode_18576
    mov	r0, r8
    bl .Lcode_6534
    strh.w	r0, [r6, #-2]
.Lcode_18576:
    subs	r7, #1
    bne.n .Lcode_18570
    rsb	r0, r5, r9
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_18580:
.global asm_adjacent_complex_products
.type asm_adjacent_complex_products, %function
.thumb_func
asm_adjacent_complex_products:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #4
    add	r1, r1
    add.w	r1, r1, #1
    str	r1, [sp, #0]
    mov.w	r1, #128
    mov	r9, r0
    ldr.w	r2, [r0], #4
.Lcode_18588:
    ldmia	r0!, {r3, r4}
    subs	r1, #2
    smuad	r5, r2, r3
    smusdx	r6, r3, r2
    pkhtb	r5, r6, r5, asr #16
    smuad	r6, r3, r4
    smusdx	r7, r4, r3
    pkhtb	r6, r7, r6, asr #16
    stmia.w	r9!, {r5, r6}
    mov	r2, r4
    bgt.n .Lcode_18588
    sub.w	r1, r9, #512
    sub.w	r0, r9, #512
    mov.w	r2, #256
    mov	r3, sp
    bl .Lcode_7675
    ldr	r0, [sp, #0]
    add	sp, #4
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_18607:
.global asm_expand_voicing_bands
.type asm_expand_voicing_bands, %function
.thumb_func
asm_expand_voicing_bands:
    stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov	sl, r0
    mov	r4, r1
    mov	r5, r2
    mov	r9, r3
    movs	r7, #8
    movs	r6, #13
    mov.w	fp, #0
    movw	r8, #6552
    b.n .Lcode_18619
.Lcode_18617:
    mov	fp, r6
    mov	r6, r3
.Lcode_18619:
    ldrsh.w	r1, [r5], #2
    cmp	r7, #1
    it	eq
    moveq	r6, #128
    lsls	r0, r1, #16
    str	r0, [sp, #4]
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    ldr	r1, [sp, #4]
    lsls	r1, r0
    beq.n .Lcode_18644
    rsb	r0, r0, r9
    adds	r0, #42
    blt.n .Lcode_18643
    ldrsh.w	r1, [r4]
    cmp	r1, r8
    ite	gt
    movgt.w	r1, #16384
    movle	r1, #0
    b.n .Lcode_18644
.Lcode_18643:
    movs	r1, #0
.Lcode_18644:
    add.w	r0, sl, fp, lsl #1
    rsb	fp, fp, r6
    sxth	r1, r1
    sxth.w	r2, fp
    bl .Lcode_2535
    adds	r4, #2
    subs	r7, #1
    add.w	r3, r6, #16
    bne.n .Lcode_18617
    ldmia.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_18654:
.global asm_multiply_complex_vector
.type asm_multiply_complex_vector, %function
.thumb_func
asm_multiply_complex_vector:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub	sp, #4
    ldr.w	r9, [sp, #32]
    ldr.w	r8, [sp, #36]
    ldr	r4, [r1, #0]
    ldr.w	r5, [r3], #4
    add.w	r2, r2, #1
    add	r2, r9
    mov	r9, r8
    str	r2, [sp, #0]
    nop
.Lcode_18665:
    smusd	r6, r4, r5
    smuadx	r7, r4, r5
    subs.w	r8, r8, #1
    pkhtb	r6, r7, r6, asr #16
    ldr.w	r5, [r3], #4
    str.w	r6, [r0], #4
    bgt.n .Lcode_18665
    sub.w	r0, r0, r9, lsl #2
    mov	r1, r0
    mov.w	r2, r9, lsl #1
    mov	r3, sp
    bl .Lcode_7675
    ldr	r0, [sp, #0]
    add	sp, #4
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
.Lcode_18680:
.global asm_align_by_exponents
.type asm_align_by_exponents, %function
.thumb_func
asm_align_by_exponents:
    push	{r3, r4, r5, r6, r7, lr}
    mov	r5, r0
    mov	r4, r1
    mov	r0, r2
    mov	r1, r3
    mov	r6, r2
    mov	r7, r3
    bl .Lcode_7417
.Lcode_18688:
    ldrsh.w	r3, [r6], #2
    ldrsh.w	r2, [r4], #2
    subs	r3, r0, r3
    asrs.w	r3, r2, r3
    subs	r7, #1
    strh.w	r3, [r5], #2
    bne.n .Lcode_18688
    pop	{r3, r4, r5, r6, r7, pc}
.Lcode_18696:
.global asm_complex_vector_energy
.type asm_complex_vector_energy, %function
.thumb_func
asm_complex_vector_energy:
    stmdb	sp!, {r4, r5, lr}
    mov.w	ip, r3, lsl #1
    sub	sp, #4
    mov	r5, r0
    mov	r4, r2
    mov	r0, sp
    mov	r2, ip
    bl .Lcode_7556
    ldrh.w	r2, [sp]
    mov.w	r0, r0, asr #16
    add.w	r1, r2, r4, lsl #1
    strh	r1, [r5, #0]
    add	sp, #4
    ldmia.w	sp!, {r4, r5, pc}
.Lcode_18710:
.global asm_complex_weighted_correlation
.type asm_complex_weighted_correlation, %function
.thumb_func
asm_complex_weighted_correlation:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #28
    ldr.w	fp, [sp, #68]
    ldr.w	ip, [sp, #72]
    ldr	r6, [sp, #64]
    str	r0, [sp, #20]
    mov	sl, r3
    mov	r3, r1
    mov.w	r0, #0
    mov.w	r1, #0
    mov.w	r8, #0
    mov.w	r9, #0
.Lcode_18722:
    ldr.w	r5, [r2], #4
    ldrsh.w	r4, [r3], #2
    smulbb	r7, r5, r4
    smultb	r4, r5, r4
    sbfx	r5, r4, #14, #16
    ubfx	r4, r7, #14, #16
    add.w	r4, r4, r5, lsl #16
    subs.w	ip, ip, #1
    ldr.w	r5, [r6], #4
    smlsldx	r8, r9, r5, r4
    smlald	r0, r1, r4, r5
    bne.n .Lcode_18722
    adds.w	r6, r8, r8
    adc.w	r7, r9, r9
    adds	r0, r0, r0
    adc.w	r1, r1, r1
    orrs.w	r5, r0, r1
    strd	r6, r7, [sp]
    bne.n .Lcode_18743
    add.w	r5, sl, fp
    b.n .Lcode_18770
.Lcode_18743:
    cmp	r0, #0
    sbcs.w	r2, r1, #0
    mov	r4, r0
    mov	r5, r1
    bge.n .Lcode_18750
    negs	r4, r0
    sbc.w	r5, r1, r1, lsl #1
.Lcode_18750:
    uxth	r3, r5
    add.w	r5, sl, fp
    cbz	r3, .Lcode_18759
    sxth	r2, r3
    clz	r2, r2
    rsb	r2, r2, #33
    adds	r5, r5, r2
    bl .Lcode_19852
    b.n .Lcode_18769
.Lcode_18759:
    cmp	r4, #0
    bge.n .Lcode_18765
    asrs.w r9, r1, #1
    mov.w	r8, r0, rrx
    adds	r5, #1
    b.n .Lcode_18770
.Lcode_18765:
    clz	r2, r4
    subs	r2, #1
    subs	r5, r5, r2
    bl .Lcode_19868
.Lcode_18769:
    mov	r8, r0
.Lcode_18770:
    orrs.w	r3, r6, r7
    bne.n .Lcode_18774
    add.w	r4, sl, fp
    b.n .Lcode_18806
.Lcode_18774:
    cmp	r6, #0
    sbcs.w	r4, r7, #0
    mov	r0, r6
    mov	r1, r7
    bge.n .Lcode_18781
    negs	r0, r6
    sbc.w	r1, r7, r7, lsl #1
.Lcode_18781:
    uxth	r3, r1
    add.w	r4, sl, fp
    cbz	r3, .Lcode_18792
    sxth	r2, r3
    clz	r2, r2
    rsb	r2, r2, #33
    mov	r0, r6
    mov	r1, r7
    adds	r4, r4, r2
    bl .Lcode_19852
    b.n .Lcode_18805
.Lcode_18792:
    cmp	r0, #0
    bge.n .Lcode_18799
    asrs	r3, r7, #1
    mov.w	r2, r6, rrx
    strd	r2, r3, [sp]
    adds	r4, #1
    b.n .Lcode_18806
.Lcode_18799:
    clz	r2, r0
    subs	r2, #1
    mov	r0, r6
    mov	r1, r7
    subs	r4, r4, r2
    bl .Lcode_19868
.Lcode_18805:
    str	r0, [sp, #0]
.Lcode_18806:
    cmp	r5, r4
    ldr	r3, [sp, #0]
    ble.n .Lcode_18813
    subs	r4, r5, r4
    asrs	r3, r4
    mov	r0, r5
    b.n .Lcode_18816
.Lcode_18813:
    subs	r5, r4, r5
    asr.w	r8, r8, r5
    mov	r0, r4
.Lcode_18816:
    ldr	r4, [sp, #20]
    mov.w	r8, r8, asr #16
    asrs	r3, r3, #16
    strh.w	r8, [r4]
    strh	r3, [r4, #2]
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_18823:
.global asm_squared_vector_difference
.type asm_squared_vector_difference, %function
.thumb_func
asm_squared_vector_difference:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldrsh.w	sl, [sp, #32]
    mov	r6, r2
    cmp	sl, r2
    ble.n .Lcode_18833
    mov	r6, sl
    mov	sl, r2
    mov	r2, r1
    mov	r1, r3
    mov	r3, r2
.Lcode_18833:
    ldrsh.w	r8, [sp, #36]
    add.w	r9, r6, #1
    mov.w	r8, r8, lsl #1
    rsb	sl, sl, r9
    uxth.w	r8, r8
    movs	r4, #0
    movs	r5, #0
    sxth.w	sl, sl
.Lcode_18841:
    ldrsh.w	ip, [r3], #2
    ldrsh.w	r2, [r1], #2
    mov.w	ip, ip, lsl #16
    asr.w	ip, ip, sl
    lsls.w r2, r2, #15
    rsb	ip, ip, r2
    subs.w	r8, r8, #1
    smlaltt	r4, r5, ip, ip
    bne.n .Lcode_18841
    mov	r7, r4
    mov	r2, r5
    orrs.w	r3, r4, r5
    bne.n .Lcode_18858
    mov.w	r9, r9, lsl #1
    add.w	r9, r9, #1
    strh.w	r9, [r0]
    b.n .Lcode_18895
.Lcode_18858:
    cmp	r4, #0
    sbcs.w	r3, r5, #0
    mov	r8, r7
    mov	r9, r2
    bge.n .Lcode_18865
    rsbs	r8, r4, #0
    sbc.w	r9, r5, r5, lsl #1
.Lcode_18865:
    uxth.w	r3, r9
    cbz	r3, .Lcode_18877
    sxth	r2, r3
    clz	r2, r2
    rsb	r2, r2, #33
    add.w	r6, r2, r6, lsl #1
    adds	r6, #3
    strh	r6, [r0, #0]
    mov	r1, r5
    mov	r0, r4
    bl .Lcode_19852
    b.n .Lcode_18894
.Lcode_18877:
    cmp.w	r8, #0
    bge.n .Lcode_18885
    adds	r6, #2
    lsls	r6, r6, #1
    asrs	r5, r5, #1
    mov.w	r4, r4, rrx
    strh	r6, [r0, #0]
    b.n .Lcode_18895
.Lcode_18885:
    clz	r2, r8
    lsls	r6, r6, #1
    subs	r2, #1
    adds	r6, #3
    subs	r6, r6, r2
    strh	r6, [r0, #0]
    mov	r1, r5
    mov	r0, r4
    bl .Lcode_19868
.Lcode_18894:
    mov	r4, r0
.Lcode_18895:
    asrs	r0, r4, #16
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_39,"ax",%progbits
.balign 4
.Lcode_18897:
.global asm_atan_scaled
.type asm_atan_scaled, %function
.thumb_func
asm_atan_scaled:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub	sp, #24
    cmp	r0, #0
    str	r1, [sp, #12]
    mov	r6, r2
    blt.w .Lcode_19072
    mov	r4, r0
    movs	r7, #1
.Lcode_18905:
    mov	r0, r4
    ldr	r1, [sp, #12]
    movw	r2, #19777
    movs	r3, #2
    bl .Lcode_6768
    mov	r5, r0
    cmp	r0, #0
    beq.w .Lcode_19053
    add	r5, sp, #24
    movs	r1, #1
    ldr.w	r3, [r5, #-12]!
    mov.w	r0, #1073741824
    mov	r2, r4
    str	r5, [sp, #0]
    bl .Lcode_6721
    lsls	r0, r0, #16
    cmp.w	r0, #2147483648
    beq.w .Lcode_19124
    negs	r2, r0
    lsrs	r2, r2, #16
    sxth	r4, r2
    smulbb	r2, r2, r2
    lsls	r2, r2, #1
    mov.w	r8, r4, lsl #16
.Lcode_18929:
    mov.w	ip, #0
    movt	ip, #25736
    movs	r5, #1
.Lcode_18932:
    mov	r3, r2
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r2, r3
    lsrs	r2, r2, #16
    sxth	r1, r2
    rsb	r9, r1, r1, lsl #3
    ldr	r0, [sp, #12]
    add.w	r1, r1, r9, lsl #3
    rsb	r3, r3, r0, lsl #1
    rsb	r1, r1, r1, lsl #9
    lsls	r1, r1, #1
    cmp	r3, #0
    itete	gt
    addgt.w	sl, r3, #4294967295
    rsble	sl, r3, #1
    lslgt.w	sl, r1, sl
    asrle.w	sl, r1, sl
    add.w	sl, sl, #3053453312
    add.w	sl, sl, #14352384
    movw	r1, #65534
    mov	r9, sl
    movt	r1, #65535
    cmp.w	r9, #0
    it	lt
    mvnlt.w	r9, r9
    itt	ne
    clzne	r9, r9
    subne.w	r9, r9, #1
    sxth.w	r9, r9
    rsb	r1, r9, r1
    lsl.w	sl, sl, r9
    adds	r1, r1, r3
    smultb	sl, sl, r2
    cmn.w	r1, #2
    mov.w	sl, sl, lsl #1
    blt.w .Lcode_19065
    adds	r1, #2
    lsl.w	sl, sl, r1
.Lcode_18976:
    add.w	sl, sl, #1711276032
    add.w	sl, sl, #6684672
    movw	r1, #65534
    mov	r9, sl
    movt	r1, #65535
    cmp.w	r9, #0
    it	lt
    mvnlt.w	r9, r9
    itt	ne
    clzne	r9, r9
    subne.w	r9, r9, #1
    sxth.w	r9, r9
    rsb	r1, r9, r1
    lsl.w	sl, sl, r9
    adds	r1, r1, r3
    smultb	sl, sl, r2
    cmp.w	r1, #4294967295
    mov.w	sl, sl, lsl #1
    blt.n .Lcode_19079
    adds	r1, #1
    lsl.w	sl, sl, r1
.Lcode_18997:
    add.w	sl, sl, #2852126720
    add.w	sl, sl, #11206656
    mov	r1, sl
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth.w	r9, r1
    lsl.w	sl, sl, r9
    smultb	r2, sl, r2
    lsls	r2, r2, #1
    mov	r1, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r2, r1
    asrs	r2, r2, #16
    mvn.w	r9, r9
    mul.w	r4, r4, r2
    add	r3, r9
    lsls	r4, r4, #1
    subs	r3, r3, r1
    bmi.n .Lcode_19085
    lsls.w	r3, r4, r3
.Lcode_19027:
    cmp	r0, #0
    add	r8, r3
    ble.n .Lcode_19082
    subs	r0, #1
    lsl.w	r8, r8, r0
.Lcode_19032:
    cmp	r5, #1
    it	ne
    movne.w	ip, ip, asr #1
    add	ip, r8
    mov	r3, ip
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsl.w	ip, ip, r3
    asrs.w r0, ip, #16
    rsb	r3, r3, #1
    beq.n .Lcode_19070
    adds	r2, r7, #1
    beq.n .Lcode_19088
.Lcode_19050:
    str	r3, [r6, #0]
    add	sp, #24
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_19053:
    mov	r0, r4
    ldr	r1, [sp, #12]
    movw	r2, #27146
    mov.w	r3, #4294967295
    bl .Lcode_6768
    cbnz	r0, .Lcode_19094
    mul.w	r2, r4, r4
    mov	ip, r0
    lsls	r2, r2, #1
    mov.w	r8, r4, lsl #16
    mov	r5, r0
    b.n .Lcode_18932
.Lcode_19065:
    movw	r9, #65534
    movt	r9, #65535
    rsb	r9, r1, r9
    asr.w	sl, sl, r9
    b.n .Lcode_18976
.Lcode_19070:
    mov	r3, r0
    b.n .Lcode_19050
.Lcode_19072:
    lsls	r0, r0, #16
    cmp.w	r0, #2147483648
    beq.n .Lcode_19130
    negs	r0, r0
    asrs	r4, r0, #16
    mov.w	r7, #4294967295
    b.n .Lcode_18905
.Lcode_19079:
    mvns	r1, r1
    asr.w	sl, sl, r1
    b.n .Lcode_18997
.Lcode_19082:
    rsb	r0, r0, #1
    asr.w	r8, r8, r0
    b.n .Lcode_19032
.Lcode_19085:
    negs	r3, r3
    asrs.w	r3, r4, r3
    b.n .Lcode_19027
.Lcode_19088:
    lsls	r0, r0, #16
    cmp.w	r0, #2147483648
    beq.n .Lcode_19133
    negs	r0, r0
    asrs	r0, r0, #16
    b.n .Lcode_19050
.Lcode_19094:
    movs	r1, #1
    mov	r2, r4
    add.w	lr, sp, #20
    ldr	r3, [sp, #12]
    str.w	lr, [sp]
    mov.w	r0, #16384
    bl .Lcode_6611
    movs	r1, #1
    mov	r2, r4
    mov	r8, r0
    ldr	r3, [sp, #12]
    mov.w	r0, #16384
    add	r4, sp, #16
    str	r4, [sp, #0]
    bl .Lcode_6664
    lsls	r0, r0, #16
    bmi.n .Lcode_19135
    mov	r2, r8
    add	r4, sp, #12
    ldr	r1, [sp, #16]
    ldr	r3, [sp, #20]
    str	r4, [sp, #0]
    bl .Lcode_6721
    mov.w	ip, #0
    mul.w	r2, r0, r0
    mov	r4, r0
    lsls	r2, r2, #1
    mov.w	r8, r0, lsl #16
    movt	ip, #25736
    b.n .Lcode_18932
.Lcode_19124:
    mov.w	r8, #0
    movs	r2, #2
    movt	r8, #32767
    movt	r2, #32766
    movw	r4, #32767
    b.n .Lcode_18929
.Lcode_19130:
    movw	r4, #32767
    mov.w	r7, #4294967295
    b.n .Lcode_18905
.Lcode_19133:
    movw	r0, #32767
    b.n .Lcode_19050
.Lcode_19135:
    cmp.w	r0, #2147483648
    beq.n .Lcode_19157
    negs	r0, r0
.Lcode_19138:
    ldr	r1, [sp, #16]
    ldr	r3, [sp, #20]
    mov	r2, r8
    add	r4, sp, #12
    str	r4, [sp, #0]
    bl .Lcode_6721
    lsls	r0, r0, #16
    cmp.w	r0, #2147483648
    beq.n .Lcode_19159
    negs	r2, r0
    lsrs	r2, r2, #16
    sxth	r4, r2
    smulbb	r2, r2, r2
    lsls	r2, r2, #1
    mov.w	r8, r4, lsl #16
.Lcode_19153:
    mov.w	ip, #0
    movt	ip, #25736
    movs	r5, #0
    b.n .Lcode_18932
.Lcode_19157:
    mvn.w	r0, #2147483648
    b.n .Lcode_19138
.Lcode_19159:
    mov.w	r8, #0
    movs	r2, #2
    movt	r8, #32767
    movt	r2, #32766
    movw	r4, #32767
    b.n .Lcode_19153
    .byte 0x00
    .byte 0xbf
.Lcode_19165:
.global asm_atan2_scaled
.type asm_atan2_scaled, %function
.thumb_func
asm_atan2_scaled:
    push	{r4, r5, r6, r7, lr}
    cmp	r2, #0
    ite	lt
    movlt	r4, #2
    movge	r4, #0
    cmp	r0, #0
    sub	sp, #20
    it	lt
    orrlt.w	r4, r4, #1
    cbnz	r2, .Lcode_19185
    lsls	r2, r4, #31
    bmi.n .Lcode_19255
    cmp	r0, #0
    beq.n .Lcode_19244
    movs	r6, #1
    movw	r0, #25736
.Lcode_19181:
    ldr	r3, [sp, #40]
    str	r6, [r3, #0]
    add	sp, #20
    pop	{r4, r5, r6, r7, pc}
.Lcode_19185:
    cbnz	r0, .Lcode_19191
    lsls	r3, r4, #30
    bpl.n .Lcode_19244
    movs	r6, #2
    movw	r0, #25736
    b.n .Lcode_19181
.Lcode_19191:
    subs	r4, #2
    cmp	r4, #1
    bls.n .Lcode_19246
    movs	r6, #1
    movs	r7, #0
    mov.w	r5, #4294967295
.Lcode_19197:
    lsls	r2, r2, #16
    lsls	r0, r0, #16
    mov	r4, r2
    cmp	r4, #0
    it	lt
    mvnlt	r4, r4
    itt	ne
    clzne	r4, r4
    subne	r4, #1
    sxth.w	lr, r4
    lsl.w	r2, r2, lr
    mov	r4, r0
    cmp	r4, #0
    it	lt
    mvnlt	r4, r4
    itt	ne
    clzne	r4, r4
    subne	r4, #1
    sxth	r4, r4
    lsls	r0, r4
    subs	r1, r1, r4
    asrs	r2, r2, #16
    rsb	r3, lr, r3
    add	r4, sp, #12
    str	r4, [sp, #0]
    bl .Lcode_6721
    ldr	r1, [sp, #12]
    mov	r2, r4
    bl .Lcode_18897
    ldr	r3, [sp, #12]
    lsls	r0, r0, #16
    adds	r5, r5, r3
    bmi.n .Lcode_19252
    lsls	r0, r5
.Lcode_19231:
    adds	r7, r0, r7
    mov	r3, r7
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    lsls	r7, r3
    subs	r6, r6, r3
    asrs	r0, r7, #16
    b.n .Lcode_19181
.Lcode_19244:
    mov	r6, r0
    b.n .Lcode_19181
.Lcode_19246:
    ldr	r5, .Lliteral_19259
    ldrsh.w	r7, [r5, r4, lsl #2]
    movs	r6, #3
    lsls	r7, r7, #15
    mvn.w	r5, #2
    b.n .Lcode_19197
.Lcode_19252:
    negs	r5, r5
    asrs	r0, r5
    b.n .Lcode_19231
.Lcode_19255:
    movw	r0, #39800
    movs	r6, #1
    movt	r0, #65535
    b.n .Lcode_19181
.Lliteral_19259:
    .word .Ldata_20780

.section .text.vocoder_block_40,"ax",%progbits
.balign 4
.Lcode_19260:
.global asm_sum_i32_shifted
.type asm_sum_i32_shifted, %function
.thumb_func
asm_sum_i32_shifted:
    push	{r4, r5, r6, r7}
    mov.w	ip, #1
    movs	r5, #0
    movs	r6, #0
.Lcode_19264:
    subs	r1, #1
    ldr.w	r7, [r0], #4
    smlal	r6, r5, ip, r7
    bne.n .Lcode_19264
    negs	r0, r2
    sxth	r0, r0
    cmp	r0, #0
    blt.n .Lcode_19275
    lsls.w	r0, r6, r0
.Lcode_19273:
    pop	{r4, r5, r6, r7}
    bx	lr
.Lcode_19275:
    negs	r0, r0
    rsb	r1, r0, #32
    sub.w	r3, r0, #32
    lsls.w	r1, r5, r1
    lsrs.w	r0, r6, r0
    asrs.w	r2, r5, r3
    orrs	r0, r1
    ands.w	r0, r0, r3, asr #32
    it	cc
    movcc	r0, r2
    b.n .Lcode_19273
.Lcode_19286:
.global asm_inverse_cosine_transform
.type asm_inverse_cosine_transform, %function
.thumb_func
asm_inverse_cosine_transform:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sxth	r3, r1
    sub	sp, #132
    mov	r9, r0
    mov	fp, r1
    mov	sl, r2
    add	r0, sp, #16
    mov	r2, r3
    mov	r1, r9
    bl .Lcode_2496
    ldr	r3, .Lliteral_19384
    ldrh.w	r3, [r3, fp, lsl #1]
    cmp	sl, fp
    it	ge
    movge	sl, fp
    sxth	r0, r3
    cmp.w	sl, #0
    str	r3, [sp, #12]
    str	r0, [sp, #4]
    ble.n .Lcode_19360
    mov.w	fp, fp, lsl #1
    rsb	r3, fp, #0
    ldr.w	ip, .Lliteral_19385
    str	r3, [sp, #8]
    mov.w	r8, #0
    add	r1, sp, #16
.Lcode_19312:
    ldr	r0, [sp, #4]
    mul.w	r7, r8, r0
    asrs	r0, r7, #1
    adds	r0, #64
    sxth	r7, r7
    add.w	r6, r1, fp
    movs	r2, #0
    movs	r3, #0
.Lcode_19320:
    ubfx	r5, r0, #7, #9
    ldrh.w	r4, [r1], #2
    ldrh.w	r5, [ip, r5, lsl #1]
    smulbb	r4, r5, r4
    adds	r2, r2, r4
    adc.w	r3, r3, r4, asr #31
    cmp	r1, r6
    add	r0, r7
    bne.n .Lcode_19320
    ldr	r0, [sp, #8]
    adds	r1, r1, r0
    orrs.w	r0, r2, r3
    beq.n .Lcode_19362
    sxth	r0, r3
    cmp	r0, #0
    mov	r4, r2
    blt.n .Lcode_19368
    mov	r3, r0
    clz	r3, r3
    cmp	r3, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	r3, r2, #32
    subs.w	r2, r3, #33
    bmi.n .Lcode_19377
.Lcode_19345:
    lsls.w	r2, r4, r2
    rsb	r3, r3, #34
.Lcode_19347:
    ldr	r0, [sp, #12]
    smultb	r2, r2, r0
    lsls	r2, r2, #1
    cmp	r3, #0
    bge.n .Lcode_19364
    negs	r3, r3
    asrs.w	r3, r2, r3
    add.w	r3, r3, #32768
    lsrs	r3, r3, #16
.Lcode_19356:
    add.w	r8, r8, #1
    cmp	sl, r8
    strh.w	r3, [r9], #2
    bgt.n .Lcode_19312
.Lcode_19360:
    add	sp, #132
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_19362:
    movs	r3, #0
    b.n .Lcode_19356
.Lcode_19364:
    lsls.w	r3, r2, r3
    add.w	r3, r3, #32768
    lsrs	r3, r3, #16
    b.n .Lcode_19356
.Lcode_19368:
    mvns	r3, r0
    clz	r3, r3
    mvns	r2, r2
    cmp	r3, #32
    itt	eq
    clzeq	r2, r2
    addeq.w	r3, r2, #32
    subs.w	r2, r3, #33
    bpl.n .Lcode_19345
.Lcode_19377:
    subs	r5, r3, #1
    negs	r2, r2
    lsls	r0, r5
    lsrs.w	r2, r4, r2
    orrs	r2, r0
    rsb	r3, r3, #34
    b.n .Lcode_19347
.Lliteral_19384:
    .word .Ldata_20714
.Lliteral_19385:
    .word .Ldata_19902
.Lcode_19386:
.global asm_spread_two_bit_fields
.type asm_spread_two_bit_fields, %function
.thumb_func
asm_spread_two_bit_fields:
    movs	r3, #0
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl}
    asrs	r5, r2, #16
    movs	r4, #30
    mov	r8, r3
.Lcode_19391:
    subs	r6, r4, #2
    and.w	ip, r2, #3
    and.w	r7, r5, #3
    lsl.w	sl, ip, r4
    lsl.w	r9, r7, r4
    lsl.w	ip, ip, r6
    subs	r4, #4
    lsls.w	r6, r7, r6
    orr.w	ip, sl, ip
    orr.w	r6, r9, r6
    asrs	r2, r2, #2
    asrs	r5, r5, #2
    cmn.w	r4, #2
    orr.w	r8, r8, ip
    orr.w	r3, r3, r6
    bne.n .Lcode_19391
    str.w	r8, [r0]
    str	r3, [r1, #0]
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lcode_19411:
.global asm_harmonic_count
.type asm_harmonic_count, %function
.thumb_func
asm_harmonic_count:
    push	{r4, lr}
    mov	r4, r0
    movw	r0, #45980
    movt	r0, #3
    mov	r1, r4
    bl .Lcode_6588
    sxth	r0, r0
    lsls	r3, r0, #1
    mla	r3, r3, r4, r4
    cmp.w	r3, #524288
    bge.n .Lcode_19430
.Lcode_19422:
    cmp	r0, #56
    ble.n .Lcode_19426
    movs	r0, #56
    pop	{r4, pc}
.Lcode_19426:
    cmp	r0, #9
    it	lt
    movlt	r0, #9
    pop	{r4, pc}
.Lcode_19430:
    mov.w	r0, #524288
    mov	r1, r4
    bl .Lcode_6588
    lsls	r0, r0, #16
    sub.w	r0, r0, #65536
    asrs	r0, r0, #17
    b.n .Lcode_19422
.Lcode_19437:
.global asm_decode_pitch
.type asm_decode_pitch, %function
.thumb_func
asm_decode_pitch:
    cmn.w	r2, #4096
    push	{r3, r4, r5, lr}
    mov	r4, r1
    mvn.w	r1, #3
    bge.n .Lcode_19447
.Lcode_19442:
    add.w	r2, r2, #4096
    sxth	r2, r2
    adds	r1, #1
    cmn.w	r2, #4096
    blt.n .Lcode_19442
.Lcode_19447:
    add.w	r5, r2, r2, lsl #2
    rsb	r5, r5, r5, lsl #6
    asrs	r5, r5, #12
    add.w	r5, r5, #1808
    adds	r5, #11
    uxth	r5, r5
    smulbb	r5, r2, r5
    asrs	r5, r5, #12
    add.w	r5, r5, #7872
    uxth	r5, r5
    smulbb	r5, r2, r5
    asrs	r5, r5, #12
    add.w	r5, r5, #22528
    adds	r5, #185
    uxth	r5, r5
    smulbb	r2, r2, r5
    ubfx	r2, r2, #12, #16
    eor.w	r2, r2, #32768
    sxth	r2, r2
    asrs.w	r1, r2, r1
    uxth	r1, r1
    sxth	r2, r1
    movw	r5, #4216
    cmp	r2, r5
    ble.n .Lcode_19483
    movw	r5, #27594
    cmp	r2, r5
    ble.n .Lcode_19478
    cbnz	r3, .Lcode_19478
    mov	r1, r5
    mov	r2, r5
.Lcode_19478:
    strh	r1, [r0, #0]
    mov	r0, r2
    bl .Lcode_19411
    strh	r0, [r4, #0]
    pop	{r3, r4, r5, pc}
.Lcode_19483:
    movw	r1, #4217
    mov	r2, r1
    strh	r1, [r0, #0]
    mov	r0, r2
    bl .Lcode_19411
    strh	r0, [r4, #0]
    pop	{r3, r4, r5, pc}
    .byte 0x00
    .byte 0xbf
.Lcode_19490:
.global asm_vector_quantize_i16
.type asm_vector_quantize_i16, %function
.thumb_func
asm_vector_quantize_i16:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #28
    mov	r4, r0
    ldr	r7, [sp, #64]
    ldr	r6, [sp, #68]
    cmp	r7, r2
    mov	r5, r1
    mov	r8, r3
    ble.n .Lcode_19502
    subs	r7, r7, r2
    lsls	r6, r7
    mov	r7, r2
.Lcode_19502:
    ldr	r3, [sp, #76]
    cbz	r3, .Lcode_19521
    movs	r0, #1
    lsls	r0, r7
    cmp	r5, #1
    beq.w .Lcode_19625
    cmp	r5, #2
    beq.n .Lcode_19535
    cmp	r5, #3
    beq.w .Lcode_19646
    cmp	r5, #4
    beq.n .Lcode_19567
    movs	r2, #0
.Lcode_19515:
    rsb	r9, r2, r0
    mov	r1, r7
    ldr	r0, [sp, #72]
    mov	r2, r9
    bl .Lcode_13935
    b.n .Lcode_19525
.Lcode_19521:
    ldr	r0, [sp, #72]
    mov	r1, r7
    bl .Lcode_14920
    mov	r9, r0
.Lcode_19525:
    mul.w	r6, r6, r9
    add.w	r8, r8, r6, lsl #1
    add.w	r5, r4, r5, lsl #1
.Lcode_19528:
    ldrh.w	r3, [r8], #2
    strh.w	r3, [r4], #2
    cmp	r4, r5
    bne.n .Lcode_19528
    mov	r0, r9
    add	sp, #28
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_19535:
    ldrsh.w	fp, [r4]
    ldrsh.w	sl, [r4, #2]
    str	r0, [sp, #4]
    movs	r2, #0
    mov.w	fp, fp, lsl #16
    mov.w	sl, sl, lsl #16
    mov.w	ip, r6, lsl #1
    mov	r1, r0
    mov	r3, r8
    mvn.w	r9, #2147483648
    str	r4, [sp, #8]
.Lcode_19546:
    ldrsh.w	lr, [r3]
    ldrsh.w	r0, [r3, #2]
    movs	r4, #0
    lsls	r0, r0, #16
    mov.w	lr, lr, lsl #16
    qsub	r0, sl, r0
    qsub	lr, fp, lr
    smultt	r0, r0, r0
    smultt	lr, lr, lr
    qdadd	lr, r4, lr
    qdadd	r0, lr, r0
    cmp	r0, r9
    itt	lt
    movlt	r2, r1
    movlt	r9, r0
    subs	r1, #1
    add	r3, ip
    bne.n .Lcode_19546
    ldr	r0, [sp, #4]
    ldr	r4, [sp, #8]
    b.n .Lcode_19515
.Lcode_19567:
    ldrsh.w	ip, [r4]
    ldrsh.w	r1, [r4, #4]
    ldrsh.w	lr, [r4, #2]
    ldrsh.w	r3, [r4, #6]
    str.w	r8, [sp, #20]
    mov.w	ip, ip, lsl #16
    lsls	r1, r1, #16
    str.w	ip, [sp, #4]
    str	r1, [sp, #8]
    mov.w	ip, lr, lsl #16
    mov.w	r9, r3, lsl #16
    ldr.w	lr, [sp, #4]
    str	r0, [sp, #12]
    mov	r3, r8
    movs	r2, #0
    ldr.w	r8, [sp, #8]
    str	r4, [sp, #4]
    mov.w	sl, r6, lsl #1
    mov	r1, r0
    mvn.w	fp, #2147483648
    str	r5, [sp, #16]
    str	r7, [sp, #8]
    str	r6, [sp, #0]
.Lcode_19590:
    ldrsh.w	r4, [r3]
    ldrsh.w	r0, [r3, #2]
    ldrsh.w	r7, [r3, #4]
    ldrsh.w	r5, [r3, #6]
    lsls	r4, r4, #16
    lsls	r0, r0, #16
    movs	r6, #0
    lsls	r7, r7, #16
    lsls	r5, r5, #16
    qsub	r4, lr, r4
    qsub	r0, ip, r0
    smultt	r4, r4, r4
    smultt	r0, r0, r0
    qdadd	r4, r6, r4
    qsub	r7, r8, r7
    qdadd	r0, r4, r0
    smultt	r7, r7, r7
    qsub	r5, r9, r5
    qdadd	r0, r0, r7
    smultt	r5, r5, r5
    qdadd	r0, r0, r5
    cmp	r0, fp
    itt	lt
    movlt	r2, r1
    movlt	fp, r0
    subs	r1, #1
    add	r3, sl
    bne.n .Lcode_19590
    ldr	r0, [sp, #12]
    ldr	r4, [sp, #4]
    ldr	r5, [sp, #16]
    ldr.w	r8, [sp, #20]
    ldr	r7, [sp, #8]
    ldr	r6, [sp, #0]
    b.n .Lcode_19515
.Lcode_19625:
    ldrsh.w	fp, [r4]
    movs	r2, #0
    mov.w	fp, fp, lsl #16
    mov.w	sl, r6, lsl #1
    mov	r3, r0
    mov	r1, r8
    mvn.w	ip, #2147483648
    mov	r9, r2
.Lcode_19633:
    ldrsh.w	lr, [r1]
    mov.w	lr, lr, lsl #16
    qsub	lr, fp, lr
    smultt	lr, lr, lr
    qdadd	lr, r9, lr
    cmp	lr, ip
    itt	lt
    movlt	r2, r3
    movlt	ip, lr
    subs	r3, #1
    add	r1, sl
    bne.n .Lcode_19633
    b.n .Lcode_19515
.Lcode_19646:
    ldrsh.w	r1, [r4, #2]
    ldrsh.w	r3, [r4, #4]
    ldrsh.w	fp, [r4]
    str	r0, [sp, #4]
    mov.w	lr, r1, lsl #16
    mov.w	ip, r3, lsl #16
    movs	r2, #0
    mov.w	fp, fp, lsl #16
    mov.w	r9, r6, lsl #1
    mov	r1, r0
    mov	r3, r8
    mvn.w	sl, #2147483648
    str	r4, [sp, #8]
    str	r5, [sp, #12]
    str	r6, [sp, #16]
.Lcode_19661:
    ldrsh.w	r4, [r3]
    ldrsh.w	r0, [r3, #2]
    ldrsh.w	r5, [r3, #4]
    lsls	r4, r4, #16
    lsls	r0, r0, #16
    movs	r6, #0
    lsls	r5, r5, #16
    qsub	r4, fp, r4
    qsub	r0, lr, r0
    smultt	r4, r4, r4
    smultt	r0, r0, r0
    qdadd	r4, r6, r4
    qsub	r5, ip, r5
    qdadd	r0, r4, r0
    smultt	r5, r5, r5
    qdadd	r0, r0, r5
    cmp	r0, sl
    itt	lt
    movlt	r2, r1
    movlt	sl, r0
    subs	r1, #1
    add	r3, r9
    bne.n .Lcode_19661
    add	r0, sp, #4
    ldmia	r0, {r0, r4, r5, r6}
    b.n .Lcode_19515
    .byte 0x00
    .byte 0xbf
.Lcode_19687:
.global asm_cosine_transform
.type asm_cosine_transform, %function
.thumb_func
asm_cosine_transform:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
    mov	r6, r0
    sub	sp, #116
    ldrh	r0, [r0, #0]
    cmp	r2, r1
    ite	lt
    movlt	r5, r2
    movge	r5, r1
    cmp	r5, #1
    mov	r4, r1
    strh.w	r0, [sp]
    ble.n .Lcode_19705
    add.w	r0, sp, #2
    adds	r1, r6, #2
    subs	r2, r5, #1
    movs	r3, #1
    bl .Lcode_7622
    ldrh.w	r0, [sp]
.Lcode_19705:
    ldr	r3, .Lliteral_19735
    ldr.w	r8, .Lliteral_19736
    ldrsh.w	r9, [r3, r4, lsl #1]
    add	r3, sp, #0
    mov.w	ip, r9, asr #1
    add.w	r4, r6, r4, lsl #1
    add.w	r5, r3, r5, lsl #1
.Lcode_19712:
    add.w	r2, sp, #2
    movs	r3, #64
    movs	r1, #0
    b.n .Lcode_19717
.Lcode_19716:
    ldrh.w	r0, [r2], #2
.Lcode_19717:
    ubfx	r7, r3, #7, #9
    cmp	r2, r5
    ldrh.w	r7, [r8, r7, lsl #1]
    smulbb	r0, r7, r0
    add	r3, ip
    add.w	r1, r1, r0, lsl #1
    bne.n .Lcode_19716
    add.w	r1, r1, #32768
    asrs	r1, r1, #16
    strh.w	r1, [r6], #2
    cmp	r6, r4
    beq.n .Lcode_19733
    add	ip, r9
    sxth.w	ip, ip
    ldrh.w	r0, [sp]
    b.n .Lcode_19712
.Lcode_19733:
    add	sp, #116
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
    .byte 0x00
    .byte 0xbf
.Lliteral_19735:
    .word .Ldata_20714
.Lliteral_19736:
    .word .Ldata_19902
.Lcode_19737:
.global asm_quantize_log_average
.type asm_quantize_log_average, %function
.thumb_func
asm_quantize_log_average:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub	sp, #16
    add	r5, sp, #48
    ldr	r6, [sp, #60]
    ldmia.w	r5, {r5, r8, r9}
    mov	r4, r0
    mov	r7, r1
    mov	sl, r3
    cbnz	r6, .Lcode_19769
    movs	r1, #1
    mov	r2, r8
    ldr	r3, .Lliteral_19830
    str.w	r8, [sp]
    str	r1, [sp, #4]
    str.w	r9, [sp, #8]
    str	r6, [sp, #12]
    bl .Lcode_19490
    cmp	r7, #2
    beq.n .Lcode_19814
.Lcode_19756:
    ldrsh.w	r3, [r5]
    ldrsh.w	r2, [r4]
    lsls	r3, r3, #15
    add.w	r3, r3, r2, lsl #16
    asrs	r3, r3, #16
    cmp.w	r3, #26624
    it	ge
    movge.w	r3, #26624
    uxth	r3, r3
    strh	r3, [r4, #0]
.Lcode_19766:
    strh	r3, [r5, #0]
.Lcode_19767:
    add	sp, #16
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.Lcode_19769:
    mov	r1, r3
    mov	r0, r2
    bl .Lcode_7405
    movs	r2, #5
    strh	r0, [r4, #0]
    movs	r1, #15
    mov	r0, sl
    bl .Lcode_6854
    ldrsh.w	r3, [r4]
    ldrsh.w	r2, [r5]
    lsls	r3, r3, #16
    lsls	r2, r2, #14
    lsls	r0, r0, #16
    qadd	r3, r0, r3
    qdsub	r3, r3, r2
    mov.w	r2, #32768
    qadd	r3, r2, r3
    lsrs	r3, r3, #16
    cmp	r7, #2
    strh	r3, [r4, #0]
    beq.n .Lcode_19800
    movs	r1, #1
    mov	r0, r4
    mov	r2, r8
    ldr	r3, .Lliteral_19830
    str.w	r8, [sp]
    str	r1, [sp, #4]
    str.w	r9, [sp, #8]
    str	r6, [sp, #12]
    bl .Lcode_19490
    b.n .Lcode_19756
.Lcode_19800:
    mov.w	r2, #268435456
    lsls	r3, r3, #16
    qadd	r3, r2, r3
    asrs	r3, r3, #16
    strh	r3, [r4, #0]
    movs	r1, #1
    mov	r0, r4
    mov	r2, r8
    ldr	r3, .Lliteral_19830
    str.w	r8, [sp]
    str	r1, [sp, #4]
    str.w	r9, [sp, #8]
    str	r6, [sp, #12]
    bl .Lcode_19490
.Lcode_19814:
    ldrsh.w	r3, [r4]
    sub.w	r3, r3, #4096
    uxth	r3, r3
    strh	r3, [r4, #0]
    ldrsh.w	r2, [r5]
    lsls	r2, r2, #15
    add.w	r3, r2, r3, lsl #16
    asrs	r3, r3, #16
    cmp.w	r3, #26624
    it	ge
    movge.w	r3, #26624
    uxth	r3, r3
    cmp	r7, #2
    strh	r3, [r4, #0]
    beq.n .Lcode_19767
    b.n .Lcode_19766
.Lliteral_19830:
    .word .Ldata_20748
.Lcode_19831:
.global asm_copy_frame_state
.type asm_copy_frame_state, %function
.thumb_func
asm_copy_frame_state:
    push	{r4, r5, r6, r7}
    mov	r3, r0
    ldrh	r2, [r1, #14]
    ldrh	r0, [r1, #0]
    ldrh.w	ip, [r1, #2]
    ldrh	r7, [r1, #4]
    ldrh	r6, [r1, #6]
    ldr	r5, [r1, #8]
    ldrh	r4, [r1, #12]
    strh	r0, [r3, #0]
    strh	r2, [r3, #14]
    adds	r1, #16
    add.w	r0, r3, #16
    movs	r2, #56
    strh.w	ip, [r3, #2]
    strh	r7, [r3, #4]
    strh	r6, [r3, #6]
    str	r5, [r3, #8]
    strh	r4, [r3, #12]
    pop	{r4, r5, r6, r7}
    b.w .Lcode_2496
    .byte 0x00
    .byte 0xbf

.section .text.vocoder_block_41,"ax",%progbits
.balign 4
.Lcode_19852:
.global asm_arithmetic_shift_right_i64
.type asm_arithmetic_shift_right_i64, %function
.thumb_func
asm_arithmetic_shift_right_i64:
    uxtb	r2, r2
    subs	r2, #32
    ittt	cs
    asrcs.w	r0, r1, r2
    asrcs	r1, r1, #31
    bxcs	lr
    adds	r2, #32
    rors	r1, r2
    lsrs	r0, r2
    eors	r0, r1
    lsls	r1, r2
    lsrs	r1, r2
    eors	r0, r1
    lsls	r1, r2
    asrs	r1, r2
    bx	lr
    .byte 0x00
    .byte 0x00
.Lcode_19868:
.global asm_shift_left_u64
.type asm_shift_left_u64, %function
.thumb_func
asm_shift_left_u64:
    uxtb	r2, r2
    subs	r2, #32
    ittt	cs
    lslcs.w	r1, r0, r2
    movcs	r0, #0
    bxcs	lr
    negs	r2, r2
    rors	r0, r2
    rsbs	r2, r2, #32
    lsls	r1, r2
    eors	r1, r0
    lsrs	r0, r2
    lsls	r0, r2
    eors	r1, r0
    bx	lr
    .byte 0x00
    .byte 0x00

.section .text.vocoder_block_42,"ax",%progbits
.balign 4
.Ldata_19892:
    .word 0x00120297
    .word 0x0039ff80
    .word 0xfff90016
    .word 0xff5bff01
    .word 0x020d00e1
    .word 0x00020057
    .word 0x019dfeec
    .word 0x00c0ff56
    .word 0x004efc78
    .word 0x0008002f
    .word 0x0042fec2
    .word 0xffac012a
    .word 0xfe38fecf
    .word 0x009aff7a
    .word 0xff3c00c7
    .word 0x006500aa
.Ldata_19893:
    .word 0x022d0176
    .word 0x0035ff8b
    .word 0x00be00e3
    .word 0xff5800a0
    .word 0x00020077
    .word 0x01150169
    .word 0x00caffc9
    .word 0x00eeff7a
    .word 0x0081fe39
    .word 0xff49019d
    .word 0x0279fe75
    .word 0xffbaffe4
    .word 0xfe8dfce4
    .word 0x006700dd
    .word 0x0085fd3d
    .word 0x0086ff7c
    .word 0xff8f028e
    .word 0xff77fe3d
    .word 0x00ad03af
    .word 0xffea0063
    .word 0xff74019d
    .word 0x00deff78
    .word 0xfe9d01d2
    .word 0xff7900bd
    .word 0x0062ffde
    .word 0xff30fe95
    .word 0xff7aff95
    .word 0xffbd0028
    .word 0xfe18fed8
    .word 0xff7efe71
    .word 0xfd4bffd0
    .word 0x007d0007
.Ldata_19894:
    .word 0x01e2feda
    .word 0x0034ff12
    .word 0xff7efea4
    .word 0x00e1ff3a
    .word 0x022901dd
    .word 0xffbe0060
    .word 0x008c013a
    .word 0x0103ffbc
    .word 0x0110fc7a
    .word 0xffe600a7
    .word 0xfe02fc29
    .word 0x000fffe8
    .word 0x0157ff4d
    .word 0xff0b0130
    .word 0x00d2ff2b
    .word 0x00f90178
    .word 0xffff0061
    .word 0xff21fe4a
    .word 0xfe1500e8
    .word 0x0054ff08
    .word 0x00580316
    .word 0xffdcfe87
    .word 0xfe8f03a1
    .word 0x003f0067
    .word 0xfedafec2
    .word 0xfed50025
    .word 0xfdecff2c
    .word 0x00d0012c
    .word 0x00000019
    .word 0xffe4000e
    .word 0xff2d0154
    .word 0xff6600f5
.Ldata_19895:
    .word 0x005e021d
    .word 0xff06fe65
    .word 0x01d303d5
    .word 0xfff3ffe0
    .word 0x00a5009e
    .word 0x0055ff74
    .word 0x01db017c
    .word 0x00d00176
    .word 0x01caffe8
    .word 0xffbbfdc8
    .word 0x011eff87
    .word 0xff2cffce
    .word 0x020bfe04
    .word 0xff8afeed
    .word 0x036bff90
    .word 0xffa50033
    .word 0xff82ff88
    .word 0xffd30039
    .word 0x003400ac
    .word 0xfe8f0089
    .word 0xff58fe75
    .word 0xff4a0121
    .word 0x00450000
    .word 0x00050237
    .word 0xff9cfcd5
    .word 0xfe56ff0f
    .word 0x00c6fdb5
    .word 0xff5f0066
    .word 0x015efba7
    .word 0xffecff82
    .word 0x01d2fd2d
    .word 0xffbf01d7
    .word 0xfdc401fd
    .word 0x0091fe54
    .word 0xff0c0305
    .word 0xfff60011
    .word 0xff4100d1
    .word 0x006bff83
    .word 0xff28013c
    .word 0x018100cb
    .word 0xff46fee4
    .word 0xffb2fdcd
    .word 0x0046feda
    .word 0x002dffc2
    .word 0x00a3feda
    .word 0x0167fe72
    .word 0x00b3fe71
    .word 0x017f008b
    .word 0xfcfbff04
    .word 0xfe4dfe53
    .word 0xfdf5008d
    .word 0xff3d00f7
    .word 0xfd72ff26
    .word 0x00dbff4a
    .word 0xfd87febc
    .word 0x00b70187
    .word 0xfc8bfc17
    .word 0xfff5fecb
    .word 0xfec5fd09
    .word 0x00eaffd3
    .word 0xfe5efa10
    .word 0xffb1ff03
    .word 0xff15fb6b
    .word 0xffc801ac
.Ldata_19896:
    .word 0x00c2ff2c
    .word 0x00a7ffe5
    .word 0x010afea2
    .word 0x00e6ff8b
    .word 0x00a6ff3d
    .word 0x0007ffc8
    .word 0x00e8fec4
    .word 0x0007ff67
    .word 0x013aff20
    .word 0x0054000e
    .word 0x01befe8b
    .word 0x0052ffd9
    .word 0x0127ff3b
    .word 0xffb8ffcf
    .word 0x018cfe9a
    .word 0xff6dff91
    .word 0xff94fe89
    .word 0x003f00f2
    .word 0x0013fe0f
    .word 0x00bc00c9
    .word 0xffc6fed9
    .word 0xfffa0052
    .word 0x000efe69
    .word 0x0037002a
    .word 0xffc5fe22
    .word 0xff6d011f
    .word 0x0074fd87
    .word 0xffd900de
    .word 0xfffcfe9e
    .word 0xff4e0064
    .word 0x004afe0f
    .word 0xff7c001f
    .word 0x0162009e
    .word 0x00c80148
    .word 0x01ad0033
    .word 0x00d700b3
    .word 0x013700ae
    .word 0x002f00ad
    .word 0x01930062
    .word 0x003d004f
    .word 0x01e500e9
    .word 0x00220169
    .word 0x02250014
    .word 0x00210105
    .word 0x019e00ea
    .word 0xffa800c6
    .word 0x02150061
    .word 0xffa00068
    .word 0x0046ff8f
    .word 0x0050019b
    .word 0x008eff82
    .word 0x003800e8
    .word 0x0053ffcc
    .word 0xffb00110
    .word 0x0083ffc0
    .word 0xffdd008a
    .word 0x00b1ff68
    .word 0xff8e01d3
    .word 0x00f8ff24
    .word 0xffc20119
    .word 0x00b8ffb4
    .word 0xfef9013f
    .word 0x00c8ff87
    .word 0xff6500ad
    .word 0xffccff98
    .word 0x0017ff4f
    .word 0x001bff97
    .word 0x004ffed8
    .word 0xffc5ff69
    .word 0xffccfedc
    .word 0x001fff54
    .word 0xfffafe2f
    .word 0xffedffc1
    .word 0xffabff70
    .word 0x003cffd3
    .word 0xffbfff00
    .word 0xffe2ff7c
    .word 0xff43ff21
    .word 0x004effb1
    .word 0xff3ffe7d
    .word 0xfe87fec4
    .word 0x00a8ffd7
    .word 0xff18fe7f
    .word 0x00baff10
    .word 0xfe58fe0e
    .word 0xfffcff92
    .word 0xff08fdcb
    .word 0x0009feb6
    .word 0xfebdff0e
    .word 0xffeeffb5
    .word 0xff1cfec5
    .word 0xffedff2d
    .word 0xfe8ffe9d
    .word 0xff2dff8b
    .word 0xfefbfe55
    .word 0xff20fece
    .word 0x006200c5
    .word 0xff8bffcf
    .word 0x009b005b
    .word 0xff75ffef
    .word 0x0034009d
    .word 0xff2dff78
    .word 0x00b90034
    .word 0xff16ff88
    .word 0x00900102
    .word 0xff1a0021
    .word 0x00f40091
    .word 0xff120002
    .word 0x007900c8
    .word 0xfe9effc9
    .word 0x012a0063
    .word 0xfe7dff99
    .word 0xfeea000f
    .word 0xffba012f
    .word 0xff71001a
    .word 0xff9e009e
    .word 0xff12ff98
    .word 0xff8d00a9
    .word 0xff8effaf
    .word 0xff75004a
    .word 0xff450057
    .word 0xff020135
    .word 0xffaf003c
    .word 0xff170093
    .word 0xff35ffcd
    .word 0xfee40099
    .word 0xffb7ffc0
    .word 0xfeda002b
    .word 0x00b40053
    .word 0x00c2ff9b
    .word 0x01020037
    .word 0x0121ff2c
    .word 0x00e2009a
    .word 0x008aff14
    .word 0x014e004b
    .word 0x00d4fe7d
    .word 0x00c3003a
    .word 0x003bff93
    .word 0x01300005
    .word 0x005fff3b
    .word 0x011a0094
    .word 0x0003ff3c
    .word 0x01c60044
    .word 0x0019fec8
    .word 0xff520007
    .word 0x00e90056
    .word 0xffa4ffad
    .word 0x016b003d
    .word 0xff910017
    .word 0x009fffe7
    .word 0xffc1ffa9
    .word 0x00fcffb9
    .word 0xffa2fffb
    .word 0x00700068
    .word 0xffdfffab
    .word 0x00d10062
    .word 0xffd3001d
    .word 0x003b0003
    .word 0xfffcffc2
    .word 0x0086fff7
    .word 0x005f0264
    .word 0x0091009c
    .word 0x00ca0200
    .word 0x011a001a
    .word 0x00c30209
    .word 0x00090026
    .word 0x012a01c0
    .word 0x008fffb8
    .word 0x00d0026e
    .word 0xffe50117
    .word 0x0152021a
    .word 0x0093009e
    .word 0x015d028e
    .word 0xff6c0070
    .word 0x01d9022f
    .word 0x0018ffe2
    .word 0xffc90113
    .word 0x00e2014b
    .word 0x003600ce
    .word 0x010b00b1
    .word 0xfffe0128
    .word 0x005b00c0
    .word 0x002d00eb
    .word 0x008e0049
    .word 0x001700fa
    .word 0x002f018b
    .word 0x003600a3
    .word 0x007400f1
    .word 0x003800ff
    .word 0xffcc00fc
    .word 0x003800ba
    .word 0x001b0084
    .word 0xff8f0147
    .word 0x0136ff46
    .word 0xffb400ad
    .word 0x00f5fefd
    .word 0xff33018a
    .word 0x00d5feb4
    .word 0xffa100eb
    .word 0x00cdfe3e
    .word 0xffeb013a
    .word 0x008dff4f
    .word 0xffea00b5
    .word 0x005fff2f
    .word 0xff8b0151
    .word 0x0031fef0
    .word 0xffe300e0
    .word 0x002afea5
    .word 0xfe540050
    .word 0x00b4ffb7
    .word 0xfe94001a
    .word 0x0096fef6
    .word 0xfdf2005d
    .word 0x0009ff4b
    .word 0xfe26fff5
    .word 0xfffbfe77
    .word 0xfec6004e
    .word 0x0007ffa3
    .word 0xfefd003f
    .word 0xffebff16
    .word 0xfe87005a
    .word 0xff62ff59
    .word 0xfebe003c
    .word 0xff48fea0
    .word 0xffa70326
    .word 0xfffeff1c
    .word 0x00270251
    .word 0x0001ff04
    .word 0xff86027d
    .word 0xff59fe68
    .word 0x006c0212
    .word 0xffb8fe4e
    .word 0x00170268
    .word 0xff4eff55
    .word 0x006e01b7
    .word 0xff83ff31
    .word 0x003a0207
    .word 0xfeb1febf
    .word 0x00e90198
    .word 0xff2efeac
    .word 0xfeae01fe
    .word 0x006a003b
    .word 0xff030140
    .word 0x00580023
    .word 0xff3101b8
    .word 0xffd6fff5
    .word 0xff6c0120
    .word 0xffe9ffe1
    .word 0xfec901ef
    .word 0xffa000da
    .word 0xfef20123
    .word 0xffca006f
    .word 0xff5001a7
    .word 0xff380060
    .word 0xff58010a
    .word 0xff6a000a
.Ldata_19897:
    .word 0xfd5f0435
    .word 0x0387fd90
    .word 0xfe64fd93
    .word 0xfd67083f
    .word 0x06b8fcd3
    .word 0xfe33fd2f
    .word 0xfe97022f
    .word 0x01c6ff35
    .word 0xff83feb8
    .word 0xfe4f03f9
    .word 0x03650061
    .word 0x008ffe36
    .word 0xfd2c021e
    .word 0x0230fd5b
    .word 0xfe00fdfa
    .word 0xfd9e03e0
    .word 0x0349ff6e
    .word 0xff52fe33
    .word 0xfdfa0051
    .word 0x0024ff14
    .word 0xffa2fda1
    .word 0xfe3401cd
    .word 0x0178004e
    .word 0x0067fdeb
    .word 0xff6a0278
    .word 0x01b4fcc1
    .word 0xfd56ff30
    .word 0xfee704f1
    .word 0x041dfe4a
    .word 0xfea3fefd
    .word 0xff62010a
    .word 0x007efe2a
    .word 0xfe5eff22
    .word 0xff1f01f5
    .word 0x01d8ff96
    .word 0xffc6ff64
    .word 0xfdf7007b
    .word 0x0018fb80
    .word 0xfc8afeeb
    .word 0xfec801a8
    .word 0x0144fed0
    .word 0xff06fef8
    .word 0xfed8fddf
    .word 0xfd26fe67
    .word 0xfec0fe5d
    .word 0xfee20001
    .word 0x0004ff78
    .word 0xffcdfea3
    .word 0xfb590339
    .word 0x0188fdce
    .word 0xfe75fbad
    .word 0xfcca0510
    .word 0x03c5fff2
    .word 0x007efc4b
    .word 0xfc7e005c
    .word 0x00200044
    .word 0xfff2fbaf
    .word 0xfd3102b1
    .word 0x01eb01b6
    .word 0x0143fcf4
    .word 0xf8c902c8
    .word 0x0083fa7e
    .word 0xfc10f963
    .word 0xfcd3026d
    .word 0x01e2ff22
    .word 0x000dfc6e
    .word 0xfac8fe1b
    .word 0xfca7feea
    .word 0xffb9f9a8
    .word 0xfbddffb2
    .word 0xffb30230
    .word 0x01b8f856
    .word 0xfe18007e
    .word 0xffe3fe1a
    .word 0xfe5dfe1d
    .word 0xfe51024b
    .word 0x0210ffc3
    .word 0xff8cfde8
    .word 0xfd84fe1d
    .word 0xfd52feae
    .word 0xfe6cfcea
    .word 0xfe1200c2
    .word 0x007b0079
    .word 0x0040fe31
    .word 0xfd8cfd97
    .word 0xfda7fc6e
    .word 0xfc90fbf8
    .word 0xfcf8ff8f
    .word 0xff14fefe
    .word 0xff85fd00
    .word 0xfb43f9c8
    .word 0xf865ff24
    .word 0xfe8cf8d9
    .word 0xfcd4fded
    .word 0xfd0c0015
    .word 0x004efc68
    .word 0xff7f023d
    .word 0x020bfe86
    .word 0xff08ff76
    .word 0xff2b03ab
    .word 0x037f0015
    .word 0xffc0ff43
    .word 0xffc700a8
    .word 0x005effab
    .word 0xffc2ff96
    .word 0xffa7022b
    .word 0x01fa00e6
    .word 0x00d8ff7a
    .word 0xff0f0074
    .word 0x0078fedd
    .word 0xff34ff2a
    .word 0xff1b01b6
    .word 0x01800040
    .word 0x0018ff70
    .word 0xff5afe84
    .word 0xfddfff69
    .word 0xff51ff68
    .word 0xffa1ffc4
    .word 0xffdc00ff
    .word 0x0120ff2d
    .word 0x00be00eb
    .word 0x0095fe0c
    .word 0xfe260010
    .word 0x00410229
    .word 0x0209ff3f
    .word 0xff990033
    .word 0x002cfe89
    .word 0xfe31fea7
    .word 0xfef5ffeb
    .word 0x001d0052
    .word 0x00030021
    .word 0x00430016
    .word 0xffb6fdb3
    .word 0xfd57fda0
    .word 0xfd43ff21
    .word 0x002f001a
    .word 0xffadff94
    .word 0xff98fffc
    .word 0xff83fa40
    .word 0xf8f7fdc5
    .word 0xfd92fe4b
    .word 0xff7afe21
    .word 0xfdc0001c
    .word 0x0060ff64
    .word 0xfe730123
    .word 0x00cdff8e
    .word 0xff7ffeb6
    .word 0xfef00220
    .word 0x01f500a0
    .word 0x00fafee2
    .word 0xfe8fff07
    .word 0xfe840041
    .word 0x0025fe4a
    .word 0xfec50060
    .word 0x006101bf
    .word 0x0242fe80
    .word 0xfcacffc8
    .word 0xfefefd54
    .word 0xfdadfd53
    .word 0xfe79ffc1
    .word 0xff8f00c8
    .word 0x0146fe52
    .word 0xfda2fbf1
    .word 0xfb59fe43
    .word 0xfe54fcc6
    .word 0xfdaffd9a
    .word 0xfd180260
    .word 0x037efd19
    .word 0xffaaff01
    .word 0xfeb5febe
    .word 0xfe88ff42
    .word 0xff3300ad
    .word 0x0072fffe
    .word 0x0043fee9
    .word 0xfe6bfba4
    .word 0xfab3ffc9
    .word 0x0036fe90
    .word 0xfecffead
    .word 0xfe1300b9
    .word 0x00d8fe8a
    .word 0xfd20fb64
    .word 0xfa4bfc58
    .word 0xfc30fb91
    .word 0xfe36fdcc
    .word 0xfd20ff96
    .word 0xffc9fe27
    .word 0xfdb9f5bd
    .word 0xf784fe21
    .word 0xfb80fccd
    .word 0xfdd3f906
    .word 0xfa040021
    .word 0x0237fd5d
    .word 0x005f0525
    .word 0x05e8fab8
    .word 0xfc88fefa
    .word 0x00340944
    .word 0x07ccfe94
    .word 0xff1affed
    .word 0x00430358
    .word 0x030dff01
    .word 0xff51fffd
    .word 0x00730625
    .word 0x057100c3
    .word 0x0138006b
    .word 0x001a03c9
    .word 0x02c3fde3
    .word 0xfe03004b
    .word 0xffcb05f8
    .word 0x0528ff27
    .word 0xff3dff89
    .word 0xffd2017d
    .word 0x012bff70
    .word 0xff89ffec
    .word 0x001b02b5
    .word 0x0264008f
    .word 0x006c0061
    .word 0x020d02c5
    .word 0x0281fcf5
    .word 0xfd7d0150
    .word 0x00d305c1
    .word 0x04f9fdfb
    .word 0xfde10161
    .word 0x00d601ec
    .word 0x01a8fe61
    .word 0xfee5011e
    .word 0x00cf02e1
    .word 0x028cff93
    .word 0xfff90102
    .word 0x00670134
    .word 0x0183fcba
    .word 0xfd6500bc
    .word 0x003c02ae
    .word 0x0299ff36
    .word 0xfeeb0020
    .word 0x004fffa9
    .word 0xff56fe55
    .word 0xfe9c00c2
    .word 0x00d200c2
    .word 0x0082ffcb
    .word 0x000000f3
    .word 0xfee302d9
    .word 0x0324fe77
    .word 0xfef1ff28
    .word 0xfe5d054f
    .word 0x04e0ffc0
    .word 0x00a3fed3
    .word 0xfef00137
    .word 0x012cfff1
    .word 0x0033feb4
    .word 0xfeeb0334
    .word 0x029901dc
    .word 0x0207ff11
    .word 0xfe47015a
    .word 0x0108fe84
    .word 0xfeb8fe7c
    .word 0xff1002d9
    .word 0x02beffb1
    .word 0x002afed8
    .word 0xfe61ff7a
    .word 0xff01ffa7
    .word 0xffb8fdeb
    .word 0xfe1e00aa
    .word 0x005f013a
    .word 0x0187fd86
    .word 0xffef0180
    .word 0x0186fe69
    .word 0xfee8ffda
    .word 0xffcb032f
    .word 0x02c7fff1
    .word 0xffd5ffd2
    .word 0xff51ffa0
    .word 0xff76ff5b
    .word 0xff0bfef8
    .word 0xffde017d
    .word 0x0180008f
    .word 0x009c0023
    .word 0xffb3ff19
    .word 0xff74fd9c
    .word 0xfde0ff15
    .word 0xffad012e
    .word 0x0111ffe4
    .word 0xffbdff7f
    .word 0xffabfcab
    .word 0xfbf5ff00
    .word 0xfebdffa5
    .word 0xff66fec4
    .word 0xfed10067
    .word 0x00f9ff86
    .word 0x014303ed
    .word 0x037efe39
    .word 0xfe5a00f7
    .word 0x02280609
    .word 0x0529005e
    .word 0x001d022d
    .word 0x00ec01e5
    .word 0x01a4ffca
    .word 0xffef00f8
    .word 0x013b0312
    .word 0x03150160
    .word 0x01eb01c7
    .word 0x00950196
    .word 0x012fff22
    .word 0xff030099
    .word 0x009a0321
    .word 0x02bc00a8
    .word 0x008e00b7
    .word 0x0147fff9
    .word 0xffa7ffdf
    .word 0xffad01a8
    .word 0x00dd0116
    .word 0x00a6016f
    .word 0x016500f5
    .word 0x0334018b
    .word 0x015ffd44
    .word 0xfe3a0248
    .word 0x02df0306
    .word 0x034afeca
    .word 0xff340262
    .word 0x0218ffeb
    .word 0xff23fece
    .word 0xff10024d
    .word 0x01ae0144
    .word 0x00e100a0
    .word 0x00b401dc
    .word 0x01ad0001
    .word 0xff3ffcd7
    .word 0xfdc301d8
    .word 0x01d90119
    .word 0x00d3ff02
    .word 0xff320156
    .word 0x0272fd8f
    .word 0xfca0fe97
    .word 0xfda702b2
    .word 0x017bff07
    .word 0xfea20063
    .word 0x006c019a
    .word 0xffea01cb
    .word 0x019affd8
    .word 0x0004ffd7
    .word 0x00420310
    .word 0x02c4014b
    .word 0x0151ffd8
    .word 0x005c003c
    .word 0x00410092
    .word 0x00b20016
    .word 0x00500175
    .word 0x0174019e
    .word 0x02070044
    .word 0xff77ffee
    .word 0xffd3fed8
    .word 0xfefeffd4
    .word 0x00000118
    .word 0x0115007a
    .word 0x00d5ffd6
    .word 0x0051fdb0
    .word 0xfd4affe7
    .word 0xffba0035
    .word 0x0063ffde
    .word 0xffa00195
    .word 0x019a0018
    .word 0x010500c1
    .word 0x0063fea4
    .word 0xfed100c5
    .word 0x00a701bd
    .word 0x0170001c
    .word 0x004000ad
    .word 0x00f2fe2e
    .word 0xfd62ffae
    .word 0xffd90147
    .word 0x00e80002
    .word 0xffe20101
    .word 0x014f0108
    .word 0x013cfdf7
    .word 0xfd2dfe25
    .word 0xfe9b00ff
    .word 0x00ddff83
    .word 0xff31004c
    .word 0x008000a4
    .word 0x0249f895
    .word 0xf6c6fe13
    .word 0xfd6b0238
    .word 0x00ddfb73
    .word 0xfb8f0162
    .word 0x029c010d
    .word 0x00870427
    .word 0x0403fef0
    .word 0xff3efff3
    .word 0xfecc0888
    .word 0x06de019d
    .word 0x00a7feab
    .word 0xffbf0291
    .word 0x027e0051
    .word 0x0035ff66
    .word 0xffd70502
    .word 0x043402c5
    .word 0x0247fff8
    .word 0xff650280
    .word 0x025eff78
    .word 0xffaaff89
    .word 0xffc40467
    .word 0x03b90060
    .word 0x00c5ff73
    .word 0xff9600fb
    .word 0x00a3005b
    .word 0x005effa6
    .word 0xffbf01e9
    .word 0x019b0160
    .word 0x016eff6b
    .word 0x010d02bd
    .byte 0xb2
    .byte 0xfe
    .byte 0x5a
    .byte 0x02
    .word 0xfefe00e5
    .word 0x00f904b7
    .word 0x0467ff9b
    .word 0x0024010f
    .word 0x00610150
    .word 0x00f6ff88
    .word 0xff950065
    .word 0x00480227
    .word 0x026100d4
    .word 0x011d004f
    .word 0xffc100c2
    .word 0x00a5fec6
    .word 0xfefb0032
    .word 0x00710240
    .word 0x01e10000
    .word 0x001d0051
    .word 0x0019ff0e
    .word 0xfebdffba
    .word 0xfff60039
    .word 0x003800d2
    .word 0x009e00cc
    .word 0x00ed006c
    .word 0xfdc602a3
    .word 0x02730021
    .word 0x00c2fddb
    .word 0xfcd70634
    .word 0x04aa0253
    .word 0x0248fdfc
    .word 0xfe8b018a
    .word 0x017d0104
    .word 0x0148fe09
    .word 0xfdff02c5
    .word 0x02d502d8
    .word 0x03c7fd15
    .word 0xfd7e0114
    .word 0x0102ff14
    .word 0xffaefdb5
    .word 0xfe4e033f
    .word 0x027f0198
    .word 0x0187fe4a
    .word 0xfd9fff6e
    .word 0xfeac00a7
    .word 0x0149fd96
    .word 0xfdad012f
    .word 0x00820263
    .word 0x032cfd85
    .word 0xff590122
    .word 0x00edff63
    .word 0xffaeff2a
    .word 0xff4d02f0
    .word 0x02a400c5
    .word 0x0104ff0e
    .word 0xff800006
    .word 0xff950034
    .word 0x0056ff58
    .word 0xfee70174
    .word 0x012001d8
    .word 0x0221ff3e
    .word 0xfe53ff30
    .word 0xfebafeea
    .word 0xff3cfe79
    .word 0xff59005c
    .word 0x0022009c
    .word 0x008cff1a
    .word 0xfef1fcbb
    .word 0xfc8c00a2
    .word 0x0143fe48
    .word 0xff2fff39
    .word 0xfea8019a
    .word 0x021bff15
    .word 0x00b00327
    .word 0x02b60012
    .word 0xfff70063
    .word 0x02ff0706
    .word 0x05ed015e
    .word 0x01f00299
    .word 0x0090019a
    .word 0x016000b0
    .word 0x00d200b9
    .word 0x01030284
    .word 0x02820295
    .word 0x033b0086
    .word 0x00760150
    .word 0x00fafff5
    .word 0x00130031
    .word 0x00a10277
    .word 0x02030172
    .word 0x01490097
    .word 0x0031ff9f
    .word 0xff4400b1
    .word 0x00bf000b
    .word 0x005a00a2
    .word 0x00d501a7
    .word 0x01ec0017
    .word 0x017d01d0
    .word 0x0163ff8c
    .word 0xff860144
    .word 0x01b702b7
    .word 0x0279006c
    .word 0x00770181
    .word 0x018f001e
    .word 0xffc50064
    .word 0x00b6018f
    .word 0x01a7008e
    .word 0x00bb018c
    .word 0x0228019f
    .word 0x0116ff6e
    .word 0xff0eff2c
    .word 0xff850139
    .word 0x0125012d
    .word 0x00d6007f
    .word 0x00740126
    .word 0x0200fbaa
    .word 0xfadeffdc
    .word 0xff1b023a
    .word 0x0146ff3f
    .word 0xff170152
    .word 0x01c600f7
    .word 0xff5e01a4
    .word 0x014a009b
    .word 0x00b6ff47
    .word 0xffbb0307
    .word 0x027e027b
    .word 0x0289ff9a
    .word 0xff9a0028
    .word 0x000501b3
    .word 0x023aff7f
    .word 0xff460136
    .word 0x014d0348
    .word 0x0440ff6e
    .word 0xff63ff55
    .word 0xff42ffd5
    .word 0x003cffa7
    .word 0xff610118
    .word 0x00b7017e
    .word 0x017aff4e
    .word 0xff87fdd7
    .word 0xfd320162
    .word 0x0230ffed
    .word 0xfe5bff28
    .word 0xfeeb0367
    .word 0x04fdfe6c
    .word 0x008fff96
    .word 0xff5affa6
    .word 0x00000075
    .word 0x00220186
    .word 0x0124012b
    .word 0x01460005
    .word 0x0017fd2d
    .word 0xfd1000ba
    .word 0x012d0074
    .word 0x0036fff9
    .word 0xff710243
    .word 0x02b4fff5
    .word 0x0036fc08
    .word 0xfa7a0028
    .word 0xfff7008e
    .word 0x005ffed5
    .word 0xfe6b014b
    .word 0x01ee0046
    .word 0x0054f815
    .word 0xf6cb0065
    .word 0x01e601af
    .word 0xff89fd51
    .word 0xfbfb03d7
    .word 0x0567ff40
    .word 0x021d06e6
    .word 0x0643fda4
    .word 0xff060203
    .word 0x03b60cc8
    .word 0x0cedfeef
    .word 0x00ae007c
    .word 0x01ae037c
    .word 0x037300c3
    .word 0x00620153
    .word 0x022109fc
    .word 0x081403e8
    .word 0x03ca02c3
    .word 0x018e03d1
    .word 0x0336ff89
    .word 0xff91017f
    .word 0x0247099e
    .word 0x0885ff78
    .word 0x005f01a1
    .word 0x0111020c
    .word 0x01c0005e
    .word 0x00860108
    .word 0x017503ed
    .word 0x0387024b
    .word 0x026900da
    .word 0x042f04d6
    .word 0x0436fe17
    .word 0xfe6a0305
    .word 0x04da084f
    .word 0x07f6ff08
    .word 0x00e3046b
    .word 0x02820219
    .word 0x01d9ff4e
    .word 0xff910230
    .word 0x03ed0463
    .word 0x03bc023a
    .word 0x025002d9
    .word 0x01e402f0
    .word 0x027afe2d
    .word 0xfea101df
    .word 0x023603b9
    .word 0x03060016
    .word 0x00170200
    .word 0x0260007f
    .word 0x0000ffe9
    .word 0xffe902cd
    .word 0x0217014f
    .word 0x01520168
    .word 0x01d30278
    .word 0x006b03b1
    .word 0x03c7ffde
    .word 0x005e0060
    .word 0x011706da
    .word 0x06ad01f6
    .word 0x02fb0007
    .word 0x004c02b4
    .word 0x022401dc
    .word 0x02060039
    .word 0x00e804ae
    .word 0x03ce04aa
    .word 0x053effce
    .word 0xffc4021e
    .word 0x01f80009
    .word 0x003effd9
    .word 0x002b03d2
    .word 0x03ab013e
    .word 0x0181ffa6
    .word 0xff830089
    .word 0x005b0104
    .word 0x0134ffb9
    .word 0xfff80188
    .word 0x013a0289
    .word 0x02e4003d
    .word 0x016e0291
    .word 0x0268ff4a
    .word 0xff8b011a
    .word 0x014c046d
    .word 0x03ec010e
    .word 0x012b00fd
    .word 0x00aa00f4
    .word 0x00cb0046
    .word 0x006f0088
    .word 0x00fb01d4
    .word 0x01600279
    .word 0x02960116
    .word 0x00820084
    .word 0x0018ff89
    .word 0xff7100b6
    .word 0x0109018e
    .word 0x013e0101
    .word 0x01270164
    .word 0x00e7fe43
    .word 0xfd8a00bf
    .word 0x00e3015f
    .word 0x011bffe1
    .word 0xffb401dc
    .word 0x023c015c
    .word 0x037f0575
    .word 0x046300a1
    .word 0x00bd0304
    .word 0x07360a13
    .word 0x0a5e020c
    .word 0x026b04dd
    .word 0x0275028f
    .word 0x024c00cc
    .word 0x017f02e0
    .word 0x056a0603
    .word 0x03d603ff
    .word 0x047c046d
    .word 0x01b60236
    .word 0x01e8fff9
    .word 0x003b01ca
    .word 0x02210457
    .word 0x03ae015f
    .word 0x01440246
    .word 0x027b0076
    .word 0xfff20128
    .word 0x00c702c9
    .word 0x01fa01f5
    .word 0x02080295
    .word 0x033802af
    .word 0x04a302d5
    .word 0x0223fef5
    .word 0xff8903b2
    .word 0x05030446
    .word 0x03890060
    .word 0x007603bf
    .word 0x050800e2
    .word 0x004000d3
    .word 0x00ba03ea
    .word 0x043501d6
    .word 0x00d8029b
    .word 0x041404a8
    .word 0x042c000c
    .word 0x00d6febd
    .word 0xff5b0364
    .word 0x031e01ca
    .word 0x0147007d
    .word 0x007f02b9
    .word 0x0496fe9c
    .word 0xfcfe0038
    .word 0x011004b4
    .word 0x02c9ff96
    .word 0xff0501db
    .word 0x020203c9
    .word 0x01300298
    .word 0x024200ee
    .word 0x00ea00f9
    .word 0x020d0585
    .word 0x04570358
    .word 0x03b2025b
    .word 0x00dd0075
    .word 0x00390241
    .word 0x02d700db
    .word 0x016c0149
    .word 0x01d2043b
    .word 0x0584016c
    .word 0x00c800e5
    .word 0x00ac00e0
    .word 0x00ed0111
    .word 0x012301ab
    .word 0x014001ac
    .word 0x01da0125
    .word 0x01b7fe83
    .word 0xfd83027a
    .word 0x02a101ed
    .word 0x00baffaa
    .word 0xfec00417
    .word 0x03d300ca
    .word 0x021b0136
    .word 0x0103ffbb
    .word 0xfff201b4
    .word 0x01be01f6
    .word 0x021300f6
    .word 0x016a01ce
    .word 0x0215fe7a
    .word 0xfe7c0122
    .word 0x015d02a7
    .word 0x025c0070
    .word 0xffbb02dd
    .word 0x02ec0210
    .word 0x032cfe85
    .word 0xfda70076
    .word 0x00020334
    .word 0x01dcffe1
    .word 0xffd2016c
    .word 0x01ed01f5
    .word 0x02c9fbd6
    .word 0xfaa001fe
    .word 0x013a0349
    .word 0x034dfdfa
    .word 0xfcb603eb
    .word 0x045a0480
.Ldata_19899:
    .word 0x11001000
    .word 0x21101110
    .word 0x22112111
    .word 0x32213211
    .word 0x33223321
    .word 0x44224322
    .word 0x54324432
    .word 0x55335433
    .word 0x65435543
    .word 0x66446643
    .word 0x76547644
    .word 0x87547754
    .word 0x87658755
    .word 0x98658865
    .word 0x98769866
    .word 0xa9769976
    .word 0xba76b976
    .word 0xba87ba86
    .word 0xcb87ca87
    .word 0xcb98cb97
    .word 0xdc98db98
    .word 0xeca8dca8
    .word 0xeda9eca9
    .word 0xfdb9fda9
    .word 0xbbceaace
    .word 0xafceb4ce
    .word 0xb6ceacce
    .word 0xc0cea7ce
    .word 0xa2cefecd
    .word 0xbdceb0ce
    .word 0xa3cea8ce
    .word 0xb2cebfce
    .word 0xbacea5ce
    .word 0xb5cee2e7
    .word 0xb7ceb1ce
    .word 0xb9ceb8ce
    .word 0xa4cebfec
    .word 0xa1cea9ce
    .word 0xaeceb3ce
    .word 0xadceb8e6
    .word 0xa1e1bece
    .word 0xabe2bcce
    .word 0xb1decbd9
    .word 0xace2f4f0
    .word 0xf8e0d4e5
    .word 0xd0ecb8e8
    .word 0xa6cedbf6
    .word 0xf1daabce
    .word 0xede0d7db
    .word 0xf3dac3da
    .word 0xa2e4cbe1
    .word 0xcde1dadd
    .word 0xede3c7e3
    .word 0xbaf4b6e4
    .word 0x0000a6ea
.Ldata_19900:
    .word 0x00007fff
    .word 0x00008001
    .word 0xfe6e7ffe
    .word 0x01928002
    .word 0xfcdc7ff6
    .word 0x0324800a
    .word 0xfb4a7fea
    .word 0x04b68016
    .word 0xf9b87fd9
    .word 0x06488027
    .word 0xf8277fc2
    .word 0x07d9803e
    .word 0xf6957fa7
    .word 0x096b8059
    .word 0xf5057f87
    .word 0x0afb8079
    .word 0xf3747f62
    .word 0x0c8c809e
    .word 0xf1e47f38
    .word 0x0e1c80c8
    .word 0xf0557f0a
    .word 0x0fab80f6
    .word 0xeec67ed6
    .word 0x113a812a
    .word 0xed387e9d
    .word 0x12c88163
    .word 0xebab7e60
    .word 0x145581a0
    .word 0xea1e7e1e
    .word 0x15e281e2
    .word 0xe8927dd6
    .word 0x176e822a
    .word 0xe7077d8a
    .word 0x18f98276
    .word 0xe57d7d3a
    .word 0x1a8382c6
    .word 0xe3f47ce4
    .word 0x1c0c831c
    .word 0xe26d7c89
    .word 0x1d938377
    .word 0xe0e67c2a
    .word 0x1f1a83d6
    .word 0xdf617bc6
    .word 0x209f843a
    .word 0xdddc7b5d
    .word 0x222484a3
    .word 0xdc597aef
    .word 0x23a78511
    .word 0xdad87a7d
    .word 0x25288583
    .word 0xd9587a06
    .word 0x26a885fa
    .word 0xd7d9798a
    .word 0x28278676
    .word 0xd65c790a
    .word 0x29a486f6
    .word 0xd4e17885
    .word 0x2b1f877b
    .word 0xd36777fb
    .word 0x2c998805
    .word 0xd1ef776c
    .word 0x2e118894
    .word 0xd07976d9
    .word 0x2f878927
    .word 0xcf047642
    .word 0x30fc89be
    .word 0xcd9275a6
    .word 0x326e8a5a
    .word 0xcc217505
    .word 0x33df8afb
    .word 0xcab27460
    .word 0x354e8ba0
    .word 0xc94673b6
    .word 0x36ba8c4a
    .word 0xc7db7308
    .word 0x38258cf8
    .word 0xc6737255
    .word 0x398d8dab
    .word 0xc50d719e
    .word 0x3af38e62
    .word 0xc3a970e3
    .word 0x3c578f1d
    .word 0xc2487023
    .word 0x3db88fdd
    .word 0xc0e96f5f
    .word 0x3f1790a1
    .word 0xbf8c6e97
    .word 0x40749169
    .word 0xbe326dca
    .word 0x41ce9236
    .word 0xbcda6cf9
    .word 0x43269307
    .word 0xbb856c24
    .word 0x447b93dc
    .word 0xba336b4b
    .word 0x45cd94b5
    .word 0xb8e36a6e
    .word 0x471d9592
    .word 0xb796698c
    .word 0x486a9674
    .word 0xb64c68a7
    .word 0x49b49759
    .word 0xb50567bd
    .word 0x4afb9843
    .word 0xb3c066d0
    .word 0x4c409930
    .word 0xb27f65de
    .word 0x4d819a22
    .word 0xb14064e9
    .word 0x4ec09b17
    .word 0xb00563ef
    .word 0x4ffb9c11
    .word 0xaecc62f2
    .word 0x51349d0e
    .word 0xad9761f1
    .word 0x52699e0f
    .word 0xac6560ec
    .word 0x539b9f14
    .word 0xab365fe4
    .word 0x54caa01c
    .word 0xaa0a5ed7
    .word 0x55f6a129
    .word 0xa8e25dc8
    .word 0x571ea238
    .word 0xa7bd5cb4
    .word 0x5843a34c
    .word 0xa69c5b9d
    .word 0x5964a463
    .word 0xa57e5a82
    .word 0x5a82a57e
    .word 0xa4635964
    .word 0x5b9da69c
    .word 0xa34c5843
    .word 0x5cb4a7bd
    .word 0xa238571e
    .word 0x5dc8a8e2
    .word 0xa12955f6
    .word 0x5ed7aa0a
    .word 0xa01c54ca
    .word 0x5fe4ab36
    .word 0x9f14539b
    .word 0x60ecac65
    .word 0x9e0f5269
    .word 0x61f1ad97
    .word 0x9d0e5134
    .word 0x62f2aecc
    .word 0x9c114ffb
    .word 0x63efb005
    .word 0x9b174ec0
    .word 0x64e9b140
    .word 0x9a224d81
    .word 0x65deb27f
    .word 0x99304c40
    .word 0x66d0b3c0
    .word 0x98434afb
    .word 0x67bdb505
    .word 0x975949b4
    .word 0x68a7b64c
    .word 0x9674486a
    .word 0x698cb796
    .word 0x9592471d
    .word 0x6a6eb8e3
    .word 0x94b545cd
    .word 0x6b4bba33
    .word 0x93dc447b
    .word 0x6c24bb85
    .word 0x93074326
    .word 0x6cf9bcda
    .word 0x923641ce
    .word 0x6dcabe32
    .word 0x91694074
    .word 0x6e97bf8c
    .word 0x90a13f17
    .word 0x6f5fc0e9
    .word 0x8fdd3db8
    .word 0x7023c248
    .word 0x8f1d3c57
    .word 0x70e3c3a9
    .word 0x8e623af3
    .word 0x719ec50d
    .word 0x8dab398d
    .word 0x7255c673
    .word 0x8cf83825
    .word 0x7308c7db
    .word 0x8c4a36ba
    .word 0x73b6c946
    .word 0x8ba0354e
    .word 0x7460cab2
    .word 0x8afb33df
    .word 0x7505cc21
    .word 0x8a5a326e
    .word 0x75a6cd92
    .word 0x89be30fc
    .word 0x7642cf04
    .word 0x89272f87
    .word 0x76d9d079
    .word 0x88942e11
    .word 0x776cd1ef
    .word 0x88052c99
    .word 0x77fbd367
    .word 0x877b2b1f
    .word 0x7885d4e1
    .word 0x86f629a4
    .word 0x790ad65c
    .word 0x86762827
    .word 0x798ad7d9
    .word 0x85fa26a8
    .word 0x7a06d958
    .word 0x85832528
    .word 0x7a7ddad8
    .word 0x851123a7
    .word 0x7aefdc59
    .word 0x84a32224
    .word 0x7b5ddddc
    .word 0x843a209f
    .word 0x7bc6df61
    .word 0x83d61f1a
    .word 0x7c2ae0e6
    .word 0x83771d93
    .word 0x7c89e26d
    .word 0x831c1c0c
    .word 0x7ce4e3f4
    .word 0x82c61a83
    .word 0x7d3ae57d
    .word 0x827618f9
    .word 0x7d8ae707
    .word 0x822a176e
    .word 0x7dd6e892
    .word 0x81e215e2
    .word 0x7e1eea1e
    .word 0x81a01455
    .word 0x7e60ebab
    .word 0x816312c8
    .word 0x7e9ded38
    .word 0x812a113a
    .word 0x7ed6eec6
    .word 0x80f60fab
    .word 0x7f0af055
    .word 0x80c80e1c
    .word 0x7f38f1e4
    .word 0x809e0c8c
    .word 0x7f62f374
    .word 0x80790afb
    .word 0x7f87f505
    .word 0x8059096b
    .word 0x7fa7f695
    .word 0x803e07d9
    .word 0x7fc2f827
    .word 0x80270648
    .word 0x7fd9f9b8
    .word 0x801604b6
    .word 0x7feafb4a
    .word 0x800a0324
    .word 0x7ff6fcdc
    .word 0x80020192
    .word 0x7ffefe6e
    .word 0x80010000
    .word 0x7fff0000
    .word 0x8002fe6e
    .word 0x7ffe0192
    .word 0x800afcdc
    .word 0x7ff60324
    .word 0x8016fb4a
    .word 0x7fea04b6
    .word 0x8027f9b8
    .word 0x7fd90648
    .word 0x803ef827
    .word 0x7fc207d9
    .word 0x8059f695
    .word 0x7fa7096b
    .word 0x8079f505
    .word 0x7f870afb
    .word 0x809ef374
    .word 0x7f620c8c
    .word 0x80c8f1e4
    .word 0x7f380e1c
    .word 0x80f6f055
    .word 0x7f0a0fab
    .word 0x812aeec6
    .word 0x7ed6113a
    .word 0x8163ed38
    .word 0x7e9d12c8
    .word 0x81a0ebab
    .word 0x7e601455
    .word 0x81e2ea1e
    .word 0x7e1e15e2
    .word 0x822ae892
    .word 0x7dd6176e
    .word 0x8276e707
    .word 0x7d8a18f9
    .word 0x82c6e57d
    .word 0x7d3a1a83
    .word 0x831ce3f4
    .word 0x7ce41c0c
    .word 0x8377e26d
    .word 0x7c891d93
    .word 0x83d6e0e6
    .word 0x7c2a1f1a
    .word 0x843adf61
    .word 0x7bc6209f
    .word 0x84a3dddc
    .word 0x7b5d2224
    .word 0x8511dc59
    .word 0x7aef23a7
    .word 0x8583dad8
    .word 0x7a7d2528
    .word 0x85fad958
    .word 0x7a0626a8
    .word 0x8676d7d9
    .word 0x798a2827
    .word 0x86f6d65c
    .word 0x790a29a4
    .word 0x877bd4e1
    .word 0x78852b1f
    .word 0x8805d367
    .word 0x77fb2c99
    .word 0x8894d1ef
    .word 0x776c2e11
    .word 0x8927d079
    .word 0x76d92f87
    .word 0x89becf04
    .word 0x764230fc
    .word 0x8a5acd92
    .word 0x75a6326e
    .word 0x8afbcc21
    .word 0x750533df
    .word 0x8ba0cab2
    .word 0x7460354e
    .word 0x8c4ac946
    .word 0x73b636ba
    .word 0x8cf8c7db
    .word 0x73083825
    .word 0x8dabc673
    .word 0x7255398d
    .word 0x8e62c50d
    .word 0x719e3af3
    .word 0x8f1dc3a9
    .word 0x70e33c57
    .word 0x8fddc248
    .word 0x70233db8
    .word 0x90a1c0e9
    .word 0x6f5f3f17
    .word 0x9169bf8c
    .word 0x6e974074
    .word 0x9236be32
    .word 0x6dca41ce
    .word 0x9307bcda
    .word 0x6cf94326
    .word 0x93dcbb85
    .word 0x6c24447b
    .word 0x94b5ba33
    .word 0x6b4b45cd
    .word 0x9592b8e3
    .word 0x6a6e471d
    .word 0x9674b796
    .word 0x698c486a
    .word 0x9759b64c
    .word 0x68a749b4
    .word 0x9843b505
    .word 0x67bd4afb
    .word 0x9930b3c0
    .word 0x66d04c40
    .word 0x9a22b27f
    .word 0x65de4d81
    .word 0x9b17b140
    .word 0x64e94ec0
    .word 0x9c11b005
    .word 0x63ef4ffb
    .word 0x9d0eaecc
    .word 0x62f25134
    .word 0x9e0fad97
    .word 0x61f15269
    .word 0x9f14ac65
    .word 0x60ec539b
    .word 0xa01cab36
    .word 0x5fe454ca
    .word 0xa129aa0a
    .word 0x5ed755f6
    .word 0xa238a8e2
    .word 0x5dc8571e
    .word 0xa34ca7bd
    .word 0x5cb45843
    .word 0xa463a69c
    .word 0x5b9d5964
    .word 0xa57ea57e
    .word 0x5a825a82
    .word 0xa69ca463
    .word 0x59645b9d
    .word 0xa7bda34c
    .word 0x58435cb4
    .word 0xa8e2a238
    .word 0x571e5dc8
    .word 0xaa0aa129
    .word 0x55f65ed7
    .word 0xab36a01c
    .word 0x54ca5fe4
    .word 0xac659f14
    .word 0x539b60ec
    .word 0xad979e0f
    .word 0x526961f1
    .word 0xaecc9d0e
    .word 0x513462f2
    .word 0xb0059c11
    .word 0x4ffb63ef
    .word 0xb1409b17
    .word 0x4ec064e9
    .word 0xb27f9a22
    .word 0x4d8165de
    .word 0xb3c09930
    .word 0x4c4066d0
    .word 0xb5059843
    .word 0x4afb67bd
    .word 0xb64c9759
    .word 0x49b468a7
    .word 0xb7969674
    .word 0x486a698c
    .word 0xb8e39592
    .word 0x471d6a6e
    .word 0xba3394b5
    .word 0x45cd6b4b
    .word 0xbb8593dc
    .word 0x447b6c24
    .word 0xbcda9307
    .word 0x43266cf9
    .word 0xbe329236
    .word 0x41ce6dca
    .word 0xbf8c9169
    .word 0x40746e97
    .word 0xc0e990a1
    .word 0x3f176f5f
    .word 0xc2488fdd
    .word 0x3db87023
    .word 0xc3a98f1d
    .word 0x3c5770e3
    .word 0xc50d8e62
    .word 0x3af3719e
    .word 0xc6738dab
    .word 0x398d7255
    .word 0xc7db8cf8
    .word 0x38257308
    .word 0xc9468c4a
    .word 0x36ba73b6
    .word 0xcab28ba0
    .word 0x354e7460
    .word 0xcc218afb
    .word 0x33df7505
    .word 0xcd928a5a
    .word 0x326e75a6
    .word 0xcf0489be
    .word 0x30fc7642
    .word 0xd0798927
    .word 0x2f8776d9
    .word 0xd1ef8894
    .word 0x2e11776c
    .word 0xd3678805
    .word 0x2c9977fb
    .word 0xd4e1877b
    .word 0x2b1f7885
    .word 0xd65c86f6
    .word 0x29a4790a
    .word 0xd7d98676
    .word 0x2827798a
    .word 0xd95885fa
    .word 0x26a87a06
    .word 0xdad88583
    .word 0x25287a7d
    .word 0xdc598511
    .word 0x23a77aef
    .word 0xdddc84a3
    .word 0x22247b5d
    .word 0xdf61843a
    .word 0x209f7bc6
    .word 0xe0e683d6
    .word 0x1f1a7c2a
    .word 0xe26d8377
    .word 0x1d937c89
    .word 0xe3f4831c
    .word 0x1c0c7ce4
    .word 0xe57d82c6
    .word 0x1a837d3a
    .word 0xe7078276
    .word 0x18f97d8a
    .word 0xe892822a
    .word 0x176e7dd6
    .word 0xea1e81e2
    .word 0x15e27e1e
    .word 0xebab81a0
    .word 0x14557e60
    .word 0xed388163
    .word 0x12c87e9d
    .word 0xeec6812a
    .word 0x113a7ed6
    .word 0xf05580f6
    .word 0x0fab7f0a
    .word 0xf1e480c8
    .word 0x0e1c7f38
    .word 0xf374809e
    .word 0x0c8c7f62
    .word 0xf5058079
    .word 0x0afb7f87
    .word 0xf6958059
    .word 0x096b7fa7
    .word 0xf827803e
    .word 0x07d97fc2
    .word 0xf9b88027
    .word 0x06487fd9
    .word 0xfb4a8016
    .word 0x04b67fea
    .word 0xfcdc800a
    .word 0x03247ff6
    .word 0xfe6e8002
    .word 0x01927ffe
    .word 0x00008001
    .word 0x00007fff
    .word 0x01928002
    .word 0xfe6e7ffe
    .word 0x0324800a
    .word 0xfcdc7ff6
    .word 0x04b68016
    .word 0xfb4a7fea
    .word 0x06488027
    .word 0xf9b87fd9
    .word 0x07d9803e
    .word 0xf8277fc2
    .word 0x096b8059
    .word 0xf6957fa7
    .word 0x0afb8079
    .word 0xf5057f87
    .word 0x0c8c809e
    .word 0xf3747f62
    .word 0x0e1c80c8
    .word 0xf1e47f38
    .word 0x0fab80f6
    .word 0xf0557f0a
    .word 0x113a812a
    .word 0xeec67ed6
    .word 0x12c88163
    .word 0xed387e9d
    .word 0x145581a0
    .word 0xebab7e60
    .word 0x15e281e2
    .word 0xea1e7e1e
    .word 0x176e822a
    .word 0xe8927dd6
    .word 0x18f98276
    .word 0xe7077d8a
    .word 0x1a8382c6
    .word 0xe57d7d3a
    .word 0x1c0c831c
    .word 0xe3f47ce4
    .word 0x1d938377
    .word 0xe26d7c89
    .word 0x1f1a83d6
    .word 0xe0e67c2a
    .word 0x209f843a
    .word 0xdf617bc6
    .word 0x222484a3
    .word 0xdddc7b5d
    .word 0x23a78511
    .word 0xdc597aef
    .word 0x25288583
    .word 0xdad87a7d
    .word 0x26a885fa
    .word 0xd9587a06
    .word 0x28278676
    .word 0xd7d9798a
    .word 0x29a486f6
    .word 0xd65c790a
    .word 0x2b1f877b
    .word 0xd4e17885
    .word 0x2c998805
    .word 0xd36777fb
    .word 0x2e118894
    .word 0xd1ef776c
    .word 0x2f878927
    .word 0xd07976d9
    .word 0x30fc89be
    .word 0xcf047642
    .word 0x326e8a5a
    .word 0xcd9275a6
    .word 0x33df8afb
    .word 0xcc217505
    .word 0x354e8ba0
    .word 0xcab27460
    .word 0x36ba8c4a
    .word 0xc94673b6
    .word 0x38258cf8
    .word 0xc7db7308
    .word 0x398d8dab
    .word 0xc6737255
    .word 0x3af38e62
    .word 0xc50d719e
    .word 0x3c578f1d
    .word 0xc3a970e3
    .word 0x3db88fdd
    .word 0xc2487023
    .word 0x3f1790a1
    .word 0xc0e96f5f
    .word 0x40749169
    .word 0xbf8c6e97
    .word 0x41ce9236
    .word 0xbe326dca
    .word 0x43269307
    .word 0xbcda6cf9
    .word 0x447b93dc
    .word 0xbb856c24
    .word 0x45cd94b5
    .word 0xba336b4b
    .word 0x471d9592
    .word 0xb8e36a6e
    .word 0x486a9674
    .word 0xb796698c
    .word 0x49b49759
    .word 0xb64c68a7
    .word 0x4afb9843
    .word 0xb50567bd
    .word 0x4c409930
    .word 0xb3c066d0
    .word 0x4d819a22
    .word 0xb27f65de
    .word 0x4ec09b17
    .word 0xb14064e9
    .word 0x4ffb9c11
    .word 0xb00563ef
    .word 0x51349d0e
    .word 0xaecc62f2
    .word 0x52699e0f
    .word 0xad9761f1
    .word 0x539b9f14
    .word 0xac6560ec
    .word 0x54caa01c
    .word 0xab365fe4
    .word 0x55f6a129
    .word 0xaa0a5ed7
    .word 0x571ea238
    .word 0xa8e25dc8
    .word 0x5843a34c
    .word 0xa7bd5cb4
    .word 0x5964a463
    .word 0xa69c5b9d
    .word 0x5a82a57e
    .word 0xa57e5a82
    .word 0x5b9da69c
    .word 0xa4635964
    .word 0x5cb4a7bd
    .word 0xa34c5843
    .word 0x5dc8a8e2
    .word 0xa238571e
    .word 0x5ed7aa0a
    .word 0xa12955f6
    .word 0x5fe4ab36
    .word 0xa01c54ca
    .word 0x60ecac65
    .word 0x9f14539b
    .word 0x61f1ad97
    .word 0x9e0f5269
    .word 0x62f2aecc
    .word 0x9d0e5134
    .word 0x63efb005
    .word 0x9c114ffb
    .word 0x64e9b140
    .word 0x9b174ec0
    .word 0x65deb27f
    .word 0x9a224d81
    .word 0x66d0b3c0
    .word 0x99304c40
    .word 0x67bdb505
    .word 0x98434afb
    .word 0x68a7b64c
    .word 0x975949b4
    .word 0x698cb796
    .word 0x9674486a
    .word 0x6a6eb8e3
    .word 0x9592471d
    .word 0x6b4bba33
    .word 0x94b545cd
    .word 0x6c24bb85
    .word 0x93dc447b
    .word 0x6cf9bcda
    .word 0x93074326
    .word 0x6dcabe32
    .word 0x923641ce
    .word 0x6e97bf8c
    .word 0x91694074
    .word 0x6f5fc0e9
    .word 0x90a13f17
    .word 0x7023c248
    .word 0x8fdd3db8
    .word 0x70e3c3a9
    .word 0x8f1d3c57
    .word 0x719ec50d
    .word 0x8e623af3
    .word 0x7255c673
    .word 0x8dab398d
    .word 0x7308c7db
    .word 0x8cf83825
    .word 0x73b6c946
    .word 0x8c4a36ba
    .word 0x7460cab2
    .word 0x8ba0354e
    .word 0x7505cc21
    .word 0x8afb33df
    .word 0x75a6cd92
    .word 0x8a5a326e
    .word 0x7642cf04
    .word 0x89be30fc
    .word 0x76d9d079
    .word 0x89272f87
    .word 0x776cd1ef
    .word 0x88942e11
    .word 0x77fbd367
    .word 0x88052c99
    .word 0x7885d4e1
    .word 0x877b2b1f
    .word 0x790ad65c
    .word 0x86f629a4
    .word 0x798ad7d9
    .word 0x86762827
    .word 0x7a06d958
    .word 0x85fa26a8
    .word 0x7a7ddad8
    .word 0x85832528
    .word 0x7aefdc59
    .word 0x851123a7
    .word 0x7b5ddddc
    .word 0x84a32224
    .word 0x7bc6df61
    .word 0x843a209f
    .word 0x7c2ae0e6
    .word 0x83d61f1a
    .word 0x7c89e26d
    .word 0x83771d93
    .word 0x7ce4e3f4
    .word 0x831c1c0c
    .word 0x7d3ae57d
    .word 0x82c61a83
    .word 0x7d8ae707
    .word 0x827618f9
    .word 0x7dd6e892
    .word 0x822a176e
    .word 0x7e1eea1e
    .word 0x81e215e2
    .word 0x7e60ebab
    .word 0x81a01455
    .word 0x7e9ded38
    .word 0x816312c8
    .word 0x7ed6eec6
    .word 0x812a113a
    .word 0x7f0af055
    .word 0x80f60fab
    .word 0x7f38f1e4
    .word 0x80c80e1c
    .word 0x7f62f374
    .word 0x809e0c8c
    .word 0x7f87f505
    .word 0x80790afb
    .word 0x7fa7f695
    .word 0x8059096b
    .word 0x7fc2f827
    .word 0x803e07d9
    .word 0x7fd9f9b8
    .word 0x80270648
    .word 0x7feafb4a
    .word 0x801604b6
    .word 0x7ff6fcdc
    .word 0x800a0324
    .word 0x7ffefe6e
    .word 0x80020192
.Ldata_19902:
    .word 0x7ffe7fff
    .word 0x7fea7ff6
    .word 0x7fc27fd9
    .word 0x7f877fa7
    .word 0x7f387f62
    .word 0x7ed67f0a
    .word 0x7e607e9d
    .word 0x7dd67e1e
    .word 0x7d3a7d8a
    .word 0x7c897ce4
    .word 0x7bc67c2a
    .word 0x7aef7b5d
    .word 0x7a067a7d
    .word 0x790a798a
    .word 0x77fb7885
    .word 0x76d9776c
    .word 0x75a67642
    .word 0x74607505
    .word 0x730873b6
    .word 0x719e7255
    .word 0x702370e3
    .word 0x6e976f5f
    .word 0x6cf96dca
    .word 0x6b4b6c24
    .word 0x698c6a6e
    .word 0x67bd68a7
    .word 0x65de66d0
    .word 0x63ef64e9
    .word 0x61f162f2
    .word 0x5fe460ec
    .word 0x5dc85ed7
    .word 0x5b9d5cb4
    .word 0x59645a82
    .word 0x571e5843
    .word 0x54ca55f6
    .word 0x5269539b
    .word 0x4ffb5134
    .word 0x4d814ec0
    .word 0x4afb4c40
    .word 0x486a49b4
    .word 0x45cd471d
    .word 0x4326447b
    .word 0x407441ce
    .word 0x3db83f17
    .word 0x3af33c57
    .word 0x3825398d
    .word 0x354e36ba
    .word 0x326e33df
    .word 0x2f8730fc
    .word 0x2c992e11
    .word 0x29a42b1f
    .word 0x26a82827
    .word 0x23a72528
    .word 0x209f2224
    .word 0x1d931f1a
    .word 0x1a831c0c
    .word 0x176e18f9
    .word 0x145515e2
    .word 0x113a12c8
    .word 0x0e1c0fab
    .word 0x0afb0c8c
    .word 0x07d9096b
    .word 0x04b60648
    .word 0x01920324
    .word 0xfe6e0000
    .word 0xfb4afcdc
    .word 0xf827f9b8
    .word 0xf505f695
    .word 0xf1e4f374
    .word 0xeec6f055
    .word 0xebabed38
    .word 0xe892ea1e
    .word 0xe57de707
    .word 0xe26de3f4
    .word 0xdf61e0e6
    .word 0xdc59dddc
    .word 0xd958dad8
    .word 0xd65cd7d9
    .word 0xd367d4e1
    .word 0xd079d1ef
    .word 0xcd92cf04
    .word 0xcab2cc21
    .word 0xc7dbc946
    .word 0xc50dc673
    .word 0xc248c3a9
    .word 0xbf8cc0e9
    .word 0xbcdabe32
    .word 0xba33bb85
    .word 0xb796b8e3
    .word 0xb505b64c
    .word 0xb27fb3c0
    .word 0xb005b140
    .word 0xad97aecc
    .word 0xab36ac65
    .word 0xa8e2aa0a
    .word 0xa69ca7bd
    .word 0xa463a57e
    .word 0xa238a34c
    .word 0xa01ca129
    .word 0x9e0f9f14
    .word 0x9c119d0e
    .word 0x9a229b17
    .word 0x98439930
    .word 0x96749759
    .word 0x94b59592
    .word 0x930793dc
    .word 0x91699236
    .word 0x8fdd90a1
    .word 0x8e628f1d
    .word 0x8cf88dab
    .word 0x8ba08c4a
    .word 0x8a5a8afb
    .word 0x892789be
    .word 0x88058894
    .word 0x86f6877b
    .word 0x85fa8676
    .word 0x85118583
    .word 0x843a84a3
    .word 0x837783d6
    .word 0x82c6831c
    .word 0x822a8276
    .word 0x81a081e2
    .word 0x812a8163
    .word 0x80c880f6
    .word 0x8079809e
    .word 0x803e8059
    .word 0x80168027
    .word 0x8002800a
    .word 0x80028001
    .word 0x8016800a
    .word 0x803e8027
    .word 0x80798059
    .word 0x80c8809e
    .word 0x812a80f6
    .word 0x81a08163
    .word 0x822a81e2
    .word 0x82c68276
    .word 0x8377831c
    .word 0x843a83d6
    .word 0x851184a3
    .word 0x85fa8583
    .word 0x86f68676
    .word 0x8805877b
    .word 0x89278894
    .word 0x8a5a89be
    .word 0x8ba08afb
    .word 0x8cf88c4a
    .word 0x8e628dab
    .word 0x8fdd8f1d
    .word 0x916990a1
    .word 0x93079236
    .word 0x94b593dc
    .word 0x96749592
    .word 0x98439759
    .word 0x9a229930
    .word 0x9c119b17
    .word 0x9e0f9d0e
    .word 0xa01c9f14
    .word 0xa238a129
    .word 0xa463a34c
    .word 0xa69ca57e
    .word 0xa8e2a7bd
    .word 0xab36aa0a
    .word 0xad97ac65
    .word 0xb005aecc
    .word 0xb27fb140
    .word 0xb505b3c0
    .word 0xb796b64c
    .word 0xba33b8e3
    .word 0xbcdabb85
    .word 0xbf8cbe32
    .word 0xc248c0e9
    .word 0xc50dc3a9
    .word 0xc7dbc673
    .word 0xcab2c946
    .word 0xcd92cc21
    .word 0xd079cf04
    .word 0xd367d1ef
    .word 0xd65cd4e1
    .word 0xd958d7d9
    .word 0xdc59dad8
    .word 0xdf61dddc
    .word 0xe26de0e6
    .word 0xe57de3f4
    .word 0xe892e707
    .word 0xebabea1e
    .word 0xeec6ed38
    .word 0xf1e4f055
    .word 0xf505f374
    .word 0xf827f695
    .word 0xfb4af9b8
    .word 0xfe6efcdc
    .word 0x01920000
    .word 0x04b60324
    .word 0x07d90648
    .word 0x0afb096b
    .word 0x0e1c0c8c
    .word 0x113a0fab
    .word 0x145512c8
    .word 0x176e15e2
    .word 0x1a8318f9
    .word 0x1d931c0c
    .word 0x209f1f1a
    .word 0x23a72224
    .word 0x26a82528
    .word 0x29a42827
    .word 0x2c992b1f
    .word 0x2f872e11
    .word 0x326e30fc
    .word 0x354e33df
    .word 0x382536ba
    .word 0x3af3398d
    .word 0x3db83c57
    .word 0x40743f17
    .word 0x432641ce
    .word 0x45cd447b
    .word 0x486a471d
    .word 0x4afb49b4
    .word 0x4d814c40
    .word 0x4ffb4ec0
    .word 0x52695134
    .word 0x54ca539b
    .word 0x571e55f6
    .word 0x59645843
    .word 0x5b9d5a82
    .word 0x5dc85cb4
    .word 0x5fe45ed7
    .word 0x61f160ec
    .word 0x63ef62f2
    .word 0x65de64e9
    .word 0x67bd66d0
    .word 0x698c68a7
    .word 0x6b4b6a6e
    .word 0x6cf96c24
    .word 0x6e976dca
    .word 0x70236f5f
    .word 0x719e70e3
    .word 0x73087255
    .word 0x746073b6
    .word 0x75a67505
    .word 0x76d97642
    .word 0x77fb776c
    .word 0x790a7885
    .word 0x7a06798a
    .word 0x7aef7a7d
    .word 0x7bc67b5d
    .word 0x7c897c2a
    .word 0x7d3a7ce4
    .word 0x7dd67d8a
    .word 0x7e607e1e
    .word 0x7ed67e9d
    .word 0x7f387f0a
    .word 0x7f877f62
    .word 0x7fc27fa7
    .word 0x7fea7fd9
    .word 0x7ffe7ff6
    .word 0x00007fff
.Ldata_19903:
    .byte 0x73
    .byte 0xf0
    .byte 0x26
    .byte 0x3f
    .byte 0x92
    .byte 0x92
    .byte 0x83
    .byte 0x7b
    .word 0x4c1c4251
    .word 0x6ba25a82
.Ldata_19908:
    .byte 0x76
    .byte 0xe6
    .byte 0x4b
    .byte 0x71
    .byte 0x3f
    .byte 0x28
    .byte 0x82
    .byte 0x5a
.Ldata_19912:
    .byte 0x62
    .byte 0x57
    .byte 0xcb
    .byte 0x4e
    .byte 0xac
    .byte 0x71
    .byte 0xff
    .byte 0x7a
    .byte 0xb9
    .byte 0x58
    .byte 0x00
    .byte 0x40
.Ldata_19918:
    .byte 0x82
    .byte 0x5a
    .byte 0xac
    .byte 0xa3
    .byte 0x0d
    .byte 0x57
    .byte 0xac
    .byte 0xa3
    .byte 0x4a
    .byte 0x41
    .byte 0x00
    .byte 0xc0
    .word 0x00000000
    .word 0x43f8e92d
    .word 0x000d0004
    .word 0x001f0016
    .word 0x8020f8dd
    .word 0x9024f8dd
    .word 0x0924f8df
    .word 0xf0107b00
    .word 0xb2c00003
    .word 0xd0022800
    .word 0xd0072802
    .word 0xea5fe01d
    .word 0x00390248
    .word 0xf7bf4648
    .word 0xe016fac1
    .word 0x28008838
    .word 0x8838d00a
    .word 0x0000f8a9
    .word 0xd0052c00
    .word 0x00290032
    .word 0x68a30020
    .word 0x4798681b
    .word 0xf1191c6d
    .word 0x1cbf0902
    .word 0x0801f1b8
    .word 0x0f00f1b8
    .word 0xe8bdd1e8
    .word 0xb53883f1
    .word 0x000d0004
    .word 0x08c8f8df
    .word 0x004cf9b0
    .word 0xfa3bf79f
    .word 0x012cf110
    .word 0x2002f9b0
    .word 0xb2921aaa
    .word 0xfb038983
    .word 0xf9b01102
    .word 0xf07f0000
    .word 0xeb110201
    .word 0xfb100144
    .word 0xbd321002
    .word 0x4ff4e92d
    .word 0x46880004
    .word 0x980d001e
    .word 0xf1d1990a
    .word 0x78320b08
    .word 0x3888f8df
    .word 0xfa525cd2
    .word 0x9f0bf901
    .word 0xf8dd990c
    .word 0xf8dfa038
    .word 0x7b122874
    .word 0x0203f012
    .word 0x2a00b2d2
    .word 0x2a02d00c
    .word 0xd368d021
    .word 0x8ff1e8bd
    .word 0x0b08f05f
    .word 0x78301c76
    .word 0x2854f8df
    .word 0x9002f810
    .word 0xd200455f
    .word 0xebb746bb
    .word 0xf019070b
    .word 0xf8310001
    .word 0xf8aa0010
    .word 0xf11a0000
    .word 0xea5f0a02
    .word 0xf1bb0959
    .word 0xf1bb0b01
    .word 0xd1f00f00
    .word 0xd1e12f00
    .word 0x884de7de
    .word 0xf05fe007
    .word 0x1c760b08
    .word 0xf8df7830
    .word 0xf8101814
    .word 0x455f9001
    .word 0x46bbd200
    .word 0x070bebb7
    .word 0xd0212c00
    .word 0xea5fe001
    .word 0xf1b90959
    .word 0xd1040f00
    .word 0x0a4beb1a
    .word 0x0808eb1b
    .word 0xea5fe028
    .word 0xd50770c9
    .word 0x46419a00
    .word 0x68a30020
    .word 0x4798681b
    .word 0x5000f8aa
    .word 0x0801f118
    .word 0x0a02f11a
    .word 0x0b01f1bb
    .word 0x0f00f1bb
    .word 0xe013d1e1
    .word 0x0959ea5f
    .word 0x0f00f1b9
    .word 0xeb1ad102
    .word 0xe00b0a4b
    .word 0x70c9ea5f
    .word 0xf8aad501
    .word 0xf11a5000
    .word 0xf1bb0a02
    .word 0xf1bb0b01
    .word 0xd1eb0f00
    .word 0xd1ba2f00
    .word 0x6a40e796
    .word 0xe0074780
    .word 0x0b08f05f
    .word 0x78311c76
    .word 0x2780f8df
    .word 0x9002f811
    .word 0xd200455f
    .word 0xebb746bb
    .word 0xea5f070b
    .word 0xd50471c9
    .word 0x1000f8ba
    .word 0xf8aa4041
    .word 0xf11a1000
    .word 0xea5f0a02
    .word 0xf1bb0959
    .word 0xf1bb0b01
    .word 0xd1ee0f00
    .word 0xd1df2f00
    .word 0xe92de772
    .word 0x00054ff4
    .word 0x001f000e
    .word 0xf1d0980a
    .word 0x78390404
    .word 0xfa110040
    .word 0xf8ddf800
    .word 0xf8dd902c
    .word 0xf8ddb030
    .word 0xf8dfa034
    .word 0x7b000720
    .word 0x0003f010
    .word 0x2800b2c0
    .word 0x2802d007
    .word 0xd351d025
    .word 0x2404e06d
    .word 0xf8971c7f
    .word 0xb2e48000
    .word 0xda0045a1
    .word 0xb2e4464c
    .word 0x0904ebb9
    .word 0xf888fa5f
    .word 0x10a8ea5f
    .word 0x0010f83b
    .word 0x0000f8aa
    .word 0x0a02f11a
    .word 0x0888ea5f
    .word 0x00041e60
    .word 0x2800b2c0
    .word 0xf1b9d1ee
    .word 0xd1e00f00
    .word 0x2404e04d
    .word 0xf8971c7f
    .word 0xb2e48000
    .word 0xda0045a1
    .word 0xb2e4464c
    .word 0x0904ebb9
    .word 0xea1821c0
    .word 0xd00f0f01
    .word 0xf888fa5f
    .word 0x10a8ea5f
    .word 0x0010f83b
    .word 0x0000f8aa
    .word 0xd0052d00
    .word 0x00319a00
    .word 0x68ab0028
    .word 0x4798681b
    .word 0x0a02f11a
    .word 0xea5f1c76
    .word 0x1e600888
    .word 0xb2c00004
    .word 0xd1e12800
    .word 0x0f00f1b9
    .word 0xe020d1d3
    .word 0x1c7f2404
    .word 0x8000f897
    .word 0x45a1b2e4
    .word 0x464cda00
    .word 0xebb9b2e4
    .word 0x20c00904
    .word 0x0f00ea18
    .word 0xf8bad005
    .word 0xf0900000
    .word 0xf8aa00ff
    .word 0xf11a0000
    .word 0xea5f0a02
    .word 0x1e600888
    .word 0xb2c00004
    .word 0xd1ec2800
    .word 0x0f00f1b9
    .word 0xe8bdd1de
    .word 0xe92d8ff1
    .word 0x00054ff8
    .word 0x46934688
    .word 0x990a469a
    .word 0x0002f1d1
    .word 0x2000f89a
    .word 0xfa12008b
    .word 0xf8ddf403
    .word 0x9e0c902c
    .word 0xf8df9f0d
    .word 0x7b122604
    .word 0x0203f012
    .word 0x2a00b2d2
    .word 0x2a02d004
    .word 0xf0c0d033
    .word 0xe0ae8098
    .word 0xd00b2900
    .word 0x1120b2e4
    .word 0x0010f836
    .word 0x1cbf8038
    .word 0x0901f1b9
    .word 0x0a01f11a
    .word 0x4000f89a
    .word 0x0f02f1b9
    .word 0xea5fdb16
    .word 0xf0190069
    .word 0xb2e40901
    .word 0xf8361121
    .word 0x80391011
    .word 0xf014b2e4
    .word 0xf836010f
    .word 0x80791011
    .word 0xf11a1d3f
    .word 0xf89a0a01
    .word 0x1e404000
    .word 0xd1ec2800
    .word 0x0f00f1b9
    .word 0xb2e4d004
    .word 0xf8361120
    .word 0x80380010
    .word 0x2900e07d
    .word 0x21f0d045
    .word 0xd00c420c
    .word 0x1120b2e4
    .word 0x0010f836
    .word 0x2d008038
    .word 0x465ad005
    .word 0x00284641
    .word 0x681b68ab
    .word 0x1cbf4798
    .word 0x0801f118
    .word 0x0901f1b9
    .word 0x0a01f11a
    .word 0x4000f89a
    .word 0x21f0e02b
    .word 0xd00c420c
    .word 0x1120b2e4
    .word 0x0010f836
    .word 0x2d008038
    .word 0x465ad005
    .word 0x00284641
    .word 0x681b68ab
    .word 0xf0144798
    .word 0x0004000f
    .word 0x2800b2c0
    .word 0xb2e4d00c
    .word 0x0014f836
    .word 0x2d008078
    .word 0x465ad006
    .word 0x0101f118
    .word 0x68ab0028
    .word 0x4798681b
    .word 0xf1181d3f
    .word 0xf1b90802
    .word 0xf11a0902
    .word 0xf89a0a01
    .word 0xf1b94000
    .word 0xdad00f02
    .word 0x0f00f1b9
    .word 0xb2e4d011
    .word 0x00040920
    .word 0x2800b2c0
    .word 0xb2e4d00b
    .word 0x0014f836
    .word 0x2d008038
    .word 0x465ad005
    .word 0x00284641
    .word 0x681b68ab
    .word 0xe01c4798
    .word 0xf11a2002
    .word 0xf89a0a01
    .word 0xb2c04000
    .word 0xda004581
    .word 0xb2c04648
    .word 0x0900ebb9
    .word 0x420c21c0
    .word 0x8839d003
    .word 0x01fff091
    .word 0x1cbf8039
    .word 0x1e400124
    .word 0xb2c90001
    .word 0xd1f12900
    .word 0x0f00f1b9
    .word 0xe8bdd1e2
    .word 0xe92d8ff1
    .word 0x000447f0
    .word 0x0016000d
    .word 0xf8dd001f
    .word 0xf8dd8020
    .word 0xf8dd9024
    .word 0xf8dfa028
    .word 0x7b000470
    .word 0x0003f010
    .word 0x2800b2c0
    .word 0x2802d002
    .word 0xe026d00e
    .word 0xf8397838
    .word 0xf8aa0010
    .word 0xf11a0000
    .word 0x1c7f0a02
    .word 0x0801f1b8
    .word 0x0f00f1b8
    .word 0xe018d1f2
    .word 0x28007838
    .word 0x7838d00c
    .word 0x0010f839
    .word 0x0000f8aa
    .word 0xd0052c00
    .word 0x00290032
    .word 0x68a30020
    .word 0x4798681b
    .word 0xf11a1c6d
    .word 0x1c7f0a02
    .word 0x0801f1b8
    .word 0x0f00f1b8
    .word 0xe8bdd1e6
    .word 0xe92d87f0
    .word 0x000443f8
    .word 0x0016000d
    .word 0xf8dd001f
    .word 0xf8dd8020
    .word 0xf8df9024
    .word 0x7b0003f4
    .word 0x0003f010
    .word 0x2800b2c0
    .word 0x2802d002
    .word 0xe01cd006
    .word 0x00394642
    .word 0xf7bf4648
    .word 0xe016f829
    .word 0x28007838
    .word 0x7838d00a
    .word 0x0000f8a9
    .word 0xd0052c00
    .word 0x00290032
    .word 0x68a30020
    .word 0x4798681b
    .word 0xf1191c6d
    .word 0x1c7f0902
    .word 0x0801f1b8
    .word 0x0f00f1b8
    .word 0xe8bdd1e8
    .byte 0xf1
    .byte 0x83
    .byte 0x2d
    .byte 0xe9
    .word 0xb0884ff8
    .word 0x000d0004
    .word 0xf8df0016
    .word 0xf9b00394
    .word 0xf79e004c
    .word 0x9005ffa0
    .word 0xf9b09805
    .word 0x28000018
    .word 0x9805d006
    .word 0x0018f9b0
    .word 0xff95f79e
    .word 0xe0000007
    .word 0x98052700
    .word 0x900668c0
    .word 0x90159815
    .word 0x19049815
    .word 0xd00b2f00
    .word 0x7b0048d6
    .word 0xd4070780
    .word 0x90009808
    .word 0x002a0033
    .word 0x00380021
    .word 0xfa3ff7bd
    .word 0x00200029
    .word 0xfd35f7ff
    .word 0x98124680
    .word 0x98139012
    .word 0xf8dd9013
    .word 0x98129050
    .word 0xd1182810
    .word 0x0a00f05f
    .word 0xf8cde011
    .word 0x96008004
    .word 0xeb15464b
    .word 0x0021020a
    .word 0xf7ff0038
    .word 0x9813fce9
    .word 0x0909eb10
    .word 0xeb109806
    .word 0xf11a0808
    .word 0x98080a01
    .word 0xdbea4582
    .word 0xf8dde076
    .word 0x9812b058
    .word 0xd1282808
    .word 0x0a00f05f
    .word 0xf8cde011
    .word 0x96008004
    .word 0xeb15464b
    .word 0x0021020a
    .word 0xf7ff0038
    .word 0x9813ff64
    .word 0x0909eb10
    .word 0xeb109806
    .word 0xf11a0808
    .word 0x98080a01
    .word 0xda0f4582
    .word 0x0f00f1bb
    .word 0xf8cdd0e7
    .word 0xf8cd8008
    .word 0x9600b004
    .word 0xeb15464b
    .word 0x0021020a
    .word 0xf7ff0038
    .word 0xe7e4ff0a
    .word 0xf1bbe048
    .word 0xd1010f00
    .word 0xb298f8df
    .word 0x0a00f05f
    .word 0xf8cde015
    .word 0xf8cd800c
    .word 0x9601b008
    .word 0x90009815
    .word 0xeb15464b
    .word 0x0021020a
    .word 0xf7ff0038
    .word 0x9813fe22
    .word 0x0909eb10
    .word 0xeb109806
    .word 0xf11a0808
    .word 0x98080a01
    .word 0xda274582
    .word 0x28019812
    .word 0x2802d004
    .word 0x2804d013
    .word 0xe7ecd0df
    .word 0x8010f8cd
    .word 0x90039805
    .word 0xb008f8cd
    .word 0x98159601
    .word 0x464b9000
    .word 0x020aeb15
    .word 0x00380021
    .word 0xfcc6f7ff
    .word 0xf8cde7db
    .word 0xf8cd800c
    .word 0x9601b008
    .word 0x90009815
    .word 0xeb15464b
    .word 0x0021020a
    .word 0xf7ff0038
    .word 0xe7ccfd62
    .word 0xe8bdb009
    .byte 0xf0
    .byte 0x8f
    .byte 0x2d
    .byte 0xe9
    .word 0x46824ff8
    .word 0x46914688
    .word 0x487d001c
    .word 0x004cf9b0
    .word 0xfed1f79e
    .word 0x46410005
    .word 0xf7ff4650
    .word 0x0007fc88
    .word 0xebb968ee
    .word 0xf110000a
    .word 0xf9b50901
    .word 0x28000018
    .word 0xf9b5d016
    .word 0xf79e0018
    .word 0xebb4febe
    .word 0x1c490108
    .word 0x464b9100
    .word 0x46514642
    .word 0xf977f7bd
    .word 0x464ae008
    .word 0x8841486b
    .word 0xf0000038
    .word 0x19f7f8de
    .word 0x0801f118
    .word 0xdb144544
    .word 0x7b004866
    .word 0xd5f007c0
    .word 0x46bb46ca
    .word 0x47806a68
    .word 0x1000f8bb
    .word 0xf8ab4041
    .word 0xf11b1000
    .word 0xf1ba0b02
    .word 0xf1ba0a01
    .word 0xd1f30f00
    .word 0xe8bde7e5
    .byte 0xf1
    .byte 0x8f
    .byte 0x80
    .byte 0xb5
    .word 0xf7ff000b
    .word 0xbd01ffb2
    .byte 0x2d
    .byte 0xe9
    .byte 0xf8
    .byte 0x4f
    .word 0x468b0004
    .word 0x48560015
    .word 0x004cf9b0
    .word 0xfe83f79e
    .word 0xf9b60006
    .word 0xb23f7018
    .word 0xd0052f00
    .word 0xb2000038
    .word 0xfe79f79e
    .word 0xe0014680
    .word 0x0800f05f
    .word 0x00204659
    .word 0xfc2df7ff
    .word 0xf8d64682
    .word 0x4849900c
    .word 0x07c07b00
    .word 0x6a70d51a
    .word 0x46814780
    .word 0x2f00b23f
    .word 0x465ad006
    .word 0x46400021
    .word 0x3008f8d8
    .word 0x4798681b
    .word 0x0000f8ba
    .word 0x0000ea99
    .word 0x0000f8aa
    .word 0xeb1068f0
    .word 0xf11b0a0a
    .word 0x455d0b01
    .word 0xe020dae8
    .word 0x2f00b23f
    .word 0x465ad011
    .word 0x46400021
    .word 0x3008f8d8
    .word 0x4798681b
    .word 0x88404834
    .word 0x0000f8aa
    .word 0x0a0aeb19
    .word 0x0b01f11b
    .word 0xdaee455d
    .word 0xebb5e00b
    .word 0x1c40000b
    .word 0x8849492d
    .word 0x1000f8aa
    .word 0x0a0aeb19
    .word 0x28001e40
    .word 0xe8bdd1f6
    .byte 0xf1
    .byte 0x8f
    .byte 0xf8
    .byte 0xb5
    .word 0x000d0004
    .word 0x48260016
    .word 0x004cf9b0
    .word 0xfe23f79e
    .word 0x7018f9b0
    .word 0x00200029
    .word 0xfbd9f7ff
    .word 0xb23f8006
    .word 0xd00f2f00
    .word 0xb2000038
    .word 0xfe15f79e
    .word 0x00380006
    .word 0xf79eb200
    .word 0x0003fe10
    .word 0x0021002a
    .word 0x689b0030
    .word 0x4798681b
    .byte 0xf1
    .byte 0xbd
    .byte 0x2d
    .byte 0xe9
    .word 0x000441f0
    .word 0x4814000d
    .word 0x004cf9b0
    .word 0xfdfff79e
    .word 0xf9b70007
    .word 0x00296018
    .word 0xf7ff0020
    .word 0x4680fbb4
    .word 0x47806a78
    .word 0x1000f8b8
    .word 0xf8a84048
    .word 0xb2360000
    .word 0xd00f2e00
    .word 0xb2000030
    .word 0xfde9f79e
    .word 0x00300007
    .word 0xf79eb200
    .word 0x0003fde4
    .word 0x0021002a
    .word 0x689b0038
    .word 0x4798681b
    .word 0x81f0e8bd
    .word 0x2001c598
    .word 0x080960c4
    .word 0x0809b7cc
    .byte 0x80
    .byte 0xb5
    .byte 0xff
    .byte 0xf7
    .word 0x8800fb8e
    .word 0xb410bd02
    .word 0x079b0003
    .word 0x8001d502
    .word 0x1e521c80
    .word 0x2b000853
    .word 0xb289d014
    .word 0x1401f05f
    .word 0xf401fb04
    .word 0xdb072b04
    .word 0x60446004
    .word 0x60c46084
    .word 0x1f1b3010
    .word 0xdaf72b04
    .word 0xd0032b00
    .word 0x1d006004
    .word 0xe7f91e5b
    .word 0xd50007d2
    .word 0xbc108001
    .word 0x00004770
.Lcode_19931:
.global asm_filter_encoder_band_history
.type asm_filter_encoder_band_history, %function
.thumb_func
asm_filter_encoder_band_history:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    sub	sp, #48
    mov	r7, r3
    str	r0, [sp, #44]
    ldr	r0, .Lliteral_20008
    ldr	r5, [sp, #44]
    ldrh	r6, [r0, #0]
    ldrh.w	fp, [r0, #6]
    ldrh.w	ip, [r0, #12]
    ldrh.w	r4, [r5, #78]
    str	r6, [sp, #8]
    ldrh	r5, [r0, #2]
    ldrh	r6, [r0, #8]
    str.w	fp, [sp, #12]
    str.w	ip, [sp, #16]
    ldrh.w	fp, [r0, #14]
    ldrh.w	ip, [r0, #4]
    str	r5, [sp, #20]
    str	r6, [sp, #24]
    ldrh	r5, [r0, #10]
    ldr	r6, [sp, #44]
    ldrh	r0, [r0, #16]
    str.w	fp, [sp, #28]
    str	r0, [sp, #40]
    str.w	ip, [sp, #32]
    str	r5, [sp, #36]
    strh.w	r4, [r6, #80]
    mov	r0, r6
    movs	r3, #0
.Lcode_19960:
    ldrh.w	fp, [r0, #4]
    ldrh	r6, [r1, r3]
    ldr.w	ip, [sp, #12]
    ldrh.w	r9, [r2, r3]
    str.w	fp, [sp, #4]
    ldr.w	fp, [sp, #8]
    ldrh	r4, [r0, #0]
    ldrh.w	r8, [r0, #2]
    smulbb	r5, r6, ip
    adds	r3, #2
    smlabb	r9, r9, fp, r5
    ldr.w	fp, [sp, #16]
    ldrh.w	ip, [r2, r3]
    ldrh.w	sl, [r1, r3]
    adds	r5, r2, r3
    smlabb	r9, r4, fp, r9
    adds	r4, r1, r3
    ldr.w	fp, [sp, #20]
    smlabb	r9, ip, fp, r9
    ldrh.w	ip, [r5, #2]
    ldrh.w	fp, [r4, #2]
    strh.w	r6, [r5, #-2]
    ldr	r5, [sp, #24]
    ldr	r6, [sp, #28]
    smlabb	r9, sl, r5, r9
    ldr	r5, [sp, #32]
    smlabb	r9, r8, r6, r9
    ldr	r6, [sp, #36]
    smlabb	r9, ip, r5, r9
    smlabb	fp, fp, r6, r9
    ldr.w	ip, [sp, #4]
    ldr	r6, [sp, #40]
    ldrh	r5, [r0, #0]
    smlabb	fp, ip, r6, fp
    ubfx	fp, fp, #15, #16
    cmp	r3, #76
    strh.w	r5, [r4, #-2]
    strh.w	r7, [r0], #2
    sxth.w	r7, fp
    bne.n .Lcode_19960
    ldr.w	ip, [sp, #44]
    ldrh.w	r3, [ip, #2]
    strh.w	fp, [ip, #76]
    strh.w	r3, [ip]
    strh.w	fp, [ip, #78]
    add	sp, #48
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
    bx	lr
    .byte 0x00
    .byte 0xbf
.Lliteral_20008:
    .word .Ldata_20719
.Lcode_20009:
.global asm_update_encoder_spectral_callback
.type asm_update_encoder_spectral_callback, %function
.thumb_func
asm_update_encoder_spectral_callback:
    stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub	sp, #244
    ldr.w	lr, [sp, #296]
    ldr	r6, [sp, #280]
    str	r2, [sp, #32]
    add.w	ip, lr, #2
    ldr	r2, [sp, #292]
    ldr	r4, [sp, #288]
    str	r0, [sp, #40]
    add.w	r7, lr, #1
    add.w	r5, lr, #3
    rsb	lr, r2, lr
    ldrsh.w	r2, [r6, ip, lsl #1]
    ldrsh.w	r5, [r6, r5, lsl #1]
    ldrh.w	r6, [r6, r7, lsl #1]
    ldr.w	ip, [sp, #32]
    str	r1, [sp, #20]
    movs	r7, #15
    add.w	lr, lr, #2
    lsls	r2, r7
    lsl.w	lr, r7, lr
    ldrsh.w	r7, [sp, #300]
    ldr.w	sl, [ip, #8]
    str	r3, [sp, #48]
    add.w	r5, r2, r5, lsl #15
    mov.w	lr, lr, asr #2
    asrs	r5, r5, #16
    bic.w	r7, r7, r7, asr #31
    cmp.w	r7, #16384
    it	ge
    movge.w	r7, #16384
    str	r5, [sp, #44]
    ands.w	r5, lr, r0
    str.w	lr, [sp, #36]
    and.w	sl, sl, #1431655765
    str	r7, [sp, #28]
    str	r5, [sp, #52]
    bne.w .Lcode_20597
    lsls	r6, r6, #16
    add.w	r2, r2, r6, asr #1
    cmp.w	r2, #4160749568
    ite	ge
    movge.w	fp, #0
    movlt.w	fp, #1
.Lcode_20054:
    ldr	r6, [sp, #292]
    lsls	r5, r6, #2
    adds	r3, r4, r5
    ldrsh.w	ip, [r4, r6, lsl #2]
    ldrsh.w	r9, [r3, #2]
    ldr	r3, [sp, #284]
    rsb	r8, r9, ip
    adds	r5, r5, r6
    cmp.w	r8, #0
    add.w	r5, r3, r5, lsl #5
    ble.w .Lcode_20654
    rsb	r9, ip, r9
    add.w	r9, r9, #15
    mov.w	r8, #15
.Lcode_20068:
    add.w	ip, ip, #1
    movs	r3, #0
    add.w	lr, r5, #80
    add	r7, sp, #144
.Lcode_20072:
    ldrsh	r1, [r5, r3]
    ldrsh.w	r2, [lr, r3]
    lsl.w	r1, r1, r8
    lsl.w	r2, r2, r9
    cmp	r1, #0
    it	lt
    neglt	r1, r1
    cmp	r2, #0
    it	lt
    neglt	r2, r2
    adds	r2, r1, r2
    mov	r1, r2
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    sxth	r1, r1
    lsls	r2, r1
    asrs	r2, r2, #16
    lsls	r2, r2, #14
    mov	r0, r2
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    uxth	r0, r0
    sxth	r4, r0
    rsb	r1, r1, ip
    rsb	r0, r0, #1
    adds	r0, r0, r1
    lsls	r2, r4
    strh	r0, [r7, r3]
    add	r0, sp, #60
    asrs	r2, r2, #16
    strh	r2, [r0, r3]
    adds	r3, #2
    cmp	r3, #80
    bne.n .Lcode_20072
    ldr	r5, [sp, #20]
    cmp.w	fp, #0
    beq.w .Lcode_20553
    movs	r4, #0
    add.w	r9, sp, #228
    mov	sl, r5
.Lcode_20120:
    add.w	r8, sl, r4
    ldrh	r1, [r7, r4]
    ldrsh.w	r2, [r8, #2]
    ldrsh.w	r3, [r5, #82]
    add	r6, sp, #60
    subs	r1, #2
    add.w	r2, r2, r2, lsl #1
    ldrsh	r0, [r6, r4]
    str.w	r9, [sp]
    sxth	r1, r1
    sbfx	r2, r2, #2, #16
    bl .Lcode_6611
    ldr	r3, [sp, #228]
    strh.w	r0, [r8, #2]
    adds	r4, #2
    strh.w	r3, [r5, #82]
    adds	r5, #2
    cmp	r4, #80
    bne.n .Lcode_20120
.Lcode_20139:
    ldr	r6, [sp, #20]
    ldr	r5, [sp, #32]
    ldr.w	sl, .Lliteral_20540
    ldr.w	r8, [r5, #8]
    movs	r4, #0
    add.w	ip, r6, #82
    add.w	fp, r6, #2
    str.w	ip, [sp, #16]
    add.w	r9, sp, #60
    mov	r5, r4
    b.n .Lcode_20154
.Lcode_20150:
    strh.w	r2, [r9], #2
.Lcode_20151:
    adds	r4, #2
    cmp	r4, #80
    beq.n .Lcode_20229
.Lcode_20154:
    add.w	lr, sp, #60
    cmp	r5, #39
    ldrh.w	r1, [lr, r4]
    ldrsh	r3, [r7, r4]
    ldrh.w	r0, [sl, r4]
    sxth	r2, r1
    ble.n .Lcode_20163
    subs	r5, #40
    mov.w	r8, r8, asr #2
.Lcode_20163:
    adds	r5, #16
    tst.w	r8, #1
    bne.n .Lcode_20193
    lsls	r2, r0, #16
    asrs	r2, r2, #1
    add.w	r2, r2, #536870912
    mov	lr, r2
    cmp.w	lr, #0
    it	lt
    mvnlt.w	lr, lr
    itt	ne
    clzne	lr, lr
    subne.w	lr, lr, #1
    sxth.w	lr, lr
    lsl.w	r2, r2, lr
    smultb	r2, r2, r1
    lsls	r2, r2, #1
    mov	r0, r2
    rsb	lr, lr, #1
    cmp	r0, #0
    it	lt
    mvnlt	r0, r0
    itt	ne
    clzne	r0, r0
    subne	r0, #1
    sxth	r0, r0
    add	r3, lr
    lsls	r2, r0
    subs	r3, r3, r0
    asrs	r2, r2, #16
.Lcode_20193:
    ldrsh.w	r0, [fp, r4]
    ldr	r6, [sp, #16]
    lsls	r2, r2, #16
    lsls	r0, r0, #16
    mov	lr, r2
    cmp.w	lr, #0
    it	lt
    mvnlt.w	lr, lr
    itt	ne
    clzne	lr, lr
    subne.w	lr, lr, #1
    sxth.w	lr, lr
    mov	ip, r0
    cmp.w	ip, #0
    it	lt
    mvnlt.w	ip, ip
    itt	ne
    clzne	ip, ip
    subne.w	ip, ip, #1
    lsls.w	r2, r2, lr
    ldrh	r1, [r6, r4]
    beq.n .Lcode_20150
    sxth.w	ip, ip
    sxth	r1, r1
    rsb	r1, ip, r1
    rsb	r3, lr, r3
    cmp	r1, r3
    lsl.w	r0, r0, ip
    ble.w .Lcode_20515
    cmp	r0, #0
    beq.w .Lcode_20515
.Lcode_20224:
    adds	r4, #2
    movs	r3, #0
    cmp	r4, #80
    strh.w	r3, [r9], #2
    bne.n .Lcode_20154
.Lcode_20229:
    ldr	r4, [sp, #20]
    ldr	r3, [sp, #28]
    add.w	r1, r4, #162
    add.w	r2, r4, #242
    add	r0, sp, #60
    bl .Lcode_19931
    ldr	r6, [sp, #44]
    lsls	r5, r6, #16
    cmp.w	r5, #2147483648
    beq.w .Lcode_20652
    negs	r5, r5
    lsls	r3, r5, #2
    cmp.w	r5, r3, asr #2
    itt	ne
    mvnne.w	r3, #2147483648
    eorne.w	r3, r3, r5, asr #31
    lsrs	r3, r3, #16
.Lcode_20246:
    sxth	r3, r3
    ldr	r4, [sp, #52]
    cmp.w	r3, #16384
    ite	le
    bicle.w	r3, r3, r3, asr #31
    movgt.w	r3, #16384
    cmp	r4, #0
    bne.w .Lcode_20543
    ldr	r5, [sp, #20]
    ldrh	r1, [r5, #0]
    movw	r2, #31430
    smulbb	r2, r1, r2
    ubfx	r2, r2, #15, #16
.Lcode_20259:
    ldr	r6, [sp, #28]
    sxth	r2, r2
    cmp	r6, r2
    blt.n .Lcode_20268
    asrs	r1, r6, #1
    cmp	r2, r1
    it	lt
    movlt	r2, r1
    str	r2, [sp, #28]
.Lcode_20268:
    ldr.w	ip, [sp, #28]
    ldr	r4, [sp, #20]
    ldr	r5, [sp, #292]
    strh.w	ip, [r4]
    cmp	r5, #0
    bne.w .Lcode_20541
    ldr	r6, [sp, #32]
    ldr	r1, .Lliteral_20540
    ldr	r6, [r6, #8]
    ldrsh.w	r0, [sp, #60]
    str	r6, [sp, #16]
    mov.w	r8, r3, lsl #16
    ldr.w	lr, [sp, #16]
    ldrsh.w	r6, [sl]
    ldr.w	r9, [sp, #28]
    rsb	r8, r8, #1073741824
    mov.w	r8, r8, asr #16
    add.w	r2, sp, #58
    add.w	ip, r1, #78
    mov	r4, r5
    and.w	r7, lr, #1
.Lcode_20289:
    mul.w	r6, r6, r9
    cbnz	r7, .Lcode_20314
.Lcode_20291:
    cmp.w	r0, #16384
    sbfx	r6, r6, #14, #16
    bgt.n .Lcode_20317
.Lcode_20294:
    cmp	r6, r0
    it	ge
    movge	r0, r6
    mul.w	r6, r6, r3
    mla	r0, r8, r0, r6
    sbfx	r0, r0, #14, #16
    cmp	r1, ip
    add.w	r5, r4, #16
    strh.w	r0, [r2, #2]!
    beq.n .Lcode_20325
.Lcode_20304:
    cmp	r5, #39
    ldrsh.w	r6, [r1, #2]!
    ldrsh.w	r0, [r2, #2]
    ble.w .Lcode_20538
    mov.w	lr, lr, asr #2
    and.w	r7, lr, #1
    subs	r4, #24
    mul.w	r6, r6, r9
    cmp	r7, #0
    beq.n .Lcode_20291
.Lcode_20314:
    cmp.w	r0, #16384
    mov	r6, r9
    ble.n .Lcode_20294
.Lcode_20317:
    mov.w	r0, #16384
    mul.w	r6, r6, r3
    mla	r0, r8, r0, r6
    sbfx	r0, r0, #14, #16
    cmp	r1, ip
    add.w	r5, r4, #16
    strh.w	r0, [r2, #2]!
    bne.n .Lcode_20304
.Lcode_20325:
    ldr.w	ip, [sp, #48]
    ldr	r4, [sp, #32]
    ldrsh.w	r3, [ip, #318]
    ldrh	r6, [r4, #4]
    ldrh	r7, [r4, #12]
    ldrh.w	r2, [ip, #316]
    add.w	r9, sp, #240
    mov	r8, r6
    str.w	r3, [r9, #-12]!
    mov	r4, ip
    movs	r5, #8
    mov	r6, r9
    b.n .Lcode_20339
.Lcode_20338:
    ldr	r3, [sp, #228]
.Lcode_20339:
    ldrsh.w	r0, [r4, #336]
    ldrsh.w	r1, [r4, #368]
    str	r6, [sp, #0]
    sxth	r2, r2
    bl .Lcode_6664
    adds	r5, #1
    adds	r4, #2
    cmp	r5, #16
    uxth	r2, r0
    bne.n .Lcode_20338
    sxth	r0, r2
    cmp	r0, #0
    mov	r6, r8
    ble.w .Lcode_20599
    ldr	r1, [sp, #228]
    adds	r1, #30
    bl .Lcode_6814
    mov	r3, r0
    cmp	r3, #0
    it	lt
    mvnlt	r3, r3
    itt	ne
    clzne	r3, r3
    subne	r3, #1
    sxth	r3, r3
    rsb	r2, r3, #15
    lsls.w	r3, r0, r3
    lsrs	r3, r3, #16
    str	r2, [sp, #228]
    str	r3, [sp, #44]
.Lcode_20369:
    sxth	r6, r6
    cmp	r6, #0
    ble.w .Lcode_20541
    sxth	r7, r7
    lsls	r6, r6, #1
    add.w	r3, r7, r7, lsl #2
    movw	ip, #32767
    str	r6, [sp, #28]
    movw	r6, #32767
    mov.w	fp, r3, lsl #1
    lsls	r7, r7, #2
    movt	ip, #3
    movt	r6, #7
    str.w	fp, [sp, #24]
    sub.w	r4, fp, #32768
    ldr	r5, [sp, #32]
    str	r7, [sp, #20]
    mov	sl, fp
    str.w	fp, [sp, #32]
    mov.w	r8, #0
    str.w	ip, [sp, #36]
    str	r6, [sp, #40]
    ldr.w	fp, [sp, #48]
    b.n .Lcode_20485
.Lcode_20393:
    mov.w	r6, #32768
    movt	r6, #65535
.Lcode_20395:
    mov.w	r9, r9, asr #15
    ldr.w	ip, [sp, #16]
    bic.w	r9, r9, #3
    asr.w	r9, ip, r9
    tst.w	r9, #1
    beq.n .Lcode_20405
    ldr.w	ip, [sp, #36]
    cmp	r4, ip
    bgt.w .Lcode_20607
    sbfx	r6, r6, #1, #15
.Lcode_20405:
    ldrsh.w	r3, [fp, #384]
    cmp	r3, #0
    beq.n .Lcode_20463
    cmp.w	r4, #1277952
    ble.n .Lcode_20463
    asrs	r0, r7, #16
    cmp	r0, #14
    ble.w .Lcode_20617
    ldrh.w	r0, [fp, #112]
    ldrsh.w	r3, [fp, #144]
    sxth	r0, r0
    cmp	r0, #0
    str	r3, [sp, #232]
    ble.w .Lcode_20647
.Lcode_20419:
    ldr	r1, [sp, #232]
    adds	r1, #30
.Lcode_20421:
    bl .Lcode_6814
    ldr.w	ip, [sp, #44]
    ldr	r3, [sp, #228]
    mov	lr, r0
    cmp.w	lr, #0
    it	lt
    mvnlt.w	lr, lr
    itt	ne
    clzne	lr, lr
    subne.w	lr, lr, #1
    sxth.w	lr, lr
    lsl.w	r0, r0, lr
    rsb	lr, lr, #15
    sxth.w	r2, ip
    mov	r1, lr
    asrs	r0, r0, #16
    add.w	r9, sp, #236
    str.w	lr, [sp, #232]
    str.w	r9, [sp]
    bl .Lcode_6664
    movs	r1, #2
    sxth	r2, r0
    ldr	r3, [sp, #236]
    str.w	r9, [sp]
    mov.w	r0, #8192
    bl .Lcode_6664
    ldr	r3, [sp, #236]
    lsls	r0, r0, #16
    cmp	r3, #14
    ble.w .Lcode_20614
    subs	r3, #15
    lsls.w	r3, r0, r3
.Lcode_20453:
    sub.w	r2, r3, r7, asr #3
    asrs	r2, r2, #1
    movs	r3, #0
    and.w	r2, r2, r2, asr #31
    movt	r3, #65533
    cmp	r2, r3
    it	ge
    movge	r3, r2
    add.w	r6, r3, r6, lsl #5
    sbfx	r6, r6, #5, #16
.Lcode_20463:
    ldrsh.w	r2, [r5, #16]
    ldr.w	ip, [sp, #20]
    mov.w	r3, #34816
    lsls	r2, r2, #16
    lsls	r6, r6, #16
    movt	r3, #65535
    qadd	r6, r6, r2
    asrs	r6, r6, #16
    cmp	r6, r3
    it	lt
    movlt	r6, r3
    strh	r6, [r5, #16]
    ldr	r6, [sp, #32]
    add	r7, ip
    ldr.w	ip, [sp, #28]
    add.w	r8, r8, #2
    adds	r4, r4, r6
    ldr	r6, [sp, #24]
    adds	r5, #2
    cmp	r8, ip
    add	sl, r6
    beq.n .Lcode_20541
.Lcode_20485:
    asrs	r3, r4, #16
    add.w	ip, sp, #240
    add.w	r2, ip, r3, lsl #1
    mov	r3, r2
    ldrsh.w	r2, [r2, #-180]
    ldrsh.w	r3, [r3, #-178]
    lsls	r2, r2, #16
    rsb	r3, r2, r3, lsl #16
    asrs	r3, r3, #16
    uxth	r1, r4
    mla	r3, r3, r1, r2
    mov	r1, r3
    cmp	r1, #0
    it	lt
    mvnlt	r1, r1
    itt	ne
    clzne	r1, r1
    subne	r1, #1
    uxth	r1, r1
    sxth	r0, r1
    lsls.w	r0, r3, r0
    add.w	r9, r7, #32768
    beq.w .Lcode_20393
    rsb	r1, r1, #1
    asrs	r0, r0, #16
    sxth	r1, r1
    movs	r2, #4
    bl .Lcode_6854
    mov	r6, r0
    b.n .Lcode_20395
.Lcode_20515:
    cmp	r1, r3
    bne.n .Lcode_20519
    cmp	r0, r2
    bge.w .Lcode_20224
.Lcode_20519:
    asrs	r2, r2, #16
    add	r6, sp, #228
    str	r6, [sp, #0]
    bl .Lcode_6721
    ldr	r3, [sp, #228]
    lsls	r0, r0, #16
    cmp	r3, #0
    blt.n .Lcode_20535
    lsls.w	r3, r0, r3
.Lcode_20528:
    movw	lr, #43418
    mov.w	ip, #2147483648
    qadd	r3, ip, r3
    smultb	r3, r3, lr
    sbfx	r3, r3, #15, #16
    strh.w	r3, [r9], #2
    b.n .Lcode_20151
.Lcode_20535:
    negs	r3, r3
    asrs.w	r3, r0, r3
    b.n .Lcode_20528
.Lcode_20538:
    mov	r4, r5
    b.n .Lcode_20289
    .byte 0x00
    .byte 0xbf
.Lliteral_20540:
    .word .Ldata_20728
.Lcode_20541:
    add	sp, #244
    ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.Lcode_20543:
    ldr	r6, [sp, #40]
    ldr.w	ip, [sp, #36]
    ands.w	r6, r6, ip, asr #1
    beq.n .Lcode_20604
    ldr	r5, [sp, #20]
    ldrh	r1, [r5, #0]
    movw	r2, #17111
    smulbb	r2, r1, r2
    ubfx	r2, r2, #14, #16
    b.n .Lcode_20259
.Lcode_20553:
    mov	r4, fp
    mov	r6, sl
    movw	fp, #26214
    mov	sl, r5
    b.n .Lcode_20562
.Lcode_20558:
    adds	r4, #2
    adds	r5, #2
    cmp	r4, #80
    beq.w .Lcode_20139
.Lcode_20562:
    add.w	ip, sp, #60
    ldrh.w	r9, [r7, r4]
    ldrsh.w	r2, [ip, r4]
    ldrsh.w	r1, [r5, #82]
    add.w	r2, r2, r2, lsl #2
    add.w	r8, sl, r4
    add.w	r2, r2, r2, lsl #4
    add.w	r2, r2, r2, lsl #8
    add.w	r3, r9, #4294967295
    ldrsh.w	r0, [r8, #2]
    sbfx	r2, r2, #15, #16
    sxth	r3, r3
    bl .Lcode_6768
    cmp	r0, #0
    beq.n .Lcode_20558
    cmp	r6, #0
    bne.n .Lcode_20558
    add.w	lr, sp, #60
    ldrh.w	r2, [r8, #2]
    ldrh.w	r0, [lr, r4]
    ldrsh.w	r3, [r5, #82]
    movw	ip, #29491
    add	r1, sp, #228
    smulbb	r2, r2, ip
    smulbb	r0, r0, fp
    sub.w	r9, r9, #3
    str	r1, [sp, #0]
    asrs	r0, r0, #15
    sxth.w	r1, r9
    asrs	r2, r2, #15
    bl .Lcode_6611
    ldr	r3, [sp, #228]
    strh.w	r0, [r8, #2]
    strh.w	r3, [r5, #82]
    b.n .Lcode_20558
.Lcode_20597:
    mov.w	fp, #0
    b.n .Lcode_20054
.Lcode_20599:
    movs	r3, #5
    mov.w	r5, #55296
    str	r3, [sp, #228]
    str	r5, [sp, #44]
    b.n .Lcode_20369
.Lcode_20604:
    ldr	r4, [sp, #20]
    ldrh	r2, [r4, #0]
    b.n .Lcode_20259
.Lcode_20607:
    ldr.w	ip, [sp, #40]
    cmp	r4, ip
    bgt.w .Lcode_20405
    sbfx	r3, sl, #4, #16
    mul.w	r6, r6, r3
    sbfx	r6, r6, #15, #16
    b.n .Lcode_20405
.Lcode_20614:
    rsb	r3, r3, #15
    asrs.w	r3, r0, r3
    b.n .Lcode_20453
.Lcode_20617:
    add.w	ip, r0, #160
    add.w	lr, r0, #176
    str.w	lr, [sp, #48]
    add.w	r3, r0, #161
    ldrsh.w	lr, [fp, ip, lsl #1]
    ldr	r2, [sp, #48]
    adds	r0, #177
    ldrsh.w	r1, [fp, r2, lsl #1]
    ldrsh.w	r2, [fp, r3, lsl #1]
    ldrsh.w	r3, [fp, r0, lsl #1]
    str.w	ip, [sp, #12]
    add.w	r9, sp, #232
    mov	r0, lr
    str.w	r9, [sp]
    bl .Lcode_6664
    ldr.w	ip, [sp, #12]
    ldr	r1, [sp, #232]
    ldrsh.w	r2, [fp, ip, lsl #1]
    ldr.w	ip, [sp, #48]
    uxth	r3, r7
    sxth	r0, r0
    mul.w	r0, r0, r3
    asrs	r0, r0, #16
    ldrsh.w	r3, [fp, ip, lsl #1]
    str.w	r9, [sp]
    bl .Lcode_6611
    uxth	r0, r0
    sxth	r0, r0
    cmp	r0, #0
    bgt.w .Lcode_20419
.Lcode_20647:
    mvn.w	r3, #42
    str	r3, [sp, #232]
    mvn.w	r1, #12
    movw	r0, #26772
    b.n .Lcode_20421
.Lcode_20652:
    movw	r3, #32767
    b.n .Lcode_20246
.Lcode_20654:
    mov	ip, r9
    add.w	r8, r8, #15
    mov.w	r9, #15
    b.n .Lcode_20068
    .word 0x0004b570
    .word 0x00202600
    .word 0xf994f7cc
    .word 0xd05e2800
    .word 0xf7cc0020
    .word 0x0005f999
    .word 0xd1012d00
    .word 0xe0572000
    .word 0x40c0f3c5
    .word 0xd50307c0
    .word 0xf0000020
    .word 0x4306f934
    .word 0x4080f3c5
    .word 0xd50307c0
    .word 0xf0000020
    .word 0x4306f8b2
    .word 0x0040f3c5
    .word 0xd50407c0
    .word 0xf0502000
    .word 0x68e10002
    .word 0x2d006148
    .word 0x0020d503
    .word 0xf83bf000
    .word 0xf3c54306
    .word 0x07c020c0
    .word 0x0020d503
    .word 0xf857f000
    .word 0xf3c54306
    .word 0x07c000c0
    .word 0x0020d503
    .word 0xf972f000
    .word 0xf3c54306
    .word 0x07c01000
    .word 0x0020d503
    .word 0xf978f000
    .word 0xf3c54306
    .word 0x07c03000
    .word 0x0020d503
    .word 0xfa03f000
    .word 0xf3c54306
    .word 0x07c03040
    .word 0x0020d503
    .word 0xfa58f000
    .word 0xf3c54306
    .word 0x07c05000
    .word 0x0020d503
    .word 0xfa75f000
    .word 0xf3c54306
    .word 0x07c05040
    .word 0x0020d503
    .word 0xfa7bf000
    .word 0x00304306
    .word 0xb510bd70
    .word 0x7aa00004
    .word 0xd0082800
    .word 0x010cf8d4
    .word 0x0002f030
    .word 0x00400840
    .word 0x110cf8d4
    .word 0x20006008
    .word 0x0001f050
    .word 0x68496921
    .word 0x0000ea31
    .word 0x60486921
    .word 0xf8df0020
    .word 0x680914dc
    .word 0x47886989
    .word 0xf0502000
    .word 0x68e14000
    .word 0x20016148
    .word 0xb510bd10
    .word 0x0004b082
    .word 0xf88d2000
    .word 0xf8940000
    .word 0xf88d0112
    .word 0x00200000
    .word 0x14acf8df
    .word 0x69496809
    .word 0x69204788
    .word 0x20006881
    .word 0x6000f450
    .word 0x615068e2
    .word 0x28007aa0
    .word 0xf011d027
    .word 0xb2c00001
    .word 0xd0222800
    .word 0x0115f894
    .word 0xd11e2801
    .word 0x0000f89d
    .word 0xd11a2803
    .word 0xf0502000
    .word 0xf8d40001
    .word 0x6809110c
    .word 0xf8d44301
    .word 0x6011210c
    .word 0x0002f050
    .word 0x110cf8d4
    .word 0x43086809
    .word 0x110cf8d4
    .word 0xf8df6008
    .word 0x68000454
    .word 0x0006f050
    .word 0x1448f8df
    .word 0x20016008
    .word 0xb5f8bd16
    .word 0x25000004
    .word 0x00202700
    .word 0xfbcaf7cc
    .word 0xe06c0006
    .word 0xd56807f0
    .word 0xb2c90029
    .word 0xf0000020
    .word 0x0007fa13
    .word 0x0001f017
    .word 0x2800b2c0
    .word 0x2001d022
    .word 0x692140a8
    .word 0xea316b49
    .word 0x69210000
    .word 0x27006348
    .word 0x0701f057
    .word 0x0085eb14
    .word 0x60876980
    .word 0xb2c90029
    .word 0xf8df0020
    .word 0x681223ec
    .word 0x47906852
    .word 0x280178e0
    .word 0x2d00d108
    .word 0xf894d106
    .word 0x28040111
    .word 0x0020d102
    .word 0xfb9ff7cc
    .word 0x00c0f3c7
    .word 0xd50607c0
    .word 0xf0572700
    .word 0xeb140708
    .word 0x69800085
    .word 0xf3c76087
    .word 0x07c01000
    .word 0x2700d506
    .word 0x0710f057
    .word 0x0085eb14
    .word 0x60876980
    .word 0x1080f3c7
    .word 0xd50607c0
    .word 0xf0572700
    .word 0xeb140740
    .word 0x69800085
    .word 0xf3c76087
    .word 0x07c00040
    .word 0x2700d506
    .word 0x0702f057
    .word 0x0085eb14
    .word 0x60876980
    .word 0x10c0f3c7
    .word 0xd50a07c0
    .word 0x00200029
    .word 0xf8cff000
    .word 0xf0572700
    .word 0xeb140780
    .word 0x69800085
    .word 0x1c6d6087
    .word 0x2e000876
    .word 0x2001d190
    .word 0xb5f8bdf2
    .word 0x25000004
    .word 0x00202700
    .word 0xfb3ff7cc
    .word 0xe0570006
    .word 0xd55307f0
    .word 0xb2c90029
    .word 0xf7cc0020
    .word 0x0007fb3d
    .word 0x0001f017
    .word 0x2800b2c0
    .word 0x2700d02d
    .word 0x0701f057
    .word 0x0085eb14
    .word 0x60876d40
    .word 0x280178e0
    .word 0xeb14d110
    .word 0x6d400085
    .word 0x21286900
    .word 0x4105fb01
    .word 0x137cf8d1
    .word 0x0b400340
    .word 0x21281a08
    .word 0x4105fb01
    .word 0x038cf8c1
    .word 0xb2c90029
    .word 0x4ab80020
    .word 0x68126812
    .word 0x78e04790
    .word 0xd1082801
    .word 0xd1062d00
    .word 0x0111f894
    .word 0xd1022805
    .word 0xf7cc0020
    .word 0xf3c7fb1a
    .word 0x07c00040
    .word 0x2700d506
    .word 0x0702f057
    .word 0x0085eb14
    .word 0x60876d40
    .word 0x00c0f3c7
    .word 0xd50b07c0
    .word 0x49a80020
    .word 0x68896809
    .word 0x27004788
    .word 0x0708f057
    .word 0x0085eb14
    .word 0x60876d40
    .word 0x08761c6d
    .word 0xd1a52e00
    .word 0xbdf22001
    .word 0x0004b510
    .word 0x499e0020
    .word 0x68c96809
    .word 0x20004788
    .word 0x0008f050
    .word 0x614868e1
    .word 0xbd102001
    .word 0x0004b5f8
    .word 0xf0552500
    .word 0x68e00510
    .word 0x43a86980
    .word 0x618868e1
    .word 0x6a0668e0
    .word 0x000ff016
    .word 0xfb012128
    .word 0xf5104000
    .word 0x0c70775d
    .word 0x000ff010
    .word 0xd0082801
    .word 0xd0072802
    .word 0xd01d2803
    .word 0xd01c2804
    .word 0xd01b2806
    .word 0xe025e026
    .word 0x05400930
    .word 0xb2800d40
    .word 0xd0102800
    .word 0x120af3c6
    .word 0x68f9b292
    .word 0xf7cb0020
    .word 0xf3c6fe50
    .word 0x68f9100a
    .word 0x60f81840
    .word 0xf3c669b8
    .word 0x1808110a
    .word 0xe00d61b8
    .word 0xe00be00c
    .word 0xf2042208
    .word 0x002051cc
    .word 0xfe3df7cb
    .word 0xf3c669b8
    .word 0x1808110a
    .word 0xe7ff61b8
    .word 0x698068e0
    .word 0x68e14328
    .word 0x20016188
    .word 0xe92dbdf2
    .word 0x000441f0
    .word 0x2600000d
    .word 0x21282000
    .word 0x4105fb01
    .word 0x778ef511
    .word 0x69ba6979
    .word 0x000e1a89
    .word 0x42b168b9
    .word 0x68bed200
    .word 0xea5f1cf0
    .word 0xeb140890
    .word 0x69800085
    .word 0xe01b6980
    .word 0x69b96978
    .word 0x68b81a46
    .word 0xd20042b0
    .word 0x1cf068be
    .word 0x0890ea5f
    .word 0xb29b0033
    .word 0xb2d2002a
    .word 0x002068f9
    .word 0xfde3f7cb
    .word 0x183068f8
    .word 0x69b860f8
    .word 0x61b81830
    .word 0x0085eb14
    .word 0x69806980
    .word 0x4580b280
    .word 0x69b8d206
    .word 0x42886979
    .word 0x6978d202
    .word 0xd1d92800
    .word 0xe8bd2001
    .word 0xe92d81f0
    .word 0x000443f8
    .word 0x25002000
    .word 0x27002600
    .word 0x0800f05f
    .word 0x0900f05f
    .word 0x0001f050
    .word 0x68496921
    .word 0x0000ea31
    .word 0x60486921
    .word 0x00202100
    .word 0xfecbf7cb
    .word 0xe00a2000
    .word 0x0180eb14
    .word 0x22ff6989
    .word 0xeb14608a
    .word 0x6d490180
    .word 0x608a22ff
    .word 0x78611c40
    .word 0xd3f14288
    .word 0xf05f6920
    .word 0x618131ff
    .word 0xf3602001
    .word 0x2001050f
    .word 0x451ff360
    .word 0x61c56920
    .word 0x0608f056
    .word 0x0601f056
    .word 0x0602f056
    .word 0x61466920
    .word 0x0701f057
    .word 0x0708f057
    .word 0x0702f057
    .word 0x61076920
    .word 0xf8d06920
    .word 0xf4388000
    .word 0x692068fe
    .word 0x8000f8c0
    .word 0xf7cc0020
    .word 0xf05ffa0a
    .word 0xf4590900
    .word 0x68e05980
    .word 0x9014f8c0
    .word 0x49240020
    .word 0x69096809
    .word 0x20014788
    .word 0x83f2e8bd
    .word 0x0004b538
    .word 0xf7cb0020
    .word 0x68e0fffc
    .word 0x002068c5
    .word 0xffe1f7cb
    .word 0xd1082803
    .word 0x70a02000
    .word 0x7000f44f
    .word 0x200980a0
    .word 0x258df360
    .word 0x2001e006
    .word 0x204070a0
    .word 0x200580a0
    .word 0x258df360
    .word 0x60c568e0
    .word 0xf4502000
    .word 0x68e15000
    .word 0x20016148
    .word 0xb538bd32
    .word 0x25000004
    .word 0x490c0020
    .word 0x69c96809
    .word 0xf4554788
    .word 0x68e01580
    .word 0x20016145
    .word 0xb538bd32
    .word 0x25000004
    .word 0x49050020
    .word 0x6a096809
    .word 0xf4554788
    .word 0x68e01500
    .word 0x20016145
    .word 0x0000bd32
    .word 0x20001124
    .word 0xe000ed10
    .word 0x69126902
    .word 0x6b5b6903
    .word 0xf01340cb
    .word 0xea520301
    .word 0xb2c912c3
    .word 0x0081eb10
    .word 0x68806980
    .word 0x47704010
    .word 0x8f4ff3bf
    .word 0x03f8f8df
    .word 0xf4106800
    .word 0xf8df60e0
    .word 0x430813f4
    .word 0x13e8f8df
    .word 0xf3bf6008
    .word 0xe7fe8f4f
    .word 0xf7ffb580
    .word 0xbd01ffed
    .word 0xf7ffb580
    .word 0xbd01ffe9
    .word 0xf7ffb580
    .word 0xbd01ffe5
    .word 0xf7ffb580
    .word 0xbd01ffe1
    .word 0xf7ffb580
    .word 0xbd01ffdd
    .word 0x47704770
    .word 0xf7aeb580
    .word 0xf8dffaeb
    .word 0x780913b4
    .word 0xf8df1c49
    .word 0x701123ac
    .word 0xfae6f7ae
    .word 0xfc21f7ae
    .word 0xfb6af7ae
    .word 0xb580bd01
    .word 0x0398f8df
    .word 0x28007a80
    .word 0xf8dfd00d
    .word 0x68000394
    .word 0x0006f030
    .word 0x1388f8df
    .word 0xf0006008
    .word 0xf8dff9fb
    .word 0xf7cc037c
    .word 0xf45ff982
    .word 0xf7bb2080
    .word 0xbd01fe16
    .word 0xf8dfb580
    .word 0xf7ff0368
    .word 0xf8dffca7
    .word 0x210a0368
    .word 0xbd017001
    .word 0x2008b580
    .word 0xfdf5f7bb
    .word 0xd0022800
    .word 0xf7bb2008
    .word 0xbd01fe02
    .word 0x2004b580
    .word 0xfdebf7bb
    .word 0xd03b2800
    .word 0xf7bb2004
    .word 0xf8dffdf8
    .word 0x7800033c
    .word 0x00c0f3c0
    .word 0xd40607c0
    .word 0x0330f8df
    .word 0xf3c07840
    .word 0x07c00040
    .word 0xe029d500
    .word 0x0324f8df
    .word 0x28027800
    .word 0xf8dfd004
    .word 0x7800031c
    .word 0xd11f2803
    .word 0x784048c3
    .word 0xd51b07c0
    .word 0x784048c1
    .word 0x0010f050
    .word 0x704849bf
    .word 0x48c02100
    .word 0xff7ef7ad
    .word 0x48be2159
    .word 0xff7cf7ad
    .word 0x21012201
    .word 0xf7ae48bb
    .word 0x2101f8e7
    .word 0xf7ad48b9
    .word 0x2201ff85
    .word 0x48b82110
    .word 0xf8d1f793
    .word 0xb580bd01
    .word 0xf7bb2002
    .word 0x2800fda8
    .word 0x48b4d006
    .word 0xf7aa6800
    .word 0x2002f91b
    .word 0xfdb1f7bb
    .word 0xb580bd01
    .word 0xf7bb2001
    .word 0x2800fd9a
    .word 0x2001d015
    .word 0xfda7f7bb
    .word 0x780048ac
    .word 0xd1032801
    .word 0x210048aa
    .word 0xe0027001
    .word 0x210148a8
    .word 0x48a87001
    .word 0x780949a6
    .word 0x48a77001
    .word 0xf7aa6800
    .word 0xbd01f8fb
    .word 0x2101b580
    .word 0xf7ae48a4
    .word 0x48a4f8d0
    .word 0xf7aa6800
    .word 0xbd01f8f1
    .word 0x2101b580
    .word 0xf7ae4899
    .word 0x4895f8c6
    .word 0xf3c07800
    .word 0x07c000c0
    .word 0x4893d405
    .word 0xf3c07840
    .word 0x07c00040
    .word 0xe02ad500
    .word 0x78004890
    .word 0xd0032802
    .word 0x7800488e
    .word 0xd1222803
    .word 0x7840488b
    .word 0x1000f3c0
    .word 0xd51107c0
    .word 0x78404888
    .word 0x00eff010
    .word 0x70484986
    .word 0x48872100
    .word 0xff0cf7ad
    .word 0x3153f640
    .word 0xf7ad4884
    .word 0xf7b1ff09
    .word 0xe00aff67
    .word 0x48812100
    .word 0xff14f7ad
    .word 0x21012200
    .word 0xf7ae487e
    .word 0xf7b1f86d
    .word 0xbd01ff88
    .word 0x2102b580
    .word 0xf7ae4882
    .word 0x2800f871
    .word 0x2102d004
    .word 0xf7ae487f
    .word 0xe00af882
    .word 0x487d2101
    .word 0xf87df7ae
    .word 0x2201ab00
    .word 0x487b2180
    .word 0xf7b26800
    .word 0xbd01f9fa
    .word 0x2101b580
    .word 0xf7ae4878
    .word 0x486bf870
    .word 0xf3c07840
    .word 0x07c00080
    .word 0x4875d521
    .word 0x49757800
    .word 0x4a757809
    .word 0xfb105c89
    .word 0xb289f101
    .word 0xf7bb2004
    .word 0x4870ff63
    .word 0x1c407800
    .word 0x7008496e
    .word 0x7800486d
    .word 0xd3362810
    .word 0x21012200
    .word 0xf7ae4868
    .word 0x2100f82d
    .word 0xf7ad4866
    .word 0x4867fecb
    .word 0x70012110
    .word 0x4865e029
    .word 0x1e407800
    .word 0x70084963
    .word 0x78004862
    .word 0xd1122800
    .word 0x21012200
    .word 0xf7ae485d
    .word 0x2100f817
    .word 0xf7ad485b
    .word 0xf7b1feb5
    .word 0xab00ff42
    .word 0x21022201
    .word 0x68004856
    .word 0xf9b1f7b2
    .word 0x4856e00d
    .word 0x49567800
    .word 0x4a577809
    .word 0xf8111889
    .word 0xfb101c01
    .word 0xb289f101
    .word 0xf7bb2004
    .word 0xbd01ff23
    .word 0x2101b580
    .word 0xf7ae4851
    .word 0x483ff818
    .word 0xf3c07800
    .word 0x07c00040
    .word 0xf7a7d502
    .word 0xe010fb09
    .word 0x7800483a
    .word 0x0080f3c0
    .word 0xd50207c0
    .word 0xfb43f7a7
    .word 0x4848e007
    .word 0xf3c07800
    .word 0x07c01000
    .word 0xf7a6d501
    .word 0xbd01fbc2
    .word 0x2101b580
    .word 0xf7ad4843
    .word 0xf797fff8
    .word 0xbd01ff13
    .word 0xf7aeb580
    .word 0x4927f95f
    .word 0x1c497809
    .word 0x70114a25
    .word 0xf95cf7ae
    .word 0x4080f44f
    .word 0xfd62f792
    .word 0x0080f45f
    .word 0xfca1f7bb
    .word 0x2201ab00
    .word 0x482e2101
    .word 0xf7b26800
    .word 0xf7aef960
    .word 0xbd01f9d3
    .word 0x4933b580
    .word 0xf7b84833
    .word 0x2801f933
    .word 0x2000d10f
    .word 0x4931e006
    .word 0xf8324a31
    .word 0xf8212010
    .word 0x1c402010
    .word 0xdbf62880
    .word 0x482b492a
    .word 0xf94bf7b8
    .word 0x492ce018
    .word 0xf7b84828
    .word 0x2801f91d
    .word 0x2080d112
    .word 0x4926e006
    .word 0xf8324a26
    .word 0xf8212010
    .word 0x1c402010
    .word 0xddf628ff
    .word 0x68004824
    .word 0xffd2f7a9
    .word 0x481e4921
    .word 0xf931f7b8
    .word 0x0000bd01
    .word 0xe000ed0c
    .word 0x05fa0004
    .word 0x2001d3fb
    .word 0x20016434
    .word 0xe000ed10
    .word 0x2001d35b
    .word 0x2001d0bc
    .word 0x2001d0ac
    .word 0x2001d34c
    .word 0x40000800
    .word 0x40020800
    .word 0x2001d100
    .word 0x2001d374
    .word 0x2001d375
    .word 0x2001d108
    .word 0x40000c00
    .word 0x2001d14c
    .word 0x40000400
    .word 0x2001d0fc
    .word 0x40001000
    .word 0x2001d351
    .word 0x2001d34b
    .word 0x080f9e98
    .word 0x080f9ea8
    .word 0x40001400
    .word 0x2001d0d0
    .word 0x40010400
    .word 0x14004000
    .word 0x40026458
    .word 0x2001acfc
    .word 0x2001aafc
    .word 0x18008000
    .word 0x2001d148
    .word 0x4847b580
    .word 0xf4506800
    .word 0x49450070
    .word 0x48456008
    .word 0xf0506800
    .word 0x49430001
    .word 0x48436008
    .word 0x60012100
    .word 0x68004840
    .word 0x40084941
    .word 0x6008493e
    .word 0x49414840
    .word 0x483c6001
    .word 0xf4306800
    .word 0x493a2080
    .word 0x483e6008
    .word 0x60012100
    .word 0xf805f000
    .word 0xf05f483c
    .word 0x60016100
    .word 0xb082bd01
    .word 0x90012000
    .word 0x90002000
    .word 0x68004831
    .word 0x3080f450
    .word 0x6008492f
    .word 0x6800482e
    .word 0x3000f410
    .word 0x98019000
    .word 0x90011c40
    .word 0x28009800
    .word 0x9801d103
    .word 0x6f20f5b0
    .word 0x4827d1f0
    .word 0x03806800
    .word 0x2001d502
    .word 0xe0019000
    .word 0x90002000
    .word 0x28019800
    .word 0x4828d13c
    .word 0xf0506800
    .word 0x49265080
    .word 0x48266008
    .word 0xf4506800
    .word 0x49244080
    .word 0x481c6008
    .word 0x6809491b
    .word 0x481a6001
    .word 0x68094919
    .word 0x48186001
    .word 0xf4506800
    .word 0x49165080
    .word 0x48176008
    .word 0x6001491c
    .word 0x68004812
    .word 0x7080f050
    .word 0x60084910
    .word 0x6800480f
    .word 0xd5fb0180
    .word 0xf2404817
    .word 0x60016105
    .word 0x6800480c
    .word 0x00800880
    .word 0x6008490a
    .word 0x68004809
    .word 0x0002f050
    .word 0x60084907
    .word 0x68004806
    .word 0x000cf010
    .word 0xd1f92808
    .word 0x4770b002
    .word 0x00000000
    .word 0xe000ed88
    .word 0x40023800
    .word 0x40023808
    .word 0xfef6ffff
    .word 0x40023804
    .word 0x24003010
    .word 0x4002380c
    .word 0xe000ed08
    .word 0x40023840
    .word 0x40007000
    .word 0x06414808
    .word 0x40023c00
.Ldata_20658:
    .word 0x01160020
    .word 0x059a02f1
    .word 0x0d0308fd
    .word 0x16a41198
    .word 0x21cb1c12
    .word 0x2dc527b9
    .word 0x39e333da
    .word 0x457b3fca
    .word 0x4fee4ae3
    .word 0x58a8548b
    .word 0x601a5c52
    .word 0x67cd63f8
    .word 0x6ef86b7f
    .word 0x75067229
    .word 0x79ad7788
    .word 0x7ce17b74
    .word 0x7ec87dfa
    .word 0x7fae7f55
    .word 0x7ff67fe0
    .word 0x7fff7ffe
.Ldata_20659:
    .word 0x02837ffa
    .word 0x07897fc7
    .word 0x0c8c7f62
    .word 0x118a7ecb
    .word 0x16807e02
    .word 0x1b6e7d07
    .word 0x20527bda
    .word 0x25287a7d
    .word 0x29f078ef
    .word 0x2ea77732
    .word 0x334c7546
    .word 0x37dc732b
    .word 0x3c5770e3
    .word 0x40b96e6e
    .word 0x45026bce
    .word 0x49306903
    .word 0x4d41660f
    .word 0x513462f2
    .word 0x55065fae
    .word 0x58b75c45
    .word 0x5c4558b7
    .word 0x5fae5506
    .word 0x62f25134
    .word 0x660f4d41
    .word 0x69034930
    .word 0x6bce4502
    .word 0x6e6e40b9
    .word 0x70e33c57
    .word 0x732b37dc
    .word 0x7546334c
    .word 0x77322ea7
    .word 0x78ef29f0
    .word 0x7a7d2528
    .word 0x7bda2052
    .word 0x7d071b6e
    .word 0x7e021680
    .word 0x7ecb118a
    .word 0x7f620c8c
    .word 0x7fc70789
    .word 0x7ffa0283
    .word 0x7ffafd7d
    .word 0x7fc7f877
    .word 0x7f62f374
    .word 0x7ecbee76
    .word 0x7e02e980
    .word 0x7d07e492
    .word 0x7bdadfae
    .word 0x7a7ddad8
    .word 0x78efd610
    .word 0x7732d159
    .word 0x7546ccb4
    .word 0x732bc824
    .word 0x70e3c3a9
    .word 0x6e6ebf47
    .word 0x6bcebafe
    .word 0x6903b6d0
    .word 0x660fb2bf
    .word 0x62f2aecc
    .word 0x5faeaafa
    .word 0x5c45a749
    .word 0x58b7a3bb
    .word 0x5506a052
    .word 0x51349d0e
    .word 0x4d4199f1
    .word 0x493096fd
    .word 0x45029432
    .word 0x40b99192
    .word 0x3c578f1d
    .word 0x37dc8cd5
    .word 0x334c8aba
    .word 0x2ea788ce
    .word 0x29f08711
    .word 0x25288583
    .word 0x20528426
    .word 0x1b6e82f9
    .word 0x168081fe
    .word 0x118a8135
    .word 0x0c8c809e
    .word 0x07898039
    .word 0x02838006
    .word 0xfd7d8006
    .word 0xf8778039
    .word 0xf374809e
    .word 0xee768135
    .word 0xe98081fe
    .word 0xe49282f9
    .word 0xdfae8426
    .word 0xdad88583
    .word 0xd6108711
    .word 0xd15988ce
    .word 0xccb48aba
    .word 0xc8248cd5
    .word 0xc3a98f1d
    .word 0xbf479192
    .word 0xbafe9432
    .word 0xb6d096fd
    .word 0xb2bf99f1
    .word 0xaecc9d0e
    .word 0xaafaa052
    .word 0xa749a3bb
    .word 0xa3bba749
    .word 0xa052aafa
    .word 0x9d0eaecc
    .word 0x99f1b2bf
    .word 0x96fdb6d0
    .word 0x9432bafe
    .word 0x9192bf47
    .word 0x8f1dc3a9
    .word 0x8cd5c824
    .word 0x8abaccb4
    .word 0x88ced159
    .word 0x8711d610
    .word 0x8583dad8
    .word 0x8426dfae
    .word 0x82f9e492
    .word 0x81fee980
    .word 0x8135ee76
    .word 0x809ef374
    .word 0x8039f877
    .word 0x8006fd7d
    .word 0x80060283
    .word 0x80390789
    .word 0x809e0c8c
    .word 0x8135118a
    .word 0x81fe1680
    .word 0x82f91b6e
    .word 0x84262052
    .word 0x85832528
    .word 0x871129f0
    .word 0x88ce2ea7
    .word 0x8aba334c
    .word 0x8cd537dc
    .word 0x8f1d3c57
    .word 0x919240b9
    .word 0x94324502
    .word 0x96fd4930
    .word 0x99f14d41
    .word 0x9d0e5134
    .word 0xa0525506
    .word 0xa3bb58b7
    .word 0xa7495c45
    .word 0xaafa5fae
    .word 0xaecc62f2
    .word 0xb2bf660f
    .word 0xb6d06903
    .word 0xbafe6bce
    .word 0xbf476e6e
    .word 0xc3a970e3
    .word 0xc824732b
    .word 0xccb47546
    .word 0xd1597732
    .word 0xd61078ef
    .word 0xdad87a7d
    .word 0xdfae7bda
    .word 0xe4927d07
    .word 0xe9807e02
    .word 0xee767ecb
    .word 0xf3747f62
    .word 0xf8777fc7
    .word 0xfd7d7ffa
    .word 0x7fc77ffa
    .word 0x7ecb7f62
    .word 0x7d077e02
    .word 0x7a7d7bda
    .word 0x773278ef
    .word 0x732b7546
    .word 0x6e6e70e3
    .word 0x69036bce
    .word 0x62f2660f
    .word 0x5c455fae
    .word 0x550658b7
    .word 0x4d415134
    .word 0x45024930
    .word 0x3c5740b9
    .word 0x334c37dc
    .word 0x29f02ea7
    .word 0x20522528
    .word 0x16801b6e
    .word 0x0c8c118a
    .word 0x02830789
    .word 0xf877fd7d
    .word 0xee76f374
    .word 0xe492e980
    .word 0xdad8dfae
    .word 0xd159d610
    .word 0xc824ccb4
    .word 0xbf47c3a9
    .word 0xb6d0bafe
    .word 0xaeccb2bf
    .word 0xa749aafa
    .word 0xa052a3bb
    .word 0x99f19d0e
    .word 0x943296fd
    .word 0x8f1d9192
    .word 0x8aba8cd5
    .word 0x871188ce
    .word 0x84268583
    .word 0x81fe82f9
    .word 0x809e8135
    .word 0x80068039
    .word 0x80398006
    .word 0x8135809e
    .word 0x82f981fe
    .word 0x85838426
    .word 0x88ce8711
    .word 0x8cd58aba
    .word 0x91928f1d
    .word 0x96fd9432
    .word 0x9d0e99f1
    .word 0xa3bba052
    .word 0xaafaa749
    .word 0xb2bfaecc
    .word 0xbafeb6d0
    .word 0xc3a9bf47
    .word 0xccb4c824
    .word 0xd610d159
    .word 0xdfaedad8
    .word 0xe980e492
    .word 0xf374ee76
    .word 0xfd7df877
    .word 0x07890283
    .word 0x118a0c8c
    .word 0x1b6e1680
    .word 0x25282052
    .word 0x2ea729f0
    .word 0x37dc334c
    .word 0x40b93c57
    .word 0x49304502
    .word 0x51344d41
    .word 0x58b75506
    .word 0x5fae5c45
    .word 0x660f62f2
    .word 0x6bce6903
    .word 0x70e36e6e
    .word 0x7546732b
    .word 0x78ef7732
    .word 0x7bda7a7d
    .word 0x7e027d07
    .word 0x7f627ecb
    .word 0x7ffa7fc7
    .word 0x7fc77ffa
    .word 0x7ecb7f62
    .word 0x7d077e02
    .word 0x7a7d7bda
    .word 0x773278ef
    .word 0x732b7546
    .word 0x6e6e70e3
    .word 0x69036bce
    .word 0x62f2660f
    .word 0x5c455fae
    .word 0x550658b7
    .word 0x4d415134
    .word 0x45024930
    .word 0x3c5740b9
    .word 0x334c37dc
    .word 0x29f02ea7
    .word 0x20522528
    .word 0x16801b6e
    .word 0x0c8c118a
    .word 0x02830789
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x7d8a7fff
    .word 0x6a6e7642
    .word 0x471d5a82
    .word 0x18f930fc
    .word 0xe7070000
    .word 0xb8e3cf04
    .word 0x9592a57e
    .word 0x827689be
    .word 0x82768001
    .word 0x959289be
    .word 0xb8e3a57e
    .word 0xe707cf04
    .word 0x18f90000
    .word 0x471d30fc
    .word 0x6a6e5a82
    .word 0x7d8a7642
.Ldata_20670:
    .word 0x76427d8a
    .word 0x5a826a6e
    .word 0x30fc471d
    .word 0x000018f9
    .word 0xcf04e707
    .word 0xa57eb8e3
    .word 0x89be9592
    .word 0x80018276
    .word 0xcf04e707
    .word 0xa57eb8e3
    .word 0x89be9592
    .word 0x80018276
    .word 0x89be8276
    .word 0xa57e9592
    .word 0xcf04b8e3
    .word 0x0000e707
    .word 0x5a827642
    .word 0x000030fc
    .word 0xa57ecf04
    .word 0x800189be
    .word 0xa57e89be
    .word 0x0000cf04
    .word 0x5a8230fc
    .word 0x7fff7642
    .word 0xa57ecf04
    .word 0x800189be
    .word 0xa57e89be
    .word 0x0000cf04
    .word 0x5a8230fc
    .word 0x7fff7642
    .word 0x5a827642
    .word 0x000030fc
    .word 0x30fc6a6e
    .word 0xa57ee707
    .word 0x89be8276
    .word 0x0000b8e3
    .word 0x7642471d
    .word 0x5a827d8a
    .word 0xcf0418f9
    .word 0x80019592
    .word 0x89beb8e3
    .word 0xa57e8276
    .word 0x30fce707
    .word 0x7fff6a6e
    .word 0x30fc6a6e
    .word 0xa57ee707
    .word 0x89be8276
    .word 0x0000b8e3
    .word 0x00005a82
    .word 0x8001a57e
    .word 0x0000a57e
    .word 0x7fff5a82
    .word 0x00005a82
    .word 0x8001a57e
    .word 0x0000a57e
    .word 0x7fff5a82
    .word 0x8001a57e
    .word 0x0000a57e
    .word 0x7fff5a82
    .word 0x00005a82
    .word 0x8001a57e
    .word 0x0000a57e
    .word 0x7fff5a82
    .word 0x00005a82
    .word 0xcf04471d
    .word 0xa57e8276
    .word 0x764218f9
    .word 0x00006a6e
    .word 0x89be9592
    .word 0x5a82e707
    .word 0x30fc7d8a
    .word 0x8001b8e3
    .word 0x89be9592
    .word 0x5a82e707
    .word 0x30fc7d8a
    .word 0x8001b8e3
    .word 0x30fcb8e3
    .word 0x5a827d8a
    .word 0x89bee707
    .word 0x00009592
    .word 0xa57e30fc
    .word 0x000089be
    .word 0x5a827642
    .word 0x8001cf04
    .word 0x5a82cf04
    .word 0x00007642
    .word 0xa57e89be
    .word 0x7fff30fc
    .word 0xa57e89be
    .word 0x7fff30fc
    .word 0xa57e30fc
    .word 0x000089be
    .word 0x5a827642
    .word 0x8001cf04
    .word 0x5a82cf04
    .word 0x00007642
    .word 0x89be18f9
    .word 0x5a82b8e3
    .word 0xcf046a6e
    .word 0x00008276
    .word 0x30fc7d8a
    .word 0xa57e9592
    .word 0x7642471d
    .word 0x8001e707
    .word 0xcf048276
    .word 0x5a826a6e
    .word 0x89beb8e3
    .word 0x7fff18f9
    .word 0x89be18f9
    .word 0x5a82b8e3
    .word 0xcf046a6e
    .word 0x00008276
    .word 0x80010000
    .word 0x7fff0000
    .word 0x80010000
    .word 0x7fff0000
    .word 0x80010000
    .word 0x7fff0000
    .word 0x80010000
    .word 0x7fff0000
    .word 0x00008001
    .word 0x00007fff
    .word 0x00008001
    .word 0x00007fff
    .word 0x00008001
    .word 0x00007fff
    .word 0x00008001
    .word 0x00007fff
    .word 0x89bee707
    .word 0x5a82471d
    .word 0xcf049592
    .word 0x00007d8a
    .word 0x30fc8276
    .word 0xa57e6a6e
    .word 0x7642b8e3
    .word 0x800118f9
    .word 0x30fc8276
    .word 0xa57e6a6e
    .word 0x7642b8e3
    .word 0x800118f9
    .word 0x764218f9
    .word 0xa57eb8e3
    .word 0x30fc6a6e
    .word 0x00008276
    .word 0xa57ecf04
    .word 0x00007642
    .word 0x5a8289be
    .word 0x800130fc
    .word 0x5a8230fc
    .word 0x000089be
    .word 0xa57e7642
    .word 0x7fffcf04
    .word 0x5a8289be
    .word 0x800130fc
    .word 0x5a8230fc
    .word 0x000089be
    .word 0xa57e7642
    .word 0x7fffcf04
    .word 0xa57ecf04
    .word 0x00007642
    .word 0xcf04b8e3
    .word 0xa57e7d8a
    .word 0x7642e707
    .word 0x00009592
    .word 0x89be6a6e
    .word 0x5a8218f9
    .word 0x30fc8276
    .word 0x8001471d
    .word 0x76429592
    .word 0xa57ee707
    .word 0xcf047d8a
    .word 0x7fffb8e3
    .word 0xcf04b8e3
    .word 0xa57e7d8a
    .word 0x7642e707
    .word 0x00009592
    .word 0x0000a57e
    .word 0x80015a82
    .word 0x00005a82
    .word 0x7fffa57e
    .word 0x0000a57e
    .word 0x80015a82
    .word 0x00005a82
    .word 0x7fffa57e
    .word 0x7fffa57e
    .word 0x0000a57e
    .word 0x80015a82
    .word 0x00005a82
    .word 0x7fffa57e
    .word 0x0000a57e
    .word 0x80015a82
    .word 0x00005a82
    .word 0x30fc9592
    .word 0xa57e18f9
    .word 0x89be7d8a
    .word 0x0000471d
    .word 0x7642b8e3
    .word 0x5a828276
    .word 0xcf04e707
    .word 0x80016a6e
    .word 0x7642b8e3
    .word 0x5a828276
    .word 0xcf04e707
    .word 0x80016a6e
    .word 0xcf046a6e
    .word 0x5a82e707
    .word 0x76428276
    .word 0x0000b8e3
    .word 0x5a8289be
    .word 0x0000cf04
    .word 0xa57e30fc
    .word 0x80017642
    .word 0xa57e7642
    .word 0x000030fc
    .word 0x5a82cf04
    .word 0x7fff89be
    .word 0x5a82cf04
    .word 0x7fff89be
    .word 0x5a8289be
    .word 0x0000cf04
    .word 0xa57e30fc
    .word 0x80017642
    .word 0xa57e7642
    .word 0x000030fc
    .word 0x76428276
    .word 0x5a829592
    .word 0x30fcb8e3
    .word 0x0000e707
    .word 0xcf0418f9
    .word 0xa57e471d
    .word 0x89be6a6e
    .word 0x80017d8a
    .word 0x30fce707
    .word 0x5a82b8e3
    .word 0x76429592
    .word 0x7fff8276
    .word 0x76428276
    .word 0x5a829592
    .word 0x30fcb8e3
    .word 0x0000e707
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe0070000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x7ff0077f
    .word 0xe007fc03
    .word 0xfe03fc0f
    .word 0x0f7efe00
    .word 0x00fe01e0
    .word 0x7ef0077f
    .word 0xe007ff0f
    .word 0xff0ffc3f
    .word 0xbfffff80
    .word 0x80ff07f8
    .word 0xfef80f7f
    .word 0xe087ff3f
    .word 0xff3ffc7f
    .word 0xffffffe0
    .word 0xc0ff1ffc
    .word 0xfef80f7f
    .word 0xe087ff3f
    .word 0xff3ffcff
    .word 0xfffffff0
    .word 0xc0ff1ffc
    .word 0xfcf80f3f
    .word 0xe1c71f7f
    .word 0x8f7f0cff
    .word 0xf33ffff0
    .word 0xe08f3ffc
    .word 0xfcf88f3f
    .word 0xe3c70ffe
    .word 0x07ff00fc
    .word 0xe11ffef8
    .word 0xe0077ffc
    .word 0xfcf89f3f
    .word 0xe3e70ffe
    .word 0x03fe00f8
    .word 0xe10ffef8
    .word 0xf0077ffe
    .word 0xf8fd9f3f
    .word 0xe3e7ffff
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0xf0ff7ffe
    .word 0xf8fd9f1f
    .word 0xe3e7ffff
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0xf0ff7ffe
    .word 0xf8fddf1f
    .word 0xe3e7ffff
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0xf0ff7ffe
    .word 0xf8fdfe1f
    .word 0xe3e7ffff
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0xf0ff7ffe
    .word 0xf07ffe0f
    .word 0xe30700fe
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0x00007ffe
    .word 0xf07ffe0f
    .word 0xe30700fe
    .word 0x03fe00f8
    .word 0xe00ffef8
    .word 0x00007ffe
    .word 0xf07ffe0f
    .word 0xe38701fe
    .word 0x07ff00fc
    .word 0xe00ffef8
    .word 0xc0007ffe
    .word 0xe07ffc07
    .word 0xe187877f
    .word 0x8f7f0cfe
    .word 0xe00ffef0
    .word 0xc0c33ffe
    .word 0xe03ffc07
    .word 0xe187ff7f
    .word 0xff7ffcff
    .word 0xe00ffee0
    .word 0xc0ff3ffe
    .word 0xe03ffc07
    .word 0xe087ff3f
    .word 0xff3ffcff
    .word 0xe00ffec0
    .word 0xc0ff1ffe
    .word 0xe03ffc07
    .word 0xe087ff1f
    .word 0xff0ffc3f
    .word 0xe00ffe80
    .word 0xc0ff0ffe
    .word 0xc01ff803
    .word 0xe007fe07
    .word 0xfe03f80f
    .word 0xe00ffe00
    .word 0x00ff03fe
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xffffff1f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0x00ffffff
    .word 0xffffff3f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0x80ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xffffff7f
    .word 0xffffffff
    .word 0xffffffff
    .word 0xffffffff
    .word 0xc0ffffff
    .word 0xa50a7641
    .word 0x7beaedfd
    .word 0x213f5360
    .word 0xac1d7ec1
    .word 0x17f6cced
    .word 0xe60eac07
    .word 0x0a306093
    .word 0x05a001cd
    .word 0x4e50c33f
    .word 0xf7567a92
    .word 0x8d9e5da5
    .word 0x40dc0adc
    .word 0x43c5cbbb
    .word 0x767f18b3
    .word 0x43565d3b
    .word 0xc5b0fd23
    .word 0x30439625
    .word 0x6d8587be
    .word 0x0464af3c
    .word 0x3f387817
    .word 0x8df61484
    .word 0x24a60748
    .word 0xea17e6ca
    .word 0x96d15e6d
    .word 0x124b771c
    .word 0x245e1a27
    .word 0x4efad24d
    .word 0xf318cf1a
    .word 0xbaef3073
    .word 0x386b826f
    .word 0xc9db8368
    .word 0xbeea2c52
    .word 0xbed0ef4c
    .word 0x66c93e75
    .word 0x33c64c01
    .word 0xa263178c
    .word 0x951aa6ad
    .word 0xf9b68fcf
    .word 0xa60abd3c
    .word 0x86e2707b
    .word 0xfa3a85dc
    .word 0x79aef851
    .word 0x7b32a77f
    .word 0x95035915
    .word 0xe5defe5d
    .word 0xb06f3911
    .word 0x4a0c1b6f
    .word 0x36a3328f
    .word 0x8ff1c2f5
    .word 0xa6f55263
    .word 0xeda56af0
    .word 0x14df9c5e
    .word 0x71a2c1a9
    .word 0xa57e85dc
    .word 0x7d492628
    .word 0x16147837
    .word 0x455d2dbe
    .word 0x35875352
    .word 0x52871e7c
    .word 0x66dfe80f
    .word 0x02d076b9
    .word 0x20cb7dd9
    .word 0x062a6490
    .word 0x6e1d4c1b
    .word 0xe3e74e60
    .word 0x6e4a03c6
    .word 0x723f4a4a
    .word 0xd5eb45d0
    .word 0x60cfa5b6
    .word 0x693f28af
    .word 0xaf155fcf
    .word 0x85a6b5e2
    .word 0x33f5ad02
    .word 0x99276b69
    .word 0x15377683
    .word 0xa7ebbc47
    .word 0x5307d7c8
    .word 0xc7c08e07
    .word 0x3e739f0c
    .word 0xa497bc35
    .word 0xfbf1d3cd
    .word 0xfd0692e0
    .word 0x03d62b4e
    .word 0x25c7541f
    .word 0xa3e09216
    .word 0x8437b889
    .word 0x7cadaa70
    .word 0x13d867bb
    .word 0x044147e9
    .word 0xe3d081d6
    .word 0x0384efd4
    .word 0x976716fe
    .word 0x17c261c9
    .word 0xe68daddc
    .word 0x31290a22
    .word 0x1a52c01d
    .word 0x164f917d
    .word 0x936b3ef1
    .word 0xdfa94d3d
    .word 0x45b4088d
    .word 0x7915c908
    .word 0x36a875a9
    .word 0x2551474a
    .word 0x01ebcf02
    .word 0xf9813ab1
    .word 0x55c1d3d9
    .word 0x5dadcab0
    .word 0x76943473
    .word 0x8f4154fc
    .word 0xbb721997
    .word 0x1f8ce712
    .word 0x0f8c9b13
    .word 0x7441c9ae
    .word 0x71b94737
    .word 0x46f9f055
    .word 0x74f0a258
    .word 0x22ae89cd
    .word 0xbfd2a04f
    .word 0xe94174a0
    .word 0x8d1e2cf8
    .word 0x50f6c69c
    .word 0x2e3aa3b3
    .word 0x61f34655
    .word 0x85b159e6
    .word 0xf9c4f0a2
    .word 0x88af1278
    .word 0x49da761c
    .word 0xc3878a58
.Ldata_20695:
    .word 0x55555555
    .word 0x55555551
    .word 0x55545555
    .word 0x55505555
    .word 0x55555554
    .word 0x55515555
    .word 0x55515551
    .word 0x55555556
    .word 0x55545554
    .word 0x55455555
    .word 0x55505554
    .word 0x55555550
    .word 0x55555545
    .word 0x55405555
    .word 0x55155555
    .word 0x55955555
    .word 0x55505550
    .word 0x55505500
    .word 0x55055505
    .word 0x59555155
    .word 0x51555155
    .word 0x55505540
    .word 0x55155515
    .word 0x51555955
    .word 0x54555455
    .word 0x55445544
    .word 0x55555540
    .word 0x55515550
    .word 0x55455545
    .word 0x55545544
    .word 0x55545550
    .word 0x56555455
    .word 0x55005500
    .word 0x55005550
    .word 0x55015501
    .word 0x55405544
    .word 0x55405540
    .word 0x55405550
    .word 0x55415541
    .word 0x55405554
    .word 0x54005400
    .word 0x55005400
    .word 0x54005500
    .word 0x55005540
    .word 0x54015400
    .word 0x55405400
    .word 0x55405500
    .word 0x55005504
    .word 0x50005000
    .word 0x50005500
    .word 0x50005400
    .word 0x50005200
    .word 0x54005000
    .word 0x50005800
    .word 0x55005000
    .word 0x51005000
    .word 0x40004000
    .word 0x50004000
    .word 0x50000000
    .word 0x52005000
    .word 0x54000000
    .word 0x00005400
    .word 0x40005000
    .word 0x58005000
    .word 0x00000000
    .word 0x00000100
    .word 0x40000000
    .word 0x00000001
    .word 0x00004000
    .word 0x10000000
    .word 0x00005000
    .word 0x00001000
    .word 0x80000000
    .word 0x0a800000
    .word 0xa8000000
    .word 0x02a00000
    .word 0xa0000000
    .word 0xaa000000
    .word 0x02aa0000
    .word 0x0a000000
    .word 0xaaaa0000
    .word 0x00800000
    .word 0x0aaa0000
    .word 0xaa800000
    .word 0x08000000
    .word 0xaaa00000
    .word 0x2aaa0000
    .word 0xaaa80000
    .word 0x00020000
    .word 0x00080000
    .word 0x000a0000
    .word 0x00200000
    .word 0x002a0000
    .word 0x00aa0000
    .word 0x02000000
    .word 0x02800000
    .word 0xaaaaaaaa
    .word 0xaaaa0aaa
    .word 0xa800a800
    .word 0x02aa02aa
    .word 0x0aaa0aaa
    .word 0xaaaaa800
    .word 0xa000a000
    .word 0x08000800
    .word 0x00008000
    .word 0x00000280
    .word 0x00000200
    .word 0x00000aa8
    .word 0x00000800
    .word 0x00000a00
    .word 0x00000a80
    .word 0x000002a0
    .word 0x0000aaaa
    .word 0x0000aa80
    .word 0x0000a800
    .word 0x00002aaa
    .word 0x0000a000
    .word 0x000002aa
    .word 0x00000aaa
    .word 0x0000aaa0
    .word 0x00000002
    .word 0x0000002a
    .word 0x00000008
    .word 0x00000020
    .word 0x0000000a
    .word 0x000000aa
    .word 0x00000080
    .word 0x000000a0
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x01000000
    .word 0x00000055
    .word 0x00000000
    .word 0x06000000
    .word 0x050040aa
    .word 0x00000050
    .word 0x1a000000
    .word 0x1a0090aa
    .word 0x000000a4
    .word 0x2a000000
    .word 0x6a00a0aa
    .word 0x000000a9
    .word 0x6a000000
    .word 0xaa01a4aa
    .word 0x000040aa
    .word 0x6a000000
    .word 0xaa01a4aa
    .word 0x000040aa
    .word 0x6a000000
    .word 0xaa01a4aa
    .word 0x000040aa
    .word 0x2a000000
    .word 0xaa00a0aa
    .word 0x000000aa
    .word 0x1a000000
    .word 0x2a0090aa
    .word 0x000000a8
    .word 0x0a000000
    .word 0x0a0080aa
    .word 0x000000a0
    .word 0x02000000
    .word 0x750000aa
    .word 0x0000405d
    .word 0x1d000000
    .word 0xfd01d055
    .word 0x0000c07f
    .word 0xff010000
    .word 0xff07fd57
    .word 0x0000f0ff
    .word 0xff030000
    .word 0xfd0fffdf
    .word 0x0000f47f
    .word 0xff070000
    .word 0xfd4fff57
    .word 0x0000f47f
    .word 0xff0f0000
    .word 0xfddfff57
    .word 0x0000f47f
    .word 0xff0f0000
    .word 0xfddfff57
    .word 0x0000f47f
    .word 0xff0f0000
    .word 0xfddfff57
    .word 0x0000f47f
    .word 0xff1f0000
    .word 0xfddfff57
    .word 0x0000f47f
    .word 0xff1f0000
    .word 0xfddfff57
    .word 0x0000f47f
    .word 0xff1f0000
    .word 0xffdfff57
    .word 0x0000f4ff
    .word 0xff1f0000
    .word 0xffdfff57
    .word 0x0000f4ff
    .word 0xff1f0000
    .word 0xffd7ff57
    .word 0x0000d0ff
    .word 0xff1f0000
    .word 0xffd3ffdf
    .word 0x0000c0ff
    .word 0xff1f0000
    .word 0x55d1ffff
    .word 0x00004055
    .word 0xff0f0000
    .word 0x00d0ffff
    .word 0x00000000
    .word 0xff070000
    .word 0x0040ffff
    .word 0x00000000
    .word 0x55010000
    .word 0x00005555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00545500
    .word 0x00000000
    .word 0x00000000
    .word 0x00a9aa01
    .word 0x00000000
    .word 0x00000000
    .word 0x40aaaa06
    .word 0x00000000
    .word 0x00000000
    .word 0x90aaaa1a
    .word 0x00000000
    .word 0x00000000
    .word 0x90aaaa1a
    .word 0x00000000
    .word 0x00000000
    .word 0x90aaaa1a
    .word 0x00000000
    .word 0x00000000
    .word 0x90aaaa1a
    .word 0x00000000
    .word 0x00000000
    .word 0x80aaaa0a
    .word 0x00000000
    .word 0x00000000
    .word 0x40aaaa06
    .word 0x00000000
    .word 0x00000000
    .word 0x00aaaa02
    .word 0x00000000
    .word 0x00000000
    .word 0x00a56a01
    .word 0x00000000
    .word 0x00000000
    .word 0x405fd507
    .word 0x00000000
    .word 0x00000000
    .word 0xf47ff57f
    .word 0x00000000
    .word 0x00000000
    .word 0xfcfffdff
    .word 0x00000000
    .word 0x01000000
    .word 0xfd7ff5ff
    .word 0x00000000
    .word 0x07000000
    .word 0xff7ff5ff
    .word 0x00000040
    .word 0x07000000
    .word 0xff7ff5ff
    .word 0x00000040
    .word 0x07000000
    .word 0xff7ff5ff
    .word 0x00000040
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xff7ff5ff
    .word 0x000000d0
    .word 0x1f000000
    .word 0xfffffdff
    .word 0x000000d0
    .word 0x07000000
    .word 0xffffffff
    .word 0x00000040
    .word 0x01000000
    .word 0xfdffffff
    .word 0x00000000
    .word 0x00000000
    .word 0x54555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
.Ldata_20696:
    .word 0x095e0956
    .word 0x09950973
    .word 0x0a0409c6
    .word 0x0aa90a4f
    .word 0x0b840b0f
    .word 0x0c930c05
    .word 0x0dd80d2f
    .word 0x0f4f0e8d
    .word 0x10f7101d
    .word 0x12ce11dd
    .word 0x14d313cb
    .word 0x170415e7
    .word 0x195e182c
    .word 0x1bdf1a9a
    .word 0x1e841d2d
    .word 0x214b1fe3
    .word 0x243022b9
    .word 0x273125ad
    .word 0x2a4a28bb
    .word 0x2d792bdf
    .word 0x30ba2f18
    .word 0x34093260
    .word 0x376435b6
    .word 0x3ac83916
    .word 0x3e2f3c7b
    .word 0x41973fe3
    .word 0x44fd434a
    .word 0x485c46ad
    .word 0x4bb24a08
    .word 0x4efb4d58
    .word 0x52325099
    .word 0x555853c7
    .word 0x586556e2
    .word 0x5b5859e2
    .word 0x5e2e5cc7
    .word 0x60e45f8d
    .word 0x63786233
    .word 0x65e664b3
    .word 0x682b670d
    .word 0x6a46693e
    .word 0x6c356b43
    .word 0x6df56d1a
    .word 0x6f856ec3
    .word 0x70e2703a
    .word 0x720c717e
    .word 0x7303728e
    .word 0x73c3736a
    .word 0x744d740f
    .word 0x74a0747d
    .word 0x74bb74b4
.Ldata_20697:
    .word 0x0315017d
    .word 0x069504c7
    .word 0x0a85087e
    .word 0x0bd60b2b
    .word 0x0d360c84
    .word 0x0ea50dec
    .word 0x10240f63
    .word 0x11b210e9
    .word 0x134e127e
    .word 0x14f91422
    .word 0x16b215d4
    .word 0x18781793
    .word 0x1a4a195f
    .word 0x1c2a1b38
    .word 0x1e151d1e
    .word 0x200b1f0e
    .word 0x220b210a
    .word 0x24162310
    .word 0x262a251f
    .word 0x28462737
    .word 0x2a692957
    .word 0x2c942b7e
    .word 0x2ec42dab
    .word 0x30f92fde
    .word 0x33323215
    .word 0x356f3450
    .word 0x37ad368e
    .word 0x39ed38cd
    .word 0x3c2d3b0d
    .word 0x3e6c3d4d
    .word 0x40aa3f8b
    .word 0x42e441c7
    .word 0x451b4400
    .word 0x474c4634
    .word 0x49784863
    .word 0x4b9d4a8c
    .word 0x4dba4cac
    .word 0x4fcd4ec5
    .word 0x51d750d3
    .word 0x53d552d8
    .word 0x55c854d0
    .word 0x57ad56bc
    .word 0x5984589a
    .word 0x5b4c5a6a
    .word 0x5d045c2a
    .word 0x5eac5dda
    .word 0x60415f79
    .word 0x61c56105
    .word 0x6335627f
    .word 0x649163e5
    .word 0x65d86537
    .word 0x670a6674
    .word 0x6826679b
    .word 0x692b68ab
    .word 0x6a1969a5
    .word 0x6aef6a87
    .word 0x6bad6b51
    .word 0x6c536c03
    .word 0x6cdf6c9c
    .word 0x6d536d1c
    .word 0x6dad6d83
    .word 0x6ded6dd0
    .word 0x6e146e04
    .word 0x6e216e1e
    .word 0xb083b500
    .word 0xa8000001
    .word 0xf79c2208
    .word 0x2000f8b5
    .word 0xfb8cf79c
    .word 0x3006f9bd
    .word 0x2004f9bd
    .word 0x1002f9bd
    .word 0x0000f9bd
    .word 0xf8d8f000
    .word 0x407ff07f
    .word 0xfb7ef79c
    .word 0x0004f9bd
    .word 0xf9bd1e82
    .word 0x1c410000
    .word 0x0002f9bd
    .word 0xf7b41c40
    .word 0xf9bdfb19
    .word 0x1e820006
    .word 0x0002f9bd
    .word 0xf9bd1c41
    .word 0x1c400000
    .word 0xfb3af7b4
    .word 0xf79c484e
    .word 0xf9bdfb65
    .word 0x1e420004
    .word 0x0000f9bd
    .word 0xf9bd1c41
    .word 0x1e400006
    .word 0xfb00f7b4
    .word 0x0006f9bd
    .word 0xf9bd1e82
    .word 0x1c410002
    .word 0x0004f9bd
    .word 0xf7b41e40
    .word 0xbd07fb21
    .word 0xb083b500
    .word 0xa8000001
    .word 0xf79c2208
    .word 0x2000f86d
    .word 0xfb44f79c
    .word 0xf79c483d
    .word 0xf9bdfb41
    .word 0xf9bd2004
    .word 0xf9bd1000
    .word 0xf7b40002
    .word 0xf9bdfadf
    .word 0xf9bd2006
    .word 0x1c410002
    .word 0x0000f9bd
    .word 0xfb02f7b4
    .word 0xf79c2000
    .word 0xf9bdfb2d
    .word 0x1e420004
    .word 0x0000f9bd
    .word 0xf9bd1c41
    .word 0x1c400002
    .word 0xfac8f7b4
    .word 0x0006f9bd
    .word 0xf9bd1e42
    .word 0x1c810002
    .word 0x0000f9bd
    .word 0xf7b41c40
    .word 0xf07ffae9
    .word 0xf79c407f
    .word 0xf9bdfb13
    .word 0xf9bd2004
    .word 0x1c410000
    .word 0x0006f9bd
    .word 0xfab0f7b4
    .word 0x2006f9bd
    .word 0x0002f9bd
    .word 0xf9bd1c41
    .word 0xf7b40004
    .word 0x481dfad3
    .word 0xfafef79c
    .word 0x0004f9bd
    .word 0xf9bd1e42
    .word 0x1c810000
    .word 0x0006f9bd
    .word 0xf7b41e40
    .word 0xf9bdfa99
    .word 0x1e420006
    .word 0x0002f9bd
    .word 0xf9bd1c81
    .word 0x1e400004
    .word 0xfabaf7b4
    .word 0xb500bd07
    .word 0xa800b083
    .word 0xffc6f7b3
    .word 0xf7ffa800
    .word 0xbd07ff91
    .word 0x0004b510
    .word 0xf7b30020
    .word 0x2202ffbd
    .word 0x00200021
    .word 0xfedef7b3
    .word 0xb500bd10
    .word 0xa800b083
    .word 0xffb2f7b3
    .word 0xf7ffa800
    .word 0xbd07ff35
    .word 0x00555555
    .word 0x00808080
    .word 0x00c0c0c0
    .word 0x0004b5f8
    .word 0x0016000d
    .word 0x0032001f
    .word 0x00200029
    .word 0xf925f79c
    .word 0x00390032
    .word 0xf79c0020
    .word 0x1e7af920
    .word 0x00201c69
    .word 0xfb6af7bc
    .word 0x1c691e7a
    .word 0xf7bc0030
    .word 0xbdf1fb65
    .word 0xb083b5f0
    .word 0x000d0004
    .word 0x001f0016
    .word 0x7d004815
    .word 0x49141e40
    .word 0x190c6c09
    .word 0x6c494912
    .word 0x4911194d
    .word 0x198e6c09
    .word 0x6c49490f
    .word 0x1a2119cf
    .word 0x1000f8ad
    .word 0xf8ad1981
    .word 0x1a291004
    .word 0x1002f8ad
    .word 0xf8ad19c0
    .word 0xa8000006
    .word 0xfc26f786
    .word 0xd0092800
    .word 0x0032003b
    .word 0x00200029
    .word 0xffbaf7ff
    .word 0xfbeef786
    .word 0xd1f52800
    .word 0x0000bdf7
    .word 0x2001c598
    .word 0x25002400
    .word 0x7800485a
    .word 0x0080f3c0
    .word 0xd50407c0
    .word 0x21012201
    .word 0xf7914857
    .word 0xf44ff9b4
    .word 0xf79d70fa
    .word 0x2200f931
    .word 0x48532101
    .word 0xf9abf791
    .word 0x2200e009
    .word 0x48502101
    .word 0xf9a5f791
    .word 0x21022200
    .word 0xf791484d
    .word 0x200af9a0
    .word 0xf91ef79d
    .word 0x7800484b
    .word 0xd0ee2807
    .word 0x78004849
    .word 0xd0ea2806
    .word 0x78004847
    .word 0xd1032801
    .word 0x78404846
    .word 0xd4e207c0
    .word 0x78004843
    .word 0xd2052830
    .word 0x7800483f
    .word 0x0080f3c0
    .word 0xd5d807c0
    .word 0x78004840
    .word 0xd10a2806
    .word 0x21022200
    .word 0xf791483a
    .word 0x2201f97a
    .word 0x48382101
    .word 0xf975f791
    .word 0x4839e7d3
    .word 0x280a7800
    .word 0x4837d003
    .word 0x280b7800
    .word 0x2200d10a
    .word 0x48312101
    .word 0xf967f791
    .word 0x21022201
    .word 0xf791482e
    .word 0xe7c0f962
    .word 0x7800482d
    .word 0xd1472802
    .word 0x7800482e
    .word 0xd0172805
    .word 0x7800482c
    .word 0xd0132806
    .word 0x7800482a
    .word 0xd00f2808
    .word 0x78004828
    .word 0xd00b2809
    .word 0x78004826
    .word 0xd007280a
    .word 0x78004824
    .word 0xd003280b
    .word 0x78004822
    .word 0xd10a280c
    .word 0x21012200
    .word 0xf791481b
    .word 0x2200f93c
    .word 0x48192102
    .word 0xf937f791
    .word 0x0020e795
    .word 0xb2c01c44
    .word 0xd3902833
    .word 0xb2ed2400
    .word 0xd00b2d00
    .word 0x22002500
    .word 0x48112101
    .word 0xf927f791
    .word 0x21022200
    .word 0xf791480e
    .word 0xe780f922
    .word 0x22012501
    .word 0x480b2101
    .word 0xf91bf791
    .word 0x21022201
    .word 0xf7914808
    .word 0xe774f916
    .word 0x21012200
    .word 0xf7914805
    .word 0x2200f910
    .word 0x48032102
    .word 0xf90bf791
    .word 0xbf00e769
    .word 0x2001c658
    .word 0x40021000
    .word 0x2001d347
    .word 0x2001d0b0
    .word 0x2001d348
    .word 0x2001d36d
    .word 0x68c26881
    .word 0xd10b4291
    .word 0x6802e007
    .word 0x18896811
    .word 0x185b6853
    .word 0x320860c3
    .word 0x68c26002
    .word 0xd0f44291
    .word 0x60821c4a
    .word 0x47707808
    .word 0x4df0e92d
    .word 0xf100b088
    .word 0x91030108
    .word 0x084a6801
    .word 0xeb039b03
    .word 0x920402c2
    .word 0x92052200
    .word 0xeb009206
    .word 0xf1010181
    .word 0x68400608
    .word 0x0101f000
    .word 0x08409102
    .word 0x00c0eb06
    .word 0x24009001
    .word 0xe0014615
    .word 0xd10542ac
    .word 0x42869801
    .word 0xb008d102
    .word 0x8df0e8bd
    .word 0xf877f000
    .word 0xf0174607
    .word 0xd1030803
    .word 0xf871f000
    .word 0x0803f100
    .word 0x90001138
    .word 0xd119280f
    .word 0xf869f000
    .word 0x9000300f
    .word 0xf000e014
    .word 0x4682f864
    .word 0xd10d42ac
    .word 0x42869801
    .word 0xf000bf08
    .word 0x6834f85e
    .word 0xb1009802
    .word 0x6870444c
    .word 0x36081905
    .word 0xd0f142ac
    .word 0xab01f804
    .word 0x0801f1b8
    .word 0x9800d1e7
    .word 0xd0c92800
    .word 0xf849f000
    .word 0x10b84680
    .word 0x0003f000
    .word 0xbf042803
    .word 0xf7ffa803
    .word 0x4637ff8d
    .word 0x46ab4621
    .word 0x2000eb08
    .word 0x1a80e006
    .word 0x68793f08
    .word 0xeb01683a
    .word 0x46590b02
    .word 0x1a8a683a
    .word 0xd3f44282
    .word 0xeb004240
    .word 0xf04f0a01
    .word 0xe0050800
    .word 0x001cf89d
    .word 0x0b01f804
    .word 0x0801f108
    .word 0x1c809800
    .word 0xd09d4580
    .word 0xd10745da
    .word 0xab04f857
    .word 0x0b04f857
    .word 0x0b0aeb00
    .word 0xd0f745da
    .word 0x0b01f81a
    .word 0x001cf88d
    .word 0xd1e542ac
    .word 0x42869801
    .word 0xf000bf08
    .word 0x6834f80c
    .word 0xb1009802
    .word 0x6870444c
    .word 0x36081905
    .word 0xd0f142ac
    .word 0xa803e7d6
    .word 0x2001e74a
    .word 0xb800f000
    .word 0x46c046c0
    .word 0x00114a02
    .word 0xbeab2018
    .word 0xbf00e7fb
    .word 0x00020026
    .word 0xf7b6b580
    .word 0x2000fae7
    .word 0xb580bd02
    .word 0xfaf2f7b6
    .word 0xbd022000
    .word 0x4942b580
    .word 0xd2054288
    .word 0x20002102
    .word 0xfaf1f7b6
    .word 0xbd022000
    .word 0x4288493e
    .word 0x2102d204
    .word 0xf7b62008
    .word 0xe7f5fae8
    .word 0x4288493b
    .word 0x2102d204
    .word 0xf7b62010
    .word 0xe7edfae0
    .word 0x42884938
    .word 0x2102d204
    .word 0xf7b62018
    .word 0xe7e5fad8
    .word 0x42884935
    .word 0x2102d204
    .word 0xf7b62020
    .word 0xe7ddfad0
    .word 0x42884932
    .word 0x2102d204
    .word 0xf7b62028
    .word 0xe7d5fac8
    .word 0x4288492f
    .word 0x2102d204
    .word 0xf7b62030
    .word 0xe7cdfac0
    .word 0x4288492c
    .word 0x2102d204
    .word 0xf7b62038
    .word 0xe7c5fab8
    .word 0x42884929
    .word 0x2102d204
    .word 0xf7b62040
    .word 0xe7bdfab0
    .word 0x42884926
    .word 0x2102d204
    .word 0xf7b62048
    .word 0xe7b5faa8
    .word 0x42884923
    .word 0x2102d204
    .word 0xf7b62050
    .word 0xe7adfaa0
    .word 0x6f01f1b0
    .word 0x2102d204
    .word 0xf7b62058
    .word 0xe7a5fa98
    .word 0xe7a42001
    .word 0x0004b570
    .word 0x2600000d
    .word 0x0f03f015
    .word 0x002ed00b
    .word 0x4817e003
    .word 0x543121ff
    .word 0xf64f1c76
    .word 0x402870fc
    .word 0x42861d00
    .word 0x2600d3f5
    .word 0x4811e006
    .word 0x00205831
    .word 0xfad3f7b6
    .word 0x1d361d24
    .word 0xd3f642ae
    .word 0xbd702000
    .word 0x4770480b
    .word 0x08004000
    .word 0x08008000
    .word 0x0800c000
    .word 0x08010000
    .word 0x08020000
    .word 0x08040000
    .word 0x08060000
    .word 0x08080000
    .word 0x080a0000
    .word 0x080c0000
    .word 0x080e0000
    .word 0x200199f0
    .word 0x6000f1b0
    .word 0x1f80f5b0
    .word 0x2000d201
    .word 0x2001e000
    .word 0x00044770
.Ldata_20698:
    .byte 0x38
    .byte 0x00
    .byte 0x02
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .word 0x0001ffbf
    .word 0x0001007f
    .word 0x0001ff5f
    .word 0x0001007f
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0001ffaf
    .word 0x0001ffbf
    .word 0x0001007f
    .word 0x0001ff5f
    .word 0x0001007f
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0001ff97
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0001ffdf
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0001ffaf
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0001ffdf
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0003ff8b
    .word 0x0003003f
    .word 0x0001ffdf
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0003ffaf
    .word 0x0003003f
    .word 0x0001ffdf
    .word 0x0001ffbf
    .word 0x0003007f
    .word 0x0003ff97
    .word 0x0003003f
    .word 0x0003ffdf
    .word 0x0003003f
    .word 0x0003ffaf
    .word 0x0003003f
    .word 0x0003ffdf
    .word 0x0007003f
    .word 0x0003ffc5
    .word 0x0003ffdf
    .word 0x0007003f
    .word 0x0003ffef
    .word 0x0003ffdf
    .word 0x0007003f
    .word 0x0007ffd7
    .word 0x0007001f
    .word 0x0007ffef
    .word 0x000f001f
    .word 0x000fffeb
    .word 0x0000000f
.Ldata_20703:
    .byte 0x0c
    .byte 0x00
    .byte 0x02
    .byte 0x00
    .word 0x00010020
    .word 0x0001ffef
    .word 0x0003001f
    .word 0x0001fff7
    .word 0x0001ffef
    .word 0x0003001f
    .word 0x0003ffeb
    .word 0x0003000f
    .word 0x0003fff7
    .word 0x0007000f
    .word 0x0007fff5
    .word 0x00000007
    .word 0x4442413f
    .word 0x4a484745
    .word 0x504e4d4b
    .word 0x56545351
    .word 0x5c5a5957
    .word 0x61605e5d
    .word 0x66656462
    .word 0x6b6a6867
    .word 0x6f6e6d6c
    .word 0x73727170
    .word 0x76757574
    .word 0x79787877
    .word 0x7b7b7a7a
    .word 0x7d7d7c7c
    .word 0x7e7e7e7d
    .word 0x7e7e7e7e
    .word 0x7e7e7e7f
    .word 0x7e7e7e7e
    .word 0x7c7d7d7d
    .word 0x7a7b7b7c
    .word 0x7878797a
    .word 0x75757677
    .word 0x71727374
    .word 0x6d6e6f70
    .word 0x686a6b6c
    .word 0x64656667
    .word 0x5e606162
    .word 0x595a5c5d
    .word 0x53545657
    .word 0x4d4e5051
    .word 0x47484a4b
    .word 0x41424445
    .word 0x3a3c3d3f
    .word 0x34363739
    .word 0x2e303133
    .word 0x282a2b2d
    .word 0x22242527
    .word 0x1d1e2021
    .word 0x18191a1c
    .word 0x13141617
    .word 0x0f101112
    .word 0x0b0c0d0e
    .word 0x0809090a
    .word 0x05060607
    .word 0x03030404
    .word 0x01010202
    .word 0x00000001
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x02010100
    .word 0x04030302
    .word 0x06060504
    .word 0x09090807
    .word 0x0d0c0b0a
    .word 0x11100f0e
    .word 0x16141312
    .word 0x1a191817
    .word 0x201e1d1c
    .word 0x25242221
    .word 0x2b2a2827
    .word 0x31302e2d
    .word 0x37363433
    .word 0x3d3c3a39
    .word 0x8885827f
    .word 0x94918e8b
    .word 0xa09d9a97
    .word 0xaca9a6a3
    .word 0xb8b5b2af
    .word 0xc2c0bdba
    .word 0xcdcac8c5
    .word 0xd6d4d1cf
    .word 0xdfdddad8
    .word 0xe6e5e3e1
    .word 0xedebeae8
    .word 0xf3f1f0ef
    .word 0xf7f6f5f4
    .word 0xfafaf9f8
    .word 0xfdfcfcfb
    .word 0xfdfdfdfd
    .word 0xfdfdfdfe
    .word 0xfcfcfdfd
    .word 0xf9fafafb
    .word 0xf5f6f7f8
    .word 0xf0f1f3f4
    .word 0xeaebedef
    .word 0xe3e5e6e8
    .word 0xdadddfe1
    .word 0xd1d4d6d8
    .word 0xc8cacdcf
    .word 0xbdc0c2c5
    .word 0xb2b5b8ba
    .word 0xa6a9acaf
    .word 0x9a9da0a3
    .word 0x8e919497
    .word 0x8285888b
    .word 0x75787b7f
    .word 0x696c6f72
    .word 0x5d606366
    .word 0x5154575a
    .word 0x45484b4e
    .word 0x3b3d4043
    .word 0x30333538
    .word 0x27292c2e
    .word 0x1e202325
    .word 0x17181a1c
    .word 0x10121315
    .word 0x0a0c0d0e
    .word 0x06070809
    .word 0x03030405
    .word 0x00010102
    .word 0x00000000
    .word 0x00000000
    .word 0x01010000
    .word 0x04030302
    .word 0x08070605
    .word 0x0d0c0a09
    .word 0x1312100e
    .word 0x1a181715
    .word 0x23201e1c
    .word 0x2c292725
    .word 0x3533302e
    .word 0x403d3b38
    .word 0x4b484543
    .word 0x5754514e
    .word 0x63605d5a
    .word 0x6f6c6966
    .word 0x7b787572
    .word 0x7f7f8080
    .word 0x7d7d7e7e
    .word 0x7b7b7c7c
    .word 0x79797a7a
    .word 0x77777878
    .word 0x75757676
    .word 0x73737474
    .word 0x71717272
    .word 0x6f6f7070
    .word 0x6d6d6e6e
    .word 0x6b6b6c6c
    .word 0x69696a6a
    .word 0x67676868
    .word 0x65656666
    .word 0x63636464
    .word 0x61616262
    .word 0x5f5f6060
    .word 0x5d5d5e5e
    .word 0x5b5b5c5c
    .word 0x59595a5a
    .word 0x57575858
    .word 0x55555656
    .word 0x53535454
    .word 0x51515252
    .word 0x4f4f5050
    .word 0x4d4d4e4e
    .word 0x4b4b4c4c
    .word 0x49494a4a
    .word 0x47474848
    .word 0x45454646
    .word 0x43434444
    .word 0x41414242
    .word 0x3f3f4040
    .word 0x3d3d3e3e
    .word 0x3b3b3c3c
    .word 0x39393a3a
    .word 0x37373838
    .word 0x35353636
    .word 0x33333434
    .word 0x31313232
    .word 0x2f2f3030
    .word 0x2d2d2e2e
    .word 0x2b2b2c2c
    .word 0x29292a2a
    .word 0x27272828
    .word 0x25252626
    .word 0x23232424
    .word 0x21212222
    .word 0x1f1f2020
    .word 0x1d1d1e1e
    .word 0x1b1b1c1c
    .word 0x19191a1a
    .word 0x17171818
    .word 0x15151616
    .word 0x13131414
    .word 0x11111212
    .word 0x0f0f1010
    .word 0x0d0d0e0e
    .word 0x0b0b0c0c
    .word 0x09090a0a
    .word 0x07070808
    .word 0x05050606
    .word 0x03030404
    .word 0x01010202
    .word 0x02010100
    .word 0x03020201
    .word 0x03020201
    .word 0x04030302
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x06050504
    .word 0x07060605
    .word 0x07060605
    .word 0x08070706
    .word 0xc0408000
    .word 0xe060a020
    .word 0xd0509010
    .word 0xf070b030
    .word 0xc8488808
    .word 0xe868a828
    .word 0xd8589818
    .word 0xf878b838
    .word 0xc4448404
    .word 0xe464a424
    .word 0xd4549414
    .word 0xf474b434
    .word 0xcc4c8c0c
    .word 0xec6cac2c
    .word 0xdc5c9c1c
    .word 0xfc7cbc3c
    .word 0xc2428202
    .word 0xe262a222
    .word 0xd2529212
    .word 0xf272b232
    .word 0xca4a8a0a
    .word 0xea6aaa2a
    .word 0xda5a9a1a
    .word 0xfa7aba3a
    .word 0xc6468606
    .word 0xe666a626
    .word 0xd6569616
    .word 0xf676b636
    .word 0xce4e8e0e
    .word 0xee6eae2e
    .word 0xde5e9e1e
    .word 0xfe7ebe3e
    .word 0xc1418101
    .word 0xe161a121
    .word 0xd1519111
    .word 0xf171b131
    .word 0xc9498909
    .word 0xe969a929
    .word 0xd9599919
    .word 0xf979b939
    .word 0xc5458505
    .word 0xe565a525
    .word 0xd5559515
    .word 0xf575b535
    .word 0xcd4d8d0d
    .word 0xed6dad2d
    .word 0xdd5d9d1d
    .word 0xfd7dbd3d
    .word 0xc3438303
    .word 0xe363a323
    .word 0xd3539313
    .word 0xf373b333
    .word 0xcb4b8b0b
    .word 0xeb6bab2b
    .word 0xdb5b9b1b
    .word 0xfb7bbb3b
    .word 0xc7478707
    .word 0xe767a727
    .word 0xd7579717
    .word 0xf777b737
    .word 0xcf4f8f0f
    .word 0xef6faf2f
    .word 0xdf5f9f1f
    .word 0xff7fbf3f
    .word 0x00010000
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010005
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010006
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010005
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010007
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010005
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010006
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010005
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
    .word 0x00010004
    .word 0x00010002
    .word 0x00010003
    .word 0x00010002
.Ldata_20707:
    .word 0x02010100
    .word 0x03020201
    .word 0x03020201
    .word 0x04030302
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x03020201
    .word 0x04030302
    .word 0x04030302
    .word 0x05040403
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x04030302
    .word 0x05040403
    .word 0x05040403
    .word 0x06050504
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x05040403
    .word 0x06050504
    .word 0x06050504
    .word 0x07060605
    .word 0x06050504
    .word 0x07060605
    .word 0x07060605
    .word 0x08070706
    .word 0x03f0e92d
    .word 0x68074604
    .word 0x4e1a680d
    .word 0xf983fa1f
    .word 0xe0082017
    .word 0x6f00f415
    .word 0xf485bf1c
    .word 0xf085658e
    .word 0x38010505
    .word 0xea4fd01d
    .word 0xea4f5c45
    .word 0xea8c5c5c
    .word 0x016d0509
    .word 0xf885fa5f
    .word 0x2507f3c5
    .word 0x8008f816
    .word 0x44a85d75
    .word 0xea4f4542
    .word 0xdbe3054c
    .word 0x0503ea8c
    .word 0x0317f1c0
    .word 0xf303fa55
    .word 0xf000fa15
    .word 0x40474058
    .word 0xf0272001
    .word 0xf427477f
    .word 0x60270700
    .word 0xe8bd600d
    .word 0x477003f0
    .word 0x080962c4
    .word 0xb084b510
    .word 0x90012317
    .word 0xf44f2400
    .word 0xe0000280
    .word 0x00641052
    .word 0xbf184202
    .word 0x0401f084
    .word 0xbf440521
    .word 0x648ef484
    .word 0x0405f084
    .word 0xd1f13b01
    .word 0xa903a801
    .word 0x94032203
    .word 0xffa8f7ff
    .word 0x9801b110
    .word 0xbd10b004
    .word 0x3366f240
    .word 0xa903a801
    .word 0xf2c02202
    .word 0xf7ff0301
    .word 0x2800ff9b
    .word 0xf240d1f1
    .word 0xa80163cc
    .word 0x2202a903
    .word 0x0302f2c0
    .word 0xff90f7ff
    .word 0xbf00e7e7
    .word 0x3df80f00
    .word 0x942073f1
    .word 0xd87c1eed
    .word 0x7f6d1ca9
    .word 0x7dd55d7d
    .word 0x444c5cfd
    .word 0xe5841102
    .word 0xc84d6f58
    .word 0x00705aa1
    .word 0x2dc90e00
    .word 0x013335f9
    .word 0xfa4ba38c
    .word 0xe296752c
    .word 0x05141e1e
    .word 0xa0fb7895
    .word 0xd782ddd6
    .word 0x79a540d5
    .word 0x00900377
    .word 0xae270d00
    .word 0x5e3843a2
    .word 0x1fdea1d9
    .word 0xe6e27bf0
    .word 0x1d1e1e1e
    .word 0x2941e670
    .word 0xb1f93cda
    .word 0xb8da3852
    .word 0x00008898
    .word 0x09230400
    .word 0x9bdeb0ca
    .word 0xfdb44291
    .word 0xe6f25b92
    .word 0x1e270c0c
    .word 0x03666a70
    .word 0xf4974619
    .word 0xf12ceb58
    .word 0x00a041f7
    .word 0x05bb0d00
    .word 0x4a81aaaf
    .word 0x3a07eef2
    .word 0xe4445d4f
    .word 0x2d2e270f
    .word 0xbd708603
    .word 0x3fbc43b3
    .word 0xccc5f7e0
    .word 0x00b05382
    .word 0xf3790400
    .word 0xb571a462
    .word 0x08103171
    .word 0xe0951346
    .word 0x00000000
    .word 0x37bd61e6
    .word 0xfb698522
    .word 0xd4e4b724
    .word 0x003006cc
    .word 0xd4d2bbd2
    .word 0xd1d2e2d2
    .word 0xe9d2e5d2
    .word 0xd7d2bdd2
    .word 0xd5d2c2d2
    .word 0xebd2c0d2
    .word 0xecd2c6d2
    .word 0xe0d2e6d2
    .word 0xc9d2dad2
    .word 0xe4d2c5d2
    .word 0xced2cbd2
    .word 0xc7d2c1d2
    .word 0xd6d2ead2
    .word 0xd3d2edd2
    .word 0xacb0dbd2
    .word 0xe7d2d2d2
    .word 0xdfc9e3d2
    .word 0xddd2e1d2
    .word 0xc4d2ccd2
    .word 0xf9e2f3e9
    .word 0xc4decfd2
    .word 0xeed2d0d2
    .word 0xdfd2c3d2
    .word 0xcdd2efd2
    .word 0xfdd8d7df
    .word 0xdaecc8de
    .word 0xf4e4ddea
    .word 0xc6e5e8d2
    .word 0xb2dcaedf
    .word 0xe4e6bddf
    .word 0xbed2dedf
    .word 0xd9d2bdec
    .word 0xb2deeaf0
    .word 0xd7efe6e0
    .word 0xcad2d7d8
    .word 0xcbe7dcd2
    .word 0xc8d2d8d2
    .word 0xe0f4a2e2
    .word 0xaff4c6ee
    .word 0xeed8e6d8
    .word 0xabd9fdf4
    .word 0xb1dafcdb
    .word 0xe8dcdddb
    .word 0xdadebcd2
    .word 0xc2e2dae1
    .word 0xbbe1c9e0
    .word 0xa8e3f8e2
    .word 0xa5ecbfd2
    .word 0xf0f7ece9
    .word 0xded2d3dc
    .word 0xf9f0eeef
    .word 0xb4f1aff1
    .word 0xf4ede6f2
    .word 0x0000e8f4
.Ldata_20708:
    .word 0x06cc08cc
    .word 0x16660199
    .word 0x0a00fb34
    .word 0xf9340c00
    .word 0x0400f667
    .word 0x09330ad0
    .word 0x04000399
    .word 0x0400fd9a
    .word 0x0399fa00
    .word 0x14000466
    .word 0x08000399
    .word 0xfccd0666
    .word 0x09990000
    .word 0x1c000d99
    .word 0x08cc0400
    .word 0xfc000000
    .word 0x04000266
    .word 0xff340199
.Ldata_20709:
    .word 0x0704110c
    .word 0x1108130a
    .word 0x07040b07
    .word 0x110c150b
    .word 0x07040b07
    .word 0x11080e06
    .word 0x0704170c
    .word 0x0b070907
    .word 0x0704110c
    .word 0x0f071109
    .word 0x07040b07
    .word 0x0e0a130a
    .word 0x0e080b07
    .word 0x11080e06
    .word 0x0e08150b
    .word 0x0b070907
    .word 0x07060504
    .word 0x07050504
.Ldata_20710:
    .word 0x2c691419
    .word 0x164611ec
    .word 0x31121c26
    .word 0x123111f7
    .word 0x36461f20
    .word 0x189d1dcd
    .word 0x3bf8122d
    .word 0x22652267
    .word 0x269b117e
    .word 0x1623115d
    .word 0x2abb1886
    .word 0x13221155
    .word 0x17c01b1c
    .word 0x158219ff
    .word 0x1a30115d
    .word 0x1e141df4
    .word 0x12221679
    .word 0x11ec1f3b
    .word 0xf8b8b8bc
    .word 0xfabbbabc
    .word 0xb0bcc7bc
    .word 0xb4bcc6bc
    .word 0xc3bcf9bb
    .word 0xb6bcadbc
    .word 0xc4bcabbc
    .word 0xbcbccabc
    .word 0xcdbcafbc
    .word 0xe6c6f7bb
    .word 0xa4bcb1bc
    .word 0xc8bcccbc
    .word 0xaebcfdbb
    .word 0xaabca6bc
    .word 0xa3bcb7bc
    .word 0xc5bcbebc
    .word 0xb2bca8bc
    .word 0xc0bca2bc
    .word 0xc9bca9bc
    .word 0xf8bbc1bc
    .word 0xb6eda7bc
    .word 0xb5bca1bc
    .word 0xe5bda5bc
    .word 0xb9bcb4df
    .word 0xfcbbbdbc
    .word 0xacbccbbc
    .word 0xfbbbf7e6
    .word 0xb3bcbbbc
    .word 0xa7e1c2bc
    .word 0xc5f3bfbc
    .word 0xa4f1d2f5
    .word 0xb5dabdd8
    .word 0xabf6dff4
    .word 0xa2f0bfee
    .word 0xaaeacad9
    .word 0xaee9faef
    .word 0xeaf6f3df
    .word 0xf9dcd9f7
    .word 0xe9eafebb
    .word 0xdce7f0dd
    .word 0xb4ecb1f2
    .word 0xd4dbeae9
    .word 0xe1dea5d9
    .word 0xa2d8b8dc
    .word 0xaadee4f7
    .word 0xd5e1d2df
    .word 0xc7f3c1dc
    .word 0xa9e4e2df
    .word 0xabeac0d8
    .word 0xded8ece5
    .word 0xe1e7d5f5
    .word 0xe5eaddf6
    .word 0x0000f7ea
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000600
    .word 0x03000000
    .word 0x00000000
    .word 0x00800108
    .word 0x00180000
    .word 0x000000c0
    .word 0x00600038
    .word 0x00780000
    .word 0x00000060
    .word 0x003060f8
    .word 0x38f80100
    .word 0x0f000030
    .word 0x00380cf8
    .word 0x06fa1f00
    .word 0x1f000018
    .word 0x001887f9
    .word 0x83f81f00
    .word 0x1f000018
    .word 0x001843f8
    .word 0x43f81f00
    .word 0x1f000018
    .word 0x001843f8
    .word 0x83f81f00
    .word 0x1f000018
    .word 0x001886f9
    .word 0x06fa1f00
    .word 0x0f000030
    .word 0x00300cf8
    .word 0x38f80100
    .word 0x00000030
    .word 0x006060f8
    .word 0x00780000
    .word 0x00000060
    .word 0x00c00038
    .word 0x01180000
    .word 0x00000080
    .word 0x00000308
    .word 0x06000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xff010000
    .word 0x000000e0
    .word 0x0060b301
    .word 0xb3010000
    .word 0x00000060
    .word 0x0060b301
    .word 0xff010000
    .word 0x0000fcff
    .word 0x6cf6ff01
    .word 0xb3010000
    .word 0x00006c76
    .word 0x6c76b301
    .word 0xb3010000
    .word 0x0000fc7f
    .word 0xfcffff01
    .word 0xff010000
    .word 0x00006cf6
    .word 0x6c76b301
    .word 0xb3010000
    .word 0x00006c76
    .word 0xfc7fb301
    .word 0xff010000
    .word 0x0000fcff
    .word 0xfcffff01
    .word 0xff010000
    .word 0x00006cf6
    .word 0x6c769e01
    .word 0x9e010000
    .word 0x00006c76
    .word 0x6c769e01
    .word 0x9e010000
    .word 0x00006c76
    .word 0x6c769e01
    .word 0xff010000
    .word 0x0000fcff
    .word 0xfcffff01
    .word 0xff010000
    .word 0x000000c0
    .word 0x00000000
    .word 0x00000000
    .word 0x80082012
    .word 0x47704828
    .word 0x80082004
    .word 0x47704827
    .word 0xb2c0b580
    .word 0xd1052800
    .word 0x4925000a
    .word 0xf7c04825
    .word 0xe004fec3
    .word 0x4922000a
    .word 0xf7c04823
    .word 0x4820febd
    .word 0xb580bd02
    .word 0x491e000a
    .word 0xf7c04820
    .word 0x481cfeb5
    .word 0xb580bd02
    .word 0x2800b2c0
    .word 0x000ad105
    .word 0x481c4918
    .word 0xfeaaf7c0
    .word 0x000ae004
    .word 0x481a4915
    .word 0xfea4f7c0
    .word 0xbd024813
    .word 0xb2c0b580
    .word 0xd1052800
    .word 0x4910000a
    .word 0xf7c04815
    .word 0xe004fe99
    .word 0x490d000a
    .word 0xf7c04812
    .word 0x480bfe93
    .word 0xb580bd02
    .word 0x2800b2c0
    .word 0x000ad105
    .word 0x480e4907
    .word 0xfe88f7c0
    .word 0x000ae004
    .word 0x480b4904
    .word 0xfe82f7c0
    .word 0xbd024802
    .word 0x20001098
    .word 0x20001128
    .word 0x2001c080
    .word 0x080fa6f8
    .word 0x080d1820
    .word 0x080f9e4c
    .word 0x080fa708
    .word 0x080fa718
    .word 0x080fb65c
    .word 0x080fa728
    .word 0xd55d7d7f
    .word 0x83fffd7d
    .word 0x093217df
    .word 0xcde7d14e
    .word 0xd5c6918a
    .word 0x2140c4c4
    .word 0x86554e18
    .word 0x158adcf4
    .word 0x1e1e13a7
    .word 0xec913c3c
    .word 0x5393df92
    .word 0x34ca1830
    .word 0x59c7a2bf
    .word 0x0dba8f67
    .word 0x7d2dd86d
    .word 0x97570a54
    .word 0x3f173970
    .word 0x743c3f3f
    .word 0x24ea7ad2
    .word 0x9aed8533
    .word 0x07ffe11d
    .word 0x12642ebe
    .word 0x9bcfa39d
    .word 0xab8d2315
    .word 0x17808889
    .word 0x3f0c7d3c
    .word 0x9c304274
    .word 0xb9e90dab
    .word 0xd94f2b14
    .word 0xa626bf25
    .word 0x69943160
    .word 0xb28e457f
    .word 0x1a741fcf
    .word 0x0c4d5f15
    .word 0xb0db076f
    .word 0x14a8fa5a
    .word 0x73e02eaf
    .word 0x48d4f5a4
    .word 0x34db0b67
    .word 0x0ffec33b
    .word 0x25c85c7c
    .word 0x0000113b
    .word 0x47e20000
    .word 0x472a369f
    .word 0x1113571b
    .word 0x39618400
    .word 0x72d31b56
    .word 0xb29f5628
    .word 0x4c4d7e4b
    .word 0x000063c0
    .word 0xd55d7d7f
    .word 0x83fffd7d
    .word 0x093217df
    .word 0xcde7d14e
    .word 0xd5c6918a
    .word 0x2140c4c4
    .word 0x86554e18
    .word 0x158adcf4
    .word 0x1e1ee2a7
    .word 0xec950514
    .word 0x5393df92
    .word 0x34ca1830
    .word 0x59c7a2bf
    .word 0x0dba8f67
    .word 0x7d2dd86d
    .word 0x97570a54
    .word 0x1ee63970
    .word 0x701d1e1e
    .word 0x24ea7ad2
    .word 0x9aed8533
    .word 0x07ffe11d
    .word 0x12642ebe
    .word 0x9bcfa39d
    .word 0xab8d2315
    .word 0xe6808889
    .word 0x1e270c0c
    .word 0x9c304270
    .word 0xb9e90dab
    .word 0xd94f2b14
    .word 0xa626bf25
    .word 0x69943160
    .word 0xb28e457f
    .word 0x1a741fcf
    .word 0x2e270fe4
    .word 0xb0db032d
    .word 0x14a8fa5a
    .word 0x73e02eaf
    .word 0x48d4f5a4
    .word 0x34db0b67
    .word 0x0ffec33b
    .word 0x25c85c7c
    .word 0x0000e03b
    .word 0x47e60000
    .word 0x472a369f
    .word 0x1113571b
    .word 0x39618400
    .word 0x72d31b56
    .word 0xb29f5628
    .word 0x4c4d7e4b
    .word 0x000063c0
    .word 0xb2c0b2c9
    .word 0x2000ea51
    .word 0x4770b280
    .word 0x0004b570
    .word 0x2600000d
    .word 0xd01d2c00
    .word 0x7821e00a
    .word 0x1e6d1c64
    .word 0xb2c0b2c9
    .word 0xffecf7ff
    .word 0xf79bb280
    .word 0x1986fd96
    .word 0x00017820
    .word 0x2900b2c9
    .word 0x2d00d00c
    .word 0x1c64d40a
    .word 0xb2c01e6d
    .word 0xd2e82880
    .word 0xb280b2c0
    .word 0xfd85f79b
    .word 0xe7ed1986
    .word 0xbd700030
    .word 0x2200b410
    .word 0x1c52e002
    .word 0x1c521c40
    .word 0x001c7803
    .word 0x2c00b2e4
    .word 0x428ad00a
    .word 0x1c40da08
    .word 0x2b80b2db
    .word 0xb2dbd2f1
    .word 0xd1f02b0a
    .word 0xe0000010
    .word 0xbc100010
    .word 0xb5384770
    .word 0x000d0004
    .word 0x7821e009
    .word 0x1e6d1c64
    .word 0xb2c0b2c9
    .word 0xffb0f7ff
    .word 0xf79bb280
    .word 0x1e6dfd16
    .word 0xd4092d00
    .word 0x1c647820
    .word 0x2880b2c0
    .word 0xb2c0d2ed
    .word 0xf79bb280
    .word 0xe7f2fd0a
    .word 0x0000bd31
    .word 0xebd3dad3
    .word 0xfdd3efd3
    .word 0xf6d3e0d3
    .word 0xead3fcd3
    .word 0xfbd3b6ec
    .word 0xe8d3a4d4
    .word 0xf1d3e3d3
    .word 0xf2d3fad3
    .word 0xf5d3fed3
    .word 0xa2d4eed3
    .word 0xded3a5d4
    .word 0xe0d6dfd3
    .word 0xf7d3f4d3
    .word 0xe9d3f0d3
    .word 0xe4d3a3d4
    .word 0xa1d4edd3
    .word 0xf9d3c5e2
    .word 0xe6d3e2d3
    .word 0xe1d3e5d3
    .word 0xa4e8c7dd
    .word 0xa6d4e7d3
    .word 0xedded8d3
    .word 0xcddaf4e0
    .word 0xecd3dcd3
    .word 0xb9d8d9d3
    .word 0xaed8ddd3
    .word 0xfde5c4da
    .word 0xf8d3e9eb
    .word 0xf3d3c4f3
    .word 0xa7f4a5e6
    .word 0xb9f6a3ec
    .word 0xdbd3ecea
    .word 0xcfecc5ea
    .word 0xdbecd9ec
    .word 0xf5f2bef1
    .word 0xfce1cee1
    .word 0xb6d9f1d8
    .word 0xf6e0a8f4
    .word 0xd2ddd7e2
    .word 0xc0e2f7dd
    .word 0xf7e5d0e3
    .word 0xc1f1f5f0
    .word 0xf6f0a7f6
    .word 0xb2edfae6
    .word 0xc1f0daee
    .word 0xe2f2d6f0
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x1e000000
    .word 0x00000000
    .word 0x0000003f
    .word 0x00807f00
    .word 0x80ff0000
    .word 0xff010000
    .word 0x01000000
    .word 0x000000de
    .word 0x00009c03
    .word 0x08000700
    .word 0x00070000
    .word 0x0e000018
    .word 0x00003800
    .word 0x0078000e
    .word 0xff001c00
    .word 0x011ce0ff
    .word 0x38e0ffff
    .word 0xe0ffff03
    .word 0xffff0138
    .word 0xff0070e0
    .word 0x007ce0ff
    .word 0xfe000078
    .word 0x00003800
    .word 0x001800fe
    .word 0x0800fe00
    .word 0x00fe0000
    .word 0x7c000000
    .word 0x00000000
    .word 0x00000038
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x1e000000
    .word 0x00000000
    .word 0x0000003f
    .word 0x00807f00
    .word 0x80ff0000
    .word 0xff010000
    .word 0x01000000
    .word 0x000000de
    .word 0x00009c03
    .word 0x00000700
    .word 0x00070008
    .word 0x0e000c00
    .word 0x000e0000
    .word 0x0f00000e
    .word 0xff031c00
    .word 0x031c80ff
    .word 0x38c0ffff
    .word 0xe0ffff03
    .word 0xffff0338
    .word 0xff0370c0
    .word 0x007c80ff
    .word 0xfe000f00
    .word 0x000e0000
    .word 0x0c0000fe
    .word 0x0000fe00
    .word 0x00fe0008
    .word 0x7c000000
    .word 0x00000000
    .word 0x00000038
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x0000001e
    .word 0x00003f00
    .word 0x807f0000
    .word 0xff000000
    .word 0x01000080
    .word 0x000000ff
    .word 0x0000fe01
    .word 0x009c0300
    .word 0x00070000
    .word 0x07000000
    .word 0x00000000
    .word 0x0000000e
    .word 0x00000e00
    .word 0x001c0000
    .word 0x1c000000
    .word 0x00000000
    .word 0x00000038
    .word 0x00003800
    .word 0x00700000
    .word 0x7c000000
    .word 0x00000000
    .word 0x000000fe
    .word 0x0000fe00
    .word 0x00fe0000
    .word 0xfe000000
    .word 0x00000000
    .word 0x0000007c
    .word 0x00003800
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11010000
    .word 0x11111111
    .word 0x00111111
    .word 0x22222201
    .word 0x22222222
    .word 0x22010021
    .word 0x22223223
    .word 0x00212244
    .word 0x32232201
    .word 0x22445255
    .word 0x22010021
    .word 0x52552222
    .word 0x00212222
    .word 0x66332201
    .word 0x22442422
    .word 0x23010021
    .word 0x55556533
    .word 0x00214466
    .word 0x55362301
    .word 0x44565555
    .word 0x23010021
    .word 0x55555536
    .word 0x00214456
    .word 0x55362301
    .word 0x44565555
    .word 0x22010021
    .word 0x55555533
    .word 0x00214456
    .word 0x55222201
    .word 0x42545555
    .word 0x22010021
    .word 0x55552522
    .word 0x00212266
    .word 0x22222201
    .word 0x22222222
    .word 0x11010021
    .word 0x11111111
    .word 0x00111111
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11010000
    .word 0x11111111
    .word 0x00111111
    .word 0x22222201
    .word 0x22222222
    .word 0x22010021
    .word 0x22222222
    .word 0x00212222
    .word 0x33222201
    .word 0x22424422
    .word 0x22010021
    .word 0x44223322
    .word 0x00212242
    .word 0x22222201
    .word 0x22222222
    .word 0x22010021
    .word 0x44543523
    .word 0x00212244
    .word 0x35332201
    .word 0x42444444
    .word 0x22010021
    .word 0x44445533
    .word 0x00214244
    .word 0x55332201
    .word 0x42444444
    .word 0x22010021
    .word 0x44445533
    .word 0x00214244
    .word 0x33232201
    .word 0x42444444
    .word 0x22010021
    .word 0x44242222
    .word 0x00212244
    .word 0x22222201
    .word 0x22222222
    .word 0x11010021
    .word 0x11111111
    .word 0x00111111
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11010000
    .word 0x11111111
    .word 0x00111111
    .word 0x22222201
    .word 0x22222222
    .word 0x23010021
    .word 0x11323334
    .word 0x00211111
    .word 0x44442401
    .word 0x11111142
    .word 0x24010021
    .word 0x11424444
    .word 0x00211111
    .word 0x44442401
    .word 0x11111142
    .word 0x24010021
    .word 0x11424444
    .word 0x00211111
    .word 0x22222201
    .word 0x22222222
    .word 0x21010021
    .word 0x55121111
    .word 0x00215555
    .word 0x11112101
    .word 0x55555512
    .word 0x21010021
    .word 0x55121111
    .word 0x00215555
    .word 0x11112101
    .word 0x55555512
    .word 0x21010021
    .word 0x55121111
    .word 0x00215555
    .word 0x22222201
    .word 0x22222222
    .word 0x11010021
    .word 0x11111111
    .word 0x00111111
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11010000
    .word 0x11111111
    .word 0x00111111
    .word 0x22222201
    .word 0x44443322
    .word 0x22010021
    .word 0x55232222
    .word 0x00212244
    .word 0x22222201
    .word 0x22425423
    .word 0x22010041
    .word 0x44232222
    .word 0x00412422
    .word 0x22222201
    .word 0x45224223
    .word 0x22010031
    .word 0x42122222
    .word 0x00315524
    .word 0x21222201
    .word 0x33332311
    .word 0x22010021
    .word 0x12111122
    .word 0x00212222
    .word 0x11212201
    .word 0x22222211
    .word 0x22010021
    .word 0x22121111
    .word 0x00212222
    .word 0x11112101
    .word 0x22222222
    .word 0x21010021
    .word 0x22221211
    .word 0x00212222
    .word 0x22112201
    .word 0x22222222
    .word 0x11010021
    .word 0x11111111
    .word 0x00111111
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xaeb8f2b7
    .word 0xb4b8feb7
    .word 0xbab8b8b8
    .word 0xa3b8b1b8
    .word 0xb6b8bbb8
    .word 0xbdb8beb8
    .word 0xf9b7f0b7
    .word 0xfbb7fcb7
    .word 0xafb8b0b8
    .word 0xf6b7a1b8
    .word 0xa7b8b9b8
    .word 0xf4b7b2b8
    .word 0xa5b8b3b8
    .word 0xa8b8b5b8
    .word 0xa6b8f7b7
    .word 0xabb8a9b8
    .word 0xc0b8bfb8
    .word 0xa4b8acb8
    .word 0xf3b7fdb7
    .word 0xbddcb7b8
    .word 0xdae6aab8
    .word 0xebd9adb8
    .word 0xf8b7f5b7
    .word 0xbcb8a2b8
    .word 0xf5e8fab7
    .word 0xc0dcddf2
    .word 0xf2dcdedc
    .word 0xcaddb3dd
    .word 0xf6e2a5e1
    .word 0xe6e4d4de
    .word 0xf5e5ebed
    .word 0xa6e7eff4
    .word 0xc3f5a8e7
    .word 0xc9edf0ec
    .word 0xb7eeeaed
    .word 0xc6f5b6f2
    .word 0xbbdff0f2
    .word 0xaedbecd9
    .word 0xe2e6fbef
    .word 0xa5f0e7ea
    .word 0xd6f6f3f2
    .word 0x0000fbf6
.Ldata_20711:
    .word 0x0e500000
    .word 0x18c9143d
    .word 0x20001c9f
    .word 0x25dd230e
    .word 0x2aef287a
    .word 0x2f772d41
    .word 0x33993193
    .word 0x376d358c
    .word 0x3b01393e
    .word 0x3e613cb7
    .word 0x41954000
    .word 0x44a24320
    .word 0x478e461c
    .word 0x4a5d48f9
    .word 0x4d114bba
    .word 0x4fae4e62
    .word 0x523650f4
    .word 0x54aa5372
    .word 0x570d55dd
    .word 0x595f5838
    .word 0x5ba25a82
    .word 0x5dd85cbf
    .word 0x60005eed
    .word 0x621c6110
    .word 0x642d6326
    .word 0x66336531
    .word 0x682f6732
    .word 0x6a22692a
    .word 0x6c0b6b18
    .word 0x6dec6cfd
    .word 0x6fc56eda
    .word 0x719770af
    .word 0x7361727d
    .word 0x75247443
    .word 0x76e07603
    .word 0x789677bc
    .word 0x7a46796e
    .word 0x7bef7b1b
    .word 0x7d947cc2
    .word 0x7f337e64
    .word 0x00007fff
    .word 0xedc0efc0
    .word 0xfbc0a6c1
    .word 0xeec0a2c1
    .word 0xebc0fac0
    .word 0xf1c0fdc0
    .word 0xf8c0f6c0
    .word 0xf7c0e8c0
    .word 0xf2c0a7c1
    .word 0xd2f3a8c1
    .word 0xfec0a3c1
    .word 0xf5c0ecc0
    .word 0xe6c0eac0
    .word 0xf4c0a5c1
    .word 0xe9c0a4c1
    .word 0xe7c0e5c0
    .word 0xbeeea8f6
    .word 0xe5ecb0dd
    .word 0xb5d9f0c0
    .word 0xbcdec2ed
    .word 0xdbf2b3d9
    .word 0xaadbf3f7
    .word 0xc0e8a1c1
    .word 0xb2e6cee5
    .word 0xeae6baee
    .word 0xaff7f3c0
    .word 0xbff0ace0
    .word 0xbbf3cbe6
    .word 0xe2f6aad8
    .word 0xdedba6e3
    .word 0xf9c0c2dc
    .word 0xbfdfbade
    .word 0xfbe1a6e0
    .word 0xa2e5e0e4
    .word 0xf6e9dde8
    .word 0xfcc0f1dd
    .word 0xddf0cae7
    .word 0xc3f2dff0
    .word 0xf6f3aeef
    .word 0xc8f5cff4
    .word 0x0000b7f5
    .word 0xbbd6aed6
    .word 0xc1d6aad6
    .word 0xb1d6c6d6
    .word 0xb8d6ced6
    .word 0xbed6a7d6
    .word 0xc2d6b0d6
    .word 0xafd6b5d6
    .word 0xb9d6bdd6
    .word 0xb4d6cad6
    .word 0xc3d6c7d6
    .word 0xa6d6b7d6
    .word 0xb2d6c8d6
    .word 0xcdd6bcd6
    .word 0xc4d6e7e1
    .word 0xbfd6c9d6
    .word 0xc0d6add6
    .word 0xa5d6b3d6
    .word 0xabd6a8d6
    .word 0xc5d6acd6
    .word 0xcfd6b6d6
    .word 0xbad6a9d6
    .word 0xccd6cbd6
    .word 0xc6dcebe5
    .word 0xd7e8cee8
    .word 0xe4e8dcf5
    .word 0xd9e8f9e0
    .word 0xf9e9edec
    .word 0xebf0deea
    .word 0xb4d8f4f5
    .word 0xfadbf2e9
    .word 0xa4dbecda
    .word 0xe5e2e9ed
    .word 0xefe6e9e5
    .word 0xfddea5f5
    .word 0xc5f5eaf4
    .word 0xf4eff9eb
    .word 0xd5ebbaf0
    .word 0xd9f5cef2
    .word 0xa3f6f3ec
    .word 0x00000000
    .word 0xb5cff7ce
    .word 0xa3cfa2cf
    .word 0xafcfb2cf
    .word 0xb8cfb0cf
    .word 0xfcceb7cf
    .word 0xa7cfb4cf
    .word 0xa4cfa1cf
    .word 0xa6cff6ce
    .word 0xaecffece
    .word 0xf5cef4ce
    .word 0xaacfe2d9
    .word 0xfbceb6cf
    .word 0xfacefdce
    .word 0xd8e9b1cf
    .word 0xa5cfa8cf
    .word 0xaccfaddb
    .word 0xd8eafbec
    .word 0xcbf4c9de
    .word 0xf1dfe8f5
    .word 0xd2e6c0e4
    .word 0xabcfaaf0
    .word 0xe7dce3e1
    .word 0xe4ecf4e7
    .word 0xe2f4a9cf
    .word 0xefe5acf3
    .word 0xbbe4adcf
    .word 0xb6f1d2d9
    .word 0xf4dae1f2
    .word 0xa3f3eaea
    .word 0xbeddb3cf
    .word 0xfbdddfdd
    .word 0xf9ceb8f4
    .word 0xf8ced1f4
    .word 0xa4ecb5f5
    .word 0xa8ecfbf7
    .word 0xd2e3bee2
    .word 0xaaf4f9ec
    .word 0x00000000
    .word 0xe4c6f0c6
    .word 0xf8c6dac6
    .word 0xe6c6dfc6
    .word 0xf3c6dec6
    .word 0xfbc6f7c6
    .word 0xebc6e5c6
    .word 0xfac6ecc6
    .word 0xefc6f4c6
    .word 0xe7c6dbc6
    .word 0xddc6f1c6
    .word 0xfcc6e0c6
    .word 0xf7e7f5c6
    .word 0xedc6f2c6
    .word 0xf9c6e1c6
    .word 0xdcc6eac6
    .word 0xf7ece3c6
    .word 0xeec6e9c6
    .word 0xe8f5f9e7
    .word 0xacedf6c6
    .word 0xe0e3bfe4
    .word 0xb2e7bdd8
    .word 0xd2e0fdc6
    .word 0xc2ddaae1
    .word 0xbde8b9d9
    .word 0xf9dccedc
    .word 0xcae9c8ea
    .word 0xbbdcfdf1
    .word 0xa5eca8e1
    .word 0xecf4e7e8
    .word 0xd3f2bddd
    .word 0xebf4e0f2
    .word 0xe8f7a2f7
    .word 0xe2c6adde
    .word 0xebe6c1d8
    .word 0xe8c6dddd
    .word 0xd3eddfdb
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11111101
    .word 0x00111111
    .word 0x23222201
    .word 0x00333333
    .word 0x23222201
    .word 0x00343333
    .word 0x23222201
    .word 0x00343333
    .word 0x23222201
    .word 0x00443333
    .word 0x11111101
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333300
    .word 0x00101111
    .word 0x31330300
    .word 0x00001111
    .word 0x31330000
    .word 0x00001011
    .word 0x31000000
    .word 0x00000010
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x11111101
    .word 0x00111111
    .word 0x23222201
    .word 0x00333333
    .word 0x23222201
    .word 0x00343333
    .word 0x23222201
    .word 0x00343333
    .word 0x23222201
    .word 0x00443333
    .word 0x11111101
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333303
    .word 0x00111111
    .word 0x31333300
    .word 0x05101111
    .word 0x31330300
    .word 0x05001111
    .word 0x31330000
    .word 0x05051011
    .word 0x31000000
    .word 0x05050510
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00101111
    .word 0x00000000
    .word 0x11111111
    .word 0x00000010
    .word 0x22221101
    .word 0x00001121
    .word 0x22221100
    .word 0x10212222
    .word 0x22110000
    .word 0x21422232
    .word 0x12010010
    .word 0x42223322
    .word 0x01001122
    .word 0x42322212
    .word 0x00112242
    .word 0x32221201
    .word 0x11224242
    .word 0x22120100
    .word 0x22422432
    .word 0x11000011
    .word 0x42223222
    .word 0x00001021
    .word 0x22222211
    .word 0x00102122
    .word 0x22110100
    .word 0x00112122
    .word 0x11000000
    .word 0x10111111
    .word 0x00000000
    .word 0x10111100
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe4bcfbbc
    .word 0xa8bdfebc
    .word 0xe1bcf2bc
    .word 0xf5bce0bc
    .word 0xecbca5bd
    .word 0xe6bca1bd
    .word 0xe8bca3bd
    .word 0xfcbce7bc
    .word 0xe2bcf6bc
    .word 0xf4bcf8bc
    .word 0xe9bcf9bc
    .word 0xfdbcf1bc
    .word 0xf0bca2bd
    .word 0xa6bdfabc
    .word 0xf3bce5bc
    .word 0xeebcf7bc
    .word 0xeabcdfbc
    .word 0xe3bcebbc
    .word 0xc9daedbc
    .word 0xd4d9bfe5
    .word 0xd1dda7bd
    .word 0xefbcc0e5
    .word 0xb5effaed
    .word 0xa6eba4bd
    .word 0xb5f7e4f6
    .word 0xf6def3dd
    .word 0xeee0d9da
    .word 0xcce7d5e4
    .word 0xafeac5e8
    .word 0xf9eaa7ea
    .word 0xc8f3d0f1
    .word 0xc2f5e5f4
    .word 0xf0eaa5e9
    .word 0xecebcff0
    .word 0x0000ddf5
    .word 0xd4d1dbd1
    .word 0xddd1cfd1
    .word 0xccd1d0d1
    .word 0xd3d1e9d1
    .word 0xdad1d8d1
    .word 0xe1d1d5d1
    .word 0xe0d1d7d1
    .word 0xe7d1d6d1
    .word 0xcad1ced1
    .word 0xe3d1d2d1
    .word 0xded1e6d1
    .word 0xcdd1c9d1
    .word 0xcbd1dcd1
    .word 0xe8d1d9d1
    .word 0xdce9b2d9
    .word 0xe5d1d1d1
    .word 0xcdece7eb
    .word 0xe4d1ccea
    .word 0xe2d1fbe5
    .word 0xd9ebcce6
    .word 0xdbf3cee4
    .word 0xcdd8dfd1
    .word 0xfaf7d0f7
    .word 0xc8d9bedc
    .word 0xc6e3caf7
    .word 0xc9d8c3e1
    .word 0xfbe2dfd8
    .word 0xf0d9d5e3
    .word 0xfce7b1db
    .word 0xb3dbbbee
    .word 0xd9e4ddda
    .word 0xfcf7e7da
    .word 0xcedda6f5
    .word 0x00000000
    .word 0xb1cac7ca
    .word 0xc2caaeca
    .word 0xb9cab5ca
    .word 0xd0cac0ca
    .word 0xbccab6ca
    .word 0xa6cabfca
    .word 0xbdcaabca
    .word 0xb7caa7ca
    .word 0xbecad3ca
    .word 0xd2cab3ca
    .word 0xd4cac6ca
    .word 0xcdcaafca
    .word 0xcacaa9ca
    .word 0xbbcacfca
    .word 0xaccaceca
    .word 0xc5cab0ca
    .word 0xc4caaaca
    .word 0xc8caa8ca
    .word 0xead0b4ca
    .word 0xcccabaca
    .word 0xc5d6d7b3
    .word 0xd1cacbca
    .word 0xf8e9c1ca
    .word 0xc9cab8ca
    .word 0xadcac3ca
    .word 0xe9ddb1df
    .word 0xaaddf5db
    .word 0xd6dac2ec
    .word 0xb9f5e5f6
    .word 0xe6eedbea
    .word 0xc2f3a7f3
    .word 0xf5f6dff3
    .word 0x0000a7f5
    .word 0xe5cedece
    .word 0xf1ceefce
    .word 0xe7cee4ce
    .word 0xb6ece8ce
    .word 0xf1b6f3ce
    .word 0xddcee2ce
    .word 0xf2cee9ce
    .word 0xdbcee1ce
    .word 0xedcedace
    .word 0xe6ceeace
    .word 0xe3ced7ce
    .word 0xdcced8ce
    .word 0xe0cef0ce
    .word 0xecceebce
    .word 0xeddfa3d8
    .word 0xdfceeece
    .word 0xd9cecdf0
    .word 0xedf0fce5
    .word 0xe8e2c4f0
    .word 0xf0e6bbe5
    .word 0xf5eaf9da
    .word 0xd8dbf9f7
    .word 0xf5d8b4e4
    .word 0xccdce3da
    .word 0xc4e6d0e2
    .word 0xbbe8e4e2
    .word 0xdaf2c9ec
    .word 0xc8f6c3e5
    .word 0x00000000
.Ldata_20714:
    .word 0x7fff0000
    .word 0x2aaa4000
    .word 0x19992000
    .word 0x12491555
    .word 0x0e381000
    .word 0x0ba20ccc
    .word 0x09d80aaa
    .word 0x08880924
    .word 0x07870800
    .word 0x06bc071c
    .word 0x06180666
    .word 0x059005d1
    .word 0x051e0555
    .word 0x04bd04ec
    .word 0x04690492
    .word 0x04210444
    .word 0x03e00400
    .word 0x03a803c3
    .word 0x0375038e
    .word 0x0348035e
    .word 0x031f0333
    .word 0x02fa030c
    .word 0x02d802e8
    .word 0x02b902c8
    .word 0x029c02aa
    .word 0x0282028f
    .word 0x026a0276
    .word 0x0253025e
    .word 0x00000249
    .word 0xd8b1c8b1
    .word 0xcfb1cab1
    .word 0xdcb1d2b1
    .word 0xc7b1d5b1
    .word 0xc6b1cbb1
    .word 0xdbb1dab1
    .word 0xccb1d7b1
    .word 0xd0b1c9b1
    .word 0xd3b1ceb1
    .word 0xb5e8b0d8
    .word 0xddb1d6b1
    .word 0xf7f3f6e5
    .word 0xb9e3bee6
    .word 0xfee5d4b1
    .word 0xe9eea8e5
    .word 0xc2d9d4f1
    .word 0xc9ddc2f7
    .word 0xd9dfb5de
    .word 0xd8e2f9e1
    .word 0xe4e4f5ef
    .word 0xd1b1b0f4
    .word 0xd4e6c1df
    .word 0xdaeacdb1
    .word 0xa9ddafee
    .word 0xd9f3fddb
    .word 0xc5dcebf3
    .word 0xcff5c5f4
    .word 0x0000eadc
    .word 0xddbed6be
    .word 0xe4bed3be
    .word 0xdfbed9be
    .word 0xdebee7be
    .word 0xdcbedbbe
    .word 0xe0bee3be
    .word 0xd5bee5be
    .word 0xd8bed0be
    .word 0xd4bedbbd
    .word 0xd7becfbe
    .word 0xc4f6dabe
    .word 0xe6bee2be
    .word 0xf2f4abec
    .word 0xe1f5e4de
    .word 0xe1e5e1be
    .word 0xc6d9d9e9
    .word 0xb4f6d2be
    .word 0xf8eaf0e5
    .word 0xd2eed5f1
    .word 0xc2f6dadc
    .word 0xa7e9b6f7
    .word 0xc4dcaada
    .word 0xd1beb8ef
    .word 0xecdcb0e9
    .word 0xb7e9dbe8
    .word 0xb6f5c0f1
    .word 0x0000a2e8
.Ldata_20715:
    .word 0x0b040a54
    .word 0x0e6c0c63
    .word 0x14631119
    .word 0x1ca1183e
    .word 0x26c4217d
    .word 0x32522c66
    .word 0x3ec13876
    .word 0x4b7c451f
    .word 0x57ec51c7
    .word 0x637a5dd8
    .word 0x6d9d68c1
    .word 0x75db71ff
    .word 0x7bd17924
    .word 0x7f397ddb
    .word 0x00007fea
.Ldata_20716:
    .word 0x0bdaee98
    .word 0x71ec4c98
    .word 0x0bda4c98
.Ldata_20718:
    .word 0x08a60471
    .word 0x14f00e25
    .word 0x261c1cf9
    .word 0x3ac13021
    .word 0x506545a3
    .word 0x63e85a9f
    .word 0x722a6bde
    .word 0x78c17686
    .word 0xfdcae9ca
    .word 0xf4caf5ca
    .word 0xf7cae4ca
    .word 0xeccaf6ca
    .word 0xf0caf8ca
    .word 0xe6cae2ca
    .word 0xf3cae5ca
    .word 0xe7cae8ca
    .word 0xedcae3ca
    .word 0xeecae1ca
    .word 0xf1cafaca
    .word 0xfbcaa1cb
    .word 0xfecaebca
    .word 0xe1d3e0ca
    .word 0xf2caeaca
    .word 0xefcadfca
    .word 0xfccabfd9
    .word 0xd3dbf9ca
    .word 0xade6f8e4
    .word 0xf8efa3e7
    .word 0xafeca8eb
    .word 0xc4dde2f1
    .word 0xf0e3add8
    .word 0xf2ebf3de
    .word 0x00000000
    .word 0xa1d7f7d6
    .word 0xfad6a2d7
    .word 0xf0d6f8d6
    .word 0xecd6eed6
    .word 0xe9d6a4d7
    .word 0xedd6a3d7
    .word 0xf1d6fed6
    .word 0xf6d6f3d6
    .word 0xf2d6f9d6
    .word 0xead6fdd6
    .word 0xebd6f5d6
    .word 0xf4d6f9d8
    .word 0xa8e4fcd6
    .word 0xd2f1efd6
    .word 0xe7f3f9ee
    .word 0xefdcfbd6
    .word 0xeef5c4ec
    .word 0xcce8c3f3
    .word 0xbee4e3f4
    .word 0xe6f7f3e4
    .word 0xcde9c6e9
    .word 0xaad9d1dc
    .word 0xe6f0f1f0
    .word 0xb6f4a5db
    .word 0x00000000
.Ldata_20719:
    .byte 0x85
    .byte 0x0b
    .byte 0x5c
    .byte 0x0f
    .byte 0x85
    .byte 0x0b
    .byte 0x5c
    .byte 0x0f
    .byte 0x7a
    .byte 0x14
    .byte 0x5c
    .byte 0x0f
    .byte 0x85
    .byte 0x0b
    .byte 0x5c
    .byte 0x0f
    .word 0x00000b85
.Ldata_20728:
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x10
    .word 0x13331000
    .word 0x20001999
    .word 0x2ccc2666
    .word 0x36663333
    .word 0x3ccc3999
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x40004000
    .word 0x39994000
    .word 0x2ccc3333
    .word 0x20002666
    .word 0xd3bcd2bc
    .word 0xd9bcdbbc
    .word 0xd7bcdcbc
    .word 0xddbcd1bc
    .word 0xdebcd0bc
    .word 0xd6bccebc
    .word 0xd1c7dabc
    .word 0xaed0aed9
    .word 0xa8f0d5bc
    .word 0xcfbcc4bd
    .word 0xa9eaece7
    .word 0xa4d9c8e5
    .word 0xe8f0a4e4
    .word 0xd5f3ceeb
    .word 0xe7ddd4bc
    .word 0xd8efd8bc
    .word 0xa3dbc5d8
    .word 0xb5e1d8de
    .word 0xd0e4e8e1
    .word 0xc2f4b8eb
    .word 0xa2edfdf0
    .word 0xcaf1f2ee
    .word 0xcaf5ccf2
    .word 0x00000000
    .word 0xbbbdccbd
    .word 0xa3d0f5be
    .word 0xcfbdd0bd
    .word 0xc5bdc7bd
    .word 0xbebdb9bd
    .word 0xcebdbcbd
    .word 0xc0bdc1bd
    .word 0xc9bdbabd
    .word 0xc8bdcabd
    .word 0xc3bdb7bd
    .word 0xaed9bfbd
    .word 0xbdbdc6bd
    .word 0xafe6d3f5
    .word 0xcbbdd1bd
    .word 0xa8f0c4bd
    .word 0xcdbdb6bd
    .word 0xdef6b8bd
    .word 0xd0e4e8e1
    .word 0xd5d9b8eb
    .word 0xbde1d4f0
    .word 0xc2bdd4f2
    .word 0xfadcb4dc
    .word 0xdde0d8de
    .word 0x0000b4f5
    .word 0xf1b7fac5
    .word 0xa8c6a4c6
    .word 0xa3c6fbc5
    .word 0xa1c6d9b1
    .word 0xa5c6a2c6
    .word 0xfcc5a7c6
    .word 0xf7c5a9c6
    .word 0xb1f1a6c6
    .word 0xfec5fdc5
    .word 0xe8e0f9c5
    .word 0xafdbc7e6
    .word 0xa2e7d4f1
    .word 0xb1dca7d8
    .word 0xb7f2dcdb
    .word 0xf9f5e7f2
    .word 0xf0dae9da
    .word 0xf2d8f8c5
    .word 0xa8dffddb
    .word 0xcfe2c1df
    .word 0xe2f1fcda
    .word 0xc1e8c5dc
    .word 0xc4e4bcee
    .word 0xb6eaebee
    .word 0x0000a2ee
    .word 0xc8cfd6cf
    .word 0xdfcfd4cf
    .word 0xdecfd5cf
    .word 0xcacfd8cf
    .word 0xd0cfd7cf
    .word 0xddcfdccf
    .word 0xc9cfcdcf
    .word 0xcccfd3cf
    .word 0xc6cfdbcf
    .word 0xcbcfd2cf
    .word 0xcecfb5e6
    .word 0xd1cfdacf
    .word 0xd9cfcfcf
    .word 0xdfe5d0f5
    .word 0xfde1ade1
    .word 0xdaf3b9f2
    .word 0xb2ddd1f5
    .word 0xc2f0c7cf
    .word 0xb3cfeff0
    .word 0xececafeb
    .word 0xfed9ccf4
    .word 0xa3f5bade
    .word 0xdeecc8dc
    .word 0x0000b1f6
    .word 0xa4bbf5ba
    .word 0xfabaf4ba
    .word 0xfebaa7bb
    .word 0xa5bbf6ba
    .word 0xa2bbfdba
    .word 0xfcbaf8ba
    .word 0xb1e3a6bb
    .word 0xa3bbb0e4
    .word 0xa1bbf9ba
    .word 0xf1e0fbba
    .word 0xfaf5f7ba
    .word 0xa9e2efec
    .word 0xadf5c0f0
    .word 0xe8ece6ec
    .word 0xcbf3fcdf
    .word 0xefe4fae7
    .word 0xf5e9c9f0
    .word 0xfcd9c3ec
    .word 0xefe2b2e1
    .word 0xcee9bdf7
    .word 0xadf0b2ec
    .word 0xceecd7f0
    .word 0x00000000
    .word 0xaec7b0c7
    .word 0xa9c7a7c7
    .word 0xa3c7b7c7
    .word 0xb1c7b3c7
    .word 0xabc7a8c7
    .word 0xb8c7b2c7
    .word 0xb6c7cbcf
    .word 0xb4c7acc7
    .word 0xaff2a6c7
    .word 0xb9e5afc7
    .word 0xb5c7bbd9
    .word 0xe7deadc7
    .word 0xb7dca5e3
    .word 0xa9edd7e7
    .word 0xcddca1dd
    .word 0xddd9e4da
    .word 0xbde5bae5
    .word 0xa5c7c9eb
    .word 0xf9eaaac7
    .word 0xa9e1d4ee
    .word 0xdcf7e9f3
    .word 0xbbe3a4c7
    .word 0x0000fde8
    .word 0x00000000
    .word 0x00000000
    .word 0x05000000
    .word 0x00000054
    .word 0x00405555
    .word 0x50015001
    .word 0x00000500
    .word 0x02050014
    .word 0x14001400
    .word 0x00058002
    .word 0x05a00214
    .word 0xa0021400
    .word 0x02140005
    .word 0x05000580
    .word 0x00140002
    .word 0x14000005
    .word 0x01500100
    .word 0x55000050
    .word 0x00004055
    .word 0x00005405
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x05000000
    .word 0x00000054
    .word 0x00405555
    .word 0x50015001
    .word 0x00000500
    .word 0x02050014
    .word 0x14001400
    .word 0x00058002
    .word 0x05a00214
    .word 0xa0021400
    .word 0x02140005
    .word 0x05000580
    .word 0x00140002
    .word 0x14000005
    .word 0x01500100
    .word 0x55000050
    .word 0x00004055
    .word 0x00005405
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xe2bde7bd
    .word 0xe1bdd3bd
    .word 0xd6bddabd
    .word 0xd7bde3bd
    .word 0xe8bde9bd
    .word 0xdcbde4bd
    .word 0xd4bdecbd
    .word 0xd8bdddbd
    .word 0xd2bde0bd
    .word 0xdfbdd9bd
    .word 0xdebde5bd
    .word 0xb5e0ebbd
    .word 0xdde6d7de
    .word 0xd5bdd9ed
    .word 0xeee8b5da
    .word 0xcad9e6bd
    .word 0xa6daa1f2
    .word 0xeabddcf0
    .word 0xc9f4bce6
    .word 0xbbf2daf6
    .word 0xaee0baf7
    .word 0x00000000
    .word 0xbdc2b7c2
    .word 0xacc2bcc2
    .word 0xb3c2b6c2
    .word 0xb9c2afc2
    .word 0xaec2b5c2
    .word 0xe0e0abc2
    .word 0xbbc2adc2
    .word 0xb1c2a4ea
    .word 0xb4c2b2c2
    .word 0xb8c2f2e3
    .word 0xbec2f5e4
    .word 0xf1e9fcf3
    .word 0xb0c2d8f0
    .word 0xd4f6bac2
    .word 0xd3e8a3df
    .word 0xcdebe4db
    .word 0xcbe4a4de
    .word 0xd6e5b5f0
    .word 0xfbe9b4e8
    .word 0xe5efd6e9
    .word 0xaaebb5f4
    .word 0x00000000
    .word 0xd6d3d0d3
    .word 0xd1d3c9d3
    .word 0xd2d3ced3
    .word 0xc5d3cdd3
    .word 0xc4d3cad3
    .word 0xc7d3c8d3
    .word 0xc6d3ccd3
    .word 0xd5d3d7d3
    .word 0xeef7d3d3
    .word 0xcfdffcd8
    .word 0xd6e8cfd3
    .word 0xacddcff6
    .word 0xf8f7f3e0
    .word 0xd5d8cbd3
    .word 0xbbebe0e9
    .word 0xe0f0f0ee
    .word 0xf6f2c4f2
    .word 0xf8f2d4d3
    .word 0xafddedf4
    .word 0xb5dda7d9
    .word 0xcaf2b6e5
    .word 0x0000ccde
    .word 0x00000000
    .word 0x55551500
    .word 0xaa1a5055
    .word 0x1a90aaaa
    .word 0x90aaaaaa
    .word 0xaafeaa1a
    .word 0xfeaa1a90
    .word 0xaa1a90aa
    .word 0x1a90aaaa
    .word 0x90aaffab
    .word 0xeaffaf1a
    .word 0xffaf1a90
    .word 0xaf1a90ea
    .word 0x1a90eaff
    .word 0x90eaffaf
    .word 0xeaffaf1a
    .word 0xffab1a90
    .word 0xaa1a90aa
    .word 0x1590aaaa
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0xaa1a5055
    .word 0x1a90aaaa
    .word 0x90aaaaaa
    .word 0xfeebbf1a
    .word 0xbbba1a90
    .word 0xba1a90ae
    .word 0x1a90aabb
    .word 0x90aabbba
    .word 0xaaebbf1a
    .word 0xabba1a90
    .word 0xba1a90aa
    .word 0x1a90aaab
    .word 0x90aaabba
    .word 0xaeabba1a
    .word 0xabba1a90
    .word 0xaa1a90fe
    .word 0x1590aaaa
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0xaa1a5055
    .word 0x1a90aaaa
    .word 0x90aafaaa
    .word 0xaafaaa1a
    .word 0xfaaa1a90
    .word 0xaa1a90aa
    .word 0x1a90aafa
    .word 0x90aafaaa
    .word 0xaafaaa1a
    .word 0xfaaa1a90
    .word 0xaa1a90aa
    .word 0x1a90aafa
    .word 0x90aaaaaa
    .word 0xaafaaa1a
    .word 0xfaaa1a90
    .word 0xaa1a90aa
    .word 0x1590aaaa
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0x00105055
    .word 0x10100000
    .word 0x103ca000
    .word 0xffa80210
    .word 0xa8021010
    .word 0x021010ff
    .word 0x10103ca8
    .word 0x1000a802
    .word 0xa0a8a210
    .word 0xa0a01010
    .word 0x281010a0
    .word 0x10108002
    .word 0x1000aa0a
    .word 0x00a80210
    .word 0xa0001010
    .word 0x00101000
    .word 0x151000a0
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0xaa1a5055
    .word 0x1a90aaaa
    .word 0x90aaaaaa
    .word 0xfeffff1a
    .word 0xffbf1b90
    .word 0xef1b90fb
    .word 0x1b90efff
    .word 0x90bffffb
    .word 0xfffefe1b
    .word 0xabfb1b90
    .word 0xef1b90bf
    .word 0x1b90efff
    .word 0x90fbffbf
    .word 0xfeffff1a
    .word 0xaaaa1a90
    .word 0xaa1a90aa
    .word 0x1590aaaa
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0xaf1a5055
    .word 0x1a90aafe
    .word 0x90ebffff
    .word 0xffbffa1a
    .word 0xabaa1b90
    .word 0xaa1a90ff
    .word 0x1a90ffab
    .word 0x90ffabaa
    .word 0xff6f5519
    .word 0xaa551990
    .word 0x551990aa
    .word 0x1990aaaa
    .word 0x90a9aa55
    .word 0x965a5519
    .word 0x55a51990
    .word 0xaa1a9056
    .word 0x15906a55
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x55551500
    .word 0xaa1b5055
    .word 0x1f90aaaa
    .word 0x90aaaaea
    .word 0xaaaafa1f
    .word 0xaafe1f90
    .word 0xff1f90aa
    .word 0x1b90aaaa
    .word 0x90aaaafa
    .word 0xaaabfe1b
    .word 0xabfe1a90
    .word 0xff1a90ea
    .word 0x1a90faab
    .word 0x90feebbf
    .word 0xffffaf1a
    .word 0xffab1a90
    .word 0xaa1ad0ff
    .word 0x1590ffbf
    .word 0x50555555
    .word 0x00000000
    .word 0x00000000
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaafaaa6a
    .word 0xfaab6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aafa
    .word 0xa4aafaaa
    .word 0xaafaaa6a
    .word 0xfaaa6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aafa
    .word 0xa4aafaaa
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaafeab6a
    .word 0xafaf6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aaafaa
    .word 0xaabeaa6a
    .word 0xfaaa6aa4
    .word 0xab6aa4aa
    .word 0x6aa4aaea
    .word 0xa4aaaaaf
    .word 0xaaffaf6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaafeab6a
    .word 0xafaf6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aafeaa
    .word 0xaaafaa6a
    .word 0xafaa6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aaafaf
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaabeaa6a
    .word 0xfeaa6aa4
    .word 0xab6aa4aa
    .word 0x6aa4aafe
    .word 0xa4aabeaf
    .word 0xaabeaf6a
    .word 0xbebe6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aafe
    .word 0xa4aabeaa
    .word 0xaaffaa6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaaffaf6a
    .word 0xaaaf6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaa
    .word 0xa4aafeaf
    .word 0xaaafaf6a
    .word 0xafaa6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aaafaf
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaaffaa6a
    .word 0xefab6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaa
    .word 0xa4aafeaf
    .word 0xaaefaf6a
    .word 0xafaf6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aaafaf
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaaffaf6a
    .word 0xbeaf6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aabe
    .word 0xa4aabeaa
    .word 0xaafaaa6a
    .word 0xfaaa6aa4
    .word 0xaa6aa4aa
    .word 0x6aa4aafa
    .word 0xa4aafaaa
    .word 0xaafaaa6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaafeab6a
    .word 0xafaf6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aafeab
    .word 0xaafeab6a
    .word 0xafaf6aa4
    .word 0xaf6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4aaafaf
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xaaffaa6a
    .word 0xebab6aa4
    .word 0xab6aa4ea
    .word 0x6aa4eaeb
    .word 0xa4eaebab
    .word 0xeaefab6a
    .word 0xffaa6aa4
    .word 0xaa6aa4ea
    .word 0x6aa4eaab
    .word 0xa4aaefab
    .word 0xaafeab6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfeabfa6a
    .word 0xaffa6ba4
    .word 0xfa6aa4af
    .word 0x6aa4afaf
    .word 0xa4afaffa
    .word 0xafaffa6a
    .word 0xaffa6aa4
    .word 0xfa6aa4af
    .word 0x6aa4afaf
    .word 0xa4afaffa
    .word 0xfeabfe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfaaabe6a
    .word 0xabfe6aa4
    .word 0xbe6aa4fa
    .word 0x6aa4faaa
    .word 0xa4faaabe
    .word 0xfaaabe6a
    .word 0xaabe6aa4
    .word 0xbe6aa4fa
    .word 0x6aa4faaa
    .word 0xa4faaabe
    .word 0xfeabff6a
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfaaffa6a
    .word 0xbefa6ba4
    .word 0xfa6aa4be
    .word 0x6aa4bebe
    .word 0xa4beaafa
    .word 0xfaaafa6a
    .word 0xabfa6aa4
    .word 0xfa6aa4ea
    .word 0x6aa4aaaf
    .word 0xa4aabefa
    .word 0xfebffe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfaaffa6a
    .word 0xbefa6ba4
    .word 0xfa6aa4be
    .word 0x6aa4beaa
    .word 0xa4faabfa
    .word 0xbeaafa6a
    .word 0xaafa6aa4
    .word 0xfa6aa4be
    .word 0x6aa4beaa
    .word 0xa4bebefa
    .word 0xfaaffe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xbeaafa6a
    .word 0xaafa6ba4
    .word 0xfa6aa4fe
    .word 0x6aa4feab
    .word 0xa4beaffa
    .word 0xbeaffa6a
    .word 0xbefa6aa4
    .word 0xfa6aa4be
    .word 0x6aa4feaf
    .word 0xa4beaafa
    .word 0xffaafe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa5a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xffaffa6a
    .word 0xaffa6ba4
    .word 0xfa6aa4aa
    .word 0x6aa4aaaf
    .word 0xa4feaffa
    .word 0xafaffa6a
    .word 0xaafa6aa4
    .word 0xfa6aa4af
    .word 0x6aa4afaf
    .word 0xa4afaffa
    .word 0xfeabfe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa6a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfeabfa6a
    .word 0xaffa6ba4
    .word 0xfa6aa4be
    .word 0x6aa4aabe
    .word 0xa4fabffa
    .word 0xbebffa6a
    .word 0xbefa6aa4
    .word 0xfa6aa4be
    .word 0x6aa4bebe
    .word 0xa4bebefa
    .word 0xfaaffe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0x55555515
    .word 0xaaaa6a50
    .word 0xaa6a94aa
    .word 0x6aa4aaaa
    .word 0xa4aaaaaa
    .word 0xfebffa6a
    .word 0xbefa6ba4
    .word 0xfa6aa4fa
    .word 0x6aa4faaa
    .word 0xa4faaafa
    .word 0xeaabfa6a
    .word 0xabfa6aa4
    .word 0xfa6aa4ea
    .word 0x6aa4eaab
    .word 0xa4eaabfa
    .word 0xeaabfe6b
    .word 0xaaaa6aa4
    .word 0xaa6aa4aa
    .word 0x5aa4aaaa
    .word 0x94aaaaaa
    .word 0x55555515
    .word 0x00000050
    .word 0xc5b9cab9
    .word 0xc9b9cbb9
    .word 0xc3b9c4b9
    .word 0xccb9c7b9
    .word 0xc8b9c2b9
    .word 0xcdb9c0b9
    .word 0xbeb9bcb9
    .word 0xbfb9c1b9
    .word 0xe9e3bdb9
    .word 0xc0efefe9
    .word 0xf4e8c6b9
    .word 0xb1ecb3f0
    .word 0xfbebc0f0
    .word 0xb9eeadee
    .word 0xfdf5dcee
    .word 0xd4ddbdf7
    .word 0xc5d8c1f2
    .word 0xc4e1acda
    .word 0xf6eafef4
    .word 0xf3f0f4ea
    .word 0x0000f1f6
    .word 0xd8bbe1bb
    .word 0xd3bbe3bb
    .word 0xd2bbd4bb
    .word 0xd9bbddbb
    .word 0xd6bbdabb
    .word 0xe6bbdbbb
    .word 0xe4bbd5bb
    .word 0xb2bbdfbb
    .word 0xe0bbdebb
    .word 0xb6dae5bb
    .word 0xe7e5cdea
    .word 0xe2bbe2f7
    .word 0xdcbbf6dc
    .word 0xb9e0eedc
    .word 0xa3edd7bb
    .word 0xf5e7a7e4
    .word 0xdcdfa5de
    .word 0xabe4d4df
    .word 0xc0e7b3f2
    .word 0xc4e3ede8
    .word 0x0000b3f3
    .word 0xa9beadbe
    .word 0xb3beabbe
    .word 0xb9beafbe
    .word 0xaabeb2be
    .word 0xb4beb0be
    .word 0xb5bea6be
    .word 0xbbbebabe
    .word 0xb6beaebe
    .word 0xa3bea7be
    .word 0xb1bea4be
    .word 0xb8bebde3
    .word 0xfee3a8be
    .word 0xd3d9e5da
    .word 0xb7bebaec
    .word 0xa5bec9e5
    .word 0xe6ebd6eb
    .word 0xacbebcdd
    .word 0xc2ebb0e2
    .word 0xbae6f2e5
    .word 0xa6f6d9d8
    .word 0x00000000
    .word 0x2e312030
    .word 0x40213f2c
    .word 0x2d252726
    .word 0x61232a3a
    .word 0x41326362
    .word 0x64324342
    .word 0x44336665
    .word 0x67334645
    .word 0x47346968
    .word 0x6a344948
    .word 0x4a356c6b
    .word 0x6d354c4b
    .word 0x4d366f6e
    .word 0x70364f4e
    .word 0x37737271
    .word 0x53525150
    .word 0x76757437
    .word 0x56555438
    .word 0x79787738
    .word 0x5857397a
    .word 0x00395a59
    .word 0xd6b3d4b3
    .word 0xdfb3d9b3
    .word 0xe2b3e0b3
    .word 0xd5b3d8b3
    .word 0xdbb3ddb3
    .word 0xe1b3dcb3
    .word 0xdeb3d7b3
    .word 0xcde0eadf
    .word 0xdab3b4e0
    .word 0xe3b3bff2
    .word 0xb7ebd7f3
    .word 0xc1e2b3df
    .word 0xb7f0d8f5
    .word 0xf9f4ddf1
    .word 0xafdce6db
    .word 0xf8f3dddc
    .word 0xcae6d1d9
    .word 0xdce1a4f3
    .word 0xcef7f7ed
    .word 0x0000a1f1
    .word 0xdab5d8b5
    .word 0xd7b5e1cc
    .word 0xdbb5cdb5
    .word 0xd0b5dcb5
    .word 0xddb5d6b5
    .word 0xcfb5ceb5
    .word 0xccb5d9b5
    .word 0xdeb5d1b5
    .word 0xd6e0d3b5
    .word 0xd0daaeda
    .word 0xa1dbd2b5
    .word 0xd5b5fbed
    .word 0xc6edd4b5
    .word 0xa6e9b7e6
    .word 0xc6f4b6dd
    .word 0xdce8e6db
    .word 0xbef7ebea
    .word 0xb0e7b5d8
    .word 0xdaede1ef
    .word 0x0000e1d9
    .word 0xb4d0a9d0
    .word 0xadd0bbd0
    .word 0xafd0acd0
    .word 0xb9d0b1d0
    .word 0xaad0b2d0
    .word 0xb0d0b3d0
    .word 0xbcd0b5d0
    .word 0xaed0b6d0
    .word 0xbad0b8d0
    .word 0xb7d0f4d9
    .word 0xe2e5c9d9
    .word 0xa2dfbfe9
    .word 0xace5a8d0
    .word 0xa1f2abd0
    .word 0xafdec4db
    .word 0xf3f5c6db
    .word 0xb3e2d3e7
    .word 0xdde2a5e7
    .word 0xcde4c7e9
    .word 0x00000000
    .word 0xa2d3a6d3
    .word 0xaad3b0d3
    .word 0xb2d3add3
    .word 0xaed3b3d3
    .word 0xb1d3afd3
    .word 0xa4d3a5d3
    .word 0xa3d3acd3
    .word 0xabd3a8d3
    .word 0xa9d3dfe2
    .word 0xbaddd3dd
    .word 0xade5bff3
    .word 0xa7d3bae9
    .word 0xf8d9a3f2
    .word 0xf8e7d0f0
    .word 0xd3e0e3dc
    .word 0xfedcace8
    .word 0xabdbfcde
    .word 0xf6dda8f1
    .word 0xebe4dee4
    .word 0x0000f4eb
    .word 0xd4d7d3d7
    .word 0xcad7d6d7
    .word 0xcfd7c9d7
    .word 0xd0d7ccd7
    .word 0xa8d6cbd7
    .word 0xced7c8d7
    .word 0xd5d7f7e8
    .word 0xa2e6d1d7
    .word 0xd2d7a7ed
    .word 0xb7f6d1da
    .word 0xdadff6ef
    .word 0xc5efa2ea
    .word 0xcaf3f6ed
    .word 0xcdd7daf7
    .word 0xfef5ebdc
    .word 0xbbe7a4f6
    .word 0xf6f6e8f1
    .word 0xdfead1e1
    .word 0xd2f4dce6
    .word 0x0000f4f4
    .word 0x00000000
    .word 0x54050000
    .word 0x55000000
    .word 0x01004055
    .word 0x0050a95a
    .word 0x94eaaa05
    .word 0xeaab0500
    .word 0xaa160094
    .word 0x1600a5ea
    .word 0x00a5eaaa
    .word 0xa5eaaa16
    .word 0xeaaa1600
    .word 0xab0500a5
    .word 0x050094fa
    .word 0x0094aaaa
    .word 0x50a95a01
    .word 0x55550000
    .word 0x05000040
    .word 0x00000054
    .word 0x00000000
    .word 0x00000000
    .word 0x54050000
    .word 0x55000000
    .word 0x01004055
    .word 0x0050a95a
    .word 0x94aaaa05
    .word 0xfaab0500
    .word 0xaa160094
    .word 0x1600a5ba
    .word 0x00a5baaa
    .word 0xa5faab16
    .word 0xaaab1600
    .word 0xab0500a5
    .word 0x050094aa
    .word 0x0094faab
    .word 0x50a95a01
    .word 0x55550000
    .word 0x05000040
    .word 0x00000054
    .word 0x00000000
    .word 0xa5b2a8b2
    .word 0xaeb2a9b2
    .word 0xa1b1aab2
    .word 0xb4b2a6b2
    .word 0xfeb0d8b0
    .word 0xb5b2a3b2
    .word 0xb1b2b7b2
    .word 0xb2b2abb2
    .word 0xa4f4c4e2
    .word 0xb0b2feea
    .word 0xe7edcbf5
    .word 0xafb2a4b2
    .word 0xa7b2acb2
    .word 0xdee9b3b2
    .word 0xa2ebe0ee
    .word 0xc0f5adb2
    .word 0xbef0c3d8
    .word 0xf1d9dbf5
    .word 0x0000a3e0
    .word 0xb4c0cbc1
    .word 0xdec2b5c0
    .word 0xf5c1c0c2
    .word 0xeec0b3c2
    .word 0xd7c0d6c1
    .word 0xacc2cec1
    .word 0xf7c0bac1
    .word 0xbdc2aec1
    .word 0xe8c0fac1
    .word 0xbfc1b9c2
    .word 0xb7c2edc0
    .word 0xdbc2efc0
    .word 0xfbc0bdc1
    .word 0xf7c1ecc1
    .word 0xa2c1a6c1
    .word 0xacc1cfc1
    .word 0xf9c1cfc0
    .word 0xe0c0d6c2
    .word 0x0000d0c1
    .word 0xc6c9bdc9
    .word 0xc0c9c1c9
    .word 0xbfc9bec9
    .word 0xc2c9c8c9
    .word 0xbcc9bac9
    .word 0xf4b2c3c9
    .word 0xa4d5c5c9
    .word 0xc7f5a8da
    .word 0xa9e6c7c9
    .word 0xfae4c4c9
    .word 0xd3e6c9c9
    .word 0xfeeba7b5
    .word 0xcfdcf3e6
    .word 0xdfd8efdb
    .word 0xb7dbccee
    .word 0xbbc9aef4
    .word 0xdef0d4f7
    .word 0xadf7b5f3
    .word 0x00000000
    .word 0xd0d3bbd2
    .word 0xcfd1eed1
    .word 0xd6d1e0d3
    .word 0xd5d1a6d2
    .word 0xe0d1acd4
    .word 0xc0d4e1d3
    .word 0xd6c0a2e3
    .word 0xf2d1b6d2
    .word 0xc8d3fcd2
    .word 0xaad2c3d3
    .word 0xdad3d4d2
    .word 0xf9d1b2d2
    .word 0xebd3e5d2
    .word 0xb9d1c9d3
    .word 0xc2d4b1d4
    .word 0xd6d3e2d2
    .word 0xadd4cbd4
    .word 0xe9d1cdd3
    .word 0x00000000
    .word 0xe2d5dad4
    .word 0xd0d6f7d6
    .word 0xc2d5c5d5
    .word 0xf8d4d4d5
    .word 0xdcd6a3d6
    .word 0xecd6ded7
    .word 0xc5d7d6d6
    .word 0xe7d5a3d7
    .word 0xdad7afd7
    .word 0xb0eab2d5
    .word 0xf3d7e6d7
    .word 0xf9d5b9d5
    .word 0xf7d7bdd5
    .word 0xaed6fdd5
    .word 0xd8d6c6d6
    .word 0xced6e9d7
    .word 0xd3d7bbd6
    .word 0xcad6d4d7
    .word 0x0000b8d6
    .word 0x47702000
    .word 0x47702000
    .word 0xf796b580
    .word 0x2000fee8
    .word 0xb580bd02
    .word 0xb292000a
    .word 0x48070001
    .word 0xff1ff796
    .word 0xbd022000
    .word 0x000ab580
    .word 0x0001b292
    .word 0xf7964802
    .word 0x4801ffbc
    .word 0x0000bd02
    .word 0x200199f0
    .word 0x7f80f1b0
    .word 0x2000d201
    .word 0x2001e000
    .word 0x00084770
    .word 0xefb8f6b8
    .word 0xe8b8f7b8
    .word 0xe7b8f1b8
    .word 0xf4b8eab8
    .word 0xeeb8f0b8
    .word 0xecb8f3b8
    .word 0xedb8e9b8
    .word 0xebb8a9bf
    .word 0xc0f7c3e0
    .word 0xd9d2a2f2
    .word 0xf5eba1eb
    .word 0xfce6d3ef
    .word 0xeed8cbf1
    .word 0xaadcaad8
    .word 0xc1dbd9db
    .word 0xf5b8b4f4
    .word 0xb4f2d1ed
    .word 0x00000000
    .word 0xf1bdf8bd
    .word 0xfcbdf0bd
    .word 0xf6bda1be
    .word 0xfbbdf4bd
    .word 0xf2bda2be
    .word 0xf7bdefbd
    .word 0xeebdf5bd
    .word 0xedbdfabd
    .word 0xf3bdfebd
    .word 0xe6f1aae8
    .word 0xc6e7f9bd
    .word 0xe4e0fdbd
    .word 0xcbe2eeea
    .word 0xc6f1c0dd
    .word 0xdbe2a3dd
    .word 0xe1daa1e6
    .word 0xc8e9e1ea
    .word 0x00000000
    .word 0xcbbfc9bf
    .word 0xcdbfc6bf
    .word 0xcebfccbf
    .word 0xcabfc5bf
    .word 0xc7bac2bf
    .word 0xa1e3c3bf
    .word 0xc1bfc8bf
    .word 0xc7bfc4bf
    .word 0xbee0c0bf
    .word 0xf0e9a7ee
    .word 0xe2f0fdef
    .word 0xdbe4f2f2
    .word 0xddeec1f7
    .word 0xa4f2bdf1
    .word 0xb3e1e6e7
    .word 0xbce7ece6
    .word 0xbeefb4eb
    .word 0x0000c2f2
    .word 0xa1c8a5c8
    .word 0xfac7f8c7
    .word 0xfcc7a4c8
    .word 0xfdc7f7c7
    .word 0xfbc7fec7
    .word 0xefeaa2c8
    .word 0xabe1c4f6
    .word 0xd0f2e7d0
    .word 0xf9c7e9e1
    .word 0xf0f4b3f1
    .word 0xeeecd6e3
    .word 0xb6f0e1ed
    .word 0xbdf3b0da
    .word 0xa1debedb
    .word 0xa3c8bede
    .word 0xf1f7c4dc
    .word 0xacebb3e8
    .word 0x0000d4eb
    .word 0xcfc9c7ca
    .word 0xefcbb1ca
    .word 0xd5cbcecb
    .word 0xdacbf2c9
    .word 0xdbc9a9ca
    .word 0xeac9dcd9
    .word 0xa7cba6ca
    .word 0xe5cbb3c9
    .word 0xb7caafca
    .word 0xb5cbfac9
    .word 0xeec9e7c9
    .word 0xf9cbaecb
    .word 0xaecafdc8
    .word 0xc2cab9ca
    .word 0xc4cbfdca
    .word 0xd9c9b5ca
    .word 0xbdc9bdca
    .word 0x0000d6ca
    .word 0xf8d0edd0
    .word 0xebd0e8d0
    .word 0xf2d0ecd0
    .word 0xf7d0e9d0
    .word 0xeed0f5d3
    .word 0xf3d0f0d0
    .word 0xf4d0ead0
    .word 0xb0e4f5d0
    .word 0xf1d0e6d0
    .word 0xf2e8f6d0
    .word 0xbcdae7d0
    .word 0xefd0e3f1
    .word 0xb9ede3ec
    .word 0xdaf4eced
    .word 0xefe7aff5
    .word 0xaae4c3db
    .word 0xd7dbd3e4
    .word 0x0000a3de
    .word 0xf4d2f2d2
    .word 0xa1d3fdd2
    .word 0xfed2f8d2
    .word 0xf5d2fbd2
    .word 0xabf1f6d2
    .word 0xfad2f7d2
    .word 0xf9d2f3d2
    .word 0xf1d2f0d2
    .word 0xbef2fcd2
    .word 0xb3e0f3db
    .word 0xb7d8cee4
    .word 0xb3ebb4db
    .word 0xdfdbaff6
    .word 0xfee1f7ee
    .word 0xb9e2c5df
    .word 0xb8f6a7dc
    .word 0xe1dca6e4
    .word 0x0000bff1
    .word 0xaad4b1d4
    .word 0xbad4add4
    .word 0xb8d4b6d4
    .word 0xb4d4b0d4
    .word 0xb9d4b2d4
    .word 0xaed4b5d4
    .word 0xacd4a9d4
    .word 0xb7d4a8d4
    .word 0xa7d4b3d4
    .word 0xabd4afd4
    .word 0xe4e3c2e6
    .word 0xbedcdae9
    .word 0xa2f3bceb
    .word 0xf3edbdf6
    .word 0xb0f0f7e0
    .word 0xabdceef3
    .word 0xf2def9db
    .word 0x0000a5e8
    .word 0xa8d5fad4
    .word 0xaed5aad5
    .word 0xb9d5bdd5
    .word 0xc5d5a4b3
    .word 0xd3d6c2d5
    .word 0xd5d5c5d7
    .word 0xe2d5d2d5
    .word 0xf9d5e6d5
    .word 0xfed5fdd5
    .word 0xc6d6aed6
    .word 0xbbd6ced6
    .word 0xdcd6d0d6
    .word 0xf7d6ddd6
    .word 0xa5d7a1d7
    .word 0xa8d7aad7
    .word 0xacd7abd7
    .word 0xb4d7b0d7
    .word 0x0000bcd7
    .word 0x00000000
    .word 0x40555515
    .word 0x40000010
    .word 0x40208010
    .word 0x40208010
    .word 0x40208010
    .word 0x40a0aa10
    .word 0x40208010
    .word 0x40208010
    .word 0x40208010
    .word 0x40208010
    .word 0x40000010
    .word 0x40555515
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x40555515
    .word 0x40000010
    .word 0x40002010
    .word 0x40002010
    .word 0x40002010
    .word 0x40002010
    .word 0x40002010
    .word 0x40002010
    .word 0x40002010
    .word 0x40a02a10
    .word 0x40000010
    .word 0x40555515
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00001004
    .word 0x00001004
    .word 0x00005415
    .word 0x00005015
    .word 0x00800215
    .word 0x00a00a15
    .word 0x00282814
    .word 0x00282814
    .word 0x00282814
    .word 0x00a00a15
    .word 0x00800215
    .word 0x00005015
    .word 0x00005415
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00001004
    .word 0x00001004
    .word 0x00005415
    .word 0x00005015
    .word 0x00000015
    .word 0x00282815
    .word 0x00a00a14
    .word 0x00a00a14
    .word 0x00a00a14
    .word 0x00282815
    .word 0x00000015
    .word 0x00005015
    .word 0x00005415
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x54555515
    .word 0x54aaaa15
    .word 0x64a96a19
    .word 0xa4a55a1a
    .word 0xa496961a
    .word 0xa45aa51a
    .word 0xa466991a
    .word 0xa4a96a1a
    .word 0x64aaaa19
    .word 0x54555515
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x54555515
    .word 0x54aaaa15
    .word 0x64a96a19
    .word 0xa4a55a1a
    .word 0xa496961a
    .word 0xa45aa51a
    .word 0xa466991a
    .word 0xf4a96a1a
    .word 0xfcabaa19
    .word 0xfc575515
    .word 0xf0000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x50555515
    .word 0xf0ffab1a
    .word 0xf0ffab1a
    .word 0xf0ffab1a
    .word 0xf0ffab1a
    .word 0x50555515
    .word 0x5055fd3f
    .word 0x5055fd3f
    .word 0x5055fd3f
    .word 0x4055fd0f
    .word 0x0055fd03
    .word 0x0054fd00
    .word 0x00400d00
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x14000210
    .word 0x28800220
    .word 0x28a00220
    .word 0x28a8aa22
    .word 0x3cabaa32
    .word 0xfcafaa32
    .word 0x3cffff33
    .word 0x3cfcff33
    .word 0x3cf00330
    .word 0x3cc00330
    .word 0x3c000330
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
.Ldata_20734:
    .byte 0x09
    .byte 0x0c
    .byte 0x0c
    .byte 0x0d
    .word 0x0f09120d
.Ldata_20738:
    .word 0x2c272320
.Ldata_20739:
    .word 0x4a564352
    .word 0x5b7d52fa
.Ldata_20740:
    .word 0x18161311
.Ldata_20741:
    .word 0x2afd26c9
    .word 0x34792f96
.Ldata_20742:
    .word 0x322d2925
.Ldata_20743:
    .word 0x55814d60
    .word 0x68835e87
.Ldata_20744:
    .word 0x1c191714
.Ldata_20745:
    .word 0x31482c9c
    .word 0x3c393687
.Ldata_20746:
    .word 0x0e070401
    .word 0x00080502
    .word 0x0f090603
    .word 0x0d0c0b0a
    .word 0xedb6eeb6
    .word 0xf6b6f1b6
    .word 0xecb6b6c5
    .word 0xb5e3f3b6
    .word 0xacd8f4b6
    .word 0xebb6f0b6
    .word 0xf2b6c0df
    .word 0xefb6f5b6
    .word 0xeab6b9e6
    .word 0xa6f2eee9
    .word 0xc9eff9f6
    .word 0xede5ccda
    .word 0xd5e3b0ef
    .word 0xf1ebd1db
    .word 0xcaf0c3dc
    .word 0xaddde0dd
    .word 0x00000000
    .word 0xaac4acc4
    .word 0xe1f7a3c4
    .word 0xa5c4a9c4
    .word 0xa6c4fec3
    .word 0xaec4afc4
    .word 0xa8c4abc4
    .word 0xb0c4a7c4
    .word 0xadc4d9ba
    .word 0xebdda4c4
    .word 0xd4dca2c4
    .word 0xa1c4c9e2
    .word 0xd3dad1ba
    .word 0xf7efc6e6
    .word 0xe2e9d2ef
    .word 0xf2f1a2f1
    .word 0xf8f5f6f5
    .word 0x00000000
    .word 0xc0cbc4cb
    .word 0xb9cbbccb
    .word 0xc6cbbecb
    .word 0xbfcbbdcb
    .word 0xbacbc2cb
    .word 0xcbd8c1cb
    .word 0xc5cbbbcb
    .word 0xc3cbc7cb
    .word 0xc8cbebec
    .word 0xb8f0e1e6
    .word 0xe1e3b9d9
    .word 0xccdbf4e3
    .word 0xcff2eed9
    .word 0xa6e6d0df
    .word 0xc1e7f9e4
    .word 0xd3f3eaf1
    .word 0x0000c8ef
    .word 0xafd1b0d1
    .word 0xb8d1b5d1
    .word 0xb2d1b6d1
    .word 0xadd1b7d1
    .word 0xacd1aed1
    .word 0xb1d1abd1
    .word 0xb3d1e7bb
    .word 0xe3d9b8f5
    .word 0xf7dbdfe1
    .word 0xbee1f7dc
    .word 0xb9deade4
    .word 0xa8dbb4d1
    .word 0xbff1d6ea
    .word 0xb4e2fee2
    .word 0xe0f6b1e4
    .word 0xa3bfa6de
    .word 0x00000000
    .word 0xa1d2aad2
    .word 0xabd2a9d2
    .word 0xfbd1a3d2
    .word 0xa6d2fcd1
    .word 0xa2d2a7d2
    .word 0xfed1a5d2
    .word 0xb2d8a4d2
    .word 0xfdd1c8eb
    .word 0xbfd4badf
    .word 0xc3e8c4bd
    .word 0xcef0baf1
    .word 0xa8d2d7ea
    .word 0xdbe7a2ef
    .word 0xe6e1b3d8
    .word 0xa5f7edf4
    .word 0xf7e9f2e7
    .word 0x0000cae1
    .word 0xf3d5e6d5
    .word 0xf0d5f2d5
    .word 0xe4d5ebd5
    .word 0xf1d5dadb
    .word 0xedd5efd5
    .word 0xead5e5d5
    .word 0xe2eaecd5
    .word 0xe9d5e7d5
    .word 0xeed5f0f3
    .word 0xe5e8e8d5
    .word 0xb3eec7e7
    .word 0xd3ebf4e9
    .word 0xf5eca1f0
    .word 0xdae4a5e4
    .word 0xa9e9e8dd
    .word 0xdeebbbe9
    .word 0x0000b2f0
    .word 0x053803ad
    .word 0x04b902b9
    .word 0x053802b9
    .word 0x05c502b9
    .word 0x04b90302
    .word 0x05380302
    .word 0x05c50302
    .word 0x04b90354
    .word 0x05380354
    .word 0x05c50354
    .word 0x066102b9
    .word 0x06610302
    .word 0x06610354
    .word 0x066103ad
    .word 0x04b903ad
    .word 0x05c503ad
    .word 0x0000b0ff
    .word 0x0b410000
    .word 0x3c0200b8
    .word 0x00409c23
    .word 0x220a8073
    .word 0x33000001
    .word 0xffff00ef
    .word 0x10f0f0ff
    .word 0x3b070000
    .word 0x40fd0ef8
    .word 0x000b00ff
    .word 0x0b040000
    .word 0xff021700
    .word 0x00f028e0
    .word 0x00000000
    .word 0x00000000
    .word 0x080461e3
    .word 0x080461fd
    .word 0x08046217
    .word 0x08092553
    .word 0x08092787
    .word 0x08092791
    .word 0x080926f3
    .word 0x08092901
    .word 0x080461b5
    .word 0x08092853
    .word 0x0809289b
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000010
    .word 0xfab9f6b8
    .word 0xfdb9a4b9
    .word 0xf9b9dfb8
    .word 0xf0b8eab8
    .word 0xaeb9a2b9
    .word 0xcab8a8b9
    .word 0xc5b9c9b8
    .word 0xc8b9d6bc
    .word 0xd8b9cbb9
    .word 0xf7b8dcb9
    .word 0xabb9efb8
    .word 0xfcb8f9b8
    .word 0xe2b9c4b8
    .word 0xfbb9e3b9
    .word 0xb2b9f1b8
    .word 0x0000e3b8
    .word 0xe1bbcdba
    .word 0xcebaf3ba
    .word 0xfabac6bb
    .word 0xeebae9ba
    .word 0xf4bbd8ba
    .word 0xabbae8ec
    .word 0xc2baaabb
    .word 0xc3baafbb
    .word 0xb9bbcfba
    .word 0xdcbaeebb
    .word 0xc5bad8bb
    .word 0xa8bbc1ba
    .word 0xa3baf2bb
    .word 0xecbab0bb
    .word 0xa6baf0bb
    .word 0x00000000
    .word 0xb0bababa
    .word 0xaebaacba
    .word 0xabbab9ba
    .word 0xadbab6ba
    .word 0xb2baafba
    .word 0xb1bab3ba
    .word 0xb4bab5ba
    .word 0xb7baa8ba
    .word 0xcfeaa9ba
    .word 0xfdf7abe5
    .word 0xdbe3fcf1
    .word 0xc0f2b8ba
    .word 0xa5f2caec
    .word 0xfeded5dd
    .word 0xaabaf5da
    .word 0x00000000
    .word 0xcebacdba
    .word 0xd3bacfba
    .word 0xd5bac8ba
    .word 0xc5cfcbba
    .word 0xd0bad8ba
    .word 0xccbac7ba
    .word 0xd7bac9ba
    .word 0xd2bad6db
    .word 0xaddad6ba
    .word 0xd8e3d4ba
    .word 0xd1bac0e0
    .word 0xa2f2c2ea
    .word 0xc1eec0db
    .word 0xc2f2fce6
    .word 0xcabae7f4
    .word 0x00000000
    .word 0xf8bef5be
    .word 0xc5bdf6be
    .word 0xf2bec0bd
    .word 0xc8e1f7be
    .word 0xf1bef4be
    .word 0xb1e2f3be
    .word 0xcad8b5e0
    .word 0xf0beeaf5
    .word 0xc7dbdcda
    .word 0xe5e0efbe
    .word 0xd3e9dee6
    .word 0xe5e7d9e0
    .word 0xe3d8f6e8
    .word 0xe3efdfec
    .word 0xfbf5a7de
    .word 0x00000000
    .word 0xd2ceaace
    .word 0xf5cddece
    .word 0xc0cef4cd
    .word 0xe2cebace
    .word 0xc5cea4ce
    .word 0xf9dadace
    .word 0xc2ceccce
    .word 0xcacee9ce
    .word 0xe5cee2cd
    .word 0xefcebbce
    .word 0xeacdafce
    .word 0xf2cdc2ce
    .word 0xf9cdc4ce
    .word 0xf1cee4ce
    .word 0xf3cea7ce
    .word 0x0000edcd
    .word 0xc2cfa7d1
    .word 0xedd0d0d0
    .word 0xcfd0ecd0
    .word 0xa4d0f4cf
    .word 0xdcd0a6d1
    .word 0xeecfe2bd
    .word 0xfed9b0cf
    .word 0xdfcfa1d0
    .word 0xc2d0d4d0
    .word 0xebcfa9d0
    .word 0xf2cfc4d0
    .word 0xb5cfe0cf
    .word 0xd6cfafcf
    .word 0xded0f7ce
    .word 0xc8cff3cf
    .word 0x0000ced0
    .word 0xe0cfebcf
    .word 0xf3cff2cf
    .word 0xe7cfe3cf
    .word 0xeccff1cf
    .word 0xedcfeecf
    .word 0xe4cfb5bd
    .word 0xe9cfeacf
    .word 0xe1cfefcf
    .word 0xf0cfe6cf
    .word 0xe2cfe8cf
    .word 0xe5cfcff7
    .word 0xf8e6c3e2
    .word 0xd4e2d9dd
    .word 0xbcdcdff6
    .word 0xadf3bde7
    .word 0x00000000
    .word 0xa6d0a1d0
    .word 0xfbcfa3d0
    .word 0xfecfa7d0
    .word 0xece4facf
    .word 0xf4cfa4d0
    .word 0xfccfa2d0
    .word 0xf9cff7cf
    .word 0xd0e5a5d0
    .word 0xf6cff5cf
    .word 0xf8cffdcf
    .word 0xe7e6c9e8
    .word 0xe3f3eff3
    .word 0xd5e8d8df
    .word 0xccf7afe7
    .word 0xc5e1d9f2
    .word 0x00000000
    .word 0xb9d1c7d1
    .word 0xc0d1c5d1
    .word 0xbad1bdd1
    .word 0xc8d1c4d1
    .word 0xc6d1bbd1
    .word 0xc2d1bcd1
    .word 0xbfd1bed1
    .word 0xfed4c3d1
    .word 0xfdede9f0
    .word 0xc1d1abe6
    .word 0xe2f1f3d8
    .word 0xf0e7ace1
    .word 0xebdeebdb
    .word 0xe2e8c2e5
    .word 0xbcedb2eb
    .word 0x00000000
    .word 0x08046709
    .word 0x08046711
    .word 0x08046719
    .word 0x0801cb23
    .word 0x0801ca93
    .word 0x0801cac7
    .word 0x0801cb05
    .word 0x0801ca67
    .word 0x08046721
    .word 0x0801ca43
    .word 0x0801ca73
    .word 0x0801cbd7
    .word 0x00000000
    .word 0x00000000
    .word 0x0809954c
    .word 0x00000000
.Ldata_20748:
    .word 0xfaa4f000
    .word 0x054f0262
    .word 0x0b81084b
    .word 0x11d20f1e
    .word 0x155713d3
    .word 0x17251659
    .word 0x191b182a
    .word 0x1a9419e6
    .word 0x1c931b75
    .word 0x1e841d92
    .word 0x202e1f5e
    .word 0x21d320fd
    .word 0x245922f6
    .word 0x26ca25a9
    .word 0x2a9c2874
    .word 0x36fe2e38
    .word 0xb1b1bbb1
    .word 0xb3b1b8b1
    .word 0xb2b1afb1
    .word 0xb6b1adb1
    .word 0xaeb1b4b1
    .word 0xedddb0b1
    .word 0xa3e3b9b1
    .word 0xc2dfb7b1
    .word 0xc7f0bab1
    .word 0xfddac3d8
    .word 0xfddbe9da
    .word 0xd8f1d5ed
    .word 0xb9f7cdf6
    .word 0xb5b1c9dd
    .word 0x00000000
    .word 0xc7b3c9b3
    .word 0xc6b3ccb3
    .word 0xcfb3d0b3
    .word 0xcbb3a2ca
    .word 0xc5b3cab3
    .word 0xceb3cdb3
    .word 0xaaeed3b3
    .word 0xe1e0c8b3
    .word 0xf5eed1b3
    .word 0xd2b3a9d8
    .word 0xc7e8f4db
    .word 0xf1eef3eb
    .word 0xa8f5cef1
    .word 0xc9f2dfe8
    .word 0x00000000
    .word 0xa6b4f6b3
    .word 0xf5b3fdb3
    .word 0xa5b4feb3
    .word 0xa1b4a2b4
    .word 0xf3d0f8b3
    .word 0xf7b3f9b3
    .word 0xa3b4fbb3
    .word 0xfab3f0e2
    .word 0xa4b4c6e8
    .word 0xedf7a9e7
    .word 0xdcf2d2f1
    .word 0xbbdbe9f5
    .word 0xfae8fcb3
    .word 0xa1d8c0e3
    .word 0x0000cbe9
    .word 0xd1b7c7b7
    .word 0xcfb7c9b7
    .word 0xc8b7cab7
    .word 0xc6b7d0b7
    .word 0xcbb7ceb7
    .word 0xe8ebccb7
    .word 0xcdb7e9ec
    .word 0xb3e7adf6
    .word 0xb3ecfae5
    .word 0xe3f2e4f4
    .word 0xc7e4f2f0
    .word 0xeef6ade3
    .word 0xc0dcf5f3
    .word 0xd0eff4e1
    .word 0x0000bce9
    .word 0xe9b9e6b9
    .word 0xedb9f3b9
    .word 0xf2b9f0b9
    .word 0xe5b9ecb9
    .word 0xf4b9eeb9
    .word 0xe8b9eab9
    .word 0xa7f0ebb9
    .word 0xefb9febf
    .word 0xd0eae7b9
    .word 0xa3e6fef3
    .word 0xd0d8d9f6
    .word 0xb3e5d1e2
    .word 0xdbd8b2c8
    .word 0xc1eaede8
    .word 0x0000acf7
    .word 0xbbbbb6bb
    .word 0xb7bbb9bb
    .word 0xbcbbbabb
    .word 0xbdbbc3bb
    .word 0xc0bbc2bb
    .word 0xbee5bebb
    .word 0xc1bbdff7
    .word 0xbcdbbde4
    .word 0xd9e7b8bb
    .word 0xccefbfbb
    .word 0xc8dda8db
    .word 0xa1e4f7e0
    .word 0xb5e2a7df
    .word 0xd5e5f1e4
    .word 0x0000e9f6
    .word 0xd6bcb6bc
    .word 0xafbdadbd
    .word 0xb9bdaabd
    .word 0xf9bdf0bd
    .word 0xcdbefabd
    .word 0xd3bcf8bd
    .word 0xd2bcadbe
    .word 0xd7bde1bd
    .word 0xfebce4bc
    .word 0xe2bdb0bc
    .word 0xfabbcfbd
    .word 0xd3bdfcbe
    .word 0xabbcccbd
    .word 0xfbbcc5be
    .word 0x00000000
    .word 0xa2c0f7bf
    .word 0xfabfa3c0
    .word 0xa1c0fdbf
    .word 0xf8bfa5ee
    .word 0xfbbfd3e5
    .word 0xd1d8fcbf
    .word 0xb0e0febf
    .word 0xf9bff9f1
    .word 0xe7d9b8d8
    .word 0xade0f1f3
    .word 0xd2eaa6e3
    .word 0xdeddf3da
    .word 0xb4e3f1f2
    .word 0xcdf5f1de
    .word 0x00000000
    .word 0xeec1ecc1
    .word 0xe9c1edc1
    .word 0xe4c1e3c1
    .word 0xe1c1e8c1
    .word 0xeac1e5c1
    .word 0xe0c1ebc1
    .word 0xf6f1e6c1
    .word 0xe2c0f2e0
    .word 0xe1f4e2c1
    .word 0xb2eadfdc
    .word 0xb1e7f9e8
    .word 0xdae8cadf
    .word 0xb9dbecf6
    .word 0xe7c1f6e3
    .word 0x0000c8f2
    .word 0xdec2e4c2
    .word 0xe5c2e7c2
    .word 0xe3c2dfc2
    .word 0xdcc2e6c2
    .word 0xe0c2ddc2
    .word 0xfbdee1c2
    .word 0xdbded3c0
    .word 0xe2c2f3e7
    .word 0xddefa4e2
    .word 0xc0d9a1e9
    .word 0xfddcf9d9
    .word 0xf8e3a7f1
    .word 0xe1ebf0e4
    .word 0xc3f6d1ed
    .word 0x00000000
    .word 0xd7c3dcc3
    .word 0xd4c3d8c3
    .word 0xd5c3d6c3
    .word 0xd0c3d9c3
    .word 0xd2c3dbc3
    .word 0xd7dae4df
    .word 0xd3c3dac3
    .word 0xb5e5e8e3
    .word 0xd1c3e7f7
    .word 0xcdf4f4e5
    .word 0xf2ecc2d8
    .word 0xddc3dfeb
    .word 0xd7e0e3f7
    .word 0xa8e2c2de
    .word 0x0000e9f4
    .word 0xb0c7f0c6
    .word 0xaec7e4c6
    .word 0xebc6c7c7
    .word 0xd8c7eec6
    .word 0xf1c7fcc7
    .word 0xc4f6ddc6
    .word 0xf8c6a5c8
    .word 0xdac6abc8
    .word 0xe9c7bac8
    .word 0xbfc7f8c7
    .word 0xa1c8d0c7
    .word 0xf3c7dfc6
    .word 0xb7c8e5c7
    .word 0xd2c7a8c8
    .word 0x0000e0c7
    .word 0xedc9b2ca
    .word 0xf1c9eec9
    .word 0xf5c9ceb2
    .word 0xf3c9eac9
    .word 0xecc9f2c9
    .word 0xf8c9f7c9
    .word 0xf6c9f0c9
    .word 0xf4c9ebc9
    .word 0xd7f2b7dd
    .word 0xefc9d8dd
    .word 0xf2efc9e4
    .word 0xe9c9b7da
    .word 0xc5dad6f4
    .word 0xcfeba9e9
    .word 0x0000d3df
    .word 0xaccdfbcb
    .word 0xc6ccfccb
    .word 0xd5ccb7cc
    .word 0xafcdc0cc
    .word 0xefccbfcd
    .word 0xe1cca1d9
    .word 0xe5cce2cc
    .word 0xecccbccd
    .word 0xa8cdb7cd
    .word 0xd8ccf5cc
    .word 0xc5cdc1cd
    .word 0xa8ccb3cd
    .word 0xabccfdcb
    .word 0xfaccd7cc
    .word 0x00000000
    .word 0x00100011
    .word 0x00040009
    .word 0x08097724
    .word 0x080fb4ac
    .word 0x00000000
    .word 0x00100011
    .word 0x00020005
    .word 0x08098bbc
    .word 0x080fb4b8
    .word 0x00000000
    .word 0x00100011
    .word 0x00020005
    .word 0x08098c0c
    .word 0x080fb4c4
    .word 0x00000000
    .word 0xe3b1e0b1
    .word 0xe4b1dfb1
    .word 0xe7b1e9b1
    .word 0xe1b1e6b1
    .word 0xe8b1deb1
    .word 0xe5b1e2b1
    .word 0xd0dcbeed
    .word 0xeae3d2d8
    .word 0xd6f3f9f2
    .word 0xb9f1dced
    .word 0xcddbdbf1
    .word 0xede2fdf6
    .word 0xc2e7d4ec
    .word 0x00000000
    .word 0xfcb2fab2
    .word 0xf8ecf8b2
    .word 0xf6b2f5b2
    .word 0xf3b2f9b2
    .word 0xf4b2fbb2
    .word 0xe3e2fde4
    .word 0xbfe6b8f3
    .word 0xf7b2c6da
    .word 0xeee5dce2
    .word 0xe6d9a4e5
    .word 0xdbddf0f5
    .word 0xe8eaf6e6
    .word 0xf1e5e2ef
    .word 0x00000000
    .word 0xa1b3a4b3
    .word 0xaab3a3b3
    .word 0xa2b3a7b3
    .word 0xa6b3fdb2
    .word 0xa9b3a5b3
    .word 0xc8ccabb3
    .word 0xeae2a8b3
    .word 0xfeb2bde6
    .word 0xf6d8cfe6
    .word 0xe4e1a9eb
    .word 0xf0f6c6ea
    .word 0xc5ddd1e3
    .word 0xcbdbc9dc
    .word 0x0000aee3
    .word 0xa5b5abb5
    .word 0xafb5a3b5
    .word 0xa9b5adb5
    .word 0xa8b5b0b5
    .word 0xa4b5aeb5
    .word 0xacb5a2b5
    .word 0xa2e0f1ed
    .word 0xa7b5a3e5
    .word 0xecf3e9e9
    .word 0xe6eaf7f0
    .word 0xf5f1e3f0
    .word 0xccddaab5
    .word 0xd9d9a6b5
    .word 0x00000000
    .word 0xe7b5e3b5
    .word 0xe4b5eab5
    .word 0xe9b5dfb5
    .word 0xe6b5edb5
    .word 0xe1b5eeb5
    .word 0xebb5ecb5
    .word 0xe2b5e0b5
    .word 0xdbe1b2f1
    .word 0xe8b5daf5
    .word 0xa1f4e8e7
    .word 0xe3dbe7da
    .word 0xe4eee5b5
    .word 0xbcd8b0f1
    .word 0x00000000
    .word 0xc5becdbe
    .word 0xc6bebfbe
    .word 0xc9bec3be
    .word 0xc0bec8be
    .word 0xcebebebe
    .word 0xc2becbbe
    .word 0xaff0f1f4
    .word 0xccbec4be
    .word 0xcabeb1e0
    .word 0xcee3d5f0
    .word 0xc7bed6d9
    .word 0xd1e8c1be
    .word 0xddf7eae8
    .word 0x00000000
    .word 0xacc1aac1
    .word 0xb7c1b3c1
    .word 0xafc1b5c1
    .word 0xaec1abc1
    .word 0xb1c1b6c1
    .word 0xb2c1b4c1
    .word 0xadc1b0c1
    .word 0xf6e7e7e9
    .word 0xcdf1ace9
    .word 0xb9f3cff1
    .word 0xa5e5e3f6
    .word 0xf2e4a1ec
    .word 0xc6defcdd
    .word 0x00000000
    .word 0xfcc3e6c3
    .word 0xcfc3edc2
    .word 0xb7c3c2c4
    .word 0xc7c3d3c3
    .word 0xabc3f1c3
    .word 0xe7c3a9c3
    .word 0xbbc3aac4
    .word 0xf7c3d7c3
    .word 0xbfc3b4c3
    .word 0xfbc3c5c3
    .word 0xc0c3a5c4
    .word 0xfac2dcc3
    .word 0xbfc4b6c4
    .word 0x0000bcdf
    .word 0xb0c3abc3
    .word 0xb3c3a8c3
    .word 0xb1c3acc3
    .word 0xa9c3b2c3
    .word 0xd6f7afc3
    .word 0xa3ebaec3
    .word 0xaac3a3e8
    .word 0xf3d9aeed
    .word 0xb9e1adc3
    .word 0xb1f3f3ea
    .word 0xc4eaf7e3
    .word 0xb8ece2dc
    .word 0xa6eefaf2
    .word 0x00000000
    .word 0xc0c3bbc3
    .word 0xc3c3bfc3
    .word 0xb7c3bcc3
    .word 0xb6c3bdc3
    .word 0xbac3c8f7
    .word 0xb9c3c1c3
    .word 0xc4c3b5c3
    .word 0xd3c3c2c3
    .word 0xb8c3c7f1
    .word 0xd2e1aedd
    .word 0xd8e4b9e9
    .word 0xd1efade2
    .word 0xccf0bce4
    .word 0x0000bec3
    .word 0xc4c7c5c7
    .word 0xc9c7c7c7
    .word 0xc6c7c8c7
    .word 0xccc7c3c7
    .word 0xcfc7cec7
    .word 0xc2c7cdc7
    .word 0xcef5cbc7
    .word 0xd4e9bee3
    .word 0xc1c7cac7
    .word 0xb8e3bdda
    .word 0xf1dcdbda
    .word 0xd8e7bde1
    .word 0xb3f7cded
    .word 0x0000e4d8
    .word 0xc3cffdca
    .word 0xbec9bdc9
    .word 0xd9c9ccc9
    .word 0xe7c9d9d5
    .word 0xf5c9e8c9
    .word 0xd0caf9c9
    .word 0xbccaa6ca
    .word 0xd5cad6ca
    .word 0xe9cad8ca
    .word 0xf5caf4ca
    .word 0xabcbe4ca
    .word 0xadcbaecb
    .word 0xb0cbafcb
    .word 0x0000b3cb
    .word 0xbdccb8cc
    .word 0xb9ccafb5
    .word 0xb3ccbecc
    .word 0xb0ccafcc
    .word 0xbaccb2cc
    .word 0xb6ccb7cc
    .word 0xbfccb1cc
    .word 0xb5ccfbf1
    .word 0xaeccfeec
    .word 0xbcccbbcc
    .word 0xb4cca3e5
    .word 0xe2efbcea
    .word 0xc4efb0db
    .word 0x0000e3ee
    .word 0xc6ccc3cc
    .word 0xc9ccc0cc
    .word 0xcbccc7cc
    .word 0xccccc8cc
    .word 0xc5cccacc
    .word 0xc4ccc1cc
    .word 0xe7e4c2cc
    .word 0xa9e8abf3
    .word 0xa5f3cce9
    .word 0xb1f5a6ef
    .word 0xedf1dbef
    .word 0xced9bce2
    .word 0xcaf4fbe0
    .word 0x00000000
    .word 0xeacdf2cd
    .word 0xe5cdedcd
    .word 0xebcde6cd
    .word 0xeccde4cd
    .word 0xf3cde7cd
    .word 0xefcdf1cd
    .word 0xe8cdf0cd
    .word 0xb8ddeaf2
    .word 0xe0d8b5ee
    .word 0xeecde3cd
    .word 0xfee7fde6
    .word 0xe9cde4eb
    .word 0xd2ddb9dc
    .word 0x0000bae7
    .word 0xfbd0a1d1
    .word 0xfcd0fdd0
    .word 0xfad0afc8
    .word 0xfed0f9d0
    .word 0xd6e4c5ec
    .word 0xa3d1a4d1
    .word 0xf6e4e6dd
    .word 0xafe8d1ea
    .word 0xe7eeceda
    .word 0xe7f0d8d9
    .word 0xd3ecf9e3
    .word 0xa2d1b8e9
    .word 0xefdedbed
    .word 0x0000e0ef
    .word 0x00000000
    .word 0x00541500
    .word 0x00655a00
    .word 0x40a96901
    .word 0x50aaa605
    .word 0x94aa9a16
    .word 0x54aa6a15
    .word 0xf4a96a1f
    .word 0xf4a7da1f
    .word 0xf49d761f
    .word 0x747ffd1d
    .word 0xd4ffff17
    .word 0x54555515
    .word 0x00000000
    .word 0x00000000
    .word 0x803f0000
    .word 0x00802400
    .word 0x1f008035
    .word 0x000e0000
    .word 0x00000400
    .word 0x04000004
    .word 0x00040000
    .word 0x00000400
    .word 0x04000004
    .word 0x00040000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x803f0000
    .word 0x00802400
    .word 0x1f008035
    .word 0x000e0000
    .word 0x00000400
    .word 0x04000004
    .word 0x00040000
    .word 0x00400400
    .word 0x04004004
    .word 0x40040040
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x803f0000
    .word 0x00802400
    .word 0x1f008035
    .word 0x000e0000
    .word 0x00000400
    .word 0x04000004
    .word 0x08040008
    .word 0x00480400
    .word 0x04004804
    .word 0x48040048
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x803f0000
    .word 0x00802400
    .word 0x1f008035
    .word 0x000e0000
    .word 0x00010400
    .word 0x04000104
    .word 0x09040009
    .word 0x00490400
    .word 0x04004904
    .word 0x49040049
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x803f0000
    .word 0x00802400
    .word 0x1f208035
    .word 0x000e2000
    .word 0x20010420
    .word 0x04200104
    .word 0x09042009
    .word 0x20490420
    .word 0x04204904
    .word 0x49042049
    .word 0x00000020
    .word 0x00000000
    .word 0x00000000
    .word 0x14000000
    .word 0x00290000
    .word 0x00402a00
    .word 0x2a00952a
    .word 0xaa2a00a9
    .word 0x00aa2a00
    .word 0x2a00aa2a
    .word 0xaa2a00aa
    .word 0x00802a00
    .word 0x1800002a
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0x00000000
    .word 0xcbb0d1b0
    .word 0xcdb0c9b0
    .word 0xd5b0d6b0
    .word 0xc8b0ceb0
    .word 0xd4b0c5b0
    .word 0xc7b0d0b0
    .word 0xcfb0ccb0
    .word 0xcab0d3b0
    .word 0xb1e5d2b0
    .word 0xc3ddd8dc
    .word 0xb1e1c9f7
    .word 0xd9eec6b0
    .word 0x0000d1f6
    .word 0xa3b1a8b1
    .word 0xa9b1fcb0
    .word 0xa7b1a6b1
    .word 0xfbb0a1b1
    .word 0xabb1acb1
    .word 0xa4b1a5b1
    .word 0xd9c5d8c6
    .word 0xaab1fdb0
    .word 0xfab0a2b1
    .word 0xd9f1e1dd
    .word 0xd2ecdfe6
    .word 0xb5f6b1f0
    .word 0x0000c0f5
    .word 0xecb2e9b2
    .word 0xe8b2eeb2
    .word 0xb2c9e5b2
    .word 0xefb2e6b2
    .word 0xeab2e7b2
    .word 0xedb2fbd4
    .word 0xc3f1eae0
    .word 0xabe9bee8
    .word 0xdfe9b6e9
    .word 0xebb2efef
    .word 0xaae2caef
    .word 0xe2e3c7e2
    .word 0x0000b1e6
    .word 0xc1b6bcb6
    .word 0xc0b6c8b6
    .word 0xbdb6beb6
    .word 0xc7b6c9b6
    .word 0xc3b6c5b6
    .word 0xc4b6c2b6
    .word 0xbde0cab6
    .word 0xc6f3c2e4
    .word 0xc6b6b9eb
    .word 0xf2f7bfb6
    .word 0xfce8c7f7
    .word 0xbcf3b6dc
    .word 0x00000000
    .word 0xb9b7b4b7
    .word 0xadb7b8b7
    .word 0xb2b7b6b7
    .word 0xb5b7b3b7
    .word 0xb7b7acb7
    .word 0xbab7b1b7
    .word 0xaab7abb7
    .word 0xf3e8a6e1
    .word 0xdcecaeb7
    .word 0xb2eeacde
    .word 0xc0deb0b7
    .word 0xecf5afb7
    .word 0x00000000
    .word 0xc9b8d0b8
    .word 0xcfb8d2b8
    .word 0xceb8cab8
    .word 0xcfdecbb8
    .word 0xcfe9d3b8
    .word 0xd1b8cdb8
    .word 0xe1dba6df
    .word 0xccb8d5dc
    .word 0xb7edefe3
    .word 0xe1f0f7e4
    .word 0xc6e4fbf4
    .word 0xbaeaa4e7
    .word 0x00000000
    .word 0xcabbc6bb
    .word 0xcebbc4bb
    .word 0xcdbbc5bb
    .word 0xd0bbccbb
    .word 0xabe8d1bb
    .word 0xc9bbe5e1
    .word 0xcfbbcbbb
    .word 0xc8bbeae4
    .word 0xd8e5a8f3
    .word 0xc1ebf2da
    .word 0xa5f1c7bb
    .word 0xf2f3d2e4
    .word 0x0000fcf6
    .word 0xd9c1d6c1
    .word 0xd5c1dac1
    .word 0xd8c1dcc1
    .word 0xddc1ebf7
    .word 0xdbc1dfc1
    .word 0xeff5d7c1
    .word 0xd7e1dec1
    .word 0xdde9a5ea
    .word 0xd4f4e0e5
    .word 0xc1e3fedd
    .word 0xf8dfacee
    .word 0xdee2a2ec
    .word 0x00000000
    .word 0xbdc6fac5
    .word 0xcbc5d0c5
    .word 0xd3c5edc5
    .word 0xd1c6e1c5
    .word 0xacc6e4c5
    .word 0xc6c6c9c5
    .word 0xb7c6c5c5
    .word 0xe7c5a4c6
    .word 0xabc6ccc5
    .word 0xc2c5c0c6
    .word 0xd5c6e0c5
    .word 0xdcc5b6c6
    .word 0x0000dac5
    .word 0xccc6d5c6
    .word 0xd3c6cbc6
    .word 0xd6c6d7c6
    .word 0xd1c6cfc6
    .word 0xacb8cdc6
    .word 0xd0c6d9c6
    .word 0xe9d9dfe4
    .word 0xdbe0b1e8
    .word 0xd2c6d4c6
    .word 0xe8efabeb
    .word 0xe4efebf5
    .word 0xcec6a7e5
    .word 0x00000000
    .word 0xebc7e9c7
    .word 0xe5c7e0c7
    .word 0xe7c7e1c7
    .word 0xe3c7ecc7
    .word 0xe6c7e4c7
    .word 0xe2c7eac7
    .word 0xdff2c0f3
    .word 0xa5f6e0ed
    .word 0xf5e0dcdc
    .word 0xf4f7d1e9
    .word 0xe8c7ebf6
    .word 0xecf4e4f3
    .word 0x00000000
    .word 0xe1cce5cc
    .word 0xe6cce2cc
    .word 0xddccdfcc
    .word 0xe9cce4cc
    .word 0xdecce3cc
    .word 0xe8cceacc
    .word 0xe7ccebcc
    .word 0xaef5a9e3
    .word 0xc3f0bee7
    .word 0xe8dce0cc
    .word 0xb0e7c3d9
    .word 0xd3f1d1e5
    .word 0x00000000
    .word 0xa8cdaccd
    .word 0xb4cdb3cd
    .word 0xaecdafcd
    .word 0xadcdb2cd
    .word 0xb1cdb0cd
    .word 0xabcda9cd
    .word 0xfae2a1d9
    .word 0xb2b6aacd
    .word 0xc5edb1b6
    .word 0xdad9cce0
    .word 0xeddceddb
    .word 0xfce4bce1
    .word 0x00000000
    .word 0xd1cdd0cd
    .word 0xd7cdcfcd
    .word 0xd3cdd8cd
    .word 0xd9cdd5cd
    .word 0xc8edd6cd
    .word 0xfbe3d4cd
    .word 0xe7dbc9f5
    .word 0xb1d8d2cd
    .word 0xd2e9bef6
    .word 0xd5e2a2d9
    .word 0xa2f5e8ee
    .word 0xd8e8dee8
    .word 0x0000eaf3
    .word 0xf3d1f9d1
    .word 0xebd1f4d1
    .word 0xf8d1eed1
    .word 0xf6d1efd1
    .word 0xf7d1f2d1
    .word 0xf3e3fad1
    .word 0xecd1f5d1
    .word 0xead1edd1
    .word 0xf1d1a6ed
    .word 0xf0d1c8ec
    .word 0xf3e2b1f7
    .word 0xbeece0e1
    .word 0x0000d5f2
    .word 0xb5d2b2d2
    .word 0xafd2b9d2
    .word 0xb0d2b6d2
    .word 0xbad2b3d2
    .word 0xcad1aed2
    .word 0xa7d7b7d2
    .word 0xadd2dede
    .word 0xb1d2c7ec
    .word 0xb4d2acd2
    .word 0xcbdab8d2
    .word 0xccd8feda
    .word 0xf4eecaea
    .word 0x00000000
    .word 0xc0d3c3d3
    .word 0xc2d3b5d3
    .word 0xbbd3bfd3
    .word 0xb9d3bed3
    .word 0xbdd3b6d3
    .word 0xbad3b8d9
    .word 0xaef0c1d3
    .word 0xdfe7b7d3
    .word 0xb8d3deef
    .word 0xabf7d5db
    .word 0xafe0d3f7
    .word 0xbcd3addc
    .word 0x0000bce3
    .word 0xc6d4cbd4
    .word 0xcfd4cad4
    .word 0xd0d4ced4
    .word 0xccd4c8d4
    .word 0xdef3cdd4
    .word 0xc5d4bfdc
    .word 0xa1e7c9d4
    .word 0xb3e3e6e9
    .word 0xf1e1b5eb
    .word 0xa9dbd9ec
    .word 0xc0eaa2e3
    .word 0xc7d4b9e8
    .word 0x00000000
    .word 0xfad4a8d5
    .word 0xa9d5a6d5
    .word 0xa3d5a7d5
    .word 0xfdd4fcd4
    .word 0xfed4a4d5
    .word 0xa5d5a2d5
    .word 0xeadefbd4
    .word 0xabe9f5d7
    .word 0xb8dfeedf
    .word 0xc4eda1d5
    .word 0xe5dffef7
    .word 0xc6f2e4f0
    .word 0x00000000
    .word 0xc5d5a4b3
    .word 0xc9d5c2d5
    .word 0xc7d5c6d5
    .word 0xcfd5cad5
    .word 0xcdd5cbd5
    .word 0xc8d5ccd5
    .word 0xb0e8c3d5
    .word 0xc1d5aff3
    .word 0xc4d5ced5
    .word 0xb5dbd6e1
    .word 0xebd8afe2
    .word 0xd1e6a4e1
    .word 0x00000000
    .word 0xddd6dcd6
    .word 0xe0d6ded6
    .word 0xe5d6dbd6
    .word 0xe1d6e8d6
    .word 0xe4d6e6d6
    .word 0xe2d6e7d6
    .word 0xd0ebe3d6
    .word 0xdfd6fbe6
    .word 0xa8e6a7e7
    .word 0xfadfd8ed
    .word 0xa6f4a7dd
    .word 0xfcf4edf4
    .word 0x00000000
    .word 0xa7b0aeb0
    .word 0xadb0a4b0
    .word 0xa9b0a3b0
    .word 0xa6b0acb0
    .word 0xa5b0abb0
    .word 0xaab0a8b0
    .word 0xd3eaafb0
    .word 0xdfdeb0f6
    .word 0xa8e8c8e0
    .word 0xcdefc8e6
    .word 0xc1edc9e0
    .word 0x00000000
    .word 0xc4b0c2b0
    .word 0xbeb0c1b0
    .word 0xbcb0bdb0
    .word 0xc3b0c0b0
    .word 0xbbe0eadb
    .word 0xe9f7d6de
    .word 0xa1f7f1e6
    .word 0xaee1bfb0
    .word 0xdbe5dae2
    .word 0xfaf1e1e9
    .word 0xfcf2c1e6
    .word 0x0000cbf6
    .word 0xc9b3fab2
    .word 0xc2b3ccb3
    .word 0xdcb2ccb2
    .word 0xfeb3deb4
    .word 0xd8b3d2f1
    .word 0xcbeaf0b3
    .word 0xd3b4afe1
    .word 0xa6b4cbb4
    .word 0xa1b3b5b3
    .word 0xa7b3abb4
    .word 0xceb4c5b2
    .word 0x0000e9b2
    .word 0xf3b4c4b5
    .word 0xc5b6d8b5
    .word 0xceb6adb6
    .word 0xcbb5f7b4
    .word 0xbcf1a1b6
    .word 0xd4b5d2b5
    .word 0xe7b5f3b5
    .word 0xa8b6b3b5
    .word 0xb1b5c8b5
    .word 0xe3b5d3b6
    .word 0xc0b5fab4
    .word 0x00000000
    .word 0xabbdadbd
    .word 0xb1bdb2bd
    .word 0xafbdb5bd
    .word 0xb4bdaebd
    .word 0xacbdaabd
    .word 0xb3bda9bd
    .word 0xd6e7f1ea
    .word 0xb0bdade7
    .word 0xe4edf0f1
    .word 0xf8f4aee4
    .word 0xddf4fcdc
    .word 0x00000000
    .word 0xaabfc9bf
    .word 0xe1d8b4bf
    .word 0xd7bfcbbf
    .word 0xdcbff7da
    .word 0xdabfc6bf
    .word 0xe0bfd5bf
    .word 0xbcbfecbf
    .word 0xbfbfccbf
    .word 0xe9bff6bf
    .word 0xedbfa7c0
    .word 0xb9bff3bf
    .word 0x0000a8bf
    .word 0xc3c0bcc0
    .word 0xc0c0b6c0
    .word 0xb7c0b8c0
    .word 0xbac0b9c0
    .word 0xbdc0bbc0
    .word 0xbfc0bec0
    .word 0xc2c0c1c0
    .word 0xb0e1c4c0
    .word 0xade9ede4
    .word 0xbdeeb5ec
    .word 0xdcf1e7ef
    .word 0x00000000
    .word 0xf4c1f9c1
    .word 0xbdc2f7c1
    .word 0xefc1f5c1
    .word 0xb5c2f8c1
    .word 0xf1c1f6c1
    .word 0xf2c1afe4
    .word 0xdee5f0c1
    .word 0xd6eff3c1
    .word 0xb8e7f2e6
    .word 0xbcecb3ef
    .word 0xccf6d6ec
    .word 0x0000d2f0
    .word 0xb8c4bfc4
    .word 0xbbc4bec4
    .word 0xbdc4b7c4
    .word 0xb9c4c1c4
    .word 0xbac4bcc4
    .word 0xb6c4b2c4
    .word 0xc0c4c2c4
    .word 0xe5e3b4c4
    .word 0xefd8b5c4
    .word 0xd9dce9db
    .word 0xe2eea4eb
    .word 0x00000000
    .word 0xdcc4eac4
    .word 0xc7c4dac4
    .word 0xa9c5f4c4
    .word 0xcfc4e3c4
    .word 0xd8c4d1c4
    .word 0xe0c4aec5
    .word 0xc3c4c4c4
    .word 0xa3c5eec4
    .word 0xd4c4fec4
    .word 0xe1c4b3d5
    .word 0xc5e0c9c4
    .word 0x00000000
    .word 0xd8c4e3c4
    .word 0xe0c4e1c4
    .word 0xdfc4e6c4
    .word 0xe2c4e4c4
    .word 0xddc4e5c4
    .word 0xc7eadec4
    .word 0xbbece7c4
    .word 0xf2f6feed
    .word 0xa5e2e8db
    .word 0xa3d9f5e2
    .word 0xabedf2ec
    .word 0x0000eaee
    .word 0xd5c7d7c7
    .word 0xd6c7d9c7
    .word 0xdac7d8c7
    .word 0xdcc7dbc7
    .word 0xfbf1dec7
    .word 0xddc7dfc7
    .word 0xecdedfe0
    .word 0xb7efd5e9
    .word 0xbae0cbdc
    .word 0xc0f4fbf2
    .word 0xdae4dbe2
    .word 0x0000c4df
    .word 0xf2c7f3c7
    .word 0xf1c7efc7
    .word 0xf0c7f4c7
    .word 0xc7f2f5c7
    .word 0xb4d9c3f4
    .word 0xfaf6b0f2
    .word 0xd9e5cfe5
    .word 0xf6c7e4ea
    .word 0xece1b1e9
    .word 0xf8f2d0e4
    .word 0xfcf7cfdb
    .word 0x0000dcf4
    .word 0xe7c8cbc8
    .word 0xeec8d5c8
    .word 0xcfc8d9c8
    .word 0xcec8ebc8
    .word 0xbbc8c8c8
    .word 0xc3c8ddc8
    .word 0xf5c8f3c8
    .word 0xbec8bcc8
    .word 0xc6c8c0c8
    .word 0xdcc8cac8
    .word 0xd4c8d0c8
    .word 0x00000000
    .word 0xc4cfc2cf
    .word 0xbfcfc5cf
    .word 0xc0cfc3cf
    .word 0xbccfc1cf
    .word 0xbecfb9cf
    .word 0xa3bbbacf
    .word 0xdae5bdcf
    .word 0xeff7bbcf
    .word 0xc8dfa6e8
    .word 0xd4e8f2e1
    .word 0xfdf0cced
    .word 0x0000c1f3
    .word 0xd4d0d0d0
    .word 0xcbd0ced0
    .word 0xcdd0c7d0
    .word 0xd2d0d5d0
    .word 0xd1d0ccd0
    .word 0xd3d0c8d0
    .word 0xcad0ace3
    .word 0xc9d0cfd0
    .word 0xa9dff4dc
    .word 0xbce2fedc
    .word 0xeadacaed
    .word 0x00000000
    .word 0xfdd5fed5
    .word 0xfbd5a4d6
    .word 0xf7d5f9d5
    .word 0xa3d6f5d5
    .word 0xf6d5a2d6
    .word 0xf4d5e7e1
    .word 0xddf3fad5
    .word 0xa3effcd5
    .word 0xf8d5bfe1
    .word 0xebf6bada
    .word 0xa1d6dbee
    .word 0x00000000
    .word 0x000c0204
    .word 0x00240014
    .word 0x00840044
    .word 0x00420104
    .word 0x01020082
    .word 0x0012000a
    .word 0x04020022
    .word 0x02020404
    .word 0x04010009
    .word 0x04020201
    .word 0x04020402
    .word 0x04020402
    .word 0x00000000
    .word 0x54555515
    .word 0x54aaaa15
    .word 0x64a96a19
    .word 0xa4a55a1a
    .word 0xa496961a
    .word 0xa45aa51a
    .word 0xa466991a
    .word 0xa4a96a1a
    .word 0x64aaaa19
    .word 0x54555515
    .word 0x00000000
    .word 0x00000000
    .word 0x54555515
    .word 0x54aaaa15
    .word 0x64a96a19
    .word 0xa4a55a1a
    .word 0xa496961a
    .word 0xa45aa51a
    .word 0xa466991a
    .word 0xa4a96a1a
    .word 0x64aaaa19
    .word 0x54555515
    .word 0x00000000
    .word 0xebb0ecb0
    .word 0xe3b0e6b0
    .word 0xe5b0e0b0
    .word 0xe1b0e9b0
    .word 0xdfb0e7b0
    .word 0xeab0e4b0
    .word 0xe2b0e8b0
    .word 0xe6daedb0
    .word 0xa3f1e0db
    .word 0xb2f4d3ee
    .word 0x0000adf1
    .word 0xc2b3c6b3
    .word 0xbfb3c1b3
    .word 0xbcb3beb3
    .word 0xc4b3c3b3
    .word 0xbbb3bdb3
    .word 0xa1e8dfda
    .word 0xc1e0c0b3
    .word 0xd3def7d8
    .word 0xb7e5c8da
    .word 0xb3f6b4e9
    .word 0x0000d7ed
    .word 0xf8b4fab4
    .word 0xf7b4fdb4
    .word 0xf4b4fcb4
    .word 0xfeb4fbb4
    .word 0xf9b4f5b4
    .word 0xa1b5ecf7
    .word 0xb7e1e9e7
    .word 0xf6b4cae5
    .word 0xe6e6bedf
    .word 0xa4dcaae7
    .word 0x0000b0df
    .word 0xe1b6e0b6
    .word 0xe3b6e4b6
    .word 0xe9b6e6b6
    .word 0xcddfe2f5
    .word 0xdfb6e5b6
    .word 0xe8b6e7b6
    .word 0xd4cde2b6
    .word 0xeceedeb6
    .word 0xe1dfd6f1
    .word 0xf5e3b6e7
    .word 0x0000dee8
    .word 0xddb7d6b7
    .word 0xdcb7d7b7
    .word 0xdbb7dfb7
    .word 0xd2b7d5b7
    .word 0xd9b7d8b7
    .word 0xdeb7e0b7
    .word 0xdab7d4b7
    .word 0xf7f7fbe8
    .word 0xd3b7e3e7
    .word 0xafe5c7d9
    .word 0x0000f7f6
    .word 0xe2b7e7b7
    .word 0xe5b7e1b7
    .word 0xe6b7e8b7
    .word 0xeeb7eab7
    .word 0xefb7ecb7
    .word 0xebb7edb7
    .word 0xe3b7e4b7
    .word 0xbad9e9b7
    .word 0xf4dfbfed
    .word 0xd7ddbadb
    .word 0x0000e3e3
    .word 0xbab9bbb9
    .word 0xb7b9b9b9
    .word 0xb4b9b5b9
    .word 0xb3b9b6b9
    .word 0xf4f3edea
    .word 0xfed8b8b9
    .word 0xb8dab8e1
    .word 0xd1f3b8f7
    .word 0xdce5dbe8
    .word 0xc3e7c5e6
    .word 0x0000b0ec
    .word 0xc5bac3ba
    .word 0xc0bac1ba
    .word 0xc4bac6ba
    .word 0xbfbaa9f0
    .word 0xc2babbea
    .word 0xefddbeba
    .word 0xb0e5d1ba
    .word 0xc6e0e4b8
    .word 0xb6dee3e0
    .word 0xbaf2a9e5
    .word 0x0000abf2
    .word 0xf2bbcdba
    .word 0xf0bbeebb
    .word 0xf5bbf1bb
    .word 0xf6bbefbb
    .word 0xf4bbf3bb
    .word 0xb7e2edbb
    .word 0xebf1c1ef
    .word 0xd8eee5d8
    .word 0xbddeabdf
    .word 0xecefebe0
    .word 0x0000b6f3
    .word 0xcfc1cbc1
    .word 0xc6c1c4c1
    .word 0xc5c1c9c1
    .word 0xc8c1cec1
    .word 0xcac1cdc1
    .word 0xccc1c3c1
    .word 0xc7c1d4e7
    .word 0xdae0bce5
    .word 0xb2e2c9ee
    .word 0xa4ded3f0
    .word 0x0000cdde
    .word 0xc3c2c9c2
    .word 0xcac2ccc2
    .word 0xc4c2c7c2
    .word 0xc2c2c5c2
    .word 0xbfc2c6c2
    .word 0xb5e9c0c2
    .word 0xdbdecbc2
    .word 0xdaf1c1c2
    .word 0xf6ebcce3
    .word 0xf9efc8c2
    .word 0x00000000
    .word 0xb9c7bfc7
    .word 0xc0c7bdc7
    .word 0xbac7bbc7
    .word 0xc4f5cfef
    .word 0xbec7bcc7
    .word 0xdff1dee3
    .word 0xc1ecc9e9
    .word 0xcde6def2
    .word 0xa8eabaef
    .word 0xeaefc7f4
    .word 0x00000000
    .word 0xa8c8abc8
    .word 0xb0c8a6c8
    .word 0xafc8aac8
    .word 0xaec8adc8
    .word 0xa7c8b9da
    .word 0xb9e7e9f2
    .word 0xfdeef5dc
    .word 0xdcf7acc8
    .word 0xaae3fae9
    .word 0xa9c8b0ee
    .word 0x0000dcf3
    .word 0xebc8e7c8
    .word 0xe5c8e8c8
    .word 0xeac8e9c8
    .word 0xe9e0ecc8
    .word 0xa6e5e3c8
    .word 0xe6c8e4c8
    .word 0xe0f1c8e7
    .word 0xb8deacf2
    .word 0xb2e4eadd
    .word 0xa8efe1e4
    .word 0x00000000
    .word 0xdfcbd5cb
    .word 0xd8cbd9cb
    .word 0xe0cbd7cb
    .word 0xdccbdecb
    .word 0xddcbd5f6
    .word 0xdacbd6cb
    .word 0xedd9f9f3
    .word 0xd5dabce0
    .word 0xbae3dbcb
    .word 0xf8ddb3e4
    .word 0x0000a2f6
    .word 0xb9d5bdd5
    .word 0xbcd5bed5
    .word 0xb6d5b4d5
    .word 0xb3d5b7d5
    .word 0xb8d5b5d5
    .word 0xc0d5b0d5
    .word 0xbfd5bad5
    .word 0xb1d5b2d5
    .word 0xdedabbd5
    .word 0xb9ecf8de
    .word 0x00000000
    .word 0xc5d7e2d5
    .word 0xdbd5dfd5
    .word 0xe3d5dcd5
    .word 0xded5dad5
    .word 0xd8dafce9
    .word 0xddd5e1d5
    .word 0xd1f0def1
    .word 0xddede0d5
    .word 0xd8f2a1df
    .word 0xcfe8f7f4
    .word 0x00000000
    .word 0xc0d7c5d7
    .word 0xbfd7bdd7
    .word 0xc6d7c1d7
    .word 0xbed7c3d7
    .word 0xaae5c7d7
    .word 0xc4d7c2d7
    .word 0xedefbded
    .word 0xccecc3e4
    .word 0xbed9b7e4
    .word 0xc2dafaec
    .word 0x0000aadf
.Ldata_20749:
    .byte 0x15
    .byte 0x14
    .byte 0x14
    .byte 0x15
    .word 0x14141415
    .word 0x16161515
    .word 0x15161616
    .word 0x00000015
    .word 0x14141415
    .word 0x15151414
    .word 0x15151616
    .word 0x15161616
    .word 0x00000015
    .byte 0x3e
    .byte 0x83
    .byte 0xea
    .byte 0x00
    .word 0x000b000b

.section .text.vocoder_block_43,"ax",%progbits
.balign 4
.Ldata_20766:
    .byte 0xeb
    .byte 0x47
    .byte 0xf9
    .byte 0x17
    .word 0x0a460e62
    .word 0x068a07fe
    .word 0x04cb0588
    .word 0x03c9043b

.section .text.vocoder_block_44,"ax",%progbits
.balign 4
.Ldata_20778:
    .word 0x2e2f3031
    .word 0x002d2d2d
    .word 0x7f399438
    .word 0x2c8bdecf
.Ldata_20780:
    .word 0x00006488
    .word 0xffff9b78
.Ldata_20781:
    .byte 0xfe
    .byte 0xff
    .byte 0xff
    .byte 0x00
    .word 0x00000000
    .word 0x00003232
    .word 0x00006162
    .word 0x00006163
    .word 0x00003332

.section .rodata.unpack_masks,"a",%progbits
.global asm_unpack_masks
asm_unpack_masks:
    .byte 128,64,32,16,8,4,2,1
.section .note.GNU-stack,"",%progbits
