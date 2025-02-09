.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x8018D0C0 -> 0x8018E120

glabel mvOpeningSamusLoadFiles
  /* 168930 8018D0C0 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 168934 8018D0C4 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 168938 8018D0C8 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 16893C 8018D0CC 3C188019 */       lui $t8, %hi(D_ovl38_8018E2D8)
  /* 168940 8018D0D0 3C088019 */       lui $t0, %hi(D_ovl38_8018E458)
  /* 168944 8018D0D4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 168948 8018D0D8 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 16894C 8018D0DC 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 168950 8018D0E0 2718E2D8 */     addiu $t8, $t8, %lo(D_ovl38_8018E2D8)
  /* 168954 8018D0E4 24190030 */     addiu $t9, $zero, 0x30
  /* 168958 8018D0E8 2508E458 */     addiu $t0, $t0, %lo(D_ovl38_8018E458)
  /* 16895C 8018D0EC 24090007 */     addiu $t1, $zero, 7
  /* 168960 8018D0F0 AFAE0020 */        sw $t6, 0x20($sp)
  /* 168964 8018D0F4 AFAF0024 */        sw $t7, 0x24($sp)
  /* 168968 8018D0F8 AFA00028 */        sw $zero, 0x28($sp)
  /* 16896C 8018D0FC AFA0002C */        sw $zero, 0x2c($sp)
  /* 168970 8018D100 AFB80030 */        sw $t8, 0x30($sp)
  /* 168974 8018D104 AFB90034 */        sw $t9, 0x34($sp)
  /* 168978 8018D108 AFA80038 */        sw $t0, 0x38($sp)
  /* 16897C 8018D10C AFA9003C */        sw $t1, 0x3c($sp)
  /* 168980 8018D110 0C0337DE */       jal rdManagerInitSetup
  /* 168984 8018D114 27A40020 */     addiu $a0, $sp, 0x20
  /* 168988 8018D118 3C048019 */       lui $a0, %hi(D_ovl38_8018E164)
  /* 16898C 8018D11C 2484E164 */     addiu $a0, $a0, %lo(D_ovl38_8018E164)
  /* 168990 8018D120 0C0337BB */       jal rdManagerGetAllocSize
  /* 168994 8018D124 24050002 */     addiu $a1, $zero, 2
  /* 168998 8018D128 00402025 */        or $a0, $v0, $zero
  /* 16899C 8018D12C 0C001260 */       jal gsMemoryAlloc
  /* 1689A0 8018D130 24050010 */     addiu $a1, $zero, 0x10
  /* 1689A4 8018D134 3C048019 */       lui $a0, %hi(D_ovl38_8018E164)
  /* 1689A8 8018D138 3C068019 */       lui $a2, %hi(D_ovl38_8018E490)
  /* 1689AC 8018D13C 24C6E490 */     addiu $a2, $a2, %lo(D_ovl38_8018E490)
  /* 1689B0 8018D140 2484E164 */     addiu $a0, $a0, %lo(D_ovl38_8018E164)
  /* 1689B4 8018D144 24050002 */     addiu $a1, $zero, 2
  /* 1689B8 8018D148 0C033781 */       jal rdManagerLoadFiles
  /* 1689BC 8018D14C 00403825 */        or $a3, $v0, $zero
  /* 1689C0 8018D150 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1689C4 8018D154 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1689C8 8018D158 03E00008 */        jr $ra
  /* 1689CC 8018D15C 00000000 */       nop

glabel mvOpeningSamusSetNameColor
  /* 1689D0 8018D160 948E0024 */       lhu $t6, 0x24($a0)
  /* 1689D4 8018D164 240200FF */     addiu $v0, $zero, 0xff
  /* 1689D8 8018D168 A0820060 */        sb $v0, 0x60($a0)
  /* 1689DC 8018D16C 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 1689E0 8018D170 A4980024 */        sh $t8, 0x24($a0)
  /* 1689E4 8018D174 37190001 */       ori $t9, $t8, 1
  /* 1689E8 8018D178 A4990024 */        sh $t9, 0x24($a0)
  /* 1689EC 8018D17C A0820061 */        sb $v0, 0x61($a0)
  /* 1689F0 8018D180 A0820062 */        sb $v0, 0x62($a0)
  /* 1689F4 8018D184 A0820028 */        sb $v0, 0x28($a0)
  /* 1689F8 8018D188 A0820029 */        sb $v0, 0x29($a0)
  /* 1689FC 8018D18C 03E00008 */        jr $ra
  /* 168A00 8018D190 A082002A */        sb $v0, 0x2a($a0)

glabel mvOpeningSamusDrawName
  /* 168A04 8018D194 27BDFF70 */     addiu $sp, $sp, -0x90
  /* 168A08 8018D198 3C0F8019 */       lui $t7, %hi(dMvOpeningSamusNameOffsets)
  /* 168A0C 8018D19C AFBF0044 */        sw $ra, 0x44($sp)
  /* 168A10 8018D1A0 AFB40040 */        sw $s4, 0x40($sp)
  /* 168A14 8018D1A4 AFB3003C */        sw $s3, 0x3c($sp)
  /* 168A18 8018D1A8 AFB20038 */        sw $s2, 0x38($sp)
  /* 168A1C 8018D1AC AFB10034 */        sw $s1, 0x34($sp)
  /* 168A20 8018D1B0 AFB00030 */        sw $s0, 0x30($sp)
  /* 168A24 8018D1B4 F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 168A28 8018D1B8 F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 168A2C 8018D1BC 25EFE16C */     addiu $t7, $t7, %lo(dMvOpeningSamusNameOffsets)
  /* 168A30 8018D1C0 8DF90000 */        lw $t9, ($t7) # dMvOpeningSamusNameOffsets + 0
  /* 168A34 8018D1C4 8DF80004 */        lw $t8, 4($t7) # dMvOpeningSamusNameOffsets + 4
  /* 168A38 8018D1C8 27AE0070 */     addiu $t6, $sp, 0x70
  /* 168A3C 8018D1CC ADD90000 */        sw $t9, ($t6)
  /* 168A40 8018D1D0 ADD80004 */        sw $t8, 4($t6)
  /* 168A44 8018D1D4 8DF8000C */        lw $t8, 0xc($t7) # dMvOpeningSamusNameOffsets + 12
  /* 168A48 8018D1D8 8DF90008 */        lw $t9, 8($t7) # dMvOpeningSamusNameOffsets + 8
  /* 168A4C 8018D1DC 3C098019 */       lui $t1, %hi(dMvOpeningSamusNameCharPositions)
  /* 168A50 8018D1E0 ADD8000C */        sw $t8, 0xc($t6)
  /* 168A54 8018D1E4 ADD90008 */        sw $t9, 8($t6)
  /* 168A58 8018D1E8 8DF90010 */        lw $t9, 0x10($t7) # dMvOpeningSamusNameOffsets + 16
  /* 168A5C 8018D1EC 8DF80014 */        lw $t8, 0x14($t7) # dMvOpeningSamusNameOffsets + 20
  /* 168A60 8018D1F0 2529E184 */     addiu $t1, $t1, %lo(dMvOpeningSamusNameCharPositions)
  /* 168A64 8018D1F4 ADD90010 */        sw $t9, 0x10($t6)
  /* 168A68 8018D1F8 ADD80014 */        sw $t8, 0x14($t6)
  /* 168A6C 8018D1FC 8D2B0000 */        lw $t3, ($t1) # dMvOpeningSamusNameCharPositions + 0
  /* 168A70 8018D200 27A8005C */     addiu $t0, $sp, 0x5c
  /* 168A74 8018D204 8D2A0004 */        lw $t2, 4($t1) # dMvOpeningSamusNameCharPositions + 4
  /* 168A78 8018D208 AD0B0000 */        sw $t3, ($t0)
  /* 168A7C 8018D20C 8D2B0008 */        lw $t3, 8($t1) # dMvOpeningSamusNameCharPositions + 8
  /* 168A80 8018D210 AD0A0004 */        sw $t2, 4($t0)
  /* 168A84 8018D214 8D2A000C */        lw $t2, 0xc($t1) # dMvOpeningSamusNameCharPositions + 12
  /* 168A88 8018D218 AD0B0008 */        sw $t3, 8($t0)
  /* 168A8C 8018D21C 8D2B0010 */        lw $t3, 0x10($t1) # dMvOpeningSamusNameCharPositions + 16
  /* 168A90 8018D220 3C108000 */       lui $s0, %hi(D_NF_80000004)
  /* 168A94 8018D224 02003825 */        or $a3, $s0, $zero
  /* 168A98 8018D228 00002025 */        or $a0, $zero, $zero
  /* 168A9C 8018D22C 00002825 */        or $a1, $zero, $zero
  /* 168AA0 8018D230 24060011 */     addiu $a2, $zero, 0x11
  /* 168AA4 8018D234 AD0A000C */        sw $t2, 0xc($t0)
  /* 168AA8 8018D238 0C00265A */       jal omMakeGObjSPAfter
  /* 168AAC 8018D23C AD0B0010 */        sw $t3, 0x10($t0)
  /* 168AB0 8018D240 3C018019 */       lui $at, %hi(gMvOpeningSamusNameGObj)
  /* 168AB4 8018D244 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 168AB8 8018D248 240CFFFF */     addiu $t4, $zero, -1
  /* 168ABC 8018D24C AC22E27C */        sw $v0, %lo(gMvOpeningSamusNameGObj)($at)
  /* 168AC0 8018D250 0040A025 */        or $s4, $v0, $zero
  /* 168AC4 8018D254 AFAC0010 */        sw $t4, 0x10($sp)
  /* 168AC8 8018D258 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 168ACC 8018D25C 00402025 */        or $a0, $v0, $zero
  /* 168AD0 8018D260 2406001B */     addiu $a2, $zero, 0x1b
  /* 168AD4 8018D264 0C00277D */       jal omAddGObjRenderProc
  /* 168AD8 8018D268 02003825 */        or $a3, $s0, $zero
  /* 168ADC 8018D26C 8FAD0070 */        lw $t5, 0x70($sp)
  /* 168AE0 8018D270 27B00070 */     addiu $s0, $sp, 0x70
  /* 168AE4 8018D274 27B1005C */     addiu $s1, $sp, 0x5c
  /* 168AE8 8018D278 11A0001C */      beqz $t5, .L8018D2EC
  /* 168AEC 8018D27C 3C0142C8 */       lui $at, (0x42C80000 >> 16) # 100.0
  /* 168AF0 8018D280 4481B000 */      mtc1 $at, $f22 # 100.0 to cop1
  /* 168AF4 8018D284 3C0142A0 */       lui $at, (0x42A00000 >> 16) # 80.0
  /* 168AF8 8018D288 3C128019 */       lui $s2, %hi(D_ovl38_8018E490)
  /* 168AFC 8018D28C 4481A000 */      mtc1 $at, $f20 # 80.0 to cop1
  /* 168B00 8018D290 2652E490 */     addiu $s2, $s2, %lo(D_ovl38_8018E490)
  /* 168B04 8018D294 8E020000 */        lw $v0, %lo(D_NF_80000000)($s0)
  /* 168B08 8018D298 2413FFDF */     addiu $s3, $zero, -0x21
  /* 168B0C 8018D29C 8E4F0000 */        lw $t7, ($s2) # D_ovl38_8018E490 + 0
  .L8018D2A0:
  /* 168B10 8018D2A0 02802025 */        or $a0, $s4, $zero
  /* 168B14 8018D2A4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 168B18 8018D2A8 004F2821 */      addu $a1, $v0, $t7
  /* 168B1C 8018D2AC 94580024 */       lhu $t8, 0x24($v0)
  /* 168B20 8018D2B0 00402025 */        or $a0, $v0, $zero
  /* 168B24 8018D2B4 03134024 */       and $t0, $t8, $s3
  /* 168B28 8018D2B8 A4480024 */        sh $t0, 0x24($v0)
  /* 168B2C 8018D2BC 35090001 */       ori $t1, $t0, 1
  /* 168B30 8018D2C0 A4490024 */        sh $t1, 0x24($v0)
  /* 168B34 8018D2C4 C6240000 */      lwc1 $f4, ($s1)
  /* 168B38 8018D2C8 E456005C */      swc1 $f22, 0x5c($v0)
  /* 168B3C 8018D2CC 46142180 */     add.s $f6, $f4, $f20
  /* 168B40 8018D2D0 0C063458 */       jal mvOpeningSamusSetNameColor
  /* 168B44 8018D2D4 E4460058 */      swc1 $f6, 0x58($v0)
  /* 168B48 8018D2D8 8E020004 */        lw $v0, %lo(D_NF_80000004)($s0)
  /* 168B4C 8018D2DC 26100004 */     addiu $s0, $s0, %lo(D_NF_80000004)
  /* 168B50 8018D2E0 26310004 */     addiu $s1, $s1, 4
  /* 168B54 8018D2E4 5440FFEE */      bnel $v0, $zero, .L8018D2A0
  /* 168B58 8018D2E8 8E4F0000 */        lw $t7, ($s2) # D_ovl38_8018E490 + 0
  .L8018D2EC:
  /* 168B5C 8018D2EC 8FBF0044 */        lw $ra, 0x44($sp)
  /* 168B60 8018D2F0 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 168B64 8018D2F4 D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 168B68 8018D2F8 8FB00030 */        lw $s0, 0x30($sp)
  /* 168B6C 8018D2FC 8FB10034 */        lw $s1, 0x34($sp)
  /* 168B70 8018D300 8FB20038 */        lw $s2, 0x38($sp)
  /* 168B74 8018D304 8FB3003C */        lw $s3, 0x3c($sp)
  /* 168B78 8018D308 8FB40040 */        lw $s4, 0x40($sp)
  /* 168B7C 8018D30C 03E00008 */        jr $ra
  /* 168B80 8018D310 27BD0090 */     addiu $sp, $sp, 0x90

