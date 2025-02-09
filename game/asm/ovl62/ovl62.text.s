.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x801339E0

glabel mnSoundTestUpdateOptionColors
  /* 187ED0 80131B00 3C038013 */       lui $v1, %hi(sMNSoundTestOption)
  /* 187ED4 80131B04 8C634308 */        lw $v1, %lo(sMNSoundTestOption)($v1)
  /* 187ED8 80131B08 3C0F8013 */       lui $t7, 0x8013
  /* 187EDC 80131B0C 25E74330 */     addiu $a3, $t7, 0x4330
  /* 187EE0 80131B10 00037080 */       sll $t6, $v1, 2
  /* 187EE4 80131B14 3C058013 */       lui $a1, %hi(sMNSoundTestOptionColorR)
  /* 187EE8 80131B18 3C068013 */       lui $a2, %hi(sMNSoundTestOptionColorG)
  /* 187EEC 80131B1C 3C088013 */       lui $t0, %hi(sMNSoundTestOptionChangeWait)
  /* 187EF0 80131B20 2508433C */     addiu $t0, $t0, %lo(sMNSoundTestOptionChangeWait)
  /* 187EF4 80131B24 24C64320 */     addiu $a2, $a2, %lo(sMNSoundTestOptionColorG)
  /* 187EF8 80131B28 24A54310 */     addiu $a1, $a1, %lo(sMNSoundTestOptionColorR)
  /* 187EFC 80131B2C 01C72021 */      addu $a0, $t6, $a3
  /* 187F00 80131B30 240300A8 */     addiu $v1, $zero, 0xa8
  /* 187F04 80131B34 240B0007 */     addiu $t3, $zero, 7
  /* 187F08 80131B38 240A0045 */     addiu $t2, $zero, 0x45
  /* 187F0C 80131B3C 2409007D */     addiu $t1, $zero, 0x7d
  /* 187F10 80131B40 240200FF */     addiu $v0, $zero, 0xff
  .L80131B44:
  /* 187F14 80131B44 54E40006 */      bnel $a3, $a0, .L80131B60
  /* 187F18 80131B48 ACA90000 */        sw $t1, ($a1) # sMNSoundTestOptionColorR + 0
  /* 187F1C 80131B4C ACA20000 */        sw $v0, ($a1) # sMNSoundTestOptionColorR + 0
  /* 187F20 80131B50 ACC30000 */        sw $v1, ($a2) # sMNSoundTestOptionColorG + 0
  /* 187F24 80131B54 10000004 */         b .L80131B68
  /* 187F28 80131B58 ACE00000 */        sw $zero, ($a3)
  /* 187F2C 80131B5C ACA90000 */        sw $t1, ($a1) # sMNSoundTestOptionColorR + 0
  .L80131B60:
  /* 187F30 80131B60 ACCA0000 */        sw $t2, ($a2) # sMNSoundTestOptionColorG + 0
  /* 187F34 80131B64 ACEB0000 */        sw $t3, ($a3)
  .L80131B68:
  /* 187F38 80131B68 24E70004 */     addiu $a3, $a3, 4
  /* 187F3C 80131B6C 24A50004 */     addiu $a1, $a1, 4
  /* 187F40 80131B70 14E8FFF4 */       bne $a3, $t0, .L80131B44
  /* 187F44 80131B74 24C60004 */     addiu $a2, $a2, 4
  /* 187F48 80131B78 03E00008 */        jr $ra
  /* 187F4C 80131B7C 00000000 */       nop 

glabel mnSoundTestUpdateControllerInputs
  /* 187F50 80131B80 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187F54 80131B84 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187F58 80131B88 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 187F5C 80131B8C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 187F60 80131B90 AFBF0014 */        sw $ra, 0x14($sp)
  /* 187F64 80131B94 10400003 */      beqz $v0, .L80131BA4
  /* 187F68 80131B98 2404FFE0 */     addiu $a0, $zero, -0x20
  /* 187F6C 80131B9C 244EFFFF */     addiu $t6, $v0, -1
  /* 187F70 80131BA0 ACCE0000 */        sw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131BA4:
  /* 187F74 80131BA4 0C0E4281 */       jal func_ovl1_80390A04
  /* 187F78 80131BA8 24050020 */     addiu $a1, $zero, 0x20
  /* 187F7C 80131BAC 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187F80 80131BB0 10400014 */      beqz $v0, .L80131C04
  /* 187F84 80131BB4 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187F88 80131BB8 2404FFE0 */     addiu $a0, $zero, -0x20
  /* 187F8C 80131BBC 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 187F90 80131BC0 24050020 */     addiu $a1, $zero, 0x20
  /* 187F94 80131BC4 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187F98 80131BC8 1040000E */      beqz $v0, .L80131C04
  /* 187F9C 80131BCC 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187FA0 80131BD0 0C0E4201 */       jal func_ovl1_80390804
  /* 187FA4 80131BD4 24040919 */     addiu $a0, $zero, 0x919
  /* 187FA8 80131BD8 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187FAC 80131BDC 14400009 */      bnez $v0, .L80131C04
  /* 187FB0 80131BE0 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187FB4 80131BE4 0C0E4201 */       jal func_ovl1_80390804
  /* 187FB8 80131BE8 24040626 */     addiu $a0, $zero, 0x626
  /* 187FBC 80131BEC 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187FC0 80131BF0 14400004 */      bnez $v0, .L80131C04
  /* 187FC4 80131BF4 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187FC8 80131BF8 ACC00000 */        sw $zero, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 187FCC 80131BFC 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 187FD0 80131C00 AC204340 */        sw $zero, %lo(sMNSoundTestDirectionInputKind)($at)
  .L80131C04:
  /* 187FD4 80131C04 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 187FD8 80131C08 14400008 */      bnez $v0, .L80131C2C
  /* 187FDC 80131C0C 00000000 */       nop 
  /* 187FE0 80131C10 0C0E4201 */       jal func_ovl1_80390804
  /* 187FE4 80131C14 24040808 */     addiu $a0, $zero, 0x808
  /* 187FE8 80131C18 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 187FEC 80131C1C 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 187FF0 80131C20 1440000A */      bnez $v0, .L80131C4C
  /* 187FF4 80131C24 AFA20018 */        sw $v0, 0x18($sp)
  /* 187FF8 80131C28 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131C2C:
  /* 187FFC 80131C2C 14400028 */      bnez $v0, .L80131CD0
  /* 188000 80131C30 24040020 */     addiu $a0, $zero, 0x20
  /* 188004 80131C34 0C0E4254 */       jal func_ovl1_80390950
  /* 188008 80131C38 24050001 */     addiu $a1, $zero, 1
  /* 18800C 80131C3C 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 188010 80131C40 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188014 80131C44 10400022 */      beqz $v0, .L80131CD0
  /* 188018 80131C48 AFA2001C */        sw $v0, 0x1c($sp)
  .L80131C4C:
  /* 18801C 80131C4C 0C009A70 */       jal func_800269C0
  /* 188020 80131C50 240400A4 */     addiu $a0, $zero, 0xa4
  /* 188024 80131C54 8FAF0018 */        lw $t7, 0x18($sp)
  /* 188028 80131C58 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 18802C 80131C5C 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188030 80131C60 11E00004 */      beqz $t7, .L80131C74
  /* 188034 80131C64 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 188038 80131C68 2418000C */     addiu $t8, $zero, 0xc
  /* 18803C 80131C6C 10000009 */         b .L80131C94
  /* 188040 80131C70 ACD80000 */        sw $t8, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131C74:
  /* 188044 80131C74 8FB9001C */        lw $t9, 0x1c($sp)
  /* 188048 80131C78 240800A0 */     addiu $t0, $zero, 0xa0
  /* 18804C 80131C7C 01194823 */      subu $t1, $t0, $t9
  /* 188050 80131C80 05210003 */      bgez $t1, .L80131C90
  /* 188054 80131C84 000950C3 */       sra $t2, $t1, 3
  /* 188058 80131C88 25210007 */     addiu $at, $t1, 7
  /* 18805C 80131C8C 000150C3 */       sra $t2, $at, 3
  .L80131C90:
  /* 188060 80131C90 ACCA0000 */        sw $t2, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131C94:
  /* 188064 80131C94 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 188068 80131C98 8CEB0000 */        lw $t3, ($a3) # sMNSoundTestOption + 0
  /* 18806C 80131C9C 24180003 */     addiu $t8, $zero, 3
  /* 188070 80131CA0 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 188074 80131CA4 2562FFFF */     addiu $v0, $t3, -1
  /* 188078 80131CA8 04410003 */      bgez $v0, .L80131CB8
  /* 18807C 80131CAC ACE20000 */        sw $v0, ($a3) # sMNSoundTestOption + 0
  /* 188080 80131CB0 24020002 */     addiu $v0, $zero, 2
  /* 188084 80131CB4 ACE20000 */        sw $v0, ($a3) # sMNSoundTestOption + 0
  .L80131CB8:
  /* 188088 80131CB8 14400004 */      bnez $v0, .L80131CCC
  /* 18808C 80131CBC 00000000 */       nop 
  /* 188090 80131CC0 8CCE0000 */        lw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188094 80131CC4 25CF000A */     addiu $t7, $t6, 0xa
  /* 188098 80131CC8 ACCF0000 */        sw $t7, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131CCC:
  /* 18809C 80131CCC AC384340 */        sw $t8, %lo(sMNSoundTestDirectionInputKind)($at)
  .L80131CD0:
  /* 1880A0 80131CD0 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 1880A4 80131CD4 14400008 */      bnez $v0, .L80131CF8
  /* 1880A8 80131CD8 00000000 */       nop 
  /* 1880AC 80131CDC 0C0E4201 */       jal func_ovl1_80390804
  /* 1880B0 80131CE0 24040404 */     addiu $a0, $zero, 0x404
  /* 1880B4 80131CE4 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 1880B8 80131CE8 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 1880BC 80131CEC 1440000A */      bnez $v0, .L80131D18
  /* 1880C0 80131CF0 AFA20018 */        sw $v0, 0x18($sp)
  /* 1880C4 80131CF4 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131CF8:
  /* 1880C8 80131CF8 14400029 */      bnez $v0, .L80131DA0
  /* 1880CC 80131CFC 2404FFE0 */     addiu $a0, $zero, -0x20
  /* 1880D0 80131D00 0C0E4254 */       jal func_ovl1_80390950
  /* 1880D4 80131D04 00002825 */        or $a1, $zero, $zero
  /* 1880D8 80131D08 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 1880DC 80131D0C 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 1880E0 80131D10 10400023 */      beqz $v0, .L80131DA0
  /* 1880E4 80131D14 AFA2001C */        sw $v0, 0x1c($sp)
  .L80131D18:
  /* 1880E8 80131D18 0C009A70 */       jal func_800269C0
  /* 1880EC 80131D1C 240400A4 */     addiu $a0, $zero, 0xa4
  /* 1880F0 80131D20 8FA80018 */        lw $t0, 0x18($sp)
  /* 1880F4 80131D24 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 1880F8 80131D28 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 1880FC 80131D2C 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 188100 80131D30 11000004 */      beqz $t0, .L80131D44
  /* 188104 80131D34 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188108 80131D38 2419000C */     addiu $t9, $zero, 0xc
  /* 18810C 80131D3C 10000008 */         b .L80131D60
  /* 188110 80131D40 ACD90000 */        sw $t9, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131D44:
  /* 188114 80131D44 8FA9001C */        lw $t1, 0x1c($sp)
  /* 188118 80131D48 252A00A0 */     addiu $t2, $t1, 0xa0
  /* 18811C 80131D4C 05410003 */      bgez $t2, .L80131D5C
  /* 188120 80131D50 000A58C3 */       sra $t3, $t2, 3
  /* 188124 80131D54 25410007 */     addiu $at, $t2, 7
  /* 188128 80131D58 000158C3 */       sra $t3, $at, 3
  .L80131D5C:
  /* 18812C 80131D5C ACCB0000 */        sw $t3, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131D60:
  /* 188130 80131D60 8CEC0000 */        lw $t4, ($a3) # sMNSoundTestOption + 0
  /* 188134 80131D64 24180004 */     addiu $t8, $zero, 4
  /* 188138 80131D68 25820001 */     addiu $v0, $t4, 1
  /* 18813C 80131D6C 28410003 */      slti $at, $v0, 3
  /* 188140 80131D70 14200003 */      bnez $at, .L80131D80
  /* 188144 80131D74 ACE20000 */        sw $v0, ($a3) # sMNSoundTestOption + 0
  /* 188148 80131D78 ACE00000 */        sw $zero, ($a3) # sMNSoundTestOption + 0
  /* 18814C 80131D7C 00001025 */        or $v0, $zero, $zero
  .L80131D80:
  /* 188150 80131D80 24010002 */     addiu $at, $zero, 2
  /* 188154 80131D84 14410004 */       bne $v0, $at, .L80131D98
  /* 188158 80131D88 00000000 */       nop 
  /* 18815C 80131D8C 8CCE0000 */        lw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188160 80131D90 25CF000A */     addiu $t7, $t6, 0xa
  /* 188164 80131D94 ACCF0000 */        sw $t7, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131D98:
  /* 188168 80131D98 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 18816C 80131D9C AC384340 */        sw $t8, %lo(sMNSoundTestDirectionInputKind)($at)
  .L80131DA0:
  /* 188170 80131DA0 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188174 80131DA4 1440000A */      bnez $v0, .L80131DD0
  /* 188178 80131DA8 00000000 */       nop 
  /* 18817C 80131DAC 0C0E4201 */       jal func_ovl1_80390804
  /* 188180 80131DB0 24040222 */     addiu $a0, $zero, 0x222
  /* 188184 80131DB4 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 188188 80131DB8 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 18818C 80131DBC 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 188190 80131DC0 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188194 80131DC4 1440000C */      bnez $v0, .L80131DF8
  /* 188198 80131DC8 AFA20018 */        sw $v0, 0x18($sp)
  /* 18819C 80131DCC 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131DD0:
  /* 1881A0 80131DD0 14400050 */      bnez $v0, .L80131F14
  /* 1881A4 80131DD4 2404FFE0 */     addiu $a0, $zero, -0x20
  /* 1881A8 80131DD8 0C0E4227 */       jal func_ovl1_8039089C
  /* 1881AC 80131DDC 00002825 */        or $a1, $zero, $zero
  /* 1881B0 80131DE0 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 1881B4 80131DE4 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 1881B8 80131DE8 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 1881BC 80131DEC 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 1881C0 80131DF0 10400048 */      beqz $v0, .L80131F14
  /* 1881C4 80131DF4 AFA2001C */        sw $v0, 0x1c($sp)
  .L80131DF8:
  /* 1881C8 80131DF8 8FA80018 */        lw $t0, 0x18($sp)
  /* 1881CC 80131DFC 8FA9001C */        lw $t1, 0x1c($sp)
  /* 1881D0 80131E00 2419000C */     addiu $t9, $zero, 0xc
  /* 1881D4 80131E04 11000003 */      beqz $t0, .L80131E14
  /* 1881D8 80131E08 252A00A0 */     addiu $t2, $t1, 0xa0
  /* 1881DC 80131E0C 10000006 */         b .L80131E28
  /* 1881E0 80131E10 ACD90000 */        sw $t9, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131E14:
  /* 1881E4 80131E14 05410003 */      bgez $t2, .L80131E24
  /* 1881E8 80131E18 000A5903 */       sra $t3, $t2, 4
  /* 1881EC 80131E1C 2541000F */     addiu $at, $t2, 0xf
  /* 1881F0 80131E20 00015903 */       sra $t3, $at, 4
  .L80131E24:
  /* 1881F4 80131E24 ACCB0000 */        sw $t3, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131E28:
  /* 1881F8 80131E28 8CE20000 */        lw $v0, ($a3) # sMNSoundTestOption + 0
  /* 1881FC 80131E2C 3C0D8013 */       lui $t5, %hi(sMNSoundTestOptionSelectID)
  /* 188200 80131E30 25AD4348 */     addiu $t5, $t5, %lo(sMNSoundTestOptionSelectID)
  /* 188204 80131E34 00026080 */       sll $t4, $v0, 2
  /* 188208 80131E38 018D1821 */      addu $v1, $t4, $t5
  /* 18820C 80131E3C 8C6E0000 */        lw $t6, ($v1)
  /* 188210 80131E40 24010001 */     addiu $at, $zero, 1
  /* 188214 80131E44 25CFFFFF */     addiu $t7, $t6, -1
  /* 188218 80131E48 10400007 */      beqz $v0, .L80131E68
  /* 18821C 80131E4C AC6F0000 */        sw $t7, ($v1)
  /* 188220 80131E50 10410010 */       beq $v0, $at, .L80131E94
  /* 188224 80131E54 24010002 */     addiu $at, $zero, 2
  /* 188228 80131E58 5041001A */      beql $v0, $at, .L80131EC4
  /* 18822C 80131E5C 8C620000 */        lw $v0, ($v1)
  /* 188230 80131E60 10000021 */         b .L80131EE8
  /* 188234 80131E64 00000000 */       nop 
  .L80131E68:
  /* 188238 80131E68 8C620000 */        lw $v0, ($v1)
  /* 18823C 80131E6C 04410003 */      bgez $v0, .L80131E7C
  /* 188240 80131E70 00000000 */       nop 
  /* 188244 80131E74 2402002C */     addiu $v0, $zero, 0x2c
  /* 188248 80131E78 AC620000 */        sw $v0, ($v1)
  .L80131E7C:
  /* 18824C 80131E7C 1440001A */      bnez $v0, .L80131EE8
  /* 188250 80131E80 00000000 */       nop 
  /* 188254 80131E84 8CC80000 */        lw $t0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188258 80131E88 25190014 */     addiu $t9, $t0, 0x14
  /* 18825C 80131E8C 10000016 */         b .L80131EE8
  /* 188260 80131E90 ACD90000 */        sw $t9, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131E94:
  /* 188264 80131E94 8C620000 */        lw $v0, ($v1)
  /* 188268 80131E98 04410003 */      bgez $v0, .L80131EA8
  /* 18826C 80131E9C 00000000 */       nop 
  /* 188270 80131EA0 240200C1 */     addiu $v0, $zero, 0xc1
  /* 188274 80131EA4 AC620000 */        sw $v0, ($v1)
  .L80131EA8:
  /* 188278 80131EA8 1440000F */      bnez $v0, .L80131EE8
  /* 18827C 80131EAC 00000000 */       nop 
  /* 188280 80131EB0 8CCA0000 */        lw $t2, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188284 80131EB4 254B0014 */     addiu $t3, $t2, 0x14
  /* 188288 80131EB8 1000000B */         b .L80131EE8
  /* 18828C 80131EBC ACCB0000 */        sw $t3, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188290 80131EC0 8C620000 */        lw $v0, ($v1)
  .L80131EC4:
  /* 188294 80131EC4 04410003 */      bgez $v0, .L80131ED4
  /* 188298 80131EC8 00000000 */       nop 
  /* 18829C 80131ECC 240200F3 */     addiu $v0, $zero, 0xf3
  /* 1882A0 80131ED0 AC620000 */        sw $v0, ($v1)
  .L80131ED4:
  /* 1882A4 80131ED4 14400004 */      bnez $v0, .L80131EE8
  /* 1882A8 80131ED8 00000000 */       nop 
  /* 1882AC 80131EDC 8CCD0000 */        lw $t5, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 1882B0 80131EE0 25AE0014 */     addiu $t6, $t5, 0x14
  /* 1882B4 80131EE4 ACCE0000 */        sw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131EE8:
  /* 1882B8 80131EE8 3C0F8013 */       lui $t7, %hi(sMNSoundTestDirectionInputKind)
  /* 1882BC 80131EEC 8DEF4340 */        lw $t7, %lo(sMNSoundTestDirectionInputKind)($t7)
  /* 1882C0 80131EF0 24010001 */     addiu $at, $zero, 1
  /* 1882C4 80131EF4 24190001 */     addiu $t9, $zero, 1
  /* 1882C8 80131EF8 11E10004 */       beq $t7, $at, .L80131F0C
  /* 1882CC 80131EFC 00000000 */       nop 
  /* 1882D0 80131F00 8CD80000 */        lw $t8, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 1882D4 80131F04 00184040 */       sll $t0, $t8, 1
  /* 1882D8 80131F08 ACC80000 */        sw $t0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131F0C:
  /* 1882DC 80131F0C 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 1882E0 80131F10 AC394340 */        sw $t9, %lo(sMNSoundTestDirectionInputKind)($at)
  .L80131F14:
  /* 1882E4 80131F14 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 1882E8 80131F18 1440000A */      bnez $v0, .L80131F44
  /* 1882EC 80131F1C 00000000 */       nop 
  /* 1882F0 80131F20 0C0E4201 */       jal func_ovl1_80390804
  /* 1882F4 80131F24 24040111 */     addiu $a0, $zero, 0x111
  /* 1882F8 80131F28 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 1882FC 80131F2C 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 188300 80131F30 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 188304 80131F34 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188308 80131F38 1440000C */      bnez $v0, .L80131F6C
  /* 18830C 80131F3C AFA20018 */        sw $v0, 0x18($sp)
  /* 188310 80131F40 8CC20000 */        lw $v0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131F44:
  /* 188314 80131F44 14400057 */      bnez $v0, .L801320A4
  /* 188318 80131F48 24040020 */     addiu $a0, $zero, 0x20
  /* 18831C 80131F4C 0C0E4227 */       jal func_ovl1_8039089C
  /* 188320 80131F50 24050001 */     addiu $a1, $zero, 1
  /* 188324 80131F54 3C068013 */       lui $a2, %hi(sMNSoundTestOptionChangeWait)
  /* 188328 80131F58 3C078013 */       lui $a3, %hi(sMNSoundTestOption)
  /* 18832C 80131F5C 24E74308 */     addiu $a3, $a3, %lo(sMNSoundTestOption)
  /* 188330 80131F60 24C6433C */     addiu $a2, $a2, %lo(sMNSoundTestOptionChangeWait)
  /* 188334 80131F64 1040004F */      beqz $v0, .L801320A4
  /* 188338 80131F68 AFA2001C */        sw $v0, 0x1c($sp)
  .L80131F6C:
  /* 18833C 80131F6C 8FA90018 */        lw $t1, 0x18($sp)
  /* 188340 80131F70 8FAB001C */        lw $t3, 0x1c($sp)
  /* 188344 80131F74 240C00A0 */     addiu $t4, $zero, 0xa0
  /* 188348 80131F78 11200004 */      beqz $t1, .L80131F8C
  /* 18834C 80131F7C 018B6823 */      subu $t5, $t4, $t3
  /* 188350 80131F80 240A000C */     addiu $t2, $zero, 0xc
  /* 188354 80131F84 10000006 */         b .L80131FA0
  /* 188358 80131F88 ACCA0000 */        sw $t2, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131F8C:
  /* 18835C 80131F8C 05A10003 */      bgez $t5, .L80131F9C
  /* 188360 80131F90 000D7103 */       sra $t6, $t5, 4
  /* 188364 80131F94 25A1000F */     addiu $at, $t5, 0xf
  /* 188368 80131F98 00017103 */       sra $t6, $at, 4
  .L80131F9C:
  /* 18836C 80131F9C ACCE0000 */        sw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80131FA0:
  /* 188370 80131FA0 8CE20000 */        lw $v0, ($a3) # sMNSoundTestOption + 0
  /* 188374 80131FA4 3C188013 */       lui $t8, %hi(sMNSoundTestOptionSelectID)
  /* 188378 80131FA8 27184348 */     addiu $t8, $t8, %lo(sMNSoundTestOptionSelectID)
  /* 18837C 80131FAC 00027880 */       sll $t7, $v0, 2
  /* 188380 80131FB0 01F81821 */      addu $v1, $t7, $t8
  /* 188384 80131FB4 8C680000 */        lw $t0, ($v1)
  /* 188388 80131FB8 24010001 */     addiu $at, $zero, 1
  /* 18838C 80131FBC 3C0F8013 */       lui $t7, %hi(sMNSoundTestDirectionInputKind)
  /* 188390 80131FC0 25190001 */     addiu $t9, $t0, 1
  /* 188394 80131FC4 10400007 */      beqz $v0, .L80131FE4
  /* 188398 80131FC8 AC790000 */        sw $t9, ($v1)
  /* 18839C 80131FCC 10410012 */       beq $v0, $at, .L80132018
  /* 1883A0 80131FD0 24010002 */     addiu $at, $zero, 2
  /* 1883A4 80131FD4 5041001E */      beql $v0, $at, .L80132050
  /* 1883A8 80131FD8 8C620000 */        lw $v0, ($v1)
  /* 1883AC 80131FDC 10000027 */         b .L8013207C
  /* 1883B0 80131FE0 00000000 */       nop 
  .L80131FE4:
  /* 1883B4 80131FE4 8C620000 */        lw $v0, ($v1)
  /* 1883B8 80131FE8 2841002D */      slti $at, $v0, 0x2d
  /* 1883BC 80131FEC 54200004 */      bnel $at, $zero, .L80132000
  /* 1883C0 80131FF0 2401002C */     addiu $at, $zero, 0x2c
  /* 1883C4 80131FF4 AC600000 */        sw $zero, ($v1)
  /* 1883C8 80131FF8 00001025 */        or $v0, $zero, $zero
  /* 1883CC 80131FFC 2401002C */     addiu $at, $zero, 0x2c
  .L80132000:
  /* 1883D0 80132000 1441001E */       bne $v0, $at, .L8013207C
  /* 1883D4 80132004 00000000 */       nop 
  /* 1883D8 80132008 8CC90000 */        lw $t1, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 1883DC 8013200C 252A0014 */     addiu $t2, $t1, 0x14
  /* 1883E0 80132010 1000001A */         b .L8013207C
  /* 1883E4 80132014 ACCA0000 */        sw $t2, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L80132018:
  /* 1883E8 80132018 8C620000 */        lw $v0, ($v1)
  /* 1883EC 8013201C 284100C2 */      slti $at, $v0, 0xc2
  /* 1883F0 80132020 54200004 */      bnel $at, $zero, .L80132034
  /* 1883F4 80132024 240100C1 */     addiu $at, $zero, 0xc1
  /* 1883F8 80132028 AC600000 */        sw $zero, ($v1)
  /* 1883FC 8013202C 00001025 */        or $v0, $zero, $zero
  /* 188400 80132030 240100C1 */     addiu $at, $zero, 0xc1
  .L80132034:
  /* 188404 80132034 14410011 */       bne $v0, $at, .L8013207C
  /* 188408 80132038 00000000 */       nop 
  /* 18840C 8013203C 8CCC0000 */        lw $t4, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188410 80132040 258B0014 */     addiu $t3, $t4, 0x14
  /* 188414 80132044 1000000D */         b .L8013207C
  /* 188418 80132048 ACCB0000 */        sw $t3, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 18841C 8013204C 8C620000 */        lw $v0, ($v1)
  .L80132050:
  /* 188420 80132050 284100F4 */      slti $at, $v0, 0xf4
  /* 188424 80132054 54200004 */      bnel $at, $zero, .L80132068
  /* 188428 80132058 240100F3 */     addiu $at, $zero, 0xf3
  /* 18842C 8013205C AC600000 */        sw $zero, ($v1)
  /* 188430 80132060 00001025 */        or $v0, $zero, $zero
  /* 188434 80132064 240100F3 */     addiu $at, $zero, 0xf3
  .L80132068:
  /* 188438 80132068 14410004 */       bne $v0, $at, .L8013207C
  /* 18843C 8013206C 00000000 */       nop 
  /* 188440 80132070 8CCD0000 */        lw $t5, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188444 80132074 25AE0014 */     addiu $t6, $t5, 0x14
  /* 188448 80132078 ACCE0000 */        sw $t6, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L8013207C:
  /* 18844C 8013207C 8DEF4340 */        lw $t7, %lo(sMNSoundTestDirectionInputKind)($t7)
  /* 188450 80132080 24010002 */     addiu $at, $zero, 2
  /* 188454 80132084 24190002 */     addiu $t9, $zero, 2
  /* 188458 80132088 11E10004 */       beq $t7, $at, .L8013209C
  /* 18845C 8013208C 00000000 */       nop 
  /* 188460 80132090 8CD80000 */        lw $t8, ($a2) # sMNSoundTestOptionChangeWait + 0
  /* 188464 80132094 00184040 */       sll $t0, $t8, 1
  /* 188468 80132098 ACC80000 */        sw $t0, ($a2) # sMNSoundTestOptionChangeWait + 0
  .L8013209C:
  /* 18846C 8013209C 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 188470 801320A0 AC394340 */        sw $t9, %lo(sMNSoundTestDirectionInputKind)($at)
  .L801320A4:
  /* 188474 801320A4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 188478 801320A8 27BD0020 */     addiu $sp, $sp, 0x20
  /* 18847C 801320AC 03E00008 */        jr $ra
  /* 188480 801320B0 00000000 */       nop 

