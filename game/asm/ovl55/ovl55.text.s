.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x80134160

glabel func_ovl55_80131B00
  /* 178560 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 178564 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 178568 80131B08 8C830000 */        lw $v1, ($a0)
  /* 17856C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 178570 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 178574 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 178578 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 17857C 80131B1C 3C180002 */       lui $t8, 2
  /* 178580 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 178584 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 178588 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 17858C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 178590 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 178594 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 178598 80131B38 44060000 */      mfc1 $a2, $f0
  /* 17859C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 1785A0 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 1785A4 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 1785A8 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1785AC 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1785B0 80131B50 03E00008 */        jr $ra
  /* 1785B4 80131B54 00000000 */       nop 

glabel func_ovl55_80131B58
  /* 1785B8 80131B58 14A00003 */      bnez $a1, .L80131B68
  /* 1785BC 80131B5C 00801825 */        or $v1, $a0, $zero
  /* 1785C0 80131B60 03E00008 */        jr $ra
  /* 1785C4 80131B64 24020001 */     addiu $v0, $zero, 1

  .L80131B68:
  /* 1785C8 80131B68 28A10002 */      slti $at, $a1, 2
  /* 1785CC 80131B6C 1420001F */      bnez $at, .L80131BEC
  /* 1785D0 80131B70 00A01025 */        or $v0, $a1, $zero
  /* 1785D4 80131B74 24A7FFFF */     addiu $a3, $a1, -1
  /* 1785D8 80131B78 30E70003 */      andi $a3, $a3, 3
  /* 1785DC 80131B7C 00073823 */      negu $a3, $a3
  /* 1785E0 80131B80 10E00008 */      beqz $a3, .L80131BA4
  /* 1785E4 80131B84 00E53021 */      addu $a2, $a3, $a1
  .L80131B88:
  /* 1785E8 80131B88 00640019 */     multu $v1, $a0
  /* 1785EC 80131B8C 2442FFFF */     addiu $v0, $v0, -1
  /* 1785F0 80131B90 00001812 */      mflo $v1
  /* 1785F4 80131B94 14C2FFFC */       bne $a2, $v0, .L80131B88
  /* 1785F8 80131B98 00000000 */       nop 
  /* 1785FC 80131B9C 24050001 */     addiu $a1, $zero, 1
  /* 178600 80131BA0 10450012 */       beq $v0, $a1, .L80131BEC
  .L80131BA4:
  /* 178604 80131BA4 24050001 */     addiu $a1, $zero, 1
  .L80131BA8:
  /* 178608 80131BA8 00640019 */     multu $v1, $a0
  /* 17860C 80131BAC 2442FFFC */     addiu $v0, $v0, -4
  /* 178610 80131BB0 00001812 */      mflo $v1
  /* 178614 80131BB4 00000000 */       nop 
  /* 178618 80131BB8 00000000 */       nop 
  /* 17861C 80131BBC 00640019 */     multu $v1, $a0
  /* 178620 80131BC0 00001812 */      mflo $v1
  /* 178624 80131BC4 00000000 */       nop 
  /* 178628 80131BC8 00000000 */       nop 
  /* 17862C 80131BCC 00640019 */     multu $v1, $a0
  /* 178630 80131BD0 00001812 */      mflo $v1
  /* 178634 80131BD4 00000000 */       nop 
  /* 178638 80131BD8 00000000 */       nop 
  /* 17863C 80131BDC 00640019 */     multu $v1, $a0
  /* 178640 80131BE0 00001812 */      mflo $v1
  /* 178644 80131BE4 1445FFF0 */       bne $v0, $a1, .L80131BA8
  /* 178648 80131BE8 00000000 */       nop 
  .L80131BEC:
  /* 17864C 80131BEC 00601025 */        or $v0, $v1, $zero
  /* 178650 80131BF0 03E00008 */        jr $ra
  /* 178654 80131BF4 00000000 */       nop 

glabel gmContinueScoreDigitInitSprite
  /* 178658 80131BF8 948E0024 */       lhu $t6, 0x24($a0)
  /* 17865C 80131BFC 240800FF */     addiu $t0, $zero, 0xff
  /* 178660 80131C00 240900EC */     addiu $t1, $zero, 0xec
  /* 178664 80131C04 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 178668 80131C08 A4980024 */        sh $t8, 0x24($a0)
  /* 17866C 80131C0C 37190001 */       ori $t9, $t8, 1
  /* 178670 80131C10 A4990024 */        sh $t9, 0x24($a0)
  /* 178674 80131C14 A0800060 */        sb $zero, 0x60($a0)
  /* 178678 80131C18 A0800061 */        sb $zero, 0x61($a0)
  /* 17867C 80131C1C A0800062 */        sb $zero, 0x62($a0)
  /* 178680 80131C20 A0880028 */        sb $t0, 0x28($a0)
  /* 178684 80131C24 A0890029 */        sb $t1, 0x29($a0)
  /* 178688 80131C28 03E00008 */        jr $ra
  /* 17868C 80131C2C A080002A */        sb $zero, 0x2a($a0)

glabel gmContinueGetScoreDigitCount
  /* 178690 80131C30 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 178694 80131C34 AFB20020 */        sw $s2, 0x20($sp)
  /* 178698 80131C38 AFB1001C */        sw $s1, 0x1c($sp)
  /* 17869C 80131C3C 00809025 */        or $s2, $a0, $zero
  /* 1786A0 80131C40 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1786A4 80131C44 AFB00018 */        sw $s0, 0x18($sp)
  /* 1786A8 80131C48 18A0001D */      blez $a1, .L80131CC0
  /* 1786AC 80131C4C 00A08825 */        or $s1, $a1, $zero
  .L80131C50:
  /* 1786B0 80131C50 2630FFFF */     addiu $s0, $s1, -1
  /* 1786B4 80131C54 02002825 */        or $a1, $s0, $zero
  /* 1786B8 80131C58 0C04C6D6 */       jal func_ovl55_80131B58
  /* 1786BC 80131C5C 2404000A */     addiu $a0, $zero, 0xa
  /* 1786C0 80131C60 10400011 */      beqz $v0, .L80131CA8
  /* 1786C4 80131C64 00001825 */        or $v1, $zero, $zero
  /* 1786C8 80131C68 2404000A */     addiu $a0, $zero, 0xa
  /* 1786CC 80131C6C 0C04C6D6 */       jal func_ovl55_80131B58
  /* 1786D0 80131C70 02002825 */        or $a1, $s0, $zero
  /* 1786D4 80131C74 0242001A */       div $zero, $s2, $v0
  /* 1786D8 80131C78 00001812 */      mflo $v1
  /* 1786DC 80131C7C 14400002 */      bnez $v0, .L80131C88
  /* 1786E0 80131C80 00000000 */       nop 
  /* 1786E4 80131C84 0007000D */     break 7
  .L80131C88:
  /* 1786E8 80131C88 2401FFFF */     addiu $at, $zero, -1
  /* 1786EC 80131C8C 14410004 */       bne $v0, $at, .L80131CA0
  /* 1786F0 80131C90 3C018000 */       lui $at, 0x8000
  /* 1786F4 80131C94 16410002 */       bne $s2, $at, .L80131CA0
  /* 1786F8 80131C98 00000000 */       nop 
  /* 1786FC 80131C9C 0006000D */     break 6
  .L80131CA0:
  /* 178700 80131CA0 10000001 */         b .L80131CA8
  /* 178704 80131CA4 00000000 */       nop 
  .L80131CA8:
  /* 178708 80131CA8 10600003 */      beqz $v1, .L80131CB8
  /* 17870C 80131CAC 00000000 */       nop 
  /* 178710 80131CB0 10000004 */         b .L80131CC4
  /* 178714 80131CB4 02201025 */        or $v0, $s1, $zero
  .L80131CB8:
  /* 178718 80131CB8 1600FFE5 */      bnez $s0, .L80131C50
  /* 17871C 80131CBC 02008825 */        or $s1, $s0, $zero
  .L80131CC0:
  /* 178720 80131CC0 00001025 */        or $v0, $zero, $zero
  .L80131CC4:
  /* 178724 80131CC4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 178728 80131CC8 8FB00018 */        lw $s0, 0x18($sp)
  /* 17872C 80131CCC 8FB1001C */        lw $s1, 0x1c($sp)
  /* 178730 80131CD0 8FB20020 */        lw $s2, 0x20($sp)
  /* 178734 80131CD4 03E00008 */        jr $ra
  /* 178738 80131CD8 27BD0028 */     addiu $sp, $sp, 0x28

glabel gmContinueScoreDigitGetSprite
  /* 17873C 80131CDC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 178740 80131CE0 3C0E8013 */       lui $t6, %hi(D_ovl55_801341A8)
  /* 178744 80131CE4 27A30000 */     addiu $v1, $sp, 0
  /* 178748 80131CE8 25CE41A8 */     addiu $t6, $t6, %lo(D_ovl55_801341A8)
  /* 17874C 80131CEC 25C80024 */     addiu $t0, $t6, 0x24
  /* 178750 80131CF0 0060C825 */        or $t9, $v1, $zero
  .L80131CF4:
  /* 178754 80131CF4 8DD80000 */        lw $t8, ($t6) # D_ovl55_801341A8 + 0
  /* 178758 80131CF8 25CE000C */     addiu $t6, $t6, 0xc
  /* 17875C 80131CFC 2739000C */     addiu $t9, $t9, 0xc
  /* 178760 80131D00 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 178764 80131D04 8DCFFFF8 */        lw $t7, -8($t6) # D_ovl55_801341A8 + -8
  /* 178768 80131D08 AF2FFFF8 */        sw $t7, -8($t9)
  /* 17876C 80131D0C 8DD8FFFC */        lw $t8, -4($t6) # D_ovl55_801341A8 + -4
  /* 178770 80131D10 15C8FFF8 */       bne $t6, $t0, .L80131CF4
  /* 178774 80131D14 AF38FFFC */        sw $t8, -4($t9)
  /* 178778 80131D18 8DD80000 */        lw $t8, ($t6) # D_ovl55_801341A8 + 0
  /* 17877C 80131D1C 00044880 */       sll $t1, $a0, 2
  /* 178780 80131D20 00695021 */      addu $t2, $v1, $t1
  /* 178784 80131D24 AF380000 */        sw $t8, ($t9)
  /* 178788 80131D28 3C0C8013 */       lui $t4, %hi(D_ovl55_80134534)
  /* 17878C 80131D2C 8D8C4534 */        lw $t4, %lo(D_ovl55_80134534)($t4)
  /* 178790 80131D30 8D4B0000 */        lw $t3, ($t2)
  /* 178794 80131D34 27BD0028 */     addiu $sp, $sp, 0x28
  /* 178798 80131D38 03E00008 */        jr $ra
  /* 17879C 80131D3C 016C1021 */      addu $v0, $t3, $t4

glabel gmContinueMakeScoreDigitSObjs
  /* 1787A0 80131D40 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 1787A4 80131D44 F7B80020 */      sdc1 $f24, 0x20($sp)
  /* 1787A8 80131D48 4487C000 */      mtc1 $a3, $f24
  /* 1787AC 80131D4C AFB70048 */        sw $s7, 0x48($sp)
  /* 1787B0 80131D50 AFB4003C */        sw $s4, 0x3c($sp)
  /* 1787B4 80131D54 00A0A025 */        or $s4, $a1, $zero
  /* 1787B8 80131D58 0080B825 */        or $s7, $a0, $zero
  /* 1787BC 80131D5C AFBF004C */        sw $ra, 0x4c($sp)
  /* 1787C0 80131D60 AFB60044 */        sw $s6, 0x44($sp)
  /* 1787C4 80131D64 AFB50040 */        sw $s5, 0x40($sp)
  /* 1787C8 80131D68 AFB30038 */        sw $s3, 0x38($sp)
  /* 1787CC 80131D6C AFB20034 */        sw $s2, 0x34($sp)
  /* 1787D0 80131D70 AFB10030 */        sw $s1, 0x30($sp)
  /* 1787D4 80131D74 AFB0002C */        sw $s0, 0x2c($sp)
  /* 1787D8 80131D78 F7B60018 */      sdc1 $f22, 0x18($sp)
  /* 1787DC 80131D7C F7B40010 */      sdc1 $f20, 0x10($sp)
  /* 1787E0 80131D80 04A10002 */      bgez $a1, .L80131D8C
  /* 1787E4 80131D84 AFA60058 */        sw $a2, 0x58($sp)
  /* 1787E8 80131D88 0000A025 */        or $s4, $zero, $zero
  .L80131D8C:
  /* 1787EC 80131D8C 2416000A */     addiu $s6, $zero, 0xa
  /* 1787F0 80131D90 0296001A */       div $zero, $s4, $s6
  /* 1787F4 80131D94 00002010 */      mfhi $a0
  /* 1787F8 80131D98 16C00002 */      bnez $s6, .L80131DA4
  /* 1787FC 80131D9C 00000000 */       nop 
  /* 178800 80131DA0 0007000D */     break 7
  .L80131DA4:
  /* 178804 80131DA4 2401FFFF */     addiu $at, $zero, -1
  /* 178808 80131DA8 16C10004 */       bne $s6, $at, .L80131DBC
  /* 17880C 80131DAC 3C018000 */       lui $at, 0x8000
  /* 178810 80131DB0 16810002 */       bne $s4, $at, .L80131DBC
  /* 178814 80131DB4 00000000 */       nop 
  /* 178818 80131DB8 0006000D */     break 6
  .L80131DBC:
  /* 17881C 80131DBC 0C04C737 */       jal gmContinueScoreDigitGetSprite
  /* 178820 80131DC0 00000000 */       nop 
  /* 178824 80131DC4 02E02025 */        or $a0, $s7, $zero
  /* 178828 80131DC8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 17882C 80131DCC 00402825 */        or $a1, $v0, $zero
  /* 178830 80131DD0 00408025 */        or $s0, $v0, $zero
  /* 178834 80131DD4 0C04C6FE */       jal gmContinueScoreDigitInitSprite
  /* 178838 80131DD8 00402025 */        or $a0, $v0, $zero
  /* 17883C 80131DDC 8FB30064 */        lw $s3, 0x64($sp)
  /* 178840 80131DE0 8FB5006C */        lw $s5, 0x6c($sp)
  /* 178844 80131DE4 24110001 */     addiu $s1, $zero, 1
  /* 178848 80131DE8 52600008 */      beql $s3, $zero, .L80131E0C
  /* 17884C 80131DEC 860E0014 */        lh $t6, 0x14($s0)
  /* 178850 80131DF0 44933000 */      mtc1 $s3, $f6
  /* 178854 80131DF4 C7A40058 */      lwc1 $f4, 0x58($sp)
  /* 178858 80131DF8 C7B60060 */      lwc1 $f22, 0x60($sp)
  /* 17885C 80131DFC 46803220 */   cvt.s.w $f8, $f6
  /* 178860 80131E00 10000009 */         b .L80131E28
  /* 178864 80131E04 46082501 */     sub.s $f20, $f4, $f8
  /* 178868 80131E08 860E0014 */        lh $t6, 0x14($s0)
  .L80131E0C:
  /* 17886C 80131E0C C7B60060 */      lwc1 $f22, 0x60($sp)
  /* 178870 80131E10 C7AA0058 */      lwc1 $f10, 0x58($sp)
  /* 178874 80131E14 448E8000 */      mtc1 $t6, $f16
  /* 178878 80131E18 00000000 */       nop 
  /* 17887C 80131E1C 468084A0 */   cvt.s.w $f18, $f16
  /* 178880 80131E20 46169180 */     add.s $f6, $f18, $f22
  /* 178884 80131E24 46065501 */     sub.s $f20, $f10, $f6
  .L80131E28:
  /* 178888 80131E28 E6140058 */      swc1 $f20, 0x58($s0)
  /* 17888C 80131E2C 12A00004 */      beqz $s5, .L80131E40
  /* 178890 80131E30 E618005C */      swc1 $f24, 0x5c($s0)
  /* 178894 80131E34 8FB20068 */        lw $s2, 0x68($sp)
  /* 178898 80131E38 10000006 */         b .L80131E54
  /* 17889C 80131E3C 02401825 */        or $v1, $s2, $zero
  .L80131E40:
  /* 1788A0 80131E40 8FB20068 */        lw $s2, 0x68($sp)
  /* 1788A4 80131E44 02802025 */        or $a0, $s4, $zero
  /* 1788A8 80131E48 0C04C70C */       jal gmContinueGetScoreDigitCount
  /* 1788AC 80131E4C 02402825 */        or $a1, $s2, $zero
  /* 1788B0 80131E50 00401825 */        or $v1, $v0, $zero
  .L80131E54:
  /* 1788B4 80131E54 28610002 */      slti $at, $v1, 2
  /* 1788B8 80131E58 14200041 */      bnez $at, .L80131F60
  /* 1788BC 80131E5C 02C02025 */        or $a0, $s6, $zero
  .L80131E60:
  /* 1788C0 80131E60 0C04C6D6 */       jal func_ovl55_80131B58
  /* 1788C4 80131E64 02202825 */        or $a1, $s1, $zero
  /* 1788C8 80131E68 10400011 */      beqz $v0, .L80131EB0
  /* 1788CC 80131E6C 00001825 */        or $v1, $zero, $zero
  /* 1788D0 80131E70 02C02025 */        or $a0, $s6, $zero
  /* 1788D4 80131E74 0C04C6D6 */       jal func_ovl55_80131B58
  /* 1788D8 80131E78 02202825 */        or $a1, $s1, $zero
  /* 1788DC 80131E7C 0282001A */       div $zero, $s4, $v0
  /* 1788E0 80131E80 00001812 */      mflo $v1
  /* 1788E4 80131E84 14400002 */      bnez $v0, .L80131E90
  /* 1788E8 80131E88 00000000 */       nop 
  /* 1788EC 80131E8C 0007000D */     break 7
  .L80131E90:
  /* 1788F0 80131E90 2401FFFF */     addiu $at, $zero, -1
  /* 1788F4 80131E94 14410004 */       bne $v0, $at, .L80131EA8
  /* 1788F8 80131E98 3C018000 */       lui $at, 0x8000
  /* 1788FC 80131E9C 16810002 */       bne $s4, $at, .L80131EA8
  /* 178900 80131EA0 00000000 */       nop 
  /* 178904 80131EA4 0006000D */     break 6
  .L80131EA8:
  /* 178908 80131EA8 10000001 */         b .L80131EB0
  /* 17890C 80131EAC 00000000 */       nop 
  .L80131EB0:
  /* 178910 80131EB0 0076001A */       div $zero, $v1, $s6
  /* 178914 80131EB4 00002010 */      mfhi $a0
  /* 178918 80131EB8 16C00002 */      bnez $s6, .L80131EC4
  /* 17891C 80131EBC 00000000 */       nop 
  /* 178920 80131EC0 0007000D */     break 7
  .L80131EC4:
  /* 178924 80131EC4 2401FFFF */     addiu $at, $zero, -1
  /* 178928 80131EC8 16C10004 */       bne $s6, $at, .L80131EDC
  /* 17892C 80131ECC 3C018000 */       lui $at, 0x8000
  /* 178930 80131ED0 14610002 */       bne $v1, $at, .L80131EDC
  /* 178934 80131ED4 00000000 */       nop 
  /* 178938 80131ED8 0006000D */     break 6
  .L80131EDC:
  /* 17893C 80131EDC 0C04C737 */       jal gmContinueScoreDigitGetSprite
  /* 178940 80131EE0 00000000 */       nop 
  /* 178944 80131EE4 02E02025 */        or $a0, $s7, $zero
  /* 178948 80131EE8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 17894C 80131EEC 00402825 */        or $a1, $v0, $zero
  /* 178950 80131EF0 00408025 */        or $s0, $v0, $zero
  /* 178954 80131EF4 0C04C6FE */       jal gmContinueScoreDigitInitSprite
  /* 178958 80131EF8 00402025 */        or $a0, $v0, $zero
  /* 17895C 80131EFC 12600006 */      beqz $s3, .L80131F18
  /* 178960 80131F00 26310001 */     addiu $s1, $s1, 1
  /* 178964 80131F04 44932000 */      mtc1 $s3, $f4
  /* 178968 80131F08 00000000 */       nop 
  /* 17896C 80131F0C 46802220 */   cvt.s.w $f8, $f4
  /* 178970 80131F10 10000007 */         b .L80131F30
  /* 178974 80131F14 4608A501 */     sub.s $f20, $f20, $f8
  .L80131F18:
  /* 178978 80131F18 860F0014 */        lh $t7, 0x14($s0)
  /* 17897C 80131F1C 448F8000 */      mtc1 $t7, $f16
  /* 178980 80131F20 00000000 */       nop 
  /* 178984 80131F24 468084A0 */   cvt.s.w $f18, $f16
  /* 178988 80131F28 46169280 */     add.s $f10, $f18, $f22
  /* 17898C 80131F2C 460AA501 */     sub.s $f20, $f20, $f10
  .L80131F30:
  /* 178990 80131F30 E6140058 */      swc1 $f20, 0x58($s0)
  /* 178994 80131F34 12A00003 */      beqz $s5, .L80131F44
  /* 178998 80131F38 E618005C */      swc1 $f24, 0x5c($s0)
  /* 17899C 80131F3C 10000005 */         b .L80131F54
  /* 1789A0 80131F40 02401825 */        or $v1, $s2, $zero
  .L80131F44:
  /* 1789A4 80131F44 02802025 */        or $a0, $s4, $zero
  /* 1789A8 80131F48 0C04C70C */       jal gmContinueGetScoreDigitCount
  /* 1789AC 80131F4C 02402825 */        or $a1, $s2, $zero
  /* 1789B0 80131F50 00401825 */        or $v1, $v0, $zero
  .L80131F54:
  /* 1789B4 80131F54 0223082A */       slt $at, $s1, $v1
  /* 1789B8 80131F58 5420FFC1 */      bnel $at, $zero, .L80131E60
  /* 1789BC 80131F5C 02C02025 */        or $a0, $s6, $zero
  .L80131F60:
  /* 1789C0 80131F60 8FBF004C */        lw $ra, 0x4c($sp)
  /* 1789C4 80131F64 D7B40010 */      ldc1 $f20, 0x10($sp)
  /* 1789C8 80131F68 D7B60018 */      ldc1 $f22, 0x18($sp)
  /* 1789CC 80131F6C D7B80020 */      ldc1 $f24, 0x20($sp)
  /* 1789D0 80131F70 8FB0002C */        lw $s0, 0x2c($sp)
  /* 1789D4 80131F74 8FB10030 */        lw $s1, 0x30($sp)
  /* 1789D8 80131F78 8FB20034 */        lw $s2, 0x34($sp)
  /* 1789DC 80131F7C 8FB30038 */        lw $s3, 0x38($sp)
  /* 1789E0 80131F80 8FB4003C */        lw $s4, 0x3c($sp)
  /* 1789E4 80131F84 8FB50040 */        lw $s5, 0x40($sp)
  /* 1789E8 80131F88 8FB60044 */        lw $s6, 0x44($sp)
  /* 1789EC 80131F8C 8FB70048 */        lw $s7, 0x48($sp)
  /* 1789F0 80131F90 03E00008 */        jr $ra
  /* 1789F4 80131F94 27BD0050 */     addiu $sp, $sp, 0x50

