.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x801328D0

glabel mvOpeningMarioVsKirbySetupDisplayList
  /* 171320 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 171324 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 171328 80131B08 8C830000 */        lw $v1, ($a0)
  /* 17132C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 171330 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 171334 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 171338 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 17133C 80131B1C 3C180002 */       lui $t8, 2
  /* 171340 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 171344 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 171348 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 17134C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 171350 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 171354 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 171358 80131B38 44060000 */      mfc1 $a2, $f0
  /* 17135C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 171360 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 171364 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 171368 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 17136C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 171370 80131B50 03E00008 */        jr $ra
  /* 171374 80131B54 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateStageGeometry
  /* 171378 80131B58 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 17137C 80131B5C AFBF0024 */        sw $ra, 0x24($sp)
  /* 171380 80131B60 AFB00020 */        sw $s0, 0x20($sp)
  /* 171384 80131B64 00002025 */        or $a0, $zero, $zero
  /* 171388 80131B68 00002825 */        or $a1, $zero, $zero
  /* 17138C 80131B6C 24060011 */     addiu $a2, $zero, 0x11
  /* 171390 80131B70 0C00265A */       jal omMakeGObjSPAfter
  /* 171394 80131B74 3C078000 */       lui $a3, 0x8000
  /* 171398 80131B78 3C0E8013 */       lui $t6, %hi(D_ovl47_80132B98)
  /* 17139C 80131B7C 8DCE2B98 */        lw $t6, %lo(D_ovl47_80132B98)($t6)
  /* 1713A0 80131B80 3C0F0000 */       lui $t7, %hi(D_NF_00001C10)
  /* 1713A4 80131B84 25EF1C10 */     addiu $t7, $t7, %lo(D_NF_00001C10)
  /* 1713A8 80131B88 00408025 */        or $s0, $v0, $zero
  /* 1713AC 80131B8C 00402025 */        or $a0, $v0, $zero
  /* 1713B0 80131B90 0C0024B4 */       jal omAddDObjForGObj
  /* 1713B4 80131B94 01CF2821 */      addu $a1, $t6, $t7
  /* 1713B8 80131B98 8E040074 */        lw $a0, 0x74($s0)
  /* 1713BC 80131B9C 2405001C */     addiu $a1, $zero, 0x1c
  /* 1713C0 80131BA0 0C002330 */       jal omAddOMMtxForDObjFixed
  /* 1713C4 80131BA4 00003025 */        or $a2, $zero, $zero
  /* 1713C8 80131BA8 3C058001 */       lui $a1, %hi(odRenderDObjDLHead0)
  /* 1713CC 80131BAC 2418FFFF */     addiu $t8, $zero, -1
  /* 1713D0 80131BB0 AFB80010 */        sw $t8, 0x10($sp)
  /* 1713D4 80131BB4 24A53E68 */     addiu $a1, $a1, %lo(odRenderDObjDLHead0)
  /* 1713D8 80131BB8 02002025 */        or $a0, $s0, $zero
  /* 1713DC 80131BBC 2406001A */     addiu $a2, $zero, 0x1a
  /* 1713E0 80131BC0 0C00277D */       jal omAddGObjRenderProc
  /* 1713E4 80131BC4 3C078000 */       lui $a3, 0x8000
  /* 1713E8 80131BC8 44800000 */      mtc1 $zero, $f0
  /* 1713EC 80131BCC 8E190074 */        lw $t9, 0x74($s0)
  /* 1713F0 80131BD0 E720001C */      swc1 $f0, 0x1c($t9)
  /* 1713F4 80131BD4 8E080074 */        lw $t0, 0x74($s0)
  /* 1713F8 80131BD8 E5000020 */      swc1 $f0, 0x20($t0)
  /* 1713FC 80131BDC 8E090074 */        lw $t1, 0x74($s0)
  /* 171400 80131BE0 E5200024 */      swc1 $f0, 0x24($t1)
  /* 171404 80131BE4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 171408 80131BE8 8FB00020 */        lw $s0, 0x20($sp)
  /* 17140C 80131BEC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 171410 80131BF0 03E00008 */        jr $ra
  /* 171414 80131BF4 00000000 */       nop

  /* 171418 80131BF8 03E00008 */        jr $ra
  /* 17141C 80131BFC 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateFighters
  /* 171420 80131C00 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 171424 80131C04 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 171428 80131C08 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 17142C 80131C0C AFBF0014 */        sw $ra, 0x14($sp)
  /* 171430 80131C10 25E8003C */     addiu $t0, $t7, 0x3c
  /* 171434 80131C14 27AE001C */     addiu $t6, $sp, 0x1c
  .L80131C18:
  /* 171438 80131C18 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 17143C 80131C1C 25EF000C */     addiu $t7, $t7, 0xc
  /* 171440 80131C20 25CE000C */     addiu $t6, $t6, 0xc
  /* 171444 80131C24 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 171448 80131C28 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 17144C 80131C2C ADD8FFF8 */        sw $t8, -8($t6)
  /* 171450 80131C30 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 171454 80131C34 15E8FFF8 */       bne $t7, $t0, .L80131C18
  /* 171458 80131C38 ADD9FFFC */        sw $t9, -4($t6)
  /* 17145C 80131C3C 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 171460 80131C40 00002025 */        or $a0, $zero, $zero
  /* 171464 80131C44 00002825 */        or $a1, $zero, $zero
  /* 171468 80131C48 ADD90000 */        sw $t9, ($t6)
  /* 17146C 80131C4C 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 171470 80131C50 AFA0001C */        sw $zero, 0x1c($sp)
  /* 171474 80131C54 44800000 */      mtc1 $zero, $f0
  /* 171478 80131C58 3C098013 */       lui $t1, %hi(gMvOpeningMarioVsKirbyAnimHeapMario)
  /* 17147C 80131C5C 8D2929C8 */        lw $t1, %lo(gMvOpeningMarioVsKirbyAnimHeapMario)($t1)
  /* 171480 80131C60 A3A20033 */        sb $v0, 0x33($sp)
  /* 171484 80131C64 27A4001C */     addiu $a0, $sp, 0x1c
  /* 171488 80131C68 E7A00020 */      swc1 $f0, 0x20($sp)
  /* 17148C 80131C6C E7A00024 */      swc1 $f0, 0x24($sp)
  /* 171490 80131C70 E7A00028 */      swc1 $f0, 0x28($sp)
  /* 171494 80131C74 0C035FCF */       jal ftManagerMakeFighter
  /* 171498 80131C78 AFA90054 */        sw $t1, 0x54($sp)
  /* 17149C 80131C7C 3C050001 */       lui $a1, (0x1000F >> 16) # 65551
  /* 1714A0 80131C80 34A5000F */       ori $a1, $a1, (0x1000F & 0xFFFF) # 65551
  /* 1714A4 80131C84 00402025 */        or $a0, $v0, $zero
  /* 1714A8 80131C88 0C0E4173 */       jal func_ovl1_803905CC
  /* 1714AC 80131C8C AFA2005C */        sw $v0, 0x5c($sp)
  /* 1714B0 80131C90 8FA3005C */        lw $v1, 0x5c($sp)
  /* 1714B4 80131C94 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1714B8 80131C98 44811000 */      mtc1 $at, $f2 # 1.0 to cop1
  /* 1714BC 80131C9C 8C6A0074 */        lw $t2, 0x74($v1)
  /* 1714C0 80131CA0 240D0008 */     addiu $t5, $zero, 8
  /* 1714C4 80131CA4 24040008 */     addiu $a0, $zero, 8
  /* 1714C8 80131CA8 E5420040 */      swc1 $f2, 0x40($t2)
  /* 1714CC 80131CAC 8C6B0074 */        lw $t3, 0x74($v1)
  /* 1714D0 80131CB0 00002825 */        or $a1, $zero, $zero
  /* 1714D4 80131CB4 E5620044 */      swc1 $f2, 0x44($t3)
  /* 1714D8 80131CB8 8C6C0074 */        lw $t4, 0x74($v1)
  /* 1714DC 80131CBC E5820048 */      swc1 $f2, 0x48($t4)
  /* 1714E0 80131CC0 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 1714E4 80131CC4 AFAD001C */        sw $t5, 0x1c($sp)
  /* 1714E8 80131CC8 44800000 */      mtc1 $zero, $f0
  /* 1714EC 80131CCC 3C088013 */       lui $t0, %hi(gMvOpeningMarioVsKirbyAnimHeapKirby)
  /* 1714F0 80131CD0 8D0829CC */        lw $t0, %lo(gMvOpeningMarioVsKirbyAnimHeapKirby)($t0)
  /* 1714F4 80131CD4 A3A20033 */        sb $v0, 0x33($sp)
  /* 1714F8 80131CD8 27A4001C */     addiu $a0, $sp, 0x1c
  /* 1714FC 80131CDC E7A00020 */      swc1 $f0, 0x20($sp)
  /* 171500 80131CE0 E7A00024 */      swc1 $f0, 0x24($sp)
  /* 171504 80131CE4 E7A00028 */      swc1 $f0, 0x28($sp)
  /* 171508 80131CE8 0C035FCF */       jal ftManagerMakeFighter
  /* 17150C 80131CEC AFA80054 */        sw $t0, 0x54($sp)
  /* 171510 80131CF0 3C050001 */       lui $a1, (0x1000F >> 16) # 65551
  /* 171514 80131CF4 34A5000F */       ori $a1, $a1, (0x1000F & 0xFFFF) # 65551
  /* 171518 80131CF8 00402025 */        or $a0, $v0, $zero
  /* 17151C 80131CFC 0C0E4173 */       jal func_ovl1_803905CC
  /* 171520 80131D00 AFA2005C */        sw $v0, 0x5c($sp)
  /* 171524 80131D04 8FA3005C */        lw $v1, 0x5c($sp)
  /* 171528 80131D08 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 17152C 80131D0C 44811000 */      mtc1 $at, $f2 # 1.0 to cop1
  /* 171530 80131D10 8C6F0074 */        lw $t7, 0x74($v1)
  /* 171534 80131D14 E5E20040 */      swc1 $f2, 0x40($t7)
  /* 171538 80131D18 8C6E0074 */        lw $t6, 0x74($v1)
  /* 17153C 80131D1C E5C20044 */      swc1 $f2, 0x44($t6)
  /* 171540 80131D20 8C780074 */        lw $t8, 0x74($v1)
  /* 171544 80131D24 E7020048 */      swc1 $f2, 0x48($t8)
  /* 171548 80131D28 8FBF0014 */        lw $ra, 0x14($sp)
  /* 17154C 80131D2C 27BD0060 */     addiu $sp, $sp, 0x60
  /* 171550 80131D30 03E00008 */        jr $ra
  /* 171554 80131D34 00000000 */       nop

