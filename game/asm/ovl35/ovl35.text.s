.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x801328A0

glabel mvPortraitsSetupDisplayList
  /* 165810 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 165814 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 165818 80131B08 8C830000 */        lw $v1, ($a0)
  /* 16581C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 165820 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 165824 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 165828 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 16582C 80131B1C 3C180002 */       lui $t8, 2
  /* 165830 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 165834 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 165838 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 16583C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 165840 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 165844 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 165848 80131B38 44060000 */      mfc1 $a2, $f0
  /* 16584C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 165850 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 165854 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 165858 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 16585C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 165860 80131B50 03E00008 */        jr $ra
  /* 165864 80131B54 00000000 */       nop

glabel mvPortraitsCreatePortraitsSet1
  /* 165868 80131B58 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 16586C 80131B5C 3C0F8013 */       lui $t7, %hi(dIntroPortraitsPortraitOffsetsSet1)
  /* 165870 80131B60 AFBF0034 */        sw $ra, 0x34($sp)
  /* 165874 80131B64 AFB50030 */        sw $s5, 0x30($sp)
  /* 165878 80131B68 AFB4002C */        sw $s4, 0x2c($sp)
  /* 16587C 80131B6C AFB30028 */        sw $s3, 0x28($sp)
  /* 165880 80131B70 AFB20024 */        sw $s2, 0x24($sp)
  /* 165884 80131B74 AFB10020 */        sw $s1, 0x20($sp)
  /* 165888 80131B78 AFB0001C */        sw $s0, 0x1c($sp)
  /* 16588C 80131B7C 25EF28D8 */     addiu $t7, $t7, %lo(dIntroPortraitsPortraitOffsetsSet1)
  /* 165890 80131B80 8DF90000 */        lw $t9, ($t7) # dIntroPortraitsPortraitOffsetsSet1 + 0
  /* 165894 80131B84 8DF80004 */        lw $t8, 4($t7) # dIntroPortraitsPortraitOffsetsSet1 + 4
  /* 165898 80131B88 27AE0064 */     addiu $t6, $sp, 0x64
  /* 16589C 80131B8C ADD90000 */        sw $t9, ($t6)
  /* 1658A0 80131B90 ADD80004 */        sw $t8, 4($t6)
  /* 1658A4 80131B94 8DF8000C */        lw $t8, 0xc($t7) # dIntroPortraitsPortraitOffsetsSet1 + 12
  /* 1658A8 80131B98 8DF90008 */        lw $t9, 8($t7) # dIntroPortraitsPortraitOffsetsSet1 + 8
  /* 1658AC 80131B9C 3C098013 */       lui $t1, %hi(dIntroPortraitsPortraitPositionsSet1)
  /* 1658B0 80131BA0 252928E8 */     addiu $t1, $t1, %lo(dIntroPortraitsPortraitPositionsSet1)
  /* 1658B4 80131BA4 ADD8000C */        sw $t8, 0xc($t6)
  /* 1658B8 80131BA8 ADD90008 */        sw $t9, 8($t6)
  /* 1658BC 80131BAC 8D2A0004 */        lw $t2, 4($t1) # dIntroPortraitsPortraitPositionsSet1 + 4
  /* 1658C0 80131BB0 8D2B0000 */        lw $t3, ($t1) # dIntroPortraitsPortraitPositionsSet1 + 0
  /* 1658C4 80131BB4 27A80044 */     addiu $t0, $sp, 0x44
  /* 1658C8 80131BB8 AD0A0004 */        sw $t2, 4($t0)
  /* 1658CC 80131BBC AD0B0000 */        sw $t3, ($t0)
  /* 1658D0 80131BC0 8D2B0008 */        lw $t3, 8($t1) # dIntroPortraitsPortraitPositionsSet1 + 8
  /* 1658D4 80131BC4 8D2A000C */        lw $t2, 0xc($t1) # dIntroPortraitsPortraitPositionsSet1 + 12
  /* 1658D8 80131BC8 3C108000 */       lui $s0, %hi(D_NF_80000008)
  /* 1658DC 80131BCC AD0B0008 */        sw $t3, 8($t0)
  /* 1658E0 80131BD0 AD0A000C */        sw $t2, 0xc($t0)
  /* 1658E4 80131BD4 8D2A0014 */        lw $t2, 0x14($t1) # dIntroPortraitsPortraitPositionsSet1 + 20
  /* 1658E8 80131BD8 8D2B0010 */        lw $t3, 0x10($t1) # dIntroPortraitsPortraitPositionsSet1 + 16
  /* 1658EC 80131BDC 02003825 */        or $a3, $s0, $zero
  /* 1658F0 80131BE0 AD0A0014 */        sw $t2, 0x14($t0)
  /* 1658F4 80131BE4 AD0B0010 */        sw $t3, 0x10($t0)
  /* 1658F8 80131BE8 8D2B0018 */        lw $t3, 0x18($t1) # dIntroPortraitsPortraitPositionsSet1 + 24
  /* 1658FC 80131BEC 8D2A001C */        lw $t2, 0x1c($t1) # dIntroPortraitsPortraitPositionsSet1 + 28
  /* 165900 80131BF0 00002025 */        or $a0, $zero, $zero
  /* 165904 80131BF4 00002825 */        or $a1, $zero, $zero
  /* 165908 80131BF8 24060011 */     addiu $a2, $zero, 0x11
  /* 16590C 80131BFC AD0B0018 */        sw $t3, 0x18($t0)
  /* 165910 80131C00 0C00265A */       jal omMakeGObjSPAfter
  /* 165914 80131C04 AD0A001C */        sw $t2, 0x1c($t0)
  /* 165918 80131C08 3C018013 */       lui $at, %hi(gIntroPortraitsPortraitGObj)
  /* 16591C 80131C0C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 165920 80131C10 240CFFFF */     addiu $t4, $zero, -1
  /* 165924 80131C14 AC2229F0 */        sw $v0, %lo(gIntroPortraitsPortraitGObj)($at)
  /* 165928 80131C18 00409025 */        or $s2, $v0, $zero
  /* 16592C 80131C1C AFAC0010 */        sw $t4, 0x10($sp)
  /* 165930 80131C20 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 165934 80131C24 00402025 */        or $a0, $v0, $zero
  /* 165938 80131C28 2406001B */     addiu $a2, $zero, 0x1b
  /* 16593C 80131C2C 0C00277D */       jal omAddGObjRenderProc
  /* 165940 80131C30 02003825 */        or $a3, $s0, $zero
  /* 165944 80131C34 3C138013 */       lui $s3, %hi(D_ovl35_80132BB0)
  /* 165948 80131C38 26732BB0 */     addiu $s3, $s3, %lo(D_ovl35_80132BB0)
  /* 16594C 80131C3C 27B10064 */     addiu $s1, $sp, 0x64
  /* 165950 80131C40 27B00044 */     addiu $s0, $sp, 0x44
  /* 165954 80131C44 27B50064 */     addiu $s5, $sp, 0x64
  /* 165958 80131C48 2414FFDF */     addiu $s4, $zero, -0x21
  .L80131C4C:
  /* 16595C 80131C4C 8E2D0000 */        lw $t5, ($s1)
  /* 165960 80131C50 8E6E0000 */        lw $t6, ($s3) # D_ovl35_80132BB0 + 0
  /* 165964 80131C54 02402025 */        or $a0, $s2, $zero
  /* 165968 80131C58 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 16596C 80131C5C 01AE2821 */      addu $a1, $t5, $t6
  /* 165970 80131C60 944F0024 */       lhu $t7, 0x24($v0)
  /* 165974 80131C64 26100008 */     addiu $s0, $s0, %lo(D_NF_80000008)
  /* 165978 80131C68 26310004 */     addiu $s1, $s1, 4
  /* 16597C 80131C6C 01F4C024 */       and $t8, $t7, $s4
  /* 165980 80131C70 A4580024 */        sh $t8, 0x24($v0)
  /* 165984 80131C74 C604FFF8 */      lwc1 $f4, -8($s0) # D_NF_80000008 + -8
  /* 165988 80131C78 E4440058 */      swc1 $f4, 0x58($v0)
  /* 16598C 80131C7C C606FFFC */      lwc1 $f6, -4($s0) # D_NF_80000008 + -4
  /* 165990 80131C80 1615FFF2 */       bne $s0, $s5, .L80131C4C
  /* 165994 80131C84 E446005C */      swc1 $f6, 0x5c($v0)
  /* 165998 80131C88 8FBF0034 */        lw $ra, 0x34($sp)
  /* 16599C 80131C8C 8FB0001C */        lw $s0, 0x1c($sp)
  /* 1659A0 80131C90 8FB10020 */        lw $s1, 0x20($sp)
  /* 1659A4 80131C94 8FB20024 */        lw $s2, 0x24($sp)
  /* 1659A8 80131C98 8FB30028 */        lw $s3, 0x28($sp)
  /* 1659AC 80131C9C 8FB4002C */        lw $s4, 0x2c($sp)
  /* 1659B0 80131CA0 8FB50030 */        lw $s5, 0x30($sp)
  /* 1659B4 80131CA4 03E00008 */        jr $ra
  /* 1659B8 80131CA8 27BD0080 */     addiu $sp, $sp, 0x80