glabel mnSoundTestUpdateFunctions
  /* 188484 801320B4 3C028013 */       lui $v0, %hi(sMNSoundTestFadeOutWait)
  /* 188488 801320B8 8C424364 */        lw $v0, %lo(sMNSoundTestFadeOutWait)($v0)
  /* 18848C 801320BC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 188490 801320C0 2401FFFF */     addiu $at, $zero, -1
  /* 188494 801320C4 1041000C */       beq $v0, $at, .L801320F8
  /* 188498 801320C8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 18849C 801320CC 10400004 */      beqz $v0, .L801320E0
  /* 1884A0 801320D0 244EFFFF */     addiu $t6, $v0, -1
  /* 1884A4 801320D4 3C018013 */       lui $at, %hi(sMNSoundTestFadeOutWait)
  /* 1884A8 801320D8 1000000A */         b .L80132104
  /* 1884AC 801320DC AC2E4364 */        sw $t6, %lo(sMNSoundTestFadeOutWait)($at)
  .L801320E0:
  /* 1884B0 801320E0 0C00829D */       jal func_80020A74
  /* 1884B4 801320E4 00000000 */       nop 
  /* 1884B8 801320E8 240FFFFF */     addiu $t7, $zero, -1
  /* 1884BC 801320EC 3C018013 */       lui $at, %hi(sMNSoundTestFadeOutWait)
  /* 1884C0 801320F0 10000004 */         b .L80132104
  /* 1884C4 801320F4 AC2F4364 */        sw $t7, %lo(sMNSoundTestFadeOutWait)($at)
  .L801320F8:
  /* 1884C8 801320F8 00002025 */        or $a0, $zero, $zero
  /* 1884CC 801320FC 0C0082CE */       jal func_80020B38
  /* 1884D0 80132100 24057000 */     addiu $a1, $zero, 0x7000
  .L80132104:
  /* 1884D4 80132104 0C0E41DB */       jal func_ovl1_8039076C
  /* 1884D8 80132108 34048000 */       ori $a0, $zero, 0x8000
  /* 1884DC 8013210C 10400034 */      beqz $v0, .L801321E0
  /* 1884E0 80132110 3C028013 */       lui $v0, %hi(sMNSoundTestOption)
  /* 1884E4 80132114 8C424308 */        lw $v0, %lo(sMNSoundTestOption)($v0)
  /* 1884E8 80132118 24010001 */     addiu $at, $zero, 1
  /* 1884EC 8013211C 10400007 */      beqz $v0, .L8013213C
  /* 1884F0 80132120 00000000 */       nop 
  /* 1884F4 80132124 10410018 */       beq $v0, $at, .L80132188
  /* 1884F8 80132128 24010002 */     addiu $at, $zero, 2
  /* 1884FC 8013212C 10410021 */       beq $v0, $at, .L801321B4
  /* 188500 80132130 00000000 */       nop 
  /* 188504 80132134 10000040 */         b .L80132238
  /* 188508 80132138 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013213C:
  /* 18850C 8013213C 3C028013 */       lui $v0, %hi(sMNSoundTestFadeOutWait)
  /* 188510 80132140 24424364 */     addiu $v0, $v0, %lo(sMNSoundTestFadeOutWait)
  /* 188514 80132144 8C580000 */        lw $t8, ($v0) # sMNSoundTestFadeOutWait + 0
  /* 188518 80132148 2419FFFF */     addiu $t9, $zero, -1
  /* 18851C 8013214C 1B000002 */      blez $t8, .L80132158
  /* 188520 80132150 00000000 */       nop 
  /* 188524 80132154 AC590000 */        sw $t9, ($v0) # sMNSoundTestFadeOutWait + 0
  .L80132158:
  /* 188528 80132158 0C00829D */       jal func_80020A74
  /* 18852C 8013215C 00000000 */       nop 
  /* 188530 80132160 3C088013 */       lui $t0, %hi(sMNSoundTestOptionSelectID)
  /* 188534 80132164 8D084348 */        lw $t0, %lo(sMNSoundTestOptionSelectID)($t0)
  /* 188538 80132168 3C058013 */       lui $a1, %hi(dMNSoundTestMusicIDs)
  /* 18853C 8013216C 00002025 */        or $a0, $zero, $zero
  /* 188540 80132170 00084880 */       sll $t1, $t0, 2
  /* 188544 80132174 00A92821 */      addu $a1, $a1, $t1
  /* 188548 80132178 0C0082AD */       jal func_80020AB4
  /* 18854C 8013217C 8CA539E0 */        lw $a1, %lo(dMNSoundTestMusicIDs)($a1)
  /* 188550 80132180 1000002D */         b .L80132238
  /* 188554 80132184 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132188:
  /* 188558 80132188 0C0099A8 */       jal func_800266A0
  /* 18855C 8013218C 00000000 */       nop 
  /* 188560 80132190 3C0A8013 */       lui $t2, %hi(D_ovl62_8013434C)
  /* 188564 80132194 8D4A434C */        lw $t2, %lo(D_ovl62_8013434C)($t2)
  /* 188568 80132198 3C048013 */       lui $a0, %hi(dMNSoundTestSoundIDs)
  /* 18856C 8013219C 000A5880 */       sll $t3, $t2, 2
  /* 188570 801321A0 008B2021 */      addu $a0, $a0, $t3
  /* 188574 801321A4 0C009A70 */       jal func_800269C0
  /* 188578 801321A8 94843A96 */       lhu $a0, %lo(dMNSoundTestSoundIDs)($a0)
  /* 18857C 801321AC 10000022 */         b .L80132238
  /* 188580 801321B0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801321B4:
  /* 188584 801321B4 0C0099A8 */       jal func_800266A0
  /* 188588 801321B8 00000000 */       nop 
  /* 18858C 801321BC 3C0C8013 */       lui $t4, %hi(D_ovl62_80134350)
  /* 188590 801321C0 8D8C4350 */        lw $t4, %lo(D_ovl62_80134350)($t4)
  /* 188594 801321C4 3C048013 */       lui $a0, %hi(dMNSoundTestVoiceIDs)
  /* 188598 801321C8 000C6880 */       sll $t5, $t4, 2
  /* 18859C 801321CC 008D2021 */      addu $a0, $a0, $t5
  /* 1885A0 801321D0 0C009A70 */       jal func_800269C0
  /* 1885A4 801321D4 94843D9E */       lhu $a0, %lo(dMNSoundTestVoiceIDs)($a0)
  /* 1885A8 801321D8 10000017 */         b .L80132238
  /* 1885AC 801321DC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801321E0:
  /* 1885B0 801321E0 0C0E41DB */       jal func_ovl1_8039076C
  /* 1885B4 801321E4 24042000 */     addiu $a0, $zero, 0x2000
  /* 1885B8 801321E8 10400007 */      beqz $v0, .L80132208
  /* 1885BC 801321EC 00000000 */       nop 
  /* 1885C0 801321F0 0C00829D */       jal func_80020A74
  /* 1885C4 801321F4 00000000 */       nop 
  /* 1885C8 801321F8 0C0099A8 */       jal func_800266A0
  /* 1885CC 801321FC 00000000 */       nop 
  /* 1885D0 80132200 1000000D */         b .L80132238
  /* 1885D4 80132204 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132208:
  /* 1885D8 80132208 0C0E41DB */       jal func_ovl1_8039076C
  /* 1885DC 8013220C 24041000 */     addiu $a0, $zero, 0x1000
  /* 1885E0 80132210 10400008 */      beqz $v0, .L80132234
  /* 1885E4 80132214 00002025 */        or $a0, $zero, $zero
  /* 1885E8 80132218 00002825 */        or $a1, $zero, $zero
  /* 1885EC 8013221C 0C0082F0 */       jal func_80020BC0
  /* 1885F0 80132220 24060078 */     addiu $a2, $zero, 0x78
  /* 1885F4 80132224 240E0078 */     addiu $t6, $zero, 0x78
  /* 1885F8 80132228 3C018013 */       lui $at, %hi(sMNSoundTestFadeOutWait)
  /* 1885FC 8013222C 0C0099A8 */       jal func_800266A0
  /* 188600 80132230 AC2E4364 */        sw $t6, %lo(sMNSoundTestFadeOutWait)($at)
  .L80132234:
  /* 188604 80132234 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132238:
  /* 188608 80132238 27BD0018 */     addiu $sp, $sp, 0x18
  /* 18860C 8013223C 03E00008 */        jr $ra
  /* 188610 80132240 00000000 */       nop 

glabel mnSoundTestMenuProcUpdate
  /* 188614 80132244 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 188618 80132248 AFBF0014 */        sw $ra, 0x14($sp)
  /* 18861C 8013224C 0C04C6C0 */       jal mnSoundTestUpdateOptionColors
  /* 188620 80132250 AFA40018 */        sw $a0, 0x18($sp)
  /* 188624 80132254 0C0E41DB */       jal func_ovl1_8039076C
  /* 188628 80132258 24044000 */     addiu $a0, $zero, 0x4000
  /* 18862C 8013225C 1040000E */      beqz $v0, .L80132298
  /* 188630 80132260 240F003A */     addiu $t7, $zero, 0x3a
  /* 188634 80132264 3C02800A */       lui $v0, %hi(gSceneData)
  /* 188638 80132268 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 18863C 8013226C 904E0000 */       lbu $t6, ($v0) # gSceneData + 0
  /* 188640 80132270 A04F0000 */        sb $t7, ($v0) # gSceneData + 0
  /* 188644 80132274 0C00829D */       jal func_80020A74
  /* 188648 80132278 A04E0001 */        sb $t6, 1($v0) # gSceneData + 1
  /* 18864C 8013227C 0C0099A8 */       jal func_800266A0
  /* 188650 80132280 00000000 */       nop 
  /* 188654 80132284 00002025 */        or $a0, $zero, $zero
  /* 188658 80132288 0C0082CE */       jal func_80020B38
  /* 18865C 8013228C 24057000 */     addiu $a1, $zero, 0x7000
  /* 188660 80132290 0C00171D */       jal func_80005C74
  /* 188664 80132294 00000000 */       nop 
  .L80132298:
  /* 188668 80132298 0C04C6E0 */       jal mnSoundTestUpdateControllerInputs
  /* 18866C 8013229C 00000000 */       nop 
  /* 188670 801322A0 0C04C82D */       jal mnSoundTestUpdateFunctions
  /* 188674 801322A4 00000000 */       nop 
  /* 188678 801322A8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 18867C 801322AC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 188680 801322B0 03E00008 */        jr $ra
  /* 188684 801322B4 00000000 */       nop 

