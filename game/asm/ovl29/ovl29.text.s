.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x80136F50

glabel mnBonusSetupDisplayList
  /* 147B30 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 147B34 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 147B38 80131B08 8C830000 */        lw $v1, ($a0)
  /* 147B3C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 147B40 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 147B44 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 147B48 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 147B4C 80131B1C 3C180002 */       lui $t8, 2
  /* 147B50 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 147B54 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 147B58 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 147B5C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 147B60 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 147B64 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 147B68 80131B38 44060000 */      mfc1 $a2, $f0
  /* 147B6C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 147B70 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 147B74 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 147B78 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 147B7C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 147B80 80131B50 03E00008 */        jr $ra
  /* 147B84 80131B54 00000000 */       nop

glabel mnBonusPow
  /* 147B88 80131B58 14A00003 */      bnez $a1, .L80131B68
  /* 147B8C 80131B5C 00801825 */        or $v1, $a0, $zero
  /* 147B90 80131B60 03E00008 */        jr $ra
  /* 147B94 80131B64 24020001 */     addiu $v0, $zero, 1

  .L80131B68:
  /* 147B98 80131B68 28A10002 */      slti $at, $a1, 2
  /* 147B9C 80131B6C 1420001F */      bnez $at, .L80131BEC
  /* 147BA0 80131B70 00A01025 */        or $v0, $a1, $zero
  /* 147BA4 80131B74 24A7FFFF */     addiu $a3, $a1, -1
  /* 147BA8 80131B78 30E70003 */      andi $a3, $a3, 3
  /* 147BAC 80131B7C 00073823 */      negu $a3, $a3
  /* 147BB0 80131B80 10E00008 */      beqz $a3, .L80131BA4
  /* 147BB4 80131B84 00E53021 */      addu $a2, $a3, $a1
  .L80131B88:
  /* 147BB8 80131B88 00640019 */     multu $v1, $a0
  /* 147BBC 80131B8C 2442FFFF */     addiu $v0, $v0, -1
  /* 147BC0 80131B90 00001812 */      mflo $v1
  /* 147BC4 80131B94 14C2FFFC */       bne $a2, $v0, .L80131B88
  /* 147BC8 80131B98 00000000 */       nop
  /* 147BCC 80131B9C 24050001 */     addiu $a1, $zero, 1
  /* 147BD0 80131BA0 10450012 */       beq $v0, $a1, .L80131BEC
  .L80131BA4:
  /* 147BD4 80131BA4 24050001 */     addiu $a1, $zero, 1
  .L80131BA8:
  /* 147BD8 80131BA8 00640019 */     multu $v1, $a0
  /* 147BDC 80131BAC 2442FFFC */     addiu $v0, $v0, -4
  /* 147BE0 80131BB0 00001812 */      mflo $v1
  /* 147BE4 80131BB4 00000000 */       nop
  /* 147BE8 80131BB8 00000000 */       nop
  /* 147BEC 80131BBC 00640019 */     multu $v1, $a0
  /* 147BF0 80131BC0 00001812 */      mflo $v1
  /* 147BF4 80131BC4 00000000 */       nop
  /* 147BF8 80131BC8 00000000 */       nop
  /* 147BFC 80131BCC 00640019 */     multu $v1, $a0
  /* 147C00 80131BD0 00001812 */      mflo $v1
  /* 147C04 80131BD4 00000000 */       nop
  /* 147C08 80131BD8 00000000 */       nop
  /* 147C0C 80131BDC 00640019 */     multu $v1, $a0
  /* 147C10 80131BE0 00001812 */      mflo $v1
  /* 147C14 80131BE4 1445FFF0 */       bne $v0, $a1, .L80131BA8
  /* 147C18 80131BE8 00000000 */       nop
  .L80131BEC:
  /* 147C1C 80131BEC 00601025 */        or $v0, $v1, $zero
  /* 147C20 80131BF0 03E00008 */        jr $ra
  /* 147C24 80131BF4 00000000 */       nop

glabel mnBonusSetTextureColors
  /* 147C28 80131BF8 948E0024 */       lhu $t6, 0x24($a0)
  /* 147C2C 80131BFC 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 147C30 80131C00 A4980024 */        sh $t8, 0x24($a0)
  /* 147C34 80131C04 37190001 */       ori $t9, $t8, 1
  /* 147C38 80131C08 A4990024 */        sh $t9, 0x24($a0)
  /* 147C3C 80131C0C 8CA80000 */        lw $t0, ($a1)
  /* 147C40 80131C10 A0880060 */        sb $t0, 0x60($a0)
  /* 147C44 80131C14 8CA90004 */        lw $t1, 4($a1)
  /* 147C48 80131C18 A0890061 */        sb $t1, 0x61($a0)
  /* 147C4C 80131C1C 8CAA0008 */        lw $t2, 8($a1)
  /* 147C50 80131C20 A08A0062 */        sb $t2, 0x62($a0)
  /* 147C54 80131C24 8CAB000C */        lw $t3, 0xc($a1)
  /* 147C58 80131C28 A08B0028 */        sb $t3, 0x28($a0)
  /* 147C5C 80131C2C 8CAC0010 */        lw $t4, 0x10($a1)
  /* 147C60 80131C30 A08C0029 */        sb $t4, 0x29($a0)
  /* 147C64 80131C34 8CAD0014 */        lw $t5, 0x14($a1)
  /* 147C68 80131C38 03E00008 */        jr $ra
  /* 147C6C 80131C3C A08D002A */        sb $t5, 0x2a($a0)

glabel mnBonusGetNumberOfDigits
  /* 147C70 80131C40 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 147C74 80131C44 AFB20020 */        sw $s2, 0x20($sp)
  /* 147C78 80131C48 AFB1001C */        sw $s1, 0x1c($sp)
  /* 147C7C 80131C4C 00809025 */        or $s2, $a0, $zero
  /* 147C80 80131C50 AFBF0024 */        sw $ra, 0x24($sp)
  /* 147C84 80131C54 AFB00018 */        sw $s0, 0x18($sp)
  /* 147C88 80131C58 18A0001D */      blez $a1, .L80131CD0
  /* 147C8C 80131C5C 00A08825 */        or $s1, $a1, $zero
  .L80131C60:
  /* 147C90 80131C60 2630FFFF */     addiu $s0, $s1, -1
  /* 147C94 80131C64 02002825 */        or $a1, $s0, $zero
  /* 147C98 80131C68 0C04C6D6 */       jal mnBonusPow
  /* 147C9C 80131C6C 2404000A */     addiu $a0, $zero, 0xa
  /* 147CA0 80131C70 10400011 */      beqz $v0, .L80131CB8
  /* 147CA4 80131C74 00001825 */        or $v1, $zero, $zero
  /* 147CA8 80131C78 2404000A */     addiu $a0, $zero, 0xa
  /* 147CAC 80131C7C 0C04C6D6 */       jal mnBonusPow
  /* 147CB0 80131C80 02002825 */        or $a1, $s0, $zero
  /* 147CB4 80131C84 0242001A */       div $zero, $s2, $v0
  /* 147CB8 80131C88 00001812 */      mflo $v1
  /* 147CBC 80131C8C 14400002 */      bnez $v0, .L80131C98
  /* 147CC0 80131C90 00000000 */       nop
  /* 147CC4 80131C94 0007000D */     break 7
  .L80131C98:
  /* 147CC8 80131C98 2401FFFF */     addiu $at, $zero, -1
  /* 147CCC 80131C9C 14410004 */       bne $v0, $at, .L80131CB0
  /* 147CD0 80131CA0 3C018000 */       lui $at, 0x8000
  /* 147CD4 80131CA4 16410002 */       bne $s2, $at, .L80131CB0
  /* 147CD8 80131CA8 00000000 */       nop
  /* 147CDC 80131CAC 0006000D */     break 6
  .L80131CB0:
  /* 147CE0 80131CB0 10000001 */         b .L80131CB8
  /* 147CE4 80131CB4 00000000 */       nop
  .L80131CB8:
  /* 147CE8 80131CB8 10600003 */      beqz $v1, .L80131CC8
  /* 147CEC 80131CBC 00000000 */       nop
  /* 147CF0 80131CC0 10000004 */         b .L80131CD4
  /* 147CF4 80131CC4 02201025 */        or $v0, $s1, $zero
  .L80131CC8:
  /* 147CF8 80131CC8 1600FFE5 */      bnez $s0, .L80131C60
  /* 147CFC 80131CCC 02008825 */        or $s1, $s0, $zero
  .L80131CD0:
  /* 147D00 80131CD0 00001025 */        or $v0, $zero, $zero
  .L80131CD4:
  /* 147D04 80131CD4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 147D08 80131CD8 8FB00018 */        lw $s0, 0x18($sp)
  /* 147D0C 80131CDC 8FB1001C */        lw $s1, 0x1c($sp)
  /* 147D10 80131CE0 8FB20020 */        lw $s2, 0x20($sp)
  /* 147D14 80131CE4 03E00008 */        jr $ra
  /* 147D18 80131CE8 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusCreateSmallerNumber
  /* 147D1C 80131CEC 27BDFF68 */     addiu $sp, $sp, -0x98
  /* 147D20 80131CF0 F7B80028 */      sdc1 $f24, 0x28($sp)
  /* 147D24 80131CF4 3C0E8013 */       lui $t6, %hi(dMNBonusSmallerNumberOffsets)
  /* 147D28 80131CF8 AFBE0050 */        sw $fp, 0x50($sp)
  /* 147D2C 80131CFC AFB3003C */        sw $s3, 0x3c($sp)
  /* 147D30 80131D00 27A20070 */     addiu $v0, $sp, 0x70
  /* 147D34 80131D04 25CE6FB0 */     addiu $t6, $t6, %lo(dMNBonusSmallerNumberOffsets)
  /* 147D38 80131D08 4487C000 */      mtc1 $a3, $f24
  /* 147D3C 80131D0C 00A09825 */        or $s3, $a1, $zero
  /* 147D40 80131D10 0080F025 */        or $fp, $a0, $zero
  /* 147D44 80131D14 AFBF0054 */        sw $ra, 0x54($sp)
  /* 147D48 80131D18 AFB7004C */        sw $s7, 0x4c($sp)
  /* 147D4C 80131D1C AFB60048 */        sw $s6, 0x48($sp)
  /* 147D50 80131D20 AFB50044 */        sw $s5, 0x44($sp)
  /* 147D54 80131D24 AFB40040 */        sw $s4, 0x40($sp)
  /* 147D58 80131D28 AFB20038 */        sw $s2, 0x38($sp)
  /* 147D5C 80131D2C AFB10034 */        sw $s1, 0x34($sp)
  /* 147D60 80131D30 AFB00030 */        sw $s0, 0x30($sp)
  /* 147D64 80131D34 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 147D68 80131D38 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 147D6C 80131D3C AFA600A0 */        sw $a2, 0xa0($sp)
  /* 147D70 80131D40 25C80024 */     addiu $t0, $t6, 0x24
  /* 147D74 80131D44 0040C825 */        or $t9, $v0, $zero
  .L80131D48:
  /* 147D78 80131D48 8DD80000 */        lw $t8, ($t6) # dMNBonusSmallerNumberOffsets + 0
  /* 147D7C 80131D4C 25CE000C */     addiu $t6, $t6, 0xc
  /* 147D80 80131D50 2739000C */     addiu $t9, $t9, 0xc
  /* 147D84 80131D54 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 147D88 80131D58 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusSmallerNumberOffsets + -8
  /* 147D8C 80131D5C AF2FFFF8 */        sw $t7, -8($t9)
  /* 147D90 80131D60 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusSmallerNumberOffsets + -4
  /* 147D94 80131D64 15C8FFF8 */       bne $t6, $t0, .L80131D48
  /* 147D98 80131D68 AF38FFFC */        sw $t8, -4($t9)
  /* 147D9C 80131D6C 8DD80000 */        lw $t8, ($t6) # dMNBonusSmallerNumberOffsets + 0
  /* 147DA0 80131D70 2416000A */     addiu $s6, $zero, 0xa
  /* 147DA4 80131D74 3C178013 */       lui $s7, %hi(D_ovl29_80137DF8)
  /* 147DA8 80131D78 AF380000 */        sw $t8, ($t9)
  /* 147DAC 80131D7C 06610002 */      bgez $s3, .L80131D88
  /* 147DB0 80131D80 C7B400A0 */      lwc1 $f20, 0xa0($sp)
  /* 147DB4 80131D84 00009825 */        or $s3, $zero, $zero
  .L80131D88:
  /* 147DB8 80131D88 0276001A */       div $zero, $s3, $s6
  /* 147DBC 80131D8C 00004810 */      mfhi $t1
  /* 147DC0 80131D90 00095080 */       sll $t2, $t1, 2
  /* 147DC4 80131D94 26F77DF8 */     addiu $s7, $s7, %lo(D_ovl29_80137DF8)
  /* 147DC8 80131D98 004A5821 */      addu $t3, $v0, $t2
  /* 147DCC 80131D9C 8D6C0000 */        lw $t4, ($t3)
  /* 147DD0 80131DA0 8EED0024 */        lw $t5, 0x24($s7) # D_ovl29_80137DF8 + 36
  /* 147DD4 80131DA4 03C02025 */        or $a0, $fp, $zero
  /* 147DD8 80131DA8 16C00002 */      bnez $s6, .L80131DB4
  /* 147DDC 80131DAC 00000000 */       nop
  /* 147DE0 80131DB0 0007000D */     break 7
  .L80131DB4:
  /* 147DE4 80131DB4 2401FFFF */     addiu $at, $zero, -1
  /* 147DE8 80131DB8 16C10004 */       bne $s6, $at, .L80131DCC
  /* 147DEC 80131DBC 3C018000 */       lui $at, 0x8000
  /* 147DF0 80131DC0 16610002 */       bne $s3, $at, .L80131DCC
  /* 147DF4 80131DC4 00000000 */       nop
  /* 147DF8 80131DC8 0006000D */     break 6
  .L80131DCC:
  /* 147DFC 80131DCC 018D2821 */      addu $a1, $t4, $t5
  /* 147E00 80131DD0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 147E04 80131DD4 00000000 */       nop
  /* 147E08 80131DD8 8FB400A8 */        lw $s4, 0xa8($sp)
  /* 147E0C 80131DDC 00408025 */        or $s0, $v0, $zero
  /* 147E10 80131DE0 00402025 */        or $a0, $v0, $zero
  /* 147E14 80131DE4 0C04C6FE */       jal mnBonusSetTextureColors
  /* 147E18 80131DE8 02802825 */        or $a1, $s4, $zero
  /* 147E1C 80131DEC 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 147E20 80131DF0 4481B000 */      mtc1 $at, $f22 # 8.0 to cop1
  /* 147E24 80131DF4 C7A400A0 */      lwc1 $f4, 0xa0($sp)
  /* 147E28 80131DF8 8FB500B0 */        lw $s5, 0xb0($sp)
  /* 147E2C 80131DFC E618005C */      swc1 $f24, 0x5c($s0)
  /* 147E30 80131E00 46162501 */     sub.s $f20, $f4, $f22
  /* 147E34 80131E04 24110001 */     addiu $s1, $zero, 1
  /* 147E38 80131E08 12A00004 */      beqz $s5, .L80131E1C
  /* 147E3C 80131E0C E6140058 */      swc1 $f20, 0x58($s0)
  /* 147E40 80131E10 8FB200AC */        lw $s2, 0xac($sp)
  /* 147E44 80131E14 10000006 */         b .L80131E30
  /* 147E48 80131E18 02401825 */        or $v1, $s2, $zero
  .L80131E1C:
  /* 147E4C 80131E1C 8FB200AC */        lw $s2, 0xac($sp)
  /* 147E50 80131E20 02602025 */        or $a0, $s3, $zero
  /* 147E54 80131E24 0C04C710 */       jal mnBonusGetNumberOfDigits
  /* 147E58 80131E28 02402825 */        or $a1, $s2, $zero
  /* 147E5C 80131E2C 00401825 */        or $v1, $v0, $zero
  .L80131E30:
  /* 147E60 80131E30 28610002 */      slti $at, $v1, 2
  /* 147E64 80131E34 1420003A */      bnez $at, .L80131F20
  /* 147E68 80131E38 02C02025 */        or $a0, $s6, $zero
  .L80131E3C:
  /* 147E6C 80131E3C 0C04C6D6 */       jal mnBonusPow
  /* 147E70 80131E40 02202825 */        or $a1, $s1, $zero
  /* 147E74 80131E44 10400011 */      beqz $v0, .L80131E8C
  /* 147E78 80131E48 00001825 */        or $v1, $zero, $zero
  /* 147E7C 80131E4C 02C02025 */        or $a0, $s6, $zero
  /* 147E80 80131E50 0C04C6D6 */       jal mnBonusPow
  /* 147E84 80131E54 02202825 */        or $a1, $s1, $zero
  /* 147E88 80131E58 0262001A */       div $zero, $s3, $v0
  /* 147E8C 80131E5C 00001812 */      mflo $v1
  /* 147E90 80131E60 14400002 */      bnez $v0, .L80131E6C
  /* 147E94 80131E64 00000000 */       nop
  /* 147E98 80131E68 0007000D */     break 7
  .L80131E6C:
  /* 147E9C 80131E6C 2401FFFF */     addiu $at, $zero, -1
  /* 147EA0 80131E70 14410004 */       bne $v0, $at, .L80131E84
  /* 147EA4 80131E74 3C018000 */       lui $at, 0x8000
  /* 147EA8 80131E78 16610002 */       bne $s3, $at, .L80131E84
  /* 147EAC 80131E7C 00000000 */       nop
  /* 147EB0 80131E80 0006000D */     break 6
  .L80131E84:
  /* 147EB4 80131E84 10000001 */         b .L80131E8C
  /* 147EB8 80131E88 00000000 */       nop
  .L80131E8C:
  /* 147EBC 80131E8C 0076001A */       div $zero, $v1, $s6
  /* 147EC0 80131E90 00004010 */      mfhi $t0
  /* 147EC4 80131E94 00087080 */       sll $t6, $t0, 2
  /* 147EC8 80131E98 03AEC821 */      addu $t9, $sp, $t6
  /* 147ECC 80131E9C 8F390070 */        lw $t9, 0x70($t9)
  /* 147ED0 80131EA0 8EEF0024 */        lw $t7, 0x24($s7) # D_ovl29_80137DF8 + 36
  /* 147ED4 80131EA4 03C02025 */        or $a0, $fp, $zero
  /* 147ED8 80131EA8 16C00002 */      bnez $s6, .L80131EB4
  /* 147EDC 80131EAC 00000000 */       nop
  /* 147EE0 80131EB0 0007000D */     break 7
  .L80131EB4:
  /* 147EE4 80131EB4 2401FFFF */     addiu $at, $zero, -1
  /* 147EE8 80131EB8 16C10004 */       bne $s6, $at, .L80131ECC
  /* 147EEC 80131EBC 3C018000 */       lui $at, 0x8000
  /* 147EF0 80131EC0 14610002 */       bne $v1, $at, .L80131ECC
  /* 147EF4 80131EC4 00000000 */       nop
  /* 147EF8 80131EC8 0006000D */     break 6
  .L80131ECC:
  /* 147EFC 80131ECC 032F2821 */      addu $a1, $t9, $t7
  /* 147F00 80131ED0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 147F04 80131ED4 00000000 */       nop
  /* 147F08 80131ED8 00408025 */        or $s0, $v0, $zero
  /* 147F0C 80131EDC 00402025 */        or $a0, $v0, $zero
  /* 147F10 80131EE0 0C04C6FE */       jal mnBonusSetTextureColors
  /* 147F14 80131EE4 02802825 */        or $a1, $s4, $zero
  /* 147F18 80131EE8 4616A501 */     sub.s $f20, $f20, $f22
  /* 147F1C 80131EEC 26310001 */     addiu $s1, $s1, 1
  /* 147F20 80131EF0 E618005C */      swc1 $f24, 0x5c($s0)
  /* 147F24 80131EF4 12A00003 */      beqz $s5, .L80131F04
  /* 147F28 80131EF8 E6140058 */      swc1 $f20, 0x58($s0)
  /* 147F2C 80131EFC 10000005 */         b .L80131F14
  /* 147F30 80131F00 02401825 */        or $v1, $s2, $zero
  .L80131F04:
  /* 147F34 80131F04 02602025 */        or $a0, $s3, $zero
  /* 147F38 80131F08 0C04C710 */       jal mnBonusGetNumberOfDigits
  /* 147F3C 80131F0C 02402825 */        or $a1, $s2, $zero
  /* 147F40 80131F10 00401825 */        or $v1, $v0, $zero
  .L80131F14:
  /* 147F44 80131F14 0223082A */       slt $at, $s1, $v1
  /* 147F48 80131F18 5420FFC8 */      bnel $at, $zero, .L80131E3C
  /* 147F4C 80131F1C 02C02025 */        or $a0, $s6, $zero
  .L80131F20:
  /* 147F50 80131F20 8FBF0054 */        lw $ra, 0x54($sp)
  /* 147F54 80131F24 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 147F58 80131F28 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 147F5C 80131F2C D7B80028 */      ldc1 $f24, 0x28($sp)
  /* 147F60 80131F30 8FB00030 */        lw $s0, 0x30($sp)
  /* 147F64 80131F34 8FB10034 */        lw $s1, 0x34($sp)
  /* 147F68 80131F38 8FB20038 */        lw $s2, 0x38($sp)
  /* 147F6C 80131F3C 8FB3003C */        lw $s3, 0x3c($sp)
  /* 147F70 80131F40 8FB40040 */        lw $s4, 0x40($sp)
  /* 147F74 80131F44 8FB50044 */        lw $s5, 0x44($sp)
  /* 147F78 80131F48 8FB60048 */        lw $s6, 0x48($sp)
  /* 147F7C 80131F4C 8FB7004C */        lw $s7, 0x4c($sp)
  /* 147F80 80131F50 8FBE0050 */        lw $fp, 0x50($sp)
  /* 147F84 80131F54 03E00008 */        jr $ra
  /* 147F88 80131F58 27BD0098 */     addiu $sp, $sp, 0x98

  /* 147F8C 80131F5C 03E00008 */        jr $ra
  /* 147F90 80131F60 00000000 */       nop

  /* 147F94 80131F64 03E00008 */        jr $ra
  /* 147F98 80131F68 00000000 */       nop

  /* 147F9C 80131F6C 03E00008 */        jr $ra
  /* 147FA0 80131F70 00000000 */       nop

glabel mnBonusSelectCharWithToken
  /* 147FA4 80131F74 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 147FA8 80131F78 AFB00018 */        sw $s0, 0x18($sp)
  /* 147FAC 80131F7C 3C108013 */       lui $s0, %hi(gMNBonusPanel)
  /* 147FB0 80131F80 26107648 */     addiu $s0, $s0, %lo(gMNBonusPanel)
  /* 147FB4 80131F84 8E0E0054 */        lw $t6, 0x54($s0) # gMNBonusPanel + 84
  /* 147FB8 80131F88 AFBF001C */        sw $ra, 0x1c($sp)
  /* 147FBC 80131F8C AFA40028 */        sw $a0, 0x28($sp)
  /* 147FC0 80131F90 8E040020 */        lw $a0, 0x20($s0) # gMNBonusPanel + 32
  /* 147FC4 80131F94 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 147FC8 80131F98 AFAE0024 */        sw $t6, 0x24($sp)
  /* 147FCC 80131F9C AFA20020 */        sw $v0, 0x20($sp)
  /* 147FD0 80131FA0 8E040008 */        lw $a0, 8($s0) # gMNBonusPanel + 8
  /* 147FD4 80131FA4 00402825 */        or $a1, $v0, $zero
  /* 147FD8 80131FA8 0C03A492 */       jal func_ovl2_800E9248
  /* 147FDC 80131FAC 00003025 */        or $a2, $zero, $zero
  /* 147FE0 80131FB0 8FAF0020 */        lw $t7, 0x20($sp)
  /* 147FE4 80131FB4 24180001 */     addiu $t8, $zero, 1
  /* 147FE8 80131FB8 24190004 */     addiu $t9, $zero, 4
  /* 147FEC 80131FBC 24060002 */     addiu $a2, $zero, 2
  /* 147FF0 80131FC0 AE18002C */        sw $t8, 0x2c($s0) # gMNBonusPanel + 44
  /* 147FF4 80131FC4 AE190050 */        sw $t9, 0x50($s0) # gMNBonusPanel + 80
  /* 147FF8 80131FC8 AE060028 */        sw $a2, 0x28($s0) # gMNBonusPanel + 40
  /* 147FFC 80131FCC 8E040000 */        lw $a0, ($s0) # gMNBonusPanel + 0
  /* 148000 80131FD0 8FA50028 */        lw $a1, 0x28($sp)
  /* 148004 80131FD4 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 148008 80131FD8 AE0F0024 */        sw $t7, 0x24($s0) # gMNBonusPanel + 36
  /* 14800C 80131FDC 2409FFFF */     addiu $t1, $zero, -1
  /* 148010 80131FE0 240A0001 */     addiu $t2, $zero, 1
  /* 148014 80131FE4 AE090054 */        sw $t1, 0x54($s0) # gMNBonusPanel + 84
  /* 148018 80131FE8 AE0A0058 */        sw $t2, 0x58($s0) # gMNBonusPanel + 88
  /* 14801C 80131FEC 0C04D307 */       jal mnBonusReorderCursorsOnPlacement
  /* 148020 80131FF0 8FA40024 */        lw $a0, 0x24($sp)
  /* 148024 80131FF4 8FA40028 */        lw $a0, 0x28($sp)
  /* 148028 80131FF8 0C04D294 */       jal mnBonusAnnounceFighter
  /* 14802C 80131FFC 8FA50024 */        lw $a1, 0x24($sp)
  /* 148030 80132000 0C04D247 */       jal mnBonusCreateWhiteSquare
  /* 148034 80132004 8FA40024 */        lw $a0, 0x24($sp)
  /* 148038 80132008 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14803C 8013200C 240B008C */     addiu $t3, $zero, 0x8c
  /* 148040 80132010 3C018013 */       lui $at, %hi(gMNBonusAutostartTimer)
  /* 148044 80132014 AC2B76E8 */        sw $t3, %lo(gMNBonusAutostartTimer)($at)
  /* 148048 80132018 3C018013 */       lui $at, %hi(gMNBonusCharSelected)
  /* 14804C 8013201C 240C0001 */     addiu $t4, $zero, 1
  /* 148050 80132020 8FB00018 */        lw $s0, 0x18($sp)
  /* 148054 80132024 AC2C76EC */        sw $t4, %lo(gMNBonusCharSelected)($at)
  /* 148058 80132028 03E00008 */        jr $ra
  /* 14805C 8013202C 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusGetNextPortraitX
  /* 148060 80132030 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 148064 80132034 3C0E8013 */       lui $t6, %hi(dMNBonusPortraitPositionsX)
  /* 148068 80132038 27A30040 */     addiu $v1, $sp, 0x40
  /* 14806C 8013203C 44856000 */      mtc1 $a1, $f12
  /* 148070 80132040 25CE70C0 */     addiu $t6, $t6, %lo(dMNBonusPortraitPositionsX)
  /* 148074 80132044 27A50010 */     addiu $a1, $sp, 0x10
  /* 148078 80132048 25C80030 */     addiu $t0, $t6, 0x30
  /* 14807C 8013204C 0060C825 */        or $t9, $v1, $zero
  .L80132050:
  /* 148080 80132050 8DD80000 */        lw $t8, ($t6) # dMNBonusPortraitPositionsX + 0
  /* 148084 80132054 25CE000C */     addiu $t6, $t6, 0xc
  /* 148088 80132058 2739000C */     addiu $t9, $t9, 0xc
  /* 14808C 8013205C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 148090 80132060 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusPortraitPositionsX + -8
  /* 148094 80132064 AF2FFFF8 */        sw $t7, -8($t9)
  /* 148098 80132068 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusPortraitPositionsX + -4
  /* 14809C 8013206C 15C8FFF8 */       bne $t6, $t0, .L80132050
  /* 1480A0 80132070 AF38FFFC */        sw $t8, -4($t9)
  /* 1480A4 80132074 3C098013 */       lui $t1, %hi(dMNBonusPortraitVelocities)
  /* 1480A8 80132078 252970F0 */     addiu $t1, $t1, %lo(dMNBonusPortraitVelocities)
  /* 1480AC 8013207C 252D0030 */     addiu $t5, $t1, 0x30
  /* 1480B0 80132080 00A06025 */        or $t4, $a1, $zero
  .L80132084:
  /* 1480B4 80132084 8D2B0000 */        lw $t3, ($t1) # dMNBonusPortraitVelocities + 0
  /* 1480B8 80132088 2529000C */     addiu $t1, $t1, 0xc
  /* 1480BC 8013208C 258C000C */     addiu $t4, $t4, 0xc
  /* 1480C0 80132090 AD8BFFF4 */        sw $t3, -0xc($t4)
  /* 1480C4 80132094 8D2AFFF8 */        lw $t2, -8($t1) # dMNBonusPortraitVelocities + -8
  /* 1480C8 80132098 AD8AFFF8 */        sw $t2, -8($t4)
  /* 1480CC 8013209C 8D2BFFFC */        lw $t3, -4($t1) # dMNBonusPortraitVelocities + -4
  /* 1480D0 801320A0 152DFFF8 */       bne $t1, $t5, .L80132084
  /* 1480D4 801320A4 AD8BFFFC */        sw $t3, -4($t4)
  /* 1480D8 801320A8 00041080 */       sll $v0, $a0, 2
  /* 1480DC 801320AC 00624021 */      addu $t0, $v1, $v0
  /* 1480E0 801320B0 C5000000 */      lwc1 $f0, ($t0)
  /* 1480E4 801320B4 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1480E8 801320B8 46006032 */    c.eq.s $f12, $f0
  /* 1480EC 801320BC 00000000 */       nop
  /* 1480F0 801320C0 45020005 */     bc1fl .L801320D8
  /* 1480F4 801320C4 460C003C */    c.lt.s $f0, $f12
  /* 1480F8 801320C8 44810000 */      mtc1 $at, $f0 # -1.0 to cop1
  /* 1480FC 801320CC 1000001B */         b .L8013213C
  /* 148100 801320D0 00000000 */       nop
  /* 148104 801320D4 460C003C */    c.lt.s $f0, $f12
  .L801320D8:
  /* 148108 801320D8 00A27021 */      addu $t6, $a1, $v0
  /* 14810C 801320DC 00A2C821 */      addu $t9, $a1, $v0
  /* 148110 801320E0 4502000D */     bc1fl .L80132118
  /* 148114 801320E4 C7260000 */      lwc1 $f6, ($t9)
  /* 148118 801320E8 C5C40000 */      lwc1 $f4, ($t6) # dMNBonusPortraitPositionsX + 0
  /* 14811C 801320EC 46046080 */     add.s $f2, $f12, $f4
  /* 148120 801320F0 4600103E */    c.le.s $f2, $f0
  /* 148124 801320F4 00000000 */       nop
  /* 148128 801320F8 45020004 */     bc1fl .L8013210C
  /* 14812C 801320FC 46001306 */     mov.s $f12, $f2
  /* 148130 80132100 1000000E */         b .L8013213C
  /* 148134 80132104 00000000 */       nop
  /* 148138 80132108 46001306 */     mov.s $f12, $f2
  .L8013210C:
  /* 14813C 8013210C 1000000B */         b .L8013213C
  /* 148140 80132110 46006006 */     mov.s $f0, $f12
  /* 148144 80132114 C7260000 */      lwc1 $f6, ($t9)
  .L80132118:
  /* 148148 80132118 46066080 */     add.s $f2, $f12, $f6
  /* 14814C 8013211C 4602003E */    c.le.s $f0, $f2
  /* 148150 80132120 00000000 */       nop
  /* 148154 80132124 45020004 */     bc1fl .L80132138
  /* 148158 80132128 46001306 */     mov.s $f12, $f2
  /* 14815C 8013212C 10000002 */         b .L80132138
  /* 148160 80132130 46000306 */     mov.s $f12, $f0
  /* 148164 80132134 46001306 */     mov.s $f12, $f2
  .L80132138:
  /* 148168 80132138 46006006 */     mov.s $f0, $f12
  .L8013213C:
  /* 14816C 8013213C 03E00008 */        jr $ra
  /* 148170 80132140 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnBonusCheckFighterIsXBoxed
  /* 148174 80132144 AFA40000 */        sw $a0, ($sp)
  /* 148178 80132148 03E00008 */        jr $ra
  /* 14817C 8013214C 00001025 */        or $v0, $zero, $zero

glabel mnBonusSetPortraitX
  /* 148180 80132150 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 148184 80132154 AFBF0014 */        sw $ra, 0x14($sp)
  /* 148188 80132158 00803025 */        or $a2, $a0, $zero
  /* 14818C 8013215C 8CCE0074 */        lw $t6, 0x74($a2)
  /* 148190 80132160 8C840084 */        lw $a0, 0x84($a0)
  /* 148194 80132164 8DC50058 */        lw $a1, 0x58($t6)
  /* 148198 80132168 0C04C80C */       jal mnBonusGetNextPortraitX
  /* 14819C 8013216C AFA60018 */        sw $a2, 0x18($sp)
  /* 1481A0 80132170 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1481A4 80132174 44812000 */      mtc1 $at, $f4 # -1.0 to cop1
  /* 1481A8 80132178 8FA60018 */        lw $a2, 0x18($sp)
  /* 1481AC 8013217C 46040032 */    c.eq.s $f0, $f4
  /* 1481B0 80132180 00000000 */       nop
  /* 1481B4 80132184 4503000E */     bc1tl .L801321C0
  /* 1481B8 80132188 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1481BC 8013218C 8CCF0074 */        lw $t7, 0x74($a2)
  /* 1481C0 80132190 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 1481C4 80132194 E5E00058 */      swc1 $f0, 0x58($t7)
  /* 1481C8 80132198 8CC20074 */        lw $v0, 0x74($a2)
  /* 1481CC 8013219C 8C430008 */        lw $v1, 8($v0)
  /* 1481D0 801321A0 50600007 */      beql $v1, $zero, .L801321C0
  /* 1481D4 801321A4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1481D8 801321A8 C4460058 */      lwc1 $f6, 0x58($v0)
  /* 1481DC 801321AC 44814000 */      mtc1 $at, $f8 # 4.0 to cop1
  /* 1481E0 801321B0 00000000 */       nop
  /* 1481E4 801321B4 46083280 */     add.s $f10, $f6, $f8
  /* 1481E8 801321B8 E46A0058 */      swc1 $f10, 0x58($v1)
  /* 1481EC 801321BC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801321C0:
  /* 1481F0 801321C0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1481F4 801321C4 03E00008 */        jr $ra
  /* 1481F8 801321C8 00000000 */       nop

glabel mnBonusInitializePortraitBackgroundPosition
  /* 1481FC 801321CC 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 148200 801321D0 3C0E8013 */       lui $t6, %hi(dMNBonusPortraitPositionsXY)
  /* 148204 801321D4 27A30000 */     addiu $v1, $sp, 0
  /* 148208 801321D8 25CE7120 */     addiu $t6, $t6, %lo(dMNBonusPortraitPositionsXY)
  /* 14820C 801321DC 25C80060 */     addiu $t0, $t6, 0x60
  /* 148210 801321E0 0060C825 */        or $t9, $v1, $zero
  .L801321E4:
  /* 148214 801321E4 8DD80000 */        lw $t8, ($t6) # dMNBonusPortraitPositionsXY + 0
  /* 148218 801321E8 25CE000C */     addiu $t6, $t6, 0xc
  /* 14821C 801321EC 2739000C */     addiu $t9, $t9, 0xc
  /* 148220 801321F0 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 148224 801321F4 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusPortraitPositionsXY + -8
  /* 148228 801321F8 AF2FFFF8 */        sw $t7, -8($t9)
  /* 14822C 801321FC 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusPortraitPositionsXY + -4
  /* 148230 80132200 15C8FFF8 */       bne $t6, $t0, .L801321E4
  /* 148234 80132204 AF38FFFC */        sw $t8, -4($t9)
  /* 148238 80132208 000548C0 */       sll $t1, $a1, 3
  /* 14823C 8013220C 00691021 */      addu $v0, $v1, $t1
  /* 148240 80132210 C4440000 */      lwc1 $f4, ($v0)
  /* 148244 80132214 E4840058 */      swc1 $f4, 0x58($a0)
  /* 148248 80132218 C4460004 */      lwc1 $f6, 4($v0)
  /* 14824C 8013221C 27BD0060 */     addiu $sp, $sp, 0x60
  /* 148250 80132220 03E00008 */        jr $ra
  /* 148254 80132224 E486005C */      swc1 $f6, 0x5c($a0)

glabel mnBonusAddRedXBoxToPortrait
  /* 148258 80132228 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14825C 8013222C AFBF0014 */        sw $ra, 0x14($sp)
  /* 148260 80132230 AFA5002C */        sw $a1, 0x2c($sp)
  /* 148264 80132234 8C820074 */        lw $v0, 0x74($a0)
  /* 148268 80132238 3C0E8013 */       lui $t6, %hi(D_ovl29_80137E08)
  /* 14826C 8013223C 8DCE7E08 */        lw $t6, %lo(D_ovl29_80137E08)($t6)
  /* 148270 80132240 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 148274 80132244 3C0F0000 */       lui $t7, %hi(D_NF_000002B8)
  /* 148278 80132248 25EF02B8 */     addiu $t7, $t7, %lo(D_NF_000002B8)
  /* 14827C 8013224C E7A40020 */      swc1 $f4, 0x20($sp)
  /* 148280 80132250 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 148284 80132254 01CF2821 */      addu $a1, $t6, $t7
  /* 148288 80132258 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14828C 8013225C E7A6001C */      swc1 $f6, 0x1c($sp)
  /* 148290 80132260 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 148294 80132264 44815000 */      mtc1 $at, $f10 # 4.0 to cop1
  /* 148298 80132268 C7A80020 */      lwc1 $f8, 0x20($sp)
  /* 14829C 8013226C 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 1482A0 80132270 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 1482A4 80132274 460A4400 */     add.s $f16, $f8, $f10
  /* 1482A8 80132278 94580024 */       lhu $t8, 0x24($v0)
  /* 1482AC 8013227C 240A00FF */     addiu $t2, $zero, 0xff
  /* 1482B0 80132280 E4500058 */      swc1 $f16, 0x58($v0)
  /* 1482B4 80132284 C7B2001C */      lwc1 $f18, 0x1c($sp)
  /* 1482B8 80132288 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 1482BC 8013228C A4480024 */        sh $t0, 0x24($v0)
  /* 1482C0 80132290 46049180 */     add.s $f6, $f18, $f4
  /* 1482C4 80132294 35090001 */       ori $t1, $t0, 1
  /* 1482C8 80132298 A4490024 */        sh $t1, 0x24($v0)
  /* 1482CC 8013229C A04A0028 */        sb $t2, 0x28($v0)
  /* 1482D0 801322A0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1482D4 801322A4 A0400029 */        sb $zero, 0x29($v0)
  /* 1482D8 801322A8 A040002A */        sb $zero, 0x2a($v0)
  /* 1482DC 801322AC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1482E0 801322B0 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1482E4 801322B4 03E00008 */        jr $ra
  /* 1482E8 801322B8 00000000 */       nop

glabel mnBonusGetIsLocked
  /* 1482EC 801322BC 24010004 */     addiu $at, $zero, 4
  /* 1482F0 801322C0 10810026 */       beq $a0, $at, .L8013235C
  /* 1482F4 801322C4 3C0A8013 */       lui $t2, 0x8013
  /* 1482F8 801322C8 24010007 */     addiu $at, $zero, 7
  /* 1482FC 801322CC 1081001A */       beq $a0, $at, .L80132338
  /* 148300 801322D0 3C088013 */       lui $t0, 0x8013
  /* 148304 801322D4 2401000A */     addiu $at, $zero, 0xa
  /* 148308 801322D8 1081000E */       beq $a0, $at, .L80132314
  /* 14830C 801322DC 3C188013 */       lui $t8, 0x8013
  /* 148310 801322E0 2401000B */     addiu $at, $zero, 0xb
  /* 148314 801322E4 14810026 */       bne $a0, $at, .L80132380
  /* 148318 801322E8 00001025 */        or $v0, $zero, $zero
  /* 14831C 801322EC 3C0E8013 */       lui $t6, %hi(gMNBonusCharacterUnlockedMask)
  /* 148320 801322F0 95CE7720 */       lhu $t6, %lo(gMNBonusCharacterUnlockedMask)($t6)
  /* 148324 801322F4 24030001 */     addiu $v1, $zero, 1
  /* 148328 801322F8 31CF0800 */      andi $t7, $t6, 0x800
  /* 14832C 801322FC 11E00003 */      beqz $t7, .L8013230C
  /* 148330 80132300 00000000 */       nop
  /* 148334 80132304 03E00008 */        jr $ra
  /* 148338 80132308 00001025 */        or $v0, $zero, $zero

  .L8013230C:
  /* 14833C 8013230C 03E00008 */        jr $ra
  /* 148340 80132310 00601025 */        or $v0, $v1, $zero

  .L80132314:
  /* 148344 80132314 97187720 */       lhu $t8, 0x7720($t8)
  /* 148348 80132318 24030001 */     addiu $v1, $zero, 1
  /* 14834C 8013231C 33190400 */      andi $t9, $t8, 0x400
  /* 148350 80132320 13200003 */      beqz $t9, .L80132330
  /* 148354 80132324 00000000 */       nop
  /* 148358 80132328 03E00008 */        jr $ra
  /* 14835C 8013232C 00001025 */        or $v0, $zero, $zero

  .L80132330:
  /* 148360 80132330 03E00008 */        jr $ra
  /* 148364 80132334 00601025 */        or $v0, $v1, $zero

  .L80132338:
  /* 148368 80132338 95087720 */       lhu $t0, 0x7720($t0)
  /* 14836C 8013233C 24030001 */     addiu $v1, $zero, 1
  /* 148370 80132340 31090080 */      andi $t1, $t0, 0x80
  /* 148374 80132344 11200003 */      beqz $t1, .L80132354
  /* 148378 80132348 00000000 */       nop
  /* 14837C 8013234C 03E00008 */        jr $ra
  /* 148380 80132350 00001025 */        or $v0, $zero, $zero

  .L80132354:
  /* 148384 80132354 03E00008 */        jr $ra
  /* 148388 80132358 00601025 */        or $v0, $v1, $zero

  .L8013235C:
  /* 14838C 8013235C 954A7720 */       lhu $t2, 0x7720($t2)
  /* 148390 80132360 24030001 */     addiu $v1, $zero, 1
  /* 148394 80132364 314B0010 */      andi $t3, $t2, 0x10
  /* 148398 80132368 11600003 */      beqz $t3, .L80132378
  /* 14839C 8013236C 00000000 */       nop
  /* 1483A0 80132370 03E00008 */        jr $ra
  /* 1483A4 80132374 00001025 */        or $v0, $zero, $zero

  .L80132378:
  /* 1483A8 80132378 03E00008 */        jr $ra
  /* 1483AC 8013237C 00601025 */        or $v0, $v1, $zero

  .L80132380:
  /* 1483B0 80132380 03E00008 */        jr $ra
  /* 1483B4 80132384 00000000 */       nop

  /* 1483B8 80132388 03E00008 */        jr $ra
  /* 1483BC 8013238C 00000000 */       nop

glabel mnBonusGetFtKind
  /* 1483C0 80132390 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1483C4 80132394 3C0E8013 */       lui $t6, %hi(dMNBonusFTKindOrder)
  /* 1483C8 80132398 27A30000 */     addiu $v1, $sp, 0
  /* 1483CC 8013239C 25CE71A4 */     addiu $t6, $t6, %lo(dMNBonusFTKindOrder)
  /* 1483D0 801323A0 25C80030 */     addiu $t0, $t6, 0x30
  /* 1483D4 801323A4 0060C825 */        or $t9, $v1, $zero
  .L801323A8:
  /* 1483D8 801323A8 8DD80000 */        lw $t8, ($t6) # dMNBonusFTKindOrder + 0
  /* 1483DC 801323AC 25CE000C */     addiu $t6, $t6, 0xc
  /* 1483E0 801323B0 2739000C */     addiu $t9, $t9, 0xc
  /* 1483E4 801323B4 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1483E8 801323B8 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusFTKindOrder + -8
  /* 1483EC 801323BC AF2FFFF8 */        sw $t7, -8($t9)
  /* 1483F0 801323C0 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusFTKindOrder + -4
  /* 1483F4 801323C4 15C8FFF8 */       bne $t6, $t0, .L801323A8
  /* 1483F8 801323C8 AF38FFFC */        sw $t8, -4($t9)
  /* 1483FC 801323CC 00044880 */       sll $t1, $a0, 2
  /* 148400 801323D0 00695021 */      addu $t2, $v1, $t1
  /* 148404 801323D4 8D420000 */        lw $v0, ($t2)
  /* 148408 801323D8 03E00008 */        jr $ra
  /* 14840C 801323DC 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBonusGetPortraitId
  /* 148410 801323E0 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 148414 801323E4 3C0E8013 */       lui $t6, %hi(dMNBonusPortraitOrder)
  /* 148418 801323E8 27A30000 */     addiu $v1, $sp, 0
  /* 14841C 801323EC 25CE71D4 */     addiu $t6, $t6, %lo(dMNBonusPortraitOrder)
  /* 148420 801323F0 25C80030 */     addiu $t0, $t6, 0x30
  /* 148424 801323F4 0060C825 */        or $t9, $v1, $zero
  .L801323F8:
  /* 148428 801323F8 8DD80000 */        lw $t8, ($t6) # dMNBonusPortraitOrder + 0
  /* 14842C 801323FC 25CE000C */     addiu $t6, $t6, 0xc
  /* 148430 80132400 2739000C */     addiu $t9, $t9, 0xc
  /* 148434 80132404 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 148438 80132408 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusPortraitOrder + -8
  /* 14843C 8013240C AF2FFFF8 */        sw $t7, -8($t9)
  /* 148440 80132410 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusPortraitOrder + -4
  /* 148444 80132414 15C8FFF8 */       bne $t6, $t0, .L801323F8
  /* 148448 80132418 AF38FFFC */        sw $t8, -4($t9)
  /* 14844C 8013241C 00044880 */       sll $t1, $a0, 2
  /* 148450 80132420 00695021 */      addu $t2, $v1, $t1
  /* 148454 80132424 8D420000 */        lw $v0, ($t2)
  /* 148458 80132428 03E00008 */        jr $ra
  /* 14845C 8013242C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBonusRenderPortraitWithNoise
  /* 148460 80132430 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 148464 80132434 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 148468 80132438 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 14846C 8013243C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 148470 80132440 AFBF0014 */        sw $ra, 0x14($sp)
  /* 148474 80132444 244E0008 */     addiu $t6, $v0, 8
  /* 148478 80132448 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 14847C 8013244C 3C0FE700 */       lui $t7, 0xe700
  /* 148480 80132450 AC4F0000 */        sw $t7, ($v0)
  /* 148484 80132454 AC400004 */        sw $zero, 4($v0)
  /* 148488 80132458 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 14848C 8013245C 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 148490 80132460 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 148494 80132464 24580008 */     addiu $t8, $v0, 8
  /* 148498 80132468 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 14849C 8013246C AC400004 */        sw $zero, 4($v0)
  /* 1484A0 80132470 AC590000 */        sw $t9, ($v0)
  /* 1484A4 80132474 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1484A8 80132478 3C0C3030 */       lui $t4, (0x303030FF >> 16) # 808464639
  /* 1484AC 8013247C 358C30FF */       ori $t4, $t4, (0x303030FF & 0xFFFF) # 808464639
  /* 1484B0 80132480 244A0008 */     addiu $t2, $v0, 8
  /* 1484B4 80132484 AC6A0000 */        sw $t2, ($v1) # gDisplayListHead + 0
  /* 1484B8 80132488 3C0BFA00 */       lui $t3, 0xfa00
  /* 1484BC 8013248C AC4B0000 */        sw $t3, ($v0)
  /* 1484C0 80132490 AC4C0004 */        sw $t4, 4($v0)
  /* 1484C4 80132494 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1484C8 80132498 3C0F11FC */       lui $t7, (0x11FCF279 >> 16) # 301789817
  /* 1484CC 8013249C 3C0EFC71 */       lui $t6, (0xFC71FEE3 >> 16) # 4235329251
  /* 1484D0 801324A0 244D0008 */     addiu $t5, $v0, 8
  /* 1484D4 801324A4 AC6D0000 */        sw $t5, ($v1) # gDisplayListHead + 0
  /* 1484D8 801324A8 35CEFEE3 */       ori $t6, $t6, (0xFC71FEE3 & 0xFFFF) # 4235329251
  /* 1484DC 801324AC 35EFF279 */       ori $t7, $t7, (0x11FCF279 & 0xFFFF) # 301789817
  /* 1484E0 801324B0 AC4F0004 */        sw $t7, 4($v0)
  /* 1484E4 801324B4 AC4E0000 */        sw $t6, ($v0)
  /* 1484E8 801324B8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1484EC 801324BC 3C0A0050 */       lui $t2, (0x5041C8 >> 16) # 5259720
  /* 1484F0 801324C0 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 1484F4 801324C4 24580008 */     addiu $t8, $v0, 8
  /* 1484F8 801324C8 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1484FC 801324CC 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 148500 801324D0 354A41C8 */       ori $t2, $t2, (0x5041C8 & 0xFFFF) # 5259720
  /* 148504 801324D4 AC4A0004 */        sw $t2, 4($v0)
  /* 148508 801324D8 0C0333DD */       jal func_ovl0_800CCF74
  /* 14850C 801324DC AC590000 */        sw $t9, ($v0)
  /* 148510 801324E0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 148514 801324E4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 148518 801324E8 03E00008 */        jr $ra
  /* 14851C 801324EC 00000000 */       nop

glabel mnBonusCreateLockedPortrait
  /* 148520 801324F0 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 148524 801324F4 3C0F8013 */       lui $t7, %hi(dMNBonusLockedPortraitOffsets)
  /* 148528 801324F8 AFB10020 */        sw $s1, 0x20($sp)
  /* 14852C 801324FC 25EF7204 */     addiu $t7, $t7, %lo(dMNBonusLockedPortraitOffsets)
  /* 148530 80132500 00808825 */        or $s1, $a0, $zero
  /* 148534 80132504 AFBF0024 */        sw $ra, 0x24($sp)
  /* 148538 80132508 AFB0001C */        sw $s0, 0x1c($sp)
  /* 14853C 8013250C 25E80030 */     addiu $t0, $t7, 0x30
  /* 148540 80132510 27AE0038 */     addiu $t6, $sp, 0x38
  .L80132514:
  /* 148544 80132514 8DF90000 */        lw $t9, ($t7) # dMNBonusLockedPortraitOffsets + 0
  /* 148548 80132518 25EF000C */     addiu $t7, $t7, 0xc
  /* 14854C 8013251C 25CE000C */     addiu $t6, $t6, 0xc
  /* 148550 80132520 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 148554 80132524 8DF8FFF8 */        lw $t8, -8($t7) # dMNBonusLockedPortraitOffsets + -8
  /* 148558 80132528 ADD8FFF8 */        sw $t8, -8($t6)
  /* 14855C 8013252C 8DF9FFFC */        lw $t9, -4($t7) # dMNBonusLockedPortraitOffsets + -4
  /* 148560 80132530 15E8FFF8 */       bne $t7, $t0, .L80132514
  /* 148564 80132534 ADD9FFFC */        sw $t9, -4($t6)
  /* 148568 80132538 00002025 */        or $a0, $zero, $zero
  /* 14856C 8013253C 00002825 */        or $a1, $zero, $zero
  /* 148570 80132540 24060012 */     addiu $a2, $zero, 0x12
  /* 148574 80132544 0C00265A */       jal omMakeGObjSPAfter
  /* 148578 80132548 3C078000 */       lui $a3, 0x8000
  /* 14857C 8013254C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 148580 80132550 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 148584 80132554 2409FFFF */     addiu $t1, $zero, -1
  /* 148588 80132558 00408025 */        or $s0, $v0, $zero
  /* 14858C 8013255C AFA90010 */        sw $t1, 0x10($sp)
  /* 148590 80132560 AFA50030 */        sw $a1, 0x30($sp)
  /* 148594 80132564 00402025 */        or $a0, $v0, $zero
  /* 148598 80132568 2406001B */     addiu $a2, $zero, 0x1b
  /* 14859C 8013256C 0C00277D */       jal omAddGObjRenderProc
  /* 1485A0 80132570 3C078000 */       lui $a3, 0x8000
  /* 1485A4 80132574 3C058013 */       lui $a1, %hi(mnBonusSetPortraitX)
  /* 1485A8 80132578 24A52150 */     addiu $a1, $a1, %lo(mnBonusSetPortraitX)
  /* 1485AC 8013257C AFA5002C */        sw $a1, 0x2c($sp)
  /* 1485B0 80132580 02002025 */        or $a0, $s0, $zero
  /* 1485B4 80132584 24060001 */     addiu $a2, $zero, 1
  /* 1485B8 80132588 0C002062 */       jal omAddGObjCommonProc
  /* 1485BC 8013258C 24070001 */     addiu $a3, $zero, 1
  /* 1485C0 80132590 3C0A8013 */       lui $t2, %hi(D_ovl29_80137E08)
  /* 1485C4 80132594 8D4A7E08 */        lw $t2, %lo(D_ovl29_80137E08)($t2)
  /* 1485C8 80132598 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 1485CC 8013259C 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 1485D0 801325A0 02002025 */        or $a0, $s0, $zero
  /* 1485D4 801325A4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1485D8 801325A8 014B2821 */      addu $a1, $t2, $t3
  /* 1485DC 801325AC 2A210006 */      slti $at, $s1, 6
  /* 1485E0 801325B0 14200003 */      bnez $at, .L801325C0
  /* 1485E4 801325B4 00402025 */        or $a0, $v0, $zero
  /* 1485E8 801325B8 10000002 */         b .L801325C4
  /* 1485EC 801325BC 2623FFFA */     addiu $v1, $s1, -6
  .L801325C0:
  /* 1485F0 801325C0 02201825 */        or $v1, $s1, $zero
  .L801325C4:
  /* 1485F4 801325C4 00036080 */       sll $t4, $v1, 2
  /* 1485F8 801325C8 01836023 */      subu $t4, $t4, $v1
  /* 1485FC 801325CC 000C6080 */       sll $t4, $t4, 2
  /* 148600 801325D0 01836023 */      subu $t4, $t4, $v1
  /* 148604 801325D4 000C6080 */       sll $t4, $t4, 2
  /* 148608 801325D8 01836021 */      addu $t4, $t4, $v1
  /* 14860C 801325DC 258D0019 */     addiu $t5, $t4, 0x19
  /* 148610 801325E0 448D2000 */      mtc1 $t5, $f4
  /* 148614 801325E4 2A210006 */      slti $at, $s1, 6
  /* 148618 801325E8 468021A0 */   cvt.s.w $f6, $f4
  /* 14861C 801325EC 14200003 */      bnez $at, .L801325FC
  /* 148620 801325F0 E4460058 */      swc1 $f6, 0x58($v0)
  /* 148624 801325F4 10000002 */         b .L80132600
  /* 148628 801325F8 24030001 */     addiu $v1, $zero, 1
  .L801325FC:
  /* 14862C 801325FC 00001825 */        or $v1, $zero, $zero
  .L80132600:
  /* 148630 80132600 00034080 */       sll $t0, $v1, 2
  /* 148634 80132604 01034023 */      subu $t0, $t0, $v1
  /* 148638 80132608 00084080 */       sll $t0, $t0, 2
  /* 14863C 8013260C 01034023 */      subu $t0, $t0, $v1
  /* 148640 80132610 00084080 */       sll $t0, $t0, 2
  /* 148644 80132614 01034023 */      subu $t0, $t0, $v1
  /* 148648 80132618 250F0024 */     addiu $t7, $t0, 0x24
  /* 14864C 8013261C 448F4000 */      mtc1 $t7, $f8
  /* 148650 80132620 02202825 */        or $a1, $s1, $zero
  /* 148654 80132624 468042A0 */   cvt.s.w $f10, $f8
  /* 148658 80132628 0C04C873 */       jal mnBonusInitializePortraitBackgroundPosition
  /* 14865C 8013262C E48A005C */      swc1 $f10, 0x5c($a0)
  /* 148660 80132630 AE110084 */        sw $s1, 0x84($s0)
  /* 148664 80132634 00002025 */        or $a0, $zero, $zero
  /* 148668 80132638 00002825 */        or $a1, $zero, $zero
  /* 14866C 8013263C 24060012 */     addiu $a2, $zero, 0x12
  /* 148670 80132640 0C00265A */       jal omMakeGObjSPAfter
  /* 148674 80132644 3C078000 */       lui $a3, 0x8000
  /* 148678 80132648 3C058013 */       lui $a1, %hi(mnBonusRenderPortraitWithNoise)
  /* 14867C 8013264C 240EFFFF */     addiu $t6, $zero, -1
  /* 148680 80132650 00408025 */        or $s0, $v0, $zero
  /* 148684 80132654 AFAE0010 */        sw $t6, 0x10($sp)
  /* 148688 80132658 24A52430 */     addiu $a1, $a1, %lo(mnBonusRenderPortraitWithNoise)
  /* 14868C 8013265C 00402025 */        or $a0, $v0, $zero
  /* 148690 80132660 2406001B */     addiu $a2, $zero, 0x1b
  /* 148694 80132664 0C00277D */       jal omAddGObjRenderProc
  /* 148698 80132668 3C078000 */       lui $a3, 0x8000
  /* 14869C 8013266C 02002025 */        or $a0, $s0, $zero
  /* 1486A0 80132670 8FA5002C */        lw $a1, 0x2c($sp)
  /* 1486A4 80132674 24060001 */     addiu $a2, $zero, 1
  /* 1486A8 80132678 0C002062 */       jal omAddGObjCommonProc
  /* 1486AC 8013267C 24070001 */     addiu $a3, $zero, 1
  /* 1486B0 80132680 0C04C8E4 */       jal mnBonusGetFtKind
  /* 1486B4 80132684 02202025 */        or $a0, $s1, $zero
  /* 1486B8 80132688 0002C080 */       sll $t8, $v0, 2
  /* 1486BC 8013268C 03B8C821 */      addu $t9, $sp, $t8
  /* 1486C0 80132690 3C098013 */       lui $t1, %hi(D_ovl29_80137E08)
  /* 1486C4 80132694 8D297E08 */        lw $t1, %lo(D_ovl29_80137E08)($t1)
  /* 1486C8 80132698 8F390038 */        lw $t9, 0x38($t9)
  /* 1486CC 8013269C 02002025 */        or $a0, $s0, $zero
  /* 1486D0 801326A0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1486D4 801326A4 03292821 */      addu $a1, $t9, $t1
  /* 1486D8 801326A8 944A0024 */       lhu $t2, 0x24($v0)
  /* 1486DC 801326AC 00402025 */        or $a0, $v0, $zero
  /* 1486E0 801326B0 02202825 */        or $a1, $s1, $zero
  /* 1486E4 801326B4 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 1486E8 801326B8 A44C0024 */        sh $t4, 0x24($v0)
  /* 1486EC 801326BC 358D0001 */       ori $t5, $t4, 1
  /* 1486F0 801326C0 A44D0024 */        sh $t5, 0x24($v0)
  /* 1486F4 801326C4 0C04C873 */       jal mnBonusInitializePortraitBackgroundPosition
  /* 1486F8 801326C8 AE110084 */        sw $s1, 0x84($s0)
  /* 1486FC 801326CC 00002025 */        or $a0, $zero, $zero
  /* 148700 801326D0 00002825 */        or $a1, $zero, $zero
  /* 148704 801326D4 24060012 */     addiu $a2, $zero, 0x12
  /* 148708 801326D8 0C00265A */       jal omMakeGObjSPAfter
  /* 14870C 801326DC 3C078000 */       lui $a3, 0x8000
  /* 148710 801326E0 2408FFFF */     addiu $t0, $zero, -1
  /* 148714 801326E4 00408025 */        or $s0, $v0, $zero
  /* 148718 801326E8 AFA80010 */        sw $t0, 0x10($sp)
  /* 14871C 801326EC 00402025 */        or $a0, $v0, $zero
  /* 148720 801326F0 8FA50030 */        lw $a1, 0x30($sp)
  /* 148724 801326F4 2406001B */     addiu $a2, $zero, 0x1b
  /* 148728 801326F8 0C00277D */       jal omAddGObjRenderProc
  /* 14872C 801326FC 3C078000 */       lui $a3, 0x8000
  /* 148730 80132700 02002025 */        or $a0, $s0, $zero
  /* 148734 80132704 8FA5002C */        lw $a1, 0x2c($sp)
  /* 148738 80132708 24060001 */     addiu $a2, $zero, 1
  /* 14873C 8013270C 0C002062 */       jal omAddGObjCommonProc
  /* 148740 80132710 24070001 */     addiu $a3, $zero, 1
  /* 148744 80132714 3C0F8013 */       lui $t7, %hi(D_ovl29_80137E08)
  /* 148748 80132718 8DEF7E08 */        lw $t7, %lo(D_ovl29_80137E08)($t7)
  /* 14874C 8013271C 3C0E0000 */       lui $t6, %hi(D_NF_00000F68)
  /* 148750 80132720 25CE0F68 */     addiu $t6, $t6, %lo(D_NF_00000F68)
  /* 148754 80132724 02002025 */        or $a0, $s0, $zero
  /* 148758 80132728 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14875C 8013272C 01EE2821 */      addu $a1, $t7, $t6
  /* 148760 80132730 94580024 */       lhu $t8, 0x24($v0)
  /* 148764 80132734 240B005B */     addiu $t3, $zero, 0x5b
  /* 148768 80132738 240C0041 */     addiu $t4, $zero, 0x41
  /* 14876C 8013273C 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 148770 80132740 A4490024 */        sh $t1, 0x24($v0)
  /* 148774 80132744 352A0001 */       ori $t2, $t1, 1
  /* 148778 80132748 240D0033 */     addiu $t5, $zero, 0x33
  /* 14877C 8013274C 240800C4 */     addiu $t0, $zero, 0xc4
  /* 148780 80132750 240F00B9 */     addiu $t7, $zero, 0xb9
  /* 148784 80132754 240E00A9 */     addiu $t6, $zero, 0xa9
  /* 148788 80132758 A44A0024 */        sh $t2, 0x24($v0)
  /* 14878C 8013275C A04B0060 */        sb $t3, 0x60($v0)
  /* 148790 80132760 A04C0061 */        sb $t4, 0x61($v0)
  /* 148794 80132764 A04D0062 */        sb $t5, 0x62($v0)
  /* 148798 80132768 A0480028 */        sb $t0, 0x28($v0)
  /* 14879C 8013276C A04F0029 */        sb $t7, 0x29($v0)
  /* 1487A0 80132770 A04E002A */        sb $t6, 0x2a($v0)
  /* 1487A4 80132774 AE110084 */        sw $s1, 0x84($s0)
  /* 1487A8 80132778 00402025 */        or $a0, $v0, $zero
  /* 1487AC 8013277C 0C04C873 */       jal mnBonusInitializePortraitBackgroundPosition
  /* 1487B0 80132780 02202825 */        or $a1, $s1, $zero
  /* 1487B4 80132784 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1487B8 80132788 8FB0001C */        lw $s0, 0x1c($sp)
  /* 1487BC 8013278C 8FB10020 */        lw $s1, 0x20($sp)
  /* 1487C0 80132790 03E00008 */        jr $ra
  /* 1487C4 80132794 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnBonusCreatePortrait
  /* 1487C8 80132798 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 1487CC 8013279C 3C0F8013 */       lui $t7, %hi(dMNBonusPortraitOffsets)
  /* 1487D0 801327A0 AFB00020 */        sw $s0, 0x20($sp)
  /* 1487D4 801327A4 25EF7234 */     addiu $t7, $t7, %lo(dMNBonusPortraitOffsets)
  /* 1487D8 801327A8 00808025 */        or $s0, $a0, $zero
  /* 1487DC 801327AC AFBF0024 */        sw $ra, 0x24($sp)
  /* 1487E0 801327B0 25E80030 */     addiu $t0, $t7, 0x30
  /* 1487E4 801327B4 27AE0034 */     addiu $t6, $sp, 0x34
  .L801327B8:
  /* 1487E8 801327B8 8DF90000 */        lw $t9, ($t7) # dMNBonusPortraitOffsets + 0
  /* 1487EC 801327BC 25EF000C */     addiu $t7, $t7, 0xc
  /* 1487F0 801327C0 25CE000C */     addiu $t6, $t6, 0xc
  /* 1487F4 801327C4 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 1487F8 801327C8 8DF8FFF8 */        lw $t8, -8($t7) # dMNBonusPortraitOffsets + -8
  /* 1487FC 801327CC ADD8FFF8 */        sw $t8, -8($t6)
  /* 148800 801327D0 8DF9FFFC */        lw $t9, -4($t7) # dMNBonusPortraitOffsets + -4
  /* 148804 801327D4 15E8FFF8 */       bne $t7, $t0, .L801327B8
  /* 148808 801327D8 ADD9FFFC */        sw $t9, -4($t6)
  /* 14880C 801327DC 0C04C8E4 */       jal mnBonusGetFtKind
  /* 148810 801327E0 02002025 */        or $a0, $s0, $zero
  /* 148814 801327E4 0C04C8AF */       jal mnBonusGetIsLocked
  /* 148818 801327E8 00402025 */        or $a0, $v0, $zero
  /* 14881C 801327EC 10400005 */      beqz $v0, .L80132804
  /* 148820 801327F0 00002025 */        or $a0, $zero, $zero
  /* 148824 801327F4 0C04C93C */       jal mnBonusCreateLockedPortrait
  /* 148828 801327F8 02002025 */        or $a0, $s0, $zero
  /* 14882C 801327FC 10000092 */         b .L80132A48
  /* 148830 80132800 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132804:
  /* 148834 80132804 00002825 */        or $a1, $zero, $zero
  /* 148838 80132808 24060019 */     addiu $a2, $zero, 0x19
  /* 14883C 8013280C 0C00265A */       jal omMakeGObjSPAfter
  /* 148840 80132810 3C078000 */       lui $a3, 0x8000
  /* 148844 80132814 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 148848 80132818 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 14884C 8013281C 2409FFFF */     addiu $t1, $zero, -1
  /* 148850 80132820 AFA20068 */        sw $v0, 0x68($sp)
  /* 148854 80132824 AFA90010 */        sw $t1, 0x10($sp)
  /* 148858 80132828 AFA5002C */        sw $a1, 0x2c($sp)
  /* 14885C 8013282C 00402025 */        or $a0, $v0, $zero
  /* 148860 80132830 24060020 */     addiu $a2, $zero, 0x20
  /* 148864 80132834 0C00277D */       jal omAddGObjRenderProc
  /* 148868 80132838 3C078000 */       lui $a3, 0x8000
  /* 14886C 8013283C 8FA40068 */        lw $a0, 0x68($sp)
  /* 148870 80132840 3C058013 */       lui $a1, %hi(mnBonusSetPortraitX)
  /* 148874 80132844 24A52150 */     addiu $a1, $a1, %lo(mnBonusSetPortraitX)
  /* 148878 80132848 AC900084 */        sw $s0, 0x84($a0)
  /* 14887C 8013284C AFA50028 */        sw $a1, 0x28($sp)
  /* 148880 80132850 24060001 */     addiu $a2, $zero, 1
  /* 148884 80132854 0C002062 */       jal omAddGObjCommonProc
  /* 148888 80132858 24070001 */     addiu $a3, $zero, 1
  /* 14888C 8013285C 3C0A8013 */       lui $t2, %hi(D_ovl29_80137E08)
  /* 148890 80132860 8D4A7E08 */        lw $t2, %lo(D_ovl29_80137E08)($t2)
  /* 148894 80132864 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 148898 80132868 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 14889C 8013286C 8FA40068 */        lw $a0, 0x68($sp)
  /* 1488A0 80132870 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1488A4 80132874 014B2821 */      addu $a1, $t2, $t3
  /* 1488A8 80132878 2A010006 */      slti $at, $s0, 6
  /* 1488AC 8013287C 14200003 */      bnez $at, .L8013288C
  /* 1488B0 80132880 00403025 */        or $a2, $v0, $zero
  /* 1488B4 80132884 10000002 */         b .L80132890
  /* 1488B8 80132888 2603FFFA */     addiu $v1, $s0, -6
  .L8013288C:
  /* 1488BC 8013288C 02001825 */        or $v1, $s0, $zero
  .L80132890:
  /* 1488C0 80132890 00036080 */       sll $t4, $v1, 2
  /* 1488C4 80132894 01836023 */      subu $t4, $t4, $v1
  /* 1488C8 80132898 000C6080 */       sll $t4, $t4, 2
  /* 1488CC 8013289C 01836023 */      subu $t4, $t4, $v1
  /* 1488D0 801328A0 000C6080 */       sll $t4, $t4, 2
  /* 1488D4 801328A4 01836021 */      addu $t4, $t4, $v1
  /* 1488D8 801328A8 258D0019 */     addiu $t5, $t4, 0x19
  /* 1488DC 801328AC 448D2000 */      mtc1 $t5, $f4
  /* 1488E0 801328B0 2A010006 */      slti $at, $s0, 6
  /* 1488E4 801328B4 468021A0 */   cvt.s.w $f6, $f4
  /* 1488E8 801328B8 14200003 */      bnez $at, .L801328C8
  /* 1488EC 801328BC E4460058 */      swc1 $f6, 0x58($v0)
  /* 1488F0 801328C0 10000002 */         b .L801328CC
  /* 1488F4 801328C4 24030001 */     addiu $v1, $zero, 1
  .L801328C8:
  /* 1488F8 801328C8 00001825 */        or $v1, $zero, $zero
  .L801328CC:
  /* 1488FC 801328CC 00034080 */       sll $t0, $v1, 2
  /* 148900 801328D0 01034023 */      subu $t0, $t0, $v1
  /* 148904 801328D4 00084080 */       sll $t0, $t0, 2
  /* 148908 801328D8 01034023 */      subu $t0, $t0, $v1
  /* 14890C 801328DC 00084080 */       sll $t0, $t0, 2
  /* 148910 801328E0 01034023 */      subu $t0, $t0, $v1
  /* 148914 801328E4 250F0024 */     addiu $t7, $t0, 0x24
  /* 148918 801328E8 448F4000 */      mtc1 $t7, $f8
  /* 14891C 801328EC 00C02025 */        or $a0, $a2, $zero
  /* 148920 801328F0 02002825 */        or $a1, $s0, $zero
  /* 148924 801328F4 468042A0 */   cvt.s.w $f10, $f8
  /* 148928 801328F8 0C04C873 */       jal mnBonusInitializePortraitBackgroundPosition
  /* 14892C 801328FC E4CA005C */      swc1 $f10, 0x5c($a2)
  /* 148930 80132900 00002025 */        or $a0, $zero, $zero
  /* 148934 80132904 00002825 */        or $a1, $zero, $zero
  /* 148938 80132908 24060012 */     addiu $a2, $zero, 0x12
  /* 14893C 8013290C 0C00265A */       jal omMakeGObjSPAfter
  /* 148940 80132910 3C078000 */       lui $a3, 0x8000
  /* 148944 80132914 240EFFFF */     addiu $t6, $zero, -1
  /* 148948 80132918 AFA2006C */        sw $v0, 0x6c($sp)
  /* 14894C 8013291C AFAE0010 */        sw $t6, 0x10($sp)
  /* 148950 80132920 00402025 */        or $a0, $v0, $zero
  /* 148954 80132924 8FA5002C */        lw $a1, 0x2c($sp)
  /* 148958 80132928 2406001B */     addiu $a2, $zero, 0x1b
  /* 14895C 8013292C 0C00277D */       jal omAddGObjRenderProc
  /* 148960 80132930 3C078000 */       lui $a3, 0x8000
  /* 148964 80132934 8FA4006C */        lw $a0, 0x6c($sp)
  /* 148968 80132938 8FA50028 */        lw $a1, 0x28($sp)
  /* 14896C 8013293C 24060001 */     addiu $a2, $zero, 1
  /* 148970 80132940 0C002062 */       jal omAddGObjCommonProc
  /* 148974 80132944 24070001 */     addiu $a3, $zero, 1
  /* 148978 80132948 0C04C8E4 */       jal mnBonusGetFtKind
  /* 14897C 8013294C 02002025 */        or $a0, $s0, $zero
  /* 148980 80132950 0002C080 */       sll $t8, $v0, 2
  /* 148984 80132954 03B8C821 */      addu $t9, $sp, $t8
  /* 148988 80132958 3C098013 */       lui $t1, %hi(D_ovl29_80137E08)
  /* 14898C 8013295C 8D297E08 */        lw $t1, %lo(D_ovl29_80137E08)($t1)
  /* 148990 80132960 8F390034 */        lw $t9, 0x34($t9)
  /* 148994 80132964 8FA4006C */        lw $a0, 0x6c($sp)
  /* 148998 80132968 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14899C 8013296C 03292821 */      addu $a1, $t9, $t1
  /* 1489A0 80132970 944A0024 */       lhu $t2, 0x24($v0)
  /* 1489A4 80132974 2A010006 */      slti $at, $s0, 6
  /* 1489A8 80132978 00403025 */        or $a2, $v0, $zero
  /* 1489AC 8013297C 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 1489B0 80132980 A44C0024 */        sh $t4, 0x24($v0)
  /* 1489B4 80132984 358D0001 */       ori $t5, $t4, 1
  /* 1489B8 80132988 14200003 */      bnez $at, .L80132998
  /* 1489BC 8013298C A44D0024 */        sh $t5, 0x24($v0)
  /* 1489C0 80132990 10000002 */         b .L8013299C
  /* 1489C4 80132994 2603FFFA */     addiu $v1, $s0, -6
  .L80132998:
  /* 1489C8 80132998 02001825 */        or $v1, $s0, $zero
  .L8013299C:
  /* 1489CC 8013299C 00034080 */       sll $t0, $v1, 2
  /* 1489D0 801329A0 01034023 */      subu $t0, $t0, $v1
  /* 1489D4 801329A4 00084080 */       sll $t0, $t0, 2
  /* 1489D8 801329A8 01034023 */      subu $t0, $t0, $v1
  /* 1489DC 801329AC 00084080 */       sll $t0, $t0, 2
  /* 1489E0 801329B0 01034021 */      addu $t0, $t0, $v1
  /* 1489E4 801329B4 250F0019 */     addiu $t7, $t0, 0x19
  /* 1489E8 801329B8 448F8000 */      mtc1 $t7, $f16
  /* 1489EC 801329BC 2A010006 */      slti $at, $s0, 6
  /* 1489F0 801329C0 00001825 */        or $v1, $zero, $zero
  /* 1489F4 801329C4 468084A0 */   cvt.s.w $f18, $f16
  /* 1489F8 801329C8 14200003 */      bnez $at, .L801329D8
  /* 1489FC 801329CC E4520058 */      swc1 $f18, 0x58($v0)
  /* 148A00 801329D0 10000001 */         b .L801329D8
  /* 148A04 801329D4 24030001 */     addiu $v1, $zero, 1
  .L801329D8:
  /* 148A08 801329D8 00037080 */       sll $t6, $v1, 2
  /* 148A0C 801329DC 01C37023 */      subu $t6, $t6, $v1
  /* 148A10 801329E0 000E7080 */       sll $t6, $t6, 2
  /* 148A14 801329E4 01C37023 */      subu $t6, $t6, $v1
  /* 148A18 801329E8 000E7080 */       sll $t6, $t6, 2
  /* 148A1C 801329EC 01C37023 */      subu $t6, $t6, $v1
  /* 148A20 801329F0 25D80024 */     addiu $t8, $t6, 0x24
  /* 148A24 801329F4 44982000 */      mtc1 $t8, $f4
  /* 148A28 801329F8 02002025 */        or $a0, $s0, $zero
  /* 148A2C 801329FC 468021A0 */   cvt.s.w $f6, $f4
  /* 148A30 80132A00 E4C6005C */      swc1 $f6, 0x5c($a2)
  /* 148A34 80132A04 8FB9006C */        lw $t9, 0x6c($sp)
  /* 148A38 80132A08 AF300084 */        sw $s0, 0x84($t9)
  /* 148A3C 80132A0C 0C04C8E4 */       jal mnBonusGetFtKind
  /* 148A40 80132A10 AFA60064 */        sw $a2, 0x64($sp)
  /* 148A44 80132A14 0C04C851 */       jal mnBonusCheckFighterIsXBoxed
  /* 148A48 80132A18 00402025 */        or $a0, $v0, $zero
  /* 148A4C 80132A1C 10400006 */      beqz $v0, .L80132A38
  /* 148A50 80132A20 8FA60064 */        lw $a2, 0x64($sp)
  /* 148A54 80132A24 8FA4006C */        lw $a0, 0x6c($sp)
  /* 148A58 80132A28 02002825 */        or $a1, $s0, $zero
  /* 148A5C 80132A2C 0C04C88A */       jal mnBonusAddRedXBoxToPortrait
  /* 148A60 80132A30 AFA60064 */        sw $a2, 0x64($sp)
  /* 148A64 80132A34 8FA60064 */        lw $a2, 0x64($sp)
  .L80132A38:
  /* 148A68 80132A38 00C02025 */        or $a0, $a2, $zero
  /* 148A6C 80132A3C 0C04C873 */       jal mnBonusInitializePortraitBackgroundPosition
  /* 148A70 80132A40 02002825 */        or $a1, $s0, $zero
  /* 148A74 80132A44 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132A48:
  /* 148A78 80132A48 8FB00020 */        lw $s0, 0x20($sp)
  /* 148A7C 80132A4C 27BD0070 */     addiu $sp, $sp, 0x70
  /* 148A80 80132A50 03E00008 */        jr $ra
  /* 148A84 80132A54 00000000 */       nop

glabel mnBonusCreatePortraits
  /* 148A88 80132A58 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 148A8C 80132A5C AFB10018 */        sw $s1, 0x18($sp)
  /* 148A90 80132A60 AFB00014 */        sw $s0, 0x14($sp)
  /* 148A94 80132A64 AFBF001C */        sw $ra, 0x1c($sp)
  /* 148A98 80132A68 00008025 */        or $s0, $zero, $zero
  /* 148A9C 80132A6C 2411000C */     addiu $s1, $zero, 0xc
  .L80132A70:
  /* 148AA0 80132A70 0C04C9E6 */       jal mnBonusCreatePortrait
  /* 148AA4 80132A74 02002025 */        or $a0, $s0, $zero
  /* 148AA8 80132A78 26100001 */     addiu $s0, $s0, 1
  /* 148AAC 80132A7C 1611FFFC */       bne $s0, $s1, .L80132A70
  /* 148AB0 80132A80 00000000 */       nop
  /* 148AB4 80132A84 8FBF001C */        lw $ra, 0x1c($sp)
  /* 148AB8 80132A88 8FB00014 */        lw $s0, 0x14($sp)
  /* 148ABC 80132A8C 8FB10018 */        lw $s1, 0x18($sp)
  /* 148AC0 80132A90 03E00008 */        jr $ra
  /* 148AC4 80132A94 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBonusSetNameAndLogo
  /* 148AC8 80132A98 27BDFF20 */     addiu $sp, $sp, -0xe0
  /* 148ACC 80132A9C 3C0F8013 */       lui $t7, %hi(dMNBonusUnusedPositions)
  /* 148AD0 80132AA0 25EF7264 */     addiu $t7, $t7, %lo(dMNBonusUnusedPositions)
  /* 148AD4 80132AA4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 148AD8 80132AA8 AFA400E0 */        sw $a0, 0xe0($sp)
  /* 148ADC 80132AAC AFA500E4 */        sw $a1, 0xe4($sp)
  /* 148AE0 80132AB0 25E80060 */     addiu $t0, $t7, 0x60
  /* 148AE4 80132AB4 27AE007C */     addiu $t6, $sp, 0x7c
  .L80132AB8:
  /* 148AE8 80132AB8 8DF90000 */        lw $t9, ($t7) # dMNBonusUnusedPositions + 0
  /* 148AEC 80132ABC 25EF000C */     addiu $t7, $t7, 0xc
  /* 148AF0 80132AC0 25CE000C */     addiu $t6, $t6, 0xc
  /* 148AF4 80132AC4 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 148AF8 80132AC8 8DF8FFF8 */        lw $t8, -8($t7) # dMNBonusUnusedPositions + -8
  /* 148AFC 80132ACC ADD8FFF8 */        sw $t8, -8($t6)
  /* 148B00 80132AD0 8DF9FFFC */        lw $t9, -4($t7) # dMNBonusUnusedPositions + -4
  /* 148B04 80132AD4 15E8FFF8 */       bne $t7, $t0, .L80132AB8
  /* 148B08 80132AD8 ADD9FFFC */        sw $t9, -4($t6)
  /* 148B0C 80132ADC 3C0A8013 */       lui $t2, %hi(dMNBonusLogoOffsets)
  /* 148B10 80132AE0 254A72C4 */     addiu $t2, $t2, %lo(dMNBonusLogoOffsets)
  /* 148B14 80132AE4 254D0030 */     addiu $t5, $t2, 0x30
  /* 148B18 80132AE8 27A9004C */     addiu $t1, $sp, 0x4c
  .L80132AEC:
  /* 148B1C 80132AEC 8D4C0000 */        lw $t4, ($t2) # dMNBonusLogoOffsets + 0
  /* 148B20 80132AF0 254A000C */     addiu $t2, $t2, 0xc
  /* 148B24 80132AF4 2529000C */     addiu $t1, $t1, 0xc
  /* 148B28 80132AF8 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 148B2C 80132AFC 8D4BFFF8 */        lw $t3, -8($t2) # dMNBonusLogoOffsets + -8
  /* 148B30 80132B00 AD2BFFF8 */        sw $t3, -8($t1)
  /* 148B34 80132B04 8D4CFFFC */        lw $t4, -4($t2) # dMNBonusLogoOffsets + -4
  /* 148B38 80132B08 154DFFF8 */       bne $t2, $t5, .L80132AEC
  /* 148B3C 80132B0C AD2CFFFC */        sw $t4, -4($t1)
  /* 148B40 80132B10 3C0F8013 */       lui $t7, %hi(dMNBonusNameOffsets)
  /* 148B44 80132B14 25EF72F4 */     addiu $t7, $t7, %lo(dMNBonusNameOffsets)
  /* 148B48 80132B18 25F90030 */     addiu $t9, $t7, 0x30
  /* 148B4C 80132B1C 27A8001C */     addiu $t0, $sp, 0x1c
  .L80132B20:
  /* 148B50 80132B20 8DF80000 */        lw $t8, ($t7) # dMNBonusNameOffsets + 0
  /* 148B54 80132B24 25EF000C */     addiu $t7, $t7, 0xc
  /* 148B58 80132B28 2508000C */     addiu $t0, $t0, 0xc
  /* 148B5C 80132B2C AD18FFF4 */        sw $t8, -0xc($t0)
  /* 148B60 80132B30 8DEEFFF8 */        lw $t6, -8($t7) # dMNBonusNameOffsets + -8
  /* 148B64 80132B34 AD0EFFF8 */        sw $t6, -8($t0)
  /* 148B68 80132B38 8DF8FFFC */        lw $t8, -4($t7) # dMNBonusNameOffsets + -4
  /* 148B6C 80132B3C 15F9FFF8 */       bne $t7, $t9, .L80132B20
  /* 148B70 80132B40 AD18FFFC */        sw $t8, -4($t0)
  /* 148B74 80132B44 2401001C */     addiu $at, $zero, 0x1c
  /* 148B78 80132B48 10C1002E */       beq $a2, $at, .L80132C04
  /* 148B7C 80132B4C 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 148B80 80132B50 0C002DD8 */       jal func_8000B760
  /* 148B84 80132B54 AFA600E8 */        sw $a2, 0xe8($sp)
  /* 148B88 80132B58 8FA600E8 */        lw $a2, 0xe8($sp)
  /* 148B8C 80132B5C 3C0A8013 */       lui $t2, %hi(D_ovl29_80137DFC)
  /* 148B90 80132B60 8D4A7DFC */        lw $t2, %lo(D_ovl29_80137DFC)($t2)
  /* 148B94 80132B64 00061880 */       sll $v1, $a2, 2
  /* 148B98 80132B68 03A36821 */      addu $t5, $sp, $v1
  /* 148B9C 80132B6C 8DAD004C */        lw $t5, 0x4c($t5)
  /* 148BA0 80132B70 AFA30018 */        sw $v1, 0x18($sp)
  /* 148BA4 80132B74 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 148BA8 80132B78 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 148BAC 80132B7C 01AA2821 */      addu $a1, $t5, $t2
  /* 148BB0 80132B80 8FA30018 */        lw $v1, 0x18($sp)
  /* 148BB4 80132B84 94490024 */       lhu $t1, 0x24($v0)
  /* 148BB8 80132B88 3C014288 */       lui $at, (0x42880000 >> 16) # 68.0
  /* 148BBC 80132B8C 44812000 */      mtc1 $at, $f4 # 68.0 to cop1
  /* 148BC0 80132B90 3C014310 */       lui $at, (0x43100000 >> 16) # 144.0
  /* 148BC4 80132B94 44813000 */      mtc1 $at, $f6 # 144.0 to cop1
  /* 148BC8 80132B98 312CFFDF */      andi $t4, $t1, 0xffdf
  /* 148BCC 80132B9C A44C0024 */        sh $t4, 0x24($v0)
  /* 148BD0 80132BA0 35990001 */       ori $t9, $t4, 1
  /* 148BD4 80132BA4 A4590024 */        sh $t9, 0x24($v0)
  /* 148BD8 80132BA8 A0400028 */        sb $zero, 0x28($v0)
  /* 148BDC 80132BAC A0400029 */        sb $zero, 0x29($v0)
  /* 148BE0 80132BB0 A040002A */        sb $zero, 0x2a($v0)
  /* 148BE4 80132BB4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 148BE8 80132BB8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 148BEC 80132BBC 3C088013 */       lui $t0, %hi(D_ovl29_80137DF8)
  /* 148BF0 80132BC0 03A37821 */      addu $t7, $sp, $v1
  /* 148BF4 80132BC4 8DEF001C */        lw $t7, 0x1c($t7)
  /* 148BF8 80132BC8 8D087DF8 */        lw $t0, %lo(D_ovl29_80137DF8)($t0)
  /* 148BFC 80132BCC 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 148C00 80132BD0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 148C04 80132BD4 01E82821 */      addu $a1, $t7, $t0
  /* 148C08 80132BD8 944E0024 */       lhu $t6, 0x24($v0)
  /* 148C0C 80132BDC 3C014284 */       lui $at, (0x42840000 >> 16) # 66.0
  /* 148C10 80132BE0 44814000 */      mtc1 $at, $f8 # 66.0 to cop1
  /* 148C14 80132BE4 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 148C18 80132BE8 44815000 */      mtc1 $at, $f10 # 202.0 to cop1
  /* 148C1C 80132BEC 31CDFFDF */      andi $t5, $t6, 0xffdf
  /* 148C20 80132BF0 A44D0024 */        sh $t5, 0x24($v0)
  /* 148C24 80132BF4 35AA0001 */       ori $t2, $t5, 1
  /* 148C28 80132BF8 A44A0024 */        sh $t2, 0x24($v0)
  /* 148C2C 80132BFC E4480058 */      swc1 $f8, 0x58($v0)
  /* 148C30 80132C00 E44A005C */      swc1 $f10, 0x5c($v0)
  .L80132C04:
  /* 148C34 80132C04 8FBF0014 */        lw $ra, 0x14($sp)
  /* 148C38 80132C08 27BD00E0 */     addiu $sp, $sp, 0xe0
  /* 148C3C 80132C0C 03E00008 */        jr $ra
  /* 148C40 80132C10 00000000 */       nop

glabel mnBonusCreatePortraitViewport
  /* 148C44 80132C14 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 148C48 80132C18 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 148C4C 80132C1C AFBF003C */        sw $ra, 0x3c($sp)
  /* 148C50 80132C20 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 148C54 80132C24 240F0028 */     addiu $t7, $zero, 0x28
  /* 148C58 80132C28 24180000 */     addiu $t8, $zero, 0
  /* 148C5C 80132C2C 3C190800 */       lui $t9, 0x800
  /* 148C60 80132C30 2408FFFF */     addiu $t0, $zero, -1
  /* 148C64 80132C34 24090001 */     addiu $t1, $zero, 1
  /* 148C68 80132C38 240A0001 */     addiu $t2, $zero, 1
  /* 148C6C 80132C3C AFAA0030 */        sw $t2, 0x30($sp)
  /* 148C70 80132C40 AFA90028 */        sw $t1, 0x28($sp)
  /* 148C74 80132C44 AFA80020 */        sw $t0, 0x20($sp)
  /* 148C78 80132C48 AFB9001C */        sw $t9, 0x1c($sp)
  /* 148C7C 80132C4C AFB80018 */        sw $t8, 0x18($sp)
  /* 148C80 80132C50 AFAF0014 */        sw $t7, 0x14($sp)
  /* 148C84 80132C54 AFAE0010 */        sw $t6, 0x10($sp)
  /* 148C88 80132C58 AFA00024 */        sw $zero, 0x24($sp)
  /* 148C8C 80132C5C AFA0002C */        sw $zero, 0x2c($sp)
  /* 148C90 80132C60 AFA00034 */        sw $zero, 0x34($sp)
  /* 148C94 80132C64 24040401 */     addiu $a0, $zero, 0x401
  /* 148C98 80132C68 00002825 */        or $a1, $zero, $zero
  /* 148C9C 80132C6C 24060010 */     addiu $a2, $zero, 0x10
  /* 148CA0 80132C70 0C002E4F */       jal func_8000B93C
  /* 148CA4 80132C74 3C078000 */       lui $a3, 0x8000
  /* 148CA8 80132C78 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 148CAC 80132C7C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 148CB0 80132C80 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 148CB4 80132C84 8C430074 */        lw $v1, 0x74($v0)
  /* 148CB8 80132C88 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 148CBC 80132C8C 44050000 */      mfc1 $a1, $f0
  /* 148CC0 80132C90 44060000 */      mfc1 $a2, $f0
  /* 148CC4 80132C94 3C07439B */       lui $a3, 0x439b
  /* 148CC8 80132C98 24640008 */     addiu $a0, $v1, 8
  /* 148CCC 80132C9C 0C001C20 */       jal func_80007080
  /* 148CD0 80132CA0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 148CD4 80132CA4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 148CD8 80132CA8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 148CDC 80132CAC 03E00008 */        jr $ra
  /* 148CE0 80132CB0 00000000 */       nop

glabel mnBonusCreatePortraitBackgroundViewport
  /* 148CE4 80132CB4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 148CE8 80132CB8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 148CEC 80132CBC AFBF003C */        sw $ra, 0x3c($sp)
  /* 148CF0 80132CC0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 148CF4 80132CC4 240F003C */     addiu $t7, $zero, 0x3c
  /* 148CF8 80132CC8 24180001 */     addiu $t8, $zero, 1
  /* 148CFC 80132CCC 24190000 */     addiu $t9, $zero, 0
  /* 148D00 80132CD0 2408FFFF */     addiu $t0, $zero, -1
  /* 148D04 80132CD4 24090001 */     addiu $t1, $zero, 1
  /* 148D08 80132CD8 240A0001 */     addiu $t2, $zero, 1
  /* 148D0C 80132CDC AFAA0030 */        sw $t2, 0x30($sp)
  /* 148D10 80132CE0 AFA90028 */        sw $t1, 0x28($sp)
  /* 148D14 80132CE4 AFA80020 */        sw $t0, 0x20($sp)
  /* 148D18 80132CE8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 148D1C 80132CEC AFB80018 */        sw $t8, 0x18($sp)
  /* 148D20 80132CF0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 148D24 80132CF4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 148D28 80132CF8 AFA00024 */        sw $zero, 0x24($sp)
  /* 148D2C 80132CFC AFA0002C */        sw $zero, 0x2c($sp)
  /* 148D30 80132D00 AFA00034 */        sw $zero, 0x34($sp)
  /* 148D34 80132D04 24040401 */     addiu $a0, $zero, 0x401
  /* 148D38 80132D08 00002825 */        or $a1, $zero, $zero
  /* 148D3C 80132D0C 24060010 */     addiu $a2, $zero, 0x10
  /* 148D40 80132D10 0C002E4F */       jal func_8000B93C
  /* 148D44 80132D14 3C078000 */       lui $a3, 0x8000
  /* 148D48 80132D18 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 148D4C 80132D1C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 148D50 80132D20 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 148D54 80132D24 8C430074 */        lw $v1, 0x74($v0)
  /* 148D58 80132D28 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 148D5C 80132D2C 44050000 */      mfc1 $a1, $f0
  /* 148D60 80132D30 44060000 */      mfc1 $a2, $f0
  /* 148D64 80132D34 3C07439B */       lui $a3, 0x439b
  /* 148D68 80132D38 24640008 */     addiu $a0, $v1, 8
  /* 148D6C 80132D3C 0C001C20 */       jal func_80007080
  /* 148D70 80132D40 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 148D74 80132D44 8FBF003C */        lw $ra, 0x3c($sp)
  /* 148D78 80132D48 27BD0040 */     addiu $sp, $sp, 0x40
  /* 148D7C 80132D4C 03E00008 */        jr $ra
  /* 148D80 80132D50 00000000 */       nop

glabel mnBonusCreatePortraitWhiteBackgroundViewport
  /* 148D84 80132D54 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 148D88 80132D58 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 148D8C 80132D5C AFBF003C */        sw $ra, 0x3c($sp)
  /* 148D90 80132D60 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 148D94 80132D64 240F0032 */     addiu $t7, $zero, 0x32
  /* 148D98 80132D68 24180002 */     addiu $t8, $zero, 2
  /* 148D9C 80132D6C 24190000 */     addiu $t9, $zero, 0
  /* 148DA0 80132D70 2408FFFF */     addiu $t0, $zero, -1
  /* 148DA4 80132D74 24090001 */     addiu $t1, $zero, 1
  /* 148DA8 80132D78 240A0001 */     addiu $t2, $zero, 1
  /* 148DAC 80132D7C AFAA0030 */        sw $t2, 0x30($sp)
  /* 148DB0 80132D80 AFA90028 */        sw $t1, 0x28($sp)
  /* 148DB4 80132D84 AFA80020 */        sw $t0, 0x20($sp)
  /* 148DB8 80132D88 AFB9001C */        sw $t9, 0x1c($sp)
  /* 148DBC 80132D8C AFB80018 */        sw $t8, 0x18($sp)
  /* 148DC0 80132D90 AFAF0014 */        sw $t7, 0x14($sp)
  /* 148DC4 80132D94 AFAE0010 */        sw $t6, 0x10($sp)
  /* 148DC8 80132D98 AFA00024 */        sw $zero, 0x24($sp)
  /* 148DCC 80132D9C AFA0002C */        sw $zero, 0x2c($sp)
  /* 148DD0 80132DA0 AFA00034 */        sw $zero, 0x34($sp)
  /* 148DD4 80132DA4 24040401 */     addiu $a0, $zero, 0x401
  /* 148DD8 80132DA8 00002825 */        or $a1, $zero, $zero
  /* 148DDC 80132DAC 24060010 */     addiu $a2, $zero, 0x10
  /* 148DE0 80132DB0 0C002E4F */       jal func_8000B93C
  /* 148DE4 80132DB4 3C078000 */       lui $a3, 0x8000
  /* 148DE8 80132DB8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 148DEC 80132DBC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 148DF0 80132DC0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 148DF4 80132DC4 8C430074 */        lw $v1, 0x74($v0)
  /* 148DF8 80132DC8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 148DFC 80132DCC 44050000 */      mfc1 $a1, $f0
  /* 148E00 80132DD0 44060000 */      mfc1 $a2, $f0
  /* 148E04 80132DD4 3C07439B */       lui $a3, 0x439b
  /* 148E08 80132DD8 24640008 */     addiu $a0, $v1, 8
  /* 148E0C 80132DDC 0C001C20 */       jal func_80007080
  /* 148E10 80132DE0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 148E14 80132DE4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 148E18 80132DE8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 148E1C 80132DEC 03E00008 */        jr $ra
  /* 148E20 80132DF0 00000000 */       nop

glabel mnBonusCreatePanelViewport
  /* 148E24 80132DF4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 148E28 80132DF8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 148E2C 80132DFC AFBF003C */        sw $ra, 0x3c($sp)
  /* 148E30 80132E00 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 148E34 80132E04 240F001E */     addiu $t7, $zero, 0x1e
  /* 148E38 80132E08 24180000 */     addiu $t8, $zero, 0
  /* 148E3C 80132E0C 3C191000 */       lui $t9, 0x1000
  /* 148E40 80132E10 2408FFFF */     addiu $t0, $zero, -1
  /* 148E44 80132E14 24090001 */     addiu $t1, $zero, 1
  /* 148E48 80132E18 240A0001 */     addiu $t2, $zero, 1
  /* 148E4C 80132E1C AFAA0030 */        sw $t2, 0x30($sp)
  /* 148E50 80132E20 AFA90028 */        sw $t1, 0x28($sp)
  /* 148E54 80132E24 AFA80020 */        sw $t0, 0x20($sp)
  /* 148E58 80132E28 AFB9001C */        sw $t9, 0x1c($sp)
  /* 148E5C 80132E2C AFB80018 */        sw $t8, 0x18($sp)
  /* 148E60 80132E30 AFAF0014 */        sw $t7, 0x14($sp)
  /* 148E64 80132E34 AFAE0010 */        sw $t6, 0x10($sp)
  /* 148E68 80132E38 AFA00024 */        sw $zero, 0x24($sp)
  /* 148E6C 80132E3C AFA0002C */        sw $zero, 0x2c($sp)
  /* 148E70 80132E40 AFA00034 */        sw $zero, 0x34($sp)
  /* 148E74 80132E44 24040401 */     addiu $a0, $zero, 0x401
  /* 148E78 80132E48 00002825 */        or $a1, $zero, $zero
  /* 148E7C 80132E4C 24060010 */     addiu $a2, $zero, 0x10
  /* 148E80 80132E50 0C002E4F */       jal func_8000B93C
  /* 148E84 80132E54 3C078000 */       lui $a3, 0x8000
  /* 148E88 80132E58 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 148E8C 80132E5C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 148E90 80132E60 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 148E94 80132E64 8C430074 */        lw $v1, 0x74($v0)
  /* 148E98 80132E68 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 148E9C 80132E6C 44050000 */      mfc1 $a1, $f0
  /* 148EA0 80132E70 44060000 */      mfc1 $a2, $f0
  /* 148EA4 80132E74 3C07439B */       lui $a3, 0x439b
  /* 148EA8 80132E78 24640008 */     addiu $a0, $v1, 8
  /* 148EAC 80132E7C 0C001C20 */       jal func_80007080
  /* 148EB0 80132E80 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 148EB4 80132E84 8FBF003C */        lw $ra, 0x3c($sp)
  /* 148EB8 80132E88 27BD0040 */     addiu $sp, $sp, 0x40
  /* 148EBC 80132E8C 03E00008 */        jr $ra
  /* 148EC0 80132E90 00000000 */       nop

glabel mnBonusUpdatePanel
  /* 148EC4 80132E94 3C0E8013 */       lui $t6, %hi(dMNBonusPanelOffsets)
  /* 148EC8 80132E98 25CE7324 */     addiu $t6, $t6, %lo(dMNBonusPanelOffsets)
  /* 148ECC 80132E9C 8DD80000 */        lw $t8, ($t6) # dMNBonusPanelOffsets + 0
  /* 148ED0 80132EA0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 148ED4 80132EA4 27A30004 */     addiu $v1, $sp, 4
  /* 148ED8 80132EA8 AC780000 */        sw $t8, ($v1)
  /* 148EDC 80132EAC 8DCF0004 */        lw $t7, 4($t6) # dMNBonusPanelOffsets + 4
  /* 148EE0 80132EB0 0005C880 */       sll $t9, $a1, 2
  /* 148EE4 80132EB4 00794021 */      addu $t0, $v1, $t9
  /* 148EE8 80132EB8 AC6F0004 */        sw $t7, 4($v1)
  /* 148EEC 80132EBC 8DD80008 */        lw $t8, 8($t6) # dMNBonusPanelOffsets + 8
  /* 148EF0 80132EC0 3C0A8013 */       lui $t2, %hi(D_ovl29_80137DF8)
  /* 148EF4 80132EC4 AC780008 */        sw $t8, 8($v1)
  /* 148EF8 80132EC8 8DCF000C */        lw $t7, 0xc($t6) # dMNBonusPanelOffsets + 12
  /* 148EFC 80132ECC AC6F000C */        sw $t7, 0xc($v1)
  /* 148F00 80132ED0 8D4A7DF8 */        lw $t2, %lo(D_ovl29_80137DF8)($t2)
  /* 148F04 80132ED4 8D090000 */        lw $t1, ($t0)
  /* 148F08 80132ED8 8C820074 */        lw $v0, 0x74($a0)
  /* 148F0C 80132EDC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 148F10 80132EE0 012A5821 */      addu $t3, $t1, $t2
  /* 148F14 80132EE4 03E00008 */        jr $ra
  /* 148F18 80132EE8 AC4B0030 */        sw $t3, 0x30($v0)

glabel mnBonusCreatePanel
  /* 148F1C 80132EEC 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 148F20 80132EF0 3C0F8013 */       lui $t7, %hi(dMNBonusTypeOffsets)
  /* 148F24 80132EF4 AFBF0034 */        sw $ra, 0x34($sp)
  /* 148F28 80132EF8 AFA40070 */        sw $a0, 0x70($sp)
  /* 148F2C 80132EFC 25EF7334 */     addiu $t7, $t7, %lo(dMNBonusTypeOffsets)
  /* 148F30 80132F00 8DF90000 */        lw $t9, ($t7) # dMNBonusTypeOffsets + 0
  /* 148F34 80132F04 8DF80004 */        lw $t8, 4($t7) # dMNBonusTypeOffsets + 4
  /* 148F38 80132F08 27AE0058 */     addiu $t6, $sp, 0x58
  /* 148F3C 80132F0C ADD90000 */        sw $t9, ($t6)
  /* 148F40 80132F10 ADD80004 */        sw $t8, 4($t6)
  /* 148F44 80132F14 8DF8000C */        lw $t8, 0xc($t7) # dMNBonusTypeOffsets + 12
  /* 148F48 80132F18 8DF90008 */        lw $t9, 8($t7) # dMNBonusTypeOffsets + 8
  /* 148F4C 80132F1C 3C098013 */       lui $t1, %hi(dMNBonusTypeOffsetsX)
  /* 148F50 80132F20 25297344 */     addiu $t1, $t1, %lo(dMNBonusTypeOffsetsX)
  /* 148F54 80132F24 ADD8000C */        sw $t8, 0xc($t6)
  /* 148F58 80132F28 ADD90008 */        sw $t9, 8($t6)
  /* 148F5C 80132F2C 8D2A0004 */        lw $t2, 4($t1) # dMNBonusTypeOffsetsX + 4
  /* 148F60 80132F30 8D2B0000 */        lw $t3, ($t1) # dMNBonusTypeOffsetsX + 0
  /* 148F64 80132F34 27A80048 */     addiu $t0, $sp, 0x48
  /* 148F68 80132F38 AD0A0004 */        sw $t2, 4($t0)
  /* 148F6C 80132F3C AD0B0000 */        sw $t3, ($t0)
  /* 148F70 80132F40 8D2B0008 */        lw $t3, 8($t1) # dMNBonusTypeOffsetsX + 8
  /* 148F74 80132F44 8D2A000C */        lw $t2, 0xc($t1) # dMNBonusTypeOffsetsX + 12
  /* 148F78 80132F48 3C0E8013 */       lui $t6, %hi(D_ovl29_80137E0C)
  /* 148F7C 80132F4C AD0B0008 */        sw $t3, 8($t0)
  /* 148F80 80132F50 AD0A000C */        sw $t2, 0xc($t0)
  /* 148F84 80132F54 8DCE7E0C */        lw $t6, %lo(D_ovl29_80137E0C)($t6)
  /* 148F88 80132F58 3C0F0000 */       lui $t7, %hi(D_NF_000032A8)
  /* 148F8C 80132F5C 25EF32A8 */     addiu $t7, $t7, %lo(D_NF_000032A8)
  /* 148F90 80132F60 3C02800D */       lui $v0, %hi(func_ovl0_800CCF00)
  /* 148F94 80132F64 3C078000 */       lui $a3, 0x8000
  /* 148F98 80132F68 2442CF00 */     addiu $v0, $v0, %lo(func_ovl0_800CCF00)
  /* 148F9C 80132F6C 24080001 */     addiu $t0, $zero, 1
  /* 148FA0 80132F70 24190001 */     addiu $t9, $zero, 1
  /* 148FA4 80132F74 240C001C */     addiu $t4, $zero, 0x1c
  /* 148FA8 80132F78 240DFFFF */     addiu $t5, $zero, -1
  /* 148FAC 80132F7C 01CFC021 */      addu $t8, $t6, $t7
  /* 148FB0 80132F80 AFB80020 */        sw $t8, 0x20($sp)
  /* 148FB4 80132F84 AFAD001C */        sw $t5, 0x1c($sp)
  /* 148FB8 80132F88 AFAC0014 */        sw $t4, 0x14($sp)
  /* 148FBC 80132F8C AFB90024 */        sw $t9, 0x24($sp)
  /* 148FC0 80132F90 AFA8002C */        sw $t0, 0x2c($sp)
  /* 148FC4 80132F94 AFA20010 */        sw $v0, 0x10($sp)
  /* 148FC8 80132F98 AFA20044 */        sw $v0, 0x44($sp)
  /* 148FCC 80132F9C AFA70018 */        sw $a3, 0x18($sp)
  /* 148FD0 80132FA0 AFA00028 */        sw $zero, 0x28($sp)
  /* 148FD4 80132FA4 00002025 */        or $a0, $zero, $zero
  /* 148FD8 80132FA8 00002825 */        or $a1, $zero, $zero
  /* 148FDC 80132FAC 0C033414 */       jal func_ovl0_800CD050
  /* 148FE0 80132FB0 24060016 */     addiu $a2, $zero, 0x16
  /* 148FE4 80132FB4 AFA2006C */        sw $v0, 0x6c($sp)
  /* 148FE8 80132FB8 3C014268 */       lui $at, (0x42680000 >> 16) # 58.0
  /* 148FEC 80132FBC 44812000 */      mtc1 $at, $f4 # 58.0 to cop1
  /* 148FF0 80132FC0 8C490074 */        lw $t1, 0x74($v0)
  /* 148FF4 80132FC4 3C0142FE */       lui $at, (0x42FE0000 >> 16) # 127.0
  /* 148FF8 80132FC8 44813000 */      mtc1 $at, $f6 # 127.0 to cop1
  /* 148FFC 80132FCC E5240058 */      swc1 $f4, 0x58($t1)
  /* 149000 80132FD0 8C4A0074 */        lw $t2, 0x74($v0)
  /* 149004 80132FD4 3C018013 */       lui $at, %hi(D_ovl29_8013765C)
  /* 149008 80132FD8 3C188013 */       lui $t8, %hi(D_ovl29_80137DF8)
  /* 14900C 80132FDC E546005C */      swc1 $f6, 0x5c($t2)
  /* 149010 80132FE0 8C430074 */        lw $v1, 0x74($v0)
  /* 149014 80132FE4 00402025 */        or $a0, $v0, $zero
  /* 149018 80132FE8 946B0024 */       lhu $t3, 0x24($v1)
  /* 14901C 80132FEC 316CFFDF */      andi $t4, $t3, 0xffdf
  /* 149020 80132FF0 A46C0024 */        sh $t4, 0x24($v1)
  /* 149024 80132FF4 8C430074 */        lw $v1, 0x74($v0)
  /* 149028 80132FF8 946D0024 */       lhu $t5, 0x24($v1)
  /* 14902C 80132FFC 35AE0001 */       ori $t6, $t5, 1
  /* 149030 80133000 A46E0024 */        sh $t6, 0x24($v1)
  /* 149034 80133004 8FA60070 */        lw $a2, 0x70($sp)
  /* 149038 80133008 AC22765C */        sw $v0, %lo(D_ovl29_8013765C)($at)
  /* 14903C 8013300C 8F187DF8 */        lw $t8, %lo(D_ovl29_80137DF8)($t8)
  /* 149040 80133010 00063080 */       sll $a2, $a2, 2
  /* 149044 80133014 03A67821 */      addu $t7, $sp, $a2
  /* 149048 80133018 8DEF0058 */        lw $t7, 0x58($t7)
  /* 14904C 8013301C AFA60040 */        sw $a2, 0x40($sp)
  /* 149050 80133020 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149054 80133024 01F82821 */      addu $a1, $t7, $t8
  /* 149058 80133028 8FA60040 */        lw $a2, 0x40($sp)
  /* 14905C 8013302C 3C014268 */       lui $at, (0x42680000 >> 16) # 58.0
  /* 149060 80133030 44815000 */      mtc1 $at, $f10 # 58.0 to cop1
  /* 149064 80133034 03A6C821 */      addu $t9, $sp, $a2
  /* 149068 80133038 C7280048 */      lwc1 $f8, 0x48($t9)
  /* 14906C 8013303C 94480024 */       lhu $t0, 0x24($v0)
  /* 149070 80133040 3C014304 */       lui $at, (0x43040000 >> 16) # 132.0
  /* 149074 80133044 460A4400 */     add.s $f16, $f8, $f10
  /* 149078 80133048 44819000 */      mtc1 $at, $f18 # 132.0 to cop1
  /* 14907C 8013304C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 149080 80133050 A44A0024 */        sh $t2, 0x24($v0)
  /* 149084 80133054 354B0001 */       ori $t3, $t2, 1
  /* 149088 80133058 E4500058 */      swc1 $f16, 0x58($v0)
  /* 14908C 8013305C A44B0024 */        sh $t3, 0x24($v0)
  /* 149090 80133060 A0400028 */        sb $zero, 0x28($v0)
  /* 149094 80133064 A0400029 */        sb $zero, 0x29($v0)
  /* 149098 80133068 A040002A */        sb $zero, 0x2a($v0)
  /* 14909C 8013306C E452005C */      swc1 $f18, 0x5c($v0)
  /* 1490A0 80133070 8FA50070 */        lw $a1, 0x70($sp)
  /* 1490A4 80133074 0C04CBA5 */       jal mnBonusUpdatePanel
  /* 1490A8 80133078 8FA4006C */        lw $a0, 0x6c($sp)
  /* 1490AC 8013307C 00002025 */        or $a0, $zero, $zero
  /* 1490B0 80133080 00002825 */        or $a1, $zero, $zero
  /* 1490B4 80133084 24060016 */     addiu $a2, $zero, 0x16
  /* 1490B8 80133088 0C00265A */       jal omMakeGObjSPAfter
  /* 1490BC 8013308C 3C078000 */       lui $a3, 0x8000
  /* 1490C0 80133090 3C018013 */       lui $at, %hi(D_ovl29_80137654)
  /* 1490C4 80133094 240CFFFF */     addiu $t4, $zero, -1
  /* 1490C8 80133098 AC227654 */        sw $v0, %lo(D_ovl29_80137654)($at)
  /* 1490CC 8013309C AFAC0010 */        sw $t4, 0x10($sp)
  /* 1490D0 801330A0 00402025 */        or $a0, $v0, $zero
  /* 1490D4 801330A4 8FA50044 */        lw $a1, 0x44($sp)
  /* 1490D8 801330A8 2406001C */     addiu $a2, $zero, 0x1c
  /* 1490DC 801330AC 0C00277D */       jal omAddGObjRenderProc
  /* 1490E0 801330B0 3C078000 */       lui $a3, 0x8000
  /* 1490E4 801330B4 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1490E8 801330B8 27BD0070 */     addiu $sp, $sp, 0x70
  /* 1490EC 801330BC 03E00008 */        jr $ra
  /* 1490F0 801330C0 00000000 */       nop

  /* 1490F4 801330C4 03E00008 */        jr $ra
  /* 1490F8 801330C8 00000000 */       nop

glabel mnBonusCreateBackground
  /* 1490FC 801330CC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 149100 801330D0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 149104 801330D4 00002025 */        or $a0, $zero, $zero
  /* 149108 801330D8 00002825 */        or $a1, $zero, $zero
  /* 14910C 801330DC 24060011 */     addiu $a2, $zero, 0x11
  /* 149110 801330E0 0C00265A */       jal omMakeGObjSPAfter
  /* 149114 801330E4 3C078000 */       lui $a3, 0x8000
  /* 149118 801330E8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 14911C 801330EC 240EFFFF */     addiu $t6, $zero, -1
  /* 149120 801330F0 AFA20024 */        sw $v0, 0x24($sp)
  /* 149124 801330F4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 149128 801330F8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 14912C 801330FC 00402025 */        or $a0, $v0, $zero
  /* 149130 80133100 2406001A */     addiu $a2, $zero, 0x1a
  /* 149134 80133104 0C00277D */       jal omAddGObjRenderProc
  /* 149138 80133108 3C078000 */       lui $a3, 0x8000
  /* 14913C 8013310C 3C0F8013 */       lui $t7, %hi(D_ovl29_80137E00)
  /* 149140 80133110 8DEF7E00 */        lw $t7, %lo(D_ovl29_80137E00)($t7)
  /* 149144 80133114 3C180000 */       lui $t8, %hi(D_NF_00000440)
  /* 149148 80133118 27180440 */     addiu $t8, $t8, %lo(D_NF_00000440)
  /* 14914C 8013311C 8FA40024 */        lw $a0, 0x24($sp)
  /* 149150 80133120 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149154 80133124 01F82821 */      addu $a1, $t7, $t8
  /* 149158 80133128 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14915C 8013312C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 149160 80133130 24190006 */     addiu $t9, $zero, 6
  /* 149164 80133134 24080005 */     addiu $t0, $zero, 5
  /* 149168 80133138 2409012C */     addiu $t1, $zero, 0x12c
  /* 14916C 8013313C 240A00DC */     addiu $t2, $zero, 0xdc
  /* 149170 80133140 A0400065 */        sb $zero, 0x65($v0)
  /* 149174 80133144 A0400064 */        sb $zero, 0x64($v0)
  /* 149178 80133148 A0590067 */        sb $t9, 0x67($v0)
  /* 14917C 8013314C A0480066 */        sb $t0, 0x66($v0)
  /* 149180 80133150 A4490068 */        sh $t1, 0x68($v0)
  /* 149184 80133154 A44A006A */        sh $t2, 0x6a($v0)
  /* 149188 80133158 E4400058 */      swc1 $f0, 0x58($v0)
  /* 14918C 8013315C E440005C */      swc1 $f0, 0x5c($v0)
  /* 149190 80133160 8FBF001C */        lw $ra, 0x1c($sp)
  /* 149194 80133164 27BD0028 */     addiu $sp, $sp, 0x28
  /* 149198 80133168 03E00008 */        jr $ra
  /* 14919C 8013316C 00000000 */       nop

glabel mnBonusCreateBackgroundViewport
  /* 1491A0 80133170 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1491A4 80133174 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1491A8 80133178 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1491AC 8013317C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1491B0 80133180 240F0050 */     addiu $t7, $zero, 0x50
  /* 1491B4 80133184 24180000 */     addiu $t8, $zero, 0
  /* 1491B8 80133188 3C190400 */       lui $t9, 0x400
  /* 1491BC 8013318C 2408FFFF */     addiu $t0, $zero, -1
  /* 1491C0 80133190 24090001 */     addiu $t1, $zero, 1
  /* 1491C4 80133194 240A0001 */     addiu $t2, $zero, 1
  /* 1491C8 80133198 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1491CC 8013319C AFA90028 */        sw $t1, 0x28($sp)
  /* 1491D0 801331A0 AFA80020 */        sw $t0, 0x20($sp)
  /* 1491D4 801331A4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1491D8 801331A8 AFB80018 */        sw $t8, 0x18($sp)
  /* 1491DC 801331AC AFAF0014 */        sw $t7, 0x14($sp)
  /* 1491E0 801331B0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1491E4 801331B4 AFA00024 */        sw $zero, 0x24($sp)
  /* 1491E8 801331B8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1491EC 801331BC AFA00034 */        sw $zero, 0x34($sp)
  /* 1491F0 801331C0 24040401 */     addiu $a0, $zero, 0x401
  /* 1491F4 801331C4 00002825 */        or $a1, $zero, $zero
  /* 1491F8 801331C8 24060010 */     addiu $a2, $zero, 0x10
  /* 1491FC 801331CC 0C002E4F */       jal func_8000B93C
  /* 149200 801331D0 3C078000 */       lui $a3, 0x8000
  /* 149204 801331D4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 149208 801331D8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14920C 801331DC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 149210 801331E0 8C430074 */        lw $v1, 0x74($v0)
  /* 149214 801331E4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 149218 801331E8 44050000 */      mfc1 $a1, $f0
  /* 14921C 801331EC 44060000 */      mfc1 $a2, $f0
  /* 149220 801331F0 3C07439B */       lui $a3, 0x439b
  /* 149224 801331F4 24640008 */     addiu $a0, $v1, 8
  /* 149228 801331F8 0C001C20 */       jal func_80007080
  /* 14922C 801331FC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 149230 80133200 8FBF003C */        lw $ra, 0x3c($sp)
  /* 149234 80133204 27BD0040 */     addiu $sp, $sp, 0x40
  /* 149238 80133208 03E00008 */        jr $ra
  /* 14923C 8013320C 00000000 */       nop

  /* 149240 80133210 03E00008 */        jr $ra
  /* 149244 80133214 00000000 */       nop

glabel mnBonusDrawTitleAndBack
  /* 149248 80133218 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14924C 8013321C AFBF001C */        sw $ra, 0x1c($sp)
  /* 149250 80133220 00002025 */        or $a0, $zero, $zero
  /* 149254 80133224 00002825 */        or $a1, $zero, $zero
  /* 149258 80133228 24060017 */     addiu $a2, $zero, 0x17
  /* 14925C 8013322C 0C00265A */       jal omMakeGObjSPAfter
  /* 149260 80133230 3C078000 */       lui $a3, 0x8000
  /* 149264 80133234 3C018013 */       lui $at, %hi(gMNBonusTitleGObj)
  /* 149268 80133238 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 14926C 8013323C 240EFFFF */     addiu $t6, $zero, -1
  /* 149270 80133240 AC227718 */        sw $v0, %lo(gMNBonusTitleGObj)($at)
  /* 149274 80133244 AFA20024 */        sw $v0, 0x24($sp)
  /* 149278 80133248 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14927C 8013324C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 149280 80133250 00402025 */        or $a0, $v0, $zero
  /* 149284 80133254 24060022 */     addiu $a2, $zero, 0x22
  /* 149288 80133258 0C00277D */       jal omAddGObjRenderProc
  /* 14928C 8013325C 3C078000 */       lui $a3, 0x8000
  /* 149290 80133260 3C0F8013 */       lui $t7, %hi(gMNBonusType)
  /* 149294 80133264 8DEF7714 */        lw $t7, %lo(gMNBonusType)($t7)
  /* 149298 80133268 8FA40024 */        lw $a0, 0x24($sp)
  /* 14929C 8013326C 3C088013 */       lui $t0, 0x8013
  /* 1492A0 80133270 15E0000A */      bnez $t7, .L8013329C
  /* 1492A4 80133274 3C090000 */       lui $t1, 0
  /* 1492A8 80133278 3C188013 */       lui $t8, %hi(D_ovl29_80137E04)
  /* 1492AC 8013327C 8F187E04 */        lw $t8, %lo(D_ovl29_80137E04)($t8)
  /* 1492B0 80133280 3C190000 */       lui $t9, %hi(D_NF_00000BD8)
  /* 1492B4 80133284 27390BD8 */     addiu $t9, $t9, %lo(D_NF_00000BD8)
  /* 1492B8 80133288 8FA40024 */        lw $a0, 0x24($sp)
  /* 1492BC 8013328C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1492C0 80133290 03192821 */      addu $a1, $t8, $t9
  /* 1492C4 80133294 10000006 */         b .L801332B0
  /* 1492C8 80133298 944A0024 */       lhu $t2, 0x24($v0)
  .L8013329C:
  /* 1492CC 8013329C 8D087E04 */        lw $t0, 0x7e04($t0)
  /* 1492D0 801332A0 25291058 */     addiu $t1, $t1, 0x1058
  /* 1492D4 801332A4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1492D8 801332A8 01092821 */      addu $a1, $t0, $t1
  /* 1492DC 801332AC 944A0024 */       lhu $t2, 0x24($v0)
  .L801332B0:
  /* 1492E0 801332B0 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 1492E4 801332B4 44812000 */      mtc1 $at, $f4 # 27.0 to cop1
  /* 1492E8 801332B8 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 1492EC 801332BC 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 1492F0 801332C0 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 1492F4 801332C4 A44C0024 */        sh $t4, 0x24($v0)
  /* 1492F8 801332C8 358D0001 */       ori $t5, $t4, 1
  /* 1492FC 801332CC 240E00E3 */     addiu $t6, $zero, 0xe3
  /* 149300 801332D0 240F00AC */     addiu $t7, $zero, 0xac
  /* 149304 801332D4 24180004 */     addiu $t8, $zero, 4
  /* 149308 801332D8 A44D0024 */        sh $t5, 0x24($v0)
  /* 14930C 801332DC A04E0028 */        sb $t6, 0x28($v0)
  /* 149310 801332E0 A04F0029 */        sb $t7, 0x29($v0)
  /* 149314 801332E4 A058002A */        sb $t8, 0x2a($v0)
  /* 149318 801332E8 3C198013 */       lui $t9, %hi(gMNBonusType)
  /* 14931C 801332EC E4440058 */      swc1 $f4, 0x58($v0)
  /* 149320 801332F0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 149324 801332F4 8F397714 */        lw $t9, %lo(gMNBonusType)($t9)
  /* 149328 801332F8 17200005 */      bnez $t9, .L80133310
  /* 14932C 801332FC 00000000 */       nop
  /* 149330 80133300 0C009A70 */       jal func_800269C0
  /* 149334 80133304 240401DE */     addiu $a0, $zero, 0x1de
  /* 149338 80133308 10000003 */         b .L80133318
  /* 14933C 8013330C 00000000 */       nop
  .L80133310:
  /* 149340 80133310 0C009A70 */       jal func_800269C0
  /* 149344 80133314 240401DC */     addiu $a0, $zero, 0x1dc
  .L80133318:
  /* 149348 80133318 3C088013 */       lui $t0, %hi(D_ovl29_80137DF8)
  /* 14934C 8013331C 8D087DF8 */        lw $t0, %lo(D_ovl29_80137DF8)($t0)
  /* 149350 80133320 3C090001 */       lui $t1, %hi(D_NF_000115C8)
  /* 149354 80133324 252915C8 */     addiu $t1, $t1, %lo(D_NF_000115C8)
  /* 149358 80133328 8FA40024 */        lw $a0, 0x24($sp)
  /* 14935C 8013332C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149360 80133330 01092821 */      addu $a1, $t0, $t1
  /* 149364 80133334 944A0024 */       lhu $t2, 0x24($v0)
  /* 149368 80133338 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 14936C 8013333C 44814000 */      mtc1 $at, $f8 # 244.0 to cop1
  /* 149370 80133340 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 149374 80133344 44815000 */      mtc1 $at, $f10 # 23.0 to cop1
  /* 149378 80133348 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 14937C 8013334C A44C0024 */        sh $t4, 0x24($v0)
  /* 149380 80133350 358D0001 */       ori $t5, $t4, 1
  /* 149384 80133354 A44D0024 */        sh $t5, 0x24($v0)
  /* 149388 80133358 E4480058 */      swc1 $f8, 0x58($v0)
  /* 14938C 8013335C E44A005C */      swc1 $f10, 0x5c($v0)
  /* 149390 80133360 8FBF001C */        lw $ra, 0x1c($sp)
  /* 149394 80133364 27BD0028 */     addiu $sp, $sp, 0x28
  /* 149398 80133368 03E00008 */        jr $ra
  /* 14939C 8013336C 00000000 */       nop

glabel mnBonusCreateTitleOptionsAndBackViewport
  /* 1493A0 80133370 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1493A4 80133374 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1493A8 80133378 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1493AC 8013337C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1493B0 80133380 240F0046 */     addiu $t7, $zero, 0x46
  /* 1493B4 80133384 24180004 */     addiu $t8, $zero, 4
  /* 1493B8 80133388 24190000 */     addiu $t9, $zero, 0
  /* 1493BC 8013338C 2408FFFF */     addiu $t0, $zero, -1
  /* 1493C0 80133390 24090001 */     addiu $t1, $zero, 1
  /* 1493C4 80133394 240A0001 */     addiu $t2, $zero, 1
  /* 1493C8 80133398 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1493CC 8013339C AFA90028 */        sw $t1, 0x28($sp)
  /* 1493D0 801333A0 AFA80020 */        sw $t0, 0x20($sp)
  /* 1493D4 801333A4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1493D8 801333A8 AFB80018 */        sw $t8, 0x18($sp)
  /* 1493DC 801333AC AFAF0014 */        sw $t7, 0x14($sp)
  /* 1493E0 801333B0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1493E4 801333B4 AFA00024 */        sw $zero, 0x24($sp)
  /* 1493E8 801333B8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1493EC 801333BC AFA00034 */        sw $zero, 0x34($sp)
  /* 1493F0 801333C0 24040401 */     addiu $a0, $zero, 0x401
  /* 1493F4 801333C4 00002825 */        or $a1, $zero, $zero
  /* 1493F8 801333C8 24060010 */     addiu $a2, $zero, 0x10
  /* 1493FC 801333CC 0C002E4F */       jal func_8000B93C
  /* 149400 801333D0 3C078000 */       lui $a3, 0x8000
  /* 149404 801333D4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 149408 801333D8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14940C 801333DC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 149410 801333E0 8C430074 */        lw $v1, 0x74($v0)
  /* 149414 801333E4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 149418 801333E8 44050000 */      mfc1 $a1, $f0
  /* 14941C 801333EC 44060000 */      mfc1 $a2, $f0
  /* 149420 801333F0 3C07439B */       lui $a3, 0x439b
  /* 149424 801333F4 24640008 */     addiu $a0, $v1, 8
  /* 149428 801333F8 0C001C20 */       jal func_80007080
  /* 14942C 801333FC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 149430 80133400 8FBF003C */        lw $ra, 0x3c($sp)
  /* 149434 80133404 27BD0040 */     addiu $sp, $sp, 0x40
  /* 149438 80133408 03E00008 */        jr $ra
  /* 14943C 8013340C 00000000 */       nop

glabel mnBonusGetBestTime
  /* 149440 80133410 3C0E8013 */       lui $t6, %hi(gMNBonusType)
  /* 149444 80133414 8DCE7714 */        lw $t6, %lo(gMNBonusType)($t6)
  /* 149448 80133418 0004C140 */       sll $t8, $a0, 5
  /* 14944C 8013341C 3C03800A */       lui $v1, 0x800a
  /* 149450 80133420 15C0000E */      bnez $t6, .L8013345C
  /* 149454 80133424 00781821 */      addu $v1, $v1, $t8
  /* 149458 80133428 00047940 */       sll $t7, $a0, 5
  /* 14945C 8013342C 3C03800A */       lui $v1, %hi((gSaveData + 0x46C))
  /* 149460 80133430 006F1821 */      addu $v1, $v1, $t7
  /* 149464 80133434 8C63494C */        lw $v1, %lo((gSaveData + 0x46C))($v1)
  /* 149468 80133438 3C010003 */       lui $at, (0x34BC0 >> 16) # 216000
  /* 14946C 8013343C 34214BC0 */       ori $at, $at, (0x34BC0 & 0xFFFF) # 216000
  /* 149470 80133440 0061082B */      sltu $at, $v1, $at
  /* 149474 80133444 14200003 */      bnez $at, .L80133454
  /* 149478 80133448 3C020003 */       lui $v0, (0x34BBF >> 16) # 215999
  /* 14947C 8013344C 03E00008 */        jr $ra
  /* 149480 80133450 34424BBF */       ori $v0, $v0, (0x34BBF & 0xFFFF) # 215999

  .L80133454:
  /* 149484 80133454 03E00008 */        jr $ra
  /* 149488 80133458 00601025 */        or $v0, $v1, $zero

  .L8013345C:
  /* 14948C 8013345C 8C634954 */        lw $v1, 0x4954($v1)
  /* 149490 80133460 3C010003 */       lui $at, (0x34BC0 >> 16) # 216000
  /* 149494 80133464 34214BC0 */       ori $at, $at, (0x34BC0 & 0xFFFF) # 216000
  /* 149498 80133468 0061082B */      sltu $at, $v1, $at
  /* 14949C 8013346C 14200004 */      bnez $at, .L80133480
  /* 1494A0 80133470 00601025 */        or $v0, $v1, $zero
  /* 1494A4 80133474 3C020003 */       lui $v0, (0x34BBF >> 16) # 215999
  /* 1494A8 80133478 03E00008 */        jr $ra
  /* 1494AC 8013347C 34424BBF */       ori $v0, $v0, (0x34BBF & 0xFFFF) # 215999

  .L80133480:
  /* 1494B0 80133480 03E00008 */        jr $ra
  /* 1494B4 80133484 00000000 */       nop

glabel mnBonusGetMinutes
  /* 1494B8 80133488 24010E10 */     addiu $at, $zero, 0xe10
  /* 1494BC 8013348C 0081001A */       div $zero, $a0, $at
  /* 1494C0 80133490 00001012 */      mflo $v0
  /* 1494C4 80133494 03E00008 */        jr $ra
  /* 1494C8 80133498 00000000 */       nop

glabel mnBonusGetSeconds
  /* 1494CC 8013349C 24010E10 */     addiu $at, $zero, 0xe10
  /* 1494D0 801334A0 0081001A */       div $zero, $a0, $at
  /* 1494D4 801334A4 00001010 */      mfhi $v0
  /* 1494D8 801334A8 2401003C */     addiu $at, $zero, 0x3c
  /* 1494DC 801334AC 00000000 */       nop
  /* 1494E0 801334B0 0041001A */       div $zero, $v0, $at
  /* 1494E4 801334B4 00001012 */      mflo $v0
  /* 1494E8 801334B8 03E00008 */        jr $ra
  /* 1494EC 801334BC 00000000 */       nop

glabel mnBonusGetCentiseconds
  /* 1494F0 801334C0 24010E10 */     addiu $at, $zero, 0xe10
  /* 1494F4 801334C4 0081001A */       div $zero, $a0, $at
  /* 1494F8 801334C8 00001810 */      mfhi $v1
  /* 1494FC 801334CC 24050006 */     addiu $a1, $zero, 6
  /* 149500 801334D0 00000000 */       nop
  /* 149504 801334D4 0065001A */       div $zero, $v1, $a1
  /* 149508 801334D8 14A00002 */      bnez $a1, .L801334E4
  /* 14950C 801334DC 00000000 */       nop
  /* 149510 801334E0 0007000D */     break 7
  .L801334E4:
  /* 149514 801334E4 2401FFFF */     addiu $at, $zero, -1
  /* 149518 801334E8 14A10004 */       bne $a1, $at, .L801334FC
  /* 14951C 801334EC 3C018000 */       lui $at, 0x8000
  /* 149520 801334F0 14610002 */       bne $v1, $at, .L801334FC
  /* 149524 801334F4 00000000 */       nop
  /* 149528 801334F8 0006000D */     break 6
  .L801334FC:
  /* 14952C 801334FC 00007010 */      mfhi $t6
  /* 149530 80133500 3C018013 */       lui $at, %hi(D_ovl29_801375E0)
  /* 149534 80133504 C42875E0 */      lwc1 $f8, %lo(D_ovl29_801375E0)($at)
  /* 149538 80133508 2401003C */     addiu $at, $zero, 0x3c
  /* 14953C 8013350C 0061001A */       div $zero, $v1, $at
  /* 149540 80133510 0000C810 */      mfhi $t9
  /* 149544 80133514 448E2000 */      mtc1 $t6, $f4
  /* 149548 80133518 00000000 */       nop
  /* 14954C 8013351C 0325001A */       div $zero, $t9, $a1
  /* 149550 80133520 468021A0 */   cvt.s.w $f6, $f4
  /* 149554 80133524 00004012 */      mflo $t0
  /* 149558 80133528 00084880 */       sll $t1, $t0, 2
  /* 14955C 8013352C 01284821 */      addu $t1, $t1, $t0
  /* 149560 80133530 00094840 */       sll $t1, $t1, 1
  /* 149564 80133534 46083283 */     div.s $f10, $f6, $f8
  /* 149568 80133538 4600540D */ trunc.w.s $f16, $f10
  /* 14956C 8013353C 44188000 */      mfc1 $t8, $f16
  /* 149570 80133540 14A00002 */      bnez $a1, .L8013354C
  /* 149574 80133544 00000000 */       nop
  /* 149578 80133548 0007000D */     break 7
  .L8013354C:
  /* 14957C 8013354C 2401FFFF */     addiu $at, $zero, -1
  /* 149580 80133550 14A10004 */       bne $a1, $at, .L80133564
  /* 149584 80133554 3C018000 */       lui $at, 0x8000
  /* 149588 80133558 17210002 */       bne $t9, $at, .L80133564
  /* 14958C 8013355C 00000000 */       nop
  /* 149590 80133560 0006000D */     break 6
  .L80133564:
  /* 149594 80133564 01381021 */      addu $v0, $t1, $t8
  /* 149598 80133568 03E00008 */        jr $ra
  /* 14959C 8013356C 00000000 */       nop

glabel mnBonusGetTotalMinutes
  /* 1495A0 80133570 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1495A4 80133574 AFB20020 */        sw $s2, 0x20($sp)
  /* 1495A8 80133578 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1495AC 8013357C AFB00018 */        sw $s0, 0x18($sp)
  /* 1495B0 80133580 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1495B4 80133584 00008825 */        or $s1, $zero, $zero
  /* 1495B8 80133588 00008025 */        or $s0, $zero, $zero
  /* 1495BC 8013358C 2412000C */     addiu $s2, $zero, 0xc
  .L80133590:
  /* 1495C0 80133590 0C04C8AF */       jal mnBonusGetIsLocked
  /* 1495C4 80133594 02002025 */        or $a0, $s0, $zero
  /* 1495C8 80133598 54400007 */      bnel $v0, $zero, .L801335B8
  /* 1495CC 8013359C 26100001 */     addiu $s0, $s0, 1
  /* 1495D0 801335A0 0C04CD04 */       jal mnBonusGetBestTime
  /* 1495D4 801335A4 02002025 */        or $a0, $s0, $zero
  /* 1495D8 801335A8 0C04CD22 */       jal mnBonusGetMinutes
  /* 1495DC 801335AC 00402025 */        or $a0, $v0, $zero
  /* 1495E0 801335B0 02228821 */      addu $s1, $s1, $v0
  /* 1495E4 801335B4 26100001 */     addiu $s0, $s0, 1
  .L801335B8:
  /* 1495E8 801335B8 1612FFF5 */       bne $s0, $s2, .L80133590
  /* 1495EC 801335BC 00000000 */       nop
  /* 1495F0 801335C0 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1495F4 801335C4 02201025 */        or $v0, $s1, $zero
  /* 1495F8 801335C8 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1495FC 801335CC 8FB00018 */        lw $s0, 0x18($sp)
  /* 149600 801335D0 8FB20020 */        lw $s2, 0x20($sp)
  /* 149604 801335D4 03E00008 */        jr $ra
  /* 149608 801335D8 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusGetTotalSeconds
  /* 14960C 801335DC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 149610 801335E0 AFB20020 */        sw $s2, 0x20($sp)
  /* 149614 801335E4 AFB1001C */        sw $s1, 0x1c($sp)
  /* 149618 801335E8 AFB00018 */        sw $s0, 0x18($sp)
  /* 14961C 801335EC AFBF0024 */        sw $ra, 0x24($sp)
  /* 149620 801335F0 00008825 */        or $s1, $zero, $zero
  /* 149624 801335F4 00008025 */        or $s0, $zero, $zero
  /* 149628 801335F8 2412000C */     addiu $s2, $zero, 0xc
  .L801335FC:
  /* 14962C 801335FC 0C04C8AF */       jal mnBonusGetIsLocked
  /* 149630 80133600 02002025 */        or $a0, $s0, $zero
  /* 149634 80133604 54400007 */      bnel $v0, $zero, .L80133624
  /* 149638 80133608 26100001 */     addiu $s0, $s0, 1
  /* 14963C 8013360C 0C04CD04 */       jal mnBonusGetBestTime
  /* 149640 80133610 02002025 */        or $a0, $s0, $zero
  /* 149644 80133614 0C04CD27 */       jal mnBonusGetSeconds
  /* 149648 80133618 00402025 */        or $a0, $v0, $zero
  /* 14964C 8013361C 02228821 */      addu $s1, $s1, $v0
  /* 149650 80133620 26100001 */     addiu $s0, $s0, 1
  .L80133624:
  /* 149654 80133624 1612FFF5 */       bne $s0, $s2, .L801335FC
  /* 149658 80133628 00000000 */       nop
  /* 14965C 8013362C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 149660 80133630 02201025 */        or $v0, $s1, $zero
  /* 149664 80133634 8FB1001C */        lw $s1, 0x1c($sp)
  /* 149668 80133638 8FB00018 */        lw $s0, 0x18($sp)
  /* 14966C 8013363C 8FB20020 */        lw $s2, 0x20($sp)
  /* 149670 80133640 03E00008 */        jr $ra
  /* 149674 80133644 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusGetTotalCentiseconds
  /* 149678 80133648 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14967C 8013364C AFB20020 */        sw $s2, 0x20($sp)
  /* 149680 80133650 AFB1001C */        sw $s1, 0x1c($sp)
  /* 149684 80133654 AFB00018 */        sw $s0, 0x18($sp)
  /* 149688 80133658 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14968C 8013365C 00008825 */        or $s1, $zero, $zero
  /* 149690 80133660 00008025 */        or $s0, $zero, $zero
  /* 149694 80133664 2412000C */     addiu $s2, $zero, 0xc
  .L80133668:
  /* 149698 80133668 0C04C8AF */       jal mnBonusGetIsLocked
  /* 14969C 8013366C 02002025 */        or $a0, $s0, $zero
  /* 1496A0 80133670 54400007 */      bnel $v0, $zero, .L80133690
  /* 1496A4 80133674 26100001 */     addiu $s0, $s0, 1
  /* 1496A8 80133678 0C04CD04 */       jal mnBonusGetBestTime
  /* 1496AC 8013367C 02002025 */        or $a0, $s0, $zero
  /* 1496B0 80133680 0C04CD30 */       jal mnBonusGetCentiseconds
  /* 1496B4 80133684 00402025 */        or $a0, $v0, $zero
  /* 1496B8 80133688 02228821 */      addu $s1, $s1, $v0
  /* 1496BC 8013368C 26100001 */     addiu $s0, $s0, 1
  .L80133690:
  /* 1496C0 80133690 1612FFF5 */       bne $s0, $s2, .L80133668
  /* 1496C4 80133694 00000000 */       nop
  /* 1496C8 80133698 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1496CC 8013369C 02201025 */        or $v0, $s1, $zero
  /* 1496D0 801336A0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1496D4 801336A4 8FB00018 */        lw $s0, 0x18($sp)
  /* 1496D8 801336A8 8FB20020 */        lw $s2, 0x20($sp)
  /* 1496DC 801336AC 03E00008 */        jr $ra
  /* 1496E0 801336B0 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusDrawBestTime
  /* 1496E4 801336B4 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 1496E8 801336B8 3C0F8013 */       lui $t7, %hi(dMNBonusBestTimeColorsUnused)
  /* 1496EC 801336BC AFBF002C */        sw $ra, 0x2c($sp)
  /* 1496F0 801336C0 AFB00028 */        sw $s0, 0x28($sp)
  /* 1496F4 801336C4 25EF73A4 */     addiu $t7, $t7, %lo(dMNBonusBestTimeColorsUnused)
  /* 1496F8 801336C8 8DF90000 */        lw $t9, ($t7) # dMNBonusBestTimeColorsUnused + 0
  /* 1496FC 801336CC 27AE005C */     addiu $t6, $sp, 0x5c
  /* 149700 801336D0 8DF80004 */        lw $t8, 4($t7) # dMNBonusBestTimeColorsUnused + 4
  /* 149704 801336D4 ADD90000 */        sw $t9, ($t6)
  /* 149708 801336D8 8DF90008 */        lw $t9, 8($t7) # dMNBonusBestTimeColorsUnused + 8
  /* 14970C 801336DC 3C098013 */       lui $t1, %hi(dMNBonusBestTimeColors)
  /* 149710 801336E0 252973B0 */     addiu $t1, $t1, %lo(dMNBonusBestTimeColors)
  /* 149714 801336E4 ADD80004 */        sw $t8, 4($t6)
  /* 149718 801336E8 ADD90008 */        sw $t9, 8($t6)
  /* 14971C 801336EC 8D2A0004 */        lw $t2, 4($t1) # dMNBonusBestTimeColors + 4
  /* 149720 801336F0 8D2B0000 */        lw $t3, ($t1) # dMNBonusBestTimeColors + 0
  /* 149724 801336F4 27A80044 */     addiu $t0, $sp, 0x44
  /* 149728 801336F8 AD0A0004 */        sw $t2, 4($t0)
  /* 14972C 801336FC AD0B0000 */        sw $t3, ($t0)
  /* 149730 80133700 8D2B0008 */        lw $t3, 8($t1) # dMNBonusBestTimeColors + 8
  /* 149734 80133704 8D2A000C */        lw $t2, 0xc($t1) # dMNBonusBestTimeColors + 12
  /* 149738 80133708 AD0B0008 */        sw $t3, 8($t0)
  /* 14973C 8013370C AD0A000C */        sw $t2, 0xc($t0)
  /* 149740 80133710 8D2A0014 */        lw $t2, 0x14($t1) # dMNBonusBestTimeColors + 20
  /* 149744 80133714 8D2B0010 */        lw $t3, 0x10($t1) # dMNBonusBestTimeColors + 16
  /* 149748 80133718 AD0A0014 */        sw $t2, 0x14($t0)
  /* 14974C 8013371C 0C04D394 */       jal mnBonusGetFtKindFromTokenPositionEvenIfLocked
  /* 149750 80133720 AD0B0010 */        sw $t3, 0x10($t0)
  /* 149754 80133724 3C048013 */       lui $a0, %hi(gMNBonusHighscoreGobj)
  /* 149758 80133728 8C8476FC */        lw $a0, %lo(gMNBonusHighscoreGobj)($a0)
  /* 14975C 8013372C 00408025 */        or $s0, $v0, $zero
  /* 149760 80133730 50800006 */      beql $a0, $zero, .L8013374C
  /* 149764 80133734 2401001C */     addiu $at, $zero, 0x1c
  /* 149768 80133738 0C0026A1 */       jal omEjectGObj
  /* 14976C 8013373C 00000000 */       nop
  /* 149770 80133740 3C018013 */       lui $at, %hi(gMNBonusHighscoreGobj)
  /* 149774 80133744 AC2076FC */        sw $zero, %lo(gMNBonusHighscoreGobj)($at)
  /* 149778 80133748 2401001C */     addiu $at, $zero, 0x1c
  .L8013374C:
  /* 14977C 8013374C 5201008C */      beql $s0, $at, .L80133980
  /* 149780 80133750 8FBF002C */        lw $ra, 0x2c($sp)
  /* 149784 80133754 0C04CD04 */       jal mnBonusGetBestTime
  /* 149788 80133758 02002025 */        or $a0, $s0, $zero
  /* 14978C 8013375C AFA20040 */        sw $v0, 0x40($sp)
  /* 149790 80133760 00002025 */        or $a0, $zero, $zero
  /* 149794 80133764 00002825 */        or $a1, $zero, $zero
  /* 149798 80133768 24060017 */     addiu $a2, $zero, 0x17
  /* 14979C 8013376C 0C00265A */       jal omMakeGObjSPAfter
  /* 1497A0 80133770 3C078000 */       lui $a3, 0x8000
  /* 1497A4 80133774 3C018013 */       lui $at, %hi(gMNBonusHighscoreGobj)
  /* 1497A8 80133778 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1497AC 8013377C 240CFFFF */     addiu $t4, $zero, -1
  /* 1497B0 80133780 AC2276FC */        sw $v0, %lo(gMNBonusHighscoreGobj)($at)
  /* 1497B4 80133784 00408025 */        or $s0, $v0, $zero
  /* 1497B8 80133788 AFAC0010 */        sw $t4, 0x10($sp)
  /* 1497BC 8013378C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1497C0 80133790 00402025 */        or $a0, $v0, $zero
  /* 1497C4 80133794 2406001A */     addiu $a2, $zero, 0x1a
  /* 1497C8 80133798 0C00277D */       jal omAddGObjRenderProc
  /* 1497CC 8013379C 3C078000 */       lui $a3, 0x8000
  /* 1497D0 801337A0 3C0D8013 */       lui $t5, %hi(D_ovl29_80137E0C)
  /* 1497D4 801337A4 8DAD7E0C */        lw $t5, %lo(D_ovl29_80137E0C)($t5)
  /* 1497D8 801337A8 3C0E0000 */       lui $t6, %hi(D_NF_000012E0)
  /* 1497DC 801337AC 25CE12E0 */     addiu $t6, $t6, %lo(D_NF_000012E0)
  /* 1497E0 801337B0 02002025 */        or $a0, $s0, $zero
  /* 1497E4 801337B4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1497E8 801337B8 01AE2821 */      addu $a1, $t5, $t6
  /* 1497EC 801337BC 944F0024 */       lhu $t7, 0x24($v0)
  /* 1497F0 801337C0 3C014331 */       lui $at, (0x43310000 >> 16) # 177.0
  /* 1497F4 801337C4 44812000 */      mtc1 $at, $f4 # 177.0 to cop1
  /* 1497F8 801337C8 3C014346 */       lui $at, (0x43460000 >> 16) # 198.0
  /* 1497FC 801337CC 44813000 */      mtc1 $at, $f6 # 198.0 to cop1
  /* 149800 801337D0 31F9FFDF */      andi $t9, $t7, 0xffdf
  /* 149804 801337D4 A4590024 */        sh $t9, 0x24($v0)
  /* 149808 801337D8 37280001 */       ori $t0, $t9, 1
  /* 14980C 801337DC 2409007E */     addiu $t1, $zero, 0x7e
  /* 149810 801337E0 240A007C */     addiu $t2, $zero, 0x7c
  /* 149814 801337E4 240B0077 */     addiu $t3, $zero, 0x77
  /* 149818 801337E8 A4480024 */        sh $t0, 0x24($v0)
  /* 14981C 801337EC A0490028 */        sb $t1, 0x28($v0)
  /* 149820 801337F0 A04A0029 */        sb $t2, 0x29($v0)
  /* 149824 801337F4 A04B002A */        sb $t3, 0x2a($v0)
  /* 149828 801337F8 E4440058 */      swc1 $f4, 0x58($v0)
  /* 14982C 801337FC E446005C */      swc1 $f6, 0x5c($v0)
  /* 149830 80133800 0C04CD22 */       jal mnBonusGetMinutes
  /* 149834 80133804 8FA40040 */        lw $a0, 0x40($sp)
  /* 149838 80133808 27AC0044 */     addiu $t4, $sp, 0x44
  /* 14983C 8013380C 240D0002 */     addiu $t5, $zero, 2
  /* 149840 80133810 240E0001 */     addiu $t6, $zero, 1
  /* 149844 80133814 AFAE0018 */        sw $t6, 0x18($sp)
  /* 149848 80133818 AFAD0014 */        sw $t5, 0x14($sp)
  /* 14984C 8013381C AFAC0010 */        sw $t4, 0x10($sp)
  /* 149850 80133820 02002025 */        or $a0, $s0, $zero
  /* 149854 80133824 00402825 */        or $a1, $v0, $zero
  /* 149858 80133828 3C06436D */       lui $a2, 0x436d
  /* 14985C 8013382C 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149860 80133830 3C074343 */       lui $a3, 0x4343
  /* 149864 80133834 3C0F8013 */       lui $t7, %hi(D_ovl29_80137E0C)
  /* 149868 80133838 8DEF7E0C */        lw $t7, %lo(D_ovl29_80137E0C)($t7)
  /* 14986C 8013383C 3C180000 */       lui $t8, %hi(D_NF_00001F48)
  /* 149870 80133840 27181F48 */     addiu $t8, $t8, %lo(D_NF_00001F48)
  /* 149874 80133844 02002025 */        or $a0, $s0, $zero
  /* 149878 80133848 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14987C 8013384C 01F82821 */      addu $a1, $t7, $t8
  /* 149880 80133850 94590024 */       lhu $t9, 0x24($v0)
  /* 149884 80133854 3C01436F */       lui $at, (0x436F0000 >> 16) # 239.0
  /* 149888 80133858 44814000 */      mtc1 $at, $f8 # 239.0 to cop1
  /* 14988C 8013385C 3C014343 */       lui $at, (0x43430000 >> 16) # 195.0
  /* 149890 80133860 44815000 */      mtc1 $at, $f10 # 195.0 to cop1
  /* 149894 80133864 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 149898 80133868 A4490024 */        sh $t1, 0x24($v0)
  /* 14989C 8013386C 352A0001 */       ori $t2, $t1, 1
  /* 1498A0 80133870 240B007E */     addiu $t3, $zero, 0x7e
  /* 1498A4 80133874 240C007C */     addiu $t4, $zero, 0x7c
  /* 1498A8 80133878 240D0077 */     addiu $t5, $zero, 0x77
  /* 1498AC 8013387C A44A0024 */        sh $t2, 0x24($v0)
  /* 1498B0 80133880 A0400060 */        sb $zero, 0x60($v0)
  /* 1498B4 80133884 A0400061 */        sb $zero, 0x61($v0)
  /* 1498B8 80133888 A0400062 */        sb $zero, 0x62($v0)
  /* 1498BC 8013388C A04B0028 */        sb $t3, 0x28($v0)
  /* 1498C0 80133890 A04C0029 */        sb $t4, 0x29($v0)
  /* 1498C4 80133894 A04D002A */        sb $t5, 0x2a($v0)
  /* 1498C8 80133898 E4480058 */      swc1 $f8, 0x58($v0)
  /* 1498CC 8013389C E44A005C */      swc1 $f10, 0x5c($v0)
  /* 1498D0 801338A0 0C04CD27 */       jal mnBonusGetSeconds
  /* 1498D4 801338A4 8FA40040 */        lw $a0, 0x40($sp)
  /* 1498D8 801338A8 3C064381 */       lui $a2, (0x43818000 >> 16) # 1132560384
  /* 1498DC 801338AC 27AE0044 */     addiu $t6, $sp, 0x44
  /* 1498E0 801338B0 240F0002 */     addiu $t7, $zero, 2
  /* 1498E4 801338B4 24180001 */     addiu $t8, $zero, 1
  /* 1498E8 801338B8 AFB80018 */        sw $t8, 0x18($sp)
  /* 1498EC 801338BC AFAF0014 */        sw $t7, 0x14($sp)
  /* 1498F0 801338C0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1498F4 801338C4 34C68000 */       ori $a2, $a2, (0x43818000 & 0xFFFF) # 1132560384
  /* 1498F8 801338C8 02002025 */        or $a0, $s0, $zero
  /* 1498FC 801338CC 00402825 */        or $a1, $v0, $zero
  /* 149900 801338D0 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149904 801338D4 3C074343 */       lui $a3, 0x4343
  /* 149908 801338D8 3C198013 */       lui $t9, %hi(D_ovl29_80137E0C)
  /* 14990C 801338DC 8F397E0C */        lw $t9, %lo(D_ovl29_80137E0C)($t9)
  /* 149910 801338E0 3C080000 */       lui $t0, %hi(D_NF_00001FC8)
  /* 149914 801338E4 25081FC8 */     addiu $t0, $t0, %lo(D_NF_00001FC8)
  /* 149918 801338E8 02002025 */        or $a0, $s0, $zero
  /* 14991C 801338EC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149920 801338F0 03282821 */      addu $a1, $t9, $t0
  /* 149924 801338F4 3C018013 */       lui $at, %hi(D_ovl29_801375E4)
  /* 149928 801338F8 C43075E4 */      lwc1 $f16, %lo(D_ovl29_801375E4)($at)
  /* 14992C 801338FC 94490024 */       lhu $t1, 0x24($v0)
  /* 149930 80133900 3C014343 */       lui $at, (0x43430000 >> 16) # 195.0
  /* 149934 80133904 44819000 */      mtc1 $at, $f18 # 195.0 to cop1
  /* 149938 80133908 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 14993C 8013390C A44B0024 */        sh $t3, 0x24($v0)
  /* 149940 80133910 356C0001 */       ori $t4, $t3, 1
  /* 149944 80133914 240D007E */     addiu $t5, $zero, 0x7e
  /* 149948 80133918 240E007C */     addiu $t6, $zero, 0x7c
  /* 14994C 8013391C 240F0077 */     addiu $t7, $zero, 0x77
  /* 149950 80133920 A44C0024 */        sh $t4, 0x24($v0)
  /* 149954 80133924 A0400060 */        sb $zero, 0x60($v0)
  /* 149958 80133928 A0400061 */        sb $zero, 0x61($v0)
  /* 14995C 8013392C A0400062 */        sb $zero, 0x62($v0)
  /* 149960 80133930 A04D0028 */        sb $t5, 0x28($v0)
  /* 149964 80133934 A04E0029 */        sb $t6, 0x29($v0)
  /* 149968 80133938 A04F002A */        sb $t7, 0x2a($v0)
  /* 14996C 8013393C E4500058 */      swc1 $f16, 0x58($v0)
  /* 149970 80133940 E452005C */      swc1 $f18, 0x5c($v0)
  /* 149974 80133944 0C04CD30 */       jal mnBonusGetCentiseconds
  /* 149978 80133948 8FA40040 */        lw $a0, 0x40($sp)
  /* 14997C 8013394C 3C06438D */       lui $a2, (0x438D8000 >> 16) # 1133346816
  /* 149980 80133950 27B80044 */     addiu $t8, $sp, 0x44
  /* 149984 80133954 24190002 */     addiu $t9, $zero, 2
  /* 149988 80133958 24080001 */     addiu $t0, $zero, 1
  /* 14998C 8013395C AFA80018 */        sw $t0, 0x18($sp)
  /* 149990 80133960 AFB90014 */        sw $t9, 0x14($sp)
  /* 149994 80133964 AFB80010 */        sw $t8, 0x10($sp)
  /* 149998 80133968 34C68000 */       ori $a2, $a2, (0x438D8000 & 0xFFFF) # 1133346816
  /* 14999C 8013396C 02002025 */        or $a0, $s0, $zero
  /* 1499A0 80133970 00402825 */        or $a1, $v0, $zero
  /* 1499A4 80133974 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 1499A8 80133978 3C074343 */       lui $a3, 0x4343
  /* 1499AC 8013397C 8FBF002C */        lw $ra, 0x2c($sp)
  .L80133980:
  /* 1499B0 80133980 8FB00028 */        lw $s0, 0x28($sp)
  /* 1499B4 80133984 27BD0078 */     addiu $sp, $sp, 0x78
  /* 1499B8 80133988 03E00008 */        jr $ra
  /* 1499BC 8013398C 00000000 */       nop

glabel mnBonusGetBestCount
  /* 1499C0 80133990 3C0E8013 */       lui $t6, %hi(gMNBonusType)
  /* 1499C4 80133994 8DCE7714 */        lw $t6, %lo(gMNBonusType)($t6)
  /* 1499C8 80133998 0004C140 */       sll $t8, $a0, 5
  /* 1499CC 8013399C 3C02800A */       lui $v0, 0x800a
  /* 1499D0 801339A0 15C00006 */      bnez $t6, .L801339BC
  /* 1499D4 801339A4 00581021 */      addu $v0, $v0, $t8
  /* 1499D8 801339A8 00047940 */       sll $t7, $a0, 5
  /* 1499DC 801339AC 3C02800A */       lui $v0, %hi((gSaveData + 0x470))
  /* 1499E0 801339B0 004F1021 */      addu $v0, $v0, $t7
  /* 1499E4 801339B4 03E00008 */        jr $ra
  /* 1499E8 801339B8 90424950 */       lbu $v0, %lo((gSaveData + 0x470))($v0)

  .L801339BC:
  /* 1499EC 801339BC 90424958 */       lbu $v0, 0x4958($v0)
  /* 1499F0 801339C0 03E00008 */        jr $ra
  /* 1499F4 801339C4 00000000 */       nop

glabel mnBonusDrawBestCount
  /* 1499F8 801339C8 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 1499FC 801339CC 3C0F8013 */       lui $t7, %hi(dMNBonusBestCountColorsUnused)
  /* 149A00 801339D0 AFBF0024 */        sw $ra, 0x24($sp)
  /* 149A04 801339D4 25EF73C8 */     addiu $t7, $t7, %lo(dMNBonusBestCountColorsUnused)
  /* 149A08 801339D8 8DF90000 */        lw $t9, ($t7) # dMNBonusBestCountColorsUnused + 0
  /* 149A0C 801339DC 27AE004C */     addiu $t6, $sp, 0x4c
  /* 149A10 801339E0 8DF80004 */        lw $t8, 4($t7) # dMNBonusBestCountColorsUnused + 4
  /* 149A14 801339E4 ADD90000 */        sw $t9, ($t6)
  /* 149A18 801339E8 8DF90008 */        lw $t9, 8($t7) # dMNBonusBestCountColorsUnused + 8
  /* 149A1C 801339EC 3C098013 */       lui $t1, %hi(dMNBonusBestCountColors)
  /* 149A20 801339F0 252973D4 */     addiu $t1, $t1, %lo(dMNBonusBestCountColors)
  /* 149A24 801339F4 ADD80004 */        sw $t8, 4($t6)
  /* 149A28 801339F8 ADD90008 */        sw $t9, 8($t6)
  /* 149A2C 801339FC 8D2A0004 */        lw $t2, 4($t1) # dMNBonusBestCountColors + 4
  /* 149A30 80133A00 8D2B0000 */        lw $t3, ($t1) # dMNBonusBestCountColors + 0
  /* 149A34 80133A04 27A80034 */     addiu $t0, $sp, 0x34
  /* 149A38 80133A08 AD0A0004 */        sw $t2, 4($t0)
  /* 149A3C 80133A0C AD0B0000 */        sw $t3, ($t0)
  /* 149A40 80133A10 8D2B0008 */        lw $t3, 8($t1) # dMNBonusBestCountColors + 8
  /* 149A44 80133A14 8D2A000C */        lw $t2, 0xc($t1) # dMNBonusBestCountColors + 12
  /* 149A48 80133A18 AD0B0008 */        sw $t3, 8($t0)
  /* 149A4C 80133A1C AD0A000C */        sw $t2, 0xc($t0)
  /* 149A50 80133A20 8D2A0014 */        lw $t2, 0x14($t1) # dMNBonusBestCountColors + 20
  /* 149A54 80133A24 8D2B0010 */        lw $t3, 0x10($t1) # dMNBonusBestCountColors + 16
  /* 149A58 80133A28 AD0A0014 */        sw $t2, 0x14($t0)
  /* 149A5C 80133A2C 0C04D394 */       jal mnBonusGetFtKindFromTokenPositionEvenIfLocked
  /* 149A60 80133A30 AD0B0010 */        sw $t3, 0x10($t0)
  /* 149A64 80133A34 3C048013 */       lui $a0, %hi(gMNBonusHighscoreGobj)
  /* 149A68 80133A38 8C8476FC */        lw $a0, %lo(gMNBonusHighscoreGobj)($a0)
  /* 149A6C 80133A3C AFA20030 */        sw $v0, 0x30($sp)
  /* 149A70 80133A40 50800006 */      beql $a0, $zero, .L80133A5C
  /* 149A74 80133A44 8FAC0030 */        lw $t4, 0x30($sp)
  /* 149A78 80133A48 0C0026A1 */       jal omEjectGObj
  /* 149A7C 80133A4C 00000000 */       nop
  /* 149A80 80133A50 3C018013 */       lui $at, %hi(gMNBonusHighscoreGobj)
  /* 149A84 80133A54 AC2076FC */        sw $zero, %lo(gMNBonusHighscoreGobj)($at)
  /* 149A88 80133A58 8FAC0030 */        lw $t4, 0x30($sp)
  .L80133A5C:
  /* 149A8C 80133A5C 2401001C */     addiu $at, $zero, 0x1c
  /* 149A90 80133A60 00002025 */        or $a0, $zero, $zero
  /* 149A94 80133A64 11810041 */       beq $t4, $at, .L80133B6C
  /* 149A98 80133A68 00002825 */        or $a1, $zero, $zero
  /* 149A9C 80133A6C 24060017 */     addiu $a2, $zero, 0x17
  /* 149AA0 80133A70 0C00265A */       jal omMakeGObjSPAfter
  /* 149AA4 80133A74 3C078000 */       lui $a3, 0x8000
  /* 149AA8 80133A78 3C018013 */       lui $at, %hi(gMNBonusHighscoreGobj)
  /* 149AAC 80133A7C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 149AB0 80133A80 240DFFFF */     addiu $t5, $zero, -1
  /* 149AB4 80133A84 AC2276FC */        sw $v0, %lo(gMNBonusHighscoreGobj)($at)
  /* 149AB8 80133A88 AFA20064 */        sw $v0, 0x64($sp)
  /* 149ABC 80133A8C AFAD0010 */        sw $t5, 0x10($sp)
  /* 149AC0 80133A90 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 149AC4 80133A94 00402025 */        or $a0, $v0, $zero
  /* 149AC8 80133A98 2406001A */     addiu $a2, $zero, 0x1a
  /* 149ACC 80133A9C 0C00277D */       jal omAddGObjRenderProc
  /* 149AD0 80133AA0 3C078000 */       lui $a3, 0x8000
  /* 149AD4 80133AA4 3C0E8013 */       lui $t6, %hi(gMNBonusType)
  /* 149AD8 80133AA8 8DCE7714 */        lw $t6, %lo(gMNBonusType)($t6)
  /* 149ADC 80133AAC 8FA40064 */        lw $a0, 0x64($sp)
  /* 149AE0 80133AB0 3C198013 */       lui $t9, 0x8013
  /* 149AE4 80133AB4 15C0000A */      bnez $t6, .L80133AE0
  /* 149AE8 80133AB8 3C080000 */       lui $t0, 0
  /* 149AEC 80133ABC 3C0F8013 */       lui $t7, %hi(D_ovl29_80137E0C)
  /* 149AF0 80133AC0 8DEF7E0C */        lw $t7, %lo(D_ovl29_80137E0C)($t7)
  /* 149AF4 80133AC4 3C180000 */       lui $t8, %hi(D_NF_00001658)
  /* 149AF8 80133AC8 27181658 */     addiu $t8, $t8, %lo(D_NF_00001658)
  /* 149AFC 80133ACC 8FA40064 */        lw $a0, 0x64($sp)
  /* 149B00 80133AD0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149B04 80133AD4 01F82821 */      addu $a1, $t7, $t8
  /* 149B08 80133AD8 10000006 */         b .L80133AF4
  /* 149B0C 80133ADC 00401825 */        or $v1, $v0, $zero
  .L80133AE0:
  /* 149B10 80133AE0 8F397E0C */        lw $t9, 0x7e0c($t9)
  /* 149B14 80133AE4 25081898 */     addiu $t0, $t0, 0x1898
  /* 149B18 80133AE8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149B1C 80133AEC 03282821 */      addu $a1, $t9, $t0
  /* 149B20 80133AF0 00401825 */        or $v1, $v0, $zero
  .L80133AF4:
  /* 149B24 80133AF4 94690024 */       lhu $t1, 0x24($v1)
  /* 149B28 80133AF8 3C01436B */       lui $at, (0x436B0000 >> 16) # 235.0
  /* 149B2C 80133AFC 44812000 */      mtc1 $at, $f4 # 235.0 to cop1
  /* 149B30 80133B00 3C014343 */       lui $at, (0x43430000 >> 16) # 195.0
  /* 149B34 80133B04 44813000 */      mtc1 $at, $f6 # 195.0 to cop1
  /* 149B38 80133B08 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 149B3C 80133B0C A46B0024 */        sh $t3, 0x24($v1)
  /* 149B40 80133B10 356C0001 */       ori $t4, $t3, 1
  /* 149B44 80133B14 240D007E */     addiu $t5, $zero, 0x7e
  /* 149B48 80133B18 240E007C */     addiu $t6, $zero, 0x7c
  /* 149B4C 80133B1C 240F0077 */     addiu $t7, $zero, 0x77
  /* 149B50 80133B20 A46C0024 */        sh $t4, 0x24($v1)
  /* 149B54 80133B24 A06D0028 */        sb $t5, 0x28($v1)
  /* 149B58 80133B28 A06E0029 */        sb $t6, 0x29($v1)
  /* 149B5C 80133B2C A06F002A */        sb $t7, 0x2a($v1)
  /* 149B60 80133B30 E4640058 */      swc1 $f4, 0x58($v1)
  /* 149B64 80133B34 E466005C */      swc1 $f6, 0x5c($v1)
  /* 149B68 80133B38 0C04CE64 */       jal mnBonusGetBestCount
  /* 149B6C 80133B3C 8FA40030 */        lw $a0, 0x30($sp)
  /* 149B70 80133B40 27B80034 */     addiu $t8, $sp, 0x34
  /* 149B74 80133B44 24190002 */     addiu $t9, $zero, 2
  /* 149B78 80133B48 24080001 */     addiu $t0, $zero, 1
  /* 149B7C 80133B4C AFA80018 */        sw $t0, 0x18($sp)
  /* 149B80 80133B50 AFB90014 */        sw $t9, 0x14($sp)
  /* 149B84 80133B54 AFB80010 */        sw $t8, 0x10($sp)
  /* 149B88 80133B58 8FA40064 */        lw $a0, 0x64($sp)
  /* 149B8C 80133B5C 00402825 */        or $a1, $v0, $zero
  /* 149B90 80133B60 3C064361 */       lui $a2, 0x4361
  /* 149B94 80133B64 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149B98 80133B68 3C074342 */       lui $a3, 0x4342
  .L80133B6C:
  /* 149B9C 80133B6C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 149BA0 80133B70 27BD0068 */     addiu $sp, $sp, 0x68
  /* 149BA4 80133B74 03E00008 */        jr $ra
  /* 149BA8 80133B78 00000000 */       nop

glabel mnBonusIsCompleted
  /* 149BAC 80133B7C 3C0E8013 */       lui $t6, %hi(gMNBonusType)
  /* 149BB0 80133B80 8DCE7714 */        lw $t6, %lo(gMNBonusType)($t6)
  /* 149BB4 80133B84 0004C140 */       sll $t8, $a0, 5
  /* 149BB8 80133B88 3C02800A */       lui $v0, 0x800a
  /* 149BBC 80133B8C 15C00006 */      bnez $t6, .L80133BA8
  /* 149BC0 80133B90 2401000A */     addiu $at, $zero, 0xa
  /* 149BC4 80133B94 00047940 */       sll $t7, $a0, 5
  /* 149BC8 80133B98 3C02800A */       lui $v0, %hi((gSaveData + 0x470))
  /* 149BCC 80133B9C 004F1021 */      addu $v0, $v0, $t7
  /* 149BD0 80133BA0 10000003 */         b .L80133BB0
  /* 149BD4 80133BA4 90424950 */       lbu $v0, %lo((gSaveData + 0x470))($v0)
  .L80133BA8:
  /* 149BD8 80133BA8 00581021 */      addu $v0, $v0, $t8
  /* 149BDC 80133BAC 90424958 */       lbu $v0, 0x4958($v0)
  .L80133BB0:
  /* 149BE0 80133BB0 54410004 */      bnel $v0, $at, .L80133BC4
  /* 149BE4 80133BB4 00001025 */        or $v0, $zero, $zero
  /* 149BE8 80133BB8 03E00008 */        jr $ra
  /* 149BEC 80133BBC 24020001 */     addiu $v0, $zero, 1

  /* 149BF0 80133BC0 00001025 */        or $v0, $zero, $zero
  .L80133BC4:
  /* 149BF4 80133BC4 03E00008 */        jr $ra
  /* 149BF8 80133BC8 00000000 */       nop

glabel mnBonusDrawHighscore
  /* 149BFC 80133BCC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 149C00 80133BD0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 149C04 80133BD4 0C04D394 */       jal mnBonusGetFtKindFromTokenPositionEvenIfLocked
  /* 149C08 80133BD8 00000000 */       nop
  /* 149C0C 80133BDC 0C04CEDF */       jal mnBonusIsCompleted
  /* 149C10 80133BE0 00402025 */        or $a0, $v0, $zero
  /* 149C14 80133BE4 10400005 */      beqz $v0, .L80133BFC
  /* 149C18 80133BE8 00000000 */       nop
  /* 149C1C 80133BEC 0C04CDAD */       jal mnBonusDrawBestTime
  /* 149C20 80133BF0 00000000 */       nop
  /* 149C24 80133BF4 10000004 */         b .L80133C08
  /* 149C28 80133BF8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133BFC:
  /* 149C2C 80133BFC 0C04CE72 */       jal mnBonusDrawBestCount
  /* 149C30 80133C00 00000000 */       nop
  /* 149C34 80133C04 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133C08:
  /* 149C38 80133C08 27BD0018 */     addiu $sp, $sp, 0x18
  /* 149C3C 80133C0C 03E00008 */        jr $ra
  /* 149C40 80133C10 00000000 */       nop

  /* 149C44 80133C14 03E00008 */        jr $ra
  /* 149C48 80133C18 00000000 */       nop

glabel mnDrawBonusTotalTime
  /* 149C4C 80133C1C 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 149C50 80133C20 3C0F8013 */       lui $t7, %hi(dMNBonusTotalTimeColorsUnused)
  /* 149C54 80133C24 AFBF002C */        sw $ra, 0x2c($sp)
  /* 149C58 80133C28 AFB00028 */        sw $s0, 0x28($sp)
  /* 149C5C 80133C2C 25EF73EC */     addiu $t7, $t7, %lo(dMNBonusTotalTimeColorsUnused)
  /* 149C60 80133C30 8DF90000 */        lw $t9, ($t7) # dMNBonusTotalTimeColorsUnused + 0
  /* 149C64 80133C34 27AE005C */     addiu $t6, $sp, 0x5c
  /* 149C68 80133C38 8DF80004 */        lw $t8, 4($t7) # dMNBonusTotalTimeColorsUnused + 4
  /* 149C6C 80133C3C ADD90000 */        sw $t9, ($t6)
  /* 149C70 80133C40 8DF90008 */        lw $t9, 8($t7) # dMNBonusTotalTimeColorsUnused + 8
  /* 149C74 80133C44 3C0A8013 */       lui $t2, %hi(dMNBonusTotalTimeColors)
  /* 149C78 80133C48 254A73F8 */     addiu $t2, $t2, %lo(dMNBonusTotalTimeColors)
  /* 149C7C 80133C4C ADD80004 */        sw $t8, 4($t6)
  /* 149C80 80133C50 ADD90008 */        sw $t9, 8($t6)
  /* 149C84 80133C54 8D4B0004 */        lw $t3, 4($t2) # dMNBonusTotalTimeColors + 4
  /* 149C88 80133C58 8D4C0000 */        lw $t4, ($t2) # dMNBonusTotalTimeColors + 0
  /* 149C8C 80133C5C 27A90044 */     addiu $t1, $sp, 0x44
  /* 149C90 80133C60 AD2B0004 */        sw $t3, 4($t1)
  /* 149C94 80133C64 AD2C0000 */        sw $t4, ($t1)
  /* 149C98 80133C68 8D4C0008 */        lw $t4, 8($t2) # dMNBonusTotalTimeColors + 8
  /* 149C9C 80133C6C 8D4B000C */        lw $t3, 0xc($t2) # dMNBonusTotalTimeColors + 12
  /* 149CA0 80133C70 00002025 */        or $a0, $zero, $zero
  /* 149CA4 80133C74 AD2C0008 */        sw $t4, 8($t1)
  /* 149CA8 80133C78 AD2B000C */        sw $t3, 0xc($t1)
  /* 149CAC 80133C7C 8D4B0014 */        lw $t3, 0x14($t2) # dMNBonusTotalTimeColors + 20
  /* 149CB0 80133C80 8D4C0010 */        lw $t4, 0x10($t2) # dMNBonusTotalTimeColors + 16
  /* 149CB4 80133C84 00002825 */        or $a1, $zero, $zero
  /* 149CB8 80133C88 24060017 */     addiu $a2, $zero, 0x17
  /* 149CBC 80133C8C 3C078000 */       lui $a3, 0x8000
  /* 149CC0 80133C90 AD2B0014 */        sw $t3, 0x14($t1)
  /* 149CC4 80133C94 0C00265A */       jal omMakeGObjSPAfter
  /* 149CC8 80133C98 AD2C0010 */        sw $t4, 0x10($t1)
  /* 149CCC 80133C9C 3C018013 */       lui $at, %hi(gMNBonusTotalTimeGobj)
  /* 149CD0 80133CA0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 149CD4 80133CA4 240DFFFF */     addiu $t5, $zero, -1
  /* 149CD8 80133CA8 AC22771C */        sw $v0, %lo(gMNBonusTotalTimeGobj)($at)
  /* 149CDC 80133CAC 00408025 */        or $s0, $v0, $zero
  /* 149CE0 80133CB0 AFAD0010 */        sw $t5, 0x10($sp)
  /* 149CE4 80133CB4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 149CE8 80133CB8 00402025 */        or $a0, $v0, $zero
  /* 149CEC 80133CBC 2406001A */     addiu $a2, $zero, 0x1a
  /* 149CF0 80133CC0 0C00277D */       jal omAddGObjRenderProc
  /* 149CF4 80133CC4 3C078000 */       lui $a3, 0x8000
  /* 149CF8 80133CC8 3C0E8013 */       lui $t6, %hi(D_ovl29_80137E0C)
  /* 149CFC 80133CCC 8DCE7E0C */        lw $t6, %lo(D_ovl29_80137E0C)($t6)
  /* 149D00 80133CD0 3C0F0000 */       lui $t7, %hi(D_NF_00001410)
  /* 149D04 80133CD4 25EF1410 */     addiu $t7, $t7, %lo(D_NF_00001410)
  /* 149D08 80133CD8 02002025 */        or $a0, $s0, $zero
  /* 149D0C 80133CDC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149D10 80133CE0 01CF2821 */      addu $a1, $t6, $t7
  /* 149D14 80133CE4 94580024 */       lhu $t8, 0x24($v0)
  /* 149D18 80133CE8 3C01430E */       lui $at, (0x430E0000 >> 16) # 142.0
  /* 149D1C 80133CEC 44812000 */      mtc1 $at, $f4 # 142.0 to cop1
  /* 149D20 80133CF0 3C014351 */       lui $at, (0x43510000 >> 16) # 209.0
  /* 149D24 80133CF4 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 149D28 80133CF8 44813000 */      mtc1 $at, $f6 # 209.0 to cop1
  /* 149D2C 80133CFC A4490024 */        sh $t1, 0x24($v0)
  /* 149D30 80133D00 352A0001 */       ori $t2, $t1, 1
  /* 149D34 80133D04 240B007E */     addiu $t3, $zero, 0x7e
  /* 149D38 80133D08 240C007C */     addiu $t4, $zero, 0x7c
  /* 149D3C 80133D0C 240D0077 */     addiu $t5, $zero, 0x77
  /* 149D40 80133D10 A44A0024 */        sh $t2, 0x24($v0)
  /* 149D44 80133D14 A04B0028 */        sb $t3, 0x28($v0)
  /* 149D48 80133D18 A04C0029 */        sb $t4, 0x29($v0)
  /* 149D4C 80133D1C A04D002A */        sb $t5, 0x2a($v0)
  /* 149D50 80133D20 E4440058 */      swc1 $f4, 0x58($v0)
  /* 149D54 80133D24 0C04CD92 */       jal mnBonusGetTotalCentiseconds
  /* 149D58 80133D28 E446005C */      swc1 $f6, 0x5c($v0)
  /* 149D5C 80133D2C 24030064 */     addiu $v1, $zero, 0x64
  /* 149D60 80133D30 0043001A */       div $zero, $v0, $v1
  /* 149D64 80133D34 00007012 */      mflo $t6
  /* 149D68 80133D38 00002810 */      mfhi $a1
  /* 149D6C 80133D3C 3C06438D */       lui $a2, (0x438D8000 >> 16) # 1133346816
  /* 149D70 80133D40 14600002 */      bnez $v1, .L80133D4C
  /* 149D74 80133D44 00000000 */       nop
  /* 149D78 80133D48 0007000D */     break 7
  .L80133D4C:
  /* 149D7C 80133D4C 2401FFFF */     addiu $at, $zero, -1
  /* 149D80 80133D50 14610004 */       bne $v1, $at, .L80133D64
  /* 149D84 80133D54 3C018000 */       lui $at, 0x8000
  /* 149D88 80133D58 14410002 */       bne $v0, $at, .L80133D64
  /* 149D8C 80133D5C 00000000 */       nop
  /* 149D90 80133D60 0006000D */     break 6
  .L80133D64:
  /* 149D94 80133D64 27AF0044 */     addiu $t7, $sp, 0x44
  /* 149D98 80133D68 24180002 */     addiu $t8, $zero, 2
  /* 149D9C 80133D6C 24190001 */     addiu $t9, $zero, 1
  /* 149DA0 80133D70 AFAE003C */        sw $t6, 0x3c($sp)
  /* 149DA4 80133D74 AFB90018 */        sw $t9, 0x18($sp)
  /* 149DA8 80133D78 AFB80014 */        sw $t8, 0x14($sp)
  /* 149DAC 80133D7C AFAF0010 */        sw $t7, 0x10($sp)
  /* 149DB0 80133D80 34C68000 */       ori $a2, $a2, (0x438D8000 & 0xFFFF) # 1133346816
  /* 149DB4 80133D84 02002025 */        or $a0, $s0, $zero
  /* 149DB8 80133D88 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149DBC 80133D8C 3C07434E */       lui $a3, 0x434e
  /* 149DC0 80133D90 3C098013 */       lui $t1, %hi(D_ovl29_80137E0C)
  /* 149DC4 80133D94 8D297E0C */        lw $t1, %lo(D_ovl29_80137E0C)($t1)
  /* 149DC8 80133D98 3C0A0000 */       lui $t2, %hi(D_NF_00001FC8)
  /* 149DCC 80133D9C 254A1FC8 */     addiu $t2, $t2, %lo(D_NF_00001FC8)
  /* 149DD0 80133DA0 02002025 */        or $a0, $s0, $zero
  /* 149DD4 80133DA4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149DD8 80133DA8 012A2821 */      addu $a1, $t1, $t2
  /* 149DDC 80133DAC 3C018013 */       lui $at, %hi(D_ovl29_801375E8)
  /* 149DE0 80133DB0 C42875E8 */      lwc1 $f8, %lo(D_ovl29_801375E8)($at)
  /* 149DE4 80133DB4 944B0024 */       lhu $t3, 0x24($v0)
  /* 149DE8 80133DB8 3C01434E */       lui $at, (0x434E0000 >> 16) # 206.0
  /* 149DEC 80133DBC 44815000 */      mtc1 $at, $f10 # 206.0 to cop1
  /* 149DF0 80133DC0 316DFFDF */      andi $t5, $t3, 0xffdf
  /* 149DF4 80133DC4 A44D0024 */        sh $t5, 0x24($v0)
  /* 149DF8 80133DC8 35AE0001 */       ori $t6, $t5, 1
  /* 149DFC 80133DCC 240F007E */     addiu $t7, $zero, 0x7e
  /* 149E00 80133DD0 2418007C */     addiu $t8, $zero, 0x7c
  /* 149E04 80133DD4 24190077 */     addiu $t9, $zero, 0x77
  /* 149E08 80133DD8 A44E0024 */        sh $t6, 0x24($v0)
  /* 149E0C 80133DDC A0400060 */        sb $zero, 0x60($v0)
  /* 149E10 80133DE0 A0400061 */        sb $zero, 0x61($v0)
  /* 149E14 80133DE4 A0400062 */        sb $zero, 0x62($v0)
  /* 149E18 80133DE8 A04F0028 */        sb $t7, 0x28($v0)
  /* 149E1C 80133DEC A0580029 */        sb $t8, 0x29($v0)
  /* 149E20 80133DF0 A059002A */        sb $t9, 0x2a($v0)
  /* 149E24 80133DF4 E4480058 */      swc1 $f8, 0x58($v0)
  /* 149E28 80133DF8 0C04CD77 */       jal mnBonusGetTotalSeconds
  /* 149E2C 80133DFC E44A005C */      swc1 $f10, 0x5c($v0)
  /* 149E30 80133E00 2408003C */     addiu $t0, $zero, 0x3c
  /* 149E34 80133E04 8FA9003C */        lw $t1, 0x3c($sp)
  /* 149E38 80133E08 3C064381 */       lui $a2, (0x43818000 >> 16) # 1132560384
  /* 149E3C 80133E0C 27AB0044 */     addiu $t3, $sp, 0x44
  /* 149E40 80133E10 00491821 */      addu $v1, $v0, $t1
  /* 149E44 80133E14 0068001A */       div $zero, $v1, $t0
  /* 149E48 80133E18 00602825 */        or $a1, $v1, $zero
  /* 149E4C 80133E1C 00005012 */      mflo $t2
  /* 149E50 80133E20 240C0002 */     addiu $t4, $zero, 2
  /* 149E54 80133E24 15000002 */      bnez $t0, .L80133E30
  /* 149E58 80133E28 00000000 */       nop
  /* 149E5C 80133E2C 0007000D */     break 7
  .L80133E30:
  /* 149E60 80133E30 2401FFFF */     addiu $at, $zero, -1
  /* 149E64 80133E34 15010004 */       bne $t0, $at, .L80133E48
  /* 149E68 80133E38 3C018000 */       lui $at, 0x8000
  /* 149E6C 80133E3C 14610002 */       bne $v1, $at, .L80133E48
  /* 149E70 80133E40 00000000 */       nop
  /* 149E74 80133E44 0006000D */     break 6
  .L80133E48:
  /* 149E78 80133E48 00A8001A */       div $zero, $a1, $t0
  /* 149E7C 80133E4C 240D0001 */     addiu $t5, $zero, 1
  /* 149E80 80133E50 AFAA003C */        sw $t2, 0x3c($sp)
  /* 149E84 80133E54 15000002 */      bnez $t0, .L80133E60
  /* 149E88 80133E58 00000000 */       nop
  /* 149E8C 80133E5C 0007000D */     break 7
  .L80133E60:
  /* 149E90 80133E60 2401FFFF */     addiu $at, $zero, -1
  /* 149E94 80133E64 15010004 */       bne $t0, $at, .L80133E78
  /* 149E98 80133E68 3C018000 */       lui $at, 0x8000
  /* 149E9C 80133E6C 14A10002 */       bne $a1, $at, .L80133E78
  /* 149EA0 80133E70 00000000 */       nop
  /* 149EA4 80133E74 0006000D */     break 6
  .L80133E78:
  /* 149EA8 80133E78 00002810 */      mfhi $a1
  /* 149EAC 80133E7C AFAD0018 */        sw $t5, 0x18($sp)
  /* 149EB0 80133E80 AFAC0014 */        sw $t4, 0x14($sp)
  /* 149EB4 80133E84 AFAB0010 */        sw $t3, 0x10($sp)
  /* 149EB8 80133E88 34C68000 */       ori $a2, $a2, (0x43818000 & 0xFFFF) # 1132560384
  /* 149EBC 80133E8C 02002025 */        or $a0, $s0, $zero
  /* 149EC0 80133E90 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149EC4 80133E94 3C07434E */       lui $a3, 0x434e
  /* 149EC8 80133E98 3C0E8013 */       lui $t6, %hi(D_ovl29_80137E0C)
  /* 149ECC 80133E9C 8DCE7E0C */        lw $t6, %lo(D_ovl29_80137E0C)($t6)
  /* 149ED0 80133EA0 3C0F0000 */       lui $t7, %hi(D_NF_00001F48)
  /* 149ED4 80133EA4 25EF1F48 */     addiu $t7, $t7, %lo(D_NF_00001F48)
  /* 149ED8 80133EA8 02002025 */        or $a0, $s0, $zero
  /* 149EDC 80133EAC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 149EE0 80133EB0 01CF2821 */      addu $a1, $t6, $t7
  /* 149EE4 80133EB4 94580024 */       lhu $t8, 0x24($v0)
  /* 149EE8 80133EB8 3C01436F */       lui $at, (0x436F0000 >> 16) # 239.0
  /* 149EEC 80133EBC 44818000 */      mtc1 $at, $f16 # 239.0 to cop1
  /* 149EF0 80133EC0 3C01434E */       lui $at, (0x434E0000 >> 16) # 206.0
  /* 149EF4 80133EC4 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 149EF8 80133EC8 44819000 */      mtc1 $at, $f18 # 206.0 to cop1
  /* 149EFC 80133ECC A4490024 */        sh $t1, 0x24($v0)
  /* 149F00 80133ED0 352A0001 */       ori $t2, $t1, 1
  /* 149F04 80133ED4 240B007E */     addiu $t3, $zero, 0x7e
  /* 149F08 80133ED8 240C007C */     addiu $t4, $zero, 0x7c
  /* 149F0C 80133EDC 240D0077 */     addiu $t5, $zero, 0x77
  /* 149F10 80133EE0 A44A0024 */        sh $t2, 0x24($v0)
  /* 149F14 80133EE4 A0400060 */        sb $zero, 0x60($v0)
  /* 149F18 80133EE8 A0400061 */        sb $zero, 0x61($v0)
  /* 149F1C 80133EEC A0400062 */        sb $zero, 0x62($v0)
  /* 149F20 80133EF0 A04B0028 */        sb $t3, 0x28($v0)
  /* 149F24 80133EF4 A04C0029 */        sb $t4, 0x29($v0)
  /* 149F28 80133EF8 A04D002A */        sb $t5, 0x2a($v0)
  /* 149F2C 80133EFC E4500058 */      swc1 $f16, 0x58($v0)
  /* 149F30 80133F00 0C04CD5C */       jal mnBonusGetTotalMinutes
  /* 149F34 80133F04 E452005C */      swc1 $f18, 0x5c($v0)
  /* 149F38 80133F08 8FAE003C */        lw $t6, 0x3c($sp)
  /* 149F3C 80133F0C 27AF0044 */     addiu $t7, $sp, 0x44
  /* 149F40 80133F10 24180003 */     addiu $t8, $zero, 3
  /* 149F44 80133F14 24190001 */     addiu $t9, $zero, 1
  /* 149F48 80133F18 AFB90018 */        sw $t9, 0x18($sp)
  /* 149F4C 80133F1C AFB80014 */        sw $t8, 0x14($sp)
  /* 149F50 80133F20 AFAF0010 */        sw $t7, 0x10($sp)
  /* 149F54 80133F24 02002025 */        or $a0, $s0, $zero
  /* 149F58 80133F28 3C06436D */       lui $a2, 0x436d
  /* 149F5C 80133F2C 3C07434E */       lui $a3, 0x434e
  /* 149F60 80133F30 0C04C73B */       jal mnBonusCreateSmallerNumber
  /* 149F64 80133F34 004E2821 */      addu $a1, $v0, $t6
  /* 149F68 80133F38 8FBF002C */        lw $ra, 0x2c($sp)
  /* 149F6C 80133F3C 8FB00028 */        lw $s0, 0x28($sp)
  /* 149F70 80133F40 27BD0078 */     addiu $sp, $sp, 0x78
  /* 149F74 80133F44 03E00008 */        jr $ra
  /* 149F78 80133F48 00000000 */       nop

  /* 149F7C 80133F4C 03E00008 */        jr $ra
  /* 149F80 80133F50 00000000 */       nop

  /* 149F84 80133F54 03E00008 */        jr $ra
  /* 149F88 80133F58 00000000 */       nop

glabel mnBonusGetAvailableCostume
  /* 149F8C 80133F5C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 149F90 80133F60 AFBF0014 */        sw $ra, 0x14($sp)
  /* 149F94 80133F64 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 149F98 80133F68 AFA40018 */        sw $a0, 0x18($sp)
  /* 149F9C 80133F6C 8FA40018 */        lw $a0, 0x18($sp)
  /* 149FA0 80133F70 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 149FA4 80133F74 00402825 */        or $a1, $v0, $zero
  /* 149FA8 80133F78 8FBF0014 */        lw $ra, 0x14($sp)
  /* 149FAC 80133F7C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 149FB0 80133F80 03E00008 */        jr $ra
  /* 149FB4 80133F84 00000000 */       nop

glabel mnBonusGetSelectedAnimation
  /* 149FB8 80133F88 2C81000C */     sltiu $at, $a0, 0xc
  /* 149FBC 80133F8C 10200012 */      beqz $at, jtgt_ovl29_80133FD8
  /* 149FC0 80133F90 00047080 */       sll $t6, $a0, 2
  /* 149FC4 80133F94 3C018013 */       lui $at, %hi(jtbl_ovl29_801375EC)
  /* 149FC8 80133F98 002E0821 */      addu $at, $at, $t6
  /* 149FCC 80133F9C 8C2E75EC */        lw $t6, %lo(jtbl_ovl29_801375EC)($at)
  /* 149FD0 80133FA0 01C00008 */        jr $t6
  /* 149FD4 80133FA4 00000000 */       nop
  glabel jtgt_ovl29_80133FA8
  /* 149FD8 80133FA8 3C020001 */       lui $v0, (0x10004 >> 16) # 65540
  /* 149FDC 80133FAC 03E00008 */        jr $ra
  /* 149FE0 80133FB0 34420004 */       ori $v0, $v0, (0x10004 & 0xFFFF) # 65540

  glabel jtgt_ovl29_80133FB4
  /* 149FE4 80133FB4 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 149FE8 80133FB8 03E00008 */        jr $ra
  /* 149FEC 80133FBC 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537

  glabel jtgt_ovl29_80133FC0
  /* 149FF0 80133FC0 3C020001 */       lui $v0, (0x10002 >> 16) # 65538
  /* 149FF4 80133FC4 03E00008 */        jr $ra
  /* 149FF8 80133FC8 34420002 */       ori $v0, $v0, (0x10002 & 0xFFFF) # 65538

  glabel jtgt_ovl29_80133FCC
  /* 149FFC 80133FCC 3C020001 */       lui $v0, (0x10003 >> 16) # 65539
  /* 14A000 80133FD0 03E00008 */        jr $ra
  /* 14A004 80133FD4 34420003 */       ori $v0, $v0, (0x10003 & 0xFFFF) # 65539

  glabel jtgt_ovl29_80133FD8
  /* 14A008 80133FD8 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 14A00C 80133FDC 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537
  /* 14A010 80133FE0 03E00008 */        jr $ra
  /* 14A014 80133FE4 00000000 */       nop

glabel mnBonusRotateFighter
  /* 14A018 80133FE8 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14A01C 80133FEC AFB00018 */        sw $s0, 0x18($sp)
  /* 14A020 80133FF0 3C108013 */       lui $s0, %hi(gMNBonusPanel)
  /* 14A024 80133FF4 26107648 */     addiu $s0, $s0, %lo(gMNBonusPanel)
  /* 14A028 80133FF8 8E0E0058 */        lw $t6, 0x58($s0) # gMNBonusPanel + 88
  /* 14A02C 80133FFC 24010001 */     addiu $at, $zero, 1
  /* 14A030 80134000 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14A034 80134004 55C1002C */      bnel $t6, $at, .L801340B8
  /* 14A038 80134008 8C820074 */        lw $v0, 0x74($a0)
  /* 14A03C 8013400C 8C820074 */        lw $v0, 0x74($a0)
  /* 14A040 80134010 3C018013 */       lui $at, %hi(D_ovl29_8013761C)
  /* 14A044 80134014 C424761C */      lwc1 $f4, %lo(D_ovl29_8013761C)($at)
  /* 14A048 80134018 C4400034 */      lwc1 $f0, 0x34($v0)
  /* 14A04C 8013401C 3C018013 */       lui $at, 0x8013
  /* 14A050 80134020 4604003C */    c.lt.s $f0, $f4
  /* 14A054 80134024 00000000 */       nop
  /* 14A058 80134028 4500000C */      bc1f .L8013405C
  /* 14A05C 8013402C 00000000 */       nop
  /* 14A060 80134030 8E0F005C */        lw $t7, 0x5c($s0) # gMNBonusPanel + 92
  /* 14A064 80134034 55E00030 */      bnel $t7, $zero, .L801340F8
  /* 14A068 80134038 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14A06C 8013403C 0C04CFE2 */       jal mnBonusGetSelectedAnimation
  /* 14A070 80134040 8E040020 */        lw $a0, 0x20($s0) # gMNBonusPanel + 32
  /* 14A074 80134044 8E040008 */        lw $a0, 8($s0) # gMNBonusPanel + 8
  /* 14A078 80134048 0C0E4173 */       jal func_ovl1_803905CC
  /* 14A07C 8013404C 00402825 */        or $a1, $v0, $zero
  /* 14A080 80134050 24180001 */     addiu $t8, $zero, 1
  /* 14A084 80134054 10000027 */         b .L801340F4
  /* 14A088 80134058 AE18005C */        sw $t8, 0x5c($s0) # gMNBonusPanel + 92
  .L8013405C:
  /* 14A08C 8013405C C4227620 */      lwc1 $f2, 0x7620($at)
  /* 14A090 80134060 3C018013 */       lui $at, %hi(D_ovl29_80137624)
  /* 14A094 80134064 C4267624 */      lwc1 $f6, %lo(D_ovl29_80137624)($at)
  /* 14A098 80134068 46060200 */     add.s $f8, $f0, $f6
  /* 14A09C 8013406C E4480034 */      swc1 $f8, 0x34($v0)
  /* 14A0A0 80134070 8C820074 */        lw $v0, 0x74($a0)
  /* 14A0A4 80134074 C44A0034 */      lwc1 $f10, 0x34($v0)
  /* 14A0A8 80134078 460A103C */    c.lt.s $f2, $f10
  /* 14A0AC 8013407C 00000000 */       nop
  /* 14A0B0 80134080 4502001D */     bc1fl .L801340F8
  /* 14A0B4 80134084 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14A0B8 80134088 44808000 */      mtc1 $zero, $f16
  /* 14A0BC 8013408C 00000000 */       nop
  /* 14A0C0 80134090 E4500034 */      swc1 $f16, 0x34($v0)
  /* 14A0C4 80134094 0C04CFE2 */       jal mnBonusGetSelectedAnimation
  /* 14A0C8 80134098 8E040020 */        lw $a0, 0x20($s0) # gMNBonusPanel + 32
  /* 14A0CC 8013409C 8E040008 */        lw $a0, 8($s0) # gMNBonusPanel + 8
  /* 14A0D0 801340A0 0C0E4173 */       jal func_ovl1_803905CC
  /* 14A0D4 801340A4 00402825 */        or $a1, $v0, $zero
  /* 14A0D8 801340A8 24190001 */     addiu $t9, $zero, 1
  /* 14A0DC 801340AC 10000011 */         b .L801340F4
  /* 14A0E0 801340B0 AE19005C */        sw $t9, 0x5c($s0) # gMNBonusPanel + 92
  /* 14A0E4 801340B4 8C820074 */        lw $v0, 0x74($a0)
  .L801340B8:
  /* 14A0E8 801340B8 3C018013 */       lui $at, %hi(D_ovl29_80137628)
  /* 14A0EC 801340BC C4227628 */      lwc1 $f2, %lo(D_ovl29_80137628)($at)
  /* 14A0F0 801340C0 3C018013 */       lui $at, %hi(D_ovl29_8013762C)
  /* 14A0F4 801340C4 C424762C */      lwc1 $f4, %lo(D_ovl29_8013762C)($at)
  /* 14A0F8 801340C8 C4520034 */      lwc1 $f18, 0x34($v0)
  /* 14A0FC 801340CC 46049180 */     add.s $f6, $f18, $f4
  /* 14A100 801340D0 E4460034 */      swc1 $f6, 0x34($v0)
  /* 14A104 801340D4 8C820074 */        lw $v0, 0x74($a0)
  /* 14A108 801340D8 C4400034 */      lwc1 $f0, 0x34($v0)
  /* 14A10C 801340DC 4600103C */    c.lt.s $f2, $f0
  /* 14A110 801340E0 00000000 */       nop
  /* 14A114 801340E4 45020004 */     bc1fl .L801340F8
  /* 14A118 801340E8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14A11C 801340EC 46020201 */     sub.s $f8, $f0, $f2
  /* 14A120 801340F0 E4480034 */      swc1 $f8, 0x34($v0)
  .L801340F4:
  /* 14A124 801340F4 8FBF001C */        lw $ra, 0x1c($sp)
  .L801340F8:
  /* 14A128 801340F8 8FB00018 */        lw $s0, 0x18($sp)
  /* 14A12C 801340FC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 14A130 80134100 03E00008 */        jr $ra
  /* 14A134 80134104 00000000 */       nop

glabel mnBonusSpawnFighter
  /* 14A138 80134108 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 14A13C 8013410C 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 14A140 80134110 AFB00018 */        sw $s0, 0x18($sp)
  /* 14A144 80134114 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 14A148 80134118 00808025 */        or $s0, $a0, $zero
  /* 14A14C 8013411C AFBF001C */        sw $ra, 0x1c($sp)
  /* 14A150 80134120 AFA5006C */        sw $a1, 0x6c($sp)
  /* 14A154 80134124 AFA60070 */        sw $a2, 0x70($sp)
  /* 14A158 80134128 25E8003C */     addiu $t0, $t7, 0x3c
  /* 14A15C 8013412C 27AE0024 */     addiu $t6, $sp, 0x24
  .L80134130:
  /* 14A160 80134130 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 14A164 80134134 25EF000C */     addiu $t7, $t7, 0xc
  /* 14A168 80134138 25CE000C */     addiu $t6, $t6, 0xc
  /* 14A16C 8013413C ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 14A170 80134140 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 14A174 80134144 ADD8FFF8 */        sw $t8, -8($t6)
  /* 14A178 80134148 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 14A17C 8013414C 15E8FFF8 */       bne $t7, $t0, .L80134130
  /* 14A180 80134150 ADD9FFFC */        sw $t9, -4($t6)
  /* 14A184 80134154 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 14A188 80134158 2401001C */     addiu $at, $zero, 0x1c
  /* 14A18C 8013415C ADD90000 */        sw $t9, ($t6)
  /* 14A190 80134160 8FA90070 */        lw $t1, 0x70($sp)
  /* 14A194 80134164 5121003F */      beql $t1, $at, .L80134264
  /* 14A198 80134168 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14A19C 8013416C 52000009 */      beql $s0, $zero, .L80134194
  /* 14A1A0 80134170 44803000 */      mtc1 $zero, $f6
  /* 14A1A4 80134174 8E0A0074 */        lw $t2, 0x74($s0)
  /* 14A1A8 80134178 02002025 */        or $a0, $s0, $zero
  /* 14A1AC 8013417C C5440034 */      lwc1 $f4, 0x34($t2)
  /* 14A1B0 80134180 0C035E3A */       jal ftManagerDestroyFighter
  /* 14A1B4 80134184 E7A40064 */      swc1 $f4, 0x64($sp)
  /* 14A1B8 80134188 10000005 */         b .L801341A0
  /* 14A1BC 8013418C 8FA40070 */        lw $a0, 0x70($sp)
  /* 14A1C0 80134190 44803000 */      mtc1 $zero, $f6
  .L80134194:
  /* 14A1C4 80134194 00000000 */       nop
  /* 14A1C8 80134198 E7A60064 */      swc1 $f6, 0x64($sp)
  /* 14A1CC 8013419C 8FA40070 */        lw $a0, 0x70($sp)
  .L801341A0:
  /* 14A1D0 801341A0 00002825 */        or $a1, $zero, $zero
  /* 14A1D4 801341A4 0C04CFD7 */       jal mnBonusGetAvailableCostume
  /* 14A1D8 801341A8 AFA40024 */        sw $a0, 0x24($sp)
  /* 14A1DC 801341AC 3C0D8013 */       lui $t5, %hi(gMNBonusAnimHeap)
  /* 14A1E0 801341B0 8DAD7710 */        lw $t5, %lo(gMNBonusAnimHeap)($t5)
  /* 14A1E4 801341B4 8FA8006C */        lw $t0, 0x6c($sp)
  /* 14A1E8 801341B8 304C00FF */      andi $t4, $v0, 0xff
  /* 14A1EC 801341BC 3C018013 */       lui $at, %hi(D_ovl29_8013766C)
  /* 14A1F0 801341C0 AC2C766C */        sw $t4, %lo(D_ovl29_8013766C)($at)
  /* 14A1F4 801341C4 A3A2003B */        sb $v0, 0x3b($sp)
  /* 14A1F8 801341C8 27A40024 */     addiu $a0, $sp, 0x24
  /* 14A1FC 801341CC AFAD005C */        sw $t5, 0x5c($sp)
  /* 14A200 801341D0 0C035FCF */       jal ftManagerMakeFighter
  /* 14A204 801341D4 A3A80039 */        sb $t0, 0x39($sp)
  /* 14A208 801341D8 3C018013 */       lui $at, %hi(D_ovl29_80137650)
  /* 14A20C 801341DC 3C058013 */       lui $a1, %hi(mnBonusRotateFighter)
  /* 14A210 801341E0 AC227650 */        sw $v0, %lo(D_ovl29_80137650)($at)
  /* 14A214 801341E4 00408025 */        or $s0, $v0, $zero
  /* 14A218 801341E8 24A53FE8 */     addiu $a1, $a1, %lo(mnBonusRotateFighter)
  /* 14A21C 801341EC 00402025 */        or $a0, $v0, $zero
  /* 14A220 801341F0 24060001 */     addiu $a2, $zero, 1
  /* 14A224 801341F4 0C002062 */       jal omAddGObjCommonProc
  /* 14A228 801341F8 24070001 */     addiu $a3, $zero, 1
  /* 14A22C 801341FC 3C01C42F */       lui $at, (0xC42F0000 >> 16) # -700.0
  /* 14A230 80134200 44814000 */      mtc1 $at, $f8 # -700.0 to cop1
  /* 14A234 80134204 8E0F0074 */        lw $t7, 0x74($s0)
  /* 14A238 80134208 3C018013 */       lui $at, %hi(D_ovl29_80137630)
  /* 14A23C 8013420C 3C0A8039 */       lui $t2, %hi(D_ovl1_80390D90)
  /* 14A240 80134210 E5E8001C */      swc1 $f8, 0x1c($t7)
  /* 14A244 80134214 8E0E0074 */        lw $t6, 0x74($s0)
  /* 14A248 80134218 C42A7630 */      lwc1 $f10, %lo(D_ovl29_80137630)($at)
  /* 14A24C 8013421C 254A0D90 */     addiu $t2, $t2, %lo(D_ovl1_80390D90)
  /* 14A250 80134220 E5CA0020 */      swc1 $f10, 0x20($t6)
  /* 14A254 80134224 8E180074 */        lw $t8, 0x74($s0)
  /* 14A258 80134228 C7B00064 */      lwc1 $f16, 0x64($sp)
  /* 14A25C 8013422C E7100034 */      swc1 $f16, 0x34($t8)
  /* 14A260 80134230 8FB90070 */        lw $t9, 0x70($sp)
  /* 14A264 80134234 8E0B0074 */        lw $t3, 0x74($s0)
  /* 14A268 80134238 00194880 */       sll $t1, $t9, 2
  /* 14A26C 8013423C 012A1821 */      addu $v1, $t1, $t2
  /* 14A270 80134240 C4720000 */      lwc1 $f18, ($v1)
  /* 14A274 80134244 E5720040 */      swc1 $f18, 0x40($t3)
  /* 14A278 80134248 8E0C0074 */        lw $t4, 0x74($s0)
  /* 14A27C 8013424C C4640000 */      lwc1 $f4, ($v1)
  /* 14A280 80134250 E5840044 */      swc1 $f4, 0x44($t4)
  /* 14A284 80134254 8E0D0074 */        lw $t5, 0x74($s0)
  /* 14A288 80134258 C4660000 */      lwc1 $f6, ($v1)
  /* 14A28C 8013425C E5A60048 */      swc1 $f6, 0x48($t5)
  /* 14A290 80134260 8FBF001C */        lw $ra, 0x1c($sp)
  .L80134264:
  /* 14A294 80134264 8FB00018 */        lw $s0, 0x18($sp)
  /* 14A298 80134268 27BD0068 */     addiu $sp, $sp, 0x68
  /* 14A29C 8013426C 03E00008 */        jr $ra
  /* 14A2A0 80134270 00000000 */       nop

glabel mnBonusCreateFighterViewport
  /* 14A2A4 80134274 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 14A2A8 80134278 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 14A2AC 8013427C 3C190004 */       lui $t9, (0x48600 >> 16) # 296448
  /* 14A2B0 80134280 AFBF003C */        sw $ra, 0x3c($sp)
  /* 14A2B4 80134284 37398600 */       ori $t9, $t9, (0x48600 & 0xFFFF) # 296448
  /* 14A2B8 80134288 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 14A2BC 8013428C 240F0014 */     addiu $t7, $zero, 0x14
  /* 14A2C0 80134290 24180000 */     addiu $t8, $zero, 0
  /* 14A2C4 80134294 2408FFFF */     addiu $t0, $zero, -1
  /* 14A2C8 80134298 24090001 */     addiu $t1, $zero, 1
  /* 14A2CC 8013429C 240A0001 */     addiu $t2, $zero, 1
  /* 14A2D0 801342A0 240B0001 */     addiu $t3, $zero, 1
  /* 14A2D4 801342A4 AFAB0030 */        sw $t3, 0x30($sp)
  /* 14A2D8 801342A8 AFAA0028 */        sw $t2, 0x28($sp)
  /* 14A2DC 801342AC AFA90024 */        sw $t1, 0x24($sp)
  /* 14A2E0 801342B0 AFA80020 */        sw $t0, 0x20($sp)
  /* 14A2E4 801342B4 AFB80018 */        sw $t8, 0x18($sp)
  /* 14A2E8 801342B8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 14A2EC 801342BC AFAE0010 */        sw $t6, 0x10($sp)
  /* 14A2F0 801342C0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 14A2F4 801342C4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 14A2F8 801342C8 AFA00034 */        sw $zero, 0x34($sp)
  /* 14A2FC 801342CC 24040401 */     addiu $a0, $zero, 0x401
  /* 14A300 801342D0 00002825 */        or $a1, $zero, $zero
  /* 14A304 801342D4 24060010 */     addiu $a2, $zero, 0x10
  /* 14A308 801342D8 0C002E4F */       jal func_8000B93C
  /* 14A30C 801342DC 3C078000 */       lui $a3, 0x8000
  /* 14A310 801342E0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14A314 801342E4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14A318 801342E8 8C430074 */        lw $v1, 0x74($v0)
  /* 14A31C 801342EC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 14A320 801342F0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14A324 801342F4 44050000 */      mfc1 $a1, $f0
  /* 14A328 801342F8 44060000 */      mfc1 $a2, $f0
  /* 14A32C 801342FC 3C07439B */       lui $a3, 0x439b
  /* 14A330 80134300 24640008 */     addiu $a0, $v1, 8
  /* 14A334 80134304 AFA30044 */        sw $v1, 0x44($sp)
  /* 14A338 80134308 0C001C20 */       jal func_80007080
  /* 14A33C 8013430C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 14A340 80134310 8FA30044 */        lw $v1, 0x44($sp)
  /* 14A344 80134314 44800000 */      mtc1 $zero, $f0
  /* 14A348 80134318 3C018013 */       lui $at, %hi(D_ovl29_80137634)
  /* 14A34C 8013431C 240C0004 */     addiu $t4, $zero, 4
  /* 14A350 80134320 E460003C */      swc1 $f0, 0x3c($v1)
  /* 14A354 80134324 E4600040 */      swc1 $f0, 0x40($v1)
  /* 14A358 80134328 C4267634 */      lwc1 $f6, %lo(D_ovl29_80137634)($at)
  /* 14A35C 8013432C 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 14A360 80134330 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 14A364 80134334 AC6C0080 */        sw $t4, 0x80($v1)
  /* 14A368 80134338 E4600048 */      swc1 $f0, 0x48($v1)
  /* 14A36C 8013433C E460004C */      swc1 $f0, 0x4c($v1)
  /* 14A370 80134340 E4600050 */      swc1 $f0, 0x50($v1)
  /* 14A374 80134344 E4600054 */      swc1 $f0, 0x54($v1)
  /* 14A378 80134348 E460005C */      swc1 $f0, 0x5c($v1)
  /* 14A37C 8013434C E4660044 */      swc1 $f6, 0x44($v1)
  /* 14A380 80134350 E4680058 */      swc1 $f8, 0x58($v1)
  /* 14A384 80134354 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14A388 80134358 27BD0048 */     addiu $sp, $sp, 0x48
  /* 14A38C 8013435C 03E00008 */        jr $ra
  /* 14A390 80134360 00000000 */       nop

glabel mnBonusRedrawCursor
  /* 14A394 80134364 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 14A398 80134368 3C0F8013 */       lui $t7, %hi(dMNBonusCursorTypeColors)
  /* 14A39C 8013436C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14A3A0 80134370 AFA5007C */        sw $a1, 0x7c($sp)
  /* 14A3A4 80134374 AFA60080 */        sw $a2, 0x80($sp)
  /* 14A3A8 80134378 25EF7410 */     addiu $t7, $t7, %lo(dMNBonusCursorTypeColors)
  /* 14A3AC 8013437C 8DF90000 */        lw $t9, ($t7) # dMNBonusCursorTypeColors + 0
  /* 14A3B0 80134380 8DF80004 */        lw $t8, 4($t7) # dMNBonusCursorTypeColors + 4
  /* 14A3B4 80134384 27AE0054 */     addiu $t6, $sp, 0x54
  /* 14A3B8 80134388 ADD90000 */        sw $t9, ($t6)
  /* 14A3BC 8013438C ADD80004 */        sw $t8, 4($t6)
  /* 14A3C0 80134390 8DF8000C */        lw $t8, 0xc($t7) # dMNBonusCursorTypeColors + 12
  /* 14A3C4 80134394 8DF90008 */        lw $t9, 8($t7) # dMNBonusCursorTypeColors + 8
  /* 14A3C8 80134398 3C098013 */       lui $t1, %hi(dMNBonusCursorTypeOffsets)
  /* 14A3CC 8013439C ADD8000C */        sw $t8, 0xc($t6)
  /* 14A3D0 801343A0 ADD90008 */        sw $t9, 8($t6)
  /* 14A3D4 801343A4 8DF90010 */        lw $t9, 0x10($t7) # dMNBonusCursorTypeColors + 16
  /* 14A3D8 801343A8 8DF80014 */        lw $t8, 0x14($t7) # dMNBonusCursorTypeColors + 20
  /* 14A3DC 801343AC 25297428 */     addiu $t1, $t1, %lo(dMNBonusCursorTypeOffsets)
  /* 14A3E0 801343B0 ADD90010 */        sw $t9, 0x10($t6)
  /* 14A3E4 801343B4 ADD80014 */        sw $t8, 0x14($t6)
  /* 14A3E8 801343B8 8D2A0004 */        lw $t2, 4($t1) # dMNBonusCursorTypeOffsets + 4
  /* 14A3EC 801343BC 8D2B0000 */        lw $t3, ($t1) # dMNBonusCursorTypeOffsets + 0
  /* 14A3F0 801343C0 27A80044 */     addiu $t0, $sp, 0x44
  /* 14A3F4 801343C4 AD0A0004 */        sw $t2, 4($t0)
  /* 14A3F8 801343C8 AD0B0000 */        sw $t3, ($t0)
  /* 14A3FC 801343CC 8D2B0008 */        lw $t3, 8($t1) # dMNBonusCursorTypeOffsets + 8
  /* 14A400 801343D0 8D2A000C */        lw $t2, 0xc($t1) # dMNBonusCursorTypeOffsets + 12
  /* 14A404 801343D4 3C0D8013 */       lui $t5, %hi(dMNBonusCursorOffsets)
  /* 14A408 801343D8 25AD7438 */     addiu $t5, $t5, %lo(dMNBonusCursorOffsets)
  /* 14A40C 801343DC AD0B0008 */        sw $t3, 8($t0)
  /* 14A410 801343E0 AD0A000C */        sw $t2, 0xc($t0)
  /* 14A414 801343E4 8DAF0000 */        lw $t7, ($t5) # dMNBonusCursorOffsets + 0
  /* 14A418 801343E8 27AC0038 */     addiu $t4, $sp, 0x38
  /* 14A41C 801343EC 8DAE0004 */        lw $t6, 4($t5) # dMNBonusCursorOffsets + 4
  /* 14A420 801343F0 AD8F0000 */        sw $t7, ($t4)
  /* 14A424 801343F4 8DAF0008 */        lw $t7, 8($t5) # dMNBonusCursorOffsets + 8
  /* 14A428 801343F8 3C198013 */       lui $t9, %hi(dMNBonusCursorTypePositions)
  /* 14A42C 801343FC 27397444 */     addiu $t9, $t9, %lo(dMNBonusCursorTypePositions)
  /* 14A430 80134400 AD8E0004 */        sw $t6, 4($t4)
  /* 14A434 80134404 AD8F0008 */        sw $t7, 8($t4)
  /* 14A438 80134408 8F280004 */        lw $t0, 4($t9) # dMNBonusCursorTypePositions + 4
  /* 14A43C 8013440C 8F290000 */        lw $t1, ($t9) # dMNBonusCursorTypePositions + 0
  /* 14A440 80134410 27B80020 */     addiu $t8, $sp, 0x20
  /* 14A444 80134414 AF080004 */        sw $t0, 4($t8)
  /* 14A448 80134418 AF090000 */        sw $t1, ($t8)
  /* 14A44C 8013441C 8F290008 */        lw $t1, 8($t9) # dMNBonusCursorTypePositions + 8
  /* 14A450 80134420 8F28000C */        lw $t0, 0xc($t9) # dMNBonusCursorTypePositions + 12
  /* 14A454 80134424 AF090008 */        sw $t1, 8($t8)
  /* 14A458 80134428 AF08000C */        sw $t0, 0xc($t8)
  /* 14A45C 8013442C 8F280014 */        lw $t0, 0x14($t9) # dMNBonusCursorTypePositions + 20
  /* 14A460 80134430 8F290010 */        lw $t1, 0x10($t9) # dMNBonusCursorTypePositions + 16
  /* 14A464 80134434 AF080014 */        sw $t0, 0x14($t8)
  /* 14A468 80134438 AF090010 */        sw $t1, 0x10($t8)
  /* 14A46C 8013443C 8C820074 */        lw $v0, 0x74($a0)
  /* 14A470 80134440 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14A474 80134444 E7A40070 */      swc1 $f4, 0x70($sp)
  /* 14A478 80134448 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 14A47C 8013444C AFA40078 */        sw $a0, 0x78($sp)
  /* 14A480 80134450 0C002DD8 */       jal func_8000B760
  /* 14A484 80134454 E7A6006C */      swc1 $f6, 0x6c($sp)
  /* 14A488 80134458 8FAA0080 */        lw $t2, 0x80($sp)
  /* 14A48C 8013445C 3C0D8013 */       lui $t5, %hi(D_ovl29_80137DF8)
  /* 14A490 80134460 8DAD7DF8 */        lw $t5, %lo(D_ovl29_80137DF8)($t5)
  /* 14A494 80134464 000A5880 */       sll $t3, $t2, 2
  /* 14A498 80134468 03AB6021 */      addu $t4, $sp, $t3
  /* 14A49C 8013446C 8D8C0038 */        lw $t4, 0x38($t4)
  /* 14A4A0 80134470 8FA40078 */        lw $a0, 0x78($sp)
  /* 14A4A4 80134474 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14A4A8 80134478 018D2821 */      addu $a1, $t4, $t5
  /* 14A4AC 8013447C C7A80070 */      lwc1 $f8, 0x70($sp)
  /* 14A4B0 80134480 944E0024 */       lhu $t6, 0x24($v0)
  /* 14A4B4 80134484 3C0B8013 */       lui $t3, %hi(D_ovl29_80137DF8)
  /* 14A4B8 80134488 E4480058 */      swc1 $f8, 0x58($v0)
  /* 14A4BC 8013448C C7AA006C */      lwc1 $f10, 0x6c($sp)
  /* 14A4C0 80134490 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 14A4C4 80134494 A4580024 */        sh $t8, 0x24($v0)
  /* 14A4C8 80134498 37190001 */       ori $t9, $t8, 1
  /* 14A4CC 8013449C A4590024 */        sh $t9, 0x24($v0)
  /* 14A4D0 801344A0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 14A4D4 801344A4 8FA8007C */        lw $t0, 0x7c($sp)
  /* 14A4D8 801344A8 8D6B7DF8 */        lw $t3, %lo(D_ovl29_80137DF8)($t3)
  /* 14A4DC 801344AC 8FA40078 */        lw $a0, 0x78($sp)
  /* 14A4E0 801344B0 00084880 */       sll $t1, $t0, 2
  /* 14A4E4 801344B4 03A95021 */      addu $t2, $sp, $t1
  /* 14A4E8 801344B8 8D4A0044 */        lw $t2, 0x44($t2)
  /* 14A4EC 801344BC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14A4F0 801344C0 014B2821 */      addu $a1, $t2, $t3
  /* 14A4F4 801344C4 8FAC0080 */        lw $t4, 0x80($sp)
  /* 14A4F8 801344C8 27AE0020 */     addiu $t6, $sp, 0x20
  /* 14A4FC 801344CC 8C45000C */        lw $a1, 0xc($v0)
  /* 14A500 801344D0 000C68C0 */       sll $t5, $t4, 3
  /* 14A504 801344D4 01AE2021 */      addu $a0, $t5, $t6
  /* 14A508 801344D8 8C8F0000 */        lw $t7, ($a0)
  /* 14A50C 801344DC C4A40058 */      lwc1 $f4, 0x58($a1)
  /* 14A510 801344E0 94590024 */       lhu $t9, 0x24($v0)
  /* 14A514 801344E4 448F8000 */      mtc1 $t7, $f16
  /* 14A518 801344E8 27AD0054 */     addiu $t5, $sp, 0x54
  /* 14A51C 801344EC 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 14A520 801344F0 468084A0 */   cvt.s.w $f18, $f16
  /* 14A524 801344F4 352A0001 */       ori $t2, $t1, 1
  /* 14A528 801344F8 46049180 */     add.s $f6, $f18, $f4
  /* 14A52C 801344FC E4460058 */      swc1 $f6, 0x58($v0)
  /* 14A530 80134500 8C980004 */        lw $t8, 4($a0)
  /* 14A534 80134504 C4B0005C */      lwc1 $f16, 0x5c($a1)
  /* 14A538 80134508 A4490024 */        sh $t1, 0x24($v0)
  /* 14A53C 8013450C 44984000 */      mtc1 $t8, $f8
  /* 14A540 80134510 A44A0024 */        sh $t2, 0x24($v0)
  /* 14A544 80134514 468042A0 */   cvt.s.w $f10, $f8
  /* 14A548 80134518 46105480 */     add.s $f18, $f10, $f16
  /* 14A54C 8013451C E452005C */      swc1 $f18, 0x5c($v0)
  /* 14A550 80134520 8FAB007C */        lw $t3, 0x7c($sp)
  /* 14A554 80134524 000B6080 */       sll $t4, $t3, 2
  /* 14A558 80134528 018B6023 */      subu $t4, $t4, $t3
  /* 14A55C 8013452C 000C6040 */       sll $t4, $t4, 1
  /* 14A560 80134530 018D1821 */      addu $v1, $t4, $t5
  /* 14A564 80134534 906E0000 */       lbu $t6, ($v1)
  /* 14A568 80134538 A04E0028 */        sb $t6, 0x28($v0)
  /* 14A56C 8013453C 906F0001 */       lbu $t7, 1($v1)
  /* 14A570 80134540 A04F0029 */        sb $t7, 0x29($v0)
  /* 14A574 80134544 90780002 */       lbu $t8, 2($v1)
  /* 14A578 80134548 A058002A */        sb $t8, 0x2a($v0)
  /* 14A57C 8013454C 90790003 */       lbu $t9, 3($v1)
  /* 14A580 80134550 A0590060 */        sb $t9, 0x60($v0)
  /* 14A584 80134554 90680004 */       lbu $t0, 4($v1)
  /* 14A588 80134558 A0480061 */        sb $t0, 0x61($v0)
  /* 14A58C 8013455C 90690005 */       lbu $t1, 5($v1)
  /* 14A590 80134560 A0490062 */        sb $t1, 0x62($v0)
  /* 14A594 80134564 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14A598 80134568 27BD0078 */     addiu $sp, $sp, 0x78
  /* 14A59C 8013456C 03E00008 */        jr $ra
  /* 14A5A0 80134570 00000000 */       nop

  /* 14A5A4 80134574 03E00008 */        jr $ra
  /* 14A5A8 80134578 00000000 */       nop

  /* 14A5AC 8013457C 03E00008 */        jr $ra
  /* 14A5B0 80134580 00000000 */       nop

glabel mnBonusCheckBackButtonPress
  /* 14A5B4 80134584 8C820074 */        lw $v0, 0x74($a0)
  /* 14A5B8 80134588 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 14A5BC 8013458C 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 14A5C0 80134590 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 14A5C4 80134594 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 14A5C8 80134598 44814000 */      mtc1 $at, $f8 # 13.0 to cop1
  /* 14A5CC 8013459C 46062000 */     add.s $f0, $f4, $f6
  /* 14A5D0 801345A0 3C014208 */       lui $at, (0x42080000 >> 16) # 34.0
  /* 14A5D4 801345A4 4608003C */    c.lt.s $f0, $f8
  /* 14A5D8 801345A8 00000000 */       nop
  /* 14A5DC 801345AC 45010007 */      bc1t .L801345CC
  /* 14A5E0 801345B0 00000000 */       nop
  /* 14A5E4 801345B4 44815000 */      mtc1 $at, $f10 # 34.0 to cop1
  /* 14A5E8 801345B8 00001825 */        or $v1, $zero, $zero
  /* 14A5EC 801345BC 4600503C */    c.lt.s $f10, $f0
  /* 14A5F0 801345C0 00000000 */       nop
  /* 14A5F4 801345C4 45000003 */      bc1f .L801345D4
  /* 14A5F8 801345C8 00000000 */       nop
  .L801345CC:
  /* 14A5FC 801345CC 10000001 */         b .L801345D4
  /* 14A600 801345D0 24030001 */     addiu $v1, $zero, 1
  .L801345D4:
  /* 14A604 801345D4 10600003 */      beqz $v1, .L801345E4
  /* 14A608 801345D8 3C0141A0 */       lui $at, 0x41a0
  /* 14A60C 801345DC 03E00008 */        jr $ra
  /* 14A610 801345E0 00001025 */        or $v0, $zero, $zero

  .L801345E4:
  /* 14A614 801345E4 C4500058 */      lwc1 $f16, 0x58($v0)
  /* 14A618 801345E8 44819000 */      mtc1 $at, $f18
  /* 14A61C 801345EC 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 14A620 801345F0 44812000 */      mtc1 $at, $f4 # 244.0 to cop1
  /* 14A624 801345F4 46128000 */     add.s $f0, $f16, $f18
  /* 14A628 801345F8 3C014392 */       lui $at, (0x43920000 >> 16) # 292.0
  /* 14A62C 801345FC 00001825 */        or $v1, $zero, $zero
  /* 14A630 80134600 00001025 */        or $v0, $zero, $zero
  /* 14A634 80134604 4600203E */    c.le.s $f4, $f0
  /* 14A638 80134608 00000000 */       nop
  /* 14A63C 8013460C 45000009 */      bc1f .L80134634
  /* 14A640 80134610 00000000 */       nop
  /* 14A644 80134614 44813000 */      mtc1 $at, $f6 # 292.0 to cop1
  /* 14A648 80134618 00000000 */       nop
  /* 14A64C 8013461C 4606003E */    c.le.s $f0, $f6
  /* 14A650 80134620 00000000 */       nop
  /* 14A654 80134624 45000003 */      bc1f .L80134634
  /* 14A658 80134628 00000000 */       nop
  /* 14A65C 8013462C 10000001 */         b .L80134634
  /* 14A660 80134630 24030001 */     addiu $v1, $zero, 1
  .L80134634:
  /* 14A664 80134634 10600003 */      beqz $v1, .L80134644
  /* 14A668 80134638 00000000 */       nop
  /* 14A66C 8013463C 03E00008 */        jr $ra
  /* 14A670 80134640 24020001 */     addiu $v0, $zero, 1

  .L80134644:
  /* 14A674 80134644 03E00008 */        jr $ra
  /* 14A678 80134648 00000000 */       nop

glabel mnBonusCheckTokenPickup
  /* 14A67C 8013464C AFA50004 */        sw $a1, 4($sp)
  /* 14A680 80134650 AFA60008 */        sw $a2, 8($sp)
  /* 14A684 80134654 8C820074 */        lw $v0, 0x74($a0)
  /* 14A688 80134658 3C0E8013 */       lui $t6, %hi(D_ovl29_8013764C)
  /* 14A68C 8013465C 8DCE764C */        lw $t6, %lo(D_ovl29_8013764C)($t6)
  /* 14A690 80134660 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 14A694 80134664 44813000 */      mtc1 $at, $f6 # 25.0 to cop1
  /* 14A698 80134668 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14A69C 8013466C 8DC30074 */        lw $v1, 0x74($t6)
  /* 14A6A0 80134670 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 14A6A4 80134674 46062000 */     add.s $f0, $f4, $f6
  /* 14A6A8 80134678 C4620058 */      lwc1 $f2, 0x58($v1)
  /* 14A6AC 8013467C 00002025 */        or $a0, $zero, $zero
  /* 14A6B0 80134680 4600103E */    c.le.s $f2, $f0
  /* 14A6B4 80134684 00000000 */       nop
  /* 14A6B8 80134688 4500000A */      bc1f .L801346B4
  /* 14A6BC 8013468C 00000000 */       nop
  /* 14A6C0 80134690 44814000 */      mtc1 $at, $f8 # 26.0 to cop1
  /* 14A6C4 80134694 00000000 */       nop
  /* 14A6C8 80134698 46081280 */     add.s $f10, $f2, $f8
  /* 14A6CC 8013469C 460A003E */    c.le.s $f0, $f10
  /* 14A6D0 801346A0 00000000 */       nop
  /* 14A6D4 801346A4 45000003 */      bc1f .L801346B4
  /* 14A6D8 801346A8 00000000 */       nop
  /* 14A6DC 801346AC 10000001 */         b .L801346B4
  /* 14A6E0 801346B0 24040001 */     addiu $a0, $zero, 1
  .L801346B4:
  /* 14A6E4 801346B4 10800018 */      beqz $a0, .L80134718
  /* 14A6E8 801346B8 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 14A6EC 801346BC C450005C */      lwc1 $f16, 0x5c($v0)
  /* 14A6F0 801346C0 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 14A6F4 801346C4 C462005C */      lwc1 $f2, 0x5c($v1)
  /* 14A6F8 801346C8 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 14A6FC 801346CC 46128000 */     add.s $f0, $f16, $f18
  /* 14A700 801346D0 00002025 */        or $a0, $zero, $zero
  /* 14A704 801346D4 4600103E */    c.le.s $f2, $f0
  /* 14A708 801346D8 00000000 */       nop
  /* 14A70C 801346DC 4500000A */      bc1f .L80134708
  /* 14A710 801346E0 00000000 */       nop
  /* 14A714 801346E4 44812000 */      mtc1 $at, $f4 # 24.0 to cop1
  /* 14A718 801346E8 00000000 */       nop
  /* 14A71C 801346EC 46041180 */     add.s $f6, $f2, $f4
  /* 14A720 801346F0 4606003E */    c.le.s $f0, $f6
  /* 14A724 801346F4 00000000 */       nop
  /* 14A728 801346F8 45000003 */      bc1f .L80134708
  /* 14A72C 801346FC 00000000 */       nop
  /* 14A730 80134700 10000001 */         b .L80134708
  /* 14A734 80134704 24040001 */     addiu $a0, $zero, 1
  .L80134708:
  /* 14A738 80134708 50800004 */      beql $a0, $zero, .L8013471C
  /* 14A73C 8013470C 00001025 */        or $v0, $zero, $zero
  /* 14A740 80134710 03E00008 */        jr $ra
  /* 14A744 80134714 24020001 */     addiu $v0, $zero, 1

  .L80134718:
  /* 14A748 80134718 00001025 */        or $v0, $zero, $zero
  .L8013471C:
  /* 14A74C 8013471C 03E00008 */        jr $ra
  /* 14A750 80134720 00000000 */       nop

glabel mnBonusResetPort
  /* 14A754 80134724 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14A758 80134728 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14A75C 8013472C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14A760 80134730 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14A764 80134734 240E001C */     addiu $t6, $zero, 0x1c
  /* 14A768 80134738 AC40002C */        sw $zero, 0x2c($v0) # gMNBonusPanel + 44
  /* 14A76C 8013473C AC4E0020 */        sw $t6, 0x20($v0) # gMNBonusPanel + 32
  /* 14A770 80134740 AC440050 */        sw $a0, 0x50($v0) # gMNBonusPanel + 80
  /* 14A774 80134744 AC440054 */        sw $a0, 0x54($v0) # gMNBonusPanel + 84
  /* 14A778 80134748 AC400058 */        sw $zero, 0x58($v0) # gMNBonusPanel + 88
  /* 14A77C 8013474C 0C04D2EC */       jal mnBonusReorderCursorsOnPickup
  /* 14A780 80134750 00802825 */        or $a1, $a0, $zero
  /* 14A784 80134754 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14A788 80134758 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14A78C 8013475C 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14A790 80134760 AC400070 */        sw $zero, 0x70($v0) # gMNBonusPanel + 112
  /* 14A794 80134764 03E00008 */        jr $ra
  /* 14A798 80134768 27BD0018 */     addiu $sp, $sp, 0x18

glabel mnBonusSyncFighterDisplay
  /* 14A79C 8013476C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14A7A0 80134770 AFB00018 */        sw $s0, 0x18($sp)
  /* 14A7A4 80134774 3C108013 */       lui $s0, %hi(gMNBonusPanel)
  /* 14A7A8 80134778 26107648 */     addiu $s0, $s0, %lo(gMNBonusPanel)
  /* 14A7AC 8013477C 8E0E0020 */        lw $t6, 0x20($s0) # gMNBonusPanel + 32
  /* 14A7B0 80134780 2401001C */     addiu $at, $zero, 0x1c
  /* 14A7B4 80134784 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14A7B8 80134788 AFA40020 */        sw $a0, 0x20($sp)
  /* 14A7BC 8013478C 15C10009 */       bne $t6, $at, .L801347B4
  /* 14A7C0 80134790 00001025 */        or $v0, $zero, $zero
  /* 14A7C4 80134794 8E0F002C */        lw $t7, 0x2c($s0) # gMNBonusPanel + 44
  /* 14A7C8 80134798 15E00006 */      bnez $t7, .L801347B4
  /* 14A7CC 8013479C 00000000 */       nop
  /* 14A7D0 801347A0 8E190008 */        lw $t9, 8($s0) # gMNBonusPanel + 8
  /* 14A7D4 801347A4 24180001 */     addiu $t8, $zero, 1
  /* 14A7D8 801347A8 0C04CEF3 */       jal mnBonusDrawHighscore
  /* 14A7DC 801347AC AF38007C */        sw $t8, 0x7c($t9)
  /* 14A7E0 801347B0 24020001 */     addiu $v0, $zero, 1
  .L801347B4:
  /* 14A7E4 801347B4 14400009 */      bnez $v0, .L801347DC
  /* 14A7E8 801347B8 8FA50020 */        lw $a1, 0x20($sp)
  /* 14A7EC 801347BC 8E040008 */        lw $a0, 8($s0) # gMNBonusPanel + 8
  /* 14A7F0 801347C0 0C04D042 */       jal mnBonusSpawnFighter
  /* 14A7F4 801347C4 8E060020 */        lw $a2, 0x20($s0) # gMNBonusPanel + 32
  /* 14A7F8 801347C8 0C04CEF3 */       jal mnBonusDrawHighscore
  /* 14A7FC 801347CC 00000000 */       nop
  /* 14A800 801347D0 8E080008 */        lw $t0, 8($s0) # gMNBonusPanel + 8
  /* 14A804 801347D4 AD00007C */        sw $zero, 0x7c($t0)
  /* 14A808 801347D8 AE00005C */        sw $zero, 0x5c($s0) # gMNBonusPanel + 92
  .L801347DC:
  /* 14A80C 801347DC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14A810 801347E0 8FB00018 */        lw $s0, 0x18($sp)
  /* 14A814 801347E4 27BD0020 */     addiu $sp, $sp, 0x20
  /* 14A818 801347E8 03E00008 */        jr $ra
  /* 14A81C 801347EC 00000000 */       nop

  /* 14A820 801347F0 03E00008 */        jr $ra
  /* 14A824 801347F4 00000000 */       nop

glabel mnBonusSyncNameAndLogo
  /* 14A828 801347F8 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14A82C 801347FC 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14A830 80134800 8C4E0020 */        lw $t6, 0x20($v0) # gMNBonusPanel + 32
  /* 14A834 80134804 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14A838 80134808 2401001C */     addiu $at, $zero, 0x1c
  /* 14A83C 8013480C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14A840 80134810 15C10008 */       bne $t6, $at, .L80134834
  /* 14A844 80134814 00802825 */        or $a1, $a0, $zero
  /* 14A848 80134818 8C4F002C */        lw $t7, 0x2c($v0) # gMNBonusPanel + 44
  /* 14A84C 8013481C 55E00006 */      bnel $t7, $zero, .L80134838
  /* 14A850 80134820 8C48000C */        lw $t0, 0xc($v0) # gMNBonusPanel + 12
  /* 14A854 80134824 8C59000C */        lw $t9, 0xc($v0) # gMNBonusPanel + 12
  /* 14A858 80134828 24180001 */     addiu $t8, $zero, 1
  /* 14A85C 8013482C 10000006 */         b .L80134848
  /* 14A860 80134830 AF38007C */        sw $t8, 0x7c($t9)
  .L80134834:
  /* 14A864 80134834 8C48000C */        lw $t0, 0xc($v0) # gMNBonusPanel + 12
  .L80134838:
  /* 14A868 80134838 AD00007C */        sw $zero, 0x7c($t0)
  /* 14A86C 8013483C 8C460020 */        lw $a2, 0x20($v0) # gMNBonusPanel + 32
  /* 14A870 80134840 0C04CAA6 */       jal mnBonusSetNameAndLogo
  /* 14A874 80134844 8C44000C */        lw $a0, 0xc($v0) # gMNBonusPanel + 12
  .L80134848:
  /* 14A878 80134848 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14A87C 8013484C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14A880 80134850 03E00008 */        jr $ra
  /* 14A884 80134854 00000000 */       nop

glabel mnBonusRemoveWhiteSquare
  /* 14A888 80134858 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14A88C 8013485C 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14A890 80134860 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14A894 80134864 AFA40018 */        sw $a0, 0x18($sp)
  /* 14A898 80134868 8C440018 */        lw $a0, 0x18($v0) # gMNBonusPanel + 24
  /* 14A89C 8013486C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14A8A0 80134870 50800004 */      beql $a0, $zero, .L80134884
  /* 14A8A4 80134874 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14A8A8 80134878 0C0026A1 */       jal omEjectGObj
  /* 14A8AC 8013487C AC400018 */        sw $zero, 0x18($v0) # gMNBonusPanel + 24
  /* 14A8B0 80134880 8FBF0014 */        lw $ra, 0x14($sp)
  .L80134884:
  /* 14A8B4 80134884 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14A8B8 80134888 03E00008 */        jr $ra
  /* 14A8BC 8013488C 00000000 */       nop

glabel mnBonusFlashWhiteSquare
  /* 14A8C0 80134890 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14A8C4 80134894 AFB30020 */        sw $s3, 0x20($sp)
  /* 14A8C8 80134898 AFB2001C */        sw $s2, 0x1c($sp)
  /* 14A8CC 8013489C AFB10018 */        sw $s1, 0x18($sp)
  /* 14A8D0 801348A0 AFB00014 */        sw $s0, 0x14($sp)
  /* 14A8D4 801348A4 00808825 */        or $s1, $a0, $zero
  /* 14A8D8 801348A8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14A8DC 801348AC 24120010 */     addiu $s2, $zero, 0x10
  /* 14A8E0 801348B0 24100001 */     addiu $s0, $zero, 1
  /* 14A8E4 801348B4 24130001 */     addiu $s3, $zero, 1
  /* 14A8E8 801348B8 2652FFFF */     addiu $s2, $s2, -1
  .L801348BC:
  /* 14A8EC 801348BC 16400003 */      bnez $s2, .L801348CC
  /* 14A8F0 801348C0 2610FFFF */     addiu $s0, $s0, -1
  /* 14A8F4 801348C4 0C04D216 */       jal mnBonusRemoveWhiteSquare
  /* 14A8F8 801348C8 8E240084 */        lw $a0, 0x84($s1)
  .L801348CC:
  /* 14A8FC 801348CC 16000008 */      bnez $s0, .L801348F0
  /* 14A900 801348D0 00000000 */       nop
  /* 14A904 801348D4 8E2E007C */        lw $t6, 0x7c($s1)
  /* 14A908 801348D8 24100001 */     addiu $s0, $zero, 1
  /* 14A90C 801348DC 566E0004 */      bnel $s3, $t6, .L801348F0
  /* 14A910 801348E0 AE33007C */        sw $s3, 0x7c($s1)
  /* 14A914 801348E4 10000002 */         b .L801348F0
  /* 14A918 801348E8 AE20007C */        sw $zero, 0x7c($s1)
  /* 14A91C 801348EC AE33007C */        sw $s3, 0x7c($s1)
  .L801348F0:
  /* 14A920 801348F0 0C002C7A */       jal gsStopCurrentProcess
  /* 14A924 801348F4 24040001 */     addiu $a0, $zero, 1
  /* 14A928 801348F8 1000FFF0 */         b .L801348BC
  /* 14A92C 801348FC 2652FFFF */     addiu $s2, $s2, -1
  /* 14A930 80134900 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14A934 80134904 8FB00014 */        lw $s0, 0x14($sp)
  /* 14A938 80134908 8FB10018 */        lw $s1, 0x18($sp)
  /* 14A93C 8013490C 8FB2001C */        lw $s2, 0x1c($sp)
  /* 14A940 80134910 8FB30020 */        lw $s3, 0x20($sp)
  /* 14A944 80134914 03E00008 */        jr $ra
  /* 14A948 80134918 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnBonusCreateWhiteSquare
  /* 14A94C 8013491C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 14A950 80134920 AFA40030 */        sw $a0, 0x30($sp)
  /* 14A954 80134924 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14A958 80134928 3C048013 */       lui $a0, %hi(D_ovl29_80137668)
  /* 14A95C 8013492C AFB00020 */        sw $s0, 0x20($sp)
  /* 14A960 80134930 0C04C8F8 */       jal mnBonusGetPortraitId
  /* 14A964 80134934 8C847668 */        lw $a0, %lo(D_ovl29_80137668)($a0)
  /* 14A968 80134938 00408025 */        or $s0, $v0, $zero
  /* 14A96C 8013493C 0C04D216 */       jal mnBonusRemoveWhiteSquare
  /* 14A970 80134940 8FA40030 */        lw $a0, 0x30($sp)
  /* 14A974 80134944 00002025 */        or $a0, $zero, $zero
  /* 14A978 80134948 00002825 */        or $a1, $zero, $zero
  /* 14A97C 8013494C 2406001A */     addiu $a2, $zero, 0x1a
  /* 14A980 80134950 0C00265A */       jal omMakeGObjSPAfter
  /* 14A984 80134954 3C078000 */       lui $a3, 0x8000
  /* 14A988 80134958 3C018013 */       lui $at, %hi(D_ovl29_80137660)
  /* 14A98C 8013495C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 14A990 80134960 240EFFFF */     addiu $t6, $zero, -1
  /* 14A994 80134964 AC227660 */        sw $v0, %lo(D_ovl29_80137660)($at)
  /* 14A998 80134968 AFA2002C */        sw $v0, 0x2c($sp)
  /* 14A99C 8013496C AFAE0010 */        sw $t6, 0x10($sp)
  /* 14A9A0 80134970 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 14A9A4 80134974 00402025 */        or $a0, $v0, $zero
  /* 14A9A8 80134978 24060021 */     addiu $a2, $zero, 0x21
  /* 14A9AC 8013497C 0C00277D */       jal omAddGObjRenderProc
  /* 14A9B0 80134980 3C078000 */       lui $a3, 0x8000
  /* 14A9B4 80134984 8FA4002C */        lw $a0, 0x2c($sp)
  /* 14A9B8 80134988 8FAF0030 */        lw $t7, 0x30($sp)
  /* 14A9BC 8013498C 3C058013 */       lui $a1, %hi(mnBonusFlashWhiteSquare)
  /* 14A9C0 80134990 24A54890 */     addiu $a1, $a1, %lo(mnBonusFlashWhiteSquare)
  /* 14A9C4 80134994 00003025 */        or $a2, $zero, $zero
  /* 14A9C8 80134998 24070001 */     addiu $a3, $zero, 1
  /* 14A9CC 8013499C 0C002062 */       jal omAddGObjCommonProc
  /* 14A9D0 801349A0 AC8F0084 */        sw $t7, 0x84($a0)
  /* 14A9D4 801349A4 3C188013 */       lui $t8, %hi(D_ovl29_80137E08)
  /* 14A9D8 801349A8 8F187E08 */        lw $t8, %lo(D_ovl29_80137E08)($t8)
  /* 14A9DC 801349AC 3C190000 */       lui $t9, %hi(D_NF_000006F0)
  /* 14A9E0 801349B0 273906F0 */     addiu $t9, $t9, %lo(D_NF_000006F0)
  /* 14A9E4 801349B4 8FA4002C */        lw $a0, 0x2c($sp)
  /* 14A9E8 801349B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14A9EC 801349BC 03192821 */      addu $a1, $t8, $t9
  /* 14A9F0 801349C0 2A010006 */      slti $at, $s0, 6
  /* 14A9F4 801349C4 14200003 */      bnez $at, .L801349D4
  /* 14A9F8 801349C8 02001825 */        or $v1, $s0, $zero
  /* 14A9FC 801349CC 10000001 */         b .L801349D4
  /* 14AA00 801349D0 2603FFFA */     addiu $v1, $s0, -6
  .L801349D4:
  /* 14AA04 801349D4 00034080 */       sll $t0, $v1, 2
  /* 14AA08 801349D8 01034023 */      subu $t0, $t0, $v1
  /* 14AA0C 801349DC 00084080 */       sll $t0, $t0, 2
  /* 14AA10 801349E0 01034023 */      subu $t0, $t0, $v1
  /* 14AA14 801349E4 00084080 */       sll $t0, $t0, 2
  /* 14AA18 801349E8 01034021 */      addu $t0, $t0, $v1
  /* 14AA1C 801349EC 2509001A */     addiu $t1, $t0, 0x1a
  /* 14AA20 801349F0 44892000 */      mtc1 $t1, $f4
  /* 14AA24 801349F4 2A010006 */      slti $at, $s0, 6
  /* 14AA28 801349F8 00001825 */        or $v1, $zero, $zero
  /* 14AA2C 801349FC 468021A0 */   cvt.s.w $f6, $f4
  /* 14AA30 80134A00 14200003 */      bnez $at, .L80134A10
  /* 14AA34 80134A04 E4460058 */      swc1 $f6, 0x58($v0)
  /* 14AA38 80134A08 10000001 */         b .L80134A10
  /* 14AA3C 80134A0C 24030001 */     addiu $v1, $zero, 1
  .L80134A10:
  /* 14AA40 80134A10 00035080 */       sll $t2, $v1, 2
  /* 14AA44 80134A14 01435023 */      subu $t2, $t2, $v1
  /* 14AA48 80134A18 000A5080 */       sll $t2, $t2, 2
  /* 14AA4C 80134A1C 01435023 */      subu $t2, $t2, $v1
  /* 14AA50 80134A20 000A5080 */       sll $t2, $t2, 2
  /* 14AA54 80134A24 01435023 */      subu $t2, $t2, $v1
  /* 14AA58 80134A28 254B0025 */     addiu $t3, $t2, 0x25
  /* 14AA5C 80134A2C 448B4000 */      mtc1 $t3, $f8
  /* 14AA60 80134A30 00000000 */       nop
  /* 14AA64 80134A34 468042A0 */   cvt.s.w $f10, $f8
  /* 14AA68 80134A38 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 14AA6C 80134A3C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14AA70 80134A40 8FB00020 */        lw $s0, 0x20($sp)
  /* 14AA74 80134A44 27BD0030 */     addiu $sp, $sp, 0x30
  /* 14AA78 80134A48 03E00008 */        jr $ra
  /* 14AA7C 80134A4C 00000000 */       nop

glabel mnBonusAnnounceFighter
  /* 14AA80 80134A50 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 14AA84 80134A54 3C0F8013 */       lui $t7, %hi(dMNBonusAnnouncerNames)
  /* 14AA88 80134A58 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14AA8C 80134A5C AFA40038 */        sw $a0, 0x38($sp)
  /* 14AA90 80134A60 AFA5003C */        sw $a1, 0x3c($sp)
  /* 14AA94 80134A64 25EF745C */     addiu $t7, $t7, %lo(dMNBonusAnnouncerNames)
  /* 14AA98 80134A68 8DF90000 */        lw $t9, ($t7) # dMNBonusAnnouncerNames + 0
  /* 14AA9C 80134A6C 8DF80004 */        lw $t8, 4($t7) # dMNBonusAnnouncerNames + 4
  /* 14AAA0 80134A70 27AE0020 */     addiu $t6, $sp, 0x20
  /* 14AAA4 80134A74 ADD90000 */        sw $t9, ($t6)
  /* 14AAA8 80134A78 ADD80004 */        sw $t8, 4($t6)
  /* 14AAAC 80134A7C 8DF8000C */        lw $t8, 0xc($t7) # dMNBonusAnnouncerNames + 12
  /* 14AAB0 80134A80 8DF90008 */        lw $t9, 8($t7) # dMNBonusAnnouncerNames + 8
  /* 14AAB4 80134A84 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14AAB8 80134A88 ADD8000C */        sw $t8, 0xc($t6)
  /* 14AABC 80134A8C ADD90008 */        sw $t9, 8($t6)
  /* 14AAC0 80134A90 8DF90010 */        lw $t9, 0x10($t7) # dMNBonusAnnouncerNames + 16
  /* 14AAC4 80134A94 8DF80014 */        lw $t8, 0x14($t7) # dMNBonusAnnouncerNames + 20
  /* 14AAC8 80134A98 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14AACC 80134A9C ADD90010 */        sw $t9, 0x10($t6)
  /* 14AAD0 80134AA0 ADD80014 */        sw $t8, 0x14($t6)
  /* 14AAD4 80134AA4 8C640074 */        lw $a0, 0x74($v1) # gMNBonusPanel + 116
  /* 14AAD8 80134AA8 10800009 */      beqz $a0, .L80134AD0
  /* 14AADC 80134AAC 00000000 */       nop
  /* 14AAE0 80134AB0 94820026 */       lhu $v0, 0x26($a0)
  /* 14AAE4 80134AB4 10400006 */      beqz $v0, .L80134AD0
  /* 14AAE8 80134AB8 00000000 */       nop
  /* 14AAEC 80134ABC 94680078 */       lhu $t0, 0x78($v1) # gMNBonusPanel + 120
  /* 14AAF0 80134AC0 15020003 */       bne $t0, $v0, .L80134AD0
  /* 14AAF4 80134AC4 00000000 */       nop
  /* 14AAF8 80134AC8 0C0099CE */       jal func_80026738
  /* 14AAFC 80134ACC 00000000 */       nop
  .L80134AD0:
  /* 14AB00 80134AD0 0C009A70 */       jal func_800269C0
  /* 14AB04 80134AD4 24040079 */     addiu $a0, $zero, 0x79
  /* 14AB08 80134AD8 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14AB0C 80134ADC 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14AB10 80134AE0 8C690020 */        lw $t1, 0x20($v1) # gMNBonusPanel + 32
  /* 14AB14 80134AE4 00095040 */       sll $t2, $t1, 1
  /* 14AB18 80134AE8 03AA2021 */      addu $a0, $sp, $t2
  /* 14AB1C 80134AEC 0C009A70 */       jal func_800269C0
  /* 14AB20 80134AF0 94840020 */       lhu $a0, 0x20($a0)
  /* 14AB24 80134AF4 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14AB28 80134AF8 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14AB2C 80134AFC 10400003 */      beqz $v0, .L80134B0C
  /* 14AB30 80134B00 AC620074 */        sw $v0, 0x74($v1) # gMNBonusPanel + 116
  /* 14AB34 80134B04 944B0026 */       lhu $t3, 0x26($v0)
  /* 14AB38 80134B08 A46B0078 */        sh $t3, 0x78($v1) # gMNBonusPanel + 120
  .L80134B0C:
  /* 14AB3C 80134B0C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14AB40 80134B10 27BD0038 */     addiu $sp, $sp, 0x38
  /* 14AB44 80134B14 03E00008 */        jr $ra
  /* 14AB48 80134B18 00000000 */       nop

  /* 14AB4C 80134B1C 03E00008 */        jr $ra
  /* 14AB50 80134B20 00000000 */       nop

glabel mnBonusSelectChar
  /* 14AB54 80134B24 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14AB58 80134B28 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14AB5C 80134B2C 8C4E0028 */        lw $t6, 0x28($v0) # gMNBonusPanel + 40
  /* 14AB60 80134B30 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14AB64 80134B34 AFA40018 */        sw $a0, 0x18($sp)
  /* 14AB68 80134B38 24010001 */     addiu $at, $zero, 1
  /* 14AB6C 80134B3C 00A02025 */        or $a0, $a1, $zero
  /* 14AB70 80134B40 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14AB74 80134B44 11C10003 */       beq $t6, $at, .L80134B54
  /* 14AB78 80134B48 AFA60020 */        sw $a2, 0x20($sp)
  /* 14AB7C 80134B4C 10000014 */         b .L80134BA0
  /* 14AB80 80134B50 00001025 */        or $v0, $zero, $zero
  .L80134B54:
  /* 14AB84 80134B54 8C4F0020 */        lw $t7, 0x20($v0) # gMNBonusPanel + 32
  /* 14AB88 80134B58 2401001C */     addiu $at, $zero, 0x1c
  /* 14AB8C 80134B5C 11E1000D */       beq $t7, $at, .L80134B94
  /* 14AB90 80134B60 00000000 */       nop
  /* 14AB94 80134B64 0C04C7DD */       jal mnBonusSelectCharWithToken
  /* 14AB98 80134B68 00E02825 */        or $a1, $a3, $zero
  /* 14AB9C 80134B6C 3C188013 */       lui $t8, %hi(gMNBonusFramesElapsed)
  /* 14ABA0 80134B70 8F187724 */        lw $t8, %lo(gMNBonusFramesElapsed)($t8)
  /* 14ABA4 80134B74 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14ABA8 80134B78 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14ABAC 80134B7C 2719001E */     addiu $t9, $t8, 0x1e
  /* 14ABB0 80134B80 AC590034 */        sw $t9, 0x34($v0) # gMNBonusPanel + 52
  /* 14ABB4 80134B84 0C009A70 */       jal func_800269C0
  /* 14ABB8 80134B88 2404009F */     addiu $a0, $zero, 0x9f
  /* 14ABBC 80134B8C 10000004 */         b .L80134BA0
  /* 14ABC0 80134B90 24020001 */     addiu $v0, $zero, 1
  .L80134B94:
  /* 14ABC4 80134B94 0C009A70 */       jal func_800269C0
  /* 14ABC8 80134B98 240400A5 */     addiu $a0, $zero, 0xa5
  /* 14ABCC 80134B9C 00001025 */        or $v0, $zero, $zero
  .L80134BA0:
  /* 14ABD0 80134BA0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14ABD4 80134BA4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14ABD8 80134BA8 03E00008 */        jr $ra
  /* 14ABDC 80134BAC 00000000 */       nop

glabel mnBonusReorderCursorsOnPickup
  /* 14ABE0 80134BB0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14ABE4 80134BB4 3C0E8013 */       lui $t6, %hi(dMNBonusTokenPickupDisplayOrders)
  /* 14ABE8 80134BB8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14ABEC 80134BBC AFA5002C */        sw $a1, 0x2c($sp)
  /* 14ABF0 80134BC0 25CE7474 */     addiu $t6, $t6, %lo(dMNBonusTokenPickupDisplayOrders)
  /* 14ABF4 80134BC4 8DD80000 */        lw $t8, ($t6) # dMNBonusTokenPickupDisplayOrders + 0
  /* 14ABF8 80134BC8 27A20018 */     addiu $v0, $sp, 0x18
  /* 14ABFC 80134BCC 00803825 */        or $a3, $a0, $zero
  /* 14AC00 80134BD0 AC580000 */        sw $t8, ($v0)
  /* 14AC04 80134BD4 8DCF0004 */        lw $t7, 4($t6) # dMNBonusTokenPickupDisplayOrders + 4
  /* 14AC08 80134BD8 0007C880 */       sll $t9, $a3, 2
  /* 14AC0C 80134BDC 00594021 */      addu $t0, $v0, $t9
  /* 14AC10 80134BE0 AC4F0004 */        sw $t7, 4($v0)
  /* 14AC14 80134BE4 8DD80008 */        lw $t8, 8($t6) # dMNBonusTokenPickupDisplayOrders + 8
  /* 14AC18 80134BE8 3C048013 */       lui $a0, %hi(D_ovl29_8013764C)
  /* 14AC1C 80134BEC 2405001E */     addiu $a1, $zero, 0x1e
  /* 14AC20 80134BF0 AC580008 */        sw $t8, 8($v0)
  /* 14AC24 80134BF4 8DCF000C */        lw $t7, 0xc($t6) # dMNBonusTokenPickupDisplayOrders + 12
  /* 14AC28 80134BF8 AC4F000C */        sw $t7, 0xc($v0)
  /* 14AC2C 80134BFC 8D060000 */        lw $a2, ($t0)
  /* 14AC30 80134C00 8C84764C */        lw $a0, %lo(D_ovl29_8013764C)($a0)
  /* 14AC34 80134C04 0C002834 */       jal omMoveGObjDL
  /* 14AC38 80134C08 24C60001 */     addiu $a2, $a2, 1
  /* 14AC3C 80134C0C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14AC40 80134C10 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14AC44 80134C14 03E00008 */        jr $ra
  /* 14AC48 80134C18 00000000 */       nop

glabel mnBonusReorderCursorsOnPlacement
  /* 14AC4C 80134C1C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14AC50 80134C20 3C0E8013 */       lui $t6, %hi(dMNBonusTokenPlaceUnheldDisplayOrders)
  /* 14AC54 80134C24 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14AC58 80134C28 25CE7484 */     addiu $t6, $t6, %lo(dMNBonusTokenPlaceUnheldDisplayOrders)
  /* 14AC5C 80134C2C 8DD80000 */        lw $t8, ($t6) # dMNBonusTokenPlaceUnheldDisplayOrders + 0
  /* 14AC60 80134C30 27A20018 */     addiu $v0, $sp, 0x18
  /* 14AC64 80134C34 00803825 */        or $a3, $a0, $zero
  /* 14AC68 80134C38 AC580000 */        sw $t8, ($v0)
  /* 14AC6C 80134C3C 8DCF0004 */        lw $t7, 4($t6) # dMNBonusTokenPlaceUnheldDisplayOrders + 4
  /* 14AC70 80134C40 0007C880 */       sll $t9, $a3, 2
  /* 14AC74 80134C44 00594021 */      addu $t0, $v0, $t9
  /* 14AC78 80134C48 AC4F0004 */        sw $t7, 4($v0)
  /* 14AC7C 80134C4C 8DD80008 */        lw $t8, 8($t6) # dMNBonusTokenPlaceUnheldDisplayOrders + 8
  /* 14AC80 80134C50 3C048013 */       lui $a0, %hi(D_ovl29_8013764C)
  /* 14AC84 80134C54 2405001F */     addiu $a1, $zero, 0x1f
  /* 14AC88 80134C58 AC580008 */        sw $t8, 8($v0)
  /* 14AC8C 80134C5C 8DCF000C */        lw $t7, 0xc($t6) # dMNBonusTokenPlaceUnheldDisplayOrders + 12
  /* 14AC90 80134C60 AC4F000C */        sw $t7, 0xc($v0)
  /* 14AC94 80134C64 8D060000 */        lw $a2, ($t0)
  /* 14AC98 80134C68 0C002834 */       jal omMoveGObjDL
  /* 14AC9C 80134C6C 8C84764C */        lw $a0, %lo(D_ovl29_8013764C)($a0)
  /* 14ACA0 80134C70 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14ACA4 80134C74 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14ACA8 80134C78 03E00008 */        jr $ra
  /* 14ACAC 80134C7C 00000000 */       nop

glabel mnBonusSetCursorCoordinatesFromToken
  /* 14ACB0 80134C80 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14ACB4 80134C84 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14ACB8 80134C88 8C620004 */        lw $v0, 4($v1) # gMNBonusPanel + 4
  /* 14ACBC 80134C8C AFA40000 */        sw $a0, ($sp)
  /* 14ACC0 80134C90 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 14ACC4 80134C94 8C4E0074 */        lw $t6, 0x74($v0)
  /* 14ACC8 80134C98 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 14ACCC 80134C9C 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 14ACD0 80134CA0 C5C40058 */      lwc1 $f4, 0x58($t6)
  /* 14ACD4 80134CA4 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 14ACD8 80134CA8 46062201 */     sub.s $f8, $f4, $f6
  /* 14ACDC 80134CAC E4680068 */      swc1 $f8, 0x68($v1) # gMNBonusPanel + 104
  /* 14ACE0 80134CB0 8C4F0074 */        lw $t7, 0x74($v0)
  /* 14ACE4 80134CB4 C5EA005C */      lwc1 $f10, 0x5c($t7)
  /* 14ACE8 80134CB8 46105481 */     sub.s $f18, $f10, $f16
  /* 14ACEC 80134CBC 03E00008 */        jr $ra
  /* 14ACF0 80134CC0 E472006C */      swc1 $f18, 0x6c($v1) # gMNBonusPanel + 108

glabel mnBonusHandleCursorPickup
  /* 14ACF4 80134CC4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14ACF8 80134CC8 AFB00014 */        sw $s0, 0x14($sp)
  /* 14ACFC 80134CCC 3C108013 */       lui $s0, %hi(gMNBonusPanel)
  /* 14AD00 80134CD0 26107648 */     addiu $s0, $s0, %lo(gMNBonusPanel)
  /* 14AD04 80134CD4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14AD08 80134CD8 AFB10018 */        sw $s1, 0x18($sp)
  /* 14AD0C 80134CDC 240E0001 */     addiu $t6, $zero, 1
  /* 14AD10 80134CE0 00808825 */        or $s1, $a0, $zero
  /* 14AD14 80134CE4 AE040050 */        sw $a0, 0x50($s0) # gMNBonusPanel + 80
  /* 14AD18 80134CE8 AE00002C */        sw $zero, 0x2c($s0) # gMNBonusPanel + 44
  /* 14AD1C 80134CEC AE0E0028 */        sw $t6, 0x28($s0) # gMNBonusPanel + 40
  /* 14AD20 80134CF0 AE040054 */        sw $a0, 0x54($s0) # gMNBonusPanel + 84
  /* 14AD24 80134CF4 0C04D1DB */       jal mnBonusSyncFighterDisplay
  /* 14AD28 80134CF8 AE000058 */        sw $zero, 0x58($s0) # gMNBonusPanel + 88
  /* 14AD2C 80134CFC 02202025 */        or $a0, $s1, $zero
  /* 14AD30 80134D00 0C04D2EC */       jal mnBonusReorderCursorsOnPickup
  /* 14AD34 80134D04 02202825 */        or $a1, $s1, $zero
  /* 14AD38 80134D08 0C04D320 */       jal mnBonusSetCursorCoordinatesFromToken
  /* 14AD3C 80134D0C 02202025 */        or $a0, $s1, $zero
  /* 14AD40 80134D10 8E040000 */        lw $a0, ($s0) # gMNBonusPanel + 0
  /* 14AD44 80134D14 02202825 */        or $a1, $s1, $zero
  /* 14AD48 80134D18 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14AD4C 80134D1C 8E060028 */        lw $a2, 0x28($s0) # gMNBonusPanel + 40
  /* 14AD50 80134D20 240F0001 */     addiu $t7, $zero, 1
  /* 14AD54 80134D24 AE0F0070 */        sw $t7, 0x70($s0) # gMNBonusPanel + 112
  /* 14AD58 80134D28 0C009A70 */       jal func_800269C0
  /* 14AD5C 80134D2C 2404007F */     addiu $a0, $zero, 0x7f
  /* 14AD60 80134D30 0C04D216 */       jal mnBonusRemoveWhiteSquare
  /* 14AD64 80134D34 02202025 */        or $a0, $s1, $zero
  /* 14AD68 80134D38 0C04D1FE */       jal mnBonusSyncNameAndLogo
  /* 14AD6C 80134D3C 02202025 */        or $a0, $s1, $zero
  /* 14AD70 80134D40 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14AD74 80134D44 8FB00014 */        lw $s0, 0x14($sp)
  /* 14AD78 80134D48 8FB10018 */        lw $s1, 0x18($sp)
  /* 14AD7C 80134D4C 03E00008 */        jr $ra
  /* 14AD80 80134D50 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBonusCheckAndHandleTokenPickup
  /* 14AD84 80134D54 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14AD88 80134D58 AFB10018 */        sw $s1, 0x18($sp)
  /* 14AD8C 80134D5C 3C118013 */       lui $s1, %hi(gMNBonusPanel)
  /* 14AD90 80134D60 26317648 */     addiu $s1, $s1, %lo(gMNBonusPanel)
  /* 14AD94 80134D64 3C0E8013 */       lui $t6, %hi(gMNBonusFramesElapsed)
  /* 14AD98 80134D68 8DCE7724 */        lw $t6, %lo(gMNBonusFramesElapsed)($t6)
  /* 14AD9C 80134D6C 8E2F0034 */        lw $t7, 0x34($s1) # gMNBonusPanel + 52
  /* 14ADA0 80134D70 AFB00014 */        sw $s0, 0x14($sp)
  /* 14ADA4 80134D74 00A08025 */        or $s0, $a1, $zero
  /* 14ADA8 80134D78 01CF082A */       slt $at, $t6, $t7
  /* 14ADAC 80134D7C AFBF001C */        sw $ra, 0x1c($sp)
  /* 14ADB0 80134D80 10200003 */      beqz $at, .L80134D90
  /* 14ADB4 80134D84 AFA40020 */        sw $a0, 0x20($sp)
  /* 14ADB8 80134D88 1000002C */         b .L80134E3C
  /* 14ADBC 80134D8C 00001025 */        or $v0, $zero, $zero
  .L80134D90:
  /* 14ADC0 80134D90 8E380028 */        lw $t8, 0x28($s1) # gMNBonusPanel + 40
  /* 14ADC4 80134D94 24010002 */     addiu $at, $zero, 2
  /* 14ADC8 80134D98 53010004 */      beql $t8, $at, .L80134DAC
  /* 14ADCC 80134D9C 8E390050 */        lw $t9, 0x50($s1) # gMNBonusPanel + 80
  /* 14ADD0 80134DA0 10000026 */         b .L80134E3C
  /* 14ADD4 80134DA4 00001025 */        or $v0, $zero, $zero
  /* 14ADD8 80134DA8 8E390050 */        lw $t9, 0x50($s1) # gMNBonusPanel + 80
  .L80134DAC:
  /* 14ADDC 80134DAC 24010004 */     addiu $at, $zero, 4
  /* 14ADE0 80134DB0 8FA40020 */        lw $a0, 0x20($sp)
  /* 14ADE4 80134DB4 17210020 */       bne $t9, $at, .L80134E38
  /* 14ADE8 80134DB8 02002825 */        or $a1, $s0, $zero
  /* 14ADEC 80134DBC 0C04D193 */       jal mnBonusCheckTokenPickup
  /* 14ADF0 80134DC0 02003025 */        or $a2, $s0, $zero
  /* 14ADF4 80134DC4 1040001C */      beqz $v0, .L80134E38
  /* 14ADF8 80134DC8 24080001 */     addiu $t0, $zero, 1
  /* 14ADFC 80134DCC AE300050 */        sw $s0, 0x50($s1) # gMNBonusPanel + 80
  /* 14AE00 80134DD0 AE20002C */        sw $zero, 0x2c($s1) # gMNBonusPanel + 44
  /* 14AE04 80134DD4 AE280028 */        sw $t0, 0x28($s1) # gMNBonusPanel + 40
  /* 14AE08 80134DD8 3C018013 */       lui $at, %hi(D_ovl29_8013769C)
  /* 14AE0C 80134DDC AC30769C */        sw $s0, %lo(D_ovl29_8013769C)($at)
  /* 14AE10 80134DE0 AE200058 */        sw $zero, 0x58($s1) # gMNBonusPanel + 88
  /* 14AE14 80134DE4 0C04D1DB */       jal mnBonusSyncFighterDisplay
  /* 14AE18 80134DE8 02002025 */        or $a0, $s0, $zero
  /* 14AE1C 80134DEC 02002025 */        or $a0, $s0, $zero
  /* 14AE20 80134DF0 0C04D2EC */       jal mnBonusReorderCursorsOnPickup
  /* 14AE24 80134DF4 02002825 */        or $a1, $s0, $zero
  /* 14AE28 80134DF8 0C04D320 */       jal mnBonusSetCursorCoordinatesFromToken
  /* 14AE2C 80134DFC 02002025 */        or $a0, $s0, $zero
  /* 14AE30 80134E00 8FA40020 */        lw $a0, 0x20($sp)
  /* 14AE34 80134E04 02002825 */        or $a1, $s0, $zero
  /* 14AE38 80134E08 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14AE3C 80134E0C 8E260028 */        lw $a2, 0x28($s1) # gMNBonusPanel + 40
  /* 14AE40 80134E10 24090001 */     addiu $t1, $zero, 1
  /* 14AE44 80134E14 AE290070 */        sw $t1, 0x70($s1) # gMNBonusPanel + 112
  /* 14AE48 80134E18 0C009A70 */       jal func_800269C0
  /* 14AE4C 80134E1C 2404007F */     addiu $a0, $zero, 0x7f
  /* 14AE50 80134E20 0C04D216 */       jal mnBonusRemoveWhiteSquare
  /* 14AE54 80134E24 02002025 */        or $a0, $s0, $zero
  /* 14AE58 80134E28 0C04D1FE */       jal mnBonusSyncNameAndLogo
  /* 14AE5C 80134E2C 02002025 */        or $a0, $s0, $zero
  /* 14AE60 80134E30 10000002 */         b .L80134E3C
  /* 14AE64 80134E34 24020001 */     addiu $v0, $zero, 1
  .L80134E38:
  /* 14AE68 80134E38 00001025 */        or $v0, $zero, $zero
  .L80134E3C:
  /* 14AE6C 80134E3C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14AE70 80134E40 8FB00014 */        lw $s0, 0x14($sp)
  /* 14AE74 80134E44 8FB10018 */        lw $s1, 0x18($sp)
  /* 14AE78 80134E48 03E00008 */        jr $ra
  /* 14AE7C 80134E4C 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBonusGetFtKindFromTokenPositionEvenIfLocked
  /* 14AE80 80134E50 3C0E8013 */       lui $t6, %hi(D_ovl29_8013764C)
  /* 14AE84 80134E54 8DCE764C */        lw $t6, %lo(D_ovl29_8013764C)($t6)
  /* 14AE88 80134E58 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14AE8C 80134E5C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14AE90 80134E60 8DC20074 */        lw $v0, 0x74($t6)
  /* 14AE94 80134E64 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 14AE98 80134E68 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14AE9C 80134E6C 00001025 */        or $v0, $zero, $zero
  /* 14AEA0 80134E70 4600428D */ trunc.w.s $f10, $f8
  /* 14AEA4 80134E74 4600218D */ trunc.w.s $f6, $f4
  /* 14AEA8 80134E78 44035000 */      mfc1 $v1, $f10
  /* 14AEAC 80134E7C 44053000 */      mfc1 $a1, $f6
  /* 14AEB0 80134E80 2463000C */     addiu $v1, $v1, 0xc
  /* 14AEB4 80134E84 28610024 */      slti $at, $v1, 0x24
  /* 14AEB8 80134E88 14200006 */      bnez $at, .L80134EA4
  /* 14AEBC 80134E8C 24A5000D */     addiu $a1, $a1, 0xd
  /* 14AEC0 80134E90 2861004F */      slti $at, $v1, 0x4f
  /* 14AEC4 80134E94 10200003 */      beqz $at, .L80134EA4
  /* 14AEC8 80134E98 00000000 */       nop
  /* 14AECC 80134E9C 10000001 */         b .L80134EA4
  /* 14AED0 80134EA0 24020001 */     addiu $v0, $zero, 1
  .L80134EA4:
  /* 14AED4 80134EA4 10400011 */      beqz $v0, .L80134EEC
  /* 14AED8 80134EA8 28A10019 */      slti $at, $a1, 0x19
  /* 14AEDC 80134EAC 14200006 */      bnez $at, .L80134EC8
  /* 14AEE0 80134EB0 00001025 */        or $v0, $zero, $zero
  /* 14AEE4 80134EB4 28A10127 */      slti $at, $a1, 0x127
  /* 14AEE8 80134EB8 10200003 */      beqz $at, .L80134EC8
  /* 14AEEC 80134EBC 00000000 */       nop
  /* 14AEF0 80134EC0 10000001 */         b .L80134EC8
  /* 14AEF4 80134EC4 24020001 */     addiu $v0, $zero, 1
  .L80134EC8:
  /* 14AEF8 80134EC8 10400008 */      beqz $v0, .L80134EEC
  /* 14AEFC 80134ECC 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 14AF00 80134ED0 2401002D */     addiu $at, $zero, 0x2d
  /* 14AF04 80134ED4 0081001A */       div $zero, $a0, $at
  /* 14AF08 80134ED8 00002012 */      mflo $a0
  /* 14AF0C 80134EDC 0C04C8E4 */       jal mnBonusGetFtKind
  /* 14AF10 80134EE0 00000000 */       nop
  /* 14AF14 80134EE4 1000001E */         b .L80134F60
  /* 14AF18 80134EE8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80134EEC:
  /* 14AF1C 80134EEC 2861004F */      slti $at, $v1, 0x4f
  /* 14AF20 80134EF0 14200006 */      bnez $at, .L80134F0C
  /* 14AF24 80134EF4 00001025 */        or $v0, $zero, $zero
  /* 14AF28 80134EF8 2861007A */      slti $at, $v1, 0x7a
  /* 14AF2C 80134EFC 10200003 */      beqz $at, .L80134F0C
  /* 14AF30 80134F00 00000000 */       nop
  /* 14AF34 80134F04 10000001 */         b .L80134F0C
  /* 14AF38 80134F08 24020001 */     addiu $v0, $zero, 1
  .L80134F0C:
  /* 14AF3C 80134F0C 10400012 */      beqz $v0, .L80134F58
  /* 14AF40 80134F10 28A10019 */      slti $at, $a1, 0x19
  /* 14AF44 80134F14 14200006 */      bnez $at, .L80134F30
  /* 14AF48 80134F18 00001025 */        or $v0, $zero, $zero
  /* 14AF4C 80134F1C 28A10127 */      slti $at, $a1, 0x127
  /* 14AF50 80134F20 10200003 */      beqz $at, .L80134F30
  /* 14AF54 80134F24 00000000 */       nop
  /* 14AF58 80134F28 10000001 */         b .L80134F30
  /* 14AF5C 80134F2C 24020001 */     addiu $v0, $zero, 1
  .L80134F30:
  /* 14AF60 80134F30 10400009 */      beqz $v0, .L80134F58
  /* 14AF64 80134F34 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 14AF68 80134F38 2401002D */     addiu $at, $zero, 0x2d
  /* 14AF6C 80134F3C 0081001A */       div $zero, $a0, $at
  /* 14AF70 80134F40 00002012 */      mflo $a0
  /* 14AF74 80134F44 24840006 */     addiu $a0, $a0, 6
  /* 14AF78 80134F48 0C04C8E4 */       jal mnBonusGetFtKind
  /* 14AF7C 80134F4C 00000000 */       nop
  /* 14AF80 80134F50 10000003 */         b .L80134F60
  /* 14AF84 80134F54 8FBF0014 */        lw $ra, 0x14($sp)
  .L80134F58:
  /* 14AF88 80134F58 2402001C */     addiu $v0, $zero, 0x1c
  /* 14AF8C 80134F5C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80134F60:
  /* 14AF90 80134F60 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14AF94 80134F64 03E00008 */        jr $ra
  /* 14AF98 80134F68 00000000 */       nop

glabel mnBonusGetFtKindFromTokenPosition
  /* 14AF9C 80134F6C 3C0E8013 */       lui $t6, %hi(D_ovl29_8013764C)
  /* 14AFA0 80134F70 8DCE764C */        lw $t6, %lo(D_ovl29_8013764C)($t6)
  /* 14AFA4 80134F74 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14AFA8 80134F78 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14AFAC 80134F7C AFA40028 */        sw $a0, 0x28($sp)
  /* 14AFB0 80134F80 8DC20074 */        lw $v0, 0x74($t6)
  /* 14AFB4 80134F84 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 14AFB8 80134F88 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14AFBC 80134F8C 00001025 */        or $v0, $zero, $zero
  /* 14AFC0 80134F90 4600428D */ trunc.w.s $f10, $f8
  /* 14AFC4 80134F94 4600218D */ trunc.w.s $f6, $f4
  /* 14AFC8 80134F98 44035000 */      mfc1 $v1, $f10
  /* 14AFCC 80134F9C 44053000 */      mfc1 $a1, $f6
  /* 14AFD0 80134FA0 2463000C */     addiu $v1, $v1, 0xc
  /* 14AFD4 80134FA4 28610024 */      slti $at, $v1, 0x24
  /* 14AFD8 80134FA8 14200006 */      bnez $at, .L80134FC4
  /* 14AFDC 80134FAC 24A5000D */     addiu $a1, $a1, 0xd
  /* 14AFE0 80134FB0 2861004F */      slti $at, $v1, 0x4f
  /* 14AFE4 80134FB4 10200003 */      beqz $at, .L80134FC4
  /* 14AFE8 80134FB8 00000000 */       nop
  /* 14AFEC 80134FBC 10000001 */         b .L80134FC4
  /* 14AFF0 80134FC0 24020001 */     addiu $v0, $zero, 1
  .L80134FC4:
  /* 14AFF4 80134FC4 1040001C */      beqz $v0, .L80135038
  /* 14AFF8 80134FC8 28A10019 */      slti $at, $a1, 0x19
  /* 14AFFC 80134FCC 14200006 */      bnez $at, .L80134FE8
  /* 14B000 80134FD0 00001025 */        or $v0, $zero, $zero
  /* 14B004 80134FD4 28A10127 */      slti $at, $a1, 0x127
  /* 14B008 80134FD8 10200003 */      beqz $at, .L80134FE8
  /* 14B00C 80134FDC 00000000 */       nop
  /* 14B010 80134FE0 10000001 */         b .L80134FE8
  /* 14B014 80134FE4 24020001 */     addiu $v0, $zero, 1
  .L80134FE8:
  /* 14B018 80134FE8 10400013 */      beqz $v0, .L80135038
  /* 14B01C 80134FEC 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 14B020 80134FF0 2401002D */     addiu $at, $zero, 0x2d
  /* 14B024 80134FF4 0081001A */       div $zero, $a0, $at
  /* 14B028 80134FF8 00002012 */      mflo $a0
  /* 14B02C 80134FFC 0C04C8E4 */       jal mnBonusGetFtKind
  /* 14B030 80135000 00000000 */       nop
  /* 14B034 80135004 AFA20018 */        sw $v0, 0x18($sp)
  /* 14B038 80135008 0C04C851 */       jal mnBonusCheckFighterIsXBoxed
  /* 14B03C 8013500C 00402025 */        or $a0, $v0, $zero
  /* 14B040 80135010 14400005 */      bnez $v0, .L80135028
  /* 14B044 80135014 00000000 */       nop
  /* 14B048 80135018 0C04C8AF */       jal mnBonusGetIsLocked
  /* 14B04C 8013501C 8FA40018 */        lw $a0, 0x18($sp)
  /* 14B050 80135020 10400003 */      beqz $v0, .L80135030
  /* 14B054 80135024 00000000 */       nop
  .L80135028:
  /* 14B058 80135028 1000002A */         b .L801350D4
  /* 14B05C 8013502C 2402001C */     addiu $v0, $zero, 0x1c
  .L80135030:
  /* 14B060 80135030 10000028 */         b .L801350D4
  /* 14B064 80135034 8FA20018 */        lw $v0, 0x18($sp)
  .L80135038:
  /* 14B068 80135038 2861004F */      slti $at, $v1, 0x4f
  /* 14B06C 8013503C 14200006 */      bnez $at, .L80135058
  /* 14B070 80135040 00001025 */        or $v0, $zero, $zero
  /* 14B074 80135044 2861007A */      slti $at, $v1, 0x7a
  /* 14B078 80135048 10200003 */      beqz $at, .L80135058
  /* 14B07C 8013504C 00000000 */       nop
  /* 14B080 80135050 10000001 */         b .L80135058
  /* 14B084 80135054 24020001 */     addiu $v0, $zero, 1
  .L80135058:
  /* 14B088 80135058 1040001D */      beqz $v0, .L801350D0
  /* 14B08C 8013505C 28A10019 */      slti $at, $a1, 0x19
  /* 14B090 80135060 14200006 */      bnez $at, .L8013507C
  /* 14B094 80135064 00001025 */        or $v0, $zero, $zero
  /* 14B098 80135068 28A10127 */      slti $at, $a1, 0x127
  /* 14B09C 8013506C 10200003 */      beqz $at, .L8013507C
  /* 14B0A0 80135070 00000000 */       nop
  /* 14B0A4 80135074 10000001 */         b .L8013507C
  /* 14B0A8 80135078 24020001 */     addiu $v0, $zero, 1
  .L8013507C:
  /* 14B0AC 8013507C 10400014 */      beqz $v0, .L801350D0
  /* 14B0B0 80135080 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 14B0B4 80135084 2401002D */     addiu $at, $zero, 0x2d
  /* 14B0B8 80135088 0081001A */       div $zero, $a0, $at
  /* 14B0BC 8013508C 00002012 */      mflo $a0
  /* 14B0C0 80135090 24840006 */     addiu $a0, $a0, 6
  /* 14B0C4 80135094 0C04C8E4 */       jal mnBonusGetFtKind
  /* 14B0C8 80135098 00000000 */       nop
  /* 14B0CC 8013509C AFA20018 */        sw $v0, 0x18($sp)
  /* 14B0D0 801350A0 0C04C851 */       jal mnBonusCheckFighterIsXBoxed
  /* 14B0D4 801350A4 00402025 */        or $a0, $v0, $zero
  /* 14B0D8 801350A8 14400005 */      bnez $v0, .L801350C0
  /* 14B0DC 801350AC 00000000 */       nop
  /* 14B0E0 801350B0 0C04C8AF */       jal mnBonusGetIsLocked
  /* 14B0E4 801350B4 8FA40018 */        lw $a0, 0x18($sp)
  /* 14B0E8 801350B8 10400003 */      beqz $v0, .L801350C8
  /* 14B0EC 801350BC 00000000 */       nop
  .L801350C0:
  /* 14B0F0 801350C0 10000004 */         b .L801350D4
  /* 14B0F4 801350C4 2402001C */     addiu $v0, $zero, 0x1c
  .L801350C8:
  /* 14B0F8 801350C8 10000002 */         b .L801350D4
  /* 14B0FC 801350CC 8FA20018 */        lw $v0, 0x18($sp)
  .L801350D0:
  /* 14B100 801350D0 2402001C */     addiu $v0, $zero, 0x1c
  .L801350D4:
  /* 14B104 801350D4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14B108 801350D8 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14B10C 801350DC 03E00008 */        jr $ra
  /* 14B110 801350E0 00000000 */       nop

glabel mnBonusAutoPositionCursor
  /* 14B114 801350E4 3C0E8013 */       lui $t6, %hi(dMNBonusCursorTypePositions2)
  /* 14B118 801350E8 25CE7494 */     addiu $t6, $t6, %lo(dMNBonusCursorTypePositions2)
  /* 14B11C 801350EC 8DD80000 */        lw $t8, ($t6) # dMNBonusCursorTypePositions2 + 0
  /* 14B120 801350F0 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 14B124 801350F4 27A80014 */     addiu $t0, $sp, 0x14
  /* 14B128 801350F8 AD180000 */        sw $t8, ($t0)
  /* 14B12C 801350FC 8DCF0004 */        lw $t7, 4($t6) # dMNBonusCursorTypePositions2 + 4
  /* 14B130 80135100 3C098013 */       lui $t1, %hi(gMNBonusPanel)
  /* 14B134 80135104 25297648 */     addiu $t1, $t1, %lo(gMNBonusPanel)
  /* 14B138 80135108 AD0F0004 */        sw $t7, 4($t0)
  /* 14B13C 8013510C 8DD80008 */        lw $t8, 8($t6) # dMNBonusCursorTypePositions2 + 8
  /* 14B140 80135110 8D390070 */        lw $t9, 0x70($t1) # gMNBonusPanel + 112
  /* 14B144 80135114 AD180008 */        sw $t8, 8($t0)
  /* 14B148 80135118 8DCF000C */        lw $t7, 0xc($t6) # dMNBonusCursorTypePositions2 + 12
  /* 14B14C 8013511C AD0F000C */        sw $t7, 0xc($t0)
  /* 14B150 80135120 8DD80010 */        lw $t8, 0x10($t6) # dMNBonusCursorTypePositions2 + 16
  /* 14B154 80135124 AD180010 */        sw $t8, 0x10($t0)
  /* 14B158 80135128 8DCF0014 */        lw $t7, 0x14($t6) # dMNBonusCursorTypePositions2 + 20
  /* 14B15C 8013512C 13200060 */      beqz $t9, .L801352B0
  /* 14B160 80135130 AD0F0014 */        sw $t7, 0x14($t0)
  /* 14B164 80135134 8D2A0000 */        lw $t2, ($t1) # gMNBonusPanel + 0
  /* 14B168 80135138 C5220068 */      lwc1 $f2, 0x68($t1) # gMNBonusPanel + 104
  /* 14B16C 8013513C 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 14B170 80135140 8D420074 */        lw $v0, 0x74($t2)
  /* 14B174 80135144 44817000 */      mtc1 $at, $f14 # 5.0 to cop1
  /* 14B178 80135148 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 14B17C 8013514C C44C0058 */      lwc1 $f12, 0x58($v0)
  /* 14B180 80135150 44818000 */      mtc1 $at, $f16 # -1.0 to cop1
  /* 14B184 80135154 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 14B188 80135158 460C1101 */     sub.s $f4, $f2, $f12
  /* 14B18C 8013515C 00001825 */        or $v1, $zero, $zero
  /* 14B190 80135160 460E2003 */     div.s $f0, $f4, $f14
  /* 14B194 80135164 4600803E */    c.le.s $f16, $f0
  /* 14B198 80135168 00000000 */       nop
  /* 14B19C 8013516C 45000009 */      bc1f .L80135194
  /* 14B1A0 80135170 00000000 */       nop
  /* 14B1A4 80135174 44813000 */      mtc1 $at, $f6 # 1.0 to cop1
  /* 14B1A8 80135178 00000000 */       nop
  /* 14B1AC 8013517C 4606003E */    c.le.s $f0, $f6
  /* 14B1B0 80135180 00000000 */       nop
  /* 14B1B4 80135184 45000003 */      bc1f .L80135194
  /* 14B1B8 80135188 00000000 */       nop
  /* 14B1BC 8013518C 10000001 */         b .L80135194
  /* 14B1C0 80135190 24030001 */     addiu $v1, $zero, 1
  .L80135194:
  /* 14B1C4 80135194 10600003 */      beqz $v1, .L801351A4
  /* 14B1C8 80135198 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 14B1CC 8013519C 10000003 */         b .L801351AC
  /* 14B1D0 801351A0 E4420058 */      swc1 $f2, 0x58($v0)
  .L801351A4:
  /* 14B1D4 801351A4 46006200 */     add.s $f8, $f12, $f0
  /* 14B1D8 801351A8 E4480058 */      swc1 $f8, 0x58($v0)
  .L801351AC:
  /* 14B1DC 801351AC 8D2B0000 */        lw $t3, ($t1) # gMNBonusPanel + 0
  /* 14B1E0 801351B0 C522006C */      lwc1 $f2, 0x6c($t1) # gMNBonusPanel + 108
  /* 14B1E4 801351B4 00001825 */        or $v1, $zero, $zero
  /* 14B1E8 801351B8 8D620074 */        lw $v0, 0x74($t3)
  /* 14B1EC 801351BC C44C005C */      lwc1 $f12, 0x5c($v0)
  /* 14B1F0 801351C0 460C1281 */     sub.s $f10, $f2, $f12
  /* 14B1F4 801351C4 460E5003 */     div.s $f0, $f10, $f14
  /* 14B1F8 801351C8 4600803E */    c.le.s $f16, $f0
  /* 14B1FC 801351CC 00000000 */       nop
  /* 14B200 801351D0 45000009 */      bc1f .L801351F8
  /* 14B204 801351D4 00000000 */       nop
  /* 14B208 801351D8 44819000 */      mtc1 $at, $f18 # 1.0 to cop1
  /* 14B20C 801351DC 00000000 */       nop
  /* 14B210 801351E0 4612003E */    c.le.s $f0, $f18
  /* 14B214 801351E4 00000000 */       nop
  /* 14B218 801351E8 45000003 */      bc1f .L801351F8
  /* 14B21C 801351EC 00000000 */       nop
  /* 14B220 801351F0 10000001 */         b .L801351F8
  /* 14B224 801351F4 24030001 */     addiu $v1, $zero, 1
  .L801351F8:
  /* 14B228 801351F8 50600004 */      beql $v1, $zero, .L8013520C
  /* 14B22C 801351FC 46006100 */     add.s $f4, $f12, $f0
  /* 14B230 80135200 10000003 */         b .L80135210
  /* 14B234 80135204 E442005C */      swc1 $f2, 0x5c($v0)
  /* 14B238 80135208 46006100 */     add.s $f4, $f12, $f0
  .L8013520C:
  /* 14B23C 8013520C E444005C */      swc1 $f4, 0x5c($v0)
  .L80135210:
  /* 14B240 80135210 8D2C0000 */        lw $t4, ($t1) # gMNBonusPanel + 0
  /* 14B244 80135214 C5260068 */      lwc1 $f6, 0x68($t1) # gMNBonusPanel + 104
  /* 14B248 80135218 8D820074 */        lw $v0, 0x74($t4)
  /* 14B24C 8013521C C4480058 */      lwc1 $f8, 0x58($v0)
  /* 14B250 80135220 46083032 */    c.eq.s $f6, $f8
  /* 14B254 80135224 00000000 */       nop
  /* 14B258 80135228 45020009 */     bc1fl .L80135250
  /* 14B25C 8013522C 8D2D0028 */        lw $t5, 0x28($t1) # gMNBonusPanel + 40
  /* 14B260 80135230 C52A006C */      lwc1 $f10, 0x6c($t1) # gMNBonusPanel + 108
  /* 14B264 80135234 C452005C */      lwc1 $f18, 0x5c($v0)
  /* 14B268 80135238 46125032 */    c.eq.s $f10, $f18
  /* 14B26C 8013523C 00000000 */       nop
  /* 14B270 80135240 45020003 */     bc1fl .L80135250
  /* 14B274 80135244 8D2D0028 */        lw $t5, 0x28($t1) # gMNBonusPanel + 40
  /* 14B278 80135248 AD200070 */        sw $zero, 0x70($t1) # gMNBonusPanel + 112
  /* 14B27C 8013524C 8D2D0028 */        lw $t5, 0x28($t1) # gMNBonusPanel + 40
  .L80135250:
  /* 14B280 80135250 8C820074 */        lw $v0, 0x74($a0)
  /* 14B284 80135254 000D70C0 */       sll $t6, $t5, 3
  /* 14B288 80135258 010E7821 */      addu $t7, $t0, $t6
  /* 14B28C 8013525C 8DF80000 */        lw $t8, ($t7)
  /* 14B290 80135260 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 14B294 80135264 8C590008 */        lw $t9, 8($v0)
  /* 14B298 80135268 44982000 */      mtc1 $t8, $f4
  /* 14B29C 8013526C 00000000 */       nop
  /* 14B2A0 80135270 468021A0 */   cvt.s.w $f6, $f4
  /* 14B2A4 80135274 46083280 */     add.s $f10, $f6, $f8
  /* 14B2A8 80135278 E72A0058 */      swc1 $f10, 0x58($t9)
  /* 14B2AC 8013527C 8D2A0028 */        lw $t2, 0x28($t1) # gMNBonusPanel + 40
  /* 14B2B0 80135280 8C820074 */        lw $v0, 0x74($a0)
  /* 14B2B4 80135284 000A58C0 */       sll $t3, $t2, 3
  /* 14B2B8 80135288 010B6021 */      addu $t4, $t0, $t3
  /* 14B2BC 8013528C 8D8D0004 */        lw $t5, 4($t4)
  /* 14B2C0 80135290 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 14B2C4 80135294 8C4E0008 */        lw $t6, 8($v0)
  /* 14B2C8 80135298 448D9000 */      mtc1 $t5, $f18
  /* 14B2CC 8013529C 00000000 */       nop
  /* 14B2D0 801352A0 46809120 */   cvt.s.w $f4, $f18
  /* 14B2D4 801352A4 46062200 */     add.s $f8, $f4, $f6
  /* 14B2D8 801352A8 1000006A */         b .L80135454
  /* 14B2DC 801352AC E5C8005C */      swc1 $f8, 0x5c($t6)
  .L801352B0:
  /* 14B2E0 801352B0 8D2F0030 */        lw $t7, 0x30($t1) # gMNBonusPanel + 48
  /* 14B2E4 801352B4 0005C080 */       sll $t8, $a1, 2
  /* 14B2E8 801352B8 0305C021 */      addu $t8, $t8, $a1
  /* 14B2EC 801352BC 15E00065 */      bnez $t7, .L80135454
  /* 14B2F0 801352C0 0018C040 */       sll $t8, $t8, 1
  /* 14B2F4 801352C4 3C198004 */       lui $t9, %hi(gPlayerControllers)
  /* 14B2F8 801352C8 27395228 */     addiu $t9, $t9, %lo(gPlayerControllers)
  /* 14B2FC 801352CC 03193021 */      addu $a2, $t8, $t9
  /* 14B300 801352D0 80C70008 */        lb $a3, 8($a2)
  /* 14B304 801352D4 28E1FFF8 */      slti $at, $a3, -8
  /* 14B308 801352D8 14200003 */      bnez $at, .L801352E8
  /* 14B30C 801352DC 28E10009 */      slti $at, $a3, 9
  /* 14B310 801352E0 14200003 */      bnez $at, .L801352F0
  /* 14B314 801352E4 00001825 */        or $v1, $zero, $zero
  .L801352E8:
  /* 14B318 801352E8 10000001 */         b .L801352F0
  /* 14B31C 801352EC 24030001 */     addiu $v1, $zero, 1
  .L801352F0:
  /* 14B320 801352F0 50600028 */      beql $v1, $zero, .L80135394
  /* 14B324 801352F4 80C50009 */        lb $a1, 9($a2)
  /* 14B328 801352F8 44875000 */      mtc1 $a3, $f10
  /* 14B32C 801352FC 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 14B330 80135300 44812000 */      mtc1 $at, $f4 # 20.0 to cop1
  /* 14B334 80135304 468054A0 */   cvt.s.w $f18, $f10
  /* 14B338 80135308 8C820074 */        lw $v0, 0x74($a0)
  /* 14B33C 8013530C 44805000 */      mtc1 $zero, $f10
  /* 14B340 80135310 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 14B344 80135314 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 14B348 80135318 00001825 */        or $v1, $zero, $zero
  /* 14B34C 8013531C 46049183 */     div.s $f6, $f18, $f4
  /* 14B350 80135320 46083000 */     add.s $f0, $f6, $f8
  /* 14B354 80135324 4600503E */    c.le.s $f10, $f0
  /* 14B358 80135328 00000000 */       nop
  /* 14B35C 8013532C 45000009 */      bc1f .L80135354
  /* 14B360 80135330 00000000 */       nop
  /* 14B364 80135334 44819000 */      mtc1 $at, $f18 # 280.0 to cop1
  /* 14B368 80135338 00000000 */       nop
  /* 14B36C 8013533C 4612003E */    c.le.s $f0, $f18
  /* 14B370 80135340 00000000 */       nop
  /* 14B374 80135344 45000003 */      bc1f .L80135354
  /* 14B378 80135348 00000000 */       nop
  /* 14B37C 8013534C 10000001 */         b .L80135354
  /* 14B380 80135350 24030001 */     addiu $v1, $zero, 1
  .L80135354:
  /* 14B384 80135354 5060000F */      beql $v1, $zero, .L80135394
  /* 14B388 80135358 80C50009 */        lb $a1, 9($a2)
  /* 14B38C 8013535C E4400058 */      swc1 $f0, 0x58($v0)
  /* 14B390 80135360 8D2A0028 */        lw $t2, 0x28($t1) # gMNBonusPanel + 40
  /* 14B394 80135364 8C820074 */        lw $v0, 0x74($a0)
  /* 14B398 80135368 000A58C0 */       sll $t3, $t2, 3
  /* 14B39C 8013536C 010B6021 */      addu $t4, $t0, $t3
  /* 14B3A0 80135370 8D8D0000 */        lw $t5, ($t4)
  /* 14B3A4 80135374 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 14B3A8 80135378 8C4E0008 */        lw $t6, 8($v0)
  /* 14B3AC 8013537C 448D2000 */      mtc1 $t5, $f4
  /* 14B3B0 80135380 00000000 */       nop
  /* 14B3B4 80135384 468021A0 */   cvt.s.w $f6, $f4
  /* 14B3B8 80135388 46083280 */     add.s $f10, $f6, $f8
  /* 14B3BC 8013538C E5CA0058 */      swc1 $f10, 0x58($t6)
  /* 14B3C0 80135390 80C50009 */        lb $a1, 9($a2)
  .L80135394:
  /* 14B3C4 80135394 28A1FFF8 */      slti $at, $a1, -8
  /* 14B3C8 80135398 14200003 */      bnez $at, .L801353A8
  /* 14B3CC 8013539C 28A10009 */      slti $at, $a1, 9
  /* 14B3D0 801353A0 14200003 */      bnez $at, .L801353B0
  /* 14B3D4 801353A4 00001825 */        or $v1, $zero, $zero
  .L801353A8:
  /* 14B3D8 801353A8 10000001 */         b .L801353B0
  /* 14B3DC 801353AC 24030001 */     addiu $v1, $zero, 1
  .L801353B0:
  /* 14B3E0 801353B0 10600028 */      beqz $v1, .L80135454
  /* 14B3E4 801353B4 00000000 */       nop
  /* 14B3E8 801353B8 44859000 */      mtc1 $a1, $f18
  /* 14B3EC 801353BC 3C01C1A0 */       lui $at, (0xC1A00000 >> 16) # -20.0
  /* 14B3F0 801353C0 44813000 */      mtc1 $at, $f6 # -20.0 to cop1
  /* 14B3F4 801353C4 46809120 */   cvt.s.w $f4, $f18
  /* 14B3F8 801353C8 8C820074 */        lw $v0, 0x74($a0)
  /* 14B3FC 801353CC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14B400 801353D0 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 14B404 801353D4 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 14B408 801353D8 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 14B40C 801353DC 46062203 */     div.s $f8, $f4, $f6
  /* 14B410 801353E0 00001825 */        or $v1, $zero, $zero
  /* 14B414 801353E4 460A4000 */     add.s $f0, $f8, $f10
  /* 14B418 801353E8 4600903E */    c.le.s $f18, $f0
  /* 14B41C 801353EC 00000000 */       nop
  /* 14B420 801353F0 45000009 */      bc1f .L80135418
  /* 14B424 801353F4 00000000 */       nop
  /* 14B428 801353F8 44812000 */      mtc1 $at, $f4 # 205.0 to cop1
  /* 14B42C 801353FC 00000000 */       nop
  /* 14B430 80135400 4604003E */    c.le.s $f0, $f4
  /* 14B434 80135404 00000000 */       nop
  /* 14B438 80135408 45000003 */      bc1f .L80135418
  /* 14B43C 8013540C 00000000 */       nop
  /* 14B440 80135410 10000001 */         b .L80135418
  /* 14B444 80135414 24030001 */     addiu $v1, $zero, 1
  .L80135418:
  /* 14B448 80135418 1060000E */      beqz $v1, .L80135454
  /* 14B44C 8013541C 00000000 */       nop
  /* 14B450 80135420 E440005C */      swc1 $f0, 0x5c($v0)
  /* 14B454 80135424 8D2F0028 */        lw $t7, 0x28($t1) # gMNBonusPanel + 40
  /* 14B458 80135428 8C820074 */        lw $v0, 0x74($a0)
  /* 14B45C 8013542C 000FC0C0 */       sll $t8, $t7, 3
  /* 14B460 80135430 0118C821 */      addu $t9, $t0, $t8
  /* 14B464 80135434 8F2A0004 */        lw $t2, 4($t9) # gPlayerControllers + 4
  /* 14B468 80135438 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 14B46C 8013543C 8C4B0008 */        lw $t3, 8($v0)
  /* 14B470 80135440 448A3000 */      mtc1 $t2, $f6
  /* 14B474 80135444 00000000 */       nop
  /* 14B478 80135448 46803220 */   cvt.s.w $f8, $f6
  /* 14B47C 8013544C 460A4480 */     add.s $f18, $f8, $f10
  /* 14B480 80135450 E572005C */      swc1 $f18, 0x5c($t3)
  .L80135454:
  /* 14B484 80135454 03E00008 */        jr $ra
  /* 14B488 80135458 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBonusSyncCursorDisplay
  /* 14B48C 8013545C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 14B490 80135460 AFBF002C */        sw $ra, 0x2c($sp)
  /* 14B494 80135464 AFB50028 */        sw $s5, 0x28($sp)
  /* 14B498 80135468 AFB40024 */        sw $s4, 0x24($sp)
  /* 14B49C 8013546C AFB30020 */        sw $s3, 0x20($sp)
  /* 14B4A0 80135470 AFB2001C */        sw $s2, 0x1c($sp)
  /* 14B4A4 80135474 AFB10018 */        sw $s1, 0x18($sp)
  /* 14B4A8 80135478 AFB00014 */        sw $s0, 0x14($sp)
  /* 14B4AC 8013547C 8C8E0074 */        lw $t6, 0x74($a0)
  /* 14B4B0 80135480 3C0142F8 */       lui $at, (0x42F80000 >> 16) # 124.0
  /* 14B4B4 80135484 44812000 */      mtc1 $at, $f4 # 124.0 to cop1
  /* 14B4B8 80135488 C5C0005C */      lwc1 $f0, 0x5c($t6)
  /* 14B4BC 8013548C 3C128013 */       lui $s2, %hi(gMNBonusPanel)
  /* 14B4C0 80135490 0080A025 */        or $s4, $a0, $zero
  /* 14B4C4 80135494 4600203C */    c.lt.s $f4, $f0
  /* 14B4C8 80135498 00A0A825 */        or $s5, $a1, $zero
  /* 14B4CC 8013549C 26527648 */     addiu $s2, $s2, %lo(gMNBonusPanel)
  /* 14B4D0 801354A0 3C014218 */       lui $at, (0x42180000 >> 16) # 38.0
  /* 14B4D4 801354A4 45030008 */     bc1tl .L801354C8
  /* 14B4D8 801354A8 8E420028 */        lw $v0, 0x28($s2) # gMNBonusPanel + 40
  /* 14B4DC 801354AC 44813000 */      mtc1 $at, $f6 # 38.0 to cop1
  /* 14B4E0 801354B0 00000000 */       nop
  /* 14B4E4 801354B4 4606003C */    c.lt.s $f0, $f6
  /* 14B4E8 801354B8 00000000 */       nop
  /* 14B4EC 801354BC 4500000C */      bc1f .L801354F0
  /* 14B4F0 801354C0 00000000 */       nop
  /* 14B4F4 801354C4 8E420028 */        lw $v0, 0x28($s2) # gMNBonusPanel + 40
  .L801354C8:
  /* 14B4F8 801354C8 02802025 */        or $a0, $s4, $zero
  /* 14B4FC 801354CC 02A02825 */        or $a1, $s5, $zero
  /* 14B500 801354D0 10400005 */      beqz $v0, .L801354E8
  /* 14B504 801354D4 00000000 */       nop
  /* 14B508 801354D8 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14B50C 801354DC 00003025 */        or $a2, $zero, $zero
  /* 14B510 801354E0 AE400028 */        sw $zero, 0x28($s2) # gMNBonusPanel + 40
  /* 14B514 801354E4 00001025 */        or $v0, $zero, $zero
  .L801354E8:
  /* 14B518 801354E8 1000001B */         b .L80135558
  /* 14B51C 801354EC 24130001 */     addiu $s3, $zero, 1
  .L801354F0:
  /* 14B520 801354F0 3C128013 */       lui $s2, %hi(gMNBonusPanel)
  /* 14B524 801354F4 26527648 */     addiu $s2, $s2, %lo(gMNBonusPanel)
  /* 14B528 801354F8 8E4F0054 */        lw $t7, 0x54($s2) # gMNBonusPanel + 84
  /* 14B52C 801354FC 2401FFFF */     addiu $at, $zero, -1
  /* 14B530 80135500 55E1000D */      bnel $t7, $at, .L80135538
  /* 14B534 80135504 8E420028 */        lw $v0, 0x28($s2) # gMNBonusPanel + 40
  /* 14B538 80135508 8E420028 */        lw $v0, 0x28($s2) # gMNBonusPanel + 40
  /* 14B53C 8013550C 24010002 */     addiu $at, $zero, 2
  /* 14B540 80135510 02802025 */        or $a0, $s4, $zero
  /* 14B544 80135514 10410005 */       beq $v0, $at, .L8013552C
  /* 14B548 80135518 02A02825 */        or $a1, $s5, $zero
  /* 14B54C 8013551C 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14B550 80135520 24060002 */     addiu $a2, $zero, 2
  /* 14B554 80135524 24020002 */     addiu $v0, $zero, 2
  /* 14B558 80135528 AE420028 */        sw $v0, 0x28($s2) # gMNBonusPanel + 40
  .L8013552C:
  /* 14B55C 8013552C 1000000A */         b .L80135558
  /* 14B560 80135530 24130001 */     addiu $s3, $zero, 1
  /* 14B564 80135534 8E420028 */        lw $v0, 0x28($s2) # gMNBonusPanel + 40
  .L80135538:
  /* 14B568 80135538 24130001 */     addiu $s3, $zero, 1
  /* 14B56C 8013553C 02802025 */        or $a0, $s4, $zero
  /* 14B570 80135540 12620005 */       beq $s3, $v0, .L80135558
  /* 14B574 80135544 02A02825 */        or $a1, $s5, $zero
  /* 14B578 80135548 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14B57C 8013554C 02603025 */        or $a2, $s3, $zero
  /* 14B580 80135550 AE530028 */        sw $s3, 0x28($s2) # gMNBonusPanel + 40
  /* 14B584 80135554 02601025 */        or $v0, $s3, $zero
  .L80135558:
  /* 14B588 80135558 54400019 */      bnel $v0, $zero, .L801355C0
  /* 14B58C 8013555C 8FBF002C */        lw $ra, 0x2c($sp)
  /* 14B590 80135560 8E59002C */        lw $t9, 0x2c($s2) # gMNBonusPanel + 44
  /* 14B594 80135564 00008025 */        or $s0, $zero, $zero
  /* 14B598 80135568 24110004 */     addiu $s1, $zero, 4
  /* 14B59C 8013556C 53200014 */      beql $t9, $zero, .L801355C0
  /* 14B5A0 80135570 8FBF002C */        lw $ra, 0x2c($sp)
  /* 14B5A4 80135574 8E48002C */        lw $t0, 0x2c($s2) # gMNBonusPanel + 44
  .L80135578:
  /* 14B5A8 80135578 02802025 */        or $a0, $s4, $zero
  /* 14B5AC 8013557C 02A02825 */        or $a1, $s5, $zero
  /* 14B5B0 80135580 5668000C */      bnel $s3, $t0, .L801355B4
  /* 14B5B4 80135584 26100001 */     addiu $s0, $s0, 1
  /* 14B5B8 80135588 0C04D193 */       jal mnBonusCheckTokenPickup
  /* 14B5BC 8013558C 02003025 */        or $a2, $s0, $zero
  /* 14B5C0 80135590 10400007 */      beqz $v0, .L801355B0
  /* 14B5C4 80135594 02802025 */        or $a0, $s4, $zero
  /* 14B5C8 80135598 02A02825 */        or $a1, $s5, $zero
  /* 14B5CC 8013559C 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14B5D0 801355A0 24060002 */     addiu $a2, $zero, 2
  /* 14B5D4 801355A4 24090002 */     addiu $t1, $zero, 2
  /* 14B5D8 801355A8 10000004 */         b .L801355BC
  /* 14B5DC 801355AC AE490028 */        sw $t1, 0x28($s2) # gMNBonusPanel + 40
  .L801355B0:
  /* 14B5E0 801355B0 26100001 */     addiu $s0, $s0, 1
  .L801355B4:
  /* 14B5E4 801355B4 5611FFF0 */      bnel $s0, $s1, .L80135578
  /* 14B5E8 801355B8 8E48002C */        lw $t0, 0x2c($s2) # gMNBonusPanel + 44
  .L801355BC:
  /* 14B5EC 801355BC 8FBF002C */        lw $ra, 0x2c($sp)
  .L801355C0:
  /* 14B5F0 801355C0 8FB00014 */        lw $s0, 0x14($sp)
  /* 14B5F4 801355C4 8FB10018 */        lw $s1, 0x18($sp)
  /* 14B5F8 801355C8 8FB2001C */        lw $s2, 0x1c($sp)
  /* 14B5FC 801355CC 8FB30020 */        lw $s3, 0x20($sp)
  /* 14B600 801355D0 8FB40024 */        lw $s4, 0x24($sp)
  /* 14B604 801355D4 8FB50028 */        lw $s5, 0x28($sp)
  /* 14B608 801355D8 03E00008 */        jr $ra
  /* 14B60C 801355DC 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBonusSyncShadeAndCostume
  /* 14B610 801355E0 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14B614 801355E4 AFA40020 */        sw $a0, 0x20($sp)
  /* 14B618 801355E8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14B61C 801355EC 3C048013 */       lui $a0, %hi(D_ovl29_80137668)
  /* 14B620 801355F0 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 14B624 801355F4 8C847668 */        lw $a0, %lo(D_ovl29_80137668)($a0)
  /* 14B628 801355F8 3C048013 */       lui $a0, %hi(D_ovl29_80137650)
  /* 14B62C 801355FC AFA2001C */        sw $v0, 0x1c($sp)
  /* 14B630 80135600 8C847650 */        lw $a0, %lo(D_ovl29_80137650)($a0)
  /* 14B634 80135604 00402825 */        or $a1, $v0, $zero
  /* 14B638 80135608 0C03A492 */       jal func_ovl2_800E9248
  /* 14B63C 8013560C 00003025 */        or $a2, $zero, $zero
  /* 14B640 80135610 8FAE001C */        lw $t6, 0x1c($sp)
  /* 14B644 80135614 3C018013 */       lui $at, %hi(D_ovl29_8013766C)
  /* 14B648 80135618 240400A4 */     addiu $a0, $zero, 0xa4
  /* 14B64C 8013561C 0C009A70 */       jal func_800269C0
  /* 14B650 80135620 AC2E766C */        sw $t6, %lo(D_ovl29_8013766C)($at)
  /* 14B654 80135624 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14B658 80135628 27BD0020 */     addiu $sp, $sp, 0x20
  /* 14B65C 8013562C 03E00008 */        jr $ra
  /* 14B660 80135630 00000000 */       nop

glabel mnBonusIsHumanWithCharacterSelected
  /* 14B664 80135634 3C0E8013 */       lui $t6, %hi(D_ovl29_80137674)
  /* 14B668 80135638 8DCE7674 */        lw $t6, %lo(D_ovl29_80137674)($t6)
  /* 14B66C 8013563C AFA40000 */        sw $a0, ($sp)
  /* 14B670 80135640 00001025 */        or $v0, $zero, $zero
  /* 14B674 80135644 11C00003 */      beqz $t6, .L80135654
  /* 14B678 80135648 00000000 */       nop
  /* 14B67C 8013564C 03E00008 */        jr $ra
  /* 14B680 80135650 24020001 */     addiu $v0, $zero, 1

  .L80135654:
  /* 14B684 80135654 03E00008 */        jr $ra
  /* 14B688 80135658 00000000 */       nop

glabel mnBonusRecallToken
  /* 14B68C 8013565C AFA40000 */        sw $a0, ($sp)
  /* 14B690 80135660 3C048013 */       lui $a0, %hi(gMNBonusPanel)
  /* 14B694 80135664 24847648 */     addiu $a0, $a0, %lo(gMNBonusPanel)
  /* 14B698 80135668 8C820004 */        lw $v0, 4($a0) # gMNBonusPanel + 4
  /* 14B69C 8013566C 240E0001 */     addiu $t6, $zero, 1
  /* 14B6A0 80135670 AC800058 */        sw $zero, 0x58($a0) # gMNBonusPanel + 88
  /* 14B6A4 80135674 AC80002C */        sw $zero, 0x2c($a0) # gMNBonusPanel + 44
  /* 14B6A8 80135678 AC8E0030 */        sw $t6, 0x30($a0) # gMNBonusPanel + 48
  /* 14B6AC 8013567C AC80004C */        sw $zero, 0x4c($a0) # gMNBonusPanel + 76
  /* 14B6B0 80135680 8C4F0074 */        lw $t7, 0x74($v0)
  /* 14B6B4 80135684 8C830000 */        lw $v1, ($a0) # gMNBonusPanel + 0
  /* 14B6B8 80135688 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 14B6BC 8013568C C5E40058 */      lwc1 $f4, 0x58($t7)
  /* 14B6C0 80135690 44810000 */      mtc1 $at, $f0 # 280.0 to cop1
  /* 14B6C4 80135694 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 14B6C8 80135698 E4840038 */      swc1 $f4, 0x38($a0) # gMNBonusPanel + 56
  /* 14B6CC 8013569C 8C580074 */        lw $t8, 0x74($v0)
  /* 14B6D0 801356A0 44816000 */      mtc1 $at, $f12 # 20.0 to cop1
  /* 14B6D4 801356A4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14B6D8 801356A8 C706005C */      lwc1 $f6, 0x5c($t8)
  /* 14B6DC 801356AC 44811000 */      mtc1 $at, $f2 # 10.0 to cop1
  /* 14B6E0 801356B0 E4860040 */      swc1 $f6, 0x40($a0) # gMNBonusPanel + 64
  /* 14B6E4 801356B4 8C790074 */        lw $t9, 0x74($v1)
  /* 14B6E8 801356B8 C7280058 */      lwc1 $f8, 0x58($t9)
  /* 14B6EC 801356BC 460C4280 */     add.s $f10, $f8, $f12
  /* 14B6F0 801356C0 E48A003C */      swc1 $f10, 0x3c($a0) # gMNBonusPanel + 60
  /* 14B6F4 801356C4 C490003C */      lwc1 $f16, 0x3c($a0) # gMNBonusPanel + 60
  /* 14B6F8 801356C8 4610003C */    c.lt.s $f0, $f16
  /* 14B6FC 801356CC 00000000 */       nop
  /* 14B700 801356D0 45020003 */     bc1fl .L801356E0
  /* 14B704 801356D4 8C680074 */        lw $t0, 0x74($v1)
  /* 14B708 801356D8 E480003C */      swc1 $f0, 0x3c($a0) # gMNBonusPanel + 60
  /* 14B70C 801356DC 8C680074 */        lw $t0, 0x74($v1)
  .L801356E0:
  /* 14B710 801356E0 3C01C170 */       lui $at, (0xC1700000 >> 16) # -15.0
  /* 14B714 801356E4 44812000 */      mtc1 $at, $f4 # -15.0 to cop1
  /* 14B718 801356E8 C512005C */      lwc1 $f18, 0x5c($t0)
  /* 14B71C 801356EC 46049180 */     add.s $f6, $f18, $f4
  /* 14B720 801356F0 E4860048 */      swc1 $f6, 0x48($a0) # gMNBonusPanel + 72
  /* 14B724 801356F4 C4800048 */      lwc1 $f0, 0x48($a0) # gMNBonusPanel + 72
  /* 14B728 801356F8 4602003C */    c.lt.s $f0, $f2
  /* 14B72C 801356FC 00000000 */       nop
  /* 14B730 80135700 45020004 */     bc1fl .L80135714
  /* 14B734 80135704 C4820040 */      lwc1 $f2, 0x40($a0) # gMNBonusPanel + 64
  /* 14B738 80135708 E4820048 */      swc1 $f2, 0x48($a0) # gMNBonusPanel + 72
  /* 14B73C 8013570C C4800048 */      lwc1 $f0, 0x48($a0) # gMNBonusPanel + 72
  /* 14B740 80135710 C4820040 */      lwc1 $f2, 0x40($a0) # gMNBonusPanel + 64
  .L80135714:
  /* 14B744 80135714 4602003C */    c.lt.s $f0, $f2
  /* 14B748 80135718 00000000 */       nop
  /* 14B74C 8013571C 45020005 */     bc1fl .L80135734
  /* 14B750 80135720 460C1281 */     sub.s $f10, $f2, $f12
  /* 14B754 80135724 460C0201 */     sub.s $f8, $f0, $f12
  /* 14B758 80135728 03E00008 */        jr $ra
  /* 14B75C 8013572C E4880044 */      swc1 $f8, 0x44($a0) # gMNBonusPanel + 68

  /* 14B760 80135730 460C1281 */     sub.s $f10, $f2, $f12
  .L80135734:
  /* 14B764 80135734 E48A0044 */      swc1 $f10, 0x44($a0)
  /* 14B768 80135738 03E00008 */        jr $ra
  /* 14B76C 8013573C 00000000 */       nop

glabel mnBonusGoBackTo1PMenu
  /* 14B770 80135740 3C0E8013 */       lui $t6, %hi(gMNBonusType)
  /* 14B774 80135744 8DCE7714 */        lw $t6, %lo(gMNBonusType)($t6)
  /* 14B778 80135748 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14B77C 8013574C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14B780 80135750 15C00006 */      bnez $t6, .L8013576C
  /* 14B784 80135754 24190008 */     addiu $t9, $zero, 8
  /* 14B788 80135758 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14B78C 8013575C 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14B790 80135760 240F0013 */     addiu $t7, $zero, 0x13
  /* 14B794 80135764 10000005 */         b .L8013577C
  /* 14B798 80135768 A04F0001 */        sb $t7, 1($v0) # gSceneData + 1
  .L8013576C:
  /* 14B79C 8013576C 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14B7A0 80135770 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14B7A4 80135774 24180014 */     addiu $t8, $zero, 0x14
  /* 14B7A8 80135778 A0580001 */        sb $t8, 1($v0) # gSceneData + 1
  .L8013577C:
  /* 14B7AC 8013577C 0C04DA66 */       jal mnBonusSaveMatchInfo
  /* 14B7B0 80135780 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 14B7B4 80135784 0C00829D */       jal func_80020A74
  /* 14B7B8 80135788 00000000 */       nop
  /* 14B7BC 8013578C 0C0099A8 */       jal func_800266A0
  /* 14B7C0 80135790 00000000 */       nop
  /* 14B7C4 80135794 0C00171D */       jal func_80005C74
  /* 14B7C8 80135798 00000000 */       nop
  /* 14B7CC 8013579C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14B7D0 801357A0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14B7D4 801357A4 03E00008 */        jr $ra
  /* 14B7D8 801357A8 00000000 */       nop

glabel mnBonusExitIfBButtonPressed
  /* 14B7DC 801357AC 3C0E8013 */       lui $t6, %hi(gMNBonusFramesElapsed)
  /* 14B7E0 801357B0 8DCE7724 */        lw $t6, %lo(gMNBonusFramesElapsed)($t6)
  /* 14B7E4 801357B4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14B7E8 801357B8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14B7EC 801357BC 29C1000A */      slti $at, $t6, 0xa
  /* 14B7F0 801357C0 1420000B */      bnez $at, .L801357F0
  /* 14B7F4 801357C4 00047880 */       sll $t7, $a0, 2
  /* 14B7F8 801357C8 01E47821 */      addu $t7, $t7, $a0
  /* 14B7FC 801357CC 000F7840 */       sll $t7, $t7, 1
  /* 14B800 801357D0 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 14B804 801357D4 030FC021 */      addu $t8, $t8, $t7
  /* 14B808 801357D8 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 14B80C 801357DC 33194000 */      andi $t9, $t8, 0x4000
  /* 14B810 801357E0 53200004 */      beql $t9, $zero, .L801357F4
  /* 14B814 801357E4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14B818 801357E8 0C04D5D0 */       jal mnBonusGoBackTo1PMenu
  /* 14B81C 801357EC 00000000 */       nop
  .L801357F0:
  /* 14B820 801357F0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801357F4:
  /* 14B824 801357F4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14B828 801357F8 03E00008 */        jr $ra
  /* 14B82C 801357FC 00000000 */       nop

glabel mnBonusCheckTitlePress
  /* 14B830 80135800 8C820074 */        lw $v0, 0x74($a0)
  /* 14B834 80135804 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 14B838 80135808 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 14B83C 8013580C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14B840 80135810 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 14B844 80135814 44814000 */      mtc1 $at, $f8 # 27.0 to cop1
  /* 14B848 80135818 46062000 */     add.s $f0, $f4, $f6
  /* 14B84C 8013581C 3C01434F */       lui $at, (0x434F0000 >> 16) # 207.0
  /* 14B850 80135820 00001825 */        or $v1, $zero, $zero
  /* 14B854 80135824 4600403E */    c.le.s $f8, $f0
  /* 14B858 80135828 00000000 */       nop
  /* 14B85C 8013582C 45000009 */      bc1f .L80135854
  /* 14B860 80135830 00000000 */       nop
  /* 14B864 80135834 44815000 */      mtc1 $at, $f10 # 207.0 to cop1
  /* 14B868 80135838 00000000 */       nop
  /* 14B86C 8013583C 460A003E */    c.le.s $f0, $f10
  /* 14B870 80135840 00000000 */       nop
  /* 14B874 80135844 45000003 */      bc1f .L80135854
  /* 14B878 80135848 00000000 */       nop
  /* 14B87C 8013584C 10000001 */         b .L80135854
  /* 14B880 80135850 24030001 */     addiu $v1, $zero, 1
  .L80135854:
  /* 14B884 80135854 10600018 */      beqz $v1, .L801358B8
  /* 14B888 80135858 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 14B88C 8013585C C450005C */      lwc1 $f16, 0x5c($v0)
  /* 14B890 80135860 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 14B894 80135864 3C014160 */       lui $at, (0x41600000 >> 16) # 14.0
  /* 14B898 80135868 44812000 */      mtc1 $at, $f4 # 14.0 to cop1
  /* 14B89C 8013586C 46128000 */     add.s $f0, $f16, $f18
  /* 14B8A0 80135870 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 14B8A4 80135874 00001825 */        or $v1, $zero, $zero
  /* 14B8A8 80135878 4600203E */    c.le.s $f4, $f0
  /* 14B8AC 8013587C 00000000 */       nop
  /* 14B8B0 80135880 45000009 */      bc1f .L801358A8
  /* 14B8B4 80135884 00000000 */       nop
  /* 14B8B8 80135888 44813000 */      mtc1 $at, $f6 # 35.0 to cop1
  /* 14B8BC 8013588C 00000000 */       nop
  /* 14B8C0 80135890 4606003E */    c.le.s $f0, $f6
  /* 14B8C4 80135894 00000000 */       nop
  /* 14B8C8 80135898 45000003 */      bc1f .L801358A8
  /* 14B8CC 8013589C 00000000 */       nop
  /* 14B8D0 801358A0 10000001 */         b .L801358A8
  /* 14B8D4 801358A4 24030001 */     addiu $v1, $zero, 1
  .L801358A8:
  /* 14B8D8 801358A8 50600004 */      beql $v1, $zero, .L801358BC
  /* 14B8DC 801358AC 00001025 */        or $v0, $zero, $zero
  /* 14B8E0 801358B0 03E00008 */        jr $ra
  /* 14B8E4 801358B4 24020001 */     addiu $v0, $zero, 1

  .L801358B8:
  /* 14B8E8 801358B8 00001025 */        or $v0, $zero, $zero
  .L801358BC:
  /* 14B8EC 801358BC 03E00008 */        jr $ra
  /* 14B8F0 801358C0 00000000 */       nop

glabel mnBonusHandleTitlePress
  /* 14B8F4 801358C4 3C028013 */       lui $v0, %hi(gMNBonusType)
  /* 14B8F8 801358C8 24427714 */     addiu $v0, $v0, %lo(gMNBonusType)
  /* 14B8FC 801358CC 8C4E0000 */        lw $t6, ($v0) # gMNBonusType + 0
  /* 14B900 801358D0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14B904 801358D4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14B908 801358D8 15C00004 */      bnez $t6, .L801358EC
  /* 14B90C 801358DC 3C048013 */       lui $a0, %hi(gMNBonusTitleGObj)
  /* 14B910 801358E0 240F0001 */     addiu $t7, $zero, 1
  /* 14B914 801358E4 10000002 */         b .L801358F0
  /* 14B918 801358E8 AC4F0000 */        sw $t7, ($v0) # gMNBonusType + 0
  .L801358EC:
  /* 14B91C 801358EC AC400000 */        sw $zero, ($v0) # gMNBonusType + 0
  .L801358F0:
  /* 14B920 801358F0 0C0026A1 */       jal omEjectGObj
  /* 14B924 801358F4 8C847718 */        lw $a0, %lo(gMNBonusTitleGObj)($a0)
  /* 14B928 801358F8 0C04CC86 */       jal mnBonusDrawTitleAndBack
  /* 14B92C 801358FC 00000000 */       nop
  /* 14B930 80135900 0C04CEF3 */       jal mnBonusDrawHighscore
  /* 14B934 80135904 00000000 */       nop
  /* 14B938 80135908 3C048013 */       lui $a0, %hi(gMNBonusTotalTimeGobj)
  /* 14B93C 8013590C 8C84771C */        lw $a0, %lo(gMNBonusTotalTimeGobj)($a0)
  /* 14B940 80135910 10800005 */      beqz $a0, .L80135928
  /* 14B944 80135914 00000000 */       nop
  /* 14B948 80135918 0C0026A1 */       jal omEjectGObj
  /* 14B94C 8013591C 00000000 */       nop
  /* 14B950 80135920 3C018013 */       lui $at, %hi(gMNBonusTotalTimeGobj)
  /* 14B954 80135924 AC20771C */        sw $zero, %lo(gMNBonusTotalTimeGobj)($at)
  .L80135928:
  /* 14B958 80135928 0C04DB22 */       jal mnBonusAreAllCompleted
  /* 14B95C 8013592C 00000000 */       nop
  /* 14B960 80135930 50400004 */      beql $v0, $zero, .L80135944
  /* 14B964 80135934 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14B968 80135938 0C04CF07 */       jal mnDrawBonusTotalTime
  /* 14B96C 8013593C 00000000 */       nop
  /* 14B970 80135940 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135944:
  /* 14B974 80135944 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14B978 80135948 03E00008 */        jr $ra
  /* 14B97C 8013594C 00000000 */       nop

glabel mnBonusHandleButtonPresses
  /* 14B980 80135950 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14B984 80135954 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14B988 80135958 AFB00018 */        sw $s0, 0x18($sp)
  /* 14B98C 8013595C 8C900084 */        lw $s0, 0x84($a0)
  /* 14B990 80135960 AFA40040 */        sw $a0, 0x40($sp)
  /* 14B994 80135964 0C04D439 */       jal mnBonusAutoPositionCursor
  /* 14B998 80135968 02002825 */        or $a1, $s0, $zero
  /* 14B99C 8013596C 00107080 */       sll $t6, $s0, 2
  /* 14B9A0 80135970 01D07021 */      addu $t6, $t6, $s0
  /* 14B9A4 80135974 3C0F8004 */       lui $t7, %hi(gPlayerControllers)
  /* 14B9A8 80135978 25EF5228 */     addiu $t7, $t7, %lo(gPlayerControllers)
  /* 14B9AC 8013597C 000E7040 */       sll $t6, $t6, 1
  /* 14B9B0 80135980 01CFC021 */      addu $t8, $t6, $t7
  /* 14B9B4 80135984 AFB80024 */        sw $t8, 0x24($sp)
  /* 14B9B8 80135988 97190002 */       lhu $t9, 2($t8)
  /* 14B9BC 8013598C 8FA40040 */        lw $a0, 0x40($sp)
  /* 14B9C0 80135990 02002825 */        or $a1, $s0, $zero
  /* 14B9C4 80135994 33288000 */      andi $t0, $t9, 0x8000
  /* 14B9C8 80135998 1100001A */      beqz $t0, .L80135A04
  /* 14B9CC 8013599C 3C068013 */       lui $a2, %hi(D_ovl29_8013769C)
  /* 14B9D0 801359A0 8CC6769C */        lw $a2, %lo(D_ovl29_8013769C)($a2)
  /* 14B9D4 801359A4 0C04D2C9 */       jal mnBonusSelectChar
  /* 14B9D8 801359A8 00003825 */        or $a3, $zero, $zero
  /* 14B9DC 801359AC 14400015 */      bnez $v0, .L80135A04
  /* 14B9E0 801359B0 8FA40040 */        lw $a0, 0x40($sp)
  /* 14B9E4 801359B4 0C04D355 */       jal mnBonusCheckAndHandleTokenPickup
  /* 14B9E8 801359B8 02002825 */        or $a1, $s0, $zero
  /* 14B9EC 801359BC 54400012 */      bnel $v0, $zero, .L80135A08
  /* 14B9F0 801359C0 8FA90024 */        lw $t1, 0x24($sp)
  /* 14B9F4 801359C4 0C04D600 */       jal mnBonusCheckTitlePress
  /* 14B9F8 801359C8 8FA40040 */        lw $a0, 0x40($sp)
  /* 14B9FC 801359CC 10400005 */      beqz $v0, .L801359E4
  /* 14BA00 801359D0 00000000 */       nop
  /* 14BA04 801359D4 0C04D631 */       jal mnBonusHandleTitlePress
  /* 14BA08 801359D8 00000000 */       nop
  /* 14BA0C 801359DC 1000000A */         b .L80135A08
  /* 14BA10 801359E0 8FA90024 */        lw $t1, 0x24($sp)
  .L801359E4:
  /* 14BA14 801359E4 0C04D161 */       jal mnBonusCheckBackButtonPress
  /* 14BA18 801359E8 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BA1C 801359EC 50400006 */      beql $v0, $zero, .L80135A08
  /* 14BA20 801359F0 8FA90024 */        lw $t1, 0x24($sp)
  /* 14BA24 801359F4 0C04D5D0 */       jal mnBonusGoBackTo1PMenu
  /* 14BA28 801359F8 00000000 */       nop
  /* 14BA2C 801359FC 0C009A70 */       jal func_800269C0
  /* 14BA30 80135A00 240400A4 */     addiu $a0, $zero, 0xa4
  .L80135A04:
  /* 14BA34 80135A04 8FA90024 */        lw $t1, 0x24($sp)
  .L80135A08:
  /* 14BA38 80135A08 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BA3C 80135A0C 02002825 */        or $a1, $s0, $zero
  /* 14BA40 80135A10 952A0002 */       lhu $t2, 2($t1)
  /* 14BA44 80135A14 3C068013 */       lui $a2, %hi(D_ovl29_8013769C)
  /* 14BA48 80135A18 00003825 */        or $a3, $zero, $zero
  /* 14BA4C 80135A1C 314B0008 */      andi $t3, $t2, 8
  /* 14BA50 80135A20 5160000C */      beql $t3, $zero, .L80135A54
  /* 14BA54 80135A24 8FAD0024 */        lw $t5, 0x24($sp)
  /* 14BA58 80135A28 0C04D2C9 */       jal mnBonusSelectChar
  /* 14BA5C 80135A2C 8CC6769C */        lw $a2, %lo(D_ovl29_8013769C)($a2)
  /* 14BA60 80135A30 14400007 */      bnez $v0, .L80135A50
  /* 14BA64 80135A34 3C0C8013 */       lui $t4, %hi(D_ovl29_801376A0)
  /* 14BA68 80135A38 8D8C76A0 */        lw $t4, %lo(D_ovl29_801376A0)($t4)
  /* 14BA6C 80135A3C 02002025 */        or $a0, $s0, $zero
  /* 14BA70 80135A40 51800004 */      beql $t4, $zero, .L80135A54
  /* 14BA74 80135A44 8FAD0024 */        lw $t5, 0x24($sp)
  /* 14BA78 80135A48 0C04D578 */       jal mnBonusSyncShadeAndCostume
  /* 14BA7C 80135A4C 00002825 */        or $a1, $zero, $zero
  .L80135A50:
  /* 14BA80 80135A50 8FAD0024 */        lw $t5, 0x24($sp)
  .L80135A54:
  /* 14BA84 80135A54 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BA88 80135A58 02002825 */        or $a1, $s0, $zero
  /* 14BA8C 80135A5C 95AE0002 */       lhu $t6, 2($t5)
  /* 14BA90 80135A60 3C068013 */       lui $a2, %hi(D_ovl29_8013769C)
  /* 14BA94 80135A64 24070001 */     addiu $a3, $zero, 1
  /* 14BA98 80135A68 31CF0001 */      andi $t7, $t6, 1
  /* 14BA9C 80135A6C 51E0000C */      beql $t7, $zero, .L80135AA0
  /* 14BAA0 80135A70 8FB90024 */        lw $t9, 0x24($sp)
  /* 14BAA4 80135A74 0C04D2C9 */       jal mnBonusSelectChar
  /* 14BAA8 80135A78 8CC6769C */        lw $a2, %lo(D_ovl29_8013769C)($a2)
  /* 14BAAC 80135A7C 14400007 */      bnez $v0, .L80135A9C
  /* 14BAB0 80135A80 3C188013 */       lui $t8, %hi(D_ovl29_801376A0)
  /* 14BAB4 80135A84 8F1876A0 */        lw $t8, %lo(D_ovl29_801376A0)($t8)
  /* 14BAB8 80135A88 02002025 */        or $a0, $s0, $zero
  /* 14BABC 80135A8C 53000004 */      beql $t8, $zero, .L80135AA0
  /* 14BAC0 80135A90 8FB90024 */        lw $t9, 0x24($sp)
  /* 14BAC4 80135A94 0C04D578 */       jal mnBonusSyncShadeAndCostume
  /* 14BAC8 80135A98 24050001 */     addiu $a1, $zero, 1
  .L80135A9C:
  /* 14BACC 80135A9C 8FB90024 */        lw $t9, 0x24($sp)
  .L80135AA0:
  /* 14BAD0 80135AA0 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BAD4 80135AA4 02002825 */        or $a1, $s0, $zero
  /* 14BAD8 80135AA8 97280002 */       lhu $t0, 2($t9)
  /* 14BADC 80135AAC 3C068013 */       lui $a2, %hi(D_ovl29_8013769C)
  /* 14BAE0 80135AB0 24070002 */     addiu $a3, $zero, 2
  /* 14BAE4 80135AB4 31090004 */      andi $t1, $t0, 4
  /* 14BAE8 80135AB8 5120000C */      beql $t1, $zero, .L80135AEC
  /* 14BAEC 80135ABC 8FAB0024 */        lw $t3, 0x24($sp)
  /* 14BAF0 80135AC0 0C04D2C9 */       jal mnBonusSelectChar
  /* 14BAF4 80135AC4 8CC6769C */        lw $a2, %lo(D_ovl29_8013769C)($a2)
  /* 14BAF8 80135AC8 14400007 */      bnez $v0, .L80135AE8
  /* 14BAFC 80135ACC 3C0A8013 */       lui $t2, %hi(D_ovl29_801376A0)
  /* 14BB00 80135AD0 8D4A76A0 */        lw $t2, %lo(D_ovl29_801376A0)($t2)
  /* 14BB04 80135AD4 02002025 */        or $a0, $s0, $zero
  /* 14BB08 80135AD8 51400004 */      beql $t2, $zero, .L80135AEC
  /* 14BB0C 80135ADC 8FAB0024 */        lw $t3, 0x24($sp)
  /* 14BB10 80135AE0 0C04D578 */       jal mnBonusSyncShadeAndCostume
  /* 14BB14 80135AE4 24050002 */     addiu $a1, $zero, 2
  .L80135AE8:
  /* 14BB18 80135AE8 8FAB0024 */        lw $t3, 0x24($sp)
  .L80135AEC:
  /* 14BB1C 80135AEC 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BB20 80135AF0 02002825 */        or $a1, $s0, $zero
  /* 14BB24 80135AF4 956C0002 */       lhu $t4, 2($t3)
  /* 14BB28 80135AF8 3C068013 */       lui $a2, %hi(D_ovl29_8013769C)
  /* 14BB2C 80135AFC 24070003 */     addiu $a3, $zero, 3
  /* 14BB30 80135B00 318D0002 */      andi $t5, $t4, 2
  /* 14BB34 80135B04 51A0000C */      beql $t5, $zero, .L80135B38
  /* 14BB38 80135B08 8FAF0024 */        lw $t7, 0x24($sp)
  /* 14BB3C 80135B0C 0C04D2C9 */       jal mnBonusSelectChar
  /* 14BB40 80135B10 8CC6769C */        lw $a2, %lo(D_ovl29_8013769C)($a2)
  /* 14BB44 80135B14 14400007 */      bnez $v0, .L80135B34
  /* 14BB48 80135B18 3C0E8013 */       lui $t6, %hi(D_ovl29_801376A0)
  /* 14BB4C 80135B1C 8DCE76A0 */        lw $t6, %lo(D_ovl29_801376A0)($t6)
  /* 14BB50 80135B20 02002025 */        or $a0, $s0, $zero
  /* 14BB54 80135B24 51C00004 */      beql $t6, $zero, .L80135B38
  /* 14BB58 80135B28 8FAF0024 */        lw $t7, 0x24($sp)
  /* 14BB5C 80135B2C 0C04D578 */       jal mnBonusSyncShadeAndCostume
  /* 14BB60 80135B30 24050003 */     addiu $a1, $zero, 3
  .L80135B34:
  /* 14BB64 80135B34 8FAF0024 */        lw $t7, 0x24($sp)
  .L80135B38:
  /* 14BB68 80135B38 95F80002 */       lhu $t8, 2($t7)
  /* 14BB6C 80135B3C 33194000 */      andi $t9, $t8, 0x4000
  /* 14BB70 80135B40 13200007 */      beqz $t9, .L80135B60
  /* 14BB74 80135B44 00000000 */       nop
  /* 14BB78 80135B48 0C04D58D */       jal mnBonusIsHumanWithCharacterSelected
  /* 14BB7C 80135B4C 02002025 */        or $a0, $s0, $zero
  /* 14BB80 80135B50 10400003 */      beqz $v0, .L80135B60
  /* 14BB84 80135B54 00000000 */       nop
  /* 14BB88 80135B58 0C04D597 */       jal mnBonusRecallToken
  /* 14BB8C 80135B5C 02002025 */        or $a0, $s0, $zero
  .L80135B60:
  /* 14BB90 80135B60 3C028013 */       lui $v0, %hi(D_ovl29_80137678)
  /* 14BB94 80135B64 8C427678 */        lw $v0, %lo(D_ovl29_80137678)($v0)
  /* 14BB98 80135B68 14400005 */      bnez $v0, .L80135B80
  /* 14BB9C 80135B6C 00000000 */       nop
  /* 14BBA0 80135B70 0C04D5EB */       jal mnBonusExitIfBButtonPressed
  /* 14BBA4 80135B74 02002025 */        or $a0, $s0, $zero
  /* 14BBA8 80135B78 3C028013 */       lui $v0, %hi(D_ovl29_80137678)
  /* 14BBAC 80135B7C 8C427678 */        lw $v0, %lo(D_ovl29_80137678)($v0)
  .L80135B80:
  /* 14BBB0 80135B80 14400003 */      bnez $v0, .L80135B90
  /* 14BBB4 80135B84 8FA40040 */        lw $a0, 0x40($sp)
  /* 14BBB8 80135B88 0C04D517 */       jal mnBonusSyncCursorDisplay
  /* 14BBBC 80135B8C 02002825 */        or $a1, $s0, $zero
  .L80135B90:
  /* 14BBC0 80135B90 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14BBC4 80135B94 8FB00018 */        lw $s0, 0x18($sp)
  /* 14BBC8 80135B98 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14BBCC 80135B9C 03E00008 */        jr $ra
  /* 14BBD0 80135BA0 00000000 */       nop

  /* 14BBD4 80135BA4 03E00008 */        jr $ra
  /* 14BBD8 80135BA8 00000000 */       nop

  /* 14BBDC 80135BAC 03E00008 */        jr $ra
  /* 14BBE0 80135BB0 00000000 */       nop

glabel mnBonusMoveToken
  /* 14BBE4 80135BB4 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14BBE8 80135BB8 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14BBEC 80135BBC 8C6E0004 */        lw $t6, 4($v1) # gMNBonusPanel + 4
  /* 14BBF0 80135BC0 AFA40000 */        sw $a0, ($sp)
  /* 14BBF4 80135BC4 C4660060 */      lwc1 $f6, 0x60($v1) # gMNBonusPanel + 96
  /* 14BBF8 80135BC8 8DC20074 */        lw $v0, 0x74($t6)
  /* 14BBFC 80135BCC C4440058 */      lwc1 $f4, 0x58($v0)
  /* 14BC00 80135BD0 46062200 */     add.s $f8, $f4, $f6
  /* 14BC04 80135BD4 E4480058 */      swc1 $f8, 0x58($v0)
  /* 14BC08 80135BD8 8C6F0004 */        lw $t7, 4($v1) # gMNBonusPanel + 4
  /* 14BC0C 80135BDC C4700064 */      lwc1 $f16, 0x64($v1) # gMNBonusPanel + 100
  /* 14BC10 80135BE0 8DE20074 */        lw $v0, 0x74($t7)
  /* 14BC14 80135BE4 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 14BC18 80135BE8 46105480 */     add.s $f18, $f10, $f16
  /* 14BC1C 80135BEC 03E00008 */        jr $ra
  /* 14BC20 80135BF0 E452005C */      swc1 $f18, 0x5c($v0)

glabel mnBonusSyncTokenAndFighter
  /* 14BC24 80135BF4 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14BC28 80135BF8 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14BC2C 80135BFC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14BC30 80135C00 8C6F0028 */        lw $t7, 0x28($v1) # gMNBonusPanel + 40
  /* 14BC34 80135C04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14BC38 80135C08 8C8E0084 */        lw $t6, 0x84($a0)
  /* 14BC3C 80135C0C 15E00009 */      bnez $t7, .L80135C34
  /* 14BC40 80135C10 AFAE0018 */        sw $t6, 0x18($sp)
  /* 14BC44 80135C14 8C78002C */        lw $t8, 0x2c($v1) # gMNBonusPanel + 44
  /* 14BC48 80135C18 24020001 */     addiu $v0, $zero, 1
  /* 14BC4C 80135C1C 10580005 */       beq $v0, $t8, .L80135C34
  /* 14BC50 80135C20 00000000 */       nop
  /* 14BC54 80135C24 8C790030 */        lw $t9, 0x30($v1) # gMNBonusPanel + 48
  /* 14BC58 80135C28 24080001 */     addiu $t0, $zero, 1
  /* 14BC5C 80135C2C 54590004 */      bnel $v0, $t9, .L80135C40
  /* 14BC60 80135C30 AC88007C */        sw $t0, 0x7c($a0)
  .L80135C34:
  /* 14BC64 80135C34 10000002 */         b .L80135C40
  /* 14BC68 80135C38 AC80007C */        sw $zero, 0x7c($a0)
  /* 14BC6C 80135C3C AC88007C */        sw $t0, 0x7c($a0)
  .L80135C40:
  /* 14BC70 80135C40 8C69002C */        lw $t1, 0x2c($v1) # gMNBonusPanel + 44
  /* 14BC74 80135C44 15200019 */      bnez $t1, .L80135CAC
  /* 14BC78 80135C48 00000000 */       nop
  /* 14BC7C 80135C4C 8C6A0050 */        lw $t2, 0x50($v1) # gMNBonusPanel + 80
  /* 14BC80 80135C50 24010004 */     addiu $at, $zero, 4
  /* 14BC84 80135C54 11410015 */       beq $t2, $at, .L80135CAC
  /* 14BC88 80135C58 00000000 */       nop
  /* 14BC8C 80135C5C 8C6B0070 */        lw $t3, 0x70($v1) # gMNBonusPanel + 112
  /* 14BC90 80135C60 15600014 */      bnez $t3, .L80135CB4
  /* 14BC94 80135C64 00000000 */       nop
  /* 14BC98 80135C68 8C6C0000 */        lw $t4, ($v1) # gMNBonusPanel + 0
  /* 14BC9C 80135C6C 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 14BCA0 80135C70 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 14BCA4 80135C74 8D8D0074 */        lw $t5, 0x74($t4)
  /* 14BCA8 80135C78 8C8E0074 */        lw $t6, 0x74($a0)
  /* 14BCAC 80135C7C 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 14BCB0 80135C80 C5A40058 */      lwc1 $f4, 0x58($t5)
  /* 14BCB4 80135C84 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 14BCB8 80135C88 46062200 */     add.s $f8, $f4, $f6
  /* 14BCBC 80135C8C E5C80058 */      swc1 $f8, 0x58($t6)
  /* 14BCC0 80135C90 8C6F0000 */        lw $t7, ($v1) # gMNBonusPanel + 0
  /* 14BCC4 80135C94 8C990074 */        lw $t9, 0x74($a0)
  /* 14BCC8 80135C98 8DF80074 */        lw $t8, 0x74($t7)
  /* 14BCCC 80135C9C C70A005C */      lwc1 $f10, 0x5c($t8)
  /* 14BCD0 80135CA0 46105480 */     add.s $f18, $f10, $f16
  /* 14BCD4 80135CA4 10000003 */         b .L80135CB4
  /* 14BCD8 80135CA8 E732005C */      swc1 $f18, 0x5c($t9)
  .L80135CAC:
  /* 14BCDC 80135CAC 0C04D6ED */       jal mnBonusMoveToken
  /* 14BCE0 80135CB0 8FA40018 */        lw $a0, 0x18($sp)
  .L80135CB4:
  /* 14BCE4 80135CB4 0C04D3DB */       jal mnBonusGetFtKindFromTokenPosition
  /* 14BCE8 80135CB8 8FA40018 */        lw $a0, 0x18($sp)
  /* 14BCEC 80135CBC 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14BCF0 80135CC0 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14BCF4 80135CC4 8C68002C */        lw $t0, 0x2c($v1) # gMNBonusPanel + 44
  /* 14BCF8 80135CC8 15000009 */      bnez $t0, .L80135CF0
  /* 14BCFC 80135CCC 00000000 */       nop
  /* 14BD00 80135CD0 8C690020 */        lw $t1, 0x20($v1) # gMNBonusPanel + 32
  /* 14BD04 80135CD4 10490006 */       beq $v0, $t1, .L80135CF0
  /* 14BD08 80135CD8 00000000 */       nop
  /* 14BD0C 80135CDC AC620020 */        sw $v0, 0x20($v1) # gMNBonusPanel + 32
  /* 14BD10 80135CE0 0C04D1DB */       jal mnBonusSyncFighterDisplay
  /* 14BD14 80135CE4 8FA40018 */        lw $a0, 0x18($sp)
  /* 14BD18 80135CE8 0C04D1FE */       jal mnBonusSyncNameAndLogo
  /* 14BD1C 80135CEC 8FA40018 */        lw $a0, 0x18($sp)
  .L80135CF0:
  /* 14BD20 80135CF0 0C04CEF3 */       jal mnBonusDrawHighscore
  /* 14BD24 80135CF4 00000000 */       nop
  /* 14BD28 80135CF8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14BD2C 80135CFC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 14BD30 80135D00 03E00008 */        jr $ra
  /* 14BD34 80135D04 00000000 */       nop

glabel mnBonusCreateReadyToFightViewport
  /* 14BD38 80135D08 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14BD3C 80135D0C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 14BD40 80135D10 AFBF003C */        sw $ra, 0x3c($sp)
  /* 14BD44 80135D14 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 14BD48 80135D18 240F000A */     addiu $t7, $zero, 0xa
  /* 14BD4C 80135D1C 24180008 */     addiu $t8, $zero, 8
  /* 14BD50 80135D20 24190000 */     addiu $t9, $zero, 0
  /* 14BD54 80135D24 2408FFFF */     addiu $t0, $zero, -1
  /* 14BD58 80135D28 24090001 */     addiu $t1, $zero, 1
  /* 14BD5C 80135D2C 240A0001 */     addiu $t2, $zero, 1
  /* 14BD60 80135D30 AFAA0030 */        sw $t2, 0x30($sp)
  /* 14BD64 80135D34 AFA90028 */        sw $t1, 0x28($sp)
  /* 14BD68 80135D38 AFA80020 */        sw $t0, 0x20($sp)
  /* 14BD6C 80135D3C AFB9001C */        sw $t9, 0x1c($sp)
  /* 14BD70 80135D40 AFB80018 */        sw $t8, 0x18($sp)
  /* 14BD74 80135D44 AFAF0014 */        sw $t7, 0x14($sp)
  /* 14BD78 80135D48 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14BD7C 80135D4C AFA00024 */        sw $zero, 0x24($sp)
  /* 14BD80 80135D50 AFA0002C */        sw $zero, 0x2c($sp)
  /* 14BD84 80135D54 AFA00034 */        sw $zero, 0x34($sp)
  /* 14BD88 80135D58 24040401 */     addiu $a0, $zero, 0x401
  /* 14BD8C 80135D5C 00002825 */        or $a1, $zero, $zero
  /* 14BD90 80135D60 24060010 */     addiu $a2, $zero, 0x10
  /* 14BD94 80135D64 0C002E4F */       jal func_8000B93C
  /* 14BD98 80135D68 3C078000 */       lui $a3, 0x8000
  /* 14BD9C 80135D6C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14BDA0 80135D70 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14BDA4 80135D74 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 14BDA8 80135D78 8C430074 */        lw $v1, 0x74($v0)
  /* 14BDAC 80135D7C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14BDB0 80135D80 44050000 */      mfc1 $a1, $f0
  /* 14BDB4 80135D84 44060000 */      mfc1 $a2, $f0
  /* 14BDB8 80135D88 3C07439B */       lui $a3, 0x439b
  /* 14BDBC 80135D8C 24640008 */     addiu $a0, $v1, 8
  /* 14BDC0 80135D90 0C001C20 */       jal func_80007080
  /* 14BDC4 80135D94 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 14BDC8 80135D98 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14BDCC 80135D9C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14BDD0 80135DA0 03E00008 */        jr $ra
  /* 14BDD4 80135DA4 00000000 */       nop

glabel mnBonusCreateCursorViewport
  /* 14BDD8 80135DA8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14BDDC 80135DAC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 14BDE0 80135DB0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 14BDE4 80135DB4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 14BDE8 80135DB8 240F000D */     addiu $t7, $zero, 0xd
  /* 14BDEC 80135DBC 24180000 */     addiu $t8, $zero, 0
  /* 14BDF0 80135DC0 3C194000 */       lui $t9, 0x4000
  /* 14BDF4 80135DC4 2408FFFF */     addiu $t0, $zero, -1
  /* 14BDF8 80135DC8 24090001 */     addiu $t1, $zero, 1
  /* 14BDFC 80135DCC 240A0001 */     addiu $t2, $zero, 1
  /* 14BE00 80135DD0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 14BE04 80135DD4 AFA90028 */        sw $t1, 0x28($sp)
  /* 14BE08 80135DD8 AFA80020 */        sw $t0, 0x20($sp)
  /* 14BE0C 80135DDC AFB9001C */        sw $t9, 0x1c($sp)
  /* 14BE10 80135DE0 AFB80018 */        sw $t8, 0x18($sp)
  /* 14BE14 80135DE4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 14BE18 80135DE8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14BE1C 80135DEC AFA00024 */        sw $zero, 0x24($sp)
  /* 14BE20 80135DF0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 14BE24 80135DF4 AFA00034 */        sw $zero, 0x34($sp)
  /* 14BE28 80135DF8 24040401 */     addiu $a0, $zero, 0x401
  /* 14BE2C 80135DFC 00002825 */        or $a1, $zero, $zero
  /* 14BE30 80135E00 24060010 */     addiu $a2, $zero, 0x10
  /* 14BE34 80135E04 0C002E4F */       jal func_8000B93C
  /* 14BE38 80135E08 3C078000 */       lui $a3, 0x8000
  /* 14BE3C 80135E0C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14BE40 80135E10 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14BE44 80135E14 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 14BE48 80135E18 8C430074 */        lw $v1, 0x74($v0)
  /* 14BE4C 80135E1C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14BE50 80135E20 44050000 */      mfc1 $a1, $f0
  /* 14BE54 80135E24 44060000 */      mfc1 $a2, $f0
  /* 14BE58 80135E28 3C07439B */       lui $a3, 0x439b
  /* 14BE5C 80135E2C 24640008 */     addiu $a0, $v1, 8
  /* 14BE60 80135E30 0C001C20 */       jal func_80007080
  /* 14BE64 80135E34 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 14BE68 80135E38 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14BE6C 80135E3C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14BE70 80135E40 03E00008 */        jr $ra
  /* 14BE74 80135E44 00000000 */       nop

glabel mnBonusCreateDroppedTokenViewport
  /* 14BE78 80135E48 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14BE7C 80135E4C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 14BE80 80135E50 AFBF003C */        sw $ra, 0x3c($sp)
  /* 14BE84 80135E54 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 14BE88 80135E58 240F000F */     addiu $t7, $zero, 0xf
  /* 14BE8C 80135E5C 24180000 */     addiu $t8, $zero, 0
  /* 14BE90 80135E60 3C198000 */       lui $t9, 0x8000
  /* 14BE94 80135E64 2408FFFF */     addiu $t0, $zero, -1
  /* 14BE98 80135E68 24090001 */     addiu $t1, $zero, 1
  /* 14BE9C 80135E6C 240A0001 */     addiu $t2, $zero, 1
  /* 14BEA0 80135E70 AFAA0030 */        sw $t2, 0x30($sp)
  /* 14BEA4 80135E74 AFA90028 */        sw $t1, 0x28($sp)
  /* 14BEA8 80135E78 AFA80020 */        sw $t0, 0x20($sp)
  /* 14BEAC 80135E7C AFB9001C */        sw $t9, 0x1c($sp)
  /* 14BEB0 80135E80 AFB80018 */        sw $t8, 0x18($sp)
  /* 14BEB4 80135E84 AFAF0014 */        sw $t7, 0x14($sp)
  /* 14BEB8 80135E88 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14BEBC 80135E8C AFA00024 */        sw $zero, 0x24($sp)
  /* 14BEC0 80135E90 AFA0002C */        sw $zero, 0x2c($sp)
  /* 14BEC4 80135E94 AFA00034 */        sw $zero, 0x34($sp)
  /* 14BEC8 80135E98 24040401 */     addiu $a0, $zero, 0x401
  /* 14BECC 80135E9C 00002825 */        or $a1, $zero, $zero
  /* 14BED0 80135EA0 24060010 */     addiu $a2, $zero, 0x10
  /* 14BED4 80135EA4 0C002E4F */       jal func_8000B93C
  /* 14BED8 80135EA8 3C078000 */       lui $a3, 0x8000
  /* 14BEDC 80135EAC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14BEE0 80135EB0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 14BEE4 80135EB4 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 14BEE8 80135EB8 8C430074 */        lw $v1, 0x74($v0)
  /* 14BEEC 80135EBC 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14BEF0 80135EC0 44050000 */      mfc1 $a1, $f0
  /* 14BEF4 80135EC4 44060000 */      mfc1 $a2, $f0
  /* 14BEF8 80135EC8 3C07439B */       lui $a3, 0x439b
  /* 14BEFC 80135ECC 24640008 */     addiu $a0, $v1, 8
  /* 14BF00 80135ED0 0C001C20 */       jal func_80007080
  /* 14BF04 80135ED4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 14BF08 80135ED8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14BF0C 80135EDC 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14BF10 80135EE0 03E00008 */        jr $ra
  /* 14BF14 80135EE4 00000000 */       nop

glabel mnBonusCreateCursor
  /* 14BF18 80135EE8 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 14BF1C 80135EEC 3C0F8013 */       lui $t7, %hi(dMNBonusCursorTypeOffsetsUnused)
  /* 14BF20 80135EF0 AFBF0034 */        sw $ra, 0x34($sp)
  /* 14BF24 80135EF4 AFA40060 */        sw $a0, 0x60($sp)
  /* 14BF28 80135EF8 25EF74C0 */     addiu $t7, $t7, %lo(dMNBonusCursorTypeOffsetsUnused)
  /* 14BF2C 80135EFC 8DF90000 */        lw $t9, ($t7) # dMNBonusCursorTypeOffsetsUnused + 0
  /* 14BF30 80135F00 8DF80004 */        lw $t8, 4($t7) # dMNBonusCursorTypeOffsetsUnused + 4
  /* 14BF34 80135F04 27AE0048 */     addiu $t6, $sp, 0x48
  /* 14BF38 80135F08 ADD90000 */        sw $t9, ($t6)
  /* 14BF3C 80135F0C ADD80004 */        sw $t8, 4($t6)
  /* 14BF40 80135F10 8DF8000C */        lw $t8, 0xc($t7) # dMNBonusCursorTypeOffsetsUnused + 12
  /* 14BF44 80135F14 8DF90008 */        lw $t9, 8($t7) # dMNBonusCursorTypeOffsetsUnused + 8
  /* 14BF48 80135F18 3C088013 */       lui $t0, %hi(dMNBonusCursorStartingDisplayOrders)
  /* 14BF4C 80135F1C 250874D0 */     addiu $t0, $t0, %lo(dMNBonusCursorStartingDisplayOrders)
  /* 14BF50 80135F20 ADD8000C */        sw $t8, 0xc($t6)
  /* 14BF54 80135F24 ADD90008 */        sw $t9, 8($t6)
  /* 14BF58 80135F28 8D0A0000 */        lw $t2, ($t0) # dMNBonusCursorStartingDisplayOrders + 0
  /* 14BF5C 80135F2C 27A20038 */     addiu $v0, $sp, 0x38
  /* 14BF60 80135F30 3C0B800D */       lui $t3, %hi(func_ovl0_800CCF00)
  /* 14BF64 80135F34 AC4A0000 */        sw $t2, ($v0)
  /* 14BF68 80135F38 8D090004 */        lw $t1, 4($t0) # dMNBonusCursorStartingDisplayOrders + 4
  /* 14BF6C 80135F3C 256BCF00 */     addiu $t3, $t3, %lo(func_ovl0_800CCF00)
  /* 14BF70 80135F40 240C001E */     addiu $t4, $zero, 0x1e
  /* 14BF74 80135F44 AC490004 */        sw $t1, 4($v0)
  /* 14BF78 80135F48 8D0A0008 */        lw $t2, 8($t0) # dMNBonusCursorStartingDisplayOrders + 8
  /* 14BF7C 80135F4C 2419FFFF */     addiu $t9, $zero, -1
  /* 14BF80 80135F50 00002025 */        or $a0, $zero, $zero
  /* 14BF84 80135F54 AC4A0008 */        sw $t2, 8($v0)
  /* 14BF88 80135F58 8D09000C */        lw $t1, 0xc($t0) # dMNBonusCursorStartingDisplayOrders + 12
  /* 14BF8C 80135F5C 3C088013 */       lui $t0, %hi(D_ovl29_80137DF8)
  /* 14BF90 80135F60 00002825 */        or $a1, $zero, $zero
  /* 14BF94 80135F64 AC49000C */        sw $t1, 0xc($v0)
  /* 14BF98 80135F68 8FAD0060 */        lw $t5, 0x60($sp)
  /* 14BF9C 80135F6C AFAC0014 */        sw $t4, 0x14($sp)
  /* 14BFA0 80135F70 AFAB0010 */        sw $t3, 0x10($sp)
  /* 14BFA4 80135F74 000D7080 */       sll $t6, $t5, 2
  /* 14BFA8 80135F78 004E7821 */      addu $t7, $v0, $t6
  /* 14BFAC 80135F7C 8DF80000 */        lw $t8, ($t7) # dMNBonusCursorTypeOffsetsUnused + 0
  /* 14BFB0 80135F80 8D087DF8 */        lw $t0, %lo(D_ovl29_80137DF8)($t0)
  /* 14BFB4 80135F84 3C090000 */       lui $t1, %hi(D_NF_000076E8)
  /* 14BFB8 80135F88 252976E8 */     addiu $t1, $t1, %lo(D_NF_000076E8)
  /* 14BFBC 80135F8C 3C0C8013 */       lui $t4, %hi(mnBonusHandleButtonPresses)
  /* 14BFC0 80135F90 258C5950 */     addiu $t4, $t4, %lo(mnBonusHandleButtonPresses)
  /* 14BFC4 80135F94 240D0002 */     addiu $t5, $zero, 2
  /* 14BFC8 80135F98 240B0001 */     addiu $t3, $zero, 1
  /* 14BFCC 80135F9C 01095021 */      addu $t2, $t0, $t1
  /* 14BFD0 80135FA0 AFAA0020 */        sw $t2, 0x20($sp)
  /* 14BFD4 80135FA4 AFAB0024 */        sw $t3, 0x24($sp)
  /* 14BFD8 80135FA8 AFAD002C */        sw $t5, 0x2c($sp)
  /* 14BFDC 80135FAC AFAC0028 */        sw $t4, 0x28($sp)
  /* 14BFE0 80135FB0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 14BFE4 80135FB4 24060013 */     addiu $a2, $zero, 0x13
  /* 14BFE8 80135FB8 3C078000 */       lui $a3, 0x8000
  /* 14BFEC 80135FBC 0C033414 */       jal func_ovl0_800CD050
  /* 14BFF0 80135FC0 AFB80018 */        sw $t8, 0x18($sp)
  /* 14BFF4 80135FC4 8FA50060 */        lw $a1, 0x60($sp)
  /* 14BFF8 80135FC8 3C018013 */       lui $at, %hi(gMNBonusPanel)
  /* 14BFFC 80135FCC 00402025 */        or $a0, $v0, $zero
  /* 14C000 80135FD0 AC450084 */        sw $a1, 0x84($v0)
  /* 14C004 80135FD4 AC227648 */        sw $v0, %lo(gMNBonusPanel)($at)
  /* 14C008 80135FD8 3C0142A0 */       lui $at, (0x42A00000 >> 16) # 80.0
  /* 14C00C 80135FDC 44812000 */      mtc1 $at, $f4 # 80.0 to cop1
  /* 14C010 80135FE0 8C4E0074 */        lw $t6, 0x74($v0)
  /* 14C014 80135FE4 3C01432A */       lui $at, (0x432A0000 >> 16) # 170.0
  /* 14C018 80135FE8 44813000 */      mtc1 $at, $f6 # 170.0 to cop1
  /* 14C01C 80135FEC E5C40058 */      swc1 $f4, 0x58($t6)
  /* 14C020 80135FF0 8C4F0074 */        lw $t7, 0x74($v0)
  /* 14C024 80135FF4 00003025 */        or $a2, $zero, $zero
  /* 14C028 80135FF8 E5E6005C */      swc1 $f6, 0x5c($t7)
  /* 14C02C 80135FFC 8C430074 */        lw $v1, 0x74($v0)
  /* 14C030 80136000 94780024 */       lhu $t8, 0x24($v1)
  /* 14C034 80136004 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 14C038 80136008 A4790024 */        sh $t9, 0x24($v1)
  /* 14C03C 8013600C 8C430074 */        lw $v1, 0x74($v0)
  /* 14C040 80136010 94680024 */       lhu $t0, 0x24($v1)
  /* 14C044 80136014 35090001 */       ori $t1, $t0, 1
  /* 14C048 80136018 0C04D0D9 */       jal mnBonusRedrawCursor
  /* 14C04C 8013601C A4690024 */        sh $t1, 0x24($v1)
  /* 14C050 80136020 8FBF0034 */        lw $ra, 0x34($sp)
  /* 14C054 80136024 3C018013 */       lui $at, %hi(D_ovl29_80137674)
  /* 14C058 80136028 AC207674 */        sw $zero, %lo(D_ovl29_80137674)($at)
  /* 14C05C 8013602C 03E00008 */        jr $ra
  /* 14C060 80136030 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnBonusCreateToken
  /* 14C064 80136034 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 14C068 80136038 3C0E8013 */       lui $t6, %hi(dMNBonusTokenOffsetsNoCPU)
  /* 14C06C 8013603C AFBF0034 */        sw $ra, 0x34($sp)
  /* 14C070 80136040 AFA40068 */        sw $a0, 0x68($sp)
  /* 14C074 80136044 25CE74E0 */     addiu $t6, $t6, %lo(dMNBonusTokenOffsetsNoCPU)
  /* 14C078 80136048 8DD80000 */        lw $t8, ($t6) # dMNBonusTokenOffsetsNoCPU + 0
  /* 14C07C 8013604C 27A20050 */     addiu $v0, $sp, 0x50
  /* 14C080 80136050 3C198013 */       lui $t9, %hi(dMNBonusTokenStartingDisplayOrders)
  /* 14C084 80136054 AC580000 */        sw $t8, ($v0)
  /* 14C088 80136058 8DCF0004 */        lw $t7, 4($t6) # dMNBonusTokenOffsetsNoCPU + 4
  /* 14C08C 8013605C 273974F0 */     addiu $t9, $t9, %lo(dMNBonusTokenStartingDisplayOrders)
  /* 14C090 80136060 27A30040 */     addiu $v1, $sp, 0x40
  /* 14C094 80136064 AC4F0004 */        sw $t7, 4($v0)
  /* 14C098 80136068 8DD80008 */        lw $t8, 8($t6) # dMNBonusTokenOffsetsNoCPU + 8
  /* 14C09C 8013606C 3C0B800D */       lui $t3, %hi(func_ovl0_800CCF00)
  /* 14C0A0 80136070 256BCF00 */     addiu $t3, $t3, %lo(func_ovl0_800CCF00)
  /* 14C0A4 80136074 AC580008 */        sw $t8, 8($v0)
  /* 14C0A8 80136078 8DCF000C */        lw $t7, 0xc($t6) # dMNBonusTokenOffsetsNoCPU + 12
  /* 14C0AC 8013607C 240C001F */     addiu $t4, $zero, 0x1f
  /* 14C0B0 80136080 00002025 */        or $a0, $zero, $zero
  /* 14C0B4 80136084 AC4F000C */        sw $t7, 0xc($v0)
  /* 14C0B8 80136088 8F2A0000 */        lw $t2, ($t9) # dMNBonusTokenStartingDisplayOrders + 0
  /* 14C0BC 8013608C 240FFFFF */     addiu $t7, $zero, -1
  /* 14C0C0 80136090 00002825 */        or $a1, $zero, $zero
  /* 14C0C4 80136094 AC6A0000 */        sw $t2, ($v1)
  /* 14C0C8 80136098 8F290004 */        lw $t1, 4($t9) # dMNBonusTokenStartingDisplayOrders + 4
  /* 14C0CC 8013609C 24060014 */     addiu $a2, $zero, 0x14
  /* 14C0D0 801360A0 3C078000 */       lui $a3, 0x8000
  /* 14C0D4 801360A4 AC690004 */        sw $t1, 4($v1)
  /* 14C0D8 801360A8 8F2A0008 */        lw $t2, 8($t9) # dMNBonusTokenStartingDisplayOrders + 8
  /* 14C0DC 801360AC AC6A0008 */        sw $t2, 8($v1)
  /* 14C0E0 801360B0 8F29000C */        lw $t1, 0xc($t9) # dMNBonusTokenStartingDisplayOrders + 12
  /* 14C0E4 801360B4 AC69000C */        sw $t1, 0xc($v1)
  /* 14C0E8 801360B8 8FA80068 */        lw $t0, 0x68($sp)
  /* 14C0EC 801360BC AFAC0014 */        sw $t4, 0x14($sp)
  /* 14C0F0 801360C0 AFAB0010 */        sw $t3, 0x10($sp)
  /* 14C0F4 801360C4 00084080 */       sll $t0, $t0, 2
  /* 14C0F8 801360C8 00686821 */      addu $t5, $v1, $t0
  /* 14C0FC 801360CC 8DAE0000 */        lw $t6, ($t5)
  /* 14C100 801360D0 AFAF001C */        sw $t7, 0x1c($sp)
  /* 14C104 801360D4 0048C021 */      addu $t8, $v0, $t0
  /* 14C108 801360D8 AFAE0018 */        sw $t6, 0x18($sp)
  /* 14C10C 801360DC 8F190000 */        lw $t9, ($t8)
  /* 14C110 801360E0 3C098013 */       lui $t1, %hi(D_ovl29_80137DF8)
  /* 14C114 801360E4 8D297DF8 */        lw $t1, %lo(D_ovl29_80137DF8)($t1)
  /* 14C118 801360E8 3C0C8013 */       lui $t4, %hi(mnBonusSyncTokenAndFighter)
  /* 14C11C 801360EC 258C5BF4 */     addiu $t4, $t4, %lo(mnBonusSyncTokenAndFighter)
  /* 14C120 801360F0 240D0001 */     addiu $t5, $zero, 1
  /* 14C124 801360F4 240B0001 */     addiu $t3, $zero, 1
  /* 14C128 801360F8 03295021 */      addu $t2, $t9, $t1
  /* 14C12C 801360FC AFAA0020 */        sw $t2, 0x20($sp)
  /* 14C130 80136100 AFAB0024 */        sw $t3, 0x24($sp)
  /* 14C134 80136104 AFAD002C */        sw $t5, 0x2c($sp)
  /* 14C138 80136108 AFAC0028 */        sw $t4, 0x28($sp)
  /* 14C13C 8013610C 0C033414 */       jal func_ovl0_800CD050
  /* 14C140 80136110 AFA8003C */        sw $t0, 0x3c($sp)
  /* 14C144 80136114 8FA50068 */        lw $a1, 0x68($sp)
  /* 14C148 80136118 8FA8003C */        lw $t0, 0x3c($sp)
  /* 14C14C 8013611C 3C048013 */       lui $a0, %hi(gMNBonusPanel)
  /* 14C150 80136120 24847648 */     addiu $a0, $a0, %lo(gMNBonusPanel)
  /* 14C154 80136124 AC450084 */        sw $a1, 0x84($v0)
  /* 14C158 80136128 AC820004 */        sw $v0, 4($a0) # gMNBonusPanel + 4
  /* 14C15C 8013612C 3C01424C */       lui $at, (0x424C0000 >> 16) # 51.0
  /* 14C160 80136130 44812000 */      mtc1 $at, $f4 # 51.0 to cop1
  /* 14C164 80136134 8C4E0074 */        lw $t6, 0x74($v0)
  /* 14C168 80136138 3C014321 */       lui $at, (0x43210000 >> 16) # 161.0
  /* 14C16C 8013613C 44813000 */      mtc1 $at, $f6 # 161.0 to cop1
  /* 14C170 80136140 E5C40058 */      swc1 $f4, 0x58($t6)
  /* 14C174 80136144 8C4F0074 */        lw $t7, 0x74($v0)
  /* 14C178 80136148 3C0B8013 */       lui $t3, %hi(D_ovl29_801376D8)
  /* 14C17C 8013614C 01685821 */      addu $t3, $t3, $t0
  /* 14C180 80136150 E5E6005C */      swc1 $f6, 0x5c($t7)
  /* 14C184 80136154 8C430074 */        lw $v1, 0x74($v0)
  /* 14C188 80136158 2401FFFF */     addiu $at, $zero, -1
  /* 14C18C 8013615C 240C0004 */     addiu $t4, $zero, 4
  /* 14C190 80136160 94780024 */       lhu $t8, 0x24($v1)
  /* 14C194 80136164 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 14C198 80136168 A4790024 */        sh $t9, 0x24($v1)
  /* 14C19C 8013616C 8C430074 */        lw $v1, 0x74($v0)
  /* 14C1A0 80136170 94690024 */       lhu $t1, 0x24($v1)
  /* 14C1A4 80136174 352A0001 */       ori $t2, $t1, 1
  /* 14C1A8 80136178 A46A0024 */        sh $t2, 0x24($v1)
  /* 14C1AC 8013617C 8D6B76D8 */        lw $t3, %lo(D_ovl29_801376D8)($t3)
  /* 14C1B0 80136180 51610004 */      beql $t3, $at, .L80136194
  /* 14C1B4 80136184 AC8C0050 */        sw $t4, 0x50($a0) # gMNBonusPanel + 80
  /* 14C1B8 80136188 10000002 */         b .L80136194
  /* 14C1BC 8013618C AC850050 */        sw $a1, 0x50($a0) # gMNBonusPanel + 80
  /* 14C1C0 80136190 AC8C0050 */        sw $t4, 0x50($a0) # gMNBonusPanel + 80
  .L80136194:
  /* 14C1C4 80136194 8FBF0034 */        lw $ra, 0x34($sp)
  /* 14C1C8 80136198 27BD0068 */     addiu $sp, $sp, 0x68
  /* 14C1CC 8013619C 03E00008 */        jr $ra
  /* 14C1D0 801361A0 00000000 */       nop

  /* 14C1D4 801361A4 03E00008 */        jr $ra
  /* 14C1D8 801361A8 00000000 */       nop

glabel mnBonusAutopositionTokenFromPortraitEdges
  /* 14C1DC 801361AC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14C1E0 801361B0 3C058013 */       lui $a1, %hi(gMNBonusPanel)
  /* 14C1E4 801361B4 24A57648 */     addiu $a1, $a1, %lo(gMNBonusPanel)
  /* 14C1E8 801361B8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14C1EC 801361BC AFA40018 */        sw $a0, 0x18($sp)
  /* 14C1F0 801361C0 0C04C8F8 */       jal mnBonusGetPortraitId
  /* 14C1F4 801361C4 8CA40020 */        lw $a0, 0x20($a1) # gMNBonusPanel + 32
  /* 14C1F8 801361C8 3C058013 */       lui $a1, %hi(gMNBonusPanel)
  /* 14C1FC 801361CC 28410006 */      slti $at, $v0, 6
  /* 14C200 801361D0 14200003 */      bnez $at, .L801361E0
  /* 14C204 801361D4 24A57648 */     addiu $a1, $a1, %lo(gMNBonusPanel)
  /* 14C208 801361D8 10000002 */         b .L801361E4
  /* 14C20C 801361DC 2443FFFA */     addiu $v1, $v0, -6
  .L801361E0:
  /* 14C210 801361E0 00401825 */        or $v1, $v0, $zero
  .L801361E4:
  /* 14C214 801361E4 00037080 */       sll $t6, $v1, 2
  /* 14C218 801361E8 01C37023 */      subu $t6, $t6, $v1
  /* 14C21C 801361EC 000E7080 */       sll $t6, $t6, 2
  /* 14C220 801361F0 01C37023 */      subu $t6, $t6, $v1
  /* 14C224 801361F4 000E7080 */       sll $t6, $t6, 2
  /* 14C228 801361F8 01C37021 */      addu $t6, $t6, $v1
  /* 14C22C 801361FC 25CF0019 */     addiu $t7, $t6, 0x19
  /* 14C230 80136200 448F2000 */      mtc1 $t7, $f4
  /* 14C234 80136204 28410006 */      slti $at, $v0, 6
  /* 14C238 80136208 14200003 */      bnez $at, .L80136218
  /* 14C23C 8013620C 468023A0 */   cvt.s.w $f14, $f4
  /* 14C240 80136210 10000002 */         b .L8013621C
  /* 14C244 80136214 24030001 */     addiu $v1, $zero, 1
  .L80136218:
  /* 14C248 80136218 00001825 */        or $v1, $zero, $zero
  .L8013621C:
  /* 14C24C 8013621C 8CB80004 */        lw $t8, 4($a1) # gMNBonusPanel + 4
  /* 14C250 80136220 C4A80060 */      lwc1 $f8, 0x60($a1) # gMNBonusPanel + 96
  /* 14C254 80136224 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 14C258 80136228 8F020074 */        lw $v0, 0x74($t8)
  /* 14C25C 8013622C 44818000 */      mtc1 $at, $f16 # 5.0 to cop1
  /* 14C260 80136230 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 14C264 80136234 C4460058 */      lwc1 $f6, 0x58($v0)
  /* 14C268 80136238 44812000 */      mtc1 $at, $f4 # 13.0 to cop1
  /* 14C26C 8013623C 46107300 */     add.s $f12, $f14, $f16
  /* 14C270 80136240 0003C880 */       sll $t9, $v1, 2
  /* 14C274 80136244 0323C823 */      subu $t9, $t9, $v1
  /* 14C278 80136248 46083280 */     add.s $f10, $f6, $f8
  /* 14C27C 8013624C C4A80064 */      lwc1 $f8, 0x64($a1) # gMNBonusPanel + 100
  /* 14C280 80136250 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 14C284 80136254 0019C880 */       sll $t9, $t9, 2
  /* 14C288 80136258 46045000 */     add.s $f0, $f10, $f4
  /* 14C28C 8013625C 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 14C290 80136260 0323C823 */      subu $t9, $t9, $v1
  /* 14C294 80136264 46083280 */     add.s $f10, $f6, $f8
  /* 14C298 80136268 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 14C29C 8013626C 0019C880 */       sll $t9, $t9, 2
  /* 14C2A0 80136270 460C003C */    c.lt.s $f0, $f12
  /* 14C2A4 80136274 0323C823 */      subu $t9, $t9, $v1
  /* 14C2A8 80136278 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14C2AC 8013627C 27280024 */     addiu $t0, $t9, 0x24
  /* 14C2B0 80136280 45000006 */      bc1f .L8013629C
  /* 14C2B4 80136284 46045080 */     add.s $f2, $f10, $f4
  /* 14C2B8 80136288 46006181 */     sub.s $f6, $f12, $f0
  /* 14C2BC 8013628C 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 14C2C0 80136290 00000000 */       nop
  /* 14C2C4 80136294 46123203 */     div.s $f8, $f6, $f18
  /* 14C2C8 80136298 E4A80060 */      swc1 $f8, 0x60($a1) # gMNBonusPanel + 96
  .L8013629C:
  /* 14C2CC 8013629C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14C2D0 801362A0 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 14C2D4 801362A4 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 14C2D8 801362A8 44815000 */      mtc1 $at, $f10 # 45.0 to cop1
  /* 14C2DC 801362AC 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 14C2E0 801362B0 460A7100 */     add.s $f4, $f14, $f10
  /* 14C2E4 801362B4 46102301 */     sub.s $f12, $f4, $f16
  /* 14C2E8 801362B8 4600603C */    c.lt.s $f12, $f0
  /* 14C2EC 801362BC 00000000 */       nop
  /* 14C2F0 801362C0 45020008 */     bc1fl .L801362E4
  /* 14C2F4 801362C4 44883000 */      mtc1 $t0, $f6
  /* 14C2F8 801362C8 460C0181 */     sub.s $f6, $f0, $f12
  /* 14C2FC 801362CC 44814000 */      mtc1 $at, $f8 # -1.0 to cop1
  /* 14C300 801362D0 00000000 */       nop
  /* 14C304 801362D4 46083282 */     mul.s $f10, $f6, $f8
  /* 14C308 801362D8 46125103 */     div.s $f4, $f10, $f18
  /* 14C30C 801362DC E4A40060 */      swc1 $f4, 0x60($a1) # gMNBonusPanel + 96
  /* 14C310 801362E0 44883000 */      mtc1 $t0, $f6
  .L801362E4:
  /* 14C314 801362E4 00000000 */       nop
  /* 14C318 801362E8 46803020 */   cvt.s.w $f0, $f6
  /* 14C31C 801362EC 46100300 */     add.s $f12, $f0, $f16
  /* 14C320 801362F0 460C103C */    c.lt.s $f2, $f12
  /* 14C324 801362F4 00000000 */       nop
  /* 14C328 801362F8 45020006 */     bc1fl .L80136314
  /* 14C32C 801362FC 3C01422C */       lui $at, 0x422c
  /* 14C330 80136300 46026201 */     sub.s $f8, $f12, $f2
  /* 14C334 80136304 3C018013 */       lui $at, %hi(D_ovl29_801376AC)
  /* 14C338 80136308 46124283 */     div.s $f10, $f8, $f18
  /* 14C33C 8013630C E42A76AC */      swc1 $f10, %lo(D_ovl29_801376AC)($at)
  /* 14C340 80136310 3C01422C */       lui $at, (0x422C0000 >> 16) # 43.0
  .L80136314:
  /* 14C344 80136314 44812000 */      mtc1 $at, $f4 # 43.0 to cop1
  /* 14C348 80136318 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 14C34C 8013631C 46040180 */     add.s $f6, $f0, $f4
  /* 14C350 80136320 46103301 */     sub.s $f12, $f6, $f16
  /* 14C354 80136324 4602603C */    c.lt.s $f12, $f2
  /* 14C358 80136328 00000000 */       nop
  /* 14C35C 8013632C 45020008 */     bc1fl .L80136350
  /* 14C360 80136330 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14C364 80136334 460C1201 */     sub.s $f8, $f2, $f12
  /* 14C368 80136338 44815000 */      mtc1 $at, $f10 # -1.0 to cop1
  /* 14C36C 8013633C 3C018013 */       lui $at, %hi(D_ovl29_801376AC)
  /* 14C370 80136340 460A4102 */     mul.s $f4, $f8, $f10
  /* 14C374 80136344 46122183 */     div.s $f6, $f4, $f18
  /* 14C378 80136348 E42676AC */      swc1 $f6, %lo(D_ovl29_801376AC)($at)
  /* 14C37C 8013634C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136350:
  /* 14C380 80136350 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14C384 80136354 03E00008 */        jr $ra
  /* 14C388 80136358 00000000 */       nop

glabel mnBonusAutopositionPlacedToken
  /* 14C38C 8013635C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14C390 80136360 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14C394 80136364 0C04D86B */       jal mnBonusAutopositionTokenFromPortraitEdges
  /* 14C398 80136368 00000000 */       nop
  /* 14C39C 8013636C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14C3A0 80136370 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14C3A4 80136374 03E00008 */        jr $ra
  /* 14C3A8 80136378 00000000 */       nop

glabel mnBonusAutopositionRecalledToken
  /* 14C3AC 8013637C 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14C3B0 80136380 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14C3B4 80136384 8C4E004C */        lw $t6, 0x4c($v0) # gMNBonusPanel + 76
  /* 14C3B8 80136388 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14C3BC 8013638C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14C3C0 80136390 25CF0001 */     addiu $t7, $t6, 1
  /* 14C3C4 80136394 29E1000B */      slti $at, $t7, 0xb
  /* 14C3C8 80136398 AC4F004C */        sw $t7, 0x4c($v0) # gMNBonusPanel + 76
  /* 14C3CC 8013639C 10200019 */      beqz $at, .L80136404
  /* 14C3D0 801363A0 01E01825 */        or $v1, $t7, $zero
  /* 14C3D4 801363A4 C444003C */      lwc1 $f4, 0x3c($v0) # gMNBonusPanel + 60
  /* 14C3D8 801363A8 C4460038 */      lwc1 $f6, 0x38($v0) # gMNBonusPanel + 56
  /* 14C3DC 801363AC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14C3E0 801363B0 44815000 */      mtc1 $at, $f10 # 10.0 to cop1
  /* 14C3E4 801363B4 46062201 */     sub.s $f8, $f4, $f6
  /* 14C3E8 801363B8 29E10006 */      slti $at, $t7, 6
  /* 14C3EC 801363BC 10200008 */      beqz $at, .L801363E0
  /* 14C3F0 801363C0 460A4083 */     div.s $f2, $f8, $f10
  /* 14C3F4 801363C4 C4500044 */      lwc1 $f16, 0x44($v0) # gMNBonusPanel + 68
  /* 14C3F8 801363C8 C4520040 */      lwc1 $f18, 0x40($v0) # gMNBonusPanel + 64
  /* 14C3FC 801363CC 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 14C400 801363D0 44813000 */      mtc1 $at, $f6 # 5.0 to cop1
  /* 14C404 801363D4 46128101 */     sub.s $f4, $f16, $f18
  /* 14C408 801363D8 10000007 */         b .L801363F8
  /* 14C40C 801363DC 46062003 */     div.s $f0, $f4, $f6
  .L801363E0:
  /* 14C410 801363E0 C4480048 */      lwc1 $f8, 0x48($v0) # gMNBonusPanel + 72
  /* 14C414 801363E4 C44A0044 */      lwc1 $f10, 0x44($v0) # gMNBonusPanel + 68
  /* 14C418 801363E8 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 14C41C 801363EC 44819000 */      mtc1 $at, $f18 # 5.0 to cop1
  /* 14C420 801363F0 460A4401 */     sub.s $f16, $f8, $f10
  /* 14C424 801363F4 46128003 */     div.s $f0, $f16, $f18
  .L801363F8:
  /* 14C428 801363F8 E4420060 */      swc1 $f2, 0x60($v0) # gMNBonusPanel + 96
  /* 14C42C 801363FC 1000000C */         b .L80136430
  /* 14C430 80136400 E4400064 */      swc1 $f0, 0x64($v0) # gMNBonusPanel + 100
  .L80136404:
  /* 14C434 80136404 2401000B */     addiu $at, $zero, 0xb
  /* 14C438 80136408 5461000A */      bnel $v1, $at, .L80136434
  /* 14C43C 8013640C 2401001E */     addiu $at, $zero, 0x1e
  /* 14C440 80136410 0C04D331 */       jal mnBonusHandleCursorPickup
  /* 14C444 80136414 00000000 */       nop
  /* 14C448 80136418 44800000 */      mtc1 $zero, $f0
  /* 14C44C 8013641C 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14C450 80136420 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14C454 80136424 8C43004C */        lw $v1, 0x4c($v0) # gMNBonusPanel + 76
  /* 14C458 80136428 E4400060 */      swc1 $f0, 0x60($v0) # gMNBonusPanel + 96
  /* 14C45C 8013642C E4400064 */      swc1 $f0, 0x64($v0) # gMNBonusPanel + 100
  .L80136430:
  /* 14C460 80136430 2401001E */     addiu $at, $zero, 0x1e
  .L80136434:
  /* 14C464 80136434 54610003 */      bnel $v1, $at, .L80136444
  /* 14C468 80136438 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14C46C 8013643C AC400030 */        sw $zero, 0x30($v0) # gMNBonusPanel + 48
  /* 14C470 80136440 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136444:
  /* 14C474 80136444 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14C478 80136448 03E00008 */        jr $ra
  /* 14C47C 8013644C 00000000 */       nop

glabel mnBonusAutopositionToken
  /* 14C480 80136450 3C0E8013 */       lui $t6, %hi(D_ovl29_80137678)
  /* 14C484 80136454 8DCE7678 */        lw $t6, %lo(D_ovl29_80137678)($t6)
  /* 14C488 80136458 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14C48C 8013645C AFBF0014 */        sw $ra, 0x14($sp)
  /* 14C490 80136460 11C00004 */      beqz $t6, .L80136474
  /* 14C494 80136464 AFA40018 */        sw $a0, 0x18($sp)
  /* 14C498 80136468 3C048013 */       lui $a0, %hi(gMNBonusHumanPanelPort)
  /* 14C49C 8013646C 0C04D8DF */       jal mnBonusAutopositionRecalledToken
  /* 14C4A0 80136470 8C8476F8 */        lw $a0, %lo(gMNBonusHumanPanelPort)($a0)
  .L80136474:
  /* 14C4A4 80136474 3C0F8013 */       lui $t7, %hi(D_ovl29_80137674)
  /* 14C4A8 80136478 8DEF7674 */        lw $t7, %lo(D_ovl29_80137674)($t7)
  /* 14C4AC 8013647C 51E00004 */      beql $t7, $zero, .L80136490
  /* 14C4B0 80136480 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14C4B4 80136484 0C04D8D7 */       jal mnBonusAutopositionPlacedToken
  /* 14C4B8 80136488 00002025 */        or $a0, $zero, $zero
  /* 14C4BC 8013648C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136490:
  /* 14C4C0 80136490 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14C4C4 80136494 03E00008 */        jr $ra
  /* 14C4C8 80136498 00000000 */       nop

glabel mnBonusCreateTokenAutopositionRoutine
  /* 14C4CC 8013649C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14C4D0 801364A0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14C4D4 801364A4 00002025 */        or $a0, $zero, $zero
  /* 14C4D8 801364A8 00002825 */        or $a1, $zero, $zero
  /* 14C4DC 801364AC 24060018 */     addiu $a2, $zero, 0x18
  /* 14C4E0 801364B0 0C00265A */       jal omMakeGObjSPAfter
  /* 14C4E4 801364B4 3C078000 */       lui $a3, 0x8000
  /* 14C4E8 801364B8 3C058013 */       lui $a1, %hi(mnBonusAutopositionToken)
  /* 14C4EC 801364BC 24A56450 */     addiu $a1, $a1, %lo(mnBonusAutopositionToken)
  /* 14C4F0 801364C0 00402025 */        or $a0, $v0, $zero
  /* 14C4F4 801364C4 24060001 */     addiu $a2, $zero, 1
  /* 14C4F8 801364C8 0C002062 */       jal omAddGObjCommonProc
  /* 14C4FC 801364CC 24070001 */     addiu $a3, $zero, 1
  /* 14C500 801364D0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14C504 801364D4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14C508 801364D8 03E00008 */        jr $ra
  /* 14C50C 801364DC 00000000 */       nop

glabel mnBonusSyncWhiteCircleSizeAndDisplay
  /* 14C510 801364E0 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 14C514 801364E4 3C0E8013 */       lui $t6, %hi(dMNBonusWhiteCircleSizes)
  /* 14C518 801364E8 27A20000 */     addiu $v0, $sp, 0
  /* 14C51C 801364EC 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14C520 801364F0 25CE7500 */     addiu $t6, $t6, %lo(dMNBonusWhiteCircleSizes)
  /* 14C524 801364F4 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14C528 801364F8 25C80030 */     addiu $t0, $t6, 0x30
  /* 14C52C 801364FC 0040C825 */        or $t9, $v0, $zero
  .L80136500:
  /* 14C530 80136500 8DD80000 */        lw $t8, ($t6) # dMNBonusWhiteCircleSizes + 0
  /* 14C534 80136504 25CE000C */     addiu $t6, $t6, 0xc
  /* 14C538 80136508 2739000C */     addiu $t9, $t9, 0xc
  /* 14C53C 8013650C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 14C540 80136510 8DCFFFF8 */        lw $t7, -8($t6) # dMNBonusWhiteCircleSizes + -8
  /* 14C544 80136514 AF2FFFF8 */        sw $t7, -8($t9)
  /* 14C548 80136518 8DD8FFFC */        lw $t8, -4($t6) # dMNBonusWhiteCircleSizes + -4
  /* 14C54C 8013651C 15C8FFF8 */       bne $t6, $t0, .L80136500
  /* 14C550 80136520 AF38FFFC */        sw $t8, -4($t9)
  /* 14C554 80136524 8C690058 */        lw $t1, 0x58($v1) # gMNBonusPanel + 88
  /* 14C558 80136528 55200020 */      bnel $t1, $zero, .L801365AC
  /* 14C55C 8013652C 24050001 */     addiu $a1, $zero, 1
  /* 14C560 80136530 8C6A0020 */        lw $t2, 0x20($v1) # gMNBonusPanel + 32
  /* 14C564 80136534 2401001C */     addiu $at, $zero, 0x1c
  /* 14C568 80136538 5141001C */      beql $t2, $at, .L801365AC
  /* 14C56C 8013653C 24050001 */     addiu $a1, $zero, 1
  /* 14C570 80136540 8C8B007C */        lw $t3, 0x7c($a0)
  /* 14C574 80136544 24050001 */     addiu $a1, $zero, 1
  /* 14C578 80136548 54AB0004 */      bnel $a1, $t3, .L8013655C
  /* 14C57C 8013654C AC85007C */        sw $a1, 0x7c($a0)
  /* 14C580 80136550 10000002 */         b .L8013655C
  /* 14C584 80136554 AC80007C */        sw $zero, 0x7c($a0)
  /* 14C588 80136558 AC85007C */        sw $a1, 0x7c($a0)
  .L8013655C:
  /* 14C58C 8013655C 8C6C0020 */        lw $t4, 0x20($v1) # gMNBonusPanel + 32
  /* 14C590 80136560 8C8E0074 */        lw $t6, 0x74($a0)
  /* 14C594 80136564 000C6880 */       sll $t5, $t4, 2
  /* 14C598 80136568 004D4021 */      addu $t0, $v0, $t5
  /* 14C59C 8013656C C5040000 */      lwc1 $f4, ($t0)
  /* 14C5A0 80136570 E5C40040 */      swc1 $f4, 0x40($t6)
  /* 14C5A4 80136574 8C790020 */        lw $t9, 0x20($v1) # gMNBonusPanel + 32
  /* 14C5A8 80136578 8C890074 */        lw $t1, 0x74($a0)
  /* 14C5AC 8013657C 00197880 */       sll $t7, $t9, 2
  /* 14C5B0 80136580 004FC021 */      addu $t8, $v0, $t7
  /* 14C5B4 80136584 C7060000 */      lwc1 $f6, ($t8)
  /* 14C5B8 80136588 E5260044 */      swc1 $f6, 0x44($t1)
  /* 14C5BC 8013658C 8C6A0020 */        lw $t2, 0x20($v1) # gMNBonusPanel + 32
  /* 14C5C0 80136590 8C8D0074 */        lw $t5, 0x74($a0)
  /* 14C5C4 80136594 000A5880 */       sll $t3, $t2, 2
  /* 14C5C8 80136598 004B6021 */      addu $t4, $v0, $t3
  /* 14C5CC 8013659C C5880000 */      lwc1 $f8, ($t4)
  /* 14C5D0 801365A0 10000003 */         b .L801365B0
  /* 14C5D4 801365A4 E5A80044 */      swc1 $f8, 0x44($t5)
  /* 14C5D8 801365A8 24050001 */     addiu $a1, $zero, 1
  .L801365AC:
  /* 14C5DC 801365AC AC85007C */        sw $a1, 0x7c($a0)
  .L801365B0:
  /* 14C5E0 801365B0 03E00008 */        jr $ra
  /* 14C5E4 801365B4 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnBonusCreateWhiteCircles
  /* 14C5E8 801365B8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14C5EC 801365BC AFBF0024 */        sw $ra, 0x24($sp)
  /* 14C5F0 801365C0 AFB00020 */        sw $s0, 0x20($sp)
  /* 14C5F4 801365C4 00002025 */        or $a0, $zero, $zero
  /* 14C5F8 801365C8 00002825 */        or $a1, $zero, $zero
  /* 14C5FC 801365CC 24060015 */     addiu $a2, $zero, 0x15
  /* 14C600 801365D0 0C00265A */       jal omMakeGObjSPAfter
  /* 14C604 801365D4 3C078000 */       lui $a3, 0x8000
  /* 14C608 801365D8 3C0E8013 */       lui $t6, %hi(D_ovl29_80137E20)
  /* 14C60C 801365DC 8DCE7E20 */        lw $t6, %lo(D_ovl29_80137E20)($t6)
  /* 14C610 801365E0 3C0F0000 */       lui $t7, %hi(D_NF_00000568)
  /* 14C614 801365E4 25EF0568 */     addiu $t7, $t7, %lo(D_NF_00000568)
  /* 14C618 801365E8 00408025 */        or $s0, $v0, $zero
  /* 14C61C 801365EC 00402025 */        or $a0, $v0, $zero
  /* 14C620 801365F0 00003025 */        or $a2, $zero, $zero
  /* 14C624 801365F4 0C003C48 */       jal func_8000F120
  /* 14C628 801365F8 01CF2821 */      addu $a1, $t6, $t7
  /* 14C62C 801365FC 3C058001 */       lui $a1, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 14C630 80136600 2418FFFF */     addiu $t8, $zero, -1
  /* 14C634 80136604 AFB80010 */        sw $t8, 0x10($sp)
  /* 14C638 80136608 24A54768 */     addiu $a1, $a1, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 14C63C 8013660C 02002025 */        or $a0, $s0, $zero
  /* 14C640 80136610 24060009 */     addiu $a2, $zero, 9
  /* 14C644 80136614 0C00277D */       jal omAddGObjRenderProc
  /* 14C648 80136618 3C078000 */       lui $a3, 0x8000
  /* 14C64C 8013661C 3C198013 */       lui $t9, %hi(D_ovl29_80137E20)
  /* 14C650 80136620 8F397E20 */        lw $t9, %lo(D_ovl29_80137E20)($t9)
  /* 14C654 80136624 3C080000 */       lui $t0, %hi(D_NF_00000408)
  /* 14C658 80136628 25080408 */     addiu $t0, $t0, %lo(D_NF_00000408)
  /* 14C65C 8013662C 02002025 */        or $a0, $s0, $zero
  /* 14C660 80136630 0C003E3D */       jal func_8000F8F4
  /* 14C664 80136634 03282821 */      addu $a1, $t9, $t0
  /* 14C668 80136638 3C058013 */       lui $a1, %hi(mnBonusSyncWhiteCircleSizeAndDisplay)
  /* 14C66C 8013663C 24A564E0 */     addiu $a1, $a1, %lo(mnBonusSyncWhiteCircleSizeAndDisplay)
  /* 14C670 80136640 02002025 */        or $a0, $s0, $zero
  /* 14C674 80136644 24060001 */     addiu $a2, $zero, 1
  /* 14C678 80136648 0C002062 */       jal omAddGObjCommonProc
  /* 14C67C 8013664C 24070001 */     addiu $a3, $zero, 1
  /* 14C680 80136650 0C0037CD */       jal func_8000DF34
  /* 14C684 80136654 02002025 */        or $a0, $s0, $zero
  /* 14C688 80136658 3C01C42F */       lui $at, (0xC42F0000 >> 16) # -700.0
  /* 14C68C 8013665C 44812000 */      mtc1 $at, $f4 # -700.0 to cop1
  /* 14C690 80136660 8E090074 */        lw $t1, 0x74($s0)
  /* 14C694 80136664 3C018013 */       lui $at, %hi(D_ovl29_80137638)
  /* 14C698 80136668 44804000 */      mtc1 $zero, $f8
  /* 14C69C 8013666C E524001C */      swc1 $f4, 0x1c($t1)
  /* 14C6A0 80136670 8E0A0074 */        lw $t2, 0x74($s0)
  /* 14C6A4 80136674 C4267638 */      lwc1 $f6, %lo(D_ovl29_80137638)($at)
  /* 14C6A8 80136678 E5460020 */      swc1 $f6, 0x20($t2)
  /* 14C6AC 8013667C 8E0B0074 */        lw $t3, 0x74($s0)
  /* 14C6B0 80136680 E5680024 */      swc1 $f8, 0x24($t3)
  /* 14C6B4 80136684 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14C6B8 80136688 8FB00020 */        lw $s0, 0x20($sp)
  /* 14C6BC 8013668C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14C6C0 80136690 03E00008 */        jr $ra
  /* 14C6C4 80136694 00000000 */       nop

glabel mnBonusBlinkIfReadyToFight
  /* 14C6C8 80136698 3C0E8013 */       lui $t6, %hi(gMNBonusCharSelected)
  /* 14C6CC 8013669C 8DCE76EC */        lw $t6, %lo(gMNBonusCharSelected)($t6)
  /* 14C6D0 801366A0 3C038013 */       lui $v1, %hi(gMNBonusPressStartFlashTimer)
  /* 14C6D4 801366A4 2463772C */     addiu $v1, $v1, %lo(gMNBonusPressStartFlashTimer)
  /* 14C6D8 801366A8 11C00012 */      beqz $t6, .L801366F4
  /* 14C6DC 801366AC 24080001 */     addiu $t0, $zero, 1
  /* 14C6E0 801366B0 3C038013 */       lui $v1, %hi(gMNBonusPressStartFlashTimer)
  /* 14C6E4 801366B4 2463772C */     addiu $v1, $v1, %lo(gMNBonusPressStartFlashTimer)
  /* 14C6E8 801366B8 8C6F0000 */        lw $t7, ($v1) # gMNBonusPressStartFlashTimer + 0
  /* 14C6EC 801366BC 24010028 */     addiu $at, $zero, 0x28
  /* 14C6F0 801366C0 24190001 */     addiu $t9, $zero, 1
  /* 14C6F4 801366C4 25E20001 */     addiu $v0, $t7, 1
  /* 14C6F8 801366C8 14410003 */       bne $v0, $at, .L801366D8
  /* 14C6FC 801366CC AC620000 */        sw $v0, ($v1) # gMNBonusPressStartFlashTimer + 0
  /* 14C700 801366D0 AC600000 */        sw $zero, ($v1) # gMNBonusPressStartFlashTimer + 0
  /* 14C704 801366D4 00001025 */        or $v0, $zero, $zero
  .L801366D8:
  /* 14C708 801366D8 2841001E */      slti $at, $v0, 0x1e
  /* 14C70C 801366DC 10200003 */      beqz $at, .L801366EC
  /* 14C710 801366E0 00000000 */       nop
  /* 14C714 801366E4 03E00008 */        jr $ra
  /* 14C718 801366E8 AC80007C */        sw $zero, 0x7c($a0)

  .L801366EC:
  /* 14C71C 801366EC 03E00008 */        jr $ra
  /* 14C720 801366F0 AC99007C */        sw $t9, 0x7c($a0)

  .L801366F4:
  /* 14C724 801366F4 AC88007C */        sw $t0, 0x7c($a0)
  /* 14C728 801366F8 AC600000 */        sw $zero, ($v1)
  /* 14C72C 801366FC 03E00008 */        jr $ra
  /* 14C730 80136700 00000000 */       nop

glabel mnBonusCreateReadyToFightObjects
  /* 14C734 80136704 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 14C738 80136708 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14C73C 8013670C AFB00020 */        sw $s0, 0x20($sp)
  /* 14C740 80136710 00002025 */        or $a0, $zero, $zero
  /* 14C744 80136714 00002825 */        or $a1, $zero, $zero
  /* 14C748 80136718 2406001C */     addiu $a2, $zero, 0x1c
  /* 14C74C 8013671C 0C00265A */       jal omMakeGObjSPAfter
  /* 14C750 80136720 3C078000 */       lui $a3, 0x8000
  /* 14C754 80136724 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 14C758 80136728 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 14C75C 8013672C 240EFFFF */     addiu $t6, $zero, -1
  /* 14C760 80136730 00408025 */        or $s0, $v0, $zero
  /* 14C764 80136734 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14C768 80136738 AFA5002C */        sw $a1, 0x2c($sp)
  /* 14C76C 8013673C 00402025 */        or $a0, $v0, $zero
  /* 14C770 80136740 24060023 */     addiu $a2, $zero, 0x23
  /* 14C774 80136744 0C00277D */       jal omAddGObjRenderProc
  /* 14C778 80136748 3C078000 */       lui $a3, 0x8000
  /* 14C77C 8013674C 3C058013 */       lui $a1, %hi(mnBonusBlinkIfReadyToFight)
  /* 14C780 80136750 24A56698 */     addiu $a1, $a1, %lo(mnBonusBlinkIfReadyToFight)
  /* 14C784 80136754 AFA50028 */        sw $a1, 0x28($sp)
  /* 14C788 80136758 02002025 */        or $a0, $s0, $zero
  /* 14C78C 8013675C 24060001 */     addiu $a2, $zero, 1
  /* 14C790 80136760 0C002062 */       jal omAddGObjCommonProc
  /* 14C794 80136764 24070001 */     addiu $a3, $zero, 1
  /* 14C798 80136768 3C0F8013 */       lui $t7, %hi(D_ovl29_80137DF8)
  /* 14C79C 8013676C 8DEF7DF8 */        lw $t7, %lo(D_ovl29_80137DF8)($t7)
  /* 14C7A0 80136770 3C180001 */       lui $t8, %hi(D_NF_0000F530)
  /* 14C7A4 80136774 2718F530 */     addiu $t8, $t8, %lo(D_NF_0000F530)
  /* 14C7A8 80136778 02002025 */        or $a0, $s0, $zero
  /* 14C7AC 8013677C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14C7B0 80136780 01F82821 */      addu $a1, $t7, $t8
  /* 14C7B4 80136784 94590024 */       lhu $t9, 0x24($v0)
  /* 14C7B8 80136788 3C01428E */       lui $at, (0x428E0000 >> 16) # 71.0
  /* 14C7BC 8013678C 44802000 */      mtc1 $zero, $f4
  /* 14C7C0 80136790 44813000 */      mtc1 $at, $f6 # 71.0 to cop1
  /* 14C7C4 80136794 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 14C7C8 80136798 A4490024 */        sh $t1, 0x24($v0)
  /* 14C7CC 8013679C 352A0001 */       ori $t2, $t1, 1
  /* 14C7D0 801367A0 240B00F4 */     addiu $t3, $zero, 0xf4
  /* 14C7D4 801367A4 240C0056 */     addiu $t4, $zero, 0x56
  /* 14C7D8 801367A8 240D007F */     addiu $t5, $zero, 0x7f
  /* 14C7DC 801367AC 240E0003 */     addiu $t6, $zero, 3
  /* 14C7E0 801367B0 240F0140 */     addiu $t7, $zero, 0x140
  /* 14C7E4 801367B4 24180011 */     addiu $t8, $zero, 0x11
  /* 14C7E8 801367B8 A44A0024 */        sh $t2, 0x24($v0)
  /* 14C7EC 801367BC A0400060 */        sb $zero, 0x60($v0)
  /* 14C7F0 801367C0 A0400061 */        sb $zero, 0x61($v0)
  /* 14C7F4 801367C4 A0400062 */        sb $zero, 0x62($v0)
  /* 14C7F8 801367C8 A04B0028 */        sb $t3, 0x28($v0)
  /* 14C7FC 801367CC A04C0029 */        sb $t4, 0x29($v0)
  /* 14C800 801367D0 A04D002A */        sb $t5, 0x2a($v0)
  /* 14C804 801367D4 A0400065 */        sb $zero, 0x65($v0)
  /* 14C808 801367D8 A0400064 */        sb $zero, 0x64($v0)
  /* 14C80C 801367DC A04E0067 */        sb $t6, 0x67($v0)
  /* 14C810 801367E0 A0400066 */        sb $zero, 0x66($v0)
  /* 14C814 801367E4 A44F0068 */        sh $t7, 0x68($v0)
  /* 14C818 801367E8 A458006A */        sh $t8, 0x6a($v0)
  /* 14C81C 801367EC 3C198013 */       lui $t9, %hi(D_ovl29_80137DF8)
  /* 14C820 801367F0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 14C824 801367F4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 14C828 801367F8 8F397DF8 */        lw $t9, %lo(D_ovl29_80137DF8)($t9)
  /* 14C82C 801367FC 3C080001 */       lui $t0, %hi(D_NF_0000F448)
  /* 14C830 80136800 2508F448 */     addiu $t0, $t0, %lo(D_NF_0000F448)
  /* 14C834 80136804 02002025 */        or $a0, $s0, $zero
  /* 14C838 80136808 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14C83C 8013680C 03282821 */      addu $a1, $t9, $t0
  /* 14C840 80136810 94490024 */       lhu $t1, 0x24($v0)
  /* 14C844 80136814 3C014248 */       lui $at, (0x42480000 >> 16) # 50.0
  /* 14C848 80136818 44814000 */      mtc1 $at, $f8 # 50.0 to cop1
  /* 14C84C 8013681C 3C014298 */       lui $at, (0x42980000 >> 16) # 76.0
  /* 14C850 80136820 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 14C854 80136824 44815000 */      mtc1 $at, $f10 # 76.0 to cop1
  /* 14C858 80136828 240300FF */     addiu $v1, $zero, 0xff
  /* 14C85C 8013682C A44B0024 */        sh $t3, 0x24($v0)
  /* 14C860 80136830 356C0001 */       ori $t4, $t3, 1
  /* 14C864 80136834 240D00CA */     addiu $t5, $zero, 0xca
  /* 14C868 80136838 240E0013 */     addiu $t6, $zero, 0x13
  /* 14C86C 8013683C 240F009D */     addiu $t7, $zero, 0x9d
  /* 14C870 80136840 A44C0024 */        sh $t4, 0x24($v0)
  /* 14C874 80136844 A0430060 */        sb $v1, 0x60($v0)
  /* 14C878 80136848 A04D0061 */        sb $t5, 0x61($v0)
  /* 14C87C 8013684C A04E0062 */        sb $t6, 0x62($v0)
  /* 14C880 80136850 A0430028 */        sb $v1, 0x28($v0)
  /* 14C884 80136854 A0430029 */        sb $v1, 0x29($v0)
  /* 14C888 80136858 A04F002A */        sb $t7, 0x2a($v0)
  /* 14C88C 8013685C 00002025 */        or $a0, $zero, $zero
  /* 14C890 80136860 00002825 */        or $a1, $zero, $zero
  /* 14C894 80136864 24060016 */     addiu $a2, $zero, 0x16
  /* 14C898 80136868 3C078000 */       lui $a3, 0x8000
  /* 14C89C 8013686C E4480058 */      swc1 $f8, 0x58($v0)
  /* 14C8A0 80136870 0C00265A */       jal omMakeGObjSPAfter
  /* 14C8A4 80136874 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 14C8A8 80136878 2418FFFF */     addiu $t8, $zero, -1
  /* 14C8AC 8013687C 00408025 */        or $s0, $v0, $zero
  /* 14C8B0 80136880 AFB80010 */        sw $t8, 0x10($sp)
  /* 14C8B4 80136884 00402025 */        or $a0, $v0, $zero
  /* 14C8B8 80136888 8FA5002C */        lw $a1, 0x2c($sp)
  /* 14C8BC 8013688C 2406001C */     addiu $a2, $zero, 0x1c
  /* 14C8C0 80136890 0C00277D */       jal omAddGObjRenderProc
  /* 14C8C4 80136894 3C078000 */       lui $a3, 0x8000
  /* 14C8C8 80136898 02002025 */        or $a0, $s0, $zero
  /* 14C8CC 8013689C 8FA50028 */        lw $a1, 0x28($sp)
  /* 14C8D0 801368A0 24060001 */     addiu $a2, $zero, 1
  /* 14C8D4 801368A4 0C002062 */       jal omAddGObjCommonProc
  /* 14C8D8 801368A8 24070001 */     addiu $a3, $zero, 1
  /* 14C8DC 801368AC 3C198013 */       lui $t9, %hi(D_ovl29_80137DF8)
  /* 14C8E0 801368B0 8F397DF8 */        lw $t9, %lo(D_ovl29_80137DF8)($t9)
  /* 14C8E4 801368B4 3C080000 */       lui $t0, %hi(D_NF_000014D8)
  /* 14C8E8 801368B8 250814D8 */     addiu $t0, $t0, %lo(D_NF_000014D8)
  /* 14C8EC 801368BC 02002025 */        or $a0, $s0, $zero
  /* 14C8F0 801368C0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14C8F4 801368C4 03282821 */      addu $a1, $t9, $t0
  /* 14C8F8 801368C8 94490024 */       lhu $t1, 0x24($v0)
  /* 14C8FC 801368CC 3C014305 */       lui $at, (0x43050000 >> 16) # 133.0
  /* 14C900 801368D0 44818000 */      mtc1 $at, $f16 # 133.0 to cop1
  /* 14C904 801368D4 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 14C908 801368D8 44819000 */      mtc1 $at, $f18 # 219.0 to cop1
  /* 14C90C 801368DC 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 14C910 801368E0 A44B0024 */        sh $t3, 0x24($v0)
  /* 14C914 801368E4 356C0001 */       ori $t4, $t3, 1
  /* 14C918 801368E8 240D00D6 */     addiu $t5, $zero, 0xd6
  /* 14C91C 801368EC 240E00DD */     addiu $t6, $zero, 0xdd
  /* 14C920 801368F0 240F00C6 */     addiu $t7, $zero, 0xc6
  /* 14C924 801368F4 A44C0024 */        sh $t4, 0x24($v0)
  /* 14C928 801368F8 A04D0028 */        sb $t5, 0x28($v0)
  /* 14C92C 801368FC A04E0029 */        sb $t6, 0x29($v0)
  /* 14C930 80136900 A04F002A */        sb $t7, 0x2a($v0)
  /* 14C934 80136904 3C188013 */       lui $t8, %hi(D_ovl29_80137DF8)
  /* 14C938 80136908 E4500058 */      swc1 $f16, 0x58($v0)
  /* 14C93C 8013690C E452005C */      swc1 $f18, 0x5c($v0)
  /* 14C940 80136910 8F187DF8 */        lw $t8, %lo(D_ovl29_80137DF8)($t8)
  /* 14C944 80136914 3C190000 */       lui $t9, %hi(D_NF_00001378)
  /* 14C948 80136918 27391378 */     addiu $t9, $t9, %lo(D_NF_00001378)
  /* 14C94C 8013691C 02002025 */        or $a0, $s0, $zero
  /* 14C950 80136920 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14C954 80136924 03192821 */      addu $a1, $t8, $t9
  /* 14C958 80136928 94480024 */       lhu $t0, 0x24($v0)
  /* 14C95C 8013692C 3C014322 */       lui $at, (0x43220000 >> 16) # 162.0
  /* 14C960 80136930 44812000 */      mtc1 $at, $f4 # 162.0 to cop1
  /* 14C964 80136934 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 14C968 80136938 44813000 */      mtc1 $at, $f6 # 219.0 to cop1
  /* 14C96C 8013693C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 14C970 80136940 A44A0024 */        sh $t2, 0x24($v0)
  /* 14C974 80136944 354B0001 */       ori $t3, $t2, 1
  /* 14C978 80136948 240C00FF */     addiu $t4, $zero, 0xff
  /* 14C97C 8013694C 240D0056 */     addiu $t5, $zero, 0x56
  /* 14C980 80136950 240E0092 */     addiu $t6, $zero, 0x92
  /* 14C984 80136954 A44B0024 */        sh $t3, 0x24($v0)
  /* 14C988 80136958 A04C0028 */        sb $t4, 0x28($v0)
  /* 14C98C 8013695C A04D0029 */        sb $t5, 0x29($v0)
  /* 14C990 80136960 A04E002A */        sb $t6, 0x2a($v0)
  /* 14C994 80136964 E4440058 */      swc1 $f4, 0x58($v0)
  /* 14C998 80136968 E446005C */      swc1 $f6, 0x5c($v0)
  /* 14C99C 8013696C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14C9A0 80136970 8FB00020 */        lw $s0, 0x20($sp)
  /* 14C9A4 80136974 27BD0038 */     addiu $sp, $sp, 0x38
  /* 14C9A8 80136978 03E00008 */        jr $ra
  /* 14C9AC 8013697C 00000000 */       nop

  /* 14C9B0 80136980 03E00008 */        jr $ra
  /* 14C9B4 80136984 00000000 */       nop

  /* 14C9B8 80136988 03E00008 */        jr $ra
  /* 14C9BC 8013698C 00000000 */       nop

  /* 14C9C0 80136990 03E00008 */        jr $ra
  /* 14C9C4 80136994 00000000 */       nop

glabel mnBonusSaveMatchInfo
  /* 14C9C8 80136998 3C038013 */       lui $v1, %hi(gMNBonusPanel)
  /* 14C9CC 8013699C 24637648 */     addiu $v1, $v1, %lo(gMNBonusPanel)
  /* 14C9D0 801369A0 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14C9D4 801369A4 3C0E8013 */       lui $t6, %hi(gMNBonusHumanPanelPort)
  /* 14C9D8 801369A8 8DCE76F8 */        lw $t6, %lo(gMNBonusHumanPanelPort)($t6)
  /* 14C9DC 801369AC 8C6F0020 */        lw $t7, 0x20($v1) # gMNBonusPanel + 32
  /* 14C9E0 801369B0 8C780024 */        lw $t8, 0x24($v1) # gMNBonusPanel + 36
  /* 14C9E4 801369B4 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14C9E8 801369B8 A04E0013 */        sb $t6, 0x13($v0) # gSceneData + 19
  /* 14C9EC 801369BC A04F0039 */        sb $t7, 0x39($v0) # gSceneData + 57
  /* 14C9F0 801369C0 03E00008 */        jr $ra
  /* 14C9F4 801369C4 A058003A */        sb $t8, 0x3a($v0) # gSceneData + 58

  /* 14C9F8 801369C8 03E00008 */        jr $ra
  /* 14C9FC 801369CC 00000000 */       nop

glabel mnBonusMain
  /* 14CA00 801369D0 3C038013 */       lui $v1, %hi(gMNBonusFramesElapsed)
  /* 14CA04 801369D4 24637724 */     addiu $v1, $v1, %lo(gMNBonusFramesElapsed)
  /* 14CA08 801369D8 8C6E0000 */        lw $t6, ($v1) # gMNBonusFramesElapsed + 0
  /* 14CA0C 801369DC 3C188013 */       lui $t8, %hi(gMNBonusMaxFramesElapsed)
  /* 14CA10 801369E0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14CA14 801369E4 25CF0001 */     addiu $t7, $t6, 1
  /* 14CA18 801369E8 AC6F0000 */        sw $t7, ($v1) # gMNBonusFramesElapsed + 0
  /* 14CA1C 801369EC 8F187728 */        lw $t8, %lo(gMNBonusMaxFramesElapsed)($t8)
  /* 14CA20 801369F0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14CA24 801369F4 AFA40018 */        sw $a0, 0x18($sp)
  /* 14CA28 801369F8 170F000B */       bne $t8, $t7, .L80136A28
  /* 14CA2C 801369FC 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14CA30 80136A00 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14CA34 80136A04 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 14CA38 80136A08 24090001 */     addiu $t1, $zero, 1
  /* 14CA3C 80136A0C A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 14CA40 80136A10 0C04DA66 */       jal mnBonusSaveMatchInfo
  /* 14CA44 80136A14 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  /* 14CA48 80136A18 0C00171D */       jal func_80005C74
  /* 14CA4C 80136A1C 00000000 */       nop
  /* 14CA50 80136A20 10000039 */         b .L80136B08
  /* 14CA54 80136A24 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136A28:
  /* 14CA58 80136A28 0C0E42DF */       jal func_ovl1_80390B7C
  /* 14CA5C 80136A2C 00000000 */       nop
  /* 14CA60 80136A30 3C038013 */       lui $v1, %hi(gMNBonusFramesElapsed)
  /* 14CA64 80136A34 14400005 */      bnez $v0, .L80136A4C
  /* 14CA68 80136A38 24637724 */     addiu $v1, $v1, %lo(gMNBonusFramesElapsed)
  /* 14CA6C 80136A3C 8C6A0000 */        lw $t2, ($v1) # gMNBonusFramesElapsed + 0
  /* 14CA70 80136A40 3C018013 */       lui $at, %hi(gMNBonusMaxFramesElapsed)
  /* 14CA74 80136A44 254B4650 */     addiu $t3, $t2, 0x4650
  /* 14CA78 80136A48 AC2B7728 */        sw $t3, %lo(gMNBonusMaxFramesElapsed)($at)
  .L80136A4C:
  /* 14CA7C 80136A4C 3C038013 */       lui $v1, %hi(gMNBonusCharSelected)
  /* 14CA80 80136A50 246376EC */     addiu $v1, $v1, %lo(gMNBonusCharSelected)
  /* 14CA84 80136A54 8C620000 */        lw $v0, ($v1) # gMNBonusCharSelected + 0
  /* 14CA88 80136A58 3C0C8013 */       lui $t4, %hi(D_ovl29_801376A0)
  /* 14CA8C 80136A5C 10400006 */      beqz $v0, .L80136A78
  /* 14CA90 80136A60 00000000 */       nop
  /* 14CA94 80136A64 8D8C76A0 */        lw $t4, %lo(D_ovl29_801376A0)($t4)
  /* 14CA98 80136A68 15800003 */      bnez $t4, .L80136A78
  /* 14CA9C 80136A6C 00000000 */       nop
  /* 14CAA0 80136A70 AC600000 */        sw $zero, ($v1) # gMNBonusCharSelected + 0
  /* 14CAA4 80136A74 00001025 */        or $v0, $zero, $zero
  .L80136A78:
  /* 14CAA8 80136A78 10400022 */      beqz $v0, .L80136B04
  /* 14CAAC 80136A7C 3C028013 */       lui $v0, %hi(gMNBonusAutostartTimer)
  /* 14CAB0 80136A80 244276E8 */     addiu $v0, $v0, %lo(gMNBonusAutostartTimer)
  /* 14CAB4 80136A84 8C4D0000 */        lw $t5, ($v0) # gMNBonusAutostartTimer + 0
  /* 14CAB8 80136A88 3C188013 */       lui $t8, %hi(gMNBonusHumanPanelPort)
  /* 14CABC 80136A8C 3C0A8013 */       lui $t2, %hi(gMNBonusType)
  /* 14CAC0 80136A90 25AEFFFF */     addiu $t6, $t5, -1
  /* 14CAC4 80136A94 11C0000B */      beqz $t6, .L80136AC4
  /* 14CAC8 80136A98 AC4E0000 */        sw $t6, ($v0) # gMNBonusAutostartTimer + 0
  /* 14CACC 80136A9C 8F1876F8 */        lw $t8, %lo(gMNBonusHumanPanelPort)($t8)
  /* 14CAD0 80136AA0 3C088004 */       lui $t0, %hi(gPlayerControllers + 2)
  /* 14CAD4 80136AA4 0018C880 */       sll $t9, $t8, 2
  /* 14CAD8 80136AA8 0338C821 */      addu $t9, $t9, $t8
  /* 14CADC 80136AAC 0019C840 */       sll $t9, $t9, 1
  /* 14CAE0 80136AB0 01194021 */      addu $t0, $t0, $t9
  /* 14CAE4 80136AB4 9508522A */       lhu $t0, %lo(gPlayerControllers + 2)($t0)
  /* 14CAE8 80136AB8 31091000 */      andi $t1, $t0, 0x1000
  /* 14CAEC 80136ABC 51200012 */      beql $t1, $zero, .L80136B08
  /* 14CAF0 80136AC0 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136AC4:
  /* 14CAF4 80136AC4 8D4A7714 */        lw $t2, %lo(gMNBonusType)($t2)
  /* 14CAF8 80136AC8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14CAFC 80136ACC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14CB00 80136AD0 15400006 */      bnez $t2, .L80136AEC
  /* 14CB04 80136AD4 240D0035 */     addiu $t5, $zero, 0x35
  /* 14CB08 80136AD8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14CB0C 80136ADC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14CB10 80136AE0 240B0013 */     addiu $t3, $zero, 0x13
  /* 14CB14 80136AE4 10000003 */         b .L80136AF4
  /* 14CB18 80136AE8 A04B0001 */        sb $t3, 1($v0) # gSceneData + 1
  .L80136AEC:
  /* 14CB1C 80136AEC 240C0014 */     addiu $t4, $zero, 0x14
  /* 14CB20 80136AF0 A04C0001 */        sb $t4, 1($v0) # gSceneData + 1
  .L80136AF4:
  /* 14CB24 80136AF4 0C04DA66 */       jal mnBonusSaveMatchInfo
  /* 14CB28 80136AF8 A04D0000 */        sb $t5, ($v0) # gSceneData + 0
  /* 14CB2C 80136AFC 0C00171D */       jal func_80005C74
  /* 14CB30 80136B00 00000000 */       nop
  .L80136B04:
  /* 14CB34 80136B04 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136B08:
  /* 14CB38 80136B08 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14CB3C 80136B0C 03E00008 */        jr $ra
  /* 14CB40 80136B10 00000000 */       nop

  /* 14CB44 80136B14 03E00008 */        jr $ra
  /* 14CB48 80136B18 00000000 */       nop

  /* 14CB4C 80136B1C 03E00008 */        jr $ra
  /* 14CB50 80136B20 00000000 */       nop

glabel mnBonusInitPort
  /* 14CB54 80136B24 3C028013 */       lui $v0, %hi(gMNBonusPanel)
  /* 14CB58 80136B28 24427648 */     addiu $v0, $v0, %lo(gMNBonusPanel)
  /* 14CB5C 80136B2C 240EFFFF */     addiu $t6, $zero, -1
  /* 14CB60 80136B30 240F001C */     addiu $t7, $zero, 0x1c
  /* 14CB64 80136B34 AC4E0054 */        sw $t6, 0x54($v0) # gMNBonusPanel + 84
  /* 14CB68 80136B38 AC400018 */        sw $zero, 0x18($v0) # gMNBonusPanel + 24
  /* 14CB6C 80136B3C AC400074 */        sw $zero, 0x74($v0) # gMNBonusPanel + 116
  /* 14CB70 80136B40 A4400078 */        sh $zero, 0x78($v0) # gMNBonusPanel + 120
  /* 14CB74 80136B44 AC40002C */        sw $zero, 0x2c($v0) # gMNBonusPanel + 44
  /* 14CB78 80136B48 AC400030 */        sw $zero, 0x30($v0) # gMNBonusPanel + 48
  /* 14CB7C 80136B4C 03E00008 */        jr $ra
  /* 14CB80 80136B50 AC4F0020 */        sw $t7, 0x20($v0) # gMNBonusPanel + 32

glabel mnBonusLoadMatchInfo
  /* 14CB84 80136B54 3C028013 */       lui $v0, %hi(gMNBonusFramesElapsed)
  /* 14CB88 80136B58 24427724 */     addiu $v0, $v0, %lo(gMNBonusFramesElapsed)
  /* 14CB8C 80136B5C AC400000 */        sw $zero, ($v0) # gMNBonusFramesElapsed + 0
  /* 14CB90 80136B60 240F4650 */     addiu $t7, $zero, 0x4650
  /* 14CB94 80136B64 3C018013 */       lui $at, %hi(gMNBonusMaxFramesElapsed)
  /* 14CB98 80136B68 AC2F7728 */        sw $t7, %lo(gMNBonusMaxFramesElapsed)($at)
  /* 14CB9C 80136B6C 3C018013 */       lui $at, %hi(D_ovl29_801376D4)
  /* 14CBA0 80136B70 24180005 */     addiu $t8, $zero, 5
  /* 14CBA4 80136B74 AC3876D4 */        sw $t8, %lo(D_ovl29_801376D4)($at)
  /* 14CBA8 80136B78 3C19800A */       lui $t9, %hi((gSceneData + 0x13))
  /* 14CBAC 80136B7C 93394AE3 */       lbu $t9, %lo((gSceneData + 0x13))($t9)
  /* 14CBB0 80136B80 3C018013 */       lui $at, %hi(gMNBonusCharSelected)
  /* 14CBB4 80136B84 AC2076EC */        sw $zero, %lo(gMNBonusCharSelected)($at)
  /* 14CBB8 80136B88 3C018013 */       lui $at, %hi(gMNBonusHumanPanelPort)
  /* 14CBBC 80136B8C AC3976F8 */        sw $t9, %lo(gMNBonusHumanPanelPort)($at)
  /* 14CBC0 80136B90 3C03800A */       lui $v1, %hi(D_800A4B18)
  /* 14CBC4 80136B94 3C018013 */       lui $at, %hi(gMNBonusTotalTimeGobj)
  /* 14CBC8 80136B98 24634B18 */     addiu $v1, $v1, %lo(D_800A4B18)
  /* 14CBCC 80136B9C AC20771C */        sw $zero, %lo(gMNBonusTotalTimeGobj)($at)
  /* 14CBD0 80136BA0 90680002 */       lbu $t0, 2($v1) # D_800A4B18 + 2
  /* 14CBD4 80136BA4 3C018013 */       lui $at, %hi(gMNBonusIsTeamBattle)
  /* 14CBD8 80136BA8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14CBDC 80136BAC AC2876F0 */        sw $t0, %lo(gMNBonusIsTeamBattle)($at)
  /* 14CBE0 80136BB0 90690003 */       lbu $t1, 3($v1) # D_800A4B18 + 3
  /* 14CBE4 80136BB4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14CBE8 80136BB8 3C018013 */       lui $at, %hi(gMNBonusRule)
  /* 14CBEC 80136BBC 0C04DAC9 */       jal mnBonusInitPort
  /* 14CBF0 80136BC0 AC2976F4 */        sw $t1, %lo(gMNBonusRule)($at)
  /* 14CBF4 80136BC4 3C0A800A */       lui $t2, %hi((gSaveData + 0x458))
  /* 14CBF8 80136BC8 954A4938 */       lhu $t2, %lo((gSaveData + 0x458))($t2)
  /* 14CBFC 80136BCC 3C018013 */       lui $at, %hi(D_ovl29_8013767C)
  /* 14CC00 80136BD0 AC20767C */        sw $zero, %lo(D_ovl29_8013767C)($at)
  /* 14CC04 80136BD4 3C0B800A */       lui $t3, %hi(gSceneData)
  /* 14CC08 80136BD8 916B4AD0 */       lbu $t3, %lo(gSceneData)($t3)
  /* 14CC0C 80136BDC 3C018013 */       lui $at, %hi(gMNBonusCharacterUnlockedMask)
  /* 14CC10 80136BE0 A42A7720 */        sh $t2, %lo(gMNBonusCharacterUnlockedMask)($at)
  /* 14CC14 80136BE4 24010013 */     addiu $at, $zero, 0x13
  /* 14CC18 80136BE8 15610004 */       bne $t3, $at, .L80136BFC
  /* 14CC1C 80136BEC 240C0001 */     addiu $t4, $zero, 1
  /* 14CC20 80136BF0 3C018013 */       lui $at, %hi(gMNBonusType)
  /* 14CC24 80136BF4 10000003 */         b .L80136C04
  /* 14CC28 80136BF8 AC207714 */        sw $zero, %lo(gMNBonusType)($at)
  .L80136BFC:
  /* 14CC2C 80136BFC 3C018013 */       lui $at, %hi(gMNBonusType)
  /* 14CC30 80136C00 AC2C7714 */        sw $t4, %lo(gMNBonusType)($at)
  .L80136C04:
  /* 14CC34 80136C04 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14CC38 80136C08 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14CC3C 80136C0C 03E00008 */        jr $ra
  /* 14CC40 80136C10 00000000 */       nop

glabel mnBonusInitPanel
  /* 14CC44 80136C14 00047080 */       sll $t6, $a0, 2
  /* 14CC48 80136C18 3C0F8013 */       lui $t7, %hi(D_ovl29_801376D8)
  /* 14CC4C 80136C1C 01EE7821 */      addu $t7, $t7, $t6
  /* 14CC50 80136C20 8DEF76D8 */        lw $t7, %lo(D_ovl29_801376D8)($t7)
  /* 14CC54 80136C24 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14CC58 80136C28 AFB00018 */        sw $s0, 0x18($sp)
  /* 14CC5C 80136C2C 2401FFFF */     addiu $at, $zero, -1
  /* 14CC60 80136C30 00808025 */        or $s0, $a0, $zero
  /* 14CC64 80136C34 11E10005 */       beq $t7, $at, .L80136C4C
  /* 14CC68 80136C38 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14CC6C 80136C3C 0C04D7BA */       jal mnBonusCreateCursor
  /* 14CC70 80136C40 00000000 */       nop
  /* 14CC74 80136C44 10000003 */         b .L80136C54
  /* 14CC78 80136C48 00000000 */       nop
  .L80136C4C:
  /* 14CC7C 80136C4C 3C018013 */       lui $at, %hi(gMNBonusPanel)
  /* 14CC80 80136C50 AC207648 */        sw $zero, %lo(gMNBonusPanel)($at)
  .L80136C54:
  /* 14CC84 80136C54 0C04D80D */       jal mnBonusCreateToken
  /* 14CC88 80136C58 02002025 */        or $a0, $s0, $zero
  /* 14CC8C 80136C5C 0C04CBBB */       jal mnBonusCreatePanel
  /* 14CC90 80136C60 02002025 */        or $a0, $s0, $zero
  /* 14CC94 80136C64 0C04D1C9 */       jal mnBonusResetPort
  /* 14CC98 80136C68 02002025 */        or $a0, $s0, $zero
  /* 14CC9C 80136C6C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14CCA0 80136C70 8FB00018 */        lw $s0, 0x18($sp)
  /* 14CCA4 80136C74 27BD0020 */     addiu $sp, $sp, 0x20
  /* 14CCA8 80136C78 03E00008 */        jr $ra
  /* 14CCAC 80136C7C 00000000 */       nop

  /* 14CCB0 80136C80 03E00008 */        jr $ra
  /* 14CCB4 80136C84 00000000 */       nop

glabel mnBonusAreAllCompleted
  /* 14CCB8 80136C88 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 14CCBC 80136C8C AFB10018 */        sw $s1, 0x18($sp)
  /* 14CCC0 80136C90 AFB00014 */        sw $s0, 0x14($sp)
  /* 14CCC4 80136C94 AFBF001C */        sw $ra, 0x1c($sp)
  /* 14CCC8 80136C98 00008025 */        or $s0, $zero, $zero
  /* 14CCCC 80136C9C 2411000C */     addiu $s1, $zero, 0xc
  .L80136CA0:
  /* 14CCD0 80136CA0 0C04CEDF */       jal mnBonusIsCompleted
  /* 14CCD4 80136CA4 02002025 */        or $a0, $s0, $zero
  /* 14CCD8 80136CA8 14400003 */      bnez $v0, .L80136CB8
  /* 14CCDC 80136CAC 26100001 */     addiu $s0, $s0, 1
  /* 14CCE0 80136CB0 10000004 */         b .L80136CC4
  /* 14CCE4 80136CB4 00001025 */        or $v0, $zero, $zero
  .L80136CB8:
  /* 14CCE8 80136CB8 1611FFF9 */       bne $s0, $s1, .L80136CA0
  /* 14CCEC 80136CBC 00000000 */       nop
  /* 14CCF0 80136CC0 24020001 */     addiu $v0, $zero, 1
  .L80136CC4:
  /* 14CCF4 80136CC4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 14CCF8 80136CC8 8FB00014 */        lw $s0, 0x14($sp)
  /* 14CCFC 80136CCC 8FB10018 */        lw $s1, 0x18($sp)
  /* 14CD00 80136CD0 03E00008 */        jr $ra
  /* 14CD04 80136CD4 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnBonusInitCSS
  /* 14CD08 80136CD8 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 14CD0C 80136CDC 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 14CD10 80136CE0 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 14CD14 80136CE4 3C188013 */       lui $t8, %hi(D_ovl29_80137A38)
  /* 14CD18 80136CE8 3C088013 */       lui $t0, %hi(D_ovl29_80137A00)
  /* 14CD1C 80136CEC AFBF0024 */        sw $ra, 0x24($sp)
  /* 14CD20 80136CF0 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 14CD24 80136CF4 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 14CD28 80136CF8 27187A38 */     addiu $t8, $t8, %lo(D_ovl29_80137A38)
  /* 14CD2C 80136CFC 24190078 */     addiu $t9, $zero, 0x78
  /* 14CD30 80136D00 25087A00 */     addiu $t0, $t0, %lo(D_ovl29_80137A00)
  /* 14CD34 80136D04 24090007 */     addiu $t1, $zero, 7
  /* 14CD38 80136D08 AFB00020 */        sw $s0, 0x20($sp)
  /* 14CD3C 80136D0C AFAE0040 */        sw $t6, 0x40($sp)
  /* 14CD40 80136D10 AFAF0044 */        sw $t7, 0x44($sp)
  /* 14CD44 80136D14 AFA00048 */        sw $zero, 0x48($sp)
  /* 14CD48 80136D18 AFA0004C */        sw $zero, 0x4c($sp)
  /* 14CD4C 80136D1C AFB80050 */        sw $t8, 0x50($sp)
  /* 14CD50 80136D20 AFB90054 */        sw $t9, 0x54($sp)
  /* 14CD54 80136D24 AFA80058 */        sw $t0, 0x58($sp)
  /* 14CD58 80136D28 AFA9005C */        sw $t1, 0x5c($sp)
  /* 14CD5C 80136D2C 0C0337DE */       jal rdManagerInitSetup
  /* 14CD60 80136D30 27A40040 */     addiu $a0, $sp, 0x40
  /* 14CD64 80136D34 3C108013 */       lui $s0, %hi(D_ovl29_80136F50)
  /* 14CD68 80136D38 26106F50 */     addiu $s0, $s0, %lo(D_ovl29_80136F50)
  /* 14CD6C 80136D3C 02002025 */        or $a0, $s0, $zero
  /* 14CD70 80136D40 0C0337BB */       jal rdManagerGetAllocSize
  /* 14CD74 80136D44 2405000B */     addiu $a1, $zero, 0xb
  /* 14CD78 80136D48 00402025 */        or $a0, $v0, $zero
  /* 14CD7C 80136D4C 0C001260 */       jal gsMemoryAlloc
  /* 14CD80 80136D50 24050010 */     addiu $a1, $zero, 0x10
  /* 14CD84 80136D54 3C068013 */       lui $a2, %hi(D_ovl29_80137DF8)
  /* 14CD88 80136D58 24C67DF8 */     addiu $a2, $a2, %lo(D_ovl29_80137DF8)
  /* 14CD8C 80136D5C 02002025 */        or $a0, $s0, $zero
  /* 14CD90 80136D60 2405000B */     addiu $a1, $zero, 0xb
  /* 14CD94 80136D64 0C033781 */       jal rdManagerLoadFiles
  /* 14CD98 80136D68 00403825 */        or $a3, $v0, $zero
  /* 14CD9C 80136D6C 3C108000 */       lui $s0, %hi(D_NF_80000001)
  /* 14CDA0 80136D70 3C058013 */       lui $a1, %hi(mnBonusMain)
  /* 14CDA4 80136D74 24A569D0 */     addiu $a1, $a1, %lo(mnBonusMain)
  /* 14CDA8 80136D78 02003825 */        or $a3, $s0, $zero
  /* 14CDAC 80136D7C 24040400 */     addiu $a0, $zero, 0x400
  /* 14CDB0 80136D80 0C00265A */       jal omMakeGObjSPAfter
  /* 14CDB4 80136D84 2406000F */     addiu $a2, $zero, 0xf
  /* 14CDB8 80136D88 24040010 */     addiu $a0, $zero, 0x10
  /* 14CDBC 80136D8C 02002825 */        or $a1, $s0, $zero
  /* 14CDC0 80136D90 24060064 */     addiu $a2, $zero, 0x64
  /* 14CDC4 80136D94 24070001 */     addiu $a3, $zero, 1
  /* 14CDC8 80136D98 0C002E7F */       jal func_8000B9FC
  /* 14CDCC 80136D9C AFA00010 */        sw $zero, 0x10($sp)
  /* 14CDD0 80136DA0 0C045624 */       jal func_ovl2_80115890
  /* 14CDD4 80136DA4 00000000 */       nop
  /* 14CDD8 80136DA8 0C03F4C0 */       jal efManager_AllocUserData
  /* 14CDDC 80136DAC 00000000 */       nop
  /* 14CDE0 80136DB0 24040001 */     addiu $a0, $zero, 1
  /* 14CDE4 80136DB4 0C035C65 */       jal ftManagerAllocFighter
  /* 14CDE8 80136DB8 24050001 */     addiu $a1, $zero, 1
  /* 14CDEC 80136DBC 00008025 */        or $s0, $zero, $zero
  .L80136DC0:
  /* 14CDF0 80136DC0 0C035E1B */       jal ftManagerSetupDataKind
  /* 14CDF4 80136DC4 02002025 */        or $a0, $s0, $zero
  /* 14CDF8 80136DC8 26100001 */     addiu $s0, $s0, %lo(D_NF_80000001)
  /* 14CDFC 80136DCC 2401000C */     addiu $at, $zero, 0xc
  /* 14CE00 80136DD0 1601FFFB */       bne $s0, $at, .L80136DC0
  /* 14CE04 80136DD4 00000000 */       nop
  /* 14CE08 80136DD8 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 14CE0C 80136DDC 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 14CE10 80136DE0 0C001260 */       jal gsMemoryAlloc
  /* 14CE14 80136DE4 24050010 */     addiu $a1, $zero, 0x10
  /* 14CE18 80136DE8 3C018013 */       lui $at, %hi(gMNBonusAnimHeap)
  /* 14CE1C 80136DEC 0C04DAD5 */       jal mnBonusLoadMatchInfo
  /* 14CE20 80136DF0 AC227710 */        sw $v0, %lo(gMNBonusAnimHeap)($at)
  /* 14CE24 80136DF4 0C04CB05 */       jal mnBonusCreatePortraitViewport
  /* 14CE28 80136DF8 00000000 */       nop
  /* 14CE2C 80136DFC 0C04D76A */       jal mnBonusCreateCursorViewport
  /* 14CE30 80136E00 00000000 */       nop
  /* 14CE34 80136E04 0C04D792 */       jal mnBonusCreateDroppedTokenViewport
  /* 14CE38 80136E08 00000000 */       nop
  /* 14CE3C 80136E0C 0C04CB7D */       jal mnBonusCreatePanelViewport
  /* 14CE40 80136E10 00000000 */       nop
  /* 14CE44 80136E14 0C04D09D */       jal mnBonusCreateFighterViewport
  /* 14CE48 80136E18 00000000 */       nop
  /* 14CE4C 80136E1C 0C04CB2D */       jal mnBonusCreatePortraitBackgroundViewport
  /* 14CE50 80136E20 00000000 */       nop
  /* 14CE54 80136E24 0C04CB55 */       jal mnBonusCreatePortraitWhiteBackgroundViewport
  /* 14CE58 80136E28 00000000 */       nop
  /* 14CE5C 80136E2C 0C04CC5C */       jal mnBonusCreateBackgroundViewport
  /* 14CE60 80136E30 00000000 */       nop
  /* 14CE64 80136E34 0C04CCDC */       jal mnBonusCreateTitleOptionsAndBackViewport
  /* 14CE68 80136E38 00000000 */       nop
  /* 14CE6C 80136E3C 0C04D742 */       jal mnBonusCreateReadyToFightViewport
  /* 14CE70 80136E40 00000000 */       nop
  /* 14CE74 80136E44 0C04CC33 */       jal mnBonusCreateBackground
  /* 14CE78 80136E48 00000000 */       nop
  /* 14CE7C 80136E4C 0C04CA96 */       jal mnBonusCreatePortraits
  /* 14CE80 80136E50 00000000 */       nop
  /* 14CE84 80136E54 3C048013 */       lui $a0, %hi(gMNBonusHumanPanelPort)
  /* 14CE88 80136E58 0C04DB05 */       jal mnBonusInitPanel
  /* 14CE8C 80136E5C 8C8476F8 */        lw $a0, %lo(gMNBonusHumanPanelPort)($a0)
  /* 14CE90 80136E60 0C04CC86 */       jal mnBonusDrawTitleAndBack
  /* 14CE94 80136E64 00000000 */       nop
  /* 14CE98 80136E68 0C04DB22 */       jal mnBonusAreAllCompleted
  /* 14CE9C 80136E6C 00000000 */       nop
  /* 14CEA0 80136E70 10400003 */      beqz $v0, .L80136E80
  /* 14CEA4 80136E74 00000000 */       nop
  /* 14CEA8 80136E78 0C04CF07 */       jal mnDrawBonusTotalTime
  /* 14CEAC 80136E7C 00000000 */       nop
  .L80136E80:
  /* 14CEB0 80136E80 0C04D927 */       jal mnBonusCreateTokenAutopositionRoutine
  /* 14CEB4 80136E84 00000000 */       nop
  /* 14CEB8 80136E88 0C04D96E */       jal mnBonusCreateWhiteCircles
  /* 14CEBC 80136E8C 00000000 */       nop
  /* 14CEC0 80136E90 0C04D9C1 */       jal mnBonusCreateReadyToFightObjects
  /* 14CEC4 80136E94 00000000 */       nop
  /* 14CEC8 80136E98 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 14CECC 80136E9C 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 14CED0 80136EA0 240A00FF */     addiu $t2, $zero, 0xff
  /* 14CED4 80136EA4 240B00FF */     addiu $t3, $zero, 0xff
  /* 14CED8 80136EA8 AFAB0014 */        sw $t3, 0x14($sp)
  /* 14CEDC 80136EAC AFAA0010 */        sw $t2, 0x10($sp)
  /* 14CEE0 80136EB0 240600FF */     addiu $a2, $zero, 0xff
  /* 14CEE4 80136EB4 240700FF */     addiu $a3, $zero, 0xff
  /* 14CEE8 80136EB8 0C0E4138 */       jal func_ovl1_803904E0
  /* 14CEEC 80136EBC 46006386 */     mov.s $f14, $f12
  /* 14CEF0 80136EC0 3C0C800A */       lui $t4, %hi((gSceneData + 0x1))
  /* 14CEF4 80136EC4 918C4AD1 */       lbu $t4, %lo((gSceneData + 0x1))($t4)
  /* 14CEF8 80136EC8 24010015 */     addiu $at, $zero, 0x15
  /* 14CEFC 80136ECC 00002025 */        or $a0, $zero, $zero
  /* 14CF00 80136ED0 51810004 */      beql $t4, $at, .L80136EE4
  /* 14CF04 80136ED4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14CF08 80136ED8 0C0082AD */       jal func_80020AB4
  /* 14CF0C 80136EDC 2405000A */     addiu $a1, $zero, 0xa
  /* 14CF10 80136EE0 8FBF0024 */        lw $ra, 0x24($sp)
  .L80136EE4:
  /* 14CF14 80136EE4 8FB00020 */        lw $s0, 0x20($sp)
  /* 14CF18 80136EE8 27BD0068 */     addiu $sp, $sp, 0x68
  /* 14CF1C 80136EEC 03E00008 */        jr $ra
  /* 14CF20 80136EF0 00000000 */       nop

glabel bonus_css_entry
  /* 14CF24 80136EF4 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 14CF28 80136EF8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14CF2C 80136EFC 3C048013 */       lui $a0, %hi(D_ovl29_80137530)
  /* 14CF30 80136F00 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 14CF34 80136F04 24847530 */     addiu $a0, $a0, %lo(D_ovl29_80137530)
  /* 14CF38 80136F08 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14CF3C 80136F0C 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 14CF40 80136F10 0C001C09 */       jal func_80007024
  /* 14CF44 80136F14 AC8F000C */        sw $t7, 0xc($a0) # D_ovl29_80137530 + 12
  /* 14CF48 80136F18 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 14CF4C 80136F1C 3C198013 */       lui $t9, %hi(D_NF_80137E30)
  /* 14CF50 80136F20 3C048013 */       lui $a0, %hi(D_ovl29_8013754C)
  /* 14CF54 80136F24 27397E30 */     addiu $t9, $t9, %lo(D_NF_80137E30)
  /* 14CF58 80136F28 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 14CF5C 80136F2C 2484754C */     addiu $a0, $a0, %lo(D_ovl29_8013754C)
  /* 14CF60 80136F30 03194023 */      subu $t0, $t8, $t9
  /* 14CF64 80136F34 0C001A0F */       jal gsGTLSceneInit
  /* 14CF68 80136F38 AC880010 */        sw $t0, 0x10($a0) # D_ovl29_8013754C + 16
  /* 14CF6C 80136F3C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14CF70 80136F40 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14CF74 80136F44 03E00008 */        jr $ra
  /* 14CF78 80136F48 00000000 */       nop

  /* 14CF7C 80136F4C 00000000 */       nop

# Likely start of new file
#glabel D_ovl29_80136F50   # Routine parsed as data
#  /* 14CF80 80136F50 00000011 */      mthi $zero
#  /* 14CF84 80136F54 00000014 */     dsllv $zero, $zero, $zero
#  /* 14CF88 80136F58 00000015 */      dlsa $zero, $zero, $zero, 1
#  /* 14CF8C 80136F5C 00000012 */      mflo $zero
#  /* 14CF90 80136F60 00000013 */      mtlo $zero
#  /* 14CF94 80136F64 00000017 */     dsrav $zero, $zero, $zero
#  /* 14CF98 80136F68 00000018 */      mult $zero, $zero
#  /* 14CF9C 80136F6C 00000019 */     multu $zero, $zero
#  /* 14CFA0 80136F70 00000021 */      addu $zero, $zero, $zero
#  /* 14CFA4 80136F74 00000024 */       and $zero, $zero, $zero
#  /* 14CFA8 80136F78 00000016 */     dsrlv $zero, $zero, $zero
#  /* 14CFAC 80136F7C 00000000 */       nop
#  /* 14CFB0 80136F80 20202000 */      addi $zero, $at, 0x2000
#  /* 14CFB4 80136F84 20202000 */      addi $zero, $at, 0x2000
#  /* 14CFB8 80136F88 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 14CFBC 80136F8C FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 14CFC0 80136F90 14141400 */       bne $zero, $s4, 0x8013bf94 # branch target not found
#  /* 14CFC4 80136F94 00000000 */       nop
#  /* 14CFC8 80136F98 20202000 */      addi $zero, $at, 0x2000
#  /* 14CFCC 80136F9C 20202000 */      addi $zero, $at, 0x2000
#  /* 14CFD0 80136FA0 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 14CFD4 80136FA4 FFFFFF00 */        sd $ra, -0x100($ra)
