.section .text
glabel unref_80014A84
  /* 015684 80014A84 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 015688 80014A88 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 01568C 80014A8C 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 015690 80014A90 AFBF001C */        sw $ra, 0x1c($sp)
  /* 015694 80014A94 AFB00018 */        sw $s0, 0x18($sp)
  /* 015698 80014A98 8C860074 */        lw $a2, 0x74($a0)
  /* 01569C 80014A9C 3C018004 */       lui $at, %hi(gSpriteLayerScale)
  /* 0156A0 80014AA0 E4246FA4 */      swc1 $f4, %lo(gSpriteLayerScale)($at)
  /* 0156A4 80014AA4 90CE0054 */       lbu $t6, 0x54($a2)
  /* 0156A8 80014AA8 31CF0002 */      andi $t7, $t6, 2
  /* 0156AC 80014AAC 55E0005E */      bnel $t7, $zero, .L80014C28
  /* 0156B0 80014AB0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 0156B4 80014AB4 8CC30050 */        lw $v1, 0x50($a2)
  /* 0156B8 80014AB8 3C108004 */       lui $s0, %hi(D_800472A8)
  /* 0156BC 80014ABC 261072A8 */     addiu $s0, $s0, %lo(D_800472A8)
  /* 0156C0 80014AC0 10600058 */      beqz $v1, .L80014C24
  /* 0156C4 80014AC4 00C02025 */        or $a0, $a2, $zero
  /* 0156C8 80014AC8 AE000000 */        sw $zero, ($s0) # D_800472A8 + 0
  /* 0156CC 80014ACC AFA3002C */        sw $v1, 0x2c($sp)
  /* 0156D0 80014AD0 0C0051E6 */       jal odGetDObjDistFromEye
  /* 0156D4 80014AD4 AFA60020 */        sw $a2, 0x20($sp)
  /* 0156D8 80014AD8 8FA3002C */        lw $v1, 0x2c($sp)
  /* 0156DC 80014ADC 8FA60020 */        lw $a2, 0x20($sp)
  /* 0156E0 80014AE0 46000086 */     mov.s $f2, $f0
  /* 0156E4 80014AE4 C4660000 */      lwc1 $f6, ($v1)
  /* 0156E8 80014AE8 00C02825 */        or $a1, $a2, $zero
  /* 0156EC 80014AEC 4606003C */    c.lt.s $f0, $f6
  /* 0156F0 80014AF0 00000000 */       nop 
  /* 0156F4 80014AF4 4500000A */      bc1f .L80014B20
  /* 0156F8 80014AF8 00000000 */       nop 
  /* 0156FC 80014AFC 8E180000 */        lw $t8, ($s0) # D_800472A8 + 0
  .L80014B00:
  /* 015700 80014B00 24630008 */     addiu $v1, $v1, 8
  /* 015704 80014B04 27190001 */     addiu $t9, $t8, 1
  /* 015708 80014B08 AE190000 */        sw $t9, ($s0) # D_800472A8 + 0
  /* 01570C 80014B0C C4680000 */      lwc1 $f8, ($v1)
  /* 015710 80014B10 4608103C */    c.lt.s $f2, $f8
  /* 015714 80014B14 00000000 */       nop 
  /* 015718 80014B18 4503FFF9 */     bc1tl .L80014B00
  /* 01571C 80014B1C 8E180000 */        lw $t8, ($s0) # D_800472A8 + 0
  .L80014B20:
  /* 015720 80014B20 3C108004 */       lui $s0, %hi(gDisplayListHead)
  /* 015724 80014B24 261065B0 */     addiu $s0, $s0, %lo(gDisplayListHead)
  /* 015728 80014B28 02002025 */        or $a0, $s0, $zero
  /* 01572C 80014B2C AFA3002C */        sw $v1, 0x2c($sp)
  /* 015730 80014B30 0C00435C */       jal odRenderDObjMain
  /* 015734 80014B34 AFA60020 */        sw $a2, 0x20($sp)
  /* 015738 80014B38 8FA3002C */        lw $v1, 0x2c($sp)
  /* 01573C 80014B3C AFA20028 */        sw $v0, 0x28($sp)
  /* 015740 80014B40 8FA60020 */        lw $a2, 0x20($sp)
  /* 015744 80014B44 8C680004 */        lw $t0, 4($v1)
  /* 015748 80014B48 51000014 */      beql $t0, $zero, .L80014B9C
  /* 01574C 80014B4C 8CC40010 */        lw $a0, 0x10($a2)
  /* 015750 80014B50 90C90054 */       lbu $t1, 0x54($a2)
  /* 015754 80014B54 00C02025 */        or $a0, $a2, $zero
  /* 015758 80014B58 02002825 */        or $a1, $s0, $zero
  /* 01575C 80014B5C 312A0001 */      andi $t2, $t1, 1
  /* 015760 80014B60 5540000E */      bnel $t2, $zero, .L80014B9C
  /* 015764 80014B64 8CC40010 */        lw $a0, 0x10($a2)
  /* 015768 80014B68 AFA3002C */        sw $v1, 0x2c($sp)
  /* 01576C 80014B6C 0C004B64 */       jal odRenderMObjForDObj
  /* 015770 80014B70 AFA60020 */        sw $a2, 0x20($sp)
  /* 015774 80014B74 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  /* 015778 80014B78 8FA3002C */        lw $v1, 0x2c($sp)
  /* 01577C 80014B7C 8FA60020 */        lw $a2, 0x20($sp)
  /* 015780 80014B80 248B0008 */     addiu $t3, $a0, 8
  /* 015784 80014B84 AE0B0000 */        sw $t3, ($s0) # gDisplayListHead + 0
  /* 015788 80014B88 3C0CDE00 */       lui $t4, 0xde00
  /* 01578C 80014B8C AC8C0000 */        sw $t4, ($a0)
  /* 015790 80014B90 8C6D0004 */        lw $t5, 4($v1)
  /* 015794 80014B94 AC8D0004 */        sw $t5, 4($a0)
  /* 015798 80014B98 8CC40010 */        lw $a0, 0x10($a2)
  .L80014B9C:
  /* 01579C 80014B9C 50800005 */      beql $a0, $zero, .L80014BB4
  /* 0157A0 80014BA0 8FAE0028 */        lw $t6, 0x28($sp)
  /* 0157A4 80014BA4 0C005243 */       jal odRenderDObjTreeMultiList
  /* 0157A8 80014BA8 AFA60020 */        sw $a2, 0x20($sp)
  /* 0157AC 80014BAC 8FA60020 */        lw $a2, 0x20($sp)
  /* 0157B0 80014BB0 8FAE0028 */        lw $t6, 0x28($sp)
  .L80014BB4:
  /* 0157B4 80014BB4 51C00011 */      beql $t6, $zero, .L80014BFC
  /* 0157B8 80014BB8 8CCA000C */        lw $t2, 0xc($a2)
  /* 0157BC 80014BBC 8CCF0014 */        lw $t7, 0x14($a2)
  /* 0157C0 80014BC0 24010001 */     addiu $at, $zero, 1
  /* 0157C4 80014BC4 3C08D838 */       lui $t0, (0xD8380002 >> 16) # 3627548674
  /* 0157C8 80014BC8 51E10005 */      beql $t7, $at, .L80014BE0
  /* 0157CC 80014BCC 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  /* 0157D0 80014BD0 8CD80008 */        lw $t8, 8($a2)
  /* 0157D4 80014BD4 53000009 */      beql $t8, $zero, .L80014BFC
  /* 0157D8 80014BD8 8CCA000C */        lw $t2, 0xc($a2)
  /* 0157DC 80014BDC 8E040000 */        lw $a0, ($s0) # gDisplayListHead + 0
  .L80014BE0:
  /* 0157E0 80014BE0 35080002 */       ori $t0, $t0, (0xD8380002 & 0xFFFF) # 3627548674
  /* 0157E4 80014BE4 24090040 */     addiu $t1, $zero, 0x40
  /* 0157E8 80014BE8 24990008 */     addiu $t9, $a0, 8
  /* 0157EC 80014BEC AE190000 */        sw $t9, ($s0) # gDisplayListHead + 0
  /* 0157F0 80014BF0 AC890004 */        sw $t1, 4($a0)
  /* 0157F4 80014BF4 AC880000 */        sw $t0, ($a0)
  /* 0157F8 80014BF8 8CCA000C */        lw $t2, 0xc($a2)
  .L80014BFC:
  /* 0157FC 80014BFC 5540000A */      bnel $t2, $zero, .L80014C28
  /* 015800 80014C00 8FBF001C */        lw $ra, 0x1c($sp)
  /* 015804 80014C04 8CD00008 */        lw $s0, 8($a2)
  /* 015808 80014C08 52000007 */      beql $s0, $zero, .L80014C28
  /* 01580C 80014C0C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80014C10:
  /* 015810 80014C10 0C005243 */       jal odRenderDObjTreeMultiList
  /* 015814 80014C14 02002025 */        or $a0, $s0, $zero
  /* 015818 80014C18 8E100008 */        lw $s0, 8($s0)
  /* 01581C 80014C1C 1600FFFC */      bnez $s0, .L80014C10
  /* 015820 80014C20 00000000 */       nop 
  .L80014C24:
  /* 015824 80014C24 8FBF001C */        lw $ra, 0x1c($sp)
  .L80014C28:
  /* 015828 80014C28 8FB00018 */        lw $s0, 0x18($sp)
  /* 01582C 80014C2C 27BD0030 */     addiu $sp, $sp, 0x30
  /* 015830 80014C30 03E00008 */        jr $ra
  /* 015834 80014C34 00000000 */       nop 