glabel func_ovl62_801322B8
  /* 188688 801322B8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 18868C 801322BC 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 188690 801322C0 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 188694 801322C4 3C188013 */       lui $t8, %hi(D_ovl62_80134368)
  /* 188698 801322C8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 18869C 801322CC 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 1886A0 801322D0 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 1886A4 801322D4 27184368 */     addiu $t8, $t8, %lo(D_ovl62_80134368)
  /* 1886A8 801322D8 24190020 */     addiu $t9, $zero, 0x20
  /* 1886AC 801322DC AFAE0020 */        sw $t6, 0x20($sp)
  /* 1886B0 801322E0 AFAF0024 */        sw $t7, 0x24($sp)
  /* 1886B4 801322E4 AFA00028 */        sw $zero, 0x28($sp)
  /* 1886B8 801322E8 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1886BC 801322EC AFB80030 */        sw $t8, 0x30($sp)
  /* 1886C0 801322F0 AFB90034 */        sw $t9, 0x34($sp)
  /* 1886C4 801322F4 AFA00038 */        sw $zero, 0x38($sp)
  /* 1886C8 801322F8 AFA0003C */        sw $zero, 0x3c($sp)
  /* 1886CC 801322FC 0C0337DE */       jal rdManagerInitSetup
  /* 1886D0 80132300 27A40020 */     addiu $a0, $sp, 0x20
  /* 1886D4 80132304 3C048013 */       lui $a0, %hi(dMNSoundTestFileIDs)
  /* 1886D8 80132308 2484416C */     addiu $a0, $a0, %lo(dMNSoundTestFileIDs)
  /* 1886DC 8013230C 0C0337BB */       jal rdManagerGetAllocSize
  /* 1886E0 80132310 24050005 */     addiu $a1, $zero, 5
  /* 1886E4 80132314 00402025 */        or $a0, $v0, $zero
  /* 1886E8 80132318 0C001260 */       jal gsMemoryAlloc
  /* 1886EC 8013231C 24050010 */     addiu $a1, $zero, 0x10
  /* 1886F0 80132320 3C048013 */       lui $a0, %hi(dMNSoundTestFileIDs)
  /* 1886F4 80132324 3C068013 */       lui $a2, %hi(sMNSoundTestFiles)
  /* 1886F8 80132328 24C64468 */     addiu $a2, $a2, %lo(sMNSoundTestFiles)
  /* 1886FC 8013232C 2484416C */     addiu $a0, $a0, %lo(dMNSoundTestFileIDs)
  /* 188700 80132330 24050005 */     addiu $a1, $zero, 5
  /* 188704 80132334 0C033781 */       jal rdManagerLoadFiles
  /* 188708 80132338 00403825 */        or $a3, $v0, $zero
  /* 18870C 8013233C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 188710 80132340 27BD0040 */     addiu $sp, $sp, 0x40
  /* 188714 80132344 03E00008 */        jr $ra
  /* 188718 80132348 00000000 */       nop 

glabel mnSoundTestMakeHeaderSObjs
  /* 18871C 8013234C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 188720 80132350 AFBF001C */        sw $ra, 0x1c($sp)
  /* 188724 80132354 24040001 */     addiu $a0, $zero, 1
  /* 188728 80132358 00002825 */        or $a1, $zero, $zero
  /* 18872C 8013235C 24060002 */     addiu $a2, $zero, 2
  /* 188730 80132360 0C00265A */       jal omMakeGObjSPAfter
  /* 188734 80132364 3C078000 */       lui $a3, 0x8000
  /* 188738 80132368 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 18873C 8013236C 240EFFFF */     addiu $t6, $zero, -1
  /* 188740 80132370 AFA20024 */        sw $v0, 0x24($sp)
  /* 188744 80132374 AFAE0010 */        sw $t6, 0x10($sp)
  /* 188748 80132378 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 18874C 8013237C 00402025 */        or $a0, $v0, $zero
  /* 188750 80132380 24060001 */     addiu $a2, $zero, 1
  /* 188754 80132384 0C00277D */       jal omAddGObjRenderProc
  /* 188758 80132388 3C078000 */       lui $a3, 0x8000
  /* 18875C 8013238C 3C0F8013 */       lui $t7, %hi(D_ovl62_80134470)
  /* 188760 80132390 8DEF4470 */        lw $t7, %lo(D_ovl62_80134470)($t7)
  /* 188764 80132394 3C180000 */       lui $t8, %hi(D_NF_00000B40)
  /* 188768 80132398 27180B40 */     addiu $t8, $t8, %lo(D_NF_00000B40)
  /* 18876C 8013239C 8FA40024 */        lw $a0, 0x24($sp)
  /* 188770 801323A0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188774 801323A4 01F82821 */      addu $a1, $t7, $t8
  /* 188778 801323A8 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 18877C 801323AC 44812000 */      mtc1 $at, $f4 # 23.0 to cop1
  /* 188780 801323B0 3C014188 */       lui $at, (0x41880000 >> 16) # 17.0
  /* 188784 801323B4 44813000 */      mtc1 $at, $f6 # 17.0 to cop1
  /* 188788 801323B8 24190001 */     addiu $t9, $zero, 1
  /* 18878C 801323BC 2408005F */     addiu $t0, $zero, 0x5f
  /* 188790 801323C0 24090058 */     addiu $t1, $zero, 0x58
  /* 188794 801323C4 240A0046 */     addiu $t2, $zero, 0x46
  /* 188798 801323C8 A4590024 */        sh $t9, 0x24($v0)
  /* 18879C 801323CC A0480028 */        sb $t0, 0x28($v0)
  /* 1887A0 801323D0 A0490029 */        sb $t1, 0x29($v0)
  /* 1887A4 801323D4 A04A002A */        sb $t2, 0x2a($v0)
  /* 1887A8 801323D8 3C0B8013 */       lui $t3, %hi(D_ovl62_80134478)
  /* 1887AC 801323DC E4440058 */      swc1 $f4, 0x58($v0)
  /* 1887B0 801323E0 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1887B4 801323E4 8D6B4478 */        lw $t3, %lo(D_ovl62_80134478)($t3)
  /* 1887B8 801323E8 3C0C0000 */       lui $t4, %hi(D_NF_00001BB8)
  /* 1887BC 801323EC 258C1BB8 */     addiu $t4, $t4, %lo(D_NF_00001BB8)
  /* 1887C0 801323F0 8FA40024 */        lw $a0, 0x24($sp)
  /* 1887C4 801323F4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1887C8 801323F8 016C2821 */      addu $a1, $t3, $t4
  /* 1887CC 801323FC 3C014318 */       lui $at, (0x43180000 >> 16) # 152.0
  /* 1887D0 80132400 44814000 */      mtc1 $at, $f8 # 152.0 to cop1
  /* 1887D4 80132404 3C0141B8 */       lui $at, (0x41B80000 >> 16) # 23.0
  /* 1887D8 80132408 44815000 */      mtc1 $at, $f10 # 23.0 to cop1
  /* 1887DC 8013240C 240D0001 */     addiu $t5, $zero, 1
  /* 1887E0 80132410 240E00F2 */     addiu $t6, $zero, 0xf2
  /* 1887E4 80132414 240F00C7 */     addiu $t7, $zero, 0xc7
  /* 1887E8 80132418 2418000D */     addiu $t8, $zero, 0xd
  /* 1887EC 8013241C A44D0024 */        sh $t5, 0x24($v0)
  /* 1887F0 80132420 A04E0028 */        sb $t6, 0x28($v0)
  /* 1887F4 80132424 A04F0029 */        sb $t7, 0x29($v0)
  /* 1887F8 80132428 A058002A */        sb $t8, 0x2a($v0)
  /* 1887FC 8013242C A0400060 */        sb $zero, 0x60($v0)
  /* 188800 80132430 A0400061 */        sb $zero, 0x61($v0)
  /* 188804 80132434 A0400062 */        sb $zero, 0x62($v0)
  /* 188808 80132438 E4480058 */      swc1 $f8, 0x58($v0)
  /* 18880C 8013243C E44A005C */      swc1 $f10, 0x5c($v0)
  /* 188810 80132440 8FBF001C */        lw $ra, 0x1c($sp)
  /* 188814 80132444 27BD0028 */     addiu $sp, $sp, 0x28
  /* 188818 80132448 03E00008 */        jr $ra
  /* 18881C 8013244C 00000000 */       nop 

glabel mnSoundTestOptionProcUpdate
  /* 188820 80132450 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 188824 80132454 AFBF0024 */        sw $ra, 0x24($sp)
  /* 188828 80132458 AFB30020 */        sw $s3, 0x20($sp)
  /* 18882C 8013245C AFB2001C */        sw $s2, 0x1c($sp)
  /* 188830 80132460 AFB10018 */        sw $s1, 0x18($sp)
  /* 188834 80132464 AFB00014 */        sw $s0, 0x14($sp)
  /* 188838 80132468 8C830084 */        lw $v1, 0x84($a0)
  /* 18883C 8013246C 3C0E8013 */       lui $t6, %hi(sMNSoundTestOptionColorR)
  /* 188840 80132470 3C0F8013 */       lui $t7, %hi(sMNSoundTestOptionColorG)
  /* 188844 80132474 00031080 */       sll $v0, $v1, 2
  /* 188848 80132478 3C188013 */       lui $t8, %hi(sMNSoundTestOptionColorB)
  /* 18884C 8013247C 27184330 */     addiu $t8, $t8, %lo(sMNSoundTestOptionColorB)
  /* 188850 80132480 25EF4320 */     addiu $t7, $t7, %lo(sMNSoundTestOptionColorG)
  /* 188854 80132484 25CE4310 */     addiu $t6, $t6, %lo(sMNSoundTestOptionColorR)
  /* 188858 80132488 8C900074 */        lw $s0, 0x74($a0)
  /* 18885C 8013248C 004E8821 */      addu $s1, $v0, $t6
  /* 188860 80132490 004F9021 */      addu $s2, $v0, $t7
  /* 188864 80132494 00589821 */      addu $s3, $v0, $t8
  /* 188868 80132498 92220003 */       lbu $v0, 3($s1)
  .L8013249C:
  /* 18886C 8013249C 8E190008 */        lw $t9, 8($s0)
  /* 188870 801324A0 24040001 */     addiu $a0, $zero, 1
  /* 188874 801324A4 A2020028 */        sb $v0, 0x28($s0)
  /* 188878 801324A8 A3220028 */        sb $v0, 0x28($t9)
  /* 18887C 801324AC 92420003 */       lbu $v0, 3($s2)
  /* 188880 801324B0 8E080008 */        lw $t0, 8($s0)
  /* 188884 801324B4 A2020029 */        sb $v0, 0x29($s0)
  /* 188888 801324B8 A1020029 */        sb $v0, 0x29($t0)
  /* 18888C 801324BC 92620003 */       lbu $v0, 3($s3)
  /* 188890 801324C0 8E090008 */        lw $t1, 8($s0)
  /* 188894 801324C4 A202002A */        sb $v0, 0x2a($s0)
  /* 188898 801324C8 0C002C7A */       jal gsStopCurrentProcess
  /* 18889C 801324CC A122002A */        sb $v0, 0x2a($t1)
  /* 1888A0 801324D0 1000FFF2 */         b .L8013249C
  /* 1888A4 801324D4 92220003 */       lbu $v0, 3($s1)
  /* 1888A8 801324D8 00000000 */       nop 
  /* 1888AC 801324DC 00000000 */       nop 
# Maybe start of new file
  /* 1888B0 801324E0 8FBF0024 */        lw $ra, 0x24($sp)
  /* 1888B4 801324E4 8FB00014 */        lw $s0, 0x14($sp)
  /* 1888B8 801324E8 8FB10018 */        lw $s1, 0x18($sp)
  /* 1888BC 801324EC 8FB2001C */        lw $s2, 0x1c($sp)
  /* 1888C0 801324F0 8FB30020 */        lw $s3, 0x20($sp)
  /* 1888C4 801324F4 03E00008 */        jr $ra
  /* 1888C8 801324F8 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnSoundTestMusicProcRender
  /* 1888CC 801324FC 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 1888D0 80132500 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 1888D4 80132504 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1888D8 80132508 AFA40000 */        sw $a0, ($sp)
  /* 1888DC 8013250C 3C0DE700 */       lui $t5, 0xe700
  /* 1888E0 80132510 244E0008 */     addiu $t6, $v0, 8
  /* 1888E4 80132514 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1888E8 80132518 AC400004 */        sw $zero, 4($v0)
  /* 1888EC 8013251C AC4D0000 */        sw $t5, ($v0)
  /* 1888F0 80132520 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1888F4 80132524 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 1888F8 80132528 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 1888FC 8013252C 244F0008 */     addiu $t7, $v0, 8
  /* 188900 80132530 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 188904 80132534 3C190030 */       lui $t9, 0x30
  /* 188908 80132538 AC590004 */        sw $t9, 4($v0)
  /* 18890C 8013253C AC580000 */        sw $t8, ($v0)
  /* 188910 80132540 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188914 80132544 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 188918 80132548 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 18891C 8013254C 244E0008 */     addiu $t6, $v0, 8
  /* 188920 80132550 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188924 80132554 AC400004 */        sw $zero, 4($v0)
  /* 188928 80132558 AC4F0000 */        sw $t7, ($v0)
  /* 18892C 8013255C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188930 80132560 3C19F700 */       lui $t9, 0xf700
  /* 188934 80132564 3C0E8013 */       lui $t6, %hi(sMNSoundTestOptionColorB)
  /* 188938 80132568 24580008 */     addiu $t8, $v0, 8
  /* 18893C 8013256C AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 188940 80132570 3C188013 */       lui $t8, %hi(sMNSoundTestOptionColorR)
  /* 188944 80132574 AC590000 */        sw $t9, ($v0)
  /* 188948 80132578 8F184310 */        lw $t8, %lo(sMNSoundTestOptionColorR)($t8)
  /* 18894C 8013257C 8DCE4330 */        lw $t6, %lo(sMNSoundTestOptionColorB)($t6)
  /* 188950 80132580 0018CE00 */       sll $t9, $t8, 0x18
  /* 188954 80132584 3C188013 */       lui $t8, %hi(sMNSoundTestOptionColorG)
  /* 188958 80132588 8F184320 */        lw $t8, %lo(sMNSoundTestOptionColorG)($t8)
  /* 18895C 8013258C 000E7A00 */       sll $t7, $t6, 8
  /* 188960 80132590 01F97025 */        or $t6, $t7, $t9
  /* 188964 80132594 00187C00 */       sll $t7, $t8, 0x10
  /* 188968 80132598 01CF2025 */        or $a0, $t6, $t7
  /* 18896C 8013259C 348400FF */       ori $a0, $a0, 0xff
  /* 188970 801325A0 00047403 */       sra $t6, $a0, 0x10
  /* 188974 801325A4 31CFF800 */      andi $t7, $t6, 0xf800
  /* 188978 801325A8 0004C9C3 */       sra $t9, $a0, 7
  /* 18897C 801325AC 33380001 */      andi $t8, $t9, 1
  /* 188980 801325B0 030FC825 */        or $t9, $t8, $t7
  /* 188984 801325B4 00047343 */       sra $t6, $a0, 0xd
  /* 188988 801325B8 31D807C0 */      andi $t8, $t6, 0x7c0
  /* 18898C 801325BC 03387825 */        or $t7, $t9, $t8
  /* 188990 801325C0 00047283 */       sra $t6, $a0, 0xa
  /* 188994 801325C4 31D9003E */      andi $t9, $t6, 0x3e
  /* 188998 801325C8 01F94825 */        or $t1, $t7, $t9
  /* 18899C 801325CC 0009C400 */       sll $t8, $t1, 0x10
  /* 1889A0 801325D0 01387025 */        or $t6, $t1, $t8
  /* 1889A4 801325D4 AC4E0004 */        sw $t6, 4($v0)
  /* 1889A8 801325D8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1889AC 801325DC 3C180002 */       lui $t8, (0x280E0 >> 16) # 164064
  /* 1889B0 801325E0 3C19F61C */       lui $t9, (0xF61C00E4 >> 16) # 4129030372
  /* 1889B4 801325E4 244F0008 */     addiu $t7, $v0, 8
  /* 1889B8 801325E8 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 1889BC 801325EC 373900E4 */       ori $t9, $t9, (0xF61C00E4 & 0xFFFF) # 4129030372
  /* 1889C0 801325F0 371880E0 */       ori $t8, $t8, (0x280E0 & 0xFFFF) # 164064
  /* 1889C4 801325F4 AC580004 */        sw $t8, 4($v0)
  /* 1889C8 801325F8 AC590000 */        sw $t9, ($v0)
  /* 1889CC 801325FC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1889D0 80132600 3C190002 */       lui $t9, (0x2817C >> 16) # 164220
  /* 1889D4 80132604 3C0FF61C */       lui $t7, (0xF61C0180 >> 16) # 4129030528
  /* 1889D8 80132608 244E0008 */     addiu $t6, $v0, 8
  /* 1889DC 8013260C AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1889E0 80132610 35EF0180 */       ori $t7, $t7, (0xF61C0180 & 0xFFFF) # 4129030528
  /* 1889E4 80132614 3739817C */       ori $t9, $t9, (0x2817C & 0xFFFF) # 164220
  /* 1889E8 80132618 AC590004 */        sw $t9, 4($v0)
  /* 1889EC 8013261C AC4F0000 */        sw $t7, ($v0)
  /* 1889F0 80132620 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1889F4 80132624 24580008 */     addiu $t8, $v0, 8
  /* 1889F8 80132628 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1889FC 8013262C AC400004 */        sw $zero, 4($v0)
  /* 188A00 80132630 03E00008 */        jr $ra
  /* 188A04 80132634 AC4D0000 */        sw $t5, ($v0)

glabel mnSoundTestMakeMusicSObjs
  /* 188A08 80132638 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 188A0C 8013263C AFBF0024 */        sw $ra, 0x24($sp)
  /* 188A10 80132640 AFB00020 */        sw $s0, 0x20($sp)
  /* 188A14 80132644 24040001 */     addiu $a0, $zero, 1
  /* 188A18 80132648 00002825 */        or $a1, $zero, $zero
  /* 188A1C 8013264C 24060003 */     addiu $a2, $zero, 3
  /* 188A20 80132650 0C00265A */       jal omMakeGObjSPAfter
  /* 188A24 80132654 3C078000 */       lui $a3, 0x8000
  /* 188A28 80132658 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 188A2C 8013265C 240EFFFF */     addiu $t6, $zero, -1
  /* 188A30 80132660 00408025 */        or $s0, $v0, $zero
  /* 188A34 80132664 AFAE0010 */        sw $t6, 0x10($sp)
  /* 188A38 80132668 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 188A3C 8013266C 00402025 */        or $a0, $v0, $zero
  /* 188A40 80132670 24060001 */     addiu $a2, $zero, 1
  /* 188A44 80132674 0C00277D */       jal omAddGObjRenderProc
  /* 188A48 80132678 3C078000 */       lui $a3, 0x8000
  /* 188A4C 8013267C 3C058013 */       lui $a1, %hi(mnSoundTestOptionProcUpdate)
  /* 188A50 80132680 AE000084 */        sw $zero, 0x84($s0)
  /* 188A54 80132684 24A52450 */     addiu $a1, $a1, %lo(mnSoundTestOptionProcUpdate)
  /* 188A58 80132688 02002025 */        or $a0, $s0, $zero
  /* 188A5C 8013268C 00003025 */        or $a2, $zero, $zero
  /* 188A60 80132690 0C002062 */       jal omAddGObjCommonProc
  /* 188A64 80132694 24070001 */     addiu $a3, $zero, 1
  /* 188A68 80132698 24040001 */     addiu $a0, $zero, 1
  /* 188A6C 8013269C 00002825 */        or $a1, $zero, $zero
  /* 188A70 801326A0 24060003 */     addiu $a2, $zero, 3
  /* 188A74 801326A4 0C00265A */       jal omMakeGObjSPAfter
  /* 188A78 801326A8 3C078000 */       lui $a3, 0x8000
  /* 188A7C 801326AC 3C058013 */       lui $a1, %hi(mnSoundTestMusicProcRender)
  /* 188A80 801326B0 240FFFFF */     addiu $t7, $zero, -1
  /* 188A84 801326B4 AFAF0010 */        sw $t7, 0x10($sp)
  /* 188A88 801326B8 24A524FC */     addiu $a1, $a1, %lo(mnSoundTestMusicProcRender)
  /* 188A8C 801326BC 00402025 */        or $a0, $v0, $zero
  /* 188A90 801326C0 24060002 */     addiu $a2, $zero, 2
  /* 188A94 801326C4 0C00277D */       jal omAddGObjRenderProc
  /* 188A98 801326C8 3C078000 */       lui $a3, 0x8000
  /* 188A9C 801326CC 3C188013 */       lui $t8, %hi(D_ovl62_80134478)
  /* 188AA0 801326D0 8F184478 */        lw $t8, %lo(D_ovl62_80134478)($t8)
  /* 188AA4 801326D4 3C190000 */       lui $t9, %hi(D_NF_00000438)
  /* 188AA8 801326D8 27390438 */     addiu $t9, $t9, %lo(D_NF_00000438)
  /* 188AAC 801326DC 02002025 */        or $a0, $s0, $zero
  /* 188AB0 801326E0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188AB4 801326E4 03192821 */      addu $a1, $t8, $t9
  /* 188AB8 801326E8 3C01425C */       lui $at, (0x425C0000 >> 16) # 55.0
  /* 188ABC 801326EC 44812000 */      mtc1 $at, $f4 # 55.0 to cop1
  /* 188AC0 801326F0 3C014274 */       lui $at, (0x42740000 >> 16) # 61.0
  /* 188AC4 801326F4 44813000 */      mtc1 $at, $f6 # 61.0 to cop1
  /* 188AC8 801326F8 24080001 */     addiu $t0, $zero, 1
  /* 188ACC 801326FC A4480024 */        sh $t0, 0x24($v0)
  /* 188AD0 80132700 3C098013 */       lui $t1, %hi(D_ovl62_80134478)
  /* 188AD4 80132704 E4440058 */      swc1 $f4, 0x58($v0)
  /* 188AD8 80132708 E446005C */      swc1 $f6, 0x5c($v0)
  /* 188ADC 8013270C 8D294478 */        lw $t1, %lo(D_ovl62_80134478)($t1)
  /* 188AE0 80132710 3C0A0000 */       lui $t2, %hi(D_NF_00001138)
  /* 188AE4 80132714 254A1138 */     addiu $t2, $t2, %lo(D_NF_00001138)
  /* 188AE8 80132718 02002025 */        or $a0, $s0, $zero
  /* 188AEC 8013271C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188AF0 80132720 012A2821 */      addu $a1, $t1, $t2
  /* 188AF4 80132724 3C0142E0 */       lui $at, (0x42E00000 >> 16) # 112.0
  /* 188AF8 80132728 44814000 */      mtc1 $at, $f8 # 112.0 to cop1
  /* 188AFC 8013272C 3C014260 */       lui $at, (0x42600000 >> 16) # 56.0
  /* 188B00 80132730 44815000 */      mtc1 $at, $f10 # 56.0 to cop1
  /* 188B04 80132734 240B0001 */     addiu $t3, $zero, 1
  /* 188B08 80132738 A44B0024 */        sh $t3, 0x24($v0)
  /* 188B0C 8013273C E4480058 */      swc1 $f8, 0x58($v0)
  /* 188B10 80132740 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 188B14 80132744 8FBF0024 */        lw $ra, 0x24($sp)
  /* 188B18 80132748 8FB00020 */        lw $s0, 0x20($sp)
  /* 188B1C 8013274C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 188B20 80132750 03E00008 */        jr $ra
  /* 188B24 80132754 00000000 */       nop 

