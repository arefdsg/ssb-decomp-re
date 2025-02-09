.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x801328F0

glabel mvOpeningGreatFoxSetupDisplayList
  /* 173A30 80131B00 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 173A34 80131B04 AFBF0014 */        sw $ra, 0x14($sp)
  /* 173A38 80131B08 8C830000 */        lw $v1, ($a0)
  /* 173A3C 80131B0C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 173A40 80131B10 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 173A44 80131B14 246E0008 */     addiu $t6, $v1, 8
  /* 173A48 80131B18 AC8E0000 */        sw $t6, ($a0)
  /* 173A4C 80131B1C 3C180002 */       lui $t8, 2
  /* 173A50 80131B20 AC780004 */        sw $t8, 4($v1)
  /* 173A54 80131B24 AC6F0000 */        sw $t7, ($v1)
  /* 173A58 80131B28 0C0E4147 */       jal func_ovl1_8039051C
  /* 173A5C 80131B2C AFA40028 */        sw $a0, 0x28($sp)
  /* 173A60 80131B30 0C0E414A */       jal func_ovl1_80390528
  /* 173A64 80131B34 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 173A68 80131B38 44060000 */      mfc1 $a2, $f0
  /* 173A6C 80131B3C 8FA40028 */        lw $a0, 0x28($sp)
  /* 173A70 80131B40 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 173A74 80131B44 8FA5001C */        lw $a1, 0x1c($sp)
  /* 173A78 80131B48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 173A7C 80131B4C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 173A80 80131B50 03E00008 */        jr $ra
  /* 173A84 80131B54 00000000 */       nop

