.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x80137F60

glabel mnTrainingSetupDisplayList
  /* 1410E0 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1410E4 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1410E8 80131B08 8C830000 */        lw $v1, ($a0)
  /* 1410EC 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 1410F0 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 1410F4 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 1410F8 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 1410FC 80131B1C 3C180002 */       lui $t8, 2
  /* 141100 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 141104 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 141108 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 14110C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 141110 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 141114 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 141118 80131B38 44060000 */      mfc1 $a2, $f0
  /* 14111C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 141120 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 141124 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 141128 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14112C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 141130 80131B50 03E00008 */        jr $ra
  /* 141134 80131B54 00000000 */       nop

glabel mnTrainingSelectCharWithToken
  /* 141138 80131B58 240300B8 */     addiu $v1, $zero, 0xb8
  /* 14113C 80131B5C 00830019 */     multu $a0, $v1
  /* 141140 80131B60 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 141144 80131B64 3C028014 */       lui $v0, %hi(gMNTrainingPanels)
  /* 141148 80131B68 24428558 */     addiu $v0, $v0, %lo(gMNTrainingPanels)
  /* 14114C 80131B6C AFB20020 */        sw $s2, 0x20($sp)
  /* 141150 80131B70 AFB1001C */        sw $s1, 0x1c($sp)
  /* 141154 80131B74 24010004 */     addiu $at, $zero, 4
  /* 141158 80131B78 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14115C 80131B7C AFB00018 */        sw $s0, 0x18($sp)
  /* 141160 80131B80 AFA40030 */        sw $a0, 0x30($sp)
  /* 141164 80131B84 00007812 */      mflo $t7
  /* 141168 80131B88 004F9021 */      addu $s2, $v0, $t7
  /* 14116C 80131B8C 10A10019 */       beq $a1, $at, .L80131BF4
  /* 141170 80131B90 8E51007C */        lw $s1, 0x7c($s2)
  /* 141174 80131B94 02230019 */     multu $s1, $v1
  /* 141178 80131B98 0000C012 */      mflo $t8
  /* 14117C 80131B9C 00588021 */      addu $s0, $v0, $t8
  /* 141180 80131BA0 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 141184 80131BA4 8E040048 */        lw $a0, 0x48($s0)
  /* 141188 80131BA8 AFA20028 */        sw $v0, 0x28($sp)
  /* 14118C 80131BAC 8E040048 */        lw $a0, 0x48($s0)
  /* 141190 80131BB0 02202825 */        or $a1, $s1, $zero
  /* 141194 80131BB4 0C04CCD4 */       jal mnTrainingIsCostumeInUse
  /* 141198 80131BB8 00403025 */        or $a2, $v0, $zero
  /* 14119C 80131BBC 10400005 */      beqz $v0, .L80131BD4
  /* 1411A0 80131BC0 8FA50028 */        lw $a1, 0x28($sp)
  /* 1411A4 80131BC4 0C009A70 */       jal func_800269C0
  /* 1411A8 80131BC8 240400A5 */     addiu $a0, $zero, 0xa5
  /* 1411AC 80131BCC 10000023 */         b .L80131C5C
  /* 1411B0 80131BD0 8FBF0024 */        lw $ra, 0x24($sp)
  .L80131BD4:
  /* 1411B4 80131BD4 8E040008 */        lw $a0, 8($s0)
  /* 1411B8 80131BD8 0C03A492 */       jal func_ovl2_800E9248
  /* 1411BC 80131BDC 00003025 */        or $a2, $zero, $zero
  /* 1411C0 80131BE0 8FB90028 */        lw $t9, 0x28($sp)
  /* 1411C4 80131BE4 3C028014 */       lui $v0, %hi(gMNTrainingPanels)
  /* 1411C8 80131BE8 24428558 */     addiu $v0, $v0, %lo(gMNTrainingPanels)
  /* 1411CC 80131BEC 240300B8 */     addiu $v1, $zero, 0xb8
  /* 1411D0 80131BF0 AE19004C */        sw $t9, 0x4c($s0)
  .L80131BF4:
  /* 1411D4 80131BF4 02230019 */     multu $s1, $v1
  /* 1411D8 80131BF8 24090001 */     addiu $t1, $zero, 1
  /* 1411DC 80131BFC 8FA40030 */        lw $a0, 0x30($sp)
  /* 1411E0 80131C00 02202825 */        or $a1, $s1, $zero
  /* 1411E4 80131C04 00004012 */      mflo $t0
  /* 1411E8 80131C08 00488021 */      addu $s0, $v0, $t0
  /* 1411EC 80131C0C 0C04D293 */       jal mnTrainingReorderCursorsOnPlacement
  /* 1411F0 80131C10 AE090054 */        sw $t1, 0x54($s0)
  /* 1411F4 80131C14 240A0004 */     addiu $t2, $zero, 4
  /* 1411F8 80131C18 AE0A0078 */        sw $t2, 0x78($s0)
  /* 1411FC 80131C1C 240B0002 */     addiu $t3, $zero, 2
  /* 141200 80131C20 AE4B0050 */        sw $t3, 0x50($s2)
  /* 141204 80131C24 8E440000 */        lw $a0, ($s2)
  /* 141208 80131C28 8FA50030 */        lw $a1, 0x30($sp)
  /* 14120C 80131C2C 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 141210 80131C30 24060002 */     addiu $a2, $zero, 2
  /* 141214 80131C34 240CFFFF */     addiu $t4, $zero, -1
  /* 141218 80131C38 AE4C007C */        sw $t4, 0x7c($s2)
  /* 14121C 80131C3C 240D0001 */     addiu $t5, $zero, 1
  /* 141220 80131C40 AE0D0084 */        sw $t5, 0x84($s0)
  /* 141224 80131C44 8FA40030 */        lw $a0, 0x30($sp)
  /* 141228 80131C48 0C04D06C */       jal mnTrainingAnnounceFighter
  /* 14122C 80131C4C 02202825 */        or $a1, $s1, $zero
  /* 141230 80131C50 0C04D017 */       jal mnTrainingCreateWhiteSquare
  /* 141234 80131C54 02202025 */        or $a0, $s1, $zero
  /* 141238 80131C58 8FBF0024 */        lw $ra, 0x24($sp)
  .L80131C5C:
  /* 14123C 80131C5C 8FB00018 */        lw $s0, 0x18($sp)
  /* 141240 80131C60 8FB1001C */        lw $s1, 0x1c($sp)
  /* 141244 80131C64 8FB20020 */        lw $s2, 0x20($sp)
  /* 141248 80131C68 03E00008 */        jr $ra
  /* 14124C 80131C6C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnTrainingGetNextPortraitX
  /* 141250 80131C70 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 141254 80131C74 3C0E8013 */       lui $t6, %hi(dMNTrainingPortraitPositionsX)
  /* 141258 80131C78 27A30040 */     addiu $v1, $sp, 0x40
  /* 14125C 80131C7C 44856000 */      mtc1 $a1, $f12
  /* 141260 80131C80 25CE7FB0 */     addiu $t6, $t6, %lo(dMNTrainingPortraitPositionsX)
  /* 141264 80131C84 27A50010 */     addiu $a1, $sp, 0x10
  /* 141268 80131C88 25C80030 */     addiu $t0, $t6, 0x30
  /* 14126C 80131C8C 0060C825 */        or $t9, $v1, $zero
  .L80131C90:
  /* 141270 80131C90 8DD80000 */        lw $t8, ($t6) # dMNTrainingPortraitPositionsX + 0
  /* 141274 80131C94 25CE000C */     addiu $t6, $t6, 0xc
  /* 141278 80131C98 2739000C */     addiu $t9, $t9, 0xc
  /* 14127C 80131C9C AF38FFF4 */        sw $t8, -0xc($t9)
  /* 141280 80131CA0 8DCFFFF8 */        lw $t7, -8($t6) # dMNTrainingPortraitPositionsX + -8
  /* 141284 80131CA4 AF2FFFF8 */        sw $t7, -8($t9)
  /* 141288 80131CA8 8DD8FFFC */        lw $t8, -4($t6) # dMNTrainingPortraitPositionsX + -4
  /* 14128C 80131CAC 15C8FFF8 */       bne $t6, $t0, .L80131C90
  /* 141290 80131CB0 AF38FFFC */        sw $t8, -4($t9)
  /* 141294 80131CB4 3C098013 */       lui $t1, %hi(dMNTrainindMNTrainingPortraitVelocities)
  /* 141298 80131CB8 25297FE0 */     addiu $t1, $t1, %lo(dMNTrainindMNTrainingPortraitVelocities)
  /* 14129C 80131CBC 252D0030 */     addiu $t5, $t1, 0x30
  /* 1412A0 80131CC0 00A06025 */        or $t4, $a1, $zero
  .L80131CC4:
  /* 1412A4 80131CC4 8D2B0000 */        lw $t3, ($t1) # dMNTrainindMNTrainingPortraitVelocities + 0
  /* 1412A8 80131CC8 2529000C */     addiu $t1, $t1, 0xc
  /* 1412AC 80131CCC 258C000C */     addiu $t4, $t4, 0xc
  /* 1412B0 80131CD0 AD8BFFF4 */        sw $t3, -0xc($t4)
  /* 1412B4 80131CD4 8D2AFFF8 */        lw $t2, -8($t1) # dMNTrainindMNTrainingPortraitVelocities + -8
  /* 1412B8 80131CD8 AD8AFFF8 */        sw $t2, -8($t4)
  /* 1412BC 80131CDC 8D2BFFFC */        lw $t3, -4($t1) # dMNTrainindMNTrainingPortraitVelocities + -4
  /* 1412C0 80131CE0 152DFFF8 */       bne $t1, $t5, .L80131CC4
  /* 1412C4 80131CE4 AD8BFFFC */        sw $t3, -4($t4)
  /* 1412C8 80131CE8 00041080 */       sll $v0, $a0, 2
  /* 1412CC 80131CEC 00624021 */      addu $t0, $v1, $v0
  /* 1412D0 80131CF0 C5000000 */      lwc1 $f0, ($t0)
  /* 1412D4 80131CF4 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1412D8 80131CF8 46006032 */    c.eq.s $f12, $f0
  /* 1412DC 80131CFC 00000000 */       nop
  /* 1412E0 80131D00 45020005 */     bc1fl .L80131D18
  /* 1412E4 80131D04 460C003C */    c.lt.s $f0, $f12
  /* 1412E8 80131D08 44810000 */      mtc1 $at, $f0 # -1.0 to cop1
  /* 1412EC 80131D0C 1000001B */         b .L80131D7C
  /* 1412F0 80131D10 00000000 */       nop
  /* 1412F4 80131D14 460C003C */    c.lt.s $f0, $f12
  .L80131D18:
  /* 1412F8 80131D18 00A27021 */      addu $t6, $a1, $v0
  /* 1412FC 80131D1C 00A2C821 */      addu $t9, $a1, $v0
  /* 141300 80131D20 4502000D */     bc1fl .L80131D58
  /* 141304 80131D24 C7260000 */      lwc1 $f6, ($t9)
  /* 141308 80131D28 C5C40000 */      lwc1 $f4, ($t6) # dMNTrainingPortraitPositionsX + 0
  /* 14130C 80131D2C 46046080 */     add.s $f2, $f12, $f4
  /* 141310 80131D30 4600103E */    c.le.s $f2, $f0
  /* 141314 80131D34 00000000 */       nop
  /* 141318 80131D38 45020004 */     bc1fl .L80131D4C
  /* 14131C 80131D3C 46001306 */     mov.s $f12, $f2
  /* 141320 80131D40 1000000E */         b .L80131D7C
  /* 141324 80131D44 00000000 */       nop
  /* 141328 80131D48 46001306 */     mov.s $f12, $f2
  .L80131D4C:
  /* 14132C 80131D4C 1000000B */         b .L80131D7C
  /* 141330 80131D50 46006006 */     mov.s $f0, $f12
  /* 141334 80131D54 C7260000 */      lwc1 $f6, ($t9)
  .L80131D58:
  /* 141338 80131D58 46066080 */     add.s $f2, $f12, $f6
  /* 14133C 80131D5C 4602003E */    c.le.s $f0, $f2
  /* 141340 80131D60 00000000 */       nop
  /* 141344 80131D64 45020004 */     bc1fl .L80131D78
  /* 141348 80131D68 46001306 */     mov.s $f12, $f2
  /* 14134C 80131D6C 10000002 */         b .L80131D78
  /* 141350 80131D70 46000306 */     mov.s $f12, $f0
  /* 141354 80131D74 46001306 */     mov.s $f12, $f2
  .L80131D78:
  /* 141358 80131D78 46006006 */     mov.s $f0, $f12
  .L80131D7C:
  /* 14135C 80131D7C 03E00008 */        jr $ra
  /* 141360 80131D80 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnTrainingCheckFighterIsXBoxed
  /* 141364 80131D84 AFA40000 */        sw $a0, ($sp)
  /* 141368 80131D88 03E00008 */        jr $ra
  /* 14136C 80131D8C 00001025 */        or $v0, $zero, $zero

glabel mnTrainingSetPortraitX
  /* 141370 80131D90 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 141374 80131D94 AFBF0014 */        sw $ra, 0x14($sp)
  /* 141378 80131D98 00803025 */        or $a2, $a0, $zero
  /* 14137C 80131D9C 8CCE0074 */        lw $t6, 0x74($a2)
  /* 141380 80131DA0 8C840084 */        lw $a0, 0x84($a0)
  /* 141384 80131DA4 8DC50058 */        lw $a1, 0x58($t6)
  /* 141388 80131DA8 0C04C71C */       jal mnTrainingGetNextPortraitX
  /* 14138C 80131DAC AFA60018 */        sw $a2, 0x18($sp)
  /* 141390 80131DB0 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 141394 80131DB4 44812000 */      mtc1 $at, $f4 # -1.0 to cop1
  /* 141398 80131DB8 8FA60018 */        lw $a2, 0x18($sp)
  /* 14139C 80131DBC 46040032 */    c.eq.s $f0, $f4
  /* 1413A0 80131DC0 00000000 */       nop
  /* 1413A4 80131DC4 4503000E */     bc1tl .L80131E00
  /* 1413A8 80131DC8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1413AC 80131DCC 8CCF0074 */        lw $t7, 0x74($a2)
  /* 1413B0 80131DD0 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 1413B4 80131DD4 E5E00058 */      swc1 $f0, 0x58($t7)
  /* 1413B8 80131DD8 8CC20074 */        lw $v0, 0x74($a2)
  /* 1413BC 80131DDC 8C430008 */        lw $v1, 8($v0)
  /* 1413C0 80131DE0 50600007 */      beql $v1, $zero, .L80131E00
  /* 1413C4 80131DE4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1413C8 80131DE8 C4460058 */      lwc1 $f6, 0x58($v0)
  /* 1413CC 80131DEC 44814000 */      mtc1 $at, $f8 # 4.0 to cop1
  /* 1413D0 80131DF0 00000000 */       nop
  /* 1413D4 80131DF4 46083280 */     add.s $f10, $f6, $f8
  /* 1413D8 80131DF8 E46A0058 */      swc1 $f10, 0x58($v1)
  /* 1413DC 80131DFC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131E00:
  /* 1413E0 80131E00 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1413E4 80131E04 03E00008 */        jr $ra
  /* 1413E8 80131E08 00000000 */       nop

glabel mnTrainingInitializePortraitBackgroundPosition
  /* 1413EC 80131E0C 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 1413F0 80131E10 3C0E8014 */       lui $t6, %hi(dMNTrainingPortraitPositionsXY)
  /* 1413F4 80131E14 27A30000 */     addiu $v1, $sp, 0
  /* 1413F8 80131E18 25CE8010 */     addiu $t6, $t6, %lo(dMNTrainingPortraitPositionsXY)
  /* 1413FC 80131E1C 25C80060 */     addiu $t0, $t6, 0x60
  /* 141400 80131E20 0060C825 */        or $t9, $v1, $zero
  .L80131E24:
  /* 141404 80131E24 8DD80000 */        lw $t8, ($t6) # dMNTrainingPortraitPositionsXY + 0
  /* 141408 80131E28 25CE000C */     addiu $t6, $t6, 0xc
  /* 14140C 80131E2C 2739000C */     addiu $t9, $t9, 0xc
  /* 141410 80131E30 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 141414 80131E34 8DCFFFF8 */        lw $t7, -8($t6) # dMNTrainingPortraitPositionsXY + -8
  /* 141418 80131E38 AF2FFFF8 */        sw $t7, -8($t9)
  /* 14141C 80131E3C 8DD8FFFC */        lw $t8, -4($t6) # dMNTrainingPortraitPositionsXY + -4
  /* 141420 80131E40 15C8FFF8 */       bne $t6, $t0, .L80131E24
  /* 141424 80131E44 AF38FFFC */        sw $t8, -4($t9)
  /* 141428 80131E48 000548C0 */       sll $t1, $a1, 3
  /* 14142C 80131E4C 00691021 */      addu $v0, $v1, $t1
  /* 141430 80131E50 C4440000 */      lwc1 $f4, ($v0)
  /* 141434 80131E54 E4840058 */      swc1 $f4, 0x58($a0)
  /* 141438 80131E58 C4460004 */      lwc1 $f6, 4($v0)
  /* 14143C 80131E5C 27BD0060 */     addiu $sp, $sp, 0x60
  /* 141440 80131E60 03E00008 */        jr $ra
  /* 141444 80131E64 E486005C */      swc1 $f6, 0x5c($a0)

glabel mnTrainingAddRedXBoxToPortrait
  /* 141448 80131E68 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14144C 80131E6C AFBF0014 */        sw $ra, 0x14($sp)
  /* 141450 80131E70 AFA5002C */        sw $a1, 0x2c($sp)
  /* 141454 80131E74 8C820074 */        lw $v0, 0x74($a0)
  /* 141458 80131E78 3C0E8014 */       lui $t6, %hi(D_ovl28_80138CB0)
  /* 14145C 80131E7C 8DCE8CB0 */        lw $t6, %lo(D_ovl28_80138CB0)($t6)
  /* 141460 80131E80 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 141464 80131E84 3C0F0000 */       lui $t7, %hi(D_NF_000002B8)
  /* 141468 80131E88 25EF02B8 */     addiu $t7, $t7, %lo(D_NF_000002B8)
  /* 14146C 80131E8C E7A40020 */      swc1 $f4, 0x20($sp)
  /* 141470 80131E90 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 141474 80131E94 01CF2821 */      addu $a1, $t6, $t7
  /* 141478 80131E98 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14147C 80131E9C E7A6001C */      swc1 $f6, 0x1c($sp)
  /* 141480 80131EA0 3C014080 */       lui $at, (0x40800000 >> 16) # 4.0
  /* 141484 80131EA4 44815000 */      mtc1 $at, $f10 # 4.0 to cop1
  /* 141488 80131EA8 C7A80020 */      lwc1 $f8, 0x20($sp)
  /* 14148C 80131EAC 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 141490 80131EB0 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 141494 80131EB4 460A4400 */     add.s $f16, $f8, $f10
  /* 141498 80131EB8 94580024 */       lhu $t8, 0x24($v0)
  /* 14149C 80131EBC 240A00FF */     addiu $t2, $zero, 0xff
  /* 1414A0 80131EC0 E4500058 */      swc1 $f16, 0x58($v0)
  /* 1414A4 80131EC4 C7B2001C */      lwc1 $f18, 0x1c($sp)
  /* 1414A8 80131EC8 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 1414AC 80131ECC A4480024 */        sh $t0, 0x24($v0)
  /* 1414B0 80131ED0 46049180 */     add.s $f6, $f18, $f4
  /* 1414B4 80131ED4 35090001 */       ori $t1, $t0, 1
  /* 1414B8 80131ED8 A4490024 */        sh $t1, 0x24($v0)
  /* 1414BC 80131EDC A04A0028 */        sb $t2, 0x28($v0)
  /* 1414C0 80131EE0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1414C4 80131EE4 A0400029 */        sb $zero, 0x29($v0)
  /* 1414C8 80131EE8 A040002A */        sb $zero, 0x2a($v0)
  /* 1414CC 80131EEC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1414D0 80131EF0 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1414D4 80131EF4 03E00008 */        jr $ra
  /* 1414D8 80131EF8 00000000 */       nop

glabel mnTrainingGetIsLocked
  /* 1414DC 80131EFC 24010004 */     addiu $at, $zero, 4
  /* 1414E0 80131F00 10810026 */       beq $a0, $at, .L80131F9C
  /* 1414E4 80131F04 3C0A8014 */       lui $t2, 0x8014
  /* 1414E8 80131F08 24010007 */     addiu $at, $zero, 7
  /* 1414EC 80131F0C 1081001A */       beq $a0, $at, .L80131F78
  /* 1414F0 80131F10 3C088014 */       lui $t0, 0x8014
  /* 1414F4 80131F14 2401000A */     addiu $at, $zero, 0xa
  /* 1414F8 80131F18 1081000E */       beq $a0, $at, .L80131F54
  /* 1414FC 80131F1C 3C188014 */       lui $t8, 0x8014
  /* 141500 80131F20 2401000B */     addiu $at, $zero, 0xb
  /* 141504 80131F24 14810026 */       bne $a0, $at, .L80131FC0
  /* 141508 80131F28 00001025 */        or $v0, $zero, $zero
  /* 14150C 80131F2C 3C0E8014 */       lui $t6, %hi(gMNTrainingCharacterUnlockedMask)
  /* 141510 80131F30 95CE887C */       lhu $t6, %lo(gMNTrainingCharacterUnlockedMask)($t6)
  /* 141514 80131F34 24030001 */     addiu $v1, $zero, 1
  /* 141518 80131F38 31CF0800 */      andi $t7, $t6, 0x800
  /* 14151C 80131F3C 11E00003 */      beqz $t7, .L80131F4C
  /* 141520 80131F40 00000000 */       nop
  /* 141524 80131F44 03E00008 */        jr $ra
  /* 141528 80131F48 00001025 */        or $v0, $zero, $zero

  .L80131F4C:
  /* 14152C 80131F4C 03E00008 */        jr $ra
  /* 141530 80131F50 00601025 */        or $v0, $v1, $zero

  .L80131F54:
  /* 141534 80131F54 9718887C */       lhu $t8, -0x7784($t8)
  /* 141538 80131F58 24030001 */     addiu $v1, $zero, 1
  /* 14153C 80131F5C 33190400 */      andi $t9, $t8, 0x400
  /* 141540 80131F60 13200003 */      beqz $t9, .L80131F70
  /* 141544 80131F64 00000000 */       nop
  /* 141548 80131F68 03E00008 */        jr $ra
  /* 14154C 80131F6C 00001025 */        or $v0, $zero, $zero

  .L80131F70:
  /* 141550 80131F70 03E00008 */        jr $ra
  /* 141554 80131F74 00601025 */        or $v0, $v1, $zero

  .L80131F78:
  /* 141558 80131F78 9508887C */       lhu $t0, -0x7784($t0)
  /* 14155C 80131F7C 24030001 */     addiu $v1, $zero, 1
  /* 141560 80131F80 31090080 */      andi $t1, $t0, 0x80
  /* 141564 80131F84 11200003 */      beqz $t1, .L80131F94
  /* 141568 80131F88 00000000 */       nop
  /* 14156C 80131F8C 03E00008 */        jr $ra
  /* 141570 80131F90 00001025 */        or $v0, $zero, $zero

  .L80131F94:
  /* 141574 80131F94 03E00008 */        jr $ra
  /* 141578 80131F98 00601025 */        or $v0, $v1, $zero

  .L80131F9C:
  /* 14157C 80131F9C 954A887C */       lhu $t2, -0x7784($t2)
  /* 141580 80131FA0 24030001 */     addiu $v1, $zero, 1
  /* 141584 80131FA4 314B0010 */      andi $t3, $t2, 0x10
  /* 141588 80131FA8 11600003 */      beqz $t3, .L80131FB8
  /* 14158C 80131FAC 00000000 */       nop
  /* 141590 80131FB0 03E00008 */        jr $ra
  /* 141594 80131FB4 00001025 */        or $v0, $zero, $zero

  .L80131FB8:
  /* 141598 80131FB8 03E00008 */        jr $ra
  /* 14159C 80131FBC 00601025 */        or $v0, $v1, $zero

  .L80131FC0:
  /* 1415A0 80131FC0 03E00008 */        jr $ra
  /* 1415A4 80131FC4 00000000 */       nop

  /* 1415A8 80131FC8 03E00008 */        jr $ra
  /* 1415AC 80131FCC 00000000 */       nop

glabel mnTrainingGetFtKind
  /* 1415B0 80131FD0 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1415B4 80131FD4 3C0E8014 */       lui $t6, %hi(dMNTrainingFTKindOrder)
  /* 1415B8 80131FD8 27A30000 */     addiu $v1, $sp, 0
  /* 1415BC 80131FDC 25CE8094 */     addiu $t6, $t6, %lo(dMNTrainingFTKindOrder)
  /* 1415C0 80131FE0 25C80030 */     addiu $t0, $t6, 0x30
  /* 1415C4 80131FE4 0060C825 */        or $t9, $v1, $zero
  .L80131FE8:
  /* 1415C8 80131FE8 8DD80000 */        lw $t8, ($t6) # dMNTrainingFTKindOrder + 0
  /* 1415CC 80131FEC 25CE000C */     addiu $t6, $t6, 0xc
  /* 1415D0 80131FF0 2739000C */     addiu $t9, $t9, 0xc
  /* 1415D4 80131FF4 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1415D8 80131FF8 8DCFFFF8 */        lw $t7, -8($t6) # dMNTrainingFTKindOrder + -8
  /* 1415DC 80131FFC AF2FFFF8 */        sw $t7, -8($t9)
  /* 1415E0 80132000 8DD8FFFC */        lw $t8, -4($t6) # dMNTrainingFTKindOrder + -4
  /* 1415E4 80132004 15C8FFF8 */       bne $t6, $t0, .L80131FE8
  /* 1415E8 80132008 AF38FFFC */        sw $t8, -4($t9)
  /* 1415EC 8013200C 00044880 */       sll $t1, $a0, 2
  /* 1415F0 80132010 00695021 */      addu $t2, $v1, $t1
  /* 1415F4 80132014 8D420000 */        lw $v0, ($t2)
  /* 1415F8 80132018 03E00008 */        jr $ra
  /* 1415FC 8013201C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnTrainingGetPortraitId
  /* 141600 80132020 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 141604 80132024 3C0E8014 */       lui $t6, %hi(dMNTrainingPortraitOrder)
  /* 141608 80132028 27A30000 */     addiu $v1, $sp, 0
  /* 14160C 8013202C 25CE80C4 */     addiu $t6, $t6, %lo(dMNTrainingPortraitOrder)
  /* 141610 80132030 25C80030 */     addiu $t0, $t6, 0x30
  /* 141614 80132034 0060C825 */        or $t9, $v1, $zero
  .L80132038:
  /* 141618 80132038 8DD80000 */        lw $t8, ($t6) # dMNTrainingPortraitOrder + 0
  /* 14161C 8013203C 25CE000C */     addiu $t6, $t6, 0xc
  /* 141620 80132040 2739000C */     addiu $t9, $t9, 0xc
  /* 141624 80132044 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 141628 80132048 8DCFFFF8 */        lw $t7, -8($t6) # dMNTrainingPortraitOrder + -8
  /* 14162C 8013204C AF2FFFF8 */        sw $t7, -8($t9)
  /* 141630 80132050 8DD8FFFC */        lw $t8, -4($t6) # dMNTrainingPortraitOrder + -4
  /* 141634 80132054 15C8FFF8 */       bne $t6, $t0, .L80132038
  /* 141638 80132058 AF38FFFC */        sw $t8, -4($t9)
  /* 14163C 8013205C 00044880 */       sll $t1, $a0, 2
  /* 141640 80132060 00695021 */      addu $t2, $v1, $t1
  /* 141644 80132064 8D420000 */        lw $v0, ($t2)
  /* 141648 80132068 03E00008 */        jr $ra
  /* 14164C 8013206C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnTrainingRenderPortraitWithNoise
  /* 141650 80132070 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 141654 80132074 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 141658 80132078 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 14165C 8013207C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 141660 80132080 AFBF0014 */        sw $ra, 0x14($sp)
  /* 141664 80132084 244E0008 */     addiu $t6, $v0, 8
  /* 141668 80132088 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 14166C 8013208C 3C0FE700 */       lui $t7, 0xe700
  /* 141670 80132090 AC4F0000 */        sw $t7, ($v0)
  /* 141674 80132094 AC400004 */        sw $zero, 4($v0)
  /* 141678 80132098 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 14167C 8013209C 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 141680 801320A0 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 141684 801320A4 24580008 */     addiu $t8, $v0, 8
  /* 141688 801320A8 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 14168C 801320AC AC400004 */        sw $zero, 4($v0)
  /* 141690 801320B0 AC590000 */        sw $t9, ($v0)
  /* 141694 801320B4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 141698 801320B8 3C0C3030 */       lui $t4, (0x303030FF >> 16) # 808464639
  /* 14169C 801320BC 358C30FF */       ori $t4, $t4, (0x303030FF & 0xFFFF) # 808464639
  /* 1416A0 801320C0 244A0008 */     addiu $t2, $v0, 8
  /* 1416A4 801320C4 AC6A0000 */        sw $t2, ($v1) # gDisplayListHead + 0
  /* 1416A8 801320C8 3C0BFA00 */       lui $t3, 0xfa00
  /* 1416AC 801320CC AC4B0000 */        sw $t3, ($v0)
  /* 1416B0 801320D0 AC4C0004 */        sw $t4, 4($v0)
  /* 1416B4 801320D4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1416B8 801320D8 3C0F11FC */       lui $t7, (0x11FCF279 >> 16) # 301789817
  /* 1416BC 801320DC 3C0EFC71 */       lui $t6, (0xFC71FEE3 >> 16) # 4235329251
  /* 1416C0 801320E0 244D0008 */     addiu $t5, $v0, 8
  /* 1416C4 801320E4 AC6D0000 */        sw $t5, ($v1) # gDisplayListHead + 0
  /* 1416C8 801320E8 35CEFEE3 */       ori $t6, $t6, (0xFC71FEE3 & 0xFFFF) # 4235329251
  /* 1416CC 801320EC 35EFF279 */       ori $t7, $t7, (0x11FCF279 & 0xFFFF) # 301789817
  /* 1416D0 801320F0 AC4F0004 */        sw $t7, 4($v0)
  /* 1416D4 801320F4 AC4E0000 */        sw $t6, ($v0)
  /* 1416D8 801320F8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1416DC 801320FC 3C0A0050 */       lui $t2, (0x5041C8 >> 16) # 5259720
  /* 1416E0 80132100 3C19E200 */       lui $t9, (0xE200001C >> 16) # 3791650844
  /* 1416E4 80132104 24580008 */     addiu $t8, $v0, 8
  /* 1416E8 80132108 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1416EC 8013210C 3739001C */       ori $t9, $t9, (0xE200001C & 0xFFFF) # 3791650844
  /* 1416F0 80132110 354A41C8 */       ori $t2, $t2, (0x5041C8 & 0xFFFF) # 5259720
  /* 1416F4 80132114 AC4A0004 */        sw $t2, 4($v0)
  /* 1416F8 80132118 0C0333DD */       jal func_ovl0_800CCF74
  /* 1416FC 8013211C AC590000 */        sw $t9, ($v0)
  /* 141700 80132120 8FBF0014 */        lw $ra, 0x14($sp)
  /* 141704 80132124 27BD0018 */     addiu $sp, $sp, 0x18
  /* 141708 80132128 03E00008 */        jr $ra
  /* 14170C 8013212C 00000000 */       nop

glabel mnTrainingCreateLockedPortrait
  /* 141710 80132130 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 141714 80132134 3C0F8014 */       lui $t7, %hi(dMNTrainingLockedPortraitOffsets)
  /* 141718 80132138 AFB10020 */        sw $s1, 0x20($sp)
  /* 14171C 8013213C 25EF80F4 */     addiu $t7, $t7, %lo(dMNTrainingLockedPortraitOffsets)
  /* 141720 80132140 00808825 */        or $s1, $a0, $zero
  /* 141724 80132144 AFBF0024 */        sw $ra, 0x24($sp)
  /* 141728 80132148 AFB0001C */        sw $s0, 0x1c($sp)
  /* 14172C 8013214C 25E80030 */     addiu $t0, $t7, 0x30
  /* 141730 80132150 27AE0038 */     addiu $t6, $sp, 0x38
  .L80132154:
  /* 141734 80132154 8DF90000 */        lw $t9, ($t7) # dMNTrainingLockedPortraitOffsets + 0
  /* 141738 80132158 25EF000C */     addiu $t7, $t7, 0xc
  /* 14173C 8013215C 25CE000C */     addiu $t6, $t6, 0xc
  /* 141740 80132160 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 141744 80132164 8DF8FFF8 */        lw $t8, -8($t7) # dMNTrainingLockedPortraitOffsets + -8
  /* 141748 80132168 ADD8FFF8 */        sw $t8, -8($t6)
  /* 14174C 8013216C 8DF9FFFC */        lw $t9, -4($t7) # dMNTrainingLockedPortraitOffsets + -4
  /* 141750 80132170 15E8FFF8 */       bne $t7, $t0, .L80132154
  /* 141754 80132174 ADD9FFFC */        sw $t9, -4($t6)
  /* 141758 80132178 00002025 */        or $a0, $zero, $zero
  /* 14175C 8013217C 00002825 */        or $a1, $zero, $zero
  /* 141760 80132180 24060012 */     addiu $a2, $zero, 0x12
  /* 141764 80132184 0C00265A */       jal omMakeGObjSPAfter
  /* 141768 80132188 3C078000 */       lui $a3, 0x8000
  /* 14176C 8013218C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 141770 80132190 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 141774 80132194 2409FFFF */     addiu $t1, $zero, -1
  /* 141778 80132198 00408025 */        or $s0, $v0, $zero
  /* 14177C 8013219C AFA90010 */        sw $t1, 0x10($sp)
  /* 141780 801321A0 AFA50030 */        sw $a1, 0x30($sp)
  /* 141784 801321A4 00402025 */        or $a0, $v0, $zero
  /* 141788 801321A8 2406001B */     addiu $a2, $zero, 0x1b
  /* 14178C 801321AC 0C00277D */       jal omAddGObjRenderProc
  /* 141790 801321B0 3C078000 */       lui $a3, 0x8000
  /* 141794 801321B4 3C058013 */       lui $a1, %hi(mnTrainingSetPortraitX)
  /* 141798 801321B8 24A51D90 */     addiu $a1, $a1, %lo(mnTrainingSetPortraitX)
  /* 14179C 801321BC AFA5002C */        sw $a1, 0x2c($sp)
  /* 1417A0 801321C0 02002025 */        or $a0, $s0, $zero
  /* 1417A4 801321C4 24060001 */     addiu $a2, $zero, 1
  /* 1417A8 801321C8 0C002062 */       jal omAddGObjCommonProc
  /* 1417AC 801321CC 24070001 */     addiu $a3, $zero, 1
  /* 1417B0 801321D0 3C0A8014 */       lui $t2, %hi(D_ovl28_80138CB0)
  /* 1417B4 801321D4 8D4A8CB0 */        lw $t2, %lo(D_ovl28_80138CB0)($t2)
  /* 1417B8 801321D8 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 1417BC 801321DC 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 1417C0 801321E0 02002025 */        or $a0, $s0, $zero
  /* 1417C4 801321E4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1417C8 801321E8 014B2821 */      addu $a1, $t2, $t3
  /* 1417CC 801321EC 2A210006 */      slti $at, $s1, 6
  /* 1417D0 801321F0 14200003 */      bnez $at, .L80132200
  /* 1417D4 801321F4 00402025 */        or $a0, $v0, $zero
  /* 1417D8 801321F8 10000002 */         b .L80132204
  /* 1417DC 801321FC 2623FFFA */     addiu $v1, $s1, -6
  .L80132200:
  /* 1417E0 80132200 02201825 */        or $v1, $s1, $zero
  .L80132204:
  /* 1417E4 80132204 00036080 */       sll $t4, $v1, 2
  /* 1417E8 80132208 01836023 */      subu $t4, $t4, $v1
  /* 1417EC 8013220C 000C6080 */       sll $t4, $t4, 2
  /* 1417F0 80132210 01836023 */      subu $t4, $t4, $v1
  /* 1417F4 80132214 000C6080 */       sll $t4, $t4, 2
  /* 1417F8 80132218 01836021 */      addu $t4, $t4, $v1
  /* 1417FC 8013221C 258D0019 */     addiu $t5, $t4, 0x19
  /* 141800 80132220 448D2000 */      mtc1 $t5, $f4
  /* 141804 80132224 2A210006 */      slti $at, $s1, 6
  /* 141808 80132228 468021A0 */   cvt.s.w $f6, $f4
  /* 14180C 8013222C 14200003 */      bnez $at, .L8013223C
  /* 141810 80132230 E4460058 */      swc1 $f6, 0x58($v0)
  /* 141814 80132234 10000002 */         b .L80132240
  /* 141818 80132238 24030001 */     addiu $v1, $zero, 1
  .L8013223C:
  /* 14181C 8013223C 00001825 */        or $v1, $zero, $zero
  .L80132240:
  /* 141820 80132240 00034080 */       sll $t0, $v1, 2
  /* 141824 80132244 01034023 */      subu $t0, $t0, $v1
  /* 141828 80132248 00084080 */       sll $t0, $t0, 2
  /* 14182C 8013224C 01034023 */      subu $t0, $t0, $v1
  /* 141830 80132250 00084080 */       sll $t0, $t0, 2
  /* 141834 80132254 01034023 */      subu $t0, $t0, $v1
  /* 141838 80132258 250F0024 */     addiu $t7, $t0, 0x24
  /* 14183C 8013225C 448F4000 */      mtc1 $t7, $f8
  /* 141840 80132260 02202825 */        or $a1, $s1, $zero
  /* 141844 80132264 468042A0 */   cvt.s.w $f10, $f8
  /* 141848 80132268 0C04C783 */       jal mnTrainingInitializePortraitBackgroundPosition
  /* 14184C 8013226C E48A005C */      swc1 $f10, 0x5c($a0)
  /* 141850 80132270 AE110084 */        sw $s1, 0x84($s0)
  /* 141854 80132274 00002025 */        or $a0, $zero, $zero
  /* 141858 80132278 00002825 */        or $a1, $zero, $zero
  /* 14185C 8013227C 24060012 */     addiu $a2, $zero, 0x12
  /* 141860 80132280 0C00265A */       jal omMakeGObjSPAfter
  /* 141864 80132284 3C078000 */       lui $a3, 0x8000
  /* 141868 80132288 3C058013 */       lui $a1, %hi(mnTrainingRenderPortraitWithNoise)
  /* 14186C 8013228C 240EFFFF */     addiu $t6, $zero, -1
  /* 141870 80132290 00408025 */        or $s0, $v0, $zero
  /* 141874 80132294 AFAE0010 */        sw $t6, 0x10($sp)
  /* 141878 80132298 24A52070 */     addiu $a1, $a1, %lo(mnTrainingRenderPortraitWithNoise)
  /* 14187C 8013229C 00402025 */        or $a0, $v0, $zero
  /* 141880 801322A0 2406001B */     addiu $a2, $zero, 0x1b
  /* 141884 801322A4 0C00277D */       jal omAddGObjRenderProc
  /* 141888 801322A8 3C078000 */       lui $a3, 0x8000
  /* 14188C 801322AC 02002025 */        or $a0, $s0, $zero
  /* 141890 801322B0 8FA5002C */        lw $a1, 0x2c($sp)
  /* 141894 801322B4 24060001 */     addiu $a2, $zero, 1
  /* 141898 801322B8 0C002062 */       jal omAddGObjCommonProc
  /* 14189C 801322BC 24070001 */     addiu $a3, $zero, 1
  /* 1418A0 801322C0 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 1418A4 801322C4 02202025 */        or $a0, $s1, $zero
  /* 1418A8 801322C8 0002C080 */       sll $t8, $v0, 2
  /* 1418AC 801322CC 03B8C821 */      addu $t9, $sp, $t8
  /* 1418B0 801322D0 3C098014 */       lui $t1, %hi(D_ovl28_80138CB0)
  /* 1418B4 801322D4 8D298CB0 */        lw $t1, %lo(D_ovl28_80138CB0)($t1)
  /* 1418B8 801322D8 8F390038 */        lw $t9, 0x38($t9)
  /* 1418BC 801322DC 02002025 */        or $a0, $s0, $zero
  /* 1418C0 801322E0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1418C4 801322E4 03292821 */      addu $a1, $t9, $t1
  /* 1418C8 801322E8 944A0024 */       lhu $t2, 0x24($v0)
  /* 1418CC 801322EC 00402025 */        or $a0, $v0, $zero
  /* 1418D0 801322F0 02202825 */        or $a1, $s1, $zero
  /* 1418D4 801322F4 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 1418D8 801322F8 A44C0024 */        sh $t4, 0x24($v0)
  /* 1418DC 801322FC 358D0001 */       ori $t5, $t4, 1
  /* 1418E0 80132300 A44D0024 */        sh $t5, 0x24($v0)
  /* 1418E4 80132304 0C04C783 */       jal mnTrainingInitializePortraitBackgroundPosition
  /* 1418E8 80132308 AE110084 */        sw $s1, 0x84($s0)
  /* 1418EC 8013230C 00002025 */        or $a0, $zero, $zero
  /* 1418F0 80132310 00002825 */        or $a1, $zero, $zero
  /* 1418F4 80132314 24060012 */     addiu $a2, $zero, 0x12
  /* 1418F8 80132318 0C00265A */       jal omMakeGObjSPAfter
  /* 1418FC 8013231C 3C078000 */       lui $a3, 0x8000
  /* 141900 80132320 2408FFFF */     addiu $t0, $zero, -1
  /* 141904 80132324 00408025 */        or $s0, $v0, $zero
  /* 141908 80132328 AFA80010 */        sw $t0, 0x10($sp)
  /* 14190C 8013232C 00402025 */        or $a0, $v0, $zero
  /* 141910 80132330 8FA50030 */        lw $a1, 0x30($sp)
  /* 141914 80132334 2406001B */     addiu $a2, $zero, 0x1b
  /* 141918 80132338 0C00277D */       jal omAddGObjRenderProc
  /* 14191C 8013233C 3C078000 */       lui $a3, 0x8000
  /* 141920 80132340 02002025 */        or $a0, $s0, $zero
  /* 141924 80132344 8FA5002C */        lw $a1, 0x2c($sp)
  /* 141928 80132348 24060001 */     addiu $a2, $zero, 1
  /* 14192C 8013234C 0C002062 */       jal omAddGObjCommonProc
  /* 141930 80132350 24070001 */     addiu $a3, $zero, 1
  /* 141934 80132354 3C0F8014 */       lui $t7, %hi(D_ovl28_80138CB0)
  /* 141938 80132358 8DEF8CB0 */        lw $t7, %lo(D_ovl28_80138CB0)($t7)
  /* 14193C 8013235C 3C0E0000 */       lui $t6, %hi(D_NF_00000F68)
  /* 141940 80132360 25CE0F68 */     addiu $t6, $t6, %lo(D_NF_00000F68)
  /* 141944 80132364 02002025 */        or $a0, $s0, $zero
  /* 141948 80132368 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 14194C 8013236C 01EE2821 */      addu $a1, $t7, $t6
  /* 141950 80132370 94580024 */       lhu $t8, 0x24($v0)
  /* 141954 80132374 240B005B */     addiu $t3, $zero, 0x5b
  /* 141958 80132378 240C0041 */     addiu $t4, $zero, 0x41
  /* 14195C 8013237C 3309FFDF */      andi $t1, $t8, 0xffdf
  /* 141960 80132380 A4490024 */        sh $t1, 0x24($v0)
  /* 141964 80132384 352A0001 */       ori $t2, $t1, 1
  /* 141968 80132388 240D0033 */     addiu $t5, $zero, 0x33
  /* 14196C 8013238C 240800C4 */     addiu $t0, $zero, 0xc4
  /* 141970 80132390 240F00B9 */     addiu $t7, $zero, 0xb9
  /* 141974 80132394 240E00A9 */     addiu $t6, $zero, 0xa9
  /* 141978 80132398 A44A0024 */        sh $t2, 0x24($v0)
  /* 14197C 8013239C A04B0060 */        sb $t3, 0x60($v0)
  /* 141980 801323A0 A04C0061 */        sb $t4, 0x61($v0)
  /* 141984 801323A4 A04D0062 */        sb $t5, 0x62($v0)
  /* 141988 801323A8 A0480028 */        sb $t0, 0x28($v0)
  /* 14198C 801323AC A04F0029 */        sb $t7, 0x29($v0)
  /* 141990 801323B0 A04E002A */        sb $t6, 0x2a($v0)
  /* 141994 801323B4 AE110084 */        sw $s1, 0x84($s0)
  /* 141998 801323B8 00402025 */        or $a0, $v0, $zero
  /* 14199C 801323BC 0C04C783 */       jal mnTrainingInitializePortraitBackgroundPosition
  /* 1419A0 801323C0 02202825 */        or $a1, $s1, $zero
  /* 1419A4 801323C4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1419A8 801323C8 8FB0001C */        lw $s0, 0x1c($sp)
  /* 1419AC 801323CC 8FB10020 */        lw $s1, 0x20($sp)
  /* 1419B0 801323D0 03E00008 */        jr $ra
  /* 1419B4 801323D4 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnTrainingCreatePortrait
  /* 1419B8 801323D8 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 1419BC 801323DC 3C0F8014 */       lui $t7, %hi(dMNTrainingPortraitOffsets)
  /* 1419C0 801323E0 AFB00020 */        sw $s0, 0x20($sp)
  /* 1419C4 801323E4 25EF8124 */     addiu $t7, $t7, %lo(dMNTrainingPortraitOffsets)
  /* 1419C8 801323E8 00808025 */        or $s0, $a0, $zero
  /* 1419CC 801323EC AFBF0024 */        sw $ra, 0x24($sp)
  /* 1419D0 801323F0 25E80030 */     addiu $t0, $t7, 0x30
  /* 1419D4 801323F4 27AE0034 */     addiu $t6, $sp, 0x34
  .L801323F8:
  /* 1419D8 801323F8 8DF90000 */        lw $t9, ($t7) # dMNTrainingPortraitOffsets + 0
  /* 1419DC 801323FC 25EF000C */     addiu $t7, $t7, 0xc
  /* 1419E0 80132400 25CE000C */     addiu $t6, $t6, 0xc
  /* 1419E4 80132404 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 1419E8 80132408 8DF8FFF8 */        lw $t8, -8($t7) # dMNTrainingPortraitOffsets + -8
  /* 1419EC 8013240C ADD8FFF8 */        sw $t8, -8($t6)
  /* 1419F0 80132410 8DF9FFFC */        lw $t9, -4($t7) # dMNTrainingPortraitOffsets + -4
  /* 1419F4 80132414 15E8FFF8 */       bne $t7, $t0, .L801323F8
  /* 1419F8 80132418 ADD9FFFC */        sw $t9, -4($t6)
  /* 1419FC 8013241C 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 141A00 80132420 02002025 */        or $a0, $s0, $zero
  /* 141A04 80132424 0C04C7BF */       jal mnTrainingGetIsLocked
  /* 141A08 80132428 00402025 */        or $a0, $v0, $zero
  /* 141A0C 8013242C 10400005 */      beqz $v0, .L80132444
  /* 141A10 80132430 00002025 */        or $a0, $zero, $zero
  /* 141A14 80132434 0C04C84C */       jal mnTrainingCreateLockedPortrait
  /* 141A18 80132438 02002025 */        or $a0, $s0, $zero
  /* 141A1C 8013243C 10000051 */         b .L80132584
  /* 141A20 80132440 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132444:
  /* 141A24 80132444 00002825 */        or $a1, $zero, $zero
  /* 141A28 80132448 2406001D */     addiu $a2, $zero, 0x1d
  /* 141A2C 8013244C 0C00265A */       jal omMakeGObjSPAfter
  /* 141A30 80132450 3C078000 */       lui $a3, 0x8000
  /* 141A34 80132454 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 141A38 80132458 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 141A3C 8013245C 2409FFFF */     addiu $t1, $zero, -1
  /* 141A40 80132460 AFA20068 */        sw $v0, 0x68($sp)
  /* 141A44 80132464 AFA90010 */        sw $t1, 0x10($sp)
  /* 141A48 80132468 AFA5002C */        sw $a1, 0x2c($sp)
  /* 141A4C 8013246C 00402025 */        or $a0, $v0, $zero
  /* 141A50 80132470 24060024 */     addiu $a2, $zero, 0x24
  /* 141A54 80132474 0C00277D */       jal omAddGObjRenderProc
  /* 141A58 80132478 3C078000 */       lui $a3, 0x8000
  /* 141A5C 8013247C 8FA40068 */        lw $a0, 0x68($sp)
  /* 141A60 80132480 3C058013 */       lui $a1, %hi(mnTrainingSetPortraitX)
  /* 141A64 80132484 24A51D90 */     addiu $a1, $a1, %lo(mnTrainingSetPortraitX)
  /* 141A68 80132488 AC900084 */        sw $s0, 0x84($a0)
  /* 141A6C 8013248C AFA50028 */        sw $a1, 0x28($sp)
  /* 141A70 80132490 24060001 */     addiu $a2, $zero, 1
  /* 141A74 80132494 0C002062 */       jal omAddGObjCommonProc
  /* 141A78 80132498 24070001 */     addiu $a3, $zero, 1
  /* 141A7C 8013249C 3C0A8014 */       lui $t2, %hi(D_ovl28_80138CB0)
  /* 141A80 801324A0 8D4A8CB0 */        lw $t2, %lo(D_ovl28_80138CB0)($t2)
  /* 141A84 801324A4 3C0B0000 */       lui $t3, %hi(D_NF_000024D0)
  /* 141A88 801324A8 256B24D0 */     addiu $t3, $t3, %lo(D_NF_000024D0)
  /* 141A8C 801324AC 8FA40068 */        lw $a0, 0x68($sp)
  /* 141A90 801324B0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 141A94 801324B4 014B2821 */      addu $a1, $t2, $t3
  /* 141A98 801324B8 00402025 */        or $a0, $v0, $zero
  /* 141A9C 801324BC 0C04C783 */       jal mnTrainingInitializePortraitBackgroundPosition
  /* 141AA0 801324C0 02002825 */        or $a1, $s0, $zero
  /* 141AA4 801324C4 00002025 */        or $a0, $zero, $zero
  /* 141AA8 801324C8 00002825 */        or $a1, $zero, $zero
  /* 141AAC 801324CC 24060012 */     addiu $a2, $zero, 0x12
  /* 141AB0 801324D0 0C00265A */       jal omMakeGObjSPAfter
  /* 141AB4 801324D4 3C078000 */       lui $a3, 0x8000
  /* 141AB8 801324D8 240CFFFF */     addiu $t4, $zero, -1
  /* 141ABC 801324DC AFA2006C */        sw $v0, 0x6c($sp)
  /* 141AC0 801324E0 AFAC0010 */        sw $t4, 0x10($sp)
  /* 141AC4 801324E4 00402025 */        or $a0, $v0, $zero
  /* 141AC8 801324E8 8FA5002C */        lw $a1, 0x2c($sp)
  /* 141ACC 801324EC 2406001B */     addiu $a2, $zero, 0x1b
  /* 141AD0 801324F0 0C00277D */       jal omAddGObjRenderProc
  /* 141AD4 801324F4 3C078000 */       lui $a3, 0x8000
  /* 141AD8 801324F8 8FA4006C */        lw $a0, 0x6c($sp)
  /* 141ADC 801324FC 8FA50028 */        lw $a1, 0x28($sp)
  /* 141AE0 80132500 24060001 */     addiu $a2, $zero, 1
  /* 141AE4 80132504 0C002062 */       jal omAddGObjCommonProc
  /* 141AE8 80132508 24070001 */     addiu $a3, $zero, 1
  /* 141AEC 8013250C 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 141AF0 80132510 02002025 */        or $a0, $s0, $zero
  /* 141AF4 80132514 00026880 */       sll $t5, $v0, 2
  /* 141AF8 80132518 03AD4021 */      addu $t0, $sp, $t5
  /* 141AFC 8013251C 3C0F8014 */       lui $t7, %hi(D_ovl28_80138CB0)
  /* 141B00 80132520 8DEF8CB0 */        lw $t7, %lo(D_ovl28_80138CB0)($t7)
  /* 141B04 80132524 8D080034 */        lw $t0, 0x34($t0)
  /* 141B08 80132528 8FA4006C */        lw $a0, 0x6c($sp)
  /* 141B0C 8013252C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 141B10 80132530 010F2821 */      addu $a1, $t0, $t7
  /* 141B14 80132534 AFA20064 */        sw $v0, 0x64($sp)
  /* 141B18 80132538 944E0024 */       lhu $t6, 0x24($v0)
  /* 141B1C 8013253C 02002025 */        or $a0, $s0, $zero
  /* 141B20 80132540 31D9FFDF */      andi $t9, $t6, 0xffdf
  /* 141B24 80132544 A4590024 */        sh $t9, 0x24($v0)
  /* 141B28 80132548 37290001 */       ori $t1, $t9, 1
  /* 141B2C 8013254C A4490024 */        sh $t1, 0x24($v0)
  /* 141B30 80132550 8FAA006C */        lw $t2, 0x6c($sp)
  /* 141B34 80132554 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 141B38 80132558 AD500084 */        sw $s0, 0x84($t2)
  /* 141B3C 8013255C 0C04C761 */       jal mnTrainingCheckFighterIsXBoxed
  /* 141B40 80132560 00402025 */        or $a0, $v0, $zero
  /* 141B44 80132564 10400003 */      beqz $v0, .L80132574
  /* 141B48 80132568 8FA4006C */        lw $a0, 0x6c($sp)
  /* 141B4C 8013256C 0C04C79A */       jal mnTrainingAddRedXBoxToPortrait
  /* 141B50 80132570 02002825 */        or $a1, $s0, $zero
  .L80132574:
  /* 141B54 80132574 8FA40064 */        lw $a0, 0x64($sp)
  /* 141B58 80132578 0C04C783 */       jal mnTrainingInitializePortraitBackgroundPosition
  /* 141B5C 8013257C 02002825 */        or $a1, $s0, $zero
  /* 141B60 80132580 8FBF0024 */        lw $ra, 0x24($sp)
  .L80132584:
  /* 141B64 80132584 8FB00020 */        lw $s0, 0x20($sp)
  /* 141B68 80132588 27BD0070 */     addiu $sp, $sp, 0x70
  /* 141B6C 8013258C 03E00008 */        jr $ra
  /* 141B70 80132590 00000000 */       nop

glabel mnTrainingCreatePortraits
  /* 141B74 80132594 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 141B78 80132598 AFB10018 */        sw $s1, 0x18($sp)
  /* 141B7C 8013259C AFB00014 */        sw $s0, 0x14($sp)
  /* 141B80 801325A0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 141B84 801325A4 00008025 */        or $s0, $zero, $zero
  /* 141B88 801325A8 2411000C */     addiu $s1, $zero, 0xc
  .L801325AC:
  /* 141B8C 801325AC 0C04C8F6 */       jal mnTrainingCreatePortrait
  /* 141B90 801325B0 02002025 */        or $a0, $s0, $zero
  /* 141B94 801325B4 26100001 */     addiu $s0, $s0, 1
  /* 141B98 801325B8 1611FFFC */       bne $s0, $s1, .L801325AC
  /* 141B9C 801325BC 00000000 */       nop
  /* 141BA0 801325C0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 141BA4 801325C4 8FB00014 */        lw $s0, 0x14($sp)
  /* 141BA8 801325C8 8FB10018 */        lw $s1, 0x18($sp)
  /* 141BAC 801325CC 03E00008 */        jr $ra
  /* 141BB0 801325D0 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnTrainingSetNameAndLogo
  /* 141BB4 801325D4 27BDFF20 */     addiu $sp, $sp, -0xe0
  /* 141BB8 801325D8 3C0F8014 */       lui $t7, %hi(dMNTrainingUnusedPositions)
  /* 141BBC 801325DC 25EF8154 */     addiu $t7, $t7, %lo(dMNTrainingUnusedPositions)
  /* 141BC0 801325E0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 141BC4 801325E4 AFA400E0 */        sw $a0, 0xe0($sp)
  /* 141BC8 801325E8 AFA500E4 */        sw $a1, 0xe4($sp)
  /* 141BCC 801325EC 00C03825 */        or $a3, $a2, $zero
  /* 141BD0 801325F0 25E80060 */     addiu $t0, $t7, 0x60
  /* 141BD4 801325F4 27AE007C */     addiu $t6, $sp, 0x7c
  .L801325F8:
  /* 141BD8 801325F8 8DF90000 */        lw $t9, ($t7) # dMNTrainingUnusedPositions + 0
  /* 141BDC 801325FC 25EF000C */     addiu $t7, $t7, 0xc
  /* 141BE0 80132600 25CE000C */     addiu $t6, $t6, 0xc
  /* 141BE4 80132604 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 141BE8 80132608 8DF8FFF8 */        lw $t8, -8($t7) # dMNTrainingUnusedPositions + -8
  /* 141BEC 8013260C ADD8FFF8 */        sw $t8, -8($t6)
  /* 141BF0 80132610 8DF9FFFC */        lw $t9, -4($t7) # dMNTrainingUnusedPositions + -4
  /* 141BF4 80132614 15E8FFF8 */       bne $t7, $t0, .L801325F8
  /* 141BF8 80132618 ADD9FFFC */        sw $t9, -4($t6)
  /* 141BFC 8013261C 3C0A8014 */       lui $t2, %hi(dMNTrainingLogoOffsets)
  /* 141C00 80132620 254A81B4 */     addiu $t2, $t2, %lo(dMNTrainingLogoOffsets)
  /* 141C04 80132624 254D0030 */     addiu $t5, $t2, 0x30
  /* 141C08 80132628 27A9004C */     addiu $t1, $sp, 0x4c
  .L8013262C:
  /* 141C0C 8013262C 8D4C0000 */        lw $t4, ($t2) # dMNTrainingLogoOffsets + 0
  /* 141C10 80132630 254A000C */     addiu $t2, $t2, 0xc
  /* 141C14 80132634 2529000C */     addiu $t1, $t1, 0xc
  /* 141C18 80132638 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 141C1C 8013263C 8D4BFFF8 */        lw $t3, -8($t2) # dMNTrainingLogoOffsets + -8
  /* 141C20 80132640 AD2BFFF8 */        sw $t3, -8($t1)
  /* 141C24 80132644 8D4CFFFC */        lw $t4, -4($t2) # dMNTrainingLogoOffsets + -4
  /* 141C28 80132648 154DFFF8 */       bne $t2, $t5, .L8013262C
  /* 141C2C 8013264C AD2CFFFC */        sw $t4, -4($t1)
  /* 141C30 80132650 3C0F8014 */       lui $t7, %hi(dMNTrainingNameOffsets)
  /* 141C34 80132654 25EF81E4 */     addiu $t7, $t7, %lo(dMNTrainingNameOffsets)
  /* 141C38 80132658 25F90030 */     addiu $t9, $t7, 0x30
  /* 141C3C 8013265C 27A8001C */     addiu $t0, $sp, 0x1c
  .L80132660:
  /* 141C40 80132660 8DF80000 */        lw $t8, ($t7) # dMNTrainingNameOffsets + 0
  /* 141C44 80132664 25EF000C */     addiu $t7, $t7, 0xc
  /* 141C48 80132668 2508000C */     addiu $t0, $t0, 0xc
  /* 141C4C 8013266C AD18FFF4 */        sw $t8, -0xc($t0)
  /* 141C50 80132670 8DEEFFF8 */        lw $t6, -8($t7) # dMNTrainingNameOffsets + -8
  /* 141C54 80132674 AD0EFFF8 */        sw $t6, -8($t0)
  /* 141C58 80132678 8DF8FFFC */        lw $t8, -4($t7) # dMNTrainingNameOffsets + -4
  /* 141C5C 8013267C 15F9FFF8 */       bne $t7, $t9, .L80132660
  /* 141C60 80132680 AD18FFFC */        sw $t8, -4($t0)
  /* 141C64 80132684 2401001C */     addiu $at, $zero, 0x1c
  /* 141C68 80132688 10E1004A */       beq $a3, $at, .L801327B4
  /* 141C6C 8013268C 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 141C70 80132690 0C002DD8 */       jal func_8000B760
  /* 141C74 80132694 AFA700E8 */        sw $a3, 0xe8($sp)
  /* 141C78 80132698 8FA700E8 */        lw $a3, 0xe8($sp)
  /* 141C7C 8013269C 3C0A8014 */       lui $t2, %hi(D_ovl28_80138CA4)
  /* 141C80 801326A0 8D4A8CA4 */        lw $t2, %lo(D_ovl28_80138CA4)($t2)
  /* 141C84 801326A4 00073080 */       sll $a2, $a3, 2
  /* 141C88 801326A8 03A66821 */      addu $t5, $sp, $a2
  /* 141C8C 801326AC 8DAD004C */        lw $t5, 0x4c($t5)
  /* 141C90 801326B0 AFA60018 */        sw $a2, 0x18($sp)
  /* 141C94 801326B4 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 141C98 801326B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 141C9C 801326BC 01AA2821 */      addu $a1, $t5, $t2
  /* 141CA0 801326C0 94490024 */       lhu $t1, 0x24($v0)
  /* 141CA4 801326C4 8FA60018 */        lw $a2, 0x18($sp)
  /* 141CA8 801326C8 3C088014 */       lui $t0, %hi(gMNTrainingHumanPanelPort)
  /* 141CAC 801326CC 312CFFDF */      andi $t4, $t1, 0xffdf
  /* 141CB0 801326D0 A44C0024 */        sh $t4, 0x24($v0)
  /* 141CB4 801326D4 35990001 */       ori $t9, $t4, 1
  /* 141CB8 801326D8 A4590024 */        sh $t9, 0x24($v0)
  /* 141CBC 801326DC 8D088894 */        lw $t0, %lo(gMNTrainingHumanPanelPort)($t0)
  /* 141CC0 801326E0 8FAF00E4 */        lw $t7, 0xe4($sp)
  /* 141CC4 801326E4 24030044 */     addiu $v1, $zero, 0x44
  /* 141CC8 801326E8 3C188014 */       lui $t8, %hi(D_ovl28_80138C98)
  /* 141CCC 801326EC 15E8000C */       bne $t7, $t0, .L80132720
  /* 141CD0 801326F0 03A67021 */      addu $t6, $sp, $a2
  /* 141CD4 801326F4 3C01427C */       lui $at, (0x427C0000 >> 16) # 63.0
  /* 141CD8 801326F8 44812000 */      mtc1 $at, $f4 # 63.0 to cop1
  /* 141CDC 801326FC 3C014310 */       lui $at, (0x43100000 >> 16) # 144.0
  /* 141CE0 80132700 44813000 */      mtc1 $at, $f6 # 144.0 to cop1
  /* 141CE4 80132704 2403001E */     addiu $v1, $zero, 0x1e
  /* 141CE8 80132708 A0430028 */        sb $v1, 0x28($v0)
  /* 141CEC 8013270C A0430029 */        sb $v1, 0x29($v0)
  /* 141CF0 80132710 A043002A */        sb $v1, 0x2a($v0)
  /* 141CF4 80132714 E4440058 */      swc1 $f4, 0x58($v0)
  /* 141CF8 80132718 1000000A */         b .L80132744
  /* 141CFC 8013271C E446005C */      swc1 $f6, 0x5c($v0)
  .L80132720:
  /* 141D00 80132720 3C014343 */       lui $at, (0x43430000 >> 16) # 195.0
  /* 141D04 80132724 44814000 */      mtc1 $at, $f8 # 195.0 to cop1
  /* 141D08 80132728 3C014310 */       lui $at, (0x43100000 >> 16) # 144.0
  /* 141D0C 8013272C 44815000 */      mtc1 $at, $f10 # 144.0 to cop1
  /* 141D10 80132730 A0430028 */        sb $v1, 0x28($v0)
  /* 141D14 80132734 A0430029 */        sb $v1, 0x29($v0)
  /* 141D18 80132738 A043002A */        sb $v1, 0x2a($v0)
  /* 141D1C 8013273C E4480058 */      swc1 $f8, 0x58($v0)
  /* 141D20 80132740 E44A005C */      swc1 $f10, 0x5c($v0)
  .L80132744:
  /* 141D24 80132744 8DCE001C */        lw $t6, 0x1c($t6)
  /* 141D28 80132748 8F188C98 */        lw $t8, %lo(D_ovl28_80138C98)($t8)
  /* 141D2C 8013274C 8FA400E0 */        lw $a0, 0xe0($sp)
  /* 141D30 80132750 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 141D34 80132754 01D82821 */      addu $a1, $t6, $t8
  /* 141D38 80132758 944D0024 */       lhu $t5, 0x24($v0)
  /* 141D3C 8013275C 3C198014 */       lui $t9, %hi(gMNTrainingHumanPanelPort)
  /* 141D40 80132760 3C014341 */       lui $at, (0x43410000 >> 16) # 193.0
  /* 141D44 80132764 31A9FFDF */      andi $t1, $t5, 0xffdf
  /* 141D48 80132768 A4490024 */        sh $t1, 0x24($v0)
  /* 141D4C 8013276C 352B0001 */       ori $t3, $t1, 1
  /* 141D50 80132770 A44B0024 */        sh $t3, 0x24($v0)
  /* 141D54 80132774 8F398894 */        lw $t9, %lo(gMNTrainingHumanPanelPort)($t9)
  /* 141D58 80132778 8FAC00E4 */        lw $t4, 0xe4($sp)
  /* 141D5C 8013277C 55990009 */      bnel $t4, $t9, .L801327A4
  /* 141D60 80132780 44812000 */      mtc1 $at, $f4 # 193.0 to cop1
  /* 141D64 80132784 3C014274 */       lui $at, (0x42740000 >> 16) # 61.0
  /* 141D68 80132788 44818000 */      mtc1 $at, $f16 # 61.0 to cop1
  /* 141D6C 8013278C 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 141D70 80132790 44819000 */      mtc1 $at, $f18 # 202.0 to cop1
  /* 141D74 80132794 E4500058 */      swc1 $f16, 0x58($v0)
  /* 141D78 80132798 10000006 */         b .L801327B4
  /* 141D7C 8013279C E452005C */      swc1 $f18, 0x5c($v0)
  /* 141D80 801327A0 44812000 */      mtc1 $at, $f4 # 202.0 to cop1
  .L801327A4:
  /* 141D84 801327A4 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 141D88 801327A8 44813000 */      mtc1 $at, $f6 # 202.0 to cop1
  /* 141D8C 801327AC E4440058 */      swc1 $f4, 0x58($v0)
  /* 141D90 801327B0 E446005C */      swc1 $f6, 0x5c($v0)
  .L801327B4:
  /* 141D94 801327B4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 141D98 801327B8 27BD00E0 */     addiu $sp, $sp, 0xe0
  /* 141D9C 801327BC 03E00008 */        jr $ra
  /* 141DA0 801327C0 00000000 */       nop

glabel mnTrainingCreatePortraitViewport
  /* 141DA4 801327C4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 141DA8 801327C8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 141DAC 801327CC AFBF003C */        sw $ra, 0x3c($sp)
  /* 141DB0 801327D0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 141DB4 801327D4 240F0046 */     addiu $t7, $zero, 0x46
  /* 141DB8 801327D8 24180000 */     addiu $t8, $zero, 0
  /* 141DBC 801327DC 3C190800 */       lui $t9, 0x800
  /* 141DC0 801327E0 2408FFFF */     addiu $t0, $zero, -1
  /* 141DC4 801327E4 24090001 */     addiu $t1, $zero, 1
  /* 141DC8 801327E8 240A0001 */     addiu $t2, $zero, 1
  /* 141DCC 801327EC AFAA0030 */        sw $t2, 0x30($sp)
  /* 141DD0 801327F0 AFA90028 */        sw $t1, 0x28($sp)
  /* 141DD4 801327F4 AFA80020 */        sw $t0, 0x20($sp)
  /* 141DD8 801327F8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 141DDC 801327FC AFB80018 */        sw $t8, 0x18($sp)
  /* 141DE0 80132800 AFAF0014 */        sw $t7, 0x14($sp)
  /* 141DE4 80132804 AFAE0010 */        sw $t6, 0x10($sp)
  /* 141DE8 80132808 AFA00024 */        sw $zero, 0x24($sp)
  /* 141DEC 8013280C AFA0002C */        sw $zero, 0x2c($sp)
  /* 141DF0 80132810 AFA00034 */        sw $zero, 0x34($sp)
  /* 141DF4 80132814 24040401 */     addiu $a0, $zero, 0x401
  /* 141DF8 80132818 00002825 */        or $a1, $zero, $zero
  /* 141DFC 8013281C 24060010 */     addiu $a2, $zero, 0x10
  /* 141E00 80132820 0C002E4F */       jal func_8000B93C
  /* 141E04 80132824 3C078000 */       lui $a3, 0x8000
  /* 141E08 80132828 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 141E0C 8013282C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 141E10 80132830 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 141E14 80132834 8C430074 */        lw $v1, 0x74($v0)
  /* 141E18 80132838 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 141E1C 8013283C 44050000 */      mfc1 $a1, $f0
  /* 141E20 80132840 44060000 */      mfc1 $a2, $f0
  /* 141E24 80132844 3C07439B */       lui $a3, 0x439b
  /* 141E28 80132848 24640008 */     addiu $a0, $v1, 8
  /* 141E2C 8013284C 0C001C20 */       jal func_80007080
  /* 141E30 80132850 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 141E34 80132854 8FBF003C */        lw $ra, 0x3c($sp)
  /* 141E38 80132858 27BD0040 */     addiu $sp, $sp, 0x40
  /* 141E3C 8013285C 03E00008 */        jr $ra
  /* 141E40 80132860 00000000 */       nop

glabel mnTrainingCreatePortraitBackgroundViewport
  /* 141E44 80132864 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 141E48 80132868 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 141E4C 8013286C AFBF003C */        sw $ra, 0x3c($sp)
  /* 141E50 80132870 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 141E54 80132874 240F004B */     addiu $t7, $zero, 0x4b
  /* 141E58 80132878 24180010 */     addiu $t8, $zero, 0x10
  /* 141E5C 8013287C 24190000 */     addiu $t9, $zero, 0
  /* 141E60 80132880 2408FFFF */     addiu $t0, $zero, -1
  /* 141E64 80132884 24090001 */     addiu $t1, $zero, 1
  /* 141E68 80132888 240A0001 */     addiu $t2, $zero, 1
  /* 141E6C 8013288C AFAA0030 */        sw $t2, 0x30($sp)
  /* 141E70 80132890 AFA90028 */        sw $t1, 0x28($sp)
  /* 141E74 80132894 AFA80020 */        sw $t0, 0x20($sp)
  /* 141E78 80132898 AFB9001C */        sw $t9, 0x1c($sp)
  /* 141E7C 8013289C AFB80018 */        sw $t8, 0x18($sp)
  /* 141E80 801328A0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 141E84 801328A4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 141E88 801328A8 AFA00024 */        sw $zero, 0x24($sp)
  /* 141E8C 801328AC AFA0002C */        sw $zero, 0x2c($sp)
  /* 141E90 801328B0 AFA00034 */        sw $zero, 0x34($sp)
  /* 141E94 801328B4 24040401 */     addiu $a0, $zero, 0x401
  /* 141E98 801328B8 00002825 */        or $a1, $zero, $zero
  /* 141E9C 801328BC 24060010 */     addiu $a2, $zero, 0x10
  /* 141EA0 801328C0 0C002E4F */       jal func_8000B93C
  /* 141EA4 801328C4 3C078000 */       lui $a3, 0x8000
  /* 141EA8 801328C8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 141EAC 801328CC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 141EB0 801328D0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 141EB4 801328D4 8C430074 */        lw $v1, 0x74($v0)
  /* 141EB8 801328D8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 141EBC 801328DC 44050000 */      mfc1 $a1, $f0
  /* 141EC0 801328E0 44060000 */      mfc1 $a2, $f0
  /* 141EC4 801328E4 3C07439B */       lui $a3, 0x439b
  /* 141EC8 801328E8 24640008 */     addiu $a0, $v1, 8
  /* 141ECC 801328EC 0C001C20 */       jal func_80007080
  /* 141ED0 801328F0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 141ED4 801328F4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 141ED8 801328F8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 141EDC 801328FC 03E00008 */        jr $ra
  /* 141EE0 80132900 00000000 */       nop

glabel mnTrainingCreatePortraitWhiteBackgroundViewport
  /* 141EE4 80132904 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 141EE8 80132908 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 141EEC 8013290C AFBF003C */        sw $ra, 0x3c($sp)
  /* 141EF0 80132910 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 141EF4 80132914 240F0049 */     addiu $t7, $zero, 0x49
  /* 141EF8 80132918 24180020 */     addiu $t8, $zero, 0x20
  /* 141EFC 8013291C 24190000 */     addiu $t9, $zero, 0
  /* 141F00 80132920 2408FFFF */     addiu $t0, $zero, -1
  /* 141F04 80132924 24090001 */     addiu $t1, $zero, 1
  /* 141F08 80132928 240A0001 */     addiu $t2, $zero, 1
  /* 141F0C 8013292C AFAA0030 */        sw $t2, 0x30($sp)
  /* 141F10 80132930 AFA90028 */        sw $t1, 0x28($sp)
  /* 141F14 80132934 AFA80020 */        sw $t0, 0x20($sp)
  /* 141F18 80132938 AFB9001C */        sw $t9, 0x1c($sp)
  /* 141F1C 8013293C AFB80018 */        sw $t8, 0x18($sp)
  /* 141F20 80132940 AFAF0014 */        sw $t7, 0x14($sp)
  /* 141F24 80132944 AFAE0010 */        sw $t6, 0x10($sp)
  /* 141F28 80132948 AFA00024 */        sw $zero, 0x24($sp)
  /* 141F2C 8013294C AFA0002C */        sw $zero, 0x2c($sp)
  /* 141F30 80132950 AFA00034 */        sw $zero, 0x34($sp)
  /* 141F34 80132954 24040401 */     addiu $a0, $zero, 0x401
  /* 141F38 80132958 00002825 */        or $a1, $zero, $zero
  /* 141F3C 8013295C 24060010 */     addiu $a2, $zero, 0x10
  /* 141F40 80132960 0C002E4F */       jal func_8000B93C
  /* 141F44 80132964 3C078000 */       lui $a3, 0x8000
  /* 141F48 80132968 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 141F4C 8013296C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 141F50 80132970 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 141F54 80132974 8C430074 */        lw $v1, 0x74($v0)
  /* 141F58 80132978 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 141F5C 8013297C 44050000 */      mfc1 $a1, $f0
  /* 141F60 80132980 44060000 */      mfc1 $a2, $f0
  /* 141F64 80132984 3C07439B */       lui $a3, 0x439b
  /* 141F68 80132988 24640008 */     addiu $a0, $v1, 8
  /* 141F6C 8013298C 0C001C20 */       jal func_80007080
  /* 141F70 80132990 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 141F74 80132994 8FBF003C */        lw $ra, 0x3c($sp)
  /* 141F78 80132998 27BD0040 */     addiu $sp, $sp, 0x40
  /* 141F7C 8013299C 03E00008 */        jr $ra
  /* 141F80 801329A0 00000000 */       nop

glabel mnTrainingCreatePanelDoorsViewport
  /* 141F84 801329A4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 141F88 801329A8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 141F8C 801329AC AFBF003C */        sw $ra, 0x3c($sp)
  /* 141F90 801329B0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 141F94 801329B4 240F0028 */     addiu $t7, $zero, 0x28
  /* 141F98 801329B8 24180000 */     addiu $t8, $zero, 0
  /* 141F9C 801329BC 3C192000 */       lui $t9, 0x2000
  /* 141FA0 801329C0 2408FFFF */     addiu $t0, $zero, -1
  /* 141FA4 801329C4 24090001 */     addiu $t1, $zero, 1
  /* 141FA8 801329C8 240A0001 */     addiu $t2, $zero, 1
  /* 141FAC 801329CC AFAA0030 */        sw $t2, 0x30($sp)
  /* 141FB0 801329D0 AFA90028 */        sw $t1, 0x28($sp)
  /* 141FB4 801329D4 AFA80020 */        sw $t0, 0x20($sp)
  /* 141FB8 801329D8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 141FBC 801329DC AFB80018 */        sw $t8, 0x18($sp)
  /* 141FC0 801329E0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 141FC4 801329E4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 141FC8 801329E8 AFA00024 */        sw $zero, 0x24($sp)
  /* 141FCC 801329EC AFA0002C */        sw $zero, 0x2c($sp)
  /* 141FD0 801329F0 AFA00034 */        sw $zero, 0x34($sp)
  /* 141FD4 801329F4 24040401 */     addiu $a0, $zero, 0x401
  /* 141FD8 801329F8 00002825 */        or $a1, $zero, $zero
  /* 141FDC 801329FC 24060010 */     addiu $a2, $zero, 0x10
  /* 141FE0 80132A00 0C002E4F */       jal func_8000B93C
  /* 141FE4 80132A04 3C078000 */       lui $a3, 0x8000
  /* 141FE8 80132A08 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 141FEC 80132A0C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 141FF0 80132A10 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 141FF4 80132A14 8C430074 */        lw $v1, 0x74($v0)
  /* 141FF8 80132A18 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 141FFC 80132A1C 44050000 */      mfc1 $a1, $f0
  /* 142000 80132A20 44060000 */      mfc1 $a2, $f0
  /* 142004 80132A24 3C07439B */       lui $a3, 0x439b
  /* 142008 80132A28 24640008 */     addiu $a0, $v1, 8
  /* 14200C 80132A2C 0C001C20 */       jal func_80007080
  /* 142010 80132A30 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 142014 80132A34 8FBF003C */        lw $ra, 0x3c($sp)
  /* 142018 80132A38 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14201C 80132A3C 03E00008 */        jr $ra
  /* 142020 80132A40 00000000 */       nop

glabel mnTrainingCreateTypeButtonViewport
  /* 142024 80132A44 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 142028 80132A48 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 14202C 80132A4C AFBF003C */        sw $ra, 0x3c($sp)
  /* 142030 80132A50 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 142034 80132A54 240F0023 */     addiu $t7, $zero, 0x23
  /* 142038 80132A58 24180000 */     addiu $t8, $zero, 0
  /* 14203C 80132A5C 3C194000 */       lui $t9, 0x4000
  /* 142040 80132A60 2408FFFF */     addiu $t0, $zero, -1
  /* 142044 80132A64 24090001 */     addiu $t1, $zero, 1
  /* 142048 80132A68 240A0001 */     addiu $t2, $zero, 1
  /* 14204C 80132A6C AFAA0030 */        sw $t2, 0x30($sp)
  /* 142050 80132A70 AFA90028 */        sw $t1, 0x28($sp)
  /* 142054 80132A74 AFA80020 */        sw $t0, 0x20($sp)
  /* 142058 80132A78 AFB9001C */        sw $t9, 0x1c($sp)
  /* 14205C 80132A7C AFB80018 */        sw $t8, 0x18($sp)
  /* 142060 80132A80 AFAF0014 */        sw $t7, 0x14($sp)
  /* 142064 80132A84 AFAE0010 */        sw $t6, 0x10($sp)
  /* 142068 80132A88 AFA00024 */        sw $zero, 0x24($sp)
  /* 14206C 80132A8C AFA0002C */        sw $zero, 0x2c($sp)
  /* 142070 80132A90 AFA00034 */        sw $zero, 0x34($sp)
  /* 142074 80132A94 24040401 */     addiu $a0, $zero, 0x401
  /* 142078 80132A98 00002825 */        or $a1, $zero, $zero
  /* 14207C 80132A9C 24060010 */     addiu $a2, $zero, 0x10
  /* 142080 80132AA0 0C002E4F */       jal func_8000B93C
  /* 142084 80132AA4 3C078000 */       lui $a3, 0x8000
  /* 142088 80132AA8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14208C 80132AAC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 142090 80132AB0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 142094 80132AB4 8C430074 */        lw $v1, 0x74($v0)
  /* 142098 80132AB8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14209C 80132ABC 44050000 */      mfc1 $a1, $f0
  /* 1420A0 80132AC0 44060000 */      mfc1 $a2, $f0
  /* 1420A4 80132AC4 3C07439B */       lui $a3, 0x439b
  /* 1420A8 80132AC8 24640008 */     addiu $a0, $v1, 8
  /* 1420AC 80132ACC 0C001C20 */       jal func_80007080
  /* 1420B0 80132AD0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1420B4 80132AD4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1420B8 80132AD8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1420BC 80132ADC 03E00008 */        jr $ra
  /* 1420C0 80132AE0 00000000 */       nop

glabel mnTrainingCreatePanelViewport
  /* 1420C4 80132AE4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1420C8 80132AE8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1420CC 80132AEC AFBF003C */        sw $ra, 0x3c($sp)
  /* 1420D0 80132AF0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1420D4 80132AF4 240F0032 */     addiu $t7, $zero, 0x32
  /* 1420D8 80132AF8 24180000 */     addiu $t8, $zero, 0
  /* 1420DC 80132AFC 3C191000 */       lui $t9, 0x1000
  /* 1420E0 80132B00 2408FFFF */     addiu $t0, $zero, -1
  /* 1420E4 80132B04 24090001 */     addiu $t1, $zero, 1
  /* 1420E8 80132B08 240A0001 */     addiu $t2, $zero, 1
  /* 1420EC 80132B0C AFAA0030 */        sw $t2, 0x30($sp)
  /* 1420F0 80132B10 AFA90028 */        sw $t1, 0x28($sp)
  /* 1420F4 80132B14 AFA80020 */        sw $t0, 0x20($sp)
  /* 1420F8 80132B18 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1420FC 80132B1C AFB80018 */        sw $t8, 0x18($sp)
  /* 142100 80132B20 AFAF0014 */        sw $t7, 0x14($sp)
  /* 142104 80132B24 AFAE0010 */        sw $t6, 0x10($sp)
  /* 142108 80132B28 AFA00024 */        sw $zero, 0x24($sp)
  /* 14210C 80132B2C AFA0002C */        sw $zero, 0x2c($sp)
  /* 142110 80132B30 AFA00034 */        sw $zero, 0x34($sp)
  /* 142114 80132B34 24040401 */     addiu $a0, $zero, 0x401
  /* 142118 80132B38 00002825 */        or $a1, $zero, $zero
  /* 14211C 80132B3C 24060010 */     addiu $a2, $zero, 0x10
  /* 142120 80132B40 0C002E4F */       jal func_8000B93C
  /* 142124 80132B44 3C078000 */       lui $a3, 0x8000
  /* 142128 80132B48 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14212C 80132B4C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 142130 80132B50 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 142134 80132B54 8C430074 */        lw $v1, 0x74($v0)
  /* 142138 80132B58 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14213C 80132B5C 44050000 */      mfc1 $a1, $f0
  /* 142140 80132B60 44060000 */      mfc1 $a2, $f0
  /* 142144 80132B64 3C07439B */       lui $a3, 0x439b
  /* 142148 80132B68 24640008 */     addiu $a0, $v1, 8
  /* 14214C 80132B6C 0C001C20 */       jal func_80007080
  /* 142150 80132B70 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 142154 80132B74 8FBF003C */        lw $ra, 0x3c($sp)
  /* 142158 80132B78 27BD0040 */     addiu $sp, $sp, 0x40
  /* 14215C 80132B7C 03E00008 */        jr $ra
  /* 142160 80132B80 00000000 */       nop

glabel mnTrainingCreateTeamButtonViewPort
  /* 142164 80132B84 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 142168 80132B88 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 14216C 80132B8C AFBF003C */        sw $ra, 0x3c($sp)
  /* 142170 80132B90 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 142174 80132B94 240F002D */     addiu $t7, $zero, 0x2d
  /* 142178 80132B98 24180004 */     addiu $t8, $zero, 4
  /* 14217C 80132B9C 24190000 */     addiu $t9, $zero, 0
  /* 142180 80132BA0 2408FFFF */     addiu $t0, $zero, -1
  /* 142184 80132BA4 24090001 */     addiu $t1, $zero, 1
  /* 142188 80132BA8 240A0001 */     addiu $t2, $zero, 1
  /* 14218C 80132BAC AFAA0030 */        sw $t2, 0x30($sp)
  /* 142190 80132BB0 AFA90028 */        sw $t1, 0x28($sp)
  /* 142194 80132BB4 AFA80020 */        sw $t0, 0x20($sp)
  /* 142198 80132BB8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 14219C 80132BBC AFB80018 */        sw $t8, 0x18($sp)
  /* 1421A0 80132BC0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1421A4 80132BC4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1421A8 80132BC8 AFA00024 */        sw $zero, 0x24($sp)
  /* 1421AC 80132BCC AFA0002C */        sw $zero, 0x2c($sp)
  /* 1421B0 80132BD0 AFA00034 */        sw $zero, 0x34($sp)
  /* 1421B4 80132BD4 24040401 */     addiu $a0, $zero, 0x401
  /* 1421B8 80132BD8 00002825 */        or $a1, $zero, $zero
  /* 1421BC 80132BDC 24060010 */     addiu $a2, $zero, 0x10
  /* 1421C0 80132BE0 0C002E4F */       jal func_8000B93C
  /* 1421C4 80132BE4 3C078000 */       lui $a3, 0x8000
  /* 1421C8 80132BE8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1421CC 80132BEC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1421D0 80132BF0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1421D4 80132BF4 8C430074 */        lw $v1, 0x74($v0)
  /* 1421D8 80132BF8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1421DC 80132BFC 44050000 */      mfc1 $a1, $f0
  /* 1421E0 80132C00 44060000 */      mfc1 $a2, $f0
  /* 1421E4 80132C04 3C07439B */       lui $a3, 0x439b
  /* 1421E8 80132C08 24640008 */     addiu $a0, $v1, 8
  /* 1421EC 80132C0C 0C001C20 */       jal func_80007080
  /* 1421F0 80132C10 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1421F4 80132C14 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1421F8 80132C18 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1421FC 80132C1C 03E00008 */        jr $ra
  /* 142200 80132C20 00000000 */       nop

glabel mnTrainingUpdatePanel
  /* 142204 80132C24 3C0E8014 */       lui $t6, %hi(dMNTrainingPanelLUTOffsets)
  /* 142208 80132C28 25CE8214 */     addiu $t6, $t6, %lo(dMNTrainingPanelLUTOffsets)
  /* 14220C 80132C2C 8DD80000 */        lw $t8, ($t6) # dMNTrainingPanelLUTOffsets + 0
  /* 142210 80132C30 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 142214 80132C34 27A60004 */     addiu $a2, $sp, 4
  /* 142218 80132C38 ACD80000 */        sw $t8, ($a2)
  /* 14221C 80132C3C 8DCF0004 */        lw $t7, 4($t6) # dMNTrainingPanelLUTOffsets + 4
  /* 142220 80132C40 3C038014 */       lui $v1, %hi(gMNTrainingHumanPanelPort)
  /* 142224 80132C44 3C0A8014 */       lui $t2, %hi(D_ovl28_80138C98)
  /* 142228 80132C48 ACCF0004 */        sw $t7, 4($a2)
  /* 14222C 80132C4C 8DD80008 */        lw $t8, 8($t6) # dMNTrainingPanelLUTOffsets + 8
  /* 142230 80132C50 ACD80008 */        sw $t8, 8($a2)
  /* 142234 80132C54 8DCF000C */        lw $t7, 0xc($t6) # dMNTrainingPanelLUTOffsets + 12
  /* 142238 80132C58 ACCF000C */        sw $t7, 0xc($a2)
  /* 14223C 80132C5C 8C638894 */        lw $v1, %lo(gMNTrainingHumanPanelPort)($v1)
  /* 142240 80132C60 8C820074 */        lw $v0, 0x74($a0)
  /* 142244 80132C64 14A30007 */       bne $a1, $v1, .L80132C84
  /* 142248 80132C68 0003C880 */       sll $t9, $v1, 2
  /* 14224C 80132C6C 00D94021 */      addu $t0, $a2, $t9
  /* 142250 80132C70 8D090000 */        lw $t1, ($t0)
  /* 142254 80132C74 8D4A8C98 */        lw $t2, %lo(D_ovl28_80138C98)($t2)
  /* 142258 80132C78 012A5821 */      addu $t3, $t1, $t2
  /* 14225C 80132C7C 10000007 */         b .L80132C9C
  /* 142260 80132C80 AC4B0030 */        sw $t3, 0x30($v0)
  .L80132C84:
  /* 142264 80132C84 3C0C8014 */       lui $t4, %hi(D_ovl28_80138C9C)
  /* 142268 80132C88 8D8C8C9C */        lw $t4, %lo(D_ovl28_80138C9C)($t4)
  /* 14226C 80132C8C 3C0D0000 */       lui $t5, %hi(D_NF_00003238)
  /* 142270 80132C90 25AD3238 */     addiu $t5, $t5, %lo(D_NF_00003238)
  /* 142274 80132C94 018D7021 */      addu $t6, $t4, $t5
  /* 142278 80132C98 AC4E0030 */        sw $t6, 0x30($v0)
  .L80132C9C:
  /* 14227C 80132C9C 03E00008 */        jr $ra
  /* 142280 80132CA0 27BD0018 */     addiu $sp, $sp, 0x18

glabel mnTrainingCreateTypeImage
  /* 142284 80132CA4 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 142288 80132CA8 3C0F8014 */       lui $t7, %hi(dMNTrainingTypeOffsets)
  /* 14228C 80132CAC AFBF001C */        sw $ra, 0x1c($sp)
  /* 142290 80132CB0 AFA40050 */        sw $a0, 0x50($sp)
  /* 142294 80132CB4 25EF8224 */     addiu $t7, $t7, %lo(dMNTrainingTypeOffsets)
  /* 142298 80132CB8 8DF90000 */        lw $t9, ($t7) # dMNTrainingTypeOffsets + 0
  /* 14229C 80132CBC 8DF80004 */        lw $t8, 4($t7) # dMNTrainingTypeOffsets + 4
  /* 1422A0 80132CC0 27AE0038 */     addiu $t6, $sp, 0x38
  /* 1422A4 80132CC4 ADD90000 */        sw $t9, ($t6)
  /* 1422A8 80132CC8 ADD80004 */        sw $t8, 4($t6)
  /* 1422AC 80132CCC 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingTypeOffsets + 12
  /* 1422B0 80132CD0 8DF90008 */        lw $t9, 8($t7) # dMNTrainingTypeOffsets + 8
  /* 1422B4 80132CD4 3C098014 */       lui $t1, %hi(dMNTrainingTypeOffsetsX)
  /* 1422B8 80132CD8 25298234 */     addiu $t1, $t1, %lo(dMNTrainingTypeOffsetsX)
  /* 1422BC 80132CDC ADD8000C */        sw $t8, 0xc($t6)
  /* 1422C0 80132CE0 ADD90008 */        sw $t9, 8($t6)
  /* 1422C4 80132CE4 8D2A0004 */        lw $t2, 4($t1) # dMNTrainingTypeOffsetsX + 4
  /* 1422C8 80132CE8 8D2B0000 */        lw $t3, ($t1) # dMNTrainingTypeOffsetsX + 0
  /* 1422CC 80132CEC 27A80028 */     addiu $t0, $sp, 0x28
  /* 1422D0 80132CF0 AD0A0004 */        sw $t2, 4($t0)
  /* 1422D4 80132CF4 AD0B0000 */        sw $t3, ($t0)
  /* 1422D8 80132CF8 8D2B0008 */        lw $t3, 8($t1) # dMNTrainingTypeOffsetsX + 8
  /* 1422DC 80132CFC 8D2A000C */        lw $t2, 0xc($t1) # dMNTrainingTypeOffsetsX + 12
  /* 1422E0 80132D00 00002025 */        or $a0, $zero, $zero
  /* 1422E4 80132D04 00002825 */        or $a1, $zero, $zero
  /* 1422E8 80132D08 24060016 */     addiu $a2, $zero, 0x16
  /* 1422EC 80132D0C 3C078000 */       lui $a3, 0x8000
  /* 1422F0 80132D10 AD0B0008 */        sw $t3, 8($t0)
  /* 1422F4 80132D14 0C00265A */       jal omMakeGObjSPAfter
  /* 1422F8 80132D18 AD0A000C */        sw $t2, 0xc($t0)
  /* 1422FC 80132D1C 8FAC0050 */        lw $t4, 0x50($sp)
  /* 142300 80132D20 3C018014 */       lui $at, %hi(D_ovl28_80138588)
  /* 142304 80132D24 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 142308 80132D28 000C6880 */       sll $t5, $t4, 2
  /* 14230C 80132D2C 01AC6823 */      subu $t5, $t5, $t4
  /* 142310 80132D30 000D68C0 */       sll $t5, $t5, 3
  /* 142314 80132D34 01AC6823 */      subu $t5, $t5, $t4
  /* 142318 80132D38 000D68C0 */       sll $t5, $t5, 3
  /* 14231C 80132D3C 002D0821 */      addu $at, $at, $t5
  /* 142320 80132D40 240EFFFF */     addiu $t6, $zero, -1
  /* 142324 80132D44 AC228588 */        sw $v0, %lo(D_ovl28_80138588)($at)
  /* 142328 80132D48 AFA2004C */        sw $v0, 0x4c($sp)
  /* 14232C 80132D4C AFAE0010 */        sw $t6, 0x10($sp)
  /* 142330 80132D50 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 142334 80132D54 00402025 */        or $a0, $v0, $zero
  /* 142338 80132D58 2406001C */     addiu $a2, $zero, 0x1c
  /* 14233C 80132D5C 0C00277D */       jal omAddGObjRenderProc
  /* 142340 80132D60 3C078000 */       lui $a3, 0x8000
  /* 142344 80132D64 3C028014 */       lui $v0, %hi(gMNTrainingHumanPanelPort)
  /* 142348 80132D68 8C428894 */        lw $v0, %lo(gMNTrainingHumanPanelPort)($v0)
  /* 14234C 80132D6C 8FAF0050 */        lw $t7, 0x50($sp)
  /* 142350 80132D70 8FA4004C */        lw $a0, 0x4c($sp)
  /* 142354 80132D74 3C0C8014 */       lui $t4, 0x8014
  /* 142358 80132D78 15E20014 */       bne $t7, $v0, .L80132DCC
  /* 14235C 80132D7C 3C0D0000 */       lui $t5, 0
  /* 142360 80132D80 0002C080 */       sll $t8, $v0, 2
  /* 142364 80132D84 03B8C821 */      addu $t9, $sp, $t8
  /* 142368 80132D88 3C088014 */       lui $t0, %hi(D_ovl28_80138C98)
  /* 14236C 80132D8C 8D088C98 */        lw $t0, %lo(D_ovl28_80138C98)($t0)
  /* 142370 80132D90 8F390038 */        lw $t9, 0x38($t9)
  /* 142374 80132D94 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 142378 80132D98 03282821 */      addu $a1, $t9, $t0
  /* 14237C 80132D9C 8FA90050 */        lw $t1, 0x50($sp)
  /* 142380 80132DA0 3C014254 */       lui $at, (0x42540000 >> 16) # 53.0
  /* 142384 80132DA4 44813000 */      mtc1 $at, $f6 # 53.0 to cop1
  /* 142388 80132DA8 00095080 */       sll $t2, $t1, 2
  /* 14238C 80132DAC 03AA5821 */      addu $t3, $sp, $t2
  /* 142390 80132DB0 C5640028 */      lwc1 $f4, 0x28($t3)
  /* 142394 80132DB4 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 142398 80132DB8 44815000 */      mtc1 $at, $f10 # 131.0 to cop1
  /* 14239C 80132DBC 46062200 */     add.s $f8, $f4, $f6
  /* 1423A0 80132DC0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 1423A4 80132DC4 1000000B */         b .L80132DF4
  /* 1423A8 80132DC8 E4480058 */      swc1 $f8, 0x58($v0)
  .L80132DCC:
  /* 1423AC 80132DCC 8D8C8C98 */        lw $t4, -0x7368($t4)
  /* 1423B0 80132DD0 25AD0FF8 */     addiu $t5, $t5, 0xff8
  /* 1423B4 80132DD4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1423B8 80132DD8 018D2821 */      addu $a1, $t4, $t5
  /* 1423BC 80132DDC 3C014340 */       lui $at, (0x43400000 >> 16) # 192.0
  /* 1423C0 80132DE0 44818000 */      mtc1 $at, $f16 # 192.0 to cop1
  /* 1423C4 80132DE4 3C014304 */       lui $at, (0x43040000 >> 16) # 132.0
  /* 1423C8 80132DE8 44819000 */      mtc1 $at, $f18 # 132.0 to cop1
  /* 1423CC 80132DEC E4500058 */      swc1 $f16, 0x58($v0)
  /* 1423D0 80132DF0 E452005C */      swc1 $f18, 0x5c($v0)
  .L80132DF4:
  /* 1423D4 80132DF4 944E0024 */       lhu $t6, 0x24($v0)
  /* 1423D8 80132DF8 A0400028 */        sb $zero, 0x28($v0)
  /* 1423DC 80132DFC A0400029 */        sb $zero, 0x29($v0)
  /* 1423E0 80132E00 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 1423E4 80132E04 A4580024 */        sh $t8, 0x24($v0)
  /* 1423E8 80132E08 37190001 */       ori $t9, $t8, 1
  /* 1423EC 80132E0C A4590024 */        sh $t9, 0x24($v0)
  /* 1423F0 80132E10 A040002A */        sb $zero, 0x2a($v0)
  /* 1423F4 80132E14 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1423F8 80132E18 27BD0050 */     addiu $sp, $sp, 0x50
  /* 1423FC 80132E1C 03E00008 */        jr $ra
  /* 142400 80132E20 00000000 */       nop

glabel mnTrainingCreatePanel
  /* 142404 80132E24 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 142408 80132E28 3C0F8014 */       lui $t7, %hi(dMNTrainingTypeOffsetsDuplicate)
  /* 14240C 80132E2C AFBF003C */        sw $ra, 0x3c($sp)
  /* 142410 80132E30 AFB00038 */        sw $s0, 0x38($sp)
  /* 142414 80132E34 25EF8244 */     addiu $t7, $t7, %lo(dMNTrainingTypeOffsetsDuplicate)
  /* 142418 80132E38 8DF90000 */        lw $t9, ($t7) # dMNTrainingTypeOffsetsDuplicate + 0
  /* 14241C 80132E3C 8DF80004 */        lw $t8, 4($t7) # dMNTrainingTypeOffsetsDuplicate + 4
  /* 142420 80132E40 27AE0058 */     addiu $t6, $sp, 0x58
  /* 142424 80132E44 ADD90000 */        sw $t9, ($t6)
  /* 142428 80132E48 ADD80004 */        sw $t8, 4($t6)
  /* 14242C 80132E4C 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingTypeOffsetsDuplicate + 12
  /* 142430 80132E50 8DF90008 */        lw $t9, 8($t7) # dMNTrainingTypeOffsetsDuplicate + 8
  /* 142434 80132E54 3C098014 */       lui $t1, %hi(dMNTrainingTypeOffsetsXDuplicate)
  /* 142438 80132E58 25298254 */     addiu $t1, $t1, %lo(dMNTrainingTypeOffsetsXDuplicate)
  /* 14243C 80132E5C ADD8000C */        sw $t8, 0xc($t6)
  /* 142440 80132E60 ADD90008 */        sw $t9, 8($t6)
  /* 142444 80132E64 8D2A0004 */        lw $t2, 4($t1) # dMNTrainingTypeOffsetsXDuplicate + 4
  /* 142448 80132E68 8D2B0000 */        lw $t3, ($t1) # dMNTrainingTypeOffsetsXDuplicate + 0
  /* 14244C 80132E6C 27A80048 */     addiu $t0, $sp, 0x48
  /* 142450 80132E70 AD0A0004 */        sw $t2, 4($t0)
  /* 142454 80132E74 AD0B0000 */        sw $t3, ($t0)
  /* 142458 80132E78 8D2B0008 */        lw $t3, 8($t1) # dMNTrainingTypeOffsetsXDuplicate + 8
  /* 14245C 80132E7C 8D2A000C */        lw $t2, 0xc($t1) # dMNTrainingTypeOffsetsXDuplicate + 12
  /* 142460 80132E80 3C0E8014 */       lui $t6, %hi(D_ovl28_80138C9C)
  /* 142464 80132E84 AD0B0008 */        sw $t3, 8($t0)
  /* 142468 80132E88 AD0A000C */        sw $t2, 0xc($t0)
  /* 14246C 80132E8C 8DCE8C9C */        lw $t6, %lo(D_ovl28_80138C9C)($t6)
  /* 142470 80132E90 3C0F0000 */       lui $t7, %hi(D_NF_000032A8)
  /* 142474 80132E94 25EF32A8 */     addiu $t7, $t7, %lo(D_NF_000032A8)
  /* 142478 80132E98 3C02800D */       lui $v0, %hi(func_ovl0_800CCF00)
  /* 14247C 80132E9C 00808025 */        or $s0, $a0, $zero
  /* 142480 80132EA0 3C078000 */       lui $a3, 0x8000
  /* 142484 80132EA4 2442CF00 */     addiu $v0, $v0, %lo(func_ovl0_800CCF00)
  /* 142488 80132EA8 24080001 */     addiu $t0, $zero, 1
  /* 14248C 80132EAC 24190001 */     addiu $t9, $zero, 1
  /* 142490 80132EB0 240C001C */     addiu $t4, $zero, 0x1c
  /* 142494 80132EB4 240DFFFF */     addiu $t5, $zero, -1
  /* 142498 80132EB8 01CFC021 */      addu $t8, $t6, $t7
  /* 14249C 80132EBC AFB80020 */        sw $t8, 0x20($sp)
  /* 1424A0 80132EC0 AFAD001C */        sw $t5, 0x1c($sp)
  /* 1424A4 80132EC4 AFAC0014 */        sw $t4, 0x14($sp)
  /* 1424A8 80132EC8 AFB90024 */        sw $t9, 0x24($sp)
  /* 1424AC 80132ECC AFA8002C */        sw $t0, 0x2c($sp)
  /* 1424B0 80132ED0 AFA20010 */        sw $v0, 0x10($sp)
  /* 1424B4 80132ED4 AFA20044 */        sw $v0, 0x44($sp)
  /* 1424B8 80132ED8 AFA70018 */        sw $a3, 0x18($sp)
  /* 1424BC 80132EDC 00002025 */        or $a0, $zero, $zero
  /* 1424C0 80132EE0 AFA00028 */        sw $zero, 0x28($sp)
  /* 1424C4 80132EE4 00002825 */        or $a1, $zero, $zero
  /* 1424C8 80132EE8 0C033414 */       jal func_ovl0_800CD050
  /* 1424CC 80132EEC 24060016 */     addiu $a2, $zero, 0x16
  /* 1424D0 80132EF0 00104880 */       sll $t1, $s0, 2
  /* 1424D4 80132EF4 01304823 */      subu $t1, $t1, $s0
  /* 1424D8 80132EF8 000948C0 */       sll $t1, $t1, 3
  /* 1424DC 80132EFC 01304823 */      subu $t1, $t1, $s0
  /* 1424E0 80132F00 3C0A8014 */       lui $t2, %hi(gMNTrainingPanels)
  /* 1424E4 80132F04 254A8558 */     addiu $t2, $t2, %lo(gMNTrainingPanels)
  /* 1424E8 80132F08 000948C0 */       sll $t1, $t1, 3
  /* 1424EC 80132F0C 012A3021 */      addu $a2, $t1, $t2
  /* 1424F0 80132F10 ACC20018 */        sw $v0, 0x18($a2)
  /* 1424F4 80132F14 8C430074 */        lw $v1, 0x74($v0)
  /* 1424F8 80132F18 3C0F8014 */       lui $t7, %hi(gMNTrainingHumanPanelPort)
  /* 1424FC 80132F1C 00402025 */        or $a0, $v0, $zero
  /* 142500 80132F20 946B0024 */       lhu $t3, 0x24($v1)
  /* 142504 80132F24 3C014339 */       lui $at, (0x43390000 >> 16) # 185.0
  /* 142508 80132F28 02002825 */        or $a1, $s0, $zero
  /* 14250C 80132F2C 316CFFDF */      andi $t4, $t3, 0xffdf
  /* 142510 80132F30 A46C0024 */        sh $t4, 0x24($v1)
  /* 142514 80132F34 8C430074 */        lw $v1, 0x74($v0)
  /* 142518 80132F38 946D0024 */       lhu $t5, 0x24($v1)
  /* 14251C 80132F3C 35AE0001 */       ori $t6, $t5, 1
  /* 142520 80132F40 A46E0024 */        sh $t6, 0x24($v1)
  /* 142524 80132F44 8DEF8894 */        lw $t7, %lo(gMNTrainingHumanPanelPort)($t7)
  /* 142528 80132F48 560F000B */      bnel $s0, $t7, .L80132F78
  /* 14252C 80132F4C 44814000 */      mtc1 $at, $f8 # 185.0 to cop1
  /* 142530 80132F50 3C014254 */       lui $at, (0x42540000 >> 16) # 53.0
  /* 142534 80132F54 44812000 */      mtc1 $at, $f4 # 53.0 to cop1
  /* 142538 80132F58 8C580074 */        lw $t8, 0x74($v0)
  /* 14253C 80132F5C 3C0142FE */       lui $at, (0x42FE0000 >> 16) # 127.0
  /* 142540 80132F60 44813000 */      mtc1 $at, $f6 # 127.0 to cop1
  /* 142544 80132F64 E7040058 */      swc1 $f4, 0x58($t8)
  /* 142548 80132F68 8C590074 */        lw $t9, 0x74($v0)
  /* 14254C 80132F6C 10000008 */         b .L80132F90
  /* 142550 80132F70 E726005C */      swc1 $f6, 0x5c($t9)
  /* 142554 80132F74 44814000 */      mtc1 $at, $f8 # 127.0 to cop1
  .L80132F78:
  /* 142558 80132F78 8C480074 */        lw $t0, 0x74($v0)
  /* 14255C 80132F7C 3C0142FE */       lui $at, (0x42FE0000 >> 16) # 127.0
  /* 142560 80132F80 44815000 */      mtc1 $at, $f10 # 127.0 to cop1
  /* 142564 80132F84 E5080058 */      swc1 $f8, 0x58($t0)
  /* 142568 80132F88 8C490074 */        lw $t1, 0x74($v0)
  /* 14256C 80132F8C E52A005C */      swc1 $f10, 0x5c($t1)
  .L80132F90:
  /* 142570 80132F90 0C04CB09 */       jal mnTrainingUpdatePanel
  /* 142574 80132F94 AFA60040 */        sw $a2, 0x40($sp)
  /* 142578 80132F98 0C04CB29 */       jal mnTrainingCreateTypeImage
  /* 14257C 80132F9C 02002025 */        or $a0, $s0, $zero
  /* 142580 80132FA0 00002025 */        or $a0, $zero, $zero
  /* 142584 80132FA4 00002825 */        or $a1, $zero, $zero
  /* 142588 80132FA8 24060016 */     addiu $a2, $zero, 0x16
  /* 14258C 80132FAC 0C00265A */       jal omMakeGObjSPAfter
  /* 142590 80132FB0 3C078000 */       lui $a3, 0x8000
  /* 142594 80132FB4 8FAA0040 */        lw $t2, 0x40($sp)
  /* 142598 80132FB8 240BFFFF */     addiu $t3, $zero, -1
  /* 14259C 80132FBC 00402025 */        or $a0, $v0, $zero
  /* 1425A0 80132FC0 AD420010 */        sw $v0, 0x10($t2)
  /* 1425A4 80132FC4 AFAB0010 */        sw $t3, 0x10($sp)
  /* 1425A8 80132FC8 8FA50044 */        lw $a1, 0x44($sp)
  /* 1425AC 80132FCC 2406001C */     addiu $a2, $zero, 0x1c
  /* 1425B0 80132FD0 0C00277D */       jal omAddGObjRenderProc
  /* 1425B4 80132FD4 3C078000 */       lui $a3, 0x8000
  /* 1425B8 80132FD8 0C04CFB8 */       jal mnTrainingSyncNameAndLogo
  /* 1425BC 80132FDC 02002025 */        or $a0, $s0, $zero
  /* 1425C0 80132FE0 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1425C4 80132FE4 8FB00038 */        lw $s0, 0x38($sp)
  /* 1425C8 80132FE8 27BD0070 */     addiu $sp, $sp, 0x70
  /* 1425CC 80132FEC 03E00008 */        jr $ra
  /* 1425D0 80132FF0 00000000 */       nop

  /* 1425D4 80132FF4 03E00008 */        jr $ra
  /* 1425D8 80132FF8 00000000 */       nop

  /* 1425DC 80132FFC 03E00008 */        jr $ra
  /* 1425E0 80133000 00000000 */       nop

  /* 1425E4 80133004 03E00008 */        jr $ra
  /* 1425E8 80133008 00000000 */       nop

  /* 1425EC 8013300C 03E00008 */        jr $ra
  /* 1425F0 80133010 00000000 */       nop

glabel mnTrainingCreateBackground
  /* 1425F4 80133014 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 1425F8 80133018 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1425FC 8013301C AFBF003C */        sw $ra, 0x3c($sp)
  /* 142600 80133020 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 142604 80133024 240F0050 */     addiu $t7, $zero, 0x50
  /* 142608 80133028 24180000 */     addiu $t8, $zero, 0
  /* 14260C 8013302C 3C190400 */       lui $t9, 0x400
  /* 142610 80133030 2408FFFF */     addiu $t0, $zero, -1
  /* 142614 80133034 24090001 */     addiu $t1, $zero, 1
  /* 142618 80133038 240A0001 */     addiu $t2, $zero, 1
  /* 14261C 8013303C AFAA0030 */        sw $t2, 0x30($sp)
  /* 142620 80133040 AFA90028 */        sw $t1, 0x28($sp)
  /* 142624 80133044 AFA80020 */        sw $t0, 0x20($sp)
  /* 142628 80133048 AFB9001C */        sw $t9, 0x1c($sp)
  /* 14262C 8013304C AFB80018 */        sw $t8, 0x18($sp)
  /* 142630 80133050 AFAF0014 */        sw $t7, 0x14($sp)
  /* 142634 80133054 AFAE0010 */        sw $t6, 0x10($sp)
  /* 142638 80133058 AFA00024 */        sw $zero, 0x24($sp)
  /* 14263C 8013305C AFA0002C */        sw $zero, 0x2c($sp)
  /* 142640 80133060 AFA00034 */        sw $zero, 0x34($sp)
  /* 142644 80133064 24040401 */     addiu $a0, $zero, 0x401
  /* 142648 80133068 00002825 */        or $a1, $zero, $zero
  /* 14264C 8013306C 24060010 */     addiu $a2, $zero, 0x10
  /* 142650 80133070 0C002E4F */       jal func_8000B93C
  /* 142654 80133074 3C078000 */       lui $a3, 0x8000
  /* 142658 80133078 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14265C 8013307C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 142660 80133080 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 142664 80133084 8C430074 */        lw $v1, 0x74($v0)
  /* 142668 80133088 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 14266C 8013308C 44050000 */      mfc1 $a1, $f0
  /* 142670 80133090 44060000 */      mfc1 $a2, $f0
  /* 142674 80133094 3C07439B */       lui $a3, 0x439b
  /* 142678 80133098 24640008 */     addiu $a0, $v1, 8
  /* 14267C 8013309C 0C001C20 */       jal func_80007080
  /* 142680 801330A0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 142684 801330A4 00002025 */        or $a0, $zero, $zero
  /* 142688 801330A8 00002825 */        or $a1, $zero, $zero
  /* 14268C 801330AC 24060011 */     addiu $a2, $zero, 0x11
  /* 142690 801330B0 0C00265A */       jal omMakeGObjSPAfter
  /* 142694 801330B4 3C078000 */       lui $a3, 0x8000
  /* 142698 801330B8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 14269C 801330BC 240BFFFF */     addiu $t3, $zero, -1
  /* 1426A0 801330C0 AFA20044 */        sw $v0, 0x44($sp)
  /* 1426A4 801330C4 AFAB0010 */        sw $t3, 0x10($sp)
  /* 1426A8 801330C8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1426AC 801330CC 00402025 */        or $a0, $v0, $zero
  /* 1426B0 801330D0 2406001A */     addiu $a2, $zero, 0x1a
  /* 1426B4 801330D4 0C00277D */       jal omAddGObjRenderProc
  /* 1426B8 801330D8 3C078000 */       lui $a3, 0x8000
  /* 1426BC 801330DC 3C0C8014 */       lui $t4, %hi(D_ovl28_80138CA8)
  /* 1426C0 801330E0 8D8C8CA8 */        lw $t4, %lo(D_ovl28_80138CA8)($t4)
  /* 1426C4 801330E4 3C0D0000 */       lui $t5, %hi(D_NF_00000440)
  /* 1426C8 801330E8 25AD0440 */     addiu $t5, $t5, %lo(D_NF_00000440)
  /* 1426CC 801330EC 8FA40044 */        lw $a0, 0x44($sp)
  /* 1426D0 801330F0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1426D4 801330F4 018D2821 */      addu $a1, $t4, $t5
  /* 1426D8 801330F8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1426DC 801330FC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1426E0 80133100 240E0006 */     addiu $t6, $zero, 6
  /* 1426E4 80133104 240F0005 */     addiu $t7, $zero, 5
  /* 1426E8 80133108 2418012C */     addiu $t8, $zero, 0x12c
  /* 1426EC 8013310C 241900DC */     addiu $t9, $zero, 0xdc
  /* 1426F0 80133110 A0400065 */        sb $zero, 0x65($v0)
  /* 1426F4 80133114 A0400064 */        sb $zero, 0x64($v0)
  /* 1426F8 80133118 A04E0067 */        sb $t6, 0x67($v0)
  /* 1426FC 8013311C A04F0066 */        sb $t7, 0x66($v0)
  /* 142700 80133120 A4580068 */        sh $t8, 0x68($v0)
  /* 142704 80133124 A459006A */        sh $t9, 0x6a($v0)
  /* 142708 80133128 E4400058 */      swc1 $f0, 0x58($v0)
  /* 14270C 8013312C E440005C */      swc1 $f0, 0x5c($v0)
  /* 142710 80133130 8FBF003C */        lw $ra, 0x3c($sp)
  /* 142714 80133134 27BD0048 */     addiu $sp, $sp, 0x48
  /* 142718 80133138 03E00008 */        jr $ra
  /* 14271C 8013313C 00000000 */       nop

glabel mnTrainingDrawTitleAndBack
  /* 142720 80133140 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 142724 80133144 3C188014 */       lui $t8, %hi(D_ovl28_80138CAC)
  /* 142728 80133148 8F188CAC */        lw $t8, %lo(D_ovl28_80138CAC)($t8)
  /* 14272C 8013314C 3C190000 */       lui $t9, %hi(D_NF_00000758)
  /* 142730 80133150 27390758 */     addiu $t9, $t9, %lo(D_NF_00000758)
  /* 142734 80133154 3C08800D */       lui $t0, %hi(func_ovl0_800CCF00)
  /* 142738 80133158 AFBF0034 */        sw $ra, 0x34($sp)
  /* 14273C 8013315C 3C078000 */       lui $a3, 0x8000
  /* 142740 80133160 2508CF00 */     addiu $t0, $t0, %lo(func_ovl0_800CCF00)
  /* 142744 80133164 240E001A */     addiu $t6, $zero, 0x1a
  /* 142748 80133168 240FFFFF */     addiu $t7, $zero, -1
  /* 14274C 8013316C 240A0001 */     addiu $t2, $zero, 1
  /* 142750 80133170 240B0001 */     addiu $t3, $zero, 1
  /* 142754 80133174 03194821 */      addu $t1, $t8, $t9
  /* 142758 80133178 AFA90020 */        sw $t1, 0x20($sp)
  /* 14275C 8013317C AFAB002C */        sw $t3, 0x2c($sp)
  /* 142760 80133180 AFAA0024 */        sw $t2, 0x24($sp)
  /* 142764 80133184 AFAF001C */        sw $t7, 0x1c($sp)
  /* 142768 80133188 AFAE0014 */        sw $t6, 0x14($sp)
  /* 14276C 8013318C AFA80010 */        sw $t0, 0x10($sp)
  /* 142770 80133190 AFA80038 */        sw $t0, 0x38($sp)
  /* 142774 80133194 AFA70018 */        sw $a3, 0x18($sp)
  /* 142778 80133198 AFA00028 */        sw $zero, 0x28($sp)
  /* 14277C 8013319C 00002025 */        or $a0, $zero, $zero
  /* 142780 801331A0 00002825 */        or $a1, $zero, $zero
  /* 142784 801331A4 0C033414 */       jal func_ovl0_800CD050
  /* 142788 801331A8 24060019 */     addiu $a2, $zero, 0x19
  /* 14278C 801331AC 3C0141D8 */       lui $at, (0x41D80000 >> 16) # 27.0
  /* 142790 801331B0 44812000 */      mtc1 $at, $f4 # 27.0 to cop1
  /* 142794 801331B4 8C4C0074 */        lw $t4, 0x74($v0)
  /* 142798 801331B8 8FA80038 */        lw $t0, 0x38($sp)
  /* 14279C 801331BC 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 1427A0 801331C0 E5840058 */      swc1 $f4, 0x58($t4)
  /* 1427A4 801331C4 8C4D0074 */        lw $t5, 0x74($v0)
  /* 1427A8 801331C8 44813000 */      mtc1 $at, $f6 # 24.0 to cop1
  /* 1427AC 801331CC 240900E3 */     addiu $t1, $zero, 0xe3
  /* 1427B0 801331D0 240B00AC */     addiu $t3, $zero, 0xac
  /* 1427B4 801331D4 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 1427B8 801331D8 8C430074 */        lw $v1, 0x74($v0)
  /* 1427BC 801331DC 240D0004 */     addiu $t5, $zero, 4
  /* 1427C0 801331E0 3C078000 */       lui $a3, 0x8000
  /* 1427C4 801331E4 946E0024 */       lhu $t6, 0x24($v1)
  /* 1427C8 801331E8 3C018014 */       lui $at, %hi(gMNTrainingTitleGObj)
  /* 1427CC 801331EC 00002025 */        or $a0, $zero, $zero
  /* 1427D0 801331F0 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 1427D4 801331F4 A46F0024 */        sh $t7, 0x24($v1)
  /* 1427D8 801331F8 8C430074 */        lw $v1, 0x74($v0)
  /* 1427DC 801331FC 240F001A */     addiu $t7, $zero, 0x1a
  /* 1427E0 80133200 00002825 */        or $a1, $zero, $zero
  /* 1427E4 80133204 94780024 */       lhu $t8, 0x24($v1)
  /* 1427E8 80133208 24060019 */     addiu $a2, $zero, 0x19
  /* 1427EC 8013320C 37190001 */       ori $t9, $t8, 1
  /* 1427F0 80133210 A4790024 */        sh $t9, 0x24($v1)
  /* 1427F4 80133214 8C4A0074 */        lw $t2, 0x74($v0)
  /* 1427F8 80133218 3C198014 */       lui $t9, %hi(D_ovl28_80138C98)
  /* 1427FC 8013321C 2418FFFF */     addiu $t8, $zero, -1
  /* 142800 80133220 A1490028 */        sb $t1, 0x28($t2)
  /* 142804 80133224 8C4C0074 */        lw $t4, 0x74($v0)
  /* 142808 80133228 3C090001 */       lui $t1, %hi(D_NF_000115C8)
  /* 14280C 8013322C 252915C8 */     addiu $t1, $t1, %lo(D_NF_000115C8)
  /* 142810 80133230 A18B0029 */        sb $t3, 0x29($t4)
  /* 142814 80133234 8C4E0074 */        lw $t6, 0x74($v0)
  /* 142818 80133238 240B0001 */     addiu $t3, $zero, 1
  /* 14281C 8013323C 240C0001 */     addiu $t4, $zero, 1
  /* 142820 80133240 A1CD002A */        sb $t5, 0x2a($t6)
  /* 142824 80133244 8F398C98 */        lw $t9, %lo(D_ovl28_80138C98)($t9)
  /* 142828 80133248 AC228870 */        sw $v0, %lo(gMNTrainingTitleGObj)($at)
  /* 14282C 8013324C AFAC002C */        sw $t4, 0x2c($sp)
  /* 142830 80133250 03295021 */      addu $t2, $t9, $t1
  /* 142834 80133254 AFAA0020 */        sw $t2, 0x20($sp)
  /* 142838 80133258 AFA00028 */        sw $zero, 0x28($sp)
  /* 14283C 8013325C AFAB0024 */        sw $t3, 0x24($sp)
  /* 142840 80133260 AFB8001C */        sw $t8, 0x1c($sp)
  /* 142844 80133264 AFA70018 */        sw $a3, 0x18($sp)
  /* 142848 80133268 AFAF0014 */        sw $t7, 0x14($sp)
  /* 14284C 8013326C 0C033414 */       jal func_ovl0_800CD050
  /* 142850 80133270 AFA80010 */        sw $t0, 0x10($sp)
  /* 142854 80133274 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 142858 80133278 44814000 */      mtc1 $at, $f8 # 244.0 to cop1
  /* 14285C 8013327C 8C4D0074 */        lw $t5, 0x74($v0)
  /* 142860 80133280 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 142864 80133284 44815000 */      mtc1 $at, $f10 # 23.0 to cop1
  /* 142868 80133288 E5A80058 */      swc1 $f8, 0x58($t5)
  /* 14286C 8013328C 8C4E0074 */        lw $t6, 0x74($v0)
  /* 142870 80133290 E5CA005C */      swc1 $f10, 0x5c($t6)
  /* 142874 80133294 8C430074 */        lw $v1, 0x74($v0)
  /* 142878 80133298 946F0024 */       lhu $t7, 0x24($v1)
  /* 14287C 8013329C 31F8FFDF */      andi $t8, $t7, 0xffdf
  /* 142880 801332A0 A4780024 */        sh $t8, 0x24($v1)
  /* 142884 801332A4 8C430074 */        lw $v1, 0x74($v0)
  /* 142888 801332A8 94790024 */       lhu $t9, 0x24($v1)
  /* 14288C 801332AC 37290001 */       ori $t1, $t9, 1
  /* 142890 801332B0 A4690024 */        sh $t1, 0x24($v1)
  /* 142894 801332B4 8FBF0034 */        lw $ra, 0x34($sp)
  /* 142898 801332B8 27BD0048 */     addiu $sp, $sp, 0x48
  /* 14289C 801332BC 03E00008 */        jr $ra
  /* 1428A0 801332C0 00000000 */       nop

  /* 1428A4 801332C4 03E00008 */        jr $ra
  /* 1428A8 801332C8 00000000 */       nop

  /* 1428AC 801332CC 03E00008 */        jr $ra
  /* 1428B0 801332D0 00000000 */       nop

  /* 1428B4 801332D4 03E00008 */        jr $ra
  /* 1428B8 801332D8 00000000 */       nop

glabel mnTrainingGetAdditionalSelectedCount
  /* 1428BC 801332DC 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 1428C0 801332E0 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 1428C4 801332E4 240500B8 */     addiu $a1, $zero, 0xb8
  /* 1428C8 801332E8 3C038014 */       lui $v1, %hi(gMNTrainingPanels)
  /* 1428CC 801332EC 01C50019 */     multu $t6, $a1
  /* 1428D0 801332F0 24638558 */     addiu $v1, $v1, %lo(gMNTrainingPanels)
  /* 1428D4 801332F4 00001025 */        or $v0, $zero, $zero
  /* 1428D8 801332F8 3C088014 */       lui $t0, %hi(gMNTrainingCPUPanelPort)
  /* 1428DC 801332FC 00007812 */      mflo $t7
  /* 1428E0 80133300 006FC021 */      addu $t8, $v1, $t7
  /* 1428E4 80133304 8F190048 */        lw $t9, 0x48($t8)
  /* 1428E8 80133308 14990002 */       bne $a0, $t9, .L80133314
  /* 1428EC 8013330C 00000000 */       nop
  /* 1428F0 80133310 24020001 */     addiu $v0, $zero, 1
  .L80133314:
  /* 1428F4 80133314 8D088898 */        lw $t0, %lo(gMNTrainingCPUPanelPort)($t0)
  /* 1428F8 80133318 01050019 */     multu $t0, $a1
  /* 1428FC 8013331C 00004812 */      mflo $t1
  /* 142900 80133320 00695021 */      addu $t2, $v1, $t1
  /* 142904 80133324 8D4B0048 */        lw $t3, 0x48($t2)
  /* 142908 80133328 148B0002 */       bne $a0, $t3, .L80133334
  /* 14290C 8013332C 00000000 */       nop
  /* 142910 80133330 24420001 */     addiu $v0, $v0, 1
  .L80133334:
  /* 142914 80133334 10400004 */      beqz $v0, .L80133348
  /* 142918 80133338 00401825 */        or $v1, $v0, $zero
  /* 14291C 8013333C 2443FFFF */     addiu $v1, $v0, -1
  /* 142920 80133340 03E00008 */        jr $ra
  /* 142924 80133344 00601025 */        or $v0, $v1, $zero

  .L80133348:
  /* 142928 80133348 03E00008 */        jr $ra
  /* 14292C 8013334C 00601025 */        or $v0, $v1, $zero

glabel mnTrainingIsCostumeInUse
  /* 142930 80133350 3C028014 */       lui $v0, %hi(gMNTrainingHumanPanelPort)
  /* 142934 80133354 8C428894 */        lw $v0, %lo(gMNTrainingHumanPanelPort)($v0)
  /* 142938 80133358 3C0E8014 */       lui $t6, %hi(gMNTrainingCPUPanelPort)
  /* 14293C 8013335C 3C098014 */       lui $t1, 0x8014
  /* 142940 80133360 14A20014 */       bne $a1, $v0, .L801333B4
  /* 142944 80133364 00000000 */       nop
  /* 142948 80133368 8DCE8898 */        lw $t6, %lo(gMNTrainingCPUPanelPort)($t6)
  /* 14294C 8013336C 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 142950 80133370 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 142954 80133374 000E7880 */       sll $t7, $t6, 2
  /* 142958 80133378 01EE7823 */      subu $t7, $t7, $t6
  /* 14295C 8013337C 000F78C0 */       sll $t7, $t7, 3
  /* 142960 80133380 01EE7823 */      subu $t7, $t7, $t6
  /* 142964 80133384 000F78C0 */       sll $t7, $t7, 3
  /* 142968 80133388 01F81021 */      addu $v0, $t7, $t8
  /* 14296C 8013338C 8C590048 */        lw $t9, 0x48($v0)
  /* 142970 80133390 14990006 */       bne $a0, $t9, .L801333AC
  /* 142974 80133394 00000000 */       nop
  /* 142978 80133398 8C48004C */        lw $t0, 0x4c($v0)
  /* 14297C 8013339C 14C80003 */       bne $a2, $t0, .L801333AC
  /* 142980 801333A0 00000000 */       nop
  /* 142984 801333A4 03E00008 */        jr $ra
  /* 142988 801333A8 24020001 */     addiu $v0, $zero, 1

  .L801333AC:
  /* 14298C 801333AC 03E00008 */        jr $ra
  /* 142990 801333B0 00001025 */        or $v0, $zero, $zero

  .L801333B4:
  /* 142994 801333B4 8D298898 */        lw $t1, -0x7768($t1)
  /* 142998 801333B8 00025080 */       sll $t2, $v0, 2
  /* 14299C 801333BC 01425023 */      subu $t2, $t2, $v0
  /* 1429A0 801333C0 14A9000F */       bne $a1, $t1, .L80133400
  /* 1429A4 801333C4 000A50C0 */       sll $t2, $t2, 3
  /* 1429A8 801333C8 01425023 */      subu $t2, $t2, $v0
  /* 1429AC 801333CC 3C0B8014 */       lui $t3, %hi(gMNTrainingPanels)
  /* 1429B0 801333D0 256B8558 */     addiu $t3, $t3, %lo(gMNTrainingPanels)
  /* 1429B4 801333D4 000A50C0 */       sll $t2, $t2, 3
  /* 1429B8 801333D8 014B1821 */      addu $v1, $t2, $t3
  /* 1429BC 801333DC 8C6C0048 */        lw $t4, 0x48($v1)
  /* 1429C0 801333E0 00001025 */        or $v0, $zero, $zero
  /* 1429C4 801333E4 148C0006 */       bne $a0, $t4, .L80133400
  /* 1429C8 801333E8 00000000 */       nop
  /* 1429CC 801333EC 8C6D004C */        lw $t5, 0x4c($v1)
  /* 1429D0 801333F0 14CD0003 */       bne $a2, $t5, .L80133400
  /* 1429D4 801333F4 00000000 */       nop
  /* 1429D8 801333F8 03E00008 */        jr $ra
  /* 1429DC 801333FC 24020001 */     addiu $v0, $zero, 1

  .L80133400:
  /* 1429E0 80133400 03E00008 */        jr $ra
  /* 1429E4 80133404 00000000 */       nop

glabel mnTrainingGetAvailableCostumeFFA
  /* 1429E8 80133408 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 1429EC 8013340C AFB70030 */        sw $s7, 0x30($sp)
  /* 1429F0 80133410 3C178014 */       lui $s7, %hi(gMNTrainingHumanPanelPort)
  /* 1429F4 80133414 26F78894 */     addiu $s7, $s7, %lo(gMNTrainingHumanPanelPort)
  /* 1429F8 80133418 8EE60000 */        lw $a2, ($s7) # gMNTrainingHumanPanelPort + 0
  /* 1429FC 8013341C AFB6002C */        sw $s6, 0x2c($sp)
  /* 142A00 80133420 00A03825 */        or $a3, $a1, $zero
  /* 142A04 80133424 0080B025 */        or $s6, $a0, $zero
  /* 142A08 80133428 AFBF0034 */        sw $ra, 0x34($sp)
  /* 142A0C 8013342C AFB50028 */        sw $s5, 0x28($sp)
  /* 142A10 80133430 AFB40024 */        sw $s4, 0x24($sp)
  /* 142A14 80133434 AFB30020 */        sw $s3, 0x20($sp)
  /* 142A18 80133438 AFB2001C */        sw $s2, 0x1c($sp)
  /* 142A1C 8013343C AFB10018 */        sw $s1, 0x18($sp)
  /* 142A20 80133440 AFB00014 */        sw $s0, 0x14($sp)
  /* 142A24 80133444 00002025 */        or $a0, $zero, $zero
  /* 142A28 80133448 00001025 */        or $v0, $zero, $zero
  /* 142A2C 8013344C 00001825 */        or $v1, $zero, $zero
  /* 142A30 80133450 14A60029 */       bne $a1, $a2, .L801334F8
  /* 142A34 80133454 00002825 */        or $a1, $zero, $zero
  /* 142A38 80133458 3C178014 */       lui $s7, %hi(gMNTrainingCPUPanelPort)
  /* 142A3C 8013345C 26F78898 */     addiu $s7, $s7, %lo(gMNTrainingCPUPanelPort)
  /* 142A40 80133460 8EEE0000 */        lw $t6, ($s7) # gMNTrainingCPUPanelPort + 0
  /* 142A44 80133464 241500B8 */     addiu $s5, $zero, 0xb8
  /* 142A48 80133468 3C148014 */       lui $s4, %hi(gMNTrainingPanels)
  /* 142A4C 8013346C 01D50019 */     multu $t6, $s5
  /* 142A50 80133470 26948558 */     addiu $s4, $s4, %lo(gMNTrainingPanels)
  /* 142A54 80133474 AFA20044 */        sw $v0, 0x44($sp)
  /* 142A58 80133478 AFA30040 */        sw $v1, 0x40($sp)
  /* 142A5C 8013347C AFA4004C */        sw $a0, 0x4c($sp)
  /* 142A60 80133480 AFA50048 */        sw $a1, 0x48($sp)
  /* 142A64 80133484 00008025 */        or $s0, $zero, $zero
  /* 142A68 80133488 24130004 */     addiu $s3, $zero, 4
  /* 142A6C 8013348C 24120001 */     addiu $s2, $zero, 1
  /* 142A70 80133490 27B10040 */     addiu $s1, $sp, 0x40
  /* 142A74 80133494 00007812 */      mflo $t7
  /* 142A78 80133498 028FC021 */      addu $t8, $s4, $t7
  /* 142A7C 8013349C 8F190048 */        lw $t9, 0x48($t8)
  /* 142A80 801334A0 16D90010 */       bne $s6, $t9, .L801334E4
  /* 142A84 801334A4 02C02025 */        or $a0, $s6, $zero
  .L801334A8:
  /* 142A88 801334A8 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 142A8C 801334AC 02002825 */        or $a1, $s0, $zero
  /* 142A90 801334B0 8EE80000 */        lw $t0, ($s7) # gMNTrainingCPUPanelPort + 0
  /* 142A94 801334B4 00106080 */       sll $t4, $s0, 2
  /* 142A98 801334B8 022C6821 */      addu $t5, $s1, $t4
  /* 142A9C 801334BC 01150019 */     multu $t0, $s5
  /* 142AA0 801334C0 00004812 */      mflo $t1
  /* 142AA4 801334C4 02895021 */      addu $t2, $s4, $t1
  /* 142AA8 801334C8 8D4B004C */        lw $t3, 0x4c($t2)
  /* 142AAC 801334CC 544B0003 */      bnel $v0, $t3, .L801334DC
  /* 142AB0 801334D0 26100001 */     addiu $s0, $s0, 1
  /* 142AB4 801334D4 ADB20000 */        sw $s2, ($t5)
  /* 142AB8 801334D8 26100001 */     addiu $s0, $s0, 1
  .L801334DC:
  /* 142ABC 801334DC 5613FFF2 */      bnel $s0, $s3, .L801334A8
  /* 142AC0 801334E0 02C02025 */        or $a0, $s6, $zero
  .L801334E4:
  /* 142AC4 801334E4 8FA20044 */        lw $v0, 0x44($sp)
  /* 142AC8 801334E8 8FA30040 */        lw $v1, 0x40($sp)
  /* 142ACC 801334EC 8FA4004C */        lw $a0, 0x4c($sp)
  /* 142AD0 801334F0 10000026 */         b .L8013358C
  /* 142AD4 801334F4 8FA50048 */        lw $a1, 0x48($sp)
  .L801334F8:
  /* 142AD8 801334F8 241500B8 */     addiu $s5, $zero, 0xb8
  /* 142ADC 801334FC 00D50019 */     multu $a2, $s5
  /* 142AE0 80133500 3C148014 */       lui $s4, %hi(gMNTrainingPanels)
  /* 142AE4 80133504 26948558 */     addiu $s4, $s4, %lo(gMNTrainingPanels)
  /* 142AE8 80133508 00008025 */        or $s0, $zero, $zero
  /* 142AEC 8013350C 24130004 */     addiu $s3, $zero, 4
  /* 142AF0 80133510 24120001 */     addiu $s2, $zero, 1
  /* 142AF4 80133514 27B10040 */     addiu $s1, $sp, 0x40
  /* 142AF8 80133518 00007012 */      mflo $t6
  /* 142AFC 8013351C 028E7821 */      addu $t7, $s4, $t6
  /* 142B00 80133520 8DF80048 */        lw $t8, 0x48($t7)
  /* 142B04 80133524 16D80019 */       bne $s6, $t8, .L8013358C
  /* 142B08 80133528 00000000 */       nop
  /* 142B0C 8013352C AFA50048 */        sw $a1, 0x48($sp)
  /* 142B10 80133530 AFA4004C */        sw $a0, 0x4c($sp)
  /* 142B14 80133534 AFA30040 */        sw $v1, 0x40($sp)
  /* 142B18 80133538 AFA20044 */        sw $v0, 0x44($sp)
  /* 142B1C 8013353C 02C02025 */        or $a0, $s6, $zero
  .L80133540:
  /* 142B20 80133540 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 142B24 80133544 02002825 */        or $a1, $s0, $zero
  /* 142B28 80133548 8EF90000 */        lw $t9, ($s7) # gMNTrainingCPUPanelPort + 0
  /* 142B2C 8013354C 00105880 */       sll $t3, $s0, 2
  /* 142B30 80133550 022B6021 */      addu $t4, $s1, $t3
  /* 142B34 80133554 03350019 */     multu $t9, $s5
  /* 142B38 80133558 00004012 */      mflo $t0
  /* 142B3C 8013355C 02884821 */      addu $t1, $s4, $t0
  /* 142B40 80133560 8D2A004C */        lw $t2, 0x4c($t1)
  /* 142B44 80133564 544A0003 */      bnel $v0, $t2, .L80133574
  /* 142B48 80133568 26100001 */     addiu $s0, $s0, 1
  /* 142B4C 8013356C AD920000 */        sw $s2, ($t4)
  /* 142B50 80133570 26100001 */     addiu $s0, $s0, 1
  .L80133574:
  /* 142B54 80133574 5613FFF2 */      bnel $s0, $s3, .L80133540
  /* 142B58 80133578 02C02025 */        or $a0, $s6, $zero
  /* 142B5C 8013357C 8FA50048 */        lw $a1, 0x48($sp)
  /* 142B60 80133580 8FA4004C */        lw $a0, 0x4c($sp)
  /* 142B64 80133584 8FA30040 */        lw $v1, 0x40($sp)
  /* 142B68 80133588 8FA20044 */        lw $v0, 0x44($sp)
  .L8013358C:
  /* 142B6C 8013358C 14600003 */      bnez $v1, .L8013359C
  /* 142B70 80133590 8FB00014 */        lw $s0, 0x14($sp)
  /* 142B74 80133594 1000000C */         b .L801335C8
  /* 142B78 80133598 00001025 */        or $v0, $zero, $zero
  .L8013359C:
  /* 142B7C 8013359C 14400003 */      bnez $v0, .L801335AC
  /* 142B80 801335A0 00000000 */       nop
  /* 142B84 801335A4 10000008 */         b .L801335C8
  /* 142B88 801335A8 24020001 */     addiu $v0, $zero, 1
  .L801335AC:
  /* 142B8C 801335AC 14A00003 */      bnez $a1, .L801335BC
  /* 142B90 801335B0 00000000 */       nop
  /* 142B94 801335B4 10000004 */         b .L801335C8
  /* 142B98 801335B8 24020002 */     addiu $v0, $zero, 2
  .L801335BC:
  /* 142B9C 801335BC 54800003 */      bnel $a0, $zero, .L801335CC
  /* 142BA0 801335C0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 142BA4 801335C4 24020003 */     addiu $v0, $zero, 3
  .L801335C8:
  /* 142BA8 801335C8 8FBF0034 */        lw $ra, 0x34($sp)
  .L801335CC:
  /* 142BAC 801335CC 8FB10018 */        lw $s1, 0x18($sp)
  /* 142BB0 801335D0 8FB2001C */        lw $s2, 0x1c($sp)
  /* 142BB4 801335D4 8FB30020 */        lw $s3, 0x20($sp)
  /* 142BB8 801335D8 8FB40024 */        lw $s4, 0x24($sp)
  /* 142BBC 801335DC 8FB50028 */        lw $s5, 0x28($sp)
  /* 142BC0 801335E0 8FB6002C */        lw $s6, 0x2c($sp)
  /* 142BC4 801335E4 8FB70030 */        lw $s7, 0x30($sp)
  /* 142BC8 801335E8 03E00008 */        jr $ra
  /* 142BCC 801335EC 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnTrainingGetAvailableCostume
  /* 142BD0 801335F0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 142BD4 801335F4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 142BD8 801335F8 0C04CD02 */       jal mnTrainingGetAvailableCostumeFFA
  /* 142BDC 801335FC AFA40018 */        sw $a0, 0x18($sp)
  /* 142BE0 80133600 8FA40018 */        lw $a0, 0x18($sp)
  /* 142BE4 80133604 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 142BE8 80133608 00402825 */        or $a1, $v0, $zero
  /* 142BEC 8013360C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 142BF0 80133610 27BD0018 */     addiu $sp, $sp, 0x18
  /* 142BF4 80133614 03E00008 */        jr $ra
  /* 142BF8 80133618 00000000 */       nop

glabel mnTrainingGetSelectedAnimation
  /* 142BFC 8013361C 2C81000C */     sltiu $at, $a0, 0xc
  /* 142C00 80133620 10200012 */      beqz $at, jtgt_ovl28_8013366C
  /* 142C04 80133624 00047080 */       sll $t6, $a0, 2
  /* 142C08 80133628 3C018014 */       lui $at, %hi(jtbl_ovl28_801384E0)
  /* 142C0C 8013362C 002E0821 */      addu $at, $at, $t6
  /* 142C10 80133630 8C2E84E0 */        lw $t6, %lo(jtbl_ovl28_801384E0)($at)
  /* 142C14 80133634 01C00008 */        jr $t6
  /* 142C18 80133638 00000000 */       nop
  glabel jtgt_ovl28_8013363C
  /* 142C1C 8013363C 3C020001 */       lui $v0, (0x10004 >> 16) # 65540
  /* 142C20 80133640 03E00008 */        jr $ra
  /* 142C24 80133644 34420004 */       ori $v0, $v0, (0x10004 & 0xFFFF) # 65540

  glabel jtgt_ovl28_80133648
  /* 142C28 80133648 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 142C2C 8013364C 03E00008 */        jr $ra
  /* 142C30 80133650 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537

  glabel jtgt_ovl28_80133654
  /* 142C34 80133654 3C020001 */       lui $v0, (0x10002 >> 16) # 65538
  /* 142C38 80133658 03E00008 */        jr $ra
  /* 142C3C 8013365C 34420002 */       ori $v0, $v0, (0x10002 & 0xFFFF) # 65538

  glabel jtgt_ovl28_80133660
  /* 142C40 80133660 3C020001 */       lui $v0, (0x10003 >> 16) # 65539
  /* 142C44 80133664 03E00008 */        jr $ra
  /* 142C48 80133668 34420003 */       ori $v0, $v0, (0x10003 & 0xFFFF) # 65539

  glabel jtgt_ovl28_8013366C
  /* 142C4C 8013366C 3C020001 */       lui $v0, (0x10001 >> 16) # 65537
  /* 142C50 80133670 34420001 */       ori $v0, $v0, (0x10001 & 0xFFFF) # 65537
  /* 142C54 80133674 03E00008 */        jr $ra
  /* 142C58 80133678 00000000 */       nop

glabel mnTrainingRotateFighter
  /* 142C5C 8013367C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 142C60 80133680 AFBF001C */        sw $ra, 0x1c($sp)
  /* 142C64 80133684 AFB00018 */        sw $s0, 0x18($sp)
  /* 142C68 80133688 8C820084 */        lw $v0, 0x84($a0)
  /* 142C6C 8013368C 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 142C70 80133690 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 142C74 80133694 9043000D */       lbu $v1, 0xd($v0)
  /* 142C78 80133698 24010001 */     addiu $at, $zero, 1
  /* 142C7C 8013369C 00037080 */       sll $t6, $v1, 2
  /* 142C80 801336A0 01C37023 */      subu $t6, $t6, $v1
  /* 142C84 801336A4 000E70C0 */       sll $t6, $t6, 3
  /* 142C88 801336A8 01C37023 */      subu $t6, $t6, $v1
  /* 142C8C 801336AC 000E70C0 */       sll $t6, $t6, 3
  /* 142C90 801336B0 01CF8021 */      addu $s0, $t6, $t7
  /* 142C94 801336B4 8E180084 */        lw $t8, 0x84($s0)
  /* 142C98 801336B8 5701002C */      bnel $t8, $at, .L8013376C
  /* 142C9C 801336BC 8C820074 */        lw $v0, 0x74($a0)
  /* 142CA0 801336C0 8C820074 */        lw $v0, 0x74($a0)
  /* 142CA4 801336C4 3C018014 */       lui $at, %hi(D_ovl28_80138510)
  /* 142CA8 801336C8 C4248510 */      lwc1 $f4, %lo(D_ovl28_80138510)($at)
  /* 142CAC 801336CC C4400034 */      lwc1 $f0, 0x34($v0)
  /* 142CB0 801336D0 3C018014 */       lui $at, 0x8014
  /* 142CB4 801336D4 4604003C */    c.lt.s $f0, $f4
  /* 142CB8 801336D8 00000000 */       nop
  /* 142CBC 801336DC 4500000C */      bc1f .L80133710
  /* 142CC0 801336E0 00000000 */       nop
  /* 142CC4 801336E4 8E190088 */        lw $t9, 0x88($s0)
  /* 142CC8 801336E8 57200030 */      bnel $t9, $zero, .L801337AC
  /* 142CCC 801336EC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 142CD0 801336F0 0C04CD87 */       jal mnTrainingGetSelectedAnimation
  /* 142CD4 801336F4 8E040048 */        lw $a0, 0x48($s0)
  /* 142CD8 801336F8 8E040008 */        lw $a0, 8($s0)
  /* 142CDC 801336FC 0C0E4173 */       jal func_ovl1_803905CC
  /* 142CE0 80133700 00402825 */        or $a1, $v0, $zero
  /* 142CE4 80133704 24080001 */     addiu $t0, $zero, 1
  /* 142CE8 80133708 10000027 */         b .L801337A8
  /* 142CEC 8013370C AE080088 */        sw $t0, 0x88($s0)
  .L80133710:
  /* 142CF0 80133710 C4228514 */      lwc1 $f2, -0x7aec($at)
  /* 142CF4 80133714 3C018014 */       lui $at, %hi(D_ovl28_80138518)
  /* 142CF8 80133718 C4268518 */      lwc1 $f6, %lo(D_ovl28_80138518)($at)
  /* 142CFC 8013371C 46060200 */     add.s $f8, $f0, $f6
  /* 142D00 80133720 E4480034 */      swc1 $f8, 0x34($v0)
  /* 142D04 80133724 8C820074 */        lw $v0, 0x74($a0)
  /* 142D08 80133728 C44A0034 */      lwc1 $f10, 0x34($v0)
  /* 142D0C 8013372C 460A103C */    c.lt.s $f2, $f10
  /* 142D10 80133730 00000000 */       nop
  /* 142D14 80133734 4502001D */     bc1fl .L801337AC
  /* 142D18 80133738 8FBF001C */        lw $ra, 0x1c($sp)
  /* 142D1C 8013373C 44808000 */      mtc1 $zero, $f16
  /* 142D20 80133740 00000000 */       nop
  /* 142D24 80133744 E4500034 */      swc1 $f16, 0x34($v0)
  /* 142D28 80133748 0C04CD87 */       jal mnTrainingGetSelectedAnimation
  /* 142D2C 8013374C 8E040048 */        lw $a0, 0x48($s0)
  /* 142D30 80133750 8E040008 */        lw $a0, 8($s0)
  /* 142D34 80133754 0C0E4173 */       jal func_ovl1_803905CC
  /* 142D38 80133758 00402825 */        or $a1, $v0, $zero
  /* 142D3C 8013375C 24090001 */     addiu $t1, $zero, 1
  /* 142D40 80133760 10000011 */         b .L801337A8
  /* 142D44 80133764 AE090088 */        sw $t1, 0x88($s0)
  /* 142D48 80133768 8C820074 */        lw $v0, 0x74($a0)
  .L8013376C:
  /* 142D4C 8013376C 3C018014 */       lui $at, %hi(D_ovl28_8013851C)
  /* 142D50 80133770 C422851C */      lwc1 $f2, %lo(D_ovl28_8013851C)($at)
  /* 142D54 80133774 3C018014 */       lui $at, %hi(D_ovl28_80138520)
  /* 142D58 80133778 C4248520 */      lwc1 $f4, %lo(D_ovl28_80138520)($at)
  /* 142D5C 8013377C C4520034 */      lwc1 $f18, 0x34($v0)
  /* 142D60 80133780 46049180 */     add.s $f6, $f18, $f4
  /* 142D64 80133784 E4460034 */      swc1 $f6, 0x34($v0)
  /* 142D68 80133788 8C820074 */        lw $v0, 0x74($a0)
  /* 142D6C 8013378C C4400034 */      lwc1 $f0, 0x34($v0)
  /* 142D70 80133790 4600103C */    c.lt.s $f2, $f0
  /* 142D74 80133794 00000000 */       nop
  /* 142D78 80133798 45020004 */     bc1fl .L801337AC
  /* 142D7C 8013379C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 142D80 801337A0 46020201 */     sub.s $f8, $f0, $f2
  /* 142D84 801337A4 E4480034 */      swc1 $f8, 0x34($v0)
  .L801337A8:
  /* 142D88 801337A8 8FBF001C */        lw $ra, 0x1c($sp)
  .L801337AC:
  /* 142D8C 801337AC 8FB00018 */        lw $s0, 0x18($sp)
  /* 142D90 801337B0 27BD0020 */     addiu $sp, $sp, 0x20
  /* 142D94 801337B4 03E00008 */        jr $ra
  /* 142D98 801337B8 00000000 */       nop

glabel mnTrainingSpawnFighter
  /* 142D9C 801337BC 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 142DA0 801337C0 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 142DA4 801337C4 AFB00018 */        sw $s0, 0x18($sp)
  /* 142DA8 801337C8 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 142DAC 801337CC 00808025 */        or $s0, $a0, $zero
  /* 142DB0 801337D0 AFBF001C */        sw $ra, 0x1c($sp)
  /* 142DB4 801337D4 AFA5006C */        sw $a1, 0x6c($sp)
  /* 142DB8 801337D8 AFA60070 */        sw $a2, 0x70($sp)
  /* 142DBC 801337DC 25E8003C */     addiu $t0, $t7, 0x3c
  /* 142DC0 801337E0 27AE0024 */     addiu $t6, $sp, 0x24
  .L801337E4:
  /* 142DC4 801337E4 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 142DC8 801337E8 25EF000C */     addiu $t7, $t7, 0xc
  /* 142DCC 801337EC 25CE000C */     addiu $t6, $t6, 0xc
  /* 142DD0 801337F0 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 142DD4 801337F4 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 142DD8 801337F8 ADD8FFF8 */        sw $t8, -8($t6)
  /* 142DDC 801337FC 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 142DE0 80133800 15E8FFF8 */       bne $t7, $t0, .L801337E4
  /* 142DE4 80133804 ADD9FFFC */        sw $t9, -4($t6)
  /* 142DE8 80133808 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 142DEC 8013380C 2401001C */     addiu $at, $zero, 0x1c
  /* 142DF0 80133810 ADD90000 */        sw $t9, ($t6)
  /* 142DF4 80133814 8FA90070 */        lw $t1, 0x70($sp)
  /* 142DF8 80133818 5121005D */      beql $t1, $at, .L80133990
  /* 142DFC 8013381C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 142E00 80133820 5200000A */      beql $s0, $zero, .L8013384C
  /* 142E04 80133824 44803000 */      mtc1 $zero, $f6
  /* 142E08 80133828 8E0A0074 */        lw $t2, 0x74($s0)
  /* 142E0C 8013382C 02002025 */        or $a0, $s0, $zero
  /* 142E10 80133830 C5440034 */      lwc1 $f4, 0x34($t2)
  /* 142E14 80133834 AFA70074 */        sw $a3, 0x74($sp)
  /* 142E18 80133838 0C035E3A */       jal ftManagerDestroyFighter
  /* 142E1C 8013383C E7A40064 */      swc1 $f4, 0x64($sp)
  /* 142E20 80133840 10000004 */         b .L80133854
  /* 142E24 80133844 8FA70074 */        lw $a3, 0x74($sp)
  /* 142E28 80133848 44803000 */      mtc1 $zero, $f6
  .L8013384C:
  /* 142E2C 8013384C 00000000 */       nop
  /* 142E30 80133850 E7A60064 */      swc1 $f6, 0x64($sp)
  .L80133854:
  /* 142E34 80133854 8FAC006C */        lw $t4, 0x6c($sp)
  /* 142E38 80133858 3C088014 */       lui $t0, %hi(gMNTrainingPanels)
  /* 142E3C 8013385C 25088558 */     addiu $t0, $t0, %lo(gMNTrainingPanels)
  /* 142E40 80133860 000C6880 */       sll $t5, $t4, 2
  /* 142E44 80133864 01AC6823 */      subu $t5, $t5, $t4
  /* 142E48 80133868 000D68C0 */       sll $t5, $t5, 3
  /* 142E4C 8013386C 01AC6823 */      subu $t5, $t5, $t4
  /* 142E50 80133870 000D68C0 */       sll $t5, $t5, 3
  /* 142E54 80133874 01A81821 */      addu $v1, $t5, $t0
  /* 142E58 80133878 8FAB0070 */        lw $t3, 0x70($sp)
  /* 142E5C 8013387C 8C6E0034 */        lw $t6, 0x34($v1)
  /* 142E60 80133880 8FB8006C */        lw $t8, 0x6c($sp)
  /* 142E64 80133884 30EF00FF */      andi $t7, $a3, 0xff
  /* 142E68 80133888 AC6F004C */        sw $t7, 0x4c($v1)
  /* 142E6C 8013388C A3A7003B */        sb $a3, 0x3b($sp)
  /* 142E70 80133890 A3A0003C */        sb $zero, 0x3c($sp)
  /* 142E74 80133894 AFA30020 */        sw $v1, 0x20($sp)
  /* 142E78 80133898 27A40024 */     addiu $a0, $sp, 0x24
  /* 142E7C 8013389C AFAB0024 */        sw $t3, 0x24($sp)
  /* 142E80 801338A0 AFAE005C */        sw $t6, 0x5c($sp)
  /* 142E84 801338A4 0C035FCF */       jal ftManagerMakeFighter
  /* 142E88 801338A8 A3B80039 */        sb $t8, 0x39($sp)
  /* 142E8C 801338AC 8FA30020 */        lw $v1, 0x20($sp)
  /* 142E90 801338B0 3C058013 */       lui $a1, %hi(mnTrainingRotateFighter)
  /* 142E94 801338B4 00408025 */        or $s0, $v0, $zero
  /* 142E98 801338B8 24A5367C */     addiu $a1, $a1, %lo(mnTrainingRotateFighter)
  /* 142E9C 801338BC 00402025 */        or $a0, $v0, $zero
  /* 142EA0 801338C0 24060001 */     addiu $a2, $zero, 1
  /* 142EA4 801338C4 24070001 */     addiu $a3, $zero, 1
  /* 142EA8 801338C8 0C002062 */       jal omAddGObjCommonProc
  /* 142EAC 801338CC AC620008 */        sw $v0, 8($v1)
  /* 142EB0 801338D0 3C098014 */       lui $t1, %hi(gMNTrainingHumanPanelPort)
  /* 142EB4 801338D4 8D298894 */        lw $t1, %lo(gMNTrainingHumanPanelPort)($t1)
  /* 142EB8 801338D8 8FB9006C */        lw $t9, 0x6c($sp)
  /* 142EBC 801338DC 3C018014 */       lui $at, 0x8014
  /* 142EC0 801338E0 02002025 */        or $a0, $s0, $zero
  /* 142EC4 801338E4 1729000A */       bne $t9, $t1, .L80133910
  /* 142EC8 801338E8 24050001 */     addiu $a1, $zero, 1
  /* 142ECC 801338EC 3C018014 */       lui $at, %hi(D_ovl28_80138524)
  /* 142ED0 801338F0 C4288524 */      lwc1 $f8, %lo(D_ovl28_80138524)($at)
  /* 142ED4 801338F4 8E0A0074 */        lw $t2, 0x74($s0)
  /* 142ED8 801338F8 3C018014 */       lui $at, %hi(D_ovl28_8013852C)
  /* 142EDC 801338FC E548001C */      swc1 $f8, 0x1c($t2)
  /* 142EE0 80133900 8E0B0074 */        lw $t3, 0x74($s0)
  /* 142EE4 80133904 C42A8528 */      lwc1 $f10, %lo(D_ovl28_80138528)($at)
  /* 142EE8 80133908 10000008 */         b .L8013392C
  /* 142EEC 8013390C E56A0020 */      swc1 $f10, 0x20($t3)
  .L80133910:
  /* 142EF0 80133910 C430852C */      lwc1 $f16, %lo(D_ovl28_8013852C)($at)
  /* 142EF4 80133914 8E0C0074 */        lw $t4, 0x74($s0)
  /* 142EF8 80133918 3C018014 */       lui $at, %hi(D_ovl28_80138530)
  /* 142EFC 8013391C E590001C */      swc1 $f16, 0x1c($t4)
  /* 142F00 80133920 8E0D0074 */        lw $t5, 0x74($s0)
  /* 142F04 80133924 C4328530 */      lwc1 $f18, %lo(D_ovl28_80138530)($at)
  /* 142F08 80133928 E5B20020 */      swc1 $f18, 0x20($t5)
  .L8013392C:
  /* 142F0C 8013392C C7A40064 */      lwc1 $f4, 0x64($sp)
  /* 142F10 80133930 8E080074 */        lw $t0, 0x74($s0)
  /* 142F14 80133934 3C188039 */       lui $t8, %hi(D_ovl1_80390D90)
  /* 142F18 80133938 27180D90 */     addiu $t8, $t8, %lo(D_ovl1_80390D90)
  /* 142F1C 8013393C E5040034 */      swc1 $f4, 0x34($t0)
  /* 142F20 80133940 8FAF0070 */        lw $t7, 0x70($sp)
  /* 142F24 80133944 8E190074 */        lw $t9, 0x74($s0)
  /* 142F28 80133948 3C0C8014 */       lui $t4, %hi(gMNTrainingCPUPanelPort)
  /* 142F2C 8013394C 000F7080 */       sll $t6, $t7, 2
  /* 142F30 80133950 01D81021 */      addu $v0, $t6, $t8
  /* 142F34 80133954 C4460000 */      lwc1 $f6, ($v0)
  /* 142F38 80133958 E7260040 */      swc1 $f6, 0x40($t9)
  /* 142F3C 8013395C 8E090074 */        lw $t1, 0x74($s0)
  /* 142F40 80133960 C4480000 */      lwc1 $f8, ($v0)
  /* 142F44 80133964 E5280044 */      swc1 $f8, 0x44($t1)
  /* 142F48 80133968 8E0A0074 */        lw $t2, 0x74($s0)
  /* 142F4C 8013396C C44A0000 */      lwc1 $f10, ($v0)
  /* 142F50 80133970 E54A0048 */      swc1 $f10, 0x48($t2)
  /* 142F54 80133974 8D8C8898 */        lw $t4, %lo(gMNTrainingCPUPanelPort)($t4)
  /* 142F58 80133978 8FAB006C */        lw $t3, 0x6c($sp)
  /* 142F5C 8013397C 556C0004 */      bnel $t3, $t4, .L80133990
  /* 142F60 80133980 8FBF001C */        lw $ra, 0x1c($sp)
  /* 142F64 80133984 0C03A605 */       jal ftColor_CheckSetColAnimIndex
  /* 142F68 80133988 00003025 */        or $a2, $zero, $zero
  /* 142F6C 8013398C 8FBF001C */        lw $ra, 0x1c($sp)
  .L80133990:
  /* 142F70 80133990 8FB00018 */        lw $s0, 0x18($sp)
  /* 142F74 80133994 27BD0068 */     addiu $sp, $sp, 0x68
  /* 142F78 80133998 03E00008 */        jr $ra
  /* 142F7C 8013399C 00000000 */       nop

glabel mnTrainingCreateFighterViewport
  /* 142F80 801339A0 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 142F84 801339A4 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 142F88 801339A8 3C190004 */       lui $t9, (0x48600 >> 16) # 296448
  /* 142F8C 801339AC AFBF003C */        sw $ra, 0x3c($sp)
  /* 142F90 801339B0 37398600 */       ori $t9, $t9, (0x48600 & 0xFFFF) # 296448
  /* 142F94 801339B4 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 142F98 801339B8 240F001E */     addiu $t7, $zero, 0x1e
  /* 142F9C 801339BC 24180000 */     addiu $t8, $zero, 0
  /* 142FA0 801339C0 2408FFFF */     addiu $t0, $zero, -1
  /* 142FA4 801339C4 24090001 */     addiu $t1, $zero, 1
  /* 142FA8 801339C8 240A0001 */     addiu $t2, $zero, 1
  /* 142FAC 801339CC 240B0001 */     addiu $t3, $zero, 1
  /* 142FB0 801339D0 AFAB0030 */        sw $t3, 0x30($sp)
  /* 142FB4 801339D4 AFAA0028 */        sw $t2, 0x28($sp)
  /* 142FB8 801339D8 AFA90024 */        sw $t1, 0x24($sp)
  /* 142FBC 801339DC AFA80020 */        sw $t0, 0x20($sp)
  /* 142FC0 801339E0 AFB80018 */        sw $t8, 0x18($sp)
  /* 142FC4 801339E4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 142FC8 801339E8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 142FCC 801339EC AFB9001C */        sw $t9, 0x1c($sp)
  /* 142FD0 801339F0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 142FD4 801339F4 AFA00034 */        sw $zero, 0x34($sp)
  /* 142FD8 801339F8 24040401 */     addiu $a0, $zero, 0x401
  /* 142FDC 801339FC 00002825 */        or $a1, $zero, $zero
  /* 142FE0 80133A00 24060010 */     addiu $a2, $zero, 0x10
  /* 142FE4 80133A04 0C002E4F */       jal func_8000B93C
  /* 142FE8 80133A08 3C078000 */       lui $a3, 0x8000
  /* 142FEC 80133A0C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 142FF0 80133A10 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 142FF4 80133A14 8C430074 */        lw $v1, 0x74($v0)
  /* 142FF8 80133A18 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 142FFC 80133A1C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 143000 80133A20 44050000 */      mfc1 $a1, $f0
  /* 143004 80133A24 44060000 */      mfc1 $a2, $f0
  /* 143008 80133A28 3C07439B */       lui $a3, 0x439b
  /* 14300C 80133A2C 24640008 */     addiu $a0, $v1, 8
  /* 143010 80133A30 AFA30044 */        sw $v1, 0x44($sp)
  /* 143014 80133A34 0C001C20 */       jal func_80007080
  /* 143018 80133A38 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 14301C 80133A3C 8FA30044 */        lw $v1, 0x44($sp)
  /* 143020 80133A40 44800000 */      mtc1 $zero, $f0
  /* 143024 80133A44 3C018014 */       lui $at, %hi(D_ovl28_80138534)
  /* 143028 80133A48 240C0004 */     addiu $t4, $zero, 4
  /* 14302C 80133A4C E460003C */      swc1 $f0, 0x3c($v1)
  /* 143030 80133A50 E4600040 */      swc1 $f0, 0x40($v1)
  /* 143034 80133A54 C4268534 */      lwc1 $f6, %lo(D_ovl28_80138534)($at)
  /* 143038 80133A58 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 14303C 80133A5C 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 143040 80133A60 AC6C0080 */        sw $t4, 0x80($v1)
  /* 143044 80133A64 E4600048 */      swc1 $f0, 0x48($v1)
  /* 143048 80133A68 E460004C */      swc1 $f0, 0x4c($v1)
  /* 14304C 80133A6C E4600050 */      swc1 $f0, 0x50($v1)
  /* 143050 80133A70 E4600054 */      swc1 $f0, 0x54($v1)
  /* 143054 80133A74 E460005C */      swc1 $f0, 0x5c($v1)
  /* 143058 80133A78 E4660044 */      swc1 $f6, 0x44($v1)
  /* 14305C 80133A7C E4680058 */      swc1 $f8, 0x58($v1)
  /* 143060 80133A80 8FBF003C */        lw $ra, 0x3c($sp)
  /* 143064 80133A84 27BD0048 */     addiu $sp, $sp, 0x48
  /* 143068 80133A88 03E00008 */        jr $ra
  /* 14306C 80133A8C 00000000 */       nop

glabel mnTrainingRedrawCursor
  /* 143070 80133A90 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 143074 80133A94 3C0F8014 */       lui $t7, %hi(dMNTrainingCursorTypeColors)
  /* 143078 80133A98 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14307C 80133A9C AFA5007C */        sw $a1, 0x7c($sp)
  /* 143080 80133AA0 AFA60080 */        sw $a2, 0x80($sp)
  /* 143084 80133AA4 25EF82B4 */     addiu $t7, $t7, %lo(dMNTrainingCursorTypeColors)
  /* 143088 80133AA8 8DF90000 */        lw $t9, ($t7) # dMNTrainingCursorTypeColors + 0
  /* 14308C 80133AAC 8DF80004 */        lw $t8, 4($t7) # dMNTrainingCursorTypeColors + 4
  /* 143090 80133AB0 27AE0054 */     addiu $t6, $sp, 0x54
  /* 143094 80133AB4 ADD90000 */        sw $t9, ($t6)
  /* 143098 80133AB8 ADD80004 */        sw $t8, 4($t6)
  /* 14309C 80133ABC 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingCursorTypeColors + 12
  /* 1430A0 80133AC0 8DF90008 */        lw $t9, 8($t7) # dMNTrainingCursorTypeColors + 8
  /* 1430A4 80133AC4 3C098014 */       lui $t1, %hi(dMNTrainingCursorTypeOffsets)
  /* 1430A8 80133AC8 ADD8000C */        sw $t8, 0xc($t6)
  /* 1430AC 80133ACC ADD90008 */        sw $t9, 8($t6)
  /* 1430B0 80133AD0 8DF90010 */        lw $t9, 0x10($t7) # dMNTrainingCursorTypeColors + 16
  /* 1430B4 80133AD4 8DF80014 */        lw $t8, 0x14($t7) # dMNTrainingCursorTypeColors + 20
  /* 1430B8 80133AD8 252982CC */     addiu $t1, $t1, %lo(dMNTrainingCursorTypeOffsets)
  /* 1430BC 80133ADC ADD90010 */        sw $t9, 0x10($t6)
  /* 1430C0 80133AE0 ADD80014 */        sw $t8, 0x14($t6)
  /* 1430C4 80133AE4 8D2A0004 */        lw $t2, 4($t1) # dMNTrainingCursorTypeOffsets + 4
  /* 1430C8 80133AE8 8D2B0000 */        lw $t3, ($t1) # dMNTrainingCursorTypeOffsets + 0
  /* 1430CC 80133AEC 27A80044 */     addiu $t0, $sp, 0x44
  /* 1430D0 80133AF0 AD0A0004 */        sw $t2, 4($t0)
  /* 1430D4 80133AF4 AD0B0000 */        sw $t3, ($t0)
  /* 1430D8 80133AF8 8D2B0008 */        lw $t3, 8($t1) # dMNTrainingCursorTypeOffsets + 8
  /* 1430DC 80133AFC 8D2A000C */        lw $t2, 0xc($t1) # dMNTrainingCursorTypeOffsets + 12
  /* 1430E0 80133B00 3C0D8014 */       lui $t5, %hi(dMNTrainingCursorOffsets)
  /* 1430E4 80133B04 25AD82DC */     addiu $t5, $t5, %lo(dMNTrainingCursorOffsets)
  /* 1430E8 80133B08 AD0B0008 */        sw $t3, 8($t0)
  /* 1430EC 80133B0C AD0A000C */        sw $t2, 0xc($t0)
  /* 1430F0 80133B10 8DAF0000 */        lw $t7, ($t5) # dMNTrainingCursorOffsets + 0
  /* 1430F4 80133B14 27AC0038 */     addiu $t4, $sp, 0x38
  /* 1430F8 80133B18 8DAE0004 */        lw $t6, 4($t5) # dMNTrainingCursorOffsets + 4
  /* 1430FC 80133B1C AD8F0000 */        sw $t7, ($t4)
  /* 143100 80133B20 8DAF0008 */        lw $t7, 8($t5) # dMNTrainingCursorOffsets + 8
  /* 143104 80133B24 3C198014 */       lui $t9, %hi(dMNTrainingCursorTypePositions)
  /* 143108 80133B28 273982E8 */     addiu $t9, $t9, %lo(dMNTrainingCursorTypePositions)
  /* 14310C 80133B2C AD8E0004 */        sw $t6, 4($t4)
  /* 143110 80133B30 AD8F0008 */        sw $t7, 8($t4)
  /* 143114 80133B34 8F280004 */        lw $t0, 4($t9) # dMNTrainingCursorTypePositions + 4
  /* 143118 80133B38 8F290000 */        lw $t1, ($t9) # dMNTrainingCursorTypePositions + 0
  /* 14311C 80133B3C 27B80020 */     addiu $t8, $sp, 0x20
  /* 143120 80133B40 AF080004 */        sw $t0, 4($t8)
  /* 143124 80133B44 AF090000 */        sw $t1, ($t8)
  /* 143128 80133B48 8F290008 */        lw $t1, 8($t9) # dMNTrainingCursorTypePositions + 8
  /* 14312C 80133B4C 8F28000C */        lw $t0, 0xc($t9) # dMNTrainingCursorTypePositions + 12
  /* 143130 80133B50 AF090008 */        sw $t1, 8($t8)
  /* 143134 80133B54 AF08000C */        sw $t0, 0xc($t8)
  /* 143138 80133B58 8F280014 */        lw $t0, 0x14($t9) # dMNTrainingCursorTypePositions + 20
  /* 14313C 80133B5C 8F290010 */        lw $t1, 0x10($t9) # dMNTrainingCursorTypePositions + 16
  /* 143140 80133B60 AF080014 */        sw $t0, 0x14($t8)
  /* 143144 80133B64 AF090010 */        sw $t1, 0x10($t8)
  /* 143148 80133B68 8C820074 */        lw $v0, 0x74($a0)
  /* 14314C 80133B6C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 143150 80133B70 E7A40070 */      swc1 $f4, 0x70($sp)
  /* 143154 80133B74 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 143158 80133B78 AFA40078 */        sw $a0, 0x78($sp)
  /* 14315C 80133B7C 0C002DD8 */       jal func_8000B760
  /* 143160 80133B80 E7A6006C */      swc1 $f6, 0x6c($sp)
  /* 143164 80133B84 8FAA0080 */        lw $t2, 0x80($sp)
  /* 143168 80133B88 3C0D8014 */       lui $t5, %hi(D_ovl28_80138C98)
  /* 14316C 80133B8C 8DAD8C98 */        lw $t5, %lo(D_ovl28_80138C98)($t5)
  /* 143170 80133B90 000A5880 */       sll $t3, $t2, 2
  /* 143174 80133B94 03AB6021 */      addu $t4, $sp, $t3
  /* 143178 80133B98 8D8C0038 */        lw $t4, 0x38($t4)
  /* 14317C 80133B9C 8FA40078 */        lw $a0, 0x78($sp)
  /* 143180 80133BA0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143184 80133BA4 018D2821 */      addu $a1, $t4, $t5
  /* 143188 80133BA8 C7A80070 */      lwc1 $f8, 0x70($sp)
  /* 14318C 80133BAC 944E0024 */       lhu $t6, 0x24($v0)
  /* 143190 80133BB0 3C0B8014 */       lui $t3, %hi(D_ovl28_80138C98)
  /* 143194 80133BB4 E4480058 */      swc1 $f8, 0x58($v0)
  /* 143198 80133BB8 C7AA006C */      lwc1 $f10, 0x6c($sp)
  /* 14319C 80133BBC 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 1431A0 80133BC0 A4580024 */        sh $t8, 0x24($v0)
  /* 1431A4 80133BC4 37190001 */       ori $t9, $t8, 1
  /* 1431A8 80133BC8 A4590024 */        sh $t9, 0x24($v0)
  /* 1431AC 80133BCC E44A005C */      swc1 $f10, 0x5c($v0)
  /* 1431B0 80133BD0 8FA8007C */        lw $t0, 0x7c($sp)
  /* 1431B4 80133BD4 8D6B8C98 */        lw $t3, %lo(D_ovl28_80138C98)($t3)
  /* 1431B8 80133BD8 8FA40078 */        lw $a0, 0x78($sp)
  /* 1431BC 80133BDC 00084880 */       sll $t1, $t0, 2
  /* 1431C0 80133BE0 03A95021 */      addu $t2, $sp, $t1
  /* 1431C4 80133BE4 8D4A0044 */        lw $t2, 0x44($t2)
  /* 1431C8 80133BE8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1431CC 80133BEC 014B2821 */      addu $a1, $t2, $t3
  /* 1431D0 80133BF0 8FAC0080 */        lw $t4, 0x80($sp)
  /* 1431D4 80133BF4 27AE0020 */     addiu $t6, $sp, 0x20
  /* 1431D8 80133BF8 8C45000C */        lw $a1, 0xc($v0)
  /* 1431DC 80133BFC 000C68C0 */       sll $t5, $t4, 3
  /* 1431E0 80133C00 01AE2021 */      addu $a0, $t5, $t6
  /* 1431E4 80133C04 8C8F0000 */        lw $t7, ($a0)
  /* 1431E8 80133C08 C4A40058 */      lwc1 $f4, 0x58($a1)
  /* 1431EC 80133C0C 94590024 */       lhu $t9, 0x24($v0)
  /* 1431F0 80133C10 448F8000 */      mtc1 $t7, $f16
  /* 1431F4 80133C14 27AD0054 */     addiu $t5, $sp, 0x54
  /* 1431F8 80133C18 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1431FC 80133C1C 468084A0 */   cvt.s.w $f18, $f16
  /* 143200 80133C20 352A0001 */       ori $t2, $t1, 1
  /* 143204 80133C24 46049180 */     add.s $f6, $f18, $f4
  /* 143208 80133C28 E4460058 */      swc1 $f6, 0x58($v0)
  /* 14320C 80133C2C 8C980004 */        lw $t8, 4($a0)
  /* 143210 80133C30 C4B0005C */      lwc1 $f16, 0x5c($a1)
  /* 143214 80133C34 A4490024 */        sh $t1, 0x24($v0)
  /* 143218 80133C38 44984000 */      mtc1 $t8, $f8
  /* 14321C 80133C3C A44A0024 */        sh $t2, 0x24($v0)
  /* 143220 80133C40 468042A0 */   cvt.s.w $f10, $f8
  /* 143224 80133C44 46105480 */     add.s $f18, $f10, $f16
  /* 143228 80133C48 E452005C */      swc1 $f18, 0x5c($v0)
  /* 14322C 80133C4C 8FAB007C */        lw $t3, 0x7c($sp)
  /* 143230 80133C50 000B6080 */       sll $t4, $t3, 2
  /* 143234 80133C54 018B6023 */      subu $t4, $t4, $t3
  /* 143238 80133C58 000C6040 */       sll $t4, $t4, 1
  /* 14323C 80133C5C 018D1821 */      addu $v1, $t4, $t5
  /* 143240 80133C60 906E0000 */       lbu $t6, ($v1)
  /* 143244 80133C64 A04E0028 */        sb $t6, 0x28($v0)
  /* 143248 80133C68 906F0001 */       lbu $t7, 1($v1)
  /* 14324C 80133C6C A04F0029 */        sb $t7, 0x29($v0)
  /* 143250 80133C70 90780002 */       lbu $t8, 2($v1)
  /* 143254 80133C74 A058002A */        sb $t8, 0x2a($v0)
  /* 143258 80133C78 90790003 */       lbu $t9, 3($v1)
  /* 14325C 80133C7C A0590060 */        sb $t9, 0x60($v0)
  /* 143260 80133C80 90680004 */       lbu $t0, 4($v1)
  /* 143264 80133C84 A0480061 */        sb $t0, 0x61($v0)
  /* 143268 80133C88 90690005 */       lbu $t1, 5($v1)
  /* 14326C 80133C8C A0490062 */        sb $t1, 0x62($v0)
  /* 143270 80133C90 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143274 80133C94 27BD0078 */     addiu $sp, $sp, 0x78
  /* 143278 80133C98 03E00008 */        jr $ra
  /* 14327C 80133C9C 00000000 */       nop

  /* 143280 80133CA0 03E00008 */        jr $ra
  /* 143284 80133CA4 00000000 */       nop

glabel mnTrainingUpdatePanels
  /* 143288 80133CA8 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 14328C 80133CAC 3C0F8014 */       lui $t7, %hi(dMNTrainingPanelColorIndexesUnused)
  /* 143290 80133CB0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 143294 80133CB4 25EF8300 */     addiu $t7, $t7, %lo(dMNTrainingPanelColorIndexesUnused)
  /* 143298 80133CB8 8DF90000 */        lw $t9, ($t7) # dMNTrainingPanelColorIndexesUnused + 0
  /* 14329C 80133CBC 8DF80004 */        lw $t8, 4($t7) # dMNTrainingPanelColorIndexesUnused + 4
  /* 1432A0 80133CC0 27AE001C */     addiu $t6, $sp, 0x1c
  /* 1432A4 80133CC4 ADD90000 */        sw $t9, ($t6)
  /* 1432A8 80133CC8 ADD80004 */        sw $t8, 4($t6)
  /* 1432AC 80133CCC 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingPanelColorIndexesUnused + 12
  /* 1432B0 80133CD0 8DF90008 */        lw $t9, 8($t7) # dMNTrainingPanelColorIndexesUnused + 8
  /* 1432B4 80133CD4 3C058014 */       lui $a1, %hi(gMNTrainingHumanPanelPort)
  /* 1432B8 80133CD8 ADD8000C */        sw $t8, 0xc($t6)
  /* 1432BC 80133CDC ADD90008 */        sw $t9, 8($t6)
  /* 1432C0 80133CE0 8CA58894 */        lw $a1, %lo(gMNTrainingHumanPanelPort)($a1)
  /* 1432C4 80133CE4 3C048014 */       lui $a0, %hi(D_ovl28_80138570)
  /* 1432C8 80133CE8 00054080 */       sll $t0, $a1, 2
  /* 1432CC 80133CEC 01054023 */      subu $t0, $t0, $a1
  /* 1432D0 80133CF0 000840C0 */       sll $t0, $t0, 3
  /* 1432D4 80133CF4 01054023 */      subu $t0, $t0, $a1
  /* 1432D8 80133CF8 000840C0 */       sll $t0, $t0, 3
  /* 1432DC 80133CFC 00882021 */      addu $a0, $a0, $t0
  /* 1432E0 80133D00 0C04CB09 */       jal mnTrainingUpdatePanel
  /* 1432E4 80133D04 8C848570 */        lw $a0, %lo(D_ovl28_80138570)($a0)
  /* 1432E8 80133D08 3C058014 */       lui $a1, %hi(gMNTrainingCPUPanelPort)
  /* 1432EC 80133D0C 8CA58898 */        lw $a1, %lo(gMNTrainingCPUPanelPort)($a1)
  /* 1432F0 80133D10 3C048014 */       lui $a0, %hi(D_ovl28_80138570)
  /* 1432F4 80133D14 00054880 */       sll $t1, $a1, 2
  /* 1432F8 80133D18 01254823 */      subu $t1, $t1, $a1
  /* 1432FC 80133D1C 000948C0 */       sll $t1, $t1, 3
  /* 143300 80133D20 01254823 */      subu $t1, $t1, $a1
  /* 143304 80133D24 000948C0 */       sll $t1, $t1, 3
  /* 143308 80133D28 00892021 */      addu $a0, $a0, $t1
  /* 14330C 80133D2C 0C04CB09 */       jal mnTrainingUpdatePanel
  /* 143310 80133D30 8C848570 */        lw $a0, %lo(D_ovl28_80138570)($a0)
  /* 143314 80133D34 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143318 80133D38 27BD0030 */     addiu $sp, $sp, 0x30
  /* 14331C 80133D3C 03E00008 */        jr $ra
  /* 143320 80133D40 00000000 */       nop

glabel mnTrainingCheckTokenPickup
  /* 143324 80133D44 00067080 */       sll $t6, $a2, 2
  /* 143328 80133D48 01C67023 */      subu $t6, $t6, $a2
  /* 14332C 80133D4C 000E70C0 */       sll $t6, $t6, 3
  /* 143330 80133D50 01C67023 */      subu $t6, $t6, $a2
  /* 143334 80133D54 AFA50004 */        sw $a1, 4($sp)
  /* 143338 80133D58 000E70C0 */       sll $t6, $t6, 3
  /* 14333C 80133D5C 3C0F8014 */       lui $t7, %hi(D_ovl28_8013855C)
  /* 143340 80133D60 8C820074 */        lw $v0, 0x74($a0)
  /* 143344 80133D64 01EE7821 */      addu $t7, $t7, $t6
  /* 143348 80133D68 8DEF855C */        lw $t7, %lo(D_ovl28_8013855C)($t7)
  /* 14334C 80133D6C 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 143350 80133D70 44813000 */      mtc1 $at, $f6 # 25.0 to cop1
  /* 143354 80133D74 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 143358 80133D78 8DE30074 */        lw $v1, 0x74($t7)
  /* 14335C 80133D7C 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 143360 80133D80 46062000 */     add.s $f0, $f4, $f6
  /* 143364 80133D84 C4620058 */      lwc1 $f2, 0x58($v1)
  /* 143368 80133D88 00002025 */        or $a0, $zero, $zero
  /* 14336C 80133D8C 4600103E */    c.le.s $f2, $f0
  /* 143370 80133D90 00000000 */       nop
  /* 143374 80133D94 4500000A */      bc1f .L80133DC0
  /* 143378 80133D98 00000000 */       nop
  /* 14337C 80133D9C 44814000 */      mtc1 $at, $f8 # 26.0 to cop1
  /* 143380 80133DA0 00000000 */       nop
  /* 143384 80133DA4 46081280 */     add.s $f10, $f2, $f8
  /* 143388 80133DA8 460A003E */    c.le.s $f0, $f10
  /* 14338C 80133DAC 00000000 */       nop
  /* 143390 80133DB0 45000003 */      bc1f .L80133DC0
  /* 143394 80133DB4 00000000 */       nop
  /* 143398 80133DB8 10000001 */         b .L80133DC0
  /* 14339C 80133DBC 24040001 */     addiu $a0, $zero, 1
  .L80133DC0:
  /* 1433A0 80133DC0 10800018 */      beqz $a0, .L80133E24
  /* 1433A4 80133DC4 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 1433A8 80133DC8 C450005C */      lwc1 $f16, 0x5c($v0)
  /* 1433AC 80133DCC 44819000 */      mtc1 $at, $f18 # 3.0 to cop1
  /* 1433B0 80133DD0 C462005C */      lwc1 $f2, 0x5c($v1)
  /* 1433B4 80133DD4 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 1433B8 80133DD8 46128000 */     add.s $f0, $f16, $f18
  /* 1433BC 80133DDC 00002025 */        or $a0, $zero, $zero
  /* 1433C0 80133DE0 4600103E */    c.le.s $f2, $f0
  /* 1433C4 80133DE4 00000000 */       nop
  /* 1433C8 80133DE8 4500000A */      bc1f .L80133E14
  /* 1433CC 80133DEC 00000000 */       nop
  /* 1433D0 80133DF0 44812000 */      mtc1 $at, $f4 # 24.0 to cop1
  /* 1433D4 80133DF4 00000000 */       nop
  /* 1433D8 80133DF8 46041180 */     add.s $f6, $f2, $f4
  /* 1433DC 80133DFC 4606003E */    c.le.s $f0, $f6
  /* 1433E0 80133E00 00000000 */       nop
  /* 1433E4 80133E04 45000003 */      bc1f .L80133E14
  /* 1433E8 80133E08 00000000 */       nop
  /* 1433EC 80133E0C 10000001 */         b .L80133E14
  /* 1433F0 80133E10 24040001 */     addiu $a0, $zero, 1
  .L80133E14:
  /* 1433F4 80133E14 50800004 */      beql $a0, $zero, .L80133E28
  /* 1433F8 80133E18 00001025 */        or $v0, $zero, $zero
  /* 1433FC 80133E1C 03E00008 */        jr $ra
  /* 143400 80133E20 24020001 */     addiu $v0, $zero, 1

  .L80133E24:
  /* 143404 80133E24 00001025 */        or $v0, $zero, $zero
  .L80133E28:
  /* 143408 80133E28 03E00008 */        jr $ra
  /* 14340C 80133E2C 00000000 */       nop

glabel mnTrainingSyncFighterDisplay
  /* 143410 80133E30 00047080 */       sll $t6, $a0, 2
  /* 143414 80133E34 01C47023 */      subu $t6, $t6, $a0
  /* 143418 80133E38 000E70C0 */       sll $t6, $t6, 3
  /* 14341C 80133E3C 01C47023 */      subu $t6, $t6, $a0
  /* 143420 80133E40 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 143424 80133E44 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 143428 80133E48 000E70C0 */       sll $t6, $t6, 3
  /* 14342C 80133E4C 01CF1821 */      addu $v1, $t6, $t7
  /* 143430 80133E50 8C650008 */        lw $a1, 8($v1)
  /* 143434 80133E54 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 143438 80133E58 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14343C 80133E5C 00803025 */        or $a2, $a0, $zero
  /* 143440 80133E60 10A0000B */      beqz $a1, .L80133E90
  /* 143444 80133E64 00001025 */        or $v0, $zero, $zero
  /* 143448 80133E68 8C780048 */        lw $t8, 0x48($v1)
  /* 14344C 80133E6C 2401001C */     addiu $at, $zero, 0x1c
  /* 143450 80133E70 17010007 */       bne $t8, $at, .L80133E90
  /* 143454 80133E74 00000000 */       nop
  /* 143458 80133E78 8C790054 */        lw $t9, 0x54($v1)
  /* 14345C 80133E7C 24080001 */     addiu $t0, $zero, 1
  /* 143460 80133E80 17200003 */      bnez $t9, .L80133E90
  /* 143464 80133E84 00000000 */       nop
  /* 143468 80133E88 ACA8007C */        sw $t0, 0x7c($a1)
  /* 14346C 80133E8C 24020001 */     addiu $v0, $zero, 1
  .L80133E90:
  /* 143470 80133E90 1440000D */      bnez $v0, .L80133EC8
  /* 143474 80133E94 00C02825 */        or $a1, $a2, $zero
  /* 143478 80133E98 8C640048 */        lw $a0, 0x48($v1)
  /* 14347C 80133E9C AFA3001C */        sw $v1, 0x1c($sp)
  /* 143480 80133EA0 0C04CD7C */       jal mnTrainingGetAvailableCostume
  /* 143484 80133EA4 AFA60028 */        sw $a2, 0x28($sp)
  /* 143488 80133EA8 8FA3001C */        lw $v1, 0x1c($sp)
  /* 14348C 80133EAC 8FA50028 */        lw $a1, 0x28($sp)
  /* 143490 80133EB0 00403825 */        or $a3, $v0, $zero
  /* 143494 80133EB4 8C640008 */        lw $a0, 8($v1)
  /* 143498 80133EB8 0C04CDEF */       jal mnTrainingSpawnFighter
  /* 14349C 80133EBC 8C660048 */        lw $a2, 0x48($v1)
  /* 1434A0 80133EC0 8FA3001C */        lw $v1, 0x1c($sp)
  /* 1434A4 80133EC4 AC600088 */        sw $zero, 0x88($v1)
  .L80133EC8:
  /* 1434A8 80133EC8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1434AC 80133ECC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1434B0 80133ED0 03E00008 */        jr $ra
  /* 1434B4 80133ED4 00000000 */       nop

  /* 1434B8 80133ED8 03E00008 */        jr $ra
  /* 1434BC 80133EDC 00000000 */       nop

glabel mnTrainingSyncNameAndLogo
  /* 1434C0 80133EE0 00047080 */       sll $t6, $a0, 2
  /* 1434C4 80133EE4 01C47023 */      subu $t6, $t6, $a0
  /* 1434C8 80133EE8 000E70C0 */       sll $t6, $t6, 3
  /* 1434CC 80133EEC 01C47023 */      subu $t6, $t6, $a0
  /* 1434D0 80133EF0 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 1434D4 80133EF4 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 1434D8 80133EF8 000E70C0 */       sll $t6, $t6, 3
  /* 1434DC 80133EFC 01CF1021 */      addu $v0, $t6, $t7
  /* 1434E0 80133F00 8C580080 */        lw $t8, 0x80($v0)
  /* 1434E4 80133F04 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1434E8 80133F08 24010002 */     addiu $at, $zero, 2
  /* 1434EC 80133F0C AFBF0014 */        sw $ra, 0x14($sp)
  /* 1434F0 80133F10 13010008 */       beq $t8, $at, .L80133F34
  /* 1434F4 80133F14 00802825 */        or $a1, $a0, $zero
  /* 1434F8 80133F18 8C590048 */        lw $t9, 0x48($v0)
  /* 1434FC 80133F1C 2401001C */     addiu $at, $zero, 0x1c
  /* 143500 80133F20 57210009 */      bnel $t9, $at, .L80133F48
  /* 143504 80133F24 8C4B0010 */        lw $t3, 0x10($v0)
  /* 143508 80133F28 8C480054 */        lw $t0, 0x54($v0)
  /* 14350C 80133F2C 55000006 */      bnel $t0, $zero, .L80133F48
  /* 143510 80133F30 8C4B0010 */        lw $t3, 0x10($v0)
  .L80133F34:
  /* 143514 80133F34 8C4A0010 */        lw $t2, 0x10($v0)
  /* 143518 80133F38 24090001 */     addiu $t1, $zero, 1
  /* 14351C 80133F3C 10000006 */         b .L80133F58
  /* 143520 80133F40 AD49007C */        sw $t1, 0x7c($t2)
  /* 143524 80133F44 8C4B0010 */        lw $t3, 0x10($v0)
  .L80133F48:
  /* 143528 80133F48 AD60007C */        sw $zero, 0x7c($t3)
  /* 14352C 80133F4C 8C460048 */        lw $a2, 0x48($v0)
  /* 143530 80133F50 0C04C975 */       jal mnTrainingSetNameAndLogo
  /* 143534 80133F54 8C440010 */        lw $a0, 0x10($v0)
  .L80133F58:
  /* 143538 80133F58 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14353C 80133F5C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 143540 80133F60 03E00008 */        jr $ra
  /* 143544 80133F64 00000000 */       nop

glabel mnTrainingRemoveWhiteSquare
  /* 143548 80133F68 00047080 */       sll $t6, $a0, 2
  /* 14354C 80133F6C 01C47023 */      subu $t6, $t6, $a0
  /* 143550 80133F70 000E70C0 */       sll $t6, $t6, 3
  /* 143554 80133F74 01C47023 */      subu $t6, $t6, $a0
  /* 143558 80133F78 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 14355C 80133F7C 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 143560 80133F80 000E70C0 */       sll $t6, $t6, 3
  /* 143564 80133F84 01CF1021 */      addu $v0, $t6, $t7
  /* 143568 80133F88 8C45002C */        lw $a1, 0x2c($v0)
  /* 14356C 80133F8C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 143570 80133F90 AFBF0014 */        sw $ra, 0x14($sp)
  /* 143574 80133F94 10A00003 */      beqz $a1, .L80133FA4
  /* 143578 80133F98 00A02025 */        or $a0, $a1, $zero
  /* 14357C 80133F9C 0C0026A1 */       jal omEjectGObj
  /* 143580 80133FA0 AC40002C */        sw $zero, 0x2c($v0)
  .L80133FA4:
  /* 143584 80133FA4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143588 80133FA8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14358C 80133FAC 03E00008 */        jr $ra
  /* 143590 80133FB0 00000000 */       nop

glabel mnTrainingFlashWhiteSquare
  /* 143594 80133FB4 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 143598 80133FB8 AFB30020 */        sw $s3, 0x20($sp)
  /* 14359C 80133FBC AFB2001C */        sw $s2, 0x1c($sp)
  /* 1435A0 80133FC0 AFB10018 */        sw $s1, 0x18($sp)
  /* 1435A4 80133FC4 AFB00014 */        sw $s0, 0x14($sp)
  /* 1435A8 80133FC8 00808825 */        or $s1, $a0, $zero
  /* 1435AC 80133FCC AFBF0024 */        sw $ra, 0x24($sp)
  /* 1435B0 80133FD0 24120010 */     addiu $s2, $zero, 0x10
  /* 1435B4 80133FD4 24100001 */     addiu $s0, $zero, 1
  /* 1435B8 80133FD8 24130001 */     addiu $s3, $zero, 1
  /* 1435BC 80133FDC 2652FFFF */     addiu $s2, $s2, -1
  .L80133FE0:
  /* 1435C0 80133FE0 16400003 */      bnez $s2, .L80133FF0
  /* 1435C4 80133FE4 2610FFFF */     addiu $s0, $s0, -1
  /* 1435C8 80133FE8 0C04CFDA */       jal mnTrainingRemoveWhiteSquare
  /* 1435CC 80133FEC 8E240084 */        lw $a0, 0x84($s1)
  .L80133FF0:
  /* 1435D0 80133FF0 16000008 */      bnez $s0, .L80134014
  /* 1435D4 80133FF4 00000000 */       nop
  /* 1435D8 80133FF8 8E2E007C */        lw $t6, 0x7c($s1)
  /* 1435DC 80133FFC 24100001 */     addiu $s0, $zero, 1
  /* 1435E0 80134000 566E0004 */      bnel $s3, $t6, .L80134014
  /* 1435E4 80134004 AE33007C */        sw $s3, 0x7c($s1)
  /* 1435E8 80134008 10000002 */         b .L80134014
  /* 1435EC 8013400C AE20007C */        sw $zero, 0x7c($s1)
  /* 1435F0 80134010 AE33007C */        sw $s3, 0x7c($s1)
  .L80134014:
  /* 1435F4 80134014 0C002C7A */       jal gsStopCurrentProcess
  /* 1435F8 80134018 24040001 */     addiu $a0, $zero, 1
  /* 1435FC 8013401C 1000FFF0 */         b .L80133FE0
  /* 143600 80134020 2652FFFF */     addiu $s2, $s2, -1
  /* 143604 80134024 00000000 */       nop
  /* 143608 80134028 00000000 */       nop
  /* 14360C 8013402C 00000000 */       nop
# Maybe start of new file
  /* 143610 80134030 00000000 */       nop
  /* 143614 80134034 00000000 */       nop
  /* 143618 80134038 00000000 */       nop
  /* 14361C 8013403C 00000000 */       nop
# Maybe start of new file
  /* 143620 80134040 8FBF0024 */        lw $ra, 0x24($sp)
  /* 143624 80134044 8FB00014 */        lw $s0, 0x14($sp)
  /* 143628 80134048 8FB10018 */        lw $s1, 0x18($sp)
  /* 14362C 8013404C 8FB2001C */        lw $s2, 0x1c($sp)
  /* 143630 80134050 8FB30020 */        lw $s3, 0x20($sp)
  /* 143634 80134054 03E00008 */        jr $ra
  /* 143638 80134058 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnTrainingCreateWhiteSquare
  /* 14363C 8013405C 00047880 */       sll $t7, $a0, 2
  /* 143640 80134060 01E47823 */      subu $t7, $t7, $a0
  /* 143644 80134064 000F78C0 */       sll $t7, $t7, 3
  /* 143648 80134068 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14364C 8013406C 01E47823 */      subu $t7, $t7, $a0
  /* 143650 80134070 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 143654 80134074 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 143658 80134078 000F78C0 */       sll $t7, $t7, 3
  /* 14365C 8013407C AFBF0024 */        sw $ra, 0x24($sp)
  /* 143660 80134080 AFA40040 */        sw $a0, 0x40($sp)
  /* 143664 80134084 01F81021 */      addu $v0, $t7, $t8
  /* 143668 80134088 AFB00020 */        sw $s0, 0x20($sp)
  /* 14366C 8013408C 8C440048 */        lw $a0, 0x48($v0)
  /* 143670 80134090 0C04C808 */       jal mnTrainingGetPortraitId
  /* 143674 80134094 AFA2002C */        sw $v0, 0x2c($sp)
  /* 143678 80134098 00408025 */        or $s0, $v0, $zero
  /* 14367C 8013409C 0C04CFDA */       jal mnTrainingRemoveWhiteSquare
  /* 143680 801340A0 8FA40040 */        lw $a0, 0x40($sp)
  /* 143684 801340A4 00002025 */        or $a0, $zero, $zero
  /* 143688 801340A8 00002825 */        or $a1, $zero, $zero
  /* 14368C 801340AC 2406001E */     addiu $a2, $zero, 0x1e
  /* 143690 801340B0 0C00265A */       jal omMakeGObjSPAfter
  /* 143694 801340B4 3C078000 */       lui $a3, 0x8000
  /* 143698 801340B8 8FB9002C */        lw $t9, 0x2c($sp)
  /* 14369C 801340BC AFA2003C */        sw $v0, 0x3c($sp)
  /* 1436A0 801340C0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1436A4 801340C4 2408FFFF */     addiu $t0, $zero, -1
  /* 1436A8 801340C8 AF22002C */        sw $v0, 0x2c($t9)
  /* 1436AC 801340CC AFA80010 */        sw $t0, 0x10($sp)
  /* 1436B0 801340D0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1436B4 801340D4 00402025 */        or $a0, $v0, $zero
  /* 1436B8 801340D8 24060025 */     addiu $a2, $zero, 0x25
  /* 1436BC 801340DC 0C00277D */       jal omAddGObjRenderProc
  /* 1436C0 801340E0 3C078000 */       lui $a3, 0x8000
  /* 1436C4 801340E4 8FA4003C */        lw $a0, 0x3c($sp)
  /* 1436C8 801340E8 8FA90040 */        lw $t1, 0x40($sp)
  /* 1436CC 801340EC 3C058013 */       lui $a1, %hi(mnTrainingFlashWhiteSquare)
  /* 1436D0 801340F0 24A53FB4 */     addiu $a1, $a1, %lo(mnTrainingFlashWhiteSquare)
  /* 1436D4 801340F4 00003025 */        or $a2, $zero, $zero
  /* 1436D8 801340F8 24070001 */     addiu $a3, $zero, 1
  /* 1436DC 801340FC 0C002062 */       jal omAddGObjCommonProc
  /* 1436E0 80134100 AC890084 */        sw $t1, 0x84($a0)
  /* 1436E4 80134104 3C0A8014 */       lui $t2, %hi(D_ovl28_80138CB0)
  /* 1436E8 80134108 8D4A8CB0 */        lw $t2, %lo(D_ovl28_80138CB0)($t2)
  /* 1436EC 8013410C 3C0B0000 */       lui $t3, %hi(D_NF_000006F0)
  /* 1436F0 80134110 256B06F0 */     addiu $t3, $t3, %lo(D_NF_000006F0)
  /* 1436F4 80134114 8FA4003C */        lw $a0, 0x3c($sp)
  /* 1436F8 80134118 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1436FC 8013411C 014B2821 */      addu $a1, $t2, $t3
  /* 143700 80134120 2A010006 */      slti $at, $s0, 6
  /* 143704 80134124 14200003 */      bnez $at, .L80134134
  /* 143708 80134128 02001825 */        or $v1, $s0, $zero
  /* 14370C 8013412C 10000001 */         b .L80134134
  /* 143710 80134130 2603FFFA */     addiu $v1, $s0, -6
  .L80134134:
  /* 143714 80134134 00036080 */       sll $t4, $v1, 2
  /* 143718 80134138 01836023 */      subu $t4, $t4, $v1
  /* 14371C 8013413C 000C6080 */       sll $t4, $t4, 2
  /* 143720 80134140 01836023 */      subu $t4, $t4, $v1
  /* 143724 80134144 000C6080 */       sll $t4, $t4, 2
  /* 143728 80134148 01836021 */      addu $t4, $t4, $v1
  /* 14372C 8013414C 258D001A */     addiu $t5, $t4, 0x1a
  /* 143730 80134150 448D2000 */      mtc1 $t5, $f4
  /* 143734 80134154 2A010006 */      slti $at, $s0, 6
  /* 143738 80134158 00001825 */        or $v1, $zero, $zero
  /* 14373C 8013415C 468021A0 */   cvt.s.w $f6, $f4
  /* 143740 80134160 14200003 */      bnez $at, .L80134170
  /* 143744 80134164 E4460058 */      swc1 $f6, 0x58($v0)
  /* 143748 80134168 10000001 */         b .L80134170
  /* 14374C 8013416C 24030001 */     addiu $v1, $zero, 1
  .L80134170:
  /* 143750 80134170 00037080 */       sll $t6, $v1, 2
  /* 143754 80134174 01C37023 */      subu $t6, $t6, $v1
  /* 143758 80134178 000E7080 */       sll $t6, $t6, 2
  /* 14375C 8013417C 01C37023 */      subu $t6, $t6, $v1
  /* 143760 80134180 000E7080 */       sll $t6, $t6, 2
  /* 143764 80134184 01C37023 */      subu $t6, $t6, $v1
  /* 143768 80134188 25CF0025 */     addiu $t7, $t6, 0x25
  /* 14376C 8013418C 448F4000 */      mtc1 $t7, $f8
  /* 143770 80134190 00000000 */       nop
  /* 143774 80134194 468042A0 */   cvt.s.w $f10, $f8
  /* 143778 80134198 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 14377C 8013419C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 143780 801341A0 8FB00020 */        lw $s0, 0x20($sp)
  /* 143784 801341A4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 143788 801341A8 03E00008 */        jr $ra
  /* 14378C 801341AC 00000000 */       nop

glabel mnTrainingAnnounceFighter
  /* 143790 801341B0 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 143794 801341B4 3C0F8014 */       lui $t7, %hi(dMNTrainingAnnouncerNames)
  /* 143798 801341B8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14379C 801341BC AFA50044 */        sw $a1, 0x44($sp)
  /* 1437A0 801341C0 25EF8310 */     addiu $t7, $t7, %lo(dMNTrainingAnnouncerNames)
  /* 1437A4 801341C4 8DF90000 */        lw $t9, ($t7) # dMNTrainingAnnouncerNames + 0
  /* 1437A8 801341C8 8DF80004 */        lw $t8, 4($t7) # dMNTrainingAnnouncerNames + 4
  /* 1437AC 801341CC 27AE0028 */     addiu $t6, $sp, 0x28
  /* 1437B0 801341D0 ADD90000 */        sw $t9, ($t6)
  /* 1437B4 801341D4 ADD80004 */        sw $t8, 4($t6)
  /* 1437B8 801341D8 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingAnnouncerNames + 12
  /* 1437BC 801341DC 8DF90008 */        lw $t9, 8($t7) # dMNTrainingAnnouncerNames + 8
  /* 1437C0 801341E0 00044080 */       sll $t0, $a0, 2
  /* 1437C4 801341E4 01044023 */      subu $t0, $t0, $a0
  /* 1437C8 801341E8 ADD8000C */        sw $t8, 0xc($t6)
  /* 1437CC 801341EC ADD90008 */        sw $t9, 8($t6)
  /* 1437D0 801341F0 8DF90010 */        lw $t9, 0x10($t7) # dMNTrainingAnnouncerNames + 16
  /* 1437D4 801341F4 8DF80014 */        lw $t8, 0x14($t7) # dMNTrainingAnnouncerNames + 20
  /* 1437D8 801341F8 000840C0 */       sll $t0, $t0, 3
  /* 1437DC 801341FC 01044023 */      subu $t0, $t0, $a0
  /* 1437E0 80134200 3C098014 */       lui $t1, %hi(gMNTrainingPanels)
  /* 1437E4 80134204 25298558 */     addiu $t1, $t1, %lo(gMNTrainingPanels)
  /* 1437E8 80134208 000840C0 */       sll $t0, $t0, 3
  /* 1437EC 8013420C 01091821 */      addu $v1, $t0, $t1
  /* 1437F0 80134210 ADD90010 */        sw $t9, 0x10($t6)
  /* 1437F4 80134214 ADD80014 */        sw $t8, 0x14($t6)
  /* 1437F8 80134218 8C6600A4 */        lw $a2, 0xa4($v1)
  /* 1437FC 8013421C 50C0000C */      beql $a2, $zero, .L80134250
  /* 143800 80134220 24040079 */     addiu $a0, $zero, 0x79
  /* 143804 80134224 94C20026 */       lhu $v0, 0x26($a2)
  /* 143808 80134228 50400009 */      beql $v0, $zero, .L80134250
  /* 14380C 8013422C 24040079 */     addiu $a0, $zero, 0x79
  /* 143810 80134230 946A00A8 */       lhu $t2, 0xa8($v1)
  /* 143814 80134234 00C02025 */        or $a0, $a2, $zero
  /* 143818 80134238 544A0005 */      bnel $v0, $t2, .L80134250
  /* 14381C 8013423C 24040079 */     addiu $a0, $zero, 0x79
  /* 143820 80134240 0C0099CE */       jal func_80026738
  /* 143824 80134244 AFA30024 */        sw $v1, 0x24($sp)
  /* 143828 80134248 8FA30024 */        lw $v1, 0x24($sp)
  /* 14382C 8013424C 24040079 */     addiu $a0, $zero, 0x79
  .L80134250:
  /* 143830 80134250 0C009A70 */       jal func_800269C0
  /* 143834 80134254 AFA30024 */        sw $v1, 0x24($sp)
  /* 143838 80134258 8FAB0044 */        lw $t3, 0x44($sp)
  /* 14383C 8013425C 3C0D8014 */       lui $t5, %hi(D_ovl28_801385A0)
  /* 143840 80134260 000B6080 */       sll $t4, $t3, 2
  /* 143844 80134264 018B6023 */      subu $t4, $t4, $t3
  /* 143848 80134268 000C60C0 */       sll $t4, $t4, 3
  /* 14384C 8013426C 018B6023 */      subu $t4, $t4, $t3
  /* 143850 80134270 000C60C0 */       sll $t4, $t4, 3
  /* 143854 80134274 01AC6821 */      addu $t5, $t5, $t4
  /* 143858 80134278 8DAD85A0 */        lw $t5, %lo(D_ovl28_801385A0)($t5)
  /* 14385C 8013427C 000D7040 */       sll $t6, $t5, 1
  /* 143860 80134280 03AE2021 */      addu $a0, $sp, $t6
  /* 143864 80134284 0C009A70 */       jal func_800269C0
  /* 143868 80134288 94840028 */       lhu $a0, 0x28($a0)
  /* 14386C 8013428C 8FA30024 */        lw $v1, 0x24($sp)
  /* 143870 80134290 10400003 */      beqz $v0, .L801342A0
  /* 143874 80134294 AC6200A4 */        sw $v0, 0xa4($v1)
  /* 143878 80134298 94580026 */       lhu $t8, 0x26($v0)
  /* 14387C 8013429C A47800A8 */        sh $t8, 0xa8($v1)
  .L801342A0:
  /* 143880 801342A0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143884 801342A4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 143888 801342A8 03E00008 */        jr $ra
  /* 14388C 801342AC 00000000 */       nop

  /* 143890 801342B0 03E00008 */        jr $ra
  /* 143894 801342B4 00000000 */       nop

glabel mnTrainingRemoveHandicapCPULevel
  /* 143898 801342B8 00047080 */       sll $t6, $a0, 2
  /* 14389C 801342BC 01C47023 */      subu $t6, $t6, $a0
  /* 1438A0 801342C0 000E70C0 */       sll $t6, $t6, 3
  /* 1438A4 801342C4 01C47023 */      subu $t6, $t6, $a0
  /* 1438A8 801342C8 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 1438AC 801342CC 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 1438B0 801342D0 000E70C0 */       sll $t6, $t6, 3
  /* 1438B4 801342D4 01CF1021 */      addu $v0, $t6, $t7
  /* 1438B8 801342D8 8C450020 */        lw $a1, 0x20($v0)
  /* 1438BC 801342DC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1438C0 801342E0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1438C4 801342E4 10A00004 */      beqz $a1, .L801342F8
  /* 1438C8 801342E8 00A02025 */        or $a0, $a1, $zero
  /* 1438CC 801342EC 0C0026A1 */       jal omEjectGObj
  /* 1438D0 801342F0 AFA2001C */        sw $v0, 0x1c($sp)
  /* 1438D4 801342F4 8FA2001C */        lw $v0, 0x1c($sp)
  .L801342F8:
  /* 1438D8 801342F8 8C440024 */        lw $a0, 0x24($v0)
  /* 1438DC 801342FC 50800005 */      beql $a0, $zero, .L80134314
  /* 1438E0 80134300 8C440028 */        lw $a0, 0x28($v0)
  /* 1438E4 80134304 0C0026A1 */       jal omEjectGObj
  /* 1438E8 80134308 AFA2001C */        sw $v0, 0x1c($sp)
  /* 1438EC 8013430C 8FA2001C */        lw $v0, 0x1c($sp)
  /* 1438F0 80134310 8C440028 */        lw $a0, 0x28($v0)
  .L80134314:
  /* 1438F4 80134314 50800005 */      beql $a0, $zero, .L8013432C
  /* 1438F8 80134318 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1438FC 8013431C 0C0026A1 */       jal omEjectGObj
  /* 143900 80134320 AFA2001C */        sw $v0, 0x1c($sp)
  /* 143904 80134324 8FA2001C */        lw $v0, 0x1c($sp)
  /* 143908 80134328 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013432C:
  /* 14390C 8013432C AC400020 */        sw $zero, 0x20($v0)
  /* 143910 80134330 AC400024 */        sw $zero, 0x24($v0)
  /* 143914 80134334 AC400028 */        sw $zero, 0x28($v0)
  /* 143918 80134338 03E00008 */        jr $ra
  /* 14391C 8013433C 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnTrainingGetArrowSObj
  /* 143920 80134340 8C830074 */        lw $v1, 0x74($a0)
  /* 143924 80134344 00001025 */        or $v0, $zero, $zero
  /* 143928 80134348 1060000E */      beqz $v1, .L80134384
  /* 14392C 8013434C 00000000 */       nop
  /* 143930 80134350 8C6E0054 */        lw $t6, 0x54($v1)
  /* 143934 80134354 54AE0004 */      bnel $a1, $t6, .L80134368
  /* 143938 80134358 8C640008 */        lw $a0, 8($v1)
  /* 14393C 8013435C 03E00008 */        jr $ra
  /* 143940 80134360 00601025 */        or $v0, $v1, $zero

  /* 143944 80134364 8C640008 */        lw $a0, 8($v1)
  .L80134368:
  /* 143948 80134368 10800006 */      beqz $a0, .L80134384
  /* 14394C 8013436C 00000000 */       nop
  /* 143950 80134370 8C8F0054 */        lw $t7, 0x54($a0)
  /* 143954 80134374 14AF0003 */       bne $a1, $t7, .L80134384
  /* 143958 80134378 00000000 */       nop
  /* 14395C 8013437C 03E00008 */        jr $ra
  /* 143960 80134380 00801025 */        or $v0, $a0, $zero

  .L80134384:
  /* 143964 80134384 03E00008 */        jr $ra
  /* 143968 80134388 00000000 */       nop

glabel mnTrainingSyncAndBlinkArrows
  /* 14396C 8013438C 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 143970 80134390 AFBE0048 */        sw $fp, 0x48($sp)
  /* 143974 80134394 AFB70044 */        sw $s7, 0x44($sp)
  /* 143978 80134398 AFB60040 */        sw $s6, 0x40($sp)
  /* 14397C 8013439C AFB5003C */        sw $s5, 0x3c($sp)
  /* 143980 801343A0 AFB40038 */        sw $s4, 0x38($sp)
  /* 143984 801343A4 AFB20030 */        sw $s2, 0x30($sp)
  /* 143988 801343A8 AFB00028 */        sw $s0, 0x28($sp)
  /* 14398C 801343AC F7B60020 */      sdc1 $f22, 0x20($sp)
  /* 143990 801343B0 3C014349 */       lui $at, (0x43490000 >> 16) # 201.0
  /* 143994 801343B4 AFBF004C */        sw $ra, 0x4c($sp)
  /* 143998 801343B8 AFB30034 */        sw $s3, 0x34($sp)
  /* 14399C 801343BC AFB1002C */        sw $s1, 0x2c($sp)
  /* 1439A0 801343C0 F7B40018 */      sdc1 $f20, 0x18($sp)
  /* 1439A4 801343C4 3C168014 */       lui $s6, %hi(D_ovl28_80138C98)
  /* 1439A8 801343C8 3C1E8014 */       lui $fp, %hi(gMNTrainingPanels)
  /* 1439AC 801343CC 4481B000 */      mtc1 $at, $f22 # 201.0 to cop1
  /* 1439B0 801343D0 00808025 */        or $s0, $a0, $zero
  /* 1439B4 801343D4 8C930084 */        lw $s3, 0x84($a0)
  /* 1439B8 801343D8 2412000A */     addiu $s2, $zero, 0xa
  /* 1439BC 801343DC 27DE8558 */     addiu $fp, $fp, %lo(gMNTrainingPanels)
  /* 1439C0 801343E0 26D68C98 */     addiu $s6, $s6, %lo(D_ovl28_80138C98)
  /* 1439C4 801343E4 24140001 */     addiu $s4, $zero, 1
  /* 1439C8 801343E8 24150001 */     addiu $s5, $zero, 1
  /* 1439CC 801343EC 2417FFDF */     addiu $s7, $zero, -0x21
  /* 1439D0 801343F0 2652FFFF */     addiu $s2, $s2, -1
  .L801343F4:
  /* 1439D4 801343F4 16400008 */      bnez $s2, .L80134418
  /* 1439D8 801343F8 00137880 */       sll $t7, $s3, 2
  /* 1439DC 801343FC 8E0E007C */        lw $t6, 0x7c($s0)
  /* 1439E0 80134400 2412000A */     addiu $s2, $zero, 0xa
  /* 1439E4 80134404 568E0004 */      bnel $s4, $t6, .L80134418
  /* 1439E8 80134408 AE14007C */        sw $s4, 0x7c($s0)
  /* 1439EC 8013440C 10000002 */         b .L80134418
  /* 1439F0 80134410 AE00007C */        sw $zero, 0x7c($s0)
  /* 1439F4 80134414 AE14007C */        sw $s4, 0x7c($s0)
  .L80134418:
  /* 1439F8 80134418 01F37823 */      subu $t7, $t7, $s3
  /* 1439FC 8013441C 000F78C0 */       sll $t7, $t7, 3
  /* 143A00 80134420 01F37823 */      subu $t7, $t7, $s3
  /* 143A04 80134424 000F78C0 */       sll $t7, $t7, 3
  /* 143A08 80134428 03CF1021 */      addu $v0, $fp, $t7
  /* 143A0C 8013442C 8C580080 */        lw $t8, 0x80($v0)
  /* 143A10 80134430 00002825 */        or $a1, $zero, $zero
  /* 143A14 80134434 02002025 */        or $a0, $s0, $zero
  /* 143A18 80134438 57000004 */      bnel $t8, $zero, .L8013444C
  /* 143A1C 8013443C 8C510038 */        lw $s1, 0x38($v0)
  /* 143A20 80134440 10000002 */         b .L8013444C
  /* 143A24 80134444 8C51003C */        lw $s1, 0x3c($v0)
  /* 143A28 80134448 8C510038 */        lw $s1, 0x38($v0)
  .L8013444C:
  /* 143A2C 8013444C 16350009 */       bne $s1, $s5, .L80134474
  /* 143A30 80134450 00000000 */       nop
  /* 143A34 80134454 0C04D0D0 */       jal mnTrainingGetArrowSObj
  /* 143A38 80134458 02002025 */        or $a0, $s0, $zero
  /* 143A3C 8013445C 1040001D */      beqz $v0, .L801344D4
  /* 143A40 80134460 00402025 */        or $a0, $v0, $zero
  /* 143A44 80134464 0C0025BB */       jal omEjectSObj
  /* 143A48 80134468 00000000 */       nop
  /* 143A4C 8013446C 1000001A */         b .L801344D8
  /* 143A50 80134470 24010009 */     addiu $at, $zero, 9
  .L80134474:
  /* 143A54 80134474 0C04D0D0 */       jal mnTrainingGetArrowSObj
  /* 143A58 80134478 00002825 */        or $a1, $zero, $zero
  /* 143A5C 8013447C 14400015 */      bnez $v0, .L801344D4
  /* 143A60 80134480 02002025 */        or $a0, $s0, $zero
  /* 143A64 80134484 00134900 */       sll $t1, $s3, 4
  /* 143A68 80134488 01334821 */      addu $t1, $t1, $s3
  /* 143A6C 8013448C 00094880 */       sll $t1, $t1, 2
  /* 143A70 80134490 01334821 */      addu $t1, $t1, $s3
  /* 143A74 80134494 252A0019 */     addiu $t2, $t1, 0x19
  /* 143A78 80134498 448A2000 */      mtc1 $t2, $f4
  /* 143A7C 8013449C 8ED90000 */        lw $t9, ($s6) # D_ovl28_80138C98 + 0
  /* 143A80 801344A0 3C080001 */       lui $t0, %hi(D_NF_0000ECE8)
  /* 143A84 801344A4 2508ECE8 */     addiu $t0, $t0, %lo(D_NF_0000ECE8)
  /* 143A88 801344A8 03282821 */      addu $a1, $t9, $t0
  /* 143A8C 801344AC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143A90 801344B0 46802520 */   cvt.s.w $f20, $f4
  /* 143A94 801344B4 944B0024 */       lhu $t3, 0x24($v0)
  /* 143A98 801344B8 E4540058 */      swc1 $f20, 0x58($v0)
  /* 143A9C 801344BC E456005C */      swc1 $f22, 0x5c($v0)
  /* 143AA0 801344C0 01776824 */       and $t5, $t3, $s7
  /* 143AA4 801344C4 A44D0024 */        sh $t5, 0x24($v0)
  /* 143AA8 801344C8 35AE0001 */       ori $t6, $t5, 1
  /* 143AAC 801344CC A44E0024 */        sh $t6, 0x24($v0)
  /* 143AB0 801344D0 AC400054 */        sw $zero, 0x54($v0)
  .L801344D4:
  /* 143AB4 801344D4 24010009 */     addiu $at, $zero, 9
  .L801344D8:
  /* 143AB8 801344D8 1621000A */       bne $s1, $at, .L80134504
  /* 143ABC 801344DC 02002025 */        or $a0, $s0, $zero
  /* 143AC0 801344E0 02002025 */        or $a0, $s0, $zero
  /* 143AC4 801344E4 0C04D0D0 */       jal mnTrainingGetArrowSObj
  /* 143AC8 801344E8 02A02825 */        or $a1, $s5, $zero
  /* 143ACC 801344EC 1040001D */      beqz $v0, .L80134564
  /* 143AD0 801344F0 00402025 */        or $a0, $v0, $zero
  /* 143AD4 801344F4 0C0025BB */       jal omEjectSObj
  /* 143AD8 801344F8 00000000 */       nop
  /* 143ADC 801344FC 10000019 */         b .L80134564
  /* 143AE0 80134500 00000000 */       nop
  .L80134504:
  /* 143AE4 80134504 0C04D0D0 */       jal mnTrainingGetArrowSObj
  /* 143AE8 80134508 02A02825 */        or $a1, $s5, $zero
  /* 143AEC 8013450C 14400015 */      bnez $v0, .L80134564
  /* 143AF0 80134510 02002025 */        or $a0, $s0, $zero
  /* 143AF4 80134514 0013C900 */       sll $t9, $s3, 4
  /* 143AF8 80134518 0333C821 */      addu $t9, $t9, $s3
  /* 143AFC 8013451C 0019C880 */       sll $t9, $t9, 2
  /* 143B00 80134520 0333C821 */      addu $t9, $t9, $s3
  /* 143B04 80134524 2728004F */     addiu $t0, $t9, 0x4f
  /* 143B08 80134528 44883000 */      mtc1 $t0, $f6
  /* 143B0C 8013452C 8ECF0000 */        lw $t7, ($s6) # D_ovl28_80138C98 + 0
  /* 143B10 80134530 3C180001 */       lui $t8, %hi(D_NF_0000EDC8)
  /* 143B14 80134534 2718EDC8 */     addiu $t8, $t8, %lo(D_NF_0000EDC8)
  /* 143B18 80134538 01F82821 */      addu $a1, $t7, $t8
  /* 143B1C 8013453C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143B20 80134540 46803520 */   cvt.s.w $f20, $f6
  /* 143B24 80134544 94490024 */       lhu $t1, 0x24($v0)
  /* 143B28 80134548 E4540058 */      swc1 $f20, 0x58($v0)
  /* 143B2C 8013454C E456005C */      swc1 $f22, 0x5c($v0)
  /* 143B30 80134550 01375824 */       and $t3, $t1, $s7
  /* 143B34 80134554 A44B0024 */        sh $t3, 0x24($v0)
  /* 143B38 80134558 356C0001 */       ori $t4, $t3, 1
  /* 143B3C 8013455C A44C0024 */        sh $t4, 0x24($v0)
  /* 143B40 80134560 AC550054 */        sw $s5, 0x54($v0)
  .L80134564:
  /* 143B44 80134564 0C002C7A */       jal gsStopCurrentProcess
  /* 143B48 80134568 02A02025 */        or $a0, $s5, $zero
  /* 143B4C 8013456C 1000FFA1 */         b .L801343F4
  /* 143B50 80134570 2652FFFF */     addiu $s2, $s2, -1
  /* 143B54 80134574 00000000 */       nop
  /* 143B58 80134578 00000000 */       nop
  /* 143B5C 8013457C 00000000 */       nop
# Maybe start of new file
  /* 143B60 80134580 8FBF004C */        lw $ra, 0x4c($sp)
  /* 143B64 80134584 D7B40018 */      ldc1 $f20, 0x18($sp)
  /* 143B68 80134588 D7B60020 */      ldc1 $f22, 0x20($sp)
  /* 143B6C 8013458C 8FB00028 */        lw $s0, 0x28($sp)
  /* 143B70 80134590 8FB1002C */        lw $s1, 0x2c($sp)
  /* 143B74 80134594 8FB20030 */        lw $s2, 0x30($sp)
  /* 143B78 80134598 8FB30034 */        lw $s3, 0x34($sp)
  /* 143B7C 8013459C 8FB40038 */        lw $s4, 0x38($sp)
  /* 143B80 801345A0 8FB5003C */        lw $s5, 0x3c($sp)
  /* 143B84 801345A4 8FB60040 */        lw $s6, 0x40($sp)
  /* 143B88 801345A8 8FB70044 */        lw $s7, 0x44($sp)
  /* 143B8C 801345AC 8FBE0048 */        lw $fp, 0x48($sp)
  /* 143B90 801345B0 03E00008 */        jr $ra
  /* 143B94 801345B4 27BD0050 */     addiu $sp, $sp, 0x50

glabel mnTrainingSyncHandicapCPULevelDisplay
  /* 143B98 801345B8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 143B9C 801345BC AFBF0014 */        sw $ra, 0x14($sp)
  /* 143BA0 801345C0 8C850084 */        lw $a1, 0x84($a0)
  /* 143BA4 801345C4 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 143BA8 801345C8 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 143BAC 801345CC 00057080 */       sll $t6, $a1, 2
  /* 143BB0 801345D0 01C57023 */      subu $t6, $t6, $a1
  /* 143BB4 801345D4 000E70C0 */       sll $t6, $t6, 3
  /* 143BB8 801345D8 01C57023 */      subu $t6, $t6, $a1
  /* 143BBC 801345DC 000E70C0 */       sll $t6, $t6, 3
  /* 143BC0 801345E0 01CF1021 */      addu $v0, $t6, $t7
  /* 143BC4 801345E4 8C580084 */        lw $t8, 0x84($v0)
  /* 143BC8 801345E8 57000006 */      bnel $t8, $zero, .L80134604
  /* 143BCC 801345EC 8C990074 */        lw $t9, 0x74($a0)
  /* 143BD0 801345F0 0C04D0AE */       jal mnTrainingRemoveHandicapCPULevel
  /* 143BD4 801345F4 00A02025 */        or $a0, $a1, $zero
  /* 143BD8 801345F8 10000009 */         b .L80134620
  /* 143BDC 801345FC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143BE0 80134600 8C990074 */        lw $t9, 0x74($a0)
  .L80134604:
  /* 143BE4 80134604 8C490080 */        lw $t1, 0x80($v0)
  /* 143BE8 80134608 8F280054 */        lw $t0, 0x54($t9)
  /* 143BEC 8013460C 51090004 */      beql $t0, $t1, .L80134620
  /* 143BF0 80134610 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143BF4 80134614 0C04D18B */       jal mnTrainingDrawHandicapCPULevel
  /* 143BF8 80134618 00A02025 */        or $a0, $a1, $zero
  /* 143BFC 8013461C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80134620:
  /* 143C00 80134620 27BD0018 */     addiu $sp, $sp, 0x18
  /* 143C04 80134624 03E00008 */        jr $ra
  /* 143C08 80134628 00000000 */       nop

glabel mnTrainingDrawHandicapCPULevel
  /* 143C0C 8013462C 00047880 */       sll $t7, $a0, 2
  /* 143C10 80134630 01E47823 */      subu $t7, $t7, $a0
  /* 143C14 80134634 000F78C0 */       sll $t7, $t7, 3
  /* 143C18 80134638 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 143C1C 8013463C 01E47823 */      subu $t7, $t7, $a0
  /* 143C20 80134640 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 143C24 80134644 AFB10020 */        sw $s1, 0x20($sp)
  /* 143C28 80134648 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 143C2C 8013464C 000F78C0 */       sll $t7, $t7, 3
  /* 143C30 80134650 01F88821 */      addu $s1, $t7, $t8
  /* 143C34 80134654 8E250020 */        lw $a1, 0x20($s1)
  /* 143C38 80134658 AFBF0024 */        sw $ra, 0x24($sp)
  /* 143C3C 8013465C AFB0001C */        sw $s0, 0x1c($sp)
  /* 143C40 80134660 10A00004 */      beqz $a1, .L80134674
  /* 143C44 80134664 AFA40038 */        sw $a0, 0x38($sp)
  /* 143C48 80134668 0C0026A1 */       jal omEjectGObj
  /* 143C4C 8013466C 00A02025 */        or $a0, $a1, $zero
  /* 143C50 80134670 AE200020 */        sw $zero, 0x20($s1)
  .L80134674:
  /* 143C54 80134674 00002025 */        or $a0, $zero, $zero
  /* 143C58 80134678 00002825 */        or $a1, $zero, $zero
  /* 143C5C 8013467C 2406001C */     addiu $a2, $zero, 0x1c
  /* 143C60 80134680 0C00265A */       jal omMakeGObjSPAfter
  /* 143C64 80134684 3C078000 */       lui $a3, 0x8000
  /* 143C68 80134688 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 143C6C 8013468C 2419FFFF */     addiu $t9, $zero, -1
  /* 143C70 80134690 00408025 */        or $s0, $v0, $zero
  /* 143C74 80134694 AE220020 */        sw $v0, 0x20($s1)
  /* 143C78 80134698 AFB90010 */        sw $t9, 0x10($sp)
  /* 143C7C 8013469C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 143C80 801346A0 00402025 */        or $a0, $v0, $zero
  /* 143C84 801346A4 24060023 */     addiu $a2, $zero, 0x23
  /* 143C88 801346A8 0C00277D */       jal omAddGObjRenderProc
  /* 143C8C 801346AC 3C078000 */       lui $a3, 0x8000
  /* 143C90 801346B0 8FA80038 */        lw $t0, 0x38($sp)
  /* 143C94 801346B4 3C058013 */       lui $a1, %hi(mnTrainingSyncHandicapCPULevelDisplay)
  /* 143C98 801346B8 24A545B8 */     addiu $a1, $a1, %lo(mnTrainingSyncHandicapCPULevelDisplay)
  /* 143C9C 801346BC 02002025 */        or $a0, $s0, $zero
  /* 143CA0 801346C0 24060001 */     addiu $a2, $zero, 1
  /* 143CA4 801346C4 24070001 */     addiu $a3, $zero, 1
  /* 143CA8 801346C8 0C002062 */       jal omAddGObjCommonProc
  /* 143CAC 801346CC AE080084 */        sw $t0, 0x84($s0)
  /* 143CB0 801346D0 8E290080 */        lw $t1, 0x80($s1)
  /* 143CB4 801346D4 3C118014 */       lui $s1, %hi(D_ovl28_80138C98)
  /* 143CB8 801346D8 26318C98 */     addiu $s1, $s1, %lo(D_ovl28_80138C98)
  /* 143CBC 801346DC 15200017 */      bnez $t1, .L8013473C
  /* 143CC0 801346E0 02002025 */        or $a0, $s0, $zero
  /* 143CC4 801346E4 3C118014 */       lui $s1, %hi(D_ovl28_80138C98)
  /* 143CC8 801346E8 26318C98 */     addiu $s1, $s1, %lo(D_ovl28_80138C98)
  /* 143CCC 801346EC 8E2A0000 */        lw $t2, ($s1) # D_ovl28_80138C98 + 0
  /* 143CD0 801346F0 3C0B0000 */       lui $t3, %hi(D_NF_00001108)
  /* 143CD4 801346F4 256B1108 */     addiu $t3, $t3, %lo(D_NF_00001108)
  /* 143CD8 801346F8 02002025 */        or $a0, $s0, $zero
  /* 143CDC 801346FC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143CE0 80134700 014B2821 */      addu $a1, $t2, $t3
  /* 143CE4 80134704 8FA60038 */        lw $a2, 0x38($sp)
  /* 143CE8 80134708 00401825 */        or $v1, $v0, $zero
  /* 143CEC 8013470C AC400054 */        sw $zero, 0x54($v0)
  /* 143CF0 80134710 00C00821 */      addu $at, $a2, $zero
  /* 143CF4 80134714 00063100 */       sll $a2, $a2, 4
  /* 143CF8 80134718 00C13021 */      addu $a2, $a2, $at
  /* 143CFC 8013471C 00063080 */       sll $a2, $a2, 2
  /* 143D00 80134720 00C13021 */      addu $a2, $a2, $at
  /* 143D04 80134724 24CC0023 */     addiu $t4, $a2, 0x23
  /* 143D08 80134728 448C2000 */      mtc1 $t4, $f4
  /* 143D0C 8013472C 00000000 */       nop
  /* 143D10 80134730 468021A0 */   cvt.s.w $f6, $f4
  /* 143D14 80134734 10000013 */         b .L80134784
  /* 143D18 80134738 E4460058 */      swc1 $f6, 0x58($v0)
  .L8013473C:
  /* 143D1C 8013473C 8E2D0000 */        lw $t5, ($s1) # D_ovl28_80138C98 + 0
  /* 143D20 80134740 3C0E0000 */       lui $t6, %hi(D_NF_00001218)
  /* 143D24 80134744 25CE1218 */     addiu $t6, $t6, %lo(D_NF_00001218)
  /* 143D28 80134748 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143D2C 8013474C 01AE2821 */      addu $a1, $t5, $t6
  /* 143D30 80134750 8FA60038 */        lw $a2, 0x38($sp)
  /* 143D34 80134754 24180001 */     addiu $t8, $zero, 1
  /* 143D38 80134758 00401825 */        or $v1, $v0, $zero
  /* 143D3C 8013475C 00C00821 */      addu $at, $a2, $zero
  /* 143D40 80134760 00063100 */       sll $a2, $a2, 4
  /* 143D44 80134764 00C13021 */      addu $a2, $a2, $at
  /* 143D48 80134768 00063080 */       sll $a2, $a2, 2
  /* 143D4C 8013476C 00C13021 */      addu $a2, $a2, $at
  /* 143D50 80134770 24CF0022 */     addiu $t7, $a2, 0x22
  /* 143D54 80134774 448F4000 */      mtc1 $t7, $f8
  /* 143D58 80134778 AC580054 */        sw $t8, 0x54($v0)
  /* 143D5C 8013477C 468042A0 */   cvt.s.w $f10, $f8
  /* 143D60 80134780 E44A0058 */      swc1 $f10, 0x58($v0)
  .L80134784:
  /* 143D64 80134784 946A0024 */       lhu $t2, 0x24($v1)
  /* 143D68 80134788 3C014349 */       lui $at, (0x43490000 >> 16) # 201.0
  /* 143D6C 8013478C 44818000 */      mtc1 $at, $f16 # 201.0 to cop1
  /* 143D70 80134790 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 143D74 80134794 241900C2 */     addiu $t9, $zero, 0xc2
  /* 143D78 80134798 240800BD */     addiu $t0, $zero, 0xbd
  /* 143D7C 8013479C 240900AD */     addiu $t1, $zero, 0xad
  /* 143D80 801347A0 A46C0024 */        sh $t4, 0x24($v1)
  /* 143D84 801347A4 358D0001 */       ori $t5, $t4, 1
  /* 143D88 801347A8 A0790028 */        sb $t9, 0x28($v1)
  /* 143D8C 801347AC A0680029 */        sb $t0, 0x29($v1)
  /* 143D90 801347B0 A069002A */        sb $t1, 0x2a($v1)
  /* 143D94 801347B4 A46D0024 */        sh $t5, 0x24($v1)
  /* 143D98 801347B8 E470005C */      swc1 $f16, 0x5c($v1)
  /* 143D9C 801347BC 8E2E0008 */        lw $t6, 8($s1) # D_ovl28_80138C98 + 8
  /* 143DA0 801347C0 3C0F0001 */       lui $t7, %hi(D_NF_0000DCF0)
  /* 143DA4 801347C4 25EFDCF0 */     addiu $t7, $t7, %lo(D_NF_0000DCF0)
  /* 143DA8 801347C8 AFA6002C */        sw $a2, 0x2c($sp)
  /* 143DAC 801347CC 02002025 */        or $a0, $s0, $zero
  /* 143DB0 801347D0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 143DB4 801347D4 01CF2821 */      addu $a1, $t6, $t7
  /* 143DB8 801347D8 8FA6002C */        lw $a2, 0x2c($sp)
  /* 143DBC 801347DC 94590024 */       lhu $t9, 0x24($v0)
  /* 143DC0 801347E0 3C01434A */       lui $at, (0x434A0000 >> 16) # 202.0
  /* 143DC4 801347E4 24D8003D */     addiu $t8, $a2, 0x3d
  /* 143DC8 801347E8 44989000 */      mtc1 $t8, $f18
  /* 143DCC 801347EC 44813000 */      mtc1 $at, $f6 # 202.0 to cop1
  /* 143DD0 801347F0 240300FF */     addiu $v1, $zero, 0xff
  /* 143DD4 801347F4 46809120 */   cvt.s.w $f4, $f18
  /* 143DD8 801347F8 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 143DDC 801347FC A4490024 */        sh $t1, 0x24($v0)
  /* 143DE0 80134800 352A0001 */       ori $t2, $t1, 1
  /* 143DE4 80134804 A0430028 */        sb $v1, 0x28($v0)
  /* 143DE8 80134808 A0430029 */        sb $v1, 0x29($v0)
  /* 143DEC 8013480C E4440058 */      swc1 $f4, 0x58($v0)
  /* 143DF0 80134810 A043002A */        sb $v1, 0x2a($v0)
  /* 143DF4 80134814 A44A0024 */        sh $t2, 0x24($v0)
  /* 143DF8 80134818 E446005C */      swc1 $f6, 0x5c($v0)
  /* 143DFC 8013481C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 143E00 80134820 8FB10020 */        lw $s1, 0x20($sp)
  /* 143E04 80134824 8FB0001C */        lw $s0, 0x1c($sp)
  /* 143E08 80134828 03E00008 */        jr $ra
  /* 143E0C 8013482C 27BD0038 */     addiu $sp, $sp, 0x38

  /* 143E10 80134830 03E00008 */        jr $ra
  /* 143E14 80134834 00000000 */       nop

  /* 143E18 80134838 03E00008 */        jr $ra
  /* 143E1C 8013483C 00000000 */       nop

  /* 143E20 80134840 03E00008 */        jr $ra
  /* 143E24 80134844 00000000 */       nop

glabel mnTrainingSelectChar
  /* 143E28 80134848 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 143E2C 8013484C AFA60028 */        sw $a2, 0x28($sp)
  /* 143E30 80134850 240600B8 */     addiu $a2, $zero, 0xb8
  /* 143E34 80134854 00A60019 */     multu $a1, $a2
  /* 143E38 80134858 3C028014 */       lui $v0, %hi(gMNTrainingPanels)
  /* 143E3C 8013485C 24428558 */     addiu $v0, $v0, %lo(gMNTrainingPanels)
  /* 143E40 80134860 AFA40020 */        sw $a0, 0x20($sp)
  /* 143E44 80134864 24010001 */     addiu $at, $zero, 1
  /* 143E48 80134868 00A02025 */        or $a0, $a1, $zero
  /* 143E4C 8013486C AFBF0014 */        sw $ra, 0x14($sp)
  /* 143E50 80134870 00007012 */      mflo $t6
  /* 143E54 80134874 004E1821 */      addu $v1, $v0, $t6
  /* 143E58 80134878 8C6F0050 */        lw $t7, 0x50($v1)
  /* 143E5C 8013487C 51E10004 */      beql $t7, $at, .L80134890
  /* 143E60 80134880 8C78007C */        lw $t8, 0x7c($v1)
  /* 143E64 80134884 10000016 */         b .L801348E0
  /* 143E68 80134888 00001025 */        or $v0, $zero, $zero
  /* 143E6C 8013488C 8C78007C */        lw $t8, 0x7c($v1)
  .L80134890:
  /* 143E70 80134890 2401001C */     addiu $at, $zero, 0x1c
  /* 143E74 80134894 00E02825 */        or $a1, $a3, $zero
  /* 143E78 80134898 03060019 */     multu $t8, $a2
  /* 143E7C 8013489C 0000C812 */      mflo $t9
  /* 143E80 801348A0 00594021 */      addu $t0, $v0, $t9
  /* 143E84 801348A4 8D090048 */        lw $t1, 0x48($t0)
  /* 143E88 801348A8 1121000A */       beq $t1, $at, .L801348D4
  /* 143E8C 801348AC 00000000 */       nop
  /* 143E90 801348B0 0C04C6D6 */       jal mnTrainingSelectCharWithToken
  /* 143E94 801348B4 AFA30018 */        sw $v1, 0x18($sp)
  /* 143E98 801348B8 3C0A8014 */       lui $t2, %hi(gMNTrainingFramesElapsed)
  /* 143E9C 801348BC 8D4A888C */        lw $t2, %lo(gMNTrainingFramesElapsed)($t2)
  /* 143EA0 801348C0 8FA30018 */        lw $v1, 0x18($sp)
  /* 143EA4 801348C4 24020001 */     addiu $v0, $zero, 1
  /* 143EA8 801348C8 254B001E */     addiu $t3, $t2, 0x1e
  /* 143EAC 801348CC 10000004 */         b .L801348E0
  /* 143EB0 801348D0 AC6B005C */        sw $t3, 0x5c($v1)
  .L801348D4:
  /* 143EB4 801348D4 0C009A70 */       jal func_800269C0
  /* 143EB8 801348D8 240400A5 */     addiu $a0, $zero, 0xa5
  /* 143EBC 801348DC 00001025 */        or $v0, $zero, $zero
  .L801348E0:
  /* 143EC0 801348E0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 143EC4 801348E4 27BD0020 */     addiu $sp, $sp, 0x20
  /* 143EC8 801348E8 03E00008 */        jr $ra
  /* 143ECC 801348EC 00000000 */       nop

glabel mnTrainingReorderCursorsOnPickup
  /* 143ED0 801348F0 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 143ED4 801348F4 3C0E8014 */       lui $t6, %hi(dMNTrainingTokenPickupDisplayOrders)
  /* 143ED8 801348F8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 143EDC 801348FC AFBE0038 */        sw $fp, 0x38($sp)
  /* 143EE0 80134900 AFB70034 */        sw $s7, 0x34($sp)
  /* 143EE4 80134904 AFB60030 */        sw $s6, 0x30($sp)
  /* 143EE8 80134908 AFB5002C */        sw $s5, 0x2c($sp)
  /* 143EEC 8013490C AFB40028 */        sw $s4, 0x28($sp)
  /* 143EF0 80134910 AFB30024 */        sw $s3, 0x24($sp)
  /* 143EF4 80134914 AFB20020 */        sw $s2, 0x20($sp)
  /* 143EF8 80134918 AFB1001C */        sw $s1, 0x1c($sp)
  /* 143EFC 8013491C AFB00018 */        sw $s0, 0x18($sp)
  /* 143F00 80134920 25CE8350 */     addiu $t6, $t6, %lo(dMNTrainingTokenPickupDisplayOrders)
  /* 143F04 80134924 8DD80000 */        lw $t8, ($t6) # dMNTrainingTokenPickupDisplayOrders + 0
  /* 143F08 80134928 27B50050 */     addiu $s5, $sp, 0x50
  /* 143F0C 8013492C 241400B8 */     addiu $s4, $zero, 0xb8
  /* 143F10 80134930 AEB80000 */        sw $t8, ($s5)
  /* 143F14 80134934 00940019 */     multu $a0, $s4
  /* 143F18 80134938 8DCF0004 */        lw $t7, 4($t6) # dMNTrainingTokenPickupDisplayOrders + 4
  /* 143F1C 8013493C 3C138014 */       lui $s3, %hi(gMNTrainingPanels)
  /* 143F20 80134940 26738558 */     addiu $s3, $s3, %lo(gMNTrainingPanels)
  /* 143F24 80134944 AEAF0004 */        sw $t7, 4($s5)
  /* 143F28 80134948 8DD80008 */        lw $t8, 8($t6) # dMNTrainingTokenPickupDisplayOrders + 8
  /* 143F2C 8013494C 00A08025 */        or $s0, $a1, $zero
  /* 143F30 80134950 0080F025 */        or $fp, $a0, $zero
  /* 143F34 80134954 AEB80008 */        sw $t8, 8($s5)
  /* 143F38 80134958 8DCF000C */        lw $t7, 0xc($t6) # dMNTrainingTokenPickupDisplayOrders + 12
  /* 143F3C 8013495C 0000C812 */      mflo $t9
  /* 143F40 80134960 02794021 */      addu $t0, $s3, $t9
  /* 143F44 80134964 AEAF000C */        sw $t7, 0xc($s5)
  /* 143F48 80134968 8FA6005C */        lw $a2, 0x5c($sp)
  /* 143F4C 8013496C 8D040000 */        lw $a0, ($t0)
  /* 143F50 80134970 0C002834 */       jal omMoveGObjDL
  /* 143F54 80134974 24050020 */     addiu $a1, $zero, 0x20
  /* 143F58 80134978 02140019 */     multu $s0, $s4
  /* 143F5C 8013497C 8FA6005C */        lw $a2, 0x5c($sp)
  /* 143F60 80134980 24050020 */     addiu $a1, $zero, 0x20
  /* 143F64 80134984 24C60001 */     addiu $a2, $a2, 1
  /* 143F68 80134988 00004812 */      mflo $t1
  /* 143F6C 8013498C 02695021 */      addu $t2, $s3, $t1
  /* 143F70 80134990 0C002834 */       jal omMoveGObjDL
  /* 143F74 80134994 8D440004 */        lw $a0, 4($t2)
  /* 143F78 80134998 00008025 */        or $s0, $zero, $zero
  /* 143F7C 8013499C 24120003 */     addiu $s2, $zero, 3
  /* 143F80 801349A0 24170004 */     addiu $s7, $zero, 4
  /* 143F84 801349A4 2416FFFF */     addiu $s6, $zero, -1
  .L801349A8:
  /* 143F88 801349A8 521E001A */      beql $s0, $fp, .L80134A14
  /* 143F8C 801349AC 26100001 */     addiu $s0, $s0, 1
  /* 143F90 801349B0 02140019 */     multu $s0, $s4
  /* 143F94 801349B4 00126080 */       sll $t4, $s2, 2
  /* 143F98 801349B8 02AC6821 */      addu $t5, $s5, $t4
  /* 143F9C 801349BC 24050020 */     addiu $a1, $zero, 0x20
  /* 143FA0 801349C0 00005812 */      mflo $t3
  /* 143FA4 801349C4 026B8821 */      addu $s1, $s3, $t3
  /* 143FA8 801349C8 8E240000 */        lw $a0, ($s1)
  /* 143FAC 801349CC 50800004 */      beql $a0, $zero, .L801349E0
  /* 143FB0 801349D0 8E22007C */        lw $v0, 0x7c($s1)
  /* 143FB4 801349D4 0C002834 */       jal omMoveGObjDL
  /* 143FB8 801349D8 8DA60000 */        lw $a2, ($t5)
  /* 143FBC 801349DC 8E22007C */        lw $v0, 0x7c($s1)
  .L801349E0:
  /* 143FC0 801349E0 52C2000C */      beql $s6, $v0, .L80134A14
  /* 143FC4 801349E4 26100001 */     addiu $s0, $s0, 1
  /* 143FC8 801349E8 00540019 */     multu $v0, $s4
  /* 143FCC 801349EC 0012C080 */       sll $t8, $s2, 2
  /* 143FD0 801349F0 02B8C821 */      addu $t9, $s5, $t8
  /* 143FD4 801349F4 8F260000 */        lw $a2, ($t9)
  /* 143FD8 801349F8 24050020 */     addiu $a1, $zero, 0x20
  /* 143FDC 801349FC 24C60001 */     addiu $a2, $a2, 1
  /* 143FE0 80134A00 00007012 */      mflo $t6
  /* 143FE4 80134A04 026E7821 */      addu $t7, $s3, $t6
  /* 143FE8 80134A08 0C002834 */       jal omMoveGObjDL
  /* 143FEC 80134A0C 8DE40004 */        lw $a0, 4($t7)
  /* 143FF0 80134A10 26100001 */     addiu $s0, $s0, 1
  .L80134A14:
  /* 143FF4 80134A14 1617FFE4 */       bne $s0, $s7, .L801349A8
  /* 143FF8 80134A18 2652FFFF */     addiu $s2, $s2, -1
  /* 143FFC 80134A1C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 144000 80134A20 8FB00018 */        lw $s0, 0x18($sp)
  /* 144004 80134A24 8FB1001C */        lw $s1, 0x1c($sp)
  /* 144008 80134A28 8FB20020 */        lw $s2, 0x20($sp)
  /* 14400C 80134A2C 8FB30024 */        lw $s3, 0x24($sp)
  /* 144010 80134A30 8FB40028 */        lw $s4, 0x28($sp)
  /* 144014 80134A34 8FB5002C */        lw $s5, 0x2c($sp)
  /* 144018 80134A38 8FB60030 */        lw $s6, 0x30($sp)
  /* 14401C 80134A3C 8FB70034 */        lw $s7, 0x34($sp)
  /* 144020 80134A40 8FBE0038 */        lw $fp, 0x38($sp)
  /* 144024 80134A44 03E00008 */        jr $ra
  /* 144028 80134A48 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnTrainingReorderCursorsOnPlacement
  /* 14402C 80134A4C 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 144030 80134A50 3C0F8014 */       lui $t7, %hi(dMNTrainingTokenPlaceHeldDisplayOrders)
  /* 144034 80134A54 AFBF0034 */        sw $ra, 0x34($sp)
  /* 144038 80134A58 AFB60030 */        sw $s6, 0x30($sp)
  /* 14403C 80134A5C AFB5002C */        sw $s5, 0x2c($sp)
  /* 144040 80134A60 AFB40028 */        sw $s4, 0x28($sp)
  /* 144044 80134A64 AFB30024 */        sw $s3, 0x24($sp)
  /* 144048 80134A68 AFB20020 */        sw $s2, 0x20($sp)
  /* 14404C 80134A6C AFB1001C */        sw $s1, 0x1c($sp)
  /* 144050 80134A70 AFB00018 */        sw $s0, 0x18($sp)
  /* 144054 80134A74 AFA50084 */        sw $a1, 0x84($sp)
  /* 144058 80134A78 25EF8360 */     addiu $t7, $t7, %lo(dMNTrainingTokenPlaceHeldDisplayOrders)
  /* 14405C 80134A7C 8DF90000 */        lw $t9, ($t7) # dMNTrainingTokenPlaceHeldDisplayOrders + 0
  /* 144060 80134A80 8DF80004 */        lw $t8, 4($t7) # dMNTrainingTokenPlaceHeldDisplayOrders + 4
  /* 144064 80134A84 27AE0070 */     addiu $t6, $sp, 0x70
  /* 144068 80134A88 ADD90000 */        sw $t9, ($t6)
  /* 14406C 80134A8C ADD80004 */        sw $t8, 4($t6)
  /* 144070 80134A90 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingTokenPlaceHeldDisplayOrders + 12
  /* 144074 80134A94 8DF90008 */        lw $t9, 8($t7) # dMNTrainingTokenPlaceHeldDisplayOrders + 8
  /* 144078 80134A98 3C098014 */       lui $t1, %hi(dMNTrainingTokenPlaceUnheldDisplayOrders)
  /* 14407C 80134A9C 25298370 */     addiu $t1, $t1, %lo(dMNTrainingTokenPlaceUnheldDisplayOrders)
  /* 144080 80134AA0 ADD8000C */        sw $t8, 0xc($t6)
  /* 144084 80134AA4 ADD90008 */        sw $t9, 8($t6)
  /* 144088 80134AA8 8D2A0004 */        lw $t2, 4($t1) # dMNTrainingTokenPlaceUnheldDisplayOrders + 4
  /* 14408C 80134AAC 8D2B0000 */        lw $t3, ($t1) # dMNTrainingTokenPlaceUnheldDisplayOrders + 0
  /* 144090 80134AB0 27A80060 */     addiu $t0, $sp, 0x60
  /* 144094 80134AB4 AD0A0004 */        sw $t2, 4($t0)
  /* 144098 80134AB8 AD0B0000 */        sw $t3, ($t0)
  /* 14409C 80134ABC 8D2B0008 */        lw $t3, 8($t1) # dMNTrainingTokenPlaceUnheldDisplayOrders + 8
  /* 1440A0 80134AC0 8D2A000C */        lw $t2, 0xc($t1) # dMNTrainingTokenPlaceUnheldDisplayOrders + 12
  /* 1440A4 80134AC4 0080B025 */        or $s6, $a0, $zero
  /* 1440A8 80134AC8 3C118014 */       lui $s1, %hi(gMNTrainingPanels)
  /* 1440AC 80134ACC 26318558 */     addiu $s1, $s1, %lo(gMNTrainingPanels)
  /* 1440B0 80134AD0 27A40058 */     addiu $a0, $sp, 0x58
  /* 1440B4 80134AD4 24050001 */     addiu $a1, $zero, 1
  /* 1440B8 80134AD8 27A20048 */     addiu $v0, $sp, 0x48
  /* 1440BC 80134ADC 2403FFFF */     addiu $v1, $zero, -1
  /* 1440C0 80134AE0 AD0B0008 */        sw $t3, 8($t0)
  /* 1440C4 80134AE4 AD0A000C */        sw $t2, 0xc($t0)
  .L80134AE8:
  /* 1440C8 80134AE8 8E2C007C */        lw $t4, 0x7c($s1) # gMNTrainingPanels + 124
  /* 1440CC 80134AEC 546C0004 */      bnel $v1, $t4, .L80134B00
  /* 1440D0 80134AF0 AC450000 */        sw $a1, ($v0)
  /* 1440D4 80134AF4 10000002 */         b .L80134B00
  /* 1440D8 80134AF8 AC400000 */        sw $zero, ($v0)
  /* 1440DC 80134AFC AC450000 */        sw $a1, ($v0)
  .L80134B00:
  /* 1440E0 80134B00 24420004 */     addiu $v0, $v0, 4
  /* 1440E4 80134B04 0044082B */      sltu $at, $v0, $a0
  /* 1440E8 80134B08 1420FFF7 */      bnez $at, .L80134AE8
  /* 1440EC 80134B0C 263100B8 */     addiu $s1, $s1, 0xb8
  /* 1440F0 80134B10 3C138014 */       lui $s3, %hi(gMNTrainingPanels)
  /* 1440F4 80134B14 26738558 */     addiu $s3, $s3, %lo(gMNTrainingPanels)
  /* 1440F8 80134B18 00008025 */        or $s0, $zero, $zero
  /* 1440FC 80134B1C 27B2006C */     addiu $s2, $sp, 0x6c
  /* 144100 80134B20 27B50048 */     addiu $s5, $sp, 0x48
  /* 144104 80134B24 241400B8 */     addiu $s4, $zero, 0xb8
  .L80134B28:
  /* 144108 80134B28 12160018 */       beq $s0, $s6, .L80134B8C
  /* 14410C 80134B2C 00106880 */       sll $t5, $s0, 2
  /* 144110 80134B30 02AD7021 */      addu $t6, $s5, $t5
  /* 144114 80134B34 8DCF0000 */        lw $t7, ($t6)
  /* 144118 80134B38 51E00015 */      beql $t7, $zero, .L80134B90
  /* 14411C 80134B3C 26100001 */     addiu $s0, $s0, 1
  /* 144120 80134B40 02140019 */     multu $s0, $s4
  /* 144124 80134B44 24050020 */     addiu $a1, $zero, 0x20
  /* 144128 80134B48 0000C012 */      mflo $t8
  /* 14412C 80134B4C 02788821 */      addu $s1, $s3, $t8
  /* 144130 80134B50 8E240000 */        lw $a0, ($s1) # gMNTrainingPanels + 0
  /* 144134 80134B54 50800004 */      beql $a0, $zero, .L80134B68
  /* 144138 80134B58 8E39007C */        lw $t9, 0x7c($s1) # gMNTrainingPanels + 124
  /* 14413C 80134B5C 0C002834 */       jal omMoveGObjDL
  /* 144140 80134B60 8E460000 */        lw $a2, ($s2)
  /* 144144 80134B64 8E39007C */        lw $t9, 0x7c($s1) # gMNTrainingPanels + 124
  .L80134B68:
  /* 144148 80134B68 8E460000 */        lw $a2, ($s2)
  /* 14414C 80134B6C 24050020 */     addiu $a1, $zero, 0x20
  /* 144150 80134B70 03340019 */     multu $t9, $s4
  /* 144154 80134B74 24C60001 */     addiu $a2, $a2, 1
  /* 144158 80134B78 00004012 */      mflo $t0
  /* 14415C 80134B7C 02684821 */      addu $t1, $s3, $t0
  /* 144160 80134B80 0C002834 */       jal omMoveGObjDL
  /* 144164 80134B84 8D240004 */        lw $a0, 4($t1)
  /* 144168 80134B88 2652FFFC */     addiu $s2, $s2, -4
  .L80134B8C:
  /* 14416C 80134B8C 26100001 */     addiu $s0, $s0, 1
  .L80134B90:
  /* 144170 80134B90 2A010004 */      slti $at, $s0, 4
  /* 144174 80134B94 1420FFE4 */      bnez $at, .L80134B28
  /* 144178 80134B98 00000000 */       nop
  /* 14417C 80134B9C 24110004 */     addiu $s1, $zero, 4
  /* 144180 80134BA0 52D10009 */      beql $s6, $s1, .L80134BC8
  /* 144184 80134BA4 8FAC0084 */        lw $t4, 0x84($sp)
  /* 144188 80134BA8 02D40019 */     multu $s6, $s4
  /* 14418C 80134BAC 24050020 */     addiu $a1, $zero, 0x20
  /* 144190 80134BB0 8E460000 */        lw $a2, ($s2)
  /* 144194 80134BB4 00005012 */      mflo $t2
  /* 144198 80134BB8 026A5821 */      addu $t3, $s3, $t2
  /* 14419C 80134BBC 0C002834 */       jal omMoveGObjDL
  /* 1441A0 80134BC0 8D640000 */        lw $a0, ($t3)
  /* 1441A4 80134BC4 8FAC0084 */        lw $t4, 0x84($sp)
  .L80134BC8:
  /* 1441A8 80134BC8 8E460000 */        lw $a2, ($s2)
  /* 1441AC 80134BCC 24050021 */     addiu $a1, $zero, 0x21
  /* 1441B0 80134BD0 01940019 */     multu $t4, $s4
  /* 1441B4 80134BD4 24C60001 */     addiu $a2, $a2, 1
  /* 1441B8 80134BD8 00006812 */      mflo $t5
  /* 1441BC 80134BDC 026D7021 */      addu $t6, $s3, $t5
  /* 1441C0 80134BE0 0C002834 */       jal omMoveGObjDL
  /* 1441C4 80134BE4 8DC40004 */        lw $a0, 4($t6)
  /* 1441C8 80134BE8 2652FFFC */     addiu $s2, $s2, -4
  /* 1441CC 80134BEC 00008025 */        or $s0, $zero, $zero
  .L80134BF0:
  /* 1441D0 80134BF0 1216000F */       beq $s0, $s6, .L80134C30
  /* 1441D4 80134BF4 00107880 */       sll $t7, $s0, 2
  /* 1441D8 80134BF8 02AFC021 */      addu $t8, $s5, $t7
  /* 1441DC 80134BFC 8F190000 */        lw $t9, ($t8)
  /* 1441E0 80134C00 5720000C */      bnel $t9, $zero, .L80134C34
  /* 1441E4 80134C04 26100001 */     addiu $s0, $s0, 1
  /* 1441E8 80134C08 02140019 */     multu $s0, $s4
  /* 1441EC 80134C0C 24050020 */     addiu $a1, $zero, 0x20
  /* 1441F0 80134C10 00004012 */      mflo $t0
  /* 1441F4 80134C14 02684821 */      addu $t1, $s3, $t0
  /* 1441F8 80134C18 8D240000 */        lw $a0, ($t1)
  /* 1441FC 80134C1C 50800004 */      beql $a0, $zero, .L80134C30
  /* 144200 80134C20 2652FFFC */     addiu $s2, $s2, -4
  /* 144204 80134C24 0C002834 */       jal omMoveGObjDL
  /* 144208 80134C28 8E460000 */        lw $a2, ($s2)
  /* 14420C 80134C2C 2652FFFC */     addiu $s2, $s2, -4
  .L80134C30:
  /* 144210 80134C30 26100001 */     addiu $s0, $s0, 1
  .L80134C34:
  /* 144214 80134C34 1611FFEE */       bne $s0, $s1, .L80134BF0
  /* 144218 80134C38 00000000 */       nop
  /* 14421C 80134C3C 8FBF0034 */        lw $ra, 0x34($sp)
  /* 144220 80134C40 8FB00018 */        lw $s0, 0x18($sp)
  /* 144224 80134C44 8FB1001C */        lw $s1, 0x1c($sp)
  /* 144228 80134C48 8FB20020 */        lw $s2, 0x20($sp)
  /* 14422C 80134C4C 8FB30024 */        lw $s3, 0x24($sp)
  /* 144230 80134C50 8FB40028 */        lw $s4, 0x28($sp)
  /* 144234 80134C54 8FB5002C */        lw $s5, 0x2c($sp)
  /* 144238 80134C58 8FB60030 */        lw $s6, 0x30($sp)
  /* 14423C 80134C5C 03E00008 */        jr $ra
  /* 144240 80134C60 27BD0080 */     addiu $sp, $sp, 0x80

glabel mnTrainingSetCursorCoordinatesFromToken
  /* 144244 80134C64 240600B8 */     addiu $a2, $zero, 0xb8
  /* 144248 80134C68 00860019 */     multu $a0, $a2
  /* 14424C 80134C6C 3C058014 */       lui $a1, %hi(gMNTrainingPanels)
  /* 144250 80134C70 24A58558 */     addiu $a1, $a1, %lo(gMNTrainingPanels)
  /* 144254 80134C74 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 144258 80134C78 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 14425C 80134C7C 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 144260 80134C80 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 144264 80134C84 00007012 */      mflo $t6
  /* 144268 80134C88 00AE1021 */      addu $v0, $a1, $t6
  /* 14426C 80134C8C 8C4F007C */        lw $t7, 0x7c($v0)
  /* 144270 80134C90 01E60019 */     multu $t7, $a2
  /* 144274 80134C94 0000C012 */      mflo $t8
  /* 144278 80134C98 00B81821 */      addu $v1, $a1, $t8
  /* 14427C 80134C9C 8C790004 */        lw $t9, 4($v1)
  /* 144280 80134CA0 8F280074 */        lw $t0, 0x74($t9)
  /* 144284 80134CA4 C5040058 */      lwc1 $f4, 0x58($t0)
  /* 144288 80134CA8 46062201 */     sub.s $f8, $f4, $f6
  /* 14428C 80134CAC E4480094 */      swc1 $f8, 0x94($v0)
  /* 144290 80134CB0 8C690004 */        lw $t1, 4($v1)
  /* 144294 80134CB4 8D2A0074 */        lw $t2, 0x74($t1)
  /* 144298 80134CB8 C54A005C */      lwc1 $f10, 0x5c($t2)
  /* 14429C 80134CBC 46105481 */     sub.s $f18, $f10, $f16
  /* 1442A0 80134CC0 03E00008 */        jr $ra
  /* 1442A4 80134CC4 E4520098 */      swc1 $f18, 0x98($v0)

glabel mnTrainingHandleCursorPickup
  /* 1442A8 80134CC8 240600B8 */     addiu $a2, $zero, 0xb8
  /* 1442AC 80134CCC 00A60019 */     multu $a1, $a2
  /* 1442B0 80134CD0 3C038014 */       lui $v1, %hi(gMNTrainingPanels)
  /* 1442B4 80134CD4 24638558 */     addiu $v1, $v1, %lo(gMNTrainingPanels)
  /* 1442B8 80134CD8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1442BC 80134CDC AFB00018 */        sw $s0, 0x18($sp)
  /* 1442C0 80134CE0 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1442C4 80134CE4 24180001 */     addiu $t8, $zero, 1
  /* 1442C8 80134CE8 00808825 */        or $s1, $a0, $zero
  /* 1442CC 80134CEC AFBF0024 */        sw $ra, 0x24($sp)
  /* 1442D0 80134CF0 AFB20020 */        sw $s2, 0x20($sp)
  /* 1442D4 80134CF4 00007012 */      mflo $t6
  /* 1442D8 80134CF8 006E1021 */      addu $v0, $v1, $t6
  /* 1442DC 80134CFC AC440078 */        sw $a0, 0x78($v0)
  /* 1442E0 80134D00 00860019 */     multu $a0, $a2
  /* 1442E4 80134D04 AC400054 */        sw $zero, 0x54($v0)
  /* 1442E8 80134D08 00A09025 */        or $s2, $a1, $zero
  /* 1442EC 80134D0C 00A02025 */        or $a0, $a1, $zero
  /* 1442F0 80134D10 00007812 */      mflo $t7
  /* 1442F4 80134D14 006F8021 */      addu $s0, $v1, $t7
  /* 1442F8 80134D18 AE180050 */        sw $t8, 0x50($s0)
  /* 1442FC 80134D1C AE05007C */        sw $a1, 0x7c($s0)
  /* 144300 80134D20 0C04CF8C */       jal mnTrainingSyncFighterDisplay
  /* 144304 80134D24 AC400084 */        sw $zero, 0x84($v0)
  /* 144308 80134D28 02202025 */        or $a0, $s1, $zero
  /* 14430C 80134D2C 0C04D23C */       jal mnTrainingReorderCursorsOnPickup
  /* 144310 80134D30 02402825 */        or $a1, $s2, $zero
  /* 144314 80134D34 0C04D319 */       jal mnTrainingSetCursorCoordinatesFromToken
  /* 144318 80134D38 02202025 */        or $a0, $s1, $zero
  /* 14431C 80134D3C 8E040000 */        lw $a0, ($s0)
  /* 144320 80134D40 02202825 */        or $a1, $s1, $zero
  /* 144324 80134D44 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 144328 80134D48 8E060050 */        lw $a2, 0x50($s0)
  /* 14432C 80134D4C 24190001 */     addiu $t9, $zero, 1
  /* 144330 80134D50 AE19009C */        sw $t9, 0x9c($s0)
  /* 144334 80134D54 0C009A70 */       jal func_800269C0
  /* 144338 80134D58 2404007F */     addiu $a0, $zero, 0x7f
  /* 14433C 80134D5C 0C04D0AE */       jal mnTrainingRemoveHandicapCPULevel
  /* 144340 80134D60 02402025 */        or $a0, $s2, $zero
  /* 144344 80134D64 0C04CFDA */       jal mnTrainingRemoveWhiteSquare
  /* 144348 80134D68 02402025 */        or $a0, $s2, $zero
  /* 14434C 80134D6C 0C04CFB8 */       jal mnTrainingSyncNameAndLogo
  /* 144350 80134D70 02402025 */        or $a0, $s2, $zero
  /* 144354 80134D74 8FBF0024 */        lw $ra, 0x24($sp)
  /* 144358 80134D78 8FB00018 */        lw $s0, 0x18($sp)
  /* 14435C 80134D7C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 144360 80134D80 8FB20020 */        lw $s2, 0x20($sp)
  /* 144364 80134D84 03E00008 */        jr $ra
  /* 144368 80134D88 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnTrainingCheckAndHandleTokenPickup
  /* 14436C 80134D8C 00057080 */       sll $t6, $a1, 2
  /* 144370 80134D90 01C57023 */      subu $t6, $t6, $a1
  /* 144374 80134D94 000E70C0 */       sll $t6, $t6, 3
  /* 144378 80134D98 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 14437C 80134D9C 01C57023 */      subu $t6, $t6, $a1
  /* 144380 80134DA0 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 144384 80134DA4 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 144388 80134DA8 000E70C0 */       sll $t6, $t6, 3
  /* 14438C 80134DAC 01CF1021 */      addu $v0, $t6, $t7
  /* 144390 80134DB0 3C188014 */       lui $t8, %hi(gMNTrainingFramesElapsed)
  /* 144394 80134DB4 8F18888C */        lw $t8, %lo(gMNTrainingFramesElapsed)($t8)
  /* 144398 80134DB8 8C59005C */        lw $t9, 0x5c($v0)
  /* 14439C 80134DBC AFB40028 */        sw $s4, 0x28($sp)
  /* 1443A0 80134DC0 AFB20020 */        sw $s2, 0x20($sp)
  /* 1443A4 80134DC4 0319082A */       slt $at, $t8, $t9
  /* 1443A8 80134DC8 00A09025 */        or $s2, $a1, $zero
  /* 1443AC 80134DCC 0080A025 */        or $s4, $a0, $zero
  /* 1443B0 80134DD0 AFBF0034 */        sw $ra, 0x34($sp)
  /* 1443B4 80134DD4 AFB60030 */        sw $s6, 0x30($sp)
  /* 1443B8 80134DD8 AFB5002C */        sw $s5, 0x2c($sp)
  /* 1443BC 80134DDC AFB30024 */        sw $s3, 0x24($sp)
  /* 1443C0 80134DE0 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1443C4 80134DE4 14200004 */      bnez $at, .L80134DF8
  /* 1443C8 80134DE8 AFB00018 */        sw $s0, 0x18($sp)
  /* 1443CC 80134DEC 8C480058 */        lw $t0, 0x58($v0)
  /* 1443D0 80134DF0 51000004 */      beql $t0, $zero, .L80134E04
  /* 1443D4 80134DF4 8C490050 */        lw $t1, 0x50($v0)
  .L80134DF8:
  /* 1443D8 80134DF8 10000031 */         b .L80134EC0
  /* 1443DC 80134DFC 00001025 */        or $v0, $zero, $zero
  /* 1443E0 80134E00 8C490050 */        lw $t1, 0x50($v0)
  .L80134E04:
  /* 1443E4 80134E04 24150002 */     addiu $s5, $zero, 2
  /* 1443E8 80134E08 24110003 */     addiu $s1, $zero, 3
  /* 1443EC 80134E0C 12A90003 */       beq $s5, $t1, .L80134E1C
  /* 1443F0 80134E10 3C108014 */       lui $s0, %hi(D_ovl28_80138780)
  /* 1443F4 80134E14 1000002A */         b .L80134EC0
  /* 1443F8 80134E18 00001025 */        or $v0, $zero, $zero
  .L80134E1C:
  /* 1443FC 80134E1C 26108780 */     addiu $s0, $s0, %lo(D_ovl28_80138780)
  /* 144400 80134E20 24160001 */     addiu $s6, $zero, 1
  /* 144404 80134E24 24130004 */     addiu $s3, $zero, 4
  .L80134E28:
  /* 144408 80134E28 56510012 */      bnel $s2, $s1, .L80134E74
  /* 14440C 80134E2C 8E0C0078 */        lw $t4, 0x78($s0) # D_ovl28_80138780 + 120
  /* 144410 80134E30 8E0A0078 */        lw $t2, 0x78($s0) # D_ovl28_80138780 + 120
  /* 144414 80134E34 566A001F */      bnel $s3, $t2, .L80134EB4
  /* 144418 80134E38 2631FFFF */     addiu $s1, $s1, -1
  /* 14441C 80134E3C 8E0B0080 */        lw $t3, 0x80($s0) # D_ovl28_80138780 + 128
  /* 144420 80134E40 02802025 */        or $a0, $s4, $zero
  /* 144424 80134E44 02402825 */        or $a1, $s2, $zero
  /* 144428 80134E48 52AB001A */      beql $s5, $t3, .L80134EB4
  /* 14442C 80134E4C 2631FFFF */     addiu $s1, $s1, -1
  /* 144430 80134E50 0C04CF51 */       jal mnTrainingCheckTokenPickup
  /* 144434 80134E54 02203025 */        or $a2, $s1, $zero
  /* 144438 80134E58 10400015 */      beqz $v0, .L80134EB0
  /* 14443C 80134E5C 02402025 */        or $a0, $s2, $zero
  /* 144440 80134E60 0C04D332 */       jal mnTrainingHandleCursorPickup
  /* 144444 80134E64 02202825 */        or $a1, $s1, $zero
  /* 144448 80134E68 10000015 */         b .L80134EC0
  /* 14444C 80134E6C 24020001 */     addiu $v0, $zero, 1
  /* 144450 80134E70 8E0C0078 */        lw $t4, 0x78($s0) # D_ovl28_80138780 + 120
  .L80134E74:
  /* 144454 80134E74 566C000F */      bnel $s3, $t4, .L80134EB4
  /* 144458 80134E78 2631FFFF */     addiu $s1, $s1, -1
  /* 14445C 80134E7C 8E0D0080 */        lw $t5, 0x80($s0) # D_ovl28_80138780 + 128
  /* 144460 80134E80 02802025 */        or $a0, $s4, $zero
  /* 144464 80134E84 02402825 */        or $a1, $s2, $zero
  /* 144468 80134E88 56CD000A */      bnel $s6, $t5, .L80134EB4
  /* 14446C 80134E8C 2631FFFF */     addiu $s1, $s1, -1
  /* 144470 80134E90 0C04CF51 */       jal mnTrainingCheckTokenPickup
  /* 144474 80134E94 02203025 */        or $a2, $s1, $zero
  /* 144478 80134E98 10400005 */      beqz $v0, .L80134EB0
  /* 14447C 80134E9C 02402025 */        or $a0, $s2, $zero
  /* 144480 80134EA0 0C04D332 */       jal mnTrainingHandleCursorPickup
  /* 144484 80134EA4 02202825 */        or $a1, $s1, $zero
  /* 144488 80134EA8 10000005 */         b .L80134EC0
  /* 14448C 80134EAC 24020001 */     addiu $v0, $zero, 1
  .L80134EB0:
  /* 144490 80134EB0 2631FFFF */     addiu $s1, $s1, -1
  .L80134EB4:
  /* 144494 80134EB4 0621FFDC */      bgez $s1, .L80134E28
  /* 144498 80134EB8 2610FF48 */     addiu $s0, $s0, -0xb8
  /* 14449C 80134EBC 00001025 */        or $v0, $zero, $zero
  .L80134EC0:
  /* 1444A0 80134EC0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1444A4 80134EC4 8FB00018 */        lw $s0, 0x18($sp)
  /* 1444A8 80134EC8 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1444AC 80134ECC 8FB20020 */        lw $s2, 0x20($sp)
  /* 1444B0 80134ED0 8FB30024 */        lw $s3, 0x24($sp)
  /* 1444B4 80134ED4 8FB40028 */        lw $s4, 0x28($sp)
  /* 1444B8 80134ED8 8FB5002C */        lw $s5, 0x2c($sp)
  /* 1444BC 80134EDC 8FB60030 */        lw $s6, 0x30($sp)
  /* 1444C0 80134EE0 03E00008 */        jr $ra
  /* 1444C4 80134EE4 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnTrainingGetFtKindFromTokenPosition
  /* 1444C8 80134EE8 00047080 */       sll $t6, $a0, 2
  /* 1444CC 80134EEC 01C47023 */      subu $t6, $t6, $a0
  /* 1444D0 80134EF0 000E70C0 */       sll $t6, $t6, 3
  /* 1444D4 80134EF4 01C47023 */      subu $t6, $t6, $a0
  /* 1444D8 80134EF8 000E70C0 */       sll $t6, $t6, 3
  /* 1444DC 80134EFC 3C0F8014 */       lui $t7, %hi(D_ovl28_8013855C)
  /* 1444E0 80134F00 01EE7821 */      addu $t7, $t7, $t6
  /* 1444E4 80134F04 8DEF855C */        lw $t7, %lo(D_ovl28_8013855C)($t7)
  /* 1444E8 80134F08 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1444EC 80134F0C AFBF0014 */        sw $ra, 0x14($sp)
  /* 1444F0 80134F10 8DE20074 */        lw $v0, 0x74($t7)
  /* 1444F4 80134F14 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 1444F8 80134F18 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 1444FC 80134F1C 00001025 */        or $v0, $zero, $zero
  /* 144500 80134F20 4600428D */ trunc.w.s $f10, $f8
  /* 144504 80134F24 4600218D */ trunc.w.s $f6, $f4
  /* 144508 80134F28 44035000 */      mfc1 $v1, $f10
  /* 14450C 80134F2C 44053000 */      mfc1 $a1, $f6
  /* 144510 80134F30 2463000C */     addiu $v1, $v1, 0xc
  /* 144514 80134F34 28610024 */      slti $at, $v1, 0x24
  /* 144518 80134F38 14200006 */      bnez $at, .L80134F54
  /* 14451C 80134F3C 24A5000D */     addiu $a1, $a1, 0xd
  /* 144520 80134F40 2861004F */      slti $at, $v1, 0x4f
  /* 144524 80134F44 10200003 */      beqz $at, .L80134F54
  /* 144528 80134F48 00000000 */       nop
  /* 14452C 80134F4C 10000001 */         b .L80134F54
  /* 144530 80134F50 24020001 */     addiu $v0, $zero, 1
  .L80134F54:
  /* 144534 80134F54 1040001C */      beqz $v0, .L80134FC8
  /* 144538 80134F58 28A10019 */      slti $at, $a1, 0x19
  /* 14453C 80134F5C 14200006 */      bnez $at, .L80134F78
  /* 144540 80134F60 00001025 */        or $v0, $zero, $zero
  /* 144544 80134F64 28A10127 */      slti $at, $a1, 0x127
  /* 144548 80134F68 10200003 */      beqz $at, .L80134F78
  /* 14454C 80134F6C 00000000 */       nop
  /* 144550 80134F70 10000001 */         b .L80134F78
  /* 144554 80134F74 24020001 */     addiu $v0, $zero, 1
  .L80134F78:
  /* 144558 80134F78 10400013 */      beqz $v0, .L80134FC8
  /* 14455C 80134F7C 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 144560 80134F80 2401002D */     addiu $at, $zero, 0x2d
  /* 144564 80134F84 0081001A */       div $zero, $a0, $at
  /* 144568 80134F88 00002012 */      mflo $a0
  /* 14456C 80134F8C 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 144570 80134F90 00000000 */       nop
  /* 144574 80134F94 AFA20018 */        sw $v0, 0x18($sp)
  /* 144578 80134F98 0C04C761 */       jal mnTrainingCheckFighterIsXBoxed
  /* 14457C 80134F9C 00402025 */        or $a0, $v0, $zero
  /* 144580 80134FA0 14400005 */      bnez $v0, .L80134FB8
  /* 144584 80134FA4 00000000 */       nop
  /* 144588 80134FA8 0C04C7BF */       jal mnTrainingGetIsLocked
  /* 14458C 80134FAC 8FA40018 */        lw $a0, 0x18($sp)
  /* 144590 80134FB0 10400003 */      beqz $v0, .L80134FC0
  /* 144594 80134FB4 00000000 */       nop
  .L80134FB8:
  /* 144598 80134FB8 1000002A */         b .L80135064
  /* 14459C 80134FBC 2402001C */     addiu $v0, $zero, 0x1c
  .L80134FC0:
  /* 1445A0 80134FC0 10000028 */         b .L80135064
  /* 1445A4 80134FC4 8FA20018 */        lw $v0, 0x18($sp)
  .L80134FC8:
  /* 1445A8 80134FC8 2861004F */      slti $at, $v1, 0x4f
  /* 1445AC 80134FCC 14200006 */      bnez $at, .L80134FE8
  /* 1445B0 80134FD0 00001025 */        or $v0, $zero, $zero
  /* 1445B4 80134FD4 2861007A */      slti $at, $v1, 0x7a
  /* 1445B8 80134FD8 10200003 */      beqz $at, .L80134FE8
  /* 1445BC 80134FDC 00000000 */       nop
  /* 1445C0 80134FE0 10000001 */         b .L80134FE8
  /* 1445C4 80134FE4 24020001 */     addiu $v0, $zero, 1
  .L80134FE8:
  /* 1445C8 80134FE8 1040001D */      beqz $v0, .L80135060
  /* 1445CC 80134FEC 28A10019 */      slti $at, $a1, 0x19
  /* 1445D0 80134FF0 14200006 */      bnez $at, .L8013500C
  /* 1445D4 80134FF4 00001025 */        or $v0, $zero, $zero
  /* 1445D8 80134FF8 28A10127 */      slti $at, $a1, 0x127
  /* 1445DC 80134FFC 10200003 */      beqz $at, .L8013500C
  /* 1445E0 80135000 00000000 */       nop
  /* 1445E4 80135004 10000001 */         b .L8013500C
  /* 1445E8 80135008 24020001 */     addiu $v0, $zero, 1
  .L8013500C:
  /* 1445EC 8013500C 10400014 */      beqz $v0, .L80135060
  /* 1445F0 80135010 24A4FFE7 */     addiu $a0, $a1, -0x19
  /* 1445F4 80135014 2401002D */     addiu $at, $zero, 0x2d
  /* 1445F8 80135018 0081001A */       div $zero, $a0, $at
  /* 1445FC 8013501C 00002012 */      mflo $a0
  /* 144600 80135020 24840006 */     addiu $a0, $a0, 6
  /* 144604 80135024 0C04C7F4 */       jal mnTrainingGetFtKind
  /* 144608 80135028 00000000 */       nop
  /* 14460C 8013502C AFA20018 */        sw $v0, 0x18($sp)
  /* 144610 80135030 0C04C761 */       jal mnTrainingCheckFighterIsXBoxed
  /* 144614 80135034 00402025 */        or $a0, $v0, $zero
  /* 144618 80135038 14400005 */      bnez $v0, .L80135050
  /* 14461C 8013503C 00000000 */       nop
  /* 144620 80135040 0C04C7BF */       jal mnTrainingGetIsLocked
  /* 144624 80135044 8FA40018 */        lw $a0, 0x18($sp)
  /* 144628 80135048 10400003 */      beqz $v0, .L80135058
  /* 14462C 8013504C 00000000 */       nop
  .L80135050:
  /* 144630 80135050 10000004 */         b .L80135064
  /* 144634 80135054 2402001C */     addiu $v0, $zero, 0x1c
  .L80135058:
  /* 144638 80135058 10000002 */         b .L80135064
  /* 14463C 8013505C 8FA20018 */        lw $v0, 0x18($sp)
  .L80135060:
  /* 144640 80135060 2402001C */     addiu $v0, $zero, 0x1c
  .L80135064:
  /* 144644 80135064 8FBF0014 */        lw $ra, 0x14($sp)
  /* 144648 80135068 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14464C 8013506C 03E00008 */        jr $ra
  /* 144650 80135070 00000000 */       nop

glabel mnTrainingAutoPositionCursor
  /* 144654 80135074 3C0E8014 */       lui $t6, %hi(dMNTrainingCursorTypePositions2)
  /* 144658 80135078 25CE8380 */     addiu $t6, $t6, %lo(dMNTrainingCursorTypePositions2)
  /* 14465C 8013507C 8DD80000 */        lw $t8, ($t6) # dMNTrainingCursorTypePositions2 + 0
  /* 144660 80135080 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 144664 80135084 27A8001C */     addiu $t0, $sp, 0x1c
  /* 144668 80135088 AD180000 */        sw $t8, ($t0)
  /* 14466C 8013508C 8DCF0004 */        lw $t7, 4($t6) # dMNTrainingCursorTypePositions2 + 4
  /* 144670 80135090 0005C880 */       sll $t9, $a1, 2
  /* 144674 80135094 0325C823 */      subu $t9, $t9, $a1
  /* 144678 80135098 AD0F0004 */        sw $t7, 4($t0)
  /* 14467C 8013509C 8DD80008 */        lw $t8, 8($t6) # dMNTrainingCursorTypePositions2 + 8
  /* 144680 801350A0 0019C8C0 */       sll $t9, $t9, 3
  /* 144684 801350A4 0325C823 */      subu $t9, $t9, $a1
  /* 144688 801350A8 AD180008 */        sw $t8, 8($t0)
  /* 14468C 801350AC 8DCF000C */        lw $t7, 0xc($t6) # dMNTrainingCursorTypePositions2 + 12
  /* 144690 801350B0 3C098014 */       lui $t1, %hi(gMNTrainingPanels)
  /* 144694 801350B4 25298558 */     addiu $t1, $t1, %lo(gMNTrainingPanels)
  /* 144698 801350B8 AD0F000C */        sw $t7, 0xc($t0)
  /* 14469C 801350BC 8DD80010 */        lw $t8, 0x10($t6) # dMNTrainingCursorTypePositions2 + 16
  /* 1446A0 801350C0 0019C8C0 */       sll $t9, $t9, 3
  /* 1446A4 801350C4 03291021 */      addu $v0, $t9, $t1
  /* 1446A8 801350C8 8C4A009C */        lw $t2, 0x9c($v0)
  /* 1446AC 801350CC AD180010 */        sw $t8, 0x10($t0)
  /* 1446B0 801350D0 8DCF0014 */        lw $t7, 0x14($t6) # dMNTrainingCursorTypePositions2 + 20
  /* 1446B4 801350D4 00803025 */        or $a2, $a0, $zero
  /* 1446B8 801350D8 11400060 */      beqz $t2, .L8013525C
  /* 1446BC 801350DC AD0F0014 */        sw $t7, 0x14($t0)
  /* 1446C0 801350E0 8C4B0000 */        lw $t3, ($v0)
  /* 1446C4 801350E4 C4420094 */      lwc1 $f2, 0x94($v0)
  /* 1446C8 801350E8 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 1446CC 801350EC 8D630074 */        lw $v1, 0x74($t3)
  /* 1446D0 801350F0 44817000 */      mtc1 $at, $f14 # 5.0 to cop1
  /* 1446D4 801350F4 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1446D8 801350F8 C46C0058 */      lwc1 $f12, 0x58($v1)
  /* 1446DC 801350FC 44818000 */      mtc1 $at, $f16 # -1.0 to cop1
  /* 1446E0 80135100 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1446E4 80135104 460C1101 */     sub.s $f4, $f2, $f12
  /* 1446E8 80135108 00002025 */        or $a0, $zero, $zero
  /* 1446EC 8013510C 460E2003 */     div.s $f0, $f4, $f14
  /* 1446F0 80135110 4600803E */    c.le.s $f16, $f0
  /* 1446F4 80135114 00000000 */       nop
  /* 1446F8 80135118 45000009 */      bc1f .L80135140
  /* 1446FC 8013511C 00000000 */       nop
  /* 144700 80135120 44813000 */      mtc1 $at, $f6 # 1.0 to cop1
  /* 144704 80135124 00000000 */       nop
  /* 144708 80135128 4606003E */    c.le.s $f0, $f6
  /* 14470C 8013512C 00000000 */       nop
  /* 144710 80135130 45000003 */      bc1f .L80135140
  /* 144714 80135134 00000000 */       nop
  /* 144718 80135138 10000001 */         b .L80135140
  /* 14471C 8013513C 24040001 */     addiu $a0, $zero, 1
  .L80135140:
  /* 144720 80135140 10800003 */      beqz $a0, .L80135150
  /* 144724 80135144 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 144728 80135148 10000003 */         b .L80135158
  /* 14472C 8013514C E4620058 */      swc1 $f2, 0x58($v1)
  .L80135150:
  /* 144730 80135150 46006200 */     add.s $f8, $f12, $f0
  /* 144734 80135154 E4680058 */      swc1 $f8, 0x58($v1)
  .L80135158:
  /* 144738 80135158 8C4C0000 */        lw $t4, ($v0)
  /* 14473C 8013515C C4420098 */      lwc1 $f2, 0x98($v0)
  /* 144740 80135160 00002025 */        or $a0, $zero, $zero
  /* 144744 80135164 8D830074 */        lw $v1, 0x74($t4)
  /* 144748 80135168 C46C005C */      lwc1 $f12, 0x5c($v1)
  /* 14474C 8013516C 460C1281 */     sub.s $f10, $f2, $f12
  /* 144750 80135170 460E5003 */     div.s $f0, $f10, $f14
  /* 144754 80135174 4600803E */    c.le.s $f16, $f0
  /* 144758 80135178 00000000 */       nop
  /* 14475C 8013517C 45000009 */      bc1f .L801351A4
  /* 144760 80135180 00000000 */       nop
  /* 144764 80135184 44819000 */      mtc1 $at, $f18 # 1.0 to cop1
  /* 144768 80135188 00000000 */       nop
  /* 14476C 8013518C 4612003E */    c.le.s $f0, $f18
  /* 144770 80135190 00000000 */       nop
  /* 144774 80135194 45000003 */      bc1f .L801351A4
  /* 144778 80135198 00000000 */       nop
  /* 14477C 8013519C 10000001 */         b .L801351A4
  /* 144780 801351A0 24040001 */     addiu $a0, $zero, 1
  .L801351A4:
  /* 144784 801351A4 50800004 */      beql $a0, $zero, .L801351B8
  /* 144788 801351A8 46006100 */     add.s $f4, $f12, $f0
  /* 14478C 801351AC 10000003 */         b .L801351BC
  /* 144790 801351B0 E462005C */      swc1 $f2, 0x5c($v1)
  /* 144794 801351B4 46006100 */     add.s $f4, $f12, $f0
  .L801351B8:
  /* 144798 801351B8 E464005C */      swc1 $f4, 0x5c($v1)
  .L801351BC:
  /* 14479C 801351BC 8C4D0000 */        lw $t5, ($v0)
  /* 1447A0 801351C0 C4480094 */      lwc1 $f8, 0x94($v0)
  /* 1447A4 801351C4 8DA30074 */        lw $v1, 0x74($t5)
  /* 1447A8 801351C8 C4660058 */      lwc1 $f6, 0x58($v1)
  /* 1447AC 801351CC 46083032 */    c.eq.s $f6, $f8
  /* 1447B0 801351D0 00000000 */       nop
  /* 1447B4 801351D4 45020009 */     bc1fl .L801351FC
  /* 1447B8 801351D8 8C4E0050 */        lw $t6, 0x50($v0)
  /* 1447BC 801351DC C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 1447C0 801351E0 C4520098 */      lwc1 $f18, 0x98($v0)
  /* 1447C4 801351E4 46125032 */    c.eq.s $f10, $f18
  /* 1447C8 801351E8 00000000 */       nop
  /* 1447CC 801351EC 45020003 */     bc1fl .L801351FC
  /* 1447D0 801351F0 8C4E0050 */        lw $t6, 0x50($v0)
  /* 1447D4 801351F4 AC40009C */        sw $zero, 0x9c($v0)
  /* 1447D8 801351F8 8C4E0050 */        lw $t6, 0x50($v0)
  .L801351FC:
  /* 1447DC 801351FC 8CC30074 */        lw $v1, 0x74($a2)
  /* 1447E0 80135200 000E78C0 */       sll $t7, $t6, 3
  /* 1447E4 80135204 010FC021 */      addu $t8, $t0, $t7
  /* 1447E8 80135208 8F190000 */        lw $t9, ($t8)
  /* 1447EC 8013520C C4680058 */      lwc1 $f8, 0x58($v1)
  /* 1447F0 80135210 8C690008 */        lw $t1, 8($v1)
  /* 1447F4 80135214 44992000 */      mtc1 $t9, $f4
  /* 1447F8 80135218 00000000 */       nop
  /* 1447FC 8013521C 468021A0 */   cvt.s.w $f6, $f4
  /* 144800 80135220 46083280 */     add.s $f10, $f6, $f8
  /* 144804 80135224 E52A0058 */      swc1 $f10, 0x58($t1)
  /* 144808 80135228 8C4A0050 */        lw $t2, 0x50($v0)
  /* 14480C 8013522C 8CC30074 */        lw $v1, 0x74($a2)
  /* 144810 80135230 000A58C0 */       sll $t3, $t2, 3
  /* 144814 80135234 010B6021 */      addu $t4, $t0, $t3
  /* 144818 80135238 8D8D0004 */        lw $t5, 4($t4)
  /* 14481C 8013523C C466005C */      lwc1 $f6, 0x5c($v1)
  /* 144820 80135240 8C6E0008 */        lw $t6, 8($v1)
  /* 144824 80135244 448D9000 */      mtc1 $t5, $f18
  /* 144828 80135248 00000000 */       nop
  /* 14482C 8013524C 46809120 */   cvt.s.w $f4, $f18
  /* 144830 80135250 46062200 */     add.s $f8, $f4, $f6
  /* 144834 80135254 10000074 */         b .L80135428
  /* 144838 80135258 E5C8005C */      swc1 $f8, 0x5c($t6)
  .L8013525C:
  /* 14483C 8013525C 8C4F0058 */        lw $t7, 0x58($v0)
  /* 144840 80135260 3C188014 */       lui $t8, %hi(gMNTrainingHumanPanelPort)
  /* 144844 80135264 15E00070 */      bnez $t7, .L80135428
  /* 144848 80135268 00000000 */       nop
  /* 14484C 8013526C 8F188894 */        lw $t8, %lo(gMNTrainingHumanPanelPort)($t8)
  /* 144850 80135270 3C098004 */       lui $t1, %hi(gPlayerControllers)
  /* 144854 80135274 25295228 */     addiu $t1, $t1, %lo(gPlayerControllers)
  /* 144858 80135278 0018C880 */       sll $t9, $t8, 2
  /* 14485C 8013527C 0338C821 */      addu $t9, $t9, $t8
  /* 144860 80135280 0019C840 */       sll $t9, $t9, 1
  /* 144864 80135284 03292821 */      addu $a1, $t9, $t1
  /* 144868 80135288 80A70008 */        lb $a3, 8($a1)
  /* 14486C 8013528C 28E1FFF8 */      slti $at, $a3, -8
  /* 144870 80135290 14200003 */      bnez $at, .L801352A0
  /* 144874 80135294 28E10009 */      slti $at, $a3, 9
  /* 144878 80135298 14200003 */      bnez $at, .L801352A8
  /* 14487C 8013529C 00002025 */        or $a0, $zero, $zero
  .L801352A0:
  /* 144880 801352A0 10000001 */         b .L801352A8
  /* 144884 801352A4 24040001 */     addiu $a0, $zero, 1
  .L801352A8:
  /* 144888 801352A8 5080002F */      beql $a0, $zero, .L80135368
  /* 14488C 801352AC 80A70009 */        lb $a3, 9($a1)
  /* 144890 801352B0 44875000 */      mtc1 $a3, $f10
  /* 144894 801352B4 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 144898 801352B8 44812000 */      mtc1 $at, $f4 # 20.0 to cop1
  /* 14489C 801352BC 468054A0 */   cvt.s.w $f18, $f10
  /* 1448A0 801352C0 8CC30074 */        lw $v1, 0x74($a2)
  /* 1448A4 801352C4 44805000 */      mtc1 $zero, $f10
  /* 1448A8 801352C8 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 1448AC 801352CC C4680058 */      lwc1 $f8, 0x58($v1)
  /* 1448B0 801352D0 00002025 */        or $a0, $zero, $zero
  /* 1448B4 801352D4 46049183 */     div.s $f6, $f18, $f4
  /* 1448B8 801352D8 46083000 */     add.s $f0, $f6, $f8
  /* 1448BC 801352DC 4600503E */    c.le.s $f10, $f0
  /* 1448C0 801352E0 00000000 */       nop
  /* 1448C4 801352E4 45000009 */      bc1f .L8013530C
  /* 1448C8 801352E8 00000000 */       nop
  /* 1448CC 801352EC 44819000 */      mtc1 $at, $f18 # 280.0 to cop1
  /* 1448D0 801352F0 00000000 */       nop
  /* 1448D4 801352F4 4612003E */    c.le.s $f0, $f18
  /* 1448D8 801352F8 00000000 */       nop
  /* 1448DC 801352FC 45000003 */      bc1f .L8013530C
  /* 1448E0 80135300 00000000 */       nop
  /* 1448E4 80135304 10000001 */         b .L8013530C
  /* 1448E8 80135308 24040001 */     addiu $a0, $zero, 1
  .L8013530C:
  /* 1448EC 8013530C 50800016 */      beql $a0, $zero, .L80135368
  /* 1448F0 80135310 80A70009 */        lb $a3, 9($a1)
  /* 1448F4 80135314 E4600058 */      swc1 $f0, 0x58($v1)
  /* 1448F8 80135318 8C4A0050 */        lw $t2, 0x50($v0)
  /* 1448FC 8013531C 8CC30074 */        lw $v1, 0x74($a2)
  /* 144900 80135320 3C0F8014 */       lui $t7, %hi(gMNTrainingHumanPanelPort)
  /* 144904 80135324 000A58C0 */       sll $t3, $t2, 3
  /* 144908 80135328 010B6021 */      addu $t4, $t0, $t3
  /* 14490C 8013532C 8D8D0000 */        lw $t5, ($t4)
  /* 144910 80135330 C4680058 */      lwc1 $f8, 0x58($v1)
  /* 144914 80135334 8C6E0008 */        lw $t6, 8($v1)
  /* 144918 80135338 448D2000 */      mtc1 $t5, $f4
  /* 14491C 8013533C 3C198004 */       lui $t9, %hi(gPlayerControllers)
  /* 144920 80135340 27395228 */     addiu $t9, $t9, %lo(gPlayerControllers)
  /* 144924 80135344 468021A0 */   cvt.s.w $f6, $f4
  /* 144928 80135348 46083280 */     add.s $f10, $f6, $f8
  /* 14492C 8013534C E5CA0058 */      swc1 $f10, 0x58($t6)
  /* 144930 80135350 8DEF8894 */        lw $t7, %lo(gMNTrainingHumanPanelPort)($t7)
  /* 144934 80135354 000FC080 */       sll $t8, $t7, 2
  /* 144938 80135358 030FC021 */      addu $t8, $t8, $t7
  /* 14493C 8013535C 0018C040 */       sll $t8, $t8, 1
  /* 144940 80135360 03192821 */      addu $a1, $t8, $t9
  /* 144944 80135364 80A70009 */        lb $a3, 9($a1)
  .L80135368:
  /* 144948 80135368 28E1FFF8 */      slti $at, $a3, -8
  /* 14494C 8013536C 14200003 */      bnez $at, .L8013537C
  /* 144950 80135370 28E10009 */      slti $at, $a3, 9
  /* 144954 80135374 14200003 */      bnez $at, .L80135384
  /* 144958 80135378 00002025 */        or $a0, $zero, $zero
  .L8013537C:
  /* 14495C 8013537C 10000001 */         b .L80135384
  /* 144960 80135380 24040001 */     addiu $a0, $zero, 1
  .L80135384:
  /* 144964 80135384 10800028 */      beqz $a0, .L80135428
  /* 144968 80135388 00000000 */       nop
  /* 14496C 8013538C 44879000 */      mtc1 $a3, $f18
  /* 144970 80135390 3C01C1A0 */       lui $at, (0xC1A00000 >> 16) # -20.0
  /* 144974 80135394 44813000 */      mtc1 $at, $f6 # -20.0 to cop1
  /* 144978 80135398 46809120 */   cvt.s.w $f4, $f18
  /* 14497C 8013539C 8CC30074 */        lw $v1, 0x74($a2)
  /* 144980 801353A0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 144984 801353A4 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 144988 801353A8 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 14498C 801353AC 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 144990 801353B0 46062203 */     div.s $f8, $f4, $f6
  /* 144994 801353B4 00002025 */        or $a0, $zero, $zero
  /* 144998 801353B8 460A4000 */     add.s $f0, $f8, $f10
  /* 14499C 801353BC 4600903E */    c.le.s $f18, $f0
  /* 1449A0 801353C0 00000000 */       nop
  /* 1449A4 801353C4 45000009 */      bc1f .L801353EC
  /* 1449A8 801353C8 00000000 */       nop
  /* 1449AC 801353CC 44812000 */      mtc1 $at, $f4 # 205.0 to cop1
  /* 1449B0 801353D0 00000000 */       nop
  /* 1449B4 801353D4 4604003E */    c.le.s $f0, $f4
  /* 1449B8 801353D8 00000000 */       nop
  /* 1449BC 801353DC 45000003 */      bc1f .L801353EC
  /* 1449C0 801353E0 00000000 */       nop
  /* 1449C4 801353E4 10000001 */         b .L801353EC
  /* 1449C8 801353E8 24040001 */     addiu $a0, $zero, 1
  .L801353EC:
  /* 1449CC 801353EC 1080000E */      beqz $a0, .L80135428
  /* 1449D0 801353F0 00000000 */       nop
  /* 1449D4 801353F4 E460005C */      swc1 $f0, 0x5c($v1)
  /* 1449D8 801353F8 8C490050 */        lw $t1, 0x50($v0)
  /* 1449DC 801353FC 8CC30074 */        lw $v1, 0x74($a2)
  /* 1449E0 80135400 000950C0 */       sll $t2, $t1, 3
  /* 1449E4 80135404 010A5821 */      addu $t3, $t0, $t2
  /* 1449E8 80135408 8D6C0004 */        lw $t4, 4($t3)
  /* 1449EC 8013540C C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 1449F0 80135410 8C6D0008 */        lw $t5, 8($v1)
  /* 1449F4 80135414 448C3000 */      mtc1 $t4, $f6
  /* 1449F8 80135418 00000000 */       nop
  /* 1449FC 8013541C 46803220 */   cvt.s.w $f8, $f6
  /* 144A00 80135420 460A4480 */     add.s $f18, $f8, $f10
  /* 144A04 80135424 E5B2005C */      swc1 $f18, 0x5c($t5)
  .L80135428:
  /* 144A08 80135428 03E00008 */        jr $ra
  /* 144A0C 8013542C 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnTrainingSyncCursorDisplay
  /* 144A10 80135430 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 144A14 80135434 AFBF0034 */        sw $ra, 0x34($sp)
  /* 144A18 80135438 AFB60030 */        sw $s6, 0x30($sp)
  /* 144A1C 8013543C AFB5002C */        sw $s5, 0x2c($sp)
  /* 144A20 80135440 AFB40028 */        sw $s4, 0x28($sp)
  /* 144A24 80135444 AFB30024 */        sw $s3, 0x24($sp)
  /* 144A28 80135448 AFB20020 */        sw $s2, 0x20($sp)
  /* 144A2C 8013544C AFB1001C */        sw $s1, 0x1c($sp)
  /* 144A30 80135450 AFB00018 */        sw $s0, 0x18($sp)
  /* 144A34 80135454 8C8E0074 */        lw $t6, 0x74($a0)
  /* 144A38 80135458 3C0142F8 */       lui $at, (0x42F80000 >> 16) # 124.0
  /* 144A3C 8013545C 44812000 */      mtc1 $at, $f4 # 124.0 to cop1
  /* 144A40 80135460 C5C0005C */      lwc1 $f0, 0x5c($t6)
  /* 144A44 80135464 00A0A825 */        or $s5, $a1, $zero
  /* 144A48 80135468 00157880 */       sll $t7, $s5, 2
  /* 144A4C 8013546C 4600203C */    c.lt.s $f4, $f0
  /* 144A50 80135470 01F57823 */      subu $t7, $t7, $s5
  /* 144A54 80135474 0080B025 */        or $s6, $a0, $zero
  /* 144A58 80135478 3C014218 */       lui $at, (0x42180000 >> 16) # 38.0
  /* 144A5C 8013547C 4501000A */      bc1t .L801354A8
  /* 144A60 80135480 000F78C0 */       sll $t7, $t7, 3
  /* 144A64 80135484 44813000 */      mtc1 $at, $f6 # 38.0 to cop1
  /* 144A68 80135488 0015C880 */       sll $t9, $s5, 2
  /* 144A6C 8013548C 0335C823 */      subu $t9, $t9, $s5
  /* 144A70 80135490 4606003C */    c.lt.s $f0, $f6
  /* 144A74 80135494 0019C8C0 */       sll $t9, $t9, 3
  /* 144A78 80135498 0335C823 */      subu $t9, $t9, $s5
  /* 144A7C 8013549C 0019C8C0 */       sll $t9, $t9, 3
  /* 144A80 801354A0 45000011 */      bc1f .L801354E8
  /* 144A84 801354A4 3C088014 */       lui $t0, 0x8014
  .L801354A8:
  /* 144A88 801354A8 01F57823 */      subu $t7, $t7, $s5
  /* 144A8C 801354AC 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 144A90 801354B0 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 144A94 801354B4 000F78C0 */       sll $t7, $t7, 3
  /* 144A98 801354B8 01F8A021 */      addu $s4, $t7, $t8
  /* 144A9C 801354BC 8E820050 */        lw $v0, 0x50($s4)
  /* 144AA0 801354C0 02C02025 */        or $a0, $s6, $zero
  /* 144AA4 801354C4 02A02825 */        or $a1, $s5, $zero
  /* 144AA8 801354C8 10400005 */      beqz $v0, .L801354E0
  /* 144AAC 801354CC 00000000 */       nop
  /* 144AB0 801354D0 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 144AB4 801354D4 00003025 */        or $a2, $zero, $zero
  /* 144AB8 801354D8 AE800050 */        sw $zero, 0x50($s4)
  /* 144ABC 801354DC 00001025 */        or $v0, $zero, $zero
  .L801354E0:
  /* 144AC0 801354E0 1000001B */         b .L80135550
  /* 144AC4 801354E4 24130001 */     addiu $s3, $zero, 1
  .L801354E8:
  /* 144AC8 801354E8 25088558 */     addiu $t0, $t0, -0x7aa8
  /* 144ACC 801354EC 0328A021 */      addu $s4, $t9, $t0
  /* 144AD0 801354F0 8E89007C */        lw $t1, 0x7c($s4)
  /* 144AD4 801354F4 2401FFFF */     addiu $at, $zero, -1
  /* 144AD8 801354F8 5521000D */      bnel $t1, $at, .L80135530
  /* 144ADC 801354FC 8E820050 */        lw $v0, 0x50($s4)
  /* 144AE0 80135500 8E820050 */        lw $v0, 0x50($s4)
  /* 144AE4 80135504 24010002 */     addiu $at, $zero, 2
  /* 144AE8 80135508 02C02025 */        or $a0, $s6, $zero
  /* 144AEC 8013550C 10410005 */       beq $v0, $at, .L80135524
  /* 144AF0 80135510 02A02825 */        or $a1, $s5, $zero
  /* 144AF4 80135514 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 144AF8 80135518 24060002 */     addiu $a2, $zero, 2
  /* 144AFC 8013551C 24020002 */     addiu $v0, $zero, 2
  /* 144B00 80135520 AE820050 */        sw $v0, 0x50($s4)
  .L80135524:
  /* 144B04 80135524 1000000A */         b .L80135550
  /* 144B08 80135528 24130001 */     addiu $s3, $zero, 1
  /* 144B0C 8013552C 8E820050 */        lw $v0, 0x50($s4)
  .L80135530:
  /* 144B10 80135530 24130001 */     addiu $s3, $zero, 1
  /* 144B14 80135534 02C02025 */        or $a0, $s6, $zero
  /* 144B18 80135538 12620005 */       beq $s3, $v0, .L80135550
  /* 144B1C 8013553C 02A02825 */        or $a1, $s5, $zero
  /* 144B20 80135540 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 144B24 80135544 02603025 */        or $a2, $s3, $zero
  /* 144B28 80135548 AE930050 */        sw $s3, 0x50($s4)
  /* 144B2C 8013554C 02601025 */        or $v0, $s3, $zero
  .L80135550:
  /* 144B30 80135550 5440001A */      bnel $v0, $zero, .L801355BC
  /* 144B34 80135554 8FBF0034 */        lw $ra, 0x34($sp)
  /* 144B38 80135558 8E8B0054 */        lw $t3, 0x54($s4)
  /* 144B3C 8013555C 3C118014 */       lui $s1, %hi(gMNTrainingPanels)
  /* 144B40 80135560 26318558 */     addiu $s1, $s1, %lo(gMNTrainingPanels)
  /* 144B44 80135564 11600014 */      beqz $t3, .L801355B8
  /* 144B48 80135568 00008025 */        or $s0, $zero, $zero
  /* 144B4C 8013556C 24120004 */     addiu $s2, $zero, 4
  .L80135570:
  /* 144B50 80135570 8E2C0054 */        lw $t4, 0x54($s1) # gMNTrainingPanels + 84
  /* 144B54 80135574 02C02025 */        or $a0, $s6, $zero
  /* 144B58 80135578 02A02825 */        or $a1, $s5, $zero
  /* 144B5C 8013557C 566C000C */      bnel $s3, $t4, .L801355B0
  /* 144B60 80135580 26100001 */     addiu $s0, $s0, 1
  /* 144B64 80135584 0C04CF51 */       jal mnTrainingCheckTokenPickup
  /* 144B68 80135588 02003025 */        or $a2, $s0, $zero
  /* 144B6C 8013558C 10400007 */      beqz $v0, .L801355AC
  /* 144B70 80135590 02C02025 */        or $a0, $s6, $zero
  /* 144B74 80135594 02A02825 */        or $a1, $s5, $zero
  /* 144B78 80135598 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 144B7C 8013559C 24060002 */     addiu $a2, $zero, 2
  /* 144B80 801355A0 240D0002 */     addiu $t5, $zero, 2
  /* 144B84 801355A4 10000004 */         b .L801355B8
  /* 144B88 801355A8 AE8D0050 */        sw $t5, 0x50($s4)
  .L801355AC:
  /* 144B8C 801355AC 26100001 */     addiu $s0, $s0, 1
  .L801355B0:
  /* 144B90 801355B0 1612FFEF */       bne $s0, $s2, .L80135570
  /* 144B94 801355B4 263100B8 */     addiu $s1, $s1, 0xb8
  .L801355B8:
  /* 144B98 801355B8 8FBF0034 */        lw $ra, 0x34($sp)
  .L801355BC:
  /* 144B9C 801355BC 8FB00018 */        lw $s0, 0x18($sp)
  /* 144BA0 801355C0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 144BA4 801355C4 8FB20020 */        lw $s2, 0x20($sp)
  /* 144BA8 801355C8 8FB30024 */        lw $s3, 0x24($sp)
  /* 144BAC 801355CC 8FB40028 */        lw $s4, 0x28($sp)
  /* 144BB0 801355D0 8FB5002C */        lw $s5, 0x2c($sp)
  /* 144BB4 801355D4 8FB60030 */        lw $s6, 0x30($sp)
  /* 144BB8 801355D8 03E00008 */        jr $ra
  /* 144BBC 801355DC 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnTrainingTryCostumeChange
  /* 144BC0 801355E0 00047880 */       sll $t7, $a0, 2
  /* 144BC4 801355E4 01E47823 */      subu $t7, $t7, $a0
  /* 144BC8 801355E8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 144BCC 801355EC 000F78C0 */       sll $t7, $t7, 3
  /* 144BD0 801355F0 01E47823 */      subu $t7, $t7, $a0
  /* 144BD4 801355F4 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 144BD8 801355F8 AFB00018 */        sw $s0, 0x18($sp)
  /* 144BDC 801355FC 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 144BE0 80135600 000F78C0 */       sll $t7, $t7, 3
  /* 144BE4 80135604 AFBF001C */        sw $ra, 0x1c($sp)
  /* 144BE8 80135608 AFA40028 */        sw $a0, 0x28($sp)
  /* 144BEC 8013560C 01F88021 */      addu $s0, $t7, $t8
  /* 144BF0 80135610 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 144BF4 80135614 8E040048 */        lw $a0, 0x48($s0)
  /* 144BF8 80135618 AFA20024 */        sw $v0, 0x24($sp)
  /* 144BFC 8013561C 8E040048 */        lw $a0, 0x48($s0)
  /* 144C00 80135620 8FA50028 */        lw $a1, 0x28($sp)
  /* 144C04 80135624 0C04CCD4 */       jal mnTrainingIsCostumeInUse
  /* 144C08 80135628 00403025 */        or $a2, $v0, $zero
  /* 144C0C 8013562C 10400005 */      beqz $v0, .L80135644
  /* 144C10 80135630 8FA50024 */        lw $a1, 0x24($sp)
  /* 144C14 80135634 0C009A70 */       jal func_800269C0
  /* 144C18 80135638 240400A5 */     addiu $a0, $zero, 0xa5
  /* 144C1C 8013563C 10000009 */         b .L80135664
  /* 144C20 80135640 8FBF001C */        lw $ra, 0x1c($sp)
  .L80135644:
  /* 144C24 80135644 8E040008 */        lw $a0, 8($s0)
  /* 144C28 80135648 0C03A492 */       jal func_ovl2_800E9248
  /* 144C2C 8013564C 00003025 */        or $a2, $zero, $zero
  /* 144C30 80135650 8FB90024 */        lw $t9, 0x24($sp)
  /* 144C34 80135654 240400A4 */     addiu $a0, $zero, 0xa4
  /* 144C38 80135658 0C009A70 */       jal func_800269C0
  /* 144C3C 8013565C AE19004C */        sw $t9, 0x4c($s0)
  /* 144C40 80135660 8FBF001C */        lw $ra, 0x1c($sp)
  .L80135664:
  /* 144C44 80135664 8FB00018 */        lw $s0, 0x18($sp)
  /* 144C48 80135668 27BD0028 */     addiu $sp, $sp, 0x28
  /* 144C4C 8013566C 03E00008 */        jr $ra
  /* 144C50 80135670 00000000 */       nop

glabel mnTrainingIsHumanWithCharacterSelected
  /* 144C54 80135674 00047080 */       sll $t6, $a0, 2
  /* 144C58 80135678 01C47023 */      subu $t6, $t6, $a0
  /* 144C5C 8013567C 000E70C0 */       sll $t6, $t6, 3
  /* 144C60 80135680 01C47023 */      subu $t6, $t6, $a0
  /* 144C64 80135684 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 144C68 80135688 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 144C6C 8013568C 000E70C0 */       sll $t6, $t6, 3
  /* 144C70 80135690 01CF1021 */      addu $v0, $t6, $t7
  /* 144C74 80135694 8C580054 */        lw $t8, 0x54($v0)
  /* 144C78 80135698 5300000B */      beql $t8, $zero, .L801356C8
  /* 144C7C 8013569C 00001025 */        or $v0, $zero, $zero
  /* 144C80 801356A0 8C59007C */        lw $t9, 0x7c($v0)
  /* 144C84 801356A4 2401FFFF */     addiu $at, $zero, -1
  /* 144C88 801356A8 57210007 */      bnel $t9, $at, .L801356C8
  /* 144C8C 801356AC 00001025 */        or $v0, $zero, $zero
  /* 144C90 801356B0 8C480080 */        lw $t0, 0x80($v0)
  /* 144C94 801356B4 55000004 */      bnel $t0, $zero, .L801356C8
  /* 144C98 801356B8 00001025 */        or $v0, $zero, $zero
  /* 144C9C 801356BC 03E00008 */        jr $ra
  /* 144CA0 801356C0 24020001 */     addiu $v0, $zero, 1

  /* 144CA4 801356C4 00001025 */        or $v0, $zero, $zero
  .L801356C8:
  /* 144CA8 801356C8 03E00008 */        jr $ra
  /* 144CAC 801356CC 00000000 */       nop

glabel mnTrainingRecallToken
  /* 144CB0 801356D0 00047080 */       sll $t6, $a0, 2
  /* 144CB4 801356D4 01C47023 */      subu $t6, $t6, $a0
  /* 144CB8 801356D8 000E70C0 */       sll $t6, $t6, 3
  /* 144CBC 801356DC 01C47023 */      subu $t6, $t6, $a0
  /* 144CC0 801356E0 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 144CC4 801356E4 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 144CC8 801356E8 000E70C0 */       sll $t6, $t6, 3
  /* 144CCC 801356EC 01CF1021 */      addu $v0, $t6, $t7
  /* 144CD0 801356F0 8C430004 */        lw $v1, 4($v0)
  /* 144CD4 801356F4 24180001 */     addiu $t8, $zero, 1
  /* 144CD8 801356F8 AC400084 */        sw $zero, 0x84($v0)
  /* 144CDC 801356FC AC400054 */        sw $zero, 0x54($v0)
  /* 144CE0 80135700 AC580058 */        sw $t8, 0x58($v0)
  /* 144CE4 80135704 AC400074 */        sw $zero, 0x74($v0)
  /* 144CE8 80135708 8C790074 */        lw $t9, 0x74($v1)
  /* 144CEC 8013570C 8C450000 */        lw $a1, ($v0)
  /* 144CF0 80135710 3C01438C */       lui $at, (0x438C0000 >> 16) # 280.0
  /* 144CF4 80135714 C7240058 */      lwc1 $f4, 0x58($t9)
  /* 144CF8 80135718 44810000 */      mtc1 $at, $f0 # 280.0 to cop1
  /* 144CFC 8013571C 3C0141A0 */       lui $at, (0x41A00000 >> 16) # 20.0
  /* 144D00 80135720 E4440060 */      swc1 $f4, 0x60($v0)
  /* 144D04 80135724 8C680074 */        lw $t0, 0x74($v1)
  /* 144D08 80135728 44816000 */      mtc1 $at, $f12 # 20.0 to cop1
  /* 144D0C 8013572C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 144D10 80135730 C506005C */      lwc1 $f6, 0x5c($t0)
  /* 144D14 80135734 44811000 */      mtc1 $at, $f2 # 10.0 to cop1
  /* 144D18 80135738 E4460068 */      swc1 $f6, 0x68($v0)
  /* 144D1C 8013573C 8CA90074 */        lw $t1, 0x74($a1)
  /* 144D20 80135740 C5280058 */      lwc1 $f8, 0x58($t1)
  /* 144D24 80135744 460C4280 */     add.s $f10, $f8, $f12
  /* 144D28 80135748 E44A0064 */      swc1 $f10, 0x64($v0)
  /* 144D2C 8013574C C4500064 */      lwc1 $f16, 0x64($v0)
  /* 144D30 80135750 4610003C */    c.lt.s $f0, $f16
  /* 144D34 80135754 00000000 */       nop
  /* 144D38 80135758 45020004 */     bc1fl .L8013576C
  /* 144D3C 8013575C 8CAA0074 */        lw $t2, 0x74($a1)
  /* 144D40 80135760 E4400064 */      swc1 $f0, 0x64($v0)
  /* 144D44 80135764 8C450000 */        lw $a1, ($v0)
  /* 144D48 80135768 8CAA0074 */        lw $t2, 0x74($a1)
  .L8013576C:
  /* 144D4C 8013576C 3C01C170 */       lui $at, (0xC1700000 >> 16) # -15.0
  /* 144D50 80135770 44812000 */      mtc1 $at, $f4 # -15.0 to cop1
  /* 144D54 80135774 C552005C */      lwc1 $f18, 0x5c($t2)
  /* 144D58 80135778 46049180 */     add.s $f6, $f18, $f4
  /* 144D5C 8013577C E4460070 */      swc1 $f6, 0x70($v0)
  /* 144D60 80135780 C4400070 */      lwc1 $f0, 0x70($v0)
  /* 144D64 80135784 4602003C */    c.lt.s $f0, $f2
  /* 144D68 80135788 00000000 */       nop
  /* 144D6C 8013578C 45020004 */     bc1fl .L801357A0
  /* 144D70 80135790 C4420068 */      lwc1 $f2, 0x68($v0)
  /* 144D74 80135794 E4420070 */      swc1 $f2, 0x70($v0)
  /* 144D78 80135798 C4400070 */      lwc1 $f0, 0x70($v0)
  /* 144D7C 8013579C C4420068 */      lwc1 $f2, 0x68($v0)
  .L801357A0:
  /* 144D80 801357A0 4602003C */    c.lt.s $f0, $f2
  /* 144D84 801357A4 00000000 */       nop
  /* 144D88 801357A8 45020005 */     bc1fl .L801357C0
  /* 144D8C 801357AC 460C1281 */     sub.s $f10, $f2, $f12
  /* 144D90 801357B0 460C0201 */     sub.s $f8, $f0, $f12
  /* 144D94 801357B4 03E00008 */        jr $ra
  /* 144D98 801357B8 E448006C */      swc1 $f8, 0x6c($v0)

  /* 144D9C 801357BC 460C1281 */     sub.s $f10, $f2, $f12
  .L801357C0:
  /* 144DA0 801357C0 E44A006C */      swc1 $f10, 0x6c($v0)
  /* 144DA4 801357C4 03E00008 */        jr $ra
  /* 144DA8 801357C8 00000000 */       nop

glabel mnTrainingGoBackTo1PMenu
  /* 144DAC 801357CC 3C02800A */       lui $v0, %hi(gSceneData)
  /* 144DB0 801357D0 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 144DB4 801357D4 904E0000 */       lbu $t6, ($v0) # gSceneData + 0
  /* 144DB8 801357D8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 144DBC 801357DC AFBF0014 */        sw $ra, 0x14($sp)
  /* 144DC0 801357E0 240F0008 */     addiu $t7, $zero, 8
  /* 144DC4 801357E4 A04F0000 */        sb $t7, ($v0) # gSceneData + 0
  /* 144DC8 801357E8 0C04DD76 */       jal mnTrainingSaveMatchInfo
  /* 144DCC 801357EC A04E0001 */        sb $t6, 1($v0) # gSceneData + 1
  /* 144DD0 801357F0 0C00829D */       jal func_80020A74
  /* 144DD4 801357F4 00000000 */       nop
  /* 144DD8 801357F8 0C0099A8 */       jal func_800266A0
  /* 144DDC 801357FC 00000000 */       nop
  /* 144DE0 80135800 0C00171D */       jal func_80005C74
  /* 144DE4 80135804 00000000 */       nop
  /* 144DE8 80135808 8FBF0014 */        lw $ra, 0x14($sp)
  /* 144DEC 8013580C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 144DF0 80135810 03E00008 */        jr $ra
  /* 144DF4 80135814 00000000 */       nop

glabel mnTrainingExitIfBButtonPressed
  /* 144DF8 80135818 3C0E8014 */       lui $t6, %hi(gMNTrainingFramesElapsed)
  /* 144DFC 8013581C 8DCE888C */        lw $t6, %lo(gMNTrainingFramesElapsed)($t6)
  /* 144E00 80135820 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 144E04 80135824 AFBF0014 */        sw $ra, 0x14($sp)
  /* 144E08 80135828 29C1000A */      slti $at, $t6, 0xa
  /* 144E0C 8013582C 1420000B */      bnez $at, .L8013585C
  /* 144E10 80135830 00047880 */       sll $t7, $a0, 2
  /* 144E14 80135834 01E47821 */      addu $t7, $t7, $a0
  /* 144E18 80135838 000F7840 */       sll $t7, $t7, 1
  /* 144E1C 8013583C 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 144E20 80135840 030FC021 */      addu $t8, $t8, $t7
  /* 144E24 80135844 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 144E28 80135848 33194000 */      andi $t9, $t8, 0x4000
  /* 144E2C 8013584C 53200004 */      beql $t9, $zero, .L80135860
  /* 144E30 80135850 8FBF0014 */        lw $ra, 0x14($sp)
  /* 144E34 80135854 0C04D5F3 */       jal mnTrainingGoBackTo1PMenu
  /* 144E38 80135858 00000000 */       nop
  .L8013585C:
  /* 144E3C 8013585C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135860:
  /* 144E40 80135860 27BD0018 */     addiu $sp, $sp, 0x18
  /* 144E44 80135864 03E00008 */        jr $ra
  /* 144E48 80135868 00000000 */       nop

glabel mnTrainingCheckBackButtonPress
  /* 144E4C 8013586C 8C820074 */        lw $v0, 0x74($a0)
  /* 144E50 80135870 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 144E54 80135874 44813000 */      mtc1 $at, $f6 # 3.0 to cop1
  /* 144E58 80135878 C444005C */      lwc1 $f4, 0x5c($v0)
  /* 144E5C 8013587C 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 144E60 80135880 44814000 */      mtc1 $at, $f8 # 13.0 to cop1
  /* 144E64 80135884 46062000 */     add.s $f0, $f4, $f6
  /* 144E68 80135888 3C014208 */       lui $at, (0x42080000 >> 16) # 34.0
  /* 144E6C 8013588C 4608003C */    c.lt.s $f0, $f8
  /* 144E70 80135890 00000000 */       nop
  /* 144E74 80135894 45010007 */      bc1t .L801358B4
  /* 144E78 80135898 00000000 */       nop
  /* 144E7C 8013589C 44815000 */      mtc1 $at, $f10 # 34.0 to cop1
  /* 144E80 801358A0 00001825 */        or $v1, $zero, $zero
  /* 144E84 801358A4 4600503C */    c.lt.s $f10, $f0
  /* 144E88 801358A8 00000000 */       nop
  /* 144E8C 801358AC 45000003 */      bc1f .L801358BC
  /* 144E90 801358B0 00000000 */       nop
  .L801358B4:
  /* 144E94 801358B4 10000001 */         b .L801358BC
  /* 144E98 801358B8 24030001 */     addiu $v1, $zero, 1
  .L801358BC:
  /* 144E9C 801358BC 10600003 */      beqz $v1, .L801358CC
  /* 144EA0 801358C0 3C0141A0 */       lui $at, 0x41a0
  /* 144EA4 801358C4 03E00008 */        jr $ra
  /* 144EA8 801358C8 00001025 */        or $v0, $zero, $zero

  .L801358CC:
  /* 144EAC 801358CC C4500058 */      lwc1 $f16, 0x58($v0)
  /* 144EB0 801358D0 44819000 */      mtc1 $at, $f18
  /* 144EB4 801358D4 3C014374 */       lui $at, (0x43740000 >> 16) # 244.0
  /* 144EB8 801358D8 44812000 */      mtc1 $at, $f4 # 244.0 to cop1
  /* 144EBC 801358DC 46128000 */     add.s $f0, $f16, $f18
  /* 144EC0 801358E0 3C014392 */       lui $at, (0x43920000 >> 16) # 292.0
  /* 144EC4 801358E4 00001825 */        or $v1, $zero, $zero
  /* 144EC8 801358E8 00001025 */        or $v0, $zero, $zero
  /* 144ECC 801358EC 4600203E */    c.le.s $f4, $f0
  /* 144ED0 801358F0 00000000 */       nop
  /* 144ED4 801358F4 45000009 */      bc1f .L8013591C
  /* 144ED8 801358F8 00000000 */       nop
  /* 144EDC 801358FC 44813000 */      mtc1 $at, $f6 # 292.0 to cop1
  /* 144EE0 80135900 00000000 */       nop
  /* 144EE4 80135904 4606003E */    c.le.s $f0, $f6
  /* 144EE8 80135908 00000000 */       nop
  /* 144EEC 8013590C 45000003 */      bc1f .L8013591C
  /* 144EF0 80135910 00000000 */       nop
  /* 144EF4 80135914 10000001 */         b .L8013591C
  /* 144EF8 80135918 24030001 */     addiu $v1, $zero, 1
  .L8013591C:
  /* 144EFC 8013591C 10600003 */      beqz $v1, .L8013592C
  /* 144F00 80135920 00000000 */       nop
  /* 144F04 80135924 03E00008 */        jr $ra
  /* 144F08 80135928 24020001 */     addiu $v0, $zero, 1

  .L8013592C:
  /* 144F0C 8013592C 03E00008 */        jr $ra
  /* 144F10 80135930 00000000 */       nop

glabel mnTrainingHandleButtonPresses
  /* 144F14 80135934 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 144F18 80135938 AFBF001C */        sw $ra, 0x1c($sp)
  /* 144F1C 8013593C AFB00018 */        sw $s0, 0x18($sp)
  /* 144F20 80135940 8C900084 */        lw $s0, 0x84($a0)
  /* 144F24 80135944 AFA40040 */        sw $a0, 0x40($sp)
  /* 144F28 80135948 0C04D41D */       jal mnTrainingAutoPositionCursor
  /* 144F2C 8013594C 02002825 */        or $a1, $s0, $zero
  /* 144F30 80135950 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 144F34 80135954 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 144F38 80135958 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 144F3C 8013595C 00104080 */       sll $t0, $s0, 2
  /* 144F40 80135960 000E7880 */       sll $t7, $t6, 2
  /* 144F44 80135964 01EE7821 */      addu $t7, $t7, $t6
  /* 144F48 80135968 000F7840 */       sll $t7, $t7, 1
  /* 144F4C 8013596C 030FC021 */      addu $t8, $t8, $t7
  /* 144F50 80135970 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 144F54 80135974 01104023 */      subu $t0, $t0, $s0
  /* 144F58 80135978 8FA40040 */        lw $a0, 0x40($sp)
  /* 144F5C 8013597C 33198000 */      andi $t9, $t8, 0x8000
  /* 144F60 80135980 13200017 */      beqz $t9, .L801359E0
  /* 144F64 80135984 02002825 */        or $a1, $s0, $zero
  /* 144F68 80135988 000840C0 */       sll $t0, $t0, 3
  /* 144F6C 8013598C 01104023 */      subu $t0, $t0, $s0
  /* 144F70 80135990 000840C0 */       sll $t0, $t0, 3
  /* 144F74 80135994 3C068014 */       lui $a2, %hi(D_ovl28_801385D4)
  /* 144F78 80135998 00C83021 */      addu $a2, $a2, $t0
  /* 144F7C 8013599C 8CC685D4 */        lw $a2, %lo(D_ovl28_801385D4)($a2)
  /* 144F80 801359A0 0C04D212 */       jal mnTrainingSelectChar
  /* 144F84 801359A4 24070004 */     addiu $a3, $zero, 4
  /* 144F88 801359A8 1440000D */      bnez $v0, .L801359E0
  /* 144F8C 801359AC 8FA40040 */        lw $a0, 0x40($sp)
  /* 144F90 801359B0 0C04D363 */       jal mnTrainingCheckAndHandleTokenPickup
  /* 144F94 801359B4 02002825 */        or $a1, $s0, $zero
  /* 144F98 801359B8 5440000A */      bnel $v0, $zero, .L801359E4
  /* 144F9C 801359BC 00104880 */       sll $t1, $s0, 2
  /* 144FA0 801359C0 0C04D61B */       jal mnTrainingCheckBackButtonPress
  /* 144FA4 801359C4 8FA40040 */        lw $a0, 0x40($sp)
  /* 144FA8 801359C8 50400006 */      beql $v0, $zero, .L801359E4
  /* 144FAC 801359CC 00104880 */       sll $t1, $s0, 2
  /* 144FB0 801359D0 0C04D5F3 */       jal mnTrainingGoBackTo1PMenu
  /* 144FB4 801359D4 00000000 */       nop
  /* 144FB8 801359D8 0C009A70 */       jal func_800269C0
  /* 144FBC 801359DC 240400A4 */     addiu $a0, $zero, 0xa4
  .L801359E0:
  /* 144FC0 801359E0 00104880 */       sll $t1, $s0, 2
  .L801359E4:
  /* 144FC4 801359E4 01304823 */      subu $t1, $t1, $s0
  /* 144FC8 801359E8 000948C0 */       sll $t1, $t1, 3
  /* 144FCC 801359EC 3C0C8014 */       lui $t4, %hi(gMNTrainingDefaultCostumeOnly)
  /* 144FD0 801359F0 8D8C8868 */        lw $t4, %lo(gMNTrainingDefaultCostumeOnly)($t4)
  /* 144FD4 801359F4 01304823 */      subu $t1, $t1, $s0
  /* 144FD8 801359F8 3C0A8014 */       lui $t2, %hi(gMNTrainingPanels)
  /* 144FDC 801359FC 254A8558 */     addiu $t2, $t2, %lo(gMNTrainingPanels)
  /* 144FE0 80135A00 000948C0 */       sll $t1, $t1, 3
  /* 144FE4 80135A04 012A5821 */      addu $t3, $t1, $t2
  /* 144FE8 80135A08 15800061 */      bnez $t4, .L80135B90
  /* 144FEC 80135A0C AFAB0024 */        sw $t3, 0x24($sp)
  /* 144FF0 80135A10 3C0D8014 */       lui $t5, %hi(gMNTrainingHumanPanelPort)
  /* 144FF4 80135A14 8DAD8894 */        lw $t5, %lo(gMNTrainingHumanPanelPort)($t5)
  /* 144FF8 80135A18 3C0F8004 */       lui $t7, %hi(gPlayerControllers + 2)
  /* 144FFC 80135A1C 8FA40040 */        lw $a0, 0x40($sp)
  /* 145000 80135A20 000D7080 */       sll $t6, $t5, 2
  /* 145004 80135A24 01CD7021 */      addu $t6, $t6, $t5
  /* 145008 80135A28 000E7040 */       sll $t6, $t6, 1
  /* 14500C 80135A2C 01EE7821 */      addu $t7, $t7, $t6
  /* 145010 80135A30 95EF522A */       lhu $t7, %lo(gPlayerControllers + 2)($t7)
  /* 145014 80135A34 02002825 */        or $a1, $s0, $zero
  /* 145018 80135A38 00003825 */        or $a3, $zero, $zero
  /* 14501C 80135A3C 31F80008 */      andi $t8, $t7, 8
  /* 145020 80135A40 1300000B */      beqz $t8, .L80135A70
  /* 145024 80135A44 00000000 */       nop
  /* 145028 80135A48 0C04D212 */       jal mnTrainingSelectChar
  /* 14502C 80135A4C 8D66007C */        lw $a2, 0x7c($t3)
  /* 145030 80135A50 14400007 */      bnez $v0, .L80135A70
  /* 145034 80135A54 8FB90024 */        lw $t9, 0x24($sp)
  /* 145038 80135A58 8F280084 */        lw $t0, 0x84($t9)
  /* 14503C 80135A5C 02002025 */        or $a0, $s0, $zero
  /* 145040 80135A60 11000003 */      beqz $t0, .L80135A70
  /* 145044 80135A64 00000000 */       nop
  /* 145048 80135A68 0C04D578 */       jal mnTrainingTryCostumeChange
  /* 14504C 80135A6C 00002825 */        or $a1, $zero, $zero
  .L80135A70:
  /* 145050 80135A70 3C098014 */       lui $t1, %hi(gMNTrainingHumanPanelPort)
  /* 145054 80135A74 8D298894 */        lw $t1, %lo(gMNTrainingHumanPanelPort)($t1)
  /* 145058 80135A78 3C0C8004 */       lui $t4, %hi(gPlayerControllers + 2)
  /* 14505C 80135A7C 8FA40040 */        lw $a0, 0x40($sp)
  /* 145060 80135A80 00095080 */       sll $t2, $t1, 2
  /* 145064 80135A84 01495021 */      addu $t2, $t2, $t1
  /* 145068 80135A88 000A5040 */       sll $t2, $t2, 1
  /* 14506C 80135A8C 018A6021 */      addu $t4, $t4, $t2
  /* 145070 80135A90 958C522A */       lhu $t4, %lo(gPlayerControllers + 2)($t4)
  /* 145074 80135A94 02002825 */        or $a1, $s0, $zero
  /* 145078 80135A98 8FAE0024 */        lw $t6, 0x24($sp)
  /* 14507C 80135A9C 318D0001 */      andi $t5, $t4, 1
  /* 145080 80135AA0 11A0000B */      beqz $t5, .L80135AD0
  /* 145084 80135AA4 24070001 */     addiu $a3, $zero, 1
  /* 145088 80135AA8 0C04D212 */       jal mnTrainingSelectChar
  /* 14508C 80135AAC 8DC6007C */        lw $a2, 0x7c($t6)
  /* 145090 80135AB0 14400007 */      bnez $v0, .L80135AD0
  /* 145094 80135AB4 8FAF0024 */        lw $t7, 0x24($sp)
  /* 145098 80135AB8 8DF80084 */        lw $t8, 0x84($t7)
  /* 14509C 80135ABC 02002025 */        or $a0, $s0, $zero
  /* 1450A0 80135AC0 13000003 */      beqz $t8, .L80135AD0
  /* 1450A4 80135AC4 00000000 */       nop
  /* 1450A8 80135AC8 0C04D578 */       jal mnTrainingTryCostumeChange
  /* 1450AC 80135ACC 24050001 */     addiu $a1, $zero, 1
  .L80135AD0:
  /* 1450B0 80135AD0 3C0B8014 */       lui $t3, %hi(gMNTrainingHumanPanelPort)
  /* 1450B4 80135AD4 8D6B8894 */        lw $t3, %lo(gMNTrainingHumanPanelPort)($t3)
  /* 1450B8 80135AD8 3C088004 */       lui $t0, %hi(gPlayerControllers + 2)
  /* 1450BC 80135ADC 8FA40040 */        lw $a0, 0x40($sp)
  /* 1450C0 80135AE0 000BC880 */       sll $t9, $t3, 2
  /* 1450C4 80135AE4 032BC821 */      addu $t9, $t9, $t3
  /* 1450C8 80135AE8 0019C840 */       sll $t9, $t9, 1
  /* 1450CC 80135AEC 01194021 */      addu $t0, $t0, $t9
  /* 1450D0 80135AF0 9508522A */       lhu $t0, %lo(gPlayerControllers + 2)($t0)
  /* 1450D4 80135AF4 02002825 */        or $a1, $s0, $zero
  /* 1450D8 80135AF8 8FAA0024 */        lw $t2, 0x24($sp)
  /* 1450DC 80135AFC 31090004 */      andi $t1, $t0, 4
  /* 1450E0 80135B00 1120000B */      beqz $t1, .L80135B30
  /* 1450E4 80135B04 24070002 */     addiu $a3, $zero, 2
  /* 1450E8 80135B08 0C04D212 */       jal mnTrainingSelectChar
  /* 1450EC 80135B0C 8D46007C */        lw $a2, 0x7c($t2)
  /* 1450F0 80135B10 14400007 */      bnez $v0, .L80135B30
  /* 1450F4 80135B14 8FAC0024 */        lw $t4, 0x24($sp)
  /* 1450F8 80135B18 8D8D0084 */        lw $t5, 0x84($t4)
  /* 1450FC 80135B1C 02002025 */        or $a0, $s0, $zero
  /* 145100 80135B20 11A00003 */      beqz $t5, .L80135B30
  /* 145104 80135B24 00000000 */       nop
  /* 145108 80135B28 0C04D578 */       jal mnTrainingTryCostumeChange
  /* 14510C 80135B2C 24050002 */     addiu $a1, $zero, 2
  .L80135B30:
  /* 145110 80135B30 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 145114 80135B34 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 145118 80135B38 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 14511C 80135B3C 8FA40040 */        lw $a0, 0x40($sp)
  /* 145120 80135B40 000E7880 */       sll $t7, $t6, 2
  /* 145124 80135B44 01EE7821 */      addu $t7, $t7, $t6
  /* 145128 80135B48 000F7840 */       sll $t7, $t7, 1
  /* 14512C 80135B4C 030FC021 */      addu $t8, $t8, $t7
  /* 145130 80135B50 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 145134 80135B54 02002825 */        or $a1, $s0, $zero
  /* 145138 80135B58 8FB90024 */        lw $t9, 0x24($sp)
  /* 14513C 80135B5C 330B0002 */      andi $t3, $t8, 2
  /* 145140 80135B60 1160000B */      beqz $t3, .L80135B90
  /* 145144 80135B64 24070003 */     addiu $a3, $zero, 3
  /* 145148 80135B68 0C04D212 */       jal mnTrainingSelectChar
  /* 14514C 80135B6C 8F26007C */        lw $a2, 0x7c($t9)
  /* 145150 80135B70 14400007 */      bnez $v0, .L80135B90
  /* 145154 80135B74 8FA80024 */        lw $t0, 0x24($sp)
  /* 145158 80135B78 8D090084 */        lw $t1, 0x84($t0)
  /* 14515C 80135B7C 02002025 */        or $a0, $s0, $zero
  /* 145160 80135B80 11200003 */      beqz $t1, .L80135B90
  /* 145164 80135B84 00000000 */       nop
  /* 145168 80135B88 0C04D578 */       jal mnTrainingTryCostumeChange
  /* 14516C 80135B8C 24050003 */     addiu $a1, $zero, 3
  .L80135B90:
  /* 145170 80135B90 3C0A8014 */       lui $t2, %hi(gMNTrainingHumanPanelPort)
  /* 145174 80135B94 8D4A8894 */        lw $t2, %lo(gMNTrainingHumanPanelPort)($t2)
  /* 145178 80135B98 3C0D8004 */       lui $t5, %hi(gPlayerControllers + 2)
  /* 14517C 80135B9C 000A6080 */       sll $t4, $t2, 2
  /* 145180 80135BA0 018A6021 */      addu $t4, $t4, $t2
  /* 145184 80135BA4 000C6040 */       sll $t4, $t4, 1
  /* 145188 80135BA8 01AC6821 */      addu $t5, $t5, $t4
  /* 14518C 80135BAC 95AD522A */       lhu $t5, %lo(gPlayerControllers + 2)($t5)
  /* 145190 80135BB0 31AE4000 */      andi $t6, $t5, 0x4000
  /* 145194 80135BB4 51C00008 */      beql $t6, $zero, .L80135BD8
  /* 145198 80135BB8 8FAF0024 */        lw $t7, 0x24($sp)
  /* 14519C 80135BBC 0C04D59D */       jal mnTrainingIsHumanWithCharacterSelected
  /* 1451A0 80135BC0 02002025 */        or $a0, $s0, $zero
  /* 1451A4 80135BC4 50400004 */      beql $v0, $zero, .L80135BD8
  /* 1451A8 80135BC8 8FAF0024 */        lw $t7, 0x24($sp)
  /* 1451AC 80135BCC 0C04D5B4 */       jal mnTrainingRecallToken
  /* 1451B0 80135BD0 02002025 */        or $a0, $s0, $zero
  /* 1451B4 80135BD4 8FAF0024 */        lw $t7, 0x24($sp)
  .L80135BD8:
  /* 1451B8 80135BD8 8DE20058 */        lw $v0, 0x58($t7)
  /* 1451BC 80135BDC 14400005 */      bnez $v0, .L80135BF4
  /* 1451C0 80135BE0 00000000 */       nop
  /* 1451C4 80135BE4 0C04D606 */       jal mnTrainingExitIfBButtonPressed
  /* 1451C8 80135BE8 02002025 */        or $a0, $s0, $zero
  /* 1451CC 80135BEC 8FB80024 */        lw $t8, 0x24($sp)
  /* 1451D0 80135BF0 8F020058 */        lw $v0, 0x58($t8)
  .L80135BF4:
  /* 1451D4 80135BF4 14400003 */      bnez $v0, .L80135C04
  /* 1451D8 80135BF8 8FA40040 */        lw $a0, 0x40($sp)
  /* 1451DC 80135BFC 0C04D50C */       jal mnTrainingSyncCursorDisplay
  /* 1451E0 80135C00 02002825 */        or $a1, $s0, $zero
  .L80135C04:
  /* 1451E4 80135C04 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1451E8 80135C08 8FB00018 */        lw $s0, 0x18($sp)
  /* 1451EC 80135C0C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1451F0 80135C10 03E00008 */        jr $ra
  /* 1451F4 80135C14 00000000 */       nop

glabel mnTrainingRedrawToken
  /* 1451F8 80135C18 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1451FC 80135C1C 3C0F8014 */       lui $t7, %hi(dMNTrainingTokenOffsets)
  /* 145200 80135C20 AFBF0014 */        sw $ra, 0x14($sp)
  /* 145204 80135C24 AFA50044 */        sw $a1, 0x44($sp)
  /* 145208 80135C28 25EF8398 */     addiu $t7, $t7, %lo(dMNTrainingTokenOffsets)
  /* 14520C 80135C2C 8DF90000 */        lw $t9, ($t7) # dMNTrainingTokenOffsets + 0
  /* 145210 80135C30 27AE0020 */     addiu $t6, $sp, 0x20
  /* 145214 80135C34 8DF80004 */        lw $t8, 4($t7) # dMNTrainingTokenOffsets + 4
  /* 145218 80135C38 ADD90000 */        sw $t9, ($t6)
  /* 14521C 80135C3C 8DF90008 */        lw $t9, 8($t7) # dMNTrainingTokenOffsets + 8
  /* 145220 80135C40 ADD80004 */        sw $t8, 4($t6)
  /* 145224 80135C44 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingTokenOffsets + 12
  /* 145228 80135C48 ADD90008 */        sw $t9, 8($t6)
  /* 14522C 80135C4C 8DF90010 */        lw $t9, 0x10($t7) # dMNTrainingTokenOffsets + 16
  /* 145230 80135C50 ADD8000C */        sw $t8, 0xc($t6)
  /* 145234 80135C54 ADD90010 */        sw $t9, 0x10($t6)
  /* 145238 80135C58 8C820074 */        lw $v0, 0x74($a0)
  /* 14523C 80135C5C C4440058 */      lwc1 $f4, 0x58($v0)
  /* 145240 80135C60 E7A40038 */      swc1 $f4, 0x38($sp)
  /* 145244 80135C64 C446005C */      lwc1 $f6, 0x5c($v0)
  /* 145248 80135C68 AFA40040 */        sw $a0, 0x40($sp)
  /* 14524C 80135C6C 0C002DD8 */       jal func_8000B760
  /* 145250 80135C70 E7A60034 */      swc1 $f6, 0x34($sp)
  /* 145254 80135C74 8FA80044 */        lw $t0, 0x44($sp)
  /* 145258 80135C78 3C0B8014 */       lui $t3, %hi(D_ovl28_80138C98)
  /* 14525C 80135C7C 8D6B8C98 */        lw $t3, %lo(D_ovl28_80138C98)($t3)
  /* 145260 80135C80 00084880 */       sll $t1, $t0, 2
  /* 145264 80135C84 03A95021 */      addu $t2, $sp, $t1
  /* 145268 80135C88 8D4A0020 */        lw $t2, 0x20($t2)
  /* 14526C 80135C8C 8FA40040 */        lw $a0, 0x40($sp)
  /* 145270 80135C90 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 145274 80135C94 014B2821 */      addu $a1, $t2, $t3
  /* 145278 80135C98 C7A80038 */      lwc1 $f8, 0x38($sp)
  /* 14527C 80135C9C 944C0024 */       lhu $t4, 0x24($v0)
  /* 145280 80135CA0 E4480058 */      swc1 $f8, 0x58($v0)
  /* 145284 80135CA4 C7AA0034 */      lwc1 $f10, 0x34($sp)
  /* 145288 80135CA8 318EFFDF */      andi $t6, $t4, 0xffdf
  /* 14528C 80135CAC A44E0024 */        sh $t6, 0x24($v0)
  /* 145290 80135CB0 35CF0001 */       ori $t7, $t6, 1
  /* 145294 80135CB4 A44F0024 */        sh $t7, 0x24($v0)
  /* 145298 80135CB8 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 14529C 80135CBC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1452A0 80135CC0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1452A4 80135CC4 03E00008 */        jr $ra
  /* 1452A8 80135CC8 00000000 */       nop

glabel mnTrainingCenterTokenInPortrait
  /* 1452AC 80135CCC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1452B0 80135CD0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1452B4 80135CD4 00803025 */        or $a2, $a0, $zero
  /* 1452B8 80135CD8 AFA60018 */        sw $a2, 0x18($sp)
  /* 1452BC 80135CDC 0C04C808 */       jal mnTrainingGetPortraitId
  /* 1452C0 80135CE0 00A02025 */        or $a0, $a1, $zero
  /* 1452C4 80135CE4 28410006 */      slti $at, $v0, 6
  /* 1452C8 80135CE8 14200011 */      bnez $at, .L80135D30
  /* 1452CC 80135CEC 8FA60018 */        lw $a2, 0x18($sp)
  /* 1452D0 80135CF0 00027080 */       sll $t6, $v0, 2
  /* 1452D4 80135CF4 01C27023 */      subu $t6, $t6, $v0
  /* 1452D8 80135CF8 000E7080 */       sll $t6, $t6, 2
  /* 1452DC 80135CFC 01C27023 */      subu $t6, $t6, $v0
  /* 1452E0 80135D00 000E7080 */       sll $t6, $t6, 2
  /* 1452E4 80135D04 01C27021 */      addu $t6, $t6, $v0
  /* 1452E8 80135D08 25CFFF16 */     addiu $t7, $t6, -0xea
  /* 1452EC 80135D0C 448F2000 */      mtc1 $t7, $f4
  /* 1452F0 80135D10 8CD80074 */        lw $t8, 0x74($a2)
  /* 1452F4 80135D14 3C0142B2 */       lui $at, (0x42B20000 >> 16) # 89.0
  /* 1452F8 80135D18 468021A0 */   cvt.s.w $f6, $f4
  /* 1452FC 80135D1C 44814000 */      mtc1 $at, $f8 # 89.0 to cop1
  /* 145300 80135D20 E7060058 */      swc1 $f6, 0x58($t8)
  /* 145304 80135D24 8CD90074 */        lw $t9, 0x74($a2)
  /* 145308 80135D28 10000010 */         b .L80135D6C
  /* 14530C 80135D2C E728005C */      swc1 $f8, 0x5c($t9)
  .L80135D30:
  /* 145310 80135D30 00024080 */       sll $t0, $v0, 2
  /* 145314 80135D34 01024023 */      subu $t0, $t0, $v0
  /* 145318 80135D38 00084080 */       sll $t0, $t0, 2
  /* 14531C 80135D3C 01024023 */      subu $t0, $t0, $v0
  /* 145320 80135D40 00084080 */       sll $t0, $t0, 2
  /* 145324 80135D44 01024021 */      addu $t0, $t0, $v0
  /* 145328 80135D48 25090024 */     addiu $t1, $t0, 0x24
  /* 14532C 80135D4C 44895000 */      mtc1 $t1, $f10
  /* 145330 80135D50 8CCA0074 */        lw $t2, 0x74($a2)
  /* 145334 80135D54 3C014238 */       lui $at, (0x42380000 >> 16) # 46.0
  /* 145338 80135D58 46805420 */   cvt.s.w $f16, $f10
  /* 14533C 80135D5C 44819000 */      mtc1 $at, $f18 # 46.0 to cop1
  /* 145340 80135D60 E5500058 */      swc1 $f16, 0x58($t2)
  /* 145344 80135D64 8CCB0074 */        lw $t3, 0x74($a2)
  /* 145348 80135D68 E572005C */      swc1 $f18, 0x5c($t3)
  .L80135D6C:
  /* 14534C 80135D6C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145350 80135D70 27BD0018 */     addiu $sp, $sp, 0x18
  /* 145354 80135D74 03E00008 */        jr $ra
  /* 145358 80135D78 00000000 */       nop

  /* 14535C 80135D7C 03E00008 */        jr $ra
  /* 145360 80135D80 00000000 */       nop

glabel mnTrainingMoveToken
  /* 145364 80135D84 00047080 */       sll $t6, $a0, 2
  /* 145368 80135D88 01C47023 */      subu $t6, $t6, $a0
  /* 14536C 80135D8C 000E70C0 */       sll $t6, $t6, 3
  /* 145370 80135D90 01C47023 */      subu $t6, $t6, $a0
  /* 145374 80135D94 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 145378 80135D98 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 14537C 80135D9C 000E70C0 */       sll $t6, $t6, 3
  /* 145380 80135DA0 01CF1021 */      addu $v0, $t6, $t7
  /* 145384 80135DA4 8C580004 */        lw $t8, 4($v0)
  /* 145388 80135DA8 C446008C */      lwc1 $f6, 0x8c($v0)
  /* 14538C 80135DAC 8F030074 */        lw $v1, 0x74($t8)
  /* 145390 80135DB0 C4640058 */      lwc1 $f4, 0x58($v1)
  /* 145394 80135DB4 46062200 */     add.s $f8, $f4, $f6
  /* 145398 80135DB8 E4680058 */      swc1 $f8, 0x58($v1)
  /* 14539C 80135DBC 8C590004 */        lw $t9, 4($v0)
  /* 1453A0 80135DC0 C4500090 */      lwc1 $f16, 0x90($v0)
  /* 1453A4 80135DC4 8F230074 */        lw $v1, 0x74($t9)
  /* 1453A8 80135DC8 C46A005C */      lwc1 $f10, 0x5c($v1)
  /* 1453AC 80135DCC 46105480 */     add.s $f18, $f10, $f16
  /* 1453B0 80135DD0 03E00008 */        jr $ra
  /* 1453B4 80135DD4 E472005C */      swc1 $f18, 0x5c($v1)

glabel mnTrainingSyncTokenAndFighter
  /* 1453B8 80135DD8 3C0E8014 */       lui $t6, %hi(gMNTrainingFramesElapsed)
  /* 1453BC 80135DDC 8DCE888C */        lw $t6, %lo(gMNTrainingFramesElapsed)($t6)
  /* 1453C0 80135DE0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1453C4 80135DE4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1453C8 80135DE8 29C1001E */      slti $at, $t6, 0x1e
  /* 1453CC 80135DEC 00802825 */        or $a1, $a0, $zero
  /* 1453D0 80135DF0 1020000F */      beqz $at, .L80135E30
  /* 1453D4 80135DF4 8C860084 */        lw $a2, 0x84($a0)
  /* 1453D8 80135DF8 0006C080 */       sll $t8, $a2, 2
  /* 1453DC 80135DFC 0306C023 */      subu $t8, $t8, $a2
  /* 1453E0 80135E00 0018C0C0 */       sll $t8, $t8, 3
  /* 1453E4 80135E04 0306C023 */      subu $t8, $t8, $a2
  /* 1453E8 80135E08 3C198014 */       lui $t9, %hi(gMNTrainingPanels)
  /* 1453EC 80135E0C 27398558 */     addiu $t9, $t9, %lo(gMNTrainingPanels)
  /* 1453F0 80135E10 0018C0C0 */       sll $t8, $t8, 3
  /* 1453F4 80135E14 240F0001 */     addiu $t7, $zero, 1
  /* 1453F8 80135E18 3C078014 */       lui $a3, %hi(gMNTrainingPanels)
  /* 1453FC 80135E1C 24E78558 */     addiu $a3, $a3, %lo(gMNTrainingPanels)
  /* 145400 80135E20 AC8F007C */        sw $t7, 0x7c($a0)
  /* 145404 80135E24 03191821 */      addu $v1, $t8, $t9
  /* 145408 80135E28 1000001B */         b .L80135E98
  /* 14540C 80135E2C 240800B8 */     addiu $t0, $zero, 0xb8
  .L80135E30:
  /* 145410 80135E30 240800B8 */     addiu $t0, $zero, 0xb8
  /* 145414 80135E34 00C80019 */     multu $a2, $t0
  /* 145418 80135E38 3C078014 */       lui $a3, %hi(gMNTrainingPanels)
  /* 14541C 80135E3C 24E78558 */     addiu $a3, $a3, %lo(gMNTrainingPanels)
  /* 145420 80135E40 24010001 */     addiu $at, $zero, 1
  /* 145424 80135E44 00004812 */      mflo $t1
  /* 145428 80135E48 00E91821 */      addu $v1, $a3, $t1
  /* 14542C 80135E4C 8C620080 */        lw $v0, 0x80($v1)
  /* 145430 80135E50 1041000E */       beq $v0, $at, .L80135E8C
  /* 145434 80135E54 00000000 */       nop
  /* 145438 80135E58 1440000E */      bnez $v0, .L80135E94
  /* 14543C 80135E5C 240D0001 */     addiu $t5, $zero, 1
  /* 145440 80135E60 8C6A0050 */        lw $t2, 0x50($v1)
  /* 145444 80135E64 15400009 */      bnez $t2, .L80135E8C
  /* 145448 80135E68 00000000 */       nop
  /* 14544C 80135E6C 8C6B0054 */        lw $t3, 0x54($v1)
  /* 145450 80135E70 24010001 */     addiu $at, $zero, 1
  /* 145454 80135E74 11610005 */       beq $t3, $at, .L80135E8C
  /* 145458 80135E78 00000000 */       nop
  /* 14545C 80135E7C 8C6C0058 */        lw $t4, 0x58($v1)
  /* 145460 80135E80 24010001 */     addiu $at, $zero, 1
  /* 145464 80135E84 55810004 */      bnel $t4, $at, .L80135E98
  /* 145468 80135E88 ACAD007C */        sw $t5, 0x7c($a1)
  .L80135E8C:
  /* 14546C 80135E8C 10000002 */         b .L80135E98
  /* 145470 80135E90 ACA0007C */        sw $zero, 0x7c($a1)
  .L80135E94:
  /* 145474 80135E94 ACAD007C */        sw $t5, 0x7c($a1)
  .L80135E98:
  /* 145478 80135E98 8C6E0080 */        lw $t6, 0x80($v1)
  /* 14547C 80135E9C 24010002 */     addiu $at, $zero, 2
  /* 145480 80135EA0 51C1004E */      beql $t6, $at, .L80135FDC
  /* 145484 80135EA4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145488 80135EA8 8C6F0054 */        lw $t7, 0x54($v1)
  /* 14548C 80135EAC 55E00022 */      bnel $t7, $zero, .L80135F38
  /* 145490 80135EB0 00C02025 */        or $a0, $a2, $zero
  /* 145494 80135EB4 8C640078 */        lw $a0, 0x78($v1)
  /* 145498 80135EB8 24010004 */     addiu $at, $zero, 4
  /* 14549C 80135EBC 5081001E */      beql $a0, $at, .L80135F38
  /* 1454A0 80135EC0 00C02025 */        or $a0, $a2, $zero
  /* 1454A4 80135EC4 00880019 */     multu $a0, $t0
  /* 1454A8 80135EC8 0000C012 */      mflo $t8
  /* 1454AC 80135ECC 00F81021 */      addu $v0, $a3, $t8
  /* 1454B0 80135ED0 8C59009C */        lw $t9, 0x9c($v0)
  /* 1454B4 80135ED4 17200015 */      bnez $t9, .L80135F2C
  /* 1454B8 80135ED8 00000000 */       nop
  /* 1454BC 80135EDC 8C490000 */        lw $t1, ($v0)
  /* 1454C0 80135EE0 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 1454C4 80135EE4 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 1454C8 80135EE8 8D2A0074 */        lw $t2, 0x74($t1)
  /* 1454CC 80135EEC 8CAB0074 */        lw $t3, 0x74($a1)
  /* 1454D0 80135EF0 3C01C160 */       lui $at, (0xC1600000 >> 16) # -14.0
  /* 1454D4 80135EF4 C5440058 */      lwc1 $f4, 0x58($t2)
  /* 1454D8 80135EF8 44818000 */      mtc1 $at, $f16 # -14.0 to cop1
  /* 1454DC 80135EFC 46062200 */     add.s $f8, $f4, $f6
  /* 1454E0 80135F00 E5680058 */      swc1 $f8, 0x58($t3)
  /* 1454E4 80135F04 8C6C0078 */        lw $t4, 0x78($v1)
  /* 1454E8 80135F08 8CB90074 */        lw $t9, 0x74($a1)
  /* 1454EC 80135F0C 01880019 */     multu $t4, $t0
  /* 1454F0 80135F10 00006812 */      mflo $t5
  /* 1454F4 80135F14 00ED7021 */      addu $t6, $a3, $t5
  /* 1454F8 80135F18 8DCF0000 */        lw $t7, ($t6)
  /* 1454FC 80135F1C 8DF80074 */        lw $t8, 0x74($t7)
  /* 145500 80135F20 C70A005C */      lwc1 $f10, 0x5c($t8)
  /* 145504 80135F24 46105480 */     add.s $f18, $f10, $f16
  /* 145508 80135F28 E732005C */      swc1 $f18, 0x5c($t9)
  .L80135F2C:
  /* 14550C 80135F2C 10000006 */         b .L80135F48
  /* 145510 80135F30 AFA60020 */        sw $a2, 0x20($sp)
  /* 145514 80135F34 00C02025 */        or $a0, $a2, $zero
  .L80135F38:
  /* 145518 80135F38 AFA3001C */        sw $v1, 0x1c($sp)
  /* 14551C 80135F3C 0C04D761 */       jal mnTrainingMoveToken
  /* 145520 80135F40 AFA60020 */        sw $a2, 0x20($sp)
  /* 145524 80135F44 8FA3001C */        lw $v1, 0x1c($sp)
  .L80135F48:
  /* 145528 80135F48 8FA40020 */        lw $a0, 0x20($sp)
  /* 14552C 80135F4C 0C04D3BA */       jal mnTrainingGetFtKindFromTokenPosition
  /* 145530 80135F50 AFA3001C */        sw $v1, 0x1c($sp)
  /* 145534 80135F54 8FA3001C */        lw $v1, 0x1c($sp)
  /* 145538 80135F58 24010001 */     addiu $at, $zero, 1
  /* 14553C 80135F5C 00403025 */        or $a2, $v0, $zero
  /* 145540 80135F60 8C690080 */        lw $t1, 0x80($v1)
  /* 145544 80135F64 55210012 */      bnel $t1, $at, .L80135FB0
  /* 145548 80135F68 8C6B0054 */        lw $t3, 0x54($v1)
  /* 14554C 80135F6C 8C6A0048 */        lw $t2, 0x48($v1)
  /* 145550 80135F70 2401001C */     addiu $at, $zero, 0x1c
  /* 145554 80135F74 504A000E */      beql $v0, $t2, .L80135FB0
  /* 145558 80135F78 8C6B0054 */        lw $t3, 0x54($v1)
  /* 14555C 80135F7C 5441000C */      bnel $v0, $at, .L80135FB0
  /* 145560 80135F80 8C6B0054 */        lw $t3, 0x54($v1)
  /* 145564 80135F84 8C640078 */        lw $a0, 0x78($v1)
  /* 145568 80135F88 24010004 */     addiu $at, $zero, 4
  /* 14556C 80135F8C 24050004 */     addiu $a1, $zero, 4
  /* 145570 80135F90 50810007 */      beql $a0, $at, .L80135FB0
  /* 145574 80135F94 8C6B0054 */        lw $t3, 0x54($v1)
  /* 145578 80135F98 AFA3001C */        sw $v1, 0x1c($sp)
  /* 14557C 80135F9C 0C04C6D6 */       jal mnTrainingSelectCharWithToken
  /* 145580 80135FA0 AFA20024 */        sw $v0, 0x24($sp)
  /* 145584 80135FA4 8FA3001C */        lw $v1, 0x1c($sp)
  /* 145588 80135FA8 8FA60024 */        lw $a2, 0x24($sp)
  /* 14558C 80135FAC 8C6B0054 */        lw $t3, 0x54($v1)
  .L80135FB0:
  /* 145590 80135FB0 5560000A */      bnel $t3, $zero, .L80135FDC
  /* 145594 80135FB4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145598 80135FB8 8C6C0048 */        lw $t4, 0x48($v1)
  /* 14559C 80135FBC 50CC0007 */      beql $a2, $t4, .L80135FDC
  /* 1455A0 80135FC0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1455A4 80135FC4 AC660048 */        sw $a2, 0x48($v1)
  /* 1455A8 80135FC8 0C04CF8C */       jal mnTrainingSyncFighterDisplay
  /* 1455AC 80135FCC 8FA40020 */        lw $a0, 0x20($sp)
  /* 1455B0 80135FD0 0C04CFB8 */       jal mnTrainingSyncNameAndLogo
  /* 1455B4 80135FD4 8FA40020 */        lw $a0, 0x20($sp)
  /* 1455B8 80135FD8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80135FDC:
  /* 1455BC 80135FDC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1455C0 80135FE0 03E00008 */        jr $ra
  /* 1455C4 80135FE4 00000000 */       nop

glabel mnTrainingCreateCursorViewport
  /* 1455C8 80135FE8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1455CC 80135FEC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1455D0 80135FF0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1455D4 80135FF4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1455D8 80135FF8 240F0014 */     addiu $t7, $zero, 0x14
  /* 1455DC 80135FFC 24180001 */     addiu $t8, $zero, 1
  /* 1455E0 80136000 24190000 */     addiu $t9, $zero, 0
  /* 1455E4 80136004 2408FFFF */     addiu $t0, $zero, -1
  /* 1455E8 80136008 24090001 */     addiu $t1, $zero, 1
  /* 1455EC 8013600C 240A0001 */     addiu $t2, $zero, 1
  /* 1455F0 80136010 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1455F4 80136014 AFA90028 */        sw $t1, 0x28($sp)
  /* 1455F8 80136018 AFA80020 */        sw $t0, 0x20($sp)
  /* 1455FC 8013601C AFB9001C */        sw $t9, 0x1c($sp)
  /* 145600 80136020 AFB80018 */        sw $t8, 0x18($sp)
  /* 145604 80136024 AFAF0014 */        sw $t7, 0x14($sp)
  /* 145608 80136028 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14560C 8013602C AFA00024 */        sw $zero, 0x24($sp)
  /* 145610 80136030 AFA0002C */        sw $zero, 0x2c($sp)
  /* 145614 80136034 AFA00034 */        sw $zero, 0x34($sp)
  /* 145618 80136038 24040401 */     addiu $a0, $zero, 0x401
  /* 14561C 8013603C 00002825 */        or $a1, $zero, $zero
  /* 145620 80136040 24060010 */     addiu $a2, $zero, 0x10
  /* 145624 80136044 0C002E4F */       jal func_8000B93C
  /* 145628 80136048 3C078000 */       lui $a3, 0x8000
  /* 14562C 8013604C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145630 80136050 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 145634 80136054 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 145638 80136058 8C430074 */        lw $v1, 0x74($v0)
  /* 14563C 8013605C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 145640 80136060 44050000 */      mfc1 $a1, $f0
  /* 145644 80136064 44060000 */      mfc1 $a2, $f0
  /* 145648 80136068 3C07439B */       lui $a3, 0x439b
  /* 14564C 8013606C 24640008 */     addiu $a0, $v1, 8
  /* 145650 80136070 0C001C20 */       jal func_80007080
  /* 145654 80136074 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 145658 80136078 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14565C 8013607C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 145660 80136080 03E00008 */        jr $ra
  /* 145664 80136084 00000000 */       nop

glabel mnTrainingCreateDroppedTokenViewport
  /* 145668 80136088 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14566C 8013608C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 145670 80136090 AFBF003C */        sw $ra, 0x3c($sp)
  /* 145674 80136094 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 145678 80136098 240F0019 */     addiu $t7, $zero, 0x19
  /* 14567C 8013609C 24180002 */     addiu $t8, $zero, 2
  /* 145680 801360A0 24190000 */     addiu $t9, $zero, 0
  /* 145684 801360A4 2408FFFF */     addiu $t0, $zero, -1
  /* 145688 801360A8 24090001 */     addiu $t1, $zero, 1
  /* 14568C 801360AC 240A0001 */     addiu $t2, $zero, 1
  /* 145690 801360B0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 145694 801360B4 AFA90028 */        sw $t1, 0x28($sp)
  /* 145698 801360B8 AFA80020 */        sw $t0, 0x20($sp)
  /* 14569C 801360BC AFB9001C */        sw $t9, 0x1c($sp)
  /* 1456A0 801360C0 AFB80018 */        sw $t8, 0x18($sp)
  /* 1456A4 801360C4 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1456A8 801360C8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1456AC 801360CC AFA00024 */        sw $zero, 0x24($sp)
  /* 1456B0 801360D0 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1456B4 801360D4 AFA00034 */        sw $zero, 0x34($sp)
  /* 1456B8 801360D8 24040401 */     addiu $a0, $zero, 0x401
  /* 1456BC 801360DC 00002825 */        or $a1, $zero, $zero
  /* 1456C0 801360E0 24060010 */     addiu $a2, $zero, 0x10
  /* 1456C4 801360E4 0C002E4F */       jal func_8000B93C
  /* 1456C8 801360E8 3C078000 */       lui $a3, 0x8000
  /* 1456CC 801360EC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1456D0 801360F0 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1456D4 801360F4 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1456D8 801360F8 8C430074 */        lw $v1, 0x74($v0)
  /* 1456DC 801360FC 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1456E0 80136100 44050000 */      mfc1 $a1, $f0
  /* 1456E4 80136104 44060000 */      mfc1 $a2, $f0
  /* 1456E8 80136108 3C07439B */       lui $a3, 0x439b
  /* 1456EC 8013610C 24640008 */     addiu $a0, $v1, 8
  /* 1456F0 80136110 0C001C20 */       jal func_80007080
  /* 1456F4 80136114 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1456F8 80136118 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1456FC 8013611C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 145700 80136120 03E00008 */        jr $ra
  /* 145704 80136124 00000000 */       nop

glabel mnTrainingCreateHandicapCPULevelViewport
  /* 145708 80136128 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 14570C 8013612C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 145710 80136130 AFBF003C */        sw $ra, 0x3c($sp)
  /* 145714 80136134 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 145718 80136138 240F002B */     addiu $t7, $zero, 0x2b
  /* 14571C 8013613C 24180008 */     addiu $t8, $zero, 8
  /* 145720 80136140 24190000 */     addiu $t9, $zero, 0
  /* 145724 80136144 2408FFFF */     addiu $t0, $zero, -1
  /* 145728 80136148 24090001 */     addiu $t1, $zero, 1
  /* 14572C 8013614C 240A0001 */     addiu $t2, $zero, 1
  /* 145730 80136150 AFAA0030 */        sw $t2, 0x30($sp)
  /* 145734 80136154 AFA90028 */        sw $t1, 0x28($sp)
  /* 145738 80136158 AFA80020 */        sw $t0, 0x20($sp)
  /* 14573C 8013615C AFB9001C */        sw $t9, 0x1c($sp)
  /* 145740 80136160 AFB80018 */        sw $t8, 0x18($sp)
  /* 145744 80136164 AFAF0014 */        sw $t7, 0x14($sp)
  /* 145748 80136168 AFAE0010 */        sw $t6, 0x10($sp)
  /* 14574C 8013616C AFA00024 */        sw $zero, 0x24($sp)
  /* 145750 80136170 AFA0002C */        sw $zero, 0x2c($sp)
  /* 145754 80136174 AFA00034 */        sw $zero, 0x34($sp)
  /* 145758 80136178 24040401 */     addiu $a0, $zero, 0x401
  /* 14575C 8013617C 00002825 */        or $a1, $zero, $zero
  /* 145760 80136180 24060010 */     addiu $a2, $zero, 0x10
  /* 145764 80136184 0C002E4F */       jal func_8000B93C
  /* 145768 80136188 3C078000 */       lui $a3, 0x8000
  /* 14576C 8013618C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145770 80136190 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 145774 80136194 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 145778 80136198 8C430074 */        lw $v1, 0x74($v0)
  /* 14577C 8013619C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 145780 801361A0 44050000 */      mfc1 $a1, $f0
  /* 145784 801361A4 44060000 */      mfc1 $a2, $f0
  /* 145788 801361A8 3C07439B */       lui $a3, 0x439b
  /* 14578C 801361AC 24640008 */     addiu $a0, $v1, 8
  /* 145790 801361B0 0C001C20 */       jal func_80007080
  /* 145794 801361B4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 145798 801361B8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14579C 801361BC 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1457A0 801361C0 03E00008 */        jr $ra
  /* 1457A4 801361C4 00000000 */       nop

glabel mnTrainingCreateReadyToFightViewport
  /* 1457A8 801361C8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1457AC 801361CC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1457B0 801361D0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1457B4 801361D4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1457B8 801361D8 240F000A */     addiu $t7, $zero, 0xa
  /* 1457BC 801361DC 24180040 */     addiu $t8, $zero, 0x40
  /* 1457C0 801361E0 24190000 */     addiu $t9, $zero, 0
  /* 1457C4 801361E4 2408FFFF */     addiu $t0, $zero, -1
  /* 1457C8 801361E8 24090001 */     addiu $t1, $zero, 1
  /* 1457CC 801361EC 240A0001 */     addiu $t2, $zero, 1
  /* 1457D0 801361F0 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1457D4 801361F4 AFA90028 */        sw $t1, 0x28($sp)
  /* 1457D8 801361F8 AFA80020 */        sw $t0, 0x20($sp)
  /* 1457DC 801361FC AFB9001C */        sw $t9, 0x1c($sp)
  /* 1457E0 80136200 AFB80018 */        sw $t8, 0x18($sp)
  /* 1457E4 80136204 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1457E8 80136208 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1457EC 8013620C AFA00024 */        sw $zero, 0x24($sp)
  /* 1457F0 80136210 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1457F4 80136214 AFA00034 */        sw $zero, 0x34($sp)
  /* 1457F8 80136218 24040401 */     addiu $a0, $zero, 0x401
  /* 1457FC 8013621C 00002825 */        or $a1, $zero, $zero
  /* 145800 80136220 24060010 */     addiu $a2, $zero, 0x10
  /* 145804 80136224 0C002E4F */       jal func_8000B93C
  /* 145808 80136228 3C078000 */       lui $a3, 0x8000
  /* 14580C 8013622C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145810 80136230 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 145814 80136234 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 145818 80136238 8C430074 */        lw $v1, 0x74($v0)
  /* 14581C 8013623C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 145820 80136240 44050000 */      mfc1 $a1, $f0
  /* 145824 80136244 44060000 */      mfc1 $a2, $f0
  /* 145828 80136248 3C07439B */       lui $a3, 0x439b
  /* 14582C 8013624C 24640008 */     addiu $a0, $v1, 8
  /* 145830 80136250 0C001C20 */       jal func_80007080
  /* 145834 80136254 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 145838 80136258 8FBF003C */        lw $ra, 0x3c($sp)
  /* 14583C 8013625C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 145840 80136260 03E00008 */        jr $ra
  /* 145844 80136264 00000000 */       nop

glabel mnTrainingCreateCursor
  /* 145848 80136268 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 14584C 8013626C 3C0F8014 */       lui $t7, %hi(dMNTrainingCursorTypeOffsetsUnused)
  /* 145850 80136270 AFBF0034 */        sw $ra, 0x34($sp)
  /* 145854 80136274 AFA40060 */        sw $a0, 0x60($sp)
  /* 145858 80136278 25EF83AC */     addiu $t7, $t7, %lo(dMNTrainingCursorTypeOffsetsUnused)
  /* 14585C 8013627C 8DF90000 */        lw $t9, ($t7) # dMNTrainingCursorTypeOffsetsUnused + 0
  /* 145860 80136280 8DF80004 */        lw $t8, 4($t7) # dMNTrainingCursorTypeOffsetsUnused + 4
  /* 145864 80136284 27AE0048 */     addiu $t6, $sp, 0x48
  /* 145868 80136288 ADD90000 */        sw $t9, ($t6)
  /* 14586C 8013628C ADD80004 */        sw $t8, 4($t6)
  /* 145870 80136290 8DF8000C */        lw $t8, 0xc($t7) # dMNTrainingCursorTypeOffsetsUnused + 12
  /* 145874 80136294 8DF90008 */        lw $t9, 8($t7) # dMNTrainingCursorTypeOffsetsUnused + 8
  /* 145878 80136298 3C088014 */       lui $t0, %hi(dMNTrainingCursorStartingDisplayOrders)
  /* 14587C 8013629C 250883BC */     addiu $t0, $t0, %lo(dMNTrainingCursorStartingDisplayOrders)
  /* 145880 801362A0 ADD8000C */        sw $t8, 0xc($t6)
  /* 145884 801362A4 ADD90008 */        sw $t9, 8($t6)
  /* 145888 801362A8 8D0A0000 */        lw $t2, ($t0) # dMNTrainingCursorStartingDisplayOrders + 0
  /* 14588C 801362AC 27A20038 */     addiu $v0, $sp, 0x38
  /* 145890 801362B0 3C0B800D */       lui $t3, %hi(func_ovl0_800CCF00)
  /* 145894 801362B4 AC4A0000 */        sw $t2, ($v0)
  /* 145898 801362B8 8D090004 */        lw $t1, 4($t0) # dMNTrainingCursorStartingDisplayOrders + 4
  /* 14589C 801362BC 256BCF00 */     addiu $t3, $t3, %lo(func_ovl0_800CCF00)
  /* 1458A0 801362C0 240C0020 */     addiu $t4, $zero, 0x20
  /* 1458A4 801362C4 AC490004 */        sw $t1, 4($v0)
  /* 1458A8 801362C8 8D0A0008 */        lw $t2, 8($t0) # dMNTrainingCursorStartingDisplayOrders + 8
  /* 1458AC 801362CC 2419FFFF */     addiu $t9, $zero, -1
  /* 1458B0 801362D0 00002025 */        or $a0, $zero, $zero
  /* 1458B4 801362D4 AC4A0008 */        sw $t2, 8($v0)
  /* 1458B8 801362D8 8D09000C */        lw $t1, 0xc($t0) # dMNTrainingCursorStartingDisplayOrders + 12
  /* 1458BC 801362DC 3C088014 */       lui $t0, %hi(D_ovl28_80138C98)
  /* 1458C0 801362E0 00002825 */        or $a1, $zero, $zero
  /* 1458C4 801362E4 AC49000C */        sw $t1, 0xc($v0)
  /* 1458C8 801362E8 8FAD0060 */        lw $t5, 0x60($sp)
  /* 1458CC 801362EC AFAC0014 */        sw $t4, 0x14($sp)
  /* 1458D0 801362F0 AFAB0010 */        sw $t3, 0x10($sp)
  /* 1458D4 801362F4 000D7080 */       sll $t6, $t5, 2
  /* 1458D8 801362F8 004E7821 */      addu $t7, $v0, $t6
  /* 1458DC 801362FC 8DF80000 */        lw $t8, ($t7) # dMNTrainingCursorTypeOffsetsUnused + 0
  /* 1458E0 80136300 8D088C98 */        lw $t0, %lo(D_ovl28_80138C98)($t0)
  /* 1458E4 80136304 3C090000 */       lui $t1, %hi(D_NF_000076E8)
  /* 1458E8 80136308 252976E8 */     addiu $t1, $t1, %lo(D_NF_000076E8)
  /* 1458EC 8013630C 3C0C8013 */       lui $t4, %hi(mnTrainingHandleButtonPresses)
  /* 1458F0 80136310 258C5934 */     addiu $t4, $t4, %lo(mnTrainingHandleButtonPresses)
  /* 1458F4 80136314 240D0002 */     addiu $t5, $zero, 2
  /* 1458F8 80136318 240B0001 */     addiu $t3, $zero, 1
  /* 1458FC 8013631C 01095021 */      addu $t2, $t0, $t1
  /* 145900 80136320 AFAA0020 */        sw $t2, 0x20($sp)
  /* 145904 80136324 AFAB0024 */        sw $t3, 0x24($sp)
  /* 145908 80136328 AFAD002C */        sw $t5, 0x2c($sp)
  /* 14590C 8013632C AFAC0028 */        sw $t4, 0x28($sp)
  /* 145910 80136330 AFB9001C */        sw $t9, 0x1c($sp)
  /* 145914 80136334 24060013 */     addiu $a2, $zero, 0x13
  /* 145918 80136338 3C078000 */       lui $a3, 0x8000
  /* 14591C 8013633C 0C033414 */       jal func_ovl0_800CD050
  /* 145920 80136340 AFB80018 */        sw $t8, 0x18($sp)
  /* 145924 80136344 8FA50060 */        lw $a1, 0x60($sp)
  /* 145928 80136348 3C018014 */       lui $at, %hi(gMNTrainingPanels)
  /* 14592C 8013634C 00402025 */        or $a0, $v0, $zero
  /* 145930 80136350 00057080 */       sll $t6, $a1, 2
  /* 145934 80136354 01C57023 */      subu $t6, $t6, $a1
  /* 145938 80136358 000E70C0 */       sll $t6, $t6, 3
  /* 14593C 8013635C 01C57023 */      subu $t6, $t6, $a1
  /* 145940 80136360 000E70C0 */       sll $t6, $t6, 3
  /* 145944 80136364 002E0821 */      addu $at, $at, $t6
  /* 145948 80136368 AC228558 */        sw $v0, %lo(gMNTrainingPanels)($at)
  /* 14594C 8013636C 3C01428C */       lui $at, (0x428C0000 >> 16) # 70.0
  /* 145950 80136370 44812000 */      mtc1 $at, $f4 # 70.0 to cop1
  /* 145954 80136374 8C4F0074 */        lw $t7, 0x74($v0)
  /* 145958 80136378 AC450084 */        sw $a1, 0x84($v0)
  /* 14595C 8013637C 3C01432A */       lui $at, (0x432A0000 >> 16) # 170.0
  /* 145960 80136380 E5E40058 */      swc1 $f4, 0x58($t7)
  /* 145964 80136384 8C580074 */        lw $t8, 0x74($v0)
  /* 145968 80136388 44813000 */      mtc1 $at, $f6 # 170.0 to cop1
  /* 14596C 8013638C 00003025 */        or $a2, $zero, $zero
  /* 145970 80136390 E706005C */      swc1 $f6, 0x5c($t8)
  /* 145974 80136394 8C430074 */        lw $v1, 0x74($v0)
  /* 145978 80136398 94790024 */       lhu $t9, 0x24($v1)
  /* 14597C 8013639C 3328FFDF */      andi $t0, $t9, 0xffdf
  /* 145980 801363A0 A4680024 */        sh $t0, 0x24($v1)
  /* 145984 801363A4 8C430074 */        lw $v1, 0x74($v0)
  /* 145988 801363A8 94690024 */       lhu $t1, 0x24($v1)
  /* 14598C 801363AC 352A0001 */       ori $t2, $t1, 1
  /* 145990 801363B0 0C04CEA4 */       jal mnTrainingRedrawCursor
  /* 145994 801363B4 A46A0024 */        sh $t2, 0x24($v1)
  /* 145998 801363B8 8FBF0034 */        lw $ra, 0x34($sp)
  /* 14599C 801363BC 27BD0060 */     addiu $sp, $sp, 0x60
  /* 1459A0 801363C0 03E00008 */        jr $ra
  /* 1459A4 801363C4 00000000 */       nop

glabel mnTrainingRenderToken
  /* 1459A8 801363C8 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 1459AC 801363CC 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 1459B0 801363D0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1459B4 801363D4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1459B8 801363D8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1459BC 801363DC 244E0008 */     addiu $t6, $v0, 8
  /* 1459C0 801363E0 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1459C4 801363E4 3C0FE700 */       lui $t7, 0xe700
  /* 1459C8 801363E8 AC4F0000 */        sw $t7, ($v0)
  /* 1459CC 801363EC AC400004 */        sw $zero, 4($v0)
  /* 1459D0 801363F0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1459D4 801363F4 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 1459D8 801363F8 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 1459DC 801363FC 24580008 */     addiu $t8, $v0, 8
  /* 1459E0 80136400 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1459E4 80136404 AC400004 */        sw $zero, 4($v0)
  /* 1459E8 80136408 AC590000 */        sw $t9, ($v0)
  /* 1459EC 8013640C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1459F0 80136410 240EFFFF */     addiu $t6, $zero, -1
  /* 1459F4 80136414 3C0DFA00 */       lui $t5, 0xfa00
  /* 1459F8 80136418 244C0008 */     addiu $t4, $v0, 8
  /* 1459FC 8013641C AC6C0000 */        sw $t4, ($v1) # gDisplayListHead + 0
  /* 145A00 80136420 AC4E0004 */        sw $t6, 4($v0)
  /* 145A04 80136424 AC4D0000 */        sw $t5, ($v0)
  /* 145A08 80136428 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 145A0C 8013642C 3C18FB00 */       lui $t8, 0xfb00
  /* 145A10 80136430 3C058014 */       lui $a1, %hi(gMNTrainingTokenShinePulseColor)
  /* 145A14 80136434 244F0008 */     addiu $t7, $v0, 8
  /* 145A18 80136438 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 145A1C 8013643C AC580000 */        sw $t8, ($v0)
  /* 145A20 80136440 8CA58874 */        lw $a1, %lo(gMNTrainingTokenShinePulseColor)($a1)
  /* 145A24 80136444 30A500FF */      andi $a1, $a1, 0xff
  /* 145A28 80136448 0005CE00 */       sll $t9, $a1, 0x18
  /* 145A2C 8013644C 00056400 */       sll $t4, $a1, 0x10
  /* 145A30 80136450 032C6825 */        or $t5, $t9, $t4
  /* 145A34 80136454 00057200 */       sll $t6, $a1, 8
  /* 145A38 80136458 01AE7825 */        or $t7, $t5, $t6
  /* 145A3C 8013645C 01E5C025 */        or $t8, $t7, $a1
  /* 145A40 80136460 AC580004 */        sw $t8, 4($v0)
  /* 145A44 80136464 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 145A48 80136468 3C0D33FD */       lui $t5, (0x33FDF2F9 >> 16) # 872280825
  /* 145A4C 8013646C 3C0CFC12 */       lui $t4, (0xFC12FE25 >> 16) # 4229103141
  /* 145A50 80136470 24590008 */     addiu $t9, $v0, 8
  /* 145A54 80136474 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 145A58 80136478 358CFE25 */       ori $t4, $t4, (0xFC12FE25 & 0xFFFF) # 4229103141
  /* 145A5C 8013647C 35ADF2F9 */       ori $t5, $t5, (0x33FDF2F9 & 0xFFFF) # 872280825
  /* 145A60 80136480 AC4D0004 */        sw $t5, 4($v0)
  /* 145A64 80136484 AC4C0000 */        sw $t4, ($v0)
  /* 145A68 80136488 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 145A6C 8013648C 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 145A70 80136490 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 145A74 80136494 244E0008 */     addiu $t6, $v0, 8
  /* 145A78 80136498 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 145A7C 8013649C 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 145A80 801364A0 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 145A84 801364A4 AC580004 */        sw $t8, 4($v0)
  /* 145A88 801364A8 0C0333DD */       jal func_ovl0_800CCF74
  /* 145A8C 801364AC AC4F0000 */        sw $t7, ($v0)
  /* 145A90 801364B0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145A94 801364B4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 145A98 801364B8 03E00008 */        jr $ra
  /* 145A9C 801364BC 00000000 */       nop

glabel mnTrainingCreateToken
  /* 145AA0 801364C0 27BDFF78 */     addiu $sp, $sp, -0x88
  /* 145AA4 801364C4 3C0E8014 */       lui $t6, %hi(dMNTrainingTokenOffsetsNoCPU)
  /* 145AA8 801364C8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 145AAC 801364CC AFB00038 */        sw $s0, 0x38($sp)
  /* 145AB0 801364D0 AFA40088 */        sw $a0, 0x88($sp)
  /* 145AB4 801364D4 25CE83CC */     addiu $t6, $t6, %lo(dMNTrainingTokenOffsetsNoCPU)
  /* 145AB8 801364D8 8DD80000 */        lw $t8, ($t6) # dMNTrainingTokenOffsetsNoCPU + 0
  /* 145ABC 801364DC 27A20070 */     addiu $v0, $sp, 0x70
  /* 145AC0 801364E0 3C198014 */       lui $t9, %hi(dMNTrainingTokenStartingDisplayOrders)
  /* 145AC4 801364E4 AC580000 */        sw $t8, ($v0)
  /* 145AC8 801364E8 8DCF0004 */        lw $t7, 4($t6) # dMNTrainingTokenOffsetsNoCPU + 4
  /* 145ACC 801364EC 273983DC */     addiu $t9, $t9, %lo(dMNTrainingTokenStartingDisplayOrders)
  /* 145AD0 801364F0 27A30060 */     addiu $v1, $sp, 0x60
  /* 145AD4 801364F4 AC4F0004 */        sw $t7, 4($v0)
  /* 145AD8 801364F8 8DD80008 */        lw $t8, 8($t6) # dMNTrainingTokenOffsetsNoCPU + 8
  /* 145ADC 801364FC 3C0C8014 */       lui $t4, %hi(dMNTrainingTokenHoldingDisplayOrders)
  /* 145AE0 80136500 258C83EC */     addiu $t4, $t4, %lo(dMNTrainingTokenHoldingDisplayOrders)
  /* 145AE4 80136504 AC580008 */        sw $t8, 8($v0)
  /* 145AE8 80136508 8DCF000C */        lw $t7, 0xc($t6) # dMNTrainingTokenOffsetsNoCPU + 12
  /* 145AEC 8013650C 27AB0050 */     addiu $t3, $sp, 0x50
  /* 145AF0 80136510 24180021 */     addiu $t8, $zero, 0x21
  /* 145AF4 80136514 AC4F000C */        sw $t7, 0xc($v0)
  /* 145AF8 80136518 8F2A0000 */        lw $t2, ($t9) # dMNTrainingTokenStartingDisplayOrders + 0
  /* 145AFC 8013651C 3C0F8013 */       lui $t7, %hi(mnTrainingRenderToken)
  /* 145B00 80136520 25EF63C8 */     addiu $t7, $t7, %lo(mnTrainingRenderToken)
  /* 145B04 80136524 AC6A0000 */        sw $t2, ($v1)
  /* 145B08 80136528 8F290004 */        lw $t1, 4($t9) # dMNTrainingTokenStartingDisplayOrders + 4
  /* 145B0C 8013652C 00002025 */        or $a0, $zero, $zero
  /* 145B10 80136530 00002825 */        or $a1, $zero, $zero
  /* 145B14 80136534 AC690004 */        sw $t1, 4($v1)
  /* 145B18 80136538 8F2A0008 */        lw $t2, 8($t9) # dMNTrainingTokenStartingDisplayOrders + 8
  /* 145B1C 8013653C 24060014 */     addiu $a2, $zero, 0x14
  /* 145B20 80136540 3C078000 */       lui $a3, 0x8000
  /* 145B24 80136544 AC6A0008 */        sw $t2, 8($v1)
  /* 145B28 80136548 8F29000C */        lw $t1, 0xc($t9) # dMNTrainingTokenStartingDisplayOrders + 12
  /* 145B2C 8013654C 240AFFFF */     addiu $t2, $zero, -1
  /* 145B30 80136550 AC69000C */        sw $t1, 0xc($v1)
  /* 145B34 80136554 8D8D0004 */        lw $t5, 4($t4) # dMNTrainingTokenHoldingDisplayOrders + 4
  /* 145B38 80136558 8D8E0000 */        lw $t6, ($t4) # dMNTrainingTokenHoldingDisplayOrders + 0
  /* 145B3C 8013655C AD6D0004 */        sw $t5, 4($t3)
  /* 145B40 80136560 AD6E0000 */        sw $t6, ($t3)
  /* 145B44 80136564 8D8E0008 */        lw $t6, 8($t4) # dMNTrainingTokenHoldingDisplayOrders + 8
  /* 145B48 80136568 8D8D000C */        lw $t5, 0xc($t4) # dMNTrainingTokenHoldingDisplayOrders + 12
  /* 145B4C 8013656C AD6E0008 */        sw $t6, 8($t3)
  /* 145B50 80136570 AD6D000C */        sw $t5, 0xc($t3)
  /* 145B54 80136574 8FA80088 */        lw $t0, 0x88($sp)
  /* 145B58 80136578 AFB80014 */        sw $t8, 0x14($sp)
  /* 145B5C 8013657C AFAF0010 */        sw $t7, 0x10($sp)
  /* 145B60 80136580 00084080 */       sll $t0, $t0, 2
  /* 145B64 80136584 0068C821 */      addu $t9, $v1, $t0
  /* 145B68 80136588 8F290000 */        lw $t1, ($t9) # dMNTrainingTokenStartingDisplayOrders + 0
  /* 145B6C 8013658C AFAA001C */        sw $t2, 0x1c($sp)
  /* 145B70 80136590 00485821 */      addu $t3, $v0, $t0
  /* 145B74 80136594 AFA90018 */        sw $t1, 0x18($sp)
  /* 145B78 80136598 8D6C0000 */        lw $t4, ($t3)
  /* 145B7C 8013659C 3C0D8014 */       lui $t5, %hi(D_ovl28_80138C98)
  /* 145B80 801365A0 8DAD8C98 */        lw $t5, %lo(D_ovl28_80138C98)($t5)
  /* 145B84 801365A4 3C188013 */       lui $t8, %hi(mnTrainingSyncTokenAndFighter)
  /* 145B88 801365A8 27185DD8 */     addiu $t8, $t8, %lo(mnTrainingSyncTokenAndFighter)
  /* 145B8C 801365AC 24190001 */     addiu $t9, $zero, 1
  /* 145B90 801365B0 240F0001 */     addiu $t7, $zero, 1
  /* 145B94 801365B4 018D7021 */      addu $t6, $t4, $t5
  /* 145B98 801365B8 AFAE0020 */        sw $t6, 0x20($sp)
  /* 145B9C 801365BC AFAF0024 */        sw $t7, 0x24($sp)
  /* 145BA0 801365C0 AFB9002C */        sw $t9, 0x2c($sp)
  /* 145BA4 801365C4 AFB80028 */        sw $t8, 0x28($sp)
  /* 145BA8 801365C8 0C033414 */       jal func_ovl0_800CD050
  /* 145BAC 801365CC AFA8004C */        sw $t0, 0x4c($sp)
  /* 145BB0 801365D0 8FA50088 */        lw $a1, 0x88($sp)
  /* 145BB4 801365D4 3C0A8014 */       lui $t2, %hi(gMNTrainingPanels)
  /* 145BB8 801365D8 254A8558 */     addiu $t2, $t2, %lo(gMNTrainingPanels)
  /* 145BBC 801365DC 00054880 */       sll $t1, $a1, 2
  /* 145BC0 801365E0 01254823 */      subu $t1, $t1, $a1
  /* 145BC4 801365E4 000948C0 */       sll $t1, $t1, 3
  /* 145BC8 801365E8 01254823 */      subu $t1, $t1, $a1
  /* 145BCC 801365EC 000948C0 */       sll $t1, $t1, 3
  /* 145BD0 801365F0 012A1821 */      addu $v1, $t1, $t2
  /* 145BD4 801365F4 AC620004 */        sw $v0, 4($v1)
  /* 145BD8 801365F8 8FA8004C */        lw $t0, 0x4c($sp)
  /* 145BDC 801365FC AC450084 */        sw $a1, 0x84($v0)
  /* 145BE0 80136600 8C640080 */        lw $a0, 0x80($v1)
  /* 145BE4 80136604 24010001 */     addiu $at, $zero, 1
  /* 145BE8 80136608 00408025 */        or $s0, $v0, $zero
  /* 145BEC 8013660C 14810008 */       bne $a0, $at, .L80136630
  /* 145BF0 80136610 24050004 */     addiu $a1, $zero, 4
  /* 145BF4 80136614 00402025 */        or $a0, $v0, $zero
  /* 145BF8 80136618 AFA30048 */        sw $v1, 0x48($sp)
  /* 145BFC 8013661C 0C04D706 */       jal mnTrainingRedrawToken
  /* 145C00 80136620 AFA8004C */        sw $t0, 0x4c($sp)
  /* 145C04 80136624 8FA30048 */        lw $v1, 0x48($sp)
  /* 145C08 80136628 8FA8004C */        lw $t0, 0x4c($sp)
  /* 145C0C 8013662C 8C640080 */        lw $a0, 0x80($v1)
  .L80136630:
  /* 145C10 80136630 5480000D */      bnel $a0, $zero, .L80136668
  /* 145C14 80136634 8C650048 */        lw $a1, 0x48($v1)
  /* 145C18 80136638 8C6B007C */        lw $t3, 0x7c($v1)
  /* 145C1C 8013663C 2401FFFF */     addiu $at, $zero, -1
  /* 145C20 80136640 24050020 */     addiu $a1, $zero, 0x20
  /* 145C24 80136644 11610007 */       beq $t3, $at, .L80136664
  /* 145C28 80136648 03A83021 */      addu $a2, $sp, $t0
  /* 145C2C 8013664C 8CC60050 */        lw $a2, 0x50($a2)
  /* 145C30 80136650 AFA30048 */        sw $v1, 0x48($sp)
  /* 145C34 80136654 8C640004 */        lw $a0, 4($v1)
  /* 145C38 80136658 0C002834 */       jal omMoveGObjDL
  /* 145C3C 8013665C 24C60001 */     addiu $a2, $a2, 1
  /* 145C40 80136660 8FA30048 */        lw $v1, 0x48($sp)
  .L80136664:
  /* 145C44 80136664 8C650048 */        lw $a1, 0x48($v1)
  .L80136668:
  /* 145C48 80136668 2401001C */     addiu $at, $zero, 0x1c
  /* 145C4C 8013666C 14A10009 */       bne $a1, $at, .L80136694
  /* 145C50 80136670 3C01424C */       lui $at, (0x424C0000 >> 16) # 51.0
  /* 145C54 80136674 44812000 */      mtc1 $at, $f4 # 51.0 to cop1
  /* 145C58 80136678 8E0C0074 */        lw $t4, 0x74($s0)
  /* 145C5C 8013667C 3C014321 */       lui $at, (0x43210000 >> 16) # 161.0
  /* 145C60 80136680 44813000 */      mtc1 $at, $f6 # 161.0 to cop1
  /* 145C64 80136684 E5840058 */      swc1 $f4, 0x58($t4)
  /* 145C68 80136688 8E0D0074 */        lw $t5, 0x74($s0)
  /* 145C6C 8013668C 10000003 */         b .L8013669C
  /* 145C70 80136690 E5A6005C */      swc1 $f6, 0x5c($t5)
  .L80136694:
  /* 145C74 80136694 0C04D733 */       jal mnTrainingCenterTokenInPortrait
  /* 145C78 80136698 02002025 */        or $a0, $s0, $zero
  .L8013669C:
  /* 145C7C 8013669C 8E020074 */        lw $v0, 0x74($s0)
  /* 145C80 801366A0 944E0024 */       lhu $t6, 0x24($v0)
  /* 145C84 801366A4 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 145C88 801366A8 A44F0024 */        sh $t7, 0x24($v0)
  /* 145C8C 801366AC 8E020074 */        lw $v0, 0x74($s0)
  /* 145C90 801366B0 94580024 */       lhu $t8, 0x24($v0)
  /* 145C94 801366B4 37190001 */       ori $t9, $t8, 1
  /* 145C98 801366B8 A4590024 */        sh $t9, 0x24($v0)
  /* 145C9C 801366BC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 145CA0 801366C0 8FB00038 */        lw $s0, 0x38($sp)
  /* 145CA4 801366C4 27BD0088 */     addiu $sp, $sp, 0x88
  /* 145CA8 801366C8 03E00008 */        jr $ra
  /* 145CAC 801366CC 00000000 */       nop

glabel getTrainingTokenDistance
  /* 145CB0 801366D0 240700B8 */     addiu $a3, $zero, 0xb8
  /* 145CB4 801366D4 00A70019 */     multu $a1, $a3
  /* 145CB8 801366D8 3C068014 */       lui $a2, %hi(gMNTrainingPanels)
  /* 145CBC 801366DC 24C68558 */     addiu $a2, $a2, %lo(gMNTrainingPanels)
  /* 145CC0 801366E0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 145CC4 801366E4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 145CC8 801366E8 00007012 */      mflo $t6
  /* 145CCC 801366EC 00CE7821 */      addu $t7, $a2, $t6
  /* 145CD0 801366F0 8DF80004 */        lw $t8, 4($t7)
  /* 145CD4 801366F4 00870019 */     multu $a0, $a3
  /* 145CD8 801366F8 8F020074 */        lw $v0, 0x74($t8)
  /* 145CDC 801366FC C444005C */      lwc1 $f4, 0x5c($v0)
  /* 145CE0 80136700 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 145CE4 80136704 0000C812 */      mflo $t9
  /* 145CE8 80136708 00D94021 */      addu $t0, $a2, $t9
  /* 145CEC 8013670C 8D090004 */        lw $t1, 4($t0)
  /* 145CF0 80136710 8D230074 */        lw $v1, 0x74($t1)
  /* 145CF4 80136714 C466005C */      lwc1 $f6, 0x5c($v1)
  /* 145CF8 80136718 C46A0058 */      lwc1 $f10, 0x58($v1)
  /* 145CFC 8013671C 46062001 */     sub.s $f0, $f4, $f6
  /* 145D00 80136720 460A4081 */     sub.s $f2, $f8, $f10
  /* 145D04 80136724 46000402 */     mul.s $f16, $f0, $f0
  /* 145D08 80136728 00000000 */       nop
  /* 145D0C 8013672C 46021482 */     mul.s $f18, $f2, $f2
  /* 145D10 80136730 0C00CD44 */       jal sqrtf
  /* 145D14 80136734 46128300 */     add.s $f12, $f16, $f18
  /* 145D18 80136738 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145D1C 8013673C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 145D20 80136740 03E00008 */        jr $ra
  /* 145D24 80136744 00000000 */       nop

glabel mnTrainingAutopositionOverlappedTokens
  /* 145D28 80136748 240800B8 */     addiu $t0, $zero, 0xb8
  /* 145D2C 8013674C 00880019 */     multu $a0, $t0
  /* 145D30 80136750 3C028014 */       lui $v0, %hi(gMNTrainingPanels)
  /* 145D34 80136754 24428558 */     addiu $v0, $v0, %lo(gMNTrainingPanels)
  /* 145D38 80136758 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 145D3C 8013675C AFA60038 */        sw $a2, 0x38($sp)
  /* 145D40 80136760 AFBF0014 */        sw $ra, 0x14($sp)
  /* 145D44 80136764 24040002 */     addiu $a0, $zero, 2
  /* 145D48 80136768 3C01BF80 */       lui $at, 0xbf80
  /* 145D4C 8013676C 00007012 */      mflo $t6
  /* 145D50 80136770 004E1821 */      addu $v1, $v0, $t6
  /* 145D54 80136774 8C660004 */        lw $a2, 4($v1)
  /* 145D58 80136778 00A80019 */     multu $a1, $t0
  /* 145D5C 8013677C 8CCF0074 */        lw $t7, 0x74($a2)
  /* 145D60 80136780 C5E00058 */      lwc1 $f0, 0x58($t7)
  /* 145D64 80136784 0000C012 */      mflo $t8
  /* 145D68 80136788 00583821 */      addu $a3, $v0, $t8
  /* 145D6C 8013678C 8CF90004 */        lw $t9, 4($a3)
  /* 145D70 80136790 8F290074 */        lw $t1, 0x74($t9)
  /* 145D74 80136794 C5220058 */      lwc1 $f2, 0x58($t1)
  /* 145D78 80136798 46020032 */    c.eq.s $f0, $f2
  /* 145D7C 8013679C 00000000 */       nop
  /* 145D80 801367A0 4502000F */     bc1fl .L801367E0
  /* 145D84 801367A4 46001481 */     sub.s $f18, $f2, $f0
  /* 145D88 801367A8 AFA30024 */        sw $v1, 0x24($sp)
  /* 145D8C 801367AC 0C006265 */       jal lbRandom_GetIntRange
  /* 145D90 801367B0 AFA70018 */        sw $a3, 0x18($sp)
  /* 145D94 801367B4 244AFFFF */     addiu $t2, $v0, -1
  /* 145D98 801367B8 448A3000 */      mtc1 $t2, $f6
  /* 145D9C 801367BC 8FA30024 */        lw $v1, 0x24($sp)
  /* 145DA0 801367C0 8FA70018 */        lw $a3, 0x18($sp)
  /* 145DA4 801367C4 46803220 */   cvt.s.w $f8, $f6
  /* 145DA8 801367C8 C464008C */      lwc1 $f4, 0x8c($v1)
  /* 145DAC 801367CC 8C660004 */        lw $a2, 4($v1)
  /* 145DB0 801367D0 46082280 */     add.s $f10, $f4, $f8
  /* 145DB4 801367D4 1000000A */         b .L80136800
  /* 145DB8 801367D8 E46A008C */      swc1 $f10, 0x8c($v1)
  /* 145DBC 801367DC 46001481 */     sub.s $f18, $f2, $f0
  .L801367E0:
  /* 145DC0 801367E0 44818000 */      mtc1 $at, $f16
  /* 145DC4 801367E4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145DC8 801367E8 44812000 */      mtc1 $at, $f4 # 10.0 to cop1
  /* 145DCC 801367EC 46128182 */     mul.s $f6, $f16, $f18
  /* 145DD0 801367F0 C46A008C */      lwc1 $f10, 0x8c($v1)
  /* 145DD4 801367F4 46043203 */     div.s $f8, $f6, $f4
  /* 145DD8 801367F8 46085400 */     add.s $f16, $f10, $f8
  /* 145DDC 801367FC E470008C */      swc1 $f16, 0x8c($v1)
  .L80136800:
  /* 145DE0 80136800 8CEC0004 */        lw $t4, 4($a3)
  /* 145DE4 80136804 8CCB0074 */        lw $t3, 0x74($a2)
  /* 145DE8 80136808 24040002 */     addiu $a0, $zero, 2
  /* 145DEC 8013680C 8D8D0074 */        lw $t5, 0x74($t4)
  /* 145DF0 80136810 C560005C */      lwc1 $f0, 0x5c($t3)
  /* 145DF4 80136814 3C01BF80 */       lui $at, 0xbf80
  /* 145DF8 80136818 C5A2005C */      lwc1 $f2, 0x5c($t5)
  /* 145DFC 8013681C 46020032 */    c.eq.s $f0, $f2
  /* 145E00 80136820 00000000 */       nop
  /* 145E04 80136824 4502000C */     bc1fl .L80136858
  /* 145E08 80136828 46001401 */     sub.s $f16, $f2, $f0
  /* 145E0C 8013682C 0C006265 */       jal lbRandom_GetIntRange
  /* 145E10 80136830 AFA30024 */        sw $v1, 0x24($sp)
  /* 145E14 80136834 244EFFFF */     addiu $t6, $v0, -1
  /* 145E18 80136838 448E3000 */      mtc1 $t6, $f6
  /* 145E1C 8013683C 8FA30024 */        lw $v1, 0x24($sp)
  /* 145E20 80136840 46803120 */   cvt.s.w $f4, $f6
  /* 145E24 80136844 C4720090 */      lwc1 $f18, 0x90($v1)
  /* 145E28 80136848 46049280 */     add.s $f10, $f18, $f4
  /* 145E2C 8013684C 1000000A */         b .L80136878
  /* 145E30 80136850 E46A0090 */      swc1 $f10, 0x90($v1)
  /* 145E34 80136854 46001401 */     sub.s $f16, $f2, $f0
  .L80136858:
  /* 145E38 80136858 44814000 */      mtc1 $at, $f8
  /* 145E3C 8013685C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145E40 80136860 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 145E44 80136864 46104182 */     mul.s $f6, $f8, $f16
  /* 145E48 80136868 C46A0090 */      lwc1 $f10, 0x90($v1)
  /* 145E4C 8013686C 46123103 */     div.s $f4, $f6, $f18
  /* 145E50 80136870 46045200 */     add.s $f8, $f10, $f4
  /* 145E54 80136874 E4680090 */      swc1 $f8, 0x90($v1)
  .L80136878:
  /* 145E58 80136878 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145E5C 8013687C 27BD0030 */     addiu $sp, $sp, 0x30
  /* 145E60 80136880 03E00008 */        jr $ra
  /* 145E64 80136884 00000000 */       nop

glabel mnTrainingAutopositionTokenFromPortraitEdges
  /* 145E68 80136888 00047080 */       sll $t6, $a0, 2
  /* 145E6C 8013688C 01C47023 */      subu $t6, $t6, $a0
  /* 145E70 80136890 000E70C0 */       sll $t6, $t6, 3
  /* 145E74 80136894 01C47023 */      subu $t6, $t6, $a0
  /* 145E78 80136898 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 145E7C 8013689C 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 145E80 801368A0 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 145E84 801368A4 000E70C0 */       sll $t6, $t6, 3
  /* 145E88 801368A8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 145E8C 801368AC 01CF1821 */      addu $v1, $t6, $t7
  /* 145E90 801368B0 8C640048 */        lw $a0, 0x48($v1)
  /* 145E94 801368B4 0C04C808 */       jal mnTrainingGetPortraitId
  /* 145E98 801368B8 AFA3001C */        sw $v1, 0x1c($sp)
  /* 145E9C 801368BC 28410006 */      slti $at, $v0, 6
  /* 145EA0 801368C0 14200003 */      bnez $at, .L801368D0
  /* 145EA4 801368C4 8FA3001C */        lw $v1, 0x1c($sp)
  /* 145EA8 801368C8 10000002 */         b .L801368D4
  /* 145EAC 801368CC 2444FFFA */     addiu $a0, $v0, -6
  .L801368D0:
  /* 145EB0 801368D0 00402025 */        or $a0, $v0, $zero
  .L801368D4:
  /* 145EB4 801368D4 0004C080 */       sll $t8, $a0, 2
  /* 145EB8 801368D8 0304C023 */      subu $t8, $t8, $a0
  /* 145EBC 801368DC 0018C080 */       sll $t8, $t8, 2
  /* 145EC0 801368E0 0304C023 */      subu $t8, $t8, $a0
  /* 145EC4 801368E4 0018C080 */       sll $t8, $t8, 2
  /* 145EC8 801368E8 0304C021 */      addu $t8, $t8, $a0
  /* 145ECC 801368EC 27190019 */     addiu $t9, $t8, 0x19
  /* 145ED0 801368F0 44992000 */      mtc1 $t9, $f4
  /* 145ED4 801368F4 28410006 */      slti $at, $v0, 6
  /* 145ED8 801368F8 14200003 */      bnez $at, .L80136908
  /* 145EDC 801368FC 468023A0 */   cvt.s.w $f14, $f4
  /* 145EE0 80136900 10000002 */         b .L8013690C
  /* 145EE4 80136904 24040001 */     addiu $a0, $zero, 1
  .L80136908:
  /* 145EE8 80136908 00002025 */        or $a0, $zero, $zero
  .L8013690C:
  /* 145EEC 8013690C 8C680004 */        lw $t0, 4($v1)
  /* 145EF0 80136910 C466008C */      lwc1 $f6, 0x8c($v1)
  /* 145EF4 80136914 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 145EF8 80136918 8D020074 */        lw $v0, 0x74($t0)
  /* 145EFC 8013691C 44818000 */      mtc1 $at, $f16 # 5.0 to cop1
  /* 145F00 80136920 3C014150 */       lui $at, (0x41500000 >> 16) # 13.0
  /* 145F04 80136924 C4480058 */      lwc1 $f8, 0x58($v0)
  /* 145F08 80136928 44812000 */      mtc1 $at, $f4 # 13.0 to cop1
  /* 145F0C 8013692C 46107300 */     add.s $f12, $f14, $f16
  /* 145F10 80136930 00044880 */       sll $t1, $a0, 2
  /* 145F14 80136934 01244823 */      subu $t1, $t1, $a0
  /* 145F18 80136938 46083280 */     add.s $f10, $f6, $f8
  /* 145F1C 8013693C C4660090 */      lwc1 $f6, 0x90($v1)
  /* 145F20 80136940 C448005C */      lwc1 $f8, 0x5c($v0)
  /* 145F24 80136944 00094880 */       sll $t1, $t1, 2
  /* 145F28 80136948 46045000 */     add.s $f0, $f10, $f4
  /* 145F2C 8013694C 3C014140 */       lui $at, (0x41400000 >> 16) # 12.0
  /* 145F30 80136950 01244823 */      subu $t1, $t1, $a0
  /* 145F34 80136954 46083280 */     add.s $f10, $f6, $f8
  /* 145F38 80136958 44812000 */      mtc1 $at, $f4 # 12.0 to cop1
  /* 145F3C 8013695C 00094880 */       sll $t1, $t1, 2
  /* 145F40 80136960 460C003C */    c.lt.s $f0, $f12
  /* 145F44 80136964 01244823 */      subu $t1, $t1, $a0
  /* 145F48 80136968 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145F4C 8013696C 252A0024 */     addiu $t2, $t1, 0x24
  /* 145F50 80136970 45000006 */      bc1f .L8013698C
  /* 145F54 80136974 46045080 */     add.s $f2, $f10, $f4
  /* 145F58 80136978 46006181 */     sub.s $f6, $f12, $f0
  /* 145F5C 8013697C 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 145F60 80136980 00000000 */       nop
  /* 145F64 80136984 46123203 */     div.s $f8, $f6, $f18
  /* 145F68 80136988 E468008C */      swc1 $f8, 0x8c($v1)
  .L8013698C:
  /* 145F6C 8013698C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 145F70 80136990 44819000 */      mtc1 $at, $f18 # 10.0 to cop1
  /* 145F74 80136994 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 145F78 80136998 44815000 */      mtc1 $at, $f10 # 45.0 to cop1
  /* 145F7C 8013699C 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 145F80 801369A0 460A7100 */     add.s $f4, $f14, $f10
  /* 145F84 801369A4 46102301 */     sub.s $f12, $f4, $f16
  /* 145F88 801369A8 4600603C */    c.lt.s $f12, $f0
  /* 145F8C 801369AC 00000000 */       nop
  /* 145F90 801369B0 45020008 */     bc1fl .L801369D4
  /* 145F94 801369B4 448A3000 */      mtc1 $t2, $f6
  /* 145F98 801369B8 460C0181 */     sub.s $f6, $f0, $f12
  /* 145F9C 801369BC 44814000 */      mtc1 $at, $f8 # -1.0 to cop1
  /* 145FA0 801369C0 00000000 */       nop
  /* 145FA4 801369C4 46083282 */     mul.s $f10, $f6, $f8
  /* 145FA8 801369C8 46125103 */     div.s $f4, $f10, $f18
  /* 145FAC 801369CC E464008C */      swc1 $f4, 0x8c($v1)
  /* 145FB0 801369D0 448A3000 */      mtc1 $t2, $f6
  .L801369D4:
  /* 145FB4 801369D4 3C01422C */       lui $at, (0x422C0000 >> 16) # 43.0
  /* 145FB8 801369D8 44812000 */      mtc1 $at, $f4 # 43.0 to cop1
  /* 145FBC 801369DC 46803020 */   cvt.s.w $f0, $f6
  /* 145FC0 801369E0 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 145FC4 801369E4 46100300 */     add.s $f12, $f0, $f16
  /* 145FC8 801369E8 46040180 */     add.s $f6, $f0, $f4
  /* 145FCC 801369EC 460C103C */    c.lt.s $f2, $f12
  /* 145FD0 801369F0 00000000 */       nop
  /* 145FD4 801369F4 45020005 */     bc1fl .L80136A0C
  /* 145FD8 801369F8 46103301 */     sub.s $f12, $f6, $f16
  /* 145FDC 801369FC 46026201 */     sub.s $f8, $f12, $f2
  /* 145FE0 80136A00 46124283 */     div.s $f10, $f8, $f18
  /* 145FE4 80136A04 E46A0090 */      swc1 $f10, 0x90($v1)
  /* 145FE8 80136A08 46103301 */     sub.s $f12, $f6, $f16
  .L80136A0C:
  /* 145FEC 80136A0C 4602603C */    c.lt.s $f12, $f2
  /* 145FF0 80136A10 00000000 */       nop
  /* 145FF4 80136A14 45020008 */     bc1fl .L80136A38
  /* 145FF8 80136A18 8FBF0014 */        lw $ra, 0x14($sp)
  /* 145FFC 80136A1C 460C1201 */     sub.s $f8, $f2, $f12
  /* 146000 80136A20 44815000 */      mtc1 $at, $f10 # -1.0 to cop1
  /* 146004 80136A24 00000000 */       nop
  /* 146008 80136A28 460A4102 */     mul.s $f4, $f8, $f10
  /* 14600C 80136A2C 46122183 */     div.s $f6, $f4, $f18
  /* 146010 80136A30 E4660090 */      swc1 $f6, 0x90($v1)
  /* 146014 80136A34 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136A38:
  /* 146018 80136A38 27BD0038 */     addiu $sp, $sp, 0x38
  /* 14601C 80136A3C 03E00008 */        jr $ra
  /* 146020 80136A40 00000000 */       nop

glabel mnTrainingAutopositionPlacedToken
  /* 146024 80136A44 3C028014 */       lui $v0, %hi(gMNTrainingHumanPanelPort)
  /* 146028 80136A48 8C428894 */        lw $v0, %lo(gMNTrainingHumanPanelPort)($v0)
  /* 14602C 80136A4C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 146030 80136A50 AFBF0014 */        sw $ra, 0x14($sp)
  /* 146034 80136A54 14820004 */       bne $a0, $v0, .L80136A68
  /* 146038 80136A58 00803825 */        or $a3, $a0, $zero
  /* 14603C 80136A5C 3C058014 */       lui $a1, %hi(gMNTrainingCPUPanelPort)
  /* 146040 80136A60 10000002 */         b .L80136A6C
  /* 146044 80136A64 8CA58898 */        lw $a1, %lo(gMNTrainingCPUPanelPort)($a1)
  .L80136A68:
  /* 146048 80136A68 00402825 */        or $a1, $v0, $zero
  .L80136A6C:
  /* 14604C 80136A6C 10E5001B */       beq $a3, $a1, .L80136ADC
  /* 146050 80136A70 00055880 */       sll $t3, $a1, 2
  /* 146054 80136A74 00077080 */       sll $t6, $a3, 2
  /* 146058 80136A78 01C77023 */      subu $t6, $t6, $a3
  /* 14605C 80136A7C 000E70C0 */       sll $t6, $t6, 3
  /* 146060 80136A80 01C77023 */      subu $t6, $t6, $a3
  /* 146064 80136A84 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 146068 80136A88 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 14606C 80136A8C 000E70C0 */       sll $t6, $t6, 3
  /* 146070 80136A90 01CF1821 */      addu $v1, $t6, $t7
  /* 146074 80136A94 8C780054 */        lw $t8, 0x54($v1)
  /* 146078 80136A98 00E02025 */        or $a0, $a3, $zero
  /* 14607C 80136A9C 5300000C */      beql $t8, $zero, .L80136AD0
  /* 146080 80136AA0 00054880 */       sll $t1, $a1, 2
  /* 146084 80136AA4 AFA30024 */        sw $v1, 0x24($sp)
  /* 146088 80136AA8 AFA5003C */        sw $a1, 0x3c($sp)
  /* 14608C 80136AAC 0C04D9B4 */       jal getTrainingTokenDistance
  /* 146090 80136AB0 AFA70040 */        sw $a3, 0x40($sp)
  /* 146094 80136AB4 8FA5003C */        lw $a1, 0x3c($sp)
  /* 146098 80136AB8 8FA30024 */        lw $v1, 0x24($sp)
  /* 14609C 80136ABC 8FA70040 */        lw $a3, 0x40($sp)
  /* 1460A0 80136AC0 0005C880 */       sll $t9, $a1, 2
  /* 1460A4 80136AC4 03B94021 */      addu $t0, $sp, $t9
  /* 1460A8 80136AC8 E500002C */      swc1 $f0, 0x2c($t0)
  /* 1460AC 80136ACC 00054880 */       sll $t1, $a1, 2
  .L80136AD0:
  /* 1460B0 80136AD0 27AA002C */     addiu $t2, $sp, 0x2c
  /* 1460B4 80136AD4 1000000E */         b .L80136B10
  /* 1460B8 80136AD8 012A1021 */      addu $v0, $t1, $t2
  .L80136ADC:
  /* 1460BC 80136ADC 00076880 */       sll $t5, $a3, 2
  /* 1460C0 80136AE0 01A76823 */      subu $t5, $t5, $a3
  /* 1460C4 80136AE4 3C01BF80 */       lui $at, (0xBF800000 >> 16) # -1.0
  /* 1460C8 80136AE8 44812000 */      mtc1 $at, $f4 # -1.0 to cop1
  /* 1460CC 80136AEC 000D68C0 */       sll $t5, $t5, 3
  /* 1460D0 80136AF0 01A76823 */      subu $t5, $t5, $a3
  /* 1460D4 80136AF4 27AC002C */     addiu $t4, $sp, 0x2c
  /* 1460D8 80136AF8 3C0E8014 */       lui $t6, %hi(gMNTrainingPanels)
  /* 1460DC 80136AFC 25CE8558 */     addiu $t6, $t6, %lo(gMNTrainingPanels)
  /* 1460E0 80136B00 016C1021 */      addu $v0, $t3, $t4
  /* 1460E4 80136B04 000D68C0 */       sll $t5, $t5, 3
  /* 1460E8 80136B08 01AE1821 */      addu $v1, $t5, $t6
  /* 1460EC 80136B0C E4440000 */      swc1 $f4, ($v0)
  .L80136B10:
  /* 1460F0 80136B10 44800000 */      mtc1 $zero, $f0
  /* 1460F4 80136B14 C4420000 */      lwc1 $f2, ($v0)
  /* 1460F8 80136B18 00057880 */       sll $t7, $a1, 2
  /* 1460FC 80136B1C 01E57823 */      subu $t7, $t7, $a1
  /* 146100 80136B20 4602003E */    c.le.s $f0, $f2
  /* 146104 80136B24 000F78C0 */       sll $t7, $t7, 3
  /* 146108 80136B28 3C014170 */       lui $at, (0x41700000 >> 16) # 15.0
  /* 14610C 80136B2C E460008C */      swc1 $f0, 0x8c($v1)
  /* 146110 80136B30 45000009 */      bc1f .L80136B58
  /* 146114 80136B34 E4600090 */      swc1 $f0, 0x90($v1)
  /* 146118 80136B38 44810000 */      mtc1 $at, $f0 # 15.0 to cop1
  /* 14611C 80136B3C 00000000 */       nop
  /* 146120 80136B40 4600103E */    c.le.s $f2, $f0
  /* 146124 80136B44 00000000 */       nop
  /* 146128 80136B48 45020004 */     bc1fl .L80136B5C
  /* 14612C 80136B4C 3C014170 */       lui $at, 0x4170
  /* 146130 80136B50 10000004 */         b .L80136B64
  /* 146134 80136B54 24020001 */     addiu $v0, $zero, 1
  .L80136B58:
  /* 146138 80136B58 3C014170 */       lui $at, (0x41700000 >> 16) # 15.0
  .L80136B5C:
  /* 14613C 80136B5C 44810000 */      mtc1 $at, $f0 # 15.0 to cop1
  /* 146140 80136B60 00001025 */        or $v0, $zero, $zero
  .L80136B64:
  /* 146144 80136B64 10400018 */      beqz $v0, .L80136BC8
  /* 146148 80136B68 01E57823 */      subu $t7, $t7, $a1
  /* 14614C 80136B6C 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 146150 80136B70 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 146154 80136B74 000F78C0 */       sll $t7, $t7, 3
  /* 146158 80136B78 01F82021 */      addu $a0, $t7, $t8
  /* 14615C 80136B7C 8C990048 */        lw $t9, 0x48($a0)
  /* 146160 80136B80 8C620048 */        lw $v0, 0x48($v1)
  /* 146164 80136B84 2401001C */     addiu $at, $zero, 0x1c
  /* 146168 80136B88 1459000F */       bne $v0, $t9, .L80136BC8
  /* 14616C 80136B8C 00000000 */       nop
  /* 146170 80136B90 1041000D */       beq $v0, $at, .L80136BC8
  /* 146174 80136B94 00000000 */       nop
  /* 146178 80136B98 8C880054 */        lw $t0, 0x54($a0)
  /* 14617C 80136B9C 24010001 */     addiu $at, $zero, 1
  /* 146180 80136BA0 15010009 */       bne $t0, $at, .L80136BC8
  /* 146184 80136BA4 00000000 */       nop
  /* 146188 80136BA8 46020181 */     sub.s $f6, $f0, $f2
  /* 14618C 80136BAC 00E02025 */        or $a0, $a3, $zero
  /* 146190 80136BB0 AFA70040 */        sw $a3, 0x40($sp)
  /* 146194 80136BB4 46003203 */     div.s $f8, $f6, $f0
  /* 146198 80136BB8 44064000 */      mfc1 $a2, $f8
  /* 14619C 80136BBC 0C04D9D2 */       jal mnTrainingAutopositionOverlappedTokens
  /* 1461A0 80136BC0 00000000 */       nop
  /* 1461A4 80136BC4 8FA70040 */        lw $a3, 0x40($sp)
  .L80136BC8:
  /* 1461A8 80136BC8 0C04DA22 */       jal mnTrainingAutopositionTokenFromPortraitEdges
  /* 1461AC 80136BCC 00E02025 */        or $a0, $a3, $zero
  /* 1461B0 80136BD0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1461B4 80136BD4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1461B8 80136BD8 03E00008 */        jr $ra
  /* 1461BC 80136BDC 00000000 */       nop

glabel mnTrainingAutopositionRecalledToken
  /* 1461C0 80136BE0 00047080 */       sll $t6, $a0, 2
  /* 1461C4 80136BE4 01C47023 */      subu $t6, $t6, $a0
  /* 1461C8 80136BE8 000E70C0 */       sll $t6, $t6, 3
  /* 1461CC 80136BEC 01C47023 */      subu $t6, $t6, $a0
  /* 1461D0 80136BF0 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 1461D4 80136BF4 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 1461D8 80136BF8 000E70C0 */       sll $t6, $t6, 3
  /* 1461DC 80136BFC 01CF1021 */      addu $v0, $t6, $t7
  /* 1461E0 80136C00 8C580074 */        lw $t8, 0x74($v0)
  /* 1461E4 80136C04 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1461E8 80136C08 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1461EC 80136C0C 27190001 */     addiu $t9, $t8, 1
  /* 1461F0 80136C10 2B21000B */      slti $at, $t9, 0xb
  /* 1461F4 80136C14 AC590074 */        sw $t9, 0x74($v0)
  /* 1461F8 80136C18 1020001A */      beqz $at, .L80136C84
  /* 1461FC 80136C1C 03201825 */        or $v1, $t9, $zero
  /* 146200 80136C20 C4440064 */      lwc1 $f4, 0x64($v0)
  /* 146204 80136C24 C4460060 */      lwc1 $f6, 0x60($v0)
  /* 146208 80136C28 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 14620C 80136C2C 44815000 */      mtc1 $at, $f10 # 10.0 to cop1
  /* 146210 80136C30 46062201 */     sub.s $f8, $f4, $f6
  /* 146214 80136C34 2B210006 */      slti $at, $t9, 6
  /* 146218 80136C38 10200008 */      beqz $at, .L80136C5C
  /* 14621C 80136C3C 460A4083 */     div.s $f2, $f8, $f10
  /* 146220 80136C40 C450006C */      lwc1 $f16, 0x6c($v0)
  /* 146224 80136C44 C4520068 */      lwc1 $f18, 0x68($v0)
  /* 146228 80136C48 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 14622C 80136C4C 44813000 */      mtc1 $at, $f6 # 5.0 to cop1
  /* 146230 80136C50 46128101 */     sub.s $f4, $f16, $f18
  /* 146234 80136C54 10000007 */         b .L80136C74
  /* 146238 80136C58 46062003 */     div.s $f0, $f4, $f6
  .L80136C5C:
  /* 14623C 80136C5C C4480070 */      lwc1 $f8, 0x70($v0)
  /* 146240 80136C60 C44A006C */      lwc1 $f10, 0x6c($v0)
  /* 146244 80136C64 3C0140A0 */       lui $at, (0x40A00000 >> 16) # 5.0
  /* 146248 80136C68 44819000 */      mtc1 $at, $f18 # 5.0 to cop1
  /* 14624C 80136C6C 460A4401 */     sub.s $f16, $f8, $f10
  /* 146250 80136C70 46128003 */     div.s $f0, $f16, $f18
  .L80136C74:
  /* 146254 80136C74 E442008C */      swc1 $f2, 0x8c($v0)
  /* 146258 80136C78 E4400090 */      swc1 $f0, 0x90($v0)
  /* 14625C 80136C7C 1000000B */         b .L80136CAC
  /* 146260 80136C80 8C430074 */        lw $v1, 0x74($v0)
  .L80136C84:
  /* 146264 80136C84 2401000B */     addiu $at, $zero, 0xb
  /* 146268 80136C88 14610008 */       bne $v1, $at, .L80136CAC
  /* 14626C 80136C8C 00802825 */        or $a1, $a0, $zero
  /* 146270 80136C90 0C04D332 */       jal mnTrainingHandleCursorPickup
  /* 146274 80136C94 AFA2001C */        sw $v0, 0x1c($sp)
  /* 146278 80136C98 8FA2001C */        lw $v0, 0x1c($sp)
  /* 14627C 80136C9C 44800000 */      mtc1 $zero, $f0
  /* 146280 80136CA0 8C430074 */        lw $v1, 0x74($v0)
  /* 146284 80136CA4 E440008C */      swc1 $f0, 0x8c($v0)
  /* 146288 80136CA8 E4400090 */      swc1 $f0, 0x90($v0)
  .L80136CAC:
  /* 14628C 80136CAC 2401001E */     addiu $at, $zero, 0x1e
  /* 146290 80136CB0 54610003 */      bnel $v1, $at, .L80136CC0
  /* 146294 80136CB4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 146298 80136CB8 AC400058 */        sw $zero, 0x58($v0)
  /* 14629C 80136CBC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136CC0:
  /* 1462A0 80136CC0 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1462A4 80136CC4 03E00008 */        jr $ra
  /* 1462A8 80136CC8 00000000 */       nop

glabel mnTrainingAutopositionToken
  /* 1462AC 80136CCC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1462B0 80136CD0 AFA40018 */        sw $a0, 0x18($sp)
  /* 1462B4 80136CD4 3C048014 */       lui $a0, %hi(gMNTrainingHumanPanelPort)
  /* 1462B8 80136CD8 8C848894 */        lw $a0, %lo(gMNTrainingHumanPanelPort)($a0)
  /* 1462BC 80136CDC 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 1462C0 80136CE0 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 1462C4 80136CE4 00047080 */       sll $t6, $a0, 2
  /* 1462C8 80136CE8 01C47023 */      subu $t6, $t6, $a0
  /* 1462CC 80136CEC 000E70C0 */       sll $t6, $t6, 3
  /* 1462D0 80136CF0 01C47023 */      subu $t6, $t6, $a0
  /* 1462D4 80136CF4 000E70C0 */       sll $t6, $t6, 3
  /* 1462D8 80136CF8 01CF1021 */      addu $v0, $t6, $t7
  /* 1462DC 80136CFC 8C580058 */        lw $t8, 0x58($v0)
  /* 1462E0 80136D00 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1462E4 80136D04 5300000E */      beql $t8, $zero, .L80136D40
  /* 1462E8 80136D08 8C490054 */        lw $t1, 0x54($v0)
  /* 1462EC 80136D0C 0C04DAF8 */       jal mnTrainingAutopositionRecalledToken
  /* 1462F0 80136D10 00000000 */       nop
  /* 1462F4 80136D14 3C048014 */       lui $a0, %hi(gMNTrainingHumanPanelPort)
  /* 1462F8 80136D18 8C848894 */        lw $a0, %lo(gMNTrainingHumanPanelPort)($a0)
  /* 1462FC 80136D1C 3C088014 */       lui $t0, %hi(gMNTrainingPanels)
  /* 146300 80136D20 25088558 */     addiu $t0, $t0, %lo(gMNTrainingPanels)
  /* 146304 80136D24 0004C880 */       sll $t9, $a0, 2
  /* 146308 80136D28 0324C823 */      subu $t9, $t9, $a0
  /* 14630C 80136D2C 0019C8C0 */       sll $t9, $t9, 3
  /* 146310 80136D30 0324C823 */      subu $t9, $t9, $a0
  /* 146314 80136D34 0019C8C0 */       sll $t9, $t9, 3
  /* 146318 80136D38 03281021 */      addu $v0, $t9, $t0
  /* 14631C 80136D3C 8C490054 */        lw $t1, 0x54($v0)
  .L80136D40:
  /* 146320 80136D40 11200003 */      beqz $t1, .L80136D50
  /* 146324 80136D44 00000000 */       nop
  /* 146328 80136D48 0C04DA91 */       jal mnTrainingAutopositionPlacedToken
  /* 14632C 80136D4C 00000000 */       nop
  .L80136D50:
  /* 146330 80136D50 3C048014 */       lui $a0, %hi(gMNTrainingCPUPanelPort)
  /* 146334 80136D54 8C848898 */        lw $a0, %lo(gMNTrainingCPUPanelPort)($a0)
  /* 146338 80136D58 3C0B8014 */       lui $t3, %hi(gMNTrainingPanels)
  /* 14633C 80136D5C 256B8558 */     addiu $t3, $t3, %lo(gMNTrainingPanels)
  /* 146340 80136D60 00045080 */       sll $t2, $a0, 2
  /* 146344 80136D64 01445023 */      subu $t2, $t2, $a0
  /* 146348 80136D68 000A50C0 */       sll $t2, $t2, 3
  /* 14634C 80136D6C 01445023 */      subu $t2, $t2, $a0
  /* 146350 80136D70 000A50C0 */       sll $t2, $t2, 3
  /* 146354 80136D74 014B1021 */      addu $v0, $t2, $t3
  /* 146358 80136D78 8C4C0058 */        lw $t4, 0x58($v0)
  /* 14635C 80136D7C 5180000E */      beql $t4, $zero, .L80136DB8
  /* 146360 80136D80 8C4F0054 */        lw $t7, 0x54($v0)
  /* 146364 80136D84 0C04DAF8 */       jal mnTrainingAutopositionRecalledToken
  /* 146368 80136D88 00000000 */       nop
  /* 14636C 80136D8C 3C048014 */       lui $a0, %hi(gMNTrainingCPUPanelPort)
  /* 146370 80136D90 8C848898 */        lw $a0, %lo(gMNTrainingCPUPanelPort)($a0)
  /* 146374 80136D94 3C0E8014 */       lui $t6, %hi(gMNTrainingPanels)
  /* 146378 80136D98 25CE8558 */     addiu $t6, $t6, %lo(gMNTrainingPanels)
  /* 14637C 80136D9C 00046880 */       sll $t5, $a0, 2
  /* 146380 80136DA0 01A46823 */      subu $t5, $t5, $a0
  /* 146384 80136DA4 000D68C0 */       sll $t5, $t5, 3
  /* 146388 80136DA8 01A46823 */      subu $t5, $t5, $a0
  /* 14638C 80136DAC 000D68C0 */       sll $t5, $t5, 3
  /* 146390 80136DB0 01AE1021 */      addu $v0, $t5, $t6
  /* 146394 80136DB4 8C4F0054 */        lw $t7, 0x54($v0)
  .L80136DB8:
  /* 146398 80136DB8 51E00004 */      beql $t7, $zero, .L80136DCC
  /* 14639C 80136DBC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1463A0 80136DC0 0C04DA91 */       jal mnTrainingAutopositionPlacedToken
  /* 1463A4 80136DC4 00000000 */       nop
  /* 1463A8 80136DC8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136DCC:
  /* 1463AC 80136DCC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1463B0 80136DD0 03E00008 */        jr $ra
  /* 1463B4 80136DD4 00000000 */       nop

glabel mnTrainingCreateTokenAutopositionRoutine
  /* 1463B8 80136DD8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1463BC 80136DDC AFBF0014 */        sw $ra, 0x14($sp)
  /* 1463C0 80136DE0 00002025 */        or $a0, $zero, $zero
  /* 1463C4 80136DE4 00002825 */        or $a1, $zero, $zero
  /* 1463C8 80136DE8 2406001A */     addiu $a2, $zero, 0x1a
  /* 1463CC 80136DEC 0C00265A */       jal omMakeGObjSPAfter
  /* 1463D0 80136DF0 3C078000 */       lui $a3, 0x8000
  /* 1463D4 80136DF4 3C058013 */       lui $a1, %hi(mnTrainingAutopositionToken)
  /* 1463D8 80136DF8 24A56CCC */     addiu $a1, $a1, %lo(mnTrainingAutopositionToken)
  /* 1463DC 80136DFC 00402025 */        or $a0, $v0, $zero
  /* 1463E0 80136E00 24060001 */     addiu $a2, $zero, 1
  /* 1463E4 80136E04 0C002062 */       jal omAddGObjCommonProc
  /* 1463E8 80136E08 24070001 */     addiu $a3, $zero, 1
  /* 1463EC 80136E0C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1463F0 80136E10 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1463F4 80136E14 03E00008 */        jr $ra
  /* 1463F8 80136E18 00000000 */       nop

glabel mnTrainingUpdateTokenShinePulseColor
  /* 1463FC 80136E1C 3C038014 */       lui $v1, %hi(gMNTrainingIsTokenShineIncreasing)
  /* 146400 80136E20 24638878 */     addiu $v1, $v1, %lo(gMNTrainingIsTokenShineIncreasing)
  /* 146404 80136E24 8C620000 */        lw $v0, ($v1) # gMNTrainingIsTokenShineIncreasing + 0
  /* 146408 80136E28 AFA40000 */        sw $a0, ($sp)
  /* 14640C 80136E2C 3C048014 */       lui $a0, %hi(gMNTrainingTokenShinePulseColor)
  /* 146410 80136E30 1440000A */      bnez $v0, .L80136E5C
  /* 146414 80136E34 24848874 */     addiu $a0, $a0, %lo(gMNTrainingTokenShinePulseColor)
  /* 146418 80136E38 8C8E0000 */        lw $t6, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 14641C 80136E3C 241900FF */     addiu $t9, $zero, 0xff
  /* 146420 80136E40 25CF0009 */     addiu $t7, $t6, 9
  /* 146424 80136E44 29E10100 */      slti $at, $t7, 0x100
  /* 146428 80136E48 14200004 */      bnez $at, .L80136E5C
  /* 14642C 80136E4C AC8F0000 */        sw $t7, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 146430 80136E50 24020001 */     addiu $v0, $zero, 1
  /* 146434 80136E54 AC990000 */        sw $t9, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 146438 80136E58 AC620000 */        sw $v0, ($v1) # gMNTrainingIsTokenShineIncreasing + 0
  .L80136E5C:
  /* 14643C 80136E5C 3C048014 */       lui $a0, %hi(gMNTrainingTokenShinePulseColor)
  /* 146440 80136E60 24010001 */     addiu $at, $zero, 1
  /* 146444 80136E64 14410009 */       bne $v0, $at, .L80136E8C
  /* 146448 80136E68 24848874 */     addiu $a0, $a0, %lo(gMNTrainingTokenShinePulseColor)
  /* 14644C 80136E6C 8C890000 */        lw $t1, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 146450 80136E70 240C0080 */     addiu $t4, $zero, 0x80
  /* 146454 80136E74 252AFFF7 */     addiu $t2, $t1, -9
  /* 146458 80136E78 29410080 */      slti $at, $t2, 0x80
  /* 14645C 80136E7C 10200003 */      beqz $at, .L80136E8C
  /* 146460 80136E80 AC8A0000 */        sw $t2, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 146464 80136E84 AC8C0000 */        sw $t4, ($a0) # gMNTrainingTokenShinePulseColor + 0
  /* 146468 80136E88 AC600000 */        sw $zero, ($v1) # gMNTrainingIsTokenShineIncreasing + 0
  .L80136E8C:
  /* 14646C 80136E8C 03E00008 */        jr $ra
  /* 146470 80136E90 00000000 */       nop

glabel mnTrainingCreateTokenShinePulseRoutine
  /* 146474 80136E94 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 146478 80136E98 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14647C 80136E9C 00002025 */        or $a0, $zero, $zero
  /* 146480 80136EA0 00002825 */        or $a1, $zero, $zero
  /* 146484 80136EA4 2406001A */     addiu $a2, $zero, 0x1a
  /* 146488 80136EA8 0C00265A */       jal omMakeGObjSPAfter
  /* 14648C 80136EAC 3C078000 */       lui $a3, 0x8000
  /* 146490 80136EB0 3C058013 */       lui $a1, %hi(mnTrainingUpdateTokenShinePulseColor)
  /* 146494 80136EB4 24A56E1C */     addiu $a1, $a1, %lo(mnTrainingUpdateTokenShinePulseColor)
  /* 146498 80136EB8 00402025 */        or $a0, $v0, $zero
  /* 14649C 80136EBC 24060001 */     addiu $a2, $zero, 1
  /* 1464A0 80136EC0 0C002062 */       jal omAddGObjCommonProc
  /* 1464A4 80136EC4 24070001 */     addiu $a3, $zero, 1
  /* 1464A8 80136EC8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1464AC 80136ECC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1464B0 80136ED0 03E00008 */        jr $ra
  /* 1464B4 80136ED4 00000000 */       nop

glabel mnTrainingSyncShadeAndCostume
  /* 1464B8 80136ED8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1464BC 80136EDC AFB30020 */        sw $s3, 0x20($sp)
  /* 1464C0 80136EE0 AFB00014 */        sw $s0, 0x14($sp)
  /* 1464C4 80136EE4 AFB2001C */        sw $s2, 0x1c($sp)
  /* 1464C8 80136EE8 3C108014 */       lui $s0, %hi(gMNTrainingPanels)
  /* 1464CC 80136EEC 3C138014 */       lui $s3, %hi(D_ovl28_80138838)
  /* 1464D0 80136EF0 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1464D4 80136EF4 AFB10018 */        sw $s1, 0x18($sp)
  /* 1464D8 80136EF8 AFA40028 */        sw $a0, 0x28($sp)
  /* 1464DC 80136EFC 26738838 */     addiu $s3, $s3, %lo(D_ovl28_80138838)
  /* 1464E0 80136F00 26108558 */     addiu $s0, $s0, %lo(gMNTrainingPanels)
  /* 1464E4 80136F04 2412001C */     addiu $s2, $zero, 0x1c
  /* 1464E8 80136F08 8E040048 */        lw $a0, 0x48($s0) # gMNTrainingPanels + 72
  .L80136F0C:
  /* 1464EC 80136F0C 52440014 */      beql $s2, $a0, .L80136F60
  /* 1464F0 80136F10 261000B8 */     addiu $s0, $s0, 0xb8
  /* 1464F4 80136F14 0C04CCB7 */       jal mnTrainingGetAdditionalSelectedCount
  /* 1464F8 80136F18 00000000 */       nop
  /* 1464FC 80136F1C 1440000F */      bnez $v0, .L80136F5C
  /* 146500 80136F20 00002825 */        or $a1, $zero, $zero
  /* 146504 80136F24 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 146508 80136F28 8E040048 */        lw $a0, 0x48($s0) # gMNTrainingPanels + 72
  /* 14650C 80136F2C 8E0E004C */        lw $t6, 0x4c($s0) # gMNTrainingPanels + 76
  /* 146510 80136F30 00408825 */        or $s1, $v0, $zero
  /* 146514 80136F34 504E000A */      beql $v0, $t6, .L80136F60
  /* 146518 80136F38 261000B8 */     addiu $s0, $s0, 0xb8
  /* 14651C 80136F3C 8E0F0084 */        lw $t7, 0x84($s0) # gMNTrainingPanels + 132
  /* 146520 80136F40 00402825 */        or $a1, $v0, $zero
  /* 146524 80136F44 00003025 */        or $a2, $zero, $zero
  /* 146528 80136F48 55E00005 */      bnel $t7, $zero, .L80136F60
  /* 14652C 80136F4C 261000B8 */     addiu $s0, $s0, 0xb8
  /* 146530 80136F50 0C03A492 */       jal func_ovl2_800E9248
  /* 146534 80136F54 8E040008 */        lw $a0, 8($s0) # gMNTrainingPanels + 8
  /* 146538 80136F58 AE11004C */        sw $s1, 0x4c($s0) # gMNTrainingPanels + 76
  .L80136F5C:
  /* 14653C 80136F5C 261000B8 */     addiu $s0, $s0, 0xb8
  .L80136F60:
  /* 146540 80136F60 5613FFEA */      bnel $s0, $s3, .L80136F0C
  /* 146544 80136F64 8E040048 */        lw $a0, 0x48($s0) # gMNTrainingPanels + 72
  /* 146548 80136F68 8FBF0024 */        lw $ra, 0x24($sp)
  /* 14654C 80136F6C 8FB00014 */        lw $s0, 0x14($sp)
  /* 146550 80136F70 8FB10018 */        lw $s1, 0x18($sp)
  /* 146554 80136F74 8FB2001C */        lw $s2, 0x1c($sp)
  /* 146558 80136F78 8FB30020 */        lw $s3, 0x20($sp)
  /* 14655C 80136F7C 03E00008 */        jr $ra
  /* 146560 80136F80 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnTrainingCreateSyncShadeAndCostumeRoutine
  /* 146564 80136F84 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 146568 80136F88 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14656C 80136F8C 00002025 */        or $a0, $zero, $zero
  /* 146570 80136F90 00002825 */        or $a1, $zero, $zero
  /* 146574 80136F94 2406001F */     addiu $a2, $zero, 0x1f
  /* 146578 80136F98 0C00265A */       jal omMakeGObjSPAfter
  /* 14657C 80136F9C 3C078000 */       lui $a3, 0x8000
  /* 146580 80136FA0 3C058013 */       lui $a1, %hi(mnTrainingSyncShadeAndCostume)
  /* 146584 80136FA4 24A56ED8 */     addiu $a1, $a1, %lo(mnTrainingSyncShadeAndCostume)
  /* 146588 80136FA8 00402025 */        or $a0, $v0, $zero
  /* 14658C 80136FAC 24060001 */     addiu $a2, $zero, 1
  /* 146590 80136FB0 0C002062 */       jal omAddGObjCommonProc
  /* 146594 80136FB4 24070001 */     addiu $a3, $zero, 1
  /* 146598 80136FB8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14659C 80136FBC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1465A0 80136FC0 03E00008 */        jr $ra
  /* 1465A4 80136FC4 00000000 */       nop

glabel mnTrainingSyncWhiteCircleSizeAndDisplay
  /* 1465A8 80136FC8 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1465AC 80136FCC 3C0E8014 */       lui $t6, %hi(dMNTrainingWhiteCircleSizes)
  /* 1465B0 80136FD0 27A50004 */     addiu $a1, $sp, 4
  /* 1465B4 80136FD4 25CE83FC */     addiu $t6, $t6, %lo(dMNTrainingWhiteCircleSizes)
  /* 1465B8 80136FD8 8C820084 */        lw $v0, 0x84($a0)
  /* 1465BC 80136FDC 25C80030 */     addiu $t0, $t6, 0x30
  /* 1465C0 80136FE0 00A0C825 */        or $t9, $a1, $zero
  .L80136FE4:
  /* 1465C4 80136FE4 8DD80000 */        lw $t8, ($t6) # dMNTrainingWhiteCircleSizes + 0
  /* 1465C8 80136FE8 25CE000C */     addiu $t6, $t6, 0xc
  /* 1465CC 80136FEC 2739000C */     addiu $t9, $t9, 0xc
  /* 1465D0 80136FF0 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1465D4 80136FF4 8DCFFFF8 */        lw $t7, -8($t6) # dMNTrainingWhiteCircleSizes + -8
  /* 1465D8 80136FF8 AF2FFFF8 */        sw $t7, -8($t9)
  /* 1465DC 80136FFC 8DD8FFFC */        lw $t8, -4($t6) # dMNTrainingWhiteCircleSizes + -4
  /* 1465E0 80137000 15C8FFF8 */       bne $t6, $t0, .L80136FE4
  /* 1465E4 80137004 AF38FFFC */        sw $t8, -4($t9)
  /* 1465E8 80137008 00024880 */       sll $t1, $v0, 2
  /* 1465EC 8013700C 01224823 */      subu $t1, $t1, $v0
  /* 1465F0 80137010 000948C0 */       sll $t1, $t1, 3
  /* 1465F4 80137014 01224823 */      subu $t1, $t1, $v0
  /* 1465F8 80137018 3C0A8014 */       lui $t2, %hi(gMNTrainingPanels)
  /* 1465FC 8013701C 254A8558 */     addiu $t2, $t2, %lo(gMNTrainingPanels)
  /* 146600 80137020 000948C0 */       sll $t1, $t1, 3
  /* 146604 80137024 012A1821 */      addu $v1, $t1, $t2
  /* 146608 80137028 8C6B0084 */        lw $t3, 0x84($v1)
  /* 14660C 8013702C 55600020 */      bnel $t3, $zero, .L801370B0
  /* 146610 80137030 24020001 */     addiu $v0, $zero, 1
  /* 146614 80137034 8C6C0048 */        lw $t4, 0x48($v1)
  /* 146618 80137038 2401001C */     addiu $at, $zero, 0x1c
  /* 14661C 8013703C 5181001C */      beql $t4, $at, .L801370B0
  /* 146620 80137040 24020001 */     addiu $v0, $zero, 1
  /* 146624 80137044 8C8D007C */        lw $t5, 0x7c($a0)
  /* 146628 80137048 24020001 */     addiu $v0, $zero, 1
  /* 14662C 8013704C 544D0004 */      bnel $v0, $t5, .L80137060
  /* 146630 80137050 AC82007C */        sw $v0, 0x7c($a0)
  /* 146634 80137054 10000002 */         b .L80137060
  /* 146638 80137058 AC80007C */        sw $zero, 0x7c($a0)
  /* 14663C 8013705C AC82007C */        sw $v0, 0x7c($a0)
  .L80137060:
  /* 146640 80137060 8C680048 */        lw $t0, 0x48($v1)
  /* 146644 80137064 8C8F0074 */        lw $t7, 0x74($a0)
  /* 146648 80137068 00087080 */       sll $t6, $t0, 2
  /* 14664C 8013706C 00AEC821 */      addu $t9, $a1, $t6
  /* 146650 80137070 C7240000 */      lwc1 $f4, ($t9)
  /* 146654 80137074 E5E40040 */      swc1 $f4, 0x40($t7)
  /* 146658 80137078 8C780048 */        lw $t8, 0x48($v1)
  /* 14665C 8013707C 8C8B0074 */        lw $t3, 0x74($a0)
  /* 146660 80137080 00184880 */       sll $t1, $t8, 2
  /* 146664 80137084 00A95021 */      addu $t2, $a1, $t1
  /* 146668 80137088 C5460000 */      lwc1 $f6, ($t2) # gMNTrainingPanels + 0
  /* 14666C 8013708C E5660044 */      swc1 $f6, 0x44($t3)
  /* 146670 80137090 8C6C0048 */        lw $t4, 0x48($v1)
  /* 146674 80137094 8C8E0074 */        lw $t6, 0x74($a0)
  /* 146678 80137098 000C6880 */       sll $t5, $t4, 2
  /* 14667C 8013709C 00AD4021 */      addu $t0, $a1, $t5
  /* 146680 801370A0 C5080000 */      lwc1 $f8, ($t0)
  /* 146684 801370A4 10000003 */         b .L801370B4
  /* 146688 801370A8 E5C80044 */      swc1 $f8, 0x44($t6)
  /* 14668C 801370AC 24020001 */     addiu $v0, $zero, 1
  .L801370B0:
  /* 146690 801370B0 AC82007C */        sw $v0, 0x7c($a0)
  .L801370B4:
  /* 146694 801370B4 03E00008 */        jr $ra
  /* 146698 801370B8 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnTrainingCreateWhiteCircles
  /* 14669C 801370BC 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 1466A0 801370C0 F7BA0038 */      sdc1 $f26, 0x38($sp)
  /* 1466A4 801370C4 3C018014 */       lui $at, %hi(D_ovl28_80138538)
  /* 1466A8 801370C8 C43A8538 */      lwc1 $f26, %lo(D_ovl28_80138538)($at)
  /* 1466AC 801370CC F7B80030 */      sdc1 $f24, 0x30($sp)
  /* 1466B0 801370D0 3C018014 */       lui $at, %hi(D_ovl28_8013853C)
  /* 1466B4 801370D4 AFBE0060 */        sw $fp, 0x60($sp)
  /* 1466B8 801370D8 AFB7005C */        sw $s7, 0x5c($sp)
  /* 1466BC 801370DC AFB60058 */        sw $s6, 0x58($sp)
  /* 1466C0 801370E0 AFB50054 */        sw $s5, 0x54($sp)
  /* 1466C4 801370E4 AFB40050 */        sw $s4, 0x50($sp)
  /* 1466C8 801370E8 AFB3004C */        sw $s3, 0x4c($sp)
  /* 1466CC 801370EC F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 1466D0 801370F0 C438853C */      lwc1 $f24, %lo(D_ovl28_8013853C)($at)
  /* 1466D4 801370F4 AFB20048 */        sw $s2, 0x48($sp)
  /* 1466D8 801370F8 AFB10044 */        sw $s1, 0x44($sp)
  /* 1466DC 801370FC F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 1466E0 80137100 3C018014 */       lui $at, %hi(D_ovl28_80138540)
  /* 1466E4 80137104 3C138014 */       lui $s3, %hi(D_ovl28_80138C98)
  /* 1466E8 80137108 3C140000 */       lui $s4, %hi(D_NF_00000568)
  /* 1466EC 8013710C 3C158001 */       lui $s5, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 1466F0 80137110 3C160000 */       lui $s6, %hi(D_NF_00000408)
  /* 1466F4 80137114 3C178013 */       lui $s7, %hi(mnTrainingSyncWhiteCircleSizeAndDisplay)
  /* 1466F8 80137118 3C1E8014 */       lui $fp, %hi(gMNTrainingHumanPanelPort)
  /* 1466FC 8013711C 4480B000 */      mtc1 $zero, $f22
  /* 146700 80137120 AFBF0064 */        sw $ra, 0x64($sp)
  /* 146704 80137124 AFB00040 */        sw $s0, 0x40($sp)
  /* 146708 80137128 27DE8894 */     addiu $fp, $fp, %lo(gMNTrainingHumanPanelPort)
  /* 14670C 8013712C 26F76FC8 */     addiu $s7, $s7, %lo(mnTrainingSyncWhiteCircleSizeAndDisplay)
  /* 146710 80137130 26D60408 */     addiu $s6, $s6, %lo(D_NF_00000408)
  /* 146714 80137134 26B54768 */     addiu $s5, $s5, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 146718 80137138 26940568 */     addiu $s4, $s4, %lo(D_NF_00000568)
  /* 14671C 8013713C 26738C98 */     addiu $s3, $s3, %lo(D_ovl28_80138C98)
  /* 146720 80137140 C4348540 */      lwc1 $f20, %lo(D_ovl28_80138540)($at)
  /* 146724 80137144 00008825 */        or $s1, $zero, $zero
  /* 146728 80137148 3C128000 */       lui $s2, 0x8000
  /* 14672C 8013714C 00002025 */        or $a0, $zero, $zero
  .L80137150:
  /* 146730 80137150 00002825 */        or $a1, $zero, $zero
  /* 146734 80137154 24060015 */     addiu $a2, $zero, 0x15
  /* 146738 80137158 0C00265A */       jal omMakeGObjSPAfter
  /* 14673C 8013715C 02403825 */        or $a3, $s2, $zero
  /* 146740 80137160 8E6E001C */        lw $t6, 0x1c($s3) # D_ovl28_80138C98 + 28
  /* 146744 80137164 00408025 */        or $s0, $v0, $zero
  /* 146748 80137168 00402025 */        or $a0, $v0, $zero
  /* 14674C 8013716C 00003025 */        or $a2, $zero, $zero
  /* 146750 80137170 0C003C48 */       jal func_8000F120
  /* 146754 80137174 01D42821 */      addu $a1, $t6, $s4
  /* 146758 80137178 240FFFFF */     addiu $t7, $zero, -1
  /* 14675C 8013717C AFAF0010 */        sw $t7, 0x10($sp)
  /* 146760 80137180 02002025 */        or $a0, $s0, $zero
  /* 146764 80137184 02A02825 */        or $a1, $s5, $zero
  /* 146768 80137188 24060009 */     addiu $a2, $zero, 9
  /* 14676C 8013718C 0C00277D */       jal omAddGObjRenderProc
  /* 146770 80137190 02403825 */        or $a3, $s2, $zero
  /* 146774 80137194 AE110084 */        sw $s1, 0x84($s0)
  /* 146778 80137198 8E78001C */        lw $t8, 0x1c($s3) # D_ovl28_80138C98 + 28
  /* 14677C 8013719C 02002025 */        or $a0, $s0, $zero
  /* 146780 801371A0 0C003E3D */       jal func_8000F8F4
  /* 146784 801371A4 03162821 */      addu $a1, $t8, $s6
  /* 146788 801371A8 02002025 */        or $a0, $s0, $zero
  /* 14678C 801371AC 02E02825 */        or $a1, $s7, $zero
  /* 146790 801371B0 24060001 */     addiu $a2, $zero, 1
  /* 146794 801371B4 0C002062 */       jal omAddGObjCommonProc
  /* 146798 801371B8 24070001 */     addiu $a3, $zero, 1
  /* 14679C 801371BC 0C0037CD */       jal func_8000DF34
  /* 1467A0 801371C0 02002025 */        or $a0, $s0, $zero
  /* 1467A4 801371C4 8FD90000 */        lw $t9, ($fp) # gMNTrainingHumanPanelPort + 0
  /* 1467A8 801371C8 24010004 */     addiu $at, $zero, 4
  /* 1467AC 801371CC 56390009 */      bnel $s1, $t9, .L801371F4
  /* 1467B0 801371D0 8E0B0074 */        lw $t3, 0x74($s0)
  /* 1467B4 801371D4 8E080074 */        lw $t0, 0x74($s0)
  /* 1467B8 801371D8 E518001C */      swc1 $f24, 0x1c($t0)
  /* 1467BC 801371DC 8E090074 */        lw $t1, 0x74($s0)
  /* 1467C0 801371E0 E5340020 */      swc1 $f20, 0x20($t1)
  /* 1467C4 801371E4 8E0A0074 */        lw $t2, 0x74($s0)
  /* 1467C8 801371E8 10000007 */         b .L80137208
  /* 1467CC 801371EC E5560024 */      swc1 $f22, 0x24($t2)
  /* 1467D0 801371F0 8E0B0074 */        lw $t3, 0x74($s0)
  .L801371F4:
  /* 1467D4 801371F4 E57A001C */      swc1 $f26, 0x1c($t3)
  /* 1467D8 801371F8 8E0C0074 */        lw $t4, 0x74($s0)
  /* 1467DC 801371FC E5940020 */      swc1 $f20, 0x20($t4)
  /* 1467E0 80137200 8E0D0074 */        lw $t5, 0x74($s0)
  /* 1467E4 80137204 E5B60024 */      swc1 $f22, 0x24($t5)
  .L80137208:
  /* 1467E8 80137208 26310001 */     addiu $s1, $s1, 1
  /* 1467EC 8013720C 5621FFD0 */      bnel $s1, $at, .L80137150
  /* 1467F0 80137210 00002025 */        or $a0, $zero, $zero
  /* 1467F4 80137214 8FBF0064 */        lw $ra, 0x64($sp)
  /* 1467F8 80137218 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 1467FC 8013721C D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 146800 80137220 D7B80030 */      ldc1 $f24, 0x30($sp)
  /* 146804 80137224 D7BA0038 */      ldc1 $f26, 0x38($sp)
  /* 146808 80137228 8FB00040 */        lw $s0, 0x40($sp)
  /* 14680C 8013722C 8FB10044 */        lw $s1, 0x44($sp)
  /* 146810 80137230 8FB20048 */        lw $s2, 0x48($sp)
  /* 146814 80137234 8FB3004C */        lw $s3, 0x4c($sp)
  /* 146818 80137238 8FB40050 */        lw $s4, 0x50($sp)
  /* 14681C 8013723C 8FB50054 */        lw $s5, 0x54($sp)
  /* 146820 80137240 8FB60058 */        lw $s6, 0x58($sp)
  /* 146824 80137244 8FB7005C */        lw $s7, 0x5c($sp)
  /* 146828 80137248 8FBE0060 */        lw $fp, 0x60($sp)
  /* 14682C 8013724C 03E00008 */        jr $ra
  /* 146830 80137250 27BD0068 */     addiu $sp, $sp, 0x68

glabel mnTrainingRenderReadyToFightObject
  /* 146834 80137254 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 146838 80137258 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14683C 8013725C 0C0333C0 */       jal func_ovl0_800CCF00
  /* 146840 80137260 00000000 */       nop
  /* 146844 80137264 8FBF0014 */        lw $ra, 0x14($sp)
  /* 146848 80137268 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14684C 8013726C 03E00008 */        jr $ra
  /* 146850 80137270 00000000 */       nop

glabel mnTrainingIsReadyToFight
  /* 146854 80137274 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 146858 80137278 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 14685C 8013727C 240300B8 */     addiu $v1, $zero, 0xb8
  /* 146860 80137280 3C028014 */       lui $v0, %hi(gMNTrainingPanels)
  /* 146864 80137284 01C30019 */     multu $t6, $v1
  /* 146868 80137288 24428558 */     addiu $v0, $v0, %lo(gMNTrainingPanels)
  /* 14686C 8013728C 3C088014 */       lui $t0, %hi(gMNTrainingCPUPanelPort)
  /* 146870 80137290 00007812 */      mflo $t7
  /* 146874 80137294 004FC021 */      addu $t8, $v0, $t7
  /* 146878 80137298 8F190084 */        lw $t9, 0x84($t8)
  /* 14687C 8013729C 5320000B */      beql $t9, $zero, .L801372CC
  /* 146880 801372A0 00001025 */        or $v0, $zero, $zero
  /* 146884 801372A4 8D088898 */        lw $t0, %lo(gMNTrainingCPUPanelPort)($t0)
  /* 146888 801372A8 01030019 */     multu $t0, $v1
  /* 14688C 801372AC 00004812 */      mflo $t1
  /* 146890 801372B0 00495021 */      addu $t2, $v0, $t1
  /* 146894 801372B4 8D4B0084 */        lw $t3, 0x84($t2)
  /* 146898 801372B8 51600004 */      beql $t3, $zero, .L801372CC
  /* 14689C 801372BC 00001025 */        or $v0, $zero, $zero
  /* 1468A0 801372C0 03E00008 */        jr $ra
  /* 1468A4 801372C4 24020001 */     addiu $v0, $zero, 1

  /* 1468A8 801372C8 00001025 */        or $v0, $zero, $zero
  .L801372CC:
  /* 1468AC 801372CC 03E00008 */        jr $ra
  /* 1468B0 801372D0 00000000 */       nop

glabel mnTrainingBlinkIfReadyToFight
  /* 1468B4 801372D4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1468B8 801372D8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1468BC 801372DC 0C04DC9D */       jal mnTrainingIsReadyToFight
  /* 1468C0 801372E0 AFA40018 */        sw $a0, 0x18($sp)
  /* 1468C4 801372E4 10400012 */      beqz $v0, .L80137330
  /* 1468C8 801372E8 8FA40018 */        lw $a0, 0x18($sp)
  /* 1468CC 801372EC 3C038014 */       lui $v1, %hi(gMNTrainingPressStartFlashTimer)
  /* 1468D0 801372F0 24638884 */     addiu $v1, $v1, %lo(gMNTrainingPressStartFlashTimer)
  /* 1468D4 801372F4 8C6E0000 */        lw $t6, ($v1) # gMNTrainingPressStartFlashTimer + 0
  /* 1468D8 801372F8 24010028 */     addiu $at, $zero, 0x28
  /* 1468DC 801372FC 24180001 */     addiu $t8, $zero, 1
  /* 1468E0 80137300 25C20001 */     addiu $v0, $t6, 1
  /* 1468E4 80137304 14410003 */       bne $v0, $at, .L80137314
  /* 1468E8 80137308 AC620000 */        sw $v0, ($v1) # gMNTrainingPressStartFlashTimer + 0
  /* 1468EC 8013730C AC600000 */        sw $zero, ($v1) # gMNTrainingPressStartFlashTimer + 0
  /* 1468F0 80137310 00001025 */        or $v0, $zero, $zero
  .L80137314:
  /* 1468F4 80137314 2841001E */      slti $at, $v0, 0x1e
  /* 1468F8 80137318 10200003 */      beqz $at, .L80137328
  /* 1468FC 8013731C 00000000 */       nop
  /* 146900 80137320 10000008 */         b .L80137344
  /* 146904 80137324 AC80007C */        sw $zero, 0x7c($a0)
  .L80137328:
  /* 146908 80137328 10000006 */         b .L80137344
  /* 14690C 8013732C AC98007C */        sw $t8, 0x7c($a0)
  .L80137330:
  /* 146910 80137330 3C038014 */       lui $v1, %hi(gMNTrainingPressStartFlashTimer)
  /* 146914 80137334 24190001 */     addiu $t9, $zero, 1
  /* 146918 80137338 24638884 */     addiu $v1, $v1, %lo(gMNTrainingPressStartFlashTimer)
  /* 14691C 8013733C AC99007C */        sw $t9, 0x7c($a0)
  /* 146920 80137340 AC600000 */        sw $zero, ($v1) # gMNTrainingPressStartFlashTimer + 0
  .L80137344:
  /* 146924 80137344 8FBF0014 */        lw $ra, 0x14($sp)
  /* 146928 80137348 27BD0018 */     addiu $sp, $sp, 0x18
  /* 14692C 8013734C 03E00008 */        jr $ra
  /* 146930 80137350 00000000 */       nop

glabel mnTrainingCreateReadyToFightObjects
  /* 146934 80137354 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 146938 80137358 AFBF0024 */        sw $ra, 0x24($sp)
  /* 14693C 8013735C AFB00020 */        sw $s0, 0x20($sp)
  /* 146940 80137360 00002025 */        or $a0, $zero, $zero
  /* 146944 80137364 00002825 */        or $a1, $zero, $zero
  /* 146948 80137368 24060020 */     addiu $a2, $zero, 0x20
  /* 14694C 8013736C 0C00265A */       jal omMakeGObjSPAfter
  /* 146950 80137370 3C078000 */       lui $a3, 0x8000
  /* 146954 80137374 3C058013 */       lui $a1, %hi(mnTrainingRenderReadyToFightObject)
  /* 146958 80137378 24A57254 */     addiu $a1, $a1, %lo(mnTrainingRenderReadyToFightObject)
  /* 14695C 8013737C 240EFFFF */     addiu $t6, $zero, -1
  /* 146960 80137380 00408025 */        or $s0, $v0, $zero
  /* 146964 80137384 AFAE0010 */        sw $t6, 0x10($sp)
  /* 146968 80137388 AFA5002C */        sw $a1, 0x2c($sp)
  /* 14696C 8013738C 00402025 */        or $a0, $v0, $zero
  /* 146970 80137390 24060026 */     addiu $a2, $zero, 0x26
  /* 146974 80137394 0C00277D */       jal omAddGObjRenderProc
  /* 146978 80137398 3C078000 */       lui $a3, 0x8000
  /* 14697C 8013739C 3C058013 */       lui $a1, %hi(mnTrainingBlinkIfReadyToFight)
  /* 146980 801373A0 24A572D4 */     addiu $a1, $a1, %lo(mnTrainingBlinkIfReadyToFight)
  /* 146984 801373A4 AFA50028 */        sw $a1, 0x28($sp)
  /* 146988 801373A8 02002025 */        or $a0, $s0, $zero
  /* 14698C 801373AC 24060001 */     addiu $a2, $zero, 1
  /* 146990 801373B0 0C002062 */       jal omAddGObjCommonProc
  /* 146994 801373B4 24070001 */     addiu $a3, $zero, 1
  /* 146998 801373B8 3C0F8014 */       lui $t7, %hi(D_ovl28_80138C98)
  /* 14699C 801373BC 8DEF8C98 */        lw $t7, %lo(D_ovl28_80138C98)($t7)
  /* 1469A0 801373C0 3C180001 */       lui $t8, %hi(D_NF_0000F530)
  /* 1469A4 801373C4 2718F530 */     addiu $t8, $t8, %lo(D_NF_0000F530)
  /* 1469A8 801373C8 02002025 */        or $a0, $s0, $zero
  /* 1469AC 801373CC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1469B0 801373D0 01F82821 */      addu $a1, $t7, $t8
  /* 1469B4 801373D4 94590024 */       lhu $t9, 0x24($v0)
  /* 1469B8 801373D8 3C01428E */       lui $at, (0x428E0000 >> 16) # 71.0
  /* 1469BC 801373DC 44802000 */      mtc1 $zero, $f4
  /* 1469C0 801373E0 44813000 */      mtc1 $at, $f6 # 71.0 to cop1
  /* 1469C4 801373E4 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1469C8 801373E8 A4490024 */        sh $t1, 0x24($v0)
  /* 1469CC 801373EC 352A0001 */       ori $t2, $t1, 1
  /* 1469D0 801373F0 240B00F4 */     addiu $t3, $zero, 0xf4
  /* 1469D4 801373F4 240C0056 */     addiu $t4, $zero, 0x56
  /* 1469D8 801373F8 240D007F */     addiu $t5, $zero, 0x7f
  /* 1469DC 801373FC 240E0003 */     addiu $t6, $zero, 3
  /* 1469E0 80137400 240F0140 */     addiu $t7, $zero, 0x140
  /* 1469E4 80137404 24180011 */     addiu $t8, $zero, 0x11
  /* 1469E8 80137408 A44A0024 */        sh $t2, 0x24($v0)
  /* 1469EC 8013740C A0400060 */        sb $zero, 0x60($v0)
  /* 1469F0 80137410 A0400061 */        sb $zero, 0x61($v0)
  /* 1469F4 80137414 A0400062 */        sb $zero, 0x62($v0)
  /* 1469F8 80137418 A04B0028 */        sb $t3, 0x28($v0)
  /* 1469FC 8013741C A04C0029 */        sb $t4, 0x29($v0)
  /* 146A00 80137420 A04D002A */        sb $t5, 0x2a($v0)
  /* 146A04 80137424 A0400065 */        sb $zero, 0x65($v0)
  /* 146A08 80137428 A0400064 */        sb $zero, 0x64($v0)
  /* 146A0C 8013742C A04E0067 */        sb $t6, 0x67($v0)
  /* 146A10 80137430 A0400066 */        sb $zero, 0x66($v0)
  /* 146A14 80137434 A44F0068 */        sh $t7, 0x68($v0)
  /* 146A18 80137438 A458006A */        sh $t8, 0x6a($v0)
  /* 146A1C 8013743C 3C198014 */       lui $t9, %hi(D_ovl28_80138C98)
  /* 146A20 80137440 E4440058 */      swc1 $f4, 0x58($v0)
  /* 146A24 80137444 E446005C */      swc1 $f6, 0x5c($v0)
  /* 146A28 80137448 8F398C98 */        lw $t9, %lo(D_ovl28_80138C98)($t9)
  /* 146A2C 8013744C 3C080001 */       lui $t0, %hi(D_NF_0000F448)
  /* 146A30 80137450 2508F448 */     addiu $t0, $t0, %lo(D_NF_0000F448)
  /* 146A34 80137454 02002025 */        or $a0, $s0, $zero
  /* 146A38 80137458 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 146A3C 8013745C 03282821 */      addu $a1, $t9, $t0
  /* 146A40 80137460 94490024 */       lhu $t1, 0x24($v0)
  /* 146A44 80137464 3C014248 */       lui $at, (0x42480000 >> 16) # 50.0
  /* 146A48 80137468 44814000 */      mtc1 $at, $f8 # 50.0 to cop1
  /* 146A4C 8013746C 3C014298 */       lui $at, (0x42980000 >> 16) # 76.0
  /* 146A50 80137470 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 146A54 80137474 44815000 */      mtc1 $at, $f10 # 76.0 to cop1
  /* 146A58 80137478 240300FF */     addiu $v1, $zero, 0xff
  /* 146A5C 8013747C A44B0024 */        sh $t3, 0x24($v0)
  /* 146A60 80137480 356C0001 */       ori $t4, $t3, 1
  /* 146A64 80137484 240D00CA */     addiu $t5, $zero, 0xca
  /* 146A68 80137488 240E0013 */     addiu $t6, $zero, 0x13
  /* 146A6C 8013748C 240F009D */     addiu $t7, $zero, 0x9d
  /* 146A70 80137490 A44C0024 */        sh $t4, 0x24($v0)
  /* 146A74 80137494 A0430060 */        sb $v1, 0x60($v0)
  /* 146A78 80137498 A04D0061 */        sb $t5, 0x61($v0)
  /* 146A7C 8013749C A04E0062 */        sb $t6, 0x62($v0)
  /* 146A80 801374A0 A0430028 */        sb $v1, 0x28($v0)
  /* 146A84 801374A4 A0430029 */        sb $v1, 0x29($v0)
  /* 146A88 801374A8 A04F002A */        sb $t7, 0x2a($v0)
  /* 146A8C 801374AC 00002025 */        or $a0, $zero, $zero
  /* 146A90 801374B0 00002825 */        or $a1, $zero, $zero
  /* 146A94 801374B4 24060016 */     addiu $a2, $zero, 0x16
  /* 146A98 801374B8 3C078000 */       lui $a3, 0x8000
  /* 146A9C 801374BC E4480058 */      swc1 $f8, 0x58($v0)
  /* 146AA0 801374C0 0C00265A */       jal omMakeGObjSPAfter
  /* 146AA4 801374C4 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 146AA8 801374C8 2418FFFF */     addiu $t8, $zero, -1
  /* 146AAC 801374CC 00408025 */        or $s0, $v0, $zero
  /* 146AB0 801374D0 AFB80010 */        sw $t8, 0x10($sp)
  /* 146AB4 801374D4 00402025 */        or $a0, $v0, $zero
  /* 146AB8 801374D8 8FA5002C */        lw $a1, 0x2c($sp)
  /* 146ABC 801374DC 2406001C */     addiu $a2, $zero, 0x1c
  /* 146AC0 801374E0 0C00277D */       jal omAddGObjRenderProc
  /* 146AC4 801374E4 3C078000 */       lui $a3, 0x8000
  /* 146AC8 801374E8 02002025 */        or $a0, $s0, $zero
  /* 146ACC 801374EC 8FA50028 */        lw $a1, 0x28($sp)
  /* 146AD0 801374F0 24060001 */     addiu $a2, $zero, 1
  /* 146AD4 801374F4 0C002062 */       jal omAddGObjCommonProc
  /* 146AD8 801374F8 24070001 */     addiu $a3, $zero, 1
  /* 146ADC 801374FC 3C198014 */       lui $t9, %hi(D_ovl28_80138C98)
  /* 146AE0 80137500 8F398C98 */        lw $t9, %lo(D_ovl28_80138C98)($t9)
  /* 146AE4 80137504 3C080000 */       lui $t0, %hi(D_NF_000014D8)
  /* 146AE8 80137508 250814D8 */     addiu $t0, $t0, %lo(D_NF_000014D8)
  /* 146AEC 8013750C 02002025 */        or $a0, $s0, $zero
  /* 146AF0 80137510 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 146AF4 80137514 03282821 */      addu $a1, $t9, $t0
  /* 146AF8 80137518 94490024 */       lhu $t1, 0x24($v0)
  /* 146AFC 8013751C 3C014305 */       lui $at, (0x43050000 >> 16) # 133.0
  /* 146B00 80137520 44818000 */      mtc1 $at, $f16 # 133.0 to cop1
  /* 146B04 80137524 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 146B08 80137528 44819000 */      mtc1 $at, $f18 # 219.0 to cop1
  /* 146B0C 8013752C 312BFFDF */      andi $t3, $t1, 0xffdf
  /* 146B10 80137530 A44B0024 */        sh $t3, 0x24($v0)
  /* 146B14 80137534 356C0001 */       ori $t4, $t3, 1
  /* 146B18 80137538 240D00D6 */     addiu $t5, $zero, 0xd6
  /* 146B1C 8013753C 240E00DD */     addiu $t6, $zero, 0xdd
  /* 146B20 80137540 240F00C6 */     addiu $t7, $zero, 0xc6
  /* 146B24 80137544 A44C0024 */        sh $t4, 0x24($v0)
  /* 146B28 80137548 A04D0028 */        sb $t5, 0x28($v0)
  /* 146B2C 8013754C A04E0029 */        sb $t6, 0x29($v0)
  /* 146B30 80137550 A04F002A */        sb $t7, 0x2a($v0)
  /* 146B34 80137554 3C188014 */       lui $t8, %hi(D_ovl28_80138C98)
  /* 146B38 80137558 E4500058 */      swc1 $f16, 0x58($v0)
  /* 146B3C 8013755C E452005C */      swc1 $f18, 0x5c($v0)
  /* 146B40 80137560 8F188C98 */        lw $t8, %lo(D_ovl28_80138C98)($t8)
  /* 146B44 80137564 3C190000 */       lui $t9, %hi(D_NF_00001378)
  /* 146B48 80137568 27391378 */     addiu $t9, $t9, %lo(D_NF_00001378)
  /* 146B4C 8013756C 02002025 */        or $a0, $s0, $zero
  /* 146B50 80137570 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 146B54 80137574 03192821 */      addu $a1, $t8, $t9
  /* 146B58 80137578 94480024 */       lhu $t0, 0x24($v0)
  /* 146B5C 8013757C 3C014322 */       lui $at, (0x43220000 >> 16) # 162.0
  /* 146B60 80137580 44812000 */      mtc1 $at, $f4 # 162.0 to cop1
  /* 146B64 80137584 3C01435B */       lui $at, (0x435B0000 >> 16) # 219.0
  /* 146B68 80137588 44813000 */      mtc1 $at, $f6 # 219.0 to cop1
  /* 146B6C 8013758C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 146B70 80137590 A44A0024 */        sh $t2, 0x24($v0)
  /* 146B74 80137594 354B0001 */       ori $t3, $t2, 1
  /* 146B78 80137598 240C00FF */     addiu $t4, $zero, 0xff
  /* 146B7C 8013759C 240D0056 */     addiu $t5, $zero, 0x56
  /* 146B80 801375A0 240E0092 */     addiu $t6, $zero, 0x92
  /* 146B84 801375A4 A44B0024 */        sh $t3, 0x24($v0)
  /* 146B88 801375A8 A04C0028 */        sb $t4, 0x28($v0)
  /* 146B8C 801375AC A04D0029 */        sb $t5, 0x29($v0)
  /* 146B90 801375B0 A04E002A */        sb $t6, 0x2a($v0)
  /* 146B94 801375B4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 146B98 801375B8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 146B9C 801375BC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 146BA0 801375C0 8FB00020 */        lw $s0, 0x20($sp)
  /* 146BA4 801375C4 27BD0038 */     addiu $sp, $sp, 0x38
  /* 146BA8 801375C8 03E00008 */        jr $ra
  /* 146BAC 801375CC 00000000 */       nop

  /* 146BB0 801375D0 03E00008 */        jr $ra
  /* 146BB4 801375D4 00000000 */       nop

glabel mnTrainingSaveMatchInfo
  /* 146BB8 801375D8 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 146BBC 801375DC 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 146BC0 801375E0 240600B8 */     addiu $a2, $zero, 0xb8
  /* 146BC4 801375E4 3C058014 */       lui $a1, %hi(gMNTrainingPanels)
  /* 146BC8 801375E8 01C60019 */     multu $t6, $a2
  /* 146BCC 801375EC 24A58558 */     addiu $a1, $a1, %lo(gMNTrainingPanels)
  /* 146BD0 801375F0 3C04800A */       lui $a0, %hi(gSceneData)
  /* 146BD4 801375F4 24844AD0 */     addiu $a0, $a0, %lo(gSceneData)
  /* 146BD8 801375F8 3C088014 */       lui $t0, %hi(gMNTrainingCPUPanelPort)
  /* 146BDC 801375FC 00007812 */      mflo $t7
  /* 146BE0 80137600 00AF1021 */      addu $v0, $a1, $t7
  /* 146BE4 80137604 8C580048 */        lw $t8, 0x48($v0)
  /* 146BE8 80137608 8C59004C */        lw $t9, 0x4c($v0)
  /* 146BEC 8013760C A098003B */        sb $t8, 0x3b($a0) # gSceneData + 59
  /* 146BF0 80137610 A099003C */        sb $t9, 0x3c($a0) # gSceneData + 60
  /* 146BF4 80137614 8D088898 */        lw $t0, %lo(gMNTrainingCPUPanelPort)($t0)
  /* 146BF8 80137618 01060019 */     multu $t0, $a2
  /* 146BFC 8013761C 00004812 */      mflo $t1
  /* 146C00 80137620 00A91821 */      addu $v1, $a1, $t1
  /* 146C04 80137624 8C6A0048 */        lw $t2, 0x48($v1)
  /* 146C08 80137628 8C6B004C */        lw $t3, 0x4c($v1)
  /* 146C0C 8013762C A08A003D */        sb $t2, 0x3d($a0) # gSceneData + 61
  /* 146C10 80137630 03E00008 */        jr $ra
  /* 146C14 80137634 A08B003E */        sb $t3, 0x3e($a0) # gSceneData + 62

glabel mnTrainingDestroyCursorAndTokenProcesses
  /* 146C18 80137638 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 146C1C 8013763C 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 146C20 80137640 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 146C24 80137644 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 146C28 80137648 000E7880 */       sll $t7, $t6, 2
  /* 146C2C 8013764C 01EE7823 */      subu $t7, $t7, $t6
  /* 146C30 80137650 000F78C0 */       sll $t7, $t7, 3
  /* 146C34 80137654 01EE7823 */      subu $t7, $t7, $t6
  /* 146C38 80137658 000F78C0 */       sll $t7, $t7, 3
  /* 146C3C 8013765C 01F81021 */      addu $v0, $t7, $t8
  /* 146C40 80137660 8C430000 */        lw $v1, ($v0)
  /* 146C44 80137664 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 146C48 80137668 AFBF0014 */        sw $ra, 0x14($sp)
  /* 146C4C 8013766C 5060000E */      beql $v1, $zero, .L801376A8
  /* 146C50 80137670 8C430004 */        lw $v1, 4($v0)
  /* 146C54 80137674 0C002CBB */       jal func_8000B2EC
  /* 146C58 80137678 8C640018 */        lw $a0, 0x18($v1)
  /* 146C5C 8013767C 3C198014 */       lui $t9, %hi(gMNTrainingHumanPanelPort)
  /* 146C60 80137680 8F398894 */        lw $t9, %lo(gMNTrainingHumanPanelPort)($t9)
  /* 146C64 80137684 3C098014 */       lui $t1, %hi(gMNTrainingPanels)
  /* 146C68 80137688 25298558 */     addiu $t1, $t1, %lo(gMNTrainingPanels)
  /* 146C6C 8013768C 00194080 */       sll $t0, $t9, 2
  /* 146C70 80137690 01194023 */      subu $t0, $t0, $t9
  /* 146C74 80137694 000840C0 */       sll $t0, $t0, 3
  /* 146C78 80137698 01194023 */      subu $t0, $t0, $t9
  /* 146C7C 8013769C 000840C0 */       sll $t0, $t0, 3
  /* 146C80 801376A0 01091021 */      addu $v0, $t0, $t1
  /* 146C84 801376A4 8C430004 */        lw $v1, 4($v0)
  .L801376A8:
  /* 146C88 801376A8 10600003 */      beqz $v1, .L801376B8
  /* 146C8C 801376AC 00000000 */       nop
  /* 146C90 801376B0 0C002CBB */       jal func_8000B2EC
  /* 146C94 801376B4 8C640018 */        lw $a0, 0x18($v1)
  .L801376B8:
  /* 146C98 801376B8 3C0A8014 */       lui $t2, %hi(gMNTrainingCPUPanelPort)
  /* 146C9C 801376BC 8D4A8898 */        lw $t2, %lo(gMNTrainingCPUPanelPort)($t2)
  /* 146CA0 801376C0 3C028014 */       lui $v0, %hi(D_ovl28_8013855C)
  /* 146CA4 801376C4 000A5880 */       sll $t3, $t2, 2
  /* 146CA8 801376C8 016A5823 */      subu $t3, $t3, $t2
  /* 146CAC 801376CC 000B58C0 */       sll $t3, $t3, 3
  /* 146CB0 801376D0 016A5823 */      subu $t3, $t3, $t2
  /* 146CB4 801376D4 000B58C0 */       sll $t3, $t3, 3
  /* 146CB8 801376D8 004B1021 */      addu $v0, $v0, $t3
  /* 146CBC 801376DC 8C42855C */        lw $v0, %lo(D_ovl28_8013855C)($v0)
  /* 146CC0 801376E0 50400004 */      beql $v0, $zero, .L801376F4
  /* 146CC4 801376E4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 146CC8 801376E8 0C002CBB */       jal func_8000B2EC
  /* 146CCC 801376EC 8C440018 */        lw $a0, 0x18($v0)
  /* 146CD0 801376F0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801376F4:
  /* 146CD4 801376F4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 146CD8 801376F8 03E00008 */        jr $ra
  /* 146CDC 801376FC 00000000 */       nop

glabel mnTrainingMain
  /* 146CE0 80137700 3C038014 */       lui $v1, %hi(gMNTrainingFramesElapsed)
  /* 146CE4 80137704 2463888C */     addiu $v1, $v1, %lo(gMNTrainingFramesElapsed)
  /* 146CE8 80137708 8C6E0000 */        lw $t6, ($v1) # gMNTrainingFramesElapsed + 0
  /* 146CEC 8013770C 3C188014 */       lui $t8, %hi(gMNTrainingMaxFramesElapsed)
  /* 146CF0 80137710 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 146CF4 80137714 25CF0001 */     addiu $t7, $t6, 1
  /* 146CF8 80137718 AC6F0000 */        sw $t7, ($v1) # gMNTrainingFramesElapsed + 0
  /* 146CFC 8013771C 8F188890 */        lw $t8, %lo(gMNTrainingMaxFramesElapsed)($t8)
  /* 146D00 80137720 AFBF0014 */        sw $ra, 0x14($sp)
  /* 146D04 80137724 AFA40018 */        sw $a0, 0x18($sp)
  /* 146D08 80137728 170F000B */       bne $t8, $t7, .L80137758
  /* 146D0C 8013772C 3C02800A */       lui $v0, %hi(gSceneData)
  /* 146D10 80137730 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 146D14 80137734 90480000 */       lbu $t0, ($v0) # gSceneData + 0
  /* 146D18 80137738 24090001 */     addiu $t1, $zero, 1
  /* 146D1C 8013773C A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 146D20 80137740 0C04DD76 */       jal mnTrainingSaveMatchInfo
  /* 146D24 80137744 A0480001 */        sb $t0, 1($v0) # gSceneData + 1
  /* 146D28 80137748 0C00171D */       jal func_80005C74
  /* 146D2C 8013774C 00000000 */       nop
  /* 146D30 80137750 1000003B */         b .L80137840
  /* 146D34 80137754 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137758:
  /* 146D38 80137758 0C0E42DF */       jal func_ovl1_80390B7C
  /* 146D3C 8013775C 00000000 */       nop
  /* 146D40 80137760 3C038014 */       lui $v1, %hi(gMNTrainingFramesElapsed)
  /* 146D44 80137764 14400005 */      bnez $v0, .L8013777C
  /* 146D48 80137768 2463888C */     addiu $v1, $v1, %lo(gMNTrainingFramesElapsed)
  /* 146D4C 8013776C 8C6A0000 */        lw $t2, ($v1) # gMNTrainingFramesElapsed + 0
  /* 146D50 80137770 3C018014 */       lui $at, %hi(gMNTrainingMaxFramesElapsed)
  /* 146D54 80137774 254B4650 */     addiu $t3, $t2, 0x4650
  /* 146D58 80137778 AC2B8890 */        sw $t3, %lo(gMNTrainingMaxFramesElapsed)($at)
  .L8013777C:
  /* 146D5C 8013777C 3C0C8014 */       lui $t4, %hi(gMNTrainingIsStartTriggered)
  /* 146D60 80137780 8D8C8864 */        lw $t4, %lo(gMNTrainingIsStartTriggered)($t4)
  /* 146D64 80137784 3C038014 */       lui $v1, %hi(gMNTrainingStartDelayTimer)
  /* 146D68 80137788 24638860 */     addiu $v1, $v1, %lo(gMNTrainingStartDelayTimer)
  /* 146D6C 8013778C 11800010 */      beqz $t4, .L801377D0
  /* 146D70 80137790 00000000 */       nop
  /* 146D74 80137794 8C6D0000 */        lw $t5, ($v1) # gMNTrainingStartDelayTimer + 0
  /* 146D78 80137798 3C02800A */       lui $v0, %hi(gSceneData)
  /* 146D7C 8013779C 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 146D80 801377A0 25AEFFFF */     addiu $t6, $t5, -1
  /* 146D84 801377A4 15C00025 */      bnez $t6, .L8013783C
  /* 146D88 801377A8 AC6E0000 */        sw $t6, ($v1) # gMNTrainingStartDelayTimer + 0
  /* 146D8C 801377AC 90580000 */       lbu $t8, ($v0) # gSceneData + 0
  /* 146D90 801377B0 24190015 */     addiu $t9, $zero, 0x15
  /* 146D94 801377B4 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 146D98 801377B8 0C04DD76 */       jal mnTrainingSaveMatchInfo
  /* 146D9C 801377BC A0580001 */        sb $t8, 1($v0) # gSceneData + 1
  /* 146DA0 801377C0 0C00171D */       jal func_80005C74
  /* 146DA4 801377C4 00000000 */       nop
  /* 146DA8 801377C8 1000001D */         b .L80137840
  /* 146DAC 801377CC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801377D0:
  /* 146DB0 801377D0 0C0E41DB */       jal func_ovl1_8039076C
  /* 146DB4 801377D4 24041000 */     addiu $a0, $zero, 0x1000
  /* 146DB8 801377D8 3C038014 */       lui $v1, %hi(gMNTrainingFramesElapsed)
  /* 146DBC 801377DC 10400017 */      beqz $v0, .L8013783C
  /* 146DC0 801377E0 2463888C */     addiu $v1, $v1, %lo(gMNTrainingFramesElapsed)
  /* 146DC4 801377E4 8C680000 */        lw $t0, ($v1) # gMNTrainingFramesElapsed + 0
  /* 146DC8 801377E8 2901003D */      slti $at, $t0, 0x3d
  /* 146DCC 801377EC 54200014 */      bnel $at, $zero, .L80137840
  /* 146DD0 801377F0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 146DD4 801377F4 0C04DC9D */       jal mnTrainingIsReadyToFight
  /* 146DD8 801377F8 00000000 */       nop
  /* 146DDC 801377FC 1040000D */      beqz $v0, .L80137834
  /* 146DE0 80137800 00000000 */       nop
  /* 146DE4 80137804 0C009A70 */       jal func_800269C0
  /* 146DE8 80137808 2404026A */     addiu $a0, $zero, 0x26a
  /* 146DEC 8013780C 3C038014 */       lui $v1, %hi(gMNTrainingStartDelayTimer)
  /* 146DF0 80137810 24638860 */     addiu $v1, $v1, %lo(gMNTrainingStartDelayTimer)
  /* 146DF4 80137814 2409001E */     addiu $t1, $zero, 0x1e
  /* 146DF8 80137818 AC690000 */        sw $t1, ($v1) # gMNTrainingStartDelayTimer + 0
  /* 146DFC 8013781C 240A0001 */     addiu $t2, $zero, 1
  /* 146E00 80137820 3C018014 */       lui $at, %hi(gMNTrainingIsStartTriggered)
  /* 146E04 80137824 0C04DD8E */       jal mnTrainingDestroyCursorAndTokenProcesses
  /* 146E08 80137828 AC2A8864 */        sw $t2, %lo(gMNTrainingIsStartTriggered)($at)
  /* 146E0C 8013782C 10000004 */         b .L80137840
  /* 146E10 80137830 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137834:
  /* 146E14 80137834 0C009A70 */       jal func_800269C0
  /* 146E18 80137838 240400A5 */     addiu $a0, $zero, 0xa5
  .L8013783C:
  /* 146E1C 8013783C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137840:
  /* 146E20 80137840 27BD0018 */     addiu $sp, $sp, 0x18
  /* 146E24 80137844 03E00008 */        jr $ra
  /* 146E28 80137848 00000000 */       nop

glabel mnTrainingInitPort
  /* 146E2C 8013784C 00047080 */       sll $t6, $a0, 2
  /* 146E30 80137850 01C47023 */      subu $t6, $t6, $a0
  /* 146E34 80137854 000E70C0 */       sll $t6, $t6, 3
  /* 146E38 80137858 01C47023 */      subu $t6, $t6, $a0
  /* 146E3C 8013785C 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 146E40 80137860 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 146E44 80137864 000E70C0 */       sll $t6, $t6, 3
  /* 146E48 80137868 01CF1021 */      addu $v0, $t6, $t7
  /* 146E4C 8013786C AC40001C */        sw $zero, 0x1c($v0)
  /* 146E50 80137870 AC400020 */        sw $zero, 0x20($v0)
  /* 146E54 80137874 AC400024 */        sw $zero, 0x24($v0)
  /* 146E58 80137878 AC400028 */        sw $zero, 0x28($v0)
  /* 146E5C 8013787C AC40002C */        sw $zero, 0x2c($v0)
  /* 146E60 80137880 AC4000A4 */        sw $zero, 0xa4($v0)
  /* 146E64 80137884 A44000A8 */        sh $zero, 0xa8($v0)
  /* 146E68 80137888 AC400008 */        sw $zero, 8($v0)
  /* 146E6C 8013788C 3C188014 */       lui $t8, %hi(gMNTrainingHumanPanelPort)
  /* 146E70 80137890 8F188894 */        lw $t8, %lo(gMNTrainingHumanPanelPort)($t8)
  /* 146E74 80137894 3C03800A */       lui $v1, %hi(gSceneData)
  /* 146E78 80137898 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 146E7C 8013789C 1498000E */       bne $a0, $t8, .L801378D8
  /* 146E80 801378A0 24190004 */     addiu $t9, $zero, 4
  /* 146E84 801378A4 9069003B */       lbu $t1, 0x3b($v1) # gSceneData + 59
  /* 146E88 801378A8 906A003C */       lbu $t2, 0x3c($v1) # gSceneData + 60
  /* 146E8C 801378AC 24040001 */     addiu $a0, $zero, 1
  /* 146E90 801378B0 2408FFFF */     addiu $t0, $zero, -1
  /* 146E94 801378B4 AC400080 */        sw $zero, 0x80($v0)
  /* 146E98 801378B8 AC590078 */        sw $t9, 0x78($v0)
  /* 146E9C 801378BC AC48007C */        sw $t0, 0x7c($v0)
  /* 146EA0 801378C0 AC440084 */        sw $a0, 0x84($v0)
  /* 146EA4 801378C4 AC440054 */        sw $a0, 0x54($v0)
  /* 146EA8 801378C8 AC400058 */        sw $zero, 0x58($v0)
  /* 146EAC 801378CC AC490048 */        sw $t1, 0x48($v0)
  /* 146EB0 801378D0 03E00008 */        jr $ra
  /* 146EB4 801378D4 AC4A004C */        sw $t2, 0x4c($v0)

  .L801378D8:
  /* 146EB8 801378D8 24040001 */     addiu $a0, $zero, 1
  /* 146EBC 801378DC 240B0004 */     addiu $t3, $zero, 4
  /* 146EC0 801378E0 240CFFFF */     addiu $t4, $zero, -1
  /* 146EC4 801378E4 AC4B0078 */        sw $t3, 0x78($v0)
  /* 146EC8 801378E8 AC4C007C */        sw $t4, 0x7c($v0)
  /* 146ECC 801378EC AC440084 */        sw $a0, 0x84($v0)
  /* 146ED0 801378F0 AC440054 */        sw $a0, 0x54($v0)
  /* 146ED4 801378F4 AC400058 */        sw $zero, 0x58($v0)
  /* 146ED8 801378F8 03E00008 */        jr $ra
  /* 146EDC 801378FC 00000000 */       nop

glabel mnTrainingResetPort
  /* 146EE0 80137900 00047080 */       sll $t6, $a0, 2
  /* 146EE4 80137904 01C47023 */      subu $t6, $t6, $a0
  /* 146EE8 80137908 000E70C0 */       sll $t6, $t6, 3
  /* 146EEC 8013790C 01C47023 */      subu $t6, $t6, $a0
  /* 146EF0 80137910 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 146EF4 80137914 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 146EF8 80137918 000E70C0 */       sll $t6, $t6, 3
  /* 146EFC 8013791C 01CF1021 */      addu $v0, $t6, $t7
  /* 146F00 80137920 2418001C */     addiu $t8, $zero, 0x1c
  /* 146F04 80137924 AC40001C */        sw $zero, 0x1c($v0)
  /* 146F08 80137928 AC400020 */        sw $zero, 0x20($v0)
  /* 146F0C 8013792C AC400024 */        sw $zero, 0x24($v0)
  /* 146F10 80137930 AC400028 */        sw $zero, 0x28($v0)
  /* 146F14 80137934 AC40002C */        sw $zero, 0x2c($v0)
  /* 146F18 80137938 AC400008 */        sw $zero, 8($v0)
  /* 146F1C 8013793C AC4000A4 */        sw $zero, 0xa4($v0)
  /* 146F20 80137940 A44000A8 */        sh $zero, 0xa8($v0)
  /* 146F24 80137944 AC400054 */        sw $zero, 0x54($v0)
  /* 146F28 80137948 AC580048 */        sw $t8, 0x48($v0)
  /* 146F2C 8013794C AC400058 */        sw $zero, 0x58($v0)
  /* 146F30 80137950 AC400080 */        sw $zero, 0x80($v0)
  /* 146F34 80137954 AC440078 */        sw $a0, 0x78($v0)
  /* 146F38 80137958 03E00008 */        jr $ra
  /* 146F3C 8013795C AC44007C */        sw $a0, 0x7c($v0)

glabel mnTrainingResetPortToNA
  /* 146F40 80137960 00047080 */       sll $t6, $a0, 2
  /* 146F44 80137964 01C47023 */      subu $t6, $t6, $a0
  /* 146F48 80137968 000E70C0 */       sll $t6, $t6, 3
  /* 146F4C 8013796C 01C47023 */      subu $t6, $t6, $a0
  /* 146F50 80137970 3C0F8014 */       lui $t7, %hi(gMNTrainingPanels)
  /* 146F54 80137974 25EF8558 */     addiu $t7, $t7, %lo(gMNTrainingPanels)
  /* 146F58 80137978 000E70C0 */       sll $t6, $t6, 3
  /* 146F5C 8013797C 01CF1021 */      addu $v0, $t6, $t7
  /* 146F60 80137980 2418001C */     addiu $t8, $zero, 0x1c
  /* 146F64 80137984 24190002 */     addiu $t9, $zero, 2
  /* 146F68 80137988 24080004 */     addiu $t0, $zero, 4
  /* 146F6C 8013798C 2409FFFF */     addiu $t1, $zero, -1
  /* 146F70 80137990 AC40001C */        sw $zero, 0x1c($v0)
  /* 146F74 80137994 AC400020 */        sw $zero, 0x20($v0)
  /* 146F78 80137998 AC400024 */        sw $zero, 0x24($v0)
  /* 146F7C 8013799C AC400028 */        sw $zero, 0x28($v0)
  /* 146F80 801379A0 AC40002C */        sw $zero, 0x2c($v0)
  /* 146F84 801379A4 AC400008 */        sw $zero, 8($v0)
  /* 146F88 801379A8 AC4000A4 */        sw $zero, 0xa4($v0)
  /* 146F8C 801379AC A44000A8 */        sh $zero, 0xa8($v0)
  /* 146F90 801379B0 AC400054 */        sw $zero, 0x54($v0)
  /* 146F94 801379B4 AC580048 */        sw $t8, 0x48($v0)
  /* 146F98 801379B8 AC400058 */        sw $zero, 0x58($v0)
  /* 146F9C 801379BC AC590080 */        sw $t9, 0x80($v0)
  /* 146FA0 801379C0 AC480078 */        sw $t0, 0x78($v0)
  /* 146FA4 801379C4 03E00008 */        jr $ra
  /* 146FA8 801379C8 AC49007C */        sw $t1, 0x7c($v0)

glabel mnTrainingLoadMatchInfo
  /* 146FAC 801379CC 3C028014 */       lui $v0, %hi(gMNTrainingFramesElapsed)
  /* 146FB0 801379D0 2442888C */     addiu $v0, $v0, %lo(gMNTrainingFramesElapsed)
  /* 146FB4 801379D4 AC400000 */        sw $zero, ($v0) # gMNTrainingFramesElapsed + 0
  /* 146FB8 801379D8 3C018014 */       lui $at, %hi(gMNTrainingIsStartTriggered)
  /* 146FBC 801379DC AC208864 */        sw $zero, %lo(gMNTrainingIsStartTriggered)($at)
  /* 146FC0 801379E0 8C4E0000 */        lw $t6, ($v0) # gMNTrainingFramesElapsed + 0
  /* 146FC4 801379E4 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 146FC8 801379E8 AFB10018 */        sw $s1, 0x18($sp)
  /* 146FCC 801379EC 3C11800A */       lui $s1, %hi(gSceneData)
  /* 146FD0 801379F0 3C018014 */       lui $at, %hi(gMNTrainingMaxFramesElapsed)
  /* 146FD4 801379F4 25CF4650 */     addiu $t7, $t6, 0x4650
  /* 146FD8 801379F8 26314AD0 */     addiu $s1, $s1, %lo(gSceneData)
  /* 146FDC 801379FC AC2F8890 */        sw $t7, %lo(gMNTrainingMaxFramesElapsed)($at)
  /* 146FE0 80137A00 92240013 */       lbu $a0, 0x13($s1) # gSceneData + 19
  /* 146FE4 80137A04 AFB2001C */        sw $s2, 0x1c($sp)
  /* 146FE8 80137A08 3C128014 */       lui $s2, %hi(gMNTrainingHumanPanelPort)
  /* 146FEC 80137A0C 26528894 */     addiu $s2, $s2, %lo(gMNTrainingHumanPanelPort)
  /* 146FF0 80137A10 AFBF0024 */        sw $ra, 0x24($sp)
  /* 146FF4 80137A14 AFB30020 */        sw $s3, 0x20($sp)
  /* 146FF8 80137A18 AFB00014 */        sw $s0, 0x14($sp)
  /* 146FFC 80137A1C 14800006 */      bnez $a0, .L80137A38
  /* 147000 80137A20 AE440000 */        sw $a0, ($s2) # gMNTrainingHumanPanelPort + 0
  /* 147004 80137A24 3C138014 */       lui $s3, %hi(gMNTrainingCPUPanelPort)
  /* 147008 80137A28 26738898 */     addiu $s3, $s3, %lo(gMNTrainingCPUPanelPort)
  /* 14700C 80137A2C 24190001 */     addiu $t9, $zero, 1
  /* 147010 80137A30 10000004 */         b .L80137A44
  /* 147014 80137A34 AE790000 */        sw $t9, ($s3) # gMNTrainingCPUPanelPort + 0
  .L80137A38:
  /* 147018 80137A38 3C138014 */       lui $s3, %hi(gMNTrainingCPUPanelPort)
  /* 14701C 80137A3C 26738898 */     addiu $s3, $s3, %lo(gMNTrainingCPUPanelPort)
  /* 147020 80137A40 AE600000 */        sw $zero, ($s3) # gMNTrainingCPUPanelPort + 0
  .L80137A44:
  /* 147024 80137A44 3C08800A */       lui $t0, %hi((gSaveData + 0x458))
  /* 147028 80137A48 95084938 */       lhu $t0, %lo((gSaveData + 0x458))($t0)
  /* 14702C 80137A4C 3C018014 */       lui $at, %hi(gMNTrainingCharacterUnlockedMask)
  /* 147030 80137A50 A428887C */        sh $t0, %lo(gMNTrainingCharacterUnlockedMask)($at)
  /* 147034 80137A54 9229003B */       lbu $t1, 0x3b($s1) # gSceneData + 59
  /* 147038 80137A58 2401001C */     addiu $at, $zero, 0x1c
  /* 14703C 80137A5C 15210005 */       bne $t1, $at, .L80137A74
  /* 147040 80137A60 00000000 */       nop
  /* 147044 80137A64 0C04DE40 */       jal mnTrainingResetPort
  /* 147048 80137A68 00000000 */       nop
  /* 14704C 80137A6C 10000004 */         b .L80137A80
  /* 147050 80137A70 8E4A0000 */        lw $t2, ($s2) # gMNTrainingHumanPanelPort + 0
  .L80137A74:
  /* 147054 80137A74 0C04DE13 */       jal mnTrainingInitPort
  /* 147058 80137A78 00000000 */       nop
  /* 14705C 80137A7C 8E4A0000 */        lw $t2, ($s2) # gMNTrainingHumanPanelPort + 0
  .L80137A80:
  /* 147060 80137A80 3C018014 */       lui $at, %hi(D_ovl28_801385B4)
  /* 147064 80137A84 000A5880 */       sll $t3, $t2, 2
  /* 147068 80137A88 016A5823 */      subu $t3, $t3, $t2
  /* 14706C 80137A8C 000B58C0 */       sll $t3, $t3, 3
  /* 147070 80137A90 016A5823 */      subu $t3, $t3, $t2
  /* 147074 80137A94 000B58C0 */       sll $t3, $t3, 3
  /* 147078 80137A98 002B0821 */      addu $at, $at, $t3
  /* 14707C 80137A9C AC2085B4 */        sw $zero, %lo(D_ovl28_801385B4)($at)
  /* 147080 80137AA0 9230003D */       lbu $s0, 0x3d($s1) # gSceneData + 61
  /* 147084 80137AA4 2401001C */     addiu $at, $zero, 0x1c
  /* 147088 80137AA8 5601001F */      bnel $s0, $at, .L80137B28
  /* 14708C 80137AAC 9223003E */       lbu $v1, 0x3e($s1) # gSceneData + 62
  .L80137AB0:
  /* 147090 80137AB0 0C00628C */       jal lbRandom_GetTimeByteRange
  /* 147094 80137AB4 2404000C */     addiu $a0, $zero, 0xc
  /* 147098 80137AB8 00408025 */        or $s0, $v0, $zero
  /* 14709C 80137ABC 0C04C761 */       jal mnTrainingCheckFighterIsXBoxed
  /* 1470A0 80137AC0 00402025 */        or $a0, $v0, $zero
  /* 1470A4 80137AC4 1440FFFA */      bnez $v0, .L80137AB0
  /* 1470A8 80137AC8 00000000 */       nop
  /* 1470AC 80137ACC 0C04C7BF */       jal mnTrainingGetIsLocked
  /* 1470B0 80137AD0 02002025 */        or $a0, $s0, $zero
  /* 1470B4 80137AD4 1440FFF6 */      bnez $v0, .L80137AB0
  /* 1470B8 80137AD8 00000000 */       nop
  /* 1470BC 80137ADC 02002025 */        or $a0, $s0, $zero
  /* 1470C0 80137AE0 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 1470C4 80137AE4 00002825 */        or $a1, $zero, $zero
  /* 1470C8 80137AE8 02002025 */        or $a0, $s0, $zero
  /* 1470CC 80137AEC 8E650000 */        lw $a1, ($s3) # gMNTrainingCPUPanelPort + 0
  /* 1470D0 80137AF0 0C04CCD4 */       jal mnTrainingIsCostumeInUse
  /* 1470D4 80137AF4 00403025 */        or $a2, $v0, $zero
  /* 1470D8 80137AF8 10400006 */      beqz $v0, .L80137B14
  /* 1470DC 80137AFC 02002025 */        or $a0, $s0, $zero
  /* 1470E0 80137B00 02002025 */        or $a0, $s0, $zero
  /* 1470E4 80137B04 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 1470E8 80137B08 24050001 */     addiu $a1, $zero, 1
  /* 1470EC 80137B0C 10000006 */         b .L80137B28
  /* 1470F0 80137B10 00401825 */        or $v1, $v0, $zero
  .L80137B14:
  /* 1470F4 80137B14 0C03B03B */       jal ftCostume_GetIndexFFA
  /* 1470F8 80137B18 00002825 */        or $a1, $zero, $zero
  /* 1470FC 80137B1C 10000002 */         b .L80137B28
  /* 147100 80137B20 00401825 */        or $v1, $v0, $zero
  /* 147104 80137B24 9223003E */       lbu $v1, 0x3e($s1) # gSceneData + 62
  .L80137B28:
  /* 147108 80137B28 8E640000 */        lw $a0, ($s3) # gMNTrainingCPUPanelPort + 0
  /* 14710C 80137B2C 3C0D8014 */       lui $t5, %hi(gMNTrainingPanels)
  /* 147110 80137B30 25AD8558 */     addiu $t5, $t5, %lo(gMNTrainingPanels)
  /* 147114 80137B34 00046080 */       sll $t4, $a0, 2
  /* 147118 80137B38 01846023 */      subu $t4, $t4, $a0
  /* 14711C 80137B3C 000C60C0 */       sll $t4, $t4, 3
  /* 147120 80137B40 01846023 */      subu $t4, $t4, $a0
  /* 147124 80137B44 000C60C0 */       sll $t4, $t4, 3
  /* 147128 80137B48 018D1021 */      addu $v0, $t4, $t5
  /* 14712C 80137B4C 240E0001 */     addiu $t6, $zero, 1
  /* 147130 80137B50 AC500048 */        sw $s0, 0x48($v0)
  /* 147134 80137B54 AC43004C */        sw $v1, 0x4c($v0)
  /* 147138 80137B58 0C04DE13 */       jal mnTrainingInitPort
  /* 14713C 80137B5C AC4E0080 */        sw $t6, 0x80($v0)
  /* 147140 80137B60 00008025 */        or $s0, $zero, $zero
  /* 147144 80137B64 24110004 */     addiu $s1, $zero, 4
  /* 147148 80137B68 8E4F0000 */        lw $t7, ($s2) # gMNTrainingHumanPanelPort + 0
  .L80137B6C:
  /* 14714C 80137B6C 520F0007 */      beql $s0, $t7, .L80137B8C
  /* 147150 80137B70 26100001 */     addiu $s0, $s0, 1
  /* 147154 80137B74 8E780000 */        lw $t8, ($s3) # gMNTrainingCPUPanelPort + 0
  /* 147158 80137B78 52180004 */      beql $s0, $t8, .L80137B8C
  /* 14715C 80137B7C 26100001 */     addiu $s0, $s0, 1
  /* 147160 80137B80 0C04DE58 */       jal mnTrainingResetPortToNA
  /* 147164 80137B84 02002025 */        or $a0, $s0, $zero
  /* 147168 80137B88 26100001 */     addiu $s0, $s0, 1
  .L80137B8C:
  /* 14716C 80137B8C 5611FFF7 */      bnel $s0, $s1, .L80137B6C
  /* 147170 80137B90 8E4F0000 */        lw $t7, ($s2) # gMNTrainingHumanPanelPort + 0
  /* 147174 80137B94 8FBF0024 */        lw $ra, 0x24($sp)
  /* 147178 80137B98 8FB00014 */        lw $s0, 0x14($sp)
  /* 14717C 80137B9C 8FB10018 */        lw $s1, 0x18($sp)
  /* 147180 80137BA0 8FB2001C */        lw $s2, 0x1c($sp)
  /* 147184 80137BA4 8FB30020 */        lw $s3, 0x20($sp)
  /* 147188 80137BA8 03E00008 */        jr $ra
  /* 14718C 80137BAC 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnTrainingInitPanel
  /* 147190 80137BB0 3C0E8014 */       lui $t6, %hi(gMNTrainingHumanPanelPort)
  /* 147194 80137BB4 8DCE8894 */        lw $t6, %lo(gMNTrainingHumanPanelPort)($t6)
  /* 147198 80137BB8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 14719C 80137BBC AFB00018 */        sw $s0, 0x18($sp)
  /* 1471A0 80137BC0 00808025 */        or $s0, $a0, $zero
  /* 1471A4 80137BC4 148E000C */       bne $a0, $t6, .L80137BF8
  /* 1471A8 80137BC8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1471AC 80137BCC 0C04D89A */       jal mnTrainingCreateCursor
  /* 1471B0 80137BD0 00000000 */       nop
  /* 1471B4 80137BD4 00107880 */       sll $t7, $s0, 2
  /* 1471B8 80137BD8 01F07823 */      subu $t7, $t7, $s0
  /* 1471BC 80137BDC 000F78C0 */       sll $t7, $t7, 3
  /* 1471C0 80137BE0 01F07823 */      subu $t7, $t7, $s0
  /* 1471C4 80137BE4 3C188014 */       lui $t8, %hi(gMNTrainingPanels)
  /* 1471C8 80137BE8 27188558 */     addiu $t8, $t8, %lo(gMNTrainingPanels)
  /* 1471CC 80137BEC 000F78C0 */       sll $t7, $t7, 3
  /* 1471D0 80137BF0 1000000A */         b .L80137C1C
  /* 1471D4 80137BF4 01F81021 */      addu $v0, $t7, $t8
  .L80137BF8:
  /* 1471D8 80137BF8 0010C880 */       sll $t9, $s0, 2
  /* 1471DC 80137BFC 0330C823 */      subu $t9, $t9, $s0
  /* 1471E0 80137C00 0019C8C0 */       sll $t9, $t9, 3
  /* 1471E4 80137C04 0330C823 */      subu $t9, $t9, $s0
  /* 1471E8 80137C08 3C088014 */       lui $t0, %hi(gMNTrainingPanels)
  /* 1471EC 80137C0C 25088558 */     addiu $t0, $t0, %lo(gMNTrainingPanels)
  /* 1471F0 80137C10 0019C8C0 */       sll $t9, $t9, 3
  /* 1471F4 80137C14 03281021 */      addu $v0, $t9, $t0
  /* 1471F8 80137C18 AC400000 */        sw $zero, ($v0)
  .L80137C1C:
  /* 1471FC 80137C1C 02002025 */        or $a0, $s0, $zero
  /* 147200 80137C20 0C04D930 */       jal mnTrainingCreateToken
  /* 147204 80137C24 AFA20020 */        sw $v0, 0x20($sp)
  /* 147208 80137C28 0C04CB89 */       jal mnTrainingCreatePanel
  /* 14720C 80137C2C 02002025 */        or $a0, $s0, $zero
  /* 147210 80137C30 8FA20020 */        lw $v0, 0x20($sp)
  /* 147214 80137C34 8C490054 */        lw $t1, 0x54($v0)
  /* 147218 80137C38 5120000A */      beql $t1, $zero, .L80137C64
  /* 14721C 80137C3C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 147220 80137C40 8C460048 */        lw $a2, 0x48($v0)
  /* 147224 80137C44 2401001C */     addiu $at, $zero, 0x1c
  /* 147228 80137C48 02002825 */        or $a1, $s0, $zero
  /* 14722C 80137C4C 50C10005 */      beql $a2, $at, .L80137C64
  /* 147230 80137C50 8FBF001C */        lw $ra, 0x1c($sp)
  /* 147234 80137C54 8C440008 */        lw $a0, 8($v0)
  /* 147238 80137C58 0C04CDEF */       jal mnTrainingSpawnFighter
  /* 14723C 80137C5C 8C47004C */        lw $a3, 0x4c($v0)
  /* 147240 80137C60 8FBF001C */        lw $ra, 0x1c($sp)
  .L80137C64:
  /* 147244 80137C64 8FB00018 */        lw $s0, 0x18($sp)
  /* 147248 80137C68 27BD0028 */     addiu $sp, $sp, 0x28
  /* 14724C 80137C6C 03E00008 */        jr $ra
  /* 147250 80137C70 00000000 */       nop

glabel mnTrainingInitPanels
  /* 147254 80137C74 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 147258 80137C78 AFBF0014 */        sw $ra, 0x14($sp)
  /* 14725C 80137C7C 3C048014 */       lui $a0, %hi(gMNTrainingHumanPanelPort)
  /* 147260 80137C80 0C04DEEC */       jal mnTrainingInitPanel
  /* 147264 80137C84 8C848894 */        lw $a0, %lo(gMNTrainingHumanPanelPort)($a0)
  /* 147268 80137C88 3C048014 */       lui $a0, %hi(gMNTrainingCPUPanelPort)
  /* 14726C 80137C8C 0C04DEEC */       jal mnTrainingInitPanel
  /* 147270 80137C90 8C848898 */        lw $a0, %lo(gMNTrainingCPUPanelPort)($a0)
  /* 147274 80137C94 0C04CF2A */       jal mnTrainingUpdatePanels
  /* 147278 80137C98 00000000 */       nop
  /* 14727C 80137C9C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 147280 80137CA0 27BD0018 */     addiu $sp, $sp, 0x18
  /* 147284 80137CA4 03E00008 */        jr $ra
  /* 147288 80137CA8 00000000 */       nop

glabel mnTrainingInitCSS
  /* 14728C 80137CAC 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 147290 80137CB0 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 147294 80137CB4 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 147298 80137CB8 3C188014 */       lui $t8, %hi(D_ovl28_801388D8)
  /* 14729C 80137CBC 3C088014 */       lui $t0, %hi(D_ovl28_801388A0)
  /* 1472A0 80137CC0 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1472A4 80137CC4 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 1472A8 80137CC8 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 1472AC 80137CCC 271888D8 */     addiu $t8, $t8, %lo(D_ovl28_801388D8)
  /* 1472B0 80137CD0 24190078 */     addiu $t9, $zero, 0x78
  /* 1472B4 80137CD4 250888A0 */     addiu $t0, $t0, %lo(D_ovl28_801388A0)
  /* 1472B8 80137CD8 24090007 */     addiu $t1, $zero, 7
  /* 1472BC 80137CDC AFB00020 */        sw $s0, 0x20($sp)
  /* 1472C0 80137CE0 AFAE0040 */        sw $t6, 0x40($sp)
  /* 1472C4 80137CE4 AFAF0044 */        sw $t7, 0x44($sp)
  /* 1472C8 80137CE8 AFA00048 */        sw $zero, 0x48($sp)
  /* 1472CC 80137CEC AFA0004C */        sw $zero, 0x4c($sp)
  /* 1472D0 80137CF0 AFB80050 */        sw $t8, 0x50($sp)
  /* 1472D4 80137CF4 AFB90054 */        sw $t9, 0x54($sp)
  /* 1472D8 80137CF8 AFA80058 */        sw $t0, 0x58($sp)
  /* 1472DC 80137CFC AFA9005C */        sw $t1, 0x5c($sp)
  /* 1472E0 80137D00 0C0337DE */       jal rdManagerInitSetup
  /* 1472E4 80137D04 27A40040 */     addiu $a0, $sp, 0x40
  /* 1472E8 80137D08 3C108013 */       lui $s0, %hi(D_ovl28_80137F60)
  /* 1472EC 80137D0C 26107F60 */     addiu $s0, $s0, %lo(D_ovl28_80137F60)
  /* 1472F0 80137D10 02002025 */        or $a0, $s0, $zero
  /* 1472F4 80137D14 0C0337BB */       jal rdManagerGetAllocSize
  /* 1472F8 80137D18 24050008 */     addiu $a1, $zero, 8
  /* 1472FC 80137D1C 00402025 */        or $a0, $v0, $zero
  /* 147300 80137D20 0C001260 */       jal gsMemoryAlloc
  /* 147304 80137D24 24050010 */     addiu $a1, $zero, 0x10
  /* 147308 80137D28 3C068014 */       lui $a2, %hi(D_ovl28_80138C98)
  /* 14730C 80137D2C 24C68C98 */     addiu $a2, $a2, %lo(D_ovl28_80138C98)
  /* 147310 80137D30 02002025 */        or $a0, $s0, $zero
  /* 147314 80137D34 24050008 */     addiu $a1, $zero, 8
  /* 147318 80137D38 0C033781 */       jal rdManagerLoadFiles
  /* 14731C 80137D3C 00403825 */        or $a3, $v0, $zero
  /* 147320 80137D40 3C108000 */       lui $s0, %hi(D_NF_80000001)
  /* 147324 80137D44 3C058013 */       lui $a1, %hi(mnTrainingMain)
  /* 147328 80137D48 24A57700 */     addiu $a1, $a1, %lo(mnTrainingMain)
  /* 14732C 80137D4C 02003825 */        or $a3, $s0, $zero
  /* 147330 80137D50 24040400 */     addiu $a0, $zero, 0x400
  /* 147334 80137D54 0C00265A */       jal omMakeGObjSPAfter
  /* 147338 80137D58 2406000F */     addiu $a2, $zero, 0xf
  /* 14733C 80137D5C 24040010 */     addiu $a0, $zero, 0x10
  /* 147340 80137D60 02002825 */        or $a1, $s0, $zero
  /* 147344 80137D64 24060064 */     addiu $a2, $zero, 0x64
  /* 147348 80137D68 24070001 */     addiu $a3, $zero, 1
  /* 14734C 80137D6C 0C002E7F */       jal func_8000B9FC
  /* 147350 80137D70 AFA00010 */        sw $zero, 0x10($sp)
  /* 147354 80137D74 0C045624 */       jal func_ovl2_80115890
  /* 147358 80137D78 00000000 */       nop
  /* 14735C 80137D7C 0C03F4C0 */       jal efManager_AllocUserData
  /* 147360 80137D80 00000000 */       nop
  /* 147364 80137D84 0C04DE73 */       jal mnTrainingLoadMatchInfo
  /* 147368 80137D88 00000000 */       nop
  /* 14736C 80137D8C 24040001 */     addiu $a0, $zero, 1
  /* 147370 80137D90 0C035C65 */       jal ftManagerAllocFighter
  /* 147374 80137D94 24050004 */     addiu $a1, $zero, 4
  /* 147378 80137D98 00008025 */        or $s0, $zero, $zero
  .L80137D9C:
  /* 14737C 80137D9C 0C035E1B */       jal ftManagerSetupDataKind
  /* 147380 80137DA0 02002025 */        or $a0, $s0, $zero
  /* 147384 80137DA4 26100001 */     addiu $s0, $s0, %lo(D_NF_80000001)
  /* 147388 80137DA8 2A01000C */      slti $at, $s0, 0xc
  /* 14738C 80137DAC 1420FFFB */      bnez $at, .L80137D9C
  /* 147390 80137DB0 00000000 */       nop
  /* 147394 80137DB4 3C038014 */       lui $v1, %hi(gMNTrainingPanels)
  /* 147398 80137DB8 3C108013 */       lui $s0, %hi(gFTAnimHeapSize)
  /* 14739C 80137DBC 26100D9C */     addiu $s0, $s0, %lo(gFTAnimHeapSize)
  /* 1473A0 80137DC0 24638558 */     addiu $v1, $v1, %lo(gMNTrainingPanels)
  .L80137DC4:
  /* 1473A4 80137DC4 8E040000 */        lw $a0, ($s0) # gFTAnimHeapSize + 0
  /* 1473A8 80137DC8 24050010 */     addiu $a1, $zero, 0x10
  /* 1473AC 80137DCC 0C001260 */       jal gsMemoryAlloc
  /* 1473B0 80137DD0 AFA30028 */        sw $v1, 0x28($sp)
  /* 1473B4 80137DD4 8FA30028 */        lw $v1, 0x28($sp)
  /* 1473B8 80137DD8 3C0A8014 */       lui $t2, %hi(D_ovl28_80138838)
  /* 1473BC 80137DDC 254A8838 */     addiu $t2, $t2, %lo(D_ovl28_80138838)
  /* 1473C0 80137DE0 246300B8 */     addiu $v1, $v1, 0xb8
  /* 1473C4 80137DE4 146AFFF7 */       bne $v1, $t2, .L80137DC4
  /* 1473C8 80137DE8 AC62FF7C */        sw $v0, -0x84($v1)
  /* 1473CC 80137DEC 0C04C9F1 */       jal mnTrainingCreatePortraitViewport
  /* 1473D0 80137DF0 00000000 */       nop
  /* 1473D4 80137DF4 0C04D7FA */       jal mnTrainingCreateCursorViewport
  /* 1473D8 80137DF8 00000000 */       nop
  /* 1473DC 80137DFC 0C04D822 */       jal mnTrainingCreateDroppedTokenViewport
  /* 1473E0 80137E00 00000000 */       nop
  /* 1473E4 80137E04 0C04CAB9 */       jal mnTrainingCreatePanelViewport
  /* 1473E8 80137E08 00000000 */       nop
  /* 1473EC 80137E0C 0C04CA69 */       jal mnTrainingCreatePanelDoorsViewport
  /* 1473F0 80137E10 00000000 */       nop
  /* 1473F4 80137E14 0C04CA91 */       jal mnTrainingCreateTypeButtonViewport
  /* 1473F8 80137E18 00000000 */       nop
  /* 1473FC 80137E1C 0C04CE68 */       jal mnTrainingCreateFighterViewport
  /* 147400 80137E20 00000000 */       nop
  /* 147404 80137E24 0C04CAE1 */       jal mnTrainingCreateTeamButtonViewPort
  /* 147408 80137E28 00000000 */       nop
  /* 14740C 80137E2C 0C04D84A */       jal mnTrainingCreateHandicapCPULevelViewport
  /* 147410 80137E30 00000000 */       nop
  /* 147414 80137E34 0C04CA19 */       jal mnTrainingCreatePortraitBackgroundViewport
  /* 147418 80137E38 00000000 */       nop
  /* 14741C 80137E3C 0C04CA41 */       jal mnTrainingCreatePortraitWhiteBackgroundViewport
  /* 147420 80137E40 00000000 */       nop
  /* 147424 80137E44 0C04D872 */       jal mnTrainingCreateReadyToFightViewport
  /* 147428 80137E48 00000000 */       nop
  /* 14742C 80137E4C 0C04CC05 */       jal mnTrainingCreateBackground
  /* 147430 80137E50 00000000 */       nop
  /* 147434 80137E54 0C04C965 */       jal mnTrainingCreatePortraits
  /* 147438 80137E58 00000000 */       nop
  /* 14743C 80137E5C 0C04DF1D */       jal mnTrainingInitPanels
  /* 147440 80137E60 00000000 */       nop
  /* 147444 80137E64 0C04CC50 */       jal mnTrainingDrawTitleAndBack
  /* 147448 80137E68 00000000 */       nop
  /* 14744C 80137E6C 0C04DB76 */       jal mnTrainingCreateTokenAutopositionRoutine
  /* 147450 80137E70 00000000 */       nop
  /* 147454 80137E74 0C04DBA5 */       jal mnTrainingCreateTokenShinePulseRoutine
  /* 147458 80137E78 00000000 */       nop
  /* 14745C 80137E7C 0C04DBE1 */       jal mnTrainingCreateSyncShadeAndCostumeRoutine
  /* 147460 80137E80 00000000 */       nop
  /* 147464 80137E84 0C04DC2F */       jal mnTrainingCreateWhiteCircles
  /* 147468 80137E88 00000000 */       nop
  /* 14746C 80137E8C 0C04DCD5 */       jal mnTrainingCreateReadyToFightObjects
  /* 147470 80137E90 00000000 */       nop
  /* 147474 80137E94 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 147478 80137E98 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 14747C 80137E9C 240B00FF */     addiu $t3, $zero, 0xff
  /* 147480 80137EA0 240C00FF */     addiu $t4, $zero, 0xff
  /* 147484 80137EA4 AFAC0014 */        sw $t4, 0x14($sp)
  /* 147488 80137EA8 AFAB0010 */        sw $t3, 0x10($sp)
  /* 14748C 80137EAC 240600FF */     addiu $a2, $zero, 0xff
  /* 147490 80137EB0 240700FF */     addiu $a3, $zero, 0xff
  /* 147494 80137EB4 0C0E4138 */       jal func_ovl1_803904E0
  /* 147498 80137EB8 46006386 */     mov.s $f14, $f12
  /* 14749C 80137EBC 3C0D800A */       lui $t5, %hi((gSceneData + 0x1))
  /* 1474A0 80137EC0 91AD4AD1 */       lbu $t5, %lo((gSceneData + 0x1))($t5)
  /* 1474A4 80137EC4 24010015 */     addiu $at, $zero, 0x15
  /* 1474A8 80137EC8 00002025 */        or $a0, $zero, $zero
  /* 1474AC 80137ECC 11A10003 */       beq $t5, $at, .L80137EDC
  /* 1474B0 80137ED0 00000000 */       nop
  /* 1474B4 80137ED4 0C0082AD */       jal func_80020AB4
  /* 1474B8 80137ED8 2405000A */     addiu $a1, $zero, 0xa
  .L80137EDC:
  /* 1474BC 80137EDC 0C0099A8 */       jal func_800266A0
  /* 1474C0 80137EE0 00000000 */       nop
  /* 1474C4 80137EE4 0C009A70 */       jal func_800269C0
  /* 1474C8 80137EE8 24040212 */     addiu $a0, $zero, 0x212
  /* 1474CC 80137EEC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1474D0 80137EF0 8FB00020 */        lw $s0, 0x20($sp)
  /* 1474D4 80137EF4 27BD0068 */     addiu $sp, $sp, 0x68
  /* 1474D8 80137EF8 03E00008 */        jr $ra
  /* 1474DC 80137EFC 00000000 */       nop

glabel training_css_entry
  /* 1474E0 80137F00 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 1474E4 80137F04 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1474E8 80137F08 3C048014 */       lui $a0, %hi(D_ovl28_8013842C)
  /* 1474EC 80137F0C 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 1474F0 80137F10 2484842C */     addiu $a0, $a0, %lo(D_ovl28_8013842C)
  /* 1474F4 80137F14 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1474F8 80137F18 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 1474FC 80137F1C 0C001C09 */       jal func_80007024
  /* 147500 80137F20 AC8F000C */        sw $t7, 0xc($a0) # D_ovl28_8013842C + 12
  /* 147504 80137F24 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 147508 80137F28 3C198014 */       lui $t9, %hi(D_NF_80138CC0)
  /* 14750C 80137F2C 3C048014 */       lui $a0, %hi(D_ovl28_80138448)
  /* 147510 80137F30 27398CC0 */     addiu $t9, $t9, %lo(D_NF_80138CC0)
  /* 147514 80137F34 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 147518 80137F38 24848448 */     addiu $a0, $a0, %lo(D_ovl28_80138448)
  /* 14751C 80137F3C 03194023 */      subu $t0, $t8, $t9
  /* 147520 80137F40 0C0289A6 */       jal func_800A2698
  /* 147524 80137F44 AC880010 */        sw $t0, 0x10($a0) # D_ovl28_80138448 + 16
  /* 147528 80137F48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 14752C 80137F4C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 147530 80137F50 03E00008 */        jr $ra
  /* 147534 80137F54 00000000 */       nop

  /* 147538 80137F58 00000000 */       nop
  /* 14753C 80137F5C 00000000 */       nop

# Likely start of new file
#glabel D_ovl28_80137F60   # Routine parsed as data
#  /* 147540 80137F60 00000011 */      mthi $zero
#  /* 147544 80137F64 00000017 */     dsrav $zero, $zero, $zero
#  /* 147548 80137F68 00000000 */       nop
#  /* 14754C 80137F6C 00000014 */     dsllv $zero, $zero, $zero
#  /* 147550 80137F70 00000015 */      dlsa $zero, $zero, $zero, 1
#  /* 147554 80137F74 00000012 */      mflo $zero
#  /* 147558 80137F78 00000013 */      mtlo $zero
#  /* 14755C 80137F7C 00000016 */     dsrlv $zero, $zero, $zero
#  /* 147560 80137F80 20202000 */      addi $zero, $at, 0x2000
#  /* 147564 80137F84 20202000 */      addi $zero, $at, 0x2000
#  /* 147568 80137F88 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 14756C 80137F8C FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 147570 80137F90 14141400 */       bne $zero, $s4, 0x8013cf94 # branch target not found
#  /* 147574 80137F94 00000000 */       nop
#  /* 147578 80137F98 20202000 */      addi $zero, $at, 0x2000
#  /* 14757C 80137F9C 20202000 */      addi $zero, $at, 0x2000
#  /* 147580 80137FA0 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 147584 80137FA4 FFFFFF00 */        sd $ra, -0x100($ra)