glabel mnSoundTestSoundProcRender
  /* 188B28 80132758 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 188B2C 8013275C 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 188B30 80132760 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188B34 80132764 AFA40000 */        sw $a0, ($sp)
  /* 188B38 80132768 3C0DE700 */       lui $t5, 0xe700
  /* 188B3C 8013276C 244E0008 */     addiu $t6, $v0, 8
  /* 188B40 80132770 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188B44 80132774 AC400004 */        sw $zero, 4($v0)
  /* 188B48 80132778 AC4D0000 */        sw $t5, ($v0)
  /* 188B4C 8013277C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188B50 80132780 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 188B54 80132784 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 188B58 80132788 244F0008 */     addiu $t7, $v0, 8
  /* 188B5C 8013278C AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 188B60 80132790 3C190030 */       lui $t9, 0x30
  /* 188B64 80132794 AC590004 */        sw $t9, 4($v0)
  /* 188B68 80132798 AC580000 */        sw $t8, ($v0)
  /* 188B6C 8013279C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188B70 801327A0 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 188B74 801327A4 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 188B78 801327A8 244E0008 */     addiu $t6, $v0, 8
  /* 188B7C 801327AC AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188B80 801327B0 AC400004 */        sw $zero, 4($v0)
  /* 188B84 801327B4 AC4F0000 */        sw $t7, ($v0)
  /* 188B88 801327B8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188B8C 801327BC 3C19F700 */       lui $t9, 0xf700
  /* 188B90 801327C0 3C0E8013 */       lui $t6, %hi(D_ovl62_80134334)
  /* 188B94 801327C4 24580008 */     addiu $t8, $v0, 8
  /* 188B98 801327C8 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 188B9C 801327CC 3C188013 */       lui $t8, %hi(D_ovl62_80134314)
  /* 188BA0 801327D0 AC590000 */        sw $t9, ($v0)
  /* 188BA4 801327D4 8F184314 */        lw $t8, %lo(D_ovl62_80134314)($t8)
  /* 188BA8 801327D8 8DCE4334 */        lw $t6, %lo(D_ovl62_80134334)($t6)
  /* 188BAC 801327DC 0018CE00 */       sll $t9, $t8, 0x18
  /* 188BB0 801327E0 3C188013 */       lui $t8, %hi(D_ovl62_80134324)
  /* 188BB4 801327E4 8F184324 */        lw $t8, %lo(D_ovl62_80134324)($t8)
  /* 188BB8 801327E8 000E7A00 */       sll $t7, $t6, 8
  /* 188BBC 801327EC 01F97025 */        or $t6, $t7, $t9
  /* 188BC0 801327F0 00187C00 */       sll $t7, $t8, 0x10
  /* 188BC4 801327F4 01CF2025 */        or $a0, $t6, $t7
  /* 188BC8 801327F8 348400FF */       ori $a0, $a0, 0xff
  /* 188BCC 801327FC 00047403 */       sra $t6, $a0, 0x10
  /* 188BD0 80132800 31CFF800 */      andi $t7, $t6, 0xf800
  /* 188BD4 80132804 0004C9C3 */       sra $t9, $a0, 7
  /* 188BD8 80132808 33380001 */      andi $t8, $t9, 1
  /* 188BDC 8013280C 030FC825 */        or $t9, $t8, $t7
  /* 188BE0 80132810 00047343 */       sra $t6, $a0, 0xd
  /* 188BE4 80132814 31D807C0 */      andi $t8, $t6, 0x7c0
  /* 188BE8 80132818 03387825 */        or $t7, $t9, $t8
  /* 188BEC 8013281C 00047283 */       sra $t6, $a0, 0xa
  /* 188BF0 80132820 31D9003E */      andi $t9, $t6, 0x3e
  /* 188BF4 80132824 01F94825 */        or $t1, $t7, $t9
  /* 188BF8 80132828 0009C400 */       sll $t8, $t1, 0x10
  /* 188BFC 8013282C 01387025 */        or $t6, $t1, $t8
  /* 188C00 80132830 AC4E0004 */        sw $t6, 4($v0)
  /* 188C04 80132834 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188C08 80132838 3C180002 */       lui $t8, (0x281A0 >> 16) # 164256
  /* 188C0C 8013283C 3C19F621 */       lui $t9, (0xF62101A4 >> 16) # 4129358244
  /* 188C10 80132840 244F0008 */     addiu $t7, $v0, 8
  /* 188C14 80132844 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 188C18 80132848 373901A4 */       ori $t9, $t9, (0xF62101A4 & 0xFFFF) # 4129358244
  /* 188C1C 8013284C 371881A0 */       ori $t8, $t8, (0x281A0 & 0xFFFF) # 164256
  /* 188C20 80132850 AC580004 */        sw $t8, 4($v0)
  /* 188C24 80132854 AC590000 */        sw $t9, ($v0)
  /* 188C28 80132858 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188C2C 8013285C 3C190002 */       lui $t9, (0x2823C >> 16) # 164412
  /* 188C30 80132860 3C0FF621 */       lui $t7, (0xF6210240 >> 16) # 4129358400
  /* 188C34 80132864 244E0008 */     addiu $t6, $v0, 8
  /* 188C38 80132868 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188C3C 8013286C 35EF0240 */       ori $t7, $t7, (0xF6210240 & 0xFFFF) # 4129358400
  /* 188C40 80132870 3739823C */       ori $t9, $t9, (0x2823C & 0xFFFF) # 164412
  /* 188C44 80132874 AC590004 */        sw $t9, 4($v0)
  /* 188C48 80132878 AC4F0000 */        sw $t7, ($v0)
  /* 188C4C 8013287C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188C50 80132880 24580008 */     addiu $t8, $v0, 8
  /* 188C54 80132884 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 188C58 80132888 AC400004 */        sw $zero, 4($v0)
  /* 188C5C 8013288C 03E00008 */        jr $ra
  /* 188C60 80132890 AC4D0000 */        sw $t5, ($v0)

glabel mnSoundTestMakeSoundSObjs
  /* 188C64 80132894 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 188C68 80132898 AFBF0024 */        sw $ra, 0x24($sp)
  /* 188C6C 8013289C AFB00020 */        sw $s0, 0x20($sp)
  /* 188C70 801328A0 24040001 */     addiu $a0, $zero, 1
  /* 188C74 801328A4 00002825 */        or $a1, $zero, $zero
  /* 188C78 801328A8 24060003 */     addiu $a2, $zero, 3
  /* 188C7C 801328AC 0C00265A */       jal omMakeGObjSPAfter
  /* 188C80 801328B0 3C078000 */       lui $a3, 0x8000
  /* 188C84 801328B4 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 188C88 801328B8 240EFFFF */     addiu $t6, $zero, -1
  /* 188C8C 801328BC 00408025 */        or $s0, $v0, $zero
  /* 188C90 801328C0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 188C94 801328C4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 188C98 801328C8 00402025 */        or $a0, $v0, $zero
  /* 188C9C 801328CC 24060001 */     addiu $a2, $zero, 1
  /* 188CA0 801328D0 0C00277D */       jal omAddGObjRenderProc
  /* 188CA4 801328D4 3C078000 */       lui $a3, 0x8000
  /* 188CA8 801328D8 3C058013 */       lui $a1, %hi(mnSoundTestOptionProcUpdate)
  /* 188CAC 801328DC 24A52450 */     addiu $a1, $a1, %lo(mnSoundTestOptionProcUpdate)
  /* 188CB0 801328E0 02002025 */        or $a0, $s0, $zero
  /* 188CB4 801328E4 00003025 */        or $a2, $zero, $zero
  /* 188CB8 801328E8 0C002062 */       jal omAddGObjCommonProc
  /* 188CBC 801328EC 24070001 */     addiu $a3, $zero, 1
  /* 188CC0 801328F0 240F0001 */     addiu $t7, $zero, 1
  /* 188CC4 801328F4 AE0F0084 */        sw $t7, 0x84($s0)
  /* 188CC8 801328F8 24040001 */     addiu $a0, $zero, 1
  /* 188CCC 801328FC 00002825 */        or $a1, $zero, $zero
  /* 188CD0 80132900 24060003 */     addiu $a2, $zero, 3
  /* 188CD4 80132904 0C00265A */       jal omMakeGObjSPAfter
  /* 188CD8 80132908 3C078000 */       lui $a3, 0x8000
  /* 188CDC 8013290C 3C058013 */       lui $a1, %hi(mnSoundTestSoundProcRender)
  /* 188CE0 80132910 2418FFFF */     addiu $t8, $zero, -1
  /* 188CE4 80132914 AFB80010 */        sw $t8, 0x10($sp)
  /* 188CE8 80132918 24A52758 */     addiu $a1, $a1, %lo(mnSoundTestSoundProcRender)
  /* 188CEC 8013291C 00402025 */        or $a0, $v0, $zero
  /* 188CF0 80132920 24060002 */     addiu $a2, $zero, 2
  /* 188CF4 80132924 0C00277D */       jal omAddGObjRenderProc
  /* 188CF8 80132928 3C078000 */       lui $a3, 0x8000
  /* 188CFC 8013292C 3C198013 */       lui $t9, %hi(D_ovl62_80134478)
  /* 188D00 80132930 8F394478 */        lw $t9, %lo(D_ovl62_80134478)($t9)
  /* 188D04 80132934 3C080000 */       lui $t0, %hi(D_NF_000009C0)
  /* 188D08 80132938 250809C0 */     addiu $t0, $t0, %lo(D_NF_000009C0)
  /* 188D0C 8013293C 02002025 */        or $a0, $s0, $zero
  /* 188D10 80132940 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188D14 80132944 03282821 */      addu $a1, $t9, $t0
  /* 188D18 80132948 3C014280 */       lui $at, (0x42800000 >> 16) # 64.0
  /* 188D1C 8013294C 44812000 */      mtc1 $at, $f4 # 64.0 to cop1
  /* 188D20 80132950 3C0142D8 */       lui $at, (0x42D80000 >> 16) # 108.0
  /* 188D24 80132954 44813000 */      mtc1 $at, $f6 # 108.0 to cop1
  /* 188D28 80132958 24090001 */     addiu $t1, $zero, 1
  /* 188D2C 8013295C A4490024 */        sh $t1, 0x24($v0)
  /* 188D30 80132960 3C0A8013 */       lui $t2, %hi(D_ovl62_80134478)
  /* 188D34 80132964 E4440058 */      swc1 $f4, 0x58($v0)
  /* 188D38 80132968 E446005C */      swc1 $f6, 0x5c($v0)
  /* 188D3C 8013296C 8D4A4478 */        lw $t2, %lo(D_ovl62_80134478)($t2)
  /* 188D40 80132970 3C0B0000 */       lui $t3, %hi(D_NF_00001138)
  /* 188D44 80132974 256B1138 */     addiu $t3, $t3, %lo(D_NF_00001138)
  /* 188D48 80132978 02002025 */        or $a0, $s0, $zero
  /* 188D4C 8013297C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188D50 80132980 014B2821 */      addu $a1, $t2, $t3
  /* 188D54 80132984 3C014304 */       lui $at, (0x43040000 >> 16) # 132.0
  /* 188D58 80132988 44814000 */      mtc1 $at, $f8 # 132.0 to cop1
  /* 188D5C 8013298C 3C0142D0 */       lui $at, (0x42D00000 >> 16) # 104.0
  /* 188D60 80132990 44815000 */      mtc1 $at, $f10 # 104.0 to cop1
  /* 188D64 80132994 240C0001 */     addiu $t4, $zero, 1
  /* 188D68 80132998 A44C0024 */        sh $t4, 0x24($v0)
  /* 188D6C 8013299C E4480058 */      swc1 $f8, 0x58($v0)
  /* 188D70 801329A0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 188D74 801329A4 8FBF0024 */        lw $ra, 0x24($sp)
  /* 188D78 801329A8 8FB00020 */        lw $s0, 0x20($sp)
  /* 188D7C 801329AC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 188D80 801329B0 03E00008 */        jr $ra
  /* 188D84 801329B4 00000000 */       nop 

glabel mnSoundTestVoiceProcRender
  /* 188D88 801329B8 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 188D8C 801329BC 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 188D90 801329C0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188D94 801329C4 AFA40000 */        sw $a0, ($sp)
  /* 188D98 801329C8 3C0DE700 */       lui $t5, 0xe700
  /* 188D9C 801329CC 244E0008 */     addiu $t6, $v0, 8
  /* 188DA0 801329D0 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188DA4 801329D4 AC400004 */        sw $zero, 4($v0)
  /* 188DA8 801329D8 AC4D0000 */        sw $t5, ($v0)
  /* 188DAC 801329DC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188DB0 801329E0 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 188DB4 801329E4 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 188DB8 801329E8 244F0008 */     addiu $t7, $v0, 8
  /* 188DBC 801329EC AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 188DC0 801329F0 3C190030 */       lui $t9, 0x30
  /* 188DC4 801329F4 AC590004 */        sw $t9, 4($v0)
  /* 188DC8 801329F8 AC580000 */        sw $t8, ($v0)
  /* 188DCC 801329FC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188DD0 80132A00 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 188DD4 80132A04 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 188DD8 80132A08 244E0008 */     addiu $t6, $v0, 8
  /* 188DDC 80132A0C AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188DE0 80132A10 AC400004 */        sw $zero, 4($v0)
  /* 188DE4 80132A14 AC4F0000 */        sw $t7, ($v0)
  /* 188DE8 80132A18 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188DEC 80132A1C 3C19F700 */       lui $t9, 0xf700
  /* 188DF0 80132A20 3C0E8013 */       lui $t6, %hi(D_ovl62_80134338)
  /* 188DF4 80132A24 24580008 */     addiu $t8, $v0, 8
  /* 188DF8 80132A28 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 188DFC 80132A2C 3C188013 */       lui $t8, %hi(D_ovl62_80134318)
  /* 188E00 80132A30 AC590000 */        sw $t9, ($v0)
  /* 188E04 80132A34 8F184318 */        lw $t8, %lo(D_ovl62_80134318)($t8)
  /* 188E08 80132A38 8DCE4338 */        lw $t6, %lo(D_ovl62_80134338)($t6)
  /* 188E0C 80132A3C 0018CE00 */       sll $t9, $t8, 0x18
  /* 188E10 80132A40 3C188013 */       lui $t8, %hi(D_ovl62_80134328)
  /* 188E14 80132A44 8F184328 */        lw $t8, %lo(D_ovl62_80134328)($t8)
  /* 188E18 80132A48 000E7A00 */       sll $t7, $t6, 8
  /* 188E1C 80132A4C 01F97025 */        or $t6, $t7, $t9
  /* 188E20 80132A50 00187C00 */       sll $t7, $t8, 0x10
  /* 188E24 80132A54 01CF2025 */        or $a0, $t6, $t7
  /* 188E28 80132A58 348400FF */       ori $a0, $a0, 0xff
  /* 188E2C 80132A5C 00047403 */       sra $t6, $a0, 0x10
  /* 188E30 80132A60 31CFF800 */      andi $t7, $t6, 0xf800
  /* 188E34 80132A64 0004C9C3 */       sra $t9, $a0, 7
  /* 188E38 80132A68 33380001 */      andi $t8, $t9, 1
  /* 188E3C 80132A6C 030FC825 */        or $t9, $t8, $t7
  /* 188E40 80132A70 00047343 */       sra $t6, $a0, 0xd
  /* 188E44 80132A74 31D807C0 */      andi $t8, $t6, 0x7c0
  /* 188E48 80132A78 03387825 */        or $t7, $t9, $t8
  /* 188E4C 80132A7C 00047283 */       sra $t6, $a0, 0xa
  /* 188E50 80132A80 31D9003E */      andi $t9, $t6, 0x3e
  /* 188E54 80132A84 01F94825 */        or $t1, $t7, $t9
  /* 188E58 80132A88 0009C400 */       sll $t8, $t1, 0x10
  /* 188E5C 80132A8C 01387025 */        or $t6, $t1, $t8
  /* 188E60 80132A90 AC4E0004 */        sw $t6, 4($v0)
  /* 188E64 80132A94 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188E68 80132A98 3C180002 */       lui $t8, (0x28260 >> 16) # 164448
  /* 188E6C 80132A9C 3C19F626 */       lui $t9, (0xF6260264 >> 16) # 4129686116
  /* 188E70 80132AA0 244F0008 */     addiu $t7, $v0, 8
  /* 188E74 80132AA4 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 188E78 80132AA8 37390264 */       ori $t9, $t9, (0xF6260264 & 0xFFFF) # 4129686116
  /* 188E7C 80132AAC 37188260 */       ori $t8, $t8, (0x28260 & 0xFFFF) # 164448
  /* 188E80 80132AB0 AC580004 */        sw $t8, 4($v0)
  /* 188E84 80132AB4 AC590000 */        sw $t9, ($v0)
  /* 188E88 80132AB8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188E8C 80132ABC 3C190002 */       lui $t9, (0x282FC >> 16) # 164604
  /* 188E90 80132AC0 3C0FF626 */       lui $t7, (0xF6260300 >> 16) # 4129686272
  /* 188E94 80132AC4 244E0008 */     addiu $t6, $v0, 8
  /* 188E98 80132AC8 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 188E9C 80132ACC 35EF0300 */       ori $t7, $t7, (0xF6260300 & 0xFFFF) # 4129686272
  /* 188EA0 80132AD0 373982FC */       ori $t9, $t9, (0x282FC & 0xFFFF) # 164604
  /* 188EA4 80132AD4 AC590004 */        sw $t9, 4($v0)
  /* 188EA8 80132AD8 AC4F0000 */        sw $t7, ($v0)
  /* 188EAC 80132ADC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 188EB0 80132AE0 24580008 */     addiu $t8, $v0, 8
  /* 188EB4 80132AE4 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 188EB8 80132AE8 AC400004 */        sw $zero, 4($v0)
  /* 188EBC 80132AEC 03E00008 */        jr $ra
  /* 188EC0 80132AF0 AC4D0000 */        sw $t5, ($v0)