glabel mvPortraitsCreatePortraitsSet2
  /* 1659BC 80131CAC 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 1659C0 80131CB0 3C0F8013 */       lui $t7, %hi(dIntroPortraitsPortraitOffsetsSet2)
  /* 1659C4 80131CB4 AFBF0034 */        sw $ra, 0x34($sp)
  /* 1659C8 80131CB8 AFB50030 */        sw $s5, 0x30($sp)
  /* 1659CC 80131CBC AFB4002C */        sw $s4, 0x2c($sp)
  /* 1659D0 80131CC0 AFB30028 */        sw $s3, 0x28($sp)
  /* 1659D4 80131CC4 AFB20024 */        sw $s2, 0x24($sp)
  /* 1659D8 80131CC8 AFB10020 */        sw $s1, 0x20($sp)
  /* 1659DC 80131CCC AFB0001C */        sw $s0, 0x1c($sp)
  /* 1659E0 80131CD0 25EF2908 */     addiu $t7, $t7, %lo(dIntroPortraitsPortraitOffsetsSet2)
  /* 1659E4 80131CD4 8DF90000 */        lw $t9, ($t7) # dIntroPortraitsPortraitOffsetsSet2 + 0
  /* 1659E8 80131CD8 8DF80004 */        lw $t8, 4($t7) # dIntroPortraitsPortraitOffsetsSet2 + 4
  /* 1659EC 80131CDC 27AE0064 */     addiu $t6, $sp, 0x64
  /* 1659F0 80131CE0 ADD90000 */        sw $t9, ($t6)
  /* 1659F4 80131CE4 ADD80004 */        sw $t8, 4($t6)
  /* 1659F8 80131CE8 8DF8000C */        lw $t8, 0xc($t7) # dIntroPortraitsPortraitOffsetsSet2 + 12
  /* 1659FC 80131CEC 8DF90008 */        lw $t9, 8($t7) # dIntroPortraitsPortraitOffsetsSet2 + 8
  /* 165A00 80131CF0 3C098013 */       lui $t1, %hi(dIntroPortraitsPortraitPositionsSet2)
  /* 165A04 80131CF4 25292918 */     addiu $t1, $t1, %lo(dIntroPortraitsPortraitPositionsSet2)
  /* 165A08 80131CF8 ADD8000C */        sw $t8, 0xc($t6)
  /* 165A0C 80131CFC ADD90008 */        sw $t9, 8($t6)
  /* 165A10 80131D00 8D2A0004 */        lw $t2, 4($t1) # dIntroPortraitsPortraitPositionsSet2 + 4
  /* 165A14 80131D04 8D2B0000 */        lw $t3, ($t1) # dIntroPortraitsPortraitPositionsSet2 + 0
  /* 165A18 80131D08 27A80044 */     addiu $t0, $sp, 0x44
  /* 165A1C 80131D0C AD0A0004 */        sw $t2, 4($t0)
  /* 165A20 80131D10 AD0B0000 */        sw $t3, ($t0)
  /* 165A24 80131D14 8D2B0008 */        lw $t3, 8($t1) # dIntroPortraitsPortraitPositionsSet2 + 8
  /* 165A28 80131D18 8D2A000C */        lw $t2, 0xc($t1) # dIntroPortraitsPortraitPositionsSet2 + 12
  /* 165A2C 80131D1C 3C108000 */       lui $s0, %hi(D_NF_80000008)
  /* 165A30 80131D20 AD0B0008 */        sw $t3, 8($t0)
  /* 165A34 80131D24 AD0A000C */        sw $t2, 0xc($t0)
  /* 165A38 80131D28 8D2A0014 */        lw $t2, 0x14($t1) # dIntroPortraitsPortraitPositionsSet2 + 20
  /* 165A3C 80131D2C 8D2B0010 */        lw $t3, 0x10($t1) # dIntroPortraitsPortraitPositionsSet2 + 16
  /* 165A40 80131D30 02003825 */        or $a3, $s0, $zero
  /* 165A44 80131D34 AD0A0014 */        sw $t2, 0x14($t0)
  /* 165A48 80131D38 AD0B0010 */        sw $t3, 0x10($t0)
  /* 165A4C 80131D3C 8D2B0018 */        lw $t3, 0x18($t1) # dIntroPortraitsPortraitPositionsSet2 + 24
  /* 165A50 80131D40 8D2A001C */        lw $t2, 0x1c($t1) # dIntroPortraitsPortraitPositionsSet2 + 28
  /* 165A54 80131D44 00002025 */        or $a0, $zero, $zero
  /* 165A58 80131D48 00002825 */        or $a1, $zero, $zero
  /* 165A5C 80131D4C 24060011 */     addiu $a2, $zero, 0x11
  /* 165A60 80131D50 AD0B0018 */        sw $t3, 0x18($t0)
  /* 165A64 80131D54 0C00265A */       jal omMakeGObjSPAfter
  /* 165A68 80131D58 AD0A001C */        sw $t2, 0x1c($t0)
  /* 165A6C 80131D5C 3C018013 */       lui $at, %hi(gIntroPortraitsPortraitGObj)
  /* 165A70 80131D60 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 165A74 80131D64 240CFFFF */     addiu $t4, $zero, -1
  /* 165A78 80131D68 AC2229F0 */        sw $v0, %lo(gIntroPortraitsPortraitGObj)($at)
  /* 165A7C 80131D6C 00409025 */        or $s2, $v0, $zero
  /* 165A80 80131D70 AFAC0010 */        sw $t4, 0x10($sp)
  /* 165A84 80131D74 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 165A88 80131D78 00402025 */        or $a0, $v0, $zero
  /* 165A8C 80131D7C 2406001B */     addiu $a2, $zero, 0x1b
  /* 165A90 80131D80 0C00277D */       jal omAddGObjRenderProc
  /* 165A94 80131D84 02003825 */        or $a3, $s0, $zero
  /* 165A98 80131D88 3C138013 */       lui $s3, %hi(D_ovl35_80132BB0)
  /* 165A9C 80131D8C 26732BB0 */     addiu $s3, $s3, %lo(D_ovl35_80132BB0)
  /* 165AA0 80131D90 27B10064 */     addiu $s1, $sp, 0x64
  /* 165AA4 80131D94 27B00044 */     addiu $s0, $sp, 0x44
  /* 165AA8 80131D98 27B50064 */     addiu $s5, $sp, 0x64
  /* 165AAC 80131D9C 2414FFDF */     addiu $s4, $zero, -0x21
  .L80131DA0:
  /* 165AB0 80131DA0 8E2D0000 */        lw $t5, ($s1)
  /* 165AB4 80131DA4 8E6E0004 */        lw $t6, 4($s3) # D_ovl35_80132BB0 + 4
  /* 165AB8 80131DA8 02402025 */        or $a0, $s2, $zero
  /* 165ABC 80131DAC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 165AC0 80131DB0 01AE2821 */      addu $a1, $t5, $t6
  /* 165AC4 80131DB4 944F0024 */       lhu $t7, 0x24($v0)
  /* 165AC8 80131DB8 26100008 */     addiu $s0, $s0, %lo(D_NF_80000008)
  /* 165ACC 80131DBC 26310004 */     addiu $s1, $s1, 4
  /* 165AD0 80131DC0 01F4C024 */       and $t8, $t7, $s4
  /* 165AD4 80131DC4 A4580024 */        sh $t8, 0x24($v0)
  /* 165AD8 80131DC8 C604FFF8 */      lwc1 $f4, -8($s0) # D_NF_80000008 + -8
  /* 165ADC 80131DCC E4440058 */      swc1 $f4, 0x58($v0)
  /* 165AE0 80131DD0 C606FFFC */      lwc1 $f6, -4($s0) # D_NF_80000008 + -4
  /* 165AE4 80131DD4 1615FFF2 */       bne $s0, $s5, .L80131DA0
  /* 165AE8 80131DD8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 165AEC 80131DDC 8FBF0034 */        lw $ra, 0x34($sp)
  /* 165AF0 80131DE0 8FB0001C */        lw $s0, 0x1c($sp)
  /* 165AF4 80131DE4 8FB10020 */        lw $s1, 0x20($sp)
  /* 165AF8 80131DE8 8FB20024 */        lw $s2, 0x24($sp)
  /* 165AFC 80131DEC 8FB30028 */        lw $s3, 0x28($sp)
  /* 165B00 80131DF0 8FB4002C */        lw $s4, 0x2c($sp)
  /* 165B04 80131DF4 8FB50030 */        lw $s5, 0x30($sp)
  /* 165B08 80131DF8 03E00008 */        jr $ra
  /* 165B0C 80131DFC 27BD0080 */     addiu $sp, $sp, 0x80

glabel mvPortraitsBlockRow1
  /* 165B10 80131E00 3C048004 */       lui $a0, %hi(gDisplayListHead)
  /* 165B14 80131E04 248465B0 */     addiu $a0, $a0, %lo(gDisplayListHead)
  /* 165B18 80131E08 8C830000 */        lw $v1, ($a0) # gDisplayListHead + 0
  /* 165B1C 80131E0C 3C0FF64D */       lui $t7, (0xF64D8104 >> 16) # 4132274436
  /* 165B20 80131E10 3C180002 */       lui $t8, (0x28028 >> 16) # 163880
  /* 165B24 80131E14 246E0008 */     addiu $t6, $v1, 8
  /* 165B28 80131E18 AC8E0000 */        sw $t6, ($a0) # gDisplayListHead + 0
  /* 165B2C 80131E1C 37188028 */       ori $t8, $t8, (0x28028 & 0xFFFF) # 163880
  /* 165B30 80131E20 35EF8104 */       ori $t7, $t7, (0xF64D8104 & 0xFFFF) # 4132274436
  /* 165B34 80131E24 AC6F0000 */        sw $t7, ($v1)
  /* 165B38 80131E28 03E00008 */        jr $ra
  /* 165B3C 80131E2C AC780004 */        sw $t8, 4($v1)