glabel gmContinueMakeScoreDisplay
  /* 1789F8 80131F98 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1789FC 80131F9C AFBF0024 */        sw $ra, 0x24($sp)
  /* 178A00 80131FA0 AFA40030 */        sw $a0, 0x30($sp)
  /* 178A04 80131FA4 00002025 */        or $a0, $zero, $zero
  /* 178A08 80131FA8 00002825 */        or $a1, $zero, $zero
  /* 178A0C 80131FAC 24060014 */     addiu $a2, $zero, 0x14
  /* 178A10 80131FB0 0C00265A */       jal omMakeGObjSPAfter
  /* 178A14 80131FB4 3C078000 */       lui $a3, 0x8000
  /* 178A18 80131FB8 3C018013 */       lui $at, %hi(sGMContinueScoreGObj)
  /* 178A1C 80131FBC 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 178A20 80131FC0 240EFFFF */     addiu $t6, $zero, -1
  /* 178A24 80131FC4 AC224368 */        sw $v0, %lo(sGMContinueScoreGObj)($at)
  /* 178A28 80131FC8 AFA2002C */        sw $v0, 0x2c($sp)
  /* 178A2C 80131FCC AFAE0010 */        sw $t6, 0x10($sp)
  /* 178A30 80131FD0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 178A34 80131FD4 00402025 */        or $a0, $v0, $zero
  /* 178A38 80131FD8 2406001C */     addiu $a2, $zero, 0x1c
  /* 178A3C 80131FDC 0C00277D */       jal omAddGObjRenderProc
  /* 178A40 80131FE0 3C078000 */       lui $a3, 0x8000
  /* 178A44 80131FE4 3C0F8013 */       lui $t7, %hi(D_ovl55_8013452C)
  /* 178A48 80131FE8 8DEF452C */        lw $t7, %lo(D_ovl55_8013452C)($t7)
  /* 178A4C 80131FEC 3C180000 */       lui $t8, %hi(D_NF_00000408)
  /* 178A50 80131FF0 27180408 */     addiu $t8, $t8, %lo(D_NF_00000408)
  /* 178A54 80131FF4 8FA4002C */        lw $a0, 0x2c($sp)
  /* 178A58 80131FF8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 178A5C 80131FFC 01F82821 */      addu $a1, $t7, $t8
  /* 178A60 80132000 94590024 */       lhu $t9, 0x24($v0)
  /* 178A64 80132004 3C0142B4 */       lui $at, (0x42B40000 >> 16) # 90.0
  /* 178A68 80132008 44812000 */      mtc1 $at, $f4 # 90.0 to cop1
  /* 178A6C 8013200C 3C014348 */       lui $at, (0x43480000 >> 16) # 200.0
  /* 178A70 80132010 44813000 */      mtc1 $at, $f6 # 200.0 to cop1
  /* 178A74 80132014 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 178A78 80132018 240300FF */     addiu $v1, $zero, 0xff
  /* 178A7C 8013201C A4490024 */        sh $t1, 0x24($v0)
  /* 178A80 80132020 352A0001 */       ori $t2, $t1, 1
  /* 178A84 80132024 240B00C8 */     addiu $t3, $zero, 0xc8
  /* 178A88 80132028 A44A0024 */        sh $t2, 0x24($v0)
  /* 178A8C 8013202C A0430060 */        sb $v1, 0x60($v0)
  /* 178A90 80132030 A0400061 */        sb $zero, 0x61($v0)
  /* 178A94 80132034 A0400062 */        sb $zero, 0x62($v0)
  /* 178A98 80132038 A0430028 */        sb $v1, 0x28($v0)
  /* 178A9C 8013203C A04B0029 */        sb $t3, 0x29($v0)
  /* 178AA0 80132040 A040002A */        sb $zero, 0x2a($v0)
  /* 178AA4 80132044 E4440058 */      swc1 $f4, 0x58($v0)
  /* 178AA8 80132048 E446005C */      swc1 $f6, 0x5c($v0)
  /* 178AAC 8013204C 44804000 */      mtc1 $zero, $f8
  /* 178AB0 80132050 3C064393 */       lui $a2, (0x43938000 >> 16) # 1133740032
  /* 178AB4 80132054 240C0010 */     addiu $t4, $zero, 0x10
  /* 178AB8 80132058 240D0008 */     addiu $t5, $zero, 8
  /* 178ABC 8013205C 240E0001 */     addiu $t6, $zero, 1
  /* 178AC0 80132060 AFAE001C */        sw $t6, 0x1c($sp)
  /* 178AC4 80132064 AFAD0018 */        sw $t5, 0x18($sp)
  /* 178AC8 80132068 AFAC0014 */        sw $t4, 0x14($sp)
  /* 178ACC 8013206C 34C68000 */       ori $a2, $a2, (0x43938000 & 0xFFFF) # 1133740032
  /* 178AD0 80132070 8FA50030 */        lw $a1, 0x30($sp)
  /* 178AD4 80132074 8FA4002C */        lw $a0, 0x2c($sp)
  /* 178AD8 80132078 3C074345 */       lui $a3, 0x4345
  /* 178ADC 8013207C 0C04C750 */       jal gmContinueMakeScoreDigitSObjs
  /* 178AE0 80132080 E7A80010 */      swc1 $f8, 0x10($sp)
  /* 178AE4 80132084 8FBF0024 */        lw $ra, 0x24($sp)
  /* 178AE8 80132088 27BD0030 */     addiu $sp, $sp, 0x30
  /* 178AEC 8013208C 03E00008 */        jr $ra
  /* 178AF0 80132090 00000000 */       nop 

  /* 178AF4 80132094 03E00008 */        jr $ra
  /* 178AF8 80132098 00000000 */       nop 

glabel gmContinueSetFighterScale
  /* 178AFC 8013209C 3C0F8039 */       lui $t7, %hi(D_ovl1_80390D90)
  /* 178B00 801320A0 25EF0D90 */     addiu $t7, $t7, %lo(D_ovl1_80390D90)
  /* 178B04 801320A4 00057080 */       sll $t6, $a1, 2
  /* 178B08 801320A8 01CF1021 */      addu $v0, $t6, $t7
  /* 178B0C 801320AC C4440000 */      lwc1 $f4, ($v0)
  /* 178B10 801320B0 8C980074 */        lw $t8, 0x74($a0)
  /* 178B14 801320B4 E7040040 */      swc1 $f4, 0x40($t8)
  /* 178B18 801320B8 8C990074 */        lw $t9, 0x74($a0)
  /* 178B1C 801320BC C4460000 */      lwc1 $f6, ($v0)
  /* 178B20 801320C0 E7260044 */      swc1 $f6, 0x44($t9)
  /* 178B24 801320C4 8C880074 */        lw $t0, 0x74($a0)
  /* 178B28 801320C8 C4480000 */      lwc1 $f8, ($v0)
  /* 178B2C 801320CC 03E00008 */        jr $ra
  /* 178B30 801320D0 E5080048 */      swc1 $f8, 0x48($t0)

glabel gmContinueMakeFighter
  /* 178B34 801320D4 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 178B38 801320D8 00802825 */        or $a1, $a0, $zero
  /* 178B3C 801320DC 3C0E8011 */       lui $t6, %hi(dFTDefaultFighterDesc)
  /* 178B40 801320E0 27A4001C */     addiu $a0, $sp, 0x1c
  /* 178B44 801320E4 3C028013 */       lui $v0, %hi(sGMContinueFighterDesc)
  /* 178B48 801320E8 25CE6DD0 */     addiu $t6, $t6, %lo(dFTDefaultFighterDesc)
  /* 178B4C 801320EC 24424348 */     addiu $v0, $v0, %lo(sGMContinueFighterDesc)
  /* 178B50 801320F0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 178B54 801320F4 25C8003C */     addiu $t0, $t6, 0x3c
  /* 178B58 801320F8 0080C825 */        or $t9, $a0, $zero
  .L801320FC:
  /* 178B5C 801320FC 8DD80000 */        lw $t8, ($t6) # dFTDefaultFighterDesc + 0
  /* 178B60 80132100 25CE000C */     addiu $t6, $t6, 0xc
  /* 178B64 80132104 2739000C */     addiu $t9, $t9, 0xc
  /* 178B68 80132108 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 178B6C 8013210C 8DCFFFF8 */        lw $t7, -8($t6) # dFTDefaultFighterDesc + -8
  /* 178B70 80132110 AF2FFFF8 */        sw $t7, -8($t9)
  /* 178B74 80132114 8DD8FFFC */        lw $t8, -4($t6) # dFTDefaultFighterDesc + -4
  /* 178B78 80132118 15C8FFF8 */       bne $t6, $t0, .L801320FC
  /* 178B7C 8013211C AF38FFFC */        sw $t8, -4($t9)
  /* 178B80 80132120 8DD80000 */        lw $t8, ($t6) # dFTDefaultFighterDesc + 0
  /* 178B84 80132124 3C0142B4 */       lui $at, (0x42B40000 >> 16) # 90.0
  /* 178B88 80132128 44812000 */      mtc1 $at, $f4 # 90.0 to cop1
  /* 178B8C 8013212C AF380000 */        sw $t8, ($t9)
  /* 178B90 80132130 3C0B8013 */       lui $t3, %hi(sGMContinueFighterAnimHeap)
  /* 178B94 80132134 3C018013 */       lui $at, %hi(D_ovl55_801342E0)
  /* 178B98 80132138 8C490004 */        lw $t1, 4($v0) # sGMContinueFighterDesc + 4
  /* 178B9C 8013213C 8C4A0008 */        lw $t2, 8($v0) # sGMContinueFighterDesc + 8
  /* 178BA0 80132140 8D6B42F8 */        lw $t3, %lo(sGMContinueFighterAnimHeap)($t3)
  /* 178BA4 80132144 C42642E0 */      lwc1 $f6, %lo(D_ovl55_801342E0)($at)
  /* 178BA8 80132148 44804000 */      mtc1 $zero, $f8
  /* 178BAC 8013214C AFA5001C */        sw $a1, 0x1c($sp)
  /* 178BB0 80132150 E7A40020 */      swc1 $f4, 0x20($sp)
  /* 178BB4 80132154 A3A90033 */        sb $t1, 0x33($sp)
  /* 178BB8 80132158 A3AA0034 */        sb $t2, 0x34($sp)
  /* 178BBC 8013215C AFAB0054 */        sw $t3, 0x54($sp)
  /* 178BC0 80132160 E7A60024 */      swc1 $f6, 0x24($sp)
  /* 178BC4 80132164 0C035FCF */       jal ftManagerMakeFighter
  /* 178BC8 80132168 E7A80028 */      swc1 $f8, 0x28($sp)
  /* 178BCC 8013216C 3C018013 */       lui $at, %hi(sGMContinueFighterGObj)
  /* 178BD0 80132170 3C050001 */       lui $a1, (0x10009 >> 16) # 65545
  /* 178BD4 80132174 AC224300 */        sw $v0, %lo(sGMContinueFighterGObj)($at)
  /* 178BD8 80132178 AFA2005C */        sw $v0, 0x5c($sp)
  /* 178BDC 8013217C 34A50009 */       ori $a1, $a1, (0x10009 & 0xFFFF) # 65545
  /* 178BE0 80132180 0C0E4173 */       jal func_ovl1_803905CC
  /* 178BE4 80132184 00402025 */        or $a0, $v0, $zero
  /* 178BE8 80132188 3C058013 */       lui $a1, %hi(sGMContinueFighterDesc)
  /* 178BEC 8013218C 8CA54348 */        lw $a1, %lo(sGMContinueFighterDesc)($a1)
  /* 178BF0 80132190 0C04C827 */       jal gmContinueSetFighterScale
  /* 178BF4 80132194 8FA4005C */        lw $a0, 0x5c($sp)
  /* 178BF8 80132198 8FBF0014 */        lw $ra, 0x14($sp)
  /* 178BFC 8013219C 27BD0060 */     addiu $sp, $sp, 0x60
  /* 178C00 801321A0 03E00008 */        jr $ra
  /* 178C04 801321A4 00000000 */       nop 

glabel gmContinueRoomFadeOutProcRender
  /* 178C08 801321A8 3C028013 */       lui $v0, %hi(sGMContinueRoomFadeOutAlpha)
  /* 178C0C 801321AC 2442432C */     addiu $v0, $v0, %lo(sGMContinueRoomFadeOutAlpha)
  /* 178C10 801321B0 8C430000 */        lw $v1, ($v0) # sGMContinueRoomFadeOutAlpha + 0
  /* 178C14 801321B4 3C0C8004 */       lui $t4, %hi(gDisplayListHead)
  /* 178C18 801321B8 AFA40000 */        sw $a0, ($sp)
  /* 178C1C 801321BC 286100FF */      slti $at, $v1, 0xff
  /* 178C20 801321C0 10200007 */      beqz $at, .L801321E0
  /* 178C24 801321C4 258C65B0 */     addiu $t4, $t4, %lo(gDisplayListHead)
  /* 178C28 801321C8 246E0005 */     addiu $t6, $v1, 5
  /* 178C2C 801321CC 29C10100 */      slti $at, $t6, 0x100
  /* 178C30 801321D0 14200003 */      bnez $at, .L801321E0
  /* 178C34 801321D4 AC4E0000 */        sw $t6, ($v0) # sGMContinueRoomFadeOutAlpha + 0
  /* 178C38 801321D8 241800FF */     addiu $t8, $zero, 0xff
  /* 178C3C 801321DC AC580000 */        sw $t8, ($v0) # sGMContinueRoomFadeOutAlpha + 0
  .L801321E0:
  /* 178C40 801321E0 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178C44 801321E4 3C0DE700 */       lui $t5, 0xe700
  /* 178C48 801321E8 3C0FE300 */       lui $t7, (0xE3000A01 >> 16) # 3808430593
  /* 178C4C 801321EC 24990008 */     addiu $t9, $a0, 8
  /* 178C50 801321F0 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178C54 801321F4 AC800004 */        sw $zero, 4($a0)
  /* 178C58 801321F8 AC8D0000 */        sw $t5, ($a0)
  /* 178C5C 801321FC 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178C60 80132200 35EF0A01 */       ori $t7, $t7, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 178C64 80132204 3C19FA00 */       lui $t9, 0xfa00
  /* 178C68 80132208 248E0008 */     addiu $t6, $a0, 8
  /* 178C6C 8013220C AD8E0000 */        sw $t6, ($t4) # gDisplayListHead + 0
  /* 178C70 80132210 AC800004 */        sw $zero, 4($a0)
  /* 178C74 80132214 AC8F0000 */        sw $t7, ($a0)
  /* 178C78 80132218 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178C7C 8013221C 24980008 */     addiu $t8, $a0, 8
  /* 178C80 80132220 AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 178C84 80132224 AC990000 */        sw $t9, ($a0)
  /* 178C88 80132228 8C4E0000 */        lw $t6, ($v0) # sGMContinueRoomFadeOutAlpha + 0
  /* 178C8C 8013222C 3C19FCFF */       lui $t9, (0xFCFFFFFF >> 16) # 4244635647
  /* 178C90 80132230 3739FFFF */       ori $t9, $t9, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 178C94 80132234 31CF00FF */      andi $t7, $t6, 0xff
  /* 178C98 80132238 AC8F0004 */        sw $t7, 4($a0)
  /* 178C9C 8013223C 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178CA0 80132240 3C0EFFFD */       lui $t6, (0xFFFDF6FB >> 16) # 4294833915
  /* 178CA4 80132244 35CEF6FB */       ori $t6, $t6, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 178CA8 80132248 24980008 */     addiu $t8, $a0, 8
  /* 178CAC 8013224C AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 178CB0 80132250 AC8E0004 */        sw $t6, 4($a0)
  /* 178CB4 80132254 AC990000 */        sw $t9, ($a0)
  /* 178CB8 80132258 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178CBC 8013225C 3C190050 */       lui $t9, (0x5041C8 >> 16) # 5259720
  /* 178CC0 80132260 3C18E200 */       lui $t8, (0xE200001C >> 16) # 3791650844
  /* 178CC4 80132264 248F0008 */     addiu $t7, $a0, 8
  /* 178CC8 80132268 AD8F0000 */        sw $t7, ($t4) # gDisplayListHead + 0
  /* 178CCC 8013226C 3718001C */       ori $t8, $t8, (0xE200001C & 0xFFFF) # 3791650844
  /* 178CD0 80132270 373941C8 */       ori $t9, $t9, (0x5041C8 & 0xFFFF) # 5259720
  /* 178CD4 80132274 AC990004 */        sw $t9, 4($a0)
  /* 178CD8 80132278 AC980000 */        sw $t8, ($a0)
  /* 178CDC 8013227C 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178CE0 80132280 3C180002 */       lui $t8, (0x28028 >> 16) # 163880
  /* 178CE4 80132284 3C0FF64D */       lui $t7, (0xF64D8398 >> 16) # 4132275096
  /* 178CE8 80132288 248E0008 */     addiu $t6, $a0, 8
  /* 178CEC 8013228C AD8E0000 */        sw $t6, ($t4) # gDisplayListHead + 0
  /* 178CF0 80132290 35EF8398 */       ori $t7, $t7, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 178CF4 80132294 37188028 */       ori $t8, $t8, (0x28028 & 0xFFFF) # 163880
  /* 178CF8 80132298 AC980004 */        sw $t8, 4($a0)
  /* 178CFC 8013229C AC8F0000 */        sw $t7, ($a0)
  /* 178D00 801322A0 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178D04 801322A4 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 178D08 801322A8 3C180055 */       lui $t8, (0x552078 >> 16) # 5578872
  /* 178D0C 801322AC 24990008 */     addiu $t9, $a0, 8
  /* 178D10 801322B0 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178D14 801322B4 AC800004 */        sw $zero, 4($a0)
  /* 178D18 801322B8 AC8D0000 */        sw $t5, ($a0)
  /* 178D1C 801322BC 8D840000 */        lw $a0, ($t4) # gDisplayListHead + 0
  /* 178D20 801322C0 37182078 */       ori $t8, $t8, (0x552078 & 0xFFFF) # 5578872
  /* 178D24 801322C4 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 178D28 801322C8 248E0008 */     addiu $t6, $a0, 8
  /* 178D2C 801322CC AD8E0000 */        sw $t6, ($t4) # gDisplayListHead + 0
  /* 178D30 801322D0 AC980004 */        sw $t8, 4($a0)
  /* 178D34 801322D4 03E00008 */        jr $ra
  /* 178D38 801322D8 AC8F0000 */        sw $t7, ($a0)

glabel gmContinueMakeRoomFadeOut
  /* 178D3C 801322DC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 178D40 801322E0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 178D44 801322E4 3C018013 */       lui $at, %hi(sGMContinueRoomFadeOutAlpha)
  /* 178D48 801322E8 AC20432C */        sw $zero, %lo(sGMContinueRoomFadeOutAlpha)($at)
  /* 178D4C 801322EC 00002025 */        or $a0, $zero, $zero
  /* 178D50 801322F0 00002825 */        or $a1, $zero, $zero
  /* 178D54 801322F4 24060017 */     addiu $a2, $zero, 0x17
  /* 178D58 801322F8 0C00265A */       jal omMakeGObjSPAfter
  /* 178D5C 801322FC 3C078000 */       lui $a3, 0x8000
  /* 178D60 80132300 3C018013 */       lui $at, %hi(sGMContinueRoomFadeOutGObj)
  /* 178D64 80132304 3C058013 */       lui $a1, %hi(gmContinueRoomFadeOutProcRender)
  /* 178D68 80132308 240EFFFF */     addiu $t6, $zero, -1
  /* 178D6C 8013230C AC224330 */        sw $v0, %lo(sGMContinueRoomFadeOutGObj)($at)
  /* 178D70 80132310 AFAE0010 */        sw $t6, 0x10($sp)
  /* 178D74 80132314 24A521A8 */     addiu $a1, $a1, %lo(gmContinueRoomFadeOutProcRender)
  /* 178D78 80132318 00402025 */        or $a0, $v0, $zero
  /* 178D7C 8013231C 24060020 */     addiu $a2, $zero, 0x20
  /* 178D80 80132320 0C00277D */       jal omAddGObjRenderProc
  /* 178D84 80132324 3C078000 */       lui $a3, 0x8000
  /* 178D88 80132328 8FBF001C */        lw $ra, 0x1c($sp)
  /* 178D8C 8013232C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 178D90 80132330 03E00008 */        jr $ra
  /* 178D94 80132334 00000000 */       nop 

glabel gmContinueRoomFadeInProcRender
  /* 178D98 80132338 3C0B8013 */       lui $t3, %hi(sGMContinueRoomFadeInAlpha)
  /* 178D9C 8013233C 256B431C */     addiu $t3, $t3, %lo(sGMContinueRoomFadeInAlpha)
  /* 178DA0 80132340 8D620000 */        lw $v0, ($t3) # sGMContinueRoomFadeInAlpha + 0
  /* 178DA4 80132344 3C0C8004 */       lui $t4, %hi(gDisplayListHead)
  /* 178DA8 80132348 AFA40000 */        sw $a0, ($sp)
  /* 178DAC 8013234C 18400005 */      blez $v0, .L80132364
  /* 178DB0 80132350 258C65B0 */     addiu $t4, $t4, %lo(gDisplayListHead)
  /* 178DB4 80132354 244EFFFB */     addiu $t6, $v0, -5
  /* 178DB8 80132358 05C10002 */      bgez $t6, .L80132364
  /* 178DBC 8013235C AD6E0000 */        sw $t6, ($t3) # sGMContinueRoomFadeInAlpha + 0
  /* 178DC0 80132360 AD600000 */        sw $zero, ($t3) # sGMContinueRoomFadeInAlpha + 0
  .L80132364:
  /* 178DC4 80132364 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178DC8 80132368 3C0DE700 */       lui $t5, 0xe700
  /* 178DCC 8013236C 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 178DD0 80132370 24780008 */     addiu $t8, $v1, 8
  /* 178DD4 80132374 AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 178DD8 80132378 AC600004 */        sw $zero, 4($v1)
  /* 178DDC 8013237C AC6D0000 */        sw $t5, ($v1)
  /* 178DE0 80132380 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178DE4 80132384 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 178DE8 80132388 3C18FA00 */       lui $t8, 0xfa00
  /* 178DEC 8013238C 24790008 */     addiu $t9, $v1, 8
  /* 178DF0 80132390 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178DF4 80132394 AC600004 */        sw $zero, 4($v1)
  /* 178DF8 80132398 AC6E0000 */        sw $t6, ($v1)
  /* 178DFC 8013239C 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178E00 801323A0 246F0008 */     addiu $t7, $v1, 8
  /* 178E04 801323A4 AD8F0000 */        sw $t7, ($t4) # gDisplayListHead + 0
  /* 178E08 801323A8 AC780000 */        sw $t8, ($v1)
  /* 178E0C 801323AC 8D790000 */        lw $t9, ($t3) # sGMContinueRoomFadeInAlpha + 0
  /* 178E10 801323B0 3C18FCFF */       lui $t8, (0xFCFFFFFF >> 16) # 4244635647
  /* 178E14 801323B4 3718FFFF */       ori $t8, $t8, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 178E18 801323B8 332E00FF */      andi $t6, $t9, 0xff
  /* 178E1C 801323BC AC6E0004 */        sw $t6, 4($v1)
  /* 178E20 801323C0 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178E24 801323C4 3C19FFFD */       lui $t9, (0xFFFDF6FB >> 16) # 4294833915
  /* 178E28 801323C8 3739F6FB */       ori $t9, $t9, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 178E2C 801323CC 246F0008 */     addiu $t7, $v1, 8
  /* 178E30 801323D0 AD8F0000 */        sw $t7, ($t4) # gDisplayListHead + 0
  /* 178E34 801323D4 AC790004 */        sw $t9, 4($v1)
  /* 178E38 801323D8 AC780000 */        sw $t8, ($v1)
  /* 178E3C 801323DC 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178E40 801323E0 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 178E44 801323E4 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 178E48 801323E8 246E0008 */     addiu $t6, $v1, 8
  /* 178E4C 801323EC AD8E0000 */        sw $t6, ($t4) # gDisplayListHead + 0
  /* 178E50 801323F0 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 178E54 801323F4 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 178E58 801323F8 AC780004 */        sw $t8, 4($v1)
  /* 178E5C 801323FC AC6F0000 */        sw $t7, ($v1)
  /* 178E60 80132400 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178E64 80132404 3C0F0002 */       lui $t7, (0x28028 >> 16) # 163880
  /* 178E68 80132408 3C0EF64D */       lui $t6, (0xF64D8398 >> 16) # 4132275096
  /* 178E6C 8013240C 24790008 */     addiu $t9, $v1, 8
  /* 178E70 80132410 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178E74 80132414 35CE8398 */       ori $t6, $t6, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 178E78 80132418 35EF8028 */       ori $t7, $t7, (0x28028 & 0xFFFF) # 163880
  /* 178E7C 8013241C AC6F0004 */        sw $t7, 4($v1)
  /* 178E80 80132420 AC6E0000 */        sw $t6, ($v1)
  /* 178E84 80132424 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178E88 80132428 3C0EE200 */       lui $t6, (0xE200001C >> 16) # 3791650844
  /* 178E8C 8013242C 3C0F0055 */       lui $t7, (0x552078 >> 16) # 5578872
  /* 178E90 80132430 24780008 */     addiu $t8, $v1, 8
  /* 178E94 80132434 AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 178E98 80132438 AC600004 */        sw $zero, 4($v1)
  /* 178E9C 8013243C AC6D0000 */        sw $t5, ($v1)
  /* 178EA0 80132440 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178EA4 80132444 35EF2078 */       ori $t7, $t7, (0x552078 & 0xFFFF) # 5578872
  /* 178EA8 80132448 35CE001C */       ori $t6, $t6, (0xE200001C & 0xFFFF) # 3791650844
  /* 178EAC 8013244C 24790008 */     addiu $t9, $v1, 8
  /* 178EB0 80132450 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178EB4 80132454 AC6F0004 */        sw $t7, 4($v1)
  /* 178EB8 80132458 03E00008 */        jr $ra
  /* 178EBC 8013245C AC6E0000 */        sw $t6, ($v1)

glabel gmContinueMakeRoomFadeIn
  /* 178EC0 80132460 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 178EC4 80132464 AFBF001C */        sw $ra, 0x1c($sp)
  /* 178EC8 80132468 240E00FF */     addiu $t6, $zero, 0xff
  /* 178ECC 8013246C 3C018013 */       lui $at, %hi(sGMContinueRoomFadeInAlpha)
  /* 178ED0 80132470 AC2E431C */        sw $t6, %lo(sGMContinueRoomFadeInAlpha)($at)
  /* 178ED4 80132474 00002025 */        or $a0, $zero, $zero
  /* 178ED8 80132478 00002825 */        or $a1, $zero, $zero
  /* 178EDC 8013247C 24060011 */     addiu $a2, $zero, 0x11
  /* 178EE0 80132480 0C00265A */       jal omMakeGObjSPAfter
  /* 178EE4 80132484 3C078000 */       lui $a3, 0x8000
  /* 178EE8 80132488 3C018013 */       lui $at, %hi(sGMContinueRoomFadeInGObj)
  /* 178EEC 8013248C 3C058013 */       lui $a1, %hi(gmContinueRoomFadeInProcRender)
  /* 178EF0 80132490 240FFFFF */     addiu $t7, $zero, -1
  /* 178EF4 80132494 AC224320 */        sw $v0, %lo(sGMContinueRoomFadeInGObj)($at)
  /* 178EF8 80132498 AFAF0010 */        sw $t7, 0x10($sp)
  /* 178EFC 8013249C 24A52338 */     addiu $a1, $a1, %lo(gmContinueRoomFadeInProcRender)
  /* 178F00 801324A0 00402025 */        or $a0, $v0, $zero
  /* 178F04 801324A4 2406001A */     addiu $a2, $zero, 0x1a
  /* 178F08 801324A8 0C00277D */       jal omAddGObjRenderProc
  /* 178F0C 801324AC 3C078000 */       lui $a3, 0x8000
  /* 178F10 801324B0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 178F14 801324B4 27BD0020 */     addiu $sp, $sp, 0x20
  /* 178F18 801324B8 03E00008 */        jr $ra
  /* 178F1C 801324BC 00000000 */       nop 