glabel mnSoundTestMakeVoiceSObjs
  /* 188EC4 80132AF4 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 188EC8 80132AF8 AFBF0024 */        sw $ra, 0x24($sp)
  /* 188ECC 80132AFC AFB00020 */        sw $s0, 0x20($sp)
  /* 188ED0 80132B00 24040001 */     addiu $a0, $zero, 1
  /* 188ED4 80132B04 00002825 */        or $a1, $zero, $zero
  /* 188ED8 80132B08 24060003 */     addiu $a2, $zero, 3
  /* 188EDC 80132B0C 0C00265A */       jal omMakeGObjSPAfter
  /* 188EE0 80132B10 3C078000 */       lui $a3, 0x8000
  /* 188EE4 80132B14 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 188EE8 80132B18 240EFFFF */     addiu $t6, $zero, -1
  /* 188EEC 80132B1C 00408025 */        or $s0, $v0, $zero
  /* 188EF0 80132B20 AFAE0010 */        sw $t6, 0x10($sp)
  /* 188EF4 80132B24 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 188EF8 80132B28 00402025 */        or $a0, $v0, $zero
  /* 188EFC 80132B2C 24060001 */     addiu $a2, $zero, 1
  /* 188F00 80132B30 0C00277D */       jal omAddGObjRenderProc
  /* 188F04 80132B34 3C078000 */       lui $a3, 0x8000
  /* 188F08 80132B38 3C058013 */       lui $a1, %hi(mnSoundTestOptionProcUpdate)
  /* 188F0C 80132B3C 24A52450 */     addiu $a1, $a1, %lo(mnSoundTestOptionProcUpdate)
  /* 188F10 80132B40 02002025 */        or $a0, $s0, $zero
  /* 188F14 80132B44 00003025 */        or $a2, $zero, $zero
  /* 188F18 80132B48 0C002062 */       jal omAddGObjCommonProc
  /* 188F1C 80132B4C 24070001 */     addiu $a3, $zero, 1
  /* 188F20 80132B50 240F0002 */     addiu $t7, $zero, 2
  /* 188F24 80132B54 AE0F0084 */        sw $t7, 0x84($s0)
  /* 188F28 80132B58 24040001 */     addiu $a0, $zero, 1
  /* 188F2C 80132B5C 00002825 */        or $a1, $zero, $zero
  /* 188F30 80132B60 24060003 */     addiu $a2, $zero, 3
  /* 188F34 80132B64 0C00265A */       jal omMakeGObjSPAfter
  /* 188F38 80132B68 3C078000 */       lui $a3, 0x8000
  /* 188F3C 80132B6C 3C058013 */       lui $a1, %hi(mnSoundTestVoiceProcRender)
  /* 188F40 80132B70 2418FFFF */     addiu $t8, $zero, -1
  /* 188F44 80132B74 AFB80010 */        sw $t8, 0x10($sp)
  /* 188F48 80132B78 24A529B8 */     addiu $a1, $a1, %lo(mnSoundTestVoiceProcRender)
  /* 188F4C 80132B7C 00402025 */        or $a0, $v0, $zero
  /* 188F50 80132B80 24060002 */     addiu $a2, $zero, 2
  /* 188F54 80132B84 0C00277D */       jal omAddGObjRenderProc
  /* 188F58 80132B88 3C078000 */       lui $a3, 0x8000
  /* 188F5C 80132B8C 3C198013 */       lui $t9, %hi(D_ovl62_80134478)
  /* 188F60 80132B90 8F394478 */        lw $t9, %lo(D_ovl62_80134478)($t9)
  /* 188F64 80132B94 3C080000 */       lui $t0, %hi(D_NF_00000E48)
  /* 188F68 80132B98 25080E48 */     addiu $t0, $t0, %lo(D_NF_00000E48)
  /* 188F6C 80132B9C 02002025 */        or $a0, $s0, $zero
  /* 188F70 80132BA0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188F74 80132BA4 03282821 */      addu $a1, $t9, $t0
  /* 188F78 80132BA8 3C0142BC */       lui $at, (0x42BC0000 >> 16) # 94.0
  /* 188F7C 80132BAC 44812000 */      mtc1 $at, $f4 # 94.0 to cop1
  /* 188F80 80132BB0 3C01431C */       lui $at, (0x431C0000 >> 16) # 156.0
  /* 188F84 80132BB4 44813000 */      mtc1 $at, $f6 # 156.0 to cop1
  /* 188F88 80132BB8 24090001 */     addiu $t1, $zero, 1
  /* 188F8C 80132BBC A4490024 */        sh $t1, 0x24($v0)
  /* 188F90 80132BC0 3C0A8013 */       lui $t2, %hi(D_ovl62_80134478)
  /* 188F94 80132BC4 E4440058 */      swc1 $f4, 0x58($v0)
  /* 188F98 80132BC8 E446005C */      swc1 $f6, 0x5c($v0)
  /* 188F9C 80132BCC 8D4A4478 */        lw $t2, %lo(D_ovl62_80134478)($t2)
  /* 188FA0 80132BD0 3C0B0000 */       lui $t3, %hi(D_NF_00001138)
  /* 188FA4 80132BD4 256B1138 */     addiu $t3, $t3, %lo(D_NF_00001138)
  /* 188FA8 80132BD8 02002025 */        or $a0, $s0, $zero
  /* 188FAC 80132BDC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188FB0 80132BE0 014B2821 */      addu $a1, $t2, $t3
  /* 188FB4 80132BE4 3C014318 */       lui $at, (0x43180000 >> 16) # 152.0
  /* 188FB8 80132BE8 44810000 */      mtc1 $at, $f0 # 152.0 to cop1
  /* 188FBC 80132BEC 240C0001 */     addiu $t4, $zero, 1
  /* 188FC0 80132BF0 A44C0024 */        sh $t4, 0x24($v0)
  /* 188FC4 80132BF4 E4400058 */      swc1 $f0, 0x58($v0)
  /* 188FC8 80132BF8 E440005C */      swc1 $f0, 0x5c($v0)
  /* 188FCC 80132BFC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 188FD0 80132C00 8FB00020 */        lw $s0, 0x20($sp)
  /* 188FD4 80132C04 27BD0028 */     addiu $sp, $sp, 0x28
  /* 188FD8 80132C08 03E00008 */        jr $ra
  /* 188FDC 80132C0C 00000000 */       nop 

glabel mnSoundTestMakeAButtonSObj
  /* 188FE0 80132C10 3C0E8013 */       lui $t6, %hi(sMNSoundTestFiles)
  /* 188FE4 80132C14 8DCE4468 */        lw $t6, %lo(sMNSoundTestFiles)($t6)
  /* 188FE8 80132C18 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 188FEC 80132C1C 3C0F0000 */       lui $t7, %hi(D_NF_00000958)
  /* 188FF0 80132C20 AFBF0014 */        sw $ra, 0x14($sp)
  /* 188FF4 80132C24 25EF0958 */     addiu $t7, $t7, %lo(D_NF_00000958)
  /* 188FF8 80132C28 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 188FFC 80132C2C 01CF2821 */      addu $a1, $t6, $t7
  /* 189000 80132C30 3C01425C */       lui $at, (0x425C0000 >> 16) # 55.0
  /* 189004 80132C34 44812000 */      mtc1 $at, $f4 # 55.0 to cop1
  /* 189008 80132C38 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 18900C 80132C3C 44813000 */      mtc1 $at, $f6 # 205.0 to cop1
  /* 189010 80132C40 24180001 */     addiu $t8, $zero, 1
  /* 189014 80132C44 2419006E */     addiu $t9, $zero, 0x6e
  /* 189018 80132C48 24080077 */     addiu $t0, $zero, 0x77
  /* 18901C 80132C4C 24090075 */     addiu $t1, $zero, 0x75
  /* 189020 80132C50 240A0021 */     addiu $t2, $zero, 0x21
  /* 189024 80132C54 240B0040 */     addiu $t3, $zero, 0x40
  /* 189028 80132C58 240C003A */     addiu $t4, $zero, 0x3a
  /* 18902C 80132C5C A4580024 */        sh $t8, 0x24($v0)
  /* 189030 80132C60 A0590028 */        sb $t9, 0x28($v0)
  /* 189034 80132C64 A0480029 */        sb $t0, 0x29($v0)
  /* 189038 80132C68 A049002A */        sb $t1, 0x2a($v0)
  /* 18903C 80132C6C A04A0060 */        sb $t2, 0x60($v0)
  /* 189040 80132C70 A04B0061 */        sb $t3, 0x61($v0)
  /* 189044 80132C74 A04C0062 */        sb $t4, 0x62($v0)
  /* 189048 80132C78 E4440058 */      swc1 $f4, 0x58($v0)
  /* 18904C 80132C7C E446005C */      swc1 $f6, 0x5c($v0)
  /* 189050 80132C80 8FBF0014 */        lw $ra, 0x14($sp)
  /* 189054 80132C84 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189058 80132C88 03E00008 */        jr $ra
  /* 18905C 80132C8C 00000000 */       nop 

glabel mnSoundTestMakeBButtonSObj
  /* 189060 80132C90 3C0E8013 */       lui $t6, %hi(sMNSoundTestFiles)
  /* 189064 80132C94 8DCE4468 */        lw $t6, %lo(sMNSoundTestFiles)($t6)
  /* 189068 80132C98 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 18906C 80132C9C 3C0F0000 */       lui $t7, %hi(D_NF_00000A88)
  /* 189070 80132CA0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 189074 80132CA4 25EF0A88 */     addiu $t7, $t7, %lo(D_NF_00000A88)
  /* 189078 80132CA8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 18907C 80132CAC 01CF2821 */      addu $a1, $t6, $t7
  /* 189080 80132CB0 3C01435A */       lui $at, (0x435A0000 >> 16) # 218.0
  /* 189084 80132CB4 44812000 */      mtc1 $at, $f4 # 218.0 to cop1
  /* 189088 80132CB8 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 18908C 80132CBC 44813000 */      mtc1 $at, $f6 # 205.0 to cop1
  /* 189090 80132CC0 24180001 */     addiu $t8, $zero, 1
  /* 189094 80132CC4 2419006E */     addiu $t9, $zero, 0x6e
  /* 189098 80132CC8 24080077 */     addiu $t0, $zero, 0x77
  /* 18909C 80132CCC 2409005D */     addiu $t1, $zero, 0x5d
  /* 1890A0 80132CD0 240A0029 */     addiu $t2, $zero, 0x29
  /* 1890A4 80132CD4 240B0037 */     addiu $t3, $zero, 0x37
  /* 1890A8 80132CD8 240C0016 */     addiu $t4, $zero, 0x16
  /* 1890AC 80132CDC A4580024 */        sh $t8, 0x24($v0)
  /* 1890B0 80132CE0 A0590028 */        sb $t9, 0x28($v0)
  /* 1890B4 80132CE4 A0480029 */        sb $t0, 0x29($v0)
  /* 1890B8 80132CE8 A049002A */        sb $t1, 0x2a($v0)
  /* 1890BC 80132CEC A04A0060 */        sb $t2, 0x60($v0)
  /* 1890C0 80132CF0 A04B0061 */        sb $t3, 0x61($v0)
  /* 1890C4 80132CF4 A04C0062 */        sb $t4, 0x62($v0)
  /* 1890C8 80132CF8 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1890CC 80132CFC E446005C */      swc1 $f6, 0x5c($v0)
  /* 1890D0 80132D00 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1890D4 80132D04 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1890D8 80132D08 03E00008 */        jr $ra
  /* 1890DC 80132D0C 00000000 */       nop 

glabel mnSoundTestMakeStartButtonSObj
  /* 1890E0 80132D10 3C0E8013 */       lui $t6, %hi(D_ovl62_80134478)
  /* 1890E4 80132D14 8DCE4478 */        lw $t6, %lo(D_ovl62_80134478)($t6)
  /* 1890E8 80132D18 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1890EC 80132D1C 3C0F0000 */       lui $t7, %hi(D_NF_00001D50)
  /* 1890F0 80132D20 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1890F4 80132D24 25EF1D50 */     addiu $t7, $t7, %lo(D_NF_00001D50)
  /* 1890F8 80132D28 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1890FC 80132D2C 01CF2821 */      addu $a1, $t6, $t7
  /* 189100 80132D30 3C0142F2 */       lui $at, (0x42F20000 >> 16) # 121.0
  /* 189104 80132D34 44812000 */      mtc1 $at, $f4 # 121.0 to cop1
  /* 189108 80132D38 3C01434D */       lui $at, (0x434D0000 >> 16) # 205.0
  /* 18910C 80132D3C 44813000 */      mtc1 $at, $f6 # 205.0 to cop1
  /* 189110 80132D40 24180001 */     addiu $t8, $zero, 1
  /* 189114 80132D44 24190081 */     addiu $t9, $zero, 0x81
  /* 189118 80132D48 2408006A */     addiu $t0, $zero, 0x6a
  /* 18911C 80132D4C 24090062 */     addiu $t1, $zero, 0x62
  /* 189120 80132D50 240A003B */     addiu $t2, $zero, 0x3b
  /* 189124 80132D54 240B0020 */     addiu $t3, $zero, 0x20
  /* 189128 80132D58 240C0016 */     addiu $t4, $zero, 0x16
  /* 18912C 80132D5C A4580024 */        sh $t8, 0x24($v0)
  /* 189130 80132D60 A0590028 */        sb $t9, 0x28($v0)
  /* 189134 80132D64 A0480029 */        sb $t0, 0x29($v0)
  /* 189138 80132D68 A049002A */        sb $t1, 0x2a($v0)
  /* 18913C 80132D6C A04A0060 */        sb $t2, 0x60($v0)
  /* 189140 80132D70 A04B0061 */        sb $t3, 0x61($v0)
  /* 189144 80132D74 A04C0062 */        sb $t4, 0x62($v0)
  /* 189148 80132D78 E4440058 */      swc1 $f4, 0x58($v0)
  /* 18914C 80132D7C E446005C */      swc1 $f6, 0x5c($v0)
  /* 189150 80132D80 8FBF0014 */        lw $ra, 0x14($sp)
  /* 189154 80132D84 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189158 80132D88 03E00008 */        jr $ra
  /* 18915C 80132D8C 00000000 */       nop 

glabel mnSoundTestMakeAFunctionSObj
  /* 189160 80132D90 3C0E8013 */       lui $t6, %hi(D_ovl62_80134478)
  /* 189164 80132D94 8DCE4478 */        lw $t6, %lo(D_ovl62_80134478)($t6)
  /* 189168 80132D98 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 18916C 80132D9C 3C0F0000 */       lui $t7, %hi(D_NF_00001450)
  /* 189170 80132DA0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 189174 80132DA4 25EF1450 */     addiu $t7, $t7, %lo(D_NF_00001450)
  /* 189178 80132DA8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 18917C 80132DAC 01CF2821 */      addu $a1, $t6, $t7
  /* 189180 80132DB0 3C014290 */       lui $at, (0x42900000 >> 16) # 72.0
  /* 189184 80132DB4 44812000 */      mtc1 $at, $f4 # 72.0 to cop1
  /* 189188 80132DB8 3C014350 */       lui $at, (0x43500000 >> 16) # 208.0
  /* 18918C 80132DBC 44813000 */      mtc1 $at, $f6 # 208.0 to cop1
  /* 189190 80132DC0 24180001 */     addiu $t8, $zero, 1
  /* 189194 80132DC4 24190073 */     addiu $t9, $zero, 0x73
  /* 189198 80132DC8 2408006B */     addiu $t0, $zero, 0x6b
  /* 18919C 80132DCC 24090059 */     addiu $t1, $zero, 0x59
  /* 1891A0 80132DD0 A4580024 */        sh $t8, 0x24($v0)
  /* 1891A4 80132DD4 A0590028 */        sb $t9, 0x28($v0)
  /* 1891A8 80132DD8 A0480029 */        sb $t0, 0x29($v0)
  /* 1891AC 80132DDC A049002A */        sb $t1, 0x2a($v0)
  /* 1891B0 80132DE0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1891B4 80132DE4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1891B8 80132DE8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1891BC 80132DEC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1891C0 80132DF0 03E00008 */        jr $ra
  /* 1891C4 80132DF4 00000000 */       nop 

glabel mnSoundTestMakeStartFunctionSObj
  /* 1891C8 80132DF8 3C0E8013 */       lui $t6, %hi(D_ovl62_80134478)
  /* 1891CC 80132DFC 8DCE4478 */        lw $t6, %lo(D_ovl62_80134478)($t6)
  /* 1891D0 80132E00 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1891D4 80132E04 3C0F0000 */       lui $t7, %hi(D_NF_00001348)
  /* 1891D8 80132E08 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1891DC 80132E0C 25EF1348 */     addiu $t7, $t7, %lo(D_NF_00001348)
  /* 1891E0 80132E10 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1891E4 80132E14 01CF2821 */      addu $a1, $t6, $t7
  /* 1891E8 80132E18 3C014314 */       lui $at, (0x43140000 >> 16) # 148.0
  /* 1891EC 80132E1C 44812000 */      mtc1 $at, $f4 # 148.0 to cop1
  /* 1891F0 80132E20 3C014350 */       lui $at, (0x43500000 >> 16) # 208.0
  /* 1891F4 80132E24 44813000 */      mtc1 $at, $f6 # 208.0 to cop1
  /* 1891F8 80132E28 24180001 */     addiu $t8, $zero, 1
  /* 1891FC 80132E2C 24190073 */     addiu $t9, $zero, 0x73
  /* 189200 80132E30 2408006B */     addiu $t0, $zero, 0x6b
  /* 189204 80132E34 24090059 */     addiu $t1, $zero, 0x59
  /* 189208 80132E38 A4580024 */        sh $t8, 0x24($v0)
  /* 18920C 80132E3C A0590028 */        sb $t9, 0x28($v0)
  /* 189210 80132E40 A0480029 */        sb $t0, 0x29($v0)
  /* 189214 80132E44 A049002A */        sb $t1, 0x2a($v0)
  /* 189218 80132E48 E4440058 */      swc1 $f4, 0x58($v0)
  /* 18921C 80132E4C E446005C */      swc1 $f6, 0x5c($v0)
  /* 189220 80132E50 8FBF0014 */        lw $ra, 0x14($sp)
  /* 189224 80132E54 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189228 80132E58 03E00008 */        jr $ra
  /* 18922C 80132E5C 00000000 */       nop 

glabel mnSoundTestMakeBFunctionSObj
  /* 189230 80132E60 3C0E8013 */       lui $t6, %hi(D_ovl62_80134478)
  /* 189234 80132E64 8DCE4478 */        lw $t6, %lo(D_ovl62_80134478)($t6)
  /* 189238 80132E68 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 18923C 80132E6C 3C0F0000 */       lui $t7, %hi(D_NF_00001208)
  /* 189240 80132E70 AFBF0014 */        sw $ra, 0x14($sp)
  /* 189244 80132E74 25EF1208 */     addiu $t7, $t7, %lo(D_NF_00001208)
  /* 189248 80132E78 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 18924C 80132E7C 01CF2821 */      addu $a1, $t6, $t7
  /* 189250 80132E80 3C01436B */       lui $at, (0x436B0000 >> 16) # 235.0
  /* 189254 80132E84 44812000 */      mtc1 $at, $f4 # 235.0 to cop1
  /* 189258 80132E88 3C014350 */       lui $at, (0x43500000 >> 16) # 208.0
  /* 18925C 80132E8C 44813000 */      mtc1 $at, $f6 # 208.0 to cop1
  /* 189260 80132E90 24180001 */     addiu $t8, $zero, 1
  /* 189264 80132E94 24190073 */     addiu $t9, $zero, 0x73
  /* 189268 80132E98 2408006B */     addiu $t0, $zero, 0x6b
  /* 18926C 80132E9C 24090059 */     addiu $t1, $zero, 0x59
  /* 189270 80132EA0 A4580024 */        sh $t8, 0x24($v0)
  /* 189274 80132EA4 A0590028 */        sb $t9, 0x28($v0)
  /* 189278 80132EA8 A0480029 */        sb $t0, 0x29($v0)
  /* 18927C 80132EAC A049002A */        sb $t1, 0x2a($v0)
  /* 189280 80132EB0 E4440058 */      swc1 $f4, 0x58($v0)
  /* 189284 80132EB4 E446005C */      swc1 $f6, 0x5c($v0)
  /* 189288 80132EB8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 18928C 80132EBC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189290 80132EC0 03E00008 */        jr $ra
  /* 189294 80132EC4 00000000 */       nop 