glabel mvPortraitsBlockRow2
  /* 165B40 80131E30 3C048004 */       lui $a0, %hi(gDisplayListHead)
  /* 165B44 80131E34 248465B0 */     addiu $a0, $a0, %lo(gDisplayListHead)
  /* 165B48 80131E38 8C830000 */        lw $v1, ($a0) # gDisplayListHead + 0
  /* 165B4C 80131E3C 3C0FF64D */       lui $t7, (0xF64D81E0 >> 16) # 4132274656
  /* 165B50 80131E40 3C180002 */       lui $t8, (0x28104 >> 16) # 164100
  /* 165B54 80131E44 246E0008 */     addiu $t6, $v1, 8
  /* 165B58 80131E48 AC8E0000 */        sw $t6, ($a0) # gDisplayListHead + 0
  /* 165B5C 80131E4C 37188104 */       ori $t8, $t8, (0x28104 & 0xFFFF) # 164100
  /* 165B60 80131E50 35EF81E0 */       ori $t7, $t7, (0xF64D81E0 & 0xFFFF) # 4132274656
  /* 165B64 80131E54 AC6F0000 */        sw $t7, ($v1)
  /* 165B68 80131E58 03E00008 */        jr $ra
  /* 165B6C 80131E5C AC780004 */        sw $t8, 4($v1)

glabel mvPortraitsBlockRow3
  /* 165B70 80131E60 3C048004 */       lui $a0, %hi(gDisplayListHead)
  /* 165B74 80131E64 248465B0 */     addiu $a0, $a0, %lo(gDisplayListHead)
  /* 165B78 80131E68 8C830000 */        lw $v1, ($a0) # gDisplayListHead + 0
  /* 165B7C 80131E6C 3C0FF64D */       lui $t7, (0xF64D82BC >> 16) # 4132274876
  /* 165B80 80131E70 3C180002 */       lui $t8, (0x281E0 >> 16) # 164320
  /* 165B84 80131E74 246E0008 */     addiu $t6, $v1, 8
  /* 165B88 80131E78 AC8E0000 */        sw $t6, ($a0) # gDisplayListHead + 0
  /* 165B8C 80131E7C 371881E0 */       ori $t8, $t8, (0x281E0 & 0xFFFF) # 164320
  /* 165B90 80131E80 35EF82BC */       ori $t7, $t7, (0xF64D82BC & 0xFFFF) # 4132274876
  /* 165B94 80131E84 AC6F0000 */        sw $t7, ($v1)
  /* 165B98 80131E88 03E00008 */        jr $ra
  /* 165B9C 80131E8C AC780004 */        sw $t8, 4($v1)

glabel mvPortraitsBlockRow4
  /* 165BA0 80131E90 3C048004 */       lui $a0, %hi(gDisplayListHead)
  /* 165BA4 80131E94 248465B0 */     addiu $a0, $a0, %lo(gDisplayListHead)
  /* 165BA8 80131E98 8C830000 */        lw $v1, ($a0) # gDisplayListHead + 0
  /* 165BAC 80131E9C 3C0FF64D */       lui $t7, (0xF64D8398 >> 16) # 4132275096
  /* 165BB0 80131EA0 3C180002 */       lui $t8, (0x282BC >> 16) # 164540
  /* 165BB4 80131EA4 246E0008 */     addiu $t6, $v1, 8
  /* 165BB8 80131EA8 AC8E0000 */        sw $t6, ($a0) # gDisplayListHead + 0
  /* 165BBC 80131EAC 371882BC */       ori $t8, $t8, (0x282BC & 0xFFFF) # 164540
  /* 165BC0 80131EB0 35EF8398 */       ori $t7, $t7, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 165BC4 80131EB4 AC6F0000 */        sw $t7, ($v1)
  /* 165BC8 80131EB8 03E00008 */        jr $ra
  /* 165BCC 80131EBC AC780004 */        sw $t8, 4($v1)

glabel mvPortraitsPartiallyBlockRow
  /* 165BD0 80131EC0 18A00016 */      blez $a1, .L80131F1C
  /* 165BD4 80131EC4 24A30290 */     addiu $v1, $a1, 0x290
  /* 165BD8 80131EC8 24080037 */     addiu $t0, $zero, 0x37
  /* 165BDC 80131ECC 00880019 */     multu $a0, $t0
  /* 165BE0 80131ED0 3C078004 */       lui $a3, %hi(gDisplayListHead)
  /* 165BE4 80131ED4 24E765B0 */     addiu $a3, $a3, %lo(gDisplayListHead)
  /* 165BE8 80131ED8 8CE60000 */        lw $a2, ($a3) # gDisplayListHead + 0
  /* 165BEC 80131EDC 30AF03FF */      andi $t7, $a1, 0x3ff
  /* 165BF0 80131EE0 000FC380 */       sll $t8, $t7, 0xe
  /* 165BF4 80131EE4 24CE0008 */     addiu $t6, $a2, 8
  /* 165BF8 80131EE8 ACEE0000 */        sw $t6, ($a3) # gDisplayListHead + 0
  /* 165BFC 80131EEC 3C01F600 */       lui $at, 0xf600
  /* 165C00 80131EF0 0301C825 */        or $t9, $t8, $at
  /* 165C04 80131EF4 00001012 */      mflo $v0
  /* 165C08 80131EF8 24490041 */     addiu $t1, $v0, 0x41
  /* 165C0C 80131EFC 312A03FF */      andi $t2, $t1, 0x3ff
  /* 165C10 80131F00 244D000A */     addiu $t5, $v0, 0xa
  /* 165C14 80131F04 31AE03FF */      andi $t6, $t5, 0x3ff
  /* 165C18 80131F08 000A5880 */       sll $t3, $t2, 2
  /* 165C1C 80131F0C 032B6025 */        or $t4, $t9, $t3
  /* 165C20 80131F10 000E7880 */       sll $t7, $t6, 2
  /* 165C24 80131F14 ACCF0004 */        sw $t7, 4($a2)
  /* 165C28 80131F18 ACCC0000 */        sw $t4, ($a2)
  .L80131F1C:
  /* 165C2C 80131F1C 3C078004 */       lui $a3, %hi(gDisplayListHead)
  /* 165C30 80131F20 24E765B0 */     addiu $a3, $a3, %lo(gDisplayListHead)
  /* 165C34 80131F24 04610010 */      bgez $v1, .L80131F68
  /* 165C38 80131F28 24080037 */     addiu $t0, $zero, 0x37
  /* 165C3C 80131F2C 00880019 */     multu $a0, $t0
  /* 165C40 80131F30 8CE60000 */        lw $a2, ($a3) # gDisplayListHead + 0
  /* 165C44 80131F34 3C01F650 */       lui $at, 0xf650
  /* 165C48 80131F38 24D80008 */     addiu $t8, $a2, 8
  /* 165C4C 80131F3C ACF80000 */        sw $t8, ($a3) # gDisplayListHead + 0
  /* 165C50 80131F40 00001012 */      mflo $v0
  /* 165C54 80131F44 24490041 */     addiu $t1, $v0, 0x41
  /* 165C58 80131F48 312A03FF */      andi $t2, $t1, 0x3ff
  /* 165C5C 80131F4C 244C000A */     addiu $t4, $v0, 0xa
  /* 165C60 80131F50 318D03FF */      andi $t5, $t4, 0x3ff
  /* 165C64 80131F54 000AC880 */       sll $t9, $t2, 2
  /* 165C68 80131F58 03215825 */        or $t3, $t9, $at
  /* 165C6C 80131F5C 000D7080 */       sll $t6, $t5, 2
  /* 165C70 80131F60 ACCE0004 */        sw $t6, 4($a2)
  /* 165C74 80131F64 ACCB0000 */        sw $t3, ($a2)
  .L80131F68:
  /* 165C78 80131F68 28610140 */      slti $at, $v1, 0x140
  /* 165C7C 80131F6C 10200013 */      beqz $at, .L80131FBC
  /* 165C80 80131F70 00000000 */       nop
  /* 165C84 80131F74 00880019 */     multu $a0, $t0
  /* 165C88 80131F78 8CE60000 */        lw $a2, ($a3) # gDisplayListHead + 0
  /* 165C8C 80131F7C 306B03FF */      andi $t3, $v1, 0x3ff
  /* 165C90 80131F80 000B6380 */       sll $t4, $t3, 0xe
  /* 165C94 80131F84 24CF0008 */     addiu $t7, $a2, 8
  /* 165C98 80131F88 ACEF0000 */        sw $t7, ($a3) # gDisplayListHead + 0
  /* 165C9C 80131F8C 3C01F650 */       lui $at, 0xf650
  /* 165CA0 80131F90 00001012 */      mflo $v0
  /* 165CA4 80131F94 24580041 */     addiu $t8, $v0, 0x41
  /* 165CA8 80131F98 244D000A */     addiu $t5, $v0, 0xa
  /* 165CAC 80131F9C 31AE03FF */      andi $t6, $t5, 0x3ff
  /* 165CB0 80131FA0 330903FF */      andi $t1, $t8, 0x3ff
  /* 165CB4 80131FA4 00095080 */       sll $t2, $t1, 2
  /* 165CB8 80131FA8 000E7880 */       sll $t7, $t6, 2
  /* 165CBC 80131FAC 018FC025 */        or $t8, $t4, $t7
  /* 165CC0 80131FB0 0141C825 */        or $t9, $t2, $at
  /* 165CC4 80131FB4 ACD90000 */        sw $t9, ($a2)
  /* 165CC8 80131FB8 ACD80004 */        sw $t8, 4($a2)
  .L80131FBC:
  /* 165CCC 80131FBC 03E00008 */        jr $ra
  /* 165CD0 80131FC0 00000000 */       nop