glabel mvOpeningGreatFoxScrollBackground
  /* 173A88 80131B58 3C058013 */       lui $a1, %hi(gMvOpeningGreatFoxFramesElapsed)
  /* 173A8C 80131B5C 8CA52A18 */        lw $a1, %lo(gMvOpeningGreatFoxFramesElapsed)($a1)
  /* 173A90 80131B60 24060001 */     addiu $a2, $zero, 1
  /* 173A94 80131B64 8C820074 */        lw $v0, 0x74($a0)
  /* 173A98 80131B68 10A6000C */       beq $a1, $a2, .L80131B9C
  /* 173A9C 80131B6C 00A01825 */        or $v1, $a1, $zero
  /* 173AA0 80131B70 24010078 */     addiu $at, $zero, 0x78
  /* 173AA4 80131B74 1061000F */       beq $v1, $at, .L80131BB4
  /* 173AA8 80131B78 3C048013 */       lui $a0, 0x8013
  /* 173AAC 80131B7C 2401008C */     addiu $at, $zero, 0x8c
  /* 173AB0 80131B80 10610011 */       beq $v1, $at, .L80131BC8
  /* 173AB4 80131B84 3C048013 */       lui $a0, 0x8013
  /* 173AB8 80131B88 240100A0 */     addiu $at, $zero, 0xa0
  /* 173ABC 80131B8C 10610013 */       beq $v1, $at, .L80131BDC
  /* 173AC0 80131B90 3C048013 */       lui $a0, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  /* 173AC4 80131B94 10000016 */         b .L80131BF0
  /* 173AC8 80131B98 24842A34 */     addiu $a0, $a0, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  .L80131B9C:
  /* 173ACC 80131B9C 3C0140C0 */       lui $at, (0x40C00000 >> 16) # 6.0
  /* 173AD0 80131BA0 44812000 */      mtc1 $at, $f4 # 6.0 to cop1
  /* 173AD4 80131BA4 3C048013 */       lui $a0, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  /* 173AD8 80131BA8 24842A34 */     addiu $a0, $a0, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  /* 173ADC 80131BAC 10000010 */         b .L80131BF0
  /* 173AE0 80131BB0 E4840000 */      swc1 $f4, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131BB4:
  /* 173AE4 80131BB4 3C0140C0 */       lui $at, (0x40C00000 >> 16) # 6.0
  /* 173AE8 80131BB8 44813000 */      mtc1 $at, $f6 # 6.0 to cop1
  /* 173AEC 80131BBC 24842A34 */     addiu $a0, $a0, 0x2a34
  /* 173AF0 80131BC0 1000000B */         b .L80131BF0
  /* 173AF4 80131BC4 E4860000 */      swc1 $f6, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131BC8:
  /* 173AF8 80131BC8 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 173AFC 80131BCC 44814000 */      mtc1 $at, $f8 # 2.0 to cop1
  /* 173B00 80131BD0 24842A34 */     addiu $a0, $a0, 0x2a34
  /* 173B04 80131BD4 10000006 */         b .L80131BF0
  /* 173B08 80131BD8 E4880000 */      swc1 $f8, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131BDC:
  /* 173B0C 80131BDC 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 173B10 80131BE0 44815000 */      mtc1 $at, $f10 # 1.0 to cop1
  /* 173B14 80131BE4 3C048013 */       lui $a0, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  /* 173B18 80131BE8 24842A34 */     addiu $a0, $a0, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedX)
  /* 173B1C 80131BEC E48A0000 */      swc1 $f10, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131BF0:
  /* 173B20 80131BF0 10660008 */       beq $v1, $a2, .L80131C14
  /* 173B24 80131BF4 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 173B28 80131BF8 24010078 */     addiu $at, $zero, 0x78
  /* 173B2C 80131BFC 1061000A */       beq $v1, $at, .L80131C28
  /* 173B30 80131C00 240100A0 */     addiu $at, $zero, 0xa0
  /* 173B34 80131C04 1061000E */       beq $v1, $at, .L80131C40
  /* 173B38 80131C08 3C038013 */       lui $v1, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B3C 80131C0C 10000011 */         b .L80131C54
  /* 173B40 80131C10 24632A38 */     addiu $v1, $v1, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  .L80131C14:
  /* 173B44 80131C14 44818000 */      mtc1 $at, $f16 # 1.0 to cop1
  /* 173B48 80131C18 3C038013 */       lui $v1, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B4C 80131C1C 24632A38 */     addiu $v1, $v1, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B50 80131C20 1000000C */         b .L80131C54
  /* 173B54 80131C24 E4700000 */      swc1 $f16, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  .L80131C28:
  /* 173B58 80131C28 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 173B5C 80131C2C 44819000 */      mtc1 $at, $f18 # 1.0 to cop1
  /* 173B60 80131C30 3C038013 */       lui $v1, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B64 80131C34 24632A38 */     addiu $v1, $v1, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B68 80131C38 10000006 */         b .L80131C54
  /* 173B6C 80131C3C E4720000 */      swc1 $f18, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  .L80131C40:
  /* 173B70 80131C40 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 173B74 80131C44 44812000 */      mtc1 $at, $f4 # 3.0 to cop1
  /* 173B78 80131C48 3C038013 */       lui $v1, %hi(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B7C 80131C4C 24632A38 */     addiu $v1, $v1, %lo(gMvOpeningGreatFoxBackgroundScrollSpeedY)
  /* 173B80 80131C50 E4640000 */      swc1 $f4, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  .L80131C54:
  /* 173B84 80131C54 28A10002 */      slti $at, $a1, 2
  /* 173B88 80131C58 14200005 */      bnez $at, .L80131C70
  /* 173B8C 80131C5C 28A10078 */      slti $at, $a1, 0x78
  /* 173B90 80131C60 50200004 */      beql $at, $zero, .L80131C74
  /* 173B94 80131C64 28A10079 */      slti $at, $a1, 0x79
  /* 173B98 80131C68 C4860000 */      lwc1 $f6, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  /* 173B9C 80131C6C E4860000 */      swc1 $f6, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131C70:
  /* 173BA0 80131C70 28A10079 */      slti $at, $a1, 0x79
  .L80131C74:
  /* 173BA4 80131C74 14200007 */      bnez $at, .L80131C94
  /* 173BA8 80131C78 28A1008C */      slti $at, $a1, 0x8c
  /* 173BAC 80131C7C 10200005 */      beqz $at, .L80131C94
  /* 173BB0 80131C80 3C018013 */       lui $at, %hi(D_ovl50_801329F0)
  /* 173BB4 80131C84 C42A29F0 */      lwc1 $f10, %lo(D_ovl50_801329F0)($at)
  /* 173BB8 80131C88 C4880000 */      lwc1 $f8, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  /* 173BBC 80131C8C 460A4400 */     add.s $f16, $f8, $f10
  /* 173BC0 80131C90 E4900000 */      swc1 $f16, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131C94:
  /* 173BC4 80131C94 28A1008D */      slti $at, $a1, 0x8d
  /* 173BC8 80131C98 14200007 */      bnez $at, .L80131CB8
  /* 173BCC 80131C9C 28A100A0 */      slti $at, $a1, 0xa0
  /* 173BD0 80131CA0 10200005 */      beqz $at, .L80131CB8
  /* 173BD4 80131CA4 3C018013 */       lui $at, %hi(D_ovl50_801329F4)
  /* 173BD8 80131CA8 C42429F4 */      lwc1 $f4, %lo(D_ovl50_801329F4)($at)
  /* 173BDC 80131CAC C4920000 */      lwc1 $f18, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  /* 173BE0 80131CB0 46049180 */     add.s $f6, $f18, $f4
  /* 173BE4 80131CB4 E4860000 */      swc1 $f6, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  .L80131CB8:
  /* 173BE8 80131CB8 28A10002 */      slti $at, $a1, 2
  /* 173BEC 80131CBC 14200005 */      bnez $at, .L80131CD4
  /* 173BF0 80131CC0 28A10078 */      slti $at, $a1, 0x78
  /* 173BF4 80131CC4 50200004 */      beql $at, $zero, .L80131CD8
  /* 173BF8 80131CC8 28A10079 */      slti $at, $a1, 0x79
  /* 173BFC 80131CCC C4680000 */      lwc1 $f8, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  /* 173C00 80131CD0 E4680000 */      swc1 $f8, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  .L80131CD4:
  /* 173C04 80131CD4 28A10079 */      slti $at, $a1, 0x79
  .L80131CD8:
  /* 173C08 80131CD8 14200007 */      bnez $at, .L80131CF8
  /* 173C0C 80131CDC 28A100A0 */      slti $at, $a1, 0xa0
  /* 173C10 80131CE0 10200005 */      beqz $at, .L80131CF8
  /* 173C14 80131CE4 3C018013 */       lui $at, %hi(D_ovl50_801329F8)
  /* 173C18 80131CE8 C43029F8 */      lwc1 $f16, %lo(D_ovl50_801329F8)($at)
  /* 173C1C 80131CEC C46A0000 */      lwc1 $f10, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  /* 173C20 80131CF0 46105480 */     add.s $f18, $f10, $f16
  /* 173C24 80131CF4 E4720000 */      swc1 $f18, ($v1) # gMvOpeningGreatFoxBackgroundScrollSpeedY + 0
  .L80131CF8:
  /* 173C28 80131CF8 C4440058 */      lwc1 $f4, 0x58($v0)
  /* 173C2C 80131CFC C4860000 */      lwc1 $f6, ($a0) # gMvOpeningGreatFoxBackgroundScrollSpeedX + 0
  /* 173C30 80131D00 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 173C34 80131D04 44815000 */      mtc1 $at, $f10 # 10.0 to cop1
  /* 173C38 80131D08 46062200 */     add.s $f8, $f4, $f6
  /* 173C3C 80131D0C 3C014396 */       lui $at, 0x4396
  /* 173C40 80131D10 E4480058 */      swc1 $f8, 0x58($v0)
  /* 173C44 80131D14 C4400058 */      lwc1 $f0, 0x58($v0)
  /* 173C48 80131D18 4600503C */    c.lt.s $f10, $f0
  /* 173C4C 80131D1C 00000000 */       nop
  /* 173C50 80131D20 45020006 */     bc1fl .L80131D3C
  /* 173C54 80131D24 3C014396 */       lui $at, (0x43960000 >> 16) # 300.0
  /* 173C58 80131D28 44811000 */      mtc1 $at, $f2 # 300.0 to cop1
  /* 173C5C 80131D2C 00000000 */       nop
  /* 173C60 80131D30 46020401 */     sub.s $f16, $f0, $f2
  /* 173C64 80131D34 E4500058 */      swc1 $f16, 0x58($v0)
  /* 173C68 80131D38 3C014396 */       lui $at, (0x43960000 >> 16) # 300.0
  .L80131D3C:
  /* 173C6C 80131D3C 44811000 */      mtc1 $at, $f2 # 300.0 to cop1
  /* 173C70 80131D40 3C01C35C */       lui $at, (0xC35C0000 >> 16) # -220.0
  /* 173C74 80131D44 44819000 */      mtc1 $at, $f18 # -220.0 to cop1
  /* 173C78 80131D48 C440005C */      lwc1 $f0, 0x5c($v0)
  /* 173C7C 80131D4C 3C01435C */       lui $at, (0x435C0000 >> 16) # 220.0
  /* 173C80 80131D50 4612003C */    c.lt.s $f0, $f18
  /* 173C84 80131D54 00000000 */       nop
  /* 173C88 80131D58 45020006 */     bc1fl .L80131D74
  /* 173C8C 80131D5C C4460058 */      lwc1 $f6, 0x58($v0)
  /* 173C90 80131D60 44816000 */      mtc1 $at, $f12 # 220.0 to cop1
  /* 173C94 80131D64 00000000 */       nop
  /* 173C98 80131D68 460C0100 */     add.s $f4, $f0, $f12
  /* 173C9C 80131D6C E444005C */      swc1 $f4, 0x5c($v0)
  /* 173CA0 80131D70 C4460058 */      lwc1 $f6, 0x58($v0)
  .L80131D74:
  /* 173CA4 80131D74 8C4E0008 */        lw $t6, 8($v0)
  /* 173CA8 80131D78 3C01435C */       lui $at, (0x435C0000 >> 16) # 220.0
  /* 173CAC 80131D7C 46023200 */     add.s $f8, $f6, $f2
  /* 173CB0 80131D80 44816000 */      mtc1 $at, $f12 # 220.0 to cop1
  /* 173CB4 80131D84 E5C80058 */      swc1 $f8, 0x58($t6)
  /* 173CB8 80131D88 8C4F0008 */        lw $t7, 8($v0)
  /* 173CBC 80131D8C C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 173CC0 80131D90 E5EA005C */      swc1 $f10, 0x5c($t7)
  /* 173CC4 80131D94 8C580008 */        lw $t8, 8($v0)
  /* 173CC8 80131D98 C4500058 */      lwc1 $f16, 0x58($v0)
  /* 173CCC 80131D9C 8F190008 */        lw $t9, 8($t8)
  /* 173CD0 80131DA0 E7300058 */      swc1 $f16, 0x58($t9)
  /* 173CD4 80131DA4 C452005C */      lwc1 $f18, 0x5c($v0)
  /* 173CD8 80131DA8 8C480008 */        lw $t0, 8($v0)
  /* 173CDC 80131DAC 460C9100 */     add.s $f4, $f18, $f12
  /* 173CE0 80131DB0 8D090008 */        lw $t1, 8($t0)
  /* 173CE4 80131DB4 E524005C */      swc1 $f4, 0x5c($t1)
  /* 173CE8 80131DB8 8C4A0008 */        lw $t2, 8($v0)
  /* 173CEC 80131DBC C4460058 */      lwc1 $f6, 0x58($v0)
  /* 173CF0 80131DC0 8D4B0008 */        lw $t3, 8($t2)
  /* 173CF4 80131DC4 46023200 */     add.s $f8, $f6, $f2
  /* 173CF8 80131DC8 8D6C0008 */        lw $t4, 8($t3)
  /* 173CFC 80131DCC E5880058 */      swc1 $f8, 0x58($t4)
  /* 173D00 80131DD0 8C4D0008 */        lw $t5, 8($v0)
  /* 173D04 80131DD4 C44A005C */      lwc1 $f10, 0x5c($v0)
  /* 173D08 80131DD8 8DAE0008 */        lw $t6, 8($t5)
  /* 173D0C 80131DDC 460C5400 */     add.s $f16, $f10, $f12
  /* 173D10 80131DE0 8DCF0008 */        lw $t7, 8($t6)
  /* 173D14 80131DE4 03E00008 */        jr $ra
  /* 173D18 80131DE8 E5F0005C */      swc1 $f16, 0x5c($t7)

glabel mvOpeningGreatFoxCreateBackground
  /* 173D1C 80131DEC 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 173D20 80131DF0 AFB0001C */        sw $s0, 0x1c($sp)
  /* 173D24 80131DF4 3C108000 */       lui $s0, 0x8000
  /* 173D28 80131DF8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 173D2C 80131DFC AFB10020 */        sw $s1, 0x20($sp)
  /* 173D30 80131E00 02003825 */        or $a3, $s0, $zero
  /* 173D34 80131E04 00002025 */        or $a0, $zero, $zero
  /* 173D38 80131E08 00002825 */        or $a1, $zero, $zero
  /* 173D3C 80131E0C 0C00265A */       jal omMakeGObjSPAfter
  /* 173D40 80131E10 24060014 */     addiu $a2, $zero, 0x14
  /* 173D44 80131E14 3C018013 */       lui $at, %hi(gMvOpeningGreatFoxBackgroundGObj)
  /* 173D48 80131E18 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 173D4C 80131E1C 240EFFFF */     addiu $t6, $zero, -1
  /* 173D50 80131E20 AC222A20 */        sw $v0, %lo(gMvOpeningGreatFoxBackgroundGObj)($at)
  /* 173D54 80131E24 00408825 */        or $s1, $v0, $zero
  /* 173D58 80131E28 AFAE0010 */        sw $t6, 0x10($sp)
  /* 173D5C 80131E2C 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 173D60 80131E30 00402025 */        or $a0, $v0, $zero
  /* 173D64 80131E34 2406001C */     addiu $a2, $zero, 0x1c
  /* 173D68 80131E38 0C00277D */       jal omAddGObjRenderProc
  /* 173D6C 80131E3C 02003825 */        or $a3, $s0, $zero
  /* 173D70 80131E40 3C058013 */       lui $a1, %hi(mvOpeningGreatFoxScrollBackground)
  /* 173D74 80131E44 24A51B58 */     addiu $a1, $a1, %lo(mvOpeningGreatFoxScrollBackground)
  /* 173D78 80131E48 02202025 */        or $a0, $s1, $zero
  /* 173D7C 80131E4C 24060001 */     addiu $a2, $zero, 1
  /* 173D80 80131E50 0C002062 */       jal omAddGObjCommonProc
  /* 173D84 80131E54 24070001 */     addiu $a3, $zero, 1
  /* 173D88 80131E58 3C0F8013 */       lui $t7, %hi(D_ovl50_80132C08)
  /* 173D8C 80131E5C 8DEF2C08 */        lw $t7, %lo(D_ovl50_80132C08)($t7)
  /* 173D90 80131E60 3C100002 */       lui $s0, %hi(D_NF_00026C88)
  /* 173D94 80131E64 26106C88 */     addiu $s0, $s0, %lo(D_NF_00026C88)
  /* 173D98 80131E68 02202025 */        or $a0, $s1, $zero
  /* 173D9C 80131E6C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 173DA0 80131E70 01F02821 */      addu $a1, $t7, $s0
  /* 173DA4 80131E74 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 173DA8 80131E78 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 173DAC 80131E7C 94580024 */       lhu $t8, 0x24($v0)
  /* 173DB0 80131E80 3C088013 */       lui $t0, %hi(D_ovl50_80132C08)
  /* 173DB4 80131E84 E4400058 */      swc1 $f0, 0x58($v0)
  /* 173DB8 80131E88 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 173DBC 80131E8C A4590024 */        sh $t9, 0x24($v0)
  /* 173DC0 80131E90 E440005C */      swc1 $f0, 0x5c($v0)
  /* 173DC4 80131E94 8D082C08 */        lw $t0, %lo(D_ovl50_80132C08)($t0)
  /* 173DC8 80131E98 02202025 */        or $a0, $s1, $zero
  /* 173DCC 80131E9C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 173DD0 80131EA0 01102821 */      addu $a1, $t0, $s0
  /* 173DD4 80131EA4 3C01439B */       lui $at, (0x439B0000 >> 16) # 310.0
  /* 173DD8 80131EA8 44812000 */      mtc1 $at, $f4 # 310.0 to cop1
  /* 173DDC 80131EAC 94490024 */       lhu $t1, 0x24($v0)
  /* 173DE0 80131EB0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 173DE4 80131EB4 44813000 */      mtc1 $at, $f6 # 10.0 to cop1
  /* 173DE8 80131EB8 312AFFDF */      andi $t2, $t1, 0xffdf
  /* 173DEC 80131EBC A44A0024 */        sh $t2, 0x24($v0)
  /* 173DF0 80131EC0 3C0B8013 */       lui $t3, %hi(D_ovl50_80132C08)
  /* 173DF4 80131EC4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 173DF8 80131EC8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 173DFC 80131ECC 8D6B2C08 */        lw $t3, %lo(D_ovl50_80132C08)($t3)
  /* 173E00 80131ED0 02202025 */        or $a0, $s1, $zero
  /* 173E04 80131ED4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 173E08 80131ED8 01702821 */      addu $a1, $t3, $s0
  /* 173E0C 80131EDC 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 173E10 80131EE0 44814000 */      mtc1 $at, $f8 # 10.0 to cop1
  /* 173E14 80131EE4 944C0024 */       lhu $t4, 0x24($v0)
  /* 173E18 80131EE8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 173E1C 80131EEC 44815000 */      mtc1 $at, $f10 # 230.0 to cop1
  /* 173E20 80131EF0 318DFFDF */      andi $t5, $t4, 0xffdf
  /* 173E24 80131EF4 A44D0024 */        sh $t5, 0x24($v0)
  /* 173E28 80131EF8 3C0E8013 */       lui $t6, %hi(D_ovl50_80132C08)
  /* 173E2C 80131EFC E4480058 */      swc1 $f8, 0x58($v0)
  /* 173E30 80131F00 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 173E34 80131F04 8DCE2C08 */        lw $t6, %lo(D_ovl50_80132C08)($t6)
  /* 173E38 80131F08 02202025 */        or $a0, $s1, $zero
  /* 173E3C 80131F0C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 173E40 80131F10 01D02821 */      addu $a1, $t6, $s0
  /* 173E44 80131F14 3C01439B */       lui $at, (0x439B0000 >> 16) # 310.0
  /* 173E48 80131F18 44818000 */      mtc1 $at, $f16 # 310.0 to cop1
  /* 173E4C 80131F1C 944F0024 */       lhu $t7, 0x24($v0)
  /* 173E50 80131F20 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 173E54 80131F24 44819000 */      mtc1 $at, $f18 # 230.0 to cop1
  /* 173E58 80131F28 31F8FFDF */      andi $t8, $t7, 0xffdf
  /* 173E5C 80131F2C A4580024 */        sh $t8, 0x24($v0)
  /* 173E60 80131F30 E4500058 */      swc1 $f16, 0x58($v0)
  /* 173E64 80131F34 E452005C */      swc1 $f18, 0x5c($v0)
  /* 173E68 80131F38 8FBF0024 */        lw $ra, 0x24($sp)
  /* 173E6C 80131F3C 8FB10020 */        lw $s1, 0x20($sp)
  /* 173E70 80131F40 8FB0001C */        lw $s0, 0x1c($sp)
  /* 173E74 80131F44 03E00008 */        jr $ra
  /* 173E78 80131F48 27BD0028 */     addiu $sp, $sp, 0x28

glabel mvOpeningGreatFoxCreateGreatFox
  /* 173E7C 80131F4C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 173E80 80131F50 AFBF0024 */        sw $ra, 0x24($sp)
  /* 173E84 80131F54 AFB00020 */        sw $s0, 0x20($sp)
  /* 173E88 80131F58 00002025 */        or $a0, $zero, $zero
  /* 173E8C 80131F5C 00002825 */        or $a1, $zero, $zero
  /* 173E90 80131F60 24060013 */     addiu $a2, $zero, 0x13
  /* 173E94 80131F64 0C00265A */       jal omMakeGObjSPAfter
  /* 173E98 80131F68 3C078000 */       lui $a3, 0x8000
  /* 173E9C 80131F6C 3C0E8013 */       lui $t6, %hi(D_ovl50_80132C00)
  /* 173EA0 80131F70 8DCE2C00 */        lw $t6, %lo(D_ovl50_80132C00)($t6)
  /* 173EA4 80131F74 3C0F0001 */       lui $t7, %hi(D_NF_0000D820)
  /* 173EA8 80131F78 3C018013 */       lui $at, %hi(gMvOpeningGreatFoxGreatFoxGObj)
  /* 173EAC 80131F7C 25EFD820 */     addiu $t7, $t7, %lo(D_NF_0000D820)
  /* 173EB0 80131F80 AC222A1C */        sw $v0, %lo(gMvOpeningGreatFoxGreatFoxGObj)($at)
  /* 173EB4 80131F84 00408025 */        or $s0, $v0, $zero
  /* 173EB8 80131F88 00402025 */        or $a0, $v0, $zero
  /* 173EBC 80131F8C 00003025 */        or $a2, $zero, $zero
  /* 173EC0 80131F90 2407001C */     addiu $a3, $zero, 0x1c
  /* 173EC4 80131F94 AFA00010 */        sw $zero, 0x10($sp)
  /* 173EC8 80131F98 AFA00014 */        sw $zero, 0x14($sp)
  /* 173ECC 80131F9C 0C003D64 */       jal func_8000F590
  /* 173ED0 80131FA0 01CF2821 */      addu $a1, $t6, $t7
  /* 173ED4 80131FA4 3C058001 */       lui $a1, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 173ED8 80131FA8 2418FFFF */     addiu $t8, $zero, -1
  /* 173EDC 80131FAC AFB80010 */        sw $t8, 0x10($sp)
  /* 173EE0 80131FB0 24A54768 */     addiu $a1, $a1, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 173EE4 80131FB4 02002025 */        or $a0, $s0, $zero
  /* 173EE8 80131FB8 2406001B */     addiu $a2, $zero, 0x1b
  /* 173EEC 80131FBC 0C00277D */       jal omAddGObjRenderProc
  /* 173EF0 80131FC0 3C078000 */       lui $a3, 0x8000
  /* 173EF4 80131FC4 44800000 */      mtc1 $zero, $f0
  /* 173EF8 80131FC8 8E190074 */        lw $t9, 0x74($s0)
  /* 173EFC 80131FCC 3C0A8013 */       lui $t2, %hi(D_ovl50_80132C00)
  /* 173F00 80131FD0 3C0B0001 */       lui $t3, %hi(D_NF_0000DA10)
  /* 173F04 80131FD4 E720001C */      swc1 $f0, 0x1c($t9)
  /* 173F08 80131FD8 8E080074 */        lw $t0, 0x74($s0)
  /* 173F0C 80131FDC 256BDA10 */     addiu $t3, $t3, %lo(D_NF_0000DA10)
  /* 173F10 80131FE0 44060000 */      mfc1 $a2, $f0
  /* 173F14 80131FE4 E5000020 */      swc1 $f0, 0x20($t0)
  /* 173F18 80131FE8 8E090074 */        lw $t1, 0x74($s0)
  /* 173F1C 80131FEC 02002025 */        or $a0, $s0, $zero
  /* 173F20 80131FF0 E5200024 */      swc1 $f0, 0x24($t1)
  /* 173F24 80131FF4 8D4A2C00 */        lw $t2, %lo(D_ovl50_80132C00)($t2)
  /* 173F28 80131FF8 0C002F63 */       jal func_8000BD8C
  /* 173F2C 80131FFC 014B2821 */      addu $a1, $t2, $t3
  /* 173F30 80132000 3C058001 */       lui $a1, %hi(func_8000DF34)
  /* 173F34 80132004 24A5DF34 */     addiu $a1, $a1, %lo(func_8000DF34)
  /* 173F38 80132008 02002025 */        or $a0, $s0, $zero
  /* 173F3C 8013200C 24060001 */     addiu $a2, $zero, 1
  /* 173F40 80132010 0C002062 */       jal omAddGObjCommonProc
  /* 173F44 80132014 24070001 */     addiu $a3, $zero, 1
  /* 173F48 80132018 8FBF0024 */        lw $ra, 0x24($sp)
  /* 173F4C 8013201C 8FB00020 */        lw $s0, 0x20($sp)
  /* 173F50 80132020 27BD0028 */     addiu $sp, $sp, 0x28
  /* 173F54 80132024 03E00008 */        jr $ra
  /* 173F58 80132028 00000000 */       nop

glabel mvOpeningGreatFoxRenderCockpit
  /* 173F5C 8013202C 3C0C8013 */       lui $t4, %hi(gMvOpeningGreatFoxCockpitAlpha)
  /* 173F60 80132030 258C2A3C */     addiu $t4, $t4, %lo(gMvOpeningGreatFoxCockpitAlpha)
  /* 173F64 80132034 8D820000 */        lw $v0, ($t4) # gMvOpeningGreatFoxCockpitAlpha + 0
  /* 173F68 80132038 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 173F6C 8013203C AFBF0014 */        sw $ra, 0x14($sp)
  /* 173F70 80132040 284100FF */      slti $at, $v0, 0xff
  /* 173F74 80132044 10200007 */      beqz $at, .L80132064
  /* 173F78 80132048 8C8B0074 */        lw $t3, 0x74($a0)
  /* 173F7C 8013204C 244E0009 */     addiu $t6, $v0, 9
  /* 173F80 80132050 29C10100 */      slti $at, $t6, 0x100
  /* 173F84 80132054 14200003 */      bnez $at, .L80132064
  /* 173F88 80132058 AD8E0000 */        sw $t6, ($t4) # gMvOpeningGreatFoxCockpitAlpha + 0
  /* 173F8C 8013205C 241800FF */     addiu $t8, $zero, 0xff
  /* 173F90 80132060 AD980000 */        sw $t8, ($t4) # gMvOpeningGreatFoxCockpitAlpha + 0
  .L80132064:
  /* 173F94 80132064 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 173F98 80132068 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 173F9C 8013206C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 173FA0 80132070 3C0DE700 */       lui $t5, 0xe700
  /* 173FA4 80132074 3C0FE300 */       lui $t7, (0xE3000A01 >> 16) # 3808430593
  /* 173FA8 80132078 24590008 */     addiu $t9, $v0, 8
  /* 173FAC 8013207C AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 173FB0 80132080 AC400004 */        sw $zero, 4($v0)
  /* 173FB4 80132084 AC4D0000 */        sw $t5, ($v0)
  /* 173FB8 80132088 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 173FBC 8013208C 35EF0A01 */       ori $t7, $t7, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 173FC0 80132090 3C19FA00 */       lui $t9, 0xfa00
  /* 173FC4 80132094 244E0008 */     addiu $t6, $v0, 8
  /* 173FC8 80132098 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 173FCC 8013209C AC400004 */        sw $zero, 4($v0)
  /* 173FD0 801320A0 AC4F0000 */        sw $t7, ($v0)
  /* 173FD4 801320A4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 173FD8 801320A8 24580008 */     addiu $t8, $v0, 8
  /* 173FDC 801320AC AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 173FE0 801320B0 AC590000 */        sw $t9, ($v0)
  /* 173FE4 801320B4 8D8D0000 */        lw $t5, ($t4) # gMvOpeningGreatFoxCockpitAlpha + 0
  /* 173FE8 801320B8 3C18FB00 */       lui $t8, 0xfb00
  /* 173FEC 801320BC 31AE00FF */      andi $t6, $t5, 0xff
  /* 173FF0 801320C0 AC4E0004 */        sw $t6, 4($v0)
  /* 173FF4 801320C4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 173FF8 801320C8 244F0008 */     addiu $t7, $v0, 8
  /* 173FFC 801320CC AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 174000 801320D0 AC580000 */        sw $t8, ($v0)
  /* 174004 801320D4 91780061 */       lbu $t8, 0x61($t3)
  /* 174008 801320D8 916D0060 */       lbu $t5, 0x60($t3)
  /* 17400C 801320DC 3C0FFCFF */       lui $t7, (0xFCFFFFFF >> 16) # 4244635647
  /* 174010 801320E0 0018CC00 */       sll $t9, $t8, 0x10
  /* 174014 801320E4 91780062 */       lbu $t8, 0x62($t3)
  /* 174018 801320E8 000D7600 */       sll $t6, $t5, 0x18
  /* 17401C 801320EC 01D96825 */        or $t5, $t6, $t9
  /* 174020 801320F0 00187200 */       sll $t6, $t8, 8
  /* 174024 801320F4 91780063 */       lbu $t8, 0x63($t3)
  /* 174028 801320F8 01AEC825 */        or $t9, $t5, $t6
  /* 17402C 801320FC 35EFFFFF */       ori $t7, $t7, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 174030 80132100 03386825 */        or $t5, $t9, $t8
  /* 174034 80132104 AC4D0004 */        sw $t5, 4($v0)
  /* 174038 80132108 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 17403C 8013210C 3C19FFFC */       lui $t9, (0xFFFCF67B >> 16) # 4294768251
  /* 174040 80132110 3739F67B */       ori $t9, $t9, (0xFFFCF67B & 0xFFFF) # 4294768251
  /* 174044 80132114 244E0008 */     addiu $t6, $v0, 8
  /* 174048 80132118 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 17404C 8013211C AC590004 */        sw $t9, 4($v0)
  /* 174050 80132120 AC4F0000 */        sw $t7, ($v0)
  /* 174054 80132124 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 174058 80132128 3C0E0050 */       lui $t6, (0x5041C8 >> 16) # 5259720
  /* 17405C 8013212C 3C0DE200 */       lui $t5, (0xE200001C >> 16) # 3791650844
  /* 174060 80132130 24580008 */     addiu $t8, $v0, 8
  /* 174064 80132134 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 174068 80132138 35AD001C */       ori $t5, $t5, (0xE200001C & 0xFFFF) # 3791650844
  /* 17406C 8013213C 35CE41C8 */       ori $t6, $t6, (0x5041C8 & 0xFFFF) # 5259720
  /* 174070 80132140 AC4E0004 */        sw $t6, 4($v0)
  /* 174074 80132144 0C0333DD */       jal func_ovl0_800CCF74
  /* 174078 80132148 AC4D0000 */        sw $t5, ($v0)
  /* 17407C 8013214C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 174080 80132150 27BD0018 */     addiu $sp, $sp, 0x18
  /* 174084 80132154 03E00008 */        jr $ra
  /* 174088 80132158 00000000 */       nop

glabel mvOpeningGreatFoxAnimateCockpit
  /* 17408C 8013215C 8C820074 */        lw $v0, 0x74($a0)
  /* 174090 80132160 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 174094 80132164 44811000 */      mtc1 $at, $f2 # 1.0 to cop1
  /* 174098 80132168 3C018013 */       lui $at, %hi(D_ovl50_801329FC)
  /* 17409C 8013216C C42429FC */      lwc1 $f4, %lo(D_ovl50_801329FC)($at)
  /* 1740A0 80132170 C4400018 */      lwc1 $f0, 0x18($v0)
  /* 1740A4 80132174 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1740A8 80132178 46040000 */     add.s $f0, $f0, $f4
  /* 1740AC 8013217C 4600103C */    c.lt.s $f2, $f0
  /* 1740B0 80132180 00000000 */       nop
  /* 1740B4 80132184 45020003 */     bc1fl .L80132194
  /* 1740B8 80132188 44811000 */      mtc1 $at, $f2 # 2.0 to cop1
  /* 1740BC 8013218C 46001006 */     mov.s $f0, $f2
  /* 1740C0 80132190 44811000 */      mtc1 $at, $f2 # 2.0 to cop1
  .L80132194:
  /* 1740C4 80132194 3C014320 */       lui $at, (0x43200000 >> 16) # 160.0
  /* 1740C8 80132198 44813000 */      mtc1 $at, $f6 # 160.0 to cop1
  /* 1740CC 8013219C 3C0143A0 */       lui $at, (0x43A00000 >> 16) # 320.0
  /* 1740D0 801321A0 44814000 */      mtc1 $at, $f8 # 320.0 to cop1
  /* 1740D4 801321A4 3C0142F0 */       lui $at, (0x42F00000 >> 16) # 120.0
  /* 1740D8 801321A8 44812000 */      mtc1 $at, $f4 # 120.0 to cop1
  /* 1740DC 801321AC 46004282 */     mul.s $f10, $f8, $f0
  /* 1740E0 801321B0 3C014370 */       lui $at, (0x43700000 >> 16) # 240.0
  /* 1740E4 801321B4 44814000 */      mtc1 $at, $f8 # 240.0 to cop1
  /* 1740E8 801321B8 E4400018 */      swc1 $f0, 0x18($v0)
  /* 1740EC 801321BC E440001C */      swc1 $f0, 0x1c($v0)
  /* 1740F0 801321C0 46025403 */     div.s $f16, $f10, $f2
  /* 1740F4 801321C4 46004282 */     mul.s $f10, $f8, $f0
  /* 1740F8 801321C8 46103481 */     sub.s $f18, $f6, $f16
  /* 1740FC 801321CC 46025183 */     div.s $f6, $f10, $f2
  /* 174100 801321D0 E4520058 */      swc1 $f18, 0x58($v0)
  /* 174104 801321D4 46062401 */     sub.s $f16, $f4, $f6
  /* 174108 801321D8 03E00008 */        jr $ra
  /* 17410C 801321DC E450005C */      swc1 $f16, 0x5c($v0)

glabel mvOpeningGreatFoxCreateCockpit
  /* 174110 801321E0 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 174114 801321E4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 174118 801321E8 3C018013 */       lui $at, %hi(gMvOpeningGreatFoxCockpitAlpha)
  /* 17411C 801321EC AC202A3C */        sw $zero, %lo(gMvOpeningGreatFoxCockpitAlpha)($at)
  /* 174120 801321F0 00002025 */        or $a0, $zero, $zero
  /* 174124 801321F4 00002825 */        or $a1, $zero, $zero
  /* 174128 801321F8 24060015 */     addiu $a2, $zero, 0x15
  /* 17412C 801321FC 0C00265A */       jal omMakeGObjSPAfter
  /* 174130 80132200 3C078000 */       lui $a3, 0x8000
  /* 174134 80132204 3C058013 */       lui $a1, %hi(mvOpeningGreatFoxRenderCockpit)
  /* 174138 80132208 240EFFFF */     addiu $t6, $zero, -1
  /* 17413C 8013220C AFA20024 */        sw $v0, 0x24($sp)
  /* 174140 80132210 AFAE0010 */        sw $t6, 0x10($sp)
  /* 174144 80132214 24A5202C */     addiu $a1, $a1, %lo(mvOpeningGreatFoxRenderCockpit)
  /* 174148 80132218 00402025 */        or $a0, $v0, $zero
  /* 17414C 8013221C 2406001D */     addiu $a2, $zero, 0x1d
  /* 174150 80132220 0C00277D */       jal omAddGObjRenderProc
  /* 174154 80132224 3C078000 */       lui $a3, 0x8000
  /* 174158 80132228 3C058013 */       lui $a1, %hi(mvOpeningGreatFoxAnimateCockpit)
  /* 17415C 8013222C 24A5215C */     addiu $a1, $a1, %lo(mvOpeningGreatFoxAnimateCockpit)
  /* 174160 80132230 8FA40024 */        lw $a0, 0x24($sp)
  /* 174164 80132234 24060001 */     addiu $a2, $zero, 1
  /* 174168 80132238 0C002062 */       jal omAddGObjCommonProc
  /* 17416C 8013223C 24070001 */     addiu $a3, $zero, 1
  /* 174170 80132240 3C0F8013 */       lui $t7, %hi(D_ovl50_80132C00)
  /* 174174 80132244 8DEF2C00 */        lw $t7, %lo(D_ovl50_80132C00)($t7)
  /* 174178 80132248 3C180004 */       lui $t8, %hi(D_NF_0003CC90)
  /* 17417C 8013224C 2718CC90 */     addiu $t8, $t8, %lo(D_NF_0003CC90)
  /* 174180 80132250 8FA40024 */        lw $a0, 0x24($sp)
  /* 174184 80132254 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 174188 80132258 01F82821 */      addu $a1, $t7, $t8
  /* 17418C 8013225C 94590024 */       lhu $t9, 0x24($v0)
  /* 174190 80132260 3C013E80 */       lui $at, (0x3E800000 >> 16) # 0.25
  /* 174194 80132264 44810000 */      mtc1 $at, $f0 # 0.25 to cop1
  /* 174198 80132268 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 17419C 8013226C A4490024 */        sh $t1, 0x24($v0)
  /* 1741A0 80132270 352A0001 */       ori $t2, $t1, 1
  /* 1741A4 80132274 A44A0024 */        sh $t2, 0x24($v0)
  /* 1741A8 80132278 E4400018 */      swc1 $f0, 0x18($v0)
  /* 1741AC 8013227C E440001C */      swc1 $f0, 0x1c($v0)
  /* 1741B0 80132280 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1741B4 80132284 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1741B8 80132288 03E00008 */        jr $ra
  /* 1741BC 8013228C 00000000 */       nop

glabel mvOpeningGreatFoxCreateArwings
  /* 1741C0 80132290 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 1741C4 80132294 3C0F8013 */       lui $t7, %hi(dMvOpeningGreatFoxArwingAnimOffsets)
  /* 1741C8 80132298 AFBF004C */        sw $ra, 0x4c($sp)
  /* 1741CC 8013229C AFBE0048 */        sw $fp, 0x48($sp)
  /* 1741D0 801322A0 AFB70044 */        sw $s7, 0x44($sp)
  /* 1741D4 801322A4 AFB60040 */        sw $s6, 0x40($sp)
  /* 1741D8 801322A8 AFB5003C */        sw $s5, 0x3c($sp)
  /* 1741DC 801322AC AFB40038 */        sw $s4, 0x38($sp)
  /* 1741E0 801322B0 AFB30034 */        sw $s3, 0x34($sp)
  /* 1741E4 801322B4 AFB20030 */        sw $s2, 0x30($sp)
  /* 1741E8 801322B8 AFB1002C */        sw $s1, 0x2c($sp)
  /* 1741EC 801322BC AFB00028 */        sw $s0, 0x28($sp)
  /* 1741F0 801322C0 F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 1741F4 801322C4 25EF2930 */     addiu $t7, $t7, %lo(dMvOpeningGreatFoxArwingAnimOffsets)
  /* 1741F8 801322C8 8DF90000 */        lw $t9, ($t7) # dMvOpeningGreatFoxArwingAnimOffsets + 0
  /* 1741FC 801322CC 27AE0068 */     addiu $t6, $sp, 0x68
  /* 174200 801322D0 8DF80004 */        lw $t8, 4($t7) # dMvOpeningGreatFoxArwingAnimOffsets + 4
  /* 174204 801322D4 ADD90000 */        sw $t9, ($t6)
  /* 174208 801322D8 8DF90008 */        lw $t9, 8($t7) # dMvOpeningGreatFoxArwingAnimOffsets + 8
  /* 17420C 801322DC 3C128013 */       lui $s2, %hi(gMvOpeningGreatFoxArwingGObjs)
  /* 174210 801322E0 3C148013 */       lui $s4, %hi(D_ovl50_80132C00)
  /* 174214 801322E4 3C150000 */       lui $s5, %hi(D_NF_00002C30)
  /* 174218 801322E8 3C168001 */       lui $s6, %hi(odRenderDObjTreeDLLinksForGObj)
  /* 17421C 801322EC 3C178001 */       lui $s7, %hi(func_8000DF34)
  /* 174220 801322F0 4480A000 */      mtc1 $zero, $f20
  /* 174224 801322F4 26F7DF34 */     addiu $s7, $s7, %lo(func_8000DF34)
  /* 174228 801322F8 26D64768 */     addiu $s6, $s6, %lo(odRenderDObjTreeDLLinksForGObj)
  /* 17422C 801322FC 26B52C30 */     addiu $s5, $s5, %lo(D_NF_00002C30)
  /* 174230 80132300 26942C00 */     addiu $s4, $s4, %lo(D_ovl50_80132C00)
  /* 174234 80132304 26522A28 */     addiu $s2, $s2, %lo(gMvOpeningGreatFoxArwingGObjs)
  /* 174238 80132308 27B10068 */     addiu $s1, $sp, 0x68
  /* 17423C 8013230C 3C138000 */       lui $s3, 0x8000
  /* 174240 80132310 27BE0074 */     addiu $fp, $sp, 0x74
  /* 174244 80132314 ADD80004 */        sw $t8, 4($t6)
  /* 174248 80132318 ADD90008 */        sw $t9, 8($t6)
  .L8013231C:
  /* 17424C 8013231C 00002025 */        or $a0, $zero, $zero
  /* 174250 80132320 00002825 */        or $a1, $zero, $zero
  /* 174254 80132324 24060013 */     addiu $a2, $zero, 0x13
  /* 174258 80132328 0C00265A */       jal omMakeGObjSPAfter
  /* 17425C 8013232C 02603825 */        or $a3, $s3, $zero
  /* 174260 80132330 8E880004 */        lw $t0, 4($s4) # D_ovl50_80132C00 + 4
  /* 174264 80132334 00408025 */        or $s0, $v0, $zero
  /* 174268 80132338 AE420000 */        sw $v0, ($s2) # gMvOpeningGreatFoxArwingGObjs + 0
  /* 17426C 8013233C 00402025 */        or $a0, $v0, $zero
  /* 174270 80132340 00003025 */        or $a2, $zero, $zero
  /* 174274 80132344 2407001C */     addiu $a3, $zero, 0x1c
  /* 174278 80132348 AFA00010 */        sw $zero, 0x10($sp)
  /* 17427C 8013234C AFA00014 */        sw $zero, 0x14($sp)
  /* 174280 80132350 0C003D64 */       jal func_8000F590
  /* 174284 80132354 01152821 */      addu $a1, $t0, $s5
  /* 174288 80132358 2409FFFF */     addiu $t1, $zero, -1
  /* 17428C 8013235C AFA90010 */        sw $t1, 0x10($sp)
  /* 174290 80132360 02002025 */        or $a0, $s0, $zero
  /* 174294 80132364 02C02825 */        or $a1, $s6, $zero
  /* 174298 80132368 2406001B */     addiu $a2, $zero, 0x1b
  /* 17429C 8013236C 0C00277D */       jal omAddGObjRenderProc
  /* 1742A0 80132370 02603825 */        or $a3, $s3, $zero
  /* 1742A4 80132374 8E2A0000 */        lw $t2, ($s1)
  /* 1742A8 80132378 8E8B0000 */        lw $t3, ($s4) # D_ovl50_80132C00 + 0
  /* 1742AC 8013237C 4406A000 */      mfc1 $a2, $f20
  /* 1742B0 80132380 02002025 */        or $a0, $s0, $zero
  /* 1742B4 80132384 0C002F63 */       jal func_8000BD8C
  /* 1742B8 80132388 014B2821 */      addu $a1, $t2, $t3
  /* 1742BC 8013238C 02002025 */        or $a0, $s0, $zero
  /* 1742C0 80132390 02E02825 */        or $a1, $s7, $zero
  /* 1742C4 80132394 24060001 */     addiu $a2, $zero, 1
  /* 1742C8 80132398 0C002062 */       jal omAddGObjCommonProc
  /* 1742CC 8013239C 24070001 */     addiu $a3, $zero, 1
  /* 1742D0 801323A0 26310004 */     addiu $s1, $s1, 4
  /* 1742D4 801323A4 163EFFDD */       bne $s1, $fp, .L8013231C
  /* 1742D8 801323A8 26520004 */     addiu $s2, $s2, 4
  /* 1742DC 801323AC 8FBF004C */        lw $ra, 0x4c($sp)
  /* 1742E0 801323B0 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 1742E4 801323B4 8FB00028 */        lw $s0, 0x28($sp)
  /* 1742E8 801323B8 8FB1002C */        lw $s1, 0x2c($sp)
  /* 1742EC 801323BC 8FB20030 */        lw $s2, 0x30($sp)
  /* 1742F0 801323C0 8FB30034 */        lw $s3, 0x34($sp)
  /* 1742F4 801323C4 8FB40038 */        lw $s4, 0x38($sp)
  /* 1742F8 801323C8 8FB5003C */        lw $s5, 0x3c($sp)
  /* 1742FC 801323CC 8FB60040 */        lw $s6, 0x40($sp)
  /* 174300 801323D0 8FB70044 */        lw $s7, 0x44($sp)
  /* 174304 801323D4 8FBE0048 */        lw $fp, 0x48($sp)
  /* 174308 801323D8 03E00008 */        jr $ra
  /* 17430C 801323DC 27BD0078 */     addiu $sp, $sp, 0x78

glabel mvOpeningGreatFoxMainCameraProc
  /* 174310 801323E0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 174314 801323E4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 174318 801323E8 0C004160 */       jal func_80010580
  /* 17431C 801323EC 00000000 */       nop
  /* 174320 801323F0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 174324 801323F4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 174328 801323F8 03E00008 */        jr $ra
  /* 17432C 801323FC 00000000 */       nop

glabel mvOpeningGreatFoxCreateMainViewport
  /* 174330 80132400 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 174334 80132404 3C0E8001 */       lui $t6, %hi(func_80017EC0)
  /* 174338 80132408 AFBF0044 */        sw $ra, 0x44($sp)
  /* 17433C 8013240C 25CE7EC0 */     addiu $t6, $t6, %lo(func_80017EC0)
  /* 174340 80132410 240F0028 */     addiu $t7, $zero, 0x28
  /* 174344 80132414 24180000 */     addiu $t8, $zero, 0
  /* 174348 80132418 3C190800 */       lui $t9, 0x800
  /* 17434C 8013241C 2408FFFF */     addiu $t0, $zero, -1
  /* 174350 80132420 24090001 */     addiu $t1, $zero, 1
  /* 174354 80132424 240A0001 */     addiu $t2, $zero, 1
  /* 174358 80132428 240B0001 */     addiu $t3, $zero, 1
  /* 17435C 8013242C AFB00040 */        sw $s0, 0x40($sp)
  /* 174360 80132430 AFAB0030 */        sw $t3, 0x30($sp)
  /* 174364 80132434 AFAA0028 */        sw $t2, 0x28($sp)
  /* 174368 80132438 AFA90024 */        sw $t1, 0x24($sp)
  /* 17436C 8013243C AFA80020 */        sw $t0, 0x20($sp)
  /* 174370 80132440 AFB9001C */        sw $t9, 0x1c($sp)
  /* 174374 80132444 AFB80018 */        sw $t8, 0x18($sp)
  /* 174378 80132448 AFAF0014 */        sw $t7, 0x14($sp)
  /* 17437C 8013244C AFAE0010 */        sw $t6, 0x10($sp)
  /* 174380 80132450 AFA0002C */        sw $zero, 0x2c($sp)
  /* 174384 80132454 AFA00034 */        sw $zero, 0x34($sp)
  /* 174388 80132458 24040401 */     addiu $a0, $zero, 0x401
  /* 17438C 8013245C 00002825 */        or $a1, $zero, $zero
  /* 174390 80132460 24060010 */     addiu $a2, $zero, 0x10
  /* 174394 80132464 0C002E4F */       jal func_8000B93C
  /* 174398 80132468 3C078000 */       lui $a3, 0x8000
  /* 17439C 8013246C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1743A0 80132470 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1743A4 80132474 AFA2004C */        sw $v0, 0x4c($sp)
  /* 1743A8 80132478 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1743AC 8013247C 8C500074 */        lw $s0, 0x74($v0)
  /* 1743B0 80132480 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1743B4 80132484 44050000 */      mfc1 $a1, $f0
  /* 1743B8 80132488 44060000 */      mfc1 $a2, $f0
  /* 1743BC 8013248C 3C07439B */       lui $a3, 0x439b
  /* 1743C0 80132490 26040008 */     addiu $a0, $s0, 8
  /* 1743C4 80132494 0C001C20 */       jal func_80007080
  /* 1743C8 80132498 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1743CC 8013249C 3C014300 */       lui $at, (0x43000000 >> 16) # 128.0
  /* 1743D0 801324A0 44813000 */      mtc1 $at, $f6 # 128.0 to cop1
  /* 1743D4 801324A4 3C018013 */       lui $at, %hi(D_ovl50_80132A00)
  /* 1743D8 801324A8 3C0C8013 */       lui $t4, %hi(D_ovl50_80132C00)
  /* 1743DC 801324AC E6060028 */      swc1 $f6, 0x28($s0)
  /* 1743E0 801324B0 C4282A00 */      lwc1 $f8, %lo(D_ovl50_80132A00)($at)
  /* 1743E4 801324B4 3C0D0001 */       lui $t5, %hi(D_NF_0000F9A0)
  /* 1743E8 801324B8 25ADF9A0 */     addiu $t5, $t5, %lo(D_NF_0000F9A0)
  /* 1743EC 801324BC E608002C */      swc1 $f8, 0x2c($s0)
  /* 1743F0 801324C0 8D8C2C00 */        lw $t4, %lo(D_ovl50_80132C00)($t4)
  /* 1743F4 801324C4 02002025 */        or $a0, $s0, $zero
  /* 1743F8 801324C8 24060000 */     addiu $a2, $zero, 0
  /* 1743FC 801324CC 0C003E8F */       jal func_8000FA3C
  /* 174400 801324D0 018D2821 */      addu $a1, $t4, $t5
  /* 174404 801324D4 3C058013 */       lui $a1, %hi(mvOpeningGreatFoxMainCameraProc)
  /* 174408 801324D8 24A523E0 */     addiu $a1, $a1, %lo(mvOpeningGreatFoxMainCameraProc)
  /* 17440C 801324DC 8FA4004C */        lw $a0, 0x4c($sp)
  /* 174410 801324E0 24060001 */     addiu $a2, $zero, 1
  /* 174414 801324E4 0C002062 */       jal omAddGObjCommonProc
  /* 174418 801324E8 24070001 */     addiu $a3, $zero, 1
  /* 17441C 801324EC 8FBF0044 */        lw $ra, 0x44($sp)
  /* 174420 801324F0 8FB00040 */        lw $s0, 0x40($sp)
  /* 174424 801324F4 27BD0050 */     addiu $sp, $sp, 0x50
  /* 174428 801324F8 03E00008 */        jr $ra
  /* 17442C 801324FC 00000000 */       nop

glabel mvOpeningGreatFoxCreateBackgroundViewport
  /* 174430 80132500 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 174434 80132504 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 174438 80132508 AFBF003C */        sw $ra, 0x3c($sp)
  /* 17443C 8013250C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 174440 80132510 240F005A */     addiu $t7, $zero, 0x5a
  /* 174444 80132514 24180000 */     addiu $t8, $zero, 0
  /* 174448 80132518 3C191000 */       lui $t9, 0x1000
  /* 17444C 8013251C 2408FFFF */     addiu $t0, $zero, -1
  /* 174450 80132520 24090001 */     addiu $t1, $zero, 1
  /* 174454 80132524 240A0001 */     addiu $t2, $zero, 1
  /* 174458 80132528 AFAA0030 */        sw $t2, 0x30($sp)
  /* 17445C 8013252C AFA90028 */        sw $t1, 0x28($sp)
  /* 174460 80132530 AFA80020 */        sw $t0, 0x20($sp)
  /* 174464 80132534 AFB9001C */        sw $t9, 0x1c($sp)
  /* 174468 80132538 AFB80018 */        sw $t8, 0x18($sp)
  /* 17446C 8013253C AFAF0014 */        sw $t7, 0x14($sp)
  /* 174470 80132540 AFAE0010 */        sw $t6, 0x10($sp)
  /* 174474 80132544 AFA00024 */        sw $zero, 0x24($sp)
  /* 174478 80132548 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17447C 8013254C AFA00034 */        sw $zero, 0x34($sp)
  /* 174480 80132550 24040401 */     addiu $a0, $zero, 0x401
  /* 174484 80132554 00002825 */        or $a1, $zero, $zero
  /* 174488 80132558 24060010 */     addiu $a2, $zero, 0x10
  /* 17448C 8013255C 0C002E4F */       jal func_8000B93C
  /* 174490 80132560 3C078000 */       lui $a3, 0x8000
  /* 174494 80132564 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 174498 80132568 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17449C 8013256C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1744A0 80132570 8C430074 */        lw $v1, 0x74($v0)
  /* 1744A4 80132574 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1744A8 80132578 44050000 */      mfc1 $a1, $f0
  /* 1744AC 8013257C 44060000 */      mfc1 $a2, $f0
  /* 1744B0 80132580 3C07439B */       lui $a3, 0x439b
  /* 1744B4 80132584 24640008 */     addiu $a0, $v1, 8
  /* 1744B8 80132588 0C001C20 */       jal func_80007080
  /* 1744BC 8013258C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1744C0 80132590 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1744C4 80132594 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1744C8 80132598 03E00008 */        jr $ra
  /* 1744CC 8013259C 00000000 */       nop

glabel mvOpeningGreatFoxCreateCockpitViewport
  /* 1744D0 801325A0 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1744D4 801325A4 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1744D8 801325A8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1744DC 801325AC 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1744E0 801325B0 240F0014 */     addiu $t7, $zero, 0x14
  /* 1744E4 801325B4 24180000 */     addiu $t8, $zero, 0
  /* 1744E8 801325B8 3C192000 */       lui $t9, 0x2000
  /* 1744EC 801325BC 2408FFFF */     addiu $t0, $zero, -1
  /* 1744F0 801325C0 24090001 */     addiu $t1, $zero, 1
  /* 1744F4 801325C4 240A0001 */     addiu $t2, $zero, 1
  /* 1744F8 801325C8 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1744FC 801325CC AFA90028 */        sw $t1, 0x28($sp)
  /* 174500 801325D0 AFA80020 */        sw $t0, 0x20($sp)
  /* 174504 801325D4 AFB9001C */        sw $t9, 0x1c($sp)
  /* 174508 801325D8 AFB80018 */        sw $t8, 0x18($sp)
  /* 17450C 801325DC AFAF0014 */        sw $t7, 0x14($sp)
  /* 174510 801325E0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 174514 801325E4 AFA00024 */        sw $zero, 0x24($sp)
  /* 174518 801325E8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 17451C 801325EC AFA00034 */        sw $zero, 0x34($sp)
  /* 174520 801325F0 24040401 */     addiu $a0, $zero, 0x401
  /* 174524 801325F4 00002825 */        or $a1, $zero, $zero
  /* 174528 801325F8 24060010 */     addiu $a2, $zero, 0x10
  /* 17452C 801325FC 0C002E4F */       jal func_8000B93C
  /* 174530 80132600 3C078000 */       lui $a3, 0x8000
  /* 174534 80132604 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 174538 80132608 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 17453C 8013260C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 174540 80132610 8C430074 */        lw $v1, 0x74($v0)
  /* 174544 80132614 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 174548 80132618 44050000 */      mfc1 $a1, $f0
  /* 17454C 8013261C 44060000 */      mfc1 $a2, $f0
  /* 174550 80132620 3C07439B */       lui $a3, 0x439b
  /* 174554 80132624 24640008 */     addiu $a0, $v1, 8
  /* 174558 80132628 0C001C20 */       jal func_80007080
  /* 17455C 8013262C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 174560 80132630 8FBF003C */        lw $ra, 0x3c($sp)
  /* 174564 80132634 27BD0040 */     addiu $sp, $sp, 0x40
  /* 174568 80132638 03E00008 */        jr $ra
  /* 17456C 8013263C 00000000 */       nop

glabel mvOpeningGreatFoxInitFramesElapsed
  /* 174570 80132640 3C018013 */       lui $at, %hi(gMvOpeningGreatFoxFramesElapsed)
  /* 174574 80132644 03E00008 */        jr $ra
  /* 174578 80132648 AC202A18 */        sw $zero, %lo(gMvOpeningGreatFoxFramesElapsed)($at)

glabel mvOpeningGreatFoxMainProc
  /* 17457C 8013264C 3C038013 */       lui $v1, %hi(gMvOpeningGreatFoxFramesElapsed)
  /* 174580 80132650 24632A18 */     addiu $v1, $v1, %lo(gMvOpeningGreatFoxFramesElapsed)
  /* 174584 80132654 8C6E0000 */        lw $t6, ($v1) # gMvOpeningGreatFoxFramesElapsed + 0
  /* 174588 80132658 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 17458C 8013265C AFBF0014 */        sw $ra, 0x14($sp)
  /* 174590 80132660 25CF0001 */     addiu $t7, $t6, 1
  /* 174594 80132664 29E1000A */      slti $at, $t7, 0xa
  /* 174598 80132668 AFA40018 */        sw $a0, 0x18($sp)
  /* 17459C 8013266C 1420002E */      bnez $at, .L80132728
  /* 1745A0 80132670 AC6F0000 */        sw $t7, ($v1) # gMvOpeningGreatFoxFramesElapsed + 0
  /* 1745A4 80132674 3C068013 */       lui $a2, %hi(gMvOpeningGreatFoxUnusedCounter)
  /* 1745A8 80132678 24C62A40 */     addiu $a2, $a2, %lo(gMvOpeningGreatFoxUnusedCounter)
  /* 1745AC 8013267C 8CC20000 */        lw $v0, ($a2) # gMvOpeningGreatFoxUnusedCounter + 0
  /* 1745B0 80132680 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 1745B4 80132684 10400002 */      beqz $v0, .L80132690
  /* 1745B8 80132688 2459FFFF */     addiu $t9, $v0, -1
  /* 1745BC 8013268C ACD90000 */        sw $t9, ($a2) # gMvOpeningGreatFoxUnusedCounter + 0
  .L80132690:
  /* 1745C0 80132690 0C0E4281 */       jal func_ovl1_80390A04
  /* 1745C4 80132694 2405000F */     addiu $a1, $zero, 0xf
  /* 1745C8 80132698 10400006 */      beqz $v0, .L801326B4
  /* 1745CC 8013269C 2404FFF1 */     addiu $a0, $zero, -0xf
  /* 1745D0 801326A0 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 1745D4 801326A4 2405000F */     addiu $a1, $zero, 0xf
  /* 1745D8 801326A8 10400002 */      beqz $v0, .L801326B4
  /* 1745DC 801326AC 3C018013 */       lui $at, %hi(gMvOpeningGreatFoxUnusedCounter)
  /* 1745E0 801326B0 AC202A40 */        sw $zero, %lo(gMvOpeningGreatFoxUnusedCounter)($at)
  .L801326B4:
  /* 1745E4 801326B4 0C0E41DB */       jal func_ovl1_8039076C
  /* 1745E8 801326B8 3404D000 */       ori $a0, $zero, 0xd000
  /* 1745EC 801326BC 10400007 */      beqz $v0, .L801326DC
  /* 1745F0 801326C0 3C03800A */       lui $v1, %hi(gSceneData)
  /* 1745F4 801326C4 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 1745F8 801326C8 90680000 */       lbu $t0, ($v1) # gSceneData + 0
  /* 1745FC 801326CC 24090001 */     addiu $t1, $zero, 1
  /* 174600 801326D0 A0690000 */        sb $t1, ($v1) # gSceneData + 0
  /* 174604 801326D4 0C00171D */       jal func_80005C74
  /* 174608 801326D8 A0680001 */        sb $t0, 1($v1) # gSceneData + 1
  .L801326DC:
  /* 17460C 801326DC 3C028013 */       lui $v0, %hi(gMvOpeningGreatFoxFramesElapsed)
  /* 174610 801326E0 8C422A18 */        lw $v0, %lo(gMvOpeningGreatFoxFramesElapsed)($v0)
  /* 174614 801326E4 3C03800A */       lui $v1, %hi(gSceneData)
  /* 174618 801326E8 24010078 */     addiu $at, $zero, 0x78
  /* 17461C 801326EC 14410007 */       bne $v0, $at, .L8013270C
  /* 174620 801326F0 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  /* 174624 801326F4 0C04C878 */       jal mvOpeningGreatFoxCreateCockpit
  /* 174628 801326F8 00000000 */       nop
  /* 17462C 801326FC 3C03800A */       lui $v1, %hi(gSceneData)
  /* 174630 80132700 3C028013 */       lui $v0, %hi(gMvOpeningGreatFoxFramesElapsed)
  /* 174634 80132704 8C422A18 */        lw $v0, %lo(gMvOpeningGreatFoxFramesElapsed)($v0)
  /* 174638 80132708 24634AD0 */     addiu $v1, $v1, %lo(gSceneData)
  .L8013270C:
  /* 17463C 8013270C 240100A0 */     addiu $at, $zero, 0xa0
  /* 174640 80132710 14410005 */       bne $v0, $at, .L80132728
  /* 174644 80132714 240B0029 */     addiu $t3, $zero, 0x29
  /* 174648 80132718 906A0000 */       lbu $t2, ($v1) # gSceneData + 0
  /* 17464C 8013271C A06B0000 */        sb $t3, ($v1) # gSceneData + 0
  /* 174650 80132720 0C00171D */       jal func_80005C74
  /* 174654 80132724 A06A0001 */        sb $t2, 1($v1) # gSceneData + 1
  .L80132728:
  /* 174658 80132728 8FBF0014 */        lw $ra, 0x14($sp)
  /* 17465C 8013272C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 174660 80132730 03E00008 */        jr $ra
  /* 174664 80132734 00000000 */       nop

glabel mvOpeningGreatFoxInit
  /* 174668 80132738 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 17466C 8013273C 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 174670 80132740 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 174674 80132744 3C188013 */       lui $t8, %hi(D_ovl50_80132A48)
  /* 174678 80132748 3C088013 */       lui $t0, %hi(D_ovl50_80132BC8)
  /* 17467C 8013274C AFBF001C */        sw $ra, 0x1c($sp)
  /* 174680 80132750 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 174684 80132754 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 174688 80132758 27182A48 */     addiu $t8, $t8, %lo(D_ovl50_80132A48)
  /* 17468C 8013275C 24190030 */     addiu $t9, $zero, 0x30
  /* 174690 80132760 25082BC8 */     addiu $t0, $t0, %lo(D_ovl50_80132BC8)
  /* 174694 80132764 24090007 */     addiu $t1, $zero, 7
  /* 174698 80132768 AFAE002C */        sw $t6, 0x2c($sp)
  /* 17469C 8013276C AFAF0030 */        sw $t7, 0x30($sp)
  /* 1746A0 80132770 AFA00034 */        sw $zero, 0x34($sp)
  /* 1746A4 80132774 AFA00038 */        sw $zero, 0x38($sp)
  /* 1746A8 80132778 AFB8003C */        sw $t8, 0x3c($sp)
  /* 1746AC 8013277C AFB90040 */        sw $t9, 0x40($sp)
  /* 1746B0 80132780 AFA80044 */        sw $t0, 0x44($sp)
  /* 1746B4 80132784 AFA90048 */        sw $t1, 0x48($sp)
  /* 1746B8 80132788 0C0337DE */       jal rdManagerInitSetup
  /* 1746BC 8013278C 27A4002C */     addiu $a0, $sp, 0x2c
  /* 1746C0 80132790 3C048013 */       lui $a0, %hi(D_ovl50_801328F0)
  /* 1746C4 80132794 248428F0 */     addiu $a0, $a0, %lo(D_ovl50_801328F0)
  /* 1746C8 80132798 0C0337BB */       jal rdManagerGetAllocSize
  /* 1746CC 8013279C 24050003 */     addiu $a1, $zero, 3
  /* 1746D0 801327A0 00402025 */        or $a0, $v0, $zero
  /* 1746D4 801327A4 0C001260 */       jal gsMemoryAlloc
  /* 1746D8 801327A8 24050010 */     addiu $a1, $zero, 0x10
  /* 1746DC 801327AC 3C048013 */       lui $a0, %hi(D_ovl50_801328F0)
  /* 1746E0 801327B0 3C068013 */       lui $a2, %hi(D_ovl50_80132C00)
  /* 1746E4 801327B4 24C62C00 */     addiu $a2, $a2, %lo(D_ovl50_80132C00)
  /* 1746E8 801327B8 248428F0 */     addiu $a0, $a0, %lo(D_ovl50_801328F0)
  /* 1746EC 801327BC 24050003 */     addiu $a1, $zero, 3
  /* 1746F0 801327C0 0C033781 */       jal rdManagerLoadFiles
  /* 1746F4 801327C4 00403825 */        or $a3, $v0, $zero
  /* 1746F8 801327C8 3C058013 */       lui $a1, %hi(mvOpeningGreatFoxMainProc)
  /* 1746FC 801327CC 24A5264C */     addiu $a1, $a1, %lo(mvOpeningGreatFoxMainProc)
  /* 174700 801327D0 00002025 */        or $a0, $zero, $zero
  /* 174704 801327D4 00003025 */        or $a2, $zero, $zero
  /* 174708 801327D8 0C00265A */       jal omMakeGObjSPAfter
  /* 17470C 801327DC 3C078000 */       lui $a3, 0x8000
  /* 174710 801327E0 00002025 */        or $a0, $zero, $zero
  /* 174714 801327E4 3C058000 */       lui $a1, 0x8000
  /* 174718 801327E8 24060064 */     addiu $a2, $zero, 0x64
  /* 17471C 801327EC 24070001 */     addiu $a3, $zero, 1
  /* 174720 801327F0 0C002E7F */       jal func_8000B9FC
  /* 174724 801327F4 AFA00010 */        sw $zero, 0x10($sp)
  /* 174728 801327F8 0C04C990 */       jal mvOpeningGreatFoxInitFramesElapsed
  /* 17472C 801327FC 00000000 */       nop
  /* 174730 80132800 0C04C900 */       jal mvOpeningGreatFoxCreateMainViewport
  /* 174734 80132804 00000000 */       nop
  /* 174738 80132808 0C04C940 */       jal mvOpeningGreatFoxCreateBackgroundViewport
  /* 17473C 8013280C 00000000 */       nop
  /* 174740 80132810 0C04C968 */       jal mvOpeningGreatFoxCreateCockpitViewport
  /* 174744 80132814 00000000 */       nop
  /* 174748 80132818 0C04C77B */       jal mvOpeningGreatFoxCreateBackground
  /* 17474C 8013281C 00000000 */       nop
  /* 174750 80132820 0C04C7D3 */       jal mvOpeningGreatFoxCreateGreatFox
  /* 174754 80132824 00000000 */       nop
  /* 174758 80132828 0C04C8A4 */       jal mvOpeningGreatFoxCreateArwings
  /* 17475C 8013282C 00000000 */       nop
  /* 174760 80132830 3C014234 */       lui $at, (0x42340000 >> 16) # 45.0
  /* 174764 80132834 44816000 */      mtc1 $at, $f12 # 45.0 to cop1
  /* 174768 80132838 240A00FF */     addiu $t2, $zero, 0xff
  /* 17476C 8013283C 240B00FF */     addiu $t3, $zero, 0xff
  /* 174770 80132840 AFAB0014 */        sw $t3, 0x14($sp)
  /* 174774 80132844 AFAA0010 */        sw $t2, 0x10($sp)
  /* 174778 80132848 240600FF */     addiu $a2, $zero, 0xff
  /* 17477C 8013284C 240700FF */     addiu $a3, $zero, 0xff
  /* 174780 80132850 0C0E4138 */       jal func_ovl1_803904E0
  /* 174784 80132854 46006386 */     mov.s $f14, $f12
  /* 174788 80132858 0C00024B */       jal func_8000092C
  /* 17478C 8013285C 00000000 */       nop
  /* 174790 80132860 2C410D5C */     sltiu $at, $v0, 0xd5c
  /* 174794 80132864 10200006 */      beqz $at, .L80132880
  /* 174798 80132868 00000000 */       nop
  .L8013286C:
  /* 17479C 8013286C 0C00024B */       jal func_8000092C
  /* 1747A0 80132870 00000000 */       nop
  /* 1747A4 80132874 2C410D5C */     sltiu $at, $v0, 0xd5c
  /* 1747A8 80132878 1420FFFC */      bnez $at, .L8013286C
  /* 1747AC 8013287C 00000000 */       nop
  .L80132880:
  /* 1747B0 80132880 0C009A70 */       jal func_800269C0
  /* 1747B4 80132884 24040094 */     addiu $a0, $zero, 0x94
  /* 1747B8 80132888 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1747BC 8013288C 27BD0050 */     addiu $sp, $sp, 0x50
  /* 1747C0 80132890 03E00008 */        jr $ra
  /* 1747C4 80132894 00000000 */       nop

glabel intro_great_fox_entry
  /* 1747C8 80132898 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 1747CC 8013289C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1747D0 801328A0 3C048013 */       lui $a0, %hi(D_ovl50_8013293C)
  /* 1747D4 801328A4 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 1747D8 801328A8 2484293C */     addiu $a0, $a0, %lo(D_ovl50_8013293C)
  /* 1747DC 801328AC AFBF0014 */        sw $ra, 0x14($sp)
  /* 1747E0 801328B0 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 1747E4 801328B4 0C001C09 */       jal func_80007024
  /* 1747E8 801328B8 AC8F000C */        sw $t7, 0xc($a0) # D_ovl50_8013293C + 12
  /* 1747EC 801328BC 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 1747F0 801328C0 3C198013 */       lui $t9, %hi(D_NF_80132C10)
  /* 1747F4 801328C4 3C048013 */       lui $a0, %hi(D_ovl50_80132958)
  /* 1747F8 801328C8 27392C10 */     addiu $t9, $t9, %lo(D_NF_80132C10)
  /* 1747FC 801328CC 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 174800 801328D0 24842958 */     addiu $a0, $a0, %lo(D_ovl50_80132958)
  /* 174804 801328D4 03194023 */      subu $t0, $t8, $t9
  /* 174808 801328D8 0C001A0F */       jal gsGTLSceneInit
  /* 17480C 801328DC AC880010 */        sw $t0, 0x10($a0) # D_ovl50_80132958 + 16
  /* 174810 801328E0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 174814 801328E4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 174818 801328E8 03E00008 */        jr $ra
  /* 17481C 801328EC 00000000 */       nop