glabel mnSoundTestMakeButtonSObjs
  /* 189298 80132EC8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 18929C 80132ECC AFBF0024 */        sw $ra, 0x24($sp)
  /* 1892A0 80132ED0 AFB00020 */        sw $s0, 0x20($sp)
  /* 1892A4 80132ED4 24040001 */     addiu $a0, $zero, 1
  /* 1892A8 80132ED8 00002825 */        or $a1, $zero, $zero
  /* 1892AC 80132EDC 24060003 */     addiu $a2, $zero, 3
  /* 1892B0 80132EE0 0C00265A */       jal omMakeGObjSPAfter
  /* 1892B4 80132EE4 3C078000 */       lui $a3, 0x8000
  /* 1892B8 80132EE8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1892BC 80132EEC 240EFFFF */     addiu $t6, $zero, -1
  /* 1892C0 80132EF0 00408025 */        or $s0, $v0, $zero
  /* 1892C4 80132EF4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1892C8 80132EF8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1892CC 80132EFC 00402025 */        or $a0, $v0, $zero
  /* 1892D0 80132F00 24060001 */     addiu $a2, $zero, 1
  /* 1892D4 80132F04 0C00277D */       jal omAddGObjRenderProc
  /* 1892D8 80132F08 3C078000 */       lui $a3, 0x8000
  /* 1892DC 80132F0C 0C04CB04 */       jal mnSoundTestMakeAButtonSObj
  /* 1892E0 80132F10 02002025 */        or $a0, $s0, $zero
  /* 1892E4 80132F14 0C04CB24 */       jal mnSoundTestMakeBButtonSObj
  /* 1892E8 80132F18 02002025 */        or $a0, $s0, $zero
  /* 1892EC 80132F1C 0C04CB44 */       jal mnSoundTestMakeStartButtonSObj
  /* 1892F0 80132F20 02002025 */        or $a0, $s0, $zero
  /* 1892F4 80132F24 0C04CB64 */       jal mnSoundTestMakeAFunctionSObj
  /* 1892F8 80132F28 02002025 */        or $a0, $s0, $zero
  /* 1892FC 80132F2C 0C04CB7E */       jal mnSoundTestMakeStartFunctionSObj
  /* 189300 80132F30 02002025 */        or $a0, $s0, $zero
  /* 189304 80132F34 0C04CB98 */       jal mnSoundTestMakeBFunctionSObj
  /* 189308 80132F38 02002025 */        or $a0, $s0, $zero
  /* 18930C 80132F3C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 189310 80132F40 8FB00020 */        lw $s0, 0x20($sp)
  /* 189314 80132F44 27BD0028 */     addiu $sp, $sp, 0x28
  /* 189318 80132F48 03E00008 */        jr $ra
  /* 18931C 80132F4C 00000000 */       nop 

glabel mnSoundTestMakeNumberSObj
  /* 189320 80132F50 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 189324 80132F54 F7B80020 */      sdc1 $f24, 0x20($sp)
  /* 189328 80132F58 3C014286 */       lui $at, (0x42860000 >> 16) # 67.0
  /* 18932C 80132F5C 4481C000 */      mtc1 $at, $f24 # 67.0 to cop1
  /* 189330 80132F60 F7B60018 */      sdc1 $f22, 0x18($sp)
  /* 189334 80132F64 3C0142E6 */       lui $at, (0x42E60000 >> 16) # 115.0
  /* 189338 80132F68 4481B000 */      mtc1 $at, $f22 # 115.0 to cop1
  /* 18933C 80132F6C AFB30038 */        sw $s3, 0x38($sp)
  /* 189340 80132F70 AFB20034 */        sw $s2, 0x34($sp)
  /* 189344 80132F74 F7B40010 */      sdc1 $f20, 0x10($sp)
  /* 189348 80132F78 3C014323 */       lui $at, (0x43230000 >> 16) # 163.0
  /* 18934C 80132F7C AFB70048 */        sw $s7, 0x48($sp)
  /* 189350 80132F80 AFB60044 */        sw $s6, 0x44($sp)
  /* 189354 80132F84 AFB50040 */        sw $s5, 0x40($sp)
  /* 189358 80132F88 AFB4003C */        sw $s4, 0x3c($sp)
  /* 18935C 80132F8C AFB10030 */        sw $s1, 0x30($sp)
  /* 189360 80132F90 AFB0002C */        sw $s0, 0x2c($sp)
  /* 189364 80132F94 3C128013 */       lui $s2, %hi(dMNSoundTestDigitSpriteOffsets)
  /* 189368 80132F98 3C138013 */       lui $s3, %hi(sMNSoundTestFiles)
  /* 18936C 80132F9C 4481A000 */      mtc1 $at, $f20 # 163.0 to cop1
  /* 189370 80132FA0 00808825 */        or $s1, $a0, $zero
  /* 189374 80132FA4 AFBF004C */        sw $ra, 0x4c($sp)
  /* 189378 80132FA8 26734468 */     addiu $s3, $s3, %lo(sMNSoundTestFiles)
  /* 18937C 80132FAC 265241A4 */     addiu $s2, $s2, %lo(dMNSoundTestDigitSpriteOffsets)
  /* 189380 80132FB0 00008025 */        or $s0, $zero, $zero
  /* 189384 80132FB4 24140004 */     addiu $s4, $zero, 4
  /* 189388 80132FB8 24150001 */     addiu $s5, $zero, 1
  /* 18938C 80132FBC 24160002 */     addiu $s6, $zero, 2
  /* 189390 80132FC0 24170003 */     addiu $s7, $zero, 3
  /* 189394 80132FC4 8E4E0000 */        lw $t6, ($s2) # dMNSoundTestDigitSpriteOffsets + 0
  .L80132FC8:
  /* 189398 80132FC8 8E6F0004 */        lw $t7, 4($s3) # sMNSoundTestFiles + 4
  /* 18939C 80132FCC 02202025 */        or $a0, $s1, $zero
  /* 1893A0 80132FD0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1893A4 80132FD4 01CF2821 */      addu $a1, $t6, $t7
  /* 1893A8 80132FD8 A4540024 */        sh $s4, 0x24($v0)
  /* 1893AC 80132FDC 8E230084 */        lw $v1, 0x84($s1)
  /* 1893B0 80132FE0 26100001 */     addiu $s0, $s0, 1
  /* 1893B4 80132FE4 10600007 */      beqz $v1, .L80133004
  /* 1893B8 80132FE8 00000000 */       nop 
  /* 1893BC 80132FEC 10750007 */       beq $v1, $s5, .L8013300C
  /* 1893C0 80132FF0 00000000 */       nop 
  /* 1893C4 80132FF4 50760008 */      beql $v1, $s6, .L80133018
  /* 1893C8 80132FF8 E454005C */      swc1 $f20, 0x5c($v0)
  /* 1893CC 80132FFC 10000006 */         b .L80133018
  /* 1893D0 80133000 00000000 */       nop 
  .L80133004:
  /* 1893D4 80133004 10000004 */         b .L80133018
  /* 1893D8 80133008 E458005C */      swc1 $f24, 0x5c($v0)
  .L8013300C:
  /* 1893DC 8013300C 10000002 */         b .L80133018
  /* 1893E0 80133010 E456005C */      swc1 $f22, 0x5c($v0)
  /* 1893E4 80133014 E454005C */      swc1 $f20, 0x5c($v0)
  .L80133018:
  /* 1893E8 80133018 5617FFEB */      bnel $s0, $s7, .L80132FC8
  /* 1893EC 8013301C 8E4E0000 */        lw $t6, ($s2) # dMNSoundTestDigitSpriteOffsets + 0
  /* 1893F0 80133020 8FBF004C */        lw $ra, 0x4c($sp)
  /* 1893F4 80133024 D7B40010 */      ldc1 $f20, 0x10($sp)
  /* 1893F8 80133028 D7B60018 */      ldc1 $f22, 0x18($sp)
  /* 1893FC 8013302C D7B80020 */      ldc1 $f24, 0x20($sp)
  /* 189400 80133030 8FB0002C */        lw $s0, 0x2c($sp)
  /* 189404 80133034 8FB10030 */        lw $s1, 0x30($sp)
  /* 189408 80133038 8FB20034 */        lw $s2, 0x34($sp)
  /* 18940C 8013303C 8FB30038 */        lw $s3, 0x38($sp)
  /* 189410 80133040 8FB4003C */        lw $s4, 0x3c($sp)
  /* 189414 80133044 8FB50040 */        lw $s5, 0x40($sp)
  /* 189418 80133048 8FB60044 */        lw $s6, 0x44($sp)
  /* 18941C 8013304C 8FB70048 */        lw $s7, 0x48($sp)
  /* 189420 80133050 03E00008 */        jr $ra
  /* 189424 80133054 27BD0050 */     addiu $sp, $sp, 0x50

glabel mnSoundTestUpdateNumberPositions
  /* 189428 80133058 44856000 */      mtc1 $a1, $f12
  /* 18942C 8013305C 8C850074 */        lw $a1, 0x74($a0)
  /* 189430 80133060 44800000 */      mtc1 $zero, $f0
  /* 189434 80133064 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 189438 80133068 8C820084 */        lw $v0, 0x84($a0)
  /* 18943C 8013306C 10A0000C */      beqz $a1, .L801330A0
  /* 189440 80133070 00A01825 */        or $v1, $a1, $zero
  /* 189444 80133074 946E0024 */       lhu $t6, 0x24($v1)
  /* 189448 80133078 24060004 */     addiu $a2, $zero, 4
  /* 18944C 8013307C 50CE0009 */      beql $a2, $t6, .L801330A4
  /* 189450 80133080 8FA30000 */        lw $v1, ($sp)
  /* 189454 80133084 AFA30000 */        sw $v1, ($sp)
  .L80133088:
  /* 189458 80133088 8C630008 */        lw $v1, 8($v1)
  /* 18945C 8013308C 50600005 */      beql $v1, $zero, .L801330A4
  /* 189460 80133090 8FA30000 */        lw $v1, ($sp)
  /* 189464 80133094 946F0024 */       lhu $t7, 0x24($v1)
  /* 189468 80133098 54CFFFFB */      bnel $a2, $t7, .L80133088
  /* 18946C 8013309C AFA30000 */        sw $v1, ($sp)
  .L801330A0:
  /* 189470 801330A0 8FA30000 */        lw $v1, ($sp)
  .L801330A4:
  /* 189474 801330A4 3C013F00 */       lui $at, (0x3F000000 >> 16) # 0.5
  /* 189478 801330A8 44815000 */      mtc1 $at, $f10 # 0.5 to cop1
  /* 18947C 801330AC 1060000B */      beqz $v1, .L801330DC
  /* 189480 801330B0 24060004 */     addiu $a2, $zero, 4
  .L801330B4:
  /* 189484 801330B4 4600018D */ trunc.w.s $f6, $f0
  /* 189488 801330B8 8C790054 */        lw $t9, 0x54($v1)
  /* 18948C 801330BC 44992000 */      mtc1 $t9, $f4
  /* 189490 801330C0 44093000 */      mfc1 $t1, $f6
  /* 189494 801330C4 468020A0 */   cvt.s.w $f2, $f4
  /* 189498 801330C8 AC690054 */        sw $t1, 0x54($v1)
  /* 18949C 801330CC 8C63000C */        lw $v1, 0xc($v1)
  /* 1894A0 801330D0 1460FFF8 */      bnez $v1, .L801330B4
  /* 1894A4 801330D4 46020000 */     add.s $f0, $f0, $f2
  /* 1894A8 801330D8 8C850074 */        lw $a1, 0x74($a0)
  .L801330DC:
  /* 1894AC 801330DC 460A6102 */     mul.s $f4, $f12, $f10
  /* 1894B0 801330E0 3C0B8013 */       lui $t3, %hi(sMNSoundTestSelectIDPositionsX)
  /* 1894B4 801330E4 256B4358 */     addiu $t3, $t3, %lo(sMNSoundTestSelectIDPositionsX)
  /* 1894B8 801330E8 00025080 */       sll $t2, $v0, 2
  /* 1894BC 801330EC 014B2021 */      addu $a0, $t2, $t3
  /* 1894C0 801330F0 C4880000 */      lwc1 $f8, ($a0)
  /* 1894C4 801330F4 00A01825 */        or $v1, $a1, $zero
  /* 1894C8 801330F8 10A00024 */      beqz $a1, .L8013318C
  /* 1894CC 801330FC 46044001 */     sub.s $f0, $f8, $f4
  /* 1894D0 80133100 94AC0024 */       lhu $t4, 0x24($a1)
  /* 1894D4 80133104 3C058013 */       lui $a1, %hi(D_ovl62_8013435C)
  /* 1894D8 80133108 24A5435C */     addiu $a1, $a1, %lo(D_ovl62_8013435C)
  /* 1894DC 8013310C 10CC001F */       beq $a2, $t4, .L8013318C
  /* 1894E0 80133110 3C014352 */       lui $at, (0x43520000 >> 16) # 210.0
  /* 1894E4 80133114 44819000 */      mtc1 $at, $f18 # 210.0 to cop1
  /* 1894E8 80133118 3C01433E */       lui $at, (0x433E0000 >> 16) # 190.0
  /* 1894EC 8013311C 44818000 */      mtc1 $at, $f16 # 190.0 to cop1
  /* 1894F0 80133120 3C01432B */       lui $at, (0x432B0000 >> 16) # 171.0
  /* 1894F4 80133124 3C028013 */       lui $v0, %hi(sMNSoundTestSelectIDPositionsX)
  /* 1894F8 80133128 44817000 */      mtc1 $at, $f14 # 171.0 to cop1
  /* 1894FC 8013312C 24424358 */     addiu $v0, $v0, %lo(sMNSoundTestSelectIDPositionsX)
  .L80133130:
  /* 189500 80133130 14820003 */       bne $a0, $v0, .L80133140
  /* 189504 80133134 00000000 */       nop 
  /* 189508 80133138 10000007 */         b .L80133158
  /* 18950C 8013313C 46007086 */     mov.s $f2, $f14
  .L80133140:
  /* 189510 80133140 54850004 */      bnel $a0, $a1, .L80133154
  /* 189514 80133144 46009306 */     mov.s $f12, $f18
  /* 189518 80133148 10000002 */         b .L80133154
  /* 18951C 8013314C 46008306 */     mov.s $f12, $f16
  /* 189520 80133150 46009306 */     mov.s $f12, $f18
  .L80133154:
  /* 189524 80133154 46006086 */     mov.s $f2, $f12
  .L80133158:
  /* 189528 80133158 8C6D0054 */        lw $t5, 0x54($v1)
  /* 18952C 8013315C 448D3000 */      mtc1 $t5, $f6
  /* 189530 80133160 00000000 */       nop 
  /* 189534 80133164 468032A0 */   cvt.s.w $f10, $f6
  /* 189538 80133168 460A0200 */     add.s $f8, $f0, $f10
  /* 18953C 8013316C 46081100 */     add.s $f4, $f2, $f8
  /* 189540 80133170 E4640058 */      swc1 $f4, 0x58($v1)
  /* 189544 80133174 8C630008 */        lw $v1, 8($v1)
  /* 189548 80133178 10600004 */      beqz $v1, .L8013318C
  /* 18954C 8013317C 00000000 */       nop 
  /* 189550 80133180 946E0024 */       lhu $t6, 0x24($v1)
  /* 189554 80133184 14CEFFEA */       bne $a2, $t6, .L80133130
  /* 189558 80133188 00000000 */       nop 
  .L8013318C:
  /* 18955C 8013318C 03E00008 */        jr $ra
  /* 189560 80133190 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnSoundTestUpdateNumberSprites
  /* 189564 80133194 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 189568 80133198 AFBF0014 */        sw $ra, 0x14($sp)
  /* 18956C 8013319C AFA40018 */        sw $a0, 0x18($sp)
  /* 189570 801331A0 8C830084 */        lw $v1, 0x84($a0)
  /* 189574 801331A4 3C058013 */       lui $a1, %hi(sMNSoundTestOptionSelectID)
  /* 189578 801331A8 8C820074 */        lw $v0, 0x74($a0)
  /* 18957C 801331AC 00037880 */       sll $t7, $v1, 2
  /* 189580 801331B0 00AF2821 */      addu $a1, $a1, $t7
  /* 189584 801331B4 8CA54348 */        lw $a1, %lo(sMNSoundTestOptionSelectID)($a1)
  /* 189588 801331B8 44800000 */      mtc1 $zero, $f0
  /* 18958C 801331BC 00807025 */        or $t6, $a0, $zero
  /* 189590 801331C0 10400008 */      beqz $v0, .L801331E4
  /* 189594 801331C4 24A50001 */     addiu $a1, $a1, 1
  /* 189598 801331C8 24030004 */     addiu $v1, $zero, 4
  /* 18959C 801331CC A4430024 */        sh $v1, 0x24($v0)
  .L801331D0:
  /* 1895A0 801331D0 8C420008 */        lw $v0, 8($v0)
  /* 1895A4 801331D4 5440FFFE */      bnel $v0, $zero, .L801331D0
  /* 1895A8 801331D8 A4430024 */        sh $v1, 0x24($v0)
  /* 1895AC 801331DC 8FB80018 */        lw $t8, 0x18($sp)
  /* 1895B0 801331E0 8F020074 */        lw $v0, 0x74($t8)
  .L801331E4:
  /* 1895B4 801331E4 3C018013 */       lui $at, %hi(D_ovl62_801342F0)
  /* 1895B8 801331E8 3C088013 */       lui $t0, %hi(dMNSoundTestDigitSpriteWidths)
  /* 1895BC 801331EC 3C078013 */       lui $a3, %hi(sMNSoundTestFiles)
  /* 1895C0 801331F0 3C048013 */       lui $a0, %hi(dMNSoundTestDigitSpriteOffsets)
  /* 1895C4 801331F4 248441A4 */     addiu $a0, $a0, %lo(dMNSoundTestDigitSpriteOffsets)
  /* 1895C8 801331F8 24E74468 */     addiu $a3, $a3, %lo(sMNSoundTestFiles)
  /* 1895CC 801331FC 250841CC */     addiu $t0, $t0, %lo(dMNSoundTestDigitSpriteWidths)
  /* 1895D0 80133200 C42242F0 */      lwc1 $f2, %lo(D_ovl62_801342F0)($at)
  /* 1895D4 80133204 240A00FF */     addiu $t2, $zero, 0xff
  /* 1895D8 80133208 24090001 */     addiu $t1, $zero, 1
  /* 1895DC 8013320C 2406000A */     addiu $a2, $zero, 0xa
  .L80133210:
  /* 1895E0 80133210 00A6001A */       div $zero, $a1, $a2
  /* 1895E4 80133214 00001810 */      mfhi $v1
  /* 1895E8 80133218 00031880 */       sll $v1, $v1, 2
  /* 1895EC 8013321C 0083C821 */      addu $t9, $a0, $v1
  /* 1895F0 80133220 8F2B0000 */        lw $t3, ($t9)
  /* 1895F4 80133224 8CEC0004 */        lw $t4, 4($a3) # sMNSoundTestFiles + 4
  /* 1895F8 80133228 14C00002 */      bnez $a2, .L80133234
  /* 1895FC 8013322C 00000000 */       nop 
  /* 189600 80133230 0007000D */     break 7
  .L80133234:
  /* 189604 80133234 2401FFFF */     addiu $at, $zero, -1
  /* 189608 80133238 14C10004 */       bne $a2, $at, .L8013324C
  /* 18960C 8013323C 3C018000 */       lui $at, 0x8000
  /* 189610 80133240 14A10002 */       bne $a1, $at, .L8013324C
  /* 189614 80133244 00000000 */       nop 
  /* 189618 80133248 0006000D */     break 6
  .L8013324C:
  /* 18961C 8013324C 016C6821 */      addu $t5, $t3, $t4
  /* 189620 80133250 25B9003C */     addiu $t9, $t5, 0x3c
  /* 189624 80133254 0040C025 */        or $t8, $v0, $zero
  .L80133258:
  /* 189628 80133258 8DAF0000 */        lw $t7, ($t5)
  /* 18962C 8013325C 25AD000C */     addiu $t5, $t5, 0xc
  /* 189630 80133260 2718000C */     addiu $t8, $t8, 0xc
  /* 189634 80133264 AF0F0004 */        sw $t7, 4($t8)
  /* 189638 80133268 8DAEFFF8 */        lw $t6, -8($t5)
  /* 18963C 8013326C AF0E0008 */        sw $t6, 8($t8)
  /* 189640 80133270 8DAFFFFC */        lw $t7, -4($t5)
  /* 189644 80133274 15B9FFF8 */       bne $t5, $t9, .L80133258
  /* 189648 80133278 AF0F000C */        sw $t7, 0xc($t8)
  /* 18964C 8013327C 44854000 */      mtc1 $a1, $f8
  /* 189650 80133280 8DAF0000 */        lw $t7, ($t5)
  /* 189654 80133284 01035821 */      addu $t3, $t0, $v1
  /* 189658 80133288 468042A0 */   cvt.s.w $f10, $f8
  /* 18965C 8013328C AF0F0010 */        sw $t7, 0x10($t8)
  /* 189660 80133290 8DAE0004 */        lw $t6, 4($t5)
  /* 189664 80133294 AF0E0014 */        sw $t6, 0x14($t8)
  /* 189668 80133298 46025402 */     mul.s $f16, $f10, $f2
  /* 18966C 8013329C 8D6C0000 */        lw $t4, ($t3)
  /* 189670 801332A0 A4490024 */        sh $t1, 0x24($v0)
  /* 189674 801332A4 A04A0028 */        sb $t2, 0x28($v0)
  /* 189678 801332A8 0180C825 */        or $t9, $t4, $zero
  /* 18967C 801332AC 44992000 */      mtc1 $t9, $f4
  /* 189680 801332B0 A0400029 */        sb $zero, 0x29($v0)
  /* 189684 801332B4 4600848D */ trunc.w.s $f18, $f16
  /* 189688 801332B8 A040002A */        sb $zero, 0x2a($v0)
  /* 18968C 801332BC A0400060 */        sb $zero, 0x60($v0)
  /* 189690 801332C0 468021A0 */   cvt.s.w $f6, $f4
  /* 189694 801332C4 44059000 */      mfc1 $a1, $f18
  /* 189698 801332C8 A0400061 */        sb $zero, 0x61($v0)
  /* 18969C 801332CC A0400062 */        sb $zero, 0x62($v0)
  /* 1896A0 801332D0 AC4C0054 */        sw $t4, 0x54($v0)
  /* 1896A4 801332D4 10A00002 */      beqz $a1, .L801332E0
  /* 1896A8 801332D8 46060000 */     add.s $f0, $f0, $f6
  /* 1896AC 801332DC 8C420008 */        lw $v0, 8($v0)
  .L801332E0:
  /* 1896B0 801332E0 14A0FFCB */      bnez $a1, .L80133210
  /* 1896B4 801332E4 00000000 */       nop 
  /* 1896B8 801332E8 44050000 */      mfc1 $a1, $f0
  /* 1896BC 801332EC 0C04CC16 */       jal mnSoundTestUpdateNumberPositions
  /* 1896C0 801332F0 8FA40018 */        lw $a0, 0x18($sp)
  /* 1896C4 801332F4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1896C8 801332F8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1896CC 801332FC 03E00008 */        jr $ra
  /* 1896D0 80133300 00000000 */       nop 