glabel mvPortraitsRenderPortraitOverlay
  /* 165CD4 80131FC4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 165CD8 80131FC8 AFB00018 */        sw $s0, 0x18($sp)
  /* 165CDC 80131FCC 3C108004 */       lui $s0, %hi(gDisplayListHead)
  /* 165CE0 80131FD0 261065B0 */     addiu $s0, $s0, %lo(gDisplayListHead)
  /* 165CE4 80131FD4 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165CE8 80131FD8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 165CEC 80131FDC AFA40020 */        sw $a0, 0x20($sp)
  /* 165CF0 80131FE0 244E0008 */     addiu $t6, $v0, 8
  /* 165CF4 80131FE4 AE0E0000 */        sw $t6, ($s0) # gDisplayListHead + 0
  /* 165CF8 80131FE8 3C0FE700 */       lui $t7, 0xe700
  /* 165CFC 80131FEC AC4F0000 */        sw $t7, ($v0)
  /* 165D00 80131FF0 AC400004 */        sw $zero, 4($v0)
  /* 165D04 80131FF4 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165D08 80131FF8 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 165D0C 80131FFC 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 165D10 80132000 24580008 */     addiu $t8, $v0, 8
  /* 165D14 80132004 AE180000 */        sw $t8, ($s0) # gDisplayListHead + 0
  /* 165D18 80132008 AC400004 */        sw $zero, 4($v0)
  /* 165D1C 8013200C AC590000 */        sw $t9, ($v0)
  /* 165D20 80132010 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165D24 80132014 3C0BFA00 */       lui $t3, 0xfa00
  /* 165D28 80132018 240C00FF */     addiu $t4, $zero, 0xff
  /* 165D2C 8013201C 244A0008 */     addiu $t2, $v0, 8
  /* 165D30 80132020 AE0A0000 */        sw $t2, ($s0) # gDisplayListHead + 0
  /* 165D34 80132024 AC4C0004 */        sw $t4, 4($v0)
  /* 165D38 80132028 AC4B0000 */        sw $t3, ($v0)
  /* 165D3C 8013202C 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165D40 80132030 3C0FFFFD */       lui $t7, (0xFFFDF6FB >> 16) # 4294833915
  /* 165D44 80132034 3C0EFCFF */       lui $t6, (0xFCFFFFFF >> 16) # 4244635647
  /* 165D48 80132038 244D0008 */     addiu $t5, $v0, 8
  /* 165D4C 8013203C AE0D0000 */        sw $t5, ($s0) # gDisplayListHead + 0
  /* 165D50 80132040 35CEFFFF */       ori $t6, $t6, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 165D54 80132044 35EFF6FB */       ori $t7, $t7, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 165D58 80132048 AC4F0004 */        sw $t7, 4($v0)
  /* 165D5C 8013204C AC4E0000 */        sw $t6, ($v0)
  /* 165D60 80132050 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165D64 80132054 3C0A0050 */       lui $t2, (0x5041C8 >> 16) # 5259720
  /* 165D68 80132058 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 165D6C 8013205C 24580008 */     addiu $t8, $v0, 8
  /* 165D70 80132060 AE180000 */        sw $t8, ($s0) # gDisplayListHead + 0
  /* 165D74 80132064 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 165D78 80132068 354A41C8 */       ori $t2, $t2, (0x5041C8 & 0xFFFF) # 5259720
  /* 165D7C 8013206C 3C098013 */       lui $t1, %hi(gIntroPotraitsCurrentRow)
  /* 165D80 80132070 AC4A0004 */        sw $t2, 4($v0)
  /* 165D84 80132074 AC590000 */        sw $t9, ($v0)
  /* 165D88 80132078 8D2929EC */        lw $t1, %lo(gIntroPotraitsCurrentRow)($t1)
  /* 165D8C 8013207C 24010001 */     addiu $at, $zero, 1
  /* 165D90 80132080 11200009 */      beqz $t1, .L801320A8
  /* 165D94 80132084 00000000 */       nop
  /* 165D98 80132088 11210017 */       beq $t1, $at, .L801320E8
  /* 165D9C 8013208C 24010002 */     addiu $at, $zero, 2
  /* 165DA0 80132090 11210025 */       beq $t1, $at, .L80132128
  /* 165DA4 80132094 24010003 */     addiu $at, $zero, 3
  /* 165DA8 80132098 11210033 */       beq $t1, $at, .L80132168
  /* 165DAC 8013209C 00000000 */       nop
  /* 165DB0 801320A0 10000040 */         b .L801321A4
  /* 165DB4 801320A4 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  .L801320A8:
  /* 165DB8 801320A8 0C04C78C */       jal mvPortraitsBlockRow2
  /* 165DBC 801320AC 00000000 */       nop
  /* 165DC0 801320B0 0C04C798 */       jal mvPortraitsBlockRow3
  /* 165DC4 801320B4 00000000 */       nop
  /* 165DC8 801320B8 0C04C7A4 */       jal mvPortraitsBlockRow4
  /* 165DCC 801320BC 00000000 */       nop
  /* 165DD0 801320C0 8FAB0020 */        lw $t3, 0x20($sp)
  /* 165DD4 801320C4 00002025 */        or $a0, $zero, $zero
  /* 165DD8 801320C8 8D6C0074 */        lw $t4, 0x74($t3)
  /* 165DDC 801320CC C5840058 */      lwc1 $f4, 0x58($t4)
  /* 165DE0 801320D0 4600218D */ trunc.w.s $f6, $f4
  /* 165DE4 801320D4 44053000 */      mfc1 $a1, $f6
  /* 165DE8 801320D8 0C04C7B0 */       jal mvPortraitsPartiallyBlockRow
  /* 165DEC 801320DC 00000000 */       nop
  /* 165DF0 801320E0 10000030 */         b .L801321A4
  /* 165DF4 801320E4 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  .L801320E8:
  /* 165DF8 801320E8 0C04C780 */       jal mvPortraitsBlockRow1
  /* 165DFC 801320EC 00000000 */       nop
  /* 165E00 801320F0 0C04C798 */       jal mvPortraitsBlockRow3
  /* 165E04 801320F4 00000000 */       nop
  /* 165E08 801320F8 0C04C7A4 */       jal mvPortraitsBlockRow4
  /* 165E0C 801320FC 00000000 */       nop
  /* 165E10 80132100 8FAE0020 */        lw $t6, 0x20($sp)
  /* 165E14 80132104 24040001 */     addiu $a0, $zero, 1
  /* 165E18 80132108 8DCF0074 */        lw $t7, 0x74($t6)
  /* 165E1C 8013210C C5E80058 */      lwc1 $f8, 0x58($t7)
  /* 165E20 80132110 4600428D */ trunc.w.s $f10, $f8
  /* 165E24 80132114 44055000 */      mfc1 $a1, $f10
  /* 165E28 80132118 0C04C7B0 */       jal mvPortraitsPartiallyBlockRow
  /* 165E2C 8013211C 00000000 */       nop
  /* 165E30 80132120 10000020 */         b .L801321A4
  /* 165E34 80132124 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  .L80132128:
  /* 165E38 80132128 0C04C780 */       jal mvPortraitsBlockRow1
  /* 165E3C 8013212C 00000000 */       nop
  /* 165E40 80132130 0C04C78C */       jal mvPortraitsBlockRow2
  /* 165E44 80132134 00000000 */       nop
  /* 165E48 80132138 0C04C7A4 */       jal mvPortraitsBlockRow4
  /* 165E4C 8013213C 00000000 */       nop
  /* 165E50 80132140 8FB90020 */        lw $t9, 0x20($sp)
  /* 165E54 80132144 24040002 */     addiu $a0, $zero, 2
  /* 165E58 80132148 8F2A0074 */        lw $t2, 0x74($t9)
  /* 165E5C 8013214C C5500058 */      lwc1 $f16, 0x58($t2)
  /* 165E60 80132150 4600848D */ trunc.w.s $f18, $f16
  /* 165E64 80132154 44059000 */      mfc1 $a1, $f18
  /* 165E68 80132158 0C04C7B0 */       jal mvPortraitsPartiallyBlockRow
  /* 165E6C 8013215C 00000000 */       nop
  /* 165E70 80132160 10000010 */         b .L801321A4
  /* 165E74 80132164 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  .L80132168:
  /* 165E78 80132168 0C04C780 */       jal mvPortraitsBlockRow1
  /* 165E7C 8013216C 00000000 */       nop
  /* 165E80 80132170 0C04C78C */       jal mvPortraitsBlockRow2
  /* 165E84 80132174 00000000 */       nop
  /* 165E88 80132178 0C04C798 */       jal mvPortraitsBlockRow3
  /* 165E8C 8013217C 00000000 */       nop
  /* 165E90 80132180 8FAC0020 */        lw $t4, 0x20($sp)
  /* 165E94 80132184 24040003 */     addiu $a0, $zero, 3
  /* 165E98 80132188 8D8D0074 */        lw $t5, 0x74($t4)
  /* 165E9C 8013218C C5A40058 */      lwc1 $f4, 0x58($t5)
  /* 165EA0 80132190 4600218D */ trunc.w.s $f6, $f4
  /* 165EA4 80132194 44053000 */      mfc1 $a1, $f6
  /* 165EA8 80132198 0C04C7B0 */       jal mvPortraitsPartiallyBlockRow
  /* 165EAC 8013219C 00000000 */       nop
  /* 165EB0 801321A0 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  .L801321A4:
  /* 165EB4 801321A4 3C18E700 */       lui $t8, 0xe700
  /* 165EB8 801321A8 3C0AE200 */       lui $t2, (0xE200001C >> 16) # 3791650844
  /* 165EBC 801321AC 244F0008 */     addiu $t7, $v0, 8
  /* 165EC0 801321B0 AE0F0000 */        sw $t7, ($s0) # gDisplayListHead + 0
  /* 165EC4 801321B4 AC400004 */        sw $zero, 4($v0)
  /* 165EC8 801321B8 AC580000 */        sw $t8, ($v0)
  /* 165ECC 801321BC 8E020000 */        lw $v0, ($s0) # gDisplayListHead + 0
  /* 165ED0 801321C0 3C0B0055 */       lui $t3, (0x552078 >> 16) # 5578872
  /* 165ED4 801321C4 356B2078 */       ori $t3, $t3, (0x552078 & 0xFFFF) # 5578872
  /* 165ED8 801321C8 24590008 */     addiu $t9, $v0, 8
  /* 165EDC 801321CC AE190000 */        sw $t9, ($s0) # gDisplayListHead + 0
  /* 165EE0 801321D0 354A001C */       ori $t2, $t2, (0xE200001C & 0xFFFF) # 3791650844
  /* 165EE4 801321D4 AC4A0000 */        sw $t2, ($v0)
  /* 165EE8 801321D8 0C0333AB */       jal func_ovl0_800CCEAC
  /* 165EEC 801321DC AC4B0004 */        sw $t3, 4($v0)
  /* 165EF0 801321E0 0C0333C0 */       jal func_ovl0_800CCF00
  /* 165EF4 801321E4 8FA40020 */        lw $a0, 0x20($sp)
  /* 165EF8 801321E8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 165EFC 801321EC 8FB00018 */        lw $s0, 0x18($sp)
  /* 165F00 801321F0 27BD0020 */     addiu $sp, $sp, 0x20
  /* 165F04 801321F4 03E00008 */        jr $ra
  /* 165F08 801321F8 00000000 */       nop