glabel gmContinueSpotlightFadeProcRender
  /* 178F20 801324C0 3C0B8013 */       lui $t3, %hi(sGMContinueSpotlightFadeAlpha)
  /* 178F24 801324C4 256B4324 */     addiu $t3, $t3, %lo(sGMContinueSpotlightFadeAlpha)
  /* 178F28 801324C8 8D620000 */        lw $v0, ($t3) # sGMContinueSpotlightFadeAlpha + 0
  /* 178F2C 801324CC 3C0C8004 */       lui $t4, %hi(gDisplayListHead)
  /* 178F30 801324D0 AFA40000 */        sw $a0, ($sp)
  /* 178F34 801324D4 18400005 */      blez $v0, .L801324EC
  /* 178F38 801324D8 258C65B0 */     addiu $t4, $t4, %lo(gDisplayListHead)
  /* 178F3C 801324DC 244EFFFB */     addiu $t6, $v0, -5
  /* 178F40 801324E0 05C10002 */      bgez $t6, .L801324EC
  /* 178F44 801324E4 AD6E0000 */        sw $t6, ($t3) # sGMContinueSpotlightFadeAlpha + 0
  /* 178F48 801324E8 AD600000 */        sw $zero, ($t3) # sGMContinueSpotlightFadeAlpha + 0
  .L801324EC:
  /* 178F4C 801324EC 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178F50 801324F0 3C0DE700 */       lui $t5, 0xe700
  /* 178F54 801324F4 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 178F58 801324F8 24780008 */     addiu $t8, $v1, 8
  /* 178F5C 801324FC AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 178F60 80132500 AC600004 */        sw $zero, 4($v1)
  /* 178F64 80132504 AC6D0000 */        sw $t5, ($v1)
  /* 178F68 80132508 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178F6C 8013250C 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 178F70 80132510 3C18FA00 */       lui $t8, 0xfa00
  /* 178F74 80132514 24790008 */     addiu $t9, $v1, 8
  /* 178F78 80132518 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178F7C 8013251C AC600004 */        sw $zero, 4($v1)
  /* 178F80 80132520 AC6E0000 */        sw $t6, ($v1)
  /* 178F84 80132524 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178F88 80132528 246F0008 */     addiu $t7, $v1, 8
  /* 178F8C 8013252C AD8F0000 */        sw $t7, ($t4) # gDisplayListHead + 0
  /* 178F90 80132530 AC780000 */        sw $t8, ($v1)
  /* 178F94 80132534 8D790000 */        lw $t9, ($t3) # sGMContinueSpotlightFadeAlpha + 0
  /* 178F98 80132538 3C18FCFF */       lui $t8, (0xFCFFFFFF >> 16) # 4244635647
  /* 178F9C 8013253C 3718FFFF */       ori $t8, $t8, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 178FA0 80132540 332E00FF */      andi $t6, $t9, 0xff
  /* 178FA4 80132544 AC6E0004 */        sw $t6, 4($v1)
  /* 178FA8 80132548 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178FAC 8013254C 3C19FFFD */       lui $t9, (0xFFFDF6FB >> 16) # 4294833915
  /* 178FB0 80132550 3739F6FB */       ori $t9, $t9, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 178FB4 80132554 246F0008 */     addiu $t7, $v1, 8
  /* 178FB8 80132558 AD8F0000 */        sw $t7, ($t4) # gDisplayListHead + 0
  /* 178FBC 8013255C AC790004 */        sw $t9, 4($v1)
  /* 178FC0 80132560 AC780000 */        sw $t8, ($v1)
  /* 178FC4 80132564 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178FC8 80132568 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 178FCC 8013256C 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 178FD0 80132570 246E0008 */     addiu $t6, $v1, 8
  /* 178FD4 80132574 AD8E0000 */        sw $t6, ($t4) # gDisplayListHead + 0
  /* 178FD8 80132578 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 178FDC 8013257C 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 178FE0 80132580 AC780004 */        sw $t8, 4($v1)
  /* 178FE4 80132584 AC6F0000 */        sw $t7, ($v1)
  /* 178FE8 80132588 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 178FEC 8013258C 3C0F0002 */       lui $t7, (0x28028 >> 16) # 163880
  /* 178FF0 80132590 3C0EF64D */       lui $t6, (0xF64D8398 >> 16) # 4132275096
  /* 178FF4 80132594 24790008 */     addiu $t9, $v1, 8
  /* 178FF8 80132598 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 178FFC 8013259C 35CE8398 */       ori $t6, $t6, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 179000 801325A0 35EF8028 */       ori $t7, $t7, (0x28028 & 0xFFFF) # 163880
  /* 179004 801325A4 AC6F0004 */        sw $t7, 4($v1)
  /* 179008 801325A8 AC6E0000 */        sw $t6, ($v1)
  /* 17900C 801325AC 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 179010 801325B0 3C0EE200 */       lui $t6, (0xE200001C >> 16) # 3791650844
  /* 179014 801325B4 3C0F0055 */       lui $t7, (0x552078 >> 16) # 5578872
  /* 179018 801325B8 24780008 */     addiu $t8, $v1, 8
  /* 17901C 801325BC AD980000 */        sw $t8, ($t4) # gDisplayListHead + 0
  /* 179020 801325C0 AC600004 */        sw $zero, 4($v1)
  /* 179024 801325C4 AC6D0000 */        sw $t5, ($v1)
  /* 179028 801325C8 8D830000 */        lw $v1, ($t4) # gDisplayListHead + 0
  /* 17902C 801325CC 35EF2078 */       ori $t7, $t7, (0x552078 & 0xFFFF) # 5578872
  /* 179030 801325D0 35CE001C */       ori $t6, $t6, (0xE200001C & 0xFFFF) # 3791650844
  /* 179034 801325D4 24790008 */     addiu $t9, $v1, 8
  /* 179038 801325D8 AD990000 */        sw $t9, ($t4) # gDisplayListHead + 0
  /* 17903C 801325DC AC6F0004 */        sw $t7, 4($v1)
  /* 179040 801325E0 03E00008 */        jr $ra
  /* 179044 801325E4 AC6E0000 */        sw $t6, ($v1)

glabel gmContinueMakeSpotlightFadeSObjs
  /* 179048 801325E8 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 17904C 801325EC AFBF001C */        sw $ra, 0x1c($sp)
  /* 179050 801325F0 240E00FF */     addiu $t6, $zero, 0xff
  /* 179054 801325F4 3C018013 */       lui $at, %hi(sGMContinueSpotlightFadeAlpha)
  /* 179058 801325F8 AC2E4324 */        sw $t6, %lo(sGMContinueSpotlightFadeAlpha)($at)
  /* 17905C 801325FC 00002025 */        or $a0, $zero, $zero
  /* 179060 80132600 00002825 */        or $a1, $zero, $zero
  /* 179064 80132604 24060016 */     addiu $a2, $zero, 0x16
  /* 179068 80132608 0C00265A */       jal omMakeGObjSPAfter
  /* 17906C 8013260C 3C078000 */       lui $a3, 0x8000
  /* 179070 80132610 3C018013 */       lui $at, %hi(sGMContinueSpotlightFadeGObj)
  /* 179074 80132614 3C058013 */       lui $a1, %hi(gmContinueSpotlightFadeProcRender)
  /* 179078 80132618 240FFFFF */     addiu $t7, $zero, -1
  /* 17907C 8013261C AC224328 */        sw $v0, %lo(sGMContinueSpotlightFadeGObj)($at)
  /* 179080 80132620 AFAF0010 */        sw $t7, 0x10($sp)
  /* 179084 80132624 24A524C0 */     addiu $a1, $a1, %lo(gmContinueSpotlightFadeProcRender)
  /* 179088 80132628 00402025 */        or $a0, $v0, $zero
  /* 17908C 8013262C 2406001F */     addiu $a2, $zero, 0x1f
  /* 179090 80132630 0C00277D */       jal omAddGObjRenderProc
  /* 179094 80132634 3C078000 */       lui $a3, 0x8000
  /* 179098 80132638 8FBF001C */        lw $ra, 0x1c($sp)
  /* 17909C 8013263C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1790A0 80132640 03E00008 */        jr $ra
  /* 1790A4 80132644 00000000 */       nop 

glabel gmContinueMakeRoom
  /* 1790A8 80132648 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1790AC 8013264C AFBF001C */        sw $ra, 0x1c($sp)
  /* 1790B0 80132650 00002025 */        or $a0, $zero, $zero
  /* 1790B4 80132654 00002825 */        or $a1, $zero, $zero
  /* 1790B8 80132658 24060013 */     addiu $a2, $zero, 0x13
  /* 1790BC 8013265C 0C00265A */       jal omMakeGObjSPAfter
  /* 1790C0 80132660 3C078000 */       lui $a3, 0x8000
  /* 1790C4 80132664 3C018013 */       lui $at, %hi(sGMContinueRoomGObj)
  /* 1790C8 80132668 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1790CC 8013266C 240EFFFF */     addiu $t6, $zero, -1
  /* 1790D0 80132670 AC224318 */        sw $v0, %lo(sGMContinueRoomGObj)($at)
  /* 1790D4 80132674 AFA20024 */        sw $v0, 0x24($sp)
  /* 1790D8 80132678 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1790DC 8013267C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1790E0 80132680 00402025 */        or $a0, $v0, $zero
  /* 1790E4 80132684 2406001D */     addiu $a2, $zero, 0x1d
  /* 1790E8 80132688 0C00277D */       jal omAddGObjRenderProc
  /* 1790EC 8013268C 3C078000 */       lui $a3, 0x8000
  /* 1790F0 80132690 3C0F8013 */       lui $t7, %hi(sGMContinueFiles)
  /* 1790F4 80132694 8DEF4528 */        lw $t7, %lo(sGMContinueFiles)($t7)
  /* 1790F8 80132698 3C180002 */       lui $t8, %hi(D_NF_0001E3D8)
  /* 1790FC 8013269C 2718E3D8 */     addiu $t8, $t8, %lo(D_NF_0001E3D8)
  /* 179100 801326A0 8FA40024 */        lw $a0, 0x24($sp)
  /* 179104 801326A4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 179108 801326A8 01F82821 */      addu $a1, $t7, $t8
  /* 17910C 801326AC 3C0141F0 */       lui $at, (0x41F00000 >> 16) # 30.0
  /* 179110 801326B0 44812000 */      mtc1 $at, $f4 # 30.0 to cop1
  /* 179114 801326B4 3C0141E0 */       lui $at, (0x41E00000 >> 16) # 28.0
  /* 179118 801326B8 44813000 */      mtc1 $at, $f6 # 28.0 to cop1
  /* 17911C 801326BC E4440058 */      swc1 $f4, 0x58($v0)
  /* 179120 801326C0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 179124 801326C4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 179128 801326C8 27BD0028 */     addiu $sp, $sp, 0x28
  /* 17912C 801326CC 03E00008 */        jr $ra
  /* 179130 801326D0 00000000 */       nop 

glabel gmContinueMakeSpotlightSObjs
  /* 179134 801326D4 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 179138 801326D8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 17913C 801326DC 00002025 */        or $a0, $zero, $zero
  /* 179140 801326E0 00002825 */        or $a1, $zero, $zero
  /* 179144 801326E4 24060015 */     addiu $a2, $zero, 0x15
  /* 179148 801326E8 0C00265A */       jal omMakeGObjSPAfter
  /* 17914C 801326EC 3C078000 */       lui $a3, 0x8000
  /* 179150 801326F0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 179154 801326F4 3C018013 */       lui $at, %hi(sGMContinueShadowGObj)
  /* 179158 801326F8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 17915C 801326FC 240EFFFF */     addiu $t6, $zero, -1
  /* 179160 80132700 AC224308 */        sw $v0, %lo(sGMContinueShadowGObj)($at)
  /* 179164 80132704 AFA2002C */        sw $v0, 0x2c($sp)
  /* 179168 80132708 AFAE0010 */        sw $t6, 0x10($sp)
  /* 17916C 8013270C AFA50024 */        sw $a1, 0x24($sp)
  /* 179170 80132710 00402025 */        or $a0, $v0, $zero
  /* 179174 80132714 2406001E */     addiu $a2, $zero, 0x1e
  /* 179178 80132718 0C00277D */       jal omAddGObjRenderProc
  /* 17917C 8013271C 3C078000 */       lui $a3, 0x8000
  /* 179180 80132720 3C0F8013 */       lui $t7, %hi(sGMContinueFiles)
  /* 179184 80132724 8DEF4528 */        lw $t7, %lo(sGMContinueFiles)($t7)
  /* 179188 80132728 3C180002 */       lui $t8, %hi(D_NF_000224F8)
  /* 17918C 8013272C 271824F8 */     addiu $t8, $t8, %lo(D_NF_000224F8)
  /* 179190 80132730 8FA4002C */        lw $a0, 0x2c($sp)
  /* 179194 80132734 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 179198 80132738 01F82821 */      addu $a1, $t7, $t8
  /* 17919C 8013273C 94590024 */       lhu $t9, 0x24($v0)
  /* 1791A0 80132740 3C0142A0 */       lui $at, (0x42A00000 >> 16) # 80.0
  /* 1791A4 80132744 44812000 */      mtc1 $at, $f4 # 80.0 to cop1
  /* 1791A8 80132748 3C01431C */       lui $at, (0x431C0000 >> 16) # 156.0
  /* 1791AC 8013274C 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1791B0 80132750 44813000 */      mtc1 $at, $f6 # 156.0 to cop1
  /* 1791B4 80132754 240300BE */     addiu $v1, $zero, 0xbe
  /* 1791B8 80132758 A4490024 */        sh $t1, 0x24($v0)
  /* 1791BC 8013275C 352A0001 */       ori $t2, $t1, 1
  /* 1791C0 80132760 240B00FF */     addiu $t3, $zero, 0xff
  /* 1791C4 80132764 A44A0024 */        sh $t2, 0x24($v0)
  /* 1791C8 80132768 A0430028 */        sb $v1, 0x28($v0)
  /* 1791CC 8013276C A0430029 */        sb $v1, 0x29($v0)
  /* 1791D0 80132770 A04B002A */        sb $t3, 0x2a($v0)
  /* 1791D4 80132774 00002025 */        or $a0, $zero, $zero
  /* 1791D8 80132778 00002825 */        or $a1, $zero, $zero
  /* 1791DC 8013277C 24060015 */     addiu $a2, $zero, 0x15
  /* 1791E0 80132780 3C078000 */       lui $a3, 0x8000
  /* 1791E4 80132784 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1791E8 80132788 0C00265A */       jal omMakeGObjSPAfter
  /* 1791EC 8013278C E446005C */      swc1 $f6, 0x5c($v0)
  /* 1791F0 80132790 3C018013 */       lui $at, %hi(sGMContinueSpotlightGObj)
  /* 1791F4 80132794 240CFFFF */     addiu $t4, $zero, -1
  /* 1791F8 80132798 AC22430C */        sw $v0, %lo(sGMContinueSpotlightGObj)($at)
  /* 1791FC 8013279C AFA2002C */        sw $v0, 0x2c($sp)
  /* 179200 801327A0 AFAC0010 */        sw $t4, 0x10($sp)
  /* 179204 801327A4 00402025 */        or $a0, $v0, $zero
  /* 179208 801327A8 8FA50024 */        lw $a1, 0x24($sp)
  /* 17920C 801327AC 2406001E */     addiu $a2, $zero, 0x1e
  /* 179210 801327B0 0C00277D */       jal omAddGObjRenderProc
  /* 179214 801327B4 3C078000 */       lui $a3, 0x8000
  /* 179218 801327B8 3C0D8013 */       lui $t5, %hi(sGMContinueFiles)
  /* 17921C 801327BC 8DAD4528 */        lw $t5, %lo(sGMContinueFiles)($t5)
  /* 179220 801327C0 3C0E0002 */       lui $t6, %hi(D_NF_00021900)
  /* 179224 801327C4 25CE1900 */     addiu $t6, $t6, %lo(D_NF_00021900)
  /* 179228 801327C8 8FA4002C */        lw $a0, 0x2c($sp)
  /* 17922C 801327CC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 179230 801327D0 01AE2821 */      addu $a1, $t5, $t6
  /* 179234 801327D4 944F0024 */       lhu $t7, 0x24($v0)
  /* 179238 801327D8 3C0142A0 */       lui $at, (0x42A00000 >> 16) # 80.0
  /* 17923C 801327DC 44814000 */      mtc1 $at, $f8 # 80.0 to cop1
  /* 179240 801327E0 3C0141E0 */       lui $at, (0x41E00000 >> 16) # 28.0
  /* 179244 801327E4 44815000 */      mtc1 $at, $f10 # 28.0 to cop1
  /* 179248 801327E8 31F9FFDF */      andi $t9, $t7, 0xffdf
  /* 17924C 801327EC 240300BE */     addiu $v1, $zero, 0xbe
  /* 179250 801327F0 A4590024 */        sh $t9, 0x24($v0)
  /* 179254 801327F4 37280001 */       ori $t0, $t9, 1
  /* 179258 801327F8 240900FF */     addiu $t1, $zero, 0xff
  /* 17925C 801327FC A4480024 */        sh $t0, 0x24($v0)
  /* 179260 80132800 A0430028 */        sb $v1, 0x28($v0)
  /* 179264 80132804 A0430029 */        sb $v1, 0x29($v0)
  /* 179268 80132808 A049002A */        sb $t1, 0x2a($v0)
  /* 17926C 8013280C E4480058 */      swc1 $f8, 0x58($v0)
  /* 179270 80132810 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 179274 80132814 8FBF001C */        lw $ra, 0x1c($sp)
  /* 179278 80132818 27BD0030 */     addiu $sp, $sp, 0x30
  /* 17927C 8013281C 03E00008 */        jr $ra
  /* 179280 80132820 00000000 */       nop 

glabel gmContinueMakeContinueSObj
  /* 179284 80132824 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 179288 80132828 AFBF001C */        sw $ra, 0x1c($sp)
  /* 17928C 8013282C 00002025 */        or $a0, $zero, $zero
  /* 179290 80132830 00002825 */        or $a1, $zero, $zero
  /* 179294 80132834 24060014 */     addiu $a2, $zero, 0x14
  /* 179298 80132838 0C00265A */       jal omMakeGObjSPAfter
  /* 17929C 8013283C 3C078000 */       lui $a3, 0x8000
  /* 1792A0 80132840 3C018013 */       lui $at, %hi(sGMContinueContinueGObj)
  /* 1792A4 80132844 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1792A8 80132848 240EFFFF */     addiu $t6, $zero, -1
  /* 1792AC 8013284C AC224304 */        sw $v0, %lo(sGMContinueContinueGObj)($at)
  /* 1792B0 80132850 AFA20024 */        sw $v0, 0x24($sp)
  /* 1792B4 80132854 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1792B8 80132858 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1792BC 8013285C 00402025 */        or $a0, $v0, $zero
  /* 1792C0 80132860 2406001C */     addiu $a2, $zero, 0x1c
  /* 1792C4 80132864 0C00277D */       jal omAddGObjRenderProc
  /* 1792C8 80132868 3C078000 */       lui $a3, 0x8000
  /* 1792CC 8013286C 3C0F8013 */       lui $t7, %hi(sGMContinueFiles)
  /* 1792D0 80132870 8DEF4528 */        lw $t7, %lo(sGMContinueFiles)($t7)
  /* 1792D4 80132874 3C180000 */       lui $t8, %hi(D_NF_000018F0)
  /* 1792D8 80132878 271818F0 */     addiu $t8, $t8, %lo(D_NF_000018F0)
  /* 1792DC 8013287C 8FA40024 */        lw $a0, 0x24($sp)
  /* 1792E0 80132880 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1792E4 80132884 01F82821 */      addu $a1, $t7, $t8
  /* 1792E8 80132888 94590024 */       lhu $t9, 0x24($v0)
  /* 1792EC 8013288C 3C014280 */       lui $at, (0x42800000 >> 16) # 64.0
  /* 1792F0 80132890 44810000 */      mtc1 $at, $f0 # 64.0 to cop1
  /* 1792F4 80132894 240300FF */     addiu $v1, $zero, 0xff
  /* 1792F8 80132898 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1792FC 8013289C A4490024 */        sh $t1, 0x24($v0)
  /* 179300 801328A0 352A0001 */       ori $t2, $t1, 1
  /* 179304 801328A4 A44A0024 */        sh $t2, 0x24($v0)
  /* 179308 801328A8 A0400060 */        sb $zero, 0x60($v0)
  /* 17930C 801328AC A0400061 */        sb $zero, 0x61($v0)
  /* 179310 801328B0 A0400062 */        sb $zero, 0x62($v0)
  /* 179314 801328B4 A0430028 */        sb $v1, 0x28($v0)
  /* 179318 801328B8 A0430029 */        sb $v1, 0x29($v0)
  /* 17931C 801328BC A043002A */        sb $v1, 0x2a($v0)
  /* 179320 801328C0 E4400058 */      swc1 $f0, 0x58($v0)
  /* 179324 801328C4 E440005C */      swc1 $f0, 0x5c($v0)
  /* 179328 801328C8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 17932C 801328CC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 179330 801328D0 03E00008 */        jr $ra
  /* 179334 801328D4 00000000 */       nop 

glabel gmContinueOptionSetHighlightColors
  /* 179338 801328D8 3C0E8013 */       lui $t6, %hi(D_ovl55_801341D0)
  /* 17933C 801328DC 25CE41D0 */     addiu $t6, $t6, %lo(D_ovl55_801341D0)
  /* 179340 801328E0 8DD80000 */        lw $t8, ($t6) # D_ovl55_801341D0 + 0
  /* 179344 801328E4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 179348 801328E8 27A6000C */     addiu $a2, $sp, 0xc
  /* 17934C 801328EC ACD80000 */        sw $t8, ($a2)
  /* 179350 801328F0 95D80004 */       lhu $t8, 4($t6) # D_ovl55_801341D0 + 4
  /* 179354 801328F4 3C198013 */       lui $t9, %hi(D_ovl55_801341D8)
  /* 179358 801328F8 273941D8 */     addiu $t9, $t9, %lo(D_ovl55_801341D8)
  /* 17935C 801328FC A4D80004 */        sh $t8, 4($a2)
  /* 179360 80132900 8F290000 */        lw $t1, ($t9) # D_ovl55_801341D8 + 0
  /* 179364 80132904 27A70004 */     addiu $a3, $sp, 4
  /* 179368 80132908 00E01825 */        or $v1, $a3, $zero
  /* 17936C 8013290C ACE90000 */        sw $t1, ($a3)
  /* 179370 80132910 97290004 */       lhu $t1, 4($t9) # D_ovl55_801341D8 + 4
  /* 179374 80132914 A4E90004 */        sh $t1, 4($a3)
  /* 179378 80132918 14A00003 */      bnez $a1, .L80132928
  /* 17937C 8013291C 8C820074 */        lw $v0, 0x74($a0)
  /* 179380 80132920 10000001 */         b .L80132928
  /* 179384 80132924 00C01825 */        or $v1, $a2, $zero
  .L80132928:
  /* 179388 80132928 906A0000 */       lbu $t2, ($v1)
  /* 17938C 8013292C 24010001 */     addiu $at, $zero, 1
  /* 179390 80132930 A04A0060 */        sb $t2, 0x60($v0)
  /* 179394 80132934 906B0001 */       lbu $t3, 1($v1)
  /* 179398 80132938 A04B0061 */        sb $t3, 0x61($v0)
  /* 17939C 8013293C 906C0002 */       lbu $t4, 2($v1)
  /* 1793A0 80132940 A04C0062 */        sb $t4, 0x62($v0)
  /* 1793A4 80132944 906D0003 */       lbu $t5, 3($v1)
  /* 1793A8 80132948 A04D0028 */        sb $t5, 0x28($v0)
  /* 1793AC 8013294C 906E0004 */       lbu $t6, 4($v1)
  /* 1793B0 80132950 A04E0029 */        sb $t6, 0x29($v0)
  /* 1793B4 80132954 906F0005 */       lbu $t7, 5($v1)
  /* 1793B8 80132958 A04F002A */        sb $t7, 0x2a($v0)
  /* 1793BC 8013295C 8C980074 */        lw $t8, 0x74($a0)
  /* 1793C0 80132960 14A10003 */       bne $a1, $at, .L80132970
  /* 1793C4 80132964 8F020008 */        lw $v0, 8($t8)
  /* 1793C8 80132968 10000002 */         b .L80132974
  /* 1793CC 8013296C 00C01825 */        or $v1, $a2, $zero
  .L80132970:
  /* 1793D0 80132970 00E01825 */        or $v1, $a3, $zero
  .L80132974:
  /* 1793D4 80132974 90790000 */       lbu $t9, ($v1)
  /* 1793D8 80132978 A0590060 */        sb $t9, 0x60($v0)
  /* 1793DC 8013297C 90680001 */       lbu $t0, 1($v1)
  /* 1793E0 80132980 A0480061 */        sb $t0, 0x61($v0)
  /* 1793E4 80132984 90690002 */       lbu $t1, 2($v1)
  /* 1793E8 80132988 A0490062 */        sb $t1, 0x62($v0)
  /* 1793EC 8013298C 906A0003 */       lbu $t2, 3($v1)
  /* 1793F0 80132990 A04A0028 */        sb $t2, 0x28($v0)
  /* 1793F4 80132994 906B0004 */       lbu $t3, 4($v1)
  /* 1793F8 80132998 A04B0029 */        sb $t3, 0x29($v0)
  /* 1793FC 8013299C 906C0005 */       lbu $t4, 5($v1)
  /* 179400 801329A0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 179404 801329A4 03E00008 */        jr $ra
  /* 179408 801329A8 A04C002A */        sb $t4, 0x2a($v0)