glabel mnSoundTestSelectIDProcUpdate
  /* 1896D4 80133304 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1896D8 80133308 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1896DC 8013330C AFB20020 */        sw $s2, 0x20($sp)
  /* 1896E0 80133310 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1896E4 80133314 AFB00018 */        sw $s0, 0x18($sp)
  /* 1896E8 80133318 8C8E0084 */        lw $t6, 0x84($a0)
  /* 1896EC 8013331C 00808825 */        or $s1, $a0, $zero
  /* 1896F0 80133320 2410FFFF */     addiu $s0, $zero, -1
  /* 1896F4 80133324 0C04CBD4 */       jal mnSoundTestMakeNumberSObj
  /* 1896F8 80133328 AFAE002C */        sw $t6, 0x2c($sp)
  /* 1896FC 8013332C 8FAF002C */        lw $t7, 0x2c($sp)
  /* 189700 80133330 3C198013 */       lui $t9, %hi(sMNSoundTestOptionSelectID)
  /* 189704 80133334 27394348 */     addiu $t9, $t9, %lo(sMNSoundTestOptionSelectID)
  /* 189708 80133338 000FC080 */       sll $t8, $t7, 2
  /* 18970C 8013333C 03199021 */      addu $s2, $t8, $t9
  /* 189710 80133340 8E420000 */        lw $v0, ($s2)
  .L80133344:
  /* 189714 80133344 02202025 */        or $a0, $s1, $zero
  /* 189718 80133348 12020003 */       beq $s0, $v0, .L80133358
  /* 18971C 8013334C 00000000 */       nop 
  /* 189720 80133350 0C04CC65 */       jal mnSoundTestUpdateNumberSprites
  /* 189724 80133354 00408025 */        or $s0, $v0, $zero
  .L80133358:
  /* 189728 80133358 0C002C7A */       jal gsStopCurrentProcess
  /* 18972C 8013335C 24040001 */     addiu $a0, $zero, 1
  /* 189730 80133360 1000FFF8 */         b .L80133344
  /* 189734 80133364 8E420000 */        lw $v0, ($s2)
  /* 189738 80133368 00000000 */       nop 
  /* 18973C 8013336C 00000000 */       nop 
# Maybe start of new file
  /* 189740 80133370 00000000 */       nop 
  /* 189744 80133374 00000000 */       nop 
  /* 189748 80133378 00000000 */       nop 
  /* 18974C 8013337C 00000000 */       nop 
# Maybe start of new file
  /* 189750 80133380 8FBF0024 */        lw $ra, 0x24($sp)
  /* 189754 80133384 8FB00018 */        lw $s0, 0x18($sp)
  /* 189758 80133388 8FB1001C */        lw $s1, 0x1c($sp)
  /* 18975C 8013338C 8FB20020 */        lw $s2, 0x20($sp)
  /* 189760 80133390 03E00008 */        jr $ra
  /* 189764 80133394 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnSoundTestMakeSelectIDGObjs
  /* 189768 80133398 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 18976C 8013339C AFB10020 */        sw $s1, 0x20($sp)
  /* 189770 801333A0 3C118000 */       lui $s1, 0x8000
  /* 189774 801333A4 AFBF0024 */        sw $ra, 0x24($sp)
  /* 189778 801333A8 AFB0001C */        sw $s0, 0x1c($sp)
  /* 18977C 801333AC 02203825 */        or $a3, $s1, $zero
  /* 189780 801333B0 24040001 */     addiu $a0, $zero, 1
  /* 189784 801333B4 00002825 */        or $a1, $zero, $zero
  /* 189788 801333B8 0C00265A */       jal omMakeGObjSPAfter
  /* 18978C 801333BC 24060005 */     addiu $a2, $zero, 5
  /* 189790 801333C0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 189794 801333C4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 189798 801333C8 240EFFFF */     addiu $t6, $zero, -1
  /* 18979C 801333CC 00408025 */        or $s0, $v0, $zero
  /* 1897A0 801333D0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1897A4 801333D4 AFA50030 */        sw $a1, 0x30($sp)
  /* 1897A8 801333D8 00402025 */        or $a0, $v0, $zero
  /* 1897AC 801333DC 24060001 */     addiu $a2, $zero, 1
  /* 1897B0 801333E0 0C00277D */       jal omAddGObjRenderProc
  /* 1897B4 801333E4 02203825 */        or $a3, $s1, $zero
  /* 1897B8 801333E8 3C058013 */       lui $a1, %hi(mnSoundTestSelectIDProcUpdate)
  /* 1897BC 801333EC 24A53304 */     addiu $a1, $a1, %lo(mnSoundTestSelectIDProcUpdate)
  /* 1897C0 801333F0 AFA5002C */        sw $a1, 0x2c($sp)
  /* 1897C4 801333F4 02002025 */        or $a0, $s0, $zero
  /* 1897C8 801333F8 00003025 */        or $a2, $zero, $zero
  /* 1897CC 801333FC 0C002062 */       jal omAddGObjCommonProc
  /* 1897D0 80133400 24070001 */     addiu $a3, $zero, 1
  /* 1897D4 80133404 AE000084 */        sw $zero, 0x84($s0)
  /* 1897D8 80133408 24040001 */     addiu $a0, $zero, 1
  /* 1897DC 8013340C 00002825 */        or $a1, $zero, $zero
  /* 1897E0 80133410 24060006 */     addiu $a2, $zero, 6
  /* 1897E4 80133414 0C00265A */       jal omMakeGObjSPAfter
  /* 1897E8 80133418 02203825 */        or $a3, $s1, $zero
  /* 1897EC 8013341C 240FFFFF */     addiu $t7, $zero, -1
  /* 1897F0 80133420 00408025 */        or $s0, $v0, $zero
  /* 1897F4 80133424 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1897F8 80133428 00402025 */        or $a0, $v0, $zero
  /* 1897FC 8013342C 8FA50030 */        lw $a1, 0x30($sp)
  /* 189800 80133430 24060001 */     addiu $a2, $zero, 1
  /* 189804 80133434 0C00277D */       jal omAddGObjRenderProc
  /* 189808 80133438 02203825 */        or $a3, $s1, $zero
  /* 18980C 8013343C 02002025 */        or $a0, $s0, $zero
  /* 189810 80133440 8FA5002C */        lw $a1, 0x2c($sp)
  /* 189814 80133444 00003025 */        or $a2, $zero, $zero
  /* 189818 80133448 0C002062 */       jal omAddGObjCommonProc
  /* 18981C 8013344C 24070001 */     addiu $a3, $zero, 1
  /* 189820 80133450 24180001 */     addiu $t8, $zero, 1
  /* 189824 80133454 AE180084 */        sw $t8, 0x84($s0)
  /* 189828 80133458 24040001 */     addiu $a0, $zero, 1
  /* 18982C 8013345C 00002825 */        or $a1, $zero, $zero
  /* 189830 80133460 24060007 */     addiu $a2, $zero, 7
  /* 189834 80133464 0C00265A */       jal omMakeGObjSPAfter
  /* 189838 80133468 02203825 */        or $a3, $s1, $zero
  /* 18983C 8013346C 2419FFFF */     addiu $t9, $zero, -1
  /* 189840 80133470 00408025 */        or $s0, $v0, $zero
  /* 189844 80133474 AFB90010 */        sw $t9, 0x10($sp)
  /* 189848 80133478 00402025 */        or $a0, $v0, $zero
  /* 18984C 8013347C 8FA50030 */        lw $a1, 0x30($sp)
  /* 189850 80133480 24060001 */     addiu $a2, $zero, 1
  /* 189854 80133484 0C00277D */       jal omAddGObjRenderProc
  /* 189858 80133488 02203825 */        or $a3, $s1, $zero
  /* 18985C 8013348C 02002025 */        or $a0, $s0, $zero
  /* 189860 80133490 8FA5002C */        lw $a1, 0x2c($sp)
  /* 189864 80133494 00003025 */        or $a2, $zero, $zero
  /* 189868 80133498 0C002062 */       jal omAddGObjCommonProc
  /* 18986C 8013349C 24070001 */     addiu $a3, $zero, 1
  /* 189870 801334A0 24080002 */     addiu $t0, $zero, 2
  /* 189874 801334A4 AE080084 */        sw $t0, 0x84($s0)
  /* 189878 801334A8 8FBF0024 */        lw $ra, 0x24($sp)
  /* 18987C 801334AC 8FB10020 */        lw $s1, 0x20($sp)
  /* 189880 801334B0 8FB0001C */        lw $s0, 0x1c($sp)
  /* 189884 801334B4 03E00008 */        jr $ra
  /* 189888 801334B8 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnSoundTestArrowsProcUpdate
  /* 18988C 801334BC 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 189890 801334C0 AFB40028 */        sw $s4, 0x28($sp)
  /* 189894 801334C4 3C148013 */       lui $s4, %hi(sMNSoundTestOption)
  /* 189898 801334C8 26944308 */     addiu $s4, $s4, %lo(sMNSoundTestOption)
  /* 18989C 801334CC 8E820000 */        lw $v0, ($s4) # sMNSoundTestOption + 0
  /* 1898A0 801334D0 AFB60030 */        sw $s6, 0x30($sp)
  /* 1898A4 801334D4 AFB5002C */        sw $s5, 0x2c($sp)
  /* 1898A8 801334D8 AFB30024 */        sw $s3, 0x24($sp)
  /* 1898AC 801334DC AFB20020 */        sw $s2, 0x20($sp)
  /* 1898B0 801334E0 AFB00018 */        sw $s0, 0x18($sp)
  /* 1898B4 801334E4 AFBF0034 */        sw $ra, 0x34($sp)
  /* 1898B8 801334E8 AFB1001C */        sw $s1, 0x1c($sp)
  /* 1898BC 801334EC 3C168013 */       lui $s6, %hi(dMNSoundTestArrowSpritePositions)
  /* 1898C0 801334F0 00809025 */        or $s2, $a0, $zero
  /* 1898C4 801334F4 8C910074 */        lw $s1, 0x74($a0)
  /* 1898C8 801334F8 2410001E */     addiu $s0, $zero, 0x1e
  /* 1898CC 801334FC 26D64180 */     addiu $s6, $s6, %lo(dMNSoundTestArrowSpritePositions)
  /* 1898D0 80133500 24150003 */     addiu $s5, $zero, 3
  /* 1898D4 80133504 00409825 */        or $s3, $v0, $zero
  .L80133508:
  /* 1898D8 80133508 12620004 */       beq $s3, $v0, .L8013351C
  /* 1898DC 8013350C 00000000 */       nop 
  /* 1898E0 80133510 00409825 */        or $s3, $v0, $zero
  /* 1898E4 80133514 2410001E */     addiu $s0, $zero, 0x1e
  /* 1898E8 80133518 AE40007C */        sw $zero, 0x7c($s2)
  .L8013351C:
  /* 1898EC 8013351C 56000006 */      bnel $s0, $zero, .L80133538
  /* 1898F0 80133520 8E980000 */        lw $t8, ($s4) # sMNSoundTestOption + 0
  /* 1898F4 80133524 8E4E007C */        lw $t6, 0x7c($s2)
  /* 1898F8 80133528 2410001E */     addiu $s0, $zero, 0x1e
  /* 1898FC 8013352C 39CF0001 */      xori $t7, $t6, 1
  /* 189900 80133530 AE4F007C */        sw $t7, 0x7c($s2)
  /* 189904 80133534 8E980000 */        lw $t8, ($s4) # sMNSoundTestOption + 0
  .L80133538:
  /* 189908 80133538 8E280008 */        lw $t0, 8($s1)
  /* 18990C 8013353C 2610FFFF */     addiu $s0, $s0, -1
  /* 189910 80133540 03150019 */     multu $t8, $s5
  /* 189914 80133544 24040001 */     addiu $a0, $zero, 1
  /* 189918 80133548 00001812 */      mflo $v1
  /* 18991C 8013354C 0003C880 */       sll $t9, $v1, 2
  /* 189920 80133550 02D91021 */      addu $v0, $s6, $t9
  /* 189924 80133554 C4440000 */      lwc1 $f4, ($v0)
  /* 189928 80133558 E6240058 */      swc1 $f4, 0x58($s1)
  /* 18992C 8013355C C4460004 */      lwc1 $f6, 4($v0)
  /* 189930 80133560 E626005C */      swc1 $f6, 0x5c($s1)
  /* 189934 80133564 C4480008 */      lwc1 $f8, 8($v0)
  /* 189938 80133568 E5080058 */      swc1 $f8, 0x58($t0)
  /* 18993C 8013356C 8E290008 */        lw $t1, 8($s1)
  /* 189940 80133570 C44A0004 */      lwc1 $f10, 4($v0)
  /* 189944 80133574 0C002C7A */       jal gsStopCurrentProcess
  /* 189948 80133578 E52A005C */      swc1 $f10, 0x5c($t1)
  /* 18994C 8013357C 1000FFE2 */         b .L80133508
  /* 189950 80133580 8E820000 */        lw $v0, ($s4) # sMNSoundTestOption + 0
  /* 189954 80133584 00000000 */       nop 
  /* 189958 80133588 00000000 */       nop 
  /* 18995C 8013358C 00000000 */       nop 
# Maybe start of new file
  /* 189960 80133590 00000000 */       nop 
  /* 189964 80133594 00000000 */       nop 
  /* 189968 80133598 00000000 */       nop 
  /* 18996C 8013359C 00000000 */       nop 
# Maybe start of new file
  /* 189970 801335A0 8FBF0034 */        lw $ra, 0x34($sp)
  /* 189974 801335A4 8FB00018 */        lw $s0, 0x18($sp)
  /* 189978 801335A8 8FB1001C */        lw $s1, 0x1c($sp)
  /* 18997C 801335AC 8FB20020 */        lw $s2, 0x20($sp)
  /* 189980 801335B0 8FB30024 */        lw $s3, 0x24($sp)
  /* 189984 801335B4 8FB40028 */        lw $s4, 0x28($sp)
  /* 189988 801335B8 8FB5002C */        lw $s5, 0x2c($sp)
  /* 18998C 801335BC 8FB60030 */        lw $s6, 0x30($sp)
  /* 189990 801335C0 03E00008 */        jr $ra
  /* 189994 801335C4 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnSoundTestMakeArrowSObjs
  /* 189998 801335C8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 18999C 801335CC AFBF001C */        sw $ra, 0x1c($sp)
  /* 1899A0 801335D0 24040001 */     addiu $a0, $zero, 1
  /* 1899A4 801335D4 00002825 */        or $a1, $zero, $zero
  /* 1899A8 801335D8 24060002 */     addiu $a2, $zero, 2
  /* 1899AC 801335DC 0C00265A */       jal omMakeGObjSPAfter
  /* 1899B0 801335E0 3C078000 */       lui $a3, 0x8000
  /* 1899B4 801335E4 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1899B8 801335E8 240EFFFF */     addiu $t6, $zero, -1
  /* 1899BC 801335EC AFA20024 */        sw $v0, 0x24($sp)
  /* 1899C0 801335F0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1899C4 801335F4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1899C8 801335F8 00402025 */        or $a0, $v0, $zero
  /* 1899CC 801335FC 24060001 */     addiu $a2, $zero, 1
  /* 1899D0 80133600 0C00277D */       jal omAddGObjRenderProc
  /* 1899D4 80133604 3C078000 */       lui $a3, 0x8000
  /* 1899D8 80133608 3C058013 */       lui $a1, %hi(mnSoundTestArrowsProcUpdate)
  /* 1899DC 8013360C 24A534BC */     addiu $a1, $a1, %lo(mnSoundTestArrowsProcUpdate)
  /* 1899E0 80133610 8FA40024 */        lw $a0, 0x24($sp)
  /* 1899E4 80133614 00003025 */        or $a2, $zero, $zero
  /* 1899E8 80133618 0C002062 */       jal omAddGObjCommonProc
  /* 1899EC 8013361C 24070001 */     addiu $a3, $zero, 1
  /* 1899F0 80133620 3C0F8013 */       lui $t7, %hi(D_ovl62_80134474)
  /* 1899F4 80133624 8DEF4474 */        lw $t7, %lo(D_ovl62_80134474)($t7)
  /* 1899F8 80133628 3C180001 */       lui $t8, %hi(D_NF_0000DE30)
  /* 1899FC 8013362C 2718DE30 */     addiu $t8, $t8, %lo(D_NF_0000DE30)
  /* 189A00 80133630 8FA40024 */        lw $a0, 0x24($sp)
  /* 189A04 80133634 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 189A08 80133638 01F82821 */      addu $a1, $t7, $t8
  /* 189A0C 8013363C 3C038013 */       lui $v1, %hi(dMNSoundTestArrowSpritePositions)
  /* 189A10 80133640 24190001 */     addiu $t9, $zero, 1
  /* 189A14 80133644 24634180 */     addiu $v1, $v1, %lo(dMNSoundTestArrowSpritePositions)
  /* 189A18 80133648 A4590024 */        sh $t9, 0x24($v0)
  /* 189A1C 8013364C C4640000 */      lwc1 $f4, ($v1) # dMNSoundTestArrowSpritePositions + 0
  /* 189A20 80133650 240800FF */     addiu $t0, $zero, 0xff
  /* 189A24 80133654 240900C3 */     addiu $t1, $zero, 0xc3
  /* 189A28 80133658 E4440058 */      swc1 $f4, 0x58($v0)
  /* 189A2C 8013365C C4660004 */      lwc1 $f6, 4($v1) # dMNSoundTestArrowSpritePositions + 4
  /* 189A30 80133660 240A0026 */     addiu $t2, $zero, 0x26
  /* 189A34 80133664 A0480028 */        sb $t0, 0x28($v0)
  /* 189A38 80133668 A0490029 */        sb $t1, 0x29($v0)
  /* 189A3C 8013366C A04A002A */        sb $t2, 0x2a($v0)
  /* 189A40 80133670 3C0B8013 */       lui $t3, %hi(D_ovl62_80134474)
  /* 189A44 80133674 E446005C */      swc1 $f6, 0x5c($v0)
  /* 189A48 80133678 8D6B4474 */        lw $t3, %lo(D_ovl62_80134474)($t3)
  /* 189A4C 8013367C 3C0C0001 */       lui $t4, %hi(D_NF_0000DD90)
  /* 189A50 80133680 258CDD90 */     addiu $t4, $t4, %lo(D_NF_0000DD90)
  /* 189A54 80133684 8FA40024 */        lw $a0, 0x24($sp)
  /* 189A58 80133688 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 189A5C 8013368C 016C2821 */      addu $a1, $t3, $t4
  /* 189A60 80133690 3C038013 */       lui $v1, %hi(dMNSoundTestArrowSpritePositions)
  /* 189A64 80133694 240D0001 */     addiu $t5, $zero, 1
  /* 189A68 80133698 24634180 */     addiu $v1, $v1, %lo(dMNSoundTestArrowSpritePositions)
  /* 189A6C 8013369C A44D0024 */        sh $t5, 0x24($v0)
  /* 189A70 801336A0 C4680008 */      lwc1 $f8, 8($v1) # dMNSoundTestArrowSpritePositions + 8
  /* 189A74 801336A4 240E00FF */     addiu $t6, $zero, 0xff
  /* 189A78 801336A8 240F00C3 */     addiu $t7, $zero, 0xc3
  /* 189A7C 801336AC E4480058 */      swc1 $f8, 0x58($v0)
  /* 189A80 801336B0 C46A000C */      lwc1 $f10, 0xc($v1) # dMNSoundTestArrowSpritePositions + 12
  /* 189A84 801336B4 24180026 */     addiu $t8, $zero, 0x26
  /* 189A88 801336B8 A04E0028 */        sb $t6, 0x28($v0)
  /* 189A8C 801336BC A04F0029 */        sb $t7, 0x29($v0)
  /* 189A90 801336C0 A058002A */        sb $t8, 0x2a($v0)
  /* 189A94 801336C4 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 189A98 801336C8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 189A9C 801336CC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 189AA0 801336D0 03E00008 */        jr $ra
  /* 189AA4 801336D4 00000000 */       nop 

