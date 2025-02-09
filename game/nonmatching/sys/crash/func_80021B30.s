.section .text
glabel gsDrawControllerInputs
  /* 022730 80021B30 27BDFF70 */     addiu $sp, $sp, -0x90
  /* 022734 80021B34 AFB30028 */        sw $s3, 0x28($sp)
  /* 022738 80021B38 3C138004 */       lui $s3, %hi(gDisplayListHead)
  /* 02273C 80021B3C 267365B0 */     addiu $s3, $s3, %lo(gDisplayListHead)
  /* 022740 80021B40 AFBF002C */        sw $ra, 0x2c($sp)
  /* 022744 80021B44 AFB20024 */        sw $s2, 0x24($sp)
  /* 022748 80021B48 AFB10020 */        sw $s1, 0x20($sp)
  /* 02274C 80021B4C AFB0001C */        sw $s0, 0x1c($sp)
  /* 022750 80021B50 00803825 */        or $a3, $a0, $zero
  /* 022754 80021B54 8CE50074 */        lw $a1, 0x74($a3)
  /* 022758 80021B58 02602025 */        or $a0, $s3, $zero
  /* 02275C 80021B5C 0C0058CE */       jal func_80016338
  /* 022760 80021B60 00003025 */        or $a2, $zero, $zero
  /* 022764 80021B64 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022768 80021B68 3C0FE700 */       lui $t7, 0xe700
  /* 02276C 80021B6C 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 022770 80021B70 260E0008 */     addiu $t6, $s0, 8
  /* 022774 80021B74 AE6E0000 */        sw $t6, ($s3) # gDisplayListHead + 0
  /* 022778 80021B78 AE000004 */        sw $zero, 4($s0)
  /* 02277C 80021B7C AE0F0000 */        sw $t7, ($s0)
  /* 022780 80021B80 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022784 80021B84 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 022788 80021B88 3C080030 */       lui $t0, 0x30
  /* 02278C 80021B8C 26180008 */     addiu $t8, $s0, 8
  /* 022790 80021B90 AE780000 */        sw $t8, ($s3) # gDisplayListHead + 0
  /* 022794 80021B94 AE080004 */        sw $t0, 4($s0)
  /* 022798 80021B98 AE190000 */        sw $t9, ($s0)
  /* 02279C 80021B9C 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 0227A0 80021BA0 3C0AE200 */       lui $t2, (0xE200001C >> 16) # 3791650844
  /* 0227A4 80021BA4 354A001C */       ori $t2, $t2, (0xE200001C & 0xFFFF) # 3791650844
  /* 0227A8 80021BA8 26090008 */     addiu $t1, $s0, 8
  /* 0227AC 80021BAC AE690000 */        sw $t1, ($s3) # gDisplayListHead + 0
  /* 0227B0 80021BB0 AE000004 */        sw $zero, 4($s0)
  /* 0227B4 80021BB4 AE0A0000 */        sw $t2, ($s0)
  /* 0227B8 80021BB8 8E710000 */        lw $s1, ($s3) # gDisplayListHead + 0
  /* 0227BC 80021BBC 3C0CF700 */       lui $t4, 0xf700
  /* 0227C0 80021BC0 2404FFFF */     addiu $a0, $zero, -1
  /* 0227C4 80021BC4 262B0008 */     addiu $t3, $s1, 8
  /* 0227C8 80021BC8 AE6B0000 */        sw $t3, ($s3) # gDisplayListHead + 0
  /* 0227CC 80021BCC 0C001B5C */       jal gsGetFillColor
  /* 0227D0 80021BD0 AE2C0000 */        sw $t4, ($s1)
  /* 0227D4 80021BD4 AE220004 */        sw $v0, 4($s1)
  /* 0227D8 80021BD8 3C068004 */       lui $a2, %hi(gSysController + 8)
  /* 0227DC 80021BDC 240D0001 */     addiu $t5, $zero, 1
  /* 0227E0 80021BE0 AFAD0010 */        sw $t5, 0x10($sp)
  /* 0227E4 80021BE4 80C65478 */        lb $a2, %lo(gSysController + 8)($a2)
  /* 0227E8 80021BE8 2404003C */     addiu $a0, $zero, 0x3c
  /* 0227EC 80021BEC 240500B3 */     addiu $a1, $zero, 0xb3
  /* 0227F0 80021BF0 0C008638 */       jal func_800218E0
  /* 0227F4 80021BF4 24070003 */     addiu $a3, $zero, 3
  /* 0227F8 80021BF8 3C068004 */       lui $a2, %hi(gSysController + 9)
  /* 0227FC 80021BFC 240E0001 */     addiu $t6, $zero, 1
  /* 022800 80021C00 AFAE0010 */        sw $t6, 0x10($sp)
  /* 022804 80021C04 80C65479 */        lb $a2, %lo(gSysController + 9)($a2)
  /* 022808 80021C08 2404005C */     addiu $a0, $zero, 0x5c
  /* 02280C 80021C0C 240500B3 */     addiu $a1, $zero, 0xb3
  /* 022810 80021C10 0C008638 */       jal func_800218E0
  /* 022814 80021C14 24070003 */     addiu $a3, $zero, 3

  /* 022818 80021C18 3C128004 */       lui $s2, %hi(D_80046610)
  /* 02281C 80021C1C 26526610 */     addiu $s2, $s2, %lo(D_80046610)
  /* 022820 80021C20 8E4F0000 */        lw $t7, ($s2) # D_80046610 + 0
  /* 022824 80021C24 2404003C */     addiu $a0, $zero, 0x3c
  /* 022828 80021C28 240500C3 */     addiu $a1, $zero, 0xc3
  /* 02282C 80021C2C 448F2000 */      mtc1 $t7, $f4
  /* 022830 80021C30 05E10005 */      bgez $t7, .L80021C48
  /* 022834 80021C34 468021A0 */   cvt.s.w $f6, $f4
  /* 022838 80021C38 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 02283C 80021C3C 44814000 */      mtc1 $at, $f8 # 4294967300.0 to cop1
  /* 022840 80021C40 00000000 */       nop 
  /* 022844 80021C44 46083180 */     add.s $f6, $f6, $f8
  .L80021C48:
  /* 022848 80021C48 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 02284C 80021C4C 44815000 */      mtc1 $at, $f10 # 0.00390625 to cop1
  /* 022850 80021C50 24180002 */     addiu $t8, $zero, 2
  /* 022854 80021C54 24190001 */     addiu $t9, $zero, 1
  /* 022858 80021C58 460A3402 */     mul.s $f16, $f6, $f10
  /* 02285C 80021C5C AFB90014 */        sw $t9, 0x14($sp)
  /* 022860 80021C60 AFB80010 */        sw $t8, 0x10($sp)
  /* 022864 80021C64 24070005 */     addiu $a3, $zero, 5
  /* 022868 80021C68 44068000 */      mfc1 $a2, $f16
  /* 02286C 80021C6C 0C008642 */       jal func_80021908
  /* 022870 80021C70 00000000 */       nop 
  /* 022874 80021C74 3C088004 */       lui $t0, %hi(D_80046614)
  /* 022878 80021C78 8D086614 */        lw $t0, %lo(D_80046614)($t0)
  /* 02287C 80021C7C 2410005F */     addiu $s0, $zero, 0x5f
  /* 022880 80021C80 02002025 */        or $a0, $s0, $zero
  /* 022884 80021C84 44889000 */      mtc1 $t0, $f18
  /* 022888 80021C88 240500C3 */     addiu $a1, $zero, 0xc3
  /* 02288C 80021C8C 05010005 */      bgez $t0, .L80021CA4
  /* 022890 80021C90 46809120 */   cvt.s.w $f4, $f18
  /* 022894 80021C94 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 022898 80021C98 44814000 */      mtc1 $at, $f8 # 4294967300.0 to cop1
  /* 02289C 80021C9C 00000000 */       nop 
  /* 0228A0 80021CA0 46082100 */     add.s $f4, $f4, $f8
  .L80021CA4:
  /* 0228A4 80021CA4 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 0228A8 80021CA8 44813000 */      mtc1 $at, $f6 # 0.00390625 to cop1
  /* 0228AC 80021CAC 24090002 */     addiu $t1, $zero, 2
  /* 0228B0 80021CB0 240A0001 */     addiu $t2, $zero, 1
  /* 0228B4 80021CB4 46062282 */     mul.s $f10, $f4, $f6
  /* 0228B8 80021CB8 AFAA0014 */        sw $t2, 0x14($sp)
  /* 0228BC 80021CBC AFA90010 */        sw $t1, 0x10($sp)
  /* 0228C0 80021CC0 24070005 */     addiu $a3, $zero, 5
  /* 0228C4 80021CC4 44065000 */      mfc1 $a2, $f10
  /* 0228C8 80021CC8 0C008642 */       jal func_80021908
  /* 0228CC 80021CCC 00000000 */       nop 
  /* 0228D0 80021CD0 3C0B8004 */       lui $t3, %hi(D_80044FB4)
  /* 0228D4 80021CD4 8D6B4FB4 */        lw $t3, %lo(D_80044FB4)($t3)
  /* 0228D8 80021CD8 26100023 */     addiu $s0, $s0, 0x23
  /* 0228DC 80021CDC 02002025 */        or $a0, $s0, $zero
  /* 0228E0 80021CE0 448B8000 */      mtc1 $t3, $f16
  /* 0228E4 80021CE4 240500C3 */     addiu $a1, $zero, 0xc3
  /* 0228E8 80021CE8 05610005 */      bgez $t3, .L80021D00
  /* 0228EC 80021CEC 468084A0 */   cvt.s.w $f18, $f16
  /* 0228F0 80021CF0 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 0228F4 80021CF4 44814000 */      mtc1 $at, $f8 # 4294967300.0 to cop1
  /* 0228F8 80021CF8 00000000 */       nop 
  /* 0228FC 80021CFC 46089480 */     add.s $f18, $f18, $f8
  .L80021D00:
  /* 022900 80021D00 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 022904 80021D04 44812000 */      mtc1 $at, $f4 # 0.00390625 to cop1
  /* 022908 80021D08 240C0002 */     addiu $t4, $zero, 2
  /* 02290C 80021D0C 240D0001 */     addiu $t5, $zero, 1
  /* 022910 80021D10 46049182 */     mul.s $f6, $f18, $f4
  /* 022914 80021D14 AFAD0014 */        sw $t5, 0x14($sp)
  /* 022918 80021D18 AFAC0010 */        sw $t4, 0x10($sp)
  /* 02291C 80021D1C 24070005 */     addiu $a3, $zero, 5
  /* 022920 80021D20 44063000 */      mfc1 $a2, $f6
  /* 022924 80021D24 0C008642 */       jal func_80021908
  /* 022928 80021D28 00000000 */       nop 
  /* 02292C 80021D2C 8E4E0000 */        lw $t6, ($s2) # D_80046610 + 0
  /* 022930 80021D30 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 022934 80021D34 44810000 */      mtc1 $at, $f0 # 0.00390625 to cop1
  /* 022938 80021D38 448E5000 */      mtc1 $t6, $f10
  /* 02293C 80021D3C 26100023 */     addiu $s0, $s0, 0x23
  /* 022940 80021D40 02002025 */        or $a0, $s0, $zero
  /* 022944 80021D44 240500C3 */     addiu $a1, $zero, 0xc3
  /* 022948 80021D48 05C10005 */      bgez $t6, .L80021D60
  /* 02294C 80021D4C 46805420 */   cvt.s.w $f16, $f10
  /* 022950 80021D50 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 022954 80021D54 44814000 */      mtc1 $at, $f8 # 4294967300.0 to cop1
  /* 022958 80021D58 00000000 */       nop 
  /* 02295C 80021D5C 46088400 */     add.s $f16, $f16, $f8
  .L80021D60:
  /* 022960 80021D60 3C0F8004 */       lui $t7, %hi(D_80046614)
  /* 022964 80021D64 8DEF6614 */        lw $t7, %lo(D_80046614)($t7)
  /* 022968 80021D68 46008482 */     mul.s $f18, $f16, $f0
  /* 02296C 80021D6C 448F2000 */      mtc1 $t7, $f4
  /* 022970 80021D70 05E10005 */      bgez $t7, .L80021D88
  /* 022974 80021D74 468021A0 */   cvt.s.w $f6, $f4
  /* 022978 80021D78 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 02297C 80021D7C 44815000 */      mtc1 $at, $f10 # 4294967300.0 to cop1
  /* 022980 80021D80 00000000 */       nop 
  /* 022984 80021D84 460A3180 */     add.s $f6, $f6, $f10
  .L80021D88:
  /* 022988 80021D88 46003202 */     mul.s $f8, $f6, $f0
  /* 02298C 80021D8C 3C188004 */       lui $t8, %hi(D_80044FB4)
  /* 022990 80021D90 8F184FB4 */        lw $t8, %lo(D_80044FB4)($t8)
  /* 022994 80021D94 44982000 */      mtc1 $t8, $f4
  /* 022998 80021D98 46089400 */     add.s $f16, $f18, $f8
  /* 02299C 80021D9C 07010005 */      bgez $t8, .L80021DB4
  /* 0229A0 80021DA0 468022A0 */   cvt.s.w $f10, $f4
  /* 0229A4 80021DA4 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 0229A8 80021DA8 44813000 */      mtc1 $at, $f6 # 4294967300.0 to cop1
  /* 0229AC 80021DAC 00000000 */       nop 
  /* 0229B0 80021DB0 46065280 */     add.s $f10, $f10, $f6
  .L80021DB4:
  /* 0229B4 80021DB4 46005482 */     mul.s $f18, $f10, $f0
  /* 0229B8 80021DB8 24190002 */     addiu $t9, $zero, 2
  /* 0229BC 80021DBC 24080001 */     addiu $t0, $zero, 1
  /* 0229C0 80021DC0 AFA80014 */        sw $t0, 0x14($sp)
  /* 0229C4 80021DC4 AFB90010 */        sw $t9, 0x10($sp)
  /* 0229C8 80021DC8 24070005 */     addiu $a3, $zero, 5
  /* 0229CC 80021DCC 46128200 */     add.s $f8, $f16, $f18
  /* 0229D0 80021DD0 44064000 */      mfc1 $a2, $f8
  /* 0229D4 80021DD4 0C008642 */       jal func_80021908
  /* 0229D8 80021DD8 00000000 */       nop 
  /* 0229DC 80021DDC 3C09800A */       lui $t1, %hi(D_8009D2D0)
  /* 0229E0 80021DE0 8D29D2D0 */        lw $t1, %lo(D_8009D2D0)($t1)
  /* 0229E4 80021DE4 26100046 */     addiu $s0, $s0, 0x46
  /* 0229E8 80021DE8 02002025 */        or $a0, $s0, $zero
  /* 0229EC 80021DEC 44892000 */      mtc1 $t1, $f4
  /* 0229F0 80021DF0 240500C3 */     addiu $a1, $zero, 0xc3
  /* 0229F4 80021DF4 05210005 */      bgez $t1, .L80021E0C
  /* 0229F8 80021DF8 468021A0 */   cvt.s.w $f6, $f4
  /* 0229FC 80021DFC 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 022A00 80021E00 44815000 */      mtc1 $at, $f10 # 4294967300.0 to cop1
  /* 022A04 80021E04 00000000 */       nop 
  /* 022A08 80021E08 460A3180 */     add.s $f6, $f6, $f10
  .L80021E0C:
  /* 022A0C 80021E0C 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 022A10 80021E10 44818000 */      mtc1 $at, $f16 # 0.00390625 to cop1
  /* 022A14 80021E14 240A0002 */     addiu $t2, $zero, 2
  /* 022A18 80021E18 240B0001 */     addiu $t3, $zero, 1
  /* 022A1C 80021E1C 46103482 */     mul.s $f18, $f6, $f16
  /* 022A20 80021E20 AFAB0014 */        sw $t3, 0x14($sp)
  /* 022A24 80021E24 AFAA0010 */        sw $t2, 0x10($sp)
  /* 022A28 80021E28 24070005 */     addiu $a3, $zero, 5
  /* 022A2C 80021E2C 44069000 */      mfc1 $a2, $f18
  /* 022A30 80021E30 0C008642 */       jal func_80021908
  /* 022A34 80021E34 00000000 */       nop 
  /* 022A38 80021E38 3C0C8004 */       lui $t4, %hi(D_80044FB8)
  /* 022A3C 80021E3C 8D8C4FB8 */        lw $t4, %lo(D_80044FB8)($t4)
  /* 022A40 80021E40 26040023 */     addiu $a0, $s0, 0x23
  /* 022A44 80021E44 240500C3 */     addiu $a1, $zero, 0xc3
  /* 022A48 80021E48 448C4000 */      mtc1 $t4, $f8
  /* 022A4C 80021E4C 05810005 */      bgez $t4, .L80021E64
  /* 022A50 80021E50 46804120 */   cvt.s.w $f4, $f8
  /* 022A54 80021E54 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 022A58 80021E58 44815000 */      mtc1 $at, $f10 # 4294967300.0 to cop1
  /* 022A5C 80021E5C 00000000 */       nop 
  /* 022A60 80021E60 460A2100 */     add.s $f4, $f4, $f10
  .L80021E64:
  /* 022A64 80021E64 3C013B80 */       lui $at, (0x3B800000 >> 16) # 0.00390625
  /* 022A68 80021E68 44813000 */      mtc1 $at, $f6 # 0.00390625 to cop1
  /* 022A6C 80021E6C 240D0002 */     addiu $t5, $zero, 2
  /* 022A70 80021E70 240E0001 */     addiu $t6, $zero, 1
  /* 022A74 80021E74 46062402 */     mul.s $f16, $f4, $f6
  /* 022A78 80021E78 AFAE0014 */        sw $t6, 0x14($sp)
  /* 022A7C 80021E7C AFAD0010 */        sw $t5, 0x10($sp)
  /* 022A80 80021E80 24070005 */     addiu $a3, $zero, 5
  /* 022A84 80021E84 44068000 */      mfc1 $a2, $f16
  /* 022A88 80021E88 0C008642 */       jal func_80021908
  /* 022A8C 80021E8C 00000000 */       nop 
  /* 022A90 80021E90 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022A94 80021E94 3C18E700 */       lui $t8, 0xe700
  /* 022A98 80021E98 3C08F700 */       lui $t0, 0xf700
  /* 022A9C 80021E9C 260F0008 */     addiu $t7, $s0, 8
  /* 022AA0 80021EA0 AE6F0000 */        sw $t7, ($s3) # gDisplayListHead + 0
  /* 022AA4 80021EA4 AE000004 */        sw $zero, 4($s0)
  /* 022AA8 80021EA8 AE180000 */        sw $t8, ($s0)
  /* 022AAC 80021EAC 8E710000 */        lw $s1, ($s3) # gDisplayListHead + 0
  /* 022AB0 80021EB0 3C04FF00 */       lui $a0, (0xFF0000FF >> 16) # 4278190335
  /* 022AB4 80021EB4 348400FF */       ori $a0, $a0, (0xFF0000FF & 0xFFFF) # 4278190335
  /* 022AB8 80021EB8 26390008 */     addiu $t9, $s1, 8
  /* 022ABC 80021EBC AE790000 */        sw $t9, ($s3) # gDisplayListHead + 0
  /* 022AC0 80021EC0 0C001B5C */       jal gsGetFillColor
  /* 022AC4 80021EC4 AE280000 */        sw $t0, ($s1)
  /* 022AC8 80021EC8 AE220004 */        sw $v0, 4($s1)
  /* 022ACC 80021ECC 8E430000 */        lw $v1, ($s2) # D_80046610 + 0
  /* 022AD0 80021ED0 2405001E */     addiu $a1, $zero, 0x1e
  /* 022AD4 80021ED4 240600D2 */     addiu $a2, $zero, 0xd2
  /* 022AD8 80021ED8 00031882 */       srl $v1, $v1, 2
  /* 022ADC 80021EDC 2C610101 */     sltiu $at, $v1, 0x101
  /* 022AE0 80021EE0 14200003 */      bnez $at, .L80021EF0
  /* 022AE4 80021EE4 240900D3 */     addiu $t1, $zero, 0xd3
  /* 022AE8 80021EE8 10000002 */         b .L80021EF4
  /* 022AEC 80021EEC 24020100 */     addiu $v0, $zero, 0x100
  .L80021EF0:
  /* 022AF0 80021EF0 00601025 */        or $v0, $v1, $zero
  .L80021EF4:
  /* 022AF4 80021EF4 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022AF8 80021EF8 2447001E */     addiu $a3, $v0, 0x1e
  /* 022AFC 80021EFC AFA90010 */        sw $t1, 0x10($sp)
  /* 022B00 80021F00 260A0008 */     addiu $t2, $s0, 8
  /* 022B04 80021F04 AE6A0000 */        sw $t2, ($s3) # gDisplayListHead + 0
  /* 022B08 80021F08 0C00868D */       jal gsFillRectangleDL
  /* 022B0C 80021F0C 02002025 */        or $a0, $s0, $zero
  /* 022B10 80021F10 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022B14 80021F14 3C0CE700 */       lui $t4, 0xe700
  /* 022B18 80021F18 3C0EF700 */       lui $t6, 0xf700
  /* 022B1C 80021F1C 260B0008 */     addiu $t3, $s0, 8
  /* 022B20 80021F20 AE6B0000 */        sw $t3, ($s3) # gDisplayListHead + 0
  /* 022B24 80021F24 AE000004 */        sw $zero, 4($s0)
  /* 022B28 80021F28 AE0C0000 */        sw $t4, ($s0)
  /* 022B2C 80021F2C 8E720000 */        lw $s2, ($s3) # gDisplayListHead + 0
  /* 022B30 80021F30 3C04FF00 */       lui $a0, (0xFF00FFFF >> 16) # 4278255615
  /* 022B34 80021F34 241100D4 */     addiu $s1, $zero, 0xd4
  /* 022B38 80021F38 264D0008 */     addiu $t5, $s2, 8
  /* 022B3C 80021F3C AE6D0000 */        sw $t5, ($s3) # gDisplayListHead + 0
  /* 022B40 80021F40 3484FFFF */       ori $a0, $a0, (0xFF00FFFF & 0xFFFF) # 4278255615
  /* 022B44 80021F44 0C001B5C */       jal gsGetFillColor
  /* 022B48 80021F48 AE4E0000 */        sw $t6, ($s2)
  /* 022B4C 80021F4C AE420004 */        sw $v0, 4($s2)
  /* 022B50 80021F50 3C038004 */       lui $v1, %hi(D_80046614)
  /* 022B54 80021F54 8C636614 */        lw $v1, %lo(D_80046614)($v1)
  /* 022B58 80021F58 2405001E */     addiu $a1, $zero, 0x1e
  /* 022B5C 80021F5C 02203025 */        or $a2, $s1, $zero
  /* 022B60 80021F60 00031882 */       srl $v1, $v1, 2
  /* 022B64 80021F64 2C610101 */     sltiu $at, $v1, 0x101
  /* 022B68 80021F68 14200003 */      bnez $at, .L80021F78
  /* 022B6C 80021F6C 262F0001 */     addiu $t7, $s1, 1
  /* 022B70 80021F70 10000002 */         b .L80021F7C
  /* 022B74 80021F74 24020100 */     addiu $v0, $zero, 0x100
  .L80021F78:
  /* 022B78 80021F78 00601025 */        or $v0, $v1, $zero
  .L80021F7C:
  /* 022B7C 80021F7C 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022B80 80021F80 2447001E */     addiu $a3, $v0, 0x1e
  /* 022B84 80021F84 AFAF0010 */        sw $t7, 0x10($sp)
  /* 022B88 80021F88 26180008 */     addiu $t8, $s0, 8
  /* 022B8C 80021F8C AE780000 */        sw $t8, ($s3) # gDisplayListHead + 0
  /* 022B90 80021F90 0C00868D */       jal gsFillRectangleDL
  /* 022B94 80021F94 02002025 */        or $a0, $s0, $zero
  /* 022B98 80021F98 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022B9C 80021F9C 3C08E700 */       lui $t0, 0xe700
  /* 022BA0 80021FA0 3C0AF700 */       lui $t2, 0xf700
  /* 022BA4 80021FA4 26190008 */     addiu $t9, $s0, 8
  /* 022BA8 80021FA8 AE790000 */        sw $t9, ($s3) # gDisplayListHead + 0
  /* 022BAC 80021FAC AE000004 */        sw $zero, 4($s0)
  /* 022BB0 80021FB0 AE080000 */        sw $t0, ($s0)
  /* 022BB4 80021FB4 8E720000 */        lw $s2, ($s3) # gDisplayListHead + 0
  /* 022BB8 80021FB8 3C0400FF */       lui $a0, (0xFF00FF >> 16) # 16711935
  /* 022BBC 80021FBC 26310002 */     addiu $s1, $s1, 2
  /* 022BC0 80021FC0 26490008 */     addiu $t1, $s2, 8
  /* 022BC4 80021FC4 AE690000 */        sw $t1, ($s3) # gDisplayListHead + 0
  /* 022BC8 80021FC8 348400FF */       ori $a0, $a0, (0xFF00FF & 0xFFFF) # 16711935
  /* 022BCC 80021FCC 0C001B5C */       jal gsGetFillColor
  /* 022BD0 80021FD0 AE4A0000 */        sw $t2, ($s2)
  /* 022BD4 80021FD4 AE420004 */        sw $v0, 4($s2)
  /* 022BD8 80021FD8 3C038004 */       lui $v1, %hi(D_80044FB4)
  /* 022BDC 80021FDC 8C634FB4 */        lw $v1, %lo(D_80044FB4)($v1)
  /* 022BE0 80021FE0 2405001E */     addiu $a1, $zero, 0x1e
  /* 022BE4 80021FE4 02203025 */        or $a2, $s1, $zero
  /* 022BE8 80021FE8 00031882 */       srl $v1, $v1, 2
  /* 022BEC 80021FEC 2C610101 */     sltiu $at, $v1, 0x101
  /* 022BF0 80021FF0 14200003 */      bnez $at, .L80022000
  /* 022BF4 80021FF4 262B0001 */     addiu $t3, $s1, 1
  /* 022BF8 80021FF8 10000002 */         b .L80022004
  /* 022BFC 80021FFC 24020100 */     addiu $v0, $zero, 0x100
  .L80022000:
  /* 022C00 80022000 00601025 */        or $v0, $v1, $zero
  .L80022004:
  /* 022C04 80022004 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022C08 80022008 2447001E */     addiu $a3, $v0, 0x1e
  /* 022C0C 8002200C AFAB0010 */        sw $t3, 0x10($sp)
  /* 022C10 80022010 260C0008 */     addiu $t4, $s0, 8
  /* 022C14 80022014 AE6C0000 */        sw $t4, ($s3) # gDisplayListHead + 0
  /* 022C18 80022018 0C00868D */       jal gsFillRectangleDL
  /* 022C1C 8002201C 02002025 */        or $a0, $s0, $zero
  /* 022C20 80022020 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022C24 80022024 3C0EE700 */       lui $t6, 0xe700
  /* 022C28 80022028 3C18F700 */       lui $t8, 0xf700
  /* 022C2C 8002202C 260D0008 */     addiu $t5, $s0, 8
  /* 022C30 80022030 AE6D0000 */        sw $t5, ($s3) # gDisplayListHead + 0
  /* 022C34 80022034 AE000004 */        sw $zero, 4($s0)
  /* 022C38 80022038 AE0E0000 */        sw $t6, ($s0)
  /* 022C3C 8002203C 8E720000 */        lw $s2, ($s3) # gDisplayListHead + 0
  /* 022C40 80022040 3C04FFFF */       lui $a0, (0xFFFF00FF >> 16) # 4294902015
  /* 022C44 80022044 26310002 */     addiu $s1, $s1, 2
  /* 022C48 80022048 264F0008 */     addiu $t7, $s2, 8
  /* 022C4C 8002204C AE6F0000 */        sw $t7, ($s3) # gDisplayListHead + 0
  /* 022C50 80022050 348400FF */       ori $a0, $a0, (0xFFFF00FF & 0xFFFF) # 4294902015
  /* 022C54 80022054 0C001B5C */       jal gsGetFillColor
  /* 022C58 80022058 AE580000 */        sw $t8, ($s2)
  /* 022C5C 8002205C AE420004 */        sw $v0, 4($s2)
  /* 022C60 80022060 3C03800A */       lui $v1, %hi(D_8009D2D0)
  /* 022C64 80022064 8C63D2D0 */        lw $v1, %lo(D_8009D2D0)($v1)
  /* 022C68 80022068 2405001E */     addiu $a1, $zero, 0x1e
  /* 022C6C 8002206C 02203025 */        or $a2, $s1, $zero
  /* 022C70 80022070 00031882 */       srl $v1, $v1, 2
  /* 022C74 80022074 2C610101 */     sltiu $at, $v1, 0x101
  /* 022C78 80022078 14200003 */      bnez $at, .L80022088
  /* 022C7C 8002207C 26390001 */     addiu $t9, $s1, 1
  /* 022C80 80022080 10000002 */         b .L8002208C
  /* 022C84 80022084 24020100 */     addiu $v0, $zero, 0x100
  .L80022088:
  /* 022C88 80022088 00601025 */        or $v0, $v1, $zero
  .L8002208C:
  /* 022C8C 8002208C 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022C90 80022090 2447001E */     addiu $a3, $v0, 0x1e
  /* 022C94 80022094 AFB90010 */        sw $t9, 0x10($sp)
  /* 022C98 80022098 26080008 */     addiu $t0, $s0, 8
  /* 022C9C 8002209C AE680000 */        sw $t0, ($s3) # gDisplayListHead + 0
  /* 022CA0 800220A0 0C00868D */       jal gsFillRectangleDL
  /* 022CA4 800220A4 02002025 */        or $a0, $s0, $zero
  /* 022CA8 800220A8 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022CAC 800220AC 3C0AE700 */       lui $t2, 0xe700
  /* 022CB0 800220B0 3C0CF700 */       lui $t4, 0xf700
  /* 022CB4 800220B4 26090008 */     addiu $t1, $s0, 8
  /* 022CB8 800220B8 AE690000 */        sw $t1, ($s3) # gDisplayListHead + 0
  /* 022CBC 800220BC AE000004 */        sw $zero, 4($s0)
  /* 022CC0 800220C0 AE0A0000 */        sw $t2, ($s0)
  /* 022CC4 800220C4 8E720000 */        lw $s2, ($s3) # gDisplayListHead + 0
  /* 022CC8 800220C8 3C0400FF */       lui $a0, (0xFFFFFF >> 16) # 16777215
  /* 022CCC 800220CC 26310002 */     addiu $s1, $s1, 2
  /* 022CD0 800220D0 264B0008 */     addiu $t3, $s2, 8
  /* 022CD4 800220D4 AE6B0000 */        sw $t3, ($s3) # gDisplayListHead + 0
  /* 022CD8 800220D8 3484FFFF */       ori $a0, $a0, (0xFFFFFF & 0xFFFF) # 16777215
  /* 022CDC 800220DC 0C001B5C */       jal gsGetFillColor
  /* 022CE0 800220E0 AE4C0000 */        sw $t4, ($s2)
  /* 022CE4 800220E4 AE420004 */        sw $v0, 4($s2)
  /* 022CE8 800220E8 3C038004 */       lui $v1, %hi(D_80044FB8)
  /* 022CEC 800220EC 8C634FB8 */        lw $v1, %lo(D_80044FB8)($v1)
  /* 022CF0 800220F0 2405001E */     addiu $a1, $zero, 0x1e
  /* 022CF4 800220F4 02203025 */        or $a2, $s1, $zero
  /* 022CF8 800220F8 00031882 */       srl $v1, $v1, 2
  /* 022CFC 800220FC 2C610101 */     sltiu $at, $v1, 0x101
  /* 022D00 80022100 14200003 */      bnez $at, .L80022110
  /* 022D04 80022104 262D0001 */     addiu $t5, $s1, 1
  /* 022D08 80022108 10000002 */         b .L80022114
  /* 022D0C 8002210C 24020100 */     addiu $v0, $zero, 0x100
  .L80022110:
  /* 022D10 80022110 00601025 */        or $v0, $v1, $zero
  .L80022114:
  /* 022D14 80022114 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022D18 80022118 2447001E */     addiu $a3, $v0, 0x1e
  /* 022D1C 8002211C AFAD0010 */        sw $t5, 0x10($sp)
  /* 022D20 80022120 260E0008 */     addiu $t6, $s0, 8
  /* 022D24 80022124 AE6E0000 */        sw $t6, ($s3) # gDisplayListHead + 0
  /* 022D28 80022128 0C00868D */       jal gsFillRectangleDL
  /* 022D2C 8002212C 02002025 */        or $a0, $s0, $zero
  /* 022D30 80022130 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022D34 80022134 3C18E700 */       lui $t8, 0xe700
  /* 022D38 80022138 3C08F700 */       lui $t0, 0xf700
  /* 022D3C 8002213C 260F0008 */     addiu $t7, $s0, 8
  /* 022D40 80022140 AE6F0000 */        sw $t7, ($s3) # gDisplayListHead + 0
  /* 022D44 80022144 AE000004 */        sw $zero, 4($s0)
  /* 022D48 80022148 AE180000 */        sw $t8, ($s0)
  /* 022D4C 8002214C 8E710000 */        lw $s1, ($s3) # gDisplayListHead + 0
  /* 022D50 80022150 3C04FFFF */       lui $a0, (0xFFFF00FF >> 16) # 4294902015
  /* 022D54 80022154 348400FF */       ori $a0, $a0, (0xFFFF00FF & 0xFFFF) # 4294902015
  /* 022D58 80022158 26390008 */     addiu $t9, $s1, 8
  /* 022D5C 8002215C AE790000 */        sw $t9, ($s3) # gDisplayListHead + 0
  /* 022D60 80022160 0C001B5C */       jal gsGetFillColor
  /* 022D64 80022164 AE280000 */        sw $t0, ($s1)
  /* 022D68 80022168 AE220004 */        sw $v0, 4($s1)
  /* 022D6C 8002216C 3C118004 */       lui $s1, %hi(gSysController)
  /* 022D70 80022170 26315470 */     addiu $s1, $s1, %lo(gSysController)
  /* 022D74 80022174 00009025 */        or $s2, $zero, $zero
  /* 022D78 80022178 96290000 */       lhu $t1, ($s1) # gSysController + 0
  .L8002217C:
  /* 022D7C 8002217C 240A0001 */     addiu $t2, $zero, 1
  /* 022D80 80022180 024A5804 */      sllv $t3, $t2, $s2
  /* 022D84 80022184 012B6024 */       and $t4, $t1, $t3
  /* 022D88 80022188 1180000B */      beqz $t4, .L800221B8
  /* 022D8C 8002218C 00121080 */       sll $v0, $s2, 2
  /* 022D90 80022190 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022D94 80022194 240D00D0 */     addiu $t5, $zero, 0xd0
  /* 022D98 80022198 AFAD0010 */        sw $t5, 0x10($sp)
  /* 022D9C 8002219C 260E0008 */     addiu $t6, $s0, 8
  /* 022DA0 800221A0 AE6E0000 */        sw $t6, ($s3) # gDisplayListHead + 0
  /* 022DA4 800221A4 2445001E */     addiu $a1, $v0, 0x1e
  /* 022DA8 800221A8 240600CE */     addiu $a2, $zero, 0xce
  /* 022DAC 800221AC 24470021 */     addiu $a3, $v0, 0x21
  /* 022DB0 800221B0 0C00868D */       jal gsFillRectangleDL
  /* 022DB4 800221B4 02002025 */        or $a0, $s0, $zero
  .L800221B8:
  /* 022DB8 800221B8 26520001 */     addiu $s2, $s2, 1
  /* 022DBC 800221BC 2A410010 */      slti $at, $s2, 0x10
  /* 022DC0 800221C0 5420FFEE */      bnel $at, $zero, .L8002217C
  /* 022DC4 800221C4 96290000 */       lhu $t1, ($s1) # gSysController + 0

  /* 022DC8 800221C8 3C028004 */       lui $v0, %hi(gSysController + 8)
  /* 022DCC 800221CC 80425478 */        lb $v0, %lo(gSysController + 8)($v0)
  /* 022DD0 800221D0 3C038004 */       lui $v1, %hi(gSysController + 9)
  /* 022DD4 800221D4 80635479 */        lb $v1, %lo(gSysController + 9)($v1)
  /* 022DD8 800221D8 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022DDC 800221DC 00031823 */      negu $v1, $v1
  /* 022DE0 800221E0 26180008 */     addiu $t8, $s0, 8
  /* 022DE4 800221E4 AE780000 */        sw $t8, ($s3) # gDisplayListHead + 0
  /* 022DE8 800221E8 02002025 */        or $a0, $s0, $zero
  /* 022DEC 800221EC 04410002 */      bgez $v0, .L800221F8
  /* 022DF0 800221F0 00400821 */      addu $at, $v0, $zero
  /* 022DF4 800221F4 24410003 */     addiu $at, $v0, 3
  .L800221F8:
  /* 022DF8 800221F8 00011083 */       sra $v0, $at, 2
  /* 022DFC 800221FC 24450027 */     addiu $a1, $v0, 0x27
  /* 022E00 80022200 04610002 */      bgez $v1, .L8002220C
  /* 022E04 80022204 00600821 */      addu $at, $v1, $zero
  /* 022E08 80022208 24610003 */     addiu $at, $v1, 3
  .L8002220C:
  /* 022E0C 8002220C 00011883 */       sra $v1, $at, 2
  /* 022E10 80022210 246F00BA */     addiu $t7, $v1, 0xba
  /* 022E14 80022214 AFAF0010 */        sw $t7, 0x10($sp)
  /* 022E18 80022218 246600B8 */     addiu $a2, $v1, 0xb8
  /* 022E1C 8002221C 0C00868D */       jal gsFillRectangleDL
  /* 022E20 80022220 24470029 */     addiu $a3, $v0, 0x29
  
  /* 022E24 80022224 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022E28 80022228 3C08E700 */       lui $t0, 0xe700
  /* 022E2C 8002222C 3C09F700 */       lui $t1, 0xf700
  /* 022E30 80022230 26190008 */     addiu $t9, $s0, 8
  /* 022E34 80022234 AE790000 */        sw $t9, ($s3) # gDisplayListHead + 0
  /* 022E38 80022238 AE080000 */        sw $t0, ($s0)
  /* 022E3C 8002223C AE000004 */        sw $zero, 4($s0)
  /* 022E40 80022240 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022E44 80022244 3C041010 */       lui $a0, (0x101010FF >> 16) # 269488383
  /* 022E48 80022248 348410FF */       ori $a0, $a0, (0x101010FF & 0xFFFF) # 269488383
  /* 022E4C 8002224C 260A0008 */     addiu $t2, $s0, 8
  /* 022E50 80022250 AE6A0000 */        sw $t2, ($s3) # gDisplayListHead + 0
  /* 022E54 80022254 AE090000 */        sw $t1, ($s0)
  /* 022E58 80022258 0C001B5C */       jal gsGetFillColor
  /* 022E5C 8002225C AFB00034 */        sw $s0, 0x34($sp)
  /* 022E60 80022260 8FA30034 */        lw $v1, 0x34($sp)
  /* 022E64 80022264 2411001E */     addiu $s1, $zero, 0x1e
  /* 022E68 80022268 2412015E */     addiu $s2, $zero, 0x15e
  /* 022E6C 8002226C AC620004 */        sw $v0, 4($v1)
  /* 022E70 80022270 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  .L80022274:
  /* 022E74 80022274 240B00DC */     addiu $t3, $zero, 0xdc
  /* 022E78 80022278 AFAB0010 */        sw $t3, 0x10($sp)
  /* 022E7C 8002227C 260C0008 */     addiu $t4, $s0, 8
  /* 022E80 80022280 AE6C0000 */        sw $t4, ($s3) # gDisplayListHead + 0
  /* 022E84 80022284 02202825 */        or $a1, $s1, $zero
  /* 022E88 80022288 240600D2 */     addiu $a2, $zero, 0xd2
  /* 022E8C 8002228C 02203825 */        or $a3, $s1, $zero
  /* 022E90 80022290 0C00868D */       jal gsFillRectangleDL
  /* 022E94 80022294 02002025 */        or $a0, $s0, $zero
  /* 022E98 80022298 26310040 */     addiu $s1, $s1, 0x40
  /* 022E9C 8002229C 5632FFF5 */      bnel $s1, $s2, .L80022274
  /* 022EA0 800222A0 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0

  /* 022EA4 800222A4 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022EA8 800222A8 240D00CD */     addiu $t5, $zero, 0xcd
  /* 022EAC 800222AC AFAD0010 */        sw $t5, 0x10($sp)
  /* 022EB0 800222B0 260E0008 */     addiu $t6, $s0, 8
  /* 022EB4 800222B4 AE6E0000 */        sw $t6, ($s3) # gDisplayListHead + 0
  /* 022EB8 800222B8 24050028 */     addiu $a1, $zero, 0x28
  /* 022EBC 800222BC 240600A5 */     addiu $a2, $zero, 0xa5
  /* 022EC0 800222C0 24070028 */     addiu $a3, $zero, 0x28
  /* 022EC4 800222C4 0C00868D */       jal gsFillRectangleDL
  /* 022EC8 800222C8 02002025 */        or $a0, $s0, $zero
  /* 022ECC 800222CC 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022ED0 800222D0 240F00B9 */     addiu $t7, $zero, 0xb9
  /* 022ED4 800222D4 AFAF0010 */        sw $t7, 0x10($sp)
  /* 022ED8 800222D8 26180008 */     addiu $t8, $s0, 8
  /* 022EDC 800222DC AE780000 */        sw $t8, ($s3) # gDisplayListHead + 0
  /* 022EE0 800222E0 24050014 */     addiu $a1, $zero, 0x14
  /* 022EE4 800222E4 240600B9 */     addiu $a2, $zero, 0xb9
  /* 022EE8 800222E8 2407003C */     addiu $a3, $zero, 0x3c
  /* 022EEC 800222EC 0C00868D */       jal gsFillRectangleDL
  /* 022EF0 800222F0 02002025 */        or $a0, $s0, $zero
  /* 022EF4 800222F4 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022EF8 800222F8 3C08E700 */       lui $t0, 0xe700
  /* 022EFC 800222FC 3C09E300 */       lui $t1, (0xE3000A01 >> 16) # 3808430593
  /* 022F00 80022300 26190008 */     addiu $t9, $s0, 8
  /* 022F04 80022304 AE790000 */        sw $t9, ($s3) # gDisplayListHead + 0
  /* 022F08 80022308 AE000004 */        sw $zero, 4($s0)
  /* 022F0C 8002230C AE080000 */        sw $t0, ($s0)
  /* 022F10 80022310 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022F14 80022314 35290A01 */       ori $t1, $t1, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 022F18 80022318 3C0CE200 */       lui $t4, (0xE200001C >> 16) # 3791650844
  /* 022F1C 8002231C 260A0008 */     addiu $t2, $s0, 8
  /* 022F20 80022320 AE6A0000 */        sw $t2, ($s3) # gDisplayListHead + 0
  /* 022F24 80022324 AE000004 */        sw $zero, 4($s0)
  /* 022F28 80022328 AE090000 */        sw $t1, ($s0)
  /* 022F2C 8002232C 8E700000 */        lw $s0, ($s3) # gDisplayListHead + 0
  /* 022F30 80022330 3C0D0055 */       lui $t5, (0x552078 >> 16) # 5578872
  /* 022F34 80022334 35AD2078 */       ori $t5, $t5, (0x552078 & 0xFFFF) # 5578872
  /* 022F38 80022338 260B0008 */     addiu $t3, $s0, 8
  /* 022F3C 8002233C AE6B0000 */        sw $t3, ($s3) # gDisplayListHead + 0
  /* 022F40 80022340 358C001C */       ori $t4, $t4, (0xE200001C & 0xFFFF) # 3791650844
  /* 022F44 80022344 AE0C0000 */        sw $t4, ($s0)
  /* 022F48 80022348 AE0D0004 */        sw $t5, 4($s0)
  /* 022F4C 8002234C 8FBF002C */        lw $ra, 0x2c($sp)
  /* 022F50 80022350 8FB30028 */        lw $s3, 0x28($sp)
  /* 022F54 80022354 8FB20024 */        lw $s2, 0x24($sp)
  /* 022F58 80022358 8FB10020 */        lw $s1, 0x20($sp)
  /* 022F5C 8002235C 8FB0001C */        lw $s0, 0x1c($sp)
  /* 022F60 80022360 03E00008 */        jr $ra
  /* 022F64 80022364 27BD0090 */     addiu $sp, $sp, 0x90