glabel mvPortraitsAnimatePortraitOverlay
  /* 165F0C 801321FC 3C058013 */       lui $a1, %hi(gIntroPotraitsFramesElapsed)
  /* 165F10 80132200 24A529E8 */     addiu $a1, $a1, %lo(gIntroPotraitsFramesElapsed)
  /* 165F14 80132204 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  /* 165F18 80132208 2401004B */     addiu $at, $zero, 0x4b
  /* 165F1C 8013220C 8C820074 */        lw $v0, 0x74($a0)
  /* 165F20 80132210 14610005 */       bne $v1, $at, .L80132228
  /* 165F24 80132214 3C01C424 */       lui $at, (0xC4240000 >> 16) # -656.0
  /* 165F28 80132218 44811000 */      mtc1 $at, $f2 # -656.0 to cop1
  /* 165F2C 8013221C 00000000 */       nop
  /* 165F30 80132220 E4420058 */      swc1 $f2, 0x58($v0)
  /* 165F34 80132224 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  .L80132228:
  /* 165F38 80132228 3C01C424 */       lui $at, (0xC4240000 >> 16) # -656.0
  /* 165F3C 8013222C 44811000 */      mtc1 $at, $f2 # -656.0 to cop1
  /* 165F40 80132230 2861004B */      slti $at, $v1, 0x4b
  /* 165F44 80132234 10200013 */      beqz $at, .L80132284
  /* 165F48 80132238 3C014424 */       lui $at, (0x44240000 >> 16) # 656.0
  /* 165F4C 8013223C 44816000 */      mtc1 $at, $f12 # 656.0 to cop1
  /* 165F50 80132240 C4400058 */      lwc1 $f0, 0x58($v0)
  /* 165F54 80132244 3C0142BA */       lui $at, (0x42BA0000 >> 16) # 93.0
  /* 165F58 80132248 460C003C */    c.lt.s $f0, $f12
  /* 165F5C 8013224C 00000000 */       nop
  /* 165F60 80132250 4502001D */     bc1fl .L801322C8
  /* 165F64 80132254 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  /* 165F68 80132258 44812000 */      mtc1 $at, $f4 # 93.0 to cop1
  /* 165F6C 8013225C 00000000 */       nop
  /* 165F70 80132260 46040180 */     add.s $f6, $f0, $f4
  /* 165F74 80132264 E4460058 */      swc1 $f6, 0x58($v0)
  /* 165F78 80132268 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 165F7C 8013226C 4608603C */    c.lt.s $f12, $f8
  /* 165F80 80132270 00000000 */       nop
  /* 165F84 80132274 45020014 */     bc1fl .L801322C8
  /* 165F88 80132278 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  /* 165F8C 8013227C 10000011 */         b .L801322C4
  /* 165F90 80132280 E44C0058 */      swc1 $f12, 0x58($v0)
  .L80132284:
  /* 165F94 80132284 C4400058 */      lwc1 $f0, 0x58($v0)
  /* 165F98 80132288 3C0142BA */       lui $at, (0x42BA0000 >> 16) # 93.0
  /* 165F9C 8013228C 4600103C */    c.lt.s $f2, $f0
  /* 165FA0 80132290 00000000 */       nop
  /* 165FA4 80132294 4502000C */     bc1fl .L801322C8
  /* 165FA8 80132298 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  /* 165FAC 8013229C 44815000 */      mtc1 $at, $f10 # 93.0 to cop1
  /* 165FB0 801322A0 00000000 */       nop
  /* 165FB4 801322A4 460A0401 */     sub.s $f16, $f0, $f10
  /* 165FB8 801322A8 E4500058 */      swc1 $f16, 0x58($v0)
  /* 165FBC 801322AC C4520058 */      lwc1 $f18, 0x58($v0)
  /* 165FC0 801322B0 4602903C */    c.lt.s $f18, $f2
  /* 165FC4 801322B4 00000000 */       nop
  /* 165FC8 801322B8 45020003 */     bc1fl .L801322C8
  /* 165FCC 801322BC 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  /* 165FD0 801322C0 E4420058 */      swc1 $f2, 0x58($v0)
  .L801322C4:
  /* 165FD4 801322C4 8CA30000 */        lw $v1, ($a1) # gIntroPotraitsFramesElapsed + 0
  .L801322C8:
  /* 165FD8 801322C8 3C014424 */       lui $at, (0x44240000 >> 16) # 656.0
  /* 165FDC 801322CC 44816000 */      mtc1 $at, $f12 # 656.0 to cop1
  /* 165FE0 801322D0 2401000F */     addiu $at, $zero, 0xf
  /* 165FE4 801322D4 10610016 */       beq $v1, $at, .L80132330
  /* 165FE8 801322D8 2401001E */     addiu $at, $zero, 0x1e
  /* 165FEC 801322DC 10610022 */       beq $v1, $at, .L80132368
  /* 165FF0 801322E0 240F0002 */     addiu $t7, $zero, 2
  /* 165FF4 801322E4 2401002D */     addiu $at, $zero, 0x2d
  /* 165FF8 801322E8 10610018 */       beq $v1, $at, .L8013234C
  /* 165FFC 801322EC 240E0001 */     addiu $t6, $zero, 1
  /* 166000 801322F0 2401003C */     addiu $at, $zero, 0x3c
  /* 166004 801322F4 10610023 */       beq $v1, $at, .L80132384
  /* 166008 801322F8 24180003 */     addiu $t8, $zero, 3
  /* 16600C 801322FC 2401005A */     addiu $at, $zero, 0x5a
  /* 166010 80132300 10610035 */       beq $v1, $at, .L801323D8
  /* 166014 80132304 24080002 */     addiu $t0, $zero, 2
  /* 166018 80132308 24010069 */     addiu $at, $zero, 0x69
  /* 16601C 8013230C 10610024 */       beq $v1, $at, .L801323A0
  /* 166020 80132310 24010078 */     addiu $at, $zero, 0x78
  /* 166024 80132314 10610037 */       beq $v1, $at, .L801323F4
  /* 166028 80132318 24090003 */     addiu $t1, $zero, 3
  /* 16602C 8013231C 24010087 */     addiu $at, $zero, 0x87
  /* 166030 80132320 10610026 */       beq $v1, $at, .L801323BC
  /* 166034 80132324 24190001 */     addiu $t9, $zero, 1
  /* 166038 80132328 03E00008 */        jr $ra
  /* 16603C 8013232C 00000000 */       nop

  .L80132330:
  /* 166040 80132330 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 166044 80132334 44812000 */      mtc1 $at, $f4 # 10.0 to cop1
  /* 166048 80132338 E4420058 */      swc1 $f2, 0x58($v0)
  /* 16604C 8013233C 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 166050 80132340 E444005C */      swc1 $f4, 0x5c($v0)
  /* 166054 80132344 03E00008 */        jr $ra
  /* 166058 80132348 AC2029EC */        sw $zero, %lo(gIntroPotraitsCurrentRow)($at)

  .L8013234C:
  /* 16605C 8013234C 3C014282 */       lui $at, (0x42820000 >> 16) # 65.0
  /* 166060 80132350 44813000 */      mtc1 $at, $f6 # 65.0 to cop1
  /* 166064 80132354 E4420058 */      swc1 $f2, 0x58($v0)
  /* 166068 80132358 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 16606C 8013235C E446005C */      swc1 $f6, 0x5c($v0)
  /* 166070 80132360 03E00008 */        jr $ra
  /* 166074 80132364 AC2E29EC */        sw $t6, %lo(gIntroPotraitsCurrentRow)($at)

  .L80132368:
  /* 166078 80132368 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 16607C 8013236C 44814000 */      mtc1 $at, $f8 # 120.0 to cop1
  /* 166080 80132370 E4420058 */      swc1 $f2, 0x58($v0)
  /* 166084 80132374 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 166088 80132378 E448005C */      swc1 $f8, 0x5c($v0)
  /* 16608C 8013237C 03E00008 */        jr $ra
  /* 166090 80132380 AC2F29EC */        sw $t7, %lo(gIntroPotraitsCurrentRow)($at)

  .L80132384:
  /* 166094 80132384 3C01432F */       lui $at, (0x432F0000 >> 16) # 175.0
  /* 166098 80132388 44815000 */      mtc1 $at, $f10 # 175.0 to cop1
  /* 16609C 8013238C E4420058 */      swc1 $f2, 0x58($v0)
  /* 1660A0 80132390 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 1660A4 80132394 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 1660A8 80132398 03E00008 */        jr $ra
  /* 1660AC 8013239C AC3829EC */        sw $t8, %lo(gIntroPotraitsCurrentRow)($at)

  .L801323A0:
  /* 1660B0 801323A0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1660B4 801323A4 44818000 */      mtc1 $at, $f16 # 10.0 to cop1
  /* 1660B8 801323A8 E44C0058 */      swc1 $f12, 0x58($v0)
  /* 1660BC 801323AC 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 1660C0 801323B0 E450005C */      swc1 $f16, 0x5c($v0)
  /* 1660C4 801323B4 03E00008 */        jr $ra
  /* 1660C8 801323B8 AC2029EC */        sw $zero, %lo(gIntroPotraitsCurrentRow)($at)

  .L801323BC:
  /* 1660CC 801323BC 3C014282 */       lui $at, (0x42820000 >> 16) # 65.0
  /* 1660D0 801323C0 44819000 */      mtc1 $at, $f18 # 65.0 to cop1
  /* 1660D4 801323C4 E44C0058 */      swc1 $f12, 0x58($v0)
  /* 1660D8 801323C8 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 1660DC 801323CC E452005C */      swc1 $f18, 0x5c($v0)
  /* 1660E0 801323D0 03E00008 */        jr $ra
  /* 1660E4 801323D4 AC3929EC */        sw $t9, %lo(gIntroPotraitsCurrentRow)($at)

  .L801323D8:
  /* 1660E8 801323D8 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 1660EC 801323DC 44812000 */      mtc1 $at, $f4 # 120.0 to cop1
  /* 1660F0 801323E0 E44C0058 */      swc1 $f12, 0x58($v0)
  /* 1660F4 801323E4 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 1660F8 801323E8 E444005C */      swc1 $f4, 0x5c($v0)
  /* 1660FC 801323EC 03E00008 */        jr $ra
  /* 166100 801323F0 AC2829EC */        sw $t0, %lo(gIntroPotraitsCurrentRow)($at)

  .L801323F4:
  /* 166104 801323F4 3C01432F */       lui $at, (0x432F0000 >> 16) # 175.0
  /* 166108 801323F8 44813000 */      mtc1 $at, $f6 # 175.0 to cop1
  /* 16610C 801323FC E44C0058 */      swc1 $f12, 0x58($v0)
  /* 166110 80132400 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 166114 80132404 E446005C */      swc1 $f6, 0x5c($v0)
  /* 166118 80132408 AC2929EC */        sw $t1, %lo(gIntroPotraitsCurrentRow)($at)
  /* 16611C 8013240C 03E00008 */        jr $ra
  /* 166120 80132410 00000000 */       nop