glabel mnSoundTestMakeAllSObjs
  /* 189AA8 801336D8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 189AAC 801336DC AFBF0014 */        sw $ra, 0x14($sp)
  /* 189AB0 801336E0 0C04C8D3 */       jal mnSoundTestMakeHeaderSObjs
  /* 189AB4 801336E4 00000000 */       nop 
  /* 189AB8 801336E8 0C04C98E */       jal mnSoundTestMakeMusicSObjs
  /* 189ABC 801336EC 00000000 */       nop 
  /* 189AC0 801336F0 0C04CA25 */       jal mnSoundTestMakeSoundSObjs
  /* 189AC4 801336F4 00000000 */       nop 
  /* 189AC8 801336F8 0C04CABD */       jal mnSoundTestMakeVoiceSObjs
  /* 189ACC 801336FC 00000000 */       nop 
  /* 189AD0 80133700 0C04CCE6 */       jal mnSoundTestMakeSelectIDGObjs
  /* 189AD4 80133704 00000000 */       nop 
  /* 189AD8 80133708 0C04CD72 */       jal mnSoundTestMakeArrowSObjs
  /* 189ADC 8013370C 00000000 */       nop 
  /* 189AE0 80133710 0C04CBB2 */       jal mnSoundTestMakeButtonSObjs
  /* 189AE4 80133714 00000000 */       nop 
  /* 189AE8 80133718 8FBF0014 */        lw $ra, 0x14($sp)
  /* 189AEC 8013371C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189AF0 80133720 03E00008 */        jr $ra
  /* 189AF4 80133724 00000000 */       nop 

glabel func_ovl62_80133728
  /* 189AF8 80133728 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 189AFC 8013372C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 189B00 80133730 AFBF003C */        sw $ra, 0x3c($sp)
  /* 189B04 80133734 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 189B08 80133738 240F001E */     addiu $t7, $zero, 0x1e
  /* 189B0C 8013373C 24180000 */     addiu $t8, $zero, 0
  /* 189B10 80133740 24190002 */     addiu $t9, $zero, 2
  /* 189B14 80133744 2408FFFF */     addiu $t0, $zero, -1
  /* 189B18 80133748 24090001 */     addiu $t1, $zero, 1
  /* 189B1C 8013374C 240A0001 */     addiu $t2, $zero, 1
  /* 189B20 80133750 AFAA0030 */        sw $t2, 0x30($sp)
  /* 189B24 80133754 AFA90028 */        sw $t1, 0x28($sp)
  /* 189B28 80133758 AFA80020 */        sw $t0, 0x20($sp)
  /* 189B2C 8013375C AFB9001C */        sw $t9, 0x1c($sp)
  /* 189B30 80133760 AFB80018 */        sw $t8, 0x18($sp)
  /* 189B34 80133764 AFAF0014 */        sw $t7, 0x14($sp)
  /* 189B38 80133768 AFAE0010 */        sw $t6, 0x10($sp)
  /* 189B3C 8013376C AFA00024 */        sw $zero, 0x24($sp)
  /* 189B40 80133770 AFA0002C */        sw $zero, 0x2c($sp)
  /* 189B44 80133774 AFA00034 */        sw $zero, 0x34($sp)
  /* 189B48 80133778 24040002 */     addiu $a0, $zero, 2
  /* 189B4C 8013377C 00002825 */        or $a1, $zero, $zero
  /* 189B50 80133780 24060004 */     addiu $a2, $zero, 4
  /* 189B54 80133784 0C002E4F */       jal func_8000B93C
  /* 189B58 80133788 3C078000 */       lui $a3, 0x8000
  /* 189B5C 8013378C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 189B60 80133790 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 189B64 80133794 3C0143EB */       lui $at, (0x43EB0000 >> 16) # 470.0
  /* 189B68 80133798 8C430074 */        lw $v1, 0x74($v0)
  /* 189B6C 8013379C 44812000 */      mtc1 $at, $f4 # 470.0 to cop1
  /* 189B70 801337A0 3C07441D */       lui $a3, (0x441D8000 >> 16) # 1142784000
  /* 189B74 801337A4 44050000 */      mfc1 $a1, $f0
  /* 189B78 801337A8 44060000 */      mfc1 $a2, $f0
  /* 189B7C 801337AC 34E78000 */       ori $a3, $a3, (0x441D8000 & 0xFFFF) # 1142784000
  /* 189B80 801337B0 24640008 */     addiu $a0, $v1, 8
  /* 189B84 801337B4 0C001C20 */       jal func_80007080
  /* 189B88 801337B8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 189B8C 801337BC 3C0B8001 */       lui $t3, %hi(func_80017EC0)
  /* 189B90 801337C0 256B7EC0 */     addiu $t3, $t3, %lo(func_80017EC0)
  /* 189B94 801337C4 240C0032 */     addiu $t4, $zero, 0x32
  /* 189B98 801337C8 240E0000 */     addiu $t6, $zero, 0
  /* 189B9C 801337CC 240F0004 */     addiu $t7, $zero, 4
  /* 189BA0 801337D0 240DFFFF */     addiu $t5, $zero, -1
  /* 189BA4 801337D4 24180001 */     addiu $t8, $zero, 1
  /* 189BA8 801337D8 24190001 */     addiu $t9, $zero, 1
  /* 189BAC 801337DC AFB90030 */        sw $t9, 0x30($sp)
  /* 189BB0 801337E0 AFB80028 */        sw $t8, 0x28($sp)
  /* 189BB4 801337E4 AFAD0020 */        sw $t5, 0x20($sp)
  /* 189BB8 801337E8 AFAF001C */        sw $t7, 0x1c($sp)
  /* 189BBC 801337EC AFAE0018 */        sw $t6, 0x18($sp)
  /* 189BC0 801337F0 AFAC0014 */        sw $t4, 0x14($sp)
  /* 189BC4 801337F4 AFAB0010 */        sw $t3, 0x10($sp)
  /* 189BC8 801337F8 24040002 */     addiu $a0, $zero, 2
  /* 189BCC 801337FC 00002825 */        or $a1, $zero, $zero
  /* 189BD0 80133800 24060004 */     addiu $a2, $zero, 4
  /* 189BD4 80133804 3C078000 */       lui $a3, 0x8000
  /* 189BD8 80133808 AFA00024 */        sw $zero, 0x24($sp)
  /* 189BDC 8013380C AFA0002C */        sw $zero, 0x2c($sp)
  /* 189BE0 80133810 0C002E4F */       jal func_8000B93C
  /* 189BE4 80133814 AFA00034 */        sw $zero, 0x34($sp)
  /* 189BE8 80133818 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 189BEC 8013381C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 189BF0 80133820 3C0143EB */       lui $at, (0x43EB0000 >> 16) # 470.0
  /* 189BF4 80133824 8C430074 */        lw $v1, 0x74($v0)
  /* 189BF8 80133828 44813000 */      mtc1 $at, $f6 # 470.0 to cop1
  /* 189BFC 8013382C 3C07441D */       lui $a3, (0x441D8000 >> 16) # 1142784000
  /* 189C00 80133830 44050000 */      mfc1 $a1, $f0
  /* 189C04 80133834 44060000 */      mfc1 $a2, $f0
  /* 189C08 80133838 34E78000 */       ori $a3, $a3, (0x441D8000 & 0xFFFF) # 1142784000
  /* 189C0C 8013383C 24640008 */     addiu $a0, $v1, 8
  /* 189C10 80133840 0C001C20 */       jal func_80007080
  /* 189C14 80133844 E7A60010 */      swc1 $f6, 0x10($sp)
  /* 189C18 80133848 8FBF003C */        lw $ra, 0x3c($sp)
  /* 189C1C 8013384C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 189C20 80133850 03E00008 */        jr $ra
  /* 189C24 80133854 00000000 */       nop 

glabel mnSoundTestInitVars
  /* 189C28 80133858 3C038013 */       lui $v1, %hi(sMNSoundTestOptionColorR)
  /* 189C2C 8013385C 3C048013 */       lui $a0, %hi(sMNSoundTestOptionColorG)
  /* 189C30 80133860 3C058013 */       lui $a1, %hi(sMNSoundTestOptionColorB)
  /* 189C34 80133864 24A54330 */     addiu $a1, $a1, %lo(sMNSoundTestOptionColorB)
  /* 189C38 80133868 24844320 */     addiu $a0, $a0, %lo(sMNSoundTestOptionColorG)
  /* 189C3C 8013386C 24634310 */     addiu $v1, $v1, %lo(sMNSoundTestOptionColorR)
  /* 189C40 80133870 240E007D */     addiu $t6, $zero, 0x7d
  /* 189C44 80133874 240F0045 */     addiu $t7, $zero, 0x45
  /* 189C48 80133878 24180007 */     addiu $t8, $zero, 7
  /* 189C4C 8013387C 3C0141D4 */       lui $at, (0x41D40000 >> 16) # 26.5
  /* 189C50 80133880 44810000 */      mtc1 $at, $f0 # 26.5 to cop1
  /* 189C54 80133884 AC6E0008 */        sw $t6, 8($v1) # sMNSoundTestOptionColorR + 8
  /* 189C58 80133888 AC6E0004 */        sw $t6, 4($v1) # sMNSoundTestOptionColorR + 4
  /* 189C5C 8013388C AC6E0000 */        sw $t6, ($v1) # sMNSoundTestOptionColorR + 0
  /* 189C60 80133890 AC8F0008 */        sw $t7, 8($a0) # sMNSoundTestOptionColorG + 8
  /* 189C64 80133894 AC8F0004 */        sw $t7, 4($a0) # sMNSoundTestOptionColorG + 4
  /* 189C68 80133898 AC8F0000 */        sw $t7, ($a0) # sMNSoundTestOptionColorG + 0
  /* 189C6C 8013389C ACB80008 */        sw $t8, 8($a1) # sMNSoundTestOptionColorB + 8
  /* 189C70 801338A0 ACB80004 */        sw $t8, 4($a1) # sMNSoundTestOptionColorB + 4
  /* 189C74 801338A4 ACB80000 */        sw $t8, ($a1) # sMNSoundTestOptionColorB + 0
  /* 189C78 801338A8 3C018013 */       lui $at, %hi(sMNSoundTestOption)
  /* 189C7C 801338AC AC204308 */        sw $zero, %lo(sMNSoundTestOption)($at)
  /* 189C80 801338B0 3C018013 */       lui $at, %hi(sMNSoundTestOptionChangeWait)
  /* 189C84 801338B4 AC20433C */        sw $zero, %lo(sMNSoundTestOptionChangeWait)($at)
  /* 189C88 801338B8 3C018013 */       lui $at, %hi(sMNSoundTestDirectionInputKind)
  /* 189C8C 801338BC AC204340 */        sw $zero, %lo(sMNSoundTestDirectionInputKind)($at)
  /* 189C90 801338C0 3C068013 */       lui $a2, %hi(sMNSoundTestOptionSelectID)
  /* 189C94 801338C4 3C078013 */       lui $a3, %hi(sMNSoundTestSelectIDPositionsX)
  /* 189C98 801338C8 24E74358 */     addiu $a3, $a3, %lo(sMNSoundTestSelectIDPositionsX)
  /* 189C9C 801338CC 24C64348 */     addiu $a2, $a2, %lo(sMNSoundTestOptionSelectID)
  /* 189CA0 801338D0 ACC00008 */        sw $zero, 8($a2) # sMNSoundTestOptionSelectID + 8
  /* 189CA4 801338D4 ACC00004 */        sw $zero, 4($a2) # sMNSoundTestOptionSelectID + 4
  /* 189CA8 801338D8 ACC00000 */        sw $zero, ($a2) # sMNSoundTestOptionSelectID + 0
  /* 189CAC 801338DC 3C018013 */       lui $at, %hi(sMNSoundTestFadeOutWait)
  /* 189CB0 801338E0 2419FFFF */     addiu $t9, $zero, -1
  /* 189CB4 801338E4 E4E00000 */      swc1 $f0, ($a3) # sMNSoundTestSelectIDPositionsX + 0
  /* 189CB8 801338E8 E4E00004 */      swc1 $f0, 4($a3) # sMNSoundTestSelectIDPositionsX + 4
  /* 189CBC 801338EC E4E00008 */      swc1 $f0, 8($a3) # sMNSoundTestSelectIDPositionsX + 8
  /* 189CC0 801338F0 03E00008 */        jr $ra
  /* 189CC4 801338F4 AC394364 */        sw $t9, %lo(sMNSoundTestFadeOutWait)($at)

glabel func_ovl62_801338F8
  /* 189CC8 801338F8 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 189CCC 801338FC AFBF001C */        sw $ra, 0x1c($sp)
  /* 189CD0 80133900 3C058013 */       lui $a1, %hi(mnSoundTestMenuProcUpdate)
  /* 189CD4 80133904 24A52244 */     addiu $a1, $a1, %lo(mnSoundTestMenuProcUpdate)
  /* 189CD8 80133908 00002025 */        or $a0, $zero, $zero
  /* 189CDC 8013390C 24060001 */     addiu $a2, $zero, 1
  /* 189CE0 80133910 0C00265A */       jal omMakeGObjSPAfter
  /* 189CE4 80133914 3C078000 */       lui $a3, 0x8000
  /* 189CE8 80133918 240E00FF */     addiu $t6, $zero, 0xff
  /* 189CEC 8013391C AFAE0010 */        sw $t6, 0x10($sp)
  /* 189CF0 80133920 24040004 */     addiu $a0, $zero, 4
  /* 189CF4 80133924 3C058000 */       lui $a1, 0x8000
  /* 189CF8 80133928 24060064 */     addiu $a2, $zero, 0x64
  /* 189CFC 8013392C 0C002E7F */       jal func_8000B9FC
  /* 189D00 80133930 24070002 */     addiu $a3, $zero, 2
  /* 189D04 80133934 0C04C8AE */       jal func_ovl62_801322B8
  /* 189D08 80133938 00000000 */       nop 
  /* 189D0C 8013393C 0C04CE16 */       jal mnSoundTestInitVars
  /* 189D10 80133940 00000000 */       nop 
  /* 189D14 80133944 0C04CDB6 */       jal mnSoundTestMakeAllSObjs
  /* 189D18 80133948 00000000 */       nop 
  /* 189D1C 8013394C 0C04CDCA */       jal func_ovl62_80133728
  /* 189D20 80133950 00000000 */       nop 
  /* 189D24 80133954 8FBF001C */        lw $ra, 0x1c($sp)
  /* 189D28 80133958 27BD0020 */     addiu $sp, $sp, 0x20
  /* 189D2C 8013395C 03E00008 */        jr $ra
  /* 189D30 80133960 00000000 */       nop 

glabel mnSoundTestAddLightsDisplayList
  /* 189D34 80133964 8C830000 */        lw $v1, ($a0)
  /* 189D38 80133968 3C188013 */       lui $t8, %hi(dMNSoundTestDisplayList)
  /* 189D3C 8013396C 27184218 */     addiu $t8, $t8, %lo(dMNSoundTestDisplayList)
  /* 189D40 80133970 246E0008 */     addiu $t6, $v1, 8
  /* 189D44 80133974 AC8E0000 */        sw $t6, ($a0)
  /* 189D48 80133978 3C0FDE00 */       lui $t7, 0xde00
  /* 189D4C 8013397C AC6F0000 */        sw $t7, ($v1)
  /* 189D50 80133980 03E00008 */        jr $ra
  /* 189D54 80133984 AC780004 */        sw $t8, 4($v1)

glabel mnSoundTestStartScene
  /* 189D58 80133988 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 189D5C 8013398C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 189D60 80133990 3C048013 */       lui $a0, %hi(D_ovl62_80134240)
  /* 189D64 80133994 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 189D68 80133998 24844240 */     addiu $a0, $a0, %lo(D_ovl62_80134240)
  /* 189D6C 8013399C AFBF0014 */        sw $ra, 0x14($sp)
  /* 189D70 801339A0 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 189D74 801339A4 0C001C09 */       jal func_80007024
  /* 189D78 801339A8 AC8F000C */        sw $t7, 0xc($a0) # D_ovl62_80134240 + 12
  /* 189D7C 801339AC 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 189D80 801339B0 3C198013 */       lui $t9, %hi(D_NF_80134480)
  /* 189D84 801339B4 3C048013 */       lui $a0, %hi(D_ovl62_8013425C)
  /* 189D88 801339B8 27394480 */     addiu $t9, $t9, %lo(D_NF_80134480)
  /* 189D8C 801339BC 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 189D90 801339C0 2484425C */     addiu $a0, $a0, %lo(D_ovl62_8013425C)
  /* 189D94 801339C4 03194023 */      subu $t0, $t8, $t9
  /* 189D98 801339C8 0C001A0F */       jal gsGTLSceneInit
  /* 189D9C 801339CC AC880010 */        sw $t0, 0x10($a0) # D_ovl62_8013425C + 16
  /* 189DA0 801339D0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 189DA4 801339D4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 189DA8 801339D8 03E00008 */        jr $ra
  /* 189DAC 801339DC 00000000 */       nop 
#
#glabel dMNSoundTestMusicIDs   # Routine parsed as data
#  /* 189DB0 801339E0 00000021 */      addu $zero, $zero, $zero
#  /* 189DB4 801339E4 00000022 */       neg $zero, $zero
#  /* 189DB8 801339E8 0000002B */      sltu $zero, $zero, $zero
#  /* 189DBC 801339EC 0000002C */      dadd $zero, $zero, $zero
#  /* 189DC0 801339F0 00000006 */      srlv $zero, $zero, $zero
#  /* 189DC4 801339F4 00000005 */       lsa $zero, $zero, $zero, 1
#  /* 189DC8 801339F8 00000009 */        jr $zero
#  /* 189DCC 801339FC 00000001 */      movf $zero, $zero, $fcc0
#  /* 189DD0 80133A00 00000008 */        jr $zero
#  /* 189DD4 80133A04 00000000 */       nop 
#  /* 189DD8 80133A08 00000004 */      sllv $zero, $zero, $zero
#  /* 189DDC 80133A0C 00000007 */      srav $zero, $zero, $zero
#  /* 189DE0 80133A10 00000002 */       srl $zero, $zero, 0
#  /* 189DE4 80133A14 00000003 */       sra $zero, $zero, 0
#  /* 189DE8 80133A18 0000000C */   syscall 