glabel gmContinueOptionProcUpdate
  /* 17940C 801329AC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 179410 801329B0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 179414 801329B4 3C058013 */       lui $a1, %hi(sGMContinueOptionSelect)
  /* 179418 801329B8 0C04CA36 */       jal gmContinueOptionSetHighlightColors
  /* 17941C 801329BC 8CA54338 */        lw $a1, %lo(sGMContinueOptionSelect)($a1)
  /* 179420 801329C0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 179424 801329C4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 179428 801329C8 03E00008 */        jr $ra
  /* 17942C 801329CC 00000000 */       nop 

glabel gmContinueMakeOptionSObjs
  /* 179430 801329D0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 179434 801329D4 AFBF0024 */        sw $ra, 0x24($sp)
  /* 179438 801329D8 AFB00020 */        sw $s0, 0x20($sp)
  /* 17943C 801329DC 00002025 */        or $a0, $zero, $zero
  /* 179440 801329E0 00002825 */        or $a1, $zero, $zero
  /* 179444 801329E4 24060014 */     addiu $a2, $zero, 0x14
  /* 179448 801329E8 0C00265A */       jal omMakeGObjSPAfter
  /* 17944C 801329EC 3C078000 */       lui $a3, 0x8000
  /* 179450 801329F0 3C018013 */       lui $at, %hi(sGMContinueOptionGObj)
  /* 179454 801329F4 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 179458 801329F8 240EFFFF */     addiu $t6, $zero, -1
  /* 17945C 801329FC AC224314 */        sw $v0, %lo(sGMContinueOptionGObj)($at)
  /* 179460 80132A00 00408025 */        or $s0, $v0, $zero
  /* 179464 80132A04 AFAE0010 */        sw $t6, 0x10($sp)
  /* 179468 80132A08 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 17946C 80132A0C 00402025 */        or $a0, $v0, $zero
  /* 179470 80132A10 2406001C */     addiu $a2, $zero, 0x1c
  /* 179474 80132A14 0C00277D */       jal omAddGObjRenderProc
  /* 179478 80132A18 3C078000 */       lui $a3, 0x8000
  /* 17947C 80132A1C 3C058013 */       lui $a1, %hi(gmContinueOptionProcUpdate)
  /* 179480 80132A20 24A529AC */     addiu $a1, $a1, %lo(gmContinueOptionProcUpdate)
  /* 179484 80132A24 02002025 */        or $a0, $s0, $zero
  /* 179488 80132A28 24060001 */     addiu $a2, $zero, 1
  /* 17948C 80132A2C 0C002062 */       jal omAddGObjCommonProc
  /* 179490 80132A30 24070001 */     addiu $a3, $zero, 1
  /* 179494 80132A34 3C0F8013 */       lui $t7, %hi(sGMContinueFiles)
  /* 179498 80132A38 8DEF4528 */        lw $t7, %lo(sGMContinueFiles)($t7)
  /* 17949C 80132A3C 3C180000 */       lui $t8, %hi(D_NF_00001E08)
  /* 1794A0 80132A40 27181E08 */     addiu $t8, $t8, %lo(D_NF_00001E08)
  /* 1794A4 80132A44 02002025 */        or $a0, $s0, $zero
  /* 1794A8 80132A48 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1794AC 80132A4C 01F82821 */      addu $a1, $t7, $t8
  /* 1794B0 80132A50 94590024 */       lhu $t9, 0x24($v0)
  /* 1794B4 80132A54 3C0142A8 */       lui $at, (0x42A80000 >> 16) # 84.0
  /* 1794B8 80132A58 44812000 */      mtc1 $at, $f4 # 84.0 to cop1
  /* 1794BC 80132A5C 3C014301 */       lui $at, (0x43010000 >> 16) # 129.0
  /* 1794C0 80132A60 44813000 */      mtc1 $at, $f6 # 129.0 to cop1
  /* 1794C4 80132A64 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1794C8 80132A68 A4490024 */        sh $t1, 0x24($v0)
  /* 1794CC 80132A6C 352A0001 */       ori $t2, $t1, 1
  /* 1794D0 80132A70 A44A0024 */        sh $t2, 0x24($v0)
  /* 1794D4 80132A74 3C0B8013 */       lui $t3, %hi(sGMContinueFiles)
  /* 1794D8 80132A78 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1794DC 80132A7C E446005C */      swc1 $f6, 0x5c($v0)
  /* 1794E0 80132A80 8D6B4528 */        lw $t3, %lo(sGMContinueFiles)($t3)
  /* 1794E4 80132A84 3C0C0000 */       lui $t4, %hi(D_NF_00002318)
  /* 1794E8 80132A88 258C2318 */     addiu $t4, $t4, %lo(D_NF_00002318)
  /* 1794EC 80132A8C 02002025 */        or $a0, $s0, $zero
  /* 1794F0 80132A90 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1794F4 80132A94 016C2821 */      addu $a1, $t3, $t4
  /* 1794F8 80132A98 944D0024 */       lhu $t5, 0x24($v0)
  /* 1794FC 80132A9C 3C01433D */       lui $at, (0x433D0000 >> 16) # 189.0
  /* 179500 80132AA0 44814000 */      mtc1 $at, $f8 # 189.0 to cop1
  /* 179504 80132AA4 3C014301 */       lui $at, (0x43010000 >> 16) # 129.0
  /* 179508 80132AA8 44815000 */      mtc1 $at, $f10 # 129.0 to cop1
  /* 17950C 80132AAC 31AFFFDF */      andi $t7, $t5, 0xffdf
  /* 179510 80132AB0 A44F0024 */        sh $t7, 0x24($v0)
  /* 179514 80132AB4 35F80001 */       ori $t8, $t7, 1
  /* 179518 80132AB8 A4580024 */        sh $t8, 0x24($v0)
  /* 17951C 80132ABC 3C058013 */       lui $a1, %hi(sGMContinueOptionSelect)
  /* 179520 80132AC0 E4480058 */      swc1 $f8, 0x58($v0)
  /* 179524 80132AC4 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 179528 80132AC8 8CA54338 */        lw $a1, %lo(sGMContinueOptionSelect)($a1)
  /* 17952C 80132ACC 0C04CA36 */       jal gmContinueOptionSetHighlightColors
  /* 179530 80132AD0 02002025 */        or $a0, $s0, $zero
  /* 179534 80132AD4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 179538 80132AD8 8FB00020 */        lw $s0, 0x20($sp)
  /* 17953C 80132ADC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 179540 80132AE0 03E00008 */        jr $ra
  /* 179544 80132AE4 00000000 */       nop 

glabel gmContinueCursorSetPosition
  /* 179548 80132AE8 14A00008 */      bnez $a1, .L80132B0C
  /* 17954C 80132AEC 8C820074 */        lw $v0, 0x74($a0)
  /* 179550 80132AF0 3C014298 */       lui $at, (0x42980000 >> 16) # 76.0
  /* 179554 80132AF4 44812000 */      mtc1 $at, $f4 # 76.0 to cop1
  /* 179558 80132AF8 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 17955C 80132AFC 44813000 */      mtc1 $at, $f6 # 120.0 to cop1
  /* 179560 80132B00 E4440058 */      swc1 $f4, 0x58($v0)
  /* 179564 80132B04 03E00008 */        jr $ra
  /* 179568 80132B08 E446005C */      swc1 $f6, 0x5c($v0)

  .L80132B0C:
  /* 17956C 80132B0C 3C014331 */       lui $at, (0x43310000 >> 16) # 177.0
  /* 179570 80132B10 44814000 */      mtc1 $at, $f8 # 177.0 to cop1
  /* 179574 80132B14 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 179578 80132B18 44815000 */      mtc1 $at, $f10 # 120.0 to cop1
  /* 17957C 80132B1C E4480058 */      swc1 $f8, 0x58($v0)
  /* 179580 80132B20 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 179584 80132B24 03E00008 */        jr $ra
  /* 179588 80132B28 00000000 */       nop 

glabel gmContinueCursorProcUpdate
  /* 17958C 80132B2C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 179590 80132B30 AFBF0014 */        sw $ra, 0x14($sp)
  /* 179594 80132B34 3C058013 */       lui $a1, %hi(sGMContinueOptionSelect)
  /* 179598 80132B38 0C04CABA */       jal gmContinueCursorSetPosition
  /* 17959C 80132B3C 8CA54338 */        lw $a1, %lo(sGMContinueOptionSelect)($a1)
  /* 1795A0 80132B40 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1795A4 80132B44 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1795A8 80132B48 03E00008 */        jr $ra
  /* 1795AC 80132B4C 00000000 */       nop 

glabel gmContinueMakeCursorSObj
  /* 1795B0 80132B50 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1795B4 80132B54 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1795B8 80132B58 00002025 */        or $a0, $zero, $zero
  /* 1795BC 80132B5C 00002825 */        or $a1, $zero, $zero
  /* 1795C0 80132B60 24060014 */     addiu $a2, $zero, 0x14
  /* 1795C4 80132B64 0C00265A */       jal omMakeGObjSPAfter
  /* 1795C8 80132B68 3C078000 */       lui $a3, 0x8000
  /* 1795CC 80132B6C 3C018013 */       lui $at, %hi(sGMContinueCursorGObj)
  /* 1795D0 80132B70 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1795D4 80132B74 240EFFFF */     addiu $t6, $zero, -1
  /* 1795D8 80132B78 AC224310 */        sw $v0, %lo(sGMContinueCursorGObj)($at)
  /* 1795DC 80132B7C AFA20024 */        sw $v0, 0x24($sp)
  /* 1795E0 80132B80 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1795E4 80132B84 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1795E8 80132B88 00402025 */        or $a0, $v0, $zero
  /* 1795EC 80132B8C 2406001C */     addiu $a2, $zero, 0x1c
  /* 1795F0 80132B90 0C00277D */       jal omAddGObjRenderProc
  /* 1795F4 80132B94 3C078000 */       lui $a3, 0x8000
  /* 1795F8 80132B98 3C058013 */       lui $a1, %hi(gmContinueCursorProcUpdate)
  /* 1795FC 80132B9C 24A52B2C */     addiu $a1, $a1, %lo(gmContinueCursorProcUpdate)
  /* 179600 80132BA0 8FA40024 */        lw $a0, 0x24($sp)
  /* 179604 80132BA4 24060001 */     addiu $a2, $zero, 1
  /* 179608 80132BA8 0C002062 */       jal omAddGObjCommonProc
  /* 17960C 80132BAC 24070001 */     addiu $a3, $zero, 1
  /* 179610 80132BB0 3C0F8013 */       lui $t7, %hi(sGMContinueFiles)
  /* 179614 80132BB4 8DEF4528 */        lw $t7, %lo(sGMContinueFiles)($t7)
  /* 179618 80132BB8 3C180000 */       lui $t8, %hi(D_NF_00002DF8)
  /* 17961C 80132BBC 27182DF8 */     addiu $t8, $t8, %lo(D_NF_00002DF8)
  /* 179620 80132BC0 8FA40024 */        lw $a0, 0x24($sp)
  /* 179624 80132BC4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 179628 80132BC8 01F82821 */      addu $a1, $t7, $t8
  /* 17962C 80132BCC 94590024 */       lhu $t9, 0x24($v0)
  /* 179630 80132BD0 240B00FF */     addiu $t3, $zero, 0xff
  /* 179634 80132BD4 A0400060 */        sb $zero, 0x60($v0)
  /* 179638 80132BD8 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 17963C 80132BDC A4490024 */        sh $t1, 0x24($v0)
  /* 179640 80132BE0 352A0001 */       ori $t2, $t1, 1
  /* 179644 80132BE4 A44A0024 */        sh $t2, 0x24($v0)
  /* 179648 80132BE8 A0400061 */        sb $zero, 0x61($v0)
  /* 17964C 80132BEC A0400062 */        sb $zero, 0x62($v0)
  /* 179650 80132BF0 A04B0028 */        sb $t3, 0x28($v0)
  /* 179654 80132BF4 A0400029 */        sb $zero, 0x29($v0)
  /* 179658 80132BF8 A040002A */        sb $zero, 0x2a($v0)
  /* 17965C 80132BFC 3C058013 */       lui $a1, %hi(sGMContinueOptionSelect)
  /* 179660 80132C00 8CA54338 */        lw $a1, %lo(sGMContinueOptionSelect)($a1)
  /* 179664 80132C04 0C04CABA */       jal gmContinueCursorSetPosition
  /* 179668 80132C08 8FA40024 */        lw $a0, 0x24($sp)
  /* 17966C 80132C0C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 179670 80132C10 27BD0028 */     addiu $sp, $sp, 0x28
  /* 179674 80132C14 03E00008 */        jr $ra
  /* 179678 80132C18 00000000 */       nop 

glabel gmContinueGameOverInitSprites
  /* 17967C 80132C1C 948E0024 */       lhu $t6, 0x24($a0)
  /* 179680 80132C20 240200FF */     addiu $v0, $zero, 0xff
  /* 179684 80132C24 2408001A */     addiu $t0, $zero, 0x1a
  /* 179688 80132C28 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 17968C 80132C2C A4980024 */        sh $t8, 0x24($a0)
  /* 179690 80132C30 37190001 */       ori $t9, $t8, 1
  /* 179694 80132C34 240900E6 */     addiu $t1, $zero, 0xe6
  /* 179698 80132C38 A4990024 */        sh $t9, 0x24($a0)
  /* 17969C 80132C3C A0880060 */        sb $t0, 0x60($a0)
  /* 1796A0 80132C40 A0800061 */        sb $zero, 0x61($a0)
  /* 1796A4 80132C44 A0890062 */        sb $t1, 0x62($a0)
  /* 1796A8 80132C48 A0820028 */        sb $v0, 0x28($a0)
  /* 1796AC 80132C4C A0820029 */        sb $v0, 0x29($a0)
  /* 1796B0 80132C50 03E00008 */        jr $ra
  /* 1796B4 80132C54 A082002A */        sb $v0, 0x2a($a0)

glabel gmContinueGameOverStepColors
  /* 1796B8 80132C58 3C0F8013 */       lui $t7, %hi(D_ovl55_801341E0)
  /* 1796BC 80132C5C 25EF41E0 */     addiu $t7, $t7, %lo(D_ovl55_801341E0)
  /* 1796C0 80132C60 8DF90000 */        lw $t9, ($t7) # D_ovl55_801341E0 + 0
  /* 1796C4 80132C64 8DF80004 */        lw $t8, 4($t7) # D_ovl55_801341E0 + 4
  /* 1796C8 80132C68 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1796CC 80132C6C 8C820074 */        lw $v0, 0x74($a0)
  /* 1796D0 80132C70 27AE0004 */     addiu $t6, $sp, 4
  /* 1796D4 80132C74 ADD90000 */        sw $t9, ($t6)
  /* 1796D8 80132C78 ADD80004 */        sw $t8, 4($t6)
  /* 1796DC 80132C7C 8DF8000C */        lw $t8, 0xc($t7) # D_ovl55_801341E0 + 12
  /* 1796E0 80132C80 8DF90008 */        lw $t9, 8($t7) # D_ovl55_801341E0 + 8
  /* 1796E4 80132C84 3C038013 */       lui $v1, %hi(sGMContinueGameOverColorStep)
  /* 1796E8 80132C88 ADD8000C */        sw $t8, 0xc($t6)
  /* 1796EC 80132C8C ADD90008 */        sw $t9, 8($t6)
  /* 1796F0 80132C90 8DF90010 */        lw $t9, 0x10($t7) # D_ovl55_801341E0 + 16
  /* 1796F4 80132C94 8DF80014 */        lw $t8, 0x14($t7) # D_ovl55_801341E0 + 20
  /* 1796F8 80132C98 24634344 */     addiu $v1, $v1, %lo(sGMContinueGameOverColorStep)
  /* 1796FC 80132C9C 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 179700 80132CA0 ADD90010 */        sw $t9, 0x10($t6)
  /* 179704 80132CA4 ADD80014 */        sw $t8, 0x14($t6)
  /* 179708 80132CA8 44811000 */      mtc1 $at, $f2 # 1.0 to cop1
  /* 17970C 80132CAC C4600000 */      lwc1 $f0, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179710 80132CB0 3C018013 */       lui $at, %hi(D_ovl55_801342E4)
  /* 179714 80132CB4 4602003C */    c.lt.s $f0, $f2
  /* 179718 80132CB8 00000000 */       nop 
  /* 17971C 80132CBC 450000ED */      bc1f .L80133074
  /* 179720 80132CC0 00000000 */       nop 
  /* 179724 80132CC4 C42442E4 */      lwc1 $f4, %lo(D_ovl55_801342E4)($at)
  /* 179728 80132CC8 46040180 */     add.s $f6, $f0, $f4
  /* 17972C 80132CCC E4660000 */      swc1 $f6, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179730 80132CD0 C4680000 */      lwc1 $f8, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179734 80132CD4 4608103C */    c.lt.s $f2, $f8
  /* 179738 80132CD8 00000000 */       nop 
  /* 17973C 80132CDC 45000002 */      bc1f .L80132CE8
  /* 179740 80132CE0 00000000 */       nop 
  /* 179744 80132CE4 E4620000 */      swc1 $f2, ($v1) # sGMContinueGameOverColorStep + 0
  .L80132CE8:
  /* 179748 80132CE8 104000E2 */      beqz $v0, .L80133074
  /* 17974C 80132CEC 00000000 */       nop 
  /* 179750 80132CF0 C7AA0004 */      lwc1 $f10, 4($sp)
  .L80132CF4:
  /* 179754 80132CF4 C4700000 */      lwc1 $f16, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179758 80132CF8 24090001 */     addiu $t1, $zero, 1
  /* 17975C 80132CFC 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 179760 80132D00 46105482 */     mul.s $f18, $f10, $f16
  /* 179764 80132D04 4448F800 */      cfc1 $t0, $31
  /* 179768 80132D08 44C9F800 */      ctc1 $t1, $31
  /* 17976C 80132D0C 00000000 */       nop 
  /* 179770 80132D10 46009124 */   cvt.w.s $f4, $f18
  /* 179774 80132D14 4449F800 */      cfc1 $t1, $31
  /* 179778 80132D18 00000000 */       nop 
  /* 17977C 80132D1C 31290078 */      andi $t1, $t1, 0x78
  /* 179780 80132D20 51200013 */      beql $t1, $zero, .L80132D70
  /* 179784 80132D24 44092000 */      mfc1 $t1, $f4
  /* 179788 80132D28 44812000 */      mtc1 $at, $f4 # 2147483600.0 to cop1
  /* 17978C 80132D2C 24090001 */     addiu $t1, $zero, 1
  /* 179790 80132D30 46049101 */     sub.s $f4, $f18, $f4
  /* 179794 80132D34 44C9F800 */      ctc1 $t1, $31
  /* 179798 80132D38 00000000 */       nop 
  /* 17979C 80132D3C 46002124 */   cvt.w.s $f4, $f4
  /* 1797A0 80132D40 4449F800 */      cfc1 $t1, $31
  /* 1797A4 80132D44 00000000 */       nop 
  /* 1797A8 80132D48 31290078 */      andi $t1, $t1, 0x78
  /* 1797AC 80132D4C 15200005 */      bnez $t1, .L80132D64
  /* 1797B0 80132D50 00000000 */       nop 
  /* 1797B4 80132D54 44092000 */      mfc1 $t1, $f4
  /* 1797B8 80132D58 3C018000 */       lui $at, 0x8000
  /* 1797BC 80132D5C 10000007 */         b .L80132D7C
  /* 1797C0 80132D60 01214825 */        or $t1, $t1, $at
  .L80132D64:
  /* 1797C4 80132D64 10000005 */         b .L80132D7C
  /* 1797C8 80132D68 2409FFFF */     addiu $t1, $zero, -1
  /* 1797CC 80132D6C 44092000 */      mfc1 $t1, $f4
  .L80132D70:
  /* 1797D0 80132D70 00000000 */       nop 
  /* 1797D4 80132D74 0520FFFB */      bltz $t1, .L80132D64
  /* 1797D8 80132D78 00000000 */       nop 
  .L80132D7C:
  /* 1797DC 80132D7C A0490060 */        sb $t1, 0x60($v0)
  /* 1797E0 80132D80 44C8F800 */      ctc1 $t0, $31
  /* 1797E4 80132D84 C4680000 */      lwc1 $f8, ($v1) # sGMContinueGameOverColorStep + 0
  /* 1797E8 80132D88 C7A60008 */      lwc1 $f6, 8($sp)
  /* 1797EC 80132D8C 240B0001 */     addiu $t3, $zero, 1
  /* 1797F0 80132D90 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 1797F4 80132D94 46083282 */     mul.s $f10, $f6, $f8
  /* 1797F8 80132D98 444AF800 */      cfc1 $t2, $31
  /* 1797FC 80132D9C 44CBF800 */      ctc1 $t3, $31
  /* 179800 80132DA0 00000000 */       nop 
  /* 179804 80132DA4 46005424 */   cvt.w.s $f16, $f10
  /* 179808 80132DA8 444BF800 */      cfc1 $t3, $31
  /* 17980C 80132DAC 00000000 */       nop 
  /* 179810 80132DB0 316B0078 */      andi $t3, $t3, 0x78
  /* 179814 80132DB4 51600013 */      beql $t3, $zero, .L80132E04
  /* 179818 80132DB8 440B8000 */      mfc1 $t3, $f16
  /* 17981C 80132DBC 44818000 */      mtc1 $at, $f16 # 2147483600.0 to cop1
  /* 179820 80132DC0 240B0001 */     addiu $t3, $zero, 1
  /* 179824 80132DC4 46105401 */     sub.s $f16, $f10, $f16
  /* 179828 80132DC8 44CBF800 */      ctc1 $t3, $31
  /* 17982C 80132DCC 00000000 */       nop 
  /* 179830 80132DD0 46008424 */   cvt.w.s $f16, $f16
  /* 179834 80132DD4 444BF800 */      cfc1 $t3, $31
  /* 179838 80132DD8 00000000 */       nop 
  /* 17983C 80132DDC 316B0078 */      andi $t3, $t3, 0x78
  /* 179840 80132DE0 15600005 */      bnez $t3, .L80132DF8
  /* 179844 80132DE4 00000000 */       nop 
  /* 179848 80132DE8 440B8000 */      mfc1 $t3, $f16
  /* 17984C 80132DEC 3C018000 */       lui $at, 0x8000
  /* 179850 80132DF0 10000007 */         b .L80132E10
  /* 179854 80132DF4 01615825 */        or $t3, $t3, $at
  .L80132DF8:
  /* 179858 80132DF8 10000005 */         b .L80132E10
  /* 17985C 80132DFC 240BFFFF */     addiu $t3, $zero, -1
  /* 179860 80132E00 440B8000 */      mfc1 $t3, $f16
  .L80132E04:
  /* 179864 80132E04 00000000 */       nop 
  /* 179868 80132E08 0560FFFB */      bltz $t3, .L80132DF8
  /* 17986C 80132E0C 00000000 */       nop 
  .L80132E10:
  /* 179870 80132E10 A04B0061 */        sb $t3, 0x61($v0)
  /* 179874 80132E14 44CAF800 */      ctc1 $t2, $31
  /* 179878 80132E18 C4640000 */      lwc1 $f4, ($v1) # sGMContinueGameOverColorStep + 0
  /* 17987C 80132E1C C7B2000C */      lwc1 $f18, 0xc($sp)
  /* 179880 80132E20 240D0001 */     addiu $t5, $zero, 1
  /* 179884 80132E24 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 179888 80132E28 46049182 */     mul.s $f6, $f18, $f4
  /* 17988C 80132E2C 444CF800 */      cfc1 $t4, $31
  /* 179890 80132E30 44CDF800 */      ctc1 $t5, $31
  /* 179894 80132E34 00000000 */       nop 
  /* 179898 80132E38 46003224 */   cvt.w.s $f8, $f6
  /* 17989C 80132E3C 444DF800 */      cfc1 $t5, $31
  /* 1798A0 80132E40 00000000 */       nop 
  /* 1798A4 80132E44 31AD0078 */      andi $t5, $t5, 0x78
  /* 1798A8 80132E48 51A00013 */      beql $t5, $zero, .L80132E98
  /* 1798AC 80132E4C 440D4000 */      mfc1 $t5, $f8
  /* 1798B0 80132E50 44814000 */      mtc1 $at, $f8 # 2147483600.0 to cop1
  /* 1798B4 80132E54 240D0001 */     addiu $t5, $zero, 1
  /* 1798B8 80132E58 46083201 */     sub.s $f8, $f6, $f8
  /* 1798BC 80132E5C 44CDF800 */      ctc1 $t5, $31
  /* 1798C0 80132E60 00000000 */       nop 
  /* 1798C4 80132E64 46004224 */   cvt.w.s $f8, $f8
  /* 1798C8 80132E68 444DF800 */      cfc1 $t5, $31
  /* 1798CC 80132E6C 00000000 */       nop 
  /* 1798D0 80132E70 31AD0078 */      andi $t5, $t5, 0x78
  /* 1798D4 80132E74 15A00005 */      bnez $t5, .L80132E8C
  /* 1798D8 80132E78 00000000 */       nop 
  /* 1798DC 80132E7C 440D4000 */      mfc1 $t5, $f8
  /* 1798E0 80132E80 3C018000 */       lui $at, 0x8000
  /* 1798E4 80132E84 10000007 */         b .L80132EA4
  /* 1798E8 80132E88 01A16825 */        or $t5, $t5, $at
  .L80132E8C:
  /* 1798EC 80132E8C 10000005 */         b .L80132EA4
  /* 1798F0 80132E90 240DFFFF */     addiu $t5, $zero, -1
  /* 1798F4 80132E94 440D4000 */      mfc1 $t5, $f8
  .L80132E98:
  /* 1798F8 80132E98 00000000 */       nop 
  /* 1798FC 80132E9C 05A0FFFB */      bltz $t5, .L80132E8C
  /* 179900 80132EA0 00000000 */       nop 
  .L80132EA4:
  /* 179904 80132EA4 A04D0062 */        sb $t5, 0x62($v0)
  /* 179908 80132EA8 44CCF800 */      ctc1 $t4, $31
  /* 17990C 80132EAC C4700000 */      lwc1 $f16, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179910 80132EB0 C7AA0010 */      lwc1 $f10, 0x10($sp)
  /* 179914 80132EB4 240F0001 */     addiu $t7, $zero, 1
  /* 179918 80132EB8 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 17991C 80132EBC 46105482 */     mul.s $f18, $f10, $f16
  /* 179920 80132EC0 444EF800 */      cfc1 $t6, $31
  /* 179924 80132EC4 44CFF800 */      ctc1 $t7, $31
  /* 179928 80132EC8 00000000 */       nop 
  /* 17992C 80132ECC 46009124 */   cvt.w.s $f4, $f18
  /* 179930 80132ED0 444FF800 */      cfc1 $t7, $31
  /* 179934 80132ED4 00000000 */       nop 
  /* 179938 80132ED8 31EF0078 */      andi $t7, $t7, 0x78
  /* 17993C 80132EDC 51E00013 */      beql $t7, $zero, .L80132F2C
  /* 179940 80132EE0 440F2000 */      mfc1 $t7, $f4
  /* 179944 80132EE4 44812000 */      mtc1 $at, $f4 # 2147483600.0 to cop1
  /* 179948 80132EE8 240F0001 */     addiu $t7, $zero, 1
  /* 17994C 80132EEC 46049101 */     sub.s $f4, $f18, $f4
  /* 179950 80132EF0 44CFF800 */      ctc1 $t7, $31
  /* 179954 80132EF4 00000000 */       nop 
  /* 179958 80132EF8 46002124 */   cvt.w.s $f4, $f4
  /* 17995C 80132EFC 444FF800 */      cfc1 $t7, $31
  /* 179960 80132F00 00000000 */       nop 
  /* 179964 80132F04 31EF0078 */      andi $t7, $t7, 0x78
  /* 179968 80132F08 15E00005 */      bnez $t7, .L80132F20
  /* 17996C 80132F0C 00000000 */       nop 
  /* 179970 80132F10 440F2000 */      mfc1 $t7, $f4
  /* 179974 80132F14 3C018000 */       lui $at, 0x8000
  /* 179978 80132F18 10000007 */         b .L80132F38
  /* 17997C 80132F1C 01E17825 */        or $t7, $t7, $at
  .L80132F20:
  /* 179980 80132F20 10000005 */         b .L80132F38
  /* 179984 80132F24 240FFFFF */     addiu $t7, $zero, -1
  /* 179988 80132F28 440F2000 */      mfc1 $t7, $f4
  .L80132F2C:
  /* 17998C 80132F2C 00000000 */       nop 
  /* 179990 80132F30 05E0FFFB */      bltz $t7, .L80132F20
  /* 179994 80132F34 00000000 */       nop 
  .L80132F38:
  /* 179998 80132F38 A04F0028 */        sb $t7, 0x28($v0)
  /* 17999C 80132F3C 44CEF800 */      ctc1 $t6, $31
  /* 1799A0 80132F40 C4680000 */      lwc1 $f8, ($v1) # sGMContinueGameOverColorStep + 0
  /* 1799A4 80132F44 C7A60014 */      lwc1 $f6, 0x14($sp)
  /* 1799A8 80132F48 24190001 */     addiu $t9, $zero, 1
  /* 1799AC 80132F4C 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 1799B0 80132F50 46083282 */     mul.s $f10, $f6, $f8
  /* 1799B4 80132F54 4458F800 */      cfc1 $t8, $31
  /* 1799B8 80132F58 44D9F800 */      ctc1 $t9, $31
  /* 1799BC 80132F5C 00000000 */       nop 
  /* 1799C0 80132F60 46005424 */   cvt.w.s $f16, $f10
  /* 1799C4 80132F64 4459F800 */      cfc1 $t9, $31
  /* 1799C8 80132F68 00000000 */       nop 
  /* 1799CC 80132F6C 33390078 */      andi $t9, $t9, 0x78
  /* 1799D0 80132F70 53200013 */      beql $t9, $zero, .L80132FC0
  /* 1799D4 80132F74 44198000 */      mfc1 $t9, $f16
  /* 1799D8 80132F78 44818000 */      mtc1 $at, $f16 # 2147483600.0 to cop1
  /* 1799DC 80132F7C 24190001 */     addiu $t9, $zero, 1
  /* 1799E0 80132F80 46105401 */     sub.s $f16, $f10, $f16
  /* 1799E4 80132F84 44D9F800 */      ctc1 $t9, $31
  /* 1799E8 80132F88 00000000 */       nop 
  /* 1799EC 80132F8C 46008424 */   cvt.w.s $f16, $f16
  /* 1799F0 80132F90 4459F800 */      cfc1 $t9, $31
  /* 1799F4 80132F94 00000000 */       nop 
  /* 1799F8 80132F98 33390078 */      andi $t9, $t9, 0x78
  /* 1799FC 80132F9C 17200005 */      bnez $t9, .L80132FB4
  /* 179A00 80132FA0 00000000 */       nop 
  /* 179A04 80132FA4 44198000 */      mfc1 $t9, $f16
  /* 179A08 80132FA8 3C018000 */       lui $at, 0x8000
  /* 179A0C 80132FAC 10000007 */         b .L80132FCC
  /* 179A10 80132FB0 0321C825 */        or $t9, $t9, $at
  .L80132FB4:
  /* 179A14 80132FB4 10000005 */         b .L80132FCC
  /* 179A18 80132FB8 2419FFFF */     addiu $t9, $zero, -1
  /* 179A1C 80132FBC 44198000 */      mfc1 $t9, $f16
  .L80132FC0:
  /* 179A20 80132FC0 00000000 */       nop 
  /* 179A24 80132FC4 0720FFFB */      bltz $t9, .L80132FB4
  /* 179A28 80132FC8 00000000 */       nop 
  .L80132FCC:
  /* 179A2C 80132FCC A0590029 */        sb $t9, 0x29($v0)
  /* 179A30 80132FD0 44D8F800 */      ctc1 $t8, $31
  /* 179A34 80132FD4 C4640000 */      lwc1 $f4, ($v1) # sGMContinueGameOverColorStep + 0
  /* 179A38 80132FD8 C7B20018 */      lwc1 $f18, 0x18($sp)
  /* 179A3C 80132FDC 24090001 */     addiu $t1, $zero, 1
  /* 179A40 80132FE0 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 179A44 80132FE4 46049182 */     mul.s $f6, $f18, $f4
  /* 179A48 80132FE8 4448F800 */      cfc1 $t0, $31
  /* 179A4C 80132FEC 44C9F800 */      ctc1 $t1, $31
  /* 179A50 80132FF0 00000000 */       nop 
  /* 179A54 80132FF4 46003224 */   cvt.w.s $f8, $f6
  /* 179A58 80132FF8 4449F800 */      cfc1 $t1, $31
  /* 179A5C 80132FFC 00000000 */       nop 
  /* 179A60 80133000 31290078 */      andi $t1, $t1, 0x78
  /* 179A64 80133004 51200013 */      beql $t1, $zero, .L80133054
  /* 179A68 80133008 44094000 */      mfc1 $t1, $f8
  /* 179A6C 8013300C 44814000 */      mtc1 $at, $f8 # 2147483600.0 to cop1
  /* 179A70 80133010 24090001 */     addiu $t1, $zero, 1
  /* 179A74 80133014 46083201 */     sub.s $f8, $f6, $f8
  /* 179A78 80133018 44C9F800 */      ctc1 $t1, $31
  /* 179A7C 8013301C 00000000 */       nop 
  /* 179A80 80133020 46004224 */   cvt.w.s $f8, $f8
  /* 179A84 80133024 4449F800 */      cfc1 $t1, $31
  /* 179A88 80133028 00000000 */       nop 
  /* 179A8C 8013302C 31290078 */      andi $t1, $t1, 0x78
  /* 179A90 80133030 15200005 */      bnez $t1, .L80133048
  /* 179A94 80133034 00000000 */       nop 
  /* 179A98 80133038 44094000 */      mfc1 $t1, $f8
  /* 179A9C 8013303C 3C018000 */       lui $at, 0x8000
  /* 179AA0 80133040 10000007 */         b .L80133060
  /* 179AA4 80133044 01214825 */        or $t1, $t1, $at
  .L80133048:
  /* 179AA8 80133048 10000005 */         b .L80133060
  /* 179AAC 8013304C 2409FFFF */     addiu $t1, $zero, -1
  /* 179AB0 80133050 44094000 */      mfc1 $t1, $f8
  .L80133054:
  /* 179AB4 80133054 00000000 */       nop 
  /* 179AB8 80133058 0520FFFB */      bltz $t1, .L80133048
  /* 179ABC 8013305C 00000000 */       nop 
  .L80133060:
  /* 179AC0 80133060 A049002A */        sb $t1, 0x2a($v0)
  /* 179AC4 80133064 8C420008 */        lw $v0, 8($v0)
  /* 179AC8 80133068 44C8F800 */      ctc1 $t0, $31
  /* 179ACC 8013306C 5440FF21 */      bnel $v0, $zero, .L80132CF4
  /* 179AD0 80133070 C7AA0004 */      lwc1 $f10, 4($sp)
  .L80133074:
  /* 179AD4 80133074 03E00008 */        jr $ra
  /* 179AD8 80133078 27BD0020 */     addiu $sp, $sp, 0x20

