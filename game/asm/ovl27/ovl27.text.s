.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x801385B0

glabel mn1PSetupDisplayList
  /* 139D00 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 139D04 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 139D08 80131B08 8C830000 */        lw $v1, ($a0)
  /* 139D0C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 139D10 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 139D14 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 139D18 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 139D1C 80131B1C 3C180002 */       lui $t8, 2
  /* 139D20 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 139D24 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 139D28 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 139D2C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 139D30 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 139D34 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 139D38 80131B38 44060000 */      mfc1 $a2, $f0
  /* 139D3C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 139D40 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 139D44 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 139D48 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 139D4C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 139D50 80131B50 03E00008 */        jr $ra
  /* 139D54 80131B54 00000000 */       nop

glabel mn1PPow
  /* 139D58 80131B58 14A00003 */      bnez $a1, .L80131B68
  /* 139D5C 80131B5C 00801825 */        or $v1, $a0, $zero
  /* 139D60 80131B60 03E00008 */        jr $ra
  /* 139D64 80131B64 24020001 */     addiu $v0, $zero, 1

  .L80131B68:
  /* 139D68 80131B68 28A10002 */      slti $at, $a1, 2
  /* 139D6C 80131B6C 1420001F */      bnez $at, .L80131BEC
  /* 139D70 80131B70 00A01025 */        or $v0, $a1, $zero
  /* 139D74 80131B74 24A7FFFF */     addiu $a3, $a1, -1
  /* 139D78 80131B78 30E70003 */      andi $a3, $a3, 3
  /* 139D7C 80131B7C 00073823 */      negu $a3, $a3
  /* 139D80 80131B80 10E00008 */      beqz $a3, .L80131BA4
  /* 139D84 80131B84 00E53021 */      addu $a2, $a3, $a1
  .L80131B88:
  /* 139D88 80131B88 00640019 */     multu $v1, $a0
  /* 139D8C 80131B8C 2442FFFF */     addiu $v0, $v0, -1
  /* 139D90 80131B90 00001812 */      mflo $v1
  /* 139D94 80131B94 14C2FFFC */       bne $a2, $v0, .L80131B88
  /* 139D98 80131B98 00000000 */       nop
  /* 139D9C 80131B9C 24050001 */     addiu $a1, $zero, 1
  /* 139DA0 80131BA0 10450012 */       beq $v0, $a1, .L80131BEC
  .L80131BA4:
  /* 139DA4 80131BA4 24050001 */     addiu $a1, $zero, 1
  .L80131BA8:
  /* 139DA8 80131BA8 00640019 */     multu $v1, $a0
  /* 139DAC 80131BAC 2442FFFC */     addiu $v0, $v0, -4
  /* 139DB0 80131BB0 00001812 */      mflo $v1
  /* 139DB4 80131BB4 00000000 */       nop
  /* 139DB8 80131BB8 00000000 */       nop
  /* 139DBC 80131BBC 00640019 */     multu $v1, $a0
  /* 139DC0 80131BC0 00001812 */      mflo $v1
  /* 139DC4 80131BC4 00000000 */       nop
  /* 139DC8 80131BC8 00000000 */       nop
  /* 139DCC 80131BCC 00640019 */     multu $v1, $a0
  /* 139DD0 80131BD0 00001812 */      mflo $v1
  /* 139DD4 80131BD4 00000000 */       nop
  /* 139DD8 80131BD8 00000000 */       nop
  /* 139DDC 80131BDC 00640019 */     multu $v1, $a0
  /* 139DE0 80131BE0 00001812 */      mflo $v1
  /* 139DE4 80131BE4 1445FFF0 */       bne $v0, $a1, .L80131BA8
  /* 139DE8 80131BE8 00000000 */       nop
  .L80131BEC:
  /* 139DEC 80131BEC 00601025 */        or $v0, $v1, $zero
  /* 139DF0 80131BF0 03E00008 */        jr $ra
  /* 139DF4 80131BF4 00000000 */       nop

glabel mn1PSetTextureColors
  /* 139DF8 80131BF8 948E0024 */       lhu $t6, 0x24($a0)
  /* 139DFC 80131BFC 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 139E00 80131C00 A4980024 */        sh $t8, 0x24($a0)
  /* 139E04 80131C04 37190001 */       ori $t9, $t8, 1
  /* 139E08 80131C08 A4990024 */        sh $t9, 0x24($a0)
  /* 139E0C 80131C0C 8CA80000 */        lw $t0, ($a1)
  /* 139E10 80131C10 A0880060 */        sb $t0, 0x60($a0)
  /* 139E14 80131C14 8CA90004 */        lw $t1, 4($a1)
  /* 139E18 80131C18 A0890061 */        sb $t1, 0x61($a0)
  /* 139E1C 80131C1C 8CAA0008 */        lw $t2, 8($a1)
  /* 139E20 80131C20 A08A0062 */        sb $t2, 0x62($a0)
  /* 139E24 80131C24 8CAB000C */        lw $t3, 0xc($a1)
  /* 139E28 80131C28 A08B0028 */        sb $t3, 0x28($a0)
  /* 139E2C 80131C2C 8CAC0010 */        lw $t4, 0x10($a1)
  /* 139E30 80131C30 A08C0029 */        sb $t4, 0x29($a0)
  /* 139E34 80131C34 8CAD0014 */        lw $t5, 0x14($a1)
  /* 139E38 80131C38 03E00008 */        jr $ra
  /* 139E3C 80131C3C A08D002A */        sb $t5, 0x2a($a0)

glabel mn1PGetNumberOfDigits
  /* 139E40 80131C40 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 139E44 80131C44 AFB20020 */        sw $s2, 0x20($sp)
  /* 139E48 80131C48 AFB1001C */        sw $s1, 0x1c($sp)
  /* 139E4C 80131C4C 00809025 */        or $s2, $a0, $zero
  /* 139E50 80131C50 AFBF0024 */        sw $ra, 0x24($sp)
  /* 139E54 80131C54 AFB00018 */        sw $s0, 0x18($sp)
  /* 139E58 80131C58 18A0001D */      blez $a1, .L80131CD0
  /* 139E5C 80131C5C 00A08825 */        or $s1, $a1, $zero
  .L80131C60:
  /* 139E60 80131C60 2630FFFF */     addiu $s0, $s1, -1
  /* 139E64 80131C64 02002825 */        or $a1, $s0, $zero
  /* 139E68 80131C68 0C04C6D6 */       jal mn1PPow
  /* 139E6C 80131C6C 2404000A */     addiu $a0, $zero, 0xa
  /* 139E70 80131C70 10400011 */      beqz $v0, .L80131CB8
  /* 139E74 80131C74 00001825 */        or $v1, $zero, $zero
  /* 139E78 80131C78 2404000A */     addiu $a0, $zero, 0xa
  /* 139E7C 80131C7C 0C04C6D6 */       jal mn1PPow
  /* 139E80 80131C80 02002825 */        or $a1, $s0, $zero
  /* 139E84 80131C84 0242001A */       div $zero, $s2, $v0
  /* 139E88 80131C88 00001812 */      mflo $v1
  /* 139E8C 80131C8C 14400002 */      bnez $v0, .L80131C98
  /* 139E90 80131C90 00000000 */       nop
  /* 139E94 80131C94 0007000D */     break 7
  .L80131C98:
  /* 139E98 80131C98 2401FFFF */     addiu $at, $zero, -1
  /* 139E9C 80131C9C 14410004 */       bne $v0, $at, .L80131CB0
  /* 139EA0 80131CA0 3C018000 */       lui $at, 0x8000
  /* 139EA4 80131CA4 16410002 */       bne $s2, $at, .L80131CB0
  /* 139EA8 80131CA8 00000000 */       nop
  /* 139EAC 80131CAC 0006000D */     break 6
  .L80131CB0:
  /* 139EB0 80131CB0 10000001 */         b .L80131CB8
  /* 139EB4 80131CB4 00000000 */       nop
  .L80131CB8:
  /* 139EB8 80131CB8 10600003 */      beqz $v1, .L80131CC8
  /* 139EBC 80131CBC 00000000 */       nop
  /* 139EC0 80131CC0 10000004 */         b .L80131CD4
  /* 139EC4 80131CC4 02201025 */        or $v0, $s1, $zero
  .L80131CC8:
  /* 139EC8 80131CC8 1600FFE5 */      bnez $s0, .L80131C60
  /* 139ECC 80131CCC 02008825 */        or $s1, $s0, $zero
  .L80131CD0:
  /* 139ED0 80131CD0 00001025 */        or $v0, $zero, $zero
  .L80131CD4:
  /* 139ED4 80131CD4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 139ED8 80131CD8 8FB00018 */        lw $s0, 0x18($sp)
  /* 139EDC 80131CDC 8FB1001C */        lw $s1, 0x1c($sp)
  /* 139EE0 80131CE0 8FB20020 */        lw $s2, 0x20($sp)
  /* 139EE4 80131CE4 03E00008 */        jr $ra
  /* 139EE8 80131CE8 27BD0028 */     addiu $sp, $sp, 0x28

glabel mn1PCreateSmallerNumber
  /* 139EEC 80131CEC 27BDFF68 */     addiu $sp, $sp, -0x98
  /* 139EF0 80131CF0 F7B80028 */      sdc1 $f24, 0x28($sp)
  /* 139EF4 80131CF4 3C0E8014 */       lui $t6, %hi(dMN1PSmallerNumberOffsets)
  /* 139EF8 80131CF8 AFBE0050 */        sw $fp, 0x50($sp)
  /* 139EFC 80131CFC AFB3003C */        sw $s3, 0x3c($sp)
  /* 139F00 80131D00 27A20070 */     addiu $v0, $sp, 0x70
  /* 139F04 80131D04 25CE8690 */     addiu $t6, $t6, %lo(dMN1PSmallerNumberOffsets)
  /* 139F08 80131D08 4487C000 */      mtc1 $a3, $f24
  /* 139F0C 80131D0C 00A09825 */        or $s3, $a1, $zero
  /* 139F10 80131D10 0080F025 */        or $fp, $a0, $zero
  /* 139F14 80131D14 AFBF0054 */        sw $ra, 0x54($sp)
  /* 139F18 80131D18 AFB7004C */        sw $s7, 0x4c($sp)
  /* 139F1C 80131D1C AFB60048 */        sw $s6, 0x48($sp)
  /* 139F20 80131D20 AFB50044 */        sw $s5, 0x44($sp)
  /* 139F24 80131D24 AFB40040 */        sw $s4, 0x40($sp)
  /* 139F28 80131D28 AFB20038 */        sw $s2, 0x38($sp)
  /* 139F2C 80131D2C AFB10034 */        sw $s1, 0x34($sp)
  /* 139F30 80131D30 AFB00030 */        sw $s0, 0x30($sp)
  /* 139F34 80131D34 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 139F38 80131D38 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 139F3C 80131D3C AFA600A0 */        sw $a2, 0xa0($sp)
  /* 139F40 80131D40 25C80024 */     addiu $t0, $t6, 0x24
  /* 139F44 80131D44 0040C825 */        or $t9, $v0, $zero
  .L80131D48:
  /* 139F48 80131D48 8DD80000 */        lw $t8, ($t6) # dMN1PSmallerNumberOffsets + 0
  /* 139F4C 80131D4C 25CE000C */     addiu $t6, $t6, 0xc
  /* 139F50 80131D50 2739000C */     addiu $t9, $t9, 0xc
  /* 139F54 80131D54 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 139F58 80131D58 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PSmallerNumberOffsets + -8
  /* 139F5C 80131D5C AF2FFFF8 */        sw $t7, -8($t9)
  /* 139F60 80131D60 8DD8FFFC */        lw $t8, -4($t6) # dMN1PSmallerNumberOffsets + -4
  /* 139F64 80131D64 15C8FFF8 */       bne $t6, $t0, .L80131D48
  /* 139F68 80131D68 AF38FFFC */        sw $t8, -4($t9)
  /* 139F6C 80131D6C 8DD80000 */        lw $t8, ($t6) # dMN1PSmallerNumberOffsets + 0
  /* 139F70 80131D70 2416000A */     addiu $s6, $zero, 0xa
  /* 139F74 80131D74 3C178014 */       lui $s7, %hi(D_ovl27_801396A0)
  /* 139F78 80131D78 AF380000 */        sw $t8, ($t9)
  /* 139F7C 80131D7C 06610002 */      bgez $s3, .L80131D88
  /* 139F80 80131D80 C7B400A0 */      lwc1 $f20, 0xa0($sp)
  /* 139F84 80131D84 00009825 */        or $s3, $zero, $zero
  .L80131D88:
  /* 139F88 80131D88 0276001A */       div $zero, $s3, $s6
  /* 139F8C 80131D8C 00004810 */      mfhi $t1
  /* 139F90 80131D90 00095080 */       sll $t2, $t1, 2
  /* 139F94 80131D94 26F796A0 */     addiu $s7, $s7, %lo(D_ovl27_801396A0)
  /* 139F98 80131D98 004A5821 */      addu $t3, $v0, $t2
  /* 139F9C 80131D9C 8D6C0000 */        lw $t4, ($t3)
  /* 139FA0 80131DA0 8EED0024 */        lw $t5, 0x24($s7) # D_ovl27_801396A0 + 36
  /* 139FA4 80131DA4 03C02025 */        or $a0, $fp, $zero
  /* 139FA8 80131DA8 16C00002 */      bnez $s6, .L80131DB4
  /* 139FAC 80131DAC 00000000 */       nop
  /* 139FB0 80131DB0 0007000D */     break 7
  .L80131DB4:
  /* 139FB4 80131DB4 2401FFFF */     addiu $at, $zero, -1
  /* 139FB8 80131DB8 16C10004 */       bne $s6, $at, .L80131DCC
  /* 139FBC 80131DBC 3C018000 */       lui $at, 0x8000
  /* 139FC0 80131DC0 16610002 */       bne $s3, $at, .L80131DCC
  /* 139FC4 80131DC4 00000000 */       nop
  /* 139FC8 80131DC8 0006000D */     break 6
  .L80131DCC:
  /* 139FCC 80131DCC 018D2821 */      addu $a1, $t4, $t5
  /* 139FD0 80131DD0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 139FD4 80131DD4 00000000 */       nop
  /* 139FD8 80131DD8 8FB400A8 */        lw $s4, 0xa8($sp)
  /* 139FDC 80131DDC 00408025 */        or $s0, $v0, $zero
  /* 139FE0 80131DE0 00402025 */        or $a0, $v0, $zero
  /* 139FE4 80131DE4 0C04C6FE */       jal mn1PSetTextureColors
  /* 139FE8 80131DE8 02802825 */        or $a1, $s4, $zero
  /* 139FEC 80131DEC 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 139FF0 80131DF0 4481B000 */      mtc1 $at, $f22 # 8.0 to cop1
  /* 139FF4 80131DF4 C7A400A0 */      lwc1 $f4, 0xa0($sp)
  /* 139FF8 80131DF8 8FB500B0 */        lw $s5, 0xb0($sp)
  /* 139FFC 80131DFC E618005C */      swc1 $f24, 0x5c($s0)
  /* 13A000 80131E00 46162501 */     sub.s $f20, $f4, $f22
  /* 13A004 80131E04 24110001 */     addiu $s1, $zero, 1
  /* 13A008 80131E08 12A00004 */      beqz $s5, .L80131E1C
  /* 13A00C 80131E0C E6140058 */      swc1 $f20, 0x58($s0)
  /* 13A010 80131E10 8FB200AC */        lw $s2, 0xac($sp)
  /* 13A014 80131E14 10000006 */         b .L80131E30
  /* 13A018 80131E18 02401825 */        or $v1, $s2, $zero
  .L80131E1C:
  /* 13A01C 80131E1C 8FB200AC */        lw $s2, 0xac($sp)
  /* 13A020 80131E20 02602025 */        or $a0, $s3, $zero
  /* 13A024 80131E24 0C04C710 */       jal mn1PGetNumberOfDigits
  /* 13A028 80131E28 02402825 */        or $a1, $s2, $zero
  /* 13A02C 80131E2C 00401825 */        or $v1, $v0, $zero
  .L80131E30:
  /* 13A030 80131E30 28610002 */      slti $at, $v1, 2
  /* 13A034 80131E34 1420003A */      bnez $at, .L80131F20
  /* 13A038 80131E38 02C02025 */        or $a0, $s6, $zero
  .L80131E3C:
  /* 13A03C 80131E3C 0C04C6D6 */       jal mn1PPow
  /* 13A040 80131E40 02202825 */        or $a1, $s1, $zero
  /* 13A044 80131E44 10400011 */      beqz $v0, .L80131E8C
  /* 13A048 80131E48 00001825 */        or $v1, $zero, $zero
  /* 13A04C 80131E4C 02C02025 */        or $a0, $s6, $zero
  /* 13A050 80131E50 0C04C6D6 */       jal mn1PPow
  /* 13A054 80131E54 02202825 */        or $a1, $s1, $zero
  /* 13A058 80131E58 0262001A */       div $zero, $s3, $v0
  /* 13A05C 80131E5C 00001812 */      mflo $v1
  /* 13A060 80131E60 14400002 */      bnez $v0, .L80131E6C
  /* 13A064 80131E64 00000000 */       nop
  /* 13A068 80131E68 0007000D */     break 7
  .L80131E6C:
  /* 13A06C 80131E6C 2401FFFF */     addiu $at, $zero, -1
  /* 13A070 80131E70 14410004 */       bne $v0, $at, .L80131E84
  /* 13A074 80131E74 3C018000 */       lui $at, 0x8000
  /* 13A078 80131E78 16610002 */       bne $s3, $at, .L80131E84
  /* 13A07C 80131E7C 00000000 */       nop
  /* 13A080 80131E80 0006000D */     break 6
  .L80131E84:
  /* 13A084 80131E84 10000001 */         b .L80131E8C
  /* 13A088 80131E88 00000000 */       nop
  .L80131E8C:
  /* 13A08C 80131E8C 0076001A */       div $zero, $v1, $s6
  /* 13A090 80131E90 00004010 */      mfhi $t0
  /* 13A094 80131E94 00087080 */       sll $t6, $t0, 2
  /* 13A098 80131E98 03AEC821 */      addu $t9, $sp, $t6
  /* 13A09C 80131E9C 8F390070 */        lw $t9, 0x70($t9)
  /* 13A0A0 80131EA0 8EEF0024 */        lw $t7, 0x24($s7) # D_ovl27_801396A0 + 36
  /* 13A0A4 80131EA4 03C02025 */        or $a0, $fp, $zero
  /* 13A0A8 80131EA8 16C00002 */      bnez $s6, .L80131EB4
  /* 13A0AC 80131EAC 00000000 */       nop
  /* 13A0B0 80131EB0 0007000D */     break 7
  .L80131EB4:
  /* 13A0B4 80131EB4 2401FFFF */     addiu $at, $zero, -1
  /* 13A0B8 80131EB8 16C10004 */       bne $s6, $at, .L80131ECC
  /* 13A0BC 80131EBC 3C018000 */       lui $at, 0x8000
  /* 13A0C0 80131EC0 14610002 */       bne $v1, $at, .L80131ECC
  /* 13A0C4 80131EC4 00000000 */       nop
  /* 13A0C8 80131EC8 0006000D */     break 6
  .L80131ECC:
  /* 13A0CC 80131ECC 032F2821 */      addu $a1, $t9, $t7
  /* 13A0D0 80131ED0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13A0D4 80131ED4 00000000 */       nop
  /* 13A0D8 80131ED8 00408025 */        or $s0, $v0, $zero
  /* 13A0DC 80131EDC 00402025 */        or $a0, $v0, $zero
  /* 13A0E0 80131EE0 0C04C6FE */       jal mn1PSetTextureColors
  /* 13A0E4 80131EE4 02802825 */        or $a1, $s4, $zero
  /* 13A0E8 80131EE8 4616A501 */     sub.s $f20, $f20, $f22
  /* 13A0EC 80131EEC 26310001 */     addiu $s1, $s1, 1
  /* 13A0F0 80131EF0 E618005C */      swc1 $f24, 0x5c($s0)
  /* 13A0F4 80131EF4 12A00003 */      beqz $s5, .L80131F04
  /* 13A0F8 80131EF8 E6140058 */      swc1 $f20, 0x58($s0)
  /* 13A0FC 80131EFC 10000005 */         b .L80131F14
  /* 13A100 80131F00 02401825 */        or $v1, $s2, $zero
  .L80131F04:
  /* 13A104 80131F04 02602025 */        or $a0, $s3, $zero
  /* 13A108 80131F08 0C04C710 */       jal mn1PGetNumberOfDigits
  /* 13A10C 80131F0C 02402825 */        or $a1, $s2, $zero
  /* 13A110 80131F10 00401825 */        or $v1, $v0, $zero
  .L80131F14:
  /* 13A114 80131F14 0223082A */       slt $at, $s1, $v1
  /* 13A118 80131F18 5420FFC8 */      bnel $at, $zero, .L80131E3C
  /* 13A11C 80131F1C 02C02025 */        or $a0, $s6, $zero
  .L80131F20:
  /* 13A120 80131F20 8FBF0054 */        lw $ra, 0x54($sp)
  /* 13A124 80131F24 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 13A128 80131F28 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13A12C 80131F2C D7B80028 */      ldc1 $f24, 0x28($sp)
  /* 13A130 80131F30 8FB00030 */        lw $s0, 0x30($sp)
  /* 13A134 80131F34 8FB10034 */        lw $s1, 0x34($sp)
  /* 13A138 80131F38 8FB20038 */        lw $s2, 0x38($sp)
  /* 13A13C 80131F3C 8FB3003C */        lw $s3, 0x3c($sp)
  /* 13A140 80131F40 8FB40040 */        lw $s4, 0x40($sp)
  /* 13A144 80131F44 8FB50044 */        lw $s5, 0x44($sp)
  /* 13A148 80131F48 8FB60048 */        lw $s6, 0x48($sp)
  /* 13A14C 80131F4C 8FB7004C */        lw $s7, 0x4c($sp)
  /* 13A150 80131F50 8FBE0050 */        lw $fp, 0x50($sp)
  /* 13A154 80131F54 03E00008 */        jr $ra
  /* 13A158 80131F58 27BD0098 */     addiu $sp, $sp, 0x98

glabel mn1PGetChrIndex
  /* 13A15C 80131F5C AFA40000 */        sw $a0, ($sp)
  /* 13A160 80131F60 308400FF */      andi $a0, $a0, 0xff
  /* 13A164 80131F64 24010020 */     addiu $at, $zero, 0x20
  /* 13A168 80131F68 10810010 */       beq $a0, $at, .L80131FAC
  /* 13A16C 80131F6C 00801825 */        or $v1, $a0, $zero
  /* 13A170 80131F70 24010025 */     addiu $at, $zero, 0x25
  /* 13A174 80131F74 10810009 */       beq $a0, $at, .L80131F9C
  /* 13A178 80131F78 24010027 */     addiu $at, $zero, 0x27
  /* 13A17C 80131F7C 10810005 */       beq $a0, $at, .L80131F94
  /* 13A180 80131F80 2401002E */     addiu $at, $zero, 0x2e
  /* 13A184 80131F84 10810007 */       beq $a0, $at, .L80131FA4
  /* 13A188 80131F88 00000000 */       nop
  /* 13A18C 80131F8C 10000009 */         b .L80131FB4
  /* 13A190 80131F90 28610041 */      slti $at, $v1, 0x41
  .L80131F94:
  /* 13A194 80131F94 03E00008 */        jr $ra
  /* 13A198 80131F98 2402001A */     addiu $v0, $zero, 0x1a

  .L80131F9C:
  /* 13A19C 80131F9C 03E00008 */        jr $ra
  /* 13A1A0 80131FA0 2402001B */     addiu $v0, $zero, 0x1b

  .L80131FA4:
  /* 13A1A4 80131FA4 03E00008 */        jr $ra
  /* 13A1A8 80131FA8 2402001C */     addiu $v0, $zero, 0x1c

  .L80131FAC:
  /* 13A1AC 80131FAC 03E00008 */        jr $ra
  /* 13A1B0 80131FB0 2402001D */     addiu $v0, $zero, 0x1d

  .L80131FB4:
  /* 13A1B4 80131FB4 14200003 */      bnez $at, .L80131FC4
  /* 13A1B8 80131FB8 2861005B */      slti $at, $v1, 0x5b
  /* 13A1BC 80131FBC 14200003 */      bnez $at, .L80131FCC
  /* 13A1C0 80131FC0 2462FFBF */     addiu $v0, $v1, -0x41
  .L80131FC4:
  /* 13A1C4 80131FC4 03E00008 */        jr $ra
  /* 13A1C8 80131FC8 2402001D */     addiu $v0, $zero, 0x1d

  .L80131FCC:
  /* 13A1CC 80131FCC 03E00008 */        jr $ra
  /* 13A1D0 80131FD0 00000000 */       nop

glabel mn1PGetChrSpacing
  /* 13A1D4 80131FD4 00851021 */      addu $v0, $a0, $a1
  /* 13A1D8 80131FD8 904E0000 */       lbu $t6, ($v0)
  /* 13A1DC 80131FDC 25CFFFD9 */     addiu $t7, $t6, -0x27
  /* 13A1E0 80131FE0 2DE10033 */     sltiu $at, $t7, 0x33
  /* 13A1E4 80131FE4 10200038 */      beqz $at, jtgt_ovl27_801320C8
  /* 13A1E8 80131FE8 000F7880 */       sll $t7, $t7, 2
  /* 13A1EC 80131FEC 3C018014 */       lui $at, %hi(jtbl_ovl27_80138D60)
  /* 13A1F0 80131FF0 002F0821 */      addu $at, $at, $t7
  /* 13A1F4 80131FF4 8C2F8D60 */        lw $t7, %lo(jtbl_ovl27_80138D60)($at)
  /* 13A1F8 80131FF8 01E00008 */        jr $t7
  /* 13A1FC 80131FFC 00000000 */       nop
  glabel jtgt_ovl27_80132000
  /* 13A200 80132000 90580001 */       lbu $t8, 1($v0)
  /* 13A204 80132004 2719FFBA */     addiu $t9, $t8, -0x46
  /* 13A208 80132008 2F210014 */     sltiu $at, $t9, 0x14
  /* 13A20C 8013200C 10200009 */      beqz $at, jtgt_ovl27_80132034
  /* 13A210 80132010 0019C880 */       sll $t9, $t9, 2
  /* 13A214 80132014 3C018014 */       lui $at, %hi(D_ovl27_80138E2C)
  /* 13A218 80132018 00390821 */      addu $at, $at, $t9
  /* 13A21C 8013201C 8C398E2C */        lw $t9, %lo(D_ovl27_80138E2C)($at)
  /* 13A220 80132020 03200008 */        jr $t9
  /* 13A224 80132024 00000000 */       nop
  glabel jtgt_ovl27_80132028
  /* 13A228 80132028 44800000 */      mtc1 $zero, $f0
  /* 13A22C 8013202C 03E00008 */        jr $ra
  /* 13A230 80132030 00000000 */       nop

  glabel jtgt_ovl27_80132034
  /* 13A234 80132034 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13A238 80132038 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A23C 8013203C 03E00008 */        jr $ra
  /* 13A240 80132040 00000000 */       nop

  glabel jtgt_ovl27_80132044
  /* 13A244 80132044 90430001 */       lbu $v1, 1($v0)
  /* 13A248 80132048 24010041 */     addiu $at, $zero, 0x41
  /* 13A24C 8013204C 10610003 */       beq $v1, $at, .L8013205C
  /* 13A250 80132050 24010054 */     addiu $at, $zero, 0x54
  /* 13A254 80132054 54610005 */      bnel $v1, $at, .L8013206C
  /* 13A258 80132058 3C013F80 */       lui $at, 0x3f80
  .L8013205C:
  /* 13A25C 8013205C 44800000 */      mtc1 $zero, $f0
  /* 13A260 80132060 03E00008 */        jr $ra
  /* 13A264 80132064 00000000 */       nop

  /* 13A268 80132068 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  .L8013206C:
  /* 13A26C 8013206C 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A270 80132070 03E00008 */        jr $ra
  /* 13A274 80132074 00000000 */       nop

  glabel jtgt_ovl27_80132078
  /* 13A278 80132078 90430001 */       lbu $v1, 1($v0)
  /* 13A27C 8013207C 24010027 */     addiu $at, $zero, 0x27
  /* 13A280 80132080 10610002 */       beq $v1, $at, .L8013208C
  /* 13A284 80132084 2401002E */     addiu $at, $zero, 0x2e
  /* 13A288 80132088 14610004 */       bne $v1, $at, .L8013209C
  .L8013208C:
  /* 13A28C 8013208C 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13A290 80132090 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A294 80132094 03E00008 */        jr $ra
  /* 13A298 80132098 00000000 */       nop

  .L8013209C:
  /* 13A29C 8013209C 44800000 */      mtc1 $zero, $f0
  /* 13A2A0 801320A0 03E00008 */        jr $ra
  /* 13A2A4 801320A4 00000000 */       nop

  glabel jtgt_ovl27_801320A8
  /* 13A2A8 801320A8 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13A2AC 801320AC 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A2B0 801320B0 03E00008 */        jr $ra
  /* 13A2B4 801320B4 00000000 */       nop

  glabel jtgt_ovl27_801320B8
  /* 13A2B8 801320B8 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13A2BC 801320BC 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A2C0 801320C0 03E00008 */        jr $ra
  /* 13A2C4 801320C4 00000000 */       nop

  glabel jtgt_ovl27_801320C8
  /* 13A2C8 801320C8 90480001 */       lbu $t0, 1($v0)
  /* 13A2CC 801320CC 24010054 */     addiu $at, $zero, 0x54
  /* 13A2D0 801320D0 55010005 */      bnel $t0, $at, .L801320E8
  /* 13A2D4 801320D4 3C013F80 */       lui $at, 0x3f80
  /* 13A2D8 801320D8 44800000 */      mtc1 $zero, $f0
  /* 13A2DC 801320DC 03E00008 */        jr $ra
  /* 13A2E0 801320E0 00000000 */       nop

  /* 13A2E4 801320E4 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  .L801320E8:
  /* 13A2E8 801320E8 44810000 */      mtc1 $at, $f0 # 1.0 to cop1
  /* 13A2EC 801320EC 00000000 */       nop
  /* 13A2F0 801320F0 03E00008 */        jr $ra
  /* 13A2F4 801320F4 00000000 */       nop

glabel mn1PDrawString
  /* 13A2F8 801320F8 27BDFE80 */     addiu $sp, $sp, -0x180
  /* 13A2FC 801320FC AFB70064 */        sw $s7, 0x64($sp)
  /* 13A300 80132100 F7B80028 */      sdc1 $f24, 0x28($sp)
  /* 13A304 80132104 3C0E8014 */       lui $t6, %hi(dMN1PChrOffsets)
  /* 13A308 80132108 27B7010C */     addiu $s7, $sp, 0x10c
  /* 13A30C 8013210C AFBE0068 */        sw $fp, 0x68($sp)
  /* 13A310 80132110 AFB60060 */        sw $s6, 0x60($sp)
  /* 13A314 80132114 AFB5005C */        sw $s5, 0x5c($sp)
  /* 13A318 80132118 25CE86B8 */     addiu $t6, $t6, %lo(dMN1PChrOffsets)
  /* 13A31C 8013211C 4487C000 */      mtc1 $a3, $f24
  /* 13A320 80132120 44866000 */      mtc1 $a2, $f12
  /* 13A324 80132124 00A0A825 */        or $s5, $a1, $zero
  /* 13A328 80132128 0080B025 */        or $s6, $a0, $zero
  /* 13A32C 8013212C 27BE0098 */     addiu $fp, $sp, 0x98
  /* 13A330 80132130 AFBF006C */        sw $ra, 0x6c($sp)
  /* 13A334 80132134 AFB40058 */        sw $s4, 0x58($sp)
  /* 13A338 80132138 AFB30054 */        sw $s3, 0x54($sp)
  /* 13A33C 8013213C AFB20050 */        sw $s2, 0x50($sp)
  /* 13A340 80132140 AFB1004C */        sw $s1, 0x4c($sp)
  /* 13A344 80132144 AFB00048 */        sw $s0, 0x48($sp)
  /* 13A348 80132148 F7BE0040 */      sdc1 $f30, 0x40($sp)
  /* 13A34C 8013214C F7BC0038 */      sdc1 $f28, 0x38($sp)
  /* 13A350 80132150 F7BA0030 */      sdc1 $f26, 0x30($sp)
  /* 13A354 80132154 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 13A358 80132158 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 13A35C 8013215C 25C8006C */     addiu $t0, $t6, 0x6c
  /* 13A360 80132160 02E0C825 */        or $t9, $s7, $zero
  .L80132164:
  /* 13A364 80132164 8DD80000 */        lw $t8, ($t6) # dMN1PChrOffsets + 0
  /* 13A368 80132168 25CE000C */     addiu $t6, $t6, 0xc
  /* 13A36C 8013216C 2739000C */     addiu $t9, $t9, 0xc
  /* 13A370 80132170 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13A374 80132174 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PChrOffsets + -8
  /* 13A378 80132178 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13A37C 8013217C 8DD8FFFC */        lw $t8, -4($t6) # dMN1PChrOffsets + -4
  /* 13A380 80132180 15C8FFF8 */       bne $t6, $t0, .L80132164
  /* 13A384 80132184 AF38FFFC */        sw $t8, -4($t9)
  /* 13A388 80132188 8DD80000 */        lw $t8, ($t6) # dMN1PChrOffsets + 0
  /* 13A38C 8013218C 3C098014 */       lui $t1, %hi(dMN1PChrWidths)
  /* 13A390 80132190 2529872C */     addiu $t1, $t1, %lo(dMN1PChrWidths)
  /* 13A394 80132194 AF380000 */        sw $t8, ($t9)
  /* 13A398 80132198 8DCF0004 */        lw $t7, 4($t6) # dMN1PChrOffsets + 4
  /* 13A39C 8013219C 252D006C */     addiu $t5, $t1, 0x6c
  /* 13A3A0 801321A0 03C06025 */        or $t4, $fp, $zero
  /* 13A3A4 801321A4 AF2F0004 */        sw $t7, 4($t9)
  .L801321A8:
  /* 13A3A8 801321A8 8D2B0000 */        lw $t3, ($t1) # dMN1PChrWidths + 0
  /* 13A3AC 801321AC 2529000C */     addiu $t1, $t1, 0xc
  /* 13A3B0 801321B0 258C000C */     addiu $t4, $t4, 0xc
  /* 13A3B4 801321B4 AD8BFFF4 */        sw $t3, -0xc($t4)
  /* 13A3B8 801321B8 8D2AFFF8 */        lw $t2, -8($t1) # dMN1PChrWidths + -8
  /* 13A3BC 801321BC AD8AFFF8 */        sw $t2, -8($t4)
  /* 13A3C0 801321C0 8D2BFFFC */        lw $t3, -4($t1) # dMN1PChrWidths + -4
  /* 13A3C4 801321C4 152DFFF8 */       bne $t1, $t5, .L801321A8
  /* 13A3C8 801321C8 AD8BFFFC */        sw $t3, -4($t4)
  /* 13A3CC 801321CC 8D2B0000 */        lw $t3, ($t1) # dMN1PChrWidths + 0
  /* 13A3D0 801321D0 46006506 */     mov.s $f20, $f12
  /* 13A3D4 801321D4 00009025 */        or $s2, $zero, $zero
  /* 13A3D8 801321D8 AD8B0000 */        sw $t3, ($t4)
  /* 13A3DC 801321DC 8D2A0004 */        lw $t2, 4($t1) # dMN1PChrWidths + 4
  /* 13A3E0 801321E0 02A08825 */        or $s1, $s5, $zero
  /* 13A3E4 801321E4 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13A3E8 801321E8 AD8A0004 */        sw $t2, 4($t4)
  /* 13A3EC 801321EC 92A80000 */       lbu $t0, ($s5)
  /* 13A3F0 801321F0 8FB30190 */        lw $s3, 0x190($sp)
  /* 13A3F4 801321F4 24140020 */     addiu $s4, $zero, 0x20
  /* 13A3F8 801321F8 11000050 */      beqz $t0, .L8013233C
  /* 13A3FC 801321FC 310400FF */      andi $a0, $t0, 0xff
  /* 13A400 80132200 4481F000 */      mtc1 $at, $f30 # 1.0 to cop1
  /* 13A404 80132204 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 13A408 80132208 4481E000 */      mtc1 $at, $f28 # 4.0 to cop1
  /* 13A40C 8013220C 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13A410 80132210 4481D000 */      mtc1 $at, $f26 # 3.0 to cop1
  /* 13A414 80132214 00801025 */        or $v0, $a0, $zero
  .L80132218:
  /* 13A418 80132218 28410030 */      slti $at, $v0, 0x30
  /* 13A41C 8013221C 14200006 */      bnez $at, .L80132238
  /* 13A420 80132220 00001825 */        or $v1, $zero, $zero
  /* 13A424 80132224 2841003A */      slti $at, $v0, 0x3a
  /* 13A428 80132228 10200003 */      beqz $at, .L80132238
  /* 13A42C 8013222C 00000000 */       nop
  /* 13A430 80132230 10000001 */         b .L80132238
  /* 13A434 80132234 24030001 */     addiu $v1, $zero, 1
  .L80132238:
  /* 13A438 80132238 14600003 */      bnez $v1, .L80132248
  /* 13A43C 8013223C 00000000 */       nop
  /* 13A440 80132240 1682000A */       bne $s4, $v0, .L8013226C
  /* 13A444 80132244 00000000 */       nop
  .L80132248:
  /* 13A448 80132248 16820003 */       bne $s4, $v0, .L80132258
  /* 13A44C 8013224C 244EFFD0 */     addiu $t6, $v0, -0x30
  /* 13A450 80132250 10000035 */         b .L80132328
  /* 13A454 80132254 461AA500 */     add.s $f20, $f20, $f26
  .L80132258:
  /* 13A458 80132258 448E2000 */      mtc1 $t6, $f4 # -1.793202e-39 to cop1
  /* 13A45C 8013225C 00000000 */       nop
  /* 13A460 80132260 468021A0 */   cvt.s.w $f6, $f4
  /* 13A464 80132264 10000030 */         b .L80132328
  /* 13A468 80132268 4606A500 */     add.s $f20, $f20, $f6
  .L8013226C:
  /* 13A46C 8013226C 0C04C7D7 */       jal mn1PGetChrIndex
  /* 13A470 80132270 00000000 */       nop
  /* 13A474 80132274 0002C880 */       sll $t9, $v0, 2
  /* 13A478 80132278 02F97821 */      addu $t7, $s7, $t9
  /* 13A47C 8013227C 3C0D8014 */       lui $t5, %hi(D_ovl27_801396C0)
  /* 13A480 80132280 8DAD96C0 */        lw $t5, %lo(D_ovl27_801396C0)($t5)
  /* 13A484 80132284 8DF80000 */        lw $t8, ($t7)
  /* 13A488 80132288 02C02025 */        or $a0, $s6, $zero
  /* 13A48C 8013228C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13A490 80132290 030D2821 */      addu $a1, $t8, $t5
  /* 13A494 80132294 00408025 */        or $s0, $v0, $zero
  /* 13A498 80132298 E4540058 */      swc1 $f20, 0x58($v0)
  /* 13A49C 8013229C 02A02025 */        or $a0, $s5, $zero
  /* 13A4A0 801322A0 0C04C7F5 */       jal mn1PGetChrSpacing
  /* 13A4A4 801322A4 02402825 */        or $a1, $s2, $zero
  /* 13A4A8 801322A8 46000586 */     mov.s $f22, $f0
  /* 13A4AC 801322AC 0C04C7D7 */       jal mn1PGetChrIndex
  /* 13A4B0 801322B0 92240000 */       lbu $a0, ($s1)
  /* 13A4B4 801322B4 00024880 */       sll $t1, $v0, 2
  /* 13A4B8 801322B8 03C96021 */      addu $t4, $fp, $t1
  /* 13A4BC 801322BC C5880000 */      lwc1 $f8, ($t4)
  /* 13A4C0 801322C0 92230000 */       lbu $v1, ($s1)
  /* 13A4C4 801322C4 24010027 */     addiu $at, $zero, 0x27
  /* 13A4C8 801322C8 46164280 */     add.s $f10, $f8, $f22
  /* 13A4CC 801322CC 10610006 */       beq $v1, $at, .L801322E8
  /* 13A4D0 801322D0 460AA500 */     add.s $f20, $f20, $f10
  /* 13A4D4 801322D4 2401002E */     addiu $at, $zero, 0x2e
  /* 13A4D8 801322D8 50610007 */      beql $v1, $at, .L801322F8
  /* 13A4DC 801322DC 461CC480 */     add.s $f18, $f24, $f28
  /* 13A4E0 801322E0 10000006 */         b .L801322FC
  /* 13A4E4 801322E4 E618005C */      swc1 $f24, 0x5c($s0)
  .L801322E8:
  /* 13A4E8 801322E8 461EC401 */     sub.s $f16, $f24, $f30
  /* 13A4EC 801322EC 10000003 */         b .L801322FC
  /* 13A4F0 801322F0 E610005C */      swc1 $f16, 0x5c($s0)
  /* 13A4F4 801322F4 461CC480 */     add.s $f18, $f24, $f28
  .L801322F8:
  /* 13A4F8 801322F8 E612005C */      swc1 $f18, 0x5c($s0)
  .L801322FC:
  /* 13A4FC 801322FC 960A0024 */       lhu $t2, 0x24($s0)
  /* 13A500 80132300 3148FFDF */      andi $t0, $t2, 0xffdf
  /* 13A504 80132304 A6080024 */        sh $t0, 0x24($s0)
  /* 13A508 80132308 350E0001 */       ori $t6, $t0, 1
  /* 13A50C 8013230C A60E0024 */        sh $t6, 0x24($s0)
  /* 13A510 80132310 8E790000 */        lw $t9, ($s3)
  /* 13A514 80132314 A2190028 */        sb $t9, 0x28($s0)
  /* 13A518 80132318 8E6F0004 */        lw $t7, 4($s3)
  /* 13A51C 8013231C A20F0029 */        sb $t7, 0x29($s0)
  /* 13A520 80132320 8E780008 */        lw $t8, 8($s3)
  /* 13A524 80132324 A218002A */        sb $t8, 0x2a($s0)
  .L80132328:
  /* 13A528 80132328 92240001 */       lbu $a0, 1($s1)
  /* 13A52C 8013232C 26520001 */     addiu $s2, $s2, 1
  /* 13A530 80132330 26310001 */     addiu $s1, $s1, 1
  /* 13A534 80132334 1480FFB8 */      bnez $a0, .L80132218
  /* 13A538 80132338 00801025 */        or $v0, $a0, $zero
  .L8013233C:
  /* 13A53C 8013233C 8FBF006C */        lw $ra, 0x6c($sp)
  /* 13A540 80132340 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 13A544 80132344 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13A548 80132348 D7B80028 */      ldc1 $f24, 0x28($sp)
  /* 13A54C 8013234C D7BA0030 */      ldc1 $f26, 0x30($sp)
  /* 13A550 80132350 D7BC0038 */      ldc1 $f28, 0x38($sp)
  /* 13A554 80132354 D7BE0040 */      ldc1 $f30, 0x40($sp)
  /* 13A558 80132358 8FB00048 */        lw $s0, 0x48($sp)
  /* 13A55C 8013235C 8FB1004C */        lw $s1, 0x4c($sp)
  /* 13A560 80132360 8FB20050 */        lw $s2, 0x50($sp)
  /* 13A564 80132364 8FB30054 */        lw $s3, 0x54($sp)
  /* 13A568 80132368 8FB40058 */        lw $s4, 0x58($sp)
  /* 13A56C 8013236C 8FB5005C */        lw $s5, 0x5c($sp)
  /* 13A570 80132370 8FB60060 */        lw $s6, 0x60($sp)
  /* 13A574 80132374 8FB70064 */        lw $s7, 0x64($sp)
  /* 13A578 80132378 8FBE0068 */        lw $fp, 0x68($sp)
  /* 13A57C 8013237C 03E00008 */        jr $ra
  /* 13A580 80132380 27BD0180 */     addiu $sp, $sp, 0x180

glabel mn1PSelectCharWithToken
  /* 13A584 80132384 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13A588 80132388 AFB00018 */        sw $s0, 0x18($sp)
  /* 13A58C 8013238C 3C108014 */       lui $s0, %hi(gMN1PPanel)
  /* 13A590 80132390 26108EE8 */     addiu $s0, $s0, %lo(gMN1PPanel)
  /* 13A594 80132394 8E0E0054 */        lw $t6, 0x54($s0) # gMN1PPanel + 84
  /* 13A598 80132398 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13A59C 8013239C AFA40028 */        sw $a0, 0x28($sp)
  /* 13A5A0 801323A0 8E040020 */        lw $a0, 0x20($s0) # gMN1PPanel + 32
  /* 13A5A4 801323A4 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 13A5A8 801323A8 AFAE0024 */        sw $t6, 0x24($sp)
  /* 13A5AC 801323AC AFA20020 */        sw $v0, 0x20($sp)
  /* 13A5B0 801323B0 8E040008 */        lw $a0, 8($s0) # gMN1PPanel + 8
  /* 13A5B4 801323B4 00402825 */        or $a1, $v0, $zero
  /* 13A5B8 801323B8 0C03A492 */       jal func_ovl2_800E9248
  /* 13A5BC 801323BC 00003025 */        or $a2, $zero, $zero
  /* 13A5C0 801323C0 8FAF0020 */        lw $t7, 0x20($sp)
  /* 13A5C4 801323C4 24180001 */     addiu $t8, $zero, 1
  /* 13A5C8 801323C8 24190004 */     addiu $t9, $zero, 4
  /* 13A5CC 801323CC 24060002 */     addiu $a2, $zero, 2
  /* 13A5D0 801323D0 AE18002C */        sw $t8, 0x2c($s0) # gMN1PPanel + 44
  /* 13A5D4 801323D4 AE190050 */        sw $t9, 0x50($s0) # gMN1PPanel + 80
  /* 13A5D8 801323D8 AE060028 */        sw $a2, 0x28($s0) # gMN1PPanel + 40
  /* 13A5DC 801323DC 8E040000 */        lw $a0, ($s0) # gMN1PPanel + 0
  /* 13A5E0 801323E0 8FA50028 */        lw $a1, 0x28($sp)
  /* 13A5E4 801323E4 0C04D4AF */       jal mn1PRedrawCursor
  /* 13A5E8 801323E8 AE0F0024 */        sw $t7, 0x24($s0) # gMN1PPanel + 36
  /* 13A5EC 801323EC 2409FFFF */     addiu $t1, $zero, -1
  /* 13A5F0 801323F0 240A0001 */     addiu $t2, $zero, 1
  /* 13A5F4 801323F4 AE090054 */        sw $t1, 0x54($s0) # gMN1PPanel + 84
  /* 13A5F8 801323F8 AE0A0058 */        sw $t2, 0x58($s0) # gMN1PPanel + 88
  /* 13A5FC 801323FC 0C04D73D */       jal mn1PReorderCursorsOnPlacement
  /* 13A600 80132400 8FA40024 */        lw $a0, 0x24($sp)
  /* 13A604 80132404 8FA40028 */        lw $a0, 0x28($sp)
  /* 13A608 80132408 0C04D6CC */       jal mn1PAnnounceFighter
  /* 13A60C 8013240C 8FA50024 */        lw $a1, 0x24($sp)
  /* 13A610 80132410 0C04D67F */       jal mn1PCreateWhiteSquare
  /* 13A614 80132414 8FA40024 */        lw $a0, 0x24($sp)
  /* 13A618 80132418 3C048014 */       lui $a0, %hi(gMN1PStockValue)
  /* 13A61C 8013241C 8C848FB8 */        lw $a0, %lo(gMN1PStockValue)($a0)
  /* 13A620 80132420 0C04D067 */       jal mn1PDrawStock
  /* 13A624 80132424 8E050020 */        lw $a1, 0x20($s0) # gMN1PPanel + 32
  /* 13A628 80132428 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13A62C 8013242C 8FB00018 */        lw $s0, 0x18($sp)
  /* 13A630 80132430 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13A634 80132434 03E00008 */        jr $ra
  /* 13A638 80132438 00000000 */       nop

glabel mn1PGetNextPortraitX
  /* 13A63C 8013243C 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 13A640 80132440 3C0E8014 */       lui $t6, %hi(dMN1PPortraitPositionsX)
  /* 13A644 80132444 27A30040 */     addiu $v1, $sp, 0x40
  /* 13A648 80132448 44856000 */      mtc1 $a1, $f12
  /* 13A64C 8013244C 25CE87A0 */     addiu $t6, $t6, %lo(dMN1PPortraitPositionsX)
  /* 13A650 80132450 27A50010 */     addiu $a1, $sp, 0x10
  /* 13A654 80132454 25C80030 */     addiu $t0, $t6, 0x30
  /* 13A658 80132458 0060C825 */        or $t9, $v1, $zero
  .L8013245C:
  /* 13A65C 8013245C 8DD80000 */        lw $t8, ($t6) # dMN1PPortraitPositionsX + 0
  /* 13A660 80132460 25CE000C */     addiu $t6, $t6, 0xc
  /* 13A664 80132464 2739000C */     addiu $t9, $t9, 0xc
  /* 13A668 80132468 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13A66C 8013246C 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PPortraitPositionsX + -8
  /* 13A670 80132470 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13A674 80132474 8DD8FFFC */        lw $t8, -4($t6) # dMN1PPortraitPositionsX + -4
  /* 13A678 80132478 15C8FFF8 */       bne $t6, $t0, .L8013245C
  /* 13A67C 8013247C AF38FFFC */        sw $t8, -4($t9)
  /* 13A680 80132480 3C098014 */       lui $t1, %hi(dMN1PPortraitVelocities)
  /* 13A684 80132484 252987D0 */     addiu $t1, $t1, %lo(dMN1PPortraitVelocities)
  /* 13A688 80132488 252D0030 */     addiu $t5, $t1, 0x30
  /* 13A68C 8013248C 00A06025 */        or $t4, $a1, $zero
  .L80132490:
  /* 13A690 80132490 8D2B0000 */        lw $t3, ($t1) # dMN1PPortraitVelocities + 0
  /* 13A694 80132494 2529000C */     addiu $t1, $t1, 0xc
  /* 13A698 80132498 258C000C */     addiu $t4, $t4, 0xc
  /* 13A69C 8013249C AD8BFFF4 */        sw $t3, -0xc($t4)
  /* 13A6A0 801324A0 8D2AFFF8 */        lw $t2, -8($t1) # dMN1PPortraitVelocities + -8
  /* 13A6A4 801324A4 AD8AFFF8 */        sw $t2, -8($t4)
  /* 13A6A8 801324A8 8D2BFFFC */        lw $t3, -4($t1) # dMN1PPortraitVelocities + -4
  /* 13A6AC 801324AC 152DFFF8 */       bne $t1, $t5, .L80132490
  /* 13A6B0 801324B0 AD8BFFFC */        sw $t3, -4($t4)
  /* 13A6B4 801324B4 00041080 */       sll $v0, $a0, 2
  /* 13A6B8 801324B8 00624021 */      addu $t0, $v1, $v0
  /* 13A6BC 801324BC C5000000 */      lwc1 $f0, ($t0)
  /* 13A6C0 801324C0 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13A6C4 801324C4 46006032 */    c.eq.s $f12, $f0
  /* 13A6C8 801324C8 00000000 */       nop
  /* 13A6CC 801324CC 45020005 */     bc1fl .L801324E4
  /* 13A6D0 801324D0 460C003C */    c.lt.s $f0, $f12
  /* 13A6D4 801324D4 44810000 */      mtc1 $at, $f0 # -1.0 to cop1
  /* 13A6D8 801324D8 1000001B */         b .L80132548
  /* 13A6DC 801324DC 00000000 */       nop
  /* 13A6E0 801324E0 460C003C */    c.lt.s $f0, $f12
  .L801324E4:
  /* 13A6E4 801324E4 00A27021 */      addu $t6, $a1, $v0
  /* 13A6E8 801324E8 00A2C821 */      addu $t9, $a1, $v0
  /* 13A6EC 801324EC 4502000D */     bc1fl .L80132524
  /* 13A6F0 801324F0 C7260000 */      lwc1 $f6, ($t9)
  /* 13A6F4 801324F4 C5C40000 */      lwc1 $f4, ($t6) # dMN1PPortraitPositionsX + 0
  /* 13A6F8 801324F8 46046080 */     add.s $f2, $f12, $f4
  /* 13A6FC 801324FC 4600103E */    c.le.s $f2, $f0
  /* 13A700 80132500 00000000 */       nop
  /* 13A704 80132504 45020004 */     bc1fl .L80132518
  /* 13A708 80132508 46001306 */     mov.s $f12, $f2
  /* 13A70C 8013250C 1000000E */         b .L80132548
  /* 13A710 80132510 00000000 */       nop
  /* 13A714 80132514 46001306 */     mov.s $f12, $f2
  .L80132518:
  /* 13A718 80132518 1000000B */         b .L80132548
  /* 13A71C 8013251C 46006006 */     mov.s $f0, $f12
  /* 13A720 80132520 C7260000 */      lwc1 $f6, ($t9)
  .L80132524:
  /* 13A724 80132524 46066080 */     add.s $f2, $f12, $f6
  /* 13A728 80132528 4602003E */    c.le.s $f0, $f2
  /* 13A72C 8013252C 00000000 */       nop
  /* 13A730 80132530 45020004 */     bc1fl .L80132544
  /* 13A734 80132534 46001306 */     mov.s $f12, $f2
  /* 13A738 80132538 10000002 */         b .L80132544
  /* 13A73C 8013253C 46000306 */     mov.s $f12, $f0
  /* 13A740 80132540 46001306 */     mov.s $f12, $f2
  .L80132544:
  /* 13A744 80132544 46006006 */     mov.s $f0, $f12
  .L80132548:
  /* 13A748 80132548 03E00008 */        jr $ra
  /* 13A74C 8013254C 27BD0070 */     addiu $sp, $sp, 0x70

glabel mn1PCheckFighterIsXBoxed
  /* 13A750 80132550 AFA40000 */        sw $a0, ($sp)
  /* 13A754 80132554 03E00008 */        jr $ra
  /* 13A758 80132558 00001025 */        or $v0, $zero, $zero

glabel mn1PSetPortraitX
  /* 13A75C 8013255C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13A760 80132560 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13A764 80132564 00803025 */        or $a2, $a0, $zero
  /* 13A768 80132568 8CCE0074 */        lw $t6, 0x74($a2)
  /* 13A76C 8013256C 8C840084 */        lw $a0, 0x84($a0)
  /* 13A770 80132570 8DC50058 */        lw $a1, 0x58($t6)
  /* 13A774 80132574 0C04C90F */       jal mn1PGetNextPortraitX
  /* 13A778 80132578 AFA60018 */        sw $a2, 0x18($sp)
  /* 13A77C 8013257C 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13A780 80132580 44812000 */      mtc1 $at, $f4 # -1.0 to cop1
  /* 13A784 80132584 8FA60018 */        lw $a2, 0x18($sp)
  /* 13A788 80132588 46040032 */    c.eq.s $f0, $f4
  /* 13A78C 8013258C 00000000 */       nop
  /* 13A790 80132590 4503000E */     bc1tl .L801325CC
  /* 13A794 80132594 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13A798 80132598 8CCF0074 */        lw $t7, 0x74($a2)
  /* 13A79C 8013259C 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 13A7A0 801325A0 E5E00058 */      swc1 $f0, 0x58($t7)
  /* 13A7A4 801325A4 8CC20074 */        lw $v0, 0x74($a2)
  /* 13A7A8 801325A8 8C430008 */        lw $v1, 8($v0)
  /* 13A7AC 801325AC 50600007 */      beql $v1, $zero, .L801325CC
  /* 13A7B0 801325B0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13A7B4 801325B4 C4460058 */      lwc1 $f6, 0x58($v0)
  /* 13A7B8 801325B8 44814000 */      mtc1 $at, $f8 # 4.0 to cop1
  /* 13A7BC 801325BC 00000000 */       nop
  /* 13A7C0 801325C0 46083280 */     add.s $f10, $f6, $f8
  /* 13A7C4 801325C4 E46A0058 */      swc1 $f10, 0x58($v1)
  /* 13A7C8 801325C8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801325CC:
  /* 13A7CC 801325CC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13A7D0 801325D0 03E00008 */        jr $ra
  /* 13A7D4 801325D4 00000000 */       nop

glabel mn1PInitializePortraitBackgroundPosition
  /* 13A7D8 801325D8 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13A7DC 801325DC 3C0E8014 */       lui $t6, %hi(dMN1PPortraitPositionsXY)
  /* 13A7E0 801325E0 27A30000 */     addiu $v1, $sp, 0
  /* 13A7E4 801325E4 25CE8800 */     addiu $t6, $t6, %lo(dMN1PPortraitPositionsXY)
  /* 13A7E8 801325E8 25C80060 */     addiu $t0, $t6, 0x60
  /* 13A7EC 801325EC 0060C825 */        or $t9, $v1, $zero
  .L801325F0:
  /* 13A7F0 801325F0 8DD80000 */        lw $t8, ($t6) # dMN1PPortraitPositionsXY + 0
  /* 13A7F4 801325F4 25CE000C */     addiu $t6, $t6, 0xc
  /* 13A7F8 801325F8 2739000C */     addiu $t9, $t9, 0xc
  /* 13A7FC 801325FC AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13A800 80132600 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PPortraitPositionsXY + -8
  /* 13A804 80132604 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13A808 80132608 8DD8FFFC */        lw $t8, -4($t6) # dMN1PPortraitPositionsXY + -4
  /* 13A80C 8013260C 15C8FFF8 */       bne $t6, $t0, .L801325F0
  /* 13A810 80132610 AF38FFFC */        sw $t8, -4($t9)
  /* 13A814 80132614 000548C0 */       sll $t1, $a1, 3
  /* 13A818 80132618 00691021 */      addu $v0, $v1, $t1
  /* 13A81C 8013261C C4440000 */      lwc1 $f4, ($v0)
  /* 13A820 80132620 E4840058 */      swc1 $f4, 0x58($a0)
  /* 13A824 80132624 C4460004 */      lwc1 $f6, 4($v0)
  /* 13A828 80132628 27BD0060 */     addiu $sp, $sp, 0x60
  /* 13A82C 8013262C 03E00008 */        jr $ra
  /* 13A830 80132630 E486005C */      swc1 $f6, 0x5c($a0)

glabel mn1PAddRedXBoxToPortrait
  /* 13A834 80132634 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13A838 80132638 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13A83C 8013263C AFA5002C */        sw $a1, 0x2c($sp)
  /* 13A840 80132640 8C820074 */        lw $v0, 0x74($a0)
  /* 13A844 80132644 3C0E8014 */       lui $t6, %hi(D_ovl27_801396B0)
  /* 13A848 80132648 8DCE96B0 */        lw $t6, %lo(D_ovl27_801396B0)($t6)
  /* 13A84C 8013264C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13A850 80132650 3C0F0000 */       lui $t7, %hi(D_NF_000002B8)
  /* 13A854 80132654 25EF02B8 */     addiu $t7, $t7, %lo(D_NF_000002B8)
  /* 13A858 80132658 E7A40020 */      swc1 $f4, 0x20($sp)
  /* 13A85C 8013265C C446005C */      lwc1 $f6, 0x5c($v0)
  /* 13A860 80132660 01CF2821 */      addu $a1, $t6, $t7
  /* 13A864 80132664 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13A868 80132668 E7A6001C */      swc1 $f6, 0x1c($sp)
  /* 13A86C 8013266C 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 13A870 80132670 44815000 */      mtc1 $at, $f10 # 4.0 to cop1
  /* 13A874 80132674 C7A80020 */      lwc1 $f8, 0x20($sp)
  /* 13A878 80132678 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 13A87C 8013267C 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 13A880 80132680 460A4400 */     add.s $f16, $f8, $f10
  /* 13A884 80132684 94580024 */       lhu $t8, 0x24($v0)
  /* 13A888 80132688 240A00FF */     addiu $t2, $zero, 0xff
  /* 13A88C 8013268C E4500058 */      swc1 $f16, 0x58($v0)
  /* 13A890 80132690 C7B2001C */      lwc1 $f18, 0x1c($sp)
  /* 13A894 80132694 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 13A898 80132698 A4480024 */        sh $t0, 0x24($v0)
  /* 13A89C 8013269C 46049180 */     add.s $f6, $f18, $f4
  /* 13A8A0 801326A0 35090001 */       ori $t1, $t0, 1
  /* 13A8A4 801326A4 A4490024 */        sh $t1, 0x24($v0)
  /* 13A8A8 801326A8 A04A0028 */        sb $t2, 0x28($v0)
  /* 13A8AC 801326AC E446005C */      swc1 $f6, 0x5c($v0)
  /* 13A8B0 801326B0 A0400029 */        sb $zero, 0x29($v0)
  /* 13A8B4 801326B4 A040002A */        sb $zero, 0x2a($v0)
  /* 13A8B8 801326B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13A8BC 801326BC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13A8C0 801326C0 03E00008 */        jr $ra
  /* 13A8C4 801326C4 00000000 */       nop

glabel mn1PGetIsLocked
  /* 13A8C8 801326C8 24010004 */     addiu $at, $zero, 4
  /* 13A8CC 801326CC 10810026 */       beq $a0, $at, .L80132768
  /* 13A8D0 801326D0 3C0A8014 */       lui $t2, 0x8014
  /* 13A8D4 801326D4 24010007 */     addiu $at, $zero, 7
  /* 13A8D8 801326D8 1081001A */       beq $a0, $at, .L80132744
  /* 13A8DC 801326DC 3C088014 */       lui $t0, 0x8014
  /* 13A8E0 801326E0 2401000A */     addiu $at, $zero, 0xa
  /* 13A8E4 801326E4 1081000E */       beq $a0, $at, .L80132720
  /* 13A8E8 801326E8 3C188014 */       lui $t8, 0x8014
  /* 13A8EC 801326EC 2401000B */     addiu $at, $zero, 0xb
  /* 13A8F0 801326F0 14810026 */       bne $a0, $at, .L8013278C
  /* 13A8F4 801326F4 00001025 */        or $v0, $zero, $zero
  /* 13A8F8 801326F8 3C0E8014 */       lui $t6, %hi(gMN1PCharacterUnlockedMask)
  /* 13A8FC 801326FC 95CE8FC8 */       lhu $t6, %lo(gMN1PCharacterUnlockedMask)($t6)
  /* 13A900 80132700 24030001 */     addiu $v1, $zero, 1
  /* 13A904 80132704 31CF0800 */      andi $t7, $t6, 0x800
  /* 13A908 80132708 11E00003 */      beqz $t7, .L80132718
  /* 13A90C 8013270C 00000000 */       nop
  /* 13A910 80132710 03E00008 */        jr $ra
  /* 13A914 80132714 00001025 */        or $v0, $zero, $zero

  .L80132718:
  /* 13A918 80132718 03E00008 */        jr $ra
  /* 13A91C 8013271C 00601025 */        or $v0, $v1, $zero

  .L80132720:
  /* 13A920 80132720 97188FC8 */       lhu $t8, -0x7038($t8)
  /* 13A924 80132724 24030001 */     addiu $v1, $zero, 1
  /* 13A928 80132728 33190400 */      andi $t9, $t8, 0x400
  /* 13A92C 8013272C 13200003 */      beqz $t9, .L8013273C
  /* 13A930 80132730 00000000 */       nop
  /* 13A934 80132734 03E00008 */        jr $ra
  /* 13A938 80132738 00001025 */        or $v0, $zero, $zero

  .L8013273C:
  /* 13A93C 8013273C 03E00008 */        jr $ra
  /* 13A940 80132740 00601025 */        or $v0, $v1, $zero

  .L80132744:
  /* 13A944 80132744 95088FC8 */       lhu $t0, -0x7038($t0)
  /* 13A948 80132748 24030001 */     addiu $v1, $zero, 1
  /* 13A94C 8013274C 31090080 */      andi $t1, $t0, 0x80
  /* 13A950 80132750 11200003 */      beqz $t1, .L80132760
  /* 13A954 80132754 00000000 */       nop
  /* 13A958 80132758 03E00008 */        jr $ra
  /* 13A95C 8013275C 00001025 */        or $v0, $zero, $zero

  .L80132760:
  /* 13A960 80132760 03E00008 */        jr $ra
  /* 13A964 80132764 00601025 */        or $v0, $v1, $zero

  .L80132768:
  /* 13A968 80132768 954A8FC8 */       lhu $t2, -0x7038($t2)
  /* 13A96C 8013276C 24030001 */     addiu $v1, $zero, 1
  /* 13A970 80132770 314B0010 */      andi $t3, $t2, 0x10
  /* 13A974 80132774 11600003 */      beqz $t3, .L80132784
  /* 13A978 80132778 00000000 */       nop
  /* 13A97C 8013277C 03E00008 */        jr $ra
  /* 13A980 80132780 00001025 */        or $v0, $zero, $zero

  .L80132784:
  /* 13A984 80132784 03E00008 */        jr $ra
  /* 13A988 80132788 00601025 */        or $v0, $v1, $zero

  .L8013278C:
  /* 13A98C 8013278C 03E00008 */        jr $ra
  /* 13A990 80132790 00000000 */       nop

  /* 13A994 80132794 03E00008 */        jr $ra
  /* 13A998 80132798 00000000 */       nop

glabel mn1PGetFtKind
  /* 13A99C 8013279C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13A9A0 801327A0 3C0E8014 */       lui $t6, %hi(dMN1PFtKindOrder)
  /* 13A9A4 801327A4 27A30000 */     addiu $v1, $sp, 0
  /* 13A9A8 801327A8 25CE8884 */     addiu $t6, $t6, %lo(dMN1PFtKindOrder)
  /* 13A9AC 801327AC 25C80030 */     addiu $t0, $t6, 0x30
  /* 13A9B0 801327B0 0060C825 */        or $t9, $v1, $zero
  .L801327B4:
  /* 13A9B4 801327B4 8DD80000 */        lw $t8, ($t6) # dMN1PFtKindOrder + 0
  /* 13A9B8 801327B8 25CE000C */     addiu $t6, $t6, 0xc
  /* 13A9BC 801327BC 2739000C */     addiu $t9, $t9, 0xc
  /* 13A9C0 801327C0 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13A9C4 801327C4 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PFtKindOrder + -8
  /* 13A9C8 801327C8 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13A9CC 801327CC 8DD8FFFC */        lw $t8, -4($t6) # dMN1PFtKindOrder + -4
  /* 13A9D0 801327D0 15C8FFF8 */       bne $t6, $t0, .L801327B4
  /* 13A9D4 801327D4 AF38FFFC */        sw $t8, -4($t9)
  /* 13A9D8 801327D8 00044880 */       sll $t1, $a0, 2
  /* 13A9DC 801327DC 00695021 */      addu $t2, $v1, $t1
  /* 13A9E0 801327E0 8D420000 */        lw $v0, ($t2)
  /* 13A9E4 801327E4 03E00008 */        jr $ra
  /* 13A9E8 801327E8 27BD0030 */     addiu $sp, $sp, 0x30

glabel mn1PGetPortraitId
  /* 13A9EC 801327EC 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13A9F0 801327F0 3C0E8014 */       lui $t6, %hi(dMN1PPortraitOrder)
  /* 13A9F4 801327F4 27A30000 */     addiu $v1, $sp, 0
  /* 13A9F8 801327F8 25CE88B4 */     addiu $t6, $t6, %lo(dMN1PPortraitOrder)
  /* 13A9FC 801327FC 25C80030 */     addiu $t0, $t6, 0x30
  /* 13AA00 80132800 0060C825 */        or $t9, $v1, $zero
  .L80132804:
  /* 13AA04 80132804 8DD80000 */        lw $t8, ($t6) # dMN1PPortraitOrder + 0
  /* 13AA08 80132808 25CE000C */     addiu $t6, $t6, 0xc
  /* 13AA0C 8013280C 2739000C */     addiu $t9, $t9, 0xc
  /* 13AA10 80132810 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13AA14 80132814 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PPortraitOrder + -8
  /* 13AA18 80132818 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13AA1C 8013281C 8DD8FFFC */        lw $t8, -4($t6) # dMN1PPortraitOrder + -4
  /* 13AA20 80132820 15C8FFF8 */       bne $t6, $t0, .L80132804
  /* 13AA24 80132824 AF38FFFC */        sw $t8, -4($t9)
  /* 13AA28 80132828 00044880 */       sll $t1, $a0, 2
  /* 13AA2C 8013282C 00695021 */      addu $t2, $v1, $t1
  /* 13AA30 80132830 8D420000 */        lw $v0, ($t2)
  /* 13AA34 80132834 03E00008 */        jr $ra
  /* 13AA38 80132838 27BD0030 */     addiu $sp, $sp, 0x30

glabel mn1PRenderPortraitWithNoise
  /* 13AA3C 8013283C 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 13AA40 80132840 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 13AA44 80132844 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13AA48 80132848 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13AA4C 8013284C AFBF0014 */        sw $ra, 0x14($sp)
  /* 13AA50 80132850 244E0008 */     addiu $t6, $v0, 8
  /* 13AA54 80132854 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 13AA58 80132858 3C0FE700 */       lui $t7, 0xe700
  /* 13AA5C 8013285C AC4F0000 */        sw $t7, ($v0)
  /* 13AA60 80132860 AC400004 */        sw $zero, 4($v0)
  /* 13AA64 80132864 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13AA68 80132868 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 13AA6C 8013286C 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 13AA70 80132870 24580008 */     addiu $t8, $v0, 8
  /* 13AA74 80132874 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 13AA78 80132878 AC400004 */        sw $zero, 4($v0)
  /* 13AA7C 8013287C AC590000 */        sw $t9, ($v0)
  /* 13AA80 80132880 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13AA84 80132884 3C0C3030 */       lui $t4, (0x303030FF >> 16) # 808464639
  /* 13AA88 80132888 358C30FF */       ori $t4, $t4, (0x303030FF & 0xFFFF) # 808464639
  /* 13AA8C 8013288C 244A0008 */     addiu $t2, $v0, 8
  /* 13AA90 80132890 AC6A0000 */        sw $t2, ($v1) # gDisplayListHead + 0
  /* 13AA94 80132894 3C0BFA00 */       lui $t3, 0xfa00
  /* 13AA98 80132898 AC4B0000 */        sw $t3, ($v0)
  /* 13AA9C 8013289C AC4C0004 */        sw $t4, 4($v0)
  /* 13AAA0 801328A0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13AAA4 801328A4 3C0F11FC */       lui $t7, (0x11FCF279 >> 16) # 301789817
  /* 13AAA8 801328A8 3C0EFC71 */       lui $t6, (0xFC71FEE3 >> 16) # 4235329251
  /* 13AAAC 801328AC 244D0008 */     addiu $t5, $v0, 8
  /* 13AAB0 801328B0 AC6D0000 */        sw $t5, ($v1) # gDisplayListHead + 0
  /* 13AAB4 801328B4 35CEFEE3 */       ori $t6, $t6, (0xFC71FEE3 & 0xFFFF) # 4235329251
  /* 13AAB8 801328B8 35EFF279 */       ori $t7, $t7, (0x11FCF279 & 0xFFFF) # 301789817
  /* 13AABC 801328BC AC4F0004 */        sw $t7, 4($v0)
  /* 13AAC0 801328C0 AC4E0000 */        sw $t6, ($v0)
  /* 13AAC4 801328C4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13AAC8 801328C8 3C0A0050 */       lui $t2, (0x5041C8 >> 16) # 5259720
  /* 13AACC 801328CC 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 13AAD0 801328D0 24580008 */     addiu $t8, $v0, 8
  /* 13AAD4 801328D4 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 13AAD8 801328D8 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 13AADC 801328DC 354A41C8 */       ori $t2, $t2, (0x5041C8 & 0xFFFF) # 5259720
  /* 13AAE0 801328E0 AC4A0004 */        sw $t2, 4($v0)
  /* 13AAE4 801328E4 0C0333DD */       jal func_ovl0_800CCF74
  /* 13AAE8 801328E8 AC590000 */        sw $t9, ($v0)
  /* 13AAEC 801328EC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13AAF0 801328F0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13AAF4 801328F4 03E00008 */        jr $ra
  /* 13AAF8 801328F8 00000000 */       nop

glabel mn1PCreateLockedPortrait
  /* 13AAFC 801328FC 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 13AB00 80132900 3C0F8014 */       lui $t7, %hi(dMN1PLockedPortraitOffsets)
  /* 13AB04 80132904 AFB10020 */        sw $s1, 0x20($sp)
  /* 13AB08 80132908 25EF88E4 */     addiu $t7, $t7, %lo(dMN1PLockedPortraitOffsets)
  /* 13AB0C 8013290C 00808825 */        or $s1, $a0, $zero
  /* 13AB10 80132910 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13AB14 80132914 AFB0001C */        sw $s0, 0x1c($sp)
  /* 13AB18 80132918 25E80030 */     addiu $t0, $t7, 0x30
  /* 13AB1C 8013291C 27AE0038 */     addiu $t6, $sp, 0x38
  .L80132920:
  /* 13AB20 80132920 8DF90000 */        lw $t9, ($t7) # dMN1PLockedPortraitOffsets + 0
  /* 13AB24 80132924 25EF000C */     addiu $t7, $t7, 0xc
  /* 13AB28 80132928 25CE000C */     addiu $t6, $t6, 0xc
  /* 13AB2C 8013292C ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13AB30 80132930 8DF8FFF8 */        lw $t8, -8($t7) # dMN1PLockedPortraitOffsets + -8
  /* 13AB34 80132934 ADD8FFF8 */        sw $t8, -8($t6)
  /* 13AB38 80132938 8DF9FFFC */        lw $t9, -4($t7) # dMN1PLockedPortraitOffsets + -4
  /* 13AB3C 8013293C 15E8FFF8 */       bne $t7, $t0, .L80132920
  /* 13AB40 80132940 ADD9FFFC */        sw $t9, -4($t6)
  /* 13AB44 80132944 00002025 */        or $a0, $zero, $zero
  /* 13AB48 80132948 00002825 */        or $a1, $zero, $zero
  /* 13AB4C 8013294C 24060012 */     addiu $a2, $zero, 0x12
  /* 13AB50 80132950 0C00265A */       jal omMakeGObjSPAfter
  /* 13AB54 80132954 3C078000 */       lui $a3, 0x8000
  /* 13AB58 80132958 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13AB5C 8013295C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13AB60 80132960 2409FFFF */     addiu $t1, $zero, -1
  /* 13AB64 80132964 00408025 */        or $s0, $v0, $zero
  /* 13AB68 80132968 AFA90010 */        sw $t1, 0x10($sp)
  /* 13AB6C 8013296C AFA50030 */        sw $a1, 0x30($sp)
  /* 13AB70 80132970 00402025 */        or $a0, $v0, $zero
  /* 13AB74 80132974 2406001B */     addiu $a2, $zero, 0x1b
  /* 13AB78 80132978 0C00277D */       jal omAddGObjRenderProc
  /* 13AB7C 8013297C 3C078000 */       lui $a3, 0x8000
  /* 13AB80 80132980 3C058013 */       lui $a1, %hi(mn1PSetPortraitX)
  /* 13AB84 80132984 24A5255C */     addiu $a1, $a1, %lo(mn1PSetPortraitX)
  /* 13AB88 80132988 AFA5002C */        sw $a1, 0x2c($sp)
  /* 13AB8C 8013298C 02002025 */        or $a0, $s0, $zero
  /* 13AB90 80132990 24060001 */     addiu $a2, $zero, 1
  /* 13AB94 80132994 0C002062 */       jal omAddGObjCommonProc
  /* 13AB98 80132998 24070001 */     addiu $a3, $zero, 1
  /* 13AB9C 8013299C 3C0A8014 */       lui $t2, %hi(D_ovl27_801396B0)
  /* 13ABA0 801329A0 8D4A96B0 */        lw $t2, %lo(D_ovl27_801396B0)($t2)
  /* 13ABA4 801329A4 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 13ABA8 801329A8 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 13ABAC 801329AC 02002025 */        or $a0, $s0, $zero
  /* 13ABB0 801329B0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13ABB4 801329B4 014B2821 */      addu $a1, $t2, $t3
  /* 13ABB8 801329B8 2A210006 */      slti $at, $s1, 6
  /* 13ABBC 801329BC 14200003 */      bnez $at, .L801329CC
  /* 13ABC0 801329C0 00402025 */        or $a0, $v0, $zero
  /* 13ABC4 801329C4 10000002 */         b .L801329D0
  /* 13ABC8 801329C8 2623FFFA */     addiu $v1, $s1, -6
  .L801329CC:
  /* 13ABCC 801329CC 02201825 */        or $v1, $s1, $zero
  .L801329D0:
  /* 13ABD0 801329D0 00036080 */       sll $t4, $v1, 2
  /* 13ABD4 801329D4 01836023 */      subu $t4, $t4, $v1
  /* 13ABD8 801329D8 000C6080 */       sll $t4, $t4, 2
  /* 13ABDC 801329DC 01836023 */      subu $t4, $t4, $v1
  /* 13ABE0 801329E0 000C6080 */       sll $t4, $t4, 2
  /* 13ABE4 801329E4 01836021 */      addu $t4, $t4, $v1
  /* 13ABE8 801329E8 258D0019 */     addiu $t5, $t4, 0x19
  /* 13ABEC 801329EC 448D2000 */      mtc1 $t5, $f4
  /* 13ABF0 801329F0 2A210006 */      slti $at, $s1, 6
  /* 13ABF4 801329F4 468021A0 */   cvt.s.w $f6, $f4
  /* 13ABF8 801329F8 14200003 */      bnez $at, .L80132A08
  /* 13ABFC 801329FC E4460058 */      swc1 $f6, 0x58($v0)
  /* 13AC00 80132A00 10000002 */         b .L80132A0C
  /* 13AC04 80132A04 24030001 */     addiu $v1, $zero, 1
  .L80132A08:
  /* 13AC08 80132A08 00001825 */        or $v1, $zero, $zero
  .L80132A0C:
  /* 13AC0C 80132A0C 00034080 */       sll $t0, $v1, 2
  /* 13AC10 80132A10 01034023 */      subu $t0, $t0, $v1
  /* 13AC14 80132A14 00084080 */       sll $t0, $t0, 2
  /* 13AC18 80132A18 01034023 */      subu $t0, $t0, $v1
  /* 13AC1C 80132A1C 00084080 */       sll $t0, $t0, 2
  /* 13AC20 80132A20 01034023 */      subu $t0, $t0, $v1
  /* 13AC24 80132A24 250F0024 */     addiu $t7, $t0, 0x24
  /* 13AC28 80132A28 448F4000 */      mtc1 $t7, $f8
  /* 13AC2C 80132A2C 02202825 */        or $a1, $s1, $zero
  /* 13AC30 80132A30 468042A0 */   cvt.s.w $f10, $f8
  /* 13AC34 80132A34 0C04C976 */       jal mn1PInitializePortraitBackgroundPosition
  /* 13AC38 80132A38 E48A005C */      swc1 $f10, 0x5c($a0)
  /* 13AC3C 80132A3C AE110084 */        sw $s1, 0x84($s0)
  /* 13AC40 80132A40 00002025 */        or $a0, $zero, $zero
  /* 13AC44 80132A44 00002825 */        or $a1, $zero, $zero
  /* 13AC48 80132A48 24060012 */     addiu $a2, $zero, 0x12
  /* 13AC4C 80132A4C 0C00265A */       jal omMakeGObjSPAfter
  /* 13AC50 80132A50 3C078000 */       lui $a3, 0x8000
  /* 13AC54 80132A54 3C058013 */       lui $a1, %hi(mn1PRenderPortraitWithNoise)
  /* 13AC58 80132A58 240EFFFF */     addiu $t6, $zero, -1
  /* 13AC5C 80132A5C 00408025 */        or $s0, $v0, $zero
  /* 13AC60 80132A60 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13AC64 80132A64 24A5283C */     addiu $a1, $a1, %lo(mn1PRenderPortraitWithNoise)
  /* 13AC68 80132A68 00402025 */        or $a0, $v0, $zero
  /* 13AC6C 80132A6C 2406001B */     addiu $a2, $zero, 0x1b
  /* 13AC70 80132A70 0C00277D */       jal omAddGObjRenderProc
  /* 13AC74 80132A74 3C078000 */       lui $a3, 0x8000
  /* 13AC78 80132A78 02002025 */        or $a0, $s0, $zero
  /* 13AC7C 80132A7C 8FA5002C */        lw $a1, 0x2c($sp)
  /* 13AC80 80132A80 24060001 */     addiu $a2, $zero, 1
  /* 13AC84 80132A84 0C002062 */       jal omAddGObjCommonProc
  /* 13AC88 80132A88 24070001 */     addiu $a3, $zero, 1
  /* 13AC8C 80132A8C 0C04C9E7 */       jal mn1PGetFtKind
  /* 13AC90 80132A90 02202025 */        or $a0, $s1, $zero
  /* 13AC94 80132A94 0002C080 */       sll $t8, $v0, 2
  /* 13AC98 80132A98 03B8C821 */      addu $t9, $sp, $t8
  /* 13AC9C 80132A9C 3C098014 */       lui $t1, %hi(D_ovl27_801396B0)
  /* 13ACA0 80132AA0 8D2996B0 */        lw $t1, %lo(D_ovl27_801396B0)($t1)
  /* 13ACA4 80132AA4 8F390038 */        lw $t9, 0x38($t9)
  /* 13ACA8 80132AA8 02002025 */        or $a0, $s0, $zero
  /* 13ACAC 80132AAC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13ACB0 80132AB0 03292821 */      addu $a1, $t9, $t1
  /* 13ACB4 80132AB4 944A0024 */       lhu $t2, 0x24($v0)
  /* 13ACB8 80132AB8 00402025 */        or $a0, $v0, $zero
  /* 13ACBC 80132ABC 02202825 */        or $a1, $s1, $zero
  /* 13ACC0 80132AC0 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 13ACC4 80132AC4 A44C0024 */        sh $t4, 0x24($v0)
  /* 13ACC8 80132AC8 358D0001 */       ori $t5, $t4, 1
  /* 13ACCC 80132ACC A44D0024 */        sh $t5, 0x24($v0)
  /* 13ACD0 80132AD0 0C04C976 */       jal mn1PInitializePortraitBackgroundPosition
  /* 13ACD4 80132AD4 AE110084 */        sw $s1, 0x84($s0)
  /* 13ACD8 80132AD8 00002025 */        or $a0, $zero, $zero
  /* 13ACDC 80132ADC 00002825 */        or $a1, $zero, $zero
  /* 13ACE0 80132AE0 24060012 */     addiu $a2, $zero, 0x12
  /* 13ACE4 80132AE4 0C00265A */       jal omMakeGObjSPAfter
  /* 13ACE8 80132AE8 3C078000 */       lui $a3, 0x8000
  /* 13ACEC 80132AEC 2408FFFF */     addiu $t0, $zero, -1
  /* 13ACF0 80132AF0 00408025 */        or $s0, $v0, $zero
  /* 13ACF4 80132AF4 AFA80010 */        sw $t0, 0x10($sp)
  /* 13ACF8 80132AF8 00402025 */        or $a0, $v0, $zero
  /* 13ACFC 80132AFC 8FA50030 */        lw $a1, 0x30($sp)
  /* 13AD00 80132B00 2406001B */     addiu $a2, $zero, 0x1b
  /* 13AD04 80132B04 0C00277D */       jal omAddGObjRenderProc
  /* 13AD08 80132B08 3C078000 */       lui $a3, 0x8000
  /* 13AD0C 80132B0C 02002025 */        or $a0, $s0, $zero
  /* 13AD10 80132B10 8FA5002C */        lw $a1, 0x2c($sp)
  /* 13AD14 80132B14 24060001 */     addiu $a2, $zero, 1
  /* 13AD18 80132B18 0C002062 */       jal omAddGObjCommonProc
  /* 13AD1C 80132B1C 24070001 */     addiu $a3, $zero, 1
  /* 13AD20 80132B20 3C0F8014 */       lui $t7, %hi(D_ovl27_801396B0)
  /* 13AD24 80132B24 8DEF96B0 */        lw $t7, %lo(D_ovl27_801396B0)($t7)
  /* 13AD28 80132B28 3C0E0000 */       lui $t6, %hi(D_NF_00000F68)
  /* 13AD2C 80132B2C 25CE0F68 */     addiu $t6, $t6, %lo(D_NF_00000F68)
  /* 13AD30 80132B30 02002025 */        or $a0, $s0, $zero
  /* 13AD34 80132B34 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13AD38 80132B38 01EE2821 */      addu $a1, $t7, $t6
  /* 13AD3C 80132B3C 94580024 */       lhu $t8, 0x24($v0)
  /* 13AD40 80132B40 240B005B */     addiu $t3, $zero, 0x5b
  /* 13AD44 80132B44 240C0041 */     addiu $t4, $zero, 0x41
  /* 13AD48 80132B48 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 13AD4C 80132B4C A4490024 */        sh $t1, 0x24($v0)
  /* 13AD50 80132B50 352A0001 */       ori $t2, $t1, 1
  /* 13AD54 80132B54 240D0033 */     addiu $t5, $zero, 0x33
  /* 13AD58 80132B58 240800C4 */     addiu $t0, $zero, 0xc4
  /* 13AD5C 80132B5C 240F00B9 */     addiu $t7, $zero, 0xb9
  /* 13AD60 80132B60 240E00A9 */     addiu $t6, $zero, 0xa9
  /* 13AD64 80132B64 A44A0024 */        sh $t2, 0x24($v0)
  /* 13AD68 80132B68 A04B0060 */        sb $t3, 0x60($v0)
  /* 13AD6C 80132B6C A04C0061 */        sb $t4, 0x61($v0)
  /* 13AD70 80132B70 A04D0062 */        sb $t5, 0x62($v0)
  /* 13AD74 80132B74 A0480028 */        sb $t0, 0x28($v0)
  /* 13AD78 80132B78 A04F0029 */        sb $t7, 0x29($v0)
  /* 13AD7C 80132B7C A04E002A */        sb $t6, 0x2a($v0)
  /* 13AD80 80132B80 AE110084 */        sw $s1, 0x84($s0)
  /* 13AD84 80132B84 00402025 */        or $a0, $v0, $zero
  /* 13AD88 80132B88 0C04C976 */       jal mn1PInitializePortraitBackgroundPosition
  /* 13AD8C 80132B8C 02202825 */        or $a1, $s1, $zero
  /* 13AD90 80132B90 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13AD94 80132B94 8FB0001C */        lw $s0, 0x1c($sp)
  /* 13AD98 80132B98 8FB10020 */        lw $s1, 0x20($sp)
  /* 13AD9C 80132B9C 03E00008 */        jr $ra
  /* 13ADA0 80132BA0 27BD0070 */     addiu $sp, $sp, 0x70

glabel mn1PCreatePortrait
  /* 13ADA4 80132BA4 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 13ADA8 80132BA8 3C0F8014 */       lui $t7, %hi(dMN1PPortraitOffsets)
  /* 13ADAC 80132BAC AFB00020 */        sw $s0, 0x20($sp)
  /* 13ADB0 80132BB0 25EF8914 */     addiu $t7, $t7, %lo(dMN1PPortraitOffsets)
  /* 13ADB4 80132BB4 00808025 */        or $s0, $a0, $zero
  /* 13ADB8 80132BB8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13ADBC 80132BBC 25E80030 */     addiu $t0, $t7, 0x30
  /* 13ADC0 80132BC0 27AE0034 */     addiu $t6, $sp, 0x34
  .L80132BC4:
  /* 13ADC4 80132BC4 8DF90000 */        lw $t9, ($t7) # dMN1PPortraitOffsets + 0
  /* 13ADC8 80132BC8 25EF000C */     addiu $t7, $t7, 0xc
  /* 13ADCC 80132BCC 25CE000C */     addiu $t6, $t6, 0xc
  /* 13ADD0 80132BD0 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13ADD4 80132BD4 8DF8FFF8 */        lw $t8, -8($t7) # dMN1PPortraitOffsets + -8
  /* 13ADD8 80132BD8 ADD8FFF8 */        sw $t8, -8($t6)
  /* 13ADDC 80132BDC 8DF9FFFC */        lw $t9, -4($t7) # dMN1PPortraitOffsets + -4
  /* 13ADE0 80132BE0 15E8FFF8 */       bne $t7, $t0, .L80132BC4
  /* 13ADE4 80132BE4 ADD9FFFC */        sw $t9, -4($t6)
  /* 13ADE8 80132BE8 0C04C9E7 */       jal mn1PGetFtKind
  /* 13ADEC 80132BEC 02002025 */        or $a0, $s0, $zero
  /* 13ADF0 80132BF0 0C04C9B2 */       jal mn1PGetIsLocked
  /* 13ADF4 80132BF4 00402025 */        or $a0, $v0, $zero
  /* 13ADF8 80132BF8 10400005 */      beqz $v0, .L80132C10
  /* 13ADFC 80132BFC 00002025 */        or $a0, $zero, $zero
  /* 13AE00 80132C00 0C04CA3F */       jal mn1PCreateLockedPortrait
  /* 13AE04 80132C04 02002025 */        or $a0, $s0, $zero
  /* 13AE08 80132C08 10000051 */         b .L80132D50
  /* 13AE0C 80132C0C 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132C10:
  /* 13AE10 80132C10 00002825 */        or $a1, $zero, $zero
  /* 13AE14 80132C14 24060019 */     addiu $a2, $zero, 0x19
  /* 13AE18 80132C18 0C00265A */       jal omMakeGObjSPAfter
  /* 13AE1C 80132C1C 3C078000 */       lui $a3, 0x8000
  /* 13AE20 80132C20 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13AE24 80132C24 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13AE28 80132C28 2409FFFF */     addiu $t1, $zero, -1
  /* 13AE2C 80132C2C AFA20068 */        sw $v0, 0x68($sp)
  /* 13AE30 80132C30 AFA90010 */        sw $t1, 0x10($sp)
  /* 13AE34 80132C34 AFA5002C */        sw $a1, 0x2c($sp)
  /* 13AE38 80132C38 00402025 */        or $a0, $v0, $zero
  /* 13AE3C 80132C3C 24060020 */     addiu $a2, $zero, 0x20
  /* 13AE40 80132C40 0C00277D */       jal omAddGObjRenderProc
  /* 13AE44 80132C44 3C078000 */       lui $a3, 0x8000
  /* 13AE48 80132C48 8FA40068 */        lw $a0, 0x68($sp)
  /* 13AE4C 80132C4C 3C058013 */       lui $a1, %hi(mn1PSetPortraitX)
  /* 13AE50 80132C50 24A5255C */     addiu $a1, $a1, %lo(mn1PSetPortraitX)
  /* 13AE54 80132C54 AC900084 */        sw $s0, 0x84($a0)
  /* 13AE58 80132C58 AFA50028 */        sw $a1, 0x28($sp)
  /* 13AE5C 80132C5C 24060001 */     addiu $a2, $zero, 1
  /* 13AE60 80132C60 0C002062 */       jal omAddGObjCommonProc
  /* 13AE64 80132C64 24070001 */     addiu $a3, $zero, 1
  /* 13AE68 80132C68 3C0A8014 */       lui $t2, %hi(D_ovl27_801396B0)
  /* 13AE6C 80132C6C 8D4A96B0 */        lw $t2, %lo(D_ovl27_801396B0)($t2)
  /* 13AE70 80132C70 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 13AE74 80132C74 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 13AE78 80132C78 8FA40068 */        lw $a0, 0x68($sp)
  /* 13AE7C 80132C7C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13AE80 80132C80 014B2821 */      addu $a1, $t2, $t3
  /* 13AE84 80132C84 00402025 */        or $a0, $v0, $zero
  /* 13AE88 80132C88 0C04C976 */       jal mn1PInitializePortraitBackgroundPosition
  /* 13AE8C 80132C8C 02002825 */        or $a1, $s0, $zero
  /* 13AE90 80132C90 00002025 */        or $a0, $zero, $zero
  /* 13AE94 80132C94 00002825 */        or $a1, $zero, $zero
  /* 13AE98 80132C98 24060012 */     addiu $a2, $zero, 0x12
  /* 13AE9C 80132C9C 0C00265A */       jal omMakeGObjSPAfter
  /* 13AEA0 80132CA0 3C078000 */       lui $a3, 0x8000
  /* 13AEA4 80132CA4 240CFFFF */     addiu $t4, $zero, -1
  /* 13AEA8 80132CA8 AFA2006C */        sw $v0, 0x6c($sp)
  /* 13AEAC 80132CAC AFAC0010 */        sw $t4, 0x10($sp)
  /* 13AEB0 80132CB0 00402025 */        or $a0, $v0, $zero
  /* 13AEB4 80132CB4 8FA5002C */        lw $a1, 0x2c($sp)
  /* 13AEB8 80132CB8 2406001B */     addiu $a2, $zero, 0x1b
  /* 13AEBC 80132CBC 0C00277D */       jal omAddGObjRenderProc
  /* 13AEC0 80132CC0 3C078000 */       lui $a3, 0x8000
  /* 13AEC4 80132CC4 8FA4006C */        lw $a0, 0x6c($sp)
  /* 13AEC8 80132CC8 8FA50028 */        lw $a1, 0x28($sp)
  /* 13AECC 80132CCC 24060001 */     addiu $a2, $zero, 1
  /* 13AED0 80132CD0 0C002062 */       jal omAddGObjCommonProc
  /* 13AED4 80132CD4 24070001 */     addiu $a3, $zero, 1
  /* 13AED8 80132CD8 0C04C9E7 */       jal mn1PGetFtKind
  /* 13AEDC 80132CDC 02002025 */        or $a0, $s0, $zero
  /* 13AEE0 80132CE0 00026880 */       sll $t5, $v0, 2
  /* 13AEE4 80132CE4 03AD4021 */      addu $t0, $sp, $t5
  /* 13AEE8 80132CE8 3C0F8014 */       lui $t7, %hi(D_ovl27_801396B0)
  /* 13AEEC 80132CEC 8DEF96B0 */        lw $t7, %lo(D_ovl27_801396B0)($t7)
  /* 13AEF0 80132CF0 8D080034 */        lw $t0, 0x34($t0)
  /* 13AEF4 80132CF4 8FA4006C */        lw $a0, 0x6c($sp)
  /* 13AEF8 80132CF8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13AEFC 80132CFC 010F2821 */      addu $a1, $t0, $t7
  /* 13AF00 80132D00 AFA20064 */        sw $v0, 0x64($sp)
  /* 13AF04 80132D04 944E0024 */       lhu $t6, 0x24($v0)
  /* 13AF08 80132D08 02002025 */        or $a0, $s0, $zero
  /* 13AF0C 80132D0C 31D9FFDF */      andi $t9, $t6, 0xffdf
  /* 13AF10 80132D10 A4590024 */        sh $t9, 0x24($v0)
  /* 13AF14 80132D14 37290001 */       ori $t1, $t9, 1
  /* 13AF18 80132D18 A4490024 */        sh $t1, 0x24($v0)
  /* 13AF1C 80132D1C 8FAA006C */        lw $t2, 0x6c($sp)
  /* 13AF20 80132D20 0C04C9E7 */       jal mn1PGetFtKind
  /* 13AF24 80132D24 AD500084 */        sw $s0, 0x84($t2)
  /* 13AF28 80132D28 0C04C954 */       jal mn1PCheckFighterIsXBoxed
  /* 13AF2C 80132D2C 00402025 */        or $a0, $v0, $zero
  /* 13AF30 80132D30 10400003 */      beqz $v0, .L80132D40
  /* 13AF34 80132D34 8FA4006C */        lw $a0, 0x6c($sp)
  /* 13AF38 80132D38 0C04C98D */       jal mn1PAddRedXBoxToPortrait
  /* 13AF3C 80132D3C 02002825 */        or $a1, $s0, $zero
  .L80132D40:
  /* 13AF40 80132D40 8FA40064 */        lw $a0, 0x64($sp)
  /* 13AF44 80132D44 0C04C976 */       jal mn1PInitializePortraitBackgroundPosition
  /* 13AF48 80132D48 02002825 */        or $a1, $s0, $zero
  /* 13AF4C 80132D4C 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132D50:
  /* 13AF50 80132D50 8FB00020 */        lw $s0, 0x20($sp)
  /* 13AF54 80132D54 27BD0070 */     addiu $sp, $sp, 0x70
  /* 13AF58 80132D58 03E00008 */        jr $ra
  /* 13AF5C 80132D5C 00000000 */       nop

glabel mn1PCreatePortraits
  /* 13AF60 80132D60 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13AF64 80132D64 AFB10018 */        sw $s1, 0x18($sp)
  /* 13AF68 80132D68 AFB00014 */        sw $s0, 0x14($sp)
  /* 13AF6C 80132D6C AFBF001C */        sw $ra, 0x1c($sp)
  /* 13AF70 80132D70 00008025 */        or $s0, $zero, $zero
  /* 13AF74 80132D74 2411000C */     addiu $s1, $zero, 0xc
  .L80132D78:
  /* 13AF78 80132D78 0C04CAE9 */       jal mn1PCreatePortrait
  /* 13AF7C 80132D7C 02002025 */        or $a0, $s0, $zero
  /* 13AF80 80132D80 26100001 */     addiu $s0, $s0, 1
  /* 13AF84 80132D84 1611FFFC */       bne $s0, $s1, .L80132D78
  /* 13AF88 80132D88 00000000 */       nop
  /* 13AF8C 80132D8C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13AF90 80132D90 8FB00014 */        lw $s0, 0x14($sp)
  /* 13AF94 80132D94 8FB10018 */        lw $s1, 0x18($sp)
  /* 13AF98 80132D98 03E00008 */        jr $ra
  /* 13AF9C 80132D9C 27BD0020 */     addiu $sp, $sp, 0x20

glabel mn1PSetNameAndLogo
  /* 13AFA0 80132DA0 27BDFF20 */     addiu $sp, $sp, -0xe0
  /* 13AFA4 80132DA4 3C0F8014 */       lui $t7, %hi(dMN1PUnusedPositions)
  /* 13AFA8 80132DA8 25EF8944 */     addiu $t7, $t7, %lo(dMN1PUnusedPositions)
  /* 13AFAC 80132DAC AFBF0014 */        sw $ra, 0x14($sp)
  /* 13AFB0 80132DB0 AFA400E0 */        sw $a0, 0xe0($sp)
  /* 13AFB4 80132DB4 AFA500E4 */        sw $a1, 0xe4($sp)
  /* 13AFB8 80132DB8 25E80060 */     addiu $t0, $t7, 0x60
  /* 13AFBC 80132DBC 27AE007C */     addiu $t6, $sp, 0x7c
  .L80132DC0:
  /* 13AFC0 80132DC0 8DF90000 */        lw $t9, ($t7) # dMN1PUnusedPositions + 0
  /* 13AFC4 80132DC4 25EF000C */     addiu $t7, $t7, 0xc
  /* 13AFC8 80132DC8 25CE000C */     addiu $t6, $t6, 0xc
  /* 13AFCC 80132DCC ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13AFD0 80132DD0 8DF8FFF8 */        lw $t8, -8($t7) # dMN1PUnusedPositions + -8
  /* 13AFD4 80132DD4 ADD8FFF8 */        sw $t8, -8($t6)
  /* 13AFD8 80132DD8 8DF9FFFC */        lw $t9, -4($t7) # dMN1PUnusedPositions + -4
  /* 13AFDC 80132DDC 15E8FFF8 */       bne $t7, $t0, .L80132DC0
  /* 13AFE0 80132DE0 ADD9FFFC */        sw $t9, -4($t6)
  /* 13AFE4 80132DE4 3C0A8014 */       lui $t2, %hi(dMN1PLogoOffsets)
  /* 13AFE8 80132DE8 254A89A4 */     addiu $t2, $t2, %lo(dMN1PLogoOffsets)
  /* 13AFEC 80132DEC 254D0030 */     addiu $t5, $t2, 0x30
  /* 13AFF0 80132DF0 27A9004C */     addiu $t1, $sp, 0x4c
  .L80132DF4:
  /* 13AFF4 80132DF4 8D4C0000 */        lw $t4, ($t2) # dMN1PLogoOffsets + 0
  /* 13AFF8 80132DF8 254A000C */     addiu $t2, $t2, 0xc
  /* 13AFFC 80132DFC 2529000C */     addiu $t1, $t1, 0xc
  /* 13B000 80132E00 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 13B004 80132E04 8D4BFFF8 */        lw $t3, -8($t2) # dMN1PLogoOffsets + -8
  /* 13B008 80132E08 AD2BFFF8 */        sw $t3, -8($t1)
  /* 13B00C 80132E0C 8D4CFFFC */        lw $t4, -4($t2) # dMN1PLogoOffsets + -4
  /* 13B010 80132E10 154DFFF8 */       bne $t2, $t5, .L80132DF4
  /* 13B014 80132E14 AD2CFFFC */        sw $t4, -4($t1)
  /* 13B018 80132E18 3C0F8014 */       lui $t7, %hi(dMN1PNameOffsets)
  /* 13B01C 80132E1C 25EF89D4 */     addiu $t7, $t7, %lo(dMN1PNameOffsets)
  /* 13B020 80132E20 25F90030 */     addiu $t9, $t7, 0x30
  /* 13B024 80132E24 27A8001C */     addiu $t0, $sp, 0x1c
  .L80132E28:
  /* 13B028 80132E28 8DF80000 */        lw $t8, ($t7) # dMN1PNameOffsets + 0
  /* 13B02C 80132E2C 25EF000C */     addiu $t7, $t7, 0xc
  /* 13B030 80132E30 2508000C */     addiu $t0, $t0, 0xc
  /* 13B034 80132E34 AD18FFF4 */        sw $t8, -0xc($t0)
  /* 13B038 80132E38 8DEEFFF8 */        lw $t6, -8($t7) # dMN1PNameOffsets + -8
  /* 13B03C 80132E3C AD0EFFF8 */        sw $t6, -8($t0)
  /* 13B040 80132E40 8DF8FFFC */        lw $t8, -4($t7) # dMN1PNameOffsets + -4
  /* 13B044 80132E44 15F9FFF8 */       bne $t7, $t9, .L80132E28
  /* 13B048 80132E48 AD18FFFC */        sw $t8, -4($t0)
  /* 13B04C 80132E4C 2401001C */     addiu $at, $zero, 0x1c
  /* 13B050 80132E50 10C1002E */       beq $a2, $at, .L80132F0C
  /* 13B054 80132E54 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 13B058 80132E58 0C002DD8 */       jal func_8000B760
  /* 13B05C 80132E5C AFA600E8 */        sw $a2, 0xe8($sp)
  /* 13B060 80132E60 8FA600E8 */        lw $a2, 0xe8($sp)
  /* 13B064 80132E64 3C0A8014 */       lui $t2, %hi(D_ovl27_801396A4)
  /* 13B068 80132E68 8D4A96A4 */        lw $t2, %lo(D_ovl27_801396A4)($t2)
  /* 13B06C 80132E6C 00061880 */       sll $v1, $a2, 2
  /* 13B070 80132E70 03A36821 */      addu $t5, $sp, $v1
  /* 13B074 80132E74 8DAD004C */        lw $t5, 0x4c($t5)
  /* 13B078 80132E78 AFA30018 */        sw $v1, 0x18($sp)
  /* 13B07C 80132E7C 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 13B080 80132E80 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B084 80132E84 01AA2821 */      addu $a1, $t5, $t2
  /* 13B088 80132E88 8FA30018 */        lw $v1, 0x18($sp)
  /* 13B08C 80132E8C 94490024 */       lhu $t1, 0x24($v0)
  /* 13B090 80132E90 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 13B094 80132E94 44812000 */      mtc1 $at, $f4 # 35.0 to cop1
  /* 13B098 80132E98 3C014310 */       lui $at, (0x43100000 >> 16) # 144.0
  /* 13B09C 80132E9C 44813000 */      mtc1 $at, $f6 # 144.0 to cop1
  /* 13B0A0 80132EA0 312CFFDF */      andi $t4, $t1, 0xffdf
  /* 13B0A4 80132EA4 A44C0024 */        sh $t4, 0x24($v0)
  /* 13B0A8 80132EA8 35990001 */       ori $t9, $t4, 1
  /* 13B0AC 80132EAC A4590024 */        sh $t9, 0x24($v0)
  /* 13B0B0 80132EB0 A0400028 */        sb $zero, 0x28($v0)
  /* 13B0B4 80132EB4 A0400029 */        sb $zero, 0x29($v0)
  /* 13B0B8 80132EB8 A040002A */        sb $zero, 0x2a($v0)
  /* 13B0BC 80132EBC E4440058 */      swc1 $f4, 0x58($v0)
  /* 13B0C0 80132EC0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13B0C4 80132EC4 3C088014 */       lui $t0, %hi(D_ovl27_801396A0)
  /* 13B0C8 80132EC8 03A37821 */      addu $t7, $sp, $v1
  /* 13B0CC 80132ECC 8DEF001C */        lw $t7, 0x1c($t7)
  /* 13B0D0 80132ED0 8D0896A0 */        lw $t0, %lo(D_ovl27_801396A0)($t0)
  /* 13B0D4 80132ED4 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 13B0D8 80132ED8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B0DC 80132EDC 01E82821 */      addu $a1, $t7, $t0
  /* 13B0E0 80132EE0 944E0024 */       lhu $t6, 0x24($v0)
  /* 13B0E4 80132EE4 3C014204 */       lui $at, (0x42040000 >> 16) # 33.0
  /* 13B0E8 80132EE8 44814000 */      mtc1 $at, $f8 # 33.0 to cop1
  /* 13B0EC 80132EEC 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 13B0F0 80132EF0 44815000 */      mtc1 $at, $f10 # 202.0 to cop1
  /* 13B0F4 80132EF4 31CDFFDF */      andi $t5, $t6, 0xffdf
  /* 13B0F8 80132EF8 A44D0024 */        sh $t5, 0x24($v0)
  /* 13B0FC 80132EFC 35AA0001 */       ori $t2, $t5, 1
  /* 13B100 80132F00 A44A0024 */        sh $t2, 0x24($v0)
  /* 13B104 80132F04 E4480058 */      swc1 $f8, 0x58($v0)
  /* 13B108 80132F08 E44A005C */      swc1 $f10, 0x5c($v0)
  .L80132F0C:
  /* 13B10C 80132F0C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13B110 80132F10 27BD00E0 */     addiu $sp, $sp, 0xe0
  /* 13B114 80132F14 03E00008 */        jr $ra
  /* 13B118 80132F18 00000000 */       nop

glabel mn1PCreatePortraitViewport
  /* 13B11C 80132F1C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13B120 80132F20 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13B124 80132F24 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13B128 80132F28 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13B12C 80132F2C 240F0028 */     addiu $t7, $zero, 0x28
  /* 13B130 80132F30 24180000 */     addiu $t8, $zero, 0
  /* 13B134 80132F34 3C190800 */       lui $t9, 0x800
  /* 13B138 80132F38 2408FFFF */     addiu $t0, $zero, -1
  /* 13B13C 80132F3C 24090001 */     addiu $t1, $zero, 1
  /* 13B140 80132F40 240A0001 */     addiu $t2, $zero, 1
  /* 13B144 80132F44 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13B148 80132F48 AFA90028 */        sw $t1, 0x28($sp)
  /* 13B14C 80132F4C AFA80020 */        sw $t0, 0x20($sp)
  /* 13B150 80132F50 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13B154 80132F54 AFB80018 */        sw $t8, 0x18($sp)
  /* 13B158 80132F58 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13B15C 80132F5C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13B160 80132F60 AFA00024 */        sw $zero, 0x24($sp)
  /* 13B164 80132F64 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13B168 80132F68 AFA00034 */        sw $zero, 0x34($sp)
  /* 13B16C 80132F6C 24040401 */     addiu $a0, $zero, 0x401
  /* 13B170 80132F70 00002825 */        or $a1, $zero, $zero
  /* 13B174 80132F74 24060010 */     addiu $a2, $zero, 0x10
  /* 13B178 80132F78 0C002E4F */       jal func_8000B93C
  /* 13B17C 80132F7C 3C078000 */       lui $a3, 0x8000
  /* 13B180 80132F80 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13B184 80132F84 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13B188 80132F88 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13B18C 80132F8C 8C430074 */        lw $v1, 0x74($v0)
  /* 13B190 80132F90 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13B194 80132F94 44050000 */      mfc1 $a1, $f0
  /* 13B198 80132F98 44060000 */      mfc1 $a2, $f0
  /* 13B19C 80132F9C 3C07439B */       lui $a3, 0x439b
  /* 13B1A0 80132FA0 24640008 */     addiu $a0, $v1, 8
  /* 13B1A4 80132FA4 0C001C20 */       jal func_80007080
  /* 13B1A8 80132FA8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13B1AC 80132FAC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13B1B0 80132FB0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13B1B4 80132FB4 03E00008 */        jr $ra
  /* 13B1B8 80132FB8 00000000 */       nop

glabel mn1PCreatePortraitBackgroundViewport
  /* 13B1BC 80132FBC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13B1C0 80132FC0 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13B1C4 80132FC4 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13B1C8 80132FC8 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13B1CC 80132FCC 240F003C */     addiu $t7, $zero, 0x3c
  /* 13B1D0 80132FD0 24180001 */     addiu $t8, $zero, 1
  /* 13B1D4 80132FD4 24190000 */     addiu $t9, $zero, 0
  /* 13B1D8 80132FD8 2408FFFF */     addiu $t0, $zero, -1
  /* 13B1DC 80132FDC 24090001 */     addiu $t1, $zero, 1
  /* 13B1E0 80132FE0 240A0001 */     addiu $t2, $zero, 1
  /* 13B1E4 80132FE4 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13B1E8 80132FE8 AFA90028 */        sw $t1, 0x28($sp)
  /* 13B1EC 80132FEC AFA80020 */        sw $t0, 0x20($sp)
  /* 13B1F0 80132FF0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13B1F4 80132FF4 AFB80018 */        sw $t8, 0x18($sp)
  /* 13B1F8 80132FF8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13B1FC 80132FFC AFAE0010 */        sw $t6, 0x10($sp)
  /* 13B200 80133000 AFA00024 */        sw $zero, 0x24($sp)
  /* 13B204 80133004 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13B208 80133008 AFA00034 */        sw $zero, 0x34($sp)
  /* 13B20C 8013300C 24040401 */     addiu $a0, $zero, 0x401
  /* 13B210 80133010 00002825 */        or $a1, $zero, $zero
  /* 13B214 80133014 24060010 */     addiu $a2, $zero, 0x10
  /* 13B218 80133018 0C002E4F */       jal func_8000B93C
  /* 13B21C 8013301C 3C078000 */       lui $a3, 0x8000
  /* 13B220 80133020 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13B224 80133024 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13B228 80133028 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13B22C 8013302C 8C430074 */        lw $v1, 0x74($v0)
  /* 13B230 80133030 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13B234 80133034 44050000 */      mfc1 $a1, $f0
  /* 13B238 80133038 44060000 */      mfc1 $a2, $f0
  /* 13B23C 8013303C 3C07439B */       lui $a3, 0x439b
  /* 13B240 80133040 24640008 */     addiu $a0, $v1, 8
  /* 13B244 80133044 0C001C20 */       jal func_80007080
  /* 13B248 80133048 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13B24C 8013304C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13B250 80133050 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13B254 80133054 03E00008 */        jr $ra
  /* 13B258 80133058 00000000 */       nop

glabel mn1PCreatePortraitWhiteBackgroundViewport
  /* 13B25C 8013305C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13B260 80133060 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13B264 80133064 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13B268 80133068 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13B26C 8013306C 240F0032 */     addiu $t7, $zero, 0x32
  /* 13B270 80133070 24180002 */     addiu $t8, $zero, 2
  /* 13B274 80133074 24190000 */     addiu $t9, $zero, 0
  /* 13B278 80133078 2408FFFF */     addiu $t0, $zero, -1
  /* 13B27C 8013307C 24090001 */     addiu $t1, $zero, 1
  /* 13B280 80133080 240A0001 */     addiu $t2, $zero, 1
  /* 13B284 80133084 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13B288 80133088 AFA90028 */        sw $t1, 0x28($sp)
  /* 13B28C 8013308C AFA80020 */        sw $t0, 0x20($sp)
  /* 13B290 80133090 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13B294 80133094 AFB80018 */        sw $t8, 0x18($sp)
  /* 13B298 80133098 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13B29C 8013309C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13B2A0 801330A0 AFA00024 */        sw $zero, 0x24($sp)
  /* 13B2A4 801330A4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13B2A8 801330A8 AFA00034 */        sw $zero, 0x34($sp)
  /* 13B2AC 801330AC 24040401 */     addiu $a0, $zero, 0x401
  /* 13B2B0 801330B0 00002825 */        or $a1, $zero, $zero
  /* 13B2B4 801330B4 24060010 */     addiu $a2, $zero, 0x10
  /* 13B2B8 801330B8 0C002E4F */       jal func_8000B93C
  /* 13B2BC 801330BC 3C078000 */       lui $a3, 0x8000
  /* 13B2C0 801330C0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13B2C4 801330C4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13B2C8 801330C8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13B2CC 801330CC 8C430074 */        lw $v1, 0x74($v0)
  /* 13B2D0 801330D0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13B2D4 801330D4 44050000 */      mfc1 $a1, $f0
  /* 13B2D8 801330D8 44060000 */      mfc1 $a2, $f0
  /* 13B2DC 801330DC 3C07439B */       lui $a3, 0x439b
  /* 13B2E0 801330E0 24640008 */     addiu $a0, $v1, 8
  /* 13B2E4 801330E4 0C001C20 */       jal func_80007080
  /* 13B2E8 801330E8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13B2EC 801330EC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13B2F0 801330F0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13B2F4 801330F4 03E00008 */        jr $ra
  /* 13B2F8 801330F8 00000000 */       nop

glabel mn1PCreatePanelViewport
  /* 13B2FC 801330FC 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13B300 80133100 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13B304 80133104 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13B308 80133108 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13B30C 8013310C 240F001E */     addiu $t7, $zero, 0x1e
  /* 13B310 80133110 24180000 */     addiu $t8, $zero, 0
  /* 13B314 80133114 3C191000 */       lui $t9, 0x1000
  /* 13B318 80133118 2408FFFF */     addiu $t0, $zero, -1
  /* 13B31C 8013311C 24090001 */     addiu $t1, $zero, 1
  /* 13B320 80133120 240A0001 */     addiu $t2, $zero, 1
  /* 13B324 80133124 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13B328 80133128 AFA90028 */        sw $t1, 0x28($sp)
  /* 13B32C 8013312C AFA80020 */        sw $t0, 0x20($sp)
  /* 13B330 80133130 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13B334 80133134 AFB80018 */        sw $t8, 0x18($sp)
  /* 13B338 80133138 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13B33C 8013313C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13B340 80133140 AFA00024 */        sw $zero, 0x24($sp)
  /* 13B344 80133144 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13B348 80133148 AFA00034 */        sw $zero, 0x34($sp)
  /* 13B34C 8013314C 24040401 */     addiu $a0, $zero, 0x401
  /* 13B350 80133150 00002825 */        or $a1, $zero, $zero
  /* 13B354 80133154 24060010 */     addiu $a2, $zero, 0x10
  /* 13B358 80133158 0C002E4F */       jal func_8000B93C
  /* 13B35C 8013315C 3C078000 */       lui $a3, 0x8000
  /* 13B360 80133160 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13B364 80133164 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13B368 80133168 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13B36C 8013316C 8C430074 */        lw $v1, 0x74($v0)
  /* 13B370 80133170 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13B374 80133174 44050000 */      mfc1 $a1, $f0
  /* 13B378 80133178 44060000 */      mfc1 $a2, $f0
  /* 13B37C 8013317C 3C07439B */       lui $a3, 0x439b
  /* 13B380 80133180 24640008 */     addiu $a0, $v1, 8
  /* 13B384 80133184 0C001C20 */       jal func_80007080
  /* 13B388 80133188 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13B38C 8013318C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13B390 80133190 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13B394 80133194 03E00008 */        jr $ra
  /* 13B398 80133198 00000000 */       nop

glabel mn1PUpdatePanel
  /* 13B39C 8013319C 3C0E8014 */       lui $t6, %hi(dMN1PPanelOffsets)
  /* 13B3A0 801331A0 25CE8A04 */     addiu $t6, $t6, %lo(dMN1PPanelOffsets)
  /* 13B3A4 801331A4 8DD80000 */        lw $t8, ($t6) # dMN1PPanelOffsets + 0
  /* 13B3A8 801331A8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13B3AC 801331AC 27A30004 */     addiu $v1, $sp, 4
  /* 13B3B0 801331B0 AC780000 */        sw $t8, ($v1)
  /* 13B3B4 801331B4 8DCF0004 */        lw $t7, 4($t6) # dMN1PPanelOffsets + 4
  /* 13B3B8 801331B8 0005C880 */       sll $t9, $a1, 2
  /* 13B3BC 801331BC 00794021 */      addu $t0, $v1, $t9
  /* 13B3C0 801331C0 AC6F0004 */        sw $t7, 4($v1)
  /* 13B3C4 801331C4 8DD80008 */        lw $t8, 8($t6) # dMN1PPanelOffsets + 8
  /* 13B3C8 801331C8 3C0A8014 */       lui $t2, %hi(D_ovl27_801396A0)
  /* 13B3CC 801331CC AC780008 */        sw $t8, 8($v1)
  /* 13B3D0 801331D0 8DCF000C */        lw $t7, 0xc($t6) # dMN1PPanelOffsets + 12
  /* 13B3D4 801331D4 AC6F000C */        sw $t7, 0xc($v1)
  /* 13B3D8 801331D8 8D4A96A0 */        lw $t2, %lo(D_ovl27_801396A0)($t2)
  /* 13B3DC 801331DC 8D090000 */        lw $t1, ($t0)
  /* 13B3E0 801331E0 8C820074 */        lw $v0, 0x74($a0)
  /* 13B3E4 801331E4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13B3E8 801331E8 012A5821 */      addu $t3, $t1, $t2
  /* 13B3EC 801331EC 03E00008 */        jr $ra
  /* 13B3F0 801331F0 AC4B0030 */        sw $t3, 0x30($v0)

glabel mn1PCreatePanel
  /* 13B3F4 801331F4 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 13B3F8 801331F8 3C0F8014 */       lui $t7, %hi(dMN1PTypeOffsets)
  /* 13B3FC 801331FC AFBF0034 */        sw $ra, 0x34($sp)
  /* 13B400 80133200 AFA40070 */        sw $a0, 0x70($sp)
  /* 13B404 80133204 25EF8A14 */     addiu $t7, $t7, %lo(dMN1PTypeOffsets)
  /* 13B408 80133208 8DF90000 */        lw $t9, ($t7) # dMN1PTypeOffsets + 0
  /* 13B40C 8013320C 8DF80004 */        lw $t8, 4($t7) # dMN1PTypeOffsets + 4
  /* 13B410 80133210 27AE0058 */     addiu $t6, $sp, 0x58
  /* 13B414 80133214 ADD90000 */        sw $t9, ($t6)
  /* 13B418 80133218 ADD80004 */        sw $t8, 4($t6)
  /* 13B41C 8013321C 8DF8000C */        lw $t8, 0xc($t7) # dMN1PTypeOffsets + 12
  /* 13B420 80133220 8DF90008 */        lw $t9, 8($t7) # dMN1PTypeOffsets + 8
  /* 13B424 80133224 3C098014 */       lui $t1, %hi(dMN1PTypeOffsetsX)
  /* 13B428 80133228 25298A24 */     addiu $t1, $t1, %lo(dMN1PTypeOffsetsX)
  /* 13B42C 8013322C ADD8000C */        sw $t8, 0xc($t6)
  /* 13B430 80133230 ADD90008 */        sw $t9, 8($t6)
  /* 13B434 80133234 8D2A0004 */        lw $t2, 4($t1) # dMN1PTypeOffsetsX + 4
  /* 13B438 80133238 8D2B0000 */        lw $t3, ($t1) # dMN1PTypeOffsetsX + 0
  /* 13B43C 8013323C 27A80048 */     addiu $t0, $sp, 0x48
  /* 13B440 80133240 AD0A0004 */        sw $t2, 4($t0)
  /* 13B444 80133244 AD0B0000 */        sw $t3, ($t0)
  /* 13B448 80133248 8D2B0008 */        lw $t3, 8($t1) # dMN1PTypeOffsetsX + 8
  /* 13B44C 8013324C 8D2A000C */        lw $t2, 0xc($t1) # dMN1PTypeOffsetsX + 12
  /* 13B450 80133250 3C0E8014 */       lui $t6, %hi(D_ovl27_801396B4)
  /* 13B454 80133254 AD0B0008 */        sw $t3, 8($t0)
  /* 13B458 80133258 AD0A000C */        sw $t2, 0xc($t0)
  /* 13B45C 8013325C 8DCE96B4 */        lw $t6, %lo(D_ovl27_801396B4)($t6)
  /* 13B460 80133260 3C0F0000 */       lui $t7, %hi(D_NF_000032A8)
  /* 13B464 80133264 25EF32A8 */     addiu $t7, $t7, %lo(D_NF_000032A8)
  /* 13B468 80133268 3C02800D */       lui $v0, %hi(func_ovl0_800CCF00)
  /* 13B46C 8013326C 3C078000 */       lui $a3, 0x8000
  /* 13B470 80133270 2442CF00 */     addiu $v0, $v0, %lo(func_ovl0_800CCF00)
  /* 13B474 80133274 24080001 */     addiu $t0, $zero, 1
  /* 13B478 80133278 24190001 */     addiu $t9, $zero, 1
  /* 13B47C 8013327C 240C001C */     addiu $t4, $zero, 0x1c
  /* 13B480 80133280 240DFFFF */     addiu $t5, $zero, -1
  /* 13B484 80133284 01CFC021 */      addu $t8, $t6, $t7
  /* 13B488 80133288 AFB80020 */        sw $t8, 0x20($sp)
  /* 13B48C 8013328C AFAD001C */        sw $t5, 0x1c($sp)
  /* 13B490 80133290 AFAC0014 */        sw $t4, 0x14($sp)
  /* 13B494 80133294 AFB90024 */        sw $t9, 0x24($sp)
  /* 13B498 80133298 AFA8002C */        sw $t0, 0x2c($sp)
  /* 13B49C 8013329C AFA20010 */        sw $v0, 0x10($sp)
  /* 13B4A0 801332A0 AFA20044 */        sw $v0, 0x44($sp)
  /* 13B4A4 801332A4 AFA70018 */        sw $a3, 0x18($sp)
  /* 13B4A8 801332A8 AFA00028 */        sw $zero, 0x28($sp)
  /* 13B4AC 801332AC 00002025 */        or $a0, $zero, $zero
  /* 13B4B0 801332B0 00002825 */        or $a1, $zero, $zero
  /* 13B4B4 801332B4 0C033414 */       jal func_ovl0_800CD050
  /* 13B4B8 801332B8 24060016 */     addiu $a2, $zero, 0x16
  /* 13B4BC 801332BC AFA2006C */        sw $v0, 0x6c($sp)
  /* 13B4C0 801332C0 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 13B4C4 801332C4 44812000 */      mtc1 $at, $f4 # 25.0 to cop1
  /* 13B4C8 801332C8 8C490074 */        lw $t1, 0x74($v0)
  /* 13B4CC 801332CC 3C0142FE */       lui $at, (0x42FE0000 >> 16) # 127.0
  /* 13B4D0 801332D0 44813000 */      mtc1 $at, $f6 # 127.0 to cop1
  /* 13B4D4 801332D4 E5240058 */      swc1 $f4, 0x58($t1)
  /* 13B4D8 801332D8 8C4A0074 */        lw $t2, 0x74($v0)
  /* 13B4DC 801332DC 3C018014 */       lui $at, %hi(D_ovl27_80138EFC)
  /* 13B4E0 801332E0 3C188014 */       lui $t8, %hi(D_ovl27_801396A0)
  /* 13B4E4 801332E4 E546005C */      swc1 $f6, 0x5c($t2)
  /* 13B4E8 801332E8 8C430074 */        lw $v1, 0x74($v0)
  /* 13B4EC 801332EC 00402025 */        or $a0, $v0, $zero
  /* 13B4F0 801332F0 946B0024 */       lhu $t3, 0x24($v1)
  /* 13B4F4 801332F4 316CFFDF */      andi $t4, $t3, 0xffdf
  /* 13B4F8 801332F8 A46C0024 */        sh $t4, 0x24($v1)
  /* 13B4FC 801332FC 8C430074 */        lw $v1, 0x74($v0)
  /* 13B500 80133300 946D0024 */       lhu $t5, 0x24($v1)
  /* 13B504 80133304 35AE0001 */       ori $t6, $t5, 1
  /* 13B508 80133308 A46E0024 */        sh $t6, 0x24($v1)
  /* 13B50C 8013330C 8FA60070 */        lw $a2, 0x70($sp)
  /* 13B510 80133310 AC228EFC */        sw $v0, %lo(D_ovl27_80138EFC)($at)
  /* 13B514 80133314 8F1896A0 */        lw $t8, %lo(D_ovl27_801396A0)($t8)
  /* 13B518 80133318 00063080 */       sll $a2, $a2, 2
  /* 13B51C 8013331C 03A67821 */      addu $t7, $sp, $a2
  /* 13B520 80133320 8DEF0058 */        lw $t7, 0x58($t7)
  /* 13B524 80133324 AFA60040 */        sw $a2, 0x40($sp)
  /* 13B528 80133328 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B52C 8013332C 01F82821 */      addu $a1, $t7, $t8
  /* 13B530 80133330 8FA60040 */        lw $a2, 0x40($sp)
  /* 13B534 80133334 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 13B538 80133338 44815000 */      mtc1 $at, $f10 # 25.0 to cop1
  /* 13B53C 8013333C 03A6C821 */      addu $t9, $sp, $a2
  /* 13B540 80133340 C7280048 */      lwc1 $f8, 0x48($t9)
  /* 13B544 80133344 94480024 */       lhu $t0, 0x24($v0)
  /* 13B548 80133348 3C014304 */       lui $at, (0x43040000 >> 16) # 132.0
  /* 13B54C 8013334C 460A4400 */     add.s $f16, $f8, $f10
  /* 13B550 80133350 44819000 */      mtc1 $at, $f18 # 132.0 to cop1
  /* 13B554 80133354 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 13B558 80133358 A44A0024 */        sh $t2, 0x24($v0)
  /* 13B55C 8013335C 354B0001 */       ori $t3, $t2, 1
  /* 13B560 80133360 E4500058 */      swc1 $f16, 0x58($v0)
  /* 13B564 80133364 A44B0024 */        sh $t3, 0x24($v0)
  /* 13B568 80133368 A0400028 */        sb $zero, 0x28($v0)
  /* 13B56C 8013336C A0400029 */        sb $zero, 0x29($v0)
  /* 13B570 80133370 A040002A */        sb $zero, 0x2a($v0)
  /* 13B574 80133374 E452005C */      swc1 $f18, 0x5c($v0)
  /* 13B578 80133378 8FA50070 */        lw $a1, 0x70($sp)
  /* 13B57C 8013337C 0C04CC67 */       jal mn1PUpdatePanel
  /* 13B580 80133380 8FA4006C */        lw $a0, 0x6c($sp)
  /* 13B584 80133384 00002025 */        or $a0, $zero, $zero
  /* 13B588 80133388 00002825 */        or $a1, $zero, $zero
  /* 13B58C 8013338C 24060016 */     addiu $a2, $zero, 0x16
  /* 13B590 80133390 0C00265A */       jal omMakeGObjSPAfter
  /* 13B594 80133394 3C078000 */       lui $a3, 0x8000
  /* 13B598 80133398 3C018014 */       lui $at, %hi(D_ovl27_80138EF4)
  /* 13B59C 8013339C 240CFFFF */     addiu $t4, $zero, -1
  /* 13B5A0 801333A0 AC228EF4 */        sw $v0, %lo(D_ovl27_80138EF4)($at)
  /* 13B5A4 801333A4 AFAC0010 */        sw $t4, 0x10($sp)
  /* 13B5A8 801333A8 00402025 */        or $a0, $v0, $zero
  /* 13B5AC 801333AC 8FA50044 */        lw $a1, 0x44($sp)
  /* 13B5B0 801333B0 2406001C */     addiu $a2, $zero, 0x1c
  /* 13B5B4 801333B4 0C00277D */       jal omAddGObjRenderProc
  /* 13B5B8 801333B8 3C078000 */       lui $a3, 0x8000
  /* 13B5BC 801333BC 0C04D631 */       jal mn1PSyncNameAndLogo
  /* 13B5C0 801333C0 8FA40070 */        lw $a0, 0x70($sp)
  /* 13B5C4 801333C4 8FBF0034 */        lw $ra, 0x34($sp)
  /* 13B5C8 801333C8 27BD0070 */     addiu $sp, $sp, 0x70
  /* 13B5CC 801333CC 03E00008 */        jr $ra
  /* 13B5D0 801333D0 00000000 */       nop

glabel mn1PCreateNumber
  /* 13B5D4 801333D4 27BDFF48 */     addiu $sp, $sp, -0xb8
  /* 13B5D8 801333D8 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 13B5DC 801333DC 3C0E8014 */       lui $t6, %hi(dMN1PNumberOffsets)
  /* 13B5E0 801333E0 AFB40038 */        sw $s4, 0x38($sp)
  /* 13B5E4 801333E4 27A20090 */     addiu $v0, $sp, 0x90
  /* 13B5E8 801333E8 25CE8A34 */     addiu $t6, $t6, %lo(dMN1PNumberOffsets)
  /* 13B5EC 801333EC 4487B000 */      mtc1 $a3, $f22
  /* 13B5F0 801333F0 00A0A025 */        or $s4, $a1, $zero
  /* 13B5F4 801333F4 AFBF004C */        sw $ra, 0x4c($sp)
  /* 13B5F8 801333F8 AFBE0048 */        sw $fp, 0x48($sp)
  /* 13B5FC 801333FC AFB70044 */        sw $s7, 0x44($sp)
  /* 13B600 80133400 AFB60040 */        sw $s6, 0x40($sp)
  /* 13B604 80133404 AFB5003C */        sw $s5, 0x3c($sp)
  /* 13B608 80133408 AFB30034 */        sw $s3, 0x34($sp)
  /* 13B60C 8013340C AFB20030 */        sw $s2, 0x30($sp)
  /* 13B610 80133410 AFB1002C */        sw $s1, 0x2c($sp)
  /* 13B614 80133414 AFB00028 */        sw $s0, 0x28($sp)
  /* 13B618 80133418 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 13B61C 8013341C AFA400B8 */        sw $a0, 0xb8($sp)
  /* 13B620 80133420 AFA600C0 */        sw $a2, 0xc0($sp)
  /* 13B624 80133424 25C80024 */     addiu $t0, $t6, 0x24
  /* 13B628 80133428 0040C825 */        or $t9, $v0, $zero
  .L8013342C:
  /* 13B62C 8013342C 8DD80000 */        lw $t8, ($t6) # dMN1PNumberOffsets + 0
  /* 13B630 80133430 25CE000C */     addiu $t6, $t6, 0xc
  /* 13B634 80133434 2739000C */     addiu $t9, $t9, 0xc
  /* 13B638 80133438 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13B63C 8013343C 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PNumberOffsets + -8
  /* 13B640 80133440 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13B644 80133444 8DD8FFFC */        lw $t8, -4($t6) # dMN1PNumberOffsets + -4
  /* 13B648 80133448 15C8FFF8 */       bne $t6, $t0, .L8013342C
  /* 13B64C 8013344C AF38FFFC */        sw $t8, -4($t9)
  /* 13B650 80133450 8DD80000 */        lw $t8, ($t6) # dMN1PNumberOffsets + 0
  /* 13B654 80133454 3C0A8014 */       lui $t2, %hi(dMN1PNumberWidths)
  /* 13B658 80133458 254A8A5C */     addiu $t2, $t2, %lo(dMN1PNumberWidths)
  /* 13B65C 8013345C 254D0024 */     addiu $t5, $t2, 0x24
  /* 13B660 80133460 27A90068 */     addiu $t1, $sp, 0x68
  /* 13B664 80133464 AF380000 */        sw $t8, ($t9)
  .L80133468:
  /* 13B668 80133468 8D4C0000 */        lw $t4, ($t2) # dMN1PNumberWidths + 0
  /* 13B66C 8013346C 254A000C */     addiu $t2, $t2, 0xc
  /* 13B670 80133470 2529000C */     addiu $t1, $t1, 0xc
  /* 13B674 80133474 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 13B678 80133478 8D4BFFF8 */        lw $t3, -8($t2) # dMN1PNumberWidths + -8
  /* 13B67C 8013347C AD2BFFF8 */        sw $t3, -8($t1)
  /* 13B680 80133480 8D4CFFFC */        lw $t4, -4($t2) # dMN1PNumberWidths + -4
  /* 13B684 80133484 154DFFF8 */       bne $t2, $t5, .L80133468
  /* 13B688 80133488 AD2CFFFC */        sw $t4, -4($t1)
  /* 13B68C 8013348C 8D4C0000 */        lw $t4, ($t2) # dMN1PNumberWidths + 0
  /* 13B690 80133490 2417000A */     addiu $s7, $zero, 0xa
  /* 13B694 80133494 3C1E8014 */       lui $fp, %hi(D_ovl27_801396A0)
  /* 13B698 80133498 AD2C0000 */        sw $t4, ($t1)
  /* 13B69C 8013349C 06810002 */      bgez $s4, .L801334A8
  /* 13B6A0 801334A0 C7B400C0 */      lwc1 $f20, 0xc0($sp)
  /* 13B6A4 801334A4 0000A025 */        or $s4, $zero, $zero
  .L801334A8:
  /* 13B6A8 801334A8 0297001A */       div $zero, $s4, $s7
  /* 13B6AC 801334AC 00008810 */      mfhi $s1
  /* 13B6B0 801334B0 00118880 */       sll $s1, $s1, 2
  /* 13B6B4 801334B4 27DE96A0 */     addiu $fp, $fp, %lo(D_ovl27_801396A0)
  /* 13B6B8 801334B8 00514021 */      addu $t0, $v0, $s1
  /* 13B6BC 801334BC 8D0E0000 */        lw $t6, ($t0)
  /* 13B6C0 801334C0 8FD90000 */        lw $t9, ($fp) # D_ovl27_801396A0 + 0
  /* 13B6C4 801334C4 8FA400B8 */        lw $a0, 0xb8($sp)
  /* 13B6C8 801334C8 16E00002 */      bnez $s7, .L801334D4
  /* 13B6CC 801334CC 00000000 */       nop
  /* 13B6D0 801334D0 0007000D */     break 7
  .L801334D4:
  /* 13B6D4 801334D4 2401FFFF */     addiu $at, $zero, -1
  /* 13B6D8 801334D8 16E10004 */       bne $s7, $at, .L801334EC
  /* 13B6DC 801334DC 3C018000 */       lui $at, 0x8000
  /* 13B6E0 801334E0 16810002 */       bne $s4, $at, .L801334EC
  /* 13B6E4 801334E4 00000000 */       nop
  /* 13B6E8 801334E8 0006000D */     break 6
  .L801334EC:
  /* 13B6EC 801334EC 01D92821 */      addu $a1, $t6, $t9
  /* 13B6F0 801334F0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B6F4 801334F4 00000000 */       nop
  /* 13B6F8 801334F8 8FB500C8 */        lw $s5, 0xc8($sp)
  /* 13B6FC 801334FC 00408025 */        or $s0, $v0, $zero
  /* 13B700 80133500 00402025 */        or $a0, $v0, $zero
  /* 13B704 80133504 0C04C6FE */       jal mn1PSetTextureColors
  /* 13B708 80133508 02A02825 */        or $a1, $s5, $zero
  /* 13B70C 8013350C 03B17821 */      addu $t7, $sp, $s1
  /* 13B710 80133510 C5E60068 */      lwc1 $f6, 0x68($t7)
  /* 13B714 80133514 C7A400C0 */      lwc1 $f4, 0xc0($sp)
  /* 13B718 80133518 8FB600D0 */        lw $s6, 0xd0($sp)
  /* 13B71C 8013351C E616005C */      swc1 $f22, 0x5c($s0)
  /* 13B720 80133520 46062501 */     sub.s $f20, $f4, $f6
  /* 13B724 80133524 24120001 */     addiu $s2, $zero, 1
  /* 13B728 80133528 12C00004 */      beqz $s6, .L8013353C
  /* 13B72C 8013352C E6140058 */      swc1 $f20, 0x58($s0)
  /* 13B730 80133530 8FB300CC */        lw $s3, 0xcc($sp)
  /* 13B734 80133534 10000006 */         b .L80133550
  /* 13B738 80133538 02601825 */        or $v1, $s3, $zero
  .L8013353C:
  /* 13B73C 8013353C 8FB300CC */        lw $s3, 0xcc($sp)
  /* 13B740 80133540 02802025 */        or $a0, $s4, $zero
  /* 13B744 80133544 0C04C710 */       jal mn1PGetNumberOfDigits
  /* 13B748 80133548 02602825 */        or $a1, $s3, $zero
  /* 13B74C 8013354C 00401825 */        or $v1, $v0, $zero
  .L80133550:
  /* 13B750 80133550 28610002 */      slti $at, $v1, 2
  /* 13B754 80133554 1420003C */      bnez $at, .L80133648
  /* 13B758 80133558 02E02025 */        or $a0, $s7, $zero
  .L8013355C:
  /* 13B75C 8013355C 0C04C6D6 */       jal mn1PPow
  /* 13B760 80133560 02402825 */        or $a1, $s2, $zero
  /* 13B764 80133564 10400011 */      beqz $v0, .L801335AC
  /* 13B768 80133568 00001825 */        or $v1, $zero, $zero
  /* 13B76C 8013356C 02E02025 */        or $a0, $s7, $zero
  /* 13B770 80133570 0C04C6D6 */       jal mn1PPow
  /* 13B774 80133574 02402825 */        or $a1, $s2, $zero
  /* 13B778 80133578 0282001A */       div $zero, $s4, $v0
  /* 13B77C 8013357C 00001812 */      mflo $v1
  /* 13B780 80133580 14400002 */      bnez $v0, .L8013358C
  /* 13B784 80133584 00000000 */       nop
  /* 13B788 80133588 0007000D */     break 7
  .L8013358C:
  /* 13B78C 8013358C 2401FFFF */     addiu $at, $zero, -1
  /* 13B790 80133590 14410004 */       bne $v0, $at, .L801335A4
  /* 13B794 80133594 3C018000 */       lui $at, 0x8000
  /* 13B798 80133598 16810002 */       bne $s4, $at, .L801335A4
  /* 13B79C 8013359C 00000000 */       nop
  /* 13B7A0 801335A0 0006000D */     break 6
  .L801335A4:
  /* 13B7A4 801335A4 10000001 */         b .L801335AC
  /* 13B7A8 801335A8 00000000 */       nop
  .L801335AC:
  /* 13B7AC 801335AC 0077001A */       div $zero, $v1, $s7
  /* 13B7B0 801335B0 00008810 */      mfhi $s1
  /* 13B7B4 801335B4 00118880 */       sll $s1, $s1, 2
  /* 13B7B8 801335B8 03B1C021 */      addu $t8, $sp, $s1
  /* 13B7BC 801335BC 8F180090 */        lw $t8, 0x90($t8)
  /* 13B7C0 801335C0 8FCD0000 */        lw $t5, ($fp) # D_ovl27_801396A0 + 0
  /* 13B7C4 801335C4 8FA400B8 */        lw $a0, 0xb8($sp)
  /* 13B7C8 801335C8 16E00002 */      bnez $s7, .L801335D4
  /* 13B7CC 801335CC 00000000 */       nop
  /* 13B7D0 801335D0 0007000D */     break 7
  .L801335D4:
  /* 13B7D4 801335D4 2401FFFF */     addiu $at, $zero, -1
  /* 13B7D8 801335D8 16E10004 */       bne $s7, $at, .L801335EC
  /* 13B7DC 801335DC 3C018000 */       lui $at, 0x8000
  /* 13B7E0 801335E0 14610002 */       bne $v1, $at, .L801335EC
  /* 13B7E4 801335E4 00000000 */       nop
  /* 13B7E8 801335E8 0006000D */     break 6
  .L801335EC:
  /* 13B7EC 801335EC 030D2821 */      addu $a1, $t8, $t5
  /* 13B7F0 801335F0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B7F4 801335F4 00000000 */       nop
  /* 13B7F8 801335F8 00408025 */        or $s0, $v0, $zero
  /* 13B7FC 801335FC 00402025 */        or $a0, $v0, $zero
  /* 13B800 80133600 0C04C6FE */       jal mn1PSetTextureColors
  /* 13B804 80133604 02A02825 */        or $a1, $s5, $zero
  /* 13B808 80133608 03B15021 */      addu $t2, $sp, $s1
  /* 13B80C 8013360C C5480068 */      lwc1 $f8, 0x68($t2)
  /* 13B810 80133610 26520001 */     addiu $s2, $s2, 1
  /* 13B814 80133614 02802025 */        or $a0, $s4, $zero
  /* 13B818 80133618 4608A501 */     sub.s $f20, $f20, $f8
  /* 13B81C 8013361C E616005C */      swc1 $f22, 0x5c($s0)
  /* 13B820 80133620 12C00003 */      beqz $s6, .L80133630
  /* 13B824 80133624 E6140058 */      swc1 $f20, 0x58($s0)
  /* 13B828 80133628 10000004 */         b .L8013363C
  /* 13B82C 8013362C 02601825 */        or $v1, $s3, $zero
  .L80133630:
  /* 13B830 80133630 0C04C710 */       jal mn1PGetNumberOfDigits
  /* 13B834 80133634 02602825 */        or $a1, $s3, $zero
  /* 13B838 80133638 00401825 */        or $v1, $v0, $zero
  .L8013363C:
  /* 13B83C 8013363C 0243082A */       slt $at, $s2, $v1
  /* 13B840 80133640 5420FFC6 */      bnel $at, $zero, .L8013355C
  /* 13B844 80133644 02E02025 */        or $a0, $s7, $zero
  .L80133648:
  /* 13B848 80133648 8FBF004C */        lw $ra, 0x4c($sp)
  /* 13B84C 8013364C D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 13B850 80133650 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13B854 80133654 8FB00028 */        lw $s0, 0x28($sp)
  /* 13B858 80133658 8FB1002C */        lw $s1, 0x2c($sp)
  /* 13B85C 8013365C 8FB20030 */        lw $s2, 0x30($sp)
  /* 13B860 80133660 8FB30034 */        lw $s3, 0x34($sp)
  /* 13B864 80133664 8FB40038 */        lw $s4, 0x38($sp)
  /* 13B868 80133668 8FB5003C */        lw $s5, 0x3c($sp)
  /* 13B86C 8013366C 8FB60040 */        lw $s6, 0x40($sp)
  /* 13B870 80133670 8FB70044 */        lw $s7, 0x44($sp)
  /* 13B874 80133674 8FBE0048 */        lw $fp, 0x48($sp)
  /* 13B878 80133678 03E00008 */        jr $ra
  /* 13B87C 8013367C 27BD00B8 */     addiu $sp, $sp, 0xb8

glabel mn1PDrawTimerValue
  /* 13B880 80133680 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13B884 80133684 3C0E8014 */       lui $t6, %hi(dMN1PNumberColorsTime)
  /* 13B888 80133688 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13B88C 8013368C AFB20030 */        sw $s2, 0x30($sp)
  /* 13B890 80133690 AFB1002C */        sw $s1, 0x2c($sp)
  /* 13B894 80133694 AFB00028 */        sw $s0, 0x28($sp)
  /* 13B898 80133698 25CE8A84 */     addiu $t6, $t6, %lo(dMN1PNumberColorsTime)
  /* 13B89C 8013369C 8DD80000 */        lw $t8, ($t6) # dMN1PNumberColorsTime + 0
  /* 13B8A0 801336A0 27A20048 */     addiu $v0, $sp, 0x48
  /* 13B8A4 801336A4 3C128014 */       lui $s2, %hi(gMN1PPickerGObj)
  /* 13B8A8 801336A8 AC580000 */        sw $t8, ($v0)
  /* 13B8AC 801336AC 8DCF0004 */        lw $t7, 4($t6) # dMN1PNumberColorsTime + 4
  /* 13B8B0 801336B0 26528F70 */     addiu $s2, $s2, %lo(gMN1PPickerGObj)
  /* 13B8B4 801336B4 8E510000 */        lw $s1, ($s2) # gMN1PPickerGObj + 0
  /* 13B8B8 801336B8 AC4F0004 */        sw $t7, 4($v0)
  /* 13B8BC 801336BC 8DD80008 */        lw $t8, 8($t6) # dMN1PNumberColorsTime + 8
  /* 13B8C0 801336C0 00802825 */        or $a1, $a0, $zero
  /* 13B8C4 801336C4 AC580008 */        sw $t8, 8($v0)
  /* 13B8C8 801336C8 8DCF000C */        lw $t7, 0xc($t6) # dMN1PNumberColorsTime + 12
  /* 13B8CC 801336CC AC4F000C */        sw $t7, 0xc($v0)
  /* 13B8D0 801336D0 8DD80010 */        lw $t8, 0x10($t6) # dMN1PNumberColorsTime + 16
  /* 13B8D4 801336D4 AC580010 */        sw $t8, 0x10($v0)
  /* 13B8D8 801336D8 8DCF0014 */        lw $t7, 0x14($t6) # dMN1PNumberColorsTime + 20
  /* 13B8DC 801336DC AC4F0014 */        sw $t7, 0x14($v0)
  /* 13B8E0 801336E0 8E390074 */        lw $t9, 0x74($s1)
  /* 13B8E4 801336E4 8F300008 */        lw $s0, 8($t9)
  /* 13B8E8 801336E8 5200000C */      beql $s0, $zero, .L8013371C
  /* 13B8EC 801336EC 24010064 */     addiu $at, $zero, 0x64
  /* 13B8F0 801336F0 AFA40060 */        sw $a0, 0x60($sp)
  .L801336F4:
  /* 13B8F4 801336F4 0C0025BB */       jal omEjectSObj
  /* 13B8F8 801336F8 02002025 */        or $a0, $s0, $zero
  /* 13B8FC 801336FC 8E510000 */        lw $s1, ($s2) # gMN1PPickerGObj + 0
  /* 13B900 80133700 8E280074 */        lw $t0, 0x74($s1)
  /* 13B904 80133704 8D100008 */        lw $s0, 8($t0)
  /* 13B908 80133708 1600FFFA */      bnez $s0, .L801336F4
  /* 13B90C 8013370C 00000000 */       nop
  /* 13B910 80133710 8FA50060 */        lw $a1, 0x60($sp)
  /* 13B914 80133714 27A20048 */     addiu $v0, $sp, 0x48
  /* 13B918 80133718 24010064 */     addiu $at, $zero, 0x64
  .L8013371C:
  /* 13B91C 8013371C 14A1001F */       bne $a1, $at, .L8013379C
  /* 13B920 80133720 02202025 */        or $a0, $s1, $zero
  /* 13B924 80133724 3C098014 */       lui $t1, %hi(D_ovl27_801396A0)
  /* 13B928 80133728 8D2996A0 */        lw $t1, %lo(D_ovl27_801396A0)($t1)
  /* 13B92C 8013372C 3C0A0000 */       lui $t2, %hi(D_NF_00003EF0)
  /* 13B930 80133730 254A3EF0 */     addiu $t2, $t2, %lo(D_NF_00003EF0)
  /* 13B934 80133734 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13B938 80133738 012A2821 */      addu $a1, $t1, $t2
  /* 13B93C 8013373C 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 13B940 80133740 44812000 */      mtc1 $at, $f4 # 194.0 to cop1
  /* 13B944 80133744 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 13B948 80133748 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 13B94C 8013374C E4440058 */      swc1 $f4, 0x58($v0)
  /* 13B950 80133750 94590024 */       lhu $t9, 0x24($v0)
  /* 13B954 80133754 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13B958 80133758 8FAB0048 */        lw $t3, 0x48($sp)
  /* 13B95C 8013375C 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 13B960 80133760 352A0001 */       ori $t2, $t1, 1
  /* 13B964 80133764 A04B0060 */        sb $t3, 0x60($v0)
  /* 13B968 80133768 8FAC004C */        lw $t4, 0x4c($sp)
  /* 13B96C 8013376C A04C0061 */        sb $t4, 0x61($v0)
  /* 13B970 80133770 8FAD0050 */        lw $t5, 0x50($sp)
  /* 13B974 80133774 A04D0062 */        sb $t5, 0x62($v0)
  /* 13B978 80133778 8FAE0054 */        lw $t6, 0x54($sp)
  /* 13B97C 8013377C A04E0028 */        sb $t6, 0x28($v0)
  /* 13B980 80133780 8FAF0058 */        lw $t7, 0x58($sp)
  /* 13B984 80133784 A04F0029 */        sb $t7, 0x29($v0)
  /* 13B988 80133788 8FB8005C */        lw $t8, 0x5c($sp)
  /* 13B98C 8013378C A4490024 */        sh $t1, 0x24($v0)
  /* 13B990 80133790 A44A0024 */        sh $t2, 0x24($v0)
  /* 13B994 80133794 10000015 */         b .L801337EC
  /* 13B998 80133798 A058002A */        sb $t8, 0x2a($v0)
  .L8013379C:
  /* 13B99C 8013379C 28A1000A */      slti $at, $a1, 0xa
  /* 13B9A0 801337A0 1020000B */      beqz $at, .L801337D0
  /* 13B9A4 801337A4 02202025 */        or $a0, $s1, $zero
  /* 13B9A8 801337A8 240B0002 */     addiu $t3, $zero, 2
  /* 13B9AC 801337AC AFAB0014 */        sw $t3, 0x14($sp)
  /* 13B9B0 801337B0 02202025 */        or $a0, $s1, $zero
  /* 13B9B4 801337B4 3C06434D */       lui $a2, 0x434d
  /* 13B9B8 801337B8 3C0741B8 */       lui $a3, 0x41b8
  /* 13B9BC 801337BC AFA20010 */        sw $v0, 0x10($sp)
  /* 13B9C0 801337C0 0C04CCF5 */       jal mn1PCreateNumber
  /* 13B9C4 801337C4 AFA00018 */        sw $zero, 0x18($sp)
  /* 13B9C8 801337C8 10000009 */         b .L801337F0
  /* 13B9CC 801337CC 8FBF0034 */        lw $ra, 0x34($sp)
  .L801337D0:
  /* 13B9D0 801337D0 240C0002 */     addiu $t4, $zero, 2
  /* 13B9D4 801337D4 AFAC0014 */        sw $t4, 0x14($sp)
  /* 13B9D8 801337D8 3C064351 */       lui $a2, 0x4351
  /* 13B9DC 801337DC 3C0741B8 */       lui $a3, 0x41b8
  /* 13B9E0 801337E0 AFA20010 */        sw $v0, 0x10($sp)
  /* 13B9E4 801337E4 0C04CCF5 */       jal mn1PCreateNumber
  /* 13B9E8 801337E8 AFA00018 */        sw $zero, 0x18($sp)
  .L801337EC:
  /* 13B9EC 801337EC 8FBF0034 */        lw $ra, 0x34($sp)
  .L801337F0:
  /* 13B9F0 801337F0 8FB00028 */        lw $s0, 0x28($sp)
  /* 13B9F4 801337F4 8FB1002C */        lw $s1, 0x2c($sp)
  /* 13B9F8 801337F8 8FB20030 */        lw $s2, 0x30($sp)
  /* 13B9FC 801337FC 03E00008 */        jr $ra
  /* 13BA00 80133800 27BD0060 */     addiu $sp, $sp, 0x60

glabel mn1PDrawTimerPicker
  /* 13BA04 80133804 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 13BA08 80133808 AFA40038 */        sw $a0, 0x38($sp)
  /* 13BA0C 8013380C 3C048014 */       lui $a0, %hi(gMN1PPickerGObj)
  /* 13BA10 80133810 8C848F70 */        lw $a0, %lo(gMN1PPickerGObj)($a0)
  /* 13BA14 80133814 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13BA18 80133818 10800003 */      beqz $a0, .L80133828
  /* 13BA1C 8013381C 00000000 */       nop
  /* 13BA20 80133820 0C0026A1 */       jal omEjectGObj
  /* 13BA24 80133824 00000000 */       nop
  .L80133828:
  /* 13BA28 80133828 3C198014 */       lui $t9, %hi(D_ovl27_801396A0)
  /* 13BA2C 8013382C 8F3996A0 */        lw $t9, %lo(D_ovl27_801396A0)($t9)
  /* 13BA30 80133830 3C080000 */       lui $t0, %hi(D_NF_000048B0)
  /* 13BA34 80133834 250848B0 */     addiu $t0, $t0, %lo(D_NF_000048B0)
  /* 13BA38 80133838 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 13BA3C 8013383C 3C078000 */       lui $a3, 0x8000
  /* 13BA40 80133840 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 13BA44 80133844 240F001A */     addiu $t7, $zero, 0x1a
  /* 13BA48 80133848 2418FFFF */     addiu $t8, $zero, -1
  /* 13BA4C 8013384C 240A0001 */     addiu $t2, $zero, 1
  /* 13BA50 80133850 240B0001 */     addiu $t3, $zero, 1
  /* 13BA54 80133854 03284821 */      addu $t1, $t9, $t0
  /* 13BA58 80133858 AFA90020 */        sw $t1, 0x20($sp)
  /* 13BA5C 8013385C AFAB002C */        sw $t3, 0x2c($sp)
  /* 13BA60 80133860 AFAA0024 */        sw $t2, 0x24($sp)
  /* 13BA64 80133864 AFB8001C */        sw $t8, 0x1c($sp)
  /* 13BA68 80133868 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13BA6C 8013386C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13BA70 80133870 AFA70018 */        sw $a3, 0x18($sp)
  /* 13BA74 80133874 00002025 */        or $a0, $zero, $zero
  /* 13BA78 80133878 00002825 */        or $a1, $zero, $zero
  /* 13BA7C 8013387C 24060017 */     addiu $a2, $zero, 0x17
  /* 13BA80 80133880 0C033414 */       jal func_ovl0_800CD050
  /* 13BA84 80133884 AFA00028 */        sw $zero, 0x28($sp)
  /* 13BA88 80133888 3C018014 */       lui $at, %hi(gMN1PPickerGObj)
  /* 13BA8C 8013388C AC228F70 */        sw $v0, %lo(gMN1PPickerGObj)($at)
  /* 13BA90 80133890 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 13BA94 80133894 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 13BA98 80133898 8C4C0074 */        lw $t4, 0x74($v0)
  /* 13BA9C 8013389C 3C0141B0 */       lui $at, (0x41B00000 >> 16) # 22.0
  /* 13BAA0 801338A0 44813000 */      mtc1 $at, $f6 # 22.0 to cop1
  /* 13BAA4 801338A4 E5840058 */      swc1 $f4, 0x58($t4)
  /* 13BAA8 801338A8 8C4D0074 */        lw $t5, 0x74($v0)
  /* 13BAAC 801338AC 3C048014 */       lui $a0, %hi(gMN1PTimerValue)
  /* 13BAB0 801338B0 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 13BAB4 801338B4 8C430074 */        lw $v1, 0x74($v0)
  /* 13BAB8 801338B8 946E0024 */       lhu $t6, 0x24($v1)
  /* 13BABC 801338BC 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 13BAC0 801338C0 A46F0024 */        sh $t7, 0x24($v1)
  /* 13BAC4 801338C4 8C430074 */        lw $v1, 0x74($v0)
  /* 13BAC8 801338C8 94780024 */       lhu $t8, 0x24($v1)
  /* 13BACC 801338CC 37190001 */       ori $t9, $t8, 1
  /* 13BAD0 801338D0 A4790024 */        sh $t9, 0x24($v1)
  /* 13BAD4 801338D4 0C04CDA0 */       jal mn1PDrawTimerValue
  /* 13BAD8 801338D8 8C848F80 */        lw $a0, %lo(gMN1PTimerValue)($a0)
  /* 13BADC 801338DC 8FBF0034 */        lw $ra, 0x34($sp)
  /* 13BAE0 801338E0 27BD0038 */     addiu $sp, $sp, 0x38
  /* 13BAE4 801338E4 03E00008 */        jr $ra
  /* 13BAE8 801338E8 00000000 */       nop

glabel mn1PCreateBackground
  /* 13BAEC 801338EC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13BAF0 801338F0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13BAF4 801338F4 00002025 */        or $a0, $zero, $zero
  /* 13BAF8 801338F8 00002825 */        or $a1, $zero, $zero
  /* 13BAFC 801338FC 24060011 */     addiu $a2, $zero, 0x11
  /* 13BB00 80133900 0C00265A */       jal omMakeGObjSPAfter
  /* 13BB04 80133904 3C078000 */       lui $a3, 0x8000
  /* 13BB08 80133908 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13BB0C 8013390C 240EFFFF */     addiu $t6, $zero, -1
  /* 13BB10 80133910 AFA20024 */        sw $v0, 0x24($sp)
  /* 13BB14 80133914 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13BB18 80133918 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13BB1C 8013391C 00402025 */        or $a0, $v0, $zero
  /* 13BB20 80133920 2406001A */     addiu $a2, $zero, 0x1a
  /* 13BB24 80133924 0C00277D */       jal omAddGObjRenderProc
  /* 13BB28 80133928 3C078000 */       lui $a3, 0x8000
  /* 13BB2C 8013392C 3C0F8014 */       lui $t7, %hi(D_ovl27_801396A8)
  /* 13BB30 80133930 8DEF96A8 */        lw $t7, %lo(D_ovl27_801396A8)($t7)
  /* 13BB34 80133934 3C180000 */       lui $t8, %hi(D_NF_00000440)
  /* 13BB38 80133938 27180440 */     addiu $t8, $t8, %lo(D_NF_00000440)
  /* 13BB3C 8013393C 8FA40024 */        lw $a0, 0x24($sp)
  /* 13BB40 80133940 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13BB44 80133944 01F82821 */      addu $a1, $t7, $t8
  /* 13BB48 80133948 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13BB4C 8013394C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13BB50 80133950 24190006 */     addiu $t9, $zero, 6
  /* 13BB54 80133954 24080005 */     addiu $t0, $zero, 5
  /* 13BB58 80133958 2409012C */     addiu $t1, $zero, 0x12c
  /* 13BB5C 8013395C 240A00DC */     addiu $t2, $zero, 0xdc
  /* 13BB60 80133960 A0400065 */        sb $zero, 0x65($v0)
  /* 13BB64 80133964 A0400064 */        sb $zero, 0x64($v0)
  /* 13BB68 80133968 A0590067 */        sb $t9, 0x67($v0)
  /* 13BB6C 8013396C A0480066 */        sb $t0, 0x66($v0)
  /* 13BB70 80133970 A4490068 */        sh $t1, 0x68($v0)
  /* 13BB74 80133974 A44A006A */        sh $t2, 0x6a($v0)
  /* 13BB78 80133978 E4400058 */      swc1 $f0, 0x58($v0)
  /* 13BB7C 8013397C E440005C */      swc1 $f0, 0x5c($v0)
  /* 13BB80 80133980 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13BB84 80133984 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13BB88 80133988 03E00008 */        jr $ra
  /* 13BB8C 8013398C 00000000 */       nop

glabel mn1PCreateBackgroundViewport
  /* 13BB90 80133990 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13BB94 80133994 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13BB98 80133998 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13BB9C 8013399C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13BBA0 801339A0 240F0050 */     addiu $t7, $zero, 0x50
  /* 13BBA4 801339A4 24180000 */     addiu $t8, $zero, 0
  /* 13BBA8 801339A8 3C190400 */       lui $t9, 0x400
  /* 13BBAC 801339AC 2408FFFF */     addiu $t0, $zero, -1
  /* 13BBB0 801339B0 24090001 */     addiu $t1, $zero, 1
  /* 13BBB4 801339B4 240A0001 */     addiu $t2, $zero, 1
  /* 13BBB8 801339B8 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13BBBC 801339BC AFA90028 */        sw $t1, 0x28($sp)
  /* 13BBC0 801339C0 AFA80020 */        sw $t0, 0x20($sp)
  /* 13BBC4 801339C4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13BBC8 801339C8 AFB80018 */        sw $t8, 0x18($sp)
  /* 13BBCC 801339CC AFAF0014 */        sw $t7, 0x14($sp)
  /* 13BBD0 801339D0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13BBD4 801339D4 AFA00024 */        sw $zero, 0x24($sp)
  /* 13BBD8 801339D8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13BBDC 801339DC AFA00034 */        sw $zero, 0x34($sp)
  /* 13BBE0 801339E0 24040401 */     addiu $a0, $zero, 0x401
  /* 13BBE4 801339E4 00002825 */        or $a1, $zero, $zero
  /* 13BBE8 801339E8 24060010 */     addiu $a2, $zero, 0x10
  /* 13BBEC 801339EC 0C002E4F */       jal func_8000B93C
  /* 13BBF0 801339F0 3C078000 */       lui $a3, 0x8000
  /* 13BBF4 801339F4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13BBF8 801339F8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13BBFC 801339FC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13BC00 80133A00 8C430074 */        lw $v1, 0x74($v0)
  /* 13BC04 80133A04 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13BC08 80133A08 44050000 */      mfc1 $a1, $f0
  /* 13BC0C 80133A0C 44060000 */      mfc1 $a2, $f0
  /* 13BC10 80133A10 3C07439B */       lui $a3, 0x439b
  /* 13BC14 80133A14 24640008 */     addiu $a0, $v1, 8
  /* 13BC18 80133A18 0C001C20 */       jal func_80007080
  /* 13BC1C 80133A1C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13BC20 80133A20 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13BC24 80133A24 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13BC28 80133A28 03E00008 */        jr $ra
  /* 13BC2C 80133A2C 00000000 */       nop

glabel mn1PRenderOptionsSection
  /* 13BC30 80133A30 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 13BC34 80133A34 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 13BC38 80133A38 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BC3C 80133A3C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13BC40 80133A40 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13BC44 80133A44 244E0008 */     addiu $t6, $v0, 8
  /* 13BC48 80133A48 AFA40018 */        sw $a0, 0x18($sp)
  /* 13BC4C 80133A4C AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 13BC50 80133A50 3C1FE700 */       lui $ra, 0xe700
  /* 13BC54 80133A54 AC5F0000 */        sw $ra, ($v0)
  /* 13BC58 80133A58 AC400004 */        sw $zero, 4($v0)
  /* 13BC5C 80133A5C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BC60 80133A60 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 13BC64 80133A64 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 13BC68 80133A68 244F0008 */     addiu $t7, $v0, 8
  /* 13BC6C 80133A6C AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 13BC70 80133A70 AC400004 */        sw $zero, 4($v0)
  /* 13BC74 80133A74 AC580000 */        sw $t8, ($v0)
  /* 13BC78 80133A78 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BC7C 80133A7C 3C0FFFFD */       lui $t7, (0xFFFDF6FB >> 16) # 4294833915
  /* 13BC80 80133A80 3C0EFCFF */       lui $t6, (0xFCFFFFFF >> 16) # 4244635647
  /* 13BC84 80133A84 24590008 */     addiu $t9, $v0, 8
  /* 13BC88 80133A88 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 13BC8C 80133A8C 35CEFFFF */       ori $t6, $t6, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 13BC90 80133A90 35EFF6FB */       ori $t7, $t7, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 13BC94 80133A94 AC4F0004 */        sw $t7, 4($v0)
  /* 13BC98 80133A98 AC4E0000 */        sw $t6, ($v0)
  /* 13BC9C 80133A9C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BCA0 80133AA0 3C0E0050 */       lui $t6, (0x5041C8 >> 16) # 5259720
  /* 13BCA4 80133AA4 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 13BCA8 80133AA8 24580008 */     addiu $t8, $v0, 8
  /* 13BCAC 80133AAC AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 13BCB0 80133AB0 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 13BCB4 80133AB4 35CE41C8 */       ori $t6, $t6, (0x5041C8 & 0xFFFF) # 5259720
  /* 13BCB8 80133AB8 AC4E0004 */        sw $t6, 4($v0)
  /* 13BCBC 80133ABC AC590000 */        sw $t9, ($v0)
  /* 13BCC0 80133AC0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BCC4 80133AC4 3C195760 */       lui $t9, (0x576088FF >> 16) # 1465944319
  /* 13BCC8 80133AC8 373988FF */       ori $t9, $t9, (0x576088FF & 0xFFFF) # 1465944319
  /* 13BCCC 80133ACC 244F0008 */     addiu $t7, $v0, 8
  /* 13BCD0 80133AD0 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 13BCD4 80133AD4 3C18FA00 */       lui $t8, 0xfa00
  /* 13BCD8 80133AD8 AC580000 */        sw $t8, ($v0)
  /* 13BCDC 80133ADC AC590004 */        sw $t9, 4($v0)
  /* 13BCE0 80133AE0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BCE4 80133AE4 3C180027 */       lui $t8, (0x274220 >> 16) # 2572832
  /* 13BCE8 80133AE8 3C0FF650 */       lui $t7, (0xF6500234 >> 16) # 4132438580
  /* 13BCEC 80133AEC 244E0008 */     addiu $t6, $v0, 8
  /* 13BCF0 80133AF0 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 13BCF4 80133AF4 35EF0234 */       ori $t7, $t7, (0xF6500234 & 0xFFFF) # 4132438580
  /* 13BCF8 80133AF8 37184220 */       ori $t8, $t8, (0x274220 & 0xFFFF) # 2572832
  /* 13BCFC 80133AFC AC580004 */        sw $t8, 4($v0)
  /* 13BD00 80133B00 AC4F0000 */        sw $t7, ($v0)
  /* 13BD04 80133B04 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BD08 80133B08 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 13BD0C 80133B0C 3C180055 */       lui $t8, (0x552078 >> 16) # 5578872
  /* 13BD10 80133B10 24590008 */     addiu $t9, $v0, 8
  /* 13BD14 80133B14 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 13BD18 80133B18 AC400004 */        sw $zero, 4($v0)
  /* 13BD1C 80133B1C AC5F0000 */        sw $ra, ($v0)
  /* 13BD20 80133B20 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BD24 80133B24 37182078 */       ori $t8, $t8, (0x552078 & 0xFFFF) # 5578872
  /* 13BD28 80133B28 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 13BD2C 80133B2C 244E0008 */     addiu $t6, $v0, 8
  /* 13BD30 80133B30 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 13BD34 80133B34 AC580004 */        sw $t8, 4($v0)
  /* 13BD38 80133B38 AC4F0000 */        sw $t7, ($v0)
  /* 13BD3C 80133B3C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 13BD40 80133B40 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 13BD44 80133B44 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 13BD48 80133B48 24590008 */     addiu $t9, $v0, 8
  /* 13BD4C 80133B4C AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 13BD50 80133B50 AC400004 */        sw $zero, 4($v0)
  /* 13BD54 80133B54 0C0333AB */       jal func_ovl0_800CCEAC
  /* 13BD58 80133B58 AC4E0000 */        sw $t6, ($v0)
  /* 13BD5C 80133B5C 0C0333C0 */       jal func_ovl0_800CCF00
  /* 13BD60 80133B60 8FA40018 */        lw $a0, 0x18($sp)
  /* 13BD64 80133B64 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13BD68 80133B68 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13BD6C 80133B6C 03E00008 */        jr $ra
  /* 13BD70 80133B70 00000000 */       nop

glabel mn1PGetArrowSObj
  /* 13BD74 80133B74 8C830074 */        lw $v1, 0x74($a0)
  /* 13BD78 80133B78 00001025 */        or $v0, $zero, $zero
  /* 13BD7C 80133B7C 1060000E */      beqz $v1, .L80133BB8
  /* 13BD80 80133B80 00000000 */       nop
  /* 13BD84 80133B84 8C6E0054 */        lw $t6, 0x54($v1)
  /* 13BD88 80133B88 54AE0004 */      bnel $a1, $t6, .L80133B9C
  /* 13BD8C 80133B8C 8C640008 */        lw $a0, 8($v1)
  /* 13BD90 80133B90 03E00008 */        jr $ra
  /* 13BD94 80133B94 00601025 */        or $v0, $v1, $zero

  /* 13BD98 80133B98 8C640008 */        lw $a0, 8($v1)
  .L80133B9C:
  /* 13BD9C 80133B9C 10800006 */      beqz $a0, .L80133BB8
  /* 13BDA0 80133BA0 00000000 */       nop
  /* 13BDA4 80133BA4 8C8F0054 */        lw $t7, 0x54($a0)
  /* 13BDA8 80133BA8 14AF0003 */       bne $a1, $t7, .L80133BB8
  /* 13BDAC 80133BAC 00000000 */       nop
  /* 13BDB0 80133BB0 03E00008 */        jr $ra
  /* 13BDB4 80133BB4 00801025 */        or $v0, $a0, $zero

  .L80133BB8:
  /* 13BDB8 80133BB8 03E00008 */        jr $ra
  /* 13BDBC 80133BBC 00000000 */       nop

glabel mn1PSyncAndBlinkLevelArrows
  /* 13BDC0 80133BC0 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 13BDC4 80133BC4 F7B80028 */      sdc1 $f24, 0x28($sp)
  /* 13BDC8 80133BC8 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 13BDCC 80133BCC 4481C000 */      mtc1 $at, $f24 # 194.0 to cop1
  /* 13BDD0 80133BD0 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 13BDD4 80133BD4 3C018014 */       lui $at, %hi(D_ovl27_80138E7C)
  /* 13BDD8 80133BD8 C4368E7C */      lwc1 $f22, %lo(D_ovl27_80138E7C)($at)
  /* 13BDDC 80133BDC AFB7004C */        sw $s7, 0x4c($sp)
  /* 13BDE0 80133BE0 AFB40040 */        sw $s4, 0x40($sp)
  /* 13BDE4 80133BE4 AFB3003C */        sw $s3, 0x3c($sp)
  /* 13BDE8 80133BE8 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 13BDEC 80133BEC 3C01431E */       lui $at, (0x431E0000 >> 16) # 158.0
  /* 13BDF0 80133BF0 AFBE0050 */        sw $fp, 0x50($sp)
  /* 13BDF4 80133BF4 AFB60048 */        sw $s6, 0x48($sp)
  /* 13BDF8 80133BF8 AFB50044 */        sw $s5, 0x44($sp)
  /* 13BDFC 80133BFC AFB20038 */        sw $s2, 0x38($sp)
  /* 13BE00 80133C00 AFB10034 */        sw $s1, 0x34($sp)
  /* 13BE04 80133C04 AFB00030 */        sw $s0, 0x30($sp)
  /* 13BE08 80133C08 3C138014 */       lui $s3, %hi(gMN1PLevelValue)
  /* 13BE0C 80133C0C 3C148014 */       lui $s4, %hi(D_ovl27_801396A0)
  /* 13BE10 80133C10 3C170001 */       lui $s7, %hi(D_NF_0000EDC8)
  /* 13BE14 80133C14 4481A000 */      mtc1 $at, $f20 # 158.0 to cop1
  /* 13BE18 80133C18 00808025 */        or $s0, $a0, $zero
  /* 13BE1C 80133C1C AFBF0054 */        sw $ra, 0x54($sp)
  /* 13BE20 80133C20 2411000A */     addiu $s1, $zero, 0xa
  /* 13BE24 80133C24 26F7EDC8 */     addiu $s7, $s7, %lo(D_NF_0000EDC8)
  /* 13BE28 80133C28 269496A0 */     addiu $s4, $s4, %lo(D_ovl27_801396A0)
  /* 13BE2C 80133C2C 26738FB4 */     addiu $s3, $s3, %lo(gMN1PLevelValue)
  /* 13BE30 80133C30 24120001 */     addiu $s2, $zero, 1
  /* 13BE34 80133C34 2415FFDF */     addiu $s5, $zero, -0x21
  /* 13BE38 80133C38 24160004 */     addiu $s6, $zero, 4
  /* 13BE3C 80133C3C 241E0001 */     addiu $fp, $zero, 1
  /* 13BE40 80133C40 2631FFFF */     addiu $s1, $s1, -1
  .L80133C44:
  /* 13BE44 80133C44 16200008 */      bnez $s1, .L80133C68
  /* 13BE48 80133C48 02002025 */        or $a0, $s0, $zero
  /* 13BE4C 80133C4C 8E0E007C */        lw $t6, 0x7c($s0)
  /* 13BE50 80133C50 2411000A */     addiu $s1, $zero, 0xa
  /* 13BE54 80133C54 564E0004 */      bnel $s2, $t6, .L80133C68
  /* 13BE58 80133C58 AE12007C */        sw $s2, 0x7c($s0)
  /* 13BE5C 80133C5C 10000002 */         b .L80133C68
  /* 13BE60 80133C60 AE00007C */        sw $zero, 0x7c($s0)
  /* 13BE64 80133C64 AE12007C */        sw $s2, 0x7c($s0)
  .L80133C68:
  /* 13BE68 80133C68 8E6F0000 */        lw $t7, ($s3) # gMN1PLevelValue + 0
  /* 13BE6C 80133C6C 00002825 */        or $a1, $zero, $zero
  /* 13BE70 80133C70 15E00009 */      bnez $t7, .L80133C98
  /* 13BE74 80133C74 00000000 */       nop
  /* 13BE78 80133C78 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13BE7C 80133C7C 02002025 */        or $a0, $s0, $zero
  /* 13BE80 80133C80 10400016 */      beqz $v0, .L80133CDC
  /* 13BE84 80133C84 00402025 */        or $a0, $v0, $zero
  /* 13BE88 80133C88 0C0025BB */       jal omEjectSObj
  /* 13BE8C 80133C8C 00000000 */       nop
  /* 13BE90 80133C90 10000013 */         b .L80133CE0
  /* 13BE94 80133C94 8E6C0000 */        lw $t4, ($s3) # gMN1PLevelValue + 0
  .L80133C98:
  /* 13BE98 80133C98 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13BE9C 80133C9C 00002825 */        or $a1, $zero, $zero
  /* 13BEA0 80133CA0 1440000E */      bnez $v0, .L80133CDC
  /* 13BEA4 80133CA4 02002025 */        or $a0, $s0, $zero
  /* 13BEA8 80133CA8 8E980000 */        lw $t8, ($s4) # D_ovl27_801396A0 + 0
  /* 13BEAC 80133CAC 3C190001 */       lui $t9, %hi(D_NF_0000ECE8)
  /* 13BEB0 80133CB0 2739ECE8 */     addiu $t9, $t9, %lo(D_NF_0000ECE8)
  /* 13BEB4 80133CB4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13BEB8 80133CB8 03192821 */      addu $a1, $t8, $t9
  /* 13BEBC 80133CBC 94480024 */       lhu $t0, 0x24($v0)
  /* 13BEC0 80133CC0 E4580058 */      swc1 $f24, 0x58($v0)
  /* 13BEC4 80133CC4 E454005C */      swc1 $f20, 0x5c($v0)
  /* 13BEC8 80133CC8 01155024 */       and $t2, $t0, $s5
  /* 13BECC 80133CCC A44A0024 */        sh $t2, 0x24($v0)
  /* 13BED0 80133CD0 354B0001 */       ori $t3, $t2, 1
  /* 13BED4 80133CD4 A44B0024 */        sh $t3, 0x24($v0)
  /* 13BED8 80133CD8 AC400054 */        sw $zero, 0x54($v0)
  .L80133CDC:
  /* 13BEDC 80133CDC 8E6C0000 */        lw $t4, ($s3) # gMN1PLevelValue + 0
  .L80133CE0:
  /* 13BEE0 80133CE0 03C02825 */        or $a1, $fp, $zero
  /* 13BEE4 80133CE4 02002025 */        or $a0, $s0, $zero
  /* 13BEE8 80133CE8 16CC0009 */       bne $s6, $t4, .L80133D10
  /* 13BEEC 80133CEC 00000000 */       nop
  /* 13BEF0 80133CF0 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13BEF4 80133CF4 02002025 */        or $a0, $s0, $zero
  /* 13BEF8 80133CF8 10400015 */      beqz $v0, .L80133D50
  /* 13BEFC 80133CFC 00402025 */        or $a0, $v0, $zero
  /* 13BF00 80133D00 0C0025BB */       jal omEjectSObj
  /* 13BF04 80133D04 00000000 */       nop
  /* 13BF08 80133D08 10000011 */         b .L80133D50
  /* 13BF0C 80133D0C 00000000 */       nop
  .L80133D10:
  /* 13BF10 80133D10 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13BF14 80133D14 03C02825 */        or $a1, $fp, $zero
  /* 13BF18 80133D18 1440000D */      bnez $v0, .L80133D50
  /* 13BF1C 80133D1C 00000000 */       nop
  /* 13BF20 80133D20 8E8D0000 */        lw $t5, ($s4) # D_ovl27_801396A0 + 0
  /* 13BF24 80133D24 02002025 */        or $a0, $s0, $zero
  /* 13BF28 80133D28 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13BF2C 80133D2C 01B72821 */      addu $a1, $t5, $s7
  /* 13BF30 80133D30 944E0024 */       lhu $t6, 0x24($v0)
  /* 13BF34 80133D34 E4560058 */      swc1 $f22, 0x58($v0)
  /* 13BF38 80133D38 E454005C */      swc1 $f20, 0x5c($v0)
  /* 13BF3C 80133D3C 01D5C024 */       and $t8, $t6, $s5
  /* 13BF40 80133D40 A4580024 */        sh $t8, 0x24($v0)
  /* 13BF44 80133D44 37190001 */       ori $t9, $t8, 1
  /* 13BF48 80133D48 A4590024 */        sh $t9, 0x24($v0)
  /* 13BF4C 80133D4C AC5E0054 */        sw $fp, 0x54($v0)
  .L80133D50:
  /* 13BF50 80133D50 0C002C7A */       jal gsStopCurrentProcess
  /* 13BF54 80133D54 03C02025 */        or $a0, $fp, $zero
  /* 13BF58 80133D58 1000FFBA */         b .L80133C44
  /* 13BF5C 80133D5C 2631FFFF */     addiu $s1, $s1, -1
  /* 13BF60 80133D60 8FBF0054 */        lw $ra, 0x54($sp)
  /* 13BF64 80133D64 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 13BF68 80133D68 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13BF6C 80133D6C D7B80028 */      ldc1 $f24, 0x28($sp)
  /* 13BF70 80133D70 8FB00030 */        lw $s0, 0x30($sp)
  /* 13BF74 80133D74 8FB10034 */        lw $s1, 0x34($sp)
  /* 13BF78 80133D78 8FB20038 */        lw $s2, 0x38($sp)
  /* 13BF7C 80133D7C 8FB3003C */        lw $s3, 0x3c($sp)
  /* 13BF80 80133D80 8FB40040 */        lw $s4, 0x40($sp)
  /* 13BF84 80133D84 8FB50044 */        lw $s5, 0x44($sp)
  /* 13BF88 80133D88 8FB60048 */        lw $s6, 0x48($sp)
  /* 13BF8C 80133D8C 8FB7004C */        lw $s7, 0x4c($sp)
  /* 13BF90 80133D90 8FBE0050 */        lw $fp, 0x50($sp)
  /* 13BF94 80133D94 03E00008 */        jr $ra
  /* 13BF98 80133D98 27BD0058 */     addiu $sp, $sp, 0x58

glabel gMN1PDrawLevel
  /* 13BF9C 80133D9C 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 13BFA0 80133DA0 3C0F8014 */       lui $t7, %hi(dMN1PLevelOffsets)
  /* 13BFA4 80133DA4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13BFA8 80133DA8 AFA40078 */        sw $a0, 0x78($sp)
  /* 13BFAC 80133DAC 25EF8A9C */     addiu $t7, $t7, %lo(dMN1PLevelOffsets)
  /* 13BFB0 80133DB0 8DF90000 */        lw $t9, ($t7) # dMN1PLevelOffsets + 0
  /* 13BFB4 80133DB4 27AE005C */     addiu $t6, $sp, 0x5c
  /* 13BFB8 80133DB8 8DF80004 */        lw $t8, 4($t7) # dMN1PLevelOffsets + 4
  /* 13BFBC 80133DBC ADD90000 */        sw $t9, ($t6)
  /* 13BFC0 80133DC0 8DF90008 */        lw $t9, 8($t7) # dMN1PLevelOffsets + 8
  /* 13BFC4 80133DC4 ADD80004 */        sw $t8, 4($t6)
  /* 13BFC8 80133DC8 8DF8000C */        lw $t8, 0xc($t7) # dMN1PLevelOffsets + 12
  /* 13BFCC 80133DCC ADD90008 */        sw $t9, 8($t6)
  /* 13BFD0 80133DD0 8DF90010 */        lw $t9, 0x10($t7) # dMN1PLevelOffsets + 16
  /* 13BFD4 80133DD4 3C098014 */       lui $t1, %hi(dMN1PLevelPositions)
  /* 13BFD8 80133DD8 25298AB0 */     addiu $t1, $t1, %lo(dMN1PLevelPositions)
  /* 13BFDC 80133DDC 252C0024 */     addiu $t4, $t1, 0x24
  /* 13BFE0 80133DE0 27A80034 */     addiu $t0, $sp, 0x34
  /* 13BFE4 80133DE4 ADD8000C */        sw $t8, 0xc($t6)
  /* 13BFE8 80133DE8 ADD90010 */        sw $t9, 0x10($t6)
  .L80133DEC:
  /* 13BFEC 80133DEC 8D2B0000 */        lw $t3, ($t1) # dMN1PLevelPositions + 0
  /* 13BFF0 80133DF0 2529000C */     addiu $t1, $t1, 0xc
  /* 13BFF4 80133DF4 2508000C */     addiu $t0, $t0, 0xc
  /* 13BFF8 80133DF8 AD0BFFF4 */        sw $t3, -0xc($t0)
  /* 13BFFC 80133DFC 8D2AFFF8 */        lw $t2, -8($t1) # dMN1PLevelPositions + -8
  /* 13C000 80133E00 AD0AFFF8 */        sw $t2, -8($t0)
  /* 13C004 80133E04 8D2BFFFC */        lw $t3, -4($t1) # dMN1PLevelPositions + -4
  /* 13C008 80133E08 152CFFF8 */       bne $t1, $t4, .L80133DEC
  /* 13C00C 80133E0C AD0BFFFC */        sw $t3, -4($t0)
  /* 13C010 80133E10 8D2B0000 */        lw $t3, ($t1) # dMN1PLevelPositions + 0
  /* 13C014 80133E14 3C0E8014 */       lui $t6, %hi(dMN1PLevelColors)
  /* 13C018 80133E18 25CE8AD8 */     addiu $t6, $t6, %lo(dMN1PLevelColors)
  /* 13C01C 80133E1C AD0B0000 */        sw $t3, ($t0)
  /* 13C020 80133E20 8DD80000 */        lw $t8, ($t6) # dMN1PLevelColors + 0
  /* 13C024 80133E24 27AD0024 */     addiu $t5, $sp, 0x24
  /* 13C028 80133E28 8DCF0004 */        lw $t7, 4($t6) # dMN1PLevelColors + 4
  /* 13C02C 80133E2C ADB80000 */        sw $t8, ($t5)
  /* 13C030 80133E30 8DD80008 */        lw $t8, 8($t6) # dMN1PLevelColors + 8
  /* 13C034 80133E34 3C058014 */       lui $a1, %hi(gMN1PLevelGObj)
  /* 13C038 80133E38 ADAF0004 */        sw $t7, 4($t5)
  /* 13C03C 80133E3C ADB80008 */        sw $t8, 8($t5)
  /* 13C040 80133E40 99D8000E */       lwr $t8, 0xe($t6) # dMN1PLevelColors + 14
  /* 13C044 80133E44 B9B8000E */       swr $t8, 0xe($t5)
  /* 13C048 80133E48 8CA58FBC */        lw $a1, %lo(gMN1PLevelGObj)($a1)
  /* 13C04C 80133E4C 50A00004 */      beql $a1, $zero, .L80133E60
  /* 13C050 80133E50 00002025 */        or $a0, $zero, $zero
  /* 13C054 80133E54 0C0026A1 */       jal omEjectGObj
  /* 13C058 80133E58 00A02025 */        or $a0, $a1, $zero
  /* 13C05C 80133E5C 00002025 */        or $a0, $zero, $zero
  .L80133E60:
  /* 13C060 80133E60 00002825 */        or $a1, $zero, $zero
  /* 13C064 80133E64 24060017 */     addiu $a2, $zero, 0x17
  /* 13C068 80133E68 0C00265A */       jal omMakeGObjSPAfter
  /* 13C06C 80133E6C 3C078000 */       lui $a3, 0x8000
  /* 13C070 80133E70 3C018014 */       lui $at, %hi(gMN1PLevelGObj)
  /* 13C074 80133E74 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13C078 80133E78 2419FFFF */     addiu $t9, $zero, -1
  /* 13C07C 80133E7C AC228FBC */        sw $v0, %lo(gMN1PLevelGObj)($at)
  /* 13C080 80133E80 AFA20074 */        sw $v0, 0x74($sp)
  /* 13C084 80133E84 AFB90010 */        sw $t9, 0x10($sp)
  /* 13C088 80133E88 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13C08C 80133E8C 00402025 */        or $a0, $v0, $zero
  /* 13C090 80133E90 24060022 */     addiu $a2, $zero, 0x22
  /* 13C094 80133E94 0C00277D */       jal omAddGObjRenderProc
  /* 13C098 80133E98 3C078000 */       lui $a3, 0x8000
  /* 13C09C 80133E9C 8FAC0078 */        lw $t4, 0x78($sp)
  /* 13C0A0 80133EA0 3C0A8014 */       lui $t2, %hi(D_ovl27_801396B8)
  /* 13C0A4 80133EA4 8D4A96B8 */        lw $t2, %lo(D_ovl27_801396B8)($t2)
  /* 13C0A8 80133EA8 000C4880 */       sll $t1, $t4, 2
  /* 13C0AC 80133EAC 03A94021 */      addu $t0, $sp, $t1
  /* 13C0B0 80133EB0 8D08005C */        lw $t0, 0x5c($t0)
  /* 13C0B4 80133EB4 8FA40074 */        lw $a0, 0x74($sp)
  /* 13C0B8 80133EB8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C0BC 80133EBC 010A2821 */      addu $a1, $t0, $t2
  /* 13C0C0 80133EC0 944B0024 */       lhu $t3, 0x24($v0)
  /* 13C0C4 80133EC4 27AC0034 */     addiu $t4, $sp, 0x34
  /* 13C0C8 80133EC8 27AA0024 */     addiu $t2, $sp, 0x24
  /* 13C0CC 80133ECC 316EFFDF */      andi $t6, $t3, 0xffdf
  /* 13C0D0 80133ED0 A44E0024 */        sh $t6, 0x24($v0)
  /* 13C0D4 80133ED4 35CF0001 */       ori $t7, $t6, 1
  /* 13C0D8 80133ED8 A44F0024 */        sh $t7, 0x24($v0)
  /* 13C0DC 80133EDC 8FB80078 */        lw $t8, 0x78($sp)
  /* 13C0E0 80133EE0 0018C8C0 */       sll $t9, $t8, 3
  /* 13C0E4 80133EE4 032C2021 */      addu $a0, $t9, $t4
  /* 13C0E8 80133EE8 C4840000 */      lwc1 $f4, ($a0)
  /* 13C0EC 80133EEC E4440058 */      swc1 $f4, 0x58($v0)
  /* 13C0F0 80133EF0 C4860004 */      lwc1 $f6, 4($a0)
  /* 13C0F4 80133EF4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13C0F8 80133EF8 8FA90078 */        lw $t1, 0x78($sp)
  /* 13C0FC 80133EFC 00094080 */       sll $t0, $t1, 2
  /* 13C100 80133F00 01094023 */      subu $t0, $t0, $t1
  /* 13C104 80133F04 010A1821 */      addu $v1, $t0, $t2
  /* 13C108 80133F08 906B0000 */       lbu $t3, ($v1)
  /* 13C10C 80133F0C A04B0028 */        sb $t3, 0x28($v0)
  /* 13C110 80133F10 906D0001 */       lbu $t5, 1($v1)
  /* 13C114 80133F14 A04D0029 */        sb $t5, 0x29($v0)
  /* 13C118 80133F18 906E0002 */       lbu $t6, 2($v1)
  /* 13C11C 80133F1C A04E002A */        sb $t6, 0x2a($v0)
  /* 13C120 80133F20 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13C124 80133F24 27BD0078 */     addiu $sp, $sp, 0x78
  /* 13C128 80133F28 03E00008 */        jr $ra
  /* 13C12C 80133F2C 00000000 */       nop

glabel mn1PCreateLevelAndArrows
  /* 13C130 80133F30 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13C134 80133F34 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13C138 80133F38 00002025 */        or $a0, $zero, $zero
  /* 13C13C 80133F3C 00002825 */        or $a1, $zero, $zero
  /* 13C140 80133F40 24060017 */     addiu $a2, $zero, 0x17
  /* 13C144 80133F44 0C00265A */       jal omMakeGObjSPAfter
  /* 13C148 80133F48 3C078000 */       lui $a3, 0x8000
  /* 13C14C 80133F4C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13C150 80133F50 240EFFFF */     addiu $t6, $zero, -1
  /* 13C154 80133F54 AFA20024 */        sw $v0, 0x24($sp)
  /* 13C158 80133F58 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13C15C 80133F5C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13C160 80133F60 00402025 */        or $a0, $v0, $zero
  /* 13C164 80133F64 24060022 */     addiu $a2, $zero, 0x22
  /* 13C168 80133F68 0C00277D */       jal omAddGObjRenderProc
  /* 13C16C 80133F6C 3C078000 */       lui $a3, 0x8000
  /* 13C170 80133F70 3C058013 */       lui $a1, %hi(mn1PSyncAndBlinkLevelArrows)
  /* 13C174 80133F74 24A53BC0 */     addiu $a1, $a1, %lo(mn1PSyncAndBlinkLevelArrows)
  /* 13C178 80133F78 8FA40024 */        lw $a0, 0x24($sp)
  /* 13C17C 80133F7C 00003025 */        or $a2, $zero, $zero
  /* 13C180 80133F80 0C002062 */       jal omAddGObjCommonProc
  /* 13C184 80133F84 24070001 */     addiu $a3, $zero, 1
  /* 13C188 80133F88 3C048014 */       lui $a0, %hi(gMN1PLevelValue)
  /* 13C18C 80133F8C 0C04CF67 */       jal gMN1PDrawLevel
  /* 13C190 80133F90 8C848FB4 */        lw $a0, %lo(gMN1PLevelValue)($a0)
  /* 13C194 80133F94 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13C198 80133F98 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13C19C 80133F9C 03E00008 */        jr $ra
  /* 13C1A0 80133FA0 00000000 */       nop

glabel mn1PSyncAndBlinkStockArrows
  /* 13C1A4 80133FA4 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 13C1A8 80133FA8 F7B80028 */      sdc1 $f24, 0x28($sp)
  /* 13C1AC 80133FAC 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 13C1B0 80133FB0 4481C000 */      mtc1 $at, $f24 # 194.0 to cop1
  /* 13C1B4 80133FB4 F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 13C1B8 80133FB8 3C018014 */       lui $at, %hi(D_ovl27_80138E80)
  /* 13C1BC 80133FBC C4368E80 */      lwc1 $f22, %lo(D_ovl27_80138E80)($at)
  /* 13C1C0 80133FC0 AFB7004C */        sw $s7, 0x4c($sp)
  /* 13C1C4 80133FC4 AFB40040 */        sw $s4, 0x40($sp)
  /* 13C1C8 80133FC8 AFB3003C */        sw $s3, 0x3c($sp)
  /* 13C1CC 80133FCC F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 13C1D0 80133FD0 3C014332 */       lui $at, (0x43320000 >> 16) # 178.0
  /* 13C1D4 80133FD4 AFBE0050 */        sw $fp, 0x50($sp)
  /* 13C1D8 80133FD8 AFB60048 */        sw $s6, 0x48($sp)
  /* 13C1DC 80133FDC AFB50044 */        sw $s5, 0x44($sp)
  /* 13C1E0 80133FE0 AFB20038 */        sw $s2, 0x38($sp)
  /* 13C1E4 80133FE4 AFB10034 */        sw $s1, 0x34($sp)
  /* 13C1E8 80133FE8 AFB00030 */        sw $s0, 0x30($sp)
  /* 13C1EC 80133FEC 3C138014 */       lui $s3, %hi(gMN1PStockValue)
  /* 13C1F0 80133FF0 3C148014 */       lui $s4, %hi(D_ovl27_801396A0)
  /* 13C1F4 80133FF4 3C170001 */       lui $s7, %hi(D_NF_0000EDC8)
  /* 13C1F8 80133FF8 4481A000 */      mtc1 $at, $f20 # 178.0 to cop1
  /* 13C1FC 80133FFC 00808025 */        or $s0, $a0, $zero
  /* 13C200 80134000 AFBF0054 */        sw $ra, 0x54($sp)
  /* 13C204 80134004 2411000A */     addiu $s1, $zero, 0xa
  /* 13C208 80134008 26F7EDC8 */     addiu $s7, $s7, %lo(D_NF_0000EDC8)
  /* 13C20C 8013400C 269496A0 */     addiu $s4, $s4, %lo(D_ovl27_801396A0)
  /* 13C210 80134010 26738FB8 */     addiu $s3, $s3, %lo(gMN1PStockValue)
  /* 13C214 80134014 24120001 */     addiu $s2, $zero, 1
  /* 13C218 80134018 2415FFDF */     addiu $s5, $zero, -0x21
  /* 13C21C 8013401C 24160004 */     addiu $s6, $zero, 4
  /* 13C220 80134020 241E0001 */     addiu $fp, $zero, 1
  /* 13C224 80134024 2631FFFF */     addiu $s1, $s1, -1
  .L80134028:
  /* 13C228 80134028 16200008 */      bnez $s1, .L8013404C
  /* 13C22C 8013402C 02002025 */        or $a0, $s0, $zero
  /* 13C230 80134030 8E0E007C */        lw $t6, 0x7c($s0)
  /* 13C234 80134034 2411000A */     addiu $s1, $zero, 0xa
  /* 13C238 80134038 564E0004 */      bnel $s2, $t6, .L8013404C
  /* 13C23C 8013403C AE12007C */        sw $s2, 0x7c($s0)
  /* 13C240 80134040 10000002 */         b .L8013404C
  /* 13C244 80134044 AE00007C */        sw $zero, 0x7c($s0)
  /* 13C248 80134048 AE12007C */        sw $s2, 0x7c($s0)
  .L8013404C:
  /* 13C24C 8013404C 8E6F0000 */        lw $t7, ($s3) # gMN1PStockValue + 0
  /* 13C250 80134050 00002825 */        or $a1, $zero, $zero
  /* 13C254 80134054 15E00009 */      bnez $t7, .L8013407C
  /* 13C258 80134058 00000000 */       nop
  /* 13C25C 8013405C 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13C260 80134060 02002025 */        or $a0, $s0, $zero
  /* 13C264 80134064 10400016 */      beqz $v0, .L801340C0
  /* 13C268 80134068 00402025 */        or $a0, $v0, $zero
  /* 13C26C 8013406C 0C0025BB */       jal omEjectSObj
  /* 13C270 80134070 00000000 */       nop
  /* 13C274 80134074 10000013 */         b .L801340C4
  /* 13C278 80134078 8E6C0000 */        lw $t4, ($s3) # gMN1PStockValue + 0
  .L8013407C:
  /* 13C27C 8013407C 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13C280 80134080 00002825 */        or $a1, $zero, $zero
  /* 13C284 80134084 1440000E */      bnez $v0, .L801340C0
  /* 13C288 80134088 02002025 */        or $a0, $s0, $zero
  /* 13C28C 8013408C 8E980000 */        lw $t8, ($s4) # D_ovl27_801396A0 + 0
  /* 13C290 80134090 3C190001 */       lui $t9, %hi(D_NF_0000ECE8)
  /* 13C294 80134094 2739ECE8 */     addiu $t9, $t9, %lo(D_NF_0000ECE8)
  /* 13C298 80134098 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C29C 8013409C 03192821 */      addu $a1, $t8, $t9
  /* 13C2A0 801340A0 94480024 */       lhu $t0, 0x24($v0)
  /* 13C2A4 801340A4 E4580058 */      swc1 $f24, 0x58($v0)
  /* 13C2A8 801340A8 E454005C */      swc1 $f20, 0x5c($v0)
  /* 13C2AC 801340AC 01155024 */       and $t2, $t0, $s5
  /* 13C2B0 801340B0 A44A0024 */        sh $t2, 0x24($v0)
  /* 13C2B4 801340B4 354B0001 */       ori $t3, $t2, 1
  /* 13C2B8 801340B8 A44B0024 */        sh $t3, 0x24($v0)
  /* 13C2BC 801340BC AC400054 */        sw $zero, 0x54($v0)
  .L801340C0:
  /* 13C2C0 801340C0 8E6C0000 */        lw $t4, ($s3) # gMN1PStockValue + 0
  .L801340C4:
  /* 13C2C4 801340C4 03C02825 */        or $a1, $fp, $zero
  /* 13C2C8 801340C8 02002025 */        or $a0, $s0, $zero
  /* 13C2CC 801340CC 16CC0009 */       bne $s6, $t4, .L801340F4
  /* 13C2D0 801340D0 00000000 */       nop
  /* 13C2D4 801340D4 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13C2D8 801340D8 02002025 */        or $a0, $s0, $zero
  /* 13C2DC 801340DC 10400015 */      beqz $v0, .L80134134
  /* 13C2E0 801340E0 00402025 */        or $a0, $v0, $zero
  /* 13C2E4 801340E4 0C0025BB */       jal omEjectSObj
  /* 13C2E8 801340E8 00000000 */       nop
  /* 13C2EC 801340EC 10000011 */         b .L80134134
  /* 13C2F0 801340F0 00000000 */       nop
  .L801340F4:
  /* 13C2F4 801340F4 0C04CEDD */       jal mn1PGetArrowSObj
  /* 13C2F8 801340F8 03C02825 */        or $a1, $fp, $zero
  /* 13C2FC 801340FC 1440000D */      bnez $v0, .L80134134
  /* 13C300 80134100 00000000 */       nop
  /* 13C304 80134104 8E8D0000 */        lw $t5, ($s4) # D_ovl27_801396A0 + 0
  /* 13C308 80134108 02002025 */        or $a0, $s0, $zero
  /* 13C30C 8013410C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C310 80134110 01B72821 */      addu $a1, $t5, $s7
  /* 13C314 80134114 944E0024 */       lhu $t6, 0x24($v0)
  /* 13C318 80134118 E4560058 */      swc1 $f22, 0x58($v0)
  /* 13C31C 8013411C E454005C */      swc1 $f20, 0x5c($v0)
  /* 13C320 80134120 01D5C024 */       and $t8, $t6, $s5
  /* 13C324 80134124 A4580024 */        sh $t8, 0x24($v0)
  /* 13C328 80134128 37190001 */       ori $t9, $t8, 1
  /* 13C32C 8013412C A4590024 */        sh $t9, 0x24($v0)
  /* 13C330 80134130 AC5E0054 */        sw $fp, 0x54($v0)
  .L80134134:
  /* 13C334 80134134 0C002C7A */       jal gsStopCurrentProcess
  /* 13C338 80134138 03C02025 */        or $a0, $fp, $zero
  /* 13C33C 8013413C 1000FFBA */         b .L80134028
  /* 13C340 80134140 2631FFFF */     addiu $s1, $s1, -1
  /* 13C344 80134144 00000000 */       nop
  /* 13C348 80134148 00000000 */       nop
  /* 13C34C 8013414C 00000000 */       nop
# Maybe start of new file
  /* 13C350 80134150 00000000 */       nop
  /* 13C354 80134154 00000000 */       nop
  /* 13C358 80134158 00000000 */       nop
  /* 13C35C 8013415C 00000000 */       nop
# Maybe start of new file
  /* 13C360 80134160 8FBF0054 */        lw $ra, 0x54($sp)
  /* 13C364 80134164 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 13C368 80134168 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 13C36C 8013416C D7B80028 */      ldc1 $f24, 0x28($sp)
  /* 13C370 80134170 8FB00030 */        lw $s0, 0x30($sp)
  /* 13C374 80134174 8FB10034 */        lw $s1, 0x34($sp)
  /* 13C378 80134178 8FB20038 */        lw $s2, 0x38($sp)
  /* 13C37C 8013417C 8FB3003C */        lw $s3, 0x3c($sp)
  /* 13C380 80134180 8FB40040 */        lw $s4, 0x40($sp)
  /* 13C384 80134184 8FB50044 */        lw $s5, 0x44($sp)
  /* 13C388 80134188 8FB60048 */        lw $s6, 0x48($sp)
  /* 13C38C 8013418C 8FB7004C */        lw $s7, 0x4c($sp)
  /* 13C390 80134190 8FBE0050 */        lw $fp, 0x50($sp)
  /* 13C394 80134194 03E00008 */        jr $ra
  /* 13C398 80134198 27BD0058 */     addiu $sp, $sp, 0x58

glabel mn1PDrawStock
  /* 13C39C 8013419C 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13C3A0 801341A0 AFB1003C */        sw $s1, 0x3c($sp)
  /* 13C3A4 801341A4 3C118014 */       lui $s1, %hi(gMN1PStockGObj)
  /* 13C3A8 801341A8 26318FC0 */     addiu $s1, $s1, %lo(gMN1PStockGObj)
  /* 13C3AC 801341AC 8E260000 */        lw $a2, ($s1) # gMN1PStockGObj + 0
  /* 13C3B0 801341B0 AFBE0058 */        sw $fp, 0x58($sp)
  /* 13C3B4 801341B4 AFB00038 */        sw $s0, 0x38($sp)
  /* 13C3B8 801341B8 00808025 */        or $s0, $a0, $zero
  /* 13C3BC 801341BC 00A0F025 */        or $fp, $a1, $zero
  /* 13C3C0 801341C0 AFBF005C */        sw $ra, 0x5c($sp)
  /* 13C3C4 801341C4 AFB70054 */        sw $s7, 0x54($sp)
  /* 13C3C8 801341C8 AFB60050 */        sw $s6, 0x50($sp)
  /* 13C3CC 801341CC AFB5004C */        sw $s5, 0x4c($sp)
  /* 13C3D0 801341D0 AFB40048 */        sw $s4, 0x48($sp)
  /* 13C3D4 801341D4 AFB30044 */        sw $s3, 0x44($sp)
  /* 13C3D8 801341D8 AFB20040 */        sw $s2, 0x40($sp)
  /* 13C3DC 801341DC F7B80030 */      sdc1 $f24, 0x30($sp)
  /* 13C3E0 801341E0 F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 13C3E4 801341E4 10C00003 */      beqz $a2, .L801341F4
  /* 13C3E8 801341E8 F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 13C3EC 801341EC 0C0026A1 */       jal omEjectGObj
  /* 13C3F0 801341F0 00C02025 */        or $a0, $a2, $zero
  .L801341F4:
  /* 13C3F4 801341F4 3C138000 */       lui $s3, 0x8000
  /* 13C3F8 801341F8 02603825 */        or $a3, $s3, $zero
  /* 13C3FC 801341FC 00002025 */        or $a0, $zero, $zero
  /* 13C400 80134200 00002825 */        or $a1, $zero, $zero
  /* 13C404 80134204 0C00265A */       jal omMakeGObjSPAfter
  /* 13C408 80134208 24060017 */     addiu $a2, $zero, 0x17
  /* 13C40C 8013420C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13C410 80134210 240EFFFF */     addiu $t6, $zero, -1
  /* 13C414 80134214 00409025 */        or $s2, $v0, $zero
  /* 13C418 80134218 AE220000 */        sw $v0, ($s1) # gMN1PStockGObj + 0
  /* 13C41C 8013421C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13C420 80134220 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13C424 80134224 00402025 */        or $a0, $v0, $zero
  /* 13C428 80134228 24060022 */     addiu $a2, $zero, 0x22
  /* 13C42C 8013422C 0C00277D */       jal omAddGObjRenderProc
  /* 13C430 80134230 02603825 */        or $a3, $s3, $zero
  /* 13C434 80134234 26100001 */     addiu $s0, $s0, 1
  /* 13C438 80134238 1A000035 */      blez $s0, .L80134310
  /* 13C43C 8013423C 00108880 */       sll $s1, $s0, 2
  /* 13C440 80134240 3C014332 */       lui $at, (0x43320000 >> 16) # 178.0
  /* 13C444 80134244 4481C000 */      mtc1 $at, $f24 # 178.0 to cop1
  /* 13C448 80134248 3C01434F */       lui $at, (0x434F0000 >> 16) # 207.0
  /* 13C44C 8013424C 4481B000 */      mtc1 $at, $f22 # 207.0 to cop1
  /* 13C450 80134250 3C014333 */       lui $at, (0x43330000 >> 16) # 179.0
  /* 13C454 80134254 02308823 */      subu $s1, $s1, $s0
  /* 13C458 80134258 00118880 */       sll $s1, $s1, 2
  /* 13C45C 8013425C 3C178014 */       lui $s7, %hi(gMN1PPanel)
  /* 13C460 80134260 3C150000 */       lui $s5, %hi(D_NF_00000080)
  /* 13C464 80134264 3C148014 */       lui $s4, %hi(D_ovl27_801396A0)
  /* 13C468 80134268 4481A000 */      mtc1 $at, $f20 # 179.0 to cop1
  /* 13C46C 8013426C 269496A0 */     addiu $s4, $s4, %lo(D_ovl27_801396A0)
  /* 13C470 80134270 26B50080 */     addiu $s5, $s5, %lo(D_NF_00000080)
  /* 13C474 80134274 26F78EE8 */     addiu $s7, $s7, %lo(gMN1PPanel)
  /* 13C478 80134278 2631FFF4 */     addiu $s1, $s1, -0xc
  /* 13C47C 8013427C 2416FFDF */     addiu $s6, $zero, -0x21
  /* 13C480 80134280 2413001C */     addiu $s3, $zero, 0x1c
  .L80134284:
  /* 13C484 80134284 57D30008 */      bnel $fp, $s3, .L801342A8
  /* 13C488 80134288 8EF80008 */        lw $t8, 8($s7) # gMN1PPanel + 8
  /* 13C48C 8013428C 8E8F001C */        lw $t7, 0x1c($s4) # D_ovl27_801396A0 + 28
  /* 13C490 80134290 02402025 */        or $a0, $s2, $zero
  /* 13C494 80134294 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C498 80134298 01F52821 */      addu $a1, $t7, $s5
  /* 13C49C 8013429C 10000011 */         b .L801342E4
  /* 13C4A0 801342A0 E454005C */      swc1 $f20, 0x5c($v0)
  /* 13C4A4 801342A4 8EF80008 */        lw $t8, 8($s7) # gMN1PPanel + 8
  .L801342A8:
  /* 13C4A8 801342A8 02402025 */        or $a0, $s2, $zero
  /* 13C4AC 801342AC 8F100084 */        lw $s0, 0x84($t8)
  /* 13C4B0 801342B0 8E1909C8 */        lw $t9, 0x9c8($s0)
  /* 13C4B4 801342B4 8F280340 */        lw $t0, 0x340($t9)
  /* 13C4B8 801342B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C4BC 801342BC 8D050000 */        lw $a1, ($t0)
  /* 13C4C0 801342C0 8E0909C8 */        lw $t1, 0x9c8($s0)
  /* 13C4C4 801342C4 920C0010 */       lbu $t4, 0x10($s0)
  /* 13C4C8 801342C8 8D2A0340 */        lw $t2, 0x340($t1)
  /* 13C4CC 801342CC 000C6880 */       sll $t5, $t4, 2
  /* 13C4D0 801342D0 8D4B0004 */        lw $t3, 4($t2)
  /* 13C4D4 801342D4 016D7021 */      addu $t6, $t3, $t5
  /* 13C4D8 801342D8 8DCF0000 */        lw $t7, ($t6)
  /* 13C4DC 801342DC E458005C */      swc1 $f24, 0x5c($v0)
  /* 13C4E0 801342E0 AC4F0030 */        sw $t7, 0x30($v0)
  .L801342E4:
  /* 13C4E4 801342E4 44912000 */      mtc1 $s1, $f4 # -1.796442e-39 to cop1
  /* 13C4E8 801342E8 94580024 */       lhu $t8, 0x24($v0)
  /* 13C4EC 801342EC 2631FFF4 */     addiu $s1, $s1, -0xc
  /* 13C4F0 801342F0 468021A0 */   cvt.s.w $f6, $f4
  /* 13C4F4 801342F4 03164024 */       and $t0, $t8, $s6
  /* 13C4F8 801342F8 A4480024 */        sh $t0, 0x24($v0)
  /* 13C4FC 801342FC 35090001 */       ori $t1, $t0, 1
  /* 13C500 80134300 A4490024 */        sh $t1, 0x24($v0)
  /* 13C504 80134304 46163200 */     add.s $f8, $f6, $f22
  /* 13C508 80134308 0621FFDE */      bgez $s1, .L80134284
  /* 13C50C 8013430C E4480058 */      swc1 $f8, 0x58($v0)
  .L80134310:
  /* 13C510 80134310 8FBF005C */        lw $ra, 0x5c($sp)
  /* 13C514 80134314 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 13C518 80134318 D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 13C51C 8013431C D7B80030 */      ldc1 $f24, 0x30($sp)
  /* 13C520 80134320 8FB00038 */        lw $s0, 0x38($sp)
  /* 13C524 80134324 8FB1003C */        lw $s1, 0x3c($sp)
  /* 13C528 80134328 8FB20040 */        lw $s2, 0x40($sp)
  /* 13C52C 8013432C 8FB30044 */        lw $s3, 0x44($sp)
  /* 13C530 80134330 8FB40048 */        lw $s4, 0x48($sp)
  /* 13C534 80134334 8FB5004C */        lw $s5, 0x4c($sp)
  /* 13C538 80134338 8FB60050 */        lw $s6, 0x50($sp)
  /* 13C53C 8013433C 8FB70054 */        lw $s7, 0x54($sp)
  /* 13C540 80134340 8FBE0058 */        lw $fp, 0x58($sp)
  /* 13C544 80134344 03E00008 */        jr $ra
  /* 13C548 80134348 27BD0060 */     addiu $sp, $sp, 0x60

glabel mn1PCreateStockAndArrows
  /* 13C54C 8013434C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13C550 80134350 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13C554 80134354 00002025 */        or $a0, $zero, $zero
  /* 13C558 80134358 00002825 */        or $a1, $zero, $zero
  /* 13C55C 8013435C 24060017 */     addiu $a2, $zero, 0x17
  /* 13C560 80134360 0C00265A */       jal omMakeGObjSPAfter
  /* 13C564 80134364 3C078000 */       lui $a3, 0x8000
  /* 13C568 80134368 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13C56C 8013436C 240EFFFF */     addiu $t6, $zero, -1
  /* 13C570 80134370 AFA20024 */        sw $v0, 0x24($sp)
  /* 13C574 80134374 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13C578 80134378 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13C57C 8013437C 00402025 */        or $a0, $v0, $zero
  /* 13C580 80134380 24060022 */     addiu $a2, $zero, 0x22
  /* 13C584 80134384 0C00277D */       jal omAddGObjRenderProc
  /* 13C588 80134388 3C078000 */       lui $a3, 0x8000
  /* 13C58C 8013438C 3C058013 */       lui $a1, %hi(mn1PSyncAndBlinkStockArrows)
  /* 13C590 80134390 24A53FA4 */     addiu $a1, $a1, %lo(mn1PSyncAndBlinkStockArrows)
  /* 13C594 80134394 8FA40024 */        lw $a0, 0x24($sp)
  /* 13C598 80134398 00003025 */        or $a2, $zero, $zero
  /* 13C59C 8013439C 0C002062 */       jal omAddGObjCommonProc
  /* 13C5A0 801343A0 24070001 */     addiu $a3, $zero, 1
  /* 13C5A4 801343A4 3C048014 */       lui $a0, %hi(gMN1PStockValue)
  /* 13C5A8 801343A8 3C058014 */       lui $a1, %hi(D_ovl27_80138F08)
  /* 13C5AC 801343AC 8CA58F08 */        lw $a1, %lo(D_ovl27_80138F08)($a1)
  /* 13C5B0 801343B0 0C04D067 */       jal mn1PDrawStock
  /* 13C5B4 801343B4 8C848FB8 */        lw $a0, %lo(gMN1PStockValue)($a0)
  /* 13C5B8 801343B8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13C5BC 801343BC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13C5C0 801343C0 03E00008 */        jr $ra
  /* 13C5C4 801343C4 00000000 */       nop

glabel mn1PDrawPickerOptionsTitleAndBack
  /* 13C5C8 801343C8 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 13C5CC 801343CC AFB1003C */        sw $s1, 0x3c($sp)
  /* 13C5D0 801343D0 3C118014 */       lui $s1, %hi(D_ovl27_801396A0)
  /* 13C5D4 801343D4 263196A0 */     addiu $s1, $s1, %lo(D_ovl27_801396A0)
  /* 13C5D8 801343D8 8E390014 */        lw $t9, 0x14($s1) # D_ovl27_801396A0 + 20
  /* 13C5DC 801343DC 3C080000 */       lui $t0, %hi(D_NF_00000228)
  /* 13C5E0 801343E0 25080228 */     addiu $t0, $t0, %lo(D_NF_00000228)
  /* 13C5E4 801343E4 3C0E8013 */       lui $t6, %hi(mn1PRenderOptionsSection)
  /* 13C5E8 801343E8 AFBF0044 */        sw $ra, 0x44($sp)
  /* 13C5EC 801343EC 3C078000 */       lui $a3, 0x8000
  /* 13C5F0 801343F0 25CE3A30 */     addiu $t6, $t6, %lo(mn1PRenderOptionsSection)
  /* 13C5F4 801343F4 240F0022 */     addiu $t7, $zero, 0x22
  /* 13C5F8 801343F8 2418FFFF */     addiu $t8, $zero, -1
  /* 13C5FC 801343FC 240A0001 */     addiu $t2, $zero, 1
  /* 13C600 80134400 240B0001 */     addiu $t3, $zero, 1
  /* 13C604 80134404 03284821 */      addu $t1, $t9, $t0
  /* 13C608 80134408 AFB20040 */        sw $s2, 0x40($sp)
  /* 13C60C 8013440C AFB00038 */        sw $s0, 0x38($sp)
  /* 13C610 80134410 AFA90020 */        sw $t1, 0x20($sp)
  /* 13C614 80134414 AFAB002C */        sw $t3, 0x2c($sp)
  /* 13C618 80134418 AFAA0024 */        sw $t2, 0x24($sp)
  /* 13C61C 8013441C AFB8001C */        sw $t8, 0x1c($sp)
  /* 13C620 80134420 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13C624 80134424 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13C628 80134428 AFA70018 */        sw $a3, 0x18($sp)
  /* 13C62C 8013442C AFA00028 */        sw $zero, 0x28($sp)
  /* 13C630 80134430 00002025 */        or $a0, $zero, $zero
  /* 13C634 80134434 00002825 */        or $a1, $zero, $zero
  /* 13C638 80134438 0C033414 */       jal func_ovl0_800CD050
  /* 13C63C 8013443C 24060017 */     addiu $a2, $zero, 0x17
  /* 13C640 80134440 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 13C644 80134444 44812000 */      mtc1 $at, $f4 # 27.0 to cop1
  /* 13C648 80134448 8C4C0074 */        lw $t4, 0x74($v0)
  /* 13C64C 8013444C 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 13C650 80134450 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 13C654 80134454 E5840058 */      swc1 $f4, 0x58($t4)
  /* 13C658 80134458 8C4D0074 */        lw $t5, 0x74($v0)
  /* 13C65C 8013445C 240800E3 */     addiu $t0, $zero, 0xe3
  /* 13C660 80134460 240A00AC */     addiu $t2, $zero, 0xac
  /* 13C664 80134464 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 13C668 80134468 8C430074 */        lw $v1, 0x74($v0)
  /* 13C66C 8013446C 240C0004 */     addiu $t4, $zero, 4
  /* 13C670 80134470 3C048014 */       lui $a0, %hi(gMN1PTimerValue)
  /* 13C674 80134474 946E0024 */       lhu $t6, 0x24($v1)
  /* 13C678 80134478 2412FFDF */     addiu $s2, $zero, -0x21
  /* 13C67C 8013447C 00408025 */        or $s0, $v0, $zero
  /* 13C680 80134480 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 13C684 80134484 A46F0024 */        sh $t7, 0x24($v1)
  /* 13C688 80134488 8C430074 */        lw $v1, 0x74($v0)
  /* 13C68C 8013448C 94780024 */       lhu $t8, 0x24($v1)
  /* 13C690 80134490 37190001 */       ori $t9, $t8, 1
  /* 13C694 80134494 A4790024 */        sh $t9, 0x24($v1)
  /* 13C698 80134498 8C490074 */        lw $t1, 0x74($v0)
  /* 13C69C 8013449C A1280028 */        sb $t0, 0x28($t1)
  /* 13C6A0 801344A0 8C4B0074 */        lw $t3, 0x74($v0)
  /* 13C6A4 801344A4 A16A0029 */        sb $t2, 0x29($t3)
  /* 13C6A8 801344A8 8C4D0074 */        lw $t5, 0x74($v0)
  /* 13C6AC 801344AC A1AC002A */        sb $t4, 0x2a($t5)
  /* 13C6B0 801344B0 0C04CE01 */       jal mn1PDrawTimerPicker
  /* 13C6B4 801344B4 8C848F80 */        lw $a0, %lo(gMN1PTimerValue)($a0)
  /* 13C6B8 801344B8 8E2E0000 */        lw $t6, ($s1) # D_ovl27_801396A0 + 0
  /* 13C6BC 801344BC 3C0F0001 */       lui $t7, %hi(D_NF_000115C8)
  /* 13C6C0 801344C0 25EF15C8 */     addiu $t7, $t7, %lo(D_NF_000115C8)
  /* 13C6C4 801344C4 02002025 */        or $a0, $s0, $zero
  /* 13C6C8 801344C8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C6CC 801344CC 01CF2821 */      addu $a1, $t6, $t7
  /* 13C6D0 801344D0 94580024 */       lhu $t8, 0x24($v0)
  /* 13C6D4 801344D4 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 13C6D8 801344D8 44814000 */      mtc1 $at, $f8 # 244.0 to cop1
  /* 13C6DC 801344DC 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 13C6E0 801344E0 44815000 */      mtc1 $at, $f10 # 23.0 to cop1
  /* 13C6E4 801344E4 03124024 */       and $t0, $t8, $s2
  /* 13C6E8 801344E8 A4480024 */        sh $t0, 0x24($v0)
  /* 13C6EC 801344EC 35090001 */       ori $t1, $t0, 1
  /* 13C6F0 801344F0 A4490024 */        sh $t1, 0x24($v0)
  /* 13C6F4 801344F4 E4480058 */      swc1 $f8, 0x58($v0)
  /* 13C6F8 801344F8 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13C6FC 801344FC 8E2A0014 */        lw $t2, 0x14($s1) # D_ovl27_801396A0 + 20
  /* 13C700 80134500 3C0B0000 */       lui $t3, %hi(D_NF_00001EC8)
  /* 13C704 80134504 256B1EC8 */     addiu $t3, $t3, %lo(D_NF_00001EC8)
  /* 13C708 80134508 02002025 */        or $a0, $s0, $zero
  /* 13C70C 8013450C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C710 80134510 014B2821 */      addu $a1, $t2, $t3
  /* 13C714 80134514 944C0024 */       lhu $t4, 0x24($v0)
  /* 13C718 80134518 3C014334 */       lui $at, (0x43340000 >> 16) # 180.0
  /* 13C71C 8013451C 44818000 */      mtc1 $at, $f16 # 180.0 to cop1
  /* 13C720 80134520 3C014301 */       lui $at, (0x43010000 >> 16) # 129.0
  /* 13C724 80134524 44819000 */      mtc1 $at, $f18 # 129.0 to cop1
  /* 13C728 80134528 01927024 */       and $t6, $t4, $s2
  /* 13C72C 8013452C A44E0024 */        sh $t6, 0x24($v0)
  /* 13C730 80134530 35CF0001 */       ori $t7, $t6, 1
  /* 13C734 80134534 241800AF */     addiu $t8, $zero, 0xaf
  /* 13C738 80134538 241900B1 */     addiu $t9, $zero, 0xb1
  /* 13C73C 8013453C 240800CC */     addiu $t0, $zero, 0xcc
  /* 13C740 80134540 A44F0024 */        sh $t7, 0x24($v0)
  /* 13C744 80134544 A0400060 */        sb $zero, 0x60($v0)
  /* 13C748 80134548 A0400061 */        sb $zero, 0x61($v0)
  /* 13C74C 8013454C A0400062 */        sb $zero, 0x62($v0)
  /* 13C750 80134550 A0580028 */        sb $t8, 0x28($v0)
  /* 13C754 80134554 A0590029 */        sb $t9, 0x29($v0)
  /* 13C758 80134558 A048002A */        sb $t0, 0x2a($v0)
  /* 13C75C 8013455C E4500058 */      swc1 $f16, 0x58($v0)
  /* 13C760 80134560 E452005C */      swc1 $f18, 0x5c($v0)
  /* 13C764 80134564 8E290014 */        lw $t1, 0x14($s1) # D_ovl27_801396A0 + 20
  /* 13C768 80134568 3C0A0000 */       lui $t2, %hi(D_NF_00001208)
  /* 13C76C 8013456C 254A1208 */     addiu $t2, $t2, %lo(D_NF_00001208)
  /* 13C770 80134570 02002025 */        or $a0, $s0, $zero
  /* 13C774 80134574 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C778 80134578 012A2821 */      addu $a1, $t1, $t2
  /* 13C77C 8013457C 944B0024 */       lhu $t3, 0x24($v0)
  /* 13C780 80134580 3C014300 */       lui $at, (0x43000000 >> 16) # 128.0
  /* 13C784 80134584 44812000 */      mtc1 $at, $f4 # 128.0 to cop1
  /* 13C788 80134588 3C01430D */       lui $at, (0x430D0000 >> 16) # 141.0
  /* 13C78C 8013458C 01726824 */       and $t5, $t3, $s2
  /* 13C790 80134590 44813000 */      mtc1 $at, $f6 # 141.0 to cop1
  /* 13C794 80134594 A44D0024 */        sh $t5, 0x24($v0)
  /* 13C798 80134598 35AE0001 */       ori $t6, $t5, 1
  /* 13C79C 8013459C 240F0057 */     addiu $t7, $zero, 0x57
  /* 13C7A0 801345A0 24180060 */     addiu $t8, $zero, 0x60
  /* 13C7A4 801345A4 24190088 */     addiu $t9, $zero, 0x88
  /* 13C7A8 801345A8 24080001 */     addiu $t0, $zero, 1
  /* 13C7AC 801345AC 24090005 */     addiu $t1, $zero, 5
  /* 13C7B0 801345B0 240A00B8 */     addiu $t2, $zero, 0xb8
  /* 13C7B4 801345B4 240B0040 */     addiu $t3, $zero, 0x40
  /* 13C7B8 801345B8 A44E0024 */        sh $t6, 0x24($v0)
  /* 13C7BC 801345BC A04F0028 */        sb $t7, 0x28($v0)
  /* 13C7C0 801345C0 A0580029 */        sb $t8, 0x29($v0)
  /* 13C7C4 801345C4 A059002A */        sb $t9, 0x2a($v0)
  /* 13C7C8 801345C8 A0400065 */        sb $zero, 0x65($v0)
  /* 13C7CC 801345CC A0480064 */        sb $t0, 0x64($v0)
  /* 13C7D0 801345D0 A0400067 */        sb $zero, 0x67($v0)
  /* 13C7D4 801345D4 A0490066 */        sb $t1, 0x66($v0)
  /* 13C7D8 801345D8 A44A0068 */        sh $t2, 0x68($v0)
  /* 13C7DC 801345DC A44B006A */        sh $t3, 0x6a($v0)
  /* 13C7E0 801345E0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 13C7E4 801345E4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13C7E8 801345E8 8E2C0014 */        lw $t4, 0x14($s1) # D_ovl27_801396A0 + 20
  /* 13C7EC 801345EC 3C0D0000 */       lui $t5, %hi(D_NF_00000488)
  /* 13C7F0 801345F0 25AD0488 */     addiu $t5, $t5, %lo(D_NF_00000488)
  /* 13C7F4 801345F4 02002025 */        or $a0, $s0, $zero
  /* 13C7F8 801345F8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C7FC 801345FC 018D2821 */      addu $a1, $t4, $t5
  /* 13C800 80134600 944E0024 */       lhu $t6, 0x24($v0)
  /* 13C804 80134604 3C014311 */       lui $at, (0x43110000 >> 16) # 145.0
  /* 13C808 80134608 44814000 */      mtc1 $at, $f8 # 145.0 to cop1
  /* 13C80C 8013460C 3C01431F */       lui $at, (0x431F0000 >> 16) # 159.0
  /* 13C810 80134610 44815000 */      mtc1 $at, $f10 # 159.0 to cop1
  /* 13C814 80134614 01D2C024 */       and $t8, $t6, $s2
  /* 13C818 80134618 A4580024 */        sh $t8, 0x24($v0)
  /* 13C81C 8013461C 37190001 */       ori $t9, $t8, 1
  /* 13C820 80134620 240800C5 */     addiu $t0, $zero, 0xc5
  /* 13C824 80134624 240900B6 */     addiu $t1, $zero, 0xb6
  /* 13C828 80134628 240A00A7 */     addiu $t2, $zero, 0xa7
  /* 13C82C 8013462C A4590024 */        sh $t9, 0x24($v0)
  /* 13C830 80134630 A0480028 */        sb $t0, 0x28($v0)
  /* 13C834 80134634 A0490029 */        sb $t1, 0x29($v0)
  /* 13C838 80134638 A04A002A */        sb $t2, 0x2a($v0)
  /* 13C83C 8013463C E4480058 */      swc1 $f8, 0x58($v0)
  /* 13C840 80134640 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13C844 80134644 8E2B0014 */        lw $t3, 0x14($s1) # D_ovl27_801396A0 + 20
  /* 13C848 80134648 3C0C0000 */       lui $t4, %hi(D_NF_000005A8)
  /* 13C84C 8013464C 258C05A8 */     addiu $t4, $t4, %lo(D_NF_000005A8)
  /* 13C850 80134650 02002025 */        or $a0, $s0, $zero
  /* 13C854 80134654 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13C858 80134658 016C2821 */      addu $a1, $t3, $t4
  /* 13C85C 8013465C 944D0024 */       lhu $t5, 0x24($v0)
  /* 13C860 80134660 3C014310 */       lui $at, (0x43100000 >> 16) # 144.0
  /* 13C864 80134664 44818000 */      mtc1 $at, $f16 # 144.0 to cop1
  /* 13C868 80134668 3C014333 */       lui $at, (0x43330000 >> 16) # 179.0
  /* 13C86C 8013466C 44819000 */      mtc1 $at, $f18 # 179.0 to cop1
  /* 13C870 80134670 01B27824 */       and $t7, $t5, $s2
  /* 13C874 80134674 A44F0024 */        sh $t7, 0x24($v0)
  /* 13C878 80134678 35F80001 */       ori $t8, $t7, 1
  /* 13C87C 8013467C 241900C5 */     addiu $t9, $zero, 0xc5
  /* 13C880 80134680 240800B6 */     addiu $t0, $zero, 0xb6
  /* 13C884 80134684 240900A7 */     addiu $t1, $zero, 0xa7
  /* 13C888 80134688 A4580024 */        sh $t8, 0x24($v0)
  /* 13C88C 8013468C A0590028 */        sb $t9, 0x28($v0)
  /* 13C890 80134690 A0480029 */        sb $t0, 0x29($v0)
  /* 13C894 80134694 A049002A */        sb $t1, 0x2a($v0)
  /* 13C898 80134698 E4500058 */      swc1 $f16, 0x58($v0)
  /* 13C89C 8013469C E452005C */      swc1 $f18, 0x5c($v0)
  /* 13C8A0 801346A0 8FBF0044 */        lw $ra, 0x44($sp)
  /* 13C8A4 801346A4 8FB20040 */        lw $s2, 0x40($sp)
  /* 13C8A8 801346A8 8FB1003C */        lw $s1, 0x3c($sp)
  /* 13C8AC 801346AC 8FB00038 */        lw $s0, 0x38($sp)
  /* 13C8B0 801346B0 03E00008 */        jr $ra
  /* 13C8B4 801346B4 27BD0048 */     addiu $sp, $sp, 0x48

glabel mn1PCreateTitleOptionsAndBackViewport
  /* 13C8B8 801346B8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13C8BC 801346BC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13C8C0 801346C0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13C8C4 801346C4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13C8C8 801346C8 240F0046 */     addiu $t7, $zero, 0x46
  /* 13C8CC 801346CC 24180004 */     addiu $t8, $zero, 4
  /* 13C8D0 801346D0 24190000 */     addiu $t9, $zero, 0
  /* 13C8D4 801346D4 2408FFFF */     addiu $t0, $zero, -1
  /* 13C8D8 801346D8 24090001 */     addiu $t1, $zero, 1
  /* 13C8DC 801346DC 240A0001 */     addiu $t2, $zero, 1
  /* 13C8E0 801346E0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13C8E4 801346E4 AFA90028 */        sw $t1, 0x28($sp)
  /* 13C8E8 801346E8 AFA80020 */        sw $t0, 0x20($sp)
  /* 13C8EC 801346EC AFB9001C */        sw $t9, 0x1c($sp)
  /* 13C8F0 801346F0 AFB80018 */        sw $t8, 0x18($sp)
  /* 13C8F4 801346F4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13C8F8 801346F8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13C8FC 801346FC AFA00024 */        sw $zero, 0x24($sp)
  /* 13C900 80134700 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13C904 80134704 AFA00034 */        sw $zero, 0x34($sp)
  /* 13C908 80134708 24040401 */     addiu $a0, $zero, 0x401
  /* 13C90C 8013470C 00002825 */        or $a1, $zero, $zero
  /* 13C910 80134710 24060010 */     addiu $a2, $zero, 0x10
  /* 13C914 80134714 0C002E4F */       jal func_8000B93C
  /* 13C918 80134718 3C078000 */       lui $a3, 0x8000
  /* 13C91C 8013471C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13C920 80134720 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13C924 80134724 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13C928 80134728 8C430074 */        lw $v1, 0x74($v0)
  /* 13C92C 8013472C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13C930 80134730 44050000 */      mfc1 $a1, $f0
  /* 13C934 80134734 44060000 */      mfc1 $a2, $f0
  /* 13C938 80134738 3C07439B */       lui $a3, 0x439b
  /* 13C93C 8013473C 24640008 */     addiu $a0, $v1, 8
  /* 13C940 80134740 0C001C20 */       jal func_80007080
  /* 13C944 80134744 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13C948 80134748 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13C94C 8013474C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13C950 80134750 03E00008 */        jr $ra
  /* 13C954 80134754 00000000 */       nop

glabel mn1PGetHighscore
  /* 13C958 80134758 00047140 */       sll $t6, $a0, 5
  /* 13C95C 8013475C 3C02800A */       lui $v0, %hi((gSaveData + 0x45C))
  /* 13C960 80134760 004E1021 */      addu $v0, $v0, $t6
  /* 13C964 80134764 03E00008 */        jr $ra
  /* 13C968 80134768 8C42493C */        lw $v0, %lo((gSaveData + 0x45C))($v0)

glabel mn1PDrawHighscore
  /* 13C96C 8013476C 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 13C970 80134770 3C0F8014 */       lui $t7, %hi(dMN1PHighscoreTextColors)
  /* 13C974 80134774 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13C978 80134778 25EF8AE8 */     addiu $t7, $t7, %lo(dMN1PHighscoreTextColors)
  /* 13C97C 8013477C 8DF90000 */        lw $t9, ($t7) # dMN1PHighscoreTextColors + 0
  /* 13C980 80134780 27AE0064 */     addiu $t6, $sp, 0x64
  /* 13C984 80134784 8DF80004 */        lw $t8, 4($t7) # dMN1PHighscoreTextColors + 4
  /* 13C988 80134788 ADD90000 */        sw $t9, ($t6)
  /* 13C98C 8013478C 8DF90008 */        lw $t9, 8($t7) # dMN1PHighscoreTextColors + 8
  /* 13C990 80134790 3C098014 */       lui $t1, %hi(dMN1PHighscoreNumberColors)
  /* 13C994 80134794 25298AF4 */     addiu $t1, $t1, %lo(dMN1PHighscoreNumberColors)
  /* 13C998 80134798 ADD80004 */        sw $t8, 4($t6)
  /* 13C99C 8013479C ADD90008 */        sw $t9, 8($t6)
  /* 13C9A0 801347A0 8D2A0004 */        lw $t2, 4($t1) # dMN1PHighscoreNumberColors + 4
  /* 13C9A4 801347A4 8D2B0000 */        lw $t3, ($t1) # dMN1PHighscoreNumberColors + 0
  /* 13C9A8 801347A8 27A8004C */     addiu $t0, $sp, 0x4c
  /* 13C9AC 801347AC AD0A0004 */        sw $t2, 4($t0)
  /* 13C9B0 801347B0 AD0B0000 */        sw $t3, ($t0)
  /* 13C9B4 801347B4 8D2B0008 */        lw $t3, 8($t1) # dMN1PHighscoreNumberColors + 8
  /* 13C9B8 801347B8 8D2A000C */        lw $t2, 0xc($t1) # dMN1PHighscoreNumberColors + 12
  /* 13C9BC 801347BC 3C0D8014 */       lui $t5, %hi(dMN1PHighscoreSmashLogoColors)
  /* 13C9C0 801347C0 AD0B0008 */        sw $t3, 8($t0)
  /* 13C9C4 801347C4 AD0A000C */        sw $t2, 0xc($t0)
  /* 13C9C8 801347C8 8D2A0014 */        lw $t2, 0x14($t1) # dMN1PHighscoreNumberColors + 20
  /* 13C9CC 801347CC 8D2B0010 */        lw $t3, 0x10($t1) # dMN1PHighscoreNumberColors + 16
  /* 13C9D0 801347D0 25AD8B0C */     addiu $t5, $t5, %lo(dMN1PHighscoreSmashLogoColors)
  /* 13C9D4 801347D4 AD0A0014 */        sw $t2, 0x14($t0)
  /* 13C9D8 801347D8 AD0B0010 */        sw $t3, 0x10($t0)
  /* 13C9DC 801347DC 8DAF0000 */        lw $t7, ($t5) # dMN1PHighscoreSmashLogoColors + 0
  /* 13C9E0 801347E0 27AC003C */     addiu $t4, $sp, 0x3c
  /* 13C9E4 801347E4 8DAE0004 */        lw $t6, 4($t5) # dMN1PHighscoreSmashLogoColors + 4
  /* 13C9E8 801347E8 AD8F0000 */        sw $t7, ($t4)
  /* 13C9EC 801347EC 8DAF0008 */        lw $t7, 8($t5) # dMN1PHighscoreSmashLogoColors + 8
  /* 13C9F0 801347F0 AD8E0004 */        sw $t6, 4($t4)
  /* 13C9F4 801347F4 AD8F0008 */        sw $t7, 8($t4)
  /* 13C9F8 801347F8 99AF000E */       lwr $t7, 0xe($t5) # dMN1PHighscoreSmashLogoColors + 14
  /* 13C9FC 801347FC 0C04D7CD */       jal mn1PGetFtKindFromTokenPositionEvenIfLocked
  /* 13CA00 80134800 B98F000E */       swr $t7, 0xe($t4)
  /* 13CA04 80134804 3C048014 */       lui $a0, %hi(gMN1PHighscoreGObj)
  /* 13CA08 80134808 8C848FAC */        lw $a0, %lo(gMN1PHighscoreGObj)($a0)
  /* 13CA0C 8013480C AFA20034 */        sw $v0, 0x34($sp)
  /* 13CA10 80134810 50800006 */      beql $a0, $zero, .L8013482C
  /* 13CA14 80134814 8FB80034 */        lw $t8, 0x34($sp)
  /* 13CA18 80134818 0C0026A1 */       jal omEjectGObj
  /* 13CA1C 8013481C 00000000 */       nop
  /* 13CA20 80134820 3C018014 */       lui $at, %hi(gMN1PHighscoreGObj)
  /* 13CA24 80134824 AC208FAC */        sw $zero, %lo(gMN1PHighscoreGObj)($at)
  /* 13CA28 80134828 8FB80034 */        lw $t8, 0x34($sp)
  .L8013482C:
  /* 13CA2C 8013482C 2401001C */     addiu $at, $zero, 0x1c
  /* 13CA30 80134830 00002025 */        or $a0, $zero, $zero
  /* 13CA34 80134834 13010048 */       beq $t8, $at, .L80134958
  /* 13CA38 80134838 00002825 */        or $a1, $zero, $zero
  /* 13CA3C 8013483C 24060017 */     addiu $a2, $zero, 0x17
  /* 13CA40 80134840 0C00265A */       jal omMakeGObjSPAfter
  /* 13CA44 80134844 3C078000 */       lui $a3, 0x8000
  /* 13CA48 80134848 3C018014 */       lui $at, %hi(gMN1PHighscoreGObj)
  /* 13CA4C 8013484C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13CA50 80134850 2419FFFF */     addiu $t9, $zero, -1
  /* 13CA54 80134854 AC228FAC */        sw $v0, %lo(gMN1PHighscoreGObj)($at)
  /* 13CA58 80134858 AFA2007C */        sw $v0, 0x7c($sp)
  /* 13CA5C 8013485C AFB90010 */        sw $t9, 0x10($sp)
  /* 13CA60 80134860 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13CA64 80134864 00402025 */        or $a0, $v0, $zero
  /* 13CA68 80134868 2406001A */     addiu $a2, $zero, 0x1a
  /* 13CA6C 8013486C 0C00277D */       jal omAddGObjRenderProc
  /* 13CA70 80134870 3C078000 */       lui $a3, 0x8000
  /* 13CA74 80134874 3C058014 */       lui $a1, %hi(gMNHighscoreString)
  /* 13CA78 80134878 27A80064 */     addiu $t0, $sp, 0x64
  /* 13CA7C 8013487C AFA80010 */        sw $t0, 0x10($sp)
  /* 13CA80 80134880 24A58D40 */     addiu $a1, $a1, %lo(gMNHighscoreString)
  /* 13CA84 80134884 8FA4007C */        lw $a0, 0x7c($sp)
  /* 13CA88 80134888 3C06430E */       lui $a2, 0x430e
  /* 13CA8C 8013488C 0C04C83E */       jal mn1PDrawString
  /* 13CA90 80134890 3C074349 */       lui $a3, 0x4349
  /* 13CA94 80134894 0C04D1D6 */       jal mn1PGetHighscore
  /* 13CA98 80134898 8FA40034 */        lw $a0, 0x34($sp)
  /* 13CA9C 8013489C 27A9004C */     addiu $t1, $sp, 0x4c
  /* 13CAA0 801348A0 240A0008 */     addiu $t2, $zero, 8
  /* 13CAA4 801348A4 240B0001 */     addiu $t3, $zero, 1
  /* 13CAA8 801348A8 AFAB0018 */        sw $t3, 0x18($sp)
  /* 13CAAC 801348AC AFAA0014 */        sw $t2, 0x14($sp)
  /* 13CAB0 801348B0 AFA90010 */        sw $t1, 0x10($sp)
  /* 13CAB4 801348B4 8FA4007C */        lw $a0, 0x7c($sp)
  /* 13CAB8 801348B8 00402825 */        or $a1, $v0, $zero
  /* 13CABC 801348BC 3C064380 */       lui $a2, 0x4380
  /* 13CAC0 801348C0 0C04C73B */       jal mn1PCreateSmallerNumber
  /* 13CAC4 801348C4 3C074346 */       lui $a3, 0x4346
  /* 13CAC8 801348C8 8FAC0034 */        lw $t4, 0x34($sp)
  /* 13CACC 801348CC 3C06800A */       lui $a2, %hi((gSaveData + 0x468))
  /* 13CAD0 801348D0 3C0F0000 */       lui $t7, %hi(D_NF_00001950)
  /* 13CAD4 801348D4 000C6940 */       sll $t5, $t4, 5
  /* 13CAD8 801348D8 00CD3021 */      addu $a2, $a2, $t5
  /* 13CADC 801348DC 90C64948 */       lbu $a2, %lo((gSaveData + 0x468))($a2)
  /* 13CAE0 801348E0 25EF1950 */     addiu $t7, $t7, %lo(D_NF_00001950)
  /* 13CAE4 801348E4 8FA4007C */        lw $a0, 0x7c($sp)
  /* 13CAE8 801348E8 10C0001B */      beqz $a2, .L80134958
  /* 13CAEC 801348EC 3C0E8014 */       lui $t6, %hi(D_ovl27_801396B4)
  /* 13CAF0 801348F0 8DCE96B4 */        lw $t6, %lo(D_ovl27_801396B4)($t6)
  /* 13CAF4 801348F4 AFA60038 */        sw $a2, 0x38($sp)
  /* 13CAF8 801348F8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13CAFC 801348FC 01CF2821 */      addu $a1, $t6, $t7
  /* 13CB00 80134900 94580024 */       lhu $t8, 0x24($v0)
  /* 13CB04 80134904 3C0142FC */       lui $at, (0x42FC0000 >> 16) # 126.0
  /* 13CB08 80134908 8FA60038 */        lw $a2, 0x38($sp)
  /* 13CB0C 8013490C 44812000 */      mtc1 $at, $f4 # 126.0 to cop1
  /* 13CB10 80134910 3C014346 */       lui $at, (0x43460000 >> 16) # 198.0
  /* 13CB14 80134914 44813000 */      mtc1 $at, $f6 # 198.0 to cop1
  /* 13CB18 80134918 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 13CB1C 8013491C 00065080 */       sll $t2, $a2, 2
  /* 13CB20 80134920 A4480024 */        sh $t0, 0x24($v0)
  /* 13CB24 80134924 35090001 */       ori $t1, $t0, 1
  /* 13CB28 80134928 27AB003C */     addiu $t3, $sp, 0x3c
  /* 13CB2C 8013492C 01465023 */      subu $t2, $t2, $a2
  /* 13CB30 80134930 A4490024 */        sh $t1, 0x24($v0)
  /* 13CB34 80134934 014B1821 */      addu $v1, $t2, $t3
  /* 13CB38 80134938 E4440058 */      swc1 $f4, 0x58($v0)
  /* 13CB3C 8013493C E446005C */      swc1 $f6, 0x5c($v0)
  /* 13CB40 80134940 906CFFFD */       lbu $t4, -3($v1)
  /* 13CB44 80134944 A04C0028 */        sb $t4, 0x28($v0)
  /* 13CB48 80134948 906DFFFE */       lbu $t5, -2($v1)
  /* 13CB4C 8013494C A04D0029 */        sb $t5, 0x29($v0)
  /* 13CB50 80134950 906EFFFF */       lbu $t6, -1($v1)
  /* 13CB54 80134954 A04E002A */        sb $t6, 0x2a($v0)
  .L80134958:
  /* 13CB58 80134958 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13CB5C 8013495C 27BD0080 */     addiu $sp, $sp, 0x80
  /* 13CB60 80134960 03E00008 */        jr $ra
  /* 13CB64 80134964 00000000 */       nop

glabel mn1PGetBonuses
  /* 13CB68 80134968 00047140 */       sll $t6, $a0, 5
  /* 13CB6C 8013496C 3C02800A */       lui $v0, %hi((gSaveData + 0x464))
  /* 13CB70 80134970 004E1021 */      addu $v0, $v0, $t6
  /* 13CB74 80134974 03E00008 */        jr $ra
  /* 13CB78 80134978 8C424944 */        lw $v0, %lo((gSaveData + 0x464))($v0)

glabel mn1PDrawBonuses
  /* 13CB7C 8013497C 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13CB80 80134980 3C0F8014 */       lui $t7, %hi(dMN1PBonusesNumberColors)
  /* 13CB84 80134984 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13CB88 80134988 25EF8B1C */     addiu $t7, $t7, %lo(dMN1PBonusesNumberColors)
  /* 13CB8C 8013498C 8DF90000 */        lw $t9, ($t7) # dMN1PBonusesNumberColors + 0
  /* 13CB90 80134990 8DF80004 */        lw $t8, 4($t7) # dMN1PBonusesNumberColors + 4
  /* 13CB94 80134994 27AE0038 */     addiu $t6, $sp, 0x38
  /* 13CB98 80134998 ADD90000 */        sw $t9, ($t6)
  /* 13CB9C 8013499C ADD80004 */        sw $t8, 4($t6)
  /* 13CBA0 801349A0 8DF8000C */        lw $t8, 0xc($t7) # dMN1PBonusesNumberColors + 12
  /* 13CBA4 801349A4 8DF90008 */        lw $t9, 8($t7) # dMN1PBonusesNumberColors + 8
  /* 13CBA8 801349A8 ADD8000C */        sw $t8, 0xc($t6)
  /* 13CBAC 801349AC ADD90008 */        sw $t9, 8($t6)
  /* 13CBB0 801349B0 8DF90010 */        lw $t9, 0x10($t7) # dMN1PBonusesNumberColors + 16
  /* 13CBB4 801349B4 8DF80014 */        lw $t8, 0x14($t7) # dMN1PBonusesNumberColors + 20
  /* 13CBB8 801349B8 ADD90010 */        sw $t9, 0x10($t6)
  /* 13CBBC 801349BC 0C04D7CD */       jal mn1PGetFtKindFromTokenPositionEvenIfLocked
  /* 13CBC0 801349C0 ADD80014 */        sw $t8, 0x14($t6)
  /* 13CBC4 801349C4 3C048014 */       lui $a0, %hi(gMN1PBonusesGObj)
  /* 13CBC8 801349C8 8C848FB0 */        lw $a0, %lo(gMN1PBonusesGObj)($a0)
  /* 13CBCC 801349CC AFA20034 */        sw $v0, 0x34($sp)
  /* 13CBD0 801349D0 50800006 */      beql $a0, $zero, .L801349EC
  /* 13CBD4 801349D4 8FA80034 */        lw $t0, 0x34($sp)
  /* 13CBD8 801349D8 0C0026A1 */       jal omEjectGObj
  /* 13CBDC 801349DC 00000000 */       nop
  /* 13CBE0 801349E0 3C018014 */       lui $at, %hi(gMN1PBonusesGObj)
  /* 13CBE4 801349E4 AC208FB0 */        sw $zero, %lo(gMN1PBonusesGObj)($at)
  /* 13CBE8 801349E8 8FA80034 */        lw $t0, 0x34($sp)
  .L801349EC:
  /* 13CBEC 801349EC 2401001C */     addiu $at, $zero, 0x1c
  /* 13CBF0 801349F0 00002025 */        or $a0, $zero, $zero
  /* 13CBF4 801349F4 1101004D */       beq $t0, $at, .L80134B2C
  /* 13CBF8 801349F8 00002825 */        or $a1, $zero, $zero
  /* 13CBFC 801349FC 24060017 */     addiu $a2, $zero, 0x17
  /* 13CC00 80134A00 0C00265A */       jal omMakeGObjSPAfter
  /* 13CC04 80134A04 3C078000 */       lui $a3, 0x8000
  /* 13CC08 80134A08 3C018014 */       lui $at, %hi(gMN1PBonusesGObj)
  /* 13CC0C 80134A0C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13CC10 80134A10 2409FFFF */     addiu $t1, $zero, -1
  /* 13CC14 80134A14 AC228FB0 */        sw $v0, %lo(gMN1PBonusesGObj)($at)
  /* 13CC18 80134A18 AFA2005C */        sw $v0, 0x5c($sp)
  /* 13CC1C 80134A1C AFA90010 */        sw $t1, 0x10($sp)
  /* 13CC20 80134A20 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13CC24 80134A24 00402025 */        or $a0, $v0, $zero
  /* 13CC28 80134A28 2406001A */     addiu $a2, $zero, 0x1a
  /* 13CC2C 80134A2C 0C00277D */       jal omAddGObjRenderProc
  /* 13CC30 80134A30 3C078000 */       lui $a3, 0x8000
  /* 13CC34 80134A34 3C0A8014 */       lui $t2, %hi(D_ovl27_801396B4)
  /* 13CC38 80134A38 8D4A96B4 */        lw $t2, %lo(D_ovl27_801396B4)($t2)
  /* 13CC3C 80134A3C 3C0B0000 */       lui $t3, %hi(D_NF_00000368)
  /* 13CC40 80134A40 256B0368 */     addiu $t3, $t3, %lo(D_NF_00000368)
  /* 13CC44 80134A44 8FA4005C */        lw $a0, 0x5c($sp)
  /* 13CC48 80134A48 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13CC4C 80134A4C 014B2821 */      addu $a1, $t2, $t3
  /* 13CC50 80134A50 944C0024 */       lhu $t4, 0x24($v0)
  /* 13CC54 80134A54 3C014381 */       lui $at, (0x43810000 >> 16) # 258.0
  /* 13CC58 80134A58 44812000 */      mtc1 $at, $f4 # 258.0 to cop1
  /* 13CC5C 80134A5C 3C014347 */       lui $at, (0x43470000 >> 16) # 199.0
  /* 13CC60 80134A60 44813000 */      mtc1 $at, $f6 # 199.0 to cop1
  /* 13CC64 80134A64 318EFFDF */      andi $t6, $t4, 0xffdf
  /* 13CC68 80134A68 A44E0024 */        sh $t6, 0x24($v0)
  /* 13CC6C 80134A6C 35CF0001 */       ori $t7, $t6, 1
  /* 13CC70 80134A70 24180040 */     addiu $t8, $zero, 0x40
  /* 13CC74 80134A74 2419006F */     addiu $t9, $zero, 0x6f
  /* 13CC78 80134A78 240800CD */     addiu $t0, $zero, 0xcd
  /* 13CC7C 80134A7C A44F0024 */        sh $t7, 0x24($v0)
  /* 13CC80 80134A80 A0580028 */        sb $t8, 0x28($v0)
  /* 13CC84 80134A84 A0590029 */        sb $t9, 0x29($v0)
  /* 13CC88 80134A88 A048002A */        sb $t0, 0x2a($v0)
  /* 13CC8C 80134A8C 3C098014 */       lui $t1, %hi(D_ovl27_801396B4)
  /* 13CC90 80134A90 E4440058 */      swc1 $f4, 0x58($v0)
  /* 13CC94 80134A94 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13CC98 80134A98 8D2996B4 */        lw $t1, %lo(D_ovl27_801396B4)($t1)
  /* 13CC9C 80134A9C 3C0A0000 */       lui $t2, %hi(D_NF_000002C8)
  /* 13CCA0 80134AA0 254A02C8 */     addiu $t2, $t2, %lo(D_NF_000002C8)
  /* 13CCA4 80134AA4 8FA4005C */        lw $a0, 0x5c($sp)
  /* 13CCA8 80134AA8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13CCAC 80134AAC 012A2821 */      addu $a1, $t1, $t2
  /* 13CCB0 80134AB0 944B0024 */       lhu $t3, 0x24($v0)
  /* 13CCB4 80134AB4 3C01438F */       lui $at, (0x438F0000 >> 16) # 286.0
  /* 13CCB8 80134AB8 44814000 */      mtc1 $at, $f8 # 286.0 to cop1
  /* 13CCBC 80134ABC 3C014347 */       lui $at, (0x43470000 >> 16) # 199.0
  /* 13CCC0 80134AC0 44815000 */      mtc1 $at, $f10 # 199.0 to cop1
  /* 13CCC4 80134AC4 316DFFDF */      andi $t5, $t3, 0xffdf
  /* 13CCC8 80134AC8 A44D0024 */        sh $t5, 0x24($v0)
  /* 13CCCC 80134ACC 35AE0001 */       ori $t6, $t5, 1
  /* 13CCD0 80134AD0 240F0040 */     addiu $t7, $zero, 0x40
  /* 13CCD4 80134AD4 2418006F */     addiu $t8, $zero, 0x6f
  /* 13CCD8 80134AD8 241900CD */     addiu $t9, $zero, 0xcd
  /* 13CCDC 80134ADC A44E0024 */        sh $t6, 0x24($v0)
  /* 13CCE0 80134AE0 A04F0028 */        sb $t7, 0x28($v0)
  /* 13CCE4 80134AE4 A0580029 */        sb $t8, 0x29($v0)
  /* 13CCE8 80134AE8 A059002A */        sb $t9, 0x2a($v0)
  /* 13CCEC 80134AEC E4480058 */      swc1 $f8, 0x58($v0)
  /* 13CCF0 80134AF0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13CCF4 80134AF4 0C04D25A */       jal mn1PGetBonuses
  /* 13CCF8 80134AF8 8FA40034 */        lw $a0, 0x34($sp)
  /* 13CCFC 80134AFC 3C06438E */       lui $a2, (0x438E8000 >> 16) # 1133412352
  /* 13CD00 80134B00 27A80038 */     addiu $t0, $sp, 0x38
  /* 13CD04 80134B04 24090003 */     addiu $t1, $zero, 3
  /* 13CD08 80134B08 240A0001 */     addiu $t2, $zero, 1
  /* 13CD0C 80134B0C AFAA0018 */        sw $t2, 0x18($sp)
  /* 13CD10 80134B10 AFA90014 */        sw $t1, 0x14($sp)
  /* 13CD14 80134B14 AFA80010 */        sw $t0, 0x10($sp)
  /* 13CD18 80134B18 34C68000 */       ori $a2, $a2, (0x438E8000 & 0xFFFF) # 1133412352
  /* 13CD1C 80134B1C 8FA4005C */        lw $a0, 0x5c($sp)
  /* 13CD20 80134B20 00402825 */        or $a1, $v0, $zero
  /* 13CD24 80134B24 0C04C73B */       jal mn1PCreateSmallerNumber
  /* 13CD28 80134B28 3C074346 */       lui $a3, 0x4346
  .L80134B2C:
  /* 13CD2C 80134B2C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13CD30 80134B30 27BD0060 */     addiu $sp, $sp, 0x60
  /* 13CD34 80134B34 03E00008 */        jr $ra
  /* 13CD38 80134B38 00000000 */       nop

glabel mn1PDrawHighscoreAndBonuses
  /* 13CD3C 80134B3C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13CD40 80134B40 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13CD44 80134B44 0C04D1DB */       jal mn1PDrawHighscore
  /* 13CD48 80134B48 00000000 */       nop
  /* 13CD4C 80134B4C 0C04D25F */       jal mn1PDrawBonuses
  /* 13CD50 80134B50 00000000 */       nop
  /* 13CD54 80134B54 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13CD58 80134B58 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13CD5C 80134B5C 03E00008 */        jr $ra
  /* 13CD60 80134B60 00000000 */       nop

glabel mn1PGetTotalHighscore
  /* 13CD64 80134B64 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13CD68 80134B68 AFB20020 */        sw $s2, 0x20($sp)
  /* 13CD6C 80134B6C AFB1001C */        sw $s1, 0x1c($sp)
  /* 13CD70 80134B70 AFB00018 */        sw $s0, 0x18($sp)
  /* 13CD74 80134B74 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13CD78 80134B78 00008825 */        or $s1, $zero, $zero
  /* 13CD7C 80134B7C 00008025 */        or $s0, $zero, $zero
  /* 13CD80 80134B80 2412000C */     addiu $s2, $zero, 0xc
  .L80134B84:
  /* 13CD84 80134B84 0C04D1D6 */       jal mn1PGetHighscore
  /* 13CD88 80134B88 02002025 */        or $a0, $s0, $zero
  /* 13CD8C 80134B8C 26100001 */     addiu $s0, $s0, 1
  /* 13CD90 80134B90 1612FFFC */       bne $s0, $s2, .L80134B84
  /* 13CD94 80134B94 02228821 */      addu $s1, $s1, $v0
  /* 13CD98 80134B98 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13CD9C 80134B9C 02201025 */        or $v0, $s1, $zero
  /* 13CDA0 80134BA0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 13CDA4 80134BA4 8FB00018 */        lw $s0, 0x18($sp)
  /* 13CDA8 80134BA8 8FB20020 */        lw $s2, 0x20($sp)
  /* 13CDAC 80134BAC 03E00008 */        jr $ra
  /* 13CDB0 80134BB0 27BD0028 */     addiu $sp, $sp, 0x28

glabel mn1PDrawTotalHighscore
  /* 13CDB4 80134BB4 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13CDB8 80134BB8 3C0F8014 */       lui $t7, %hi(dMN1PTotalHighscoreTextColors)
  /* 13CDBC 80134BBC AFBF0024 */        sw $ra, 0x24($sp)
  /* 13CDC0 80134BC0 25EF8B34 */     addiu $t7, $t7, %lo(dMN1PTotalHighscoreTextColors)
  /* 13CDC4 80134BC4 8DF90000 */        lw $t9, ($t7) # dMN1PTotalHighscoreTextColors + 0
  /* 13CDC8 80134BC8 27AE0044 */     addiu $t6, $sp, 0x44
  /* 13CDCC 80134BCC 8DF80004 */        lw $t8, 4($t7) # dMN1PTotalHighscoreTextColors + 4
  /* 13CDD0 80134BD0 ADD90000 */        sw $t9, ($t6)
  /* 13CDD4 80134BD4 8DF90008 */        lw $t9, 8($t7) # dMN1PTotalHighscoreTextColors + 8
  /* 13CDD8 80134BD8 3C098014 */       lui $t1, %hi(dMN1PHighscoreNumberColors)
  /* 13CDDC 80134BDC 25298B40 */     addiu $t1, $t1, %lo(dMN1PHighscoreNumberColors)
  /* 13CDE0 80134BE0 ADD80004 */        sw $t8, 4($t6)
  /* 13CDE4 80134BE4 ADD90008 */        sw $t9, 8($t6)
  /* 13CDE8 80134BE8 8D2A0004 */        lw $t2, 4($t1) # dMN1PHighscoreNumberColors + 4
  /* 13CDEC 80134BEC 8D2B0000 */        lw $t3, ($t1) # dMN1PHighscoreNumberColors + 0
  /* 13CDF0 80134BF0 27A8002C */     addiu $t0, $sp, 0x2c
  /* 13CDF4 80134BF4 AD0A0004 */        sw $t2, 4($t0)
  /* 13CDF8 80134BF8 AD0B0000 */        sw $t3, ($t0)
  /* 13CDFC 80134BFC 8D2B0008 */        lw $t3, 8($t1) # dMN1PHighscoreNumberColors + 8
  /* 13CE00 80134C00 8D2A000C */        lw $t2, 0xc($t1) # dMN1PHighscoreNumberColors + 12
  /* 13CE04 80134C04 00002025 */        or $a0, $zero, $zero
  /* 13CE08 80134C08 AD0B0008 */        sw $t3, 8($t0)
  /* 13CE0C 80134C0C AD0A000C */        sw $t2, 0xc($t0)
  /* 13CE10 80134C10 8D2A0014 */        lw $t2, 0x14($t1) # dMN1PHighscoreNumberColors + 20
  /* 13CE14 80134C14 8D2B0010 */        lw $t3, 0x10($t1) # dMN1PHighscoreNumberColors + 16
  /* 13CE18 80134C18 00002825 */        or $a1, $zero, $zero
  /* 13CE1C 80134C1C 24060017 */     addiu $a2, $zero, 0x17
  /* 13CE20 80134C20 3C078000 */       lui $a3, 0x8000
  /* 13CE24 80134C24 AD0A0014 */        sw $t2, 0x14($t0)
  /* 13CE28 80134C28 0C00265A */       jal omMakeGObjSPAfter
  /* 13CE2C 80134C2C AD0B0010 */        sw $t3, 0x10($t0)
  /* 13CE30 80134C30 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13CE34 80134C34 240CFFFF */     addiu $t4, $zero, -1
  /* 13CE38 80134C38 AFA2005C */        sw $v0, 0x5c($sp)
  /* 13CE3C 80134C3C AFAC0010 */        sw $t4, 0x10($sp)
  /* 13CE40 80134C40 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13CE44 80134C44 00402025 */        or $a0, $v0, $zero
  /* 13CE48 80134C48 2406001A */     addiu $a2, $zero, 0x1a
  /* 13CE4C 80134C4C 0C00277D */       jal omAddGObjRenderProc
  /* 13CE50 80134C50 3C078000 */       lui $a3, 0x8000
  /* 13CE54 80134C54 3C058014 */       lui $a1, %hi(gMNTotalHighscoreString)
  /* 13CE58 80134C58 27AD0044 */     addiu $t5, $sp, 0x44
  /* 13CE5C 80134C5C AFAD0010 */        sw $t5, 0x10($sp)
  /* 13CE60 80134C60 24A58D4C */     addiu $a1, $a1, %lo(gMNTotalHighscoreString)
  /* 13CE64 80134C64 8FA4005C */        lw $a0, 0x5c($sp)
  /* 13CE68 80134C68 3C0642DA */       lui $a2, 0x42da
  /* 13CE6C 80134C6C 0C04C83E */       jal mn1PDrawString
  /* 13CE70 80134C70 3C074353 */       lui $a3, 0x4353
  /* 13CE74 80134C74 0C04D2D9 */       jal mn1PGetTotalHighscore
  /* 13CE78 80134C78 00000000 */       nop
  /* 13CE7C 80134C7C 27AE002C */     addiu $t6, $sp, 0x2c
  /* 13CE80 80134C80 240F0009 */     addiu $t7, $zero, 9
  /* 13CE84 80134C84 24180001 */     addiu $t8, $zero, 1
  /* 13CE88 80134C88 AFB80018 */        sw $t8, 0x18($sp)
  /* 13CE8C 80134C8C AFAF0014 */        sw $t7, 0x14($sp)
  /* 13CE90 80134C90 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13CE94 80134C94 8FA4005C */        lw $a0, 0x5c($sp)
  /* 13CE98 80134C98 00402825 */        or $a1, $v0, $zero
  /* 13CE9C 80134C9C 3C064380 */       lui $a2, 0x4380
  /* 13CEA0 80134CA0 0C04C73B */       jal mn1PCreateSmallerNumber
  /* 13CEA4 80134CA4 3C074350 */       lui $a3, 0x4350
  /* 13CEA8 80134CA8 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13CEAC 80134CAC 27BD0060 */     addiu $sp, $sp, 0x60
  /* 13CEB0 80134CB0 03E00008 */        jr $ra
  /* 13CEB4 80134CB4 00000000 */       nop

glabel mn1PGetTotalBonuses
  /* 13CEB8 80134CB8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13CEBC 80134CBC AFB20020 */        sw $s2, 0x20($sp)
  /* 13CEC0 80134CC0 AFB1001C */        sw $s1, 0x1c($sp)
  /* 13CEC4 80134CC4 AFB00018 */        sw $s0, 0x18($sp)
  /* 13CEC8 80134CC8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13CECC 80134CCC 00008825 */        or $s1, $zero, $zero
  /* 13CED0 80134CD0 00008025 */        or $s0, $zero, $zero
  /* 13CED4 80134CD4 2412000C */     addiu $s2, $zero, 0xc
  .L80134CD8:
  /* 13CED8 80134CD8 0C04D25A */       jal mn1PGetBonuses
  /* 13CEDC 80134CDC 02002025 */        or $a0, $s0, $zero
  /* 13CEE0 80134CE0 26100001 */     addiu $s0, $s0, 1
  /* 13CEE4 80134CE4 1612FFFC */       bne $s0, $s2, .L80134CD8
  /* 13CEE8 80134CE8 02228821 */      addu $s1, $s1, $v0
  /* 13CEEC 80134CEC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13CEF0 80134CF0 02201025 */        or $v0, $s1, $zero
  /* 13CEF4 80134CF4 8FB1001C */        lw $s1, 0x1c($sp)
  /* 13CEF8 80134CF8 8FB00018 */        lw $s0, 0x18($sp)
  /* 13CEFC 80134CFC 8FB20020 */        lw $s2, 0x20($sp)
  /* 13CF00 80134D00 03E00008 */        jr $ra
  /* 13CF04 80134D04 27BD0028 */     addiu $sp, $sp, 0x28

glabel mn1PDrawTotalBonuses
  /* 13CF08 80134D08 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 13CF0C 80134D0C 3C0F8014 */       lui $t7, %hi(dMN1PTotalBonusesNumberColors)
  /* 13CF10 80134D10 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13CF14 80134D14 25EF8B58 */     addiu $t7, $t7, %lo(dMN1PTotalBonusesNumberColors)
  /* 13CF18 80134D18 8DF90000 */        lw $t9, ($t7) # dMN1PTotalBonusesNumberColors + 0
  /* 13CF1C 80134D1C 8DF80004 */        lw $t8, 4($t7) # dMN1PTotalBonusesNumberColors + 4
  /* 13CF20 80134D20 27AE0030 */     addiu $t6, $sp, 0x30
  /* 13CF24 80134D24 ADD90000 */        sw $t9, ($t6)
  /* 13CF28 80134D28 ADD80004 */        sw $t8, 4($t6)
  /* 13CF2C 80134D2C 8DF8000C */        lw $t8, 0xc($t7) # dMN1PTotalBonusesNumberColors + 12
  /* 13CF30 80134D30 8DF90008 */        lw $t9, 8($t7) # dMN1PTotalBonusesNumberColors + 8
  /* 13CF34 80134D34 00002025 */        or $a0, $zero, $zero
  /* 13CF38 80134D38 ADD8000C */        sw $t8, 0xc($t6)
  /* 13CF3C 80134D3C ADD90008 */        sw $t9, 8($t6)
  /* 13CF40 80134D40 8DF90010 */        lw $t9, 0x10($t7) # dMN1PTotalBonusesNumberColors + 16
  /* 13CF44 80134D44 8DF80014 */        lw $t8, 0x14($t7) # dMN1PTotalBonusesNumberColors + 20
  /* 13CF48 80134D48 00002825 */        or $a1, $zero, $zero
  /* 13CF4C 80134D4C 24060017 */     addiu $a2, $zero, 0x17
  /* 13CF50 80134D50 3C078000 */       lui $a3, 0x8000
  /* 13CF54 80134D54 ADD90010 */        sw $t9, 0x10($t6)
  /* 13CF58 80134D58 0C00265A */       jal omMakeGObjSPAfter
  /* 13CF5C 80134D5C ADD80014 */        sw $t8, 0x14($t6)
  /* 13CF60 80134D60 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13CF64 80134D64 2408FFFF */     addiu $t0, $zero, -1
  /* 13CF68 80134D68 AFA20054 */        sw $v0, 0x54($sp)
  /* 13CF6C 80134D6C AFA80010 */        sw $t0, 0x10($sp)
  /* 13CF70 80134D70 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13CF74 80134D74 00402025 */        or $a0, $v0, $zero
  /* 13CF78 80134D78 2406001A */     addiu $a2, $zero, 0x1a
  /* 13CF7C 80134D7C 0C00277D */       jal omAddGObjRenderProc
  /* 13CF80 80134D80 3C078000 */       lui $a3, 0x8000
  /* 13CF84 80134D84 3C098014 */       lui $t1, %hi(D_ovl27_801396B4)
  /* 13CF88 80134D88 8D2996B4 */        lw $t1, %lo(D_ovl27_801396B4)($t1)
  /* 13CF8C 80134D8C 3C0A0000 */       lui $t2, %hi(D_NF_00000368)
  /* 13CF90 80134D90 254A0368 */     addiu $t2, $t2, %lo(D_NF_00000368)
  /* 13CF94 80134D94 8FA40054 */        lw $a0, 0x54($sp)
  /* 13CF98 80134D98 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13CF9C 80134D9C 012A2821 */      addu $a1, $t1, $t2
  /* 13CFA0 80134DA0 944B0024 */       lhu $t3, 0x24($v0)
  /* 13CFA4 80134DA4 3C014381 */       lui $at, (0x43810000 >> 16) # 258.0
  /* 13CFA8 80134DA8 44812000 */      mtc1 $at, $f4 # 258.0 to cop1
  /* 13CFAC 80134DAC 3C014351 */       lui $at, (0x43510000 >> 16) # 209.0
  /* 13CFB0 80134DB0 44813000 */      mtc1 $at, $f6 # 209.0 to cop1
  /* 13CFB4 80134DB4 316DFFDF */      andi $t5, $t3, 0xffdf
  /* 13CFB8 80134DB8 A44D0024 */        sh $t5, 0x24($v0)
  /* 13CFBC 80134DBC 35AE0001 */       ori $t6, $t5, 1
  /* 13CFC0 80134DC0 240F0040 */     addiu $t7, $zero, 0x40
  /* 13CFC4 80134DC4 2418006F */     addiu $t8, $zero, 0x6f
  /* 13CFC8 80134DC8 241900CD */     addiu $t9, $zero, 0xcd
  /* 13CFCC 80134DCC A44E0024 */        sh $t6, 0x24($v0)
  /* 13CFD0 80134DD0 A04F0028 */        sb $t7, 0x28($v0)
  /* 13CFD4 80134DD4 A0580029 */        sb $t8, 0x29($v0)
  /* 13CFD8 80134DD8 A059002A */        sb $t9, 0x2a($v0)
  /* 13CFDC 80134DDC 3C088014 */       lui $t0, %hi(D_ovl27_801396B4)
  /* 13CFE0 80134DE0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 13CFE4 80134DE4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13CFE8 80134DE8 8D0896B4 */        lw $t0, %lo(D_ovl27_801396B4)($t0)
  /* 13CFEC 80134DEC 3C090000 */       lui $t1, %hi(D_NF_000002C8)
  /* 13CFF0 80134DF0 252902C8 */     addiu $t1, $t1, %lo(D_NF_000002C8)
  /* 13CFF4 80134DF4 8FA40054 */        lw $a0, 0x54($sp)
  /* 13CFF8 80134DF8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13CFFC 80134DFC 01092821 */      addu $a1, $t0, $t1
  /* 13D000 80134E00 944A0024 */       lhu $t2, 0x24($v0)
  /* 13D004 80134E04 3C01438F */       lui $at, (0x438F0000 >> 16) # 286.0
  /* 13D008 80134E08 44814000 */      mtc1 $at, $f8 # 286.0 to cop1
  /* 13D00C 80134E0C 3C014351 */       lui $at, (0x43510000 >> 16) # 209.0
  /* 13D010 80134E10 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 13D014 80134E14 44815000 */      mtc1 $at, $f10 # 209.0 to cop1
  /* 13D018 80134E18 A44C0024 */        sh $t4, 0x24($v0)
  /* 13D01C 80134E1C 358D0001 */       ori $t5, $t4, 1
  /* 13D020 80134E20 240E0040 */     addiu $t6, $zero, 0x40
  /* 13D024 80134E24 240F006F */     addiu $t7, $zero, 0x6f
  /* 13D028 80134E28 241800CD */     addiu $t8, $zero, 0xcd
  /* 13D02C 80134E2C A44D0024 */        sh $t5, 0x24($v0)
  /* 13D030 80134E30 A04E0028 */        sb $t6, 0x28($v0)
  /* 13D034 80134E34 A04F0029 */        sb $t7, 0x29($v0)
  /* 13D038 80134E38 A058002A */        sb $t8, 0x2a($v0)
  /* 13D03C 80134E3C E4480058 */      swc1 $f8, 0x58($v0)
  /* 13D040 80134E40 0C04D32E */       jal mn1PGetTotalBonuses
  /* 13D044 80134E44 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13D048 80134E48 3C06438E */       lui $a2, (0x438E8000 >> 16) # 1133412352
  /* 13D04C 80134E4C 27B90030 */     addiu $t9, $sp, 0x30
  /* 13D050 80134E50 24080003 */     addiu $t0, $zero, 3
  /* 13D054 80134E54 24090001 */     addiu $t1, $zero, 1
  /* 13D058 80134E58 AFA90018 */        sw $t1, 0x18($sp)
  /* 13D05C 80134E5C AFA80014 */        sw $t0, 0x14($sp)
  /* 13D060 80134E60 AFB90010 */        sw $t9, 0x10($sp)
  /* 13D064 80134E64 34C68000 */       ori $a2, $a2, (0x438E8000 & 0xFFFF) # 1133412352
  /* 13D068 80134E68 8FA40054 */        lw $a0, 0x54($sp)
  /* 13D06C 80134E6C 00402825 */        or $a1, $v0, $zero
  /* 13D070 80134E70 0C04C73B */       jal mn1PCreateSmallerNumber
  /* 13D074 80134E74 3C074350 */       lui $a3, 0x4350
  /* 13D078 80134E78 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13D07C 80134E7C 27BD0058 */     addiu $sp, $sp, 0x58
  /* 13D080 80134E80 03E00008 */        jr $ra
  /* 13D084 80134E84 00000000 */       nop

glabel mn1PDrawTotalHighscoreAndBonuses
  /* 13D088 80134E88 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13D08C 80134E8C AFBF0014 */        sw $ra, 0x14($sp)
  /* 13D090 80134E90 0C04D2ED */       jal mn1PDrawTotalHighscore
  /* 13D094 80134E94 00000000 */       nop
  /* 13D098 80134E98 0C04D342 */       jal mn1PDrawTotalBonuses
  /* 13D09C 80134E9C 00000000 */       nop
  /* 13D0A0 80134EA0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13D0A4 80134EA4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13D0A8 80134EA8 03E00008 */        jr $ra
  /* 13D0AC 80134EAC 00000000 */       nop

  /* 13D0B0 80134EB0 03E00008 */        jr $ra
  /* 13D0B4 80134EB4 00000000 */       nop

  /* 13D0B8 80134EB8 03E00008 */        jr $ra
  /* 13D0BC 80134EBC 00000000 */       nop

glabel mn1PGetAvailableCostume
  /* 13D0C0 80134EC0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13D0C4 80134EC4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13D0C8 80134EC8 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 13D0CC 80134ECC 00000000 */       nop
  /* 13D0D0 80134ED0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13D0D4 80134ED4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13D0D8 80134ED8 03E00008 */        jr $ra
  /* 13D0DC 80134EDC 00000000 */       nop

glabel mn1PGetSelectedAnimation
  /* 13D0E0 80134EE0 2C81000C */     sltiu $at, $a0, 0xc
  /* 13D0E4 80134EE4 10200012 */      beqz $at, jtgt_ovl27_80134F30
  /* 13D0E8 80134EE8 00047080 */       sll $t6, $a0, 2
  /* 13D0EC 80134EEC 3C018014 */       lui $at, %hi(jtbl_ovl27_80138E84)
  /* 13D0F0 80134EF0 002E0821 */      addu $at, $at, $t6
  /* 13D0F4 80134EF4 8C2E8E84 */        lw $t6, %lo(jtbl_ovl27_80138E84)($at)
  /* 13D0F8 80134EF8 01C00008 */        jr $t6
  /* 13D0FC 80134EFC 00000000 */       nop
  glabel jtgt_ovl27_80134F00
  /* 13D100 80134F00 3C020001 */       lui $v0, (0x10004 >> 16) # 65540
  /* 13D104 80134F04 03E00008 */        jr $ra
  /* 13D108 80134F08 34420004 */       ori $v0, $v0, (0x10004 & 0xFFFF) # 65540

  glabel jtgt_ovl27_80134F0C
  /* 13D10C 80134F0C 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 13D110 80134F10 03E00008 */        jr $ra
  /* 13D114 80134F14 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537

  glabel jtgt_ovl27_80134F18
  /* 13D118 80134F18 3C020001 */       lui $v0, (0x10002 >> 16) # 65538
  /* 13D11C 80134F1C 03E00008 */        jr $ra
  /* 13D120 80134F20 34420002 */       ori $v0, $v0, (0x10002 & 0xFFFF) # 65538

  glabel jtgt_ovl27_80134F24
  /* 13D124 80134F24 3C020001 */       lui $v0, (0x10003 >> 16) # 65539
  /* 13D128 80134F28 03E00008 */        jr $ra
  /* 13D12C 80134F2C 34420003 */       ori $v0, $v0, (0x10003 & 0xFFFF) # 65539

  glabel jtgt_ovl27_80134F30
  /* 13D130 80134F30 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 13D134 80134F34 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537
  /* 13D138 80134F38 03E00008 */        jr $ra
  /* 13D13C 80134F3C 00000000 */       nop

glabel mn1PRotateFighter
  /* 13D140 80134F40 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13D144 80134F44 AFB00018 */        sw $s0, 0x18($sp)
  /* 13D148 80134F48 3C108014 */       lui $s0, %hi(gMN1PPanel)
  /* 13D14C 80134F4C 26108EE8 */     addiu $s0, $s0, %lo(gMN1PPanel)
  /* 13D150 80134F50 8E0E0058 */        lw $t6, 0x58($s0) # gMN1PPanel + 88
  /* 13D154 80134F54 24010001 */     addiu $at, $zero, 1
  /* 13D158 80134F58 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13D15C 80134F5C 55C1002C */      bnel $t6, $at, .L80135010
  /* 13D160 80134F60 8C820074 */        lw $v0, 0x74($a0)
  /* 13D164 80134F64 8C820074 */        lw $v0, 0x74($a0)
  /* 13D168 80134F68 3C018014 */       lui $at, %hi(D_ovl27_80138EB4)
  /* 13D16C 80134F6C C4248EB4 */      lwc1 $f4, %lo(D_ovl27_80138EB4)($at)
  /* 13D170 80134F70 C4400034 */      lwc1 $f0, 0x34($v0)
  /* 13D174 80134F74 3C018014 */       lui $at, 0x8014
  /* 13D178 80134F78 4604003C */    c.lt.s $f0, $f4
  /* 13D17C 80134F7C 00000000 */       nop
  /* 13D180 80134F80 4500000C */      bc1f .L80134FB4
  /* 13D184 80134F84 00000000 */       nop
  /* 13D188 80134F88 8E0F005C */        lw $t7, 0x5c($s0) # gMN1PPanel + 92
  /* 13D18C 80134F8C 55E00030 */      bnel $t7, $zero, .L80135050
  /* 13D190 80134F90 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13D194 80134F94 0C04D3B8 */       jal mn1PGetSelectedAnimation
  /* 13D198 80134F98 8E040020 */        lw $a0, 0x20($s0) # gMN1PPanel + 32
  /* 13D19C 80134F9C 8E040008 */        lw $a0, 8($s0) # gMN1PPanel + 8
  /* 13D1A0 80134FA0 0C0E4173 */       jal func_ovl1_803905CC
  /* 13D1A4 80134FA4 00402825 */        or $a1, $v0, $zero
  /* 13D1A8 80134FA8 24180001 */     addiu $t8, $zero, 1
  /* 13D1AC 80134FAC 10000027 */         b .L8013504C
  /* 13D1B0 80134FB0 AE18005C */        sw $t8, 0x5c($s0) # gMN1PPanel + 92
  .L80134FB4:
  /* 13D1B4 80134FB4 C4228EB8 */      lwc1 $f2, -0x7148($at)
  /* 13D1B8 80134FB8 3C018014 */       lui $at, %hi(D_ovl27_80138EBC)
  /* 13D1BC 80134FBC C4268EBC */      lwc1 $f6, %lo(D_ovl27_80138EBC)($at)
  /* 13D1C0 80134FC0 46060200 */     add.s $f8, $f0, $f6
  /* 13D1C4 80134FC4 E4480034 */      swc1 $f8, 0x34($v0)
  /* 13D1C8 80134FC8 8C820074 */        lw $v0, 0x74($a0)
  /* 13D1CC 80134FCC C44A0034 */      lwc1 $f10, 0x34($v0)
  /* 13D1D0 80134FD0 460A103C */    c.lt.s $f2, $f10
  /* 13D1D4 80134FD4 00000000 */       nop
  /* 13D1D8 80134FD8 4502001D */     bc1fl .L80135050
  /* 13D1DC 80134FDC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13D1E0 80134FE0 44808000 */      mtc1 $zero, $f16
  /* 13D1E4 80134FE4 00000000 */       nop
  /* 13D1E8 80134FE8 E4500034 */      swc1 $f16, 0x34($v0)
  /* 13D1EC 80134FEC 0C04D3B8 */       jal mn1PGetSelectedAnimation
  /* 13D1F0 80134FF0 8E040020 */        lw $a0, 0x20($s0) # gMN1PPanel + 32
  /* 13D1F4 80134FF4 8E040008 */        lw $a0, 8($s0) # gMN1PPanel + 8
  /* 13D1F8 80134FF8 0C0E4173 */       jal func_ovl1_803905CC
  /* 13D1FC 80134FFC 00402825 */        or $a1, $v0, $zero
  /* 13D200 80135000 24190001 */     addiu $t9, $zero, 1
  /* 13D204 80135004 10000011 */         b .L8013504C
  /* 13D208 80135008 AE19005C */        sw $t9, 0x5c($s0) # gMN1PPanel + 92
  /* 13D20C 8013500C 8C820074 */        lw $v0, 0x74($a0)
  .L80135010:
  /* 13D210 80135010 3C018014 */       lui $at, %hi(D_ovl27_80138EC0)
  /* 13D214 80135014 C4228EC0 */      lwc1 $f2, %lo(D_ovl27_80138EC0)($at)
  /* 13D218 80135018 3C018014 */       lui $at, %hi(D_ovl27_80138EC4)
  /* 13D21C 8013501C C4248EC4 */      lwc1 $f4, %lo(D_ovl27_80138EC4)($at)
  /* 13D220 80135020 C4520034 */      lwc1 $f18, 0x34($v0)
  /* 13D224 80135024 46049180 */     add.s $f6, $f18, $f4
  /* 13D228 80135028 E4460034 */      swc1 $f6, 0x34($v0)
  /* 13D22C 8013502C 8C820074 */        lw $v0, 0x74($a0)
  /* 13D230 80135030 C4400034 */      lwc1 $f0, 0x34($v0)
  /* 13D234 80135034 4600103C */    c.lt.s $f2, $f0
  /* 13D238 80135038 00000000 */       nop
  /* 13D23C 8013503C 45020004 */     bc1fl .L80135050
  /* 13D240 80135040 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13D244 80135044 46020201 */     sub.s $f8, $f0, $f2
  /* 13D248 80135048 E4480034 */      swc1 $f8, 0x34($v0)
  .L8013504C:
  /* 13D24C 8013504C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80135050:
  /* 13D250 80135050 8FB00018 */        lw $s0, 0x18($sp)
  /* 13D254 80135054 27BD0020 */     addiu $sp, $sp, 0x20
  /* 13D258 80135058 03E00008 */        jr $ra
  /* 13D25C 8013505C 00000000 */       nop

glabel mn1PSpawnFighter
  /* 13D260 80135060 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 13D264 80135064 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 13D268 80135068 AFB00018 */        sw $s0, 0x18($sp)
  /* 13D26C 8013506C 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 13D270 80135070 00808025 */        or $s0, $a0, $zero
  /* 13D274 80135074 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13D278 80135078 AFA5006C */        sw $a1, 0x6c($sp)
  /* 13D27C 8013507C AFA60070 */        sw $a2, 0x70($sp)
  /* 13D280 80135080 25E8003C */     addiu $t0, $t7, 0x3c
  /* 13D284 80135084 27AE0024 */     addiu $t6, $sp, 0x24
  .L80135088:
  /* 13D288 80135088 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 13D28C 8013508C 25EF000C */     addiu $t7, $t7, 0xc
  /* 13D290 80135090 25CE000C */     addiu $t6, $t6, 0xc
  /* 13D294 80135094 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 13D298 80135098 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 13D29C 8013509C ADD8FFF8 */        sw $t8, -8($t6)
  /* 13D2A0 801350A0 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 13D2A4 801350A4 15E8FFF8 */       bne $t7, $t0, .L80135088
  /* 13D2A8 801350A8 ADD9FFFC */        sw $t9, -4($t6)
  /* 13D2AC 801350AC 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 13D2B0 801350B0 2401001C */     addiu $at, $zero, 0x1c
  /* 13D2B4 801350B4 ADD90000 */        sw $t9, ($t6)
  /* 13D2B8 801350B8 8FA90070 */        lw $t1, 0x70($sp)
  /* 13D2BC 801350BC 5121003F */      beql $t1, $at, .L801351BC
  /* 13D2C0 801350C0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13D2C4 801350C4 5200000A */      beql $s0, $zero, .L801350F0
  /* 13D2C8 801350C8 44803000 */      mtc1 $zero, $f6
  /* 13D2CC 801350CC 8E0A0074 */        lw $t2, 0x74($s0)
  /* 13D2D0 801350D0 02002025 */        or $a0, $s0, $zero
  /* 13D2D4 801350D4 C5440034 */      lwc1 $f4, 0x34($t2)
  /* 13D2D8 801350D8 AFA70074 */        sw $a3, 0x74($sp)
  /* 13D2DC 801350DC 0C035E3A */       jal ftManagerDestroyFighter
  /* 13D2E0 801350E0 E7A40064 */      swc1 $f4, 0x64($sp)
  /* 13D2E4 801350E4 10000004 */         b .L801350F8
  /* 13D2E8 801350E8 8FA70074 */        lw $a3, 0x74($sp)
  /* 13D2EC 801350EC 44803000 */      mtc1 $zero, $f6
  .L801350F0:
  /* 13D2F0 801350F0 00000000 */       nop
  /* 13D2F4 801350F4 E7A60064 */      swc1 $f6, 0x64($sp)
  .L801350F8:
  /* 13D2F8 801350F8 3C0D8014 */       lui $t5, %hi(gMN1PAnimHeap)
  /* 13D2FC 801350FC 8FAB0070 */        lw $t3, 0x70($sp)
  /* 13D300 80135100 8DAD8FC4 */        lw $t5, %lo(gMN1PAnimHeap)($t5)
  /* 13D304 80135104 8FA8006C */        lw $t0, 0x6c($sp)
  /* 13D308 80135108 30EC00FF */      andi $t4, $a3, 0xff
  /* 13D30C 8013510C 3C018014 */       lui $at, %hi(D_ovl27_80138F0C)
  /* 13D310 80135110 AC2C8F0C */        sw $t4, %lo(D_ovl27_80138F0C)($at)
  /* 13D314 80135114 A3A7003B */        sb $a3, 0x3b($sp)
  /* 13D318 80135118 A3A0003C */        sb $zero, 0x3c($sp)
  /* 13D31C 8013511C 27A40024 */     addiu $a0, $sp, 0x24
  /* 13D320 80135120 AFAB0024 */        sw $t3, 0x24($sp)
  /* 13D324 80135124 AFAD005C */        sw $t5, 0x5c($sp)
  /* 13D328 80135128 0C035FCF */       jal ftManagerMakeFighter
  /* 13D32C 8013512C A3A80039 */        sb $t0, 0x39($sp)
  /* 13D330 80135130 3C018014 */       lui $at, %hi(D_ovl27_80138EF0)
  /* 13D334 80135134 3C058013 */       lui $a1, %hi(mn1PRotateFighter)
  /* 13D338 80135138 AC228EF0 */        sw $v0, %lo(D_ovl27_80138EF0)($at)
  /* 13D33C 8013513C 00408025 */        or $s0, $v0, $zero
  /* 13D340 80135140 24A54F40 */     addiu $a1, $a1, %lo(mn1PRotateFighter)
  /* 13D344 80135144 00402025 */        or $a0, $v0, $zero
  /* 13D348 80135148 24060001 */     addiu $a2, $zero, 1
  /* 13D34C 8013514C 0C002062 */       jal omAddGObjCommonProc
  /* 13D350 80135150 24070001 */     addiu $a3, $zero, 1
  /* 13D354 80135154 3C018014 */       lui $at, %hi(D_ovl27_80138EC8)
  /* 13D358 80135158 C4288EC8 */      lwc1 $f8, %lo(D_ovl27_80138EC8)($at)
  /* 13D35C 8013515C 8E0F0074 */        lw $t7, 0x74($s0)
  /* 13D360 80135160 3C018014 */       lui $at, %hi(D_ovl27_80138ECC)
  /* 13D364 80135164 3C0A8039 */       lui $t2, %hi(D_ovl1_80390D90)
  /* 13D368 80135168 E5E8001C */      swc1 $f8, 0x1c($t7)
  /* 13D36C 8013516C 8E0E0074 */        lw $t6, 0x74($s0)
  /* 13D370 80135170 C42A8ECC */      lwc1 $f10, %lo(D_ovl27_80138ECC)($at)
  /* 13D374 80135174 254A0D90 */     addiu $t2, $t2, %lo(D_ovl1_80390D90)
  /* 13D378 80135178 E5CA0020 */      swc1 $f10, 0x20($t6)
  /* 13D37C 8013517C 8E180074 */        lw $t8, 0x74($s0)
  /* 13D380 80135180 C7B00064 */      lwc1 $f16, 0x64($sp)
  /* 13D384 80135184 E7100034 */      swc1 $f16, 0x34($t8)
  /* 13D388 80135188 8FB90070 */        lw $t9, 0x70($sp)
  /* 13D38C 8013518C 8E0B0074 */        lw $t3, 0x74($s0)
  /* 13D390 80135190 00194880 */       sll $t1, $t9, 2
  /* 13D394 80135194 012A1821 */      addu $v1, $t1, $t2
  /* 13D398 80135198 C4720000 */      lwc1 $f18, ($v1)
  /* 13D39C 8013519C E5720040 */      swc1 $f18, 0x40($t3)
  /* 13D3A0 801351A0 8E0C0074 */        lw $t4, 0x74($s0)
  /* 13D3A4 801351A4 C4640000 */      lwc1 $f4, ($v1)
  /* 13D3A8 801351A8 E5840044 */      swc1 $f4, 0x44($t4)
  /* 13D3AC 801351AC 8E0D0074 */        lw $t5, 0x74($s0)
  /* 13D3B0 801351B0 C4660000 */      lwc1 $f6, ($v1)
  /* 13D3B4 801351B4 E5A60048 */      swc1 $f6, 0x48($t5)
  /* 13D3B8 801351B8 8FBF001C */        lw $ra, 0x1c($sp)
  .L801351BC:
  /* 13D3BC 801351BC 8FB00018 */        lw $s0, 0x18($sp)
  /* 13D3C0 801351C0 27BD0068 */     addiu $sp, $sp, 0x68
  /* 13D3C4 801351C4 03E00008 */        jr $ra
  /* 13D3C8 801351C8 00000000 */       nop

glabel mn1PCreateFighterViewport
  /* 13D3CC 801351CC 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 13D3D0 801351D0 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 13D3D4 801351D4 3C190004 */       lui $t9, (0x48600 >> 16) # 296448
  /* 13D3D8 801351D8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13D3DC 801351DC 37398600 */       ori $t9, $t9, (0x48600 & 0xFFFF) # 296448
  /* 13D3E0 801351E0 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 13D3E4 801351E4 240F0014 */     addiu $t7, $zero, 0x14
  /* 13D3E8 801351E8 24180000 */     addiu $t8, $zero, 0
  /* 13D3EC 801351EC 2408FFFF */     addiu $t0, $zero, -1
  /* 13D3F0 801351F0 24090001 */     addiu $t1, $zero, 1
  /* 13D3F4 801351F4 240A0001 */     addiu $t2, $zero, 1
  /* 13D3F8 801351F8 240B0001 */     addiu $t3, $zero, 1
  /* 13D3FC 801351FC AFAB0030 */        sw $t3, 0x30($sp)
  /* 13D400 80135200 AFAA0028 */        sw $t2, 0x28($sp)
  /* 13D404 80135204 AFA90024 */        sw $t1, 0x24($sp)
  /* 13D408 80135208 AFA80020 */        sw $t0, 0x20($sp)
  /* 13D40C 8013520C AFB80018 */        sw $t8, 0x18($sp)
  /* 13D410 80135210 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13D414 80135214 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13D418 80135218 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13D41C 8013521C AFA0002C */        sw $zero, 0x2c($sp)
  /* 13D420 80135220 AFA00034 */        sw $zero, 0x34($sp)
  /* 13D424 80135224 24040401 */     addiu $a0, $zero, 0x401
  /* 13D428 80135228 00002825 */        or $a1, $zero, $zero
  /* 13D42C 8013522C 24060010 */     addiu $a2, $zero, 0x10
  /* 13D430 80135230 0C002E4F */       jal func_8000B93C
  /* 13D434 80135234 3C078000 */       lui $a3, 0x8000
  /* 13D438 80135238 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13D43C 8013523C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13D440 80135240 8C430074 */        lw $v1, 0x74($v0)
  /* 13D444 80135244 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13D448 80135248 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13D44C 8013524C 44050000 */      mfc1 $a1, $f0
  /* 13D450 80135250 44060000 */      mfc1 $a2, $f0
  /* 13D454 80135254 3C07439B */       lui $a3, 0x439b
  /* 13D458 80135258 24640008 */     addiu $a0, $v1, 8
  /* 13D45C 8013525C AFA30044 */        sw $v1, 0x44($sp)
  /* 13D460 80135260 0C001C20 */       jal func_80007080
  /* 13D464 80135264 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13D468 80135268 8FA30044 */        lw $v1, 0x44($sp)
  /* 13D46C 8013526C 44800000 */      mtc1 $zero, $f0
  /* 13D470 80135270 3C018014 */       lui $at, %hi(D_ovl27_80138ED0)
  /* 13D474 80135274 240C0004 */     addiu $t4, $zero, 4
  /* 13D478 80135278 E460003C */      swc1 $f0, 0x3c($v1)
  /* 13D47C 8013527C E4600040 */      swc1 $f0, 0x40($v1)
  /* 13D480 80135280 C4268ED0 */      lwc1 $f6, %lo(D_ovl27_80138ED0)($at)
  /* 13D484 80135284 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13D488 80135288 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 13D48C 8013528C AC6C0080 */        sw $t4, 0x80($v1)
  /* 13D490 80135290 E4600048 */      swc1 $f0, 0x48($v1)
  /* 13D494 80135294 E460004C */      swc1 $f0, 0x4c($v1)
  /* 13D498 80135298 E4600050 */      swc1 $f0, 0x50($v1)
  /* 13D49C 8013529C E4600054 */      swc1 $f0, 0x54($v1)
  /* 13D4A0 801352A0 E460005C */      swc1 $f0, 0x5c($v1)
  /* 13D4A4 801352A4 E4660044 */      swc1 $f6, 0x44($v1)
  /* 13D4A8 801352A8 E4680058 */      swc1 $f8, 0x58($v1)
  /* 13D4AC 801352AC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13D4B0 801352B0 27BD0048 */     addiu $sp, $sp, 0x48
  /* 13D4B4 801352B4 03E00008 */        jr $ra
  /* 13D4B8 801352B8 00000000 */       nop

glabel mn1PRedrawCursor
  /* 13D4BC 801352BC 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 13D4C0 801352C0 3C0F8014 */       lui $t7, %hi(dMN1PCursorTypeColors)
  /* 13D4C4 801352C4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13D4C8 801352C8 AFA5007C */        sw $a1, 0x7c($sp)
  /* 13D4CC 801352CC AFA60080 */        sw $a2, 0x80($sp)
  /* 13D4D0 801352D0 25EF8B70 */     addiu $t7, $t7, %lo(dMN1PCursorTypeColors)
  /* 13D4D4 801352D4 8DF90000 */        lw $t9, ($t7) # dMN1PCursorTypeColors + 0
  /* 13D4D8 801352D8 8DF80004 */        lw $t8, 4($t7) # dMN1PCursorTypeColors + 4
  /* 13D4DC 801352DC 27AE0054 */     addiu $t6, $sp, 0x54
  /* 13D4E0 801352E0 ADD90000 */        sw $t9, ($t6)
  /* 13D4E4 801352E4 ADD80004 */        sw $t8, 4($t6)
  /* 13D4E8 801352E8 8DF8000C */        lw $t8, 0xc($t7) # dMN1PCursorTypeColors + 12
  /* 13D4EC 801352EC 8DF90008 */        lw $t9, 8($t7) # dMN1PCursorTypeColors + 8
  /* 13D4F0 801352F0 3C098014 */       lui $t1, %hi(dMN1PCursorTypeOffsets)
  /* 13D4F4 801352F4 ADD8000C */        sw $t8, 0xc($t6)
  /* 13D4F8 801352F8 ADD90008 */        sw $t9, 8($t6)
  /* 13D4FC 801352FC 8DF90010 */        lw $t9, 0x10($t7) # dMN1PCursorTypeColors + 16
  /* 13D500 80135300 8DF80014 */        lw $t8, 0x14($t7) # dMN1PCursorTypeColors + 20
  /* 13D504 80135304 25298B88 */     addiu $t1, $t1, %lo(dMN1PCursorTypeOffsets)
  /* 13D508 80135308 ADD90010 */        sw $t9, 0x10($t6)
  /* 13D50C 8013530C ADD80014 */        sw $t8, 0x14($t6)
  /* 13D510 80135310 8D2A0004 */        lw $t2, 4($t1) # dMN1PCursorTypeOffsets + 4
  /* 13D514 80135314 8D2B0000 */        lw $t3, ($t1) # dMN1PCursorTypeOffsets + 0
  /* 13D518 80135318 27A80044 */     addiu $t0, $sp, 0x44
  /* 13D51C 8013531C AD0A0004 */        sw $t2, 4($t0)
  /* 13D520 80135320 AD0B0000 */        sw $t3, ($t0)
  /* 13D524 80135324 8D2B0008 */        lw $t3, 8($t1) # dMN1PCursorTypeOffsets + 8
  /* 13D528 80135328 8D2A000C */        lw $t2, 0xc($t1) # dMN1PCursorTypeOffsets + 12
  /* 13D52C 8013532C 3C0D8014 */       lui $t5, %hi(dMN1PCursorOffsets)
  /* 13D530 80135330 25AD8B98 */     addiu $t5, $t5, %lo(dMN1PCursorOffsets)
  /* 13D534 80135334 AD0B0008 */        sw $t3, 8($t0)
  /* 13D538 80135338 AD0A000C */        sw $t2, 0xc($t0)
  /* 13D53C 8013533C 8DAF0000 */        lw $t7, ($t5) # dMN1PCursorOffsets + 0
  /* 13D540 80135340 27AC0038 */     addiu $t4, $sp, 0x38
  /* 13D544 80135344 8DAE0004 */        lw $t6, 4($t5) # dMN1PCursorOffsets + 4
  /* 13D548 80135348 AD8F0000 */        sw $t7, ($t4)
  /* 13D54C 8013534C 8DAF0008 */        lw $t7, 8($t5) # dMN1PCursorOffsets + 8
  /* 13D550 80135350 3C198014 */       lui $t9, %hi(dMN1PCursorTypePositions)
  /* 13D554 80135354 27398BA4 */     addiu $t9, $t9, %lo(dMN1PCursorTypePositions)
  /* 13D558 80135358 AD8E0004 */        sw $t6, 4($t4)
  /* 13D55C 8013535C AD8F0008 */        sw $t7, 8($t4)
  /* 13D560 80135360 8F280004 */        lw $t0, 4($t9) # dMN1PCursorTypePositions + 4
  /* 13D564 80135364 8F290000 */        lw $t1, ($t9) # dMN1PCursorTypePositions + 0
  /* 13D568 80135368 27B80020 */     addiu $t8, $sp, 0x20
  /* 13D56C 8013536C AF080004 */        sw $t0, 4($t8)
  /* 13D570 80135370 AF090000 */        sw $t1, ($t8)
  /* 13D574 80135374 8F290008 */        lw $t1, 8($t9) # dMN1PCursorTypePositions + 8
  /* 13D578 80135378 8F28000C */        lw $t0, 0xc($t9) # dMN1PCursorTypePositions + 12
  /* 13D57C 8013537C AF090008 */        sw $t1, 8($t8)
  /* 13D580 80135380 AF08000C */        sw $t0, 0xc($t8)
  /* 13D584 80135384 8F280014 */        lw $t0, 0x14($t9) # dMN1PCursorTypePositions + 20
  /* 13D588 80135388 8F290010 */        lw $t1, 0x10($t9) # dMN1PCursorTypePositions + 16
  /* 13D58C 8013538C AF080014 */        sw $t0, 0x14($t8)
  /* 13D590 80135390 AF090010 */        sw $t1, 0x10($t8)
  /* 13D594 80135394 8C820074 */        lw $v0, 0x74($a0)
  /* 13D598 80135398 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13D59C 8013539C E7A40070 */      swc1 $f4, 0x70($sp)
  /* 13D5A0 801353A0 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 13D5A4 801353A4 AFA40078 */        sw $a0, 0x78($sp)
  /* 13D5A8 801353A8 0C002DD8 */       jal func_8000B760
  /* 13D5AC 801353AC E7A6006C */      swc1 $f6, 0x6c($sp)
  /* 13D5B0 801353B0 8FAA0080 */        lw $t2, 0x80($sp)
  /* 13D5B4 801353B4 3C0D8014 */       lui $t5, %hi(D_ovl27_801396A0)
  /* 13D5B8 801353B8 8DAD96A0 */        lw $t5, %lo(D_ovl27_801396A0)($t5)
  /* 13D5BC 801353BC 000A5880 */       sll $t3, $t2, 2
  /* 13D5C0 801353C0 03AB6021 */      addu $t4, $sp, $t3
  /* 13D5C4 801353C4 8D8C0038 */        lw $t4, 0x38($t4)
  /* 13D5C8 801353C8 8FA40078 */        lw $a0, 0x78($sp)
  /* 13D5CC 801353CC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13D5D0 801353D0 018D2821 */      addu $a1, $t4, $t5
  /* 13D5D4 801353D4 C7A80070 */      lwc1 $f8, 0x70($sp)
  /* 13D5D8 801353D8 944E0024 */       lhu $t6, 0x24($v0)
  /* 13D5DC 801353DC 3C0B8014 */       lui $t3, %hi(D_ovl27_801396A0)
  /* 13D5E0 801353E0 E4480058 */      swc1 $f8, 0x58($v0)
  /* 13D5E4 801353E4 C7AA006C */      lwc1 $f10, 0x6c($sp)
  /* 13D5E8 801353E8 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 13D5EC 801353EC A4580024 */        sh $t8, 0x24($v0)
  /* 13D5F0 801353F0 37190001 */       ori $t9, $t8, 1
  /* 13D5F4 801353F4 A4590024 */        sh $t9, 0x24($v0)
  /* 13D5F8 801353F8 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13D5FC 801353FC 8FA8007C */        lw $t0, 0x7c($sp)
  /* 13D600 80135400 8D6B96A0 */        lw $t3, %lo(D_ovl27_801396A0)($t3)
  /* 13D604 80135404 8FA40078 */        lw $a0, 0x78($sp)
  /* 13D608 80135408 00084880 */       sll $t1, $t0, 2
  /* 13D60C 8013540C 03A95021 */      addu $t2, $sp, $t1
  /* 13D610 80135410 8D4A0044 */        lw $t2, 0x44($t2)
  /* 13D614 80135414 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13D618 80135418 014B2821 */      addu $a1, $t2, $t3
  /* 13D61C 8013541C 8FAC0080 */        lw $t4, 0x80($sp)
  /* 13D620 80135420 27AE0020 */     addiu $t6, $sp, 0x20
  /* 13D624 80135424 8C45000C */        lw $a1, 0xc($v0)
  /* 13D628 80135428 000C68C0 */       sll $t5, $t4, 3
  /* 13D62C 8013542C 01AE2021 */      addu $a0, $t5, $t6
  /* 13D630 80135430 8C8F0000 */        lw $t7, ($a0)
  /* 13D634 80135434 C4A40058 */      lwc1 $f4, 0x58($a1)
  /* 13D638 80135438 94590024 */       lhu $t9, 0x24($v0)
  /* 13D63C 8013543C 448F8000 */      mtc1 $t7, $f16
  /* 13D640 80135440 27AD0054 */     addiu $t5, $sp, 0x54
  /* 13D644 80135444 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 13D648 80135448 468084A0 */   cvt.s.w $f18, $f16
  /* 13D64C 8013544C 352A0001 */       ori $t2, $t1, 1
  /* 13D650 80135450 46049180 */     add.s $f6, $f18, $f4
  /* 13D654 80135454 E4460058 */      swc1 $f6, 0x58($v0)
  /* 13D658 80135458 8C980004 */        lw $t8, 4($a0)
  /* 13D65C 8013545C C4B0005C */      lwc1 $f16, 0x5c($a1)
  /* 13D660 80135460 A4490024 */        sh $t1, 0x24($v0)
  /* 13D664 80135464 44984000 */      mtc1 $t8, $f8
  /* 13D668 80135468 A44A0024 */        sh $t2, 0x24($v0)
  /* 13D66C 8013546C 468042A0 */   cvt.s.w $f10, $f8
  /* 13D670 80135470 46105480 */     add.s $f18, $f10, $f16
  /* 13D674 80135474 E452005C */      swc1 $f18, 0x5c($v0)
  /* 13D678 80135478 8FAB007C */        lw $t3, 0x7c($sp)
  /* 13D67C 8013547C 000B6080 */       sll $t4, $t3, 2
  /* 13D680 80135480 018B6023 */      subu $t4, $t4, $t3
  /* 13D684 80135484 000C6040 */       sll $t4, $t4, 1
  /* 13D688 80135488 018D1821 */      addu $v1, $t4, $t5
  /* 13D68C 8013548C 906E0000 */       lbu $t6, ($v1)
  /* 13D690 80135490 A04E0028 */        sb $t6, 0x28($v0)
  /* 13D694 80135494 906F0001 */       lbu $t7, 1($v1)
  /* 13D698 80135498 A04F0029 */        sb $t7, 0x29($v0)
  /* 13D69C 8013549C 90780002 */       lbu $t8, 2($v1)
  /* 13D6A0 801354A0 A058002A */        sb $t8, 0x2a($v0)
  /* 13D6A4 801354A4 90790003 */       lbu $t9, 3($v1)
  /* 13D6A8 801354A8 A0590060 */        sb $t9, 0x60($v0)
  /* 13D6AC 801354AC 90680004 */       lbu $t0, 4($v1)
  /* 13D6B0 801354B0 A0480061 */        sb $t0, 0x61($v0)
  /* 13D6B4 801354B4 90690005 */       lbu $t1, 5($v1)
  /* 13D6B8 801354B8 A0490062 */        sb $t1, 0x62($v0)
  /* 13D6BC 801354BC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13D6C0 801354C0 27BD0078 */     addiu $sp, $sp, 0x78
  /* 13D6C4 801354C4 03E00008 */        jr $ra
  /* 13D6C8 801354C8 00000000 */       nop

glabel mn1PCheckPickerRightArrowPress
  /* 13D6CC 801354CC 8C820074 */        lw $v0, 0x74($a0)
  /* 13D6D0 801354D0 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13D6D4 801354D4 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 13D6D8 801354D8 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 13D6DC 801354DC 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 13D6E0 801354E0 44814000 */      mtc1 $at, $f8 # 12.0 to cop1
  /* 13D6E4 801354E4 46062000 */     add.s $f0, $f4, $f6
  /* 13D6E8 801354E8 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 13D6EC 801354EC 4608003C */    c.lt.s $f0, $f8
  /* 13D6F0 801354F0 00000000 */       nop
  /* 13D6F4 801354F4 45010007 */      bc1t .L80135514
  /* 13D6F8 801354F8 00000000 */       nop
  /* 13D6FC 801354FC 44815000 */      mtc1 $at, $f10 # 35.0 to cop1
  /* 13D700 80135500 00001825 */        or $v1, $zero, $zero
  /* 13D704 80135504 4600503C */    c.lt.s $f10, $f0
  /* 13D708 80135508 00000000 */       nop
  /* 13D70C 8013550C 45000003 */      bc1f .L8013551C
  /* 13D710 80135510 00000000 */       nop
  .L80135514:
  /* 13D714 80135514 10000001 */         b .L8013551C
  /* 13D718 80135518 24030001 */     addiu $v1, $zero, 1
  .L8013551C:
  /* 13D71C 8013551C 10600003 */      beqz $v1, .L8013552C
  /* 13D720 80135520 3C0141A0 */       lui $at, 0x41a0
  /* 13D724 80135524 03E00008 */        jr $ra
  /* 13D728 80135528 00001025 */        or $v0, $zero, $zero

  .L8013552C:
  /* 13D72C 8013552C C4500058 */      lwc1 $f16, 0x58($v0)
  /* 13D730 80135530 44819000 */      mtc1 $at, $f18
  /* 13D734 80135534 3C014352 */       lui $at, (0x43520000 >> 16) # 210.0
  /* 13D738 80135538 44812000 */      mtc1 $at, $f4 # 210.0 to cop1
  /* 13D73C 8013553C 46128000 */     add.s $f0, $f16, $f18
  /* 13D740 80135540 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13D744 80135544 00001825 */        or $v1, $zero, $zero
  /* 13D748 80135548 00001025 */        or $v0, $zero, $zero
  /* 13D74C 8013554C 4600203E */    c.le.s $f4, $f0
  /* 13D750 80135550 00000000 */       nop
  /* 13D754 80135554 45000009 */      bc1f .L8013557C
  /* 13D758 80135558 00000000 */       nop
  /* 13D75C 8013555C 44813000 */      mtc1 $at, $f6 # 230.0 to cop1
  /* 13D760 80135560 00000000 */       nop
  /* 13D764 80135564 4606003E */    c.le.s $f0, $f6
  /* 13D768 80135568 00000000 */       nop
  /* 13D76C 8013556C 45000003 */      bc1f .L8013557C
  /* 13D770 80135570 00000000 */       nop
  /* 13D774 80135574 10000001 */         b .L8013557C
  /* 13D778 80135578 24030001 */     addiu $v1, $zero, 1
  .L8013557C:
  /* 13D77C 8013557C 10600003 */      beqz $v1, .L8013558C
  /* 13D780 80135580 00000000 */       nop
  /* 13D784 80135584 03E00008 */        jr $ra
  /* 13D788 80135588 24020001 */     addiu $v0, $zero, 1

  .L8013558C:
  /* 13D78C 8013558C 03E00008 */        jr $ra
  /* 13D790 80135590 00000000 */       nop

glabel mn1PCheckPickerLeftArrowPress
  /* 13D794 80135594 8C820074 */        lw $v0, 0x74($a0)
  /* 13D798 80135598 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13D79C 8013559C 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 13D7A0 801355A0 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 13D7A4 801355A4 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 13D7A8 801355A8 44814000 */      mtc1 $at, $f8 # 12.0 to cop1
  /* 13D7AC 801355AC 46062000 */     add.s $f0, $f4, $f6
  /* 13D7B0 801355B0 3C01420C */       lui $at, (0x420C0000 >> 16) # 35.0
  /* 13D7B4 801355B4 4608003C */    c.lt.s $f0, $f8
  /* 13D7B8 801355B8 00000000 */       nop
  /* 13D7BC 801355BC 45010007 */      bc1t .L801355DC
  /* 13D7C0 801355C0 00000000 */       nop
  /* 13D7C4 801355C4 44815000 */      mtc1 $at, $f10 # 35.0 to cop1
  /* 13D7C8 801355C8 00001825 */        or $v1, $zero, $zero
  /* 13D7CC 801355CC 4600503C */    c.lt.s $f10, $f0
  /* 13D7D0 801355D0 00000000 */       nop
  /* 13D7D4 801355D4 45000003 */      bc1f .L801355E4
  /* 13D7D8 801355D8 00000000 */       nop
  .L801355DC:
  /* 13D7DC 801355DC 10000001 */         b .L801355E4
  /* 13D7E0 801355E0 24030001 */     addiu $v1, $zero, 1
  .L801355E4:
  /* 13D7E4 801355E4 10600003 */      beqz $v1, .L801355F4
  /* 13D7E8 801355E8 3C0141A0 */       lui $at, 0x41a0
  /* 13D7EC 801355EC 03E00008 */        jr $ra
  /* 13D7F0 801355F0 00001025 */        or $v0, $zero, $zero

  .L801355F4:
  /* 13D7F4 801355F4 C4500058 */      lwc1 $f16, 0x58($v0)
  /* 13D7F8 801355F8 44819000 */      mtc1 $at, $f18
  /* 13D7FC 801355FC 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 13D800 80135600 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 13D804 80135604 46128000 */     add.s $f0, $f16, $f18
  /* 13D808 80135608 3C014320 */       lui $at, (0x43200000 >> 16) # 160.0
  /* 13D80C 8013560C 00001825 */        or $v1, $zero, $zero
  /* 13D810 80135610 00001025 */        or $v0, $zero, $zero
  /* 13D814 80135614 4600203E */    c.le.s $f4, $f0
  /* 13D818 80135618 00000000 */       nop
  /* 13D81C 8013561C 45000009 */      bc1f .L80135644
  /* 13D820 80135620 00000000 */       nop
  /* 13D824 80135624 44813000 */      mtc1 $at, $f6 # 160.0 to cop1
  /* 13D828 80135628 00000000 */       nop
  /* 13D82C 8013562C 4606003E */    c.le.s $f0, $f6
  /* 13D830 80135630 00000000 */       nop
  /* 13D834 80135634 45000003 */      bc1f .L80135644
  /* 13D838 80135638 00000000 */       nop
  /* 13D83C 8013563C 10000001 */         b .L80135644
  /* 13D840 80135640 24030001 */     addiu $v1, $zero, 1
  .L80135644:
  /* 13D844 80135644 10600003 */      beqz $v1, .L80135654
  /* 13D848 80135648 00000000 */       nop
  /* 13D84C 8013564C 03E00008 */        jr $ra
  /* 13D850 80135650 24020001 */     addiu $v0, $zero, 1

  .L80135654:
  /* 13D854 80135654 03E00008 */        jr $ra
  /* 13D858 80135658 00000000 */       nop

glabel mn1PCheckBackButtonPress
  /* 13D85C 8013565C 8C820074 */        lw $v0, 0x74($a0)
  /* 13D860 80135660 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13D864 80135664 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 13D868 80135668 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 13D86C 8013566C 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 13D870 80135670 44814000 */      mtc1 $at, $f8 # 13.0 to cop1
  /* 13D874 80135674 46062000 */     add.s $f0, $f4, $f6
  /* 13D878 80135678 3C014208 */       lui $at, (0x42080000 >> 16) # 34.0
  /* 13D87C 8013567C 4608003C */    c.lt.s $f0, $f8
  /* 13D880 80135680 00000000 */       nop
  /* 13D884 80135684 45010007 */      bc1t .L801356A4
  /* 13D888 80135688 00000000 */       nop
  /* 13D88C 8013568C 44815000 */      mtc1 $at, $f10 # 34.0 to cop1
  /* 13D890 80135690 00001825 */        or $v1, $zero, $zero
  /* 13D894 80135694 4600503C */    c.lt.s $f10, $f0
  /* 13D898 80135698 00000000 */       nop
  /* 13D89C 8013569C 45000003 */      bc1f .L801356AC
  /* 13D8A0 801356A0 00000000 */       nop
  .L801356A4:
  /* 13D8A4 801356A4 10000001 */         b .L801356AC
  /* 13D8A8 801356A8 24030001 */     addiu $v1, $zero, 1
  .L801356AC:
  /* 13D8AC 801356AC 10600003 */      beqz $v1, .L801356BC
  /* 13D8B0 801356B0 3C0141A0 */       lui $at, 0x41a0
  /* 13D8B4 801356B4 03E00008 */        jr $ra
  /* 13D8B8 801356B8 00001025 */        or $v0, $zero, $zero

  .L801356BC:
  /* 13D8BC 801356BC C4500058 */      lwc1 $f16, 0x58($v0)
  /* 13D8C0 801356C0 44819000 */      mtc1 $at, $f18
  /* 13D8C4 801356C4 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 13D8C8 801356C8 44812000 */      mtc1 $at, $f4 # 244.0 to cop1
  /* 13D8CC 801356CC 46128000 */     add.s $f0, $f16, $f18
  /* 13D8D0 801356D0 3C014392 */       lui $at, (0x43920000 >> 16) # 292.0
  /* 13D8D4 801356D4 00001825 */        or $v1, $zero, $zero
  /* 13D8D8 801356D8 00001025 */        or $v0, $zero, $zero
  /* 13D8DC 801356DC 4600203E */    c.le.s $f4, $f0
  /* 13D8E0 801356E0 00000000 */       nop
  /* 13D8E4 801356E4 45000009 */      bc1f .L8013570C
  /* 13D8E8 801356E8 00000000 */       nop
  /* 13D8EC 801356EC 44813000 */      mtc1 $at, $f6 # 292.0 to cop1
  /* 13D8F0 801356F0 00000000 */       nop
  /* 13D8F4 801356F4 4606003E */    c.le.s $f0, $f6
  /* 13D8F8 801356F8 00000000 */       nop
  /* 13D8FC 801356FC 45000003 */      bc1f .L8013570C
  /* 13D900 80135700 00000000 */       nop
  /* 13D904 80135704 10000001 */         b .L8013570C
  /* 13D908 80135708 24030001 */     addiu $v1, $zero, 1
  .L8013570C:
  /* 13D90C 8013570C 10600003 */      beqz $v1, .L8013571C
  /* 13D910 80135710 00000000 */       nop
  /* 13D914 80135714 03E00008 */        jr $ra
  /* 13D918 80135718 24020001 */     addiu $v0, $zero, 1

  .L8013571C:
  /* 13D91C 8013571C 03E00008 */        jr $ra
  /* 13D920 80135720 00000000 */       nop

glabel mn1PCheckTokenPickup
  /* 13D924 80135724 AFA50004 */        sw $a1, 4($sp)
  /* 13D928 80135728 AFA60008 */        sw $a2, 8($sp)
  /* 13D92C 8013572C 8C820074 */        lw $v0, 0x74($a0)
  /* 13D930 80135730 3C0E8014 */       lui $t6, %hi(D_ovl27_80138EEC)
  /* 13D934 80135734 8DCE8EEC */        lw $t6, %lo(D_ovl27_80138EEC)($t6)
  /* 13D938 80135738 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 13D93C 8013573C 44813000 */      mtc1 $at, $f6 # 25.0 to cop1
  /* 13D940 80135740 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13D944 80135744 8DC30074 */        lw $v1, 0x74($t6)
  /* 13D948 80135748 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 13D94C 8013574C 46062000 */     add.s $f0, $f4, $f6
  /* 13D950 80135750 C4620058 */      lwc1 $f2, 0x58($v1)
  /* 13D954 80135754 00002025 */        or $a0, $zero, $zero
  /* 13D958 80135758 4600103E */    c.le.s $f2, $f0
  /* 13D95C 8013575C 00000000 */       nop
  /* 13D960 80135760 4500000A */      bc1f .L8013578C
  /* 13D964 80135764 00000000 */       nop
  /* 13D968 80135768 44814000 */      mtc1 $at, $f8 # 26.0 to cop1
  /* 13D96C 8013576C 00000000 */       nop
  /* 13D970 80135770 46081280 */     add.s $f10, $f2, $f8
  /* 13D974 80135774 460A003E */    c.le.s $f0, $f10
  /* 13D978 80135778 00000000 */       nop
  /* 13D97C 8013577C 45000003 */      bc1f .L8013578C
  /* 13D980 80135780 00000000 */       nop
  /* 13D984 80135784 10000001 */         b .L8013578C
  /* 13D988 80135788 24040001 */     addiu $a0, $zero, 1
  .L8013578C:
  /* 13D98C 8013578C 10800018 */      beqz $a0, .L801357F0
  /* 13D990 80135790 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13D994 80135794 C450005C */      lwc1 $f16, 0x5c($v0)
  /* 13D998 80135798 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 13D99C 8013579C C462005C */      lwc1 $f2, 0x5c($v1)
  /* 13D9A0 801357A0 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 13D9A4 801357A4 46128000 */     add.s $f0, $f16, $f18
  /* 13D9A8 801357A8 00002025 */        or $a0, $zero, $zero
  /* 13D9AC 801357AC 4600103E */    c.le.s $f2, $f0
  /* 13D9B0 801357B0 00000000 */       nop
  /* 13D9B4 801357B4 4500000A */      bc1f .L801357E0
  /* 13D9B8 801357B8 00000000 */       nop
  /* 13D9BC 801357BC 44812000 */      mtc1 $at, $f4 # 24.0 to cop1
  /* 13D9C0 801357C0 00000000 */       nop
  /* 13D9C4 801357C4 46041180 */     add.s $f6, $f2, $f4
  /* 13D9C8 801357C8 4606003E */    c.le.s $f0, $f6
  /* 13D9CC 801357CC 00000000 */       nop
  /* 13D9D0 801357D0 45000003 */      bc1f .L801357E0
  /* 13D9D4 801357D4 00000000 */       nop
  /* 13D9D8 801357D8 10000001 */         b .L801357E0
  /* 13D9DC 801357DC 24040001 */     addiu $a0, $zero, 1
  .L801357E0:
  /* 13D9E0 801357E0 50800004 */      beql $a0, $zero, .L801357F4
  /* 13D9E4 801357E4 00001025 */        or $v0, $zero, $zero
  /* 13D9E8 801357E8 03E00008 */        jr $ra
  /* 13D9EC 801357EC 24020001 */     addiu $v0, $zero, 1

  .L801357F0:
  /* 13D9F0 801357F0 00001025 */        or $v0, $zero, $zero
  .L801357F4:
  /* 13D9F4 801357F4 03E00008 */        jr $ra
  /* 13D9F8 801357F8 00000000 */       nop

  /* 13D9FC 801357FC 03E00008 */        jr $ra
  /* 13DA00 80135800 00000000 */       nop

glabel mn1PSyncFighterDisplay
  /* 13DA04 80135804 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13DA08 80135808 AFB00018 */        sw $s0, 0x18($sp)
  /* 13DA0C 8013580C 3C108014 */       lui $s0, %hi(gMN1PPanel)
  /* 13DA10 80135810 26108EE8 */     addiu $s0, $s0, %lo(gMN1PPanel)
  /* 13DA14 80135814 8E0E0020 */        lw $t6, 0x20($s0) # gMN1PPanel + 32
  /* 13DA18 80135818 2401001C */     addiu $at, $zero, 0x1c
  /* 13DA1C 8013581C AFBF001C */        sw $ra, 0x1c($sp)
  /* 13DA20 80135820 AFA40020 */        sw $a0, 0x20($sp)
  /* 13DA24 80135824 15C1000E */       bne $t6, $at, .L80135860
  /* 13DA28 80135828 00001025 */        or $v0, $zero, $zero
  /* 13DA2C 8013582C 8E0F002C */        lw $t7, 0x2c($s0) # gMN1PPanel + 44
  /* 13DA30 80135830 15E0000B */      bnez $t7, .L80135860
  /* 13DA34 80135834 00000000 */       nop
  /* 13DA38 80135838 8E190008 */        lw $t9, 8($s0) # gMN1PPanel + 8
  /* 13DA3C 8013583C 24180001 */     addiu $t8, $zero, 1
  /* 13DA40 80135840 3C048014 */       lui $a0, %hi(gMN1PStockValue)
  /* 13DA44 80135844 AF38007C */        sw $t8, 0x7c($t9)
  /* 13DA48 80135848 8E050020 */        lw $a1, 0x20($s0) # gMN1PPanel + 32
  /* 13DA4C 8013584C 0C04D067 */       jal mn1PDrawStock
  /* 13DA50 80135850 8C848FB8 */        lw $a0, %lo(gMN1PStockValue)($a0)
  /* 13DA54 80135854 0C04D2CF */       jal mn1PDrawHighscoreAndBonuses
  /* 13DA58 80135858 00000000 */       nop
  /* 13DA5C 8013585C 24020001 */     addiu $v0, $zero, 1
  .L80135860:
  /* 13DA60 80135860 14400011 */      bnez $v0, .L801358A8
  /* 13DA64 80135864 00002825 */        or $a1, $zero, $zero
  /* 13DA68 80135868 0C04D3B0 */       jal mn1PGetAvailableCostume
  /* 13DA6C 8013586C 8E040020 */        lw $a0, 0x20($s0) # gMN1PPanel + 32
  /* 13DA70 80135870 8E040008 */        lw $a0, 8($s0) # gMN1PPanel + 8
  /* 13DA74 80135874 8FA50020 */        lw $a1, 0x20($sp)
  /* 13DA78 80135878 8E060020 */        lw $a2, 0x20($s0) # gMN1PPanel + 32
  /* 13DA7C 8013587C 0C04D418 */       jal mn1PSpawnFighter
  /* 13DA80 80135880 00403825 */        or $a3, $v0, $zero
  /* 13DA84 80135884 3C048014 */       lui $a0, %hi(gMN1PStockValue)
  /* 13DA88 80135888 8C848FB8 */        lw $a0, %lo(gMN1PStockValue)($a0)
  /* 13DA8C 8013588C 0C04D067 */       jal mn1PDrawStock
  /* 13DA90 80135890 8E050020 */        lw $a1, 0x20($s0) # gMN1PPanel + 32
  /* 13DA94 80135894 0C04D2CF */       jal mn1PDrawHighscoreAndBonuses
  /* 13DA98 80135898 00000000 */       nop
  /* 13DA9C 8013589C 8E080008 */        lw $t0, 8($s0) # gMN1PPanel + 8
  /* 13DAA0 801358A0 AD00007C */        sw $zero, 0x7c($t0)
  /* 13DAA4 801358A4 AE00005C */        sw $zero, 0x5c($s0) # gMN1PPanel + 92
  .L801358A8:
  /* 13DAA8 801358A8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13DAAC 801358AC 8FB00018 */        lw $s0, 0x18($sp)
  /* 13DAB0 801358B0 27BD0020 */     addiu $sp, $sp, 0x20
  /* 13DAB4 801358B4 03E00008 */        jr $ra
  /* 13DAB8 801358B8 00000000 */       nop

  /* 13DABC 801358BC 03E00008 */        jr $ra
  /* 13DAC0 801358C0 00000000 */       nop

glabel mn1PSyncNameAndLogo
  /* 13DAC4 801358C4 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 13DAC8 801358C8 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 13DACC 801358CC 8C4E0020 */        lw $t6, 0x20($v0) # gMN1PPanel + 32
  /* 13DAD0 801358D0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13DAD4 801358D4 2401001C */     addiu $at, $zero, 0x1c
  /* 13DAD8 801358D8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DADC 801358DC 15C10008 */       bne $t6, $at, .L80135900
  /* 13DAE0 801358E0 00802825 */        or $a1, $a0, $zero
  /* 13DAE4 801358E4 8C4F002C */        lw $t7, 0x2c($v0) # gMN1PPanel + 44
  /* 13DAE8 801358E8 55E00006 */      bnel $t7, $zero, .L80135904
  /* 13DAEC 801358EC 8C48000C */        lw $t0, 0xc($v0) # gMN1PPanel + 12
  /* 13DAF0 801358F0 8C59000C */        lw $t9, 0xc($v0) # gMN1PPanel + 12
  /* 13DAF4 801358F4 24180001 */     addiu $t8, $zero, 1
  /* 13DAF8 801358F8 10000006 */         b .L80135914
  /* 13DAFC 801358FC AF38007C */        sw $t8, 0x7c($t9)
  .L80135900:
  /* 13DB00 80135900 8C48000C */        lw $t0, 0xc($v0) # gMN1PPanel + 12
  .L80135904:
  /* 13DB04 80135904 AD00007C */        sw $zero, 0x7c($t0)
  /* 13DB08 80135908 8C460020 */        lw $a2, 0x20($v0) # gMN1PPanel + 32
  /* 13DB0C 8013590C 0C04CB68 */       jal mn1PSetNameAndLogo
  /* 13DB10 80135910 8C44000C */        lw $a0, 0xc($v0) # gMN1PPanel + 12
  .L80135914:
  /* 13DB14 80135914 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DB18 80135918 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13DB1C 8013591C 03E00008 */        jr $ra
  /* 13DB20 80135920 00000000 */       nop

glabel mn1PRemoveWhiteSquare
  /* 13DB24 80135924 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13DB28 80135928 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 13DB2C 8013592C 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 13DB30 80135930 AFA40018 */        sw $a0, 0x18($sp)
  /* 13DB34 80135934 8C440018 */        lw $a0, 0x18($v0) # gMN1PPanel + 24
  /* 13DB38 80135938 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DB3C 8013593C 50800004 */      beql $a0, $zero, .L80135950
  /* 13DB40 80135940 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DB44 80135944 0C0026A1 */       jal omEjectGObj
  /* 13DB48 80135948 AC400018 */        sw $zero, 0x18($v0) # gMN1PPanel + 24
  /* 13DB4C 8013594C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135950:
  /* 13DB50 80135950 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13DB54 80135954 03E00008 */        jr $ra
  /* 13DB58 80135958 00000000 */       nop

glabel mn1PFlashWhiteSquare
  /* 13DB5C 8013595C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13DB60 80135960 AFB30020 */        sw $s3, 0x20($sp)
  /* 13DB64 80135964 AFB2001C */        sw $s2, 0x1c($sp)
  /* 13DB68 80135968 AFB10018 */        sw $s1, 0x18($sp)
  /* 13DB6C 8013596C AFB00014 */        sw $s0, 0x14($sp)
  /* 13DB70 80135970 00808825 */        or $s1, $a0, $zero
  /* 13DB74 80135974 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13DB78 80135978 24120010 */     addiu $s2, $zero, 0x10
  /* 13DB7C 8013597C 24100001 */     addiu $s0, $zero, 1
  /* 13DB80 80135980 24130001 */     addiu $s3, $zero, 1
  /* 13DB84 80135984 2652FFFF */     addiu $s2, $s2, -1
  .L80135988:
  /* 13DB88 80135988 16400003 */      bnez $s2, .L80135998
  /* 13DB8C 8013598C 2610FFFF */     addiu $s0, $s0, -1
  /* 13DB90 80135990 0C04D649 */       jal mn1PRemoveWhiteSquare
  /* 13DB94 80135994 8E240084 */        lw $a0, 0x84($s1)
  .L80135998:
  /* 13DB98 80135998 16000008 */      bnez $s0, .L801359BC
  /* 13DB9C 8013599C 00000000 */       nop
  /* 13DBA0 801359A0 8E2E007C */        lw $t6, 0x7c($s1)
  /* 13DBA4 801359A4 24100001 */     addiu $s0, $zero, 1
  /* 13DBA8 801359A8 566E0004 */      bnel $s3, $t6, .L801359BC
  /* 13DBAC 801359AC AE33007C */        sw $s3, 0x7c($s1)
  /* 13DBB0 801359B0 10000002 */         b .L801359BC
  /* 13DBB4 801359B4 AE20007C */        sw $zero, 0x7c($s1)
  /* 13DBB8 801359B8 AE33007C */        sw $s3, 0x7c($s1)
  .L801359BC:
  /* 13DBBC 801359BC 0C002C7A */       jal gsStopCurrentProcess
  /* 13DBC0 801359C0 24040001 */     addiu $a0, $zero, 1
  /* 13DBC4 801359C4 1000FFF0 */         b .L80135988
  /* 13DBC8 801359C8 2652FFFF */     addiu $s2, $s2, -1
  /* 13DBCC 801359CC 00000000 */       nop
  /* 13DBD0 801359D0 00000000 */       nop
  /* 13DBD4 801359D4 00000000 */       nop
  /* 13DBD8 801359D8 00000000 */       nop
  /* 13DBDC 801359DC 00000000 */       nop
# Maybe start of new file
  /* 13DBE0 801359E0 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13DBE4 801359E4 8FB00014 */        lw $s0, 0x14($sp)
  /* 13DBE8 801359E8 8FB10018 */        lw $s1, 0x18($sp)
  /* 13DBEC 801359EC 8FB2001C */        lw $s2, 0x1c($sp)
  /* 13DBF0 801359F0 8FB30020 */        lw $s3, 0x20($sp)
  /* 13DBF4 801359F4 03E00008 */        jr $ra
  /* 13DBF8 801359F8 27BD0028 */     addiu $sp, $sp, 0x28

glabel mn1PCreateWhiteSquare
  /* 13DBFC 801359FC 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13DC00 80135A00 AFA40030 */        sw $a0, 0x30($sp)
  /* 13DC04 80135A04 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13DC08 80135A08 3C048014 */       lui $a0, %hi(D_ovl27_80138F08)
  /* 13DC0C 80135A0C AFB00020 */        sw $s0, 0x20($sp)
  /* 13DC10 80135A10 0C04C9FB */       jal mn1PGetPortraitId
  /* 13DC14 80135A14 8C848F08 */        lw $a0, %lo(D_ovl27_80138F08)($a0)
  /* 13DC18 80135A18 00408025 */        or $s0, $v0, $zero
  /* 13DC1C 80135A1C 0C04D649 */       jal mn1PRemoveWhiteSquare
  /* 13DC20 80135A20 8FA40030 */        lw $a0, 0x30($sp)
  /* 13DC24 80135A24 00002025 */        or $a0, $zero, $zero
  /* 13DC28 80135A28 00002825 */        or $a1, $zero, $zero
  /* 13DC2C 80135A2C 2406001A */     addiu $a2, $zero, 0x1a
  /* 13DC30 80135A30 0C00265A */       jal omMakeGObjSPAfter
  /* 13DC34 80135A34 3C078000 */       lui $a3, 0x8000
  /* 13DC38 80135A38 3C018014 */       lui $at, %hi(D_ovl27_80138F00)
  /* 13DC3C 80135A3C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13DC40 80135A40 240EFFFF */     addiu $t6, $zero, -1
  /* 13DC44 80135A44 AC228F00 */        sw $v0, %lo(D_ovl27_80138F00)($at)
  /* 13DC48 80135A48 AFA2002C */        sw $v0, 0x2c($sp)
  /* 13DC4C 80135A4C AFAE0010 */        sw $t6, 0x10($sp)
  /* 13DC50 80135A50 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13DC54 80135A54 00402025 */        or $a0, $v0, $zero
  /* 13DC58 80135A58 24060021 */     addiu $a2, $zero, 0x21
  /* 13DC5C 80135A5C 0C00277D */       jal omAddGObjRenderProc
  /* 13DC60 80135A60 3C078000 */       lui $a3, 0x8000
  /* 13DC64 80135A64 8FA4002C */        lw $a0, 0x2c($sp)
  /* 13DC68 80135A68 8FAF0030 */        lw $t7, 0x30($sp)
  /* 13DC6C 80135A6C 3C058013 */       lui $a1, %hi(mn1PFlashWhiteSquare)
  /* 13DC70 80135A70 24A5595C */     addiu $a1, $a1, %lo(mn1PFlashWhiteSquare)
  /* 13DC74 80135A74 00003025 */        or $a2, $zero, $zero
  /* 13DC78 80135A78 24070001 */     addiu $a3, $zero, 1
  /* 13DC7C 80135A7C 0C002062 */       jal omAddGObjCommonProc
  /* 13DC80 80135A80 AC8F0084 */        sw $t7, 0x84($a0)
  /* 13DC84 80135A84 3C188014 */       lui $t8, %hi(D_ovl27_801396B0)
  /* 13DC88 80135A88 8F1896B0 */        lw $t8, %lo(D_ovl27_801396B0)($t8)
  /* 13DC8C 80135A8C 3C190000 */       lui $t9, %hi(D_NF_000006F0)
  /* 13DC90 80135A90 273906F0 */     addiu $t9, $t9, %lo(D_NF_000006F0)
  /* 13DC94 80135A94 8FA4002C */        lw $a0, 0x2c($sp)
  /* 13DC98 80135A98 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13DC9C 80135A9C 03192821 */      addu $a1, $t8, $t9
  /* 13DCA0 80135AA0 2A010006 */      slti $at, $s0, 6
  /* 13DCA4 80135AA4 14200003 */      bnez $at, .L80135AB4
  /* 13DCA8 80135AA8 02001825 */        or $v1, $s0, $zero
  /* 13DCAC 80135AAC 10000001 */         b .L80135AB4
  /* 13DCB0 80135AB0 2603FFFA */     addiu $v1, $s0, -6
  .L80135AB4:
  /* 13DCB4 80135AB4 00034080 */       sll $t0, $v1, 2
  /* 13DCB8 80135AB8 01034023 */      subu $t0, $t0, $v1
  /* 13DCBC 80135ABC 00084080 */       sll $t0, $t0, 2
  /* 13DCC0 80135AC0 01034023 */      subu $t0, $t0, $v1
  /* 13DCC4 80135AC4 00084080 */       sll $t0, $t0, 2
  /* 13DCC8 80135AC8 01034021 */      addu $t0, $t0, $v1
  /* 13DCCC 80135ACC 2509001A */     addiu $t1, $t0, 0x1a
  /* 13DCD0 80135AD0 44892000 */      mtc1 $t1, $f4
  /* 13DCD4 80135AD4 2A010006 */      slti $at, $s0, 6
  /* 13DCD8 80135AD8 00001825 */        or $v1, $zero, $zero
  /* 13DCDC 80135ADC 468021A0 */   cvt.s.w $f6, $f4
  /* 13DCE0 80135AE0 14200003 */      bnez $at, .L80135AF0
  /* 13DCE4 80135AE4 E4460058 */      swc1 $f6, 0x58($v0)
  /* 13DCE8 80135AE8 10000001 */         b .L80135AF0
  /* 13DCEC 80135AEC 24030001 */     addiu $v1, $zero, 1
  .L80135AF0:
  /* 13DCF0 80135AF0 00035080 */       sll $t2, $v1, 2
  /* 13DCF4 80135AF4 01435023 */      subu $t2, $t2, $v1
  /* 13DCF8 80135AF8 000A5080 */       sll $t2, $t2, 2
  /* 13DCFC 80135AFC 01435023 */      subu $t2, $t2, $v1
  /* 13DD00 80135B00 000A5080 */       sll $t2, $t2, 2
  /* 13DD04 80135B04 01435023 */      subu $t2, $t2, $v1
  /* 13DD08 80135B08 254B0025 */     addiu $t3, $t2, 0x25
  /* 13DD0C 80135B0C 448B4000 */      mtc1 $t3, $f8
  /* 13DD10 80135B10 00000000 */       nop
  /* 13DD14 80135B14 468042A0 */   cvt.s.w $f10, $f8
  /* 13DD18 80135B18 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13DD1C 80135B1C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13DD20 80135B20 8FB00020 */        lw $s0, 0x20($sp)
  /* 13DD24 80135B24 27BD0030 */     addiu $sp, $sp, 0x30
  /* 13DD28 80135B28 03E00008 */        jr $ra
  /* 13DD2C 80135B2C 00000000 */       nop

glabel mn1PAnnounceFighter
  /* 13DD30 80135B30 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 13DD34 80135B34 3C0F8014 */       lui $t7, %hi(dMN1PAnnouncerNames)
  /* 13DD38 80135B38 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DD3C 80135B3C AFA40038 */        sw $a0, 0x38($sp)
  /* 13DD40 80135B40 AFA5003C */        sw $a1, 0x3c($sp)
  /* 13DD44 80135B44 25EF8BBC */     addiu $t7, $t7, %lo(dMN1PAnnouncerNames)
  /* 13DD48 80135B48 8DF90000 */        lw $t9, ($t7) # dMN1PAnnouncerNames + 0
  /* 13DD4C 80135B4C 8DF80004 */        lw $t8, 4($t7) # dMN1PAnnouncerNames + 4
  /* 13DD50 80135B50 27AE0020 */     addiu $t6, $sp, 0x20
  /* 13DD54 80135B54 ADD90000 */        sw $t9, ($t6)
  /* 13DD58 80135B58 ADD80004 */        sw $t8, 4($t6)
  /* 13DD5C 80135B5C 8DF8000C */        lw $t8, 0xc($t7) # dMN1PAnnouncerNames + 12
  /* 13DD60 80135B60 8DF90008 */        lw $t9, 8($t7) # dMN1PAnnouncerNames + 8
  /* 13DD64 80135B64 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DD68 80135B68 ADD8000C */        sw $t8, 0xc($t6)
  /* 13DD6C 80135B6C ADD90008 */        sw $t9, 8($t6)
  /* 13DD70 80135B70 8DF90010 */        lw $t9, 0x10($t7) # dMN1PAnnouncerNames + 16
  /* 13DD74 80135B74 8DF80014 */        lw $t8, 0x14($t7) # dMN1PAnnouncerNames + 20
  /* 13DD78 80135B78 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DD7C 80135B7C ADD90010 */        sw $t9, 0x10($t6)
  /* 13DD80 80135B80 ADD80014 */        sw $t8, 0x14($t6)
  /* 13DD84 80135B84 8C640074 */        lw $a0, 0x74($v1) # gMN1PPanel + 116
  /* 13DD88 80135B88 10800009 */      beqz $a0, .L80135BB0
  /* 13DD8C 80135B8C 00000000 */       nop
  /* 13DD90 80135B90 94820026 */       lhu $v0, 0x26($a0)
  /* 13DD94 80135B94 10400006 */      beqz $v0, .L80135BB0
  /* 13DD98 80135B98 00000000 */       nop
  /* 13DD9C 80135B9C 94680078 */       lhu $t0, 0x78($v1) # gMN1PPanel + 120
  /* 13DDA0 80135BA0 15020003 */       bne $t0, $v0, .L80135BB0
  /* 13DDA4 80135BA4 00000000 */       nop
  /* 13DDA8 80135BA8 0C0099CE */       jal func_80026738
  /* 13DDAC 80135BAC 00000000 */       nop
  .L80135BB0:
  /* 13DDB0 80135BB0 0C009A70 */       jal func_800269C0
  /* 13DDB4 80135BB4 24040079 */     addiu $a0, $zero, 0x79
  /* 13DDB8 80135BB8 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DDBC 80135BBC 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DDC0 80135BC0 8C690020 */        lw $t1, 0x20($v1) # gMN1PPanel + 32
  /* 13DDC4 80135BC4 00095040 */       sll $t2, $t1, 1
  /* 13DDC8 80135BC8 03AA2021 */      addu $a0, $sp, $t2
  /* 13DDCC 80135BCC 0C009A70 */       jal func_800269C0
  /* 13DDD0 80135BD0 94840020 */       lhu $a0, 0x20($a0)
  /* 13DDD4 80135BD4 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DDD8 80135BD8 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DDDC 80135BDC 10400003 */      beqz $v0, .L80135BEC
  /* 13DDE0 80135BE0 AC620074 */        sw $v0, 0x74($v1) # gMN1PPanel + 116
  /* 13DDE4 80135BE4 944B0026 */       lhu $t3, 0x26($v0)
  /* 13DDE8 80135BE8 A46B0078 */        sh $t3, 0x78($v1) # gMN1PPanel + 120
  .L80135BEC:
  /* 13DDEC 80135BEC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DDF0 80135BF0 27BD0038 */     addiu $sp, $sp, 0x38
  /* 13DDF4 80135BF4 03E00008 */        jr $ra
  /* 13DDF8 80135BF8 00000000 */       nop

  /* 13DDFC 80135BFC 03E00008 */        jr $ra
  /* 13DE00 80135C00 00000000 */       nop

glabel mn1PSelectChar
  /* 13DE04 80135C04 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DE08 80135C08 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DE0C 80135C0C 8C6E0028 */        lw $t6, 0x28($v1) # gMN1PPanel + 40
  /* 13DE10 80135C10 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13DE14 80135C14 AFA40018 */        sw $a0, 0x18($sp)
  /* 13DE18 80135C18 24010001 */     addiu $at, $zero, 1
  /* 13DE1C 80135C1C 00A02025 */        or $a0, $a1, $zero
  /* 13DE20 80135C20 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DE24 80135C24 11C10003 */       beq $t6, $at, .L80135C34
  /* 13DE28 80135C28 AFA60020 */        sw $a2, 0x20($sp)
  /* 13DE2C 80135C2C 10000012 */         b .L80135C78
  /* 13DE30 80135C30 00001025 */        or $v0, $zero, $zero
  .L80135C34:
  /* 13DE34 80135C34 8C6F0020 */        lw $t7, 0x20($v1) # gMN1PPanel + 32
  /* 13DE38 80135C38 2401001C */     addiu $at, $zero, 0x1c
  /* 13DE3C 80135C3C 11E1000B */       beq $t7, $at, .L80135C6C
  /* 13DE40 80135C40 00000000 */       nop
  /* 13DE44 80135C44 0C04C8E1 */       jal mn1PSelectCharWithToken
  /* 13DE48 80135C48 00E02825 */        or $a1, $a3, $zero
  /* 13DE4C 80135C4C 3C188014 */       lui $t8, %hi(gMN1PFramesElapsed)
  /* 13DE50 80135C50 8F188F74 */        lw $t8, %lo(gMN1PFramesElapsed)($t8)
  /* 13DE54 80135C54 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DE58 80135C58 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DE5C 80135C5C 2719001E */     addiu $t9, $t8, 0x1e
  /* 13DE60 80135C60 AC790034 */        sw $t9, 0x34($v1) # gMN1PPanel + 52
  /* 13DE64 80135C64 10000004 */         b .L80135C78
  /* 13DE68 80135C68 24020001 */     addiu $v0, $zero, 1
  .L80135C6C:
  /* 13DE6C 80135C6C 0C009A70 */       jal func_800269C0
  /* 13DE70 80135C70 240400A5 */     addiu $a0, $zero, 0xa5
  /* 13DE74 80135C74 00001025 */        or $v0, $zero, $zero
  .L80135C78:
  /* 13DE78 80135C78 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DE7C 80135C7C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13DE80 80135C80 03E00008 */        jr $ra
  /* 13DE84 80135C84 00000000 */       nop

glabel mn1PReorderCursorsOnPickup
  /* 13DE88 80135C88 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13DE8C 80135C8C 3C0E8014 */       lui $t6, %hi(dMN1PTokenPickupDisplayOrders)
  /* 13DE90 80135C90 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DE94 80135C94 AFA5002C */        sw $a1, 0x2c($sp)
  /* 13DE98 80135C98 25CE8BD4 */     addiu $t6, $t6, %lo(dMN1PTokenPickupDisplayOrders)
  /* 13DE9C 80135C9C 8DD80000 */        lw $t8, ($t6) # dMN1PTokenPickupDisplayOrders + 0
  /* 13DEA0 80135CA0 27A20018 */     addiu $v0, $sp, 0x18
  /* 13DEA4 80135CA4 00803825 */        or $a3, $a0, $zero
  /* 13DEA8 80135CA8 AC580000 */        sw $t8, ($v0)
  /* 13DEAC 80135CAC 8DCF0004 */        lw $t7, 4($t6) # dMN1PTokenPickupDisplayOrders + 4
  /* 13DEB0 80135CB0 0007C880 */       sll $t9, $a3, 2
  /* 13DEB4 80135CB4 00594021 */      addu $t0, $v0, $t9
  /* 13DEB8 80135CB8 AC4F0004 */        sw $t7, 4($v0)
  /* 13DEBC 80135CBC 8DD80008 */        lw $t8, 8($t6) # dMN1PTokenPickupDisplayOrders + 8
  /* 13DEC0 80135CC0 3C048014 */       lui $a0, %hi(D_ovl27_80138EEC)
  /* 13DEC4 80135CC4 2405001E */     addiu $a1, $zero, 0x1e
  /* 13DEC8 80135CC8 AC580008 */        sw $t8, 8($v0)
  /* 13DECC 80135CCC 8DCF000C */        lw $t7, 0xc($t6) # dMN1PTokenPickupDisplayOrders + 12
  /* 13DED0 80135CD0 AC4F000C */        sw $t7, 0xc($v0)
  /* 13DED4 80135CD4 8D060000 */        lw $a2, ($t0)
  /* 13DED8 80135CD8 8C848EEC */        lw $a0, %lo(D_ovl27_80138EEC)($a0)
  /* 13DEDC 80135CDC 0C002834 */       jal omMoveGObjDL
  /* 13DEE0 80135CE0 24C60001 */     addiu $a2, $a2, 1
  /* 13DEE4 80135CE4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DEE8 80135CE8 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13DEEC 80135CEC 03E00008 */        jr $ra
  /* 13DEF0 80135CF0 00000000 */       nop

glabel mn1PReorderCursorsOnPlacement
  /* 13DEF4 80135CF4 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13DEF8 80135CF8 3C0E8014 */       lui $t6, %hi(dMN1PTokenPlaceUnheldDisplayOrders)
  /* 13DEFC 80135CFC AFBF0014 */        sw $ra, 0x14($sp)
  /* 13DF00 80135D00 25CE8BE4 */     addiu $t6, $t6, %lo(dMN1PTokenPlaceUnheldDisplayOrders)
  /* 13DF04 80135D04 8DD80000 */        lw $t8, ($t6) # dMN1PTokenPlaceUnheldDisplayOrders + 0
  /* 13DF08 80135D08 27A20018 */     addiu $v0, $sp, 0x18
  /* 13DF0C 80135D0C 00803825 */        or $a3, $a0, $zero
  /* 13DF10 80135D10 AC580000 */        sw $t8, ($v0)
  /* 13DF14 80135D14 8DCF0004 */        lw $t7, 4($t6) # dMN1PTokenPlaceUnheldDisplayOrders + 4
  /* 13DF18 80135D18 0007C880 */       sll $t9, $a3, 2
  /* 13DF1C 80135D1C 00594021 */      addu $t0, $v0, $t9
  /* 13DF20 80135D20 AC4F0004 */        sw $t7, 4($v0)
  /* 13DF24 80135D24 8DD80008 */        lw $t8, 8($t6) # dMN1PTokenPlaceUnheldDisplayOrders + 8
  /* 13DF28 80135D28 3C048014 */       lui $a0, %hi(D_ovl27_80138EEC)
  /* 13DF2C 80135D2C 2405001F */     addiu $a1, $zero, 0x1f
  /* 13DF30 80135D30 AC580008 */        sw $t8, 8($v0)
  /* 13DF34 80135D34 8DCF000C */        lw $t7, 0xc($t6) # dMN1PTokenPlaceUnheldDisplayOrders + 12
  /* 13DF38 80135D38 AC4F000C */        sw $t7, 0xc($v0)
  /* 13DF3C 80135D3C 8D060000 */        lw $a2, ($t0)
  /* 13DF40 80135D40 0C002834 */       jal omMoveGObjDL
  /* 13DF44 80135D44 8C848EEC */        lw $a0, %lo(D_ovl27_80138EEC)($a0)
  /* 13DF48 80135D48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13DF4C 80135D4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13DF50 80135D50 03E00008 */        jr $ra
  /* 13DF54 80135D54 00000000 */       nop

glabel mn1PSetCursorCoordinatesFromToken
  /* 13DF58 80135D58 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13DF5C 80135D5C 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13DF60 80135D60 8C620004 */        lw $v0, 4($v1) # gMN1PPanel + 4
  /* 13DF64 80135D64 AFA40000 */        sw $a0, ($sp)
  /* 13DF68 80135D68 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 13DF6C 80135D6C 8C4E0074 */        lw $t6, 0x74($v0)
  /* 13DF70 80135D70 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 13DF74 80135D74 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 13DF78 80135D78 C5C40058 */      lwc1 $f4, 0x58($t6)
  /* 13DF7C 80135D7C 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 13DF80 80135D80 46062201 */     sub.s $f8, $f4, $f6
  /* 13DF84 80135D84 E4680068 */      swc1 $f8, 0x68($v1) # gMN1PPanel + 104
  /* 13DF88 80135D88 8C4F0074 */        lw $t7, 0x74($v0)
  /* 13DF8C 80135D8C C5EA005C */      lwc1 $f10, 0x5c($t7)
  /* 13DF90 80135D90 46105481 */     sub.s $f18, $f10, $f16
  /* 13DF94 80135D94 03E00008 */        jr $ra
  /* 13DF98 80135D98 E472006C */      swc1 $f18, 0x6c($v1) # gMN1PPanel + 108

glabel mn1PHandleCursorPickup
  /* 13DF9C 80135D9C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13DFA0 80135DA0 AFB00014 */        sw $s0, 0x14($sp)
  /* 13DFA4 80135DA4 3C108014 */       lui $s0, %hi(gMN1PPanel)
  /* 13DFA8 80135DA8 26108EE8 */     addiu $s0, $s0, %lo(gMN1PPanel)
  /* 13DFAC 80135DAC AFBF001C */        sw $ra, 0x1c($sp)
  /* 13DFB0 80135DB0 AFB10018 */        sw $s1, 0x18($sp)
  /* 13DFB4 80135DB4 240E0001 */     addiu $t6, $zero, 1
  /* 13DFB8 80135DB8 00808825 */        or $s1, $a0, $zero
  /* 13DFBC 80135DBC AE040050 */        sw $a0, 0x50($s0) # gMN1PPanel + 80
  /* 13DFC0 80135DC0 AE00002C */        sw $zero, 0x2c($s0) # gMN1PPanel + 44
  /* 13DFC4 80135DC4 AE0E0028 */        sw $t6, 0x28($s0) # gMN1PPanel + 40
  /* 13DFC8 80135DC8 AE040054 */        sw $a0, 0x54($s0) # gMN1PPanel + 84
  /* 13DFCC 80135DCC 0C04D601 */       jal mn1PSyncFighterDisplay
  /* 13DFD0 80135DD0 AE000058 */        sw $zero, 0x58($s0) # gMN1PPanel + 88
  /* 13DFD4 80135DD4 02202025 */        or $a0, $s1, $zero
  /* 13DFD8 80135DD8 0C04D722 */       jal mn1PReorderCursorsOnPickup
  /* 13DFDC 80135DDC 02202825 */        or $a1, $s1, $zero
  /* 13DFE0 80135DE0 0C04D756 */       jal mn1PSetCursorCoordinatesFromToken
  /* 13DFE4 80135DE4 02202025 */        or $a0, $s1, $zero
  /* 13DFE8 80135DE8 8E040000 */        lw $a0, ($s0) # gMN1PPanel + 0
  /* 13DFEC 80135DEC 02202825 */        or $a1, $s1, $zero
  /* 13DFF0 80135DF0 0C04D4AF */       jal mn1PRedrawCursor
  /* 13DFF4 80135DF4 8E060028 */        lw $a2, 0x28($s0) # gMN1PPanel + 40
  /* 13DFF8 80135DF8 240F0001 */     addiu $t7, $zero, 1
  /* 13DFFC 80135DFC AE0F0070 */        sw $t7, 0x70($s0) # gMN1PPanel + 112
  /* 13E000 80135E00 0C009A70 */       jal func_800269C0
  /* 13E004 80135E04 2404007F */     addiu $a0, $zero, 0x7f
  /* 13E008 80135E08 0C04D649 */       jal mn1PRemoveWhiteSquare
  /* 13E00C 80135E0C 02202025 */        or $a0, $s1, $zero
  /* 13E010 80135E10 0C04D631 */       jal mn1PSyncNameAndLogo
  /* 13E014 80135E14 02202025 */        or $a0, $s1, $zero
  /* 13E018 80135E18 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13E01C 80135E1C 8FB00014 */        lw $s0, 0x14($sp)
  /* 13E020 80135E20 8FB10018 */        lw $s1, 0x18($sp)
  /* 13E024 80135E24 03E00008 */        jr $ra
  /* 13E028 80135E28 27BD0020 */     addiu $sp, $sp, 0x20

glabel mn1PCheckAndHandleTokenPickup
  /* 13E02C 80135E2C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13E030 80135E30 AFB10018 */        sw $s1, 0x18($sp)
  /* 13E034 80135E34 3C118014 */       lui $s1, %hi(gMN1PPanel)
  /* 13E038 80135E38 26318EE8 */     addiu $s1, $s1, %lo(gMN1PPanel)
  /* 13E03C 80135E3C 3C0E8014 */       lui $t6, %hi(gMN1PFramesElapsed)
  /* 13E040 80135E40 8DCE8F74 */        lw $t6, %lo(gMN1PFramesElapsed)($t6)
  /* 13E044 80135E44 8E2F0034 */        lw $t7, 0x34($s1) # gMN1PPanel + 52
  /* 13E048 80135E48 AFB00014 */        sw $s0, 0x14($sp)
  /* 13E04C 80135E4C 00A08025 */        or $s0, $a1, $zero
  /* 13E050 80135E50 01CF082A */       slt $at, $t6, $t7
  /* 13E054 80135E54 AFBF001C */        sw $ra, 0x1c($sp)
  /* 13E058 80135E58 14200004 */      bnez $at, .L80135E6C
  /* 13E05C 80135E5C AFA40020 */        sw $a0, 0x20($sp)
  /* 13E060 80135E60 8E380030 */        lw $t8, 0x30($s1) # gMN1PPanel + 48
  /* 13E064 80135E64 53000004 */      beql $t8, $zero, .L80135E78
  /* 13E068 80135E68 8E390028 */        lw $t9, 0x28($s1) # gMN1PPanel + 40
  .L80135E6C:
  /* 13E06C 80135E6C 1000002C */         b .L80135F20
  /* 13E070 80135E70 00001025 */        or $v0, $zero, $zero
  /* 13E074 80135E74 8E390028 */        lw $t9, 0x28($s1) # gMN1PPanel + 40
  .L80135E78:
  /* 13E078 80135E78 24010002 */     addiu $at, $zero, 2
  /* 13E07C 80135E7C 53210004 */      beql $t9, $at, .L80135E90
  /* 13E080 80135E80 8E280050 */        lw $t0, 0x50($s1) # gMN1PPanel + 80
  /* 13E084 80135E84 10000026 */         b .L80135F20
  /* 13E088 80135E88 00001025 */        or $v0, $zero, $zero
  /* 13E08C 80135E8C 8E280050 */        lw $t0, 0x50($s1) # gMN1PPanel + 80
  .L80135E90:
  /* 13E090 80135E90 24010004 */     addiu $at, $zero, 4
  /* 13E094 80135E94 8FA40020 */        lw $a0, 0x20($sp)
  /* 13E098 80135E98 15010020 */       bne $t0, $at, .L80135F1C
  /* 13E09C 80135E9C 02002825 */        or $a1, $s0, $zero
  /* 13E0A0 80135EA0 0C04D5C9 */       jal mn1PCheckTokenPickup
  /* 13E0A4 80135EA4 02003025 */        or $a2, $s0, $zero
  /* 13E0A8 80135EA8 1040001C */      beqz $v0, .L80135F1C
  /* 13E0AC 80135EAC 24090001 */     addiu $t1, $zero, 1
  /* 13E0B0 80135EB0 AE300050 */        sw $s0, 0x50($s1) # gMN1PPanel + 80
  /* 13E0B4 80135EB4 AE20002C */        sw $zero, 0x2c($s1) # gMN1PPanel + 44
  /* 13E0B8 80135EB8 AE290028 */        sw $t1, 0x28($s1) # gMN1PPanel + 40
  /* 13E0BC 80135EBC 3C018014 */       lui $at, %hi(D_ovl27_80138F3C)
  /* 13E0C0 80135EC0 AC308F3C */        sw $s0, %lo(D_ovl27_80138F3C)($at)
  /* 13E0C4 80135EC4 AE200058 */        sw $zero, 0x58($s1) # gMN1PPanel + 88
  /* 13E0C8 80135EC8 0C04D601 */       jal mn1PSyncFighterDisplay
  /* 13E0CC 80135ECC 02002025 */        or $a0, $s0, $zero
  /* 13E0D0 80135ED0 02002025 */        or $a0, $s0, $zero
  /* 13E0D4 80135ED4 0C04D722 */       jal mn1PReorderCursorsOnPickup
  /* 13E0D8 80135ED8 02002825 */        or $a1, $s0, $zero
  /* 13E0DC 80135EDC 0C04D756 */       jal mn1PSetCursorCoordinatesFromToken
  /* 13E0E0 80135EE0 02002025 */        or $a0, $s0, $zero
  /* 13E0E4 80135EE4 8FA40020 */        lw $a0, 0x20($sp)
  /* 13E0E8 80135EE8 02002825 */        or $a1, $s0, $zero
  /* 13E0EC 80135EEC 0C04D4AF */       jal mn1PRedrawCursor
  /* 13E0F0 80135EF0 8E260028 */        lw $a2, 0x28($s1) # gMN1PPanel + 40
  /* 13E0F4 80135EF4 240A0001 */     addiu $t2, $zero, 1
  /* 13E0F8 80135EF8 AE2A0070 */        sw $t2, 0x70($s1) # gMN1PPanel + 112
  /* 13E0FC 80135EFC 0C009A70 */       jal func_800269C0
  /* 13E100 80135F00 2404007F */     addiu $a0, $zero, 0x7f
  /* 13E104 80135F04 0C04D649 */       jal mn1PRemoveWhiteSquare
  /* 13E108 80135F08 02002025 */        or $a0, $s0, $zero
  /* 13E10C 80135F0C 0C04D631 */       jal mn1PSyncNameAndLogo
  /* 13E110 80135F10 02002025 */        or $a0, $s0, $zero
  /* 13E114 80135F14 10000002 */         b .L80135F20
  /* 13E118 80135F18 24020001 */     addiu $v0, $zero, 1
  .L80135F1C:
  /* 13E11C 80135F1C 00001025 */        or $v0, $zero, $zero
  .L80135F20:
  /* 13E120 80135F20 8FBF001C */        lw $ra, 0x1c($sp)
  /* 13E124 80135F24 8FB00014 */        lw $s0, 0x14($sp)
  /* 13E128 80135F28 8FB10018 */        lw $s1, 0x18($sp)
  /* 13E12C 80135F2C 03E00008 */        jr $ra
  /* 13E130 80135F30 27BD0020 */     addiu $sp, $sp, 0x20

glabel mn1PGetFtKindFromTokenPositionEvenIfLocked
  /* 13E134 80135F34 3C0E8014 */       lui $t6, %hi(D_ovl27_80138EEC)
  /* 13E138 80135F38 8DCE8EEC */        lw $t6, %lo(D_ovl27_80138EEC)($t6)
  /* 13E13C 80135F3C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13E140 80135F40 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13E144 80135F44 8DC20074 */        lw $v0, 0x74($t6)
  /* 13E148 80135F48 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 13E14C 80135F4C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13E150 80135F50 00001025 */        or $v0, $zero, $zero
  /* 13E154 80135F54 4600428D */ trunc.w.s $f10, $f8
  /* 13E158 80135F58 4600218D */ trunc.w.s $f6, $f4
  /* 13E15C 80135F5C 44035000 */      mfc1 $v1, $f10
  /* 13E160 80135F60 44053000 */      mfc1 $a1, $f6
  /* 13E164 80135F64 2463000C */     addiu $v1, $v1, 0xc
  /* 13E168 80135F68 28610024 */      slti $at, $v1, 0x24
  /* 13E16C 80135F6C 14200006 */      bnez $at, .L80135F88
  /* 13E170 80135F70 24A5000D */     addiu $a1, $a1, 0xd
  /* 13E174 80135F74 2861004F */      slti $at, $v1, 0x4f
  /* 13E178 80135F78 10200003 */      beqz $at, .L80135F88
  /* 13E17C 80135F7C 00000000 */       nop
  /* 13E180 80135F80 10000001 */         b .L80135F88
  /* 13E184 80135F84 24020001 */     addiu $v0, $zero, 1
  .L80135F88:
  /* 13E188 80135F88 10400011 */      beqz $v0, .L80135FD0
  /* 13E18C 80135F8C 28A10019 */      slti $at, $a1, 0x19
  /* 13E190 80135F90 14200006 */      bnez $at, .L80135FAC
  /* 13E194 80135F94 00001025 */        or $v0, $zero, $zero
  /* 13E198 80135F98 28A10127 */      slti $at, $a1, 0x127
  /* 13E19C 80135F9C 10200003 */      beqz $at, .L80135FAC
  /* 13E1A0 80135FA0 00000000 */       nop
  /* 13E1A4 80135FA4 10000001 */         b .L80135FAC
  /* 13E1A8 80135FA8 24020001 */     addiu $v0, $zero, 1
  .L80135FAC:
  /* 13E1AC 80135FAC 10400008 */      beqz $v0, .L80135FD0
  /* 13E1B0 80135FB0 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 13E1B4 80135FB4 2401002D */     addiu $at, $zero, 0x2d
  /* 13E1B8 80135FB8 0081001A */       div $zero, $a0, $at
  /* 13E1BC 80135FBC 00002012 */      mflo $a0
  /* 13E1C0 80135FC0 0C04C9E7 */       jal mn1PGetFtKind
  /* 13E1C4 80135FC4 00000000 */       nop
  /* 13E1C8 80135FC8 1000001E */         b .L80136044
  /* 13E1CC 80135FCC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135FD0:
  /* 13E1D0 80135FD0 2861004F */      slti $at, $v1, 0x4f
  /* 13E1D4 80135FD4 14200006 */      bnez $at, .L80135FF0
  /* 13E1D8 80135FD8 00001025 */        or $v0, $zero, $zero
  /* 13E1DC 80135FDC 2861007A */      slti $at, $v1, 0x7a
  /* 13E1E0 80135FE0 10200003 */      beqz $at, .L80135FF0
  /* 13E1E4 80135FE4 00000000 */       nop
  /* 13E1E8 80135FE8 10000001 */         b .L80135FF0
  /* 13E1EC 80135FEC 24020001 */     addiu $v0, $zero, 1
  .L80135FF0:
  /* 13E1F0 80135FF0 10400012 */      beqz $v0, .L8013603C
  /* 13E1F4 80135FF4 28A10019 */      slti $at, $a1, 0x19
  /* 13E1F8 80135FF8 14200006 */      bnez $at, .L80136014
  /* 13E1FC 80135FFC 00001025 */        or $v0, $zero, $zero
  /* 13E200 80136000 28A10127 */      slti $at, $a1, 0x127
  /* 13E204 80136004 10200003 */      beqz $at, .L80136014
  /* 13E208 80136008 00000000 */       nop
  /* 13E20C 8013600C 10000001 */         b .L80136014
  /* 13E210 80136010 24020001 */     addiu $v0, $zero, 1
  .L80136014:
  /* 13E214 80136014 10400009 */      beqz $v0, .L8013603C
  /* 13E218 80136018 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 13E21C 8013601C 2401002D */     addiu $at, $zero, 0x2d
  /* 13E220 80136020 0081001A */       div $zero, $a0, $at
  /* 13E224 80136024 00002012 */      mflo $a0
  /* 13E228 80136028 24840006 */     addiu $a0, $a0, 6
  /* 13E22C 8013602C 0C04C9E7 */       jal mn1PGetFtKind
  /* 13E230 80136030 00000000 */       nop
  /* 13E234 80136034 10000003 */         b .L80136044
  /* 13E238 80136038 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013603C:
  /* 13E23C 8013603C 2402001C */     addiu $v0, $zero, 0x1c
  /* 13E240 80136040 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136044:
  /* 13E244 80136044 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13E248 80136048 03E00008 */        jr $ra
  /* 13E24C 8013604C 00000000 */       nop

glabel mn1PGetFtKindFromTokenPosition
  /* 13E250 80136050 3C0E8014 */       lui $t6, %hi(D_ovl27_80138EEC)
  /* 13E254 80136054 8DCE8EEC */        lw $t6, %lo(D_ovl27_80138EEC)($t6)
  /* 13E258 80136058 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13E25C 8013605C AFBF0014 */        sw $ra, 0x14($sp)
  /* 13E260 80136060 AFA40028 */        sw $a0, 0x28($sp)
  /* 13E264 80136064 8DC20074 */        lw $v0, 0x74($t6)
  /* 13E268 80136068 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 13E26C 8013606C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13E270 80136070 00001025 */        or $v0, $zero, $zero
  /* 13E274 80136074 4600428D */ trunc.w.s $f10, $f8
  /* 13E278 80136078 4600218D */ trunc.w.s $f6, $f4
  /* 13E27C 8013607C 44035000 */      mfc1 $v1, $f10
  /* 13E280 80136080 44053000 */      mfc1 $a1, $f6
  /* 13E284 80136084 2463000C */     addiu $v1, $v1, 0xc
  /* 13E288 80136088 28610024 */      slti $at, $v1, 0x24
  /* 13E28C 8013608C 14200006 */      bnez $at, .L801360A8
  /* 13E290 80136090 24A5000D */     addiu $a1, $a1, 0xd
  /* 13E294 80136094 2861004F */      slti $at, $v1, 0x4f
  /* 13E298 80136098 10200003 */      beqz $at, .L801360A8
  /* 13E29C 8013609C 00000000 */       nop
  /* 13E2A0 801360A0 10000001 */         b .L801360A8
  /* 13E2A4 801360A4 24020001 */     addiu $v0, $zero, 1
  .L801360A8:
  /* 13E2A8 801360A8 1040001C */      beqz $v0, .L8013611C
  /* 13E2AC 801360AC 28A10019 */      slti $at, $a1, 0x19
  /* 13E2B0 801360B0 14200006 */      bnez $at, .L801360CC
  /* 13E2B4 801360B4 00001025 */        or $v0, $zero, $zero
  /* 13E2B8 801360B8 28A10127 */      slti $at, $a1, 0x127
  /* 13E2BC 801360BC 10200003 */      beqz $at, .L801360CC
  /* 13E2C0 801360C0 00000000 */       nop
  /* 13E2C4 801360C4 10000001 */         b .L801360CC
  /* 13E2C8 801360C8 24020001 */     addiu $v0, $zero, 1
  .L801360CC:
  /* 13E2CC 801360CC 10400013 */      beqz $v0, .L8013611C
  /* 13E2D0 801360D0 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 13E2D4 801360D4 2401002D */     addiu $at, $zero, 0x2d
  /* 13E2D8 801360D8 0081001A */       div $zero, $a0, $at
  /* 13E2DC 801360DC 00002012 */      mflo $a0
  /* 13E2E0 801360E0 0C04C9E7 */       jal mn1PGetFtKind
  /* 13E2E4 801360E4 00000000 */       nop
  /* 13E2E8 801360E8 AFA20018 */        sw $v0, 0x18($sp)
  /* 13E2EC 801360EC 0C04C954 */       jal mn1PCheckFighterIsXBoxed
  /* 13E2F0 801360F0 00402025 */        or $a0, $v0, $zero
  /* 13E2F4 801360F4 14400005 */      bnez $v0, .L8013610C
  /* 13E2F8 801360F8 00000000 */       nop
  /* 13E2FC 801360FC 0C04C9B2 */       jal mn1PGetIsLocked
  /* 13E300 80136100 8FA40018 */        lw $a0, 0x18($sp)
  /* 13E304 80136104 10400003 */      beqz $v0, .L80136114
  /* 13E308 80136108 00000000 */       nop
  .L8013610C:
  /* 13E30C 8013610C 1000002A */         b .L801361B8
  /* 13E310 80136110 2402001C */     addiu $v0, $zero, 0x1c
  .L80136114:
  /* 13E314 80136114 10000028 */         b .L801361B8
  /* 13E318 80136118 8FA20018 */        lw $v0, 0x18($sp)
  .L8013611C:
  /* 13E31C 8013611C 2861004F */      slti $at, $v1, 0x4f
  /* 13E320 80136120 14200006 */      bnez $at, .L8013613C
  /* 13E324 80136124 00001025 */        or $v0, $zero, $zero
  /* 13E328 80136128 2861007A */      slti $at, $v1, 0x7a
  /* 13E32C 8013612C 10200003 */      beqz $at, .L8013613C
  /* 13E330 80136130 00000000 */       nop
  /* 13E334 80136134 10000001 */         b .L8013613C
  /* 13E338 80136138 24020001 */     addiu $v0, $zero, 1
  .L8013613C:
  /* 13E33C 8013613C 1040001D */      beqz $v0, .L801361B4
  /* 13E340 80136140 28A10019 */      slti $at, $a1, 0x19
  /* 13E344 80136144 14200006 */      bnez $at, .L80136160
  /* 13E348 80136148 00001025 */        or $v0, $zero, $zero
  /* 13E34C 8013614C 28A10127 */      slti $at, $a1, 0x127
  /* 13E350 80136150 10200003 */      beqz $at, .L80136160
  /* 13E354 80136154 00000000 */       nop
  /* 13E358 80136158 10000001 */         b .L80136160
  /* 13E35C 8013615C 24020001 */     addiu $v0, $zero, 1
  .L80136160:
  /* 13E360 80136160 10400014 */      beqz $v0, .L801361B4
  /* 13E364 80136164 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 13E368 80136168 2401002D */     addiu $at, $zero, 0x2d
  /* 13E36C 8013616C 0081001A */       div $zero, $a0, $at
  /* 13E370 80136170 00002012 */      mflo $a0
  /* 13E374 80136174 24840006 */     addiu $a0, $a0, 6
  /* 13E378 80136178 0C04C9E7 */       jal mn1PGetFtKind
  /* 13E37C 8013617C 00000000 */       nop
  /* 13E380 80136180 AFA20018 */        sw $v0, 0x18($sp)
  /* 13E384 80136184 0C04C954 */       jal mn1PCheckFighterIsXBoxed
  /* 13E388 80136188 00402025 */        or $a0, $v0, $zero
  /* 13E38C 8013618C 14400005 */      bnez $v0, .L801361A4
  /* 13E390 80136190 00000000 */       nop
  /* 13E394 80136194 0C04C9B2 */       jal mn1PGetIsLocked
  /* 13E398 80136198 8FA40018 */        lw $a0, 0x18($sp)
  /* 13E39C 8013619C 10400003 */      beqz $v0, .L801361AC
  /* 13E3A0 801361A0 00000000 */       nop
  .L801361A4:
  /* 13E3A4 801361A4 10000004 */         b .L801361B8
  /* 13E3A8 801361A8 2402001C */     addiu $v0, $zero, 0x1c
  .L801361AC:
  /* 13E3AC 801361AC 10000002 */         b .L801361B8
  /* 13E3B0 801361B0 8FA20018 */        lw $v0, 0x18($sp)
  .L801361B4:
  /* 13E3B4 801361B4 2402001C */     addiu $v0, $zero, 0x1c
  .L801361B8:
  /* 13E3B8 801361B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13E3BC 801361BC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13E3C0 801361C0 03E00008 */        jr $ra
  /* 13E3C4 801361C4 00000000 */       nop

glabel mn1PAutoPositionCursor
  /* 13E3C8 801361C8 3C0E8014 */       lui $t6, %hi(dMN1PCursorTypePositions2)
  /* 13E3CC 801361CC 25CE8BF4 */     addiu $t6, $t6, %lo(dMN1PCursorTypePositions2)
  /* 13E3D0 801361D0 8DD80000 */        lw $t8, ($t6) # dMN1PCursorTypePositions2 + 0
  /* 13E3D4 801361D4 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13E3D8 801361D8 27A80014 */     addiu $t0, $sp, 0x14
  /* 13E3DC 801361DC AD180000 */        sw $t8, ($t0)
  /* 13E3E0 801361E0 8DCF0004 */        lw $t7, 4($t6) # dMN1PCursorTypePositions2 + 4
  /* 13E3E4 801361E4 3C098014 */       lui $t1, %hi(gMN1PPanel)
  /* 13E3E8 801361E8 25298EE8 */     addiu $t1, $t1, %lo(gMN1PPanel)
  /* 13E3EC 801361EC AD0F0004 */        sw $t7, 4($t0)
  /* 13E3F0 801361F0 8DD80008 */        lw $t8, 8($t6) # dMN1PCursorTypePositions2 + 8
  /* 13E3F4 801361F4 8D390070 */        lw $t9, 0x70($t1) # gMN1PPanel + 112
  /* 13E3F8 801361F8 AD180008 */        sw $t8, 8($t0)
  /* 13E3FC 801361FC 8DCF000C */        lw $t7, 0xc($t6) # dMN1PCursorTypePositions2 + 12
  /* 13E400 80136200 AD0F000C */        sw $t7, 0xc($t0)
  /* 13E404 80136204 8DD80010 */        lw $t8, 0x10($t6) # dMN1PCursorTypePositions2 + 16
  /* 13E408 80136208 AD180010 */        sw $t8, 0x10($t0)
  /* 13E40C 8013620C 8DCF0014 */        lw $t7, 0x14($t6) # dMN1PCursorTypePositions2 + 20
  /* 13E410 80136210 13200060 */      beqz $t9, .L80136394
  /* 13E414 80136214 AD0F0014 */        sw $t7, 0x14($t0)
  /* 13E418 80136218 8D2A0000 */        lw $t2, ($t1) # gMN1PPanel + 0
  /* 13E41C 8013621C C5220068 */      lwc1 $f2, 0x68($t1) # gMN1PPanel + 104
  /* 13E420 80136220 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 13E424 80136224 8D420074 */        lw $v0, 0x74($t2)
  /* 13E428 80136228 44817000 */      mtc1 $at, $f14 # 5.0 to cop1
  /* 13E42C 8013622C 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13E430 80136230 C44C0058 */      lwc1 $f12, 0x58($v0)
  /* 13E434 80136234 44818000 */      mtc1 $at, $f16 # -1.0 to cop1
  /* 13E438 80136238 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13E43C 8013623C 460C1101 */     sub.s $f4, $f2, $f12
  /* 13E440 80136240 00001825 */        or $v1, $zero, $zero
  /* 13E444 80136244 460E2003 */     div.s $f0, $f4, $f14
  /* 13E448 80136248 4600803E */    c.le.s $f16, $f0
  /* 13E44C 8013624C 00000000 */       nop
  /* 13E450 80136250 45000009 */      bc1f .L80136278
  /* 13E454 80136254 00000000 */       nop
  /* 13E458 80136258 44813000 */      mtc1 $at, $f6 # 1.0 to cop1
  /* 13E45C 8013625C 00000000 */       nop
  /* 13E460 80136260 4606003E */    c.le.s $f0, $f6
  /* 13E464 80136264 00000000 */       nop
  /* 13E468 80136268 45000003 */      bc1f .L80136278
  /* 13E46C 8013626C 00000000 */       nop
  /* 13E470 80136270 10000001 */         b .L80136278
  /* 13E474 80136274 24030001 */     addiu $v1, $zero, 1
  .L80136278:
  /* 13E478 80136278 10600003 */      beqz $v1, .L80136288
  /* 13E47C 8013627C 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 13E480 80136280 10000003 */         b .L80136290
  /* 13E484 80136284 E4420058 */      swc1 $f2, 0x58($v0)
  .L80136288:
  /* 13E488 80136288 46006200 */     add.s $f8, $f12, $f0
  /* 13E48C 8013628C E4480058 */      swc1 $f8, 0x58($v0)
  .L80136290:
  /* 13E490 80136290 8D2B0000 */        lw $t3, ($t1) # gMN1PPanel + 0
  /* 13E494 80136294 C522006C */      lwc1 $f2, 0x6c($t1) # gMN1PPanel + 108
  /* 13E498 80136298 00001825 */        or $v1, $zero, $zero
  /* 13E49C 8013629C 8D620074 */        lw $v0, 0x74($t3)
  /* 13E4A0 801362A0 C44C005C */      lwc1 $f12, 0x5c($v0)
  /* 13E4A4 801362A4 460C1281 */     sub.s $f10, $f2, $f12
  /* 13E4A8 801362A8 460E5003 */     div.s $f0, $f10, $f14
  /* 13E4AC 801362AC 4600803E */    c.le.s $f16, $f0
  /* 13E4B0 801362B0 00000000 */       nop
  /* 13E4B4 801362B4 45000009 */      bc1f .L801362DC
  /* 13E4B8 801362B8 00000000 */       nop
  /* 13E4BC 801362BC 44819000 */      mtc1 $at, $f18 # 1.0 to cop1
  /* 13E4C0 801362C0 00000000 */       nop
  /* 13E4C4 801362C4 4612003E */    c.le.s $f0, $f18
  /* 13E4C8 801362C8 00000000 */       nop
  /* 13E4CC 801362CC 45000003 */      bc1f .L801362DC
  /* 13E4D0 801362D0 00000000 */       nop
  /* 13E4D4 801362D4 10000001 */         b .L801362DC
  /* 13E4D8 801362D8 24030001 */     addiu $v1, $zero, 1
  .L801362DC:
  /* 13E4DC 801362DC 50600004 */      beql $v1, $zero, .L801362F0
  /* 13E4E0 801362E0 46006100 */     add.s $f4, $f12, $f0
  /* 13E4E4 801362E4 10000003 */         b .L801362F4
  /* 13E4E8 801362E8 E442005C */      swc1 $f2, 0x5c($v0)
  /* 13E4EC 801362EC 46006100 */     add.s $f4, $f12, $f0
  .L801362F0:
  /* 13E4F0 801362F0 E444005C */      swc1 $f4, 0x5c($v0)
  .L801362F4:
  /* 13E4F4 801362F4 8D2C0000 */        lw $t4, ($t1) # gMN1PPanel + 0
  /* 13E4F8 801362F8 C5260068 */      lwc1 $f6, 0x68($t1) # gMN1PPanel + 104
  /* 13E4FC 801362FC 8D820074 */        lw $v0, 0x74($t4)
  /* 13E500 80136300 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 13E504 80136304 46083032 */    c.eq.s $f6, $f8
  /* 13E508 80136308 00000000 */       nop
  /* 13E50C 8013630C 45020009 */     bc1fl .L80136334
  /* 13E510 80136310 8D2D0028 */        lw $t5, 0x28($t1) # gMN1PPanel + 40
  /* 13E514 80136314 C52A006C */      lwc1 $f10, 0x6c($t1) # gMN1PPanel + 108
  /* 13E518 80136318 C452005C */      lwc1 $f18, 0x5c($v0)
  /* 13E51C 8013631C 46125032 */    c.eq.s $f10, $f18
  /* 13E520 80136320 00000000 */       nop
  /* 13E524 80136324 45020003 */     bc1fl .L80136334
  /* 13E528 80136328 8D2D0028 */        lw $t5, 0x28($t1) # gMN1PPanel + 40
  /* 13E52C 8013632C AD200070 */        sw $zero, 0x70($t1) # gMN1PPanel + 112
  /* 13E530 80136330 8D2D0028 */        lw $t5, 0x28($t1) # gMN1PPanel + 40
  .L80136334:
  /* 13E534 80136334 8C820074 */        lw $v0, 0x74($a0)
  /* 13E538 80136338 000D70C0 */       sll $t6, $t5, 3
  /* 13E53C 8013633C 010E7821 */      addu $t7, $t0, $t6
  /* 13E540 80136340 8DF80000 */        lw $t8, ($t7)
  /* 13E544 80136344 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 13E548 80136348 8C590008 */        lw $t9, 8($v0)
  /* 13E54C 8013634C 44982000 */      mtc1 $t8, $f4
  /* 13E550 80136350 00000000 */       nop
  /* 13E554 80136354 468021A0 */   cvt.s.w $f6, $f4
  /* 13E558 80136358 46083280 */     add.s $f10, $f6, $f8
  /* 13E55C 8013635C E72A0058 */      swc1 $f10, 0x58($t9)
  /* 13E560 80136360 8D2A0028 */        lw $t2, 0x28($t1) # gMN1PPanel + 40
  /* 13E564 80136364 8C820074 */        lw $v0, 0x74($a0)
  /* 13E568 80136368 000A58C0 */       sll $t3, $t2, 3
  /* 13E56C 8013636C 010B6021 */      addu $t4, $t0, $t3
  /* 13E570 80136370 8D8D0004 */        lw $t5, 4($t4)
  /* 13E574 80136374 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 13E578 80136378 8C4E0008 */        lw $t6, 8($v0)
  /* 13E57C 8013637C 448D9000 */      mtc1 $t5, $f18
  /* 13E580 80136380 00000000 */       nop
  /* 13E584 80136384 46809120 */   cvt.s.w $f4, $f18
  /* 13E588 80136388 46062200 */     add.s $f8, $f4, $f6
  /* 13E58C 8013638C 1000006A */         b .L80136538
  /* 13E590 80136390 E5C8005C */      swc1 $f8, 0x5c($t6)
  .L80136394:
  /* 13E594 80136394 8D2F0030 */        lw $t7, 0x30($t1) # gMN1PPanel + 48
  /* 13E598 80136398 0005C080 */       sll $t8, $a1, 2
  /* 13E59C 8013639C 0305C021 */      addu $t8, $t8, $a1
  /* 13E5A0 801363A0 15E00065 */      bnez $t7, .L80136538
  /* 13E5A4 801363A4 0018C040 */       sll $t8, $t8, 1
  /* 13E5A8 801363A8 3C198004 */       lui $t9, %hi(gPlayerControllers)
  /* 13E5AC 801363AC 27395228 */     addiu $t9, $t9, %lo(gPlayerControllers)
  /* 13E5B0 801363B0 03193021 */      addu $a2, $t8, $t9
  /* 13E5B4 801363B4 80C70008 */        lb $a3, 8($a2)
  /* 13E5B8 801363B8 28E1FFF8 */      slti $at, $a3, -8
  /* 13E5BC 801363BC 14200003 */      bnez $at, .L801363CC
  /* 13E5C0 801363C0 28E10009 */      slti $at, $a3, 9
  /* 13E5C4 801363C4 14200003 */      bnez $at, .L801363D4
  /* 13E5C8 801363C8 00001825 */        or $v1, $zero, $zero
  .L801363CC:
  /* 13E5CC 801363CC 10000001 */         b .L801363D4
  /* 13E5D0 801363D0 24030001 */     addiu $v1, $zero, 1
  .L801363D4:
  /* 13E5D4 801363D4 50600028 */      beql $v1, $zero, .L80136478
  /* 13E5D8 801363D8 80C50009 */        lb $a1, 9($a2)
  /* 13E5DC 801363DC 44875000 */      mtc1 $a3, $f10
  /* 13E5E0 801363E0 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13E5E4 801363E4 44812000 */      mtc1 $at, $f4 # 20.0 to cop1
  /* 13E5E8 801363E8 468054A0 */   cvt.s.w $f18, $f10
  /* 13E5EC 801363EC 8C820074 */        lw $v0, 0x74($a0)
  /* 13E5F0 801363F0 44805000 */      mtc1 $zero, $f10
  /* 13E5F4 801363F4 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 13E5F8 801363F8 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 13E5FC 801363FC 00001825 */        or $v1, $zero, $zero
  /* 13E600 80136400 46049183 */     div.s $f6, $f18, $f4
  /* 13E604 80136404 46083000 */     add.s $f0, $f6, $f8
  /* 13E608 80136408 4600503E */    c.le.s $f10, $f0
  /* 13E60C 8013640C 00000000 */       nop
  /* 13E610 80136410 45000009 */      bc1f .L80136438
  /* 13E614 80136414 00000000 */       nop
  /* 13E618 80136418 44819000 */      mtc1 $at, $f18 # 280.0 to cop1
  /* 13E61C 8013641C 00000000 */       nop
  /* 13E620 80136420 4612003E */    c.le.s $f0, $f18
  /* 13E624 80136424 00000000 */       nop
  /* 13E628 80136428 45000003 */      bc1f .L80136438
  /* 13E62C 8013642C 00000000 */       nop
  /* 13E630 80136430 10000001 */         b .L80136438
  /* 13E634 80136434 24030001 */     addiu $v1, $zero, 1
  .L80136438:
  /* 13E638 80136438 5060000F */      beql $v1, $zero, .L80136478
  /* 13E63C 8013643C 80C50009 */        lb $a1, 9($a2)
  /* 13E640 80136440 E4400058 */      swc1 $f0, 0x58($v0)
  /* 13E644 80136444 8D2A0028 */        lw $t2, 0x28($t1) # gMN1PPanel + 40
  /* 13E648 80136448 8C820074 */        lw $v0, 0x74($a0)
  /* 13E64C 8013644C 000A58C0 */       sll $t3, $t2, 3
  /* 13E650 80136450 010B6021 */      addu $t4, $t0, $t3
  /* 13E654 80136454 8D8D0000 */        lw $t5, ($t4)
  /* 13E658 80136458 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 13E65C 8013645C 8C4E0008 */        lw $t6, 8($v0)
  /* 13E660 80136460 448D2000 */      mtc1 $t5, $f4
  /* 13E664 80136464 00000000 */       nop
  /* 13E668 80136468 468021A0 */   cvt.s.w $f6, $f4
  /* 13E66C 8013646C 46083280 */     add.s $f10, $f6, $f8
  /* 13E670 80136470 E5CA0058 */      swc1 $f10, 0x58($t6)
  /* 13E674 80136474 80C50009 */        lb $a1, 9($a2)
  .L80136478:
  /* 13E678 80136478 28A1FFF8 */      slti $at, $a1, -8
  /* 13E67C 8013647C 14200003 */      bnez $at, .L8013648C
  /* 13E680 80136480 28A10009 */      slti $at, $a1, 9
  /* 13E684 80136484 14200003 */      bnez $at, .L80136494
  /* 13E688 80136488 00001825 */        or $v1, $zero, $zero
  .L8013648C:
  /* 13E68C 8013648C 10000001 */         b .L80136494
  /* 13E690 80136490 24030001 */     addiu $v1, $zero, 1
  .L80136494:
  /* 13E694 80136494 10600028 */      beqz $v1, .L80136538
  /* 13E698 80136498 00000000 */       nop
  /* 13E69C 8013649C 44859000 */      mtc1 $a1, $f18
  /* 13E6A0 801364A0 3C01C1A0 */       lui $at, (0xC1A00000 >> 16) # -20.0
  /* 13E6A4 801364A4 44813000 */      mtc1 $at, $f6 # -20.0 to cop1
  /* 13E6A8 801364A8 46809120 */   cvt.s.w $f4, $f18
  /* 13E6AC 801364AC 8C820074 */        lw $v0, 0x74($a0)
  /* 13E6B0 801364B0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13E6B4 801364B4 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 13E6B8 801364B8 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 13E6BC 801364BC 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 13E6C0 801364C0 46062203 */     div.s $f8, $f4, $f6
  /* 13E6C4 801364C4 00001825 */        or $v1, $zero, $zero
  /* 13E6C8 801364C8 460A4000 */     add.s $f0, $f8, $f10
  /* 13E6CC 801364CC 4600903E */    c.le.s $f18, $f0
  /* 13E6D0 801364D0 00000000 */       nop
  /* 13E6D4 801364D4 45000009 */      bc1f .L801364FC
  /* 13E6D8 801364D8 00000000 */       nop
  /* 13E6DC 801364DC 44812000 */      mtc1 $at, $f4 # 205.0 to cop1
  /* 13E6E0 801364E0 00000000 */       nop
  /* 13E6E4 801364E4 4604003E */    c.le.s $f0, $f4
  /* 13E6E8 801364E8 00000000 */       nop
  /* 13E6EC 801364EC 45000003 */      bc1f .L801364FC
  /* 13E6F0 801364F0 00000000 */       nop
  /* 13E6F4 801364F4 10000001 */         b .L801364FC
  /* 13E6F8 801364F8 24030001 */     addiu $v1, $zero, 1
  .L801364FC:
  /* 13E6FC 801364FC 1060000E */      beqz $v1, .L80136538
  /* 13E700 80136500 00000000 */       nop
  /* 13E704 80136504 E440005C */      swc1 $f0, 0x5c($v0)
  /* 13E708 80136508 8D2F0028 */        lw $t7, 0x28($t1) # gMN1PPanel + 40
  /* 13E70C 8013650C 8C820074 */        lw $v0, 0x74($a0)
  /* 13E710 80136510 000FC0C0 */       sll $t8, $t7, 3
  /* 13E714 80136514 0118C821 */      addu $t9, $t0, $t8
  /* 13E718 80136518 8F2A0004 */        lw $t2, 4($t9) # gPlayerControllers + 4
  /* 13E71C 8013651C C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 13E720 80136520 8C4B0008 */        lw $t3, 8($v0)
  /* 13E724 80136524 448A3000 */      mtc1 $t2, $f6
  /* 13E728 80136528 00000000 */       nop
  /* 13E72C 8013652C 46803220 */   cvt.s.w $f8, $f6
  /* 13E730 80136530 460A4480 */     add.s $f18, $f8, $f10
  /* 13E734 80136534 E572005C */      swc1 $f18, 0x5c($t3)
  .L80136538:
  /* 13E738 80136538 03E00008 */        jr $ra
  /* 13E73C 8013653C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mn1PSyncCursorDisplay
  /* 13E740 80136540 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13E744 80136544 AFBF002C */        sw $ra, 0x2c($sp)
  /* 13E748 80136548 AFB50028 */        sw $s5, 0x28($sp)
  /* 13E74C 8013654C AFB40024 */        sw $s4, 0x24($sp)
  /* 13E750 80136550 AFB30020 */        sw $s3, 0x20($sp)
  /* 13E754 80136554 AFB2001C */        sw $s2, 0x1c($sp)
  /* 13E758 80136558 AFB10018 */        sw $s1, 0x18($sp)
  /* 13E75C 8013655C AFB00014 */        sw $s0, 0x14($sp)
  /* 13E760 80136560 8C8E0074 */        lw $t6, 0x74($a0)
  /* 13E764 80136564 3C0142F8 */       lui $at, (0x42F80000 >> 16) # 124.0
  /* 13E768 80136568 44812000 */      mtc1 $at, $f4 # 124.0 to cop1
  /* 13E76C 8013656C C5C0005C */      lwc1 $f0, 0x5c($t6)
  /* 13E770 80136570 3C128014 */       lui $s2, %hi(gMN1PPanel)
  /* 13E774 80136574 0080A025 */        or $s4, $a0, $zero
  /* 13E778 80136578 4600203C */    c.lt.s $f4, $f0
  /* 13E77C 8013657C 00A0A825 */        or $s5, $a1, $zero
  /* 13E780 80136580 26528EE8 */     addiu $s2, $s2, %lo(gMN1PPanel)
  /* 13E784 80136584 3C014218 */       lui $at, (0x42180000 >> 16) # 38.0
  /* 13E788 80136588 45030008 */     bc1tl .L801365AC
  /* 13E78C 8013658C 8E420028 */        lw $v0, 0x28($s2) # gMN1PPanel + 40
  /* 13E790 80136590 44813000 */      mtc1 $at, $f6 # 38.0 to cop1
  /* 13E794 80136594 00000000 */       nop
  /* 13E798 80136598 4606003C */    c.lt.s $f0, $f6
  /* 13E79C 8013659C 00000000 */       nop
  /* 13E7A0 801365A0 4500000C */      bc1f .L801365D4
  /* 13E7A4 801365A4 00000000 */       nop
  /* 13E7A8 801365A8 8E420028 */        lw $v0, 0x28($s2) # gMN1PPanel + 40
  .L801365AC:
  /* 13E7AC 801365AC 02802025 */        or $a0, $s4, $zero
  /* 13E7B0 801365B0 02A02825 */        or $a1, $s5, $zero
  /* 13E7B4 801365B4 10400005 */      beqz $v0, .L801365CC
  /* 13E7B8 801365B8 00000000 */       nop
  /* 13E7BC 801365BC 0C04D4AF */       jal mn1PRedrawCursor
  /* 13E7C0 801365C0 00003025 */        or $a2, $zero, $zero
  /* 13E7C4 801365C4 AE400028 */        sw $zero, 0x28($s2) # gMN1PPanel + 40
  /* 13E7C8 801365C8 00001025 */        or $v0, $zero, $zero
  .L801365CC:
  /* 13E7CC 801365CC 1000001B */         b .L8013663C
  /* 13E7D0 801365D0 24130001 */     addiu $s3, $zero, 1
  .L801365D4:
  /* 13E7D4 801365D4 3C128014 */       lui $s2, %hi(gMN1PPanel)
  /* 13E7D8 801365D8 26528EE8 */     addiu $s2, $s2, %lo(gMN1PPanel)
  /* 13E7DC 801365DC 8E4F0054 */        lw $t7, 0x54($s2) # gMN1PPanel + 84
  /* 13E7E0 801365E0 2401FFFF */     addiu $at, $zero, -1
  /* 13E7E4 801365E4 55E1000D */      bnel $t7, $at, .L8013661C
  /* 13E7E8 801365E8 8E420028 */        lw $v0, 0x28($s2) # gMN1PPanel + 40
  /* 13E7EC 801365EC 8E420028 */        lw $v0, 0x28($s2) # gMN1PPanel + 40
  /* 13E7F0 801365F0 24010002 */     addiu $at, $zero, 2
  /* 13E7F4 801365F4 02802025 */        or $a0, $s4, $zero
  /* 13E7F8 801365F8 10410005 */       beq $v0, $at, .L80136610
  /* 13E7FC 801365FC 02A02825 */        or $a1, $s5, $zero
  /* 13E800 80136600 0C04D4AF */       jal mn1PRedrawCursor
  /* 13E804 80136604 24060002 */     addiu $a2, $zero, 2
  /* 13E808 80136608 24020002 */     addiu $v0, $zero, 2
  /* 13E80C 8013660C AE420028 */        sw $v0, 0x28($s2) # gMN1PPanel + 40
  .L80136610:
  /* 13E810 80136610 1000000A */         b .L8013663C
  /* 13E814 80136614 24130001 */     addiu $s3, $zero, 1
  /* 13E818 80136618 8E420028 */        lw $v0, 0x28($s2) # gMN1PPanel + 40
  .L8013661C:
  /* 13E81C 8013661C 24130001 */     addiu $s3, $zero, 1
  /* 13E820 80136620 02802025 */        or $a0, $s4, $zero
  /* 13E824 80136624 12620005 */       beq $s3, $v0, .L8013663C
  /* 13E828 80136628 02A02825 */        or $a1, $s5, $zero
  /* 13E82C 8013662C 0C04D4AF */       jal mn1PRedrawCursor
  /* 13E830 80136630 02603025 */        or $a2, $s3, $zero
  /* 13E834 80136634 AE530028 */        sw $s3, 0x28($s2) # gMN1PPanel + 40
  /* 13E838 80136638 02601025 */        or $v0, $s3, $zero
  .L8013663C:
  /* 13E83C 8013663C 54400019 */      bnel $v0, $zero, .L801366A4
  /* 13E840 80136640 8FBF002C */        lw $ra, 0x2c($sp)
  /* 13E844 80136644 8E59002C */        lw $t9, 0x2c($s2) # gMN1PPanel + 44
  /* 13E848 80136648 00008025 */        or $s0, $zero, $zero
  /* 13E84C 8013664C 24110004 */     addiu $s1, $zero, 4
  /* 13E850 80136650 53200014 */      beql $t9, $zero, .L801366A4
  /* 13E854 80136654 8FBF002C */        lw $ra, 0x2c($sp)
  /* 13E858 80136658 8E48002C */        lw $t0, 0x2c($s2) # gMN1PPanel + 44
  .L8013665C:
  /* 13E85C 8013665C 02802025 */        or $a0, $s4, $zero
  /* 13E860 80136660 02A02825 */        or $a1, $s5, $zero
  /* 13E864 80136664 5668000C */      bnel $s3, $t0, .L80136698
  /* 13E868 80136668 26100001 */     addiu $s0, $s0, 1
  /* 13E86C 8013666C 0C04D5C9 */       jal mn1PCheckTokenPickup
  /* 13E870 80136670 02003025 */        or $a2, $s0, $zero
  /* 13E874 80136674 10400007 */      beqz $v0, .L80136694
  /* 13E878 80136678 02802025 */        or $a0, $s4, $zero
  /* 13E87C 8013667C 02A02825 */        or $a1, $s5, $zero
  /* 13E880 80136680 0C04D4AF */       jal mn1PRedrawCursor
  /* 13E884 80136684 24060002 */     addiu $a2, $zero, 2
  /* 13E888 80136688 24090002 */     addiu $t1, $zero, 2
  /* 13E88C 8013668C 10000004 */         b .L801366A0
  /* 13E890 80136690 AE490028 */        sw $t1, 0x28($s2) # gMN1PPanel + 40
  .L80136694:
  /* 13E894 80136694 26100001 */     addiu $s0, $s0, 1
  .L80136698:
  /* 13E898 80136698 5611FFF0 */      bnel $s0, $s1, .L8013665C
  /* 13E89C 8013669C 8E48002C */        lw $t0, 0x2c($s2) # gMN1PPanel + 44
  .L801366A0:
  /* 13E8A0 801366A0 8FBF002C */        lw $ra, 0x2c($sp)
  .L801366A4:
  /* 13E8A4 801366A4 8FB00014 */        lw $s0, 0x14($sp)
  /* 13E8A8 801366A8 8FB10018 */        lw $s1, 0x18($sp)
  /* 13E8AC 801366AC 8FB2001C */        lw $s2, 0x1c($sp)
  /* 13E8B0 801366B0 8FB30020 */        lw $s3, 0x20($sp)
  /* 13E8B4 801366B4 8FB40024 */        lw $s4, 0x24($sp)
  /* 13E8B8 801366B8 8FB50028 */        lw $s5, 0x28($sp)
  /* 13E8BC 801366BC 03E00008 */        jr $ra
  /* 13E8C0 801366C0 27BD0030 */     addiu $sp, $sp, 0x30

glabel mn1PCheckLevelRightArrowPress
  /* 13E8C4 801366C4 8C820074 */        lw $v0, 0x74($a0)
  /* 13E8C8 801366C8 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13E8CC 801366CC 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 13E8D0 801366D0 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13E8D4 801366D4 3C014381 */       lui $at, (0x43810000 >> 16) # 258.0
  /* 13E8D8 801366D8 44814000 */      mtc1 $at, $f8 # 258.0 to cop1
  /* 13E8DC 801366DC 46062000 */     add.s $f0, $f4, $f6
  /* 13E8E0 801366E0 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 13E8E4 801366E4 00001825 */        or $v1, $zero, $zero
  /* 13E8E8 801366E8 4600403E */    c.le.s $f8, $f0
  /* 13E8EC 801366EC 00000000 */       nop
  /* 13E8F0 801366F0 45000009 */      bc1f .L80136718
  /* 13E8F4 801366F4 00000000 */       nop
  /* 13E8F8 801366F8 44815000 */      mtc1 $at, $f10 # 280.0 to cop1
  /* 13E8FC 801366FC 00000000 */       nop
  /* 13E900 80136700 460A003E */    c.le.s $f0, $f10
  /* 13E904 80136704 00000000 */       nop
  /* 13E908 80136708 45000003 */      bc1f .L80136718
  /* 13E90C 8013670C 00000000 */       nop
  /* 13E910 80136710 10000001 */         b .L80136718
  /* 13E914 80136714 24030001 */     addiu $v1, $zero, 1
  .L80136718:
  /* 13E918 80136718 10600018 */      beqz $v1, .L8013677C
  /* 13E91C 8013671C 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13E920 80136720 C450005C */      lwc1 $f16, 0x5c($v0)
  /* 13E924 80136724 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 13E928 80136728 3C01431B */       lui $at, (0x431B0000 >> 16) # 155.0
  /* 13E92C 8013672C 44812000 */      mtc1 $at, $f4 # 155.0 to cop1
  /* 13E930 80136730 46128000 */     add.s $f0, $f16, $f18
  /* 13E934 80136734 3C01432E */       lui $at, (0x432E0000 >> 16) # 174.0
  /* 13E938 80136738 00001825 */        or $v1, $zero, $zero
  /* 13E93C 8013673C 4600203E */    c.le.s $f4, $f0
  /* 13E940 80136740 00000000 */       nop
  /* 13E944 80136744 45000009 */      bc1f .L8013676C
  /* 13E948 80136748 00000000 */       nop
  /* 13E94C 8013674C 44813000 */      mtc1 $at, $f6 # 174.0 to cop1
  /* 13E950 80136750 00000000 */       nop
  /* 13E954 80136754 4606003E */    c.le.s $f0, $f6
  /* 13E958 80136758 00000000 */       nop
  /* 13E95C 8013675C 45000003 */      bc1f .L8013676C
  /* 13E960 80136760 00000000 */       nop
  /* 13E964 80136764 10000001 */         b .L8013676C
  /* 13E968 80136768 24030001 */     addiu $v1, $zero, 1
  .L8013676C:
  /* 13E96C 8013676C 50600004 */      beql $v1, $zero, .L80136780
  /* 13E970 80136770 00001025 */        or $v0, $zero, $zero
  /* 13E974 80136774 03E00008 */        jr $ra
  /* 13E978 80136778 24020001 */     addiu $v0, $zero, 1

  .L8013677C:
  /* 13E97C 8013677C 00001025 */        or $v0, $zero, $zero
  .L80136780:
  /* 13E980 80136780 03E00008 */        jr $ra
  /* 13E984 80136784 00000000 */       nop

glabel mn1PCheckLevelLeftArrowPress
  /* 13E988 80136788 8C820074 */        lw $v0, 0x74($a0)
  /* 13E98C 8013678C 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13E990 80136790 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 13E994 80136794 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13E998 80136798 3C01433E */       lui $at, (0x433E0000 >> 16) # 190.0
  /* 13E99C 8013679C 44814000 */      mtc1 $at, $f8 # 190.0 to cop1
  /* 13E9A0 801367A0 46062000 */     add.s $f0, $f4, $f6
  /* 13E9A4 801367A4 3C014354 */       lui $at, (0x43540000 >> 16) # 212.0
  /* 13E9A8 801367A8 00001825 */        or $v1, $zero, $zero
  /* 13E9AC 801367AC 4600403E */    c.le.s $f8, $f0
  /* 13E9B0 801367B0 00000000 */       nop
  /* 13E9B4 801367B4 45000009 */      bc1f .L801367DC
  /* 13E9B8 801367B8 00000000 */       nop
  /* 13E9BC 801367BC 44815000 */      mtc1 $at, $f10 # 212.0 to cop1
  /* 13E9C0 801367C0 00000000 */       nop
  /* 13E9C4 801367C4 460A003E */    c.le.s $f0, $f10
  /* 13E9C8 801367C8 00000000 */       nop
  /* 13E9CC 801367CC 45000003 */      bc1f .L801367DC
  /* 13E9D0 801367D0 00000000 */       nop
  /* 13E9D4 801367D4 10000001 */         b .L801367DC
  /* 13E9D8 801367D8 24030001 */     addiu $v1, $zero, 1
  .L801367DC:
  /* 13E9DC 801367DC 10600018 */      beqz $v1, .L80136840
  /* 13E9E0 801367E0 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13E9E4 801367E4 C450005C */      lwc1 $f16, 0x5c($v0)
  /* 13E9E8 801367E8 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 13E9EC 801367EC 3C01431B */       lui $at, (0x431B0000 >> 16) # 155.0
  /* 13E9F0 801367F0 44812000 */      mtc1 $at, $f4 # 155.0 to cop1
  /* 13E9F4 801367F4 46128000 */     add.s $f0, $f16, $f18
  /* 13E9F8 801367F8 3C01432E */       lui $at, (0x432E0000 >> 16) # 174.0
  /* 13E9FC 801367FC 00001825 */        or $v1, $zero, $zero
  /* 13EA00 80136800 4600203E */    c.le.s $f4, $f0
  /* 13EA04 80136804 00000000 */       nop
  /* 13EA08 80136808 45000009 */      bc1f .L80136830
  /* 13EA0C 8013680C 00000000 */       nop
  /* 13EA10 80136810 44813000 */      mtc1 $at, $f6 # 174.0 to cop1
  /* 13EA14 80136814 00000000 */       nop
  /* 13EA18 80136818 4606003E */    c.le.s $f0, $f6
  /* 13EA1C 8013681C 00000000 */       nop
  /* 13EA20 80136820 45000003 */      bc1f .L80136830
  /* 13EA24 80136824 00000000 */       nop
  /* 13EA28 80136828 10000001 */         b .L80136830
  /* 13EA2C 8013682C 24030001 */     addiu $v1, $zero, 1
  .L80136830:
  /* 13EA30 80136830 50600004 */      beql $v1, $zero, .L80136844
  /* 13EA34 80136834 00001025 */        or $v0, $zero, $zero
  /* 13EA38 80136838 03E00008 */        jr $ra
  /* 13EA3C 8013683C 24020001 */     addiu $v0, $zero, 1

  .L80136840:
  /* 13EA40 80136840 00001025 */        or $v0, $zero, $zero
  .L80136844:
  /* 13EA44 80136844 03E00008 */        jr $ra
  /* 13EA48 80136848 00000000 */       nop

glabel mn1PCheckAnyLevelArrowPress
  /* 13EA4C 8013684C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13EA50 80136850 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13EA54 80136854 0C04D9B1 */       jal mn1PCheckLevelRightArrowPress
  /* 13EA58 80136858 AFA40018 */        sw $a0, 0x18($sp)
  /* 13EA5C 8013685C 10400010 */      beqz $v0, .L801368A0
  /* 13EA60 80136860 3C038014 */       lui $v1, %hi(gMN1PLevelValue)
  /* 13EA64 80136864 24638FB4 */     addiu $v1, $v1, %lo(gMN1PLevelValue)
  /* 13EA68 80136868 8C6E0000 */        lw $t6, ($v1) # gMN1PLevelValue + 0
  /* 13EA6C 8013686C 29C10004 */      slti $at, $t6, 4
  /* 13EA70 80136870 10200009 */      beqz $at, .L80136898
  /* 13EA74 80136874 00000000 */       nop
  /* 13EA78 80136878 0C009A70 */       jal func_800269C0
  /* 13EA7C 8013687C 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13EA80 80136880 3C038014 */       lui $v1, %hi(gMN1PLevelValue)
  /* 13EA84 80136884 24638FB4 */     addiu $v1, $v1, %lo(gMN1PLevelValue)
  /* 13EA88 80136888 8C6F0000 */        lw $t7, ($v1) # gMN1PLevelValue + 0
  /* 13EA8C 8013688C 25E40001 */     addiu $a0, $t7, 1
  /* 13EA90 80136890 0C04CF67 */       jal gMN1PDrawLevel
  /* 13EA94 80136894 AC640000 */        sw $a0, ($v1) # gMN1PLevelValue + 0
  .L80136898:
  /* 13EA98 80136898 10000014 */         b .L801368EC
  /* 13EA9C 8013689C 24020001 */     addiu $v0, $zero, 1
  .L801368A0:
  /* 13EAA0 801368A0 0C04D9E2 */       jal mn1PCheckLevelLeftArrowPress
  /* 13EAA4 801368A4 8FA40018 */        lw $a0, 0x18($sp)
  /* 13EAA8 801368A8 1040000F */      beqz $v0, .L801368E8
  /* 13EAAC 801368AC 3C038014 */       lui $v1, %hi(gMN1PLevelValue)
  /* 13EAB0 801368B0 24638FB4 */     addiu $v1, $v1, %lo(gMN1PLevelValue)
  /* 13EAB4 801368B4 8C790000 */        lw $t9, ($v1) # gMN1PLevelValue + 0
  /* 13EAB8 801368B8 1B200009 */      blez $t9, .L801368E0
  /* 13EABC 801368BC 00000000 */       nop
  /* 13EAC0 801368C0 0C009A70 */       jal func_800269C0
  /* 13EAC4 801368C4 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13EAC8 801368C8 3C038014 */       lui $v1, %hi(gMN1PLevelValue)
  /* 13EACC 801368CC 24638FB4 */     addiu $v1, $v1, %lo(gMN1PLevelValue)
  /* 13EAD0 801368D0 8C680000 */        lw $t0, ($v1) # gMN1PLevelValue + 0
  /* 13EAD4 801368D4 2504FFFF */     addiu $a0, $t0, -1
  /* 13EAD8 801368D8 0C04CF67 */       jal gMN1PDrawLevel
  /* 13EADC 801368DC AC640000 */        sw $a0, ($v1) # gMN1PLevelValue + 0
  .L801368E0:
  /* 13EAE0 801368E0 10000002 */         b .L801368EC
  /* 13EAE4 801368E4 24020001 */     addiu $v0, $zero, 1
  .L801368E8:
  /* 13EAE8 801368E8 00001025 */        or $v0, $zero, $zero
  .L801368EC:
  /* 13EAEC 801368EC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13EAF0 801368F0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13EAF4 801368F4 03E00008 */        jr $ra
  /* 13EAF8 801368F8 00000000 */       nop

glabel mn1PCheckStockRightArrowPress
  /* 13EAFC 801368FC 8C820074 */        lw $v0, 0x74($a0)
  /* 13EB00 80136900 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13EB04 80136904 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 13EB08 80136908 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13EB0C 8013690C 3C014381 */       lui $at, (0x43810000 >> 16) # 258.0
  /* 13EB10 80136910 44814000 */      mtc1 $at, $f8 # 258.0 to cop1
  /* 13EB14 80136914 46062000 */     add.s $f0, $f4, $f6
  /* 13EB18 80136918 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 13EB1C 8013691C 00001825 */        or $v1, $zero, $zero
  /* 13EB20 80136920 4600403E */    c.le.s $f8, $f0
  /* 13EB24 80136924 00000000 */       nop
  /* 13EB28 80136928 45000009 */      bc1f .L80136950
  /* 13EB2C 8013692C 00000000 */       nop
  /* 13EB30 80136930 44815000 */      mtc1 $at, $f10 # 280.0 to cop1
  /* 13EB34 80136934 00000000 */       nop
  /* 13EB38 80136938 460A003E */    c.le.s $f0, $f10
  /* 13EB3C 8013693C 00000000 */       nop
  /* 13EB40 80136940 45000003 */      bc1f .L80136950
  /* 13EB44 80136944 00000000 */       nop
  /* 13EB48 80136948 10000001 */         b .L80136950
  /* 13EB4C 8013694C 24030001 */     addiu $v1, $zero, 1
  .L80136950:
  /* 13EB50 80136950 10600018 */      beqz $v1, .L801369B4
  /* 13EB54 80136954 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13EB58 80136958 C450005C */      lwc1 $f16, 0x5c($v0)
  /* 13EB5C 8013695C 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 13EB60 80136960 3C01432F */       lui $at, (0x432F0000 >> 16) # 175.0
  /* 13EB64 80136964 44812000 */      mtc1 $at, $f4 # 175.0 to cop1
  /* 13EB68 80136968 46128000 */     add.s $f0, $f16, $f18
  /* 13EB6C 8013696C 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 13EB70 80136970 00001825 */        or $v1, $zero, $zero
  /* 13EB74 80136974 4600203E */    c.le.s $f4, $f0
  /* 13EB78 80136978 00000000 */       nop
  /* 13EB7C 8013697C 45000009 */      bc1f .L801369A4
  /* 13EB80 80136980 00000000 */       nop
  /* 13EB84 80136984 44813000 */      mtc1 $at, $f6 # 194.0 to cop1
  /* 13EB88 80136988 00000000 */       nop
  /* 13EB8C 8013698C 4606003E */    c.le.s $f0, $f6
  /* 13EB90 80136990 00000000 */       nop
  /* 13EB94 80136994 45000003 */      bc1f .L801369A4
  /* 13EB98 80136998 00000000 */       nop
  /* 13EB9C 8013699C 10000001 */         b .L801369A4
  /* 13EBA0 801369A0 24030001 */     addiu $v1, $zero, 1
  .L801369A4:
  /* 13EBA4 801369A4 50600004 */      beql $v1, $zero, .L801369B8
  /* 13EBA8 801369A8 00001025 */        or $v0, $zero, $zero
  /* 13EBAC 801369AC 03E00008 */        jr $ra
  /* 13EBB0 801369B0 24020001 */     addiu $v0, $zero, 1

  .L801369B4:
  /* 13EBB4 801369B4 00001025 */        or $v0, $zero, $zero
  .L801369B8:
  /* 13EBB8 801369B8 03E00008 */        jr $ra
  /* 13EBBC 801369BC 00000000 */       nop

glabel mn1PCheckStockLeftArrowPress
  /* 13EBC0 801369C0 8C820074 */        lw $v0, 0x74($a0)
  /* 13EBC4 801369C4 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13EBC8 801369C8 44813000 */      mtc1 $at, $f6 # 20.0 to cop1
  /* 13EBCC 801369CC C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13EBD0 801369D0 3C01433E */       lui $at, (0x433E0000 >> 16) # 190.0
  /* 13EBD4 801369D4 44814000 */      mtc1 $at, $f8 # 190.0 to cop1
  /* 13EBD8 801369D8 46062000 */     add.s $f0, $f4, $f6
  /* 13EBDC 801369DC 3C014354 */       lui $at, (0x43540000 >> 16) # 212.0
  /* 13EBE0 801369E0 00001825 */        or $v1, $zero, $zero
  /* 13EBE4 801369E4 4600403E */    c.le.s $f8, $f0
  /* 13EBE8 801369E8 00000000 */       nop
  /* 13EBEC 801369EC 45000009 */      bc1f .L80136A14
  /* 13EBF0 801369F0 00000000 */       nop
  /* 13EBF4 801369F4 44815000 */      mtc1 $at, $f10 # 212.0 to cop1
  /* 13EBF8 801369F8 00000000 */       nop
  /* 13EBFC 801369FC 460A003E */    c.le.s $f0, $f10
  /* 13EC00 80136A00 00000000 */       nop
  /* 13EC04 80136A04 45000003 */      bc1f .L80136A14
  /* 13EC08 80136A08 00000000 */       nop
  /* 13EC0C 80136A0C 10000001 */         b .L80136A14
  /* 13EC10 80136A10 24030001 */     addiu $v1, $zero, 1
  .L80136A14:
  /* 13EC14 80136A14 10600018 */      beqz $v1, .L80136A78
  /* 13EC18 80136A18 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 13EC1C 80136A1C C450005C */      lwc1 $f16, 0x5c($v0)
  /* 13EC20 80136A20 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 13EC24 80136A24 3C01432F */       lui $at, (0x432F0000 >> 16) # 175.0
  /* 13EC28 80136A28 44812000 */      mtc1 $at, $f4 # 175.0 to cop1
  /* 13EC2C 80136A2C 46128000 */     add.s $f0, $f16, $f18
  /* 13EC30 80136A30 3C014342 */       lui $at, (0x43420000 >> 16) # 194.0
  /* 13EC34 80136A34 00001825 */        or $v1, $zero, $zero
  /* 13EC38 80136A38 4600203E */    c.le.s $f4, $f0
  /* 13EC3C 80136A3C 00000000 */       nop
  /* 13EC40 80136A40 45000009 */      bc1f .L80136A68
  /* 13EC44 80136A44 00000000 */       nop
  /* 13EC48 80136A48 44813000 */      mtc1 $at, $f6 # 194.0 to cop1
  /* 13EC4C 80136A4C 00000000 */       nop
  /* 13EC50 80136A50 4606003E */    c.le.s $f0, $f6
  /* 13EC54 80136A54 00000000 */       nop
  /* 13EC58 80136A58 45000003 */      bc1f .L80136A68
  /* 13EC5C 80136A5C 00000000 */       nop
  /* 13EC60 80136A60 10000001 */         b .L80136A68
  /* 13EC64 80136A64 24030001 */     addiu $v1, $zero, 1
  .L80136A68:
  /* 13EC68 80136A68 50600004 */      beql $v1, $zero, .L80136A7C
  /* 13EC6C 80136A6C 00001025 */        or $v0, $zero, $zero
  /* 13EC70 80136A70 03E00008 */        jr $ra
  /* 13EC74 80136A74 24020001 */     addiu $v0, $zero, 1

  .L80136A78:
  /* 13EC78 80136A78 00001025 */        or $v0, $zero, $zero
  .L80136A7C:
  /* 13EC7C 80136A7C 03E00008 */        jr $ra
  /* 13EC80 80136A80 00000000 */       nop

glabel mn1PCheckAnyStockArrowPress
  /* 13EC84 80136A84 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13EC88 80136A88 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13EC8C 80136A8C 0C04DA3F */       jal mn1PCheckStockRightArrowPress
  /* 13EC90 80136A90 AFA40018 */        sw $a0, 0x18($sp)
  /* 13EC94 80136A94 10400012 */      beqz $v0, .L80136AE0
  /* 13EC98 80136A98 3C038014 */       lui $v1, %hi(gMN1PStockValue)
  /* 13EC9C 80136A9C 24638FB8 */     addiu $v1, $v1, %lo(gMN1PStockValue)
  /* 13ECA0 80136AA0 8C6E0000 */        lw $t6, ($v1) # gMN1PStockValue + 0
  /* 13ECA4 80136AA4 29C10004 */      slti $at, $t6, 4
  /* 13ECA8 80136AA8 1020000B */      beqz $at, .L80136AD8
  /* 13ECAC 80136AAC 00000000 */       nop
  /* 13ECB0 80136AB0 0C009A70 */       jal func_800269C0
  /* 13ECB4 80136AB4 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13ECB8 80136AB8 3C038014 */       lui $v1, %hi(gMN1PStockValue)
  /* 13ECBC 80136ABC 24638FB8 */     addiu $v1, $v1, %lo(gMN1PStockValue)
  /* 13ECC0 80136AC0 8C6F0000 */        lw $t7, ($v1) # gMN1PStockValue + 0
  /* 13ECC4 80136AC4 3C058014 */       lui $a1, %hi(D_ovl27_80138F08)
  /* 13ECC8 80136AC8 25E40001 */     addiu $a0, $t7, 1
  /* 13ECCC 80136ACC AC640000 */        sw $a0, ($v1) # gMN1PStockValue + 0
  /* 13ECD0 80136AD0 0C04D067 */       jal mn1PDrawStock
  /* 13ECD4 80136AD4 8CA58F08 */        lw $a1, %lo(D_ovl27_80138F08)($a1)
  .L80136AD8:
  /* 13ECD8 80136AD8 10000016 */         b .L80136B34
  /* 13ECDC 80136ADC 24020001 */     addiu $v0, $zero, 1
  .L80136AE0:
  /* 13ECE0 80136AE0 0C04DA70 */       jal mn1PCheckStockLeftArrowPress
  /* 13ECE4 80136AE4 8FA40018 */        lw $a0, 0x18($sp)
  /* 13ECE8 80136AE8 10400011 */      beqz $v0, .L80136B30
  /* 13ECEC 80136AEC 3C038014 */       lui $v1, %hi(gMN1PStockValue)
  /* 13ECF0 80136AF0 24638FB8 */     addiu $v1, $v1, %lo(gMN1PStockValue)
  /* 13ECF4 80136AF4 8C790000 */        lw $t9, ($v1) # gMN1PStockValue + 0
  /* 13ECF8 80136AF8 1B20000B */      blez $t9, .L80136B28
  /* 13ECFC 80136AFC 00000000 */       nop
  /* 13ED00 80136B00 0C009A70 */       jal func_800269C0
  /* 13ED04 80136B04 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13ED08 80136B08 3C038014 */       lui $v1, %hi(gMN1PStockValue)
  /* 13ED0C 80136B0C 24638FB8 */     addiu $v1, $v1, %lo(gMN1PStockValue)
  /* 13ED10 80136B10 8C680000 */        lw $t0, ($v1) # gMN1PStockValue + 0
  /* 13ED14 80136B14 3C058014 */       lui $a1, %hi(D_ovl27_80138F08)
  /* 13ED18 80136B18 2504FFFF */     addiu $a0, $t0, -1
  /* 13ED1C 80136B1C AC640000 */        sw $a0, ($v1) # gMN1PStockValue + 0
  /* 13ED20 80136B20 0C04D067 */       jal mn1PDrawStock
  /* 13ED24 80136B24 8CA58F08 */        lw $a1, %lo(D_ovl27_80138F08)($a1)
  .L80136B28:
  /* 13ED28 80136B28 10000002 */         b .L80136B34
  /* 13ED2C 80136B2C 24020001 */     addiu $v0, $zero, 1
  .L80136B30:
  /* 13ED30 80136B30 00001025 */        or $v0, $zero, $zero
  .L80136B34:
  /* 13ED34 80136B34 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13ED38 80136B38 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13ED3C 80136B3C 03E00008 */        jr $ra
  /* 13ED40 80136B40 00000000 */       nop

glabel mn1PSyncShadeAndCostume
  /* 13ED44 80136B44 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13ED48 80136B48 AFA40020 */        sw $a0, 0x20($sp)
  /* 13ED4C 80136B4C AFBF0014 */        sw $ra, 0x14($sp)
  /* 13ED50 80136B50 3C048014 */       lui $a0, %hi(D_ovl27_80138F08)
  /* 13ED54 80136B54 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 13ED58 80136B58 8C848F08 */        lw $a0, %lo(D_ovl27_80138F08)($a0)
  /* 13ED5C 80136B5C 3C048014 */       lui $a0, %hi(D_ovl27_80138EF0)
  /* 13ED60 80136B60 AFA2001C */        sw $v0, 0x1c($sp)
  /* 13ED64 80136B64 8C848EF0 */        lw $a0, %lo(D_ovl27_80138EF0)($a0)
  /* 13ED68 80136B68 00402825 */        or $a1, $v0, $zero
  /* 13ED6C 80136B6C 0C03A492 */       jal func_ovl2_800E9248
  /* 13ED70 80136B70 00003025 */        or $a2, $zero, $zero
  /* 13ED74 80136B74 8FAE001C */        lw $t6, 0x1c($sp)
  /* 13ED78 80136B78 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 13ED7C 80136B7C 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 13ED80 80136B80 3C048014 */       lui $a0, %hi(gMN1PStockValue)
  /* 13ED84 80136B84 AC4E0024 */        sw $t6, 0x24($v0) # gMN1PPanel + 36
  /* 13ED88 80136B88 8C848FB8 */        lw $a0, %lo(gMN1PStockValue)($a0)
  /* 13ED8C 80136B8C 0C04D067 */       jal mn1PDrawStock
  /* 13ED90 80136B90 8C450020 */        lw $a1, 0x20($v0) # gMN1PPanel + 32
  /* 13ED94 80136B94 0C009A70 */       jal func_800269C0
  /* 13ED98 80136B98 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13ED9C 80136B9C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13EDA0 80136BA0 27BD0020 */     addiu $sp, $sp, 0x20
  /* 13EDA4 80136BA4 03E00008 */        jr $ra
  /* 13EDA8 80136BA8 00000000 */       nop

glabel mn1PIsHumanWithCharacterSelected
  /* 13EDAC 80136BAC 3C0E8014 */       lui $t6, %hi(D_ovl27_80138F14)
  /* 13EDB0 80136BB0 8DCE8F14 */        lw $t6, %lo(D_ovl27_80138F14)($t6)
  /* 13EDB4 80136BB4 AFA40000 */        sw $a0, ($sp)
  /* 13EDB8 80136BB8 00001025 */        or $v0, $zero, $zero
  /* 13EDBC 80136BBC 11C00003 */      beqz $t6, .L80136BCC
  /* 13EDC0 80136BC0 00000000 */       nop
  /* 13EDC4 80136BC4 03E00008 */        jr $ra
  /* 13EDC8 80136BC8 24020001 */     addiu $v0, $zero, 1

  .L80136BCC:
  /* 13EDCC 80136BCC 03E00008 */        jr $ra
  /* 13EDD0 80136BD0 00000000 */       nop

glabel mn1PRecallToken
  /* 13EDD4 80136BD4 AFA40000 */        sw $a0, ($sp)
  /* 13EDD8 80136BD8 3C048014 */       lui $a0, %hi(gMN1PPanel)
  /* 13EDDC 80136BDC 24848EE8 */     addiu $a0, $a0, %lo(gMN1PPanel)
  /* 13EDE0 80136BE0 8C820004 */        lw $v0, 4($a0) # gMN1PPanel + 4
  /* 13EDE4 80136BE4 240E0001 */     addiu $t6, $zero, 1
  /* 13EDE8 80136BE8 AC800058 */        sw $zero, 0x58($a0) # gMN1PPanel + 88
  /* 13EDEC 80136BEC AC80002C */        sw $zero, 0x2c($a0) # gMN1PPanel + 44
  /* 13EDF0 80136BF0 AC8E0030 */        sw $t6, 0x30($a0) # gMN1PPanel + 48
  /* 13EDF4 80136BF4 AC80004C */        sw $zero, 0x4c($a0) # gMN1PPanel + 76
  /* 13EDF8 80136BF8 8C4F0074 */        lw $t7, 0x74($v0)
  /* 13EDFC 80136BFC 8C830000 */        lw $v1, ($a0) # gMN1PPanel + 0
  /* 13EE00 80136C00 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 13EE04 80136C04 C5E40058 */      lwc1 $f4, 0x58($t7)
  /* 13EE08 80136C08 44810000 */      mtc1 $at, $f0 # 280.0 to cop1
  /* 13EE0C 80136C0C 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 13EE10 80136C10 E4840038 */      swc1 $f4, 0x38($a0) # gMN1PPanel + 56
  /* 13EE14 80136C14 8C580074 */        lw $t8, 0x74($v0)
  /* 13EE18 80136C18 44816000 */      mtc1 $at, $f12 # 20.0 to cop1
  /* 13EE1C 80136C1C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13EE20 80136C20 C706005C */      lwc1 $f6, 0x5c($t8)
  /* 13EE24 80136C24 44811000 */      mtc1 $at, $f2 # 10.0 to cop1
  /* 13EE28 80136C28 E4860040 */      swc1 $f6, 0x40($a0) # gMN1PPanel + 64
  /* 13EE2C 80136C2C 8C790074 */        lw $t9, 0x74($v1)
  /* 13EE30 80136C30 C7280058 */      lwc1 $f8, 0x58($t9)
  /* 13EE34 80136C34 460C4280 */     add.s $f10, $f8, $f12
  /* 13EE38 80136C38 E48A003C */      swc1 $f10, 0x3c($a0) # gMN1PPanel + 60
  /* 13EE3C 80136C3C C490003C */      lwc1 $f16, 0x3c($a0) # gMN1PPanel + 60
  /* 13EE40 80136C40 4610003C */    c.lt.s $f0, $f16
  /* 13EE44 80136C44 00000000 */       nop
  /* 13EE48 80136C48 45020003 */     bc1fl .L80136C58
  /* 13EE4C 80136C4C 8C680074 */        lw $t0, 0x74($v1)
  /* 13EE50 80136C50 E480003C */      swc1 $f0, 0x3c($a0) # gMN1PPanel + 60
  /* 13EE54 80136C54 8C680074 */        lw $t0, 0x74($v1)
  .L80136C58:
  /* 13EE58 80136C58 3C01C170 */       lui $at, (0xC1700000 >> 16) # -15.0
  /* 13EE5C 80136C5C 44812000 */      mtc1 $at, $f4 # -15.0 to cop1
  /* 13EE60 80136C60 C512005C */      lwc1 $f18, 0x5c($t0)
  /* 13EE64 80136C64 46049180 */     add.s $f6, $f18, $f4
  /* 13EE68 80136C68 E4860048 */      swc1 $f6, 0x48($a0) # gMN1PPanel + 72
  /* 13EE6C 80136C6C C4800048 */      lwc1 $f0, 0x48($a0) # gMN1PPanel + 72
  /* 13EE70 80136C70 4602003C */    c.lt.s $f0, $f2
  /* 13EE74 80136C74 00000000 */       nop
  /* 13EE78 80136C78 45020004 */     bc1fl .L80136C8C
  /* 13EE7C 80136C7C C4820040 */      lwc1 $f2, 0x40($a0) # gMN1PPanel + 64
  /* 13EE80 80136C80 E4820048 */      swc1 $f2, 0x48($a0) # gMN1PPanel + 72
  /* 13EE84 80136C84 C4800048 */      lwc1 $f0, 0x48($a0) # gMN1PPanel + 72
  /* 13EE88 80136C88 C4820040 */      lwc1 $f2, 0x40($a0) # gMN1PPanel + 64
  .L80136C8C:
  /* 13EE8C 80136C8C 4602003C */    c.lt.s $f0, $f2
  /* 13EE90 80136C90 00000000 */       nop
  /* 13EE94 80136C94 45020005 */     bc1fl .L80136CAC
  /* 13EE98 80136C98 460C1281 */     sub.s $f10, $f2, $f12
  /* 13EE9C 80136C9C 460C0201 */     sub.s $f8, $f0, $f12
  /* 13EEA0 80136CA0 03E00008 */        jr $ra
  /* 13EEA4 80136CA4 E4880044 */      swc1 $f8, 0x44($a0) # gMN1PPanel + 68

  /* 13EEA8 80136CA8 460C1281 */     sub.s $f10, $f2, $f12
  .L80136CAC:
  /* 13EEAC 80136CAC E48A0044 */      swc1 $f10, 0x44($a0)
  /* 13EEB0 80136CB0 03E00008 */        jr $ra
  /* 13EEB4 80136CB4 00000000 */       nop

glabel mn1PGoBackTo1PMenu
  /* 13EEB8 80136CB8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 13EEBC 80136CBC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 13EEC0 80136CC0 904E0000 */       lbu $t6, ($v0) # gSceneData + 0
  /* 13EEC4 80136CC4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13EEC8 80136CC8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13EECC 80136CCC 240F0008 */     addiu $t7, $zero, 8
  /* 13EED0 80136CD0 A04F0000 */        sb $t7, ($v0) # gSceneData + 0
  /* 13EED4 80136CD4 0C04DFC4 */       jal mn1PSaveMatchInfo
  /* 13EED8 80136CD8 A04E0001 */        sb $t6, 1($v0) # gSceneData + 1
  /* 13EEDC 80136CDC 0C00829D */       jal func_80020A74
  /* 13EEE0 80136CE0 00000000 */       nop
  /* 13EEE4 80136CE4 0C0099A8 */       jal func_800266A0
  /* 13EEE8 80136CE8 00000000 */       nop
  /* 13EEEC 80136CEC 0C00171D */       jal func_80005C74
  /* 13EEF0 80136CF0 00000000 */       nop
  /* 13EEF4 80136CF4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13EEF8 80136CF8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13EEFC 80136CFC 03E00008 */        jr $ra
  /* 13EF00 80136D00 00000000 */       nop

glabel mn1PExitIfBButtonPressed
  /* 13EF04 80136D04 3C0E8014 */       lui $t6, %hi(gMN1PFramesElapsed)
  /* 13EF08 80136D08 8DCE8F74 */        lw $t6, %lo(gMN1PFramesElapsed)($t6)
  /* 13EF0C 80136D0C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13EF10 80136D10 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13EF14 80136D14 29C1000A */      slti $at, $t6, 0xa
  /* 13EF18 80136D18 1420000B */      bnez $at, .L80136D48
  /* 13EF1C 80136D1C 00047880 */       sll $t7, $a0, 2
  /* 13EF20 80136D20 01E47821 */      addu $t7, $t7, $a0
  /* 13EF24 80136D24 000F7840 */       sll $t7, $t7, 1
  /* 13EF28 80136D28 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 13EF2C 80136D2C 030FC021 */      addu $t8, $t8, $t7
  /* 13EF30 80136D30 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 13EF34 80136D34 33194000 */      andi $t9, $t8, 0x4000
  /* 13EF38 80136D38 53200004 */      beql $t9, $zero, .L80136D4C
  /* 13EF3C 80136D3C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13EF40 80136D40 0C04DB2E */       jal mn1PGoBackTo1PMenu
  /* 13EF44 80136D44 00000000 */       nop
  .L80136D48:
  /* 13EF48 80136D48 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136D4C:
  /* 13EF4C 80136D4C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13EF50 80136D50 03E00008 */        jr $ra
  /* 13EF54 80136D54 00000000 */       nop

glabel mn1PHandleButtonPresses
  /* 13EF58 80136D58 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 13EF5C 80136D5C AFBF0014 */        sw $ra, 0x14($sp)
  /* 13EF60 80136D60 8C850084 */        lw $a1, 0x84($a0)
  /* 13EF64 80136D64 AFA40038 */        sw $a0, 0x38($sp)
  /* 13EF68 80136D68 0C04D872 */       jal mn1PAutoPositionCursor
  /* 13EF6C 80136D6C AFA50020 */        sw $a1, 0x20($sp)
  /* 13EF70 80136D70 8FA50020 */        lw $a1, 0x20($sp)
  /* 13EF74 80136D74 3C0F8004 */       lui $t7, %hi(gPlayerControllers)
  /* 13EF78 80136D78 25EF5228 */     addiu $t7, $t7, %lo(gPlayerControllers)
  /* 13EF7C 80136D7C 00057080 */       sll $t6, $a1, 2
  /* 13EF80 80136D80 01C57021 */      addu $t6, $t6, $a1
  /* 13EF84 80136D84 000E7040 */       sll $t6, $t6, 1
  /* 13EF88 80136D88 01CFC021 */      addu $t8, $t6, $t7
  /* 13EF8C 80136D8C AFB8001C */        sw $t8, 0x1c($sp)
  /* 13EF90 80136D90 97190002 */       lhu $t9, 2($t8)
  /* 13EF94 80136D94 8FA40038 */        lw $a0, 0x38($sp)
  /* 13EF98 80136D98 3C068014 */       lui $a2, %hi(D_ovl27_80138F3C)
  /* 13EF9C 80136D9C 33288000 */      andi $t0, $t9, 0x8000
  /* 13EFA0 80136DA0 11000038 */      beqz $t0, .L80136E84
  /* 13EFA4 80136DA4 00003825 */        or $a3, $zero, $zero
  /* 13EFA8 80136DA8 0C04D701 */       jal mn1PSelectChar
  /* 13EFAC 80136DAC 8CC68F3C */        lw $a2, %lo(D_ovl27_80138F3C)($a2)
  /* 13EFB0 80136DB0 14400034 */      bnez $v0, .L80136E84
  /* 13EFB4 80136DB4 8FA40038 */        lw $a0, 0x38($sp)
  /* 13EFB8 80136DB8 0C04D78B */       jal mn1PCheckAndHandleTokenPickup
  /* 13EFBC 80136DBC 8FA50020 */        lw $a1, 0x20($sp)
  /* 13EFC0 80136DC0 54400031 */      bnel $v0, $zero, .L80136E88
  /* 13EFC4 80136DC4 8FA9001C */        lw $t1, 0x1c($sp)
  /* 13EFC8 80136DC8 0C04D533 */       jal mn1PCheckPickerRightArrowPress
  /* 13EFCC 80136DCC 8FA40038 */        lw $a0, 0x38($sp)
  /* 13EFD0 80136DD0 1040000C */      beqz $v0, .L80136E04
  /* 13EFD4 80136DD4 3C048014 */       lui $a0, %hi(gMN1PTimerValue)
  /* 13EFD8 80136DD8 0C04E046 */       jal mn1PGetNextTimerValue
  /* 13EFDC 80136DDC 8C848F80 */        lw $a0, %lo(gMN1PTimerValue)($a0)
  /* 13EFE0 80136DE0 3C038014 */       lui $v1, %hi(gMN1PTimerValue)
  /* 13EFE4 80136DE4 24638F80 */     addiu $v1, $v1, %lo(gMN1PTimerValue)
  /* 13EFE8 80136DE8 AC620000 */        sw $v0, ($v1) # gMN1PTimerValue + 0
  /* 13EFEC 80136DEC 0C04CE01 */       jal mn1PDrawTimerPicker
  /* 13EFF0 80136DF0 00402025 */        or $a0, $v0, $zero
  /* 13EFF4 80136DF4 0C009A70 */       jal func_800269C0
  /* 13EFF8 80136DF8 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13EFFC 80136DFC 10000022 */         b .L80136E88
  /* 13F000 80136E00 8FA9001C */        lw $t1, 0x1c($sp)
  .L80136E04:
  /* 13F004 80136E04 0C04D565 */       jal mn1PCheckPickerLeftArrowPress
  /* 13F008 80136E08 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F00C 80136E0C 1040000D */      beqz $v0, .L80136E44
  /* 13F010 80136E10 3C038014 */       lui $v1, %hi(gMN1PTimerValue)
  /* 13F014 80136E14 24638F80 */     addiu $v1, $v1, %lo(gMN1PTimerValue)
  /* 13F018 80136E18 0C04E04D */       jal mn1PGetPrevTimerValue
  /* 13F01C 80136E1C 8C640000 */        lw $a0, ($v1) # gMN1PTimerValue + 0
  /* 13F020 80136E20 3C038014 */       lui $v1, %hi(gMN1PTimerValue)
  /* 13F024 80136E24 24638F80 */     addiu $v1, $v1, %lo(gMN1PTimerValue)
  /* 13F028 80136E28 AC620000 */        sw $v0, ($v1) # gMN1PTimerValue + 0
  /* 13F02C 80136E2C 0C04CE01 */       jal mn1PDrawTimerPicker
  /* 13F030 80136E30 00402025 */        or $a0, $v0, $zero
  /* 13F034 80136E34 0C009A70 */       jal func_800269C0
  /* 13F038 80136E38 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13F03C 80136E3C 10000012 */         b .L80136E88
  /* 13F040 80136E40 8FA9001C */        lw $t1, 0x1c($sp)
  .L80136E44:
  /* 13F044 80136E44 0C04D597 */       jal mn1PCheckBackButtonPress
  /* 13F048 80136E48 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F04C 80136E4C 10400007 */      beqz $v0, .L80136E6C
  /* 13F050 80136E50 00000000 */       nop
  /* 13F054 80136E54 0C04DB2E */       jal mn1PGoBackTo1PMenu
  /* 13F058 80136E58 00000000 */       nop
  /* 13F05C 80136E5C 0C009A70 */       jal func_800269C0
  /* 13F060 80136E60 240400A4 */     addiu $a0, $zero, 0xa4
  /* 13F064 80136E64 10000008 */         b .L80136E88
  /* 13F068 80136E68 8FA9001C */        lw $t1, 0x1c($sp)
  .L80136E6C:
  /* 13F06C 80136E6C 0C04DA13 */       jal mn1PCheckAnyLevelArrowPress
  /* 13F070 80136E70 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F074 80136E74 54400004 */      bnel $v0, $zero, .L80136E88
  /* 13F078 80136E78 8FA9001C */        lw $t1, 0x1c($sp)
  /* 13F07C 80136E7C 0C04DAA1 */       jal mn1PCheckAnyStockArrowPress
  /* 13F080 80136E80 8FA40038 */        lw $a0, 0x38($sp)
  .L80136E84:
  /* 13F084 80136E84 8FA9001C */        lw $t1, 0x1c($sp)
  .L80136E88:
  /* 13F088 80136E88 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F08C 80136E8C 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F090 80136E90 952A0002 */       lhu $t2, 2($t1)
  /* 13F094 80136E94 3C068014 */       lui $a2, %hi(D_ovl27_80138F3C)
  /* 13F098 80136E98 00003825 */        or $a3, $zero, $zero
  /* 13F09C 80136E9C 314B0008 */      andi $t3, $t2, 8
  /* 13F0A0 80136EA0 5160000C */      beql $t3, $zero, .L80136ED4
  /* 13F0A4 80136EA4 8FAD001C */        lw $t5, 0x1c($sp)
  /* 13F0A8 80136EA8 0C04D701 */       jal mn1PSelectChar
  /* 13F0AC 80136EAC 8CC68F3C */        lw $a2, %lo(D_ovl27_80138F3C)($a2)
  /* 13F0B0 80136EB0 14400007 */      bnez $v0, .L80136ED0
  /* 13F0B4 80136EB4 3C0C8014 */       lui $t4, %hi(D_ovl27_80138F40)
  /* 13F0B8 80136EB8 8D8C8F40 */        lw $t4, %lo(D_ovl27_80138F40)($t4)
  /* 13F0BC 80136EBC 8FA40020 */        lw $a0, 0x20($sp)
  /* 13F0C0 80136EC0 51800004 */      beql $t4, $zero, .L80136ED4
  /* 13F0C4 80136EC4 8FAD001C */        lw $t5, 0x1c($sp)
  /* 13F0C8 80136EC8 0C04DAD1 */       jal mn1PSyncShadeAndCostume
  /* 13F0CC 80136ECC 00002825 */        or $a1, $zero, $zero
  .L80136ED0:
  /* 13F0D0 80136ED0 8FAD001C */        lw $t5, 0x1c($sp)
  .L80136ED4:
  /* 13F0D4 80136ED4 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F0D8 80136ED8 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F0DC 80136EDC 95AE0002 */       lhu $t6, 2($t5)
  /* 13F0E0 80136EE0 3C068014 */       lui $a2, %hi(D_ovl27_80138F3C)
  /* 13F0E4 80136EE4 24070001 */     addiu $a3, $zero, 1
  /* 13F0E8 80136EE8 31CF0001 */      andi $t7, $t6, 1
  /* 13F0EC 80136EEC 51E0000C */      beql $t7, $zero, .L80136F20
  /* 13F0F0 80136EF0 8FB9001C */        lw $t9, 0x1c($sp)
  /* 13F0F4 80136EF4 0C04D701 */       jal mn1PSelectChar
  /* 13F0F8 80136EF8 8CC68F3C */        lw $a2, %lo(D_ovl27_80138F3C)($a2)
  /* 13F0FC 80136EFC 14400007 */      bnez $v0, .L80136F1C
  /* 13F100 80136F00 3C188014 */       lui $t8, %hi(D_ovl27_80138F40)
  /* 13F104 80136F04 8F188F40 */        lw $t8, %lo(D_ovl27_80138F40)($t8)
  /* 13F108 80136F08 8FA40020 */        lw $a0, 0x20($sp)
  /* 13F10C 80136F0C 53000004 */      beql $t8, $zero, .L80136F20
  /* 13F110 80136F10 8FB9001C */        lw $t9, 0x1c($sp)
  /* 13F114 80136F14 0C04DAD1 */       jal mn1PSyncShadeAndCostume
  /* 13F118 80136F18 24050001 */     addiu $a1, $zero, 1
  .L80136F1C:
  /* 13F11C 80136F1C 8FB9001C */        lw $t9, 0x1c($sp)
  .L80136F20:
  /* 13F120 80136F20 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F124 80136F24 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F128 80136F28 97280002 */       lhu $t0, 2($t9)
  /* 13F12C 80136F2C 3C068014 */       lui $a2, %hi(D_ovl27_80138F3C)
  /* 13F130 80136F30 24070002 */     addiu $a3, $zero, 2
  /* 13F134 80136F34 31090004 */      andi $t1, $t0, 4
  /* 13F138 80136F38 5120000C */      beql $t1, $zero, .L80136F6C
  /* 13F13C 80136F3C 8FAB001C */        lw $t3, 0x1c($sp)
  /* 13F140 80136F40 0C04D701 */       jal mn1PSelectChar
  /* 13F144 80136F44 8CC68F3C */        lw $a2, %lo(D_ovl27_80138F3C)($a2)
  /* 13F148 80136F48 14400007 */      bnez $v0, .L80136F68
  /* 13F14C 80136F4C 3C0A8014 */       lui $t2, %hi(D_ovl27_80138F40)
  /* 13F150 80136F50 8D4A8F40 */        lw $t2, %lo(D_ovl27_80138F40)($t2)
  /* 13F154 80136F54 8FA40020 */        lw $a0, 0x20($sp)
  /* 13F158 80136F58 51400004 */      beql $t2, $zero, .L80136F6C
  /* 13F15C 80136F5C 8FAB001C */        lw $t3, 0x1c($sp)
  /* 13F160 80136F60 0C04DAD1 */       jal mn1PSyncShadeAndCostume
  /* 13F164 80136F64 24050002 */     addiu $a1, $zero, 2
  .L80136F68:
  /* 13F168 80136F68 8FAB001C */        lw $t3, 0x1c($sp)
  .L80136F6C:
  /* 13F16C 80136F6C 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F170 80136F70 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F174 80136F74 956C0002 */       lhu $t4, 2($t3)
  /* 13F178 80136F78 3C068014 */       lui $a2, %hi(D_ovl27_80138F3C)
  /* 13F17C 80136F7C 24070003 */     addiu $a3, $zero, 3
  /* 13F180 80136F80 318D0002 */      andi $t5, $t4, 2
  /* 13F184 80136F84 51A0000C */      beql $t5, $zero, .L80136FB8
  /* 13F188 80136F88 8FAF001C */        lw $t7, 0x1c($sp)
  /* 13F18C 80136F8C 0C04D701 */       jal mn1PSelectChar
  /* 13F190 80136F90 8CC68F3C */        lw $a2, %lo(D_ovl27_80138F3C)($a2)
  /* 13F194 80136F94 14400007 */      bnez $v0, .L80136FB4
  /* 13F198 80136F98 3C0E8014 */       lui $t6, %hi(D_ovl27_80138F40)
  /* 13F19C 80136F9C 8DCE8F40 */        lw $t6, %lo(D_ovl27_80138F40)($t6)
  /* 13F1A0 80136FA0 8FA40020 */        lw $a0, 0x20($sp)
  /* 13F1A4 80136FA4 51C00004 */      beql $t6, $zero, .L80136FB8
  /* 13F1A8 80136FA8 8FAF001C */        lw $t7, 0x1c($sp)
  /* 13F1AC 80136FAC 0C04DAD1 */       jal mn1PSyncShadeAndCostume
  /* 13F1B0 80136FB0 24050003 */     addiu $a1, $zero, 3
  .L80136FB4:
  /* 13F1B4 80136FB4 8FAF001C */        lw $t7, 0x1c($sp)
  .L80136FB8:
  /* 13F1B8 80136FB8 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F1BC 80136FBC 95F80002 */       lhu $t8, 2($t7)
  /* 13F1C0 80136FC0 33194000 */      andi $t9, $t8, 0x4000
  /* 13F1C4 80136FC4 13200007 */      beqz $t9, .L80136FE4
  /* 13F1C8 80136FC8 00000000 */       nop
  /* 13F1CC 80136FCC 0C04DAEB */       jal mn1PIsHumanWithCharacterSelected
  /* 13F1D0 80136FD0 00A02025 */        or $a0, $a1, $zero
  /* 13F1D4 80136FD4 10400003 */      beqz $v0, .L80136FE4
  /* 13F1D8 80136FD8 00000000 */       nop
  /* 13F1DC 80136FDC 0C04DAF5 */       jal mn1PRecallToken
  /* 13F1E0 80136FE0 8FA40020 */        lw $a0, 0x20($sp)
  .L80136FE4:
  /* 13F1E4 80136FE4 3C028014 */       lui $v0, %hi(D_ovl27_80138F18)
  /* 13F1E8 80136FE8 8C428F18 */        lw $v0, %lo(D_ovl27_80138F18)($v0)
  /* 13F1EC 80136FEC 8FA50020 */        lw $a1, 0x20($sp)
  /* 13F1F0 80136FF0 14400006 */      bnez $v0, .L8013700C
  /* 13F1F4 80136FF4 00000000 */       nop
  /* 13F1F8 80136FF8 0C04DB41 */       jal mn1PExitIfBButtonPressed
  /* 13F1FC 80136FFC 00A02025 */        or $a0, $a1, $zero
  /* 13F200 80137000 3C028014 */       lui $v0, %hi(D_ovl27_80138F18)
  /* 13F204 80137004 8C428F18 */        lw $v0, %lo(D_ovl27_80138F18)($v0)
  /* 13F208 80137008 8FA50020 */        lw $a1, 0x20($sp)
  .L8013700C:
  /* 13F20C 8013700C 54400004 */      bnel $v0, $zero, .L80137020
  /* 13F210 80137010 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13F214 80137014 0C04D950 */       jal mn1PSyncCursorDisplay
  /* 13F218 80137018 8FA40038 */        lw $a0, 0x38($sp)
  /* 13F21C 8013701C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137020:
  /* 13F220 80137020 27BD0038 */     addiu $sp, $sp, 0x38
  /* 13F224 80137024 03E00008 */        jr $ra
  /* 13F228 80137028 00000000 */       nop

  /* 13F22C 8013702C 03E00008 */        jr $ra
  /* 13F230 80137030 00000000 */       nop

glabel mn1PCenterTokenInPortrait
  /* 13F234 80137034 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13F238 80137038 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13F23C 8013703C 00803025 */        or $a2, $a0, $zero
  /* 13F240 80137040 AFA60018 */        sw $a2, 0x18($sp)
  /* 13F244 80137044 0C04C9FB */       jal mn1PGetPortraitId
  /* 13F248 80137048 00A02025 */        or $a0, $a1, $zero
  /* 13F24C 8013704C 28410006 */      slti $at, $v0, 6
  /* 13F250 80137050 14200011 */      bnez $at, .L80137098
  /* 13F254 80137054 8FA60018 */        lw $a2, 0x18($sp)
  /* 13F258 80137058 00027080 */       sll $t6, $v0, 2
  /* 13F25C 8013705C 01C27023 */      subu $t6, $t6, $v0
  /* 13F260 80137060 000E7080 */       sll $t6, $t6, 2
  /* 13F264 80137064 01C27023 */      subu $t6, $t6, $v0
  /* 13F268 80137068 000E7080 */       sll $t6, $t6, 2
  /* 13F26C 8013706C 01C27021 */      addu $t6, $t6, $v0
  /* 13F270 80137070 25CFFF16 */     addiu $t7, $t6, -0xea
  /* 13F274 80137074 448F2000 */      mtc1 $t7, $f4
  /* 13F278 80137078 8CD80074 */        lw $t8, 0x74($a2)
  /* 13F27C 8013707C 3C0142B2 */       lui $at, (0x42B20000 >> 16) # 89.0
  /* 13F280 80137080 468021A0 */   cvt.s.w $f6, $f4
  /* 13F284 80137084 44814000 */      mtc1 $at, $f8 # 89.0 to cop1
  /* 13F288 80137088 E7060058 */      swc1 $f6, 0x58($t8)
  /* 13F28C 8013708C 8CD90074 */        lw $t9, 0x74($a2)
  /* 13F290 80137090 10000010 */         b .L801370D4
  /* 13F294 80137094 E728005C */      swc1 $f8, 0x5c($t9)
  .L80137098:
  /* 13F298 80137098 00024080 */       sll $t0, $v0, 2
  /* 13F29C 8013709C 01024023 */      subu $t0, $t0, $v0
  /* 13F2A0 801370A0 00084080 */       sll $t0, $t0, 2
  /* 13F2A4 801370A4 01024023 */      subu $t0, $t0, $v0
  /* 13F2A8 801370A8 00084080 */       sll $t0, $t0, 2
  /* 13F2AC 801370AC 01024021 */      addu $t0, $t0, $v0
  /* 13F2B0 801370B0 25090024 */     addiu $t1, $t0, 0x24
  /* 13F2B4 801370B4 44895000 */      mtc1 $t1, $f10
  /* 13F2B8 801370B8 8CCA0074 */        lw $t2, 0x74($a2)
  /* 13F2BC 801370BC 3C014238 */       lui $at, (0x42380000 >> 16) # 46.0
  /* 13F2C0 801370C0 46805420 */   cvt.s.w $f16, $f10
  /* 13F2C4 801370C4 44819000 */      mtc1 $at, $f18 # 46.0 to cop1
  /* 13F2C8 801370C8 E5500058 */      swc1 $f16, 0x58($t2)
  /* 13F2CC 801370CC 8CCB0074 */        lw $t3, 0x74($a2)
  /* 13F2D0 801370D0 E572005C */      swc1 $f18, 0x5c($t3)
  .L801370D4:
  /* 13F2D4 801370D4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13F2D8 801370D8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13F2DC 801370DC 03E00008 */        jr $ra
  /* 13F2E0 801370E0 00000000 */       nop

  /* 13F2E4 801370E4 03E00008 */        jr $ra
  /* 13F2E8 801370E8 00000000 */       nop

glabel mn1PMoveToken
  /* 13F2EC 801370EC 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13F2F0 801370F0 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13F2F4 801370F4 8C6E0004 */        lw $t6, 4($v1) # gMN1PPanel + 4
  /* 13F2F8 801370F8 AFA40000 */        sw $a0, ($sp)
  /* 13F2FC 801370FC C4660060 */      lwc1 $f6, 0x60($v1) # gMN1PPanel + 96
  /* 13F300 80137100 8DC20074 */        lw $v0, 0x74($t6)
  /* 13F304 80137104 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 13F308 80137108 46062200 */     add.s $f8, $f4, $f6
  /* 13F30C 8013710C E4480058 */      swc1 $f8, 0x58($v0)
  /* 13F310 80137110 8C6F0004 */        lw $t7, 4($v1) # gMN1PPanel + 4
  /* 13F314 80137114 C4700064 */      lwc1 $f16, 0x64($v1) # gMN1PPanel + 100
  /* 13F318 80137118 8DE20074 */        lw $v0, 0x74($t7)
  /* 13F31C 8013711C C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 13F320 80137120 46105480 */     add.s $f18, $f10, $f16
  /* 13F324 80137124 03E00008 */        jr $ra
  /* 13F328 80137128 E452005C */      swc1 $f18, 0x5c($v0)

glabel mn1PSyncTokenAndFighter
  /* 13F32C 8013712C 3C0F8014 */       lui $t7, %hi(gMN1PFramesElapsed)
  /* 13F330 80137130 8DEF8F74 */        lw $t7, %lo(gMN1PFramesElapsed)($t7)
  /* 13F334 80137134 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 13F338 80137138 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13F33C 8013713C 8C8E0084 */        lw $t6, 0x84($a0)
  /* 13F340 80137140 29E1001E */      slti $at, $t7, 0x1e
  /* 13F344 80137144 10200006 */      beqz $at, .L80137160
  /* 13F348 80137148 AFAE0018 */        sw $t6, 0x18($sp)
  /* 13F34C 8013714C 24180001 */     addiu $t8, $zero, 1
  /* 13F350 80137150 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13F354 80137154 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13F358 80137158 10000011 */         b .L801371A0
  /* 13F35C 8013715C AC98007C */        sw $t8, 0x7c($a0)
  .L80137160:
  /* 13F360 80137160 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13F364 80137164 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13F368 80137168 8C790028 */        lw $t9, 0x28($v1) # gMN1PPanel + 40
  /* 13F36C 8013716C 17200009 */      bnez $t9, .L80137194
  /* 13F370 80137170 00000000 */       nop
  /* 13F374 80137174 8C68002C */        lw $t0, 0x2c($v1) # gMN1PPanel + 44
  /* 13F378 80137178 24020001 */     addiu $v0, $zero, 1
  /* 13F37C 8013717C 10480005 */       beq $v0, $t0, .L80137194
  /* 13F380 80137180 00000000 */       nop
  /* 13F384 80137184 8C690030 */        lw $t1, 0x30($v1) # gMN1PPanel + 48
  /* 13F388 80137188 240A0001 */     addiu $t2, $zero, 1
  /* 13F38C 8013718C 54490004 */      bnel $v0, $t1, .L801371A0
  /* 13F390 80137190 AC8A007C */        sw $t2, 0x7c($a0)
  .L80137194:
  /* 13F394 80137194 10000002 */         b .L801371A0
  /* 13F398 80137198 AC80007C */        sw $zero, 0x7c($a0)
  /* 13F39C 8013719C AC8A007C */        sw $t2, 0x7c($a0)
  .L801371A0:
  /* 13F3A0 801371A0 8C6B002C */        lw $t3, 0x2c($v1) # gMN1PPanel + 44
  /* 13F3A4 801371A4 15600019 */      bnez $t3, .L8013720C
  /* 13F3A8 801371A8 00000000 */       nop
  /* 13F3AC 801371AC 8C6C0050 */        lw $t4, 0x50($v1) # gMN1PPanel + 80
  /* 13F3B0 801371B0 24010004 */     addiu $at, $zero, 4
  /* 13F3B4 801371B4 11810015 */       beq $t4, $at, .L8013720C
  /* 13F3B8 801371B8 00000000 */       nop
  /* 13F3BC 801371BC 8C6D0070 */        lw $t5, 0x70($v1) # gMN1PPanel + 112
  /* 13F3C0 801371C0 15A00014 */      bnez $t5, .L80137214
  /* 13F3C4 801371C4 00000000 */       nop
  /* 13F3C8 801371C8 8C6E0000 */        lw $t6, ($v1) # gMN1PPanel + 0
  /* 13F3CC 801371CC 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 13F3D0 801371D0 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 13F3D4 801371D4 8DCF0074 */        lw $t7, 0x74($t6)
  /* 13F3D8 801371D8 8C980074 */        lw $t8, 0x74($a0)
  /* 13F3DC 801371DC 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 13F3E0 801371E0 C5E40058 */      lwc1 $f4, 0x58($t7)
  /* 13F3E4 801371E4 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 13F3E8 801371E8 46062200 */     add.s $f8, $f4, $f6
  /* 13F3EC 801371EC E7080058 */      swc1 $f8, 0x58($t8)
  /* 13F3F0 801371F0 8C790000 */        lw $t9, ($v1) # gMN1PPanel + 0
  /* 13F3F4 801371F4 8C890074 */        lw $t1, 0x74($a0)
  /* 13F3F8 801371F8 8F280074 */        lw $t0, 0x74($t9)
  /* 13F3FC 801371FC C50A005C */      lwc1 $f10, 0x5c($t0)
  /* 13F400 80137200 46105480 */     add.s $f18, $f10, $f16
  /* 13F404 80137204 10000003 */         b .L80137214
  /* 13F408 80137208 E532005C */      swc1 $f18, 0x5c($t1)
  .L8013720C:
  /* 13F40C 8013720C 0C04DC3B */       jal mn1PMoveToken
  /* 13F410 80137210 8FA40018 */        lw $a0, 0x18($sp)
  .L80137214:
  /* 13F414 80137214 0C04D814 */       jal mn1PGetFtKindFromTokenPosition
  /* 13F418 80137218 8FA40018 */        lw $a0, 0x18($sp)
  /* 13F41C 8013721C 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13F420 80137220 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13F424 80137224 8C6A002C */        lw $t2, 0x2c($v1) # gMN1PPanel + 44
  /* 13F428 80137228 15400009 */      bnez $t2, .L80137250
  /* 13F42C 8013722C 00000000 */       nop
  /* 13F430 80137230 8C6B0020 */        lw $t3, 0x20($v1) # gMN1PPanel + 32
  /* 13F434 80137234 104B0006 */       beq $v0, $t3, .L80137250
  /* 13F438 80137238 00000000 */       nop
  /* 13F43C 8013723C AC620020 */        sw $v0, 0x20($v1) # gMN1PPanel + 32
  /* 13F440 80137240 0C04D601 */       jal mn1PSyncFighterDisplay
  /* 13F444 80137244 8FA40018 */        lw $a0, 0x18($sp)
  /* 13F448 80137248 0C04D631 */       jal mn1PSyncNameAndLogo
  /* 13F44C 8013724C 8FA40018 */        lw $a0, 0x18($sp)
  .L80137250:
  /* 13F450 80137250 0C04D2CF */       jal mn1PDrawHighscoreAndBonuses
  /* 13F454 80137254 00000000 */       nop
  /* 13F458 80137258 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13F45C 8013725C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 13F460 80137260 03E00008 */        jr $ra
  /* 13F464 80137264 00000000 */       nop

glabel mn1PCreateCursorViewport
  /* 13F468 80137268 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13F46C 8013726C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13F470 80137270 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13F474 80137274 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13F478 80137278 240F000D */     addiu $t7, $zero, 0xd
  /* 13F47C 8013727C 24180000 */     addiu $t8, $zero, 0
  /* 13F480 80137280 3C194000 */       lui $t9, 0x4000
  /* 13F484 80137284 2408FFFF */     addiu $t0, $zero, -1
  /* 13F488 80137288 24090001 */     addiu $t1, $zero, 1
  /* 13F48C 8013728C 240A0001 */     addiu $t2, $zero, 1
  /* 13F490 80137290 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13F494 80137294 AFA90028 */        sw $t1, 0x28($sp)
  /* 13F498 80137298 AFA80020 */        sw $t0, 0x20($sp)
  /* 13F49C 8013729C AFB9001C */        sw $t9, 0x1c($sp)
  /* 13F4A0 801372A0 AFB80018 */        sw $t8, 0x18($sp)
  /* 13F4A4 801372A4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13F4A8 801372A8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13F4AC 801372AC AFA00024 */        sw $zero, 0x24($sp)
  /* 13F4B0 801372B0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13F4B4 801372B4 AFA00034 */        sw $zero, 0x34($sp)
  /* 13F4B8 801372B8 24040401 */     addiu $a0, $zero, 0x401
  /* 13F4BC 801372BC 00002825 */        or $a1, $zero, $zero
  /* 13F4C0 801372C0 24060010 */     addiu $a2, $zero, 0x10
  /* 13F4C4 801372C4 0C002E4F */       jal func_8000B93C
  /* 13F4C8 801372C8 3C078000 */       lui $a3, 0x8000
  /* 13F4CC 801372CC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13F4D0 801372D0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13F4D4 801372D4 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13F4D8 801372D8 8C430074 */        lw $v1, 0x74($v0)
  /* 13F4DC 801372DC 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13F4E0 801372E0 44050000 */      mfc1 $a1, $f0
  /* 13F4E4 801372E4 44060000 */      mfc1 $a2, $f0
  /* 13F4E8 801372E8 3C07439B */       lui $a3, 0x439b
  /* 13F4EC 801372EC 24640008 */     addiu $a0, $v1, 8
  /* 13F4F0 801372F0 0C001C20 */       jal func_80007080
  /* 13F4F4 801372F4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13F4F8 801372F8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13F4FC 801372FC 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13F500 80137300 03E00008 */        jr $ra
  /* 13F504 80137304 00000000 */       nop

glabel mn1PCreateDroppedTokenViewport
  /* 13F508 80137308 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13F50C 8013730C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13F510 80137310 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13F514 80137314 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13F518 80137318 240F000F */     addiu $t7, $zero, 0xf
  /* 13F51C 8013731C 24180000 */     addiu $t8, $zero, 0
  /* 13F520 80137320 3C198000 */       lui $t9, 0x8000
  /* 13F524 80137324 2408FFFF */     addiu $t0, $zero, -1
  /* 13F528 80137328 24090001 */     addiu $t1, $zero, 1
  /* 13F52C 8013732C 240A0001 */     addiu $t2, $zero, 1
  /* 13F530 80137330 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13F534 80137334 AFA90028 */        sw $t1, 0x28($sp)
  /* 13F538 80137338 AFA80020 */        sw $t0, 0x20($sp)
  /* 13F53C 8013733C AFB9001C */        sw $t9, 0x1c($sp)
  /* 13F540 80137340 AFB80018 */        sw $t8, 0x18($sp)
  /* 13F544 80137344 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13F548 80137348 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13F54C 8013734C AFA00024 */        sw $zero, 0x24($sp)
  /* 13F550 80137350 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13F554 80137354 AFA00034 */        sw $zero, 0x34($sp)
  /* 13F558 80137358 24040401 */     addiu $a0, $zero, 0x401
  /* 13F55C 8013735C 00002825 */        or $a1, $zero, $zero
  /* 13F560 80137360 24060010 */     addiu $a2, $zero, 0x10
  /* 13F564 80137364 0C002E4F */       jal func_8000B93C
  /* 13F568 80137368 3C078000 */       lui $a3, 0x8000
  /* 13F56C 8013736C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13F570 80137370 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13F574 80137374 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13F578 80137378 8C430074 */        lw $v1, 0x74($v0)
  /* 13F57C 8013737C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13F580 80137380 44050000 */      mfc1 $a1, $f0
  /* 13F584 80137384 44060000 */      mfc1 $a2, $f0
  /* 13F588 80137388 3C07439B */       lui $a3, 0x439b
  /* 13F58C 8013738C 24640008 */     addiu $a0, $v1, 8
  /* 13F590 80137390 0C001C20 */       jal func_80007080
  /* 13F594 80137394 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13F598 80137398 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13F59C 8013739C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13F5A0 801373A0 03E00008 */        jr $ra
  /* 13F5A4 801373A4 00000000 */       nop

glabel mn1PCreateReadyToFightViewport
  /* 13F5A8 801373A8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 13F5AC 801373AC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 13F5B0 801373B0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 13F5B4 801373B4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 13F5B8 801373B8 240F000A */     addiu $t7, $zero, 0xa
  /* 13F5BC 801373BC 24180008 */     addiu $t8, $zero, 8
  /* 13F5C0 801373C0 24190000 */     addiu $t9, $zero, 0
  /* 13F5C4 801373C4 2408FFFF */     addiu $t0, $zero, -1
  /* 13F5C8 801373C8 24090001 */     addiu $t1, $zero, 1
  /* 13F5CC 801373CC 240A0001 */     addiu $t2, $zero, 1
  /* 13F5D0 801373D0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 13F5D4 801373D4 AFA90028 */        sw $t1, 0x28($sp)
  /* 13F5D8 801373D8 AFA80020 */        sw $t0, 0x20($sp)
  /* 13F5DC 801373DC AFB9001C */        sw $t9, 0x1c($sp)
  /* 13F5E0 801373E0 AFB80018 */        sw $t8, 0x18($sp)
  /* 13F5E4 801373E4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 13F5E8 801373E8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13F5EC 801373EC AFA00024 */        sw $zero, 0x24($sp)
  /* 13F5F0 801373F0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 13F5F4 801373F4 AFA00034 */        sw $zero, 0x34($sp)
  /* 13F5F8 801373F8 24040401 */     addiu $a0, $zero, 0x401
  /* 13F5FC 801373FC 00002825 */        or $a1, $zero, $zero
  /* 13F600 80137400 24060010 */     addiu $a2, $zero, 0x10
  /* 13F604 80137404 0C002E4F */       jal func_8000B93C
  /* 13F608 80137408 3C078000 */       lui $a3, 0x8000
  /* 13F60C 8013740C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13F610 80137410 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 13F614 80137414 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 13F618 80137418 8C430074 */        lw $v1, 0x74($v0)
  /* 13F61C 8013741C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 13F620 80137420 44050000 */      mfc1 $a1, $f0
  /* 13F624 80137424 44060000 */      mfc1 $a2, $f0
  /* 13F628 80137428 3C07439B */       lui $a3, 0x439b
  /* 13F62C 8013742C 24640008 */     addiu $a0, $v1, 8
  /* 13F630 80137430 0C001C20 */       jal func_80007080
  /* 13F634 80137434 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 13F638 80137438 8FBF003C */        lw $ra, 0x3c($sp)
  /* 13F63C 8013743C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 13F640 80137440 03E00008 */        jr $ra
  /* 13F644 80137444 00000000 */       nop

glabel mn1PCreateCursor
  /* 13F648 80137448 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 13F64C 8013744C 3C0F8014 */       lui $t7, %hi(dMN1PCursorTypeOffsetsUnused)
  /* 13F650 80137450 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13F654 80137454 AFA40060 */        sw $a0, 0x60($sp)
  /* 13F658 80137458 25EF8C20 */     addiu $t7, $t7, %lo(dMN1PCursorTypeOffsetsUnused)
  /* 13F65C 8013745C 8DF90000 */        lw $t9, ($t7) # dMN1PCursorTypeOffsetsUnused + 0
  /* 13F660 80137460 8DF80004 */        lw $t8, 4($t7) # dMN1PCursorTypeOffsetsUnused + 4
  /* 13F664 80137464 27AE0048 */     addiu $t6, $sp, 0x48
  /* 13F668 80137468 ADD90000 */        sw $t9, ($t6)
  /* 13F66C 8013746C ADD80004 */        sw $t8, 4($t6)
  /* 13F670 80137470 8DF8000C */        lw $t8, 0xc($t7) # dMN1PCursorTypeOffsetsUnused + 12
  /* 13F674 80137474 8DF90008 */        lw $t9, 8($t7) # dMN1PCursorTypeOffsetsUnused + 8
  /* 13F678 80137478 3C088014 */       lui $t0, %hi(dMN1PCursorStartingDisplayOrders)
  /* 13F67C 8013747C 25088C30 */     addiu $t0, $t0, %lo(dMN1PCursorStartingDisplayOrders)
  /* 13F680 80137480 ADD8000C */        sw $t8, 0xc($t6)
  /* 13F684 80137484 ADD90008 */        sw $t9, 8($t6)
  /* 13F688 80137488 8D0A0000 */        lw $t2, ($t0) # dMN1PCursorStartingDisplayOrders + 0
  /* 13F68C 8013748C 27A20038 */     addiu $v0, $sp, 0x38
  /* 13F690 80137490 3C0B800D */       lui $t3, %hi(func_ovl0_800CCF00)
  /* 13F694 80137494 AC4A0000 */        sw $t2, ($v0)
  /* 13F698 80137498 8D090004 */        lw $t1, 4($t0) # dMN1PCursorStartingDisplayOrders + 4
  /* 13F69C 8013749C 256BCF00 */     addiu $t3, $t3, %lo(func_ovl0_800CCF00)
  /* 13F6A0 801374A0 240C001E */     addiu $t4, $zero, 0x1e
  /* 13F6A4 801374A4 AC490004 */        sw $t1, 4($v0)
  /* 13F6A8 801374A8 8D0A0008 */        lw $t2, 8($t0) # dMN1PCursorStartingDisplayOrders + 8
  /* 13F6AC 801374AC 2419FFFF */     addiu $t9, $zero, -1
  /* 13F6B0 801374B0 00002025 */        or $a0, $zero, $zero
  /* 13F6B4 801374B4 AC4A0008 */        sw $t2, 8($v0)
  /* 13F6B8 801374B8 8D09000C */        lw $t1, 0xc($t0) # dMN1PCursorStartingDisplayOrders + 12
  /* 13F6BC 801374BC 3C088014 */       lui $t0, %hi(D_ovl27_801396A0)
  /* 13F6C0 801374C0 00002825 */        or $a1, $zero, $zero
  /* 13F6C4 801374C4 AC49000C */        sw $t1, 0xc($v0)
  /* 13F6C8 801374C8 8FAD0060 */        lw $t5, 0x60($sp)
  /* 13F6CC 801374CC AFAC0014 */        sw $t4, 0x14($sp)
  /* 13F6D0 801374D0 AFAB0010 */        sw $t3, 0x10($sp)
  /* 13F6D4 801374D4 000D7080 */       sll $t6, $t5, 2
  /* 13F6D8 801374D8 004E7821 */      addu $t7, $v0, $t6
  /* 13F6DC 801374DC 8DF80000 */        lw $t8, ($t7) # dMN1PCursorTypeOffsetsUnused + 0
  /* 13F6E0 801374E0 8D0896A0 */        lw $t0, %lo(D_ovl27_801396A0)($t0)
  /* 13F6E4 801374E4 3C090000 */       lui $t1, %hi(D_NF_000076E8)
  /* 13F6E8 801374E8 252976E8 */     addiu $t1, $t1, %lo(D_NF_000076E8)
  /* 13F6EC 801374EC 3C0C8013 */       lui $t4, %hi(mn1PHandleButtonPresses)
  /* 13F6F0 801374F0 258C6D58 */     addiu $t4, $t4, %lo(mn1PHandleButtonPresses)
  /* 13F6F4 801374F4 240D0002 */     addiu $t5, $zero, 2
  /* 13F6F8 801374F8 240B0001 */     addiu $t3, $zero, 1
  /* 13F6FC 801374FC 01095021 */      addu $t2, $t0, $t1
  /* 13F700 80137500 AFAA0020 */        sw $t2, 0x20($sp)
  /* 13F704 80137504 AFAB0024 */        sw $t3, 0x24($sp)
  /* 13F708 80137508 AFAD002C */        sw $t5, 0x2c($sp)
  /* 13F70C 8013750C AFAC0028 */        sw $t4, 0x28($sp)
  /* 13F710 80137510 AFB9001C */        sw $t9, 0x1c($sp)
  /* 13F714 80137514 24060013 */     addiu $a2, $zero, 0x13
  /* 13F718 80137518 3C078000 */       lui $a3, 0x8000
  /* 13F71C 8013751C 0C033414 */       jal func_ovl0_800CD050
  /* 13F720 80137520 AFB80018 */        sw $t8, 0x18($sp)
  /* 13F724 80137524 8FA50060 */        lw $a1, 0x60($sp)
  /* 13F728 80137528 3C018014 */       lui $at, %hi(gMN1PPanel)
  /* 13F72C 8013752C 00402025 */        or $a0, $v0, $zero
  /* 13F730 80137530 AC450084 */        sw $a1, 0x84($v0)
  /* 13F734 80137534 AC228EE8 */        sw $v0, %lo(gMN1PPanel)($at)
  /* 13F738 80137538 3C014270 */       lui $at, (0x42700000 >> 16) # 60.0
  /* 13F73C 8013753C 44812000 */      mtc1 $at, $f4 # 60.0 to cop1
  /* 13F740 80137540 8C4E0074 */        lw $t6, 0x74($v0)
  /* 13F744 80137544 3C01432A */       lui $at, (0x432A0000 >> 16) # 170.0
  /* 13F748 80137548 44813000 */      mtc1 $at, $f6 # 170.0 to cop1
  /* 13F74C 8013754C E5C40058 */      swc1 $f4, 0x58($t6)
  /* 13F750 80137550 8C4F0074 */        lw $t7, 0x74($v0)
  /* 13F754 80137554 00003025 */        or $a2, $zero, $zero
  /* 13F758 80137558 E5E6005C */      swc1 $f6, 0x5c($t7)
  /* 13F75C 8013755C 8C430074 */        lw $v1, 0x74($v0)
  /* 13F760 80137560 94780024 */       lhu $t8, 0x24($v1)
  /* 13F764 80137564 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 13F768 80137568 A4790024 */        sh $t9, 0x24($v1)
  /* 13F76C 8013756C 8C430074 */        lw $v1, 0x74($v0)
  /* 13F770 80137570 94680024 */       lhu $t0, 0x24($v1)
  /* 13F774 80137574 35090001 */       ori $t1, $t0, 1
  /* 13F778 80137578 0C04D4AF */       jal mn1PRedrawCursor
  /* 13F77C 8013757C A4690024 */        sh $t1, 0x24($v1)
  /* 13F780 80137580 8FBF0034 */        lw $ra, 0x34($sp)
  /* 13F784 80137584 27BD0060 */     addiu $sp, $sp, 0x60
  /* 13F788 80137588 03E00008 */        jr $ra
  /* 13F78C 8013758C 00000000 */       nop

glabel mn1PCreateToken
  /* 13F790 80137590 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 13F794 80137594 3C0E8014 */       lui $t6, %hi(dMN1PTokenOffsetsNoCPU)
  /* 13F798 80137598 AFBF0034 */        sw $ra, 0x34($sp)
  /* 13F79C 8013759C AFA40068 */        sw $a0, 0x68($sp)
  /* 13F7A0 801375A0 25CE8C40 */     addiu $t6, $t6, %lo(dMN1PTokenOffsetsNoCPU)
  /* 13F7A4 801375A4 8DD80000 */        lw $t8, ($t6) # dMN1PTokenOffsetsNoCPU + 0
  /* 13F7A8 801375A8 27A30050 */     addiu $v1, $sp, 0x50
  /* 13F7AC 801375AC 3C198014 */       lui $t9, %hi(dMN1PTokenStartingDisplayOrders)
  /* 13F7B0 801375B0 AC780000 */        sw $t8, ($v1)
  /* 13F7B4 801375B4 8DCF0004 */        lw $t7, 4($t6) # dMN1PTokenOffsetsNoCPU + 4
  /* 13F7B8 801375B8 27398C50 */     addiu $t9, $t9, %lo(dMN1PTokenStartingDisplayOrders)
  /* 13F7BC 801375BC 27A80040 */     addiu $t0, $sp, 0x40
  /* 13F7C0 801375C0 AC6F0004 */        sw $t7, 4($v1)
  /* 13F7C4 801375C4 8DD80008 */        lw $t8, 8($t6) # dMN1PTokenOffsetsNoCPU + 8
  /* 13F7C8 801375C8 3C0B800D */       lui $t3, %hi(func_ovl0_800CCF00)
  /* 13F7CC 801375CC 256BCF00 */     addiu $t3, $t3, %lo(func_ovl0_800CCF00)
  /* 13F7D0 801375D0 AC780008 */        sw $t8, 8($v1)
  /* 13F7D4 801375D4 8DCF000C */        lw $t7, 0xc($t6) # dMN1PTokenOffsetsNoCPU + 12
  /* 13F7D8 801375D8 240C001F */     addiu $t4, $zero, 0x1f
  /* 13F7DC 801375DC 00002025 */        or $a0, $zero, $zero
  /* 13F7E0 801375E0 AC6F000C */        sw $t7, 0xc($v1)
  /* 13F7E4 801375E4 8F2A0000 */        lw $t2, ($t9) # dMN1PTokenStartingDisplayOrders + 0
  /* 13F7E8 801375E8 240FFFFF */     addiu $t7, $zero, -1
  /* 13F7EC 801375EC 00002825 */        or $a1, $zero, $zero
  /* 13F7F0 801375F0 AD0A0000 */        sw $t2, ($t0)
  /* 13F7F4 801375F4 8F290004 */        lw $t1, 4($t9) # dMN1PTokenStartingDisplayOrders + 4
  /* 13F7F8 801375F8 24060014 */     addiu $a2, $zero, 0x14
  /* 13F7FC 801375FC 3C078000 */       lui $a3, 0x8000
  /* 13F800 80137600 AD090004 */        sw $t1, 4($t0)
  /* 13F804 80137604 8F2A0008 */        lw $t2, 8($t9) # dMN1PTokenStartingDisplayOrders + 8
  /* 13F808 80137608 AD0A0008 */        sw $t2, 8($t0)
  /* 13F80C 8013760C 8F29000C */        lw $t1, 0xc($t9) # dMN1PTokenStartingDisplayOrders + 12
  /* 13F810 80137610 AD09000C */        sw $t1, 0xc($t0)
  /* 13F814 80137614 8FA20068 */        lw $v0, 0x68($sp)
  /* 13F818 80137618 AFAC0014 */        sw $t4, 0x14($sp)
  /* 13F81C 8013761C AFAB0010 */        sw $t3, 0x10($sp)
  /* 13F820 80137620 00021080 */       sll $v0, $v0, 2
  /* 13F824 80137624 01026821 */      addu $t5, $t0, $v0
  /* 13F828 80137628 8DAE0000 */        lw $t6, ($t5)
  /* 13F82C 8013762C AFAF001C */        sw $t7, 0x1c($sp)
  /* 13F830 80137630 0062C021 */      addu $t8, $v1, $v0
  /* 13F834 80137634 3C098014 */       lui $t1, %hi(D_ovl27_801396A0)
  /* 13F838 80137638 AFAE0018 */        sw $t6, 0x18($sp)
  /* 13F83C 8013763C 8F190000 */        lw $t9, ($t8)
  /* 13F840 80137640 8D2996A0 */        lw $t1, %lo(D_ovl27_801396A0)($t1)
  /* 13F844 80137644 3C0C8013 */       lui $t4, %hi(mn1PSyncTokenAndFighter)
  /* 13F848 80137648 258C712C */     addiu $t4, $t4, %lo(mn1PSyncTokenAndFighter)
  /* 13F84C 8013764C 240D0001 */     addiu $t5, $zero, 1
  /* 13F850 80137650 240B0001 */     addiu $t3, $zero, 1
  /* 13F854 80137654 03295021 */      addu $t2, $t9, $t1
  /* 13F858 80137658 AFAA0020 */        sw $t2, 0x20($sp)
  /* 13F85C 8013765C AFAB0024 */        sw $t3, 0x24($sp)
  /* 13F860 80137660 AFAD002C */        sw $t5, 0x2c($sp)
  /* 13F864 80137664 0C033414 */       jal func_ovl0_800CD050
  /* 13F868 80137668 AFAC0028 */        sw $t4, 0x28($sp)
  /* 13F86C 8013766C 8FAE0068 */        lw $t6, 0x68($sp)
  /* 13F870 80137670 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13F874 80137674 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13F878 80137678 AC4E0084 */        sw $t6, 0x84($v0)
  /* 13F87C 8013767C 8C650020 */        lw $a1, 0x20($v1) # gMN1PPanel + 32
  /* 13F880 80137680 2401001C */     addiu $at, $zero, 0x1c
  /* 13F884 80137684 00402025 */        or $a0, $v0, $zero
  /* 13F888 80137688 14A1000A */       bne $a1, $at, .L801376B4
  /* 13F88C 8013768C AC620004 */        sw $v0, 4($v1) # gMN1PPanel + 4
  /* 13F890 80137690 3C01424C */       lui $at, (0x424C0000 >> 16) # 51.0
  /* 13F894 80137694 44812000 */      mtc1 $at, $f4 # 51.0 to cop1
  /* 13F898 80137698 8C4F0074 */        lw $t7, 0x74($v0)
  /* 13F89C 8013769C 3C014321 */       lui $at, (0x43210000 >> 16) # 161.0
  /* 13F8A0 801376A0 44813000 */      mtc1 $at, $f6 # 161.0 to cop1
  /* 13F8A4 801376A4 E5E40058 */      swc1 $f4, 0x58($t7)
  /* 13F8A8 801376A8 8C580074 */        lw $t8, 0x74($v0)
  /* 13F8AC 801376AC 10000004 */         b .L801376C0
  /* 13F8B0 801376B0 E706005C */      swc1 $f6, 0x5c($t8)
  .L801376B4:
  /* 13F8B4 801376B4 0C04DC0D */       jal mn1PCenterTokenInPortrait
  /* 13F8B8 801376B8 AFA40064 */        sw $a0, 0x64($sp)
  /* 13F8BC 801376BC 8FA40064 */        lw $a0, 0x64($sp)
  .L801376C0:
  /* 13F8C0 801376C0 8C820074 */        lw $v0, 0x74($a0)
  /* 13F8C4 801376C4 94590024 */       lhu $t9, 0x24($v0)
  /* 13F8C8 801376C8 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 13F8CC 801376CC A4490024 */        sh $t1, 0x24($v0)
  /* 13F8D0 801376D0 8C820074 */        lw $v0, 0x74($a0)
  /* 13F8D4 801376D4 944A0024 */       lhu $t2, 0x24($v0)
  /* 13F8D8 801376D8 354B0001 */       ori $t3, $t2, 1
  /* 13F8DC 801376DC A44B0024 */        sh $t3, 0x24($v0)
  /* 13F8E0 801376E0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 13F8E4 801376E4 27BD0068 */     addiu $sp, $sp, 0x68
  /* 13F8E8 801376E8 03E00008 */        jr $ra
  /* 13F8EC 801376EC 00000000 */       nop

  /* 13F8F0 801376F0 03E00008 */        jr $ra
  /* 13F8F4 801376F4 00000000 */       nop

glabel mn1PAutopositionTokenFromPortraitEdges
  /* 13F8F8 801376F8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13F8FC 801376FC 3C058014 */       lui $a1, %hi(gMN1PPanel)
  /* 13F900 80137700 24A58EE8 */     addiu $a1, $a1, %lo(gMN1PPanel)
  /* 13F904 80137704 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13F908 80137708 AFA40018 */        sw $a0, 0x18($sp)
  /* 13F90C 8013770C 0C04C9FB */       jal mn1PGetPortraitId
  /* 13F910 80137710 8CA40020 */        lw $a0, 0x20($a1) # gMN1PPanel + 32
  /* 13F914 80137714 3C058014 */       lui $a1, %hi(gMN1PPanel)
  /* 13F918 80137718 28410006 */      slti $at, $v0, 6
  /* 13F91C 8013771C 14200003 */      bnez $at, .L8013772C
  /* 13F920 80137720 24A58EE8 */     addiu $a1, $a1, %lo(gMN1PPanel)
  /* 13F924 80137724 10000002 */         b .L80137730
  /* 13F928 80137728 2443FFFA */     addiu $v1, $v0, -6
  .L8013772C:
  /* 13F92C 8013772C 00401825 */        or $v1, $v0, $zero
  .L80137730:
  /* 13F930 80137730 00037080 */       sll $t6, $v1, 2
  /* 13F934 80137734 01C37023 */      subu $t6, $t6, $v1
  /* 13F938 80137738 000E7080 */       sll $t6, $t6, 2
  /* 13F93C 8013773C 01C37023 */      subu $t6, $t6, $v1
  /* 13F940 80137740 000E7080 */       sll $t6, $t6, 2
  /* 13F944 80137744 01C37021 */      addu $t6, $t6, $v1
  /* 13F948 80137748 25CF0019 */     addiu $t7, $t6, 0x19
  /* 13F94C 8013774C 448F2000 */      mtc1 $t7, $f4
  /* 13F950 80137750 28410006 */      slti $at, $v0, 6
  /* 13F954 80137754 14200003 */      bnez $at, .L80137764
  /* 13F958 80137758 468023A0 */   cvt.s.w $f14, $f4
  /* 13F95C 8013775C 10000002 */         b .L80137768
  /* 13F960 80137760 24030001 */     addiu $v1, $zero, 1
  .L80137764:
  /* 13F964 80137764 00001825 */        or $v1, $zero, $zero
  .L80137768:
  /* 13F968 80137768 8CB80004 */        lw $t8, 4($a1) # gMN1PPanel + 4
  /* 13F96C 8013776C C4A80060 */      lwc1 $f8, 0x60($a1) # gMN1PPanel + 96
  /* 13F970 80137770 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 13F974 80137774 8F020074 */        lw $v0, 0x74($t8)
  /* 13F978 80137778 44818000 */      mtc1 $at, $f16 # 5.0 to cop1
  /* 13F97C 8013777C 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 13F980 80137780 C4460058 */      lwc1 $f6, 0x58($v0)
  /* 13F984 80137784 44812000 */      mtc1 $at, $f4 # 13.0 to cop1
  /* 13F988 80137788 46107300 */     add.s $f12, $f14, $f16
  /* 13F98C 8013778C 0003C880 */       sll $t9, $v1, 2
  /* 13F990 80137790 0323C823 */      subu $t9, $t9, $v1
  /* 13F994 80137794 46083280 */     add.s $f10, $f6, $f8
  /* 13F998 80137798 C4A80064 */      lwc1 $f8, 0x64($a1) # gMN1PPanel + 100
  /* 13F99C 8013779C C446005C */      lwc1 $f6, 0x5c($v0)
  /* 13F9A0 801377A0 0019C880 */       sll $t9, $t9, 2
  /* 13F9A4 801377A4 46045000 */     add.s $f0, $f10, $f4
  /* 13F9A8 801377A8 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 13F9AC 801377AC 0323C823 */      subu $t9, $t9, $v1
  /* 13F9B0 801377B0 46083280 */     add.s $f10, $f6, $f8
  /* 13F9B4 801377B4 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 13F9B8 801377B8 0019C880 */       sll $t9, $t9, 2
  /* 13F9BC 801377BC 460C003C */    c.lt.s $f0, $f12
  /* 13F9C0 801377C0 0323C823 */      subu $t9, $t9, $v1
  /* 13F9C4 801377C4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13F9C8 801377C8 27280024 */     addiu $t0, $t9, 0x24
  /* 13F9CC 801377CC 45000006 */      bc1f .L801377E8
  /* 13F9D0 801377D0 46045080 */     add.s $f2, $f10, $f4
  /* 13F9D4 801377D4 46006181 */     sub.s $f6, $f12, $f0
  /* 13F9D8 801377D8 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 13F9DC 801377DC 00000000 */       nop
  /* 13F9E0 801377E0 46123203 */     div.s $f8, $f6, $f18
  /* 13F9E4 801377E4 E4A80060 */      swc1 $f8, 0x60($a1) # gMN1PPanel + 96
  .L801377E8:
  /* 13F9E8 801377E8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13F9EC 801377EC 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 13F9F0 801377F0 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 13F9F4 801377F4 44815000 */      mtc1 $at, $f10 # 45.0 to cop1
  /* 13F9F8 801377F8 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13F9FC 801377FC 460A7100 */     add.s $f4, $f14, $f10
  /* 13FA00 80137800 46102301 */     sub.s $f12, $f4, $f16
  /* 13FA04 80137804 4600603C */    c.lt.s $f12, $f0
  /* 13FA08 80137808 00000000 */       nop
  /* 13FA0C 8013780C 45020008 */     bc1fl .L80137830
  /* 13FA10 80137810 44883000 */      mtc1 $t0, $f6
  /* 13FA14 80137814 460C0181 */     sub.s $f6, $f0, $f12
  /* 13FA18 80137818 44814000 */      mtc1 $at, $f8 # -1.0 to cop1
  /* 13FA1C 8013781C 00000000 */       nop
  /* 13FA20 80137820 46083282 */     mul.s $f10, $f6, $f8
  /* 13FA24 80137824 46125103 */     div.s $f4, $f10, $f18
  /* 13FA28 80137828 E4A40060 */      swc1 $f4, 0x60($a1) # gMN1PPanel + 96
  /* 13FA2C 8013782C 44883000 */      mtc1 $t0, $f6
  .L80137830:
  /* 13FA30 80137830 00000000 */       nop
  /* 13FA34 80137834 46803020 */   cvt.s.w $f0, $f6
  /* 13FA38 80137838 46100300 */     add.s $f12, $f0, $f16
  /* 13FA3C 8013783C 460C103C */    c.lt.s $f2, $f12
  /* 13FA40 80137840 00000000 */       nop
  /* 13FA44 80137844 45020006 */     bc1fl .L80137860
  /* 13FA48 80137848 3C01422C */       lui $at, 0x422c
  /* 13FA4C 8013784C 46026201 */     sub.s $f8, $f12, $f2
  /* 13FA50 80137850 3C018014 */       lui $at, %hi(D_ovl27_80138F4C)
  /* 13FA54 80137854 46124283 */     div.s $f10, $f8, $f18
  /* 13FA58 80137858 E42A8F4C */      swc1 $f10, %lo(D_ovl27_80138F4C)($at)
  /* 13FA5C 8013785C 3C01422C */       lui $at, (0x422C0000 >> 16) # 43.0
  .L80137860:
  /* 13FA60 80137860 44812000 */      mtc1 $at, $f4 # 43.0 to cop1
  /* 13FA64 80137864 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 13FA68 80137868 46040180 */     add.s $f6, $f0, $f4
  /* 13FA6C 8013786C 46103301 */     sub.s $f12, $f6, $f16
  /* 13FA70 80137870 4602603C */    c.lt.s $f12, $f2
  /* 13FA74 80137874 00000000 */       nop
  /* 13FA78 80137878 45020008 */     bc1fl .L8013789C
  /* 13FA7C 8013787C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FA80 80137880 460C1201 */     sub.s $f8, $f2, $f12
  /* 13FA84 80137884 44815000 */      mtc1 $at, $f10 # -1.0 to cop1
  /* 13FA88 80137888 3C018014 */       lui $at, %hi(D_ovl27_80138F4C)
  /* 13FA8C 8013788C 460A4102 */     mul.s $f4, $f8, $f10
  /* 13FA90 80137890 46122183 */     div.s $f6, $f4, $f18
  /* 13FA94 80137894 E4268F4C */      swc1 $f6, %lo(D_ovl27_80138F4C)($at)
  /* 13FA98 80137898 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013789C:
  /* 13FA9C 8013789C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FAA0 801378A0 03E00008 */        jr $ra
  /* 13FAA4 801378A4 00000000 */       nop

glabel mn1PAutopositionPlacedToken
  /* 13FAA8 801378A8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13FAAC 801378AC AFBF0014 */        sw $ra, 0x14($sp)
  /* 13FAB0 801378B0 0C04DDBE */       jal mn1PAutopositionTokenFromPortraitEdges
  /* 13FAB4 801378B4 00000000 */       nop
  /* 13FAB8 801378B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FABC 801378BC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FAC0 801378C0 03E00008 */        jr $ra
  /* 13FAC4 801378C4 00000000 */       nop

glabel mn1PAutopositionRecalledToken
  /* 13FAC8 801378C8 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 13FACC 801378CC 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 13FAD0 801378D0 8C4E004C */        lw $t6, 0x4c($v0) # gMN1PPanel + 76
  /* 13FAD4 801378D4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13FAD8 801378D8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13FADC 801378DC 25CF0001 */     addiu $t7, $t6, 1
  /* 13FAE0 801378E0 29E1000B */      slti $at, $t7, 0xb
  /* 13FAE4 801378E4 AC4F004C */        sw $t7, 0x4c($v0) # gMN1PPanel + 76
  /* 13FAE8 801378E8 10200019 */      beqz $at, .L80137950
  /* 13FAEC 801378EC 01E01825 */        or $v1, $t7, $zero
  /* 13FAF0 801378F0 C444003C */      lwc1 $f4, 0x3c($v0) # gMN1PPanel + 60
  /* 13FAF4 801378F4 C4460038 */      lwc1 $f6, 0x38($v0) # gMN1PPanel + 56
  /* 13FAF8 801378F8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 13FAFC 801378FC 44815000 */      mtc1 $at, $f10 # 10.0 to cop1
  /* 13FB00 80137900 46062201 */     sub.s $f8, $f4, $f6
  /* 13FB04 80137904 29E10006 */      slti $at, $t7, 6
  /* 13FB08 80137908 10200008 */      beqz $at, .L8013792C
  /* 13FB0C 8013790C 460A4083 */     div.s $f2, $f8, $f10
  /* 13FB10 80137910 C4500044 */      lwc1 $f16, 0x44($v0) # gMN1PPanel + 68
  /* 13FB14 80137914 C4520040 */      lwc1 $f18, 0x40($v0) # gMN1PPanel + 64
  /* 13FB18 80137918 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 13FB1C 8013791C 44813000 */      mtc1 $at, $f6 # 5.0 to cop1
  /* 13FB20 80137920 46128101 */     sub.s $f4, $f16, $f18
  /* 13FB24 80137924 10000007 */         b .L80137944
  /* 13FB28 80137928 46062003 */     div.s $f0, $f4, $f6
  .L8013792C:
  /* 13FB2C 8013792C C4480048 */      lwc1 $f8, 0x48($v0) # gMN1PPanel + 72
  /* 13FB30 80137930 C44A0044 */      lwc1 $f10, 0x44($v0) # gMN1PPanel + 68
  /* 13FB34 80137934 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 13FB38 80137938 44819000 */      mtc1 $at, $f18 # 5.0 to cop1
  /* 13FB3C 8013793C 460A4401 */     sub.s $f16, $f8, $f10
  /* 13FB40 80137940 46128003 */     div.s $f0, $f16, $f18
  .L80137944:
  /* 13FB44 80137944 E4420060 */      swc1 $f2, 0x60($v0) # gMN1PPanel + 96
  /* 13FB48 80137948 1000000C */         b .L8013797C
  /* 13FB4C 8013794C E4400064 */      swc1 $f0, 0x64($v0) # gMN1PPanel + 100
  .L80137950:
  /* 13FB50 80137950 2401000B */     addiu $at, $zero, 0xb
  /* 13FB54 80137954 5461000A */      bnel $v1, $at, .L80137980
  /* 13FB58 80137958 2401001E */     addiu $at, $zero, 0x1e
  /* 13FB5C 8013795C 0C04D767 */       jal mn1PHandleCursorPickup
  /* 13FB60 80137960 00000000 */       nop
  /* 13FB64 80137964 44800000 */      mtc1 $zero, $f0
  /* 13FB68 80137968 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 13FB6C 8013796C 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 13FB70 80137970 8C43004C */        lw $v1, 0x4c($v0) # gMN1PPanel + 76
  /* 13FB74 80137974 E4400060 */      swc1 $f0, 0x60($v0) # gMN1PPanel + 96
  /* 13FB78 80137978 E4400064 */      swc1 $f0, 0x64($v0) # gMN1PPanel + 100
  .L8013797C:
  /* 13FB7C 8013797C 2401001E */     addiu $at, $zero, 0x1e
  .L80137980:
  /* 13FB80 80137980 54610003 */      bnel $v1, $at, .L80137990
  /* 13FB84 80137984 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FB88 80137988 AC400030 */        sw $zero, 0x30($v0) # gMN1PPanel + 48
  /* 13FB8C 8013798C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137990:
  /* 13FB90 80137990 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FB94 80137994 03E00008 */        jr $ra
  /* 13FB98 80137998 00000000 */       nop

glabel mn1PAutopositionToken
  /* 13FB9C 8013799C 3C0E8014 */       lui $t6, %hi(D_ovl27_80138F18)
  /* 13FBA0 801379A0 8DCE8F18 */        lw $t6, %lo(D_ovl27_80138F18)($t6)
  /* 13FBA4 801379A4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13FBA8 801379A8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13FBAC 801379AC 11C00004 */      beqz $t6, .L801379C0
  /* 13FBB0 801379B0 AFA40018 */        sw $a0, 0x18($sp)
  /* 13FBB4 801379B4 3C048014 */       lui $a0, %hi(gMN1PHumanPanelPort)
  /* 13FBB8 801379B8 0C04DE32 */       jal mn1PAutopositionRecalledToken
  /* 13FBBC 801379BC 8C848FA8 */        lw $a0, %lo(gMN1PHumanPanelPort)($a0)
  .L801379C0:
  /* 13FBC0 801379C0 3C0F8014 */       lui $t7, %hi(D_ovl27_80138F14)
  /* 13FBC4 801379C4 8DEF8F14 */        lw $t7, %lo(D_ovl27_80138F14)($t7)
  /* 13FBC8 801379C8 51E00004 */      beql $t7, $zero, .L801379DC
  /* 13FBCC 801379CC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FBD0 801379D0 0C04DE2A */       jal mn1PAutopositionPlacedToken
  /* 13FBD4 801379D4 00002025 */        or $a0, $zero, $zero
  /* 13FBD8 801379D8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801379DC:
  /* 13FBDC 801379DC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FBE0 801379E0 03E00008 */        jr $ra
  /* 13FBE4 801379E4 00000000 */       nop

glabel mn1PCreateTokenAutopositionRoutine
  /* 13FBE8 801379E8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13FBEC 801379EC AFBF0014 */        sw $ra, 0x14($sp)
  /* 13FBF0 801379F0 00002025 */        or $a0, $zero, $zero
  /* 13FBF4 801379F4 00002825 */        or $a1, $zero, $zero
  /* 13FBF8 801379F8 24060018 */     addiu $a2, $zero, 0x18
  /* 13FBFC 801379FC 0C00265A */       jal omMakeGObjSPAfter
  /* 13FC00 80137A00 3C078000 */       lui $a3, 0x8000
  /* 13FC04 80137A04 3C058013 */       lui $a1, %hi(mn1PAutopositionToken)
  /* 13FC08 80137A08 24A5799C */     addiu $a1, $a1, %lo(mn1PAutopositionToken)
  /* 13FC0C 80137A0C 00402025 */        or $a0, $v0, $zero
  /* 13FC10 80137A10 24060001 */     addiu $a2, $zero, 1
  /* 13FC14 80137A14 0C002062 */       jal omAddGObjCommonProc
  /* 13FC18 80137A18 24070001 */     addiu $a3, $zero, 1
  /* 13FC1C 80137A1C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FC20 80137A20 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FC24 80137A24 03E00008 */        jr $ra
  /* 13FC28 80137A28 00000000 */       nop

glabel mn1PSyncWhiteCircleSizeAndDisplay
  /* 13FC2C 80137A2C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 13FC30 80137A30 3C0E8014 */       lui $t6, %hi(dMN1PWhiteCircleSizes)
  /* 13FC34 80137A34 27A20000 */     addiu $v0, $sp, 0
  /* 13FC38 80137A38 3C038014 */       lui $v1, %hi(gMN1PPanel)
  /* 13FC3C 80137A3C 25CE8C60 */     addiu $t6, $t6, %lo(dMN1PWhiteCircleSizes)
  /* 13FC40 80137A40 24638EE8 */     addiu $v1, $v1, %lo(gMN1PPanel)
  /* 13FC44 80137A44 25C80030 */     addiu $t0, $t6, 0x30
  /* 13FC48 80137A48 0040C825 */        or $t9, $v0, $zero
  .L80137A4C:
  /* 13FC4C 80137A4C 8DD80000 */        lw $t8, ($t6) # dMN1PWhiteCircleSizes + 0
  /* 13FC50 80137A50 25CE000C */     addiu $t6, $t6, 0xc
  /* 13FC54 80137A54 2739000C */     addiu $t9, $t9, 0xc
  /* 13FC58 80137A58 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 13FC5C 80137A5C 8DCFFFF8 */        lw $t7, -8($t6) # dMN1PWhiteCircleSizes + -8
  /* 13FC60 80137A60 AF2FFFF8 */        sw $t7, -8($t9)
  /* 13FC64 80137A64 8DD8FFFC */        lw $t8, -4($t6) # dMN1PWhiteCircleSizes + -4
  /* 13FC68 80137A68 15C8FFF8 */       bne $t6, $t0, .L80137A4C
  /* 13FC6C 80137A6C AF38FFFC */        sw $t8, -4($t9)
  /* 13FC70 80137A70 8C690058 */        lw $t1, 0x58($v1) # gMN1PPanel + 88
  /* 13FC74 80137A74 55200020 */      bnel $t1, $zero, .L80137AF8
  /* 13FC78 80137A78 24050001 */     addiu $a1, $zero, 1
  /* 13FC7C 80137A7C 8C6A0020 */        lw $t2, 0x20($v1) # gMN1PPanel + 32
  /* 13FC80 80137A80 2401001C */     addiu $at, $zero, 0x1c
  /* 13FC84 80137A84 5141001C */      beql $t2, $at, .L80137AF8
  /* 13FC88 80137A88 24050001 */     addiu $a1, $zero, 1
  /* 13FC8C 80137A8C 8C8B007C */        lw $t3, 0x7c($a0)
  /* 13FC90 80137A90 24050001 */     addiu $a1, $zero, 1
  /* 13FC94 80137A94 54AB0004 */      bnel $a1, $t3, .L80137AA8
  /* 13FC98 80137A98 AC85007C */        sw $a1, 0x7c($a0)
  /* 13FC9C 80137A9C 10000002 */         b .L80137AA8
  /* 13FCA0 80137AA0 AC80007C */        sw $zero, 0x7c($a0)
  /* 13FCA4 80137AA4 AC85007C */        sw $a1, 0x7c($a0)
  .L80137AA8:
  /* 13FCA8 80137AA8 8C6C0020 */        lw $t4, 0x20($v1) # gMN1PPanel + 32
  /* 13FCAC 80137AAC 8C8E0074 */        lw $t6, 0x74($a0)
  /* 13FCB0 80137AB0 000C6880 */       sll $t5, $t4, 2
  /* 13FCB4 80137AB4 004D4021 */      addu $t0, $v0, $t5
  /* 13FCB8 80137AB8 C5040000 */      lwc1 $f4, ($t0)
  /* 13FCBC 80137ABC E5C40040 */      swc1 $f4, 0x40($t6)
  /* 13FCC0 80137AC0 8C790020 */        lw $t9, 0x20($v1) # gMN1PPanel + 32
  /* 13FCC4 80137AC4 8C890074 */        lw $t1, 0x74($a0)
  /* 13FCC8 80137AC8 00197880 */       sll $t7, $t9, 2
  /* 13FCCC 80137ACC 004FC021 */      addu $t8, $v0, $t7
  /* 13FCD0 80137AD0 C7060000 */      lwc1 $f6, ($t8)
  /* 13FCD4 80137AD4 E5260044 */      swc1 $f6, 0x44($t1)
  /* 13FCD8 80137AD8 8C6A0020 */        lw $t2, 0x20($v1) # gMN1PPanel + 32
  /* 13FCDC 80137ADC 8C8D0074 */        lw $t5, 0x74($a0)
  /* 13FCE0 80137AE0 000A5880 */       sll $t3, $t2, 2
  /* 13FCE4 80137AE4 004B6021 */      addu $t4, $v0, $t3
  /* 13FCE8 80137AE8 C5880000 */      lwc1 $f8, ($t4)
  /* 13FCEC 80137AEC 10000003 */         b .L80137AFC
  /* 13FCF0 80137AF0 E5A80044 */      swc1 $f8, 0x44($t5)
  /* 13FCF4 80137AF4 24050001 */     addiu $a1, $zero, 1
  .L80137AF8:
  /* 13FCF8 80137AF8 AC85007C */        sw $a1, 0x7c($a0)
  .L80137AFC:
  /* 13FCFC 80137AFC 03E00008 */        jr $ra
  /* 13FD00 80137B00 27BD0030 */     addiu $sp, $sp, 0x30

glabel mn1PCreateWhiteCircles
  /* 13FD04 80137B04 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 13FD08 80137B08 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13FD0C 80137B0C AFB00020 */        sw $s0, 0x20($sp)
  /* 13FD10 80137B10 00002025 */        or $a0, $zero, $zero
  /* 13FD14 80137B14 00002825 */        or $a1, $zero, $zero
  /* 13FD18 80137B18 24060015 */     addiu $a2, $zero, 0x15
  /* 13FD1C 80137B1C 0C00265A */       jal omMakeGObjSPAfter
  /* 13FD20 80137B20 3C078000 */       lui $a3, 0x8000
  /* 13FD24 80137B24 3C0E8014 */       lui $t6, %hi(D_ovl27_801396C8)
  /* 13FD28 80137B28 8DCE96C8 */        lw $t6, %lo(D_ovl27_801396C8)($t6)
  /* 13FD2C 80137B2C 3C0F0000 */       lui $t7, %hi(D_NF_00000568)
  /* 13FD30 80137B30 25EF0568 */     addiu $t7, $t7, %lo(D_NF_00000568)
  /* 13FD34 80137B34 00408025 */        or $s0, $v0, $zero
  /* 13FD38 80137B38 00402025 */        or $a0, $v0, $zero
  /* 13FD3C 80137B3C 00003025 */        or $a2, $zero, $zero
  /* 13FD40 80137B40 0C003C48 */       jal func_8000F120
  /* 13FD44 80137B44 01CF2821 */      addu $a1, $t6, $t7
  /* 13FD48 80137B48 3C058001 */       lui $a1, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 13FD4C 80137B4C 2418FFFF */     addiu $t8, $zero, -1
  /* 13FD50 80137B50 AFB80010 */        sw $t8, 0x10($sp)
  /* 13FD54 80137B54 24A54768 */     addiu $a1, $a1, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 13FD58 80137B58 02002025 */        or $a0, $s0, $zero
  /* 13FD5C 80137B5C 24060009 */     addiu $a2, $zero, 9
  /* 13FD60 80137B60 0C00277D */       jal omAddGObjRenderProc
  /* 13FD64 80137B64 3C078000 */       lui $a3, 0x8000
  /* 13FD68 80137B68 3C198014 */       lui $t9, %hi(D_ovl27_801396C8)
  /* 13FD6C 80137B6C 8F3996C8 */        lw $t9, %lo(D_ovl27_801396C8)($t9)
  /* 13FD70 80137B70 3C080000 */       lui $t0, %hi(D_NF_00000408)
  /* 13FD74 80137B74 25080408 */     addiu $t0, $t0, %lo(D_NF_00000408)
  /* 13FD78 80137B78 02002025 */        or $a0, $s0, $zero
  /* 13FD7C 80137B7C 0C003E3D */       jal func_8000F8F4
  /* 13FD80 80137B80 03282821 */      addu $a1, $t9, $t0
  /* 13FD84 80137B84 3C058013 */       lui $a1, %hi(mn1PSyncWhiteCircleSizeAndDisplay)
  /* 13FD88 80137B88 24A57A2C */     addiu $a1, $a1, %lo(mn1PSyncWhiteCircleSizeAndDisplay)
  /* 13FD8C 80137B8C 02002025 */        or $a0, $s0, $zero
  /* 13FD90 80137B90 24060001 */     addiu $a2, $zero, 1
  /* 13FD94 80137B94 0C002062 */       jal omAddGObjCommonProc
  /* 13FD98 80137B98 24070001 */     addiu $a3, $zero, 1
  /* 13FD9C 80137B9C 0C0037CD */       jal func_8000DF34
  /* 13FDA0 80137BA0 02002025 */        or $a0, $s0, $zero
  /* 13FDA4 80137BA4 3C018014 */       lui $at, %hi(D_ovl27_80138ED4)
  /* 13FDA8 80137BA8 C4248ED4 */      lwc1 $f4, %lo(D_ovl27_80138ED4)($at)
  /* 13FDAC 80137BAC 8E090074 */        lw $t1, 0x74($s0)
  /* 13FDB0 80137BB0 3C018014 */       lui $at, %hi(D_ovl27_80138ED8)
  /* 13FDB4 80137BB4 44804000 */      mtc1 $zero, $f8
  /* 13FDB8 80137BB8 E524001C */      swc1 $f4, 0x1c($t1)
  /* 13FDBC 80137BBC 8E0A0074 */        lw $t2, 0x74($s0)
  /* 13FDC0 80137BC0 C4268ED8 */      lwc1 $f6, %lo(D_ovl27_80138ED8)($at)
  /* 13FDC4 80137BC4 E5460020 */      swc1 $f6, 0x20($t2)
  /* 13FDC8 80137BC8 8E0B0074 */        lw $t3, 0x74($s0)
  /* 13FDCC 80137BCC E5680024 */      swc1 $f8, 0x24($t3)
  /* 13FDD0 80137BD0 8FBF0024 */        lw $ra, 0x24($sp)
  /* 13FDD4 80137BD4 8FB00020 */        lw $s0, 0x20($sp)
  /* 13FDD8 80137BD8 27BD0028 */     addiu $sp, $sp, 0x28
  /* 13FDDC 80137BDC 03E00008 */        jr $ra
  /* 13FDE0 80137BE0 00000000 */       nop

glabel mn1PBlinkIfReadyToFight
  /* 13FDE4 80137BE4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 13FDE8 80137BE8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 13FDEC 80137BEC 0C04DFBC */       jal mn1PIsReadyToFight
  /* 13FDF0 80137BF0 AFA40018 */        sw $a0, 0x18($sp)
  /* 13FDF4 80137BF4 10400012 */      beqz $v0, .L80137C40
  /* 13FDF8 80137BF8 8FA40018 */        lw $a0, 0x18($sp)
  /* 13FDFC 80137BFC 3C038014 */       lui $v1, %hi(gMN1PPressStartFlashTimer)
  /* 13FE00 80137C00 24638F7C */     addiu $v1, $v1, %lo(gMN1PPressStartFlashTimer)
  /* 13FE04 80137C04 8C6E0000 */        lw $t6, ($v1) # gMN1PPressStartFlashTimer + 0
  /* 13FE08 80137C08 24010028 */     addiu $at, $zero, 0x28
  /* 13FE0C 80137C0C 24180001 */     addiu $t8, $zero, 1
  /* 13FE10 80137C10 25C20001 */     addiu $v0, $t6, 1
  /* 13FE14 80137C14 14410003 */       bne $v0, $at, .L80137C24
  /* 13FE18 80137C18 AC620000 */        sw $v0, ($v1) # gMN1PPressStartFlashTimer + 0
  /* 13FE1C 80137C1C AC600000 */        sw $zero, ($v1) # gMN1PPressStartFlashTimer + 0
  /* 13FE20 80137C20 00001025 */        or $v0, $zero, $zero
  .L80137C24:
  /* 13FE24 80137C24 2841001E */      slti $at, $v0, 0x1e
  /* 13FE28 80137C28 10200003 */      beqz $at, .L80137C38
  /* 13FE2C 80137C2C 00000000 */       nop
  /* 13FE30 80137C30 10000008 */         b .L80137C54
  /* 13FE34 80137C34 AC80007C */        sw $zero, 0x7c($a0)
  .L80137C38:
  /* 13FE38 80137C38 10000006 */         b .L80137C54
  /* 13FE3C 80137C3C AC98007C */        sw $t8, 0x7c($a0)
  .L80137C40:
  /* 13FE40 80137C40 3C038014 */       lui $v1, %hi(gMN1PPressStartFlashTimer)
  /* 13FE44 80137C44 24190001 */     addiu $t9, $zero, 1
  /* 13FE48 80137C48 24638F7C */     addiu $v1, $v1, %lo(gMN1PPressStartFlashTimer)
  /* 13FE4C 80137C4C AC99007C */        sw $t9, 0x7c($a0)
  /* 13FE50 80137C50 AC600000 */        sw $zero, ($v1) # gMN1PPressStartFlashTimer + 0
  .L80137C54:
  /* 13FE54 80137C54 8FBF0014 */        lw $ra, 0x14($sp)
  /* 13FE58 80137C58 27BD0018 */     addiu $sp, $sp, 0x18
  /* 13FE5C 80137C5C 03E00008 */        jr $ra
  /* 13FE60 80137C60 00000000 */       nop

glabel mn1PCreateReadyToFightObjects
  /* 13FE64 80137C64 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 13FE68 80137C68 AFBF0024 */        sw $ra, 0x24($sp)
  /* 13FE6C 80137C6C AFB00020 */        sw $s0, 0x20($sp)
  /* 13FE70 80137C70 00002025 */        or $a0, $zero, $zero
  /* 13FE74 80137C74 00002825 */        or $a1, $zero, $zero
  /* 13FE78 80137C78 2406001C */     addiu $a2, $zero, 0x1c
  /* 13FE7C 80137C7C 0C00265A */       jal omMakeGObjSPAfter
  /* 13FE80 80137C80 3C078000 */       lui $a3, 0x8000
  /* 13FE84 80137C84 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 13FE88 80137C88 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 13FE8C 80137C8C 240EFFFF */     addiu $t6, $zero, -1
  /* 13FE90 80137C90 00408025 */        or $s0, $v0, $zero
  /* 13FE94 80137C94 AFAE0010 */        sw $t6, 0x10($sp)
  /* 13FE98 80137C98 AFA5002C */        sw $a1, 0x2c($sp)
  /* 13FE9C 80137C9C 00402025 */        or $a0, $v0, $zero
  /* 13FEA0 80137CA0 24060023 */     addiu $a2, $zero, 0x23
  /* 13FEA4 80137CA4 0C00277D */       jal omAddGObjRenderProc
  /* 13FEA8 80137CA8 3C078000 */       lui $a3, 0x8000
  /* 13FEAC 80137CAC 3C058013 */       lui $a1, %hi(mn1PBlinkIfReadyToFight)
  /* 13FEB0 80137CB0 24A57BE4 */     addiu $a1, $a1, %lo(mn1PBlinkIfReadyToFight)
  /* 13FEB4 80137CB4 AFA50028 */        sw $a1, 0x28($sp)
  /* 13FEB8 80137CB8 02002025 */        or $a0, $s0, $zero
  /* 13FEBC 80137CBC 24060001 */     addiu $a2, $zero, 1
  /* 13FEC0 80137CC0 0C002062 */       jal omAddGObjCommonProc
  /* 13FEC4 80137CC4 24070001 */     addiu $a3, $zero, 1
  /* 13FEC8 80137CC8 3C0F8014 */       lui $t7, %hi(D_ovl27_801396A0)
  /* 13FECC 80137CCC 8DEF96A0 */        lw $t7, %lo(D_ovl27_801396A0)($t7)
  /* 13FED0 80137CD0 3C180001 */       lui $t8, %hi(D_NF_0000F530)
  /* 13FED4 80137CD4 2718F530 */     addiu $t8, $t8, %lo(D_NF_0000F530)
  /* 13FED8 80137CD8 02002025 */        or $a0, $s0, $zero
  /* 13FEDC 80137CDC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13FEE0 80137CE0 01F82821 */      addu $a1, $t7, $t8
  /* 13FEE4 80137CE4 94590024 */       lhu $t9, 0x24($v0)
  /* 13FEE8 80137CE8 3C01428E */       lui $at, (0x428E0000 >> 16) # 71.0
  /* 13FEEC 80137CEC 44802000 */      mtc1 $zero, $f4
  /* 13FEF0 80137CF0 44813000 */      mtc1 $at, $f6 # 71.0 to cop1
  /* 13FEF4 80137CF4 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 13FEF8 80137CF8 A4490024 */        sh $t1, 0x24($v0)
  /* 13FEFC 80137CFC 352A0001 */       ori $t2, $t1, 1
  /* 13FF00 80137D00 240B00F4 */     addiu $t3, $zero, 0xf4
  /* 13FF04 80137D04 240C0056 */     addiu $t4, $zero, 0x56
  /* 13FF08 80137D08 240D007F */     addiu $t5, $zero, 0x7f
  /* 13FF0C 80137D0C 240E0003 */     addiu $t6, $zero, 3
  /* 13FF10 80137D10 240F0140 */     addiu $t7, $zero, 0x140
  /* 13FF14 80137D14 24180011 */     addiu $t8, $zero, 0x11
  /* 13FF18 80137D18 A44A0024 */        sh $t2, 0x24($v0)
  /* 13FF1C 80137D1C A0400060 */        sb $zero, 0x60($v0)
  /* 13FF20 80137D20 A0400061 */        sb $zero, 0x61($v0)
  /* 13FF24 80137D24 A0400062 */        sb $zero, 0x62($v0)
  /* 13FF28 80137D28 A04B0028 */        sb $t3, 0x28($v0)
  /* 13FF2C 80137D2C A04C0029 */        sb $t4, 0x29($v0)
  /* 13FF30 80137D30 A04D002A */        sb $t5, 0x2a($v0)
  /* 13FF34 80137D34 A0400065 */        sb $zero, 0x65($v0)
  /* 13FF38 80137D38 A0400064 */        sb $zero, 0x64($v0)
  /* 13FF3C 80137D3C A04E0067 */        sb $t6, 0x67($v0)
  /* 13FF40 80137D40 A0400066 */        sb $zero, 0x66($v0)
  /* 13FF44 80137D44 A44F0068 */        sh $t7, 0x68($v0)
  /* 13FF48 80137D48 A458006A */        sh $t8, 0x6a($v0)
  /* 13FF4C 80137D4C 3C198014 */       lui $t9, %hi(D_ovl27_801396A0)
  /* 13FF50 80137D50 E4440058 */      swc1 $f4, 0x58($v0)
  /* 13FF54 80137D54 E446005C */      swc1 $f6, 0x5c($v0)
  /* 13FF58 80137D58 8F3996A0 */        lw $t9, %lo(D_ovl27_801396A0)($t9)
  /* 13FF5C 80137D5C 3C080001 */       lui $t0, %hi(D_NF_0000F448)
  /* 13FF60 80137D60 2508F448 */     addiu $t0, $t0, %lo(D_NF_0000F448)
  /* 13FF64 80137D64 02002025 */        or $a0, $s0, $zero
  /* 13FF68 80137D68 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 13FF6C 80137D6C 03282821 */      addu $a1, $t9, $t0
  /* 13FF70 80137D70 94490024 */       lhu $t1, 0x24($v0)
  /* 13FF74 80137D74 3C014248 */       lui $at, (0x42480000 >> 16) # 50.0
  /* 13FF78 80137D78 44814000 */      mtc1 $at, $f8 # 50.0 to cop1
  /* 13FF7C 80137D7C 3C014298 */       lui $at, (0x42980000 >> 16) # 76.0
  /* 13FF80 80137D80 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 13FF84 80137D84 44815000 */      mtc1 $at, $f10 # 76.0 to cop1
  /* 13FF88 80137D88 240300FF */     addiu $v1, $zero, 0xff
  /* 13FF8C 80137D8C A44B0024 */        sh $t3, 0x24($v0)
  /* 13FF90 80137D90 356C0001 */       ori $t4, $t3, 1
  /* 13FF94 80137D94 240D00CA */     addiu $t5, $zero, 0xca
  /* 13FF98 80137D98 240E0013 */     addiu $t6, $zero, 0x13
  /* 13FF9C 80137D9C 240F009D */     addiu $t7, $zero, 0x9d
  /* 13FFA0 80137DA0 A44C0024 */        sh $t4, 0x24($v0)
  /* 13FFA4 80137DA4 A0430060 */        sb $v1, 0x60($v0)
  /* 13FFA8 80137DA8 A04D0061 */        sb $t5, 0x61($v0)
  /* 13FFAC 80137DAC A04E0062 */        sb $t6, 0x62($v0)
  /* 13FFB0 80137DB0 A0430028 */        sb $v1, 0x28($v0)
  /* 13FFB4 80137DB4 A0430029 */        sb $v1, 0x29($v0)
  /* 13FFB8 80137DB8 A04F002A */        sb $t7, 0x2a($v0)
  /* 13FFBC 80137DBC 00002025 */        or $a0, $zero, $zero
  /* 13FFC0 80137DC0 00002825 */        or $a1, $zero, $zero
  /* 13FFC4 80137DC4 24060016 */     addiu $a2, $zero, 0x16
  /* 13FFC8 80137DC8 3C078000 */       lui $a3, 0x8000
  /* 13FFCC 80137DCC E4480058 */      swc1 $f8, 0x58($v0)
  /* 13FFD0 80137DD0 0C00265A */       jal omMakeGObjSPAfter
  /* 13FFD4 80137DD4 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 13FFD8 80137DD8 2418FFFF */     addiu $t8, $zero, -1
  /* 13FFDC 80137DDC 00408025 */        or $s0, $v0, $zero
  /* 13FFE0 80137DE0 AFB80010 */        sw $t8, 0x10($sp)
  /* 13FFE4 80137DE4 00402025 */        or $a0, $v0, $zero
  /* 13FFE8 80137DE8 8FA5002C */        lw $a1, 0x2c($sp)
  /* 13FFEC 80137DEC 2406001C */     addiu $a2, $zero, 0x1c
  /* 13FFF0 80137DF0 0C00277D */       jal omAddGObjRenderProc
  /* 13FFF4 80137DF4 3C078000 */       lui $a3, 0x8000
  /* 13FFF8 80137DF8 02002025 */        or $a0, $s0, $zero
  /* 13FFFC 80137DFC 8FA50028 */        lw $a1, 0x28($sp)
  /* 140000 80137E00 24060001 */     addiu $a2, $zero, 1
  /* 140004 80137E04 0C002062 */       jal omAddGObjCommonProc
  /* 140008 80137E08 24070001 */     addiu $a3, $zero, 1
  /* 14000C 80137E0C 3C198014 */       lui $t9, %hi(D_ovl27_801396A0)
  /* 140010 80137E10 8F3996A0 */        lw $t9, %lo(D_ovl27_801396A0)($t9)
  /* 140014 80137E14 3C080000 */       lui $t0, %hi(D_NF_000014D8)
  /* 140018 80137E18 250814D8 */     addiu $t0, $t0, %lo(D_NF_000014D8)
  /* 14001C 80137E1C 02002025 */        or $a0, $s0, $zero
  /* 140020 80137E20 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 140024 80137E24 03282821 */      addu $a1, $t9, $t0
  /* 140028 80137E28 94490024 */       lhu $t1, 0x24($v0)
  /* 14002C 80137E2C 3C014305 */       lui $at, (0x43050000 >> 16) # 133.0
  /* 140030 80137E30 44818000 */      mtc1 $at, $f16 # 133.0 to cop1
  /* 140034 80137E34 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 140038 80137E38 44819000 */      mtc1 $at, $f18 # 219.0 to cop1
  /* 14003C 80137E3C 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 140040 80137E40 A44B0024 */        sh $t3, 0x24($v0)
  /* 140044 80137E44 356C0001 */       ori $t4, $t3, 1
  /* 140048 80137E48 240D00D6 */     addiu $t5, $zero, 0xd6
  /* 14004C 80137E4C 240E00DD */     addiu $t6, $zero, 0xdd
  /* 140050 80137E50 240F00C6 */     addiu $t7, $zero, 0xc6
  /* 140054 80137E54 A44C0024 */        sh $t4, 0x24($v0)
  /* 140058 80137E58 A04D0028 */        sb $t5, 0x28($v0)
  /* 14005C 80137E5C A04E0029 */        sb $t6, 0x29($v0)
  /* 140060 80137E60 A04F002A */        sb $t7, 0x2a($v0)
  /* 140064 80137E64 3C188014 */       lui $t8, %hi(D_ovl27_801396A0)
  /* 140068 80137E68 E4500058 */      swc1 $f16, 0x58($v0)
  /* 14006C 80137E6C E452005C */      swc1 $f18, 0x5c($v0)
  /* 140070 80137E70 8F1896A0 */        lw $t8, %lo(D_ovl27_801396A0)($t8)
  /* 140074 80137E74 3C190000 */       lui $t9, %hi(D_NF_00001378)
  /* 140078 80137E78 27391378 */     addiu $t9, $t9, %lo(D_NF_00001378)
  /* 14007C 80137E7C 02002025 */        or $a0, $s0, $zero
  /* 140080 80137E80 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 140084 80137E84 03192821 */      addu $a1, $t8, $t9
  /* 140088 80137E88 94480024 */       lhu $t0, 0x24($v0)
  /* 14008C 80137E8C 3C014322 */       lui $at, (0x43220000 >> 16) # 162.0
  /* 140090 80137E90 44812000 */      mtc1 $at, $f4 # 162.0 to cop1
  /* 140094 80137E94 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 140098 80137E98 44813000 */      mtc1 $at, $f6 # 219.0 to cop1
  /* 14009C 80137E9C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 1400A0 80137EA0 A44A0024 */        sh $t2, 0x24($v0)
  /* 1400A4 80137EA4 354B0001 */       ori $t3, $t2, 1
  /* 1400A8 80137EA8 240C00FF */     addiu $t4, $zero, 0xff
  /* 1400AC 80137EAC 240D0056 */     addiu $t5, $zero, 0x56
  /* 1400B0 80137EB0 240E0092 */     addiu $t6, $zero, 0x92
  /* 1400B4 80137EB4 A44B0024 */        sh $t3, 0x24($v0)
  /* 1400B8 80137EB8 A04C0028 */        sb $t4, 0x28($v0)
  /* 1400BC 80137EBC A04D0029 */        sb $t5, 0x29($v0)
  /* 1400C0 80137EC0 A04E002A */        sb $t6, 0x2a($v0)
  /* 1400C4 80137EC4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1400C8 80137EC8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1400CC 80137ECC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1400D0 80137ED0 8FB00020 */        lw $s0, 0x20($sp)
  /* 1400D4 80137ED4 27BD0038 */     addiu $sp, $sp, 0x38
  /* 1400D8 80137ED8 03E00008 */        jr $ra
  /* 1400DC 80137EDC 00000000 */       nop

  /* 1400E0 80137EE0 03E00008 */        jr $ra
  /* 1400E4 80137EE4 00000000 */       nop

  /* 1400E8 80137EE8 03E00008 */        jr $ra
  /* 1400EC 80137EEC 00000000 */       nop

glabel mn1PIsReadyToFight
  /* 1400F0 80137EF0 3C0E8014 */       lui $t6, %hi(D_ovl27_80138F40)
  /* 1400F4 80137EF4 8DCE8F40 */        lw $t6, %lo(D_ovl27_80138F40)($t6)
  /* 1400F8 80137EF8 24030001 */     addiu $v1, $zero, 1
  /* 1400FC 80137EFC 15C00002 */      bnez $t6, .L80137F08
  /* 140100 80137F00 00000000 */       nop
  /* 140104 80137F04 00001825 */        or $v1, $zero, $zero
  .L80137F08:
  /* 140108 80137F08 03E00008 */        jr $ra
  /* 14010C 80137F0C 00601025 */        or $v0, $v1, $zero

glabel mn1PSaveMatchInfo
  /* 140110 80137F10 3C0E8014 */       lui $t6, %hi(gMN1PTimerValue)
  /* 140114 80137F14 8DCE8F80 */        lw $t6, %lo(gMN1PTimerValue)($t6)
  /* 140118 80137F18 3C02800A */       lui $v0, %hi(gSceneData)
  /* 14011C 80137F1C 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 140120 80137F20 3C0F8014 */       lui $t7, %hi(gMN1PHumanPanelPort)
  /* 140124 80137F24 A04E0016 */        sb $t6, 0x16($v0) # gSceneData + 22
  /* 140128 80137F28 8DEF8FA8 */        lw $t7, %lo(gMN1PHumanPanelPort)($t7)
  /* 14012C 80137F2C 3C188014 */       lui $t8, %hi(gMN1PLevelValue)
  /* 140130 80137F30 3C03800A */       lui $v1, %hi(gSaveData)
  /* 140134 80137F34 A04F0013 */        sb $t7, 0x13($v0) # gSceneData + 19
  /* 140138 80137F38 8F188FB4 */        lw $t8, %lo(gMN1PLevelValue)($t8)
  /* 14013C 80137F3C 3C048014 */       lui $a0, %hi(gMN1PPanel)
  /* 140140 80137F40 24848EE8 */     addiu $a0, $a0, %lo(gMN1PPanel)
  /* 140144 80137F44 246344E0 */     addiu $v1, $v1, %lo(gSaveData)
  /* 140148 80137F48 8C880058 */        lw $t0, 0x58($a0) # gMN1PPanel + 88
  /* 14014C 80137F4C A0400017 */        sb $zero, 0x17($v0) # gSceneData + 23
  /* 140150 80137F50 3C198014 */       lui $t9, %hi(gMN1PStockValue)
  /* 140154 80137F54 A078045A */        sb $t8, 0x45a($v1) # gSaveData + 1114
  /* 140158 80137F58 8F398FB8 */        lw $t9, %lo(gMN1PStockValue)($t9)
  /* 14015C 80137F5C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 140160 80137F60 AFBF0014 */        sw $ra, 0x14($sp)
  /* 140164 80137F64 11000004 */      beqz $t0, .L80137F78
  /* 140168 80137F68 A079045B */        sb $t9, 0x45b($v1) # gSaveData + 1115
  /* 14016C 80137F6C 8C890020 */        lw $t1, 0x20($a0) # gMN1PPanel + 32
  /* 140170 80137F70 10000003 */         b .L80137F80
  /* 140174 80137F74 A0490014 */        sb $t1, 0x14($v0) # gSceneData + 20
  .L80137F78:
  /* 140178 80137F78 240A001C */     addiu $t2, $zero, 0x1c
  /* 14017C 80137F7C A04A0014 */        sb $t2, 0x14($v0) # gSceneData + 20
  .L80137F80:
  /* 140180 80137F80 8C8B0024 */        lw $t3, 0x24($a0) # gMN1PPanel + 36
  /* 140184 80137F84 0C03517D */       jal lbMemory_SaveData_WriteSRAM
  /* 140188 80137F88 A04B0015 */        sb $t3, 0x15($v0) # gSceneData + 21
  /* 14018C 80137F8C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 140190 80137F90 27BD0018 */     addiu $sp, $sp, 0x18
  /* 140194 80137F94 03E00008 */        jr $ra
  /* 140198 80137F98 00000000 */       nop

glabel mn1PDestroyCursorAndTokenProcesses
  /* 14019C 80137F9C 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 1401A0 80137FA0 8C428EE8 */        lw $v0, %lo(gMN1PPanel)($v0)
  /* 1401A4 80137FA4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1401A8 80137FA8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1401AC 80137FAC 50400004 */      beql $v0, $zero, .L80137FC0
  /* 1401B0 80137FB0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1401B4 80137FB4 0C002CBB */       jal func_8000B2EC
  /* 1401B8 80137FB8 8C440018 */        lw $a0, 0x18($v0)
  /* 1401BC 80137FBC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137FC0:
  /* 1401C0 80137FC0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1401C4 80137FC4 03E00008 */        jr $ra
  /* 1401C8 80137FC8 00000000 */       nop

glabel mn1PMain
  /* 1401CC 80137FCC 3C038014 */       lui $v1, %hi(gMN1PFramesElapsed)
  /* 1401D0 80137FD0 24638F74 */     addiu $v1, $v1, %lo(gMN1PFramesElapsed)
  /* 1401D4 80137FD4 8C6E0000 */        lw $t6, ($v1) # gMN1PFramesElapsed + 0
  /* 1401D8 80137FD8 3C188014 */       lui $t8, %hi(gMN1PMaxFramesElapsed)
  /* 1401DC 80137FDC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1401E0 80137FE0 25CF0001 */     addiu $t7, $t6, 1
  /* 1401E4 80137FE4 AC6F0000 */        sw $t7, ($v1) # gMN1PFramesElapsed + 0
  /* 1401E8 80137FE8 8F188F78 */        lw $t8, %lo(gMN1PMaxFramesElapsed)($t8)
  /* 1401EC 80137FEC AFBF0014 */        sw $ra, 0x14($sp)
  /* 1401F0 80137FF0 AFA40018 */        sw $a0, 0x18($sp)
  /* 1401F4 80137FF4 170F000B */       bne $t8, $t7, .L80138024
  /* 1401F8 80137FF8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 1401FC 80137FFC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 140200 80138000 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 140204 80138004 24090001 */     addiu $t1, $zero, 1
  /* 140208 80138008 A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 14020C 8013800C 0C04DFC4 */       jal mn1PSaveMatchInfo
  /* 140210 80138010 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  /* 140214 80138014 0C00171D */       jal func_80005C74
  /* 140218 80138018 00000000 */       nop
  /* 14021C 8013801C 1000003B */         b .L8013810C
  /* 140220 80138020 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138024:
  /* 140224 80138024 0C0E42DF */       jal func_ovl1_80390B7C
  /* 140228 80138028 00000000 */       nop
  /* 14022C 8013802C 3C038014 */       lui $v1, %hi(gMN1PFramesElapsed)
  /* 140230 80138030 14400005 */      bnez $v0, .L80138048
  /* 140234 80138034 24638F74 */     addiu $v1, $v1, %lo(gMN1PFramesElapsed)
  /* 140238 80138038 8C6A0000 */        lw $t2, ($v1) # gMN1PFramesElapsed + 0
  /* 14023C 8013803C 3C018014 */       lui $at, %hi(gMN1PMaxFramesElapsed)
  /* 140240 80138040 254B4650 */     addiu $t3, $t2, 0x4650
  /* 140244 80138044 AC2B8F78 */        sw $t3, %lo(gMN1PMaxFramesElapsed)($at)
  .L80138048:
  /* 140248 80138048 3C0C8014 */       lui $t4, %hi(gMN1PIsStartTriggered)
  /* 14024C 8013804C 8D8C8F9C */        lw $t4, %lo(gMN1PIsStartTriggered)($t4)
  /* 140250 80138050 3C038014 */       lui $v1, %hi(gMN1PStartDelayTimer)
  /* 140254 80138054 24638F98 */     addiu $v1, $v1, %lo(gMN1PStartDelayTimer)
  /* 140258 80138058 11800010 */      beqz $t4, .L8013809C
  /* 14025C 8013805C 00000000 */       nop
  /* 140260 80138060 8C6D0000 */        lw $t5, ($v1) # gMN1PStartDelayTimer + 0
  /* 140264 80138064 3C02800A */       lui $v0, %hi(gSceneData)
  /* 140268 80138068 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 14026C 8013806C 25AEFFFF */     addiu $t6, $t5, -1
  /* 140270 80138070 15C00025 */      bnez $t6, .L80138108
  /* 140274 80138074 AC6E0000 */        sw $t6, ($v1) # gMN1PStartDelayTimer + 0
  /* 140278 80138078 90580000 */       lbu $t8, ($v0) # gSceneData + 0
  /* 14027C 8013807C 24190034 */     addiu $t9, $zero, 0x34
  /* 140280 80138080 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 140284 80138084 0C04DFC4 */       jal mn1PSaveMatchInfo
  /* 140288 80138088 A0580001 */        sb $t8, 1($v0) # gSceneData + 1
  /* 14028C 8013808C 0C00171D */       jal func_80005C74
  /* 140290 80138090 00000000 */       nop
  /* 140294 80138094 1000001D */         b .L8013810C
  /* 140298 80138098 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013809C:
  /* 14029C 8013809C 0C0E41DB */       jal func_ovl1_8039076C
  /* 1402A0 801380A0 24041000 */     addiu $a0, $zero, 0x1000
  /* 1402A4 801380A4 3C038014 */       lui $v1, %hi(gMN1PFramesElapsed)
  /* 1402A8 801380A8 10400017 */      beqz $v0, .L80138108
  /* 1402AC 801380AC 24638F74 */     addiu $v1, $v1, %lo(gMN1PFramesElapsed)
  /* 1402B0 801380B0 8C680000 */        lw $t0, ($v1) # gMN1PFramesElapsed + 0
  /* 1402B4 801380B4 2901003D */      slti $at, $t0, 0x3d
  /* 1402B8 801380B8 54200014 */      bnel $at, $zero, .L8013810C
  /* 1402BC 801380BC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1402C0 801380C0 0C04DFBC */       jal mn1PIsReadyToFight
  /* 1402C4 801380C4 00000000 */       nop
  /* 1402C8 801380C8 1040000D */      beqz $v0, .L80138100
  /* 1402CC 801380CC 00000000 */       nop
  /* 1402D0 801380D0 0C009A70 */       jal func_800269C0
  /* 1402D4 801380D4 2404026A */     addiu $a0, $zero, 0x26a
  /* 1402D8 801380D8 3C038014 */       lui $v1, %hi(gMN1PStartDelayTimer)
  /* 1402DC 801380DC 24638F98 */     addiu $v1, $v1, %lo(gMN1PStartDelayTimer)
  /* 1402E0 801380E0 2409001E */     addiu $t1, $zero, 0x1e
  /* 1402E4 801380E4 AC690000 */        sw $t1, ($v1) # gMN1PStartDelayTimer + 0
  /* 1402E8 801380E8 240A0001 */     addiu $t2, $zero, 1
  /* 1402EC 801380EC 3C018014 */       lui $at, %hi(gMN1PIsStartTriggered)
  /* 1402F0 801380F0 0C04DFE7 */       jal mn1PDestroyCursorAndTokenProcesses
  /* 1402F4 801380F4 AC2A8F9C */        sw $t2, %lo(gMN1PIsStartTriggered)($at)
  /* 1402F8 801380F8 10000004 */         b .L8013810C
  /* 1402FC 801380FC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138100:
  /* 140300 80138100 0C009A70 */       jal func_800269C0
  /* 140304 80138104 240400A5 */     addiu $a0, $zero, 0xa5
  .L80138108:
  /* 140308 80138108 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013810C:
  /* 14030C 8013810C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 140310 80138110 03E00008 */        jr $ra
  /* 140314 80138114 00000000 */       nop

glabel mn1PGetNextTimerValue
  /* 140318 80138118 24010005 */     addiu $at, $zero, 5
  /* 14031C 8013811C 14810003 */       bne $a0, $at, .L8013812C
  /* 140320 80138120 24030005 */     addiu $v1, $zero, 5
  /* 140324 80138124 03E00008 */        jr $ra
  /* 140328 80138128 24020064 */     addiu $v0, $zero, 0x64

  .L8013812C:
  /* 14032C 8013812C 03E00008 */        jr $ra
  /* 140330 80138130 00601025 */        or $v0, $v1, $zero

glabel mn1PGetPrevTimerValue
  /* 140334 80138134 24010005 */     addiu $at, $zero, 5
  /* 140338 80138138 14810003 */       bne $a0, $at, .L80138148
  /* 14033C 8013813C 24030005 */     addiu $v1, $zero, 5
  /* 140340 80138140 03E00008 */        jr $ra
  /* 140344 80138144 24020064 */     addiu $v0, $zero, 0x64

  .L80138148:
  /* 140348 80138148 03E00008 */        jr $ra
  /* 14034C 8013814C 00601025 */        or $v0, $v1, $zero

glabel mn1PInitPort
  /* 140350 80138150 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 140354 80138154 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 140358 80138158 3C03800A */       lui $v1, %hi(gSceneData)
  /* 14035C 8013815C 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 140360 80138160 906E0014 */       lbu $t6, 0x14($v1) # gSceneData + 20
  /* 140364 80138164 906F0015 */       lbu $t7, 0x15($v1) # gSceneData + 21
  /* 140368 80138168 2401001C */     addiu $at, $zero, 0x1c
  /* 14036C 8013816C AC400018 */        sw $zero, 0x18($v0) # gMN1PPanel + 24
  /* 140370 80138170 AC400074 */        sw $zero, 0x74($v0) # gMN1PPanel + 116
  /* 140374 80138174 A4400078 */        sh $zero, 0x78($v0) # gMN1PPanel + 120
  /* 140378 80138178 AC400008 */        sw $zero, 8($v0) # gMN1PPanel + 8
  /* 14037C 8013817C AC4E0020 */        sw $t6, 0x20($v0) # gMN1PPanel + 32
  /* 140380 80138180 15C10008 */       bne $t6, $at, .L801381A4
  /* 140384 80138184 AC4F0024 */        sw $t7, 0x24($v0) # gMN1PPanel + 36
  /* 140388 80138188 AC440050 */        sw $a0, 0x50($v0) # gMN1PPanel + 80
  /* 14038C 8013818C AC440054 */        sw $a0, 0x54($v0) # gMN1PPanel + 84
  /* 140390 80138190 AC400058 */        sw $zero, 0x58($v0) # gMN1PPanel + 88
  /* 140394 80138194 AC40002C */        sw $zero, 0x2c($v0) # gMN1PPanel + 44
  /* 140398 80138198 AC400030 */        sw $zero, 0x30($v0) # gMN1PPanel + 48
  /* 14039C 8013819C 03E00008 */        jr $ra
  /* 1403A0 801381A0 AC400070 */        sw $zero, 0x70($v0) # gMN1PPanel + 112

  .L801381A4:
  /* 1403A4 801381A4 24030001 */     addiu $v1, $zero, 1
  /* 1403A8 801381A8 24190004 */     addiu $t9, $zero, 4
  /* 1403AC 801381AC 2408FFFF */     addiu $t0, $zero, -1
  /* 1403B0 801381B0 AC590050 */        sw $t9, 0x50($v0)
  /* 1403B4 801381B4 AC480054 */        sw $t0, 0x54($v0)
  /* 1403B8 801381B8 AC430058 */        sw $v1, 0x58($v0)
  /* 1403BC 801381BC AC43002C */        sw $v1, 0x2c($v0)
  /* 1403C0 801381C0 AC400030 */        sw $zero, 0x30($v0)
  /* 1403C4 801381C4 AC400070 */        sw $zero, 0x70($v0)
  /* 1403C8 801381C8 03E00008 */        jr $ra
  /* 1403CC 801381CC 00000000 */       nop

  /* 1403D0 801381D0 03E00008 */        jr $ra
  /* 1403D4 801381D4 00000000 */       nop

glabel mn1PLoadMatchInfo
  /* 1403D8 801381D8 3C038014 */       lui $v1, %hi(gMN1PFramesElapsed)
  /* 1403DC 801381DC 24638F74 */     addiu $v1, $v1, %lo(gMN1PFramesElapsed)
  /* 1403E0 801381E0 AC600000 */        sw $zero, ($v1) # gMN1PFramesElapsed + 0
  /* 1403E4 801381E4 240F4650 */     addiu $t7, $zero, 0x4650
  /* 1403E8 801381E8 3C018014 */       lui $at, %hi(gMN1PMaxFramesElapsed)
  /* 1403EC 801381EC AC2F8F78 */        sw $t7, %lo(gMN1PMaxFramesElapsed)($at)
  /* 1403F0 801381F0 3C02800A */       lui $v0, %hi(gSceneData)
  /* 1403F4 801381F4 3C018014 */       lui $at, %hi(gMN1PIsStartTriggered)
  /* 1403F8 801381F8 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 1403FC 801381FC AC208F9C */        sw $zero, %lo(gMN1PIsStartTriggered)($at)
  /* 140400 80138200 90580016 */       lbu $t8, 0x16($v0) # gSceneData + 22
  /* 140404 80138204 3C018014 */       lui $at, %hi(gMN1PTimerValue)
  /* 140408 80138208 3C06800A */       lui $a2, %hi(gSaveData)
  /* 14040C 8013820C AC388F80 */        sw $t8, %lo(gMN1PTimerValue)($at)
  /* 140410 80138210 90590013 */       lbu $t9, 0x13($v0) # gSceneData + 19
  /* 140414 80138214 24C644E0 */     addiu $a2, $a2, %lo(gSaveData)
  /* 140418 80138218 90C8045A */       lbu $t0, 0x45a($a2) # gSaveData + 1114
  /* 14041C 8013821C 3C058014 */       lui $a1, %hi(gMN1PHumanPanelPort)
  /* 140420 80138220 24A58FA8 */     addiu $a1, $a1, %lo(gMN1PHumanPanelPort)
  /* 140424 80138224 3C018014 */       lui $at, %hi(gMN1PLevelValue)
  /* 140428 80138228 ACB90000 */        sw $t9, ($a1) # gMN1PHumanPanelPort + 0
  /* 14042C 8013822C AC288FB4 */        sw $t0, %lo(gMN1PLevelValue)($at)
  /* 140430 80138230 90C9045B */       lbu $t1, 0x45b($a2) # gSaveData + 1115
  /* 140434 80138234 3C018014 */       lui $at, %hi(gMN1PStockValue)
  /* 140438 80138238 3C07800A */       lui $a3, %hi(D_800A4B18)
  /* 14043C 8013823C AC298FB8 */        sw $t1, %lo(gMN1PStockValue)($at)
  /* 140440 80138240 904A0014 */       lbu $t2, 0x14($v0) # gSceneData + 20
  /* 140444 80138244 3C018014 */       lui $at, %hi(gMN1PFtKind)
  /* 140448 80138248 24E74B18 */     addiu $a3, $a3, %lo(D_800A4B18)
  /* 14044C 8013824C AC2A8FCC */        sw $t2, %lo(gMN1PFtKind)($at)
  /* 140450 80138250 904B0015 */       lbu $t3, 0x15($v0) # gSceneData + 21
  /* 140454 80138254 3C018014 */       lui $at, %hi(gMN1PCostumeId)
  /* 140458 80138258 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 14045C 8013825C AC2B8FD0 */        sw $t3, %lo(gMN1PCostumeId)($at)
  /* 140460 80138260 3C018014 */       lui $at, %hi(gMN1PHighscoreGObj)
  /* 140464 80138264 AC208FAC */        sw $zero, %lo(gMN1PHighscoreGObj)($at)
  /* 140468 80138268 3C018014 */       lui $at, %hi(gMN1PBonusesGObj)
  /* 14046C 8013826C AC208FB0 */        sw $zero, %lo(gMN1PBonusesGObj)($at)
  /* 140470 80138270 3C018014 */       lui $at, %hi(gMN1PLevelGObj)
  /* 140474 80138274 AC208FBC */        sw $zero, %lo(gMN1PLevelGObj)($at)
  /* 140478 80138278 3C018014 */       lui $at, %hi(gMN1PStockGObj)
  /* 14047C 8013827C AC208FC0 */        sw $zero, %lo(gMN1PStockGObj)($at)
  /* 140480 80138280 90EC0002 */       lbu $t4, 2($a3) # D_800A4B18 + 2
  /* 140484 80138284 3C018014 */       lui $at, %hi(gMN1PIsTeamBattle)
  /* 140488 80138288 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14048C 8013828C AC2C8FA0 */        sw $t4, %lo(gMN1PIsTeamBattle)($at)
  /* 140490 80138290 90ED0003 */       lbu $t5, 3($a3) # D_800A4B18 + 3
  /* 140494 80138294 3C018014 */       lui $at, %hi(gMN1PRule)
  /* 140498 80138298 AC2D8FA4 */        sw $t5, %lo(gMN1PRule)($at)
  /* 14049C 8013829C 0C04E054 */       jal mn1PInitPort
  /* 1404A0 801382A0 8CA40000 */        lw $a0, ($a1) # gMN1PHumanPanelPort + 0
  /* 1404A4 801382A4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1404A8 801382A8 3C018014 */       lui $at, %hi(D_ovl27_80138F1C)
  /* 1404AC 801382AC 3C0E800A */       lui $t6, %hi((gSaveData + 0x458))
  /* 1404B0 801382B0 95CE4938 */       lhu $t6, %lo((gSaveData + 0x458))($t6)
  /* 1404B4 801382B4 AC208F1C */        sw $zero, %lo(D_ovl27_80138F1C)($at)
  /* 1404B8 801382B8 3C018014 */       lui $at, %hi(gMN1PCharacterUnlockedMask)
  /* 1404BC 801382BC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1404C0 801382C0 03E00008 */        jr $ra
  /* 1404C4 801382C4 A42E8FC8 */        sh $t6, %lo(gMN1PCharacterUnlockedMask)($at)

glabel mn1PInitPanel
  /* 1404C8 801382C8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1404CC 801382CC AFBF0014 */        sw $ra, 0x14($sp)
  /* 1404D0 801382D0 0C04DD12 */       jal mn1PCreateCursor
  /* 1404D4 801382D4 AFA40018 */        sw $a0, 0x18($sp)
  /* 1404D8 801382D8 0C04DD64 */       jal mn1PCreateToken
  /* 1404DC 801382DC 8FA40018 */        lw $a0, 0x18($sp)
  /* 1404E0 801382E0 0C04CC7D */       jal mn1PCreatePanel
  /* 1404E4 801382E4 8FA40018 */        lw $a0, 0x18($sp)
  /* 1404E8 801382E8 3C028014 */       lui $v0, %hi(gMN1PPanel)
  /* 1404EC 801382EC 24428EE8 */     addiu $v0, $v0, %lo(gMN1PPanel)
  /* 1404F0 801382F0 8C4E002C */        lw $t6, 0x2c($v0) # gMN1PPanel + 44
  /* 1404F4 801382F4 51C0000C */      beql $t6, $zero, .L80138328
  /* 1404F8 801382F8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1404FC 801382FC 8C460020 */        lw $a2, 0x20($v0) # gMN1PPanel + 32
  /* 140500 80138300 2401001C */     addiu $at, $zero, 0x1c
  /* 140504 80138304 8FA50018 */        lw $a1, 0x18($sp)
  /* 140508 80138308 50C10007 */      beql $a2, $at, .L80138328
  /* 14050C 8013830C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 140510 80138310 8C440008 */        lw $a0, 8($v0) # gMN1PPanel + 8
  /* 140514 80138314 0C04D418 */       jal mn1PSpawnFighter
  /* 140518 80138318 8C470024 */        lw $a3, 0x24($v0) # gMN1PPanel + 36
  /* 14051C 8013831C 0C04D2CF */       jal mn1PDrawHighscoreAndBonuses
  /* 140520 80138320 00000000 */       nop
  /* 140524 80138324 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138328:
  /* 140528 80138328 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14052C 8013832C 03E00008 */        jr $ra
  /* 140530 80138330 00000000 */       nop

glabel mn1PInitCSS
  /* 140534 80138334 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 140538 80138338 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 14053C 8013833C 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 140540 80138340 3C188014 */       lui $t8, %hi(D_ovl27_801392E0)
  /* 140544 80138344 3C088014 */       lui $t0, %hi(D_ovl27_801392A8)
  /* 140548 80138348 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14054C 8013834C 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 140550 80138350 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 140554 80138354 271892E0 */     addiu $t8, $t8, %lo(D_ovl27_801392E0)
  /* 140558 80138358 24190078 */     addiu $t9, $zero, 0x78
  /* 14055C 8013835C 250892A8 */     addiu $t0, $t0, %lo(D_ovl27_801392A8)
  /* 140560 80138360 24090007 */     addiu $t1, $zero, 7
  /* 140564 80138364 AFB00020 */        sw $s0, 0x20($sp)
  /* 140568 80138368 AFAE0040 */        sw $t6, 0x40($sp)
  /* 14056C 8013836C AFAF0044 */        sw $t7, 0x44($sp)
  /* 140570 80138370 AFA00048 */        sw $zero, 0x48($sp)
  /* 140574 80138374 AFA0004C */        sw $zero, 0x4c($sp)
  /* 140578 80138378 AFB80050 */        sw $t8, 0x50($sp)
  /* 14057C 8013837C AFB90054 */        sw $t9, 0x54($sp)
  /* 140580 80138380 AFA80058 */        sw $t0, 0x58($sp)
  /* 140584 80138384 AFA9005C */        sw $t1, 0x5c($sp)
  /* 140588 80138388 0C0337DE */       jal rdManagerInitSetup
  /* 14058C 8013838C 27A40040 */     addiu $a0, $sp, 0x40
  /* 140590 80138390 3C108014 */       lui $s0, %hi(D_ovl27_80138630)
  /* 140594 80138394 26108630 */     addiu $s0, $s0, %lo(D_ovl27_80138630)
  /* 140598 80138398 02002025 */        or $a0, $s0, $zero
  /* 14059C 8013839C 0C0337BB */       jal rdManagerGetAllocSize
  /* 1405A0 801383A0 2405000B */     addiu $a1, $zero, 0xb
  /* 1405A4 801383A4 00402025 */        or $a0, $v0, $zero
  /* 1405A8 801383A8 0C001260 */       jal gsMemoryAlloc
  /* 1405AC 801383AC 24050010 */     addiu $a1, $zero, 0x10
  /* 1405B0 801383B0 3C068014 */       lui $a2, %hi(D_ovl27_801396A0)
  /* 1405B4 801383B4 24C696A0 */     addiu $a2, $a2, %lo(D_ovl27_801396A0)
  /* 1405B8 801383B8 02002025 */        or $a0, $s0, $zero
  /* 1405BC 801383BC 2405000B */     addiu $a1, $zero, 0xb
  /* 1405C0 801383C0 0C033781 */       jal rdManagerLoadFiles
  /* 1405C4 801383C4 00403825 */        or $a3, $v0, $zero
  /* 1405C8 801383C8 3C108000 */       lui $s0, %hi(D_NF_80000001)
  /* 1405CC 801383CC 3C058013 */       lui $a1, %hi(mn1PMain)
  /* 1405D0 801383D0 24A57FCC */     addiu $a1, $a1, %lo(mn1PMain)
  /* 1405D4 801383D4 02003825 */        or $a3, $s0, $zero
  /* 1405D8 801383D8 24040400 */     addiu $a0, $zero, 0x400
  /* 1405DC 801383DC 0C00265A */       jal omMakeGObjSPAfter
  /* 1405E0 801383E0 2406000F */     addiu $a2, $zero, 0xf
  /* 1405E4 801383E4 24040010 */     addiu $a0, $zero, 0x10
  /* 1405E8 801383E8 02002825 */        or $a1, $s0, $zero
  /* 1405EC 801383EC 24060064 */     addiu $a2, $zero, 0x64
  /* 1405F0 801383F0 24070001 */     addiu $a3, $zero, 1
  /* 1405F4 801383F4 0C002E7F */       jal func_8000B9FC
  /* 1405F8 801383F8 AFA00010 */        sw $zero, 0x10($sp)
  /* 1405FC 801383FC 0C045624 */       jal func_ovl2_80115890
  /* 140600 80138400 00000000 */       nop
  /* 140604 80138404 0C03F4C0 */       jal efManager_AllocUserData
  /* 140608 80138408 00000000 */       nop
  /* 14060C 8013840C 24040001 */     addiu $a0, $zero, 1
  /* 140610 80138410 0C035C65 */       jal ftManagerAllocFighter
  /* 140614 80138414 24050001 */     addiu $a1, $zero, 1
  /* 140618 80138418 00008025 */        or $s0, $zero, $zero
  .L8013841C:
  /* 14061C 8013841C 0C035E1B */       jal ftManagerSetupDataKind
  /* 140620 80138420 02002025 */        or $a0, $s0, $zero
  /* 140624 80138424 26100001 */     addiu $s0, $s0, %lo(D_NF_80000001)
  /* 140628 80138428 2401000C */     addiu $at, $zero, 0xc
  /* 14062C 8013842C 1601FFFB */       bne $s0, $at, .L8013841C
  /* 140630 80138430 00000000 */       nop
  /* 140634 80138434 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 140638 80138438 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 14063C 8013843C 0C001260 */       jal gsMemoryAlloc
  /* 140640 80138440 24050010 */     addiu $a1, $zero, 0x10
  /* 140644 80138444 3C018014 */       lui $at, %hi(gMN1PAnimHeap)
  /* 140648 80138448 0C04E076 */       jal mn1PLoadMatchInfo
  /* 14064C 8013844C AC228FC4 */        sw $v0, %lo(gMN1PAnimHeap)($at)
  /* 140650 80138450 0C04CBC7 */       jal mn1PCreatePortraitViewport
  /* 140654 80138454 00000000 */       nop
  /* 140658 80138458 0C04DC9A */       jal mn1PCreateCursorViewport
  /* 14065C 8013845C 00000000 */       nop
  /* 140660 80138460 0C04DCC2 */       jal mn1PCreateDroppedTokenViewport
  /* 140664 80138464 00000000 */       nop
  /* 140668 80138468 0C04CC3F */       jal mn1PCreatePanelViewport
  /* 14066C 8013846C 00000000 */       nop
  /* 140670 80138470 0C04D473 */       jal mn1PCreateFighterViewport
  /* 140674 80138474 00000000 */       nop
  /* 140678 80138478 0C04CBEF */       jal mn1PCreatePortraitBackgroundViewport
  /* 14067C 8013847C 00000000 */       nop
  /* 140680 80138480 0C04CC17 */       jal mn1PCreatePortraitWhiteBackgroundViewport
  /* 140684 80138484 00000000 */       nop
  /* 140688 80138488 0C04CE64 */       jal mn1PCreateBackgroundViewport
  /* 14068C 8013848C 00000000 */       nop
  /* 140690 80138490 0C04D1AE */       jal mn1PCreateTitleOptionsAndBackViewport
  /* 140694 80138494 00000000 */       nop
  /* 140698 80138498 0C04DCEA */       jal mn1PCreateReadyToFightViewport
  /* 14069C 8013849C 00000000 */       nop
  /* 1406A0 801384A0 0C04CE3B */       jal mn1PCreateBackground
  /* 1406A4 801384A4 00000000 */       nop
  /* 1406A8 801384A8 0C04CB58 */       jal mn1PCreatePortraits
  /* 1406AC 801384AC 00000000 */       nop
  /* 1406B0 801384B0 3C048014 */       lui $a0, %hi(gMN1PHumanPanelPort)
  /* 1406B4 801384B4 0C04E0B2 */       jal mn1PInitPanel
  /* 1406B8 801384B8 8C848FA8 */        lw $a0, %lo(gMN1PHumanPanelPort)($a0)
  /* 1406BC 801384BC 0C04D0F2 */       jal mn1PDrawPickerOptionsTitleAndBack
  /* 1406C0 801384C0 00000000 */       nop
  /* 1406C4 801384C4 0C04D3A2 */       jal mn1PDrawTotalHighscoreAndBonuses
  /* 1406C8 801384C8 00000000 */       nop
  /* 1406CC 801384CC 0C04CFCC */       jal mn1PCreateLevelAndArrows
  /* 1406D0 801384D0 00000000 */       nop
  /* 1406D4 801384D4 0C04D0D3 */       jal mn1PCreateStockAndArrows
  /* 1406D8 801384D8 00000000 */       nop
  /* 1406DC 801384DC 0C04DE7A */       jal mn1PCreateTokenAutopositionRoutine
  /* 1406E0 801384E0 00000000 */       nop
  /* 1406E4 801384E4 0C04DEC1 */       jal mn1PCreateWhiteCircles
  /* 1406E8 801384E8 00000000 */       nop
  /* 1406EC 801384EC 0C04DF19 */       jal mn1PCreateReadyToFightObjects
  /* 1406F0 801384F0 00000000 */       nop
  /* 1406F4 801384F4 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 1406F8 801384F8 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 1406FC 801384FC 240A00FF */     addiu $t2, $zero, 0xff
  /* 140700 80138500 240B00FF */     addiu $t3, $zero, 0xff
  /* 140704 80138504 AFAB0014 */        sw $t3, 0x14($sp)
  /* 140708 80138508 AFAA0010 */        sw $t2, 0x10($sp)
  /* 14070C 8013850C 240600FF */     addiu $a2, $zero, 0xff
  /* 140710 80138510 240700FF */     addiu $a3, $zero, 0xff
  /* 140714 80138514 0C0E4138 */       jal func_ovl1_803904E0
  /* 140718 80138518 46006386 */     mov.s $f14, $f12
  /* 14071C 8013851C 3C0C800A */       lui $t4, %hi((gSceneData + 0x1))
  /* 140720 80138520 918C4AD1 */       lbu $t4, %lo((gSceneData + 0x1))($t4)
  /* 140724 80138524 24010015 */     addiu $at, $zero, 0x15
  /* 140728 80138528 00002025 */        or $a0, $zero, $zero
  /* 14072C 8013852C 11810003 */       beq $t4, $at, .L8013853C
  /* 140730 80138530 00000000 */       nop
  /* 140734 80138534 0C0082AD */       jal func_80020AB4
  /* 140738 80138538 2405000A */     addiu $a1, $zero, 0xa
  .L8013853C:
  /* 14073C 8013853C 0C009A70 */       jal func_800269C0
  /* 140740 80138540 240401DF */     addiu $a0, $zero, 0x1df
  /* 140744 80138544 8FBF0024 */        lw $ra, 0x24($sp)
  /* 140748 80138548 8FB00020 */        lw $s0, 0x20($sp)
  /* 14074C 8013854C 27BD0068 */     addiu $sp, $sp, 0x68
  /* 140750 80138550 03E00008 */        jr $ra
  /* 140754 80138554 00000000 */       nop

glabel classic_css_entry
  /* 140758 80138558 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 14075C 8013855C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 140760 80138560 3C048014 */       lui $a0, %hi(D_ovl27_80138C90)
  /* 140764 80138564 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 140768 80138568 24848C90 */     addiu $a0, $a0, %lo(D_ovl27_80138C90)
  /* 14076C 8013856C AFBF0014 */        sw $ra, 0x14($sp)
  /* 140770 80138570 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 140774 80138574 0C001C09 */       jal func_80007024
  /* 140778 80138578 AC8F000C */        sw $t7, 0xc($a0) # D_ovl27_80138C90 + 12
  /* 14077C 8013857C 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 140780 80138580 3C198014 */       lui $t9, %hi(D_NF_801396D0)
  /* 140784 80138584 3C048014 */       lui $a0, %hi(D_ovl27_80138CAC)
  /* 140788 80138588 273996D0 */     addiu $t9, $t9, %lo(D_NF_801396D0)
  /* 14078C 8013858C 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 140790 80138590 24848CAC */     addiu $a0, $a0, %lo(D_ovl27_80138CAC)
  /* 140794 80138594 03194023 */      subu $t0, $t8, $t9
  /* 140798 80138598 0C001A0F */       jal gsGTLSceneInit
  /* 14079C 8013859C AC880010 */        sw $t0, 0x10($a0) # D_ovl27_80138CAC + 16
  /* 1407A0 801385A0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1407A4 801385A4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1407A8 801385A8 03E00008 */        jr $ra
  /* 1407AC 801385AC 00000000 */       nop
