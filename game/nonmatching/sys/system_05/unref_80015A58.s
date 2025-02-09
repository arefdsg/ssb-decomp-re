.section .text
glabel unref_80015A58
  /* 016658 80015A58 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 01665C 80015A5C AFBF001C */        sw $ra, 0x1c($sp)
  /* 016660 80015A60 AFB00018 */        sw $s0, 0x18($sp)
  /* 016664 80015A64 8C860074 */        lw $a2, 0x74($a0)
  /* 016668 80015A68 90CE0054 */       lbu $t6, 0x54($a2)
  /* 01666C 80015A6C 31CF0002 */      andi $t7, $t6, 2
  /* 016670 80015A70 55E00062 */      bnel $t7, $zero, .L80015BFC
  /* 016674 80015A74 8FBF001C */        lw $ra, 0x1c($sp)
  /* 016678 80015A78 8CC30050 */        lw $v1, 0x50($a2)
  /* 01667C 80015A7C 3C108004 */       lui $s0, %hi(D_800472A8)
  /* 016680 80015A80 261072A8 */     addiu $s0, $s0, %lo(D_800472A8)
  /* 016684 80015A84 1060005C */      beqz $v1, .L80015BF8
  /* 016688 80015A88 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 01668C 80015A8C 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 016690 80015A90 3C018004 */       lui $at, %hi(gSpriteLayerScale)
  /* 016694 80015A94 00C02025 */        or $a0, $a2, $zero
  /* 016698 80015A98 E4246FA4 */      swc1 $f4, %lo(gSpriteLayerScale)($at)
  /* 01669C 80015A9C AE000000 */        sw $zero, ($s0) # D_800472A8 + 0
  /* 0166A0 80015AA0 AFA3002C */        sw $v1, 0x2c($sp)
  /* 0166A4 80015AA4 0C0051E6 */       jal odGetDObjDistFromEye
  /* 0166A8 80015AA8 AFA60020 */        sw $a2, 0x20($sp)
  /* 0166AC 80015AAC 8FA3002C */        lw $v1, 0x2c($sp)
  /* 0166B0 80015AB0 8FA60020 */        lw $a2, 0x20($sp)
  /* 0166B4 80015AB4 46000086 */     mov.s $f2, $f0
  /* 0166B8 80015AB8 C4660000 */      lwc1 $f6, ($v1)
  /* 0166BC 80015ABC 00C02825 */        or $a1, $a2, $zero
  /* 0166C0 80015AC0 4606003C */    c.lt.s $f0, $f6
  /* 0166C4 80015AC4 00000000 */       nop 
  /* 0166C8 80015AC8 4500000A */      bc1f .L80015AF4
  /* 0166CC 80015ACC 00000000 */       nop 
  /* 0166D0 80015AD0 8E180000 */        lw $t8, ($s0) # D_800472A8 + 0
  .L80015AD4:
  /* 0166D4 80015AD4 24630008 */     addiu $v1, $v1, 8
  /* 0166D8 80015AD8 27190001 */     addiu $t9, $t8, 1
  /* 0166DC 80015ADC AE190000 */        sw $t9, ($s0) # D_800472A8 + 0
  /* 0166E0 80015AE0 C4680000 */      lwc1 $f8, ($v1)
  /* 0166E4 80015AE4 4608103C */    c.lt.s $f2, $f8
  /* 0166E8 80015AE8 00000000 */       nop 
  /* 0166EC 80015AEC 4503FFF9 */     bc1tl .L80015AD4
  /* 0166F0 80015AF0 8E180000 */        lw $t8, ($s0) # D_800472A8 + 0
  .L80015AF4:
  /* 0166F4 80015AF4 3C108004 */       lui $s0, %hi(gDisplayListHead)
  /* 0166F8 80015AF8 261065B0 */     addiu $s0, $s0, %lo(gDisplayListHead)
  /* 0166FC 80015AFC 02002025 */        or $a0, $s0, $zero
  /* 016700 80015B00 AFA3002C */        sw $v1, 0x2c($sp)
  /* 016704 80015B04 0C00435C */       jal odRenderDObjMain
  /* 016708 80015B08 AFA60020 */        sw $a2, 0x20($sp)
  /* 01670C 80015B0C 8FA3002C */        lw $v1, 0x2c($sp)
  /* 016710 80015B10 AFA20028 */        sw $v0, 0x28($sp)
  /* 016714 80015B14 8FA60020 */        lw $a2, 0x20($sp)
  /* 016718 80015B18 8C680004 */        lw $t0, 4($v1)
  /* 01671C 80015B1C 51000014 */      beql $t0, $zero, .L80015B70
  /* 016720 80015B20 8CC40010 */        lw $a0, 0x10($a2)
  /* 016724 80015B24 90C90054 */       lbu $t1, 0x54($a2)
  /* 016728 80015B28 00C02025 */        or $a0, $a2, $zero
  /* 01672C 80015B2C 02002825 */        or $a1, $s0, $zero
  /* 016730 80015B30 312A0001 */      andi $t2, $t1, 1
  /* 016734 80015B34 5540000E */      bnel $t2, $zero, .L80015B70
  /* 016738 80015B38 8CC40010 */        lw $a0, 0x10($a2)
  /* 01673C 80015B3C AFA3002C */        sw $v1, 0x2c($sp)
  /* 016740 80015B40 0C004B64 */       jal odRenderMObjForDObj
  /* 016744 80015B44 AFA60020 */        sw $a2, 0x20($sp)
  /* 016748 80015B48 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  /* 01674C 80015B4C 8FA3002C */        lw $v1, 0x2c($sp)
  /* 016750 80015B50 8FA60020 */        lw $a2, 0x20($sp)
  /* 016754 80015B54 248B0008 */     addiu $t3, $a0, 8
  /* 016758 80015B58 AE0B0000 */        sw $t3, ($s0) # gDisplayListHead + 0
  /* 01675C 80015B5C 3C0CDE00 */       lui $t4, 0xde00
  /* 016760 80015B60 AC8C0000 */        sw $t4, ($a0)
  /* 016764 80015B64 8C6D0004 */        lw $t5, 4($v1)
  /* 016768 80015B68 AC8D0004 */        sw $t5, 4($a0)
  /* 01676C 80015B6C 8CC40010 */        lw $a0, 0x10($a2)
  .L80015B70:
  /* 016770 80015B70 50800005 */      beql $a0, $zero, .L80015B88
  /* 016774 80015B74 8FAE0028 */        lw $t6, 0x28($sp)
  /* 016778 80015B78 0C005624 */       jal odRenderDObjTreeDLDoubleArray
  /* 01677C 80015B7C AFA60020 */        sw $a2, 0x20($sp)
  /* 016780 80015B80 8FA60020 */        lw $a2, 0x20($sp)
  /* 016784 80015B84 8FAE0028 */        lw $t6, 0x28($sp)
  .L80015B88:
  /* 016788 80015B88 51C00011 */      beql $t6, $zero, .L80015BD0
  /* 01678C 80015B8C 8CCA000C */        lw $t2, 0xc($a2)
  /* 016790 80015B90 8CCF0014 */        lw $t7, 0x14($a2)
  /* 016794 80015B94 24010001 */     addiu $at, $zero, 1
  /* 016798 80015B98 3C08D838 */       lui $t0, (0xD8380002 >> 16) # 3627548674
  /* 01679C 80015B9C 51E10005 */      beql $t7, $at, .L80015BB4
  /* 0167A0 80015BA0 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  /* 0167A4 80015BA4 8CD80008 */        lw $t8, 8($a2)
  /* 0167A8 80015BA8 53000009 */      beql $t8, $zero, .L80015BD0
  /* 0167AC 80015BAC 8CCA000C */        lw $t2, 0xc($a2)
  /* 0167B0 80015BB0 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  .L80015BB4:
  /* 0167B4 80015BB4 35080002 */       ori $t0, $t0, (0xD8380002 & 0xFFFF) # 3627548674
  /* 0167B8 80015BB8 24090040 */     addiu $t1, $zero, 0x40
  /* 0167BC 80015BBC 24990008 */     addiu $t9, $a0, 8
  /* 0167C0 80015BC0 AE190000 */        sw $t9, ($s0) # gDisplayListHead + 0
  /* 0167C4 80015BC4 AC890004 */        sw $t1, 4($a0)
  /* 0167C8 80015BC8 AC880000 */        sw $t0, ($a0)
  /* 0167CC 80015BCC 8CCA000C */        lw $t2, 0xc($a2)
  .L80015BD0:
  /* 0167D0 80015BD0 5540000A */      bnel $t2, $zero, .L80015BFC
  /* 0167D4 80015BD4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 0167D8 80015BD8 8CD00008 */        lw $s0, 8($a2)
  /* 0167DC 80015BDC 52000007 */      beql $s0, $zero, .L80015BFC
  /* 0167E0 80015BE0 8FBF001C */        lw $ra, 0x1c($sp)
  .L80015BE4:
  /* 0167E4 80015BE4 0C005624 */       jal odRenderDObjTreeDLDoubleArray
  /* 0167E8 80015BE8 02002025 */        or $a0, $s0, $zero
  /* 0167EC 80015BEC 8E100008 */        lw $s0, 8($s0)
  /* 0167F0 80015BF0 1600FFFC */      bnez $s0, .L80015BE4
  /* 0167F4 80015BF4 00000000 */       nop 
  .L80015BF8:
  /* 0167F8 80015BF8 8FBF001C */        lw $ra, 0x1c($sp)
  .L80015BFC:
  /* 0167FC 80015BFC 8FB00018 */        lw $s0, 0x18($sp)
  /* 016800 80015C00 27BD0030 */     addiu $sp, $sp, 0x30
  /* 016804 80015C04 03E00008 */        jr $ra
  /* 016808 80015C08 00000000 */       nop 