glabel gmContinueMakeGameOverSObjs
  /* 179ADC 8013307C 27BDFF68 */     addiu $sp, $sp, -0x98
  /* 179AE0 80133080 3C0F8013 */       lui $t7, %hi(D_ovl55_801341F8)
  /* 179AE4 80133084 AFBF003C */        sw $ra, 0x3c($sp)
  /* 179AE8 80133088 AFB40038 */        sw $s4, 0x38($sp)
  /* 179AEC 8013308C AFB30034 */        sw $s3, 0x34($sp)
  /* 179AF0 80133090 AFB20030 */        sw $s2, 0x30($sp)
  /* 179AF4 80133094 AFB1002C */        sw $s1, 0x2c($sp)
  /* 179AF8 80133098 AFB00028 */        sw $s0, 0x28($sp)
  /* 179AFC 8013309C F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 179B00 801330A0 25EF41F8 */     addiu $t7, $t7, %lo(D_ovl55_801341F8)
  /* 179B04 801330A4 8DF90000 */        lw $t9, ($t7) # D_ovl55_801341F8 + 0
  /* 179B08 801330A8 8DF80004 */        lw $t8, 4($t7) # D_ovl55_801341F8 + 4
  /* 179B0C 801330AC 27AE0070 */     addiu $t6, $sp, 0x70
  /* 179B10 801330B0 ADD90000 */        sw $t9, ($t6)
  /* 179B14 801330B4 ADD80004 */        sw $t8, 4($t6)
  /* 179B18 801330B8 8DF8000C */        lw $t8, 0xc($t7) # D_ovl55_801341F8 + 12
  /* 179B1C 801330BC 8DF90008 */        lw $t9, 8($t7) # D_ovl55_801341F8 + 8
  /* 179B20 801330C0 3C098013 */       lui $t1, %hi(D_ovl55_80134218)
  /* 179B24 801330C4 ADD8000C */        sw $t8, 0xc($t6)
  /* 179B28 801330C8 ADD90008 */        sw $t9, 8($t6)
  /* 179B2C 801330CC 8DF90010 */        lw $t9, 0x10($t7) # D_ovl55_801341F8 + 16
  /* 179B30 801330D0 8DF80014 */        lw $t8, 0x14($t7) # D_ovl55_801341F8 + 20
  /* 179B34 801330D4 25294218 */     addiu $t1, $t1, %lo(D_ovl55_80134218)
  /* 179B38 801330D8 ADD90010 */        sw $t9, 0x10($t6)
  /* 179B3C 801330DC ADD80014 */        sw $t8, 0x14($t6)
  /* 179B40 801330E0 8DF8001C */        lw $t8, 0x1c($t7) # D_ovl55_801341F8 + 28
  /* 179B44 801330E4 8DF90018 */        lw $t9, 0x18($t7) # D_ovl55_801341F8 + 24
  /* 179B48 801330E8 27A80050 */     addiu $t0, $sp, 0x50
  /* 179B4C 801330EC ADD8001C */        sw $t8, 0x1c($t6)
  /* 179B50 801330F0 ADD90018 */        sw $t9, 0x18($t6)
  /* 179B54 801330F4 8D2A0004 */        lw $t2, 4($t1) # D_ovl55_80134218 + 4
  /* 179B58 801330F8 8D2B0000 */        lw $t3, ($t1) # D_ovl55_80134218 + 0
  /* 179B5C 801330FC 44802000 */      mtc1 $zero, $f4
  /* 179B60 80133100 AD0A0004 */        sw $t2, 4($t0)
  /* 179B64 80133104 AD0B0000 */        sw $t3, ($t0)
  /* 179B68 80133108 8D2B0008 */        lw $t3, 8($t1) # D_ovl55_80134218 + 8
  /* 179B6C 8013310C 8D2A000C */        lw $t2, 0xc($t1) # D_ovl55_80134218 + 12
  /* 179B70 80133110 3C108000 */       lui $s0, %hi(D_NF_80000004)
  /* 179B74 80133114 AD0B0008 */        sw $t3, 8($t0)
  /* 179B78 80133118 AD0A000C */        sw $t2, 0xc($t0)
  /* 179B7C 8013311C 8D2A0014 */        lw $t2, 0x14($t1) # D_ovl55_80134218 + 20
  /* 179B80 80133120 8D2B0010 */        lw $t3, 0x10($t1) # D_ovl55_80134218 + 16
  /* 179B84 80133124 3C018013 */       lui $at, %hi(sGMContinueGameOverColorStep)
  /* 179B88 80133128 AD0A0014 */        sw $t2, 0x14($t0)
  /* 179B8C 8013312C AD0B0010 */        sw $t3, 0x10($t0)
  /* 179B90 80133130 8D2B0018 */        lw $t3, 0x18($t1) # D_ovl55_80134218 + 24
  /* 179B94 80133134 8D2A001C */        lw $t2, 0x1c($t1) # D_ovl55_80134218 + 28
  /* 179B98 80133138 02003825 */        or $a3, $s0, $zero
  /* 179B9C 8013313C AD0B0018 */        sw $t3, 0x18($t0)
  /* 179BA0 80133140 AD0A001C */        sw $t2, 0x1c($t0)
  /* 179BA4 80133144 00002025 */        or $a0, $zero, $zero
  /* 179BA8 80133148 00002825 */        or $a1, $zero, $zero
  /* 179BAC 8013314C 24060014 */     addiu $a2, $zero, 0x14
  /* 179BB0 80133150 0C00265A */       jal omMakeGObjSPAfter
  /* 179BB4 80133154 E4244344 */      swc1 $f4, %lo(sGMContinueGameOverColorStep)($at)
  /* 179BB8 80133158 3C018013 */       lui $at, %hi(sGMContinueGameOverGObj)
  /* 179BBC 8013315C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 179BC0 80133160 240CFFFF */     addiu $t4, $zero, -1
  /* 179BC4 80133164 AC224334 */        sw $v0, %lo(sGMContinueGameOverGObj)($at)
  /* 179BC8 80133168 0040A025 */        or $s4, $v0, $zero
  /* 179BCC 8013316C AFAC0010 */        sw $t4, 0x10($sp)
  /* 179BD0 80133170 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 179BD4 80133174 00402025 */        or $a0, $v0, $zero
  /* 179BD8 80133178 2406001C */     addiu $a2, $zero, 0x1c
  /* 179BDC 8013317C 0C00277D */       jal omAddGObjRenderProc
  /* 179BE0 80133180 02003825 */        or $a3, $s0, $zero
  /* 179BE4 80133184 3C058013 */       lui $a1, %hi(gmContinueGameOverStepColors)
  /* 179BE8 80133188 24A52C58 */     addiu $a1, $a1, %lo(gmContinueGameOverStepColors)
  /* 179BEC 8013318C 02802025 */        or $a0, $s4, $zero
  /* 179BF0 80133190 24060001 */     addiu $a2, $zero, 1
  /* 179BF4 80133194 0C002062 */       jal omAddGObjCommonProc
  /* 179BF8 80133198 24070001 */     addiu $a3, $zero, 1
  /* 179BFC 8013319C 3C014248 */       lui $at, (0x42480000 >> 16) # 50.0
  /* 179C00 801331A0 3C128013 */       lui $s2, %hi(sGMContinueFiles)
  /* 179C04 801331A4 4481A000 */      mtc1 $at, $f20 # 50.0 to cop1
  /* 179C08 801331A8 26524528 */     addiu $s2, $s2, %lo(sGMContinueFiles)
  /* 179C0C 801331AC 27B10070 */     addiu $s1, $sp, 0x70
  /* 179C10 801331B0 27B00050 */     addiu $s0, $sp, 0x50
  /* 179C14 801331B4 27B30070 */     addiu $s3, $sp, 0x70
  .L801331B8:
  /* 179C18 801331B8 8E2D0000 */        lw $t5, ($s1)
  /* 179C1C 801331BC 8E4E0008 */        lw $t6, 8($s2) # sGMContinueFiles + 8
  /* 179C20 801331C0 02802025 */        or $a0, $s4, $zero
  /* 179C24 801331C4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 179C28 801331C8 01AE2821 */      addu $a1, $t5, $t6
  /* 179C2C 801331CC C6060000 */      lwc1 $f6, %lo(D_NF_80000000)($s0)
  /* 179C30 801331D0 E454005C */      swc1 $f20, 0x5c($v0)
  /* 179C34 801331D4 00402025 */        or $a0, $v0, $zero
  /* 179C38 801331D8 0C04CB07 */       jal gmContinueGameOverInitSprites
  /* 179C3C 801331DC E4460058 */      swc1 $f6, 0x58($v0)
  /* 179C40 801331E0 26100004 */     addiu $s0, $s0, %lo(D_NF_80000004)
  /* 179C44 801331E4 1613FFF4 */       bne $s0, $s3, .L801331B8
  /* 179C48 801331E8 26310004 */     addiu $s1, $s1, 4
  /* 179C4C 801331EC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 179C50 801331F0 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 179C54 801331F4 8FB00028 */        lw $s0, 0x28($sp)
  /* 179C58 801331F8 8FB1002C */        lw $s1, 0x2c($sp)
  /* 179C5C 801331FC 8FB20030 */        lw $s2, 0x30($sp)
  /* 179C60 80133200 8FB30034 */        lw $s3, 0x34($sp)
  /* 179C64 80133204 8FB40038 */        lw $s4, 0x38($sp)
  /* 179C68 80133208 03E00008 */        jr $ra
  /* 179C6C 8013320C 27BD0098 */     addiu $sp, $sp, 0x98

glabel gmContinueGameOverProcUpdate
  /* 179C70 80133210 AFA40000 */        sw $a0, ($sp)
  /* 179C74 80133214 3C048013 */       lui $a0, %hi(sGMContinueGameOverFadeOutScale)
  /* 179C78 80133218 24844340 */     addiu $a0, $a0, %lo(sGMContinueGameOverFadeOutScale)
  /* 179C7C 8013321C 3C018013 */       lui $at, %hi(D_ovl55_801342E8)
  /* 179C80 80133220 C42242E8 */      lwc1 $f2, %lo(D_ovl55_801342E8)($at)
  /* 179C84 80133224 C4800000 */      lwc1 $f0, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179C88 80133228 3C0E8013 */       lui $t6, %hi(sGMContinueRoomGObj)
  /* 179C8C 8013322C 8DCE4318 */        lw $t6, %lo(sGMContinueRoomGObj)($t6)
  /* 179C90 80133230 4600103C */    c.lt.s $f2, $f0
  /* 179C94 80133234 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 179C98 80133238 8DC20074 */        lw $v0, 0x74($t6)
  /* 179C9C 8013323C 45000048 */      bc1f .L80133360
  /* 179CA0 80133240 00000000 */       nop 
  /* 179CA4 80133244 46020101 */     sub.s $f4, $f0, $f2
  /* 179CA8 80133248 E4840000 */      swc1 $f4, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CAC 8013324C C4800000 */      lwc1 $f0, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CB0 80133250 4602003C */    c.lt.s $f0, $f2
  /* 179CB4 80133254 00000000 */       nop 
  /* 179CB8 80133258 45020004 */     bc1fl .L8013326C
  /* 179CBC 8013325C E4400018 */      swc1 $f0, 0x18($v0)
  /* 179CC0 80133260 E4820000 */      swc1 $f2, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CC4 80133264 C4800000 */      lwc1 $f0, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CC8 80133268 E4400018 */      swc1 $f0, 0x18($v0)
  .L8013326C:
  /* 179CCC 8013326C C4860000 */      lwc1 $f6, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CD0 80133270 44811000 */      mtc1 $at, $f2 # 2.0 to cop1
  /* 179CD4 80133274 3C014382 */       lui $at, (0x43820000 >> 16) # 260.0
  /* 179CD8 80133278 E446001C */      swc1 $f6, 0x1c($v0)
  /* 179CDC 8013327C C48A0000 */      lwc1 $f10, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179CE0 80133280 44814000 */      mtc1 $at, $f8 # 260.0 to cop1
  /* 179CE4 80133284 3C014320 */       lui $at, (0x43200000 >> 16) # 160.0
  /* 179CE8 80133288 44812000 */      mtc1 $at, $f4 # 160.0 to cop1
  /* 179CEC 8013328C 460A4402 */     mul.s $f16, $f8, $f10
  /* 179CF0 80133290 3C014338 */       lui $at, (0x43380000 >> 16) # 184.0
  /* 179CF4 80133294 44814000 */      mtc1 $at, $f8 # 184.0 to cop1
  /* 179CF8 80133298 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 179CFC 8013329C 3C058013 */       lui $a1, %hi(sGMContinueFighterGObj)
  /* 179D00 801332A0 24A54300 */     addiu $a1, $a1, %lo(sGMContinueFighterGObj)
  /* 179D04 801332A4 3C078013 */       lui $a3, %hi(sGMContinueFighterDesc)
  /* 179D08 801332A8 46028483 */     div.s $f18, $f16, $f2
  /* 179D0C 801332AC 24E74348 */     addiu $a3, $a3, %lo(sGMContinueFighterDesc)
  /* 179D10 801332B0 3C068039 */       lui $a2, %hi(D_ovl1_80390D90)
  /* 179D14 801332B4 24C60D90 */     addiu $a2, $a2, %lo(D_ovl1_80390D90)
  /* 179D18 801332B8 46122181 */     sub.s $f6, $f4, $f18
  /* 179D1C 801332BC 44819000 */      mtc1 $at, $f18 # 120.0 to cop1
  /* 179D20 801332C0 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 179D24 801332C4 E4460058 */      swc1 $f6, 0x58($v0)
  /* 179D28 801332C8 C48A0000 */      lwc1 $f10, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179D2C 801332CC 460A4402 */     mul.s $f16, $f8, $f10
  /* 179D30 801332D0 44815000 */      mtc1 $at, $f10 # 3.0 to cop1
  /* 179D34 801332D4 46028103 */     div.s $f4, $f16, $f2
  /* 179D38 801332D8 46049181 */     sub.s $f6, $f18, $f4
  /* 179D3C 801332DC E446005C */      swc1 $f6, 0x5c($v0)
  /* 179D40 801332E0 8CAF0000 */        lw $t7, ($a1) # sGMContinueFighterGObj + 0
  /* 179D44 801332E4 8DE30074 */        lw $v1, 0x74($t7)
  /* 179D48 801332E8 C4680020 */      lwc1 $f8, 0x20($v1)
  /* 179D4C 801332EC 460A4400 */     add.s $f16, $f8, $f10
  /* 179D50 801332F0 E4700020 */      swc1 $f16, 0x20($v1)
  /* 179D54 801332F4 8CF80000 */        lw $t8, ($a3) # sGMContinueFighterDesc + 0
  /* 179D58 801332F8 C4840000 */      lwc1 $f4, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179D5C 801332FC 8CA90000 */        lw $t1, ($a1) # sGMContinueFighterGObj + 0
  /* 179D60 80133300 0018C880 */       sll $t9, $t8, 2
  /* 179D64 80133304 00D94021 */      addu $t0, $a2, $t9
  /* 179D68 80133308 C5120000 */      lwc1 $f18, ($t0)
  /* 179D6C 8013330C 8D2A0074 */        lw $t2, 0x74($t1)
  /* 179D70 80133310 46049182 */     mul.s $f6, $f18, $f4
  /* 179D74 80133314 E5460040 */      swc1 $f6, 0x40($t2)
  /* 179D78 80133318 8CEB0000 */        lw $t3, ($a3) # sGMContinueFighterDesc + 0
  /* 179D7C 8013331C C48A0000 */      lwc1 $f10, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179D80 80133320 8CAE0000 */        lw $t6, ($a1) # sGMContinueFighterGObj + 0
  /* 179D84 80133324 000B6080 */       sll $t4, $t3, 2
  /* 179D88 80133328 00CC6821 */      addu $t5, $a2, $t4
  /* 179D8C 8013332C C5A80000 */      lwc1 $f8, ($t5)
  /* 179D90 80133330 8DCF0074 */        lw $t7, 0x74($t6)
  /* 179D94 80133334 460A4402 */     mul.s $f16, $f8, $f10
  /* 179D98 80133338 E5F00044 */      swc1 $f16, 0x44($t7)
  /* 179D9C 8013333C 8CF80000 */        lw $t8, ($a3) # sGMContinueFighterDesc + 0
  /* 179DA0 80133340 C4840000 */      lwc1 $f4, ($a0) # sGMContinueGameOverFadeOutScale + 0
  /* 179DA4 80133344 8CA90000 */        lw $t1, ($a1) # sGMContinueFighterGObj + 0
  /* 179DA8 80133348 0018C880 */       sll $t9, $t8, 2
  /* 179DAC 8013334C 00D94021 */      addu $t0, $a2, $t9
  /* 179DB0 80133350 C5120000 */      lwc1 $f18, ($t0)
  /* 179DB4 80133354 8D2A0074 */        lw $t2, 0x74($t1)
  /* 179DB8 80133358 46049182 */     mul.s $f6, $f18, $f4
  /* 179DBC 8013335C E5460048 */      swc1 $f6, 0x48($t2)
  .L80133360:
  /* 179DC0 80133360 03E00008 */        jr $ra
  /* 179DC4 80133364 00000000 */       nop 