glabel mvPortraitsCreatePortraitOverlay
  /* 166124 80132414 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 166128 80132418 AFBF001C */        sw $ra, 0x1c($sp)
  /* 16612C 8013241C 00002025 */        or $a0, $zero, $zero
  /* 166130 80132420 00002825 */        or $a1, $zero, $zero
  /* 166134 80132424 24060012 */     addiu $a2, $zero, 0x12
  /* 166138 80132428 0C00265A */       jal omMakeGObjSPAfter
  /* 16613C 8013242C 3C078000 */       lui $a3, 0x8000
  /* 166140 80132430 3C058013 */       lui $a1, %hi(mvPortraitsRenderPortraitOverlay)
  /* 166144 80132434 240EFFFF */     addiu $t6, $zero, -1
  /* 166148 80132438 AFA20024 */        sw $v0, 0x24($sp)
  /* 16614C 8013243C AFAE0010 */        sw $t6, 0x10($sp)
  /* 166150 80132440 24A51FC4 */     addiu $a1, $a1, %lo(mvPortraitsRenderPortraitOverlay)
  /* 166154 80132444 00402025 */        or $a0, $v0, $zero
  /* 166158 80132448 2406001C */     addiu $a2, $zero, 0x1c
  /* 16615C 8013244C 0C00277D */       jal omAddGObjRenderProc
  /* 166160 80132450 3C078000 */       lui $a3, 0x8000
  /* 166164 80132454 3C0F8013 */       lui $t7, %hi(D_ovl35_80132BB0)
  /* 166168 80132458 8DEF2BB0 */        lw $t7, %lo(D_ovl35_80132BB0)($t7)
  /* 16616C 8013245C 3C180003 */       lui $t8, %hi(D_NF_0002B2D0)
  /* 166170 80132460 2718B2D0 */     addiu $t8, $t8, %lo(D_NF_0002B2D0)
  /* 166174 80132464 8FA40024 */        lw $a0, 0x24($sp)
  /* 166178 80132468 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 16617C 8013246C 01F82821 */      addu $a1, $t7, $t8
  /* 166180 80132470 94590024 */       lhu $t9, 0x24($v0)
  /* 166184 80132474 3C014424 */       lui $at, (0x44240000 >> 16) # 656.0
  /* 166188 80132478 44812000 */      mtc1 $at, $f4 # 656.0 to cop1
  /* 16618C 8013247C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 166190 80132480 44813000 */      mtc1 $at, $f6 # 10.0 to cop1
  /* 166194 80132484 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 166198 80132488 A4490024 */        sh $t1, 0x24($v0)
  /* 16619C 8013248C 352A0001 */       ori $t2, $t1, 1
  /* 1661A0 80132490 A44A0024 */        sh $t2, 0x24($v0)
  /* 1661A4 80132494 A0400028 */        sb $zero, 0x28($v0)
  /* 1661A8 80132498 A0400029 */        sb $zero, 0x29($v0)
  /* 1661AC 8013249C A040002A */        sb $zero, 0x2a($v0)
  /* 1661B0 801324A0 3C058013 */       lui $a1, %hi(mvPortraitsAnimatePortraitOverlay)
  /* 1661B4 801324A4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1661B8 801324A8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1661BC 801324AC 8FA40024 */        lw $a0, 0x24($sp)
  /* 1661C0 801324B0 24A521FC */     addiu $a1, $a1, %lo(mvPortraitsAnimatePortraitOverlay)
  /* 1661C4 801324B4 24060001 */     addiu $a2, $zero, 1
  /* 1661C8 801324B8 0C002062 */       jal omAddGObjCommonProc
  /* 1661CC 801324BC 24070001 */     addiu $a3, $zero, 1
  /* 1661D0 801324C0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1661D4 801324C4 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1661D8 801324C8 03E00008 */        jr $ra
  /* 1661DC 801324CC 00000000 */       nop