glabel mvOpeningSamusAnimateStageCamera
  /* 168B84 8018D314 3C0E8019 */       lui $t6, %hi(gMvOpeningSamusFramesElapsed)
  /* 168B88 8018D318 8DCEE278 */        lw $t6, %lo(gMvOpeningSamusFramesElapsed)($t6)
  /* 168B8C 8018D31C 3C038019 */       lui $v1, %hi(dMvOpeningSamusCameraSettingsAdjustedEnd)
  /* 168B90 8018D320 8C820074 */        lw $v0, 0x74($a0)
  /* 168B94 8018D324 29C1000F */      slti $at, $t6, 0xf
  /* 168B98 8018D328 14200036 */      bnez $at, .L8018D404
  /* 168B9C 8018D32C 2463E2B8 */     addiu $v1, $v1, %lo(dMvOpeningSamusCameraSettingsAdjustedEnd)
  /* 168BA0 8018D330 3C048019 */       lui $a0, %hi(dMvOpeningSamusCameraSettingsAdjustedStart)
  /* 168BA4 8018D334 2484E298 */     addiu $a0, $a0, %lo(dMvOpeningSamusCameraSettingsAdjustedStart)
  /* 168BA8 8018D338 C4860000 */      lwc1 $f6, ($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 0
  /* 168BAC 8018D33C C4640000 */      lwc1 $f4, ($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 0
  /* 168BB0 8018D340 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 168BB4 8018D344 44810000 */      mtc1 $at, $f0 # 45.0 to cop1
  /* 168BB8 8018D348 46062201 */     sub.s $f8, $f4, $f6
  /* 168BBC 8018D34C C450003C */      lwc1 $f16, 0x3c($v0)
  /* 168BC0 8018D350 46004283 */     div.s $f10, $f8, $f0
  /* 168BC4 8018D354 460A8480 */     add.s $f18, $f16, $f10
  /* 168BC8 8018D358 C44A0040 */      lwc1 $f10, 0x40($v0)
  /* 168BCC 8018D35C E452003C */      swc1 $f18, 0x3c($v0)
  /* 168BD0 8018D360 C4860004 */      lwc1 $f6, 4($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 4
  /* 168BD4 8018D364 C4640004 */      lwc1 $f4, 4($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 4
  /* 168BD8 8018D368 46062201 */     sub.s $f8, $f4, $f6
  /* 168BDC 8018D36C 46004403 */     div.s $f16, $f8, $f0
  /* 168BE0 8018D370 46105480 */     add.s $f18, $f10, $f16
  /* 168BE4 8018D374 C4500044 */      lwc1 $f16, 0x44($v0)
  /* 168BE8 8018D378 E4520040 */      swc1 $f18, 0x40($v0)
  /* 168BEC 8018D37C C4860008 */      lwc1 $f6, 8($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 8
  /* 168BF0 8018D380 C4640008 */      lwc1 $f4, 8($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 8
  /* 168BF4 8018D384 46062201 */     sub.s $f8, $f4, $f6
  /* 168BF8 8018D388 46004283 */     div.s $f10, $f8, $f0
  /* 168BFC 8018D38C 460A8480 */     add.s $f18, $f16, $f10
  /* 168C00 8018D390 C44A0048 */      lwc1 $f10, 0x48($v0)
  /* 168C04 8018D394 E4520044 */      swc1 $f18, 0x44($v0)
  /* 168C08 8018D398 C486000C */      lwc1 $f6, 0xc($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 12
  /* 168C0C 8018D39C C464000C */      lwc1 $f4, 0xc($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 12
  /* 168C10 8018D3A0 46062201 */     sub.s $f8, $f4, $f6
  /* 168C14 8018D3A4 46004403 */     div.s $f16, $f8, $f0
  /* 168C18 8018D3A8 46105480 */     add.s $f18, $f10, $f16
  /* 168C1C 8018D3AC C450004C */      lwc1 $f16, 0x4c($v0)
  /* 168C20 8018D3B0 E4520048 */      swc1 $f18, 0x48($v0)
  /* 168C24 8018D3B4 C4860010 */      lwc1 $f6, 0x10($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 16
  /* 168C28 8018D3B8 C4640010 */      lwc1 $f4, 0x10($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 16
  /* 168C2C 8018D3BC 46062201 */     sub.s $f8, $f4, $f6
  /* 168C30 8018D3C0 46004283 */     div.s $f10, $f8, $f0
  /* 168C34 8018D3C4 460A8480 */     add.s $f18, $f16, $f10
  /* 168C38 8018D3C8 C44A0050 */      lwc1 $f10, 0x50($v0)
  /* 168C3C 8018D3CC E452004C */      swc1 $f18, 0x4c($v0)
  /* 168C40 8018D3D0 C4860014 */      lwc1 $f6, 0x14($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 20
  /* 168C44 8018D3D4 C4640014 */      lwc1 $f4, 0x14($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 20
  /* 168C48 8018D3D8 46062201 */     sub.s $f8, $f4, $f6
  /* 168C4C 8018D3DC 46004403 */     div.s $f16, $f8, $f0
  /* 168C50 8018D3E0 46105480 */     add.s $f18, $f10, $f16
  /* 168C54 8018D3E4 C4500054 */      lwc1 $f16, 0x54($v0)
  /* 168C58 8018D3E8 E4520050 */      swc1 $f18, 0x50($v0)
  /* 168C5C 8018D3EC C4860018 */      lwc1 $f6, 0x18($a0) # dMvOpeningSamusCameraSettingsAdjustedStart + 24
  /* 168C60 8018D3F0 C4640018 */      lwc1 $f4, 0x18($v1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 24
  /* 168C64 8018D3F4 46062201 */     sub.s $f8, $f4, $f6
  /* 168C68 8018D3F8 46004283 */     div.s $f10, $f8, $f0
  /* 168C6C 8018D3FC 460A8480 */     add.s $f18, $f16, $f10
  /* 168C70 8018D400 E4520054 */      swc1 $f18, 0x54($v0)
  .L8018D404:
  /* 168C74 8018D404 03E00008 */        jr $ra
  /* 168C78 8018D408 00000000 */       nop

glabel mvOpeningSamusCreateStageViewport
  /* 168C7C 8018D40C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 168C80 8018D410 3C0E8019 */       lui $t6, %hi(dMvOpeningSamusCameraSettingsStart)
  /* 168C84 8018D414 AFBF002C */        sw $ra, 0x2c($sp)
  /* 168C88 8018D418 AFB20028 */        sw $s2, 0x28($sp)
  /* 168C8C 8018D41C AFB10024 */        sw $s1, 0x24($sp)
  /* 168C90 8018D420 AFB00020 */        sw $s0, 0x20($sp)
  /* 168C94 8018D424 AFA40030 */        sw $a0, 0x30($sp)
  /* 168C98 8018D428 AFA50034 */        sw $a1, 0x34($sp)
  /* 168C9C 8018D42C AFA60038 */        sw $a2, 0x38($sp)
  /* 168CA0 8018D430 25CEE120 */     addiu $t6, $t6, %lo(dMvOpeningSamusCameraSettingsStart)
  /* 168CA4 8018D434 8DD80000 */        lw $t8, ($t6) # dMvOpeningSamusCameraSettingsStart + 0
  /* 168CA8 8018D438 3C108019 */       lui $s0, %hi(dMvOpeningSamusCameraSettingsAdjustedStart)
  /* 168CAC 8018D43C 2610E298 */     addiu $s0, $s0, %lo(dMvOpeningSamusCameraSettingsAdjustedStart)
  /* 168CB0 8018D440 AE180000 */        sw $t8, ($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 0
  /* 168CB4 8018D444 8DCF0004 */        lw $t7, 4($t6) # dMvOpeningSamusCameraSettingsStart + 4
  /* 168CB8 8018D448 3C198019 */       lui $t9, %hi(dMvOpeningSamusCameraSettingsEnd)
  /* 168CBC 8018D44C 2739E13C */     addiu $t9, $t9, %lo(dMvOpeningSamusCameraSettingsEnd)
  /* 168CC0 8018D450 AE0F0004 */        sw $t7, 4($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 4
  /* 168CC4 8018D454 8DD80008 */        lw $t8, 8($t6) # dMvOpeningSamusCameraSettingsStart + 8
  /* 168CC8 8018D458 3C118019 */       lui $s1, %hi(dMvOpeningSamusCameraSettingsAdjustedEnd)
  /* 168CCC 8018D45C 2631E2B8 */     addiu $s1, $s1, %lo(dMvOpeningSamusCameraSettingsAdjustedEnd)
  /* 168CD0 8018D460 AE180008 */        sw $t8, 8($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 8
  /* 168CD4 8018D464 8DCF000C */        lw $t7, 0xc($t6) # dMvOpeningSamusCameraSettingsStart + 12
  /* 168CD8 8018D468 00002025 */        or $a0, $zero, $zero
  /* 168CDC 8018D46C AE0F000C */        sw $t7, 0xc($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 12
  /* 168CE0 8018D470 8DD80010 */        lw $t8, 0x10($t6) # dMvOpeningSamusCameraSettingsStart + 16
  /* 168CE4 8018D474 AE180010 */        sw $t8, 0x10($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 16
  /* 168CE8 8018D478 8DCF0014 */        lw $t7, 0x14($t6) # dMvOpeningSamusCameraSettingsStart + 20
  /* 168CEC 8018D47C AE0F0014 */        sw $t7, 0x14($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 20
  /* 168CF0 8018D480 8DD80018 */        lw $t8, 0x18($t6) # dMvOpeningSamusCameraSettingsStart + 24
  /* 168CF4 8018D484 AE180018 */        sw $t8, 0x18($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 24
  /* 168CF8 8018D488 8F290000 */        lw $t1, ($t9) # dMvOpeningSamusCameraSettingsEnd + 0
  /* 168CFC 8018D48C AE290000 */        sw $t1, ($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 0
  /* 168D00 8018D490 8F280004 */        lw $t0, 4($t9) # dMvOpeningSamusCameraSettingsEnd + 4
  /* 168D04 8018D494 AE280004 */        sw $t0, 4($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 4
  /* 168D08 8018D498 8F290008 */        lw $t1, 8($t9) # dMvOpeningSamusCameraSettingsEnd + 8
  /* 168D0C 8018D49C AE290008 */        sw $t1, 8($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 8
  /* 168D10 8018D4A0 8F28000C */        lw $t0, 0xc($t9) # dMvOpeningSamusCameraSettingsEnd + 12
  /* 168D14 8018D4A4 AE28000C */        sw $t0, 0xc($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 12
  /* 168D18 8018D4A8 8F290010 */        lw $t1, 0x10($t9) # dMvOpeningSamusCameraSettingsEnd + 16
  /* 168D1C 8018D4AC AE290010 */        sw $t1, 0x10($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 16
  /* 168D20 8018D4B0 8F280014 */        lw $t0, 0x14($t9) # dMvOpeningSamusCameraSettingsEnd + 20
  /* 168D24 8018D4B4 AE280014 */        sw $t0, 0x14($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 20
  /* 168D28 8018D4B8 8F290018 */        lw $t1, 0x18($t9) # dMvOpeningSamusCameraSettingsEnd + 24
  /* 168D2C 8018D4BC 0C0436CB */       jal func_ovl2_8010DB2C
  /* 168D30 8018D4C0 AE290018 */        sw $t1, 0x18($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 24
  /* 168D34 8018D4C4 3C038019 */       lui $v1, %hi(gMvOpeningSamusStageCameraGObj)
  /* 168D38 8018D4C8 2463E288 */     addiu $v1, $v1, %lo(gMvOpeningSamusStageCameraGObj)
  /* 168D3C 8018D4CC AC620000 */        sw $v0, ($v1) # gMvOpeningSamusStageCameraGObj + 0
  /* 168D40 8018D4D0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 168D44 8018D4D4 8C520074 */        lw $s2, 0x74($v0)
  /* 168D48 8018D4D8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 168D4C 8018D4DC 3C0542DC */       lui $a1, 0x42dc
  /* 168D50 8018D4E0 3C064120 */       lui $a2, 0x4120
  /* 168D54 8018D4E4 3C07439B */       lui $a3, 0x439b
  /* 168D58 8018D4E8 26440008 */     addiu $a0, $s2, 8
  /* 168D5C 8018D4EC 0C001C20 */       jal func_80007080
  /* 168D60 8018D4F0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 168D64 8018D4F4 3C018019 */       lui $at, %hi(D_ovl38_8018E25C)
  /* 168D68 8018D4F8 C426E25C */      lwc1 $f6, %lo(D_ovl38_8018E25C)($at)
  /* 168D6C 8018D4FC 3C048019 */       lui $a0, %hi(gMvOpeningSamusStageCameraGObj)
  /* 168D70 8018D500 E6460024 */      swc1 $f6, 0x24($s2)
  /* 168D74 8018D504 0C002CE7 */       jal func_8000B39C
  /* 168D78 8018D508 8C84E288 */        lw $a0, %lo(gMvOpeningSamusStageCameraGObj)($a0)
  /* 168D7C 8018D50C 3C048019 */       lui $a0, %hi(gMvOpeningSamusStageCameraGObj)
  /* 168D80 8018D510 3C058019 */       lui $a1, %hi(mvOpeningSamusAnimateStageCamera)
  /* 168D84 8018D514 24A5D314 */     addiu $a1, $a1, %lo(mvOpeningSamusAnimateStageCamera)
  /* 168D88 8018D518 8C84E288 */        lw $a0, %lo(gMvOpeningSamusStageCameraGObj)($a0)
  /* 168D8C 8018D51C 24060001 */     addiu $a2, $zero, 1
  /* 168D90 8018D520 0C002062 */       jal omAddGObjCommonProc
  /* 168D94 8018D524 24070001 */     addiu $a3, $zero, 1
  /* 168D98 8018D528 C7A00030 */      lwc1 $f0, 0x30($sp)
  /* 168D9C 8018D52C C7A20034 */      lwc1 $f2, 0x34($sp)
  /* 168DA0 8018D530 C7AC0038 */      lwc1 $f12, 0x38($sp)
  /* 168DA4 8018D534 C6080000 */      lwc1 $f8, ($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 0
  /* 168DA8 8018D538 C6100004 */      lwc1 $f16, 4($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 4
  /* 168DAC 8018D53C C6040008 */      lwc1 $f4, 8($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 8
  /* 168DB0 8018D540 46004280 */     add.s $f10, $f8, $f0
  /* 168DB4 8018D544 C608000C */      lwc1 $f8, 0xc($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 12
  /* 168DB8 8018D548 46028480 */     add.s $f18, $f16, $f2
  /* 168DBC 8018D54C C6100010 */      lwc1 $f16, 0x10($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 16
  /* 168DC0 8018D550 E60A0000 */      swc1 $f10, ($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 0
  /* 168DC4 8018D554 460C2180 */     add.s $f6, $f4, $f12
  /* 168DC8 8018D558 C6040014 */      lwc1 $f4, 0x14($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 20
  /* 168DCC 8018D55C E6120004 */      swc1 $f18, 4($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 4
  /* 168DD0 8018D560 46004280 */     add.s $f10, $f8, $f0
  /* 168DD4 8018D564 E6060008 */      swc1 $f6, 8($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 8
  /* 168DD8 8018D568 C6280000 */      lwc1 $f8, ($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 0
  /* 168DDC 8018D56C 46028480 */     add.s $f18, $f16, $f2
  /* 168DE0 8018D570 C6300004 */      lwc1 $f16, 4($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 4
  /* 168DE4 8018D574 E60A000C */      swc1 $f10, 0xc($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 12
  /* 168DE8 8018D578 460C2180 */     add.s $f6, $f4, $f12
  /* 168DEC 8018D57C C6240008 */      lwc1 $f4, 8($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 8
  /* 168DF0 8018D580 E6120010 */      swc1 $f18, 0x10($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 16
  /* 168DF4 8018D584 46004280 */     add.s $f10, $f8, $f0
  /* 168DF8 8018D588 E6060014 */      swc1 $f6, 0x14($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 20
  /* 168DFC 8018D58C C628000C */      lwc1 $f8, 0xc($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 12
  /* 168E00 8018D590 46028480 */     add.s $f18, $f16, $f2
  /* 168E04 8018D594 C6300010 */      lwc1 $f16, 0x10($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 16
  /* 168E08 8018D598 E62A0000 */      swc1 $f10, ($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 0
  /* 168E0C 8018D59C 460C2180 */     add.s $f6, $f4, $f12
  /* 168E10 8018D5A0 C6240014 */      lwc1 $f4, 0x14($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 20
  /* 168E14 8018D5A4 E6320004 */      swc1 $f18, 4($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 4
  /* 168E18 8018D5A8 46004280 */     add.s $f10, $f8, $f0
  /* 168E1C 8018D5AC E6260008 */      swc1 $f6, 8($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 8
  /* 168E20 8018D5B0 C6080000 */      lwc1 $f8, ($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 0
  /* 168E24 8018D5B4 46028480 */     add.s $f18, $f16, $f2
  /* 168E28 8018D5B8 E62A000C */      swc1 $f10, 0xc($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 12
  /* 168E2C 8018D5BC 460C2180 */     add.s $f6, $f4, $f12
  /* 168E30 8018D5C0 E6320010 */      swc1 $f18, 0x10($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 16
  /* 168E34 8018D5C4 E6260014 */      swc1 $f6, 0x14($s1) # dMvOpeningSamusCameraSettingsAdjustedEnd + 20
  /* 168E38 8018D5C8 E648003C */      swc1 $f8, 0x3c($s2)
  /* 168E3C 8018D5CC C60A0004 */      lwc1 $f10, 4($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 4
  /* 168E40 8018D5D0 E64A0040 */      swc1 $f10, 0x40($s2)
  /* 168E44 8018D5D4 C6100008 */      lwc1 $f16, 8($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 8
  /* 168E48 8018D5D8 E6500044 */      swc1 $f16, 0x44($s2)
  /* 168E4C 8018D5DC C612000C */      lwc1 $f18, 0xc($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 12
  /* 168E50 8018D5E0 E6520048 */      swc1 $f18, 0x48($s2)
  /* 168E54 8018D5E4 C6040010 */      lwc1 $f4, 0x10($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 16
  /* 168E58 8018D5E8 E644004C */      swc1 $f4, 0x4c($s2)
  /* 168E5C 8018D5EC C6060014 */      lwc1 $f6, 0x14($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 20
  /* 168E60 8018D5F0 E6460050 */      swc1 $f6, 0x50($s2)
  /* 168E64 8018D5F4 C6080018 */      lwc1 $f8, 0x18($s0) # dMvOpeningSamusCameraSettingsAdjustedStart + 24
  /* 168E68 8018D5F8 E6480054 */      swc1 $f8, 0x54($s2)
  /* 168E6C 8018D5FC 8FBF002C */        lw $ra, 0x2c($sp)
  /* 168E70 8018D600 8FB20028 */        lw $s2, 0x28($sp)
  /* 168E74 8018D604 8FB10024 */        lw $s1, 0x24($sp)
  /* 168E78 8018D608 8FB00020 */        lw $s0, 0x20($sp)
  /* 168E7C 8018D60C 03E00008 */        jr $ra
  /* 168E80 8018D610 27BD0030 */     addiu $sp, $sp, 0x30

glabel mvOpeningSamusInitFighterStagePanel
  /* 168E84 8018D614 27BDFF40 */     addiu $sp, $sp, -0xc0
  /* 168E88 8018D618 AFBF003C */        sw $ra, 0x3c($sp)
  /* 168E8C 8018D61C AFBE0038 */        sw $fp, 0x38($sp)
  /* 168E90 8018D620 AFB70034 */        sw $s7, 0x34($sp)
  /* 168E94 8018D624 AFB60030 */        sw $s6, 0x30($sp)
  /* 168E98 8018D628 AFB5002C */        sw $s5, 0x2c($sp)
  /* 168E9C 8018D62C AFB40028 */        sw $s4, 0x28($sp)
  /* 168EA0 8018D630 AFB30024 */        sw $s3, 0x24($sp)
  /* 168EA4 8018D634 AFB20020 */        sw $s2, 0x20($sp)
  /* 168EA8 8018D638 AFB1001C */        sw $s1, 0x1c($sp)
  /* 168EAC 8018D63C 0C0412F7 */       jal grWallpaper_SetGroundWallpaper
  /* 168EB0 8018D640 AFB00018 */        sw $s0, 0x18($sp)
  /* 168EB4 8018D644 0C041580 */       jal grNodeInit_SetGroundFiles
  /* 168EB8 8018D648 00000000 */       nop
  /* 168EBC 8018D64C 3C0E8013 */       lui $t6, %hi(D_ovl2_801313E4)
  /* 168EC0 8018D650 8DCE13E4 */        lw $t6, %lo(D_ovl2_801313E4)($t6)
  /* 168EC4 8018D654 24120025 */     addiu $s2, $zero, 0x25
  /* 168EC8 8018D658 24110030 */     addiu $s1, $zero, 0x30
  /* 168ECC 8018D65C 8DD30074 */        lw $s3, 0x74($t6)
  /* 168ED0 8018D660 12600015 */      beqz $s3, .L8018D6B8
  /* 168ED4 8018D664 02608025 */        or $s0, $s3, $zero
  .L8018D668:
  /* 168ED8 8018D668 92040056 */       lbu $a0, 0x56($s0)
  /* 168EDC 8018D66C 00002825 */        or $a1, $zero, $zero
  /* 168EE0 8018D670 02001025 */        or $v0, $s0, $zero
  /* 168EE4 8018D674 5880000C */     blezl $a0, .L8018D6A8
  /* 168EE8 8018D678 02002025 */        or $a0, $s0, $zero
  .L8018D67C:
  /* 168EEC 8018D67C 8C430058 */        lw $v1, 0x58($v0)
  /* 168EF0 8018D680 24A50001 */     addiu $a1, $a1, 1
  /* 168EF4 8018D684 906F0004 */       lbu $t7, 4($v1)
  /* 168EF8 8018D688 562F0004 */      bnel $s1, $t7, .L8018D69C
  /* 168EFC 8018D68C 00A4082A */       slt $at, $a1, $a0
  /* 168F00 8018D690 A0720004 */        sb $s2, 4($v1)
  /* 168F04 8018D694 92040056 */       lbu $a0, 0x56($s0)
  /* 168F08 8018D698 00A4082A */       slt $at, $a1, $a0
  .L8018D69C:
  /* 168F0C 8018D69C 1420FFF7 */      bnez $at, .L8018D67C
  /* 168F10 8018D6A0 24420004 */     addiu $v0, $v0, 4
  /* 168F14 8018D6A4 02002025 */        or $a0, $s0, $zero
  .L8018D6A8:
  /* 168F18 8018D6A8 0C0321BA */       jal func_ovl0_800C86E8
  /* 168F1C 8018D6AC 02602825 */        or $a1, $s3, $zero
  /* 168F20 8018D6B0 1440FFED */      bnez $v0, .L8018D668
  /* 168F24 8018D6B4 00408025 */        or $s0, $v0, $zero
  .L8018D6B8:
  /* 168F28 8018D6B8 0C03F1E9 */       jal mpCollision_GetMPointCountKind
  /* 168F2C 8018D6BC 24040015 */     addiu $a0, $zero, 0x15
  /* 168F30 8018D6C0 24010001 */     addiu $at, $zero, 1
  /* 168F34 8018D6C4 10410009 */       beq $v0, $at, .L8018D6EC
  /* 168F38 8018D6C8 24040015 */     addiu $a0, $zero, 0x15
  /* 168F3C 8018D6CC 3C108019 */       lui $s0, %hi(D_ovl38_8018E240)
  /* 168F40 8018D6D0 2610E240 */     addiu $s0, $s0, %lo(D_ovl38_8018E240)
  .L8018D6D4:
  /* 168F44 8018D6D4 0C008D89 */       jal gsFatalPrintF
  /* 168F48 8018D6D8 02002025 */        or $a0, $s0, $zero
  /* 168F4C 8018D6DC 0C028C10 */       jal smCrashPrintGObjStatus
  /* 168F50 8018D6E0 00000000 */       nop
  /* 168F54 8018D6E4 1000FFFB */         b .L8018D6D4
  /* 168F58 8018D6E8 00000000 */       nop
  .L8018D6EC:
  /* 168F5C 8018D6EC 0C03F205 */       jal mpCollision_GetMPointIDsKind
  /* 168F60 8018D6F0 27A500A8 */     addiu $a1, $sp, 0xa8
  /* 168F64 8018D6F4 27B0009C */     addiu $s0, $sp, 0x9c
  /* 168F68 8018D6F8 02002825 */        or $a1, $s0, $zero
  /* 168F6C 8018D6FC 0C03F225 */       jal mpCollision_GetMPointPositionID
  /* 168F70 8018D700 8FA400A8 */        lw $a0, 0xa8($sp)
  /* 168F74 8018D704 8E190000 */        lw $t9, ($s0) # D_ovl38_8018E240 + 0
  /* 168F78 8018D708 AFB90000 */        sw $t9, ($sp)
  /* 168F7C 8018D70C 8E050004 */        lw $a1, 4($s0) # D_ovl38_8018E240 + 4
  /* 168F80 8018D710 8FA40000 */        lw $a0, ($sp)
  /* 168F84 8018D714 AFA50004 */        sw $a1, 4($sp)
  /* 168F88 8018D718 8E060008 */        lw $a2, 8($s0) # D_ovl38_8018E240 + 8
  /* 168F8C 8018D71C 0C063503 */       jal mvOpeningSamusCreateStageViewport
  /* 168F90 8018D720 AFA60008 */        sw $a2, 8($sp)
  /* 168F94 8018D724 0C0455B9 */       jal gmRumble_SetPlayerRumble
  /* 168F98 8018D728 00000000 */       nop
  /* 168F9C 8018D72C 0C0594F8 */       jal func_NF_801653E0 # couldn't be resolved
  /* 168FA0 8018D730 00000000 */       nop
  /* 168FA4 8018D734 3C168011 */       lui $s6, %hi(dFTDefaultFighterDesc)
  /* 168FA8 8018D738 3C15800A */       lui $s5, %hi(gBattleState)
  /* 168FAC 8018D73C 26B550E8 */     addiu $s5, $s5, %lo(gBattleState)
  /* 168FB0 8018D740 26D66DD0 */     addiu $s6, $s6, %lo(dFTDefaultFighterDesc)
  /* 168FB4 8018D744 00008825 */        or $s1, $zero, $zero
  /* 168FB8 8018D748 00009025 */        or $s2, $zero, $zero
  /* 168FBC 8018D74C 241E0004 */     addiu $fp, $zero, 4
  /* 168FC0 8018D750 24170002 */     addiu $s7, $zero, 2
  /* 168FC4 8018D754 27B4004C */     addiu $s4, $sp, 0x4c
  .L8018D758:
  /* 168FC8 8018D758 02C05025 */        or $t2, $s6, $zero
  /* 168FCC 8018D75C 02805825 */        or $t3, $s4, $zero
  /* 168FD0 8018D760 26CC003C */     addiu $t4, $s6, 0x3c
  .L8018D764:
  /* 168FD4 8018D764 8D490000 */        lw $t1, ($t2)
  /* 168FD8 8018D768 254A000C */     addiu $t2, $t2, 0xc
  /* 168FDC 8018D76C 256B000C */     addiu $t3, $t3, 0xc
  /* 168FE0 8018D770 AD69FFF4 */        sw $t1, -0xc($t3)
  /* 168FE4 8018D774 8D48FFF8 */        lw $t0, -8($t2)
  /* 168FE8 8018D778 AD68FFF8 */        sw $t0, -8($t3)
  /* 168FEC 8018D77C 8D49FFFC */        lw $t1, -4($t2)
  /* 168FF0 8018D780 154CFFF8 */       bne $t2, $t4, .L8018D764
  /* 168FF4 8018D784 AD69FFFC */        sw $t1, -4($t3)
  /* 168FF8 8018D788 8D490000 */        lw $t1, ($t2)
  /* 168FFC 8018D78C 00117880 */       sll $t7, $s1, 2
  /* 169000 8018D790 01F17821 */      addu $t7, $t7, $s1
  /* 169004 8018D794 AD690000 */        sw $t1, ($t3)
  /* 169008 8018D798 8EAD0000 */        lw $t5, ($s5) # gBattleState + 0
  /* 16900C 8018D79C 3C188004 */       lui $t8, %hi(gPlayerControllers)
  /* 169010 8018D7A0 27185228 */     addiu $t8, $t8, %lo(gPlayerControllers)
  /* 169014 8018D7A4 01B28021 */      addu $s0, $t5, $s2
  /* 169018 8018D7A8 920E0022 */       lbu $t6, 0x22($s0) # D_ovl38_8018E240 + 34
  /* 16901C 8018D7AC 000F7840 */       sll $t7, $t7, 1
  /* 169020 8018D7B0 01F89821 */      addu $s3, $t7, $t8
  /* 169024 8018D7B4 52EE0030 */      beql $s7, $t6, .L8018D878
  /* 169028 8018D7B8 26310001 */     addiu $s1, $s1, 1
  /* 16902C 8018D7BC 0C035E1B */       jal ftManagerSetupDataKind
  /* 169030 8018D7C0 92040023 */       lbu $a0, 0x23($s0) # D_ovl38_8018E240 + 35
  /* 169034 8018D7C4 8EA20000 */        lw $v0, ($s5) # gBattleState + 0
  /* 169038 8018D7C8 C7A4009C */      lwc1 $f4, 0x9c($sp)
  /* 16903C 8018D7CC C7A600A0 */      lwc1 $f6, 0xa0($sp)
  /* 169040 8018D7D0 00528021 */      addu $s0, $v0, $s2
  /* 169044 8018D7D4 92190023 */       lbu $t9, 0x23($s0) # D_ovl38_8018E240 + 35
  /* 169048 8018D7D8 C7A800A4 */      lwc1 $f8, 0xa4($sp)
  /* 16904C 8018D7DC 240C0001 */     addiu $t4, $zero, 1
  /* 169050 8018D7E0 AFAC005C */        sw $t4, 0x5c($sp)
  /* 169054 8018D7E4 E7A40050 */      swc1 $f4, 0x50($sp)
  /* 169058 8018D7E8 E7A60054 */      swc1 $f6, 0x54($sp)
  /* 16905C 8018D7EC AFB9004C */        sw $t9, 0x4c($sp)
  /* 169060 8018D7F0 E7A80058 */      swc1 $f8, 0x58($sp)
  /* 169064 8018D7F4 920A0024 */       lbu $t2, 0x24($s0) # D_ovl38_8018E240 + 36
  /* 169068 8018D7F8 240B0001 */     addiu $t3, $zero, 1
  /* 16906C 8018D7FC A3B10061 */        sb $s1, 0x61($sp)
  /* 169070 8018D800 A3AB0062 */        sb $t3, 0x62($sp)
  /* 169074 8018D804 A3AA0060 */        sb $t2, 0x60($sp)
  /* 169078 8018D808 92080026 */       lbu $t0, 0x26($s0) # D_ovl38_8018E240 + 38
  /* 16907C 8018D80C A3A80063 */        sb $t0, 0x63($sp)
  /* 169080 8018D810 92090021 */       lbu $t1, 0x21($s0) # D_ovl38_8018E240 + 33
  /* 169084 8018D814 A3A90065 */        sb $t1, 0x65($sp)
  /* 169088 8018D818 920D0020 */       lbu $t5, 0x20($s0) # D_ovl38_8018E240 + 32
  /* 16908C 8018D81C A3AD0066 */        sb $t5, 0x66($sp)
  /* 169090 8018D820 904E0007 */       lbu $t6, 7($v0)
  /* 169094 8018D824 AFA00070 */        sw $zero, 0x70($sp)
  /* 169098 8018D828 A3AE0067 */        sb $t6, 0x67($sp)
  /* 16909C 8018D82C 920F0022 */       lbu $t7, 0x22($s0) # D_ovl38_8018E240 + 34
  /* 1690A0 8018D830 AFB30078 */        sw $s3, 0x78($sp)
  /* 1690A4 8018D834 AFAF0074 */        sw $t7, 0x74($sp)
  /* 1690A8 8018D838 0C035E2D */       jal ftManagerAllocAnimHeapKind
  /* 1690AC 8018D83C 92040023 */       lbu $a0, 0x23($s0) # D_ovl38_8018E240 + 35
  /* 1690B0 8018D840 AFA20084 */        sw $v0, 0x84($sp)
  /* 1690B4 8018D844 0C035FCF */       jal ftManagerMakeFighter
  /* 1690B8 8018D848 02802025 */        or $a0, $s4, $zero
  /* 1690BC 8018D84C 3C018019 */       lui $at, %hi(gMvOpeningSamusStageFighterGObj)
  /* 1690C0 8018D850 AC22E280 */        sw $v0, %lo(gMvOpeningSamusStageFighterGObj)($at)
  /* 1690C4 8018D854 00408025 */        or $s0, $v0, $zero
  /* 1690C8 8018D858 02202025 */        or $a0, $s1, $zero
  /* 1690CC 8018D85C 0C039F13 */       jal ftCommon_ClearPlayerMatchStats
  /* 1690D0 8018D860 00402825 */        or $a1, $v0, $zero
  /* 1690D4 8018D864 3C058019 */       lui $a1, %hi(dMvOpeningSamusInputSeq)
  /* 1690D8 8018D868 24A5E158 */     addiu $a1, $a1, %lo(dMvOpeningSamusInputSeq)
  /* 1690DC 8018D86C 0C03A6CC */       jal ftCommon_SetHowToPlayInputSeq
  /* 1690E0 8018D870 02002025 */        or $a0, $s0, $zero
  /* 1690E4 8018D874 26310001 */     addiu $s1, $s1, 1
  .L8018D878:
  /* 1690E8 8018D878 163EFFB7 */       bne $s1, $fp, .L8018D758
  /* 1690EC 8018D87C 26520074 */     addiu $s2, $s2, 0x74
  /* 1690F0 8018D880 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1690F4 8018D884 8FB00018 */        lw $s0, 0x18($sp)
  /* 1690F8 8018D888 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1690FC 8018D88C 8FB20020 */        lw $s2, 0x20($sp)
  /* 169100 8018D890 8FB30024 */        lw $s3, 0x24($sp)
  /* 169104 8018D894 8FB40028 */        lw $s4, 0x28($sp)
  /* 169108 8018D898 8FB5002C */        lw $s5, 0x2c($sp)
  /* 16910C 8018D89C 8FB60030 */        lw $s6, 0x30($sp)
  /* 169110 8018D8A0 8FB70034 */        lw $s7, 0x34($sp)
  /* 169114 8018D8A4 8FBE0038 */        lw $fp, 0x38($sp)
  /* 169118 8018D8A8 03E00008 */        jr $ra
  /* 16911C 8018D8AC 27BD00C0 */     addiu $sp, $sp, 0xc0

glabel mvOpeningSamusRenderPosedFighterBackground
  /* 169120 8018D8B0 3C0B8004 */       lui $t3, %hi(gDisplayListHead)
  /* 169124 8018D8B4 256B65B0 */     addiu $t3, $t3, %lo(gDisplayListHead)
  /* 169128 8018D8B8 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 16912C 8018D8BC AFA40000 */        sw $a0, ($sp)
  /* 169130 8018D8C0 3C0CE700 */       lui $t4, 0xe700
  /* 169134 8018D8C4 246E0008 */     addiu $t6, $v1, 8
  /* 169138 8018D8C8 AD6E0000 */        sw $t6, ($t3) # gDisplayListHead + 0
  /* 16913C 8018D8CC AC600004 */        sw $zero, 4($v1)
  /* 169140 8018D8D0 AC6C0000 */        sw $t4, ($v1)
  /* 169144 8018D8D4 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 169148 8018D8D8 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 16914C 8018D8DC 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 169150 8018D8E0 246F0008 */     addiu $t7, $v1, 8
  /* 169154 8018D8E4 AD6F0000 */        sw $t7, ($t3) # gDisplayListHead + 0
  /* 169158 8018D8E8 AC600004 */        sw $zero, 4($v1)
  /* 16915C 8018D8EC AC780000 */        sw $t8, ($v1)
  /* 169160 8018D8F0 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 169164 8018D8F4 240F50FF */     addiu $t7, $zero, 0x50ff
  /* 169168 8018D8F8 3C0EFA00 */       lui $t6, 0xfa00
  /* 16916C 8018D8FC 24790008 */     addiu $t9, $v1, 8
  /* 169170 8018D900 AD790000 */        sw $t9, ($t3) # gDisplayListHead + 0
  /* 169174 8018D904 AC6F0004 */        sw $t7, 4($v1)
  /* 169178 8018D908 AC6E0000 */        sw $t6, ($v1)
  /* 16917C 8018D90C 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 169180 8018D910 3C0EFFFD */       lui $t6, (0xFFFDF6FB >> 16) # 4294833915
  /* 169184 8018D914 3C19FCFF */       lui $t9, (0xFCFFFFFF >> 16) # 4244635647
  /* 169188 8018D918 24780008 */     addiu $t8, $v1, 8
  /* 16918C 8018D91C AD780000 */        sw $t8, ($t3) # gDisplayListHead + 0
  /* 169190 8018D920 3739FFFF */       ori $t9, $t9, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 169194 8018D924 35CEF6FB */       ori $t6, $t6, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 169198 8018D928 AC6E0004 */        sw $t6, 4($v1)
  /* 16919C 8018D92C AC790000 */        sw $t9, ($v1)
  /* 1691A0 8018D930 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 1691A4 8018D934 3C0DE200 */       lui $t5, (0xE200001C >> 16) # 3791650844
  /* 1691A8 8018D938 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 1691AC 8018D93C 246F0008 */     addiu $t7, $v1, 8
  /* 1691B0 8018D940 AD6F0000 */        sw $t7, ($t3) # gDisplayListHead + 0
  /* 1691B4 8018D944 35AD001C */       ori $t5, $t5, (0xE200001C & 0xFFFF) # 3791650844
  /* 1691B8 8018D948 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 1691BC 8018D94C AC780004 */        sw $t8, 4($v1)
  /* 1691C0 8018D950 AC6D0000 */        sw $t5, ($v1)
  /* 1691C4 8018D954 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 1691C8 8018D958 3C0F0002 */       lui $t7, (0x28028 >> 16) # 163880
  /* 1691CC 8018D95C 3C0EF61B */       lui $t6, (0xF61B8398 >> 16) # 4128998296
  /* 1691D0 8018D960 24790008 */     addiu $t9, $v1, 8
  /* 1691D4 8018D964 AD790000 */        sw $t9, ($t3) # gDisplayListHead + 0
  /* 1691D8 8018D968 35CE8398 */       ori $t6, $t6, (0xF61B8398 & 0xFFFF) # 4128998296
  /* 1691DC 8018D96C 35EF8028 */       ori $t7, $t7, (0x28028 & 0xFFFF) # 163880
  /* 1691E0 8018D970 AC6F0004 */        sw $t7, 4($v1)
  /* 1691E4 8018D974 AC6E0000 */        sw $t6, ($v1)
  /* 1691E8 8018D978 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 1691EC 8018D97C 3C0E0055 */       lui $t6, (0x552078 >> 16) # 5578872
  /* 1691F0 8018D980 35CE2078 */       ori $t6, $t6, (0x552078 & 0xFFFF) # 5578872
  /* 1691F4 8018D984 24780008 */     addiu $t8, $v1, 8
  /* 1691F8 8018D988 AD780000 */        sw $t8, ($t3) # gDisplayListHead + 0
  /* 1691FC 8018D98C AC600004 */        sw $zero, 4($v1)
  /* 169200 8018D990 AC6C0000 */        sw $t4, ($v1)
  /* 169204 8018D994 8D630000 */        lw $v1, ($t3) # gDisplayListHead + 0
  /* 169208 8018D998 24790008 */     addiu $t9, $v1, 8
  /* 16920C 8018D99C AD790000 */        sw $t9, ($t3) # gDisplayListHead + 0
  /* 169210 8018D9A0 AC6E0004 */        sw $t6, 4($v1)
  /* 169214 8018D9A4 03E00008 */        jr $ra
  /* 169218 8018D9A8 AC6D0000 */        sw $t5, ($v1)

glabel mvOpeningSamusCreatePosedFighterBackground
  /* 16921C 8018D9AC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 169220 8018D9B0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 169224 8018D9B4 00002025 */        or $a0, $zero, $zero
  /* 169228 8018D9B8 00002825 */        or $a1, $zero, $zero
  /* 16922C 8018D9BC 24060013 */     addiu $a2, $zero, 0x13
  /* 169230 8018D9C0 0C00265A */       jal omMakeGObjSPAfter
  /* 169234 8018D9C4 3C078000 */       lui $a3, 0x8000
  /* 169238 8018D9C8 3C058019 */       lui $a1, %hi(mvOpeningSamusRenderPosedFighterBackground)
  /* 16923C 8018D9CC 240EFFFF */     addiu $t6, $zero, -1
  /* 169240 8018D9D0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 169244 8018D9D4 24A5D8B0 */     addiu $a1, $a1, %lo(mvOpeningSamusRenderPosedFighterBackground)
  /* 169248 8018D9D8 00402025 */        or $a0, $v0, $zero
  /* 16924C 8018D9DC 2406001C */     addiu $a2, $zero, 0x1c
  /* 169250 8018D9E0 0C00277D */       jal omAddGObjRenderProc
  /* 169254 8018D9E4 3C078000 */       lui $a3, 0x8000
  /* 169258 8018D9E8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 16925C 8018D9EC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 169260 8018D9F0 03E00008 */        jr $ra
  /* 169264 8018D9F4 00000000 */       nop

glabel mvOpeningSamusAnimatePosedFighter
  /* 169268 8018D9F8 3C038019 */       lui $v1, %hi(gMvOpeningSamusFramesElapsed)
  /* 16926C 8018D9FC 8C63E278 */        lw $v1, %lo(gMvOpeningSamusFramesElapsed)($v1)
  /* 169270 8018DA00 2401000F */     addiu $at, $zero, 0xf
  /* 169274 8018DA04 3C058019 */       lui $a1, 0x8019
  /* 169278 8018DA08 10610009 */       beq $v1, $at, .L8018DA30
  /* 16927C 8018DA0C 00601025 */        or $v0, $v1, $zero
  /* 169280 8018DA10 2401002D */     addiu $at, $zero, 0x2d
  /* 169284 8018DA14 1041000B */       beq $v0, $at, .L8018DA44
  /* 169288 8018DA18 3C058019 */       lui $a1, 0x8019
  /* 16928C 8018DA1C 2401003C */     addiu $at, $zero, 0x3c
  /* 169290 8018DA20 1041000D */       beq $v0, $at, .L8018DA58
  /* 169294 8018DA24 3C058019 */       lui $a1, %hi(gMvOpeningSamusPosedFighterYSpeed)
  /* 169298 8018DA28 1000000F */         b .L8018DA68
  /* 16929C 8018DA2C 24A5E290 */     addiu $a1, $a1, %lo(gMvOpeningSamusPosedFighterYSpeed)
  .L8018DA30:
  /* 1692A0 8018DA30 3C014188 */       lui $at, (0x41880000 >> 16) # 17.0
  /* 1692A4 8018DA34 44812000 */      mtc1 $at, $f4 # 17.0 to cop1
  /* 1692A8 8018DA38 24A5E290 */     addiu $a1, $a1, -0x1d70
  /* 1692AC 8018DA3C 1000000A */         b .L8018DA68
  /* 1692B0 8018DA40 E4A40000 */      swc1 $f4, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  .L8018DA44:
  /* 1692B4 8018DA44 3C014170 */       lui $at, (0x41700000 >> 16) # 15.0
  /* 1692B8 8018DA48 44813000 */      mtc1 $at, $f6 # 15.0 to cop1
  /* 1692BC 8018DA4C 24A5E290 */     addiu $a1, $a1, -0x1d70
  /* 1692C0 8018DA50 10000005 */         b .L8018DA68
  /* 1692C4 8018DA54 E4A60000 */      swc1 $f6, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  .L8018DA58:
  /* 1692C8 8018DA58 44804000 */      mtc1 $zero, $f8
  /* 1692CC 8018DA5C 3C058019 */       lui $a1, %hi(gMvOpeningSamusPosedFighterYSpeed)
  /* 1692D0 8018DA60 24A5E290 */     addiu $a1, $a1, %lo(gMvOpeningSamusPosedFighterYSpeed)
  /* 1692D4 8018DA64 E4A80000 */      swc1 $f8, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  .L8018DA68:
  /* 1692D8 8018DA68 28610010 */      slti $at, $v1, 0x10
  /* 1692DC 8018DA6C 14200007 */      bnez $at, .L8018DA8C
  /* 1692E0 8018DA70 2861002D */      slti $at, $v1, 0x2d
  /* 1692E4 8018DA74 10200005 */      beqz $at, .L8018DA8C
  /* 1692E8 8018DA78 3C018019 */       lui $at, %hi(D_ovl38_8018E260)
  /* 1692EC 8018DA7C C430E260 */      lwc1 $f16, %lo(D_ovl38_8018E260)($at)
  /* 1692F0 8018DA80 C4AA0000 */      lwc1 $f10, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  /* 1692F4 8018DA84 46105480 */     add.s $f18, $f10, $f16
  /* 1692F8 8018DA88 E4B20000 */      swc1 $f18, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  .L8018DA8C:
  /* 1692FC 8018DA8C 2861002E */      slti $at, $v1, 0x2e
  /* 169300 8018DA90 14200007 */      bnez $at, .L8018DAB0
  /* 169304 8018DA94 2861003C */      slti $at, $v1, 0x3c
  /* 169308 8018DA98 10200005 */      beqz $at, .L8018DAB0
  /* 16930C 8018DA9C 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 169310 8018DAA0 44813000 */      mtc1 $at, $f6 # -1.0 to cop1
  /* 169314 8018DAA4 C4A40000 */      lwc1 $f4, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  /* 169318 8018DAA8 46062200 */     add.s $f8, $f4, $f6
  /* 16931C 8018DAAC E4A80000 */      swc1 $f8, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  .L8018DAB0:
  /* 169320 8018DAB0 8C820074 */        lw $v0, 0x74($a0)
  /* 169324 8018DAB4 C4B00000 */      lwc1 $f16, ($a1) # gMvOpeningSamusPosedFighterYSpeed + 0
  /* 169328 8018DAB8 C44A0020 */      lwc1 $f10, 0x20($v0)
  /* 16932C 8018DABC 46105481 */     sub.s $f18, $f10, $f16
  /* 169330 8018DAC0 03E00008 */        jr $ra
  /* 169334 8018DAC4 E4520020 */      swc1 $f18, 0x20($v0)

glabel mvOpeningSamusCreatePosedFighter
  /* 169338 8018DAC8 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 16933C 8018DACC AFB00018 */        sw $s0, 0x18($sp)
  /* 169340 8018DAD0 3C0E8011 */       lui $t6, %hi(dFTDefaultFighterDesc)
  /* 169344 8018DAD4 27B00024 */     addiu $s0, $sp, 0x24
  /* 169348 8018DAD8 25CE6DD0 */     addiu $t6, $t6, %lo(dFTDefaultFighterDesc)
  /* 16934C 8018DADC AFBF001C */        sw $ra, 0x1c($sp)
  /* 169350 8018DAE0 25C8003C */     addiu $t0, $t6, 0x3c
  /* 169354 8018DAE4 0200C825 */        or $t9, $s0, $zero
  .L8018DAE8:
  /* 169358 8018DAE8 8DD80000 */        lw $t8, ($t6) # dFTDefaultFighterDesc + 0
  /* 16935C 8018DAEC 25CE000C */     addiu $t6, $t6, 0xc
  /* 169360 8018DAF0 2739000C */     addiu $t9, $t9, 0xc
  /* 169364 8018DAF4 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 169368 8018DAF8 8DCFFFF8 */        lw $t7, -8($t6) # dFTDefaultFighterDesc + -8
  /* 16936C 8018DAFC AF2FFFF8 */        sw $t7, -8($t9)
  /* 169370 8018DB00 8DD8FFFC */        lw $t8, -4($t6) # dFTDefaultFighterDesc + -4
  /* 169374 8018DB04 15C8FFF8 */       bne $t6, $t0, .L8018DAE8
  /* 169378 8018DB08 AF38FFFC */        sw $t8, -4($t9)
  /* 16937C 8018DB0C 8DD80000 */        lw $t8, ($t6) # dFTDefaultFighterDesc + 0
  /* 169380 8018DB10 24090003 */     addiu $t1, $zero, 3
  /* 169384 8018DB14 24040003 */     addiu $a0, $zero, 3
  /* 169388 8018DB18 AF380000 */        sw $t8, ($t9)
  /* 16938C 8018DB1C AFA90024 */        sw $t1, 0x24($sp)
  /* 169390 8018DB20 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 169394 8018DB24 00002825 */        or $a1, $zero, $zero
  /* 169398 8018DB28 44800000 */      mtc1 $zero, $f0
  /* 16939C 8018DB2C 3C0A8019 */       lui $t2, %hi(gMvOpeningSamusAnimHeap)
  /* 1693A0 8018DB30 3C014416 */       lui $at, (0x44160000 >> 16) # 600.0
  /* 1693A4 8018DB34 8D4AE28C */        lw $t2, %lo(gMvOpeningSamusAnimHeap)($t2)
  /* 1693A8 8018DB38 44812000 */      mtc1 $at, $f4 # 600.0 to cop1
  /* 1693AC 8018DB3C A3A2003B */        sb $v0, 0x3b($sp)
  /* 1693B0 8018DB40 02002025 */        or $a0, $s0, $zero
  /* 1693B4 8018DB44 E7A00028 */      swc1 $f0, 0x28($sp)
  /* 1693B8 8018DB48 E7A00030 */      swc1 $f0, 0x30($sp)
  /* 1693BC 8018DB4C AFAA005C */        sw $t2, 0x5c($sp)
  /* 1693C0 8018DB50 0C035FCF */       jal ftManagerMakeFighter
  /* 1693C4 8018DB54 E7A4002C */      swc1 $f4, 0x2c($sp)
  /* 1693C8 8018DB58 3C050001 */       lui $a1, (0x1000C >> 16) # 65548
  /* 1693CC 8018DB5C 00408025 */        or $s0, $v0, $zero
  /* 1693D0 8018DB60 34A5000C */       ori $a1, $a1, (0x1000C & 0xFFFF) # 65548
  /* 1693D4 8018DB64 0C0E4173 */       jal func_ovl1_803905CC
  /* 1693D8 8018DB68 00402025 */        or $a0, $v0, $zero
  /* 1693DC 8018DB6C 02002025 */        or $a0, $s0, $zero
  /* 1693E0 8018DB70 2405001A */     addiu $a1, $zero, 0x1a
  /* 1693E4 8018DB74 0C002834 */       jal omMoveGObjDL
  /* 1693E8 8018DB78 2406FFFF */     addiu $a2, $zero, -1
  /* 1693EC 8018DB7C 3C058019 */       lui $a1, %hi(mvOpeningSamusAnimatePosedFighter)
  /* 1693F0 8018DB80 24A5D9F8 */     addiu $a1, $a1, %lo(mvOpeningSamusAnimatePosedFighter)
  /* 1693F4 8018DB84 02002025 */        or $a0, $s0, $zero
  /* 1693F8 8018DB88 24060001 */     addiu $a2, $zero, 1
  /* 1693FC 8018DB8C 0C002062 */       jal omAddGObjCommonProc
  /* 169400 8018DB90 24070001 */     addiu $a3, $zero, 1
  /* 169404 8018DB94 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 169408 8018DB98 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 16940C 8018DB9C 8E0B0074 */        lw $t3, 0x74($s0)
  /* 169410 8018DBA0 E5600040 */      swc1 $f0, 0x40($t3)
  /* 169414 8018DBA4 8E0C0074 */        lw $t4, 0x74($s0)
  /* 169418 8018DBA8 E5800044 */      swc1 $f0, 0x44($t4)
  /* 16941C 8018DBAC 8E0D0074 */        lw $t5, 0x74($s0)
  /* 169420 8018DBB0 E5A00048 */      swc1 $f0, 0x48($t5)
  /* 169424 8018DBB4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 169428 8018DBB8 8FB00018 */        lw $s0, 0x18($sp)
  /* 16942C 8018DBBC 27BD0068 */     addiu $sp, $sp, 0x68
  /* 169430 8018DBC0 03E00008 */        jr $ra
  /* 169434 8018DBC4 00000000 */       nop

glabel mvOpeningSamusCreateNameViewport
  /* 169438 8018DBC8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 16943C 8018DBCC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 169440 8018DBD0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 169444 8018DBD4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 169448 8018DBD8 240F0050 */     addiu $t7, $zero, 0x50
  /* 16944C 8018DBDC 24180000 */     addiu $t8, $zero, 0
  /* 169450 8018DBE0 3C190800 */       lui $t9, 0x800
  /* 169454 8018DBE4 2408FFFF */     addiu $t0, $zero, -1
  /* 169458 8018DBE8 24090001 */     addiu $t1, $zero, 1
  /* 16945C 8018DBEC 240A0001 */     addiu $t2, $zero, 1
  /* 169460 8018DBF0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 169464 8018DBF4 AFA90028 */        sw $t1, 0x28($sp)
  /* 169468 8018DBF8 AFA80020 */        sw $t0, 0x20($sp)
  /* 16946C 8018DBFC AFB9001C */        sw $t9, 0x1c($sp)
  /* 169470 8018DC00 AFB80018 */        sw $t8, 0x18($sp)
  /* 169474 8018DC04 AFAF0014 */        sw $t7, 0x14($sp)
  /* 169478 8018DC08 AFAE0010 */        sw $t6, 0x10($sp)
  /* 16947C 8018DC0C AFA00024 */        sw $zero, 0x24($sp)
  /* 169480 8018DC10 AFA0002C */        sw $zero, 0x2c($sp)
  /* 169484 8018DC14 AFA00034 */        sw $zero, 0x34($sp)
  /* 169488 8018DC18 24040401 */     addiu $a0, $zero, 0x401
  /* 16948C 8018DC1C 00002825 */        or $a1, $zero, $zero
  /* 169490 8018DC20 24060010 */     addiu $a2, $zero, 0x10
  /* 169494 8018DC24 0C002E4F */       jal func_8000B93C
  /* 169498 8018DC28 3C078000 */       lui $a3, 0x8000
  /* 16949C 8018DC2C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1694A0 8018DC30 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1694A4 8018DC34 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1694A8 8018DC38 8C430074 */        lw $v1, 0x74($v0)
  /* 1694AC 8018DC3C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1694B0 8018DC40 44050000 */      mfc1 $a1, $f0
  /* 1694B4 8018DC44 44060000 */      mfc1 $a2, $f0
  /* 1694B8 8018DC48 3C07439B */       lui $a3, 0x439b
  /* 1694BC 8018DC4C 24640008 */     addiu $a0, $v1, 8
  /* 1694C0 8018DC50 0C001C20 */       jal func_80007080
  /* 1694C4 8018DC54 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1694C8 8018DC58 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1694CC 8018DC5C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1694D0 8018DC60 03E00008 */        jr $ra
  /* 1694D4 8018DC64 00000000 */       nop

glabel mvOpeningSamusCreatePosedFighterViewport
  /* 1694D8 8018DC68 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 1694DC 8018DC6C 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 1694E0 8018DC70 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1694E4 8018DC74 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 1694E8 8018DC78 240F000A */     addiu $t7, $zero, 0xa
  /* 1694EC 8018DC7C 24180000 */     addiu $t8, $zero, 0
  /* 1694F0 8018DC80 3C190400 */       lui $t9, 0x400
  /* 1694F4 8018DC84 2408FFFF */     addiu $t0, $zero, -1
  /* 1694F8 8018DC88 24090001 */     addiu $t1, $zero, 1
  /* 1694FC 8018DC8C 240A0001 */     addiu $t2, $zero, 1
  /* 169500 8018DC90 240B0001 */     addiu $t3, $zero, 1
  /* 169504 8018DC94 AFAB0030 */        sw $t3, 0x30($sp)
  /* 169508 8018DC98 AFAA0028 */        sw $t2, 0x28($sp)
  /* 16950C 8018DC9C AFA90024 */        sw $t1, 0x24($sp)
  /* 169510 8018DCA0 AFA80020 */        sw $t0, 0x20($sp)
  /* 169514 8018DCA4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 169518 8018DCA8 AFB80018 */        sw $t8, 0x18($sp)
  /* 16951C 8018DCAC AFAF0014 */        sw $t7, 0x14($sp)
  /* 169520 8018DCB0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 169524 8018DCB4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 169528 8018DCB8 AFA00034 */        sw $zero, 0x34($sp)
  /* 16952C 8018DCBC 24040401 */     addiu $a0, $zero, 0x401
  /* 169530 8018DCC0 00002825 */        or $a1, $zero, $zero
  /* 169534 8018DCC4 24060010 */     addiu $a2, $zero, 0x10
  /* 169538 8018DCC8 0C002E4F */       jal func_8000B93C
  /* 16953C 8018DCCC 3C078000 */       lui $a3, 0x8000
  /* 169540 8018DCD0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 169544 8018DCD4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 169548 8018DCD8 AFA20044 */        sw $v0, 0x44($sp)
  /* 16954C 8018DCDC 8C430074 */        lw $v1, 0x74($v0)
  /* 169550 8018DCE0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 169554 8018DCE4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 169558 8018DCE8 44050000 */      mfc1 $a1, $f0
  /* 16955C 8018DCEC 44060000 */      mfc1 $a2, $f0
  /* 169560 8018DCF0 3C0742DC */       lui $a3, 0x42dc
  /* 169564 8018DCF4 24640008 */     addiu $a0, $v1, 8
  /* 169568 8018DCF8 AFA30040 */        sw $v1, 0x40($sp)
  /* 16956C 8018DCFC 0C001C20 */       jal func_80007080
  /* 169570 8018DD00 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 169574 8018DD04 3C018019 */       lui $at, %hi(D_ovl38_8018E264)
  /* 169578 8018DD08 8FA40040 */        lw $a0, 0x40($sp)
  /* 16957C 8018DD0C C426E264 */      lwc1 $f6, %lo(D_ovl38_8018E264)($at)
  /* 169580 8018DD10 3C0C8019 */       lui $t4, %hi(D_ovl38_8018E494)
  /* 169584 8018DD14 3C0D0000 */       lui $t5, %hi(D_NF_00000060)
  /* 169588 8018DD18 E4860024 */      swc1 $f6, 0x24($a0)
  /* 16958C 8018DD1C 8D8CE494 */        lw $t4, %lo(D_ovl38_8018E494)($t4)
  /* 169590 8018DD20 25AD0060 */     addiu $t5, $t5, %lo(D_NF_00000060)
  /* 169594 8018DD24 24060000 */     addiu $a2, $zero, 0
  /* 169598 8018DD28 0C003E8F */       jal func_8000FA3C
  /* 16959C 8018DD2C 018D2821 */      addu $a1, $t4, $t5
  /* 1695A0 8018DD30 3C058001 */       lui $a1, %hi(func_80010580)
  /* 1695A4 8018DD34 24A50580 */     addiu $a1, $a1, %lo(func_80010580)
  /* 1695A8 8018DD38 8FA40044 */        lw $a0, 0x44($sp)
  /* 1695AC 8018DD3C 24060001 */     addiu $a2, $zero, 1
  /* 1695B0 8018DD40 0C002062 */       jal omAddGObjCommonProc
  /* 1695B4 8018DD44 24070001 */     addiu $a3, $zero, 1
  /* 1695B8 8018DD48 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1695BC 8018DD4C 27BD0048 */     addiu $sp, $sp, 0x48
  /* 1695C0 8018DD50 03E00008 */        jr $ra
  /* 1695C4 8018DD54 00000000 */       nop

glabel mvOpeningSamusCreatePosedFighterBackgroundViewport
  /* 1695C8 8018DD58 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 1695CC 8018DD5C 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 1695D0 8018DD60 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1695D4 8018DD64 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 1695D8 8018DD68 240F0014 */     addiu $t7, $zero, 0x14
  /* 1695DC 8018DD6C 24180000 */     addiu $t8, $zero, 0
  /* 1695E0 8018DD70 3C191000 */       lui $t9, 0x1000
  /* 1695E4 8018DD74 2408FFFF */     addiu $t0, $zero, -1
  /* 1695E8 8018DD78 24090001 */     addiu $t1, $zero, 1
  /* 1695EC 8018DD7C 240A0001 */     addiu $t2, $zero, 1
  /* 1695F0 8018DD80 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1695F4 8018DD84 AFA90028 */        sw $t1, 0x28($sp)
  /* 1695F8 8018DD88 AFA80020 */        sw $t0, 0x20($sp)
  /* 1695FC 8018DD8C AFB9001C */        sw $t9, 0x1c($sp)
  /* 169600 8018DD90 AFB80018 */        sw $t8, 0x18($sp)
  /* 169604 8018DD94 AFAF0014 */        sw $t7, 0x14($sp)
  /* 169608 8018DD98 AFAE0010 */        sw $t6, 0x10($sp)
  /* 16960C 8018DD9C AFA00024 */        sw $zero, 0x24($sp)
  /* 169610 8018DDA0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 169614 8018DDA4 AFA00034 */        sw $zero, 0x34($sp)
  /* 169618 8018DDA8 24040401 */     addiu $a0, $zero, 0x401
  /* 16961C 8018DDAC 00002825 */        or $a1, $zero, $zero
  /* 169620 8018DDB0 24060010 */     addiu $a2, $zero, 0x10
  /* 169624 8018DDB4 0C002E4F */       jal func_8000B93C
  /* 169628 8018DDB8 3C078000 */       lui $a3, 0x8000
  /* 16962C 8018DDBC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 169630 8018DDC0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 169634 8018DDC4 8C430074 */        lw $v1, 0x74($v0)
  /* 169638 8018DDC8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 16963C 8018DDCC 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 169640 8018DDD0 44050000 */      mfc1 $a1, $f0
  /* 169644 8018DDD4 44060000 */      mfc1 $a2, $f0
  /* 169648 8018DDD8 3C0742DC */       lui $a3, 0x42dc
  /* 16964C 8018DDDC 24640008 */     addiu $a0, $v1, 8
  /* 169650 8018DDE0 AFA30044 */        sw $v1, 0x44($sp)
  /* 169654 8018DDE4 0C001C20 */       jal func_80007080
  /* 169658 8018DDE8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 16965C 8018DDEC 8FA30044 */        lw $v1, 0x44($sp)
  /* 169660 8018DDF0 240B0005 */     addiu $t3, $zero, 5
  /* 169664 8018DDF4 AC6B0080 */        sw $t3, 0x80($v1)
  /* 169668 8018DDF8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 16966C 8018DDFC 27BD0048 */     addiu $sp, $sp, 0x48
  /* 169670 8018DE00 03E00008 */        jr $ra
  /* 169674 8018DE04 00000000 */       nop

glabel mvOpeningSamusMainProc
  /* 169678 8018DE08 3C028019 */       lui $v0, %hi(gMvOpeningSamusFramesElapsed)
  /* 16967C 8018DE0C 2442E278 */     addiu $v0, $v0, %lo(gMvOpeningSamusFramesElapsed)
  /* 169680 8018DE10 8C4E0000 */        lw $t6, ($v0) # gMvOpeningSamusFramesElapsed + 0
  /* 169684 8018DE14 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 169688 8018DE18 AFBF0014 */        sw $ra, 0x14($sp)
  /* 16968C 8018DE1C AFA40018 */        sw $a0, 0x18($sp)
  /* 169690 8018DE20 25CF0001 */     addiu $t7, $t6, 1
  /* 169694 8018DE24 AC4F0000 */        sw $t7, ($v0) # gMvOpeningSamusFramesElapsed + 0
  /* 169698 8018DE28 0C0E41DB */       jal func_ovl1_8039076C
  /* 16969C 8018DE2C 3404D000 */       ori $a0, $zero, 0xd000
  /* 1696A0 8018DE30 10400007 */      beqz $v0, .L8018DE50
  /* 1696A4 8018DE34 24190001 */     addiu $t9, $zero, 1
  /* 1696A8 8018DE38 3C02800A */       lui $v0, %hi(gSceneData)
  /* 1696AC 8018DE3C 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 1696B0 8018DE40 90580000 */       lbu $t8, ($v0) # gSceneData + 0
  /* 1696B4 8018DE44 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 1696B8 8018DE48 0C00171D */       jal func_80005C74
  /* 1696BC 8018DE4C A0580001 */        sb $t8, 1($v0) # gSceneData + 1
  .L8018DE50:
  /* 1696C0 8018DE50 3C028019 */       lui $v0, %hi(gMvOpeningSamusFramesElapsed)
  /* 1696C4 8018DE54 8C42E278 */        lw $v0, %lo(gMvOpeningSamusFramesElapsed)($v0)
  /* 1696C8 8018DE58 2401000F */     addiu $at, $zero, 0xf
  /* 1696CC 8018DE5C 3C048019 */       lui $a0, %hi(gMvOpeningSamusNameGObj)
  /* 1696D0 8018DE60 5441000C */      bnel $v0, $at, .L8018DE94
  /* 1696D4 8018DE64 2401003C */     addiu $at, $zero, 0x3c
  /* 1696D8 8018DE68 0C0026A1 */       jal omEjectGObj
  /* 1696DC 8018DE6C 8C84E27C */        lw $a0, %lo(gMvOpeningSamusNameGObj)($a0)
  /* 1696E0 8018DE70 0C063585 */       jal mvOpeningSamusInitFighterStagePanel
  /* 1696E4 8018DE74 00000000 */       nop
  /* 1696E8 8018DE78 0C06366B */       jal mvOpeningSamusCreatePosedFighterBackground
  /* 1696EC 8018DE7C 00000000 */       nop
  /* 1696F0 8018DE80 0C0636B2 */       jal mvOpeningSamusCreatePosedFighter
  /* 1696F4 8018DE84 00000000 */       nop
  /* 1696F8 8018DE88 3C028019 */       lui $v0, %hi(gMvOpeningSamusFramesElapsed)
  /* 1696FC 8018DE8C 8C42E278 */        lw $v0, %lo(gMvOpeningSamusFramesElapsed)($v0)
  /* 169700 8018DE90 2401003C */     addiu $at, $zero, 0x3c
  .L8018DE94:
  /* 169704 8018DE94 14410007 */       bne $v0, $at, .L8018DEB4
  /* 169708 8018DE98 24090023 */     addiu $t1, $zero, 0x23
  /* 16970C 8018DE9C 3C02800A */       lui $v0, %hi(gSceneData)
  /* 169710 8018DEA0 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 169714 8018DEA4 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 169718 8018DEA8 A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 16971C 8018DEAC 0C00171D */       jal func_80005C74
  /* 169720 8018DEB0 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  .L8018DEB4:
  /* 169724 8018DEB4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 169728 8018DEB8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 16972C 8018DEBC 03E00008 */        jr $ra
  /* 169730 8018DEC0 00000000 */       nop

glabel mvOpeningSamusInitFramesElapsed
  /* 169734 8018DEC4 3C018019 */       lui $at, %hi(gMvOpeningSamusFramesElapsed)
  /* 169738 8018DEC8 03E00008 */        jr $ra
  /* 16973C 8018DECC AC20E278 */        sw $zero, %lo(gMvOpeningSamusFramesElapsed)($at)

glabel mvOpeningSamusInit
  /* 169740 8018DED0 3C038019 */       lui $v1, %hi(gMvOpeningSamusBattleState)
  /* 169744 8018DED4 3C0E800A */       lui $t6, %hi(gDefaultBattleState)
  /* 169748 8018DED8 2463E498 */     addiu $v1, $v1, %lo(gMvOpeningSamusBattleState)
  /* 16974C 8018DEDC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 169750 8018DEE0 3C02800A */       lui $v0, %hi(gBattleState)
  /* 169754 8018DEE4 25CE3FC8 */     addiu $t6, $t6, %lo(gDefaultBattleState)
  /* 169758 8018DEE8 244250E8 */     addiu $v0, $v0, %lo(gBattleState)
  /* 16975C 8018DEEC AFBF001C */        sw $ra, 0x1c($sp)
  /* 169760 8018DEF0 24040004 */     addiu $a0, $zero, 4
  /* 169764 8018DEF4 24050003 */     addiu $a1, $zero, 3
  /* 169768 8018DEF8 25C801EC */     addiu $t0, $t6, 0x1ec
  /* 16976C 8018DEFC 0060C825 */        or $t9, $v1, $zero
  .L8018DF00:
  /* 169770 8018DF00 8DD80000 */        lw $t8, ($t6) # gDefaultBattleState + 0
  /* 169774 8018DF04 25CE000C */     addiu $t6, $t6, 0xc
  /* 169778 8018DF08 2739000C */     addiu $t9, $t9, 0xc
  /* 16977C 8018DF0C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 169780 8018DF10 8DCFFFF8 */        lw $t7, -8($t6) # gDefaultBattleState + -8
  /* 169784 8018DF14 AF2FFFF8 */        sw $t7, -8($t9)
  /* 169788 8018DF18 8DD8FFFC */        lw $t8, -4($t6) # gDefaultBattleState + -4
  /* 16978C 8018DF1C 15C8FFF8 */       bne $t6, $t0, .L8018DF00
  /* 169790 8018DF20 AF38FFFC */        sw $t8, -4($t9)
  /* 169794 8018DF24 8DD80000 */        lw $t8, ($t6) # gDefaultBattleState + 0
  /* 169798 8018DF28 240B0001 */     addiu $t3, $zero, 1
  /* 16979C 8018DF2C AF380000 */        sw $t8, ($t9)
  /* 1697A0 8018DF30 AC430000 */        sw $v1, ($v0) # gBattleState + 0
  /* 1697A4 8018DF34 A0640000 */        sb $a0, ($v1) # gMvOpeningSamusBattleState + 0
  /* 1697A8 8018DF38 A0650001 */        sb $a1, 1($v1) # gMvOpeningSamusBattleState + 1
  /* 1697AC 8018DF3C A06B0004 */        sb $t3, 4($v1) # gMvOpeningSamusBattleState + 4
  /* 1697B0 8018DF40 A0650023 */        sb $a1, 0x23($v1) # gMvOpeningSamusBattleState + 35
  /* 1697B4 8018DF44 0C063430 */       jal mvOpeningSamusLoadFiles
  /* 1697B8 8018DF48 A0640022 */        sb $a0, 0x22($v1) # gMvOpeningSamusBattleState + 34
  /* 1697BC 8018DF4C 3C058019 */       lui $a1, %hi(mvOpeningSamusMainProc)
  /* 1697C0 8018DF50 24A5DE08 */     addiu $a1, $a1, %lo(mvOpeningSamusMainProc)
  /* 1697C4 8018DF54 240403F7 */     addiu $a0, $zero, 0x3f7
  /* 1697C8 8018DF58 2406000D */     addiu $a2, $zero, 0xd
  /* 1697CC 8018DF5C 0C00265A */       jal omMakeGObjSPAfter
  /* 1697D0 8018DF60 3C078000 */       lui $a3, 0x8000
  /* 1697D4 8018DF64 240E00FF */     addiu $t6, $zero, 0xff
  /* 1697D8 8018DF68 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1697DC 8018DF6C 24040009 */     addiu $a0, $zero, 9
  /* 1697E0 8018DF70 3C058000 */       lui $a1, 0x8000
  /* 1697E4 8018DF74 24060064 */     addiu $a2, $zero, 0x64
  /* 1697E8 8018DF78 0C002E7F */       jal func_8000B9FC
  /* 1697EC 8018DF7C 24070003 */     addiu $a3, $zero, 3
  /* 1697F0 8018DF80 0C0637B1 */       jal mvOpeningSamusInitFramesElapsed
  /* 1697F4 8018DF84 00000000 */       nop
  /* 1697F8 8018DF88 0C045624 */       jal func_ovl2_80115890
  /* 1697FC 8018DF8C 00000000 */       nop
  /* 169800 8018DF90 0C03B04C */       jal func_ovl2_800EC130
  /* 169804 8018DF94 00000000 */       nop
  /* 169808 8018DF98 0C03F0A1 */       jal mpCollision_InitMapCollisionData
  /* 16980C 8018DF9C 00000000 */       nop
  /* 169810 8018DFA0 2404000A */     addiu $a0, $zero, 0xa
  /* 169814 8018DFA4 2405000A */     addiu $a1, $zero, 0xa
  /* 169818 8018DFA8 24060136 */     addiu $a2, $zero, 0x136
  /* 16981C 8018DFAC 0C043966 */       jal cmManager_SetViewportCoordinates
  /* 169820 8018DFB0 240700E6 */     addiu $a3, $zero, 0xe6
  /* 169824 8018DFB4 0C0436D5 */       jal cmManager_MakeWallpaperCamera
  /* 169828 8018DFB8 00000000 */       nop
  /* 16982C 8018DFBC 24040003 */     addiu $a0, $zero, 3
  /* 169830 8018DFC0 0C035C65 */       jal ftManagerAllocFighter
  /* 169834 8018DFC4 24050002 */     addiu $a1, $zero, 2
  /* 169838 8018DFC8 0C05952C */       jal func_NF_801654B0 # couldn't be resolved
  /* 16983C 8018DFCC 00000000 */       nop
  /* 169840 8018DFD0 0C05B7A8 */       jal func_NF_8016DEA0 # couldn't be resolved
  /* 169844 8018DFD4 00000000 */       nop
  /* 169848 8018DFD8 0C03F4C0 */       jal efManager_AllocUserData
  /* 16984C 8018DFDC 00000000 */       nop
  /* 169850 8018DFE0 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 169854 8018DFE4 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 169858 8018DFE8 241900FF */     addiu $t9, $zero, 0xff
  /* 16985C 8018DFEC 240F00FF */     addiu $t7, $zero, 0xff
  /* 169860 8018DFF0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 169864 8018DFF4 AFB90010 */        sw $t9, 0x10($sp)
  /* 169868 8018DFF8 240600FF */     addiu $a2, $zero, 0xff
  /* 16986C 8018DFFC 240700FF */     addiu $a3, $zero, 0xff
  /* 169870 8018E000 0C0E4138 */       jal func_ovl1_803904E0
  /* 169874 8018E004 46006386 */     mov.s $f14, $f12
  /* 169878 8018E008 0C035E1B */       jal ftManagerSetupDataKind
  /* 16987C 8018E00C 24040003 */     addiu $a0, $zero, 3
  /* 169880 8018E010 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 169884 8018E014 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 169888 8018E018 0C001260 */       jal gsMemoryAlloc
  /* 16988C 8018E01C 24050010 */     addiu $a1, $zero, 0x10
  /* 169890 8018E020 3C018019 */       lui $at, %hi(gMvOpeningSamusAnimHeap)
  /* 169894 8018E024 0C0636F2 */       jal mvOpeningSamusCreateNameViewport
  /* 169898 8018E028 AC22E28C */        sw $v0, %lo(gMvOpeningSamusAnimHeap)($at)
  /* 16989C 8018E02C 0C063756 */       jal mvOpeningSamusCreatePosedFighterBackgroundViewport
  /* 1698A0 8018E030 00000000 */       nop
  /* 1698A4 8018E034 0C06371A */       jal mvOpeningSamusCreatePosedFighterViewport
  /* 1698A8 8018E038 00000000 */       nop
  /* 1698AC 8018E03C 0C063465 */       jal mvOpeningSamusDrawName
  /* 1698B0 8018E040 00000000 */       nop
  /* 1698B4 8018E044 0C00024B */       jal func_8000092C
  /* 1698B8 8018E048 00000000 */       nop
  /* 1698BC 8018E04C 2C4106F9 */     sltiu $at, $v0, 0x6f9
  /* 1698C0 8018E050 50200007 */      beql $at, $zero, .L8018E070
  /* 1698C4 8018E054 8FBF001C */        lw $ra, 0x1c($sp)
  .L8018E058:
  /* 1698C8 8018E058 0C00024B */       jal func_8000092C
  /* 1698CC 8018E05C 00000000 */       nop
  /* 1698D0 8018E060 2C4106F9 */     sltiu $at, $v0, 0x6f9
  /* 1698D4 8018E064 1420FFFC */      bnez $at, .L8018E058
  /* 1698D8 8018E068 00000000 */       nop
  /* 1698DC 8018E06C 8FBF001C */        lw $ra, 0x1c($sp)
  .L8018E070:
  /* 1698E0 8018E070 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1698E4 8018E074 03E00008 */        jr $ra
  /* 1698E8 8018E078 00000000 */       nop

glabel mvOpeningSamusSetupDisplayList
  /* 1698EC 8018E07C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1698F0 8018E080 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1698F4 8018E084 8C830000 */        lw $v1, ($a0)
  /* 1698F8 8018E088 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 1698FC 8018E08C 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 169900 8018E090 246E0008 */     addiu $t6, $v1, 8
  /* 169904 8018E094 AC8E0000 */        sw $t6, ($a0)
  /* 169908 8018E098 3C180002 */       lui $t8, 2
  /* 16990C 8018E09C 3C058013 */       lui $a1, %hi(gMPLightAngleX)
  /* 169910 8018E0A0 3C068013 */       lui $a2, %hi(gMPLightAngleY)
  /* 169914 8018E0A4 AC780004 */        sw $t8, 4($v1)
  /* 169918 8018E0A8 AC6F0000 */        sw $t7, ($v1)
  /* 16991C 8018E0AC 8CC61394 */        lw $a2, %lo(gMPLightAngleY)($a2)
  /* 169920 8018E0B0 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 169924 8018E0B4 8CA51390 */        lw $a1, %lo(gMPLightAngleX)($a1)
  /* 169928 8018E0B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 16992C 8018E0BC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 169930 8018E0C0 03E00008 */        jr $ra
  /* 169934 8018E0C4 00000000 */       nop

glabel intro_focus_samus_entry
  /* 169938 8018E0C8 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 16993C 8018E0CC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 169940 8018E0D0 3C048019 */       lui $a0, %hi(D_ovl38_8018E198)
  /* 169944 8018E0D4 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 169948 8018E0D8 2484E198 */     addiu $a0, $a0, %lo(D_ovl38_8018E198)
  /* 16994C 8018E0DC AFBF0014 */        sw $ra, 0x14($sp)
  /* 169950 8018E0E0 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 169954 8018E0E4 0C001C09 */       jal func_80007024
  /* 169958 8018E0E8 AC8F000C */        sw $t7, 0xc($a0) # D_ovl38_8018E198 + 12
  /* 16995C 8018E0EC 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 169960 8018E0F0 3C198019 */       lui $t9, %hi(D_NF_8018E690)
  /* 169964 8018E0F4 3C048019 */       lui $a0, %hi(D_ovl38_8018E1B4)
  /* 169968 8018E0F8 2739E690 */     addiu $t9, $t9, %lo(D_NF_8018E690)
  /* 16996C 8018E0FC 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 169970 8018E100 2484E1B4 */     addiu $a0, $a0, %lo(D_ovl38_8018E1B4)
  /* 169974 8018E104 03194023 */      subu $t0, $t8, $t9
  /* 169978 8018E108 0C001A0F */       jal gsGTLSceneInit
  /* 16997C 8018E10C AC880010 */        sw $t0, 0x10($a0) # D_ovl38_8018E1B4 + 16
  /* 169980 8018E110 8FBF0014 */        lw $ra, 0x14($sp)
  /* 169984 8018E114 27BD0018 */     addiu $sp, $sp, 0x18
  /* 169988 8018E118 03E00008 */        jr $ra
  /* 16998C 8018E11C 00000000 */       nop