glabel gmContinueMakeGameOver
  /* 179DC8 80133368 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 179DCC 8013336C 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 179DD0 80133370 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 179DD4 80133374 AFBF0014 */        sw $ra, 0x14($sp)
  /* 179DD8 80133378 3C018013 */       lui $at, %hi(sGMContinueGameOverFadeOutScale)
  /* 179DDC 8013337C 00002025 */        or $a0, $zero, $zero
  /* 179DE0 80133380 00002825 */        or $a1, $zero, $zero
  /* 179DE4 80133384 24060014 */     addiu $a2, $zero, 0x14
  /* 179DE8 80133388 3C078000 */       lui $a3, 0x8000
  /* 179DEC 8013338C 0C00265A */       jal omMakeGObjSPAfter
  /* 179DF0 80133390 E4244340 */      swc1 $f4, %lo(sGMContinueGameOverFadeOutScale)($at)
  /* 179DF4 80133394 3C018013 */       lui $at, %hi(sGMContinueGameOverGObj)
  /* 179DF8 80133398 3C058013 */       lui $a1, %hi(gmContinueGameOverProcUpdate)
  /* 179DFC 8013339C AC224334 */        sw $v0, %lo(sGMContinueGameOverGObj)($at)
  /* 179E00 801333A0 24A53210 */     addiu $a1, $a1, %lo(gmContinueGameOverProcUpdate)
  /* 179E04 801333A4 00402025 */        or $a0, $v0, $zero
  /* 179E08 801333A8 24060001 */     addiu $a2, $zero, 1
  /* 179E0C 801333AC 0C002062 */       jal omAddGObjCommonProc
  /* 179E10 801333B0 24070001 */     addiu $a3, $zero, 1
  /* 179E14 801333B4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 179E18 801333B8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 179E1C 801333BC 03E00008 */        jr $ra
  /* 179E20 801333C0 00000000 */       nop 

glabel func_ovl55_801333C4
  /* 179E24 801333C4 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 179E28 801333C8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 179E2C 801333CC AFBF003C */        sw $ra, 0x3c($sp)
  /* 179E30 801333D0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 179E34 801333D4 240F0050 */     addiu $t7, $zero, 0x50
  /* 179E38 801333D8 24180000 */     addiu $t8, $zero, 0
  /* 179E3C 801333DC 3C190400 */       lui $t9, 0x400
  /* 179E40 801333E0 2408FFFF */     addiu $t0, $zero, -1
  /* 179E44 801333E4 24090001 */     addiu $t1, $zero, 1
  /* 179E48 801333E8 240A0001 */     addiu $t2, $zero, 1
  /* 179E4C 801333EC AFAA0030 */        sw $t2, 0x30($sp)
  /* 179E50 801333F0 AFA90028 */        sw $t1, 0x28($sp)
  /* 179E54 801333F4 AFA80020 */        sw $t0, 0x20($sp)
  /* 179E58 801333F8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 179E5C 801333FC AFB80018 */        sw $t8, 0x18($sp)
  /* 179E60 80133400 AFAF0014 */        sw $t7, 0x14($sp)
  /* 179E64 80133404 AFAE0010 */        sw $t6, 0x10($sp)
  /* 179E68 80133408 AFA00024 */        sw $zero, 0x24($sp)
  /* 179E6C 8013340C AFA0002C */        sw $zero, 0x2c($sp)
  /* 179E70 80133410 AFA00034 */        sw $zero, 0x34($sp)
  /* 179E74 80133414 24040401 */     addiu $a0, $zero, 0x401
  /* 179E78 80133418 00002825 */        or $a1, $zero, $zero
  /* 179E7C 8013341C 24060010 */     addiu $a2, $zero, 0x10
  /* 179E80 80133420 0C002E4F */       jal func_8000B93C
  /* 179E84 80133424 3C078000 */       lui $a3, 0x8000
  /* 179E88 80133428 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 179E8C 8013342C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 179E90 80133430 8C430074 */        lw $v1, 0x74($v0)
  /* 179E94 80133434 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 179E98 80133438 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 179E9C 8013343C 44050000 */      mfc1 $a1, $f0
  /* 179EA0 80133440 44060000 */      mfc1 $a2, $f0
  /* 179EA4 80133444 3C07439B */       lui $a3, 0x439b
  /* 179EA8 80133448 24640008 */     addiu $a0, $v1, 8
  /* 179EAC 8013344C AFA30044 */        sw $v1, 0x44($sp)
  /* 179EB0 80133450 0C001C20 */       jal func_80007080
  /* 179EB4 80133454 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 179EB8 80133458 8FA30044 */        lw $v1, 0x44($sp)
  /* 179EBC 8013345C 240B0004 */     addiu $t3, $zero, 4
  /* 179EC0 80133460 AC6B0080 */        sw $t3, 0x80($v1)
  /* 179EC4 80133464 8FBF003C */        lw $ra, 0x3c($sp)
  /* 179EC8 80133468 27BD0048 */     addiu $sp, $sp, 0x48
  /* 179ECC 8013346C 03E00008 */        jr $ra
  /* 179ED0 80133470 00000000 */       nop 

glabel func_ovl55_80133474
  /* 179ED4 80133474 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 179ED8 80133478 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 179EDC 8013347C AFBF003C */        sw $ra, 0x3c($sp)
  /* 179EE0 80133480 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 179EE4 80133484 240F003C */     addiu $t7, $zero, 0x3c
  /* 179EE8 80133488 24180000 */     addiu $t8, $zero, 0
  /* 179EEC 8013348C 3C198000 */       lui $t9, 0x8000
  /* 179EF0 80133490 2408FFFF */     addiu $t0, $zero, -1
  /* 179EF4 80133494 24090001 */     addiu $t1, $zero, 1
  /* 179EF8 80133498 240A0001 */     addiu $t2, $zero, 1
  /* 179EFC 8013349C AFAA0030 */        sw $t2, 0x30($sp)
  /* 179F00 801334A0 AFA90028 */        sw $t1, 0x28($sp)
  /* 179F04 801334A4 AFA80020 */        sw $t0, 0x20($sp)
  /* 179F08 801334A8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 179F0C 801334AC AFB80018 */        sw $t8, 0x18($sp)
  /* 179F10 801334B0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 179F14 801334B4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 179F18 801334B8 AFA00024 */        sw $zero, 0x24($sp)
  /* 179F1C 801334BC AFA0002C */        sw $zero, 0x2c($sp)
  /* 179F20 801334C0 AFA00034 */        sw $zero, 0x34($sp)
  /* 179F24 801334C4 24040401 */     addiu $a0, $zero, 0x401
  /* 179F28 801334C8 00002825 */        or $a1, $zero, $zero
  /* 179F2C 801334CC 24060010 */     addiu $a2, $zero, 0x10
  /* 179F30 801334D0 0C002E4F */       jal func_8000B93C
  /* 179F34 801334D4 3C078000 */       lui $a3, 0x8000
  /* 179F38 801334D8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 179F3C 801334DC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 179F40 801334E0 8C430074 */        lw $v1, 0x74($v0)
  /* 179F44 801334E4 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 179F48 801334E8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 179F4C 801334EC 44050000 */      mfc1 $a1, $f0
  /* 179F50 801334F0 44060000 */      mfc1 $a2, $f0
  /* 179F54 801334F4 3C07439B */       lui $a3, 0x439b
  /* 179F58 801334F8 24640008 */     addiu $a0, $v1, 8
  /* 179F5C 801334FC AFA30044 */        sw $v1, 0x44($sp)
  /* 179F60 80133500 0C001C20 */       jal func_80007080
  /* 179F64 80133504 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 179F68 80133508 8FA30044 */        lw $v1, 0x44($sp)
  /* 179F6C 8013350C 240B0004 */     addiu $t3, $zero, 4
  /* 179F70 80133510 AC6B0080 */        sw $t3, 0x80($v1)
  /* 179F74 80133514 8FBF003C */        lw $ra, 0x3c($sp)
  /* 179F78 80133518 27BD0048 */     addiu $sp, $sp, 0x48
  /* 179F7C 8013351C 03E00008 */        jr $ra
  /* 179F80 80133520 00000000 */       nop 

glabel func_ovl55_80133524
  /* 179F84 80133524 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 179F88 80133528 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 179F8C 8013352C AFBF003C */        sw $ra, 0x3c($sp)
  /* 179F90 80133530 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 179F94 80133534 240F0028 */     addiu $t7, $zero, 0x28
  /* 179F98 80133538 24180001 */     addiu $t8, $zero, 1
  /* 179F9C 8013353C 24190000 */     addiu $t9, $zero, 0
  /* 179FA0 80133540 2408FFFF */     addiu $t0, $zero, -1
  /* 179FA4 80133544 24090001 */     addiu $t1, $zero, 1
  /* 179FA8 80133548 240A0001 */     addiu $t2, $zero, 1
  /* 179FAC 8013354C AFAA0030 */        sw $t2, 0x30($sp)
  /* 179FB0 80133550 AFA90028 */        sw $t1, 0x28($sp)
  /* 179FB4 80133554 AFA80020 */        sw $t0, 0x20($sp)
  /* 179FB8 80133558 AFB9001C */        sw $t9, 0x1c($sp)
  /* 179FBC 8013355C AFB80018 */        sw $t8, 0x18($sp)
  /* 179FC0 80133560 AFAF0014 */        sw $t7, 0x14($sp)
  /* 179FC4 80133564 AFAE0010 */        sw $t6, 0x10($sp)
  /* 179FC8 80133568 AFA00024 */        sw $zero, 0x24($sp)
  /* 179FCC 8013356C AFA0002C */        sw $zero, 0x2c($sp)
  /* 179FD0 80133570 AFA00034 */        sw $zero, 0x34($sp)
  /* 179FD4 80133574 24040401 */     addiu $a0, $zero, 0x401
  /* 179FD8 80133578 00002825 */        or $a1, $zero, $zero
  /* 179FDC 8013357C 24060010 */     addiu $a2, $zero, 0x10
  /* 179FE0 80133580 0C002E4F */       jal func_8000B93C
  /* 179FE4 80133584 3C078000 */       lui $a3, 0x8000
  /* 179FE8 80133588 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 179FEC 8013358C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 179FF0 80133590 8C430074 */        lw $v1, 0x74($v0)
  /* 179FF4 80133594 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 179FF8 80133598 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 179FFC 8013359C 44050000 */      mfc1 $a1, $f0
  /* 17A000 801335A0 44060000 */      mfc1 $a2, $f0
  /* 17A004 801335A4 3C07439B */       lui $a3, 0x439b
  /* 17A008 801335A8 24640008 */     addiu $a0, $v1, 8
  /* 17A00C 801335AC AFA30044 */        sw $v1, 0x44($sp)
  /* 17A010 801335B0 0C001C20 */       jal func_80007080
  /* 17A014 801335B4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 17A018 801335B8 8FA30044 */        lw $v1, 0x44($sp)
  /* 17A01C 801335BC 240B0004 */     addiu $t3, $zero, 4
  /* 17A020 801335C0 AC6B0080 */        sw $t3, 0x80($v1)
  /* 17A024 801335C4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 17A028 801335C8 27BD0048 */     addiu $sp, $sp, 0x48
  /* 17A02C 801335CC 03E00008 */        jr $ra
  /* 17A030 801335D0 00000000 */       nop 

glabel func_ovl55_801335D4
  /* 17A034 801335D4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 17A038 801335D8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17A03C 801335DC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 17A040 801335E0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 17A044 801335E4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 17A048 801335E8 AFB00020 */        sw $s0, 0x20($sp)
  /* 17A04C 801335EC 00808025 */        or $s0, $a0, $zero
  /* 17A050 801335F0 AFBF0024 */        sw $ra, 0x24($sp)
  /* 17A054 801335F4 44050000 */      mfc1 $a1, $f0
  /* 17A058 801335F8 44060000 */      mfc1 $a2, $f0
  /* 17A05C 801335FC 24840008 */     addiu $a0, $a0, 8
  /* 17A060 80133600 3C07439B */       lui $a3, 0x439b
  /* 17A064 80133604 0C001C20 */       jal func_80007080
  /* 17A068 80133608 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 17A06C 8013360C 3C01447A */       lui $at, (0x447A0000 >> 16) # 1000.0
  /* 17A070 80133610 44813000 */      mtc1 $at, $f6 # 1000.0 to cop1
  /* 17A074 80133614 3C0144FA */       lui $at, (0x44FA0000 >> 16) # 2000.0
  /* 17A078 80133618 44814000 */      mtc1 $at, $f8 # 2000.0 to cop1
  /* 17A07C 8013361C 3C0143C8 */       lui $at, (0x43C80000 >> 16) # 400.0
  /* 17A080 80133620 44815000 */      mtc1 $at, $f10 # 400.0 to cop1
  /* 17A084 80133624 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 17A088 80133628 44800000 */      mtc1 $zero, $f0
  /* 17A08C 8013362C 44818000 */      mtc1 $at, $f16 # 1.0 to cop1
  /* 17A090 80133630 3C0141F0 */       lui $at, (0x41F00000 >> 16) # 30.0
  /* 17A094 80133634 44819000 */      mtc1 $at, $f18 # 30.0 to cop1
  /* 17A098 80133638 3C0142C8 */       lui $at, (0x42C80000 >> 16) # 100.0
  /* 17A09C 8013363C 44812000 */      mtc1 $at, $f4 # 100.0 to cop1
  /* 17A0A0 80133640 3C018013 */       lui $at, %hi(D_ovl55_801342EC)
  /* 17A0A4 80133644 E6060040 */      swc1 $f6, 0x40($s0)
  /* 17A0A8 80133648 E6080044 */      swc1 $f8, 0x44($s0)
  /* 17A0AC 8013364C E60A004C */      swc1 $f10, 0x4c($s0)
  /* 17A0B0 80133650 E600003C */      swc1 $f0, 0x3c($s0)
  /* 17A0B4 80133654 E6000048 */      swc1 $f0, 0x48($s0)
  /* 17A0B8 80133658 E6000050 */      swc1 $f0, 0x50($s0)
  /* 17A0BC 8013365C E6000054 */      swc1 $f0, 0x54($s0)
  /* 17A0C0 80133660 E600005C */      swc1 $f0, 0x5c($s0)
  /* 17A0C4 80133664 E6100058 */      swc1 $f16, 0x58($s0)
  /* 17A0C8 80133668 E6120020 */      swc1 $f18, 0x20($s0)
  /* 17A0CC 8013366C E6040028 */      swc1 $f4, 0x28($s0)
  /* 17A0D0 80133670 C42642EC */      lwc1 $f6, %lo(D_ovl55_801342EC)($at)
  /* 17A0D4 80133674 240E0004 */     addiu $t6, $zero, 4
  /* 17A0D8 80133678 AE0E0080 */        sw $t6, 0x80($s0)
  /* 17A0DC 8013367C E606002C */      swc1 $f6, 0x2c($s0)
  /* 17A0E0 80133680 8FBF0024 */        lw $ra, 0x24($sp)
  /* 17A0E4 80133684 8FB00020 */        lw $s0, 0x20($sp)
  /* 17A0E8 80133688 27BD0028 */     addiu $sp, $sp, 0x28
  /* 17A0EC 8013368C 03E00008 */        jr $ra
  /* 17A0F0 80133690 00000000 */       nop 

glabel func_ovl55_80133694
  /* 17A0F4 80133694 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 17A0F8 80133698 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 17A0FC 8013369C 3C190804 */       lui $t9, (0x8048600 >> 16) # 134514176
  /* 17A100 801336A0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 17A104 801336A4 37398600 */       ori $t9, $t9, (0x8048600 & 0xFFFF) # 134514176
  /* 17A108 801336A8 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 17A10C 801336AC 240F0032 */     addiu $t7, $zero, 0x32
  /* 17A110 801336B0 24180000 */     addiu $t8, $zero, 0
  /* 17A114 801336B4 2408FFFF */     addiu $t0, $zero, -1
  /* 17A118 801336B8 24090001 */     addiu $t1, $zero, 1
  /* 17A11C 801336BC 240A0001 */     addiu $t2, $zero, 1
  /* 17A120 801336C0 240B0001 */     addiu $t3, $zero, 1
  /* 17A124 801336C4 AFAB0030 */        sw $t3, 0x30($sp)
  /* 17A128 801336C8 AFAA0028 */        sw $t2, 0x28($sp)
  /* 17A12C 801336CC AFA90024 */        sw $t1, 0x24($sp)
  /* 17A130 801336D0 AFA80020 */        sw $t0, 0x20($sp)
  /* 17A134 801336D4 AFB80018 */        sw $t8, 0x18($sp)
  /* 17A138 801336D8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 17A13C 801336DC AFAE0010 */        sw $t6, 0x10($sp)
  /* 17A140 801336E0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 17A144 801336E4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17A148 801336E8 AFA00034 */        sw $zero, 0x34($sp)
  /* 17A14C 801336EC 24040401 */     addiu $a0, $zero, 0x401
  /* 17A150 801336F0 00002825 */        or $a1, $zero, $zero
  /* 17A154 801336F4 24060010 */     addiu $a2, $zero, 0x10
  /* 17A158 801336F8 0C002E4F */       jal func_8000B93C
  /* 17A15C 801336FC 3C078000 */       lui $a3, 0x8000
  /* 17A160 80133700 0C04CD75 */       jal func_ovl55_801335D4
  /* 17A164 80133704 8C440074 */        lw $a0, 0x74($v0)
  /* 17A168 80133708 8FBF003C */        lw $ra, 0x3c($sp)
  /* 17A16C 8013370C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 17A170 80133710 03E00008 */        jr $ra
  /* 17A174 80133714 00000000 */       nop 

glabel func_ovl55_80133718
  /* 17A178 80133718 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 17A17C 8013371C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 17A180 80133720 AFBF003C */        sw $ra, 0x3c($sp)
  /* 17A184 80133724 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 17A188 80133728 240F005A */     addiu $t7, $zero, 0x5a
  /* 17A18C 8013372C 24180000 */     addiu $t8, $zero, 0
  /* 17A190 80133730 3C192000 */       lui $t9, 0x2000
  /* 17A194 80133734 2408FFFF */     addiu $t0, $zero, -1
  /* 17A198 80133738 24090001 */     addiu $t1, $zero, 1
  /* 17A19C 8013373C 240A0001 */     addiu $t2, $zero, 1
  /* 17A1A0 80133740 AFAA0030 */        sw $t2, 0x30($sp)
  /* 17A1A4 80133744 AFA90028 */        sw $t1, 0x28($sp)
  /* 17A1A8 80133748 AFA80020 */        sw $t0, 0x20($sp)
  /* 17A1AC 8013374C AFB9001C */        sw $t9, 0x1c($sp)
  /* 17A1B0 80133750 AFB80018 */        sw $t8, 0x18($sp)
  /* 17A1B4 80133754 AFAF0014 */        sw $t7, 0x14($sp)
  /* 17A1B8 80133758 AFAE0010 */        sw $t6, 0x10($sp)
  /* 17A1BC 8013375C AFA00024 */        sw $zero, 0x24($sp)
  /* 17A1C0 80133760 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17A1C4 80133764 AFA00034 */        sw $zero, 0x34($sp)
  /* 17A1C8 80133768 24040401 */     addiu $a0, $zero, 0x401
  /* 17A1CC 8013376C 00002825 */        or $a1, $zero, $zero
  /* 17A1D0 80133770 24060010 */     addiu $a2, $zero, 0x10
  /* 17A1D4 80133774 0C002E4F */       jal func_8000B93C
  /* 17A1D8 80133778 3C078000 */       lui $a3, 0x8000
  /* 17A1DC 8013377C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 17A1E0 80133780 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17A1E4 80133784 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 17A1E8 80133788 8C430074 */        lw $v1, 0x74($v0)
  /* 17A1EC 8013378C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 17A1F0 80133790 44050000 */      mfc1 $a1, $f0
  /* 17A1F4 80133794 44060000 */      mfc1 $a2, $f0
  /* 17A1F8 80133798 3C07439B */       lui $a3, 0x439b
  /* 17A1FC 8013379C 24640008 */     addiu $a0, $v1, 8
  /* 17A200 801337A0 0C001C20 */       jal func_80007080
  /* 17A204 801337A4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 17A208 801337A8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 17A20C 801337AC 27BD0040 */     addiu $sp, $sp, 0x40
  /* 17A210 801337B0 03E00008 */        jr $ra
  /* 17A214 801337B4 00000000 */       nop 

glabel func_ovl55_801337B8
  /* 17A218 801337B8 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 17A21C 801337BC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 17A220 801337C0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 17A224 801337C4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 17A228 801337C8 240F0046 */     addiu $t7, $zero, 0x46
  /* 17A22C 801337CC 24180000 */     addiu $t8, $zero, 0
  /* 17A230 801337D0 3C194000 */       lui $t9, 0x4000
  /* 17A234 801337D4 2408FFFF */     addiu $t0, $zero, -1
  /* 17A238 801337D8 24090001 */     addiu $t1, $zero, 1
  /* 17A23C 801337DC 240A0001 */     addiu $t2, $zero, 1
  /* 17A240 801337E0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 17A244 801337E4 AFA90028 */        sw $t1, 0x28($sp)
  /* 17A248 801337E8 AFA80020 */        sw $t0, 0x20($sp)
  /* 17A24C 801337EC AFB9001C */        sw $t9, 0x1c($sp)
  /* 17A250 801337F0 AFB80018 */        sw $t8, 0x18($sp)
  /* 17A254 801337F4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 17A258 801337F8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 17A25C 801337FC AFA00024 */        sw $zero, 0x24($sp)
  /* 17A260 80133800 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17A264 80133804 AFA00034 */        sw $zero, 0x34($sp)
  /* 17A268 80133808 24040401 */     addiu $a0, $zero, 0x401
  /* 17A26C 8013380C 00002825 */        or $a1, $zero, $zero
  /* 17A270 80133810 24060010 */     addiu $a2, $zero, 0x10
  /* 17A274 80133814 0C002E4F */       jal func_8000B93C
  /* 17A278 80133818 3C078000 */       lui $a3, 0x8000
  /* 17A27C 8013381C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 17A280 80133820 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17A284 80133824 8C430074 */        lw $v1, 0x74($v0)
  /* 17A288 80133828 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 17A28C 8013382C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 17A290 80133830 44050000 */      mfc1 $a1, $f0
  /* 17A294 80133834 44060000 */      mfc1 $a2, $f0
  /* 17A298 80133838 3C07439B */       lui $a3, 0x439b
  /* 17A29C 8013383C 24640008 */     addiu $a0, $v1, 8
  /* 17A2A0 80133840 AFA30044 */        sw $v1, 0x44($sp)
  /* 17A2A4 80133844 0C001C20 */       jal func_80007080
  /* 17A2A8 80133848 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 17A2AC 8013384C 8FA30044 */        lw $v1, 0x44($sp)
  /* 17A2B0 80133850 240B0004 */     addiu $t3, $zero, 4
  /* 17A2B4 80133854 AC6B0080 */        sw $t3, 0x80($v1)
  /* 17A2B8 80133858 8FBF003C */        lw $ra, 0x3c($sp)
  /* 17A2BC 8013385C 27BD0048 */     addiu $sp, $sp, 0x48
  /* 17A2C0 80133860 03E00008 */        jr $ra
  /* 17A2C4 80133864 00000000 */       nop 