glabel mvOpeningMarioVsKirbyScrollBackground
  /* 171558 80131D38 3C068013 */       lui $a2, %hi(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 17155C 80131D3C 24C629D0 */     addiu $a2, $a2, %lo(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171560 80131D40 8CC50000 */        lw $a1, ($a2) # gMvOpeningMarioVsKirbyFramesElapsed + 0
  /* 171564 80131D44 24010001 */     addiu $at, $zero, 1
  /* 171568 80131D48 8C820074 */        lw $v0, 0x74($a0)
  /* 17156C 80131D4C 10A10012 */       beq $a1, $at, .L80131D98
  /* 171570 80131D50 00A01825 */        or $v1, $a1, $zero
  /* 171574 80131D54 2401005A */     addiu $at, $zero, 0x5a
  /* 171578 80131D58 10610015 */       beq $v1, $at, .L80131DB0
  /* 17157C 80131D5C 24010069 */     addiu $at, $zero, 0x69
  /* 171580 80131D60 1061001B */       beq $v1, $at, .L80131DD0
  /* 171584 80131D64 240100B4 */     addiu $at, $zero, 0xb4
  /* 171588 80131D68 1061001F */       beq $v1, $at, .L80131DE8
  /* 17158C 80131D6C 240100C3 */     addiu $at, $zero, 0xc3
  /* 171590 80131D70 10610025 */       beq $v1, $at, .L80131E08
  /* 171594 80131D74 24010118 */     addiu $at, $zero, 0x118
  /* 171598 80131D78 10610029 */       beq $v1, $at, .L80131E20
  /* 17159C 80131D7C 2401012C */     addiu $at, $zero, 0x12c
  /* 1715A0 80131D80 1061002D */       beq $v1, $at, .L80131E38
  /* 1715A4 80131D84 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1715A8 80131D88 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 1715AC 80131D8C 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715B0 80131D90 10000030 */         b .L80131E54
  /* 1715B4 80131D94 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  .L80131D98:
  /* 1715B8 80131D98 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1715BC 80131D9C 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 1715C0 80131DA0 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715C4 80131DA4 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715C8 80131DA8 1000002A */         b .L80131E54
  /* 1715CC 80131DAC E46C0000 */      swc1 $f12, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131DB0:
  /* 1715D0 80131DB0 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 1715D4 80131DB4 44812000 */      mtc1 $at, $f4 # 8.0 to cop1
  /* 1715D8 80131DB8 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715DC 80131DBC 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1715E0 80131DC0 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715E4 80131DC4 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 1715E8 80131DC8 10000022 */         b .L80131E54
  /* 1715EC 80131DCC E4640000 */      swc1 $f4, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131DD0:
  /* 1715F0 80131DD0 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1715F4 80131DD4 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 1715F8 80131DD8 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 1715FC 80131DDC 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171600 80131DE0 1000001C */         b .L80131E54
  /* 171604 80131DE4 E46C0000 */      swc1 $f12, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131DE8:
  /* 171608 80131DE8 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 17160C 80131DEC 44813000 */      mtc1 $at, $f6 # 8.0 to cop1
  /* 171610 80131DF0 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171614 80131DF4 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 171618 80131DF8 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 17161C 80131DFC 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 171620 80131E00 10000014 */         b .L80131E54
  /* 171624 80131E04 E4660000 */      swc1 $f6, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E08:
  /* 171628 80131E08 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 17162C 80131E0C 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 171630 80131E10 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171634 80131E14 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171638 80131E18 1000000E */         b .L80131E54
  /* 17163C 80131E1C E46C0000 */      swc1 $f12, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E20:
  /* 171640 80131E20 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 171644 80131E24 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 171648 80131E28 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 17164C 80131E2C 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171650 80131E30 10000008 */         b .L80131E54
  /* 171654 80131E34 E46C0000 */      swc1 $f12, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E38:
  /* 171658 80131E38 3C0140E0 */       lui $at, (0x40E00000 >> 16) # 7.0
  /* 17165C 80131E3C 44814000 */      mtc1 $at, $f8 # 7.0 to cop1
  /* 171660 80131E40 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 171664 80131E44 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 171668 80131E48 246329D4 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyBackgroundScrollSpeed)
  /* 17166C 80131E4C 44816000 */      mtc1 $at, $f12 # 2.0 to cop1
  /* 171670 80131E50 E4680000 */      swc1 $f8, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E54:
  /* 171674 80131E54 28A10119 */      slti $at, $a1, 0x119
  /* 171678 80131E58 14200007 */      bnez $at, .L80131E78
  /* 17167C 80131E5C 28A1012C */      slti $at, $a1, 0x12c
  /* 171680 80131E60 10200005 */      beqz $at, .L80131E78
  /* 171684 80131E64 3C018013 */       lui $at, %hi(D_ovl47_801329B0)
  /* 171688 80131E68 C43029B0 */      lwc1 $f16, %lo(D_ovl47_801329B0)($at)
  /* 17168C 80131E6C C46A0000 */      lwc1 $f10, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  /* 171690 80131E70 46105480 */     add.s $f18, $f10, $f16
  /* 171694 80131E74 E4720000 */      swc1 $f18, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E78:
  /* 171698 80131E78 28A1012D */      slti $at, $a1, 0x12d
  /* 17169C 80131E7C 14200007 */      bnez $at, .L80131E9C
  /* 1716A0 80131E80 28A10140 */      slti $at, $a1, 0x140
  /* 1716A4 80131E84 10200005 */      beqz $at, .L80131E9C
  /* 1716A8 80131E88 3C018013 */       lui $at, %hi(D_ovl47_801329B4)
  /* 1716AC 80131E8C C42629B4 */      lwc1 $f6, %lo(D_ovl47_801329B4)($at)
  /* 1716B0 80131E90 C4640000 */      lwc1 $f4, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  /* 1716B4 80131E94 46062200 */     add.s $f8, $f4, $f6
  /* 1716B8 80131E98 E4680000 */      swc1 $f8, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  .L80131E9C:
  /* 1716BC 80131E9C 28A1012D */      slti $at, $a1, 0x12d
  /* 1716C0 80131EA0 5420000A */      bnel $at, $zero, .L80131ECC
  /* 1716C4 80131EA4 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 1716C8 80131EA8 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 1716CC 80131EAC C4700000 */      lwc1 $f16, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  /* 1716D0 80131EB0 3C0143A0 */       lui $at, (0x43A00000 >> 16) # 320.0
  /* 1716D4 80131EB4 44811000 */      mtc1 $at, $f2 # 320.0 to cop1
  /* 1716D8 80131EB8 46105480 */     add.s $f18, $f10, $f16
  /* 1716DC 80131EBC C4400058 */      lwc1 $f0, 0x58($v0)
  /* 1716E0 80131EC0 1000000F */         b .L80131F00
  /* 1716E4 80131EC4 E452005C */      swc1 $f18, 0x5c($v0)
  /* 1716E8 80131EC8 C4440058 */      lwc1 $f4, 0x58($v0)
  .L80131ECC:
  /* 1716EC 80131ECC C4660000 */      lwc1 $f6, ($v1) # gMvOpeningMarioVsKirbyBackgroundScrollSpeed + 0
  /* 1716F0 80131ED0 3C0143A0 */       lui $at, (0x43A00000 >> 16) # 320.0
  /* 1716F4 80131ED4 44811000 */      mtc1 $at, $f2 # 320.0 to cop1
  /* 1716F8 80131ED8 46062200 */     add.s $f8, $f4, $f6
  /* 1716FC 80131EDC E4480058 */      swc1 $f8, 0x58($v0)
  /* 171700 80131EE0 C4400058 */      lwc1 $f0, 0x58($v0)
  /* 171704 80131EE4 4600103C */    c.lt.s $f2, $f0
  /* 171708 80131EE8 00000000 */       nop
  /* 17170C 80131EEC 45020005 */     bc1fl .L80131F04
  /* 171710 80131EF0 8CC50000 */        lw $a1, ($a2) # gMvOpeningMarioVsKirbyFramesElapsed + 0
  /* 171714 80131EF4 46020281 */     sub.s $f10, $f0, $f2
  /* 171718 80131EF8 E44A0058 */      swc1 $f10, 0x58($v0)
  /* 17171C 80131EFC C4400058 */      lwc1 $f0, 0x58($v0)
  .L80131F00:
  /* 171720 80131F00 8CC50000 */        lw $a1, ($a2) # gMvOpeningMarioVsKirbyFramesElapsed + 0
  .L80131F04:
  /* 171724 80131F04 28A1005B */      slti $at, $a1, 0x5b
  /* 171728 80131F08 14200002 */      bnez $at, .L80131F14
  /* 17172C 80131F0C 28A10069 */      slti $at, $a1, 0x69
  /* 171730 80131F10 14200004 */      bnez $at, .L80131F24
  .L80131F14:
  /* 171734 80131F14 28A100B5 */      slti $at, $a1, 0xb5
  /* 171738 80131F18 14200016 */      bnez $at, .L80131F74
  /* 17173C 80131F1C 28A100C3 */      slti $at, $a1, 0xc3
  /* 171740 80131F20 10200014 */      beqz $at, .L80131F74
  .L80131F24:
  /* 171744 80131F24 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 171748 80131F28 44811000 */      mtc1 $at, $f2 # 4.0 to cop1
  /* 17174C 80131F2C 3C014420 */       lui $at, (0x44200000 >> 16) # 640.0
  /* 171750 80131F30 44818000 */      mtc1 $at, $f16 # 640.0 to cop1
  /* 171754 80131F34 8C4E0008 */        lw $t6, 8($v0)
  /* 171758 80131F38 3C01C370 */       lui $at, (0xC3700000 >> 16) # -240.0
  /* 17175C 80131F3C 46100481 */     sub.s $f18, $f0, $f16
  /* 171760 80131F40 44813000 */      mtc1 $at, $f6 # -240.0 to cop1
  /* 171764 80131F44 E5D20058 */      swc1 $f18, 0x58($t6)
  /* 171768 80131F48 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 17176C 80131F4C 8C4F0008 */        lw $t7, 8($v0)
  /* 171770 80131F50 E5E4005C */      swc1 $f4, 0x5c($t7)
  /* 171774 80131F54 8C580008 */        lw $t8, 8($v0)
  /* 171778 80131F58 E4420018 */      swc1 $f2, 0x18($v0)
  /* 17177C 80131F5C E442001C */      swc1 $f2, 0x1c($v0)
  /* 171780 80131F60 E7020018 */      swc1 $f2, 0x18($t8)
  /* 171784 80131F64 8C590008 */        lw $t9, 8($v0)
  /* 171788 80131F68 E722001C */      swc1 $f2, 0x1c($t9)
  /* 17178C 80131F6C 03E00008 */        jr $ra
  /* 171790 80131F70 E446005C */      swc1 $f6, 0x5c($v0)

  .L80131F74:
  /* 171794 80131F74 46020201 */     sub.s $f8, $f0, $f2
  /* 171798 80131F78 8C480008 */        lw $t0, 8($v0)
  /* 17179C 80131F7C E5080058 */      swc1 $f8, 0x58($t0)
  /* 1717A0 80131F80 8C490008 */        lw $t1, 8($v0)
  /* 1717A4 80131F84 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 1717A8 80131F88 E52A005C */      swc1 $f10, 0x5c($t1)
  /* 1717AC 80131F8C 8C4A0008 */        lw $t2, 8($v0)
  /* 1717B0 80131F90 E44C0018 */      swc1 $f12, 0x18($v0)
  /* 1717B4 80131F94 E44C001C */      swc1 $f12, 0x1c($v0)
  /* 1717B8 80131F98 E54C0018 */      swc1 $f12, 0x18($t2)
  /* 1717BC 80131F9C 8C4B0008 */        lw $t3, 8($v0)
  /* 1717C0 80131FA0 E56C001C */      swc1 $f12, 0x1c($t3)
  /* 1717C4 80131FA4 8CCC0000 */        lw $t4, ($a2)
  /* 1717C8 80131FA8 2981012C */      slti $at, $t4, 0x12c
  /* 1717CC 80131FAC 10200004 */      beqz $at, .L80131FC0
  /* 1717D0 80131FB0 00000000 */       nop
  /* 1717D4 80131FB4 44808000 */      mtc1 $zero, $f16
  /* 1717D8 80131FB8 00000000 */       nop
  /* 1717DC 80131FBC E450005C */      swc1 $f16, 0x5c($v0)
  .L80131FC0:
  /* 1717E0 80131FC0 03E00008 */        jr $ra
  /* 1717E4 80131FC4 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateBackground
  /* 1717E8 80131FC8 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1717EC 80131FCC AFBF001C */        sw $ra, 0x1c($sp)
  /* 1717F0 80131FD0 00002025 */        or $a0, $zero, $zero
  /* 1717F4 80131FD4 00002825 */        or $a1, $zero, $zero
  /* 1717F8 80131FD8 24060013 */     addiu $a2, $zero, 0x13
  /* 1717FC 80131FDC 0C00265A */       jal omMakeGObjSPAfter
  /* 171800 80131FE0 3C078000 */       lui $a3, 0x8000
  /* 171804 80131FE4 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 171808 80131FE8 240EFFFF */     addiu $t6, $zero, -1
  /* 17180C 80131FEC AFA2002C */        sw $v0, 0x2c($sp)
  /* 171810 80131FF0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 171814 80131FF4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 171818 80131FF8 00402025 */        or $a0, $v0, $zero
  /* 17181C 80131FFC 2406001B */     addiu $a2, $zero, 0x1b
  /* 171820 80132000 0C00277D */       jal omAddGObjRenderProc
  /* 171824 80132004 3C078000 */       lui $a3, 0x8000
  /* 171828 80132008 3C058013 */       lui $a1, %hi(mvOpeningMarioVsKirbyScrollBackground)
  /* 17182C 8013200C 24A51D38 */     addiu $a1, $a1, %lo(mvOpeningMarioVsKirbyScrollBackground)
  /* 171830 80132010 8FA4002C */        lw $a0, 0x2c($sp)
  /* 171834 80132014 24060001 */     addiu $a2, $zero, 1
  /* 171838 80132018 0C002062 */       jal omAddGObjCommonProc
  /* 17183C 8013201C 24070001 */     addiu $a3, $zero, 1
  /* 171840 80132020 3C0F8013 */       lui $t7, %hi(D_ovl47_80132B9C)
  /* 171844 80132024 8DEF2B9C */        lw $t7, %lo(D_ovl47_80132B9C)($t7)
  /* 171848 80132028 3C030001 */       lui $v1, %hi(D_NF_0000B500)
  /* 17184C 8013202C 2463B500 */     addiu $v1, $v1, %lo(D_NF_0000B500)
  /* 171850 80132030 AFA30024 */        sw $v1, 0x24($sp)
  /* 171854 80132034 8FA4002C */        lw $a0, 0x2c($sp)
  /* 171858 80132038 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 17185C 8013203C 01E32821 */      addu $a1, $t7, $v1
  /* 171860 80132040 8FA30024 */        lw $v1, 0x24($sp)
  /* 171864 80132044 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 171868 80132048 44810000 */      mtc1 $at, $f0 # 2.0 to cop1
  /* 17186C 8013204C 44801000 */      mtc1 $zero, $f2
  /* 171870 80132050 94580024 */       lhu $t8, 0x24($v0)
  /* 171874 80132054 3C088013 */       lui $t0, %hi(D_ovl47_80132B9C)
  /* 171878 80132058 E4400018 */      swc1 $f0, 0x18($v0)
  /* 17187C 8013205C 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 171880 80132060 A4590024 */        sh $t9, 0x24($v0)
  /* 171884 80132064 E440001C */      swc1 $f0, 0x1c($v0)
  /* 171888 80132068 E4420058 */      swc1 $f2, 0x58($v0)
  /* 17188C 8013206C E442005C */      swc1 $f2, 0x5c($v0)
  /* 171890 80132070 8D082B9C */        lw $t0, %lo(D_ovl47_80132B9C)($t0)
  /* 171894 80132074 8FA4002C */        lw $a0, 0x2c($sp)
  /* 171898 80132078 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 17189C 8013207C 01032821 */      addu $a1, $t0, $v1
  /* 1718A0 80132080 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1718A4 80132084 44810000 */      mtc1 $at, $f0 # 2.0 to cop1
  /* 1718A8 80132088 94490024 */       lhu $t1, 0x24($v0)
  /* 1718AC 8013208C 3C0143A0 */       lui $at, (0x43A00000 >> 16) # 320.0
  /* 1718B0 80132090 44812000 */      mtc1 $at, $f4 # 320.0 to cop1
  /* 1718B4 80132094 44803000 */      mtc1 $zero, $f6
  /* 1718B8 80132098 312AFFDF */      andi $t2, $t1, 0xffdf
  /* 1718BC 8013209C A44A0024 */        sh $t2, 0x24($v0)
  /* 1718C0 801320A0 E4400018 */      swc1 $f0, 0x18($v0)
  /* 1718C4 801320A4 E440001C */      swc1 $f0, 0x1c($v0)
  /* 1718C8 801320A8 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1718CC 801320AC E446005C */      swc1 $f6, 0x5c($v0)
  /* 1718D0 801320B0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1718D4 801320B4 27BD0030 */     addiu $sp, $sp, 0x30
  /* 1718D8 801320B8 03E00008 */        jr $ra
  /* 1718DC 801320BC 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateLightning
  /* 1718E0 801320C0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1718E4 801320C4 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1718E8 801320C8 AFB00020 */        sw $s0, 0x20($sp)
  /* 1718EC 801320CC 00002025 */        or $a0, $zero, $zero
  /* 1718F0 801320D0 00002825 */        or $a1, $zero, $zero
  /* 1718F4 801320D4 24060011 */     addiu $a2, $zero, 0x11
  /* 1718F8 801320D8 0C00265A */       jal omMakeGObjSPAfter
  /* 1718FC 801320DC 3C078000 */       lui $a3, 0x8000
  /* 171900 801320E0 3C0E8013 */       lui $t6, %hi(D_ovl47_80132B98)
  /* 171904 801320E4 8DCE2B98 */        lw $t6, %lo(D_ovl47_80132B98)($t6)
  /* 171908 801320E8 3C0F0000 */       lui $t7, %hi(D_NF_00006950)
  /* 17190C 801320EC 25EF6950 */     addiu $t7, $t7, %lo(D_NF_00006950)
  /* 171910 801320F0 00408025 */        or $s0, $v0, $zero
  /* 171914 801320F4 00402025 */        or $a0, $v0, $zero
  /* 171918 801320F8 00003025 */        or $a2, $zero, $zero
  /* 17191C 801320FC 2407001C */     addiu $a3, $zero, 0x1c
  /* 171920 80132100 AFA00010 */        sw $zero, 0x10($sp)
  /* 171924 80132104 AFA00014 */        sw $zero, 0x14($sp)
  /* 171928 80132108 0C003D64 */       jal func_8000F590
  /* 17192C 8013210C 01CF2821 */      addu $a1, $t6, $t7
  /* 171930 80132110 3C188013 */       lui $t8, %hi(D_ovl47_80132B98)
  /* 171934 80132114 8F182B98 */        lw $t8, %lo(D_ovl47_80132B98)($t8)
  /* 171938 80132118 3C190000 */       lui $t9, %hi(D_NF_00006140)
  /* 17193C 8013211C 27396140 */     addiu $t9, $t9, %lo(D_NF_00006140)
  /* 171940 80132120 02002025 */        or $a0, $s0, $zero
  /* 171944 80132124 0C003E3D */       jal func_8000F8F4
  /* 171948 80132128 03192821 */      addu $a1, $t8, $t9
  /* 17194C 8013212C 44800000 */      mtc1 $zero, $f0
  /* 171950 80132130 3C088013 */       lui $t0, %hi(D_ovl47_80132B98)
  /* 171954 80132134 8D082B98 */        lw $t0, %lo(D_ovl47_80132B98)($t0)
  /* 171958 80132138 3C090000 */       lui $t1, %hi(D_NF_00006BB8)
  /* 17195C 8013213C 25296BB8 */     addiu $t1, $t1, %lo(D_NF_00006BB8)
  /* 171960 80132140 44060000 */      mfc1 $a2, $f0
  /* 171964 80132144 02002025 */        or $a0, $s0, $zero
  /* 171968 80132148 0C002F8A */       jal func_8000BE28
  /* 17196C 8013214C 01092821 */      addu $a1, $t0, $t1
  /* 171970 80132150 3C058001 */       lui $a1, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 171974 80132154 240AFFFF */     addiu $t2, $zero, -1
  /* 171978 80132158 AFAA0010 */        sw $t2, 0x10($sp)
  /* 17197C 8013215C 24A54768 */     addiu $a1, $a1, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 171980 80132160 02002025 */        or $a0, $s0, $zero
  /* 171984 80132164 2406001A */     addiu $a2, $zero, 0x1a
  /* 171988 80132168 0C00277D */       jal omAddGObjRenderProc
  /* 17198C 8013216C 3C078000 */       lui $a3, 0x8000
  /* 171990 80132170 44800000 */      mtc1 $zero, $f0
  /* 171994 80132174 8E0B0074 */        lw $t3, 0x74($s0)
  /* 171998 80132178 3C0E8013 */       lui $t6, %hi(D_ovl47_80132B98)
  /* 17199C 8013217C 3C0F0000 */       lui $t7, %hi(D_NF_00006D60)
  /* 1719A0 80132180 E560001C */      swc1 $f0, 0x1c($t3)
  /* 1719A4 80132184 8E0C0074 */        lw $t4, 0x74($s0)
  /* 1719A8 80132188 25EF6D60 */     addiu $t7, $t7, %lo(D_NF_00006D60)
  /* 1719AC 8013218C 44060000 */      mfc1 $a2, $f0
  /* 1719B0 80132190 E5800020 */      swc1 $f0, 0x20($t4)
  /* 1719B4 80132194 8E0D0074 */        lw $t5, 0x74($s0)
  /* 1719B8 80132198 02002025 */        or $a0, $s0, $zero
  /* 1719BC 8013219C E5A00024 */      swc1 $f0, 0x24($t5)
  /* 1719C0 801321A0 8DCE2B98 */        lw $t6, %lo(D_ovl47_80132B98)($t6)
  /* 1719C4 801321A4 0C002F63 */       jal func_8000BD8C
  /* 1719C8 801321A8 01CF2821 */      addu $a1, $t6, $t7
  /* 1719CC 801321AC 3C058001 */       lui $a1, %hi(func_8000DF34)
  /* 1719D0 801321B0 24A5DF34 */     addiu $a1, $a1, %lo(func_8000DF34)
  /* 1719D4 801321B4 02002025 */        or $a0, $s0, $zero
  /* 1719D8 801321B8 24060001 */     addiu $a2, $zero, 1
  /* 1719DC 801321BC 0C002062 */       jal omAddGObjCommonProc
  /* 1719E0 801321C0 24070001 */     addiu $a3, $zero, 1
  /* 1719E4 801321C4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1719E8 801321C8 8FB00020 */        lw $s0, 0x20($sp)
  /* 1719EC 801321CC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1719F0 801321D0 03E00008 */        jr $ra
  /* 1719F4 801321D4 00000000 */       nop

glabel mvOpeningMarioVsKirbyRenderLightningFlash
  /* 1719F8 801321D8 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 1719FC 801321DC 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 171A00 801321E0 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171A04 801321E4 AFA40000 */        sw $a0, ($sp)
  /* 171A08 801321E8 3C04E700 */       lui $a0, 0xe700
  /* 171A0C 801321EC 244E0008 */     addiu $t6, $v0, 8
  /* 171A10 801321F0 AC6E0004 */        sw $t6, 4($v1) # gDisplayListHead + 4
  /* 171A14 801321F4 AC400004 */        sw $zero, 4($v0)
  /* 171A18 801321F8 AC440000 */        sw $a0, ($v0)
  /* 171A1C 801321FC 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171A20 80132200 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 171A24 80132204 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 171A28 80132208 244F0008 */     addiu $t7, $v0, 8
  /* 171A2C 8013220C AC6F0004 */        sw $t7, 4($v1) # gDisplayListHead + 4
  /* 171A30 80132210 3C078013 */       lui $a3, %hi(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171A34 80132214 AC400004 */        sw $zero, 4($v0)
  /* 171A38 80132218 AC580000 */        sw $t8, ($v0)
  /* 171A3C 8013221C 8CE729D0 */        lw $a3, %lo(gMvOpeningMarioVsKirbyFramesElapsed)($a3)
  /* 171A40 80132220 3C0AE200 */       lui $t2, (0xE200001C >> 16) # 3791650844
  /* 171A44 80132224 354A001C */       ori $t2, $t2, (0xE200001C & 0xFFFF) # 3791650844
  /* 171A48 80132228 28E10014 */      slti $at, $a3, 0x14
  /* 171A4C 8013222C 14200002 */      bnez $at, .L80132238
  /* 171A50 80132230 28E10017 */      slti $at, $a3, 0x17
  /* 171A54 80132234 14200009 */      bnez $at, .L8013225C
  .L80132238:
  /* 171A58 80132238 28E10096 */      slti $at, $a3, 0x96
  /* 171A5C 8013223C 14200002 */      bnez $at, .L80132248
  /* 171A60 80132240 28E10099 */      slti $at, $a3, 0x99
  /* 171A64 80132244 14200005 */      bnez $at, .L8013225C
  .L80132248:
  /* 171A68 80132248 28E10105 */      slti $at, $a3, 0x105
  /* 171A6C 8013224C 1420000B */      bnez $at, .L8013227C
  /* 171A70 80132250 28E10108 */      slti $at, $a3, 0x108
  /* 171A74 80132254 5020000A */      beql $at, $zero, .L80132280
  /* 171A78 80132258 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  .L8013225C:
  /* 171A7C 8013225C 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171A80 80132260 3C0BFA00 */       lui $t3, 0xfa00
  /* 171A84 80132264 240CFF40 */     addiu $t4, $zero, -0xc0
  /* 171A88 80132268 24590008 */     addiu $t9, $v0, 8
  /* 171A8C 8013226C AC790004 */        sw $t9, 4($v1) # gDisplayListHead + 4
  /* 171A90 80132270 AC4C0004 */        sw $t4, 4($v0)
  /* 171A94 80132274 10000008 */         b .L80132298
  /* 171A98 80132278 AC4B0000 */        sw $t3, ($v0)
  .L8013227C:
  /* 171A9C 8013227C 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  .L80132280:
  /* 171AA0 80132280 3C0EFA00 */       lui $t6, 0xfa00
  /* 171AA4 80132284 240FFF00 */     addiu $t7, $zero, -0x100
  /* 171AA8 80132288 244D0008 */     addiu $t5, $v0, 8
  /* 171AAC 8013228C AC6D0004 */        sw $t5, 4($v1) # gDisplayListHead + 4
  /* 171AB0 80132290 AC4F0004 */        sw $t7, 4($v0)
  /* 171AB4 80132294 AC4E0000 */        sw $t6, ($v0)
  .L80132298:
  /* 171AB8 80132298 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171ABC 8013229C 3C19FCFF */       lui $t9, (0xFCFFFFFF >> 16) # 4244635647
  /* 171AC0 801322A0 3C0BFFFD */       lui $t3, (0xFFFDF6FB >> 16) # 4294833915
  /* 171AC4 801322A4 24580008 */     addiu $t8, $v0, 8
  /* 171AC8 801322A8 AC780004 */        sw $t8, 4($v1) # gDisplayListHead + 4
  /* 171ACC 801322AC 356BF6FB */       ori $t3, $t3, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 171AD0 801322B0 3739FFFF */       ori $t9, $t9, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 171AD4 801322B4 AC590000 */        sw $t9, ($v0)
  /* 171AD8 801322B8 AC4B0004 */        sw $t3, 4($v0)
  /* 171ADC 801322BC 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171AE0 801322C0 3C0D0050 */       lui $t5, (0x5041C8 >> 16) # 5259720
  /* 171AE4 801322C4 35AD41C8 */       ori $t5, $t5, (0x5041C8 & 0xFFFF) # 5259720
  /* 171AE8 801322C8 244C0008 */     addiu $t4, $v0, 8
  /* 171AEC 801322CC AC6C0004 */        sw $t4, 4($v1) # gDisplayListHead + 4
  /* 171AF0 801322D0 AC4D0004 */        sw $t5, 4($v0)
  /* 171AF4 801322D4 AC4A0000 */        sw $t2, ($v0)
  /* 171AF8 801322D8 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171AFC 801322DC 3C180002 */       lui $t8, (0x28028 >> 16) # 163880
  /* 171B00 801322E0 3C0FF64D */       lui $t7, (0xF64D8398 >> 16) # 4132275096
  /* 171B04 801322E4 244E0008 */     addiu $t6, $v0, 8
  /* 171B08 801322E8 AC6E0004 */        sw $t6, 4($v1) # gDisplayListHead + 4
  /* 171B0C 801322EC 35EF8398 */       ori $t7, $t7, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 171B10 801322F0 37188028 */       ori $t8, $t8, (0x28028 & 0xFFFF) # 163880
  /* 171B14 801322F4 AC580004 */        sw $t8, 4($v0)
  /* 171B18 801322F8 AC4F0000 */        sw $t7, ($v0)
  /* 171B1C 801322FC 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171B20 80132300 3C0C0055 */       lui $t4, (0x552078 >> 16) # 5578872
  /* 171B24 80132304 358C2078 */       ori $t4, $t4, (0x552078 & 0xFFFF) # 5578872
  /* 171B28 80132308 24590008 */     addiu $t9, $v0, 8
  /* 171B2C 8013230C AC790004 */        sw $t9, 4($v1) # gDisplayListHead + 4
  /* 171B30 80132310 AC400004 */        sw $zero, 4($v0)
  /* 171B34 80132314 AC440000 */        sw $a0, ($v0)
  /* 171B38 80132318 8C620004 */        lw $v0, 4($v1) # gDisplayListHead + 4
  /* 171B3C 8013231C 244B0008 */     addiu $t3, $v0, 8
  /* 171B40 80132320 AC6B0004 */        sw $t3, 4($v1) # gDisplayListHead + 4
  /* 171B44 80132324 AC4C0004 */        sw $t4, 4($v0)
  /* 171B48 80132328 03E00008 */        jr $ra
  /* 171B4C 8013232C AC4A0000 */        sw $t2, ($v0)

  /* 171B50 80132330 03E00008 */        jr $ra
  /* 171B54 80132334 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateLightningFlash
  /* 171B58 80132338 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 171B5C 8013233C AFBF001C */        sw $ra, 0x1c($sp)
  /* 171B60 80132340 00002025 */        or $a0, $zero, $zero
  /* 171B64 80132344 00002825 */        or $a1, $zero, $zero
  /* 171B68 80132348 24060012 */     addiu $a2, $zero, 0x12
  /* 171B6C 8013234C 0C00265A */       jal omMakeGObjSPAfter
  /* 171B70 80132350 3C078000 */       lui $a3, 0x8000
  /* 171B74 80132354 3C058013 */       lui $a1, %hi(mvOpeningMarioVsKirbyRenderLightningFlash)
  /* 171B78 80132358 240EFFFF */     addiu $t6, $zero, -1
  /* 171B7C 8013235C AFAE0010 */        sw $t6, 0x10($sp)
  /* 171B80 80132360 24A521D8 */     addiu $a1, $a1, %lo(mvOpeningMarioVsKirbyRenderLightningFlash)
  /* 171B84 80132364 00402025 */        or $a0, $v0, $zero
  /* 171B88 80132368 2406001C */     addiu $a2, $zero, 0x1c
  /* 171B8C 8013236C 0C00277D */       jal omAddGObjRenderProc
  /* 171B90 80132370 3C078000 */       lui $a3, 0x8000
  /* 171B94 80132374 8FBF001C */        lw $ra, 0x1c($sp)
  /* 171B98 80132378 27BD0020 */     addiu $sp, $sp, 0x20
  /* 171B9C 8013237C 03E00008 */        jr $ra
  /* 171BA0 80132380 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateLightningFlashViewport
  /* 171BA4 80132384 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 171BA8 80132388 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 171BAC 8013238C AFBF003C */        sw $ra, 0x3c($sp)
  /* 171BB0 80132390 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 171BB4 80132394 240F0014 */     addiu $t7, $zero, 0x14
  /* 171BB8 80132398 24180000 */     addiu $t8, $zero, 0
  /* 171BBC 8013239C 3C191000 */       lui $t9, 0x1000
  /* 171BC0 801323A0 2408FFFF */     addiu $t0, $zero, -1
  /* 171BC4 801323A4 24090001 */     addiu $t1, $zero, 1
  /* 171BC8 801323A8 240A0001 */     addiu $t2, $zero, 1
  /* 171BCC 801323AC AFAA0030 */        sw $t2, 0x30($sp)
  /* 171BD0 801323B0 AFA90028 */        sw $t1, 0x28($sp)
  /* 171BD4 801323B4 AFA80020 */        sw $t0, 0x20($sp)
  /* 171BD8 801323B8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 171BDC 801323BC AFB80018 */        sw $t8, 0x18($sp)
  /* 171BE0 801323C0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 171BE4 801323C4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 171BE8 801323C8 AFA00024 */        sw $zero, 0x24($sp)
  /* 171BEC 801323CC AFA0002C */        sw $zero, 0x2c($sp)
  /* 171BF0 801323D0 AFA00034 */        sw $zero, 0x34($sp)
  /* 171BF4 801323D4 24040401 */     addiu $a0, $zero, 0x401
  /* 171BF8 801323D8 00002825 */        or $a1, $zero, $zero
  /* 171BFC 801323DC 24060010 */     addiu $a2, $zero, 0x10
  /* 171C00 801323E0 0C002E4F */       jal func_8000B93C
  /* 171C04 801323E4 3C078000 */       lui $a3, 0x8000
  /* 171C08 801323E8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 171C0C 801323EC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 171C10 801323F0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 171C14 801323F4 8C430074 */        lw $v1, 0x74($v0)
  /* 171C18 801323F8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 171C1C 801323FC 44050000 */      mfc1 $a1, $f0
  /* 171C20 80132400 44060000 */      mfc1 $a2, $f0
  /* 171C24 80132404 3C07439B */       lui $a3, 0x439b
  /* 171C28 80132408 24640008 */     addiu $a0, $v1, 8
  /* 171C2C 8013240C 0C001C20 */       jal func_80007080
  /* 171C30 80132410 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 171C34 80132414 8FBF003C */        lw $ra, 0x3c($sp)
  /* 171C38 80132418 27BD0040 */     addiu $sp, $sp, 0x40
  /* 171C3C 8013241C 03E00008 */        jr $ra
  /* 171C40 80132420 00000000 */       nop

  /* 171C44 80132424 03E00008 */        jr $ra
  /* 171C48 80132428 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateMainViewport
  /* 171C4C 8013242C 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 171C50 80132430 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 171C54 80132434 3C190400 */       lui $t9, (0x4000200 >> 16) # 67109376
  /* 171C58 80132438 AFBF0044 */        sw $ra, 0x44($sp)
  /* 171C5C 8013243C 37390200 */       ori $t9, $t9, (0x4000200 & 0xFFFF) # 67109376
  /* 171C60 80132440 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 171C64 80132444 240F0050 */     addiu $t7, $zero, 0x50
  /* 171C68 80132448 24180000 */     addiu $t8, $zero, 0
  /* 171C6C 8013244C 2408FFFF */     addiu $t0, $zero, -1
  /* 171C70 80132450 24090001 */     addiu $t1, $zero, 1
  /* 171C74 80132454 240A0001 */     addiu $t2, $zero, 1
  /* 171C78 80132458 240B0001 */     addiu $t3, $zero, 1
  /* 171C7C 8013245C AFB00040 */        sw $s0, 0x40($sp)
  /* 171C80 80132460 AFAB0030 */        sw $t3, 0x30($sp)
  /* 171C84 80132464 AFAA0028 */        sw $t2, 0x28($sp)
  /* 171C88 80132468 AFA90024 */        sw $t1, 0x24($sp)
  /* 171C8C 8013246C AFA80020 */        sw $t0, 0x20($sp)
  /* 171C90 80132470 AFB80018 */        sw $t8, 0x18($sp)
  /* 171C94 80132474 AFAF0014 */        sw $t7, 0x14($sp)
  /* 171C98 80132478 AFAE0010 */        sw $t6, 0x10($sp)
  /* 171C9C 8013247C AFB9001C */        sw $t9, 0x1c($sp)
  /* 171CA0 80132480 AFA0002C */        sw $zero, 0x2c($sp)
  /* 171CA4 80132484 AFA00034 */        sw $zero, 0x34($sp)
  /* 171CA8 80132488 24040401 */     addiu $a0, $zero, 0x401
  /* 171CAC 8013248C 00002825 */        or $a1, $zero, $zero
  /* 171CB0 80132490 24060010 */     addiu $a2, $zero, 0x10
  /* 171CB4 80132494 0C002E4F */       jal func_8000B93C
  /* 171CB8 80132498 3C078000 */       lui $a3, 0x8000
  /* 171CBC 8013249C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 171CC0 801324A0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 171CC4 801324A4 AFA2004C */        sw $v0, 0x4c($sp)
  /* 171CC8 801324A8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 171CCC 801324AC 8C500074 */        lw $s0, 0x74($v0)
  /* 171CD0 801324B0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 171CD4 801324B4 44050000 */      mfc1 $a1, $f0
  /* 171CD8 801324B8 44060000 */      mfc1 $a2, $f0
  /* 171CDC 801324BC 3C07439B */       lui $a3, 0x439b
  /* 171CE0 801324C0 26040008 */     addiu $a0, $s0, 8
  /* 171CE4 801324C4 0C001C20 */       jal func_80007080
  /* 171CE8 801324C8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 171CEC 801324CC 3C014300 */       lui $at, (0x43000000 >> 16) # 128.0
  /* 171CF0 801324D0 44813000 */      mtc1 $at, $f6 # 128.0 to cop1
  /* 171CF4 801324D4 3C014680 */       lui $at, (0x46800000 >> 16) # 16384.0
  /* 171CF8 801324D8 44814000 */      mtc1 $at, $f8 # 16384.0 to cop1
  /* 171CFC 801324DC 3C0C8013 */       lui $t4, %hi(D_ovl47_80132B98)
  /* 171D00 801324E0 E6060028 */      swc1 $f6, 0x28($s0)
  /* 171D04 801324E4 E608002C */      swc1 $f8, 0x2c($s0)
  /* 171D08 801324E8 8D8C2B98 */        lw $t4, %lo(D_ovl47_80132B98)($t4)
  /* 171D0C 801324EC 3C0D0000 */       lui $t5, %hi(D_NF_00007250)
  /* 171D10 801324F0 25AD7250 */     addiu $t5, $t5, %lo(D_NF_00007250)
  /* 171D14 801324F4 02002025 */        or $a0, $s0, $zero
  /* 171D18 801324F8 24060000 */     addiu $a2, $zero, 0
  /* 171D1C 801324FC 0C003E8F */       jal func_8000FA3C
  /* 171D20 80132500 018D2821 */      addu $a1, $t4, $t5
  /* 171D24 80132504 3C058001 */       lui $a1, %hi(func_80010580)
  /* 171D28 80132508 24A50580 */     addiu $a1, $a1, %lo(func_80010580)
  /* 171D2C 8013250C 8FA4004C */        lw $a0, 0x4c($sp)
  /* 171D30 80132510 24060001 */     addiu $a2, $zero, 1
  /* 171D34 80132514 0C002062 */       jal omAddGObjCommonProc
  /* 171D38 80132518 24070001 */     addiu $a3, $zero, 1
  /* 171D3C 8013251C 8FBF0044 */        lw $ra, 0x44($sp)
  /* 171D40 80132520 8FB00040 */        lw $s0, 0x40($sp)
  /* 171D44 80132524 27BD0050 */     addiu $sp, $sp, 0x50
  /* 171D48 80132528 03E00008 */        jr $ra
  /* 171D4C 8013252C 00000000 */       nop

glabel mvOpeningMarioVsKirbyCreateBackgroundViewport
  /* 171D50 80132530 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 171D54 80132534 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 171D58 80132538 AFBF003C */        sw $ra, 0x3c($sp)
  /* 171D5C 8013253C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 171D60 80132540 240F005A */     addiu $t7, $zero, 0x5a
  /* 171D64 80132544 24180000 */     addiu $t8, $zero, 0
  /* 171D68 80132548 3C190800 */       lui $t9, 0x800
  /* 171D6C 8013254C 2408FFFF */     addiu $t0, $zero, -1
  /* 171D70 80132550 24090001 */     addiu $t1, $zero, 1
  /* 171D74 80132554 240A0001 */     addiu $t2, $zero, 1
  /* 171D78 80132558 AFAA0030 */        sw $t2, 0x30($sp)
  /* 171D7C 8013255C AFA90028 */        sw $t1, 0x28($sp)
  /* 171D80 80132560 AFA80020 */        sw $t0, 0x20($sp)
  /* 171D84 80132564 AFB9001C */        sw $t9, 0x1c($sp)
  /* 171D88 80132568 AFB80018 */        sw $t8, 0x18($sp)
  /* 171D8C 8013256C AFAF0014 */        sw $t7, 0x14($sp)
  /* 171D90 80132570 AFAE0010 */        sw $t6, 0x10($sp)
  /* 171D94 80132574 AFA00024 */        sw $zero, 0x24($sp)
  /* 171D98 80132578 AFA0002C */        sw $zero, 0x2c($sp)
  /* 171D9C 8013257C AFA00034 */        sw $zero, 0x34($sp)
  /* 171DA0 80132580 24040401 */     addiu $a0, $zero, 0x401
  /* 171DA4 80132584 00002825 */        or $a1, $zero, $zero
  /* 171DA8 80132588 24060010 */     addiu $a2, $zero, 0x10
  /* 171DAC 8013258C 0C002E4F */       jal func_8000B93C
  /* 171DB0 80132590 3C078000 */       lui $a3, 0x8000
  /* 171DB4 80132594 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 171DB8 80132598 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 171DBC 8013259C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 171DC0 801325A0 8C430074 */        lw $v1, 0x74($v0)
  /* 171DC4 801325A4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 171DC8 801325A8 44050000 */      mfc1 $a1, $f0
  /* 171DCC 801325AC 44060000 */      mfc1 $a2, $f0
  /* 171DD0 801325B0 3C07439B */       lui $a3, 0x439b
  /* 171DD4 801325B4 24640008 */     addiu $a0, $v1, 8
  /* 171DD8 801325B8 0C001C20 */       jal func_80007080
  /* 171DDC 801325BC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 171DE0 801325C0 8FBF003C */        lw $ra, 0x3c($sp)
  /* 171DE4 801325C4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 171DE8 801325C8 03E00008 */        jr $ra
  /* 171DEC 801325CC 00000000 */       nop

glabel mvOpeningMarioVsKirbyInitFramesElapsed
  /* 171DF0 801325D0 3C018013 */       lui $at, %hi(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171DF4 801325D4 03E00008 */        jr $ra
  /* 171DF8 801325D8 AC2029D0 */        sw $zero, %lo(gMvOpeningMarioVsKirbyFramesElapsed)($at)

glabel mvOpeningMarioVsKirbyMainProc
  /* 171DFC 801325DC 3C038013 */       lui $v1, %hi(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171E00 801325E0 246329D0 */     addiu $v1, $v1, %lo(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171E04 801325E4 8C6E0000 */        lw $t6, ($v1) # gMvOpeningMarioVsKirbyFramesElapsed + 0
  /* 171E08 801325E8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 171E0C 801325EC AFBF0014 */        sw $ra, 0x14($sp)
  /* 171E10 801325F0 25CF0001 */     addiu $t7, $t6, 1
  /* 171E14 801325F4 29E1000A */      slti $at, $t7, 0xa
  /* 171E18 801325F8 AFA40018 */        sw $a0, 0x18($sp)
  /* 171E1C 801325FC 14200026 */      bnez $at, .L80132698
  /* 171E20 80132600 AC6F0000 */        sw $t7, ($v1) # gMvOpeningMarioVsKirbyFramesElapsed + 0
  /* 171E24 80132604 3C068013 */       lui $a2, %hi(gMvOpeningMarioVsKirbyUnusedCounter)
  /* 171E28 80132608 24C629DC */     addiu $a2, $a2, %lo(gMvOpeningMarioVsKirbyUnusedCounter)
  /* 171E2C 8013260C 8CC20000 */        lw $v0, ($a2) # gMvOpeningMarioVsKirbyUnusedCounter + 0
  /* 171E30 80132610 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 171E34 80132614 10400002 */      beqz $v0, .L80132620
  /* 171E38 80132618 2459FFFF */     addiu $t9, $v0, -1
  /* 171E3C 8013261C ACD90000 */        sw $t9, ($a2) # gMvOpeningMarioVsKirbyUnusedCounter + 0
  .L80132620:
  /* 171E40 80132620 0C0E4281 */       jal func_ovl1_80390A04
  /* 171E44 80132624 2405000F */     addiu $a1, $zero, 0xf
  /* 171E48 80132628 10400006 */      beqz $v0, .L80132644
  /* 171E4C 8013262C 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 171E50 80132630 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 171E54 80132634 2405000F */     addiu $a1, $zero, 0xf
  /* 171E58 80132638 10400002 */      beqz $v0, .L80132644
  /* 171E5C 8013263C 3C018013 */       lui $at, %hi(gMvOpeningMarioVsKirbyUnusedCounter)
  /* 171E60 80132640 AC2029DC */        sw $zero, %lo(gMvOpeningMarioVsKirbyUnusedCounter)($at)
  .L80132644:
  /* 171E64 80132644 0C0E41DB */       jal func_ovl1_8039076C
  /* 171E68 80132648 3404D000 */       ori $a0, $zero, 0xd000
  /* 171E6C 8013264C 10400007 */      beqz $v0, .L8013266C
  /* 171E70 80132650 24090001 */     addiu $t1, $zero, 1
  /* 171E74 80132654 3C02800A */       lui $v0, %hi(gSceneData)
  /* 171E78 80132658 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 171E7C 8013265C 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 171E80 80132660 A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 171E84 80132664 0C00171D */       jal func_80005C74
  /* 171E88 80132668 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  .L8013266C:
  /* 171E8C 8013266C 3C0A8013 */       lui $t2, %hi(gMvOpeningMarioVsKirbyFramesElapsed)
  /* 171E90 80132670 8D4A29D0 */        lw $t2, %lo(gMvOpeningMarioVsKirbyFramesElapsed)($t2)
  /* 171E94 80132674 3C02800A */       lui $v0, %hi(gSceneData)
  /* 171E98 80132678 24010140 */     addiu $at, $zero, 0x140
  /* 171E9C 8013267C 15410006 */       bne $t2, $at, .L80132698
  /* 171EA0 80132680 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 171EA4 80132684 904B0000 */       lbu $t3, ($v0) # gSceneData + 0
  /* 171EA8 80132688 240C002B */     addiu $t4, $zero, 0x2b
  /* 171EAC 8013268C A04C0000 */        sb $t4, ($v0) # gSceneData + 0
  /* 171EB0 80132690 0C00171D */       jal func_80005C74
  /* 171EB4 80132694 A04B0001 */        sb $t3, 1($v0) # gSceneData + 1
  .L80132698:
  /* 171EB8 80132698 8FBF0014 */        lw $ra, 0x14($sp)
  /* 171EBC 8013269C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 171EC0 801326A0 03E00008 */        jr $ra
  /* 171EC4 801326A4 00000000 */       nop

glabel mvOpeningMarioVsKirbyInit
  /* 171EC8 801326A8 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 171ECC 801326AC 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 171ED0 801326B0 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 171ED4 801326B4 3C188013 */       lui $t8, %hi(D_ovl47_801329E0)
  /* 171ED8 801326B8 3C088013 */       lui $t0, %hi(D_ovl47_80132B60)
  /* 171EDC 801326BC AFBF001C */        sw $ra, 0x1c($sp)
  /* 171EE0 801326C0 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 171EE4 801326C4 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 171EE8 801326C8 271829E0 */     addiu $t8, $t8, %lo(D_ovl47_801329E0)
  /* 171EEC 801326CC 24190030 */     addiu $t9, $zero, 0x30
  /* 171EF0 801326D0 25082B60 */     addiu $t0, $t0, %lo(D_ovl47_80132B60)
  /* 171EF4 801326D4 24090007 */     addiu $t1, $zero, 7
  /* 171EF8 801326D8 AFAE002C */        sw $t6, 0x2c($sp)
  /* 171EFC 801326DC AFAF0030 */        sw $t7, 0x30($sp)
  /* 171F00 801326E0 AFA00034 */        sw $zero, 0x34($sp)
  /* 171F04 801326E4 AFA00038 */        sw $zero, 0x38($sp)
  /* 171F08 801326E8 AFB8003C */        sw $t8, 0x3c($sp)
  /* 171F0C 801326EC AFB90040 */        sw $t9, 0x40($sp)
  /* 171F10 801326F0 AFA80044 */        sw $t0, 0x44($sp)
  /* 171F14 801326F4 AFA90048 */        sw $t1, 0x48($sp)
  /* 171F18 801326F8 0C0337DE */       jal rdManagerInitSetup
  /* 171F1C 801326FC 27A4002C */     addiu $a0, $sp, 0x2c
  /* 171F20 80132700 3C048013 */       lui $a0, %hi(D_ovl47_801328D0)
  /* 171F24 80132704 248428D0 */     addiu $a0, $a0, %lo(D_ovl47_801328D0)
  /* 171F28 80132708 0C0337BB */       jal rdManagerGetAllocSize
  /* 171F2C 8013270C 24050002 */     addiu $a1, $zero, 2
  /* 171F30 80132710 00402025 */        or $a0, $v0, $zero
  /* 171F34 80132714 0C001260 */       jal gsMemoryAlloc
  /* 171F38 80132718 24050010 */     addiu $a1, $zero, 0x10
  /* 171F3C 8013271C 3C048013 */       lui $a0, %hi(D_ovl47_801328D0)
  /* 171F40 80132720 3C068013 */       lui $a2, %hi(D_ovl47_80132B98)
  /* 171F44 80132724 24C62B98 */     addiu $a2, $a2, %lo(D_ovl47_80132B98)
  /* 171F48 80132728 248428D0 */     addiu $a0, $a0, %lo(D_ovl47_801328D0)
  /* 171F4C 8013272C 24050002 */     addiu $a1, $zero, 2
  /* 171F50 80132730 0C033781 */       jal rdManagerLoadFiles
  /* 171F54 80132734 00403825 */        or $a3, $v0, $zero
  /* 171F58 80132738 3C058013 */       lui $a1, %hi(mvOpeningMarioVsKirbyMainProc)
  /* 171F5C 8013273C 24A525DC */     addiu $a1, $a1, %lo(mvOpeningMarioVsKirbyMainProc)
  /* 171F60 80132740 00002025 */        or $a0, $zero, $zero
  /* 171F64 80132744 00003025 */        or $a2, $zero, $zero
  /* 171F68 80132748 0C00265A */       jal omMakeGObjSPAfter
  /* 171F6C 8013274C 3C078000 */       lui $a3, 0x8000
  /* 171F70 80132750 240A00FF */     addiu $t2, $zero, 0xff
  /* 171F74 80132754 AFAA0010 */        sw $t2, 0x10($sp)
  /* 171F78 80132758 00002025 */        or $a0, $zero, $zero
  /* 171F7C 8013275C 3C058000 */       lui $a1, 0x8000
  /* 171F80 80132760 24060064 */     addiu $a2, $zero, 0x64
  /* 171F84 80132764 0C002E7F */       jal func_8000B9FC
  /* 171F88 80132768 24070003 */     addiu $a3, $zero, 3
  /* 171F8C 8013276C 0C045624 */       jal func_ovl2_80115890
  /* 171F90 80132770 00000000 */       nop
  /* 171F94 80132774 0C04C974 */       jal mvOpeningMarioVsKirbyInitFramesElapsed
  /* 171F98 80132778 00000000 */       nop
  /* 171F9C 8013277C 0C03F4C0 */       jal efManager_AllocUserData
  /* 171FA0 80132780 00000000 */       nop
  /* 171FA4 80132784 24040001 */     addiu $a0, $zero, 1
  /* 171FA8 80132788 0C035C65 */       jal ftManagerAllocFighter
  /* 171FAC 8013278C 24050002 */     addiu $a1, $zero, 2
  /* 171FB0 80132790 0C035E1B */       jal ftManagerSetupDataKind
  /* 171FB4 80132794 00002025 */        or $a0, $zero, $zero
  /* 171FB8 80132798 0C035E1B */       jal ftManagerSetupDataKind
  /* 171FBC 8013279C 24040008 */     addiu $a0, $zero, 8
  /* 171FC0 801327A0 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 171FC4 801327A4 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 171FC8 801327A8 0C001260 */       jal gsMemoryAlloc
  /* 171FCC 801327AC 24050010 */     addiu $a1, $zero, 0x10
  /* 171FD0 801327B0 3C018013 */       lui $at, %hi(gMvOpeningMarioVsKirbyAnimHeapMario)
  /* 171FD4 801327B4 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 171FD8 801327B8 AC2229C8 */        sw $v0, %lo(gMvOpeningMarioVsKirbyAnimHeapMario)($at)
  /* 171FDC 801327BC 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 171FE0 801327C0 0C001260 */       jal gsMemoryAlloc
  /* 171FE4 801327C4 24050010 */     addiu $a1, $zero, 0x10
  /* 171FE8 801327C8 3C018013 */       lui $at, %hi(gMvOpeningMarioVsKirbyAnimHeapKirby)
  /* 171FEC 801327CC 0C04C90B */       jal mvOpeningMarioVsKirbyCreateMainViewport
  /* 171FF0 801327D0 AC2229CC */        sw $v0, %lo(gMvOpeningMarioVsKirbyAnimHeapKirby)($at)
  /* 171FF4 801327D4 0C04C94C */       jal mvOpeningMarioVsKirbyCreateBackgroundViewport
  /* 171FF8 801327D8 00000000 */       nop
  /* 171FFC 801327DC 0C04C8E1 */       jal mvOpeningMarioVsKirbyCreateLightningFlashViewport
  /* 172000 801327E0 00000000 */       nop
  /* 172004 801327E4 0C04C7F2 */       jal mvOpeningMarioVsKirbyCreateBackground
  /* 172008 801327E8 00000000 */       nop
  /* 17200C 801327EC 0C04C700 */       jal mvOpeningMarioVsKirbyCreateFighters
  /* 172010 801327F0 00000000 */       nop
  /* 172014 801327F4 0C04C6D6 */       jal mvOpeningMarioVsKirbyCreateStageGeometry
  /* 172018 801327F8 00000000 */       nop
  /* 17201C 801327FC 0C04C830 */       jal mvOpeningMarioVsKirbyCreateLightning
  /* 172020 80132800 00000000 */       nop
  /* 172024 80132804 0C04C8CE */       jal mvOpeningMarioVsKirbyCreateLightningFlash
  /* 172028 80132808 00000000 */       nop
  /* 17202C 8013280C 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 172030 80132810 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 172034 80132814 240B00FF */     addiu $t3, $zero, 0xff
  /* 172038 80132818 240C00FF */     addiu $t4, $zero, 0xff
  /* 17203C 8013281C AFAC0014 */        sw $t4, 0x14($sp)
  /* 172040 80132820 AFAB0010 */        sw $t3, 0x10($sp)
  /* 172044 80132824 240600FF */     addiu $a2, $zero, 0xff
  /* 172048 80132828 240700FF */     addiu $a3, $zero, 0xff
  /* 17204C 8013282C 0C0E4138 */       jal func_ovl1_803904E0
  /* 172050 80132830 46006386 */     mov.s $f14, $f12
  /* 172054 80132834 0C00024B */       jal func_8000092C
  /* 172058 80132838 00000000 */       nop
  /* 17205C 8013283C 2C410E1A */     sltiu $at, $v0, 0xe1a
  /* 172060 80132840 50200007 */      beql $at, $zero, .L80132860
  /* 172064 80132844 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132848:
  /* 172068 80132848 0C00024B */       jal func_8000092C
  /* 17206C 8013284C 00000000 */       nop
  /* 172070 80132850 2C410E1A */     sltiu $at, $v0, 0xe1a
  /* 172074 80132854 1420FFFC */      bnez $at, .L80132848
  /* 172078 80132858 00000000 */       nop
  /* 17207C 8013285C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132860:
  /* 172080 80132860 27BD0050 */     addiu $sp, $sp, 0x50
  /* 172084 80132864 03E00008 */        jr $ra
  /* 172088 80132868 00000000 */       nop

glabel intro_mario_vs_kirby_entry
  /* 17208C 8013286C 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 172090 80132870 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 172094 80132874 3C048013 */       lui $a0, %hi(D_ovl47_80132908)
  /* 172098 80132878 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 17209C 8013287C 24842908 */     addiu $a0, $a0, %lo(D_ovl47_80132908)
  /* 1720A0 80132880 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1720A4 80132884 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 1720A8 80132888 0C001C09 */       jal func_80007024
  /* 1720AC 8013288C AC8F000C */        sw $t7, 0xc($a0) # D_ovl47_80132908 + 12
  /* 1720B0 80132890 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 1720B4 80132894 3C198013 */       lui $t9, %hi(D_NF_80132BA0)
  /* 1720B8 80132898 3C048013 */       lui $a0, %hi(D_ovl47_80132924)
  /* 1720BC 8013289C 27392BA0 */     addiu $t9, $t9, %lo(D_NF_80132BA0)
  /* 1720C0 801328A0 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 1720C4 801328A4 24842924 */     addiu $a0, $a0, %lo(D_ovl47_80132924)
  /* 1720C8 801328A8 03194023 */      subu $t0, $t8, $t9
  /* 1720CC 801328AC 0C001A0F */       jal gsGTLSceneInit
  /* 1720D0 801328B0 AC880010 */        sw $t0, 0x10($a0) # D_ovl47_80132924 + 16
  /* 1720D4 801328B4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1720D8 801328B8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1720DC 801328BC 03E00008 */        jr $ra
  /* 1720E0 801328C0 00000000 */       nop

  /* 1720E4 801328C4 00000000 */       nop
  /* 1720E8 801328C8 00000000 */       nop
  /* 1720EC 801328CC 00000000 */       nop

# Likely start of new file
#glabel D_ovl47_801328D0   # Routine parsed as data
#  /* 1720F0 801328D0 00000045 */       lsa $zero, $zero, $zero, 2
#  /* 1720F4 801328D4 00000046 */     rotrv $zero, $zero, $zero
#  /* 1720F8 801328D8 20202000 */      addi $zero, $at, 0x2000
#  /* 1720FC 801328DC 20202000 */      addi $zero, $at, 0x2000
#  /* 172100 801328E0 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 172104 801328E4 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 172108 801328E8 14141400 */       bne $zero, $s4, 0x801378ec # branch target not found
#  /* 17210C 801328EC 00000000 */       nop
#  /* 172110 801328F0 20202000 */      addi $zero, $at, 0x2000
#  /* 172114 801328F4 20202000 */      addi $zero, $at, 0x2000
#  /* 172118 801328F8 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 17211C 801328FC FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 172120 80132900 00140000 */       sll $zero, $s4, 0
#  /* 172124 80132904 00000000 */       nop
#glabel D_ovl47_80132908   # Routine parsed as data
#  /* 172128 80132908 80392A00 */        lb $t9, 0x2a00($at)
#  /* 17212C 8013290C 803B6900 */        lb $k1, 0x6900($at)
#  /* 172130 80132910 803DA800 */        lb $sp, -0x5800($at)
#  /* 172134 80132914 00000000 */       nop
#  /* 172138 80132918 00000140 */     pause
#  /* 17213C 8013291C 000000F0 */       tge $zero, $zero, 3
