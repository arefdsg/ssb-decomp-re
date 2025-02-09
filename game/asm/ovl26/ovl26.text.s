.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x8013B3A0

  /* 12FD80 80131B00 00000000 */       nop
  /* 12FD84 80131B04 00000000 */       nop
  /* 12FD88 80131B08 00000000 */       nop
  /* 12FD8C 80131B0C 00000000 */       nop
# Maybe start of new file
  /* 12FD90 80131B10 00000000 */       nop
  /* 12FD94 80131B14 00000000 */       nop
  /* 12FD98 80131B18 00000000 */       nop
  /* 12FD9C 80131B1C 00000000 */       nop
# Maybe start of new file
glabel mnBattleSetupDisplayList
  /* 12FDA0 80131B20 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 12FDA4 80131B24 AFBF0014 */        sw $ra, 0x14($sp)
  /* 12FDA8 80131B28 8C830000 */        lw $v1, ($a0)
  /* 12FDAC 80131B2C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 12FDB0 80131B30 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 12FDB4 80131B34 246E0008 */     addiu $t6, $v1, 8
  /* 12FDB8 80131B38 AC8E0000 */        sw $t6, ($a0)
  /* 12FDBC 80131B3C 3C180002 */       lui $t8, 2
  /* 12FDC0 80131B40 AC780004 */        sw $t8, 4($v1)
  /* 12FDC4 80131B44 AC6F0000 */        sw $t7, ($v1)
  /* 12FDC8 80131B48 0C0E4147 */       jal func_ovl1_8039051C
  /* 12FDCC 80131B4C AFA40028 */        sw $a0, 0x28($sp)
  /* 12FDD0 80131B50 0C0E414A */       jal func_ovl1_80390528
  /* 12FDD4 80131B54 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 12FDD8 80131B58 44060000 */      mfc1 $a2, $f0
  /* 12FDDC 80131B5C 8FA40028 */        lw $a0, 0x28($sp)
  /* 12FDE0 80131B60 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 12FDE4 80131B64 8FA5001C */        lw $a1, 0x1c($sp)
  /* 12FDE8 80131B68 8FBF0014 */        lw $ra, 0x14($sp)
  /* 12FDEC 80131B6C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 12FDF0 80131B70 03E00008 */        jr $ra
  /* 12FDF4 80131B74 00000000 */       nop

glabel mnBattleGetShade
  /* 12FDF8 80131B78 3C028014 */       lui $v0, %hi(gMNBattleIsTeamBattle)
  /* 12FDFC 80131B7C 8C42BDA8 */        lw $v0, %lo(gMNBattleIsTeamBattle)($v0)
  /* 12FE00 80131B80 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 12FE04 80131B84 00802825 */        or $a1, $a0, $zero
  /* 12FE08 80131B88 14400003 */      bnez $v0, .L80131B98
  /* 12FE0C 80131B8C 27A40010 */     addiu $a0, $sp, 0x10
  /* 12FE10 80131B90 10000036 */         b .L80131C6C
  /* 12FE14 80131B94 00001025 */        or $v0, $zero, $zero
  .L80131B98:
  /* 12FE18 80131B98 27A30020 */     addiu $v1, $sp, 0x20
  .L80131B9C:
  /* 12FE1C 80131B9C 24840004 */     addiu $a0, $a0, 4
  /* 12FE20 80131BA0 0083082B */      sltu $at, $a0, $v1
  /* 12FE24 80131BA4 1420FFFD */      bnez $at, .L80131B9C
  /* 12FE28 80131BA8 AC80FFFC */        sw $zero, -4($a0)
  /* 12FE2C 80131BAC 24060001 */     addiu $a2, $zero, 1
  /* 12FE30 80131BB0 14C2002E */       bne $a2, $v0, .L80131C6C
  /* 12FE34 80131BB4 00001825 */        or $v1, $zero, $zero
  /* 12FE38 80131BB8 3C078014 */       lui $a3, %hi(gMNBattlePanels)
  /* 12FE3C 80131BBC 24E7BA88 */     addiu $a3, $a3, %lo(gMNBattlePanels)
  /* 12FE40 80131BC0 27A90010 */     addiu $t1, $sp, 0x10
  /* 12FE44 80131BC4 240800BC */     addiu $t0, $zero, 0xbc
  .L80131BC8:
  /* 12FE48 80131BC8 50A30014 */      beql $a1, $v1, .L80131C1C
  /* 12FE4C 80131BCC 24630001 */     addiu $v1, $v1, 1
  /* 12FE50 80131BD0 00A80019 */     multu $a1, $t0
  /* 12FE54 80131BD4 00007012 */      mflo $t6
  /* 12FE58 80131BD8 00EE1021 */      addu $v0, $a3, $t6
  /* 12FE5C 80131BDC 8C580048 */        lw $t8, 0x48($v0)
  /* 12FE60 80131BE0 00680019 */     multu $v1, $t0
  /* 12FE64 80131BE4 00007812 */      mflo $t7
  /* 12FE68 80131BE8 00EF2021 */      addu $a0, $a3, $t7
  /* 12FE6C 80131BEC 8C990048 */        lw $t9, 0x48($a0)
  /* 12FE70 80131BF0 5719000A */      bnel $t8, $t9, .L80131C1C
  /* 12FE74 80131BF4 24630001 */     addiu $v1, $v1, 1
  /* 12FE78 80131BF8 8C4A0040 */        lw $t2, 0x40($v0)
  /* 12FE7C 80131BFC 8C8B0040 */        lw $t3, 0x40($a0)
  /* 12FE80 80131C00 554B0006 */      bnel $t2, $t3, .L80131C1C
  /* 12FE84 80131C04 24630001 */     addiu $v1, $v1, 1
  /* 12FE88 80131C08 8C8C0050 */        lw $t4, 0x50($a0)
  /* 12FE8C 80131C0C 000C6880 */       sll $t5, $t4, 2
  /* 12FE90 80131C10 012D7021 */      addu $t6, $t1, $t5
  /* 12FE94 80131C14 ADC60000 */        sw $a2, ($t6)
  /* 12FE98 80131C18 24630001 */     addiu $v1, $v1, 1
  .L80131C1C:
  /* 12FE9C 80131C1C 28610004 */      slti $at, $v1, 4
  /* 12FEA0 80131C20 1420FFE9 */      bnez $at, .L80131BC8
  /* 12FEA4 80131C24 00000000 */       nop
  /* 12FEA8 80131C28 8FAF0010 */        lw $t7, 0x10($sp)
  /* 12FEAC 80131C2C 8FB80014 */        lw $t8, 0x14($sp)
  /* 12FEB0 80131C30 15E00003 */      bnez $t7, .L80131C40
  /* 12FEB4 80131C34 00000000 */       nop
  /* 12FEB8 80131C38 1000000C */         b .L80131C6C
  /* 12FEBC 80131C3C 00001025 */        or $v0, $zero, $zero
  .L80131C40:
  /* 12FEC0 80131C40 17000003 */      bnez $t8, .L80131C50
  /* 12FEC4 80131C44 8FB90018 */        lw $t9, 0x18($sp)
  /* 12FEC8 80131C48 10000008 */         b .L80131C6C
  /* 12FECC 80131C4C 24020001 */     addiu $v0, $zero, 1
  .L80131C50:
  /* 12FED0 80131C50 17200003 */      bnez $t9, .L80131C60
  /* 12FED4 80131C54 8FAA001C */        lw $t2, 0x1c($sp)
  /* 12FED8 80131C58 10000004 */         b .L80131C6C
  /* 12FEDC 80131C5C 24020002 */     addiu $v0, $zero, 2
  .L80131C60:
  /* 12FEE0 80131C60 15400002 */      bnez $t2, .L80131C6C
  /* 12FEE4 80131C64 00000000 */       nop
  /* 12FEE8 80131C68 24020003 */     addiu $v0, $zero, 3
  .L80131C6C:
  /* 12FEEC 80131C6C 03E00008 */        jr $ra
  /* 12FEF0 80131C70 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBattleSelectCharWithToken
  /* 12FEF4 80131C74 240300BC */     addiu $v1, $zero, 0xbc
  /* 12FEF8 80131C78 00830019 */     multu $a0, $v1
  /* 12FEFC 80131C7C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 12FF00 80131C80 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 12FF04 80131C84 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 12FF08 80131C88 AFBF001C */        sw $ra, 0x1c($sp)
  /* 12FF0C 80131C8C AFB10018 */        sw $s1, 0x18($sp)
  /* 12FF10 80131C90 AFB00014 */        sw $s0, 0x14($sp)
  /* 12FF14 80131C94 AFA40030 */        sw $a0, 0x30($sp)
  /* 12FF18 80131C98 24010004 */     addiu $at, $zero, 4
  /* 12FF1C 80131C9C 00007812 */      mflo $t7
  /* 12FF20 80131CA0 004FC021 */      addu $t8, $v0, $t7
  /* 12FF24 80131CA4 AFB80024 */        sw $t8, 0x24($sp)
  /* 12FF28 80131CA8 10A1001C */       beq $a1, $at, .L80131D1C
  /* 12FF2C 80131CAC 8F110080 */        lw $s1, 0x80($t8)
  /* 12FF30 80131CB0 02230019 */     multu $s1, $v1
  /* 12FF34 80131CB4 00004012 */      mflo $t0
  /* 12FF38 80131CB8 00488021 */      addu $s0, $v0, $t0
  /* 12FF3C 80131CBC 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 12FF40 80131CC0 8E040048 */        lw $a0, 0x48($s0)
  /* 12FF44 80131CC4 AFA20028 */        sw $v0, 0x28($sp)
  /* 12FF48 80131CC8 8E040048 */        lw $a0, 0x48($s0)
  /* 12FF4C 80131CCC 02202825 */        or $a1, $s1, $zero
  /* 12FF50 80131CD0 0C04D19D */       jal mnBattleIsCostumeInUse
  /* 12FF54 80131CD4 00403025 */        or $a2, $v0, $zero
  /* 12FF58 80131CD8 10400005 */      beqz $v0, .L80131CF0
  /* 12FF5C 80131CDC 00000000 */       nop
  /* 12FF60 80131CE0 0C009A70 */       jal func_800269C0
  /* 12FF64 80131CE4 240400A5 */     addiu $a0, $zero, 0xa5
  /* 12FF68 80131CE8 10000032 */         b .L80131DB4
  /* 12FF6C 80131CEC 8FBF001C */        lw $ra, 0x1c($sp)
  .L80131CF0:
  /* 12FF70 80131CF0 0C04C6DE */       jal mnBattleGetShade
  /* 12FF74 80131CF4 02202025 */        or $a0, $s1, $zero
  /* 12FF78 80131CF8 8FA50028 */        lw $a1, 0x28($sp)
  /* 12FF7C 80131CFC AE020050 */        sw $v0, 0x50($s0)
  /* 12FF80 80131D00 8E040008 */        lw $a0, 8($s0)
  /* 12FF84 80131D04 00403025 */        or $a2, $v0, $zero
  /* 12FF88 80131D08 0C03A492 */       jal func_ovl2_800E9248
  /* 12FF8C 80131D0C AE05004C */        sw $a1, 0x4c($s0)
  /* 12FF90 80131D10 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 12FF94 80131D14 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 12FF98 80131D18 240300BC */     addiu $v1, $zero, 0xbc
  .L80131D1C:
  /* 12FF9C 80131D1C 02230019 */     multu $s1, $v1
  /* 12FFA0 80131D20 240A0001 */     addiu $t2, $zero, 1
  /* 12FFA4 80131D24 8FA40030 */        lw $a0, 0x30($sp)
  /* 12FFA8 80131D28 02202825 */        or $a1, $s1, $zero
  /* 12FFAC 80131D2C 00004812 */      mflo $t1
  /* 12FFB0 80131D30 00498021 */      addu $s0, $v0, $t1
  /* 12FFB4 80131D34 0C04DCE4 */       jal mnBattleReorderCursorsOnPlacement
  /* 12FFB8 80131D38 AE0A0058 */        sw $t2, 0x58($s0)
  /* 12FFBC 80131D3C 8FA30024 */        lw $v1, 0x24($sp)
  /* 12FFC0 80131D40 240B0004 */     addiu $t3, $zero, 4
  /* 12FFC4 80131D44 AE0B007C */        sw $t3, 0x7c($s0)
  /* 12FFC8 80131D48 240C0002 */     addiu $t4, $zero, 2
  /* 12FFCC 80131D4C 8FA50030 */        lw $a1, 0x30($sp)
  /* 12FFD0 80131D50 24060002 */     addiu $a2, $zero, 2
  /* 12FFD4 80131D54 AC6C0054 */        sw $t4, 0x54($v1)
  /* 12FFD8 80131D58 0C04D355 */       jal mnBattleRedrawCursor
  /* 12FFDC 80131D5C 8C640000 */        lw $a0, ($v1)
  /* 12FFE0 80131D60 8FAE0024 */        lw $t6, 0x24($sp)
  /* 12FFE4 80131D64 240DFFFF */     addiu $t5, $zero, -1
  /* 12FFE8 80131D68 240F0001 */     addiu $t7, $zero, 1
  /* 12FFEC 80131D6C ADCD0080 */        sw $t5, 0x80($t6)
  /* 12FFF0 80131D70 AE0F0088 */        sw $t7, 0x88($s0)
  /* 12FFF4 80131D74 8FA40030 */        lw $a0, 0x30($sp)
  /* 12FFF8 80131D78 0C04D9FC */       jal mnBattleAnnounceFighter
  /* 12FFFC 80131D7C 02202825 */        or $a1, $s1, $zero
  /* 130000 80131D80 0C04DC52 */       jal func_ovl26_80137148
  /* 130004 80131D84 00000000 */       nop
  /* 130008 80131D88 14400005 */      bnez $v0, .L80131DA0
  /* 13000C 80131D8C 00000000 */       nop
  /* 130010 80131D90 8E180084 */        lw $t8, 0x84($s0)
  /* 130014 80131D94 24010001 */     addiu $at, $zero, 1
  /* 130018 80131D98 17010003 */       bne $t8, $at, .L80131DA8
  /* 13001C 80131D9C 00000000 */       nop
  .L80131DA0:
  /* 130020 80131DA0 0C04DC01 */       jal func_ovl26_80137004
  /* 130024 80131DA4 02202025 */        or $a0, $s1, $zero
  .L80131DA8:
  /* 130028 80131DA8 0C04D91F */       jal mnBattleCreateWhiteSquare
  /* 13002C 80131DAC 02202025 */        or $a0, $s1, $zero
  /* 130030 80131DB0 8FBF001C */        lw $ra, 0x1c($sp)
  .L80131DB4:
  /* 130034 80131DB4 8FB00014 */        lw $s0, 0x14($sp)
  /* 130038 80131DB8 8FB10018 */        lw $s1, 0x18($sp)
  /* 13003C 80131DBC 03E00008 */        jr $ra
  /* 130040 80131DC0 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleGetNextPortraitX
  /* 130044 80131DC4 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 130048 80131DC8 3C0E8014 */       lui $t6, %hi(dMNBattlePortraitPositionsX)
  /* 13004C 80131DCC 27A30040 */     addiu $v1, $sp, 0x40
  /* 130050 80131DD0 44856000 */      mtc1 $a1, $f12
  /* 130054 80131DD4 25CEB3F0 */     addiu $t6, $t6, %lo(dMNBattlePortraitPositionsX)
  /* 130058 80131DD8 27A50010 */     addiu $a1, $sp, 0x10
  /* 13005C 80131DDC 25C80030 */     addiu $t0, $t6, 0x30
  /* 130060 80131DE0 0060C825 */        or $t9, $v1, $zero
  .L80131DE4:
  /* 130064 80131DE4 8DD80000 */        lw $t8, ($t6) # dMNBattlePortraitPositionsX + 0
  /* 130068 80131DE8 25CE000C */     addiu $t6, $t6, 0xc
  /* 13006C 80131DEC 2739000C */     addiu $t9, $t9, 0xc
  /* 130070 80131DF0 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 130074 80131DF4 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattlePortraitPositionsX + -8
  /* 130078 80131DF8 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13007C 80131DFC 8DD8FFFC */        lw $t8, -4($t6) # dMNBattlePortraitPositionsX + -4
  /* 130080 80131E00 15C8FFF8 */       bne $t6, $t0, .L80131DE4
  /* 130084 80131E04 AF38FFFC */        sw $t8, -4($t9)
  /* 130088 80131E08 3C098014 */       lui $t1, %hi(dMNBattlePortraitVelocities)
  /* 13008C 80131E0C 2529B420 */     addiu $t1, $t1, %lo(dMNBattlePortraitVelocities)
  /* 130090 80131E10 252D0030 */     addiu $t5, $t1, 0x30
  /* 130094 80131E14 00A06025 */        or $t4, $a1, $zero
  .L80131E18:
  /* 130098 80131E18 8D2B0000 */        lw $t3, ($t1) # dMNBattlePortraitVelocities + 0
  /* 13009C 80131E1C 2529000C */     addiu $t1, $t1, 0xc
  /* 1300A0 80131E20 258C000C */     addiu $t4, $t4, 0xc
  /* 1300A4 80131E24 AD8BFFF4 */        sw $t3, -0xc($t4)
  /* 1300A8 80131E28 8D2AFFF8 */        lw $t2, -8($t1) # dMNBattlePortraitVelocities + -8
  /* 1300AC 80131E2C AD8AFFF8 */        sw $t2, -8($t4)
  /* 1300B0 80131E30 8D2BFFFC */        lw $t3, -4($t1) # dMNBattlePortraitVelocities + -4
  /* 1300B4 80131E34 152DFFF8 */       bne $t1, $t5, .L80131E18
  /* 1300B8 80131E38 AD8BFFFC */        sw $t3, -4($t4)
  /* 1300BC 80131E3C 00041080 */       sll $v0, $a0, 2
  /* 1300C0 80131E40 00624021 */      addu $t0, $v1, $v0
  /* 1300C4 80131E44 C5000000 */      lwc1 $f0, ($t0)
  /* 1300C8 80131E48 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1300CC 80131E4C 46006032 */    c.eq.s $f12, $f0
  /* 1300D0 80131E50 00000000 */       nop
  /* 1300D4 80131E54 45020005 */     bc1fl .L80131E6C
  /* 1300D8 80131E58 460C003C */    c.lt.s $f0, $f12
  /* 1300DC 80131E5C 44810000 */      mtc1 $at, $f0 # -1.0 to cop1
  /* 1300E0 80131E60 1000001B */         b .L80131ED0
  /* 1300E4 80131E64 00000000 */       nop
  /* 1300E8 80131E68 460C003C */    c.lt.s $f0, $f12
  .L80131E6C:
  /* 1300EC 80131E6C 00A27021 */      addu $t6, $a1, $v0
  /* 1300F0 80131E70 00A2C821 */      addu $t9, $a1, $v0
  /* 1300F4 80131E74 4502000D */     bc1fl .L80131EAC
  /* 1300F8 80131E78 C7260000 */      lwc1 $f6, ($t9)
  /* 1300FC 80131E7C C5C40000 */      lwc1 $f4, ($t6) # dMNBattlePortraitPositionsX + 0
  /* 130100 80131E80 46046080 */     add.s $f2, $f12, $f4
  /* 130104 80131E84 4600103E */    c.le.s $f2, $f0
  /* 130108 80131E88 00000000 */       nop
  /* 13010C 80131E8C 45020004 */     bc1fl .L80131EA0
  /* 130110 80131E90 46001306 */     mov.s $f12, $f2
  /* 130114 80131E94 1000000E */         b .L80131ED0
  /* 130118 80131E98 00000000 */       nop
  /* 13011C 80131E9C 46001306 */     mov.s $f12, $f2
  .L80131EA0:
  /* 130120 80131EA0 1000000B */         b .L80131ED0
  /* 130124 80131EA4 46006006 */     mov.s $f0, $f12
  /* 130128 80131EA8 C7260000 */      lwc1 $f6, ($t9)
  .L80131EAC:
  /* 13012C 80131EAC 46066080 */     add.s $f2, $f12, $f6
  /* 130130 80131EB0 4602003E */    c.le.s $f0, $f2
  /* 130134 80131EB4 00000000 */       nop
  /* 130138 80131EB8 45020004 */     bc1fl .L80131ECC
  /* 13013C 80131EBC 46001306 */     mov.s $f12, $f2
  /* 130140 80131EC0 10000002 */         b .L80131ECC
  /* 130144 80131EC4 46000306 */     mov.s $f12, $f0
  /* 130148 80131EC8 46001306 */     mov.s $f12, $f2
  .L80131ECC:
  /* 13014C 80131ECC 46006006 */     mov.s $f0, $f12
  .L80131ED0:
  /* 130150 80131ED0 03E00008 */        jr $ra
  /* 130154 80131ED4 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnBattleCheckFighterIsXBoxed
  /* 130158 80131ED8 AFA40000 */        sw $a0, ($sp)
  /* 13015C 80131EDC 03E00008 */        jr $ra
  /* 130160 80131EE0 00001025 */        or $v0, $zero, $zero

glabel mnBattleSetPortraitX
  /* 130164 80131EE4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 130168 80131EE8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13016C 80131EEC 8C820074 */        lw $v0, 0x74($a0)
  /* 130170 80131EF0 00803025 */        or $a2, $a0, $zero
  /* 130174 80131EF4 8C840084 */        lw $a0, 0x84($a0)
  /* 130178 80131EF8 8C450058 */        lw $a1, 0x58($v0)
  /* 13017C 80131EFC AFA60020 */        sw $a2, 0x20($sp)
  /* 130180 80131F00 0C04C771 */       jal mnBattleGetNextPortraitX
  /* 130184 80131F04 AFA20018 */        sw $v0, 0x18($sp)
  /* 130188 80131F08 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13018C 80131F0C 44812000 */      mtc1 $at, $f4 # -1.0 to cop1
  /* 130190 80131F10 8FA20018 */        lw $v0, 0x18($sp)
  /* 130194 80131F14 8FA60020 */        lw $a2, 0x20($sp)
  /* 130198 80131F18 46040032 */    c.eq.s $f0, $f4
  /* 13019C 80131F1C 00000000 */       nop
  /* 1301A0 80131F20 45030009 */     bc1tl .L80131F48
  /* 1301A4 80131F24 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1301A8 80131F28 8C430008 */        lw $v1, 8($v0)
  /* 1301AC 80131F2C E4400058 */      swc1 $f0, 0x58($v0)
  /* 1301B0 80131F30 50600005 */      beql $v1, $zero, .L80131F48
  /* 1301B4 80131F34 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1301B8 80131F38 8CCE0074 */        lw $t6, 0x74($a2)
  /* 1301BC 80131F3C C5C60058 */      lwc1 $f6, 0x58($t6)
  /* 1301C0 80131F40 E4660058 */      swc1 $f6, 0x58($v1)
  /* 1301C4 80131F44 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131F48:
  /* 1301C8 80131F48 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1301CC 80131F4C 03E00008 */        jr $ra
  /* 1301D0 80131F50 00000000 */       nop

glabel mnBattleInitializePortraitBackgroundPosition
  /* 1301D4 80131F54 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 1301D8 80131F58 3C0E8014 */       lui $t6, %hi(dMNBattlePortraitPositionsXY)
  /* 1301DC 80131F5C 27A30000 */     addiu $v1, $sp, 0
  /* 1301E0 80131F60 25CEB450 */     addiu $t6, $t6, %lo(dMNBattlePortraitPositionsXY)
  /* 1301E4 80131F64 25C80060 */     addiu $t0, $t6, 0x60
  /* 1301E8 80131F68 0060C825 */        or $t9, $v1, $zero
  .L80131F6C:
  /* 1301EC 80131F6C 8DD80000 */        lw $t8, ($t6) # dMNBattlePortraitPositionsXY + 0
  /* 1301F0 80131F70 25CE000C */     addiu $t6, $t6, 0xc
  /* 1301F4 80131F74 2739000C */     addiu $t9, $t9, 0xc
  /* 1301F8 80131F78 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1301FC 80131F7C 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattlePortraitPositionsXY + -8
  /* 130200 80131F80 AF2FFFF8 */        sw $t7, -8($t9)
  /* 130204 80131F84 8DD8FFFC */        lw $t8, -4($t6) # dMNBattlePortraitPositionsXY + -4
  /* 130208 80131F88 15C8FFF8 */       bne $t6, $t0, .L80131F6C
  /* 13020C 80131F8C AF38FFFC */        sw $t8, -4($t9)
  /* 130210 80131F90 000548C0 */       sll $t1, $a1, 3
  /* 130214 80131F94 00691021 */      addu $v0, $v1, $t1
  /* 130218 80131F98 C4440000 */      lwc1 $f4, ($v0)
  /* 13021C 80131F9C E4840058 */      swc1 $f4, 0x58($a0)
  /* 130220 80131FA0 C4460004 */      lwc1 $f6, 4($v0)
  /* 130224 80131FA4 27BD0060 */     addiu $sp, $sp, 0x60
  /* 130228 80131FA8 03E00008 */        jr $ra
  /* 13022C 80131FAC E486005C */      swc1 $f6, 0x5c($a0)

glabel mnBattleAddRedXBoxToPortrait
  /* 130230 80131FB0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 130234 80131FB4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 130238 80131FB8 AFA5002C */        sw $a1, 0x2c($sp)
  /* 13023C 80131FBC 8C820074 */        lw $v0, 0x74($a0)
  /* 130240 80131FC0 3C0E8014 */       lui $t6, %hi(D_ovl26_8013C4B4)
  /* 130244 80131FC4 8DCEC4B4 */        lw $t6, %lo(D_ovl26_8013C4B4)($t6)
  /* 130248 80131FC8 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13024C 80131FCC 3C0F0000 */       lui $t7, %hi(D_NF_000002B8)
  /* 130250 80131FD0 25EF02B8 */     addiu $t7, $t7, %lo(D_NF_000002B8)
  /* 130254 80131FD4 E7A40020 */      swc1 $f4, 0x20($sp)
  /* 130258 80131FD8 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 13025C 80131FDC 01CF2821 */      addu $a1, $t6, $t7
  /* 130260 80131FE0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130264 80131FE4 E7A6001C */      swc1 $f6, 0x1c($sp)
  /* 130268 80131FE8 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 13026C 80131FEC 44815000 */      mtc1 $at, $f10 # 4.0 to cop1
  /* 130270 80131FF0 C7A80020 */      lwc1 $f8, 0x20($sp)
  /* 130274 80131FF4 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 130278 80131FF8 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 13027C 80131FFC 460A4400 */     add.s $f16, $f8, $f10
  /* 130280 80132000 94580024 */       lhu $t8, 0x24($v0)
  /* 130284 80132004 240A00FF */     addiu $t2, $zero, 0xff
  /* 130288 80132008 E4500058 */      swc1 $f16, 0x58($v0)
  /* 13028C 8013200C C7B2001C */      lwc1 $f18, 0x1c($sp)
  /* 130290 80132010 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 130294 80132014 A4480024 */        sh $t0, 0x24($v0)
  /* 130298 80132018 46049180 */     add.s $f6, $f18, $f4
  /* 13029C 8013201C 35090001 */       ori $t1, $t0, 1
  /* 1302A0 80132020 A4490024 */        sh $t1, 0x24($v0)
  /* 1302A4 80132024 A04A0028 */        sb $t2, 0x28($v0)
  /* 1302A8 80132028 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1302AC 8013202C A0400029 */        sb $zero, 0x29($v0)
  /* 1302B0 80132030 A040002A */        sb $zero, 0x2a($v0)
  /* 1302B4 80132034 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1302B8 80132038 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1302BC 8013203C 03E00008 */        jr $ra
  /* 1302C0 80132040 00000000 */       nop

glabel mnBattleGetIsLocked
  /* 1302C4 80132044 24010004 */     addiu $at, $zero, 4
  /* 1302C8 80132048 10810026 */       beq $a0, $at, .L801320E4
  /* 1302CC 8013204C 3C0A8014 */       lui $t2, 0x8014
  /* 1302D0 80132050 24010007 */     addiu $at, $zero, 7
  /* 1302D4 80132054 1081001A */       beq $a0, $at, .L801320C0
  /* 1302D8 80132058 3C088014 */       lui $t0, 0x8014
  /* 1302DC 8013205C 2401000A */     addiu $at, $zero, 0xa
  /* 1302E0 80132060 1081000E */       beq $a0, $at, .L8013209C
  /* 1302E4 80132064 3C188014 */       lui $t8, 0x8014
  /* 1302E8 80132068 2401000B */     addiu $at, $zero, 0xb
  /* 1302EC 8013206C 14810026 */       bne $a0, $at, .L80132108
  /* 1302F0 80132070 00001025 */        or $v0, $zero, $zero
  /* 1302F4 80132074 3C0E8014 */       lui $t6, %hi(gMNBattleCharacterUnlockedMask)
  /* 1302F8 80132078 95CEBDBC */       lhu $t6, %lo(gMNBattleCharacterUnlockedMask)($t6)
  /* 1302FC 8013207C 24030001 */     addiu $v1, $zero, 1
  /* 130300 80132080 31CF0800 */      andi $t7, $t6, 0x800
  /* 130304 80132084 11E00003 */      beqz $t7, .L80132094
  /* 130308 80132088 00000000 */       nop
  /* 13030C 8013208C 03E00008 */        jr $ra
  /* 130310 80132090 00001025 */        or $v0, $zero, $zero

  .L80132094:
  /* 130314 80132094 03E00008 */        jr $ra
  /* 130318 80132098 00601025 */        or $v0, $v1, $zero

  .L8013209C:
  /* 13031C 8013209C 9718BDBC */       lhu $t8, -0x4244($t8)
  /* 130320 801320A0 24030001 */     addiu $v1, $zero, 1
  /* 130324 801320A4 33190400 */      andi $t9, $t8, 0x400
  /* 130328 801320A8 13200003 */      beqz $t9, .L801320B8
  /* 13032C 801320AC 00000000 */       nop
  /* 130330 801320B0 03E00008 */        jr $ra
  /* 130334 801320B4 00001025 */        or $v0, $zero, $zero

  .L801320B8:
  /* 130338 801320B8 03E00008 */        jr $ra
  /* 13033C 801320BC 00601025 */        or $v0, $v1, $zero

  .L801320C0:
  /* 130340 801320C0 9508BDBC */       lhu $t0, -0x4244($t0)
  /* 130344 801320C4 24030001 */     addiu $v1, $zero, 1
  /* 130348 801320C8 31090080 */      andi $t1, $t0, 0x80
  /* 13034C 801320CC 11200003 */      beqz $t1, .L801320DC
  /* 130350 801320D0 00000000 */       nop
  /* 130354 801320D4 03E00008 */        jr $ra
  /* 130358 801320D8 00001025 */        or $v0, $zero, $zero

  .L801320DC:
  /* 13035C 801320DC 03E00008 */        jr $ra
  /* 130360 801320E0 00601025 */        or $v0, $v1, $zero

  .L801320E4:
  /* 130364 801320E4 954ABDBC */       lhu $t2, -0x4244($t2)
  /* 130368 801320E8 24030001 */     addiu $v1, $zero, 1
  /* 13036C 801320EC 314B0010 */      andi $t3, $t2, 0x10
  /* 130370 801320F0 11600003 */      beqz $t3, .L80132100
  /* 130374 801320F4 00000000 */       nop
  /* 130378 801320F8 03E00008 */        jr $ra
  /* 13037C 801320FC 00001025 */        or $v0, $zero, $zero

  .L80132100:
  /* 130380 80132100 03E00008 */        jr $ra
  /* 130384 80132104 00601025 */        or $v0, $v1, $zero

  .L80132108:
  /* 130388 80132108 03E00008 */        jr $ra
  /* 13038C 8013210C 00000000 */       nop

  /* 130390 80132110 03E00008 */        jr $ra
  /* 130394 80132114 00000000 */       nop

glabel mnBattleGetFtKind
  /* 130398 80132118 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13039C 8013211C 3C0E8014 */       lui $t6, %hi(dMNBattleFtKindOrder)
  /* 1303A0 80132120 27A30000 */     addiu $v1, $sp, 0
  /* 1303A4 80132124 25CEB4D4 */     addiu $t6, $t6, %lo(dMNBattleFtKindOrder)
  /* 1303A8 80132128 25C80030 */     addiu $t0, $t6, 0x30
  /* 1303AC 8013212C 0060C825 */        or $t9, $v1, $zero
  .L80132130:
  /* 1303B0 80132130 8DD80000 */        lw $t8, ($t6) # dMNBattleFtKindOrder + 0
  /* 1303B4 80132134 25CE000C */     addiu $t6, $t6, 0xc
  /* 1303B8 80132138 2739000C */     addiu $t9, $t9, 0xc
  /* 1303BC 8013213C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1303C0 80132140 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattleFtKindOrder + -8
  /* 1303C4 80132144 AF2FFFF8 */        sw $t7, -8($t9)
  /* 1303C8 80132148 8DD8FFFC */        lw $t8, -4($t6) # dMNBattleFtKindOrder + -4
  /* 1303CC 8013214C 15C8FFF8 */       bne $t6, $t0, .L80132130
  /* 1303D0 80132150 AF38FFFC */        sw $t8, -4($t9)
  /* 1303D4 80132154 00044880 */       sll $t1, $a0, 2
  /* 1303D8 80132158 00695021 */      addu $t2, $v1, $t1
  /* 1303DC 8013215C 8D420000 */        lw $v0, ($t2)
  /* 1303E0 80132160 03E00008 */        jr $ra
  /* 1303E4 80132164 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleGetPortraitId
  /* 1303E8 80132168 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1303EC 8013216C 3C0E8014 */       lui $t6, %hi(dMNBattlePortraitOrder)
  /* 1303F0 80132170 27A30000 */     addiu $v1, $sp, 0
  /* 1303F4 80132174 25CEB504 */     addiu $t6, $t6, %lo(dMNBattlePortraitOrder)
  /* 1303F8 80132178 25C80030 */     addiu $t0, $t6, 0x30
  /* 1303FC 8013217C 0060C825 */        or $t9, $v1, $zero
  .L80132180:
  /* 130400 80132180 8DD80000 */        lw $t8, ($t6) # dMNBattlePortraitOrder + 0
  /* 130404 80132184 25CE000C */     addiu $t6, $t6, 0xc
  /* 130408 80132188 2739000C */     addiu $t9, $t9, 0xc
  /* 13040C 8013218C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 130410 80132190 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattlePortraitOrder + -8
  /* 130414 80132194 AF2FFFF8 */        sw $t7, -8($t9)
  /* 130418 80132198 8DD8FFFC */        lw $t8, -4($t6) # dMNBattlePortraitOrder + -4
  /* 13041C 8013219C 15C8FFF8 */       bne $t6, $t0, .L80132180
  /* 130420 801321A0 AF38FFFC */        sw $t8, -4($t9)
  /* 130424 801321A4 00044880 */       sll $t1, $a0, 2
  /* 130428 801321A8 00695021 */      addu $t2, $v1, $t1
  /* 13042C 801321AC 8D420000 */        lw $v0, ($t2)
  /* 130430 801321B0 03E00008 */        jr $ra
  /* 130434 801321B4 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleRenderPortraitWithNoise
  /* 130438 801321B8 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 13043C 801321BC 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 130440 801321C0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 130444 801321C4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 130448 801321C8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13044C 801321CC 244E0008 */     addiu $t6, $v0, 8
  /* 130450 801321D0 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 130454 801321D4 3C0FE700 */       lui $t7, 0xe700
  /* 130458 801321D8 AC4F0000 */        sw $t7, ($v0)
  /* 13045C 801321DC AC400004 */        sw $zero, 4($v0)
  /* 130460 801321E0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 130464 801321E4 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 130468 801321E8 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 13046C 801321EC 24580008 */     addiu $t8, $v0, 8
  /* 130470 801321F0 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 130474 801321F4 AC400004 */        sw $zero, 4($v0)
  /* 130478 801321F8 AC590000 */        sw $t9, ($v0)
  /* 13047C 801321FC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 130480 80132200 3C0C3030 */       lui $t4, (0x303030FF >> 16) # 808464639
  /* 130484 80132204 358C30FF */       ori $t4, $t4, (0x303030FF & 0xFFFF) # 808464639
  /* 130488 80132208 244A0008 */     addiu $t2, $v0, 8
  /* 13048C 8013220C AC6A0000 */        sw $t2, ($v1) # gDisplayListHead + 0
  /* 130490 80132210 3C0BFA00 */       lui $t3, 0xfa00
  /* 130494 80132214 AC4B0000 */        sw $t3, ($v0)
  /* 130498 80132218 AC4C0004 */        sw $t4, 4($v0)
  /* 13049C 8013221C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1304A0 80132220 3C0F11FC */       lui $t7, (0x11FCF279 >> 16) # 301789817
  /* 1304A4 80132224 3C0EFC71 */       lui $t6, (0xFC71FEE3 >> 16) # 4235329251
  /* 1304A8 80132228 244D0008 */     addiu $t5, $v0, 8
  /* 1304AC 8013222C AC6D0000 */        sw $t5, ($v1) # gDisplayListHead + 0
  /* 1304B0 80132230 35CEFEE3 */       ori $t6, $t6, (0xFC71FEE3 & 0xFFFF) # 4235329251
  /* 1304B4 80132234 35EFF279 */       ori $t7, $t7, (0x11FCF279 & 0xFFFF) # 301789817
  /* 1304B8 80132238 AC4F0004 */        sw $t7, 4($v0)
  /* 1304BC 8013223C AC4E0000 */        sw $t6, ($v0)
  /* 1304C0 80132240 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1304C4 80132244 3C0A0050 */       lui $t2, (0x5041C8 >> 16) # 5259720
  /* 1304C8 80132248 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 1304CC 8013224C 24580008 */     addiu $t8, $v0, 8
  /* 1304D0 80132250 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1304D4 80132254 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 1304D8 80132258 354A41C8 */       ori $t2, $t2, (0x5041C8 & 0xFFFF) # 5259720
  /* 1304DC 8013225C AC4A0004 */        sw $t2, 4($v0)
  /* 1304E0 80132260 0C0333DD */       jal func_ovl0_800CCF74
  /* 1304E4 80132264 AC590000 */        sw $t9, ($v0)
  /* 1304E8 80132268 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1304EC 8013226C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1304F0 80132270 03E00008 */        jr $ra
  /* 1304F4 80132274 00000000 */       nop

glabel func_ovl26_80132278
  /* 1304F8 80132278 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 1304FC 8013227C 3C0F8014 */       lui $t7, %hi(dMNBattleLockedPortraitOffsets)
  /* 130500 80132280 AFB10020 */        sw $s1, 0x20($sp)
  /* 130504 80132284 25EFB534 */     addiu $t7, $t7, %lo(dMNBattleLockedPortraitOffsets)
  /* 130508 80132288 00808825 */        or $s1, $a0, $zero
  /* 13050C 8013228C AFBF0024 */        sw $ra, 0x24($sp)
  /* 130510 80132290 AFB0001C */        sw $s0, 0x1c($sp)
  /* 130514 80132294 25E80030 */     addiu $t0, $t7, 0x30
  /* 130518 80132298 27AE0038 */     addiu $t6, $sp, 0x38
  .L8013229C:
  /* 13051C 8013229C 8DF90000 */        lw $t9, ($t7) # dMNBattleLockedPortraitOffsets + 0
  /* 130520 801322A0 25EF000C */     addiu $t7, $t7, 0xc
  /* 130524 801322A4 25CE000C */     addiu $t6, $t6, 0xc
  /* 130528 801322A8 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13052C 801322AC 8DF8FFF8 */        lw $t8, -8($t7) # dMNBattleLockedPortraitOffsets + -8
  /* 130530 801322B0 ADD8FFF8 */        sw $t8, -8($t6)
  /* 130534 801322B4 8DF9FFFC */        lw $t9, -4($t7) # dMNBattleLockedPortraitOffsets + -4
  /* 130538 801322B8 15E8FFF8 */       bne $t7, $t0, .L8013229C
  /* 13053C 801322BC ADD9FFFC */        sw $t9, -4($t6)
  /* 130540 801322C0 00002025 */        or $a0, $zero, $zero
  /* 130544 801322C4 00002825 */        or $a1, $zero, $zero
  /* 130548 801322C8 24060012 */     addiu $a2, $zero, 0x12
  /* 13054C 801322CC 0C00265A */       jal omMakeGObjSPAfter
  /* 130550 801322D0 3C078000 */       lui $a3, 0x8000
  /* 130554 801322D4 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 130558 801322D8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13055C 801322DC 2409FFFF */     addiu $t1, $zero, -1
  /* 130560 801322E0 00408025 */        or $s0, $v0, $zero
  /* 130564 801322E4 AFA90010 */        sw $t1, 0x10($sp)
  /* 130568 801322E8 AFA50030 */        sw $a1, 0x30($sp)
  /* 13056C 801322EC 00402025 */        or $a0, $v0, $zero
  /* 130570 801322F0 2406001B */     addiu $a2, $zero, 0x1b
  /* 130574 801322F4 0C00277D */       jal omAddGObjRenderProc
  /* 130578 801322F8 3C078000 */       lui $a3, 0x8000
  /* 13057C 801322FC 3C058013 */       lui $a1, %hi(mnBattleSetPortraitX)
  /* 130580 80132300 24A51EE4 */     addiu $a1, $a1, %lo(mnBattleSetPortraitX)
  /* 130584 80132304 AFA5002C */        sw $a1, 0x2c($sp)
  /* 130588 80132308 02002025 */        or $a0, $s0, $zero
  /* 13058C 8013230C 24060001 */     addiu $a2, $zero, 1
  /* 130590 80132310 0C002062 */       jal omAddGObjCommonProc
  /* 130594 80132314 24070001 */     addiu $a3, $zero, 1
  /* 130598 80132318 3C0A8014 */       lui $t2, %hi(D_ovl26_8013C4B4)
  /* 13059C 8013231C 8D4AC4B4 */        lw $t2, %lo(D_ovl26_8013C4B4)($t2)
  /* 1305A0 80132320 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 1305A4 80132324 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 1305A8 80132328 02002025 */        or $a0, $s0, $zero
  /* 1305AC 8013232C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1305B0 80132330 014B2821 */      addu $a1, $t2, $t3
  /* 1305B4 80132334 2A210006 */      slti $at, $s1, 6
  /* 1305B8 80132338 14200003 */      bnez $at, .L80132348
  /* 1305BC 8013233C 00402025 */        or $a0, $v0, $zero
  /* 1305C0 80132340 10000002 */         b .L8013234C
  /* 1305C4 80132344 2623FFFA */     addiu $v1, $s1, -6
  .L80132348:
  /* 1305C8 80132348 02201825 */        or $v1, $s1, $zero
  .L8013234C:
  /* 1305CC 8013234C 00036080 */       sll $t4, $v1, 2
  /* 1305D0 80132350 01836023 */      subu $t4, $t4, $v1
  /* 1305D4 80132354 000C6080 */       sll $t4, $t4, 2
  /* 1305D8 80132358 01836023 */      subu $t4, $t4, $v1
  /* 1305DC 8013235C 000C6080 */       sll $t4, $t4, 2
  /* 1305E0 80132360 01836021 */      addu $t4, $t4, $v1
  /* 1305E4 80132364 258D0019 */     addiu $t5, $t4, 0x19
  /* 1305E8 80132368 448D2000 */      mtc1 $t5, $f4
  /* 1305EC 8013236C 2A210006 */      slti $at, $s1, 6
  /* 1305F0 80132370 468021A0 */   cvt.s.w $f6, $f4
  /* 1305F4 80132374 14200003 */      bnez $at, .L80132384
  /* 1305F8 80132378 E4460058 */      swc1 $f6, 0x58($v0)
  /* 1305FC 8013237C 10000002 */         b .L80132388
  /* 130600 80132380 24030001 */     addiu $v1, $zero, 1
  .L80132384:
  /* 130604 80132384 00001825 */        or $v1, $zero, $zero
  .L80132388:
  /* 130608 80132388 00034080 */       sll $t0, $v1, 2
  /* 13060C 8013238C 01034023 */      subu $t0, $t0, $v1
  /* 130610 80132390 00084080 */       sll $t0, $t0, 2
  /* 130614 80132394 01034023 */      subu $t0, $t0, $v1
  /* 130618 80132398 00084080 */       sll $t0, $t0, 2
  /* 13061C 8013239C 01034023 */      subu $t0, $t0, $v1
  /* 130620 801323A0 250F0024 */     addiu $t7, $t0, 0x24
  /* 130624 801323A4 448F4000 */      mtc1 $t7, $f8
  /* 130628 801323A8 02202825 */        or $a1, $s1, $zero
  /* 13062C 801323AC 468042A0 */   cvt.s.w $f10, $f8
  /* 130630 801323B0 0C04C7D5 */       jal mnBattleInitializePortraitBackgroundPosition
  /* 130634 801323B4 E48A005C */      swc1 $f10, 0x5c($a0)
  /* 130638 801323B8 AE110084 */        sw $s1, 0x84($s0)
  /* 13063C 801323BC 00002025 */        or $a0, $zero, $zero
  /* 130640 801323C0 00002825 */        or $a1, $zero, $zero
  /* 130644 801323C4 24060012 */     addiu $a2, $zero, 0x12
  /* 130648 801323C8 0C00265A */       jal omMakeGObjSPAfter
  /* 13064C 801323CC 3C078000 */       lui $a3, 0x8000
  /* 130650 801323D0 3C058013 */       lui $a1, %hi(mnBattleRenderPortraitWithNoise)
  /* 130654 801323D4 240EFFFF */     addiu $t6, $zero, -1
  /* 130658 801323D8 00408025 */        or $s0, $v0, $zero
  /* 13065C 801323DC AFAE0010 */        sw $t6, 0x10($sp)
  /* 130660 801323E0 24A521B8 */     addiu $a1, $a1, %lo(mnBattleRenderPortraitWithNoise)
  /* 130664 801323E4 00402025 */        or $a0, $v0, $zero
  /* 130668 801323E8 2406001B */     addiu $a2, $zero, 0x1b
  /* 13066C 801323EC 0C00277D */       jal omAddGObjRenderProc
  /* 130670 801323F0 3C078000 */       lui $a3, 0x8000
  /* 130674 801323F4 02002025 */        or $a0, $s0, $zero
  /* 130678 801323F8 8FA5002C */        lw $a1, 0x2c($sp)
  /* 13067C 801323FC 24060001 */     addiu $a2, $zero, 1
  /* 130680 80132400 0C002062 */       jal omAddGObjCommonProc
  /* 130684 80132404 24070001 */     addiu $a3, $zero, 1
  /* 130688 80132408 0C04C846 */       jal mnBattleGetFtKind
  /* 13068C 8013240C 02202025 */        or $a0, $s1, $zero
  /* 130690 80132410 0002C080 */       sll $t8, $v0, 2
  /* 130694 80132414 03B8C821 */      addu $t9, $sp, $t8
  /* 130698 80132418 3C098014 */       lui $t1, %hi(D_ovl26_8013C4B4)
  /* 13069C 8013241C 8D29C4B4 */        lw $t1, %lo(D_ovl26_8013C4B4)($t1)
  /* 1306A0 80132420 8F390038 */        lw $t9, 0x38($t9)
  /* 1306A4 80132424 02002025 */        or $a0, $s0, $zero
  /* 1306A8 80132428 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1306AC 8013242C 03292821 */      addu $a1, $t9, $t1
  /* 1306B0 80132430 944A0024 */       lhu $t2, 0x24($v0)
  /* 1306B4 80132434 00402025 */        or $a0, $v0, $zero
  /* 1306B8 80132438 02202825 */        or $a1, $s1, $zero
  /* 1306BC 8013243C 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 1306C0 80132440 A44C0024 */        sh $t4, 0x24($v0)
  /* 1306C4 80132444 358D0001 */       ori $t5, $t4, 1
  /* 1306C8 80132448 A44D0024 */        sh $t5, 0x24($v0)
  /* 1306CC 8013244C 0C04C7D5 */       jal mnBattleInitializePortraitBackgroundPosition
  /* 1306D0 80132450 AE110084 */        sw $s1, 0x84($s0)
  /* 1306D4 80132454 00002025 */        or $a0, $zero, $zero
  /* 1306D8 80132458 00002825 */        or $a1, $zero, $zero
  /* 1306DC 8013245C 24060012 */     addiu $a2, $zero, 0x12
  /* 1306E0 80132460 0C00265A */       jal omMakeGObjSPAfter
  /* 1306E4 80132464 3C078000 */       lui $a3, 0x8000
  /* 1306E8 80132468 2408FFFF */     addiu $t0, $zero, -1
  /* 1306EC 8013246C 00408025 */        or $s0, $v0, $zero
  /* 1306F0 80132470 AFA80010 */        sw $t0, 0x10($sp)
  /* 1306F4 80132474 00402025 */        or $a0, $v0, $zero
  /* 1306F8 80132478 8FA50030 */        lw $a1, 0x30($sp)
  /* 1306FC 8013247C 2406001B */     addiu $a2, $zero, 0x1b
  /* 130700 80132480 0C00277D */       jal omAddGObjRenderProc
  /* 130704 80132484 3C078000 */       lui $a3, 0x8000
  /* 130708 80132488 02002025 */        or $a0, $s0, $zero
  /* 13070C 8013248C 8FA5002C */        lw $a1, 0x2c($sp)
  /* 130710 80132490 24060001 */     addiu $a2, $zero, 1
  /* 130714 80132494 0C002062 */       jal omAddGObjCommonProc
  /* 130718 80132498 24070001 */     addiu $a3, $zero, 1
  /* 13071C 8013249C 3C0F8014 */       lui $t7, %hi(D_ovl26_8013C4B4)
  /* 130720 801324A0 8DEFC4B4 */        lw $t7, %lo(D_ovl26_8013C4B4)($t7)
  /* 130724 801324A4 3C0E0000 */       lui $t6, %hi(D_NF_00000F68)
  /* 130728 801324A8 25CE0F68 */     addiu $t6, $t6, %lo(D_NF_00000F68)
  /* 13072C 801324AC 02002025 */        or $a0, $s0, $zero
  /* 130730 801324B0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130734 801324B4 01EE2821 */      addu $a1, $t7, $t6
  /* 130738 801324B8 94580024 */       lhu $t8, 0x24($v0)
  /* 13073C 801324BC 240B005B */     addiu $t3, $zero, 0x5b
  /* 130740 801324C0 240C0041 */     addiu $t4, $zero, 0x41
  /* 130744 801324C4 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 130748 801324C8 A4490024 */        sh $t1, 0x24($v0)
  /* 13074C 801324CC 352A0001 */       ori $t2, $t1, 1
  /* 130750 801324D0 240D0033 */     addiu $t5, $zero, 0x33
  /* 130754 801324D4 240800C4 */     addiu $t0, $zero, 0xc4
  /* 130758 801324D8 240F00B9 */     addiu $t7, $zero, 0xb9
  /* 13075C 801324DC 240E00A9 */     addiu $t6, $zero, 0xa9
  /* 130760 801324E0 A44A0024 */        sh $t2, 0x24($v0)
  /* 130764 801324E4 A04B0060 */        sb $t3, 0x60($v0)
  /* 130768 801324E8 A04C0061 */        sb $t4, 0x61($v0)
  /* 13076C 801324EC A04D0062 */        sb $t5, 0x62($v0)
  /* 130770 801324F0 A0480028 */        sb $t0, 0x28($v0)
  /* 130774 801324F4 A04F0029 */        sb $t7, 0x29($v0)
  /* 130778 801324F8 A04E002A */        sb $t6, 0x2a($v0)
  /* 13077C 801324FC AE110084 */        sw $s1, 0x84($s0)
  /* 130780 80132500 00402025 */        or $a0, $v0, $zero
  /* 130784 80132504 0C04C7D5 */       jal mnBattleInitializePortraitBackgroundPosition
  /* 130788 80132508 02202825 */        or $a1, $s1, $zero
  /* 13078C 8013250C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 130790 80132510 8FB0001C */        lw $s0, 0x1c($sp)
  /* 130794 80132514 8FB10020 */        lw $s1, 0x20($sp)
  /* 130798 80132518 03E00008 */        jr $ra
  /* 13079C 8013251C 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnBattleCreatePortrait
  /* 1307A0 80132520 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 1307A4 80132524 3C0F8014 */       lui $t7, %hi(dMNBattlePortraitOffsets)
  /* 1307A8 80132528 AFB00020 */        sw $s0, 0x20($sp)
  /* 1307AC 8013252C 25EFB564 */     addiu $t7, $t7, %lo(dMNBattlePortraitOffsets)
  /* 1307B0 80132530 00808025 */        or $s0, $a0, $zero
  /* 1307B4 80132534 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1307B8 80132538 25E80030 */     addiu $t0, $t7, 0x30
  /* 1307BC 8013253C 27AE0034 */     addiu $t6, $sp, 0x34
  .L80132540:
  /* 1307C0 80132540 8DF90000 */        lw $t9, ($t7) # dMNBattlePortraitOffsets + 0
  /* 1307C4 80132544 25EF000C */     addiu $t7, $t7, 0xc
  /* 1307C8 80132548 25CE000C */     addiu $t6, $t6, 0xc
  /* 1307CC 8013254C ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 1307D0 80132550 8DF8FFF8 */        lw $t8, -8($t7) # dMNBattlePortraitOffsets + -8
  /* 1307D4 80132554 ADD8FFF8 */        sw $t8, -8($t6)
  /* 1307D8 80132558 8DF9FFFC */        lw $t9, -4($t7) # dMNBattlePortraitOffsets + -4
  /* 1307DC 8013255C 15E8FFF8 */       bne $t7, $t0, .L80132540
  /* 1307E0 80132560 ADD9FFFC */        sw $t9, -4($t6)
  /* 1307E4 80132564 0C04C846 */       jal mnBattleGetFtKind
  /* 1307E8 80132568 02002025 */        or $a0, $s0, $zero
  /* 1307EC 8013256C 0C04C811 */       jal mnBattleGetIsLocked
  /* 1307F0 80132570 00402025 */        or $a0, $v0, $zero
  /* 1307F4 80132574 10400005 */      beqz $v0, .L8013258C
  /* 1307F8 80132578 00002025 */        or $a0, $zero, $zero
  /* 1307FC 8013257C 0C04C89E */       jal func_ovl26_80132278
  /* 130800 80132580 02002025 */        or $a0, $s0, $zero
  /* 130804 80132584 10000051 */         b .L801326CC
  /* 130808 80132588 8FBF0024 */        lw $ra, 0x24($sp)
  .L8013258C:
  /* 13080C 8013258C 00002825 */        or $a1, $zero, $zero
  /* 130810 80132590 2406001D */     addiu $a2, $zero, 0x1d
  /* 130814 80132594 0C00265A */       jal omMakeGObjSPAfter
  /* 130818 80132598 3C078000 */       lui $a3, 0x8000
  /* 13081C 8013259C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 130820 801325A0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 130824 801325A4 2409FFFF */     addiu $t1, $zero, -1
  /* 130828 801325A8 AFA20068 */        sw $v0, 0x68($sp)
  /* 13082C 801325AC AFA90010 */        sw $t1, 0x10($sp)
  /* 130830 801325B0 AFA5002C */        sw $a1, 0x2c($sp)
  /* 130834 801325B4 00402025 */        or $a0, $v0, $zero
  /* 130838 801325B8 24060024 */     addiu $a2, $zero, 0x24
  /* 13083C 801325BC 0C00277D */       jal omAddGObjRenderProc
  /* 130840 801325C0 3C078000 */       lui $a3, 0x8000
  /* 130844 801325C4 8FA40068 */        lw $a0, 0x68($sp)
  /* 130848 801325C8 3C058013 */       lui $a1, %hi(mnBattleSetPortraitX)
  /* 13084C 801325CC 24A51EE4 */     addiu $a1, $a1, %lo(mnBattleSetPortraitX)
  /* 130850 801325D0 AC900084 */        sw $s0, 0x84($a0)
  /* 130854 801325D4 AFA50028 */        sw $a1, 0x28($sp)
  /* 130858 801325D8 24060001 */     addiu $a2, $zero, 1
  /* 13085C 801325DC 0C002062 */       jal omAddGObjCommonProc
  /* 130860 801325E0 24070001 */     addiu $a3, $zero, 1
  /* 130864 801325E4 3C0A8014 */       lui $t2, %hi(D_ovl26_8013C4B4)
  /* 130868 801325E8 8D4AC4B4 */        lw $t2, %lo(D_ovl26_8013C4B4)($t2)
  /* 13086C 801325EC 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 130870 801325F0 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 130874 801325F4 8FA40068 */        lw $a0, 0x68($sp)
  /* 130878 801325F8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13087C 801325FC 014B2821 */      addu $a1, $t2, $t3
  /* 130880 80132600 00402025 */        or $a0, $v0, $zero
  /* 130884 80132604 0C04C7D5 */       jal mnBattleInitializePortraitBackgroundPosition
  /* 130888 80132608 02002825 */        or $a1, $s0, $zero
  /* 13088C 8013260C 00002025 */        or $a0, $zero, $zero
  /* 130890 80132610 00002825 */        or $a1, $zero, $zero
  /* 130894 80132614 24060012 */     addiu $a2, $zero, 0x12
  /* 130898 80132618 0C00265A */       jal omMakeGObjSPAfter
  /* 13089C 8013261C 3C078000 */       lui $a3, 0x8000
  /* 1308A0 80132620 240CFFFF */     addiu $t4, $zero, -1
  /* 1308A4 80132624 AFA2006C */        sw $v0, 0x6c($sp)
  /* 1308A8 80132628 AFAC0010 */        sw $t4, 0x10($sp)
  /* 1308AC 8013262C 00402025 */        or $a0, $v0, $zero
  /* 1308B0 80132630 8FA5002C */        lw $a1, 0x2c($sp)
  /* 1308B4 80132634 2406001B */     addiu $a2, $zero, 0x1b
  /* 1308B8 80132638 0C00277D */       jal omAddGObjRenderProc
  /* 1308BC 8013263C 3C078000 */       lui $a3, 0x8000
  /* 1308C0 80132640 8FA4006C */        lw $a0, 0x6c($sp)
  /* 1308C4 80132644 8FA50028 */        lw $a1, 0x28($sp)
  /* 1308C8 80132648 24060001 */     addiu $a2, $zero, 1
  /* 1308CC 8013264C 0C002062 */       jal omAddGObjCommonProc
  /* 1308D0 80132650 24070001 */     addiu $a3, $zero, 1
  /* 1308D4 80132654 0C04C846 */       jal mnBattleGetFtKind
  /* 1308D8 80132658 02002025 */        or $a0, $s0, $zero
  /* 1308DC 8013265C 00026880 */       sll $t5, $v0, 2
  /* 1308E0 80132660 03AD4021 */      addu $t0, $sp, $t5
  /* 1308E4 80132664 3C0F8014 */       lui $t7, %hi(D_ovl26_8013C4B4)
  /* 1308E8 80132668 8DEFC4B4 */        lw $t7, %lo(D_ovl26_8013C4B4)($t7)
  /* 1308EC 8013266C 8D080034 */        lw $t0, 0x34($t0)
  /* 1308F0 80132670 8FA4006C */        lw $a0, 0x6c($sp)
  /* 1308F4 80132674 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1308F8 80132678 010F2821 */      addu $a1, $t0, $t7
  /* 1308FC 8013267C AFA20064 */        sw $v0, 0x64($sp)
  /* 130900 80132680 944E0024 */       lhu $t6, 0x24($v0)
  /* 130904 80132684 02002025 */        or $a0, $s0, $zero
  /* 130908 80132688 31D9FFDF */      andi $t9, $t6, 0xffdf
  /* 13090C 8013268C A4590024 */        sh $t9, 0x24($v0)
  /* 130910 80132690 37290001 */       ori $t1, $t9, 1
  /* 130914 80132694 A4490024 */        sh $t1, 0x24($v0)
  /* 130918 80132698 8FAA006C */        lw $t2, 0x6c($sp)
  /* 13091C 8013269C 0C04C846 */       jal mnBattleGetFtKind
  /* 130920 801326A0 AD500084 */        sw $s0, 0x84($t2)
  /* 130924 801326A4 0C04C7B6 */       jal mnBattleCheckFighterIsXBoxed
  /* 130928 801326A8 00402025 */        or $a0, $v0, $zero
  /* 13092C 801326AC 10400003 */      beqz $v0, .L801326BC
  /* 130930 801326B0 8FA4006C */        lw $a0, 0x6c($sp)
  /* 130934 801326B4 0C04C7EC */       jal mnBattleAddRedXBoxToPortrait
  /* 130938 801326B8 02002825 */        or $a1, $s0, $zero
  .L801326BC:
  /* 13093C 801326BC 8FA40064 */        lw $a0, 0x64($sp)
  /* 130940 801326C0 0C04C7D5 */       jal mnBattleInitializePortraitBackgroundPosition
  /* 130944 801326C4 02002825 */        or $a1, $s0, $zero
  /* 130948 801326C8 8FBF0024 */        lw $ra, 0x24($sp)
  .L801326CC:
  /* 13094C 801326CC 8FB00020 */        lw $s0, 0x20($sp)
  /* 130950 801326D0 27BD0070 */     addiu $sp, $sp, 0x70
  /* 130954 801326D4 03E00008 */        jr $ra
  /* 130958 801326D8 00000000 */       nop

glabel mnBattleCreatePortraits
  /* 13095C 801326DC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 130960 801326E0 AFB10018 */        sw $s1, 0x18($sp)
  /* 130964 801326E4 AFB00014 */        sw $s0, 0x14($sp)
  /* 130968 801326E8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13096C 801326EC 00008025 */        or $s0, $zero, $zero
  /* 130970 801326F0 2411000C */     addiu $s1, $zero, 0xc
  .L801326F4:
  /* 130974 801326F4 0C04C948 */       jal mnBattleCreatePortrait
  /* 130978 801326F8 02002025 */        or $a0, $s0, $zero
  /* 13097C 801326FC 26100001 */     addiu $s0, $s0, 1
  /* 130980 80132700 1611FFFC */       bne $s0, $s1, .L801326F4
  /* 130984 80132704 00000000 */       nop
  /* 130988 80132708 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13098C 8013270C 8FB00014 */        lw $s0, 0x14($sp)
  /* 130990 80132710 8FB10018 */        lw $s1, 0x18($sp)
  /* 130994 80132714 03E00008 */        jr $ra
  /* 130998 80132718 27BD0020 */     addiu $sp, $sp, 0x20

glabel func_ovl26_8013271C
  /* 13099C 8013271C 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1309A0 80132720 3C0F8014 */       lui $t7, %hi(dMNBattleTeamButtonOffsets)
  /* 1309A4 80132724 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1309A8 80132728 AFA40038 */        sw $a0, 0x38($sp)
  /* 1309AC 8013272C AFA5003C */        sw $a1, 0x3c($sp)
  /* 1309B0 80132730 25EFB594 */     addiu $t7, $t7, %lo(dMNBattleTeamButtonOffsets)
  /* 1309B4 80132734 8DF90000 */        lw $t9, ($t7) # dMNBattleTeamButtonOffsets + 0
  /* 1309B8 80132738 27AE0024 */     addiu $t6, $sp, 0x24
  /* 1309BC 8013273C 8DF80004 */        lw $t8, 4($t7) # dMNBattleTeamButtonOffsets + 4
  /* 1309C0 80132740 ADD90000 */        sw $t9, ($t6)
  /* 1309C4 80132744 8DF90008 */        lw $t9, 8($t7) # dMNBattleTeamButtonOffsets + 8
  /* 1309C8 80132748 00002825 */        or $a1, $zero, $zero
  /* 1309CC 8013274C 00002025 */        or $a0, $zero, $zero
  /* 1309D0 80132750 2406001B */     addiu $a2, $zero, 0x1b
  /* 1309D4 80132754 3C078000 */       lui $a3, 0x8000
  /* 1309D8 80132758 ADD80004 */        sw $t8, 4($t6)
  /* 1309DC 8013275C 0C00265A */       jal omMakeGObjSPAfter
  /* 1309E0 80132760 ADD90008 */        sw $t9, 8($t6)
  /* 1309E4 80132764 8FA8003C */        lw $t0, 0x3c($sp)
  /* 1309E8 80132768 3C018014 */       lui $at, %hi(D_ovl26_8013BAA4)
  /* 1309EC 8013276C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1309F0 80132770 00084880 */       sll $t1, $t0, 2
  /* 1309F4 80132774 01284823 */      subu $t1, $t1, $t0
  /* 1309F8 80132778 00094900 */       sll $t1, $t1, 4
  /* 1309FC 8013277C 01284823 */      subu $t1, $t1, $t0
  /* 130A00 80132780 00094880 */       sll $t1, $t1, 2
  /* 130A04 80132784 00290821 */      addu $at, $at, $t1
  /* 130A08 80132788 240AFFFF */     addiu $t2, $zero, -1
  /* 130A0C 8013278C AC22BAA4 */        sw $v0, %lo(D_ovl26_8013BAA4)($at)
  /* 130A10 80132790 AFA20034 */        sw $v0, 0x34($sp)
  /* 130A14 80132794 AFAA0010 */        sw $t2, 0x10($sp)
  /* 130A18 80132798 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 130A1C 8013279C 00402025 */        or $a0, $v0, $zero
  /* 130A20 801327A0 24060022 */     addiu $a2, $zero, 0x22
  /* 130A24 801327A4 0C00277D */       jal omAddGObjRenderProc
  /* 130A28 801327A8 3C078000 */       lui $a3, 0x8000
  /* 130A2C 801327AC 8FAB0038 */        lw $t3, 0x38($sp)
  /* 130A30 801327B0 3C0E8014 */       lui $t6, %hi(D_ovl26_8013C4A0)
  /* 130A34 801327B4 8DCEC4A0 */        lw $t6, %lo(D_ovl26_8013C4A0)($t6)
  /* 130A38 801327B8 000B6080 */       sll $t4, $t3, 2
  /* 130A3C 801327BC 03AC6821 */      addu $t5, $sp, $t4
  /* 130A40 801327C0 8DAD0024 */        lw $t5, 0x24($t5)
  /* 130A44 801327C4 8FA40034 */        lw $a0, 0x34($sp)
  /* 130A48 801327C8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130A4C 801327CC 01AE2821 */      addu $a1, $t5, $t6
  /* 130A50 801327D0 8FAF003C */        lw $t7, 0x3c($sp)
  /* 130A54 801327D4 94480024 */       lhu $t0, 0x24($v0)
  /* 130A58 801327D8 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 130A5C 801327DC 000FC100 */       sll $t8, $t7, 4
  /* 130A60 801327E0 030FC021 */      addu $t8, $t8, $t7
  /* 130A64 801327E4 0018C080 */       sll $t8, $t8, 2
  /* 130A68 801327E8 030FC021 */      addu $t8, $t8, $t7
  /* 130A6C 801327EC 27190022 */     addiu $t9, $t8, 0x22
  /* 130A70 801327F0 44992000 */      mtc1 $t9, $f4
  /* 130A74 801327F4 44814000 */      mtc1 $at, $f8 # 131.0 to cop1
  /* 130A78 801327F8 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 130A7C 801327FC 468021A0 */   cvt.s.w $f6, $f4
  /* 130A80 80132800 A44A0024 */        sh $t2, 0x24($v0)
  /* 130A84 80132804 354B0001 */       ori $t3, $t2, 1
  /* 130A88 80132808 A44B0024 */        sh $t3, 0x24($v0)
  /* 130A8C 8013280C E448005C */      swc1 $f8, 0x5c($v0)
  /* 130A90 80132810 E4460058 */      swc1 $f6, 0x58($v0)
  /* 130A94 80132814 8FBF001C */        lw $ra, 0x1c($sp)
  /* 130A98 80132818 27BD0038 */     addiu $sp, $sp, 0x38
  /* 130A9C 8013281C 03E00008 */        jr $ra
  /* 130AA0 80132820 00000000 */       nop

glabel func_ovl26_80132824
  /* 130AA4 80132824 00047080 */       sll $t6, $a0, 2
  /* 130AA8 80132828 01C47023 */      subu $t6, $t6, $a0
  /* 130AAC 8013282C 000E7100 */       sll $t6, $t6, 4
  /* 130AB0 80132830 01C47023 */      subu $t6, $t6, $a0
  /* 130AB4 80132834 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 130AB8 80132838 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 130ABC 8013283C 000E7080 */       sll $t6, $t6, 2
  /* 130AC0 80132840 01CF1021 */      addu $v0, $t6, $t7
  /* 130AC4 80132844 8C45001C */        lw $a1, 0x1c($v0)
  /* 130AC8 80132848 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 130ACC 8013284C AFBF0014 */        sw $ra, 0x14($sp)
  /* 130AD0 80132850 10A00005 */      beqz $a1, .L80132868
  /* 130AD4 80132854 00A02025 */        or $a0, $a1, $zero
  /* 130AD8 80132858 0C0026A1 */       jal omEjectGObj
  /* 130ADC 8013285C AFA2001C */        sw $v0, 0x1c($sp)
  /* 130AE0 80132860 8FA2001C */        lw $v0, 0x1c($sp)
  /* 130AE4 80132864 AC40001C */        sw $zero, 0x1c($v0)
  .L80132868:
  /* 130AE8 80132868 8FBF0014 */        lw $ra, 0x14($sp)
  /* 130AEC 8013286C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 130AF0 80132870 03E00008 */        jr $ra
  /* 130AF4 80132874 00000000 */       nop

glabel func_ovl26_80132878
  /* 130AF8 80132878 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 130AFC 8013287C AFBF0014 */        sw $ra, 0x14($sp)
  /* 130B00 80132880 AFA40018 */        sw $a0, 0x18($sp)
  /* 130B04 80132884 AFA5001C */        sw $a1, 0x1c($sp)
  /* 130B08 80132888 0C04CA09 */       jal func_ovl26_80132824
  /* 130B0C 8013288C 00A02025 */        or $a0, $a1, $zero
  /* 130B10 80132890 8FA40018 */        lw $a0, 0x18($sp)
  /* 130B14 80132894 0C04C9C7 */       jal func_ovl26_8013271C
  /* 130B18 80132898 8FA5001C */        lw $a1, 0x1c($sp)
  /* 130B1C 8013289C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 130B20 801328A0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 130B24 801328A4 03E00008 */        jr $ra
  /* 130B28 801328A8 00000000 */       nop

glabel func_ovl26_801328AC
  /* 130B2C 801328AC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 130B30 801328B0 AFB10018 */        sw $s1, 0x18($sp)
  /* 130B34 801328B4 AFB00014 */        sw $s0, 0x14($sp)
  /* 130B38 801328B8 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 130B3C 801328BC 3C118014 */       lui $s1, %hi(gMNBattlePickerGObj)
  /* 130B40 801328C0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 130B44 801328C4 2631BD78 */     addiu $s1, $s1, %lo(gMNBattlePickerGObj)
  /* 130B48 801328C8 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 130B4C 801328CC 8E04001C */        lw $a0, 0x1c($s0) # gMNBattlePanels + 28
  .L801328D0:
  /* 130B50 801328D0 50800005 */      beql $a0, $zero, .L801328E8
  /* 130B54 801328D4 261000BC */     addiu $s0, $s0, 0xbc
  /* 130B58 801328D8 0C0026A1 */       jal omEjectGObj
  /* 130B5C 801328DC 00000000 */       nop
  /* 130B60 801328E0 AE00001C */        sw $zero, 0x1c($s0) # gMNBattlePanels + 28
  /* 130B64 801328E4 261000BC */     addiu $s0, $s0, 0xbc
  .L801328E8:
  /* 130B68 801328E8 5611FFF9 */      bnel $s0, $s1, .L801328D0
  /* 130B6C 801328EC 8E04001C */        lw $a0, 0x1c($s0) # gMNBattlePanels + 28
  /* 130B70 801328F0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 130B74 801328F4 8FB00014 */        lw $s0, 0x14($sp)
  /* 130B78 801328F8 8FB10018 */        lw $s1, 0x18($sp)
  /* 130B7C 801328FC 03E00008 */        jr $ra
  /* 130B80 80132900 27BD0020 */     addiu $sp, $sp, 0x20

glabel func_ovl26_80132904
  /* 130B84 80132904 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 130B88 80132908 AFBF0024 */        sw $ra, 0x24($sp)
  /* 130B8C 8013290C AFB20020 */        sw $s2, 0x20($sp)
  /* 130B90 80132910 AFB1001C */        sw $s1, 0x1c($sp)
  /* 130B94 80132914 0C04CA2B */       jal func_ovl26_801328AC
  /* 130B98 80132918 AFB00018 */        sw $s0, 0x18($sp)
  /* 130B9C 8013291C 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 130BA0 80132920 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 130BA4 80132924 00008025 */        or $s0, $zero, $zero
  /* 130BA8 80132928 24120004 */     addiu $s2, $zero, 4
  .L8013292C:
  /* 130BAC 8013292C 8E240040 */        lw $a0, 0x40($s1) # gMNBattlePanels + 64
  /* 130BB0 80132930 0C04C9C7 */       jal func_ovl26_8013271C
  /* 130BB4 80132934 02002825 */        or $a1, $s0, $zero
  /* 130BB8 80132938 26100001 */     addiu $s0, $s0, 1
  /* 130BBC 8013293C 1612FFFB */       bne $s0, $s2, .L8013292C
  /* 130BC0 80132940 263100BC */     addiu $s1, $s1, 0xbc
  /* 130BC4 80132944 8FBF0024 */        lw $ra, 0x24($sp)
  /* 130BC8 80132948 8FB00018 */        lw $s0, 0x18($sp)
  /* 130BCC 8013294C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 130BD0 80132950 8FB20020 */        lw $s2, 0x20($sp)
  /* 130BD4 80132954 03E00008 */        jr $ra
  /* 130BD8 80132958 27BD0028 */     addiu $sp, $sp, 0x28

glabel func_ovl26_8013295C
  /* 130BDC 8013295C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 130BE0 80132960 3C0F8014 */       lui $t7, %hi(dMNBattleTypeButtonOffsets)
  /* 130BE4 80132964 AFBF0014 */        sw $ra, 0x14($sp)
  /* 130BE8 80132968 AFA40030 */        sw $a0, 0x30($sp)
  /* 130BEC 8013296C AFA50034 */        sw $a1, 0x34($sp)
  /* 130BF0 80132970 AFA60038 */        sw $a2, 0x38($sp)
  /* 130BF4 80132974 25EFB5A0 */     addiu $t7, $t7, %lo(dMNBattleTypeButtonOffsets)
  /* 130BF8 80132978 8DF90000 */        lw $t9, ($t7) # dMNBattleTypeButtonOffsets + 0
  /* 130BFC 8013297C 27AE0018 */     addiu $t6, $sp, 0x18
  /* 130C00 80132980 8DF80004 */        lw $t8, 4($t7) # dMNBattleTypeButtonOffsets + 4
  /* 130C04 80132984 ADD90000 */        sw $t9, ($t6)
  /* 130C08 80132988 8DF90008 */        lw $t9, 8($t7) # dMNBattleTypeButtonOffsets + 8
  /* 130C0C 8013298C ADD80004 */        sw $t8, 4($t6)
  /* 130C10 80132990 ADD90008 */        sw $t9, 8($t6)
  /* 130C14 80132994 0C002DD8 */       jal func_8000B760
  /* 130C18 80132998 8FA40030 */        lw $a0, 0x30($sp)
  /* 130C1C 8013299C 8FA80038 */        lw $t0, 0x38($sp)
  /* 130C20 801329A0 3C0B8014 */       lui $t3, %hi(D_ovl26_8013C4A0)
  /* 130C24 801329A4 8D6BC4A0 */        lw $t3, %lo(D_ovl26_8013C4A0)($t3)
  /* 130C28 801329A8 00084880 */       sll $t1, $t0, 2
  /* 130C2C 801329AC 03A95021 */      addu $t2, $sp, $t1
  /* 130C30 801329B0 8D4A0018 */        lw $t2, 0x18($t2)
  /* 130C34 801329B4 8FA40030 */        lw $a0, 0x30($sp)
  /* 130C38 801329B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130C3C 801329BC 014B2821 */      addu $a1, $t2, $t3
  /* 130C40 801329C0 8FAC0034 */        lw $t4, 0x34($sp)
  /* 130C44 801329C4 944F0024 */       lhu $t7, 0x24($v0)
  /* 130C48 801329C8 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 130C4C 801329CC 000C6900 */       sll $t5, $t4, 4
  /* 130C50 801329D0 01AC6821 */      addu $t5, $t5, $t4
  /* 130C54 801329D4 000D6880 */       sll $t5, $t5, 2
  /* 130C58 801329D8 01AC6821 */      addu $t5, $t5, $t4
  /* 130C5C 801329DC 25AE0040 */     addiu $t6, $t5, 0x40
  /* 130C60 801329E0 448E2000 */      mtc1 $t6, $f4
  /* 130C64 801329E4 44814000 */      mtc1 $at, $f8 # 131.0 to cop1
  /* 130C68 801329E8 31F9FFDF */      andi $t9, $t7, 0xffdf
  /* 130C6C 801329EC 468021A0 */   cvt.s.w $f6, $f4
  /* 130C70 801329F0 A4590024 */        sh $t9, 0x24($v0)
  /* 130C74 801329F4 37280001 */       ori $t0, $t9, 1
  /* 130C78 801329F8 A4480024 */        sh $t0, 0x24($v0)
  /* 130C7C 801329FC E448005C */      swc1 $f8, 0x5c($v0)
  /* 130C80 80132A00 E4460058 */      swc1 $f6, 0x58($v0)
  /* 130C84 80132A04 8FBF0014 */        lw $ra, 0x14($sp)
  /* 130C88 80132A08 27BD0030 */     addiu $sp, $sp, 0x30
  /* 130C8C 80132A0C 03E00008 */        jr $ra
  /* 130C90 80132A10 00000000 */       nop

glabel mnBattleSetNameAndLogo
  /* 130C94 80132A14 27BDFF18 */     addiu $sp, $sp, -0xe8
  /* 130C98 80132A18 3C0F8014 */       lui $t7, %hi(dMNBattleUnusedPosititons)
  /* 130C9C 80132A1C 25EFB5AC */     addiu $t7, $t7, %lo(dMNBattleUnusedPosititons)
  /* 130CA0 80132A20 AFBF0014 */        sw $ra, 0x14($sp)
  /* 130CA4 80132A24 AFA400E8 */        sw $a0, 0xe8($sp)
  /* 130CA8 80132A28 AFA500EC */        sw $a1, 0xec($sp)
  /* 130CAC 80132A2C 00C03825 */        or $a3, $a2, $zero
  /* 130CB0 80132A30 25E80060 */     addiu $t0, $t7, 0x60
  /* 130CB4 80132A34 27AE0084 */     addiu $t6, $sp, 0x84
  .L80132A38:
  /* 130CB8 80132A38 8DF90000 */        lw $t9, ($t7) # dMNBattleUnusedPosititons + 0
  /* 130CBC 80132A3C 25EF000C */     addiu $t7, $t7, 0xc
  /* 130CC0 80132A40 25CE000C */     addiu $t6, $t6, 0xc
  /* 130CC4 80132A44 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 130CC8 80132A48 8DF8FFF8 */        lw $t8, -8($t7) # dMNBattleUnusedPosititons + -8
  /* 130CCC 80132A4C ADD8FFF8 */        sw $t8, -8($t6)
  /* 130CD0 80132A50 8DF9FFFC */        lw $t9, -4($t7) # dMNBattleUnusedPosititons + -4
  /* 130CD4 80132A54 15E8FFF8 */       bne $t7, $t0, .L80132A38
  /* 130CD8 80132A58 ADD9FFFC */        sw $t9, -4($t6)
  /* 130CDC 80132A5C 3C0A8014 */       lui $t2, %hi(dMNBattleLogoOffsets)
  /* 130CE0 80132A60 254AB60C */     addiu $t2, $t2, %lo(dMNBattleLogoOffsets)
  /* 130CE4 80132A64 254D0030 */     addiu $t5, $t2, 0x30
  /* 130CE8 80132A68 27A90054 */     addiu $t1, $sp, 0x54
  .L80132A6C:
  /* 130CEC 80132A6C 8D4C0000 */        lw $t4, ($t2) # dMNBattleLogoOffsets + 0
  /* 130CF0 80132A70 254A000C */     addiu $t2, $t2, 0xc
  /* 130CF4 80132A74 2529000C */     addiu $t1, $t1, 0xc
  /* 130CF8 80132A78 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 130CFC 80132A7C 8D4BFFF8 */        lw $t3, -8($t2) # dMNBattleLogoOffsets + -8
  /* 130D00 80132A80 AD2BFFF8 */        sw $t3, -8($t1)
  /* 130D04 80132A84 8D4CFFFC */        lw $t4, -4($t2) # dMNBattleLogoOffsets + -4
  /* 130D08 80132A88 154DFFF8 */       bne $t2, $t5, .L80132A6C
  /* 130D0C 80132A8C AD2CFFFC */        sw $t4, -4($t1)
  /* 130D10 80132A90 3C0F8014 */       lui $t7, %hi(dMNBattleNameOffsets)
  /* 130D14 80132A94 25EFB63C */     addiu $t7, $t7, %lo(dMNBattleNameOffsets)
  /* 130D18 80132A98 25F90030 */     addiu $t9, $t7, 0x30
  /* 130D1C 80132A9C 27A80024 */     addiu $t0, $sp, 0x24
  .L80132AA0:
  /* 130D20 80132AA0 8DF80000 */        lw $t8, ($t7) # dMNBattleNameOffsets + 0
  /* 130D24 80132AA4 25EF000C */     addiu $t7, $t7, 0xc
  /* 130D28 80132AA8 2508000C */     addiu $t0, $t0, 0xc
  /* 130D2C 80132AAC AD18FFF4 */        sw $t8, -0xc($t0)
  /* 130D30 80132AB0 8DEEFFF8 */        lw $t6, -8($t7) # dMNBattleNameOffsets + -8
  /* 130D34 80132AB4 AD0EFFF8 */        sw $t6, -8($t0)
  /* 130D38 80132AB8 8DF8FFFC */        lw $t8, -4($t7) # dMNBattleNameOffsets + -4
  /* 130D3C 80132ABC 15F9FFF8 */       bne $t7, $t9, .L80132AA0
  /* 130D40 80132AC0 AD18FFFC */        sw $t8, -4($t0)
  /* 130D44 80132AC4 2401001C */     addiu $at, $zero, 0x1c
  /* 130D48 80132AC8 10E10046 */       beq $a3, $at, .L80132BE4
  /* 130D4C 80132ACC 8FA400E8 */        lw $a0, 0xe8($sp)
  /* 130D50 80132AD0 0C002DD8 */       jal func_8000B760
  /* 130D54 80132AD4 AFA700F0 */        sw $a3, 0xf0($sp)
  /* 130D58 80132AD8 8FA700F0 */        lw $a3, 0xf0($sp)
  /* 130D5C 80132ADC 3C0A8014 */       lui $t2, %hi(D_ovl26_8013C4A8)
  /* 130D60 80132AE0 8D4AC4A8 */        lw $t2, %lo(D_ovl26_8013C4A8)($t2)
  /* 130D64 80132AE4 00073080 */       sll $a2, $a3, 2
  /* 130D68 80132AE8 03A66821 */      addu $t5, $sp, $a2
  /* 130D6C 80132AEC 8DAD0054 */        lw $t5, 0x54($t5)
  /* 130D70 80132AF0 AFA60020 */        sw $a2, 0x20($sp)
  /* 130D74 80132AF4 8FA400E8 */        lw $a0, 0xe8($sp)
  /* 130D78 80132AF8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130D7C 80132AFC 01AA2821 */      addu $a1, $t5, $t2
  /* 130D80 80132B00 8FA300EC */        lw $v1, 0xec($sp)
  /* 130D84 80132B04 944B0024 */       lhu $t3, 0x24($v0)
  /* 130D88 80132B08 3C01430F */       lui $at, (0x430F0000 >> 16) # 143.0
  /* 130D8C 80132B0C 00033900 */       sll $a3, $v1, 4
  /* 130D90 80132B10 00E33821 */      addu $a3, $a3, $v1
  /* 130D94 80132B14 00073880 */       sll $a3, $a3, 2
  /* 130D98 80132B18 00E33821 */      addu $a3, $a3, $v1
  /* 130D9C 80132B1C 24E90018 */     addiu $t1, $a3, 0x18
  /* 130DA0 80132B20 44892000 */      mtc1 $t1, $f4
  /* 130DA4 80132B24 00034080 */       sll $t0, $v1, 2
  /* 130DA8 80132B28 01034023 */      subu $t0, $t0, $v1
  /* 130DAC 80132B2C 468021A0 */   cvt.s.w $f6, $f4
  /* 130DB0 80132B30 8FA60020 */        lw $a2, 0x20($sp)
  /* 130DB4 80132B34 44814000 */      mtc1 $at, $f8 # 143.0 to cop1
  /* 130DB8 80132B38 00084100 */       sll $t0, $t0, 4
  /* 130DBC 80132B3C 3179FFDF */      andi $t9, $t3, 0xffdf
  /* 130DC0 80132B40 01034023 */      subu $t0, $t0, $v1
  /* 130DC4 80132B44 A4590024 */        sh $t9, 0x24($v0)
  /* 130DC8 80132B48 372F0001 */       ori $t7, $t9, 1
  /* 130DCC 80132B4C 00084080 */       sll $t0, $t0, 2
  /* 130DD0 80132B50 3C0E8014 */       lui $t6, %hi(D_ovl26_8013BB0C)
  /* 130DD4 80132B54 E4460058 */      swc1 $f6, 0x58($v0)
  /* 130DD8 80132B58 A44F0024 */        sh $t7, 0x24($v0)
  /* 130DDC 80132B5C 01C87021 */      addu $t6, $t6, $t0
  /* 130DE0 80132B60 E448005C */      swc1 $f8, 0x5c($v0)
  /* 130DE4 80132B64 8DCEBB0C */        lw $t6, %lo(D_ovl26_8013BB0C)($t6)
  /* 130DE8 80132B68 24030044 */     addiu $v1, $zero, 0x44
  /* 130DEC 80132B6C 3C0D8014 */       lui $t5, %hi(D_ovl26_8013C4A0)
  /* 130DF0 80132B70 15C00006 */      bnez $t6, .L80132B8C
  /* 130DF4 80132B74 03A6C021 */      addu $t8, $sp, $a2
  /* 130DF8 80132B78 2403001E */     addiu $v1, $zero, 0x1e
  /* 130DFC 80132B7C A0430028 */        sb $v1, 0x28($v0)
  /* 130E00 80132B80 A0430029 */        sb $v1, 0x29($v0)
  /* 130E04 80132B84 10000004 */         b .L80132B98
  /* 130E08 80132B88 A043002A */        sb $v1, 0x2a($v0)
  .L80132B8C:
  /* 130E0C 80132B8C A0430028 */        sb $v1, 0x28($v0)
  /* 130E10 80132B90 A0430029 */        sb $v1, 0x29($v0)
  /* 130E14 80132B94 A043002A */        sb $v1, 0x2a($v0)
  .L80132B98:
  /* 130E18 80132B98 8F180024 */        lw $t8, 0x24($t8)
  /* 130E1C 80132B9C 8DADC4A0 */        lw $t5, %lo(D_ovl26_8013C4A0)($t5)
  /* 130E20 80132BA0 AFA7001C */        sw $a3, 0x1c($sp)
  /* 130E24 80132BA4 8FA400E8 */        lw $a0, 0xe8($sp)
  /* 130E28 80132BA8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 130E2C 80132BAC 030D2821 */      addu $a1, $t8, $t5
  /* 130E30 80132BB0 8FA7001C */        lw $a3, 0x1c($sp)
  /* 130E34 80132BB4 94490024 */       lhu $t1, 0x24($v0)
  /* 130E38 80132BB8 3C014349 */       lui $at, (0x43490000 >> 16) # 201.0
  /* 130E3C 80132BBC 24EA0016 */     addiu $t2, $a3, 0x16
  /* 130E40 80132BC0 448A5000 */      mtc1 $t2, $f10
  /* 130E44 80132BC4 44819000 */      mtc1 $at, $f18 # 201.0 to cop1
  /* 130E48 80132BC8 312CFFDF */      andi $t4, $t1, 0xffdf
  /* 130E4C 80132BCC 46805420 */   cvt.s.w $f16, $f10
  /* 130E50 80132BD0 A44C0024 */        sh $t4, 0x24($v0)
  /* 130E54 80132BD4 35990001 */       ori $t9, $t4, 1
  /* 130E58 80132BD8 A4590024 */        sh $t9, 0x24($v0)
  /* 130E5C 80132BDC E452005C */      swc1 $f18, 0x5c($v0)
  /* 130E60 80132BE0 E4500058 */      swc1 $f16, 0x58($v0)
  .L80132BE4:
  /* 130E64 80132BE4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 130E68 80132BE8 27BD00E8 */     addiu $sp, $sp, 0xe8
  /* 130E6C 80132BEC 03E00008 */        jr $ra
  /* 130E70 80132BF0 00000000 */       nop

glabel func_ovl26_80132BF4
  /* 130E74 80132BF4 00047080 */       sll $t6, $a0, 2
  /* 130E78 80132BF8 01C47023 */      subu $t6, $t6, $a0
  /* 130E7C 80132BFC 000E7100 */       sll $t6, $t6, 4
  /* 130E80 80132C00 01C47023 */      subu $t6, $t6, $a0
  /* 130E84 80132C04 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 130E88 80132C08 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 130E8C 80132C0C 000E7080 */       sll $t6, $t6, 2
  /* 130E90 80132C10 01CF1021 */      addu $v0, $t6, $t7
  /* 130E94 80132C14 00041900 */       sll $v1, $a0, 4
  /* 130E98 80132C18 8C5800A4 */        lw $t8, 0xa4($v0)
  /* 130E9C 80132C1C 00641821 */      addu $v1, $v1, $a0
  /* 130EA0 80132C20 00031880 */       sll $v1, $v1, 2
  /* 130EA4 80132C24 00641821 */      addu $v1, $v1, $a0
  /* 130EA8 80132C28 0303C821 */      addu $t9, $t8, $v1
  /* 130EAC 80132C2C 2728FFED */     addiu $t0, $t9, -0x13
  /* 130EB0 80132C30 44882000 */      mtc1 $t0, $f4
  /* 130EB4 80132C34 8C490014 */        lw $t1, 0x14($v0)
  /* 130EB8 80132C38 468021A0 */   cvt.s.w $f6, $f4
  /* 130EBC 80132C3C 8D2A0074 */        lw $t2, 0x74($t1)
  /* 130EC0 80132C40 E5460058 */      swc1 $f6, 0x58($t2)
  /* 130EC4 80132C44 8C4B00A4 */        lw $t3, 0xa4($v0)
  /* 130EC8 80132C48 8C4E0014 */        lw $t6, 0x14($v0)
  /* 130ECC 80132C4C 006B6023 */      subu $t4, $v1, $t3
  /* 130ED0 80132C50 258D0058 */     addiu $t5, $t4, 0x58
  /* 130ED4 80132C54 448D4000 */      mtc1 $t5, $f8
  /* 130ED8 80132C58 8DCF0074 */        lw $t7, 0x74($t6)
  /* 130EDC 80132C5C 468042A0 */   cvt.s.w $f10, $f8
  /* 130EE0 80132C60 8DF80008 */        lw $t8, 8($t7)
  /* 130EE4 80132C64 03E00008 */        jr $ra
  /* 130EE8 80132C68 E70A0058 */      swc1 $f10, 0x58($t8)

glabel func_ovl26_80132C6C
  /* 130EEC 80132C6C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 130EF0 80132C70 AFBF0014 */        sw $ra, 0x14($sp)
  /* 130EF4 80132C74 8C850084 */        lw $a1, 0x84($a0)
  /* 130EF8 80132C78 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 130EFC 80132C7C 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 130F00 80132C80 00057080 */       sll $t6, $a1, 2
  /* 130F04 80132C84 01C57023 */      subu $t6, $t6, $a1
  /* 130F08 80132C88 000E7100 */       sll $t6, $t6, 4
  /* 130F0C 80132C8C 01C57023 */      subu $t6, $t6, $a1
  /* 130F10 80132C90 000E7080 */       sll $t6, $t6, 2
  /* 130F14 80132C94 01CF1821 */      addu $v1, $t6, $t7
  /* 130F18 80132C98 8C780084 */        lw $t8, 0x84($v1)
  /* 130F1C 80132C9C 24060002 */     addiu $a2, $zero, 2
  /* 130F20 80132CA0 54D80013 */      bnel $a2, $t8, .L80132CF0
  /* 130F24 80132CA4 8C6200A4 */        lw $v0, 0xa4($v1)
  /* 130F28 80132CA8 8C6200A4 */        lw $v0, 0xa4($v1)
  /* 130F2C 80132CAC 28410029 */      slti $at, $v0, 0x29
  /* 130F30 80132CB0 10200016 */      beqz $at, .L80132D0C
  /* 130F34 80132CB4 24590002 */     addiu $t9, $v0, 2
  /* 130F38 80132CB8 2B210029 */      slti $at, $t9, 0x29
  /* 130F3C 80132CBC 14200007 */      bnez $at, .L80132CDC
  /* 130F40 80132CC0 AC7900A4 */        sw $t9, 0xa4($v1)
  /* 130F44 80132CC4 24090029 */     addiu $t1, $zero, 0x29
  /* 130F48 80132CC8 AC6900A4 */        sw $t1, 0xa4($v1)
  /* 130F4C 80132CCC 240400A6 */     addiu $a0, $zero, 0xa6
  /* 130F50 80132CD0 0C009A70 */       jal func_800269C0
  /* 130F54 80132CD4 AFA5001C */        sw $a1, 0x1c($sp)
  /* 130F58 80132CD8 8FA5001C */        lw $a1, 0x1c($sp)
  .L80132CDC:
  /* 130F5C 80132CDC 0C04CAFD */       jal func_ovl26_80132BF4
  /* 130F60 80132CE0 00A02025 */        or $a0, $a1, $zero
  /* 130F64 80132CE4 1000000A */         b .L80132D10
  /* 130F68 80132CE8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 130F6C 80132CEC 8C6200A4 */        lw $v0, 0xa4($v1)
  .L80132CF0:
  /* 130F70 80132CF0 18400006 */      blez $v0, .L80132D0C
  /* 130F74 80132CF4 244AFFFE */     addiu $t2, $v0, -2
  /* 130F78 80132CF8 05410002 */      bgez $t2, .L80132D04
  /* 130F7C 80132CFC AC6A00A4 */        sw $t2, 0xa4($v1)
  /* 130F80 80132D00 AC6000A4 */        sw $zero, 0xa4($v1)
  .L80132D04:
  /* 130F84 80132D04 0C04CAFD */       jal func_ovl26_80132BF4
  /* 130F88 80132D08 00A02025 */        or $a0, $a1, $zero
  .L80132D0C:
  /* 130F8C 80132D0C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132D10:
  /* 130F90 80132D10 27BD0020 */     addiu $sp, $sp, 0x20
  /* 130F94 80132D14 03E00008 */        jr $ra
  /* 130F98 80132D18 00000000 */       nop

glabel mnBattleCreatePortraitViewport
  /* 130F9C 80132D1C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 130FA0 80132D20 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 130FA4 80132D24 AFBF003C */        sw $ra, 0x3c($sp)
  /* 130FA8 80132D28 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 130FAC 80132D2C 240F0046 */     addiu $t7, $zero, 0x46
  /* 130FB0 80132D30 24180000 */     addiu $t8, $zero, 0
  /* 130FB4 80132D34 3C190800 */       lui $t9, 0x800
  /* 130FB8 80132D38 2408FFFF */     addiu $t0, $zero, -1
  /* 130FBC 80132D3C 24090001 */     addiu $t1, $zero, 1
  /* 130FC0 80132D40 240A0001 */     addiu $t2, $zero, 1
  /* 130FC4 80132D44 AFAA0030 */        sw $t2, 0x30($sp)
  /* 130FC8 80132D48 AFA90028 */        sw $t1, 0x28($sp)
  /* 130FCC 80132D4C AFA80020 */        sw $t0, 0x20($sp)
  /* 130FD0 80132D50 AFB9001C */        sw $t9, 0x1c($sp)
  /* 130FD4 80132D54 AFB80018 */        sw $t8, 0x18($sp)
  /* 130FD8 80132D58 AFAF0014 */        sw $t7, 0x14($sp)
  /* 130FDC 80132D5C AFAE0010 */        sw $t6, 0x10($sp)
  /* 130FE0 80132D60 AFA00024 */        sw $zero, 0x24($sp)
  /* 130FE4 80132D64 AFA0002C */        sw $zero, 0x2c($sp)
  /* 130FE8 80132D68 AFA00034 */        sw $zero, 0x34($sp)
  /* 130FEC 80132D6C 24040401 */     addiu $a0, $zero, 0x401
  /* 130FF0 80132D70 00002825 */        or $a1, $zero, $zero
  /* 130FF4 80132D74 24060010 */     addiu $a2, $zero, 0x10
  /* 130FF8 80132D78 0C002E4F */       jal func_8000B93C
  /* 130FFC 80132D7C 3C078000 */       lui $a3, 0x8000
  /* 131000 80132D80 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 131004 80132D84 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 131008 80132D88 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13100C 80132D8C 8C430074 */        lw $v1, 0x74($v0)
  /* 131010 80132D90 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 131014 80132D94 44050000 */      mfc1 $a1, $f0
  /* 131018 80132D98 44060000 */      mfc1 $a2, $f0
  /* 13101C 80132D9C 3C07439B */       lui $a3, 0x439b
  /* 131020 80132DA0 24640008 */     addiu $a0, $v1, 8
  /* 131024 80132DA4 0C001C20 */       jal func_80007080
  /* 131028 80132DA8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13102C 80132DAC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 131030 80132DB0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 131034 80132DB4 03E00008 */        jr $ra
  /* 131038 80132DB8 00000000 */       nop

glabel mnBattleCreatePortraitBackgroundViewport
  /* 13103C 80132DBC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 131040 80132DC0 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 131044 80132DC4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 131048 80132DC8 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13104C 80132DCC 240F004B */     addiu $t7, $zero, 0x4b
  /* 131050 80132DD0 24180010 */     addiu $t8, $zero, 0x10
  /* 131054 80132DD4 24190000 */     addiu $t9, $zero, 0
  /* 131058 80132DD8 2408FFFF */     addiu $t0, $zero, -1
  /* 13105C 80132DDC 24090001 */     addiu $t1, $zero, 1
  /* 131060 80132DE0 240A0001 */     addiu $t2, $zero, 1
  /* 131064 80132DE4 AFAA0030 */        sw $t2, 0x30($sp)
  /* 131068 80132DE8 AFA90028 */        sw $t1, 0x28($sp)
  /* 13106C 80132DEC AFA80020 */        sw $t0, 0x20($sp)
  /* 131070 80132DF0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 131074 80132DF4 AFB80018 */        sw $t8, 0x18($sp)
  /* 131078 80132DF8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13107C 80132DFC AFAE0010 */        sw $t6, 0x10($sp)
  /* 131080 80132E00 AFA00024 */        sw $zero, 0x24($sp)
  /* 131084 80132E04 AFA0002C */        sw $zero, 0x2c($sp)
  /* 131088 80132E08 AFA00034 */        sw $zero, 0x34($sp)
  /* 13108C 80132E0C 24040401 */     addiu $a0, $zero, 0x401
  /* 131090 80132E10 00002825 */        or $a1, $zero, $zero
  /* 131094 80132E14 24060010 */     addiu $a2, $zero, 0x10
  /* 131098 80132E18 0C002E4F */       jal func_8000B93C
  /* 13109C 80132E1C 3C078000 */       lui $a3, 0x8000
  /* 1310A0 80132E20 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1310A4 80132E24 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1310A8 80132E28 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1310AC 80132E2C 8C430074 */        lw $v1, 0x74($v0)
  /* 1310B0 80132E30 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1310B4 80132E34 44050000 */      mfc1 $a1, $f0
  /* 1310B8 80132E38 44060000 */      mfc1 $a2, $f0
  /* 1310BC 80132E3C 3C07439B */       lui $a3, 0x439b
  /* 1310C0 80132E40 24640008 */     addiu $a0, $v1, 8
  /* 1310C4 80132E44 0C001C20 */       jal func_80007080
  /* 1310C8 80132E48 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1310CC 80132E4C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1310D0 80132E50 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1310D4 80132E54 03E00008 */        jr $ra
  /* 1310D8 80132E58 00000000 */       nop

glabel mnBattleCreatePortraitWhiteBackgroundViewport
  /* 1310DC 80132E5C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1310E0 80132E60 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1310E4 80132E64 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1310E8 80132E68 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1310EC 80132E6C 240F0049 */     addiu $t7, $zero, 0x49
  /* 1310F0 80132E70 24180020 */     addiu $t8, $zero, 0x20
  /* 1310F4 80132E74 24190000 */     addiu $t9, $zero, 0
  /* 1310F8 80132E78 2408FFFF */     addiu $t0, $zero, -1
  /* 1310FC 80132E7C 24090001 */     addiu $t1, $zero, 1
  /* 131100 80132E80 240A0001 */     addiu $t2, $zero, 1
  /* 131104 80132E84 AFAA0030 */        sw $t2, 0x30($sp)
  /* 131108 80132E88 AFA90028 */        sw $t1, 0x28($sp)
  /* 13110C 80132E8C AFA80020 */        sw $t0, 0x20($sp)
  /* 131110 80132E90 AFB9001C */        sw $t9, 0x1c($sp)
  /* 131114 80132E94 AFB80018 */        sw $t8, 0x18($sp)
  /* 131118 80132E98 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13111C 80132E9C AFAE0010 */        sw $t6, 0x10($sp)
  /* 131120 80132EA0 AFA00024 */        sw $zero, 0x24($sp)
  /* 131124 80132EA4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 131128 80132EA8 AFA00034 */        sw $zero, 0x34($sp)
  /* 13112C 80132EAC 24040401 */     addiu $a0, $zero, 0x401
  /* 131130 80132EB0 00002825 */        or $a1, $zero, $zero
  /* 131134 80132EB4 24060010 */     addiu $a2, $zero, 0x10
  /* 131138 80132EB8 0C002E4F */       jal func_8000B93C
  /* 13113C 80132EBC 3C078000 */       lui $a3, 0x8000
  /* 131140 80132EC0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 131144 80132EC4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 131148 80132EC8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13114C 80132ECC 8C430074 */        lw $v1, 0x74($v0)
  /* 131150 80132ED0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 131154 80132ED4 44050000 */      mfc1 $a1, $f0
  /* 131158 80132ED8 44060000 */      mfc1 $a2, $f0
  /* 13115C 80132EDC 3C07439B */       lui $a3, 0x439b
  /* 131160 80132EE0 24640008 */     addiu $a0, $v1, 8
  /* 131164 80132EE4 0C001C20 */       jal func_80007080
  /* 131168 80132EE8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13116C 80132EEC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 131170 80132EF0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 131174 80132EF4 03E00008 */        jr $ra
  /* 131178 80132EF8 00000000 */       nop

glabel mnBattleCreatePanelDoorsViewport
  /* 13117C 80132EFC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 131180 80132F00 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 131184 80132F04 AFBF003C */        sw $ra, 0x3c($sp)
  /* 131188 80132F08 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13118C 80132F0C 240F0028 */     addiu $t7, $zero, 0x28
  /* 131190 80132F10 24180000 */     addiu $t8, $zero, 0
  /* 131194 80132F14 3C192000 */       lui $t9, 0x2000
  /* 131198 80132F18 2408FFFF */     addiu $t0, $zero, -1
  /* 13119C 80132F1C 24090001 */     addiu $t1, $zero, 1
  /* 1311A0 80132F20 240A0001 */     addiu $t2, $zero, 1
  /* 1311A4 80132F24 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1311A8 80132F28 AFA90028 */        sw $t1, 0x28($sp)
  /* 1311AC 80132F2C AFA80020 */        sw $t0, 0x20($sp)
  /* 1311B0 80132F30 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1311B4 80132F34 AFB80018 */        sw $t8, 0x18($sp)
  /* 1311B8 80132F38 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1311BC 80132F3C AFAE0010 */        sw $t6, 0x10($sp)
  /* 1311C0 80132F40 AFA00024 */        sw $zero, 0x24($sp)
  /* 1311C4 80132F44 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1311C8 80132F48 AFA00034 */        sw $zero, 0x34($sp)
  /* 1311CC 80132F4C 24040401 */     addiu $a0, $zero, 0x401
  /* 1311D0 80132F50 00002825 */        or $a1, $zero, $zero
  /* 1311D4 80132F54 24060010 */     addiu $a2, $zero, 0x10
  /* 1311D8 80132F58 0C002E4F */       jal func_8000B93C
  /* 1311DC 80132F5C 3C078000 */       lui $a3, 0x8000
  /* 1311E0 80132F60 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1311E4 80132F64 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1311E8 80132F68 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1311EC 80132F6C 8C430074 */        lw $v1, 0x74($v0)
  /* 1311F0 80132F70 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1311F4 80132F74 44050000 */      mfc1 $a1, $f0
  /* 1311F8 80132F78 44060000 */      mfc1 $a2, $f0
  /* 1311FC 80132F7C 3C07439B */       lui $a3, 0x439b
  /* 131200 80132F80 24640008 */     addiu $a0, $v1, 8
  /* 131204 80132F84 0C001C20 */       jal func_80007080
  /* 131208 80132F88 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13120C 80132F8C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 131210 80132F90 27BD0040 */     addiu $sp, $sp, 0x40
  /* 131214 80132F94 03E00008 */        jr $ra
  /* 131218 80132F98 00000000 */       nop

glabel mnBattleCreateTypeButtonViewport
  /* 13121C 80132F9C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 131220 80132FA0 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 131224 80132FA4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 131228 80132FA8 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13122C 80132FAC 240F0023 */     addiu $t7, $zero, 0x23
  /* 131230 80132FB0 24180000 */     addiu $t8, $zero, 0
  /* 131234 80132FB4 3C194000 */       lui $t9, 0x4000
  /* 131238 80132FB8 2408FFFF */     addiu $t0, $zero, -1
  /* 13123C 80132FBC 24090001 */     addiu $t1, $zero, 1
  /* 131240 80132FC0 240A0001 */     addiu $t2, $zero, 1
  /* 131244 80132FC4 AFAA0030 */        sw $t2, 0x30($sp)
  /* 131248 80132FC8 AFA90028 */        sw $t1, 0x28($sp)
  /* 13124C 80132FCC AFA80020 */        sw $t0, 0x20($sp)
  /* 131250 80132FD0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 131254 80132FD4 AFB80018 */        sw $t8, 0x18($sp)
  /* 131258 80132FD8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13125C 80132FDC AFAE0010 */        sw $t6, 0x10($sp)
  /* 131260 80132FE0 AFA00024 */        sw $zero, 0x24($sp)
  /* 131264 80132FE4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 131268 80132FE8 AFA00034 */        sw $zero, 0x34($sp)
  /* 13126C 80132FEC 24040401 */     addiu $a0, $zero, 0x401
  /* 131270 80132FF0 00002825 */        or $a1, $zero, $zero
  /* 131274 80132FF4 24060010 */     addiu $a2, $zero, 0x10
  /* 131278 80132FF8 0C002E4F */       jal func_8000B93C
  /* 13127C 80132FFC 3C078000 */       lui $a3, 0x8000
  /* 131280 80133000 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 131284 80133004 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 131288 80133008 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13128C 8013300C 8C430074 */        lw $v1, 0x74($v0)
  /* 131290 80133010 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 131294 80133014 44050000 */      mfc1 $a1, $f0
  /* 131298 80133018 44060000 */      mfc1 $a2, $f0
  /* 13129C 8013301C 3C07439B */       lui $a3, 0x439b
  /* 1312A0 80133020 24640008 */     addiu $a0, $v1, 8
  /* 1312A4 80133024 0C001C20 */       jal func_80007080
  /* 1312A8 80133028 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1312AC 8013302C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1312B0 80133030 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1312B4 80133034 03E00008 */        jr $ra
  /* 1312B8 80133038 00000000 */       nop

glabel mnBattleCreatePanelViewport
  /* 1312BC 8013303C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1312C0 80133040 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1312C4 80133044 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1312C8 80133048 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1312CC 8013304C 240F0032 */     addiu $t7, $zero, 0x32
  /* 1312D0 80133050 24180000 */     addiu $t8, $zero, 0
  /* 1312D4 80133054 3C191000 */       lui $t9, 0x1000
  /* 1312D8 80133058 2408FFFF */     addiu $t0, $zero, -1
  /* 1312DC 8013305C 24090001 */     addiu $t1, $zero, 1
  /* 1312E0 80133060 240A0001 */     addiu $t2, $zero, 1
  /* 1312E4 80133064 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1312E8 80133068 AFA90028 */        sw $t1, 0x28($sp)
  /* 1312EC 8013306C AFA80020 */        sw $t0, 0x20($sp)
  /* 1312F0 80133070 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1312F4 80133074 AFB80018 */        sw $t8, 0x18($sp)
  /* 1312F8 80133078 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1312FC 8013307C AFAE0010 */        sw $t6, 0x10($sp)
  /* 131300 80133080 AFA00024 */        sw $zero, 0x24($sp)
  /* 131304 80133084 AFA0002C */        sw $zero, 0x2c($sp)
  /* 131308 80133088 AFA00034 */        sw $zero, 0x34($sp)
  /* 13130C 8013308C 24040401 */     addiu $a0, $zero, 0x401
  /* 131310 80133090 00002825 */        or $a1, $zero, $zero
  /* 131314 80133094 24060010 */     addiu $a2, $zero, 0x10
  /* 131318 80133098 0C002E4F */       jal func_8000B93C
  /* 13131C 8013309C 3C078000 */       lui $a3, 0x8000
  /* 131320 801330A0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 131324 801330A4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 131328 801330A8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13132C 801330AC 8C430074 */        lw $v1, 0x74($v0)
  /* 131330 801330B0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 131334 801330B4 44050000 */      mfc1 $a1, $f0
  /* 131338 801330B8 44060000 */      mfc1 $a2, $f0
  /* 13133C 801330BC 3C07439B */       lui $a3, 0x439b
  /* 131340 801330C0 24640008 */     addiu $a0, $v1, 8
  /* 131344 801330C4 0C001C20 */       jal func_80007080
  /* 131348 801330C8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13134C 801330CC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 131350 801330D0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 131354 801330D4 03E00008 */        jr $ra
  /* 131358 801330D8 00000000 */       nop

glabel mnBattleCreateTeamButtonViewPort
  /* 13135C 801330DC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 131360 801330E0 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 131364 801330E4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 131368 801330E8 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13136C 801330EC 240F002D */     addiu $t7, $zero, 0x2d
  /* 131370 801330F0 24180004 */     addiu $t8, $zero, 4
  /* 131374 801330F4 24190000 */     addiu $t9, $zero, 0
  /* 131378 801330F8 2408FFFF */     addiu $t0, $zero, -1
  /* 13137C 801330FC 24090001 */     addiu $t1, $zero, 1
  /* 131380 80133100 240A0001 */     addiu $t2, $zero, 1
  /* 131384 80133104 AFAA0030 */        sw $t2, 0x30($sp)
  /* 131388 80133108 AFA90028 */        sw $t1, 0x28($sp)
  /* 13138C 8013310C AFA80020 */        sw $t0, 0x20($sp)
  /* 131390 80133110 AFB9001C */        sw $t9, 0x1c($sp)
  /* 131394 80133114 AFB80018 */        sw $t8, 0x18($sp)
  /* 131398 80133118 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13139C 8013311C AFAE0010 */        sw $t6, 0x10($sp)
  /* 1313A0 80133120 AFA00024 */        sw $zero, 0x24($sp)
  /* 1313A4 80133124 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1313A8 80133128 AFA00034 */        sw $zero, 0x34($sp)
  /* 1313AC 8013312C 24040401 */     addiu $a0, $zero, 0x401
  /* 1313B0 80133130 00002825 */        or $a1, $zero, $zero
  /* 1313B4 80133134 24060010 */     addiu $a2, $zero, 0x10
  /* 1313B8 80133138 0C002E4F */       jal func_8000B93C
  /* 1313BC 8013313C 3C078000 */       lui $a3, 0x8000
  /* 1313C0 80133140 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1313C4 80133144 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1313C8 80133148 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1313CC 8013314C 8C430074 */        lw $v1, 0x74($v0)
  /* 1313D0 80133150 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1313D4 80133154 44050000 */      mfc1 $a1, $f0
  /* 1313D8 80133158 44060000 */      mfc1 $a2, $f0
  /* 1313DC 8013315C 3C07439B */       lui $a3, 0x439b
  /* 1313E0 80133160 24640008 */     addiu $a0, $v1, 8
  /* 1313E4 80133164 0C001C20 */       jal func_80007080
  /* 1313E8 80133168 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1313EC 8013316C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1313F0 80133170 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1313F4 80133174 03E00008 */        jr $ra
  /* 1313F8 80133178 00000000 */       nop

  glabel jtgt_ovl26_8013317C
  /* 1313FC 8013317C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 131400 80133180 AFBF0014 */        sw $ra, 0x14($sp)
  /* 131404 80133184 AFA40018 */        sw $a0, 0x18($sp)
  /* 131408 80133188 24040016 */     addiu $a0, $zero, 0x16
  /* 13140C 8013318C 24050058 */     addiu $a1, $zero, 0x58
  /* 131410 80133190 2406007E */     addiu $a2, $zero, 0x7e
  /* 131414 80133194 0C03347C */       jal func_ovl0_800CD1F0
  /* 131418 80133198 240700D9 */     addiu $a3, $zero, 0xd9
  /* 13141C 8013319C 0C0333C0 */       jal func_ovl0_800CCF00
  /* 131420 801331A0 8FA40018 */        lw $a0, 0x18($sp)
  /* 131424 801331A4 2404000A */     addiu $a0, $zero, 0xa
  /* 131428 801331A8 24050136 */     addiu $a1, $zero, 0x136
  /* 13142C 801331AC 2406000A */     addiu $a2, $zero, 0xa
  /* 131430 801331B0 0C03347C */       jal func_ovl0_800CD1F0
  /* 131434 801331B4 240700E6 */     addiu $a3, $zero, 0xe6
  /* 131438 801331B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13143C 801331BC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 131440 801331C0 03E00008 */        jr $ra
  /* 131444 801331C4 00000000 */       nop

  glabel jtgt_ovl26_801331C8
  /* 131448 801331C8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13144C 801331CC AFBF0014 */        sw $ra, 0x14($sp)
  /* 131450 801331D0 AFA40018 */        sw $a0, 0x18($sp)
  /* 131454 801331D4 2404005B */     addiu $a0, $zero, 0x5b
  /* 131458 801331D8 2405009D */     addiu $a1, $zero, 0x9d
  /* 13145C 801331DC 2406007E */     addiu $a2, $zero, 0x7e
  /* 131460 801331E0 0C03347C */       jal func_ovl0_800CD1F0
  /* 131464 801331E4 240700D9 */     addiu $a3, $zero, 0xd9
  /* 131468 801331E8 0C0333C0 */       jal func_ovl0_800CCF00
  /* 13146C 801331EC 8FA40018 */        lw $a0, 0x18($sp)
  /* 131470 801331F0 2404000A */     addiu $a0, $zero, 0xa
  /* 131474 801331F4 24050136 */     addiu $a1, $zero, 0x136
  /* 131478 801331F8 2406000A */     addiu $a2, $zero, 0xa
  /* 13147C 801331FC 0C03347C */       jal func_ovl0_800CD1F0
  /* 131480 80133200 240700E6 */     addiu $a3, $zero, 0xe6
  /* 131484 80133204 8FBF0014 */        lw $ra, 0x14($sp)
  /* 131488 80133208 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13148C 8013320C 03E00008 */        jr $ra
  /* 131490 80133210 00000000 */       nop

  glabel jtgt_ovl26_80133214
  /* 131494 80133214 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 131498 80133218 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13149C 8013321C AFA40018 */        sw $a0, 0x18($sp)
  /* 1314A0 80133220 240400A0 */     addiu $a0, $zero, 0xa0
  /* 1314A4 80133224 240500E2 */     addiu $a1, $zero, 0xe2
  /* 1314A8 80133228 2406007E */     addiu $a2, $zero, 0x7e
  /* 1314AC 8013322C 0C03347C */       jal func_ovl0_800CD1F0
  /* 1314B0 80133230 240700D9 */     addiu $a3, $zero, 0xd9
  /* 1314B4 80133234 0C0333C0 */       jal func_ovl0_800CCF00
  /* 1314B8 80133238 8FA40018 */        lw $a0, 0x18($sp)
  /* 1314BC 8013323C 2404000A */     addiu $a0, $zero, 0xa
  /* 1314C0 80133240 24050136 */     addiu $a1, $zero, 0x136
  /* 1314C4 80133244 2406000A */     addiu $a2, $zero, 0xa
  /* 1314C8 80133248 0C03347C */       jal func_ovl0_800CD1F0
  /* 1314CC 8013324C 240700E6 */     addiu $a3, $zero, 0xe6
  /* 1314D0 80133250 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1314D4 80133254 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1314D8 80133258 03E00008 */        jr $ra
  /* 1314DC 8013325C 00000000 */       nop

  glabel jtgt_ovl26_80133260
  /* 1314E0 80133260 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1314E4 80133264 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1314E8 80133268 AFA40018 */        sw $a0, 0x18($sp)
  /* 1314EC 8013326C 240400E5 */     addiu $a0, $zero, 0xe5
  /* 1314F0 80133270 24050127 */     addiu $a1, $zero, 0x127
  /* 1314F4 80133274 2406007E */     addiu $a2, $zero, 0x7e
  /* 1314F8 80133278 0C03347C */       jal func_ovl0_800CD1F0
  /* 1314FC 8013327C 240700D9 */     addiu $a3, $zero, 0xd9
  /* 131500 80133280 0C0333C0 */       jal func_ovl0_800CCF00
  /* 131504 80133284 8FA40018 */        lw $a0, 0x18($sp)
  /* 131508 80133288 2404000A */     addiu $a0, $zero, 0xa
  /* 13150C 8013328C 24050136 */     addiu $a1, $zero, 0x136
  /* 131510 80133290 2406000A */     addiu $a2, $zero, 0xa
  /* 131514 80133294 0C03347C */       jal func_ovl0_800CD1F0
  /* 131518 80133298 240700E6 */     addiu $a3, $zero, 0xe6
  /* 13151C 8013329C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 131520 801332A0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 131524 801332A4 03E00008 */        jr $ra
  /* 131528 801332A8 00000000 */       nop

glabel func_ovl26_801332AC
  /* 13152C 801332AC 3C0E8014 */       lui $t6, %hi(dMNBattlePanelOffsets)
  /* 131530 801332B0 25CEB66C */     addiu $t6, $t6, %lo(dMNBattlePanelOffsets)
  /* 131534 801332B4 8DD80000 */        lw $t8, ($t6) # dMNBattlePanelOffsets + 0
  /* 131538 801332B8 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13153C 801332BC 27A3001C */     addiu $v1, $sp, 0x1c
  /* 131540 801332C0 AC780000 */        sw $t8, ($v1)
  /* 131544 801332C4 8DCF0004 */        lw $t7, 4($t6) # dMNBattlePanelOffsets + 4
  /* 131548 801332C8 3C198014 */       lui $t9, %hi(dMNBattlePanelCPUOffsets)
  /* 13154C 801332CC 2739B67C */     addiu $t9, $t9, %lo(dMNBattlePanelCPUOffsets)
  /* 131550 801332D0 AC6F0004 */        sw $t7, 4($v1)
  /* 131554 801332D4 8DD80008 */        lw $t8, 8($t6) # dMNBattlePanelOffsets + 8
  /* 131558 801332D8 27A7000C */     addiu $a3, $sp, 0xc
  /* 13155C 801332DC 3C0B8014 */       lui $t3, %hi(dMNBattleUnusedColors)
  /* 131560 801332E0 AC780008 */        sw $t8, 8($v1)
  /* 131564 801332E4 8DCF000C */        lw $t7, 0xc($t6) # dMNBattlePanelOffsets + 12
  /* 131568 801332E8 256BB68C */     addiu $t3, $t3, %lo(dMNBattleUnusedColors)
  /* 13156C 801332EC 27AA0000 */     addiu $t2, $sp, 0
  /* 131570 801332F0 AC6F000C */        sw $t7, 0xc($v1)
  /* 131574 801332F4 8F290000 */        lw $t1, ($t9) # dMNBattlePanelCPUOffsets + 0
  /* 131578 801332F8 00057080 */       sll $t6, $a1, 2
  /* 13157C 801332FC 006E7821 */      addu $t7, $v1, $t6
  /* 131580 80133300 ACE90000 */        sw $t1, ($a3)
  /* 131584 80133304 8F280004 */        lw $t0, 4($t9) # dMNBattlePanelCPUOffsets + 4
  /* 131588 80133308 ACE80004 */        sw $t0, 4($a3)
  /* 13158C 8013330C 8F290008 */        lw $t1, 8($t9) # dMNBattlePanelCPUOffsets + 8
  /* 131590 80133310 ACE90008 */        sw $t1, 8($a3)
  /* 131594 80133314 8F28000C */        lw $t0, 0xc($t9) # dMNBattlePanelCPUOffsets + 12
  /* 131598 80133318 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 13159C 8013331C ACE8000C */        sw $t0, 0xc($a3)
  /* 1315A0 80133320 8D6D0000 */        lw $t5, ($t3) # dMNBattleUnusedColors + 0
  /* 1315A4 80133324 8D6C0004 */        lw $t4, 4($t3) # dMNBattleUnusedColors + 4
  /* 1315A8 80133328 AD4D0000 */        sw $t5, ($t2)
  /* 1315AC 8013332C 8D6D0008 */        lw $t5, 8($t3) # dMNBattleUnusedColors + 8
  /* 1315B0 80133330 AD4C0004 */        sw $t4, 4($t2)
  /* 1315B4 80133334 AD4D0008 */        sw $t5, 8($t2)
  /* 1315B8 80133338 14C00006 */      bnez $a2, .L80133354
  /* 1315BC 8013333C 8C820074 */        lw $v0, 0x74($a0)
  /* 1315C0 80133340 8DF80000 */        lw $t8, ($t7)
  /* 1315C4 80133344 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 1315C8 80133348 03194021 */      addu $t0, $t8, $t9
  /* 1315CC 8013334C 10000008 */         b .L80133370
  /* 1315D0 80133350 AC480030 */        sw $t0, 0x30($v0)
  .L80133354:
  /* 1315D4 80133354 00054880 */       sll $t1, $a1, 2
  /* 1315D8 80133358 00E95021 */      addu $t2, $a3, $t1
  /* 1315DC 8013335C 3C0C8014 */       lui $t4, %hi(D_ovl26_8013C4A0)
  /* 1315E0 80133360 8D8CC4A0 */        lw $t4, %lo(D_ovl26_8013C4A0)($t4)
  /* 1315E4 80133364 8D4B0000 */        lw $t3, ($t2)
  /* 1315E8 80133368 016C6821 */      addu $t5, $t3, $t4
  /* 1315EC 8013336C AC4D0030 */        sw $t5, 0x30($v0)
  .L80133370:
  /* 1315F0 80133370 03E00008 */        jr $ra
  /* 1315F4 80133374 27BD0030 */     addiu $sp, $sp, 0x30

glabel func_ovl26_80133378
  /* 1315F8 80133378 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 1315FC 8013337C 3C0E8014 */       lui $t6, %hi(dMNBattleTypeButtonOffsetsDuplicate)
  /* 131600 80133380 AFBF0034 */        sw $ra, 0x34($sp)
  /* 131604 80133384 AFA40050 */        sw $a0, 0x50($sp)
  /* 131608 80133388 25CEB698 */     addiu $t6, $t6, %lo(dMNBattleTypeButtonOffsetsDuplicate)
  /* 13160C 8013338C 8DD80000 */        lw $t8, ($t6) # dMNBattleTypeButtonOffsetsDuplicate + 0
  /* 131610 80133390 27A20040 */     addiu $v0, $sp, 0x40
  /* 131614 80133394 3C0D8014 */       lui $t5, %hi(gMNBattlePanels)
  /* 131618 80133398 AC580000 */        sw $t8, ($v0)
  /* 13161C 8013339C 8DCF0004 */        lw $t7, 4($t6) # dMNBattleTypeButtonOffsetsDuplicate + 4
  /* 131620 801333A0 25ADBA88 */     addiu $t5, $t5, %lo(gMNBattlePanels)
  /* 131624 801333A4 3C19800D */       lui $t9, %hi(func_ovl0_800CCF00)
  /* 131628 801333A8 AC4F0004 */        sw $t7, 4($v0)
  /* 13162C 801333AC 8DD80008 */        lw $t8, 8($t6) # dMNBattleTypeButtonOffsetsDuplicate + 8
  /* 131630 801333B0 2409001E */     addiu $t1, $zero, 0x1e
  /* 131634 801333B4 3C078000 */       lui $a3, 0x8000
  /* 131638 801333B8 AC580008 */        sw $t8, 8($v0)
  /* 13163C 801333BC 8FAB0050 */        lw $t3, 0x50($sp)
  /* 131640 801333C0 AFA90014 */        sw $t1, 0x14($sp)
  /* 131644 801333C4 2739CF00 */     addiu $t9, $t9, %lo(func_ovl0_800CCF00)
  /* 131648 801333C8 000B6080 */       sll $t4, $t3, 2
  /* 13164C 801333CC 018B6023 */      subu $t4, $t4, $t3
  /* 131650 801333D0 000C6100 */       sll $t4, $t4, 4
  /* 131654 801333D4 018B6023 */      subu $t4, $t4, $t3
  /* 131658 801333D8 000C6080 */       sll $t4, $t4, 2
  /* 13165C 801333DC 018D4021 */      addu $t0, $t4, $t5
  /* 131660 801333E0 8D0E0084 */        lw $t6, 0x84($t0)
  /* 131664 801333E4 240AFFFF */     addiu $t2, $zero, -1
  /* 131668 801333E8 AFAA001C */        sw $t2, 0x1c($sp)
  /* 13166C 801333EC 000E7880 */       sll $t7, $t6, 2
  /* 131670 801333F0 004FC021 */      addu $t8, $v0, $t7
  /* 131674 801333F4 AFB90010 */        sw $t9, 0x10($sp)
  /* 131678 801333F8 AFA70018 */        sw $a3, 0x18($sp)
  /* 13167C 801333FC 8F190000 */        lw $t9, ($t8)
  /* 131680 80133400 3C098014 */       lui $t1, %hi(D_ovl26_8013C4A0)
  /* 131684 80133404 8D29C4A0 */        lw $t1, %lo(D_ovl26_8013C4A0)($t1)
  /* 131688 80133408 240C0001 */     addiu $t4, $zero, 1
  /* 13168C 8013340C 240B0001 */     addiu $t3, $zero, 1
  /* 131690 80133410 03295021 */      addu $t2, $t9, $t1
  /* 131694 80133414 AFAA0020 */        sw $t2, 0x20($sp)
  /* 131698 80133418 AFAB0024 */        sw $t3, 0x24($sp)
  /* 13169C 8013341C AFAC002C */        sw $t4, 0x2c($sp)
  /* 1316A0 80133420 AFA8003C */        sw $t0, 0x3c($sp)
  /* 1316A4 80133424 AFA00028 */        sw $zero, 0x28($sp)
  /* 1316A8 80133428 00002025 */        or $a0, $zero, $zero
  /* 1316AC 8013342C 00002825 */        or $a1, $zero, $zero
  /* 1316B0 80133430 0C033414 */       jal func_ovl0_800CD050
  /* 1316B4 80133434 24060018 */     addiu $a2, $zero, 0x18
  /* 1316B8 80133438 8FAD0050 */        lw $t5, 0x50($sp)
  /* 1316BC 8013343C 8FA8003C */        lw $t0, 0x3c($sp)
  /* 1316C0 80133440 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 1316C4 80133444 000D7100 */       sll $t6, $t5, 4
  /* 1316C8 80133448 01CD7021 */      addu $t6, $t6, $t5
  /* 1316CC 8013344C 000E7080 */       sll $t6, $t6, 2
  /* 1316D0 80133450 01CD7021 */      addu $t6, $t6, $t5
  /* 1316D4 80133454 25CF0040 */     addiu $t7, $t6, 0x40
  /* 1316D8 80133458 448F2000 */      mtc1 $t7, $f4
  /* 1316DC 8013345C AD02000C */        sw $v0, 0xc($t0)
  /* 1316E0 80133460 8C580074 */        lw $t8, 0x74($v0)
  /* 1316E4 80133464 468021A0 */   cvt.s.w $f6, $f4
  /* 1316E8 80133468 44814000 */      mtc1 $at, $f8 # 131.0 to cop1
  /* 1316EC 8013346C E7060058 */      swc1 $f6, 0x58($t8)
  /* 1316F0 80133470 8C590074 */        lw $t9, 0x74($v0)
  /* 1316F4 80133474 E728005C */      swc1 $f8, 0x5c($t9)
  /* 1316F8 80133478 8C430074 */        lw $v1, 0x74($v0)
  /* 1316FC 8013347C 94690024 */       lhu $t1, 0x24($v1)
  /* 131700 80133480 312AFFDF */      andi $t2, $t1, 0xffdf
  /* 131704 80133484 A46A0024 */        sh $t2, 0x24($v1)
  /* 131708 80133488 8C430074 */        lw $v1, 0x74($v0)
  /* 13170C 8013348C 946B0024 */       lhu $t3, 0x24($v1)
  /* 131710 80133490 356C0001 */       ori $t4, $t3, 1
  /* 131714 80133494 A46C0024 */        sh $t4, 0x24($v1)
  /* 131718 80133498 8FBF0034 */        lw $ra, 0x34($sp)
  /* 13171C 8013349C 27BD0050 */     addiu $sp, $sp, 0x50
  /* 131720 801334A0 03E00008 */        jr $ra
  /* 131724 801334A4 00000000 */       nop

glabel mnBattleCreateTypeImage
  /* 131728 801334A8 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 13172C 801334AC 3C0F8014 */       lui $t7, %hi(dMNBattleTypeOffsets)
  /* 131730 801334B0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 131734 801334B4 AFA40050 */        sw $a0, 0x50($sp)
  /* 131738 801334B8 25EFB6A4 */     addiu $t7, $t7, %lo(dMNBattleTypeOffsets)
  /* 13173C 801334BC 8DF90000 */        lw $t9, ($t7) # dMNBattleTypeOffsets + 0
  /* 131740 801334C0 8DF80004 */        lw $t8, 4($t7) # dMNBattleTypeOffsets + 4
  /* 131744 801334C4 27AE0038 */     addiu $t6, $sp, 0x38
  /* 131748 801334C8 ADD90000 */        sw $t9, ($t6)
  /* 13174C 801334CC ADD80004 */        sw $t8, 4($t6)
  /* 131750 801334D0 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTypeOffsets + 12
  /* 131754 801334D4 8DF90008 */        lw $t9, 8($t7) # dMNBattleTypeOffsets + 8
  /* 131758 801334D8 3C098014 */       lui $t1, %hi(dMNBattleTypeOffsetsX)
  /* 13175C 801334DC 2529B6B4 */     addiu $t1, $t1, %lo(dMNBattleTypeOffsetsX)
  /* 131760 801334E0 ADD8000C */        sw $t8, 0xc($t6)
  /* 131764 801334E4 ADD90008 */        sw $t9, 8($t6)
  /* 131768 801334E8 8D2A0004 */        lw $t2, 4($t1) # dMNBattleTypeOffsetsX + 4
  /* 13176C 801334EC 8D2B0000 */        lw $t3, ($t1) # dMNBattleTypeOffsetsX + 0
  /* 131770 801334F0 27A80028 */     addiu $t0, $sp, 0x28
  /* 131774 801334F4 AD0A0004 */        sw $t2, 4($t0)
  /* 131778 801334F8 AD0B0000 */        sw $t3, ($t0)
  /* 13177C 801334FC 8D2B0008 */        lw $t3, 8($t1) # dMNBattleTypeOffsetsX + 8
  /* 131780 80133500 8D2A000C */        lw $t2, 0xc($t1) # dMNBattleTypeOffsetsX + 12
  /* 131784 80133504 00002025 */        or $a0, $zero, $zero
  /* 131788 80133508 00002825 */        or $a1, $zero, $zero
  /* 13178C 8013350C 24060016 */     addiu $a2, $zero, 0x16
  /* 131790 80133510 3C078000 */       lui $a3, 0x8000
  /* 131794 80133514 AD0B0008 */        sw $t3, 8($t0)
  /* 131798 80133518 0C00265A */       jal omMakeGObjSPAfter
  /* 13179C 8013351C AD0A000C */        sw $t2, 0xc($t0)
  /* 1317A0 80133520 8FAC0050 */        lw $t4, 0x50($sp)
  /* 1317A4 80133524 3C0E8014 */       lui $t6, %hi(gMNBattlePanels)
  /* 1317A8 80133528 25CEBA88 */     addiu $t6, $t6, %lo(gMNBattlePanels)
  /* 1317AC 8013352C 000C6880 */       sll $t5, $t4, 2
  /* 1317B0 80133530 01AC6823 */      subu $t5, $t5, $t4
  /* 1317B4 80133534 000D6900 */       sll $t5, $t5, 4
  /* 1317B8 80133538 01AC6823 */      subu $t5, $t5, $t4
  /* 1317BC 8013353C 000D6880 */       sll $t5, $t5, 2
  /* 1317C0 80133540 01AE1821 */      addu $v1, $t5, $t6
  /* 1317C4 80133544 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1317C8 80133548 240FFFFF */     addiu $t7, $zero, -1
  /* 1317CC 8013354C AC620030 */        sw $v0, 0x30($v1)
  /* 1317D0 80133550 AFA2004C */        sw $v0, 0x4c($sp)
  /* 1317D4 80133554 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1317D8 80133558 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1317DC 8013355C AFA30024 */        sw $v1, 0x24($sp)
  /* 1317E0 80133560 00402025 */        or $a0, $v0, $zero
  /* 1317E4 80133564 2406001C */     addiu $a2, $zero, 0x1c
  /* 1317E8 80133568 0C00277D */       jal omAddGObjRenderProc
  /* 1317EC 8013356C 3C078000 */       lui $a3, 0x8000
  /* 1317F0 80133570 8FA30024 */        lw $v1, 0x24($sp)
  /* 1317F4 80133574 24010001 */     addiu $at, $zero, 1
  /* 1317F8 80133578 8FA4004C */        lw $a0, 0x4c($sp)
  /* 1317FC 8013357C 8C780084 */        lw $t8, 0x84($v1)
  /* 131800 80133580 8FA30050 */        lw $v1, 0x50($sp)
  /* 131804 80133584 3C0D8014 */       lui $t5, 0x8014
  /* 131808 80133588 17010012 */       bne $t8, $at, .L801335D4
  /* 13180C 8013358C 00031880 */       sll $v1, $v1, 2
  /* 131810 80133590 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 131814 80133594 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 131818 80133598 3C080000 */       lui $t0, %hi(D_NF_00000FF8)
  /* 13181C 8013359C 25080FF8 */     addiu $t0, $t0, %lo(D_NF_00000FF8)
  /* 131820 801335A0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 131824 801335A4 03282821 */      addu $a1, $t9, $t0
  /* 131828 801335A8 8FA90050 */        lw $t1, 0x50($sp)
  /* 13182C 801335AC 00095100 */       sll $t2, $t1, 4
  /* 131830 801335B0 01495021 */      addu $t2, $t2, $t1
  /* 131834 801335B4 000A5080 */       sll $t2, $t2, 2
  /* 131838 801335B8 01495021 */      addu $t2, $t2, $t1
  /* 13183C 801335BC 254B001A */     addiu $t3, $t2, 0x1a
  /* 131840 801335C0 448B2000 */      mtc1 $t3, $f4
  /* 131844 801335C4 00000000 */       nop
  /* 131848 801335C8 468021A0 */   cvt.s.w $f6, $f4
  /* 13184C 801335CC 10000014 */         b .L80133620
  /* 131850 801335D0 E4460058 */      swc1 $f6, 0x58($v0)
  .L801335D4:
  /* 131854 801335D4 03A36021 */      addu $t4, $sp, $v1
  /* 131858 801335D8 8D8C0038 */        lw $t4, 0x38($t4)
  /* 13185C 801335DC 8DADC4A0 */        lw $t5, -0x3b60($t5)
  /* 131860 801335E0 AFA30024 */        sw $v1, 0x24($sp)
  /* 131864 801335E4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 131868 801335E8 018D2821 */      addu $a1, $t4, $t5
  /* 13186C 801335EC 8FAF0050 */        lw $t7, 0x50($sp)
  /* 131870 801335F0 8FA30024 */        lw $v1, 0x24($sp)
  /* 131874 801335F4 000FC100 */       sll $t8, $t7, 4
  /* 131878 801335F8 030FC021 */      addu $t8, $t8, $t7
  /* 13187C 801335FC 0018C080 */       sll $t8, $t8, 2
  /* 131880 80133600 030FC021 */      addu $t8, $t8, $t7
  /* 131884 80133604 27190016 */     addiu $t9, $t8, 0x16
  /* 131888 80133608 44995000 */      mtc1 $t9, $f10
  /* 13188C 8013360C 03A37021 */      addu $t6, $sp, $v1
  /* 131890 80133610 C5C80028 */      lwc1 $f8, 0x28($t6)
  /* 131894 80133614 46805420 */   cvt.s.w $f16, $f10
  /* 131898 80133618 46104480 */     add.s $f18, $f8, $f16
  /* 13189C 8013361C E4520058 */      swc1 $f18, 0x58($v0)
  .L80133620:
  /* 1318A0 80133620 94480024 */       lhu $t0, 0x24($v0)
  /* 1318A4 80133624 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 1318A8 80133628 44812000 */      mtc1 $at, $f4 # 131.0 to cop1
  /* 1318AC 8013362C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 1318B0 80133630 A44A0024 */        sh $t2, 0x24($v0)
  /* 1318B4 80133634 354B0001 */       ori $t3, $t2, 1
  /* 1318B8 80133638 A44B0024 */        sh $t3, 0x24($v0)
  /* 1318BC 8013363C A0400028 */        sb $zero, 0x28($v0)
  /* 1318C0 80133640 A0400029 */        sb $zero, 0x29($v0)
  /* 1318C4 80133644 A040002A */        sb $zero, 0x2a($v0)
  /* 1318C8 80133648 E444005C */      swc1 $f4, 0x5c($v0)
  /* 1318CC 8013364C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1318D0 80133650 27BD0050 */     addiu $sp, $sp, 0x50
  /* 1318D4 80133654 03E00008 */        jr $ra
  /* 1318D8 80133658 00000000 */       nop

glabel mnBattleCreatePanel
  /* 1318DC 8013365C 27BDFF60 */     addiu $sp, $sp, -0xa0
  /* 1318E0 80133660 3C0F8014 */       lui $t7, %hi(dMNBattleTypeOffsetsDuplicate)
  /* 1318E4 80133664 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1318E8 80133668 AFB10038 */        sw $s1, 0x38($sp)
  /* 1318EC 8013366C AFB00034 */        sw $s0, 0x34($sp)
  /* 1318F0 80133670 25EFB6C4 */     addiu $t7, $t7, %lo(dMNBattleTypeOffsetsDuplicate)
  /* 1318F4 80133674 8DF90000 */        lw $t9, ($t7) # dMNBattleTypeOffsetsDuplicate + 0
  /* 1318F8 80133678 8DF80004 */        lw $t8, 4($t7) # dMNBattleTypeOffsetsDuplicate + 4
  /* 1318FC 8013367C 27AE0088 */     addiu $t6, $sp, 0x88
  /* 131900 80133680 ADD90000 */        sw $t9, ($t6)
  /* 131904 80133684 ADD80004 */        sw $t8, 4($t6)
  /* 131908 80133688 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTypeOffsetsDuplicate + 12
  /* 13190C 8013368C 8DF90008 */        lw $t9, 8($t7) # dMNBattleTypeOffsetsDuplicate + 8
  /* 131910 80133690 3C098014 */       lui $t1, %hi(dMNBattleTypeOffsetsXDuplicate)
  /* 131914 80133694 2529B6D4 */     addiu $t1, $t1, %lo(dMNBattleTypeOffsetsXDuplicate)
  /* 131918 80133698 ADD8000C */        sw $t8, 0xc($t6)
  /* 13191C 8013369C ADD90008 */        sw $t9, 8($t6)
  /* 131920 801336A0 8D2A0004 */        lw $t2, 4($t1) # dMNBattleTypeOffsetsXDuplicate + 4
  /* 131924 801336A4 8D2B0000 */        lw $t3, ($t1) # dMNBattleTypeOffsetsXDuplicate + 0
  /* 131928 801336A8 27A80078 */     addiu $t0, $sp, 0x78
  /* 13192C 801336AC AD0A0004 */        sw $t2, 4($t0)
  /* 131930 801336B0 AD0B0000 */        sw $t3, ($t0)
  /* 131934 801336B4 8D2B0008 */        lw $t3, 8($t1) # dMNBattleTypeOffsetsXDuplicate + 8
  /* 131938 801336B8 8D2A000C */        lw $t2, 0xc($t1) # dMNBattleTypeOffsetsXDuplicate + 12
  /* 13193C 801336BC 3C0D8014 */       lui $t5, %hi(dMNBattlePanelProcRenderList)
  /* 131940 801336C0 25ADB6E4 */     addiu $t5, $t5, %lo(dMNBattlePanelProcRenderList)
  /* 131944 801336C4 AD0B0008 */        sw $t3, 8($t0)
  /* 131948 801336C8 AD0A000C */        sw $t2, 0xc($t0)
  /* 13194C 801336CC 8DAE0004 */        lw $t6, 4($t5) # dMNBattlePanelProcRenderList + 4
  /* 131950 801336D0 8DAF0000 */        lw $t7, ($t5) # dMNBattlePanelProcRenderList + 0
  /* 131954 801336D4 27AC0068 */     addiu $t4, $sp, 0x68
  /* 131958 801336D8 AD8E0004 */        sw $t6, 4($t4)
  /* 13195C 801336DC AD8F0000 */        sw $t7, ($t4)
  /* 131960 801336E0 8DAF0008 */        lw $t7, 8($t5) # dMNBattlePanelProcRenderList + 8
  /* 131964 801336E4 8DAE000C */        lw $t6, 0xc($t5) # dMNBattlePanelProcRenderList + 12
  /* 131968 801336E8 3C198014 */       lui $t9, %hi(dMNBattlePaletteIndexes)
  /* 13196C 801336EC 2739B6F4 */     addiu $t9, $t9, %lo(dMNBattlePaletteIndexes)
  /* 131970 801336F0 AD8F0008 */        sw $t7, 8($t4)
  /* 131974 801336F4 AD8E000C */        sw $t6, 0xc($t4)
  /* 131978 801336F8 8F280004 */        lw $t0, 4($t9) # dMNBattlePaletteIndexes + 4
  /* 13197C 801336FC 8F290000 */        lw $t1, ($t9) # dMNBattlePaletteIndexes + 0
  /* 131980 80133700 27B80058 */     addiu $t8, $sp, 0x58
  /* 131984 80133704 AF080004 */        sw $t0, 4($t8)
  /* 131988 80133708 AF090000 */        sw $t1, ($t8)
  /* 13198C 8013370C 8F290008 */        lw $t1, 8($t9) # dMNBattlePaletteIndexes + 8
  /* 131990 80133710 8F28000C */        lw $t0, 0xc($t9) # dMNBattlePaletteIndexes + 12
  /* 131994 80133714 3C0C8014 */       lui $t4, %hi(D_ovl26_8013C4A0)
  /* 131998 80133718 AF090008 */        sw $t1, 8($t8)
  /* 13199C 8013371C AF08000C */        sw $t0, 0xc($t8)
  /* 1319A0 80133720 8D8CC4A0 */        lw $t4, %lo(D_ovl26_8013C4A0)($t4)
  /* 1319A4 80133724 3C0D0001 */       lui $t5, %hi(D_NF_000104B0)
  /* 1319A8 80133728 25AD04B0 */     addiu $t5, $t5, %lo(D_NF_000104B0)
  /* 1319AC 8013372C 3C02800D */       lui $v0, %hi(func_ovl0_800CCF00)
  /* 1319B0 80133730 00808025 */        or $s0, $a0, $zero
  /* 1319B4 80133734 3C078000 */       lui $a3, 0x8000
  /* 1319B8 80133738 2442CF00 */     addiu $v0, $v0, %lo(func_ovl0_800CCF00)
  /* 1319BC 8013373C 24180001 */     addiu $t8, $zero, 1
  /* 1319C0 80133740 240F0001 */     addiu $t7, $zero, 1
  /* 1319C4 80133744 240A001C */     addiu $t2, $zero, 0x1c
  /* 1319C8 80133748 240BFFFF */     addiu $t3, $zero, -1
  /* 1319CC 8013374C 018D7021 */      addu $t6, $t4, $t5
  /* 1319D0 80133750 AFAE0020 */        sw $t6, 0x20($sp)
  /* 1319D4 80133754 AFAB001C */        sw $t3, 0x1c($sp)
  /* 1319D8 80133758 AFAA0014 */        sw $t2, 0x14($sp)
  /* 1319DC 8013375C AFAF0024 */        sw $t7, 0x24($sp)
  /* 1319E0 80133760 AFB8002C */        sw $t8, 0x2c($sp)
  /* 1319E4 80133764 AFA20010 */        sw $v0, 0x10($sp)
  /* 1319E8 80133768 AFA2004C */        sw $v0, 0x4c($sp)
  /* 1319EC 8013376C AFA70018 */        sw $a3, 0x18($sp)
  /* 1319F0 80133770 00002025 */        or $a0, $zero, $zero
  /* 1319F4 80133774 AFA00028 */        sw $zero, 0x28($sp)
  /* 1319F8 80133778 00002825 */        or $a1, $zero, $zero
  /* 1319FC 8013377C 0C033414 */       jal func_ovl0_800CD050
  /* 131A00 80133780 24060016 */     addiu $a2, $zero, 0x16
  /* 131A04 80133784 00104900 */       sll $t1, $s0, 4
  /* 131A08 80133788 01304821 */      addu $t1, $t1, $s0
  /* 131A0C 8013378C 00094880 */       sll $t1, $t1, 2
  /* 131A10 80133790 01304821 */      addu $t1, $t1, $s0
  /* 131A14 80133794 0010C880 */       sll $t9, $s0, 2
  /* 131A18 80133798 252B0016 */     addiu $t3, $t1, 0x16
  /* 131A1C 8013379C 448B2000 */      mtc1 $t3, $f4
  /* 131A20 801337A0 0330C823 */      subu $t9, $t9, $s0
  /* 131A24 801337A4 0019C900 */       sll $t9, $t9, 4
  /* 131A28 801337A8 0330C823 */      subu $t9, $t9, $s0
  /* 131A2C 801337AC 3C088014 */       lui $t0, %hi(gMNBattlePanels)
  /* 131A30 801337B0 468021A0 */   cvt.s.w $f6, $f4
  /* 131A34 801337B4 2508BA88 */     addiu $t0, $t0, %lo(gMNBattlePanels)
  /* 131A38 801337B8 0019C880 */       sll $t9, $t9, 2
  /* 131A3C 801337BC 03288821 */      addu $s1, $t9, $t0
  /* 131A40 801337C0 AE220018 */        sw $v0, 0x18($s1)
  /* 131A44 801337C4 AFA90044 */        sw $t1, 0x44($sp)
  /* 131A48 801337C8 8C4C0074 */        lw $t4, 0x74($v0)
  /* 131A4C 801337CC 3C0142FC */       lui $at, (0x42FC0000 >> 16) # 126.0
  /* 131A50 801337D0 44814000 */      mtc1 $at, $f8 # 126.0 to cop1
  /* 131A54 801337D4 E5860058 */      swc1 $f6, 0x58($t4)
  /* 131A58 801337D8 8C4D0074 */        lw $t5, 0x74($v0)
  /* 131A5C 801337DC 3C088014 */       lui $t0, %hi(gMNBattleIsTeamBattle)
  /* 131A60 801337E0 00402025 */        or $a0, $v0, $zero
  /* 131A64 801337E4 E5A8005C */      swc1 $f8, 0x5c($t5)
  /* 131A68 801337E8 8C430074 */        lw $v1, 0x74($v0)
  /* 131A6C 801337EC 946E0024 */       lhu $t6, 0x24($v1)
  /* 131A70 801337F0 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 131A74 801337F4 A46F0024 */        sh $t7, 0x24($v1)
  /* 131A78 801337F8 8C430074 */        lw $v1, 0x74($v0)
  /* 131A7C 801337FC 94780024 */       lhu $t8, 0x24($v1)
  /* 131A80 80133800 37190001 */       ori $t9, $t8, 1
  /* 131A84 80133804 A4790024 */        sh $t9, 0x24($v1)
  /* 131A88 80133808 8D08BDA8 */        lw $t0, %lo(gMNBattleIsTeamBattle)($t0)
  /* 131A8C 8013380C 15000008 */      bnez $t0, .L80133830
  /* 131A90 80133810 00101080 */       sll $v0, $s0, 2
  /* 131A94 80133814 03A22821 */      addu $a1, $sp, $v0
  /* 131A98 80133818 8CA50058 */        lw $a1, 0x58($a1)
  /* 131A9C 8013381C AFA20040 */        sw $v0, 0x40($sp)
  /* 131AA0 80133820 0C04CCAB */       jal func_ovl26_801332AC
  /* 131AA4 80133824 8E260084 */        lw $a2, 0x84($s1)
  /* 131AA8 80133828 1000000A */         b .L80133854
  /* 131AAC 8013382C 8FA20040 */        lw $v0, 0x40($sp)
  .L80133830:
  /* 131AB0 80133830 8E220040 */        lw $v0, 0x40($s1)
  /* 131AB4 80133834 24010002 */     addiu $at, $zero, 2
  /* 131AB8 80133838 14410003 */       bne $v0, $at, .L80133848
  /* 131ABC 8013383C 00402825 */        or $a1, $v0, $zero
  /* 131AC0 80133840 10000001 */         b .L80133848
  /* 131AC4 80133844 24050003 */     addiu $a1, $zero, 3
  .L80133848:
  /* 131AC8 80133848 0C04CCAB */       jal func_ovl26_801332AC
  /* 131ACC 8013384C 8E260084 */        lw $a2, 0x84($s1)
  /* 131AD0 80133850 00101080 */       sll $v0, $s0, 2
  .L80133854:
  /* 131AD4 80133854 02002025 */        or $a0, $s0, $zero
  /* 131AD8 80133858 0C04CD2A */       jal mnBattleCreateTypeImage
  /* 131ADC 8013385C AFA20040 */        sw $v0, 0x40($sp)
  /* 131AE0 80133860 8FA20040 */        lw $v0, 0x40($sp)
  /* 131AE4 80133864 3C0C8014 */       lui $t4, %hi(D_ovl26_8013C4A0)
  /* 131AE8 80133868 8D8CC4A0 */        lw $t4, %lo(D_ovl26_8013C4A0)($t4)
  /* 131AEC 8013386C 03A24821 */      addu $t1, $sp, $v0
  /* 131AF0 80133870 8D290068 */        lw $t1, 0x68($t1)
  /* 131AF4 80133874 3C0D0001 */       lui $t5, %hi(D_NF_0000CDB0)
  /* 131AF8 80133878 25ADCDB0 */     addiu $t5, $t5, %lo(D_NF_0000CDB0)
  /* 131AFC 8013387C 3C188013 */       lui $t8, %hi(func_ovl26_80132C6C)
  /* 131B00 80133880 3C078000 */       lui $a3, 0x8000
  /* 131B04 80133884 27182C6C */     addiu $t8, $t8, %lo(func_ovl26_80132C6C)
  /* 131B08 80133888 240A001D */     addiu $t2, $zero, 0x1d
  /* 131B0C 8013388C 240BFFFF */     addiu $t3, $zero, -1
  /* 131B10 80133890 240F0001 */     addiu $t7, $zero, 1
  /* 131B14 80133894 24190001 */     addiu $t9, $zero, 1
  /* 131B18 80133898 018D7021 */      addu $t6, $t4, $t5
  /* 131B1C 8013389C AFAE0020 */        sw $t6, 0x20($sp)
  /* 131B20 801338A0 AFB9002C */        sw $t9, 0x2c($sp)
  /* 131B24 801338A4 AFAF0024 */        sw $t7, 0x24($sp)
  /* 131B28 801338A8 AFAB001C */        sw $t3, 0x1c($sp)
  /* 131B2C 801338AC AFAA0014 */        sw $t2, 0x14($sp)
  /* 131B30 801338B0 AFB80028 */        sw $t8, 0x28($sp)
  /* 131B34 801338B4 AFA70018 */        sw $a3, 0x18($sp)
  /* 131B38 801338B8 00002025 */        or $a0, $zero, $zero
  /* 131B3C 801338BC 00002825 */        or $a1, $zero, $zero
  /* 131B40 801338C0 24060017 */     addiu $a2, $zero, 0x17
  /* 131B44 801338C4 0C033414 */       jal func_ovl0_800CD050
  /* 131B48 801338C8 AFA90010 */        sw $t1, 0x10($sp)
  /* 131B4C 801338CC AC500084 */        sw $s0, 0x84($v0)
  /* 131B50 801338D0 8FA80044 */        lw $t0, 0x44($sp)
  /* 131B54 801338D4 8C4A0074 */        lw $t2, 0x74($v0)
  /* 131B58 801338D8 3C0142FC */       lui $at, (0x42FC0000 >> 16) # 126.0
  /* 131B5C 801338DC 2509FFED */     addiu $t1, $t0, -0x13
  /* 131B60 801338E0 44895000 */      mtc1 $t1, $f10
  /* 131B64 801338E4 44819000 */      mtc1 $at, $f18 # 126.0 to cop1
  /* 131B68 801338E8 3C188014 */       lui $t8, %hi(D_ovl26_8013C4A0)
  /* 131B6C 801338EC 46805420 */   cvt.s.w $f16, $f10
  /* 131B70 801338F0 3C190001 */       lui $t9, %hi(D_NF_0000DFA0)
  /* 131B74 801338F4 2739DFA0 */     addiu $t9, $t9, %lo(D_NF_0000DFA0)
  /* 131B78 801338F8 00402025 */        or $a0, $v0, $zero
  /* 131B7C 801338FC E5500058 */      swc1 $f16, 0x58($t2)
  /* 131B80 80133900 8C4B0074 */        lw $t3, 0x74($v0)
  /* 131B84 80133904 E572005C */      swc1 $f18, 0x5c($t3)
  /* 131B88 80133908 8C430074 */        lw $v1, 0x74($v0)
  /* 131B8C 8013390C 946C0024 */       lhu $t4, 0x24($v1)
  /* 131B90 80133910 318DFFDF */      andi $t5, $t4, 0xffdf
  /* 131B94 80133914 A46D0024 */        sh $t5, 0x24($v1)
  /* 131B98 80133918 8C430074 */        lw $v1, 0x74($v0)
  /* 131B9C 8013391C 946E0024 */       lhu $t6, 0x24($v1)
  /* 131BA0 80133920 35CF0001 */       ori $t7, $t6, 1
  /* 131BA4 80133924 A46F0024 */        sh $t7, 0x24($v1)
  /* 131BA8 80133928 AE220014 */        sw $v0, 0x14($s1)
  /* 131BAC 8013392C 8F18C4A0 */        lw $t8, %lo(D_ovl26_8013C4A0)($t8)
  /* 131BB0 80133930 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 131BB4 80133934 03192821 */      addu $a1, $t8, $t9
  /* 131BB8 80133938 8FA80044 */        lw $t0, 0x44($sp)
  /* 131BBC 8013393C 944A0024 */       lhu $t2, 0x24($v0)
  /* 131BC0 80133940 3C0142FC */       lui $at, (0x42FC0000 >> 16) # 126.0
  /* 131BC4 80133944 25090058 */     addiu $t1, $t0, 0x58
  /* 131BC8 80133948 44892000 */      mtc1 $t1, $f4
  /* 131BCC 8013394C 44814000 */      mtc1 $at, $f8 # 126.0 to cop1
  /* 131BD0 80133950 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 131BD4 80133954 468021A0 */   cvt.s.w $f6, $f4
  /* 131BD8 80133958 A44C0024 */        sh $t4, 0x24($v0)
  /* 131BDC 8013395C 358D0001 */       ori $t5, $t4, 1
  /* 131BE0 80133960 A44D0024 */        sh $t5, 0x24($v0)
  /* 131BE4 80133964 240E0029 */     addiu $t6, $zero, 0x29
  /* 131BE8 80133968 E448005C */      swc1 $f8, 0x5c($v0)
  /* 131BEC 8013396C E4460058 */      swc1 $f6, 0x58($v0)
  /* 131BF0 80133970 AE2E00A4 */        sw $t6, 0xa4($s1)
  /* 131BF4 80133974 0C04CAFD */       jal func_ovl26_80132BF4
  /* 131BF8 80133978 02002025 */        or $a0, $s0, $zero
  /* 131BFC 8013397C 0C04CCDE */       jal func_ovl26_80133378
  /* 131C00 80133980 02002025 */        or $a0, $s0, $zero
  /* 131C04 80133984 00002025 */        or $a0, $zero, $zero
  /* 131C08 80133988 00002825 */        or $a1, $zero, $zero
  /* 131C0C 8013398C 24060016 */     addiu $a2, $zero, 0x16
  /* 131C10 80133990 0C00265A */       jal omMakeGObjSPAfter
  /* 131C14 80133994 3C078000 */       lui $a3, 0x8000
  /* 131C18 80133998 240FFFFF */     addiu $t7, $zero, -1
  /* 131C1C 8013399C AE220010 */        sw $v0, 0x10($s1)
  /* 131C20 801339A0 AFAF0010 */        sw $t7, 0x10($sp)
  /* 131C24 801339A4 00402025 */        or $a0, $v0, $zero
  /* 131C28 801339A8 8FA5004C */        lw $a1, 0x4c($sp)
  /* 131C2C 801339AC 2406001C */     addiu $a2, $zero, 0x1c
  /* 131C30 801339B0 0C00277D */       jal omAddGObjRenderProc
  /* 131C34 801339B4 3C078000 */       lui $a3, 0x8000
  /* 131C38 801339B8 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 131C3C 801339BC 02002025 */        or $a0, $s0, $zero
  /* 131C40 801339C0 0C04DC52 */       jal func_ovl26_80137148
  /* 131C44 801339C4 00000000 */       nop
  /* 131C48 801339C8 14400005 */      bnez $v0, .L801339E0
  /* 131C4C 801339CC 00000000 */       nop
  /* 131C50 801339D0 8E380084 */        lw $t8, 0x84($s1)
  /* 131C54 801339D4 24010001 */     addiu $at, $zero, 1
  /* 131C58 801339D8 17010003 */       bne $t8, $at, .L801339E8
  /* 131C5C 801339DC 00000000 */       nop
  .L801339E0:
  /* 131C60 801339E0 0C04DC01 */       jal func_ovl26_80137004
  /* 131C64 801339E4 02002025 */        or $a0, $s0, $zero
  .L801339E8:
  /* 131C68 801339E8 3C198014 */       lui $t9, %hi(gMNBattleIsTeamBattle)
  /* 131C6C 801339EC 8F39BDA8 */        lw $t9, %lo(gMNBattleIsTeamBattle)($t9)
  /* 131C70 801339F0 24010001 */     addiu $at, $zero, 1
  /* 131C74 801339F4 02002825 */        or $a1, $s0, $zero
  /* 131C78 801339F8 57210004 */      bnel $t9, $at, .L80133A0C
  /* 131C7C 801339FC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 131C80 80133A00 0C04C9C7 */       jal func_ovl26_8013271C
  /* 131C84 80133A04 8E240040 */        lw $a0, 0x40($s1)
  /* 131C88 80133A08 8FBF003C */        lw $ra, 0x3c($sp)
  .L80133A0C:
  /* 131C8C 80133A0C 8FB00034 */        lw $s0, 0x34($sp)
  /* 131C90 80133A10 8FB10038 */        lw $s1, 0x38($sp)
  /* 131C94 80133A14 03E00008 */        jr $ra
  /* 131C98 80133A18 27BD00A0 */     addiu $sp, $sp, 0xa0

glabel mnBattlePow
  /* 131C9C 80133A1C 14A00003 */      bnez $a1, .L80133A2C
  /* 131CA0 80133A20 00801825 */        or $v1, $a0, $zero
  /* 131CA4 80133A24 03E00008 */        jr $ra
  /* 131CA8 80133A28 24020001 */     addiu $v0, $zero, 1

  .L80133A2C:
  /* 131CAC 80133A2C 28A10002 */      slti $at, $a1, 2
  /* 131CB0 80133A30 1420001F */      bnez $at, .L80133AB0
  /* 131CB4 80133A34 00A01025 */        or $v0, $a1, $zero
  /* 131CB8 80133A38 24A7FFFF */     addiu $a3, $a1, -1
  /* 131CBC 80133A3C 30E70003 */      andi $a3, $a3, 3
  /* 131CC0 80133A40 00073823 */      negu $a3, $a3
  /* 131CC4 80133A44 10E00008 */      beqz $a3, .L80133A68
  /* 131CC8 80133A48 00E53021 */      addu $a2, $a3, $a1
  .L80133A4C:
  /* 131CCC 80133A4C 00640019 */     multu $v1, $a0
  /* 131CD0 80133A50 2442FFFF */     addiu $v0, $v0, -1
  /* 131CD4 80133A54 00001812 */      mflo $v1
  /* 131CD8 80133A58 14C2FFFC */       bne $a2, $v0, .L80133A4C
  /* 131CDC 80133A5C 00000000 */       nop
  /* 131CE0 80133A60 24050001 */     addiu $a1, $zero, 1
  /* 131CE4 80133A64 10450012 */       beq $v0, $a1, .L80133AB0
  .L80133A68:
  /* 131CE8 80133A68 24050001 */     addiu $a1, $zero, 1
  .L80133A6C:
  /* 131CEC 80133A6C 00640019 */     multu $v1, $a0
  /* 131CF0 80133A70 2442FFFC */     addiu $v0, $v0, -4
  /* 131CF4 80133A74 00001812 */      mflo $v1
  /* 131CF8 80133A78 00000000 */       nop
  /* 131CFC 80133A7C 00000000 */       nop
# Maybe start of new file
  /* 131D00 80133A80 00640019 */     multu $v1, $a0
  /* 131D04 80133A84 00001812 */      mflo $v1
  /* 131D08 80133A88 00000000 */       nop
  /* 131D0C 80133A8C 00000000 */       nop
# Maybe start of new file
  /* 131D10 80133A90 00640019 */     multu $v1, $a0
  /* 131D14 80133A94 00001812 */      mflo $v1
  /* 131D18 80133A98 00000000 */       nop
  /* 131D1C 80133A9C 00000000 */       nop
# Maybe start of new file
  /* 131D20 80133AA0 00640019 */     multu $v1, $a0
  /* 131D24 80133AA4 00001812 */      mflo $v1
  /* 131D28 80133AA8 1445FFF0 */       bne $v0, $a1, .L80133A6C
  /* 131D2C 80133AAC 00000000 */       nop
  .L80133AB0:
  /* 131D30 80133AB0 00601025 */        or $v0, $v1, $zero
  /* 131D34 80133AB4 03E00008 */        jr $ra
  /* 131D38 80133AB8 00000000 */       nop

glabel mnBattleSetTextureColors
  /* 131D3C 80133ABC 948E0024 */       lhu $t6, 0x24($a0)
  /* 131D40 80133AC0 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 131D44 80133AC4 A4980024 */        sh $t8, 0x24($a0)
  /* 131D48 80133AC8 37190001 */       ori $t9, $t8, 1
  /* 131D4C 80133ACC A4990024 */        sh $t9, 0x24($a0)
  /* 131D50 80133AD0 8CA80000 */        lw $t0, ($a1)
  /* 131D54 80133AD4 A0880060 */        sb $t0, 0x60($a0)
  /* 131D58 80133AD8 8CA90004 */        lw $t1, 4($a1)
  /* 131D5C 80133ADC A0890061 */        sb $t1, 0x61($a0)
  /* 131D60 80133AE0 8CAA0008 */        lw $t2, 8($a1)
  /* 131D64 80133AE4 A08A0062 */        sb $t2, 0x62($a0)
  /* 131D68 80133AE8 8CAB000C */        lw $t3, 0xc($a1)
  /* 131D6C 80133AEC A08B0028 */        sb $t3, 0x28($a0)
  /* 131D70 80133AF0 8CAC0010 */        lw $t4, 0x10($a1)
  /* 131D74 80133AF4 A08C0029 */        sb $t4, 0x29($a0)
  /* 131D78 80133AF8 8CAD0014 */        lw $t5, 0x14($a1)
  /* 131D7C 80133AFC 03E00008 */        jr $ra
  /* 131D80 80133B00 A08D002A */        sb $t5, 0x2a($a0)

glabel mnBattleGetNumberOfDigits
  /* 131D84 80133B04 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 131D88 80133B08 AFB20020 */        sw $s2, 0x20($sp)
  /* 131D8C 80133B0C AFB1001C */        sw $s1, 0x1c($sp)
  /* 131D90 80133B10 00809025 */        or $s2, $a0, $zero
  /* 131D94 80133B14 AFBF0024 */        sw $ra, 0x24($sp)
  /* 131D98 80133B18 AFB00018 */        sw $s0, 0x18($sp)
  /* 131D9C 80133B1C 18A0001D */      blez $a1, .L80133B94
  /* 131DA0 80133B20 00A08825 */        or $s1, $a1, $zero
  .L80133B24:
  /* 131DA4 80133B24 2630FFFF */     addiu $s0, $s1, -1
  /* 131DA8 80133B28 02002825 */        or $a1, $s0, $zero
  /* 131DAC 80133B2C 0C04CE87 */       jal mnBattlePow
  /* 131DB0 80133B30 2404000A */     addiu $a0, $zero, 0xa
  /* 131DB4 80133B34 10400011 */      beqz $v0, .L80133B7C
  /* 131DB8 80133B38 00001825 */        or $v1, $zero, $zero
  /* 131DBC 80133B3C 2404000A */     addiu $a0, $zero, 0xa
  /* 131DC0 80133B40 0C04CE87 */       jal mnBattlePow
  /* 131DC4 80133B44 02002825 */        or $a1, $s0, $zero
  /* 131DC8 80133B48 0242001A */       div $zero, $s2, $v0
  /* 131DCC 80133B4C 00001812 */      mflo $v1
  /* 131DD0 80133B50 14400002 */      bnez $v0, .L80133B5C
  /* 131DD4 80133B54 00000000 */       nop
  /* 131DD8 80133B58 0007000D */     break 7
  .L80133B5C:
  /* 131DDC 80133B5C 2401FFFF */     addiu $at, $zero, -1
  /* 131DE0 80133B60 14410004 */       bne $v0, $at, .L80133B74
  /* 131DE4 80133B64 3C018000 */       lui $at, 0x8000
  /* 131DE8 80133B68 16410002 */       bne $s2, $at, .L80133B74
  /* 131DEC 80133B6C 00000000 */       nop
  /* 131DF0 80133B70 0006000D */     break 6
  .L80133B74:
  /* 131DF4 80133B74 10000001 */         b .L80133B7C
  /* 131DF8 80133B78 00000000 */       nop
  .L80133B7C:
  /* 131DFC 80133B7C 10600003 */      beqz $v1, .L80133B8C
  /* 131E00 80133B80 00000000 */       nop
  /* 131E04 80133B84 10000004 */         b .L80133B98
  /* 131E08 80133B88 02201025 */        or $v0, $s1, $zero
  .L80133B8C:
  /* 131E0C 80133B8C 1600FFE5 */      bnez $s0, .L80133B24
  /* 131E10 80133B90 02008825 */        or $s1, $s0, $zero
  .L80133B94:
  /* 131E14 80133B94 00001025 */        or $v0, $zero, $zero
  .L80133B98:
  /* 131E18 80133B98 8FBF0024 */        lw $ra, 0x24($sp)
  /* 131E1C 80133B9C 8FB00018 */        lw $s0, 0x18($sp)
  /* 131E20 80133BA0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 131E24 80133BA4 8FB20020 */        lw $s2, 0x20($sp)
  /* 131E28 80133BA8 03E00008 */        jr $ra
  /* 131E2C 80133BAC 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBattleCreateNumber
  /* 131E30 80133BB0 27BDFF70 */     addiu $sp, $sp, -0x90
  /* 131E34 80133BB4 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 131E38 80133BB8 3C0E8014 */       lui $t6, %hi(dMNBattleNumberOffsets)
  /* 131E3C 80133BBC AFBE0048 */        sw $fp, 0x48($sp)
  /* 131E40 80133BC0 AFB30034 */        sw $s3, 0x34($sp)
  /* 131E44 80133BC4 27A20068 */     addiu $v0, $sp, 0x68
  /* 131E48 80133BC8 25CEB704 */     addiu $t6, $t6, %lo(dMNBattleNumberOffsets)
  /* 131E4C 80133BCC 4487B000 */      mtc1 $a3, $f22
  /* 131E50 80133BD0 00A09825 */        or $s3, $a1, $zero
  /* 131E54 80133BD4 0080F025 */        or $fp, $a0, $zero
  /* 131E58 80133BD8 AFBF004C */        sw $ra, 0x4c($sp)
  /* 131E5C 80133BDC AFB70044 */        sw $s7, 0x44($sp)
  /* 131E60 80133BE0 AFB60040 */        sw $s6, 0x40($sp)
  /* 131E64 80133BE4 AFB5003C */        sw $s5, 0x3c($sp)
  /* 131E68 80133BE8 AFB40038 */        sw $s4, 0x38($sp)
  /* 131E6C 80133BEC AFB20030 */        sw $s2, 0x30($sp)
  /* 131E70 80133BF0 AFB1002C */        sw $s1, 0x2c($sp)
  /* 131E74 80133BF4 AFB00028 */        sw $s0, 0x28($sp)
  /* 131E78 80133BF8 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 131E7C 80133BFC AFA60098 */        sw $a2, 0x98($sp)
  /* 131E80 80133C00 25C80024 */     addiu $t0, $t6, 0x24
  /* 131E84 80133C04 0040C825 */        or $t9, $v0, $zero
  .L80133C08:
  /* 131E88 80133C08 8DD80000 */        lw $t8, ($t6) # dMNBattleNumberOffsets + 0
  /* 131E8C 80133C0C 25CE000C */     addiu $t6, $t6, 0xc
  /* 131E90 80133C10 2739000C */     addiu $t9, $t9, 0xc
  /* 131E94 80133C14 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 131E98 80133C18 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattleNumberOffsets + -8
  /* 131E9C 80133C1C AF2FFFF8 */        sw $t7, -8($t9)
  /* 131EA0 80133C20 8DD8FFFC */        lw $t8, -4($t6) # dMNBattleNumberOffsets + -4
  /* 131EA4 80133C24 15C8FFF8 */       bne $t6, $t0, .L80133C08
  /* 131EA8 80133C28 AF38FFFC */        sw $t8, -4($t9)
  /* 131EAC 80133C2C 8DD80000 */        lw $t8, ($t6) # dMNBattleNumberOffsets + 0
  /* 131EB0 80133C30 2416000A */     addiu $s6, $zero, 0xa
  /* 131EB4 80133C34 3C178014 */       lui $s7, %hi(D_ovl26_8013C4A0)
  /* 131EB8 80133C38 AF380000 */        sw $t8, ($t9)
  /* 131EBC 80133C3C 06610002 */      bgez $s3, .L80133C48
  /* 131EC0 80133C40 C7B40098 */      lwc1 $f20, 0x98($sp)
  /* 131EC4 80133C44 00009825 */        or $s3, $zero, $zero
  .L80133C48:
  /* 131EC8 80133C48 0276001A */       div $zero, $s3, $s6
  /* 131ECC 80133C4C 00004810 */      mfhi $t1
  /* 131ED0 80133C50 00095080 */       sll $t2, $t1, 2
  /* 131ED4 80133C54 26F7C4A0 */     addiu $s7, $s7, %lo(D_ovl26_8013C4A0)
  /* 131ED8 80133C58 004A5821 */      addu $t3, $v0, $t2
  /* 131EDC 80133C5C 8D6C0000 */        lw $t4, ($t3)
  /* 131EE0 80133C60 8EED0000 */        lw $t5, ($s7) # D_ovl26_8013C4A0 + 0
  /* 131EE4 80133C64 03C02025 */        or $a0, $fp, $zero
  /* 131EE8 80133C68 16C00002 */      bnez $s6, .L80133C74
  /* 131EEC 80133C6C 00000000 */       nop
  /* 131EF0 80133C70 0007000D */     break 7
  .L80133C74:
  /* 131EF4 80133C74 2401FFFF */     addiu $at, $zero, -1
  /* 131EF8 80133C78 16C10004 */       bne $s6, $at, .L80133C8C
  /* 131EFC 80133C7C 3C018000 */       lui $at, 0x8000
  /* 131F00 80133C80 16610002 */       bne $s3, $at, .L80133C8C
  /* 131F04 80133C84 00000000 */       nop
  /* 131F08 80133C88 0006000D */     break 6
  .L80133C8C:
  /* 131F0C 80133C8C 018D2821 */      addu $a1, $t4, $t5
  /* 131F10 80133C90 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 131F14 80133C94 00000000 */       nop
  /* 131F18 80133C98 8FB400A0 */        lw $s4, 0xa0($sp)
  /* 131F1C 80133C9C 00408025 */        or $s0, $v0, $zero
  /* 131F20 80133CA0 00402025 */        or $a0, $v0, $zero
  /* 131F24 80133CA4 0C04CEAF */       jal mnBattleSetTextureColors
  /* 131F28 80133CA8 02802825 */        or $a1, $s4, $zero
  /* 131F2C 80133CAC 86080014 */        lh $t0, 0x14($s0)
  /* 131F30 80133CB0 C7A40098 */      lwc1 $f4, 0x98($sp)
  /* 131F34 80133CB4 8FB500A8 */        lw $s5, 0xa8($sp)
  /* 131F38 80133CB8 44883000 */      mtc1 $t0, $f6
  /* 131F3C 80133CBC E616005C */      swc1 $f22, 0x5c($s0)
  /* 131F40 80133CC0 24110001 */     addiu $s1, $zero, 1
  /* 131F44 80133CC4 46803220 */   cvt.s.w $f8, $f6
  /* 131F48 80133CC8 46082501 */     sub.s $f20, $f4, $f8
  /* 131F4C 80133CCC 12A00004 */      beqz $s5, .L80133CE0
  /* 131F50 80133CD0 E6140058 */      swc1 $f20, 0x58($s0)
  /* 131F54 80133CD4 8FB200A4 */        lw $s2, 0xa4($sp)
  /* 131F58 80133CD8 10000006 */         b .L80133CF4
  /* 131F5C 80133CDC 02401825 */        or $v1, $s2, $zero
  .L80133CE0:
  /* 131F60 80133CE0 8FB200A4 */        lw $s2, 0xa4($sp)
  /* 131F64 80133CE4 02602025 */        or $a0, $s3, $zero
  /* 131F68 80133CE8 0C04CEC1 */       jal mnBattleGetNumberOfDigits
  /* 131F6C 80133CEC 02402825 */        or $a1, $s2, $zero
  /* 131F70 80133CF0 00401825 */        or $v1, $v0, $zero
  .L80133CF4:
  /* 131F74 80133CF4 28610002 */      slti $at, $v1, 2
  /* 131F78 80133CF8 1420003D */      bnez $at, .L80133DF0
  /* 131F7C 80133CFC 02C02025 */        or $a0, $s6, $zero
  .L80133D00:
  /* 131F80 80133D00 0C04CE87 */       jal mnBattlePow
  /* 131F84 80133D04 02202825 */        or $a1, $s1, $zero
  /* 131F88 80133D08 10400011 */      beqz $v0, .L80133D50
  /* 131F8C 80133D0C 00001825 */        or $v1, $zero, $zero
  /* 131F90 80133D10 02C02025 */        or $a0, $s6, $zero
  /* 131F94 80133D14 0C04CE87 */       jal mnBattlePow
  /* 131F98 80133D18 02202825 */        or $a1, $s1, $zero
  /* 131F9C 80133D1C 0262001A */       div $zero, $s3, $v0
  /* 131FA0 80133D20 00001812 */      mflo $v1
  /* 131FA4 80133D24 14400002 */      bnez $v0, .L80133D30
  /* 131FA8 80133D28 00000000 */       nop
  /* 131FAC 80133D2C 0007000D */     break 7
  .L80133D30:
  /* 131FB0 80133D30 2401FFFF */     addiu $at, $zero, -1
  /* 131FB4 80133D34 14410004 */       bne $v0, $at, .L80133D48
  /* 131FB8 80133D38 3C018000 */       lui $at, 0x8000
  /* 131FBC 80133D3C 16610002 */       bne $s3, $at, .L80133D48
  /* 131FC0 80133D40 00000000 */       nop
  /* 131FC4 80133D44 0006000D */     break 6
  .L80133D48:
  /* 131FC8 80133D48 10000001 */         b .L80133D50
  /* 131FCC 80133D4C 00000000 */       nop
  .L80133D50:
  /* 131FD0 80133D50 0076001A */       div $zero, $v1, $s6
  /* 131FD4 80133D54 00007010 */      mfhi $t6
  /* 131FD8 80133D58 000EC880 */       sll $t9, $t6, 2
  /* 131FDC 80133D5C 03B97821 */      addu $t7, $sp, $t9
  /* 131FE0 80133D60 8DEF0068 */        lw $t7, 0x68($t7)
  /* 131FE4 80133D64 8EF80000 */        lw $t8, ($s7) # D_ovl26_8013C4A0 + 0
  /* 131FE8 80133D68 03C02025 */        or $a0, $fp, $zero
  /* 131FEC 80133D6C 16C00002 */      bnez $s6, .L80133D78
  /* 131FF0 80133D70 00000000 */       nop
  /* 131FF4 80133D74 0007000D */     break 7
  .L80133D78:
  /* 131FF8 80133D78 2401FFFF */     addiu $at, $zero, -1
  /* 131FFC 80133D7C 16C10004 */       bne $s6, $at, .L80133D90
  /* 132000 80133D80 3C018000 */       lui $at, 0x8000
  /* 132004 80133D84 14610002 */       bne $v1, $at, .L80133D90
  /* 132008 80133D88 00000000 */       nop
  /* 13200C 80133D8C 0006000D */     break 6
  .L80133D90:
  /* 132010 80133D90 01F82821 */      addu $a1, $t7, $t8
  /* 132014 80133D94 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 132018 80133D98 00000000 */       nop
  /* 13201C 80133D9C 00408025 */        or $s0, $v0, $zero
  /* 132020 80133DA0 00402025 */        or $a0, $v0, $zero
  /* 132024 80133DA4 0C04CEAF */       jal mnBattleSetTextureColors
  /* 132028 80133DA8 02802825 */        or $a1, $s4, $zero
  /* 13202C 80133DAC 86090014 */        lh $t1, 0x14($s0)
  /* 132030 80133DB0 26310001 */     addiu $s1, $s1, 1
  /* 132034 80133DB4 02602025 */        or $a0, $s3, $zero
  /* 132038 80133DB8 44895000 */      mtc1 $t1, $f10
  /* 13203C 80133DBC E616005C */      swc1 $f22, 0x5c($s0)
  /* 132040 80133DC0 46805420 */   cvt.s.w $f16, $f10
  /* 132044 80133DC4 4610A501 */     sub.s $f20, $f20, $f16
  /* 132048 80133DC8 12A00003 */      beqz $s5, .L80133DD8
  /* 13204C 80133DCC E6140058 */      swc1 $f20, 0x58($s0)
  /* 132050 80133DD0 10000004 */         b .L80133DE4
  /* 132054 80133DD4 02401825 */        or $v1, $s2, $zero
  .L80133DD8:
  /* 132058 80133DD8 0C04CEC1 */       jal mnBattleGetNumberOfDigits
  /* 13205C 80133DDC 02402825 */        or $a1, $s2, $zero
  /* 132060 80133DE0 00401825 */        or $v1, $v0, $zero
  .L80133DE4:
  /* 132064 80133DE4 0223082A */       slt $at, $s1, $v1
  /* 132068 80133DE8 5420FFC5 */      bnel $at, $zero, .L80133D00
  /* 13206C 80133DEC 02C02025 */        or $a0, $s6, $zero
  .L80133DF0:
  /* 132070 80133DF0 8FBF004C */        lw $ra, 0x4c($sp)
  /* 132074 80133DF4 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 132078 80133DF8 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13207C 80133DFC 8FB00028 */        lw $s0, 0x28($sp)
  /* 132080 80133E00 8FB1002C */        lw $s1, 0x2c($sp)
  /* 132084 80133E04 8FB20030 */        lw $s2, 0x30($sp)
  /* 132088 80133E08 8FB30034 */        lw $s3, 0x34($sp)
  /* 13208C 80133E0C 8FB40038 */        lw $s4, 0x38($sp)
  /* 132090 80133E10 8FB5003C */        lw $s5, 0x3c($sp)
  /* 132094 80133E14 8FB60040 */        lw $s6, 0x40($sp)
  /* 132098 80133E18 8FB70044 */        lw $s7, 0x44($sp)
  /* 13209C 80133E1C 8FBE0048 */        lw $fp, 0x48($sp)
  /* 1320A0 80133E20 03E00008 */        jr $ra
  /* 1320A4 80133E24 27BD0090 */     addiu $sp, $sp, 0x90

glabel mnBattleDrawTimerValue
  /* 1320A8 80133E28 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 1320AC 80133E2C 3C0E8014 */       lui $t6, %hi(dMNBattleNumberColorsTime)
  /* 1320B0 80133E30 AFBF0034 */        sw $ra, 0x34($sp)
  /* 1320B4 80133E34 AFB20030 */        sw $s2, 0x30($sp)
  /* 1320B8 80133E38 AFB1002C */        sw $s1, 0x2c($sp)
  /* 1320BC 80133E3C AFB00028 */        sw $s0, 0x28($sp)
  /* 1320C0 80133E40 25CEB72C */     addiu $t6, $t6, %lo(dMNBattleNumberColorsTime)
  /* 1320C4 80133E44 8DD80000 */        lw $t8, ($t6) # dMNBattleNumberColorsTime + 0
  /* 1320C8 80133E48 27A20048 */     addiu $v0, $sp, 0x48
  /* 1320CC 80133E4C 3C128014 */       lui $s2, %hi(gMNBattlePickerGObj)
  /* 1320D0 80133E50 AC580000 */        sw $t8, ($v0)
  /* 1320D4 80133E54 8DCF0004 */        lw $t7, 4($t6) # dMNBattleNumberColorsTime + 4
  /* 1320D8 80133E58 2652BD78 */     addiu $s2, $s2, %lo(gMNBattlePickerGObj)
  /* 1320DC 80133E5C 8E510000 */        lw $s1, ($s2) # gMNBattlePickerGObj + 0
  /* 1320E0 80133E60 AC4F0004 */        sw $t7, 4($v0)
  /* 1320E4 80133E64 8DD80008 */        lw $t8, 8($t6) # dMNBattleNumberColorsTime + 8
  /* 1320E8 80133E68 00802825 */        or $a1, $a0, $zero
  /* 1320EC 80133E6C AC580008 */        sw $t8, 8($v0)
  /* 1320F0 80133E70 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleNumberColorsTime + 12
  /* 1320F4 80133E74 AC4F000C */        sw $t7, 0xc($v0)
  /* 1320F8 80133E78 8DD80010 */        lw $t8, 0x10($t6) # dMNBattleNumberColorsTime + 16
  /* 1320FC 80133E7C AC580010 */        sw $t8, 0x10($v0)
  /* 132100 80133E80 8DCF0014 */        lw $t7, 0x14($t6) # dMNBattleNumberColorsTime + 20
  /* 132104 80133E84 AC4F0014 */        sw $t7, 0x14($v0)
  /* 132108 80133E88 8E390074 */        lw $t9, 0x74($s1)
  /* 13210C 80133E8C 8F300008 */        lw $s0, 8($t9)
  /* 132110 80133E90 5200000C */      beql $s0, $zero, .L80133EC4
  /* 132114 80133E94 24010064 */     addiu $at, $zero, 0x64
  /* 132118 80133E98 AFA40060 */        sw $a0, 0x60($sp)
  .L80133E9C:
  /* 13211C 80133E9C 0C0025BB */       jal omEjectSObj
  /* 132120 80133EA0 02002025 */        or $a0, $s0, $zero
  /* 132124 80133EA4 8E510000 */        lw $s1, ($s2) # gMNBattlePickerGObj + 0
  /* 132128 80133EA8 8E280074 */        lw $t0, 0x74($s1)
  /* 13212C 80133EAC 8D100008 */        lw $s0, 8($t0)
  /* 132130 80133EB0 1600FFFA */      bnez $s0, .L80133E9C
  /* 132134 80133EB4 00000000 */       nop
  /* 132138 80133EB8 8FA50060 */        lw $a1, 0x60($sp)
  /* 13213C 80133EBC 27A20048 */     addiu $v0, $sp, 0x48
  /* 132140 80133EC0 24010064 */     addiu $at, $zero, 0x64
  .L80133EC4:
  /* 132144 80133EC4 14A1001F */       bne $a1, $at, .L80133F44
  /* 132148 80133EC8 02202025 */        or $a0, $s1, $zero
  /* 13214C 80133ECC 3C098014 */       lui $t1, %hi(D_ovl26_8013C4A0)
  /* 132150 80133ED0 8D29C4A0 */        lw $t1, %lo(D_ovl26_8013C4A0)($t1)
  /* 132154 80133ED4 3C0A0000 */       lui $t2, %hi(D_NF_00003EF0)
  /* 132158 80133ED8 254A3EF0 */     addiu $t2, $t2, %lo(D_NF_00003EF0)
  /* 13215C 80133EDC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 132160 80133EE0 012A2821 */      addu $a1, $t1, $t2
  /* 132164 80133EE4 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 132168 80133EE8 44812000 */      mtc1 $at, $f4 # 194.0 to cop1
  /* 13216C 80133EEC 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 132170 80133EF0 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 132174 80133EF4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 132178 80133EF8 94590024 */       lhu $t9, 0x24($v0)
  /* 13217C 80133EFC E446005C */      swc1 $f6, 0x5c($v0)
  /* 132180 80133F00 8FAB0048 */        lw $t3, 0x48($sp)
  /* 132184 80133F04 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 132188 80133F08 352A0001 */       ori $t2, $t1, 1
  /* 13218C 80133F0C A04B0060 */        sb $t3, 0x60($v0)
  /* 132190 80133F10 8FAC004C */        lw $t4, 0x4c($sp)
  /* 132194 80133F14 A04C0061 */        sb $t4, 0x61($v0)
  /* 132198 80133F18 8FAD0050 */        lw $t5, 0x50($sp)
  /* 13219C 80133F1C A04D0062 */        sb $t5, 0x62($v0)
  /* 1321A0 80133F20 8FAE0054 */        lw $t6, 0x54($sp)
  /* 1321A4 80133F24 A04E0028 */        sb $t6, 0x28($v0)
  /* 1321A8 80133F28 8FAF0058 */        lw $t7, 0x58($sp)
  /* 1321AC 80133F2C A04F0029 */        sb $t7, 0x29($v0)
  /* 1321B0 80133F30 8FB8005C */        lw $t8, 0x5c($sp)
  /* 1321B4 80133F34 A4490024 */        sh $t1, 0x24($v0)
  /* 1321B8 80133F38 A44A0024 */        sh $t2, 0x24($v0)
  /* 1321BC 80133F3C 10000015 */         b .L80133F94
  /* 1321C0 80133F40 A058002A */        sb $t8, 0x2a($v0)
  .L80133F44:
  /* 1321C4 80133F44 28A1000A */      slti $at, $a1, 0xa
  /* 1321C8 80133F48 1020000B */      beqz $at, .L80133F78
  /* 1321CC 80133F4C 02202025 */        or $a0, $s1, $zero
  /* 1321D0 80133F50 240B0002 */     addiu $t3, $zero, 2
  /* 1321D4 80133F54 AFAB0014 */        sw $t3, 0x14($sp)
  /* 1321D8 80133F58 02202025 */        or $a0, $s1, $zero
  /* 1321DC 80133F5C 3C064350 */       lui $a2, 0x4350
  /* 1321E0 80133F60 3C0741B8 */       lui $a3, 0x41b8
  /* 1321E4 80133F64 AFA20010 */        sw $v0, 0x10($sp)
  /* 1321E8 80133F68 0C04CEEC */       jal mnBattleCreateNumber
  /* 1321EC 80133F6C AFA00018 */        sw $zero, 0x18($sp)
  /* 1321F0 80133F70 10000009 */         b .L80133F98
  /* 1321F4 80133F74 8FBF0034 */        lw $ra, 0x34($sp)
  .L80133F78:
  /* 1321F8 80133F78 240C0002 */     addiu $t4, $zero, 2
  /* 1321FC 80133F7C AFAC0014 */        sw $t4, 0x14($sp)
  /* 132200 80133F80 3C064354 */       lui $a2, 0x4354
  /* 132204 80133F84 3C0741B8 */       lui $a3, 0x41b8
  /* 132208 80133F88 AFA20010 */        sw $v0, 0x10($sp)
  /* 13220C 80133F8C 0C04CEEC */       jal mnBattleCreateNumber
  /* 132210 80133F90 AFA00018 */        sw $zero, 0x18($sp)
  .L80133F94:
  /* 132214 80133F94 8FBF0034 */        lw $ra, 0x34($sp)
  .L80133F98:
  /* 132218 80133F98 8FB00028 */        lw $s0, 0x28($sp)
  /* 13221C 80133F9C 8FB1002C */        lw $s1, 0x2c($sp)
  /* 132220 80133FA0 8FB20030 */        lw $s2, 0x30($sp)
  /* 132224 80133FA4 03E00008 */        jr $ra
  /* 132228 80133FA8 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnBattleDrawTimerPicker
  /* 13222C 80133FAC 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 132230 80133FB0 AFA40038 */        sw $a0, 0x38($sp)
  /* 132234 80133FB4 3C048014 */       lui $a0, %hi(gMNBattlePickerGObj)
  /* 132238 80133FB8 8C84BD78 */        lw $a0, %lo(gMNBattlePickerGObj)($a0)
  /* 13223C 80133FBC AFBF0034 */        sw $ra, 0x34($sp)
  /* 132240 80133FC0 10800003 */      beqz $a0, .L80133FD0
  /* 132244 80133FC4 00000000 */       nop
  /* 132248 80133FC8 0C0026A1 */       jal omEjectGObj
  /* 13224C 80133FCC 00000000 */       nop
  .L80133FD0:
  /* 132250 80133FD0 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 132254 80133FD4 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 132258 80133FD8 3C080000 */       lui $t0, %hi(D_NF_000048B0)
  /* 13225C 80133FDC 250848B0 */     addiu $t0, $t0, %lo(D_NF_000048B0)
  /* 132260 80133FE0 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 132264 80133FE4 3C078000 */       lui $a3, 0x8000
  /* 132268 80133FE8 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 13226C 80133FEC 240F001A */     addiu $t7, $zero, 0x1a
  /* 132270 80133FF0 2418FFFF */     addiu $t8, $zero, -1
  /* 132274 80133FF4 240A0001 */     addiu $t2, $zero, 1
  /* 132278 80133FF8 240B0001 */     addiu $t3, $zero, 1
  /* 13227C 80133FFC 03284821 */      addu $t1, $t9, $t0
  /* 132280 80134000 AFA90020 */        sw $t1, 0x20($sp)
  /* 132284 80134004 AFAB002C */        sw $t3, 0x2c($sp)
  /* 132288 80134008 AFAA0024 */        sw $t2, 0x24($sp)
  /* 13228C 8013400C AFB8001C */        sw $t8, 0x1c($sp)
  /* 132290 80134010 AFAF0014 */        sw $t7, 0x14($sp)
  /* 132294 80134014 AFAE0010 */        sw $t6, 0x10($sp)
  /* 132298 80134018 AFA70018 */        sw $a3, 0x18($sp)
  /* 13229C 8013401C 00002025 */        or $a0, $zero, $zero
  /* 1322A0 80134020 00002825 */        or $a1, $zero, $zero
  /* 1322A4 80134024 24060019 */     addiu $a2, $zero, 0x19
  /* 1322A8 80134028 0C033414 */       jal func_ovl0_800CD050
  /* 1322AC 8013402C AFA00028 */        sw $zero, 0x28($sp)
  /* 1322B0 80134030 3C018014 */       lui $at, %hi(gMNBattlePickerGObj)
  /* 1322B4 80134034 AC22BD78 */        sw $v0, %lo(gMNBattlePickerGObj)($at)
  /* 1322B8 80134038 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 1322BC 8013403C 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 1322C0 80134040 8C4C0074 */        lw $t4, 0x74($v0)
  /* 1322C4 80134044 3C0141B0 */       lui $at, (0x41B00000 >> 16) # 22.0
  /* 1322C8 80134048 44813000 */      mtc1 $at, $f6 # 22.0 to cop1
  /* 1322CC 8013404C E5840058 */      swc1 $f4, 0x58($t4)
  /* 1322D0 80134050 8C4D0074 */        lw $t5, 0x74($v0)
  /* 1322D4 80134054 3C048014 */       lui $a0, %hi(gMNBattleTimerValue)
  /* 1322D8 80134058 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 1322DC 8013405C 8C430074 */        lw $v1, 0x74($v0)
  /* 1322E0 80134060 946E0024 */       lhu $t6, 0x24($v1)
  /* 1322E4 80134064 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 1322E8 80134068 A46F0024 */        sh $t7, 0x24($v1)
  /* 1322EC 8013406C 8C430074 */        lw $v1, 0x74($v0)
  /* 1322F0 80134070 94780024 */       lhu $t8, 0x24($v1)
  /* 1322F4 80134074 37190001 */       ori $t9, $t8, 1
  /* 1322F8 80134078 A4790024 */        sh $t9, 0x24($v1)
  /* 1322FC 8013407C 0C04CF8A */       jal mnBattleDrawTimerValue
  /* 132300 80134080 8C84BD7C */        lw $a0, %lo(gMNBattleTimerValue)($a0)
  /* 132304 80134084 8FBF0034 */        lw $ra, 0x34($sp)
  /* 132308 80134088 27BD0038 */     addiu $sp, $sp, 0x38
  /* 13230C 8013408C 03E00008 */        jr $ra
  /* 132310 80134090 00000000 */       nop

glabel func_ovl26_80134094
  /* 132314 80134094 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 132318 80134098 3C0E8014 */       lui $t6, %hi(dMNBattleNumberColorsStock)
  /* 13231C 8013409C AFBF0034 */        sw $ra, 0x34($sp)
  /* 132320 801340A0 AFB20030 */        sw $s2, 0x30($sp)
  /* 132324 801340A4 AFB1002C */        sw $s1, 0x2c($sp)
  /* 132328 801340A8 AFB00028 */        sw $s0, 0x28($sp)
  /* 13232C 801340AC AFA40058 */        sw $a0, 0x58($sp)
  /* 132330 801340B0 25CEB744 */     addiu $t6, $t6, %lo(dMNBattleNumberColorsStock)
  /* 132334 801340B4 8DD80000 */        lw $t8, ($t6) # dMNBattleNumberColorsStock + 0
  /* 132338 801340B8 27A20040 */     addiu $v0, $sp, 0x40
  /* 13233C 801340BC 3C128014 */       lui $s2, %hi(gMNBattlePickerGObj)
  /* 132340 801340C0 AC580000 */        sw $t8, ($v0)
  /* 132344 801340C4 8DCF0004 */        lw $t7, 4($t6) # dMNBattleNumberColorsStock + 4
  /* 132348 801340C8 2652BD78 */     addiu $s2, $s2, %lo(gMNBattlePickerGObj)
  /* 13234C 801340CC 8E510000 */        lw $s1, ($s2) # gMNBattlePickerGObj + 0
  /* 132350 801340D0 AC4F0004 */        sw $t7, 4($v0)
  /* 132354 801340D4 8DD80008 */        lw $t8, 8($t6) # dMNBattleNumberColorsStock + 8
  /* 132358 801340D8 AC580008 */        sw $t8, 8($v0)
  /* 13235C 801340DC 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleNumberColorsStock + 12
  /* 132360 801340E0 AC4F000C */        sw $t7, 0xc($v0)
  /* 132364 801340E4 8DD80010 */        lw $t8, 0x10($t6) # dMNBattleNumberColorsStock + 16
  /* 132368 801340E8 AC580010 */        sw $t8, 0x10($v0)
  /* 13236C 801340EC 8DCF0014 */        lw $t7, 0x14($t6) # dMNBattleNumberColorsStock + 20
  /* 132370 801340F0 AC4F0014 */        sw $t7, 0x14($v0)
  /* 132374 801340F4 8E390074 */        lw $t9, 0x74($s1)
  /* 132378 801340F8 8F300008 */        lw $s0, 8($t9)
  /* 13237C 801340FC 5200000A */      beql $s0, $zero, .L80134128
  /* 132380 80134100 8FA90058 */        lw $t1, 0x58($sp)
  .L80134104:
  /* 132384 80134104 0C0025BB */       jal omEjectSObj
  /* 132388 80134108 02002025 */        or $a0, $s0, $zero
  /* 13238C 8013410C 8E510000 */        lw $s1, ($s2) # gMNBattlePickerGObj + 0
  /* 132390 80134110 8E280074 */        lw $t0, 0x74($s1)
  /* 132394 80134114 8D100008 */        lw $s0, 8($t0)
  /* 132398 80134118 1600FFFA */      bnez $s0, .L80134104
  /* 13239C 8013411C 00000000 */       nop
  /* 1323A0 80134120 27A20040 */     addiu $v0, $sp, 0x40
  /* 1323A4 80134124 8FA90058 */        lw $t1, 0x58($sp)
  .L80134128:
  /* 1323A8 80134128 02202025 */        or $a0, $s1, $zero
  /* 1323AC 8013412C 8FA50058 */        lw $a1, 0x58($sp)
  /* 1323B0 80134130 2921000A */      slti $at, $t1, 0xa
  /* 1323B4 80134134 1020000C */      beqz $at, .L80134168
  /* 1323B8 80134138 3C064356 */       lui $a2, 0x4356
  /* 1323BC 8013413C 240A0002 */     addiu $t2, $zero, 2
  /* 1323C0 80134140 AFAA0014 */        sw $t2, 0x14($sp)
  /* 1323C4 80134144 02202025 */        or $a0, $s1, $zero
  /* 1323C8 80134148 01202825 */        or $a1, $t1, $zero
  /* 1323CC 8013414C 3C064352 */       lui $a2, 0x4352
  /* 1323D0 80134150 3C0741B8 */       lui $a3, 0x41b8
  /* 1323D4 80134154 AFA20010 */        sw $v0, 0x10($sp)
  /* 1323D8 80134158 0C04CEEC */       jal mnBattleCreateNumber
  /* 1323DC 8013415C AFA00018 */        sw $zero, 0x18($sp)
  /* 1323E0 80134160 10000008 */         b .L80134184
  /* 1323E4 80134164 8FBF0034 */        lw $ra, 0x34($sp)
  .L80134168:
  /* 1323E8 80134168 240B0002 */     addiu $t3, $zero, 2
  /* 1323EC 8013416C AFAB0014 */        sw $t3, 0x14($sp)
  /* 1323F0 80134170 3C0741B8 */       lui $a3, 0x41b8
  /* 1323F4 80134174 AFA20010 */        sw $v0, 0x10($sp)
  /* 1323F8 80134178 0C04CEEC */       jal mnBattleCreateNumber
  /* 1323FC 8013417C AFA00018 */        sw $zero, 0x18($sp)
  /* 132400 80134180 8FBF0034 */        lw $ra, 0x34($sp)
  .L80134184:
  /* 132404 80134184 8FB00028 */        lw $s0, 0x28($sp)
  /* 132408 80134188 8FB1002C */        lw $s1, 0x2c($sp)
  /* 13240C 8013418C 8FB20030 */        lw $s2, 0x30($sp)
  /* 132410 80134190 03E00008 */        jr $ra
  /* 132414 80134194 27BD0058 */     addiu $sp, $sp, 0x58

glabel func_ovl26_80134198
  /* 132418 80134198 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 13241C 8013419C AFA40038 */        sw $a0, 0x38($sp)
  /* 132420 801341A0 3C048014 */       lui $a0, %hi(gMNBattlePickerGObj)
  /* 132424 801341A4 8C84BD78 */        lw $a0, %lo(gMNBattlePickerGObj)($a0)
  /* 132428 801341A8 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13242C 801341AC 10800003 */      beqz $a0, .L801341BC
  /* 132430 801341B0 00000000 */       nop
  /* 132434 801341B4 0C0026A1 */       jal omEjectGObj
  /* 132438 801341B8 00000000 */       nop
  .L801341BC:
  /* 13243C 801341BC 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 132440 801341C0 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 132444 801341C4 3C080000 */       lui $t0, %hi(D_NF_00005270)
  /* 132448 801341C8 25085270 */     addiu $t0, $t0, %lo(D_NF_00005270)
  /* 13244C 801341CC 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 132450 801341D0 3C078000 */       lui $a3, 0x8000
  /* 132454 801341D4 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 132458 801341D8 240F001A */     addiu $t7, $zero, 0x1a
  /* 13245C 801341DC 2418FFFF */     addiu $t8, $zero, -1
  /* 132460 801341E0 240A0001 */     addiu $t2, $zero, 1
  /* 132464 801341E4 240B0001 */     addiu $t3, $zero, 1
  /* 132468 801341E8 03284821 */      addu $t1, $t9, $t0
  /* 13246C 801341EC AFA90020 */        sw $t1, 0x20($sp)
  /* 132470 801341F0 AFAB002C */        sw $t3, 0x2c($sp)
  /* 132474 801341F4 AFAA0024 */        sw $t2, 0x24($sp)
  /* 132478 801341F8 AFB8001C */        sw $t8, 0x1c($sp)
  /* 13247C 801341FC AFAF0014 */        sw $t7, 0x14($sp)
  /* 132480 80134200 AFAE0010 */        sw $t6, 0x10($sp)
  /* 132484 80134204 AFA70018 */        sw $a3, 0x18($sp)
  /* 132488 80134208 00002025 */        or $a0, $zero, $zero
  /* 13248C 8013420C 00002825 */        or $a1, $zero, $zero
  /* 132490 80134210 24060019 */     addiu $a2, $zero, 0x19
  /* 132494 80134214 0C033414 */       jal func_ovl0_800CD050
  /* 132498 80134218 AFA00028 */        sw $zero, 0x28($sp)
  /* 13249C 8013421C 3C018014 */       lui $at, %hi(gMNBattlePickerGObj)
  /* 1324A0 80134220 AC22BD78 */        sw $v0, %lo(gMNBattlePickerGObj)($at)
  /* 1324A4 80134224 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 1324A8 80134228 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 1324AC 8013422C 8C4C0074 */        lw $t4, 0x74($v0)
  /* 1324B0 80134230 3C0141B0 */       lui $at, (0x41B00000 >> 16) # 22.0
  /* 1324B4 80134234 44813000 */      mtc1 $at, $f6 # 22.0 to cop1
  /* 1324B8 80134238 E5840058 */      swc1 $f4, 0x58($t4)
  /* 1324BC 8013423C 8C4D0074 */        lw $t5, 0x74($v0)
  /* 1324C0 80134240 3C048014 */       lui $a0, %hi(gMNBattleStockValue)
  /* 1324C4 80134244 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 1324C8 80134248 8C430074 */        lw $v1, 0x74($v0)
  /* 1324CC 8013424C 946E0024 */       lhu $t6, 0x24($v1)
  /* 1324D0 80134250 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 1324D4 80134254 A46F0024 */        sh $t7, 0x24($v1)
  /* 1324D8 80134258 8C430074 */        lw $v1, 0x74($v0)
  /* 1324DC 8013425C 94780024 */       lhu $t8, 0x24($v1)
  /* 1324E0 80134260 37190001 */       ori $t9, $t8, 1
  /* 1324E4 80134264 A4790024 */        sh $t9, 0x24($v1)
  /* 1324E8 80134268 8C84BD80 */        lw $a0, %lo(gMNBattleStockValue)($a0)
  /* 1324EC 8013426C 0C04D025 */       jal func_ovl26_80134094
  /* 1324F0 80134270 24840001 */     addiu $a0, $a0, 1
  /* 1324F4 80134274 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1324F8 80134278 27BD0038 */     addiu $sp, $sp, 0x38
  /* 1324FC 8013427C 03E00008 */        jr $ra
  /* 132500 80134280 00000000 */       nop

glabel mnBattleCreateBackground
  /* 132504 80134284 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 132508 80134288 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13250C 8013428C AFBF003C */        sw $ra, 0x3c($sp)
  /* 132510 80134290 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 132514 80134294 240F0050 */     addiu $t7, $zero, 0x50
  /* 132518 80134298 24180000 */     addiu $t8, $zero, 0
  /* 13251C 8013429C 3C190400 */       lui $t9, 0x400
  /* 132520 801342A0 2408FFFF */     addiu $t0, $zero, -1
  /* 132524 801342A4 24090001 */     addiu $t1, $zero, 1
  /* 132528 801342A8 240A0001 */     addiu $t2, $zero, 1
  /* 13252C 801342AC AFAA0030 */        sw $t2, 0x30($sp)
  /* 132530 801342B0 AFA90028 */        sw $t1, 0x28($sp)
  /* 132534 801342B4 AFA80020 */        sw $t0, 0x20($sp)
  /* 132538 801342B8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13253C 801342BC AFB80018 */        sw $t8, 0x18($sp)
  /* 132540 801342C0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 132544 801342C4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 132548 801342C8 AFA00024 */        sw $zero, 0x24($sp)
  /* 13254C 801342CC AFA0002C */        sw $zero, 0x2c($sp)
  /* 132550 801342D0 AFA00034 */        sw $zero, 0x34($sp)
  /* 132554 801342D4 24040401 */     addiu $a0, $zero, 0x401
  /* 132558 801342D8 00002825 */        or $a1, $zero, $zero
  /* 13255C 801342DC 24060010 */     addiu $a2, $zero, 0x10
  /* 132560 801342E0 0C002E4F */       jal func_8000B93C
  /* 132564 801342E4 3C078000 */       lui $a3, 0x8000
  /* 132568 801342E8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13256C 801342EC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 132570 801342F0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 132574 801342F4 8C430074 */        lw $v1, 0x74($v0)
  /* 132578 801342F8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13257C 801342FC 44050000 */      mfc1 $a1, $f0
  /* 132580 80134300 44060000 */      mfc1 $a2, $f0
  /* 132584 80134304 3C07439B */       lui $a3, 0x439b
  /* 132588 80134308 24640008 */     addiu $a0, $v1, 8
  /* 13258C 8013430C 0C001C20 */       jal func_80007080
  /* 132590 80134310 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 132594 80134314 00002025 */        or $a0, $zero, $zero
  /* 132598 80134318 00002825 */        or $a1, $zero, $zero
  /* 13259C 8013431C 24060011 */     addiu $a2, $zero, 0x11
  /* 1325A0 80134320 0C00265A */       jal omMakeGObjSPAfter
  /* 1325A4 80134324 3C078000 */       lui $a3, 0x8000
  /* 1325A8 80134328 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1325AC 8013432C 240BFFFF */     addiu $t3, $zero, -1
  /* 1325B0 80134330 AFA20044 */        sw $v0, 0x44($sp)
  /* 1325B4 80134334 AFAB0010 */        sw $t3, 0x10($sp)
  /* 1325B8 80134338 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1325BC 8013433C 00402025 */        or $a0, $v0, $zero
  /* 1325C0 80134340 2406001A */     addiu $a2, $zero, 0x1a
  /* 1325C4 80134344 0C00277D */       jal omAddGObjRenderProc
  /* 1325C8 80134348 3C078000 */       lui $a3, 0x8000
  /* 1325CC 8013434C 3C0C8014 */       lui $t4, %hi(D_ovl26_8013C4AC)
  /* 1325D0 80134350 8D8CC4AC */        lw $t4, %lo(D_ovl26_8013C4AC)($t4)
  /* 1325D4 80134354 3C0D0000 */       lui $t5, %hi(D_NF_00000440)
  /* 1325D8 80134358 25AD0440 */     addiu $t5, $t5, %lo(D_NF_00000440)
  /* 1325DC 8013435C 8FA40044 */        lw $a0, 0x44($sp)
  /* 1325E0 80134360 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1325E4 80134364 018D2821 */      addu $a1, $t4, $t5
  /* 1325E8 80134368 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1325EC 8013436C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1325F0 80134370 240E0006 */     addiu $t6, $zero, 6
  /* 1325F4 80134374 240F0005 */     addiu $t7, $zero, 5
  /* 1325F8 80134378 2418012C */     addiu $t8, $zero, 0x12c
  /* 1325FC 8013437C 241900DC */     addiu $t9, $zero, 0xdc
  /* 132600 80134380 A0400065 */        sb $zero, 0x65($v0)
  /* 132604 80134384 A0400064 */        sb $zero, 0x64($v0)
  /* 132608 80134388 A04E0067 */        sb $t6, 0x67($v0)
  /* 13260C 8013438C A04F0066 */        sb $t7, 0x66($v0)
  /* 132610 80134390 A4580068 */        sh $t8, 0x68($v0)
  /* 132614 80134394 A459006A */        sh $t9, 0x6a($v0)
  /* 132618 80134398 E4400058 */      swc1 $f0, 0x58($v0)
  /* 13261C 8013439C E440005C */      swc1 $f0, 0x5c($v0)
  /* 132620 801343A0 8FBF003C */        lw $ra, 0x3c($sp)
  /* 132624 801343A4 27BD0048 */     addiu $sp, $sp, 0x48
  /* 132628 801343A8 03E00008 */        jr $ra
  /* 13262C 801343AC 00000000 */       nop

glabel mnBattleDrawTitleAndBack
  /* 132630 801343B0 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 132634 801343B4 3C0E8014 */       lui $t6, %hi(dMNBattleTitleOffsets)
  /* 132638 801343B8 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13263C 801343BC 25CEB75C */     addiu $t6, $t6, %lo(dMNBattleTitleOffsets)
  /* 132640 801343C0 8DD80000 */        lw $t8, ($t6) # dMNBattleTitleOffsets + 0
  /* 132644 801343C4 27A30044 */     addiu $v1, $sp, 0x44
  /* 132648 801343C8 3C198014 */       lui $t9, %hi(dMNBattleTitleColors)
  /* 13264C 801343CC AC780000 */        sw $t8, ($v1)
  /* 132650 801343D0 8DCF0004 */        lw $t7, 4($t6) # dMNBattleTitleOffsets + 4
  /* 132654 801343D4 2739B764 */     addiu $t9, $t9, %lo(dMNBattleTitleColors)
  /* 132658 801343D8 27A8003C */     addiu $t0, $sp, 0x3c
  /* 13265C 801343DC AC6F0004 */        sw $t7, 4($v1)
  /* 132660 801343E0 8F2B0000 */        lw $t3, ($t9) # dMNBattleTitleColors + 0
  /* 132664 801343E4 3C098014 */       lui $t1, %hi(gMNBattleIsTeamBattle)
  /* 132668 801343E8 2529BDA8 */     addiu $t1, $t1, %lo(gMNBattleIsTeamBattle)
  /* 13266C 801343EC AD0B0000 */        sw $t3, ($t0)
  /* 132670 801343F0 972B0004 */       lhu $t3, 4($t9) # dMNBattleTitleColors + 4
  /* 132674 801343F4 8D2E0000 */        lw $t6, ($t1) # gMNBattleIsTeamBattle + 0
  /* 132678 801343F8 3C02800D */       lui $v0, %hi(func_ovl0_800CCF00)
  /* 13267C 801343FC A50B0004 */        sh $t3, 4($t0)
  /* 132680 80134400 3C078000 */       lui $a3, 0x8000
  /* 132684 80134404 2442CF00 */     addiu $v0, $v0, %lo(func_ovl0_800CCF00)
  /* 132688 80134408 240C001A */     addiu $t4, $zero, 0x1a
  /* 13268C 8013440C 240DFFFF */     addiu $t5, $zero, -1
  /* 132690 80134410 000E7880 */       sll $t7, $t6, 2
  /* 132694 80134414 006FC021 */      addu $t8, $v1, $t7
  /* 132698 80134418 AFAD001C */        sw $t5, 0x1c($sp)
  /* 13269C 8013441C AFAC0014 */        sw $t4, 0x14($sp)
  /* 1326A0 80134420 AFA20010 */        sw $v0, 0x10($sp)
  /* 1326A4 80134424 AFA70018 */        sw $a3, 0x18($sp)
  /* 1326A8 80134428 8F190000 */        lw $t9, ($t8)
  /* 1326AC 8013442C 3C0A8014 */       lui $t2, %hi(D_ovl26_8013C4B0)
  /* 1326B0 80134430 8D4AC4B0 */        lw $t2, %lo(D_ovl26_8013C4B0)($t2)
  /* 1326B4 80134434 240C0001 */     addiu $t4, $zero, 1
  /* 1326B8 80134438 240D0001 */     addiu $t5, $zero, 1
  /* 1326BC 8013443C 032A5821 */      addu $t3, $t9, $t2
  /* 1326C0 80134440 AFAB0020 */        sw $t3, 0x20($sp)
  /* 1326C4 80134444 AFAD002C */        sw $t5, 0x2c($sp)
  /* 1326C8 80134448 AFAC0024 */        sw $t4, 0x24($sp)
  /* 1326CC 8013444C AFA20038 */        sw $v0, 0x38($sp)
  /* 1326D0 80134450 AFA00028 */        sw $zero, 0x28($sp)
  /* 1326D4 80134454 00002025 */        or $a0, $zero, $zero
  /* 1326D8 80134458 00002825 */        or $a1, $zero, $zero
  /* 1326DC 8013445C 0C033414 */       jal func_ovl0_800CD050
  /* 1326E0 80134460 24060019 */     addiu $a2, $zero, 0x19
  /* 1326E4 80134464 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 1326E8 80134468 44812000 */      mtc1 $at, $f4 # 27.0 to cop1
  /* 1326EC 8013446C 8C4E0074 */        lw $t6, 0x74($v0)
  /* 1326F0 80134470 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 1326F4 80134474 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 1326F8 80134478 E5C40058 */      swc1 $f4, 0x58($t6)
  /* 1326FC 8013447C 8C4F0074 */        lw $t7, 0x74($v0)
  /* 132700 80134480 3C098014 */       lui $t1, %hi(gMNBattleIsTeamBattle)
  /* 132704 80134484 2529BDA8 */     addiu $t1, $t1, %lo(gMNBattleIsTeamBattle)
  /* 132708 80134488 E5E6005C */      swc1 $f6, 0x5c($t7)
  /* 13270C 8013448C 8C430074 */        lw $v1, 0x74($v0)
  /* 132710 80134490 24040003 */     addiu $a0, $zero, 3
  /* 132714 80134494 27A8003C */     addiu $t0, $sp, 0x3c
  /* 132718 80134498 94780024 */       lhu $t8, 0x24($v1)
  /* 13271C 8013449C 3C018014 */       lui $at, %hi(gMNBattleTitleGObj)
  /* 132720 801344A0 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 132724 801344A4 A4790024 */        sh $t9, 0x24($v1)
  /* 132728 801344A8 8C430074 */        lw $v1, 0x74($v0)
  /* 13272C 801344AC 946A0024 */       lhu $t2, 0x24($v1)
  /* 132730 801344B0 354B0001 */       ori $t3, $t2, 1
  /* 132734 801344B4 A46B0024 */        sh $t3, 0x24($v1)
  /* 132738 801344B8 8D2C0000 */        lw $t4, ($t1) # gMNBattleIsTeamBattle + 0
  /* 13273C 801344BC 8C580074 */        lw $t8, 0x74($v0)
  /* 132740 801344C0 01840019 */     multu $t4, $a0
  /* 132744 801344C4 00006812 */      mflo $t5
  /* 132748 801344C8 010D7021 */      addu $t6, $t0, $t5
  /* 13274C 801344CC 91CF0000 */       lbu $t7, ($t6)
  /* 132750 801344D0 A30F0028 */        sb $t7, 0x28($t8)
  /* 132754 801344D4 8D390000 */        lw $t9, ($t1) # gMNBattleIsTeamBattle + 0
  /* 132758 801344D8 8C4D0074 */        lw $t5, 0x74($v0)
  /* 13275C 801344DC 03240019 */     multu $t9, $a0
  /* 132760 801344E0 00005012 */      mflo $t2
  /* 132764 801344E4 010A5821 */      addu $t3, $t0, $t2
  /* 132768 801344E8 916C0001 */       lbu $t4, 1($t3)
  /* 13276C 801344EC 3C0B8014 */       lui $t3, %hi(gMNBattleRule)
  /* 132770 801344F0 A1AC0029 */        sb $t4, 0x29($t5)
  /* 132774 801344F4 8D2E0000 */        lw $t6, ($t1) # gMNBattleIsTeamBattle + 0
  /* 132778 801344F8 8C4A0074 */        lw $t2, 0x74($v0)
  /* 13277C 801344FC 01C40019 */     multu $t6, $a0
  /* 132780 80134500 3C048014 */       lui $a0, 0x8014
  /* 132784 80134504 00007812 */      mflo $t7
  /* 132788 80134508 010FC021 */      addu $t8, $t0, $t7
  /* 13278C 8013450C 93190002 */       lbu $t9, 2($t8)
  /* 132790 80134510 A159002A */        sb $t9, 0x2a($t2)
  /* 132794 80134514 8D6BBDAC */        lw $t3, %lo(gMNBattleRule)($t3)
  /* 132798 80134518 AC22BDB0 */        sw $v0, %lo(gMNBattleTitleGObj)($at)
  /* 13279C 8013451C 24010001 */     addiu $at, $zero, 1
  /* 1327A0 80134520 15610006 */       bne $t3, $at, .L8013453C
  /* 1327A4 80134524 00000000 */       nop
  /* 1327A8 80134528 3C048014 */       lui $a0, %hi(gMNBattleTimerValue)
  /* 1327AC 8013452C 0C04CFEB */       jal mnBattleDrawTimerPicker
  /* 1327B0 80134530 8C84BD7C */        lw $a0, %lo(gMNBattleTimerValue)($a0)
  /* 1327B4 80134534 10000003 */         b .L80134544
  /* 1327B8 80134538 00000000 */       nop
  .L8013453C:
  /* 1327BC 8013453C 0C04D066 */       jal func_ovl26_80134198
  /* 1327C0 80134540 8C84BD80 */        lw $a0, -0x4280($a0)
  .L80134544:
  /* 1327C4 80134544 3C0F8014 */       lui $t7, %hi(D_ovl26_8013C4A0)
  /* 1327C8 80134548 8DEFC4A0 */        lw $t7, %lo(D_ovl26_8013C4A0)($t7)
  /* 1327CC 8013454C 3C180001 */       lui $t8, %hi(D_NF_000115C8)
  /* 1327D0 80134550 8FAC0038 */        lw $t4, 0x38($sp)
  /* 1327D4 80134554 271815C8 */     addiu $t8, $t8, %lo(D_NF_000115C8)
  /* 1327D8 80134558 3C078000 */       lui $a3, 0x8000
  /* 1327DC 8013455C 240D001A */     addiu $t5, $zero, 0x1a
  /* 1327E0 80134560 240EFFFF */     addiu $t6, $zero, -1
  /* 1327E4 80134564 240A0001 */     addiu $t2, $zero, 1
  /* 1327E8 80134568 240B0001 */     addiu $t3, $zero, 1
  /* 1327EC 8013456C 01F8C821 */      addu $t9, $t7, $t8
  /* 1327F0 80134570 AFB90020 */        sw $t9, 0x20($sp)
  /* 1327F4 80134574 AFAB002C */        sw $t3, 0x2c($sp)
  /* 1327F8 80134578 AFAA0024 */        sw $t2, 0x24($sp)
  /* 1327FC 8013457C AFAE001C */        sw $t6, 0x1c($sp)
  /* 132800 80134580 AFAD0014 */        sw $t5, 0x14($sp)
  /* 132804 80134584 AFA70018 */        sw $a3, 0x18($sp)
  /* 132808 80134588 00002025 */        or $a0, $zero, $zero
  /* 13280C 8013458C 00002825 */        or $a1, $zero, $zero
  /* 132810 80134590 24060019 */     addiu $a2, $zero, 0x19
  /* 132814 80134594 AFA00028 */        sw $zero, 0x28($sp)
  /* 132818 80134598 0C033414 */       jal func_ovl0_800CD050
  /* 13281C 8013459C AFAC0010 */        sw $t4, 0x10($sp)
  /* 132820 801345A0 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 132824 801345A4 44814000 */      mtc1 $at, $f8 # 244.0 to cop1
  /* 132828 801345A8 8C4C0074 */        lw $t4, 0x74($v0)
  /* 13282C 801345AC 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 132830 801345B0 44815000 */      mtc1 $at, $f10 # 23.0 to cop1
  /* 132834 801345B4 E5880058 */      swc1 $f8, 0x58($t4)
  /* 132838 801345B8 8C4D0074 */        lw $t5, 0x74($v0)
  /* 13283C 801345BC E5AA005C */      swc1 $f10, 0x5c($t5)
  /* 132840 801345C0 8C430074 */        lw $v1, 0x74($v0)
  /* 132844 801345C4 946E0024 */       lhu $t6, 0x24($v1)
  /* 132848 801345C8 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 13284C 801345CC A46F0024 */        sh $t7, 0x24($v1)
  /* 132850 801345D0 8C430074 */        lw $v1, 0x74($v0)
  /* 132854 801345D4 94780024 */       lhu $t8, 0x24($v1)
  /* 132858 801345D8 37190001 */       ori $t9, $t8, 1
  /* 13285C 801345DC A4790024 */        sh $t9, 0x24($v1)
  /* 132860 801345E0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 132864 801345E4 27BD0058 */     addiu $sp, $sp, 0x58
  /* 132868 801345E8 03E00008 */        jr $ra
  /* 13286C 801345EC 00000000 */       nop

  /* 132870 801345F0 03E00008 */        jr $ra
  /* 132874 801345F4 00000000 */       nop

  /* 132878 801345F8 03E00008 */        jr $ra
  /* 13287C 801345FC 00000000 */       nop

  /* 132880 80134600 03E00008 */        jr $ra
  /* 132884 80134604 00000000 */       nop

glabel mnBattleGetAdditionalSelectedCount
  /* 132888 80134608 3C0E8014 */       lui $t6, %hi(D_ovl26_8013BAD0)
  /* 13288C 8013460C 8DCEBAD0 */        lw $t6, %lo(D_ovl26_8013BAD0)($t6)
  /* 132890 80134610 00001025 */        or $v0, $zero, $zero
  /* 132894 80134614 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BB8C)
  /* 132898 80134618 148E0002 */       bne $a0, $t6, .L80134624
  /* 13289C 8013461C 3C188014 */       lui $t8, %hi(D_ovl26_8013BC48)
  /* 1328A0 80134620 24020001 */     addiu $v0, $zero, 1
  .L80134624:
  /* 1328A4 80134624 8DEFBB8C */        lw $t7, %lo(D_ovl26_8013BB8C)($t7)
  /* 1328A8 80134628 3C198014 */       lui $t9, %hi(D_ovl26_8013BD04)
  /* 1328AC 8013462C 148F0002 */       bne $a0, $t7, .L80134638
  /* 1328B0 80134630 00000000 */       nop
  /* 1328B4 80134634 24420001 */     addiu $v0, $v0, 1
  .L80134638:
  /* 1328B8 80134638 8F18BC48 */        lw $t8, %lo(D_ovl26_8013BC48)($t8)
  /* 1328BC 8013463C 14980002 */       bne $a0, $t8, .L80134648
  /* 1328C0 80134640 00000000 */       nop
  /* 1328C4 80134644 24420001 */     addiu $v0, $v0, 1
  .L80134648:
  /* 1328C8 80134648 8F39BD04 */        lw $t9, %lo(D_ovl26_8013BD04)($t9)
  /* 1328CC 8013464C 14990002 */       bne $a0, $t9, .L80134658
  /* 1328D0 80134650 00000000 */       nop
  /* 1328D4 80134654 24420001 */     addiu $v0, $v0, 1
  .L80134658:
  /* 1328D8 80134658 10400004 */      beqz $v0, .L8013466C
  /* 1328DC 8013465C 00401825 */        or $v1, $v0, $zero
  /* 1328E0 80134660 2443FFFF */     addiu $v1, $v0, -1
  /* 1328E4 80134664 03E00008 */        jr $ra
  /* 1328E8 80134668 00601025 */        or $v0, $v1, $zero

  .L8013466C:
  /* 1328EC 8013466C 03E00008 */        jr $ra
  /* 1328F0 80134670 00601025 */        or $v0, $v1, $zero

glabel mnBattleIsCostumeInUse
  /* 1328F4 80134674 10A0000A */      beqz $a1, .L801346A0
  /* 1328F8 80134678 3C0E8014 */       lui $t6, %hi(D_ovl26_8013BAD0)
  /* 1328FC 8013467C 8DCEBAD0 */        lw $t6, %lo(D_ovl26_8013BAD0)($t6)
  /* 132900 80134680 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BAD4)
  /* 132904 80134684 548E0007 */      bnel $a0, $t6, .L801346A4
  /* 132908 80134688 24010001 */     addiu $at, $zero, 1
  /* 13290C 8013468C 8DEFBAD4 */        lw $t7, %lo(D_ovl26_8013BAD4)($t7)
  /* 132910 80134690 54CF0004 */      bnel $a2, $t7, .L801346A4
  /* 132914 80134694 24010001 */     addiu $at, $zero, 1
  /* 132918 80134698 03E00008 */        jr $ra
  /* 13291C 8013469C 24020001 */     addiu $v0, $zero, 1

  .L801346A0:
  /* 132920 801346A0 24010001 */     addiu $at, $zero, 1
  .L801346A4:
  /* 132924 801346A4 10A1000A */       beq $a1, $at, .L801346D0
  /* 132928 801346A8 3C188014 */       lui $t8, %hi(D_ovl26_8013BB8C)
  /* 13292C 801346AC 8F18BB8C */        lw $t8, %lo(D_ovl26_8013BB8C)($t8)
  /* 132930 801346B0 3C198014 */       lui $t9, %hi(D_ovl26_8013BB90)
  /* 132934 801346B4 54980007 */      bnel $a0, $t8, .L801346D4
  /* 132938 801346B8 24010002 */     addiu $at, $zero, 2
  /* 13293C 801346BC 8F39BB90 */        lw $t9, %lo(D_ovl26_8013BB90)($t9)
  /* 132940 801346C0 54D90004 */      bnel $a2, $t9, .L801346D4
  /* 132944 801346C4 24010002 */     addiu $at, $zero, 2
  /* 132948 801346C8 03E00008 */        jr $ra
  /* 13294C 801346CC 24020001 */     addiu $v0, $zero, 1

  .L801346D0:
  /* 132950 801346D0 24010002 */     addiu $at, $zero, 2
  .L801346D4:
  /* 132954 801346D4 10A1000A */       beq $a1, $at, .L80134700
  /* 132958 801346D8 3C088014 */       lui $t0, %hi(D_ovl26_8013BC48)
  /* 13295C 801346DC 8D08BC48 */        lw $t0, %lo(D_ovl26_8013BC48)($t0)
  /* 132960 801346E0 3C098014 */       lui $t1, %hi(D_ovl26_8013BC4C)
  /* 132964 801346E4 54880007 */      bnel $a0, $t0, .L80134704
  /* 132968 801346E8 24010003 */     addiu $at, $zero, 3
  /* 13296C 801346EC 8D29BC4C */        lw $t1, %lo(D_ovl26_8013BC4C)($t1)
  /* 132970 801346F0 54C90004 */      bnel $a2, $t1, .L80134704
  /* 132974 801346F4 24010003 */     addiu $at, $zero, 3
  /* 132978 801346F8 03E00008 */        jr $ra
  /* 13297C 801346FC 24020001 */     addiu $v0, $zero, 1

  .L80134700:
  /* 132980 80134700 24010003 */     addiu $at, $zero, 3
  .L80134704:
  /* 132984 80134704 10A1000A */       beq $a1, $at, .L80134730
  /* 132988 80134708 3C0A8014 */       lui $t2, %hi(D_ovl26_8013BD04)
  /* 13298C 8013470C 8D4ABD04 */        lw $t2, %lo(D_ovl26_8013BD04)($t2)
  /* 132990 80134710 3C0B8014 */       lui $t3, %hi(D_ovl26_8013BD08)
  /* 132994 80134714 548A0007 */      bnel $a0, $t2, .L80134734
  /* 132998 80134718 00001025 */        or $v0, $zero, $zero
  /* 13299C 8013471C 8D6BBD08 */        lw $t3, %lo(D_ovl26_8013BD08)($t3)
  /* 1329A0 80134720 54CB0004 */      bnel $a2, $t3, .L80134734
  /* 1329A4 80134724 00001025 */        or $v0, $zero, $zero
  /* 1329A8 80134728 03E00008 */        jr $ra
  /* 1329AC 8013472C 24020001 */     addiu $v0, $zero, 1

  .L80134730:
  /* 1329B0 80134730 00001025 */        or $v0, $zero, $zero
  .L80134734:
  /* 1329B4 80134734 03E00008 */        jr $ra
  /* 1329B8 80134738 00000000 */       nop

glabel mnBattleGetAvailableCostumeFFA
  /* 1329BC 8013473C 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 1329C0 80134740 AFB5002C */        sw $s5, 0x2c($sp)
  /* 1329C4 80134744 0080A825 */        or $s5, $a0, $zero
  /* 1329C8 80134748 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1329CC 8013474C AFBE0038 */        sw $fp, 0x38($sp)
  /* 1329D0 80134750 AFB70034 */        sw $s7, 0x34($sp)
  /* 1329D4 80134754 AFB60030 */        sw $s6, 0x30($sp)
  /* 1329D8 80134758 AFB40028 */        sw $s4, 0x28($sp)
  /* 1329DC 8013475C AFB30024 */        sw $s3, 0x24($sp)
  /* 1329E0 80134760 AFB20020 */        sw $s2, 0x20($sp)
  /* 1329E4 80134764 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1329E8 80134768 AFB00018 */        sw $s0, 0x18($sp)
  /* 1329EC 8013476C AFA5006C */        sw $a1, 0x6c($sp)
  /* 1329F0 80134770 27A20048 */     addiu $v0, $sp, 0x48
  /* 1329F4 80134774 27A30058 */     addiu $v1, $sp, 0x58
  .L80134778:
  /* 1329F8 80134778 24420004 */     addiu $v0, $v0, 4
  /* 1329FC 8013477C 0043082B */      sltu $at, $v0, $v1
  /* 132A00 80134780 1420FFFD */      bnez $at, .L80134778
  /* 132A04 80134784 AC40FFFC */        sw $zero, -4($v0)
  /* 132A08 80134788 3C178014 */       lui $s7, %hi(gMNBattlePanels)
  /* 132A0C 8013478C 26F7BA88 */     addiu $s7, $s7, %lo(gMNBattlePanels)
  /* 132A10 80134790 0000B025 */        or $s6, $zero, $zero
  /* 132A14 80134794 241E00BC */     addiu $fp, $zero, 0xbc
  /* 132A18 80134798 24140004 */     addiu $s4, $zero, 4
  /* 132A1C 8013479C 24130001 */     addiu $s3, $zero, 1
  /* 132A20 801347A0 27B20048 */     addiu $s2, $sp, 0x48
  /* 132A24 801347A4 8FAE006C */        lw $t6, 0x6c($sp)
  .L801347A8:
  /* 132A28 801347A8 52CE0014 */      beql $s6, $t6, .L801347FC
  /* 132A2C 801347AC 26D60001 */     addiu $s6, $s6, 1
  /* 132A30 801347B0 02DE0019 */     multu $s6, $fp
  /* 132A34 801347B4 00008025 */        or $s0, $zero, $zero
  /* 132A38 801347B8 00007812 */      mflo $t7
  /* 132A3C 801347BC 02EF8821 */      addu $s1, $s7, $t7
  /* 132A40 801347C0 8E380048 */        lw $t8, 0x48($s1)
  /* 132A44 801347C4 16B8000C */       bne $s5, $t8, .L801347F8
  /* 132A48 801347C8 02A02025 */        or $a0, $s5, $zero
  .L801347CC:
  /* 132A4C 801347CC 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 132A50 801347D0 02002825 */        or $a1, $s0, $zero
  /* 132A54 801347D4 8E39004C */        lw $t9, 0x4c($s1)
  /* 132A58 801347D8 00104080 */       sll $t0, $s0, 2
  /* 132A5C 801347DC 02484821 */      addu $t1, $s2, $t0
  /* 132A60 801347E0 54590003 */      bnel $v0, $t9, .L801347F0
  /* 132A64 801347E4 26100001 */     addiu $s0, $s0, 1
  /* 132A68 801347E8 AD330000 */        sw $s3, ($t1)
  /* 132A6C 801347EC 26100001 */     addiu $s0, $s0, 1
  .L801347F0:
  /* 132A70 801347F0 5614FFF6 */      bnel $s0, $s4, .L801347CC
  /* 132A74 801347F4 02A02025 */        or $a0, $s5, $zero
  .L801347F8:
  /* 132A78 801347F8 26D60001 */     addiu $s6, $s6, 1
  .L801347FC:
  /* 132A7C 801347FC 2AC10004 */      slti $at, $s6, 4
  /* 132A80 80134800 5420FFE9 */      bnel $at, $zero, .L801347A8
  /* 132A84 80134804 8FAE006C */        lw $t6, 0x6c($sp)
  /* 132A88 80134808 8FAA0048 */        lw $t2, 0x48($sp)
  /* 132A8C 8013480C 8FB00018 */        lw $s0, 0x18($sp)
  /* 132A90 80134810 8FB1001C */        lw $s1, 0x1c($sp)
  /* 132A94 80134814 15400003 */      bnez $t2, .L80134824
  /* 132A98 80134818 8FB20020 */        lw $s2, 0x20($sp)
  /* 132A9C 8013481C 1000000E */         b .L80134858
  /* 132AA0 80134820 00001025 */        or $v0, $zero, $zero
  .L80134824:
  /* 132AA4 80134824 8FAB004C */        lw $t3, 0x4c($sp)
  /* 132AA8 80134828 8FAC0050 */        lw $t4, 0x50($sp)
  /* 132AAC 8013482C 15600003 */      bnez $t3, .L8013483C
  /* 132AB0 80134830 00000000 */       nop
  /* 132AB4 80134834 10000008 */         b .L80134858
  /* 132AB8 80134838 24020001 */     addiu $v0, $zero, 1
  .L8013483C:
  /* 132ABC 8013483C 15800003 */      bnez $t4, .L8013484C
  /* 132AC0 80134840 8FAD0054 */        lw $t5, 0x54($sp)
  /* 132AC4 80134844 10000004 */         b .L80134858
  /* 132AC8 80134848 24020002 */     addiu $v0, $zero, 2
  .L8013484C:
  /* 132ACC 8013484C 55A00003 */      bnel $t5, $zero, .L8013485C
  /* 132AD0 80134850 8FBF003C */        lw $ra, 0x3c($sp)
  /* 132AD4 80134854 24020003 */     addiu $v0, $zero, 3
  .L80134858:
  /* 132AD8 80134858 8FBF003C */        lw $ra, 0x3c($sp)
  .L8013485C:
  /* 132ADC 8013485C 8FB30024 */        lw $s3, 0x24($sp)
  /* 132AE0 80134860 8FB40028 */        lw $s4, 0x28($sp)
  /* 132AE4 80134864 8FB5002C */        lw $s5, 0x2c($sp)
  /* 132AE8 80134868 8FB60030 */        lw $s6, 0x30($sp)
  /* 132AEC 8013486C 8FB70034 */        lw $s7, 0x34($sp)
  /* 132AF0 80134870 8FBE0038 */        lw $fp, 0x38($sp)
  /* 132AF4 80134874 03E00008 */        jr $ra
  /* 132AF8 80134878 27BD0068 */     addiu $sp, $sp, 0x68

glabel mnBattleGetAvailableCostume
  /* 132AFC 8013487C 3C028014 */       lui $v0, %hi(gMNBattleIsTeamBattle)
  /* 132B00 80134880 8C42BDA8 */        lw $v0, %lo(gMNBattleIsTeamBattle)($v0)
  /* 132B04 80134884 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 132B08 80134888 AFBF0014 */        sw $ra, 0x14($sp)
  /* 132B0C 8013488C 14400008 */      bnez $v0, .L801348B0
  /* 132B10 80134890 00A03025 */        or $a2, $a1, $zero
  /* 132B14 80134894 0C04D1CF */       jal mnBattleGetAvailableCostumeFFA
  /* 132B18 80134898 AFA40018 */        sw $a0, 0x18($sp)
  /* 132B1C 8013489C 8FA40018 */        lw $a0, 0x18($sp)
  /* 132B20 801348A0 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 132B24 801348A4 00402825 */        or $a1, $v0, $zero
  /* 132B28 801348A8 1000000D */         b .L801348E0
  /* 132B2C 801348AC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801348B0:
  /* 132B30 801348B0 24010001 */     addiu $at, $zero, 1
  /* 132B34 801348B4 14410009 */       bne $v0, $at, .L801348DC
  /* 132B38 801348B8 00067080 */       sll $t6, $a2, 2
  /* 132B3C 801348BC 01C67023 */      subu $t6, $t6, $a2
  /* 132B40 801348C0 000E7100 */       sll $t6, $t6, 4
  /* 132B44 801348C4 01C67023 */      subu $t6, $t6, $a2
  /* 132B48 801348C8 000E7080 */       sll $t6, $t6, 2
  /* 132B4C 801348CC 3C058014 */       lui $a1, %hi(D_ovl26_8013BAC8)
  /* 132B50 801348D0 00AE2821 */      addu $a1, $a1, $t6
  /* 132B54 801348D4 0C03B041 */       jal ftCostume_GetIndexTeam
  /* 132B58 801348D8 8CA5BAC8 */        lw $a1, %lo(D_ovl26_8013BAC8)($a1)
  .L801348DC:
  /* 132B5C 801348DC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801348E0:
  /* 132B60 801348E0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 132B64 801348E4 03E00008 */        jr $ra
  /* 132B68 801348E8 00000000 */       nop

glabel mnBattleGetSelectedAnimation
  /* 132B6C 801348EC 2C81000C */     sltiu $at, $a0, 0xc
  /* 132B70 801348F0 10200012 */      beqz $at, jtgt_ovl26_8013493C
  /* 132B74 801348F4 00047080 */       sll $t6, $a0, 2
  /* 132B78 801348F8 3C018014 */       lui $at, %hi(jtbl_ovl26_8013BA30)
  /* 132B7C 801348FC 002E0821 */      addu $at, $at, $t6
  /* 132B80 80134900 8C2EBA30 */        lw $t6, %lo(jtbl_ovl26_8013BA30)($at)
  /* 132B84 80134904 01C00008 */        jr $t6
  /* 132B88 80134908 00000000 */       nop
  glabel jtgt_ovl26_8013490C
  /* 132B8C 8013490C 3C020001 */       lui $v0, (0x10004 >> 16) # 65540
  /* 132B90 80134910 03E00008 */        jr $ra
  /* 132B94 80134914 34420004 */       ori $v0, $v0, (0x10004 & 0xFFFF) # 65540

  glabel jtgt_ovl26_80134918
  /* 132B98 80134918 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 132B9C 8013491C 03E00008 */        jr $ra
  /* 132BA0 80134920 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537

  glabel jtgt_ovl26_80134924
  /* 132BA4 80134924 3C020001 */       lui $v0, (0x10002 >> 16) # 65538
  /* 132BA8 80134928 03E00008 */        jr $ra
  /* 132BAC 8013492C 34420002 */       ori $v0, $v0, (0x10002 & 0xFFFF) # 65538

  glabel jtgt_ovl26_80134930
  /* 132BB0 80134930 3C020001 */       lui $v0, (0x10003 >> 16) # 65539
  /* 132BB4 80134934 03E00008 */        jr $ra
  /* 132BB8 80134938 34420003 */       ori $v0, $v0, (0x10003 & 0xFFFF) # 65539

  glabel jtgt_ovl26_8013493C
  /* 132BBC 8013493C 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 132BC0 80134940 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537
  /* 132BC4 80134944 03E00008 */        jr $ra
  /* 132BC8 80134948 00000000 */       nop

glabel mnBattleRotateFighter
  /* 132BCC 8013494C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 132BD0 80134950 AFBF001C */        sw $ra, 0x1c($sp)
  /* 132BD4 80134954 AFB00018 */        sw $s0, 0x18($sp)
  /* 132BD8 80134958 8C820084 */        lw $v0, 0x84($a0)
  /* 132BDC 8013495C 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 132BE0 80134960 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 132BE4 80134964 9043000D */       lbu $v1, 0xd($v0)
  /* 132BE8 80134968 24010001 */     addiu $at, $zero, 1
  /* 132BEC 8013496C 00037080 */       sll $t6, $v1, 2
  /* 132BF0 80134970 01C37023 */      subu $t6, $t6, $v1
  /* 132BF4 80134974 000E7100 */       sll $t6, $t6, 4
  /* 132BF8 80134978 01C37023 */      subu $t6, $t6, $v1
  /* 132BFC 8013497C 000E7080 */       sll $t6, $t6, 2
  /* 132C00 80134980 01CF8021 */      addu $s0, $t6, $t7
  /* 132C04 80134984 8E180088 */        lw $t8, 0x88($s0)
  /* 132C08 80134988 5701002C */      bnel $t8, $at, .L80134A3C
  /* 132C0C 8013498C 8C820074 */        lw $v0, 0x74($a0)
  /* 132C10 80134990 8C820074 */        lw $v0, 0x74($a0)
  /* 132C14 80134994 3C018014 */       lui $at, %hi(D_ovl26_8013BA60)
  /* 132C18 80134998 C424BA60 */      lwc1 $f4, %lo(D_ovl26_8013BA60)($at)
  /* 132C1C 8013499C C4400034 */      lwc1 $f0, 0x34($v0)
  /* 132C20 801349A0 3C018014 */       lui $at, 0x8014
  /* 132C24 801349A4 4604003C */    c.lt.s $f0, $f4
  /* 132C28 801349A8 00000000 */       nop
  /* 132C2C 801349AC 4500000C */      bc1f .L801349E0
  /* 132C30 801349B0 00000000 */       nop
  /* 132C34 801349B4 8E19008C */        lw $t9, 0x8c($s0)
  /* 132C38 801349B8 57200030 */      bnel $t9, $zero, .L80134A7C
  /* 132C3C 801349BC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 132C40 801349C0 0C04D23B */       jal mnBattleGetSelectedAnimation
  /* 132C44 801349C4 8E040048 */        lw $a0, 0x48($s0)
  /* 132C48 801349C8 8E040008 */        lw $a0, 8($s0)
  /* 132C4C 801349CC 0C0E4173 */       jal func_ovl1_803905CC
  /* 132C50 801349D0 00402825 */        or $a1, $v0, $zero
  /* 132C54 801349D4 24080001 */     addiu $t0, $zero, 1
  /* 132C58 801349D8 10000027 */         b .L80134A78
  /* 132C5C 801349DC AE08008C */        sw $t0, 0x8c($s0)
  .L801349E0:
  /* 132C60 801349E0 C422BA64 */      lwc1 $f2, -0x459c($at)
  /* 132C64 801349E4 3C018014 */       lui $at, %hi(D_ovl26_8013BA68)
  /* 132C68 801349E8 C426BA68 */      lwc1 $f6, %lo(D_ovl26_8013BA68)($at)
  /* 132C6C 801349EC 46060200 */     add.s $f8, $f0, $f6
  /* 132C70 801349F0 E4480034 */      swc1 $f8, 0x34($v0)
  /* 132C74 801349F4 8C820074 */        lw $v0, 0x74($a0)
  /* 132C78 801349F8 C44A0034 */      lwc1 $f10, 0x34($v0)
  /* 132C7C 801349FC 460A103C */    c.lt.s $f2, $f10
  /* 132C80 80134A00 00000000 */       nop
  /* 132C84 80134A04 4502001D */     bc1fl .L80134A7C
  /* 132C88 80134A08 8FBF001C */        lw $ra, 0x1c($sp)
  /* 132C8C 80134A0C 44808000 */      mtc1 $zero, $f16
  /* 132C90 80134A10 00000000 */       nop
  /* 132C94 80134A14 E4500034 */      swc1 $f16, 0x34($v0)
  /* 132C98 80134A18 0C04D23B */       jal mnBattleGetSelectedAnimation
  /* 132C9C 80134A1C 8E040048 */        lw $a0, 0x48($s0)
  /* 132CA0 80134A20 8E040008 */        lw $a0, 8($s0)
  /* 132CA4 80134A24 0C0E4173 */       jal func_ovl1_803905CC
  /* 132CA8 80134A28 00402825 */        or $a1, $v0, $zero
  /* 132CAC 80134A2C 24090001 */     addiu $t1, $zero, 1
  /* 132CB0 80134A30 10000011 */         b .L80134A78
  /* 132CB4 80134A34 AE09008C */        sw $t1, 0x8c($s0)
  /* 132CB8 80134A38 8C820074 */        lw $v0, 0x74($a0)
  .L80134A3C:
  /* 132CBC 80134A3C 3C018014 */       lui $at, %hi(D_ovl26_8013BA6C)
  /* 132CC0 80134A40 C422BA6C */      lwc1 $f2, %lo(D_ovl26_8013BA6C)($at)
  /* 132CC4 80134A44 3C018014 */       lui $at, %hi(D_ovl26_8013BA70)
  /* 132CC8 80134A48 C424BA70 */      lwc1 $f4, %lo(D_ovl26_8013BA70)($at)
  /* 132CCC 80134A4C C4520034 */      lwc1 $f18, 0x34($v0)
  /* 132CD0 80134A50 46049180 */     add.s $f6, $f18, $f4
  /* 132CD4 80134A54 E4460034 */      swc1 $f6, 0x34($v0)
  /* 132CD8 80134A58 8C820074 */        lw $v0, 0x74($a0)
  /* 132CDC 80134A5C C4400034 */      lwc1 $f0, 0x34($v0)
  /* 132CE0 80134A60 4600103C */    c.lt.s $f2, $f0
  /* 132CE4 80134A64 00000000 */       nop
  /* 132CE8 80134A68 45020004 */     bc1fl .L80134A7C
  /* 132CEC 80134A6C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 132CF0 80134A70 46020201 */     sub.s $f8, $f0, $f2
  /* 132CF4 80134A74 E4480034 */      swc1 $f8, 0x34($v0)
  .L80134A78:
  /* 132CF8 80134A78 8FBF001C */        lw $ra, 0x1c($sp)
  .L80134A7C:
  /* 132CFC 80134A7C 8FB00018 */        lw $s0, 0x18($sp)
  /* 132D00 80134A80 27BD0020 */     addiu $sp, $sp, 0x20
  /* 132D04 80134A84 03E00008 */        jr $ra
  /* 132D08 80134A88 00000000 */       nop

glabel mnBattleSpawnFighter
  /* 132D0C 80134A8C 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 132D10 80134A90 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 132D14 80134A94 AFB00018 */        sw $s0, 0x18($sp)
  /* 132D18 80134A98 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 132D1C 80134A9C 00808025 */        or $s0, $a0, $zero
  /* 132D20 80134AA0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 132D24 80134AA4 AFA5006C */        sw $a1, 0x6c($sp)
  /* 132D28 80134AA8 AFA60070 */        sw $a2, 0x70($sp)
  /* 132D2C 80134AAC 25E9003C */     addiu $t1, $t7, 0x3c
  /* 132D30 80134AB0 27AE0024 */     addiu $t6, $sp, 0x24
  .L80134AB4:
  /* 132D34 80134AB4 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 132D38 80134AB8 25EF000C */     addiu $t7, $t7, 0xc
  /* 132D3C 80134ABC 25CE000C */     addiu $t6, $t6, 0xc
  /* 132D40 80134AC0 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 132D44 80134AC4 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 132D48 80134AC8 ADD8FFF8 */        sw $t8, -8($t6)
  /* 132D4C 80134ACC 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 132D50 80134AD0 15E9FFF8 */       bne $t7, $t1, .L80134AB4
  /* 132D54 80134AD4 ADD9FFFC */        sw $t9, -4($t6)
  /* 132D58 80134AD8 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 132D5C 80134ADC 2401001C */     addiu $at, $zero, 0x1c
  /* 132D60 80134AE0 ADD90000 */        sw $t9, ($t6)
  /* 132D64 80134AE4 8FAA0070 */        lw $t2, 0x70($sp)
  /* 132D68 80134AE8 5141005A */      beql $t2, $at, .L80134C54
  /* 132D6C 80134AEC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 132D70 80134AF0 5200000A */      beql $s0, $zero, .L80134B1C
  /* 132D74 80134AF4 44803000 */      mtc1 $zero, $f6
  /* 132D78 80134AF8 8E0B0074 */        lw $t3, 0x74($s0)
  /* 132D7C 80134AFC 02002025 */        or $a0, $s0, $zero
  /* 132D80 80134B00 C5640034 */      lwc1 $f4, 0x34($t3)
  /* 132D84 80134B04 AFA70074 */        sw $a3, 0x74($sp)
  /* 132D88 80134B08 0C035E3A */       jal ftManagerDestroyFighter
  /* 132D8C 80134B0C E7A40064 */      swc1 $f4, 0x64($sp)
  /* 132D90 80134B10 10000004 */         b .L80134B24
  /* 132D94 80134B14 8FA70074 */        lw $a3, 0x74($sp)
  /* 132D98 80134B18 44803000 */      mtc1 $zero, $f6
  .L80134B1C:
  /* 132D9C 80134B1C 00000000 */       nop
  /* 132DA0 80134B20 E7A60064 */      swc1 $f6, 0x64($sp)
  .L80134B24:
  /* 132DA4 80134B24 8FAD006C */        lw $t5, 0x6c($sp)
  /* 132DA8 80134B28 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 132DAC 80134B2C 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 132DB0 80134B30 000D4880 */       sll $t1, $t5, 2
  /* 132DB4 80134B34 012D4823 */      subu $t1, $t1, $t5
  /* 132DB8 80134B38 00094900 */       sll $t1, $t1, 4
  /* 132DBC 80134B3C 012D4823 */      subu $t1, $t1, $t5
  /* 132DC0 80134B40 00094880 */       sll $t1, $t1, 2
  /* 132DC4 80134B44 012F4021 */      addu $t0, $t1, $t7
  /* 132DC8 80134B48 8FAC0070 */        lw $t4, 0x70($sp)
  /* 132DCC 80134B4C 8D180050 */        lw $t8, 0x50($t0)
  /* 132DD0 80134B50 8D190034 */        lw $t9, 0x34($t0)
  /* 132DD4 80134B54 8FAA006C */        lw $t2, 0x6c($sp)
  /* 132DD8 80134B58 30EE00FF */      andi $t6, $a3, 0xff
  /* 132DDC 80134B5C AD0E004C */        sw $t6, 0x4c($t0)
  /* 132DE0 80134B60 A3A7003B */        sb $a3, 0x3b($sp)
  /* 132DE4 80134B64 AFA80020 */        sw $t0, 0x20($sp)
  /* 132DE8 80134B68 27A40024 */     addiu $a0, $sp, 0x24
  /* 132DEC 80134B6C AFAC0024 */        sw $t4, 0x24($sp)
  /* 132DF0 80134B70 A3B8003C */        sb $t8, 0x3c($sp)
  /* 132DF4 80134B74 AFB9005C */        sw $t9, 0x5c($sp)
  /* 132DF8 80134B78 0C035FCF */       jal ftManagerMakeFighter
  /* 132DFC 80134B7C A3AA0039 */        sb $t2, 0x39($sp)
  /* 132E00 80134B80 8FA80020 */        lw $t0, 0x20($sp)
  /* 132E04 80134B84 3C058013 */       lui $a1, %hi(mnBattleRotateFighter)
  /* 132E08 80134B88 00408025 */        or $s0, $v0, $zero
  /* 132E0C 80134B8C 24A5494C */     addiu $a1, $a1, %lo(mnBattleRotateFighter)
  /* 132E10 80134B90 00402025 */        or $a0, $v0, $zero
  /* 132E14 80134B94 24060001 */     addiu $a2, $zero, 1
  /* 132E18 80134B98 24070001 */     addiu $a3, $zero, 1
  /* 132E1C 80134B9C 0C002062 */       jal omAddGObjCommonProc
  /* 132E20 80134BA0 AD020008 */        sw $v0, 8($t0)
  /* 132E24 80134BA4 8FAB006C */        lw $t3, 0x6c($sp)
  /* 132E28 80134BA8 8E090074 */        lw $t1, 0x74($s0)
  /* 132E2C 80134BAC 8FA80020 */        lw $t0, 0x20($sp)
  /* 132E30 80134BB0 000B6080 */       sll $t4, $t3, 2
  /* 132E34 80134BB4 018B6023 */      subu $t4, $t4, $t3
  /* 132E38 80134BB8 000C6080 */       sll $t4, $t4, 2
  /* 132E3C 80134BBC 018B6021 */      addu $t4, $t4, $t3
  /* 132E40 80134BC0 000C60C0 */       sll $t4, $t4, 3
  /* 132E44 80134BC4 018B6021 */      addu $t4, $t4, $t3
  /* 132E48 80134BC8 000C60C0 */       sll $t4, $t4, 3
  /* 132E4C 80134BCC 258DFB1E */     addiu $t5, $t4, -0x4e2
  /* 132E50 80134BD0 448D4000 */      mtc1 $t5, $f8
  /* 132E54 80134BD4 3C018014 */       lui $at, %hi(dMNBattleFighterOffsetY)
  /* 132E58 80134BD8 3C0A8039 */       lui $t2, %hi(D_ovl1_80390D90)
  /* 132E5C 80134BDC 468042A0 */   cvt.s.w $f10, $f8
  /* 132E60 80134BE0 254A0D90 */     addiu $t2, $t2, %lo(D_ovl1_80390D90)
  /* 132E64 80134BE4 02002025 */        or $a0, $s0, $zero
  /* 132E68 80134BE8 24050001 */     addiu $a1, $zero, 1
  /* 132E6C 80134BEC E52A001C */      swc1 $f10, 0x1c($t1)
  /* 132E70 80134BF0 8E0F0074 */        lw $t7, 0x74($s0)
  /* 132E74 80134BF4 C430BA74 */      lwc1 $f16, %lo(dMNBattleFighterOffsetY)($at)
  /* 132E78 80134BF8 24010001 */     addiu $at, $zero, 1
  /* 132E7C 80134BFC E5F00020 */      swc1 $f16, 0x20($t7)
  /* 132E80 80134C00 8E0E0074 */        lw $t6, 0x74($s0)
  /* 132E84 80134C04 C7B20064 */      lwc1 $f18, 0x64($sp)
  /* 132E88 80134C08 E5D20034 */      swc1 $f18, 0x34($t6)
  /* 132E8C 80134C0C 8FB80070 */        lw $t8, 0x70($sp)
  /* 132E90 80134C10 8E0B0074 */        lw $t3, 0x74($s0)
  /* 132E94 80134C14 0018C880 */       sll $t9, $t8, 2
  /* 132E98 80134C18 032A1821 */      addu $v1, $t9, $t2
  /* 132E9C 80134C1C C4640000 */      lwc1 $f4, ($v1)
  /* 132EA0 80134C20 E5640040 */      swc1 $f4, 0x40($t3)
  /* 132EA4 80134C24 8E0C0074 */        lw $t4, 0x74($s0)
  /* 132EA8 80134C28 C4660000 */      lwc1 $f6, ($v1)
  /* 132EAC 80134C2C E5860044 */      swc1 $f6, 0x44($t4)
  /* 132EB0 80134C30 8E0D0074 */        lw $t5, 0x74($s0)
  /* 132EB4 80134C34 C4680000 */      lwc1 $f8, ($v1)
  /* 132EB8 80134C38 E5A80048 */      swc1 $f8, 0x48($t5)
  /* 132EBC 80134C3C 8D090084 */        lw $t1, 0x84($t0)
  /* 132EC0 80134C40 55210004 */      bnel $t1, $at, .L80134C54
  /* 132EC4 80134C44 8FBF001C */        lw $ra, 0x1c($sp)
  /* 132EC8 80134C48 0C03A605 */       jal ftColor_CheckSetColAnimIndex
  /* 132ECC 80134C4C 00003025 */        or $a2, $zero, $zero
  /* 132ED0 80134C50 8FBF001C */        lw $ra, 0x1c($sp)
  .L80134C54:
  /* 132ED4 80134C54 8FB00018 */        lw $s0, 0x18($sp)
  /* 132ED8 80134C58 27BD0068 */     addiu $sp, $sp, 0x68
  /* 132EDC 80134C5C 03E00008 */        jr $ra
  /* 132EE0 80134C60 00000000 */       nop

glabel mnBattleCreateFighterViewport
  /* 132EE4 80134C64 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 132EE8 80134C68 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 132EEC 80134C6C 3C190004 */       lui $t9, (0x48600 >> 16) # 296448
  /* 132EF0 80134C70 AFBF003C */        sw $ra, 0x3c($sp)
  /* 132EF4 80134C74 37398600 */       ori $t9, $t9, (0x48600 & 0xFFFF) # 296448
  /* 132EF8 80134C78 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 132EFC 80134C7C 240F001E */     addiu $t7, $zero, 0x1e
  /* 132F00 80134C80 24180000 */     addiu $t8, $zero, 0
  /* 132F04 80134C84 2408FFFF */     addiu $t0, $zero, -1
  /* 132F08 80134C88 24090001 */     addiu $t1, $zero, 1
  /* 132F0C 80134C8C 240A0001 */     addiu $t2, $zero, 1
  /* 132F10 80134C90 240B0001 */     addiu $t3, $zero, 1
  /* 132F14 80134C94 AFAB0030 */        sw $t3, 0x30($sp)
  /* 132F18 80134C98 AFAA0028 */        sw $t2, 0x28($sp)
  /* 132F1C 80134C9C AFA90024 */        sw $t1, 0x24($sp)
  /* 132F20 80134CA0 AFA80020 */        sw $t0, 0x20($sp)
  /* 132F24 80134CA4 AFB80018 */        sw $t8, 0x18($sp)
  /* 132F28 80134CA8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 132F2C 80134CAC AFAE0010 */        sw $t6, 0x10($sp)
  /* 132F30 80134CB0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 132F34 80134CB4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 132F38 80134CB8 AFA00034 */        sw $zero, 0x34($sp)
  /* 132F3C 80134CBC 24040401 */     addiu $a0, $zero, 0x401
  /* 132F40 80134CC0 00002825 */        or $a1, $zero, $zero
  /* 132F44 80134CC4 24060010 */     addiu $a2, $zero, 0x10
  /* 132F48 80134CC8 0C002E4F */       jal func_8000B93C
  /* 132F4C 80134CCC 3C078000 */       lui $a3, 0x8000
  /* 132F50 80134CD0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 132F54 80134CD4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 132F58 80134CD8 8C430074 */        lw $v1, 0x74($v0)
  /* 132F5C 80134CDC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 132F60 80134CE0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 132F64 80134CE4 44050000 */      mfc1 $a1, $f0
  /* 132F68 80134CE8 44060000 */      mfc1 $a2, $f0
  /* 132F6C 80134CEC 3C07439B */       lui $a3, 0x439b
  /* 132F70 80134CF0 24640008 */     addiu $a0, $v1, 8
  /* 132F74 80134CF4 AFA30044 */        sw $v1, 0x44($sp)
  /* 132F78 80134CF8 0C001C20 */       jal func_80007080
  /* 132F7C 80134CFC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 132F80 80134D00 8FA30044 */        lw $v1, 0x44($sp)
  /* 132F84 80134D04 44800000 */      mtc1 $zero, $f0
  /* 132F88 80134D08 3C018014 */       lui $at, %hi(dMNBattleFighterViewportTiltZ)
  /* 132F8C 80134D0C 240C0004 */     addiu $t4, $zero, 4
  /* 132F90 80134D10 E460003C */      swc1 $f0, 0x3c($v1)
  /* 132F94 80134D14 E4600040 */      swc1 $f0, 0x40($v1)
  /* 132F98 80134D18 C426BA78 */      lwc1 $f6, %lo(dMNBattleFighterViewportTiltZ)($at)
  /* 132F9C 80134D1C 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 132FA0 80134D20 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 132FA4 80134D24 AC6C0080 */        sw $t4, 0x80($v1)
  /* 132FA8 80134D28 E4600048 */      swc1 $f0, 0x48($v1)
  /* 132FAC 80134D2C E460004C */      swc1 $f0, 0x4c($v1)
  /* 132FB0 80134D30 E4600050 */      swc1 $f0, 0x50($v1)
  /* 132FB4 80134D34 E4600054 */      swc1 $f0, 0x54($v1)
  /* 132FB8 80134D38 E460005C */      swc1 $f0, 0x5c($v1)
  /* 132FBC 80134D3C E4660044 */      swc1 $f6, 0x44($v1)
  /* 132FC0 80134D40 E4680058 */      swc1 $f8, 0x58($v1)
  /* 132FC4 80134D44 8FBF003C */        lw $ra, 0x3c($sp)
  /* 132FC8 80134D48 27BD0048 */     addiu $sp, $sp, 0x48
  /* 132FCC 80134D4C 03E00008 */        jr $ra
  /* 132FD0 80134D50 00000000 */       nop

glabel mnBattleRedrawCursor
  /* 132FD4 80134D54 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 132FD8 80134D58 3C0F8014 */       lui $t7, %hi(dMNBattleCursorTypeColors)
  /* 132FDC 80134D5C AFBF0014 */        sw $ra, 0x14($sp)
  /* 132FE0 80134D60 AFA5007C */        sw $a1, 0x7c($sp)
  /* 132FE4 80134D64 AFA60080 */        sw $a2, 0x80($sp)
  /* 132FE8 80134D68 25EFB76C */     addiu $t7, $t7, %lo(dMNBattleCursorTypeColors)
  /* 132FEC 80134D6C 8DF90000 */        lw $t9, ($t7) # dMNBattleCursorTypeColors + 0
  /* 132FF0 80134D70 8DF80004 */        lw $t8, 4($t7) # dMNBattleCursorTypeColors + 4
  /* 132FF4 80134D74 27AE0054 */     addiu $t6, $sp, 0x54
  /* 132FF8 80134D78 ADD90000 */        sw $t9, ($t6)
  /* 132FFC 80134D7C ADD80004 */        sw $t8, 4($t6)
  /* 133000 80134D80 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleCursorTypeColors + 12
  /* 133004 80134D84 8DF90008 */        lw $t9, 8($t7) # dMNBattleCursorTypeColors + 8
  /* 133008 80134D88 3C098014 */       lui $t1, %hi(dMNBattleCursorTypeOffsets)
  /* 13300C 80134D8C ADD8000C */        sw $t8, 0xc($t6)
  /* 133010 80134D90 ADD90008 */        sw $t9, 8($t6)
  /* 133014 80134D94 8DF90010 */        lw $t9, 0x10($t7) # dMNBattleCursorTypeColors + 16
  /* 133018 80134D98 8DF80014 */        lw $t8, 0x14($t7) # dMNBattleCursorTypeColors + 20
  /* 13301C 80134D9C 2529B784 */     addiu $t1, $t1, %lo(dMNBattleCursorTypeOffsets)
  /* 133020 80134DA0 ADD90010 */        sw $t9, 0x10($t6)
  /* 133024 80134DA4 ADD80014 */        sw $t8, 0x14($t6)
  /* 133028 80134DA8 8D2A0004 */        lw $t2, 4($t1) # dMNBattleCursorTypeOffsets + 4
  /* 13302C 80134DAC 8D2B0000 */        lw $t3, ($t1) # dMNBattleCursorTypeOffsets + 0
  /* 133030 80134DB0 27A80044 */     addiu $t0, $sp, 0x44
  /* 133034 80134DB4 AD0A0004 */        sw $t2, 4($t0)
  /* 133038 80134DB8 AD0B0000 */        sw $t3, ($t0)
  /* 13303C 80134DBC 8D2B0008 */        lw $t3, 8($t1) # dMNBattleCursorTypeOffsets + 8
  /* 133040 80134DC0 8D2A000C */        lw $t2, 0xc($t1) # dMNBattleCursorTypeOffsets + 12
  /* 133044 80134DC4 3C0D8014 */       lui $t5, %hi(dMNBattleCursorOffsets)
  /* 133048 80134DC8 25ADB794 */     addiu $t5, $t5, %lo(dMNBattleCursorOffsets)
  /* 13304C 80134DCC AD0B0008 */        sw $t3, 8($t0)
  /* 133050 80134DD0 AD0A000C */        sw $t2, 0xc($t0)
  /* 133054 80134DD4 8DAF0000 */        lw $t7, ($t5) # dMNBattleCursorOffsets + 0
  /* 133058 80134DD8 27AC0038 */     addiu $t4, $sp, 0x38
  /* 13305C 80134DDC 8DAE0004 */        lw $t6, 4($t5) # dMNBattleCursorOffsets + 4
  /* 133060 80134DE0 AD8F0000 */        sw $t7, ($t4)
  /* 133064 80134DE4 8DAF0008 */        lw $t7, 8($t5) # dMNBattleCursorOffsets + 8
  /* 133068 80134DE8 3C198014 */       lui $t9, %hi(dMNBattleCursorTypePositions)
  /* 13306C 80134DEC 2739B7A0 */     addiu $t9, $t9, %lo(dMNBattleCursorTypePositions)
  /* 133070 80134DF0 AD8E0004 */        sw $t6, 4($t4)
  /* 133074 80134DF4 AD8F0008 */        sw $t7, 8($t4)
  /* 133078 80134DF8 8F280004 */        lw $t0, 4($t9) # dMNBattleCursorTypePositions + 4
  /* 13307C 80134DFC 8F290000 */        lw $t1, ($t9) # dMNBattleCursorTypePositions + 0
  /* 133080 80134E00 27B80020 */     addiu $t8, $sp, 0x20
  /* 133084 80134E04 AF080004 */        sw $t0, 4($t8)
  /* 133088 80134E08 AF090000 */        sw $t1, ($t8)
  /* 13308C 80134E0C 8F290008 */        lw $t1, 8($t9) # dMNBattleCursorTypePositions + 8
  /* 133090 80134E10 8F28000C */        lw $t0, 0xc($t9) # dMNBattleCursorTypePositions + 12
  /* 133094 80134E14 AF090008 */        sw $t1, 8($t8)
  /* 133098 80134E18 AF08000C */        sw $t0, 0xc($t8)
  /* 13309C 80134E1C 8F280014 */        lw $t0, 0x14($t9) # dMNBattleCursorTypePositions + 20
  /* 1330A0 80134E20 8F290010 */        lw $t1, 0x10($t9) # dMNBattleCursorTypePositions + 16
  /* 1330A4 80134E24 AF080014 */        sw $t0, 0x14($t8)
  /* 1330A8 80134E28 AF090010 */        sw $t1, 0x10($t8)
  /* 1330AC 80134E2C 8C820074 */        lw $v0, 0x74($a0)
  /* 1330B0 80134E30 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 1330B4 80134E34 E7A40070 */      swc1 $f4, 0x70($sp)
  /* 1330B8 80134E38 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 1330BC 80134E3C AFA40078 */        sw $a0, 0x78($sp)
  /* 1330C0 80134E40 0C002DD8 */       jal func_8000B760
  /* 1330C4 80134E44 E7A6006C */      swc1 $f6, 0x6c($sp)
  /* 1330C8 80134E48 8FAA0080 */        lw $t2, 0x80($sp)
  /* 1330CC 80134E4C 3C0D8014 */       lui $t5, %hi(D_ovl26_8013C4A0)
  /* 1330D0 80134E50 8DADC4A0 */        lw $t5, %lo(D_ovl26_8013C4A0)($t5)
  /* 1330D4 80134E54 000A5880 */       sll $t3, $t2, 2
  /* 1330D8 80134E58 03AB6021 */      addu $t4, $sp, $t3
  /* 1330DC 80134E5C 8D8C0038 */        lw $t4, 0x38($t4)
  /* 1330E0 80134E60 8FA40078 */        lw $a0, 0x78($sp)
  /* 1330E4 80134E64 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1330E8 80134E68 018D2821 */      addu $a1, $t4, $t5
  /* 1330EC 80134E6C C7A80070 */      lwc1 $f8, 0x70($sp)
  /* 1330F0 80134E70 944E0024 */       lhu $t6, 0x24($v0)
  /* 1330F4 80134E74 3C0B8014 */       lui $t3, %hi(D_ovl26_8013C4A0)
  /* 1330F8 80134E78 E4480058 */      swc1 $f8, 0x58($v0)
  /* 1330FC 80134E7C C7AA006C */      lwc1 $f10, 0x6c($sp)
  /* 133100 80134E80 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 133104 80134E84 A4580024 */        sh $t8, 0x24($v0)
  /* 133108 80134E88 37190001 */       ori $t9, $t8, 1
  /* 13310C 80134E8C A4590024 */        sh $t9, 0x24($v0)
  /* 133110 80134E90 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 133114 80134E94 8FA8007C */        lw $t0, 0x7c($sp)
  /* 133118 80134E98 8D6BC4A0 */        lw $t3, %lo(D_ovl26_8013C4A0)($t3)
  /* 13311C 80134E9C 8FA40078 */        lw $a0, 0x78($sp)
  /* 133120 80134EA0 00084880 */       sll $t1, $t0, 2
  /* 133124 80134EA4 03A95021 */      addu $t2, $sp, $t1
  /* 133128 80134EA8 8D4A0044 */        lw $t2, 0x44($t2)
  /* 13312C 80134EAC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 133130 80134EB0 014B2821 */      addu $a1, $t2, $t3
  /* 133134 80134EB4 8FAC0080 */        lw $t4, 0x80($sp)
  /* 133138 80134EB8 27AE0020 */     addiu $t6, $sp, 0x20
  /* 13313C 80134EBC 8C45000C */        lw $a1, 0xc($v0)
  /* 133140 80134EC0 000C68C0 */       sll $t5, $t4, 3
  /* 133144 80134EC4 01AE2021 */      addu $a0, $t5, $t6
  /* 133148 80134EC8 8C8F0000 */        lw $t7, ($a0)
  /* 13314C 80134ECC C4A40058 */      lwc1 $f4, 0x58($a1)
  /* 133150 80134ED0 94590024 */       lhu $t9, 0x24($v0)
  /* 133154 80134ED4 448F8000 */      mtc1 $t7, $f16
  /* 133158 80134ED8 27AD0054 */     addiu $t5, $sp, 0x54
  /* 13315C 80134EDC 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 133160 80134EE0 468084A0 */   cvt.s.w $f18, $f16
  /* 133164 80134EE4 352A0001 */       ori $t2, $t1, 1
  /* 133168 80134EE8 46049180 */     add.s $f6, $f18, $f4
  /* 13316C 80134EEC E4460058 */      swc1 $f6, 0x58($v0)
  /* 133170 80134EF0 8C980004 */        lw $t8, 4($a0)
  /* 133174 80134EF4 C4B0005C */      lwc1 $f16, 0x5c($a1)
  /* 133178 80134EF8 A4490024 */        sh $t1, 0x24($v0)
  /* 13317C 80134EFC 44984000 */      mtc1 $t8, $f8
  /* 133180 80134F00 A44A0024 */        sh $t2, 0x24($v0)
  /* 133184 80134F04 468042A0 */   cvt.s.w $f10, $f8
  /* 133188 80134F08 46105480 */     add.s $f18, $f10, $f16
  /* 13318C 80134F0C E452005C */      swc1 $f18, 0x5c($v0)
  /* 133190 80134F10 8FAB007C */        lw $t3, 0x7c($sp)
  /* 133194 80134F14 000B6080 */       sll $t4, $t3, 2
  /* 133198 80134F18 018B6023 */      subu $t4, $t4, $t3
  /* 13319C 80134F1C 000C6040 */       sll $t4, $t4, 1
  /* 1331A0 80134F20 018D1821 */      addu $v1, $t4, $t5
  /* 1331A4 80134F24 906E0000 */       lbu $t6, ($v1)
  /* 1331A8 80134F28 A04E0028 */        sb $t6, 0x28($v0)
  /* 1331AC 80134F2C 906F0001 */       lbu $t7, 1($v1)
  /* 1331B0 80134F30 A04F0029 */        sb $t7, 0x29($v0)
  /* 1331B4 80134F34 90780002 */       lbu $t8, 2($v1)
  /* 1331B8 80134F38 A058002A */        sb $t8, 0x2a($v0)
  /* 1331BC 80134F3C 90790003 */       lbu $t9, 3($v1)
  /* 1331C0 80134F40 A0590060 */        sb $t9, 0x60($v0)
  /* 1331C4 80134F44 90680004 */       lbu $t0, 4($v1)
  /* 1331C8 80134F48 A0480061 */        sb $t0, 0x61($v0)
  /* 1331CC 80134F4C 90690005 */       lbu $t1, 5($v1)
  /* 1331D0 80134F50 A0490062 */        sb $t1, 0x62($v0)
  /* 1331D4 80134F54 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1331D8 80134F58 27BD0078 */     addiu $sp, $sp, 0x78
  /* 1331DC 80134F5C 03E00008 */        jr $ra
  /* 1331E0 80134F60 00000000 */       nop

glabel mnBattleCheckPickerRightArrowPress
  /* 1331E4 80134F64 8C820074 */        lw $v0, 0x74($a0)
  /* 1331E8 80134F68 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 1331EC 80134F6C 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 1331F0 80134F70 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 1331F4 80134F74 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 1331F8 80134F78 44814000 */      mtc1 $at, $f8 # 12.0 to cop1
  /* 1331FC 80134F7C 46062000 */     add.s $f0, $f4, $f6
  /* 133200 80134F80 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 133204 80134F84 4608003C */    c.lt.s $f0, $f8
  /* 133208 80134F88 00000000 */       nop
  /* 13320C 80134F8C 45010007 */      bc1t .L80134FAC
  /* 133210 80134F90 00000000 */       nop
  /* 133214 80134F94 44815000 */      mtc1 $at, $f10 # 35.0 to cop1
  /* 133218 80134F98 00001825 */        or $v1, $zero, $zero
  /* 13321C 80134F9C 4600503C */    c.lt.s $f10, $f0
  /* 133220 80134FA0 00000000 */       nop
  /* 133224 80134FA4 45000003 */      bc1f .L80134FB4
  /* 133228 80134FA8 00000000 */       nop
  .L80134FAC:
  /* 13322C 80134FAC 10000001 */         b .L80134FB4
  /* 133230 80134FB0 24030001 */     addiu $v1, $zero, 1
  .L80134FB4:
  /* 133234 80134FB4 10600003 */      beqz $v1, .L80134FC4
  /* 133238 80134FB8 3C0141A0 */       lui $at, 0x41a0
  /* 13323C 80134FBC 03E00008 */        jr $ra
  /* 133240 80134FC0 00001025 */        or $v0, $zero, $zero

  .L80134FC4:
  /* 133244 80134FC4 C4500058 */      lwc1 $f16, 0x58($v0)
  /* 133248 80134FC8 44819000 */      mtc1 $at, $f18
  /* 13324C 80134FCC 3C014352 */       lui $at, (0x43520000 >> 16) # 210.0
  /* 133250 80134FD0 44812000 */      mtc1 $at, $f4 # 210.0 to cop1
  /* 133254 80134FD4 46128000 */     add.s $f0, $f16, $f18
  /* 133258 80134FD8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13325C 80134FDC 00001825 */        or $v1, $zero, $zero
  /* 133260 80134FE0 00001025 */        or $v0, $zero, $zero
  /* 133264 80134FE4 4600203E */    c.le.s $f4, $f0
  /* 133268 80134FE8 00000000 */       nop
  /* 13326C 80134FEC 45000009 */      bc1f .L80135014
  /* 133270 80134FF0 00000000 */       nop
  /* 133274 80134FF4 44813000 */      mtc1 $at, $f6 # 230.0 to cop1
  /* 133278 80134FF8 00000000 */       nop
  /* 13327C 80134FFC 4606003E */    c.le.s $f0, $f6
  /* 133280 80135000 00000000 */       nop
  /* 133284 80135004 45000003 */      bc1f .L80135014
  /* 133288 80135008 00000000 */       nop
  /* 13328C 8013500C 10000001 */         b .L80135014
  /* 133290 80135010 24030001 */     addiu $v1, $zero, 1
  .L80135014:
  /* 133294 80135014 10600003 */      beqz $v1, .L80135024
  /* 133298 80135018 00000000 */       nop
  /* 13329C 8013501C 03E00008 */        jr $ra
  /* 1332A0 80135020 24020001 */     addiu $v0, $zero, 1

  .L80135024:
  /* 1332A4 80135024 03E00008 */        jr $ra
  /* 1332A8 80135028 00000000 */       nop

glabel mnBattleCheckPickerLeftArrowPress
  /* 1332AC 8013502C 8C820074 */        lw $v0, 0x74($a0)
  /* 1332B0 80135030 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 1332B4 80135034 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 1332B8 80135038 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 1332BC 8013503C 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 1332C0 80135040 44814000 */      mtc1 $at, $f8 # 12.0 to cop1
  /* 1332C4 80135044 46062000 */     add.s $f0, $f4, $f6
  /* 1332C8 80135048 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 1332CC 8013504C 4608003C */    c.lt.s $f0, $f8
  /* 1332D0 80135050 00000000 */       nop
  /* 1332D4 80135054 45010007 */      bc1t .L80135074
  /* 1332D8 80135058 00000000 */       nop
  /* 1332DC 8013505C 44815000 */      mtc1 $at, $f10 # 35.0 to cop1
  /* 1332E0 80135060 00001825 */        or $v1, $zero, $zero
  /* 1332E4 80135064 4600503C */    c.lt.s $f10, $f0
  /* 1332E8 80135068 00000000 */       nop
  /* 1332EC 8013506C 45000003 */      bc1f .L8013507C
  /* 1332F0 80135070 00000000 */       nop
  .L80135074:
  /* 1332F4 80135074 10000001 */         b .L8013507C
  /* 1332F8 80135078 24030001 */     addiu $v1, $zero, 1
  .L8013507C:
  /* 1332FC 8013507C 10600003 */      beqz $v1, .L8013508C
  /* 133300 80135080 3C0141A0 */       lui $at, 0x41a0
  /* 133304 80135084 03E00008 */        jr $ra
  /* 133308 80135088 00001025 */        or $v0, $zero, $zero

  .L8013508C:
  /* 13330C 8013508C C4500058 */      lwc1 $f16, 0x58($v0)
  /* 133310 80135090 44819000 */      mtc1 $at, $f18
  /* 133314 80135094 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 133318 80135098 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 13331C 8013509C 46128000 */     add.s $f0, $f16, $f18
  /* 133320 801350A0 3C014320 */       lui $at, (0x43200000 >> 16) # 160.0
  /* 133324 801350A4 00001825 */        or $v1, $zero, $zero
  /* 133328 801350A8 00001025 */        or $v0, $zero, $zero
  /* 13332C 801350AC 4600203E */    c.le.s $f4, $f0
  /* 133330 801350B0 00000000 */       nop
  /* 133334 801350B4 45000009 */      bc1f .L801350DC
  /* 133338 801350B8 00000000 */       nop
  /* 13333C 801350BC 44813000 */      mtc1 $at, $f6 # 160.0 to cop1
  /* 133340 801350C0 00000000 */       nop
  /* 133344 801350C4 4606003E */    c.le.s $f0, $f6
  /* 133348 801350C8 00000000 */       nop
  /* 13334C 801350CC 45000003 */      bc1f .L801350DC
  /* 133350 801350D0 00000000 */       nop
  /* 133354 801350D4 10000001 */         b .L801350DC
  /* 133358 801350D8 24030001 */     addiu $v1, $zero, 1
  .L801350DC:
  /* 13335C 801350DC 10600003 */      beqz $v1, .L801350EC
  /* 133360 801350E0 00000000 */       nop
  /* 133364 801350E4 03E00008 */        jr $ra
  /* 133368 801350E8 24020001 */     addiu $v0, $zero, 1

  .L801350EC:
  /* 13336C 801350EC 03E00008 */        jr $ra
  /* 133370 801350F0 00000000 */       nop

  /* 133374 801350F4 03E00008 */        jr $ra
  /* 133378 801350F8 00000000 */       nop

glabel mnBattleUpdatePanelsAndFighterCostumes
  /* 13337C 801350FC 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 133380 80135100 3C0F8014 */       lui $t7, %hi(dMNBattlePanelColorIndexes)
  /* 133384 80135104 AFBF002C */        sw $ra, 0x2c($sp)
  /* 133388 80135108 AFB40028 */        sw $s4, 0x28($sp)
  /* 13338C 8013510C AFB30024 */        sw $s3, 0x24($sp)
  /* 133390 80135110 AFB20020 */        sw $s2, 0x20($sp)
  /* 133394 80135114 AFB1001C */        sw $s1, 0x1c($sp)
  /* 133398 80135118 AFB00018 */        sw $s0, 0x18($sp)
  /* 13339C 8013511C 25EFB7B8 */     addiu $t7, $t7, %lo(dMNBattlePanelColorIndexes)
  /* 1333A0 80135120 8DF90000 */        lw $t9, ($t7) # dMNBattlePanelColorIndexes + 0
  /* 1333A4 80135124 8DF80004 */        lw $t8, 4($t7) # dMNBattlePanelColorIndexes + 4
  /* 1333A8 80135128 27AE0044 */     addiu $t6, $sp, 0x44
  /* 1333AC 8013512C ADD90000 */        sw $t9, ($t6)
  /* 1333B0 80135130 ADD80004 */        sw $t8, 4($t6)
  /* 1333B4 80135134 8DF8000C */        lw $t8, 0xc($t7) # dMNBattlePanelColorIndexes + 12
  /* 1333B8 80135138 8DF90008 */        lw $t9, 8($t7) # dMNBattlePanelColorIndexes + 8
  /* 1333BC 8013513C 3C028014 */       lui $v0, %hi(gMNBattleIsTeamBattle)
  /* 1333C0 80135140 ADD8000C */        sw $t8, 0xc($t6)
  /* 1333C4 80135144 ADD90008 */        sw $t9, 8($t6)
  /* 1333C8 80135148 8C42BDA8 */        lw $v0, %lo(gMNBattleIsTeamBattle)($v0)
  /* 1333CC 8013514C 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 1333D0 80135150 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 1333D4 80135154 1440001E */      bnez $v0, .L801351D0
  /* 1333D8 80135158 00008825 */        or $s1, $zero, $zero
  /* 1333DC 8013515C 27B20044 */     addiu $s2, $sp, 0x44
  /* 1333E0 80135160 24140004 */     addiu $s4, $zero, 4
  /* 1333E4 80135164 2413001C */     addiu $s3, $zero, 0x1c
  .L80135168:
  /* 1333E8 80135168 8E040018 */        lw $a0, 0x18($s0) # gMNBattlePanels + 24
  /* 1333EC 8013516C 8E450000 */        lw $a1, ($s2)
  /* 1333F0 80135170 0C04CCAB */       jal func_ovl26_801332AC
  /* 1333F4 80135174 8E060084 */        lw $a2, 0x84($s0) # gMNBattlePanels + 132
  /* 1333F8 80135178 8E040048 */        lw $a0, 0x48($s0) # gMNBattlePanels + 72
  /* 1333FC 8013517C 5264000F */      beql $s3, $a0, .L801351BC
  /* 133400 80135180 26310001 */     addiu $s1, $s1, 1
  /* 133404 80135184 0C04D1CF */       jal mnBattleGetAvailableCostumeFFA
  /* 133408 80135188 02202825 */        or $a1, $s1, $zero
  /* 13340C 8013518C 8E040048 */        lw $a0, 0x48($s0) # gMNBattlePanels + 72
  /* 133410 80135190 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 133414 80135194 00402825 */        or $a1, $v0, $zero
  /* 133418 80135198 AE02004C */        sw $v0, 0x4c($s0) # gMNBattlePanels + 76
  /* 13341C 8013519C 0C04C6DE */       jal mnBattleGetShade
  /* 133420 801351A0 02202025 */        or $a0, $s1, $zero
  /* 133424 801351A4 AE020050 */        sw $v0, 0x50($s0) # gMNBattlePanels + 80
  /* 133428 801351A8 8E040008 */        lw $a0, 8($s0) # gMNBattlePanels + 8
  /* 13342C 801351AC 8E05004C */        lw $a1, 0x4c($s0) # gMNBattlePanels + 76
  /* 133430 801351B0 0C03A492 */       jal func_ovl2_800E9248
  /* 133434 801351B4 00403025 */        or $a2, $v0, $zero
  /* 133438 801351B8 26310001 */     addiu $s1, $s1, 1
  .L801351BC:
  /* 13343C 801351BC 261000BC */     addiu $s0, $s0, 0xbc
  /* 133440 801351C0 1634FFE9 */       bne $s1, $s4, .L80135168
  /* 133444 801351C4 26520004 */     addiu $s2, $s2, 4
  /* 133448 801351C8 3C028014 */       lui $v0, %hi(gMNBattleIsTeamBattle)
  /* 13344C 801351CC 8C42BDA8 */        lw $v0, %lo(gMNBattleIsTeamBattle)($v0)
  .L801351D0:
  /* 133450 801351D0 24010001 */     addiu $at, $zero, 1
  /* 133454 801351D4 2413001C */     addiu $s3, $zero, 0x1c
  /* 133458 801351D8 1441001D */       bne $v0, $at, .L80135250
  /* 13345C 801351DC 24140004 */     addiu $s4, $zero, 4
  /* 133460 801351E0 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 133464 801351E4 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 133468 801351E8 00008825 */        or $s1, $zero, $zero
  /* 13346C 801351EC 24120002 */     addiu $s2, $zero, 2
  .L801351F0:
  /* 133470 801351F0 8E020040 */        lw $v0, 0x40($s0) # gMNBattlePanels + 64
  /* 133474 801351F4 16420003 */       bne $s2, $v0, .L80135204
  /* 133478 801351F8 00402825 */        or $a1, $v0, $zero
  /* 13347C 801351FC 10000001 */         b .L80135204
  /* 133480 80135200 24050003 */     addiu $a1, $zero, 3
  .L80135204:
  /* 133484 80135204 8E040018 */        lw $a0, 0x18($s0) # gMNBattlePanels + 24
  /* 133488 80135208 0C04CCAB */       jal func_ovl26_801332AC
  /* 13348C 8013520C 8E060084 */        lw $a2, 0x84($s0) # gMNBattlePanels + 132
  /* 133490 80135210 8E040048 */        lw $a0, 0x48($s0) # gMNBattlePanels + 72
  /* 133494 80135214 5264000C */      beql $s3, $a0, .L80135248
  /* 133498 80135218 26310001 */     addiu $s1, $s1, 1
  /* 13349C 8013521C 0C03B041 */       jal ftCostume_GetIndexTeam
  /* 1334A0 80135220 8E050040 */        lw $a1, 0x40($s0) # gMNBattlePanels + 64
  /* 1334A4 80135224 AE02004C */        sw $v0, 0x4c($s0) # gMNBattlePanels + 76
  /* 1334A8 80135228 0C04C6DE */       jal mnBattleGetShade
  /* 1334AC 8013522C 02202025 */        or $a0, $s1, $zero
  /* 1334B0 80135230 AE020050 */        sw $v0, 0x50($s0) # gMNBattlePanels + 80
  /* 1334B4 80135234 8E040008 */        lw $a0, 8($s0) # gMNBattlePanels + 8
  /* 1334B8 80135238 8E05004C */        lw $a1, 0x4c($s0) # gMNBattlePanels + 76
  /* 1334BC 8013523C 0C03A492 */       jal func_ovl2_800E9248
  /* 1334C0 80135240 00403025 */        or $a2, $v0, $zero
  /* 1334C4 80135244 26310001 */     addiu $s1, $s1, 1
  .L80135248:
  /* 1334C8 80135248 1634FFE9 */       bne $s1, $s4, .L801351F0
  /* 1334CC 8013524C 261000BC */     addiu $s0, $s0, 0xbc
  .L80135250:
  /* 1334D0 80135250 8FBF002C */        lw $ra, 0x2c($sp)
  /* 1334D4 80135254 8FB00018 */        lw $s0, 0x18($sp)
  /* 1334D8 80135258 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1334DC 8013525C 8FB20020 */        lw $s2, 0x20($sp)
  /* 1334E0 80135260 8FB30024 */        lw $s3, 0x24($sp)
  /* 1334E4 80135264 8FB40028 */        lw $s4, 0x28($sp)
  /* 1334E8 80135268 03E00008 */        jr $ra
  /* 1334EC 8013526C 27BD0058 */     addiu $sp, $sp, 0x58

glabel func_ovl26_80135270
  /* 1334F0 80135270 8C820074 */        lw $v0, 0x74($a0)
  /* 1334F4 80135274 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 1334F8 80135278 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 1334FC 8013527C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 133500 80135280 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 133504 80135284 44814000 */      mtc1 $at, $f8 # 27.0 to cop1
  /* 133508 80135288 46062000 */     add.s $f0, $f4, $f6
  /* 13350C 8013528C 3C014309 */       lui $at, (0x43090000 >> 16) # 137.0
  /* 133510 80135290 00001825 */        or $v1, $zero, $zero
  /* 133514 80135294 4600403E */    c.le.s $f8, $f0
  /* 133518 80135298 00000000 */       nop
  /* 13351C 8013529C 45000009 */      bc1f .L801352C4
  /* 133520 801352A0 00000000 */       nop
  /* 133524 801352A4 44815000 */      mtc1 $at, $f10 # 137.0 to cop1
  /* 133528 801352A8 00000000 */       nop
  /* 13352C 801352AC 460A003E */    c.le.s $f0, $f10
  /* 133530 801352B0 00000000 */       nop
  /* 133534 801352B4 45000003 */      bc1f .L801352C4
  /* 133538 801352B8 00000000 */       nop
  /* 13353C 801352BC 10000001 */         b .L801352C4
  /* 133540 801352C0 24030001 */     addiu $v1, $zero, 1
  .L801352C4:
  /* 133544 801352C4 10600018 */      beqz $v1, .L80135328
  /* 133548 801352C8 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13354C 801352CC C450005C */      lwc1 $f16, 0x5c($v0)
  /* 133550 801352D0 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 133554 801352D4 3C014160 */       lui $at, (0x41600000 >> 16) # 14.0
  /* 133558 801352D8 44812000 */      mtc1 $at, $f4 # 14.0 to cop1
  /* 13355C 801352DC 46128000 */     add.s $f0, $f16, $f18
  /* 133560 801352E0 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 133564 801352E4 00001825 */        or $v1, $zero, $zero
  /* 133568 801352E8 4600203E */    c.le.s $f4, $f0
  /* 13356C 801352EC 00000000 */       nop
  /* 133570 801352F0 45000009 */      bc1f .L80135318
  /* 133574 801352F4 00000000 */       nop
  /* 133578 801352F8 44813000 */      mtc1 $at, $f6 # 35.0 to cop1
  /* 13357C 801352FC 00000000 */       nop
  /* 133580 80135300 4606003E */    c.le.s $f0, $f6
  /* 133584 80135304 00000000 */       nop
  /* 133588 80135308 45000003 */      bc1f .L80135318
  /* 13358C 8013530C 00000000 */       nop
  /* 133590 80135310 10000001 */         b .L80135318
  /* 133594 80135314 24030001 */     addiu $v1, $zero, 1
  .L80135318:
  /* 133598 80135318 50600004 */      beql $v1, $zero, .L8013532C
  /* 13359C 8013531C 00001025 */        or $v0, $zero, $zero
  /* 1335A0 80135320 03E00008 */        jr $ra
  /* 1335A4 80135324 24020001 */     addiu $v0, $zero, 1

  .L80135328:
  /* 1335A8 80135328 00001025 */        or $v0, $zero, $zero
  .L8013532C:
  /* 1335AC 8013532C 03E00008 */        jr $ra
  /* 1335B0 80135330 00000000 */       nop

glabel func_ovl26_80135334
  /* 1335B4 80135334 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1335B8 80135338 3C0F8014 */       lui $t7, %hi(dMNBattleTitleOffsetsDuplicate)
  /* 1335BC 8013533C AFBF0014 */        sw $ra, 0x14($sp)
  /* 1335C0 80135340 25EFB7C8 */     addiu $t7, $t7, %lo(dMNBattleTitleOffsetsDuplicate)
  /* 1335C4 80135344 8DF90000 */        lw $t9, ($t7) # dMNBattleTitleOffsetsDuplicate + 0
  /* 1335C8 80135348 8DF80004 */        lw $t8, 4($t7) # dMNBattleTitleOffsetsDuplicate + 4
  /* 1335CC 8013534C 27AE0024 */     addiu $t6, $sp, 0x24
  /* 1335D0 80135350 3C098014 */       lui $t1, %hi(dMNBattleTitleColorsDuplicate)
  /* 1335D4 80135354 2529B7D0 */     addiu $t1, $t1, %lo(dMNBattleTitleColorsDuplicate)
  /* 1335D8 80135358 ADD90000 */        sw $t9, ($t6)
  /* 1335DC 8013535C ADD80004 */        sw $t8, 4($t6)
  /* 1335E0 80135360 8D2B0000 */        lw $t3, ($t1) # dMNBattleTitleColorsDuplicate + 0
  /* 1335E4 80135364 27A8001C */     addiu $t0, $sp, 0x1c
  /* 1335E8 80135368 3C068014 */       lui $a2, %hi(gMNBattleIsTeamBattle)
  /* 1335EC 8013536C AD0B0000 */        sw $t3, ($t0)
  /* 1335F0 80135370 952B0004 */       lhu $t3, 4($t1) # dMNBattleTitleColorsDuplicate + 4
  /* 1335F4 80135374 24C6BDA8 */     addiu $a2, $a2, %lo(gMNBattleIsTeamBattle)
  /* 1335F8 80135378 3C0C8014 */       lui $t4, %hi(gMNBattleTitleGObj)
  /* 1335FC 8013537C A50B0004 */        sh $t3, 4($t0)
  /* 133600 80135380 8CCD0000 */        lw $t5, ($a2) # gMNBattleIsTeamBattle + 0
  /* 133604 80135384 8D8CBDB0 */        lw $t4, %lo(gMNBattleTitleGObj)($t4)
  /* 133608 80135388 24020001 */     addiu $v0, $zero, 1
  /* 13360C 8013538C 144D0003 */       bne $v0, $t5, .L8013539C
  /* 133610 80135390 AFAC0034 */        sw $t4, 0x34($sp)
  /* 133614 80135394 10000002 */         b .L801353A0
  /* 133618 80135398 ACC00000 */        sw $zero, ($a2) # gMNBattleIsTeamBattle + 0
  .L8013539C:
  /* 13361C 8013539C ACC20000 */        sw $v0, ($a2) # gMNBattleIsTeamBattle + 0
  .L801353A0:
  /* 133620 801353A0 0C0099A8 */       jal func_800266A0
  /* 133624 801353A4 00000000 */       nop
  /* 133628 801353A8 0C009A70 */       jal func_800269C0
  /* 13362C 801353AC 240400A4 */     addiu $a0, $zero, 0xa4
  /* 133630 801353B0 3C068014 */       lui $a2, %hi(gMNBattleIsTeamBattle)
  /* 133634 801353B4 24C6BDA8 */     addiu $a2, $a2, %lo(gMNBattleIsTeamBattle)
  /* 133638 801353B8 8CCE0000 */        lw $t6, ($a2) # gMNBattleIsTeamBattle + 0
  /* 13363C 801353BC 15C00005 */      bnez $t6, .L801353D4
  /* 133640 801353C0 00000000 */       nop
  /* 133644 801353C4 0C009A70 */       jal func_800269C0
  /* 133648 801353C8 24040200 */     addiu $a0, $zero, 0x200
  /* 13364C 801353CC 10000003 */         b .L801353DC
  /* 133650 801353D0 00000000 */       nop
  .L801353D4:
  /* 133654 801353D4 0C009A70 */       jal func_800269C0
  /* 133658 801353D8 2404020E */     addiu $a0, $zero, 0x20e
  .L801353DC:
  /* 13365C 801353DC 0C002DD8 */       jal func_8000B760
  /* 133660 801353E0 8FA40034 */        lw $a0, 0x34($sp)
  /* 133664 801353E4 3C068014 */       lui $a2, %hi(gMNBattleIsTeamBattle)
  /* 133668 801353E8 24C6BDA8 */     addiu $a2, $a2, %lo(gMNBattleIsTeamBattle)
  /* 13366C 801353EC 8CCF0000 */        lw $t7, ($a2) # gMNBattleIsTeamBattle + 0
  /* 133670 801353F0 3C088014 */       lui $t0, %hi(D_ovl26_8013C4B0)
  /* 133674 801353F4 8D08C4B0 */        lw $t0, %lo(D_ovl26_8013C4B0)($t0)
  /* 133678 801353F8 000FC080 */       sll $t8, $t7, 2
  /* 13367C 801353FC 03B8C821 */      addu $t9, $sp, $t8
  /* 133680 80135400 8F390024 */        lw $t9, 0x24($t9)
  /* 133684 80135404 8FA40034 */        lw $a0, 0x34($sp)
  /* 133688 80135408 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13368C 8013540C 03282821 */      addu $a1, $t9, $t0
  /* 133690 80135410 94490024 */       lhu $t1, 0x24($v0)
  /* 133694 80135414 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 133698 80135418 44812000 */      mtc1 $at, $f4 # 27.0 to cop1
  /* 13369C 8013541C 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 1336A0 80135420 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 1336A4 80135424 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 1336A8 80135428 3C068014 */       lui $a2, %hi(gMNBattleIsTeamBattle)
  /* 1336AC 8013542C A44B0024 */        sh $t3, 0x24($v0)
  /* 1336B0 80135430 356C0001 */       ori $t4, $t3, 1
  /* 1336B4 80135434 24C6BDA8 */     addiu $a2, $a2, %lo(gMNBattleIsTeamBattle)
  /* 1336B8 80135438 A44C0024 */        sh $t4, 0x24($v0)
  /* 1336BC 8013543C E4440058 */      swc1 $f4, 0x58($v0)
  /* 1336C0 80135440 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1336C4 80135444 8CCD0000 */        lw $t5, ($a2) # gMNBattleIsTeamBattle + 0
  /* 1336C8 80135448 24030003 */     addiu $v1, $zero, 3
  /* 1336CC 8013544C 27A4001C */     addiu $a0, $sp, 0x1c
  /* 1336D0 80135450 01A30019 */     multu $t5, $v1
  /* 1336D4 80135454 24010001 */     addiu $at, $zero, 1
  /* 1336D8 80135458 00007012 */      mflo $t6
  /* 1336DC 8013545C 008E7821 */      addu $t7, $a0, $t6
  /* 1336E0 80135460 91F80000 */       lbu $t8, ($t7)
  /* 1336E4 80135464 A0580028 */        sb $t8, 0x28($v0)
  /* 1336E8 80135468 8CD90000 */        lw $t9, ($a2) # gMNBattleIsTeamBattle + 0
  /* 1336EC 8013546C 3C188014 */       lui $t8, %hi(D_ovl26_8013BAD0)
  /* 1336F0 80135470 03230019 */     multu $t9, $v1
  /* 1336F4 80135474 00004012 */      mflo $t0
  /* 1336F8 80135478 00884821 */      addu $t1, $a0, $t0
  /* 1336FC 8013547C 912A0001 */       lbu $t2, 1($t1)
  /* 133700 80135480 3C088014 */       lui $t0, %hi(D_ovl26_8013BB8C)
  /* 133704 80135484 A04A0029 */        sb $t2, 0x29($v0)
  /* 133708 80135488 8CCB0000 */        lw $t3, ($a2) # gMNBattleIsTeamBattle + 0
  /* 13370C 8013548C 3C0A8014 */       lui $t2, %hi(D_ovl26_8013BC48)
  /* 133710 80135490 01630019 */     multu $t3, $v1
  /* 133714 80135494 00006012 */      mflo $t4
  /* 133718 80135498 008C6821 */      addu $t5, $a0, $t4
  /* 13371C 8013549C 91AE0002 */       lbu $t6, 2($t5)
  /* 133720 801354A0 3C0C8014 */       lui $t4, %hi(D_ovl26_8013BD04)
  /* 133724 801354A4 A04E002A */        sb $t6, 0x2a($v0)
  /* 133728 801354A8 8CCF0000 */        lw $t7, ($a2) # gMNBattleIsTeamBattle + 0
  /* 13372C 801354AC 15E10018 */       bne $t7, $at, .L80135510
  /* 133730 801354B0 00000000 */       nop
  /* 133734 801354B4 8F18BAD0 */        lw $t8, %lo(D_ovl26_8013BAD0)($t8)
  /* 133738 801354B8 2402001C */     addiu $v0, $zero, 0x1c
  /* 13373C 801354BC 24190004 */     addiu $t9, $zero, 4
  /* 133740 801354C0 10580002 */       beq $v0, $t8, .L801354CC
  /* 133744 801354C4 3C018014 */       lui $at, %hi(D_ovl26_8013BAD8)
  /* 133748 801354C8 AC39BAD8 */        sw $t9, %lo(D_ovl26_8013BAD8)($at)
  .L801354CC:
  /* 13374C 801354CC 8D08BB8C */        lw $t0, %lo(D_ovl26_8013BB8C)($t0)
  /* 133750 801354D0 24090004 */     addiu $t1, $zero, 4
  /* 133754 801354D4 3C018014 */       lui $at, %hi(D_ovl26_8013BB94)
  /* 133758 801354D8 10480002 */       beq $v0, $t0, .L801354E4
  /* 13375C 801354DC 240B0004 */     addiu $t3, $zero, 4
  /* 133760 801354E0 AC29BB94 */        sw $t1, %lo(D_ovl26_8013BB94)($at)
  .L801354E4:
  /* 133764 801354E4 8D4ABC48 */        lw $t2, %lo(D_ovl26_8013BC48)($t2)
  /* 133768 801354E8 3C018014 */       lui $at, %hi(D_ovl26_8013BC50)
  /* 13376C 801354EC 240D0004 */     addiu $t5, $zero, 4
  /* 133770 801354F0 104A0002 */       beq $v0, $t2, .L801354FC
  /* 133774 801354F4 00000000 */       nop
  /* 133778 801354F8 AC2BBC50 */        sw $t3, %lo(D_ovl26_8013BC50)($at)
  .L801354FC:
  /* 13377C 801354FC 8D8CBD04 */        lw $t4, %lo(D_ovl26_8013BD04)($t4)
  /* 133780 80135500 3C018014 */       lui $at, %hi(D_ovl26_8013BD0C)
  /* 133784 80135504 104C0002 */       beq $v0, $t4, .L80135510
  /* 133788 80135508 00000000 */       nop
  /* 13378C 8013550C AC2DBD0C */        sw $t5, %lo(D_ovl26_8013BD0C)($at)
  .L80135510:
  /* 133790 80135510 0C04D43F */       jal mnBattleUpdatePanelsAndFighterCostumes
  /* 133794 80135514 00000000 */       nop
  /* 133798 80135518 3C068014 */       lui $a2, %hi(gMNBattleIsTeamBattle)
  /* 13379C 8013551C 24C6BDA8 */     addiu $a2, $a2, %lo(gMNBattleIsTeamBattle)
  /* 1337A0 80135520 8CCE0000 */        lw $t6, ($a2) # gMNBattleIsTeamBattle + 0
  /* 1337A4 80135524 15C00005 */      bnez $t6, .L8013553C
  /* 1337A8 80135528 00000000 */       nop
  /* 1337AC 8013552C 0C04CA2B */       jal func_ovl26_801328AC
  /* 1337B0 80135530 00000000 */       nop
  /* 1337B4 80135534 10000004 */         b .L80135548
  /* 1337B8 80135538 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013553C:
  /* 1337BC 8013553C 0C04CA41 */       jal func_ovl26_80132904
  /* 1337C0 80135540 00000000 */       nop
  /* 1337C4 80135544 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135548:
  /* 1337C8 80135548 27BD0038 */     addiu $sp, $sp, 0x38
  /* 1337CC 8013554C 03E00008 */        jr $ra
  /* 1337D0 80135550 00000000 */       nop

glabel func_ovl26_80135554
  /* 1337D4 80135554 00051900 */       sll $v1, $a1, 4
  /* 1337D8 80135558 00651821 */      addu $v1, $v1, $a1
  /* 1337DC 8013555C 00031880 */       sll $v1, $v1, 2
  /* 1337E0 80135560 00651821 */      addu $v1, $v1, $a1
  /* 1337E4 80135564 8C820074 */        lw $v0, 0x74($a0)
  /* 1337E8 80135568 246E0022 */     addiu $t6, $v1, 0x22
  /* 1337EC 8013556C 448E4000 */      mtc1 $t6, $f8
  /* 1337F0 80135570 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 1337F4 80135574 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 1337F8 80135578 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 1337FC 8013557C 468042A0 */   cvt.s.w $f10, $f8
  /* 133800 80135580 246F003A */     addiu $t7, $v1, 0x3a
  /* 133804 80135584 00001825 */        or $v1, $zero, $zero
  /* 133808 80135588 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13380C 8013558C 46062000 */     add.s $f0, $f4, $f6
  /* 133810 80135590 4600503E */    c.le.s $f10, $f0
  /* 133814 80135594 00000000 */       nop
  /* 133818 80135598 4500000A */      bc1f .L801355C4
  /* 13381C 8013559C 00000000 */       nop
  /* 133820 801355A0 448F8000 */      mtc1 $t7, $f16
  /* 133824 801355A4 00000000 */       nop
  /* 133828 801355A8 468084A0 */   cvt.s.w $f18, $f16
  /* 13382C 801355AC 4612003E */    c.le.s $f0, $f18
  /* 133830 801355B0 00000000 */       nop
  /* 133834 801355B4 45000003 */      bc1f .L801355C4
  /* 133838 801355B8 00000000 */       nop
  /* 13383C 801355BC 10000001 */         b .L801355C4
  /* 133840 801355C0 24030001 */     addiu $v1, $zero, 1
  .L801355C4:
  /* 133844 801355C4 50600019 */      beql $v1, $zero, .L8013562C
  /* 133848 801355C8 00001025 */        or $v0, $zero, $zero
  /* 13384C 801355CC C444005C */      lwc1 $f4, 0x5c($v0)
  /* 133850 801355D0 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 133854 801355D4 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 133858 801355D8 44814000 */      mtc1 $at, $f8 # 131.0 to cop1
  /* 13385C 801355DC 46062000 */     add.s $f0, $f4, $f6
  /* 133860 801355E0 3C01430D */       lui $at, (0x430D0000 >> 16) # 141.0
  /* 133864 801355E4 00001825 */        or $v1, $zero, $zero
  /* 133868 801355E8 4600403E */    c.le.s $f8, $f0
  /* 13386C 801355EC 00000000 */       nop
  /* 133870 801355F0 45000009 */      bc1f .L80135618
  /* 133874 801355F4 00000000 */       nop
  /* 133878 801355F8 44815000 */      mtc1 $at, $f10 # 141.0 to cop1
  /* 13387C 801355FC 00000000 */       nop
  /* 133880 80135600 460A003E */    c.le.s $f0, $f10
  /* 133884 80135604 00000000 */       nop
  /* 133888 80135608 45000003 */      bc1f .L80135618
  /* 13388C 8013560C 00000000 */       nop
  /* 133890 80135610 10000001 */         b .L80135618
  /* 133894 80135614 24030001 */     addiu $v1, $zero, 1
  .L80135618:
  /* 133898 80135618 50600004 */      beql $v1, $zero, .L8013562C
  /* 13389C 8013561C 00001025 */        or $v0, $zero, $zero
  /* 1338A0 80135620 03E00008 */        jr $ra
  /* 1338A4 80135624 24020001 */     addiu $v0, $zero, 1

  /* 1338A8 80135628 00001025 */        or $v0, $zero, $zero
  .L8013562C:
  /* 1338AC 8013562C 03E00008 */        jr $ra
  /* 1338B0 80135630 00000000 */       nop

glabel func_ovl26_80135634
  /* 1338B4 80135634 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 1338B8 80135638 3C0F8014 */       lui $t7, %hi(dMNBattleTeamPaletteIndexes)
  /* 1338BC 8013563C AFBF002C */        sw $ra, 0x2c($sp)
  /* 1338C0 80135640 AFB40028 */        sw $s4, 0x28($sp)
  /* 1338C4 80135644 AFB30024 */        sw $s3, 0x24($sp)
  /* 1338C8 80135648 AFB20020 */        sw $s2, 0x20($sp)
  /* 1338CC 8013564C AFB1001C */        sw $s1, 0x1c($sp)
  /* 1338D0 80135650 AFB00018 */        sw $s0, 0x18($sp)
  /* 1338D4 80135654 AFA5005C */        sw $a1, 0x5c($sp)
  /* 1338D8 80135658 25EFB7D8 */     addiu $t7, $t7, %lo(dMNBattleTeamPaletteIndexes)
  /* 1338DC 8013565C 8DF90000 */        lw $t9, ($t7) # dMNBattleTeamPaletteIndexes + 0
  /* 1338E0 80135660 27AE0048 */     addiu $t6, $sp, 0x48
  /* 1338E4 80135664 8DF80004 */        lw $t8, 4($t7) # dMNBattleTeamPaletteIndexes + 4
  /* 1338E8 80135668 ADD90000 */        sw $t9, ($t6)
  /* 1338EC 8013566C 8DF90008 */        lw $t9, 8($t7) # dMNBattleTeamPaletteIndexes + 8
  /* 1338F0 80135670 3C098014 */       lui $t1, %hi(D_ovl26_8013B7E4)
  /* 1338F4 80135674 2529B7E4 */     addiu $t1, $t1, %lo(D_ovl26_8013B7E4)
  /* 1338F8 80135678 ADD80004 */        sw $t8, 4($t6)
  /* 1338FC 8013567C ADD90008 */        sw $t9, 8($t6)
  /* 133900 80135680 8D2B0000 */        lw $t3, ($t1) # D_ovl26_8013B7E4 + 0
  /* 133904 80135684 27A8003C */     addiu $t0, $sp, 0x3c
  /* 133908 80135688 8D2A0004 */        lw $t2, 4($t1) # D_ovl26_8013B7E4 + 4
  /* 13390C 8013568C AD0B0000 */        sw $t3, ($t0)
  /* 133910 80135690 8D2B0008 */        lw $t3, 8($t1) # D_ovl26_8013B7E4 + 8
  /* 133914 80135694 3C0C8014 */       lui $t4, %hi(gMNBattleIsTeamBattle)
  /* 133918 80135698 AD0A0004 */        sw $t2, 4($t0)
  /* 13391C 8013569C AD0B0008 */        sw $t3, 8($t0)
  /* 133920 801356A0 8D8CBDA8 */        lw $t4, %lo(gMNBattleIsTeamBattle)($t4)
  /* 133924 801356A4 24010001 */     addiu $at, $zero, 1
  /* 133928 801356A8 0080A025 */        or $s4, $a0, $zero
  /* 13392C 801356AC 11810003 */       beq $t4, $at, .L801356BC
  /* 133930 801356B0 00008025 */        or $s0, $zero, $zero
  /* 133934 801356B4 10000033 */         b .L80135784
  /* 133938 801356B8 00001025 */        or $v0, $zero, $zero
  .L801356BC:
  /* 13393C 801356BC 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 133940 801356C0 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 133944 801356C4 24130004 */     addiu $s3, $zero, 4
  /* 133948 801356C8 24120002 */     addiu $s2, $zero, 2
  .L801356CC:
  /* 13394C 801356CC 8E2D0084 */        lw $t5, 0x84($s1) # gMNBattlePanels + 132
  /* 133950 801356D0 02802025 */        or $a0, $s4, $zero
  /* 133954 801356D4 524D0028 */      beql $s2, $t5, .L80135778
  /* 133958 801356D8 26100001 */     addiu $s0, $s0, 1
  /* 13395C 801356DC 0C04D555 */       jal func_ovl26_80135554
  /* 133960 801356E0 02002825 */        or $a1, $s0, $zero
  /* 133964 801356E4 50400024 */      beql $v0, $zero, .L80135778
  /* 133968 801356E8 26100001 */     addiu $s0, $s0, 1
  /* 13396C 801356EC 8E220040 */        lw $v0, 0x40($s1) # gMNBattlePanels + 64
  /* 133970 801356F0 16420003 */       bne $s2, $v0, .L80135700
  /* 133974 801356F4 244E0001 */     addiu $t6, $v0, 1
  /* 133978 801356F8 10000002 */         b .L80135704
  /* 13397C 801356FC AE200040 */        sw $zero, 0x40($s1) # gMNBattlePanels + 64
  .L80135700:
  /* 133980 80135700 AE2E0040 */        sw $t6, 0x40($s1) # gMNBattlePanels + 64
  .L80135704:
  /* 133984 80135704 8E2F0040 */        lw $t7, 0x40($s1) # gMNBattlePanels + 64
  /* 133988 80135708 8E240018 */        lw $a0, 0x18($s1) # gMNBattlePanels + 24
  /* 13398C 8013570C 8E260084 */        lw $a2, 0x84($s1) # gMNBattlePanels + 132
  /* 133990 80135710 000FC080 */       sll $t8, $t7, 2
  /* 133994 80135714 03B82821 */      addu $a1, $sp, $t8
  /* 133998 80135718 0C04CCAB */       jal func_ovl26_801332AC
  /* 13399C 8013571C 8CA50048 */        lw $a1, 0x48($a1)
  /* 1339A0 80135720 8E240040 */        lw $a0, 0x40($s1) # gMNBattlePanels + 64
  /* 1339A4 80135724 0C04CA1E */       jal func_ovl26_80132878
  /* 1339A8 80135728 02002825 */        or $a1, $s0, $zero
  /* 1339AC 8013572C 8E240048 */        lw $a0, 0x48($s1) # gMNBattlePanels + 72
  /* 1339B0 80135730 2401001C */     addiu $at, $zero, 0x1c
  /* 1339B4 80135734 1081000B */       beq $a0, $at, .L80135764
  /* 1339B8 80135738 00000000 */       nop
  /* 1339BC 8013573C 0C03B041 */       jal ftCostume_GetIndexTeam
  /* 1339C0 80135740 8E250040 */        lw $a1, 0x40($s1) # gMNBattlePanels + 64
  /* 1339C4 80135744 AE22004C */        sw $v0, 0x4c($s1) # gMNBattlePanels + 76
  /* 1339C8 80135748 0C04C6DE */       jal mnBattleGetShade
  /* 1339CC 8013574C 02002025 */        or $a0, $s0, $zero
  /* 1339D0 80135750 AE220050 */        sw $v0, 0x50($s1) # gMNBattlePanels + 80
  /* 1339D4 80135754 8E240008 */        lw $a0, 8($s1) # gMNBattlePanels + 8
  /* 1339D8 80135758 8E25004C */        lw $a1, 0x4c($s1) # gMNBattlePanels + 76
  /* 1339DC 8013575C 0C03A492 */       jal func_ovl2_800E9248
  /* 1339E0 80135760 00403025 */        or $a2, $v0, $zero
  .L80135764:
  /* 1339E4 80135764 0C009A70 */       jal func_800269C0
  /* 1339E8 80135768 2404009D */     addiu $a0, $zero, 0x9d
  /* 1339EC 8013576C 10000005 */         b .L80135784
  /* 1339F0 80135770 24020001 */     addiu $v0, $zero, 1
  /* 1339F4 80135774 26100001 */     addiu $s0, $s0, 1
  .L80135778:
  /* 1339F8 80135778 1613FFD4 */       bne $s0, $s3, .L801356CC
  /* 1339FC 8013577C 263100BC */     addiu $s1, $s1, 0xbc
  /* 133A00 80135780 00001025 */        or $v0, $zero, $zero
  .L80135784:
  /* 133A04 80135784 8FBF002C */        lw $ra, 0x2c($sp)
  /* 133A08 80135788 8FB00018 */        lw $s0, 0x18($sp)
  /* 133A0C 8013578C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 133A10 80135790 8FB20020 */        lw $s2, 0x20($sp)
  /* 133A14 80135794 8FB30024 */        lw $s3, 0x24($sp)
  /* 133A18 80135798 8FB40028 */        lw $s4, 0x28($sp)
  /* 133A1C 8013579C 03E00008 */        jr $ra
  /* 133A20 801357A0 27BD0058 */     addiu $sp, $sp, 0x58

glabel func_ovl26_801357A4
  /* 133A24 801357A4 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 133A28 801357A8 AFB00018 */        sw $s0, 0x18($sp)
  /* 133A2C 801357AC AFB60030 */        sw $s6, 0x30($sp)
  /* 133A30 801357B0 AFB5002C */        sw $s5, 0x2c($sp)
  /* 133A34 801357B4 AFB40028 */        sw $s4, 0x28($sp)
  /* 133A38 801357B8 AFB30024 */        sw $s3, 0x24($sp)
  /* 133A3C 801357BC AFB1001C */        sw $s1, 0x1c($sp)
  /* 133A40 801357C0 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 133A44 801357C4 00809825 */        or $s3, $a0, $zero
  /* 133A48 801357C8 00A0A025 */        or $s4, $a1, $zero
  /* 133A4C 801357CC AFBF0034 */        sw $ra, 0x34($sp)
  /* 133A50 801357D0 AFB20020 */        sw $s2, 0x20($sp)
  /* 133A54 801357D4 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 133A58 801357D8 00008825 */        or $s1, $zero, $zero
  /* 133A5C 801357DC 24150001 */     addiu $s5, $zero, 1
  /* 133A60 801357E0 24160004 */     addiu $s6, $zero, 4
  .L801357E4:
  /* 133A64 801357E4 8E020084 */        lw $v0, 0x84($s0) # gMNBattlePanels + 132
  /* 133A68 801357E8 26120038 */     addiu $s2, $s0, 0x38
  /* 133A6C 801357EC 14400003 */      bnez $v0, .L801357FC
  /* 133A70 801357F0 00000000 */       nop
  /* 133A74 801357F4 10000001 */         b .L801357FC
  /* 133A78 801357F8 2612003C */     addiu $s2, $s0, 0x3c
  .L801357FC:
  /* 133A7C 801357FC 52A2000B */      beql $s5, $v0, .L8013582C
  /* 133A80 80135800 8E0F0088 */        lw $t7, 0x88($s0) # gMNBattlePanels + 136
  /* 133A84 80135804 0C04DC3E */       jal func_ovl26_801370F8
  /* 133A88 80135808 00000000 */       nop
  /* 133A8C 8013580C 5040002D */      beql $v0, $zero, .L801358C4
  /* 133A90 80135810 26310001 */     addiu $s1, $s1, 1
  /* 133A94 80135814 8E0E0084 */        lw $t6, 0x84($s0) # gMNBattlePanels + 132
  /* 133A98 80135818 55C0002A */      bnel $t6, $zero, .L801358C4
  /* 133A9C 8013581C 26310001 */     addiu $s1, $s1, 1
  /* 133AA0 80135820 56340028 */      bnel $s1, $s4, .L801358C4
  /* 133AA4 80135824 26310001 */     addiu $s1, $s1, 1
  /* 133AA8 80135828 8E0F0088 */        lw $t7, 0x88($s0) # gMNBattlePanels + 136
  .L8013582C:
  /* 133AAC 8013582C 02602025 */        or $a0, $s3, $zero
  /* 133AB0 80135830 51E00024 */      beql $t7, $zero, .L801358C4
  /* 133AB4 80135834 26310001 */     addiu $s1, $s1, 1
  /* 133AB8 80135838 0C04D63E */       jal func_ovl26_801358F8
  /* 133ABC 8013583C 02202825 */        or $a1, $s1, $zero
  /* 133AC0 80135840 1040000E */      beqz $v0, .L8013587C
  /* 133AC4 80135844 02602025 */        or $a0, $s3, $zero
  /* 133AC8 80135848 8E580000 */        lw $t8, ($s2)
  /* 133ACC 8013584C 2B010009 */      slti $at, $t8, 9
  /* 133AD0 80135850 10200008 */      beqz $at, .L80135874
  /* 133AD4 80135854 00000000 */       nop
  /* 133AD8 80135858 0C009A70 */       jal func_800269C0
  /* 133ADC 8013585C 240400A4 */     addiu $a0, $zero, 0xa4
  /* 133AE0 80135860 8E590000 */        lw $t9, ($s2)
  /* 133AE4 80135864 02202025 */        or $a0, $s1, $zero
  /* 133AE8 80135868 27280001 */     addiu $t0, $t9, 1
  /* 133AEC 8013586C 0C04DBA4 */       jal func_ovl26_80136E90
  /* 133AF0 80135870 AE480000 */        sw $t0, ($s2)
  .L80135874:
  /* 133AF4 80135874 10000016 */         b .L801358D0
  /* 133AF8 80135878 24020001 */     addiu $v0, $zero, 1
  .L8013587C:
  /* 133AFC 8013587C 0C04D676 */       jal func_ovl26_801359D8
  /* 133B00 80135880 02202825 */        or $a1, $s1, $zero
  /* 133B04 80135884 5040000F */      beql $v0, $zero, .L801358C4
  /* 133B08 80135888 26310001 */     addiu $s1, $s1, 1
  /* 133B0C 8013588C 8E490000 */        lw $t1, ($s2)
  /* 133B10 80135890 29210002 */      slti $at, $t1, 2
  /* 133B14 80135894 14200008 */      bnez $at, .L801358B8
  /* 133B18 80135898 00000000 */       nop
  /* 133B1C 8013589C 0C009A70 */       jal func_800269C0
  /* 133B20 801358A0 240400A4 */     addiu $a0, $zero, 0xa4
  /* 133B24 801358A4 8E4A0000 */        lw $t2, ($s2)
  /* 133B28 801358A8 02202025 */        or $a0, $s1, $zero
  /* 133B2C 801358AC 254BFFFF */     addiu $t3, $t2, -1
  /* 133B30 801358B0 0C04DBA4 */       jal func_ovl26_80136E90
  /* 133B34 801358B4 AE4B0000 */        sw $t3, ($s2)
  .L801358B8:
  /* 133B38 801358B8 10000005 */         b .L801358D0
  /* 133B3C 801358BC 24020001 */     addiu $v0, $zero, 1
  /* 133B40 801358C0 26310001 */     addiu $s1, $s1, 1
  .L801358C4:
  /* 133B44 801358C4 1636FFC7 */       bne $s1, $s6, .L801357E4
  /* 133B48 801358C8 261000BC */     addiu $s0, $s0, 0xbc
  /* 133B4C 801358CC 00001025 */        or $v0, $zero, $zero
  .L801358D0:
  /* 133B50 801358D0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 133B54 801358D4 8FB00018 */        lw $s0, 0x18($sp)
  /* 133B58 801358D8 8FB1001C */        lw $s1, 0x1c($sp)
  /* 133B5C 801358DC 8FB20020 */        lw $s2, 0x20($sp)
  /* 133B60 801358E0 8FB30024 */        lw $s3, 0x24($sp)
  /* 133B64 801358E4 8FB40028 */        lw $s4, 0x28($sp)
  /* 133B68 801358E8 8FB5002C */        lw $s5, 0x2c($sp)
  /* 133B6C 801358EC 8FB60030 */        lw $s6, 0x30($sp)
  /* 133B70 801358F0 03E00008 */        jr $ra
  /* 133B74 801358F4 27BD0038 */     addiu $sp, $sp, 0x38

glabel func_ovl26_801358F8
  /* 133B78 801358F8 00051900 */       sll $v1, $a1, 4
  /* 133B7C 801358FC 00651821 */      addu $v1, $v1, $a1
  /* 133B80 80135900 00031880 */       sll $v1, $v1, 2
  /* 133B84 80135904 00651821 */      addu $v1, $v1, $a1
  /* 133B88 80135908 8C820074 */        lw $v0, 0x74($a0)
  /* 133B8C 8013590C 246E0044 */     addiu $t6, $v1, 0x44
  /* 133B90 80135910 448E4000 */      mtc1 $t6, $f8
  /* 133B94 80135914 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 133B98 80135918 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 133B9C 8013591C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 133BA0 80135920 468042A0 */   cvt.s.w $f10, $f8
  /* 133BA4 80135924 246F005A */     addiu $t7, $v1, 0x5a
  /* 133BA8 80135928 00001825 */        or $v1, $zero, $zero
  /* 133BAC 8013592C 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 133BB0 80135930 46062000 */     add.s $f0, $f4, $f6
  /* 133BB4 80135934 4600503E */    c.le.s $f10, $f0
  /* 133BB8 80135938 00000000 */       nop
  /* 133BBC 8013593C 4500000A */      bc1f .L80135968
  /* 133BC0 80135940 00000000 */       nop
  /* 133BC4 80135944 448F8000 */      mtc1 $t7, $f16
  /* 133BC8 80135948 00000000 */       nop
  /* 133BCC 8013594C 468084A0 */   cvt.s.w $f18, $f16
  /* 133BD0 80135950 4612003E */    c.le.s $f0, $f18
  /* 133BD4 80135954 00000000 */       nop
  /* 133BD8 80135958 45000003 */      bc1f .L80135968
  /* 133BDC 8013595C 00000000 */       nop
  /* 133BE0 80135960 10000001 */         b .L80135968
  /* 133BE4 80135964 24030001 */     addiu $v1, $zero, 1
  .L80135968:
  /* 133BE8 80135968 50600019 */      beql $v1, $zero, .L801359D0
  /* 133BEC 8013596C 00001025 */        or $v0, $zero, $zero
  /* 133BF0 80135970 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 133BF4 80135974 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 133BF8 80135978 3C014345 */       lui $at, (0x43450000 >> 16) # 197.0
  /* 133BFC 8013597C 44814000 */      mtc1 $at, $f8 # 197.0 to cop1
  /* 133C00 80135980 46062000 */     add.s $f0, $f4, $f6
  /* 133C04 80135984 3C014358 */       lui $at, (0x43580000 >> 16) # 216.0
  /* 133C08 80135988 00001825 */        or $v1, $zero, $zero
  /* 133C0C 8013598C 4600403E */    c.le.s $f8, $f0
  /* 133C10 80135990 00000000 */       nop
  /* 133C14 80135994 45000009 */      bc1f .L801359BC
  /* 133C18 80135998 00000000 */       nop
  /* 133C1C 8013599C 44815000 */      mtc1 $at, $f10 # 216.0 to cop1
  /* 133C20 801359A0 00000000 */       nop
  /* 133C24 801359A4 460A003E */    c.le.s $f0, $f10
  /* 133C28 801359A8 00000000 */       nop
  /* 133C2C 801359AC 45000003 */      bc1f .L801359BC
  /* 133C30 801359B0 00000000 */       nop
  /* 133C34 801359B4 10000001 */         b .L801359BC
  /* 133C38 801359B8 24030001 */     addiu $v1, $zero, 1
  .L801359BC:
  /* 133C3C 801359BC 50600004 */      beql $v1, $zero, .L801359D0
  /* 133C40 801359C0 00001025 */        or $v0, $zero, $zero
  /* 133C44 801359C4 03E00008 */        jr $ra
  /* 133C48 801359C8 24020001 */     addiu $v0, $zero, 1

  /* 133C4C 801359CC 00001025 */        or $v0, $zero, $zero
  .L801359D0:
  /* 133C50 801359D0 03E00008 */        jr $ra
  /* 133C54 801359D4 00000000 */       nop

glabel func_ovl26_801359D8
  /* 133C58 801359D8 00051900 */       sll $v1, $a1, 4
  /* 133C5C 801359DC 00651821 */      addu $v1, $v1, $a1
  /* 133C60 801359E0 00031880 */       sll $v1, $v1, 2
  /* 133C64 801359E4 00651821 */      addu $v1, $v1, $a1
  /* 133C68 801359E8 8C820074 */        lw $v0, 0x74($a0)
  /* 133C6C 801359EC 246E0015 */     addiu $t6, $v1, 0x15
  /* 133C70 801359F0 448E4000 */      mtc1 $t6, $f8
  /* 133C74 801359F4 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 133C78 801359F8 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 133C7C 801359FC C4440058 */      lwc1 $f4, 0x58($v0)
  /* 133C80 80135A00 468042A0 */   cvt.s.w $f10, $f8
  /* 133C84 80135A04 246F002B */     addiu $t7, $v1, 0x2b
  /* 133C88 80135A08 00001825 */        or $v1, $zero, $zero
  /* 133C8C 80135A0C 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 133C90 80135A10 46062000 */     add.s $f0, $f4, $f6
  /* 133C94 80135A14 4600503E */    c.le.s $f10, $f0
  /* 133C98 80135A18 00000000 */       nop
  /* 133C9C 80135A1C 4500000A */      bc1f .L80135A48
  /* 133CA0 80135A20 00000000 */       nop
  /* 133CA4 80135A24 448F8000 */      mtc1 $t7, $f16
  /* 133CA8 80135A28 00000000 */       nop
  /* 133CAC 80135A2C 468084A0 */   cvt.s.w $f18, $f16
  /* 133CB0 80135A30 4612003E */    c.le.s $f0, $f18
  /* 133CB4 80135A34 00000000 */       nop
  /* 133CB8 80135A38 45000003 */      bc1f .L80135A48
  /* 133CBC 80135A3C 00000000 */       nop
  /* 133CC0 80135A40 10000001 */         b .L80135A48
  /* 133CC4 80135A44 24030001 */     addiu $v1, $zero, 1
  .L80135A48:
  /* 133CC8 80135A48 50600019 */      beql $v1, $zero, .L80135AB0
  /* 133CCC 80135A4C 00001025 */        or $v0, $zero, $zero
  /* 133CD0 80135A50 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 133CD4 80135A54 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 133CD8 80135A58 3C014345 */       lui $at, (0x43450000 >> 16) # 197.0
  /* 133CDC 80135A5C 44814000 */      mtc1 $at, $f8 # 197.0 to cop1
  /* 133CE0 80135A60 46062000 */     add.s $f0, $f4, $f6
  /* 133CE4 80135A64 3C014358 */       lui $at, (0x43580000 >> 16) # 216.0
  /* 133CE8 80135A68 00001825 */        or $v1, $zero, $zero
  /* 133CEC 80135A6C 4600403E */    c.le.s $f8, $f0
  /* 133CF0 80135A70 00000000 */       nop
  /* 133CF4 80135A74 45000009 */      bc1f .L80135A9C
  /* 133CF8 80135A78 00000000 */       nop
  /* 133CFC 80135A7C 44815000 */      mtc1 $at, $f10 # 216.0 to cop1
  /* 133D00 80135A80 00000000 */       nop
  /* 133D04 80135A84 460A003E */    c.le.s $f0, $f10
  /* 133D08 80135A88 00000000 */       nop
  /* 133D0C 80135A8C 45000003 */      bc1f .L80135A9C
  /* 133D10 80135A90 00000000 */       nop
  /* 133D14 80135A94 10000001 */         b .L80135A9C
  /* 133D18 80135A98 24030001 */     addiu $v1, $zero, 1
  .L80135A9C:
  /* 133D1C 80135A9C 50600004 */      beql $v1, $zero, .L80135AB0
  /* 133D20 80135AA0 00001025 */        or $v0, $zero, $zero
  /* 133D24 80135AA4 03E00008 */        jr $ra
  /* 133D28 80135AA8 24020001 */     addiu $v0, $zero, 1

  /* 133D2C 80135AAC 00001025 */        or $v0, $zero, $zero
  .L80135AB0:
  /* 133D30 80135AB0 03E00008 */        jr $ra
  /* 133D34 80135AB4 00000000 */       nop

glabel func_ovl26_80135AB8
  /* 133D38 80135AB8 00051900 */       sll $v1, $a1, 4
  /* 133D3C 80135ABC 00651821 */      addu $v1, $v1, $a1
  /* 133D40 80135AC0 00031880 */       sll $v1, $v1, 2
  /* 133D44 80135AC4 00651821 */      addu $v1, $v1, $a1
  /* 133D48 80135AC8 8C820074 */        lw $v0, 0x74($a0)
  /* 133D4C 80135ACC 246E003C */     addiu $t6, $v1, 0x3c
  /* 133D50 80135AD0 448E4000 */      mtc1 $t6, $f8
  /* 133D54 80135AD4 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 133D58 80135AD8 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 133D5C 80135ADC C4440058 */      lwc1 $f4, 0x58($v0)
  /* 133D60 80135AE0 468042A0 */   cvt.s.w $f10, $f8
  /* 133D64 80135AE4 246F0058 */     addiu $t7, $v1, 0x58
  /* 133D68 80135AE8 00001825 */        or $v1, $zero, $zero
  /* 133D6C 80135AEC 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 133D70 80135AF0 46062000 */     add.s $f0, $f4, $f6
  /* 133D74 80135AF4 4600503E */    c.le.s $f10, $f0
  /* 133D78 80135AF8 00000000 */       nop
  /* 133D7C 80135AFC 4500000A */      bc1f .L80135B28
  /* 133D80 80135B00 00000000 */       nop
  /* 133D84 80135B04 448F8000 */      mtc1 $t7, $f16
  /* 133D88 80135B08 00000000 */       nop
  /* 133D8C 80135B0C 468084A0 */   cvt.s.w $f18, $f16
  /* 133D90 80135B10 4612003E */    c.le.s $f0, $f18
  /* 133D94 80135B14 00000000 */       nop
  /* 133D98 80135B18 45000003 */      bc1f .L80135B28
  /* 133D9C 80135B1C 00000000 */       nop
  /* 133DA0 80135B20 10000001 */         b .L80135B28
  /* 133DA4 80135B24 24030001 */     addiu $v1, $zero, 1
  .L80135B28:
  /* 133DA8 80135B28 50600019 */      beql $v1, $zero, .L80135B90
  /* 133DAC 80135B2C 00001025 */        or $v0, $zero, $zero
  /* 133DB0 80135B30 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 133DB4 80135B34 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 133DB8 80135B38 3C0142FE */       lui $at, (0x42FE0000 >> 16) # 127.0
  /* 133DBC 80135B3C 44814000 */      mtc1 $at, $f8 # 127.0 to cop1
  /* 133DC0 80135B40 46062000 */     add.s $f0, $f4, $f6
  /* 133DC4 80135B44 3C014311 */       lui $at, (0x43110000 >> 16) # 145.0
  /* 133DC8 80135B48 00001825 */        or $v1, $zero, $zero
  /* 133DCC 80135B4C 4600403E */    c.le.s $f8, $f0
  /* 133DD0 80135B50 00000000 */       nop
  /* 133DD4 80135B54 45000009 */      bc1f .L80135B7C
  /* 133DD8 80135B58 00000000 */       nop
  /* 133DDC 80135B5C 44815000 */      mtc1 $at, $f10 # 145.0 to cop1
  /* 133DE0 80135B60 00000000 */       nop
  /* 133DE4 80135B64 460A003E */    c.le.s $f0, $f10
  /* 133DE8 80135B68 00000000 */       nop
  /* 133DEC 80135B6C 45000003 */      bc1f .L80135B7C
  /* 133DF0 80135B70 00000000 */       nop
  /* 133DF4 80135B74 10000001 */         b .L80135B7C
  /* 133DF8 80135B78 24030001 */     addiu $v1, $zero, 1
  .L80135B7C:
  /* 133DFC 80135B7C 50600004 */      beql $v1, $zero, .L80135B90
  /* 133E00 80135B80 00001025 */        or $v0, $zero, $zero
  /* 133E04 80135B84 03E00008 */        jr $ra
  /* 133E08 80135B88 24020001 */     addiu $v0, $zero, 1

  /* 133E0C 80135B8C 00001025 */        or $v0, $zero, $zero
  .L80135B90:
  /* 133E10 80135B90 03E00008 */        jr $ra
  /* 133E14 80135B94 00000000 */       nop

glabel mnBattleCheckTokenPickup
  /* 133E18 80135B98 00067080 */       sll $t6, $a2, 2
  /* 133E1C 80135B9C 01C67023 */      subu $t6, $t6, $a2
  /* 133E20 80135BA0 000E7100 */       sll $t6, $t6, 4
  /* 133E24 80135BA4 01C67023 */      subu $t6, $t6, $a2
  /* 133E28 80135BA8 AFA50004 */        sw $a1, 4($sp)
  /* 133E2C 80135BAC 000E7080 */       sll $t6, $t6, 2
  /* 133E30 80135BB0 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BA8C)
  /* 133E34 80135BB4 8C820074 */        lw $v0, 0x74($a0)
  /* 133E38 80135BB8 01EE7821 */      addu $t7, $t7, $t6
  /* 133E3C 80135BBC 8DEFBA8C */        lw $t7, %lo(D_ovl26_8013BA8C)($t7)
  /* 133E40 80135BC0 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 133E44 80135BC4 44813000 */      mtc1 $at, $f6 # 25.0 to cop1
  /* 133E48 80135BC8 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 133E4C 80135BCC 8DE30074 */        lw $v1, 0x74($t7)
  /* 133E50 80135BD0 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 133E54 80135BD4 46062000 */     add.s $f0, $f4, $f6
  /* 133E58 80135BD8 C4620058 */      lwc1 $f2, 0x58($v1)
  /* 133E5C 80135BDC 00002025 */        or $a0, $zero, $zero
  /* 133E60 80135BE0 4600103E */    c.le.s $f2, $f0
  /* 133E64 80135BE4 00000000 */       nop
  /* 133E68 80135BE8 4500000A */      bc1f .L80135C14
  /* 133E6C 80135BEC 00000000 */       nop
  /* 133E70 80135BF0 44814000 */      mtc1 $at, $f8 # 26.0 to cop1
  /* 133E74 80135BF4 00000000 */       nop
  /* 133E78 80135BF8 46081280 */     add.s $f10, $f2, $f8
  /* 133E7C 80135BFC 460A003E */    c.le.s $f0, $f10
  /* 133E80 80135C00 00000000 */       nop
  /* 133E84 80135C04 45000003 */      bc1f .L80135C14
  /* 133E88 80135C08 00000000 */       nop
  /* 133E8C 80135C0C 10000001 */         b .L80135C14
  /* 133E90 80135C10 24040001 */     addiu $a0, $zero, 1
  .L80135C14:
  /* 133E94 80135C14 10800018 */      beqz $a0, .L80135C78
  /* 133E98 80135C18 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 133E9C 80135C1C C450005C */      lwc1 $f16, 0x5c($v0)
  /* 133EA0 80135C20 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 133EA4 80135C24 C462005C */      lwc1 $f2, 0x5c($v1)
  /* 133EA8 80135C28 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 133EAC 80135C2C 46128000 */     add.s $f0, $f16, $f18
  /* 133EB0 80135C30 00002025 */        or $a0, $zero, $zero
  /* 133EB4 80135C34 4600103E */    c.le.s $f2, $f0
  /* 133EB8 80135C38 00000000 */       nop
  /* 133EBC 80135C3C 4500000A */      bc1f .L80135C68
  /* 133EC0 80135C40 00000000 */       nop
  /* 133EC4 80135C44 44812000 */      mtc1 $at, $f4 # 24.0 to cop1
  /* 133EC8 80135C48 00000000 */       nop
  /* 133ECC 80135C4C 46041180 */     add.s $f6, $f2, $f4
  /* 133ED0 80135C50 4606003E */    c.le.s $f0, $f6
  /* 133ED4 80135C54 00000000 */       nop
  /* 133ED8 80135C58 45000003 */      bc1f .L80135C68
  /* 133EDC 80135C5C 00000000 */       nop
  /* 133EE0 80135C60 10000001 */         b .L80135C68
  /* 133EE4 80135C64 24040001 */     addiu $a0, $zero, 1
  .L80135C68:
  /* 133EE8 80135C68 50800004 */      beql $a0, $zero, .L80135C7C
  /* 133EEC 80135C6C 00001025 */        or $v0, $zero, $zero
  /* 133EF0 80135C70 03E00008 */        jr $ra
  /* 133EF4 80135C74 24020001 */     addiu $v0, $zero, 1

  .L80135C78:
  /* 133EF8 80135C78 00001025 */        or $v0, $zero, $zero
  .L80135C7C:
  /* 133EFC 80135C7C 03E00008 */        jr $ra
  /* 133F00 80135C80 00000000 */       nop

glabel func_ovl26_80135C84
  /* 133F04 80135C84 240300BC */     addiu $v1, $zero, 0xbc
  /* 133F08 80135C88 00830019 */     multu $a0, $v1
  /* 133F0C 80135C8C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 133F10 80135C90 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 133F14 80135C94 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 133F18 80135C98 AFB00018 */        sw $s0, 0x18($sp)
  /* 133F1C 80135C9C AFBF001C */        sw $ra, 0x1c($sp)
  /* 133F20 80135CA0 AFA40020 */        sw $a0, 0x20($sp)
  /* 133F24 80135CA4 24070001 */     addiu $a3, $zero, 1
  /* 133F28 80135CA8 00007812 */      mflo $t7
  /* 133F2C 80135CAC 004F8021 */      addu $s0, $v0, $t7
  /* 133F30 80135CB0 8E050084 */        lw $a1, 0x84($s0)
  /* 133F34 80135CB4 50A00008 */      beql $a1, $zero, .L80135CD8
  /* 133F38 80135CB8 8E060080 */        lw $a2, 0x80($s0)
  /* 133F3C 80135CBC 10A70048 */       beq $a1, $a3, .L80135DE0
  /* 133F40 80135CC0 24060002 */     addiu $a2, $zero, 2
  /* 133F44 80135CC4 50A6008F */      beql $a1, $a2, .L80135F04
  /* 133F48 80135CC8 8E05007C */        lw $a1, 0x7c($s0)
  /* 133F4C 80135CCC 100000D6 */         b .L80136028
  /* 133F50 80135CD0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 133F54 80135CD4 8E060080 */        lw $a2, 0x80($s0)
  .L80135CD8:
  /* 133F58 80135CD8 2401FFFF */     addiu $at, $zero, -1
  /* 133F5C 80135CDC 50C10019 */      beql $a2, $at, .L80135D44
  /* 133F60 80135CE0 8FAA0020 */        lw $t2, 0x20($sp)
  /* 133F64 80135CE4 00C30019 */     multu $a2, $v1
  /* 133F68 80135CE8 24180004 */     addiu $t8, $zero, 4
  /* 133F6C 80135CEC 24070001 */     addiu $a3, $zero, 1
  /* 133F70 80135CF0 0000C812 */      mflo $t9
  /* 133F74 80135CF4 00595021 */      addu $t2, $v0, $t9
  /* 133F78 80135CF8 AD58007C */        sw $t8, 0x7c($t2)
  /* 133F7C 80135CFC 8E0B0080 */        lw $t3, 0x80($s0)
  /* 133F80 80135D00 01630019 */     multu $t3, $v1
  /* 133F84 80135D04 00006012 */      mflo $t4
  /* 133F88 80135D08 004C6821 */      addu $t5, $v0, $t4
  /* 133F8C 80135D0C ADA70058 */        sw $a3, 0x58($t5)
  /* 133F90 80135D10 8E0E0080 */        lw $t6, 0x80($s0)
  /* 133F94 80135D14 01C30019 */     multu $t6, $v1
  /* 133F98 80135D18 00007812 */      mflo $t7
  /* 133F9C 80135D1C 004FC821 */      addu $t9, $v0, $t7
  /* 133FA0 80135D20 AF270088 */        sw $a3, 0x88($t9)
  /* 133FA4 80135D24 8E050080 */        lw $a1, 0x80($s0)
  /* 133FA8 80135D28 0C04DCE4 */       jal mnBattleReorderCursorsOnPlacement
  /* 133FAC 80135D2C 8FA40020 */        lw $a0, 0x20($sp)
  /* 133FB0 80135D30 0C04DC01 */       jal func_ovl26_80137004
  /* 133FB4 80135D34 8E040080 */        lw $a0, 0x80($s0)
  /* 133FB8 80135D38 0C04D91F */       jal mnBattleCreateWhiteSquare
  /* 133FBC 80135D3C 8E040080 */        lw $a0, 0x80($s0)
  /* 133FC0 80135D40 8FAA0020 */        lw $t2, 0x20($sp)
  .L80135D44:
  /* 133FC4 80135D44 8FAB0020 */        lw $t3, 0x20($sp)
  /* 133FC8 80135D48 8FA50020 */        lw $a1, 0x20($sp)
  /* 133FCC 80135D4C 2418001C */     addiu $t8, $zero, 0x1c
  /* 133FD0 80135D50 AE000058 */        sw $zero, 0x58($s0)
  /* 133FD4 80135D54 AE180048 */        sw $t8, 0x48($s0)
  /* 133FD8 80135D58 AE000088 */        sw $zero, 0x88($s0)
  /* 133FDC 80135D5C AE0A007C */        sw $t2, 0x7c($s0)
  /* 133FE0 80135D60 AE0B0080 */        sw $t3, 0x80($s0)
  /* 133FE4 80135D64 0C04DC8D */       jal mnBattleReorderCursorsOnPickup
  /* 133FE8 80135D68 00A02025 */        or $a0, $a1, $zero
  /* 133FEC 80135D6C 8E040030 */        lw $a0, 0x30($s0)
  /* 133FF0 80135D70 AE0000A0 */        sw $zero, 0xa0($s0)
  /* 133FF4 80135D74 10800005 */      beqz $a0, .L80135D8C
  /* 133FF8 80135D78 00000000 */       nop
  /* 133FFC 80135D7C 0C0026A1 */       jal omEjectGObj
  /* 134000 80135D80 00000000 */       nop
  /* 134004 80135D84 0C04CD2A */       jal mnBattleCreateTypeImage
  /* 134008 80135D88 8FA40020 */        lw $a0, 0x20($sp)
  .L80135D8C:
  /* 13400C 80135D8C 3C0D8014 */       lui $t5, %hi(gMNBattleIsTeamBattle)
  /* 134010 80135D90 8DADBDA8 */        lw $t5, %lo(gMNBattleIsTeamBattle)($t5)
  /* 134014 80135D94 8FA50020 */        lw $a1, 0x20($sp)
  /* 134018 80135D98 55A00007 */      bnel $t5, $zero, .L80135DB8
  /* 13401C 80135D9C 8E020040 */        lw $v0, 0x40($s0)
  /* 134020 80135DA0 8E040018 */        lw $a0, 0x18($s0)
  /* 134024 80135DA4 0C04CCAB */       jal func_ovl26_801332AC
  /* 134028 80135DA8 8E060084 */        lw $a2, 0x84($s0)
  /* 13402C 80135DAC 1000009E */         b .L80136028
  /* 134030 80135DB0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 134034 80135DB4 8E020040 */        lw $v0, 0x40($s0)
  .L80135DB8:
  /* 134038 80135DB8 24060002 */     addiu $a2, $zero, 2
  /* 13403C 80135DBC 14C20003 */       bne $a2, $v0, .L80135DCC
  /* 134040 80135DC0 00402825 */        or $a1, $v0, $zero
  /* 134044 80135DC4 10000001 */         b .L80135DCC
  /* 134048 80135DC8 24050003 */     addiu $a1, $zero, 3
  .L80135DCC:
  /* 13404C 80135DCC 8E040018 */        lw $a0, 0x18($s0)
  /* 134050 80135DD0 0C04CCAB */       jal func_ovl26_801332AC
  /* 134054 80135DD4 8E060084 */        lw $a2, 0x84($s0)
  /* 134058 80135DD8 10000093 */         b .L80136028
  /* 13405C 80135DDC 8FBF001C */        lw $ra, 0x1c($sp)
  .L80135DE0:
  /* 134060 80135DE0 8E060080 */        lw $a2, 0x80($s0)
  /* 134064 80135DE4 2401FFFF */     addiu $at, $zero, -1
  /* 134068 80135DE8 50C10019 */      beql $a2, $at, .L80135E50
  /* 13406C 80135DEC 240E0004 */     addiu $t6, $zero, 4
  /* 134070 80135DF0 00C30019 */     multu $a2, $v1
  /* 134074 80135DF4 240E0004 */     addiu $t6, $zero, 4
  /* 134078 80135DF8 00007812 */      mflo $t7
  /* 13407C 80135DFC 004FC821 */      addu $t9, $v0, $t7
  /* 134080 80135E00 AF2E007C */        sw $t6, 0x7c($t9)
  /* 134084 80135E04 8E180080 */        lw $t8, 0x80($s0)
  /* 134088 80135E08 03030019 */     multu $t8, $v1
  /* 13408C 80135E0C 00005012 */      mflo $t2
  /* 134090 80135E10 004A5821 */      addu $t3, $v0, $t2
  /* 134094 80135E14 AD670058 */        sw $a3, 0x58($t3)
  /* 134098 80135E18 8E0C0080 */        lw $t4, 0x80($s0)
  /* 13409C 80135E1C 01830019 */     multu $t4, $v1
  /* 1340A0 80135E20 00006812 */      mflo $t5
  /* 1340A4 80135E24 004D7821 */      addu $t7, $v0, $t5
  /* 1340A8 80135E28 ADE70088 */        sw $a3, 0x88($t7)
  /* 1340AC 80135E2C 8E050080 */        lw $a1, 0x80($s0)
  /* 1340B0 80135E30 0C04DCE4 */       jal mnBattleReorderCursorsOnPlacement
  /* 1340B4 80135E34 8FA40020 */        lw $a0, 0x20($sp)
  /* 1340B8 80135E38 0C04DC01 */       jal func_ovl26_80137004
  /* 1340BC 80135E3C 8E040080 */        lw $a0, 0x80($s0)
  /* 1340C0 80135E40 0C04D91F */       jal mnBattleCreateWhiteSquare
  /* 1340C4 80135E44 8E040080 */        lw $a0, 0x80($s0)
  /* 1340C8 80135E48 24070001 */     addiu $a3, $zero, 1
  /* 1340CC 80135E4C 240E0004 */     addiu $t6, $zero, 4
  .L80135E50:
  /* 1340D0 80135E50 2419FFFF */     addiu $t9, $zero, -1
  /* 1340D4 80135E54 AE070058 */        sw $a3, 0x58($s0)
  /* 1340D8 80135E58 AE0E007C */        sw $t6, 0x7c($s0)
  /* 1340DC 80135E5C AE190080 */        sw $t9, 0x80($s0)
  /* 1340E0 80135E60 24040004 */     addiu $a0, $zero, 4
  /* 1340E4 80135E64 0C04DCE4 */       jal mnBattleReorderCursorsOnPlacement
  /* 1340E8 80135E68 8FA50020 */        lw $a1, 0x20($sp)
  /* 1340EC 80135E6C 8E180048 */        lw $t8, 0x48($s0)
  /* 1340F0 80135E70 24070001 */     addiu $a3, $zero, 1
  /* 1340F4 80135E74 2401001C */     addiu $at, $zero, 0x1c
  /* 1340F8 80135E78 17010004 */       bne $t8, $at, .L80135E8C
  /* 1340FC 80135E7C AE070088 */        sw $a3, 0x88($s0)
  /* 134100 80135E80 0C04E212 */       jal func_ovl26_80138848
  /* 134104 80135E84 8E040004 */        lw $a0, 4($s0)
  /* 134108 80135E88 AE020048 */        sw $v0, 0x48($s0)
  .L80135E8C:
  /* 13410C 80135E8C 8E040030 */        lw $a0, 0x30($s0)
  /* 134110 80135E90 AE0000A0 */        sw $zero, 0xa0($s0)
  /* 134114 80135E94 10800005 */      beqz $a0, .L80135EAC
  /* 134118 80135E98 00000000 */       nop
  /* 13411C 80135E9C 0C0026A1 */       jal omEjectGObj
  /* 134120 80135EA0 00000000 */       nop
  /* 134124 80135EA4 0C04CD2A */       jal mnBattleCreateTypeImage
  /* 134128 80135EA8 8FA40020 */        lw $a0, 0x20($sp)
  .L80135EAC:
  /* 13412C 80135EAC 3C0A8014 */       lui $t2, %hi(gMNBattleIsTeamBattle)
  /* 134130 80135EB0 8D4ABDA8 */        lw $t2, %lo(gMNBattleIsTeamBattle)($t2)
  /* 134134 80135EB4 8FA50020 */        lw $a1, 0x20($sp)
  /* 134138 80135EB8 55400007 */      bnel $t2, $zero, .L80135ED8
  /* 13413C 80135EBC 8E020040 */        lw $v0, 0x40($s0)
  /* 134140 80135EC0 8E040018 */        lw $a0, 0x18($s0)
  /* 134144 80135EC4 0C04CCAB */       jal func_ovl26_801332AC
  /* 134148 80135EC8 8E060084 */        lw $a2, 0x84($s0)
  /* 13414C 80135ECC 10000056 */         b .L80136028
  /* 134150 80135ED0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 134154 80135ED4 8E020040 */        lw $v0, 0x40($s0)
  .L80135ED8:
  /* 134158 80135ED8 24060002 */     addiu $a2, $zero, 2
  /* 13415C 80135EDC 14C20003 */       bne $a2, $v0, .L80135EEC
  /* 134160 80135EE0 00402825 */        or $a1, $v0, $zero
  /* 134164 80135EE4 10000001 */         b .L80135EEC
  /* 134168 80135EE8 24050003 */     addiu $a1, $zero, 3
  .L80135EEC:
  /* 13416C 80135EEC 8E040018 */        lw $a0, 0x18($s0)
  /* 134170 80135EF0 0C04CCAB */       jal func_ovl26_801332AC
  /* 134174 80135EF4 8E060084 */        lw $a2, 0x84($s0)
  /* 134178 80135EF8 1000004B */         b .L80136028
  /* 13417C 80135EFC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 134180 80135F00 8E05007C */        lw $a1, 0x7c($s0)
  .L80135F04:
  /* 134184 80135F04 24010004 */     addiu $at, $zero, 4
  /* 134188 80135F08 50A1001E */      beql $a1, $at, .L80135F84
  /* 13418C 80135F0C 8E060080 */        lw $a2, 0x80($s0)
  /* 134190 80135F10 00A30019 */     multu $a1, $v1
  /* 134194 80135F14 2409FFFF */     addiu $t1, $zero, -1
  /* 134198 80135F18 00005812 */      mflo $t3
  /* 13419C 80135F1C 004B6021 */      addu $t4, $v0, $t3
  /* 1341A0 80135F20 AD890080 */        sw $t1, 0x80($t4)
  /* 1341A4 80135F24 8E0D007C */        lw $t5, 0x7c($s0)
  /* 1341A8 80135F28 01A30019 */     multu $t5, $v1
  /* 1341AC 80135F2C 00007812 */      mflo $t7
  /* 1341B0 80135F30 004F7021 */      addu $t6, $v0, $t7
  /* 1341B4 80135F34 ADC70058 */        sw $a3, 0x58($t6)
  /* 1341B8 80135F38 8E19007C */        lw $t9, 0x7c($s0)
  /* 1341BC 80135F3C 03230019 */     multu $t9, $v1
  /* 1341C0 80135F40 0000C012 */      mflo $t8
  /* 1341C4 80135F44 00585021 */      addu $t2, $v0, $t8
  /* 1341C8 80135F48 AD460054 */        sw $a2, 0x54($t2)
  /* 1341CC 80135F4C 8E05007C */        lw $a1, 0x7c($s0)
  /* 1341D0 80135F50 00A30019 */     multu $a1, $v1
  /* 1341D4 80135F54 00005812 */      mflo $t3
  /* 1341D8 80135F58 004B4021 */      addu $t0, $v0, $t3
  /* 1341DC 80135F5C 8D040000 */        lw $a0, ($t0)
  /* 1341E0 80135F60 50800008 */      beql $a0, $zero, .L80135F84
  /* 1341E4 80135F64 8E060080 */        lw $a2, 0x80($s0)
  /* 1341E8 80135F68 0C04D355 */       jal mnBattleRedrawCursor
  /* 1341EC 80135F6C 8D060054 */        lw $a2, 0x54($t0)
  /* 1341F0 80135F70 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 1341F4 80135F74 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 1341F8 80135F78 240300BC */     addiu $v1, $zero, 0xbc
  /* 1341FC 80135F7C 24070001 */     addiu $a3, $zero, 1
  /* 134200 80135F80 8E060080 */        lw $a2, 0x80($s0)
  .L80135F84:
  /* 134204 80135F84 2409FFFF */     addiu $t1, $zero, -1
  /* 134208 80135F88 51260019 */      beql $t1, $a2, .L80135FF0
  /* 13420C 80135F8C 8FAF0020 */        lw $t7, 0x20($sp)
  /* 134210 80135F90 00C30019 */     multu $a2, $v1
  /* 134214 80135F94 240C0004 */     addiu $t4, $zero, 4
  /* 134218 80135F98 00006812 */      mflo $t5
  /* 13421C 80135F9C 004D7821 */      addu $t7, $v0, $t5
  /* 134220 80135FA0 ADEC007C */        sw $t4, 0x7c($t7)
  /* 134224 80135FA4 8E0E0080 */        lw $t6, 0x80($s0)
  /* 134228 80135FA8 01C30019 */     multu $t6, $v1
  /* 13422C 80135FAC 0000C812 */      mflo $t9
  /* 134230 80135FB0 0059C021 */      addu $t8, $v0, $t9
  /* 134234 80135FB4 AF070058 */        sw $a3, 0x58($t8)
  /* 134238 80135FB8 8E0A0080 */        lw $t2, 0x80($s0)
  /* 13423C 80135FBC 01430019 */     multu $t2, $v1
  /* 134240 80135FC0 00005812 */      mflo $t3
  /* 134244 80135FC4 004B6821 */      addu $t5, $v0, $t3
  /* 134248 80135FC8 ADA70088 */        sw $a3, 0x88($t5)
  /* 13424C 80135FCC 8E050080 */        lw $a1, 0x80($s0)
  /* 134250 80135FD0 0C04DCE4 */       jal mnBattleReorderCursorsOnPlacement
  /* 134254 80135FD4 8FA40020 */        lw $a0, 0x20($sp)
  /* 134258 80135FD8 0C04DC01 */       jal func_ovl26_80137004
  /* 13425C 80135FDC 8E040080 */        lw $a0, 0x80($s0)
  /* 134260 80135FE0 0C04D91F */       jal mnBattleCreateWhiteSquare
  /* 134264 80135FE4 8E040080 */        lw $a0, 0x80($s0)
  /* 134268 80135FE8 2409FFFF */     addiu $t1, $zero, -1
  /* 13426C 80135FEC 8FAF0020 */        lw $t7, 0x20($sp)
  .L80135FF0:
  /* 134270 80135FF0 240C001C */     addiu $t4, $zero, 0x1c
  /* 134274 80135FF4 3C198014 */       lui $t9, %hi(gMNBattleControllerOrderArray)
  /* 134278 80135FF8 000F7080 */       sll $t6, $t7, 2
  /* 13427C 80135FFC AE000058 */        sw $zero, 0x58($s0)
  /* 134280 80136000 AE090080 */        sw $t1, 0x80($s0)
  /* 134284 80136004 AE0C0048 */        sw $t4, 0x48($s0)
  /* 134288 80136008 AE000088 */        sw $zero, 0x88($s0)
  /* 13428C 8013600C AE0000A0 */        sw $zero, 0xa0($s0)
  /* 134290 80136010 032EC821 */      addu $t9, $t9, $t6
  /* 134294 80136014 8F39BD90 */        lw $t9, %lo(gMNBattleControllerOrderArray)($t9)
  /* 134298 80136018 51390003 */      beql $t1, $t9, .L80136028
  /* 13429C 8013601C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1342A0 80136020 AE0F007C */        sw $t7, 0x7c($s0)
  /* 1342A4 80136024 8FBF001C */        lw $ra, 0x1c($sp)
  .L80136028:
  /* 1342A8 80136028 8FB00018 */        lw $s0, 0x18($sp)
  /* 1342AC 8013602C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1342B0 80136030 03E00008 */        jr $ra
  /* 1342B4 80136034 00000000 */       nop

glabel func_ovl26_80136038
  /* 1342B8 80136038 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1342BC 8013603C 3C0E8014 */       lui $t6, %hi(dMNBattleTokenIndexes)
  /* 1342C0 80136040 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1342C4 80136044 25CEB7F0 */     addiu $t6, $t6, %lo(dMNBattleTokenIndexes)
  /* 1342C8 80136048 8DD80000 */        lw $t8, ($t6) # dMNBattleTokenIndexes + 0
  /* 1342CC 8013604C 27A70020 */     addiu $a3, $sp, 0x20
  /* 1342D0 80136050 0005C880 */       sll $t9, $a1, 2
  /* 1342D4 80136054 ACF80000 */        sw $t8, ($a3)
  /* 1342D8 80136058 8DCF0004 */        lw $t7, 4($t6) # dMNBattleTokenIndexes + 4
  /* 1342DC 8013605C 0325C823 */      subu $t9, $t9, $a1
  /* 1342E0 80136060 0019C900 */       sll $t9, $t9, 4
  /* 1342E4 80136064 ACEF0004 */        sw $t7, 4($a3)
  /* 1342E8 80136068 8DD80008 */        lw $t8, 8($t6) # dMNBattleTokenIndexes + 8
  /* 1342EC 8013606C 0325C823 */      subu $t9, $t9, $a1
  /* 1342F0 80136070 3C088014 */       lui $t0, %hi(gMNBattlePanels)
  /* 1342F4 80136074 2508BA88 */     addiu $t0, $t0, %lo(gMNBattlePanels)
  /* 1342F8 80136078 0019C880 */       sll $t9, $t9, 2
  /* 1342FC 8013607C 03281021 */      addu $v0, $t9, $t0
  /* 134300 80136080 8C490054 */        lw $t1, 0x54($v0)
  /* 134304 80136084 ACF80008 */        sw $t8, 8($a3)
  /* 134308 80136088 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleTokenIndexes + 12
  /* 13430C 8013608C 00A03025 */        or $a2, $a1, $zero
  /* 134310 80136090 15200007 */      bnez $t1, .L801360B0
  /* 134314 80136094 ACEF000C */        sw $t7, 0xc($a3)
  /* 134318 80136098 8C4A0058 */        lw $t2, 0x58($v0)
  /* 13431C 8013609C 240B0001 */     addiu $t3, $zero, 1
  /* 134320 801360A0 55400004 */      bnel $t2, $zero, .L801360B4
  /* 134324 801360A4 AC80007C */        sw $zero, 0x7c($a0)
  /* 134328 801360A8 10000002 */         b .L801360B4
  /* 13432C 801360AC AC8B007C */        sw $t3, 0x7c($a0)
  .L801360B0:
  /* 134330 801360B0 AC80007C */        sw $zero, 0x7c($a0)
  .L801360B4:
  /* 134334 801360B4 8C430084 */        lw $v1, 0x84($v0)
  /* 134338 801360B8 00066080 */       sll $t4, $a2, 2
  /* 13433C 801360BC 24010001 */     addiu $at, $zero, 1
  /* 134340 801360C0 10600008 */      beqz $v1, .L801360E4
  /* 134344 801360C4 00EC6821 */      addu $t5, $a3, $t4
  /* 134348 801360C8 1061000B */       beq $v1, $at, .L801360F8
  /* 13434C 801360CC 24050004 */     addiu $a1, $zero, 4
  /* 134350 801360D0 24010002 */     addiu $at, $zero, 2
  /* 134354 801360D4 5061000F */      beql $v1, $at, .L80136114
  /* 134358 801360D8 240F0001 */     addiu $t7, $zero, 1
  /* 13435C 801360DC 1000000F */         b .L8013611C
  /* 134360 801360E0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801360E4:
  /* 134364 801360E4 AC400058 */        sw $zero, 0x58($v0)
  /* 134368 801360E8 0C04E1B9 */       jal mnBattleRedrawToken
  /* 13436C 801360EC 8DA50000 */        lw $a1, ($t5)
  /* 134370 801360F0 1000000A */         b .L8013611C
  /* 134374 801360F4 8FBF0014 */        lw $ra, 0x14($sp)
  .L801360F8:
  /* 134378 801360F8 0C04E1B9 */       jal mnBattleRedrawToken
  /* 13437C 801360FC AFA20018 */        sw $v0, 0x18($sp)
  /* 134380 80136100 8FA20018 */        lw $v0, 0x18($sp)
  /* 134384 80136104 240E0001 */     addiu $t6, $zero, 1
  /* 134388 80136108 10000003 */         b .L80136118
  /* 13438C 8013610C AC4E0058 */        sw $t6, 0x58($v0)
  /* 134390 80136110 240F0001 */     addiu $t7, $zero, 1
  .L80136114:
  /* 134394 80136114 AC8F007C */        sw $t7, 0x7c($a0)
  .L80136118:
  /* 134398 80136118 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013611C:
  /* 13439C 8013611C 27BD0030 */     addiu $sp, $sp, 0x30
  /* 1343A0 80136120 03E00008 */        jr $ra
  /* 1343A4 80136124 00000000 */       nop

glabel mnBattleSyncFighterDisplay
  /* 1343A8 80136128 00047080 */       sll $t6, $a0, 2
  /* 1343AC 8013612C 01C47023 */      subu $t6, $t6, $a0
  /* 1343B0 80136130 000E7100 */       sll $t6, $t6, 4
  /* 1343B4 80136134 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1343B8 80136138 01C47023 */      subu $t6, $t6, $a0
  /* 1343BC 8013613C 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 1343C0 80136140 AFB00018 */        sw $s0, 0x18($sp)
  /* 1343C4 80136144 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 1343C8 80136148 000E7080 */       sll $t6, $t6, 2
  /* 1343CC 8013614C 01CF8021 */      addu $s0, $t6, $t7
  /* 1343D0 80136150 8E030008 */        lw $v1, 8($s0)
  /* 1343D4 80136154 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1343D8 80136158 00001025 */        or $v0, $zero, $zero
  /* 1343DC 8013615C 10600013 */      beqz $v1, .L801361AC
  /* 1343E0 80136160 00000000 */       nop
  /* 1343E4 80136164 8E180084 */        lw $t8, 0x84($s0)
  /* 1343E8 80136168 24010002 */     addiu $at, $zero, 2
  /* 1343EC 8013616C 24190001 */     addiu $t9, $zero, 1
  /* 1343F0 80136170 57010005 */      bnel $t8, $at, .L80136188
  /* 1343F4 80136174 8E080048 */        lw $t0, 0x48($s0)
  /* 1343F8 80136178 AC79007C */        sw $t9, 0x7c($v1)
  /* 1343FC 8013617C 1000000B */         b .L801361AC
  /* 134400 80136180 24020001 */     addiu $v0, $zero, 1
  /* 134404 80136184 8E080048 */        lw $t0, 0x48($s0)
  .L80136188:
  /* 134408 80136188 2401001C */     addiu $at, $zero, 0x1c
  /* 13440C 8013618C 15010007 */       bne $t0, $at, .L801361AC
  /* 134410 80136190 00000000 */       nop
  /* 134414 80136194 8E090058 */        lw $t1, 0x58($s0)
  /* 134418 80136198 240A0001 */     addiu $t2, $zero, 1
  /* 13441C 8013619C 15200003 */      bnez $t1, .L801361AC
  /* 134420 801361A0 00000000 */       nop
  /* 134424 801361A4 AC6A007C */        sw $t2, 0x7c($v1)
  /* 134428 801361A8 24020001 */     addiu $v0, $zero, 1
  .L801361AC:
  /* 13442C 801361AC 5440000E */      bnel $v0, $zero, .L801361E8
  /* 134430 801361B0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 134434 801361B4 0C04C6DE */       jal mnBattleGetShade
  /* 134438 801361B8 AFA40020 */        sw $a0, 0x20($sp)
  /* 13443C 801361BC AE020050 */        sw $v0, 0x50($s0)
  /* 134440 801361C0 8E040048 */        lw $a0, 0x48($s0)
  /* 134444 801361C4 0C04D21F */       jal mnBattleGetAvailableCostume
  /* 134448 801361C8 8FA50020 */        lw $a1, 0x20($sp)
  /* 13444C 801361CC 8E040008 */        lw $a0, 8($s0)
  /* 134450 801361D0 8FA50020 */        lw $a1, 0x20($sp)
  /* 134454 801361D4 8E060048 */        lw $a2, 0x48($s0)
  /* 134458 801361D8 0C04D2A3 */       jal mnBattleSpawnFighter
  /* 13445C 801361DC 00403825 */        or $a3, $v0, $zero
  /* 134460 801361E0 AE00008C */        sw $zero, 0x8c($s0)
  /* 134464 801361E4 8FBF001C */        lw $ra, 0x1c($sp)
  .L801361E8:
  /* 134468 801361E8 8FB00018 */        lw $s0, 0x18($sp)
  /* 13446C 801361EC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 134470 801361F0 03E00008 */        jr $ra
  /* 134474 801361F4 00000000 */       nop

glabel func_ovl26_801361F8
  /* 134478 801361F8 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13447C 801361FC 1080003C */      beqz $a0, .L801362F0
  /* 134480 80136200 AFBF0014 */        sw $ra, 0x14($sp)
  /* 134484 80136204 8C8E0074 */        lw $t6, 0x74($a0)
  /* 134488 80136208 3C0142F4 */       lui $at, (0x42F40000 >> 16) # 122.0
  /* 13448C 8013620C 44812000 */      mtc1 $at, $f4 # 122.0 to cop1
  /* 134490 80136210 C5C0005C */      lwc1 $f0, 0x5c($t6)
  /* 134494 80136214 00057880 */       sll $t7, $a1, 2
  /* 134498 80136218 01E57823 */      subu $t7, $t7, $a1
  /* 13449C 8013621C 4600203C */    c.lt.s $f4, $f0
  /* 1344A0 80136220 000F7900 */       sll $t7, $t7, 4
  /* 1344A4 80136224 01E57823 */      subu $t7, $t7, $a1
  /* 1344A8 80136228 3C014210 */       lui $at, (0x42100000 >> 16) # 36.0
  /* 1344AC 8013622C 4501000A */      bc1t .L80136258
  /* 1344B0 80136230 000F7880 */       sll $t7, $t7, 2
  /* 1344B4 80136234 44813000 */      mtc1 $at, $f6 # 36.0 to cop1
  /* 1344B8 80136238 00054080 */       sll $t0, $a1, 2
  /* 1344BC 8013623C 01054023 */      subu $t0, $t0, $a1
  /* 1344C0 80136240 4606003C */    c.lt.s $f0, $f6
  /* 1344C4 80136244 00084100 */       sll $t0, $t0, 4
  /* 1344C8 80136248 01054023 */      subu $t0, $t0, $a1
  /* 1344CC 8013624C 00084080 */       sll $t0, $t0, 2
  /* 1344D0 80136250 4500000D */      bc1f .L80136288
  /* 1344D4 80136254 3C098014 */       lui $t1, 0x8014
  .L80136258:
  /* 1344D8 80136258 3C188014 */       lui $t8, %hi(gMNBattlePanels)
  /* 1344DC 8013625C 2718BA88 */     addiu $t8, $t8, %lo(gMNBattlePanels)
  /* 1344E0 80136260 01F81021 */      addu $v0, $t7, $t8
  /* 1344E4 80136264 8C590054 */        lw $t9, 0x54($v0)
  /* 1344E8 80136268 00003025 */        or $a2, $zero, $zero
  /* 1344EC 8013626C 53200021 */      beql $t9, $zero, .L801362F4
  /* 1344F0 80136270 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1344F4 80136274 0C04D355 */       jal mnBattleRedrawCursor
  /* 1344F8 80136278 AFA2001C */        sw $v0, 0x1c($sp)
  /* 1344FC 8013627C 8FA2001C */        lw $v0, 0x1c($sp)
  /* 134500 80136280 1000001B */         b .L801362F0
  /* 134504 80136284 AC400054 */        sw $zero, 0x54($v0)
  .L80136288:
  /* 134508 80136288 2529BA88 */     addiu $t1, $t1, -0x4578
  /* 13450C 8013628C 01091021 */      addu $v0, $t0, $t1
  /* 134510 80136290 8C4A0058 */        lw $t2, 0x58($v0)
  /* 134514 80136294 24030001 */     addiu $v1, $zero, 1
  /* 134518 80136298 24060002 */     addiu $a2, $zero, 2
  /* 13451C 8013629C 106A0005 */       beq $v1, $t2, .L801362B4
  /* 134520 801362A0 00000000 */       nop
  /* 134524 801362A4 8C4B0084 */        lw $t3, 0x84($v0)
  /* 134528 801362A8 24010002 */     addiu $at, $zero, 2
  /* 13452C 801362AC 55610008 */      bnel $t3, $at, .L801362D0
  /* 134530 801362B0 8C4D0054 */        lw $t5, 0x54($v0)
  .L801362B4:
  /* 134534 801362B4 0C04D355 */       jal mnBattleRedrawCursor
  /* 134538 801362B8 AFA2001C */        sw $v0, 0x1c($sp)
  /* 13453C 801362BC 8FA2001C */        lw $v0, 0x1c($sp)
  /* 134540 801362C0 240C0002 */     addiu $t4, $zero, 2
  /* 134544 801362C4 1000000A */         b .L801362F0
  /* 134548 801362C8 AC4C0054 */        sw $t4, 0x54($v0)
  /* 13454C 801362CC 8C4D0054 */        lw $t5, 0x54($v0)
  .L801362D0:
  /* 134550 801362D0 00603025 */        or $a2, $v1, $zero
  /* 134554 801362D4 506D0007 */      beql $v1, $t5, .L801362F4
  /* 134558 801362D8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13455C 801362DC 0C04D355 */       jal mnBattleRedrawCursor
  /* 134560 801362E0 AFA2001C */        sw $v0, 0x1c($sp)
  /* 134564 801362E4 8FA2001C */        lw $v0, 0x1c($sp)
  /* 134568 801362E8 24030001 */     addiu $v1, $zero, 1
  /* 13456C 801362EC AC430054 */        sw $v1, 0x54($v0)
  .L801362F0:
  /* 134570 801362F0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801362F4:
  /* 134574 801362F4 27BD0020 */     addiu $sp, $sp, 0x20
  /* 134578 801362F8 03E00008 */        jr $ra
  /* 13457C 801362FC 00000000 */       nop

glabel mnBattleSyncNameAndLogo
  /* 134580 80136300 00047080 */       sll $t6, $a0, 2
  /* 134584 80136304 01C47023 */      subu $t6, $t6, $a0
  /* 134588 80136308 000E7100 */       sll $t6, $t6, 4
  /* 13458C 8013630C 01C47023 */      subu $t6, $t6, $a0
  /* 134590 80136310 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 134594 80136314 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 134598 80136318 000E7080 */       sll $t6, $t6, 2
  /* 13459C 8013631C 01CF1021 */      addu $v0, $t6, $t7
  /* 1345A0 80136320 8C580084 */        lw $t8, 0x84($v0)
  /* 1345A4 80136324 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1345A8 80136328 24010002 */     addiu $at, $zero, 2
  /* 1345AC 8013632C AFBF0014 */        sw $ra, 0x14($sp)
  /* 1345B0 80136330 13010008 */       beq $t8, $at, .L80136354
  /* 1345B4 80136334 00802825 */        or $a1, $a0, $zero
  /* 1345B8 80136338 8C590048 */        lw $t9, 0x48($v0)
  /* 1345BC 8013633C 2401001C */     addiu $at, $zero, 0x1c
  /* 1345C0 80136340 57210009 */      bnel $t9, $at, .L80136368
  /* 1345C4 80136344 8C4B0010 */        lw $t3, 0x10($v0)
  /* 1345C8 80136348 8C480058 */        lw $t0, 0x58($v0)
  /* 1345CC 8013634C 55000006 */      bnel $t0, $zero, .L80136368
  /* 1345D0 80136350 8C4B0010 */        lw $t3, 0x10($v0)
  .L80136354:
  /* 1345D4 80136354 8C4A0010 */        lw $t2, 0x10($v0)
  /* 1345D8 80136358 24090001 */     addiu $t1, $zero, 1
  /* 1345DC 8013635C 10000006 */         b .L80136378
  /* 1345E0 80136360 AD49007C */        sw $t1, 0x7c($t2)
  /* 1345E4 80136364 8C4B0010 */        lw $t3, 0x10($v0)
  .L80136368:
  /* 1345E8 80136368 AD60007C */        sw $zero, 0x7c($t3)
  /* 1345EC 8013636C 8C460048 */        lw $a2, 0x48($v0)
  /* 1345F0 80136370 0C04CA85 */       jal mnBattleSetNameAndLogo
  /* 1345F4 80136374 8C440010 */        lw $a0, 0x10($v0)
  .L80136378:
  /* 1345F8 80136378 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1345FC 8013637C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 134600 80136380 03E00008 */        jr $ra
  /* 134604 80136384 00000000 */       nop

glabel mnBattleRemoveWhiteSquare
  /* 134608 80136388 00047080 */       sll $t6, $a0, 2
  /* 13460C 8013638C 01C47023 */      subu $t6, $t6, $a0
  /* 134610 80136390 000E7100 */       sll $t6, $t6, 4
  /* 134614 80136394 01C47023 */      subu $t6, $t6, $a0
  /* 134618 80136398 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 13461C 8013639C 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 134620 801363A0 000E7080 */       sll $t6, $t6, 2
  /* 134624 801363A4 01CF1021 */      addu $v0, $t6, $t7
  /* 134628 801363A8 8C45002C */        lw $a1, 0x2c($v0)
  /* 13462C 801363AC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 134630 801363B0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 134634 801363B4 10A00005 */      beqz $a1, .L801363CC
  /* 134638 801363B8 00A02025 */        or $a0, $a1, $zero
  /* 13463C 801363BC 0C0026A1 */       jal omEjectGObj
  /* 134640 801363C0 AFA20018 */        sw $v0, 0x18($sp)
  /* 134644 801363C4 8FA20018 */        lw $v0, 0x18($sp)
  /* 134648 801363C8 AC40002C */        sw $zero, 0x2c($v0)
  .L801363CC:
  /* 13464C 801363CC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 134650 801363D0 27BD0020 */     addiu $sp, $sp, 0x20
  /* 134654 801363D4 03E00008 */        jr $ra
  /* 134658 801363D8 00000000 */       nop

glabel mnBattleFlashWhiteSquare
  /* 13465C 801363DC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 134660 801363E0 AFB30020 */        sw $s3, 0x20($sp)
  /* 134664 801363E4 AFB2001C */        sw $s2, 0x1c($sp)
  /* 134668 801363E8 AFB10018 */        sw $s1, 0x18($sp)
  /* 13466C 801363EC AFB00014 */        sw $s0, 0x14($sp)
  /* 134670 801363F0 00808825 */        or $s1, $a0, $zero
  /* 134674 801363F4 AFBF0024 */        sw $ra, 0x24($sp)
  /* 134678 801363F8 24120010 */     addiu $s2, $zero, 0x10
  /* 13467C 801363FC 24100001 */     addiu $s0, $zero, 1
  /* 134680 80136400 24130001 */     addiu $s3, $zero, 1
  /* 134684 80136404 2652FFFF */     addiu $s2, $s2, -1
  .L80136408:
  /* 134688 80136408 16400003 */      bnez $s2, .L80136418
  /* 13468C 8013640C 2610FFFF */     addiu $s0, $s0, -1
  /* 134690 80136410 0C04D8E2 */       jal mnBattleRemoveWhiteSquare
  /* 134694 80136414 8E240084 */        lw $a0, 0x84($s1)
  .L80136418:
  /* 134698 80136418 16000008 */      bnez $s0, .L8013643C
  /* 13469C 8013641C 00000000 */       nop
  /* 1346A0 80136420 8E2E007C */        lw $t6, 0x7c($s1)
  /* 1346A4 80136424 24100001 */     addiu $s0, $zero, 1
  /* 1346A8 80136428 566E0004 */      bnel $s3, $t6, .L8013643C
  /* 1346AC 8013642C AE33007C */        sw $s3, 0x7c($s1)
  /* 1346B0 80136430 10000002 */         b .L8013643C
  /* 1346B4 80136434 AE20007C */        sw $zero, 0x7c($s1)
  /* 1346B8 80136438 AE33007C */        sw $s3, 0x7c($s1)
  .L8013643C:
  /* 1346BC 8013643C 0C002C7A */       jal gsStopCurrentProcess
  /* 1346C0 80136440 24040001 */     addiu $a0, $zero, 1
  /* 1346C4 80136444 1000FFF0 */         b .L80136408
  /* 1346C8 80136448 2652FFFF */     addiu $s2, $s2, -1
  /* 1346CC 8013644C 00000000 */       nop
  /* 1346D0 80136450 00000000 */       nop
  /* 1346D4 80136454 00000000 */       nop
  /* 1346D8 80136458 00000000 */       nop
  /* 1346DC 8013645C 00000000 */       nop
# Maybe start of new file
  /* 1346E0 80136460 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1346E4 80136464 8FB00014 */        lw $s0, 0x14($sp)
  /* 1346E8 80136468 8FB10018 */        lw $s1, 0x18($sp)
  /* 1346EC 8013646C 8FB2001C */        lw $s2, 0x1c($sp)
  /* 1346F0 80136470 8FB30020 */        lw $s3, 0x20($sp)
  /* 1346F4 80136474 03E00008 */        jr $ra
  /* 1346F8 80136478 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBattleCreateWhiteSquare
  /* 1346FC 8013647C 00047880 */       sll $t7, $a0, 2
  /* 134700 80136480 01E47823 */      subu $t7, $t7, $a0
  /* 134704 80136484 000F7900 */       sll $t7, $t7, 4
  /* 134708 80136488 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13470C 8013648C 01E47823 */      subu $t7, $t7, $a0
  /* 134710 80136490 3C188014 */       lui $t8, %hi(gMNBattlePanels)
  /* 134714 80136494 2718BA88 */     addiu $t8, $t8, %lo(gMNBattlePanels)
  /* 134718 80136498 000F7880 */       sll $t7, $t7, 2
  /* 13471C 8013649C AFBF0024 */        sw $ra, 0x24($sp)
  /* 134720 801364A0 AFA40040 */        sw $a0, 0x40($sp)
  /* 134724 801364A4 01F81021 */      addu $v0, $t7, $t8
  /* 134728 801364A8 AFB00020 */        sw $s0, 0x20($sp)
  /* 13472C 801364AC 8C440048 */        lw $a0, 0x48($v0)
  /* 134730 801364B0 0C04C85A */       jal mnBattleGetPortraitId
  /* 134734 801364B4 AFA2002C */        sw $v0, 0x2c($sp)
  /* 134738 801364B8 00408025 */        or $s0, $v0, $zero
  /* 13473C 801364BC 0C04D8E2 */       jal mnBattleRemoveWhiteSquare
  /* 134740 801364C0 8FA40040 */        lw $a0, 0x40($sp)
  /* 134744 801364C4 00002025 */        or $a0, $zero, $zero
  /* 134748 801364C8 00002825 */        or $a1, $zero, $zero
  /* 13474C 801364CC 2406001E */     addiu $a2, $zero, 0x1e
  /* 134750 801364D0 0C00265A */       jal omMakeGObjSPAfter
  /* 134754 801364D4 3C078000 */       lui $a3, 0x8000
  /* 134758 801364D8 8FB9002C */        lw $t9, 0x2c($sp)
  /* 13475C 801364DC AFA2003C */        sw $v0, 0x3c($sp)
  /* 134760 801364E0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 134764 801364E4 2408FFFF */     addiu $t0, $zero, -1
  /* 134768 801364E8 AF22002C */        sw $v0, 0x2c($t9)
  /* 13476C 801364EC AFA80010 */        sw $t0, 0x10($sp)
  /* 134770 801364F0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 134774 801364F4 00402025 */        or $a0, $v0, $zero
  /* 134778 801364F8 24060025 */     addiu $a2, $zero, 0x25
  /* 13477C 801364FC 0C00277D */       jal omAddGObjRenderProc
  /* 134780 80136500 3C078000 */       lui $a3, 0x8000
  /* 134784 80136504 8FA4003C */        lw $a0, 0x3c($sp)
  /* 134788 80136508 8FA90040 */        lw $t1, 0x40($sp)
  /* 13478C 8013650C 3C058013 */       lui $a1, %hi(mnBattleFlashWhiteSquare)
  /* 134790 80136510 24A563DC */     addiu $a1, $a1, %lo(mnBattleFlashWhiteSquare)
  /* 134794 80136514 00003025 */        or $a2, $zero, $zero
  /* 134798 80136518 24070001 */     addiu $a3, $zero, 1
  /* 13479C 8013651C 0C002062 */       jal omAddGObjCommonProc
  /* 1347A0 80136520 AC890084 */        sw $t1, 0x84($a0)
  /* 1347A4 80136524 3C0A8014 */       lui $t2, %hi(D_ovl26_8013C4B4)
  /* 1347A8 80136528 8D4AC4B4 */        lw $t2, %lo(D_ovl26_8013C4B4)($t2)
  /* 1347AC 8013652C 3C0B0000 */       lui $t3, %hi(D_NF_000006F0)
  /* 1347B0 80136530 256B06F0 */     addiu $t3, $t3, %lo(D_NF_000006F0)
  /* 1347B4 80136534 8FA4003C */        lw $a0, 0x3c($sp)
  /* 1347B8 80136538 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1347BC 8013653C 014B2821 */      addu $a1, $t2, $t3
  /* 1347C0 80136540 2A010006 */      slti $at, $s0, 6
  /* 1347C4 80136544 14200003 */      bnez $at, .L80136554
  /* 1347C8 80136548 02001825 */        or $v1, $s0, $zero
  /* 1347CC 8013654C 10000001 */         b .L80136554
  /* 1347D0 80136550 2603FFFA */     addiu $v1, $s0, -6
  .L80136554:
  /* 1347D4 80136554 00036080 */       sll $t4, $v1, 2
  /* 1347D8 80136558 01836023 */      subu $t4, $t4, $v1
  /* 1347DC 8013655C 000C6080 */       sll $t4, $t4, 2
  /* 1347E0 80136560 01836023 */      subu $t4, $t4, $v1
  /* 1347E4 80136564 000C6080 */       sll $t4, $t4, 2
  /* 1347E8 80136568 01836021 */      addu $t4, $t4, $v1
  /* 1347EC 8013656C 258D001A */     addiu $t5, $t4, 0x1a
  /* 1347F0 80136570 448D2000 */      mtc1 $t5, $f4
  /* 1347F4 80136574 2A010006 */      slti $at, $s0, 6
  /* 1347F8 80136578 00001825 */        or $v1, $zero, $zero
  /* 1347FC 8013657C 468021A0 */   cvt.s.w $f6, $f4
  /* 134800 80136580 14200003 */      bnez $at, .L80136590
  /* 134804 80136584 E4460058 */      swc1 $f6, 0x58($v0)
  /* 134808 80136588 10000001 */         b .L80136590
  /* 13480C 8013658C 24030001 */     addiu $v1, $zero, 1
  .L80136590:
  /* 134810 80136590 00037080 */       sll $t6, $v1, 2
  /* 134814 80136594 01C37023 */      subu $t6, $t6, $v1
  /* 134818 80136598 000E7080 */       sll $t6, $t6, 2
  /* 13481C 8013659C 01C37023 */      subu $t6, $t6, $v1
  /* 134820 801365A0 000E7080 */       sll $t6, $t6, 2
  /* 134824 801365A4 01C37023 */      subu $t6, $t6, $v1
  /* 134828 801365A8 25CF0025 */     addiu $t7, $t6, 0x25
  /* 13482C 801365AC 448F4000 */      mtc1 $t7, $f8
  /* 134830 801365B0 00000000 */       nop
  /* 134834 801365B4 468042A0 */   cvt.s.w $f10, $f8
  /* 134838 801365B8 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13483C 801365BC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 134840 801365C0 8FB00020 */        lw $s0, 0x20($sp)
  /* 134844 801365C4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 134848 801365C8 03E00008 */        jr $ra
  /* 13484C 801365CC 00000000 */       nop

glabel func_ovl26_801365D0
  /* 134850 801365D0 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 134854 801365D4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 134858 801365D8 AFB10018 */        sw $s1, 0x18($sp)
  /* 13485C 801365DC AFA50024 */        sw $a1, 0x24($sp)
  /* 134860 801365E0 00C08825 */        or $s1, $a2, $zero
  /* 134864 801365E4 AFB00014 */        sw $s0, 0x14($sp)
  /* 134868 801365E8 0C04D6AE */       jal func_ovl26_80135AB8
  /* 13486C 801365EC 00C02825 */        or $a1, $a2, $zero
  /* 134870 801365F0 10400058 */      beqz $v0, .L80136754
  /* 134874 801365F4 00117080 */       sll $t6, $s1, 2
  /* 134878 801365F8 3C0F8014 */       lui $t7, %hi(gMNBattleControllerOrderArray)
  /* 13487C 801365FC 01EE7821 */      addu $t7, $t7, $t6
  /* 134880 80136600 8DEFBD90 */        lw $t7, %lo(gMNBattleControllerOrderArray)($t7)
  /* 134884 80136604 2401FFFF */     addiu $at, $zero, -1
  /* 134888 80136608 00114880 */       sll $t1, $s1, 2
  /* 13488C 8013660C 15E10013 */       bne $t7, $at, .L8013665C
  /* 134890 80136610 01314823 */      subu $t1, $t1, $s1
  /* 134894 80136614 0011C080 */       sll $t8, $s1, 2
  /* 134898 80136618 0311C023 */      subu $t8, $t8, $s1
  /* 13489C 8013661C 0018C100 */       sll $t8, $t8, 4
  /* 1348A0 80136620 0311C023 */      subu $t8, $t8, $s1
  /* 1348A4 80136624 3C198014 */       lui $t9, %hi(gMNBattlePanels)
  /* 1348A8 80136628 2739BA88 */     addiu $t9, $t9, %lo(gMNBattlePanels)
  /* 1348AC 8013662C 0018C080 */       sll $t8, $t8, 2
  /* 1348B0 80136630 03198021 */      addu $s0, $t8, $t9
  /* 1348B4 80136634 8E020084 */        lw $v0, 0x84($s0)
  /* 1348B8 80136638 24080001 */     addiu $t0, $zero, 1
  /* 1348BC 8013663C 24420001 */     addiu $v0, $v0, 1
  /* 1348C0 80136640 28410003 */      slti $at, $v0, 3
  /* 1348C4 80136644 14200003 */      bnez $at, .L80136654
  /* 1348C8 80136648 00000000 */       nop
  /* 1348CC 8013664C 10000011 */         b .L80136694
  /* 1348D0 80136650 AE080084 */        sw $t0, 0x84($s0)
  .L80136654:
  /* 1348D4 80136654 1000000F */         b .L80136694
  /* 1348D8 80136658 AE020084 */        sw $v0, 0x84($s0)
  .L8013665C:
  /* 1348DC 8013665C 00094900 */       sll $t1, $t1, 4
  /* 1348E0 80136660 01314823 */      subu $t1, $t1, $s1
  /* 1348E4 80136664 3C0A8014 */       lui $t2, %hi(gMNBattlePanels)
  /* 1348E8 80136668 254ABA88 */     addiu $t2, $t2, %lo(gMNBattlePanels)
  /* 1348EC 8013666C 00094880 */       sll $t1, $t1, 2
  /* 1348F0 80136670 012A8021 */      addu $s0, $t1, $t2
  /* 1348F4 80136674 8E020084 */        lw $v0, 0x84($s0)
  /* 1348F8 80136678 24420001 */     addiu $v0, $v0, 1
  /* 1348FC 8013667C 28410003 */      slti $at, $v0, 3
  /* 134900 80136680 54200004 */      bnel $at, $zero, .L80136694
  /* 134904 80136684 AE020084 */        sw $v0, 0x84($s0)
  /* 134908 80136688 10000002 */         b .L80136694
  /* 13490C 8013668C AE000084 */        sw $zero, 0x84($s0)
  /* 134910 80136690 AE020084 */        sw $v0, 0x84($s0)
  .L80136694:
  /* 134914 80136694 0C04D721 */       jal func_ovl26_80135C84
  /* 134918 80136698 02202025 */        or $a0, $s1, $zero
  /* 13491C 8013669C 8E04000C */        lw $a0, 0xc($s0)
  /* 134920 801366A0 02202825 */        or $a1, $s1, $zero
  /* 134924 801366A4 0C04CA57 */       jal func_ovl26_8013295C
  /* 134928 801366A8 8E060084 */        lw $a2, 0x84($s0)
  /* 13492C 801366AC 8E040004 */        lw $a0, 4($s0)
  /* 134930 801366B0 0C04D80E */       jal func_ovl26_80136038
  /* 134934 801366B4 02202825 */        or $a1, $s1, $zero
  /* 134938 801366B8 8E040000 */        lw $a0, ($s0)
  /* 13493C 801366BC 0C04D87E */       jal func_ovl26_801361F8
  /* 134940 801366C0 02202825 */        or $a1, $s1, $zero
  /* 134944 801366C4 0C04D84A */       jal mnBattleSyncFighterDisplay
  /* 134948 801366C8 02202025 */        or $a0, $s1, $zero
  /* 13494C 801366CC 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 134950 801366D0 02202025 */        or $a0, $s1, $zero
  /* 134954 801366D4 8E020084 */        lw $v0, 0x84($s0)
  /* 134958 801366D8 24010001 */     addiu $at, $zero, 1
  /* 13495C 801366DC 240400A7 */     addiu $a0, $zero, 0xa7
  /* 134960 801366E0 10400008 */      beqz $v0, .L80136704
  /* 134964 801366E4 00000000 */       nop
  /* 134968 801366E8 1041000A */       beq $v0, $at, .L80136714
  /* 13496C 801366EC 240B0004 */     addiu $t3, $zero, 4
  /* 134970 801366F0 24010002 */     addiu $at, $zero, 2
  /* 134974 801366F4 10410011 */       beq $v0, $at, .L8013673C
  /* 134978 801366F8 00000000 */       nop
  /* 13497C 801366FC 10000011 */         b .L80136744
  /* 134980 80136700 00000000 */       nop
  .L80136704:
  /* 134984 80136704 0C009A70 */       jal func_800269C0
  /* 134988 80136708 AE11007C */        sw $s1, 0x7c($s0)
  /* 13498C 8013670C 1000000D */         b .L80136744
  /* 134990 80136710 00000000 */       nop
  .L80136714:
  /* 134994 80136714 AE0B007C */        sw $t3, 0x7c($s0)
  /* 134998 80136718 8FA40024 */        lw $a0, 0x24($sp)
  /* 13499C 8013671C 0C04D9FC */       jal mnBattleAnnounceFighter
  /* 1349A0 80136720 02202825 */        or $a1, $s1, $zero
  /* 1349A4 80136724 0C04DC01 */       jal func_ovl26_80137004
  /* 1349A8 80136728 02202025 */        or $a0, $s1, $zero
  /* 1349AC 8013672C 0C04D91F */       jal mnBattleCreateWhiteSquare
  /* 1349B0 80136730 02202025 */        or $a0, $s1, $zero
  /* 1349B4 80136734 10000003 */         b .L80136744
  /* 1349B8 80136738 00000000 */       nop
  .L8013673C:
  /* 1349BC 8013673C 0C009A70 */       jal func_800269C0
  /* 1349C0 80136740 240400A7 */     addiu $a0, $zero, 0xa7
  .L80136744:
  /* 1349C4 80136744 0C009A70 */       jal func_800269C0
  /* 1349C8 80136748 2404009D */     addiu $a0, $zero, 0x9d
  /* 1349CC 8013674C 10000002 */         b .L80136758
  /* 1349D0 80136750 24020001 */     addiu $v0, $zero, 1
  .L80136754:
  /* 1349D4 80136754 00001025 */        or $v0, $zero, $zero
  .L80136758:
  /* 1349D8 80136758 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1349DC 8013675C 8FB00014 */        lw $s0, 0x14($sp)
  /* 1349E0 80136760 8FB10018 */        lw $s1, 0x18($sp)
  /* 1349E4 80136764 03E00008 */        jr $ra
  /* 1349E8 80136768 27BD0020 */     addiu $sp, $sp, 0x20

glabel func_ovl26_8013676C
  /* 1349EC 8013676C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1349F0 80136770 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1349F4 80136774 AFB00018 */        sw $s0, 0x18($sp)
  /* 1349F8 80136778 AFA40020 */        sw $a0, 0x20($sp)
  /* 1349FC 8013677C AFA50024 */        sw $a1, 0x24($sp)
  /* 134A00 80136780 00008025 */        or $s0, $zero, $zero
  /* 134A04 80136784 0C04D974 */       jal func_ovl26_801365D0
  /* 134A08 80136788 00003025 */        or $a2, $zero, $zero
  /* 134A0C 8013678C 10400002 */      beqz $v0, .L80136798
  /* 134A10 80136790 8FA40020 */        lw $a0, 0x20($sp)
  /* 134A14 80136794 24100001 */     addiu $s0, $zero, 1
  .L80136798:
  /* 134A18 80136798 8FA50024 */        lw $a1, 0x24($sp)
  /* 134A1C 8013679C 0C04D974 */       jal func_ovl26_801365D0
  /* 134A20 801367A0 24060001 */     addiu $a2, $zero, 1
  /* 134A24 801367A4 10400002 */      beqz $v0, .L801367B0
  /* 134A28 801367A8 8FA40020 */        lw $a0, 0x20($sp)
  /* 134A2C 801367AC 24100001 */     addiu $s0, $zero, 1
  .L801367B0:
  /* 134A30 801367B0 8FA50024 */        lw $a1, 0x24($sp)
  /* 134A34 801367B4 0C04D974 */       jal func_ovl26_801365D0
  /* 134A38 801367B8 24060002 */     addiu $a2, $zero, 2
  /* 134A3C 801367BC 10400002 */      beqz $v0, .L801367C8
  /* 134A40 801367C0 8FA40020 */        lw $a0, 0x20($sp)
  /* 134A44 801367C4 24100001 */     addiu $s0, $zero, 1
  .L801367C8:
  /* 134A48 801367C8 8FA50024 */        lw $a1, 0x24($sp)
  /* 134A4C 801367CC 0C04D974 */       jal func_ovl26_801365D0
  /* 134A50 801367D0 24060003 */     addiu $a2, $zero, 3
  /* 134A54 801367D4 10400002 */      beqz $v0, .L801367E0
  /* 134A58 801367D8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 134A5C 801367DC 24100001 */     addiu $s0, $zero, 1
  .L801367E0:
  /* 134A60 801367E0 02001025 */        or $v0, $s0, $zero
  /* 134A64 801367E4 8FB00018 */        lw $s0, 0x18($sp)
  /* 134A68 801367E8 03E00008 */        jr $ra
  /* 134A6C 801367EC 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBattleAnnounceFighter
  /* 134A70 801367F0 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 134A74 801367F4 3C0F8014 */       lui $t7, %hi(dMNBattleAnnouncerNames)
  /* 134A78 801367F8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 134A7C 801367FC AFA5003C */        sw $a1, 0x3c($sp)
  /* 134A80 80136800 25EFB800 */     addiu $t7, $t7, %lo(dMNBattleAnnouncerNames)
  /* 134A84 80136804 8DF90000 */        lw $t9, ($t7) # dMNBattleAnnouncerNames + 0
  /* 134A88 80136808 8DF80004 */        lw $t8, 4($t7) # dMNBattleAnnouncerNames + 4
  /* 134A8C 8013680C 27AE0020 */     addiu $t6, $sp, 0x20
  /* 134A90 80136810 ADD90000 */        sw $t9, ($t6)
  /* 134A94 80136814 ADD80004 */        sw $t8, 4($t6)
  /* 134A98 80136818 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleAnnouncerNames + 12
  /* 134A9C 8013681C 8DF90008 */        lw $t9, 8($t7) # dMNBattleAnnouncerNames + 8
  /* 134AA0 80136820 00044080 */       sll $t0, $a0, 2
  /* 134AA4 80136824 01044023 */      subu $t0, $t0, $a0
  /* 134AA8 80136828 ADD8000C */        sw $t8, 0xc($t6)
  /* 134AAC 8013682C ADD90008 */        sw $t9, 8($t6)
  /* 134AB0 80136830 8DF90010 */        lw $t9, 0x10($t7) # dMNBattleAnnouncerNames + 16
  /* 134AB4 80136834 8DF80014 */        lw $t8, 0x14($t7) # dMNBattleAnnouncerNames + 20
  /* 134AB8 80136838 00084100 */       sll $t0, $t0, 4
  /* 134ABC 8013683C 01044023 */      subu $t0, $t0, $a0
  /* 134AC0 80136840 3C098014 */       lui $t1, %hi(gMNBattlePanels)
  /* 134AC4 80136844 2529BA88 */     addiu $t1, $t1, %lo(gMNBattlePanels)
  /* 134AC8 80136848 00084080 */       sll $t0, $t0, 2
  /* 134ACC 8013684C 01091821 */      addu $v1, $t0, $t1
  /* 134AD0 80136850 ADD90010 */        sw $t9, 0x10($t6)
  /* 134AD4 80136854 ADD80014 */        sw $t8, 0x14($t6)
  /* 134AD8 80136858 AFA3001C */        sw $v1, 0x1c($sp)
  /* 134ADC 8013685C 0C0099CE */       jal func_80026738
  /* 134AE0 80136860 8C6400A8 */        lw $a0, 0xa8($v1)
  /* 134AE4 80136864 0C009A70 */       jal func_800269C0
  /* 134AE8 80136868 24040079 */     addiu $a0, $zero, 0x79
  /* 134AEC 8013686C 8FAA003C */        lw $t2, 0x3c($sp)
  /* 134AF0 80136870 3C0C8014 */       lui $t4, %hi(D_ovl26_8013BAD0)
  /* 134AF4 80136874 000A5880 */       sll $t3, $t2, 2
  /* 134AF8 80136878 016A5823 */      subu $t3, $t3, $t2
  /* 134AFC 8013687C 000B5900 */       sll $t3, $t3, 4
  /* 134B00 80136880 016A5823 */      subu $t3, $t3, $t2
  /* 134B04 80136884 000B5880 */       sll $t3, $t3, 2
  /* 134B08 80136888 018B6021 */      addu $t4, $t4, $t3
  /* 134B0C 8013688C 8D8CBAD0 */        lw $t4, %lo(D_ovl26_8013BAD0)($t4)
  /* 134B10 80136890 000C6840 */       sll $t5, $t4, 1
  /* 134B14 80136894 03AD2021 */      addu $a0, $sp, $t5
  /* 134B18 80136898 0C009A70 */       jal func_800269C0
  /* 134B1C 8013689C 94840020 */       lhu $a0, 0x20($a0)
  /* 134B20 801368A0 8FA3001C */        lw $v1, 0x1c($sp)
  /* 134B24 801368A4 10400003 */      beqz $v0, .L801368B4
  /* 134B28 801368A8 AC6200A8 */        sw $v0, 0xa8($v1)
  /* 134B2C 801368AC 944F0026 */       lhu $t7, 0x26($v0)
  /* 134B30 801368B0 A46F00AC */        sh $t7, 0xac($v1)
  .L801368B4:
  /* 134B34 801368B4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 134B38 801368B8 27BD0038 */     addiu $sp, $sp, 0x38
  /* 134B3C 801368BC 03E00008 */        jr $ra
  /* 134B40 801368C0 00000000 */       nop

glabel func_ovl26_801368C4
  /* 134B44 801368C4 00047080 */       sll $t6, $a0, 2
  /* 134B48 801368C8 01C47023 */      subu $t6, $t6, $a0
  /* 134B4C 801368CC 000E7100 */       sll $t6, $t6, 4
  /* 134B50 801368D0 01C47023 */      subu $t6, $t6, $a0
  /* 134B54 801368D4 000E7080 */       sll $t6, $t6, 2
  /* 134B58 801368D8 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BA98)
  /* 134B5C 801368DC 01EE7821 */      addu $t7, $t7, $t6
  /* 134B60 801368E0 8DEFBA98 */        lw $t7, %lo(D_ovl26_8013BA98)($t7)
  /* 134B64 801368E4 8DE20074 */        lw $v0, 0x74($t7)
  /* 134B68 801368E8 10400007 */      beqz $v0, .L80136908
  /* 134B6C 801368EC 00000000 */       nop
  /* 134B70 801368F0 8C430008 */        lw $v1, 8($v0)
  /* 134B74 801368F4 10600004 */      beqz $v1, .L80136908
  /* 134B78 801368F8 00000000 */       nop
  /* 134B7C 801368FC 94780024 */       lhu $t8, 0x24($v1)
  /* 134B80 80136900 37190004 */       ori $t9, $t8, 4
  /* 134B84 80136904 A4790024 */        sh $t9, 0x24($v1)
  .L80136908:
  /* 134B88 80136908 03E00008 */        jr $ra
  /* 134B8C 8013690C 00000000 */       nop

glabel mnBattleRemoveHandicapCPULevel
  /* 134B90 80136910 00047080 */       sll $t6, $a0, 2
  /* 134B94 80136914 01C47023 */      subu $t6, $t6, $a0
  /* 134B98 80136918 000E7100 */       sll $t6, $t6, 4
  /* 134B9C 8013691C 01C47023 */      subu $t6, $t6, $a0
  /* 134BA0 80136920 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 134BA4 80136924 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 134BA8 80136928 000E7080 */       sll $t6, $t6, 2
  /* 134BAC 8013692C 01CF1021 */      addu $v0, $t6, $t7
  /* 134BB0 80136930 8C450020 */        lw $a1, 0x20($v0)
  /* 134BB4 80136934 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 134BB8 80136938 AFBF0014 */        sw $ra, 0x14($sp)
  /* 134BBC 8013693C 10A00004 */      beqz $a1, .L80136950
  /* 134BC0 80136940 00A02025 */        or $a0, $a1, $zero
  /* 134BC4 80136944 0C0026A1 */       jal omEjectGObj
  /* 134BC8 80136948 AFA2001C */        sw $v0, 0x1c($sp)
  /* 134BCC 8013694C 8FA2001C */        lw $v0, 0x1c($sp)
  .L80136950:
  /* 134BD0 80136950 8C440024 */        lw $a0, 0x24($v0)
  /* 134BD4 80136954 50800005 */      beql $a0, $zero, .L8013696C
  /* 134BD8 80136958 8C440028 */        lw $a0, 0x28($v0)
  /* 134BDC 8013695C 0C0026A1 */       jal omEjectGObj
  /* 134BE0 80136960 AFA2001C */        sw $v0, 0x1c($sp)
  /* 134BE4 80136964 8FA2001C */        lw $v0, 0x1c($sp)
  /* 134BE8 80136968 8C440028 */        lw $a0, 0x28($v0)
  .L8013696C:
  /* 134BEC 8013696C 50800005 */      beql $a0, $zero, .L80136984
  /* 134BF0 80136970 8FBF0014 */        lw $ra, 0x14($sp)
  /* 134BF4 80136974 0C0026A1 */       jal omEjectGObj
  /* 134BF8 80136978 AFA2001C */        sw $v0, 0x1c($sp)
  /* 134BFC 8013697C 8FA2001C */        lw $v0, 0x1c($sp)
  /* 134C00 80136980 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136984:
  /* 134C04 80136984 AC400020 */        sw $zero, 0x20($v0)
  /* 134C08 80136988 AC400024 */        sw $zero, 0x24($v0)
  /* 134C0C 8013698C AC400028 */        sw $zero, 0x28($v0)
  /* 134C10 80136990 03E00008 */        jr $ra
  /* 134C14 80136994 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBattleGetArrowSObj
  /* 134C18 80136998 8C830074 */        lw $v1, 0x74($a0)
  /* 134C1C 8013699C 00001025 */        or $v0, $zero, $zero
  /* 134C20 801369A0 1060000E */      beqz $v1, .L801369DC
  /* 134C24 801369A4 00000000 */       nop
  /* 134C28 801369A8 8C6E0054 */        lw $t6, 0x54($v1)
  /* 134C2C 801369AC 54AE0004 */      bnel $a1, $t6, .L801369C0
  /* 134C30 801369B0 8C640008 */        lw $a0, 8($v1)
  /* 134C34 801369B4 03E00008 */        jr $ra
  /* 134C38 801369B8 00601025 */        or $v0, $v1, $zero

  /* 134C3C 801369BC 8C640008 */        lw $a0, 8($v1)
  .L801369C0:
  /* 134C40 801369C0 10800006 */      beqz $a0, .L801369DC
  /* 134C44 801369C4 00000000 */       nop
  /* 134C48 801369C8 8C8F0054 */        lw $t7, 0x54($a0)
  /* 134C4C 801369CC 14AF0003 */       bne $a1, $t7, .L801369DC
  /* 134C50 801369D0 00000000 */       nop
  /* 134C54 801369D4 03E00008 */        jr $ra
  /* 134C58 801369D8 00801025 */        or $v0, $a0, $zero

  .L801369DC:
  /* 134C5C 801369DC 03E00008 */        jr $ra
  /* 134C60 801369E0 00000000 */       nop

glabel mnBattleSyncAndBlinkArrows
  /* 134C64 801369E4 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 134C68 801369E8 AFBE0048 */        sw $fp, 0x48($sp)
  /* 134C6C 801369EC AFB70044 */        sw $s7, 0x44($sp)
  /* 134C70 801369F0 AFB60040 */        sw $s6, 0x40($sp)
  /* 134C74 801369F4 AFB5003C */        sw $s5, 0x3c($sp)
  /* 134C78 801369F8 AFB40038 */        sw $s4, 0x38($sp)
  /* 134C7C 801369FC AFB20030 */        sw $s2, 0x30($sp)
  /* 134C80 80136A00 AFB00028 */        sw $s0, 0x28($sp)
  /* 134C84 80136A04 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 134C88 80136A08 3C014349 */       lui $at, (0x43490000 >> 16) # 201.0
  /* 134C8C 80136A0C AFBF004C */        sw $ra, 0x4c($sp)
  /* 134C90 80136A10 AFB30034 */        sw $s3, 0x34($sp)
  /* 134C94 80136A14 AFB1002C */        sw $s1, 0x2c($sp)
  /* 134C98 80136A18 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 134C9C 80136A1C 3C168014 */       lui $s6, %hi(D_ovl26_8013C4A0)
  /* 134CA0 80136A20 3C1E8014 */       lui $fp, %hi(gMNBattlePanels)
  /* 134CA4 80136A24 4481B000 */      mtc1 $at, $f22 # 201.0 to cop1
  /* 134CA8 80136A28 00808025 */        or $s0, $a0, $zero
  /* 134CAC 80136A2C 8C930084 */        lw $s3, 0x84($a0)
  /* 134CB0 80136A30 2412000A */     addiu $s2, $zero, 0xa
  /* 134CB4 80136A34 27DEBA88 */     addiu $fp, $fp, %lo(gMNBattlePanels)
  /* 134CB8 80136A38 26D6C4A0 */     addiu $s6, $s6, %lo(D_ovl26_8013C4A0)
  /* 134CBC 80136A3C 24140001 */     addiu $s4, $zero, 1
  /* 134CC0 80136A40 24150001 */     addiu $s5, $zero, 1
  /* 134CC4 80136A44 2417FFDF */     addiu $s7, $zero, -0x21
  /* 134CC8 80136A48 2652FFFF */     addiu $s2, $s2, -1
  .L80136A4C:
  /* 134CCC 80136A4C 16400008 */      bnez $s2, .L80136A70
  /* 134CD0 80136A50 00137880 */       sll $t7, $s3, 2
  /* 134CD4 80136A54 8E0E007C */        lw $t6, 0x7c($s0)
  /* 134CD8 80136A58 2412000A */     addiu $s2, $zero, 0xa
  /* 134CDC 80136A5C 568E0004 */      bnel $s4, $t6, .L80136A70
  /* 134CE0 80136A60 AE14007C */        sw $s4, 0x7c($s0)
  /* 134CE4 80136A64 10000002 */         b .L80136A70
  /* 134CE8 80136A68 AE00007C */        sw $zero, 0x7c($s0)
  /* 134CEC 80136A6C AE14007C */        sw $s4, 0x7c($s0)
  .L80136A70:
  /* 134CF0 80136A70 01F37823 */      subu $t7, $t7, $s3
  /* 134CF4 80136A74 000F7900 */       sll $t7, $t7, 4
  /* 134CF8 80136A78 01F37823 */      subu $t7, $t7, $s3
  /* 134CFC 80136A7C 000F7880 */       sll $t7, $t7, 2
  /* 134D00 80136A80 03CF1021 */      addu $v0, $fp, $t7
  /* 134D04 80136A84 8C580084 */        lw $t8, 0x84($v0)
  /* 134D08 80136A88 00002825 */        or $a1, $zero, $zero
  /* 134D0C 80136A8C 02002025 */        or $a0, $s0, $zero
  /* 134D10 80136A90 57000004 */      bnel $t8, $zero, .L80136AA4
  /* 134D14 80136A94 8C510038 */        lw $s1, 0x38($v0)
  /* 134D18 80136A98 10000002 */         b .L80136AA4
  /* 134D1C 80136A9C 8C51003C */        lw $s1, 0x3c($v0)
  /* 134D20 80136AA0 8C510038 */        lw $s1, 0x38($v0)
  .L80136AA4:
  /* 134D24 80136AA4 16350009 */       bne $s1, $s5, .L80136ACC
  /* 134D28 80136AA8 00000000 */       nop
  /* 134D2C 80136AAC 0C04DA66 */       jal mnBattleGetArrowSObj
  /* 134D30 80136AB0 02002025 */        or $a0, $s0, $zero
  /* 134D34 80136AB4 1040001D */      beqz $v0, .L80136B2C
  /* 134D38 80136AB8 00402025 */        or $a0, $v0, $zero
  /* 134D3C 80136ABC 0C0025BB */       jal omEjectSObj
  /* 134D40 80136AC0 00000000 */       nop
  /* 134D44 80136AC4 1000001A */         b .L80136B30
  /* 134D48 80136AC8 24010009 */     addiu $at, $zero, 9
  .L80136ACC:
  /* 134D4C 80136ACC 0C04DA66 */       jal mnBattleGetArrowSObj
  /* 134D50 80136AD0 00002825 */        or $a1, $zero, $zero
  /* 134D54 80136AD4 14400015 */      bnez $v0, .L80136B2C
  /* 134D58 80136AD8 02002025 */        or $a0, $s0, $zero
  /* 134D5C 80136ADC 00134900 */       sll $t1, $s3, 4
  /* 134D60 80136AE0 01334821 */      addu $t1, $t1, $s3
  /* 134D64 80136AE4 00094880 */       sll $t1, $t1, 2
  /* 134D68 80136AE8 01334821 */      addu $t1, $t1, $s3
  /* 134D6C 80136AEC 252A0019 */     addiu $t2, $t1, 0x19
  /* 134D70 80136AF0 448A2000 */      mtc1 $t2, $f4
  /* 134D74 80136AF4 8ED90000 */        lw $t9, ($s6) # D_ovl26_8013C4A0 + 0
  /* 134D78 80136AF8 3C080001 */       lui $t0, %hi(D_NF_0000ECE8)
  /* 134D7C 80136AFC 2508ECE8 */     addiu $t0, $t0, %lo(D_NF_0000ECE8)
  /* 134D80 80136B00 03282821 */      addu $a1, $t9, $t0
  /* 134D84 80136B04 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 134D88 80136B08 46802520 */   cvt.s.w $f20, $f4
  /* 134D8C 80136B0C 944B0024 */       lhu $t3, 0x24($v0)
  /* 134D90 80136B10 E4540058 */      swc1 $f20, 0x58($v0)
  /* 134D94 80136B14 E456005C */      swc1 $f22, 0x5c($v0)
  /* 134D98 80136B18 01776824 */       and $t5, $t3, $s7
  /* 134D9C 80136B1C A44D0024 */        sh $t5, 0x24($v0)
  /* 134DA0 80136B20 35AE0001 */       ori $t6, $t5, 1
  /* 134DA4 80136B24 A44E0024 */        sh $t6, 0x24($v0)
  /* 134DA8 80136B28 AC400054 */        sw $zero, 0x54($v0)
  .L80136B2C:
  /* 134DAC 80136B2C 24010009 */     addiu $at, $zero, 9
  .L80136B30:
  /* 134DB0 80136B30 1621000A */       bne $s1, $at, .L80136B5C
  /* 134DB4 80136B34 02002025 */        or $a0, $s0, $zero
  /* 134DB8 80136B38 02002025 */        or $a0, $s0, $zero
  /* 134DBC 80136B3C 0C04DA66 */       jal mnBattleGetArrowSObj
  /* 134DC0 80136B40 02A02825 */        or $a1, $s5, $zero
  /* 134DC4 80136B44 1040001D */      beqz $v0, .L80136BBC
  /* 134DC8 80136B48 00402025 */        or $a0, $v0, $zero
  /* 134DCC 80136B4C 0C0025BB */       jal omEjectSObj
  /* 134DD0 80136B50 00000000 */       nop
  /* 134DD4 80136B54 10000019 */         b .L80136BBC
  /* 134DD8 80136B58 00000000 */       nop
  .L80136B5C:
  /* 134DDC 80136B5C 0C04DA66 */       jal mnBattleGetArrowSObj
  /* 134DE0 80136B60 02A02825 */        or $a1, $s5, $zero
  /* 134DE4 80136B64 14400015 */      bnez $v0, .L80136BBC
  /* 134DE8 80136B68 02002025 */        or $a0, $s0, $zero
  /* 134DEC 80136B6C 0013C900 */       sll $t9, $s3, 4
  /* 134DF0 80136B70 0333C821 */      addu $t9, $t9, $s3
  /* 134DF4 80136B74 0019C880 */       sll $t9, $t9, 2
  /* 134DF8 80136B78 0333C821 */      addu $t9, $t9, $s3
  /* 134DFC 80136B7C 2728004F */     addiu $t0, $t9, 0x4f
  /* 134E00 80136B80 44883000 */      mtc1 $t0, $f6
  /* 134E04 80136B84 8ECF0000 */        lw $t7, ($s6) # D_ovl26_8013C4A0 + 0
  /* 134E08 80136B88 3C180001 */       lui $t8, %hi(D_NF_0000EDC8)
  /* 134E0C 80136B8C 2718EDC8 */     addiu $t8, $t8, %lo(D_NF_0000EDC8)
  /* 134E10 80136B90 01F82821 */      addu $a1, $t7, $t8
  /* 134E14 80136B94 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 134E18 80136B98 46803520 */   cvt.s.w $f20, $f6
  /* 134E1C 80136B9C 94490024 */       lhu $t1, 0x24($v0)
  /* 134E20 80136BA0 E4540058 */      swc1 $f20, 0x58($v0)
  /* 134E24 80136BA4 E456005C */      swc1 $f22, 0x5c($v0)
  /* 134E28 80136BA8 01375824 */       and $t3, $t1, $s7
  /* 134E2C 80136BAC A44B0024 */        sh $t3, 0x24($v0)
  /* 134E30 80136BB0 356C0001 */       ori $t4, $t3, 1
  /* 134E34 80136BB4 A44C0024 */        sh $t4, 0x24($v0)
  /* 134E38 80136BB8 AC550054 */        sw $s5, 0x54($v0)
  .L80136BBC:
  /* 134E3C 80136BBC 0C002C7A */       jal gsStopCurrentProcess
  /* 134E40 80136BC0 02A02025 */        or $a0, $s5, $zero
  /* 134E44 80136BC4 1000FFA1 */         b .L80136A4C
  /* 134E48 80136BC8 2652FFFF */     addiu $s2, $s2, -1
  /* 134E4C 80136BCC 00000000 */       nop
  /* 134E50 80136BD0 00000000 */       nop
  /* 134E54 80136BD4 00000000 */       nop
  /* 134E58 80136BD8 00000000 */       nop
  /* 134E5C 80136BDC 00000000 */       nop
# Maybe start of new file
  /* 134E60 80136BE0 8FBF004C */        lw $ra, 0x4c($sp)
  /* 134E64 80136BE4 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 134E68 80136BE8 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 134E6C 80136BEC 8FB00028 */        lw $s0, 0x28($sp)
  /* 134E70 80136BF0 8FB1002C */        lw $s1, 0x2c($sp)
  /* 134E74 80136BF4 8FB20030 */        lw $s2, 0x30($sp)
  /* 134E78 80136BF8 8FB30034 */        lw $s3, 0x34($sp)
  /* 134E7C 80136BFC 8FB40038 */        lw $s4, 0x38($sp)
  /* 134E80 80136C00 8FB5003C */        lw $s5, 0x3c($sp)
  /* 134E84 80136C04 8FB60040 */        lw $s6, 0x40($sp)
  /* 134E88 80136C08 8FB70044 */        lw $s7, 0x44($sp)
  /* 134E8C 80136C0C 8FBE0048 */        lw $fp, 0x48($sp)
  /* 134E90 80136C10 03E00008 */        jr $ra
  /* 134E94 80136C14 27BD0050 */     addiu $sp, $sp, 0x50

glabel mnBattleSyncHandicapCPULevelDisplay
  /* 134E98 80136C18 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 134E9C 80136C1C AFBF0014 */        sw $ra, 0x14($sp)
  /* 134EA0 80136C20 8C850084 */        lw $a1, 0x84($a0)
  /* 134EA4 80136C24 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 134EA8 80136C28 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 134EAC 80136C2C 00057080 */       sll $t6, $a1, 2
  /* 134EB0 80136C30 01C57023 */      subu $t6, $t6, $a1
  /* 134EB4 80136C34 000E7100 */       sll $t6, $t6, 4
  /* 134EB8 80136C38 01C57023 */      subu $t6, $t6, $a1
  /* 134EBC 80136C3C 000E7080 */       sll $t6, $t6, 2
  /* 134EC0 80136C40 01CF1021 */      addu $v0, $t6, $t7
  /* 134EC4 80136C44 8C580088 */        lw $t8, 0x88($v0)
  /* 134EC8 80136C48 57000006 */      bnel $t8, $zero, .L80136C64
  /* 134ECC 80136C4C 8C990074 */        lw $t9, 0x74($a0)
  /* 134ED0 80136C50 0C04DA44 */       jal mnBattleRemoveHandicapCPULevel
  /* 134ED4 80136C54 00A02025 */        or $a0, $a1, $zero
  /* 134ED8 80136C58 10000009 */         b .L80136C80
  /* 134EDC 80136C5C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 134EE0 80136C60 8C990074 */        lw $t9, 0x74($a0)
  .L80136C64:
  /* 134EE4 80136C64 8C490084 */        lw $t1, 0x84($v0)
  /* 134EE8 80136C68 8F280054 */        lw $t0, 0x54($t9)
  /* 134EEC 80136C6C 51090004 */      beql $t0, $t1, .L80136C80
  /* 134EF0 80136C70 8FBF0014 */        lw $ra, 0x14($sp)
  /* 134EF4 80136C74 0C04DB23 */       jal mnBattleDrawHandicapCPULevel
  /* 134EF8 80136C78 00A02025 */        or $a0, $a1, $zero
  /* 134EFC 80136C7C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136C80:
  /* 134F00 80136C80 27BD0018 */     addiu $sp, $sp, 0x18
  /* 134F04 80136C84 03E00008 */        jr $ra
  /* 134F08 80136C88 00000000 */       nop

glabel mnBattleDrawHandicapCPULevel
  /* 134F0C 80136C8C 00047880 */       sll $t7, $a0, 2
  /* 134F10 80136C90 01E47823 */      subu $t7, $t7, $a0
  /* 134F14 80136C94 000F7900 */       sll $t7, $t7, 4
  /* 134F18 80136C98 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 134F1C 80136C9C 01E47823 */      subu $t7, $t7, $a0
  /* 134F20 80136CA0 3C188014 */       lui $t8, %hi(gMNBattlePanels)
  /* 134F24 80136CA4 AFB10020 */        sw $s1, 0x20($sp)
  /* 134F28 80136CA8 2718BA88 */     addiu $t8, $t8, %lo(gMNBattlePanels)
  /* 134F2C 80136CAC 000F7880 */       sll $t7, $t7, 2
  /* 134F30 80136CB0 01F88821 */      addu $s1, $t7, $t8
  /* 134F34 80136CB4 8E250020 */        lw $a1, 0x20($s1)
  /* 134F38 80136CB8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 134F3C 80136CBC AFB0001C */        sw $s0, 0x1c($sp)
  /* 134F40 80136CC0 10A00004 */      beqz $a1, .L80136CD4
  /* 134F44 80136CC4 AFA40038 */        sw $a0, 0x38($sp)
  /* 134F48 80136CC8 0C0026A1 */       jal omEjectGObj
  /* 134F4C 80136CCC 00A02025 */        or $a0, $a1, $zero
  /* 134F50 80136CD0 AE200020 */        sw $zero, 0x20($s1)
  .L80136CD4:
  /* 134F54 80136CD4 00002025 */        or $a0, $zero, $zero
  /* 134F58 80136CD8 00002825 */        or $a1, $zero, $zero
  /* 134F5C 80136CDC 2406001C */     addiu $a2, $zero, 0x1c
  /* 134F60 80136CE0 0C00265A */       jal omMakeGObjSPAfter
  /* 134F64 80136CE4 3C078000 */       lui $a3, 0x8000
  /* 134F68 80136CE8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 134F6C 80136CEC 2419FFFF */     addiu $t9, $zero, -1
  /* 134F70 80136CF0 00408025 */        or $s0, $v0, $zero
  /* 134F74 80136CF4 AE220020 */        sw $v0, 0x20($s1)
  /* 134F78 80136CF8 AFB90010 */        sw $t9, 0x10($sp)
  /* 134F7C 80136CFC 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 134F80 80136D00 00402025 */        or $a0, $v0, $zero
  /* 134F84 80136D04 24060023 */     addiu $a2, $zero, 0x23
  /* 134F88 80136D08 0C00277D */       jal omAddGObjRenderProc
  /* 134F8C 80136D0C 3C078000 */       lui $a3, 0x8000
  /* 134F90 80136D10 8FA80038 */        lw $t0, 0x38($sp)
  /* 134F94 80136D14 3C058013 */       lui $a1, %hi(mnBattleSyncHandicapCPULevelDisplay)
  /* 134F98 80136D18 24A56C18 */     addiu $a1, $a1, %lo(mnBattleSyncHandicapCPULevelDisplay)
  /* 134F9C 80136D1C 02002025 */        or $a0, $s0, $zero
  /* 134FA0 80136D20 24060001 */     addiu $a2, $zero, 1
  /* 134FA4 80136D24 24070001 */     addiu $a3, $zero, 1
  /* 134FA8 80136D28 0C002062 */       jal omAddGObjCommonProc
  /* 134FAC 80136D2C AE080084 */        sw $t0, 0x84($s0)
  /* 134FB0 80136D30 8E290084 */        lw $t1, 0x84($s1)
  /* 134FB4 80136D34 3C118014 */       lui $s1, %hi(D_ovl26_8013C4A0)
  /* 134FB8 80136D38 2631C4A0 */     addiu $s1, $s1, %lo(D_ovl26_8013C4A0)
  /* 134FBC 80136D3C 15200017 */      bnez $t1, .L80136D9C
  /* 134FC0 80136D40 02002025 */        or $a0, $s0, $zero
  /* 134FC4 80136D44 3C118014 */       lui $s1, %hi(D_ovl26_8013C4A0)
  /* 134FC8 80136D48 2631C4A0 */     addiu $s1, $s1, %lo(D_ovl26_8013C4A0)
  /* 134FCC 80136D4C 8E2A0000 */        lw $t2, ($s1) # D_ovl26_8013C4A0 + 0
  /* 134FD0 80136D50 3C0B0000 */       lui $t3, %hi(D_NF_00001108)
  /* 134FD4 80136D54 256B1108 */     addiu $t3, $t3, %lo(D_NF_00001108)
  /* 134FD8 80136D58 02002025 */        or $a0, $s0, $zero
  /* 134FDC 80136D5C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 134FE0 80136D60 014B2821 */      addu $a1, $t2, $t3
  /* 134FE4 80136D64 8FA60038 */        lw $a2, 0x38($sp)
  /* 134FE8 80136D68 00401825 */        or $v1, $v0, $zero
  /* 134FEC 80136D6C AC400054 */        sw $zero, 0x54($v0)
  /* 134FF0 80136D70 00C00821 */      addu $at, $a2, $zero
  /* 134FF4 80136D74 00063100 */       sll $a2, $a2, 4
  /* 134FF8 80136D78 00C13021 */      addu $a2, $a2, $at
  /* 134FFC 80136D7C 00063080 */       sll $a2, $a2, 2
  /* 135000 80136D80 00C13021 */      addu $a2, $a2, $at
  /* 135004 80136D84 24CC0023 */     addiu $t4, $a2, 0x23
  /* 135008 80136D88 448C2000 */      mtc1 $t4, $f4
  /* 13500C 80136D8C 00000000 */       nop
  /* 135010 80136D90 468021A0 */   cvt.s.w $f6, $f4
  /* 135014 80136D94 10000013 */         b .L80136DE4
  /* 135018 80136D98 E4460058 */      swc1 $f6, 0x58($v0)
  .L80136D9C:
  /* 13501C 80136D9C 8E2D0000 */        lw $t5, ($s1) # D_ovl26_8013C4A0 + 0
  /* 135020 80136DA0 3C0E0000 */       lui $t6, %hi(D_NF_00001218)
  /* 135024 80136DA4 25CE1218 */     addiu $t6, $t6, %lo(D_NF_00001218)
  /* 135028 80136DA8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13502C 80136DAC 01AE2821 */      addu $a1, $t5, $t6
  /* 135030 80136DB0 8FA60038 */        lw $a2, 0x38($sp)
  /* 135034 80136DB4 24180001 */     addiu $t8, $zero, 1
  /* 135038 80136DB8 00401825 */        or $v1, $v0, $zero
  /* 13503C 80136DBC 00C00821 */      addu $at, $a2, $zero
  /* 135040 80136DC0 00063100 */       sll $a2, $a2, 4
  /* 135044 80136DC4 00C13021 */      addu $a2, $a2, $at
  /* 135048 80136DC8 00063080 */       sll $a2, $a2, 2
  /* 13504C 80136DCC 00C13021 */      addu $a2, $a2, $at
  /* 135050 80136DD0 24CF0022 */     addiu $t7, $a2, 0x22
  /* 135054 80136DD4 448F4000 */      mtc1 $t7, $f8
  /* 135058 80136DD8 AC580054 */        sw $t8, 0x54($v0)
  /* 13505C 80136DDC 468042A0 */   cvt.s.w $f10, $f8
  /* 135060 80136DE0 E44A0058 */      swc1 $f10, 0x58($v0)
  .L80136DE4:
  /* 135064 80136DE4 946A0024 */       lhu $t2, 0x24($v1)
  /* 135068 80136DE8 3C014349 */       lui $at, (0x43490000 >> 16) # 201.0
  /* 13506C 80136DEC 44818000 */      mtc1 $at, $f16 # 201.0 to cop1
  /* 135070 80136DF0 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 135074 80136DF4 241900C2 */     addiu $t9, $zero, 0xc2
  /* 135078 80136DF8 240800BD */     addiu $t0, $zero, 0xbd
  /* 13507C 80136DFC 240900AD */     addiu $t1, $zero, 0xad
  /* 135080 80136E00 A46C0024 */        sh $t4, 0x24($v1)
  /* 135084 80136E04 358D0001 */       ori $t5, $t4, 1
  /* 135088 80136E08 A0790028 */        sb $t9, 0x28($v1)
  /* 13508C 80136E0C A0680029 */        sb $t0, 0x29($v1)
  /* 135090 80136E10 A069002A */        sb $t1, 0x2a($v1)
  /* 135094 80136E14 A46D0024 */        sh $t5, 0x24($v1)
  /* 135098 80136E18 E470005C */      swc1 $f16, 0x5c($v1)
  /* 13509C 80136E1C 8E2E0004 */        lw $t6, 4($s1) # D_ovl26_8013C4A0 + 4
  /* 1350A0 80136E20 3C0F0001 */       lui $t7, %hi(D_NF_0000DCF0)
  /* 1350A4 80136E24 25EFDCF0 */     addiu $t7, $t7, %lo(D_NF_0000DCF0)
  /* 1350A8 80136E28 AFA6002C */        sw $a2, 0x2c($sp)
  /* 1350AC 80136E2C 02002025 */        or $a0, $s0, $zero
  /* 1350B0 80136E30 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1350B4 80136E34 01CF2821 */      addu $a1, $t6, $t7
  /* 1350B8 80136E38 8FA6002C */        lw $a2, 0x2c($sp)
  /* 1350BC 80136E3C 94590024 */       lhu $t9, 0x24($v0)
  /* 1350C0 80136E40 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 1350C4 80136E44 24D8003D */     addiu $t8, $a2, 0x3d
  /* 1350C8 80136E48 44989000 */      mtc1 $t8, $f18
  /* 1350CC 80136E4C 44813000 */      mtc1 $at, $f6 # 202.0 to cop1
  /* 1350D0 80136E50 240300FF */     addiu $v1, $zero, 0xff
  /* 1350D4 80136E54 46809120 */   cvt.s.w $f4, $f18
  /* 1350D8 80136E58 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1350DC 80136E5C A4490024 */        sh $t1, 0x24($v0)
  /* 1350E0 80136E60 352A0001 */       ori $t2, $t1, 1
  /* 1350E4 80136E64 A0430028 */        sb $v1, 0x28($v0)
  /* 1350E8 80136E68 A0430029 */        sb $v1, 0x29($v0)
  /* 1350EC 80136E6C E4440058 */      swc1 $f4, 0x58($v0)
  /* 1350F0 80136E70 A043002A */        sb $v1, 0x2a($v0)
  /* 1350F4 80136E74 A44A0024 */        sh $t2, 0x24($v0)
  /* 1350F8 80136E78 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1350FC 80136E7C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 135100 80136E80 8FB10020 */        lw $s1, 0x20($sp)
  /* 135104 80136E84 8FB0001C */        lw $s0, 0x1c($sp)
  /* 135108 80136E88 03E00008 */        jr $ra
  /* 13510C 80136E8C 27BD0038 */     addiu $sp, $sp, 0x38

glabel func_ovl26_80136E90
  /* 135110 80136E90 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 135114 80136E94 3C0F8014 */       lui $t7, %hi(dMNBattleHandicapCPULevelNumberOffsets)
  /* 135118 80136E98 25EFB818 */     addiu $t7, $t7, %lo(dMNBattleHandicapCPULevelNumberOffsets)
  /* 13511C 80136E9C AFBF001C */        sw $ra, 0x1c($sp)
  /* 135120 80136EA0 AFA40060 */        sw $a0, 0x60($sp)
  /* 135124 80136EA4 25E80024 */     addiu $t0, $t7, 0x24
  /* 135128 80136EA8 27AE0038 */     addiu $t6, $sp, 0x38
  .L80136EAC:
  /* 13512C 80136EAC 8DF90000 */        lw $t9, ($t7) # dMNBattleHandicapCPULevelNumberOffsets + 0
  /* 135130 80136EB0 25EF000C */     addiu $t7, $t7, 0xc
  /* 135134 80136EB4 25CE000C */     addiu $t6, $t6, 0xc
  /* 135138 80136EB8 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13513C 80136EBC 8DF8FFF8 */        lw $t8, -8($t7) # dMNBattleHandicapCPULevelNumberOffsets + -8
  /* 135140 80136EC0 ADD8FFF8 */        sw $t8, -8($t6)
  /* 135144 80136EC4 8DF9FFFC */        lw $t9, -4($t7) # dMNBattleHandicapCPULevelNumberOffsets + -4
  /* 135148 80136EC8 15E8FFF8 */       bne $t7, $t0, .L80136EAC
  /* 13514C 80136ECC ADD9FFFC */        sw $t9, -4($t6)
  /* 135150 80136ED0 8DF90000 */        lw $t9, ($t7) # dMNBattleHandicapCPULevelNumberOffsets + 0
  /* 135154 80136ED4 3C0B8014 */       lui $t3, %hi(gMNBattlePanels)
  /* 135158 80136ED8 256BBA88 */     addiu $t3, $t3, %lo(gMNBattlePanels)
  /* 13515C 80136EDC ADD90000 */        sw $t9, ($t6)
  /* 135160 80136EE0 8FA90060 */        lw $t1, 0x60($sp)
  /* 135164 80136EE4 00095080 */       sll $t2, $t1, 2
  /* 135168 80136EE8 01495023 */      subu $t2, $t2, $t1
  /* 13516C 80136EEC 000A5100 */       sll $t2, $t2, 4
  /* 135170 80136EF0 01495023 */      subu $t2, $t2, $t1
  /* 135174 80136EF4 000A5080 */       sll $t2, $t2, 2
  /* 135178 80136EF8 014B1821 */      addu $v1, $t2, $t3
  /* 13517C 80136EFC 8C6C0084 */        lw $t4, 0x84($v1)
  /* 135180 80136F00 55800005 */      bnel $t4, $zero, .L80136F18
  /* 135184 80136F04 8C680038 */        lw $t0, 0x38($v1)
  /* 135188 80136F08 8C6D003C */        lw $t5, 0x3c($v1)
  /* 13518C 80136F0C 10000003 */         b .L80136F1C
  /* 135190 80136F10 AFAD002C */        sw $t5, 0x2c($sp)
  /* 135194 80136F14 8C680038 */        lw $t0, 0x38($v1)
  .L80136F18:
  /* 135198 80136F18 AFA8002C */        sw $t0, 0x2c($sp)
  .L80136F1C:
  /* 13519C 80136F1C 8C640028 */        lw $a0, 0x28($v1)
  /* 1351A0 80136F20 50800006 */      beql $a0, $zero, .L80136F3C
  /* 1351A4 80136F24 00002025 */        or $a0, $zero, $zero
  /* 1351A8 80136F28 0C0026A1 */       jal omEjectGObj
  /* 1351AC 80136F2C AFA30028 */        sw $v1, 0x28($sp)
  /* 1351B0 80136F30 8FA30028 */        lw $v1, 0x28($sp)
  /* 1351B4 80136F34 AC600028 */        sw $zero, 0x28($v1)
  /* 1351B8 80136F38 00002025 */        or $a0, $zero, $zero
  .L80136F3C:
  /* 1351BC 80136F3C 00002825 */        or $a1, $zero, $zero
  /* 1351C0 80136F40 2406001C */     addiu $a2, $zero, 0x1c
  /* 1351C4 80136F44 3C078000 */       lui $a3, 0x8000
  /* 1351C8 80136F48 0C00265A */       jal omMakeGObjSPAfter
  /* 1351CC 80136F4C AFA30028 */        sw $v1, 0x28($sp)
  /* 1351D0 80136F50 8FA30028 */        lw $v1, 0x28($sp)
  /* 1351D4 80136F54 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1351D8 80136F58 240FFFFF */     addiu $t7, $zero, -1
  /* 1351DC 80136F5C AFA20034 */        sw $v0, 0x34($sp)
  /* 1351E0 80136F60 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1351E4 80136F64 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1351E8 80136F68 00402025 */        or $a0, $v0, $zero
  /* 1351EC 80136F6C 24060023 */     addiu $a2, $zero, 0x23
  /* 1351F0 80136F70 3C078000 */       lui $a3, 0x8000
  /* 1351F4 80136F74 0C00277D */       jal omAddGObjRenderProc
  /* 1351F8 80136F78 AC620028 */        sw $v0, 0x28($v1)
  /* 1351FC 80136F7C 8FAE002C */        lw $t6, 0x2c($sp)
  /* 135200 80136F80 3C098014 */       lui $t1, %hi(D_ovl26_8013C4A4)
  /* 135204 80136F84 8D29C4A4 */        lw $t1, %lo(D_ovl26_8013C4A4)($t1)
  /* 135208 80136F88 000EC080 */       sll $t8, $t6, 2
  /* 13520C 80136F8C 03B8C821 */      addu $t9, $sp, $t8
  /* 135210 80136F90 8F390038 */        lw $t9, 0x38($t9)
  /* 135214 80136F94 8FA40034 */        lw $a0, 0x34($sp)
  /* 135218 80136F98 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13521C 80136F9C 03292821 */      addu $a1, $t9, $t1
  /* 135220 80136FA0 8FAA0060 */        lw $t2, 0x60($sp)
  /* 135224 80136FA4 944D0024 */       lhu $t5, 0x24($v0)
  /* 135228 80136FA8 3C014348 */       lui $at, (0x43480000 >> 16) # 200.0
  /* 13522C 80136FAC 000A5900 */       sll $t3, $t2, 4
  /* 135230 80136FB0 016A5821 */      addu $t3, $t3, $t2
  /* 135234 80136FB4 000B5880 */       sll $t3, $t3, 2
  /* 135238 80136FB8 016A5821 */      addu $t3, $t3, $t2
  /* 13523C 80136FBC 256C0043 */     addiu $t4, $t3, 0x43
  /* 135240 80136FC0 448C2000 */      mtc1 $t4, $f4
  /* 135244 80136FC4 44814000 */      mtc1 $at, $f8 # 200.0 to cop1
  /* 135248 80136FC8 240300FF */     addiu $v1, $zero, 0xff
  /* 13524C 80136FCC 468021A0 */   cvt.s.w $f6, $f4
  /* 135250 80136FD0 31AFFFDF */      andi $t7, $t5, 0xffdf
  /* 135254 80136FD4 A44F0024 */        sh $t7, 0x24($v0)
  /* 135258 80136FD8 35EE0001 */       ori $t6, $t7, 1
  /* 13525C 80136FDC A0430028 */        sb $v1, 0x28($v0)
  /* 135260 80136FE0 A0430029 */        sb $v1, 0x29($v0)
  /* 135264 80136FE4 E4460058 */      swc1 $f6, 0x58($v0)
  /* 135268 80136FE8 A043002A */        sb $v1, 0x2a($v0)
  /* 13526C 80136FEC A44E0024 */        sh $t6, 0x24($v0)
  /* 135270 80136FF0 E448005C */      swc1 $f8, 0x5c($v0)
  /* 135274 80136FF4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 135278 80136FF8 27BD0060 */     addiu $sp, $sp, 0x60
  /* 13527C 80136FFC 03E00008 */        jr $ra
  /* 135280 80137000 00000000 */       nop

glabel func_ovl26_80137004
  /* 135284 80137004 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 135288 80137008 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13528C 8013700C AFB00020 */        sw $s0, 0x20($sp)
  /* 135290 80137010 0C04DA31 */       jal func_ovl26_801368C4
  /* 135294 80137014 00808025 */        or $s0, $a0, $zero
  /* 135298 80137018 0C04DA44 */       jal mnBattleRemoveHandicapCPULevel
  /* 13529C 8013701C 02002025 */        or $a0, $s0, $zero
  /* 1352A0 80137020 0C04DB23 */       jal mnBattleDrawHandicapCPULevel
  /* 1352A4 80137024 02002025 */        or $a0, $s0, $zero
  /* 1352A8 80137028 0C04DC48 */       jal func_ovl26_80137120
  /* 1352AC 8013702C 00000000 */       nop
  /* 1352B0 80137030 1040000A */      beqz $v0, .L8013705C
  /* 1352B4 80137034 00107080 */       sll $t6, $s0, 2
  /* 1352B8 80137038 01D07023 */      subu $t6, $t6, $s0
  /* 1352BC 8013703C 000E7100 */       sll $t6, $t6, 4
  /* 1352C0 80137040 01D07023 */      subu $t6, $t6, $s0
  /* 1352C4 80137044 000E7080 */       sll $t6, $t6, 2
  /* 1352C8 80137048 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BB0C)
  /* 1352CC 8013704C 01EE7821 */      addu $t7, $t7, $t6
  /* 1352D0 80137050 8DEFBB0C */        lw $t7, %lo(D_ovl26_8013BB0C)($t7)
  /* 1352D4 80137054 24010001 */     addiu $at, $zero, 1
  /* 1352D8 80137058 15E10020 */       bne $t7, $at, .L801370DC
  .L8013705C:
  /* 1352DC 8013705C 0010C080 */       sll $t8, $s0, 2
  /* 1352E0 80137060 0310C023 */      subu $t8, $t8, $s0
  /* 1352E4 80137064 0018C100 */       sll $t8, $t8, 4
  /* 1352E8 80137068 0310C023 */      subu $t8, $t8, $s0
  /* 1352EC 8013706C 3C198014 */       lui $t9, %hi(gMNBattlePanels)
  /* 1352F0 80137070 2739BA88 */     addiu $t9, $t9, %lo(gMNBattlePanels)
  /* 1352F4 80137074 0018C080 */       sll $t8, $t8, 2
  /* 1352F8 80137078 03194021 */      addu $t0, $t8, $t9
  /* 1352FC 8013707C AFA80028 */        sw $t0, 0x28($sp)
  /* 135300 80137080 00002025 */        or $a0, $zero, $zero
  /* 135304 80137084 00002825 */        or $a1, $zero, $zero
  /* 135308 80137088 2406001C */     addiu $a2, $zero, 0x1c
  /* 13530C 8013708C 0C00265A */       jal omMakeGObjSPAfter
  /* 135310 80137090 3C078000 */       lui $a3, 0x8000
  /* 135314 80137094 8FA90028 */        lw $t1, 0x28($sp)
  /* 135318 80137098 AFA2002C */        sw $v0, 0x2c($sp)
  /* 13531C 8013709C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 135320 801370A0 240AFFFF */     addiu $t2, $zero, -1
  /* 135324 801370A4 AD220024 */        sw $v0, 0x24($t1)
  /* 135328 801370A8 AFAA0010 */        sw $t2, 0x10($sp)
  /* 13532C 801370AC 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 135330 801370B0 00402025 */        or $a0, $v0, $zero
  /* 135334 801370B4 24060023 */     addiu $a2, $zero, 0x23
  /* 135338 801370B8 0C00277D */       jal omAddGObjRenderProc
  /* 13533C 801370BC 3C078000 */       lui $a3, 0x8000
  /* 135340 801370C0 8FA4002C */        lw $a0, 0x2c($sp)
  /* 135344 801370C4 3C058013 */       lui $a1, %hi(mnBattleSyncAndBlinkArrows)
  /* 135348 801370C8 24A569E4 */     addiu $a1, $a1, %lo(mnBattleSyncAndBlinkArrows)
  /* 13534C 801370CC 00003025 */        or $a2, $zero, $zero
  /* 135350 801370D0 24070001 */     addiu $a3, $zero, 1
  /* 135354 801370D4 0C002062 */       jal omAddGObjCommonProc
  /* 135358 801370D8 AC900084 */        sw $s0, 0x84($a0)
  .L801370DC:
  /* 13535C 801370DC 0C04DBA4 */       jal func_ovl26_80136E90
  /* 135360 801370E0 02002025 */        or $a0, $s0, $zero
  /* 135364 801370E4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 135368 801370E8 8FB00020 */        lw $s0, 0x20($sp)
  /* 13536C 801370EC 27BD0030 */     addiu $sp, $sp, 0x30
  /* 135370 801370F0 03E00008 */        jr $ra
  /* 135374 801370F4 00000000 */       nop

glabel func_ovl26_801370F8
  /* 135378 801370F8 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x8))
  /* 13537C 801370FC 91CE4D10 */       lbu $t6, %lo((gTransferBattleState + 0x8))($t6)
  /* 135380 80137100 24010001 */     addiu $at, $zero, 1
  /* 135384 80137104 00001825 */        or $v1, $zero, $zero
  /* 135388 80137108 15C10003 */       bne $t6, $at, .L80137118
  /* 13538C 8013710C 00000000 */       nop
  /* 135390 80137110 03E00008 */        jr $ra
  /* 135394 80137114 24020001 */     addiu $v0, $zero, 1

  .L80137118:
  /* 135398 80137118 03E00008 */        jr $ra
  /* 13539C 8013711C 00601025 */        or $v0, $v1, $zero

glabel func_ovl26_80137120
  /* 1353A0 80137120 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x8))
  /* 1353A4 80137124 91CE4D10 */       lbu $t6, %lo((gTransferBattleState + 0x8))($t6)
  /* 1353A8 80137128 24010002 */     addiu $at, $zero, 2
  /* 1353AC 8013712C 00001825 */        or $v1, $zero, $zero
  /* 1353B0 80137130 15C10003 */       bne $t6, $at, .L80137140
  /* 1353B4 80137134 00000000 */       nop
  /* 1353B8 80137138 03E00008 */        jr $ra
  /* 1353BC 8013713C 24020001 */     addiu $v0, $zero, 1

  .L80137140:
  /* 1353C0 80137140 03E00008 */        jr $ra
  /* 1353C4 80137144 00601025 */        or $v0, $v1, $zero

glabel func_ovl26_80137148
  /* 1353C8 80137148 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1353CC 8013714C AFBF0014 */        sw $ra, 0x14($sp)
  /* 1353D0 80137150 0C04DC3E */       jal func_ovl26_801370F8
  /* 1353D4 80137154 00000000 */       nop
  /* 1353D8 80137158 14400005 */      bnez $v0, .L80137170
  /* 1353DC 8013715C 00000000 */       nop
  /* 1353E0 80137160 0C04DC48 */       jal func_ovl26_80137120
  /* 1353E4 80137164 00000000 */       nop
  /* 1353E8 80137168 50400004 */      beql $v0, $zero, .L8013717C
  /* 1353EC 8013716C 00001025 */        or $v0, $zero, $zero
  .L80137170:
  /* 1353F0 80137170 10000002 */         b .L8013717C
  /* 1353F4 80137174 24020001 */     addiu $v0, $zero, 1
  /* 1353F8 80137178 00001025 */        or $v0, $zero, $zero
  .L8013717C:
  /* 1353FC 8013717C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 135400 80137180 27BD0018 */     addiu $sp, $sp, 0x18
  /* 135404 80137184 03E00008 */        jr $ra
  /* 135408 80137188 00000000 */       nop

glabel mnBattleSelectChar
  /* 13540C 8013718C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 135410 80137190 AFA60028 */        sw $a2, 0x28($sp)
  /* 135414 80137194 240600BC */     addiu $a2, $zero, 0xbc
  /* 135418 80137198 00A60019 */     multu $a1, $a2
  /* 13541C 8013719C 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 135420 801371A0 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 135424 801371A4 AFA40020 */        sw $a0, 0x20($sp)
  /* 135428 801371A8 24010001 */     addiu $at, $zero, 1
  /* 13542C 801371AC 00A02025 */        or $a0, $a1, $zero
  /* 135430 801371B0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 135434 801371B4 00007012 */      mflo $t6
  /* 135438 801371B8 004E1821 */      addu $v1, $v0, $t6
  /* 13543C 801371BC 8C6F0054 */        lw $t7, 0x54($v1)
  /* 135440 801371C0 51E10004 */      beql $t7, $at, .L801371D4
  /* 135444 801371C4 8C780080 */        lw $t8, 0x80($v1)
  /* 135448 801371C8 10000016 */         b .L80137224
  /* 13544C 801371CC 00001025 */        or $v0, $zero, $zero
  /* 135450 801371D0 8C780080 */        lw $t8, 0x80($v1)
  .L801371D4:
  /* 135454 801371D4 2401001C */     addiu $at, $zero, 0x1c
  /* 135458 801371D8 00E02825 */        or $a1, $a3, $zero
  /* 13545C 801371DC 03060019 */     multu $t8, $a2
  /* 135460 801371E0 0000C812 */      mflo $t9
  /* 135464 801371E4 00594021 */      addu $t0, $v0, $t9
  /* 135468 801371E8 8D090048 */        lw $t1, 0x48($t0)
  /* 13546C 801371EC 1121000A */       beq $t1, $at, .L80137218
  /* 135470 801371F0 00000000 */       nop
  /* 135474 801371F4 0C04C71D */       jal mnBattleSelectCharWithToken
  /* 135478 801371F8 AFA30018 */        sw $v1, 0x18($sp)
  /* 13547C 801371FC 3C0A8014 */       lui $t2, %hi(gMNBattleFramesElapsed)
  /* 135480 80137200 8D4ABDCC */        lw $t2, %lo(gMNBattleFramesElapsed)($t2)
  /* 135484 80137204 8FA30018 */        lw $v1, 0x18($sp)
  /* 135488 80137208 24020001 */     addiu $v0, $zero, 1
  /* 13548C 8013720C 254B001E */     addiu $t3, $t2, 0x1e
  /* 135490 80137210 10000004 */         b .L80137224
  /* 135494 80137214 AC6B0060 */        sw $t3, 0x60($v1)
  .L80137218:
  /* 135498 80137218 0C009A70 */       jal func_800269C0
  /* 13549C 8013721C 240400A5 */     addiu $a0, $zero, 0xa5
  /* 1354A0 80137220 00001025 */        or $v0, $zero, $zero
  .L80137224:
  /* 1354A4 80137224 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1354A8 80137228 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1354AC 8013722C 03E00008 */        jr $ra
  /* 1354B0 80137230 00000000 */       nop

glabel mnBattleReorderCursorsOnPickup
  /* 1354B4 80137234 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 1354B8 80137238 3C0E8014 */       lui $t6, %hi(dMNBattleTokenPickupDisplayOrders)
  /* 1354BC 8013723C AFBF003C */        sw $ra, 0x3c($sp)
  /* 1354C0 80137240 AFBE0038 */        sw $fp, 0x38($sp)
  /* 1354C4 80137244 AFB70034 */        sw $s7, 0x34($sp)
  /* 1354C8 80137248 AFB60030 */        sw $s6, 0x30($sp)
  /* 1354CC 8013724C AFB5002C */        sw $s5, 0x2c($sp)
  /* 1354D0 80137250 AFB40028 */        sw $s4, 0x28($sp)
  /* 1354D4 80137254 AFB30024 */        sw $s3, 0x24($sp)
  /* 1354D8 80137258 AFB20020 */        sw $s2, 0x20($sp)
  /* 1354DC 8013725C AFB1001C */        sw $s1, 0x1c($sp)
  /* 1354E0 80137260 AFB00018 */        sw $s0, 0x18($sp)
  /* 1354E4 80137264 25CEB840 */     addiu $t6, $t6, %lo(dMNBattleTokenPickupDisplayOrders)
  /* 1354E8 80137268 8DD80000 */        lw $t8, ($t6) # dMNBattleTokenPickupDisplayOrders + 0
  /* 1354EC 8013726C 27B50050 */     addiu $s5, $sp, 0x50
  /* 1354F0 80137270 241400BC */     addiu $s4, $zero, 0xbc
  /* 1354F4 80137274 AEB80000 */        sw $t8, ($s5)
  /* 1354F8 80137278 00940019 */     multu $a0, $s4
  /* 1354FC 8013727C 8DCF0004 */        lw $t7, 4($t6) # dMNBattleTokenPickupDisplayOrders + 4
  /* 135500 80137280 3C138014 */       lui $s3, %hi(gMNBattlePanels)
  /* 135504 80137284 2673BA88 */     addiu $s3, $s3, %lo(gMNBattlePanels)
  /* 135508 80137288 AEAF0004 */        sw $t7, 4($s5)
  /* 13550C 8013728C 8DD80008 */        lw $t8, 8($t6) # dMNBattleTokenPickupDisplayOrders + 8
  /* 135510 80137290 00A08025 */        or $s0, $a1, $zero
  /* 135514 80137294 0080F025 */        or $fp, $a0, $zero
  /* 135518 80137298 AEB80008 */        sw $t8, 8($s5)
  /* 13551C 8013729C 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleTokenPickupDisplayOrders + 12
  /* 135520 801372A0 0000C812 */      mflo $t9
  /* 135524 801372A4 02794021 */      addu $t0, $s3, $t9
  /* 135528 801372A8 AEAF000C */        sw $t7, 0xc($s5)
  /* 13552C 801372AC 8FA6005C */        lw $a2, 0x5c($sp)
  /* 135530 801372B0 8D040000 */        lw $a0, ($t0)
  /* 135534 801372B4 0C002834 */       jal omMoveGObjDL
  /* 135538 801372B8 24050020 */     addiu $a1, $zero, 0x20
  /* 13553C 801372BC 02140019 */     multu $s0, $s4
  /* 135540 801372C0 8FA6005C */        lw $a2, 0x5c($sp)
  /* 135544 801372C4 24050020 */     addiu $a1, $zero, 0x20
  /* 135548 801372C8 24C60001 */     addiu $a2, $a2, 1
  /* 13554C 801372CC 00004812 */      mflo $t1
  /* 135550 801372D0 02695021 */      addu $t2, $s3, $t1
  /* 135554 801372D4 0C002834 */       jal omMoveGObjDL
  /* 135558 801372D8 8D440004 */        lw $a0, 4($t2)
  /* 13555C 801372DC 00008025 */        or $s0, $zero, $zero
  /* 135560 801372E0 24120003 */     addiu $s2, $zero, 3
  /* 135564 801372E4 24170004 */     addiu $s7, $zero, 4
  /* 135568 801372E8 2416FFFF */     addiu $s6, $zero, -1
  .L801372EC:
  /* 13556C 801372EC 521E001A */      beql $s0, $fp, .L80137358
  /* 135570 801372F0 26100001 */     addiu $s0, $s0, 1
  /* 135574 801372F4 02140019 */     multu $s0, $s4
  /* 135578 801372F8 00126080 */       sll $t4, $s2, 2
  /* 13557C 801372FC 02AC6821 */      addu $t5, $s5, $t4
  /* 135580 80137300 24050020 */     addiu $a1, $zero, 0x20
  /* 135584 80137304 00005812 */      mflo $t3
  /* 135588 80137308 026B8821 */      addu $s1, $s3, $t3
  /* 13558C 8013730C 8E240000 */        lw $a0, ($s1)
  /* 135590 80137310 50800004 */      beql $a0, $zero, .L80137324
  /* 135594 80137314 8E220080 */        lw $v0, 0x80($s1)
  /* 135598 80137318 0C002834 */       jal omMoveGObjDL
  /* 13559C 8013731C 8DA60000 */        lw $a2, ($t5)
  /* 1355A0 80137320 8E220080 */        lw $v0, 0x80($s1)
  .L80137324:
  /* 1355A4 80137324 52C2000C */      beql $s6, $v0, .L80137358
  /* 1355A8 80137328 26100001 */     addiu $s0, $s0, 1
  /* 1355AC 8013732C 00540019 */     multu $v0, $s4
  /* 1355B0 80137330 0012C080 */       sll $t8, $s2, 2
  /* 1355B4 80137334 02B8C821 */      addu $t9, $s5, $t8
  /* 1355B8 80137338 8F260000 */        lw $a2, ($t9)
  /* 1355BC 8013733C 24050020 */     addiu $a1, $zero, 0x20
  /* 1355C0 80137340 24C60001 */     addiu $a2, $a2, 1
  /* 1355C4 80137344 00007012 */      mflo $t6
  /* 1355C8 80137348 026E7821 */      addu $t7, $s3, $t6
  /* 1355CC 8013734C 0C002834 */       jal omMoveGObjDL
  /* 1355D0 80137350 8DE40004 */        lw $a0, 4($t7)
  /* 1355D4 80137354 26100001 */     addiu $s0, $s0, 1
  .L80137358:
  /* 1355D8 80137358 1617FFE4 */       bne $s0, $s7, .L801372EC
  /* 1355DC 8013735C 2652FFFF */     addiu $s2, $s2, -1
  /* 1355E0 80137360 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1355E4 80137364 8FB00018 */        lw $s0, 0x18($sp)
  /* 1355E8 80137368 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1355EC 8013736C 8FB20020 */        lw $s2, 0x20($sp)
  /* 1355F0 80137370 8FB30024 */        lw $s3, 0x24($sp)
  /* 1355F4 80137374 8FB40028 */        lw $s4, 0x28($sp)
  /* 1355F8 80137378 8FB5002C */        lw $s5, 0x2c($sp)
  /* 1355FC 8013737C 8FB60030 */        lw $s6, 0x30($sp)
  /* 135600 80137380 8FB70034 */        lw $s7, 0x34($sp)
  /* 135604 80137384 8FBE0038 */        lw $fp, 0x38($sp)
  /* 135608 80137388 03E00008 */        jr $ra
  /* 13560C 8013738C 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnBattleReorderCursorsOnPlacement
  /* 135610 80137390 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 135614 80137394 3C0F8014 */       lui $t7, %hi(dMNBattleTokenPlaceHeldDisplayOrders)
  /* 135618 80137398 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13561C 8013739C AFB60030 */        sw $s6, 0x30($sp)
  /* 135620 801373A0 AFB5002C */        sw $s5, 0x2c($sp)
  /* 135624 801373A4 AFB40028 */        sw $s4, 0x28($sp)
  /* 135628 801373A8 AFB30024 */        sw $s3, 0x24($sp)
  /* 13562C 801373AC AFB20020 */        sw $s2, 0x20($sp)
  /* 135630 801373B0 AFB1001C */        sw $s1, 0x1c($sp)
  /* 135634 801373B4 AFB00018 */        sw $s0, 0x18($sp)
  /* 135638 801373B8 AFA50084 */        sw $a1, 0x84($sp)
  /* 13563C 801373BC 25EFB850 */     addiu $t7, $t7, %lo(dMNBattleTokenPlaceHeldDisplayOrders)
  /* 135640 801373C0 8DF90000 */        lw $t9, ($t7) # dMNBattleTokenPlaceHeldDisplayOrders + 0
  /* 135644 801373C4 8DF80004 */        lw $t8, 4($t7) # dMNBattleTokenPlaceHeldDisplayOrders + 4
  /* 135648 801373C8 27AE0070 */     addiu $t6, $sp, 0x70
  /* 13564C 801373CC ADD90000 */        sw $t9, ($t6)
  /* 135650 801373D0 ADD80004 */        sw $t8, 4($t6)
  /* 135654 801373D4 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTokenPlaceHeldDisplayOrders + 12
  /* 135658 801373D8 8DF90008 */        lw $t9, 8($t7) # dMNBattleTokenPlaceHeldDisplayOrders + 8
  /* 13565C 801373DC 3C098014 */       lui $t1, %hi(dMNBattleTokenPlaceUnheldDisplayOrders)
  /* 135660 801373E0 2529B860 */     addiu $t1, $t1, %lo(dMNBattleTokenPlaceUnheldDisplayOrders)
  /* 135664 801373E4 ADD8000C */        sw $t8, 0xc($t6)
  /* 135668 801373E8 ADD90008 */        sw $t9, 8($t6)
  /* 13566C 801373EC 8D2A0004 */        lw $t2, 4($t1) # dMNBattleTokenPlaceUnheldDisplayOrders + 4
  /* 135670 801373F0 8D2B0000 */        lw $t3, ($t1) # dMNBattleTokenPlaceUnheldDisplayOrders + 0
  /* 135674 801373F4 27A80060 */     addiu $t0, $sp, 0x60
  /* 135678 801373F8 AD0A0004 */        sw $t2, 4($t0)
  /* 13567C 801373FC AD0B0000 */        sw $t3, ($t0)
  /* 135680 80137400 8D2B0008 */        lw $t3, 8($t1) # dMNBattleTokenPlaceUnheldDisplayOrders + 8
  /* 135684 80137404 8D2A000C */        lw $t2, 0xc($t1) # dMNBattleTokenPlaceUnheldDisplayOrders + 12
  /* 135688 80137408 0080B025 */        or $s6, $a0, $zero
  /* 13568C 8013740C 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 135690 80137410 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 135694 80137414 27A40058 */     addiu $a0, $sp, 0x58
  /* 135698 80137418 24050001 */     addiu $a1, $zero, 1
  /* 13569C 8013741C 27A20048 */     addiu $v0, $sp, 0x48
  /* 1356A0 80137420 2403FFFF */     addiu $v1, $zero, -1
  /* 1356A4 80137424 AD0B0008 */        sw $t3, 8($t0)
  /* 1356A8 80137428 AD0A000C */        sw $t2, 0xc($t0)
  .L8013742C:
  /* 1356AC 8013742C 8E2C0080 */        lw $t4, 0x80($s1) # gMNBattlePanels + 128
  /* 1356B0 80137430 546C0004 */      bnel $v1, $t4, .L80137444
  /* 1356B4 80137434 AC450000 */        sw $a1, ($v0)
  /* 1356B8 80137438 10000002 */         b .L80137444
  /* 1356BC 8013743C AC400000 */        sw $zero, ($v0)
  /* 1356C0 80137440 AC450000 */        sw $a1, ($v0)
  .L80137444:
  /* 1356C4 80137444 24420004 */     addiu $v0, $v0, 4
  /* 1356C8 80137448 0044082B */      sltu $at, $v0, $a0
  /* 1356CC 8013744C 1420FFF7 */      bnez $at, .L8013742C
  /* 1356D0 80137450 263100BC */     addiu $s1, $s1, 0xbc
  /* 1356D4 80137454 3C138014 */       lui $s3, %hi(gMNBattlePanels)
  /* 1356D8 80137458 2673BA88 */     addiu $s3, $s3, %lo(gMNBattlePanels)
  /* 1356DC 8013745C 00008025 */        or $s0, $zero, $zero
  /* 1356E0 80137460 27B2006C */     addiu $s2, $sp, 0x6c
  /* 1356E4 80137464 27B50048 */     addiu $s5, $sp, 0x48
  /* 1356E8 80137468 241400BC */     addiu $s4, $zero, 0xbc
  .L8013746C:
  /* 1356EC 8013746C 12160018 */       beq $s0, $s6, .L801374D0
  /* 1356F0 80137470 00106880 */       sll $t5, $s0, 2
  /* 1356F4 80137474 02AD7021 */      addu $t6, $s5, $t5
  /* 1356F8 80137478 8DCF0000 */        lw $t7, ($t6)
  /* 1356FC 8013747C 51E00015 */      beql $t7, $zero, .L801374D4
  /* 135700 80137480 26100001 */     addiu $s0, $s0, 1
  /* 135704 80137484 02140019 */     multu $s0, $s4
  /* 135708 80137488 24050020 */     addiu $a1, $zero, 0x20
  /* 13570C 8013748C 0000C012 */      mflo $t8
  /* 135710 80137490 02788821 */      addu $s1, $s3, $t8
  /* 135714 80137494 8E240000 */        lw $a0, ($s1) # gMNBattlePanels + 0
  /* 135718 80137498 50800004 */      beql $a0, $zero, .L801374AC
  /* 13571C 8013749C 8E390080 */        lw $t9, 0x80($s1) # gMNBattlePanels + 128
  /* 135720 801374A0 0C002834 */       jal omMoveGObjDL
  /* 135724 801374A4 8E460000 */        lw $a2, ($s2)
  /* 135728 801374A8 8E390080 */        lw $t9, 0x80($s1) # gMNBattlePanels + 128
  .L801374AC:
  /* 13572C 801374AC 8E460000 */        lw $a2, ($s2)
  /* 135730 801374B0 24050020 */     addiu $a1, $zero, 0x20
  /* 135734 801374B4 03340019 */     multu $t9, $s4
  /* 135738 801374B8 24C60001 */     addiu $a2, $a2, 1
  /* 13573C 801374BC 00004012 */      mflo $t0
  /* 135740 801374C0 02684821 */      addu $t1, $s3, $t0
  /* 135744 801374C4 0C002834 */       jal omMoveGObjDL
  /* 135748 801374C8 8D240004 */        lw $a0, 4($t1)
  /* 13574C 801374CC 2652FFFC */     addiu $s2, $s2, -4
  .L801374D0:
  /* 135750 801374D0 26100001 */     addiu $s0, $s0, 1
  .L801374D4:
  /* 135754 801374D4 2A010004 */      slti $at, $s0, 4
  /* 135758 801374D8 1420FFE4 */      bnez $at, .L8013746C
  /* 13575C 801374DC 00000000 */       nop
  /* 135760 801374E0 24110004 */     addiu $s1, $zero, 4
  /* 135764 801374E4 52D10009 */      beql $s6, $s1, .L8013750C
  /* 135768 801374E8 8FAC0084 */        lw $t4, 0x84($sp)
  /* 13576C 801374EC 02D40019 */     multu $s6, $s4
  /* 135770 801374F0 24050020 */     addiu $a1, $zero, 0x20
  /* 135774 801374F4 8E460000 */        lw $a2, ($s2)
  /* 135778 801374F8 00005012 */      mflo $t2
  /* 13577C 801374FC 026A5821 */      addu $t3, $s3, $t2
  /* 135780 80137500 0C002834 */       jal omMoveGObjDL
  /* 135784 80137504 8D640000 */        lw $a0, ($t3)
  /* 135788 80137508 8FAC0084 */        lw $t4, 0x84($sp)
  .L8013750C:
  /* 13578C 8013750C 8E460000 */        lw $a2, ($s2)
  /* 135790 80137510 24050021 */     addiu $a1, $zero, 0x21
  /* 135794 80137514 01940019 */     multu $t4, $s4
  /* 135798 80137518 24C60001 */     addiu $a2, $a2, 1
  /* 13579C 8013751C 00006812 */      mflo $t5
  /* 1357A0 80137520 026D7021 */      addu $t6, $s3, $t5
  /* 1357A4 80137524 0C002834 */       jal omMoveGObjDL
  /* 1357A8 80137528 8DC40004 */        lw $a0, 4($t6)
  /* 1357AC 8013752C 2652FFFC */     addiu $s2, $s2, -4
  /* 1357B0 80137530 00008025 */        or $s0, $zero, $zero
  .L80137534:
  /* 1357B4 80137534 1216000F */       beq $s0, $s6, .L80137574
  /* 1357B8 80137538 00107880 */       sll $t7, $s0, 2
  /* 1357BC 8013753C 02AFC021 */      addu $t8, $s5, $t7
  /* 1357C0 80137540 8F190000 */        lw $t9, ($t8)
  /* 1357C4 80137544 5720000C */      bnel $t9, $zero, .L80137578
  /* 1357C8 80137548 26100001 */     addiu $s0, $s0, 1
  /* 1357CC 8013754C 02140019 */     multu $s0, $s4
  /* 1357D0 80137550 24050020 */     addiu $a1, $zero, 0x20
  /* 1357D4 80137554 00004012 */      mflo $t0
  /* 1357D8 80137558 02684821 */      addu $t1, $s3, $t0
  /* 1357DC 8013755C 8D240000 */        lw $a0, ($t1)
  /* 1357E0 80137560 50800004 */      beql $a0, $zero, .L80137574
  /* 1357E4 80137564 2652FFFC */     addiu $s2, $s2, -4
  /* 1357E8 80137568 0C002834 */       jal omMoveGObjDL
  /* 1357EC 8013756C 8E460000 */        lw $a2, ($s2)
  /* 1357F0 80137570 2652FFFC */     addiu $s2, $s2, -4
  .L80137574:
  /* 1357F4 80137574 26100001 */     addiu $s0, $s0, 1
  .L80137578:
  /* 1357F8 80137578 1611FFEE */       bne $s0, $s1, .L80137534
  /* 1357FC 8013757C 00000000 */       nop
  /* 135800 80137580 8FBF0034 */        lw $ra, 0x34($sp)
  /* 135804 80137584 8FB00018 */        lw $s0, 0x18($sp)
  /* 135808 80137588 8FB1001C */        lw $s1, 0x1c($sp)
  /* 13580C 8013758C 8FB20020 */        lw $s2, 0x20($sp)
  /* 135810 80137590 8FB30024 */        lw $s3, 0x24($sp)
  /* 135814 80137594 8FB40028 */        lw $s4, 0x28($sp)
  /* 135818 80137598 8FB5002C */        lw $s5, 0x2c($sp)
  /* 13581C 8013759C 8FB60030 */        lw $s6, 0x30($sp)
  /* 135820 801375A0 03E00008 */        jr $ra
  /* 135824 801375A4 27BD0080 */     addiu $sp, $sp, 0x80

glabel mnBattleSetCursorCoordinatesFromToken
  /* 135828 801375A8 240600BC */     addiu $a2, $zero, 0xbc
  /* 13582C 801375AC 00860019 */     multu $a0, $a2
  /* 135830 801375B0 3C058014 */       lui $a1, %hi(gMNBattlePanels)
  /* 135834 801375B4 24A5BA88 */     addiu $a1, $a1, %lo(gMNBattlePanels)
  /* 135838 801375B8 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 13583C 801375BC 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 135840 801375C0 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 135844 801375C4 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 135848 801375C8 00007012 */      mflo $t6
  /* 13584C 801375CC 00AE1021 */      addu $v0, $a1, $t6
  /* 135850 801375D0 8C4F0080 */        lw $t7, 0x80($v0)
  /* 135854 801375D4 01E60019 */     multu $t7, $a2
  /* 135858 801375D8 0000C012 */      mflo $t8
  /* 13585C 801375DC 00B81821 */      addu $v1, $a1, $t8
  /* 135860 801375E0 8C790004 */        lw $t9, 4($v1)
  /* 135864 801375E4 8F280074 */        lw $t0, 0x74($t9)
  /* 135868 801375E8 C5040058 */      lwc1 $f4, 0x58($t0)
  /* 13586C 801375EC 46062201 */     sub.s $f8, $f4, $f6
  /* 135870 801375F0 E4480098 */      swc1 $f8, 0x98($v0)
  /* 135874 801375F4 8C690004 */        lw $t1, 4($v1)
  /* 135878 801375F8 8D2A0074 */        lw $t2, 0x74($t1)
  /* 13587C 801375FC C54A005C */      lwc1 $f10, 0x5c($t2)
  /* 135880 80137600 46105481 */     sub.s $f18, $f10, $f16
  /* 135884 80137604 03E00008 */        jr $ra
  /* 135888 80137608 E452009C */      swc1 $f18, 0x9c($v0)

glabel mnBattleHandleCursorPickup
  /* 13588C 8013760C 240600BC */     addiu $a2, $zero, 0xbc
  /* 135890 80137610 00A60019 */     multu $a1, $a2
  /* 135894 80137614 3C038014 */       lui $v1, %hi(gMNBattlePanels)
  /* 135898 80137618 2463BA88 */     addiu $v1, $v1, %lo(gMNBattlePanels)
  /* 13589C 8013761C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1358A0 80137620 AFB00018 */        sw $s0, 0x18($sp)
  /* 1358A4 80137624 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1358A8 80137628 24180001 */     addiu $t8, $zero, 1
  /* 1358AC 8013762C 00808825 */        or $s1, $a0, $zero
  /* 1358B0 80137630 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1358B4 80137634 AFB20020 */        sw $s2, 0x20($sp)
  /* 1358B8 80137638 00007012 */      mflo $t6
  /* 1358BC 8013763C 006E1021 */      addu $v0, $v1, $t6
  /* 1358C0 80137640 AC44007C */        sw $a0, 0x7c($v0)
  /* 1358C4 80137644 00860019 */     multu $a0, $a2
  /* 1358C8 80137648 AC400058 */        sw $zero, 0x58($v0)
  /* 1358CC 8013764C 00A09025 */        or $s2, $a1, $zero
  /* 1358D0 80137650 00A02025 */        or $a0, $a1, $zero
  /* 1358D4 80137654 00007812 */      mflo $t7
  /* 1358D8 80137658 006F8021 */      addu $s0, $v1, $t7
  /* 1358DC 8013765C AE180054 */        sw $t8, 0x54($s0)
  /* 1358E0 80137660 AE050080 */        sw $a1, 0x80($s0)
  /* 1358E4 80137664 0C04D84A */       jal mnBattleSyncFighterDisplay
  /* 1358E8 80137668 AC400088 */        sw $zero, 0x88($v0)
  /* 1358EC 8013766C 02202025 */        or $a0, $s1, $zero
  /* 1358F0 80137670 0C04DC8D */       jal mnBattleReorderCursorsOnPickup
  /* 1358F4 80137674 02402825 */        or $a1, $s2, $zero
  /* 1358F8 80137678 0C04DD6A */       jal mnBattleSetCursorCoordinatesFromToken
  /* 1358FC 8013767C 02202025 */        or $a0, $s1, $zero
  /* 135900 80137680 8E040000 */        lw $a0, ($s0)
  /* 135904 80137684 02202825 */        or $a1, $s1, $zero
  /* 135908 80137688 0C04D355 */       jal mnBattleRedrawCursor
  /* 13590C 8013768C 8E060054 */        lw $a2, 0x54($s0)
  /* 135910 80137690 24190001 */     addiu $t9, $zero, 1
  /* 135914 80137694 AE1900A0 */        sw $t9, 0xa0($s0)
  /* 135918 80137698 0C009A70 */       jal func_800269C0
  /* 13591C 8013769C 2404007F */     addiu $a0, $zero, 0x7f
  /* 135920 801376A0 0C04DA44 */       jal mnBattleRemoveHandicapCPULevel
  /* 135924 801376A4 02402025 */        or $a0, $s2, $zero
  /* 135928 801376A8 0C04D8E2 */       jal mnBattleRemoveWhiteSquare
  /* 13592C 801376AC 02402025 */        or $a0, $s2, $zero
  /* 135930 801376B0 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 135934 801376B4 02402025 */        or $a0, $s2, $zero
  /* 135938 801376B8 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13593C 801376BC 8FB00018 */        lw $s0, 0x18($sp)
  /* 135940 801376C0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 135944 801376C4 8FB20020 */        lw $s2, 0x20($sp)
  /* 135948 801376C8 03E00008 */        jr $ra
  /* 13594C 801376CC 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBattleCheckAndHandleTokenPickup
  /* 135950 801376D0 00057080 */       sll $t6, $a1, 2
  /* 135954 801376D4 01C57023 */      subu $t6, $t6, $a1
  /* 135958 801376D8 000E7100 */       sll $t6, $t6, 4
  /* 13595C 801376DC 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 135960 801376E0 01C57023 */      subu $t6, $t6, $a1
  /* 135964 801376E4 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 135968 801376E8 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 13596C 801376EC 000E7080 */       sll $t6, $t6, 2
  /* 135970 801376F0 01CF1021 */      addu $v0, $t6, $t7
  /* 135974 801376F4 3C188014 */       lui $t8, %hi(gMNBattleFramesElapsed)
  /* 135978 801376F8 8F18BDCC */        lw $t8, %lo(gMNBattleFramesElapsed)($t8)
  /* 13597C 801376FC 8C590060 */        lw $t9, 0x60($v0)
  /* 135980 80137700 AFB40028 */        sw $s4, 0x28($sp)
  /* 135984 80137704 AFB20020 */        sw $s2, 0x20($sp)
  /* 135988 80137708 0319082A */       slt $at, $t8, $t9
  /* 13598C 8013770C 00A09025 */        or $s2, $a1, $zero
  /* 135990 80137710 0080A025 */        or $s4, $a0, $zero
  /* 135994 80137714 AFBF0034 */        sw $ra, 0x34($sp)
  /* 135998 80137718 AFB60030 */        sw $s6, 0x30($sp)
  /* 13599C 8013771C AFB5002C */        sw $s5, 0x2c($sp)
  /* 1359A0 80137720 AFB30024 */        sw $s3, 0x24($sp)
  /* 1359A4 80137724 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1359A8 80137728 14200004 */      bnez $at, .L8013773C
  /* 1359AC 8013772C AFB00018 */        sw $s0, 0x18($sp)
  /* 1359B0 80137730 8C48005C */        lw $t0, 0x5c($v0)
  /* 1359B4 80137734 51000004 */      beql $t0, $zero, .L80137748
  /* 1359B8 80137738 8C490054 */        lw $t1, 0x54($v0)
  .L8013773C:
  /* 1359BC 8013773C 10000031 */         b .L80137804
  /* 1359C0 80137740 00001025 */        or $v0, $zero, $zero
  /* 1359C4 80137744 8C490054 */        lw $t1, 0x54($v0)
  .L80137748:
  /* 1359C8 80137748 24150002 */     addiu $s5, $zero, 2
  /* 1359CC 8013774C 24110003 */     addiu $s1, $zero, 3
  /* 1359D0 80137750 12A90003 */       beq $s5, $t1, .L80137760
  /* 1359D4 80137754 3C108014 */       lui $s0, %hi(D_ovl26_8013BCBC)
  /* 1359D8 80137758 1000002A */         b .L80137804
  /* 1359DC 8013775C 00001025 */        or $v0, $zero, $zero
  .L80137760:
  /* 1359E0 80137760 2610BCBC */     addiu $s0, $s0, %lo(D_ovl26_8013BCBC)
  /* 1359E4 80137764 24160001 */     addiu $s6, $zero, 1
  /* 1359E8 80137768 24130004 */     addiu $s3, $zero, 4
  .L8013776C:
  /* 1359EC 8013776C 56510012 */      bnel $s2, $s1, .L801377B8
  /* 1359F0 80137770 8E0C007C */        lw $t4, 0x7c($s0) # D_ovl26_8013BCBC + 124
  /* 1359F4 80137774 8E0A007C */        lw $t2, 0x7c($s0) # D_ovl26_8013BCBC + 124
  /* 1359F8 80137778 566A001F */      bnel $s3, $t2, .L801377F8
  /* 1359FC 8013777C 2631FFFF */     addiu $s1, $s1, -1
  /* 135A00 80137780 8E0B0084 */        lw $t3, 0x84($s0) # D_ovl26_8013BCBC + 132
  /* 135A04 80137784 02802025 */        or $a0, $s4, $zero
  /* 135A08 80137788 02402825 */        or $a1, $s2, $zero
  /* 135A0C 8013778C 52AB001A */      beql $s5, $t3, .L801377F8
  /* 135A10 80137790 2631FFFF */     addiu $s1, $s1, -1
  /* 135A14 80137794 0C04D6E6 */       jal mnBattleCheckTokenPickup
  /* 135A18 80137798 02203025 */        or $a2, $s1, $zero
  /* 135A1C 8013779C 10400015 */      beqz $v0, .L801377F4
  /* 135A20 801377A0 02402025 */        or $a0, $s2, $zero
  /* 135A24 801377A4 0C04DD83 */       jal mnBattleHandleCursorPickup
  /* 135A28 801377A8 02202825 */        or $a1, $s1, $zero
  /* 135A2C 801377AC 10000015 */         b .L80137804
  /* 135A30 801377B0 24020001 */     addiu $v0, $zero, 1
  /* 135A34 801377B4 8E0C007C */        lw $t4, 0x7c($s0) # D_ovl26_8013BCBC + 124
  .L801377B8:
  /* 135A38 801377B8 566C000F */      bnel $s3, $t4, .L801377F8
  /* 135A3C 801377BC 2631FFFF */     addiu $s1, $s1, -1
  /* 135A40 801377C0 8E0D0084 */        lw $t5, 0x84($s0) # D_ovl26_8013BCBC + 132
  /* 135A44 801377C4 02802025 */        or $a0, $s4, $zero
  /* 135A48 801377C8 02402825 */        or $a1, $s2, $zero
  /* 135A4C 801377CC 56CD000A */      bnel $s6, $t5, .L801377F8
  /* 135A50 801377D0 2631FFFF */     addiu $s1, $s1, -1
  /* 135A54 801377D4 0C04D6E6 */       jal mnBattleCheckTokenPickup
  /* 135A58 801377D8 02203025 */        or $a2, $s1, $zero
  /* 135A5C 801377DC 10400005 */      beqz $v0, .L801377F4
  /* 135A60 801377E0 02402025 */        or $a0, $s2, $zero
  /* 135A64 801377E4 0C04DD83 */       jal mnBattleHandleCursorPickup
  /* 135A68 801377E8 02202825 */        or $a1, $s1, $zero
  /* 135A6C 801377EC 10000005 */         b .L80137804
  /* 135A70 801377F0 24020001 */     addiu $v0, $zero, 1
  .L801377F4:
  /* 135A74 801377F4 2631FFFF */     addiu $s1, $s1, -1
  .L801377F8:
  /* 135A78 801377F8 0621FFDC */      bgez $s1, .L8013776C
  /* 135A7C 801377FC 2610FF44 */     addiu $s0, $s0, -0xbc
  /* 135A80 80137800 00001025 */        or $v0, $zero, $zero
  .L80137804:
  /* 135A84 80137804 8FBF0034 */        lw $ra, 0x34($sp)
  /* 135A88 80137808 8FB00018 */        lw $s0, 0x18($sp)
  /* 135A8C 8013780C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 135A90 80137810 8FB20020 */        lw $s2, 0x20($sp)
  /* 135A94 80137814 8FB30024 */        lw $s3, 0x24($sp)
  /* 135A98 80137818 8FB40028 */        lw $s4, 0x28($sp)
  /* 135A9C 8013781C 8FB5002C */        lw $s5, 0x2c($sp)
  /* 135AA0 80137820 8FB60030 */        lw $s6, 0x30($sp)
  /* 135AA4 80137824 03E00008 */        jr $ra
  /* 135AA8 80137828 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnBattleGetFtKindFromTokenPosition
  /* 135AAC 8013782C 00047080 */       sll $t6, $a0, 2
  /* 135AB0 80137830 01C47023 */      subu $t6, $t6, $a0
  /* 135AB4 80137834 000E7100 */       sll $t6, $t6, 4
  /* 135AB8 80137838 01C47023 */      subu $t6, $t6, $a0
  /* 135ABC 8013783C 000E7080 */       sll $t6, $t6, 2
  /* 135AC0 80137840 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BA8C)
  /* 135AC4 80137844 01EE7821 */      addu $t7, $t7, $t6
  /* 135AC8 80137848 8DEFBA8C */        lw $t7, %lo(D_ovl26_8013BA8C)($t7)
  /* 135ACC 8013784C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 135AD0 80137850 AFBF0014 */        sw $ra, 0x14($sp)
  /* 135AD4 80137854 8DE20074 */        lw $v0, 0x74($t7)
  /* 135AD8 80137858 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 135ADC 8013785C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 135AE0 80137860 00001025 */        or $v0, $zero, $zero
  /* 135AE4 80137864 4600428D */ trunc.w.s $f10, $f8
  /* 135AE8 80137868 4600218D */ trunc.w.s $f6, $f4
  /* 135AEC 8013786C 44035000 */      mfc1 $v1, $f10
  /* 135AF0 80137870 44053000 */      mfc1 $a1, $f6
  /* 135AF4 80137874 2463000C */     addiu $v1, $v1, 0xc
  /* 135AF8 80137878 28610024 */      slti $at, $v1, 0x24
  /* 135AFC 8013787C 14200006 */      bnez $at, .L80137898
  /* 135B00 80137880 24A5000D */     addiu $a1, $a1, 0xd
  /* 135B04 80137884 2861004F */      slti $at, $v1, 0x4f
  /* 135B08 80137888 10200003 */      beqz $at, .L80137898
  /* 135B0C 8013788C 00000000 */       nop
  /* 135B10 80137890 10000001 */         b .L80137898
  /* 135B14 80137894 24020001 */     addiu $v0, $zero, 1
  .L80137898:
  /* 135B18 80137898 1040001C */      beqz $v0, .L8013790C
  /* 135B1C 8013789C 28A10019 */      slti $at, $a1, 0x19
  /* 135B20 801378A0 14200006 */      bnez $at, .L801378BC
  /* 135B24 801378A4 00001025 */        or $v0, $zero, $zero
  /* 135B28 801378A8 28A10127 */      slti $at, $a1, 0x127
  /* 135B2C 801378AC 10200003 */      beqz $at, .L801378BC
  /* 135B30 801378B0 00000000 */       nop
  /* 135B34 801378B4 10000001 */         b .L801378BC
  /* 135B38 801378B8 24020001 */     addiu $v0, $zero, 1
  .L801378BC:
  /* 135B3C 801378BC 10400013 */      beqz $v0, .L8013790C
  /* 135B40 801378C0 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 135B44 801378C4 2401002D */     addiu $at, $zero, 0x2d
  /* 135B48 801378C8 0081001A */       div $zero, $a0, $at
  /* 135B4C 801378CC 00002012 */      mflo $a0
  /* 135B50 801378D0 0C04C846 */       jal mnBattleGetFtKind
  /* 135B54 801378D4 00000000 */       nop
  /* 135B58 801378D8 AFA20018 */        sw $v0, 0x18($sp)
  /* 135B5C 801378DC 0C04C7B6 */       jal mnBattleCheckFighterIsXBoxed
  /* 135B60 801378E0 00402025 */        or $a0, $v0, $zero
  /* 135B64 801378E4 14400005 */      bnez $v0, .L801378FC
  /* 135B68 801378E8 00000000 */       nop
  /* 135B6C 801378EC 0C04C811 */       jal mnBattleGetIsLocked
  /* 135B70 801378F0 8FA40018 */        lw $a0, 0x18($sp)
  /* 135B74 801378F4 10400003 */      beqz $v0, .L80137904
  /* 135B78 801378F8 00000000 */       nop
  .L801378FC:
  /* 135B7C 801378FC 1000002A */         b .L801379A8
  /* 135B80 80137900 2402001C */     addiu $v0, $zero, 0x1c
  .L80137904:
  /* 135B84 80137904 10000028 */         b .L801379A8
  /* 135B88 80137908 8FA20018 */        lw $v0, 0x18($sp)
  .L8013790C:
  /* 135B8C 8013790C 2861004F */      slti $at, $v1, 0x4f
  /* 135B90 80137910 14200006 */      bnez $at, .L8013792C
  /* 135B94 80137914 00001025 */        or $v0, $zero, $zero
  /* 135B98 80137918 2861007A */      slti $at, $v1, 0x7a
  /* 135B9C 8013791C 10200003 */      beqz $at, .L8013792C
  /* 135BA0 80137920 00000000 */       nop
  /* 135BA4 80137924 10000001 */         b .L8013792C
  /* 135BA8 80137928 24020001 */     addiu $v0, $zero, 1
  .L8013792C:
  /* 135BAC 8013792C 1040001D */      beqz $v0, .L801379A4
  /* 135BB0 80137930 28A10019 */      slti $at, $a1, 0x19
  /* 135BB4 80137934 14200006 */      bnez $at, .L80137950
  /* 135BB8 80137938 00001025 */        or $v0, $zero, $zero
  /* 135BBC 8013793C 28A10127 */      slti $at, $a1, 0x127
  /* 135BC0 80137940 10200003 */      beqz $at, .L80137950
  /* 135BC4 80137944 00000000 */       nop
  /* 135BC8 80137948 10000001 */         b .L80137950
  /* 135BCC 8013794C 24020001 */     addiu $v0, $zero, 1
  .L80137950:
  /* 135BD0 80137950 10400014 */      beqz $v0, .L801379A4
  /* 135BD4 80137954 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 135BD8 80137958 2401002D */     addiu $at, $zero, 0x2d
  /* 135BDC 8013795C 0081001A */       div $zero, $a0, $at
  /* 135BE0 80137960 00002012 */      mflo $a0
  /* 135BE4 80137964 24840006 */     addiu $a0, $a0, 6
  /* 135BE8 80137968 0C04C846 */       jal mnBattleGetFtKind
  /* 135BEC 8013796C 00000000 */       nop
  /* 135BF0 80137970 AFA20018 */        sw $v0, 0x18($sp)
  /* 135BF4 80137974 0C04C7B6 */       jal mnBattleCheckFighterIsXBoxed
  /* 135BF8 80137978 00402025 */        or $a0, $v0, $zero
  /* 135BFC 8013797C 14400005 */      bnez $v0, .L80137994
  /* 135C00 80137980 00000000 */       nop
  /* 135C04 80137984 0C04C811 */       jal mnBattleGetIsLocked
  /* 135C08 80137988 8FA40018 */        lw $a0, 0x18($sp)
  /* 135C0C 8013798C 10400003 */      beqz $v0, .L8013799C
  /* 135C10 80137990 00000000 */       nop
  .L80137994:
  /* 135C14 80137994 10000004 */         b .L801379A8
  /* 135C18 80137998 2402001C */     addiu $v0, $zero, 0x1c
  .L8013799C:
  /* 135C1C 8013799C 10000002 */         b .L801379A8
  /* 135C20 801379A0 8FA20018 */        lw $v0, 0x18($sp)
  .L801379A4:
  /* 135C24 801379A4 2402001C */     addiu $v0, $zero, 0x1c
  .L801379A8:
  /* 135C28 801379A8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 135C2C 801379AC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 135C30 801379B0 03E00008 */        jr $ra
  /* 135C34 801379B4 00000000 */       nop

glabel mnBattleAutoPositionCursor
  /* 135C38 801379B8 3C0E8014 */       lui $t6, %hi(dMNBattleCursorTypePositions2)
  /* 135C3C 801379BC 25CEB870 */     addiu $t6, $t6, %lo(dMNBattleCursorTypePositions2)
  /* 135C40 801379C0 8DD80000 */        lw $t8, ($t6) # dMNBattleCursorTypePositions2 + 0
  /* 135C44 801379C4 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 135C48 801379C8 27A9001C */     addiu $t1, $sp, 0x1c
  /* 135C4C 801379CC AD380000 */        sw $t8, ($t1)
  /* 135C50 801379D0 8DCF0004 */        lw $t7, 4($t6) # dMNBattleCursorTypePositions2 + 4
  /* 135C54 801379D4 0005C880 */       sll $t9, $a1, 2
  /* 135C58 801379D8 0325C823 */      subu $t9, $t9, $a1
  /* 135C5C 801379DC AD2F0004 */        sw $t7, 4($t1)
  /* 135C60 801379E0 8DD80008 */        lw $t8, 8($t6) # dMNBattleCursorTypePositions2 + 8
  /* 135C64 801379E4 0019C900 */       sll $t9, $t9, 4
  /* 135C68 801379E8 0325C823 */      subu $t9, $t9, $a1
  /* 135C6C 801379EC AD380008 */        sw $t8, 8($t1)
  /* 135C70 801379F0 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleCursorTypePositions2 + 12
  /* 135C74 801379F4 3C0A8014 */       lui $t2, %hi(gMNBattlePanels)
  /* 135C78 801379F8 254ABA88 */     addiu $t2, $t2, %lo(gMNBattlePanels)
  /* 135C7C 801379FC AD2F000C */        sw $t7, 0xc($t1)
  /* 135C80 80137A00 8DD80010 */        lw $t8, 0x10($t6) # dMNBattleCursorTypePositions2 + 16
  /* 135C84 80137A04 0019C880 */       sll $t9, $t9, 2
  /* 135C88 80137A08 032A1021 */      addu $v0, $t9, $t2
  /* 135C8C 80137A0C 8C4B00A0 */        lw $t3, 0xa0($v0)
  /* 135C90 80137A10 AD380010 */        sw $t8, 0x10($t1)
  /* 135C94 80137A14 8DCF0014 */        lw $t7, 0x14($t6) # dMNBattleCursorTypePositions2 + 20
  /* 135C98 80137A18 00803025 */        or $a2, $a0, $zero
  /* 135C9C 80137A1C 11600060 */      beqz $t3, .L80137BA0
  /* 135CA0 80137A20 AD2F0014 */        sw $t7, 0x14($t1)
  /* 135CA4 80137A24 8C4C0000 */        lw $t4, ($v0)
  /* 135CA8 80137A28 C4420098 */      lwc1 $f2, 0x98($v0)
  /* 135CAC 80137A2C 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 135CB0 80137A30 8D830074 */        lw $v1, 0x74($t4)
  /* 135CB4 80137A34 44817000 */      mtc1 $at, $f14 # 5.0 to cop1
  /* 135CB8 80137A38 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 135CBC 80137A3C C46C0058 */      lwc1 $f12, 0x58($v1)
  /* 135CC0 80137A40 44818000 */      mtc1 $at, $f16 # -1.0 to cop1
  /* 135CC4 80137A44 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 135CC8 80137A48 460C1101 */     sub.s $f4, $f2, $f12
  /* 135CCC 80137A4C 00002025 */        or $a0, $zero, $zero
  /* 135CD0 80137A50 460E2003 */     div.s $f0, $f4, $f14
  /* 135CD4 80137A54 4600803E */    c.le.s $f16, $f0
  /* 135CD8 80137A58 00000000 */       nop
  /* 135CDC 80137A5C 45000009 */      bc1f .L80137A84
  /* 135CE0 80137A60 00000000 */       nop
  /* 135CE4 80137A64 44813000 */      mtc1 $at, $f6 # 1.0 to cop1
  /* 135CE8 80137A68 00000000 */       nop
  /* 135CEC 80137A6C 4606003E */    c.le.s $f0, $f6
  /* 135CF0 80137A70 00000000 */       nop
  /* 135CF4 80137A74 45000003 */      bc1f .L80137A84
  /* 135CF8 80137A78 00000000 */       nop
  /* 135CFC 80137A7C 10000001 */         b .L80137A84
  /* 135D00 80137A80 24040001 */     addiu $a0, $zero, 1
  .L80137A84:
  /* 135D04 80137A84 10800003 */      beqz $a0, .L80137A94
  /* 135D08 80137A88 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 135D0C 80137A8C 10000003 */         b .L80137A9C
  /* 135D10 80137A90 E4620058 */      swc1 $f2, 0x58($v1)
  .L80137A94:
  /* 135D14 80137A94 46006200 */     add.s $f8, $f12, $f0
  /* 135D18 80137A98 E4680058 */      swc1 $f8, 0x58($v1)
  .L80137A9C:
  /* 135D1C 80137A9C 8C4D0000 */        lw $t5, ($v0)
  /* 135D20 80137AA0 C442009C */      lwc1 $f2, 0x9c($v0)
  /* 135D24 80137AA4 00002025 */        or $a0, $zero, $zero
  /* 135D28 80137AA8 8DA30074 */        lw $v1, 0x74($t5)
  /* 135D2C 80137AAC C46C005C */      lwc1 $f12, 0x5c($v1)
  /* 135D30 80137AB0 460C1281 */     sub.s $f10, $f2, $f12
  /* 135D34 80137AB4 460E5003 */     div.s $f0, $f10, $f14
  /* 135D38 80137AB8 4600803E */    c.le.s $f16, $f0
  /* 135D3C 80137ABC 00000000 */       nop
  /* 135D40 80137AC0 45000009 */      bc1f .L80137AE8
  /* 135D44 80137AC4 00000000 */       nop
  /* 135D48 80137AC8 44819000 */      mtc1 $at, $f18 # 1.0 to cop1
  /* 135D4C 80137ACC 00000000 */       nop
  /* 135D50 80137AD0 4612003E */    c.le.s $f0, $f18
  /* 135D54 80137AD4 00000000 */       nop
  /* 135D58 80137AD8 45000003 */      bc1f .L80137AE8
  /* 135D5C 80137ADC 00000000 */       nop
  /* 135D60 80137AE0 10000001 */         b .L80137AE8
  /* 135D64 80137AE4 24040001 */     addiu $a0, $zero, 1
  .L80137AE8:
  /* 135D68 80137AE8 50800004 */      beql $a0, $zero, .L80137AFC
  /* 135D6C 80137AEC 46006100 */     add.s $f4, $f12, $f0
  /* 135D70 80137AF0 10000003 */         b .L80137B00
  /* 135D74 80137AF4 E462005C */      swc1 $f2, 0x5c($v1)
  /* 135D78 80137AF8 46006100 */     add.s $f4, $f12, $f0
  .L80137AFC:
  /* 135D7C 80137AFC E464005C */      swc1 $f4, 0x5c($v1)
  .L80137B00:
  /* 135D80 80137B00 8C4E0000 */        lw $t6, ($v0)
  /* 135D84 80137B04 C4480098 */      lwc1 $f8, 0x98($v0)
  /* 135D88 80137B08 8DC30074 */        lw $v1, 0x74($t6)
  /* 135D8C 80137B0C C4660058 */      lwc1 $f6, 0x58($v1)
  /* 135D90 80137B10 46083032 */    c.eq.s $f6, $f8
  /* 135D94 80137B14 00000000 */       nop
  /* 135D98 80137B18 45020009 */     bc1fl .L80137B40
  /* 135D9C 80137B1C 8C4F0054 */        lw $t7, 0x54($v0)
  /* 135DA0 80137B20 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 135DA4 80137B24 C452009C */      lwc1 $f18, 0x9c($v0)
  /* 135DA8 80137B28 46125032 */    c.eq.s $f10, $f18
  /* 135DAC 80137B2C 00000000 */       nop
  /* 135DB0 80137B30 45020003 */     bc1fl .L80137B40
  /* 135DB4 80137B34 8C4F0054 */        lw $t7, 0x54($v0)
  /* 135DB8 80137B38 AC4000A0 */        sw $zero, 0xa0($v0)
  /* 135DBC 80137B3C 8C4F0054 */        lw $t7, 0x54($v0)
  .L80137B40:
  /* 135DC0 80137B40 8CC30074 */        lw $v1, 0x74($a2)
  /* 135DC4 80137B44 000FC0C0 */       sll $t8, $t7, 3
  /* 135DC8 80137B48 0138C821 */      addu $t9, $t1, $t8
  /* 135DCC 80137B4C 8F2A0000 */        lw $t2, ($t9)
  /* 135DD0 80137B50 C4680058 */      lwc1 $f8, 0x58($v1)
  /* 135DD4 80137B54 8C6B0008 */        lw $t3, 8($v1)
  /* 135DD8 80137B58 448A2000 */      mtc1 $t2, $f4
  /* 135DDC 80137B5C 00000000 */       nop
  /* 135DE0 80137B60 468021A0 */   cvt.s.w $f6, $f4
  /* 135DE4 80137B64 46083280 */     add.s $f10, $f6, $f8
  /* 135DE8 80137B68 E56A0058 */      swc1 $f10, 0x58($t3)
  /* 135DEC 80137B6C 8C4C0054 */        lw $t4, 0x54($v0)
  /* 135DF0 80137B70 8CC30074 */        lw $v1, 0x74($a2)
  /* 135DF4 80137B74 000C68C0 */       sll $t5, $t4, 3
  /* 135DF8 80137B78 012D7021 */      addu $t6, $t1, $t5
  /* 135DFC 80137B7C 8DCF0004 */        lw $t7, 4($t6)
  /* 135E00 80137B80 C466005C */      lwc1 $f6, 0x5c($v1)
  /* 135E04 80137B84 8C780008 */        lw $t8, 8($v1)
  /* 135E08 80137B88 448F9000 */      mtc1 $t7, $f18
  /* 135E0C 80137B8C 00000000 */       nop
  /* 135E10 80137B90 46809120 */   cvt.s.w $f4, $f18
  /* 135E14 80137B94 46062200 */     add.s $f8, $f4, $f6
  /* 135E18 80137B98 1000006A */         b .L80137D44
  /* 135E1C 80137B9C E708005C */      swc1 $f8, 0x5c($t8)
  .L80137BA0:
  /* 135E20 80137BA0 8C59005C */        lw $t9, 0x5c($v0)
  /* 135E24 80137BA4 00055080 */       sll $t2, $a1, 2
  /* 135E28 80137BA8 01455021 */      addu $t2, $t2, $a1
  /* 135E2C 80137BAC 17200065 */      bnez $t9, .L80137D44
  /* 135E30 80137BB0 000A5040 */       sll $t2, $t2, 1
  /* 135E34 80137BB4 3C0B8004 */       lui $t3, %hi(gPlayerControllers)
  /* 135E38 80137BB8 256B5228 */     addiu $t3, $t3, %lo(gPlayerControllers)
  /* 135E3C 80137BBC 014B3821 */      addu $a3, $t2, $t3
  /* 135E40 80137BC0 80E80008 */        lb $t0, 8($a3)
  /* 135E44 80137BC4 2901FFF8 */      slti $at, $t0, -8
  /* 135E48 80137BC8 14200003 */      bnez $at, .L80137BD8
  /* 135E4C 80137BCC 29010009 */      slti $at, $t0, 9
  /* 135E50 80137BD0 14200003 */      bnez $at, .L80137BE0
  /* 135E54 80137BD4 00002025 */        or $a0, $zero, $zero
  .L80137BD8:
  /* 135E58 80137BD8 10000001 */         b .L80137BE0
  /* 135E5C 80137BDC 24040001 */     addiu $a0, $zero, 1
  .L80137BE0:
  /* 135E60 80137BE0 50800028 */      beql $a0, $zero, .L80137C84
  /* 135E64 80137BE4 80E50009 */        lb $a1, 9($a3)
  /* 135E68 80137BE8 44885000 */      mtc1 $t0, $f10
  /* 135E6C 80137BEC 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 135E70 80137BF0 44812000 */      mtc1 $at, $f4 # 20.0 to cop1
  /* 135E74 80137BF4 468054A0 */   cvt.s.w $f18, $f10
  /* 135E78 80137BF8 8CC30074 */        lw $v1, 0x74($a2)
  /* 135E7C 80137BFC 44805000 */      mtc1 $zero, $f10
  /* 135E80 80137C00 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 135E84 80137C04 C4680058 */      lwc1 $f8, 0x58($v1)
  /* 135E88 80137C08 00002025 */        or $a0, $zero, $zero
  /* 135E8C 80137C0C 46049183 */     div.s $f6, $f18, $f4
  /* 135E90 80137C10 46083000 */     add.s $f0, $f6, $f8
  /* 135E94 80137C14 4600503E */    c.le.s $f10, $f0
  /* 135E98 80137C18 00000000 */       nop
  /* 135E9C 80137C1C 45000009 */      bc1f .L80137C44
  /* 135EA0 80137C20 00000000 */       nop
  /* 135EA4 80137C24 44819000 */      mtc1 $at, $f18 # 280.0 to cop1
  /* 135EA8 80137C28 00000000 */       nop
  /* 135EAC 80137C2C 4612003E */    c.le.s $f0, $f18
  /* 135EB0 80137C30 00000000 */       nop
  /* 135EB4 80137C34 45000003 */      bc1f .L80137C44
  /* 135EB8 80137C38 00000000 */       nop
  /* 135EBC 80137C3C 10000001 */         b .L80137C44
  /* 135EC0 80137C40 24040001 */     addiu $a0, $zero, 1
  .L80137C44:
  /* 135EC4 80137C44 5080000F */      beql $a0, $zero, .L80137C84
  /* 135EC8 80137C48 80E50009 */        lb $a1, 9($a3)
  /* 135ECC 80137C4C E4600058 */      swc1 $f0, 0x58($v1)
  /* 135ED0 80137C50 8C4C0054 */        lw $t4, 0x54($v0)
  /* 135ED4 80137C54 8CC30074 */        lw $v1, 0x74($a2)
  /* 135ED8 80137C58 000C68C0 */       sll $t5, $t4, 3
  /* 135EDC 80137C5C 012D7021 */      addu $t6, $t1, $t5
  /* 135EE0 80137C60 8DCF0000 */        lw $t7, ($t6)
  /* 135EE4 80137C64 C4680058 */      lwc1 $f8, 0x58($v1)
  /* 135EE8 80137C68 8C780008 */        lw $t8, 8($v1)
  /* 135EEC 80137C6C 448F2000 */      mtc1 $t7, $f4
  /* 135EF0 80137C70 00000000 */       nop
  /* 135EF4 80137C74 468021A0 */   cvt.s.w $f6, $f4
  /* 135EF8 80137C78 46083280 */     add.s $f10, $f6, $f8
  /* 135EFC 80137C7C E70A0058 */      swc1 $f10, 0x58($t8)
  /* 135F00 80137C80 80E50009 */        lb $a1, 9($a3)
  .L80137C84:
  /* 135F04 80137C84 28A1FFF8 */      slti $at, $a1, -8
  /* 135F08 80137C88 14200003 */      bnez $at, .L80137C98
  /* 135F0C 80137C8C 28A10009 */      slti $at, $a1, 9
  /* 135F10 80137C90 14200003 */      bnez $at, .L80137CA0
  /* 135F14 80137C94 00002025 */        or $a0, $zero, $zero
  .L80137C98:
  /* 135F18 80137C98 10000001 */         b .L80137CA0
  /* 135F1C 80137C9C 24040001 */     addiu $a0, $zero, 1
  .L80137CA0:
  /* 135F20 80137CA0 10800028 */      beqz $a0, .L80137D44
  /* 135F24 80137CA4 00000000 */       nop
  /* 135F28 80137CA8 44859000 */      mtc1 $a1, $f18
  /* 135F2C 80137CAC 3C01C1A0 */       lui $at, (0xC1A00000 >> 16) # -20.0
  /* 135F30 80137CB0 44813000 */      mtc1 $at, $f6 # -20.0 to cop1
  /* 135F34 80137CB4 46809120 */   cvt.s.w $f4, $f18
  /* 135F38 80137CB8 8CC30074 */        lw $v1, 0x74($a2)
  /* 135F3C 80137CBC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 135F40 80137CC0 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 135F44 80137CC4 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 135F48 80137CC8 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 135F4C 80137CCC 46062203 */     div.s $f8, $f4, $f6
  /* 135F50 80137CD0 00002025 */        or $a0, $zero, $zero
  /* 135F54 80137CD4 460A4000 */     add.s $f0, $f8, $f10
  /* 135F58 80137CD8 4600903E */    c.le.s $f18, $f0
  /* 135F5C 80137CDC 00000000 */       nop
  /* 135F60 80137CE0 45000009 */      bc1f .L80137D08
  /* 135F64 80137CE4 00000000 */       nop
  /* 135F68 80137CE8 44812000 */      mtc1 $at, $f4 # 205.0 to cop1
  /* 135F6C 80137CEC 00000000 */       nop
  /* 135F70 80137CF0 4604003E */    c.le.s $f0, $f4
  /* 135F74 80137CF4 00000000 */       nop
  /* 135F78 80137CF8 45000003 */      bc1f .L80137D08
  /* 135F7C 80137CFC 00000000 */       nop
  /* 135F80 80137D00 10000001 */         b .L80137D08
  /* 135F84 80137D04 24040001 */     addiu $a0, $zero, 1
  .L80137D08:
  /* 135F88 80137D08 1080000E */      beqz $a0, .L80137D44
  /* 135F8C 80137D0C 00000000 */       nop
  /* 135F90 80137D10 E460005C */      swc1 $f0, 0x5c($v1)
  /* 135F94 80137D14 8C590054 */        lw $t9, 0x54($v0)
  /* 135F98 80137D18 8CC30074 */        lw $v1, 0x74($a2)
  /* 135F9C 80137D1C 001950C0 */       sll $t2, $t9, 3
  /* 135FA0 80137D20 012A5821 */      addu $t3, $t1, $t2
  /* 135FA4 80137D24 8D6C0004 */        lw $t4, 4($t3) # gPlayerControllers + 4
  /* 135FA8 80137D28 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 135FAC 80137D2C 8C6D0008 */        lw $t5, 8($v1)
  /* 135FB0 80137D30 448C3000 */      mtc1 $t4, $f6
  /* 135FB4 80137D34 00000000 */       nop
  /* 135FB8 80137D38 46803220 */   cvt.s.w $f8, $f6
  /* 135FBC 80137D3C 460A4480 */     add.s $f18, $f8, $f10
  /* 135FC0 80137D40 E5B2005C */      swc1 $f18, 0x5c($t5)
  .L80137D44:
  /* 135FC4 80137D44 03E00008 */        jr $ra
  /* 135FC8 80137D48 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnBattleSyncCursorDisplay
  /* 135FCC 80137D4C 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 135FD0 80137D50 AFBF0034 */        sw $ra, 0x34($sp)
  /* 135FD4 80137D54 AFB60030 */        sw $s6, 0x30($sp)
  /* 135FD8 80137D58 AFB5002C */        sw $s5, 0x2c($sp)
  /* 135FDC 80137D5C AFB40028 */        sw $s4, 0x28($sp)
  /* 135FE0 80137D60 AFB30024 */        sw $s3, 0x24($sp)
  /* 135FE4 80137D64 AFB20020 */        sw $s2, 0x20($sp)
  /* 135FE8 80137D68 AFB1001C */        sw $s1, 0x1c($sp)
  /* 135FEC 80137D6C AFB00018 */        sw $s0, 0x18($sp)
  /* 135FF0 80137D70 8C8E0074 */        lw $t6, 0x74($a0)
  /* 135FF4 80137D74 3C0142F8 */       lui $at, (0x42F80000 >> 16) # 124.0
  /* 135FF8 80137D78 44812000 */      mtc1 $at, $f4 # 124.0 to cop1
  /* 135FFC 80137D7C C5C0005C */      lwc1 $f0, 0x5c($t6)
  /* 136000 80137D80 00A0A825 */        or $s5, $a1, $zero
  /* 136004 80137D84 00157880 */       sll $t7, $s5, 2
  /* 136008 80137D88 4600203C */    c.lt.s $f4, $f0
  /* 13600C 80137D8C 01F57823 */      subu $t7, $t7, $s5
  /* 136010 80137D90 0080B025 */        or $s6, $a0, $zero
  /* 136014 80137D94 3C014218 */       lui $at, (0x42180000 >> 16) # 38.0
  /* 136018 80137D98 4501000A */      bc1t .L80137DC4
  /* 13601C 80137D9C 000F7900 */       sll $t7, $t7, 4
  /* 136020 80137DA0 44813000 */      mtc1 $at, $f6 # 38.0 to cop1
  /* 136024 80137DA4 0015C880 */       sll $t9, $s5, 2
  /* 136028 80137DA8 0335C823 */      subu $t9, $t9, $s5
  /* 13602C 80137DAC 4606003C */    c.lt.s $f0, $f6
  /* 136030 80137DB0 0019C900 */       sll $t9, $t9, 4
  /* 136034 80137DB4 0335C823 */      subu $t9, $t9, $s5
  /* 136038 80137DB8 0019C880 */       sll $t9, $t9, 2
  /* 13603C 80137DBC 45000011 */      bc1f .L80137E04
  /* 136040 80137DC0 3C088014 */       lui $t0, 0x8014
  .L80137DC4:
  /* 136044 80137DC4 01F57823 */      subu $t7, $t7, $s5
  /* 136048 80137DC8 3C188014 */       lui $t8, %hi(gMNBattlePanels)
  /* 13604C 80137DCC 2718BA88 */     addiu $t8, $t8, %lo(gMNBattlePanels)
  /* 136050 80137DD0 000F7880 */       sll $t7, $t7, 2
  /* 136054 80137DD4 01F8A021 */      addu $s4, $t7, $t8
  /* 136058 80137DD8 8E820054 */        lw $v0, 0x54($s4)
  /* 13605C 80137DDC 02C02025 */        or $a0, $s6, $zero
  /* 136060 80137DE0 02A02825 */        or $a1, $s5, $zero
  /* 136064 80137DE4 10400005 */      beqz $v0, .L80137DFC
  /* 136068 80137DE8 00000000 */       nop
  /* 13606C 80137DEC 0C04D355 */       jal mnBattleRedrawCursor
  /* 136070 80137DF0 00003025 */        or $a2, $zero, $zero
  /* 136074 80137DF4 AE800054 */        sw $zero, 0x54($s4)
  /* 136078 80137DF8 00001025 */        or $v0, $zero, $zero
  .L80137DFC:
  /* 13607C 80137DFC 1000001B */         b .L80137E6C
  /* 136080 80137E00 24130001 */     addiu $s3, $zero, 1
  .L80137E04:
  /* 136084 80137E04 2508BA88 */     addiu $t0, $t0, -0x4578
  /* 136088 80137E08 0328A021 */      addu $s4, $t9, $t0
  /* 13608C 80137E0C 8E890080 */        lw $t1, 0x80($s4)
  /* 136090 80137E10 2401FFFF */     addiu $at, $zero, -1
  /* 136094 80137E14 5521000D */      bnel $t1, $at, .L80137E4C
  /* 136098 80137E18 8E820054 */        lw $v0, 0x54($s4)
  /* 13609C 80137E1C 8E820054 */        lw $v0, 0x54($s4)
  /* 1360A0 80137E20 24010002 */     addiu $at, $zero, 2
  /* 1360A4 80137E24 02C02025 */        or $a0, $s6, $zero
  /* 1360A8 80137E28 10410005 */       beq $v0, $at, .L80137E40
  /* 1360AC 80137E2C 02A02825 */        or $a1, $s5, $zero
  /* 1360B0 80137E30 0C04D355 */       jal mnBattleRedrawCursor
  /* 1360B4 80137E34 24060002 */     addiu $a2, $zero, 2
  /* 1360B8 80137E38 24020002 */     addiu $v0, $zero, 2
  /* 1360BC 80137E3C AE820054 */        sw $v0, 0x54($s4)
  .L80137E40:
  /* 1360C0 80137E40 1000000A */         b .L80137E6C
  /* 1360C4 80137E44 24130001 */     addiu $s3, $zero, 1
  /* 1360C8 80137E48 8E820054 */        lw $v0, 0x54($s4)
  .L80137E4C:
  /* 1360CC 80137E4C 24130001 */     addiu $s3, $zero, 1
  /* 1360D0 80137E50 02C02025 */        or $a0, $s6, $zero
  /* 1360D4 80137E54 12620005 */       beq $s3, $v0, .L80137E6C
  /* 1360D8 80137E58 02A02825 */        or $a1, $s5, $zero
  /* 1360DC 80137E5C 0C04D355 */       jal mnBattleRedrawCursor
  /* 1360E0 80137E60 02603025 */        or $a2, $s3, $zero
  /* 1360E4 80137E64 AE930054 */        sw $s3, 0x54($s4)
  /* 1360E8 80137E68 02601025 */        or $v0, $s3, $zero
  .L80137E6C:
  /* 1360EC 80137E6C 5440001A */      bnel $v0, $zero, .L80137ED8
  /* 1360F0 80137E70 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1360F4 80137E74 8E8B0058 */        lw $t3, 0x58($s4)
  /* 1360F8 80137E78 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 1360FC 80137E7C 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 136100 80137E80 11600014 */      beqz $t3, .L80137ED4
  /* 136104 80137E84 00008025 */        or $s0, $zero, $zero
  /* 136108 80137E88 24120004 */     addiu $s2, $zero, 4
  .L80137E8C:
  /* 13610C 80137E8C 8E2C0058 */        lw $t4, 0x58($s1) # gMNBattlePanels + 88
  /* 136110 80137E90 02C02025 */        or $a0, $s6, $zero
  /* 136114 80137E94 02A02825 */        or $a1, $s5, $zero
  /* 136118 80137E98 566C000C */      bnel $s3, $t4, .L80137ECC
  /* 13611C 80137E9C 26100001 */     addiu $s0, $s0, 1
  /* 136120 80137EA0 0C04D6E6 */       jal mnBattleCheckTokenPickup
  /* 136124 80137EA4 02003025 */        or $a2, $s0, $zero
  /* 136128 80137EA8 10400007 */      beqz $v0, .L80137EC8
  /* 13612C 80137EAC 02C02025 */        or $a0, $s6, $zero
  /* 136130 80137EB0 02A02825 */        or $a1, $s5, $zero
  /* 136134 80137EB4 0C04D355 */       jal mnBattleRedrawCursor
  /* 136138 80137EB8 24060002 */     addiu $a2, $zero, 2
  /* 13613C 80137EBC 240D0002 */     addiu $t5, $zero, 2
  /* 136140 80137EC0 10000004 */         b .L80137ED4
  /* 136144 80137EC4 AE8D0054 */        sw $t5, 0x54($s4)
  .L80137EC8:
  /* 136148 80137EC8 26100001 */     addiu $s0, $s0, 1
  .L80137ECC:
  /* 13614C 80137ECC 1612FFEF */       bne $s0, $s2, .L80137E8C
  /* 136150 80137ED0 263100BC */     addiu $s1, $s1, 0xbc
  .L80137ED4:
  /* 136154 80137ED4 8FBF0034 */        lw $ra, 0x34($sp)
  .L80137ED8:
  /* 136158 80137ED8 8FB00018 */        lw $s0, 0x18($sp)
  /* 13615C 80137EDC 8FB1001C */        lw $s1, 0x1c($sp)
  /* 136160 80137EE0 8FB20020 */        lw $s2, 0x20($sp)
  /* 136164 80137EE4 8FB30024 */        lw $s3, 0x24($sp)
  /* 136168 80137EE8 8FB40028 */        lw $s4, 0x28($sp)
  /* 13616C 80137EEC 8FB5002C */        lw $s5, 0x2c($sp)
  /* 136170 80137EF0 8FB60030 */        lw $s6, 0x30($sp)
  /* 136174 80137EF4 03E00008 */        jr $ra
  /* 136178 80137EF8 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnBattleTryCostumeChange
  /* 13617C 80137EFC 00047880 */       sll $t7, $a0, 2
  /* 136180 80137F00 01E47823 */      subu $t7, $t7, $a0
  /* 136184 80137F04 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 136188 80137F08 000F7900 */       sll $t7, $t7, 4
  /* 13618C 80137F0C 01E47823 */      subu $t7, $t7, $a0
  /* 136190 80137F10 3C188014 */       lui $t8, %hi(gMNBattlePanels)
  /* 136194 80137F14 AFB00018 */        sw $s0, 0x18($sp)
  /* 136198 80137F18 2718BA88 */     addiu $t8, $t8, %lo(gMNBattlePanels)
  /* 13619C 80137F1C 000F7880 */       sll $t7, $t7, 2
  /* 1361A0 80137F20 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1361A4 80137F24 AFA40028 */        sw $a0, 0x28($sp)
  /* 1361A8 80137F28 01F88021 */      addu $s0, $t7, $t8
  /* 1361AC 80137F2C 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 1361B0 80137F30 8E040048 */        lw $a0, 0x48($s0)
  /* 1361B4 80137F34 AFA20024 */        sw $v0, 0x24($sp)
  /* 1361B8 80137F38 8E040048 */        lw $a0, 0x48($s0)
  /* 1361BC 80137F3C 8FA50028 */        lw $a1, 0x28($sp)
  /* 1361C0 80137F40 0C04D19D */       jal mnBattleIsCostumeInUse
  /* 1361C4 80137F44 00403025 */        or $a2, $v0, $zero
  /* 1361C8 80137F48 10400005 */      beqz $v0, .L80137F60
  /* 1361CC 80137F4C 8FB90024 */        lw $t9, 0x24($sp)
  /* 1361D0 80137F50 0C009A70 */       jal func_800269C0
  /* 1361D4 80137F54 240400A5 */     addiu $a0, $zero, 0xa5
  /* 1361D8 80137F58 1000000C */         b .L80137F8C
  /* 1361DC 80137F5C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80137F60:
  /* 1361E0 80137F60 AE19004C */        sw $t9, 0x4c($s0)
  /* 1361E4 80137F64 0C04C6DE */       jal mnBattleGetShade
  /* 1361E8 80137F68 8FA40028 */        lw $a0, 0x28($sp)
  /* 1361EC 80137F6C AE020050 */        sw $v0, 0x50($s0)
  /* 1361F0 80137F70 8E040008 */        lw $a0, 8($s0)
  /* 1361F4 80137F74 8FA50024 */        lw $a1, 0x24($sp)
  /* 1361F8 80137F78 0C03A492 */       jal func_ovl2_800E9248
  /* 1361FC 80137F7C 00403025 */        or $a2, $v0, $zero
  /* 136200 80137F80 0C009A70 */       jal func_800269C0
  /* 136204 80137F84 240400A4 */     addiu $a0, $zero, 0xa4
  /* 136208 80137F88 8FBF001C */        lw $ra, 0x1c($sp)
  .L80137F8C:
  /* 13620C 80137F8C 8FB00018 */        lw $s0, 0x18($sp)
  /* 136210 80137F90 27BD0028 */     addiu $sp, $sp, 0x28
  /* 136214 80137F94 03E00008 */        jr $ra
  /* 136218 80137F98 00000000 */       nop

glabel mnBattleIsHumanWithCharacterSelected
  /* 13621C 80137F9C 00047080 */       sll $t6, $a0, 2
  /* 136220 80137FA0 01C47023 */      subu $t6, $t6, $a0
  /* 136224 80137FA4 000E7100 */       sll $t6, $t6, 4
  /* 136228 80137FA8 01C47023 */      subu $t6, $t6, $a0
  /* 13622C 80137FAC 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 136230 80137FB0 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 136234 80137FB4 000E7080 */       sll $t6, $t6, 2
  /* 136238 80137FB8 01CF1021 */      addu $v0, $t6, $t7
  /* 13623C 80137FBC 8C580058 */        lw $t8, 0x58($v0)
  /* 136240 80137FC0 5300000B */      beql $t8, $zero, .L80137FF0
  /* 136244 80137FC4 00001025 */        or $v0, $zero, $zero
  /* 136248 80137FC8 8C590080 */        lw $t9, 0x80($v0)
  /* 13624C 80137FCC 2401FFFF */     addiu $at, $zero, -1
  /* 136250 80137FD0 57210007 */      bnel $t9, $at, .L80137FF0
  /* 136254 80137FD4 00001025 */        or $v0, $zero, $zero
  /* 136258 80137FD8 8C480084 */        lw $t0, 0x84($v0)
  /* 13625C 80137FDC 55000004 */      bnel $t0, $zero, .L80137FF0
  /* 136260 80137FE0 00001025 */        or $v0, $zero, $zero
  /* 136264 80137FE4 03E00008 */        jr $ra
  /* 136268 80137FE8 24020001 */     addiu $v0, $zero, 1

  /* 13626C 80137FEC 00001025 */        or $v0, $zero, $zero
  .L80137FF0:
  /* 136270 80137FF0 03E00008 */        jr $ra
  /* 136274 80137FF4 00000000 */       nop

glabel mnBattleRecallToken
  /* 136278 80137FF8 00047080 */       sll $t6, $a0, 2
  /* 13627C 80137FFC 01C47023 */      subu $t6, $t6, $a0
  /* 136280 80138000 000E7100 */       sll $t6, $t6, 4
  /* 136284 80138004 01C47023 */      subu $t6, $t6, $a0
  /* 136288 80138008 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 13628C 8013800C 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 136290 80138010 000E7080 */       sll $t6, $t6, 2
  /* 136294 80138014 01CF1021 */      addu $v0, $t6, $t7
  /* 136298 80138018 8C430004 */        lw $v1, 4($v0)
  /* 13629C 8013801C 24180001 */     addiu $t8, $zero, 1
  /* 1362A0 80138020 AC400088 */        sw $zero, 0x88($v0)
  /* 1362A4 80138024 AC400058 */        sw $zero, 0x58($v0)
  /* 1362A8 80138028 AC58005C */        sw $t8, 0x5c($v0)
  /* 1362AC 8013802C AC400078 */        sw $zero, 0x78($v0)
  /* 1362B0 80138030 8C790074 */        lw $t9, 0x74($v1)
  /* 1362B4 80138034 8C450000 */        lw $a1, ($v0)
  /* 1362B8 80138038 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 1362BC 8013803C C7240058 */      lwc1 $f4, 0x58($t9)
  /* 1362C0 80138040 44810000 */      mtc1 $at, $f0 # 280.0 to cop1
  /* 1362C4 80138044 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 1362C8 80138048 E4440064 */      swc1 $f4, 0x64($v0)
  /* 1362CC 8013804C 8C680074 */        lw $t0, 0x74($v1)
  /* 1362D0 80138050 44816000 */      mtc1 $at, $f12 # 20.0 to cop1
  /* 1362D4 80138054 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1362D8 80138058 C506005C */      lwc1 $f6, 0x5c($t0)
  /* 1362DC 8013805C 44811000 */      mtc1 $at, $f2 # 10.0 to cop1
  /* 1362E0 80138060 E446006C */      swc1 $f6, 0x6c($v0)
  /* 1362E4 80138064 8CA90074 */        lw $t1, 0x74($a1)
  /* 1362E8 80138068 C5280058 */      lwc1 $f8, 0x58($t1)
  /* 1362EC 8013806C 460C4280 */     add.s $f10, $f8, $f12
  /* 1362F0 80138070 E44A0068 */      swc1 $f10, 0x68($v0)
  /* 1362F4 80138074 C4500068 */      lwc1 $f16, 0x68($v0)
  /* 1362F8 80138078 4610003C */    c.lt.s $f0, $f16
  /* 1362FC 8013807C 00000000 */       nop
  /* 136300 80138080 45020004 */     bc1fl .L80138094
  /* 136304 80138084 8CAA0074 */        lw $t2, 0x74($a1)
  /* 136308 80138088 E4400068 */      swc1 $f0, 0x68($v0)
  /* 13630C 8013808C 8C450000 */        lw $a1, ($v0)
  /* 136310 80138090 8CAA0074 */        lw $t2, 0x74($a1)
  .L80138094:
  /* 136314 80138094 3C01C170 */       lui $at, (0xC1700000 >> 16) # -15.0
  /* 136318 80138098 44812000 */      mtc1 $at, $f4 # -15.0 to cop1
  /* 13631C 8013809C C552005C */      lwc1 $f18, 0x5c($t2)
  /* 136320 801380A0 46049180 */     add.s $f6, $f18, $f4
  /* 136324 801380A4 E4460074 */      swc1 $f6, 0x74($v0)
  /* 136328 801380A8 C4400074 */      lwc1 $f0, 0x74($v0)
  /* 13632C 801380AC 4602003C */    c.lt.s $f0, $f2
  /* 136330 801380B0 00000000 */       nop
  /* 136334 801380B4 45020004 */     bc1fl .L801380C8
  /* 136338 801380B8 C442006C */      lwc1 $f2, 0x6c($v0)
  /* 13633C 801380BC E4420074 */      swc1 $f2, 0x74($v0)
  /* 136340 801380C0 C4400074 */      lwc1 $f0, 0x74($v0)
  /* 136344 801380C4 C442006C */      lwc1 $f2, 0x6c($v0)
  .L801380C8:
  /* 136348 801380C8 4602003C */    c.lt.s $f0, $f2
  /* 13634C 801380CC 00000000 */       nop
  /* 136350 801380D0 45020005 */     bc1fl .L801380E8
  /* 136354 801380D4 460C1281 */     sub.s $f10, $f2, $f12
  /* 136358 801380D8 460C0201 */     sub.s $f8, $f0, $f12
  /* 13635C 801380DC 03E00008 */        jr $ra
  /* 136360 801380E0 E4480070 */      swc1 $f8, 0x70($v0)

  /* 136364 801380E4 460C1281 */     sub.s $f10, $f2, $f12
  .L801380E8:
  /* 136368 801380E8 E44A0070 */      swc1 $f10, 0x70($v0)
  /* 13636C 801380EC 03E00008 */        jr $ra
  /* 136370 801380F0 00000000 */       nop

glabel mnBattleGoBackToVSMenu
  /* 136374 801380F4 3C02800A */       lui $v0, %hi(gSceneData)
  /* 136378 801380F8 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 13637C 801380FC 904E0000 */       lbu $t6, ($v0) # gSceneData + 0
  /* 136380 80138100 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 136384 80138104 AFBF0014 */        sw $ra, 0x14($sp)
  /* 136388 80138108 240F0009 */     addiu $t7, $zero, 9
  /* 13638C 8013810C A04F0000 */        sb $t7, ($v0) # gSceneData + 0
  /* 136390 80138110 0C04E999 */       jal mnBattleSaveMatchInfo
  /* 136394 80138114 A04E0001 */        sb $t6, 1($v0) # gSceneData + 1
  /* 136398 80138118 0C04EA2E */       jal mnBattleDestroyCursorAndTokenProcesses
  /* 13639C 8013811C 00000000 */       nop
  /* 1363A0 80138120 0C00829D */       jal func_80020A74
  /* 1363A4 80138124 00000000 */       nop
  /* 1363A8 80138128 0C00171D */       jal func_80005C74
  /* 1363AC 8013812C 00000000 */       nop
  /* 1363B0 80138130 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1363B4 80138134 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1363B8 80138138 03E00008 */        jr $ra
  /* 1363BC 8013813C 00000000 */       nop

glabel mnBattleExitIfBButtonHeld
  /* 1363C0 80138140 00047080 */       sll $t6, $a0, 2
  /* 1363C4 80138144 01C47023 */      subu $t6, $t6, $a0
  /* 1363C8 80138148 000E7100 */       sll $t6, $t6, 4
  /* 1363CC 8013814C 01C47023 */      subu $t6, $t6, $a0
  /* 1363D0 80138150 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 1363D4 80138154 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 1363D8 80138158 000E7080 */       sll $t6, $t6, 2
  /* 1363DC 8013815C 01CF1021 */      addu $v0, $t6, $t7
  /* 1363E0 80138160 8C5800B0 */        lw $t8, 0xb0($v0)
  /* 1363E4 80138164 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1363E8 80138168 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1363EC 8013816C 1300001A */      beqz $t8, .L801381D8
  /* 1363F0 80138170 00045880 */       sll $t3, $a0, 2
  /* 1363F4 80138174 8C4300B8 */        lw $v1, 0xb8($v0)
  /* 1363F8 80138178 10600023 */      beqz $v1, .L80138208
  /* 1363FC 8013817C 24790001 */     addiu $t9, $v1, 1
  /* 136400 80138180 2B210029 */      slti $at, $t9, 0x29
  /* 136404 80138184 10200020 */      beqz $at, .L80138208
  /* 136408 80138188 AC5900B8 */        sw $t9, 0xb8($v0)
  /* 13640C 8013818C 00044080 */       sll $t0, $a0, 2
  /* 136410 80138190 01044021 */      addu $t0, $t0, $a0
  /* 136414 80138194 00084040 */       sll $t0, $t0, 1
  /* 136418 80138198 3C098004 */       lui $t1, %hi(gPlayerControllers)
  /* 13641C 8013819C 01284821 */      addu $t1, $t1, $t0
  /* 136420 801381A0 95295228 */       lhu $t1, %lo(gPlayerControllers)($t1)
  /* 136424 801381A4 24010028 */     addiu $at, $zero, 0x28
  /* 136428 801381A8 312A4000 */      andi $t2, $t1, 0x4000
  /* 13642C 801381AC 51400008 */      beql $t2, $zero, .L801381D0
  /* 136430 801381B0 AC4000B0 */        sw $zero, 0xb0($v0)
  /* 136434 801381B4 57210015 */      bnel $t9, $at, .L8013820C
  /* 136438 801381B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13643C 801381BC 0C04E03D */       jal mnBattleGoBackToVSMenu
  /* 136440 801381C0 00000000 */       nop
  /* 136444 801381C4 10000011 */         b .L8013820C
  /* 136448 801381C8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13644C 801381CC AC4000B0 */        sw $zero, 0xb0($v0)
  .L801381D0:
  /* 136450 801381D0 1000000D */         b .L80138208
  /* 136454 801381D4 AC4000B8 */        sw $zero, 0xb8($v0)
  .L801381D8:
  /* 136458 801381D8 01645821 */      addu $t3, $t3, $a0
  /* 13645C 801381DC 000B5840 */       sll $t3, $t3, 1
  /* 136460 801381E0 3C0C8004 */       lui $t4, %hi(gPlayerControllers + 2)
  /* 136464 801381E4 018B6021 */      addu $t4, $t4, $t3
  /* 136468 801381E8 958C522A */       lhu $t4, %lo(gPlayerControllers + 2)($t4)
  /* 13646C 801381EC 240E0001 */     addiu $t6, $zero, 1
  /* 136470 801381F0 240F0001 */     addiu $t7, $zero, 1
  /* 136474 801381F4 318D4000 */      andi $t5, $t4, 0x4000
  /* 136478 801381F8 51A00003 */      beql $t5, $zero, .L80138208
  /* 13647C 801381FC AC4F00B8 */        sw $t7, 0xb8($v0)
  /* 136480 80138200 AC4E00B0 */        sw $t6, 0xb0($v0)
  /* 136484 80138204 AC4F00B8 */        sw $t7, 0xb8($v0)
  .L80138208:
  /* 136488 80138208 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013820C:
  /* 13648C 8013820C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 136490 80138210 03E00008 */        jr $ra
  /* 136494 80138214 00000000 */       nop

glabel mnBattleCheckBackButtonPress
  /* 136498 80138218 8C820074 */        lw $v0, 0x74($a0)
  /* 13649C 8013821C 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 1364A0 80138220 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 1364A4 80138224 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 1364A8 80138228 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 1364AC 8013822C 44814000 */      mtc1 $at, $f8 # 13.0 to cop1
  /* 1364B0 80138230 46062000 */     add.s $f0, $f4, $f6
  /* 1364B4 80138234 3C014208 */       lui $at, (0x42080000 >> 16) # 34.0
  /* 1364B8 80138238 4608003C */    c.lt.s $f0, $f8
  /* 1364BC 8013823C 00000000 */       nop
  /* 1364C0 80138240 45010007 */      bc1t .L80138260
  /* 1364C4 80138244 00000000 */       nop
  /* 1364C8 80138248 44815000 */      mtc1 $at, $f10 # 34.0 to cop1
  /* 1364CC 8013824C 00001825 */        or $v1, $zero, $zero
  /* 1364D0 80138250 4600503C */    c.lt.s $f10, $f0
  /* 1364D4 80138254 00000000 */       nop
  /* 1364D8 80138258 45000003 */      bc1f .L80138268
  /* 1364DC 8013825C 00000000 */       nop
  .L80138260:
  /* 1364E0 80138260 10000001 */         b .L80138268
  /* 1364E4 80138264 24030001 */     addiu $v1, $zero, 1
  .L80138268:
  /* 1364E8 80138268 10600003 */      beqz $v1, .L80138278
  /* 1364EC 8013826C 3C0141A0 */       lui $at, 0x41a0
  /* 1364F0 80138270 03E00008 */        jr $ra
  /* 1364F4 80138274 00001025 */        or $v0, $zero, $zero

  .L80138278:
  /* 1364F8 80138278 C4500058 */      lwc1 $f16, 0x58($v0)
  /* 1364FC 8013827C 44819000 */      mtc1 $at, $f18
  /* 136500 80138280 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 136504 80138284 44812000 */      mtc1 $at, $f4 # 244.0 to cop1
  /* 136508 80138288 46128000 */     add.s $f0, $f16, $f18
  /* 13650C 8013828C 3C014392 */       lui $at, (0x43920000 >> 16) # 292.0
  /* 136510 80138290 00001825 */        or $v1, $zero, $zero
  /* 136514 80138294 00001025 */        or $v0, $zero, $zero
  /* 136518 80138298 4600203E */    c.le.s $f4, $f0
  /* 13651C 8013829C 00000000 */       nop
  /* 136520 801382A0 45000009 */      bc1f .L801382C8
  /* 136524 801382A4 00000000 */       nop
  /* 136528 801382A8 44813000 */      mtc1 $at, $f6 # 292.0 to cop1
  /* 13652C 801382AC 00000000 */       nop
  /* 136530 801382B0 4606003E */    c.le.s $f0, $f6
  /* 136534 801382B4 00000000 */       nop
  /* 136538 801382B8 45000003 */      bc1f .L801382C8
  /* 13653C 801382BC 00000000 */       nop
  /* 136540 801382C0 10000001 */         b .L801382C8
  /* 136544 801382C4 24030001 */     addiu $v1, $zero, 1
  .L801382C8:
  /* 136548 801382C8 10600003 */      beqz $v1, .L801382D8
  /* 13654C 801382CC 00000000 */       nop
  /* 136550 801382D0 03E00008 */        jr $ra
  /* 136554 801382D4 24020001 */     addiu $v0, $zero, 1

  .L801382D8:
  /* 136558 801382D8 03E00008 */        jr $ra
  /* 13655C 801382DC 00000000 */       nop

glabel mnBattleHandleButtonPresses
  /* 136560 801382E0 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136564 801382E4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 136568 801382E8 8C850084 */        lw $a1, 0x84($a0)
  /* 13656C 801382EC AFA40040 */        sw $a0, 0x40($sp)
  /* 136570 801382F0 0C04DE6E */       jal mnBattleAutoPositionCursor
  /* 136574 801382F4 AFA50028 */        sw $a1, 0x28($sp)
  /* 136578 801382F8 8FA50028 */        lw $a1, 0x28($sp)
  /* 13657C 801382FC 3C0F8004 */       lui $t7, %hi(gPlayerControllers)
  /* 136580 80138300 25EF5228 */     addiu $t7, $t7, %lo(gPlayerControllers)
  /* 136584 80138304 00057080 */       sll $t6, $a1, 2
  /* 136588 80138308 01C57021 */      addu $t6, $t6, $a1
  /* 13658C 8013830C 000E7040 */       sll $t6, $t6, 1
  /* 136590 80138310 01CFC021 */      addu $t8, $t6, $t7
  /* 136594 80138314 AFB80024 */        sw $t8, 0x24($sp)
  /* 136598 80138318 97190002 */       lhu $t9, 2($t8)
  /* 13659C 8013831C 33288000 */      andi $t0, $t9, 0x8000
  /* 1365A0 80138320 51000072 */      beql $t0, $zero, .L801384EC
  /* 1365A4 80138324 8FA50028 */        lw $a1, 0x28($sp)
  /* 1365A8 80138328 0C04D9DB */       jal func_ovl26_8013676C
  /* 1365AC 8013832C 8FA40040 */        lw $a0, 0x40($sp)
  /* 1365B0 80138330 1440006D */      bnez $v0, .L801384E8
  /* 1365B4 80138334 8FA50028 */        lw $a1, 0x28($sp)
  /* 1365B8 80138338 00054880 */       sll $t1, $a1, 2
  /* 1365BC 8013833C 01254823 */      subu $t1, $t1, $a1
  /* 1365C0 80138340 00094900 */       sll $t1, $t1, 4
  /* 1365C4 80138344 01254823 */      subu $t1, $t1, $a1
  /* 1365C8 80138348 00094880 */       sll $t1, $t1, 2
  /* 1365CC 8013834C 3C068014 */       lui $a2, %hi(D_ovl26_8013BB08)
  /* 1365D0 80138350 00C93021 */      addu $a2, $a2, $t1
  /* 1365D4 80138354 8CC6BB08 */        lw $a2, %lo(D_ovl26_8013BB08)($a2)
  /* 1365D8 80138358 8FA40040 */        lw $a0, 0x40($sp)
  /* 1365DC 8013835C 0C04DC63 */       jal mnBattleSelectChar
  /* 1365E0 80138360 24070004 */     addiu $a3, $zero, 4
  /* 1365E4 80138364 14400060 */      bnez $v0, .L801384E8
  /* 1365E8 80138368 8FA40040 */        lw $a0, 0x40($sp)
  /* 1365EC 8013836C 0C04DDB4 */       jal mnBattleCheckAndHandleTokenPickup
  /* 1365F0 80138370 8FA50028 */        lw $a1, 0x28($sp)
  /* 1365F4 80138374 5440005D */      bnel $v0, $zero, .L801384EC
  /* 1365F8 80138378 8FA50028 */        lw $a1, 0x28($sp)
  /* 1365FC 8013837C 0C04D3D9 */       jal mnBattleCheckPickerRightArrowPress
  /* 136600 80138380 8FA40040 */        lw $a0, 0x40($sp)
  /* 136604 80138384 1040001E */      beqz $v0, .L80138400
  /* 136608 80138388 3C0A8014 */       lui $t2, %hi(gMNBattleRule)
  /* 13660C 8013838C 8D4ABDAC */        lw $t2, %lo(gMNBattleRule)($t2)
  /* 136610 80138390 24010001 */     addiu $at, $zero, 1
  /* 136614 80138394 3C028014 */       lui $v0, %hi(gMNBattleStockValue)
  /* 136618 80138398 1541000B */       bne $t2, $at, .L801383C8
  /* 13661C 8013839C 2442BD80 */     addiu $v0, $v0, %lo(gMNBattleStockValue)
  /* 136620 801383A0 3C048014 */       lui $a0, %hi(gMNBattleTimerValue)
  /* 136624 801383A4 0C04EABE */       jal mnBattleGetNextTimerValue
  /* 136628 801383A8 8C84BD7C */        lw $a0, %lo(gMNBattleTimerValue)($a0)
  /* 13662C 801383AC 3C038014 */       lui $v1, %hi(gMNBattleTimerValue)
  /* 136630 801383B0 2463BD7C */     addiu $v1, $v1, %lo(gMNBattleTimerValue)
  /* 136634 801383B4 AC620000 */        sw $v0, ($v1) # gMNBattleTimerValue + 0
  /* 136638 801383B8 0C04CFEB */       jal mnBattleDrawTimerPicker
  /* 13663C 801383BC 00402025 */        or $a0, $v0, $zero
  /* 136640 801383C0 1000000B */         b .L801383F0
  /* 136644 801383C4 00000000 */       nop
  .L801383C8:
  /* 136648 801383C8 8C430000 */        lw $v1, ($v0)
  /* 13664C 801383CC 24630001 */     addiu $v1, $v1, 1
  /* 136650 801383D0 28610063 */      slti $at, $v1, 0x63
  /* 136654 801383D4 54200004 */      bnel $at, $zero, .L801383E8
  /* 136658 801383D8 AC430000 */        sw $v1, ($v0)
  /* 13665C 801383DC 10000002 */         b .L801383E8
  /* 136660 801383E0 AC400000 */        sw $zero, ($v0)
  /* 136664 801383E4 AC430000 */        sw $v1, ($v0)
  .L801383E8:
  /* 136668 801383E8 0C04D066 */       jal func_ovl26_80134198
  /* 13666C 801383EC 8C440000 */        lw $a0, ($v0)
  .L801383F0:
  /* 136670 801383F0 0C009A70 */       jal func_800269C0
  /* 136674 801383F4 240400A4 */     addiu $a0, $zero, 0xa4
  /* 136678 801383F8 1000003C */         b .L801384EC
  /* 13667C 801383FC 8FA50028 */        lw $a1, 0x28($sp)
  .L80138400:
  /* 136680 80138400 0C04D40B */       jal mnBattleCheckPickerLeftArrowPress
  /* 136684 80138404 8FA40040 */        lw $a0, 0x40($sp)
  /* 136688 80138408 1040001F */      beqz $v0, .L80138488
  /* 13668C 8013840C 3C0B8014 */       lui $t3, %hi(gMNBattleRule)
  /* 136690 80138410 8D6BBDAC */        lw $t3, %lo(gMNBattleRule)($t3)
  /* 136694 80138414 24010001 */     addiu $at, $zero, 1
  /* 136698 80138418 3C028014 */       lui $v0, %hi(gMNBattleStockValue)
  /* 13669C 8013841C 1561000C */       bne $t3, $at, .L80138450
  /* 1366A0 80138420 2442BD80 */     addiu $v0, $v0, %lo(gMNBattleStockValue)
  /* 1366A4 80138424 3C038014 */       lui $v1, %hi(gMNBattleTimerValue)
  /* 1366A8 80138428 2463BD7C */     addiu $v1, $v1, %lo(gMNBattleTimerValue)
  /* 1366AC 8013842C 0C04EAF7 */       jal mnBattleGetPrevTimerValue
  /* 1366B0 80138430 8C640000 */        lw $a0, ($v1) # gMNBattleTimerValue + 0
  /* 1366B4 80138434 3C038014 */       lui $v1, %hi(gMNBattleTimerValue)
  /* 1366B8 80138438 2463BD7C */     addiu $v1, $v1, %lo(gMNBattleTimerValue)
  /* 1366BC 8013843C AC620000 */        sw $v0, ($v1) # gMNBattleTimerValue + 0
  /* 1366C0 80138440 0C04CFEB */       jal mnBattleDrawTimerPicker
  /* 1366C4 80138444 00402025 */        or $a0, $v0, $zero
  /* 1366C8 80138448 1000000B */         b .L80138478
  /* 1366CC 8013844C 00000000 */       nop
  .L80138450:
  /* 1366D0 80138450 8C430000 */        lw $v1, ($v0)
  /* 1366D4 80138454 240C0062 */     addiu $t4, $zero, 0x62
  /* 1366D8 80138458 2463FFFF */     addiu $v1, $v1, -1
  /* 1366DC 8013845C 04630004 */     bgezl $v1, .L80138470
  /* 1366E0 80138460 AC430000 */        sw $v1, ($v0)
  /* 1366E4 80138464 10000002 */         b .L80138470
  /* 1366E8 80138468 AC4C0000 */        sw $t4, ($v0)
  /* 1366EC 8013846C AC430000 */        sw $v1, ($v0)
  .L80138470:
  /* 1366F0 80138470 0C04D066 */       jal func_ovl26_80134198
  /* 1366F4 80138474 8C440000 */        lw $a0, ($v0)
  .L80138478:
  /* 1366F8 80138478 0C009A70 */       jal func_800269C0
  /* 1366FC 8013847C 240400A4 */     addiu $a0, $zero, 0xa4
  /* 136700 80138480 1000001A */         b .L801384EC
  /* 136704 80138484 8FA50028 */        lw $a1, 0x28($sp)
  .L80138488:
  /* 136708 80138488 0C04D49C */       jal func_ovl26_80135270
  /* 13670C 8013848C 8FA40040 */        lw $a0, 0x40($sp)
  /* 136710 80138490 10400005 */      beqz $v0, .L801384A8
  /* 136714 80138494 00000000 */       nop
  /* 136718 80138498 0C04D4CD */       jal func_ovl26_80135334
  /* 13671C 8013849C 00000000 */       nop
  /* 136720 801384A0 10000012 */         b .L801384EC
  /* 136724 801384A4 8FA50028 */        lw $a1, 0x28($sp)
  .L801384A8:
  /* 136728 801384A8 0C04E086 */       jal mnBattleCheckBackButtonPress
  /* 13672C 801384AC 8FA40040 */        lw $a0, 0x40($sp)
  /* 136730 801384B0 10400007 */      beqz $v0, .L801384D0
  /* 136734 801384B4 8FA40040 */        lw $a0, 0x40($sp)
  /* 136738 801384B8 0C04E03D */       jal mnBattleGoBackToVSMenu
  /* 13673C 801384BC 00000000 */       nop
  /* 136740 801384C0 0C009A70 */       jal func_800269C0
  /* 136744 801384C4 240400A4 */     addiu $a0, $zero, 0xa4
  /* 136748 801384C8 10000008 */         b .L801384EC
  /* 13674C 801384CC 8FA50028 */        lw $a1, 0x28($sp)
  .L801384D0:
  /* 136750 801384D0 0C04D58D */       jal func_ovl26_80135634
  /* 136754 801384D4 8FA50028 */        lw $a1, 0x28($sp)
  /* 136758 801384D8 14400003 */      bnez $v0, .L801384E8
  /* 13675C 801384DC 8FA40040 */        lw $a0, 0x40($sp)
  /* 136760 801384E0 0C04D5E9 */       jal func_ovl26_801357A4
  /* 136764 801384E4 8FA50028 */        lw $a1, 0x28($sp)
  .L801384E8:
  /* 136768 801384E8 8FA50028 */        lw $a1, 0x28($sp)
  .L801384EC:
  /* 13676C 801384EC 8FAD0024 */        lw $t5, 0x24($sp)
  /* 136770 801384F0 3C198014 */       lui $t9, %hi(gMNBattleIsTeamBattle)
  /* 136774 801384F4 00057080 */       sll $t6, $a1, 2
  /* 136778 801384F8 01C57023 */      subu $t6, $t6, $a1
  /* 13677C 801384FC 000E7100 */       sll $t6, $t6, 4
  /* 136780 80138500 8F39BDA8 */        lw $t9, %lo(gMNBattleIsTeamBattle)($t9)
  /* 136784 80138504 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 136788 80138508 01C57023 */      subu $t6, $t6, $a1
  /* 13678C 8013850C 000E7080 */       sll $t6, $t6, 2
  /* 136790 80138510 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 136794 80138514 01CFC021 */      addu $t8, $t6, $t7
  /* 136798 80138518 95A30002 */       lhu $v1, 2($t5)
  /* 13679C 8013851C 1720004C */      bnez $t9, .L80138650
  /* 1367A0 80138520 AFB8001C */        sw $t8, 0x1c($sp)
  /* 1367A4 80138524 30680008 */      andi $t0, $v1, 8
  /* 1367A8 80138528 1100000C */      beqz $t0, .L8013855C
  /* 1367AC 8013852C 8FA40040 */        lw $a0, 0x40($sp)
  /* 1367B0 80138530 8F060080 */        lw $a2, 0x80($t8)
  /* 1367B4 80138534 0C04DC63 */       jal mnBattleSelectChar
  /* 1367B8 80138538 00003825 */        or $a3, $zero, $zero
  /* 1367BC 8013853C 14400007 */      bnez $v0, .L8013855C
  /* 1367C0 80138540 8FA9001C */        lw $t1, 0x1c($sp)
  /* 1367C4 80138544 8D2A0088 */        lw $t2, 0x88($t1)
  /* 1367C8 80138548 8FA40028 */        lw $a0, 0x28($sp)
  /* 1367CC 8013854C 51400004 */      beql $t2, $zero, .L80138560
  /* 1367D0 80138550 8FAB0024 */        lw $t3, 0x24($sp)
  /* 1367D4 80138554 0C04DFBF */       jal mnBattleTryCostumeChange
  /* 1367D8 80138558 00002825 */        or $a1, $zero, $zero
  .L8013855C:
  /* 1367DC 8013855C 8FAB0024 */        lw $t3, 0x24($sp)
  .L80138560:
  /* 1367E0 80138560 8FA50028 */        lw $a1, 0x28($sp)
  /* 1367E4 80138564 8FA40040 */        lw $a0, 0x40($sp)
  /* 1367E8 80138568 956C0002 */       lhu $t4, 2($t3)
  /* 1367EC 8013856C 8FAE001C */        lw $t6, 0x1c($sp)
  /* 1367F0 80138570 24070001 */     addiu $a3, $zero, 1
  /* 1367F4 80138574 318D0001 */      andi $t5, $t4, 1
  /* 1367F8 80138578 51A0000C */      beql $t5, $zero, .L801385AC
  /* 1367FC 8013857C 8FA80024 */        lw $t0, 0x24($sp)
  /* 136800 80138580 0C04DC63 */       jal mnBattleSelectChar
  /* 136804 80138584 8DC60080 */        lw $a2, 0x80($t6)
  /* 136808 80138588 14400007 */      bnez $v0, .L801385A8
  /* 13680C 8013858C 8FAF001C */        lw $t7, 0x1c($sp)
  /* 136810 80138590 8DF90088 */        lw $t9, 0x88($t7)
  /* 136814 80138594 8FA40028 */        lw $a0, 0x28($sp)
  /* 136818 80138598 53200004 */      beql $t9, $zero, .L801385AC
  /* 13681C 8013859C 8FA80024 */        lw $t0, 0x24($sp)
  /* 136820 801385A0 0C04DFBF */       jal mnBattleTryCostumeChange
  /* 136824 801385A4 24050001 */     addiu $a1, $zero, 1
  .L801385A8:
  /* 136828 801385A8 8FA80024 */        lw $t0, 0x24($sp)
  .L801385AC:
  /* 13682C 801385AC 8FA50028 */        lw $a1, 0x28($sp)
  /* 136830 801385B0 8FA40040 */        lw $a0, 0x40($sp)
  /* 136834 801385B4 95180002 */       lhu $t8, 2($t0)
  /* 136838 801385B8 8FAA001C */        lw $t2, 0x1c($sp)
  /* 13683C 801385BC 24070002 */     addiu $a3, $zero, 2
  /* 136840 801385C0 33090004 */      andi $t1, $t8, 4
  /* 136844 801385C4 5120000C */      beql $t1, $zero, .L801385F8
  /* 136848 801385C8 8FAD0024 */        lw $t5, 0x24($sp)
  /* 13684C 801385CC 0C04DC63 */       jal mnBattleSelectChar
  /* 136850 801385D0 8D460080 */        lw $a2, 0x80($t2)
  /* 136854 801385D4 14400007 */      bnez $v0, .L801385F4
  /* 136858 801385D8 8FAB001C */        lw $t3, 0x1c($sp)
  /* 13685C 801385DC 8D6C0088 */        lw $t4, 0x88($t3)
  /* 136860 801385E0 8FA40028 */        lw $a0, 0x28($sp)
  /* 136864 801385E4 51800004 */      beql $t4, $zero, .L801385F8
  /* 136868 801385E8 8FAD0024 */        lw $t5, 0x24($sp)
  /* 13686C 801385EC 0C04DFBF */       jal mnBattleTryCostumeChange
  /* 136870 801385F0 24050002 */     addiu $a1, $zero, 2
  .L801385F4:
  /* 136874 801385F4 8FAD0024 */        lw $t5, 0x24($sp)
  .L801385F8:
  /* 136878 801385F8 8FA50028 */        lw $a1, 0x28($sp)
  /* 13687C 801385FC 8FA40040 */        lw $a0, 0x40($sp)
  /* 136880 80138600 95AE0002 */       lhu $t6, 2($t5)
  /* 136884 80138604 8FB9001C */        lw $t9, 0x1c($sp)
  /* 136888 80138608 24070003 */     addiu $a3, $zero, 3
  /* 13688C 8013860C 31CF0002 */      andi $t7, $t6, 2
  /* 136890 80138610 51E0000C */      beql $t7, $zero, .L80138644
  /* 136894 80138614 8FA90024 */        lw $t1, 0x24($sp)
  /* 136898 80138618 0C04DC63 */       jal mnBattleSelectChar
  /* 13689C 8013861C 8F260080 */        lw $a2, 0x80($t9)
  /* 1368A0 80138620 14400007 */      bnez $v0, .L80138640
  /* 1368A4 80138624 8FA8001C */        lw $t0, 0x1c($sp)
  /* 1368A8 80138628 8D180088 */        lw $t8, 0x88($t0)
  /* 1368AC 8013862C 8FA40028 */        lw $a0, 0x28($sp)
  /* 1368B0 80138630 53000004 */      beql $t8, $zero, .L80138644
  /* 1368B4 80138634 8FA90024 */        lw $t1, 0x24($sp)
  /* 1368B8 80138638 0C04DFBF */       jal mnBattleTryCostumeChange
  /* 1368BC 8013863C 24050003 */     addiu $a1, $zero, 3
  .L80138640:
  /* 1368C0 80138640 8FA90024 */        lw $t1, 0x24($sp)
  .L80138644:
  /* 1368C4 80138644 8FA50028 */        lw $a1, 0x28($sp)
  /* 1368C8 80138648 1000000B */         b .L80138678
  /* 1368CC 8013864C 95230002 */       lhu $v1, 2($t1)
  .L80138650:
  /* 1368D0 80138650 306A000F */      andi $t2, $v1, 0xf
  /* 1368D4 80138654 11400008 */      beqz $t2, .L80138678
  /* 1368D8 80138658 8FA40040 */        lw $a0, 0x40($sp)
  /* 1368DC 8013865C 8FAB001C */        lw $t3, 0x1c($sp)
  /* 1368E0 80138660 24070004 */     addiu $a3, $zero, 4
  /* 1368E4 80138664 0C04DC63 */       jal mnBattleSelectChar
  /* 1368E8 80138668 8D660080 */        lw $a2, 0x80($t3)
  /* 1368EC 8013866C 8FAC0024 */        lw $t4, 0x24($sp)
  /* 1368F0 80138670 8FA50028 */        lw $a1, 0x28($sp)
  /* 1368F4 80138674 95830002 */       lhu $v1, 2($t4)
  .L80138678:
  /* 1368F8 80138678 306D4000 */      andi $t5, $v1, 0x4000
  /* 1368FC 8013867C 51A00008 */      beql $t5, $zero, .L801386A0
  /* 136900 80138680 8FAE001C */        lw $t6, 0x1c($sp)
  /* 136904 80138684 0C04DFE7 */       jal mnBattleIsHumanWithCharacterSelected
  /* 136908 80138688 00A02025 */        or $a0, $a1, $zero
  /* 13690C 8013868C 50400004 */      beql $v0, $zero, .L801386A0
  /* 136910 80138690 8FAE001C */        lw $t6, 0x1c($sp)
  /* 136914 80138694 0C04DFFE */       jal mnBattleRecallToken
  /* 136918 80138698 8FA40028 */        lw $a0, 0x28($sp)
  /* 13691C 8013869C 8FAE001C */        lw $t6, 0x1c($sp)
  .L801386A0:
  /* 136920 801386A0 8FA50028 */        lw $a1, 0x28($sp)
  /* 136924 801386A4 8DC2005C */        lw $v0, 0x5c($t6)
  /* 136928 801386A8 14400006 */      bnez $v0, .L801386C4
  /* 13692C 801386AC 00000000 */       nop
  /* 136930 801386B0 0C04E050 */       jal mnBattleExitIfBButtonHeld
  /* 136934 801386B4 00A02025 */        or $a0, $a1, $zero
  /* 136938 801386B8 8FAF001C */        lw $t7, 0x1c($sp)
  /* 13693C 801386BC 8FA50028 */        lw $a1, 0x28($sp)
  /* 136940 801386C0 8DE2005C */        lw $v0, 0x5c($t7)
  .L801386C4:
  /* 136944 801386C4 54400004 */      bnel $v0, $zero, .L801386D8
  /* 136948 801386C8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13694C 801386CC 0C04DF53 */       jal mnBattleSyncCursorDisplay
  /* 136950 801386D0 8FA40040 */        lw $a0, 0x40($sp)
  /* 136954 801386D4 8FBF0014 */        lw $ra, 0x14($sp)
  .L801386D8:
  /* 136958 801386D8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13695C 801386DC 03E00008 */        jr $ra
  /* 136960 801386E0 00000000 */       nop

glabel mnBattleRedrawToken
  /* 136964 801386E4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136968 801386E8 3C0F8014 */       lui $t7, %hi(dMNBattleTokenOffsets)
  /* 13696C 801386EC AFBF0014 */        sw $ra, 0x14($sp)
  /* 136970 801386F0 AFA50044 */        sw $a1, 0x44($sp)
  /* 136974 801386F4 25EFB888 */     addiu $t7, $t7, %lo(dMNBattleTokenOffsets)
  /* 136978 801386F8 8DF90000 */        lw $t9, ($t7) # dMNBattleTokenOffsets + 0
  /* 13697C 801386FC 27AE0020 */     addiu $t6, $sp, 0x20
  /* 136980 80138700 8DF80004 */        lw $t8, 4($t7) # dMNBattleTokenOffsets + 4
  /* 136984 80138704 ADD90000 */        sw $t9, ($t6)
  /* 136988 80138708 8DF90008 */        lw $t9, 8($t7) # dMNBattleTokenOffsets + 8
  /* 13698C 8013870C ADD80004 */        sw $t8, 4($t6)
  /* 136990 80138710 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTokenOffsets + 12
  /* 136994 80138714 ADD90008 */        sw $t9, 8($t6)
  /* 136998 80138718 8DF90010 */        lw $t9, 0x10($t7) # dMNBattleTokenOffsets + 16
  /* 13699C 8013871C ADD8000C */        sw $t8, 0xc($t6)
  /* 1369A0 80138720 ADD90010 */        sw $t9, 0x10($t6)
  /* 1369A4 80138724 8C820074 */        lw $v0, 0x74($a0)
  /* 1369A8 80138728 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 1369AC 8013872C E7A40038 */      swc1 $f4, 0x38($sp)
  /* 1369B0 80138730 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 1369B4 80138734 AFA40040 */        sw $a0, 0x40($sp)
  /* 1369B8 80138738 0C002DD8 */       jal func_8000B760
  /* 1369BC 8013873C E7A60034 */      swc1 $f6, 0x34($sp)
  /* 1369C0 80138740 8FA80044 */        lw $t0, 0x44($sp)
  /* 1369C4 80138744 3C0B8014 */       lui $t3, %hi(D_ovl26_8013C4A0)
  /* 1369C8 80138748 8D6BC4A0 */        lw $t3, %lo(D_ovl26_8013C4A0)($t3)
  /* 1369CC 8013874C 00084880 */       sll $t1, $t0, 2
  /* 1369D0 80138750 03A95021 */      addu $t2, $sp, $t1
  /* 1369D4 80138754 8D4A0020 */        lw $t2, 0x20($t2)
  /* 1369D8 80138758 8FA40040 */        lw $a0, 0x40($sp)
  /* 1369DC 8013875C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1369E0 80138760 014B2821 */      addu $a1, $t2, $t3
  /* 1369E4 80138764 C7A80038 */      lwc1 $f8, 0x38($sp)
  /* 1369E8 80138768 944C0024 */       lhu $t4, 0x24($v0)
  /* 1369EC 8013876C E4480058 */      swc1 $f8, 0x58($v0)
  /* 1369F0 80138770 C7AA0034 */      lwc1 $f10, 0x34($sp)
  /* 1369F4 80138774 318EFFDF */      andi $t6, $t4, 0xffdf
  /* 1369F8 80138778 A44E0024 */        sh $t6, 0x24($v0)
  /* 1369FC 8013877C 35CF0001 */       ori $t7, $t6, 1
  /* 136A00 80138780 A44F0024 */        sh $t7, 0x24($v0)
  /* 136A04 80138784 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 136A08 80138788 8FBF0014 */        lw $ra, 0x14($sp)
  /* 136A0C 8013878C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 136A10 80138790 03E00008 */        jr $ra
  /* 136A14 80138794 00000000 */       nop

glabel mnBattleCenterTokenInPortrait
  /* 136A18 80138798 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 136A1C 8013879C AFBF0014 */        sw $ra, 0x14($sp)
  /* 136A20 801387A0 00803025 */        or $a2, $a0, $zero
  /* 136A24 801387A4 AFA60018 */        sw $a2, 0x18($sp)
  /* 136A28 801387A8 0C04C85A */       jal mnBattleGetPortraitId
  /* 136A2C 801387AC 00A02025 */        or $a0, $a1, $zero
  /* 136A30 801387B0 28410006 */      slti $at, $v0, 6
  /* 136A34 801387B4 14200011 */      bnez $at, .L801387FC
  /* 136A38 801387B8 8FA60018 */        lw $a2, 0x18($sp)
  /* 136A3C 801387BC 00027080 */       sll $t6, $v0, 2
  /* 136A40 801387C0 01C27023 */      subu $t6, $t6, $v0
  /* 136A44 801387C4 000E7080 */       sll $t6, $t6, 2
  /* 136A48 801387C8 01C27023 */      subu $t6, $t6, $v0
  /* 136A4C 801387CC 000E7080 */       sll $t6, $t6, 2
  /* 136A50 801387D0 01C27021 */      addu $t6, $t6, $v0
  /* 136A54 801387D4 25CFFF16 */     addiu $t7, $t6, -0xea
  /* 136A58 801387D8 448F2000 */      mtc1 $t7, $f4
  /* 136A5C 801387DC 8CD80074 */        lw $t8, 0x74($a2)
  /* 136A60 801387E0 3C0142B2 */       lui $at, (0x42B20000 >> 16) # 89.0
  /* 136A64 801387E4 468021A0 */   cvt.s.w $f6, $f4
  /* 136A68 801387E8 44814000 */      mtc1 $at, $f8 # 89.0 to cop1
  /* 136A6C 801387EC E7060058 */      swc1 $f6, 0x58($t8)
  /* 136A70 801387F0 8CD90074 */        lw $t9, 0x74($a2)
  /* 136A74 801387F4 10000010 */         b .L80138838
  /* 136A78 801387F8 E728005C */      swc1 $f8, 0x5c($t9)
  .L801387FC:
  /* 136A7C 801387FC 00024080 */       sll $t0, $v0, 2
  /* 136A80 80138800 01024023 */      subu $t0, $t0, $v0
  /* 136A84 80138804 00084080 */       sll $t0, $t0, 2
  /* 136A88 80138808 01024023 */      subu $t0, $t0, $v0
  /* 136A8C 8013880C 00084080 */       sll $t0, $t0, 2
  /* 136A90 80138810 01024021 */      addu $t0, $t0, $v0
  /* 136A94 80138814 25090024 */     addiu $t1, $t0, 0x24
  /* 136A98 80138818 44895000 */      mtc1 $t1, $f10
  /* 136A9C 8013881C 8CCA0074 */        lw $t2, 0x74($a2)
  /* 136AA0 80138820 3C014238 */       lui $at, (0x42380000 >> 16) # 46.0
  /* 136AA4 80138824 46805420 */   cvt.s.w $f16, $f10
  /* 136AA8 80138828 44819000 */      mtc1 $at, $f18 # 46.0 to cop1
  /* 136AAC 8013882C E5500058 */      swc1 $f16, 0x58($t2)
  /* 136AB0 80138830 8CCB0074 */        lw $t3, 0x74($a2)
  /* 136AB4 80138834 E572005C */      swc1 $f18, 0x5c($t3)
  .L80138838:
  /* 136AB8 80138838 8FBF0014 */        lw $ra, 0x14($sp)
  /* 136ABC 8013883C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 136AC0 80138840 03E00008 */        jr $ra
  /* 136AC4 80138844 00000000 */       nop

glabel func_ovl26_80138848
  /* 136AC8 80138848 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 136ACC 8013884C AFBF001C */        sw $ra, 0x1c($sp)
  /* 136AD0 80138850 AFB00018 */        sw $s0, 0x18($sp)
  /* 136AD4 80138854 AFA40020 */        sw $a0, 0x20($sp)
  .L80138858:
  /* 136AD8 80138858 0C00628C */       jal lbRandom_GetTimeByteRange
  /* 136ADC 8013885C 2404000C */     addiu $a0, $zero, 0xc
  /* 136AE0 80138860 00408025 */        or $s0, $v0, $zero
  /* 136AE4 80138864 0C04C7B6 */       jal mnBattleCheckFighterIsXBoxed
  /* 136AE8 80138868 00402025 */        or $a0, $v0, $zero
  /* 136AEC 8013886C 1440FFFA */      bnez $v0, .L80138858
  /* 136AF0 80138870 00000000 */       nop
  /* 136AF4 80138874 0C04C811 */       jal mnBattleGetIsLocked
  /* 136AF8 80138878 02002025 */        or $a0, $s0, $zero
  /* 136AFC 8013887C 1440FFF6 */      bnez $v0, .L80138858
  /* 136B00 80138880 00000000 */       nop
  /* 136B04 80138884 8FA40020 */        lw $a0, 0x20($sp)
  /* 136B08 80138888 0C04E1E6 */       jal mnBattleCenterTokenInPortrait
  /* 136B0C 8013888C 02002825 */        or $a1, $s0, $zero
  /* 136B10 80138890 8FBF001C */        lw $ra, 0x1c($sp)
  /* 136B14 80138894 02001025 */        or $v0, $s0, $zero
  /* 136B18 80138898 8FB00018 */        lw $s0, 0x18($sp)
  /* 136B1C 8013889C 03E00008 */        jr $ra
  /* 136B20 801388A0 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBattleMoveToken
  /* 136B24 801388A4 00047080 */       sll $t6, $a0, 2
  /* 136B28 801388A8 01C47023 */      subu $t6, $t6, $a0
  /* 136B2C 801388AC 000E7100 */       sll $t6, $t6, 4
  /* 136B30 801388B0 01C47023 */      subu $t6, $t6, $a0
  /* 136B34 801388B4 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 136B38 801388B8 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 136B3C 801388BC 000E7080 */       sll $t6, $t6, 2
  /* 136B40 801388C0 01CF1021 */      addu $v0, $t6, $t7
  /* 136B44 801388C4 8C580004 */        lw $t8, 4($v0)
  /* 136B48 801388C8 C4460090 */      lwc1 $f6, 0x90($v0)
  /* 136B4C 801388CC 8F030074 */        lw $v1, 0x74($t8)
  /* 136B50 801388D0 C4640058 */      lwc1 $f4, 0x58($v1)
  /* 136B54 801388D4 46062200 */     add.s $f8, $f4, $f6
  /* 136B58 801388D8 E4680058 */      swc1 $f8, 0x58($v1)
  /* 136B5C 801388DC 8C590004 */        lw $t9, 4($v0)
  /* 136B60 801388E0 C4500094 */      lwc1 $f16, 0x94($v0)
  /* 136B64 801388E4 8F230074 */        lw $v1, 0x74($t9)
  /* 136B68 801388E8 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 136B6C 801388EC 46105480 */     add.s $f18, $f10, $f16
  /* 136B70 801388F0 03E00008 */        jr $ra
  /* 136B74 801388F4 E472005C */      swc1 $f18, 0x5c($v1)

glabel mnBattleSyncTokenAndFighter
  /* 136B78 801388F8 3C0E8014 */       lui $t6, %hi(gMNBattleFramesElapsed)
  /* 136B7C 801388FC 8DCEBDCC */        lw $t6, %lo(gMNBattleFramesElapsed)($t6)
  /* 136B80 80138900 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 136B84 80138904 AFBF001C */        sw $ra, 0x1c($sp)
  /* 136B88 80138908 AFB00018 */        sw $s0, 0x18($sp)
  /* 136B8C 8013890C 29C1001E */      slti $at, $t6, 0x1e
  /* 136B90 80138910 00802825 */        or $a1, $a0, $zero
  /* 136B94 80138914 1020000F */      beqz $at, .L80138954
  /* 136B98 80138918 8C900084 */        lw $s0, 0x84($a0)
  /* 136B9C 8013891C 0010C080 */       sll $t8, $s0, 2
  /* 136BA0 80138920 0310C023 */      subu $t8, $t8, $s0
  /* 136BA4 80138924 0018C100 */       sll $t8, $t8, 4
  /* 136BA8 80138928 0310C023 */      subu $t8, $t8, $s0
  /* 136BAC 8013892C 3C198014 */       lui $t9, %hi(gMNBattlePanels)
  /* 136BB0 80138930 2739BA88 */     addiu $t9, $t9, %lo(gMNBattlePanels)
  /* 136BB4 80138934 0018C080 */       sll $t8, $t8, 2
  /* 136BB8 80138938 240F0001 */     addiu $t7, $zero, 1
  /* 136BBC 8013893C 3C068014 */       lui $a2, %hi(gMNBattlePanels)
  /* 136BC0 80138940 24C6BA88 */     addiu $a2, $a2, %lo(gMNBattlePanels)
  /* 136BC4 80138944 AC8F007C */        sw $t7, 0x7c($a0)
  /* 136BC8 80138948 03193821 */      addu $a3, $t8, $t9
  /* 136BCC 8013894C 1000001B */         b .L801389BC
  /* 136BD0 80138950 240800BC */     addiu $t0, $zero, 0xbc
  .L80138954:
  /* 136BD4 80138954 240800BC */     addiu $t0, $zero, 0xbc
  /* 136BD8 80138958 02080019 */     multu $s0, $t0
  /* 136BDC 8013895C 3C068014 */       lui $a2, %hi(gMNBattlePanels)
  /* 136BE0 80138960 24C6BA88 */     addiu $a2, $a2, %lo(gMNBattlePanels)
  /* 136BE4 80138964 24010001 */     addiu $at, $zero, 1
  /* 136BE8 80138968 00004812 */      mflo $t1
  /* 136BEC 8013896C 00C93821 */      addu $a3, $a2, $t1
  /* 136BF0 80138970 8CE30084 */        lw $v1, 0x84($a3)
  /* 136BF4 80138974 1061000E */       beq $v1, $at, .L801389B0
  /* 136BF8 80138978 00000000 */       nop
  /* 136BFC 8013897C 1460000E */      bnez $v1, .L801389B8
  /* 136C00 80138980 240D0001 */     addiu $t5, $zero, 1
  /* 136C04 80138984 8CEA0054 */        lw $t2, 0x54($a3)
  /* 136C08 80138988 15400009 */      bnez $t2, .L801389B0
  /* 136C0C 8013898C 00000000 */       nop
  /* 136C10 80138990 8CEB0058 */        lw $t3, 0x58($a3)
  /* 136C14 80138994 24010001 */     addiu $at, $zero, 1
  /* 136C18 80138998 11610005 */       beq $t3, $at, .L801389B0
  /* 136C1C 8013899C 00000000 */       nop
  /* 136C20 801389A0 8CEC005C */        lw $t4, 0x5c($a3)
  /* 136C24 801389A4 24010001 */     addiu $at, $zero, 1
  /* 136C28 801389A8 55810004 */      bnel $t4, $at, .L801389BC
  /* 136C2C 801389AC ACAD007C */        sw $t5, 0x7c($a1)
  .L801389B0:
  /* 136C30 801389B0 10000002 */         b .L801389BC
  /* 136C34 801389B4 ACA0007C */        sw $zero, 0x7c($a1)
  .L801389B8:
  /* 136C38 801389B8 ACAD007C */        sw $t5, 0x7c($a1)
  .L801389BC:
  /* 136C3C 801389BC 8CEE0058 */        lw $t6, 0x58($a3)
  /* 136C40 801389C0 55C00023 */      bnel $t6, $zero, .L80138A50
  /* 136C44 801389C4 02002025 */        or $a0, $s0, $zero
  /* 136C48 801389C8 8CE4007C */        lw $a0, 0x7c($a3)
  /* 136C4C 801389CC 24010004 */     addiu $at, $zero, 4
  /* 136C50 801389D0 5081001F */      beql $a0, $at, .L80138A50
  /* 136C54 801389D4 02002025 */        or $a0, $s0, $zero
  /* 136C58 801389D8 00880019 */     multu $a0, $t0
  /* 136C5C 801389DC 00007812 */      mflo $t7
  /* 136C60 801389E0 00CF1021 */      addu $v0, $a2, $t7
  /* 136C64 801389E4 8C5800A0 */        lw $t8, 0xa0($v0)
  /* 136C68 801389E8 5700001D */      bnel $t8, $zero, .L80138A60
  /* 136C6C 801389EC 02002025 */        or $a0, $s0, $zero
  /* 136C70 801389F0 8C430000 */        lw $v1, ($v0)
  /* 136C74 801389F4 5060001A */      beql $v1, $zero, .L80138A60
  /* 136C78 801389F8 02002025 */        or $a0, $s0, $zero
  /* 136C7C 801389FC 8C790074 */        lw $t9, 0x74($v1)
  /* 136C80 80138A00 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 136C84 80138A04 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 136C88 80138A08 C7240058 */      lwc1 $f4, 0x58($t9)
  /* 136C8C 80138A0C 8CA90074 */        lw $t1, 0x74($a1)
  /* 136C90 80138A10 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 136C94 80138A14 46062200 */     add.s $f8, $f4, $f6
  /* 136C98 80138A18 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 136C9C 80138A1C E5280058 */      swc1 $f8, 0x58($t1)
  /* 136CA0 80138A20 8CEA007C */        lw $t2, 0x7c($a3)
  /* 136CA4 80138A24 8CAF0074 */        lw $t7, 0x74($a1)
  /* 136CA8 80138A28 01480019 */     multu $t2, $t0
  /* 136CAC 80138A2C 00005812 */      mflo $t3
  /* 136CB0 80138A30 00CB6021 */      addu $t4, $a2, $t3
  /* 136CB4 80138A34 8D8D0000 */        lw $t5, ($t4)
  /* 136CB8 80138A38 8DAE0074 */        lw $t6, 0x74($t5)
  /* 136CBC 80138A3C C5CA005C */      lwc1 $f10, 0x5c($t6)
  /* 136CC0 80138A40 46105480 */     add.s $f18, $f10, $f16
  /* 136CC4 80138A44 10000005 */         b .L80138A5C
  /* 136CC8 80138A48 E5F2005C */      swc1 $f18, 0x5c($t7)
  /* 136CCC 80138A4C 02002025 */        or $a0, $s0, $zero
  .L80138A50:
  /* 136CD0 80138A50 0C04E229 */       jal mnBattleMoveToken
  /* 136CD4 80138A54 AFA70024 */        sw $a3, 0x24($sp)
  /* 136CD8 80138A58 8FA70024 */        lw $a3, 0x24($sp)
  .L80138A5C:
  /* 136CDC 80138A5C 02002025 */        or $a0, $s0, $zero
  .L80138A60:
  /* 136CE0 80138A60 0C04DE0B */       jal mnBattleGetFtKindFromTokenPosition
  /* 136CE4 80138A64 AFA70024 */        sw $a3, 0x24($sp)
  /* 136CE8 80138A68 8FA70024 */        lw $a3, 0x24($sp)
  /* 136CEC 80138A6C 24010002 */     addiu $at, $zero, 2
  /* 136CF0 80138A70 0010C080 */       sll $t8, $s0, 2
  /* 136CF4 80138A74 8CE30084 */        lw $v1, 0x84($a3)
  /* 136CF8 80138A78 3C198014 */       lui $t9, %hi(gMNBattleControllerOrderArray)
  /* 136CFC 80138A7C 00404025 */        or $t0, $v0, $zero
  /* 136D00 80138A80 14610017 */       bne $v1, $at, .L80138AE0
  /* 136D04 80138A84 0338C821 */      addu $t9, $t9, $t8
  /* 136D08 80138A88 8F39BD90 */        lw $t9, %lo(gMNBattleControllerOrderArray)($t9)
  /* 136D0C 80138A8C 2401FFFF */     addiu $at, $zero, -1
  /* 136D10 80138A90 13210031 */       beq $t9, $at, .L80138B58
  /* 136D14 80138A94 2401001C */     addiu $at, $zero, 0x1c
  /* 136D18 80138A98 1041002F */       beq $v0, $at, .L80138B58
  /* 136D1C 80138A9C 02002025 */        or $a0, $s0, $zero
  /* 136D20 80138AA0 ACE00084 */        sw $zero, 0x84($a3)
  /* 136D24 80138AA4 AFA70024 */        sw $a3, 0x24($sp)
  /* 136D28 80138AA8 0C04D721 */       jal func_ovl26_80135C84
  /* 136D2C 80138AAC AFA2002C */        sw $v0, 0x2c($sp)
  /* 136D30 80138AB0 8FA70024 */        lw $a3, 0x24($sp)
  /* 136D34 80138AB4 02002825 */        or $a1, $s0, $zero
  /* 136D38 80138AB8 8CE4000C */        lw $a0, 0xc($a3)
  /* 136D3C 80138ABC 0C04CA57 */       jal func_ovl26_8013295C
  /* 136D40 80138AC0 8CE60084 */        lw $a2, 0x84($a3)
  /* 136D44 80138AC4 8FA70024 */        lw $a3, 0x24($sp)
  /* 136D48 80138AC8 02002825 */        or $a1, $s0, $zero
  /* 136D4C 80138ACC 0C04D80E */       jal func_ovl26_80136038
  /* 136D50 80138AD0 8CE40004 */        lw $a0, 4($a3)
  /* 136D54 80138AD4 8FA70024 */        lw $a3, 0x24($sp)
  /* 136D58 80138AD8 8FA8002C */        lw $t0, 0x2c($sp)
  /* 136D5C 80138ADC 8CE30084 */        lw $v1, 0x84($a3)
  .L80138AE0:
  /* 136D60 80138AE0 24010001 */     addiu $at, $zero, 1
  /* 136D64 80138AE4 54610012 */      bnel $v1, $at, .L80138B30
  /* 136D68 80138AE8 8CEA0058 */        lw $t2, 0x58($a3)
  /* 136D6C 80138AEC 8CE90048 */        lw $t1, 0x48($a3)
  /* 136D70 80138AF0 2401001C */     addiu $at, $zero, 0x1c
  /* 136D74 80138AF4 5109000E */      beql $t0, $t1, .L80138B30
  /* 136D78 80138AF8 8CEA0058 */        lw $t2, 0x58($a3)
  /* 136D7C 80138AFC 5501000C */      bnel $t0, $at, .L80138B30
  /* 136D80 80138B00 8CEA0058 */        lw $t2, 0x58($a3)
  /* 136D84 80138B04 8CE4007C */        lw $a0, 0x7c($a3)
  /* 136D88 80138B08 24010004 */     addiu $at, $zero, 4
  /* 136D8C 80138B0C 24050004 */     addiu $a1, $zero, 4
  /* 136D90 80138B10 50810007 */      beql $a0, $at, .L80138B30
  /* 136D94 80138B14 8CEA0058 */        lw $t2, 0x58($a3)
  /* 136D98 80138B18 AFA70024 */        sw $a3, 0x24($sp)
  /* 136D9C 80138B1C 0C04C71D */       jal mnBattleSelectCharWithToken
  /* 136DA0 80138B20 AFA8002C */        sw $t0, 0x2c($sp)
  /* 136DA4 80138B24 8FA70024 */        lw $a3, 0x24($sp)
  /* 136DA8 80138B28 8FA8002C */        lw $t0, 0x2c($sp)
  /* 136DAC 80138B2C 8CEA0058 */        lw $t2, 0x58($a3)
  .L80138B30:
  /* 136DB0 80138B30 5540000A */      bnel $t2, $zero, .L80138B5C
  /* 136DB4 80138B34 8FBF001C */        lw $ra, 0x1c($sp)
  /* 136DB8 80138B38 8CEB0048 */        lw $t3, 0x48($a3)
  /* 136DBC 80138B3C 02002025 */        or $a0, $s0, $zero
  /* 136DC0 80138B40 510B0006 */      beql $t0, $t3, .L80138B5C
  /* 136DC4 80138B44 8FBF001C */        lw $ra, 0x1c($sp)
  /* 136DC8 80138B48 0C04D84A */       jal mnBattleSyncFighterDisplay
  /* 136DCC 80138B4C ACE80048 */        sw $t0, 0x48($a3)
  /* 136DD0 80138B50 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 136DD4 80138B54 02002025 */        or $a0, $s0, $zero
  .L80138B58:
  /* 136DD8 80138B58 8FBF001C */        lw $ra, 0x1c($sp)
  .L80138B5C:
  /* 136DDC 80138B5C 8FB00018 */        lw $s0, 0x18($sp)
  /* 136DE0 80138B60 27BD0030 */     addiu $sp, $sp, 0x30
  /* 136DE4 80138B64 03E00008 */        jr $ra
  /* 136DE8 80138B68 00000000 */       nop

glabel mnBattleCreateCursorViewport
  /* 136DEC 80138B6C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136DF0 80138B70 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 136DF4 80138B74 AFBF003C */        sw $ra, 0x3c($sp)
  /* 136DF8 80138B78 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 136DFC 80138B7C 240F0014 */     addiu $t7, $zero, 0x14
  /* 136E00 80138B80 24180001 */     addiu $t8, $zero, 1
  /* 136E04 80138B84 24190000 */     addiu $t9, $zero, 0
  /* 136E08 80138B88 2408FFFF */     addiu $t0, $zero, -1
  /* 136E0C 80138B8C 24090001 */     addiu $t1, $zero, 1
  /* 136E10 80138B90 240A0001 */     addiu $t2, $zero, 1
  /* 136E14 80138B94 AFAA0030 */        sw $t2, 0x30($sp)
  /* 136E18 80138B98 AFA90028 */        sw $t1, 0x28($sp)
  /* 136E1C 80138B9C AFA80020 */        sw $t0, 0x20($sp)
  /* 136E20 80138BA0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 136E24 80138BA4 AFB80018 */        sw $t8, 0x18($sp)
  /* 136E28 80138BA8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 136E2C 80138BAC AFAE0010 */        sw $t6, 0x10($sp)
  /* 136E30 80138BB0 AFA00024 */        sw $zero, 0x24($sp)
  /* 136E34 80138BB4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 136E38 80138BB8 AFA00034 */        sw $zero, 0x34($sp)
  /* 136E3C 80138BBC 24040401 */     addiu $a0, $zero, 0x401
  /* 136E40 80138BC0 00002825 */        or $a1, $zero, $zero
  /* 136E44 80138BC4 24060010 */     addiu $a2, $zero, 0x10
  /* 136E48 80138BC8 0C002E4F */       jal func_8000B93C
  /* 136E4C 80138BCC 3C078000 */       lui $a3, 0x8000
  /* 136E50 80138BD0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 136E54 80138BD4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 136E58 80138BD8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 136E5C 80138BDC 8C430074 */        lw $v1, 0x74($v0)
  /* 136E60 80138BE0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 136E64 80138BE4 44050000 */      mfc1 $a1, $f0
  /* 136E68 80138BE8 44060000 */      mfc1 $a2, $f0
  /* 136E6C 80138BEC 3C07439B */       lui $a3, 0x439b
  /* 136E70 80138BF0 24640008 */     addiu $a0, $v1, 8
  /* 136E74 80138BF4 0C001C20 */       jal func_80007080
  /* 136E78 80138BF8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 136E7C 80138BFC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 136E80 80138C00 27BD0040 */     addiu $sp, $sp, 0x40
  /* 136E84 80138C04 03E00008 */        jr $ra
  /* 136E88 80138C08 00000000 */       nop

glabel mnBattleCreateDroppedTokenViewport
  /* 136E8C 80138C0C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136E90 80138C10 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 136E94 80138C14 AFBF003C */        sw $ra, 0x3c($sp)
  /* 136E98 80138C18 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 136E9C 80138C1C 240F0019 */     addiu $t7, $zero, 0x19
  /* 136EA0 80138C20 24180002 */     addiu $t8, $zero, 2
  /* 136EA4 80138C24 24190000 */     addiu $t9, $zero, 0
  /* 136EA8 80138C28 2408FFFF */     addiu $t0, $zero, -1
  /* 136EAC 80138C2C 24090001 */     addiu $t1, $zero, 1
  /* 136EB0 80138C30 240A0001 */     addiu $t2, $zero, 1
  /* 136EB4 80138C34 AFAA0030 */        sw $t2, 0x30($sp)
  /* 136EB8 80138C38 AFA90028 */        sw $t1, 0x28($sp)
  /* 136EBC 80138C3C AFA80020 */        sw $t0, 0x20($sp)
  /* 136EC0 80138C40 AFB9001C */        sw $t9, 0x1c($sp)
  /* 136EC4 80138C44 AFB80018 */        sw $t8, 0x18($sp)
  /* 136EC8 80138C48 AFAF0014 */        sw $t7, 0x14($sp)
  /* 136ECC 80138C4C AFAE0010 */        sw $t6, 0x10($sp)
  /* 136ED0 80138C50 AFA00024 */        sw $zero, 0x24($sp)
  /* 136ED4 80138C54 AFA0002C */        sw $zero, 0x2c($sp)
  /* 136ED8 80138C58 AFA00034 */        sw $zero, 0x34($sp)
  /* 136EDC 80138C5C 24040401 */     addiu $a0, $zero, 0x401
  /* 136EE0 80138C60 00002825 */        or $a1, $zero, $zero
  /* 136EE4 80138C64 24060010 */     addiu $a2, $zero, 0x10
  /* 136EE8 80138C68 0C002E4F */       jal func_8000B93C
  /* 136EEC 80138C6C 3C078000 */       lui $a3, 0x8000
  /* 136EF0 80138C70 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 136EF4 80138C74 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 136EF8 80138C78 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 136EFC 80138C7C 8C430074 */        lw $v1, 0x74($v0)
  /* 136F00 80138C80 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 136F04 80138C84 44050000 */      mfc1 $a1, $f0
  /* 136F08 80138C88 44060000 */      mfc1 $a2, $f0
  /* 136F0C 80138C8C 3C07439B */       lui $a3, 0x439b
  /* 136F10 80138C90 24640008 */     addiu $a0, $v1, 8
  /* 136F14 80138C94 0C001C20 */       jal func_80007080
  /* 136F18 80138C98 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 136F1C 80138C9C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 136F20 80138CA0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 136F24 80138CA4 03E00008 */        jr $ra
  /* 136F28 80138CA8 00000000 */       nop

glabel mnBattleCreateHandicapCPULevelViewport
  /* 136F2C 80138CAC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136F30 80138CB0 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 136F34 80138CB4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 136F38 80138CB8 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 136F3C 80138CBC 240F002B */     addiu $t7, $zero, 0x2b
  /* 136F40 80138CC0 24180008 */     addiu $t8, $zero, 8
  /* 136F44 80138CC4 24190000 */     addiu $t9, $zero, 0
  /* 136F48 80138CC8 2408FFFF */     addiu $t0, $zero, -1
  /* 136F4C 80138CCC 24090001 */     addiu $t1, $zero, 1
  /* 136F50 80138CD0 240A0001 */     addiu $t2, $zero, 1
  /* 136F54 80138CD4 AFAA0030 */        sw $t2, 0x30($sp)
  /* 136F58 80138CD8 AFA90028 */        sw $t1, 0x28($sp)
  /* 136F5C 80138CDC AFA80020 */        sw $t0, 0x20($sp)
  /* 136F60 80138CE0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 136F64 80138CE4 AFB80018 */        sw $t8, 0x18($sp)
  /* 136F68 80138CE8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 136F6C 80138CEC AFAE0010 */        sw $t6, 0x10($sp)
  /* 136F70 80138CF0 AFA00024 */        sw $zero, 0x24($sp)
  /* 136F74 80138CF4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 136F78 80138CF8 AFA00034 */        sw $zero, 0x34($sp)
  /* 136F7C 80138CFC 24040401 */     addiu $a0, $zero, 0x401
  /* 136F80 80138D00 00002825 */        or $a1, $zero, $zero
  /* 136F84 80138D04 24060010 */     addiu $a2, $zero, 0x10
  /* 136F88 80138D08 0C002E4F */       jal func_8000B93C
  /* 136F8C 80138D0C 3C078000 */       lui $a3, 0x8000
  /* 136F90 80138D10 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 136F94 80138D14 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 136F98 80138D18 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 136F9C 80138D1C 8C430074 */        lw $v1, 0x74($v0)
  /* 136FA0 80138D20 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 136FA4 80138D24 44050000 */      mfc1 $a1, $f0
  /* 136FA8 80138D28 44060000 */      mfc1 $a2, $f0
  /* 136FAC 80138D2C 3C07439B */       lui $a3, 0x439b
  /* 136FB0 80138D30 24640008 */     addiu $a0, $v1, 8
  /* 136FB4 80138D34 0C001C20 */       jal func_80007080
  /* 136FB8 80138D38 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 136FBC 80138D3C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 136FC0 80138D40 27BD0040 */     addiu $sp, $sp, 0x40
  /* 136FC4 80138D44 03E00008 */        jr $ra
  /* 136FC8 80138D48 00000000 */       nop

glabel mnBattleCreateReadyToFightViewport
  /* 136FCC 80138D4C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 136FD0 80138D50 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 136FD4 80138D54 AFBF003C */        sw $ra, 0x3c($sp)
  /* 136FD8 80138D58 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 136FDC 80138D5C 240F000A */     addiu $t7, $zero, 0xa
  /* 136FE0 80138D60 24180040 */     addiu $t8, $zero, 0x40
  /* 136FE4 80138D64 24190000 */     addiu $t9, $zero, 0
  /* 136FE8 80138D68 2408FFFF */     addiu $t0, $zero, -1
  /* 136FEC 80138D6C 24090001 */     addiu $t1, $zero, 1
  /* 136FF0 80138D70 240A0001 */     addiu $t2, $zero, 1
  /* 136FF4 80138D74 AFAA0030 */        sw $t2, 0x30($sp)
  /* 136FF8 80138D78 AFA90028 */        sw $t1, 0x28($sp)
  /* 136FFC 80138D7C AFA80020 */        sw $t0, 0x20($sp)
  /* 137000 80138D80 AFB9001C */        sw $t9, 0x1c($sp)
  /* 137004 80138D84 AFB80018 */        sw $t8, 0x18($sp)
  /* 137008 80138D88 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13700C 80138D8C AFAE0010 */        sw $t6, 0x10($sp)
  /* 137010 80138D90 AFA00024 */        sw $zero, 0x24($sp)
  /* 137014 80138D94 AFA0002C */        sw $zero, 0x2c($sp)
  /* 137018 80138D98 AFA00034 */        sw $zero, 0x34($sp)
  /* 13701C 80138D9C 24040401 */     addiu $a0, $zero, 0x401
  /* 137020 80138DA0 00002825 */        or $a1, $zero, $zero
  /* 137024 80138DA4 24060010 */     addiu $a2, $zero, 0x10
  /* 137028 80138DA8 0C002E4F */       jal func_8000B93C
  /* 13702C 80138DAC 3C078000 */       lui $a3, 0x8000
  /* 137030 80138DB0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 137034 80138DB4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 137038 80138DB8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13703C 80138DBC 8C430074 */        lw $v1, 0x74($v0)
  /* 137040 80138DC0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 137044 80138DC4 44050000 */      mfc1 $a1, $f0
  /* 137048 80138DC8 44060000 */      mfc1 $a2, $f0
  /* 13704C 80138DCC 3C07439B */       lui $a3, 0x439b
  /* 137050 80138DD0 24640008 */     addiu $a0, $v1, 8
  /* 137054 80138DD4 0C001C20 */       jal func_80007080
  /* 137058 80138DD8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13705C 80138DDC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 137060 80138DE0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 137064 80138DE4 03E00008 */        jr $ra
  /* 137068 80138DE8 00000000 */       nop

glabel mnBattleCreateCursor
  /* 13706C 80138DEC 27BDFF78 */     addiu $sp, $sp, -0x88
  /* 137070 80138DF0 3C0F8014 */       lui $t7, %hi(dMNBattleCursorTypeOffsetsUnused)
  /* 137074 80138DF4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 137078 80138DF8 AFB00038 */        sw $s0, 0x38($sp)
  /* 13707C 80138DFC 25EFB89C */     addiu $t7, $t7, %lo(dMNBattleCursorTypeOffsetsUnused)
  /* 137080 80138E00 8DF90000 */        lw $t9, ($t7) # dMNBattleCursorTypeOffsetsUnused + 0
  /* 137084 80138E04 8DF80004 */        lw $t8, 4($t7) # dMNBattleCursorTypeOffsetsUnused + 4
  /* 137088 80138E08 27AE0070 */     addiu $t6, $sp, 0x70
  /* 13708C 80138E0C ADD90000 */        sw $t9, ($t6)
  /* 137090 80138E10 ADD80004 */        sw $t8, 4($t6)
  /* 137094 80138E14 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleCursorTypeOffsetsUnused + 12
  /* 137098 80138E18 8DF90008 */        lw $t9, 8($t7) # dMNBattleCursorTypeOffsetsUnused + 8
  /* 13709C 80138E1C 3C098014 */       lui $t1, %hi(dMNBattleCursorStartingPositions)
  /* 1370A0 80138E20 2529B8AC */     addiu $t1, $t1, %lo(dMNBattleCursorStartingPositions)
  /* 1370A4 80138E24 ADD8000C */        sw $t8, 0xc($t6)
  /* 1370A8 80138E28 ADD90008 */        sw $t9, 8($t6)
  /* 1370AC 80138E2C 8D2A0004 */        lw $t2, 4($t1) # dMNBattleCursorStartingPositions + 4
  /* 1370B0 80138E30 8D2B0000 */        lw $t3, ($t1) # dMNBattleCursorStartingPositions + 0
  /* 1370B4 80138E34 27A80050 */     addiu $t0, $sp, 0x50
  /* 1370B8 80138E38 AD0A0004 */        sw $t2, 4($t0)
  /* 1370BC 80138E3C AD0B0000 */        sw $t3, ($t0)
  /* 1370C0 80138E40 8D2B0008 */        lw $t3, 8($t1) # dMNBattleCursorStartingPositions + 8
  /* 1370C4 80138E44 8D2A000C */        lw $t2, 0xc($t1) # dMNBattleCursorStartingPositions + 12
  /* 1370C8 80138E48 3C0C8014 */       lui $t4, %hi(dMNBattleCursorStartingDisplayOrders)
  /* 1370CC 80138E4C AD0B0008 */        sw $t3, 8($t0)
  /* 1370D0 80138E50 AD0A000C */        sw $t2, 0xc($t0)
  /* 1370D4 80138E54 8D2A0014 */        lw $t2, 0x14($t1) # dMNBattleCursorStartingPositions + 20
  /* 1370D8 80138E58 8D2B0010 */        lw $t3, 0x10($t1) # dMNBattleCursorStartingPositions + 16
  /* 1370DC 80138E5C 258CB8CC */     addiu $t4, $t4, %lo(dMNBattleCursorStartingDisplayOrders)
  /* 1370E0 80138E60 AD0A0014 */        sw $t2, 0x14($t0)
  /* 1370E4 80138E64 AD0B0010 */        sw $t3, 0x10($t0)
  /* 1370E8 80138E68 8D2B0018 */        lw $t3, 0x18($t1) # dMNBattleCursorStartingPositions + 24
  /* 1370EC 80138E6C 8D2A001C */        lw $t2, 0x1c($t1) # dMNBattleCursorStartingPositions + 28
  /* 1370F0 80138E70 27A20040 */     addiu $v0, $sp, 0x40
  /* 1370F4 80138E74 AD0B0018 */        sw $t3, 0x18($t0)
  /* 1370F8 80138E78 AD0A001C */        sw $t2, 0x1c($t0)
  /* 1370FC 80138E7C 8D8E0000 */        lw $t6, ($t4) # dMNBattleCursorStartingDisplayOrders + 0
  /* 137100 80138E80 00808025 */        or $s0, $a0, $zero
  /* 137104 80138E84 3C0F800D */       lui $t7, %hi(func_ovl0_800CCF00)
  /* 137108 80138E88 AC4E0000 */        sw $t6, ($v0)
  /* 13710C 80138E8C 8D8D0004 */        lw $t5, 4($t4) # dMNBattleCursorStartingDisplayOrders + 4
  /* 137110 80138E90 25EFCF00 */     addiu $t7, $t7, %lo(func_ovl0_800CCF00)
  /* 137114 80138E94 0010C880 */       sll $t9, $s0, 2
  /* 137118 80138E98 AC4D0004 */        sw $t5, 4($v0)
  /* 13711C 80138E9C 8D8E0008 */        lw $t6, 8($t4) # dMNBattleCursorStartingDisplayOrders + 8
  /* 137120 80138EA0 24180020 */     addiu $t8, $zero, 0x20
  /* 137124 80138EA4 00594021 */      addu $t0, $v0, $t9
  /* 137128 80138EA8 AC4E0008 */        sw $t6, 8($v0)
  /* 13712C 80138EAC 8D8D000C */        lw $t5, 0xc($t4) # dMNBattleCursorStartingDisplayOrders + 12
  /* 137130 80138EB0 3C0B8014 */       lui $t3, %hi(D_ovl26_8013C4A0)
  /* 137134 80138EB4 3C0C0000 */       lui $t4, %hi(D_NF_000076E8)
  /* 137138 80138EB8 AC4D000C */        sw $t5, 0xc($v0)
  /* 13713C 80138EBC AFB80014 */        sw $t8, 0x14($sp)
  /* 137140 80138EC0 AFAF0010 */        sw $t7, 0x10($sp)
  /* 137144 80138EC4 8D090000 */        lw $t1, ($t0)
  /* 137148 80138EC8 8D6BC4A0 */        lw $t3, %lo(D_ovl26_8013C4A0)($t3)
  /* 13714C 80138ECC 3C0F8014 */       lui $t7, %hi(mnBattleHandleButtonPresses)
  /* 137150 80138ED0 258C76E8 */     addiu $t4, $t4, %lo(D_NF_000076E8)
  /* 137154 80138ED4 25EF82E0 */     addiu $t7, $t7, %lo(mnBattleHandleButtonPresses)
  /* 137158 80138ED8 24180002 */     addiu $t8, $zero, 2
  /* 13715C 80138EDC 240E0001 */     addiu $t6, $zero, 1
  /* 137160 80138EE0 240AFFFF */     addiu $t2, $zero, -1
  /* 137164 80138EE4 016C6821 */      addu $t5, $t3, $t4
  /* 137168 80138EE8 AFAD0020 */        sw $t5, 0x20($sp)
  /* 13716C 80138EEC AFAA001C */        sw $t2, 0x1c($sp)
  /* 137170 80138EF0 AFAE0024 */        sw $t6, 0x24($sp)
  /* 137174 80138EF4 AFB8002C */        sw $t8, 0x2c($sp)
  /* 137178 80138EF8 AFAF0028 */        sw $t7, 0x28($sp)
  /* 13717C 80138EFC 00002025 */        or $a0, $zero, $zero
  /* 137180 80138F00 00002825 */        or $a1, $zero, $zero
  /* 137184 80138F04 24060013 */     addiu $a2, $zero, 0x13
  /* 137188 80138F08 3C078000 */       lui $a3, 0x8000
  /* 13718C 80138F0C 0C033414 */       jal func_ovl0_800CD050
  /* 137190 80138F10 AFA90018 */        sw $t1, 0x18($sp)
  /* 137194 80138F14 0010C880 */       sll $t9, $s0, 2
  /* 137198 80138F18 0330C823 */      subu $t9, $t9, $s0
  /* 13719C 80138F1C 0019C900 */       sll $t9, $t9, 4
  /* 1371A0 80138F20 0330C823 */      subu $t9, $t9, $s0
  /* 1371A4 80138F24 0019C880 */       sll $t9, $t9, 2
  /* 1371A8 80138F28 3C018014 */       lui $at, %hi(gMNBattlePanels)
  /* 1371AC 80138F2C 00390821 */      addu $at, $at, $t9
  /* 1371B0 80138F30 AC22BA88 */        sw $v0, %lo(gMNBattlePanels)($at)
  /* 1371B4 80138F34 001040C0 */       sll $t0, $s0, 3
  /* 1371B8 80138F38 27A90050 */     addiu $t1, $sp, 0x50
  /* 1371BC 80138F3C AC500084 */        sw $s0, 0x84($v0)
  /* 1371C0 80138F40 01093821 */      addu $a3, $t0, $t1
  /* 1371C4 80138F44 C4E40000 */      lwc1 $f4, ($a3)
  /* 1371C8 80138F48 8C4A0074 */        lw $t2, 0x74($v0)
  /* 1371CC 80138F4C 00402025 */        or $a0, $v0, $zero
  /* 1371D0 80138F50 02002825 */        or $a1, $s0, $zero
  /* 1371D4 80138F54 E5440058 */      swc1 $f4, 0x58($t2)
  /* 1371D8 80138F58 8C4B0074 */        lw $t3, 0x74($v0)
  /* 1371DC 80138F5C C4E60004 */      lwc1 $f6, 4($a3)
  /* 1371E0 80138F60 00003025 */        or $a2, $zero, $zero
  /* 1371E4 80138F64 E566005C */      swc1 $f6, 0x5c($t3)
  /* 1371E8 80138F68 8C430074 */        lw $v1, 0x74($v0)
  /* 1371EC 80138F6C 946C0024 */       lhu $t4, 0x24($v1)
  /* 1371F0 80138F70 318DFFDF */      andi $t5, $t4, 0xffdf
  /* 1371F4 80138F74 A46D0024 */        sh $t5, 0x24($v1)
  /* 1371F8 80138F78 8C430074 */        lw $v1, 0x74($v0)
  /* 1371FC 80138F7C 946E0024 */       lhu $t6, 0x24($v1)
  /* 137200 80138F80 35CF0001 */       ori $t7, $t6, 1
  /* 137204 80138F84 0C04D355 */       jal mnBattleRedrawCursor
  /* 137208 80138F88 A46F0024 */        sh $t7, 0x24($v1)
  /* 13720C 80138F8C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 137210 80138F90 8FB00038 */        lw $s0, 0x38($sp)
  /* 137214 80138F94 27BD0088 */     addiu $sp, $sp, 0x88
  /* 137218 80138F98 03E00008 */        jr $ra
  /* 13721C 80138F9C 00000000 */       nop

glabel mnBattleRenderToken
  /* 137220 80138FA0 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 137224 80138FA4 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 137228 80138FA8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13722C 80138FAC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 137230 80138FB0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 137234 80138FB4 244E0008 */     addiu $t6, $v0, 8
  /* 137238 80138FB8 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 13723C 80138FBC 3C0FE700 */       lui $t7, 0xe700
  /* 137240 80138FC0 AC4F0000 */        sw $t7, ($v0)
  /* 137244 80138FC4 AC400004 */        sw $zero, 4($v0)
  /* 137248 80138FC8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13724C 80138FCC 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 137250 80138FD0 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 137254 80138FD4 24580008 */     addiu $t8, $v0, 8
  /* 137258 80138FD8 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 13725C 80138FDC AC400004 */        sw $zero, 4($v0)
  /* 137260 80138FE0 AC590000 */        sw $t9, ($v0)
  /* 137264 80138FE4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 137268 80138FE8 240EFFFF */     addiu $t6, $zero, -1
  /* 13726C 80138FEC 3C0DFA00 */       lui $t5, 0xfa00
  /* 137270 80138FF0 244C0008 */     addiu $t4, $v0, 8
  /* 137274 80138FF4 AC6C0000 */        sw $t4, ($v1) # gDisplayListHead + 0
  /* 137278 80138FF8 AC4E0004 */        sw $t6, 4($v0)
  /* 13727C 80138FFC AC4D0000 */        sw $t5, ($v0)
  /* 137280 80139000 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 137284 80139004 3C18FB00 */       lui $t8, 0xfb00
  /* 137288 80139008 3C058014 */       lui $a1, %hi(gMNBattleTokenShinePulseColor)
  /* 13728C 8013900C 244F0008 */     addiu $t7, $v0, 8
  /* 137290 80139010 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 137294 80139014 AC580000 */        sw $t8, ($v0)
  /* 137298 80139018 8CA5BDB4 */        lw $a1, %lo(gMNBattleTokenShinePulseColor)($a1)
  /* 13729C 8013901C 30A500FF */      andi $a1, $a1, 0xff
  /* 1372A0 80139020 0005CE00 */       sll $t9, $a1, 0x18
  /* 1372A4 80139024 00056400 */       sll $t4, $a1, 0x10
  /* 1372A8 80139028 032C6825 */        or $t5, $t9, $t4
  /* 1372AC 8013902C 00057200 */       sll $t6, $a1, 8
  /* 1372B0 80139030 01AE7825 */        or $t7, $t5, $t6
  /* 1372B4 80139034 01E5C025 */        or $t8, $t7, $a1
  /* 1372B8 80139038 AC580004 */        sw $t8, 4($v0)
  /* 1372BC 8013903C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1372C0 80139040 3C0D33FD */       lui $t5, (0x33FDF2F9 >> 16) # 872280825
  /* 1372C4 80139044 3C0CFC12 */       lui $t4, (0xFC12FE25 >> 16) # 4229103141
  /* 1372C8 80139048 24590008 */     addiu $t9, $v0, 8
  /* 1372CC 8013904C AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 1372D0 80139050 358CFE25 */       ori $t4, $t4, (0xFC12FE25 & 0xFFFF) # 4229103141
  /* 1372D4 80139054 35ADF2F9 */       ori $t5, $t5, (0x33FDF2F9 & 0xFFFF) # 872280825
  /* 1372D8 80139058 AC4D0004 */        sw $t5, 4($v0)
  /* 1372DC 8013905C AC4C0000 */        sw $t4, ($v0)
  /* 1372E0 80139060 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1372E4 80139064 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 1372E8 80139068 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 1372EC 8013906C 244E0008 */     addiu $t6, $v0, 8
  /* 1372F0 80139070 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1372F4 80139074 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 1372F8 80139078 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 1372FC 8013907C AC580004 */        sw $t8, 4($v0)
  /* 137300 80139080 0C0333DD */       jal func_ovl0_800CCF74
  /* 137304 80139084 AC4F0000 */        sw $t7, ($v0)
  /* 137308 80139088 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13730C 8013908C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 137310 80139090 03E00008 */        jr $ra
  /* 137314 80139094 00000000 */       nop

glabel mnBattleCreateToken
  /* 137318 80139098 27BDFF78 */     addiu $sp, $sp, -0x88
  /* 13731C 8013909C 3C0E8014 */       lui $t6, %hi(dMNBattleTokenOffsetsNoCPU)
  /* 137320 801390A0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 137324 801390A4 AFB00038 */        sw $s0, 0x38($sp)
  /* 137328 801390A8 AFA40088 */        sw $a0, 0x88($sp)
  /* 13732C 801390AC 25CEB8DC */     addiu $t6, $t6, %lo(dMNBattleTokenOffsetsNoCPU)
  /* 137330 801390B0 8DD80000 */        lw $t8, ($t6) # dMNBattleTokenOffsetsNoCPU + 0
  /* 137334 801390B4 27A20070 */     addiu $v0, $sp, 0x70
  /* 137338 801390B8 3C198014 */       lui $t9, %hi(dMNBattleTokenStartingDisplayOrders)
  /* 13733C 801390BC AC580000 */        sw $t8, ($v0)
  /* 137340 801390C0 8DCF0004 */        lw $t7, 4($t6) # dMNBattleTokenOffsetsNoCPU + 4
  /* 137344 801390C4 2739B8EC */     addiu $t9, $t9, %lo(dMNBattleTokenStartingDisplayOrders)
  /* 137348 801390C8 27A30060 */     addiu $v1, $sp, 0x60
  /* 13734C 801390CC AC4F0004 */        sw $t7, 4($v0)
  /* 137350 801390D0 8DD80008 */        lw $t8, 8($t6) # dMNBattleTokenOffsetsNoCPU + 8
  /* 137354 801390D4 3C0C8014 */       lui $t4, %hi(dMNBattleTokenHoldingDisplayOrders)
  /* 137358 801390D8 258CB8FC */     addiu $t4, $t4, %lo(dMNBattleTokenHoldingDisplayOrders)
  /* 13735C 801390DC AC580008 */        sw $t8, 8($v0)
  /* 137360 801390E0 8DCF000C */        lw $t7, 0xc($t6) # dMNBattleTokenOffsetsNoCPU + 12
  /* 137364 801390E4 27AB0050 */     addiu $t3, $sp, 0x50
  /* 137368 801390E8 24180021 */     addiu $t8, $zero, 0x21
  /* 13736C 801390EC AC4F000C */        sw $t7, 0xc($v0)
  /* 137370 801390F0 8F2A0000 */        lw $t2, ($t9) # dMNBattleTokenStartingDisplayOrders + 0
  /* 137374 801390F4 3C0F8014 */       lui $t7, %hi(mnBattleRenderToken)
  /* 137378 801390F8 25EF8FA0 */     addiu $t7, $t7, %lo(mnBattleRenderToken)
  /* 13737C 801390FC AC6A0000 */        sw $t2, ($v1)
  /* 137380 80139100 8F290004 */        lw $t1, 4($t9) # dMNBattleTokenStartingDisplayOrders + 4
  /* 137384 80139104 00002025 */        or $a0, $zero, $zero
  /* 137388 80139108 00002825 */        or $a1, $zero, $zero
  /* 13738C 8013910C AC690004 */        sw $t1, 4($v1)
  /* 137390 80139110 8F2A0008 */        lw $t2, 8($t9) # dMNBattleTokenStartingDisplayOrders + 8
  /* 137394 80139114 24060014 */     addiu $a2, $zero, 0x14
  /* 137398 80139118 3C078000 */       lui $a3, 0x8000
  /* 13739C 8013911C AC6A0008 */        sw $t2, 8($v1)
  /* 1373A0 80139120 8F29000C */        lw $t1, 0xc($t9) # dMNBattleTokenStartingDisplayOrders + 12
  /* 1373A4 80139124 240AFFFF */     addiu $t2, $zero, -1
  /* 1373A8 80139128 AC69000C */        sw $t1, 0xc($v1)
  /* 1373AC 8013912C 8D8D0004 */        lw $t5, 4($t4) # dMNBattleTokenHoldingDisplayOrders + 4
  /* 1373B0 80139130 8D8E0000 */        lw $t6, ($t4) # dMNBattleTokenHoldingDisplayOrders + 0
  /* 1373B4 80139134 AD6D0004 */        sw $t5, 4($t3)
  /* 1373B8 80139138 AD6E0000 */        sw $t6, ($t3)
  /* 1373BC 8013913C 8D8E0008 */        lw $t6, 8($t4) # dMNBattleTokenHoldingDisplayOrders + 8
  /* 1373C0 80139140 8D8D000C */        lw $t5, 0xc($t4) # dMNBattleTokenHoldingDisplayOrders + 12
  /* 1373C4 80139144 AD6E0008 */        sw $t6, 8($t3)
  /* 1373C8 80139148 AD6D000C */        sw $t5, 0xc($t3)
  /* 1373CC 8013914C 8FA80088 */        lw $t0, 0x88($sp)
  /* 1373D0 80139150 AFB80014 */        sw $t8, 0x14($sp)
  /* 1373D4 80139154 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1373D8 80139158 00084080 */       sll $t0, $t0, 2
  /* 1373DC 8013915C 0068C821 */      addu $t9, $v1, $t0
  /* 1373E0 80139160 8F290000 */        lw $t1, ($t9) # dMNBattleTokenStartingDisplayOrders + 0
  /* 1373E4 80139164 AFAA001C */        sw $t2, 0x1c($sp)
  /* 1373E8 80139168 00485821 */      addu $t3, $v0, $t0
  /* 1373EC 8013916C AFA90018 */        sw $t1, 0x18($sp)
  /* 1373F0 80139170 8D6C0000 */        lw $t4, ($t3)
  /* 1373F4 80139174 3C0D8014 */       lui $t5, %hi(D_ovl26_8013C4A0)
  /* 1373F8 80139178 8DADC4A0 */        lw $t5, %lo(D_ovl26_8013C4A0)($t5)
  /* 1373FC 8013917C 3C188014 */       lui $t8, %hi(mnBattleSyncTokenAndFighter)
  /* 137400 80139180 271888F8 */     addiu $t8, $t8, %lo(mnBattleSyncTokenAndFighter)
  /* 137404 80139184 24190001 */     addiu $t9, $zero, 1
  /* 137408 80139188 240F0001 */     addiu $t7, $zero, 1
  /* 13740C 8013918C 018D7021 */      addu $t6, $t4, $t5
  /* 137410 80139190 AFAE0020 */        sw $t6, 0x20($sp)
  /* 137414 80139194 AFAF0024 */        sw $t7, 0x24($sp)
  /* 137418 80139198 AFB9002C */        sw $t9, 0x2c($sp)
  /* 13741C 8013919C AFB80028 */        sw $t8, 0x28($sp)
  /* 137420 801391A0 0C033414 */       jal func_ovl0_800CD050
  /* 137424 801391A4 AFA8004C */        sw $t0, 0x4c($sp)
  /* 137428 801391A8 8FA50088 */        lw $a1, 0x88($sp)
  /* 13742C 801391AC 3C0A8014 */       lui $t2, %hi(gMNBattlePanels)
  /* 137430 801391B0 254ABA88 */     addiu $t2, $t2, %lo(gMNBattlePanels)
  /* 137434 801391B4 00054880 */       sll $t1, $a1, 2
  /* 137438 801391B8 01254823 */      subu $t1, $t1, $a1
  /* 13743C 801391BC 00094900 */       sll $t1, $t1, 4
  /* 137440 801391C0 01254823 */      subu $t1, $t1, $a1
  /* 137444 801391C4 00094880 */       sll $t1, $t1, 2
  /* 137448 801391C8 012A1821 */      addu $v1, $t1, $t2
  /* 13744C 801391CC AC620004 */        sw $v0, 4($v1)
  /* 137450 801391D0 8FA8004C */        lw $t0, 0x4c($sp)
  /* 137454 801391D4 AC450084 */        sw $a1, 0x84($v0)
  /* 137458 801391D8 8C640084 */        lw $a0, 0x84($v1)
  /* 13745C 801391DC 24010001 */     addiu $at, $zero, 1
  /* 137460 801391E0 00408025 */        or $s0, $v0, $zero
  /* 137464 801391E4 14810008 */       bne $a0, $at, .L80139208
  /* 137468 801391E8 24050004 */     addiu $a1, $zero, 4
  /* 13746C 801391EC 00402025 */        or $a0, $v0, $zero
  /* 137470 801391F0 AFA30048 */        sw $v1, 0x48($sp)
  /* 137474 801391F4 0C04E1B9 */       jal mnBattleRedrawToken
  /* 137478 801391F8 AFA8004C */        sw $t0, 0x4c($sp)
  /* 13747C 801391FC 8FA30048 */        lw $v1, 0x48($sp)
  /* 137480 80139200 8FA8004C */        lw $t0, 0x4c($sp)
  /* 137484 80139204 8C640084 */        lw $a0, 0x84($v1)
  .L80139208:
  /* 137488 80139208 5480000D */      bnel $a0, $zero, .L80139240
  /* 13748C 8013920C 8C650048 */        lw $a1, 0x48($v1)
  /* 137490 80139210 8C6B0080 */        lw $t3, 0x80($v1)
  /* 137494 80139214 2401FFFF */     addiu $at, $zero, -1
  /* 137498 80139218 24050020 */     addiu $a1, $zero, 0x20
  /* 13749C 8013921C 11610007 */       beq $t3, $at, .L8013923C
  /* 1374A0 80139220 03A83021 */      addu $a2, $sp, $t0
  /* 1374A4 80139224 8CC60050 */        lw $a2, 0x50($a2)
  /* 1374A8 80139228 AFA30048 */        sw $v1, 0x48($sp)
  /* 1374AC 8013922C 8C640004 */        lw $a0, 4($v1)
  /* 1374B0 80139230 0C002834 */       jal omMoveGObjDL
  /* 1374B4 80139234 24C60001 */     addiu $a2, $a2, 1
  /* 1374B8 80139238 8FA30048 */        lw $v1, 0x48($sp)
  .L8013923C:
  /* 1374BC 8013923C 8C650048 */        lw $a1, 0x48($v1)
  .L80139240:
  /* 1374C0 80139240 2401001C */     addiu $at, $zero, 0x1c
  /* 1374C4 80139244 14A10009 */       bne $a1, $at, .L8013926C
  /* 1374C8 80139248 3C01424C */       lui $at, (0x424C0000 >> 16) # 51.0
  /* 1374CC 8013924C 44812000 */      mtc1 $at, $f4 # 51.0 to cop1
  /* 1374D0 80139250 8E0C0074 */        lw $t4, 0x74($s0)
  /* 1374D4 80139254 3C014321 */       lui $at, (0x43210000 >> 16) # 161.0
  /* 1374D8 80139258 44813000 */      mtc1 $at, $f6 # 161.0 to cop1
  /* 1374DC 8013925C E5840058 */      swc1 $f4, 0x58($t4)
  /* 1374E0 80139260 8E0D0074 */        lw $t5, 0x74($s0)
  /* 1374E4 80139264 10000003 */         b .L80139274
  /* 1374E8 80139268 E5A6005C */      swc1 $f6, 0x5c($t5)
  .L8013926C:
  /* 1374EC 8013926C 0C04E1E6 */       jal mnBattleCenterTokenInPortrait
  /* 1374F0 80139270 02002025 */        or $a0, $s0, $zero
  .L80139274:
  /* 1374F4 80139274 8E020074 */        lw $v0, 0x74($s0)
  /* 1374F8 80139278 944E0024 */       lhu $t6, 0x24($v0)
  /* 1374FC 8013927C 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 137500 80139280 A44F0024 */        sh $t7, 0x24($v0)
  /* 137504 80139284 8E020074 */        lw $v0, 0x74($s0)
  /* 137508 80139288 94580024 */       lhu $t8, 0x24($v0)
  /* 13750C 8013928C 37190001 */       ori $t9, $t8, 1
  /* 137510 80139290 A4590024 */        sh $t9, 0x24($v0)
  /* 137514 80139294 8FBF003C */        lw $ra, 0x3c($sp)
  /* 137518 80139298 8FB00038 */        lw $s0, 0x38($sp)
  /* 13751C 8013929C 27BD0088 */     addiu $sp, $sp, 0x88
  /* 137520 801392A0 03E00008 */        jr $ra
  /* 137524 801392A4 00000000 */       nop

glabel getBattleTokenDistance
  /* 137528 801392A8 240700BC */     addiu $a3, $zero, 0xbc
  /* 13752C 801392AC 00A70019 */     multu $a1, $a3
  /* 137530 801392B0 3C068014 */       lui $a2, %hi(gMNBattlePanels)
  /* 137534 801392B4 24C6BA88 */     addiu $a2, $a2, %lo(gMNBattlePanels)
  /* 137538 801392B8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13753C 801392BC AFBF0014 */        sw $ra, 0x14($sp)
  /* 137540 801392C0 00007012 */      mflo $t6
  /* 137544 801392C4 00CE7821 */      addu $t7, $a2, $t6
  /* 137548 801392C8 8DF80004 */        lw $t8, 4($t7)
  /* 13754C 801392CC 00870019 */     multu $a0, $a3
  /* 137550 801392D0 8F020074 */        lw $v0, 0x74($t8)
  /* 137554 801392D4 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 137558 801392D8 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 13755C 801392DC 0000C812 */      mflo $t9
  /* 137560 801392E0 00D94021 */      addu $t0, $a2, $t9
  /* 137564 801392E4 8D090004 */        lw $t1, 4($t0)
  /* 137568 801392E8 8D230074 */        lw $v1, 0x74($t1)
  /* 13756C 801392EC C466005C */      lwc1 $f6, 0x5c($v1)
  /* 137570 801392F0 C46A0058 */      lwc1 $f10, 0x58($v1)
  /* 137574 801392F4 46062001 */     sub.s $f0, $f4, $f6
  /* 137578 801392F8 460A4081 */     sub.s $f2, $f8, $f10
  /* 13757C 801392FC 46000402 */     mul.s $f16, $f0, $f0
  /* 137580 80139300 00000000 */       nop
  /* 137584 80139304 46021482 */     mul.s $f18, $f2, $f2
  /* 137588 80139308 0C00CD44 */       jal sqrtf
  /* 13758C 8013930C 46128300 */     add.s $f12, $f16, $f18
  /* 137590 80139310 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137594 80139314 27BD0018 */     addiu $sp, $sp, 0x18
  /* 137598 80139318 03E00008 */        jr $ra
  /* 13759C 8013931C 00000000 */       nop

glabel mnBattleAutopositionOverlappedTokens
  /* 1375A0 80139320 240800BC */     addiu $t0, $zero, 0xbc
  /* 1375A4 80139324 00880019 */     multu $a0, $t0
  /* 1375A8 80139328 3C028014 */       lui $v0, %hi(gMNBattlePanels)
  /* 1375AC 8013932C 2442BA88 */     addiu $v0, $v0, %lo(gMNBattlePanels)
  /* 1375B0 80139330 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1375B4 80139334 AFA60038 */        sw $a2, 0x38($sp)
  /* 1375B8 80139338 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1375BC 8013933C 24040002 */     addiu $a0, $zero, 2
  /* 1375C0 80139340 3C01BF80 */       lui $at, 0xbf80
  /* 1375C4 80139344 00007012 */      mflo $t6
  /* 1375C8 80139348 004E1821 */      addu $v1, $v0, $t6
  /* 1375CC 8013934C 8C660004 */        lw $a2, 4($v1)
  /* 1375D0 80139350 00A80019 */     multu $a1, $t0
  /* 1375D4 80139354 8CCF0074 */        lw $t7, 0x74($a2)
  /* 1375D8 80139358 C5E00058 */      lwc1 $f0, 0x58($t7)
  /* 1375DC 8013935C 0000C012 */      mflo $t8
  /* 1375E0 80139360 00583821 */      addu $a3, $v0, $t8
  /* 1375E4 80139364 8CF90004 */        lw $t9, 4($a3)
  /* 1375E8 80139368 8F290074 */        lw $t1, 0x74($t9)
  /* 1375EC 8013936C C5220058 */      lwc1 $f2, 0x58($t1)
  /* 1375F0 80139370 46020032 */    c.eq.s $f0, $f2
  /* 1375F4 80139374 00000000 */       nop
  /* 1375F8 80139378 4502000F */     bc1fl .L801393B8
  /* 1375FC 8013937C 46001481 */     sub.s $f18, $f2, $f0
  /* 137600 80139380 AFA30024 */        sw $v1, 0x24($sp)
  /* 137604 80139384 0C006265 */       jal lbRandom_GetIntRange
  /* 137608 80139388 AFA70018 */        sw $a3, 0x18($sp)
  /* 13760C 8013938C 244AFFFF */     addiu $t2, $v0, -1
  /* 137610 80139390 448A3000 */      mtc1 $t2, $f6
  /* 137614 80139394 8FA30024 */        lw $v1, 0x24($sp)
  /* 137618 80139398 8FA70018 */        lw $a3, 0x18($sp)
  /* 13761C 8013939C 46803220 */   cvt.s.w $f8, $f6
  /* 137620 801393A0 C4640090 */      lwc1 $f4, 0x90($v1)
  /* 137624 801393A4 8C660004 */        lw $a2, 4($v1)
  /* 137628 801393A8 46082280 */     add.s $f10, $f4, $f8
  /* 13762C 801393AC 1000000A */         b .L801393D8
  /* 137630 801393B0 E46A0090 */      swc1 $f10, 0x90($v1)
  /* 137634 801393B4 46001481 */     sub.s $f18, $f2, $f0
  .L801393B8:
  /* 137638 801393B8 44818000 */      mtc1 $at, $f16
  /* 13763C 801393BC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 137640 801393C0 44812000 */      mtc1 $at, $f4 # 10.0 to cop1
  /* 137644 801393C4 46128182 */     mul.s $f6, $f16, $f18
  /* 137648 801393C8 C46A0090 */      lwc1 $f10, 0x90($v1)
  /* 13764C 801393CC 46043203 */     div.s $f8, $f6, $f4
  /* 137650 801393D0 46085400 */     add.s $f16, $f10, $f8
  /* 137654 801393D4 E4700090 */      swc1 $f16, 0x90($v1)
  .L801393D8:
  /* 137658 801393D8 8CEC0004 */        lw $t4, 4($a3)
  /* 13765C 801393DC 8CCB0074 */        lw $t3, 0x74($a2)
  /* 137660 801393E0 24040002 */     addiu $a0, $zero, 2
  /* 137664 801393E4 8D8D0074 */        lw $t5, 0x74($t4)
  /* 137668 801393E8 C560005C */      lwc1 $f0, 0x5c($t3)
  /* 13766C 801393EC 3C01BF80 */       lui $at, 0xbf80
  /* 137670 801393F0 C5A2005C */      lwc1 $f2, 0x5c($t5)
  /* 137674 801393F4 46020032 */    c.eq.s $f0, $f2
  /* 137678 801393F8 00000000 */       nop
  /* 13767C 801393FC 4502000C */     bc1fl .L80139430
  /* 137680 80139400 46001401 */     sub.s $f16, $f2, $f0
  /* 137684 80139404 0C006265 */       jal lbRandom_GetIntRange
  /* 137688 80139408 AFA30024 */        sw $v1, 0x24($sp)
  /* 13768C 8013940C 244EFFFF */     addiu $t6, $v0, -1
  /* 137690 80139410 448E3000 */      mtc1 $t6, $f6
  /* 137694 80139414 8FA30024 */        lw $v1, 0x24($sp)
  /* 137698 80139418 46803120 */   cvt.s.w $f4, $f6
  /* 13769C 8013941C C4720094 */      lwc1 $f18, 0x94($v1)
  /* 1376A0 80139420 46049280 */     add.s $f10, $f18, $f4
  /* 1376A4 80139424 1000000A */         b .L80139450
  /* 1376A8 80139428 E46A0094 */      swc1 $f10, 0x94($v1)
  /* 1376AC 8013942C 46001401 */     sub.s $f16, $f2, $f0
  .L80139430:
  /* 1376B0 80139430 44814000 */      mtc1 $at, $f8
  /* 1376B4 80139434 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1376B8 80139438 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 1376BC 8013943C 46104182 */     mul.s $f6, $f8, $f16
  /* 1376C0 80139440 C46A0094 */      lwc1 $f10, 0x94($v1)
  /* 1376C4 80139444 46123103 */     div.s $f4, $f6, $f18
  /* 1376C8 80139448 46045200 */     add.s $f8, $f10, $f4
  /* 1376CC 8013944C E4680094 */      swc1 $f8, 0x94($v1)
  .L80139450:
  /* 1376D0 80139450 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1376D4 80139454 27BD0030 */     addiu $sp, $sp, 0x30
  /* 1376D8 80139458 03E00008 */        jr $ra
  /* 1376DC 8013945C 00000000 */       nop

glabel mnBattleAutopositionTokenFromPortraitEdges
  /* 1376E0 80139460 00047080 */       sll $t6, $a0, 2
  /* 1376E4 80139464 01C47023 */      subu $t6, $t6, $a0
  /* 1376E8 80139468 000E7100 */       sll $t6, $t6, 4
  /* 1376EC 8013946C 01C47023 */      subu $t6, $t6, $a0
  /* 1376F0 80139470 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 1376F4 80139474 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1376F8 80139478 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 1376FC 8013947C 000E7080 */       sll $t6, $t6, 2
  /* 137700 80139480 AFBF0014 */        sw $ra, 0x14($sp)
  /* 137704 80139484 01CF1821 */      addu $v1, $t6, $t7
  /* 137708 80139488 8C640048 */        lw $a0, 0x48($v1)
  /* 13770C 8013948C 0C04C85A */       jal mnBattleGetPortraitId
  /* 137710 80139490 AFA3001C */        sw $v1, 0x1c($sp)
  /* 137714 80139494 28410006 */      slti $at, $v0, 6
  /* 137718 80139498 14200003 */      bnez $at, .L801394A8
  /* 13771C 8013949C 8FA3001C */        lw $v1, 0x1c($sp)
  /* 137720 801394A0 10000002 */         b .L801394AC
  /* 137724 801394A4 2444FFFA */     addiu $a0, $v0, -6
  .L801394A8:
  /* 137728 801394A8 00402025 */        or $a0, $v0, $zero
  .L801394AC:
  /* 13772C 801394AC 0004C080 */       sll $t8, $a0, 2
  /* 137730 801394B0 0304C023 */      subu $t8, $t8, $a0
  /* 137734 801394B4 0018C080 */       sll $t8, $t8, 2
  /* 137738 801394B8 0304C023 */      subu $t8, $t8, $a0
  /* 13773C 801394BC 0018C080 */       sll $t8, $t8, 2
  /* 137740 801394C0 0304C021 */      addu $t8, $t8, $a0
  /* 137744 801394C4 27190019 */     addiu $t9, $t8, 0x19
  /* 137748 801394C8 44992000 */      mtc1 $t9, $f4
  /* 13774C 801394CC 28410006 */      slti $at, $v0, 6
  /* 137750 801394D0 14200003 */      bnez $at, .L801394E0
  /* 137754 801394D4 468023A0 */   cvt.s.w $f14, $f4
  /* 137758 801394D8 10000002 */         b .L801394E4
  /* 13775C 801394DC 24040001 */     addiu $a0, $zero, 1
  .L801394E0:
  /* 137760 801394E0 00002025 */        or $a0, $zero, $zero
  .L801394E4:
  /* 137764 801394E4 8C680004 */        lw $t0, 4($v1)
  /* 137768 801394E8 C4660090 */      lwc1 $f6, 0x90($v1)
  /* 13776C 801394EC 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 137770 801394F0 8D020074 */        lw $v0, 0x74($t0)
  /* 137774 801394F4 44818000 */      mtc1 $at, $f16 # 5.0 to cop1
  /* 137778 801394F8 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 13777C 801394FC C4480058 */      lwc1 $f8, 0x58($v0)
  /* 137780 80139500 44812000 */      mtc1 $at, $f4 # 13.0 to cop1
  /* 137784 80139504 46107300 */     add.s $f12, $f14, $f16
  /* 137788 80139508 00044880 */       sll $t1, $a0, 2
  /* 13778C 8013950C 01244823 */      subu $t1, $t1, $a0
  /* 137790 80139510 46083280 */     add.s $f10, $f6, $f8
  /* 137794 80139514 C4660094 */      lwc1 $f6, 0x94($v1)
  /* 137798 80139518 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 13779C 8013951C 00094880 */       sll $t1, $t1, 2
  /* 1377A0 80139520 46045000 */     add.s $f0, $f10, $f4
  /* 1377A4 80139524 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 1377A8 80139528 01244823 */      subu $t1, $t1, $a0
  /* 1377AC 8013952C 46083280 */     add.s $f10, $f6, $f8
  /* 1377B0 80139530 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 1377B4 80139534 00094880 */       sll $t1, $t1, 2
  /* 1377B8 80139538 460C003C */    c.lt.s $f0, $f12
  /* 1377BC 8013953C 01244823 */      subu $t1, $t1, $a0
  /* 1377C0 80139540 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1377C4 80139544 252A0024 */     addiu $t2, $t1, 0x24
  /* 1377C8 80139548 45000006 */      bc1f .L80139564
  /* 1377CC 8013954C 46045080 */     add.s $f2, $f10, $f4
  /* 1377D0 80139550 46006181 */     sub.s $f6, $f12, $f0
  /* 1377D4 80139554 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 1377D8 80139558 00000000 */       nop
  /* 1377DC 8013955C 46123203 */     div.s $f8, $f6, $f18
  /* 1377E0 80139560 E4680090 */      swc1 $f8, 0x90($v1)
  .L80139564:
  /* 1377E4 80139564 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1377E8 80139568 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 1377EC 8013956C 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 1377F0 80139570 44815000 */      mtc1 $at, $f10 # 45.0 to cop1
  /* 1377F4 80139574 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1377F8 80139578 460A7100 */     add.s $f4, $f14, $f10
  /* 1377FC 8013957C 46102301 */     sub.s $f12, $f4, $f16
  /* 137800 80139580 4600603C */    c.lt.s $f12, $f0
  /* 137804 80139584 00000000 */       nop
  /* 137808 80139588 45020008 */     bc1fl .L801395AC
  /* 13780C 8013958C 448A3000 */      mtc1 $t2, $f6
  /* 137810 80139590 460C0181 */     sub.s $f6, $f0, $f12
  /* 137814 80139594 44814000 */      mtc1 $at, $f8 # -1.0 to cop1
  /* 137818 80139598 00000000 */       nop
  /* 13781C 8013959C 46083282 */     mul.s $f10, $f6, $f8
  /* 137820 801395A0 46125103 */     div.s $f4, $f10, $f18
  /* 137824 801395A4 E4640090 */      swc1 $f4, 0x90($v1)
  /* 137828 801395A8 448A3000 */      mtc1 $t2, $f6
  .L801395AC:
  /* 13782C 801395AC 3C01422C */       lui $at, (0x422C0000 >> 16) # 43.0
  /* 137830 801395B0 44812000 */      mtc1 $at, $f4 # 43.0 to cop1
  /* 137834 801395B4 46803020 */   cvt.s.w $f0, $f6
  /* 137838 801395B8 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13783C 801395BC 46100300 */     add.s $f12, $f0, $f16
  /* 137840 801395C0 46040180 */     add.s $f6, $f0, $f4
  /* 137844 801395C4 460C103C */    c.lt.s $f2, $f12
  /* 137848 801395C8 00000000 */       nop
  /* 13784C 801395CC 45020005 */     bc1fl .L801395E4
  /* 137850 801395D0 46103301 */     sub.s $f12, $f6, $f16
  /* 137854 801395D4 46026201 */     sub.s $f8, $f12, $f2
  /* 137858 801395D8 46124283 */     div.s $f10, $f8, $f18
  /* 13785C 801395DC E46A0094 */      swc1 $f10, 0x94($v1)
  /* 137860 801395E0 46103301 */     sub.s $f12, $f6, $f16
  .L801395E4:
  /* 137864 801395E4 4602603C */    c.lt.s $f12, $f2
  /* 137868 801395E8 00000000 */       nop
  /* 13786C 801395EC 45020008 */     bc1fl .L80139610
  /* 137870 801395F0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137874 801395F4 460C1201 */     sub.s $f8, $f2, $f12
  /* 137878 801395F8 44815000 */      mtc1 $at, $f10 # -1.0 to cop1
  /* 13787C 801395FC 00000000 */       nop
  /* 137880 80139600 460A4102 */     mul.s $f4, $f8, $f10
  /* 137884 80139604 46122183 */     div.s $f6, $f4, $f18
  /* 137888 80139608 E4660094 */      swc1 $f6, 0x94($v1)
  /* 13788C 8013960C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80139610:
  /* 137890 80139610 27BD0038 */     addiu $sp, $sp, 0x38
  /* 137894 80139614 03E00008 */        jr $ra
  /* 137898 80139618 00000000 */       nop

glabel mnBattleAutopositionPlacedToken
  /* 13789C 8013961C 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 1378A0 80139620 00047080 */       sll $t6, $a0, 2
  /* 1378A4 80139624 01C47023 */      subu $t6, $t6, $a0
  /* 1378A8 80139628 000E7100 */       sll $t6, $t6, 4
  /* 1378AC 8013962C F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 1378B0 80139630 01C47023 */      subu $t6, $t6, $a0
  /* 1378B4 80139634 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 1378B8 80139638 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1378BC 8013963C AFB40038 */        sw $s4, 0x38($sp)
  /* 1378C0 80139640 AFB30034 */        sw $s3, 0x34($sp)
  /* 1378C4 80139644 AFB20030 */        sw $s2, 0x30($sp)
  /* 1378C8 80139648 AFB00028 */        sw $s0, 0x28($sp)
  /* 1378CC 8013964C 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 1378D0 80139650 000E7080 */       sll $t6, $t6, 2
  /* 1378D4 80139654 4481A000 */      mtc1 $at, $f20 # -1.0 to cop1
  /* 1378D8 80139658 00809025 */        or $s2, $a0, $zero
  /* 1378DC 8013965C AFBF004C */        sw $ra, 0x4c($sp)
  /* 1378E0 80139660 AFBE0048 */        sw $fp, 0x48($sp)
  /* 1378E4 80139664 AFB70044 */        sw $s7, 0x44($sp)
  /* 1378E8 80139668 AFB60040 */        sw $s6, 0x40($sp)
  /* 1378EC 8013966C AFB5003C */        sw $s5, 0x3c($sp)
  /* 1378F0 80139670 AFB1002C */        sw $s1, 0x2c($sp)
  /* 1378F4 80139674 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 1378F8 80139678 01CF9821 */      addu $s3, $t6, $t7
  /* 1378FC 8013967C 00008025 */        or $s0, $zero, $zero
  /* 137900 80139680 27B4006C */     addiu $s4, $sp, 0x6c
  .L80139684:
  /* 137904 80139684 1250000A */       beq $s2, $s0, .L801396B0
  /* 137908 80139688 00104080 */       sll $t0, $s0, 2
  /* 13790C 8013968C 8E780058 */        lw $t8, 0x58($s3)
  /* 137910 80139690 02402025 */        or $a0, $s2, $zero
  /* 137914 80139694 02002825 */        or $a1, $s0, $zero
  /* 137918 80139698 13000007 */      beqz $t8, .L801396B8
  /* 13791C 8013969C 0010C880 */       sll $t9, $s0, 2
  /* 137920 801396A0 0C04E4AA */       jal getBattleTokenDistance
  /* 137924 801396A4 02998821 */      addu $s1, $s4, $t9
  /* 137928 801396A8 10000003 */         b .L801396B8
  /* 13792C 801396AC E6200000 */      swc1 $f0, ($s1)
  .L801396B0:
  /* 137930 801396B0 02884821 */      addu $t1, $s4, $t0
  /* 137934 801396B4 E5340000 */      swc1 $f20, ($t1)
  .L801396B8:
  /* 137938 801396B8 26100001 */     addiu $s0, $s0, 1
  /* 13793C 801396BC 2A010004 */      slti $at, $s0, 4
  /* 137940 801396C0 1420FFF0 */      bnez $at, .L80139684
  /* 137944 801396C4 00000000 */       nop
  /* 137948 801396C8 4480B000 */      mtc1 $zero, $f22
  /* 13794C 801396CC 3C014170 */       lui $at, (0x41700000 >> 16) # 15.0
  /* 137950 801396D0 3C148014 */       lui $s4, %hi(gMNBattlePanels)
  /* 137954 801396D4 4481A000 */      mtc1 $at, $f20 # 15.0 to cop1
  /* 137958 801396D8 2694BA88 */     addiu $s4, $s4, %lo(gMNBattlePanels)
  /* 13795C 801396DC 00008025 */        or $s0, $zero, $zero
  /* 137960 801396E0 27B1006C */     addiu $s1, $sp, 0x6c
  /* 137964 801396E4 241E0004 */     addiu $fp, $zero, 4
  /* 137968 801396E8 24170001 */     addiu $s7, $zero, 1
  /* 13796C 801396EC 2416001C */     addiu $s6, $zero, 0x1c
  /* 137970 801396F0 241500BC */     addiu $s5, $zero, 0xbc
  /* 137974 801396F4 E6760090 */      swc1 $f22, 0x90($s3)
  /* 137978 801396F8 E6760094 */      swc1 $f22, 0x94($s3)
  .L801396FC:
  /* 13797C 801396FC C6200000 */      lwc1 $f0, ($s1)
  /* 137980 80139700 00001025 */        or $v0, $zero, $zero
  /* 137984 80139704 4600B03E */    c.le.s $f22, $f0
  /* 137988 80139708 00000000 */       nop
  /* 13798C 8013970C 45000007 */      bc1f .L8013972C
  /* 137990 80139710 00000000 */       nop
  /* 137994 80139714 4614003E */    c.le.s $f0, $f20
  /* 137998 80139718 00000000 */       nop
  /* 13799C 8013971C 45000003 */      bc1f .L8013972C
  /* 1379A0 80139720 00000000 */       nop
  /* 1379A4 80139724 10000001 */         b .L8013972C
  /* 1379A8 80139728 02E01025 */        or $v0, $s7, $zero
  .L8013972C:
  /* 1379AC 8013972C 50400015 */      beql $v0, $zero, .L80139784
  /* 1379B0 80139730 26100001 */     addiu $s0, $s0, 1
  /* 1379B4 80139734 02150019 */     multu $s0, $s5
  /* 1379B8 80139738 8E620048 */        lw $v0, 0x48($s3)
  /* 1379BC 8013973C 00005012 */      mflo $t2
  /* 1379C0 80139740 028A1821 */      addu $v1, $s4, $t2
  /* 1379C4 80139744 8C6B0048 */        lw $t3, 0x48($v1)
  /* 1379C8 80139748 544B000E */      bnel $v0, $t3, .L80139784
  /* 1379CC 8013974C 26100001 */     addiu $s0, $s0, 1
  /* 1379D0 80139750 52C2000C */      beql $s6, $v0, .L80139784
  /* 1379D4 80139754 26100001 */     addiu $s0, $s0, 1
  /* 1379D8 80139758 8C6C0058 */        lw $t4, 0x58($v1)
  /* 1379DC 8013975C 56EC0009 */      bnel $s7, $t4, .L80139784
  /* 1379E0 80139760 26100001 */     addiu $s0, $s0, 1
  /* 1379E4 80139764 4600A101 */     sub.s $f4, $f20, $f0
  /* 1379E8 80139768 02402025 */        or $a0, $s2, $zero
  /* 1379EC 8013976C 02002825 */        or $a1, $s0, $zero
  /* 1379F0 80139770 46142183 */     div.s $f6, $f4, $f20
  /* 1379F4 80139774 44063000 */      mfc1 $a2, $f6
  /* 1379F8 80139778 0C04E4C8 */       jal mnBattleAutopositionOverlappedTokens
  /* 1379FC 8013977C 00000000 */       nop
  /* 137A00 80139780 26100001 */     addiu $s0, $s0, 1
  .L80139784:
  /* 137A04 80139784 161EFFDD */       bne $s0, $fp, .L801396FC
  /* 137A08 80139788 26310004 */     addiu $s1, $s1, 4
  /* 137A0C 8013978C 0C04E518 */       jal mnBattleAutopositionTokenFromPortraitEdges
  /* 137A10 80139790 02402025 */        or $a0, $s2, $zero
  /* 137A14 80139794 8FBF004C */        lw $ra, 0x4c($sp)
  /* 137A18 80139798 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 137A1C 8013979C D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 137A20 801397A0 8FB00028 */        lw $s0, 0x28($sp)
  /* 137A24 801397A4 8FB1002C */        lw $s1, 0x2c($sp)
  /* 137A28 801397A8 8FB20030 */        lw $s2, 0x30($sp)
  /* 137A2C 801397AC 8FB30034 */        lw $s3, 0x34($sp)
  /* 137A30 801397B0 8FB40038 */        lw $s4, 0x38($sp)
  /* 137A34 801397B4 8FB5003C */        lw $s5, 0x3c($sp)
  /* 137A38 801397B8 8FB60040 */        lw $s6, 0x40($sp)
  /* 137A3C 801397BC 8FB70044 */        lw $s7, 0x44($sp)
  /* 137A40 801397C0 8FBE0048 */        lw $fp, 0x48($sp)
  /* 137A44 801397C4 03E00008 */        jr $ra
  /* 137A48 801397C8 27BD0080 */     addiu $sp, $sp, 0x80

glabel mnBattleAutopositionRecalledToken
  /* 137A4C 801397CC 00047080 */       sll $t6, $a0, 2
  /* 137A50 801397D0 01C47023 */      subu $t6, $t6, $a0
  /* 137A54 801397D4 000E7100 */       sll $t6, $t6, 4
  /* 137A58 801397D8 01C47023 */      subu $t6, $t6, $a0
  /* 137A5C 801397DC 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 137A60 801397E0 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 137A64 801397E4 000E7080 */       sll $t6, $t6, 2
  /* 137A68 801397E8 01CF1021 */      addu $v0, $t6, $t7
  /* 137A6C 801397EC 8C580078 */        lw $t8, 0x78($v0)
  /* 137A70 801397F0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 137A74 801397F4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 137A78 801397F8 27190001 */     addiu $t9, $t8, 1
  /* 137A7C 801397FC 2B21000B */      slti $at, $t9, 0xb
  /* 137A80 80139800 AC590078 */        sw $t9, 0x78($v0)
  /* 137A84 80139804 1020001A */      beqz $at, .L80139870
  /* 137A88 80139808 03201825 */        or $v1, $t9, $zero
  /* 137A8C 8013980C C4440068 */      lwc1 $f4, 0x68($v0)
  /* 137A90 80139810 C4460064 */      lwc1 $f6, 0x64($v0)
  /* 137A94 80139814 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 137A98 80139818 44815000 */      mtc1 $at, $f10 # 10.0 to cop1
  /* 137A9C 8013981C 46062201 */     sub.s $f8, $f4, $f6
  /* 137AA0 80139820 2B210006 */      slti $at, $t9, 6
  /* 137AA4 80139824 10200008 */      beqz $at, .L80139848
  /* 137AA8 80139828 460A4083 */     div.s $f2, $f8, $f10
  /* 137AAC 8013982C C4500070 */      lwc1 $f16, 0x70($v0)
  /* 137AB0 80139830 C452006C */      lwc1 $f18, 0x6c($v0)
  /* 137AB4 80139834 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 137AB8 80139838 44813000 */      mtc1 $at, $f6 # 5.0 to cop1
  /* 137ABC 8013983C 46128101 */     sub.s $f4, $f16, $f18
  /* 137AC0 80139840 10000007 */         b .L80139860
  /* 137AC4 80139844 46062003 */     div.s $f0, $f4, $f6
  .L80139848:
  /* 137AC8 80139848 C4480074 */      lwc1 $f8, 0x74($v0)
  /* 137ACC 8013984C C44A0070 */      lwc1 $f10, 0x70($v0)
  /* 137AD0 80139850 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 137AD4 80139854 44819000 */      mtc1 $at, $f18 # 5.0 to cop1
  /* 137AD8 80139858 460A4401 */     sub.s $f16, $f8, $f10
  /* 137ADC 8013985C 46128003 */     div.s $f0, $f16, $f18
  .L80139860:
  /* 137AE0 80139860 E4420090 */      swc1 $f2, 0x90($v0)
  /* 137AE4 80139864 E4400094 */      swc1 $f0, 0x94($v0)
  /* 137AE8 80139868 1000000B */         b .L80139898
  /* 137AEC 8013986C 8C430078 */        lw $v1, 0x78($v0)
  .L80139870:
  /* 137AF0 80139870 2401000B */     addiu $at, $zero, 0xb
  /* 137AF4 80139874 14610008 */       bne $v1, $at, .L80139898
  /* 137AF8 80139878 00802825 */        or $a1, $a0, $zero
  /* 137AFC 8013987C 0C04DD83 */       jal mnBattleHandleCursorPickup
  /* 137B00 80139880 AFA2001C */        sw $v0, 0x1c($sp)
  /* 137B04 80139884 8FA2001C */        lw $v0, 0x1c($sp)
  /* 137B08 80139888 44800000 */      mtc1 $zero, $f0
  /* 137B0C 8013988C 8C430078 */        lw $v1, 0x78($v0)
  /* 137B10 80139890 E4400090 */      swc1 $f0, 0x90($v0)
  /* 137B14 80139894 E4400094 */      swc1 $f0, 0x94($v0)
  .L80139898:
  /* 137B18 80139898 2401001E */     addiu $at, $zero, 0x1e
  /* 137B1C 8013989C 54610003 */      bnel $v1, $at, .L801398AC
  /* 137B20 801398A0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137B24 801398A4 AC40005C */        sw $zero, 0x5c($v0)
  /* 137B28 801398A8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801398AC:
  /* 137B2C 801398AC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 137B30 801398B0 03E00008 */        jr $ra
  /* 137B34 801398B4 00000000 */       nop

glabel mnBattleAutopositionToken
  /* 137B38 801398B8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 137B3C 801398BC AFB1001C */        sw $s1, 0x1c($sp)
  /* 137B40 801398C0 AFB20020 */        sw $s2, 0x20($sp)
  /* 137B44 801398C4 AFB00018 */        sw $s0, 0x18($sp)
  /* 137B48 801398C8 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 137B4C 801398CC AFBF0024 */        sw $ra, 0x24($sp)
  /* 137B50 801398D0 AFA40028 */        sw $a0, 0x28($sp)
  /* 137B54 801398D4 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 137B58 801398D8 00008025 */        or $s0, $zero, $zero
  /* 137B5C 801398DC 24120004 */     addiu $s2, $zero, 4
  .L801398E0:
  /* 137B60 801398E0 8E2E005C */        lw $t6, 0x5c($s1) # gMNBattlePanels + 92
  /* 137B64 801398E4 51C00004 */      beql $t6, $zero, .L801398F8
  /* 137B68 801398E8 8E2F0058 */        lw $t7, 0x58($s1) # gMNBattlePanels + 88
  /* 137B6C 801398EC 0C04E5F3 */       jal mnBattleAutopositionRecalledToken
  /* 137B70 801398F0 02002025 */        or $a0, $s0, $zero
  /* 137B74 801398F4 8E2F0058 */        lw $t7, 0x58($s1) # gMNBattlePanels + 88
  .L801398F8:
  /* 137B78 801398F8 51E00004 */      beql $t7, $zero, .L8013990C
  /* 137B7C 801398FC 26100001 */     addiu $s0, $s0, 1
  /* 137B80 80139900 0C04E587 */       jal mnBattleAutopositionPlacedToken
  /* 137B84 80139904 02002025 */        or $a0, $s0, $zero
  /* 137B88 80139908 26100001 */     addiu $s0, $s0, 1
  .L8013990C:
  /* 137B8C 8013990C 1612FFF4 */       bne $s0, $s2, .L801398E0
  /* 137B90 80139910 263100BC */     addiu $s1, $s1, 0xbc
  /* 137B94 80139914 8FBF0024 */        lw $ra, 0x24($sp)
  /* 137B98 80139918 8FB00018 */        lw $s0, 0x18($sp)
  /* 137B9C 8013991C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 137BA0 80139920 8FB20020 */        lw $s2, 0x20($sp)
  /* 137BA4 80139924 03E00008 */        jr $ra
  /* 137BA8 80139928 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBattleCreateTokenAutopositionRoutine
  /* 137BAC 8013992C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 137BB0 80139930 AFBF0014 */        sw $ra, 0x14($sp)
  /* 137BB4 80139934 00002025 */        or $a0, $zero, $zero
  /* 137BB8 80139938 00002825 */        or $a1, $zero, $zero
  /* 137BBC 8013993C 2406001A */     addiu $a2, $zero, 0x1a
  /* 137BC0 80139940 0C00265A */       jal omMakeGObjSPAfter
  /* 137BC4 80139944 3C078000 */       lui $a3, 0x8000
  /* 137BC8 80139948 3C058014 */       lui $a1, %hi(mnBattleAutopositionToken)
  /* 137BCC 8013994C 24A598B8 */     addiu $a1, $a1, %lo(mnBattleAutopositionToken)
  /* 137BD0 80139950 00402025 */        or $a0, $v0, $zero
  /* 137BD4 80139954 24060001 */     addiu $a2, $zero, 1
  /* 137BD8 80139958 0C002062 */       jal omAddGObjCommonProc
  /* 137BDC 8013995C 24070001 */     addiu $a3, $zero, 1
  /* 137BE0 80139960 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137BE4 80139964 27BD0018 */     addiu $sp, $sp, 0x18
  /* 137BE8 80139968 03E00008 */        jr $ra
  /* 137BEC 8013996C 00000000 */       nop

glabel mnBattleUpdateTokenShinePulseColor
  /* 137BF0 80139970 3C038014 */       lui $v1, %hi(gMNBattleIsTokenShineIncreasing)
  /* 137BF4 80139974 2463BDB8 */     addiu $v1, $v1, %lo(gMNBattleIsTokenShineIncreasing)
  /* 137BF8 80139978 8C620000 */        lw $v0, ($v1) # gMNBattleIsTokenShineIncreasing + 0
  /* 137BFC 8013997C AFA40000 */        sw $a0, ($sp)
  /* 137C00 80139980 3C048014 */       lui $a0, %hi(gMNBattleTokenShinePulseColor)
  /* 137C04 80139984 1440000A */      bnez $v0, .L801399B0
  /* 137C08 80139988 2484BDB4 */     addiu $a0, $a0, %lo(gMNBattleTokenShinePulseColor)
  /* 137C0C 8013998C 8C8E0000 */        lw $t6, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C10 80139990 241900FF */     addiu $t9, $zero, 0xff
  /* 137C14 80139994 25CF0009 */     addiu $t7, $t6, 9
  /* 137C18 80139998 29E10100 */      slti $at, $t7, 0x100
  /* 137C1C 8013999C 14200004 */      bnez $at, .L801399B0
  /* 137C20 801399A0 AC8F0000 */        sw $t7, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C24 801399A4 24020001 */     addiu $v0, $zero, 1
  /* 137C28 801399A8 AC990000 */        sw $t9, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C2C 801399AC AC620000 */        sw $v0, ($v1) # gMNBattleIsTokenShineIncreasing + 0
  .L801399B0:
  /* 137C30 801399B0 3C048014 */       lui $a0, %hi(gMNBattleTokenShinePulseColor)
  /* 137C34 801399B4 24010001 */     addiu $at, $zero, 1
  /* 137C38 801399B8 14410009 */       bne $v0, $at, .L801399E0
  /* 137C3C 801399BC 2484BDB4 */     addiu $a0, $a0, %lo(gMNBattleTokenShinePulseColor)
  /* 137C40 801399C0 8C890000 */        lw $t1, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C44 801399C4 240C0080 */     addiu $t4, $zero, 0x80
  /* 137C48 801399C8 252AFFF7 */     addiu $t2, $t1, -9
  /* 137C4C 801399CC 29410080 */      slti $at, $t2, 0x80
  /* 137C50 801399D0 10200003 */      beqz $at, .L801399E0
  /* 137C54 801399D4 AC8A0000 */        sw $t2, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C58 801399D8 AC8C0000 */        sw $t4, ($a0) # gMNBattleTokenShinePulseColor + 0
  /* 137C5C 801399DC AC600000 */        sw $zero, ($v1) # gMNBattleIsTokenShineIncreasing + 0
  .L801399E0:
  /* 137C60 801399E0 03E00008 */        jr $ra
  /* 137C64 801399E4 00000000 */       nop

glabel mnBattleCreateTokenShinePulseRoutine
  /* 137C68 801399E8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 137C6C 801399EC AFBF0014 */        sw $ra, 0x14($sp)
  /* 137C70 801399F0 00002025 */        or $a0, $zero, $zero
  /* 137C74 801399F4 00002825 */        or $a1, $zero, $zero
  /* 137C78 801399F8 2406001A */     addiu $a2, $zero, 0x1a
  /* 137C7C 801399FC 0C00265A */       jal omMakeGObjSPAfter
  /* 137C80 80139A00 3C078000 */       lui $a3, 0x8000
  /* 137C84 80139A04 3C058014 */       lui $a1, %hi(mnBattleUpdateTokenShinePulseColor)
  /* 137C88 80139A08 24A59970 */     addiu $a1, $a1, %lo(mnBattleUpdateTokenShinePulseColor)
  /* 137C8C 80139A0C 00402025 */        or $a0, $v0, $zero
  /* 137C90 80139A10 24060001 */     addiu $a2, $zero, 1
  /* 137C94 80139A14 0C002062 */       jal omAddGObjCommonProc
  /* 137C98 80139A18 24070001 */     addiu $a3, $zero, 1
  /* 137C9C 80139A1C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137CA0 80139A20 27BD0018 */     addiu $sp, $sp, 0x18
  /* 137CA4 80139A24 03E00008 */        jr $ra
  /* 137CA8 80139A28 00000000 */       nop

glabel mnBattleSyncShadeAndCostume
  /* 137CAC 80139A2C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 137CB0 80139A30 3C0E8014 */       lui $t6, %hi(gMNBattleIsTeamBattle)
  /* 137CB4 80139A34 8DCEBDA8 */        lw $t6, %lo(gMNBattleIsTeamBattle)($t6)
  /* 137CB8 80139A38 24010001 */     addiu $at, $zero, 1
  /* 137CBC 80139A3C AFBF002C */        sw $ra, 0x2c($sp)
  /* 137CC0 80139A40 AFB40028 */        sw $s4, 0x28($sp)
  /* 137CC4 80139A44 AFB30024 */        sw $s3, 0x24($sp)
  /* 137CC8 80139A48 AFB20020 */        sw $s2, 0x20($sp)
  /* 137CCC 80139A4C AFB1001C */        sw $s1, 0x1c($sp)
  /* 137CD0 80139A50 AFB00018 */        sw $s0, 0x18($sp)
  /* 137CD4 80139A54 15C10015 */       bne $t6, $at, .L80139AAC
  /* 137CD8 80139A58 AFA40030 */        sw $a0, 0x30($sp)
  /* 137CDC 80139A5C 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 137CE0 80139A60 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 137CE4 80139A64 00008825 */        or $s1, $zero, $zero
  /* 137CE8 80139A68 24140004 */     addiu $s4, $zero, 4
  /* 137CEC 80139A6C 2413001C */     addiu $s3, $zero, 0x1c
  .L80139A70:
  /* 137CF0 80139A70 8E0F0048 */        lw $t7, 0x48($s0) # gMNBattlePanels + 72
  /* 137CF4 80139A74 526F0009 */      beql $s3, $t7, .L80139A9C
  /* 137CF8 80139A78 26310001 */     addiu $s1, $s1, 1
  /* 137CFC 80139A7C 0C04C6DE */       jal mnBattleGetShade
  /* 137D00 80139A80 02202025 */        or $a0, $s1, $zero
  /* 137D04 80139A84 AE020050 */        sw $v0, 0x50($s0) # gMNBattlePanels + 80
  /* 137D08 80139A88 8E040008 */        lw $a0, 8($s0) # gMNBattlePanels + 8
  /* 137D0C 80139A8C 8E05004C */        lw $a1, 0x4c($s0) # gMNBattlePanels + 76
  /* 137D10 80139A90 0C03A492 */       jal func_ovl2_800E9248
  /* 137D14 80139A94 00403025 */        or $a2, $v0, $zero
  /* 137D18 80139A98 26310001 */     addiu $s1, $s1, 1
  .L80139A9C:
  /* 137D1C 80139A9C 1634FFF4 */       bne $s1, $s4, .L80139A70
  /* 137D20 80139AA0 261000BC */     addiu $s0, $s0, 0xbc
  /* 137D24 80139AA4 10000022 */         b .L80139B30
  /* 137D28 80139AA8 8FBF002C */        lw $ra, 0x2c($sp)
  .L80139AAC:
  /* 137D2C 80139AAC 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 137D30 80139AB0 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 137D34 80139AB4 00008825 */        or $s1, $zero, $zero
  /* 137D38 80139AB8 24140004 */     addiu $s4, $zero, 4
  /* 137D3C 80139ABC 2413001C */     addiu $s3, $zero, 0x1c
  .L80139AC0:
  /* 137D40 80139AC0 8E040048 */        lw $a0, 0x48($s0) # gMNBattlePanels + 72
  /* 137D44 80139AC4 52640017 */      beql $s3, $a0, .L80139B24
  /* 137D48 80139AC8 26310001 */     addiu $s1, $s1, 1
  /* 137D4C 80139ACC 0C04D182 */       jal mnBattleGetAdditionalSelectedCount
  /* 137D50 80139AD0 00000000 */       nop
  /* 137D54 80139AD4 14400012 */      bnez $v0, .L80139B20
  /* 137D58 80139AD8 00002825 */        or $a1, $zero, $zero
  /* 137D5C 80139ADC 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 137D60 80139AE0 8E040048 */        lw $a0, 0x48($s0) # gMNBattlePanels + 72
  /* 137D64 80139AE4 8E18004C */        lw $t8, 0x4c($s0) # gMNBattlePanels + 76
  /* 137D68 80139AE8 00409025 */        or $s2, $v0, $zero
  /* 137D6C 80139AEC 5058000D */      beql $v0, $t8, .L80139B24
  /* 137D70 80139AF0 26310001 */     addiu $s1, $s1, 1
  /* 137D74 80139AF4 8E190088 */        lw $t9, 0x88($s0) # gMNBattlePanels + 136
  /* 137D78 80139AF8 5720000A */      bnel $t9, $zero, .L80139B24
  /* 137D7C 80139AFC 26310001 */     addiu $s1, $s1, 1
  /* 137D80 80139B00 0C04C6DE */       jal mnBattleGetShade
  /* 137D84 80139B04 02202025 */        or $a0, $s1, $zero
  /* 137D88 80139B08 AE020050 */        sw $v0, 0x50($s0) # gMNBattlePanels + 80
  /* 137D8C 80139B0C 8E040008 */        lw $a0, 8($s0) # gMNBattlePanels + 8
  /* 137D90 80139B10 02402825 */        or $a1, $s2, $zero
  /* 137D94 80139B14 0C03A492 */       jal func_ovl2_800E9248
  /* 137D98 80139B18 00403025 */        or $a2, $v0, $zero
  /* 137D9C 80139B1C AE12004C */        sw $s2, 0x4c($s0) # gMNBattlePanels + 76
  .L80139B20:
  /* 137DA0 80139B20 26310001 */     addiu $s1, $s1, 1
  .L80139B24:
  /* 137DA4 80139B24 1634FFE6 */       bne $s1, $s4, .L80139AC0
  /* 137DA8 80139B28 261000BC */     addiu $s0, $s0, 0xbc
  /* 137DAC 80139B2C 8FBF002C */        lw $ra, 0x2c($sp)
  .L80139B30:
  /* 137DB0 80139B30 8FB00018 */        lw $s0, 0x18($sp)
  /* 137DB4 80139B34 8FB1001C */        lw $s1, 0x1c($sp)
  /* 137DB8 80139B38 8FB20020 */        lw $s2, 0x20($sp)
  /* 137DBC 80139B3C 8FB30024 */        lw $s3, 0x24($sp)
  /* 137DC0 80139B40 8FB40028 */        lw $s4, 0x28($sp)
  /* 137DC4 80139B44 03E00008 */        jr $ra
  /* 137DC8 80139B48 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleCreateSyncShadeAndCostumeRoutine
  /* 137DCC 80139B4C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 137DD0 80139B50 AFBF0014 */        sw $ra, 0x14($sp)
  /* 137DD4 80139B54 00002025 */        or $a0, $zero, $zero
  /* 137DD8 80139B58 00002825 */        or $a1, $zero, $zero
  /* 137DDC 80139B5C 2406001F */     addiu $a2, $zero, 0x1f
  /* 137DE0 80139B60 0C00265A */       jal omMakeGObjSPAfter
  /* 137DE4 80139B64 3C078000 */       lui $a3, 0x8000
  /* 137DE8 80139B68 3C058014 */       lui $a1, %hi(mnBattleSyncShadeAndCostume)
  /* 137DEC 80139B6C 24A59A2C */     addiu $a1, $a1, %lo(mnBattleSyncShadeAndCostume)
  /* 137DF0 80139B70 00402025 */        or $a0, $v0, $zero
  /* 137DF4 80139B74 24060001 */     addiu $a2, $zero, 1
  /* 137DF8 80139B78 0C002062 */       jal omAddGObjCommonProc
  /* 137DFC 80139B7C 24070001 */     addiu $a3, $zero, 1
  /* 137E00 80139B80 8FBF0014 */        lw $ra, 0x14($sp)
  /* 137E04 80139B84 27BD0018 */     addiu $sp, $sp, 0x18
  /* 137E08 80139B88 03E00008 */        jr $ra
  /* 137E0C 80139B8C 00000000 */       nop

glabel mnBattleSyncWhiteCircleSizeAndDisplay
  /* 137E10 80139B90 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 137E14 80139B94 3C0E8014 */       lui $t6, %hi(dMNBattleWhiteCircleSizes)
  /* 137E18 80139B98 27A50004 */     addiu $a1, $sp, 4
  /* 137E1C 80139B9C 25CEB90C */     addiu $t6, $t6, %lo(dMNBattleWhiteCircleSizes)
  /* 137E20 80139BA0 8C820084 */        lw $v0, 0x84($a0)
  /* 137E24 80139BA4 25C80030 */     addiu $t0, $t6, 0x30
  /* 137E28 80139BA8 00A0C825 */        or $t9, $a1, $zero
  .L80139BAC:
  /* 137E2C 80139BAC 8DD80000 */        lw $t8, ($t6) # dMNBattleWhiteCircleSizes + 0
  /* 137E30 80139BB0 25CE000C */     addiu $t6, $t6, 0xc
  /* 137E34 80139BB4 2739000C */     addiu $t9, $t9, 0xc
  /* 137E38 80139BB8 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 137E3C 80139BBC 8DCFFFF8 */        lw $t7, -8($t6) # dMNBattleWhiteCircleSizes + -8
  /* 137E40 80139BC0 AF2FFFF8 */        sw $t7, -8($t9)
  /* 137E44 80139BC4 8DD8FFFC */        lw $t8, -4($t6) # dMNBattleWhiteCircleSizes + -4
  /* 137E48 80139BC8 15C8FFF8 */       bne $t6, $t0, .L80139BAC
  /* 137E4C 80139BCC AF38FFFC */        sw $t8, -4($t9)
  /* 137E50 80139BD0 00024880 */       sll $t1, $v0, 2
  /* 137E54 80139BD4 01224823 */      subu $t1, $t1, $v0
  /* 137E58 80139BD8 00094900 */       sll $t1, $t1, 4
  /* 137E5C 80139BDC 01224823 */      subu $t1, $t1, $v0
  /* 137E60 80139BE0 3C0A8014 */       lui $t2, %hi(gMNBattlePanels)
  /* 137E64 80139BE4 254ABA88 */     addiu $t2, $t2, %lo(gMNBattlePanels)
  /* 137E68 80139BE8 00094880 */       sll $t1, $t1, 2
  /* 137E6C 80139BEC 012A1821 */      addu $v1, $t1, $t2
  /* 137E70 80139BF0 8C6B0088 */        lw $t3, 0x88($v1)
  /* 137E74 80139BF4 55600020 */      bnel $t3, $zero, .L80139C78
  /* 137E78 80139BF8 24020001 */     addiu $v0, $zero, 1
  /* 137E7C 80139BFC 8C6C0048 */        lw $t4, 0x48($v1)
  /* 137E80 80139C00 2401001C */     addiu $at, $zero, 0x1c
  /* 137E84 80139C04 5181001C */      beql $t4, $at, .L80139C78
  /* 137E88 80139C08 24020001 */     addiu $v0, $zero, 1
  /* 137E8C 80139C0C 8C8D007C */        lw $t5, 0x7c($a0)
  /* 137E90 80139C10 24020001 */     addiu $v0, $zero, 1
  /* 137E94 80139C14 544D0004 */      bnel $v0, $t5, .L80139C28
  /* 137E98 80139C18 AC82007C */        sw $v0, 0x7c($a0)
  /* 137E9C 80139C1C 10000002 */         b .L80139C28
  /* 137EA0 80139C20 AC80007C */        sw $zero, 0x7c($a0)
  /* 137EA4 80139C24 AC82007C */        sw $v0, 0x7c($a0)
  .L80139C28:
  /* 137EA8 80139C28 8C680048 */        lw $t0, 0x48($v1)
  /* 137EAC 80139C2C 8C8F0074 */        lw $t7, 0x74($a0)
  /* 137EB0 80139C30 00087080 */       sll $t6, $t0, 2
  /* 137EB4 80139C34 00AEC821 */      addu $t9, $a1, $t6
  /* 137EB8 80139C38 C7240000 */      lwc1 $f4, ($t9)
  /* 137EBC 80139C3C E5E40040 */      swc1 $f4, 0x40($t7)
  /* 137EC0 80139C40 8C780048 */        lw $t8, 0x48($v1)
  /* 137EC4 80139C44 8C8B0074 */        lw $t3, 0x74($a0)
  /* 137EC8 80139C48 00184880 */       sll $t1, $t8, 2
  /* 137ECC 80139C4C 00A95021 */      addu $t2, $a1, $t1
  /* 137ED0 80139C50 C5460000 */      lwc1 $f6, ($t2) # gMNBattlePanels + 0
  /* 137ED4 80139C54 E5660044 */      swc1 $f6, 0x44($t3)
  /* 137ED8 80139C58 8C6C0048 */        lw $t4, 0x48($v1)
  /* 137EDC 80139C5C 8C8E0074 */        lw $t6, 0x74($a0)
  /* 137EE0 80139C60 000C6880 */       sll $t5, $t4, 2
  /* 137EE4 80139C64 00AD4021 */      addu $t0, $a1, $t5
  /* 137EE8 80139C68 C5080000 */      lwc1 $f8, ($t0)
  /* 137EEC 80139C6C 10000003 */         b .L80139C7C
  /* 137EF0 80139C70 E5C80044 */      swc1 $f8, 0x44($t6)
  /* 137EF4 80139C74 24020001 */     addiu $v0, $zero, 1
  .L80139C78:
  /* 137EF8 80139C78 AC82007C */        sw $v0, 0x7c($a0)
  .L80139C7C:
  /* 137EFC 80139C7C 03E00008 */        jr $ra
  /* 137F00 80139C80 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnBattleCreateWhiteCircles
  /* 137F04 80139C84 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 137F08 80139C88 AFBE0050 */        sw $fp, 0x50($sp)
  /* 137F0C 80139C8C AFB7004C */        sw $s7, 0x4c($sp)
  /* 137F10 80139C90 AFB60048 */        sw $s6, 0x48($sp)
  /* 137F14 80139C94 AFB50044 */        sw $s5, 0x44($sp)
  /* 137F18 80139C98 AFB40040 */        sw $s4, 0x40($sp)
  /* 137F1C 80139C9C F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 137F20 80139CA0 AFB3003C */        sw $s3, 0x3c($sp)
  /* 137F24 80139CA4 AFB20038 */        sw $s2, 0x38($sp)
  /* 137F28 80139CA8 AFB10034 */        sw $s1, 0x34($sp)
  /* 137F2C 80139CAC F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 137F30 80139CB0 3C148014 */       lui $s4, %hi(D_ovl26_8013C4A0)
  /* 137F34 80139CB4 3C150000 */       lui $s5, %hi(D_NF_00000568)
  /* 137F38 80139CB8 3C168001 */       lui $s6, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 137F3C 80139CBC 3C170000 */       lui $s7, %hi(D_NF_00000408)
  /* 137F40 80139CC0 3C1E8014 */       lui $fp, %hi(mnBattleSyncWhiteCircleSizeAndDisplay)
  /* 137F44 80139CC4 3C018014 */       lui $at, %hi(dMNBattleWhiteCircleY)
  /* 137F48 80139CC8 4480B000 */      mtc1 $zero, $f22
  /* 137F4C 80139CCC AFBF0054 */        sw $ra, 0x54($sp)
  /* 137F50 80139CD0 AFB00030 */        sw $s0, 0x30($sp)
  /* 137F54 80139CD4 C434BA7C */      lwc1 $f20, %lo(dMNBattleWhiteCircleY)($at)
  /* 137F58 80139CD8 27DE9B90 */     addiu $fp, $fp, %lo(mnBattleSyncWhiteCircleSizeAndDisplay)
  /* 137F5C 80139CDC 26F70408 */     addiu $s7, $s7, %lo(D_NF_00000408)
  /* 137F60 80139CE0 26D64768 */     addiu $s6, $s6, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 137F64 80139CE4 26B50568 */     addiu $s5, $s5, %lo(D_NF_00000568)
  /* 137F68 80139CE8 2694C4A0 */     addiu $s4, $s4, %lo(D_ovl26_8013C4A0)
  /* 137F6C 80139CEC 00008825 */        or $s1, $zero, $zero
  /* 137F70 80139CF0 2412FB1E */     addiu $s2, $zero, -0x4e2
  /* 137F74 80139CF4 3C138000 */       lui $s3, 0x8000
  .L80139CF8:
  /* 137F78 80139CF8 00002025 */        or $a0, $zero, $zero
  /* 137F7C 80139CFC 00002825 */        or $a1, $zero, $zero
  /* 137F80 80139D00 24060015 */     addiu $a2, $zero, 0x15
  /* 137F84 80139D04 0C00265A */       jal omMakeGObjSPAfter
  /* 137F88 80139D08 02603825 */        or $a3, $s3, $zero
  /* 137F8C 80139D0C 8E8E0018 */        lw $t6, 0x18($s4) # D_ovl26_8013C4A0 + 24
  /* 137F90 80139D10 00408025 */        or $s0, $v0, $zero
  /* 137F94 80139D14 00402025 */        or $a0, $v0, $zero
  /* 137F98 80139D18 00003025 */        or $a2, $zero, $zero
  /* 137F9C 80139D1C 0C003C48 */       jal func_8000F120
  /* 137FA0 80139D20 01D52821 */      addu $a1, $t6, $s5
  /* 137FA4 80139D24 240FFFFF */     addiu $t7, $zero, -1
  /* 137FA8 80139D28 AFAF0010 */        sw $t7, 0x10($sp)
  /* 137FAC 80139D2C 02002025 */        or $a0, $s0, $zero
  /* 137FB0 80139D30 02C02825 */        or $a1, $s6, $zero
  /* 137FB4 80139D34 24060009 */     addiu $a2, $zero, 9
  /* 137FB8 80139D38 0C00277D */       jal omAddGObjRenderProc
  /* 137FBC 80139D3C 02603825 */        or $a3, $s3, $zero
  /* 137FC0 80139D40 AE110084 */        sw $s1, 0x84($s0)
  /* 137FC4 80139D44 8E980018 */        lw $t8, 0x18($s4) # D_ovl26_8013C4A0 + 24
  /* 137FC8 80139D48 02002025 */        or $a0, $s0, $zero
  /* 137FCC 80139D4C 0C003E3D */       jal func_8000F8F4
  /* 137FD0 80139D50 03172821 */      addu $a1, $t8, $s7
  /* 137FD4 80139D54 02002025 */        or $a0, $s0, $zero
  /* 137FD8 80139D58 03C02825 */        or $a1, $fp, $zero
  /* 137FDC 80139D5C 24060001 */     addiu $a2, $zero, 1
  /* 137FE0 80139D60 0C002062 */       jal omAddGObjCommonProc
  /* 137FE4 80139D64 24070001 */     addiu $a3, $zero, 1
  /* 137FE8 80139D68 0C0037CD */       jal func_8000DF34
  /* 137FEC 80139D6C 02002025 */        or $a0, $s0, $zero
  /* 137FF0 80139D70 44922000 */      mtc1 $s2, $f4
  /* 137FF4 80139D74 8E190074 */        lw $t9, 0x74($s0)
  /* 137FF8 80139D78 26310001 */     addiu $s1, $s1, 1
  /* 137FFC 80139D7C 468021A0 */   cvt.s.w $f6, $f4
  /* 138000 80139D80 24010004 */     addiu $at, $zero, 4
  /* 138004 80139D84 26520348 */     addiu $s2, $s2, 0x348
  /* 138008 80139D88 E726001C */      swc1 $f6, 0x1c($t9)
  /* 13800C 80139D8C 8E080074 */        lw $t0, 0x74($s0)
  /* 138010 80139D90 E5140020 */      swc1 $f20, 0x20($t0)
  /* 138014 80139D94 8E090074 */        lw $t1, 0x74($s0)
  /* 138018 80139D98 1621FFD7 */       bne $s1, $at, .L80139CF8
  /* 13801C 80139D9C E5360024 */      swc1 $f22, 0x24($t1)
  /* 138020 80139DA0 8FBF0054 */        lw $ra, 0x54($sp)
  /* 138024 80139DA4 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 138028 80139DA8 D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 13802C 80139DAC 8FB00030 */        lw $s0, 0x30($sp)
  /* 138030 80139DB0 8FB10034 */        lw $s1, 0x34($sp)
  /* 138034 80139DB4 8FB20038 */        lw $s2, 0x38($sp)
  /* 138038 80139DB8 8FB3003C */        lw $s3, 0x3c($sp)
  /* 13803C 80139DBC 8FB40040 */        lw $s4, 0x40($sp)
  /* 138040 80139DC0 8FB50044 */        lw $s5, 0x44($sp)
  /* 138044 80139DC4 8FB60048 */        lw $s6, 0x48($sp)
  /* 138048 80139DC8 8FB7004C */        lw $s7, 0x4c($sp)
  /* 13804C 80139DCC 8FBE0050 */        lw $fp, 0x50($sp)
  /* 138050 80139DD0 03E00008 */        jr $ra
  /* 138054 80139DD4 27BD0058 */     addiu $sp, $sp, 0x58

  /* 138058 80139DD8 03E00008 */        jr $ra
  /* 13805C 80139DDC 00000000 */       nop

glabel mnBattleBlinkIfReadyToFight
  /* 138060 80139DE0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 138064 80139DE4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 138068 80139DE8 0C04E979 */       jal mnBattleIsReadyToFight
  /* 13806C 80139DEC AFA40018 */        sw $a0, 0x18($sp)
  /* 138070 80139DF0 10400012 */      beqz $v0, .L80139E3C
  /* 138074 80139DF4 8FA40018 */        lw $a0, 0x18($sp)
  /* 138078 80139DF8 3C038014 */       lui $v1, %hi(gMNBattlePressStartFlashTimer)
  /* 13807C 80139DFC 2463BDC4 */     addiu $v1, $v1, %lo(gMNBattlePressStartFlashTimer)
  /* 138080 80139E00 8C6E0000 */        lw $t6, ($v1) # gMNBattlePressStartFlashTimer + 0
  /* 138084 80139E04 24010028 */     addiu $at, $zero, 0x28
  /* 138088 80139E08 24180001 */     addiu $t8, $zero, 1
  /* 13808C 80139E0C 25C20001 */     addiu $v0, $t6, 1
  /* 138090 80139E10 14410003 */       bne $v0, $at, .L80139E20
  /* 138094 80139E14 AC620000 */        sw $v0, ($v1) # gMNBattlePressStartFlashTimer + 0
  /* 138098 80139E18 AC600000 */        sw $zero, ($v1) # gMNBattlePressStartFlashTimer + 0
  /* 13809C 80139E1C 00001025 */        or $v0, $zero, $zero
  .L80139E20:
  /* 1380A0 80139E20 2841001E */      slti $at, $v0, 0x1e
  /* 1380A4 80139E24 10200003 */      beqz $at, .L80139E34
  /* 1380A8 80139E28 00000000 */       nop
  /* 1380AC 80139E2C 10000008 */         b .L80139E50
  /* 1380B0 80139E30 AC80007C */        sw $zero, 0x7c($a0)
  .L80139E34:
  /* 1380B4 80139E34 10000006 */         b .L80139E50
  /* 1380B8 80139E38 AC98007C */        sw $t8, 0x7c($a0)
  .L80139E3C:
  /* 1380BC 80139E3C 3C038014 */       lui $v1, %hi(gMNBattlePressStartFlashTimer)
  /* 1380C0 80139E40 24190001 */     addiu $t9, $zero, 1
  /* 1380C4 80139E44 2463BDC4 */     addiu $v1, $v1, %lo(gMNBattlePressStartFlashTimer)
  /* 1380C8 80139E48 AC99007C */        sw $t9, 0x7c($a0)
  /* 1380CC 80139E4C AC600000 */        sw $zero, ($v1) # gMNBattlePressStartFlashTimer + 0
  .L80139E50:
  /* 1380D0 80139E50 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1380D4 80139E54 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1380D8 80139E58 03E00008 */        jr $ra
  /* 1380DC 80139E5C 00000000 */       nop

glabel mnBattleCreateReadyToFightObjects
  /* 1380E0 80139E60 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1380E4 80139E64 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1380E8 80139E68 AFB00020 */        sw $s0, 0x20($sp)
  /* 1380EC 80139E6C 00002025 */        or $a0, $zero, $zero
  /* 1380F0 80139E70 00002825 */        or $a1, $zero, $zero
  /* 1380F4 80139E74 24060020 */     addiu $a2, $zero, 0x20
  /* 1380F8 80139E78 0C00265A */       jal omMakeGObjSPAfter
  /* 1380FC 80139E7C 3C078000 */       lui $a3, 0x8000
  /* 138100 80139E80 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 138104 80139E84 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 138108 80139E88 240EFFFF */     addiu $t6, $zero, -1
  /* 13810C 80139E8C 00408025 */        or $s0, $v0, $zero
  /* 138110 80139E90 AFAE0010 */        sw $t6, 0x10($sp)
  /* 138114 80139E94 AFA5002C */        sw $a1, 0x2c($sp)
  /* 138118 80139E98 00402025 */        or $a0, $v0, $zero
  /* 13811C 80139E9C 24060026 */     addiu $a2, $zero, 0x26
  /* 138120 80139EA0 0C00277D */       jal omAddGObjRenderProc
  /* 138124 80139EA4 3C078000 */       lui $a3, 0x8000
  /* 138128 80139EA8 3C058014 */       lui $a1, %hi(mnBattleBlinkIfReadyToFight)
  /* 13812C 80139EAC 24A59DE0 */     addiu $a1, $a1, %lo(mnBattleBlinkIfReadyToFight)
  /* 138130 80139EB0 AFA50028 */        sw $a1, 0x28($sp)
  /* 138134 80139EB4 02002025 */        or $a0, $s0, $zero
  /* 138138 80139EB8 24060001 */     addiu $a2, $zero, 1
  /* 13813C 80139EBC 0C002062 */       jal omAddGObjCommonProc
  /* 138140 80139EC0 24070001 */     addiu $a3, $zero, 1
  /* 138144 80139EC4 3C0F8014 */       lui $t7, %hi(D_ovl26_8013C4A0)
  /* 138148 80139EC8 8DEFC4A0 */        lw $t7, %lo(D_ovl26_8013C4A0)($t7)
  /* 13814C 80139ECC 3C180001 */       lui $t8, %hi(D_NF_0000F530)
  /* 138150 80139ED0 2718F530 */     addiu $t8, $t8, %lo(D_NF_0000F530)
  /* 138154 80139ED4 02002025 */        or $a0, $s0, $zero
  /* 138158 80139ED8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13815C 80139EDC 01F82821 */      addu $a1, $t7, $t8
  /* 138160 80139EE0 94590024 */       lhu $t9, 0x24($v0)
  /* 138164 80139EE4 3C01428E */       lui $at, (0x428E0000 >> 16) # 71.0
  /* 138168 80139EE8 44802000 */      mtc1 $zero, $f4
  /* 13816C 80139EEC 44813000 */      mtc1 $at, $f6 # 71.0 to cop1
  /* 138170 80139EF0 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 138174 80139EF4 A4490024 */        sh $t1, 0x24($v0)
  /* 138178 80139EF8 352A0001 */       ori $t2, $t1, 1
  /* 13817C 80139EFC 240B00F4 */     addiu $t3, $zero, 0xf4
  /* 138180 80139F00 240C0056 */     addiu $t4, $zero, 0x56
  /* 138184 80139F04 240D007F */     addiu $t5, $zero, 0x7f
  /* 138188 80139F08 240E0003 */     addiu $t6, $zero, 3
  /* 13818C 80139F0C 240F0140 */     addiu $t7, $zero, 0x140
  /* 138190 80139F10 24180011 */     addiu $t8, $zero, 0x11
  /* 138194 80139F14 A44A0024 */        sh $t2, 0x24($v0)
  /* 138198 80139F18 A0400060 */        sb $zero, 0x60($v0)
  /* 13819C 80139F1C A0400061 */        sb $zero, 0x61($v0)
  /* 1381A0 80139F20 A0400062 */        sb $zero, 0x62($v0)
  /* 1381A4 80139F24 A04B0028 */        sb $t3, 0x28($v0)
  /* 1381A8 80139F28 A04C0029 */        sb $t4, 0x29($v0)
  /* 1381AC 80139F2C A04D002A */        sb $t5, 0x2a($v0)
  /* 1381B0 80139F30 A0400065 */        sb $zero, 0x65($v0)
  /* 1381B4 80139F34 A0400064 */        sb $zero, 0x64($v0)
  /* 1381B8 80139F38 A04E0067 */        sb $t6, 0x67($v0)
  /* 1381BC 80139F3C A0400066 */        sb $zero, 0x66($v0)
  /* 1381C0 80139F40 A44F0068 */        sh $t7, 0x68($v0)
  /* 1381C4 80139F44 A458006A */        sh $t8, 0x6a($v0)
  /* 1381C8 80139F48 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 1381CC 80139F4C E4440058 */      swc1 $f4, 0x58($v0)
  /* 1381D0 80139F50 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1381D4 80139F54 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 1381D8 80139F58 3C080001 */       lui $t0, %hi(D_NF_0000F448)
  /* 1381DC 80139F5C 2508F448 */     addiu $t0, $t0, %lo(D_NF_0000F448)
  /* 1381E0 80139F60 02002025 */        or $a0, $s0, $zero
  /* 1381E4 80139F64 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1381E8 80139F68 03282821 */      addu $a1, $t9, $t0
  /* 1381EC 80139F6C 94490024 */       lhu $t1, 0x24($v0)
  /* 1381F0 80139F70 3C014248 */       lui $at, (0x42480000 >> 16) # 50.0
  /* 1381F4 80139F74 44814000 */      mtc1 $at, $f8 # 50.0 to cop1
  /* 1381F8 80139F78 3C014298 */       lui $at, (0x42980000 >> 16) # 76.0
  /* 1381FC 80139F7C 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 138200 80139F80 44815000 */      mtc1 $at, $f10 # 76.0 to cop1
  /* 138204 80139F84 240300FF */     addiu $v1, $zero, 0xff
  /* 138208 80139F88 A44B0024 */        sh $t3, 0x24($v0)
  /* 13820C 80139F8C 356C0001 */       ori $t4, $t3, 1
  /* 138210 80139F90 240D00CA */     addiu $t5, $zero, 0xca
  /* 138214 80139F94 240E0013 */     addiu $t6, $zero, 0x13
  /* 138218 80139F98 240F009D */     addiu $t7, $zero, 0x9d
  /* 13821C 80139F9C A44C0024 */        sh $t4, 0x24($v0)
  /* 138220 80139FA0 A0430060 */        sb $v1, 0x60($v0)
  /* 138224 80139FA4 A04D0061 */        sb $t5, 0x61($v0)
  /* 138228 80139FA8 A04E0062 */        sb $t6, 0x62($v0)
  /* 13822C 80139FAC A0430028 */        sb $v1, 0x28($v0)
  /* 138230 80139FB0 A0430029 */        sb $v1, 0x29($v0)
  /* 138234 80139FB4 A04F002A */        sb $t7, 0x2a($v0)
  /* 138238 80139FB8 00002025 */        or $a0, $zero, $zero
  /* 13823C 80139FBC 00002825 */        or $a1, $zero, $zero
  /* 138240 80139FC0 24060016 */     addiu $a2, $zero, 0x16
  /* 138244 80139FC4 3C078000 */       lui $a3, 0x8000
  /* 138248 80139FC8 E4480058 */      swc1 $f8, 0x58($v0)
  /* 13824C 80139FCC 0C00265A */       jal omMakeGObjSPAfter
  /* 138250 80139FD0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 138254 80139FD4 2418FFFF */     addiu $t8, $zero, -1
  /* 138258 80139FD8 00408025 */        or $s0, $v0, $zero
  /* 13825C 80139FDC AFB80010 */        sw $t8, 0x10($sp)
  /* 138260 80139FE0 00402025 */        or $a0, $v0, $zero
  /* 138264 80139FE4 8FA5002C */        lw $a1, 0x2c($sp)
  /* 138268 80139FE8 2406001C */     addiu $a2, $zero, 0x1c
  /* 13826C 80139FEC 0C00277D */       jal omAddGObjRenderProc
  /* 138270 80139FF0 3C078000 */       lui $a3, 0x8000
  /* 138274 80139FF4 02002025 */        or $a0, $s0, $zero
  /* 138278 80139FF8 8FA50028 */        lw $a1, 0x28($sp)
  /* 13827C 80139FFC 24060001 */     addiu $a2, $zero, 1
  /* 138280 8013A000 0C002062 */       jal omAddGObjCommonProc
  /* 138284 8013A004 24070001 */     addiu $a3, $zero, 1
  /* 138288 8013A008 3C198014 */       lui $t9, %hi(D_ovl26_8013C4A0)
  /* 13828C 8013A00C 8F39C4A0 */        lw $t9, %lo(D_ovl26_8013C4A0)($t9)
  /* 138290 8013A010 3C080000 */       lui $t0, %hi(D_NF_000014D8)
  /* 138294 8013A014 250814D8 */     addiu $t0, $t0, %lo(D_NF_000014D8)
  /* 138298 8013A018 02002025 */        or $a0, $s0, $zero
  /* 13829C 8013A01C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1382A0 8013A020 03282821 */      addu $a1, $t9, $t0
  /* 1382A4 8013A024 94490024 */       lhu $t1, 0x24($v0)
  /* 1382A8 8013A028 3C014305 */       lui $at, (0x43050000 >> 16) # 133.0
  /* 1382AC 8013A02C 44818000 */      mtc1 $at, $f16 # 133.0 to cop1
  /* 1382B0 8013A030 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 1382B4 8013A034 44819000 */      mtc1 $at, $f18 # 219.0 to cop1
  /* 1382B8 8013A038 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 1382BC 8013A03C A44B0024 */        sh $t3, 0x24($v0)
  /* 1382C0 8013A040 356C0001 */       ori $t4, $t3, 1
  /* 1382C4 8013A044 240D00D6 */     addiu $t5, $zero, 0xd6
  /* 1382C8 8013A048 240E00DD */     addiu $t6, $zero, 0xdd
  /* 1382CC 8013A04C 240F00C6 */     addiu $t7, $zero, 0xc6
  /* 1382D0 8013A050 A44C0024 */        sh $t4, 0x24($v0)
  /* 1382D4 8013A054 A04D0028 */        sb $t5, 0x28($v0)
  /* 1382D8 8013A058 A04E0029 */        sb $t6, 0x29($v0)
  /* 1382DC 8013A05C A04F002A */        sb $t7, 0x2a($v0)
  /* 1382E0 8013A060 3C188014 */       lui $t8, %hi(D_ovl26_8013C4A0)
  /* 1382E4 8013A064 E4500058 */      swc1 $f16, 0x58($v0)
  /* 1382E8 8013A068 E452005C */      swc1 $f18, 0x5c($v0)
  /* 1382EC 8013A06C 8F18C4A0 */        lw $t8, %lo(D_ovl26_8013C4A0)($t8)
  /* 1382F0 8013A070 3C190000 */       lui $t9, %hi(D_NF_00001378)
  /* 1382F4 8013A074 27391378 */     addiu $t9, $t9, %lo(D_NF_00001378)
  /* 1382F8 8013A078 02002025 */        or $a0, $s0, $zero
  /* 1382FC 8013A07C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 138300 8013A080 03192821 */      addu $a1, $t8, $t9
  /* 138304 8013A084 94480024 */       lhu $t0, 0x24($v0)
  /* 138308 8013A088 3C014322 */       lui $at, (0x43220000 >> 16) # 162.0
  /* 13830C 8013A08C 44812000 */      mtc1 $at, $f4 # 162.0 to cop1
  /* 138310 8013A090 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 138314 8013A094 44813000 */      mtc1 $at, $f6 # 219.0 to cop1
  /* 138318 8013A098 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 13831C 8013A09C A44A0024 */        sh $t2, 0x24($v0)
  /* 138320 8013A0A0 354B0001 */       ori $t3, $t2, 1
  /* 138324 8013A0A4 240C00FF */     addiu $t4, $zero, 0xff
  /* 138328 8013A0A8 240D0056 */     addiu $t5, $zero, 0x56
  /* 13832C 8013A0AC 240E0092 */     addiu $t6, $zero, 0x92
  /* 138330 8013A0B0 A44B0024 */        sh $t3, 0x24($v0)
  /* 138334 8013A0B4 A04C0028 */        sb $t4, 0x28($v0)
  /* 138338 8013A0B8 A04D0029 */        sb $t5, 0x29($v0)
  /* 13833C 8013A0BC A04E002A */        sb $t6, 0x2a($v0)
  /* 138340 8013A0C0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 138344 8013A0C4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 138348 8013A0C8 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13834C 8013A0CC 8FB00020 */        lw $s0, 0x20($sp)
  /* 138350 8013A0D0 27BD0038 */     addiu $sp, $sp, 0x38
  /* 138354 8013A0D4 03E00008 */        jr $ra
  /* 138358 8013A0D8 00000000 */       nop

glabel func_ovl26_8013A0DC
  /* 13835C 8013A0DC 00047080 */       sll $t6, $a0, 2
  /* 138360 8013A0E0 3C0F8014 */       lui $t7, %hi(gMNBattleControllerOrderArray)
  /* 138364 8013A0E4 01EE7821 */      addu $t7, $t7, $t6
  /* 138368 8013A0E8 8DEFBD90 */        lw $t7, %lo(gMNBattleControllerOrderArray)($t7)
  /* 13836C 8013A0EC 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 138370 8013A0F0 AFB10018 */        sw $s1, 0x18($sp)
  /* 138374 8013A0F4 2402FFFF */     addiu $v0, $zero, -1
  /* 138378 8013A0F8 00808825 */        or $s1, $a0, $zero
  /* 13837C 8013A0FC AFBF001C */        sw $ra, 0x1c($sp)
  /* 138380 8013A100 104F0025 */       beq $v0, $t7, .L8013A198
  /* 138384 8013A104 AFB00014 */        sw $s0, 0x14($sp)
  /* 138388 8013A108 0004C080 */       sll $t8, $a0, 2
  /* 13838C 8013A10C 0304C023 */      subu $t8, $t8, $a0
  /* 138390 8013A110 0018C100 */       sll $t8, $t8, 4
  /* 138394 8013A114 0304C023 */      subu $t8, $t8, $a0
  /* 138398 8013A118 3C198014 */       lui $t9, %hi(gMNBattlePanels)
  /* 13839C 8013A11C 2739BA88 */     addiu $t9, $t9, %lo(gMNBattlePanels)
  /* 1383A0 8013A120 0018C080 */       sll $t8, $t8, 2
  /* 1383A4 8013A124 03198021 */      addu $s0, $t8, $t9
  /* 1383A8 8013A128 8E080000 */        lw $t0, ($s0)
  /* 1383AC 8013A12C 55000059 */      bnel $t0, $zero, .L8013A294
  /* 1383B0 8013A130 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1383B4 8013A134 0C04E37B */       jal mnBattleCreateCursor
  /* 1383B8 8013A138 00000000 */       nop
  /* 1383BC 8013A13C 8E090084 */        lw $t1, 0x84($s0)
  /* 1383C0 8013A140 24010001 */     addiu $at, $zero, 1
  /* 1383C4 8013A144 02202025 */        or $a0, $s1, $zero
  /* 1383C8 8013A148 51210052 */      beql $t1, $at, .L8013A294
  /* 1383CC 8013A14C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1383D0 8013A150 0C04D721 */       jal func_ovl26_80135C84
  /* 1383D4 8013A154 AE000084 */        sw $zero, 0x84($s0)
  /* 1383D8 8013A158 8E04000C */        lw $a0, 0xc($s0)
  /* 1383DC 8013A15C 02202825 */        or $a1, $s1, $zero
  /* 1383E0 8013A160 0C04CA57 */       jal func_ovl26_8013295C
  /* 1383E4 8013A164 8E060084 */        lw $a2, 0x84($s0)
  /* 1383E8 8013A168 8E040004 */        lw $a0, 4($s0)
  /* 1383EC 8013A16C 0C04D80E */       jal func_ovl26_80136038
  /* 1383F0 8013A170 02202825 */        or $a1, $s1, $zero
  /* 1383F4 8013A174 8E040000 */        lw $a0, ($s0)
  /* 1383F8 8013A178 0C04D87E */       jal func_ovl26_801361F8
  /* 1383FC 8013A17C 02202825 */        or $a1, $s1, $zero
  /* 138400 8013A180 0C04D84A */       jal mnBattleSyncFighterDisplay
  /* 138404 8013A184 02202025 */        or $a0, $s1, $zero
  /* 138408 8013A188 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 13840C 8013A18C 02202025 */        or $a0, $s1, $zero
  /* 138410 8013A190 10000040 */         b .L8013A294
  /* 138414 8013A194 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013A198:
  /* 138418 8013A198 00115080 */       sll $t2, $s1, 2
  /* 13841C 8013A19C 01515023 */      subu $t2, $t2, $s1
  /* 138420 8013A1A0 000A5100 */       sll $t2, $t2, 4
  /* 138424 8013A1A4 01515023 */      subu $t2, $t2, $s1
  /* 138428 8013A1A8 3C0B8014 */       lui $t3, %hi(gMNBattlePanels)
  /* 13842C 8013A1AC 256BBA88 */     addiu $t3, $t3, %lo(gMNBattlePanels)
  /* 138430 8013A1B0 000A5080 */       sll $t2, $t2, 2
  /* 138434 8013A1B4 014B8021 */      addu $s0, $t2, $t3
  /* 138438 8013A1B8 8E040000 */        lw $a0, ($s0)
  /* 13843C 8013A1BC 50800035 */      beql $a0, $zero, .L8013A294
  /* 138440 8013A1C0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 138444 8013A1C4 8E060080 */        lw $a2, 0x80($s0)
  /* 138448 8013A1C8 10460019 */       beq $v0, $a2, .L8013A230
  /* 13844C 8013A1CC 00000000 */       nop
  /* 138450 8013A1D0 16260005 */       bne $s1, $a2, .L8013A1E8
  /* 138454 8013A1D4 02202825 */        or $a1, $s1, $zero
  /* 138458 8013A1D8 8E0C0084 */        lw $t4, 0x84($s0)
  /* 13845C 8013A1DC 24010001 */     addiu $at, $zero, 1
  /* 138460 8013A1E0 15810013 */       bne $t4, $at, .L8013A230
  /* 138464 8013A1E4 00000000 */       nop
  .L8013A1E8:
  /* 138468 8013A1E8 0C04DC63 */       jal mnBattleSelectChar
  /* 13846C 8013A1EC 24070004 */     addiu $a3, $zero, 4
  /* 138470 8013A1F0 1440000F */      bnez $v0, .L8013A230
  /* 138474 8013A1F4 00000000 */       nop
  /* 138478 8013A1F8 8E020080 */        lw $v0, 0x80($s0)
  /* 13847C 8013A1FC 3C0E8014 */       lui $t6, %hi(gMNBattlePanels)
  /* 138480 8013A200 25CEBA88 */     addiu $t6, $t6, %lo(gMNBattlePanels)
  /* 138484 8013A204 00026880 */       sll $t5, $v0, 2
  /* 138488 8013A208 01A26823 */      subu $t5, $t5, $v0
  /* 13848C 8013A20C 000D6900 */       sll $t5, $t5, 4
  /* 138490 8013A210 01A26823 */      subu $t5, $t5, $v0
  /* 138494 8013A214 000D6880 */       sll $t5, $t5, 2
  /* 138498 8013A218 01AE1821 */      addu $v1, $t5, $t6
  /* 13849C 8013A21C 8C640004 */        lw $a0, 4($v1)
  /* 1384A0 8013A220 0C04E212 */       jal func_ovl26_80138848
  /* 1384A4 8013A224 AFA30024 */        sw $v1, 0x24($sp)
  /* 1384A8 8013A228 8FA30024 */        lw $v1, 0x24($sp)
  /* 1384AC 8013A22C AC620048 */        sw $v0, 0x48($v1)
  .L8013A230:
  /* 1384B0 8013A230 0C0026A1 */       jal omEjectGObj
  /* 1384B4 8013A234 8E040000 */        lw $a0, ($s0)
  /* 1384B8 8013A238 8E0F0084 */        lw $t7, 0x84($s0)
  /* 1384BC 8013A23C 24010001 */     addiu $at, $zero, 1
  /* 1384C0 8013A240 AE000000 */        sw $zero, ($s0)
  /* 1384C4 8013A244 11E10012 */       beq $t7, $at, .L8013A290
  /* 1384C8 8013A248 24180002 */     addiu $t8, $zero, 2
  /* 1384CC 8013A24C AE180084 */        sw $t8, 0x84($s0)
  /* 1384D0 8013A250 0C04D721 */       jal func_ovl26_80135C84
  /* 1384D4 8013A254 02202025 */        or $a0, $s1, $zero
  /* 1384D8 8013A258 8E04000C */        lw $a0, 0xc($s0)
  /* 1384DC 8013A25C 02202825 */        or $a1, $s1, $zero
  /* 1384E0 8013A260 0C04CA57 */       jal func_ovl26_8013295C
  /* 1384E4 8013A264 8E060084 */        lw $a2, 0x84($s0)
  /* 1384E8 8013A268 8E040004 */        lw $a0, 4($s0)
  /* 1384EC 8013A26C 0C04D80E */       jal func_ovl26_80136038
  /* 1384F0 8013A270 02202825 */        or $a1, $s1, $zero
  /* 1384F4 8013A274 8E040000 */        lw $a0, ($s0)
  /* 1384F8 8013A278 0C04D87E */       jal func_ovl26_801361F8
  /* 1384FC 8013A27C 02202825 */        or $a1, $s1, $zero
  /* 138500 8013A280 0C04D84A */       jal mnBattleSyncFighterDisplay
  /* 138504 8013A284 02202025 */        or $a0, $s1, $zero
  /* 138508 8013A288 0C04D8C0 */       jal mnBattleSyncNameAndLogo
  /* 13850C 8013A28C 02202025 */        or $a0, $s1, $zero
  .L8013A290:
  /* 138510 8013A290 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013A294:
  /* 138514 8013A294 8FB00014 */        lw $s0, 0x14($sp)
  /* 138518 8013A298 8FB10018 */        lw $s1, 0x18($sp)
  /* 13851C 8013A29C 03E00008 */        jr $ra
  /* 138520 8013A2A0 27BD0030 */     addiu $sp, $sp, 0x30

glabel func_ovl26_8013A2A4
  /* 138524 8013A2A4 3C038014 */       lui $v1, %hi(gMNBattleControllerOrderArray)
  /* 138528 8013A2A8 3C058004 */       lui $a1, %hi(gPlayerControllerPortStatuses)
  /* 13852C 8013A2AC 80A551A4 */        lb $a1, %lo(gPlayerControllerPortStatuses)($a1)
  /* 138530 8013A2B0 2463BD90 */     addiu $v1, $v1, %lo(gMNBattleControllerOrderArray)
  /* 138534 8013A2B4 00001025 */        or $v0, $zero, $zero
  /* 138538 8013A2B8 24090004 */     addiu $t1, $zero, 4
  /* 13853C 8013A2BC 2408FFFF */     addiu $t0, $zero, -1
  .L8013A2C0:
  /* 138540 8013A2C0 AC680000 */        sw $t0, ($v1) # gMNBattleControllerOrderArray + 0
  /* 138544 8013A2C4 1105000C */       beq $t0, $a1, .L8013A2F8
  /* 138548 8013A2C8 00002025 */        or $a0, $zero, $zero
  /* 13854C 8013A2CC 3C0E8004 */       lui $t6, 0x8004
  /* 138550 8013A2D0 25C651A4 */     addiu $a2, $t6, 0x51a4
  /* 138554 8013A2D4 80C70000 */        lb $a3, ($a2)
  .L8013A2D8:
  /* 138558 8013A2D8 54470003 */      bnel $v0, $a3, .L8013A2E8
  /* 13855C 8013A2DC 80C70001 */        lb $a3, 1($a2)
  /* 138560 8013A2E0 AC640000 */        sw $a0, ($v1) # gMNBattleControllerOrderArray + 0
  /* 138564 8013A2E4 80C70001 */        lb $a3, 1($a2)
  .L8013A2E8:
  /* 138568 8013A2E8 24840001 */     addiu $a0, $a0, 1
  /* 13856C 8013A2EC 24C60001 */     addiu $a2, $a2, 1
  /* 138570 8013A2F0 1507FFF9 */       bne $t0, $a3, .L8013A2D8
  /* 138574 8013A2F4 00000000 */       nop
  .L8013A2F8:
  /* 138578 8013A2F8 24420001 */     addiu $v0, $v0, 1
  /* 13857C 8013A2FC 1449FFF0 */       bne $v0, $t1, .L8013A2C0
  /* 138580 8013A300 24630004 */     addiu $v1, $v1, 4
  /* 138584 8013A304 03E00008 */        jr $ra
  /* 138588 8013A308 00000000 */       nop

glabel func_ovl26_8013A30C
  /* 13858C 8013A30C 3C0E8014 */       lui $t6, %hi(D_ovl26_8013BB0C)
  /* 138590 8013A310 8DCEBB0C */        lw $t6, %lo(D_ovl26_8013BB0C)($t6)
  /* 138594 8013A314 24020002 */     addiu $v0, $zero, 2
  /* 138598 8013A318 00001825 */        or $v1, $zero, $zero
  /* 13859C 8013A31C 104E0007 */       beq $v0, $t6, .L8013A33C
  /* 1385A0 8013A320 3C188014 */       lui $t8, %hi(D_ovl26_8013BBC8)
  /* 1385A4 8013A324 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BB10)
  /* 1385A8 8013A328 8DEFBB10 */        lw $t7, %lo(D_ovl26_8013BB10)($t7)
  /* 1385AC 8013A32C 24040001 */     addiu $a0, $zero, 1
  /* 1385B0 8013A330 148F0002 */       bne $a0, $t7, .L8013A33C
  /* 1385B4 8013A334 00000000 */       nop
  /* 1385B8 8013A338 00801825 */        or $v1, $a0, $zero
  .L8013A33C:
  /* 1385BC 8013A33C 8F18BBC8 */        lw $t8, %lo(D_ovl26_8013BBC8)($t8)
  /* 1385C0 8013A340 3C088014 */       lui $t0, %hi(D_ovl26_8013BC84)
  /* 1385C4 8013A344 3C0A8014 */       lui $t2, %hi(D_ovl26_8013BD40)
  /* 1385C8 8013A348 10580006 */       beq $v0, $t8, .L8013A364
  /* 1385CC 8013A34C 24040001 */     addiu $a0, $zero, 1
  /* 1385D0 8013A350 3C198014 */       lui $t9, %hi(D_ovl26_8013BBCC)
  /* 1385D4 8013A354 8F39BBCC */        lw $t9, %lo(D_ovl26_8013BBCC)($t9)
  /* 1385D8 8013A358 14990002 */       bne $a0, $t9, .L8013A364
  /* 1385DC 8013A35C 00000000 */       nop
  /* 1385E0 8013A360 24630001 */     addiu $v1, $v1, 1
  .L8013A364:
  /* 1385E4 8013A364 8D08BC84 */        lw $t0, %lo(D_ovl26_8013BC84)($t0)
  /* 1385E8 8013A368 3C098014 */       lui $t1, %hi(D_ovl26_8013BC88)
  /* 1385EC 8013A36C 3C0B8014 */       lui $t3, %hi(D_ovl26_8013BD44)
  /* 1385F0 8013A370 10480005 */       beq $v0, $t0, .L8013A388
  /* 1385F4 8013A374 00000000 */       nop
  /* 1385F8 8013A378 8D29BC88 */        lw $t1, %lo(D_ovl26_8013BC88)($t1)
  /* 1385FC 8013A37C 14890002 */       bne $a0, $t1, .L8013A388
  /* 138600 8013A380 00000000 */       nop
  /* 138604 8013A384 24630001 */     addiu $v1, $v1, 1
  .L8013A388:
  /* 138608 8013A388 8D4ABD40 */        lw $t2, %lo(D_ovl26_8013BD40)($t2)
  /* 13860C 8013A38C 104A0005 */       beq $v0, $t2, .L8013A3A4
  /* 138610 8013A390 00000000 */       nop
  /* 138614 8013A394 8D6BBD44 */        lw $t3, %lo(D_ovl26_8013BD44)($t3)
  /* 138618 8013A398 148B0002 */       bne $a0, $t3, .L8013A3A4
  /* 13861C 8013A39C 00000000 */       nop
  /* 138620 8013A3A0 24630001 */     addiu $v1, $v1, 1
  .L8013A3A4:
  /* 138624 8013A3A4 03E00008 */        jr $ra
  /* 138628 8013A3A8 00601025 */        or $v0, $v1, $zero

glabel func_ovl26_8013A3AC
  /* 13862C 8013A3AC 00047080 */       sll $t6, $a0, 2
  /* 138630 8013A3B0 01C47023 */      subu $t6, $t6, $a0
  /* 138634 8013A3B4 000E7100 */       sll $t6, $t6, 4
  /* 138638 8013A3B8 01C47023 */      subu $t6, $t6, $a0
  /* 13863C 8013A3BC 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 138640 8013A3C0 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 138644 8013A3C4 000E7080 */       sll $t6, $t6, 2
  /* 138648 8013A3C8 01CF1021 */      addu $v0, $t6, $t7
  /* 13864C 8013A3CC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 138650 8013A3D0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 138654 8013A3D4 00802825 */        or $a1, $a0, $zero
  /* 138658 8013A3D8 24180002 */     addiu $t8, $zero, 2
  /* 13865C 8013A3DC 2419001C */     addiu $t9, $zero, 0x1c
  /* 138660 8013A3E0 24080004 */     addiu $t0, $zero, 4
  /* 138664 8013A3E4 AC580084 */        sw $t8, 0x84($v0)
  /* 138668 8013A3E8 AC590048 */        sw $t9, 0x48($v0)
  /* 13866C 8013A3EC AC48007C */        sw $t0, 0x7c($v0)
  /* 138670 8013A3F0 8C44000C */        lw $a0, 0xc($v0)
  /* 138674 8013A3F4 0C04CA57 */       jal func_ovl26_8013295C
  /* 138678 8013A3F8 24060002 */     addiu $a2, $zero, 2
  /* 13867C 8013A3FC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 138680 8013A400 27BD0018 */     addiu $sp, $sp, 0x18
  /* 138684 8013A404 03E00008 */        jr $ra
  /* 138688 8013A408 00000000 */       nop

glabel func_ovl26_8013A40C
  /* 13868C 8013A40C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 138690 8013A410 AFB1001C */        sw $s1, 0x1c($sp)
  /* 138694 8013A414 AFB20020 */        sw $s2, 0x20($sp)
  /* 138698 8013A418 AFB00018 */        sw $s0, 0x18($sp)
  /* 13869C 8013A41C 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 1386A0 8013A420 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1386A4 8013A424 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 1386A8 8013A428 00008025 */        or $s0, $zero, $zero
  /* 1386AC 8013A42C 24120004 */     addiu $s2, $zero, 4
  .L8013A430:
  /* 1386B0 8013A430 8E2E0088 */        lw $t6, 0x88($s1) # gMNBattlePanels + 136
  /* 1386B4 8013A434 55C00004 */      bnel $t6, $zero, .L8013A448
  /* 1386B8 8013A438 26100001 */     addiu $s0, $s0, 1
  /* 1386BC 8013A43C 0C04E8EB */       jal func_ovl26_8013A3AC
  /* 1386C0 8013A440 02002025 */        or $a0, $s0, $zero
  /* 1386C4 8013A444 26100001 */     addiu $s0, $s0, 1
  .L8013A448:
  /* 1386C8 8013A448 1612FFF9 */       bne $s0, $s2, .L8013A430
  /* 1386CC 8013A44C 263100BC */     addiu $s1, $s1, 0xbc
  /* 1386D0 8013A450 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1386D4 8013A454 8FB00018 */        lw $s0, 0x18($sp)
  /* 1386D8 8013A458 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1386DC 8013A45C 8FB20020 */        lw $s2, 0x20($sp)
  /* 1386E0 8013A460 03E00008 */        jr $ra
  /* 1386E4 8013A464 27BD0028 */     addiu $sp, $sp, 0x28

  /* 1386E8 8013A468 03E00008 */        jr $ra
  /* 1386EC 8013A46C 00000000 */       nop

glabel func_ovl26_8013A470
  /* 1386F0 8013A470 3C0E8014 */       lui $t6, %hi(D_ovl26_8013BB10)
  /* 1386F4 8013A474 8DCEBB10 */        lw $t6, %lo(D_ovl26_8013BB10)($t6)
  /* 1386F8 8013A478 2402FFFF */     addiu $v0, $zero, -1
  /* 1386FC 8013A47C 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BBCC)
  /* 138700 8013A480 11C00003 */      beqz $t6, .L8013A490
  /* 138704 8013A484 3C198014 */       lui $t9, 0x8014
  /* 138708 8013A488 3C028014 */       lui $v0, %hi(D_ovl26_8013BAC8)
  /* 13870C 8013A48C 8C42BAC8 */        lw $v0, %lo(D_ovl26_8013BAC8)($v0)
  .L8013A490:
  /* 138710 8013A490 8DEFBBCC */        lw $t7, %lo(D_ovl26_8013BBCC)($t7)
  /* 138714 8013A494 2403FFFF */     addiu $v1, $zero, -1
  /* 138718 8013A498 11E0000B */      beqz $t7, .L8013A4C8
  /* 13871C 8013A49C 00000000 */       nop
  /* 138720 8013A4A0 14430004 */       bne $v0, $v1, .L8013A4B4
  /* 138724 8013A4A4 3C188014 */       lui $t8, %hi(D_ovl26_8013BB84)
  /* 138728 8013A4A8 3C028014 */       lui $v0, %hi(D_ovl26_8013BB84)
  /* 13872C 8013A4AC 10000006 */         b .L8013A4C8
  /* 138730 8013A4B0 8C42BB84 */        lw $v0, %lo(D_ovl26_8013BB84)($v0)
  .L8013A4B4:
  /* 138734 8013A4B4 8F18BB84 */        lw $t8, %lo(D_ovl26_8013BB84)($t8)
  /* 138738 8013A4B8 10580003 */       beq $v0, $t8, .L8013A4C8
  /* 13873C 8013A4BC 00000000 */       nop
  /* 138740 8013A4C0 03E00008 */        jr $ra
  /* 138744 8013A4C4 00001025 */        or $v0, $zero, $zero

  .L8013A4C8:
  /* 138748 8013A4C8 8F39BC88 */        lw $t9, -0x4378($t9)
  /* 13874C 8013A4CC 3C098014 */       lui $t1, 0x8014
  /* 138750 8013A4D0 1320000B */      beqz $t9, .L8013A500
  /* 138754 8013A4D4 00000000 */       nop
  /* 138758 8013A4D8 14430004 */       bne $v0, $v1, .L8013A4EC
  /* 13875C 8013A4DC 3C088014 */       lui $t0, %hi(D_ovl26_8013BC40)
  /* 138760 8013A4E0 3C028014 */       lui $v0, %hi(D_ovl26_8013BC40)
  /* 138764 8013A4E4 10000006 */         b .L8013A500
  /* 138768 8013A4E8 8C42BC40 */        lw $v0, %lo(D_ovl26_8013BC40)($v0)
  .L8013A4EC:
  /* 13876C 8013A4EC 8D08BC40 */        lw $t0, %lo(D_ovl26_8013BC40)($t0)
  /* 138770 8013A4F0 10480003 */       beq $v0, $t0, .L8013A500
  /* 138774 8013A4F4 00000000 */       nop
  /* 138778 8013A4F8 03E00008 */        jr $ra
  /* 13877C 8013A4FC 00001025 */        or $v0, $zero, $zero

  .L8013A500:
  /* 138780 8013A500 8D29BD44 */        lw $t1, -0x42bc($t1)
  /* 138784 8013A504 51200009 */      beql $t1, $zero, .L8013A52C
  /* 138788 8013A508 24020001 */     addiu $v0, $zero, 1
  /* 13878C 8013A50C 10430006 */       beq $v0, $v1, .L8013A528
  /* 138790 8013A510 3C0A8014 */       lui $t2, %hi(D_ovl26_8013BCFC)
  /* 138794 8013A514 8D4ABCFC */        lw $t2, %lo(D_ovl26_8013BCFC)($t2)
  /* 138798 8013A518 504A0004 */      beql $v0, $t2, .L8013A52C
  /* 13879C 8013A51C 24020001 */     addiu $v0, $zero, 1
  /* 1387A0 8013A520 03E00008 */        jr $ra
  /* 1387A4 8013A524 00001025 */        or $v0, $zero, $zero

  .L8013A528:
  /* 1387A8 8013A528 24020001 */     addiu $v0, $zero, 1
  .L8013A52C:
  /* 1387AC 8013A52C 03E00008 */        jr $ra
  /* 1387B0 8013A530 00000000 */       nop

glabel func_ovl26_8013A534
  /* 1387B4 8013A534 3C0E8014 */       lui $t6, %hi(gMNBattlePanels)
  /* 1387B8 8013A538 8DCEBA88 */        lw $t6, %lo(gMNBattlePanels)($t6)
  /* 1387BC 8013A53C 3C188014 */       lui $t8, 0x8014
  /* 1387C0 8013A540 3C0F8014 */       lui $t7, %hi(D_ovl26_8013BADC)
  /* 1387C4 8013A544 11C00007 */      beqz $t6, .L8013A564
  /* 1387C8 8013A548 00000000 */       nop
  /* 1387CC 8013A54C 8DEFBADC */        lw $t7, %lo(D_ovl26_8013BADC)($t7)
  /* 1387D0 8013A550 24020001 */     addiu $v0, $zero, 1
  /* 1387D4 8013A554 144F0003 */       bne $v0, $t7, .L8013A564
  /* 1387D8 8013A558 00000000 */       nop
  /* 1387DC 8013A55C 03E00008 */        jr $ra
  /* 1387E0 8013A560 00001025 */        or $v0, $zero, $zero

  .L8013A564:
  /* 1387E4 8013A564 8F18BB44 */        lw $t8, -0x44bc($t8)
  /* 1387E8 8013A568 3C198014 */       lui $t9, %hi(D_ovl26_8013BB98)
  /* 1387EC 8013A56C 3C088014 */       lui $t0, 0x8014
  /* 1387F0 8013A570 13000006 */      beqz $t8, .L8013A58C
  /* 1387F4 8013A574 24020001 */     addiu $v0, $zero, 1
  /* 1387F8 8013A578 8F39BB98 */        lw $t9, %lo(D_ovl26_8013BB98)($t9)
  /* 1387FC 8013A57C 14590003 */       bne $v0, $t9, .L8013A58C
  /* 138800 8013A580 00000000 */       nop
  /* 138804 8013A584 03E00008 */        jr $ra
  /* 138808 8013A588 00001025 */        or $v0, $zero, $zero

  .L8013A58C:
  /* 13880C 8013A58C 8D08BC00 */        lw $t0, -0x4400($t0)
  /* 138810 8013A590 3C098014 */       lui $t1, %hi(D_ovl26_8013BC54)
  /* 138814 8013A594 3C0A8014 */       lui $t2, 0x8014
  /* 138818 8013A598 11000006 */      beqz $t0, .L8013A5B4
  /* 13881C 8013A59C 00000000 */       nop
  /* 138820 8013A5A0 8D29BC54 */        lw $t1, %lo(D_ovl26_8013BC54)($t1)
  /* 138824 8013A5A4 14490003 */       bne $v0, $t1, .L8013A5B4
  /* 138828 8013A5A8 00000000 */       nop
  /* 13882C 8013A5AC 03E00008 */        jr $ra
  /* 138830 8013A5B0 00001025 */        or $v0, $zero, $zero

  .L8013A5B4:
  /* 138834 8013A5B4 8D4ABCBC */        lw $t2, -0x4344($t2)
  /* 138838 8013A5B8 3C0B8014 */       lui $t3, %hi(D_ovl26_8013BD10)
  /* 13883C 8013A5BC 51400007 */      beql $t2, $zero, .L8013A5DC
  /* 138840 8013A5C0 24020001 */     addiu $v0, $zero, 1
  /* 138844 8013A5C4 8D6BBD10 */        lw $t3, %lo(D_ovl26_8013BD10)($t3)
  /* 138848 8013A5C8 544B0004 */      bnel $v0, $t3, .L8013A5DC
  /* 13884C 8013A5CC 24020001 */     addiu $v0, $zero, 1
  /* 138850 8013A5D0 03E00008 */        jr $ra
  /* 138854 8013A5D4 00001025 */        or $v0, $zero, $zero

  /* 138858 8013A5D8 24020001 */     addiu $v0, $zero, 1
  .L8013A5DC:
  /* 13885C 8013A5DC 03E00008 */        jr $ra
  /* 138860 8013A5E0 00000000 */       nop

glabel mnBattleIsReadyToFight
  /* 138864 8013A5E4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 138868 8013A5E8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13886C 8013A5EC 24030001 */     addiu $v1, $zero, 1
  /* 138870 8013A5F0 0C04E8C3 */       jal func_ovl26_8013A30C
  /* 138874 8013A5F4 AFA30018 */        sw $v1, 0x18($sp)
  /* 138878 8013A5F8 28410002 */      slti $at, $v0, 2
  /* 13887C 8013A5FC 10200002 */      beqz $at, .L8013A608
  /* 138880 8013A600 8FA30018 */        lw $v1, 0x18($sp)
  /* 138884 8013A604 00001825 */        or $v1, $zero, $zero
  .L8013A608:
  /* 138888 8013A608 1060000A */      beqz $v1, .L8013A634
  /* 13888C 8013A60C 3C0E8014 */       lui $t6, %hi(gMNBattleIsTeamBattle)
  /* 138890 8013A610 8DCEBDA8 */        lw $t6, %lo(gMNBattleIsTeamBattle)($t6)
  /* 138894 8013A614 24010001 */     addiu $at, $zero, 1
  /* 138898 8013A618 15C10006 */       bne $t6, $at, .L8013A634
  /* 13889C 8013A61C 00000000 */       nop
  /* 1388A0 8013A620 0C04E91C */       jal func_ovl26_8013A470
  /* 1388A4 8013A624 AFA30018 */        sw $v1, 0x18($sp)
  /* 1388A8 8013A628 10400002 */      beqz $v0, .L8013A634
  /* 1388AC 8013A62C 8FA30018 */        lw $v1, 0x18($sp)
  /* 1388B0 8013A630 00001825 */        or $v1, $zero, $zero
  .L8013A634:
  /* 1388B4 8013A634 50600007 */      beql $v1, $zero, .L8013A654
  /* 1388B8 8013A638 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1388BC 8013A63C 0C04E94D */       jal func_ovl26_8013A534
  /* 1388C0 8013A640 AFA30018 */        sw $v1, 0x18($sp)
  /* 1388C4 8013A644 14400002 */      bnez $v0, .L8013A650
  /* 1388C8 8013A648 8FA30018 */        lw $v1, 0x18($sp)
  /* 1388CC 8013A64C 00001825 */        or $v1, $zero, $zero
  .L8013A650:
  /* 1388D0 8013A650 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013A654:
  /* 1388D4 8013A654 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1388D8 8013A658 00601025 */        or $v0, $v1, $zero
  /* 1388DC 8013A65C 03E00008 */        jr $ra
  /* 1388E0 8013A660 00000000 */       nop

glabel mnBattleSaveMatchInfo
  /* 1388E4 8013A664 3C0E8014 */       lui $t6, %hi(gMNBattleTimerValue)
  /* 1388E8 8013A668 8DCEBD7C */        lw $t6, %lo(gMNBattleTimerValue)($t6)
  /* 1388EC 8013A66C 3C07800A */       lui $a3, %hi(gTransferBattleState)
  /* 1388F0 8013A670 24E74D08 */     addiu $a3, $a3, %lo(gTransferBattleState)
  /* 1388F4 8013A674 3C0F8014 */       lui $t7, %hi(gMNBattleStockValue)
  /* 1388F8 8013A678 A0EE0006 */        sb $t6, 6($a3) # gTransferBattleState + 6
  /* 1388FC 8013A67C 8DEFBD80 */        lw $t7, %lo(gMNBattleStockValue)($t7)
  /* 138900 8013A680 3C028014 */       lui $v0, %hi(gMNBattleIsTeamBattle)
  /* 138904 8013A684 3C188014 */       lui $t8, %hi(gMNBattleRule)
  /* 138908 8013A688 A0EF0007 */        sb $t7, 7($a3) # gTransferBattleState + 7
  /* 13890C 8013A68C 8C42BDA8 */        lw $v0, %lo(gMNBattleIsTeamBattle)($v0)
  /* 138910 8013A690 3C04800A */       lui $a0, %hi(gTransferBattleState)
  /* 138914 8013A694 3C058014 */       lui $a1, %hi(gMNBattlePanels)
  /* 138918 8013A698 A0E20002 */        sb $v0, 2($a3) # gTransferBattleState + 2
  /* 13891C 8013A69C 8F18BDAC */        lw $t8, %lo(gMNBattleRule)($t8)
  /* 138920 8013A6A0 3C0B8013 */       lui $t3, %hi(D_ovl2_8012EF40)
  /* 138924 8013A6A4 256BEF40 */     addiu $t3, $t3, %lo(D_ovl2_8012EF40)
  /* 138928 8013A6A8 24A5BA88 */     addiu $a1, $a1, %lo(gMNBattlePanels)
  /* 13892C 8013A6AC 24844D08 */     addiu $a0, $a0, %lo(gTransferBattleState)
  /* 138930 8013A6B0 00001825 */        or $v1, $zero, $zero
  /* 138934 8013A6B4 240A0004 */     addiu $t2, $zero, 4
  /* 138938 8013A6B8 24090001 */     addiu $t1, $zero, 1
  /* 13893C 8013A6BC 24080001 */     addiu $t0, $zero, 1
  /* 138940 8013A6C0 A0F80003 */        sb $t8, 3($a3) # gTransferBattleState + 3
  .L8013A6C4:
  /* 138944 8013A6C4 54400004 */      bnel $v0, $zero, .L8013A6D8
  /* 138948 8013A6C8 8CA60040 */        lw $a2, 0x40($a1) # gMNBattlePanels + 64
  /* 13894C 8013A6CC 10000004 */         b .L8013A6E0
  /* 138950 8013A6D0 A0830025 */        sb $v1, 0x25($a0) # gTransferBattleState + 37
  /* 138954 8013A6D4 8CA60040 */        lw $a2, 0x40($a1) # gMNBattlePanels + 64
  .L8013A6D8:
  /* 138958 8013A6D8 A0860025 */        sb $a2, 0x25($a0) # gTransferBattleState + 37
  /* 13895C 8013A6DC A0860024 */        sb $a2, 0x24($a0) # gTransferBattleState + 36
  .L8013A6E0:
  /* 138960 8013A6E0 8CAC0084 */        lw $t4, 0x84($a1) # gMNBattlePanels + 132
  /* 138964 8013A6E4 8CB90048 */        lw $t9, 0x48($a1) # gMNBattlePanels + 72
  /* 138968 8013A6E8 8CAD004C */        lw $t5, 0x4c($a1) # gMNBattlePanels + 76
  /* 13896C 8013A6EC 8CAE0050 */        lw $t6, 0x50($a1) # gMNBattlePanels + 80
  /* 138970 8013A6F0 318F00FF */      andi $t7, $t4, 0xff
  /* 138974 8013A6F4 A08C0022 */        sb $t4, 0x22($a0) # gTransferBattleState + 34
  /* 138978 8013A6F8 A0990023 */        sb $t9, 0x23($a0) # gTransferBattleState + 35
  /* 13897C 8013A6FC A08D0026 */        sb $t5, 0x26($a0) # gTransferBattleState + 38
  /* 138980 8013A700 15E0000B */      bnez $t7, .L8013A730
  /* 138984 8013A704 A08E0027 */        sb $t6, 0x27($a0) # gTransferBattleState + 39
  /* 138988 8013A708 90F80002 */       lbu $t8, 2($a3) # gTransferBattleState + 2
  /* 13898C 8013A70C 57000004 */      bnel $t8, $zero, .L8013A720
  /* 138990 8013A710 90990024 */       lbu $t9, 0x24($a0) # gTransferBattleState + 36
  /* 138994 8013A714 1000000F */         b .L8013A754
  /* 138998 8013A718 A0830028 */        sb $v1, 0x28($a0) # gTransferBattleState + 40
  /* 13899C 8013A71C 90990024 */       lbu $t9, 0x24($a0) # gTransferBattleState + 36
  .L8013A720:
  /* 1389A0 8013A720 01796021 */      addu $t4, $t3, $t9
  /* 1389A4 8013A724 918D0000 */       lbu $t5, ($t4)
  /* 1389A8 8013A728 1000000A */         b .L8013A754
  /* 1389AC 8013A72C A08D0028 */        sb $t5, 0x28($a0) # gTransferBattleState + 40
  .L8013A730:
  /* 1389B0 8013A730 90EE0002 */       lbu $t6, 2($a3) # gTransferBattleState + 2
  /* 1389B4 8013A734 55C00004 */      bnel $t6, $zero, .L8013A748
  /* 1389B8 8013A738 908F0024 */       lbu $t7, 0x24($a0) # gTransferBattleState + 36
  /* 1389BC 8013A73C 10000005 */         b .L8013A754
  /* 1389C0 8013A740 A08A0028 */        sb $t2, 0x28($a0) # gTransferBattleState + 40
  /* 1389C4 8013A744 908F0024 */       lbu $t7, 0x24($a0) # gTransferBattleState + 36
  .L8013A748:
  /* 1389C8 8013A748 016FC021 */      addu $t8, $t3, $t7
  /* 1389CC 8013A74C 93190000 */       lbu $t9, ($t8)
  /* 1389D0 8013A750 A0990028 */        sb $t9, 0x28($a0) # gTransferBattleState + 40
  .L8013A754:
  /* 1389D4 8013A754 908C0022 */       lbu $t4, 0x22($a0) # gTransferBattleState + 34
  /* 1389D8 8013A758 55800004 */      bnel $t4, $zero, .L8013A76C
  /* 1389DC 8013A75C A08A002A */        sb $t2, 0x2a($a0) # gTransferBattleState + 42
  /* 1389E0 8013A760 10000002 */         b .L8013A76C
  /* 1389E4 8013A764 A083002A */        sb $v1, 0x2a($a0) # gTransferBattleState + 42
  /* 1389E8 8013A768 A08A002A */        sb $t2, 0x2a($a0) # gTransferBattleState + 42
  .L8013A76C:
  /* 1389EC 8013A76C 90ED0003 */       lbu $t5, 3($a3) # gTransferBattleState + 3
  /* 1389F0 8013A770 24630001 */     addiu $v1, $v1, 1
  /* 1389F4 8013A774 28610004 */      slti $at, $v1, 4
  /* 1389F8 8013A778 31AE0001 */      andi $t6, $t5, 1
  /* 1389FC 8013A77C 51C00004 */      beql $t6, $zero, .L8013A790
  /* 138A00 8013A780 A0800029 */        sb $zero, 0x29($a0) # gTransferBattleState + 41
  /* 138A04 8013A784 10000002 */         b .L8013A790
  /* 138A08 8013A788 A0880029 */        sb $t0, 0x29($a0) # gTransferBattleState + 41
  /* 138A0C 8013A78C A0800029 */        sb $zero, 0x29($a0) # gTransferBattleState + 41
  .L8013A790:
  /* 138A10 8013A790 908F0022 */       lbu $t7, 0x22($a0) # gTransferBattleState + 34
  /* 138A14 8013A794 552F0005 */      bnel $t1, $t7, .L8013A7AC
  /* 138A18 8013A798 8CB9003C */        lw $t9, 0x3c($a1) # gMNBattlePanels + 60
  /* 138A1C 8013A79C 8CB80038 */        lw $t8, 0x38($a1) # gMNBattlePanels + 56
  /* 138A20 8013A7A0 10000003 */         b .L8013A7B0
  /* 138A24 8013A7A4 A0980020 */        sb $t8, 0x20($a0) # gTransferBattleState + 32
  /* 138A28 8013A7A8 8CB9003C */        lw $t9, 0x3c($a1) # gMNBattlePanels + 60
  .L8013A7AC:
  /* 138A2C 8013A7AC A0990021 */        sb $t9, 0x21($a0) # gTransferBattleState + 33
  .L8013A7B0:
  /* 138A30 8013A7B0 24840074 */     addiu $a0, $a0, 0x74
  /* 138A34 8013A7B4 1420FFC3 */      bnez $at, .L8013A6C4
  /* 138A38 8013A7B8 24A500BC */     addiu $a1, $a1, 0xbc
  /* 138A3C 8013A7BC 300200FF */      andi $v0, $zero, 0xff
  /* 138A40 8013A7C0 A0E20004 */        sb $v0, 4($a3) # gTransferBattleState + 4
  /* 138A44 8013A7C4 A0E00005 */        sb $zero, 5($a3) # gTransferBattleState + 5
  /* 138A48 8013A7C8 3C04800A */       lui $a0, %hi((gTransferBattleState + 0x22))
  /* 138A4C 8013A7CC 90844D2A */       lbu $a0, %lo((gTransferBattleState + 0x22))($a0)
  /* 138A50 8013A7D0 3C03800A */       lui $v1, %hi((gTransferBattleState + 0x96))
  /* 138A54 8013A7D4 50800006 */      beql $a0, $zero, .L8013A7F0
  /* 138A58 8013A7D8 90EC0004 */       lbu $t4, 4($a3) # gTransferBattleState + 4
  /* 138A5C 8013A7DC 10890007 */       beq $a0, $t1, .L8013A7FC
  /* 138A60 8013A7E0 244E0001 */     addiu $t6, $v0, 1
  /* 138A64 8013A7E4 10000006 */         b .L8013A800
  /* 138A68 8013A7E8 00000000 */       nop
  /* 138A6C 8013A7EC 90EC0004 */       lbu $t4, 4($a3) # gTransferBattleState + 4
  .L8013A7F0:
  /* 138A70 8013A7F0 258D0001 */     addiu $t5, $t4, 1
  /* 138A74 8013A7F4 10000002 */         b .L8013A800
  /* 138A78 8013A7F8 A0ED0004 */        sb $t5, 4($a3) # gTransferBattleState + 4
  .L8013A7FC:
  /* 138A7C 8013A7FC A0EE0005 */        sb $t6, 5($a3) # gTransferBattleState + 5
  .L8013A800:
  /* 138A80 8013A800 90634D9E */       lbu $v1, %lo((gTransferBattleState + 0x96))($v1)
  /* 138A84 8013A804 50600006 */      beql $v1, $zero, .L8013A820
  /* 138A88 8013A808 90EF0004 */       lbu $t7, 4($a3) # gTransferBattleState + 4
  /* 138A8C 8013A80C 50690008 */      beql $v1, $t1, .L8013A830
  /* 138A90 8013A810 90F90005 */       lbu $t9, 5($a3) # gTransferBattleState + 5
  /* 138A94 8013A814 10000008 */         b .L8013A838
  /* 138A98 8013A818 00000000 */       nop
  /* 138A9C 8013A81C 90EF0004 */       lbu $t7, 4($a3) # gTransferBattleState + 4
  .L8013A820:
  /* 138AA0 8013A820 25F80001 */     addiu $t8, $t7, 1
  /* 138AA4 8013A824 10000004 */         b .L8013A838
  /* 138AA8 8013A828 A0F80004 */        sb $t8, 4($a3) # gTransferBattleState + 4
  /* 138AAC 8013A82C 90F90005 */       lbu $t9, 5($a3) # gTransferBattleState + 5
  .L8013A830:
  /* 138AB0 8013A830 272C0001 */     addiu $t4, $t9, 1
  /* 138AB4 8013A834 A0EC0005 */        sb $t4, 5($a3) # gTransferBattleState + 5
  .L8013A838:
  /* 138AB8 8013A838 3C03800A */       lui $v1, %hi((gTransferBattleState + 0x10A))
  /* 138ABC 8013A83C 90634E12 */       lbu $v1, %lo((gTransferBattleState + 0x10A))($v1)
  /* 138AC0 8013A840 50600006 */      beql $v1, $zero, .L8013A85C
  /* 138AC4 8013A844 90ED0004 */       lbu $t5, 4($a3) # gTransferBattleState + 4
  /* 138AC8 8013A848 50690008 */      beql $v1, $t1, .L8013A86C
  /* 138ACC 8013A84C 90EF0005 */       lbu $t7, 5($a3) # gTransferBattleState + 5
  /* 138AD0 8013A850 10000008 */         b .L8013A874
  /* 138AD4 8013A854 00000000 */       nop
  /* 138AD8 8013A858 90ED0004 */       lbu $t5, 4($a3) # gTransferBattleState + 4
  .L8013A85C:
  /* 138ADC 8013A85C 25AE0001 */     addiu $t6, $t5, 1
  /* 138AE0 8013A860 10000004 */         b .L8013A874
  /* 138AE4 8013A864 A0EE0004 */        sb $t6, 4($a3) # gTransferBattleState + 4
  /* 138AE8 8013A868 90EF0005 */       lbu $t7, 5($a3) # gTransferBattleState + 5
  .L8013A86C:
  /* 138AEC 8013A86C 25F80001 */     addiu $t8, $t7, 1
  /* 138AF0 8013A870 A0F80005 */        sb $t8, 5($a3) # gTransferBattleState + 5
  .L8013A874:
  /* 138AF4 8013A874 3C03800A */       lui $v1, %hi((gTransferBattleState + 0x17E))
  /* 138AF8 8013A878 90634E86 */       lbu $v1, %lo((gTransferBattleState + 0x17E))($v1)
  /* 138AFC 8013A87C 50600006 */      beql $v1, $zero, .L8013A898
  /* 138B00 8013A880 90F90004 */       lbu $t9, 4($a3) # gTransferBattleState + 4
  /* 138B04 8013A884 50690008 */      beql $v1, $t1, .L8013A8A8
  /* 138B08 8013A888 90ED0005 */       lbu $t5, 5($a3) # gTransferBattleState + 5
  /* 138B0C 8013A88C 03E00008 */        jr $ra
  /* 138B10 8013A890 00000000 */       nop

  /* 138B14 8013A894 90F90004 */       lbu $t9, 4($a3)
  .L8013A898:
  /* 138B18 8013A898 272C0001 */     addiu $t4, $t9, 1
  /* 138B1C 8013A89C 03E00008 */        jr $ra
  /* 138B20 8013A8A0 A0EC0004 */        sb $t4, 4($a3)

  /* 138B24 8013A8A4 90ED0005 */       lbu $t5, 5($a3)
  .L8013A8A8:
  /* 138B28 8013A8A8 25AE0001 */     addiu $t6, $t5, 1
  /* 138B2C 8013A8AC A0EE0005 */        sb $t6, 5($a3)
  /* 138B30 8013A8B0 03E00008 */        jr $ra
  /* 138B34 8013A8B4 00000000 */       nop

glabel mnBattleDestroyCursorAndTokenProcesses
  /* 138B38 8013A8B8 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 138B3C 8013A8BC AFB10018 */        sw $s1, 0x18($sp)
  /* 138B40 8013A8C0 AFB00014 */        sw $s0, 0x14($sp)
  /* 138B44 8013A8C4 3C108014 */       lui $s0, %hi(gMNBattlePanels)
  /* 138B48 8013A8C8 3C118014 */       lui $s1, %hi(gMNBattlePickerGObj)
  /* 138B4C 8013A8CC AFBF001C */        sw $ra, 0x1c($sp)
  /* 138B50 8013A8D0 2631BD78 */     addiu $s1, $s1, %lo(gMNBattlePickerGObj)
  /* 138B54 8013A8D4 2610BA88 */     addiu $s0, $s0, %lo(gMNBattlePanels)
  /* 138B58 8013A8D8 8E020000 */        lw $v0, ($s0) # gMNBattlePanels + 0
  .L8013A8DC:
  /* 138B5C 8013A8DC 50400004 */      beql $v0, $zero, .L8013A8F0
  /* 138B60 8013A8E0 8E020004 */        lw $v0, 4($s0) # gMNBattlePanels + 4
  /* 138B64 8013A8E4 0C002CBB */       jal func_8000B2EC
  /* 138B68 8013A8E8 8C440018 */        lw $a0, 0x18($v0)
  /* 138B6C 8013A8EC 8E020004 */        lw $v0, 4($s0) # gMNBattlePanels + 4
  .L8013A8F0:
  /* 138B70 8013A8F0 50400004 */      beql $v0, $zero, .L8013A904
  /* 138B74 8013A8F4 261000BC */     addiu $s0, $s0, 0xbc
  /* 138B78 8013A8F8 0C002CBB */       jal func_8000B2EC
  /* 138B7C 8013A8FC 8C440018 */        lw $a0, 0x18($v0)
  /* 138B80 8013A900 261000BC */     addiu $s0, $s0, 0xbc
  .L8013A904:
  /* 138B84 8013A904 5611FFF5 */      bnel $s0, $s1, .L8013A8DC
  /* 138B88 8013A908 8E020000 */        lw $v0, ($s0) # gMNBattlePanels + 0
  /* 138B8C 8013A90C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 138B90 8013A910 8FB00014 */        lw $s0, 0x14($sp)
  /* 138B94 8013A914 8FB10018 */        lw $s1, 0x18($sp)
  /* 138B98 8013A918 03E00008 */        jr $ra
  /* 138B9C 8013A91C 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBattleMain
  /* 138BA0 8013A920 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 138BA4 8013A924 AFB00018 */        sw $s0, 0x18($sp)
  /* 138BA8 8013A928 3C108014 */       lui $s0, %hi(gMNBattleFramesElapsed)
  /* 138BAC 8013A92C 2610BDCC */     addiu $s0, $s0, %lo(gMNBattleFramesElapsed)
  /* 138BB0 8013A930 8E0E0000 */        lw $t6, ($s0) # gMNBattleFramesElapsed + 0
  /* 138BB4 8013A934 AFBF001C */        sw $ra, 0x1c($sp)
  /* 138BB8 8013A938 AFA40020 */        sw $a0, 0x20($sp)
  /* 138BBC 8013A93C 25CF0001 */     addiu $t7, $t6, 1
  /* 138BC0 8013A940 0C04E8A9 */       jal func_ovl26_8013A2A4
  /* 138BC4 8013A944 AE0F0000 */        sw $t7, ($s0) # gMNBattleFramesElapsed + 0
  /* 138BC8 8013A948 3C188014 */       lui $t8, %hi(gMNBattleMaxFramesElapsed)
  /* 138BCC 8013A94C 8F18BDD0 */        lw $t8, %lo(gMNBattleMaxFramesElapsed)($t8)
  /* 138BD0 8013A950 8E190000 */        lw $t9, ($s0) # gMNBattleFramesElapsed + 0
  /* 138BD4 8013A954 3C03800A */       lui $v1, %hi(gSceneData)
  /* 138BD8 8013A958 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 138BDC 8013A95C 17190009 */       bne $t8, $t9, .L8013A984
  /* 138BE0 8013A960 24090001 */     addiu $t1, $zero, 1
  /* 138BE4 8013A964 90680000 */       lbu $t0, ($v1) # gSceneData + 0
  /* 138BE8 8013A968 A0690000 */        sb $t1, ($v1) # gSceneData + 0
  /* 138BEC 8013A96C 0C04E999 */       jal mnBattleSaveMatchInfo
  /* 138BF0 8013A970 A0680001 */        sb $t0, 1($v1) # gSceneData + 1
  /* 138BF4 8013A974 0C00171D */       jal func_80005C74
  /* 138BF8 8013A978 00000000 */       nop
  /* 138BFC 8013A97C 1000005A */         b .L8013AAE8
  /* 138C00 8013A980 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013A984:
  /* 138C04 8013A984 0C0E42DF */       jal func_ovl1_80390B7C
  /* 138C08 8013A988 00000000 */       nop
  /* 138C0C 8013A98C 14400005 */      bnez $v0, .L8013A9A4
  /* 138C10 8013A990 3C0C8014 */       lui $t4, %hi(gMNBattleIsStartTriggered)
  /* 138C14 8013A994 8E0A0000 */        lw $t2, ($s0) # gMNBattleFramesElapsed + 0
  /* 138C18 8013A998 3C018014 */       lui $at, %hi(gMNBattleMaxFramesElapsed)
  /* 138C1C 8013A99C 254B4650 */     addiu $t3, $t2, 0x4650
  /* 138C20 8013A9A0 AC2BBDD0 */        sw $t3, %lo(gMNBattleMaxFramesElapsed)($at)
  .L8013A9A4:
  /* 138C24 8013A9A4 8D8CBDA4 */        lw $t4, %lo(gMNBattleIsStartTriggered)($t4)
  /* 138C28 8013A9A8 3C028014 */       lui $v0, %hi(gMNBattleStartDelayTimer)
  /* 138C2C 8013A9AC 2442BDA0 */     addiu $v0, $v0, %lo(gMNBattleStartDelayTimer)
  /* 138C30 8013A9B0 11800029 */      beqz $t4, .L8013AA58
  /* 138C34 8013A9B4 00000000 */       nop
  /* 138C38 8013A9B8 8C4D0000 */        lw $t5, ($v0) # gMNBattleStartDelayTimer + 0
  /* 138C3C 8013A9BC 3C03800A */       lui $v1, %hi(gSceneData)
  /* 138C40 8013A9C0 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 138C44 8013A9C4 25AEFFFF */     addiu $t6, $t5, -1
  /* 138C48 8013A9C8 15C00046 */      bnez $t6, .L8013AAE4
  /* 138C4C 8013A9CC AC4E0000 */        sw $t6, ($v0) # gMNBattleStartDelayTimer + 0
  /* 138C50 8013A9D0 90780000 */       lbu $t8, ($v1) # gSceneData + 0
  /* 138C54 8013A9D4 3C19800A */       lui $t9, %hi((gTransferBattleState + 0xA))
  /* 138C58 8013A9D8 24080015 */     addiu $t0, $zero, 0x15
  /* 138C5C 8013A9DC A0780001 */        sb $t8, 1($v1) # gSceneData + 1
  /* 138C60 8013A9E0 93394D12 */       lbu $t9, %lo((gTransferBattleState + 0xA))($t9)
  /* 138C64 8013A9E4 24090016 */     addiu $t1, $zero, 0x16
  /* 138C68 8013A9E8 3C0A800A */       lui $t2, %hi((gSaveData + 0x457))
  /* 138C6C 8013A9EC 53200004 */      beql $t9, $zero, .L8013AA00
  /* 138C70 8013A9F0 A0690000 */        sb $t1, ($v1) # gSceneData + 0
  /* 138C74 8013A9F4 10000012 */         b .L8013AA40
  /* 138C78 8013A9F8 A0680000 */        sb $t0, ($v1) # gSceneData + 0
  /* 138C7C 8013A9FC A0690000 */        sb $t1, ($v1) # gSceneData + 0
  .L8013AA00:
  /* 138C80 8013AA00 914A4937 */       lbu $t2, %lo((gSaveData + 0x457))($t2)
  /* 138C84 8013AA04 24100008 */     addiu $s0, $zero, 8
  /* 138C88 8013AA08 314B0010 */      andi $t3, $t2, 0x10
  /* 138C8C 8013AA0C 11600003 */      beqz $t3, .L8013AA1C
  /* 138C90 8013AA10 00000000 */       nop
  /* 138C94 8013AA14 10000001 */         b .L8013AA1C
  /* 138C98 8013AA18 24100009 */     addiu $s0, $zero, 9
  .L8013AA1C:
  /* 138C9C 8013AA1C 0C00628C */       jal lbRandom_GetTimeByteRange
  /* 138CA0 8013AA20 02002025 */        or $a0, $s0, $zero
  /* 138CA4 8013AA24 3C03800A */       lui $v1, %hi(gSceneData)
  /* 138CA8 8013AA28 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 138CAC 8013AA2C 906C000F */       lbu $t4, 0xf($v1) # gSceneData + 15
  /* 138CB0 8013AA30 104CFFFA */       beq $v0, $t4, .L8013AA1C
  /* 138CB4 8013AA34 00000000 */       nop
  /* 138CB8 8013AA38 3C01800A */       lui $at, %hi((gSceneData + 0xF))
  /* 138CBC 8013AA3C A0224ADF */        sb $v0, %lo((gSceneData + 0xF))($at)
  .L8013AA40:
  /* 138CC0 8013AA40 0C04E999 */       jal mnBattleSaveMatchInfo
  /* 138CC4 8013AA44 00000000 */       nop
  /* 138CC8 8013AA48 0C00171D */       jal func_80005C74
  /* 138CCC 8013AA4C 00000000 */       nop
  /* 138CD0 8013AA50 10000025 */         b .L8013AAE8
  /* 138CD4 8013AA54 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013AA58:
  /* 138CD8 8013AA58 0C0E41DB */       jal func_ovl1_8039076C
  /* 138CDC 8013AA5C 24041000 */     addiu $a0, $zero, 0x1000
  /* 138CE0 8013AA60 5040001A */      beql $v0, $zero, .L8013AACC
  /* 138CE4 8013AA64 00008025 */        or $s0, $zero, $zero
  /* 138CE8 8013AA68 8E0D0000 */        lw $t5, ($s0) # gMNBattleFramesElapsed + 0
  /* 138CEC 8013AA6C 29A1003D */      slti $at, $t5, 0x3d
  /* 138CF0 8013AA70 54200016 */      bnel $at, $zero, .L8013AACC
  /* 138CF4 8013AA74 00008025 */        or $s0, $zero, $zero
  /* 138CF8 8013AA78 0C04E979 */       jal mnBattleIsReadyToFight
  /* 138CFC 8013AA7C 00000000 */       nop
  /* 138D00 8013AA80 1040000F */      beqz $v0, .L8013AAC0
  /* 138D04 8013AA84 00000000 */       nop
  /* 138D08 8013AA88 0C009A70 */       jal func_800269C0
  /* 138D0C 8013AA8C 2404026A */     addiu $a0, $zero, 0x26a
  /* 138D10 8013AA90 0C04E903 */       jal func_ovl26_8013A40C
  /* 138D14 8013AA94 00000000 */       nop
  /* 138D18 8013AA98 3C028014 */       lui $v0, %hi(gMNBattleStartDelayTimer)
  /* 138D1C 8013AA9C 2442BDA0 */     addiu $v0, $v0, %lo(gMNBattleStartDelayTimer)
  /* 138D20 8013AAA0 240E001E */     addiu $t6, $zero, 0x1e
  /* 138D24 8013AAA4 AC4E0000 */        sw $t6, ($v0) # gMNBattleStartDelayTimer + 0
  /* 138D28 8013AAA8 240F0001 */     addiu $t7, $zero, 1
  /* 138D2C 8013AAAC 3C018014 */       lui $at, %hi(gMNBattleIsStartTriggered)
  /* 138D30 8013AAB0 0C04EA2E */       jal mnBattleDestroyCursorAndTokenProcesses
  /* 138D34 8013AAB4 AC2FBDA4 */        sw $t7, %lo(gMNBattleIsStartTriggered)($at)
  /* 138D38 8013AAB8 10000004 */         b .L8013AACC
  /* 138D3C 8013AABC 00008025 */        or $s0, $zero, $zero
  .L8013AAC0:
  /* 138D40 8013AAC0 0C009A70 */       jal func_800269C0
  /* 138D44 8013AAC4 240400A5 */     addiu $a0, $zero, 0xa5
  /* 138D48 8013AAC8 00008025 */        or $s0, $zero, $zero
  .L8013AACC:
  /* 138D4C 8013AACC 0C04E837 */       jal func_ovl26_8013A0DC
  /* 138D50 8013AAD0 02002025 */        or $a0, $s0, $zero
  /* 138D54 8013AAD4 26100001 */     addiu $s0, $s0, 1
  /* 138D58 8013AAD8 24010004 */     addiu $at, $zero, 4
  /* 138D5C 8013AADC 1601FFFB */       bne $s0, $at, .L8013AACC
  /* 138D60 8013AAE0 00000000 */       nop
  .L8013AAE4:
  /* 138D64 8013AAE4 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013AAE8:
  /* 138D68 8013AAE8 8FB00018 */        lw $s0, 0x18($sp)
  /* 138D6C 8013AAEC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 138D70 8013AAF0 03E00008 */        jr $ra
  /* 138D74 8013AAF4 00000000 */       nop

glabel mnBattleGetNextTimerValue
  /* 138D78 8013AAF8 3C0F8014 */       lui $t7, %hi(dMNBattleTimerValues)
  /* 138D7C 8013AAFC 25EFB93C */     addiu $t7, $t7, %lo(dMNBattleTimerValues)
  /* 138D80 8013AB00 8DF90000 */        lw $t9, ($t7) # dMNBattleTimerValues + 0
  /* 138D84 8013AB04 8DF80004 */        lw $t8, 4($t7) # dMNBattleTimerValues + 4
  /* 138D88 8013AB08 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 138D8C 8013AB0C 27AE000C */     addiu $t6, $sp, 0xc
  /* 138D90 8013AB10 ADD90000 */        sw $t9, ($t6)
  /* 138D94 8013AB14 ADD80004 */        sw $t8, 4($t6)
  /* 138D98 8013AB18 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTimerValues + 12
  /* 138D9C 8013AB1C 8DF90008 */        lw $t9, 8($t7) # dMNBattleTimerValues + 8
  /* 138DA0 8013AB20 27A3000C */     addiu $v1, $sp, 0xc
  /* 138DA4 8013AB24 ADD8000C */        sw $t8, 0xc($t6)
  /* 138DA8 8013AB28 ADD90008 */        sw $t9, 8($t6)
  /* 138DAC 8013AB2C 8DF90010 */        lw $t9, 0x10($t7) # dMNBattleTimerValues + 16
  /* 138DB0 8013AB30 8DF80014 */        lw $t8, 0x14($t7) # dMNBattleTimerValues + 20
  /* 138DB4 8013AB34 27A2002C */     addiu $v0, $sp, 0x2c
  /* 138DB8 8013AB38 ADD90010 */        sw $t9, 0x10($t6)
  /* 138DBC 8013AB3C ADD80014 */        sw $t8, 0x14($t6)
  /* 138DC0 8013AB40 8DF8001C */        lw $t8, 0x1c($t7) # dMNBattleTimerValues + 28
  /* 138DC4 8013AB44 8DF90018 */        lw $t9, 0x18($t7) # dMNBattleTimerValues + 24
  /* 138DC8 8013AB48 ADD8001C */        sw $t8, 0x1c($t6)
  /* 138DCC 8013AB4C ADD90018 */        sw $t9, 0x18($t6)
  /* 138DD0 8013AB50 8FA80028 */        lw $t0, 0x28($sp)
  /* 138DD4 8013AB54 14880003 */       bne $a0, $t0, .L8013AB64
  /* 138DD8 8013AB58 00000000 */       nop
  /* 138DDC 8013AB5C 1000001D */         b .L8013ABD4
  /* 138DE0 8013AB60 8FA2000C */        lw $v0, 0xc($sp)
  .L8013AB64:
  /* 138DE4 8013AB64 8C650000 */        lw $a1, ($v1)
  .L8013AB68:
  /* 138DE8 8013AB68 0085082A */       slt $at, $a0, $a1
  /* 138DEC 8013AB6C 50200004 */      beql $at, $zero, .L8013AB80
  /* 138DF0 8013AB70 8C650004 */        lw $a1, 4($v1)
  /* 138DF4 8013AB74 10000017 */         b .L8013ABD4
  /* 138DF8 8013AB78 00A01025 */        or $v0, $a1, $zero
  /* 138DFC 8013AB7C 8C650004 */        lw $a1, 4($v1)
  .L8013AB80:
  /* 138E00 8013AB80 0085082A */       slt $at, $a0, $a1
  /* 138E04 8013AB84 50200004 */      beql $at, $zero, .L8013AB98
  /* 138E08 8013AB88 8C650008 */        lw $a1, 8($v1)
  /* 138E0C 8013AB8C 10000011 */         b .L8013ABD4
  /* 138E10 8013AB90 00A01025 */        or $v0, $a1, $zero
  /* 138E14 8013AB94 8C650008 */        lw $a1, 8($v1)
  .L8013AB98:
  /* 138E18 8013AB98 0085082A */       slt $at, $a0, $a1
  /* 138E1C 8013AB9C 50200004 */      beql $at, $zero, .L8013ABB0
  /* 138E20 8013ABA0 8C65000C */        lw $a1, 0xc($v1)
  /* 138E24 8013ABA4 1000000B */         b .L8013ABD4
  /* 138E28 8013ABA8 00A01025 */        or $v0, $a1, $zero
  /* 138E2C 8013ABAC 8C65000C */        lw $a1, 0xc($v1)
  .L8013ABB0:
  /* 138E30 8013ABB0 24630010 */     addiu $v1, $v1, 0x10
  /* 138E34 8013ABB4 0085082A */       slt $at, $a0, $a1
  /* 138E38 8013ABB8 10200003 */      beqz $at, .L8013ABC8
  /* 138E3C 8013ABBC 00000000 */       nop
  /* 138E40 8013ABC0 10000004 */         b .L8013ABD4
  /* 138E44 8013ABC4 00A01025 */        or $v0, $a1, $zero
  .L8013ABC8:
  /* 138E48 8013ABC8 5462FFE7 */      bnel $v1, $v0, .L8013AB68
  /* 138E4C 8013ABCC 8C650000 */        lw $a1, ($v1)
  /* 138E50 8013ABD0 8FA20028 */        lw $v0, 0x28($sp)
  .L8013ABD4:
  /* 138E54 8013ABD4 03E00008 */        jr $ra
  /* 138E58 8013ABD8 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleGetPrevTimerValue
  /* 138E5C 8013ABDC 3C0F8014 */       lui $t7, %hi(dMNBattleTimerValuesDuplicate)
  /* 138E60 8013ABE0 25EFB95C */     addiu $t7, $t7, %lo(dMNBattleTimerValuesDuplicate)
  /* 138E64 8013ABE4 8DF90000 */        lw $t9, ($t7) # dMNBattleTimerValuesDuplicate + 0
  /* 138E68 8013ABE8 8DF80004 */        lw $t8, 4($t7) # dMNBattleTimerValuesDuplicate + 4
  /* 138E6C 8013ABEC 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 138E70 8013ABF0 27AE000C */     addiu $t6, $sp, 0xc
  /* 138E74 8013ABF4 ADD90000 */        sw $t9, ($t6)
  /* 138E78 8013ABF8 ADD80004 */        sw $t8, 4($t6)
  /* 138E7C 8013ABFC 8DF8000C */        lw $t8, 0xc($t7) # dMNBattleTimerValuesDuplicate + 12
  /* 138E80 8013AC00 8DF90008 */        lw $t9, 8($t7) # dMNBattleTimerValuesDuplicate + 8
  /* 138E84 8013AC04 27A30028 */     addiu $v1, $sp, 0x28
  /* 138E88 8013AC08 ADD8000C */        sw $t8, 0xc($t6)
  /* 138E8C 8013AC0C ADD90008 */        sw $t9, 8($t6)
  /* 138E90 8013AC10 8DF90010 */        lw $t9, 0x10($t7) # dMNBattleTimerValuesDuplicate + 16
  /* 138E94 8013AC14 8DF80014 */        lw $t8, 0x14($t7) # dMNBattleTimerValuesDuplicate + 20
  /* 138E98 8013AC18 27A2000C */     addiu $v0, $sp, 0xc
  /* 138E9C 8013AC1C ADD90010 */        sw $t9, 0x10($t6)
  /* 138EA0 8013AC20 ADD80014 */        sw $t8, 0x14($t6)
  /* 138EA4 8013AC24 8DF8001C */        lw $t8, 0x1c($t7) # dMNBattleTimerValuesDuplicate + 28
  /* 138EA8 8013AC28 8DF90018 */        lw $t9, 0x18($t7) # dMNBattleTimerValuesDuplicate + 24
  /* 138EAC 8013AC2C ADD8001C */        sw $t8, 0x1c($t6)
  /* 138EB0 8013AC30 ADD90018 */        sw $t9, 0x18($t6)
  /* 138EB4 8013AC34 8FA8000C */        lw $t0, 0xc($sp)
  /* 138EB8 8013AC38 14880003 */       bne $a0, $t0, .L8013AC48
  /* 138EBC 8013AC3C 00000000 */       nop
  /* 138EC0 8013AC40 1000000C */         b .L8013AC74
  /* 138EC4 8013AC44 8FA20028 */        lw $v0, 0x28($sp)
  .L8013AC48:
  /* 138EC8 8013AC48 8C650000 */        lw $a1, ($v1)
  .L8013AC4C:
  /* 138ECC 8013AC4C 2463FFFC */     addiu $v1, $v1, -4
  /* 138ED0 8013AC50 00A4082A */       slt $at, $a1, $a0
  /* 138ED4 8013AC54 50200004 */      beql $at, $zero, .L8013AC68
  /* 138ED8 8013AC58 0062082B */      sltu $at, $v1, $v0
  /* 138EDC 8013AC5C 10000005 */         b .L8013AC74
  /* 138EE0 8013AC60 00A01025 */        or $v0, $a1, $zero
  /* 138EE4 8013AC64 0062082B */      sltu $at, $v1, $v0
  .L8013AC68:
  /* 138EE8 8013AC68 5020FFF8 */      beql $at, $zero, .L8013AC4C
  /* 138EEC 8013AC6C 8C650000 */        lw $a1, ($v1)
  /* 138EF0 8013AC70 8FA20028 */        lw $v0, 0x28($sp)
  .L8013AC74:
  /* 138EF4 8013AC74 03E00008 */        jr $ra
  /* 138EF8 8013AC78 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBattleInitPort
  /* 138EFC 8013AC7C 00047080 */       sll $t6, $a0, 2
  /* 138F00 8013AC80 01C47023 */      subu $t6, $t6, $a0
  /* 138F04 8013AC84 000E7100 */       sll $t6, $t6, 4
  /* 138F08 8013AC88 01C47023 */      subu $t6, $t6, $a0
  /* 138F0C 8013AC8C 3C0F8014 */       lui $t7, %hi(gMNBattlePanels)
  /* 138F10 8013AC90 25EFBA88 */     addiu $t7, $t7, %lo(gMNBattlePanels)
  /* 138F14 8013AC94 000E7080 */       sll $t6, $t6, 2
  /* 138F18 8013AC98 0004C0C0 */       sll $t8, $a0, 3
  /* 138F1C 8013AC9C 01CF1021 */      addu $v0, $t6, $t7
  /* 138F20 8013ACA0 0304C023 */      subu $t8, $t8, $a0
  /* 138F24 8013ACA4 0018C080 */       sll $t8, $t8, 2
  /* 138F28 8013ACA8 0304C021 */      addu $t8, $t8, $a0
  /* 138F2C 8013ACAC 3C19800A */       lui $t9, %hi(gTransferBattleState)
  /* 138F30 8013ACB0 27394D08 */     addiu $t9, $t9, %lo(gTransferBattleState)
  /* 138F34 8013ACB4 0018C080 */       sll $t8, $t8, 2
  /* 138F38 8013ACB8 03191821 */      addu $v1, $t8, $t9
  /* 138F3C 8013ACBC 90650022 */       lbu $a1, 0x22($v1)
  /* 138F40 8013ACC0 90680023 */       lbu $t0, 0x23($v1)
  /* 138F44 8013ACC4 AC40001C */        sw $zero, 0x1c($v0)
  /* 138F48 8013ACC8 AC400020 */        sw $zero, 0x20($v0)
  /* 138F4C 8013ACCC AC400024 */        sw $zero, 0x24($v0)
  /* 138F50 8013ACD0 AC400028 */        sw $zero, 0x28($v0)
  /* 138F54 8013ACD4 AC40002C */        sw $zero, 0x2c($v0)
  /* 138F58 8013ACD8 AC4000A8 */        sw $zero, 0xa8($v0)
  /* 138F5C 8013ACDC A44000AC */        sh $zero, 0xac($v0)
  /* 138F60 8013ACE0 AC400008 */        sw $zero, 8($v0)
  /* 138F64 8013ACE4 14A0000D */      bnez $a1, .L8013AD1C
  /* 138F68 8013ACE8 AC480048 */        sw $t0, 0x48($v0)
  /* 138F6C 8013ACEC 00044880 */       sll $t1, $a0, 2
  /* 138F70 8013ACF0 3C068014 */       lui $a2, %hi(gMNBattleControllerOrderArray)
  /* 138F74 8013ACF4 00C93021 */      addu $a2, $a2, $t1
  /* 138F78 8013ACF8 8CC6BD90 */        lw $a2, %lo(gMNBattleControllerOrderArray)($a2)
  /* 138F7C 8013ACFC 2407FFFF */     addiu $a3, $zero, -1
  /* 138F80 8013AD00 240A0002 */     addiu $t2, $zero, 2
  /* 138F84 8013AD04 54E60006 */      bnel $a3, $a2, .L8013AD20
  /* 138F88 8013AD08 AC450084 */        sw $a1, 0x84($v0)
  /* 138F8C 8013AD0C 2405001C */     addiu $a1, $zero, 0x1c
  /* 138F90 8013AD10 AC4A0084 */        sw $t2, 0x84($v0)
  /* 138F94 8013AD14 10000008 */         b .L8013AD38
  /* 138F98 8013AD18 AC450048 */        sw $a1, 0x48($v0)
  .L8013AD1C:
  /* 138F9C 8013AD1C AC450084 */        sw $a1, 0x84($v0)
  .L8013AD20:
  /* 138FA0 8013AD20 00045880 */       sll $t3, $a0, 2
  /* 138FA4 8013AD24 3C068014 */       lui $a2, %hi(gMNBattleControllerOrderArray)
  /* 138FA8 8013AD28 00CB3021 */      addu $a2, $a2, $t3
  /* 138FAC 8013AD2C 2407FFFF */     addiu $a3, $zero, -1
  /* 138FB0 8013AD30 8CC6BD90 */        lw $a2, %lo(gMNBattleControllerOrderArray)($a2)
  /* 138FB4 8013AD34 2405001C */     addiu $a1, $zero, 0x1c
  .L8013AD38:
  /* 138FB8 8013AD38 8C4F0084 */        lw $t7, 0x84($v0)
  /* 138FBC 8013AD3C 906C0020 */       lbu $t4, 0x20($v1)
  /* 138FC0 8013AD40 906D0021 */       lbu $t5, 0x21($v1)
  /* 138FC4 8013AD44 906E0024 */       lbu $t6, 0x24($v1)
  /* 138FC8 8013AD48 AC4C0038 */        sw $t4, 0x38($v0)
  /* 138FCC 8013AD4C AC4D003C */        sw $t5, 0x3c($v0)
  /* 138FD0 8013AD50 15E00007 */      bnez $t7, .L8013AD70
  /* 138FD4 8013AD54 AC4E0040 */        sw $t6, 0x40($v0)
  /* 138FD8 8013AD58 8C580048 */        lw $t8, 0x48($v0)
  /* 138FDC 8013AD5C 54B80005 */      bnel $a1, $t8, .L8013AD74
  /* 138FE0 8013AD60 24190004 */     addiu $t9, $zero, 4
  /* 138FE4 8013AD64 AC44007C */        sw $a0, 0x7c($v0)
  /* 138FE8 8013AD68 10000004 */         b .L8013AD7C
  /* 138FEC 8013AD6C AC440080 */        sw $a0, 0x80($v0)
  .L8013AD70:
  /* 138FF0 8013AD70 24190004 */     addiu $t9, $zero, 4
  .L8013AD74:
  /* 138FF4 8013AD74 AC59007C */        sw $t9, 0x7c($v0)
  /* 138FF8 8013AD78 AC470080 */        sw $a3, 0x80($v0)
  .L8013AD7C:
  /* 138FFC 8013AD7C 8C480048 */        lw $t0, 0x48($v0)
  /* 139000 8013AD80 54A80007 */      bnel $a1, $t0, .L8013ADA0
  /* 139004 8013AD84 24050001 */     addiu $a1, $zero, 1
  /* 139008 8013AD88 AC400088 */        sw $zero, 0x88($v0)
  /* 13900C 8013AD8C AC400058 */        sw $zero, 0x58($v0)
  /* 139010 8013AD90 AC40005C */        sw $zero, 0x5c($v0)
  /* 139014 8013AD94 10000006 */         b .L8013ADB0
  /* 139018 8013AD98 AC40008C */        sw $zero, 0x8c($v0)
  /* 13901C 8013AD9C 24050001 */     addiu $a1, $zero, 1
  .L8013ADA0:
  /* 139020 8013ADA0 AC450088 */        sw $a1, 0x88($v0)
  /* 139024 8013ADA4 AC450058 */        sw $a1, 0x58($v0)
  /* 139028 8013ADA8 AC40005C */        sw $zero, 0x5c($v0)
  /* 13902C 8013ADAC AC40008C */        sw $zero, 0x8c($v0)
  .L8013ADB0:
  /* 139030 8013ADB0 90690026 */       lbu $t1, 0x26($v1)
  /* 139034 8013ADB4 906A0027 */       lbu $t2, 0x27($v1)
  /* 139038 8013ADB8 AC49004C */        sw $t1, 0x4c($v0)
  /* 13903C 8013ADBC 10E60006 */       beq $a3, $a2, .L8013ADD8
  /* 139040 8013ADC0 AC4A0050 */        sw $t2, 0x50($v0)
  /* 139044 8013ADC4 8C4B0084 */        lw $t3, 0x84($v0)
  /* 139048 8013ADC8 24010002 */     addiu $at, $zero, 2
  /* 13904C 8013ADCC 15610002 */       bne $t3, $at, .L8013ADD8
  /* 139050 8013ADD0 00000000 */       nop
  /* 139054 8013ADD4 AC44007C */        sw $a0, 0x7c($v0)
  .L8013ADD8:
  /* 139058 8013ADD8 03E00008 */        jr $ra
  /* 13905C 8013ADDC 00000000 */       nop

glabel mnBattleResetPort
  /* 139060 8013ADE0 0004C880 */       sll $t9, $a0, 2
  /* 139064 8013ADE4 3C0E8014 */       lui $t6, %hi(dMNBattleDefaultTeam)
  /* 139068 8013ADE8 0324C823 */      subu $t9, $t9, $a0
  /* 13906C 8013ADEC 25CEB97C */     addiu $t6, $t6, %lo(dMNBattleDefaultTeam)
  /* 139070 8013ADF0 0019C900 */       sll $t9, $t9, 4
  /* 139074 8013ADF4 8DD80000 */        lw $t8, ($t6) # dMNBattleDefaultTeam + 0
  /* 139078 8013ADF8 0324C823 */      subu $t9, $t9, $a0
  /* 13907C 8013ADFC 3C088014 */       lui $t0, %hi(gMNBattlePanels)
  /* 139080 8013AE00 2508BA88 */     addiu $t0, $t0, %lo(gMNBattlePanels)
  /* 139084 8013AE04 0019C880 */       sll $t9, $t9, 2
  /* 139088 8013AE08 03281021 */      addu $v0, $t9, $t0
  /* 13908C 8013AE0C 000448C0 */       sll $t1, $a0, 3
  /* 139090 8013AE10 01244823 */      subu $t1, $t1, $a0
  /* 139094 8013AE14 00094880 */       sll $t1, $t1, 2
  /* 139098 8013AE18 27BDFFF8 */     addiu $sp, $sp, -8
  /* 13909C 8013AE1C 01244821 */      addu $t1, $t1, $a0
  /* 1390A0 8013AE20 3C0A800A */       lui $t2, %hi(gTransferBattleState)
  /* 1390A4 8013AE24 27A50004 */     addiu $a1, $sp, 4
  /* 1390A8 8013AE28 254A4D08 */     addiu $t2, $t2, %lo(gTransferBattleState)
  /* 1390AC 8013AE2C 00094880 */       sll $t1, $t1, 2
  /* 1390B0 8013AE30 012A1821 */      addu $v1, $t1, $t2
  /* 1390B4 8013AE34 00A47021 */      addu $t6, $a1, $a0
  /* 1390B8 8013AE38 ACB80000 */        sw $t8, ($a1)
  /* 1390BC 8013AE3C 906B0020 */       lbu $t3, 0x20($v1)
  /* 1390C0 8013AE40 906C0021 */       lbu $t4, 0x21($v1)
  /* 1390C4 8013AE44 91CF0000 */       lbu $t7, ($t6) # dMNBattleDefaultTeam + 0
  /* 1390C8 8013AE48 240D001C */     addiu $t5, $zero, 0x1c
  /* 1390CC 8013AE4C 0004C080 */       sll $t8, $a0, 2
  /* 1390D0 8013AE50 3C198014 */       lui $t9, %hi(gMNBattleControllerOrderArray)
  /* 1390D4 8013AE54 AC40001C */        sw $zero, 0x1c($v0)
  /* 1390D8 8013AE58 AC400020 */        sw $zero, 0x20($v0)
  /* 1390DC 8013AE5C AC400024 */        sw $zero, 0x24($v0)
  /* 1390E0 8013AE60 AC400028 */        sw $zero, 0x28($v0)
  /* 1390E4 8013AE64 AC40002C */        sw $zero, 0x2c($v0)
  /* 1390E8 8013AE68 AC400008 */        sw $zero, 8($v0)
  /* 1390EC 8013AE6C AC4000A8 */        sw $zero, 0xa8($v0)
  /* 1390F0 8013AE70 A44000AC */        sh $zero, 0xac($v0)
  /* 1390F4 8013AE74 AC400058 */        sw $zero, 0x58($v0)
  /* 1390F8 8013AE78 AC4D0048 */        sw $t5, 0x48($v0)
  /* 1390FC 8013AE7C AC40005C */        sw $zero, 0x5c($v0)
  /* 139100 8013AE80 0338C821 */      addu $t9, $t9, $t8
  /* 139104 8013AE84 AC4B0038 */        sw $t3, 0x38($v0)
  /* 139108 8013AE88 AC4C003C */        sw $t4, 0x3c($v0)
  /* 13910C 8013AE8C AC4F0040 */        sw $t7, 0x40($v0)
  /* 139110 8013AE90 8F39BD90 */        lw $t9, %lo(gMNBattleControllerOrderArray)($t9)
  /* 139114 8013AE94 2406FFFF */     addiu $a2, $zero, -1
  /* 139118 8013AE98 24080002 */     addiu $t0, $zero, 2
  /* 13911C 8013AE9C 14D90005 */       bne $a2, $t9, .L8013AEB4
  /* 139120 8013AEA0 24090004 */     addiu $t1, $zero, 4
  /* 139124 8013AEA4 AC480084 */        sw $t0, 0x84($v0)
  /* 139128 8013AEA8 AC49007C */        sw $t1, 0x7c($v0)
  /* 13912C 8013AEAC 10000004 */         b .L8013AEC0
  /* 139130 8013AEB0 AC460080 */        sw $a2, 0x80($v0)
  .L8013AEB4:
  /* 139134 8013AEB4 AC400084 */        sw $zero, 0x84($v0)
  /* 139138 8013AEB8 AC44007C */        sw $a0, 0x7c($v0)
  /* 13913C 8013AEBC AC440080 */        sw $a0, 0x80($v0)
  .L8013AEC0:
  /* 139140 8013AEC0 03E00008 */        jr $ra
  /* 139144 8013AEC4 27BD0008 */     addiu $sp, $sp, 8

glabel mnBattleLoadMatchInfo
  /* 139148 8013AEC8 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13914C 8013AECC 3C028014 */       lui $v0, %hi(gMNBattleFramesElapsed)
  /* 139150 8013AED0 2442BDCC */     addiu $v0, $v0, %lo(gMNBattleFramesElapsed)
  /* 139154 8013AED4 AFB20020 */        sw $s2, 0x20($sp)
  /* 139158 8013AED8 3C12800A */       lui $s2, %hi(gTransferBattleState)
  /* 13915C 8013AEDC AC400000 */        sw $zero, ($v0) # gMNBattleFramesElapsed + 0
  /* 139160 8013AEE0 240F4650 */     addiu $t7, $zero, 0x4650
  /* 139164 8013AEE4 3C018014 */       lui $at, %hi(gMNBattleMaxFramesElapsed)
  /* 139168 8013AEE8 26524D08 */     addiu $s2, $s2, %lo(gTransferBattleState)
  /* 13916C 8013AEEC AC2FBDD0 */        sw $t7, %lo(gMNBattleMaxFramesElapsed)($at)
  /* 139170 8013AEF0 92580006 */       lbu $t8, 6($s2) # gTransferBattleState + 6
  /* 139174 8013AEF4 3C018014 */       lui $at, %hi(gMNBattleTimerValue)
  /* 139178 8013AEF8 AFB30024 */        sw $s3, 0x24($sp)
  /* 13917C 8013AEFC AC38BD7C */        sw $t8, %lo(gMNBattleTimerValue)($at)
  /* 139180 8013AF00 92590007 */       lbu $t9, 7($s2) # gTransferBattleState + 7
  /* 139184 8013AF04 3C018014 */       lui $at, %hi(gMNBattleStockValue)
  /* 139188 8013AF08 3C138014 */       lui $s3, %hi(D_ovl26_8013BDC8)
  /* 13918C 8013AF0C AC39BD80 */        sw $t9, %lo(gMNBattleStockValue)($at)
  /* 139190 8013AF10 3C018014 */       lui $at, %hi(gMNBattleIsStartTriggered)
  /* 139194 8013AF14 AC20BDA4 */        sw $zero, %lo(gMNBattleIsStartTriggered)($at)
  /* 139198 8013AF18 92480002 */       lbu $t0, 2($s2) # gTransferBattleState + 2
  /* 13919C 8013AF1C 3C018014 */       lui $at, %hi(gMNBattleIsTeamBattle)
  /* 1391A0 8013AF20 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1391A4 8013AF24 AC28BDA8 */        sw $t0, %lo(gMNBattleIsTeamBattle)($at)
  /* 1391A8 8013AF28 92490003 */       lbu $t1, 3($s2) # gTransferBattleState + 3
  /* 1391AC 8013AF2C 3C018014 */       lui $at, %hi(gMNBattleRule)
  /* 1391B0 8013AF30 2673BDC8 */     addiu $s3, $s3, %lo(D_ovl26_8013BDC8)
  /* 1391B4 8013AF34 AC29BDAC */        sw $t1, %lo(gMNBattleRule)($at)
  /* 1391B8 8013AF38 924A0010 */       lbu $t2, 0x10($s2) # gTransferBattleState + 16
  /* 1391BC 8013AF3C AFB40028 */        sw $s4, 0x28($sp)
  /* 1391C0 8013AF40 AFB00018 */        sw $s0, 0x18($sp)
  /* 1391C4 8013AF44 3C118014 */       lui $s1, %hi(gMNBattlePanels)
  /* 1391C8 8013AF48 AFBF002C */        sw $ra, 0x2c($sp)
  /* 1391CC 8013AF4C 2631BA88 */     addiu $s1, $s1, %lo(gMNBattlePanels)
  /* 1391D0 8013AF50 00008025 */        or $s0, $zero, $zero
  /* 1391D4 8013AF54 24140004 */     addiu $s4, $zero, 4
  /* 1391D8 8013AF58 AE6A0000 */        sw $t2, ($s3) # D_ovl26_8013BDC8 + 0
  .L8013AF5C:
  /* 1391DC 8013AF5C 8E6B0000 */        lw $t3, ($s3) # D_ovl26_8013BDC8 + 0
  /* 1391E0 8013AF60 11600005 */      beqz $t3, .L8013AF78
  /* 1391E4 8013AF64 00000000 */       nop
  /* 1391E8 8013AF68 0C04EB78 */       jal mnBattleResetPort
  /* 1391EC 8013AF6C 02002025 */        or $a0, $s0, $zero
  /* 1391F0 8013AF70 10000003 */         b .L8013AF80
  /* 1391F4 8013AF74 A2400010 */        sb $zero, 0x10($s2) # gTransferBattleState + 16
  .L8013AF78:
  /* 1391F8 8013AF78 0C04EB1F */       jal mnBattleInitPort
  /* 1391FC 8013AF7C 02002025 */        or $a0, $s0, $zero
  .L8013AF80:
  /* 139200 8013AF80 26100001 */     addiu $s0, $s0, 1
  /* 139204 8013AF84 263100BC */     addiu $s1, $s1, 0xbc
  /* 139208 8013AF88 1614FFF4 */       bne $s0, $s4, .L8013AF5C
  /* 13920C 8013AF8C AE20FFA4 */        sw $zero, -0x5c($s1) # gMNBattlePanels + -92
  /* 139210 8013AF90 8FBF002C */        lw $ra, 0x2c($sp)
  /* 139214 8013AF94 3C0C800A */       lui $t4, %hi((gSaveData + 0x458))
  /* 139218 8013AF98 958C4938 */       lhu $t4, %lo((gSaveData + 0x458))($t4)
  /* 13921C 8013AF9C 3C018014 */       lui $at, %hi(gMNBattleCharacterUnlockedMask)
  /* 139220 8013AFA0 8FB00018 */        lw $s0, 0x18($sp)
  /* 139224 8013AFA4 8FB1001C */        lw $s1, 0x1c($sp)
  /* 139228 8013AFA8 8FB20020 */        lw $s2, 0x20($sp)
  /* 13922C 8013AFAC 8FB30024 */        lw $s3, 0x24($sp)
  /* 139230 8013AFB0 8FB40028 */        lw $s4, 0x28($sp)
  /* 139234 8013AFB4 27BD0030 */     addiu $sp, $sp, 0x30
  /* 139238 8013AFB8 03E00008 */        jr $ra
  /* 13923C 8013AFBC A42CBDBC */        sh $t4, %lo(gMNBattleCharacterUnlockedMask)($at)

glabel mnBattleInitPanel
  /* 139240 8013AFC0 00047080 */       sll $t6, $a0, 2
  /* 139244 8013AFC4 3C0F8014 */       lui $t7, %hi(gMNBattleControllerOrderArray)
  /* 139248 8013AFC8 01EE7821 */      addu $t7, $t7, $t6
  /* 13924C 8013AFCC 8DEFBD90 */        lw $t7, %lo(gMNBattleControllerOrderArray)($t7)
  /* 139250 8013AFD0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 139254 8013AFD4 AFB00018 */        sw $s0, 0x18($sp)
  /* 139258 8013AFD8 2401FFFF */     addiu $at, $zero, -1
  /* 13925C 8013AFDC 00808025 */        or $s0, $a0, $zero
  /* 139260 8013AFE0 11E1000C */       beq $t7, $at, .L8013B014
  /* 139264 8013AFE4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 139268 8013AFE8 0C04E37B */       jal mnBattleCreateCursor
  /* 13926C 8013AFEC 00000000 */       nop
  /* 139270 8013AFF0 0010C080 */       sll $t8, $s0, 2
  /* 139274 8013AFF4 0310C023 */      subu $t8, $t8, $s0
  /* 139278 8013AFF8 0018C100 */       sll $t8, $t8, 4
  /* 13927C 8013AFFC 0310C023 */      subu $t8, $t8, $s0
  /* 139280 8013B000 3C198014 */       lui $t9, %hi(gMNBattlePanels)
  /* 139284 8013B004 2739BA88 */     addiu $t9, $t9, %lo(gMNBattlePanels)
  /* 139288 8013B008 0018C080 */       sll $t8, $t8, 2
  /* 13928C 8013B00C 1000000A */         b .L8013B038
  /* 139290 8013B010 03191021 */      addu $v0, $t8, $t9
  .L8013B014:
  /* 139294 8013B014 00104080 */       sll $t0, $s0, 2
  /* 139298 8013B018 01104023 */      subu $t0, $t0, $s0
  /* 13929C 8013B01C 00084100 */       sll $t0, $t0, 4
  /* 1392A0 8013B020 01104023 */      subu $t0, $t0, $s0
  /* 1392A4 8013B024 3C098014 */       lui $t1, %hi(gMNBattlePanels)
  /* 1392A8 8013B028 2529BA88 */     addiu $t1, $t1, %lo(gMNBattlePanels)
  /* 1392AC 8013B02C 00084080 */       sll $t0, $t0, 2
  /* 1392B0 8013B030 01091021 */      addu $v0, $t0, $t1
  /* 1392B4 8013B034 AC400000 */        sw $zero, ($v0)
  .L8013B038:
  /* 1392B8 8013B038 02002025 */        or $a0, $s0, $zero
  /* 1392BC 8013B03C 0C04E426 */       jal mnBattleCreateToken
  /* 1392C0 8013B040 AFA20020 */        sw $v0, 0x20($sp)
  /* 1392C4 8013B044 0C04CD97 */       jal mnBattleCreatePanel
  /* 1392C8 8013B048 02002025 */        or $a0, $s0, $zero
  /* 1392CC 8013B04C 8FA20020 */        lw $v0, 0x20($sp)
  /* 1392D0 8013B050 8C4A0058 */        lw $t2, 0x58($v0)
  /* 1392D4 8013B054 5140000A */      beql $t2, $zero, .L8013B080
  /* 1392D8 8013B058 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1392DC 8013B05C 8C460048 */        lw $a2, 0x48($v0)
  /* 1392E0 8013B060 2401001C */     addiu $at, $zero, 0x1c
  /* 1392E4 8013B064 02002825 */        or $a1, $s0, $zero
  /* 1392E8 8013B068 50C10005 */      beql $a2, $at, .L8013B080
  /* 1392EC 8013B06C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1392F0 8013B070 8C440008 */        lw $a0, 8($v0)
  /* 1392F4 8013B074 0C04D2A3 */       jal mnBattleSpawnFighter
  /* 1392F8 8013B078 8C47004C */        lw $a3, 0x4c($v0)
  /* 1392FC 8013B07C 8FBF001C */        lw $ra, 0x1c($sp)
  .L8013B080:
  /* 139300 8013B080 8FB00018 */        lw $s0, 0x18($sp)
  /* 139304 8013B084 27BD0028 */     addiu $sp, $sp, 0x28
  /* 139308 8013B088 03E00008 */        jr $ra
  /* 13930C 8013B08C 00000000 */       nop

glabel mnBattleInitPanels
  /* 139310 8013B090 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 139314 8013B094 AFBF0014 */        sw $ra, 0x14($sp)
  /* 139318 8013B098 0C04EBF0 */       jal mnBattleInitPanel
  /* 13931C 8013B09C 00002025 */        or $a0, $zero, $zero
  /* 139320 8013B0A0 0C04EBF0 */       jal mnBattleInitPanel
  /* 139324 8013B0A4 24040001 */     addiu $a0, $zero, 1
  /* 139328 8013B0A8 0C04EBF0 */       jal mnBattleInitPanel
  /* 13932C 8013B0AC 24040002 */     addiu $a0, $zero, 2
  /* 139330 8013B0B0 0C04EBF0 */       jal mnBattleInitPanel
  /* 139334 8013B0B4 24040003 */     addiu $a0, $zero, 3
  /* 139338 8013B0B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13933C 8013B0BC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 139340 8013B0C0 03E00008 */        jr $ra
  /* 139344 8013B0C4 00000000 */       nop

glabel mnBattleInitCSS
  /* 139348 8013B0C8 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 13934C 8013B0CC 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 139350 8013B0D0 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 139354 8013B0D4 3C188014 */       lui $t8, %hi(D_ovl26_8013C0E0)
  /* 139358 8013B0D8 3C088014 */       lui $t0, %hi(D_ovl26_8013C0A8)
  /* 13935C 8013B0DC AFBF0024 */        sw $ra, 0x24($sp)
  /* 139360 8013B0E0 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 139364 8013B0E4 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 139368 8013B0E8 2718C0E0 */     addiu $t8, $t8, %lo(D_ovl26_8013C0E0)
  /* 13936C 8013B0EC 24190078 */     addiu $t9, $zero, 0x78
  /* 139370 8013B0F0 2508C0A8 */     addiu $t0, $t0, %lo(D_ovl26_8013C0A8)
  /* 139374 8013B0F4 24090007 */     addiu $t1, $zero, 7
  /* 139378 8013B0F8 AFB00020 */        sw $s0, 0x20($sp)
  /* 13937C 8013B0FC AFAE0040 */        sw $t6, 0x40($sp)
  /* 139380 8013B100 AFAF0044 */        sw $t7, 0x44($sp)
  /* 139384 8013B104 AFA00048 */        sw $zero, 0x48($sp)
  /* 139388 8013B108 AFA0004C */        sw $zero, 0x4c($sp)
  /* 13938C 8013B10C AFB80050 */        sw $t8, 0x50($sp)
  /* 139390 8013B110 AFB90054 */        sw $t9, 0x54($sp)
  /* 139394 8013B114 AFA80058 */        sw $t0, 0x58($sp)
  /* 139398 8013B118 AFA9005C */        sw $t1, 0x5c($sp)
  /* 13939C 8013B11C 0C0337DE */       jal rdManagerInitSetup
  /* 1393A0 8013B120 27A40040 */     addiu $a0, $sp, 0x40
  /* 1393A4 8013B124 3C108014 */       lui $s0, %hi(D_ovl26_8013B3A0)
  /* 1393A8 8013B128 2610B3A0 */     addiu $s0, $s0, %lo(D_ovl26_8013B3A0)
  /* 1393AC 8013B12C 02002025 */        or $a0, $s0, $zero
  /* 1393B0 8013B130 0C0337BB */       jal rdManagerGetAllocSize
  /* 1393B4 8013B134 24050007 */     addiu $a1, $zero, 7
  /* 1393B8 8013B138 00402025 */        or $a0, $v0, $zero
  /* 1393BC 8013B13C 0C001260 */       jal gsMemoryAlloc
  /* 1393C0 8013B140 24050010 */     addiu $a1, $zero, 0x10
  /* 1393C4 8013B144 3C068014 */       lui $a2, %hi(D_ovl26_8013C4A0)
  /* 1393C8 8013B148 24C6C4A0 */     addiu $a2, $a2, %lo(D_ovl26_8013C4A0)
  /* 1393CC 8013B14C 02002025 */        or $a0, $s0, $zero
  /* 1393D0 8013B150 24050007 */     addiu $a1, $zero, 7
  /* 1393D4 8013B154 0C033781 */       jal rdManagerLoadFiles
  /* 1393D8 8013B158 00403825 */        or $a3, $v0, $zero
  /* 1393DC 8013B15C 3C108000 */       lui $s0, %hi(D_NF_80000001)
  /* 1393E0 8013B160 3C058014 */       lui $a1, %hi(mnBattleMain)
  /* 1393E4 8013B164 24A5A920 */     addiu $a1, $a1, %lo(mnBattleMain)
  /* 1393E8 8013B168 02003825 */        or $a3, $s0, $zero
  /* 1393EC 8013B16C 24040400 */     addiu $a0, $zero, 0x400
  /* 1393F0 8013B170 0C00265A */       jal omMakeGObjSPAfter
  /* 1393F4 8013B174 2406000F */     addiu $a2, $zero, 0xf
  /* 1393F8 8013B178 24040010 */     addiu $a0, $zero, 0x10
  /* 1393FC 8013B17C 02002825 */        or $a1, $s0, $zero
  /* 139400 8013B180 24060064 */     addiu $a2, $zero, 0x64
  /* 139404 8013B184 24070001 */     addiu $a3, $zero, 1
  /* 139408 8013B188 0C002E7F */       jal func_8000B9FC
  /* 13940C 8013B18C AFA00010 */        sw $zero, 0x10($sp)
  /* 139410 8013B190 0C045624 */       jal func_ovl2_80115890
  /* 139414 8013B194 00000000 */       nop
  /* 139418 8013B198 0C03F4C0 */       jal efManager_AllocUserData
  /* 13941C 8013B19C 00000000 */       nop
  /* 139420 8013B1A0 0C04E8A9 */       jal func_ovl26_8013A2A4
  /* 139424 8013B1A4 00000000 */       nop
  /* 139428 8013B1A8 0C04EBB2 */       jal mnBattleLoadMatchInfo
  /* 13942C 8013B1AC 00000000 */       nop
  /* 139430 8013B1B0 24040001 */     addiu $a0, $zero, 1
  /* 139434 8013B1B4 0C035C65 */       jal ftManagerAllocFighter
  /* 139438 8013B1B8 24050004 */     addiu $a1, $zero, 4
  /* 13943C 8013B1BC 00008025 */        or $s0, $zero, $zero
  .L8013B1C0:
  /* 139440 8013B1C0 0C035E1B */       jal ftManagerSetupDataKind
  /* 139444 8013B1C4 02002025 */        or $a0, $s0, $zero
  /* 139448 8013B1C8 26100001 */     addiu $s0, $s0, %lo(D_NF_80000001)
  /* 13944C 8013B1CC 2A01000C */      slti $at, $s0, 0xc
  /* 139450 8013B1D0 1420FFFB */      bnez $at, .L8013B1C0
  /* 139454 8013B1D4 00000000 */       nop
  /* 139458 8013B1D8 3C038014 */       lui $v1, %hi(gMNBattlePanels)
  /* 13945C 8013B1DC 3C108013 */       lui $s0, %hi(gFTAnimHeapSize)
  /* 139460 8013B1E0 26100D9C */     addiu $s0, $s0, %lo(gFTAnimHeapSize)
  /* 139464 8013B1E4 2463BA88 */     addiu $v1, $v1, %lo(gMNBattlePanels)
  .L8013B1E8:
  /* 139468 8013B1E8 8E040000 */        lw $a0, ($s0) # gFTAnimHeapSize + 0
  /* 13946C 8013B1EC 24050010 */     addiu $a1, $zero, 0x10
  /* 139470 8013B1F0 0C001260 */       jal gsMemoryAlloc
  /* 139474 8013B1F4 AFA30028 */        sw $v1, 0x28($sp)
  /* 139478 8013B1F8 8FA30028 */        lw $v1, 0x28($sp)
  /* 13947C 8013B1FC 3C0A8014 */       lui $t2, %hi(gMNBattlePickerGObj)
  /* 139480 8013B200 254ABD78 */     addiu $t2, $t2, %lo(gMNBattlePickerGObj)
  /* 139484 8013B204 246300BC */     addiu $v1, $v1, 0xbc
  /* 139488 8013B208 146AFFF7 */       bne $v1, $t2, .L8013B1E8
  /* 13948C 8013B20C AC62FF78 */        sw $v0, -0x88($v1)
  /* 139490 8013B210 0C04CB47 */       jal mnBattleCreatePortraitViewport
  /* 139494 8013B214 00000000 */       nop
  /* 139498 8013B218 0C04E2DB */       jal mnBattleCreateCursorViewport
  /* 13949C 8013B21C 00000000 */       nop
  /* 1394A0 8013B220 0C04E303 */       jal mnBattleCreateDroppedTokenViewport
  /* 1394A4 8013B224 00000000 */       nop
  /* 1394A8 8013B228 0C04CC0F */       jal mnBattleCreatePanelViewport
  /* 1394AC 8013B22C 00000000 */       nop
  /* 1394B0 8013B230 0C04CBBF */       jal mnBattleCreatePanelDoorsViewport
  /* 1394B4 8013B234 00000000 */       nop
  /* 1394B8 8013B238 0C04CBE7 */       jal mnBattleCreateTypeButtonViewport
  /* 1394BC 8013B23C 00000000 */       nop
  /* 1394C0 8013B240 0C04D319 */       jal mnBattleCreateFighterViewport
  /* 1394C4 8013B244 00000000 */       nop
  /* 1394C8 8013B248 0C04CC37 */       jal mnBattleCreateTeamButtonViewPort
  /* 1394CC 8013B24C 00000000 */       nop
  /* 1394D0 8013B250 0C04E32B */       jal mnBattleCreateHandicapCPULevelViewport
  /* 1394D4 8013B254 00000000 */       nop
  /* 1394D8 8013B258 0C04CB6F */       jal mnBattleCreatePortraitBackgroundViewport
  /* 1394DC 8013B25C 00000000 */       nop
  /* 1394E0 8013B260 0C04CB97 */       jal mnBattleCreatePortraitWhiteBackgroundViewport
  /* 1394E4 8013B264 00000000 */       nop
  /* 1394E8 8013B268 0C04E353 */       jal mnBattleCreateReadyToFightViewport
  /* 1394EC 8013B26C 00000000 */       nop
  /* 1394F0 8013B270 0C04D0A1 */       jal mnBattleCreateBackground
  /* 1394F4 8013B274 00000000 */       nop
  /* 1394F8 8013B278 0C04C9B7 */       jal mnBattleCreatePortraits
  /* 1394FC 8013B27C 00000000 */       nop
  /* 139500 8013B280 0C04EC24 */       jal mnBattleInitPanels
  /* 139504 8013B284 00000000 */       nop
  /* 139508 8013B288 0C04D0EC */       jal mnBattleDrawTitleAndBack
  /* 13950C 8013B28C 00000000 */       nop
  /* 139510 8013B290 0C04E64B */       jal mnBattleCreateTokenAutopositionRoutine
  /* 139514 8013B294 00000000 */       nop
  /* 139518 8013B298 0C04E67A */       jal mnBattleCreateTokenShinePulseRoutine
  /* 13951C 8013B29C 00000000 */       nop
  /* 139520 8013B2A0 0C04E6D3 */       jal mnBattleCreateSyncShadeAndCostumeRoutine
  /* 139524 8013B2A4 00000000 */       nop
  /* 139528 8013B2A8 0C04E721 */       jal mnBattleCreateWhiteCircles
  /* 13952C 8013B2AC 00000000 */       nop
  /* 139530 8013B2B0 0C04E798 */       jal mnBattleCreateReadyToFightObjects
  /* 139534 8013B2B4 00000000 */       nop
  /* 139538 8013B2B8 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 13953C 8013B2BC 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 139540 8013B2C0 240B00FF */     addiu $t3, $zero, 0xff
  /* 139544 8013B2C4 240C00FF */     addiu $t4, $zero, 0xff
  /* 139548 8013B2C8 AFAC0014 */        sw $t4, 0x14($sp)
  /* 13954C 8013B2CC AFAB0010 */        sw $t3, 0x10($sp)
  /* 139550 8013B2D0 240600FF */     addiu $a2, $zero, 0xff
  /* 139554 8013B2D4 240700FF */     addiu $a3, $zero, 0xff
  /* 139558 8013B2D8 0C0E4138 */       jal func_ovl1_803904E0
  /* 13955C 8013B2DC 46006386 */     mov.s $f14, $f12
  /* 139560 8013B2E0 3C0D800A */       lui $t5, %hi((gSceneData + 0x1))
  /* 139564 8013B2E4 91AD4AD1 */       lbu $t5, %lo((gSceneData + 0x1))($t5)
  /* 139568 8013B2E8 24010015 */     addiu $at, $zero, 0x15
  /* 13956C 8013B2EC 00002025 */        or $a0, $zero, $zero
  /* 139570 8013B2F0 11A10003 */       beq $t5, $at, .L8013B300
  /* 139574 8013B2F4 00000000 */       nop
  /* 139578 8013B2F8 0C0082AD */       jal func_80020AB4
  /* 13957C 8013B2FC 2405000A */     addiu $a1, $zero, 0xa
  .L8013B300:
  /* 139580 8013B300 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x2))
  /* 139584 8013B304 91CE4D0A */       lbu $t6, %lo((gTransferBattleState + 0x2))($t6)
  /* 139588 8013B308 15C00005 */      bnez $t6, .L8013B320
  /* 13958C 8013B30C 00000000 */       nop
  /* 139590 8013B310 0C009A70 */       jal func_800269C0
  /* 139594 8013B314 24040200 */     addiu $a0, $zero, 0x200
  /* 139598 8013B318 10000004 */         b .L8013B32C
  /* 13959C 8013B31C 8FBF0024 */        lw $ra, 0x24($sp)
  .L8013B320:
  /* 1395A0 8013B320 0C009A70 */       jal func_800269C0
  /* 1395A4 8013B324 2404020E */     addiu $a0, $zero, 0x20e
  /* 1395A8 8013B328 8FBF0024 */        lw $ra, 0x24($sp)
  .L8013B32C:
  /* 1395AC 8013B32C 8FB00020 */        lw $s0, 0x20($sp)
  /* 1395B0 8013B330 27BD0068 */     addiu $sp, $sp, 0x68
  /* 1395B4 8013B334 03E00008 */        jr $ra
  /* 1395B8 8013B338 00000000 */       nop

glabel vs_css_entry
  /* 1395BC 8013B33C 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 1395C0 8013B340 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1395C4 8013B344 3C048014 */       lui $a0, %hi(D_ovl26_8013B980)
  /* 1395C8 8013B348 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 1395CC 8013B34C 2484B980 */     addiu $a0, $a0, %lo(D_ovl26_8013B980)
  /* 1395D0 8013B350 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1395D4 8013B354 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 1395D8 8013B358 0C001C09 */       jal func_80007024
  /* 1395DC 8013B35C AC8F000C */        sw $t7, 0xc($a0) # D_ovl26_8013B980 + 12
  /* 1395E0 8013B360 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 1395E4 8013B364 3C198014 */       lui $t9, %hi(D_NF_8013C4C0)
  /* 1395E8 8013B368 3C048014 */       lui $a0, %hi(D_ovl26_8013B99C)
  /* 1395EC 8013B36C 2739C4C0 */     addiu $t9, $t9, %lo(D_NF_8013C4C0)
  /* 1395F0 8013B370 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 1395F4 8013B374 2484B99C */     addiu $a0, $a0, %lo(D_ovl26_8013B99C)
  /* 1395F8 8013B378 03194023 */      subu $t0, $t8, $t9
  /* 1395FC 8013B37C 0C0289A6 */       jal func_800A2698
  /* 139600 8013B380 AC880010 */        sw $t0, 0x10($a0) # D_ovl26_8013B99C + 16
  /* 139604 8013B384 8FBF0014 */        lw $ra, 0x14($sp)
  /* 139608 8013B388 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13960C 8013B38C 03E00008 */        jr $ra
  /* 139610 8013B390 00000000 */       nop

  /* 139614 8013B394 00000000 */       nop
  /* 139618 8013B398 00000000 */       nop
  /* 13961C 8013B39C 00000000 */       nop

# Likely start of new file
#glabel D_ovl26_8013B3A0   # Routine parsed as data
#  /* 139620 8013B3A0 00000011 */      mthi $zero
#  /* 139624 8013B3A4 00000000 */       nop
#  /* 139628 8013B3A8 00000014 */     dsllv $zero, $zero, $zero
#  /* 13962C 8013B3AC 00000015 */      dlsa $zero, $zero, $zero, 1
#  /* 139630 8013B3B0 00000012 */      mflo $zero
#  /* 139634 8013B3B4 00000013 */      mtlo $zero
#  /* 139638 8013B3B8 00000016 */     dsrlv $zero, $zero, $zero
#  /* 13963C 8013B3BC 00000000 */       nop
#  /* 139640 8013B3C0 20202000 */      addi $zero, $at, 0x2000
#  /* 139644 8013B3C4 20202000 */      addi $zero, $at, 0x2000
#  /* 139648 8013B3C8 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 13964C 8013B3CC FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 139650 8013B3D0 14141400 */       bne $zero, $s4, 0x801403d4 # branch target not found
#  /* 139654 8013B3D4 00000000 */       nop
#  /* 139658 8013B3D8 20202000 */      addi $zero, $at, 0x2000
#  /* 13965C 8013B3DC 20202000 */      addi $zero, $at, 0x2000
#  /* 139660 8013B3E0 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 139664 8013B3E4 FFFFFF00 */        sd $ra, -0x100($ra)