glabel func_ovl55_80133868
  /* 17A2C8 80133868 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 17A2CC 8013386C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 17A2D0 80133870 AFBF003C */        sw $ra, 0x3c($sp)
  /* 17A2D4 80133874 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 17A2D8 80133878 240F001E */     addiu $t7, $zero, 0x1e
  /* 17A2DC 8013387C 24180000 */     addiu $t8, $zero, 0
  /* 17A2E0 80133880 3C191000 */       lui $t9, 0x1000
  /* 17A2E4 80133884 2408FFFF */     addiu $t0, $zero, -1
  /* 17A2E8 80133888 24090001 */     addiu $t1, $zero, 1
  /* 17A2EC 8013388C 240A0001 */     addiu $t2, $zero, 1
  /* 17A2F0 80133890 AFAA0030 */        sw $t2, 0x30($sp)
  /* 17A2F4 80133894 AFA90028 */        sw $t1, 0x28($sp)
  /* 17A2F8 80133898 AFA80020 */        sw $t0, 0x20($sp)
  /* 17A2FC 8013389C AFB9001C */        sw $t9, 0x1c($sp)
  /* 17A300 801338A0 AFB80018 */        sw $t8, 0x18($sp)
  /* 17A304 801338A4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 17A308 801338A8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 17A30C 801338AC AFA00024 */        sw $zero, 0x24($sp)
  /* 17A310 801338B0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17A314 801338B4 AFA00034 */        sw $zero, 0x34($sp)
  /* 17A318 801338B8 24040401 */     addiu $a0, $zero, 0x401
  /* 17A31C 801338BC 00002825 */        or $a1, $zero, $zero
  /* 17A320 801338C0 24060010 */     addiu $a2, $zero, 0x10
  /* 17A324 801338C4 0C002E4F */       jal func_8000B93C
  /* 17A328 801338C8 3C078000 */       lui $a3, 0x8000
  /* 17A32C 801338CC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 17A330 801338D0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17A334 801338D4 8C430074 */        lw $v1, 0x74($v0)
  /* 17A338 801338D8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 17A33C 801338DC 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 17A340 801338E0 44050000 */      mfc1 $a1, $f0
  /* 17A344 801338E4 44060000 */      mfc1 $a2, $f0
  /* 17A348 801338E8 3C07439B */       lui $a3, 0x439b
  /* 17A34C 801338EC 24640008 */     addiu $a0, $v1, 8
  /* 17A350 801338F0 AFA30044 */        sw $v1, 0x44($sp)
  /* 17A354 801338F4 0C001C20 */       jal func_80007080
  /* 17A358 801338F8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 17A35C 801338FC 8FA30044 */        lw $v1, 0x44($sp)
  /* 17A360 80133900 240B0004 */     addiu $t3, $zero, 4
  /* 17A364 80133904 AC6B0080 */        sw $t3, 0x80($v1)
  /* 17A368 80133908 8FBF003C */        lw $ra, 0x3c($sp)
  /* 17A36C 8013390C 27BD0048 */     addiu $sp, $sp, 0x48
  /* 17A370 80133910 03E00008 */        jr $ra
  /* 17A374 80133914 00000000 */       nop 

glabel func_ovl55_80133918
  /* 17A378 80133918 3C0E800A */       lui $t6, %hi((gSceneData + 0x13))
  /* 17A37C 8013391C 91CE4AE3 */       lbu $t6, %lo((gSceneData + 0x13))($t6)
  /* 17A380 80133920 3C018013 */       lui $at, %hi(sGMContinueFramesPassed)
  /* 17A384 80133924 3C18800A */       lui $t8, %hi(D_800A4B18)
  /* 17A388 80133928 000E78C0 */       sll $t7, $t6, 3
  /* 17A38C 8013392C 01EE7823 */      subu $t7, $t7, $t6
  /* 17A390 80133930 000F7880 */       sll $t7, $t7, 2
  /* 17A394 80133934 01EE7821 */      addu $t7, $t7, $t6
  /* 17A398 80133938 AC2042FC */        sw $zero, %lo(sGMContinueFramesPassed)($at)
  /* 17A39C 8013393C 000F7880 */       sll $t7, $t7, 2
  /* 17A3A0 80133940 27184B18 */     addiu $t8, $t8, %lo(D_800A4B18)
  /* 17A3A4 80133944 01F81021 */      addu $v0, $t7, $t8
  /* 17A3A8 80133948 3C038013 */       lui $v1, %hi(sGMContinueFighterDesc)
  /* 17A3AC 8013394C 90590023 */       lbu $t9, 0x23($v0)
  /* 17A3B0 80133950 90480026 */       lbu $t0, 0x26($v0)
  /* 17A3B4 80133954 90490027 */       lbu $t1, 0x27($v0)
  /* 17A3B8 80133958 24634348 */     addiu $v1, $v1, %lo(sGMContinueFighterDesc)
  /* 17A3BC 8013395C 3C018013 */       lui $at, %hi(sGMContinueOptionSelect)
  /* 17A3C0 80133960 AC790000 */        sw $t9, ($v1) # sGMContinueFighterDesc + 0
  /* 17A3C4 80133964 AC680004 */        sw $t0, 4($v1) # sGMContinueFighterDesc + 4
  /* 17A3C8 80133968 AC690008 */        sw $t1, 8($v1) # sGMContinueFighterDesc + 8
  /* 17A3CC 8013396C AC204338 */        sw $zero, %lo(sGMContinueOptionSelect)($at)
  /* 17A3D0 80133970 3C018013 */       lui $at, %hi(sGMContinueStatus)
  /* 17A3D4 80133974 AC20433C */        sw $zero, %lo(sGMContinueStatus)($at)
  /* 17A3D8 80133978 3C018013 */       lui $at, %hi(D_ovl55_80134354)
  /* 17A3DC 8013397C AC204354 */        sw $zero, %lo(D_ovl55_80134354)($at)
  /* 17A3E0 80133980 3C018013 */       lui $at, %hi(sGMContinueOptionNoGameOverAutoWait)
  /* 17A3E4 80133984 240AFFFF */     addiu $t2, $zero, -1
  /* 17A3E8 80133988 03E00008 */        jr $ra
  /* 17A3EC 8013398C AC2A4364 */        sw $t2, %lo(sGMContinueOptionNoGameOverAutoWait)($at)

glabel gmContinueAbsolutelyNothingWhichSmartassLeftThisInHereBruh
  /* 17A3F0 80133990 03E00008 */        jr $ra
  /* 17A3F4 80133994 00000000 */       nop 

glabel gmContinueActorProcUpdate
  /* 17A3F8 80133998 3C068013 */       lui $a2, %hi(sGMContinueFramesPassed)
  /* 17A3FC 8013399C 24C642FC */     addiu $a2, $a2, %lo(sGMContinueFramesPassed)
  /* 17A400 801339A0 8CCE0000 */        lw $t6, ($a2) # sGMContinueFramesPassed + 0
  /* 17A404 801339A4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 17A408 801339A8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 17A40C 801339AC 25CF0001 */     addiu $t7, $t6, 1
  /* 17A410 801339B0 29E1000A */      slti $at, $t7, 0xa
  /* 17A414 801339B4 AFA40020 */        sw $a0, 0x20($sp)
  /* 17A418 801339B8 14200163 */      bnez $at, .L80133F48
  /* 17A41C 801339BC ACCF0000 */        sw $t7, ($a2) # sGMContinueFramesPassed + 0
  /* 17A420 801339C0 3C188013 */       lui $t8, %hi(sGMContinueOptionYesRetryWait)
  /* 17A424 801339C4 8F18435C */        lw $t8, %lo(sGMContinueOptionYesRetryWait)($t8)
  /* 17A428 801339C8 170F000A */       bne $t8, $t7, .L801339F4
  /* 17A42C 801339CC 3C02800A */       lui $v0, %hi(gSceneData)
  /* 17A430 801339D0 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 17A434 801339D4 90590000 */       lbu $t9, ($v0) # gSceneData + 0
  /* 17A438 801339D8 24080001 */     addiu $t0, $zero, 1
  /* 17A43C 801339DC A0480000 */        sb $t0, ($v0) # gSceneData + 0
  /* 17A440 801339E0 24090001 */     addiu $t1, $zero, 1
  /* 17A444 801339E4 3C018013 */       lui $at, %hi(sGMContinueIsSelectContinue)
  /* 17A448 801339E8 A0590001 */        sb $t9, 1($v0) # gSceneData + 1
  /* 17A44C 801339EC 0C00171D */       jal func_80005C74
  /* 17A450 801339F0 AC294360 */        sw $t1, %lo(sGMContinueIsSelectContinue)($at)
  .L801339F4:
  /* 17A454 801339F4 3C038013 */       lui $v1, %hi(D_ovl55_80134354)
  /* 17A458 801339F8 24634354 */     addiu $v1, $v1, %lo(D_ovl55_80134354)
  /* 17A45C 801339FC 8C620000 */        lw $v0, ($v1) # D_ovl55_80134354 + 0
  /* 17A460 80133A00 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 17A464 80133A04 10400002 */      beqz $v0, .L80133A10
  /* 17A468 80133A08 244AFFFF */     addiu $t2, $v0, -1
  /* 17A46C 80133A0C AC6A0000 */        sw $t2, ($v1) # D_ovl55_80134354 + 0
  .L80133A10:
  /* 17A470 80133A10 3C038013 */       lui $v1, %hi(sGMContinueOptionChangeWait)
  /* 17A474 80133A14 2463436C */     addiu $v1, $v1, %lo(sGMContinueOptionChangeWait)
  /* 17A478 80133A18 8C620000 */        lw $v0, ($v1) # sGMContinueOptionChangeWait + 0
  /* 17A47C 80133A1C 10400002 */      beqz $v0, .L80133A28
  /* 17A480 80133A20 244BFFFF */     addiu $t3, $v0, -1
  /* 17A484 80133A24 AC6B0000 */        sw $t3, ($v1) # sGMContinueOptionChangeWait + 0
  .L80133A28:
  /* 17A488 80133A28 0C0E4281 */       jal func_ovl1_80390A04
  /* 17A48C 80133A2C 2405000F */     addiu $a1, $zero, 0xf
  /* 17A490 80133A30 10400006 */      beqz $v0, .L80133A4C
  /* 17A494 80133A34 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 17A498 80133A38 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 17A49C 80133A3C 2405000F */     addiu $a1, $zero, 0xf
  /* 17A4A0 80133A40 10400002 */      beqz $v0, .L80133A4C
  /* 17A4A4 80133A44 3C018013 */       lui $at, %hi(sGMContinueOptionChangeWait)
  /* 17A4A8 80133A48 AC20436C */        sw $zero, %lo(sGMContinueOptionChangeWait)($at)
  .L80133A4C:
  /* 17A4AC 80133A4C 3C0C8013 */       lui $t4, %hi(sGMContinueFramesPassed)
  /* 17A4B0 80133A50 8D8C42FC */        lw $t4, %lo(sGMContinueFramesPassed)($t4)
  /* 17A4B4 80133A54 24010960 */     addiu $at, $zero, 0x960
  /* 17A4B8 80133A58 3C0D8013 */       lui $t5, %hi(sGMContinueStatus)
  /* 17A4BC 80133A5C 15810029 */       bne $t4, $at, .L80133B04
  /* 17A4C0 80133A60 00000000 */       nop 
  /* 17A4C4 80133A64 8DAD433C */        lw $t5, %lo(sGMContinueStatus)($t5)
  /* 17A4C8 80133A68 3C048013 */       lui $a0, %hi(sGMContinueShadowGObj)
  /* 17A4CC 80133A6C 15A00025 */      bnez $t5, .L80133B04
  /* 17A4D0 80133A70 00000000 */       nop 
  /* 17A4D4 80133A74 0C0026A1 */       jal omEjectGObj
  /* 17A4D8 80133A78 8C844308 */        lw $a0, %lo(sGMContinueShadowGObj)($a0)
  /* 17A4DC 80133A7C 3C048013 */       lui $a0, %hi(sGMContinueSpotlightGObj)
  /* 17A4E0 80133A80 0C0026A1 */       jal omEjectGObj
  /* 17A4E4 80133A84 8C84430C */        lw $a0, %lo(sGMContinueSpotlightGObj)($a0)
  /* 17A4E8 80133A88 3C048013 */       lui $a0, %hi(sGMContinueContinueGObj)
  /* 17A4EC 80133A8C 0C0026A1 */       jal omEjectGObj
  /* 17A4F0 80133A90 8C844304 */        lw $a0, %lo(sGMContinueContinueGObj)($a0)
  /* 17A4F4 80133A94 3C048013 */       lui $a0, %hi(sGMContinueOptionGObj)
  /* 17A4F8 80133A98 0C0026A1 */       jal omEjectGObj
  /* 17A4FC 80133A9C 8C844314 */        lw $a0, %lo(sGMContinueOptionGObj)($a0)
  /* 17A500 80133AA0 3C048013 */       lui $a0, %hi(sGMContinueCursorGObj)
  /* 17A504 80133AA4 0C0026A1 */       jal omEjectGObj
  /* 17A508 80133AA8 8C844310 */        lw $a0, %lo(sGMContinueCursorGObj)($a0)
  /* 17A50C 80133AAC 0C04C8B7 */       jal gmContinueMakeRoomFadeOut
  /* 17A510 80133AB0 00000000 */       nop 
  /* 17A514 80133AB4 0C04CC1F */       jal gmContinueMakeGameOverSObjs
  /* 17A518 80133AB8 00000000 */       nop 
  /* 17A51C 80133ABC 0C04CCDA */       jal gmContinueMakeGameOver
  /* 17A520 80133AC0 00000000 */       nop 
  /* 17A524 80133AC4 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A528 80133AC8 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  /* 17A52C 80133ACC 240E0002 */     addiu $t6, $zero, 2
  /* 17A530 80133AD0 3C018013 */       lui $at, %hi(sGMContinueStatus)
  /* 17A534 80133AD4 AC2E433C */        sw $t6, %lo(sGMContinueStatus)($at)
  /* 17A538 80133AD8 3C018013 */       lui $at, %hi(sGMContinueOptionNoGameOverInputWait)
  /* 17A53C 80133ADC 246F005A */     addiu $t7, $v1, 0x5a
  /* 17A540 80133AE0 AC2F4358 */        sw $t7, %lo(sGMContinueOptionNoGameOverInputWait)($at)
  /* 17A544 80133AE4 3C018013 */       lui $at, %hi(sGMContinueOptionNoGameOverAutoWait)
  /* 17A548 80133AE8 24780708 */     addiu $t8, $v1, 0x708
  /* 17A54C 80133AEC AC384364 */        sw $t8, %lo(sGMContinueOptionNoGameOverAutoWait)($at)
  /* 17A550 80133AF0 00002025 */        or $a0, $zero, $zero
  /* 17A554 80133AF4 0C0082AD */       jal func_80020AB4
  /* 17A558 80133AF8 24050020 */     addiu $a1, $zero, 0x20
  /* 17A55C 80133AFC 0C009A70 */       jal func_800269C0
  /* 17A560 80133B00 240401E7 */     addiu $a0, $zero, 0x1e7
  .L80133B04:
  /* 17A564 80133B04 3C198013 */       lui $t9, %hi(sGMContinueStatus)
  /* 17A568 80133B08 8F39433C */        lw $t9, %lo(sGMContinueStatus)($t9)
  /* 17A56C 80133B0C 3C088013 */       lui $t0, %hi(sGMContinueFramesPassed)
  /* 17A570 80133B10 172000C7 */      bnez $t9, .L80133E30
  /* 17A574 80133B14 00000000 */       nop 
  /* 17A578 80133B18 8D0842FC */        lw $t0, %lo(sGMContinueFramesPassed)($t0)
  /* 17A57C 80133B1C 29010097 */      slti $at, $t0, 0x97
  /* 17A580 80133B20 14200085 */      bnez $at, .L80133D38
  /* 17A584 80133B24 00000000 */       nop 
  /* 17A588 80133B28 0C0E41DB */       jal func_ovl1_8039076C
  /* 17A58C 80133B2C 34049000 */       ori $a0, $zero, 0x9000
  /* 17A590 80133B30 10400081 */      beqz $v0, .L80133D38
  /* 17A594 80133B34 3C028013 */       lui $v0, %hi(sGMContinueOptionSelect)
  /* 17A598 80133B38 8C424338 */        lw $v0, %lo(sGMContinueOptionSelect)($v0)
  /* 17A59C 80133B3C 3C048013 */       lui $a0, 0x8013
  /* 17A5A0 80133B40 10400005 */      beqz $v0, .L80133B58
  /* 17A5A4 80133B44 24010001 */     addiu $at, $zero, 1
  /* 17A5A8 80133B48 10410057 */       beq $v0, $at, .L80133CA8
  /* 17A5AC 80133B4C 3C048013 */       lui $a0, %hi(sGMContinueShadowGObj)
  /* 17A5B0 80133B50 10000079 */         b .L80133D38
  /* 17A5B4 80133B54 00000000 */       nop 
  .L80133B58:
  /* 17A5B8 80133B58 0C0026A1 */       jal omEjectGObj
  /* 17A5BC 80133B5C 8C844308 */        lw $a0, %lo(sGMContinueShadowGObj)($a0)
  /* 17A5C0 80133B60 3C048013 */       lui $a0, %hi(sGMContinueSpotlightGObj)
  /* 17A5C4 80133B64 0C0026A1 */       jal omEjectGObj
  /* 17A5C8 80133B68 8C84430C */        lw $a0, %lo(sGMContinueSpotlightGObj)($a0)
  /* 17A5CC 80133B6C 3C048013 */       lui $a0, %hi(sGMContinueContinueGObj)
  /* 17A5D0 80133B70 0C0026A1 */       jal omEjectGObj
  /* 17A5D4 80133B74 8C844304 */        lw $a0, %lo(sGMContinueContinueGObj)($a0)
  /* 17A5D8 80133B78 3C048013 */       lui $a0, %hi(sGMContinueOptionGObj)
  /* 17A5DC 80133B7C 0C0026A1 */       jal omEjectGObj
  /* 17A5E0 80133B80 8C844314 */        lw $a0, %lo(sGMContinueOptionGObj)($a0)
  /* 17A5E4 80133B84 3C048013 */       lui $a0, %hi(sGMContinueCursorGObj)
  /* 17A5E8 80133B88 0C0026A1 */       jal omEjectGObj
  /* 17A5EC 80133B8C 8C844310 */        lw $a0, %lo(sGMContinueCursorGObj)($a0)
  /* 17A5F0 80133B90 3C09800A */       lui $t1, %hi((gSceneData + 0x20))
  /* 17A5F4 80133B94 8D294AF0 */        lw $t1, %lo((gSceneData + 0x20))($t1)
  /* 17A5F8 80133B98 3C014F80 */       lui $at, (0x4F800000 >> 16) # 4294967300.0
  /* 17A5FC 80133B9C 3C048013 */       lui $a0, %hi(sGMContinueScoreGObj)
  /* 17A600 80133BA0 44892000 */      mtc1 $t1, $f4
  /* 17A604 80133BA4 05210004 */      bgez $t1, .L80133BB8
  /* 17A608 80133BA8 468021A0 */   cvt.s.w $f6, $f4
  /* 17A60C 80133BAC 44814000 */      mtc1 $at, $f8 # 4294967300.0 to cop1
  /* 17A610 80133BB0 00000000 */       nop 
  /* 17A614 80133BB4 46083180 */     add.s $f6, $f6, $f8
  .L80133BB8:
  /* 17A618 80133BB8 3C013F00 */       lui $at, (0x3F000000 >> 16) # 0.5
  /* 17A61C 80133BBC 44815000 */      mtc1 $at, $f10 # 0.5 to cop1
  /* 17A620 80133BC0 240B0001 */     addiu $t3, $zero, 1
  /* 17A624 80133BC4 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 17A628 80133BC8 460A3402 */     mul.s $f16, $f6, $f10
  /* 17A62C 80133BCC 444AF800 */      cfc1 $t2, $31
  /* 17A630 80133BD0 44CBF800 */      ctc1 $t3, $31
  /* 17A634 80133BD4 00000000 */       nop 
  /* 17A638 80133BD8 460084A4 */   cvt.w.s $f18, $f16
  /* 17A63C 80133BDC 444BF800 */      cfc1 $t3, $31
  /* 17A640 80133BE0 00000000 */       nop 
  /* 17A644 80133BE4 316B0078 */      andi $t3, $t3, 0x78
  /* 17A648 80133BE8 51600013 */      beql $t3, $zero, .L80133C38
  /* 17A64C 80133BEC 440B9000 */      mfc1 $t3, $f18
  /* 17A650 80133BF0 44819000 */      mtc1 $at, $f18 # 2147483600.0 to cop1
  /* 17A654 80133BF4 240B0001 */     addiu $t3, $zero, 1
  /* 17A658 80133BF8 46128481 */     sub.s $f18, $f16, $f18
  /* 17A65C 80133BFC 44CBF800 */      ctc1 $t3, $31
  /* 17A660 80133C00 00000000 */       nop 
  /* 17A664 80133C04 460094A4 */   cvt.w.s $f18, $f18
  /* 17A668 80133C08 444BF800 */      cfc1 $t3, $31
  /* 17A66C 80133C0C 00000000 */       nop 
  /* 17A670 80133C10 316B0078 */      andi $t3, $t3, 0x78
  /* 17A674 80133C14 15600005 */      bnez $t3, .L80133C2C
  /* 17A678 80133C18 00000000 */       nop 
  /* 17A67C 80133C1C 440B9000 */      mfc1 $t3, $f18
  /* 17A680 80133C20 3C018000 */       lui $at, 0x8000
  /* 17A684 80133C24 10000007 */         b .L80133C44
  /* 17A688 80133C28 01615825 */        or $t3, $t3, $at
  .L80133C2C:
  /* 17A68C 80133C2C 10000005 */         b .L80133C44
  /* 17A690 80133C30 240BFFFF */     addiu $t3, $zero, -1
  /* 17A694 80133C34 440B9000 */      mfc1 $t3, $f18
  .L80133C38:
  /* 17A698 80133C38 00000000 */       nop 
  /* 17A69C 80133C3C 0560FFFB */      bltz $t3, .L80133C2C
  /* 17A6A0 80133C40 00000000 */       nop 
  .L80133C44:
  /* 17A6A4 80133C44 44CAF800 */      ctc1 $t2, $31
  /* 17A6A8 80133C48 3C01800A */       lui $at, %hi((gSceneData + 0x20))
  /* 17A6AC 80133C4C AC2B4AF0 */        sw $t3, %lo((gSceneData + 0x20))($at)
  /* 17A6B0 80133C50 0C0026A1 */       jal omEjectGObj
  /* 17A6B4 80133C54 8C844368 */        lw $a0, %lo(sGMContinueScoreGObj)($a0)
  /* 17A6B8 80133C58 3C04800A */       lui $a0, %hi((gSceneData + 0x20))
  /* 17A6BC 80133C5C 0C04C7E6 */       jal gmContinueMakeScoreDisplay
  /* 17A6C0 80133C60 8C844AF0 */        lw $a0, %lo((gSceneData + 0x20))($a0)
  /* 17A6C4 80133C64 3C048013 */       lui $a0, %hi(sGMContinueFighterGObj)
  /* 17A6C8 80133C68 3C050001 */       lui $a1, (0x1000A >> 16) # 65546
  /* 17A6CC 80133C6C 34A5000A */       ori $a1, $a1, (0x1000A & 0xFFFF) # 65546
  /* 17A6D0 80133C70 0C0E4173 */       jal func_ovl1_803905CC
  /* 17A6D4 80133C74 8C844300 */        lw $a0, %lo(sGMContinueFighterGObj)($a0)
  /* 17A6D8 80133C78 3C0D8013 */       lui $t5, %hi(sGMContinueFramesPassed)
  /* 17A6DC 80133C7C 8DAD42FC */        lw $t5, %lo(sGMContinueFramesPassed)($t5)
  /* 17A6E0 80133C80 240C0001 */     addiu $t4, $zero, 1
  /* 17A6E4 80133C84 3C018013 */       lui $at, %hi(sGMContinueStatus)
  /* 17A6E8 80133C88 AC2C433C */        sw $t4, %lo(sGMContinueStatus)($at)
  /* 17A6EC 80133C8C 3C018013 */       lui $at, %hi(sGMContinueOptionYesRetryWait)
  /* 17A6F0 80133C90 25AE00F0 */     addiu $t6, $t5, 0xf0
  /* 17A6F4 80133C94 AC2E435C */        sw $t6, %lo(sGMContinueOptionYesRetryWait)($at)
  /* 17A6F8 80133C98 0C009A70 */       jal func_800269C0
  /* 17A6FC 80133C9C 240400A0 */     addiu $a0, $zero, 0xa0
  /* 17A700 80133CA0 10000025 */         b .L80133D38
  /* 17A704 80133CA4 00000000 */       nop 
  .L80133CA8:
  /* 17A708 80133CA8 0C0026A1 */       jal omEjectGObj
  /* 17A70C 80133CAC 8C844308 */        lw $a0, 0x4308($a0)
  /* 17A710 80133CB0 3C048013 */       lui $a0, %hi(sGMContinueSpotlightGObj)
  /* 17A714 80133CB4 0C0026A1 */       jal omEjectGObj
  /* 17A718 80133CB8 8C84430C */        lw $a0, %lo(sGMContinueSpotlightGObj)($a0)
  /* 17A71C 80133CBC 3C048013 */       lui $a0, %hi(sGMContinueContinueGObj)
  /* 17A720 80133CC0 0C0026A1 */       jal omEjectGObj
  /* 17A724 80133CC4 8C844304 */        lw $a0, %lo(sGMContinueContinueGObj)($a0)
  /* 17A728 80133CC8 3C048013 */       lui $a0, %hi(sGMContinueOptionGObj)
  /* 17A72C 80133CCC 0C0026A1 */       jal omEjectGObj
  /* 17A730 80133CD0 8C844314 */        lw $a0, %lo(sGMContinueOptionGObj)($a0)
  /* 17A734 80133CD4 3C048013 */       lui $a0, %hi(sGMContinueCursorGObj)
  /* 17A738 80133CD8 0C0026A1 */       jal omEjectGObj
  /* 17A73C 80133CDC 8C844310 */        lw $a0, %lo(sGMContinueCursorGObj)($a0)
  /* 17A740 80133CE0 0C04C8B7 */       jal gmContinueMakeRoomFadeOut
  /* 17A744 80133CE4 00000000 */       nop 
  /* 17A748 80133CE8 0C04CC1F */       jal gmContinueMakeGameOverSObjs
  /* 17A74C 80133CEC 00000000 */       nop 
  /* 17A750 80133CF0 0C04CCDA */       jal gmContinueMakeGameOver
  /* 17A754 80133CF4 00000000 */       nop 
  /* 17A758 80133CF8 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A75C 80133CFC 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  /* 17A760 80133D00 240F0002 */     addiu $t7, $zero, 2
  /* 17A764 80133D04 3C018013 */       lui $at, %hi(sGMContinueStatus)
  /* 17A768 80133D08 AC2F433C */        sw $t7, %lo(sGMContinueStatus)($at)
  /* 17A76C 80133D0C 3C018013 */       lui $at, %hi(sGMContinueOptionNoGameOverInputWait)
  /* 17A770 80133D10 2478005A */     addiu $t8, $v1, 0x5a
  /* 17A774 80133D14 AC384358 */        sw $t8, %lo(sGMContinueOptionNoGameOverInputWait)($at)
  /* 17A778 80133D18 3C018013 */       lui $at, %hi(sGMContinueOptionNoGameOverAutoWait)
  /* 17A77C 80133D1C 24790708 */     addiu $t9, $v1, 0x708
  /* 17A780 80133D20 AC394364 */        sw $t9, %lo(sGMContinueOptionNoGameOverAutoWait)($at)
  /* 17A784 80133D24 00002025 */        or $a0, $zero, $zero
  /* 17A788 80133D28 0C0082AD */       jal func_80020AB4
  /* 17A78C 80133D2C 24050020 */     addiu $a1, $zero, 0x20
  /* 17A790 80133D30 0C009A70 */       jal func_800269C0
  /* 17A794 80133D34 240401E7 */     addiu $a0, $zero, 0x1e7
  .L80133D38:
  /* 17A798 80133D38 3C088013 */       lui $t0, %hi(sGMContinueFramesPassed)
  /* 17A79C 80133D3C 8D0842FC */        lw $t0, %lo(sGMContinueFramesPassed)($t0)
  /* 17A7A0 80133D40 29010079 */      slti $at, $t0, 0x79
  /* 17A7A4 80133D44 1420003A */      bnez $at, .L80133E30
  /* 17A7A8 80133D48 00000000 */       nop 
  /* 17A7AC 80133D4C 0C0E41DB */       jal func_ovl1_8039076C
  /* 17A7B0 80133D50 24040222 */     addiu $a0, $zero, 0x222
  /* 17A7B4 80133D54 14400009 */      bnez $v0, .L80133D7C
  /* 17A7B8 80133D58 3C098013 */       lui $t1, %hi(sGMContinueOptionChangeWait)
  /* 17A7BC 80133D5C 8D29436C */        lw $t1, %lo(sGMContinueOptionChangeWait)($t1)
  /* 17A7C0 80133D60 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 17A7C4 80133D64 15200015 */      bnez $t1, .L80133DBC
  /* 17A7C8 80133D68 00000000 */       nop 
  /* 17A7CC 80133D6C 0C0E4227 */       jal func_ovl1_8039089C
  /* 17A7D0 80133D70 00002825 */        or $a1, $zero, $zero
  /* 17A7D4 80133D74 10400011 */      beqz $v0, .L80133DBC
  /* 17A7D8 80133D78 AFA20018 */        sw $v0, 0x18($sp)
  .L80133D7C:
  /* 17A7DC 80133D7C 3C0A8013 */       lui $t2, %hi(sGMContinueOptionSelect)
  /* 17A7E0 80133D80 8D4A4338 */        lw $t2, %lo(sGMContinueOptionSelect)($t2)
  /* 17A7E4 80133D84 24010001 */     addiu $at, $zero, 1
  /* 17A7E8 80133D88 1541000C */       bne $t2, $at, .L80133DBC
  /* 17A7EC 80133D8C 00000000 */       nop 
  /* 17A7F0 80133D90 0C009A70 */       jal func_800269C0
  /* 17A7F4 80133D94 240400A3 */     addiu $a0, $zero, 0xa3
  /* 17A7F8 80133D98 8FAB0018 */        lw $t3, 0x18($sp)
  /* 17A7FC 80133D9C 3C018013 */       lui $at, %hi(sGMContinueOptionSelect)
  /* 17A800 80133DA0 AC204338 */        sw $zero, %lo(sGMContinueOptionSelect)($at)
  /* 17A804 80133DA4 24010005 */     addiu $at, $zero, 5
  /* 17A808 80133DA8 256C00A0 */     addiu $t4, $t3, 0xa0
  /* 17A80C 80133DAC 0181001A */       div $zero, $t4, $at
  /* 17A810 80133DB0 00006812 */      mflo $t5
  /* 17A814 80133DB4 3C018013 */       lui $at, %hi(sGMContinueOptionChangeWait)
  /* 17A818 80133DB8 AC2D436C */        sw $t5, %lo(sGMContinueOptionChangeWait)($at)
  .L80133DBC:
  /* 17A81C 80133DBC 0C0E41DB */       jal func_ovl1_8039076C
  /* 17A820 80133DC0 24040111 */     addiu $a0, $zero, 0x111
  /* 17A824 80133DC4 14400009 */      bnez $v0, .L80133DEC
  /* 17A828 80133DC8 3C0E8013 */       lui $t6, %hi(sGMContinueOptionChangeWait)
  /* 17A82C 80133DCC 8DCE436C */        lw $t6, %lo(sGMContinueOptionChangeWait)($t6)
  /* 17A830 80133DD0 2404000F */     addiu $a0, $zero, 0xf
  /* 17A834 80133DD4 15C00016 */      bnez $t6, .L80133E30
  /* 17A838 80133DD8 00000000 */       nop 
  /* 17A83C 80133DDC 0C0E4227 */       jal func_ovl1_8039089C
  /* 17A840 80133DE0 24050001 */     addiu $a1, $zero, 1
  /* 17A844 80133DE4 10400012 */      beqz $v0, .L80133E30
  /* 17A848 80133DE8 AFA20018 */        sw $v0, 0x18($sp)
  .L80133DEC:
  /* 17A84C 80133DEC 3C0F8013 */       lui $t7, %hi(sGMContinueOptionSelect)
  /* 17A850 80133DF0 8DEF4338 */        lw $t7, %lo(sGMContinueOptionSelect)($t7)
  /* 17A854 80133DF4 15E0000E */      bnez $t7, .L80133E30
  /* 17A858 80133DF8 00000000 */       nop 
  /* 17A85C 80133DFC 0C009A70 */       jal func_800269C0
  /* 17A860 80133E00 240400A3 */     addiu $a0, $zero, 0xa3
  /* 17A864 80133E04 8FB90018 */        lw $t9, 0x18($sp)
  /* 17A868 80133E08 24180001 */     addiu $t8, $zero, 1
  /* 17A86C 80133E0C 3C018013 */       lui $at, %hi(sGMContinueOptionSelect)
  /* 17A870 80133E10 AC384338 */        sw $t8, %lo(sGMContinueOptionSelect)($at)
  /* 17A874 80133E14 240800A0 */     addiu $t0, $zero, 0xa0
  /* 17A878 80133E18 24010005 */     addiu $at, $zero, 5
  /* 17A87C 80133E1C 01194823 */      subu $t1, $t0, $t9
  /* 17A880 80133E20 0121001A */       div $zero, $t1, $at
  /* 17A884 80133E24 00005012 */      mflo $t2
  /* 17A888 80133E28 3C018013 */       lui $at, %hi(sGMContinueOptionChangeWait)
  /* 17A88C 80133E2C AC2A436C */        sw $t2, %lo(sGMContinueOptionChangeWait)($at)
  .L80133E30:
  /* 17A890 80133E30 3C0B8013 */       lui $t3, %hi(sGMContinueStatus)
  /* 17A894 80133E34 8D6B433C */        lw $t3, %lo(sGMContinueStatus)($t3)
  /* 17A898 80133E38 24010002 */     addiu $at, $zero, 2
  /* 17A89C 80133E3C 3C0C8013 */       lui $t4, %hi(sGMContinueOptionNoGameOverInputWait)
  /* 17A8A0 80133E40 15610013 */       bne $t3, $at, .L80133E90
  /* 17A8A4 80133E44 3C0D8013 */       lui $t5, %hi(sGMContinueFramesPassed)
  /* 17A8A8 80133E48 8D8C4358 */        lw $t4, %lo(sGMContinueOptionNoGameOverInputWait)($t4)
  /* 17A8AC 80133E4C 8DAD42FC */        lw $t5, %lo(sGMContinueFramesPassed)($t5)
  /* 17A8B0 80133E50 018D082A */       slt $at, $t4, $t5
  /* 17A8B4 80133E54 1020000E */      beqz $at, .L80133E90
  /* 17A8B8 80133E58 00000000 */       nop 
  /* 17A8BC 80133E5C 0C0E41DB */       jal func_ovl1_8039076C
  /* 17A8C0 80133E60 34049000 */       ori $a0, $zero, 0x9000
  /* 17A8C4 80133E64 1040000A */      beqz $v0, .L80133E90
  /* 17A8C8 80133E68 240F0001 */     addiu $t7, $zero, 1
  /* 17A8CC 80133E6C 3C02800A */       lui $v0, %hi(gSceneData)
  /* 17A8D0 80133E70 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 17A8D4 80133E74 904E0000 */       lbu $t6, ($v0) # gSceneData + 0
  /* 17A8D8 80133E78 A04F0000 */        sb $t7, ($v0) # gSceneData + 0
  /* 17A8DC 80133E7C 0C04CE64 */       jal gmContinueAbsolutelyNothingWhichSmartassLeftThisInHereBruh
  /* 17A8E0 80133E80 A04E0001 */        sb $t6, 1($v0) # gSceneData + 1
  /* 17A8E4 80133E84 3C018013 */       lui $at, %hi(sGMContinueIsSelectContinue)
  /* 17A8E8 80133E88 0C00171D */       jal func_80005C74
  /* 17A8EC 80133E8C AC204360 */        sw $zero, %lo(sGMContinueIsSelectContinue)($at)
  .L80133E90:
  /* 17A8F0 80133E90 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A8F4 80133E94 3C188013 */       lui $t8, %hi(sGMContinueOptionNoGameOverAutoWait)
  /* 17A8F8 80133E98 8F184364 */        lw $t8, %lo(sGMContinueOptionNoGameOverAutoWait)($t8)
  /* 17A8FC 80133E9C 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  /* 17A900 80133EA0 3C02800A */       lui $v0, %hi(gSceneData)
  /* 17A904 80133EA4 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 17A908 80133EA8 1703000A */       bne $t8, $v1, .L80133ED4
  /* 17A90C 80133EAC 24190001 */     addiu $t9, $zero, 1
  /* 17A910 80133EB0 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 17A914 80133EB4 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 17A918 80133EB8 0C04CE64 */       jal gmContinueAbsolutelyNothingWhichSmartassLeftThisInHereBruh
  /* 17A91C 80133EBC A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  /* 17A920 80133EC0 3C018013 */       lui $at, %hi(sGMContinueIsSelectContinue)
  /* 17A924 80133EC4 0C00171D */       jal func_80005C74
  /* 17A928 80133EC8 AC204360 */        sw $zero, %lo(sGMContinueIsSelectContinue)($at)
  /* 17A92C 80133ECC 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A930 80133ED0 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  .L80133ED4:
  /* 17A934 80133ED4 24010028 */     addiu $at, $zero, 0x28
  /* 17A938 80133ED8 54610008 */      bnel $v1, $at, .L80133EFC
  /* 17A93C 80133EDC 2401003C */     addiu $at, $zero, 0x3c
  /* 17A940 80133EE0 0C04C9B5 */       jal gmContinueMakeSpotlightSObjs
  /* 17A944 80133EE4 00000000 */       nop 
  /* 17A948 80133EE8 0C04C97A */       jal gmContinueMakeSpotlightFadeSObjs
  /* 17A94C 80133EEC 00000000 */       nop 
  /* 17A950 80133EF0 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A954 80133EF4 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  /* 17A958 80133EF8 2401003C */     addiu $at, $zero, 0x3c
  .L80133EFC:
  /* 17A95C 80133EFC 5461000C */      bnel $v1, $at, .L80133F30
  /* 17A960 80133F00 24010078 */     addiu $at, $zero, 0x78
  /* 17A964 80133F04 0C04C918 */       jal gmContinueMakeRoomFadeIn
  /* 17A968 80133F08 00000000 */       nop 
  /* 17A96C 80133F0C 0C04C992 */       jal gmContinueMakeRoom
  /* 17A970 80133F10 00000000 */       nop 
  /* 17A974 80133F14 0C04CA09 */       jal gmContinueMakeContinueSObj
  /* 17A978 80133F18 00000000 */       nop 
  /* 17A97C 80133F1C 0C009A70 */       jal func_800269C0
  /* 17A980 80133F20 240401E1 */     addiu $a0, $zero, 0x1e1
  /* 17A984 80133F24 3C038013 */       lui $v1, %hi(sGMContinueFramesPassed)
  /* 17A988 80133F28 8C6342FC */        lw $v1, %lo(sGMContinueFramesPassed)($v1)
  /* 17A98C 80133F2C 24010078 */     addiu $at, $zero, 0x78
  .L80133F30:
  /* 17A990 80133F30 54610006 */      bnel $v1, $at, .L80133F4C
  /* 17A994 80133F34 8FBF0014 */        lw $ra, 0x14($sp)
  /* 17A998 80133F38 0C04CA74 */       jal gmContinueMakeOptionSObjs
  /* 17A99C 80133F3C 00000000 */       nop 
  /* 17A9A0 80133F40 0C04CAD4 */       jal gmContinueMakeCursorSObj
  /* 17A9A4 80133F44 00000000 */       nop 
  .L80133F48:
  /* 17A9A8 80133F48 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133F4C:
  /* 17A9AC 80133F4C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 17A9B0 80133F50 03E00008 */        jr $ra
  /* 17A9B4 80133F54 00000000 */       nop 

