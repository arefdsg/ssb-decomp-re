.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x80138EF0

  /* 150CA0 80131B00 00000000 */       nop
  /* 150CA4 80131B04 00000000 */       nop
  /* 150CA8 80131B08 00000000 */       nop
  /* 150CAC 80131B0C 00000000 */       nop
# Maybe start of new file
  /* 150CB0 80131B10 00000000 */       nop
  /* 150CB4 80131B14 00000000 */       nop
  /* 150CB8 80131B18 00000000 */       nop
  /* 150CBC 80131B1C 00000000 */       nop
# Maybe start of new file
glabel mnResultsSetupDisplayList
  /* 150CC0 80131B20 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 150CC4 80131B24 AFBF0014 */        sw $ra, 0x14($sp)
  /* 150CC8 80131B28 8C830000 */        lw $v1, ($a0)
  /* 150CCC 80131B2C 3C0FD9FF */       lui $t7, (0xD9FFFFFF >> 16) # 3657433087
  /* 150CD0 80131B30 35EFFFFF */       ori $t7, $t7, (0xD9FFFFFF & 0xFFFF) # 3657433087
  /* 150CD4 80131B34 246E0008 */     addiu $t6, $v1, 8
  /* 150CD8 80131B38 AC8E0000 */        sw $t6, ($a0)
  /* 150CDC 80131B3C 3C180002 */       lui $t8, 2
  /* 150CE0 80131B40 AC780004 */        sw $t8, 4($v1)
  /* 150CE4 80131B44 AC6F0000 */        sw $t7, ($v1)
  /* 150CE8 80131B48 0C0E4147 */       jal func_ovl1_8039051C
  /* 150CEC 80131B4C AFA40028 */        sw $a0, 0x28($sp)
  /* 150CF0 80131B50 0C0E414A */       jal func_ovl1_80390528
  /* 150CF4 80131B54 E7A0001C */      swc1 $f0, 0x1c($sp)
  /* 150CF8 80131B58 44060000 */      mfc1 $a2, $f0
  /* 150CFC 80131B5C 8FA40028 */        lw $a0, 0x28($sp)
  /* 150D00 80131B60 0C03F2DC */       jal ftRender_Lights_DisplayLightReflect
  /* 150D04 80131B64 8FA5001C */        lw $a1, 0x1c($sp)
  /* 150D08 80131B68 8FBF0014 */        lw $ra, 0x14($sp)
  /* 150D0C 80131B6C 27BD0028 */     addiu $sp, $sp, 0x28
  /* 150D10 80131B70 03E00008 */        jr $ra
  /* 150D14 80131B74 00000000 */       nop

glabel mnResultsGetPlayerCount
  /* 150D18 80131B78 3C03800A */       lui $v1, %hi(gTransferBattleState)
  /* 150D1C 80131B7C 24634D08 */     addiu $v1, $v1, %lo(gTransferBattleState)
  /* 150D20 80131B80 906E0004 */       lbu $t6, 4($v1) # gTransferBattleState + 4
  /* 150D24 80131B84 906F0005 */       lbu $t7, 5($v1) # gTransferBattleState + 5
  /* 150D28 80131B88 03E00008 */        jr $ra
  /* 150D2C 80131B8C 01CF1021 */      addu $v0, $t6, $t7

glabel mnResultsSaveDataToSRAM
  /* 150D30 80131B90 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 150D34 80131B94 AFB30024 */        sw $s3, 0x24($sp)
  /* 150D38 80131B98 3C04800A */       lui $a0, %hi(gSaveData)
  /* 150D3C 80131B9C 248444E0 */     addiu $a0, $a0, %lo(gSaveData)
  /* 150D40 80131BA0 3C13800A */       lui $s3, %hi(gTransferBattleState)
  /* 150D44 80131BA4 26734D08 */     addiu $s3, $s3, %lo(gTransferBattleState)
  /* 150D48 80131BA8 92790001 */       lbu $t9, 1($s3) # gTransferBattleState + 1
  /* 150D4C 80131BAC 948E05E0 */       lhu $t6, 0x5e0($a0) # gSaveData + 1504
  /* 150D50 80131BB0 949805DC */       lhu $t8, 0x5dc($a0) # gSaveData + 1500
  /* 150D54 80131BB4 908205DE */       lbu $v0, 0x5de($a0) # gSaveData + 1502
  /* 150D58 80131BB8 24080001 */     addiu $t0, $zero, 1
  /* 150D5C 80131BBC 03284804 */      sllv $t1, $t0, $t9
  /* 150D60 80131BC0 25CF0001 */     addiu $t7, $t6, 1
  /* 150D64 80131BC4 03095025 */        or $t2, $t8, $t1
  /* 150D68 80131BC8 284100FF */      slti $at, $v0, 0xff
  /* 150D6C 80131BCC AFBF003C */        sw $ra, 0x3c($sp)
  /* 150D70 80131BD0 AFBE0038 */        sw $fp, 0x38($sp)
  /* 150D74 80131BD4 AFB70034 */        sw $s7, 0x34($sp)
  /* 150D78 80131BD8 AFB60030 */        sw $s6, 0x30($sp)
  /* 150D7C 80131BDC AFB5002C */        sw $s5, 0x2c($sp)
  /* 150D80 80131BE0 AFB40028 */        sw $s4, 0x28($sp)
  /* 150D84 80131BE4 AFB20020 */        sw $s2, 0x20($sp)
  /* 150D88 80131BE8 AFB1001C */        sw $s1, 0x1c($sp)
  /* 150D8C 80131BEC AFB00018 */        sw $s0, 0x18($sp)
  /* 150D90 80131BF0 A48F05E0 */        sh $t7, 0x5e0($a0) # gSaveData + 1504
  /* 150D94 80131BF4 10200003 */      beqz $at, .L80131C04
  /* 150D98 80131BF8 A48A05DC */        sh $t2, 0x5dc($a0) # gSaveData + 1500
  /* 150D9C 80131BFC 244B0001 */     addiu $t3, $v0, 1
  /* 150DA0 80131C00 A08B05DE */        sb $t3, 0x5de($a0) # gSaveData + 1502
  .L80131C04:
  /* 150DA4 80131C04 3C02800A */       lui $v0, %hi(gTransferBattleState)
  /* 150DA8 80131C08 24424D08 */     addiu $v0, $v0, %lo(gTransferBattleState)
  /* 150DAC 80131C0C 00009025 */        or $s2, $zero, $zero
  /* 150DB0 80131C10 241E0074 */     addiu $fp, $zero, 0x74
  /* 150DB4 80131C14 24170004 */     addiu $s7, $zero, 4
  /* 150DB8 80131C18 2416270F */     addiu $s6, $zero, 0x270f
  /* 150DBC 80131C1C 24150002 */     addiu $s5, $zero, 2
  .L80131C20:
  /* 150DC0 80131C20 904C0022 */       lbu $t4, 0x22($v0) # gTransferBattleState + 34
  /* 150DC4 80131C24 52AC006C */      beql $s5, $t4, .L80131DD8
  /* 150DC8 80131C28 26520001 */     addiu $s2, $s2, 1
  /* 150DCC 80131C2C 8E6F0018 */        lw $t7, 0x18($s3) # gTransferBattleState + 24
  /* 150DD0 80131C30 2401003C */     addiu $at, $zero, 0x3c
  /* 150DD4 80131C34 90540023 */       lbu $s4, 0x23($v0) # gTransferBattleState + 35
  /* 150DD8 80131C38 01E1001B */      divu $zero, $t7, $at
  /* 150DDC 80131C3C 00146880 */       sll $t5, $s4, 2
  /* 150DE0 80131C40 01B46823 */      subu $t5, $t5, $s4
  /* 150DE4 80131C44 000D68C0 */       sll $t5, $t5, 3
  /* 150DE8 80131C48 01B46823 */      subu $t5, $t5, $s4
  /* 150DEC 80131C4C 000D6880 */       sll $t5, $t5, 2
  /* 150DF0 80131C50 008D8021 */      addu $s0, $a0, $t5
  /* 150DF4 80131C54 8E0E0018 */        lw $t6, 0x18($s0)
  /* 150DF8 80131C58 00004012 */      mflo $t0
  /* 150DFC 80131C5C 3C010036 */       lui $at, (0x36EE80 >> 16) # 3600000
  /* 150E00 80131C60 3421EE80 */       ori $at, $at, (0x36EE80 & 0xFFFF) # 3600000
  /* 150E04 80131C64 01C8C821 */      addu $t9, $t6, $t0
  /* 150E08 80131C68 0321082B */      sltu $at, $t9, $at
  /* 150E0C 80131C6C 14200004 */      bnez $at, .L80131C80
  /* 150E10 80131C70 AE190018 */        sw $t9, 0x18($s0)
  /* 150E14 80131C74 3C090036 */       lui $t1, (0x36EE7F >> 16) # 3599999
  /* 150E18 80131C78 3529EE7F */       ori $t1, $t1, (0x36EE7F & 0xFFFF) # 3599999
  /* 150E1C 80131C7C AE090018 */        sw $t1, 0x18($s0)
  .L80131C80:
  /* 150E20 80131C80 8E0A001C */        lw $t2, 0x1c($s0)
  /* 150E24 80131C84 8C4B0054 */        lw $t3, 0x54($v0) # gTransferBattleState + 84
  /* 150E28 80131C88 3C03000F */       lui $v1, (0xF4240 >> 16) # 1000000
  /* 150E2C 80131C8C 34634240 */       ori $v1, $v1, (0xF4240 & 0xFFFF) # 1000000
  /* 150E30 80131C90 014B6021 */      addu $t4, $t2, $t3
  /* 150E34 80131C94 0183082B */      sltu $at, $t4, $v1
  /* 150E38 80131C98 14200004 */      bnez $at, .L80131CAC
  /* 150E3C 80131C9C AE0C001C */        sw $t4, 0x1c($s0)
  /* 150E40 80131CA0 3C0F000F */       lui $t7, (0xF423F >> 16) # 999999
  /* 150E44 80131CA4 35EF423F */       ori $t7, $t7, (0xF423F & 0xFFFF) # 999999
  /* 150E48 80131CA8 AE0F001C */        sw $t7, 0x1c($s0)
  .L80131CAC:
  /* 150E4C 80131CAC 8E0E0020 */        lw $t6, 0x20($s0)
  /* 150E50 80131CB0 8C480058 */        lw $t0, 0x58($v0) # gTransferBattleState + 88
  /* 150E54 80131CB4 3C09000F */       lui $t1, (0xF423F >> 16) # 999999
  /* 150E58 80131CB8 3529423F */       ori $t1, $t1, (0xF423F & 0xFFFF) # 999999
  /* 150E5C 80131CBC 01C8C821 */      addu $t9, $t6, $t0
  /* 150E60 80131CC0 0323082B */      sltu $at, $t9, $v1
  /* 150E64 80131CC4 14200002 */      bnez $at, .L80131CD0
  /* 150E68 80131CC8 AE190020 */        sw $t9, 0x20($s0)
  /* 150E6C 80131CCC AE090020 */        sw $t1, 0x20($s0)
  .L80131CD0:
  /* 150E70 80131CD0 960A0026 */       lhu $t2, 0x26($s0)
  /* 150E74 80131CD4 8C4B0050 */        lw $t3, 0x50($v0) # gTransferBattleState + 80
  /* 150E78 80131CD8 014B6021 */      addu $t4, $t2, $t3
  /* 150E7C 80131CDC 318DFFFF */      andi $t5, $t4, 0xffff
  /* 150E80 80131CE0 29A12710 */      slti $at, $t5, 0x2710
  /* 150E84 80131CE4 14200002 */      bnez $at, .L80131CF0
  /* 150E88 80131CE8 A60C0026 */        sh $t4, 0x26($s0)
  /* 150E8C 80131CEC A6160026 */        sh $s6, 0x26($s0)
  .L80131CF0:
  /* 150E90 80131CF0 960F0028 */       lhu $t7, 0x28($s0)
  /* 150E94 80131CF4 AFA20040 */        sw $v0, 0x40($sp)
  /* 150E98 80131CF8 25EE0001 */     addiu $t6, $t7, 1
  /* 150E9C 80131CFC 0C04C6DE */       jal mnResultsGetPlayerCount
  /* 150EA0 80131D00 A60E0028 */        sh $t6, 0x28($s0)
  /* 150EA4 80131D04 9608002A */       lhu $t0, 0x2a($s0)
  /* 150EA8 80131D08 3C04800A */       lui $a0, %hi(gSaveData)
  /* 150EAC 80131D0C 248444E0 */     addiu $a0, $a0, %lo(gSaveData)
  /* 150EB0 80131D10 0102C821 */      addu $t9, $t0, $v0
  /* 150EB4 80131D14 A619002A */        sh $t9, 0x2a($s0)
  /* 150EB8 80131D18 00008825 */        or $s1, $zero, $zero
  .L80131D1C:
  /* 150EBC 80131D1C 5251002A */      beql $s2, $s1, .L80131DC8
  /* 150EC0 80131D20 26310001 */     addiu $s1, $s1, 1
  /* 150EC4 80131D24 023E0019 */     multu $s1, $fp
  /* 150EC8 80131D28 00145080 */       sll $t2, $s4, 2
  /* 150ECC 80131D2C 001268C0 */       sll $t5, $s2, 3
  /* 150ED0 80131D30 01B26823 */      subu $t5, $t5, $s2
  /* 150ED4 80131D34 01545023 */      subu $t2, $t2, $s4
  /* 150ED8 80131D38 000A50C0 */       sll $t2, $t2, 3
  /* 150EDC 80131D3C 000D6880 */       sll $t5, $t5, 2
  /* 150EE0 80131D40 01B26821 */      addu $t5, $t5, $s2
  /* 150EE4 80131D44 01545023 */      subu $t2, $t2, $s4
  /* 150EE8 80131D48 000A5080 */       sll $t2, $t2, 2
  /* 150EEC 80131D4C 0000C012 */      mflo $t8
  /* 150EF0 80131D50 02781821 */      addu $v1, $s3, $t8
  /* 150EF4 80131D54 90690022 */       lbu $t1, 0x22($v1)
  /* 150EF8 80131D58 000D6880 */       sll $t5, $t5, 2
  /* 150EFC 80131D5C 026D7821 */      addu $t7, $s3, $t5
  /* 150F00 80131D60 12A90018 */       beq $s5, $t1, .L80131DC4
  /* 150F04 80131D64 008A5821 */      addu $t3, $a0, $t2
  /* 150F08 80131D68 90620023 */       lbu $v0, 0x23($v1)
  /* 150F0C 80131D6C 00117080 */       sll $t6, $s1, 2
  /* 150F10 80131D70 01EE4021 */      addu $t0, $t7, $t6
  /* 150F14 80131D74 00026040 */       sll $t4, $v0, 1
  /* 150F18 80131D78 016C8021 */      addu $s0, $t3, $t4
  /* 150F1C 80131D7C 96180000 */       lhu $t8, ($s0)
  /* 150F20 80131D80 8D190038 */        lw $t9, 0x38($t0)
  /* 150F24 80131D84 03194821 */      addu $t1, $t8, $t9
  /* 150F28 80131D88 312AFFFF */      andi $t2, $t1, 0xffff
  /* 150F2C 80131D8C 29412710 */      slti $at, $t2, 0x2710
  /* 150F30 80131D90 14200002 */      bnez $at, .L80131D9C
  /* 150F34 80131D94 A6090000 */        sh $t1, ($s0)
  /* 150F38 80131D98 A6160000 */        sh $s6, ($s0)
  .L80131D9C:
  /* 150F3C 80131D9C 0C04C6DE */       jal mnResultsGetPlayerCount
  /* 150F40 80131DA0 00000000 */       nop
  /* 150F44 80131DA4 960B002C */       lhu $t3, 0x2c($s0)
  /* 150F48 80131DA8 960D0044 */       lhu $t5, 0x44($s0)
  /* 150F4C 80131DAC 3C04800A */       lui $a0, %hi(gSaveData)
  /* 150F50 80131DB0 01626021 */      addu $t4, $t3, $v0
  /* 150F54 80131DB4 25AF0001 */     addiu $t7, $t5, 1
  /* 150F58 80131DB8 A60C002C */        sh $t4, 0x2c($s0)
  /* 150F5C 80131DBC 248444E0 */     addiu $a0, $a0, %lo(gSaveData)
  /* 150F60 80131DC0 A60F0044 */        sh $t7, 0x44($s0)
  .L80131DC4:
  /* 150F64 80131DC4 26310001 */     addiu $s1, $s1, 1
  .L80131DC8:
  /* 150F68 80131DC8 1637FFD4 */       bne $s1, $s7, .L80131D1C
  /* 150F6C 80131DCC 00000000 */       nop
  /* 150F70 80131DD0 8FA20040 */        lw $v0, 0x40($sp)
  /* 150F74 80131DD4 26520001 */     addiu $s2, $s2, 1
  .L80131DD8:
  /* 150F78 80131DD8 1657FF91 */       bne $s2, $s7, .L80131C20
  /* 150F7C 80131DDC 24420074 */     addiu $v0, $v0, 0x74
  /* 150F80 80131DE0 0C03517D */       jal lbMemory_SaveData_WriteSRAM
  /* 150F84 80131DE4 00000000 */       nop
  /* 150F88 80131DE8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 150F8C 80131DEC 8FB00018 */        lw $s0, 0x18($sp)
  /* 150F90 80131DF0 8FB1001C */        lw $s1, 0x1c($sp)
  /* 150F94 80131DF4 8FB20020 */        lw $s2, 0x20($sp)
  /* 150F98 80131DF8 8FB30024 */        lw $s3, 0x24($sp)
  /* 150F9C 80131DFC 8FB40028 */        lw $s4, 0x28($sp)
  /* 150FA0 80131E00 8FB5002C */        lw $s5, 0x2c($sp)
  /* 150FA4 80131E04 8FB60030 */        lw $s6, 0x30($sp)
  /* 150FA8 80131E08 8FB70034 */        lw $s7, 0x34($sp)
  /* 150FAC 80131E0C 8FBE0038 */        lw $fp, 0x38($sp)
  /* 150FB0 80131E10 03E00008 */        jr $ra
  /* 150FB4 80131E14 27BD0058 */     addiu $sp, $sp, 0x58

glabel mnResultsCheckStartPressed
  /* 150FB8 80131E18 3C0E8014 */       lui $t6, %hi(gMNResultsFramesElapsed)
  /* 150FBC 80131E1C 3C0F8014 */       lui $t7, %hi(gMNResultsMinFramesElapsed)
  /* 150FC0 80131E20 8DEF9C18 */        lw $t7, %lo(gMNResultsMinFramesElapsed)($t7)
  /* 150FC4 80131E24 8DCE9B78 */        lw $t6, %lo(gMNResultsFramesElapsed)($t6)
  /* 150FC8 80131E28 3C188004 */       lui $t8, %hi(gPlayerControllers + 2)
  /* 150FCC 80131E2C 00001025 */        or $v0, $zero, $zero
  /* 150FD0 80131E30 01CF082A */       slt $at, $t6, $t7
  /* 150FD4 80131E34 1420001C */      bnez $at, .L80131EA8
  /* 150FD8 80131E38 00000000 */       nop
  /* 150FDC 80131E3C 9718522A */       lhu $t8, %lo(gPlayerControllers + 2)($t8)
  /* 150FE0 80131E40 3C088004 */       lui $t0, 0x8004
  /* 150FE4 80131E44 33191000 */      andi $t9, $t8, 0x1000
  /* 150FE8 80131E48 13200003 */      beqz $t9, .L80131E58
  /* 150FEC 80131E4C 00000000 */       nop
  /* 150FF0 80131E50 03E00008 */        jr $ra
  /* 150FF4 80131E54 24020001 */     addiu $v0, $zero, 1

  .L80131E58:
  /* 150FF8 80131E58 95085234 */       lhu $t0, 0x5234($t0)
  /* 150FFC 80131E5C 3C0A8004 */       lui $t2, 0x8004
  /* 151000 80131E60 31091000 */      andi $t1, $t0, 0x1000
  /* 151004 80131E64 11200003 */      beqz $t1, .L80131E74
  /* 151008 80131E68 00000000 */       nop
  /* 15100C 80131E6C 03E00008 */        jr $ra
  /* 151010 80131E70 24020001 */     addiu $v0, $zero, 1

  .L80131E74:
  /* 151014 80131E74 954A523E */       lhu $t2, 0x523e($t2)
  /* 151018 80131E78 3C0C8004 */       lui $t4, 0x8004
  /* 15101C 80131E7C 314B1000 */      andi $t3, $t2, 0x1000
  /* 151020 80131E80 11600003 */      beqz $t3, .L80131E90
  /* 151024 80131E84 00000000 */       nop
  /* 151028 80131E88 03E00008 */        jr $ra
  /* 15102C 80131E8C 24020001 */     addiu $v0, $zero, 1

  .L80131E90:
  /* 151030 80131E90 958C5248 */       lhu $t4, 0x5248($t4)
  /* 151034 80131E94 318D1000 */      andi $t5, $t4, 0x1000
  /* 151038 80131E98 11A00003 */      beqz $t5, .L80131EA8
  /* 15103C 80131E9C 00000000 */       nop
  /* 151040 80131EA0 03E00008 */        jr $ra
  /* 151044 80131EA4 24020001 */     addiu $v0, $zero, 1

  .L80131EA8:
  /* 151048 80131EA8 03E00008 */        jr $ra
  /* 15104C 80131EAC 00000000 */       nop

glabel mnResultsAnnounceWinner
  /* 151050 80131EB0 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 151054 80131EB4 3C0F8014 */       lui $t7, %hi(dMNResultsAnnouncerNames)
  /* 151058 80131EB8 25EF8FA8 */     addiu $t7, $t7, %lo(dMNResultsAnnouncerNames)
  /* 15105C 80131EBC AFBF0014 */        sw $ra, 0x14($sp)
  /* 151060 80131EC0 25E80030 */     addiu $t0, $t7, 0x30
  /* 151064 80131EC4 27AE0030 */     addiu $t6, $sp, 0x30
  .L80131EC8:
  /* 151068 80131EC8 8DF90000 */        lw $t9, ($t7) # dMNResultsAnnouncerNames + 0
  /* 15106C 80131ECC 25EF000C */     addiu $t7, $t7, 0xc
  /* 151070 80131ED0 25CE000C */     addiu $t6, $t6, 0xc
  /* 151074 80131ED4 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 151078 80131ED8 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsAnnouncerNames + -8
  /* 15107C 80131EDC ADD8FFF8 */        sw $t8, -8($t6)
  /* 151080 80131EE0 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsAnnouncerNames + -4
  /* 151084 80131EE4 15E8FFF8 */       bne $t7, $t0, .L80131EC8
  /* 151088 80131EE8 ADD9FFFC */        sw $t9, -4($t6)
  /* 15108C 80131EEC 3C0A8014 */       lui $t2, %hi(dMNResultsAnnouncerTeams)
  /* 151090 80131EF0 254A8FD8 */     addiu $t2, $t2, %lo(dMNResultsAnnouncerTeams)
  /* 151094 80131EF4 8D4C0000 */        lw $t4, ($t2) # dMNResultsAnnouncerTeams + 0
  /* 151098 80131EF8 27A90024 */     addiu $t1, $sp, 0x24
  /* 15109C 80131EFC 8D4B0004 */        lw $t3, 4($t2) # dMNResultsAnnouncerTeams + 4
  /* 1510A0 80131F00 AD2C0000 */        sw $t4, ($t1)
  /* 1510A4 80131F04 8D4C0008 */        lw $t4, 8($t2) # dMNResultsAnnouncerTeams + 8
  /* 1510A8 80131F08 3C0D8014 */       lui $t5, %hi(gMNResultsGameRule)
  /* 1510AC 80131F0C AD2B0004 */        sw $t3, 4($t1)
  /* 1510B0 80131F10 AD2C0008 */        sw $t4, 8($t1)
  /* 1510B4 80131F14 8DAD9C10 */        lw $t5, %lo(gMNResultsGameRule)($t5)
  /* 1510B8 80131F18 24010004 */     addiu $at, $zero, 4
  /* 1510BC 80131F1C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1510C0 80131F20 15A10011 */       bne $t5, $at, .L80131F68
  /* 1510C4 80131F24 3C088014 */       lui $t0, 0x8014
  /* 1510C8 80131F28 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1510CC 80131F2C 24010002 */     addiu $at, $zero, 2
  /* 1510D0 80131F30 10410005 */       beq $v0, $at, .L80131F48
  /* 1510D4 80131F34 24010047 */     addiu $at, $zero, 0x47
  /* 1510D8 80131F38 10410007 */       beq $v0, $at, .L80131F58
  /* 1510DC 80131F3C 00000000 */       nop
  /* 1510E0 80131F40 10000043 */         b .L80132050
  /* 1510E4 80131F44 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131F48:
  /* 1510E8 80131F48 0C009A70 */       jal func_800269C0
  /* 1510EC 80131F4C 240401F6 */     addiu $a0, $zero, 0x1f6
  /* 1510F0 80131F50 1000003F */         b .L80132050
  /* 1510F4 80131F54 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131F58:
  /* 1510F8 80131F58 0C009A70 */       jal func_800269C0
  /* 1510FC 80131F5C 24040270 */     addiu $a0, $zero, 0x270
  /* 151100 80131F60 1000003B */         b .L80132050
  /* 151104 80131F64 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131F68:
  /* 151108 80131F68 91089C14 */       lbu $t0, -0x63ec($t0)
  /* 15110C 80131F6C 3C028014 */       lui $v0, 0x8014
  /* 151110 80131F70 1500001E */      bnez $t0, .L80131FEC
  /* 151114 80131F74 00000000 */       nop
  /* 151118 80131F78 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15111C 80131F7C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 151120 80131F80 24010051 */     addiu $at, $zero, 0x51
  /* 151124 80131F84 10410007 */       beq $v0, $at, .L80131FA4
  /* 151128 80131F88 240100D2 */     addiu $at, $zero, 0xd2
  /* 15112C 80131F8C 10410009 */       beq $v0, $at, .L80131FB4
  /* 151130 80131F90 2401010E */     addiu $at, $zero, 0x10e
  /* 151134 80131F94 10410011 */       beq $v0, $at, .L80131FDC
  /* 151138 80131F98 00000000 */       nop
  /* 15113C 80131F9C 1000002C */         b .L80132050
  /* 151140 80131FA0 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131FA4:
  /* 151144 80131FA4 0C009A70 */       jal func_800269C0
  /* 151148 80131FA8 24040216 */     addiu $a0, $zero, 0x216
  /* 15114C 80131FAC 10000028 */         b .L80132050
  /* 151150 80131FB0 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131FB4:
  /* 151154 80131FB4 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 151158 80131FB8 00000000 */       nop
  /* 15115C 80131FBC 0C04CC52 */       jal mnResultsGetFtKind
  /* 151160 80131FC0 00402025 */        or $a0, $v0, $zero
  /* 151164 80131FC4 00027880 */       sll $t7, $v0, 2
  /* 151168 80131FC8 03AF2021 */      addu $a0, $sp, $t7
  /* 15116C 80131FCC 0C009A70 */       jal func_800269C0
  /* 151170 80131FD0 94840032 */       lhu $a0, 0x32($a0)
  /* 151174 80131FD4 1000001E */         b .L80132050
  /* 151178 80131FD8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131FDC:
  /* 15117C 80131FDC 0C009A70 */       jal func_800269C0
  /* 151180 80131FE0 24040272 */     addiu $a0, $zero, 0x272
  /* 151184 80131FE4 1000001A */         b .L80132050
  /* 151188 80131FE8 8FBF0014 */        lw $ra, 0x14($sp)
  .L80131FEC:
  /* 15118C 80131FEC 8C429B78 */        lw $v0, -0x6488($v0)
  /* 151190 80131FF0 24010051 */     addiu $at, $zero, 0x51
  /* 151194 80131FF4 10410007 */       beq $v0, $at, .L80132014
  /* 151198 80131FF8 24010082 */     addiu $at, $zero, 0x82
  /* 15119C 80131FFC 1041000D */       beq $v0, $at, .L80132034
  /* 1511A0 80132000 24010096 */     addiu $at, $zero, 0x96
  /* 1511A4 80132004 1041000F */       beq $v0, $at, .L80132044
  /* 1511A8 80132008 00000000 */       nop
  /* 1511AC 8013200C 10000010 */         b .L80132050
  /* 1511B0 80132010 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132014:
  /* 1511B4 80132014 0C04CA8B */       jal mnResultsGetWinningTeam
  /* 1511B8 80132018 00000000 */       nop
  /* 1511BC 8013201C 00027080 */       sll $t6, $v0, 2
  /* 1511C0 80132020 03AE2021 */      addu $a0, $sp, $t6
  /* 1511C4 80132024 0C009A70 */       jal func_800269C0
  /* 1511C8 80132028 94840026 */       lhu $a0, 0x26($a0)
  /* 1511CC 8013202C 10000008 */         b .L80132050
  /* 1511D0 80132030 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132034:
  /* 1511D4 80132034 0C009A70 */       jal func_800269C0
  /* 1511D8 80132038 24040215 */     addiu $a0, $zero, 0x215
  /* 1511DC 8013203C 10000004 */         b .L80132050
  /* 1511E0 80132040 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132044:
  /* 1511E4 80132044 0C009A70 */       jal func_800269C0
  /* 1511E8 80132048 24040272 */     addiu $a0, $zero, 0x272
  /* 1511EC 8013204C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132050:
  /* 1511F0 80132050 27BD0060 */     addiu $sp, $sp, 0x60
  /* 1511F4 80132054 03E00008 */        jr $ra
  /* 1511F8 80132058 00000000 */       nop

glabel mnResultsGetPresentCount
  /* 1511FC 8013205C 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 151200 80132060 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 151204 80132064 24020001 */     addiu $v0, $zero, 1
  /* 151208 80132068 00001825 */        or $v1, $zero, $zero
  /* 15120C 8013206C 144E0002 */       bne $v0, $t6, .L80132078
  /* 151210 80132070 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BD4)
  /* 151214 80132074 00401825 */        or $v1, $v0, $zero
  .L80132078:
  /* 151218 80132078 8DEF9BD4 */        lw $t7, %lo(D_ovl31_80139BD4)($t7)
  /* 15121C 8013207C 3C188014 */       lui $t8, %hi(D_ovl31_80139BD8)
  /* 151220 80132080 3C198014 */       lui $t9, %hi(D_ovl31_80139BDC)
  /* 151224 80132084 144F0002 */       bne $v0, $t7, .L80132090
  /* 151228 80132088 00000000 */       nop
  /* 15122C 8013208C 24630001 */     addiu $v1, $v1, 1
  .L80132090:
  /* 151230 80132090 8F189BD8 */        lw $t8, %lo(D_ovl31_80139BD8)($t8)
  /* 151234 80132094 14580002 */       bne $v0, $t8, .L801320A0
  /* 151238 80132098 00000000 */       nop
  /* 15123C 8013209C 24630001 */     addiu $v1, $v1, 1
  .L801320A0:
  /* 151240 801320A0 8F399BDC */        lw $t9, %lo(D_ovl31_80139BDC)($t9)
  /* 151244 801320A4 14590002 */       bne $v0, $t9, .L801320B0
  /* 151248 801320A8 00000000 */       nop
  /* 15124C 801320AC 24630001 */     addiu $v1, $v1, 1
  .L801320B0:
  /* 151250 801320B0 03E00008 */        jr $ra
  /* 151254 801320B4 00601025 */        or $v0, $v1, $zero

glabel mnResultsGetLowerPortCount
  /* 151258 801320B8 3C068014 */       lui $a2, %hi(gMNResultsIsPresent)
  /* 15125C 801320BC 00001825 */        or $v1, $zero, $zero
  /* 151260 801320C0 24C69BD0 */     addiu $a2, $a2, %lo(gMNResultsIsPresent)
  /* 151264 801320C4 00001025 */        or $v0, $zero, $zero
  /* 151268 801320C8 24070004 */     addiu $a3, $zero, 4
  /* 15126C 801320CC 24050001 */     addiu $a1, $zero, 1
  .L801320D0:
  /* 151270 801320D0 10820009 */       beq $a0, $v0, .L801320F8
  /* 151274 801320D4 00027080 */       sll $t6, $v0, 2
  /* 151278 801320D8 00CE7821 */      addu $t7, $a2, $t6
  /* 15127C 801320DC 8DF80000 */        lw $t8, ($t7)
  /* 151280 801320E0 24420001 */     addiu $v0, $v0, 1
  /* 151284 801320E4 14B80002 */       bne $a1, $t8, .L801320F0
  /* 151288 801320E8 00000000 */       nop
  /* 15128C 801320EC 24630001 */     addiu $v1, $v1, 1
  .L801320F0:
  /* 151290 801320F0 1447FFF7 */       bne $v0, $a3, .L801320D0
  /* 151294 801320F4 00000000 */       nop
  .L801320F8:
  /* 151298 801320F8 03E00008 */        jr $ra
  /* 15129C 801320FC 00601025 */        or $v0, $v1, $zero

glabel mnResultsGetPortByPlace
  /* 1512A0 80132100 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 1512A4 80132104 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 1512A8 80132108 3C188014 */       lui $t8, 0x8014
  /* 1512AC 8013210C 3C0F8014 */       lui $t7, %hi(gMNResultsPlacement)
  /* 1512B0 80132110 11C00006 */      beqz $t6, .L8013212C
  /* 1512B4 80132114 00000000 */       nop
  /* 1512B8 80132118 8DEF9BB0 */        lw $t7, %lo(gMNResultsPlacement)($t7)
  /* 1512BC 8013211C 148F0003 */       bne $a0, $t7, .L8013212C
  /* 1512C0 80132120 00000000 */       nop
  /* 1512C4 80132124 03E00008 */        jr $ra
  /* 1512C8 80132128 00001025 */        or $v0, $zero, $zero

  .L8013212C:
  /* 1512CC 8013212C 8F189BD4 */        lw $t8, -0x642c($t8)
  /* 1512D0 80132130 3C198014 */       lui $t9, %hi(D_ovl31_80139BB4)
  /* 1512D4 80132134 3C088014 */       lui $t0, 0x8014
  /* 1512D8 80132138 13000006 */      beqz $t8, .L80132154
  /* 1512DC 8013213C 00000000 */       nop
  /* 1512E0 80132140 8F399BB4 */        lw $t9, %lo(D_ovl31_80139BB4)($t9)
  /* 1512E4 80132144 14990003 */       bne $a0, $t9, .L80132154
  /* 1512E8 80132148 00000000 */       nop
  /* 1512EC 8013214C 03E00008 */        jr $ra
  /* 1512F0 80132150 24020001 */     addiu $v0, $zero, 1

  .L80132154:
  /* 1512F4 80132154 8D089BD8 */        lw $t0, -0x6428($t0)
  /* 1512F8 80132158 3C098014 */       lui $t1, %hi(D_ovl31_80139BB8)
  /* 1512FC 8013215C 3C0A8014 */       lui $t2, 0x8014
  /* 151300 80132160 11000006 */      beqz $t0, .L8013217C
  /* 151304 80132164 00000000 */       nop
  /* 151308 80132168 8D299BB8 */        lw $t1, %lo(D_ovl31_80139BB8)($t1)
  /* 15130C 8013216C 14890003 */       bne $a0, $t1, .L8013217C
  /* 151310 80132170 00000000 */       nop
  /* 151314 80132174 03E00008 */        jr $ra
  /* 151318 80132178 24020002 */     addiu $v0, $zero, 2

  .L8013217C:
  /* 15131C 8013217C 8D4A9BDC */        lw $t2, -0x6424($t2)
  /* 151320 80132180 3C0B8014 */       lui $t3, %hi(D_ovl31_80139BBC)
  /* 151324 80132184 2402FFFF */     addiu $v0, $zero, -1
  /* 151328 80132188 11400006 */      beqz $t2, .L801321A4
  /* 15132C 8013218C 00000000 */       nop
  /* 151330 80132190 8D6B9BBC */        lw $t3, %lo(D_ovl31_80139BBC)($t3)
  /* 151334 80132194 148B0003 */       bne $a0, $t3, .L801321A4
  /* 151338 80132198 00000000 */       nop
  /* 15133C 8013219C 03E00008 */        jr $ra
  /* 151340 801321A0 24020003 */     addiu $v0, $zero, 3

  .L801321A4:
  /* 151344 801321A4 03E00008 */        jr $ra
  /* 151348 801321A8 00000000 */       nop

glabel func_ovl31_801321AC
  /* 15134C 801321AC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 151350 801321B0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 151354 801321B4 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 151358 801321B8 AFA40020 */        sw $a0, 0x20($sp)
  /* 15135C 801321BC 00002025 */        or $a0, $zero, $zero
  /* 151360 801321C0 0C04CDA1 */       jal mnResultsGetPlayerCountByPlace
  /* 151364 801321C4 AFA2001C */        sw $v0, 0x1c($sp)
  /* 151368 801321C8 24010001 */     addiu $at, $zero, 1
  /* 15136C 801321CC 8FA3001C */        lw $v1, 0x1c($sp)
  /* 151370 801321D0 14410059 */       bne $v0, $at, .L80132338
  /* 151374 801321D4 8FA50020 */        lw $a1, 0x20($sp)
  /* 151378 801321D8 AFA3001C */        sw $v1, 0x1c($sp)
  /* 15137C 801321DC 0C04C817 */       jal mnResultsGetPresentCount
  /* 151380 801321E0 AFA50020 */        sw $a1, 0x20($sp)
  /* 151384 801321E4 24060002 */     addiu $a2, $zero, 2
  /* 151388 801321E8 8FA3001C */        lw $v1, 0x1c($sp)
  /* 15138C 801321EC 10460052 */       beq $v0, $a2, .L80132338
  /* 151390 801321F0 8FA50020 */        lw $a1, 0x20($sp)
  /* 151394 801321F4 24040003 */     addiu $a0, $zero, 3
  /* 151398 801321F8 14440021 */       bne $v0, $a0, .L80132280
  /* 15139C 801321FC 00057080 */       sll $t6, $a1, 2
  /* 1513A0 80132200 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 1513A4 80132204 24429BB0 */     addiu $v0, $v0, %lo(gMNResultsPlacement)
  /* 1513A8 80132208 004E7821 */      addu $t7, $v0, $t6
  /* 1513AC 8013220C 8DF80000 */        lw $t8, ($t7)
  /* 1513B0 80132210 00A02025 */        or $a0, $a1, $zero
  /* 1513B4 80132214 1700000F */      bnez $t8, .L80132254
  /* 1513B8 80132218 00000000 */       nop
  /* 1513BC 8013221C 00A02025 */        or $a0, $a1, $zero
  /* 1513C0 80132220 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 1513C4 80132224 AFA3001C */        sw $v1, 0x1c($sp)
  /* 1513C8 80132228 8FA3001C */        lw $v1, 0x1c($sp)
  /* 1513CC 8013222C 10400005 */      beqz $v0, .L80132244
  /* 1513D0 80132230 24060002 */     addiu $a2, $zero, 2
  /* 1513D4 80132234 10460005 */       beq $v0, $a2, .L8013224C
  /* 1513D8 80132238 00000000 */       nop
  /* 1513DC 8013223C 1000003F */         b .L8013233C
  /* 1513E0 80132240 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132244:
  /* 1513E4 80132244 1000003C */         b .L80132338
  /* 1513E8 80132248 24030001 */     addiu $v1, $zero, 1
  .L8013224C:
  /* 1513EC 8013224C 1000003A */         b .L80132338
  /* 1513F0 80132250 24030001 */     addiu $v1, $zero, 1
  .L80132254:
  /* 1513F4 80132254 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 1513F8 80132258 AFA3001C */        sw $v1, 0x1c($sp)
  /* 1513FC 8013225C 24010001 */     addiu $at, $zero, 1
  /* 151400 80132260 14410035 */       bne $v0, $at, .L80132338
  /* 151404 80132264 8FA3001C */        lw $v1, 0x1c($sp)
  /* 151408 80132268 0C04C840 */       jal mnResultsGetPortByPlace
  /* 15140C 8013226C 00002025 */        or $a0, $zero, $zero
  /* 151410 80132270 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 151414 80132274 00402025 */        or $a0, $v0, $zero
  /* 151418 80132278 1000002F */         b .L80132338
  /* 15141C 8013227C 00401825 */        or $v1, $v0, $zero
  .L80132280:
  /* 151420 80132280 10A0000A */      beqz $a1, .L801322AC
  /* 151424 80132284 3C028014 */       lui $v0, 0x8014
  /* 151428 80132288 24010001 */     addiu $at, $zero, 1
  /* 15142C 8013228C 10A10010 */       beq $a1, $at, .L801322D0
  /* 151430 80132290 3C028014 */       lui $v0, 0x8014
  /* 151434 80132294 10A60017 */       beq $a1, $a2, .L801322F4
  /* 151438 80132298 3C028014 */       lui $v0, 0x8014
  /* 15143C 8013229C 10A4001E */       beq $a1, $a0, .L80132318
  /* 151440 801322A0 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 151444 801322A4 10000025 */         b .L8013233C
  /* 151448 801322A8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801322AC:
  /* 15144C 801322AC 24429BB0 */     addiu $v0, $v0, %lo(gMNResultsPlacement)
  /* 151450 801322B0 8C590000 */        lw $t9, ($v0) # gMNResultsPlacement + 0
  /* 151454 801322B4 57200021 */      bnel $t9, $zero, .L8013233C
  /* 151458 801322B8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 15145C 801322BC 8C480004 */        lw $t0, 4($v0) # gMNResultsPlacement + 4
  /* 151460 801322C0 5100001E */      beql $t0, $zero, .L8013233C
  /* 151464 801322C4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 151468 801322C8 1000001B */         b .L80132338
  /* 15146C 801322CC 24030001 */     addiu $v1, $zero, 1
  .L801322D0:
  /* 151470 801322D0 24429BB0 */     addiu $v0, $v0, -0x6450
  /* 151474 801322D4 8C490000 */        lw $t1, ($v0) # gMNResultsPlacement + 0
  /* 151478 801322D8 55200018 */      bnel $t1, $zero, .L8013233C
  /* 15147C 801322DC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 151480 801322E0 8C4A0004 */        lw $t2, 4($v0) # gMNResultsPlacement + 4
  /* 151484 801322E4 51400015 */      beql $t2, $zero, .L8013233C
  /* 151488 801322E8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 15148C 801322EC 10000012 */         b .L80132338
  /* 151490 801322F0 00001825 */        or $v1, $zero, $zero
  .L801322F4:
  /* 151494 801322F4 24429BB0 */     addiu $v0, $v0, -0x6450
  /* 151498 801322F8 8C4B000C */        lw $t3, 0xc($v0) # gMNResultsPlacement + 12
  /* 15149C 801322FC 5560000F */      bnel $t3, $zero, .L8013233C
  /* 1514A0 80132300 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1514A4 80132304 8C4C0008 */        lw $t4, 8($v0) # gMNResultsPlacement + 8
  /* 1514A8 80132308 5180000C */      beql $t4, $zero, .L8013233C
  /* 1514AC 8013230C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1514B0 80132310 10000009 */         b .L80132338
  /* 1514B4 80132314 24030003 */     addiu $v1, $zero, 3
  .L80132318:
  /* 1514B8 80132318 24429BB0 */     addiu $v0, $v0, -0x6450
  /* 1514BC 8013231C 8C4D000C */        lw $t5, 0xc($v0) # gMNResultsPlacement + 12
  /* 1514C0 80132320 55A00006 */      bnel $t5, $zero, .L8013233C
  /* 1514C4 80132324 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1514C8 80132328 8C4E0008 */        lw $t6, 8($v0) # gMNResultsPlacement + 8
  /* 1514CC 8013232C 51C00003 */      beql $t6, $zero, .L8013233C
  /* 1514D0 80132330 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1514D4 80132334 24030002 */     addiu $v1, $zero, 2
  .L80132338:
  /* 1514D8 80132338 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013233C:
  /* 1514DC 8013233C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1514E0 80132340 00601025 */        or $v0, $v1, $zero
  /* 1514E4 80132344 03E00008 */        jr $ra
  /* 1514E8 80132348 00000000 */       nop

glabel mnResultsGetWinnerPort
  /* 1514EC 8013234C 3C028014 */       lui $v0, %hi(gMNResultsGameRule)
  /* 1514F0 80132350 8C429C10 */        lw $v0, %lo(gMNResultsGameRule)($v0)
  /* 1514F4 80132354 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 1514F8 80132358 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1514FC 8013235C 10400004 */      beqz $v0, .L80132370
  /* 151500 80132360 2408029A */     addiu $t0, $zero, 0x29a
  /* 151504 80132364 24090001 */     addiu $t1, $zero, 1
  /* 151508 80132368 15220029 */       bne $t1, $v0, .L80132410
  /* 15150C 8013236C 00003025 */        or $a2, $zero, $zero
  .L80132370:
  /* 151510 80132370 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 151514 80132374 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 151518 80132378 24090001 */     addiu $t1, $zero, 1
  /* 15151C 8013237C 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 151520 80132380 152E0006 */       bne $t1, $t6, .L8013239C
  /* 151524 80132384 3C0F8014 */       lui $t7, %hi(gMNResultsPlacement)
  /* 151528 80132388 8DEF9BB0 */        lw $t7, %lo(gMNResultsPlacement)($t7)
  /* 15152C 8013238C 15E00003 */      bnez $t7, .L8013239C
  /* 151530 80132390 00000000 */       nop
  /* 151534 80132394 100001A1 */         b .L80132A1C
  /* 151538 80132398 00001025 */        or $v0, $zero, $zero
  .L8013239C:
  /* 15153C 8013239C 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 151540 801323A0 3C198014 */       lui $t9, %hi(D_ovl31_80139BB4)
  /* 151544 801323A4 3C0E8014 */       lui $t6, %hi(D_ovl31_80139BD8)
  /* 151548 801323A8 15380006 */       bne $t1, $t8, .L801323C4
  /* 15154C 801323AC 00000000 */       nop
  /* 151550 801323B0 8F399BB4 */        lw $t9, %lo(D_ovl31_80139BB4)($t9)
  /* 151554 801323B4 17200003 */      bnez $t9, .L801323C4
  /* 151558 801323B8 00000000 */       nop
  /* 15155C 801323BC 10000197 */         b .L80132A1C
  /* 151560 801323C0 24020001 */     addiu $v0, $zero, 1
  .L801323C4:
  /* 151564 801323C4 8DCE9BD8 */        lw $t6, %lo(D_ovl31_80139BD8)($t6)
  /* 151568 801323C8 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BB8)
  /* 15156C 801323CC 3C188014 */       lui $t8, %hi(D_ovl31_80139BDC)
  /* 151570 801323D0 152E0006 */       bne $t1, $t6, .L801323EC
  /* 151574 801323D4 00000000 */       nop
  /* 151578 801323D8 8DEF9BB8 */        lw $t7, %lo(D_ovl31_80139BB8)($t7)
  /* 15157C 801323DC 15E00003 */      bnez $t7, .L801323EC
  /* 151580 801323E0 00000000 */       nop
  /* 151584 801323E4 1000018D */         b .L80132A1C
  /* 151588 801323E8 24020002 */     addiu $v0, $zero, 2
  .L801323EC:
  /* 15158C 801323EC 8F189BDC */        lw $t8, %lo(D_ovl31_80139BDC)($t8)
  /* 151590 801323F0 3C198014 */       lui $t9, %hi(D_ovl31_80139BBC)
  /* 151594 801323F4 5538018A */      bnel $t1, $t8, .L80132A20
  /* 151598 801323F8 8FBF0014 */        lw $ra, 0x14($sp)
  /* 15159C 801323FC 8F399BBC */        lw $t9, %lo(D_ovl31_80139BBC)($t9)
  /* 1515A0 80132400 57200187 */      bnel $t9, $zero, .L80132A20
  /* 1515A4 80132404 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1515A8 80132408 10000184 */         b .L80132A1C
  /* 1515AC 8013240C 24020003 */     addiu $v0, $zero, 3
  .L80132410:
  /* 1515B0 80132410 27A3005C */     addiu $v1, $sp, 0x5c
  .L80132414:
  /* 1515B4 80132414 00C02025 */        or $a0, $a2, $zero
  /* 1515B8 80132418 AFA3002C */        sw $v1, 0x2c($sp)
  /* 1515BC 8013241C AFA6007C */        sw $a2, 0x7c($sp)
  /* 1515C0 80132420 0C04DB02 */       jal mnResultsGetKOsMinusTKOs
  /* 1515C4 80132424 AFA80058 */        sw $t0, 0x58($sp)
  /* 1515C8 80132428 8FA6007C */        lw $a2, 0x7c($sp)
  /* 1515CC 8013242C 8FA3002C */        lw $v1, 0x2c($sp)
  /* 1515D0 80132430 8FA80058 */        lw $t0, 0x58($sp)
  /* 1515D4 80132434 24C60001 */     addiu $a2, $a2, 1
  /* 1515D8 80132438 28C10004 */      slti $at, $a2, 4
  /* 1515DC 8013243C 24090001 */     addiu $t1, $zero, 1
  /* 1515E0 80132440 24630004 */     addiu $v1, $v1, 4
  /* 1515E4 80132444 1420FFF3 */      bnez $at, .L80132414
  /* 1515E8 80132448 AC62FFFC */        sw $v0, -4($v1)
  /* 1515EC 8013244C 3C028014 */       lui $v0, %hi(gMNResultsIsPresent)
  /* 1515F0 80132450 3C058014 */       lui $a1, %hi(gMNResultsPlacement)
  /* 1515F4 80132454 24A59BB0 */     addiu $a1, $a1, %lo(gMNResultsPlacement)
  /* 1515F8 80132458 24429BD0 */     addiu $v0, $v0, %lo(gMNResultsIsPresent)
  /* 1515FC 8013245C 00003025 */        or $a2, $zero, $zero
  /* 151600 80132460 00001825 */        or $v1, $zero, $zero
  /* 151604 80132464 27A4006C */     addiu $a0, $sp, 0x6c
  /* 151608 80132468 2407029A */     addiu $a3, $zero, 0x29a
  .L8013246C:
  /* 15160C 8013246C 8C4E0000 */        lw $t6, ($v0) # gMNResultsIsPresent + 0
  /* 151610 80132470 24420004 */     addiu $v0, $v0, 4
  /* 151614 80132474 00A37821 */      addu $t7, $a1, $v1
  /* 151618 80132478 51C0000A */      beql $t6, $zero, .L801324A4
  /* 15161C 8013247C AC800000 */        sw $zero, ($a0)
  /* 151620 80132480 8DF80000 */        lw $t8, ($t7)
  /* 151624 80132484 57000007 */      bnel $t8, $zero, .L801324A4
  /* 151628 80132488 AC800000 */        sw $zero, ($a0)
  /* 15162C 8013248C 15070002 */       bne $t0, $a3, .L80132498
  /* 151630 80132490 00000000 */       nop
  /* 151634 80132494 00C04025 */        or $t0, $a2, $zero
  .L80132498:
  /* 151638 80132498 10000002 */         b .L801324A4
  /* 15163C 8013249C AC890000 */        sw $t1, ($a0)
  /* 151640 801324A0 AC800000 */        sw $zero, ($a0)
  .L801324A4:
  /* 151644 801324A4 24C60001 */     addiu $a2, $a2, 1
  /* 151648 801324A8 28C10004 */      slti $at, $a2, 4
  /* 15164C 801324AC 24630004 */     addiu $v1, $v1, 4
  /* 151650 801324B0 1420FFEE */      bnez $at, .L8013246C
  /* 151654 801324B4 24840004 */     addiu $a0, $a0, 4
  /* 151658 801324B8 27A20048 */     addiu $v0, $sp, 0x48
  /* 15165C 801324BC 27A30058 */     addiu $v1, $sp, 0x58
  .L801324C0:
  /* 151660 801324C0 24420004 */     addiu $v0, $v0, 4
  /* 151664 801324C4 0043082B */      sltu $at, $v0, $v1
  /* 151668 801324C8 1420FFFD */      bnez $at, .L801324C0
  /* 15166C 801324CC AC40FFFC */        sw $zero, -4($v0) # gMNResultsIsPresent + -4
  /* 151670 801324D0 250D0001 */     addiu $t5, $t0, 1
  /* 151674 801324D4 29A10004 */      slti $at, $t5, 4
  /* 151678 801324D8 10200050 */      beqz $at, .L8013261C
  /* 15167C 801324DC 01A03025 */        or $a2, $t5, $zero
  /* 151680 801324E0 241F0004 */     addiu $ra, $zero, 4
  /* 151684 801324E4 03ED6023 */      subu $t4, $ra, $t5
  /* 151688 801324E8 318C0003 */      andi $t4, $t4, 3
  /* 15168C 801324EC 11800015 */      beqz $t4, .L80132544
  /* 151690 801324F0 018D1021 */      addu $v0, $t4, $t5
  /* 151694 801324F4 00061880 */       sll $v1, $a2, 2
  /* 151698 801324F8 27B9006C */     addiu $t9, $sp, 0x6c
  /* 15169C 801324FC 00792021 */      addu $a0, $v1, $t9
  /* 1516A0 80132500 27A5005C */     addiu $a1, $sp, 0x5c
  .L80132504:
  /* 1516A4 80132504 8C8E0000 */        lw $t6, ($a0)
  /* 1516A8 80132508 00087880 */       sll $t7, $t0, 2
  /* 1516AC 8013250C 00AFC021 */      addu $t8, $a1, $t7
  /* 1516B0 80132510 11C00008 */      beqz $t6, .L80132534
  /* 1516B4 80132514 24840004 */     addiu $a0, $a0, 4
  /* 1516B8 80132518 00A37021 */      addu $t6, $a1, $v1
  /* 1516BC 8013251C 8DCF0000 */        lw $t7, ($t6)
  /* 1516C0 80132520 8F190000 */        lw $t9, ($t8)
  /* 1516C4 80132524 032F082A */       slt $at, $t9, $t7
  /* 1516C8 80132528 50200003 */      beql $at, $zero, .L80132538
  /* 1516CC 8013252C 24C60001 */     addiu $a2, $a2, 1
  /* 1516D0 80132530 00C04025 */        or $t0, $a2, $zero
  .L80132534:
  /* 1516D4 80132534 24C60001 */     addiu $a2, $a2, 1
  .L80132538:
  /* 1516D8 80132538 1446FFF2 */       bne $v0, $a2, .L80132504
  /* 1516DC 8013253C 24630004 */     addiu $v1, $v1, 4
  /* 1516E0 80132540 10DF0034 */       beq $a2, $ra, .L80132614
  .L80132544:
  /* 1516E4 80132544 00061880 */       sll $v1, $a2, 2
  /* 1516E8 80132548 27B8006C */     addiu $t8, $sp, 0x6c
  /* 1516EC 8013254C 00782021 */      addu $a0, $v1, $t8
  /* 1516F0 80132550 27A5005C */     addiu $a1, $sp, 0x5c
  .L80132554:
  /* 1516F4 80132554 8C8E0000 */        lw $t6, ($a0)
  /* 1516F8 80132558 0008C880 */       sll $t9, $t0, 2
  /* 1516FC 8013255C 00B97821 */      addu $t7, $a1, $t9
  /* 151700 80132560 11C00007 */      beqz $t6, .L80132580
  /* 151704 80132564 00A37021 */      addu $t6, $a1, $v1
  /* 151708 80132568 8DD90000 */        lw $t9, ($t6)
  /* 15170C 8013256C 8DF80000 */        lw $t8, ($t7)
  /* 151710 80132570 0319082A */       slt $at, $t8, $t9
  /* 151714 80132574 50200003 */      beql $at, $zero, .L80132584
  /* 151718 80132578 8C8F0004 */        lw $t7, 4($a0)
  /* 15171C 8013257C 00C04025 */        or $t0, $a2, $zero
  .L80132580:
  /* 151720 80132580 8C8F0004 */        lw $t7, 4($a0)
  .L80132584:
  /* 151724 80132584 00087080 */       sll $t6, $t0, 2
  /* 151728 80132588 00AEC021 */      addu $t8, $a1, $t6
  /* 15172C 8013258C 11E00007 */      beqz $t7, .L801325AC
  /* 151730 80132590 00A37821 */      addu $t7, $a1, $v1
  /* 151734 80132594 8DEE0004 */        lw $t6, 4($t7)
  /* 151738 80132598 8F190000 */        lw $t9, ($t8)
  /* 15173C 8013259C 032E082A */       slt $at, $t9, $t6
  /* 151740 801325A0 50200003 */      beql $at, $zero, .L801325B0
  /* 151744 801325A4 8C980008 */        lw $t8, 8($a0)
  /* 151748 801325A8 24C80001 */     addiu $t0, $a2, 1
  .L801325AC:
  /* 15174C 801325AC 8C980008 */        lw $t8, 8($a0)
  .L801325B0:
  /* 151750 801325B0 00087880 */       sll $t7, $t0, 2
  /* 151754 801325B4 00AFC821 */      addu $t9, $a1, $t7
  /* 151758 801325B8 13000007 */      beqz $t8, .L801325D8
  /* 15175C 801325BC 00A3C021 */      addu $t8, $a1, $v1
  /* 151760 801325C0 8F0F0008 */        lw $t7, 8($t8)
  /* 151764 801325C4 8F2E0000 */        lw $t6, ($t9)
  /* 151768 801325C8 01CF082A */       slt $at, $t6, $t7
  /* 15176C 801325CC 50200003 */      beql $at, $zero, .L801325DC
  /* 151770 801325D0 8C99000C */        lw $t9, 0xc($a0)
  /* 151774 801325D4 24C80002 */     addiu $t0, $a2, 2
  .L801325D8:
  /* 151778 801325D8 8C99000C */        lw $t9, 0xc($a0)
  .L801325DC:
  /* 15177C 801325DC 0008C080 */       sll $t8, $t0, 2
  /* 151780 801325E0 00B87021 */      addu $t6, $a1, $t8
  /* 151784 801325E4 13200008 */      beqz $t9, .L80132608
  /* 151788 801325E8 24840010 */     addiu $a0, $a0, 0x10
  /* 15178C 801325EC 00A3C821 */      addu $t9, $a1, $v1
  /* 151790 801325F0 8F38000C */        lw $t8, 0xc($t9)
  /* 151794 801325F4 8DCF0000 */        lw $t7, ($t6)
  /* 151798 801325F8 01F8082A */       slt $at, $t7, $t8
  /* 15179C 801325FC 50200003 */      beql $at, $zero, .L8013260C
  /* 1517A0 80132600 24C60004 */     addiu $a2, $a2, 4
  /* 1517A4 80132604 24C80003 */     addiu $t0, $a2, 3
  .L80132608:
  /* 1517A8 80132608 24C60004 */     addiu $a2, $a2, 4
  .L8013260C:
  /* 1517AC 8013260C 14DFFFD1 */       bne $a2, $ra, .L80132554
  /* 1517B0 80132610 24630010 */     addiu $v1, $v1, 0x10
  .L80132614:
  /* 1517B4 80132614 250D0001 */     addiu $t5, $t0, 1
  /* 1517B8 80132618 01A03025 */        or $a2, $t5, $zero
  .L8013261C:
  /* 1517BC 8013261C 29A10004 */      slti $at, $t5, 4
  /* 1517C0 80132620 27A5005C */     addiu $a1, $sp, 0x5c
  /* 1517C4 80132624 241F0004 */     addiu $ra, $zero, 4
  /* 1517C8 80132628 1020005D */      beqz $at, .L801327A0
  /* 1517CC 8013262C 00005025 */        or $t2, $zero, $zero
  /* 1517D0 80132630 240E0004 */     addiu $t6, $zero, 4
  /* 1517D4 80132634 01CD6023 */      subu $t4, $t6, $t5
  /* 1517D8 80132638 318C0003 */      andi $t4, $t4, 3
  /* 1517DC 8013263C 11800018 */      beqz $t4, .L801326A0
  /* 1517E0 80132640 018D5821 */      addu $t3, $t4, $t5
  /* 1517E4 80132644 00061880 */       sll $v1, $a2, 2
  /* 1517E8 80132648 27B9006C */     addiu $t9, $sp, 0x6c
  /* 1517EC 8013264C 00792021 */      addu $a0, $v1, $t9
  /* 1517F0 80132650 27A70048 */     addiu $a3, $sp, 0x48
  .L80132654:
  /* 1517F4 80132654 8C8F0000 */        lw $t7, ($a0)
  /* 1517F8 80132658 24C60001 */     addiu $a2, $a2, 1
  /* 1517FC 8013265C 24840004 */     addiu $a0, $a0, 4
  /* 151800 80132660 11E0000C */      beqz $t7, .L80132694
  /* 151804 80132664 00081080 */       sll $v0, $t0, 2
  /* 151808 80132668 00A2C021 */      addu $t8, $a1, $v0
  /* 15180C 8013266C 00A3C821 */      addu $t9, $a1, $v1
  /* 151810 80132670 8F2F0000 */        lw $t7, ($t9)
  /* 151814 80132674 8F0E0000 */        lw $t6, ($t8)
  /* 151818 80132678 00E3C021 */      addu $t8, $a3, $v1
  /* 15181C 8013267C 00E2C821 */      addu $t9, $a3, $v0
  /* 151820 80132680 15CF0004 */       bne $t6, $t7, .L80132694
  /* 151824 80132684 00000000 */       nop
  /* 151828 80132688 AF090000 */        sw $t1, ($t8)
  /* 15182C 8013268C AF290000 */        sw $t1, ($t9)
  /* 151830 80132690 01205025 */        or $t2, $t1, $zero
  .L80132694:
  /* 151834 80132694 1566FFEF */       bne $t3, $a2, .L80132654
  /* 151838 80132698 24630004 */     addiu $v1, $v1, 4
  /* 15183C 8013269C 10DF0040 */       beq $a2, $ra, .L801327A0
  .L801326A0:
  /* 151840 801326A0 00061880 */       sll $v1, $a2, 2
  /* 151844 801326A4 27AE006C */     addiu $t6, $sp, 0x6c
  /* 151848 801326A8 006E2021 */      addu $a0, $v1, $t6
  /* 15184C 801326AC 27A6007C */     addiu $a2, $sp, 0x7c
  /* 151850 801326B0 27A70048 */     addiu $a3, $sp, 0x48
  .L801326B4:
  /* 151854 801326B4 8C8F0000 */        lw $t7, ($a0)
  /* 151858 801326B8 00081080 */       sll $v0, $t0, 2
  /* 15185C 801326BC 00A2C021 */      addu $t8, $a1, $v0
  /* 151860 801326C0 11E0000A */      beqz $t7, .L801326EC
  /* 151864 801326C4 00A37021 */      addu $t6, $a1, $v1
  /* 151868 801326C8 8F190000 */        lw $t9, ($t8)
  /* 15186C 801326CC 8DCF0000 */        lw $t7, ($t6)
  /* 151870 801326D0 00E27021 */      addu $t6, $a3, $v0
  /* 151874 801326D4 00E3C021 */      addu $t8, $a3, $v1
  /* 151878 801326D8 572F0005 */      bnel $t9, $t7, .L801326F0
  /* 15187C 801326DC 8C990004 */        lw $t9, 4($a0)
  /* 151880 801326E0 AF090000 */        sw $t1, ($t8)
  /* 151884 801326E4 ADC90000 */        sw $t1, ($t6)
  /* 151888 801326E8 01205025 */        or $t2, $t1, $zero
  .L801326EC:
  /* 15188C 801326EC 8C990004 */        lw $t9, 4($a0)
  .L801326F0:
  /* 151890 801326F0 00081080 */       sll $v0, $t0, 2
  /* 151894 801326F4 00A27821 */      addu $t7, $a1, $v0
  /* 151898 801326F8 1320000A */      beqz $t9, .L80132724
  /* 15189C 801326FC 00A37021 */      addu $t6, $a1, $v1
  /* 1518A0 80132700 8DF80000 */        lw $t8, ($t7)
  /* 1518A4 80132704 8DD90004 */        lw $t9, 4($t6)
  /* 1518A8 80132708 00E27021 */      addu $t6, $a3, $v0
  /* 1518AC 8013270C 00E37821 */      addu $t7, $a3, $v1
  /* 1518B0 80132710 57190005 */      bnel $t8, $t9, .L80132728
  /* 1518B4 80132714 8C980008 */        lw $t8, 8($a0)
  /* 1518B8 80132718 ADE90004 */        sw $t1, 4($t7)
  /* 1518BC 8013271C ADC90000 */        sw $t1, ($t6)
  /* 1518C0 80132720 01205025 */        or $t2, $t1, $zero
  .L80132724:
  /* 1518C4 80132724 8C980008 */        lw $t8, 8($a0)
  .L80132728:
  /* 1518C8 80132728 00081080 */       sll $v0, $t0, 2
  /* 1518CC 8013272C 00A2C821 */      addu $t9, $a1, $v0
  /* 1518D0 80132730 1300000A */      beqz $t8, .L8013275C
  /* 1518D4 80132734 00A37021 */      addu $t6, $a1, $v1
  /* 1518D8 80132738 8F2F0000 */        lw $t7, ($t9)
  /* 1518DC 8013273C 8DD80008 */        lw $t8, 8($t6)
  /* 1518E0 80132740 00E27021 */      addu $t6, $a3, $v0
  /* 1518E4 80132744 00E3C821 */      addu $t9, $a3, $v1
  /* 1518E8 80132748 55F80005 */      bnel $t7, $t8, .L80132760
  /* 1518EC 8013274C 8C8F000C */        lw $t7, 0xc($a0)
  /* 1518F0 80132750 AF290008 */        sw $t1, 8($t9)
  /* 1518F4 80132754 ADC90000 */        sw $t1, ($t6)
  /* 1518F8 80132758 01205025 */        or $t2, $t1, $zero
  .L8013275C:
  /* 1518FC 8013275C 8C8F000C */        lw $t7, 0xc($a0)
  .L80132760:
  /* 151900 80132760 00081080 */       sll $v0, $t0, 2
  /* 151904 80132764 00A2C021 */      addu $t8, $a1, $v0
  /* 151908 80132768 11E0000B */      beqz $t7, .L80132798
  /* 15190C 8013276C 24840010 */     addiu $a0, $a0, 0x10
  /* 151910 80132770 00A37021 */      addu $t6, $a1, $v1
  /* 151914 80132774 8DCF000C */        lw $t7, 0xc($t6)
  /* 151918 80132778 8F190000 */        lw $t9, ($t8)
  /* 15191C 8013277C 00E3C021 */      addu $t8, $a3, $v1
  /* 151920 80132780 00E27021 */      addu $t6, $a3, $v0
  /* 151924 80132784 172F0004 */       bne $t9, $t7, .L80132798
  /* 151928 80132788 00000000 */       nop
  /* 15192C 8013278C AF09000C */        sw $t1, 0xc($t8)
  /* 151930 80132790 ADC90000 */        sw $t1, ($t6)
  /* 151934 80132794 01205025 */        or $t2, $t1, $zero
  .L80132798:
  /* 151938 80132798 1486FFC6 */       bne $a0, $a2, .L801326B4
  /* 15193C 8013279C 24630010 */     addiu $v1, $v1, 0x10
  .L801327A0:
  /* 151940 801327A0 1140009D */      beqz $t2, .L80132A18
  /* 151944 801327A4 29A10004 */      slti $at, $t5, 4
  /* 151948 801327A8 10200051 */      beqz $at, .L801328F0
  /* 15194C 801327AC 01A03025 */        or $a2, $t5, $zero
  /* 151950 801327B0 24190004 */     addiu $t9, $zero, 4
  /* 151954 801327B4 032D6023 */      subu $t4, $t9, $t5
  /* 151958 801327B8 318C0003 */      andi $t4, $t4, 3
  /* 15195C 801327BC 11800016 */      beqz $t4, .L80132818
  /* 151960 801327C0 018D2821 */      addu $a1, $t4, $t5
  /* 151964 801327C4 00061880 */       sll $v1, $a2, 2
  /* 151968 801327C8 27AF0048 */     addiu $t7, $sp, 0x48
  /* 15196C 801327CC 3C048014 */       lui $a0, %hi(gMNResultsKOs)
  /* 151970 801327D0 24849B80 */     addiu $a0, $a0, %lo(gMNResultsKOs)
  /* 151974 801327D4 006F1021 */      addu $v0, $v1, $t7
  .L801327D8:
  /* 151978 801327D8 8C580000 */        lw $t8, ($v0) # gMNResultsIsPresent + 0
  /* 15197C 801327DC 00087080 */       sll $t6, $t0, 2
  /* 151980 801327E0 008EC821 */      addu $t9, $a0, $t6
  /* 151984 801327E4 13000008 */      beqz $t8, .L80132808
  /* 151988 801327E8 24420004 */     addiu $v0, $v0, 4
  /* 15198C 801327EC 0083C021 */      addu $t8, $a0, $v1
  /* 151990 801327F0 8F0E0000 */        lw $t6, ($t8)
  /* 151994 801327F4 8F2F0000 */        lw $t7, ($t9)
  /* 151998 801327F8 01EE082A */       slt $at, $t7, $t6
  /* 15199C 801327FC 50200003 */      beql $at, $zero, .L8013280C
  /* 1519A0 80132800 24C60001 */     addiu $a2, $a2, 1
  /* 1519A4 80132804 00C04025 */        or $t0, $a2, $zero
  .L80132808:
  /* 1519A8 80132808 24C60001 */     addiu $a2, $a2, 1
  .L8013280C:
  /* 1519AC 8013280C 14A6FFF2 */       bne $a1, $a2, .L801327D8
  /* 1519B0 80132810 24630004 */     addiu $v1, $v1, 4
  /* 1519B4 80132814 10DF0035 */       beq $a2, $ra, .L801328EC
  .L80132818:
  /* 1519B8 80132818 3C048014 */       lui $a0, %hi(gMNResultsKOs)
  /* 1519BC 8013281C 00061880 */       sll $v1, $a2, 2
  /* 1519C0 80132820 27B90048 */     addiu $t9, $sp, 0x48
  /* 1519C4 80132824 00791021 */      addu $v0, $v1, $t9
  /* 1519C8 80132828 24849B80 */     addiu $a0, $a0, %lo(gMNResultsKOs)
  .L8013282C:
  /* 1519CC 8013282C 8C580000 */        lw $t8, ($v0) # gMNResultsIsPresent + 0
  /* 1519D0 80132830 00087880 */       sll $t7, $t0, 2
  /* 1519D4 80132834 008F7021 */      addu $t6, $a0, $t7
  /* 1519D8 80132838 13000007 */      beqz $t8, .L80132858
  /* 1519DC 8013283C 0083C021 */      addu $t8, $a0, $v1
  /* 1519E0 80132840 8F0F0000 */        lw $t7, ($t8)
  /* 1519E4 80132844 8DD90000 */        lw $t9, ($t6)
  /* 1519E8 80132848 032F082A */       slt $at, $t9, $t7
  /* 1519EC 8013284C 50200003 */      beql $at, $zero, .L8013285C
  /* 1519F0 80132850 8C4E0004 */        lw $t6, 4($v0) # gMNResultsIsPresent + 4
  /* 1519F4 80132854 00C04025 */        or $t0, $a2, $zero
  .L80132858:
  /* 1519F8 80132858 8C4E0004 */        lw $t6, 4($v0) # gMNResultsIsPresent + 4
  .L8013285C:
  /* 1519FC 8013285C 0008C080 */       sll $t8, $t0, 2
  /* 151A00 80132860 0098C821 */      addu $t9, $a0, $t8
  /* 151A04 80132864 11C00007 */      beqz $t6, .L80132884
  /* 151A08 80132868 00837021 */      addu $t6, $a0, $v1
  /* 151A0C 8013286C 8DD80004 */        lw $t8, 4($t6)
  /* 151A10 80132870 8F2F0000 */        lw $t7, ($t9)
  /* 151A14 80132874 01F8082A */       slt $at, $t7, $t8
  /* 151A18 80132878 50200003 */      beql $at, $zero, .L80132888
  /* 151A1C 8013287C 8C590008 */        lw $t9, 8($v0) # gMNResultsIsPresent + 8
  /* 151A20 80132880 24C80001 */     addiu $t0, $a2, 1
  .L80132884:
  /* 151A24 80132884 8C590008 */        lw $t9, 8($v0) # gMNResultsIsPresent + 8
  .L80132888:
  /* 151A28 80132888 00087080 */       sll $t6, $t0, 2
  /* 151A2C 8013288C 008E7821 */      addu $t7, $a0, $t6
  /* 151A30 80132890 13200007 */      beqz $t9, .L801328B0
  /* 151A34 80132894 0083C821 */      addu $t9, $a0, $v1
  /* 151A38 80132898 8F2E0008 */        lw $t6, 8($t9)
  /* 151A3C 8013289C 8DF80000 */        lw $t8, ($t7)
  /* 151A40 801328A0 030E082A */       slt $at, $t8, $t6
  /* 151A44 801328A4 50200003 */      beql $at, $zero, .L801328B4
  /* 151A48 801328A8 8C4F000C */        lw $t7, 0xc($v0) # gMNResultsIsPresent + 12
  /* 151A4C 801328AC 24C80002 */     addiu $t0, $a2, 2
  .L801328B0:
  /* 151A50 801328B0 8C4F000C */        lw $t7, 0xc($v0) # gMNResultsIsPresent + 12
  .L801328B4:
  /* 151A54 801328B4 0008C880 */       sll $t9, $t0, 2
  /* 151A58 801328B8 0099C021 */      addu $t8, $a0, $t9
  /* 151A5C 801328BC 11E00008 */      beqz $t7, .L801328E0
  /* 151A60 801328C0 24420010 */     addiu $v0, $v0, 0x10
  /* 151A64 801328C4 00837821 */      addu $t7, $a0, $v1
  /* 151A68 801328C8 8DF9000C */        lw $t9, 0xc($t7)
  /* 151A6C 801328CC 8F0E0000 */        lw $t6, ($t8)
  /* 151A70 801328D0 01D9082A */       slt $at, $t6, $t9
  /* 151A74 801328D4 50200003 */      beql $at, $zero, .L801328E4
  /* 151A78 801328D8 24C60004 */     addiu $a2, $a2, 4
  /* 151A7C 801328DC 24C80003 */     addiu $t0, $a2, 3
  .L801328E0:
  /* 151A80 801328E0 24C60004 */     addiu $a2, $a2, 4
  .L801328E4:
  /* 151A84 801328E4 14DFFFD1 */       bne $a2, $ra, .L8013282C
  /* 151A88 801328E8 24630010 */     addiu $v1, $v1, 0x10
  .L801328EC:
  /* 151A8C 801328EC 250D0001 */     addiu $t5, $t0, 1
  .L801328F0:
  /* 151A90 801328F0 3C028014 */       lui $v0, %hi(gMNResultsIsSharedWinner)
  /* 151A94 801328F4 3C038014 */       lui $v1, %hi(D_ovl31_80139C30)
  /* 151A98 801328F8 24639C30 */     addiu $v1, $v1, %lo(D_ovl31_80139C30)
  /* 151A9C 801328FC 24429C20 */     addiu $v0, $v0, %lo(gMNResultsIsSharedWinner)
  .L80132900:
  /* 151AA0 80132900 24420004 */     addiu $v0, $v0, 4
  /* 151AA4 80132904 0043082B */      sltu $at, $v0, $v1
  /* 151AA8 80132908 1420FFFD */      bnez $at, .L80132900
  /* 151AAC 8013290C AC40FFFC */        sw $zero, -4($v0) # gMNResultsIsSharedWinner + -4
  /* 151AB0 80132910 29A10004 */      slti $at, $t5, 4
  /* 151AB4 80132914 10200040 */      beqz $at, .L80132A18
  /* 151AB8 80132918 01A03025 */        or $a2, $t5, $zero
  /* 151ABC 8013291C 3C188014 */       lui $t8, %hi(gMNResultsKOs)
  /* 151AC0 80132920 240E0004 */     addiu $t6, $zero, 4
  /* 151AC4 80132924 01CD6023 */      subu $t4, $t6, $t5
  /* 151AC8 80132928 27189B80 */     addiu $t8, $t8, %lo(gMNResultsKOs)
  /* 151ACC 8013292C 00081080 */       sll $v0, $t0, 2
  /* 151AD0 80132930 00587821 */      addu $t7, $v0, $t8
  /* 151AD4 80132934 318C0003 */      andi $t4, $t4, 3
  /* 151AD8 80132938 11800011 */      beqz $t4, .L80132980
  /* 151ADC 8013293C 8DE70000 */        lw $a3, ($t7)
  /* 151AE0 80132940 000D1880 */       sll $v1, $t5, 2
  /* 151AE4 80132944 3C058014 */       lui $a1, %hi(gMNResultsIsSharedWinner)
  /* 151AE8 80132948 24A59C20 */     addiu $a1, $a1, %lo(gMNResultsIsSharedWinner)
  /* 151AEC 8013294C 00782021 */      addu $a0, $v1, $t8
  /* 151AF0 80132950 018D5021 */      addu $t2, $t4, $t5
  .L80132954:
  /* 151AF4 80132954 8C990000 */        lw $t9, ($a0) # gMNResultsKOs + 0
  /* 151AF8 80132958 24C60001 */     addiu $a2, $a2, 1
  /* 151AFC 8013295C 24840004 */     addiu $a0, $a0, 4
  /* 151B00 80132960 14F90004 */       bne $a3, $t9, .L80132974
  /* 151B04 80132964 00A37821 */      addu $t7, $a1, $v1
  /* 151B08 80132968 ADE90000 */        sw $t1, ($t7)
  /* 151B0C 8013296C 00A27021 */      addu $t6, $a1, $v0
  /* 151B10 80132970 ADC90000 */        sw $t1, ($t6)
  .L80132974:
  /* 151B14 80132974 1546FFF7 */       bne $t2, $a2, .L80132954
  /* 151B18 80132978 24630004 */     addiu $v1, $v1, 4
  /* 151B1C 8013297C 10DF0026 */       beq $a2, $ra, .L80132A18
  .L80132980:
  /* 151B20 80132980 00061880 */       sll $v1, $a2, 2
  /* 151B24 80132984 3C188014 */       lui $t8, %hi(gMNResultsKOs)
  /* 151B28 80132988 27189B80 */     addiu $t8, $t8, %lo(gMNResultsKOs)
  /* 151B2C 8013298C 3C068014 */       lui $a2, %hi(gMNResultsTKOs)
  /* 151B30 80132990 3C058014 */       lui $a1, %hi(gMNResultsIsSharedWinner)
  /* 151B34 80132994 24A59C20 */     addiu $a1, $a1, %lo(gMNResultsIsSharedWinner)
  /* 151B38 80132998 24C69B90 */     addiu $a2, $a2, %lo(gMNResultsTKOs)
  /* 151B3C 8013299C 00782021 */      addu $a0, $v1, $t8
  .L801329A0:
  /* 151B40 801329A0 8C990000 */        lw $t9, ($a0) # gMNResultsKOs + 0
  /* 151B44 801329A4 00A37821 */      addu $t7, $a1, $v1
  /* 151B48 801329A8 00A27021 */      addu $t6, $a1, $v0
  /* 151B4C 801329AC 54F90004 */      bnel $a3, $t9, .L801329C0
  /* 151B50 801329B0 8C980004 */        lw $t8, 4($a0) # gMNResultsKOs + 4
  /* 151B54 801329B4 ADE90000 */        sw $t1, ($t7)
  /* 151B58 801329B8 ADC90000 */        sw $t1, ($t6)
  /* 151B5C 801329BC 8C980004 */        lw $t8, 4($a0) # gMNResultsKOs + 4
  .L801329C0:
  /* 151B60 801329C0 00A3C821 */      addu $t9, $a1, $v1
  /* 151B64 801329C4 00A27821 */      addu $t7, $a1, $v0
  /* 151B68 801329C8 54F80004 */      bnel $a3, $t8, .L801329DC
  /* 151B6C 801329CC 8C8E0008 */        lw $t6, 8($a0) # gMNResultsKOs + 8
  /* 151B70 801329D0 AF290004 */        sw $t1, 4($t9)
  /* 151B74 801329D4 ADE90000 */        sw $t1, ($t7)
  /* 151B78 801329D8 8C8E0008 */        lw $t6, 8($a0) # gMNResultsKOs + 8
  .L801329DC:
  /* 151B7C 801329DC 00A3C021 */      addu $t8, $a1, $v1
  /* 151B80 801329E0 00A2C821 */      addu $t9, $a1, $v0
  /* 151B84 801329E4 54EE0004 */      bnel $a3, $t6, .L801329F8
  /* 151B88 801329E8 8C8F000C */        lw $t7, 0xc($a0) # gMNResultsKOs + 12
  /* 151B8C 801329EC AF090008 */        sw $t1, 8($t8)
  /* 151B90 801329F0 AF290000 */        sw $t1, ($t9)
  /* 151B94 801329F4 8C8F000C */        lw $t7, 0xc($a0) # gMNResultsKOs + 12
  .L801329F8:
  /* 151B98 801329F8 24840010 */     addiu $a0, $a0, 0x10
  /* 151B9C 801329FC 00A37021 */      addu $t6, $a1, $v1
  /* 151BA0 80132A00 14EF0003 */       bne $a3, $t7, .L80132A10
  /* 151BA4 80132A04 00A2C021 */      addu $t8, $a1, $v0
  /* 151BA8 80132A08 ADC9000C */        sw $t1, 0xc($t6)
  /* 151BAC 80132A0C AF090000 */        sw $t1, ($t8)
  .L80132A10:
  /* 151BB0 80132A10 1486FFE3 */       bne $a0, $a2, .L801329A0
  /* 151BB4 80132A14 24630010 */     addiu $v1, $v1, 0x10
  .L80132A18:
  /* 151BB8 80132A18 01001025 */        or $v0, $t0, $zero
  .L80132A1C:
  /* 151BBC 80132A1C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132A20:
  /* 151BC0 80132A20 27BD0080 */     addiu $sp, $sp, 0x80
  /* 151BC4 80132A24 03E00008 */        jr $ra
  /* 151BC8 80132A28 00000000 */       nop

glabel mnResultsGetWinningTeam
  /* 151BCC 80132A2C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 151BD0 80132A30 AFBF0014 */        sw $ra, 0x14($sp)
  /* 151BD4 80132A34 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 151BD8 80132A38 00000000 */       nop
  /* 151BDC 80132A3C 000270C0 */       sll $t6, $v0, 3
  /* 151BE0 80132A40 01C27023 */      subu $t6, $t6, $v0
  /* 151BE4 80132A44 000E7080 */       sll $t6, $t6, 2
  /* 151BE8 80132A48 01C27021 */      addu $t6, $t6, $v0
  /* 151BEC 80132A4C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 151BF0 80132A50 000E7080 */       sll $t6, $t6, 2
  /* 151BF4 80132A54 3C02800A */       lui $v0, %hi((gTransferBattleState + 0x24))
  /* 151BF8 80132A58 004E1021 */      addu $v0, $v0, $t6
  /* 151BFC 80132A5C 90424D2C */       lbu $v0, %lo((gTransferBattleState + 0x24))($v0)
  /* 151C00 80132A60 03E00008 */        jr $ra
  /* 151C04 80132A64 27BD0018 */     addiu $sp, $sp, 0x18

glabel mnResultsAnimateLogo
  /* 151C08 80132A68 3C0E8014 */       lui $t6, %hi(gMNResultsFramesElapsed)
  /* 151C0C 80132A6C 8DCE9B78 */        lw $t6, %lo(gMNResultsFramesElapsed)($t6)
  /* 151C10 80132A70 29C10028 */      slti $at, $t6, 0x28
  /* 151C14 80132A74 14200028 */      bnez $at, .L80132B18
  /* 151C18 80132A78 00000000 */       nop
  /* 151C1C 80132A7C 8C820074 */        lw $v0, 0x74($a0)
  /* 151C20 80132A80 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 151C24 80132A84 44816000 */      mtc1 $at, $f12 # 10.0 to cop1
  /* 151C28 80132A88 C4400040 */      lwc1 $f0, 0x40($v0)
  /* 151C2C 80132A8C 3C018014 */       lui $at, 0x8014
  /* 151C30 80132A90 4600603C */    c.lt.s $f12, $f0
  /* 151C34 80132A94 00000000 */       nop
  /* 151C38 80132A98 4502000D */     bc1fl .L80132AD0
  /* 151C3C 80132A9C 3C01447A */       lui $at, %hi(D_NF_44799860)
  /* 151C40 80132AA0 C4249860 */      lwc1 $f4, %lo(D_NF_44799860)($at)
  /* 151C44 80132AA4 46040081 */     sub.s $f2, $f0, $f4
  /* 151C48 80132AA8 460C103C */    c.lt.s $f2, $f12
  /* 151C4C 80132AAC 00000000 */       nop
  /* 151C50 80132AB0 45020003 */     bc1fl .L80132AC0
  /* 151C54 80132AB4 E4420040 */      swc1 $f2, 0x40($v0)
  /* 151C58 80132AB8 46006086 */     mov.s $f2, $f12
  /* 151C5C 80132ABC E4420040 */      swc1 $f2, 0x40($v0)
  .L80132AC0:
  /* 151C60 80132AC0 8C8F0074 */        lw $t7, 0x74($a0)
  /* 151C64 80132AC4 E5E20044 */      swc1 $f2, 0x44($t7)
  /* 151C68 80132AC8 8C820074 */        lw $v0, 0x74($a0)
  /* 151C6C 80132ACC 3C01447A */       lui $at, (0x447A0000 >> 16) # 1000.0
  .L80132AD0:
  /* 151C70 80132AD0 44811000 */      mtc1 $at, $f2 # 1000.0 to cop1
  /* 151C74 80132AD4 C4400020 */      lwc1 $f0, 0x20($v0)
  /* 151C78 80132AD8 3C014130 */       lui $at, (0x41300000 >> 16) # 11.0
  /* 151C7C 80132ADC 4602003C */    c.lt.s $f0, $f2
  /* 151C80 80132AE0 00000000 */       nop
  /* 151C84 80132AE4 4500000C */      bc1f .L80132B18
  /* 151C88 80132AE8 00000000 */       nop
  /* 151C8C 80132AEC 44813000 */      mtc1 $at, $f6 # 11.0 to cop1
  /* 151C90 80132AF0 00000000 */       nop
  /* 151C94 80132AF4 46060200 */     add.s $f8, $f0, $f6
  /* 151C98 80132AF8 E4480020 */      swc1 $f8, 0x20($v0)
  /* 151C9C 80132AFC 8C820074 */        lw $v0, 0x74($a0)
  /* 151CA0 80132B00 C44A0020 */      lwc1 $f10, 0x20($v0)
  /* 151CA4 80132B04 460A103C */    c.lt.s $f2, $f10
  /* 151CA8 80132B08 00000000 */       nop
  /* 151CAC 80132B0C 45000002 */      bc1f .L80132B18
  /* 151CB0 80132B10 00000000 */       nop
  /* 151CB4 80132B14 E4420020 */      swc1 $f2, 0x20($v0)
  .L80132B18:
  /* 151CB8 80132B18 03E00008 */        jr $ra
  /* 151CBC 80132B1C 00000000 */       nop

glabel mnResultsCreateLogo
  /* 151CC0 80132B20 27BDFF20 */     addiu $sp, $sp, -0xe0
  /* 151CC4 80132B24 3C0F8014 */       lui $t7, %hi(dMNResultsLogoOffsets)
  /* 151CC8 80132B28 25EF8FE4 */     addiu $t7, $t7, %lo(dMNResultsLogoOffsets)
  /* 151CCC 80132B2C AFBF0024 */        sw $ra, 0x24($sp)
  /* 151CD0 80132B30 AFB00020 */        sw $s0, 0x20($sp)
  /* 151CD4 80132B34 25E80030 */     addiu $t0, $t7, 0x30
  /* 151CD8 80132B38 27AE00A0 */     addiu $t6, $sp, 0xa0
  .L80132B3C:
  /* 151CDC 80132B3C 8DF90000 */        lw $t9, ($t7) # dMNResultsLogoOffsets + 0
  /* 151CE0 80132B40 25EF000C */     addiu $t7, $t7, 0xc
  /* 151CE4 80132B44 25CE000C */     addiu $t6, $t6, 0xc
  /* 151CE8 80132B48 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 151CEC 80132B4C 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsLogoOffsets + -8
  /* 151CF0 80132B50 ADD8FFF8 */        sw $t8, -8($t6)
  /* 151CF4 80132B54 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsLogoOffsets + -4
  /* 151CF8 80132B58 15E8FFF8 */       bne $t7, $t0, .L80132B3C
  /* 151CFC 80132B5C ADD9FFFC */        sw $t9, -4($t6)
  /* 151D00 80132B60 3C0A8014 */       lui $t2, %hi(dMNResultsLogoZoomAnimOffsets)
  /* 151D04 80132B64 254A9014 */     addiu $t2, $t2, %lo(dMNResultsLogoZoomAnimOffsets)
  /* 151D08 80132B68 254D0030 */     addiu $t5, $t2, 0x30
  /* 151D0C 80132B6C 27A90070 */     addiu $t1, $sp, 0x70
  .L80132B70:
  /* 151D10 80132B70 8D4C0000 */        lw $t4, ($t2) # dMNResultsLogoZoomAnimOffsets + 0
  /* 151D14 80132B74 254A000C */     addiu $t2, $t2, 0xc
  /* 151D18 80132B78 2529000C */     addiu $t1, $t1, 0xc
  /* 151D1C 80132B7C AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 151D20 80132B80 8D4BFFF8 */        lw $t3, -8($t2) # dMNResultsLogoZoomAnimOffsets + -8
  /* 151D24 80132B84 AD2BFFF8 */        sw $t3, -8($t1)
  /* 151D28 80132B88 8D4CFFFC */        lw $t4, -4($t2) # dMNResultsLogoZoomAnimOffsets + -4
  /* 151D2C 80132B8C 154DFFF8 */       bne $t2, $t5, .L80132B70
  /* 151D30 80132B90 AD2CFFFC */        sw $t4, -4($t1)
  /* 151D34 80132B94 3C0F8014 */       lui $t7, %hi(dMNResultsLogoColorAnimOffsets)
  /* 151D38 80132B98 25EF9044 */     addiu $t7, $t7, %lo(dMNResultsLogoColorAnimOffsets)
  /* 151D3C 80132B9C 25F90030 */     addiu $t9, $t7, 0x30
  /* 151D40 80132BA0 27A80040 */     addiu $t0, $sp, 0x40
  .L80132BA4:
  /* 151D44 80132BA4 8DF80000 */        lw $t8, ($t7) # dMNResultsLogoColorAnimOffsets + 0
  /* 151D48 80132BA8 25EF000C */     addiu $t7, $t7, 0xc
  /* 151D4C 80132BAC 2508000C */     addiu $t0, $t0, 0xc
  /* 151D50 80132BB0 AD18FFF4 */        sw $t8, -0xc($t0)
  /* 151D54 80132BB4 8DEEFFF8 */        lw $t6, -8($t7) # dMNResultsLogoColorAnimOffsets + -8
  /* 151D58 80132BB8 AD0EFFF8 */        sw $t6, -8($t0)
  /* 151D5C 80132BBC 8DF8FFFC */        lw $t8, -4($t7) # dMNResultsLogoColorAnimOffsets + -4
  /* 151D60 80132BC0 15F9FFF8 */       bne $t7, $t9, .L80132BA4
  /* 151D64 80132BC4 AD18FFFC */        sw $t8, -4($t0)
  /* 151D68 80132BC8 3C0A8014 */       lui $t2, %hi(dMNResultsTeamColorIndexes)
  /* 151D6C 80132BCC 254A9074 */     addiu $t2, $t2, %lo(dMNResultsTeamColorIndexes)
  /* 151D70 80132BD0 8D4B0000 */        lw $t3, ($t2) # dMNResultsTeamColorIndexes + 0
  /* 151D74 80132BD4 27AD0034 */     addiu $t5, $sp, 0x34
  /* 151D78 80132BD8 8D490004 */        lw $t1, 4($t2) # dMNResultsTeamColorIndexes + 4
  /* 151D7C 80132BDC ADAB0000 */        sw $t3, ($t5)
  /* 151D80 80132BE0 8D4B0008 */        lw $t3, 8($t2) # dMNResultsTeamColorIndexes + 8
  /* 151D84 80132BE4 3C038014 */       lui $v1, %hi(gMNResultsIsTeamBattle)
  /* 151D88 80132BE8 ADA90004 */        sw $t1, 4($t5)
  /* 151D8C 80132BEC ADAB0008 */        sw $t3, 8($t5)
  /* 151D90 80132BF0 90639C14 */       lbu $v1, %lo(gMNResultsIsTeamBattle)($v1)
  /* 151D94 80132BF4 5460000B */      bnel $v1, $zero, .L80132C24
  /* 151D98 80132BF8 24010001 */     addiu $at, $zero, 1
  /* 151D9C 80132BFC 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 151DA0 80132C00 00000000 */       nop
  /* 151DA4 80132C04 00408025 */        or $s0, $v0, $zero
  /* 151DA8 80132C08 0C04CC52 */       jal mnResultsGetFtKind
  /* 151DAC 80132C0C 00402025 */        or $a0, $v0, $zero
  /* 151DB0 80132C10 3C038014 */       lui $v1, %hi(gMNResultsIsTeamBattle)
  /* 151DB4 80132C14 AFA200D4 */        sw $v0, 0xd4($sp)
  /* 151DB8 80132C18 90639C14 */       lbu $v1, %lo(gMNResultsIsTeamBattle)($v1)
  /* 151DBC 80132C1C AFB000D0 */        sw $s0, 0xd0($sp)
  /* 151DC0 80132C20 24010001 */     addiu $at, $zero, 1
  .L80132C24:
  /* 151DC4 80132C24 5461000C */      bnel $v1, $at, .L80132C58
  /* 151DC8 80132C28 00002025 */        or $a0, $zero, $zero
  /* 151DCC 80132C2C 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 151DD0 80132C30 00000000 */       nop
  /* 151DD4 80132C34 0C04CC52 */       jal mnResultsGetFtKind
  /* 151DD8 80132C38 00402025 */        or $a0, $v0, $zero
  /* 151DDC 80132C3C 0C04CA8B */       jal mnResultsGetWinningTeam
  /* 151DE0 80132C40 AFA200D4 */        sw $v0, 0xd4($sp)
  /* 151DE4 80132C44 00026080 */       sll $t4, $v0, 2
  /* 151DE8 80132C48 03ACC821 */      addu $t9, $sp, $t4
  /* 151DEC 80132C4C 8F390034 */        lw $t9, 0x34($t9)
  /* 151DF0 80132C50 AFB900D0 */        sw $t9, 0xd0($sp)
  /* 151DF4 80132C54 00002025 */        or $a0, $zero, $zero
  .L80132C58:
  /* 151DF8 80132C58 00002825 */        or $a1, $zero, $zero
  /* 151DFC 80132C5C 24060017 */     addiu $a2, $zero, 0x17
  /* 151E00 80132C60 0C00265A */       jal omMakeGObjSPAfter
  /* 151E04 80132C64 3C078000 */       lui $a3, 0x8000
  /* 151E08 80132C68 8FA300D4 */        lw $v1, 0xd4($sp)
  /* 151E0C 80132C6C 3C088014 */       lui $t0, %hi(D_ovl31_8013A058)
  /* 151E10 80132C70 8D08A058 */        lw $t0, %lo(D_ovl31_8013A058)($t0)
  /* 151E14 80132C74 00031880 */       sll $v1, $v1, 2
  /* 151E18 80132C78 03A37821 */      addu $t7, $sp, $v1
  /* 151E1C 80132C7C 8DEF00A0 */        lw $t7, 0xa0($t7)
  /* 151E20 80132C80 00408025 */        or $s0, $v0, $zero
  /* 151E24 80132C84 AFA30028 */        sw $v1, 0x28($sp)
  /* 151E28 80132C88 00402025 */        or $a0, $v0, $zero
  /* 151E2C 80132C8C 00003025 */        or $a2, $zero, $zero
  /* 151E30 80132C90 0C003C48 */       jal func_8000F120
  /* 151E34 80132C94 01E82821 */      addu $a1, $t7, $t0
  /* 151E38 80132C98 3C058001 */       lui $a1, %hi(odRenderDObjTreeForGObj)
  /* 151E3C 80132C9C 240EFFFF */     addiu $t6, $zero, -1
  /* 151E40 80132CA0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 151E44 80132CA4 24A54038 */     addiu $a1, $a1, %lo(odRenderDObjTreeForGObj)
  /* 151E48 80132CA8 02002025 */        or $a0, $s0, $zero
  /* 151E4C 80132CAC 24060021 */     addiu $a2, $zero, 0x21
  /* 151E50 80132CB0 0C00277D */       jal omAddGObjRenderProc
  /* 151E54 80132CB4 3C078000 */       lui $a3, 0x8000
  /* 151E58 80132CB8 8FB80028 */        lw $t8, 0x28($sp)
  /* 151E5C 80132CBC 3C0A8014 */       lui $t2, %hi(D_ovl31_8013A058)
  /* 151E60 80132CC0 8D4AA058 */        lw $t2, %lo(D_ovl31_8013A058)($t2)
  /* 151E64 80132CC4 03B86821 */      addu $t5, $sp, $t8
  /* 151E68 80132CC8 8DAD0070 */        lw $t5, 0x70($t5)
  /* 151E6C 80132CCC 02002025 */        or $a0, $s0, $zero
  /* 151E70 80132CD0 0C003E3D */       jal func_8000F8F4
  /* 151E74 80132CD4 01AA2821 */      addu $a1, $t5, $t2
  /* 151E78 80132CD8 8FB900D0 */        lw $t9, 0xd0($sp)
  /* 151E7C 80132CDC 8FA90028 */        lw $t1, 0x28($sp)
  /* 151E80 80132CE0 3C0C8014 */       lui $t4, %hi(D_ovl31_8013A058)
  /* 151E84 80132CE4 44992000 */      mtc1 $t9, $f4
  /* 151E88 80132CE8 03A95821 */      addu $t3, $sp, $t1
  /* 151E8C 80132CEC 8D6B0040 */        lw $t3, 0x40($t3)
  /* 151E90 80132CF0 46802120 */   cvt.s.w $f4, $f4
  /* 151E94 80132CF4 8D8CA058 */        lw $t4, %lo(D_ovl31_8013A058)($t4)
  /* 151E98 80132CF8 02002025 */        or $a0, $s0, $zero
  /* 151E9C 80132CFC 016C2821 */      addu $a1, $t3, $t4
  /* 151EA0 80132D00 44062000 */      mfc1 $a2, $f4
  /* 151EA4 80132D04 0C002F8A */       jal func_8000BE28
  /* 151EA8 80132D08 00000000 */       nop
  /* 151EAC 80132D0C 0C0037CD */       jal func_8000DF34
  /* 151EB0 80132D10 02002025 */        or $a0, $s0, $zero
  /* 151EB4 80132D14 3C058013 */       lui $a1, %hi(mnResultsAnimateLogo)
  /* 151EB8 80132D18 24A52A68 */     addiu $a1, $a1, %lo(mnResultsAnimateLogo)
  /* 151EBC 80132D1C 02002025 */        or $a0, $s0, $zero
  /* 151EC0 80132D20 24060001 */     addiu $a2, $zero, 1
  /* 151EC4 80132D24 0C002062 */       jal omAddGObjCommonProc
  /* 151EC8 80132D28 24070001 */     addiu $a3, $zero, 1
  /* 151ECC 80132D2C 44803000 */      mtc1 $zero, $f6
  /* 151ED0 80132D30 8E0F0074 */        lw $t7, 0x74($s0)
  /* 151ED4 80132D34 3C0141C8 */       lui $at, (0x41C80000 >> 16) # 25.0
  /* 151ED8 80132D38 44810000 */      mtc1 $at, $f0 # 25.0 to cop1
  /* 151EDC 80132D3C 3C0142C8 */       lui $at, (0x42C80000 >> 16) # 100.0
  /* 151EE0 80132D40 E5E6001C */      swc1 $f6, 0x1c($t7)
  /* 151EE4 80132D44 8E080074 */        lw $t0, 0x74($s0)
  /* 151EE8 80132D48 44814000 */      mtc1 $at, $f8 # 100.0 to cop1
  /* 151EEC 80132D4C 3C018014 */       lui $at, %hi(D_ovl31_80139864)
  /* 151EF0 80132D50 E5080020 */      swc1 $f8, 0x20($t0)
  /* 151EF4 80132D54 8E0E0074 */        lw $t6, 0x74($s0)
  /* 151EF8 80132D58 C42A9864 */      lwc1 $f10, %lo(D_ovl31_80139864)($at)
  /* 151EFC 80132D5C E5CA0024 */      swc1 $f10, 0x24($t6)
  /* 151F00 80132D60 8E180074 */        lw $t8, 0x74($s0)
  /* 151F04 80132D64 E7000040 */      swc1 $f0, 0x40($t8)
  /* 151F08 80132D68 8E0D0074 */        lw $t5, 0x74($s0)
  /* 151F0C 80132D6C E5A00044 */      swc1 $f0, 0x44($t5)
  /* 151F10 80132D70 8FBF0024 */        lw $ra, 0x24($sp)
  /* 151F14 80132D74 8FB00020 */        lw $s0, 0x20($sp)
  /* 151F18 80132D78 27BD00E0 */     addiu $sp, $sp, 0xe0
  /* 151F1C 80132D7C 03E00008 */        jr $ra
  /* 151F20 80132D80 00000000 */       nop

glabel mnResultsRenderBackground
  /* 151F24 80132D84 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 151F28 80132D88 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 151F2C 80132D8C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 151F30 80132D90 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 151F34 80132D94 AFBF0014 */        sw $ra, 0x14($sp)
  /* 151F38 80132D98 8C850074 */        lw $a1, 0x74($a0)
  /* 151F3C 80132D9C 244E0008 */     addiu $t6, $v0, 8
  /* 151F40 80132DA0 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 151F44 80132DA4 3C0FE700 */       lui $t7, 0xe700
  /* 151F48 80132DA8 AC4F0000 */        sw $t7, ($v0)
  /* 151F4C 80132DAC AC400004 */        sw $zero, 4($v0)
  /* 151F50 80132DB0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 151F54 80132DB4 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 151F58 80132DB8 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 151F5C 80132DBC 24580008 */     addiu $t8, $v0, 8
  /* 151F60 80132DC0 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 151F64 80132DC4 AC400004 */        sw $zero, 4($v0)
  /* 151F68 80132DC8 AC590000 */        sw $t9, ($v0)
  /* 151F6C 80132DCC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 151F70 80132DD0 3C0DFA00 */       lui $t5, 0xfa00
  /* 151F74 80132DD4 244C0008 */     addiu $t4, $v0, 8
  /* 151F78 80132DD8 AC6C0000 */        sw $t4, ($v1) # gDisplayListHead + 0
  /* 151F7C 80132DDC AC4D0000 */        sw $t5, ($v0)
  /* 151F80 80132DE0 90AC0029 */       lbu $t4, 0x29($a1)
  /* 151F84 80132DE4 90AF0028 */       lbu $t7, 0x28($a1)
  /* 151F88 80132DE8 90B9002A */       lbu $t9, 0x2a($a1)
  /* 151F8C 80132DEC 000C6C00 */       sll $t5, $t4, 0x10
  /* 151F90 80132DF0 000FC600 */       sll $t8, $t7, 0x18
  /* 151F94 80132DF4 90AF002B */       lbu $t7, 0x2b($a1)
  /* 151F98 80132DF8 030D7025 */        or $t6, $t8, $t5
  /* 151F9C 80132DFC 00196200 */       sll $t4, $t9, 8
  /* 151FA0 80132E00 01CCC025 */        or $t8, $t6, $t4
  /* 151FA4 80132E04 030FC825 */        or $t9, $t8, $t7
  /* 151FA8 80132E08 AC590004 */        sw $t9, 4($v0)
  /* 151FAC 80132E0C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 151FB0 80132E10 3C0CFB00 */       lui $t4, 0xfb00
  /* 151FB4 80132E14 244E0008 */     addiu $t6, $v0, 8
  /* 151FB8 80132E18 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 151FBC 80132E1C AC4C0000 */        sw $t4, ($v0)
  /* 151FC0 80132E20 90AE0061 */       lbu $t6, 0x61($a1)
  /* 151FC4 80132E24 90B80060 */       lbu $t8, 0x60($a1)
  /* 151FC8 80132E28 90B90062 */       lbu $t9, 0x62($a1)
  /* 151FCC 80132E2C 000E6400 */       sll $t4, $t6, 0x10
  /* 151FD0 80132E30 00187E00 */       sll $t7, $t8, 0x18
  /* 151FD4 80132E34 90B80063 */       lbu $t8, 0x63($a1)
  /* 151FD8 80132E38 01EC6825 */        or $t5, $t7, $t4
  /* 151FDC 80132E3C 00197200 */       sll $t6, $t9, 8
  /* 151FE0 80132E40 01AE7825 */        or $t7, $t5, $t6
  /* 151FE4 80132E44 01F8C825 */        or $t9, $t7, $t8
  /* 151FE8 80132E48 AC590004 */        sw $t9, 4($v0)
  /* 151FEC 80132E4C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 151FF0 80132E50 3C0EFC30 */       lui $t6, (0xFC30FE61 >> 16) # 4231069281
  /* 151FF4 80132E54 3C0C55FE */       lui $t4, (0x55FEFD7E >> 16) # 1442774398
  /* 151FF8 80132E58 244D0008 */     addiu $t5, $v0, 8
  /* 151FFC 80132E5C AC6D0000 */        sw $t5, ($v1) # gDisplayListHead + 0
  /* 152000 80132E60 358CFD7E */       ori $t4, $t4, (0x55FEFD7E & 0xFFFF) # 1442774398
  /* 152004 80132E64 35CEFE61 */       ori $t6, $t6, (0xFC30FE61 & 0xFFFF) # 4231069281
  /* 152008 80132E68 AC4E0000 */        sw $t6, ($v0)
  /* 15200C 80132E6C AC4C0004 */        sw $t4, 4($v0)
  /* 152010 80132E70 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 152014 80132E74 3C190055 */       lui $t9, (0x552048 >> 16) # 5578824
  /* 152018 80132E78 3C18E200 */       lui $t8, (0xE200001C >> 16) # 3791650844
  /* 15201C 80132E7C 244F0008 */     addiu $t7, $v0, 8
  /* 152020 80132E80 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 152024 80132E84 3718001C */       ori $t8, $t8, (0xE200001C & 0xFFFF) # 3791650844
  /* 152028 80132E88 37392048 */       ori $t9, $t9, (0x552048 & 0xFFFF) # 5578824
  /* 15202C 80132E8C AC590004 */        sw $t9, 4($v0)
  /* 152030 80132E90 0C0333DD */       jal func_ovl0_800CCF74
  /* 152034 80132E94 AC580000 */        sw $t8, ($v0)
  /* 152038 80132E98 8FBF0014 */        lw $ra, 0x14($sp)
  /* 15203C 80132E9C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 152040 80132EA0 03E00008 */        jr $ra
  /* 152044 80132EA4 00000000 */       nop

glabel mnResultsCreateBackground
  /* 152048 80132EA8 27BDFF50 */     addiu $sp, $sp, -0xb0
  /* 15204C 80132EAC 3C0F8014 */       lui $t7, %hi(dMNResultsUnusedBackgroundColors)
  /* 152050 80132EB0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 152054 80132EB4 25EF9080 */     addiu $t7, $t7, %lo(dMNResultsUnusedBackgroundColors)
  /* 152058 80132EB8 8DF90000 */        lw $t9, ($t7) # dMNResultsUnusedBackgroundColors + 0
  /* 15205C 80132EBC 8DF80004 */        lw $t8, 4($t7) # dMNResultsUnusedBackgroundColors + 4
  /* 152060 80132EC0 27AE0080 */     addiu $t6, $sp, 0x80
  /* 152064 80132EC4 ADD90000 */        sw $t9, ($t6)
  /* 152068 80132EC8 ADD80004 */        sw $t8, 4($t6)
  /* 15206C 80132ECC 8DF8000C */        lw $t8, 0xc($t7) # dMNResultsUnusedBackgroundColors + 12
  /* 152070 80132ED0 8DF90008 */        lw $t9, 8($t7) # dMNResultsUnusedBackgroundColors + 8
  /* 152074 80132ED4 3C098014 */       lui $t1, %hi(dMNResultsUnusedBackgroundColorArrays)
  /* 152078 80132ED8 ADD8000C */        sw $t8, 0xc($t6)
  /* 15207C 80132EDC ADD90008 */        sw $t9, 8($t6)
  /* 152080 80132EE0 8DF90010 */        lw $t9, 0x10($t7) # dMNResultsUnusedBackgroundColors + 16
  /* 152084 80132EE4 8DF80014 */        lw $t8, 0x14($t7) # dMNResultsUnusedBackgroundColors + 20
  /* 152088 80132EE8 25299098 */     addiu $t1, $t1, %lo(dMNResultsUnusedBackgroundColorArrays)
  /* 15208C 80132EEC ADD90010 */        sw $t9, 0x10($t6)
  /* 152090 80132EF0 ADD80014 */        sw $t8, 0x14($t6)
  /* 152094 80132EF4 8D2A0004 */        lw $t2, 4($t1) # dMNResultsUnusedBackgroundColorArrays + 4
  /* 152098 80132EF8 8D2B0000 */        lw $t3, ($t1) # dMNResultsUnusedBackgroundColorArrays + 0
  /* 15209C 80132EFC 27A80070 */     addiu $t0, $sp, 0x70
  /* 1520A0 80132F00 AD0A0004 */        sw $t2, 4($t0)
  /* 1520A4 80132F04 AD0B0000 */        sw $t3, ($t0)
  /* 1520A8 80132F08 8D2B0008 */        lw $t3, 8($t1) # dMNResultsUnusedBackgroundColorArrays + 8
  /* 1520AC 80132F0C 8D2A000C */        lw $t2, 0xc($t1) # dMNResultsUnusedBackgroundColorArrays + 12
  /* 1520B0 80132F10 3C0D8014 */       lui $t5, %hi(dMNResultsBackgroundTeamColorIndexes)
  /* 1520B4 80132F14 25AD90A8 */     addiu $t5, $t5, %lo(dMNResultsBackgroundTeamColorIndexes)
  /* 1520B8 80132F18 AD0B0008 */        sw $t3, 8($t0)
  /* 1520BC 80132F1C AD0A000C */        sw $t2, 0xc($t0)
  /* 1520C0 80132F20 8DAF0000 */        lw $t7, ($t5) # dMNResultsBackgroundTeamColorIndexes + 0
  /* 1520C4 80132F24 27AC0064 */     addiu $t4, $sp, 0x64
  /* 1520C8 80132F28 8DAE0004 */        lw $t6, 4($t5) # dMNResultsBackgroundTeamColorIndexes + 4
  /* 1520CC 80132F2C AD8F0000 */        sw $t7, ($t4)
  /* 1520D0 80132F30 8DAF0008 */        lw $t7, 8($t5) # dMNResultsBackgroundTeamColorIndexes + 8
  /* 1520D4 80132F34 3C198014 */       lui $t9, %hi(dMNResultsBackgroundColors)
  /* 1520D8 80132F38 273990B4 */     addiu $t9, $t9, %lo(dMNResultsBackgroundColors)
  /* 1520DC 80132F3C AD8E0004 */        sw $t6, 4($t4)
  /* 1520E0 80132F40 AD8F0008 */        sw $t7, 8($t4)
  /* 1520E4 80132F44 8F280004 */        lw $t0, 4($t9) # dMNResultsBackgroundColors + 4
  /* 1520E8 80132F48 8F290000 */        lw $t1, ($t9) # dMNResultsBackgroundColors + 0
  /* 1520EC 80132F4C 27B8004C */     addiu $t8, $sp, 0x4c
  /* 1520F0 80132F50 AF080004 */        sw $t0, 4($t8)
  /* 1520F4 80132F54 AF090000 */        sw $t1, ($t8)
  /* 1520F8 80132F58 8F290008 */        lw $t1, 8($t9) # dMNResultsBackgroundColors + 8
  /* 1520FC 80132F5C 8F28000C */        lw $t0, 0xc($t9) # dMNResultsBackgroundColors + 12
  /* 152100 80132F60 3C0A800D */       lui $t2, %hi(func_ovl0_800CD2CC)
  /* 152104 80132F64 AF090008 */        sw $t1, 8($t8)
  /* 152108 80132F68 AF08000C */        sw $t0, 0xc($t8)
  /* 15210C 80132F6C 8F280014 */        lw $t0, 0x14($t9) # dMNResultsBackgroundColors + 20
  /* 152110 80132F70 8F290010 */        lw $t1, 0x10($t9) # dMNResultsBackgroundColors + 16
  /* 152114 80132F74 254AD2CC */     addiu $t2, $t2, %lo(func_ovl0_800CD2CC)
  /* 152118 80132F78 AF080014 */        sw $t0, 0x14($t8)
  /* 15211C 80132F7C AF090010 */        sw $t1, 0x10($t8)
  /* 152120 80132F80 24180001 */     addiu $t8, $zero, 1
  /* 152124 80132F84 240F0001 */     addiu $t7, $zero, 1
  /* 152128 80132F88 240C0000 */     addiu $t4, $zero, 0
  /* 15212C 80132F8C 240EFFFF */     addiu $t6, $zero, -1
  /* 152130 80132F90 3C0D0400 */       lui $t5, 0x400
  /* 152134 80132F94 240B0050 */     addiu $t3, $zero, 0x50
  /* 152138 80132F98 AFAB0014 */        sw $t3, 0x14($sp)
  /* 15213C 80132F9C AFAD001C */        sw $t5, 0x1c($sp)
  /* 152140 80132FA0 AFAE0020 */        sw $t6, 0x20($sp)
  /* 152144 80132FA4 AFAC0018 */        sw $t4, 0x18($sp)
  /* 152148 80132FA8 AFAF0028 */        sw $t7, 0x28($sp)
  /* 15214C 80132FAC AFB80030 */        sw $t8, 0x30($sp)
  /* 152150 80132FB0 AFA00034 */        sw $zero, 0x34($sp)
  /* 152154 80132FB4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 152158 80132FB8 AFA00024 */        sw $zero, 0x24($sp)
  /* 15215C 80132FBC AFAA0010 */        sw $t2, 0x10($sp)
  /* 152160 80132FC0 24040401 */     addiu $a0, $zero, 0x401
  /* 152164 80132FC4 00002825 */        or $a1, $zero, $zero
  /* 152168 80132FC8 24060010 */     addiu $a2, $zero, 0x10
  /* 15216C 80132FCC 0C002E4F */       jal func_8000B93C
  /* 152170 80132FD0 3C078000 */       lui $a3, 0x8000
  /* 152174 80132FD4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 152178 80132FD8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 15217C 80132FDC 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 152180 80132FE0 8C430074 */        lw $v1, 0x74($v0)
  /* 152184 80132FE4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 152188 80132FE8 44050000 */      mfc1 $a1, $f0
  /* 15218C 80132FEC 44060000 */      mfc1 $a2, $f0
  /* 152190 80132FF0 3C07439B */       lui $a3, 0x439b
  /* 152194 80132FF4 24640008 */     addiu $a0, $v1, 8
  /* 152198 80132FF8 0C001C20 */       jal func_80007080
  /* 15219C 80132FFC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1521A0 80133000 3C198014 */       lui $t9, %hi(gMNResultsGameRule)
  /* 1521A4 80133004 8F399C10 */        lw $t9, %lo(gMNResultsGameRule)($t9)
  /* 1521A8 80133008 24010004 */     addiu $at, $zero, 4
  /* 1521AC 8013300C 3C038014 */       lui $v1, 0x8014
  /* 1521B0 80133010 17210005 */       bne $t9, $at, .L80133028
  /* 1521B4 80133014 00000000 */       nop
  /* 1521B8 80133018 0C006265 */       jal lbRandom_GetIntRange
  /* 1521BC 8013301C 24040004 */     addiu $a0, $zero, 4
  /* 1521C0 80133020 10000012 */         b .L8013306C
  /* 1521C4 80133024 AFA20098 */        sw $v0, 0x98($sp)
  .L80133028:
  /* 1521C8 80133028 90639C14 */       lbu $v1, -0x63ec($v1)
  /* 1521CC 8013302C 54600007 */      bnel $v1, $zero, .L8013304C
  /* 1521D0 80133030 24010001 */     addiu $at, $zero, 1
  /* 1521D4 80133034 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 1521D8 80133038 00000000 */       nop
  /* 1521DC 8013303C 3C038014 */       lui $v1, %hi(gMNResultsIsTeamBattle)
  /* 1521E0 80133040 90639C14 */       lbu $v1, %lo(gMNResultsIsTeamBattle)($v1)
  /* 1521E4 80133044 AFA20098 */        sw $v0, 0x98($sp)
  /* 1521E8 80133048 24010001 */     addiu $at, $zero, 1
  .L8013304C:
  /* 1521EC 8013304C 54610008 */      bnel $v1, $at, .L80133070
  /* 1521F0 80133050 00002025 */        or $a0, $zero, $zero
  /* 1521F4 80133054 0C04CA8B */       jal mnResultsGetWinningTeam
  /* 1521F8 80133058 00000000 */       nop
  /* 1521FC 8013305C 00024080 */       sll $t0, $v0, 2
  /* 152200 80133060 03A84821 */      addu $t1, $sp, $t0
  /* 152204 80133064 8D290064 */        lw $t1, 0x64($t1)
  /* 152208 80133068 AFA90098 */        sw $t1, 0x98($sp)
  .L8013306C:
  /* 15220C 8013306C 00002025 */        or $a0, $zero, $zero
  .L80133070:
  /* 152210 80133070 00002825 */        or $a1, $zero, $zero
  /* 152214 80133074 24060011 */     addiu $a2, $zero, 0x11
  /* 152218 80133078 0C00265A */       jal omMakeGObjSPAfter
  /* 15221C 8013307C 3C078000 */       lui $a3, 0x8000
  /* 152220 80133080 3C058013 */       lui $a1, %hi(mnResultsRenderBackground)
  /* 152224 80133084 240AFFFF */     addiu $t2, $zero, -1
  /* 152228 80133088 AFA200AC */        sw $v0, 0xac($sp)
  /* 15222C 8013308C AFAA0010 */        sw $t2, 0x10($sp)
  /* 152230 80133090 24A52D84 */     addiu $a1, $a1, %lo(mnResultsRenderBackground)
  /* 152234 80133094 00402025 */        or $a0, $v0, $zero
  /* 152238 80133098 2406001A */     addiu $a2, $zero, 0x1a
  /* 15223C 8013309C 0C00277D */       jal omAddGObjRenderProc
  /* 152240 801330A0 3C078000 */       lui $a3, 0x8000
  /* 152244 801330A4 3C0B8014 */       lui $t3, %hi(D_ovl31_8013A048)
  /* 152248 801330A8 8D6BA048 */        lw $t3, %lo(D_ovl31_8013A048)($t3)
  /* 15224C 801330AC 3C0C0001 */       lui $t4, %hi(D_NF_0000D5C8)
  /* 152250 801330B0 258CD5C8 */     addiu $t4, $t4, %lo(D_NF_0000D5C8)
  /* 152254 801330B4 8FA400AC */        lw $a0, 0xac($sp)
  /* 152258 801330B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 15225C 801330BC 016C2821 */      addu $a1, $t3, $t4
  /* 152260 801330C0 8FA400AC */        lw $a0, 0xac($sp)
  /* 152264 801330C4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 152268 801330C8 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 15226C 801330CC 8C8D0074 */        lw $t5, 0x74($a0)
  /* 152270 801330D0 27B9004C */     addiu $t9, $sp, 0x4c
  /* 152274 801330D4 E5A00058 */      swc1 $f0, 0x58($t5)
  /* 152278 801330D8 8C8E0074 */        lw $t6, 0x74($a0)
  /* 15227C 801330DC E5C0005C */      swc1 $f0, 0x5c($t6)
  /* 152280 801330E0 8FAF0098 */        lw $t7, 0x98($sp)
  /* 152284 801330E4 000FC080 */       sll $t8, $t7, 2
  /* 152288 801330E8 030FC023 */      subu $t8, $t8, $t7
  /* 15228C 801330EC 0018C040 */       sll $t8, $t8, 1
  /* 152290 801330F0 03191821 */      addu $v1, $t8, $t9
  /* 152294 801330F4 90680000 */       lbu $t0, ($v1)
  /* 152298 801330F8 A0480060 */        sb $t0, 0x60($v0)
  /* 15229C 801330FC 90690001 */       lbu $t1, 1($v1)
  /* 1522A0 80133100 A0490061 */        sb $t1, 0x61($v0)
  /* 1522A4 80133104 906A0002 */       lbu $t2, 2($v1)
  /* 1522A8 80133108 A04A0062 */        sb $t2, 0x62($v0)
  /* 1522AC 8013310C 906B0003 */       lbu $t3, 3($v1)
  /* 1522B0 80133110 A04B0028 */        sb $t3, 0x28($v0)
  /* 1522B4 80133114 906C0004 */       lbu $t4, 4($v1)
  /* 1522B8 80133118 A04C0029 */        sb $t4, 0x29($v0)
  /* 1522BC 8013311C 906D0005 */       lbu $t5, 5($v1)
  /* 1522C0 80133120 A04D002A */        sb $t5, 0x2a($v0)
  /* 1522C4 80133124 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1522C8 80133128 27BD00B0 */     addiu $sp, $sp, 0xb0
  /* 1522CC 8013312C 03E00008 */        jr $ra
  /* 1522D0 80133130 00000000 */       nop

glabel mnResultsGetPlacement
  /* 1522D4 80133134 00047080 */       sll $t6, $a0, 2
  /* 1522D8 80133138 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 1522DC 8013313C 004E1021 */      addu $v0, $v0, $t6
  /* 1522E0 80133140 03E00008 */        jr $ra
  /* 1522E4 80133144 8C429BB0 */        lw $v0, %lo(gMNResultsPlacement)($v0)

glabel mnResultsGetFtKind
  /* 1522E8 80133148 00047080 */       sll $t6, $a0, 2
  /* 1522EC 8013314C 3C028014 */       lui $v0, %hi(gMNResultsFTKind)
  /* 1522F0 80133150 004E1021 */      addu $v0, $v0, $t6
  /* 1522F4 80133154 03E00008 */        jr $ra
  /* 1522F8 80133158 8C429BF0 */        lw $v0, %lo(gMNResultsFTKind)($v0)

glabel mnResultsSetFtKind
  /* 1522FC 8013315C 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 152300 80133160 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 152304 80133164 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 152308 80133168 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 15230C 8013316C 11C00005 */      beqz $t6, .L80133184
  /* 152310 80133170 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 152314 80133174 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x23))
  /* 152318 80133178 91EF4D2B */       lbu $t7, %lo((gTransferBattleState + 0x23))($t7)
  /* 15231C 8013317C 3C018014 */       lui $at, %hi(gMNResultsFTKind)
  /* 152320 80133180 AC2F9BF0 */        sw $t7, %lo(gMNResultsFTKind)($at)
  .L80133184:
  /* 152324 80133184 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 152328 80133188 3C19800A */       lui $t9, %hi((gTransferBattleState + 0x97))
  /* 15232C 8013318C 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x10B))
  /* 152330 80133190 13000004 */      beqz $t8, .L801331A4
  /* 152334 80133194 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x17F))
  /* 152338 80133198 93394D9F */       lbu $t9, %lo((gTransferBattleState + 0x97))($t9)
  /* 15233C 8013319C 3C018014 */       lui $at, %hi(D_ovl31_80139BF4)
  /* 152340 801331A0 AC399BF4 */        sw $t9, %lo(D_ovl31_80139BF4)($at)
  .L801331A4:
  /* 152344 801331A4 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 152348 801331A8 11000004 */      beqz $t0, .L801331BC
  /* 15234C 801331AC 00000000 */       nop
  /* 152350 801331B0 91294E13 */       lbu $t1, %lo((gTransferBattleState + 0x10B))($t1)
  /* 152354 801331B4 3C018014 */       lui $at, %hi(D_ovl31_80139BF8)
  /* 152358 801331B8 AC299BF8 */        sw $t1, %lo(D_ovl31_80139BF8)($at)
  .L801331BC:
  /* 15235C 801331BC 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 152360 801331C0 11400004 */      beqz $t2, .L801331D4
  /* 152364 801331C4 00000000 */       nop
  /* 152368 801331C8 916B4E87 */       lbu $t3, %lo((gTransferBattleState + 0x17F))($t3)
  /* 15236C 801331CC 3C018014 */       lui $at, %hi(D_ovl31_80139BFC)
  /* 152370 801331D0 AC2B9BFC */        sw $t3, %lo(D_ovl31_80139BFC)($at)
  .L801331D4:
  /* 152374 801331D4 03E00008 */        jr $ra
  /* 152378 801331D8 00000000 */       nop

glabel mnResultsSetFighterPosition
  /* 15237C 801331DC 27BDFF28 */     addiu $sp, $sp, -0xd8
  /* 152380 801331E0 3C0F8014 */       lui $t7, %hi(dMNResultsFighterXPositions2P)
  /* 152384 801331E4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 152388 801331E8 AFB00018 */        sw $s0, 0x18($sp)
  /* 15238C 801331EC AFA600E0 */        sw $a2, 0xe0($sp)
  /* 152390 801331F0 25EF90CC */     addiu $t7, $t7, %lo(dMNResultsFighterXPositions2P)
  /* 152394 801331F4 8DF90000 */        lw $t9, ($t7) # dMNResultsFighterXPositions2P + 0
  /* 152398 801331F8 8DF80004 */        lw $t8, 4($t7) # dMNResultsFighterXPositions2P + 4
  /* 15239C 801331FC 27AE00B8 */     addiu $t6, $sp, 0xb8
  /* 1523A0 80133200 ADD90000 */        sw $t9, ($t6)
  /* 1523A4 80133204 ADD80004 */        sw $t8, 4($t6)
  /* 1523A8 80133208 8DF8000C */        lw $t8, 0xc($t7) # dMNResultsFighterXPositions2P + 12
  /* 1523AC 8013320C 8DF90008 */        lw $t9, 8($t7) # dMNResultsFighterXPositions2P + 8
  /* 1523B0 80133210 3C098014 */       lui $t1, %hi(dMNResultsFighterXPositions3P)
  /* 1523B4 80133214 ADD8000C */        sw $t8, 0xc($t6)
  /* 1523B8 80133218 ADD90008 */        sw $t9, 8($t6)
  /* 1523BC 8013321C 8DF90010 */        lw $t9, 0x10($t7) # dMNResultsFighterXPositions2P + 16
  /* 1523C0 80133220 8DF80014 */        lw $t8, 0x14($t7) # dMNResultsFighterXPositions2P + 20
  /* 1523C4 80133224 252990EC */     addiu $t1, $t1, %lo(dMNResultsFighterXPositions3P)
  /* 1523C8 80133228 ADD90010 */        sw $t9, 0x10($t6)
  /* 1523CC 8013322C ADD80014 */        sw $t8, 0x14($t6)
  /* 1523D0 80133230 8DF8001C */        lw $t8, 0x1c($t7) # dMNResultsFighterXPositions2P + 28
  /* 1523D4 80133234 8DF90018 */        lw $t9, 0x18($t7) # dMNResultsFighterXPositions2P + 24
  /* 1523D8 80133238 00808025 */        or $s0, $a0, $zero
  /* 1523DC 8013323C 252C0030 */     addiu $t4, $t1, 0x30
  /* 1523E0 80133240 27A80088 */     addiu $t0, $sp, 0x88
  /* 1523E4 80133244 ADD8001C */        sw $t8, 0x1c($t6)
  /* 1523E8 80133248 ADD90018 */        sw $t9, 0x18($t6)
  .L8013324C:
  /* 1523EC 8013324C 8D2B0000 */        lw $t3, ($t1) # dMNResultsFighterXPositions3P + 0
  /* 1523F0 80133250 2529000C */     addiu $t1, $t1, 0xc
  /* 1523F4 80133254 2508000C */     addiu $t0, $t0, 0xc
  /* 1523F8 80133258 AD0BFFF4 */        sw $t3, -0xc($t0)
  /* 1523FC 8013325C 8D2AFFF8 */        lw $t2, -8($t1) # dMNResultsFighterXPositions3P + -8
  /* 152400 80133260 AD0AFFF8 */        sw $t2, -8($t0)
  /* 152404 80133264 8D2BFFFC */        lw $t3, -4($t1) # dMNResultsFighterXPositions3P + -4
  /* 152408 80133268 152CFFF8 */       bne $t1, $t4, .L8013324C
  /* 15240C 8013326C AD0BFFFC */        sw $t3, -4($t0)
  /* 152410 80133270 3C0E8014 */       lui $t6, %hi(dMNResultsFighterXPositions4P)
  /* 152414 80133274 25CE911C */     addiu $t6, $t6, %lo(dMNResultsFighterXPositions4P)
  /* 152418 80133278 25D9003C */     addiu $t9, $t6, 0x3c
  /* 15241C 8013327C 27AD0048 */     addiu $t5, $sp, 0x48
  .L80133280:
  /* 152420 80133280 8DD80000 */        lw $t8, ($t6) # dMNResultsFighterXPositions4P + 0
  /* 152424 80133284 25CE000C */     addiu $t6, $t6, 0xc
  /* 152428 80133288 25AD000C */     addiu $t5, $t5, 0xc
  /* 15242C 8013328C ADB8FFF4 */        sw $t8, -0xc($t5)
  /* 152430 80133290 8DCFFFF8 */        lw $t7, -8($t6) # dMNResultsFighterXPositions4P + -8
  /* 152434 80133294 ADAFFFF8 */        sw $t7, -8($t5)
  /* 152438 80133298 8DD8FFFC */        lw $t8, -4($t6) # dMNResultsFighterXPositions4P + -4
  /* 15243C 8013329C 15D9FFF8 */       bne $t6, $t9, .L80133280
  /* 152440 801332A0 ADB8FFFC */        sw $t8, -4($t5)
  /* 152444 801332A4 8DD80000 */        lw $t8, ($t6) # dMNResultsFighterXPositions4P + 0
  /* 152448 801332A8 3C098014 */       lui $t1, %hi(dMNResultsFighterYZPositions)
  /* 15244C 801332AC 2529915C */     addiu $t1, $t1, %lo(dMNResultsFighterYZPositions)
  /* 152450 801332B0 ADB80000 */        sw $t8, ($t5)
  /* 152454 801332B4 8D280004 */        lw $t0, 4($t1) # dMNResultsFighterYZPositions + 4
  /* 152458 801332B8 8D2A0000 */        lw $t2, ($t1) # dMNResultsFighterYZPositions + 0
  /* 15245C 801332BC 27AC0028 */     addiu $t4, $sp, 0x28
  /* 152460 801332C0 AD880004 */        sw $t0, 4($t4)
  /* 152464 801332C4 AD8A0000 */        sw $t2, ($t4)
  /* 152468 801332C8 8D2A0008 */        lw $t2, 8($t1) # dMNResultsFighterYZPositions + 8
  /* 15246C 801332CC 8D28000C */        lw $t0, 0xc($t1) # dMNResultsFighterYZPositions + 12
  /* 152470 801332D0 AD8A0008 */        sw $t2, 8($t4)
  /* 152474 801332D4 AD88000C */        sw $t0, 0xc($t4)
  /* 152478 801332D8 8D280014 */        lw $t0, 0x14($t1) # dMNResultsFighterYZPositions + 20
  /* 15247C 801332DC 8D2A0010 */        lw $t2, 0x10($t1) # dMNResultsFighterYZPositions + 16
  /* 152480 801332E0 AD880014 */        sw $t0, 0x14($t4)
  /* 152484 801332E4 AD8A0010 */        sw $t2, 0x10($t4)
  /* 152488 801332E8 8D2A0018 */        lw $t2, 0x18($t1) # dMNResultsFighterYZPositions + 24
  /* 15248C 801332EC 8D28001C */        lw $t0, 0x1c($t1) # dMNResultsFighterYZPositions + 28
  /* 152490 801332F0 AD8A0018 */        sw $t2, 0x18($t4)
  /* 152494 801332F4 AD88001C */        sw $t0, 0x1c($t4)
  /* 152498 801332F8 0C04C817 */       jal mnResultsGetPresentCount
  /* 15249C 801332FC AFA500DC */        sw $a1, 0xdc($sp)
  /* 1524A0 80133300 24010002 */     addiu $at, $zero, 2
  /* 1524A4 80133304 10410008 */       beq $v0, $at, .L80133328
  /* 1524A8 80133308 8FA500DC */        lw $a1, 0xdc($sp)
  /* 1524AC 8013330C 24010003 */     addiu $at, $zero, 3
  /* 1524B0 80133310 10410010 */       beq $v0, $at, .L80133354
  /* 1524B4 80133314 24010004 */     addiu $at, $zero, 4
  /* 1524B8 80133318 10410019 */       beq $v0, $at, .L80133380
  /* 1524BC 8013331C 00000000 */       nop
  /* 1524C0 80133320 10000017 */         b .L80133380
  /* 1524C4 80133324 00000000 */       nop
  .L80133328:
  /* 1524C8 80133328 0C04C86B */       jal func_ovl31_801321AC
  /* 1524CC 8013332C 00A02025 */        or $a0, $a1, $zero
  /* 1524D0 80133330 8FB900E0 */        lw $t9, 0xe0($sp)
  /* 1524D4 80133334 00025900 */       sll $t3, $v0, 4
  /* 1524D8 80133338 8E180074 */        lw $t8, 0x74($s0)
  /* 1524DC 8013333C 00197080 */       sll $t6, $t9, 2
  /* 1524E0 80133340 016E6821 */      addu $t5, $t3, $t6
  /* 1524E4 80133344 03AD7821 */      addu $t7, $sp, $t5
  /* 1524E8 80133348 C5E400B8 */      lwc1 $f4, 0xb8($t7)
  /* 1524EC 8013334C 10000016 */         b .L801333A8
  /* 1524F0 80133350 E704001C */      swc1 $f4, 0x1c($t8)
  .L80133354:
  /* 1524F4 80133354 0C04C86B */       jal func_ovl31_801321AC
  /* 1524F8 80133358 00A02025 */        or $a0, $a1, $zero
  /* 1524FC 8013335C 8FA900E0 */        lw $t1, 0xe0($sp)
  /* 152500 80133360 00026100 */       sll $t4, $v0, 4
  /* 152504 80133364 8E0B0074 */        lw $t3, 0x74($s0)
  /* 152508 80133368 00094080 */       sll $t0, $t1, 2
  /* 15250C 8013336C 01885021 */      addu $t2, $t4, $t0
  /* 152510 80133370 03AAC821 */      addu $t9, $sp, $t2
  /* 152514 80133374 C7260088 */      lwc1 $f6, 0x88($t9)
  /* 152518 80133378 1000000B */         b .L801333A8
  /* 15251C 8013337C E566001C */      swc1 $f6, 0x1c($t3)
  .L80133380:
  /* 152520 80133380 0C04C86B */       jal func_ovl31_801321AC
  /* 152524 80133384 00A02025 */        or $a0, $a1, $zero
  /* 152528 80133388 8FAD00E0 */        lw $t5, 0xe0($sp)
  /* 15252C 8013338C 00027100 */       sll $t6, $v0, 4
  /* 152530 80133390 8E0C0074 */        lw $t4, 0x74($s0)
  /* 152534 80133394 000D7880 */       sll $t7, $t5, 2
  /* 152538 80133398 01CFC021 */      addu $t8, $t6, $t7
  /* 15253C 8013339C 03B84821 */      addu $t1, $sp, $t8
  /* 152540 801333A0 C5280048 */      lwc1 $f8, 0x48($t1)
  /* 152544 801333A4 E588001C */      swc1 $f8, 0x1c($t4)
  .L801333A8:
  /* 152548 801333A8 8FA800E0 */        lw $t0, 0xe0($sp)
  /* 15254C 801333AC 27B90028 */     addiu $t9, $sp, 0x28
  /* 152550 801333B0 8E0B0074 */        lw $t3, 0x74($s0)
  /* 152554 801333B4 000850C0 */       sll $t2, $t0, 3
  /* 152558 801333B8 01591021 */      addu $v0, $t2, $t9
  /* 15255C 801333BC C44A0000 */      lwc1 $f10, ($v0)
  /* 152560 801333C0 E56A0020 */      swc1 $f10, 0x20($t3)
  /* 152564 801333C4 8E0D0074 */        lw $t5, 0x74($s0)
  /* 152568 801333C8 C4500004 */      lwc1 $f16, 4($v0)
  /* 15256C 801333CC E5B00024 */      swc1 $f16, 0x24($t5)
  /* 152570 801333D0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 152574 801333D4 8FB00018 */        lw $s0, 0x18($sp)
  /* 152578 801333D8 27BD00D8 */     addiu $sp, $sp, 0xd8
  /* 15257C 801333DC 03E00008 */        jr $ra
  /* 152580 801333E0 00000000 */       nop

glabel mnResultsMakeFighterFaceWinner
  /* 152584 801333E4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 152588 801333E8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15258C 801333EC AFA40018 */        sw $a0, 0x18($sp)
  /* 152590 801333F0 AFA5001C */        sw $a1, 0x1c($sp)
  /* 152594 801333F4 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 152598 801333F8 AFA60020 */        sw $a2, 0x20($sp)
  /* 15259C 801333FC 8FAE0020 */        lw $t6, 0x20($sp)
  /* 1525A0 80133400 00402025 */        or $a0, $v0, $zero
  /* 1525A4 80133404 8FAF0018 */        lw $t7, 0x18($sp)
  /* 1525A8 80133408 11C00010 */      beqz $t6, .L8013344C
  /* 1525AC 8013340C 0004C080 */       sll $t8, $a0, 2
  /* 1525B0 80133410 3C198014 */       lui $t9, %hi(gMNResultsFighterGObjs)
  /* 1525B4 80133414 0338C821 */      addu $t9, $t9, $t8
  /* 1525B8 80133418 8F399BE0 */        lw $t9, %lo(gMNResultsFighterGObjs)($t9)
  /* 1525BC 8013341C 8DE20074 */        lw $v0, 0x74($t7)
  /* 1525C0 80133420 8F230074 */        lw $v1, 0x74($t9)
  /* 1525C4 80133424 C440001C */      lwc1 $f0, 0x1c($v0)
  /* 1525C8 80133428 C4420024 */      lwc1 $f2, 0x24($v0)
  /* 1525CC 8013342C C470001C */      lwc1 $f16, 0x1c($v1)
  /* 1525D0 80133430 C4720024 */      lwc1 $f18, 0x24($v1)
  /* 1525D4 80133434 46008301 */     sub.s $f12, $f16, $f0
  /* 1525D8 80133438 0C00618F */       jal atan2f
  /* 1525DC 8013343C 46029381 */     sub.s $f14, $f18, $f2
  /* 1525E0 80133440 8FA80018 */        lw $t0, 0x18($sp)
  /* 1525E4 80133444 8D090074 */        lw $t1, 0x74($t0)
  /* 1525E8 80133448 E5200034 */      swc1 $f0, 0x34($t1)
  .L8013344C:
  /* 1525EC 8013344C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1525F0 80133450 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1525F4 80133454 03E00008 */        jr $ra
  /* 1525F8 80133458 00000000 */       nop

glabel mnResultsGetVictoryAnim
  /* 1525FC 8013345C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 152600 80133460 3C0F8014 */       lui $t7, %hi(mnResultsVictoryAnims)
  /* 152604 80133464 AFBF0014 */        sw $ra, 0x14($sp)
  /* 152608 80133468 25EF917C */     addiu $t7, $t7, %lo(mnResultsVictoryAnims)
  /* 15260C 8013346C 8DF90000 */        lw $t9, ($t7) # mnResultsVictoryAnims + 0
  /* 152610 80133470 27AE001C */     addiu $t6, $sp, 0x1c
  /* 152614 80133474 8DF80004 */        lw $t8, 4($t7) # mnResultsVictoryAnims + 4
  /* 152618 80133478 ADD90000 */        sw $t9, ($t6)
  /* 15261C 8013347C 8DF90008 */        lw $t9, 8($t7) # mnResultsVictoryAnims + 8
  /* 152620 80133480 24010008 */     addiu $at, $zero, 8
  /* 152624 80133484 ADD80004 */        sw $t8, 4($t6)
  /* 152628 80133488 14810007 */       bne $a0, $at, .L801334A8
  /* 15262C 8013348C ADD90008 */        sw $t9, 8($t6)
  /* 152630 80133490 0C006265 */       jal lbRandom_GetIntRange
  /* 152634 80133494 24040002 */     addiu $a0, $zero, 2
  /* 152638 80133498 00024080 */       sll $t0, $v0, 2
  /* 15263C 8013349C 03A81021 */      addu $v0, $sp, $t0
  /* 152640 801334A0 10000006 */         b .L801334BC
  /* 152644 801334A4 8C42001C */        lw $v0, 0x1c($v0)
  .L801334A8:
  /* 152648 801334A8 0C006265 */       jal lbRandom_GetIntRange
  /* 15264C 801334AC 24040003 */     addiu $a0, $zero, 3
  /* 152650 801334B0 00024880 */       sll $t1, $v0, 2
  /* 152654 801334B4 03A91021 */      addu $v0, $sp, $t1
  /* 152658 801334B8 8C42001C */        lw $v0, 0x1c($v0)
  .L801334BC:
  /* 15265C 801334BC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 152660 801334C0 27BD0028 */     addiu $sp, $sp, 0x28
  /* 152664 801334C4 03E00008 */        jr $ra
  /* 152668 801334C8 00000000 */       nop

glabel mnResultsGetDefeatedAnim
  /* 15266C 801334CC 3C020001 */       lui $v0, (0x10005 >> 16) # 65541
  /* 152670 801334D0 AFA40000 */        sw $a0, ($sp)
  /* 152674 801334D4 03E00008 */        jr $ra
  /* 152678 801334D8 34420005 */       ori $v0, $v0, (0x10005 & 0xFFFF) # 65541

glabel mnResultsSetAnim
  /* 15267C 801334DC 3C0E8014 */       lui $t6, %hi(gMNResultsGameRule)
  /* 152680 801334E0 8DCE9C10 */        lw $t6, %lo(gMNResultsGameRule)($t6)
  /* 152684 801334E4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 152688 801334E8 24010004 */     addiu $at, $zero, 4
  /* 15268C 801334EC AFBF0014 */        sw $ra, 0x14($sp)
  /* 152690 801334F0 15C1000A */       bne $t6, $at, .L8013351C
  /* 152694 801334F4 AFA40018 */        sw $a0, 0x18($sp)
  /* 152698 801334F8 0C04CC52 */       jal mnResultsGetFtKind
  /* 15269C 801334FC 00A02025 */        or $a0, $a1, $zero
  /* 1526A0 80133500 0C04CD33 */       jal mnResultsGetDefeatedAnim
  /* 1526A4 80133504 00402025 */        or $a0, $v0, $zero
  /* 1526A8 80133508 8FA40018 */        lw $a0, 0x18($sp)
  /* 1526AC 8013350C 0C0E4173 */       jal func_ovl1_803905CC
  /* 1526B0 80133510 00402825 */        or $a1, $v0, $zero
  /* 1526B4 80133514 10000058 */         b .L80133678
  /* 1526B8 80133518 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013351C:
  /* 1526BC 8013351C 0C04C817 */       jal mnResultsGetPresentCount
  /* 1526C0 80133520 AFA5001C */        sw $a1, 0x1c($sp)
  /* 1526C4 80133524 24010002 */     addiu $at, $zero, 2
  /* 1526C8 80133528 10410009 */       beq $v0, $at, .L80133550
  /* 1526CC 8013352C 8FA5001C */        lw $a1, 0x1c($sp)
  /* 1526D0 80133530 24010003 */     addiu $at, $zero, 3
  /* 1526D4 80133534 10410023 */       beq $v0, $at, .L801335C4
  /* 1526D8 80133538 0005C080 */       sll $t8, $a1, 2
  /* 1526DC 8013353C 24010004 */     addiu $at, $zero, 4
  /* 1526E0 80133540 10410037 */       beq $v0, $at, .L80133620
  /* 1526E4 80133544 00054080 */       sll $t0, $a1, 2
  /* 1526E8 80133548 10000035 */         b .L80133620
  /* 1526EC 8013354C 00000000 */       nop
  .L80133550:
  /* 1526F0 80133550 00057880 */       sll $t7, $a1, 2
  /* 1526F4 80133554 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 1526F8 80133558 004F1021 */      addu $v0, $v0, $t7
  /* 1526FC 8013355C 8C429BB0 */        lw $v0, %lo(gMNResultsPlacement)($v0)
  /* 152700 80133560 24010001 */     addiu $at, $zero, 1
  /* 152704 80133564 10400005 */      beqz $v0, .L8013357C
  /* 152708 80133568 00000000 */       nop
  /* 15270C 8013356C 1041000C */       beq $v0, $at, .L801335A0
  /* 152710 80133570 00000000 */       nop
  /* 152714 80133574 10000040 */         b .L80133678
  /* 152718 80133578 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013357C:
  /* 15271C 8013357C 0C04CC52 */       jal mnResultsGetFtKind
  /* 152720 80133580 00A02025 */        or $a0, $a1, $zero
  /* 152724 80133584 0C04CD17 */       jal mnResultsGetVictoryAnim
  /* 152728 80133588 00402025 */        or $a0, $v0, $zero
  /* 15272C 8013358C 8FA40018 */        lw $a0, 0x18($sp)
  /* 152730 80133590 0C0E4173 */       jal func_ovl1_803905CC
  /* 152734 80133594 00402825 */        or $a1, $v0, $zero
  /* 152738 80133598 10000037 */         b .L80133678
  /* 15273C 8013359C 8FBF0014 */        lw $ra, 0x14($sp)
  .L801335A0:
  /* 152740 801335A0 0C04CC52 */       jal mnResultsGetFtKind
  /* 152744 801335A4 00A02025 */        or $a0, $a1, $zero
  /* 152748 801335A8 0C04CD33 */       jal mnResultsGetDefeatedAnim
  /* 15274C 801335AC 00402025 */        or $a0, $v0, $zero
  /* 152750 801335B0 8FA40018 */        lw $a0, 0x18($sp)
  /* 152754 801335B4 0C0E4173 */       jal func_ovl1_803905CC
  /* 152758 801335B8 00402825 */        or $a1, $v0, $zero
  /* 15275C 801335BC 1000002E */         b .L80133678
  /* 152760 801335C0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801335C4:
  /* 152764 801335C4 3C198014 */       lui $t9, %hi(gMNResultsPlacement)
  /* 152768 801335C8 0338C821 */      addu $t9, $t9, $t8
  /* 15276C 801335CC 8F399BB0 */        lw $t9, %lo(gMNResultsPlacement)($t9)
  /* 152770 801335D0 1720000A */      bnez $t9, .L801335FC
  /* 152774 801335D4 00000000 */       nop
  /* 152778 801335D8 0C04CC52 */       jal mnResultsGetFtKind
  /* 15277C 801335DC 00A02025 */        or $a0, $a1, $zero
  /* 152780 801335E0 0C04CD17 */       jal mnResultsGetVictoryAnim
  /* 152784 801335E4 00402025 */        or $a0, $v0, $zero
  /* 152788 801335E8 8FA40018 */        lw $a0, 0x18($sp)
  /* 15278C 801335EC 0C0E4173 */       jal func_ovl1_803905CC
  /* 152790 801335F0 00402825 */        or $a1, $v0, $zero
  /* 152794 801335F4 10000020 */         b .L80133678
  /* 152798 801335F8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801335FC:
  /* 15279C 801335FC 0C04CC52 */       jal mnResultsGetFtKind
  /* 1527A0 80133600 00A02025 */        or $a0, $a1, $zero
  /* 1527A4 80133604 0C04CD33 */       jal mnResultsGetDefeatedAnim
  /* 1527A8 80133608 00402025 */        or $a0, $v0, $zero
  /* 1527AC 8013360C 8FA40018 */        lw $a0, 0x18($sp)
  /* 1527B0 80133610 0C0E4173 */       jal func_ovl1_803905CC
  /* 1527B4 80133614 00402825 */        or $a1, $v0, $zero
  /* 1527B8 80133618 10000017 */         b .L80133678
  /* 1527BC 8013361C 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133620:
  /* 1527C0 80133620 3C098014 */       lui $t1, %hi(gMNResultsPlacement)
  /* 1527C4 80133624 01284821 */      addu $t1, $t1, $t0
  /* 1527C8 80133628 8D299BB0 */        lw $t1, %lo(gMNResultsPlacement)($t1)
  /* 1527CC 8013362C 1520000A */      bnez $t1, .L80133658
  /* 1527D0 80133630 00000000 */       nop
  /* 1527D4 80133634 0C04CC52 */       jal mnResultsGetFtKind
  /* 1527D8 80133638 00A02025 */        or $a0, $a1, $zero
  /* 1527DC 8013363C 0C04CD17 */       jal mnResultsGetVictoryAnim
  /* 1527E0 80133640 00402025 */        or $a0, $v0, $zero
  /* 1527E4 80133644 8FA40018 */        lw $a0, 0x18($sp)
  /* 1527E8 80133648 0C0E4173 */       jal func_ovl1_803905CC
  /* 1527EC 8013364C 00402825 */        or $a1, $v0, $zero
  /* 1527F0 80133650 10000009 */         b .L80133678
  /* 1527F4 80133654 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133658:
  /* 1527F8 80133658 0C04CC52 */       jal mnResultsGetFtKind
  /* 1527FC 8013365C 00A02025 */        or $a0, $a1, $zero
  /* 152800 80133660 0C04CD33 */       jal mnResultsGetDefeatedAnim
  /* 152804 80133664 00402025 */        or $a0, $v0, $zero
  /* 152808 80133668 8FA40018 */        lw $a0, 0x18($sp)
  /* 15280C 8013366C 0C0E4173 */       jal func_ovl1_803905CC
  /* 152810 80133670 00402825 */        or $a1, $v0, $zero
  /* 152814 80133674 8FBF0014 */        lw $ra, 0x14($sp)
  .L80133678:
  /* 152818 80133678 27BD0018 */     addiu $sp, $sp, 0x18
  /* 15281C 8013367C 03E00008 */        jr $ra
  /* 152820 80133680 00000000 */       nop

glabel mnResultsGetPlayerCountByPlace
  /* 152824 80133684 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 152828 80133688 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 15282C 8013368C 00001825 */        or $v1, $zero, $zero
  /* 152830 80133690 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 152834 80133694 11C00006 */      beqz $t6, .L801336B0
  /* 152838 80133698 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 15283C 8013369C 3C0F8014 */       lui $t7, %hi(gMNResultsPlacement)
  /* 152840 801336A0 8DEF9BB0 */        lw $t7, %lo(gMNResultsPlacement)($t7)
  /* 152844 801336A4 148F0002 */       bne $a0, $t7, .L801336B0
  /* 152848 801336A8 00000000 */       nop
  /* 15284C 801336AC 24030001 */     addiu $v1, $zero, 1
  .L801336B0:
  /* 152850 801336B0 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 152854 801336B4 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 152858 801336B8 3C198014 */       lui $t9, %hi(D_ovl31_80139BB4)
  /* 15285C 801336BC 13000005 */      beqz $t8, .L801336D4
  /* 152860 801336C0 3C098014 */       lui $t1, %hi(D_ovl31_80139BB8)
  /* 152864 801336C4 8F399BB4 */        lw $t9, %lo(D_ovl31_80139BB4)($t9)
  /* 152868 801336C8 14990002 */       bne $a0, $t9, .L801336D4
  /* 15286C 801336CC 00000000 */       nop
  /* 152870 801336D0 24630001 */     addiu $v1, $v1, 1
  .L801336D4:
  /* 152874 801336D4 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 152878 801336D8 3C0B8014 */       lui $t3, %hi(D_ovl31_80139BBC)
  /* 15287C 801336DC 11000005 */      beqz $t0, .L801336F4
  /* 152880 801336E0 00000000 */       nop
  /* 152884 801336E4 8D299BB8 */        lw $t1, %lo(D_ovl31_80139BB8)($t1)
  /* 152888 801336E8 14890002 */       bne $a0, $t1, .L801336F4
  /* 15288C 801336EC 00000000 */       nop
  /* 152890 801336F0 24630001 */     addiu $v1, $v1, 1
  .L801336F4:
  /* 152894 801336F4 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 152898 801336F8 11400005 */      beqz $t2, .L80133710
  /* 15289C 801336FC 00000000 */       nop
  /* 1528A0 80133700 8D6B9BBC */        lw $t3, %lo(D_ovl31_80139BBC)($t3)
  /* 1528A4 80133704 148B0002 */       bne $a0, $t3, .L80133710
  /* 1528A8 80133708 00000000 */       nop
  /* 1528AC 8013370C 24630001 */     addiu $v1, $v1, 1
  .L80133710:
  /* 1528B0 80133710 03E00008 */        jr $ra
  /* 1528B4 80133714 00601025 */        or $v0, $v1, $zero

glabel mnResultsGetPlayerCountAhead
  /* 1528B8 80133718 1080000F */      beqz $a0, .L80133758
  /* 1528BC 8013371C 00001825 */        or $v1, $zero, $zero
  /* 1528C0 80133720 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 1528C4 80133724 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 1528C8 80133728 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 1528CC 8013372C 24429BB0 */     addiu $v0, $v0, %lo(gMNResultsPlacement)
  /* 1528D0 80133730 11C00009 */      beqz $t6, .L80133758
  /* 1528D4 80133734 3C0F8014 */       lui $t7, %hi(gMNResultsPlacement)
  /* 1528D8 80133738 0004C080 */       sll $t8, $a0, 2
  /* 1528DC 8013373C 0058C821 */      addu $t9, $v0, $t8
  /* 1528E0 80133740 8F280000 */        lw $t0, ($t9)
  /* 1528E4 80133744 8DEF9BB0 */        lw $t7, %lo(gMNResultsPlacement)($t7)
  /* 1528E8 80133748 01E8082A */       slt $at, $t7, $t0
  /* 1528EC 8013374C 50200003 */      beql $at, $zero, .L8013375C
  /* 1528F0 80133750 24010001 */     addiu $at, $zero, 1
  /* 1528F4 80133754 24030001 */     addiu $v1, $zero, 1
  .L80133758:
  /* 1528F8 80133758 24010001 */     addiu $at, $zero, 1
  .L8013375C:
  /* 1528FC 8013375C 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 152900 80133760 1081000D */       beq $a0, $at, .L80133798
  /* 152904 80133764 24429BB0 */     addiu $v0, $v0, %lo(gMNResultsPlacement)
  /* 152908 80133768 3C098014 */       lui $t1, %hi(D_ovl31_80139BD4)
  /* 15290C 8013376C 8D299BD4 */        lw $t1, %lo(D_ovl31_80139BD4)($t1)
  /* 152910 80133770 00045880 */       sll $t3, $a0, 2
  /* 152914 80133774 004B6021 */      addu $t4, $v0, $t3
  /* 152918 80133778 11200007 */      beqz $t1, .L80133798
  /* 15291C 8013377C 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BB4)
  /* 152920 80133780 8D4A9BB4 */        lw $t2, %lo(D_ovl31_80139BB4)($t2)
  /* 152924 80133784 8D8D0000 */        lw $t5, ($t4)
  /* 152928 80133788 014D082A */       slt $at, $t2, $t5
  /* 15292C 8013378C 50200003 */      beql $at, $zero, .L8013379C
  /* 152930 80133790 24010002 */     addiu $at, $zero, 2
  /* 152934 80133794 24630001 */     addiu $v1, $v1, 1
  .L80133798:
  /* 152938 80133798 24010002 */     addiu $at, $zero, 2
  .L8013379C:
  /* 15293C 8013379C 1081000C */       beq $a0, $at, .L801337D0
  /* 152940 801337A0 3C0E8014 */       lui $t6, %hi(D_ovl31_80139BD8)
  /* 152944 801337A4 8DCE9BD8 */        lw $t6, %lo(D_ovl31_80139BD8)($t6)
  /* 152948 801337A8 0004C880 */       sll $t9, $a0, 2
  /* 15294C 801337AC 00597821 */      addu $t7, $v0, $t9
  /* 152950 801337B0 11C00007 */      beqz $t6, .L801337D0
  /* 152954 801337B4 3C188014 */       lui $t8, %hi(D_ovl31_80139BB8)
  /* 152958 801337B8 8F189BB8 */        lw $t8, %lo(D_ovl31_80139BB8)($t8)
  /* 15295C 801337BC 8DE80000 */        lw $t0, ($t7)
  /* 152960 801337C0 0308082A */       slt $at, $t8, $t0
  /* 152964 801337C4 50200003 */      beql $at, $zero, .L801337D4
  /* 152968 801337C8 24010003 */     addiu $at, $zero, 3
  /* 15296C 801337CC 24630001 */     addiu $v1, $v1, 1
  .L801337D0:
  /* 152970 801337D0 24010003 */     addiu $at, $zero, 3
  .L801337D4:
  /* 152974 801337D4 1081000C */       beq $a0, $at, .L80133808
  /* 152978 801337D8 3C098014 */       lui $t1, %hi(D_ovl31_80139BDC)
  /* 15297C 801337DC 8D299BDC */        lw $t1, %lo(D_ovl31_80139BDC)($t1)
  /* 152980 801337E0 00046080 */       sll $t4, $a0, 2
  /* 152984 801337E4 004C5021 */      addu $t2, $v0, $t4
  /* 152988 801337E8 11200007 */      beqz $t1, .L80133808
  /* 15298C 801337EC 3C0B8014 */       lui $t3, %hi(D_ovl31_80139BBC)
  /* 152990 801337F0 8D6B9BBC */        lw $t3, %lo(D_ovl31_80139BBC)($t3)
  /* 152994 801337F4 8D4D0000 */        lw $t5, ($t2)
  /* 152998 801337F8 016D082A */       slt $at, $t3, $t5
  /* 15299C 801337FC 10200002 */      beqz $at, .L80133808
  /* 1529A0 80133800 00000000 */       nop
  /* 1529A4 80133804 24630001 */     addiu $v1, $v1, 1
  .L80133808:
  /* 1529A8 80133808 03E00008 */        jr $ra
  /* 1529AC 8013380C 00601025 */        or $v0, $v1, $zero

glabel func_ovl31_80133810
  /* 1529B0 80133810 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 1529B4 80133814 3C0F8014 */       lui $t7, %hi(D_ovl31_80139188)
  /* 1529B8 80133818 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1529BC 8013381C AFA40050 */        sw $a0, 0x50($sp)
  /* 1529C0 80133820 25EF9188 */     addiu $t7, $t7, %lo(D_ovl31_80139188)
  /* 1529C4 80133824 8DF90000 */        lw $t9, ($t7) # D_ovl31_80139188 + 0
  /* 1529C8 80133828 8DF80004 */        lw $t8, 4($t7) # D_ovl31_80139188 + 4
  /* 1529CC 8013382C 27AE0040 */     addiu $t6, $sp, 0x40
  /* 1529D0 80133830 ADD90000 */        sw $t9, ($t6)
  /* 1529D4 80133834 ADD80004 */        sw $t8, 4($t6)
  /* 1529D8 80133838 8DF8000C */        lw $t8, 0xc($t7) # D_ovl31_80139188 + 12
  /* 1529DC 8013383C 8DF90008 */        lw $t9, 8($t7) # D_ovl31_80139188 + 8
  /* 1529E0 80133840 3C098014 */       lui $t1, %hi(D_ovl31_80139198)
  /* 1529E4 80133844 25299198 */     addiu $t1, $t1, %lo(D_ovl31_80139198)
  /* 1529E8 80133848 ADD8000C */        sw $t8, 0xc($t6)
  /* 1529EC 8013384C ADD90008 */        sw $t9, 8($t6)
  /* 1529F0 80133850 8D2B0000 */        lw $t3, ($t1) # D_ovl31_80139198 + 0
  /* 1529F4 80133854 27A8002C */     addiu $t0, $sp, 0x2c
  /* 1529F8 80133858 8D2A0004 */        lw $t2, 4($t1) # D_ovl31_80139198 + 4
  /* 1529FC 8013385C AD0B0000 */        sw $t3, ($t0)
  /* 152A00 80133860 8D2B0008 */        lw $t3, 8($t1) # D_ovl31_80139198 + 8
  /* 152A04 80133864 AD0A0004 */        sw $t2, 4($t0)
  /* 152A08 80133868 8D2A000C */        lw $t2, 0xc($t1) # D_ovl31_80139198 + 12
  /* 152A0C 8013386C AD0B0008 */        sw $t3, 8($t0)
  /* 152A10 80133870 8D2B0010 */        lw $t3, 0x10($t1) # D_ovl31_80139198 + 16
  /* 152A14 80133874 AD0A000C */        sw $t2, 0xc($t0)
  /* 152A18 80133878 AD0B0010 */        sw $t3, 0x10($t0)
  /* 152A1C 8013387C 0C04CDC6 */       jal mnResultsGetPlayerCountAhead
  /* 152A20 80133880 8FA40050 */        lw $a0, 0x50($sp)
  /* 152A24 80133884 8FAC0050 */        lw $t4, 0x50($sp)
  /* 152A28 80133888 3C0E8014 */       lui $t6, %hi(gMNResultsPlacement)
  /* 152A2C 8013388C 25CE9BB0 */     addiu $t6, $t6, %lo(gMNResultsPlacement)
  /* 152A30 80133890 000C6880 */       sll $t5, $t4, 2
  /* 152A34 80133894 01AE2821 */      addu $a1, $t5, $t6
  /* 152A38 80133898 8CA40000 */        lw $a0, ($a1)
  /* 152A3C 8013389C AFA50020 */        sw $a1, 0x20($sp)
  /* 152A40 801338A0 0C04CDA1 */       jal mnResultsGetPlayerCountByPlace
  /* 152A44 801338A4 AFA20024 */        sw $v0, 0x24($sp)
  /* 152A48 801338A8 8FA50020 */        lw $a1, 0x20($sp)
  /* 152A4C 801338AC 8FA90024 */        lw $t1, 0x24($sp)
  /* 152A50 801338B0 00027880 */       sll $t7, $v0, 2
  /* 152A54 801338B4 8CA30000 */        lw $v1, ($a1)
  /* 152A58 801338B8 00095080 */       sll $t2, $t1, 2
  /* 152A5C 801338BC 000A5823 */      negu $t3, $t2
  /* 152A60 801338C0 03AFC021 */      addu $t8, $sp, $t7
  /* 152A64 801338C4 00034080 */       sll $t0, $v1, 2
  /* 152A68 801338C8 8F18002C */        lw $t8, 0x2c($t8)
  /* 152A6C 801338CC 010B6021 */      addu $t4, $t0, $t3
  /* 152A70 801338D0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 152A74 801338D4 03AC6821 */      addu $t5, $sp, $t4
  /* 152A78 801338D8 8DAD0040 */        lw $t5, 0x40($t5)
  /* 152A7C 801338DC 0303C821 */      addu $t9, $t8, $v1
  /* 152A80 801338E0 27BD0050 */     addiu $sp, $sp, 0x50
  /* 152A84 801338E4 03E00008 */        jr $ra
  /* 152A88 801338E8 032D1021 */      addu $v0, $t9, $t5

glabel mnResultsSetFighterScale
  /* 152A8C 801338EC 3C0F8039 */       lui $t7, %hi(D_ovl1_80390D90)
  /* 152A90 801338F0 25EF0D90 */     addiu $t7, $t7, %lo(D_ovl1_80390D90)
  /* 152A94 801338F4 00067080 */       sll $t6, $a2, 2
  /* 152A98 801338F8 AFA50004 */        sw $a1, 4($sp)
  /* 152A9C 801338FC AFA7000C */        sw $a3, 0xc($sp)
  /* 152AA0 80133900 01CF1021 */      addu $v0, $t6, $t7
  /* 152AA4 80133904 C4440000 */      lwc1 $f4, ($v0)
  /* 152AA8 80133908 8C980074 */        lw $t8, 0x74($a0)
  /* 152AAC 8013390C E7040040 */      swc1 $f4, 0x40($t8)
  /* 152AB0 80133910 8C990074 */        lw $t9, 0x74($a0)
  /* 152AB4 80133914 C4460000 */      lwc1 $f6, ($v0)
  /* 152AB8 80133918 E7260044 */      swc1 $f6, 0x44($t9)
  /* 152ABC 8013391C 8C880074 */        lw $t0, 0x74($a0)
  /* 152AC0 80133920 C4480000 */      lwc1 $f8, ($v0)
  /* 152AC4 80133924 03E00008 */        jr $ra
  /* 152AC8 80133928 E5080048 */      swc1 $f8, 0x48($t0)

glabel mnResultsSpawnFighter
  /* 152ACC 8013392C 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 152AD0 80133930 3C0F8011 */       lui $t7, %hi(dFTDefaultFighterDesc)
  /* 152AD4 80133934 25EF6DD0 */     addiu $t7, $t7, %lo(dFTDefaultFighterDesc)
  /* 152AD8 80133938 AFBF0014 */        sw $ra, 0x14($sp)
  /* 152ADC 8013393C 00802825 */        or $a1, $a0, $zero
  /* 152AE0 80133940 25E8003C */     addiu $t0, $t7, 0x3c
  /* 152AE4 80133944 27AE0024 */     addiu $t6, $sp, 0x24
  .L80133948:
  /* 152AE8 80133948 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 152AEC 8013394C 25EF000C */     addiu $t7, $t7, 0xc
  /* 152AF0 80133950 25CE000C */     addiu $t6, $t6, 0xc
  /* 152AF4 80133954 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 152AF8 80133958 8DF8FFF8 */        lw $t8, -8($t7) # dFTDefaultFighterDesc + -8
  /* 152AFC 8013395C ADD8FFF8 */        sw $t8, -8($t6)
  /* 152B00 80133960 8DF9FFFC */        lw $t9, -4($t7) # dFTDefaultFighterDesc + -4
  /* 152B04 80133964 15E8FFF8 */       bne $t7, $t0, .L80133948
  /* 152B08 80133968 ADD9FFFC */        sw $t9, -4($t6)
  /* 152B0C 8013396C 8DF90000 */        lw $t9, ($t7) # dFTDefaultFighterDesc + 0
  /* 152B10 80133970 00A02025 */        or $a0, $a1, $zero
  /* 152B14 80133974 ADD90000 */        sw $t9, ($t6)
  /* 152B18 80133978 0C04CC52 */       jal mnResultsGetFtKind
  /* 152B1C 8013397C AFA50070 */        sw $a1, 0x70($sp)
  /* 152B20 80133980 8FA50070 */        lw $a1, 0x70($sp)
  /* 152B24 80133984 3C0A800A */       lui $t2, %hi(gTransferBattleState)
  /* 152B28 80133988 254A4D08 */     addiu $t2, $t2, %lo(gTransferBattleState)
  /* 152B2C 8013398C 000548C0 */       sll $t1, $a1, 3
  /* 152B30 80133990 01254823 */      subu $t1, $t1, $a1
  /* 152B34 80133994 00094880 */       sll $t1, $t1, 2
  /* 152B38 80133998 01254821 */      addu $t1, $t1, $a1
  /* 152B3C 8013399C 00094880 */       sll $t1, $t1, 2
  /* 152B40 801339A0 012A1821 */      addu $v1, $t1, $t2
  /* 152B44 801339A4 3C0D8014 */       lui $t5, %hi(gMNResultsAnimHeaps)
  /* 152B48 801339A8 00053080 */       sll $a2, $a1, 2
  /* 152B4C 801339AC 01A66821 */      addu $t5, $t5, $a2
  /* 152B50 801339B0 906B0026 */       lbu $t3, 0x26($v1)
  /* 152B54 801339B4 906C0027 */       lbu $t4, 0x27($v1)
  /* 152B58 801339B8 8DAD9C00 */        lw $t5, %lo(gMNResultsAnimHeaps)($t5)
  /* 152B5C 801339BC AFA20024 */        sw $v0, 0x24($sp)
  /* 152B60 801339C0 AFA60020 */        sw $a2, 0x20($sp)
  /* 152B64 801339C4 27A40024 */     addiu $a0, $sp, 0x24
  /* 152B68 801339C8 A3AB003B */        sb $t3, 0x3b($sp)
  /* 152B6C 801339CC A3AC003C */        sb $t4, 0x3c($sp)
  /* 152B70 801339D0 0C035FCF */       jal ftManagerMakeFighter
  /* 152B74 801339D4 AFAD005C */        sw $t5, 0x5c($sp)
  /* 152B78 801339D8 8FA60020 */        lw $a2, 0x20($sp)
  /* 152B7C 801339DC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 152B80 801339E0 3C018014 */       lui $at, %hi(gMNResultsFighterGObjs)
  /* 152B84 801339E4 00260821 */      addu $at, $at, $a2
  /* 152B88 801339E8 AC229BE0 */        sw $v0, %lo(gMNResultsFighterGObjs)($at)
  /* 152B8C 801339EC 03E00008 */        jr $ra
  /* 152B90 801339F0 27BD0070 */     addiu $sp, $sp, 0x70

glabel mnResultsSetIndicatorPosition
  /* 152B94 801339F4 27BDFDE8 */     addiu $sp, $sp, -0x218
  /* 152B98 801339F8 3C0F8014 */       lui $t7, %hi(dMNResultsIndicatorPositions2P)
  /* 152B9C 801339FC AFB20020 */        sw $s2, 0x20($sp)
  /* 152BA0 80133A00 AFB1001C */        sw $s1, 0x1c($sp)
  /* 152BA4 80133A04 25EF91AC */     addiu $t7, $t7, %lo(dMNResultsIndicatorPositions2P)
  /* 152BA8 80133A08 00A08825 */        or $s1, $a1, $zero
  /* 152BAC 80133A0C 00809025 */        or $s2, $a0, $zero
  /* 152BB0 80133A10 AFBF0024 */        sw $ra, 0x24($sp)
  /* 152BB4 80133A14 AFB00018 */        sw $s0, 0x18($sp)
  /* 152BB8 80133A18 25E8003C */     addiu $t0, $t7, 0x3c
  /* 152BBC 80133A1C 27AE01D0 */     addiu $t6, $sp, 0x1d0
  .L80133A20:
  /* 152BC0 80133A20 8DF90000 */        lw $t9, ($t7) # dMNResultsIndicatorPositions2P + 0
  /* 152BC4 80133A24 25EF000C */     addiu $t7, $t7, 0xc
  /* 152BC8 80133A28 25CE000C */     addiu $t6, $t6, 0xc
  /* 152BCC 80133A2C ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 152BD0 80133A30 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsIndicatorPositions2P + -8
  /* 152BD4 80133A34 ADD8FFF8 */        sw $t8, -8($t6)
  /* 152BD8 80133A38 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsIndicatorPositions2P + -4
  /* 152BDC 80133A3C 15E8FFF8 */       bne $t7, $t0, .L80133A20
  /* 152BE0 80133A40 ADD9FFFC */        sw $t9, -4($t6)
  /* 152BE4 80133A44 8DF90000 */        lw $t9, ($t7) # dMNResultsIndicatorPositions2P + 0
  /* 152BE8 80133A48 3C0A8014 */       lui $t2, %hi(dMNResultsIndicatorPositions3P)
  /* 152BEC 80133A4C 254A91EC */     addiu $t2, $t2, %lo(dMNResultsIndicatorPositions3P)
  /* 152BF0 80133A50 254D0060 */     addiu $t5, $t2, 0x60
  /* 152BF4 80133A54 27A90170 */     addiu $t1, $sp, 0x170
  /* 152BF8 80133A58 ADD90000 */        sw $t9, ($t6)
  .L80133A5C:
  /* 152BFC 80133A5C 8D4C0000 */        lw $t4, ($t2) # dMNResultsIndicatorPositions3P + 0
  /* 152C00 80133A60 254A000C */     addiu $t2, $t2, 0xc
  /* 152C04 80133A64 2529000C */     addiu $t1, $t1, 0xc
  /* 152C08 80133A68 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 152C0C 80133A6C 8D4BFFF8 */        lw $t3, -8($t2) # dMNResultsIndicatorPositions3P + -8
  /* 152C10 80133A70 AD2BFFF8 */        sw $t3, -8($t1)
  /* 152C14 80133A74 8D4CFFFC */        lw $t4, -4($t2) # dMNResultsIndicatorPositions3P + -4
  /* 152C18 80133A78 154DFFF8 */       bne $t2, $t5, .L80133A5C
  /* 152C1C 80133A7C AD2CFFFC */        sw $t4, -4($t1)
  /* 152C20 80133A80 3C0F8014 */       lui $t7, %hi(dMNResultsIndicatorPositions4P)
  /* 152C24 80133A84 25EF924C */     addiu $t7, $t7, %lo(dMNResultsIndicatorPositions4P)
  /* 152C28 80133A88 25F90078 */     addiu $t9, $t7, 0x78
  /* 152C2C 80133A8C 27A800F0 */     addiu $t0, $sp, 0xf0
  .L80133A90:
  /* 152C30 80133A90 8DF80000 */        lw $t8, ($t7) # dMNResultsIndicatorPositions4P + 0
  /* 152C34 80133A94 25EF000C */     addiu $t7, $t7, 0xc
  /* 152C38 80133A98 2508000C */     addiu $t0, $t0, 0xc
  /* 152C3C 80133A9C AD18FFF4 */        sw $t8, -0xc($t0)
  /* 152C40 80133AA0 8DEEFFF8 */        lw $t6, -8($t7) # dMNResultsIndicatorPositions4P + -8
  /* 152C44 80133AA4 AD0EFFF8 */        sw $t6, -8($t0)
  /* 152C48 80133AA8 8DF8FFFC */        lw $t8, -4($t7) # dMNResultsIndicatorPositions4P + -4
  /* 152C4C 80133AAC 15F9FFF8 */       bne $t7, $t9, .L80133A90
  /* 152C50 80133AB0 AD18FFFC */        sw $t8, -4($t0)
  /* 152C54 80133AB4 8DF80000 */        lw $t8, ($t7) # dMNResultsIndicatorPositions4P + 0
  /* 152C58 80133AB8 8DEE0004 */        lw $t6, 4($t7) # dMNResultsIndicatorPositions4P + 4
  /* 152C5C 80133ABC 3C0A8014 */       lui $t2, %hi(dMNResultsIndicatorYOffsets)
  /* 152C60 80133AC0 254A92CC */     addiu $t2, $t2, %lo(dMNResultsIndicatorYOffsets)
  /* 152C64 80133AC4 254C00C0 */     addiu $t4, $t2, 0xc0
  /* 152C68 80133AC8 27AD0030 */     addiu $t5, $sp, 0x30
  /* 152C6C 80133ACC AD180000 */        sw $t8, ($t0)
  /* 152C70 80133AD0 AD0E0004 */        sw $t6, 4($t0)
  .L80133AD4:
  /* 152C74 80133AD4 8D4B0000 */        lw $t3, ($t2) # dMNResultsIndicatorYOffsets + 0
  /* 152C78 80133AD8 254A000C */     addiu $t2, $t2, 0xc
  /* 152C7C 80133ADC 25AD000C */     addiu $t5, $t5, 0xc
  /* 152C80 80133AE0 ADABFFF4 */        sw $t3, -0xc($t5)
  /* 152C84 80133AE4 8D49FFF8 */        lw $t1, -8($t2) # dMNResultsIndicatorYOffsets + -8
  /* 152C88 80133AE8 ADA9FFF8 */        sw $t1, -8($t5)
  /* 152C8C 80133AEC 8D4BFFFC */        lw $t3, -4($t2) # dMNResultsIndicatorYOffsets + -4
  /* 152C90 80133AF0 154CFFF8 */       bne $t2, $t4, .L80133AD4
  /* 152C94 80133AF4 ADABFFFC */        sw $t3, -4($t5)
  /* 152C98 80133AF8 0C04CE04 */       jal func_ovl31_80133810
  /* 152C9C 80133AFC 02202025 */        or $a0, $s1, $zero
  /* 152CA0 80133B00 02202025 */        or $a0, $s1, $zero
  /* 152CA4 80133B04 0C04C86B */       jal func_ovl31_801321AC
  /* 152CA8 80133B08 AFA20214 */        sw $v0, 0x214($sp)
  /* 152CAC 80133B0C 0C04C817 */       jal mnResultsGetPresentCount
  /* 152CB0 80133B10 00408025 */        or $s0, $v0, $zero
  /* 152CB4 80133B14 24010002 */     addiu $at, $zero, 2
  /* 152CB8 80133B18 10410008 */       beq $v0, $at, .L80133B3C
  /* 152CBC 80133B1C 8FA50214 */        lw $a1, 0x214($sp)
  /* 152CC0 80133B20 24010003 */     addiu $at, $zero, 3
  /* 152CC4 80133B24 1041001B */       beq $v0, $at, .L80133B94
  /* 152CC8 80133B28 24010004 */     addiu $at, $zero, 4
  /* 152CCC 80133B2C 50410030 */      beql $v0, $at, .L80133BF0
  /* 152CD0 80133B30 0010C940 */       sll $t9, $s0, 5
  /* 152CD4 80133B34 1000002E */         b .L80133BF0
  /* 152CD8 80133B38 0010C940 */       sll $t9, $s0, 5
  .L80133B3C:
  /* 152CDC 80133B3C 0010C940 */       sll $t9, $s0, 5
  /* 152CE0 80133B40 000578C0 */       sll $t7, $a1, 3
  /* 152CE4 80133B44 032F4021 */      addu $t0, $t9, $t7
  /* 152CE8 80133B48 27AE01D0 */     addiu $t6, $sp, 0x1d0
  /* 152CEC 80133B4C 010E1821 */      addu $v1, $t0, $t6
  /* 152CF0 80133B50 C4640000 */      lwc1 $f4, ($v1)
  /* 152CF4 80133B54 8E580074 */        lw $t8, 0x74($s2)
  /* 152CF8 80133B58 02202025 */        or $a0, $s1, $zero
  /* 152CFC 80133B5C E7040058 */      swc1 $f4, 0x58($t8)
  /* 152D00 80133B60 0C04CC52 */       jal mnResultsGetFtKind
  /* 152D04 80133B64 AFA30028 */        sw $v1, 0x28($sp)
  /* 152D08 80133B68 8FA30028 */        lw $v1, 0x28($sp)
  /* 152D0C 80133B6C 00026100 */       sll $t4, $v0, 4
  /* 152D10 80133B70 00105080 */       sll $t2, $s0, 2
  /* 152D14 80133B74 018A6821 */      addu $t5, $t4, $t2
  /* 152D18 80133B78 03AD4821 */      addu $t1, $sp, $t5
  /* 152D1C 80133B7C C5260030 */      lwc1 $f6, 0x30($t1)
  /* 152D20 80133B80 C4680004 */      lwc1 $f8, 4($v1)
  /* 152D24 80133B84 8E4B0074 */        lw $t3, 0x74($s2)
  /* 152D28 80133B88 46083280 */     add.s $f10, $f6, $f8
  /* 152D2C 80133B8C 1000002C */         b .L80133C40
  /* 152D30 80133B90 E56A005C */      swc1 $f10, 0x5c($t3)
  .L80133B94:
  /* 152D34 80133B94 0010C940 */       sll $t9, $s0, 5
  /* 152D38 80133B98 000578C0 */       sll $t7, $a1, 3
  /* 152D3C 80133B9C 032F4021 */      addu $t0, $t9, $t7
  /* 152D40 80133BA0 27AE0170 */     addiu $t6, $sp, 0x170
  /* 152D44 80133BA4 010E1821 */      addu $v1, $t0, $t6
  /* 152D48 80133BA8 C4700000 */      lwc1 $f16, ($v1)
  /* 152D4C 80133BAC 8E580074 */        lw $t8, 0x74($s2)
  /* 152D50 80133BB0 02202025 */        or $a0, $s1, $zero
  /* 152D54 80133BB4 E7100058 */      swc1 $f16, 0x58($t8)
  /* 152D58 80133BB8 0C04CC52 */       jal mnResultsGetFtKind
  /* 152D5C 80133BBC AFA30028 */        sw $v1, 0x28($sp)
  /* 152D60 80133BC0 8FA30028 */        lw $v1, 0x28($sp)
  /* 152D64 80133BC4 00026100 */       sll $t4, $v0, 4
  /* 152D68 80133BC8 00105080 */       sll $t2, $s0, 2
  /* 152D6C 80133BCC 018A6821 */      addu $t5, $t4, $t2
  /* 152D70 80133BD0 03AD4821 */      addu $t1, $sp, $t5
  /* 152D74 80133BD4 C5320030 */      lwc1 $f18, 0x30($t1)
  /* 152D78 80133BD8 C4640004 */      lwc1 $f4, 4($v1)
  /* 152D7C 80133BDC 8E4B0074 */        lw $t3, 0x74($s2)
  /* 152D80 80133BE0 46049180 */     add.s $f6, $f18, $f4
  /* 152D84 80133BE4 10000016 */         b .L80133C40
  /* 152D88 80133BE8 E566005C */      swc1 $f6, 0x5c($t3)
  /* 152D8C 80133BEC 0010C940 */       sll $t9, $s0, 5
  .L80133BF0:
  /* 152D90 80133BF0 000578C0 */       sll $t7, $a1, 3
  /* 152D94 80133BF4 032F4021 */      addu $t0, $t9, $t7
  /* 152D98 80133BF8 27AE00F0 */     addiu $t6, $sp, 0xf0
  /* 152D9C 80133BFC 010E1821 */      addu $v1, $t0, $t6
  /* 152DA0 80133C00 C4680000 */      lwc1 $f8, ($v1)
  /* 152DA4 80133C04 8E580074 */        lw $t8, 0x74($s2)
  /* 152DA8 80133C08 02202025 */        or $a0, $s1, $zero
  /* 152DAC 80133C0C E7080058 */      swc1 $f8, 0x58($t8)
  /* 152DB0 80133C10 0C04CC52 */       jal mnResultsGetFtKind
  /* 152DB4 80133C14 AFA30028 */        sw $v1, 0x28($sp)
  /* 152DB8 80133C18 8FA30028 */        lw $v1, 0x28($sp)
  /* 152DBC 80133C1C 00026100 */       sll $t4, $v0, 4
  /* 152DC0 80133C20 00105080 */       sll $t2, $s0, 2
  /* 152DC4 80133C24 018A6821 */      addu $t5, $t4, $t2
  /* 152DC8 80133C28 03AD4821 */      addu $t1, $sp, $t5
  /* 152DCC 80133C2C C52A0030 */      lwc1 $f10, 0x30($t1)
  /* 152DD0 80133C30 C4700004 */      lwc1 $f16, 4($v1)
  /* 152DD4 80133C34 8E4B0074 */        lw $t3, 0x74($s2)
  /* 152DD8 80133C38 46105480 */     add.s $f18, $f10, $f16
  /* 152DDC 80133C3C E572005C */      swc1 $f18, 0x5c($t3)
  .L80133C40:
  /* 152DE0 80133C40 8FBF0024 */        lw $ra, 0x24($sp)
  /* 152DE4 80133C44 8FB00018 */        lw $s0, 0x18($sp)
  /* 152DE8 80133C48 8FB1001C */        lw $s1, 0x1c($sp)
  /* 152DEC 80133C4C 8FB20020 */        lw $s2, 0x20($sp)
  /* 152DF0 80133C50 03E00008 */        jr $ra
  /* 152DF4 80133C54 27BD0218 */     addiu $sp, $sp, 0x218

glabel mnResultsCreatePlayerIndicator
  /* 152DF8 80133C58 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 152DFC 80133C5C 3C0F8014 */       lui $t7, %hi(dMNResultsUnusedIndicatorColors)
  /* 152E00 80133C60 AFBF0024 */        sw $ra, 0x24($sp)
  /* 152E04 80133C64 AFB00020 */        sw $s0, 0x20($sp)
  /* 152E08 80133C68 AFA40058 */        sw $a0, 0x58($sp)
  /* 152E0C 80133C6C 25EF938C */     addiu $t7, $t7, %lo(dMNResultsUnusedIndicatorColors)
  /* 152E10 80133C70 8DF90000 */        lw $t9, ($t7) # dMNResultsUnusedIndicatorColors + 0
  /* 152E14 80133C74 8DF80004 */        lw $t8, 4($t7) # dMNResultsUnusedIndicatorColors + 4
  /* 152E18 80133C78 27AE0038 */     addiu $t6, $sp, 0x38
  /* 152E1C 80133C7C ADD90000 */        sw $t9, ($t6)
  /* 152E20 80133C80 ADD80004 */        sw $t8, 4($t6)
  /* 152E24 80133C84 8DF8000C */        lw $t8, 0xc($t7) # dMNResultsUnusedIndicatorColors + 12
  /* 152E28 80133C88 8DF90008 */        lw $t9, 8($t7) # dMNResultsUnusedIndicatorColors + 8
  /* 152E2C 80133C8C 3C098014 */       lui $t1, %hi(dMNResultsIndicatorOffsets)
  /* 152E30 80133C90 ADD8000C */        sw $t8, 0xc($t6)
  /* 152E34 80133C94 ADD90008 */        sw $t9, 8($t6)
  /* 152E38 80133C98 8DF90010 */        lw $t9, 0x10($t7) # dMNResultsUnusedIndicatorColors + 16
  /* 152E3C 80133C9C 8DF80014 */        lw $t8, 0x14($t7) # dMNResultsUnusedIndicatorColors + 20
  /* 152E40 80133CA0 252993A4 */     addiu $t1, $t1, %lo(dMNResultsIndicatorOffsets)
  /* 152E44 80133CA4 ADD90010 */        sw $t9, 0x10($t6)
  /* 152E48 80133CA8 ADD80014 */        sw $t8, 0x14($t6)
  /* 152E4C 80133CAC 8D2A0004 */        lw $t2, 4($t1) # dMNResultsIndicatorOffsets + 4
  /* 152E50 80133CB0 8D2B0000 */        lw $t3, ($t1) # dMNResultsIndicatorOffsets + 0
  /* 152E54 80133CB4 27A80028 */     addiu $t0, $sp, 0x28
  /* 152E58 80133CB8 AD0A0004 */        sw $t2, 4($t0)
  /* 152E5C 80133CBC AD0B0000 */        sw $t3, ($t0)
  /* 152E60 80133CC0 8D2B0008 */        lw $t3, 8($t1) # dMNResultsIndicatorOffsets + 8
  /* 152E64 80133CC4 8D2A000C */        lw $t2, 0xc($t1) # dMNResultsIndicatorOffsets + 12
  /* 152E68 80133CC8 00A08025 */        or $s0, $a1, $zero
  /* 152E6C 80133CCC 00002825 */        or $a1, $zero, $zero
  /* 152E70 80133CD0 00002025 */        or $a0, $zero, $zero
  /* 152E74 80133CD4 24060012 */     addiu $a2, $zero, 0x12
  /* 152E78 80133CD8 3C078000 */       lui $a3, 0x8000
  /* 152E7C 80133CDC AD0B0008 */        sw $t3, 8($t0)
  /* 152E80 80133CE0 0C00265A */       jal omMakeGObjSPAfter
  /* 152E84 80133CE4 AD0A000C */        sw $t2, 0xc($t0)
  /* 152E88 80133CE8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 152E8C 80133CEC 240CFFFF */     addiu $t4, $zero, -1
  /* 152E90 80133CF0 AFA20054 */        sw $v0, 0x54($sp)
  /* 152E94 80133CF4 AFAC0010 */        sw $t4, 0x10($sp)
  /* 152E98 80133CF8 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 152E9C 80133CFC 00402025 */        or $a0, $v0, $zero
  /* 152EA0 80133D00 2406001B */     addiu $a2, $zero, 0x1b
  /* 152EA4 80133D04 0C00277D */       jal omAddGObjRenderProc
  /* 152EA8 80133D08 3C078000 */       lui $a3, 0x8000
  /* 152EAC 80133D0C 8FA20058 */        lw $v0, 0x58($sp)
  /* 152EB0 80133D10 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x22))
  /* 152EB4 80133D14 8FA40054 */        lw $a0, 0x54($sp)
  /* 152EB8 80133D18 000268C0 */       sll $t5, $v0, 3
  /* 152EBC 80133D1C 01A26823 */      subu $t5, $t5, $v0
  /* 152EC0 80133D20 000D6880 */       sll $t5, $t5, 2
  /* 152EC4 80133D24 01A26821 */      addu $t5, $t5, $v0
  /* 152EC8 80133D28 000D6880 */       sll $t5, $t5, 2
  /* 152ECC 80133D2C 01CD7021 */      addu $t6, $t6, $t5
  /* 152ED0 80133D30 91CE4D2A */       lbu $t6, %lo((gTransferBattleState + 0x22))($t6)
  /* 152ED4 80133D34 3C088014 */       lui $t0, 0x8014
  /* 152ED8 80133D38 3C090000 */       lui $t1, 0
  /* 152EDC 80133D3C 15C00026 */      bnez $t6, .L80133DD8
  /* 152EE0 80133D40 00027880 */       sll $t7, $v0, 2
  /* 152EE4 80133D44 03AFC021 */      addu $t8, $sp, $t7
  /* 152EE8 80133D48 3C198014 */       lui $t9, %hi(D_ovl31_8013A04C)
  /* 152EEC 80133D4C 8F39A04C */        lw $t9, %lo(D_ovl31_8013A04C)($t9)
  /* 152EF0 80133D50 8F180028 */        lw $t8, 0x28($t8)
  /* 152EF4 80133D54 8FA40054 */        lw $a0, 0x54($sp)
  /* 152EF8 80133D58 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 152EFC 80133D5C 03192821 */      addu $a1, $t8, $t9
  /* 152F00 80133D60 94480024 */       lhu $t0, 0x24($v0)
  /* 152F04 80133D64 3C0C8013 */       lui $t4, %hi(ifPlayer_Tag_ShadowColorsR)
  /* 152F08 80133D68 01906021 */      addu $t4, $t4, $s0
  /* 152F0C 80133D6C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 152F10 80133D70 A44A0024 */        sh $t2, 0x24($v0)
  /* 152F14 80133D74 354B0001 */       ori $t3, $t2, 1
  /* 152F18 80133D78 A44B0024 */        sh $t3, 0x24($v0)
  /* 152F1C 80133D7C 918CEF94 */       lbu $t4, %lo(ifPlayer_Tag_ShadowColorsR)($t4)
  /* 152F20 80133D80 3C0D8013 */       lui $t5, %hi(ifPlayer_Tag_ShadowColorsG)
  /* 152F24 80133D84 01B06821 */      addu $t5, $t5, $s0
  /* 152F28 80133D88 A04C0060 */        sb $t4, 0x60($v0)
  /* 152F2C 80133D8C 91ADEF9C */       lbu $t5, %lo(ifPlayer_Tag_ShadowColorsG)($t5)
  /* 152F30 80133D90 3C0E8013 */       lui $t6, %hi(ifPlayer_Tag_ShadowColorsB)
  /* 152F34 80133D94 01D07021 */      addu $t6, $t6, $s0
  /* 152F38 80133D98 A04D0061 */        sb $t5, 0x61($v0)
  /* 152F3C 80133D9C 91CEEFA4 */       lbu $t6, %lo(ifPlayer_Tag_ShadowColorsB)($t6)
  /* 152F40 80133DA0 3C0F8013 */       lui $t7, %hi(ifPlayer_Tag_SpriteColorsR)
  /* 152F44 80133DA4 01F07821 */      addu $t7, $t7, $s0
  /* 152F48 80133DA8 A04E0062 */        sb $t6, 0x62($v0)
  /* 152F4C 80133DAC 91EFEF7C */       lbu $t7, %lo(ifPlayer_Tag_SpriteColorsR)($t7)
  /* 152F50 80133DB0 3C188013 */       lui $t8, %hi(ifPlayer_Tag_SpriteColorsG)
  /* 152F54 80133DB4 0310C021 */      addu $t8, $t8, $s0
  /* 152F58 80133DB8 A04F0028 */        sb $t7, 0x28($v0)
  /* 152F5C 80133DBC 9318EF84 */       lbu $t8, %lo(ifPlayer_Tag_SpriteColorsG)($t8)
  /* 152F60 80133DC0 3C198013 */       lui $t9, %hi(ifPlayer_Tag_SpriteColorsB)
  /* 152F64 80133DC4 0330C821 */      addu $t9, $t9, $s0
  /* 152F68 80133DC8 A0580029 */        sb $t8, 0x29($v0)
  /* 152F6C 80133DCC 9339EF8C */       lbu $t9, %lo(ifPlayer_Tag_SpriteColorsB)($t9)
  /* 152F70 80133DD0 10000022 */         b .L80133E5C
  /* 152F74 80133DD4 A059002A */        sb $t9, 0x2a($v0)
  .L80133DD8:
  /* 152F78 80133DD8 8D08A04C */        lw $t0, -0x5fb4($t0)
  /* 152F7C 80133DDC 25290CD8 */     addiu $t1, $t1, 0xcd8
  /* 152F80 80133DE0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 152F84 80133DE4 01092821 */      addu $a1, $t0, $t1
  /* 152F88 80133DE8 944A0024 */       lhu $t2, 0x24($v0)
  /* 152F8C 80133DEC 3C0E8013 */       lui $t6, %hi(ifPlayer_Tag_ShadowColorsR)
  /* 152F90 80133DF0 01D07021 */      addu $t6, $t6, $s0
  /* 152F94 80133DF4 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 152F98 80133DF8 A44C0024 */        sh $t4, 0x24($v0)
  /* 152F9C 80133DFC 358D0001 */       ori $t5, $t4, 1
  /* 152FA0 80133E00 A44D0024 */        sh $t5, 0x24($v0)
  /* 152FA4 80133E04 91CEEF94 */       lbu $t6, %lo(ifPlayer_Tag_ShadowColorsR)($t6)
  /* 152FA8 80133E08 3C0F8013 */       lui $t7, %hi(ifPlayer_Tag_ShadowColorsG)
  /* 152FAC 80133E0C 01F07821 */      addu $t7, $t7, $s0
  /* 152FB0 80133E10 A04E0060 */        sb $t6, 0x60($v0)
  /* 152FB4 80133E14 91EFEF9C */       lbu $t7, %lo(ifPlayer_Tag_ShadowColorsG)($t7)
  /* 152FB8 80133E18 3C188013 */       lui $t8, %hi(ifPlayer_Tag_ShadowColorsB)
  /* 152FBC 80133E1C 0310C021 */      addu $t8, $t8, $s0
  /* 152FC0 80133E20 A04F0061 */        sb $t7, 0x61($v0)
  /* 152FC4 80133E24 9318EFA4 */       lbu $t8, %lo(ifPlayer_Tag_ShadowColorsB)($t8)
  /* 152FC8 80133E28 3C198013 */       lui $t9, %hi(ifPlayer_Tag_SpriteColorsR)
  /* 152FCC 80133E2C 0330C821 */      addu $t9, $t9, $s0
  /* 152FD0 80133E30 A0580062 */        sb $t8, 0x62($v0)
  /* 152FD4 80133E34 9339EF7C */       lbu $t9, %lo(ifPlayer_Tag_SpriteColorsR)($t9)
  /* 152FD8 80133E38 3C088013 */       lui $t0, %hi(ifPlayer_Tag_SpriteColorsG)
  /* 152FDC 80133E3C 01104021 */      addu $t0, $t0, $s0
  /* 152FE0 80133E40 A0590028 */        sb $t9, 0x28($v0)
  /* 152FE4 80133E44 9108EF84 */       lbu $t0, %lo(ifPlayer_Tag_SpriteColorsG)($t0)
  /* 152FE8 80133E48 3C098013 */       lui $t1, %hi(ifPlayer_Tag_SpriteColorsB)
  /* 152FEC 80133E4C 01304821 */      addu $t1, $t1, $s0
  /* 152FF0 80133E50 A0480029 */        sb $t0, 0x29($v0)
  /* 152FF4 80133E54 9129EF8C */       lbu $t1, %lo(ifPlayer_Tag_SpriteColorsB)($t1)
  /* 152FF8 80133E58 A049002A */        sb $t1, 0x2a($v0)
  .L80133E5C:
  /* 152FFC 80133E5C 8FA40054 */        lw $a0, 0x54($sp)
  /* 153000 80133E60 0C04CE7D */       jal mnResultsSetIndicatorPosition
  /* 153004 80133E64 8FA50058 */        lw $a1, 0x58($sp)
  /* 153008 80133E68 8FBF0024 */        lw $ra, 0x24($sp)
  /* 15300C 80133E6C 8FB00020 */        lw $s0, 0x20($sp)
  /* 153010 80133E70 27BD0058 */     addiu $sp, $sp, 0x58
  /* 153014 80133E74 03E00008 */        jr $ra
  /* 153018 80133E78 00000000 */       nop

glabel mnResultsCreatePlayerIndicatorViewport
  /* 15301C 80133E7C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 153020 80133E80 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 153024 80133E84 AFBF003C */        sw $ra, 0x3c($sp)
  /* 153028 80133E88 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 15302C 80133E8C 240F001E */     addiu $t7, $zero, 0x1e
  /* 153030 80133E90 24180000 */     addiu $t8, $zero, 0
  /* 153034 80133E94 3C190800 */       lui $t9, 0x800
  /* 153038 80133E98 2408FFFF */     addiu $t0, $zero, -1
  /* 15303C 80133E9C 24090001 */     addiu $t1, $zero, 1
  /* 153040 80133EA0 240A0001 */     addiu $t2, $zero, 1
  /* 153044 80133EA4 AFAA0030 */        sw $t2, 0x30($sp)
  /* 153048 80133EA8 AFA90028 */        sw $t1, 0x28($sp)
  /* 15304C 80133EAC AFA80020 */        sw $t0, 0x20($sp)
  /* 153050 80133EB0 AFB9001C */        sw $t9, 0x1c($sp)
  /* 153054 80133EB4 AFB80018 */        sw $t8, 0x18($sp)
  /* 153058 80133EB8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 15305C 80133EBC AFAE0010 */        sw $t6, 0x10($sp)
  /* 153060 80133EC0 AFA00024 */        sw $zero, 0x24($sp)
  /* 153064 80133EC4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 153068 80133EC8 AFA00034 */        sw $zero, 0x34($sp)
  /* 15306C 80133ECC 24040401 */     addiu $a0, $zero, 0x401
  /* 153070 80133ED0 00002825 */        or $a1, $zero, $zero
  /* 153074 80133ED4 24060010 */     addiu $a2, $zero, 0x10
  /* 153078 80133ED8 0C002E4F */       jal func_8000B93C
  /* 15307C 80133EDC 3C078000 */       lui $a3, 0x8000
  /* 153080 80133EE0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 153084 80133EE4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 153088 80133EE8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 15308C 80133EEC 8C430074 */        lw $v1, 0x74($v0)
  /* 153090 80133EF0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 153094 80133EF4 44050000 */      mfc1 $a1, $f0
  /* 153098 80133EF8 44060000 */      mfc1 $a2, $f0
  /* 15309C 80133EFC 3C07439B */       lui $a3, 0x439b
  /* 1530A0 80133F00 24640008 */     addiu $a0, $v1, 8
  /* 1530A4 80133F04 0C001C20 */       jal func_80007080
  /* 1530A8 80133F08 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1530AC 80133F0C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 1530B0 80133F10 27BD0040 */     addiu $sp, $sp, 0x40
  /* 1530B4 80133F14 03E00008 */        jr $ra
  /* 1530B8 80133F18 00000000 */       nop

glabel mnResultsGetCharIndex
  /* 1530BC 80133F1C AFA40000 */        sw $a0, ($sp)
  /* 1530C0 80133F20 308400FF */      andi $a0, $a0, 0xff
  /* 1530C4 80133F24 24010020 */     addiu $at, $zero, 0x20
  /* 1530C8 80133F28 1081000C */       beq $a0, $at, .L80133F5C
  /* 1530CC 80133F2C 00801825 */        or $v1, $a0, $zero
  /* 1530D0 80133F30 24010021 */     addiu $at, $zero, 0x21
  /* 1530D4 80133F34 10810005 */       beq $a0, $at, .L80133F4C
  /* 1530D8 80133F38 2401002E */     addiu $at, $zero, 0x2e
  /* 1530DC 80133F3C 10810005 */       beq $a0, $at, .L80133F54
  /* 1530E0 80133F40 2462FFBF */     addiu $v0, $v1, -0x41
  /* 1530E4 80133F44 10000007 */         b .L80133F64
  /* 1530E8 80133F48 00000000 */       nop
  .L80133F4C:
  /* 1530EC 80133F4C 03E00008 */        jr $ra
  /* 1530F0 80133F50 2402001A */     addiu $v0, $zero, 0x1a

  .L80133F54:
  /* 1530F4 80133F54 03E00008 */        jr $ra
  /* 1530F8 80133F58 2402001B */     addiu $v0, $zero, 0x1b

  .L80133F5C:
  /* 1530FC 80133F5C 03E00008 */        jr $ra
  /* 153100 80133F60 2402001C */     addiu $v0, $zero, 0x1c

  .L80133F64:
  /* 153104 80133F64 03E00008 */        jr $ra
  /* 153108 80133F68 00000000 */       nop

glabel mnResultsDrawString
  /* 15310C 80133F6C 27BDFE68 */     addiu $sp, $sp, -0x198
  /* 153110 80133F70 F7B80030 */      sdc1 $f24, 0x30($sp)
  /* 153114 80133F74 3C0F8014 */       lui $t7, %hi(dMNResultsCharWidths)
  /* 153118 80133F78 AFB1004C */        sw $s1, 0x4c($sp)
  /* 15311C 80133F7C AFB00048 */        sw $s0, 0x48($sp)
  /* 153120 80133F80 25EF93B4 */     addiu $t7, $t7, %lo(dMNResultsCharWidths)
  /* 153124 80133F84 4486C000 */      mtc1 $a2, $f24
  /* 153128 80133F88 44856000 */      mtc1 $a1, $f12
  /* 15312C 80133F8C 00808025 */        or $s0, $a0, $zero
  /* 153130 80133F90 3C118000 */       lui $s1, 0x8000
  /* 153134 80133F94 AFBF006C */        sw $ra, 0x6c($sp)
  /* 153138 80133F98 AFBE0068 */        sw $fp, 0x68($sp)
  /* 15313C 80133F9C AFB70064 */        sw $s7, 0x64($sp)
  /* 153140 80133FA0 AFB60060 */        sw $s6, 0x60($sp)
  /* 153144 80133FA4 AFB5005C */        sw $s5, 0x5c($sp)
  /* 153148 80133FA8 AFB40058 */        sw $s4, 0x58($sp)
  /* 15314C 80133FAC AFB30054 */        sw $s3, 0x54($sp)
  /* 153150 80133FB0 AFB20050 */        sw $s2, 0x50($sp)
  /* 153154 80133FB4 F7BC0040 */      sdc1 $f28, 0x40($sp)
  /* 153158 80133FB8 F7BA0038 */      sdc1 $f26, 0x38($sp)
  /* 15315C 80133FBC F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 153160 80133FC0 F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 153164 80133FC4 AFA701A4 */        sw $a3, 0x1a4($sp)
  /* 153168 80133FC8 25E8006C */     addiu $t0, $t7, 0x6c
  /* 15316C 80133FCC 27AE0114 */     addiu $t6, $sp, 0x114
  .L80133FD0:
  /* 153170 80133FD0 8DF90000 */        lw $t9, ($t7) # dMNResultsCharWidths + 0
  /* 153174 80133FD4 25EF000C */     addiu $t7, $t7, 0xc
  /* 153178 80133FD8 25CE000C */     addiu $t6, $t6, 0xc
  /* 15317C 80133FDC ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 153180 80133FE0 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsCharWidths + -8
  /* 153184 80133FE4 ADD8FFF8 */        sw $t8, -8($t6)
  /* 153188 80133FE8 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsCharWidths + -4
  /* 15318C 80133FEC 15E8FFF8 */       bne $t7, $t0, .L80133FD0
  /* 153190 80133FF0 ADD9FFFC */        sw $t9, -4($t6)
  /* 153194 80133FF4 8DF90000 */        lw $t9, ($t7) # dMNResultsCharWidths + 0
  /* 153198 80133FF8 3C0A8014 */       lui $t2, %hi(dMNResultsCharOffsets)
  /* 15319C 80133FFC 254A9424 */     addiu $t2, $t2, %lo(dMNResultsCharOffsets)
  /* 1531A0 80134000 254D006C */     addiu $t5, $t2, 0x6c
  /* 1531A4 80134004 27A900A4 */     addiu $t1, $sp, 0xa4
  /* 1531A8 80134008 ADD90000 */        sw $t9, ($t6)
  .L8013400C:
  /* 1531AC 8013400C 8D4C0000 */        lw $t4, ($t2) # dMNResultsCharOffsets + 0
  /* 1531B0 80134010 254A000C */     addiu $t2, $t2, 0xc
  /* 1531B4 80134014 2529000C */     addiu $t1, $t1, 0xc
  /* 1531B8 80134018 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 1531BC 8013401C 8D4BFFF8 */        lw $t3, -8($t2) # dMNResultsCharOffsets + -8
  /* 1531C0 80134020 AD2BFFF8 */        sw $t3, -8($t1)
  /* 1531C4 80134024 8D4CFFFC */        lw $t4, -4($t2) # dMNResultsCharOffsets + -4
  /* 1531C8 80134028 154DFFF8 */       bne $t2, $t5, .L8013400C
  /* 1531CC 8013402C AD2CFFFC */        sw $t4, -4($t1)
  /* 1531D0 80134030 8D4C0000 */        lw $t4, ($t2) # dMNResultsCharOffsets + 0
  /* 1531D4 80134034 3C0F8014 */       lui $t7, %hi(dMNResultsCharColors)
  /* 1531D8 80134038 25EF9494 */     addiu $t7, $t7, %lo(dMNResultsCharColors)
  /* 1531DC 8013403C AD2C0000 */        sw $t4, ($t1)
  /* 1531E0 80134040 8DF80000 */        lw $t8, ($t7) # dMNResultsCharColors + 0
  /* 1531E4 80134044 27A80084 */     addiu $t0, $sp, 0x84
  /* 1531E8 80134048 8DEE0004 */        lw $t6, 4($t7) # dMNResultsCharColors + 4
  /* 1531EC 8013404C AD180000 */        sw $t8, ($t0)
  /* 1531F0 80134050 8DF80008 */        lw $t8, 8($t7) # dMNResultsCharColors + 8
  /* 1531F4 80134054 AD0E0004 */        sw $t6, 4($t0)
  /* 1531F8 80134058 8DEE000C */        lw $t6, 0xc($t7) # dMNResultsCharColors + 12
  /* 1531FC 8013405C AD180008 */        sw $t8, 8($t0)
  /* 153200 80134060 8DF80010 */        lw $t8, 0x10($t7) # dMNResultsCharColors + 16
  /* 153204 80134064 AD0E000C */        sw $t6, 0xc($t0)
  /* 153208 80134068 8DEE0014 */        lw $t6, 0x14($t7) # dMNResultsCharColors + 20
  /* 15320C 8013406C AD180010 */        sw $t8, 0x10($t0)
  /* 153210 80134070 8DF80018 */        lw $t8, 0x18($t7) # dMNResultsCharColors + 24
  /* 153214 80134074 46006506 */     mov.s $f20, $f12
  /* 153218 80134078 00002025 */        or $a0, $zero, $zero
  /* 15321C 8013407C AD180018 */        sw $t8, 0x18($t0)
  /* 153220 80134080 95F8001C */       lhu $t8, 0x1c($t7) # dMNResultsCharColors + 28
  /* 153224 80134084 00002825 */        or $a1, $zero, $zero
  /* 153228 80134088 24060014 */     addiu $a2, $zero, 0x14
  /* 15322C 8013408C 02203825 */        or $a3, $s1, $zero
  /* 153230 80134090 AD0E0014 */        sw $t6, 0x14($t0)
  /* 153234 80134094 0C00265A */       jal omMakeGObjSPAfter
  /* 153238 80134098 A518001C */        sh $t8, 0x1c($t0)
  /* 15323C 8013409C 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 153240 801340A0 2419FFFF */     addiu $t9, $zero, -1
  /* 153244 801340A4 0040F025 */        or $fp, $v0, $zero
  /* 153248 801340A8 AFB90010 */        sw $t9, 0x10($sp)
  /* 15324C 801340AC 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 153250 801340B0 00402025 */        or $a0, $v0, $zero
  /* 153254 801340B4 2406001D */     addiu $a2, $zero, 0x1d
  /* 153258 801340B8 0C00277D */       jal omAddGObjRenderProc
  /* 15325C 801340BC 02203825 */        or $a3, $s1, $zero
  /* 153260 801340C0 920D0000 */       lbu $t5, ($s0)
  /* 153264 801340C4 02009825 */        or $s3, $s0, $zero
  /* 153268 801340C8 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 15326C 801340CC 11A0004A */      beqz $t5, .L801341F8
  /* 153270 801340D0 31A400FF */      andi $a0, $t5, 0xff
  /* 153274 801340D4 4481E000 */      mtc1 $at, $f28 # 26.0 to cop1
  /* 153278 801340D8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 15327C 801340DC 3C158014 */       lui $s5, %hi(D_ovl31_8013A048)
  /* 153280 801340E0 4481D000 */      mtc1 $at, $f26 # 10.0 to cop1
  /* 153284 801340E4 26B5A048 */     addiu $s5, $s5, %lo(D_ovl31_8013A048)
  /* 153288 801340E8 00801025 */        or $v0, $a0, $zero
  /* 15328C 801340EC C7B601A8 */      lwc1 $f22, 0x1a8($sp)
  /* 153290 801340F0 2417FFDF */     addiu $s7, $zero, -0x21
  /* 153294 801340F4 27B60110 */     addiu $s6, $sp, 0x110
  /* 153298 801340F8 2414001C */     addiu $s4, $zero, 0x1c
  .L801340FC:
  /* 15329C 801340FC 28410030 */      slti $at, $v0, 0x30
  /* 1532A0 80134100 14200008 */      bnez $at, .L80134124
  /* 1532A4 80134104 2841003A */      slti $at, $v0, 0x3a
  /* 1532A8 80134108 10200006 */      beqz $at, .L80134124
  /* 1532AC 8013410C 244AFFD0 */     addiu $t2, $v0, -0x30
  /* 1532B0 80134110 448A2000 */      mtc1 $t2, $f4
  /* 1532B4 80134114 00000000 */       nop
  /* 1532B8 80134118 468021A0 */   cvt.s.w $f6, $f4
  /* 1532BC 8013411C 10000032 */         b .L801341E8
  /* 1532C0 80134120 4606A500 */     add.s $f20, $f20, $f6
  .L80134124:
  /* 1532C4 80134124 0C04CFC7 */       jal mnResultsGetCharIndex
  /* 1532C8 80134128 00000000 */       nop
  /* 1532CC 8013412C 14540004 */       bne $v0, $s4, .L80134140
  /* 1532D0 80134130 00401825 */        or $v1, $v0, $zero
  /* 1532D4 80134134 4616D202 */     mul.s $f8, $f26, $f22
  /* 1532D8 80134138 1000002B */         b .L801341E8
  /* 1532DC 8013413C 4608A500 */     add.s $f20, $f20, $f8
  .L80134140:
  /* 1532E0 80134140 8FA801A4 */        lw $t0, 0x1a4($sp)
  /* 1532E4 80134144 00038880 */       sll $s1, $v1, 2
  /* 1532E8 80134148 27A900A4 */     addiu $t1, $sp, 0xa4
  /* 1532EC 8013414C 02299021 */      addu $s2, $s1, $t1
  /* 1532F0 80134150 00087880 */       sll $t7, $t0, 2
  /* 1532F4 80134154 8E4B0000 */        lw $t3, ($s2)
  /* 1532F8 80134158 8EAC0018 */        lw $t4, 0x18($s5) # D_ovl31_8013A048 + 24
  /* 1532FC 8013415C 01E87823 */      subu $t7, $t7, $t0
  /* 153300 80134160 000F7840 */       sll $t7, $t7, 1
  /* 153304 80134164 27AE0084 */     addiu $t6, $sp, 0x84
  /* 153308 80134168 01EE8021 */      addu $s0, $t7, $t6
  /* 15330C 8013416C 03C02025 */        or $a0, $fp, $zero
  /* 153310 80134170 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153314 80134174 016C2821 */      addu $a1, $t3, $t4
  /* 153318 80134178 E4560018 */      swc1 $f22, 0x18($v0)
  /* 15331C 8013417C 16560004 */       bne $s2, $s6, .L80134190
  /* 153320 80134180 E4540058 */      swc1 $f20, 0x58($v0)
  /* 153324 80134184 461CC280 */     add.s $f10, $f24, $f28
  /* 153328 80134188 10000002 */         b .L80134194
  /* 15332C 8013418C E44A005C */      swc1 $f10, 0x5c($v0)
  .L80134190:
  /* 153330 80134190 E458005C */      swc1 $f24, 0x5c($v0)
  .L80134194:
  /* 153334 80134194 94580024 */       lhu $t8, 0x24($v0)
  /* 153338 80134198 03176824 */       and $t5, $t8, $s7
  /* 15333C 8013419C A44D0024 */        sh $t5, 0x24($v0)
  /* 153340 801341A0 35AA0001 */       ori $t2, $t5, 1
  /* 153344 801341A4 A44A0024 */        sh $t2, 0x24($v0)
  /* 153348 801341A8 92090000 */       lbu $t1, ($s0)
  /* 15334C 801341AC 03B1C021 */      addu $t8, $sp, $s1
  /* 153350 801341B0 A0490060 */        sb $t1, 0x60($v0)
  /* 153354 801341B4 920B0001 */       lbu $t3, 1($s0)
  /* 153358 801341B8 A04B0061 */        sb $t3, 0x61($v0)
  /* 15335C 801341BC 920C0002 */       lbu $t4, 2($s0)
  /* 153360 801341C0 A04C0062 */        sb $t4, 0x62($v0)
  /* 153364 801341C4 92080003 */       lbu $t0, 3($s0)
  /* 153368 801341C8 A0480028 */        sb $t0, 0x28($v0)
  /* 15336C 801341CC 920F0004 */       lbu $t7, 4($s0)
  /* 153370 801341D0 A04F0029 */        sb $t7, 0x29($v0)
  /* 153374 801341D4 920E0005 */       lbu $t6, 5($s0)
  /* 153378 801341D8 A04E002A */        sb $t6, 0x2a($v0)
  /* 15337C 801341DC C7100114 */      lwc1 $f16, 0x114($t8)
  /* 153380 801341E0 46168482 */     mul.s $f18, $f16, $f22
  /* 153384 801341E4 4612A500 */     add.s $f20, $f20, $f18
  .L801341E8:
  /* 153388 801341E8 92640001 */       lbu $a0, 1($s3)
  /* 15338C 801341EC 26730001 */     addiu $s3, $s3, 1
  /* 153390 801341F0 1480FFC2 */      bnez $a0, .L801340FC
  /* 153394 801341F4 00801025 */        or $v0, $a0, $zero
  .L801341F8:
  /* 153398 801341F8 8FBF006C */        lw $ra, 0x6c($sp)
  /* 15339C 801341FC D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 1533A0 80134200 D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 1533A4 80134204 D7B80030 */      ldc1 $f24, 0x30($sp)
  /* 1533A8 80134208 D7BA0038 */      ldc1 $f26, 0x38($sp)
  /* 1533AC 8013420C D7BC0040 */      ldc1 $f28, 0x40($sp)
  /* 1533B0 80134210 8FB00048 */        lw $s0, 0x48($sp)
  /* 1533B4 80134214 8FB1004C */        lw $s1, 0x4c($sp)
  /* 1533B8 80134218 8FB20050 */        lw $s2, 0x50($sp)
  /* 1533BC 8013421C 8FB30054 */        lw $s3, 0x54($sp)
  /* 1533C0 80134220 8FB40058 */        lw $s4, 0x58($sp)
  /* 1533C4 80134224 8FB5005C */        lw $s5, 0x5c($sp)
  /* 1533C8 80134228 8FB60060 */        lw $s6, 0x60($sp)
  /* 1533CC 8013422C 8FB70064 */        lw $s7, 0x64($sp)
  /* 1533D0 80134230 8FBE0068 */        lw $fp, 0x68($sp)
  /* 1533D4 80134234 03E00008 */        jr $ra
  /* 1533D8 80134238 27BD0198 */     addiu $sp, $sp, 0x198

glabel mnResultsDrawWinsText
  /* 1533DC 8013423C 27BDFF88 */     addiu $sp, $sp, -0x78
  /* 1533E0 80134240 3C0F8014 */       lui $t7, %hi(dMNResultsStringWin)
  /* 1533E4 80134244 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1533E8 80134248 AFA40078 */        sw $a0, 0x78($sp)
  /* 1533EC 8013424C 25EF97C0 */     addiu $t7, $t7, %lo(dMNResultsStringWin)
  /* 1533F0 80134250 8DF90000 */        lw $t9, ($t7) # dMNResultsStringWin + 0
  /* 1533F4 80134254 8DF80004 */        lw $t8, 4($t7) # dMNResultsStringWin + 4
  /* 1533F8 80134258 27AE0070 */     addiu $t6, $sp, 0x70
  /* 1533FC 8013425C 3C098014 */       lui $t1, %hi(dMNResultsStringWins)
  /* 153400 80134260 252997C8 */     addiu $t1, $t1, %lo(dMNResultsStringWins)
  /* 153404 80134264 ADD90000 */        sw $t9, ($t6)
  /* 153408 80134268 ADD80004 */        sw $t8, 4($t6)
  /* 15340C 8013426C 8D2B0000 */        lw $t3, ($t1) # dMNResultsStringWins + 0
  /* 153410 80134270 27A80064 */     addiu $t0, $sp, 0x64
  /* 153414 80134274 8D2A0004 */        lw $t2, 4($t1) # dMNResultsStringWins + 4
  /* 153418 80134278 AD0B0000 */        sw $t3, ($t0)
  /* 15341C 8013427C 952B0008 */       lhu $t3, 8($t1) # dMNResultsStringWins + 8
  /* 153420 80134280 3C0D8014 */       lui $t5, %hi(dMNResultsWinsXByKind)
  /* 153424 80134284 25AD94B4 */     addiu $t5, $t5, %lo(dMNResultsWinsXByKind)
  /* 153428 80134288 27A30028 */     addiu $v1, $sp, 0x28
  /* 15342C 8013428C 25B80030 */     addiu $t8, $t5, 0x30
  /* 153430 80134290 27AC0034 */     addiu $t4, $sp, 0x34
  /* 153434 80134294 AD0A0004 */        sw $t2, 4($t0)
  /* 153438 80134298 A50B0008 */        sh $t3, 8($t0)
  .L8013429C:
  /* 15343C 8013429C 8DAF0000 */        lw $t7, ($t5) # dMNResultsWinsXByKind + 0
  /* 153440 801342A0 25AD000C */     addiu $t5, $t5, 0xc
  /* 153444 801342A4 258C000C */     addiu $t4, $t4, 0xc
  /* 153448 801342A8 AD8FFFF4 */        sw $t7, -0xc($t4)
  /* 15344C 801342AC 8DAEFFF8 */        lw $t6, -8($t5) # dMNResultsWinsXByKind + -8
  /* 153450 801342B0 AD8EFFF8 */        sw $t6, -8($t4)
  /* 153454 801342B4 8DAFFFFC */        lw $t7, -4($t5) # dMNResultsWinsXByKind + -4
  /* 153458 801342B8 15B8FFF8 */       bne $t5, $t8, .L8013429C
  /* 15345C 801342BC AD8FFFFC */        sw $t7, -4($t4)
  /* 153460 801342C0 3C198014 */       lui $t9, %hi(dMNResultsWinsXByTeam)
  /* 153464 801342C4 273994E4 */     addiu $t9, $t9, %lo(dMNResultsWinsXByTeam)
  /* 153468 801342C8 8F290000 */        lw $t1, ($t9) # dMNResultsWinsXByTeam + 0
  /* 15346C 801342CC 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 153470 801342D0 24010001 */     addiu $at, $zero, 1
  /* 153474 801342D4 AC690000 */        sw $t1, ($v1)
  /* 153478 801342D8 8F280004 */        lw $t0, 4($t9) # dMNResultsWinsXByTeam + 4
  /* 15347C 801342DC 27A40064 */     addiu $a0, $sp, 0x64
  /* 153480 801342E0 3C064334 */       lui $a2, 0x4334
  /* 153484 801342E4 AC680004 */        sw $t0, 4($v1)
  /* 153488 801342E8 8F290008 */        lw $t1, 8($t9) # dMNResultsWinsXByTeam + 8
  /* 15348C 801342EC 24070003 */     addiu $a3, $zero, 3
  /* 153490 801342F0 AC690008 */        sw $t1, 8($v1)
  /* 153494 801342F4 90429C14 */       lbu $v0, %lo(gMNResultsIsTeamBattle)($v0)
  /* 153498 801342F8 8FAA0078 */        lw $t2, 0x78($sp)
  /* 15349C 801342FC 14410009 */       bne $v0, $at, .L80134324
  /* 1534A0 80134300 000A5880 */       sll $t3, $t2, 2
  /* 1534A4 80134304 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1534A8 80134308 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 1534AC 8013430C 006BC021 */      addu $t8, $v1, $t3
  /* 1534B0 80134310 8F050000 */        lw $a1, ($t8)
  /* 1534B4 80134314 0C04CFDB */       jal mnResultsDrawString
  /* 1534B8 80134318 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1534BC 8013431C 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 1534C0 80134320 90429C14 */       lbu $v0, %lo(gMNResultsIsTeamBattle)($v0)
  .L80134324:
  /* 1534C4 80134324 1440000B */      bnez $v0, .L80134354
  /* 1534C8 80134328 27A40064 */     addiu $a0, $sp, 0x64
  /* 1534CC 8013432C 8FAD0078 */        lw $t5, 0x78($sp)
  /* 1534D0 80134330 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1534D4 80134334 44813000 */      mtc1 $at, $f6 # 1.0 to cop1
  /* 1534D8 80134338 000D6080 */       sll $t4, $t5, 2
  /* 1534DC 8013433C 03AC7021 */      addu $t6, $sp, $t4
  /* 1534E0 80134340 8DC50034 */        lw $a1, 0x34($t6)
  /* 1534E4 80134344 3C064334 */       lui $a2, 0x4334
  /* 1534E8 80134348 24070003 */     addiu $a3, $zero, 3
  /* 1534EC 8013434C 0C04CFDB */       jal mnResultsDrawString
  /* 1534F0 80134350 E7A60010 */      swc1 $f6, 0x10($sp)
  .L80134354:
  /* 1534F4 80134354 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1534F8 80134358 27BD0078 */     addiu $sp, $sp, 0x78
  /* 1534FC 8013435C 03E00008 */        jr $ra
  /* 153500 80134360 00000000 */       nop

glabel mnResultsGetWinnerKind
  /* 153504 80134364 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 153508 80134368 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15350C 8013436C 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 153510 80134370 00000000 */       nop
  /* 153514 80134374 0C04CC52 */       jal mnResultsGetFtKind
  /* 153518 80134378 00402025 */        or $a0, $v0, $zero
  /* 15351C 8013437C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153520 80134380 27BD0018 */     addiu $sp, $sp, 0x18
  /* 153524 80134384 03E00008 */        jr $ra
  /* 153528 80134388 00000000 */       nop

glabel mnResultsDrawFighterWins
  /* 15352C 8013438C 27BDFF48 */     addiu $sp, $sp, -0xb8
  /* 153530 80134390 3C0F8014 */       lui $t7, %hi(dMNResultsWinnerStringByKind)
  /* 153534 80134394 25EF94F0 */     addiu $t7, $t7, %lo(dMNResultsWinnerStringByKind)
  /* 153538 80134398 AFBF001C */        sw $ra, 0x1c($sp)
  /* 15353C 8013439C 25E80030 */     addiu $t0, $t7, 0x30
  /* 153540 801343A0 27AE0084 */     addiu $t6, $sp, 0x84
  .L801343A4:
  /* 153544 801343A4 8DF90000 */        lw $t9, ($t7) # dMNResultsWinnerStringByKind + 0
  /* 153548 801343A8 25EF000C */     addiu $t7, $t7, 0xc
  /* 15354C 801343AC 25CE000C */     addiu $t6, $t6, 0xc
  /* 153550 801343B0 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 153554 801343B4 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsWinnerStringByKind + -8
  /* 153558 801343B8 ADD8FFF8 */        sw $t8, -8($t6)
  /* 15355C 801343BC 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsWinnerStringByKind + -4
  /* 153560 801343C0 15E8FFF8 */       bne $t7, $t0, .L801343A4
  /* 153564 801343C4 ADD9FFFC */        sw $t9, -4($t6)
  /* 153568 801343C8 3C0A8014 */       lui $t2, %hi(dMNResultsNameXByKind)
  /* 15356C 801343CC 254A9520 */     addiu $t2, $t2, %lo(dMNResultsNameXByKind)
  /* 153570 801343D0 254D0030 */     addiu $t5, $t2, 0x30
  /* 153574 801343D4 27A90054 */     addiu $t1, $sp, 0x54
  .L801343D8:
  /* 153578 801343D8 8D4C0000 */        lw $t4, ($t2) # dMNResultsNameXByKind + 0
  /* 15357C 801343DC 254A000C */     addiu $t2, $t2, 0xc
  /* 153580 801343E0 2529000C */     addiu $t1, $t1, 0xc
  /* 153584 801343E4 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 153588 801343E8 8D4BFFF8 */        lw $t3, -8($t2) # dMNResultsNameXByKind + -8
  /* 15358C 801343EC AD2BFFF8 */        sw $t3, -8($t1)
  /* 153590 801343F0 8D4CFFFC */        lw $t4, -4($t2) # dMNResultsNameXByKind + -4
  /* 153594 801343F4 154DFFF8 */       bne $t2, $t5, .L801343D8
  /* 153598 801343F8 AD2CFFFC */        sw $t4, -4($t1)
  /* 15359C 801343FC 3C0F8014 */       lui $t7, %hi(dMNResultsNameScaleXByKind)
  /* 1535A0 80134400 25EF9550 */     addiu $t7, $t7, %lo(dMNResultsNameScaleXByKind)
  /* 1535A4 80134404 25F90030 */     addiu $t9, $t7, 0x30
  /* 1535A8 80134408 27A80024 */     addiu $t0, $sp, 0x24
  .L8013440C:
  /* 1535AC 8013440C 8DF80000 */        lw $t8, ($t7) # dMNResultsNameScaleXByKind + 0
  /* 1535B0 80134410 25EF000C */     addiu $t7, $t7, 0xc
  /* 1535B4 80134414 2508000C */     addiu $t0, $t0, 0xc
  /* 1535B8 80134418 AD18FFF4 */        sw $t8, -0xc($t0)
  /* 1535BC 8013441C 8DEEFFF8 */        lw $t6, -8($t7) # dMNResultsNameScaleXByKind + -8
  /* 1535C0 80134420 AD0EFFF8 */        sw $t6, -8($t0)
  /* 1535C4 80134424 8DF8FFFC */        lw $t8, -4($t7) # dMNResultsNameScaleXByKind + -4
  /* 1535C8 80134428 15F9FFF8 */       bne $t7, $t9, .L8013440C
  /* 1535CC 8013442C AD18FFFC */        sw $t8, -4($t0)
  /* 1535D0 80134430 0C04D0D9 */       jal mnResultsGetWinnerKind
  /* 1535D4 80134434 00000000 */       nop
  /* 1535D8 80134438 00021880 */       sll $v1, $v0, 2
  /* 1535DC 8013443C AFA200B4 */        sw $v0, 0xb4($sp)
  /* 1535E0 80134440 03A35021 */      addu $t2, $sp, $v1
  /* 1535E4 80134444 C5440024 */      lwc1 $f4, 0x24($t2)
  /* 1535E8 80134448 03A32021 */      addu $a0, $sp, $v1
  /* 1535EC 8013444C 03A36821 */      addu $t5, $sp, $v1
  /* 1535F0 80134450 8DA50054 */        lw $a1, 0x54($t5)
  /* 1535F4 80134454 8C840084 */        lw $a0, 0x84($a0)
  /* 1535F8 80134458 3C064334 */       lui $a2, 0x4334
  /* 1535FC 8013445C 00003825 */        or $a3, $zero, $zero
  /* 153600 80134460 0C04CFDB */       jal mnResultsDrawString
  /* 153604 80134464 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 153608 80134468 0C04D08F */       jal mnResultsDrawWinsText
  /* 15360C 8013446C 8FA400B4 */        lw $a0, 0xb4($sp)
  /* 153610 80134470 8FBF001C */        lw $ra, 0x1c($sp)
  /* 153614 80134474 27BD00B8 */     addiu $sp, $sp, 0xb8
  /* 153618 80134478 03E00008 */        jr $ra
  /* 15361C 8013447C 00000000 */       nop

glabel mnResultsDrawTeamWins
  /* 153620 80134480 27BDFF90 */     addiu $sp, $sp, -0x70
  /* 153624 80134484 3C0F8014 */       lui $t7, %hi(dMNResultsWinnerStringByTeam)
  /* 153628 80134488 25EF9580 */     addiu $t7, $t7, %lo(dMNResultsWinnerStringByTeam)
  /* 15362C 8013448C AFBF001C */        sw $ra, 0x1c($sp)
  /* 153630 80134490 25E80024 */     addiu $t0, $t7, 0x24
  /* 153634 80134494 27AE0048 */     addiu $t6, $sp, 0x48
  .L80134498:
  /* 153638 80134498 8DF90000 */        lw $t9, ($t7) # dMNResultsWinnerStringByTeam + 0
  /* 15363C 8013449C 25EF000C */     addiu $t7, $t7, 0xc
  /* 153640 801344A0 25CE000C */     addiu $t6, $t6, 0xc
  /* 153644 801344A4 ADD9FFF4 */        sw $t9, -0xc($t6)
  /* 153648 801344A8 8DF8FFF8 */        lw $t8, -8($t7) # dMNResultsWinnerStringByTeam + -8
  /* 15364C 801344AC ADD8FFF8 */        sw $t8, -8($t6)
  /* 153650 801344B0 8DF9FFFC */        lw $t9, -4($t7) # dMNResultsWinnerStringByTeam + -4
  /* 153654 801344B4 15E8FFF8 */       bne $t7, $t0, .L80134498
  /* 153658 801344B8 ADD9FFFC */        sw $t9, -4($t6)
  /* 15365C 801344BC 3C0A8014 */       lui $t2, %hi(dMNResultsNameXByTeam)
  /* 153660 801344C0 254A95A4 */     addiu $t2, $t2, %lo(dMNResultsNameXByTeam)
  /* 153664 801344C4 254D0024 */     addiu $t5, $t2, 0x24
  /* 153668 801344C8 27A90024 */     addiu $t1, $sp, 0x24
  .L801344CC:
  /* 15366C 801344CC 8D4C0000 */        lw $t4, ($t2) # dMNResultsNameXByTeam + 0
  /* 153670 801344D0 254A000C */     addiu $t2, $t2, 0xc
  /* 153674 801344D4 2529000C */     addiu $t1, $t1, 0xc
  /* 153678 801344D8 AD2CFFF4 */        sw $t4, -0xc($t1)
  /* 15367C 801344DC 8D4BFFF8 */        lw $t3, -8($t2) # dMNResultsNameXByTeam + -8
  /* 153680 801344E0 AD2BFFF8 */        sw $t3, -8($t1)
  /* 153684 801344E4 8D4CFFFC */        lw $t4, -4($t2) # dMNResultsNameXByTeam + -4
  /* 153688 801344E8 154DFFF8 */       bne $t2, $t5, .L801344CC
  /* 15368C 801344EC AD2CFFFC */        sw $t4, -4($t1)
  /* 153690 801344F0 0C04CA8B */       jal mnResultsGetWinningTeam
  /* 153694 801344F4 00000000 */       nop
  /* 153698 801344F8 00021880 */       sll $v1, $v0, 2
  /* 15369C 801344FC AFA2006C */        sw $v0, 0x6c($sp)
  /* 1536A0 80134500 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1536A4 80134504 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 1536A8 80134508 03A32021 */      addu $a0, $sp, $v1
  /* 1536AC 8013450C 03A34021 */      addu $t0, $sp, $v1
  /* 1536B0 80134510 8D050024 */        lw $a1, 0x24($t0)
  /* 1536B4 80134514 8C840048 */        lw $a0, 0x48($a0)
  /* 1536B8 80134518 3C064334 */       lui $a2, 0x4334
  /* 1536BC 8013451C 00403825 */        or $a3, $v0, $zero
  /* 1536C0 80134520 0C04CFDB */       jal mnResultsDrawString
  /* 1536C4 80134524 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 1536C8 80134528 0C04D08F */       jal mnResultsDrawWinsText
  /* 1536CC 8013452C 8FA4006C */        lw $a0, 0x6c($sp)
  /* 1536D0 80134530 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1536D4 80134534 27BD0070 */     addiu $sp, $sp, 0x70
  /* 1536D8 80134538 03E00008 */        jr $ra
  /* 1536DC 8013453C 00000000 */       nop

glabel mnResultsDrawNoContest
  /* 1536E0 80134540 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 1536E4 80134544 44812000 */      mtc1 $at, $f4 # 1.0 to cop1
  /* 1536E8 80134548 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1536EC 8013454C AFBF001C */        sw $ra, 0x1c($sp)
  /* 1536F0 80134550 3C048014 */       lui $a0, %hi(dMNResultsStringNoContest)
  /* 1536F4 80134554 24849854 */     addiu $a0, $a0, %lo(dMNResultsStringNoContest)
  /* 1536F8 80134558 3C0541F0 */       lui $a1, 0x41f0
  /* 1536FC 8013455C 3C064334 */       lui $a2, 0x4334
  /* 153700 80134560 24070004 */     addiu $a3, $zero, 4
  /* 153704 80134564 0C04CFDB */       jal mnResultsDrawString
  /* 153708 80134568 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 15370C 8013456C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 153710 80134570 27BD0020 */     addiu $sp, $sp, 0x20
  /* 153714 80134574 03E00008 */        jr $ra
  /* 153718 80134578 00000000 */       nop

glabel mnResultsDrawWinnerText
  /* 15371C 8013457C 3C0E8014 */       lui $t6, %hi(gMNResultsGameRule)
  /* 153720 80134580 8DCE9C10 */        lw $t6, %lo(gMNResultsGameRule)($t6)
  /* 153724 80134584 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 153728 80134588 24010004 */     addiu $at, $zero, 4
  /* 15372C 8013458C 15C10005 */       bne $t6, $at, .L801345A4
  /* 153730 80134590 AFBF0014 */        sw $ra, 0x14($sp)
  /* 153734 80134594 0C04D150 */       jal mnResultsDrawNoContest
  /* 153738 80134598 00000000 */       nop
  /* 15373C 8013459C 1000000F */         b .L801345DC
  /* 153740 801345A0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801345A4:
  /* 153744 801345A4 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 153748 801345A8 90429C14 */       lbu $v0, %lo(gMNResultsIsTeamBattle)($v0)
  /* 15374C 801345AC 54400006 */      bnel $v0, $zero, .L801345C8
  /* 153750 801345B0 24010001 */     addiu $at, $zero, 1
  /* 153754 801345B4 0C04D0E3 */       jal mnResultsDrawFighterWins
  /* 153758 801345B8 00000000 */       nop
  /* 15375C 801345BC 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 153760 801345C0 90429C14 */       lbu $v0, %lo(gMNResultsIsTeamBattle)($v0)
  /* 153764 801345C4 24010001 */     addiu $at, $zero, 1
  .L801345C8:
  /* 153768 801345C8 54410004 */      bnel $v0, $at, .L801345DC
  /* 15376C 801345CC 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153770 801345D0 0C04D120 */       jal mnResultsDrawTeamWins
  /* 153774 801345D4 00000000 */       nop
  /* 153778 801345D8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801345DC:
  /* 15377C 801345DC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 153780 801345E0 03E00008 */        jr $ra
  /* 153784 801345E4 00000000 */       nop

glabel mnResultsCreateWinnerTextViewport
  /* 153788 801345E8 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 15378C 801345EC 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 153790 801345F0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 153794 801345F4 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 153798 801345F8 240F0014 */     addiu $t7, $zero, 0x14
  /* 15379C 801345FC 24180000 */     addiu $t8, $zero, 0
  /* 1537A0 80134600 3C192000 */       lui $t9, 0x2000
  /* 1537A4 80134604 2408FFFF */     addiu $t0, $zero, -1
  /* 1537A8 80134608 24090001 */     addiu $t1, $zero, 1
  /* 1537AC 8013460C 240A0001 */     addiu $t2, $zero, 1
  /* 1537B0 80134610 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1537B4 80134614 AFA90028 */        sw $t1, 0x28($sp)
  /* 1537B8 80134618 AFA80020 */        sw $t0, 0x20($sp)
  /* 1537BC 8013461C AFB9001C */        sw $t9, 0x1c($sp)
  /* 1537C0 80134620 AFB80018 */        sw $t8, 0x18($sp)
  /* 1537C4 80134624 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1537C8 80134628 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1537CC 8013462C AFA00024 */        sw $zero, 0x24($sp)
  /* 1537D0 80134630 AFA0002C */        sw $zero, 0x2c($sp)
  /* 1537D4 80134634 AFA00034 */        sw $zero, 0x34($sp)
  /* 1537D8 80134638 24040401 */     addiu $a0, $zero, 0x401
  /* 1537DC 8013463C 00002825 */        or $a1, $zero, $zero
  /* 1537E0 80134640 24060010 */     addiu $a2, $zero, 0x10
  /* 1537E4 80134644 0C002E4F */       jal func_8000B93C
  /* 1537E8 80134648 3C078000 */       lui $a3, 0x8000
  /* 1537EC 8013464C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1537F0 80134650 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1537F4 80134654 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1537F8 80134658 8C430074 */        lw $v1, 0x74($v0)
  /* 1537FC 8013465C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 153800 80134660 44050000 */      mfc1 $a1, $f0
  /* 153804 80134664 44060000 */      mfc1 $a2, $f0
  /* 153808 80134668 3C07439B */       lui $a3, 0x439b
  /* 15380C 8013466C 24640008 */     addiu $a0, $v1, 8
  /* 153810 80134670 0C001C20 */       jal func_80007080
  /* 153814 80134674 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 153818 80134678 8FBF003C */        lw $ra, 0x3c($sp)
  /* 15381C 8013467C 27BD0040 */     addiu $sp, $sp, 0x40
  /* 153820 80134680 03E00008 */        jr $ra
  /* 153824 80134684 00000000 */       nop

glabel mnResultsGetHundredsDigit
  /* 153828 80134688 04810007 */      bgez $a0, .L801346A8
  /* 15382C 8013468C 24010064 */     addiu $at, $zero, 0x64
  /* 153830 80134690 24010064 */     addiu $at, $zero, 0x64
  /* 153834 80134694 0081001A */       div $zero, $a0, $at
  /* 153838 80134698 00001012 */      mflo $v0
  /* 15383C 8013469C 00021023 */      negu $v0, $v0
  /* 153840 801346A0 03E00008 */        jr $ra
  /* 153844 801346A4 00000000 */       nop

  .L801346A8:
  /* 153848 801346A8 0081001A */       div $zero, $a0, $at
  /* 15384C 801346AC 00001012 */      mflo $v0
  /* 153850 801346B0 00000000 */       nop
  /* 153854 801346B4 00000000 */       nop
  /* 153858 801346B8 03E00008 */        jr $ra
  /* 15385C 801346BC 00000000 */       nop

glabel mnResultsGetTensDigit
  /* 153860 801346C0 0481000B */      bgez $a0, .L801346F0
  /* 153864 801346C4 24010064 */     addiu $at, $zero, 0x64
  /* 153868 801346C8 24010064 */     addiu $at, $zero, 0x64
  /* 15386C 801346CC 0081001A */       div $zero, $a0, $at
  /* 153870 801346D0 00001010 */      mfhi $v0
  /* 153874 801346D4 2401000A */     addiu $at, $zero, 0xa
  /* 153878 801346D8 00000000 */       nop
  /* 15387C 801346DC 0041001A */       div $zero, $v0, $at
  /* 153880 801346E0 00001012 */      mflo $v0
  /* 153884 801346E4 00021023 */      negu $v0, $v0
  /* 153888 801346E8 03E00008 */        jr $ra
  /* 15388C 801346EC 00000000 */       nop

  .L801346F0:
  /* 153890 801346F0 0081001A */       div $zero, $a0, $at
  /* 153894 801346F4 00001010 */      mfhi $v0
  /* 153898 801346F8 2401000A */     addiu $at, $zero, 0xa
  /* 15389C 801346FC 00000000 */       nop
  /* 1538A0 80134700 0041001A */       div $zero, $v0, $at
  /* 1538A4 80134704 00001012 */      mflo $v0
  /* 1538A8 80134708 00000000 */       nop
  /* 1538AC 8013470C 00000000 */       nop
# Maybe start of new file
  /* 1538B0 80134710 03E00008 */        jr $ra
  /* 1538B4 80134714 00000000 */       nop

glabel mnResultsGetOnesDigit
  /* 1538B8 80134718 0481000B */      bgez $a0, .L80134748
  /* 1538BC 8013471C 24010064 */     addiu $at, $zero, 0x64
  /* 1538C0 80134720 24010064 */     addiu $at, $zero, 0x64
  /* 1538C4 80134724 0081001A */       div $zero, $a0, $at
  /* 1538C8 80134728 00001010 */      mfhi $v0
  /* 1538CC 8013472C 2401000A */     addiu $at, $zero, 0xa
  /* 1538D0 80134730 00000000 */       nop
  /* 1538D4 80134734 0041001A */       div $zero, $v0, $at
  /* 1538D8 80134738 00001010 */      mfhi $v0
  /* 1538DC 8013473C 00021023 */      negu $v0, $v0
  /* 1538E0 80134740 03E00008 */        jr $ra
  /* 1538E4 80134744 00000000 */       nop

  .L80134748:
  /* 1538E8 80134748 0081001A */       div $zero, $a0, $at
  /* 1538EC 8013474C 00001010 */      mfhi $v0
  /* 1538F0 80134750 2401000A */     addiu $at, $zero, 0xa
  /* 1538F4 80134754 00000000 */       nop
  /* 1538F8 80134758 0041001A */       div $zero, $v0, $at
  /* 1538FC 8013475C 00001010 */      mfhi $v0
  /* 153900 80134760 00000000 */       nop
  /* 153904 80134764 00000000 */       nop
  /* 153908 80134768 03E00008 */        jr $ra
  /* 15390C 8013476C 00000000 */       nop

glabel mnResultsSetNumberColor
  /* 153910 80134770 3C0E8014 */       lui $t6, %hi(dMNResultsNumberColors)
  /* 153914 80134774 25CE95C8 */     addiu $t6, $t6, %lo(dMNResultsNumberColors)
  /* 153918 80134778 8DD80000 */        lw $t8, ($t6) # dMNResultsNumberColors + 0
  /* 15391C 8013477C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 153920 80134780 27A30000 */     addiu $v1, $sp, 0
  /* 153924 80134784 AC780000 */        sw $t8, ($v1)
  /* 153928 80134788 8DCF0004 */        lw $t7, 4($t6) # dMNResultsNumberColors + 4
  /* 15392C 8013478C 0005C880 */       sll $t9, $a1, 2
  /* 153930 80134790 0325C823 */      subu $t9, $t9, $a1
  /* 153934 80134794 AC6F0004 */        sw $t7, 4($v1)
  /* 153938 80134798 8DD80008 */        lw $t8, 8($t6) # dMNResultsNumberColors + 8
  /* 15393C 8013479C 0019C840 */       sll $t9, $t9, 1
  /* 153940 801347A0 00791021 */      addu $v0, $v1, $t9
  /* 153944 801347A4 AC780008 */        sw $t8, 8($v1)
  /* 153948 801347A8 8DCF000C */        lw $t7, 0xc($t6) # dMNResultsNumberColors + 12
  /* 15394C 801347AC AC6F000C */        sw $t7, 0xc($v1)
  /* 153950 801347B0 8DD80010 */        lw $t8, 0x10($t6) # dMNResultsNumberColors + 16
  /* 153954 801347B4 AC780010 */        sw $t8, 0x10($v1)
  /* 153958 801347B8 8DCF0014 */        lw $t7, 0x14($t6) # dMNResultsNumberColors + 20
  /* 15395C 801347BC AC6F0014 */        sw $t7, 0x14($v1)
  /* 153960 801347C0 8DD80018 */        lw $t8, 0x18($t6) # dMNResultsNumberColors + 24
  /* 153964 801347C4 AC780018 */        sw $t8, 0x18($v1)
  /* 153968 801347C8 95D8001C */       lhu $t8, 0x1c($t6) # dMNResultsNumberColors + 28
  /* 15396C 801347CC A478001C */        sh $t8, 0x1c($v1)
  /* 153970 801347D0 90480000 */       lbu $t0, ($v0)
  /* 153974 801347D4 A0880060 */        sb $t0, 0x60($a0)
  /* 153978 801347D8 90490001 */       lbu $t1, 1($v0)
  /* 15397C 801347DC A0890061 */        sb $t1, 0x61($a0)
  /* 153980 801347E0 904A0002 */       lbu $t2, 2($v0)
  /* 153984 801347E4 A08A0062 */        sb $t2, 0x62($a0)
  /* 153988 801347E8 904B0003 */       lbu $t3, 3($v0)
  /* 15398C 801347EC A08B0028 */        sb $t3, 0x28($a0)
  /* 153990 801347F0 904C0004 */       lbu $t4, 4($v0)
  /* 153994 801347F4 A08C0029 */        sb $t4, 0x29($a0)
  /* 153998 801347F8 904D0005 */       lbu $t5, 5($v0)
  /* 15399C 801347FC 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1539A0 80134800 03E00008 */        jr $ra
  /* 1539A4 80134804 A08D002A */        sb $t5, 0x2a($a0)

glabel mnResultsCreateNumber
  /* 1539A8 80134808 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 1539AC 8013480C 3C0E8014 */       lui $t6, %hi(dMNResultsNumberOffsets)
  /* 1539B0 80134810 27A2003C */     addiu $v0, $sp, 0x3c
  /* 1539B4 80134814 25CE95E8 */     addiu $t6, $t6, %lo(dMNResultsNumberOffsets)
  /* 1539B8 80134818 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1539BC 8013481C AFA60070 */        sw $a2, 0x70($sp)
  /* 1539C0 80134820 00A03825 */        or $a3, $a1, $zero
  /* 1539C4 80134824 25C80024 */     addiu $t0, $t6, 0x24
  /* 1539C8 80134828 0040C825 */        or $t9, $v0, $zero
  .L8013482C:
  /* 1539CC 8013482C 8DD80000 */        lw $t8, ($t6) # dMNResultsNumberOffsets + 0
  /* 1539D0 80134830 25CE000C */     addiu $t6, $t6, 0xc
  /* 1539D4 80134834 2739000C */     addiu $t9, $t9, 0xc
  /* 1539D8 80134838 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 1539DC 8013483C 8DCFFFF8 */        lw $t7, -8($t6) # dMNResultsNumberOffsets + -8
  /* 1539E0 80134840 AF2FFFF8 */        sw $t7, -8($t9)
  /* 1539E4 80134844 8DD8FFFC */        lw $t8, -4($t6) # dMNResultsNumberOffsets + -4
  /* 1539E8 80134848 15C8FFF8 */       bne $t6, $t0, .L8013482C
  /* 1539EC 8013484C AF38FFFC */        sw $t8, -4($t9)
  /* 1539F0 80134850 8DD80000 */        lw $t8, ($t6) # dMNResultsNumberOffsets + 0
  /* 1539F4 80134854 3C0A8014 */       lui $t2, %hi(dMNResultsUnusedNumberColors)
  /* 1539F8 80134858 254A9610 */     addiu $t2, $t2, %lo(dMNResultsUnusedNumberColors)
  /* 1539FC 8013485C AF380000 */        sw $t8, ($t9)
  /* 153A00 80134860 8D4C0000 */        lw $t4, ($t2) # dMNResultsUnusedNumberColors + 0
  /* 153A04 80134864 27A9001C */     addiu $t1, $sp, 0x1c
  /* 153A08 80134868 8D4B0004 */        lw $t3, 4($t2) # dMNResultsUnusedNumberColors + 4
  /* 153A0C 8013486C AD2C0000 */        sw $t4, ($t1)
  /* 153A10 80134870 8D4C0008 */        lw $t4, 8($t2) # dMNResultsUnusedNumberColors + 8
  /* 153A14 80134874 AD2B0004 */        sw $t3, 4($t1)
  /* 153A18 80134878 8D4B000C */        lw $t3, 0xc($t2) # dMNResultsUnusedNumberColors + 12
  /* 153A1C 8013487C AD2C0008 */        sw $t4, 8($t1)
  /* 153A20 80134880 8D4C0010 */        lw $t4, 0x10($t2) # dMNResultsUnusedNumberColors + 16
  /* 153A24 80134884 AD2B000C */        sw $t3, 0xc($t1)
  /* 153A28 80134888 8D4B0014 */        lw $t3, 0x14($t2) # dMNResultsUnusedNumberColors + 20
  /* 153A2C 8013488C AD2C0010 */        sw $t4, 0x10($t1)
  /* 153A30 80134890 8D4C0018 */        lw $t4, 0x18($t2) # dMNResultsUnusedNumberColors + 24
  /* 153A34 80134894 00076880 */       sll $t5, $a3, 2
  /* 153A38 80134898 AD2B0014 */        sw $t3, 0x14($t1)
  /* 153A3C 8013489C AD2C0018 */        sw $t4, 0x18($t1)
  /* 153A40 801348A0 954C001C */       lhu $t4, 0x1c($t2) # dMNResultsUnusedNumberColors + 28
  /* 153A44 801348A4 004D4021 */      addu $t0, $v0, $t5
  /* 153A48 801348A8 3C198014 */       lui $t9, %hi(D_ovl31_8013A05C)
  /* 153A4C 801348AC A52C001C */        sh $t4, 0x1c($t1)
  /* 153A50 801348B0 8F39A05C */        lw $t9, %lo(D_ovl31_8013A05C)($t9)
  /* 153A54 801348B4 8D0E0000 */        lw $t6, ($t0)
  /* 153A58 801348B8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153A5C 801348BC 01D92821 */      addu $a1, $t6, $t9
  /* 153A60 801348C0 AFA20064 */        sw $v0, 0x64($sp)
  /* 153A64 801348C4 944F0024 */       lhu $t7, 0x24($v0)
  /* 153A68 801348C8 00402025 */        or $a0, $v0, $zero
  /* 153A6C 801348CC 31E9FFDF */      andi $t1, $t7, 0xffdf
  /* 153A70 801348D0 A4490024 */        sh $t1, 0x24($v0)
  /* 153A74 801348D4 352A0001 */       ori $t2, $t1, 1
  /* 153A78 801348D8 A44A0024 */        sh $t2, 0x24($v0)
  /* 153A7C 801348DC 0C04D1DC */       jal mnResultsSetNumberColor
  /* 153A80 801348E0 8FA50070 */        lw $a1, 0x70($sp)
  /* 153A84 801348E4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153A88 801348E8 8FA20064 */        lw $v0, 0x64($sp)
  /* 153A8C 801348EC 27BD0068 */     addiu $sp, $sp, 0x68
  /* 153A90 801348F0 03E00008 */        jr $ra
  /* 153A94 801348F4 00000000 */       nop

glabel mnResultsCreatePlaceNumber
  /* 153A98 801348F8 27BDFF98 */     addiu $sp, $sp, -0x68
  /* 153A9C 801348FC 3C0E8014 */       lui $t6, %hi(dMNResultsPlaceNumberOffsets)
  /* 153AA0 80134900 27A2003C */     addiu $v0, $sp, 0x3c
  /* 153AA4 80134904 25CE9630 */     addiu $t6, $t6, %lo(dMNResultsPlaceNumberOffsets)
  /* 153AA8 80134908 AFBF0014 */        sw $ra, 0x14($sp)
  /* 153AAC 8013490C AFA70074 */        sw $a3, 0x74($sp)
  /* 153AB0 80134910 24030001 */     addiu $v1, $zero, 1
  /* 153AB4 80134914 25C80024 */     addiu $t0, $t6, 0x24
  /* 153AB8 80134918 0040C825 */        or $t9, $v0, $zero
  .L8013491C:
  /* 153ABC 8013491C 8DD80000 */        lw $t8, ($t6) # dMNResultsPlaceNumberOffsets + 0
  /* 153AC0 80134920 25CE000C */     addiu $t6, $t6, 0xc
  /* 153AC4 80134924 2739000C */     addiu $t9, $t9, 0xc
  /* 153AC8 80134928 AF38FFF4 */        sw $t8, -0xc($t9)
  /* 153ACC 8013492C 8DCFFFF8 */        lw $t7, -8($t6) # dMNResultsPlaceNumberOffsets + -8
  /* 153AD0 80134930 AF2FFFF8 */        sw $t7, -8($t9)
  /* 153AD4 80134934 8DD8FFFC */        lw $t8, -4($t6) # dMNResultsPlaceNumberOffsets + -4
  /* 153AD8 80134938 15C8FFF8 */       bne $t6, $t0, .L8013491C
  /* 153ADC 8013493C AF38FFFC */        sw $t8, -4($t9)
  /* 153AE0 80134940 8DD80000 */        lw $t8, ($t6) # dMNResultsPlaceNumberOffsets + 0
  /* 153AE4 80134944 3C0A8014 */       lui $t2, %hi(dMNResultsPlaceNumberUnusedColors)
  /* 153AE8 80134948 254A9658 */     addiu $t2, $t2, %lo(dMNResultsPlaceNumberUnusedColors)
  /* 153AEC 8013494C AF380000 */        sw $t8, ($t9)
  /* 153AF0 80134950 8D4C0000 */        lw $t4, ($t2) # dMNResultsPlaceNumberUnusedColors + 0
  /* 153AF4 80134954 27A9001C */     addiu $t1, $sp, 0x1c
  /* 153AF8 80134958 8D4B0004 */        lw $t3, 4($t2) # dMNResultsPlaceNumberUnusedColors + 4
  /* 153AFC 8013495C AD2C0000 */        sw $t4, ($t1)
  /* 153B00 80134960 8D4C0008 */        lw $t4, 8($t2) # dMNResultsPlaceNumberUnusedColors + 8
  /* 153B04 80134964 AD2B0004 */        sw $t3, 4($t1)
  /* 153B08 80134968 8D4B000C */        lw $t3, 0xc($t2) # dMNResultsPlaceNumberUnusedColors + 12
  /* 153B0C 8013496C AD2C0008 */        sw $t4, 8($t1)
  /* 153B10 80134970 8D4C0010 */        lw $t4, 0x10($t2) # dMNResultsPlaceNumberUnusedColors + 16
  /* 153B14 80134974 AD2B000C */        sw $t3, 0xc($t1)
  /* 153B18 80134978 8D4B0014 */        lw $t3, 0x14($t2) # dMNResultsPlaceNumberUnusedColors + 20
  /* 153B1C 8013497C AD2C0010 */        sw $t4, 0x10($t1)
  /* 153B20 80134980 8D4C0018 */        lw $t4, 0x18($t2) # dMNResultsPlaceNumberUnusedColors + 24
  /* 153B24 80134984 AD2B0014 */        sw $t3, 0x14($t1)
  /* 153B28 80134988 3C0B8014 */       lui $t3, 0x8014
  /* 153B2C 8013498C AD2C0018 */        sw $t4, 0x18($t1)
  /* 153B30 80134990 954C001C */       lhu $t4, 0x1c($t2) # dMNResultsPlaceNumberUnusedColors + 28
  /* 153B34 80134994 0006C080 */       sll $t8, $a2, 2
  /* 153B38 80134998 14C30036 */       bne $a2, $v1, .L80134A74
  /* 153B3C 8013499C A52C001C */        sh $t4, 0x1c($t1)
  /* 153B40 801349A0 3C0D8014 */       lui $t5, %hi(gMNResultsIsTeamBattle)
  /* 153B44 801349A4 91AD9C14 */       lbu $t5, %lo(gMNResultsIsTeamBattle)($t5)
  /* 153B48 801349A8 3C0B8014 */       lui $t3, 0x8014
  /* 153B4C 801349AC 3C0C0001 */       lui $t4, 1
  /* 153B50 801349B0 146D0023 */       bne $v1, $t5, .L80134A40
  /* 153B54 801349B4 00000000 */       nop
  /* 153B58 801349B8 AFA40068 */        sw $a0, 0x68($sp)
  /* 153B5C 801349BC 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 153B60 801349C0 AFA5006C */        sw $a1, 0x6c($sp)
  /* 153B64 801349C4 8FA5006C */        lw $a1, 0x6c($sp)
  /* 153B68 801349C8 8FA40068 */        lw $a0, 0x68($sp)
  /* 153B6C 801349CC 3C0E8014 */       lui $t6, %hi(gMNResultsIsSharedWinner)
  /* 153B70 801349D0 10450006 */       beq $v0, $a1, .L801349EC
  /* 153B74 801349D4 00054080 */       sll $t0, $a1, 2
  /* 153B78 801349D8 01C87021 */      addu $t6, $t6, $t0
  /* 153B7C 801349DC 8DCE9C20 */        lw $t6, %lo(gMNResultsIsSharedWinner)($t6)
  /* 153B80 801349E0 3C098014 */       lui $t1, 0x8014
  /* 153B84 801349E4 3C0A0000 */       lui $t2, 0
  /* 153B88 801349E8 11C0000A */      beqz $t6, .L80134A14
  .L801349EC:
  /* 153B8C 801349EC 3C198014 */       lui $t9, %hi(D_ovl31_8013A048)
  /* 153B90 801349F0 8F39A048 */        lw $t9, %lo(D_ovl31_8013A048)($t9)
  /* 153B94 801349F4 3C0F0001 */       lui $t7, %hi(D_NF_0000E2A0)
  /* 153B98 801349F8 25EFE2A0 */     addiu $t7, $t7, %lo(D_NF_0000E2A0)
  /* 153B9C 801349FC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153BA0 80134A00 032F2821 */      addu $a1, $t9, $t7
  /* 153BA4 80134A04 24180001 */     addiu $t8, $zero, 1
  /* 153BA8 80134A08 00401825 */        or $v1, $v0, $zero
  /* 153BAC 80134A0C 10000013 */         b .L80134A5C
  /* 153BB0 80134A10 AC580054 */        sw $t8, 0x54($v0)
  .L80134A14:
  /* 153BB4 80134A14 8D29A054 */        lw $t1, -0x5fac($t1)
  /* 153BB8 80134A18 254A02D8 */     addiu $t2, $t2, 0x2d8
  /* 153BBC 80134A1C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153BC0 80134A20 012A2821 */      addu $a1, $t1, $t2
  /* 153BC4 80134A24 AC400054 */        sw $zero, 0x54($v0)
  /* 153BC8 80134A28 AFA20064 */        sw $v0, 0x64($sp)
  /* 153BCC 80134A2C 8FA50074 */        lw $a1, 0x74($sp)
  /* 153BD0 80134A30 0C04D1DC */       jal mnResultsSetNumberColor
  /* 153BD4 80134A34 00402025 */        or $a0, $v0, $zero
  /* 153BD8 80134A38 10000008 */         b .L80134A5C
  /* 153BDC 80134A3C 8FA30064 */        lw $v1, 0x64($sp)
  .L80134A40:
  /* 153BE0 80134A40 8D6BA048 */        lw $t3, -0x5fb8($t3)
  /* 153BE4 80134A44 258CE2A0 */     addiu $t4, $t4, -0x1d60
  /* 153BE8 80134A48 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153BEC 80134A4C 016C2821 */      addu $a1, $t3, $t4
  /* 153BF0 80134A50 240D0001 */     addiu $t5, $zero, 1
  /* 153BF4 80134A54 00401825 */        or $v1, $v0, $zero
  /* 153BF8 80134A58 AC4D0054 */        sw $t5, 0x54($v0)
  .L80134A5C:
  /* 153BFC 80134A5C 94680024 */       lhu $t0, 0x24($v1)
  /* 153C00 80134A60 3119FFDF */      andi $t9, $t0, 0xffdf
  /* 153C04 80134A64 A4790024 */        sh $t9, 0x24($v1)
  /* 153C08 80134A68 372F0001 */       ori $t7, $t9, 1
  /* 153C0C 80134A6C 10000010 */         b .L80134AB0
  /* 153C10 80134A70 A46F0024 */        sh $t7, 0x24($v1)
  .L80134A74:
  /* 153C14 80134A74 00584821 */      addu $t1, $v0, $t8
  /* 153C18 80134A78 8D2A0000 */        lw $t2, ($t1)
  /* 153C1C 80134A7C 8D6BA054 */        lw $t3, -0x5fac($t3)
  /* 153C20 80134A80 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153C24 80134A84 014B2821 */      addu $a1, $t2, $t3
  /* 153C28 80134A88 944C0024 */       lhu $t4, 0x24($v0)
  /* 153C2C 80134A8C 00402025 */        or $a0, $v0, $zero
  /* 153C30 80134A90 3188FFDF */      andi $t0, $t4, 0xffdf
  /* 153C34 80134A94 A4480024 */        sh $t0, 0x24($v0)
  /* 153C38 80134A98 350E0001 */       ori $t6, $t0, 1
  /* 153C3C 80134A9C A44E0024 */        sh $t6, 0x24($v0)
  /* 153C40 80134AA0 AFA20064 */        sw $v0, 0x64($sp)
  /* 153C44 80134AA4 0C04D1DC */       jal mnResultsSetNumberColor
  /* 153C48 80134AA8 8FA50074 */        lw $a1, 0x74($sp)
  /* 153C4C 80134AAC 8FA30064 */        lw $v1, 0x64($sp)
  .L80134AB0:
  /* 153C50 80134AB0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153C54 80134AB4 27BD0068 */     addiu $sp, $sp, 0x68
  /* 153C58 80134AB8 00601025 */        or $v0, $v1, $zero
  /* 153C5C 80134ABC 03E00008 */        jr $ra
  /* 153C60 80134AC0 00000000 */       nop

glabel mnResultsDrawNumber
  /* 153C64 80134AC4 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 153C68 80134AC8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 153C6C 80134ACC AFA40030 */        sw $a0, 0x30($sp)
  /* 153C70 80134AD0 AFA50034 */        sw $a1, 0x34($sp)
  /* 153C74 80134AD4 AFA60038 */        sw $a2, 0x38($sp)
  /* 153C78 80134AD8 04E1002C */      bgez $a3, .L80134B8C
  /* 153C7C 80134ADC AFA7003C */        sw $a3, 0x3c($sp)
  /* 153C80 80134AE0 3C0F8014 */       lui $t7, %hi(D_ovl31_8013A05C)
  /* 153C84 80134AE4 8DEFA05C */        lw $t7, %lo(D_ovl31_8013A05C)($t7)
  /* 153C88 80134AE8 3C180000 */       lui $t8, %hi(D_NF_00000710)
  /* 153C8C 80134AEC 27180710 */     addiu $t8, $t8, %lo(D_NF_00000710)
  /* 153C90 80134AF0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 153C94 80134AF4 01F82821 */      addu $a1, $t7, $t8
  /* 153C98 80134AF8 8FA4003C */        lw $a0, 0x3c($sp)
  /* 153C9C 80134AFC 0C04D1A2 */       jal mnResultsGetHundredsDigit
  /* 153CA0 80134B00 AFA2002C */        sw $v0, 0x2c($sp)
  /* 153CA4 80134B04 10400004 */      beqz $v0, .L80134B18
  /* 153CA8 80134B08 8FA6002C */        lw $a2, 0x2c($sp)
  /* 153CAC 80134B0C C7A40034 */      lwc1 $f4, 0x34($sp)
  /* 153CB0 80134B10 10000011 */         b .L80134B58
  /* 153CB4 80134B14 E4C40058 */      swc1 $f4, 0x58($a2)
  .L80134B18:
  /* 153CB8 80134B18 8FA4003C */        lw $a0, 0x3c($sp)
  /* 153CBC 80134B1C 0C04D1B0 */       jal mnResultsGetTensDigit
  /* 153CC0 80134B20 AFA6002C */        sw $a2, 0x2c($sp)
  /* 153CC4 80134B24 10400007 */      beqz $v0, .L80134B44
  /* 153CC8 80134B28 8FA6002C */        lw $a2, 0x2c($sp)
  /* 153CCC 80134B2C 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 153CD0 80134B30 44814000 */      mtc1 $at, $f8 # 8.0 to cop1
  /* 153CD4 80134B34 C7A60034 */      lwc1 $f6, 0x34($sp)
  /* 153CD8 80134B38 46083280 */     add.s $f10, $f6, $f8
  /* 153CDC 80134B3C 10000006 */         b .L80134B58
  /* 153CE0 80134B40 E4CA0058 */      swc1 $f10, 0x58($a2)
  .L80134B44:
  /* 153CE4 80134B44 3C014180 */       lui $at, (0x41800000 >> 16) # 16.0
  /* 153CE8 80134B48 44819000 */      mtc1 $at, $f18 # 16.0 to cop1
  /* 153CEC 80134B4C C7B00034 */      lwc1 $f16, 0x34($sp)
  /* 153CF0 80134B50 46128100 */     add.s $f4, $f16, $f18
  /* 153CF4 80134B54 E4C40058 */      swc1 $f4, 0x58($a2)
  .L80134B58:
  /* 153CF8 80134B58 3C014040 */       lui $at, (0x40400000 >> 16) # 3.0
  /* 153CFC 80134B5C 44814000 */      mtc1 $at, $f8 # 3.0 to cop1
  /* 153D00 80134B60 C7A60038 */      lwc1 $f6, 0x38($sp)
  /* 153D04 80134B64 94D90024 */       lhu $t9, 0x24($a2)
  /* 153D08 80134B68 00C02025 */        or $a0, $a2, $zero
  /* 153D0C 80134B6C 46083280 */     add.s $f10, $f6, $f8
  /* 153D10 80134B70 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 153D14 80134B74 A4C90024 */        sh $t1, 0x24($a2)
  /* 153D18 80134B78 352A0001 */       ori $t2, $t1, 1
  /* 153D1C 80134B7C E4CA005C */      swc1 $f10, 0x5c($a2)
  /* 153D20 80134B80 A4CA0024 */        sh $t2, 0x24($a2)
  /* 153D24 80134B84 0C04D1DC */       jal mnResultsSetNumberColor
  /* 153D28 80134B88 8FA50040 */        lw $a1, 0x40($sp)
  .L80134B8C:
  /* 153D2C 80134B8C 0C04D1A2 */       jal mnResultsGetHundredsDigit
  /* 153D30 80134B90 8FA4003C */        lw $a0, 0x3c($sp)
  /* 153D34 80134B94 1040000E */      beqz $v0, .L80134BD0
  /* 153D38 80134B98 AFA20028 */        sw $v0, 0x28($sp)
  /* 153D3C 80134B9C 3C014100 */       lui $at, (0x41000000 >> 16) # 8.0
  /* 153D40 80134BA0 44819000 */      mtc1 $at, $f18 # 8.0 to cop1
  /* 153D44 80134BA4 C7B00034 */      lwc1 $f16, 0x34($sp)
  /* 153D48 80134BA8 8FA40030 */        lw $a0, 0x30($sp)
  /* 153D4C 80134BAC 00402825 */        or $a1, $v0, $zero
  /* 153D50 80134BB0 46128100 */     add.s $f4, $f16, $f18
  /* 153D54 80134BB4 8FA60040 */        lw $a2, 0x40($sp)
  /* 153D58 80134BB8 0C04D202 */       jal mnResultsCreateNumber
  /* 153D5C 80134BBC E7A4001C */      swc1 $f4, 0x1c($sp)
  /* 153D60 80134BC0 C7A6001C */      lwc1 $f6, 0x1c($sp)
  /* 153D64 80134BC4 E4460058 */      swc1 $f6, 0x58($v0)
  /* 153D68 80134BC8 C7A80038 */      lwc1 $f8, 0x38($sp)
  /* 153D6C 80134BCC E448005C */      swc1 $f8, 0x5c($v0)
  .L80134BD0:
  /* 153D70 80134BD0 0C04D1B0 */       jal mnResultsGetTensDigit
  /* 153D74 80134BD4 8FA4003C */        lw $a0, 0x3c($sp)
  /* 153D78 80134BD8 14400003 */      bnez $v0, .L80134BE8
  /* 153D7C 80134BDC 00402825 */        or $a1, $v0, $zero
  /* 153D80 80134BE0 8FAB0028 */        lw $t3, 0x28($sp)
  /* 153D84 80134BE4 1160000C */      beqz $t3, .L80134C18
  .L80134BE8:
  /* 153D88 80134BE8 3C014180 */       lui $at, (0x41800000 >> 16) # 16.0
  /* 153D8C 80134BEC 44818000 */      mtc1 $at, $f16 # 16.0 to cop1
  /* 153D90 80134BF0 C7AA0034 */      lwc1 $f10, 0x34($sp)
  /* 153D94 80134BF4 8FA40030 */        lw $a0, 0x30($sp)
  /* 153D98 80134BF8 8FA60040 */        lw $a2, 0x40($sp)
  /* 153D9C 80134BFC 46105480 */     add.s $f18, $f10, $f16
  /* 153DA0 80134C00 0C04D202 */       jal mnResultsCreateNumber
  /* 153DA4 80134C04 E7B2001C */      swc1 $f18, 0x1c($sp)
  /* 153DA8 80134C08 C7A4001C */      lwc1 $f4, 0x1c($sp)
  /* 153DAC 80134C0C E4440058 */      swc1 $f4, 0x58($v0)
  /* 153DB0 80134C10 C7A60038 */      lwc1 $f6, 0x38($sp)
  /* 153DB4 80134C14 E446005C */      swc1 $f6, 0x5c($v0)
  .L80134C18:
  /* 153DB8 80134C18 0C04D1C6 */       jal mnResultsGetOnesDigit
  /* 153DBC 80134C1C 8FA4003C */        lw $a0, 0x3c($sp)
  /* 153DC0 80134C20 8FA40030 */        lw $a0, 0x30($sp)
  /* 153DC4 80134C24 00402825 */        or $a1, $v0, $zero
  /* 153DC8 80134C28 0C04D202 */       jal mnResultsCreateNumber
  /* 153DCC 80134C2C 8FA60040 */        lw $a2, 0x40($sp)
  /* 153DD0 80134C30 3C0141C0 */       lui $at, (0x41C00000 >> 16) # 24.0
  /* 153DD4 80134C34 44815000 */      mtc1 $at, $f10 # 24.0 to cop1
  /* 153DD8 80134C38 C7A80034 */      lwc1 $f8, 0x34($sp)
  /* 153DDC 80134C3C 460A4400 */     add.s $f16, $f8, $f10
  /* 153DE0 80134C40 E4500058 */      swc1 $f16, 0x58($v0)
  /* 153DE4 80134C44 C7B20038 */      lwc1 $f18, 0x38($sp)
  /* 153DE8 80134C48 E452005C */      swc1 $f18, 0x5c($v0)
  /* 153DEC 80134C4C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153DF0 80134C50 27BD0030 */     addiu $sp, $sp, 0x30
  /* 153DF4 80134C54 03E00008 */        jr $ra
  /* 153DF8 80134C58 00000000 */       nop

glabel mnResultsRenderOverlay
  /* 153DFC 80134C5C 3C0C8014 */       lui $t4, %hi(gMNResultsOverlayAlpha)
  /* 153E00 80134C60 258C9BC0 */     addiu $t4, $t4, %lo(gMNResultsOverlayAlpha)
  /* 153E04 80134C64 8D820000 */        lw $v0, ($t4) # gMNResultsOverlayAlpha + 0
  /* 153E08 80134C68 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 153E0C 80134C6C AFBF0014 */        sw $ra, 0x14($sp)
  /* 153E10 80134C70 2C410080 */     sltiu $at, $v0, 0x80
  /* 153E14 80134C74 10200007 */      beqz $at, .L80134C94
  /* 153E18 80134C78 AFA40018 */        sw $a0, 0x18($sp)
  /* 153E1C 80134C7C 244E0009 */     addiu $t6, $v0, 9
  /* 153E20 80134C80 2DC10081 */     sltiu $at, $t6, 0x81
  /* 153E24 80134C84 14200003 */      bnez $at, .L80134C94
  /* 153E28 80134C88 AD8E0000 */        sw $t6, ($t4) # gMNResultsOverlayAlpha + 0
  /* 153E2C 80134C8C 24180080 */     addiu $t8, $zero, 0x80
  /* 153E30 80134C90 AD980000 */        sw $t8, ($t4) # gMNResultsOverlayAlpha + 0
  .L80134C94:
  /* 153E34 80134C94 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 153E38 80134C98 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 153E3C 80134C9C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153E40 80134CA0 3C0DE700 */       lui $t5, 0xe700
  /* 153E44 80134CA4 3C0FE300 */       lui $t7, (0xE3000A01 >> 16) # 3808430593
  /* 153E48 80134CA8 24590008 */     addiu $t9, $v0, 8
  /* 153E4C 80134CAC AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 153E50 80134CB0 AC400004 */        sw $zero, 4($v0)
  /* 153E54 80134CB4 AC4D0000 */        sw $t5, ($v0)
  /* 153E58 80134CB8 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153E5C 80134CBC 35EF0A01 */       ori $t7, $t7, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 153E60 80134CC0 3C19FA00 */       lui $t9, 0xfa00
  /* 153E64 80134CC4 244E0008 */     addiu $t6, $v0, 8
  /* 153E68 80134CC8 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 153E6C 80134CCC AC400004 */        sw $zero, 4($v0)
  /* 153E70 80134CD0 AC4F0000 */        sw $t7, ($v0)
  /* 153E74 80134CD4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153E78 80134CD8 3C1FE200 */       lui $ra, (0xE200001C >> 16) # 3791650844
  /* 153E7C 80134CDC 37FF001C */       ori $ra, $ra, (0xE200001C & 0xFFFF) # 3791650844
  /* 153E80 80134CE0 24580008 */     addiu $t8, $v0, 8
  /* 153E84 80134CE4 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 153E88 80134CE8 AC590000 */        sw $t9, ($v0)
  /* 153E8C 80134CEC 8D8E0000 */        lw $t6, ($t4) # gMNResultsOverlayAlpha + 0
  /* 153E90 80134CF0 3C19FCFF */       lui $t9, (0xFCFFFFFF >> 16) # 4244635647
  /* 153E94 80134CF4 3739FFFF */       ori $t9, $t9, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 153E98 80134CF8 31CF00FF */      andi $t7, $t6, 0xff
  /* 153E9C 80134CFC AC4F0004 */        sw $t7, 4($v0)
  /* 153EA0 80134D00 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153EA4 80134D04 3C0EFFFD */       lui $t6, (0xFFFDF6FB >> 16) # 4294833915
  /* 153EA8 80134D08 35CEF6FB */       ori $t6, $t6, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 153EAC 80134D0C 24580008 */     addiu $t8, $v0, 8
  /* 153EB0 80134D10 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 153EB4 80134D14 AC4E0004 */        sw $t6, 4($v0)
  /* 153EB8 80134D18 AC590000 */        sw $t9, ($v0)
  /* 153EBC 80134D1C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153EC0 80134D20 3C180050 */       lui $t8, (0x5041C8 >> 16) # 5259720
  /* 153EC4 80134D24 371841C8 */       ori $t8, $t8, (0x5041C8 & 0xFFFF) # 5259720
  /* 153EC8 80134D28 244F0008 */     addiu $t7, $v0, 8
  /* 153ECC 80134D2C AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 153ED0 80134D30 AC580004 */        sw $t8, 4($v0)
  /* 153ED4 80134D34 AC5F0000 */        sw $ra, ($v0)
  /* 153ED8 80134D38 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153EDC 80134D3C 3C0F0002 */       lui $t7, (0x28028 >> 16) # 163880
  /* 153EE0 80134D40 3C0EF64D */       lui $t6, (0xF64D8398 >> 16) # 4132275096
  /* 153EE4 80134D44 24590008 */     addiu $t9, $v0, 8
  /* 153EE8 80134D48 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 153EEC 80134D4C 35CE8398 */       ori $t6, $t6, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 153EF0 80134D50 35EF8028 */       ori $t7, $t7, (0x28028 & 0xFFFF) # 163880
  /* 153EF4 80134D54 AC4F0004 */        sw $t7, 4($v0)
  /* 153EF8 80134D58 AC4E0000 */        sw $t6, ($v0)
  /* 153EFC 80134D5C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153F00 80134D60 3C0E0055 */       lui $t6, (0x552078 >> 16) # 5578872
  /* 153F04 80134D64 35CE2078 */       ori $t6, $t6, (0x552078 & 0xFFFF) # 5578872
  /* 153F08 80134D68 24580008 */     addiu $t8, $v0, 8
  /* 153F0C 80134D6C AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 153F10 80134D70 AC400004 */        sw $zero, 4($v0)
  /* 153F14 80134D74 AC4D0000 */        sw $t5, ($v0)
  /* 153F18 80134D78 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 153F1C 80134D7C 24590008 */     addiu $t9, $v0, 8
  /* 153F20 80134D80 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 153F24 80134D84 AC5F0000 */        sw $ra, ($v0)
  /* 153F28 80134D88 0C0333AB */       jal func_ovl0_800CCEAC
  /* 153F2C 80134D8C AC4E0004 */        sw $t6, 4($v0)
  /* 153F30 80134D90 8FBF0014 */        lw $ra, 0x14($sp)
  /* 153F34 80134D94 27BD0018 */     addiu $sp, $sp, 0x18
  /* 153F38 80134D98 03E00008 */        jr $ra
  /* 153F3C 80134D9C 00000000 */       nop

glabel mnResultsCreateOverlay
  /* 153F40 80134DA0 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 153F44 80134DA4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 153F48 80134DA8 3C018014 */       lui $at, %hi(gMNResultsOverlayAlpha)
  /* 153F4C 80134DAC AC209BC0 */        sw $zero, %lo(gMNResultsOverlayAlpha)($at)
  /* 153F50 80134DB0 00002025 */        or $a0, $zero, $zero
  /* 153F54 80134DB4 00002825 */        or $a1, $zero, $zero
  /* 153F58 80134DB8 24060015 */     addiu $a2, $zero, 0x15
  /* 153F5C 80134DBC 0C00265A */       jal omMakeGObjSPAfter
  /* 153F60 80134DC0 3C078000 */       lui $a3, 0x8000
  /* 153F64 80134DC4 3C058013 */       lui $a1, %hi(mnResultsRenderOverlay)
  /* 153F68 80134DC8 240EFFFF */     addiu $t6, $zero, -1
  /* 153F6C 80134DCC AFAE0010 */        sw $t6, 0x10($sp)
  /* 153F70 80134DD0 24A54C5C */     addiu $a1, $a1, %lo(mnResultsRenderOverlay)
  /* 153F74 80134DD4 00402025 */        or $a0, $v0, $zero
  /* 153F78 80134DD8 2406001E */     addiu $a2, $zero, 0x1e
  /* 153F7C 80134DDC 0C00277D */       jal omAddGObjRenderProc
  /* 153F80 80134DE0 3C078000 */       lui $a3, 0x8000
  /* 153F84 80134DE4 8FBF001C */        lw $ra, 0x1c($sp)
  /* 153F88 80134DE8 27BD0020 */     addiu $sp, $sp, 0x20
  /* 153F8C 80134DEC 03E00008 */        jr $ra
  /* 153F90 80134DF0 00000000 */       nop

glabel mnResultsCreateOverlayViewport
  /* 153F94 80134DF4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 153F98 80134DF8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 153F9C 80134DFC AFBF003C */        sw $ra, 0x3c($sp)
  /* 153FA0 80134E00 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 153FA4 80134E04 240F0011 */     addiu $t7, $zero, 0x11
  /* 153FA8 80134E08 24180000 */     addiu $t8, $zero, 0
  /* 153FAC 80134E0C 3C194000 */       lui $t9, 0x4000
  /* 153FB0 80134E10 2408FFFF */     addiu $t0, $zero, -1
  /* 153FB4 80134E14 24090001 */     addiu $t1, $zero, 1
  /* 153FB8 80134E18 240A0001 */     addiu $t2, $zero, 1
  /* 153FBC 80134E1C AFAA0030 */        sw $t2, 0x30($sp)
  /* 153FC0 80134E20 AFA90028 */        sw $t1, 0x28($sp)
  /* 153FC4 80134E24 AFA80020 */        sw $t0, 0x20($sp)
  /* 153FC8 80134E28 AFB9001C */        sw $t9, 0x1c($sp)
  /* 153FCC 80134E2C AFB80018 */        sw $t8, 0x18($sp)
  /* 153FD0 80134E30 AFAF0014 */        sw $t7, 0x14($sp)
  /* 153FD4 80134E34 AFAE0010 */        sw $t6, 0x10($sp)
  /* 153FD8 80134E38 AFA00024 */        sw $zero, 0x24($sp)
  /* 153FDC 80134E3C AFA0002C */        sw $zero, 0x2c($sp)
  /* 153FE0 80134E40 AFA00034 */        sw $zero, 0x34($sp)
  /* 153FE4 80134E44 24040401 */     addiu $a0, $zero, 0x401
  /* 153FE8 80134E48 00002825 */        or $a1, $zero, $zero
  /* 153FEC 80134E4C 24060010 */     addiu $a2, $zero, 0x10
  /* 153FF0 80134E50 0C002E4F */       jal func_8000B93C
  /* 153FF4 80134E54 3C078000 */       lui $a3, 0x8000
  /* 153FF8 80134E58 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 153FFC 80134E5C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 154000 80134E60 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 154004 80134E64 8C430074 */        lw $v1, 0x74($v0)
  /* 154008 80134E68 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 15400C 80134E6C 44050000 */      mfc1 $a1, $f0
  /* 154010 80134E70 44060000 */      mfc1 $a2, $f0
  /* 154014 80134E74 3C07439B */       lui $a3, 0x439b
  /* 154018 80134E78 24640008 */     addiu $a0, $v1, 8
  /* 15401C 80134E7C 0C001C20 */       jal func_80007080
  /* 154020 80134E80 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 154024 80134E84 8FBF003C */        lw $ra, 0x3c($sp)
  /* 154028 80134E88 27BD0040 */     addiu $sp, $sp, 0x40
  /* 15402C 80134E8C 03E00008 */        jr $ra
  /* 154030 80134E90 00000000 */       nop

glabel mnResultsRenderBackgroundOverlay
  /* 154034 80134E94 3C0C8014 */       lui $t4, %hi(gMNResultsBackgroundOverlayAlpha)
  /* 154038 80134E98 258C9BC4 */     addiu $t4, $t4, %lo(gMNResultsBackgroundOverlayAlpha)
  /* 15403C 80134E9C 8D820000 */        lw $v0, ($t4) # gMNResultsBackgroundOverlayAlpha + 0
  /* 154040 80134EA0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 154044 80134EA4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 154048 80134EA8 18400007 */      blez $v0, .L80134EC8
  /* 15404C 80134EAC 244EFFFB */     addiu $t6, $v0, -5
  /* 154050 80134EB0 05C10005 */      bgez $t6, .L80134EC8
  /* 154054 80134EB4 AD8E0000 */        sw $t6, ($t4) # gMNResultsBackgroundOverlayAlpha + 0
  /* 154058 80134EB8 0C0026A1 */       jal omEjectGObj
  /* 15405C 80134EBC 00000000 */       nop
  /* 154060 80134EC0 3C0C8014 */       lui $t4, %hi(gMNResultsBackgroundOverlayAlpha)
  /* 154064 80134EC4 258C9BC4 */     addiu $t4, $t4, %lo(gMNResultsBackgroundOverlayAlpha)
  .L80134EC8:
  /* 154068 80134EC8 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 15406C 80134ECC 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 154070 80134ED0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154074 80134ED4 3C0DE700 */       lui $t5, 0xe700
  /* 154078 80134ED8 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 15407C 80134EDC 24580008 */     addiu $t8, $v0, 8
  /* 154080 80134EE0 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 154084 80134EE4 AC400004 */        sw $zero, 4($v0)
  /* 154088 80134EE8 AC4D0000 */        sw $t5, ($v0)
  /* 15408C 80134EEC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154090 80134EF0 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 154094 80134EF4 3C18FA00 */       lui $t8, 0xfa00
  /* 154098 80134EF8 24590008 */     addiu $t9, $v0, 8
  /* 15409C 80134EFC AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 1540A0 80134F00 AC400004 */        sw $zero, 4($v0)
  /* 1540A4 80134F04 AC4E0000 */        sw $t6, ($v0)
  /* 1540A8 80134F08 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1540AC 80134F0C 3C1FE200 */       lui $ra, (0xE200001C >> 16) # 3791650844
  /* 1540B0 80134F10 37FF001C */       ori $ra, $ra, (0xE200001C & 0xFFFF) # 3791650844
  /* 1540B4 80134F14 244F0008 */     addiu $t7, $v0, 8
  /* 1540B8 80134F18 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 1540BC 80134F1C AC580000 */        sw $t8, ($v0)
  /* 1540C0 80134F20 8D990000 */        lw $t9, ($t4) # gMNResultsBackgroundOverlayAlpha + 0
  /* 1540C4 80134F24 3C18FCFF */       lui $t8, (0xFCFFFFFF >> 16) # 4244635647
  /* 1540C8 80134F28 3718FFFF */       ori $t8, $t8, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 1540CC 80134F2C 332E00FF */      andi $t6, $t9, 0xff
  /* 1540D0 80134F30 AC4E0004 */        sw $t6, 4($v0)
  /* 1540D4 80134F34 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1540D8 80134F38 3C19FFFD */       lui $t9, (0xFFFDF6FB >> 16) # 4294833915
  /* 1540DC 80134F3C 3739F6FB */       ori $t9, $t9, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 1540E0 80134F40 244F0008 */     addiu $t7, $v0, 8
  /* 1540E4 80134F44 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 1540E8 80134F48 AC590004 */        sw $t9, 4($v0)
  /* 1540EC 80134F4C AC580000 */        sw $t8, ($v0)
  /* 1540F0 80134F50 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1540F4 80134F54 3C0F0050 */       lui $t7, (0x5041C8 >> 16) # 5259720
  /* 1540F8 80134F58 35EF41C8 */       ori $t7, $t7, (0x5041C8 & 0xFFFF) # 5259720
  /* 1540FC 80134F5C 244E0008 */     addiu $t6, $v0, 8
  /* 154100 80134F60 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 154104 80134F64 AC4F0004 */        sw $t7, 4($v0)
  /* 154108 80134F68 AC5F0000 */        sw $ra, ($v0)
  /* 15410C 80134F6C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154110 80134F70 3C0E0002 */       lui $t6, (0x28028 >> 16) # 163880
  /* 154114 80134F74 3C19F64D */       lui $t9, (0xF64D8398 >> 16) # 4132275096
  /* 154118 80134F78 24580008 */     addiu $t8, $v0, 8
  /* 15411C 80134F7C AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 154120 80134F80 37398398 */       ori $t9, $t9, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 154124 80134F84 35CE8028 */       ori $t6, $t6, (0x28028 & 0xFFFF) # 163880
  /* 154128 80134F88 AC4E0004 */        sw $t6, 4($v0)
  /* 15412C 80134F8C AC590000 */        sw $t9, ($v0)
  /* 154130 80134F90 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154134 80134F94 3C190055 */       lui $t9, (0x552078 >> 16) # 5578872
  /* 154138 80134F98 37392078 */       ori $t9, $t9, (0x552078 & 0xFFFF) # 5578872
  /* 15413C 80134F9C 244F0008 */     addiu $t7, $v0, 8
  /* 154140 80134FA0 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 154144 80134FA4 AC400004 */        sw $zero, 4($v0)
  /* 154148 80134FA8 AC4D0000 */        sw $t5, ($v0)
  /* 15414C 80134FAC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154150 80134FB0 24580008 */     addiu $t8, $v0, 8
  /* 154154 80134FB4 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 154158 80134FB8 AC590004 */        sw $t9, 4($v0)
  /* 15415C 80134FBC AC5F0000 */        sw $ra, ($v0)
  /* 154160 80134FC0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 154164 80134FC4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 154168 80134FC8 03E00008 */        jr $ra
  /* 15416C 80134FCC 00000000 */       nop

glabel mnResultsCreateBackgroundOverlay
  /* 154170 80134FD0 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 154174 80134FD4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 154178 80134FD8 240E00FF */     addiu $t6, $zero, 0xff
  /* 15417C 80134FDC 3C018014 */       lui $at, %hi(gMNResultsBackgroundOverlayAlpha)
  /* 154180 80134FE0 AC2E9BC4 */        sw $t6, %lo(gMNResultsBackgroundOverlayAlpha)($at)
  /* 154184 80134FE4 00002025 */        or $a0, $zero, $zero
  /* 154188 80134FE8 00002825 */        or $a1, $zero, $zero
  /* 15418C 80134FEC 24060019 */     addiu $a2, $zero, 0x19
  /* 154190 80134FF0 0C00265A */       jal omMakeGObjSPAfter
  /* 154194 80134FF4 3C078000 */       lui $a3, 0x8000
  /* 154198 80134FF8 3C058013 */       lui $a1, %hi(mnResultsRenderBackgroundOverlay)
  /* 15419C 80134FFC 240FFFFF */     addiu $t7, $zero, -1
  /* 1541A0 80135000 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1541A4 80135004 24A54E94 */     addiu $a1, $a1, %lo(mnResultsRenderBackgroundOverlay)
  /* 1541A8 80135008 00402025 */        or $a0, $v0, $zero
  /* 1541AC 8013500C 24060023 */     addiu $a2, $zero, 0x23
  /* 1541B0 80135010 0C00277D */       jal omAddGObjRenderProc
  /* 1541B4 80135014 3C078000 */       lui $a3, 0x8000
  /* 1541B8 80135018 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1541BC 8013501C 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1541C0 80135020 03E00008 */        jr $ra
  /* 1541C4 80135024 00000000 */       nop

glabel mnResultsCreateBackgroundOverlayViewport
  /* 1541C8 80135028 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1541CC 8013502C 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1541D0 80135030 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1541D4 80135034 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1541D8 80135038 240F0037 */     addiu $t7, $zero, 0x37
  /* 1541DC 8013503C 24180008 */     addiu $t8, $zero, 8
  /* 1541E0 80135040 24190000 */     addiu $t9, $zero, 0
  /* 1541E4 80135044 2408FFFF */     addiu $t0, $zero, -1
  /* 1541E8 80135048 24090001 */     addiu $t1, $zero, 1
  /* 1541EC 8013504C 240A0001 */     addiu $t2, $zero, 1
  /* 1541F0 80135050 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1541F4 80135054 AFA90028 */        sw $t1, 0x28($sp)
  /* 1541F8 80135058 AFA80020 */        sw $t0, 0x20($sp)
  /* 1541FC 8013505C AFB9001C */        sw $t9, 0x1c($sp)
  /* 154200 80135060 AFB80018 */        sw $t8, 0x18($sp)
  /* 154204 80135064 AFAF0014 */        sw $t7, 0x14($sp)
  /* 154208 80135068 AFAE0010 */        sw $t6, 0x10($sp)
  /* 15420C 8013506C AFA00024 */        sw $zero, 0x24($sp)
  /* 154210 80135070 AFA0002C */        sw $zero, 0x2c($sp)
  /* 154214 80135074 AFA00034 */        sw $zero, 0x34($sp)
  /* 154218 80135078 24040401 */     addiu $a0, $zero, 0x401
  /* 15421C 8013507C 00002825 */        or $a1, $zero, $zero
  /* 154220 80135080 24060010 */     addiu $a2, $zero, 0x10
  /* 154224 80135084 0C002E4F */       jal func_8000B93C
  /* 154228 80135088 3C078000 */       lui $a3, 0x8000
  /* 15422C 8013508C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 154230 80135090 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 154234 80135094 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 154238 80135098 8C430074 */        lw $v1, 0x74($v0)
  /* 15423C 8013509C 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 154240 801350A0 44050000 */      mfc1 $a1, $f0
  /* 154244 801350A4 44060000 */      mfc1 $a2, $f0
  /* 154248 801350A8 3C07439B */       lui $a3, 0x439b
  /* 15424C 801350AC 24640008 */     addiu $a0, $v1, 8
  /* 154250 801350B0 0C001C20 */       jal func_80007080
  /* 154254 801350B4 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 154258 801350B8 8FBF003C */        lw $ra, 0x3c($sp)
  /* 15425C 801350BC 27BD0040 */     addiu $sp, $sp, 0x40
  /* 154260 801350C0 03E00008 */        jr $ra
  /* 154264 801350C4 00000000 */       nop

glabel mnResultsRenderBackgroundOverlay2
  /* 154268 801350C8 3C0C8014 */       lui $t4, %hi(gMNResultsBackgroundOverlay2Alpha)
  /* 15426C 801350CC 258C9BC8 */     addiu $t4, $t4, %lo(gMNResultsBackgroundOverlay2Alpha)
  /* 154270 801350D0 8D820000 */        lw $v0, ($t4) # gMNResultsBackgroundOverlay2Alpha + 0
  /* 154274 801350D4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 154278 801350D8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15427C 801350DC 18400007 */      blez $v0, .L801350FC
  /* 154280 801350E0 244EFFFB */     addiu $t6, $v0, -5
  /* 154284 801350E4 05C10005 */      bgez $t6, .L801350FC
  /* 154288 801350E8 AD8E0000 */        sw $t6, ($t4) # gMNResultsBackgroundOverlay2Alpha + 0
  /* 15428C 801350EC 0C0026A1 */       jal omEjectGObj
  /* 154290 801350F0 00000000 */       nop
  /* 154294 801350F4 3C0C8014 */       lui $t4, %hi(gMNResultsBackgroundOverlay2Alpha)
  /* 154298 801350F8 258C9BC8 */     addiu $t4, $t4, %lo(gMNResultsBackgroundOverlay2Alpha)
  .L801350FC:
  /* 15429C 801350FC 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 1542A0 80135100 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 1542A4 80135104 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1542A8 80135108 3C0DE700 */       lui $t5, 0xe700
  /* 1542AC 8013510C 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 1542B0 80135110 24580008 */     addiu $t8, $v0, 8
  /* 1542B4 80135114 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 1542B8 80135118 AC400004 */        sw $zero, 4($v0)
  /* 1542BC 8013511C AC4D0000 */        sw $t5, ($v0)
  /* 1542C0 80135120 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1542C4 80135124 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 1542C8 80135128 3C18FA00 */       lui $t8, 0xfa00
  /* 1542CC 8013512C 24590008 */     addiu $t9, $v0, 8
  /* 1542D0 80135130 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 1542D4 80135134 AC400004 */        sw $zero, 4($v0)
  /* 1542D8 80135138 AC4E0000 */        sw $t6, ($v0)
  /* 1542DC 8013513C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1542E0 80135140 3C1FE200 */       lui $ra, (0xE200001C >> 16) # 3791650844
  /* 1542E4 80135144 37FF001C */       ori $ra, $ra, (0xE200001C & 0xFFFF) # 3791650844
  /* 1542E8 80135148 244F0008 */     addiu $t7, $v0, 8
  /* 1542EC 8013514C AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 1542F0 80135150 AC580000 */        sw $t8, ($v0)
  /* 1542F4 80135154 8D990000 */        lw $t9, ($t4) # gMNResultsBackgroundOverlay2Alpha + 0
  /* 1542F8 80135158 3C18FCFF */       lui $t8, (0xFCFFFFFF >> 16) # 4244635647
  /* 1542FC 8013515C 3718FFFF */       ori $t8, $t8, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 154300 80135160 332E00FF */      andi $t6, $t9, 0xff
  /* 154304 80135164 AC4E0004 */        sw $t6, 4($v0)
  /* 154308 80135168 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 15430C 8013516C 3C19FFFD */       lui $t9, (0xFFFDF6FB >> 16) # 4294833915
  /* 154310 80135170 3739F6FB */       ori $t9, $t9, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 154314 80135174 244F0008 */     addiu $t7, $v0, 8
  /* 154318 80135178 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 15431C 8013517C AC590004 */        sw $t9, 4($v0)
  /* 154320 80135180 AC580000 */        sw $t8, ($v0)
  /* 154324 80135184 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154328 80135188 3C0F0050 */       lui $t7, (0x5041C8 >> 16) # 5259720
  /* 15432C 8013518C 35EF41C8 */       ori $t7, $t7, (0x5041C8 & 0xFFFF) # 5259720
  /* 154330 80135190 244E0008 */     addiu $t6, $v0, 8
  /* 154334 80135194 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 154338 80135198 AC4F0004 */        sw $t7, 4($v0)
  /* 15433C 8013519C AC5F0000 */        sw $ra, ($v0)
  /* 154340 801351A0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154344 801351A4 3C0E0002 */       lui $t6, (0x28028 >> 16) # 163880
  /* 154348 801351A8 3C19F64D */       lui $t9, (0xF64D8398 >> 16) # 4132275096
  /* 15434C 801351AC 24580008 */     addiu $t8, $v0, 8
  /* 154350 801351B0 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 154354 801351B4 37398398 */       ori $t9, $t9, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 154358 801351B8 35CE8028 */       ori $t6, $t6, (0x28028 & 0xFFFF) # 163880
  /* 15435C 801351BC AC4E0004 */        sw $t6, 4($v0)
  /* 154360 801351C0 AC590000 */        sw $t9, ($v0)
  /* 154364 801351C4 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154368 801351C8 3C190055 */       lui $t9, (0x552078 >> 16) # 5578872
  /* 15436C 801351CC 37392078 */       ori $t9, $t9, (0x552078 & 0xFFFF) # 5578872
  /* 154370 801351D0 244F0008 */     addiu $t7, $v0, 8
  /* 154374 801351D4 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 154378 801351D8 AC400004 */        sw $zero, 4($v0)
  /* 15437C 801351DC AC4D0000 */        sw $t5, ($v0)
  /* 154380 801351E0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 154384 801351E4 24580008 */     addiu $t8, $v0, 8
  /* 154388 801351E8 AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 15438C 801351EC AC590004 */        sw $t9, 4($v0)
  /* 154390 801351F0 AC5F0000 */        sw $ra, ($v0)
  /* 154394 801351F4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 154398 801351F8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 15439C 801351FC 03E00008 */        jr $ra
  /* 1543A0 80135200 00000000 */       nop

glabel mnResultsCreateBackgroundOverlay2
  /* 1543A4 80135204 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 1543A8 80135208 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1543AC 8013520C 240E00FF */     addiu $t6, $zero, 0xff
  /* 1543B0 80135210 3C018014 */       lui $at, %hi(gMNResultsBackgroundOverlay2Alpha)
  /* 1543B4 80135214 AC2E9BC8 */        sw $t6, %lo(gMNResultsBackgroundOverlay2Alpha)($at)
  /* 1543B8 80135218 00002025 */        or $a0, $zero, $zero
  /* 1543BC 8013521C 00002825 */        or $a1, $zero, $zero
  /* 1543C0 80135220 24060018 */     addiu $a2, $zero, 0x18
  /* 1543C4 80135224 0C00265A */       jal omMakeGObjSPAfter
  /* 1543C8 80135228 3C078000 */       lui $a3, 0x8000
  /* 1543CC 8013522C 3C058013 */       lui $a1, %hi(mnResultsRenderBackgroundOverlay2)
  /* 1543D0 80135230 240FFFFF */     addiu $t7, $zero, -1
  /* 1543D4 80135234 AFAF0010 */        sw $t7, 0x10($sp)
  /* 1543D8 80135238 24A550C8 */     addiu $a1, $a1, %lo(mnResultsRenderBackgroundOverlay2)
  /* 1543DC 8013523C 00402025 */        or $a0, $v0, $zero
  /* 1543E0 80135240 24060022 */     addiu $a2, $zero, 0x22
  /* 1543E4 80135244 0C00277D */       jal omAddGObjRenderProc
  /* 1543E8 80135248 3C078000 */       lui $a3, 0x8000
  /* 1543EC 8013524C 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1543F0 80135250 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1543F4 80135254 03E00008 */        jr $ra
  /* 1543F8 80135258 00000000 */       nop

glabel mnResultsCreateBackgroundOverlay2Viewport
  /* 1543FC 8013525C 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 154400 80135260 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 154404 80135264 AFBF003C */        sw $ra, 0x3c($sp)
  /* 154408 80135268 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 15440C 8013526C 240F0046 */     addiu $t7, $zero, 0x46
  /* 154410 80135270 24180004 */     addiu $t8, $zero, 4
  /* 154414 80135274 24190000 */     addiu $t9, $zero, 0
  /* 154418 80135278 2408FFFF */     addiu $t0, $zero, -1
  /* 15441C 8013527C 24090001 */     addiu $t1, $zero, 1
  /* 154420 80135280 240A0001 */     addiu $t2, $zero, 1
  /* 154424 80135284 AFAA0030 */        sw $t2, 0x30($sp)
  /* 154428 80135288 AFA90028 */        sw $t1, 0x28($sp)
  /* 15442C 8013528C AFA80020 */        sw $t0, 0x20($sp)
  /* 154430 80135290 AFB9001C */        sw $t9, 0x1c($sp)
  /* 154434 80135294 AFB80018 */        sw $t8, 0x18($sp)
  /* 154438 80135298 AFAF0014 */        sw $t7, 0x14($sp)
  /* 15443C 8013529C AFAE0010 */        sw $t6, 0x10($sp)
  /* 154440 801352A0 AFA00024 */        sw $zero, 0x24($sp)
  /* 154444 801352A4 AFA0002C */        sw $zero, 0x2c($sp)
  /* 154448 801352A8 AFA00034 */        sw $zero, 0x34($sp)
  /* 15444C 801352AC 24040401 */     addiu $a0, $zero, 0x401
  /* 154450 801352B0 00002825 */        or $a1, $zero, $zero
  /* 154454 801352B4 24060010 */     addiu $a2, $zero, 0x10
  /* 154458 801352B8 0C002E4F */       jal func_8000B93C
  /* 15445C 801352BC 3C078000 */       lui $a3, 0x8000
  /* 154460 801352C0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 154464 801352C4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 154468 801352C8 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 15446C 801352CC 8C430074 */        lw $v1, 0x74($v0)
  /* 154470 801352D0 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 154474 801352D4 44050000 */      mfc1 $a1, $f0
  /* 154478 801352D8 44060000 */      mfc1 $a2, $f0
  /* 15447C 801352DC 3C07439B */       lui $a3, 0x439b
  /* 154480 801352E0 24640008 */     addiu $a0, $v1, 8
  /* 154484 801352E4 0C001C20 */       jal func_80007080
  /* 154488 801352E8 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 15448C 801352EC 8FBF003C */        lw $ra, 0x3c($sp)
  /* 154490 801352F0 27BD0040 */     addiu $sp, $sp, 0x40
  /* 154494 801352F4 03E00008 */        jr $ra
  /* 154498 801352F8 00000000 */       nop

glabel mnResultsGetColumnX
  /* 15449C 801352FC 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 1544A0 80135300 3C0F8014 */       lui $t7, %hi(dMNResultsColumnX2P)
  /* 1544A4 80135304 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1544A8 80135308 25EF9678 */     addiu $t7, $t7, %lo(dMNResultsColumnX2P)
  /* 1544AC 8013530C 8DF90000 */        lw $t9, ($t7) # dMNResultsColumnX2P + 0
  /* 1544B0 80135310 8DF80004 */        lw $t8, 4($t7) # dMNResultsColumnX2P + 4
  /* 1544B4 80135314 27AE0040 */     addiu $t6, $sp, 0x40
  /* 1544B8 80135318 3C098014 */       lui $t1, %hi(dMNResultsColumnX3P)
  /* 1544BC 8013531C 25299680 */     addiu $t1, $t1, %lo(dMNResultsColumnX3P)
  /* 1544C0 80135320 ADD90000 */        sw $t9, ($t6)
  /* 1544C4 80135324 ADD80004 */        sw $t8, 4($t6)
  /* 1544C8 80135328 8D2B0000 */        lw $t3, ($t1) # dMNResultsColumnX3P + 0
  /* 1544CC 8013532C 27A80034 */     addiu $t0, $sp, 0x34
  /* 1544D0 80135330 8D2A0004 */        lw $t2, 4($t1) # dMNResultsColumnX3P + 4
  /* 1544D4 80135334 AD0B0000 */        sw $t3, ($t0)
  /* 1544D8 80135338 8D2B0008 */        lw $t3, 8($t1) # dMNResultsColumnX3P + 8
  /* 1544DC 8013533C 3C0D8014 */       lui $t5, %hi(dMNResultsColumnX4P)
  /* 1544E0 80135340 25AD968C */     addiu $t5, $t5, %lo(dMNResultsColumnX4P)
  /* 1544E4 80135344 AD0A0004 */        sw $t2, 4($t0)
  /* 1544E8 80135348 AD0B0008 */        sw $t3, 8($t0)
  /* 1544EC 8013534C 8DAE0004 */        lw $t6, 4($t5) # dMNResultsColumnX4P + 4
  /* 1544F0 80135350 8DAF0000 */        lw $t7, ($t5) # dMNResultsColumnX4P + 0
  /* 1544F4 80135354 27AC0024 */     addiu $t4, $sp, 0x24
  /* 1544F8 80135358 AD8E0004 */        sw $t6, 4($t4)
  /* 1544FC 8013535C AD8F0000 */        sw $t7, ($t4)
  /* 154500 80135360 8DAF0008 */        lw $t7, 8($t5) # dMNResultsColumnX4P + 8
  /* 154504 80135364 8DAE000C */        lw $t6, 0xc($t5) # dMNResultsColumnX4P + 12
  /* 154508 80135368 AD8F0008 */        sw $t7, 8($t4)
  /* 15450C 8013536C AD8E000C */        sw $t6, 0xc($t4)
  /* 154510 80135370 0C04C817 */       jal mnResultsGetPresentCount
  /* 154514 80135374 AFA40048 */        sw $a0, 0x48($sp)
  /* 154518 80135378 24010002 */     addiu $at, $zero, 2
  /* 15451C 8013537C 10410008 */       beq $v0, $at, .L801353A0
  /* 154520 80135380 8FA40048 */        lw $a0, 0x48($sp)
  /* 154524 80135384 24010003 */     addiu $at, $zero, 3
  /* 154528 80135388 1041000B */       beq $v0, $at, .L801353B8
  /* 15452C 8013538C 24010004 */     addiu $at, $zero, 4
  /* 154530 80135390 1041000F */       beq $v0, $at, .L801353D0
  /* 154534 80135394 00000000 */       nop
  /* 154538 80135398 1000000D */         b .L801353D0
  /* 15453C 8013539C 00000000 */       nop
  .L801353A0:
  /* 154540 801353A0 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 154544 801353A4 00000000 */       nop
  /* 154548 801353A8 0002C080 */       sll $t8, $v0, 2
  /* 15454C 801353AC 03B8C821 */      addu $t9, $sp, $t8
  /* 154550 801353B0 1000000C */         b .L801353E4
  /* 154554 801353B4 C7200040 */      lwc1 $f0, 0x40($t9)
  .L801353B8:
  /* 154558 801353B8 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 15455C 801353BC 00000000 */       nop
  /* 154560 801353C0 00024080 */       sll $t0, $v0, 2
  /* 154564 801353C4 03A84821 */      addu $t1, $sp, $t0
  /* 154568 801353C8 10000006 */         b .L801353E4
  /* 15456C 801353CC C5200034 */      lwc1 $f0, 0x34($t1)
  .L801353D0:
  /* 154570 801353D0 0C04C82E */       jal mnResultsGetLowerPortCount
  /* 154574 801353D4 00000000 */       nop
  /* 154578 801353D8 00025080 */       sll $t2, $v0, 2
  /* 15457C 801353DC 03AA5821 */      addu $t3, $sp, $t2
  /* 154580 801353E0 C5600024 */      lwc1 $f0, 0x24($t3)
  .L801353E4:
  /* 154584 801353E4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 154588 801353E8 27BD0048 */     addiu $sp, $sp, 0x48
  /* 15458C 801353EC 03E00008 */        jr $ra
  /* 154590 801353F0 00000000 */       nop

glabel mnResultsGetNumberColorIndex
  /* 154594 801353F4 3C0E8014 */       lui $t6, %hi(dMNResultsNumberTeamColorIndexes)
  /* 154598 801353F8 25CE969C */     addiu $t6, $t6, %lo(dMNResultsNumberTeamColorIndexes)
  /* 15459C 801353FC 8DD80000 */        lw $t8, ($t6) # dMNResultsNumberTeamColorIndexes + 0
  /* 1545A0 80135400 27BDFFF0 */     addiu $sp, $sp, -0x10
  /* 1545A4 80135404 27A30004 */     addiu $v1, $sp, 4
  /* 1545A8 80135408 AC780000 */        sw $t8, ($v1)
  /* 1545AC 8013540C 8DCF0004 */        lw $t7, 4($t6) # dMNResultsNumberTeamColorIndexes + 4
  /* 1545B0 80135410 3C198014 */       lui $t9, %hi(gMNResultsIsTeamBattle)
  /* 1545B4 80135414 000440C0 */       sll $t0, $a0, 3
  /* 1545B8 80135418 AC6F0004 */        sw $t7, 4($v1)
  /* 1545BC 8013541C 8DD80008 */        lw $t8, 8($t6) # dMNResultsNumberTeamColorIndexes + 8
  /* 1545C0 80135420 01044023 */      subu $t0, $t0, $a0
  /* 1545C4 80135424 00084080 */       sll $t0, $t0, 2
  /* 1545C8 80135428 AC780008 */        sw $t8, 8($v1)
  /* 1545CC 8013542C 93399C14 */       lbu $t9, %lo(gMNResultsIsTeamBattle)($t9)
  /* 1545D0 80135430 24010001 */     addiu $at, $zero, 1
  /* 1545D4 80135434 01044021 */      addu $t0, $t0, $a0
  /* 1545D8 80135438 13210003 */       beq $t9, $at, .L80135448
  /* 1545DC 8013543C 00084080 */       sll $t0, $t0, 2
  /* 1545E0 80135440 10000007 */         b .L80135460
  /* 1545E4 80135444 24020004 */     addiu $v0, $zero, 4
  .L80135448:
  /* 1545E8 80135448 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x24))
  /* 1545EC 8013544C 01284821 */      addu $t1, $t1, $t0
  /* 1545F0 80135450 91294D2C */       lbu $t1, %lo((gTransferBattleState + 0x24))($t1)
  /* 1545F4 80135454 00095080 */       sll $t2, $t1, 2
  /* 1545F8 80135458 006A5821 */      addu $t3, $v1, $t2
  /* 1545FC 8013545C 8D620000 */        lw $v0, ($t3)
  .L80135460:
  /* 154600 80135460 03E00008 */        jr $ra
  /* 154604 80135464 27BD0010 */     addiu $sp, $sp, 0x10

glabel mnResultsSetColumnPortIndicatorColors
  /* 154608 80135468 948E0024 */       lhu $t6, 0x24($a0)
  /* 15460C 8013546C 240200FF */     addiu $v0, $zero, 0xff
  /* 154610 80135470 A0800060 */        sb $zero, 0x60($a0)
  /* 154614 80135474 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 154618 80135478 A4980024 */        sh $t8, 0x24($a0)
  /* 15461C 8013547C 37190001 */       ori $t9, $t8, 1
  /* 154620 80135480 A4990024 */        sh $t9, 0x24($a0)
  /* 154624 80135484 A0800061 */        sb $zero, 0x61($a0)
  /* 154628 80135488 A0800062 */        sb $zero, 0x62($a0)
  /* 15462C 8013548C A0820028 */        sb $v0, 0x28($a0)
  /* 154630 80135490 A0820029 */        sb $v0, 0x29($a0)
  /* 154634 80135494 03E00008 */        jr $ra
  /* 154638 80135498 A082002A */        sb $v0, 0x2a($a0)

glabel mnResultsCreateColumnHeaders
  /* 15463C 8013549C 27BDFF70 */     addiu $sp, $sp, -0x90
  /* 154640 801354A0 3C0F8014 */       lui $t7, %hi(dMNResultsPortIndicatorOffsets)
  /* 154644 801354A4 AFBF005C */        sw $ra, 0x5c($sp)
  /* 154648 801354A8 AFBE0058 */        sw $fp, 0x58($sp)
  /* 15464C 801354AC AFB70054 */        sw $s7, 0x54($sp)
  /* 154650 801354B0 AFB60050 */        sw $s6, 0x50($sp)
  /* 154654 801354B4 AFB5004C */        sw $s5, 0x4c($sp)
  /* 154658 801354B8 AFB40048 */        sw $s4, 0x48($sp)
  /* 15465C 801354BC AFB30044 */        sw $s3, 0x44($sp)
  /* 154660 801354C0 AFB20040 */        sw $s2, 0x40($sp)
  /* 154664 801354C4 AFB1003C */        sw $s1, 0x3c($sp)
  /* 154668 801354C8 AFB00038 */        sw $s0, 0x38($sp)
  /* 15466C 801354CC F7B80030 */      sdc1 $f24, 0x30($sp)
  /* 154670 801354D0 F7B60028 */      sdc1 $f22, 0x28($sp)
  /* 154674 801354D4 F7B40020 */      sdc1 $f20, 0x20($sp)
  /* 154678 801354D8 25EF96A8 */     addiu $t7, $t7, %lo(dMNResultsPortIndicatorOffsets)
  /* 15467C 801354DC 8DF90000 */        lw $t9, ($t7) # dMNResultsPortIndicatorOffsets + 0
  /* 154680 801354E0 8DF80004 */        lw $t8, 4($t7) # dMNResultsPortIndicatorOffsets + 4
  /* 154684 801354E4 27AE0074 */     addiu $t6, $sp, 0x74
  /* 154688 801354E8 ADD90000 */        sw $t9, ($t6)
  /* 15468C 801354EC ADD80004 */        sw $t8, 4($t6)
  /* 154690 801354F0 8DF8000C */        lw $t8, 0xc($t7) # dMNResultsPortIndicatorOffsets + 12
  /* 154694 801354F4 8DF90008 */        lw $t9, 8($t7) # dMNResultsPortIndicatorOffsets + 8
  /* 154698 801354F8 3C108000 */       lui $s0, %hi(D_NF_8000005C)
  /* 15469C 801354FC 02003825 */        or $a3, $s0, $zero
  /* 1546A0 80135500 00002025 */        or $a0, $zero, $zero
  /* 1546A4 80135504 00002825 */        or $a1, $zero, $zero
  /* 1546A8 80135508 24060016 */     addiu $a2, $zero, 0x16
  /* 1546AC 8013550C ADD8000C */        sw $t8, 0xc($t6)
  /* 1546B0 80135510 0C00265A */       jal omMakeGObjSPAfter
  /* 1546B4 80135514 ADD90008 */        sw $t9, 8($t6)
  /* 1546B8 80135518 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 1546BC 8013551C 2408FFFF */     addiu $t0, $zero, -1
  /* 1546C0 80135520 0040B025 */        or $s6, $v0, $zero
  /* 1546C4 80135524 AFA80010 */        sw $t0, 0x10($sp)
  /* 1546C8 80135528 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 1546CC 8013552C 00402025 */        or $a0, $v0, $zero
  /* 1546D0 80135530 2406001F */     addiu $a2, $zero, 0x1f
  /* 1546D4 80135534 0C00277D */       jal omAddGObjRenderProc
  /* 1546D8 80135538 02003825 */        or $a3, $s0, $zero
  /* 1546DC 8013553C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1546E0 80135540 4481C000 */      mtc1 $at, $f24 # 10.0 to cop1
  /* 1546E4 80135544 3C014244 */       lui $at, (0x42440000 >> 16) # 49.0
  /* 1546E8 80135548 4481B000 */      mtc1 $at, $f22 # 49.0 to cop1
  /* 1546EC 8013554C 3C014188 */       lui $at, (0x41880000 >> 16) # 17.0
  /* 1546F0 80135550 3C148014 */       lui $s4, %hi(gMNResultsIsPresent)
  /* 1546F4 80135554 3C178014 */       lui $s7, %hi(D_ovl31_8013A048)
  /* 1546F8 80135558 4481A000 */      mtc1 $at, $f20 # 17.0 to cop1
  /* 1546FC 8013555C 26F7A048 */     addiu $s7, $s7, %lo(D_ovl31_8013A048)
  /* 154700 80135560 26949BD0 */     addiu $s4, $s4, %lo(gMNResultsIsPresent)
  /* 154704 80135564 00009025 */        or $s2, $zero, $zero
  /* 154708 80135568 00009825 */        or $s3, $zero, $zero
  /* 15470C 8013556C 241EFFDF */     addiu $fp, $zero, -0x21
  .L80135570:
  /* 154710 80135570 8E890000 */        lw $t1, ($s4) # gMNResultsIsPresent + 0
  /* 154714 80135574 02C02025 */        or $a0, $s6, $zero
  /* 154718 80135578 03B35021 */      addu $t2, $sp, $s3
  /* 15471C 8013557C 11200028 */      beqz $t1, .L80135620
  /* 154720 80135580 3C0C8014 */       lui $t4, %hi(gMNResultsFighterGObjs)
  /* 154724 80135584 8D4A0074 */        lw $t2, 0x74($t2)
  /* 154728 80135588 8EEB0000 */        lw $t3, ($s7) # D_ovl31_8013A048 + 0
  /* 15472C 8013558C 258C9BE0 */     addiu $t4, $t4, %lo(gMNResultsFighterGObjs)
  /* 154730 80135590 026CA821 */      addu $s5, $s3, $t4
  /* 154734 80135594 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 154738 80135598 014B2821 */      addu $a1, $t2, $t3
  /* 15473C 8013559C 00408025 */        or $s0, $v0, $zero
  /* 154740 801355A0 0C04D4BF */       jal mnResultsGetColumnX
  /* 154744 801355A4 02402025 */        or $a0, $s2, $zero
  /* 154748 801355A8 46140100 */     add.s $f4, $f0, $f20
  /* 15474C 801355AC E616005C */      swc1 $f22, %lo(D_NF_8000005C)($s0)
  /* 154750 801355B0 02002025 */        or $a0, $s0, $zero
  /* 154754 801355B4 0C04D51A */       jal mnResultsSetColumnPortIndicatorColors
  /* 154758 801355B8 E6040058 */      swc1 $f4, %lo(D_NF_80000058)($s0)
  /* 15475C 801355BC 8EAD0000 */        lw $t5, ($s5)
  /* 154760 801355C0 02C02025 */        or $a0, $s6, $zero
  /* 154764 801355C4 8DB10084 */        lw $s1, 0x84($t5)
  /* 154768 801355C8 8E2E09C8 */        lw $t6, 0x9c8($s1)
  /* 15476C 801355CC 8DCF0340 */        lw $t7, 0x340($t6)
  /* 154770 801355D0 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 154774 801355D4 8DE50000 */        lw $a1, ($t7)
  /* 154778 801355D8 8E3809C8 */        lw $t8, 0x9c8($s1)
  /* 15477C 801355DC 92290010 */       lbu $t1, 0x10($s1)
  /* 154780 801355E0 944D0024 */       lhu $t5, 0x24($v0)
  /* 154784 801355E4 8F190340 */        lw $t9, 0x340($t8)
  /* 154788 801355E8 00095080 */       sll $t2, $t1, 2
  /* 15478C 801355EC 01BE7824 */       and $t7, $t5, $fp
  /* 154790 801355F0 8F280004 */        lw $t0, 4($t9)
  /* 154794 801355F4 35F80001 */       ori $t8, $t7, 1
  /* 154798 801355F8 010A5821 */      addu $t3, $t0, $t2
  /* 15479C 801355FC 8D6C0000 */        lw $t4, ($t3)
  /* 1547A0 80135600 A44F0024 */        sh $t7, 0x24($v0)
  /* 1547A4 80135604 A4580024 */        sh $t8, 0x24($v0)
  /* 1547A8 80135608 AC4C0030 */        sw $t4, 0x30($v0)
  /* 1547AC 8013560C C6060058 */      lwc1 $f6, %lo(D_NF_80000058)($s0)
  /* 1547B0 80135610 46183201 */     sub.s $f8, $f6, $f24
  /* 1547B4 80135614 E4480058 */      swc1 $f8, 0x58($v0)
  /* 1547B8 80135618 C60A005C */      lwc1 $f10, %lo(D_NF_8000005C)($s0)
  /* 1547BC 8013561C E44A005C */      swc1 $f10, 0x5c($v0)
  .L80135620:
  /* 1547C0 80135620 26520001 */     addiu $s2, $s2, 1
  /* 1547C4 80135624 24010004 */     addiu $at, $zero, 4
  /* 1547C8 80135628 26730004 */     addiu $s3, $s3, 4
  /* 1547CC 8013562C 1641FFD0 */       bne $s2, $at, .L80135570
  /* 1547D0 80135630 26940004 */     addiu $s4, $s4, 4
  /* 1547D4 80135634 8FBF005C */        lw $ra, 0x5c($sp)
  /* 1547D8 80135638 D7B40020 */      ldc1 $f20, 0x20($sp)
  /* 1547DC 8013563C D7B60028 */      ldc1 $f22, 0x28($sp)
  /* 1547E0 80135640 D7B80030 */      ldc1 $f24, 0x30($sp)
  /* 1547E4 80135644 8FB00038 */        lw $s0, 0x38($sp)
  /* 1547E8 80135648 8FB1003C */        lw $s1, 0x3c($sp)
  /* 1547EC 8013564C 8FB20040 */        lw $s2, 0x40($sp)
  /* 1547F0 80135650 8FB30044 */        lw $s3, 0x44($sp)
  /* 1547F4 80135654 8FB40048 */        lw $s4, 0x48($sp)
  /* 1547F8 80135658 8FB5004C */        lw $s5, 0x4c($sp)
  /* 1547FC 8013565C 8FB60050 */        lw $s6, 0x50($sp)
  /* 154800 80135660 8FB70054 */        lw $s7, 0x54($sp)
  /* 154804 80135664 8FBE0058 */        lw $fp, 0x58($sp)
  /* 154808 80135668 03E00008 */        jr $ra
  /* 15480C 8013566C 27BD0090 */     addiu $sp, $sp, 0x90

glabel mnResultsGetKOs
  /* 154810 80135670 00047080 */       sll $t6, $a0, 2
  /* 154814 80135674 3C038014 */       lui $v1, %hi(gMNResultsKOs)
  /* 154818 80135678 006E1821 */      addu $v1, $v1, $t6
  /* 15481C 8013567C 8C639B80 */        lw $v1, %lo(gMNResultsKOs)($v1)
  /* 154820 80135680 286103E8 */      slti $at, $v1, 0x3e8
  /* 154824 80135684 14200003 */      bnez $at, .L80135694
  /* 154828 80135688 00601025 */        or $v0, $v1, $zero
  /* 15482C 8013568C 03E00008 */        jr $ra
  /* 154830 80135690 240203E7 */     addiu $v0, $zero, 0x3e7

  .L80135694:
  /* 154834 80135694 03E00008 */        jr $ra
  /* 154838 80135698 00000000 */       nop

glabel mnResultsDrawKOs
  /* 15483C 8013569C 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 154840 801356A0 3C198014 */       lui $t9, %hi(D_ovl31_8013A048)
  /* 154844 801356A4 8F39A048 */        lw $t9, %lo(D_ovl31_8013A048)($t9)
  /* 154848 801356A8 3C080000 */       lui $t0, %hi(D_NF_00000D38)
  /* 15484C 801356AC AFB00040 */        sw $s0, 0x40($sp)
  /* 154850 801356B0 25080D38 */     addiu $t0, $t0, %lo(D_NF_00000D38)
  /* 154854 801356B4 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 154858 801356B8 00808025 */        or $s0, $a0, $zero
  /* 15485C 801356BC AFBF0044 */        sw $ra, 0x44($sp)
  /* 154860 801356C0 3C078000 */       lui $a3, 0x8000
  /* 154864 801356C4 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 154868 801356C8 240F001F */     addiu $t7, $zero, 0x1f
  /* 15486C 801356CC 2418FFFF */     addiu $t8, $zero, -1
  /* 154870 801356D0 240A0001 */     addiu $t2, $zero, 1
  /* 154874 801356D4 240B0001 */     addiu $t3, $zero, 1
  /* 154878 801356D8 03284821 */      addu $t1, $t9, $t0
  /* 15487C 801356DC F7B40038 */      sdc1 $f20, 0x38($sp)
  /* 154880 801356E0 AFA90020 */        sw $t1, 0x20($sp)
  /* 154884 801356E4 AFAB002C */        sw $t3, 0x2c($sp)
  /* 154888 801356E8 AFAA0024 */        sw $t2, 0x24($sp)
  /* 15488C 801356EC AFB8001C */        sw $t8, 0x1c($sp)
  /* 154890 801356F0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 154894 801356F4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 154898 801356F8 AFA70018 */        sw $a3, 0x18($sp)
  /* 15489C 801356FC 00002025 */        or $a0, $zero, $zero
  /* 1548A0 80135700 AFA00028 */        sw $zero, 0x28($sp)
  /* 1548A4 80135704 00002825 */        or $a1, $zero, $zero
  /* 1548A8 80135708 0C033414 */       jal func_ovl0_800CD050
  /* 1548AC 8013570C 24060016 */     addiu $a2, $zero, 0x16
  /* 1548B0 80135710 44903000 */      mtc1 $s0, $f6
  /* 1548B4 80135714 AFA2005C */        sw $v0, 0x5c($sp)
  /* 1548B8 80135718 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 1548BC 8013571C 46803220 */   cvt.s.w $f8, $f6
  /* 1548C0 80135720 44812000 */      mtc1 $at, $f4 # 26.0 to cop1
  /* 1548C4 80135724 8C4C0074 */        lw $t4, 0x74($v0)
  /* 1548C8 80135728 240400FF */     addiu $a0, $zero, 0xff
  /* 1548CC 8013572C E5840058 */      swc1 $f4, 0x58($t4)
  /* 1548D0 80135730 E7A8004C */      swc1 $f8, 0x4c($sp)
  /* 1548D4 80135734 8C4D0074 */        lw $t5, 0x74($v0)
  /* 1548D8 80135738 C7AA004C */      lwc1 $f10, 0x4c($sp)
  /* 1548DC 8013573C E5AA005C */      swc1 $f10, 0x5c($t5)
  /* 1548E0 80135740 8C430074 */        lw $v1, 0x74($v0)
  /* 1548E4 80135744 946E0024 */       lhu $t6, 0x24($v1)
  /* 1548E8 80135748 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 1548EC 8013574C A46F0024 */        sh $t7, 0x24($v1)
  /* 1548F0 80135750 8C430074 */        lw $v1, 0x74($v0)
  /* 1548F4 80135754 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 1548F8 80135758 94780024 */       lhu $t8, 0x24($v1)
  /* 1548FC 8013575C 37190001 */       ori $t9, $t8, 1
  /* 154900 80135760 A4790024 */        sh $t9, 0x24($v1)
  /* 154904 80135764 8C480074 */        lw $t0, 0x74($v0)
  /* 154908 80135768 A1000028 */        sb $zero, 0x28($t0)
  /* 15490C 8013576C 8C490074 */        lw $t1, 0x74($v0)
  /* 154910 80135770 A1200029 */        sb $zero, 0x29($t1)
  /* 154914 80135774 8C4A0074 */        lw $t2, 0x74($v0)
  /* 154918 80135778 A140002A */        sb $zero, 0x2a($t2)
  /* 15491C 8013577C 8C4B0074 */        lw $t3, 0x74($v0)
  /* 154920 80135780 A1640028 */        sb $a0, 0x28($t3)
  /* 154924 80135784 8C4C0074 */        lw $t4, 0x74($v0)
  /* 154928 80135788 A1840029 */        sb $a0, 0x29($t4)
  /* 15492C 8013578C 8C4D0074 */        lw $t5, 0x74($v0)
  /* 154930 80135790 A1A4002A */        sb $a0, 0x2a($t5)
  /* 154934 80135794 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 154938 80135798 11C0000F */      beqz $t6, .L801357D8
  /* 15493C 8013579C 00000000 */       nop
  /* 154940 801357A0 0C04D4BF */       jal mnResultsGetColumnX
  /* 154944 801357A4 00002025 */        or $a0, $zero, $zero
  /* 154948 801357A8 46000506 */     mov.s $f20, $f0
  /* 15494C 801357AC 0C04D59C */       jal mnResultsGetKOs
  /* 154950 801357B0 00002025 */        or $a0, $zero, $zero
  /* 154954 801357B4 00408025 */        or $s0, $v0, $zero
  /* 154958 801357B8 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 15495C 801357BC 00002025 */        or $a0, $zero, $zero
  /* 154960 801357C0 4405A000 */      mfc1 $a1, $f20
  /* 154964 801357C4 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154968 801357C8 8FA6004C */        lw $a2, 0x4c($sp)
  /* 15496C 801357CC 02003825 */        or $a3, $s0, $zero
  /* 154970 801357D0 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154974 801357D4 AFA20010 */        sw $v0, 0x10($sp)
  .L801357D8:
  /* 154978 801357D8 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BD4)
  /* 15497C 801357DC 8DEF9BD4 */        lw $t7, %lo(D_ovl31_80139BD4)($t7)
  /* 154980 801357E0 11E0000F */      beqz $t7, .L80135820
  /* 154984 801357E4 00000000 */       nop
  /* 154988 801357E8 0C04D4BF */       jal mnResultsGetColumnX
  /* 15498C 801357EC 24040001 */     addiu $a0, $zero, 1
  /* 154990 801357F0 46000506 */     mov.s $f20, $f0
  /* 154994 801357F4 0C04D59C */       jal mnResultsGetKOs
  /* 154998 801357F8 24040001 */     addiu $a0, $zero, 1
  /* 15499C 801357FC 00408025 */        or $s0, $v0, $zero
  /* 1549A0 80135800 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 1549A4 80135804 24040001 */     addiu $a0, $zero, 1
  /* 1549A8 80135808 4405A000 */      mfc1 $a1, $f20
  /* 1549AC 8013580C 8FA4005C */        lw $a0, 0x5c($sp)
  /* 1549B0 80135810 8FA6004C */        lw $a2, 0x4c($sp)
  /* 1549B4 80135814 02003825 */        or $a3, $s0, $zero
  /* 1549B8 80135818 0C04D2B1 */       jal mnResultsDrawNumber
  /* 1549BC 8013581C AFA20010 */        sw $v0, 0x10($sp)
  .L80135820:
  /* 1549C0 80135820 3C188014 */       lui $t8, %hi(D_ovl31_80139BD8)
  /* 1549C4 80135824 8F189BD8 */        lw $t8, %lo(D_ovl31_80139BD8)($t8)
  /* 1549C8 80135828 1300000F */      beqz $t8, .L80135868
  /* 1549CC 8013582C 00000000 */       nop
  /* 1549D0 80135830 0C04D4BF */       jal mnResultsGetColumnX
  /* 1549D4 80135834 24040002 */     addiu $a0, $zero, 2
  /* 1549D8 80135838 46000506 */     mov.s $f20, $f0
  /* 1549DC 8013583C 0C04D59C */       jal mnResultsGetKOs
  /* 1549E0 80135840 24040002 */     addiu $a0, $zero, 2
  /* 1549E4 80135844 00408025 */        or $s0, $v0, $zero
  /* 1549E8 80135848 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 1549EC 8013584C 24040002 */     addiu $a0, $zero, 2
  /* 1549F0 80135850 4405A000 */      mfc1 $a1, $f20
  /* 1549F4 80135854 8FA4005C */        lw $a0, 0x5c($sp)
  /* 1549F8 80135858 8FA6004C */        lw $a2, 0x4c($sp)
  /* 1549FC 8013585C 02003825 */        or $a3, $s0, $zero
  /* 154A00 80135860 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154A04 80135864 AFA20010 */        sw $v0, 0x10($sp)
  .L80135868:
  /* 154A08 80135868 3C198014 */       lui $t9, %hi(D_ovl31_80139BDC)
  /* 154A0C 8013586C 8F399BDC */        lw $t9, %lo(D_ovl31_80139BDC)($t9)
  /* 154A10 80135870 53200010 */      beql $t9, $zero, .L801358B4
  /* 154A14 80135874 8FBF0044 */        lw $ra, 0x44($sp)
  /* 154A18 80135878 0C04D4BF */       jal mnResultsGetColumnX
  /* 154A1C 8013587C 24040003 */     addiu $a0, $zero, 3
  /* 154A20 80135880 46000506 */     mov.s $f20, $f0
  /* 154A24 80135884 0C04D59C */       jal mnResultsGetKOs
  /* 154A28 80135888 24040003 */     addiu $a0, $zero, 3
  /* 154A2C 8013588C 00408025 */        or $s0, $v0, $zero
  /* 154A30 80135890 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 154A34 80135894 24040003 */     addiu $a0, $zero, 3
  /* 154A38 80135898 4405A000 */      mfc1 $a1, $f20
  /* 154A3C 8013589C 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154A40 801358A0 8FA6004C */        lw $a2, 0x4c($sp)
  /* 154A44 801358A4 02003825 */        or $a3, $s0, $zero
  /* 154A48 801358A8 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154A4C 801358AC AFA20010 */        sw $v0, 0x10($sp)
  /* 154A50 801358B0 8FBF0044 */        lw $ra, 0x44($sp)
  .L801358B4:
  /* 154A54 801358B4 D7B40038 */      ldc1 $f20, 0x38($sp)
  /* 154A58 801358B8 8FB00040 */        lw $s0, 0x40($sp)
  /* 154A5C 801358BC 03E00008 */        jr $ra
  /* 154A60 801358C0 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnResultsGetTKOs
  /* 154A64 801358C4 00047080 */       sll $t6, $a0, 2
  /* 154A68 801358C8 3C038014 */       lui $v1, %hi(gMNResultsTKOs)
  /* 154A6C 801358CC 006E1821 */      addu $v1, $v1, $t6
  /* 154A70 801358D0 8C639B90 */        lw $v1, %lo(gMNResultsTKOs)($v1)
  /* 154A74 801358D4 286103E8 */      slti $at, $v1, 0x3e8
  /* 154A78 801358D8 14200003 */      bnez $at, .L801358E8
  /* 154A7C 801358DC 00601025 */        or $v0, $v1, $zero
  /* 154A80 801358E0 03E00008 */        jr $ra
  /* 154A84 801358E4 240203E7 */     addiu $v0, $zero, 0x3e7

  .L801358E8:
  /* 154A88 801358E8 03E00008 */        jr $ra
  /* 154A8C 801358EC 00000000 */       nop

glabel mnResultsDrawTKOs
  /* 154A90 801358F0 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 154A94 801358F4 3C198014 */       lui $t9, %hi(D_ovl31_8013A048)
  /* 154A98 801358F8 8F39A048 */        lw $t9, %lo(D_ovl31_8013A048)($t9)
  /* 154A9C 801358FC 3C080000 */       lui $t0, %hi(D_NF_00000358)
  /* 154AA0 80135900 AFB00040 */        sw $s0, 0x40($sp)
  /* 154AA4 80135904 25080358 */     addiu $t0, $t0, %lo(D_NF_00000358)
  /* 154AA8 80135908 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 154AAC 8013590C 00808025 */        or $s0, $a0, $zero
  /* 154AB0 80135910 AFBF0044 */        sw $ra, 0x44($sp)
  /* 154AB4 80135914 3C078000 */       lui $a3, 0x8000
  /* 154AB8 80135918 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 154ABC 8013591C 240F001F */     addiu $t7, $zero, 0x1f
  /* 154AC0 80135920 2418FFFF */     addiu $t8, $zero, -1
  /* 154AC4 80135924 240A0001 */     addiu $t2, $zero, 1
  /* 154AC8 80135928 240B0001 */     addiu $t3, $zero, 1
  /* 154ACC 8013592C 03284821 */      addu $t1, $t9, $t0
  /* 154AD0 80135930 F7B40038 */      sdc1 $f20, 0x38($sp)
  /* 154AD4 80135934 AFA90020 */        sw $t1, 0x20($sp)
  /* 154AD8 80135938 AFAB002C */        sw $t3, 0x2c($sp)
  /* 154ADC 8013593C AFAA0024 */        sw $t2, 0x24($sp)
  /* 154AE0 80135940 AFB8001C */        sw $t8, 0x1c($sp)
  /* 154AE4 80135944 AFAF0014 */        sw $t7, 0x14($sp)
  /* 154AE8 80135948 AFAE0010 */        sw $t6, 0x10($sp)
  /* 154AEC 8013594C AFA70018 */        sw $a3, 0x18($sp)
  /* 154AF0 80135950 00002025 */        or $a0, $zero, $zero
  /* 154AF4 80135954 AFA00028 */        sw $zero, 0x28($sp)
  /* 154AF8 80135958 00002825 */        or $a1, $zero, $zero
  /* 154AFC 8013595C 0C033414 */       jal func_ovl0_800CD050
  /* 154B00 80135960 24060016 */     addiu $a2, $zero, 0x16
  /* 154B04 80135964 44903000 */      mtc1 $s0, $f6
  /* 154B08 80135968 AFA2005C */        sw $v0, 0x5c($sp)
  /* 154B0C 8013596C 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 154B10 80135970 46803220 */   cvt.s.w $f8, $f6
  /* 154B14 80135974 44812000 */      mtc1 $at, $f4 # 26.0 to cop1
  /* 154B18 80135978 8C4C0074 */        lw $t4, 0x74($v0)
  /* 154B1C 8013597C 240400FF */     addiu $a0, $zero, 0xff
  /* 154B20 80135980 24010004 */     addiu $at, $zero, 4
  /* 154B24 80135984 E5840058 */      swc1 $f4, 0x58($t4)
  /* 154B28 80135988 E7A80048 */      swc1 $f8, 0x48($sp)
  /* 154B2C 8013598C 8C4D0074 */        lw $t5, 0x74($v0)
  /* 154B30 80135990 C7AA0048 */      lwc1 $f10, 0x48($sp)
  /* 154B34 80135994 E5AA005C */      swc1 $f10, 0x5c($t5)
  /* 154B38 80135998 8C430074 */        lw $v1, 0x74($v0)
  /* 154B3C 8013599C 946E0024 */       lhu $t6, 0x24($v1)
  /* 154B40 801359A0 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 154B44 801359A4 A46F0024 */        sh $t7, 0x24($v1)
  /* 154B48 801359A8 8C430074 */        lw $v1, 0x74($v0)
  /* 154B4C 801359AC 3C0E8014 */       lui $t6, %hi(gMNResultsGameRule)
  /* 154B50 801359B0 3C0F8014 */       lui $t7, %hi(D_ovl31_8013A05C)
  /* 154B54 801359B4 94780024 */       lhu $t8, 0x24($v1)
  /* 154B58 801359B8 37190001 */       ori $t9, $t8, 1
  /* 154B5C 801359BC A4790024 */        sh $t9, 0x24($v1)
  /* 154B60 801359C0 8C480074 */        lw $t0, 0x74($v0)
  /* 154B64 801359C4 3C180000 */       lui $t8, %hi(D_NF_00000710)
  /* 154B68 801359C8 A1000028 */        sb $zero, 0x28($t0)
  /* 154B6C 801359CC 8C490074 */        lw $t1, 0x74($v0)
  /* 154B70 801359D0 A1200029 */        sb $zero, 0x29($t1)
  /* 154B74 801359D4 8C4A0074 */        lw $t2, 0x74($v0)
  /* 154B78 801359D8 A140002A */        sb $zero, 0x2a($t2)
  /* 154B7C 801359DC 8C4B0074 */        lw $t3, 0x74($v0)
  /* 154B80 801359E0 A1640028 */        sb $a0, 0x28($t3)
  /* 154B84 801359E4 8C4C0074 */        lw $t4, 0x74($v0)
  /* 154B88 801359E8 A1840029 */        sb $a0, 0x29($t4)
  /* 154B8C 801359EC 8C4D0074 */        lw $t5, 0x74($v0)
  /* 154B90 801359F0 A1A4002A */        sb $a0, 0x2a($t5)
  /* 154B94 801359F4 8DCE9C10 */        lw $t6, %lo(gMNResultsGameRule)($t6)
  /* 154B98 801359F8 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154B9C 801359FC 11C10011 */       beq $t6, $at, .L80135A44
  /* 154BA0 80135A00 00000000 */       nop
  /* 154BA4 80135A04 8DEFA05C */        lw $t7, %lo(D_ovl31_8013A05C)($t7)
  /* 154BA8 80135A08 27180710 */     addiu $t8, $t8, %lo(D_NF_00000710)
  /* 154BAC 80135A0C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 154BB0 80135A10 01F82821 */      addu $a1, $t7, $t8
  /* 154BB4 80135A14 26190003 */     addiu $t9, $s0, 3
  /* 154BB8 80135A18 44999000 */      mtc1 $t9, $f18
  /* 154BBC 80135A1C 94480024 */       lhu $t0, 0x24($v0)
  /* 154BC0 80135A20 3C0142B4 */       lui $at, (0x42B40000 >> 16) # 90.0
  /* 154BC4 80135A24 46809120 */   cvt.s.w $f4, $f18
  /* 154BC8 80135A28 44818000 */      mtc1 $at, $f16 # 90.0 to cop1
  /* 154BCC 80135A2C 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 154BD0 80135A30 A44A0024 */        sh $t2, 0x24($v0)
  /* 154BD4 80135A34 354B0001 */       ori $t3, $t2, 1
  /* 154BD8 80135A38 A44B0024 */        sh $t3, 0x24($v0)
  /* 154BDC 80135A3C E444005C */      swc1 $f4, 0x5c($v0)
  /* 154BE0 80135A40 E4500058 */      swc1 $f16, 0x58($v0)
  .L80135A44:
  /* 154BE4 80135A44 3C0C8014 */       lui $t4, %hi(gMNResultsIsPresent)
  /* 154BE8 80135A48 8D8C9BD0 */        lw $t4, %lo(gMNResultsIsPresent)($t4)
  /* 154BEC 80135A4C 1180000F */      beqz $t4, .L80135A8C
  /* 154BF0 80135A50 00000000 */       nop
  /* 154BF4 80135A54 0C04D4BF */       jal mnResultsGetColumnX
  /* 154BF8 80135A58 00002025 */        or $a0, $zero, $zero
  /* 154BFC 80135A5C 46000506 */     mov.s $f20, $f0
  /* 154C00 80135A60 0C04D631 */       jal mnResultsGetTKOs
  /* 154C04 80135A64 00002025 */        or $a0, $zero, $zero
  /* 154C08 80135A68 00408025 */        or $s0, $v0, $zero
  /* 154C0C 80135A6C 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 154C10 80135A70 00002025 */        or $a0, $zero, $zero
  /* 154C14 80135A74 4405A000 */      mfc1 $a1, $f20
  /* 154C18 80135A78 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154C1C 80135A7C 8FA60048 */        lw $a2, 0x48($sp)
  /* 154C20 80135A80 02003825 */        or $a3, $s0, $zero
  /* 154C24 80135A84 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154C28 80135A88 AFA20010 */        sw $v0, 0x10($sp)
  .L80135A8C:
  /* 154C2C 80135A8C 3C0D8014 */       lui $t5, %hi(D_ovl31_80139BD4)
  /* 154C30 80135A90 8DAD9BD4 */        lw $t5, %lo(D_ovl31_80139BD4)($t5)
  /* 154C34 80135A94 11A0000F */      beqz $t5, .L80135AD4
  /* 154C38 80135A98 00000000 */       nop
  /* 154C3C 80135A9C 0C04D4BF */       jal mnResultsGetColumnX
  /* 154C40 80135AA0 24040001 */     addiu $a0, $zero, 1
  /* 154C44 80135AA4 46000506 */     mov.s $f20, $f0
  /* 154C48 80135AA8 0C04D631 */       jal mnResultsGetTKOs
  /* 154C4C 80135AAC 24040001 */     addiu $a0, $zero, 1
  /* 154C50 80135AB0 00408025 */        or $s0, $v0, $zero
  /* 154C54 80135AB4 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 154C58 80135AB8 24040001 */     addiu $a0, $zero, 1
  /* 154C5C 80135ABC 4405A000 */      mfc1 $a1, $f20
  /* 154C60 80135AC0 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154C64 80135AC4 8FA60048 */        lw $a2, 0x48($sp)
  /* 154C68 80135AC8 02003825 */        or $a3, $s0, $zero
  /* 154C6C 80135ACC 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154C70 80135AD0 AFA20010 */        sw $v0, 0x10($sp)
  .L80135AD4:
  /* 154C74 80135AD4 3C0E8014 */       lui $t6, %hi(D_ovl31_80139BD8)
  /* 154C78 80135AD8 8DCE9BD8 */        lw $t6, %lo(D_ovl31_80139BD8)($t6)
  /* 154C7C 80135ADC 11C0000F */      beqz $t6, .L80135B1C
  /* 154C80 80135AE0 00000000 */       nop
  /* 154C84 80135AE4 0C04D4BF */       jal mnResultsGetColumnX
  /* 154C88 80135AE8 24040002 */     addiu $a0, $zero, 2
  /* 154C8C 80135AEC 46000506 */     mov.s $f20, $f0
  /* 154C90 80135AF0 0C04D631 */       jal mnResultsGetTKOs
  /* 154C94 80135AF4 24040002 */     addiu $a0, $zero, 2
  /* 154C98 80135AF8 00408025 */        or $s0, $v0, $zero
  /* 154C9C 80135AFC 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 154CA0 80135B00 24040002 */     addiu $a0, $zero, 2
  /* 154CA4 80135B04 4405A000 */      mfc1 $a1, $f20
  /* 154CA8 80135B08 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154CAC 80135B0C 8FA60048 */        lw $a2, 0x48($sp)
  /* 154CB0 80135B10 02003825 */        or $a3, $s0, $zero
  /* 154CB4 80135B14 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154CB8 80135B18 AFA20010 */        sw $v0, 0x10($sp)
  .L80135B1C:
  /* 154CBC 80135B1C 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BDC)
  /* 154CC0 80135B20 8DEF9BDC */        lw $t7, %lo(D_ovl31_80139BDC)($t7)
  /* 154CC4 80135B24 51E00010 */      beql $t7, $zero, .L80135B68
  /* 154CC8 80135B28 8FBF0044 */        lw $ra, 0x44($sp)
  /* 154CCC 80135B2C 0C04D4BF */       jal mnResultsGetColumnX
  /* 154CD0 80135B30 24040003 */     addiu $a0, $zero, 3
  /* 154CD4 80135B34 46000506 */     mov.s $f20, $f0
  /* 154CD8 80135B38 0C04D631 */       jal mnResultsGetTKOs
  /* 154CDC 80135B3C 24040003 */     addiu $a0, $zero, 3
  /* 154CE0 80135B40 00408025 */        or $s0, $v0, $zero
  /* 154CE4 80135B44 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 154CE8 80135B48 24040003 */     addiu $a0, $zero, 3
  /* 154CEC 80135B4C 4405A000 */      mfc1 $a1, $f20
  /* 154CF0 80135B50 8FA4005C */        lw $a0, 0x5c($sp)
  /* 154CF4 80135B54 8FA60048 */        lw $a2, 0x48($sp)
  /* 154CF8 80135B58 02003825 */        or $a3, $s0, $zero
  /* 154CFC 80135B5C 0C04D2B1 */       jal mnResultsDrawNumber
  /* 154D00 80135B60 AFA20010 */        sw $v0, 0x10($sp)
  /* 154D04 80135B64 8FBF0044 */        lw $ra, 0x44($sp)
  .L80135B68:
  /* 154D08 80135B68 D7B40038 */      ldc1 $f20, 0x38($sp)
  /* 154D0C 80135B6C 8FB00040 */        lw $s0, 0x40($sp)
  /* 154D10 80135B70 03E00008 */        jr $ra
  /* 154D14 80135B74 27BD0060 */     addiu $sp, $sp, 0x60

glabel mnResultsRenderHorizontalLine
  /* 154D18 80135B78 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 154D1C 80135B7C 3C098014 */       lui $t1, %hi(gMNResultsHorizontalLineWidth)
  /* 154D20 80135B80 25299B7C */     addiu $t1, $t1, %lo(gMNResultsHorizontalLineWidth)
  /* 154D24 80135B84 AFBF0014 */        sw $ra, 0x14($sp)
  /* 154D28 80135B88 8C8E0084 */        lw $t6, 0x84($a0)
  /* 154D2C 80135B8C 8D2F0000 */        lw $t7, ($t1) # gMNResultsHorizontalLineWidth + 0
  /* 154D30 80135B90 3C058004 */       lui $a1, %hi(gDisplayListHead)
  /* 154D34 80135B94 448E2000 */      mtc1 $t6, $f4
  /* 154D38 80135B98 25F8000A */     addiu $t8, $t7, 0xa
  /* 154D3C 80135B9C 2B0100BF */      slti $at, $t8, 0xbf
  /* 154D40 80135BA0 AD380000 */        sw $t8, ($t1) # gMNResultsHorizontalLineWidth + 0
  /* 154D44 80135BA4 14200003 */      bnez $at, .L80135BB4
  /* 154D48 80135BA8 46802020 */   cvt.s.w $f0, $f4
  /* 154D4C 80135BAC 240B00BE */     addiu $t3, $zero, 0xbe
  /* 154D50 80135BB0 AD2B0000 */        sw $t3, ($t1) # gMNResultsHorizontalLineWidth + 0
  .L80135BB4:
  /* 154D54 80135BB4 24A565B0 */     addiu $a1, $a1, %lo(gDisplayListHead)
  /* 154D58 80135BB8 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154D5C 80135BBC 3C0DE700 */       lui $t5, 0xe700
  /* 154D60 80135BC0 3C0FE300 */       lui $t7, (0xE3000A01 >> 16) # 3808430593
  /* 154D64 80135BC4 246C0008 */     addiu $t4, $v1, 8
  /* 154D68 80135BC8 ACAC0000 */        sw $t4, ($a1) # gDisplayListHead + 0
  /* 154D6C 80135BCC AC6D0000 */        sw $t5, ($v1)
  /* 154D70 80135BD0 AC600004 */        sw $zero, 4($v1)
  /* 154D74 80135BD4 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154D78 80135BD8 35EF0A01 */       ori $t7, $t7, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 154D7C 80135BDC 3C180030 */       lui $t8, 0x30
  /* 154D80 80135BE0 246E0008 */     addiu $t6, $v1, 8
  /* 154D84 80135BE4 ACAE0000 */        sw $t6, ($a1) # gDisplayListHead + 0
  /* 154D88 80135BE8 AC6F0000 */        sw $t7, ($v1)
  /* 154D8C 80135BEC AC780004 */        sw $t8, 4($v1)
  /* 154D90 80135BF0 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154D94 80135BF4 3C0BE200 */       lui $t3, (0xE200001C >> 16) # 3791650844
  /* 154D98 80135BF8 356B001C */       ori $t3, $t3, (0xE200001C & 0xFFFF) # 3791650844
  /* 154D9C 80135BFC 24790008 */     addiu $t9, $v1, 8
  /* 154DA0 80135C00 ACB90000 */        sw $t9, ($a1) # gDisplayListHead + 0
  /* 154DA4 80135C04 AC6B0000 */        sw $t3, ($v1)
  /* 154DA8 80135C08 AC600004 */        sw $zero, 4($v1)
  /* 154DAC 80135C0C 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154DB0 80135C10 3C0DF700 */       lui $t5, 0xf700
  /* 154DB4 80135C14 2404FFFF */     addiu $a0, $zero, -1
  /* 154DB8 80135C18 246C0008 */     addiu $t4, $v1, 8
  /* 154DBC 80135C1C ACAC0000 */        sw $t4, ($a1) # gDisplayListHead + 0
  /* 154DC0 80135C20 AC6D0000 */        sw $t5, ($v1)
  /* 154DC4 80135C24 E7A0002C */      swc1 $f0, 0x2c($sp)
  /* 154DC8 80135C28 0C001B5C */       jal gsGetFillColor
  /* 154DCC 80135C2C AFA3001C */        sw $v1, 0x1c($sp)
  /* 154DD0 80135C30 444FF800 */      cfc1 $t7, $31
  /* 154DD4 80135C34 24060001 */     addiu $a2, $zero, 1
  /* 154DD8 80135C38 44C6F800 */      ctc1 $a2, $31
  /* 154DDC 80135C3C C7A0002C */      lwc1 $f0, 0x2c($sp)
  /* 154DE0 80135C40 8FAA001C */        lw $t2, 0x1c($sp)
  /* 154DE4 80135C44 3C058004 */       lui $a1, %hi(gDisplayListHead)
  /* 154DE8 80135C48 460001A4 */   cvt.w.s $f6, $f0
  /* 154DEC 80135C4C 24A565B0 */     addiu $a1, $a1, %lo(gDisplayListHead)
  /* 154DF0 80135C50 AD420004 */        sw $v0, 4($t2)
  /* 154DF4 80135C54 8CA40000 */        lw $a0, ($a1) # gDisplayListHead + 0
  /* 154DF8 80135C58 4446F800 */      cfc1 $a2, $31
  /* 154DFC 80135C5C 3C098014 */       lui $t1, %hi(gMNResultsHorizontalLineWidth)
  /* 154E00 80135C60 248E0008 */     addiu $t6, $a0, 8
  /* 154E04 80135C64 30C60078 */      andi $a2, $a2, 0x78
  /* 154E08 80135C68 25299B7C */     addiu $t1, $t1, %lo(gMNResultsHorizontalLineWidth)
  /* 154E0C 80135C6C 10C00013 */      beqz $a2, .L80135CBC
  /* 154E10 80135C70 ACAE0000 */        sw $t6, ($a1) # gDisplayListHead + 0
  /* 154E14 80135C74 3C014F00 */       lui $at, (0x4F000000 >> 16) # 2147483600.0
  /* 154E18 80135C78 44813000 */      mtc1 $at, $f6 # 2147483600.0 to cop1
  /* 154E1C 80135C7C 24060001 */     addiu $a2, $zero, 1
  /* 154E20 80135C80 46060181 */     sub.s $f6, $f0, $f6
  /* 154E24 80135C84 44C6F800 */      ctc1 $a2, $31
  /* 154E28 80135C88 00000000 */       nop
  /* 154E2C 80135C8C 460031A4 */   cvt.w.s $f6, $f6
  /* 154E30 80135C90 4446F800 */      cfc1 $a2, $31
  /* 154E34 80135C94 00000000 */       nop
  /* 154E38 80135C98 30C60078 */      andi $a2, $a2, 0x78
  /* 154E3C 80135C9C 14C00005 */      bnez $a2, .L80135CB4
  /* 154E40 80135CA0 00000000 */       nop
  /* 154E44 80135CA4 44063000 */      mfc1 $a2, $f6
  /* 154E48 80135CA8 3C018000 */       lui $at, 0x8000
  /* 154E4C 80135CAC 10000007 */         b .L80135CCC
  /* 154E50 80135CB0 00C13025 */        or $a2, $a2, $at
  .L80135CB4:
  /* 154E54 80135CB4 10000005 */         b .L80135CCC
  /* 154E58 80135CB8 2406FFFF */     addiu $a2, $zero, -1
  .L80135CBC:
  /* 154E5C 80135CBC 44063000 */      mfc1 $a2, $f6
  /* 154E60 80135CC0 00000000 */       nop
  /* 154E64 80135CC4 04C0FFFB */      bltz $a2, .L80135CB4
  /* 154E68 80135CC8 00000000 */       nop
  .L80135CCC:
  /* 154E6C 80135CCC 8D380000 */        lw $t8, ($t1) # gMNResultsHorizontalLineWidth + 0
  /* 154E70 80135CD0 3C01F600 */       lui $at, 0xf600
  /* 154E74 80135CD4 30C603FF */      andi $a2, $a2, 0x3ff
  /* 154E78 80135CD8 27190057 */     addiu $t9, $t8, 0x57
  /* 154E7C 80135CDC 332B03FF */      andi $t3, $t9, 0x3ff
  /* 154E80 80135CE0 000B6380 */       sll $t4, $t3, 0xe
  /* 154E84 80135CE4 01816825 */        or $t5, $t4, $at
  /* 154E88 80135CE8 3C010015 */       lui $at, (0x15C000 >> 16) # 1425408
  /* 154E8C 80135CEC 00063080 */       sll $a2, $a2, 2
  /* 154E90 80135CF0 3421C000 */       ori $at, $at, (0x15C000 & 0xFFFF) # 1425408
  /* 154E94 80135CF4 44CFF800 */      ctc1 $t7, $31
  /* 154E98 80135CF8 00C17825 */        or $t7, $a2, $at
  /* 154E9C 80135CFC 01A67025 */        or $t6, $t5, $a2
  /* 154EA0 80135D00 AC8E0000 */        sw $t6, ($a0)
  /* 154EA4 80135D04 AC8F0004 */        sw $t7, 4($a0)
  /* 154EA8 80135D08 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154EAC 80135D0C 3C19E700 */       lui $t9, 0xe700
  /* 154EB0 80135D10 3C0D0055 */       lui $t5, (0x552078 >> 16) # 5578872
  /* 154EB4 80135D14 24780008 */     addiu $t8, $v1, 8
  /* 154EB8 80135D18 ACB80000 */        sw $t8, ($a1) # gDisplayListHead + 0
  /* 154EBC 80135D1C AC600004 */        sw $zero, 4($v1)
  /* 154EC0 80135D20 AC790000 */        sw $t9, ($v1)
  /* 154EC4 80135D24 8CA30000 */        lw $v1, ($a1) # gDisplayListHead + 0
  /* 154EC8 80135D28 3C0CE200 */       lui $t4, (0xE200001C >> 16) # 3791650844
  /* 154ECC 80135D2C 358C001C */       ori $t4, $t4, (0xE200001C & 0xFFFF) # 3791650844
  /* 154ED0 80135D30 246B0008 */     addiu $t3, $v1, 8
  /* 154ED4 80135D34 ACAB0000 */        sw $t3, ($a1) # gDisplayListHead + 0
  /* 154ED8 80135D38 35AD2078 */       ori $t5, $t5, (0x552078 & 0xFFFF) # 5578872
  /* 154EDC 80135D3C AC6D0004 */        sw $t5, 4($v1)
  /* 154EE0 80135D40 0C0333AB */       jal func_ovl0_800CCEAC
  /* 154EE4 80135D44 AC6C0000 */        sw $t4, ($v1)
  /* 154EE8 80135D48 8FBF0014 */        lw $ra, 0x14($sp)
  /* 154EEC 80135D4C 27BD0030 */     addiu $sp, $sp, 0x30
  /* 154EF0 80135D50 03E00008 */        jr $ra
  /* 154EF4 80135D54 00000000 */       nop

glabel mnResultsCreateHorizontalLine
  /* 154EF8 80135D58 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 154EFC 80135D5C AFBF001C */        sw $ra, 0x1c($sp)
  /* 154F00 80135D60 AFA40028 */        sw $a0, 0x28($sp)
  /* 154F04 80135D64 00002025 */        or $a0, $zero, $zero
  /* 154F08 80135D68 00002825 */        or $a1, $zero, $zero
  /* 154F0C 80135D6C 24060016 */     addiu $a2, $zero, 0x16
  /* 154F10 80135D70 0C00265A */       jal omMakeGObjSPAfter
  /* 154F14 80135D74 3C078000 */       lui $a3, 0x8000
  /* 154F18 80135D78 3C058013 */       lui $a1, %hi(mnResultsRenderHorizontalLine)
  /* 154F1C 80135D7C 240EFFFF */     addiu $t6, $zero, -1
  /* 154F20 80135D80 AFA20024 */        sw $v0, 0x24($sp)
  /* 154F24 80135D84 AFAE0010 */        sw $t6, 0x10($sp)
  /* 154F28 80135D88 24A55B78 */     addiu $a1, $a1, %lo(mnResultsRenderHorizontalLine)
  /* 154F2C 80135D8C 00402025 */        or $a0, $v0, $zero
  /* 154F30 80135D90 2406001F */     addiu $a2, $zero, 0x1f
  /* 154F34 80135D94 0C00277D */       jal omAddGObjRenderProc
  /* 154F38 80135D98 3C078000 */       lui $a3, 0x8000
  /* 154F3C 80135D9C 8FAF0028 */        lw $t7, 0x28($sp)
  /* 154F40 80135DA0 8FB80024 */        lw $t8, 0x24($sp)
  /* 154F44 80135DA4 AF0F0084 */        sw $t7, 0x84($t8)
  /* 154F48 80135DA8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 154F4C 80135DAC 27BD0028 */     addiu $sp, $sp, 0x28
  /* 154F50 80135DB0 03E00008 */        jr $ra
  /* 154F54 80135DB4 00000000 */       nop

glabel mnResultsGetPoints
  /* 154F58 80135DB8 00047080 */       sll $t6, $a0, 2
  /* 154F5C 80135DBC 3C028014 */       lui $v0, %hi(gMNResultsPoints)
  /* 154F60 80135DC0 004E1021 */      addu $v0, $v0, $t6
  /* 154F64 80135DC4 03E00008 */        jr $ra
  /* 154F68 80135DC8 8C429BA0 */        lw $v0, %lo(gMNResultsPoints)($v0)

glabel mnResultsDrawPointsRow
  /* 154F6C 80135DCC 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 154F70 80135DD0 3C198014 */       lui $t9, %hi(D_ovl31_8013A048)
  /* 154F74 80135DD4 8F39A048 */        lw $t9, %lo(D_ovl31_8013A048)($t9)
  /* 154F78 80135DD8 3C080000 */       lui $t0, %hi(D_NF_000010D8)
  /* 154F7C 80135DDC 250810D8 */     addiu $t0, $t0, %lo(D_NF_000010D8)
  /* 154F80 80135DE0 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 154F84 80135DE4 AFBF0044 */        sw $ra, 0x44($sp)
  /* 154F88 80135DE8 3C078000 */       lui $a3, 0x8000
  /* 154F8C 80135DEC 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 154F90 80135DF0 240F001F */     addiu $t7, $zero, 0x1f
  /* 154F94 80135DF4 2418FFFF */     addiu $t8, $zero, -1
  /* 154F98 80135DF8 240A0001 */     addiu $t2, $zero, 1
  /* 154F9C 80135DFC 240B0001 */     addiu $t3, $zero, 1
  /* 154FA0 80135E00 03284821 */      addu $t1, $t9, $t0
  /* 154FA4 80135E04 AFB00040 */        sw $s0, 0x40($sp)
  /* 154FA8 80135E08 F7B40038 */      sdc1 $f20, 0x38($sp)
  /* 154FAC 80135E0C AFA90020 */        sw $t1, 0x20($sp)
  /* 154FB0 80135E10 AFAB002C */        sw $t3, 0x2c($sp)
  /* 154FB4 80135E14 AFAA0024 */        sw $t2, 0x24($sp)
  /* 154FB8 80135E18 AFB8001C */        sw $t8, 0x1c($sp)
  /* 154FBC 80135E1C AFAF0014 */        sw $t7, 0x14($sp)
  /* 154FC0 80135E20 AFAE0010 */        sw $t6, 0x10($sp)
  /* 154FC4 80135E24 AFA70018 */        sw $a3, 0x18($sp)
  /* 154FC8 80135E28 AFA00028 */        sw $zero, 0x28($sp)
  /* 154FCC 80135E2C 00002025 */        or $a0, $zero, $zero
  /* 154FD0 80135E30 00002825 */        or $a1, $zero, $zero
  /* 154FD4 80135E34 0C033414 */       jal func_ovl0_800CD050
  /* 154FD8 80135E38 24060016 */     addiu $a2, $zero, 0x16
  /* 154FDC 80135E3C AFA2004C */        sw $v0, 0x4c($sp)
  /* 154FE0 80135E40 3C0141D0 */       lui $at, (0x41D00000 >> 16) # 26.0
  /* 154FE4 80135E44 44812000 */      mtc1 $at, $f4 # 26.0 to cop1
  /* 154FE8 80135E48 8C4C0074 */        lw $t4, 0x74($v0)
  /* 154FEC 80135E4C 3C0142D0 */       lui $at, (0x42D00000 >> 16) # 104.0
  /* 154FF0 80135E50 44813000 */      mtc1 $at, $f6 # 104.0 to cop1
  /* 154FF4 80135E54 E5840058 */      swc1 $f4, 0x58($t4)
  /* 154FF8 80135E58 8C4D0074 */        lw $t5, 0x74($v0)
  /* 154FFC 80135E5C 240400FF */     addiu $a0, $zero, 0xff
  /* 155000 80135E60 E5A6005C */      swc1 $f6, 0x5c($t5)
  /* 155004 80135E64 8C430074 */        lw $v1, 0x74($v0)
  /* 155008 80135E68 946E0024 */       lhu $t6, 0x24($v1)
  /* 15500C 80135E6C 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 155010 80135E70 A46F0024 */        sh $t7, 0x24($v1)
  /* 155014 80135E74 8C430074 */        lw $v1, 0x74($v0)
  /* 155018 80135E78 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 15501C 80135E7C 94780024 */       lhu $t8, 0x24($v1)
  /* 155020 80135E80 37190001 */       ori $t9, $t8, 1
  /* 155024 80135E84 A4790024 */        sh $t9, 0x24($v1)
  /* 155028 80135E88 8C480074 */        lw $t0, 0x74($v0)
  /* 15502C 80135E8C A1000028 */        sb $zero, 0x28($t0)
  /* 155030 80135E90 8C490074 */        lw $t1, 0x74($v0)
  /* 155034 80135E94 A1200029 */        sb $zero, 0x29($t1)
  /* 155038 80135E98 8C4A0074 */        lw $t2, 0x74($v0)
  /* 15503C 80135E9C A140002A */        sb $zero, 0x2a($t2)
  /* 155040 80135EA0 8C4B0074 */        lw $t3, 0x74($v0)
  /* 155044 80135EA4 A1640028 */        sb $a0, 0x28($t3)
  /* 155048 80135EA8 8C4C0074 */        lw $t4, 0x74($v0)
  /* 15504C 80135EAC A1840029 */        sb $a0, 0x29($t4)
  /* 155050 80135EB0 8C4D0074 */        lw $t5, 0x74($v0)
  /* 155054 80135EB4 A1A4002A */        sb $a0, 0x2a($t5)
  /* 155058 80135EB8 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 15505C 80135EBC 11C0000F */      beqz $t6, .L80135EFC
  /* 155060 80135EC0 00000000 */       nop
  /* 155064 80135EC4 0C04D4BF */       jal mnResultsGetColumnX
  /* 155068 80135EC8 00002025 */        or $a0, $zero, $zero
  /* 15506C 80135ECC 46000506 */     mov.s $f20, $f0
  /* 155070 80135ED0 0C04D76E */       jal mnResultsGetPoints
  /* 155074 80135ED4 00002025 */        or $a0, $zero, $zero
  /* 155078 80135ED8 00408025 */        or $s0, $v0, $zero
  /* 15507C 80135EDC 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 155080 80135EE0 00002025 */        or $a0, $zero, $zero
  /* 155084 80135EE4 4405A000 */      mfc1 $a1, $f20
  /* 155088 80135EE8 8FA4004C */        lw $a0, 0x4c($sp)
  /* 15508C 80135EEC 3C0642D0 */       lui $a2, 0x42d0
  /* 155090 80135EF0 02003825 */        or $a3, $s0, $zero
  /* 155094 80135EF4 0C04D2B1 */       jal mnResultsDrawNumber
  /* 155098 80135EF8 AFA20010 */        sw $v0, 0x10($sp)
  .L80135EFC:
  /* 15509C 80135EFC 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BD4)
  /* 1550A0 80135F00 8DEF9BD4 */        lw $t7, %lo(D_ovl31_80139BD4)($t7)
  /* 1550A4 80135F04 11E0000F */      beqz $t7, .L80135F44
  /* 1550A8 80135F08 00000000 */       nop
  /* 1550AC 80135F0C 0C04D4BF */       jal mnResultsGetColumnX
  /* 1550B0 80135F10 24040001 */     addiu $a0, $zero, 1
  /* 1550B4 80135F14 46000506 */     mov.s $f20, $f0
  /* 1550B8 80135F18 0C04D76E */       jal mnResultsGetPoints
  /* 1550BC 80135F1C 24040001 */     addiu $a0, $zero, 1
  /* 1550C0 80135F20 00408025 */        or $s0, $v0, $zero
  /* 1550C4 80135F24 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 1550C8 80135F28 24040001 */     addiu $a0, $zero, 1
  /* 1550CC 80135F2C 4405A000 */      mfc1 $a1, $f20
  /* 1550D0 80135F30 8FA4004C */        lw $a0, 0x4c($sp)
  /* 1550D4 80135F34 3C0642D0 */       lui $a2, 0x42d0
  /* 1550D8 80135F38 02003825 */        or $a3, $s0, $zero
  /* 1550DC 80135F3C 0C04D2B1 */       jal mnResultsDrawNumber
  /* 1550E0 80135F40 AFA20010 */        sw $v0, 0x10($sp)
  .L80135F44:
  /* 1550E4 80135F44 3C188014 */       lui $t8, %hi(D_ovl31_80139BD8)
  /* 1550E8 80135F48 8F189BD8 */        lw $t8, %lo(D_ovl31_80139BD8)($t8)
  /* 1550EC 80135F4C 1300000F */      beqz $t8, .L80135F8C
  /* 1550F0 80135F50 00000000 */       nop
  /* 1550F4 80135F54 0C04D4BF */       jal mnResultsGetColumnX
  /* 1550F8 80135F58 24040002 */     addiu $a0, $zero, 2
  /* 1550FC 80135F5C 46000506 */     mov.s $f20, $f0
  /* 155100 80135F60 0C04D76E */       jal mnResultsGetPoints
  /* 155104 80135F64 24040002 */     addiu $a0, $zero, 2
  /* 155108 80135F68 00408025 */        or $s0, $v0, $zero
  /* 15510C 80135F6C 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 155110 80135F70 24040002 */     addiu $a0, $zero, 2
  /* 155114 80135F74 4405A000 */      mfc1 $a1, $f20
  /* 155118 80135F78 8FA4004C */        lw $a0, 0x4c($sp)
  /* 15511C 80135F7C 3C0642D0 */       lui $a2, 0x42d0
  /* 155120 80135F80 02003825 */        or $a3, $s0, $zero
  /* 155124 80135F84 0C04D2B1 */       jal mnResultsDrawNumber
  /* 155128 80135F88 AFA20010 */        sw $v0, 0x10($sp)
  .L80135F8C:
  /* 15512C 80135F8C 3C198014 */       lui $t9, %hi(D_ovl31_80139BDC)
  /* 155130 80135F90 8F399BDC */        lw $t9, %lo(D_ovl31_80139BDC)($t9)
  /* 155134 80135F94 53200010 */      beql $t9, $zero, .L80135FD8
  /* 155138 80135F98 8FBF0044 */        lw $ra, 0x44($sp)
  /* 15513C 80135F9C 0C04D4BF */       jal mnResultsGetColumnX
  /* 155140 80135FA0 24040003 */     addiu $a0, $zero, 3
  /* 155144 80135FA4 46000506 */     mov.s $f20, $f0
  /* 155148 80135FA8 0C04D76E */       jal mnResultsGetPoints
  /* 15514C 80135FAC 24040003 */     addiu $a0, $zero, 3
  /* 155150 80135FB0 00408025 */        or $s0, $v0, $zero
  /* 155154 80135FB4 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 155158 80135FB8 24040003 */     addiu $a0, $zero, 3
  /* 15515C 80135FBC 4405A000 */      mfc1 $a1, $f20
  /* 155160 80135FC0 8FA4004C */        lw $a0, 0x4c($sp)
  /* 155164 80135FC4 3C0642D0 */       lui $a2, 0x42d0
  /* 155168 80135FC8 02003825 */        or $a3, $s0, $zero
  /* 15516C 80135FCC 0C04D2B1 */       jal mnResultsDrawNumber
  /* 155170 80135FD0 AFA20010 */        sw $v0, 0x10($sp)
  /* 155174 80135FD4 8FBF0044 */        lw $ra, 0x44($sp)
  .L80135FD8:
  /* 155178 80135FD8 D7B40038 */      ldc1 $f20, 0x38($sp)
  /* 15517C 80135FDC 8FB00040 */        lw $s0, 0x40($sp)
  /* 155180 80135FE0 03E00008 */        jr $ra
  /* 155184 80135FE4 27BD0050 */     addiu $sp, $sp, 0x50

  /* 155188 80135FE8 03E00008 */        jr $ra
  /* 15518C 80135FEC 00000000 */       nop

glabel mnResultsPositionPlaceNumber
  /* 155190 80135FF0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 155194 80135FF4 AFA70024 */        sw $a3, 0x24($sp)
  /* 155198 80135FF8 24010001 */     addiu $at, $zero, 1
  /* 15519C 80135FFC 00803825 */        or $a3, $a0, $zero
  /* 1551A0 80136000 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1551A4 80136004 14C1000F */       bne $a2, $at, .L80136044
  /* 1551A8 80136008 AFA40018 */        sw $a0, 0x18($sp)
  /* 1551AC 8013600C 8C8E0054 */        lw $t6, 0x54($a0)
  /* 1551B0 80136010 00A02025 */        or $a0, $a1, $zero
  /* 1551B4 80136014 51C0000C */      beql $t6, $zero, .L80136048
  /* 1551B8 80136018 00A02025 */        or $a0, $a1, $zero
  /* 1551BC 8013601C 0C04D4BF */       jal mnResultsGetColumnX
  /* 1551C0 80136020 AFA70018 */        sw $a3, 0x18($sp)
  /* 1551C4 80136024 3C014000 */       lui $at, (0x40000000 >> 16) # 2.0
  /* 1551C8 80136028 44812000 */      mtc1 $at, $f4 # 2.0 to cop1
  /* 1551CC 8013602C 8FA70018 */        lw $a3, 0x18($sp)
  /* 1551D0 80136030 46040180 */     add.s $f6, $f0, $f4
  /* 1551D4 80136034 E4E60058 */      swc1 $f6, 0x58($a3)
  /* 1551D8 80136038 C7A80024 */      lwc1 $f8, 0x24($sp)
  /* 1551DC 8013603C 1000000B */         b .L8013606C
  /* 1551E0 80136040 E4E8005C */      swc1 $f8, 0x5c($a3)
  .L80136044:
  /* 1551E4 80136044 00A02025 */        or $a0, $a1, $zero
  .L80136048:
  /* 1551E8 80136048 0C04D4BF */       jal mnResultsGetColumnX
  /* 1551EC 8013604C AFA70018 */        sw $a3, 0x18($sp)
  /* 1551F0 80136050 3C014170 */       lui $at, (0x41700000 >> 16) # 15.0
  /* 1551F4 80136054 44815000 */      mtc1 $at, $f10 # 15.0 to cop1
  /* 1551F8 80136058 8FA70018 */        lw $a3, 0x18($sp)
  /* 1551FC 8013605C 460A0400 */     add.s $f16, $f0, $f10
  /* 155200 80136060 E4F00058 */      swc1 $f16, 0x58($a3)
  /* 155204 80136064 C7B20024 */      lwc1 $f18, 0x24($sp)
  /* 155208 80136068 E4F2005C */      swc1 $f18, 0x5c($a3)
  .L8013606C:
  /* 15520C 8013606C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 155210 80136070 27BD0018 */     addiu $sp, $sp, 0x18
  /* 155214 80136074 03E00008 */        jr $ra
  /* 155218 80136078 00000000 */       nop

glabel mnResultsGetPlaceForDisplay
  /* 15521C 8013607C 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 155220 80136080 AFBF0014 */        sw $ra, 0x14($sp)
  /* 155224 80136084 0C04C817 */       jal mnResultsGetPresentCount
  /* 155228 80136088 AFA40018 */        sw $a0, 0x18($sp)
  /* 15522C 8013608C 24010004 */     addiu $at, $zero, 4
  /* 155230 80136090 14410011 */       bne $v0, $at, .L801360D8
  /* 155234 80136094 3C0E8014 */       lui $t6, %hi(gMNResultsIsTeamBattle)
  /* 155238 80136098 91CE9C14 */       lbu $t6, %lo(gMNResultsIsTeamBattle)($t6)
  /* 15523C 8013609C 55C0000F */      bnel $t6, $zero, .L801360DC
  /* 155240 801360A0 8FA80018 */        lw $t0, 0x18($sp)
  /* 155244 801360A4 0C04CDA1 */       jal mnResultsGetPlayerCountByPlace
  /* 155248 801360A8 24040001 */     addiu $a0, $zero, 1
  /* 15524C 801360AC 24030002 */     addiu $v1, $zero, 2
  /* 155250 801360B0 14430009 */       bne $v0, $v1, .L801360D8
  /* 155254 801360B4 8FAF0018 */        lw $t7, 0x18($sp)
  /* 155258 801360B8 000FC080 */       sll $t8, $t7, 2
  /* 15525C 801360BC 3C198014 */       lui $t9, %hi(gMNResultsPlacement)
  /* 155260 801360C0 0338C821 */      addu $t9, $t9, $t8
  /* 155264 801360C4 8F399BB0 */        lw $t9, %lo(gMNResultsPlacement)($t9)
  /* 155268 801360C8 54790004 */      bnel $v1, $t9, .L801360DC
  /* 15526C 801360CC 8FA80018 */        lw $t0, 0x18($sp)
  /* 155270 801360D0 10000007 */         b .L801360F0
  /* 155274 801360D4 24020004 */     addiu $v0, $zero, 4
  .L801360D8:
  /* 155278 801360D8 8FA80018 */        lw $t0, 0x18($sp)
  .L801360DC:
  /* 15527C 801360DC 3C028014 */       lui $v0, %hi(gMNResultsPlacement)
  /* 155280 801360E0 00084880 */       sll $t1, $t0, 2
  /* 155284 801360E4 00491021 */      addu $v0, $v0, $t1
  /* 155288 801360E8 8C429BB0 */        lw $v0, %lo(gMNResultsPlacement)($v0)
  /* 15528C 801360EC 24420001 */     addiu $v0, $v0, 1
  .L801360F0:
  /* 155290 801360F0 8FBF0014 */        lw $ra, 0x14($sp)
  /* 155294 801360F4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 155298 801360F8 03E00008 */        jr $ra
  /* 15529C 801360FC 00000000 */       nop

glabel mnResultsDrawPlaceRow
  /* 1552A0 80136100 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 1552A4 80136104 3C198014 */       lui $t9, %hi(D_ovl31_8013A048)
  /* 1552A8 80136108 8F39A048 */        lw $t9, %lo(D_ovl31_8013A048)($t9)
  /* 1552AC 8013610C 3C080000 */       lui $t0, %hi(D_NF_00000990)
  /* 1552B0 80136110 AFB20048 */        sw $s2, 0x48($sp)
  /* 1552B4 80136114 25080990 */     addiu $t0, $t0, %lo(D_NF_00000990)
  /* 1552B8 80136118 3C0E800D */       lui $t6, %hi(func_ovl0_800CCF00)
  /* 1552BC 8013611C 00809025 */        or $s2, $a0, $zero
  /* 1552C0 80136120 AFBF0054 */        sw $ra, 0x54($sp)
  /* 1552C4 80136124 3C078000 */       lui $a3, 0x8000
  /* 1552C8 80136128 25CECF00 */     addiu $t6, $t6, %lo(func_ovl0_800CCF00)
  /* 1552CC 8013612C 240F001F */     addiu $t7, $zero, 0x1f
  /* 1552D0 80136130 2418FFFF */     addiu $t8, $zero, -1
  /* 1552D4 80136134 240A0001 */     addiu $t2, $zero, 1
  /* 1552D8 80136138 240B0001 */     addiu $t3, $zero, 1
  /* 1552DC 8013613C 03284821 */      addu $t1, $t9, $t0
  /* 1552E0 80136140 AFB40050 */        sw $s4, 0x50($sp)
  /* 1552E4 80136144 AFB3004C */        sw $s3, 0x4c($sp)
  /* 1552E8 80136148 AFB10044 */        sw $s1, 0x44($sp)
  /* 1552EC 8013614C AFB00040 */        sw $s0, 0x40($sp)
  /* 1552F0 80136150 F7B40038 */      sdc1 $f20, 0x38($sp)
  /* 1552F4 80136154 AFA90020 */        sw $t1, 0x20($sp)
  /* 1552F8 80136158 AFAB002C */        sw $t3, 0x2c($sp)
  /* 1552FC 8013615C AFAA0024 */        sw $t2, 0x24($sp)
  /* 155300 80136160 AFB8001C */        sw $t8, 0x1c($sp)
  /* 155304 80136164 AFAF0014 */        sw $t7, 0x14($sp)
  /* 155308 80136168 AFAE0010 */        sw $t6, 0x10($sp)
  /* 15530C 8013616C AFA70018 */        sw $a3, 0x18($sp)
  /* 155310 80136170 00002025 */        or $a0, $zero, $zero
  /* 155314 80136174 AFA00028 */        sw $zero, 0x28($sp)
  /* 155318 80136178 00002825 */        or $a1, $zero, $zero
  /* 15531C 8013617C 0C033414 */       jal func_ovl0_800CD050
  /* 155320 80136180 24060016 */     addiu $a2, $zero, 0x16
  /* 155324 80136184 44923000 */      mtc1 $s2, $f6
  /* 155328 80136188 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 15532C 8013618C 44812000 */      mtc1 $at, $f4 # 10.0 to cop1
  /* 155330 80136190 8C4C0074 */        lw $t4, 0x74($v0)
  /* 155334 80136194 46803520 */   cvt.s.w $f20, $f6
  /* 155338 80136198 240400FF */     addiu $a0, $zero, 0xff
  /* 15533C 8013619C E5840058 */      swc1 $f4, 0x58($t4)
  /* 155340 801361A0 8C4D0074 */        lw $t5, 0x74($v0)
  /* 155344 801361A4 3C118014 */       lui $s1, %hi(gMNResultsIsPresent)
  /* 155348 801361A8 00409825 */        or $s3, $v0, $zero
  /* 15534C 801361AC E5B4005C */      swc1 $f20, 0x5c($t5)
  /* 155350 801361B0 8C430074 */        lw $v1, 0x74($v0)
  /* 155354 801361B4 26319BD0 */     addiu $s1, $s1, %lo(gMNResultsIsPresent)
  /* 155358 801361B8 00008025 */        or $s0, $zero, $zero
  /* 15535C 801361BC 946E0024 */       lhu $t6, 0x24($v1)
  /* 155360 801361C0 24140004 */     addiu $s4, $zero, 4
  /* 155364 801361C4 31CFFFDF */      andi $t7, $t6, 0xffdf
  /* 155368 801361C8 A46F0024 */        sh $t7, 0x24($v1)
  /* 15536C 801361CC 8C430074 */        lw $v1, 0x74($v0)
  /* 155370 801361D0 94780024 */       lhu $t8, 0x24($v1)
  /* 155374 801361D4 37190001 */       ori $t9, $t8, 1
  /* 155378 801361D8 A4790024 */        sh $t9, 0x24($v1)
  /* 15537C 801361DC 8C480074 */        lw $t0, 0x74($v0)
  /* 155380 801361E0 A1000028 */        sb $zero, 0x28($t0)
  /* 155384 801361E4 8C490074 */        lw $t1, 0x74($v0)
  /* 155388 801361E8 A1200029 */        sb $zero, 0x29($t1)
  /* 15538C 801361EC 8C4A0074 */        lw $t2, 0x74($v0)
  /* 155390 801361F0 A140002A */        sb $zero, 0x2a($t2)
  /* 155394 801361F4 8C4B0074 */        lw $t3, 0x74($v0)
  /* 155398 801361F8 A1640028 */        sb $a0, 0x28($t3)
  /* 15539C 801361FC 8C4C0074 */        lw $t4, 0x74($v0)
  /* 1553A0 80136200 A1840029 */        sb $a0, 0x29($t4)
  /* 1553A4 80136204 8C4D0074 */        lw $t5, 0x74($v0)
  /* 1553A8 80136208 A1A4002A */        sb $a0, 0x2a($t5)
  .L8013620C:
  /* 1553AC 8013620C 8E2E0000 */        lw $t6, ($s1) # gMNResultsIsPresent + 0
  /* 1553B0 80136210 51C00014 */      beql $t6, $zero, .L80136264
  /* 1553B4 80136214 26100001 */     addiu $s0, $s0, 1
  /* 1553B8 80136218 0C04D81F */       jal mnResultsGetPlaceForDisplay
  /* 1553BC 8013621C 02002025 */        or $a0, $s0, $zero
  /* 1553C0 80136220 00409025 */        or $s2, $v0, $zero
  /* 1553C4 80136224 0C04D4FD */       jal mnResultsGetNumberColorIndex
  /* 1553C8 80136228 02002025 */        or $a0, $s0, $zero
  /* 1553CC 8013622C 02602025 */        or $a0, $s3, $zero
  /* 1553D0 80136230 02002825 */        or $a1, $s0, $zero
  /* 1553D4 80136234 02403025 */        or $a2, $s2, $zero
  /* 1553D8 80136238 0C04D23E */       jal mnResultsCreatePlaceNumber
  /* 1553DC 8013623C 00403825 */        or $a3, $v0, $zero
  /* 1553E0 80136240 00409025 */        or $s2, $v0, $zero
  /* 1553E4 80136244 0C04D81F */       jal mnResultsGetPlaceForDisplay
  /* 1553E8 80136248 02002025 */        or $a0, $s0, $zero
  /* 1553EC 8013624C 4407A000 */      mfc1 $a3, $f20
  /* 1553F0 80136250 02402025 */        or $a0, $s2, $zero
  /* 1553F4 80136254 02002825 */        or $a1, $s0, $zero
  /* 1553F8 80136258 0C04D7FC */       jal mnResultsPositionPlaceNumber
  /* 1553FC 8013625C 00403025 */        or $a2, $v0, $zero
  /* 155400 80136260 26100001 */     addiu $s0, $s0, 1
  .L80136264:
  /* 155404 80136264 1614FFE9 */       bne $s0, $s4, .L8013620C
  /* 155408 80136268 26310004 */     addiu $s1, $s1, 4
  /* 15540C 8013626C 8FBF0054 */        lw $ra, 0x54($sp)
  /* 155410 80136270 D7B40038 */      ldc1 $f20, 0x38($sp)
  /* 155414 80136274 8FB00040 */        lw $s0, 0x40($sp)
  /* 155418 80136278 8FB10044 */        lw $s1, 0x44($sp)
  /* 15541C 8013627C 8FB20048 */        lw $s2, 0x48($sp)
  /* 155420 80136280 8FB3004C */        lw $s3, 0x4c($sp)
  /* 155424 80136284 8FB40050 */        lw $s4, 0x50($sp)
  /* 155428 80136288 03E00008 */        jr $ra
  /* 15542C 8013628C 27BD0058 */     addiu $sp, $sp, 0x58

  glabel mnResultsDrawResults0
  /* 155430 80136290 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155434 80136294 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155438 80136298 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 15543C 8013629C 240100B4 */     addiu $at, $zero, 0xb4
  /* 155440 801362A0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 155444 801362A4 14410005 */       bne $v0, $at, .L801362BC
  /* 155448 801362A8 AFA40018 */        sw $a0, 0x18($sp)
  /* 15544C 801362AC 0C04D368 */       jal mnResultsCreateOverlay
  /* 155450 801362B0 00000000 */       nop
  /* 155454 801362B4 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155458 801362B8 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L801362BC:
  /* 15545C 801362BC 240100D2 */     addiu $at, $zero, 0xd2
  /* 155460 801362C0 54410008 */      bnel $v0, $at, .L801362E4
  /* 155464 801362C4 240100E6 */     addiu $at, $zero, 0xe6
  /* 155468 801362C8 0C04D527 */       jal mnResultsCreateColumnHeaders
  /* 15546C 801362CC 00000000 */       nop
  /* 155470 801362D0 0C04D5A7 */       jal mnResultsDrawKOs
  /* 155474 801362D4 24040042 */     addiu $a0, $zero, 0x42
  /* 155478 801362D8 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15547C 801362DC 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155480 801362E0 240100E6 */     addiu $at, $zero, 0xe6
  .L801362E4:
  /* 155484 801362E4 54410006 */      bnel $v0, $at, .L80136300
  /* 155488 801362E8 240100FA */     addiu $at, $zero, 0xfa
  /* 15548C 801362EC 0C04D63C */       jal mnResultsDrawTKOs
  /* 155490 801362F0 24040051 */     addiu $a0, $zero, 0x51
  /* 155494 801362F4 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155498 801362F8 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 15549C 801362FC 240100FA */     addiu $at, $zero, 0xfa
  .L80136300:
  /* 1554A0 80136300 54410006 */      bnel $v0, $at, .L8013631C
  /* 1554A4 80136304 2401010E */     addiu $at, $zero, 0x10e
  /* 1554A8 80136308 0C04D756 */       jal mnResultsCreateHorizontalLine
  /* 1554AC 8013630C 24040062 */     addiu $a0, $zero, 0x62
  /* 1554B0 80136310 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1554B4 80136314 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1554B8 80136318 2401010E */     addiu $at, $zero, 0x10e
  .L8013631C:
  /* 1554BC 8013631C 54410006 */      bnel $v0, $at, .L80136338
  /* 1554C0 80136320 24010122 */     addiu $at, $zero, 0x122
  /* 1554C4 80136324 0C04D773 */       jal mnResultsDrawPointsRow
  /* 1554C8 80136328 00000000 */       nop
  /* 1554CC 8013632C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1554D0 80136330 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1554D4 80136334 24010122 */     addiu $at, $zero, 0x122
  .L80136338:
  /* 1554D8 80136338 54410004 */      bnel $v0, $at, .L8013634C
  /* 1554DC 8013633C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1554E0 80136340 0C04D840 */       jal mnResultsDrawPlaceRow
  /* 1554E4 80136344 2404007C */     addiu $a0, $zero, 0x7c
  /* 1554E8 80136348 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013634C:
  /* 1554EC 8013634C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1554F0 80136350 03E00008 */        jr $ra
  /* 1554F4 80136354 00000000 */       nop

  glabel mnResultsDrawResults1
  /* 1554F8 80136358 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1554FC 8013635C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155500 80136360 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 155504 80136364 240100B4 */     addiu $at, $zero, 0xb4
  /* 155508 80136368 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15550C 8013636C 14410005 */       bne $v0, $at, .L80136384
  /* 155510 80136370 AFA40018 */        sw $a0, 0x18($sp)
  /* 155514 80136374 0C04D368 */       jal mnResultsCreateOverlay
  /* 155518 80136378 00000000 */       nop
  /* 15551C 8013637C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155520 80136380 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L80136384:
  /* 155524 80136384 240100D2 */     addiu $at, $zero, 0xd2
  /* 155528 80136388 54410006 */      bnel $v0, $at, .L801363A4
  /* 15552C 8013638C 240100E6 */     addiu $at, $zero, 0xe6
  /* 155530 80136390 0C04D840 */       jal mnResultsDrawPlaceRow
  /* 155534 80136394 24040042 */     addiu $a0, $zero, 0x42
  /* 155538 80136398 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15553C 8013639C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155540 801363A0 240100E6 */     addiu $at, $zero, 0xe6
  .L801363A4:
  /* 155544 801363A4 54410006 */      bnel $v0, $at, .L801363C0
  /* 155548 801363A8 240100FA */     addiu $at, $zero, 0xfa
  /* 15554C 801363AC 0C04D756 */       jal mnResultsCreateHorizontalLine
  /* 155550 801363B0 2404006E */     addiu $a0, $zero, 0x6e
  /* 155554 801363B4 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155558 801363B8 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 15555C 801363BC 240100FA */     addiu $at, $zero, 0xfa
  .L801363C0:
  /* 155560 801363C0 54410006 */      bnel $v0, $at, .L801363DC
  /* 155564 801363C4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 155568 801363C8 0C04D527 */       jal mnResultsCreateColumnHeaders
  /* 15556C 801363CC 00000000 */       nop
  /* 155570 801363D0 0C04D5A7 */       jal mnResultsDrawKOs
  /* 155574 801363D4 2404007C */     addiu $a0, $zero, 0x7c
  /* 155578 801363D8 8FBF0014 */        lw $ra, 0x14($sp)
  .L801363DC:
  /* 15557C 801363DC 27BD0018 */     addiu $sp, $sp, 0x18
  /* 155580 801363E0 03E00008 */        jr $ra
  /* 155584 801363E4 00000000 */       nop

  glabel mnResultsDrawResults2
  /* 155588 801363E8 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15558C 801363EC 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155590 801363F0 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 155594 801363F4 240100B4 */     addiu $at, $zero, 0xb4
  /* 155598 801363F8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15559C 801363FC 14410005 */       bne $v0, $at, .L80136414
  /* 1555A0 80136400 AFA40018 */        sw $a0, 0x18($sp)
  /* 1555A4 80136404 0C04D368 */       jal mnResultsCreateOverlay
  /* 1555A8 80136408 00000000 */       nop
  /* 1555AC 8013640C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1555B0 80136410 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L80136414:
  /* 1555B4 80136414 240100D2 */     addiu $at, $zero, 0xd2
  /* 1555B8 80136418 54410008 */      bnel $v0, $at, .L8013643C
  /* 1555BC 8013641C 240100E6 */     addiu $at, $zero, 0xe6
  /* 1555C0 80136420 0C04D527 */       jal mnResultsCreateColumnHeaders
  /* 1555C4 80136424 00000000 */       nop
  /* 1555C8 80136428 0C04D5A7 */       jal mnResultsDrawKOs
  /* 1555CC 8013642C 24040042 */     addiu $a0, $zero, 0x42
  /* 1555D0 80136430 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1555D4 80136434 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1555D8 80136438 240100E6 */     addiu $at, $zero, 0xe6
  .L8013643C:
  /* 1555DC 8013643C 54410006 */      bnel $v0, $at, .L80136458
  /* 1555E0 80136440 240100FA */     addiu $at, $zero, 0xfa
  /* 1555E4 80136444 0C04D63C */       jal mnResultsDrawTKOs
  /* 1555E8 80136448 24040051 */     addiu $a0, $zero, 0x51
  /* 1555EC 8013644C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1555F0 80136450 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1555F4 80136454 240100FA */     addiu $at, $zero, 0xfa
  .L80136458:
  /* 1555F8 80136458 54410006 */      bnel $v0, $at, .L80136474
  /* 1555FC 8013645C 2401010E */     addiu $at, $zero, 0x10e
  /* 155600 80136460 0C04D756 */       jal mnResultsCreateHorizontalLine
  /* 155604 80136464 24040062 */     addiu $a0, $zero, 0x62
  /* 155608 80136468 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15560C 8013646C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155610 80136470 2401010E */     addiu $at, $zero, 0x10e
  .L80136474:
  /* 155614 80136474 54410006 */      bnel $v0, $at, .L80136490
  /* 155618 80136478 24010122 */     addiu $at, $zero, 0x122
  /* 15561C 8013647C 0C04D773 */       jal mnResultsDrawPointsRow
  /* 155620 80136480 00000000 */       nop
  /* 155624 80136484 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155628 80136488 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 15562C 8013648C 24010122 */     addiu $at, $zero, 0x122
  .L80136490:
  /* 155630 80136490 54410004 */      bnel $v0, $at, .L801364A4
  /* 155634 80136494 8FBF0014 */        lw $ra, 0x14($sp)
  /* 155638 80136498 0C04D840 */       jal mnResultsDrawPlaceRow
  /* 15563C 8013649C 2404007C */     addiu $a0, $zero, 0x7c
  /* 155640 801364A0 8FBF0014 */        lw $ra, 0x14($sp)
  .L801364A4:
  /* 155644 801364A4 27BD0018 */     addiu $sp, $sp, 0x18
  /* 155648 801364A8 03E00008 */        jr $ra
  /* 15564C 801364AC 00000000 */       nop

  glabel mnResultsDrawResults3
  /* 155650 801364B0 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155654 801364B4 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155658 801364B8 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 15565C 801364BC 240100B4 */     addiu $at, $zero, 0xb4
  /* 155660 801364C0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 155664 801364C4 14410005 */       bne $v0, $at, .L801364DC
  /* 155668 801364C8 AFA40018 */        sw $a0, 0x18($sp)
  /* 15566C 801364CC 0C04D368 */       jal mnResultsCreateOverlay
  /* 155670 801364D0 00000000 */       nop
  /* 155674 801364D4 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155678 801364D8 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L801364DC:
  /* 15567C 801364DC 240100D2 */     addiu $at, $zero, 0xd2
  /* 155680 801364E0 54410006 */      bnel $v0, $at, .L801364FC
  /* 155684 801364E4 240100E6 */     addiu $at, $zero, 0xe6
  /* 155688 801364E8 0C04D840 */       jal mnResultsDrawPlaceRow
  /* 15568C 801364EC 24040042 */     addiu $a0, $zero, 0x42
  /* 155690 801364F0 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155694 801364F4 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155698 801364F8 240100E6 */     addiu $at, $zero, 0xe6
  .L801364FC:
  /* 15569C 801364FC 54410006 */      bnel $v0, $at, .L80136518
  /* 1556A0 80136500 240100FA */     addiu $at, $zero, 0xfa
  /* 1556A4 80136504 0C04D756 */       jal mnResultsCreateHorizontalLine
  /* 1556A8 80136508 2404006E */     addiu $a0, $zero, 0x6e
  /* 1556AC 8013650C 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1556B0 80136510 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1556B4 80136514 240100FA */     addiu $at, $zero, 0xfa
  .L80136518:
  /* 1556B8 80136518 54410006 */      bnel $v0, $at, .L80136534
  /* 1556BC 8013651C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1556C0 80136520 0C04D527 */       jal mnResultsCreateColumnHeaders
  /* 1556C4 80136524 00000000 */       nop
  /* 1556C8 80136528 0C04D5A7 */       jal mnResultsDrawKOs
  /* 1556CC 8013652C 2404007C */     addiu $a0, $zero, 0x7c
  /* 1556D0 80136530 8FBF0014 */        lw $ra, 0x14($sp)
  .L80136534:
  /* 1556D4 80136534 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1556D8 80136538 03E00008 */        jr $ra
  /* 1556DC 8013653C 00000000 */       nop

  glabel mnResultsDrawResultsNoContest
  /* 1556E0 80136540 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 1556E4 80136544 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 1556E8 80136548 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1556EC 8013654C 2401001E */     addiu $at, $zero, 0x1e
  /* 1556F0 80136550 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1556F4 80136554 14410005 */       bne $v0, $at, .L8013656C
  /* 1556F8 80136558 AFA40018 */        sw $a0, 0x18($sp)
  /* 1556FC 8013655C 0C04D368 */       jal mnResultsCreateOverlay
  /* 155700 80136560 00000000 */       nop
  /* 155704 80136564 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 155708 80136568 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L8013656C:
  /* 15570C 8013656C 2401003C */     addiu $at, $zero, 0x3c
  /* 155710 80136570 54410008 */      bnel $v0, $at, .L80136594
  /* 155714 80136574 24010050 */     addiu $at, $zero, 0x50
  /* 155718 80136578 0C04D527 */       jal mnResultsCreateColumnHeaders
  /* 15571C 8013657C 00000000 */       nop
  /* 155720 80136580 0C04D5A7 */       jal mnResultsDrawKOs
  /* 155724 80136584 24040042 */     addiu $a0, $zero, 0x42
  /* 155728 80136588 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 15572C 8013658C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 155730 80136590 24010050 */     addiu $at, $zero, 0x50
  .L80136594:
  /* 155734 80136594 54410004 */      bnel $v0, $at, .L801365A8
  /* 155738 80136598 8FBF0014 */        lw $ra, 0x14($sp)
  /* 15573C 8013659C 0C04D63C */       jal mnResultsDrawTKOs
  /* 155740 801365A0 24040051 */     addiu $a0, $zero, 0x51
  /* 155744 801365A4 8FBF0014 */        lw $ra, 0x14($sp)
  .L801365A8:
  /* 155748 801365A8 27BD0018 */     addiu $sp, $sp, 0x18
  /* 15574C 801365AC 03E00008 */        jr $ra
  /* 155750 801365B0 00000000 */       nop

glabel mnResultsGetIsTeamBattle
  /* 155754 801365B4 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 155758 801365B8 03E00008 */        jr $ra
  /* 15575C 801365BC 90429C14 */       lbu $v0, %lo(gMNResultsIsTeamBattle)($v0)

glabel mnResultsRenderScreenTitle
  /* 155760 801365C0 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 155764 801365C4 AFB00018 */        sw $s0, 0x18($sp)
  /* 155768 801365C8 3C108004 */       lui $s0, %hi(gDisplayListHead)
  /* 15576C 801365CC 261065B0 */     addiu $s0, $s0, %lo(gDisplayListHead)
  /* 155770 801365D0 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 155774 801365D4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 155778 801365D8 AFA40030 */        sw $a0, 0x30($sp)
  /* 15577C 801365DC 246E0008 */     addiu $t6, $v1, 8
  /* 155780 801365E0 AE0E0000 */        sw $t6, ($s0) # gDisplayListHead + 0
  /* 155784 801365E4 3C0FE700 */       lui $t7, 0xe700
  /* 155788 801365E8 AC6F0000 */        sw $t7, ($v1)
  /* 15578C 801365EC AC600004 */        sw $zero, 4($v1)
  /* 155790 801365F0 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 155794 801365F4 3C19E300 */       lui $t9, (0xE3000A01 >> 16) # 3808430593
  /* 155798 801365F8 37390A01 */       ori $t9, $t9, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 15579C 801365FC 24780008 */     addiu $t8, $v1, 8
  /* 1557A0 80136600 AE180000 */        sw $t8, ($s0) # gDisplayListHead + 0
  /* 1557A4 80136604 3C080030 */       lui $t0, 0x30
  /* 1557A8 80136608 AC680004 */        sw $t0, 4($v1)
  /* 1557AC 8013660C AC790000 */        sw $t9, ($v1)
  /* 1557B0 80136610 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 1557B4 80136614 3C0AE200 */       lui $t2, (0xE200001C >> 16) # 3791650844
  /* 1557B8 80136618 354A001C */       ori $t2, $t2, (0xE200001C & 0xFFFF) # 3791650844
  /* 1557BC 8013661C 24690008 */     addiu $t1, $v1, 8
  /* 1557C0 80136620 AE090000 */        sw $t1, ($s0) # gDisplayListHead + 0
  /* 1557C4 80136624 AC6A0000 */        sw $t2, ($v1)
  /* 1557C8 80136628 AC600004 */        sw $zero, 4($v1)
  /* 1557CC 8013662C 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 1557D0 80136630 3C0CF700 */       lui $t4, 0xf700
  /* 1557D4 80136634 2404FFFF */     addiu $a0, $zero, -1
  /* 1557D8 80136638 246B0008 */     addiu $t3, $v1, 8
  /* 1557DC 8013663C AE0B0000 */        sw $t3, ($s0) # gDisplayListHead + 0
  /* 1557E0 80136640 AC6C0000 */        sw $t4, ($v1)
  /* 1557E4 80136644 0C001B5C */       jal gsGetFillColor
  /* 1557E8 80136648 AFA30020 */        sw $v1, 0x20($sp)
  /* 1557EC 8013664C 8FA70020 */        lw $a3, 0x20($sp)
  /* 1557F0 80136650 3C0EF646 */       lui $t6, (0xF64680B0 >> 16) # 4131815600
  /* 1557F4 80136654 3C0F0008 */       lui $t7, (0x800A8 >> 16) # 524456
  /* 1557F8 80136658 ACE20004 */        sw $v0, 4($a3)
  /* 1557FC 8013665C 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 155800 80136660 35EF00A8 */       ori $t7, $t7, (0x800A8 & 0xFFFF) # 524456
  /* 155804 80136664 35CE80B0 */       ori $t6, $t6, (0xF64680B0 & 0xFFFF) # 4131815600
  /* 155808 80136668 246D0008 */     addiu $t5, $v1, 8
  /* 15580C 8013666C AE0D0000 */        sw $t5, ($s0) # gDisplayListHead + 0
  /* 155810 80136670 AC6F0004 */        sw $t7, 4($v1)
  /* 155814 80136674 AC6E0000 */        sw $t6, ($v1)
  /* 155818 80136678 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 15581C 8013667C 3C19E700 */       lui $t9, 0xe700
  /* 155820 80136680 3C09E200 */       lui $t1, (0xE200001C >> 16) # 3791650844
  /* 155824 80136684 24780008 */     addiu $t8, $v1, 8
  /* 155828 80136688 AE180000 */        sw $t8, ($s0) # gDisplayListHead + 0
  /* 15582C 8013668C AC600004 */        sw $zero, 4($v1)
  /* 155830 80136690 AC790000 */        sw $t9, ($v1)
  /* 155834 80136694 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 155838 80136698 3C0A0055 */       lui $t2, (0x552078 >> 16) # 5578872
  /* 15583C 8013669C 354A2078 */       ori $t2, $t2, (0x552078 & 0xFFFF) # 5578872
  /* 155840 801366A0 24680008 */     addiu $t0, $v1, 8
  /* 155844 801366A4 AE080000 */        sw $t0, ($s0) # gDisplayListHead + 0
  /* 155848 801366A8 3529001C */       ori $t1, $t1, (0xE200001C & 0xFFFF) # 3791650844
  /* 15584C 801366AC AC690000 */        sw $t1, ($v1)
  /* 155850 801366B0 0C0333AB */       jal func_ovl0_800CCEAC
  /* 155854 801366B4 AC6A0004 */        sw $t2, 4($v1)
  /* 155858 801366B8 0C0333C0 */       jal func_ovl0_800CCF00
  /* 15585C 801366BC 8FA40030 */        lw $a0, 0x30($sp)
  /* 155860 801366C0 8E030000 */        lw $v1, ($s0) # gDisplayListHead + 0
  /* 155864 801366C4 3C0CE300 */       lui $t4, (0xE3000A01 >> 16) # 3808430593
  /* 155868 801366C8 358C0A01 */       ori $t4, $t4, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 15586C 801366CC 246B0008 */     addiu $t3, $v1, 8
  /* 155870 801366D0 AE0B0000 */        sw $t3, ($s0) # gDisplayListHead + 0
  /* 155874 801366D4 AC600004 */        sw $zero, 4($v1)
  /* 155878 801366D8 AC6C0000 */        sw $t4, ($v1)
  /* 15587C 801366DC 8FBF001C */        lw $ra, 0x1c($sp)
  /* 155880 801366E0 8FB00018 */        lw $s0, 0x18($sp)
  /* 155884 801366E4 27BD0030 */     addiu $sp, $sp, 0x30
  /* 155888 801366E8 03E00008 */        jr $ra
  /* 15588C 801366EC 00000000 */       nop

glabel mnResultsCreateScreenTitle
  /* 155890 801366F0 27BDFFA0 */     addiu $sp, $sp, -0x60
  /* 155894 801366F4 3C0F8014 */       lui $t7, %hi(dMNResultsScreenTitleOffsets)
  /* 155898 801366F8 AFBF0034 */        sw $ra, 0x34($sp)
  /* 15589C 801366FC 25EF96DC */     addiu $t7, $t7, %lo(dMNResultsScreenTitleOffsets)
  /* 1558A0 80136700 8DF90000 */        lw $t9, ($t7) # dMNResultsScreenTitleOffsets + 0
  /* 1558A4 80136704 8DF80004 */        lw $t8, 4($t7) # dMNResultsScreenTitleOffsets + 4
  /* 1558A8 80136708 27AE0054 */     addiu $t6, $sp, 0x54
  /* 1558AC 8013670C 3C098014 */       lui $t1, %hi(dMNResultsRoutines)
  /* 1558B0 80136710 252996E4 */     addiu $t1, $t1, %lo(dMNResultsRoutines)
  /* 1558B4 80136714 ADD90000 */        sw $t9, ($t6)
  /* 1558B8 80136718 ADD80004 */        sw $t8, 4($t6)
  /* 1558BC 8013671C 8D2B0000 */        lw $t3, ($t1) # dMNResultsRoutines + 0
  /* 1558C0 80136720 27A80040 */     addiu $t0, $sp, 0x40
  /* 1558C4 80136724 8D2A0004 */        lw $t2, 4($t1) # dMNResultsRoutines + 4
  /* 1558C8 80136728 AD0B0000 */        sw $t3, ($t0)
  /* 1558CC 8013672C 8D2B0008 */        lw $t3, 8($t1) # dMNResultsRoutines + 8
  /* 1558D0 80136730 AD0A0004 */        sw $t2, 4($t0)
  /* 1558D4 80136734 8D2A000C */        lw $t2, 0xc($t1) # dMNResultsRoutines + 12
  /* 1558D8 80136738 AD0B0008 */        sw $t3, 8($t0)
  /* 1558DC 8013673C 8D2B0010 */        lw $t3, 0x10($t1) # dMNResultsRoutines + 16
  /* 1558E0 80136740 AD0A000C */        sw $t2, 0xc($t0)
  /* 1558E4 80136744 0C04D96D */       jal mnResultsGetIsTeamBattle
  /* 1558E8 80136748 AD0B0010 */        sw $t3, 0x10($t0)
  /* 1558EC 8013674C 3C0C8013 */       lui $t4, %hi(mnResultsRenderScreenTitle)
  /* 1558F0 80136750 258C65C0 */     addiu $t4, $t4, %lo(mnResultsRenderScreenTitle)
  /* 1558F4 80136754 3C078000 */       lui $a3, 0x8000
  /* 1558F8 80136758 240D001F */     addiu $t5, $zero, 0x1f
  /* 1558FC 8013675C 240EFFFF */     addiu $t6, $zero, -1
  /* 155900 80136760 00027880 */       sll $t7, $v0, 2
  /* 155904 80136764 03AFC021 */      addu $t8, $sp, $t7
  /* 155908 80136768 AFAE001C */        sw $t6, 0x1c($sp)
  /* 15590C 8013676C AFAD0014 */        sw $t5, 0x14($sp)
  /* 155910 80136770 AFA70018 */        sw $a3, 0x18($sp)
  /* 155914 80136774 AFAC0010 */        sw $t4, 0x10($sp)
  /* 155918 80136778 3C198014 */       lui $t9, %hi(D_ovl31_8013A050)
  /* 15591C 8013677C 3C0A8014 */       lui $t2, %hi(gMNResultsGameRule)
  /* 155920 80136780 8D4A9C10 */        lw $t2, %lo(gMNResultsGameRule)($t2)
  /* 155924 80136784 8F39A050 */        lw $t9, %lo(D_ovl31_8013A050)($t9)
  /* 155928 80136788 8F180054 */        lw $t8, 0x54($t8)
  /* 15592C 8013678C 24090001 */     addiu $t1, $zero, 1
  /* 155930 80136790 000A5880 */       sll $t3, $t2, 2
  /* 155934 80136794 03194021 */      addu $t0, $t8, $t9
  /* 155938 80136798 AFA80020 */        sw $t0, 0x20($sp)
  /* 15593C 8013679C 03AB6021 */      addu $t4, $sp, $t3
  /* 155940 801367A0 AFA90024 */        sw $t1, 0x24($sp)
  /* 155944 801367A4 8D8C0040 */        lw $t4, 0x40($t4) # mnResultsRenderScreenTitle + 64
  /* 155948 801367A8 240D0001 */     addiu $t5, $zero, 1
  /* 15594C 801367AC AFAD002C */        sw $t5, 0x2c($sp)
  /* 155950 801367B0 00002025 */        or $a0, $zero, $zero
  /* 155954 801367B4 00002825 */        or $a1, $zero, $zero
  /* 155958 801367B8 24060016 */     addiu $a2, $zero, 0x16
  /* 15595C 801367BC 0C033414 */       jal func_ovl0_800CD050
  /* 155960 801367C0 AFAC0028 */        sw $t4, 0x28($sp)
  /* 155964 801367C4 3C014200 */       lui $at, (0x42000000 >> 16) # 32.0
  /* 155968 801367C8 44812000 */      mtc1 $at, $f4 # 32.0 to cop1
  /* 15596C 801367CC 8C4E0074 */        lw $t6, 0x74($v0)
  /* 155970 801367D0 3C0141E8 */       lui $at, (0x41E80000 >> 16) # 29.0
  /* 155974 801367D4 44813000 */      mtc1 $at, $f6 # 29.0 to cop1
  /* 155978 801367D8 E5C40058 */      swc1 $f4, 0x58($t6)
  /* 15597C 801367DC 8C4F0074 */        lw $t7, 0x74($v0)
  /* 155980 801367E0 240400FF */     addiu $a0, $zero, 0xff
  /* 155984 801367E4 E5E6005C */      swc1 $f6, 0x5c($t7)
  /* 155988 801367E8 8C430074 */        lw $v1, 0x74($v0)
  /* 15598C 801367EC 94780024 */       lhu $t8, 0x24($v1)
  /* 155990 801367F0 3319FFDF */      andi $t9, $t8, 0xffdf
  /* 155994 801367F4 A4790024 */        sh $t9, 0x24($v1)
  /* 155998 801367F8 8C430074 */        lw $v1, 0x74($v0)
  /* 15599C 801367FC 94680024 */       lhu $t0, 0x24($v1)
  /* 1559A0 80136800 35090001 */       ori $t1, $t0, 1
  /* 1559A4 80136804 A4690024 */        sh $t1, 0x24($v1)
  /* 1559A8 80136808 8C4A0074 */        lw $t2, 0x74($v0)
  /* 1559AC 8013680C A1440028 */        sb $a0, 0x28($t2)
  /* 1559B0 80136810 8C4B0074 */        lw $t3, 0x74($v0)
  /* 1559B4 80136814 A1640029 */        sb $a0, 0x29($t3)
  /* 1559B8 80136818 8C4C0074 */        lw $t4, 0x74($v0)
  /* 1559BC 8013681C A184002A */        sb $a0, 0x2a($t4)
  /* 1559C0 80136820 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1559C4 80136824 27BD0060 */     addiu $sp, $sp, 0x60
  /* 1559C8 80136828 03E00008 */        jr $ra
  /* 1559CC 8013682C 00000000 */       nop

glabel mnResultsCreateResultsViewport
  /* 1559D0 80136830 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 1559D4 80136834 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 1559D8 80136838 AFBF003C */        sw $ra, 0x3c($sp)
  /* 1559DC 8013683C 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 1559E0 80136840 240F000F */     addiu $t7, $zero, 0xf
  /* 1559E4 80136844 24180000 */     addiu $t8, $zero, 0
  /* 1559E8 80136848 3C198000 */       lui $t9, 0x8000
  /* 1559EC 8013684C 2408FFFF */     addiu $t0, $zero, -1
  /* 1559F0 80136850 24090001 */     addiu $t1, $zero, 1
  /* 1559F4 80136854 240A0001 */     addiu $t2, $zero, 1
  /* 1559F8 80136858 AFAA0030 */        sw $t2, 0x30($sp)
  /* 1559FC 8013685C AFA90028 */        sw $t1, 0x28($sp)
  /* 155A00 80136860 AFA80020 */        sw $t0, 0x20($sp)
  /* 155A04 80136864 AFB9001C */        sw $t9, 0x1c($sp)
  /* 155A08 80136868 AFB80018 */        sw $t8, 0x18($sp)
  /* 155A0C 8013686C AFAF0014 */        sw $t7, 0x14($sp)
  /* 155A10 80136870 AFAE0010 */        sw $t6, 0x10($sp)
  /* 155A14 80136874 AFA00024 */        sw $zero, 0x24($sp)
  /* 155A18 80136878 AFA0002C */        sw $zero, 0x2c($sp)
  /* 155A1C 8013687C AFA00034 */        sw $zero, 0x34($sp)
  /* 155A20 80136880 24040401 */     addiu $a0, $zero, 0x401
  /* 155A24 80136884 00002825 */        or $a1, $zero, $zero
  /* 155A28 80136888 24060010 */     addiu $a2, $zero, 0x10
  /* 155A2C 8013688C 0C002E4F */       jal func_8000B93C
  /* 155A30 80136890 3C078000 */       lui $a3, 0x8000
  /* 155A34 80136894 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 155A38 80136898 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 155A3C 8013689C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 155A40 801368A0 8C430074 */        lw $v1, 0x74($v0)
  /* 155A44 801368A4 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 155A48 801368A8 44050000 */      mfc1 $a1, $f0
  /* 155A4C 801368AC 44060000 */      mfc1 $a2, $f0
  /* 155A50 801368B0 3C07439B */       lui $a3, 0x439b
  /* 155A54 801368B4 24640008 */     addiu $a0, $v1, 8
  /* 155A58 801368B8 0C001C20 */       jal func_80007080
  /* 155A5C 801368BC E7A40010 */      swc1 $f4, 0x10($sp)
  /* 155A60 801368C0 8FBF003C */        lw $ra, 0x3c($sp)
  /* 155A64 801368C4 27BD0040 */     addiu $sp, $sp, 0x40
  /* 155A68 801368C8 03E00008 */        jr $ra
  /* 155A6C 801368CC 00000000 */       nop

glabel mnResultsCreateLogoViewport
  /* 155A70 801368D0 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 155A74 801368D4 3C0E8001 */       lui $t6, %hi(func_80017DBC)
  /* 155A78 801368D8 AFBF003C */        sw $ra, 0x3c($sp)
  /* 155A7C 801368DC 25CE7DBC */     addiu $t6, $t6, %lo(func_80017DBC)
  /* 155A80 801368E0 240F003C */     addiu $t7, $zero, 0x3c
  /* 155A84 801368E4 24180002 */     addiu $t8, $zero, 2
  /* 155A88 801368E8 24190000 */     addiu $t9, $zero, 0
  /* 155A8C 801368EC 2408FFFF */     addiu $t0, $zero, -1
  /* 155A90 801368F0 24090001 */     addiu $t1, $zero, 1
  /* 155A94 801368F4 240A0001 */     addiu $t2, $zero, 1
  /* 155A98 801368F8 240B0001 */     addiu $t3, $zero, 1
  /* 155A9C 801368FC AFAB0030 */        sw $t3, 0x30($sp)
  /* 155AA0 80136900 AFAA0028 */        sw $t2, 0x28($sp)
  /* 155AA4 80136904 AFA90024 */        sw $t1, 0x24($sp)
  /* 155AA8 80136908 AFA80020 */        sw $t0, 0x20($sp)
  /* 155AAC 8013690C AFB9001C */        sw $t9, 0x1c($sp)
  /* 155AB0 80136910 AFB80018 */        sw $t8, 0x18($sp)
  /* 155AB4 80136914 AFAF0014 */        sw $t7, 0x14($sp)
  /* 155AB8 80136918 AFAE0010 */        sw $t6, 0x10($sp)
  /* 155ABC 8013691C AFA0002C */        sw $zero, 0x2c($sp)
  /* 155AC0 80136920 AFA00034 */        sw $zero, 0x34($sp)
  /* 155AC4 80136924 24040401 */     addiu $a0, $zero, 0x401
  /* 155AC8 80136928 00002825 */        or $a1, $zero, $zero
  /* 155ACC 8013692C 24060010 */     addiu $a2, $zero, 0x10
  /* 155AD0 80136930 0C002E4F */       jal func_8000B93C
  /* 155AD4 80136934 3C078000 */       lui $a3, 0x8000
  /* 155AD8 80136938 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 155ADC 8013693C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 155AE0 80136940 8C430074 */        lw $v1, 0x74($v0)
  /* 155AE4 80136944 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 155AE8 80136948 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 155AEC 8013694C 44050000 */      mfc1 $a1, $f0
  /* 155AF0 80136950 44060000 */      mfc1 $a2, $f0
  /* 155AF4 80136954 3C07439B */       lui $a3, 0x439b
  /* 155AF8 80136958 24640008 */     addiu $a0, $v1, 8
  /* 155AFC 8013695C AFA30044 */        sw $v1, 0x44($sp)
  /* 155B00 80136960 0C001C20 */       jal func_80007080
  /* 155B04 80136964 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 155B08 80136968 8FA30044 */        lw $v1, 0x44($sp)
  /* 155B0C 8013696C 44800000 */      mtc1 $zero, $f0
  /* 155B10 80136970 3C0144E1 */       lui $at, (0x44E10000 >> 16) # 1800.0
  /* 155B14 80136974 44813000 */      mtc1 $at, $f6 # 1800.0 to cop1
  /* 155B18 80136978 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 155B1C 8013697C 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 155B20 80136980 E460003C */      swc1 $f0, 0x3c($v1)
  /* 155B24 80136984 E4600040 */      swc1 $f0, 0x40($v1)
  /* 155B28 80136988 E4600048 */      swc1 $f0, 0x48($v1)
  /* 155B2C 8013698C E460004C */      swc1 $f0, 0x4c($v1)
  /* 155B30 80136990 E4600050 */      swc1 $f0, 0x50($v1)
  /* 155B34 80136994 E4600054 */      swc1 $f0, 0x54($v1)
  /* 155B38 80136998 E460005C */      swc1 $f0, 0x5c($v1)
  /* 155B3C 8013699C E4660044 */      swc1 $f6, 0x44($v1)
  /* 155B40 801369A0 E4680058 */      swc1 $f8, 0x58($v1)
  /* 155B44 801369A4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 155B48 801369A8 27BD0048 */     addiu $sp, $sp, 0x48
  /* 155B4C 801369AC 03E00008 */        jr $ra
  /* 155B50 801369B0 00000000 */       nop

glabel mnResultsCreateFighterViewport
  /* 155B54 801369B4 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 155B58 801369B8 3C0E8001 */       lui $t6, %hi(func_80017DBC)
  /* 155B5C 801369BC 3C190004 */       lui $t9, (0x48600 >> 16) # 296448
  /* 155B60 801369C0 AFBF003C */        sw $ra, 0x3c($sp)
  /* 155B64 801369C4 37398600 */       ori $t9, $t9, (0x48600 & 0xFFFF) # 296448
  /* 155B68 801369C8 25CE7DBC */     addiu $t6, $t6, %lo(func_80017DBC)
  /* 155B6C 801369CC 240F0032 */     addiu $t7, $zero, 0x32
  /* 155B70 801369D0 24180000 */     addiu $t8, $zero, 0
  /* 155B74 801369D4 2408FFFF */     addiu $t0, $zero, -1
  /* 155B78 801369D8 24090001 */     addiu $t1, $zero, 1
  /* 155B7C 801369DC 240A0001 */     addiu $t2, $zero, 1
  /* 155B80 801369E0 240B0001 */     addiu $t3, $zero, 1
  /* 155B84 801369E4 AFAB0030 */        sw $t3, 0x30($sp)
  /* 155B88 801369E8 AFAA0028 */        sw $t2, 0x28($sp)
  /* 155B8C 801369EC AFA90024 */        sw $t1, 0x24($sp)
  /* 155B90 801369F0 AFA80020 */        sw $t0, 0x20($sp)
  /* 155B94 801369F4 AFB80018 */        sw $t8, 0x18($sp)
  /* 155B98 801369F8 AFAF0014 */        sw $t7, 0x14($sp)
  /* 155B9C 801369FC AFAE0010 */        sw $t6, 0x10($sp)
  /* 155BA0 80136A00 AFB9001C */        sw $t9, 0x1c($sp)
  /* 155BA4 80136A04 AFA0002C */        sw $zero, 0x2c($sp)
  /* 155BA8 80136A08 AFA00034 */        sw $zero, 0x34($sp)
  /* 155BAC 80136A0C 24040401 */     addiu $a0, $zero, 0x401
  /* 155BB0 80136A10 00002825 */        or $a1, $zero, $zero
  /* 155BB4 80136A14 24060010 */     addiu $a2, $zero, 0x10
  /* 155BB8 80136A18 0C002E4F */       jal func_8000B93C
  /* 155BBC 80136A1C 3C078000 */       lui $a3, 0x8000
  /* 155BC0 80136A20 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 155BC4 80136A24 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 155BC8 80136A28 8C430074 */        lw $v1, 0x74($v0)
  /* 155BCC 80136A2C 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 155BD0 80136A30 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 155BD4 80136A34 44050000 */      mfc1 $a1, $f0
  /* 155BD8 80136A38 44060000 */      mfc1 $a2, $f0
  /* 155BDC 80136A3C 3C07439B */       lui $a3, 0x439b
  /* 155BE0 80136A40 24640008 */     addiu $a0, $v1, 8
  /* 155BE4 80136A44 AFA30044 */        sw $v1, 0x44($sp)
  /* 155BE8 80136A48 0C001C20 */       jal func_80007080
  /* 155BEC 80136A4C E7A40010 */      swc1 $f4, 0x10($sp)
  /* 155BF0 80136A50 8FA30044 */        lw $v1, 0x44($sp)
  /* 155BF4 80136A54 44800000 */      mtc1 $zero, $f0
  /* 155BF8 80136A58 3C0144E1 */       lui $at, (0x44E10000 >> 16) # 1800.0
  /* 155BFC 80136A5C 44813000 */      mtc1 $at, $f6 # 1800.0 to cop1
  /* 155C00 80136A60 3C013F80 */       lui $at, (0x3F800000 >> 16) # 1.0
  /* 155C04 80136A64 44814000 */      mtc1 $at, $f8 # 1.0 to cop1
  /* 155C08 80136A68 E460003C */      swc1 $f0, 0x3c($v1)
  /* 155C0C 80136A6C E4600040 */      swc1 $f0, 0x40($v1)
  /* 155C10 80136A70 E4600048 */      swc1 $f0, 0x48($v1)
  /* 155C14 80136A74 E460004C */      swc1 $f0, 0x4c($v1)
  /* 155C18 80136A78 E4600050 */      swc1 $f0, 0x50($v1)
  /* 155C1C 80136A7C E4600054 */      swc1 $f0, 0x54($v1)
  /* 155C20 80136A80 E460005C */      swc1 $f0, 0x5c($v1)
  /* 155C24 80136A84 E4660044 */      swc1 $f6, 0x44($v1)
  /* 155C28 80136A88 E4680058 */      swc1 $f8, 0x58($v1)
  /* 155C2C 80136A8C 8FBF003C */        lw $ra, 0x3c($sp)
  /* 155C30 80136A90 27BD0048 */     addiu $sp, $sp, 0x48
  /* 155C34 80136A94 03E00008 */        jr $ra
  /* 155C38 80136A98 00000000 */       nop

glabel mnResultsSetKOs
  /* 155C3C 80136A9C 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 155C40 80136AA0 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 155C44 80136AA4 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 155C48 80136AA8 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 155C4C 80136AAC 11C00005 */      beqz $t6, .L80136AC4
  /* 155C50 80136AB0 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 155C54 80136AB4 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x34))
  /* 155C58 80136AB8 8DEF4D3C */        lw $t7, %lo((gTransferBattleState + 0x34))($t7)
  /* 155C5C 80136ABC 3C018014 */       lui $at, %hi(gMNResultsKOs)
  /* 155C60 80136AC0 AC2F9B80 */        sw $t7, %lo(gMNResultsKOs)($at)
  .L80136AC4:
  /* 155C64 80136AC4 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 155C68 80136AC8 3C19800A */       lui $t9, %hi((gTransferBattleState + 0xA8))
  /* 155C6C 80136ACC 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x11C))
  /* 155C70 80136AD0 13000004 */      beqz $t8, .L80136AE4
  /* 155C74 80136AD4 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x190))
  /* 155C78 80136AD8 8F394DB0 */        lw $t9, %lo((gTransferBattleState + 0xA8))($t9)
  /* 155C7C 80136ADC 3C018014 */       lui $at, %hi(D_ovl31_80139B84)
  /* 155C80 80136AE0 AC399B84 */        sw $t9, %lo(D_ovl31_80139B84)($at)
  .L80136AE4:
  /* 155C84 80136AE4 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 155C88 80136AE8 11000004 */      beqz $t0, .L80136AFC
  /* 155C8C 80136AEC 00000000 */       nop
  /* 155C90 80136AF0 8D294E24 */        lw $t1, %lo((gTransferBattleState + 0x11C))($t1)
  /* 155C94 80136AF4 3C018014 */       lui $at, %hi(D_ovl31_80139B88)
  /* 155C98 80136AF8 AC299B88 */        sw $t1, %lo(D_ovl31_80139B88)($at)
  .L80136AFC:
  /* 155C9C 80136AFC 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 155CA0 80136B00 11400004 */      beqz $t2, .L80136B14
  /* 155CA4 80136B04 00000000 */       nop
  /* 155CA8 80136B08 8D6B4E98 */        lw $t3, %lo((gTransferBattleState + 0x190))($t3)
  /* 155CAC 80136B0C 3C018014 */       lui $at, %hi(D_ovl31_80139B8C)
  /* 155CB0 80136B10 AC2B9B8C */        sw $t3, %lo(D_ovl31_80139B8C)($at)
  .L80136B14:
  /* 155CB4 80136B14 03E00008 */        jr $ra
  /* 155CB8 80136B18 00000000 */       nop

glabel mnResultsSetTKOs
  /* 155CBC 80136B1C 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 155CC0 80136B20 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 155CC4 80136B24 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 155CC8 80136B28 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 155CCC 80136B2C 11C00005 */      beqz $t6, .L80136B44
  /* 155CD0 80136B30 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 155CD4 80136B34 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x30))
  /* 155CD8 80136B38 8DEF4D38 */        lw $t7, %lo((gTransferBattleState + 0x30))($t7)
  /* 155CDC 80136B3C 3C018014 */       lui $at, %hi(gMNResultsTKOs)
  /* 155CE0 80136B40 AC2F9B90 */        sw $t7, %lo(gMNResultsTKOs)($at)
  .L80136B44:
  /* 155CE4 80136B44 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 155CE8 80136B48 3C19800A */       lui $t9, %hi((gTransferBattleState + 0xA4))
  /* 155CEC 80136B4C 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x118))
  /* 155CF0 80136B50 13000004 */      beqz $t8, .L80136B64
  /* 155CF4 80136B54 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x18C))
  /* 155CF8 80136B58 8F394DAC */        lw $t9, %lo((gTransferBattleState + 0xA4))($t9)
  /* 155CFC 80136B5C 3C018014 */       lui $at, %hi(D_ovl31_80139B94)
  /* 155D00 80136B60 AC399B94 */        sw $t9, %lo(D_ovl31_80139B94)($at)
  .L80136B64:
  /* 155D04 80136B64 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 155D08 80136B68 11000004 */      beqz $t0, .L80136B7C
  /* 155D0C 80136B6C 00000000 */       nop
  /* 155D10 80136B70 8D294E20 */        lw $t1, %lo((gTransferBattleState + 0x118))($t1)
  /* 155D14 80136B74 3C018014 */       lui $at, %hi(D_ovl31_80139B98)
  /* 155D18 80136B78 AC299B98 */        sw $t1, %lo(D_ovl31_80139B98)($at)
  .L80136B7C:
  /* 155D1C 80136B7C 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 155D20 80136B80 11400004 */      beqz $t2, .L80136B94
  /* 155D24 80136B84 00000000 */       nop
  /* 155D28 80136B88 8D6B4E94 */        lw $t3, %lo((gTransferBattleState + 0x18C))($t3)
  /* 155D2C 80136B8C 3C018014 */       lui $at, %hi(D_ovl31_80139B9C)
  /* 155D30 80136B90 AC2B9B9C */        sw $t3, %lo(D_ovl31_80139B9C)($at)
  .L80136B94:
  /* 155D34 80136B94 03E00008 */        jr $ra
  /* 155D38 80136B98 00000000 */       nop

glabel mnResultsSetPoints
  /* 155D3C 80136B9C 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 155D40 80136BA0 AFB10018 */        sw $s1, 0x18($sp)
  /* 155D44 80136BA4 AFB30020 */        sw $s3, 0x20($sp)
  /* 155D48 80136BA8 AFB00014 */        sw $s0, 0x14($sp)
  /* 155D4C 80136BAC 3C118014 */       lui $s1, %hi(gMNResultsPoints)
  /* 155D50 80136BB0 AFBF0024 */        sw $ra, 0x24($sp)
  /* 155D54 80136BB4 AFB2001C */        sw $s2, 0x1c($sp)
  /* 155D58 80136BB8 26319BA0 */     addiu $s1, $s1, %lo(gMNResultsPoints)
  /* 155D5C 80136BBC 00008025 */        or $s0, $zero, $zero
  /* 155D60 80136BC0 24130004 */     addiu $s3, $zero, 4
  .L80136BC4:
  /* 155D64 80136BC4 0C04D59C */       jal mnResultsGetKOs
  /* 155D68 80136BC8 02002025 */        or $a0, $s0, $zero
  /* 155D6C 80136BCC 00409025 */        or $s2, $v0, $zero
  /* 155D70 80136BD0 0C04D631 */       jal mnResultsGetTKOs
  /* 155D74 80136BD4 02002025 */        or $a0, $s0, $zero
  /* 155D78 80136BD8 26100001 */     addiu $s0, $s0, 1
  /* 155D7C 80136BDC 02427023 */      subu $t6, $s2, $v0
  /* 155D80 80136BE0 26310004 */     addiu $s1, $s1, 4
  /* 155D84 80136BE4 1613FFF7 */       bne $s0, $s3, .L80136BC4
  /* 155D88 80136BE8 AE2EFFFC */        sw $t6, -4($s1) # gMNResultsPoints + -4
  /* 155D8C 80136BEC 8FBF0024 */        lw $ra, 0x24($sp)
  /* 155D90 80136BF0 8FB00014 */        lw $s0, 0x14($sp)
  /* 155D94 80136BF4 8FB10018 */        lw $s1, 0x18($sp)
  /* 155D98 80136BF8 8FB2001C */        lw $s2, 0x1c($sp)
  /* 155D9C 80136BFC 8FB30020 */        lw $s3, 0x20($sp)
  /* 155DA0 80136C00 03E00008 */        jr $ra
  /* 155DA4 80136C04 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnResultsGetKOsMinusTKOs
  /* 155DA8 80136C08 00041880 */       sll $v1, $a0, 2
  /* 155DAC 80136C0C 3C0E8014 */       lui $t6, %hi(gMNResultsKOs)
  /* 155DB0 80136C10 3C0F8014 */       lui $t7, %hi(gMNResultsTKOs)
  /* 155DB4 80136C14 01E37821 */      addu $t7, $t7, $v1
  /* 155DB8 80136C18 01C37021 */      addu $t6, $t6, $v1
  /* 155DBC 80136C1C 8DCE9B80 */        lw $t6, %lo(gMNResultsKOs)($t6)
  /* 155DC0 80136C20 8DEF9B90 */        lw $t7, %lo(gMNResultsTKOs)($t7)
  /* 155DC4 80136C24 03E00008 */        jr $ra
  /* 155DC8 80136C28 01CF1023 */      subu $v0, $t6, $t7

glabel mnResultsOrderResults
  /* 155DCC 80136C2C 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 155DD0 80136C30 00803025 */        or $a2, $a0, $zero
  /* 155DD4 80136C34 18A0003A */      blez $a1, .L80136D20
  /* 155DD8 80136C38 00001025 */        or $v0, $zero, $zero
  /* 155DDC 80136C3C 3C0A800A */       lui $t2, %hi(gSceneData)
  /* 155DE0 80136C40 254A4AD0 */     addiu $t2, $t2, %lo(gSceneData)
  /* 155DE4 80136C44 27AB0024 */     addiu $t3, $sp, 0x24
  .L80136C48:
  /* 155DE8 80136C48 24440001 */     addiu $a0, $v0, 1
  /* 155DEC 80136C4C 0085082A */       slt $at, $a0, $a1
  /* 155DF0 80136C50 10200031 */      beqz $at, .L80136D18
  /* 155DF4 80136C54 00801825 */        or $v1, $a0, $zero
  /* 155DF8 80136C58 00027080 */       sll $t6, $v0, 2
  /* 155DFC 80136C5C 00037880 */       sll $t7, $v1, 2
  /* 155E00 80136C60 0005C080 */       sll $t8, $a1, 2
  /* 155E04 80136C64 0305C023 */      subu $t8, $t8, $a1
  /* 155E08 80136C68 01E37823 */      subu $t7, $t7, $v1
  /* 155E0C 80136C6C 01C27023 */      subu $t6, $t6, $v0
  /* 155E10 80136C70 000E7080 */       sll $t6, $t6, 2
  /* 155E14 80136C74 000F7880 */       sll $t7, $t7, 2
  /* 155E18 80136C78 0018C080 */       sll $t8, $t8, 2
  /* 155E1C 80136C7C 03064821 */      addu $t1, $t8, $a2
  /* 155E20 80136C80 00CF4021 */      addu $t0, $a2, $t7
  /* 155E24 80136C84 00CE3821 */      addu $a3, $a2, $t6
  /* 155E28 80136C88 8CE20000 */        lw $v0, ($a3)
  .L80136C8C:
  /* 155E2C 80136C8C 8D030000 */        lw $v1, ($t0)
  /* 155E30 80136C90 0043082A */       slt $at, $v0, $v1
  /* 155E34 80136C94 5420000C */      bnel $at, $zero, .L80136CC8
  /* 155E38 80136C98 8CEF0000 */        lw $t7, ($a3)
  /* 155E3C 80136C9C 91590010 */       lbu $t9, 0x10($t2) # gSceneData + 16
  /* 155E40 80136CA0 5320001B */      beql $t9, $zero, .L80136D10
  /* 155E44 80136CA4 2508000C */     addiu $t0, $t0, 0xc
  /* 155E48 80136CA8 54430019 */      bnel $v0, $v1, .L80136D10
  /* 155E4C 80136CAC 2508000C */     addiu $t0, $t0, 0xc
  /* 155E50 80136CB0 8D0C0004 */        lw $t4, 4($t0)
  /* 155E54 80136CB4 8CED0004 */        lw $t5, 4($a3)
  /* 155E58 80136CB8 018D082A */       slt $at, $t4, $t5
  /* 155E5C 80136CBC 50200014 */      beql $at, $zero, .L80136D10
  /* 155E60 80136CC0 2508000C */     addiu $t0, $t0, 0xc
  /* 155E64 80136CC4 8CEF0000 */        lw $t7, ($a3)
  .L80136CC8:
  /* 155E68 80136CC8 AD6F0000 */        sw $t7, ($t3)
  /* 155E6C 80136CCC 8CEE0004 */        lw $t6, 4($a3)
  /* 155E70 80136CD0 AD6E0004 */        sw $t6, 4($t3)
  /* 155E74 80136CD4 8CEF0008 */        lw $t7, 8($a3)
  /* 155E78 80136CD8 AD6F0008 */        sw $t7, 8($t3)
  /* 155E7C 80136CDC 8D190000 */        lw $t9, ($t0)
  /* 155E80 80136CE0 ACF90000 */        sw $t9, ($a3)
  /* 155E84 80136CE4 8D180004 */        lw $t8, 4($t0)
  /* 155E88 80136CE8 ACF80004 */        sw $t8, 4($a3)
  /* 155E8C 80136CEC 8D190008 */        lw $t9, 8($t0)
  /* 155E90 80136CF0 ACF90008 */        sw $t9, 8($a3)
  /* 155E94 80136CF4 8D6D0000 */        lw $t5, ($t3)
  /* 155E98 80136CF8 AD0D0000 */        sw $t5, ($t0)
  /* 155E9C 80136CFC 8D6C0004 */        lw $t4, 4($t3)
  /* 155EA0 80136D00 AD0C0004 */        sw $t4, 4($t0)
  /* 155EA4 80136D04 8D6D0008 */        lw $t5, 8($t3)
  /* 155EA8 80136D08 AD0D0008 */        sw $t5, 8($t0)
  /* 155EAC 80136D0C 2508000C */     addiu $t0, $t0, 0xc
  .L80136D10:
  /* 155EB0 80136D10 5509FFDE */      bnel $t0, $t1, .L80136C8C
  /* 155EB4 80136D14 8CE20000 */        lw $v0, ($a3)
  .L80136D18:
  /* 155EB8 80136D18 1485FFCB */       bne $a0, $a1, .L80136C48
  /* 155EBC 80136D1C 00801025 */        or $v0, $a0, $zero
  .L80136D20:
  /* 155EC0 80136D20 03E00008 */        jr $ra
  /* 155EC4 80136D24 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnResultsSetPlacementFFA
  /* 155EC8 80136D28 27BDFF80 */     addiu $sp, $sp, -0x80
  /* 155ECC 80136D2C AFB30020 */        sw $s3, 0x20($sp)
  /* 155ED0 80136D30 AFB10018 */        sw $s1, 0x18($sp)
  /* 155ED4 80136D34 3C038014 */       lui $v1, %hi(gMNResultsIsPresent)
  /* 155ED8 80136D38 AFBF0024 */        sw $ra, 0x24($sp)
  /* 155EDC 80136D3C AFB2001C */        sw $s2, 0x1c($sp)
  /* 155EE0 80136D40 AFB00014 */        sw $s0, 0x14($sp)
  /* 155EE4 80136D44 24639BD0 */     addiu $v1, $v1, %lo(gMNResultsIsPresent)
  /* 155EE8 80136D48 00008825 */        or $s1, $zero, $zero
  /* 155EEC 80136D4C 00009825 */        or $s3, $zero, $zero
  .L80136D50:
  /* 155EF0 80136D50 8C6E0000 */        lw $t6, ($v1) # gMNResultsIsPresent + 0
  /* 155EF4 80136D54 00137880 */       sll $t7, $s3, 2
  /* 155EF8 80136D58 01F37823 */      subu $t7, $t7, $s3
  /* 155EFC 80136D5C 11C00014 */      beqz $t6, .L80136DB0
  /* 155F00 80136D60 02202025 */        or $a0, $s1, $zero
  /* 155F04 80136D64 0011C8C0 */       sll $t9, $s1, 3
  /* 155F08 80136D68 0331C823 */      subu $t9, $t9, $s1
  /* 155F0C 80136D6C 0019C880 */       sll $t9, $t9, 2
  /* 155F10 80136D70 0331C821 */      addu $t9, $t9, $s1
  /* 155F14 80136D74 3C0A800A */       lui $t2, %hi(D_800A4EF8)
  /* 155F18 80136D78 254A4EF8 */     addiu $t2, $t2, %lo(D_800A4EF8)
  /* 155F1C 80136D7C 0019C880 */       sll $t9, $t9, 2
  /* 155F20 80136D80 000F7880 */       sll $t7, $t7, 2
  /* 155F24 80136D84 27B80050 */     addiu $t8, $sp, 0x50
  /* 155F28 80136D88 01F88021 */      addu $s0, $t7, $t8
  /* 155F2C 80136D8C 032A9021 */      addu $s2, $t9, $t2
  /* 155F30 80136D90 0C04DB02 */       jal mnResultsGetKOsMinusTKOs
  /* 155F34 80136D94 AFA30034 */        sw $v1, 0x34($sp)
  /* 155F38 80136D98 924B002D */       lbu $t3, 0x2d($s2)
  /* 155F3C 80136D9C 8FA30034 */        lw $v1, 0x34($sp)
  /* 155F40 80136DA0 AE020000 */        sw $v0, ($s0)
  /* 155F44 80136DA4 AE110008 */        sw $s1, 8($s0)
  /* 155F48 80136DA8 26730001 */     addiu $s3, $s3, 1
  /* 155F4C 80136DAC AE0B0004 */        sw $t3, 4($s0)
  .L80136DB0:
  /* 155F50 80136DB0 26310001 */     addiu $s1, $s1, 1
  /* 155F54 80136DB4 2A210004 */      slti $at, $s1, 4
  /* 155F58 80136DB8 1420FFE5 */      bnez $at, .L80136D50
  /* 155F5C 80136DBC 24630004 */     addiu $v1, $v1, 4
  /* 155F60 80136DC0 27A40050 */     addiu $a0, $sp, 0x50
  /* 155F64 80136DC4 0C04DB0B */       jal mnResultsOrderResults
  /* 155F68 80136DC8 02602825 */        or $a1, $s3, $zero
  /* 155F6C 80136DCC 00008825 */        or $s1, $zero, $zero
  /* 155F70 80136DD0 00002025 */        or $a0, $zero, $zero
  /* 155F74 80136DD4 8FA50050 */        lw $a1, 0x50($sp)
  /* 155F78 80136DD8 1A600070 */      blez $s3, .L80136F9C
  /* 155F7C 80136DDC 8FA60054 */        lw $a2, 0x54($sp)
  /* 155F80 80136DE0 32630003 */      andi $v1, $s3, 3
  /* 155F84 80136DE4 1060001E */      beqz $v1, .L80136E60
  /* 155F88 80136DE8 00604825 */        or $t1, $v1, $zero
  /* 155F8C 80136DEC 00006080 */       sll $t4, $zero, 2
  /* 155F90 80136DF0 01806023 */      subu $t4, $t4, $zero
  /* 155F94 80136DF4 000C6080 */       sll $t4, $t4, 2
  /* 155F98 80136DF8 27AD0050 */     addiu $t5, $sp, 0x50
  /* 155F9C 80136DFC 3C088014 */       lui $t0, %hi(gMNResultsPlacement)
  /* 155FA0 80136E00 3C07800A */       lui $a3, %hi(gSceneData)
  /* 155FA4 80136E04 24E74AD0 */     addiu $a3, $a3, %lo(gSceneData)
  /* 155FA8 80136E08 25089BB0 */     addiu $t0, $t0, %lo(gMNResultsPlacement)
  /* 155FAC 80136E0C 018D1021 */      addu $v0, $t4, $t5
  .L80136E10:
  /* 155FB0 80136E10 8C430000 */        lw $v1, ($v0)
  /* 155FB4 80136E14 54A30008 */      bnel $a1, $v1, .L80136E38
  /* 155FB8 80136E18 24840001 */     addiu $a0, $a0, 1
  /* 155FBC 80136E1C 90EE0010 */       lbu $t6, 0x10($a3) # gSceneData + 16
  /* 155FC0 80136E20 51C00008 */      beql $t6, $zero, .L80136E44
  /* 155FC4 80136E24 8C580008 */        lw $t8, 8($v0)
  /* 155FC8 80136E28 8C4F0004 */        lw $t7, 4($v0)
  /* 155FCC 80136E2C 50CF0005 */      beql $a2, $t7, .L80136E44
  /* 155FD0 80136E30 8C580008 */        lw $t8, 8($v0)
  /* 155FD4 80136E34 24840001 */     addiu $a0, $a0, 1
  .L80136E38:
  /* 155FD8 80136E38 00602825 */        or $a1, $v1, $zero
  /* 155FDC 80136E3C 8C460004 */        lw $a2, 4($v0)
  /* 155FE0 80136E40 8C580008 */        lw $t8, 8($v0)
  .L80136E44:
  /* 155FE4 80136E44 26310001 */     addiu $s1, $s1, 1
  /* 155FE8 80136E48 2442000C */     addiu $v0, $v0, 0xc
  /* 155FEC 80136E4C 0018C880 */       sll $t9, $t8, 2
  /* 155FF0 80136E50 01195021 */      addu $t2, $t0, $t9
  /* 155FF4 80136E54 1531FFEE */       bne $t1, $s1, .L80136E10
  /* 155FF8 80136E58 AD440000 */        sw $a0, ($t2)
  /* 155FFC 80136E5C 1233004F */       beq $s1, $s3, .L80136F9C
  .L80136E60:
  /* 156000 80136E60 00115880 */       sll $t3, $s1, 2
  /* 156004 80136E64 00136880 */       sll $t5, $s3, 2
  /* 156008 80136E68 01B36823 */      subu $t5, $t5, $s3
  /* 15600C 80136E6C 01715823 */      subu $t3, $t3, $s1
  /* 156010 80136E70 27AC0050 */     addiu $t4, $sp, 0x50
  /* 156014 80136E74 000B5880 */       sll $t3, $t3, 2
  /* 156018 80136E78 000D6880 */       sll $t5, $t5, 2
  /* 15601C 80136E7C 3C07800A */       lui $a3, %hi(gSceneData)
  /* 156020 80136E80 3C088014 */       lui $t0, %hi(gMNResultsPlacement)
  /* 156024 80136E84 25089BB0 */     addiu $t0, $t0, %lo(gMNResultsPlacement)
  /* 156028 80136E88 24E74AD0 */     addiu $a3, $a3, %lo(gSceneData)
  /* 15602C 80136E8C 01AC4821 */      addu $t1, $t5, $t4
  /* 156030 80136E90 016C1021 */      addu $v0, $t3, $t4
  .L80136E94:
  /* 156034 80136E94 8C430000 */        lw $v1, ($v0)
  /* 156038 80136E98 54A30008 */      bnel $a1, $v1, .L80136EBC
  /* 15603C 80136E9C 24840001 */     addiu $a0, $a0, 1
  /* 156040 80136EA0 90EE0010 */       lbu $t6, 0x10($a3) # gSceneData + 16
  /* 156044 80136EA4 51C00008 */      beql $t6, $zero, .L80136EC8
  /* 156048 80136EA8 8C580008 */        lw $t8, 8($v0)
  /* 15604C 80136EAC 8C4F0004 */        lw $t7, 4($v0)
  /* 156050 80136EB0 50CF0005 */      beql $a2, $t7, .L80136EC8
  /* 156054 80136EB4 8C580008 */        lw $t8, 8($v0)
  /* 156058 80136EB8 24840001 */     addiu $a0, $a0, 1
  .L80136EBC:
  /* 15605C 80136EBC 00602825 */        or $a1, $v1, $zero
  /* 156060 80136EC0 8C460004 */        lw $a2, 4($v0)
  /* 156064 80136EC4 8C580008 */        lw $t8, 8($v0)
  .L80136EC8:
  /* 156068 80136EC8 0018C880 */       sll $t9, $t8, 2
  /* 15606C 80136ECC 01195021 */      addu $t2, $t0, $t9
  /* 156070 80136ED0 AD440000 */        sw $a0, ($t2)
  /* 156074 80136ED4 8C43000C */        lw $v1, 0xc($v0)
  /* 156078 80136ED8 54A30008 */      bnel $a1, $v1, .L80136EFC
  /* 15607C 80136EDC 24840001 */     addiu $a0, $a0, 1
  /* 156080 80136EE0 90EB0010 */       lbu $t3, 0x10($a3) # gSceneData + 16
  /* 156084 80136EE4 51600008 */      beql $t3, $zero, .L80136F08
  /* 156088 80136EE8 8C4C0014 */        lw $t4, 0x14($v0)
  /* 15608C 80136EEC 8C4D0010 */        lw $t5, 0x10($v0)
  /* 156090 80136EF0 50CD0005 */      beql $a2, $t5, .L80136F08
  /* 156094 80136EF4 8C4C0014 */        lw $t4, 0x14($v0)
  /* 156098 80136EF8 24840001 */     addiu $a0, $a0, 1
  .L80136EFC:
  /* 15609C 80136EFC 00602825 */        or $a1, $v1, $zero
  /* 1560A0 80136F00 8C460010 */        lw $a2, 0x10($v0)
  /* 1560A4 80136F04 8C4C0014 */        lw $t4, 0x14($v0)
  .L80136F08:
  /* 1560A8 80136F08 000C7080 */       sll $t6, $t4, 2
  /* 1560AC 80136F0C 010E7821 */      addu $t7, $t0, $t6
  /* 1560B0 80136F10 ADE40000 */        sw $a0, ($t7)
  /* 1560B4 80136F14 8C430018 */        lw $v1, 0x18($v0)
  /* 1560B8 80136F18 54A30008 */      bnel $a1, $v1, .L80136F3C
  /* 1560BC 80136F1C 24840001 */     addiu $a0, $a0, 1
  /* 1560C0 80136F20 90F80010 */       lbu $t8, 0x10($a3) # gSceneData + 16
  /* 1560C4 80136F24 53000008 */      beql $t8, $zero, .L80136F48
  /* 1560C8 80136F28 8C4A0020 */        lw $t2, 0x20($v0)
  /* 1560CC 80136F2C 8C59001C */        lw $t9, 0x1c($v0)
  /* 1560D0 80136F30 50D90005 */      beql $a2, $t9, .L80136F48
  /* 1560D4 80136F34 8C4A0020 */        lw $t2, 0x20($v0)
  /* 1560D8 80136F38 24840001 */     addiu $a0, $a0, 1
  .L80136F3C:
  /* 1560DC 80136F3C 00602825 */        or $a1, $v1, $zero
  /* 1560E0 80136F40 8C46001C */        lw $a2, 0x1c($v0)
  /* 1560E4 80136F44 8C4A0020 */        lw $t2, 0x20($v0)
  .L80136F48:
  /* 1560E8 80136F48 000A5880 */       sll $t3, $t2, 2
  /* 1560EC 80136F4C 010B6821 */      addu $t5, $t0, $t3
  /* 1560F0 80136F50 ADA40000 */        sw $a0, ($t5)
  /* 1560F4 80136F54 8C430024 */        lw $v1, 0x24($v0)
  /* 1560F8 80136F58 54A30008 */      bnel $a1, $v1, .L80136F7C
  /* 1560FC 80136F5C 24840001 */     addiu $a0, $a0, 1
  /* 156100 80136F60 90EC0010 */       lbu $t4, 0x10($a3) # gSceneData + 16
  /* 156104 80136F64 51800008 */      beql $t4, $zero, .L80136F88
  /* 156108 80136F68 8C4F002C */        lw $t7, 0x2c($v0)
  /* 15610C 80136F6C 8C4E0028 */        lw $t6, 0x28($v0)
  /* 156110 80136F70 50CE0005 */      beql $a2, $t6, .L80136F88
  /* 156114 80136F74 8C4F002C */        lw $t7, 0x2c($v0)
  /* 156118 80136F78 24840001 */     addiu $a0, $a0, 1
  .L80136F7C:
  /* 15611C 80136F7C 00602825 */        or $a1, $v1, $zero
  /* 156120 80136F80 8C460028 */        lw $a2, 0x28($v0)
  /* 156124 80136F84 8C4F002C */        lw $t7, 0x2c($v0)
  .L80136F88:
  /* 156128 80136F88 24420030 */     addiu $v0, $v0, 0x30
  /* 15612C 80136F8C 000FC080 */       sll $t8, $t7, 2
  /* 156130 80136F90 0118C821 */      addu $t9, $t0, $t8
  /* 156134 80136F94 1449FFBF */       bne $v0, $t1, .L80136E94
  /* 156138 80136F98 AF240000 */        sw $a0, ($t9)
  .L80136F9C:
  /* 15613C 80136F9C 8FBF0024 */        lw $ra, 0x24($sp)
  /* 156140 80136FA0 8FB00014 */        lw $s0, 0x14($sp)
  /* 156144 80136FA4 8FB10018 */        lw $s1, 0x18($sp)
  /* 156148 80136FA8 8FB2001C */        lw $s2, 0x1c($sp)
  /* 15614C 80136FAC 8FB30020 */        lw $s3, 0x20($sp)
  /* 156150 80136FB0 03E00008 */        jr $ra
  /* 156154 80136FB4 27BD0080 */     addiu $sp, $sp, 0x80

glabel mnResultsGetTeamKOsMinusTKOs
  /* 156158 80136FB8 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 15615C 80136FBC AFB30024 */        sw $s3, 0x24($sp)
  /* 156160 80136FC0 AFB1001C */        sw $s1, 0x1c($sp)
  /* 156164 80136FC4 AFB60030 */        sw $s6, 0x30($sp)
  /* 156168 80136FC8 AFB5002C */        sw $s5, 0x2c($sp)
  /* 15616C 80136FCC AFB40028 */        sw $s4, 0x28($sp)
  /* 156170 80136FD0 AFB20020 */        sw $s2, 0x20($sp)
  /* 156174 80136FD4 AFB00018 */        sw $s0, 0x18($sp)
  /* 156178 80136FD8 3C118014 */       lui $s1, %hi(gMNResultsIsPresent)
  /* 15617C 80136FDC 3C13800A */       lui $s3, %hi(gTransferBattleState)
  /* 156180 80136FE0 0080B025 */        or $s6, $a0, $zero
  /* 156184 80136FE4 AFBF0034 */        sw $ra, 0x34($sp)
  /* 156188 80136FE8 00009025 */        or $s2, $zero, $zero
  /* 15618C 80136FEC 26734D08 */     addiu $s3, $s3, %lo(gTransferBattleState)
  /* 156190 80136FF0 26319BD0 */     addiu $s1, $s1, %lo(gMNResultsIsPresent)
  /* 156194 80136FF4 00008025 */        or $s0, $zero, $zero
  /* 156198 80136FF8 24140074 */     addiu $s4, $zero, 0x74
  /* 15619C 80136FFC 24150004 */     addiu $s5, $zero, 4
  .L80137000:
  /* 1561A0 80137000 8E2E0000 */        lw $t6, ($s1) # gMNResultsIsPresent + 0
  /* 1561A4 80137004 51C0000B */      beql $t6, $zero, .L80137034
  /* 1561A8 80137008 26100001 */     addiu $s0, $s0, 1
  /* 1561AC 8013700C 02140019 */     multu $s0, $s4
  /* 1561B0 80137010 00007812 */      mflo $t7
  /* 1561B4 80137014 026FC021 */      addu $t8, $s3, $t7
  /* 1561B8 80137018 93190024 */       lbu $t9, 0x24($t8)
  /* 1561BC 8013701C 56D90005 */      bnel $s6, $t9, .L80137034
  /* 1561C0 80137020 26100001 */     addiu $s0, $s0, 1
  /* 1561C4 80137024 0C04DB02 */       jal mnResultsGetKOsMinusTKOs
  /* 1561C8 80137028 02002025 */        or $a0, $s0, $zero
  /* 1561CC 8013702C 02429021 */      addu $s2, $s2, $v0
  /* 1561D0 80137030 26100001 */     addiu $s0, $s0, 1
  .L80137034:
  /* 1561D4 80137034 1615FFF2 */       bne $s0, $s5, .L80137000
  /* 1561D8 80137038 26310004 */     addiu $s1, $s1, 4
  /* 1561DC 8013703C 8FBF0034 */        lw $ra, 0x34($sp)
  /* 1561E0 80137040 02401025 */        or $v0, $s2, $zero
  /* 1561E4 80137044 8FB20020 */        lw $s2, 0x20($sp)
  /* 1561E8 80137048 8FB00018 */        lw $s0, 0x18($sp)
  /* 1561EC 8013704C 8FB1001C */        lw $s1, 0x1c($sp)
  /* 1561F0 80137050 8FB30024 */        lw $s3, 0x24($sp)
  /* 1561F4 80137054 8FB40028 */        lw $s4, 0x28($sp)
  /* 1561F8 80137058 8FB5002C */        lw $s5, 0x2c($sp)
  /* 1561FC 8013705C 8FB60030 */        lw $s6, 0x30($sp)
  /* 156200 80137060 03E00008 */        jr $ra
  /* 156204 80137064 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnResultsSetTeamPlacement
  /* 156208 80137068 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 15620C 8013706C 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 156210 80137070 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 156214 80137074 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 156218 80137078 11C00007 */      beqz $t6, .L80137098
  /* 15621C 8013707C 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 156220 80137080 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x24))
  /* 156224 80137084 91EF4D2C */       lbu $t7, %lo((gTransferBattleState + 0x24))($t7)
  /* 156228 80137088 3C018014 */       lui $at, %hi(gMNResultsPlacement)
  /* 15622C 8013708C 148F0002 */       bne $a0, $t7, .L80137098
  /* 156230 80137090 00000000 */       nop
  /* 156234 80137094 AC259BB0 */        sw $a1, %lo(gMNResultsPlacement)($at)
  .L80137098:
  /* 156238 80137098 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 15623C 8013709C 3C19800A */       lui $t9, %hi((gTransferBattleState + 0x98))
  /* 156240 801370A0 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x10C))
  /* 156244 801370A4 13000006 */      beqz $t8, .L801370C0
  /* 156248 801370A8 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x180))
  /* 15624C 801370AC 93394DA0 */       lbu $t9, %lo((gTransferBattleState + 0x98))($t9)
  /* 156250 801370B0 3C018014 */       lui $at, %hi(D_ovl31_80139BB4)
  /* 156254 801370B4 14990002 */       bne $a0, $t9, .L801370C0
  /* 156258 801370B8 00000000 */       nop
  /* 15625C 801370BC AC259BB4 */        sw $a1, %lo(D_ovl31_80139BB4)($at)
  .L801370C0:
  /* 156260 801370C0 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 156264 801370C4 11000006 */      beqz $t0, .L801370E0
  /* 156268 801370C8 00000000 */       nop
  /* 15626C 801370CC 91294E14 */       lbu $t1, %lo((gTransferBattleState + 0x10C))($t1)
  /* 156270 801370D0 3C018014 */       lui $at, %hi(D_ovl31_80139BB8)
  /* 156274 801370D4 14890002 */       bne $a0, $t1, .L801370E0
  /* 156278 801370D8 00000000 */       nop
  /* 15627C 801370DC AC259BB8 */        sw $a1, %lo(D_ovl31_80139BB8)($at)
  .L801370E0:
  /* 156280 801370E0 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 156284 801370E4 11400006 */      beqz $t2, .L80137100
  /* 156288 801370E8 00000000 */       nop
  /* 15628C 801370EC 916B4E88 */       lbu $t3, %lo((gTransferBattleState + 0x180))($t3)
  /* 156290 801370F0 3C018014 */       lui $at, %hi(D_ovl31_80139BBC)
  /* 156294 801370F4 148B0002 */       bne $a0, $t3, .L80137100
  /* 156298 801370F8 00000000 */       nop
  /* 15629C 801370FC AC259BBC */        sw $a1, %lo(D_ovl31_80139BBC)($at)
  .L80137100:
  /* 1562A0 80137100 03E00008 */        jr $ra
  /* 1562A4 80137104 00000000 */       nop

glabel mnResultsGetFirstPortForTeam
  /* 1562A8 80137108 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x24))
  /* 1562AC 8013710C 91CE4D2C */       lbu $t6, %lo((gTransferBattleState + 0x24))($t6)
  /* 1562B0 80137110 3C18800A */       lui $t8, 0x800a
  /* 1562B4 80137114 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x22))
  /* 1562B8 80137118 148E0007 */       bne $a0, $t6, .L80137138
  /* 1562BC 8013711C 00000000 */       nop
  /* 1562C0 80137120 91EF4D2A */       lbu $t7, %lo((gTransferBattleState + 0x22))($t7)
  /* 1562C4 80137124 24020002 */     addiu $v0, $zero, 2
  /* 1562C8 80137128 104F0003 */       beq $v0, $t7, .L80137138
  /* 1562CC 8013712C 00000000 */       nop
  /* 1562D0 80137130 03E00008 */        jr $ra
  /* 1562D4 80137134 24020001 */     addiu $v0, $zero, 1

  .L80137138:
  /* 1562D8 80137138 93184DA0 */       lbu $t8, 0x4da0($t8)
  /* 1562DC 8013713C 3C19800A */       lui $t9, %hi((gTransferBattleState + 0x96))
  /* 1562E0 80137140 3C08800A */       lui $t0, 0x800a
  /* 1562E4 80137144 14980006 */       bne $a0, $t8, .L80137160
  /* 1562E8 80137148 24020002 */     addiu $v0, $zero, 2
  /* 1562EC 8013714C 93394D9E */       lbu $t9, %lo((gTransferBattleState + 0x96))($t9)
  /* 1562F0 80137150 10590003 */       beq $v0, $t9, .L80137160
  /* 1562F4 80137154 00000000 */       nop
  /* 1562F8 80137158 03E00008 */        jr $ra
  /* 1562FC 8013715C 24020002 */     addiu $v0, $zero, 2

  .L80137160:
  /* 156300 80137160 91084E14 */       lbu $t0, 0x4e14($t0)
  /* 156304 80137164 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x10A))
  /* 156308 80137168 3C0A800A */       lui $t2, 0x800a
  /* 15630C 8013716C 14880006 */       bne $a0, $t0, .L80137188
  /* 156310 80137170 00000000 */       nop
  /* 156314 80137174 91294E12 */       lbu $t1, %lo((gTransferBattleState + 0x10A))($t1)
  /* 156318 80137178 10490003 */       beq $v0, $t1, .L80137188
  /* 15631C 8013717C 00000000 */       nop
  /* 156320 80137180 03E00008 */        jr $ra
  /* 156324 80137184 24020003 */     addiu $v0, $zero, 3

  .L80137188:
  /* 156328 80137188 914A4E88 */       lbu $t2, 0x4e88($t2)
  /* 15632C 8013718C 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x17E))
  /* 156330 80137190 548A0007 */      bnel $a0, $t2, .L801371B0
  /* 156334 80137194 00001025 */        or $v0, $zero, $zero
  /* 156338 80137198 916B4E86 */       lbu $t3, %lo((gTransferBattleState + 0x17E))($t3)
  /* 15633C 8013719C 504B0004 */      beql $v0, $t3, .L801371B0
  /* 156340 801371A0 00001025 */        or $v0, $zero, $zero
  /* 156344 801371A4 03E00008 */        jr $ra
  /* 156348 801371A8 24020004 */     addiu $v0, $zero, 4

  /* 15634C 801371AC 00001025 */        or $v0, $zero, $zero
  .L801371B0:
  /* 156350 801371B0 03E00008 */        jr $ra
  /* 156354 801371B4 00000000 */       nop

glabel mnResultsSetPlacementTeam
  /* 156358 801371B8 27BDFF70 */     addiu $sp, $sp, -0x90
  /* 15635C 801371BC AFB40028 */        sw $s4, 0x28($sp)
  /* 156360 801371C0 AFB5002C */        sw $s5, 0x2c($sp)
  /* 156364 801371C4 AFB30024 */        sw $s3, 0x24($sp)
  /* 156368 801371C8 AFB1001C */        sw $s1, 0x1c($sp)
  /* 15636C 801371CC 3C14800A */       lui $s4, %hi(D_800A4EF8)
  /* 156370 801371D0 AFBF0034 */        sw $ra, 0x34($sp)
  /* 156374 801371D4 AFB60030 */        sw $s6, 0x30($sp)
  /* 156378 801371D8 AFB20020 */        sw $s2, 0x20($sp)
  /* 15637C 801371DC AFB00018 */        sw $s0, 0x18($sp)
  /* 156380 801371E0 26944EF8 */     addiu $s4, $s4, %lo(D_800A4EF8)
  /* 156384 801371E4 00008825 */        or $s1, $zero, $zero
  /* 156388 801371E8 00009825 */        or $s3, $zero, $zero
  /* 15638C 801371EC 24150074 */     addiu $s5, $zero, 0x74
  .L801371F0:
  /* 156390 801371F0 0C04DC42 */       jal mnResultsGetFirstPortForTeam
  /* 156394 801371F4 02202025 */        or $a0, $s1, $zero
  /* 156398 801371F8 10400010 */      beqz $v0, .L8013723C
  /* 15639C 801371FC 00409025 */        or $s2, $v0, $zero
  /* 1563A0 80137200 00137080 */       sll $t6, $s3, 2
  /* 1563A4 80137204 01D37023 */      subu $t6, $t6, $s3
  /* 1563A8 80137208 000E7080 */       sll $t6, $t6, 2
  /* 1563AC 8013720C 27AF0060 */     addiu $t7, $sp, 0x60
  /* 1563B0 80137210 01CF8021 */      addu $s0, $t6, $t7
  /* 1563B4 80137214 0C04DBEE */       jal mnResultsGetTeamKOsMinusTKOs
  /* 1563B8 80137218 02202025 */        or $a0, $s1, $zero
  /* 1563BC 8013721C 02550019 */     multu $s2, $s5
  /* 1563C0 80137220 AE020000 */        sw $v0, ($s0)
  /* 1563C4 80137224 26730001 */     addiu $s3, $s3, 1
  /* 1563C8 80137228 0000C012 */      mflo $t8
  /* 1563CC 8013722C 0298C821 */      addu $t9, $s4, $t8
  /* 1563D0 80137230 9328FFB9 */       lbu $t0, -0x47($t9)
  /* 1563D4 80137234 AE110008 */        sw $s1, 8($s0)
  /* 1563D8 80137238 AE080004 */        sw $t0, 4($s0)
  .L8013723C:
  /* 1563DC 8013723C 26310001 */     addiu $s1, $s1, 1
  /* 1563E0 80137240 2A210003 */      slti $at, $s1, 3
  /* 1563E4 80137244 1420FFEA */      bnez $at, .L801371F0
  /* 1563E8 80137248 00000000 */       nop
  /* 1563EC 8013724C 27A40060 */     addiu $a0, $sp, 0x60
  /* 1563F0 80137250 0C04DB0B */       jal mnResultsOrderResults
  /* 1563F4 80137254 02602825 */        or $a1, $s3, $zero
  /* 1563F8 80137258 00009025 */        or $s2, $zero, $zero
  /* 1563FC 8013725C 8FB40060 */        lw $s4, 0x60($sp)
  /* 156400 80137260 1A60001A */      blez $s3, .L801372CC
  /* 156404 80137264 8FB50064 */        lw $s5, 0x64($sp)
  /* 156408 80137268 00135080 */       sll $t2, $s3, 2
  /* 15640C 8013726C 01535023 */      subu $t2, $t2, $s3
  /* 156410 80137270 000A5080 */       sll $t2, $t2, 2
  /* 156414 80137274 27B00060 */     addiu $s0, $sp, 0x60
  /* 156418 80137278 3C16800A */       lui $s6, %hi(gSceneData)
  /* 15641C 8013727C 26D64AD0 */     addiu $s6, $s6, %lo(gSceneData)
  /* 156420 80137280 01508821 */      addu $s1, $t2, $s0
  /* 156424 80137284 8E020000 */        lw $v0, ($s0)
  .L80137288:
  /* 156428 80137288 56820008 */      bnel $s4, $v0, .L801372AC
  /* 15642C 8013728C 26520001 */     addiu $s2, $s2, 1
  /* 156430 80137290 92CB0010 */       lbu $t3, 0x10($s6) # gSceneData + 16
  /* 156434 80137294 51600008 */      beql $t3, $zero, .L801372B8
  /* 156438 80137298 8E040008 */        lw $a0, 8($s0)
  /* 15643C 8013729C 8E0C0004 */        lw $t4, 4($s0)
  /* 156440 801372A0 52AC0005 */      beql $s5, $t4, .L801372B8
  /* 156444 801372A4 8E040008 */        lw $a0, 8($s0)
  /* 156448 801372A8 26520001 */     addiu $s2, $s2, 1
  .L801372AC:
  /* 15644C 801372AC 0040A025 */        or $s4, $v0, $zero
  /* 156450 801372B0 8E150004 */        lw $s5, 4($s0)
  /* 156454 801372B4 8E040008 */        lw $a0, 8($s0)
  .L801372B8:
  /* 156458 801372B8 0C04DC1A */       jal mnResultsSetTeamPlacement
  /* 15645C 801372BC 02402825 */        or $a1, $s2, $zero
  /* 156460 801372C0 2610000C */     addiu $s0, $s0, 0xc
  /* 156464 801372C4 5611FFF0 */      bnel $s0, $s1, .L80137288
  /* 156468 801372C8 8E020000 */        lw $v0, ($s0)
  .L801372CC:
  /* 15646C 801372CC 8FBF0034 */        lw $ra, 0x34($sp)
  /* 156470 801372D0 8FB00018 */        lw $s0, 0x18($sp)
  /* 156474 801372D4 8FB1001C */        lw $s1, 0x1c($sp)
  /* 156478 801372D8 8FB20020 */        lw $s2, 0x20($sp)
  /* 15647C 801372DC 8FB30024 */        lw $s3, 0x24($sp)
  /* 156480 801372E0 8FB40028 */        lw $s4, 0x28($sp)
  /* 156484 801372E4 8FB5002C */        lw $s5, 0x2c($sp)
  /* 156488 801372E8 8FB60030 */        lw $s6, 0x30($sp)
  /* 15648C 801372EC 03E00008 */        jr $ra
  /* 156490 801372F0 27BD0090 */     addiu $sp, $sp, 0x90

glabel mnResultsSetPlacementTime
  /* 156494 801372F4 3C0E8014 */       lui $t6, %hi(gMNResultsIsTeamBattle)
  /* 156498 801372F8 91CE9C14 */       lbu $t6, %lo(gMNResultsIsTeamBattle)($t6)
  /* 15649C 801372FC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1564A0 80137300 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1564A4 80137304 15C00005 */      bnez $t6, .L8013731C
  /* 1564A8 80137308 00000000 */       nop
  /* 1564AC 8013730C 0C04DB4A */       jal mnResultsSetPlacementFFA
  /* 1564B0 80137310 00000000 */       nop
  /* 1564B4 80137314 10000004 */         b .L80137328
  /* 1564B8 80137318 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013731C:
  /* 1564BC 8013731C 0C04DC6E */       jal mnResultsSetPlacementTeam
  /* 1564C0 80137320 00000000 */       nop
  /* 1564C4 80137324 8FBF0014 */        lw $ra, 0x14($sp)
  .L80137328:
  /* 1564C8 80137328 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1564CC 8013732C 03E00008 */        jr $ra
  /* 1564D0 80137330 00000000 */       nop

glabel mnResultsSetPlacementStock
  /* 1564D4 80137334 3C0E8014 */       lui $t6, %hi(gMNResultsIsPresent)
  /* 1564D8 80137338 8DCE9BD0 */        lw $t6, %lo(gMNResultsIsPresent)($t6)
  /* 1564DC 8013733C 3C188014 */       lui $t8, %hi(D_ovl31_80139BD4)
  /* 1564E0 80137340 3C088014 */       lui $t0, %hi(D_ovl31_80139BD8)
  /* 1564E4 80137344 11C00005 */      beqz $t6, .L8013735C
  /* 1564E8 80137348 3C0A8014 */       lui $t2, %hi(D_ovl31_80139BDC)
  /* 1564EC 8013734C 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x2D))
  /* 1564F0 80137350 91EF4D35 */       lbu $t7, %lo((gTransferBattleState + 0x2D))($t7)
  /* 1564F4 80137354 3C018014 */       lui $at, %hi(gMNResultsPlacement)
  /* 1564F8 80137358 AC2F9BB0 */        sw $t7, %lo(gMNResultsPlacement)($at)
  .L8013735C:
  /* 1564FC 8013735C 8F189BD4 */        lw $t8, %lo(D_ovl31_80139BD4)($t8)
  /* 156500 80137360 3C19800A */       lui $t9, %hi((gTransferBattleState + 0xA1))
  /* 156504 80137364 3C09800A */       lui $t1, %hi((gTransferBattleState + 0x115))
  /* 156508 80137368 13000004 */      beqz $t8, .L8013737C
  /* 15650C 8013736C 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x189))
  /* 156510 80137370 93394DA9 */       lbu $t9, %lo((gTransferBattleState + 0xA1))($t9)
  /* 156514 80137374 3C018014 */       lui $at, %hi(D_ovl31_80139BB4)
  /* 156518 80137378 AC399BB4 */        sw $t9, %lo(D_ovl31_80139BB4)($at)
  .L8013737C:
  /* 15651C 8013737C 8D089BD8 */        lw $t0, %lo(D_ovl31_80139BD8)($t0)
  /* 156520 80137380 11000004 */      beqz $t0, .L80137394
  /* 156524 80137384 00000000 */       nop
  /* 156528 80137388 91294E1D */       lbu $t1, %lo((gTransferBattleState + 0x115))($t1)
  /* 15652C 8013738C 3C018014 */       lui $at, %hi(D_ovl31_80139BB8)
  /* 156530 80137390 AC299BB8 */        sw $t1, %lo(D_ovl31_80139BB8)($at)
  .L80137394:
  /* 156534 80137394 8D4A9BDC */        lw $t2, %lo(D_ovl31_80139BDC)($t2)
  /* 156538 80137398 11400004 */      beqz $t2, .L801373AC
  /* 15653C 8013739C 00000000 */       nop
  /* 156540 801373A0 916B4E91 */       lbu $t3, %lo((gTransferBattleState + 0x189))($t3)
  /* 156544 801373A4 3C018014 */       lui $at, %hi(D_ovl31_80139BBC)
  /* 156548 801373A8 AC2B9BBC */        sw $t3, %lo(D_ovl31_80139BBC)($at)
  .L801373AC:
  /* 15654C 801373AC 03E00008 */        jr $ra
  /* 156550 801373B0 00000000 */       nop

glabel mnResultsSetArrays
  /* 156554 801373B4 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x3))
  /* 156558 801373B8 91CE4D0B */       lbu $t6, %lo((gTransferBattleState + 0x3))($t6)
  /* 15655C 801373BC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 156560 801373C0 24010002 */     addiu $at, $zero, 2
  /* 156564 801373C4 15C1000B */       bne $t6, $at, .L801373F4
  /* 156568 801373C8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 15656C 801373CC 0C04DAA7 */       jal mnResultsSetKOs
  /* 156570 801373D0 00000000 */       nop
  /* 156574 801373D4 0C04DAC7 */       jal mnResultsSetTKOs
  /* 156578 801373D8 00000000 */       nop
  /* 15657C 801373DC 0C04DAE7 */       jal mnResultsSetPoints
  /* 156580 801373E0 00000000 */       nop
  /* 156584 801373E4 0C04DCCD */       jal mnResultsSetPlacementStock
  /* 156588 801373E8 00000000 */       nop
  /* 15658C 801373EC 10000009 */         b .L80137414
  /* 156590 801373F0 00000000 */       nop
  .L801373F4:
  /* 156594 801373F4 0C04DAA7 */       jal mnResultsSetKOs
  /* 156598 801373F8 00000000 */       nop
  /* 15659C 801373FC 0C04DAC7 */       jal mnResultsSetTKOs
  /* 1565A0 80137400 00000000 */       nop
  /* 1565A4 80137404 0C04DAE7 */       jal mnResultsSetPoints
  /* 1565A8 80137408 00000000 */       nop
  /* 1565AC 8013740C 0C04DCBD */       jal mnResultsSetPlacementTime
  /* 1565B0 80137410 00000000 */       nop
  .L80137414:
  /* 1565B4 80137414 3C0F8014 */       lui $t7, %hi(gMNResultsGameRule)
  /* 1565B8 80137418 8DEF9C10 */        lw $t7, %lo(gMNResultsGameRule)($t7)
  /* 1565BC 8013741C 24010004 */     addiu $at, $zero, 4
  /* 1565C0 80137420 15E10006 */       bne $t7, $at, .L8013743C
  /* 1565C4 80137424 3C018014 */       lui $at, %hi(gMNResultsPlacement)
  /* 1565C8 80137428 AC209BB4 */        sw $zero, %lo(D_ovl31_80139BB4)($at)
  /* 1565CC 8013742C AC209BB0 */        sw $zero, %lo(gMNResultsPlacement)($at)
  /* 1565D0 80137430 3C018014 */       lui $at, %hi(D_ovl31_80139BBC)
  /* 1565D4 80137434 AC209BB8 */        sw $zero, %lo(D_ovl31_80139BB8)($at)
  /* 1565D8 80137438 AC209BBC */        sw $zero, %lo(D_ovl31_80139BBC)($at)
  .L8013743C:
  /* 1565DC 8013743C 0C04CC57 */       jal mnResultsSetFtKind
  /* 1565E0 80137440 00000000 */       nop
  /* 1565E4 80137444 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1565E8 80137448 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1565EC 8013744C 03E00008 */        jr $ra
  /* 1565F0 80137450 00000000 */       nop

glabel mnResultsSetIsPresent
  /* 1565F4 80137454 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x22))
  /* 1565F8 80137458 91CE4D2A */       lbu $t6, %lo((gTransferBattleState + 0x22))($t6)
  /* 1565FC 8013745C 24020002 */     addiu $v0, $zero, 2
  /* 156600 80137460 3C18800A */       lui $t8, %hi((gTransferBattleState + 0x96))
  /* 156604 80137464 144E0004 */       bne $v0, $t6, .L80137478
  /* 156608 80137468 3C08800A */       lui $t0, %hi((gTransferBattleState + 0x10A))
  /* 15660C 8013746C 3C018014 */       lui $at, %hi(gMNResultsIsPresent)
  /* 156610 80137470 10000004 */         b .L80137484
  /* 156614 80137474 AC209BD0 */        sw $zero, %lo(gMNResultsIsPresent)($at)
  .L80137478:
  /* 156618 80137478 240F0001 */     addiu $t7, $zero, 1
  /* 15661C 8013747C 3C018014 */       lui $at, %hi(gMNResultsIsPresent)
  /* 156620 80137480 AC2F9BD0 */        sw $t7, %lo(gMNResultsIsPresent)($at)
  .L80137484:
  /* 156624 80137484 93184D9E */       lbu $t8, %lo((gTransferBattleState + 0x96))($t8)
  /* 156628 80137488 3C0A800A */       lui $t2, %hi((gTransferBattleState + 0x17E))
  /* 15662C 8013748C 24190001 */     addiu $t9, $zero, 1
  /* 156630 80137490 14580004 */       bne $v0, $t8, .L801374A4
  /* 156634 80137494 3C018014 */       lui $at, 0x8014
  /* 156638 80137498 3C018014 */       lui $at, %hi(D_ovl31_80139BD4)
  /* 15663C 8013749C 10000002 */         b .L801374A8
  /* 156640 801374A0 AC209BD4 */        sw $zero, %lo(D_ovl31_80139BD4)($at)
  .L801374A4:
  /* 156644 801374A4 AC399BD4 */        sw $t9, %lo(D_ovl31_80139BD4)($at)
  .L801374A8:
  /* 156648 801374A8 91084E12 */       lbu $t0, %lo((gTransferBattleState + 0x10A))($t0)
  /* 15664C 801374AC 24090001 */     addiu $t1, $zero, 1
  /* 156650 801374B0 3C018014 */       lui $at, 0x8014
  /* 156654 801374B4 14480004 */       bne $v0, $t0, .L801374C8
  /* 156658 801374B8 240B0001 */     addiu $t3, $zero, 1
  /* 15665C 801374BC 3C018014 */       lui $at, %hi(D_ovl31_80139BD8)
  /* 156660 801374C0 10000002 */         b .L801374CC
  /* 156664 801374C4 AC209BD8 */        sw $zero, %lo(D_ovl31_80139BD8)($at)
  .L801374C8:
  /* 156668 801374C8 AC299BD8 */        sw $t1, %lo(D_ovl31_80139BD8)($at)
  .L801374CC:
  /* 15666C 801374CC 914A4E86 */       lbu $t2, %lo((gTransferBattleState + 0x17E))($t2)
  /* 156670 801374D0 3C018014 */       lui $at, 0x8014
  /* 156674 801374D4 144A0004 */       bne $v0, $t2, .L801374E8
  /* 156678 801374D8 00000000 */       nop
  /* 15667C 801374DC 3C018014 */       lui $at, %hi(D_ovl31_80139BDC)
  /* 156680 801374E0 03E00008 */        jr $ra
  /* 156684 801374E4 AC209BDC */        sw $zero, %lo(D_ovl31_80139BDC)($at)

  .L801374E8:
  /* 156688 801374E8 AC2B9BDC */        sw $t3, -0x6424($at)
  /* 15668C 801374EC 03E00008 */        jr $ra
  /* 156690 801374F0 00000000 */       nop

glabel mnResultsDrawFighter
  /* 156694 801374F4 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 156698 801374F8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 15669C 801374FC AFB00018 */        sw $s0, 0x18($sp)
  /* 1566A0 80137500 0C04CE4B */       jal mnResultsSpawnFighter
  /* 1566A4 80137504 00808025 */        or $s0, $a0, $zero
  /* 1566A8 80137508 0C04CE04 */       jal func_ovl31_80133810
  /* 1566AC 8013750C 02002025 */        or $a0, $s0, $zero
  /* 1566B0 80137510 3C0F8014 */       lui $t7, %hi(gMNResultsFighterGObjs)
  /* 1566B4 80137514 25EF9BE0 */     addiu $t7, $t7, %lo(gMNResultsFighterGObjs)
  /* 1566B8 80137518 00107080 */       sll $t6, $s0, 2
  /* 1566BC 8013751C 01CF1821 */      addu $v1, $t6, $t7
  /* 1566C0 80137520 8C640000 */        lw $a0, ($v1)
  /* 1566C4 80137524 AFA30024 */        sw $v1, 0x24($sp)
  /* 1566C8 80137528 02002825 */        or $a1, $s0, $zero
  /* 1566CC 8013752C 0C04CC77 */       jal mnResultsSetFighterPosition
  /* 1566D0 80137530 00403025 */        or $a2, $v0, $zero
  /* 1566D4 80137534 0C04CC52 */       jal mnResultsGetFtKind
  /* 1566D8 80137538 02002025 */        or $a0, $s0, $zero
  /* 1566DC 8013753C AFA20028 */        sw $v0, 0x28($sp)
  /* 1566E0 80137540 0C04CE04 */       jal func_ovl31_80133810
  /* 1566E4 80137544 02002025 */        or $a0, $s0, $zero
  /* 1566E8 80137548 8FB80024 */        lw $t8, 0x24($sp)
  /* 1566EC 8013754C 02002825 */        or $a1, $s0, $zero
  /* 1566F0 80137550 8FA60028 */        lw $a2, 0x28($sp)
  /* 1566F4 80137554 00403825 */        or $a3, $v0, $zero
  /* 1566F8 80137558 0C04CE3B */       jal mnResultsSetFighterScale
  /* 1566FC 8013755C 8F040000 */        lw $a0, ($t8)
  /* 156700 80137560 0010C8C0 */       sll $t9, $s0, 3
  /* 156704 80137564 0330C823 */      subu $t9, $t9, $s0
  /* 156708 80137568 0019C880 */       sll $t9, $t9, 2
  /* 15670C 8013756C 0330C821 */      addu $t9, $t9, $s0
  /* 156710 80137570 0019C880 */       sll $t9, $t9, 2
  /* 156714 80137574 3C05800A */       lui $a1, %hi((gTransferBattleState + 0x28))
  /* 156718 80137578 00B92821 */      addu $a1, $a1, $t9
  /* 15671C 8013757C 90A54D30 */       lbu $a1, %lo((gTransferBattleState + 0x28))($a1)
  /* 156720 80137580 0C04CF16 */       jal mnResultsCreatePlayerIndicator
  /* 156724 80137584 02002025 */        or $a0, $s0, $zero
  /* 156728 80137588 8FA80024 */        lw $t0, 0x24($sp)
  /* 15672C 8013758C 02002825 */        or $a1, $s0, $zero
  /* 156730 80137590 0C04CD37 */       jal mnResultsSetAnim
  /* 156734 80137594 8D040000 */        lw $a0, ($t0)
  /* 156738 80137598 8FBF001C */        lw $ra, 0x1c($sp)
  /* 15673C 8013759C 8FB00018 */        lw $s0, 0x18($sp)
  /* 156740 801375A0 27BD0030 */     addiu $sp, $sp, 0x30
  /* 156744 801375A4 03E00008 */        jr $ra
  /* 156748 801375A8 00000000 */       nop

glabel mnResultsDrawFighters
  /* 15674C 801375AC 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 156750 801375B0 AFB00018 */        sw $s0, 0x18($sp)
  /* 156754 801375B4 3C108014 */       lui $s0, %hi(gMNResultsIsPresent)
  /* 156758 801375B8 26109BD0 */     addiu $s0, $s0, %lo(gMNResultsIsPresent)
  /* 15675C 801375BC 8E0E0000 */        lw $t6, ($s0) # gMNResultsIsPresent + 0
  /* 156760 801375C0 AFBF002C */        sw $ra, 0x2c($sp)
  /* 156764 801375C4 AFB40028 */        sw $s4, 0x28($sp)
  /* 156768 801375C8 AFB30024 */        sw $s3, 0x24($sp)
  /* 15676C 801375CC AFB20020 */        sw $s2, 0x20($sp)
  /* 156770 801375D0 11C00003 */      beqz $t6, .L801375E0
  /* 156774 801375D4 AFB1001C */        sw $s1, 0x1c($sp)
  /* 156778 801375D8 0C04DD3D */       jal mnResultsDrawFighter
  /* 15677C 801375DC 00002025 */        or $a0, $zero, $zero
  .L801375E0:
  /* 156780 801375E0 8E0F0004 */        lw $t7, 4($s0) # gMNResultsIsPresent + 4
  /* 156784 801375E4 51E00004 */      beql $t7, $zero, .L801375F8
  /* 156788 801375E8 8E180008 */        lw $t8, 8($s0) # gMNResultsIsPresent + 8
  /* 15678C 801375EC 0C04DD3D */       jal mnResultsDrawFighter
  /* 156790 801375F0 24040001 */     addiu $a0, $zero, 1
  /* 156794 801375F4 8E180008 */        lw $t8, 8($s0) # gMNResultsIsPresent + 8
  .L801375F8:
  /* 156798 801375F8 53000004 */      beql $t8, $zero, .L8013760C
  /* 15679C 801375FC 8E19000C */        lw $t9, 0xc($s0) # gMNResultsIsPresent + 12
  /* 1567A0 80137600 0C04DD3D */       jal mnResultsDrawFighter
  /* 1567A4 80137604 24040002 */     addiu $a0, $zero, 2
  /* 1567A8 80137608 8E19000C */        lw $t9, 0xc($s0) # gMNResultsIsPresent + 12
  .L8013760C:
  /* 1567AC 8013760C 13200003 */      beqz $t9, .L8013761C
  /* 1567B0 80137610 00000000 */       nop
  /* 1567B4 80137614 0C04DD3D */       jal mnResultsDrawFighter
  /* 1567B8 80137618 24040003 */     addiu $a0, $zero, 3
  .L8013761C:
  /* 1567BC 8013761C 3C088014 */       lui $t0, %hi(gMNResultsGameRule)
  /* 1567C0 80137620 8D089C10 */        lw $t0, %lo(gMNResultsGameRule)($t0)
  /* 1567C4 80137624 24140004 */     addiu $s4, $zero, 4
  /* 1567C8 80137628 00008025 */        or $s0, $zero, $zero
  /* 1567CC 8013762C 12880012 */       beq $s4, $t0, .L80137678
  /* 1567D0 80137630 00008825 */        or $s1, $zero, $zero
  /* 1567D4 80137634 3C128014 */       lui $s2, %hi(gMNResultsIsPresent)
  /* 1567D8 80137638 26529BD0 */     addiu $s2, $s2, %lo(gMNResultsIsPresent)
  .L8013763C:
  /* 1567DC 8013763C 8E490000 */        lw $t1, ($s2) # gMNResultsIsPresent + 0
  /* 1567E0 80137640 3C0A8014 */       lui $t2, %hi(gMNResultsFighterGObjs)
  /* 1567E4 80137644 254A9BE0 */     addiu $t2, $t2, %lo(gMNResultsFighterGObjs)
  /* 1567E8 80137648 11200007 */      beqz $t1, .L80137668
  /* 1567EC 8013764C 02002025 */        or $a0, $s0, $zero
  /* 1567F0 80137650 0C04CC4D */       jal mnResultsGetPlacement
  /* 1567F4 80137654 022A9821 */      addu $s3, $s1, $t2
  /* 1567F8 80137658 8E640000 */        lw $a0, ($s3)
  /* 1567FC 8013765C 02002825 */        or $a1, $s0, $zero
  /* 156800 80137660 0C04CCF9 */       jal mnResultsMakeFighterFaceWinner
  /* 156804 80137664 00403025 */        or $a2, $v0, $zero
  .L80137668:
  /* 156808 80137668 26100001 */     addiu $s0, $s0, 1
  /* 15680C 8013766C 26310004 */     addiu $s1, $s1, 4
  /* 156810 80137670 1614FFF2 */       bne $s0, $s4, .L8013763C
  /* 156814 80137674 26520004 */     addiu $s2, $s2, 4
  .L80137678:
  /* 156818 80137678 8FBF002C */        lw $ra, 0x2c($sp)
  /* 15681C 8013767C 8FB00018 */        lw $s0, 0x18($sp)
  /* 156820 80137680 8FB1001C */        lw $s1, 0x1c($sp)
  /* 156824 80137684 8FB20020 */        lw $s2, 0x20($sp)
  /* 156828 80137688 8FB30024 */        lw $s3, 0x24($sp)
  /* 15682C 8013768C 8FB40028 */        lw $s4, 0x28($sp)
  /* 156830 80137690 03E00008 */        jr $ra
  /* 156834 80137694 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnResultsLoadMatchInfo
  /* 156838 80137698 3C018014 */       lui $at, %hi(gMNResultsFramesElapsed)
  /* 15683C 8013769C AC209B78 */        sw $zero, %lo(gMNResultsFramesElapsed)($at)
  /* 156840 801376A0 3C018014 */       lui $at, %hi(gMNResultsHorizontalLineWidth)
  /* 156844 801376A4 AC209B7C */        sw $zero, %lo(gMNResultsHorizontalLineWidth)($at)
  /* 156848 801376A8 3C03800A */       lui $v1, %hi(gTransferBattleState)
  /* 15684C 801376AC 3C018014 */       lui $at, %hi(gMNResultsCharacterAlpha)
  /* 156850 801376B0 24634D08 */     addiu $v1, $v1, %lo(gTransferBattleState)
  /* 156854 801376B4 AC209C40 */        sw $zero, %lo(gMNResultsCharacterAlpha)($at)
  /* 156858 801376B8 906E0002 */       lbu $t6, 2($v1) # gTransferBattleState + 2
  /* 15685C 801376BC 3C028014 */       lui $v0, %hi(gMNResultsIsTeamBattle)
  /* 156860 801376C0 24429C14 */     addiu $v0, $v0, %lo(gMNResultsIsTeamBattle)
  /* 156864 801376C4 3C018014 */       lui $at, %hi(gMNResultsIsSharedWinner)
  /* 156868 801376C8 A04E0000 */        sb $t6, ($v0) # gMNResultsIsTeamBattle + 0
  /* 15686C 801376CC AC209C24 */        sw $zero, %lo(D_ovl31_80139C24)($at)
  /* 156870 801376D0 AC209C20 */        sw $zero, %lo(gMNResultsIsSharedWinner)($at)
  /* 156874 801376D4 3C018014 */       lui $at, %hi(D_ovl31_80139C2C)
  /* 156878 801376D8 AC209C28 */        sw $zero, %lo(D_ovl31_80139C28)($at)
  /* 15687C 801376DC AC209C2C */        sw $zero, %lo(D_ovl31_80139C2C)($at)
  /* 156880 801376E0 906F0003 */       lbu $t7, 3($v1) # gTransferBattleState + 3
  /* 156884 801376E4 24040001 */     addiu $a0, $zero, 1
  /* 156888 801376E8 3C038014 */       lui $v1, %hi(gMNResultsMinFramesElapsed)
  /* 15688C 801376EC 148F000E */       bne $a0, $t7, .L80137728
  /* 156890 801376F0 24639C18 */     addiu $v1, $v1, %lo(gMNResultsMinFramesElapsed)
  /* 156894 801376F4 90580000 */       lbu $t8, ($v0) # gMNResultsIsTeamBattle + 0
  /* 156898 801376F8 3C028014 */       lui $v0, %hi(gMNResultsGameRule)
  /* 15689C 801376FC 24429C10 */     addiu $v0, $v0, %lo(gMNResultsGameRule)
  /* 1568A0 80137700 17000005 */      bnez $t8, .L80137718
  /* 1568A4 80137704 2408019A */     addiu $t0, $zero, 0x19a
  /* 1568A8 80137708 3C028014 */       lui $v0, %hi(gMNResultsGameRule)
  /* 1568AC 8013770C 24429C10 */     addiu $v0, $v0, %lo(gMNResultsGameRule)
  /* 1568B0 80137710 10000003 */         b .L80137720
  /* 1568B4 80137714 AC400000 */        sw $zero, ($v0) # gMNResultsGameRule + 0
  .L80137718:
  /* 1568B8 80137718 24190002 */     addiu $t9, $zero, 2
  /* 1568BC 8013771C AC590000 */        sw $t9, ($v0) # gMNResultsGameRule + 0
  .L80137720:
  /* 1568C0 80137720 1000000F */         b .L80137760
  /* 1568C4 80137724 AC680000 */        sw $t0, ($v1) # gMNResultsMinFramesElapsed + 0
  .L80137728:
  /* 1568C8 80137728 90490000 */       lbu $t1, ($v0) # gMNResultsGameRule + 0
  /* 1568CC 8013772C 3C038014 */       lui $v1, %hi(gMNResultsMinFramesElapsed)
  /* 1568D0 80137730 24639C18 */     addiu $v1, $v1, %lo(gMNResultsMinFramesElapsed)
  /* 1568D4 80137734 15200005 */      bnez $t1, .L8013774C
  /* 1568D8 80137738 240B0172 */     addiu $t3, $zero, 0x172
  /* 1568DC 8013773C 3C028014 */       lui $v0, %hi(gMNResultsGameRule)
  /* 1568E0 80137740 24429C10 */     addiu $v0, $v0, %lo(gMNResultsGameRule)
  /* 1568E4 80137744 10000005 */         b .L8013775C
  /* 1568E8 80137748 AC440000 */        sw $a0, ($v0) # gMNResultsGameRule + 0
  .L8013774C:
  /* 1568EC 8013774C 3C028014 */       lui $v0, %hi(gMNResultsGameRule)
  /* 1568F0 80137750 24429C10 */     addiu $v0, $v0, %lo(gMNResultsGameRule)
  /* 1568F4 80137754 240A0003 */     addiu $t2, $zero, 3
  /* 1568F8 80137758 AC4A0000 */        sw $t2, ($v0) # gMNResultsGameRule + 0
  .L8013775C:
  /* 1568FC 8013775C AC6B0000 */        sw $t3, ($v1) # gMNResultsMinFramesElapsed + 0
  .L80137760:
  /* 156900 80137760 3C0C800A */       lui $t4, %hi((gSceneData + 0x12))
  /* 156904 80137764 918C4AE2 */       lbu $t4, %lo((gSceneData + 0x12))($t4)
  /* 156908 80137768 240D0004 */     addiu $t5, $zero, 4
  /* 15690C 8013776C 240E00C8 */     addiu $t6, $zero, 0xc8
  /* 156910 80137770 11800009 */      beqz $t4, .L80137798
  /* 156914 80137774 3C018014 */       lui $at, %hi(gMNResultsDrawBackgroundFrame)
  /* 156918 80137778 AC4D0000 */        sw $t5, ($v0) # gMNResultsGameRule + 0
  /* 15691C 8013777C AC6E0000 */        sw $t6, ($v1) # gMNResultsMinFramesElapsed + 0
  /* 156920 80137780 AC249C44 */        sw $a0, %lo(gMNResultsDrawBackgroundFrame)($at)
  /* 156924 80137784 3C018014 */       lui $at, %hi(gMNResultsDrawWinnerTextFrame)
  /* 156928 80137788 AC249C48 */        sw $a0, %lo(gMNResultsDrawWinnerTextFrame)($at)
  /* 15692C 8013778C 3C018014 */       lui $at, %hi(gMNResultsDrawFightersFrame)
  /* 156930 80137790 03E00008 */        jr $ra
  /* 156934 80137794 AC249C4C */        sw $a0, %lo(gMNResultsDrawFightersFrame)($at)

  .L80137798:
  /* 156938 80137798 240F0050 */     addiu $t7, $zero, 0x50
  /* 15693C 8013779C 3C018014 */       lui $at, %hi(gMNResultsDrawBackgroundFrame)
  /* 156940 801377A0 AC2F9C44 */        sw $t7, %lo(gMNResultsDrawBackgroundFrame)($at)
  /* 156944 801377A4 24020078 */     addiu $v0, $zero, 0x78
  /* 156948 801377A8 3C018014 */       lui $at, %hi(gMNResultsDrawWinnerTextFrame)
  /* 15694C 801377AC AC229C48 */        sw $v0, %lo(gMNResultsDrawWinnerTextFrame)($at)
  /* 156950 801377B0 3C018014 */       lui $at, %hi(gMNResultsDrawFightersFrame)
  /* 156954 801377B4 AC229C4C */        sw $v0, %lo(gMNResultsDrawFightersFrame)($at)
  /* 156958 801377B8 03E00008 */        jr $ra
  /* 15695C 801377BC 00000000 */       nop

glabel func_ovl31_801377C0
  /* 156960 801377C0 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 156964 801377C4 AFB00018 */        sw $s0, 0x18($sp)
  /* 156968 801377C8 3C10800A */       lui $s0, %hi(D_8009D960)
  /* 15696C 801377CC 2610D960 */     addiu $s0, $s0, %lo(D_8009D960)
  /* 156970 801377D0 8E0E0000 */        lw $t6, ($s0) # D_8009D960 + 0
  /* 156974 801377D4 AFBF001C */        sw $ra, 0x1c($sp)
  /* 156978 801377D8 AFA40020 */        sw $a0, 0x20($sp)
  /* 15697C 801377DC 8DC20034 */        lw $v0, 0x34($t6)
  /* 156980 801377E0 14400007 */      bnez $v0, .L80137800
  /* 156984 801377E4 00000000 */       nop
  .L801377E8:
  /* 156988 801377E8 0C002C7A */       jal gsStopCurrentProcess
  /* 15698C 801377EC 24040001 */     addiu $a0, $zero, 1
  /* 156990 801377F0 8E0F0000 */        lw $t7, ($s0) # D_8009D960 + 0
  /* 156994 801377F4 8DE20034 */        lw $v0, 0x34($t7)
  /* 156998 801377F8 1040FFFB */      beqz $v0, .L801377E8
  /* 15699C 801377FC 00000000 */       nop
  .L80137800:
  /* 1569A0 80137800 14400005 */      bnez $v0, .L80137818
  /* 1569A4 80137804 00002025 */        or $a0, $zero, $zero
  /* 1569A8 80137808 0C0082AD */       jal func_80020AB4
  /* 1569AC 8013780C 24050016 */     addiu $a1, $zero, 0x16
  /* 1569B0 80137810 0C0026A1 */       jal omEjectGObj
  /* 1569B4 80137814 00002025 */        or $a0, $zero, $zero
  .L80137818:
  /* 1569B8 80137818 0C002C7A */       jal gsStopCurrentProcess
  /* 1569BC 8013781C 24040001 */     addiu $a0, $zero, 1
  /* 1569C0 80137820 3C18800A */       lui $t8, %hi(D_8009D960)
  /* 1569C4 80137824 8F18D960 */        lw $t8, %lo(D_8009D960)($t8)
  /* 1569C8 80137828 1000FFF5 */         b .L80137800
  /* 1569CC 8013782C 8F020034 */        lw $v0, 0x34($t8)
  /* 1569D0 80137830 00000000 */       nop
  /* 1569D4 80137834 00000000 */       nop
  /* 1569D8 80137838 00000000 */       nop
  /* 1569DC 8013783C 00000000 */       nop
# Maybe start of new file
  /* 1569E0 80137840 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1569E4 80137844 8FB00018 */        lw $s0, 0x18($sp)
  /* 1569E8 80137848 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1569EC 8013784C 03E00008 */        jr $ra
  /* 1569F0 80137850 00000000 */       nop

glabel func_ovl31_80137854
  /* 1569F4 80137854 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1569F8 80137858 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1569FC 8013785C 00002025 */        or $a0, $zero, $zero
  /* 156A00 80137860 00002825 */        or $a1, $zero, $zero
  /* 156A04 80137864 24060011 */     addiu $a2, $zero, 0x11
  /* 156A08 80137868 0C00265A */       jal omMakeGObjSPAfter
  /* 156A0C 8013786C 3C078000 */       lui $a3, 0x8000
  /* 156A10 80137870 3C058013 */       lui $a1, %hi(func_ovl31_801377C0)
  /* 156A14 80137874 24A577C0 */     addiu $a1, $a1, %lo(func_ovl31_801377C0)
  /* 156A18 80137878 00402025 */        or $a0, $v0, $zero
  /* 156A1C 8013787C 00003025 */        or $a2, $zero, $zero
  /* 156A20 80137880 0C002062 */       jal omAddGObjCommonProc
  /* 156A24 80137884 24070001 */     addiu $a3, $zero, 1
  /* 156A28 80137888 8FBF0014 */        lw $ra, 0x14($sp)
  /* 156A2C 8013788C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 156A30 80137890 03E00008 */        jr $ra
  /* 156A34 80137894 00000000 */       nop

glabel func_ovl31_80137898
  /* 156A38 80137898 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 156A3C 8013789C AFBF0024 */        sw $ra, 0x24($sp)
  /* 156A40 801378A0 AFB00018 */        sw $s0, 0x18($sp)
  /* 156A44 801378A4 AFB20020 */        sw $s2, 0x20($sp)
  /* 156A48 801378A8 AFB1001C */        sw $s1, 0x1c($sp)
  /* 156A4C 801378AC AFA40028 */        sw $a0, 0x28($sp)
  /* 156A50 801378B0 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 156A54 801378B4 00008025 */        or $s0, $zero, $zero
  /* 156A58 801378B8 00408825 */        or $s1, $v0, $zero
  /* 156A5C 801378BC 24120078 */     addiu $s2, $zero, 0x78
  /* 156A60 801378C0 26100001 */     addiu $s0, $s0, 1
  .L801378C4:
  /* 156A64 801378C4 5612000A */      bnel $s0, $s2, .L801378F0
  /* 156A68 801378C8 320E0001 */      andi $t6, $s0, 1
  /* 156A6C 801378CC 0C00112D */       jal func_800044B4
  /* 156A70 801378D0 02202025 */        or $a0, $s1, $zero
  /* 156A74 801378D4 0C001125 */       jal func_80004494
  /* 156A78 801378D8 02202025 */        or $a0, $s1, $zero
  /* 156A7C 801378DC 0C0026A1 */       jal omEjectGObj
  /* 156A80 801378E0 00002025 */        or $a0, $zero, $zero
  /* 156A84 801378E4 0C002C7A */       jal gsStopCurrentProcess
  /* 156A88 801378E8 24040001 */     addiu $a0, $zero, 1
  /* 156A8C 801378EC 320E0001 */      andi $t6, $s0, 1
  .L801378F0:
  /* 156A90 801378F0 11C00005 */      beqz $t6, .L80137908
  /* 156A94 801378F4 00000000 */       nop
  /* 156A98 801378F8 0C00111D */       jal func_80004474
  /* 156A9C 801378FC 02202025 */        or $a0, $s1, $zero
  /* 156AA0 80137900 10000003 */         b .L80137910
  /* 156AA4 80137904 00000000 */       nop
  .L80137908:
  /* 156AA8 80137908 0C001125 */       jal func_80004494
  /* 156AAC 8013790C 02202025 */        or $a0, $s1, $zero
  .L80137910:
  /* 156AB0 80137910 0C002C7A */       jal gsStopCurrentProcess
  /* 156AB4 80137914 24040001 */     addiu $a0, $zero, 1
  /* 156AB8 80137918 1000FFEA */         b .L801378C4
  /* 156ABC 8013791C 26100001 */     addiu $s0, $s0, 1
  /* 156AC0 80137920 8FBF0024 */        lw $ra, 0x24($sp)
  /* 156AC4 80137924 8FB00018 */        lw $s0, 0x18($sp)
  /* 156AC8 80137928 8FB1001C */        lw $s1, 0x1c($sp)
  /* 156ACC 8013792C 8FB20020 */        lw $s2, 0x20($sp)
  /* 156AD0 80137930 03E00008 */        jr $ra
  /* 156AD4 80137934 27BD0028 */     addiu $sp, $sp, 0x28

glabel func_ovl31_80137938
  /* 156AD8 80137938 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 156ADC 8013793C AFBF0014 */        sw $ra, 0x14($sp)
  /* 156AE0 80137940 00002025 */        or $a0, $zero, $zero
  /* 156AE4 80137944 00002825 */        or $a1, $zero, $zero
  /* 156AE8 80137948 2406000F */     addiu $a2, $zero, 0xf
  /* 156AEC 8013794C 0C00265A */       jal omMakeGObjSPAfter
  /* 156AF0 80137950 3C078000 */       lui $a3, 0x8000
  /* 156AF4 80137954 3C058013 */       lui $a1, %hi(func_ovl31_80137898)
  /* 156AF8 80137958 24A57898 */     addiu $a1, $a1, %lo(func_ovl31_80137898)
  /* 156AFC 8013795C 00402025 */        or $a0, $v0, $zero
  /* 156B00 80137960 00003025 */        or $a2, $zero, $zero
  /* 156B04 80137964 0C002062 */       jal omAddGObjCommonProc
  /* 156B08 80137968 24070001 */     addiu $a3, $zero, 1
  /* 156B0C 8013796C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 156B10 80137970 27BD0018 */     addiu $sp, $sp, 0x18
  /* 156B14 80137974 03E00008 */        jr $ra
  /* 156B18 80137978 00000000 */       nop

glabel func_ovl31_8013797C
  /* 156B1C 8013797C 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 156B20 80137980 AFB10018 */        sw $s1, 0x18($sp)
  /* 156B24 80137984 AFB00014 */        sw $s0, 0x14($sp)
  /* 156B28 80137988 AFBF001C */        sw $ra, 0x1c($sp)
  /* 156B2C 8013798C 00008025 */        or $s0, $zero, $zero
  /* 156B30 80137990 24110004 */     addiu $s1, $zero, 4
  .L80137994:
  /* 156B34 80137994 0C00112D */       jal func_800044B4
  /* 156B38 80137998 02002025 */        or $a0, $s0, $zero
  /* 156B3C 8013799C 0C001125 */       jal func_80004494
  /* 156B40 801379A0 02002025 */        or $a0, $s0, $zero
  /* 156B44 801379A4 26100001 */     addiu $s0, $s0, 1
  /* 156B48 801379A8 1611FFFA */       bne $s0, $s1, .L80137994
  /* 156B4C 801379AC 00000000 */       nop
  /* 156B50 801379B0 8FBF001C */        lw $ra, 0x1c($sp)
  /* 156B54 801379B4 8FB00014 */        lw $s0, 0x14($sp)
  /* 156B58 801379B8 8FB10018 */        lw $s1, 0x18($sp)
  /* 156B5C 801379BC 03E00008 */        jr $ra
  /* 156B60 801379C0 27BD0020 */     addiu $sp, $sp, 0x20

glabel mnResultsGetHumanCount
  /* 156B64 801379C4 3C0E800A */       lui $t6, %hi((gTransferBattleState + 0x22))
  /* 156B68 801379C8 91CE4D2A */       lbu $t6, %lo((gTransferBattleState + 0x22))($t6)
  /* 156B6C 801379CC 00001825 */        or $v1, $zero, $zero
  /* 156B70 801379D0 3C0F800A */       lui $t7, %hi((gTransferBattleState + 0x96))
  /* 156B74 801379D4 15C00002 */      bnez $t6, .L801379E0
  /* 156B78 801379D8 3C18800A */       lui $t8, %hi((gTransferBattleState + 0x10A))
  /* 156B7C 801379DC 24030001 */     addiu $v1, $zero, 1
  .L801379E0:
  /* 156B80 801379E0 91EF4D9E */       lbu $t7, %lo((gTransferBattleState + 0x96))($t7)
  /* 156B84 801379E4 3C19800A */       lui $t9, %hi((gTransferBattleState + 0x17E))
  /* 156B88 801379E8 15E00002 */      bnez $t7, .L801379F4
  /* 156B8C 801379EC 00000000 */       nop
  /* 156B90 801379F0 24630001 */     addiu $v1, $v1, 1
  .L801379F4:
  /* 156B94 801379F4 93184E12 */       lbu $t8, %lo((gTransferBattleState + 0x10A))($t8)
  /* 156B98 801379F8 17000002 */      bnez $t8, .L80137A04
  /* 156B9C 801379FC 00000000 */       nop
  /* 156BA0 80137A00 24630001 */     addiu $v1, $v1, 1
  .L80137A04:
  /* 156BA4 80137A04 93394E86 */       lbu $t9, %lo((gTransferBattleState + 0x17E))($t9)
  /* 156BA8 80137A08 17200002 */      bnez $t9, .L80137A14
  /* 156BAC 80137A0C 00000000 */       nop
  /* 156BB0 80137A10 24630001 */     addiu $v1, $v1, 1
  .L80137A14:
  /* 156BB4 80137A14 03E00008 */        jr $ra
  /* 156BB8 80137A18 00601025 */        or $v0, $v1, $zero

glabel mnResultsGetBestHuman
  /* 156BBC 80137A1C 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 156BC0 80137A20 3C03800A */       lui $v1, %hi(gTransferBattleState)
  /* 156BC4 80137A24 24634D08 */     addiu $v1, $v1, %lo(gTransferBattleState)
  /* 156BC8 80137A28 27A40024 */     addiu $a0, $sp, 0x24
  /* 156BCC 80137A2C 27A50034 */     addiu $a1, $sp, 0x34
  /* 156BD0 80137A30 24020001 */     addiu $v0, $zero, 1
  .L80137A34:
  /* 156BD4 80137A34 906E0022 */       lbu $t6, 0x22($v1) # gTransferBattleState + 34
  /* 156BD8 80137A38 55C00004 */      bnel $t6, $zero, .L80137A4C
  /* 156BDC 80137A3C AC800000 */        sw $zero, ($a0)
  /* 156BE0 80137A40 10000002 */         b .L80137A4C
  /* 156BE4 80137A44 AC820000 */        sw $v0, ($a0)
  /* 156BE8 80137A48 AC800000 */        sw $zero, ($a0)
  .L80137A4C:
  /* 156BEC 80137A4C 24840004 */     addiu $a0, $a0, 4
  /* 156BF0 80137A50 0085082B */      sltu $at, $a0, $a1
  /* 156BF4 80137A54 1420FFF7 */      bnez $at, .L80137A34
  /* 156BF8 80137A58 24630074 */     addiu $v1, $v1, 0x74
  /* 156BFC 80137A5C 00001025 */        or $v0, $zero, $zero
  /* 156C00 80137A60 27A40024 */     addiu $a0, $sp, 0x24
  .L80137A64:
  /* 156C04 80137A64 8C8F0000 */        lw $t7, ($a0)
  /* 156C08 80137A68 51E00004 */      beql $t7, $zero, .L80137A7C
  /* 156C0C 80137A6C 24420001 */     addiu $v0, $v0, 1
  /* 156C10 80137A70 10000006 */         b .L80137A8C
  /* 156C14 80137A74 00402825 */        or $a1, $v0, $zero
  /* 156C18 80137A78 24420001 */     addiu $v0, $v0, 1
  .L80137A7C:
  /* 156C1C 80137A7C 28410004 */      slti $at, $v0, 4
  /* 156C20 80137A80 1420FFF8 */      bnez $at, .L80137A64
  /* 156C24 80137A84 24840004 */     addiu $a0, $a0, 4
  /* 156C28 80137A88 8FA50020 */        lw $a1, 0x20($sp)
  .L80137A8C:
  /* 156C2C 80137A8C 28A10004 */      slti $at, $a1, 4
  /* 156C30 80137A90 00003025 */        or $a2, $zero, $zero
  /* 156C34 80137A94 1020005A */      beqz $at, .L80137C00
  /* 156C38 80137A98 00A01025 */        or $v0, $a1, $zero
  /* 156C3C 80137A9C 240A0004 */     addiu $t2, $zero, 4
  /* 156C40 80137AA0 01453823 */      subu $a3, $t2, $a1
  /* 156C44 80137AA4 30E70003 */      andi $a3, $a3, 3
  /* 156C48 80137AA8 10E00018 */      beqz $a3, .L80137B0C
  /* 156C4C 80137AAC 00E54821 */      addu $t1, $a3, $a1
  /* 156C50 80137AB0 00021880 */       sll $v1, $v0, 2
  /* 156C54 80137AB4 27B80024 */     addiu $t8, $sp, 0x24
  /* 156C58 80137AB8 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 156C5C 80137ABC 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  /* 156C60 80137AC0 00782021 */      addu $a0, $v1, $t8
  .L80137AC4:
  /* 156C64 80137AC4 8C990000 */        lw $t9, ($a0)
  /* 156C68 80137AC8 00056080 */       sll $t4, $a1, 2
  /* 156C6C 80137ACC 016C6821 */      addu $t5, $t3, $t4
  /* 156C70 80137AD0 1320000A */      beqz $t9, .L80137AFC
  /* 156C74 80137AD4 24840004 */     addiu $a0, $a0, 4
  /* 156C78 80137AD8 01637021 */      addu $t6, $t3, $v1
  /* 156C7C 80137ADC 8DC80000 */        lw $t0, ($t6)
  /* 156C80 80137AE0 8DA70000 */        lw $a3, ($t5)
  /* 156C84 80137AE4 14E80002 */       bne $a3, $t0, .L80137AF0
  /* 156C88 80137AE8 00E8082A */       slt $at, $a3, $t0
  /* 156C8C 80137AEC 24060001 */     addiu $a2, $zero, 1
  .L80137AF0:
  /* 156C90 80137AF0 50200003 */      beql $at, $zero, .L80137B00
  /* 156C94 80137AF4 24420001 */     addiu $v0, $v0, 1
  /* 156C98 80137AF8 00402825 */        or $a1, $v0, $zero
  .L80137AFC:
  /* 156C9C 80137AFC 24420001 */     addiu $v0, $v0, 1
  .L80137B00:
  /* 156CA0 80137B00 1522FFF0 */       bne $t1, $v0, .L80137AC4
  /* 156CA4 80137B04 24630004 */     addiu $v1, $v1, 4
  /* 156CA8 80137B08 104A003D */       beq $v0, $t2, .L80137C00
  .L80137B0C:
  /* 156CAC 80137B0C 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 156CB0 80137B10 00021880 */       sll $v1, $v0, 2
  /* 156CB4 80137B14 27AF0024 */     addiu $t7, $sp, 0x24
  /* 156CB8 80137B18 006F2021 */      addu $a0, $v1, $t7
  /* 156CBC 80137B1C 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  .L80137B20:
  /* 156CC0 80137B20 8C980000 */        lw $t8, ($a0)
  /* 156CC4 80137B24 0005C880 */       sll $t9, $a1, 2
  /* 156CC8 80137B28 01796021 */      addu $t4, $t3, $t9
  /* 156CCC 80137B2C 13000009 */      beqz $t8, .L80137B54
  /* 156CD0 80137B30 01636821 */      addu $t5, $t3, $v1
  /* 156CD4 80137B34 8D870000 */        lw $a3, ($t4)
  /* 156CD8 80137B38 8DA80000 */        lw $t0, ($t5)
  /* 156CDC 80137B3C 14E80002 */       bne $a3, $t0, .L80137B48
  /* 156CE0 80137B40 00E8082A */       slt $at, $a3, $t0
  /* 156CE4 80137B44 24060001 */     addiu $a2, $zero, 1
  .L80137B48:
  /* 156CE8 80137B48 50200003 */      beql $at, $zero, .L80137B58
  /* 156CEC 80137B4C 8C8E0004 */        lw $t6, 4($a0)
  /* 156CF0 80137B50 00402825 */        or $a1, $v0, $zero
  .L80137B54:
  /* 156CF4 80137B54 8C8E0004 */        lw $t6, 4($a0)
  .L80137B58:
  /* 156CF8 80137B58 00057880 */       sll $t7, $a1, 2
  /* 156CFC 80137B5C 016FC021 */      addu $t8, $t3, $t7
  /* 156D00 80137B60 11C00009 */      beqz $t6, .L80137B88
  /* 156D04 80137B64 0163C821 */      addu $t9, $t3, $v1
  /* 156D08 80137B68 8F070000 */        lw $a3, ($t8)
  /* 156D0C 80137B6C 8F280004 */        lw $t0, 4($t9)
  /* 156D10 80137B70 14E80002 */       bne $a3, $t0, .L80137B7C
  /* 156D14 80137B74 00E8082A */       slt $at, $a3, $t0
  /* 156D18 80137B78 24060001 */     addiu $a2, $zero, 1
  .L80137B7C:
  /* 156D1C 80137B7C 50200003 */      beql $at, $zero, .L80137B8C
  /* 156D20 80137B80 8C8C0008 */        lw $t4, 8($a0)
  /* 156D24 80137B84 24450001 */     addiu $a1, $v0, 1
  .L80137B88:
  /* 156D28 80137B88 8C8C0008 */        lw $t4, 8($a0)
  .L80137B8C:
  /* 156D2C 80137B8C 00056880 */       sll $t5, $a1, 2
  /* 156D30 80137B90 016D7021 */      addu $t6, $t3, $t5
  /* 156D34 80137B94 11800009 */      beqz $t4, .L80137BBC
  /* 156D38 80137B98 01637821 */      addu $t7, $t3, $v1
  /* 156D3C 80137B9C 8DC70000 */        lw $a3, ($t6)
  /* 156D40 80137BA0 8DE80008 */        lw $t0, 8($t7)
  /* 156D44 80137BA4 14E80002 */       bne $a3, $t0, .L80137BB0
  /* 156D48 80137BA8 00E8082A */       slt $at, $a3, $t0
  /* 156D4C 80137BAC 24060001 */     addiu $a2, $zero, 1
  .L80137BB0:
  /* 156D50 80137BB0 50200003 */      beql $at, $zero, .L80137BC0
  /* 156D54 80137BB4 8C98000C */        lw $t8, 0xc($a0)
  /* 156D58 80137BB8 24450002 */     addiu $a1, $v0, 2
  .L80137BBC:
  /* 156D5C 80137BBC 8C98000C */        lw $t8, 0xc($a0)
  .L80137BC0:
  /* 156D60 80137BC0 0005C880 */       sll $t9, $a1, 2
  /* 156D64 80137BC4 01796021 */      addu $t4, $t3, $t9
  /* 156D68 80137BC8 1300000A */      beqz $t8, .L80137BF4
  /* 156D6C 80137BCC 24840010 */     addiu $a0, $a0, 0x10
  /* 156D70 80137BD0 01636821 */      addu $t5, $t3, $v1
  /* 156D74 80137BD4 8DA8000C */        lw $t0, 0xc($t5)
  /* 156D78 80137BD8 8D870000 */        lw $a3, ($t4)
  /* 156D7C 80137BDC 14E80002 */       bne $a3, $t0, .L80137BE8
  /* 156D80 80137BE0 00E8082A */       slt $at, $a3, $t0
  /* 156D84 80137BE4 24060001 */     addiu $a2, $zero, 1
  .L80137BE8:
  /* 156D88 80137BE8 50200003 */      beql $at, $zero, .L80137BF8
  /* 156D8C 80137BEC 24420004 */     addiu $v0, $v0, 4
  /* 156D90 80137BF0 24450003 */     addiu $a1, $v0, 3
  .L80137BF4:
  /* 156D94 80137BF4 24420004 */     addiu $v0, $v0, 4
  .L80137BF8:
  /* 156D98 80137BF8 144AFFC9 */       bne $v0, $t2, .L80137B20
  /* 156D9C 80137BFC 24630010 */     addiu $v1, $v1, 0x10
  .L80137C00:
  /* 156DA0 80137C00 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 156DA4 80137C04 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  /* 156DA8 80137C08 10C00087 */      beqz $a2, .L80137E28
  /* 156DAC 80137C0C 240A0004 */     addiu $t2, $zero, 4
  /* 156DB0 80137C10 28A10004 */      slti $at, $a1, 4
  /* 156DB4 80137C14 10200084 */      beqz $at, .L80137E28
  /* 156DB8 80137C18 00A01025 */        or $v0, $a1, $zero
  /* 156DBC 80137C1C 240E0004 */     addiu $t6, $zero, 4
  /* 156DC0 80137C20 01C53823 */      subu $a3, $t6, $a1
  /* 156DC4 80137C24 30E70003 */      andi $a3, $a3, 3
  /* 156DC8 80137C28 10E00021 */      beqz $a3, .L80137CB0
  /* 156DCC 80137C2C 00E53021 */      addu $a2, $a3, $a1
  /* 156DD0 80137C30 00021880 */       sll $v1, $v0, 2
  /* 156DD4 80137C34 27AF0024 */     addiu $t7, $sp, 0x24
  /* 156DD8 80137C38 3C07800A */       lui $a3, %hi(gTransferBattleState)
  /* 156DDC 80137C3C 24E74D08 */     addiu $a3, $a3, %lo(gTransferBattleState)
  /* 156DE0 80137C40 006F2021 */      addu $a0, $v1, $t7
  /* 156DE4 80137C44 24080074 */     addiu $t0, $zero, 0x74
  .L80137C48:
  /* 156DE8 80137C48 8C980000 */        lw $t8, ($a0)
  /* 156DEC 80137C4C 0005C880 */       sll $t9, $a1, 2
  /* 156DF0 80137C50 01796021 */      addu $t4, $t3, $t9
  /* 156DF4 80137C54 13000012 */      beqz $t8, .L80137CA0
  /* 156DF8 80137C58 24840004 */     addiu $a0, $a0, 4
  /* 156DFC 80137C5C 01637021 */      addu $t6, $t3, $v1
  /* 156E00 80137C60 8DCF0000 */        lw $t7, ($t6)
  /* 156E04 80137C64 8D8D0000 */        lw $t5, ($t4)
  /* 156E08 80137C68 55AF000E */      bnel $t5, $t7, .L80137CA4
  /* 156E0C 80137C6C 24420001 */     addiu $v0, $v0, 1
  /* 156E10 80137C70 00A80019 */     multu $a1, $t0
  /* 156E14 80137C74 0000C012 */      mflo $t8
  /* 156E18 80137C78 00F8C821 */      addu $t9, $a3, $t8
  /* 156E1C 80137C7C 932C0021 */       lbu $t4, 0x21($t9)
  /* 156E20 80137C80 00480019 */     multu $v0, $t0
  /* 156E24 80137C84 00007012 */      mflo $t6
  /* 156E28 80137C88 00EE6821 */      addu $t5, $a3, $t6
  /* 156E2C 80137C8C 91AF0021 */       lbu $t7, 0x21($t5)
  /* 156E30 80137C90 018F082A */       slt $at, $t4, $t7
  /* 156E34 80137C94 50200003 */      beql $at, $zero, .L80137CA4
  /* 156E38 80137C98 24420001 */     addiu $v0, $v0, 1
  /* 156E3C 80137C9C 00402825 */        or $a1, $v0, $zero
  .L80137CA0:
  /* 156E40 80137CA0 24420001 */     addiu $v0, $v0, 1
  .L80137CA4:
  /* 156E44 80137CA4 14C2FFE8 */       bne $a2, $v0, .L80137C48
  /* 156E48 80137CA8 24630004 */     addiu $v1, $v1, 4
  /* 156E4C 80137CAC 104A005E */       beq $v0, $t2, .L80137E28
  .L80137CB0:
  /* 156E50 80137CB0 3C07800A */       lui $a3, %hi(gTransferBattleState)
  /* 156E54 80137CB4 00021880 */       sll $v1, $v0, 2
  /* 156E58 80137CB8 27B80024 */     addiu $t8, $sp, 0x24
  /* 156E5C 80137CBC 00782021 */      addu $a0, $v1, $t8
  /* 156E60 80137CC0 24E74D08 */     addiu $a3, $a3, %lo(gTransferBattleState)
  /* 156E64 80137CC4 24080074 */     addiu $t0, $zero, 0x74
  .L80137CC8:
  /* 156E68 80137CC8 8C990000 */        lw $t9, ($a0)
  /* 156E6C 80137CCC 00057080 */       sll $t6, $a1, 2
  /* 156E70 80137CD0 016E6821 */      addu $t5, $t3, $t6
  /* 156E74 80137CD4 13200011 */      beqz $t9, .L80137D1C
  /* 156E78 80137CD8 01637821 */      addu $t7, $t3, $v1
  /* 156E7C 80137CDC 8DAC0000 */        lw $t4, ($t5)
  /* 156E80 80137CE0 8DF80000 */        lw $t8, ($t7)
  /* 156E84 80137CE4 5598000E */      bnel $t4, $t8, .L80137D20
  /* 156E88 80137CE8 8C990004 */        lw $t9, 4($a0)
  /* 156E8C 80137CEC 00A80019 */     multu $a1, $t0
  /* 156E90 80137CF0 0000C812 */      mflo $t9
  /* 156E94 80137CF4 00F97021 */      addu $t6, $a3, $t9
  /* 156E98 80137CF8 91CD0021 */       lbu $t5, 0x21($t6)
  /* 156E9C 80137CFC 00480019 */     multu $v0, $t0
  /* 156EA0 80137D00 00007812 */      mflo $t7
  /* 156EA4 80137D04 00EF6021 */      addu $t4, $a3, $t7
  /* 156EA8 80137D08 91980021 */       lbu $t8, 0x21($t4)
  /* 156EAC 80137D0C 01B8082A */       slt $at, $t5, $t8
  /* 156EB0 80137D10 50200003 */      beql $at, $zero, .L80137D20
  /* 156EB4 80137D14 8C990004 */        lw $t9, 4($a0)
  /* 156EB8 80137D18 00402825 */        or $a1, $v0, $zero
  .L80137D1C:
  /* 156EBC 80137D1C 8C990004 */        lw $t9, 4($a0)
  .L80137D20:
  /* 156EC0 80137D20 00057080 */       sll $t6, $a1, 2
  /* 156EC4 80137D24 016E7821 */      addu $t7, $t3, $t6
  /* 156EC8 80137D28 13200011 */      beqz $t9, .L80137D70
  /* 156ECC 80137D2C 01636821 */      addu $t5, $t3, $v1
  /* 156ED0 80137D30 8DEC0000 */        lw $t4, ($t7)
  /* 156ED4 80137D34 8DB80004 */        lw $t8, 4($t5)
  /* 156ED8 80137D38 5598000E */      bnel $t4, $t8, .L80137D74
  /* 156EDC 80137D3C 8C990008 */        lw $t9, 8($a0)
  /* 156EE0 80137D40 00A80019 */     multu $a1, $t0
  /* 156EE4 80137D44 0000C812 */      mflo $t9
  /* 156EE8 80137D48 00F97021 */      addu $t6, $a3, $t9
  /* 156EEC 80137D4C 91CF0021 */       lbu $t7, 0x21($t6)
  /* 156EF0 80137D50 00480019 */     multu $v0, $t0
  /* 156EF4 80137D54 00006812 */      mflo $t5
  /* 156EF8 80137D58 00ED6021 */      addu $t4, $a3, $t5
  /* 156EFC 80137D5C 91980095 */       lbu $t8, 0x95($t4)
  /* 156F00 80137D60 01F8082A */       slt $at, $t7, $t8
  /* 156F04 80137D64 50200003 */      beql $at, $zero, .L80137D74
  /* 156F08 80137D68 8C990008 */        lw $t9, 8($a0)
  /* 156F0C 80137D6C 24450001 */     addiu $a1, $v0, 1
  .L80137D70:
  /* 156F10 80137D70 8C990008 */        lw $t9, 8($a0)
  .L80137D74:
  /* 156F14 80137D74 00057080 */       sll $t6, $a1, 2
  /* 156F18 80137D78 016E6821 */      addu $t5, $t3, $t6
  /* 156F1C 80137D7C 13200011 */      beqz $t9, .L80137DC4
  /* 156F20 80137D80 01637821 */      addu $t7, $t3, $v1
  /* 156F24 80137D84 8DAC0000 */        lw $t4, ($t5)
  /* 156F28 80137D88 8DF80008 */        lw $t8, 8($t7)
  /* 156F2C 80137D8C 5598000E */      bnel $t4, $t8, .L80137DC8
  /* 156F30 80137D90 8C99000C */        lw $t9, 0xc($a0)
  /* 156F34 80137D94 00A80019 */     multu $a1, $t0
  /* 156F38 80137D98 0000C812 */      mflo $t9
  /* 156F3C 80137D9C 00F97021 */      addu $t6, $a3, $t9
  /* 156F40 80137DA0 91CD0021 */       lbu $t5, 0x21($t6)
  /* 156F44 80137DA4 00480019 */     multu $v0, $t0
  /* 156F48 80137DA8 00007812 */      mflo $t7
  /* 156F4C 80137DAC 00EF6021 */      addu $t4, $a3, $t7
  /* 156F50 80137DB0 91980109 */       lbu $t8, 0x109($t4)
  /* 156F54 80137DB4 01B8082A */       slt $at, $t5, $t8
  /* 156F58 80137DB8 50200003 */      beql $at, $zero, .L80137DC8
  /* 156F5C 80137DBC 8C99000C */        lw $t9, 0xc($a0)
  /* 156F60 80137DC0 24450002 */     addiu $a1, $v0, 2
  .L80137DC4:
  /* 156F64 80137DC4 8C99000C */        lw $t9, 0xc($a0)
  .L80137DC8:
  /* 156F68 80137DC8 00057080 */       sll $t6, $a1, 2
  /* 156F6C 80137DCC 016E7821 */      addu $t7, $t3, $t6
  /* 156F70 80137DD0 13200012 */      beqz $t9, .L80137E1C
  /* 156F74 80137DD4 24840010 */     addiu $a0, $a0, 0x10
  /* 156F78 80137DD8 01636821 */      addu $t5, $t3, $v1
  /* 156F7C 80137DDC 8DB8000C */        lw $t8, 0xc($t5)
  /* 156F80 80137DE0 8DEC0000 */        lw $t4, ($t7)
  /* 156F84 80137DE4 5598000E */      bnel $t4, $t8, .L80137E20
  /* 156F88 80137DE8 24420004 */     addiu $v0, $v0, 4
  /* 156F8C 80137DEC 00A80019 */     multu $a1, $t0
  /* 156F90 80137DF0 0000C812 */      mflo $t9
  /* 156F94 80137DF4 00F97021 */      addu $t6, $a3, $t9
  /* 156F98 80137DF8 91CF0021 */       lbu $t7, 0x21($t6)
  /* 156F9C 80137DFC 00480019 */     multu $v0, $t0
  /* 156FA0 80137E00 00006812 */      mflo $t5
  /* 156FA4 80137E04 00ED6021 */      addu $t4, $a3, $t5
  /* 156FA8 80137E08 9198017D */       lbu $t8, 0x17d($t4)
  /* 156FAC 80137E0C 01F8082A */       slt $at, $t7, $t8
  /* 156FB0 80137E10 50200003 */      beql $at, $zero, .L80137E20
  /* 156FB4 80137E14 24420004 */     addiu $v0, $v0, 4
  /* 156FB8 80137E18 24450003 */     addiu $a1, $v0, 3
  .L80137E1C:
  /* 156FBC 80137E1C 24420004 */     addiu $v0, $v0, 4
  .L80137E20:
  /* 156FC0 80137E20 144AFFA9 */       bne $v0, $t2, .L80137CC8
  /* 156FC4 80137E24 24630010 */     addiu $v1, $v1, 0x10
  .L80137E28:
  /* 156FC8 80137E28 00A01025 */        or $v0, $a1, $zero
  /* 156FCC 80137E2C 03E00008 */        jr $ra
  /* 156FD0 80137E30 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnResultsGetBestHumanOtherThan
  /* 156FD4 80137E34 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 156FD8 80137E38 3C02800A */       lui $v0, %hi(gTransferBattleState)
  /* 156FDC 80137E3C 24424D08 */     addiu $v0, $v0, %lo(gTransferBattleState)
  /* 156FE0 80137E40 27A6001C */     addiu $a2, $sp, 0x1c
  /* 156FE4 80137E44 27A3002C */     addiu $v1, $sp, 0x2c
  /* 156FE8 80137E48 24090001 */     addiu $t1, $zero, 1
  .L80137E4C:
  /* 156FEC 80137E4C 904E0022 */       lbu $t6, 0x22($v0) # gTransferBattleState + 34
  /* 156FF0 80137E50 55C00004 */      bnel $t6, $zero, .L80137E64
  /* 156FF4 80137E54 ACC00000 */        sw $zero, ($a2)
  /* 156FF8 80137E58 10000002 */         b .L80137E64
  /* 156FFC 80137E5C ACC90000 */        sw $t1, ($a2)
  /* 157000 80137E60 ACC00000 */        sw $zero, ($a2)
  .L80137E64:
  /* 157004 80137E64 24C60004 */     addiu $a2, $a2, 4
  /* 157008 80137E68 00C3082B */      sltu $at, $a2, $v1
  /* 15700C 80137E6C 1420FFF7 */      bnez $at, .L80137E4C
  /* 157010 80137E70 24420074 */     addiu $v0, $v0, 0x74
  /* 157014 80137E74 8FA20018 */        lw $v0, 0x18($sp)
  /* 157018 80137E78 240A0004 */     addiu $t2, $zero, 4
  /* 15701C 80137E7C 28410004 */      slti $at, $v0, 4
  /* 157020 80137E80 1020005B */      beqz $at, .L80137FF0
  /* 157024 80137E84 00401825 */        or $v1, $v0, $zero
  /* 157028 80137E88 01424023 */      subu $t0, $t2, $v0
  /* 15702C 80137E8C 31080003 */      andi $t0, $t0, 3
  /* 157030 80137E90 11000018 */      beqz $t0, .L80137EF4
  /* 157034 80137E94 01023821 */      addu $a3, $t0, $v0
  /* 157038 80137E98 00022880 */       sll $a1, $v0, 2
  /* 15703C 80137E9C 3C028014 */       lui $v0, %hi(gMNResultsPoints)
  /* 157040 80137EA0 27AF001C */     addiu $t7, $sp, 0x1c
  /* 157044 80137EA4 00AF3021 */      addu $a2, $a1, $t7
  /* 157048 80137EA8 24429BA0 */     addiu $v0, $v0, %lo(gMNResultsPoints)
  .L80137EAC:
  /* 15704C 80137EAC 8CD80000 */        lw $t8, ($a2)
  /* 157050 80137EB0 24C60004 */     addiu $a2, $a2, 4
  /* 157054 80137EB4 5300000C */      beql $t8, $zero, .L80137EE8
  /* 157058 80137EB8 24630001 */     addiu $v1, $v1, 1
  /* 15705C 80137EBC 10830009 */       beq $a0, $v1, .L80137EE4
  /* 157060 80137EC0 0004C880 */       sll $t9, $a0, 2
  /* 157064 80137EC4 00595821 */      addu $t3, $v0, $t9
  /* 157068 80137EC8 00456821 */      addu $t5, $v0, $a1
  /* 15706C 80137ECC 8DAE0000 */        lw $t6, ($t5)
  /* 157070 80137ED0 8D6C0000 */        lw $t4, ($t3)
  /* 157074 80137ED4 558E0004 */      bnel $t4, $t6, .L80137EE8
  /* 157078 80137ED8 24630001 */     addiu $v1, $v1, 1
  /* 15707C 80137EDC 10000092 */         b .L80138128
  /* 157080 80137EE0 00601025 */        or $v0, $v1, $zero
  .L80137EE4:
  /* 157084 80137EE4 24630001 */     addiu $v1, $v1, 1
  .L80137EE8:
  /* 157088 80137EE8 14E3FFF0 */       bne $a3, $v1, .L80137EAC
  /* 15708C 80137EEC 24A50004 */     addiu $a1, $a1, 4
  /* 157090 80137EF0 106A003F */       beq $v1, $t2, .L80137FF0
  .L80137EF4:
  /* 157094 80137EF4 3C028014 */       lui $v0, %hi(gMNResultsPoints)
  /* 157098 80137EF8 00032880 */       sll $a1, $v1, 2
  /* 15709C 80137EFC 27AF001C */     addiu $t7, $sp, 0x1c
  /* 1570A0 80137F00 00AF3021 */      addu $a2, $a1, $t7
  /* 1570A4 80137F04 24429BA0 */     addiu $v0, $v0, %lo(gMNResultsPoints)
  .L80137F08:
  /* 1570A8 80137F08 8CD80000 */        lw $t8, ($a2)
  /* 1570AC 80137F0C 5300000C */      beql $t8, $zero, .L80137F40
  /* 1570B0 80137F10 8CCF0004 */        lw $t7, 4($a2)
  /* 1570B4 80137F14 10830009 */       beq $a0, $v1, .L80137F3C
  /* 1570B8 80137F18 0004C880 */       sll $t9, $a0, 2
  /* 1570BC 80137F1C 00595821 */      addu $t3, $v0, $t9
  /* 1570C0 80137F20 00456021 */      addu $t4, $v0, $a1
  /* 1570C4 80137F24 8D8E0000 */        lw $t6, ($t4)
  /* 1570C8 80137F28 8D6D0000 */        lw $t5, ($t3)
  /* 1570CC 80137F2C 55AE0004 */      bnel $t5, $t6, .L80137F40
  /* 1570D0 80137F30 8CCF0004 */        lw $t7, 4($a2)
  /* 1570D4 80137F34 1000007C */         b .L80138128
  /* 1570D8 80137F38 00601025 */        or $v0, $v1, $zero
  .L80137F3C:
  /* 1570DC 80137F3C 8CCF0004 */        lw $t7, 4($a2)
  .L80137F40:
  /* 1570E0 80137F40 24670001 */     addiu $a3, $v1, 1
  /* 1570E4 80137F44 51E0000C */      beql $t7, $zero, .L80137F78
  /* 1570E8 80137F48 8CCE0008 */        lw $t6, 8($a2)
  /* 1570EC 80137F4C 10870009 */       beq $a0, $a3, .L80137F74
  /* 1570F0 80137F50 0004C080 */       sll $t8, $a0, 2
  /* 1570F4 80137F54 0058C821 */      addu $t9, $v0, $t8
  /* 1570F8 80137F58 00456021 */      addu $t4, $v0, $a1
  /* 1570FC 80137F5C 8D8D0004 */        lw $t5, 4($t4)
  /* 157100 80137F60 8F2B0000 */        lw $t3, ($t9)
  /* 157104 80137F64 556D0004 */      bnel $t3, $t5, .L80137F78
  /* 157108 80137F68 8CCE0008 */        lw $t6, 8($a2)
  /* 15710C 80137F6C 1000006E */         b .L80138128
  /* 157110 80137F70 00E01025 */        or $v0, $a3, $zero
  .L80137F74:
  /* 157114 80137F74 8CCE0008 */        lw $t6, 8($a2)
  .L80137F78:
  /* 157118 80137F78 24670002 */     addiu $a3, $v1, 2
  /* 15711C 80137F7C 51C0000C */      beql $t6, $zero, .L80137FB0
  /* 157120 80137F80 8CCD000C */        lw $t5, 0xc($a2)
  /* 157124 80137F84 10870009 */       beq $a0, $a3, .L80137FAC
  /* 157128 80137F88 00047880 */       sll $t7, $a0, 2
  /* 15712C 80137F8C 004FC021 */      addu $t8, $v0, $t7
  /* 157130 80137F90 00456021 */      addu $t4, $v0, $a1
  /* 157134 80137F94 8D8B0008 */        lw $t3, 8($t4)
  /* 157138 80137F98 8F190000 */        lw $t9, ($t8)
  /* 15713C 80137F9C 572B0004 */      bnel $t9, $t3, .L80137FB0
  /* 157140 80137FA0 8CCD000C */        lw $t5, 0xc($a2)
  /* 157144 80137FA4 10000060 */         b .L80138128
  /* 157148 80137FA8 00E01025 */        or $v0, $a3, $zero
  .L80137FAC:
  /* 15714C 80137FAC 8CCD000C */        lw $t5, 0xc($a2)
  .L80137FB0:
  /* 157150 80137FB0 24670003 */     addiu $a3, $v1, 3
  /* 157154 80137FB4 24630004 */     addiu $v1, $v1, 4
  /* 157158 80137FB8 11A0000B */      beqz $t5, .L80137FE8
  /* 15715C 80137FBC 24C60010 */     addiu $a2, $a2, 0x10
  /* 157160 80137FC0 10870009 */       beq $a0, $a3, .L80137FE8
  /* 157164 80137FC4 00047080 */       sll $t6, $a0, 2
  /* 157168 80137FC8 004E7821 */      addu $t7, $v0, $t6
  /* 15716C 80137FCC 00456021 */      addu $t4, $v0, $a1
  /* 157170 80137FD0 8D99000C */        lw $t9, 0xc($t4)
  /* 157174 80137FD4 8DF80000 */        lw $t8, ($t7)
  /* 157178 80137FD8 17190003 */       bne $t8, $t9, .L80137FE8
  /* 15717C 80137FDC 00000000 */       nop
  /* 157180 80137FE0 10000051 */         b .L80138128
  /* 157184 80137FE4 00E01025 */        or $v0, $a3, $zero
  .L80137FE8:
  /* 157188 80137FE8 146AFFC7 */       bne $v1, $t2, .L80137F08
  /* 15718C 80137FEC 24A50010 */     addiu $a1, $a1, 0x10
  .L80137FF0:
  /* 157190 80137FF0 3C028014 */       lui $v0, %hi(gMNResultsPoints)
  /* 157194 80137FF4 24429BA0 */     addiu $v0, $v0, %lo(gMNResultsPoints)
  /* 157198 80137FF8 2405029A */     addiu $a1, $zero, 0x29a
  /* 15719C 80137FFC 00001825 */        or $v1, $zero, $zero
  /* 1571A0 80138000 27A6001C */     addiu $a2, $sp, 0x1c
  .L80138004:
  /* 1571A4 80138004 8CCB0000 */        lw $t3, ($a2)
  /* 1571A8 80138008 51600005 */      beql $t3, $zero, .L80138020
  /* 1571AC 8013800C 24630001 */     addiu $v1, $v1, 1
  /* 1571B0 80138010 50830003 */      beql $a0, $v1, .L80138020
  /* 1571B4 80138014 24630001 */     addiu $v1, $v1, 1
  /* 1571B8 80138018 00602825 */        or $a1, $v1, $zero
  /* 1571BC 8013801C 24630001 */     addiu $v1, $v1, 1
  .L80138020:
  /* 1571C0 80138020 28610004 */      slti $at, $v1, 4
  /* 1571C4 80138024 1420FFF7 */      bnez $at, .L80138004
  /* 1571C8 80138028 24C60004 */     addiu $a2, $a2, 4
  /* 1571CC 8013802C 2401029A */     addiu $at, $zero, 0x29a
  /* 1571D0 80138030 14A10003 */       bne $a1, $at, .L80138040
  /* 1571D4 80138034 8FAD001C */        lw $t5, 0x1c($sp)
  /* 1571D8 80138038 1000003B */         b .L80138128
  /* 1571DC 8013803C 2402029A */     addiu $v0, $zero, 0x29a
  .L80138040:
  /* 1571E0 80138040 11A0000D */      beqz $t5, .L80138078
  /* 1571E4 80138044 8FB90020 */        lw $t9, 0x20($sp)
  /* 1571E8 80138048 1080000B */      beqz $a0, .L80138078
  /* 1571EC 8013804C 00000000 */       nop
  /* 1571F0 80138050 10A00009 */      beqz $a1, .L80138078
  /* 1571F4 80138054 00057080 */       sll $t6, $a1, 2
  /* 1571F8 80138058 004E7821 */      addu $t7, $v0, $t6
  /* 1571FC 8013805C 3C188014 */       lui $t8, %hi(gMNResultsPoints)
  /* 157200 80138060 8F189BA0 */        lw $t8, %lo(gMNResultsPoints)($t8)
  /* 157204 80138064 8DEC0000 */        lw $t4, ($t7)
  /* 157208 80138068 0198082A */       slt $at, $t4, $t8
  /* 15720C 8013806C 10200002 */      beqz $at, .L80138078
  /* 157210 80138070 00000000 */       nop
  /* 157214 80138074 00002825 */        or $a1, $zero, $zero
  .L80138078:
  /* 157218 80138078 1320000D */      beqz $t9, .L801380B0
  /* 15721C 8013807C 8FAC0024 */        lw $t4, 0x24($sp)
  /* 157220 80138080 1089000B */       beq $a0, $t1, .L801380B0
  /* 157224 80138084 00000000 */       nop
  /* 157228 80138088 10A90009 */       beq $a1, $t1, .L801380B0
  /* 15722C 8013808C 00055880 */       sll $t3, $a1, 2
  /* 157230 80138090 004B6821 */      addu $t5, $v0, $t3
  /* 157234 80138094 3C0F8014 */       lui $t7, %hi(D_ovl31_80139BA4)
  /* 157238 80138098 8DEF9BA4 */        lw $t7, %lo(D_ovl31_80139BA4)($t7)
  /* 15723C 8013809C 8DAE0000 */        lw $t6, ($t5)
  /* 157240 801380A0 01CF082A */       slt $at, $t6, $t7
  /* 157244 801380A4 10200002 */      beqz $at, .L801380B0
  /* 157248 801380A8 00000000 */       nop
  /* 15724C 801380AC 24050001 */     addiu $a1, $zero, 1
  .L801380B0:
  /* 157250 801380B0 1180000E */      beqz $t4, .L801380EC
  /* 157254 801380B4 8FAE0028 */        lw $t6, 0x28($sp)
  /* 157258 801380B8 24030002 */     addiu $v1, $zero, 2
  /* 15725C 801380BC 1083000B */       beq $a0, $v1, .L801380EC
  /* 157260 801380C0 00000000 */       nop
  /* 157264 801380C4 10A30009 */       beq $a1, $v1, .L801380EC
  /* 157268 801380C8 0005C080 */       sll $t8, $a1, 2
  /* 15726C 801380CC 0058C821 */      addu $t9, $v0, $t8
  /* 157270 801380D0 3C0D8014 */       lui $t5, %hi(D_ovl31_80139BA8)
  /* 157274 801380D4 8DAD9BA8 */        lw $t5, %lo(D_ovl31_80139BA8)($t5)
  /* 157278 801380D8 8F2B0000 */        lw $t3, ($t9)
  /* 15727C 801380DC 016D082A */       slt $at, $t3, $t5
  /* 157280 801380E0 10200002 */      beqz $at, .L801380EC
  /* 157284 801380E4 00000000 */       nop
  /* 157288 801380E8 24050002 */     addiu $a1, $zero, 2
  .L801380EC:
  /* 15728C 801380EC 11C0000D */      beqz $t6, .L80138124
  /* 157290 801380F0 24030003 */     addiu $v1, $zero, 3
  /* 157294 801380F4 5083000C */      beql $a0, $v1, .L80138128
  /* 157298 801380F8 00A01025 */        or $v0, $a1, $zero
  /* 15729C 801380FC 10A30009 */       beq $a1, $v1, .L80138124
  /* 1572A0 80138100 00057880 */       sll $t7, $a1, 2
  /* 1572A4 80138104 004F6021 */      addu $t4, $v0, $t7
  /* 1572A8 80138108 3C198014 */       lui $t9, %hi(D_ovl31_80139BAC)
  /* 1572AC 8013810C 8F399BAC */        lw $t9, %lo(D_ovl31_80139BAC)($t9)
  /* 1572B0 80138110 8D980000 */        lw $t8, ($t4)
  /* 1572B4 80138114 0319082A */       slt $at, $t8, $t9
  /* 1572B8 80138118 50200003 */      beql $at, $zero, .L80138128
  /* 1572BC 8013811C 00A01025 */        or $v0, $a1, $zero
  /* 1572C0 80138120 24050003 */     addiu $a1, $zero, 3
  .L80138124:
  /* 1572C4 80138124 00A01025 */        or $v0, $a1, $zero
  .L80138128:
  /* 1572C8 80138128 03E00008 */        jr $ra
  /* 1572CC 8013812C 27BD0030 */     addiu $sp, $sp, 0x30

glabel mnResultsGetWorstHuman
  /* 1572D0 80138130 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1572D4 80138134 3C03800A */       lui $v1, %hi(gTransferBattleState)
  /* 1572D8 80138138 24634D08 */     addiu $v1, $v1, %lo(gTransferBattleState)
  /* 1572DC 8013813C 27A40024 */     addiu $a0, $sp, 0x24
  /* 1572E0 80138140 27A50034 */     addiu $a1, $sp, 0x34
  /* 1572E4 80138144 24020001 */     addiu $v0, $zero, 1
  .L80138148:
  /* 1572E8 80138148 906E0022 */       lbu $t6, 0x22($v1) # gTransferBattleState + 34
  /* 1572EC 8013814C 55C00004 */      bnel $t6, $zero, .L80138160
  /* 1572F0 80138150 AC800000 */        sw $zero, ($a0)
  /* 1572F4 80138154 10000002 */         b .L80138160
  /* 1572F8 80138158 AC820000 */        sw $v0, ($a0)
  /* 1572FC 8013815C AC800000 */        sw $zero, ($a0)
  .L80138160:
  /* 157300 80138160 24840004 */     addiu $a0, $a0, 4
  /* 157304 80138164 0085082B */      sltu $at, $a0, $a1
  /* 157308 80138168 1420FFF7 */      bnez $at, .L80138148
  /* 15730C 8013816C 24630074 */     addiu $v1, $v1, 0x74
  /* 157310 80138170 00001025 */        or $v0, $zero, $zero
  /* 157314 80138174 27A40024 */     addiu $a0, $sp, 0x24
  .L80138178:
  /* 157318 80138178 8C8F0000 */        lw $t7, ($a0)
  /* 15731C 8013817C 51E00004 */      beql $t7, $zero, .L80138190
  /* 157320 80138180 24420001 */     addiu $v0, $v0, 1
  /* 157324 80138184 10000006 */         b .L801381A0
  /* 157328 80138188 00402825 */        or $a1, $v0, $zero
  /* 15732C 8013818C 24420001 */     addiu $v0, $v0, 1
  .L80138190:
  /* 157330 80138190 28410004 */      slti $at, $v0, 4
  /* 157334 80138194 1420FFF8 */      bnez $at, .L80138178
  /* 157338 80138198 24840004 */     addiu $a0, $a0, 4
  /* 15733C 8013819C 8FA50020 */        lw $a1, 0x20($sp)
  .L801381A0:
  /* 157340 801381A0 28A10004 */      slti $at, $a1, 4
  /* 157344 801381A4 00003025 */        or $a2, $zero, $zero
  /* 157348 801381A8 1020005A */      beqz $at, .L80138314
  /* 15734C 801381AC 00A01025 */        or $v0, $a1, $zero
  /* 157350 801381B0 240A0004 */     addiu $t2, $zero, 4
  /* 157354 801381B4 01453823 */      subu $a3, $t2, $a1
  /* 157358 801381B8 30E70003 */      andi $a3, $a3, 3
  /* 15735C 801381BC 10E00018 */      beqz $a3, .L80138220
  /* 157360 801381C0 00E54821 */      addu $t1, $a3, $a1
  /* 157364 801381C4 00021880 */       sll $v1, $v0, 2
  /* 157368 801381C8 27B80024 */     addiu $t8, $sp, 0x24
  /* 15736C 801381CC 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 157370 801381D0 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  /* 157374 801381D4 00782021 */      addu $a0, $v1, $t8
  .L801381D8:
  /* 157378 801381D8 8C990000 */        lw $t9, ($a0)
  /* 15737C 801381DC 00056080 */       sll $t4, $a1, 2
  /* 157380 801381E0 016C6821 */      addu $t5, $t3, $t4
  /* 157384 801381E4 1320000A */      beqz $t9, .L80138210
  /* 157388 801381E8 24840004 */     addiu $a0, $a0, 4
  /* 15738C 801381EC 01637021 */      addu $t6, $t3, $v1
  /* 157390 801381F0 8DC80000 */        lw $t0, ($t6)
  /* 157394 801381F4 8DA70000 */        lw $a3, ($t5)
  /* 157398 801381F8 14E80002 */       bne $a3, $t0, .L80138204
  /* 15739C 801381FC 0107082A */       slt $at, $t0, $a3
  /* 1573A0 80138200 24060001 */     addiu $a2, $zero, 1
  .L80138204:
  /* 1573A4 80138204 50200003 */      beql $at, $zero, .L80138214
  /* 1573A8 80138208 24420001 */     addiu $v0, $v0, 1
  /* 1573AC 8013820C 00402825 */        or $a1, $v0, $zero
  .L80138210:
  /* 1573B0 80138210 24420001 */     addiu $v0, $v0, 1
  .L80138214:
  /* 1573B4 80138214 1522FFF0 */       bne $t1, $v0, .L801381D8
  /* 1573B8 80138218 24630004 */     addiu $v1, $v1, 4
  /* 1573BC 8013821C 104A003D */       beq $v0, $t2, .L80138314
  .L80138220:
  /* 1573C0 80138220 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 1573C4 80138224 00021880 */       sll $v1, $v0, 2
  /* 1573C8 80138228 27AF0024 */     addiu $t7, $sp, 0x24
  /* 1573CC 8013822C 006F2021 */      addu $a0, $v1, $t7
  /* 1573D0 80138230 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  .L80138234:
  /* 1573D4 80138234 8C980000 */        lw $t8, ($a0)
  /* 1573D8 80138238 0005C880 */       sll $t9, $a1, 2
  /* 1573DC 8013823C 01796021 */      addu $t4, $t3, $t9
  /* 1573E0 80138240 13000009 */      beqz $t8, .L80138268
  /* 1573E4 80138244 01636821 */      addu $t5, $t3, $v1
  /* 1573E8 80138248 8D870000 */        lw $a3, ($t4)
  /* 1573EC 8013824C 8DA80000 */        lw $t0, ($t5)
  /* 1573F0 80138250 14E80002 */       bne $a3, $t0, .L8013825C
  /* 1573F4 80138254 0107082A */       slt $at, $t0, $a3
  /* 1573F8 80138258 24060001 */     addiu $a2, $zero, 1
  .L8013825C:
  /* 1573FC 8013825C 50200003 */      beql $at, $zero, .L8013826C
  /* 157400 80138260 8C8E0004 */        lw $t6, 4($a0)
  /* 157404 80138264 00402825 */        or $a1, $v0, $zero
  .L80138268:
  /* 157408 80138268 8C8E0004 */        lw $t6, 4($a0)
  .L8013826C:
  /* 15740C 8013826C 00057880 */       sll $t7, $a1, 2
  /* 157410 80138270 016FC021 */      addu $t8, $t3, $t7
  /* 157414 80138274 11C00009 */      beqz $t6, .L8013829C
  /* 157418 80138278 0163C821 */      addu $t9, $t3, $v1
  /* 15741C 8013827C 8F070000 */        lw $a3, ($t8)
  /* 157420 80138280 8F280004 */        lw $t0, 4($t9)
  /* 157424 80138284 14E80002 */       bne $a3, $t0, .L80138290
  /* 157428 80138288 0107082A */       slt $at, $t0, $a3
  /* 15742C 8013828C 24060001 */     addiu $a2, $zero, 1
  .L80138290:
  /* 157430 80138290 50200003 */      beql $at, $zero, .L801382A0
  /* 157434 80138294 8C8C0008 */        lw $t4, 8($a0)
  /* 157438 80138298 24450001 */     addiu $a1, $v0, 1
  .L8013829C:
  /* 15743C 8013829C 8C8C0008 */        lw $t4, 8($a0)
  .L801382A0:
  /* 157440 801382A0 00056880 */       sll $t5, $a1, 2
  /* 157444 801382A4 016D7021 */      addu $t6, $t3, $t5
  /* 157448 801382A8 11800009 */      beqz $t4, .L801382D0
  /* 15744C 801382AC 01637821 */      addu $t7, $t3, $v1
  /* 157450 801382B0 8DC70000 */        lw $a3, ($t6)
  /* 157454 801382B4 8DE80008 */        lw $t0, 8($t7)
  /* 157458 801382B8 14E80002 */       bne $a3, $t0, .L801382C4
  /* 15745C 801382BC 0107082A */       slt $at, $t0, $a3
  /* 157460 801382C0 24060001 */     addiu $a2, $zero, 1
  .L801382C4:
  /* 157464 801382C4 50200003 */      beql $at, $zero, .L801382D4
  /* 157468 801382C8 8C98000C */        lw $t8, 0xc($a0)
  /* 15746C 801382CC 24450002 */     addiu $a1, $v0, 2
  .L801382D0:
  /* 157470 801382D0 8C98000C */        lw $t8, 0xc($a0)
  .L801382D4:
  /* 157474 801382D4 0005C880 */       sll $t9, $a1, 2
  /* 157478 801382D8 01796021 */      addu $t4, $t3, $t9
  /* 15747C 801382DC 1300000A */      beqz $t8, .L80138308
  /* 157480 801382E0 24840010 */     addiu $a0, $a0, 0x10
  /* 157484 801382E4 01636821 */      addu $t5, $t3, $v1
  /* 157488 801382E8 8DA8000C */        lw $t0, 0xc($t5)
  /* 15748C 801382EC 8D870000 */        lw $a3, ($t4)
  /* 157490 801382F0 14E80002 */       bne $a3, $t0, .L801382FC
  /* 157494 801382F4 0107082A */       slt $at, $t0, $a3
  /* 157498 801382F8 24060001 */     addiu $a2, $zero, 1
  .L801382FC:
  /* 15749C 801382FC 50200003 */      beql $at, $zero, .L8013830C
  /* 1574A0 80138300 24420004 */     addiu $v0, $v0, 4
  /* 1574A4 80138304 24450003 */     addiu $a1, $v0, 3
  .L80138308:
  /* 1574A8 80138308 24420004 */     addiu $v0, $v0, 4
  .L8013830C:
  /* 1574AC 8013830C 144AFFC9 */       bne $v0, $t2, .L80138234
  /* 1574B0 80138310 24630010 */     addiu $v1, $v1, 0x10
  .L80138314:
  /* 1574B4 80138314 3C0B8014 */       lui $t3, %hi(gMNResultsPoints)
  /* 1574B8 80138318 256B9BA0 */     addiu $t3, $t3, %lo(gMNResultsPoints)
  /* 1574BC 8013831C 10C00087 */      beqz $a2, .L8013853C
  /* 1574C0 80138320 240A0004 */     addiu $t2, $zero, 4
  /* 1574C4 80138324 28A10004 */      slti $at, $a1, 4
  /* 1574C8 80138328 10200084 */      beqz $at, .L8013853C
  /* 1574CC 8013832C 00A01025 */        or $v0, $a1, $zero
  /* 1574D0 80138330 240E0004 */     addiu $t6, $zero, 4
  /* 1574D4 80138334 01C53823 */      subu $a3, $t6, $a1
  /* 1574D8 80138338 30E70003 */      andi $a3, $a3, 3
  /* 1574DC 8013833C 10E00021 */      beqz $a3, .L801383C4
  /* 1574E0 80138340 00E53021 */      addu $a2, $a3, $a1
  /* 1574E4 80138344 00021880 */       sll $v1, $v0, 2
  /* 1574E8 80138348 27AF0024 */     addiu $t7, $sp, 0x24
  /* 1574EC 8013834C 3C07800A */       lui $a3, %hi(gTransferBattleState)
  /* 1574F0 80138350 24E74D08 */     addiu $a3, $a3, %lo(gTransferBattleState)
  /* 1574F4 80138354 006F2021 */      addu $a0, $v1, $t7
  /* 1574F8 80138358 24080074 */     addiu $t0, $zero, 0x74
  .L8013835C:
  /* 1574FC 8013835C 8C980000 */        lw $t8, ($a0)
  /* 157500 80138360 0005C880 */       sll $t9, $a1, 2
  /* 157504 80138364 01796021 */      addu $t4, $t3, $t9
  /* 157508 80138368 13000012 */      beqz $t8, .L801383B4
  /* 15750C 8013836C 24840004 */     addiu $a0, $a0, 4
  /* 157510 80138370 01637021 */      addu $t6, $t3, $v1
  /* 157514 80138374 8DCF0000 */        lw $t7, ($t6)
  /* 157518 80138378 8D8D0000 */        lw $t5, ($t4)
  /* 15751C 8013837C 55AF000E */      bnel $t5, $t7, .L801383B8
  /* 157520 80138380 24420001 */     addiu $v0, $v0, 1
  /* 157524 80138384 00480019 */     multu $v0, $t0
  /* 157528 80138388 0000C012 */      mflo $t8
  /* 15752C 8013838C 00F8C821 */      addu $t9, $a3, $t8
  /* 157530 80138390 932C0021 */       lbu $t4, 0x21($t9)
  /* 157534 80138394 00A80019 */     multu $a1, $t0
  /* 157538 80138398 00007012 */      mflo $t6
  /* 15753C 8013839C 00EE6821 */      addu $t5, $a3, $t6
  /* 157540 801383A0 91AF0021 */       lbu $t7, 0x21($t5)
  /* 157544 801383A4 018F082A */       slt $at, $t4, $t7
  /* 157548 801383A8 50200003 */      beql $at, $zero, .L801383B8
  /* 15754C 801383AC 24420001 */     addiu $v0, $v0, 1
  /* 157550 801383B0 00402825 */        or $a1, $v0, $zero
  .L801383B4:
  /* 157554 801383B4 24420001 */     addiu $v0, $v0, 1
  .L801383B8:
  /* 157558 801383B8 14C2FFE8 */       bne $a2, $v0, .L8013835C
  /* 15755C 801383BC 24630004 */     addiu $v1, $v1, 4
  /* 157560 801383C0 104A005E */       beq $v0, $t2, .L8013853C
  .L801383C4:
  /* 157564 801383C4 3C07800A */       lui $a3, %hi(gTransferBattleState)
  /* 157568 801383C8 00021880 */       sll $v1, $v0, 2
  /* 15756C 801383CC 27B80024 */     addiu $t8, $sp, 0x24
  /* 157570 801383D0 00782021 */      addu $a0, $v1, $t8
  /* 157574 801383D4 24E74D08 */     addiu $a3, $a3, %lo(gTransferBattleState)
  /* 157578 801383D8 24080074 */     addiu $t0, $zero, 0x74
  .L801383DC:
  /* 15757C 801383DC 8C990000 */        lw $t9, ($a0)
  /* 157580 801383E0 00057080 */       sll $t6, $a1, 2
  /* 157584 801383E4 016E6821 */      addu $t5, $t3, $t6
  /* 157588 801383E8 13200011 */      beqz $t9, .L80138430
  /* 15758C 801383EC 01637821 */      addu $t7, $t3, $v1
  /* 157590 801383F0 8DAC0000 */        lw $t4, ($t5)
  /* 157594 801383F4 8DF80000 */        lw $t8, ($t7)
  /* 157598 801383F8 5598000E */      bnel $t4, $t8, .L80138434
  /* 15759C 801383FC 8C990004 */        lw $t9, 4($a0)
  /* 1575A0 80138400 00480019 */     multu $v0, $t0
  /* 1575A4 80138404 0000C812 */      mflo $t9
  /* 1575A8 80138408 00F97021 */      addu $t6, $a3, $t9
  /* 1575AC 8013840C 91CD0021 */       lbu $t5, 0x21($t6)
  /* 1575B0 80138410 00A80019 */     multu $a1, $t0
  /* 1575B4 80138414 00007812 */      mflo $t7
  /* 1575B8 80138418 00EF6021 */      addu $t4, $a3, $t7
  /* 1575BC 8013841C 91980021 */       lbu $t8, 0x21($t4)
  /* 1575C0 80138420 01B8082A */       slt $at, $t5, $t8
  /* 1575C4 80138424 50200003 */      beql $at, $zero, .L80138434
  /* 1575C8 80138428 8C990004 */        lw $t9, 4($a0)
  /* 1575CC 8013842C 00402825 */        or $a1, $v0, $zero
  .L80138430:
  /* 1575D0 80138430 8C990004 */        lw $t9, 4($a0)
  .L80138434:
  /* 1575D4 80138434 00057080 */       sll $t6, $a1, 2
  /* 1575D8 80138438 016E7821 */      addu $t7, $t3, $t6
  /* 1575DC 8013843C 13200011 */      beqz $t9, .L80138484
  /* 1575E0 80138440 01636821 */      addu $t5, $t3, $v1
  /* 1575E4 80138444 8DEC0000 */        lw $t4, ($t7)
  /* 1575E8 80138448 8DB80004 */        lw $t8, 4($t5)
  /* 1575EC 8013844C 5598000E */      bnel $t4, $t8, .L80138488
  /* 1575F0 80138450 8C990008 */        lw $t9, 8($a0)
  /* 1575F4 80138454 00480019 */     multu $v0, $t0
  /* 1575F8 80138458 0000C812 */      mflo $t9
  /* 1575FC 8013845C 00F97021 */      addu $t6, $a3, $t9
  /* 157600 80138460 91CF0095 */       lbu $t7, 0x95($t6)
  /* 157604 80138464 00A80019 */     multu $a1, $t0
  /* 157608 80138468 00006812 */      mflo $t5
  /* 15760C 8013846C 00ED6021 */      addu $t4, $a3, $t5
  /* 157610 80138470 91980021 */       lbu $t8, 0x21($t4)
  /* 157614 80138474 01F8082A */       slt $at, $t7, $t8
  /* 157618 80138478 50200003 */      beql $at, $zero, .L80138488
  /* 15761C 8013847C 8C990008 */        lw $t9, 8($a0)
  /* 157620 80138480 24450001 */     addiu $a1, $v0, 1
  .L80138484:
  /* 157624 80138484 8C990008 */        lw $t9, 8($a0)
  .L80138488:
  /* 157628 80138488 00057080 */       sll $t6, $a1, 2
  /* 15762C 8013848C 016E6821 */      addu $t5, $t3, $t6
  /* 157630 80138490 13200011 */      beqz $t9, .L801384D8
  /* 157634 80138494 01637821 */      addu $t7, $t3, $v1
  /* 157638 80138498 8DAC0000 */        lw $t4, ($t5)
  /* 15763C 8013849C 8DF80008 */        lw $t8, 8($t7)
  /* 157640 801384A0 5598000E */      bnel $t4, $t8, .L801384DC
  /* 157644 801384A4 8C99000C */        lw $t9, 0xc($a0)
  /* 157648 801384A8 00480019 */     multu $v0, $t0
  /* 15764C 801384AC 0000C812 */      mflo $t9
  /* 157650 801384B0 00F97021 */      addu $t6, $a3, $t9
  /* 157654 801384B4 91CD0109 */       lbu $t5, 0x109($t6)
  /* 157658 801384B8 00A80019 */     multu $a1, $t0
  /* 15765C 801384BC 00007812 */      mflo $t7
  /* 157660 801384C0 00EF6021 */      addu $t4, $a3, $t7
  /* 157664 801384C4 91980021 */       lbu $t8, 0x21($t4)
  /* 157668 801384C8 01B8082A */       slt $at, $t5, $t8
  /* 15766C 801384CC 50200003 */      beql $at, $zero, .L801384DC
  /* 157670 801384D0 8C99000C */        lw $t9, 0xc($a0)
  /* 157674 801384D4 24450002 */     addiu $a1, $v0, 2
  .L801384D8:
  /* 157678 801384D8 8C99000C */        lw $t9, 0xc($a0)
  .L801384DC:
  /* 15767C 801384DC 00057080 */       sll $t6, $a1, 2
  /* 157680 801384E0 016E7821 */      addu $t7, $t3, $t6
  /* 157684 801384E4 13200012 */      beqz $t9, .L80138530
  /* 157688 801384E8 24840010 */     addiu $a0, $a0, 0x10
  /* 15768C 801384EC 01636821 */      addu $t5, $t3, $v1
  /* 157690 801384F0 8DB8000C */        lw $t8, 0xc($t5)
  /* 157694 801384F4 8DEC0000 */        lw $t4, ($t7)
  /* 157698 801384F8 5598000E */      bnel $t4, $t8, .L80138534
  /* 15769C 801384FC 24420004 */     addiu $v0, $v0, 4
  /* 1576A0 80138500 00480019 */     multu $v0, $t0
  /* 1576A4 80138504 0000C812 */      mflo $t9
  /* 1576A8 80138508 00F97021 */      addu $t6, $a3, $t9
  /* 1576AC 8013850C 91CF017D */       lbu $t7, 0x17d($t6)
  /* 1576B0 80138510 00A80019 */     multu $a1, $t0
  /* 1576B4 80138514 00006812 */      mflo $t5
  /* 1576B8 80138518 00ED6021 */      addu $t4, $a3, $t5
  /* 1576BC 8013851C 91980021 */       lbu $t8, 0x21($t4)
  /* 1576C0 80138520 01F8082A */       slt $at, $t7, $t8
  /* 1576C4 80138524 50200003 */      beql $at, $zero, .L80138534
  /* 1576C8 80138528 24420004 */     addiu $v0, $v0, 4
  /* 1576CC 8013852C 24450003 */     addiu $a1, $v0, 3
  .L80138530:
  /* 1576D0 80138530 24420004 */     addiu $v0, $v0, 4
  .L80138534:
  /* 1576D4 80138534 144AFFA9 */       bne $v0, $t2, .L801383DC
  /* 1576D8 80138538 24630010 */     addiu $v1, $v1, 0x10
  .L8013853C:
  /* 1576DC 8013853C 00A01025 */        or $v0, $a1, $zero
  /* 1576E0 80138540 03E00008 */        jr $ra
  /* 1576E4 80138544 27BD0038 */     addiu $sp, $sp, 0x38

glabel mnResultsSetAutoHandicaps
  /* 1576E8 80138548 240D0074 */     addiu $t5, $zero, 0x74
  /* 1576EC 8013854C 008D0019 */     multu $a0, $t5
  /* 1576F0 80138550 3C0C800A */       lui $t4, %hi(gTransferBattleState)
  /* 1576F4 80138554 258C4D08 */     addiu $t4, $t4, %lo(gTransferBattleState)
  /* 1576F8 80138558 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1576FC 8013855C 240B0001 */     addiu $t3, $zero, 1
  /* 157700 80138560 AFBF0014 */        sw $ra, 0x14($sp)
  /* 157704 80138564 00007012 */      mflo $t6
  /* 157708 80138568 018E4021 */      addu $t0, $t4, $t6
  /* 15770C 8013856C 91060021 */       lbu $a2, 0x21($t0)
  /* 157710 80138570 00AD0019 */     multu $a1, $t5
  /* 157714 80138574 24050009 */     addiu $a1, $zero, 9
  /* 157718 80138578 00C01025 */        or $v0, $a2, $zero
  /* 15771C 8013857C 28410002 */      slti $at, $v0, 2
  /* 157720 80138580 00C04825 */        or $t1, $a2, $zero
  /* 157724 80138584 00007812 */      mflo $t7
  /* 157728 80138588 018F3821 */      addu $a3, $t4, $t7
  /* 15772C 8013858C 90EA0021 */       lbu $t2, 0x21($a3)
  /* 157730 80138590 14CB0003 */       bne $a2, $t3, .L801385A0
  /* 157734 80138594 01401825 */        or $v1, $t2, $zero
  /* 157738 80138598 50650045 */      beql $v1, $a1, .L801386B0
  /* 15773C 8013859C 8FBF0014 */        lw $ra, 0x14($sp)
  .L801385A0:
  /* 157740 801385A0 14200009 */      bnez $at, .L801385C8
  /* 157744 801385A4 24050009 */     addiu $a1, $zero, 9
  /* 157748 801385A8 28610009 */      slti $at, $v1, 9
  /* 15774C 801385AC 10200006 */      beqz $at, .L801385C8
  /* 157750 801385B0 24D8FFFF */     addiu $t8, $a2, -1
  /* 157754 801385B4 A1180021 */        sb $t8, 0x21($t0)
  /* 157758 801385B8 90F90021 */       lbu $t9, 0x21($a3)
  /* 15775C 801385BC 272E0001 */     addiu $t6, $t9, 1
  /* 157760 801385C0 1000003A */         b .L801386AC
  /* 157764 801385C4 A0EE0021 */        sb $t6, 0x21($a3)
  .L801385C8:
  /* 157768 801385C8 144B0005 */       bne $v0, $t3, .L801385E0
  /* 15776C 801385CC 28610008 */      slti $at, $v1, 8
  /* 157770 801385D0 10200003 */      beqz $at, .L801385E0
  /* 157774 801385D4 254F0002 */     addiu $t7, $t2, 2
  /* 157778 801385D8 10000034 */         b .L801386AC
  /* 15777C 801385DC A0EF0021 */        sb $t7, 0x21($a3)
  .L801385E0:
  /* 157780 801385E0 28410003 */      slti $at, $v0, 3
  /* 157784 801385E4 14200005 */      bnez $at, .L801385FC
  /* 157788 801385E8 00000000 */       nop
  /* 15778C 801385EC 14650003 */       bne $v1, $a1, .L801385FC
  /* 157790 801385F0 2538FFFE */     addiu $t8, $t1, -2
  /* 157794 801385F4 1000002D */         b .L801386AC
  /* 157798 801385F8 A1180021 */        sb $t8, 0x21($t0)
  .L801385FC:
  /* 15779C 801385FC 144B0015 */       bne $v0, $t3, .L80138654
  /* 1577A0 80138600 24010008 */     addiu $at, $zero, 8
  /* 1577A4 80138604 54610014 */      bnel $v1, $at, .L80138658
  /* 1577A8 80138608 24010002 */     addiu $at, $zero, 2
  /* 1577AC 8013860C 0C04DF8D */       jal mnResultsGetBestHumanOtherThan
  /* 1577B0 80138610 AFA7001C */        sw $a3, 0x1c($sp)
  /* 1577B4 80138614 3C0C800A */       lui $t4, %hi(gTransferBattleState)
  /* 1577B8 80138618 2401029A */     addiu $at, $zero, 0x29a
  /* 1577BC 8013861C 258C4D08 */     addiu $t4, $t4, %lo(gTransferBattleState)
  /* 1577C0 80138620 8FA7001C */        lw $a3, 0x1c($sp)
  /* 1577C4 80138624 10410021 */       beq $v0, $at, .L801386AC
  /* 1577C8 80138628 240D0074 */     addiu $t5, $zero, 0x74
  /* 1577CC 8013862C 004D0019 */     multu $v0, $t5
  /* 1577D0 80138630 0000C812 */      mflo $t9
  /* 1577D4 80138634 01991821 */      addu $v1, $t4, $t9
  /* 1577D8 80138638 906E0021 */       lbu $t6, 0x21($v1)
  /* 1577DC 8013863C 25CFFFFF */     addiu $t7, $t6, -1
  /* 1577E0 80138640 A06F0021 */        sb $t7, 0x21($v1)
  /* 1577E4 80138644 90F80021 */       lbu $t8, 0x21($a3)
  /* 1577E8 80138648 27190001 */     addiu $t9, $t8, 1
  /* 1577EC 8013864C 10000017 */         b .L801386AC
  /* 1577F0 80138650 A0F90021 */        sb $t9, 0x21($a3)
  .L80138654:
  /* 1577F4 80138654 24010002 */     addiu $at, $zero, 2
  .L80138658:
  /* 1577F8 80138658 54410015 */      bnel $v0, $at, .L801386B0
  /* 1577FC 8013865C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 157800 80138660 54650013 */      bnel $v1, $a1, .L801386B0
  /* 157804 80138664 8FBF0014 */        lw $ra, 0x14($sp)
  /* 157808 80138668 0C04DF8D */       jal mnResultsGetBestHumanOtherThan
  /* 15780C 8013866C AFA80028 */        sw $t0, 0x28($sp)
  /* 157810 80138670 3C0C800A */       lui $t4, %hi(gTransferBattleState)
  /* 157814 80138674 2401029A */     addiu $at, $zero, 0x29a
  /* 157818 80138678 258C4D08 */     addiu $t4, $t4, %lo(gTransferBattleState)
  /* 15781C 8013867C 8FA80028 */        lw $t0, 0x28($sp)
  /* 157820 80138680 1041000A */       beq $v0, $at, .L801386AC
  /* 157824 80138684 240D0074 */     addiu $t5, $zero, 0x74
  /* 157828 80138688 004D0019 */     multu $v0, $t5
  /* 15782C 8013868C 910E0021 */       lbu $t6, 0x21($t0)
  /* 157830 80138690 25CFFFFF */     addiu $t7, $t6, -1
  /* 157834 80138694 A10F0021 */        sb $t7, 0x21($t0)
  /* 157838 80138698 0000C012 */      mflo $t8
  /* 15783C 8013869C 01981821 */      addu $v1, $t4, $t8
  /* 157840 801386A0 90790021 */       lbu $t9, 0x21($v1)
  /* 157844 801386A4 272EFFFF */     addiu $t6, $t9, -1
  /* 157848 801386A8 A06E0021 */        sb $t6, 0x21($v1)
  .L801386AC:
  /* 15784C 801386AC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801386B0:
  /* 157850 801386B0 27BD0038 */     addiu $sp, $sp, 0x38
  /* 157854 801386B4 03E00008 */        jr $ra
  /* 157858 801386B8 00000000 */       nop

glabel mnResultsAutoHandicap
  /* 15785C 801386BC 3C0E8014 */       lui $t6, %hi(gMNResultsGameRule)
  /* 157860 801386C0 8DCE9C10 */        lw $t6, %lo(gMNResultsGameRule)($t6)
  /* 157864 801386C4 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 157868 801386C8 24010004 */     addiu $at, $zero, 4
  /* 15786C 801386CC 11C1000D */       beq $t6, $at, .L80138704
  /* 157870 801386D0 AFBF0014 */        sw $ra, 0x14($sp)
  /* 157874 801386D4 0C04DE71 */       jal mnResultsGetHumanCount
  /* 157878 801386D8 00000000 */       nop
  /* 15787C 801386DC 28410002 */      slti $at, $v0, 2
  /* 157880 801386E0 54200009 */      bnel $at, $zero, .L80138708
  /* 157884 801386E4 8FBF0014 */        lw $ra, 0x14($sp)
  /* 157888 801386E8 0C04DE87 */       jal mnResultsGetBestHuman
  /* 15788C 801386EC 00000000 */       nop
  /* 157890 801386F0 0C04E04C */       jal mnResultsGetWorstHuman
  /* 157894 801386F4 AFA20018 */        sw $v0, 0x18($sp)
  /* 157898 801386F8 8FA40018 */        lw $a0, 0x18($sp)
  /* 15789C 801386FC 0C04E152 */       jal mnResultsSetAutoHandicaps
  /* 1578A0 80138700 00402825 */        or $a1, $v0, $zero
  .L80138704:
  /* 1578A4 80138704 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138708:
  /* 1578A8 80138708 27BD0020 */     addiu $sp, $sp, 0x20
  /* 1578AC 8013870C 03E00008 */        jr $ra
  /* 1578B0 80138710 00000000 */       nop

glabel mnResultsPlayVictoryTheme
  /* 1578B4 80138714 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1578B8 80138718 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1578BC 8013871C 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 1578C0 80138720 00000000 */       nop
  /* 1578C4 80138724 0C04CC52 */       jal mnResultsGetFtKind
  /* 1578C8 80138728 00402025 */        or $a0, $v0, $zero
  /* 1578CC 8013872C 2C41000C */     sltiu $at, $v0, 0xc
  /* 1578D0 80138730 10200039 */      beqz $at, .L80138818
  /* 1578D4 80138734 00002025 */        or $a0, $zero, $zero
  /* 1578D8 80138738 00027080 */       sll $t6, $v0, 2
  /* 1578DC 8013873C 3C018014 */       lui $at, %hi(jtbl_ovl31_80139868)
  /* 1578E0 80138740 002E0821 */      addu $at, $at, $t6
  /* 1578E4 80138744 8C2E9868 */        lw $t6, %lo(jtbl_ovl31_80139868)($at)
  /* 1578E8 80138748 01C00008 */        jr $t6
  /* 1578EC 8013874C 00000000 */       nop
  glabel jtgt_ovl31_80138750
  /* 1578F0 80138750 00002025 */        or $a0, $zero, $zero
  /* 1578F4 80138754 0C0082AD */       jal func_80020AB4
  /* 1578F8 80138758 2405000C */     addiu $a1, $zero, 0xc
  /* 1578FC 8013875C 10000031 */         b .L80138824
  /* 157900 80138760 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_80138764
  /* 157904 80138764 00002025 */        or $a0, $zero, $zero
  /* 157908 80138768 0C0082AD */       jal func_80020AB4
  /* 15790C 8013876C 24050010 */     addiu $a1, $zero, 0x10
  /* 157910 80138770 1000002C */         b .L80138824
  /* 157914 80138774 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_80138778
  /* 157918 80138778 00002025 */        or $a0, $zero, $zero
  /* 15791C 8013877C 0C0082AD */       jal func_80020AB4
  /* 157920 80138780 2405000E */     addiu $a1, $zero, 0xe
  /* 157924 80138784 10000027 */         b .L80138824
  /* 157928 80138788 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_8013878C
  /* 15792C 8013878C 00002025 */        or $a0, $zero, $zero
  /* 157930 80138790 0C0082AD */       jal func_80020AB4
  /* 157934 80138794 2405000D */     addiu $a1, $zero, 0xd
  /* 157938 80138798 10000022 */         b .L80138824
  /* 15793C 8013879C 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_801387A0
  /* 157940 801387A0 00002025 */        or $a0, $zero, $zero
  /* 157944 801387A4 0C0082AD */       jal func_80020AB4
  /* 157948 801387A8 24050015 */     addiu $a1, $zero, 0x15
  /* 15794C 801387AC 1000001D */         b .L80138824
  /* 157950 801387B0 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_801387B4
  /* 157954 801387B4 00002025 */        or $a0, $zero, $zero
  /* 157958 801387B8 0C0082AD */       jal func_80020AB4
  /* 15795C 801387BC 24050012 */     addiu $a1, $zero, 0x12
  /* 157960 801387C0 10000018 */         b .L80138824
  /* 157964 801387C4 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_801387C8
  /* 157968 801387C8 00002025 */        or $a0, $zero, $zero
  /* 15796C 801387CC 0C0082AD */       jal func_80020AB4
  /* 157970 801387D0 24050013 */     addiu $a1, $zero, 0x13
  /* 157974 801387D4 10000013 */         b .L80138824
  /* 157978 801387D8 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_801387DC
  /* 15797C 801387DC 00002025 */        or $a0, $zero, $zero
  /* 157980 801387E0 0C0082AD */       jal func_80020AB4
  /* 157984 801387E4 24050014 */     addiu $a1, $zero, 0x14
  /* 157988 801387E8 1000000E */         b .L80138824
  /* 15798C 801387EC 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_801387F0
  /* 157990 801387F0 00002025 */        or $a0, $zero, $zero
  /* 157994 801387F4 0C0082AD */       jal func_80020AB4
  /* 157998 801387F8 2405000F */     addiu $a1, $zero, 0xf
  /* 15799C 801387FC 10000009 */         b .L80138824
  /* 1579A0 80138800 8FBF0014 */        lw $ra, 0x14($sp)
  glabel jtgt_ovl31_80138804
  /* 1579A4 80138804 00002025 */        or $a0, $zero, $zero
  /* 1579A8 80138808 0C0082AD */       jal func_80020AB4
  /* 1579AC 8013880C 24050011 */     addiu $a1, $zero, 0x11
  /* 1579B0 80138810 10000004 */         b .L80138824
  /* 1579B4 80138814 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138818:
  /* 1579B8 80138818 0C0082AD */       jal func_80020AB4
  /* 1579BC 8013881C 2405000B */     addiu $a1, $zero, 0xb
  /* 1579C0 80138820 8FBF0014 */        lw $ra, 0x14($sp)
  .L80138824:
  /* 1579C4 80138824 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1579C8 80138828 03E00008 */        jr $ra
  /* 1579CC 8013882C 00000000 */       nop

glabel func_ovl31_80138830
  /* 1579D0 80138830 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1579D4 80138834 3C0F8014 */       lui $t7, %hi(D_ovl31_801396F8)
  /* 1579D8 80138838 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1579DC 8013883C 25EF96F8 */     addiu $t7, $t7, %lo(D_ovl31_801396F8)
  /* 1579E0 80138840 8DF90000 */        lw $t9, ($t7) # D_ovl31_801396F8 + 0
  /* 1579E4 80138844 27AE002C */     addiu $t6, $sp, 0x2c
  /* 1579E8 80138848 8DF80004 */        lw $t8, 4($t7) # D_ovl31_801396F8 + 4
  /* 1579EC 8013884C ADD90000 */        sw $t9, ($t6)
  /* 1579F0 80138850 8DF90008 */        lw $t9, 8($t7) # D_ovl31_801396F8 + 8
  /* 1579F4 80138854 3C088014 */       lui $t0, %hi(D_ovl31_80139704)
  /* 1579F8 80138858 25089704 */     addiu $t0, $t0, %lo(D_ovl31_80139704)
  /* 1579FC 8013885C ADD80004 */        sw $t8, 4($t6)
  /* 157A00 80138860 ADD90008 */        sw $t9, 8($t6)
  /* 157A04 80138864 8D0A0000 */        lw $t2, ($t0) # D_ovl31_80139704 + 0
  /* 157A08 80138868 27A40020 */     addiu $a0, $sp, 0x20
  /* 157A0C 8013886C 00002825 */        or $a1, $zero, $zero
  /* 157A10 80138870 AC8A0000 */        sw $t2, ($a0)
  /* 157A14 80138874 8D090004 */        lw $t1, 4($t0) # D_ovl31_80139704 + 4
  /* 157A18 80138878 AC890004 */        sw $t1, 4($a0)
  /* 157A1C 8013887C 8D0A0008 */        lw $t2, 8($t0) # D_ovl31_80139704 + 8
  /* 157A20 80138880 0C041155 */       jal func_ovl2_80104554
  /* 157A24 80138884 AC8A0008 */        sw $t2, 8($a0)
  /* 157A28 80138888 27A4002C */     addiu $a0, $sp, 0x2c
  /* 157A2C 8013888C 0C041155 */       jal func_ovl2_80104554
  /* 157A30 80138890 24050001 */     addiu $a1, $zero, 1
  /* 157A34 80138894 8FBF0014 */        lw $ra, 0x14($sp)
  /* 157A38 80138898 27BD0038 */     addiu $sp, $sp, 0x38
  /* 157A3C 8013889C 03E00008 */        jr $ra
  /* 157A40 801388A0 00000000 */       nop

  /* 157A44 801388A4 03E00008 */        jr $ra
  /* 157A48 801388A8 00000000 */       nop

glabel mnResultsMain
  /* 157A4C 801388AC 3C0E8014 */       lui $t6, %hi(gMNResultsFramesElapsed)
  /* 157A50 801388B0 8DCE9B78 */        lw $t6, %lo(gMNResultsFramesElapsed)($t6)
  /* 157A54 801388B4 3C188014 */       lui $t8, %hi(gMNResultsDrawBackgroundFrame)
  /* 157A58 801388B8 8F189C44 */        lw $t8, %lo(gMNResultsDrawBackgroundFrame)($t8)
  /* 157A5C 801388BC 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 157A60 801388C0 3C018014 */       lui $at, %hi(gMNResultsFramesElapsed)
  /* 157A64 801388C4 25C20001 */     addiu $v0, $t6, 1
  /* 157A68 801388C8 AFBF001C */        sw $ra, 0x1c($sp)
  /* 157A6C 801388CC AFA40020 */        sw $a0, 0x20($sp)
  /* 157A70 801388D0 1702000C */       bne $t8, $v0, .L80138904
  /* 157A74 801388D4 AC229B78 */        sw $v0, %lo(gMNResultsFramesElapsed)($at)
  /* 157A78 801388D8 3C198014 */       lui $t9, %hi(gMNResultsGameRule)
  /* 157A7C 801388DC 8F399C10 */        lw $t9, %lo(gMNResultsGameRule)($t9)
  /* 157A80 801388E0 24010004 */     addiu $at, $zero, 4
  /* 157A84 801388E4 13210003 */       beq $t9, $at, .L801388F4
  /* 157A88 801388E8 00000000 */       nop
  /* 157A8C 801388EC 0C04D481 */       jal mnResultsCreateBackgroundOverlay2
  /* 157A90 801388F0 00000000 */       nop
  .L801388F4:
  /* 157A94 801388F4 0C04CBAA */       jal mnResultsCreateBackground
  /* 157A98 801388F8 00000000 */       nop
  /* 157A9C 801388FC 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 157AA0 80138900 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  .L80138904:
  /* 157AA4 80138904 3C088014 */       lui $t0, %hi(gMNResultsDrawWinnerTextFrame)
  /* 157AA8 80138908 8D089C48 */        lw $t0, %lo(gMNResultsDrawWinnerTextFrame)($t0)
  /* 157AAC 8013890C 1502000C */       bne $t0, $v0, .L80138940
  /* 157AB0 80138910 00000000 */       nop
  /* 157AB4 80138914 0C04D15F */       jal mnResultsDrawWinnerText
  /* 157AB8 80138918 00000000 */       nop
  /* 157ABC 8013891C 0C04D9BC */       jal mnResultsCreateScreenTitle
  /* 157AC0 80138920 00000000 */       nop
  /* 157AC4 80138924 3C098014 */       lui $t1, %hi(gMNResultsGameRule)
  /* 157AC8 80138928 8D299C10 */        lw $t1, %lo(gMNResultsGameRule)($t1)
  /* 157ACC 8013892C 24010004 */     addiu $at, $zero, 4
  /* 157AD0 80138930 11210003 */       beq $t1, $at, .L80138940
  /* 157AD4 80138934 00000000 */       nop
  /* 157AD8 80138938 0C04E20C */       jal func_ovl31_80138830
  /* 157ADC 8013893C 00000000 */       nop
  .L80138940:
  /* 157AE0 80138940 3C038014 */       lui $v1, %hi(gMNResultsDrawFightersFrame)
  /* 157AE4 80138944 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 157AE8 80138948 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 157AEC 8013894C 8C639C4C */        lw $v1, %lo(gMNResultsDrawFightersFrame)($v1)
  /* 157AF0 80138950 54620008 */      bnel $v1, $v0, .L80138974
  /* 157AF4 80138954 0062082A */       slt $at, $v1, $v0
  /* 157AF8 80138958 0C04DD6B */       jal mnResultsDrawFighters
  /* 157AFC 8013895C 00000000 */       nop
  /* 157B00 80138960 3C028014 */       lui $v0, %hi(gMNResultsFramesElapsed)
  /* 157B04 80138964 3C038014 */       lui $v1, %hi(gMNResultsDrawFightersFrame)
  /* 157B08 80138968 8C639C4C */        lw $v1, %lo(gMNResultsDrawFightersFrame)($v1)
  /* 157B0C 8013896C 8C429B78 */        lw $v0, %lo(gMNResultsFramesElapsed)($v0)
  /* 157B10 80138970 0062082A */       slt $at, $v1, $v0
  .L80138974:
  /* 157B14 80138974 10200015 */      beqz $at, .L801389CC
  /* 157B18 80138978 3C038014 */       lui $v1, %hi(gMNResultsCharacterAlpha)
  /* 157B1C 8013897C 24639C40 */     addiu $v1, $v1, %lo(gMNResultsCharacterAlpha)
  /* 157B20 80138980 8C620000 */        lw $v0, ($v1) # gMNResultsCharacterAlpha + 0
  /* 157B24 80138984 240600FF */     addiu $a2, $zero, 0xff
  /* 157B28 80138988 240700FF */     addiu $a3, $zero, 0xff
  /* 157B2C 8013898C 284100FF */      slti $at, $v0, 0xff
  /* 157B30 80138990 10200008 */      beqz $at, .L801389B4
  /* 157B34 80138994 240C00FF */     addiu $t4, $zero, 0xff
  /* 157B38 80138998 244A0016 */     addiu $t2, $v0, 0x16
  /* 157B3C 8013899C 29410100 */      slti $at, $t2, 0x100
  /* 157B40 801389A0 AC6A0000 */        sw $t2, ($v1) # gMNResultsCharacterAlpha + 0
  /* 157B44 801389A4 14200003 */      bnez $at, .L801389B4
  /* 157B48 801389A8 01401025 */        or $v0, $t2, $zero
  /* 157B4C 801389AC 240200FF */     addiu $v0, $zero, 0xff
  /* 157B50 801389B0 AC620000 */        sw $v0, ($v1) # gMNResultsCharacterAlpha + 0
  .L801389B4:
  /* 157B54 801389B4 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 157B58 801389B8 44816000 */      mtc1 $at, $f12 # 10.0 to cop1
  /* 157B5C 801389BC AFAC0010 */        sw $t4, 0x10($sp)
  /* 157B60 801389C0 AFA20014 */        sw $v0, 0x14($sp)
  /* 157B64 801389C4 0C0E4138 */       jal func_ovl1_803904E0
  /* 157B68 801389C8 46006386 */     mov.s $f14, $f12
  .L801389CC:
  /* 157B6C 801389CC 0C04C7AC */       jal mnResultsAnnounceWinner
  /* 157B70 801389D0 00000000 */       nop
  /* 157B74 801389D4 3C0D8014 */       lui $t5, %hi(gMNResultsGameRule)
  /* 157B78 801389D8 8DAD9C10 */        lw $t5, %lo(gMNResultsGameRule)($t5)
  /* 157B7C 801389DC 24010004 */     addiu $at, $zero, 4
  /* 157B80 801389E0 3C0E8014 */       lui $t6, %hi(gMNResultsFramesElapsed)
  /* 157B84 801389E4 11A10009 */       beq $t5, $at, .L80138A0C
  /* 157B88 801389E8 00000000 */       nop
  /* 157B8C 801389EC 8DCE9B78 */        lw $t6, %lo(gMNResultsFramesElapsed)($t6)
  /* 157B90 801389F0 24010078 */     addiu $at, $zero, 0x78
  /* 157B94 801389F4 15C10005 */       bne $t6, $at, .L80138A0C
  /* 157B98 801389F8 00000000 */       nop
  /* 157B9C 801389FC 0C04E1C5 */       jal mnResultsPlayVictoryTheme
  /* 157BA0 80138A00 00000000 */       nop
  /* 157BA4 80138A04 0C04DE15 */       jal func_ovl31_80137854
  /* 157BA8 80138A08 00000000 */       nop
  .L80138A0C:
  /* 157BAC 80138A0C 0C04C786 */       jal mnResultsCheckStartPressed
  /* 157BB0 80138A10 00000000 */       nop
  /* 157BB4 80138A14 10400052 */      beqz $v0, .L80138B60
  /* 157BB8 80138A18 3C03800A */       lui $v1, %hi(gSaveData)
  /* 157BBC 80138A1C 246344E0 */     addiu $v1, $v1, %lo(gSaveData)
  /* 157BC0 80138A20 90620457 */       lbu $v0, 0x457($v1) # gSaveData + 1111
  /* 157BC4 80138A24 00003025 */        or $a2, $zero, $zero
  /* 157BC8 80138A28 304F0040 */      andi $t7, $v0, 0x40
  /* 157BCC 80138A2C 15E00008 */      bnez $t7, .L80138A50
  /* 157BD0 80138A30 30480010 */      andi $t0, $v0, 0x10
  /* 157BD4 80138A34 907805DE */       lbu $t8, 0x5de($v1) # gSaveData + 1502
  /* 157BD8 80138A38 24190006 */     addiu $t9, $zero, 6
  /* 157BDC 80138A3C 2B010064 */      slti $at, $t8, 0x64
  /* 157BE0 80138A40 14200003 */      bnez $at, .L80138A50
  /* 157BE4 80138A44 3C01800A */       lui $at, %hi((gSceneData + 0x2))
  /* 157BE8 80138A48 A0394AD2 */        sb $t9, %lo((gSceneData + 0x2))($at)
  /* 157BEC 80138A4C 24060001 */     addiu $a2, $zero, 1
  .L80138A50:
  /* 157BF0 80138A50 15000031 */      bnez $t0, .L80138B18
  /* 157BF4 80138A54 00000000 */       nop
  /* 157BF8 80138A58 946905DC */       lhu $t1, 0x5dc($v1) # gSaveData + 1500
  /* 157BFC 80138A5C 240100FF */     addiu $at, $zero, 0xff
  /* 157C00 80138A60 00001825 */        or $v1, $zero, $zero
  /* 157C04 80138A64 312A00FF */      andi $t2, $t1, 0xff
  /* 157C08 80138A68 1541002B */       bne $t2, $at, .L80138B18
  /* 157C0C 80138A6C 00001025 */        or $v0, $zero, $zero
  /* 157C10 80138A70 3C04800A */       lui $a0, %hi(gSaveData)
  /* 157C14 80138A74 248444E0 */     addiu $a0, $a0, %lo(gSaveData)
  /* 157C18 80138A78 2405000C */     addiu $a1, $zero, 0xc
  .L80138A7C:
  /* 157C1C 80138A7C 908B0479 */       lbu $t3, 0x479($a0) # gSaveData + 1145
  /* 157C20 80138A80 240C0001 */     addiu $t4, $zero, 1
  /* 157C24 80138A84 246F0001 */     addiu $t7, $v1, 1
  /* 157C28 80138A88 11600003 */      beqz $t3, .L80138A98
  /* 157C2C 80138A8C 006C6804 */      sllv $t5, $t4, $v1
  /* 157C30 80138A90 004D1025 */        or $v0, $v0, $t5
  /* 157C34 80138A94 3042FFFF */      andi $v0, $v0, 0xffff
  .L80138A98:
  /* 157C38 80138A98 908E0499 */       lbu $t6, 0x499($a0) # gSaveData + 1177
  /* 157C3C 80138A9C 24180001 */     addiu $t8, $zero, 1
  /* 157C40 80138AA0 01F8C804 */      sllv $t9, $t8, $t7
  /* 157C44 80138AA4 11C00003 */      beqz $t6, .L80138AB4
  /* 157C48 80138AA8 24690002 */     addiu $t1, $v1, 2
  /* 157C4C 80138AAC 00591025 */        or $v0, $v0, $t9
  /* 157C50 80138AB0 3042FFFF */      andi $v0, $v0, 0xffff
  .L80138AB4:
  /* 157C54 80138AB4 908804B9 */       lbu $t0, 0x4b9($a0) # gSaveData + 1209
  /* 157C58 80138AB8 240A0001 */     addiu $t2, $zero, 1
  /* 157C5C 80138ABC 012A5804 */      sllv $t3, $t2, $t1
  /* 157C60 80138AC0 11000003 */      beqz $t0, .L80138AD0
  /* 157C64 80138AC4 246D0003 */     addiu $t5, $v1, 3
  /* 157C68 80138AC8 004B1025 */        or $v0, $v0, $t3
  /* 157C6C 80138ACC 3042FFFF */      andi $v0, $v0, 0xffff
  .L80138AD0:
  /* 157C70 80138AD0 908C04D9 */       lbu $t4, 0x4d9($a0) # gSaveData + 1241
  /* 157C74 80138AD4 240E0001 */     addiu $t6, $zero, 1
  /* 157C78 80138AD8 01AEC004 */      sllv $t8, $t6, $t5
  /* 157C7C 80138ADC 11800003 */      beqz $t4, .L80138AEC
  /* 157C80 80138AE0 24630004 */     addiu $v1, $v1, 4
  /* 157C84 80138AE4 00581025 */        or $v0, $v0, $t8
  /* 157C88 80138AE8 3042FFFF */      andi $v0, $v0, 0xffff
  .L80138AEC:
  /* 157C8C 80138AEC 1465FFE3 */       bne $v1, $a1, .L80138A7C
  /* 157C90 80138AF0 24840080 */     addiu $a0, $a0, 0x80
  /* 157C94 80138AF4 304F036F */      andi $t7, $v0, 0x36f
  /* 157C98 80138AF8 2401036F */     addiu $at, $zero, 0x36f
  /* 157C9C 80138AFC 15E10006 */       bne $t7, $at, .L80138B18
  /* 157CA0 80138B00 3C02800A */       lui $v0, %hi(gSceneData)
  /* 157CA4 80138B04 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 157CA8 80138B08 00464021 */      addu $t0, $v0, $a2
  /* 157CAC 80138B0C 24190004 */     addiu $t9, $zero, 4
  /* 157CB0 80138B10 A1190002 */        sb $t9, 2($t0)
  /* 157CB4 80138B14 24C60001 */     addiu $a2, $a2, 1
  .L80138B18:
  /* 157CB8 80138B18 3C02800A */       lui $v0, %hi(gSceneData)
  /* 157CBC 80138B1C 10C00006 */      beqz $a2, .L80138B38
  /* 157CC0 80138B20 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 157CC4 80138B24 904A0000 */       lbu $t2, ($v0) # gSceneData + 0
  /* 157CC8 80138B28 2409000C */     addiu $t1, $zero, 0xc
  /* 157CCC 80138B2C A0490000 */        sb $t1, ($v0) # gSceneData + 0
  /* 157CD0 80138B30 10000005 */         b .L80138B48
  /* 157CD4 80138B34 A04A0001 */        sb $t2, 1($v0) # gSceneData + 1
  .L80138B38:
  /* 157CD8 80138B38 904B0000 */       lbu $t3, ($v0) # gSceneData + 0
  /* 157CDC 80138B3C 240C0010 */     addiu $t4, $zero, 0x10
  /* 157CE0 80138B40 A04C0000 */        sb $t4, ($v0) # gSceneData + 0
  /* 157CE4 80138B44 A04B0001 */        sb $t3, 1($v0) # gSceneData + 1
  .L80138B48:
  /* 157CE8 80138B48 0C0099A8 */       jal func_800266A0
  /* 157CEC 80138B4C 00000000 */       nop
  /* 157CF0 80138B50 0C00829D */       jal func_80020A74
  /* 157CF4 80138B54 00000000 */       nop
  /* 157CF8 80138B58 0C00171D */       jal func_80005C74
  /* 157CFC 80138B5C 00000000 */       nop
  .L80138B60:
  /* 157D00 80138B60 8FBF001C */        lw $ra, 0x1c($sp)
  /* 157D04 80138B64 27BD0020 */     addiu $sp, $sp, 0x20
  /* 157D08 80138B68 03E00008 */        jr $ra
  /* 157D0C 80138B6C 00000000 */       nop

glabel mnResultsInit
  /* 157D10 80138B70 27BDFFA8 */     addiu $sp, $sp, -0x58
  /* 157D14 80138B74 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 157D18 80138B78 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 157D1C 80138B7C 3C188014 */       lui $t8, %hi(D_ovl31_80139C50)
  /* 157D20 80138B80 3C088014 */       lui $t0, %hi(D_ovl31_8013A010)
  /* 157D24 80138B84 AFBF0024 */        sw $ra, 0x24($sp)
  /* 157D28 80138B88 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 157D2C 80138B8C 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 157D30 80138B90 27189C50 */     addiu $t8, $t8, %lo(D_ovl31_80139C50)
  /* 157D34 80138B94 24190078 */     addiu $t9, $zero, 0x78
  /* 157D38 80138B98 2508A010 */     addiu $t0, $t0, %lo(D_ovl31_8013A010)
  /* 157D3C 80138B9C 24090007 */     addiu $t1, $zero, 7
  /* 157D40 80138BA0 AFB00020 */        sw $s0, 0x20($sp)
  /* 157D44 80138BA4 AFAE0038 */        sw $t6, 0x38($sp)
  /* 157D48 80138BA8 AFAF003C */        sw $t7, 0x3c($sp)
  /* 157D4C 80138BAC AFA00040 */        sw $zero, 0x40($sp)
  /* 157D50 80138BB0 AFA00044 */        sw $zero, 0x44($sp)
  /* 157D54 80138BB4 AFB80048 */        sw $t8, 0x48($sp)
  /* 157D58 80138BB8 AFB9004C */        sw $t9, 0x4c($sp)
  /* 157D5C 80138BBC AFA80050 */        sw $t0, 0x50($sp)
  /* 157D60 80138BC0 AFA90054 */        sw $t1, 0x54($sp)
  /* 157D64 80138BC4 0C0337DE */       jal rdManagerInitSetup
  /* 157D68 80138BC8 27A40038 */     addiu $a0, $sp, 0x38
  /* 157D6C 80138BCC 3C108014 */       lui $s0, %hi(D_ovl31_80138F70)
  /* 157D70 80138BD0 26108F70 */     addiu $s0, $s0, %lo(D_ovl31_80138F70)
  /* 157D74 80138BD4 02002025 */        or $a0, $s0, $zero
  /* 157D78 80138BD8 0C0337BB */       jal rdManagerGetAllocSize
  /* 157D7C 80138BDC 24050008 */     addiu $a1, $zero, 8
  /* 157D80 80138BE0 00402025 */        or $a0, $v0, $zero
  /* 157D84 80138BE4 0C001260 */       jal gsMemoryAlloc
  /* 157D88 80138BE8 24050010 */     addiu $a1, $zero, 0x10
  /* 157D8C 80138BEC 3C068014 */       lui $a2, %hi(D_ovl31_8013A048)
  /* 157D90 80138BF0 24C6A048 */     addiu $a2, $a2, %lo(D_ovl31_8013A048)
  /* 157D94 80138BF4 02002025 */        or $a0, $s0, $zero
  /* 157D98 80138BF8 24050008 */     addiu $a1, $zero, 8
  /* 157D9C 80138BFC 0C033781 */       jal rdManagerLoadFiles
  /* 157DA0 80138C00 00403825 */        or $a3, $v0, $zero
  /* 157DA4 80138C04 3C108000 */       lui $s0, %hi(D_NF_80000001)
  /* 157DA8 80138C08 3C058014 */       lui $a1, %hi(mnResultsMain)
  /* 157DAC 80138C0C 24A588AC */     addiu $a1, $a1, %lo(mnResultsMain)
  /* 157DB0 80138C10 02003825 */        or $a3, $s0, $zero
  /* 157DB4 80138C14 00002025 */        or $a0, $zero, $zero
  /* 157DB8 80138C18 0C00265A */       jal omMakeGObjSPAfter
  /* 157DBC 80138C1C 00003025 */        or $a2, $zero, $zero
  /* 157DC0 80138C20 240A00FF */     addiu $t2, $zero, 0xff
  /* 157DC4 80138C24 AFAA0010 */        sw $t2, 0x10($sp)
  /* 157DC8 80138C28 00002025 */        or $a0, $zero, $zero
  /* 157DCC 80138C2C 02002825 */        or $a1, $s0, $zero
  /* 157DD0 80138C30 24060064 */     addiu $a2, $zero, 0x64
  /* 157DD4 80138C34 0C002E7F */       jal func_8000B9FC
  /* 157DD8 80138C38 24070003 */     addiu $a3, $zero, 3
  /* 157DDC 80138C3C 0C045624 */       jal func_ovl2_80115890
  /* 157DE0 80138C40 00000000 */       nop
  /* 157DE4 80138C44 0C03F4C0 */       jal efManager_AllocUserData
  /* 157DE8 80138C48 00000000 */       nop
  /* 157DEC 80138C4C 24040001 */     addiu $a0, $zero, 1
  /* 157DF0 80138C50 0C035C65 */       jal ftManagerAllocFighter
  /* 157DF4 80138C54 24050004 */     addiu $a1, $zero, 4
  /* 157DF8 80138C58 00008025 */        or $s0, $zero, $zero
  .L80138C5C:
  /* 157DFC 80138C5C 0C035E1B */       jal ftManagerSetupDataKind
  /* 157E00 80138C60 02002025 */        or $a0, $s0, $zero
  /* 157E04 80138C64 26100001 */     addiu $s0, $s0, %lo(D_NF_80000001)
  /* 157E08 80138C68 2A01000C */      slti $at, $s0, 0xc
  /* 157E0C 80138C6C 1420FFFB */      bnez $at, .L80138C5C
  /* 157E10 80138C70 00000000 */       nop
  /* 157E14 80138C74 3C038014 */       lui $v1, %hi(gMNResultsAnimHeaps)
  /* 157E18 80138C78 3C108013 */       lui $s0, %hi(gFTAnimHeapSize)
  /* 157E1C 80138C7C 26100D9C */     addiu $s0, $s0, %lo(gFTAnimHeapSize)
  /* 157E20 80138C80 24639C00 */     addiu $v1, $v1, %lo(gMNResultsAnimHeaps)
  .L80138C84:
  /* 157E24 80138C84 8E040000 */        lw $a0, ($s0) # gFTAnimHeapSize + 0
  /* 157E28 80138C88 24050010 */     addiu $a1, $zero, 0x10
  /* 157E2C 80138C8C 0C001260 */       jal gsMemoryAlloc
  /* 157E30 80138C90 AFA30028 */        sw $v1, 0x28($sp)
  /* 157E34 80138C94 8FA30028 */        lw $v1, 0x28($sp)
  /* 157E38 80138C98 3C0B8014 */       lui $t3, %hi(gMNResultsGameRule)
  /* 157E3C 80138C9C 256B9C10 */     addiu $t3, $t3, %lo(gMNResultsGameRule)
  /* 157E40 80138CA0 24630004 */     addiu $v1, $v1, 4
  /* 157E44 80138CA4 146BFFF7 */       bne $v1, $t3, .L80138C84
  /* 157E48 80138CA8 AC62FFFC */        sw $v0, -4($v1)
  /* 157E4C 80138CAC 0C04C6E4 */       jal mnResultsSaveDataToSRAM
  /* 157E50 80138CB0 00000000 */       nop
  /* 157E54 80138CB4 0C04DDA6 */       jal mnResultsLoadMatchInfo
  /* 157E58 80138CB8 00000000 */       nop
  /* 157E5C 80138CBC 0C04DD15 */       jal mnResultsSetIsPresent
  /* 157E60 80138CC0 00000000 */       nop
  /* 157E64 80138CC4 0C04DCED */       jal mnResultsSetArrays
  /* 157E68 80138CC8 00000000 */       nop
  /* 157E6C 80138CCC 3C0C800A */       lui $t4, %hi((gTransferBattleState + 0x8))
  /* 157E70 80138CD0 918C4D10 */       lbu $t4, %lo((gTransferBattleState + 0x8))($t4)
  /* 157E74 80138CD4 24010002 */     addiu $at, $zero, 2
  /* 157E78 80138CD8 15810003 */       bne $t4, $at, .L80138CE8
  /* 157E7C 80138CDC 00000000 */       nop
  /* 157E80 80138CE0 0C04E1AF */       jal mnResultsAutoHandicap
  /* 157E84 80138CE4 00000000 */       nop
  .L80138CE8:
  /* 157E88 80138CE8 3C0D8014 */       lui $t5, %hi(gMNResultsGameRule)
  /* 157E8C 80138CEC 8DAD9C10 */        lw $t5, %lo(gMNResultsGameRule)($t5)
  /* 157E90 80138CF0 24100004 */     addiu $s0, $zero, 4
  /* 157E94 80138CF4 120D0019 */       beq $s0, $t5, .L80138D5C
  /* 157E98 80138CF8 00000000 */       nop
  /* 157E9C 80138CFC 0C035101 */       jal func_ovl0_800D4404
  /* 157EA0 80138D00 00000000 */       nop
  /* 157EA4 80138D04 3C042000 */       lui $a0, (0x20000002 >> 16) # 536870914
  /* 157EA8 80138D08 240E0001 */     addiu $t6, $zero, 1
  /* 157EAC 80138D0C 240F0000 */     addiu $t7, $zero, 0
  /* 157EB0 80138D10 AFAF0014 */        sw $t7, 0x14($sp)
  /* 157EB4 80138D14 AFAE0010 */        sw $t6, 0x10($sp)
  /* 157EB8 80138D18 34840002 */       ori $a0, $a0, (0x20000002 & 0xFFFF) # 536870914
  /* 157EBC 80138D1C 00002825 */        or $a1, $zero, $zero
  /* 157EC0 80138D20 0C03504C */       jal func_ovl0_800D4130
  /* 157EC4 80138D24 2406000A */     addiu $a2, $zero, 0xa
  /* 157EC8 80138D28 0C006265 */       jal lbRandom_GetIntRange
  /* 157ECC 80138D2C 2404000B */     addiu $a0, $zero, 0xb
  /* 157ED0 80138D30 3C19800D */       lui $t9, %hi(func_ovl0_800D42C8)
  /* 157ED4 80138D34 273942C8 */     addiu $t9, $t9, %lo(func_ovl0_800D42C8)
  /* 157ED8 80138D38 3C07800D */       lui $a3, %hi(func_ovl0_800D4248)
  /* 157EDC 80138D3C 24180020 */     addiu $t8, $zero, 0x20
  /* 157EE0 80138D40 AFB80010 */        sw $t8, 0x10($sp)
  /* 157EE4 80138D44 24E74248 */     addiu $a3, $a3, %lo(func_ovl0_800D4248)
  /* 157EE8 80138D48 AFB90014 */        sw $t9, 0x14($sp)
  /* 157EEC 80138D4C 00402025 */        or $a0, $v0, $zero
  /* 157EF0 80138D50 3C052000 */       lui $a1, 0x2000
  /* 157EF4 80138D54 0C0350C3 */       jal func_ovl0_800D430C
  /* 157EF8 80138D58 00003025 */        or $a2, $zero, $zero
  .L80138D5C:
  /* 157EFC 80138D5C 0C04DA34 */       jal mnResultsCreateLogoViewport
  /* 157F00 80138D60 00000000 */       nop
  /* 157F04 80138D64 0C04DA6D */       jal mnResultsCreateFighterViewport
  /* 157F08 80138D68 00000000 */       nop
  /* 157F0C 80138D6C 0C04CF9F */       jal mnResultsCreatePlayerIndicatorViewport
  /* 157F10 80138D70 00000000 */       nop
  /* 157F14 80138D74 0C04D17A */       jal mnResultsCreateWinnerTextViewport
  /* 157F18 80138D78 00000000 */       nop
  /* 157F1C 80138D7C 0C04D37D */       jal mnResultsCreateOverlayViewport
  /* 157F20 80138D80 00000000 */       nop
  /* 157F24 80138D84 0C04DA0C */       jal mnResultsCreateResultsViewport
  /* 157F28 80138D88 00000000 */       nop
  /* 157F2C 80138D8C 0C04D40A */       jal mnResultsCreateBackgroundOverlayViewport
  /* 157F30 80138D90 00000000 */       nop
  /* 157F34 80138D94 0C04D497 */       jal mnResultsCreateBackgroundOverlay2Viewport
  /* 157F38 80138D98 00000000 */       nop
  /* 157F3C 80138D9C 3C088014 */       lui $t0, %hi(gMNResultsGameRule)
  /* 157F40 80138DA0 8D089C10 */        lw $t0, %lo(gMNResultsGameRule)($t0)
  /* 157F44 80138DA4 12080003 */       beq $s0, $t0, .L80138DB4
  /* 157F48 80138DA8 00000000 */       nop
  /* 157F4C 80138DAC 0C04CAC8 */       jal mnResultsCreateLogo
  /* 157F50 80138DB0 00000000 */       nop
  .L80138DB4:
  /* 157F54 80138DB4 0C04D3F4 */       jal mnResultsCreateBackgroundOverlay
  /* 157F58 80138DB8 00000000 */       nop
  /* 157F5C 80138DBC 0C04DE5F */       jal func_ovl31_8013797C
  /* 157F60 80138DC0 00000000 */       nop
  /* 157F64 80138DC4 3C098014 */       lui $t1, %hi(gMNResultsGameRule)
  /* 157F68 80138DC8 8D299C10 */        lw $t1, %lo(gMNResultsGameRule)($t1)
  /* 157F6C 80138DCC 52090010 */      beql $s0, $t1, .L80138E10
  /* 157F70 80138DD0 3C014120 */       lui $at, 0x4120
  /* 157F74 80138DD4 0C04C8D3 */       jal mnResultsGetWinnerPort
  /* 157F78 80138DD8 00000000 */       nop
  /* 157F7C 80138DDC 000250C0 */       sll $t2, $v0, 3
  /* 157F80 80138DE0 01425023 */      subu $t2, $t2, $v0
  /* 157F84 80138DE4 000A5080 */       sll $t2, $t2, 2
  /* 157F88 80138DE8 01425021 */      addu $t2, $t2, $v0
  /* 157F8C 80138DEC 000A5080 */       sll $t2, $t2, 2
  /* 157F90 80138DF0 3C0B800A */       lui $t3, %hi((gTransferBattleState + 0x22))
  /* 157F94 80138DF4 016A5821 */      addu $t3, $t3, $t2
  /* 157F98 80138DF8 916B4D2A */       lbu $t3, %lo((gTransferBattleState + 0x22))($t3)
  /* 157F9C 80138DFC 55600004 */      bnel $t3, $zero, .L80138E10
  /* 157FA0 80138E00 3C014120 */       lui $at, 0x4120
  /* 157FA4 80138E04 0C04DE4E */       jal func_ovl31_80137938
  /* 157FA8 80138E08 00000000 */       nop
  /* 157FAC 80138E0C 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  .L80138E10:
  /* 157FB0 80138E10 3C0D8014 */       lui $t5, %hi(gMNResultsCharacterAlpha)
  /* 157FB4 80138E14 44816000 */      mtc1 $at, $f12 # 10.0 to cop1
  /* 157FB8 80138E18 8DAD9C40 */        lw $t5, %lo(gMNResultsCharacterAlpha)($t5)
  /* 157FBC 80138E1C 240C00FF */     addiu $t4, $zero, 0xff
  /* 157FC0 80138E20 AFAC0010 */        sw $t4, 0x10($sp)
  /* 157FC4 80138E24 240600FF */     addiu $a2, $zero, 0xff
  /* 157FC8 80138E28 240700FF */     addiu $a3, $zero, 0xff
  /* 157FCC 80138E2C AFAD0014 */        sw $t5, 0x14($sp)
  /* 157FD0 80138E30 0C0E4138 */       jal func_ovl1_803904E0
  /* 157FD4 80138E34 46006386 */     mov.s $f14, $f12
  /* 157FD8 80138E38 3C0E8014 */       lui $t6, %hi(gMNResultsGameRule)
  /* 157FDC 80138E3C 8DCE9C10 */        lw $t6, %lo(gMNResultsGameRule)($t6)
  /* 157FE0 80138E40 520E0004 */      beql $s0, $t6, .L80138E54
  /* 157FE4 80138E44 8FBF0024 */        lw $ra, 0x24($sp)
  /* 157FE8 80138E48 0C009A70 */       jal func_800269C0
  /* 157FEC 80138E4C 2404026D */     addiu $a0, $zero, 0x26d
  /* 157FF0 80138E50 8FBF0024 */        lw $ra, 0x24($sp)
  .L80138E54:
  /* 157FF4 80138E54 8FB00020 */        lw $s0, 0x20($sp)
  /* 157FF8 80138E58 27BD0058 */     addiu $sp, $sp, 0x58
  /* 157FFC 80138E5C 03E00008 */        jr $ra
  /* 158000 80138E60 00000000 */       nop

glabel vs_results_entry
  /* 158004 80138E64 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 158008 80138E68 27BDFFE0 */     addiu $sp, $sp, -0x20
  /* 15800C 80138E6C 3C048014 */       lui $a0, %hi(D_ovl31_80139710)
  /* 158010 80138E70 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 158014 80138E74 24849710 */     addiu $a0, $a0, %lo(D_ovl31_80139710)
  /* 158018 80138E78 AFBF001C */        sw $ra, 0x1c($sp)
  /* 15801C 80138E7C 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 158020 80138E80 AFB10018 */        sw $s1, 0x18($sp)
  /* 158024 80138E84 AFB00014 */        sw $s0, 0x14($sp)
  /* 158028 80138E88 0C001C09 */       jal func_80007024
  /* 15802C 80138E8C AC8F000C */        sw $t7, 0xc($a0) # D_ovl31_80139710 + 12
  /* 158030 80138E90 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 158034 80138E94 3C198014 */       lui $t9, %hi(D_NF_8013A070)
  /* 158038 80138E98 3C048014 */       lui $a0, %hi(D_ovl31_8013972C)
  /* 15803C 80138E9C 2739A070 */     addiu $t9, $t9, %lo(D_NF_8013A070)
  /* 158040 80138EA0 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 158044 80138EA4 2484972C */     addiu $a0, $a0, %lo(D_ovl31_8013972C)
  /* 158048 80138EA8 03194023 */      subu $t0, $t8, $t9
  /* 15804C 80138EAC 0C0289A6 */       jal func_800A2698
  /* 158050 80138EB0 AC880010 */        sw $t0, 0x10($a0) # D_ovl31_8013972C + 16
  /* 158054 80138EB4 00008025 */        or $s0, $zero, $zero
  /* 158058 80138EB8 24110004 */     addiu $s1, $zero, 4
  .L80138EBC:
  /* 15805C 80138EBC 0C00112D */       jal func_800044B4
  /* 158060 80138EC0 02002025 */        or $a0, $s0, $zero
  /* 158064 80138EC4 0C001125 */       jal func_80004494
  /* 158068 80138EC8 02002025 */        or $a0, $s0, $zero
  /* 15806C 80138ECC 26100001 */     addiu $s0, $s0, 1
  /* 158070 80138ED0 1611FFFA */       bne $s0, $s1, .L80138EBC
  /* 158074 80138ED4 00000000 */       nop
  /* 158078 80138ED8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 15807C 80138EDC 8FB00014 */        lw $s0, 0x14($sp)
  /* 158080 80138EE0 8FB10018 */        lw $s1, 0x18($sp)
  /* 158084 80138EE4 03E00008 */        jr $ra
  /* 158088 80138EE8 27BD0020 */     addiu $sp, $sp, 0x20

  /* 15808C 80138EEC 00000000 */       nop

# Likely start of new file
#glabel D_ovl31_80138EF0   # Routine parsed as data
#  /* 158090 80138EF0 8B179319 */       lwl $s7, -0x6ce7($t8)
#  /* 158094 80138EF4 935B9B5B */       lbu $k1, -0x64a5($k0)
#  /* 158098 80138EF8 82D78295 */        lb $s7, -0x7d6b($s6)
#  /* 15809C 80138EFC 7A937251 */  asub_u.b $w9, $w14, $w19