glabel mvPortraitsCreatePortraitViewport
  /* 1661E0 801324D0 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1661E4 801324D4 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1661E8 801324D8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1661EC 801324DC 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1661F0 801324E0 240F0050 */     addiu $t7, $zero, 0x50
  /* 1661F4 801324E4 24180000 */     addiu $t8, $zero, 0
  /* 1661F8 801324E8 3C190800 */       lui $t9, 0x800
  /* 1661FC 801324EC 2408FFFF */     addiu $t0, $zero, -1
  /* 166200 801324F0 24090001 */     addiu $t1, $zero, 1
  /* 166204 801324F4 240A0001 */     addiu $t2, $zero, 1
  /* 166208 801324F8 AFAA0030 */        sw $t2, 0x30($sp)
  /* 16620C 801324FC AFA90028 */        sw $t1, 0x28($sp)
  /* 166210 80132500 AFA80020 */        sw $t0, 0x20($sp)
  /* 166214 80132504 AFB9001C */        sw $t9, 0x1c($sp)
  /* 166218 80132508 AFB80018 */        sw $t8, 0x18($sp)
  /* 16621C 8013250C AFAF0014 */        sw $t7, 0x14($sp)
  /* 166220 80132510 AFAE0010 */        sw $t6, 0x10($sp)
  /* 166224 80132514 AFA00024 */        sw $zero, 0x24($sp)
  /* 166228 80132518 AFA0002C */        sw $zero, 0x2c($sp)
  /* 16622C 8013251C AFA00034 */        sw $zero, 0x34($sp)
  /* 166230 80132520 24040401 */     addiu $a0, $zero, 0x401
  /* 166234 80132524 00002825 */        or $a1, $zero, $zero
  /* 166238 80132528 24060010 */     addiu $a2, $zero, 0x10
  /* 16623C 8013252C 0C002E4F */       jal func_8000B93C
  /* 166240 80132530 3C078000 */       lui $a3, 0x8000
  /* 166244 80132534 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 166248 80132538 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 16624C 8013253C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 166250 80132540 8C430074 */        lw $v1, 0x74($v0)
  /* 166254 80132544 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 166258 80132548 44050000 */      mfc1 $a1, $f0
  /* 16625C 8013254C 44060000 */      mfc1 $a2, $f0
  /* 166260 80132550 3C07439B */       lui $a3, 0x439b
  /* 166264 80132554 24640008 */     addiu $a0, $v1, 8
  /* 166268 80132558 0C001C20 */       jal func_80007080
  /* 16626C 8013255C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 166270 80132560 8FBF003C */        lw $ra, 0x3c($sp)
  /* 166274 80132564 27BD0040 */     addiu $sp, $sp, 0x40
  /* 166278 80132568 03E00008 */        jr $ra
  /* 16627C 8013256C 00000000 */       nop

glabel mvPortraitsCreatePortraitOverlayViewport
  /* 166280 80132570 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 166284 80132574 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 166288 80132578 AFBF003C */        sw $ra, 0x3c($sp)
  /* 16628C 8013257C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 166290 80132580 240F003C */     addiu $t7, $zero, 0x3c
  /* 166294 80132584 24180000 */     addiu $t8, $zero, 0
  /* 166298 80132588 3C191000 */       lui $t9, 0x1000
  /* 16629C 8013258C 2408FFFF */     addiu $t0, $zero, -1
  /* 1662A0 80132590 24090001 */     addiu $t1, $zero, 1
  /* 1662A4 80132594 240A0001 */     addiu $t2, $zero, 1
  /* 1662A8 80132598 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1662AC 8013259C AFA90028 */        sw $t1, 0x28($sp)
  /* 1662B0 801325A0 AFA80020 */        sw $t0, 0x20($sp)
  /* 1662B4 801325A4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1662B8 801325A8 AFB80018 */        sw $t8, 0x18($sp)
  /* 1662BC 801325AC AFAF0014 */        sw $t7, 0x14($sp)
  /* 1662C0 801325B0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1662C4 801325B4 AFA00024 */        sw $zero, 0x24($sp)
  /* 1662C8 801325B8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1662CC 801325BC AFA00034 */        sw $zero, 0x34($sp)
  /* 1662D0 801325C0 24040401 */     addiu $a0, $zero, 0x401
  /* 1662D4 801325C4 00002825 */        or $a1, $zero, $zero
  /* 1662D8 801325C8 24060010 */     addiu $a2, $zero, 0x10
  /* 1662DC 801325CC 0C002E4F */       jal func_8000B93C
  /* 1662E0 801325D0 3C078000 */       lui $a3, 0x8000
  /* 1662E4 801325D4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1662E8 801325D8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1662EC 801325DC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1662F0 801325E0 8C430074 */        lw $v1, 0x74($v0)
  /* 1662F4 801325E4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1662F8 801325E8 44050000 */      mfc1 $a1, $f0
  /* 1662FC 801325EC 44060000 */      mfc1 $a2, $f0
  /* 166300 801325F0 3C07439B */       lui $a3, 0x439b
  /* 166304 801325F4 24640008 */     addiu $a0, $v1, 8
  /* 166308 801325F8 0C001C20 */       jal func_80007080
  /* 16630C 801325FC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 166310 80132600 8FBF003C */        lw $ra, 0x3c($sp)
  /* 166314 80132604 27BD0040 */     addiu $sp, $sp, 0x40
  /* 166318 80132608 03E00008 */        jr $ra
  /* 16631C 8013260C 00000000 */       nop

glabel mvPortraitsInitVariables
  /* 166320 80132610 3C018013 */       lui $at, %hi(gIntroPotraitsFramesElapsed)
  /* 166324 80132614 AC2029E8 */        sw $zero, %lo(gIntroPotraitsFramesElapsed)($at)
  /* 166328 80132618 3C018013 */       lui $at, %hi(gIntroPotraitsCurrentRow)
  /* 16632C 8013261C 03E00008 */        jr $ra
  /* 166330 80132620 AC2029EC */        sw $zero, %lo(gIntroPotraitsCurrentRow)($at)

glabel mvPortraitsMain
  /* 166334 80132624 3C038013 */       lui $v1, %hi(gIntroPotraitsFramesElapsed)
  /* 166338 80132628 246329E8 */     addiu $v1, $v1, %lo(gIntroPotraitsFramesElapsed)
  /* 16633C 8013262C 8C6E0000 */        lw $t6, ($v1) # gIntroPotraitsFramesElapsed + 0
  /* 166340 80132630 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 166344 80132634 AFBF0014 */        sw $ra, 0x14($sp)
  /* 166348 80132638 25CF0001 */     addiu $t7, $t6, 1
  /* 16634C 8013263C 29E1000A */      slti $at, $t7, 0xa
  /* 166350 80132640 AFA40018 */        sw $a0, 0x18($sp)
  /* 166354 80132644 14200030 */      bnez $at, .L80132708
  /* 166358 80132648 AC6F0000 */        sw $t7, ($v1) # gIntroPotraitsFramesElapsed + 0
  /* 16635C 8013264C 3C068013 */       lui $a2, %hi(gIntroPortraitsUnusedCounter)
  /* 166360 80132650 24C629F4 */     addiu $a2, $a2, %lo(gIntroPortraitsUnusedCounter)
  /* 166364 80132654 8CC20000 */        lw $v0, ($a2) # gIntroPortraitsUnusedCounter + 0
  /* 166368 80132658 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 16636C 8013265C 10400002 */      beqz $v0, .L80132668
  /* 166370 80132660 2459FFFF */     addiu $t9, $v0, -1
  /* 166374 80132664 ACD90000 */        sw $t9, ($a2) # gIntroPortraitsUnusedCounter + 0
  .L80132668:
  /* 166378 80132668 0C0E4281 */       jal func_ovl1_80390A04
  /* 16637C 8013266C 2405000F */     addiu $a1, $zero, 0xf
  /* 166380 80132670 10400006 */      beqz $v0, .L8013268C
  /* 166384 80132674 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 166388 80132678 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 16638C 8013267C 2405000F */     addiu $a1, $zero, 0xf
  /* 166390 80132680 10400002 */      beqz $v0, .L8013268C
  /* 166394 80132684 3C018013 */       lui $at, %hi(gIntroPortraitsUnusedCounter)
  /* 166398 80132688 AC2029F4 */        sw $zero, %lo(gIntroPortraitsUnusedCounter)($at)
  .L8013268C:
  /* 16639C 8013268C 0C0E41DB */       jal func_ovl1_8039076C
  /* 1663A0 80132690 3404D000 */       ori $a0, $zero, 0xd000
  /* 1663A4 80132694 10400007 */      beqz $v0, .L801326B4
  /* 1663A8 80132698 24090001 */     addiu $t1, $zero, 1
  /* 1663AC 8013269C 3C02800A */       lui $v0, %hi(gSceneData)
  /* 1663B0 801326A0 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 1663B4 801326A4 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 1663B8 801326A8 A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 1663BC 801326AC 0C00171D */       jal func_80005C74
  /* 1663C0 801326B0 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  .L801326B4:
  /* 1663C4 801326B4 3C028013 */       lui $v0, %hi(gIntroPotraitsFramesElapsed)
  /* 1663C8 801326B8 8C4229E8 */        lw $v0, %lo(gIntroPotraitsFramesElapsed)($v0)
  /* 1663CC 801326BC 2401004B */     addiu $at, $zero, 0x4b
  /* 1663D0 801326C0 3C048013 */       lui $a0, %hi(gIntroPortraitsPortraitGObj)
  /* 1663D4 801326C4 54410008 */      bnel $v0, $at, .L801326E8
  /* 1663D8 801326C8 24010096 */     addiu $at, $zero, 0x96
  /* 1663DC 801326CC 0C0026A1 */       jal omEjectGObj
  /* 1663E0 801326D0 8C8429F0 */        lw $a0, %lo(gIntroPortraitsPortraitGObj)($a0)
  /* 1663E4 801326D4 0C04C72B */       jal mvPortraitsCreatePortraitsSet2
  /* 1663E8 801326D8 00000000 */       nop
  /* 1663EC 801326DC 3C028013 */       lui $v0, %hi(gIntroPotraitsFramesElapsed)
  /* 1663F0 801326E0 8C4229E8 */        lw $v0, %lo(gIntroPotraitsFramesElapsed)($v0)
  /* 1663F4 801326E4 24010096 */     addiu $at, $zero, 0x96
  .L801326E8:
  /* 1663F8 801326E8 14410007 */       bne $v0, $at, .L80132708
  /* 1663FC 801326EC 240B001E */     addiu $t3, $zero, 0x1e
  /* 166400 801326F0 3C02800A */       lui $v0, %hi(gSceneData)
  /* 166404 801326F4 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 166408 801326F8 904A0000 */       lbu $t2, ($v0) # gSceneData + 0
  /* 16640C 801326FC A04B0000 */        sb $t3, ($v0) # gSceneData + 0
  /* 166410 80132700 0C00171D */       jal func_80005C74
  /* 166414 80132704 A04A0001 */        sb $t2, 1($v0) # gSceneData + 1
  .L80132708:
  /* 166418 80132708 8FBF0014 */        lw $ra, 0x14($sp)
  /* 16641C 8013270C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 166420 80132710 03E00008 */        jr $ra
  /* 166424 80132714 00000000 */       nop