glabel gmContinueInitAll
  /* 17A9B8 80133F58 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 17A9BC 80133F5C 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 17A9C0 80133F60 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 17A9C4 80133F64 3C188013 */       lui $t8, %hi(sGMContinueStatusBuf)
  /* 17A9C8 80133F68 3C088013 */       lui $t0, %hi(sGMContinueForceBuf)
  /* 17A9CC 80133F6C AFBF001C */        sw $ra, 0x1c($sp)
  /* 17A9D0 80133F70 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 17A9D4 80133F74 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 17A9D8 80133F78 27184370 */     addiu $t8, $t8, %lo(sGMContinueStatusBuf)
  /* 17A9DC 80133F7C 24190030 */     addiu $t9, $zero, 0x30
  /* 17A9E0 80133F80 250844F0 */     addiu $t0, $t0, %lo(sGMContinueForceBuf)
  /* 17A9E4 80133F84 24090007 */     addiu $t1, $zero, 7
  /* 17A9E8 80133F88 AFAE002C */        sw $t6, 0x2c($sp)
  /* 17A9EC 80133F8C AFAF0030 */        sw $t7, 0x30($sp)
  /* 17A9F0 80133F90 AFA00034 */        sw $zero, 0x34($sp)
  /* 17A9F4 80133F94 AFA00038 */        sw $zero, 0x38($sp)
  /* 17A9F8 80133F98 AFB8003C */        sw $t8, 0x3c($sp)
  /* 17A9FC 80133F9C AFB90040 */        sw $t9, 0x40($sp)
  /* 17AA00 80133FA0 AFA80044 */        sw $t0, 0x44($sp)
  /* 17AA04 80133FA4 AFA90048 */        sw $t1, 0x48($sp)
  /* 17AA08 80133FA8 0C0337DE */       jal rdManagerInitSetup
  /* 17AA0C 80133FAC 27A4002C */     addiu $a0, $sp, 0x2c
  /* 17AA10 80133FB0 3C048013 */       lui $a0, %hi(dGMContinueFileIDs)
  /* 17AA14 80133FB4 24844160 */     addiu $a0, $a0, %lo(dGMContinueFileIDs)
  /* 17AA18 80133FB8 0C0337BB */       jal rdManagerGetAllocSize
  /* 17AA1C 80133FBC 24050005 */     addiu $a1, $zero, 5
  /* 17AA20 80133FC0 00402025 */        or $a0, $v0, $zero
  /* 17AA24 80133FC4 0C001260 */       jal gsMemoryAlloc
  /* 17AA28 80133FC8 24050010 */     addiu $a1, $zero, 0x10
  /* 17AA2C 80133FCC 3C048013 */       lui $a0, %hi(dGMContinueFileIDs)
  /* 17AA30 80133FD0 3C068013 */       lui $a2, %hi(sGMContinueFiles)
  /* 17AA34 80133FD4 24C64528 */     addiu $a2, $a2, %lo(sGMContinueFiles)
  /* 17AA38 80133FD8 24844160 */     addiu $a0, $a0, %lo(dGMContinueFileIDs)
  /* 17AA3C 80133FDC 24050005 */     addiu $a1, $zero, 5
  /* 17AA40 80133FE0 0C033781 */       jal rdManagerLoadFiles
  /* 17AA44 80133FE4 00403825 */        or $a3, $v0, $zero
  /* 17AA48 80133FE8 3C058013 */       lui $a1, %hi(gmContinueActorProcUpdate)
  /* 17AA4C 80133FEC 24A53998 */     addiu $a1, $a1, %lo(gmContinueActorProcUpdate)
  /* 17AA50 80133FF0 00002025 */        or $a0, $zero, $zero
  /* 17AA54 80133FF4 00003025 */        or $a2, $zero, $zero
  /* 17AA58 80133FF8 0C00265A */       jal omMakeGObjSPAfter
  /* 17AA5C 80133FFC 3C078000 */       lui $a3, 0x8000
  /* 17AA60 80134000 240A00FF */     addiu $t2, $zero, 0xff
  /* 17AA64 80134004 AFAA0010 */        sw $t2, 0x10($sp)
  /* 17AA68 80134008 00002025 */        or $a0, $zero, $zero
  /* 17AA6C 8013400C 3C058000 */       lui $a1, 0x8000
  /* 17AA70 80134010 24060064 */     addiu $a2, $zero, 0x64
  /* 17AA74 80134014 0C002E7F */       jal func_8000B9FC
  /* 17AA78 80134018 24070003 */     addiu $a3, $zero, 3
  /* 17AA7C 8013401C 0C045624 */       jal func_ovl2_80115890
  /* 17AA80 80134020 00000000 */       nop 
  /* 17AA84 80134024 0C04CE46 */       jal func_ovl55_80133918
  /* 17AA88 80134028 00000000 */       nop 
  /* 17AA8C 8013402C 0C03F4C0 */       jal efManager_AllocUserData
  /* 17AA90 80134030 00000000 */       nop 
  /* 17AA94 80134034 24040001 */     addiu $a0, $zero, 1
  /* 17AA98 80134038 0C035C65 */       jal ftManagerAllocFighter
  /* 17AA9C 8013403C 24050001 */     addiu $a1, $zero, 1
  /* 17AAA0 80134040 3C048013 */       lui $a0, %hi(sGMContinueFighterDesc)
  /* 17AAA4 80134044 0C035E1B */       jal ftManagerSetupDataKind
  /* 17AAA8 80134048 8C844348 */        lw $a0, %lo(sGMContinueFighterDesc)($a0)
  /* 17AAAC 8013404C 3C048013 */       lui $a0, %hi(gFTAnimHeapSize)
  /* 17AAB0 80134050 8C840D9C */        lw $a0, %lo(gFTAnimHeapSize)($a0)
  /* 17AAB4 80134054 0C001260 */       jal gsMemoryAlloc
  /* 17AAB8 80134058 24050010 */     addiu $a1, $zero, 0x10
  /* 17AABC 8013405C 3C018013 */       lui $at, %hi(sGMContinueFighterAnimHeap)
  /* 17AAC0 80134060 0C04CDA5 */       jal func_ovl55_80133694
  /* 17AAC4 80134064 AC2242F8 */        sw $v0, %lo(sGMContinueFighterAnimHeap)($at)
  /* 17AAC8 80134068 0C04CCF1 */       jal func_ovl55_801333C4
  /* 17AACC 8013406C 00000000 */       nop 
  /* 17AAD0 80134070 0C04CD1D */       jal func_ovl55_80133474
  /* 17AAD4 80134074 00000000 */       nop 
  /* 17AAD8 80134078 0C04CD49 */       jal func_ovl55_80133524
  /* 17AADC 8013407C 00000000 */       nop 
  /* 17AAE0 80134080 0C04CDC6 */       jal func_ovl55_80133718
  /* 17AAE4 80134084 00000000 */       nop 
  /* 17AAE8 80134088 0C04CDEE */       jal func_ovl55_801337B8
  /* 17AAEC 8013408C 00000000 */       nop 
  /* 17AAF0 80134090 0C04CE1A */       jal func_ovl55_80133868
  /* 17AAF4 80134094 00000000 */       nop 
  /* 17AAF8 80134098 3C048013 */       lui $a0, %hi(sGMContinueFighterDesc)
  /* 17AAFC 8013409C 0C04C835 */       jal gmContinueMakeFighter
  /* 17AB00 801340A0 8C844348 */        lw $a0, %lo(sGMContinueFighterDesc)($a0)
  /* 17AB04 801340A4 3C04800A */       lui $a0, %hi((gSceneData + 0x20))
  /* 17AB08 801340A8 0C04C7E6 */       jal gmContinueMakeScoreDisplay
  /* 17AB0C 801340AC 8C844AF0 */        lw $a0, %lo((gSceneData + 0x20))($a0)
  /* 17AB10 801340B0 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 17AB14 801340B4 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 17AB18 801340B8 240B00FF */     addiu $t3, $zero, 0xff
  /* 17AB1C 801340BC 240C00FF */     addiu $t4, $zero, 0xff
  /* 17AB20 801340C0 AFAC0014 */        sw $t4, 0x14($sp)
  /* 17AB24 801340C4 AFAB0010 */        sw $t3, 0x10($sp)
  /* 17AB28 801340C8 240600FF */     addiu $a2, $zero, 0xff
  /* 17AB2C 801340CC 240700FF */     addiu $a3, $zero, 0xff
  /* 17AB30 801340D0 0C0E4138 */       jal func_ovl1_803904E0
  /* 17AB34 801340D4 46006386 */     mov.s $f14, $f12
  /* 17AB38 801340D8 0C00829D */       jal func_80020A74
  /* 17AB3C 801340DC 00000000 */       nop 
  /* 17AB40 801340E0 00002025 */        or $a0, $zero, $zero
  /* 17AB44 801340E4 0C0082AD */       jal func_80020AB4
  /* 17AB48 801340E8 2405001F */     addiu $a1, $zero, 0x1f
  /* 17AB4C 801340EC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 17AB50 801340F0 27BD0050 */     addiu $sp, $sp, 0x50
  /* 17AB54 801340F4 03E00008 */        jr $ra
  /* 17AB58 801340F8 00000000 */       nop 

glabel gmContinueStartScene
  /* 17AB5C 801340FC 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 17AB60 80134100 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 17AB64 80134104 3C048013 */       lui $a0, %hi(D_ovl55_80134238)
  /* 17AB68 80134108 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 17AB6C 8013410C 24844238 */     addiu $a0, $a0, %lo(D_ovl55_80134238)
  /* 17AB70 80134110 AFBF0014 */        sw $ra, 0x14($sp)
  /* 17AB74 80134114 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 17AB78 80134118 0C001C09 */       jal func_80007024
  /* 17AB7C 8013411C AC8F000C */        sw $t7, 0xc($a0) # D_ovl55_80134238 + 12
  /* 17AB80 80134120 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 17AB84 80134124 3C198013 */       lui $t9, %hi(D_NF_80134540)
  /* 17AB88 80134128 3C048013 */       lui $a0, %hi(D_ovl55_80134254)
  /* 17AB8C 8013412C 27394540 */     addiu $t9, $t9, %lo(D_NF_80134540)
  /* 17AB90 80134130 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 17AB94 80134134 24844254 */     addiu $a0, $a0, %lo(D_ovl55_80134254)
  /* 17AB98 80134138 03194023 */      subu $t0, $t8, $t9
  /* 17AB9C 8013413C 0C0289A6 */       jal func_800A2698
  /* 17ABA0 80134140 AC880010 */        sw $t0, 0x10($a0) # D_ovl55_80134254 + 16
  /* 17ABA4 80134144 8FBF0014 */        lw $ra, 0x14($sp)
  /* 17ABA8 80134148 3C098013 */       lui $t1, %hi(sGMContinueIsSelectContinue)
  /* 17ABAC 8013414C 8D294360 */        lw $t1, %lo(sGMContinueIsSelectContinue)($t1)
  /* 17ABB0 80134150 3C01800A */       lui $at, %hi((gSceneData + 0x11))
  /* 17ABB4 80134154 27BD0018 */     addiu $sp, $sp, 0x18
  /* 17ABB8 80134158 03E00008 */        jr $ra
  /* 17ABBC 8013415C A0294AE1 */        sb $t1, %lo((gSceneData + 0x11))($at)
#
#glabel dGMContinueFileIDs   # Routine parsed as data
#  /* 17ABC0 80134160 0000004F */      sync 1