glabel mvPortraitsInit
  /* 166428 80132718 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 16642C 8013271C 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 166430 80132720 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 166434 80132724 3C188013 */       lui $t8, %hi(D_ovl35_801329F8)
  /* 166438 80132728 3C088013 */       lui $t0, %hi(D_ovl35_80132B78)
  /* 16643C 8013272C AFBF001C */        sw $ra, 0x1c($sp)
  /* 166440 80132730 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 166444 80132734 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 166448 80132738 271829F8 */     addiu $t8, $t8, %lo(D_ovl35_801329F8)
  /* 16644C 8013273C 24190030 */     addiu $t9, $zero, 0x30
  /* 166450 80132740 25082B78 */     addiu $t0, $t0, %lo(D_ovl35_80132B78)
  /* 166454 80132744 24090007 */     addiu $t1, $zero, 7
  /* 166458 80132748 AFAE002C */        sw $t6, 0x2c($sp)
  /* 16645C 8013274C AFAF0030 */        sw $t7, 0x30($sp)
  /* 166460 80132750 AFA00034 */        sw $zero, 0x34($sp)
  /* 166464 80132754 AFA00038 */        sw $zero, 0x38($sp)
  /* 166468 80132758 AFB8003C */        sw $t8, 0x3c($sp)
  /* 16646C 8013275C AFB90040 */        sw $t9, 0x40($sp)
  /* 166470 80132760 AFA80044 */        sw $t0, 0x44($sp)
  /* 166474 80132764 AFA90048 */        sw $t1, 0x48($sp)
  /* 166478 80132768 0C0337DE */       jal rdManagerInitSetup
  /* 16647C 8013276C 27A4002C */     addiu $a0, $sp, 0x2c
  /* 166480 80132770 3C048013 */       lui $a0, %hi(D_ovl35_801328A0)
  /* 166484 80132774 248428A0 */     addiu $a0, $a0, %lo(D_ovl35_801328A0)
  /* 166488 80132778 0C0337BB */       jal rdManagerGetAllocSize
  /* 16648C 8013277C 24050002 */     addiu $a1, $zero, 2
  /* 166490 80132780 00402025 */        or $a0, $v0, $zero
  /* 166494 80132784 0C001260 */       jal gsMemoryAlloc
  /* 166498 80132788 24050010 */     addiu $a1, $zero, 0x10
  /* 16649C 8013278C 3C048013 */       lui $a0, %hi(D_ovl35_801328A0)
  /* 1664A0 80132790 3C068013 */       lui $a2, %hi(D_ovl35_80132BB0)
  /* 1664A4 80132794 24C62BB0 */     addiu $a2, $a2, %lo(D_ovl35_80132BB0)
  /* 1664A8 80132798 248428A0 */     addiu $a0, $a0, %lo(D_ovl35_801328A0)
  /* 1664AC 8013279C 24050002 */     addiu $a1, $zero, 2
  /* 1664B0 801327A0 0C033781 */       jal rdManagerLoadFiles
  /* 1664B4 801327A4 00403825 */        or $a3, $v0, $zero
  /* 1664B8 801327A8 3C058013 */       lui $a1, %hi(mvPortraitsMain)
  /* 1664BC 801327AC 24A52624 */     addiu $a1, $a1, %lo(mvPortraitsMain)
  /* 1664C0 801327B0 00002025 */        or $a0, $zero, $zero
  /* 1664C4 801327B4 00003025 */        or $a2, $zero, $zero
  /* 1664C8 801327B8 0C00265A */       jal omMakeGObjSPAfter
  /* 1664CC 801327BC 3C078000 */       lui $a3, 0x8000
  /* 1664D0 801327C0 240A00FF */     addiu $t2, $zero, 0xff
  /* 1664D4 801327C4 AFAA0010 */        sw $t2, 0x10($sp)
  /* 1664D8 801327C8 00002025 */        or $a0, $zero, $zero
  /* 1664DC 801327CC 3C058000 */       lui $a1, 0x8000
  /* 1664E0 801327D0 24060064 */     addiu $a2, $zero, 0x64
  /* 1664E4 801327D4 0C002E7F */       jal func_8000B9FC
  /* 1664E8 801327D8 24070003 */     addiu $a3, $zero, 3
  /* 1664EC 801327DC 0C04C984 */       jal mvPortraitsInitVariables
  /* 1664F0 801327E0 00000000 */       nop
  /* 1664F4 801327E4 0C04C934 */       jal mvPortraitsCreatePortraitViewport
  /* 1664F8 801327E8 00000000 */       nop
  /* 1664FC 801327EC 0C04C95C */       jal mvPortraitsCreatePortraitOverlayViewport
  /* 166500 801327F0 00000000 */       nop
  /* 166504 801327F4 0C04C6D6 */       jal mvPortraitsCreatePortraitsSet1
  /* 166508 801327F8 00000000 */       nop
  /* 16650C 801327FC 0C04C905 */       jal mvPortraitsCreatePortraitOverlay
  /* 166510 80132800 00000000 */       nop
  /* 166514 80132804 0C00024B */       jal func_8000092C
  /* 166518 80132808 00000000 */       nop
  /* 16651C 8013280C 2C410537 */     sltiu $at, $v0, 0x537
  /* 166520 80132810 50200007 */      beql $at, $zero, .L80132830
  /* 166524 80132814 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132818:
  /* 166528 80132818 0C00024B */       jal func_8000092C
  /* 16652C 8013281C 00000000 */       nop
  /* 166530 80132820 2C410537 */     sltiu $at, $v0, 0x537
  /* 166534 80132824 1420FFFC */      bnez $at, .L80132818
  /* 166538 80132828 00000000 */       nop
  /* 16653C 8013282C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132830:
  /* 166540 80132830 27BD0050 */     addiu $sp, $sp, 0x50
  /* 166544 80132834 03E00008 */        jr $ra
  /* 166548 80132838 00000000 */       nop

glabel mvPortraitsStartScene
  /* 16654C 8013283C 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 166550 80132840 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 166554 80132844 3C048013 */       lui $a0, %hi(D_ovl35_80132938)
  /* 166558 80132848 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 16655C 8013284C 24842938 */     addiu $a0, $a0, %lo(D_ovl35_80132938)
  /* 166560 80132850 AFBF0014 */        sw $ra, 0x14($sp)
  /* 166564 80132854 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 166568 80132858 0C001C09 */       jal func_80007024
  /* 16656C 8013285C AC8F000C */        sw $t7, 0xc($a0) # D_ovl35_80132938 + 12
  /* 166570 80132860 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 166574 80132864 3C198013 */       lui $t9, %hi(D_NF_80132BC0)
  /* 166578 80132868 3C048013 */       lui $a0, %hi(D_ovl35_80132954)
  /* 16657C 8013286C 27392BC0 */     addiu $t9, $t9, %lo(D_NF_80132BC0)
  /* 166580 80132870 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 166584 80132874 24842954 */     addiu $a0, $a0, %lo(D_ovl35_80132954)
  /* 166588 80132878 03194023 */      subu $t0, $t8, $t9
  /* 16658C 8013287C 0C001A0F */       jal gsGTLSceneInit
  /* 166590 80132880 AC880010 */        sw $t0, 0x10($a0) # D_ovl35_80132954 + 16
  /* 166594 80132884 8FBF0014 */        lw $ra, 0x14($sp)
  /* 166598 80132888 27BD0018 */     addiu $sp, $sp, 0x18
  /* 16659C 8013288C 03E00008 */        jr $ra
  /* 1665A0 80132890 00000000 */       nop

  /* 1665A4 80132894 00000000 */       nop
  /* 1665A8 80132898 00000000 */       nop
  /* 1665AC 8013289C 00000000 */       nop
