.include "macros.inc"

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64     # allow use of 64-bit general purpose registers

.section .text

.align 4

# Text Sections
#  0x80131B00 -> 0x80132F20

glabel mnDataAddLightsDisplayList
  /* 120F50 80131B00 8C830000 */        lw $v1, ($a0)
  /* 120F54 80131B04 3C188013 */       lui $t8, %hi(dMNDataDisplayList)
  /* 120F58 80131B08 27182F40 */     addiu $t8, $t8, %lo(dMNDataDisplayList)
  /* 120F5C 80131B0C 246E0008 */     addiu $t6, $v1, 8
  /* 120F60 80131B10 AC8E0000 */        sw $t6, ($a0)
  /* 120F64 80131B14 3C0FDE00 */       lui $t7, 0xde00
  /* 120F68 80131B18 AC6F0000 */        sw $t7, ($v1)
  /* 120F6C 80131B1C 03E00008 */        jr $ra
  /* 120F70 80131B20 AC780004 */        sw $t8, 4($v1)

glabel mnDataCheckSoundTestUnlocked
  /* 120F74 80131B24 3C0E800A */       lui $t6, %hi((gSaveData + 0x457))
  /* 120F78 80131B28 91CE4937 */       lbu $t6, %lo((gSaveData + 0x457))($t6)
  /* 120F7C 80131B2C 00001025 */        or $v0, $zero, $zero
  /* 120F80 80131B30 31CF0020 */      andi $t7, $t6, 0x20
  /* 120F84 80131B34 11E00003 */      beqz $t7, .L80131B44
  /* 120F88 80131B38 00000000 */       nop 
  /* 120F8C 80131B3C 03E00008 */        jr $ra
  /* 120F90 80131B40 24020001 */     addiu $v0, $zero, 1

  .L80131B44:
  /* 120F94 80131B44 03E00008 */        jr $ra
  /* 120F98 80131B48 00000000 */       nop 

glabel mnDataUpdateOptionTabSObjs
  /* 120F9C 80131B4C 3C0E8013 */       lui $t6, %hi(dMNDataSelectedColors)
  /* 120FA0 80131B50 25CE2F68 */     addiu $t6, $t6, %lo(dMNDataSelectedColors)
  /* 120FA4 80131B54 8DD80000 */        lw $t8, ($t6) # dMNDataSelectedColors + 0
  /* 120FA8 80131B58 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 120FAC 80131B5C 27A30020 */     addiu $v1, $sp, 0x20
  /* 120FB0 80131B60 AC780000 */        sw $t8, ($v1)
  /* 120FB4 80131B64 95D80004 */       lhu $t8, 4($t6) # dMNDataSelectedColors + 4
  /* 120FB8 80131B68 3C198013 */       lui $t9, %hi(dMNDataHighlightColors)
  /* 120FBC 80131B6C 27392F70 */     addiu $t9, $t9, %lo(dMNDataHighlightColors)
  /* 120FC0 80131B70 A4780004 */        sh $t8, 4($v1)
  /* 120FC4 80131B74 8F290000 */        lw $t1, ($t9) # dMNDataHighlightColors + 0
  /* 120FC8 80131B78 27A60018 */     addiu $a2, $sp, 0x18
  /* 120FCC 80131B7C 3C0A8013 */       lui $t2, %hi(dMNDataNotColors)
  /* 120FD0 80131B80 ACC90000 */        sw $t1, ($a2)
  /* 120FD4 80131B84 97290004 */       lhu $t1, 4($t9) # dMNDataHighlightColors + 4
  /* 120FD8 80131B88 254A2F78 */     addiu $t2, $t2, %lo(dMNDataNotColors)
  /* 120FDC 80131B8C 27A70010 */     addiu $a3, $sp, 0x10
  /* 120FE0 80131B90 A4C90004 */        sh $t1, 4($a2)
  /* 120FE4 80131B94 8D4C0000 */        lw $t4, ($t2) # dMNDataNotColors + 0
  /* 120FE8 80131B98 24010001 */     addiu $at, $zero, 1
  /* 120FEC 80131B9C ACEC0000 */        sw $t4, ($a3)
  /* 120FF0 80131BA0 954C0004 */       lhu $t4, 4($t2) # dMNDataNotColors + 4
  /* 120FF4 80131BA4 10A00009 */      beqz $a1, .L80131BCC
  /* 120FF8 80131BA8 A4EC0004 */        sh $t4, 4($a3)
  /* 120FFC 80131BAC 10A10005 */       beq $a1, $at, .L80131BC4
  /* 121000 80131BB0 24010002 */     addiu $at, $zero, 2
  /* 121004 80131BB4 10A10007 */       beq $a1, $at, .L80131BD4
  /* 121008 80131BB8 00601025 */        or $v0, $v1, $zero
  /* 12100C 80131BBC 10000005 */         b .L80131BD4
  /* 121010 80131BC0 8FA2000C */        lw $v0, 0xc($sp)
  .L80131BC4:
  /* 121014 80131BC4 10000003 */         b .L80131BD4
  /* 121018 80131BC8 00C01025 */        or $v0, $a2, $zero
  .L80131BCC:
  /* 12101C 80131BCC 10000001 */         b .L80131BD4
  /* 121020 80131BD0 00E01025 */        or $v0, $a3, $zero
  .L80131BD4:
  /* 121024 80131BD4 8C830074 */        lw $v1, 0x74($a0)
  /* 121028 80131BD8 24040003 */     addiu $a0, $zero, 3
  /* 12102C 80131BDC 00002825 */        or $a1, $zero, $zero
  .L80131BE0:
  /* 121030 80131BE0 904D0000 */       lbu $t5, ($v0)
  /* 121034 80131BE4 24A50001 */     addiu $a1, $a1, 1
  /* 121038 80131BE8 A06D0060 */        sb $t5, 0x60($v1)
  /* 12103C 80131BEC 904E0001 */       lbu $t6, 1($v0)
  /* 121040 80131BF0 A06E0061 */        sb $t6, 0x61($v1)
  /* 121044 80131BF4 904F0002 */       lbu $t7, 2($v0)
  /* 121048 80131BF8 A06F0062 */        sb $t7, 0x62($v1)
  /* 12104C 80131BFC 90580003 */       lbu $t8, 3($v0)
  /* 121050 80131C00 A0780028 */        sb $t8, 0x28($v1)
  /* 121054 80131C04 90590004 */       lbu $t9, 4($v0)
  /* 121058 80131C08 A0790029 */        sb $t9, 0x29($v1)
  /* 12105C 80131C0C 90480005 */       lbu $t0, 5($v0)
  /* 121060 80131C10 A068002A */        sb $t0, 0x2a($v1)
  /* 121064 80131C14 14A4FFF2 */       bne $a1, $a0, .L80131BE0
  /* 121068 80131C18 8C630008 */        lw $v1, 8($v1)
  /* 12106C 80131C1C 03E00008 */        jr $ra
  /* 121070 80131C20 27BD0028 */     addiu $sp, $sp, 0x28

glabel mnDataMakeOptionTabSObjs
  /* 121074 80131C24 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 121078 80131C28 3C0E8013 */       lui $t6, %hi(sMNDataFiles)
  /* 12107C 80131C2C 8DCE3160 */        lw $t6, %lo(sMNDataFiles)($t6)
  /* 121080 80131C30 3C0F0000 */       lui $t7, %hi(D_NF_000001E8)
  /* 121084 80131C34 AFBF0014 */        sw $ra, 0x14($sp)
  /* 121088 80131C38 AFA5002C */        sw $a1, 0x2c($sp)
  /* 12108C 80131C3C 25EF01E8 */     addiu $t7, $t7, %lo(D_NF_000001E8)
  /* 121090 80131C40 AFA40028 */        sw $a0, 0x28($sp)
  /* 121094 80131C44 AFA60030 */        sw $a2, 0x30($sp)
  /* 121098 80131C48 AFA70034 */        sw $a3, 0x34($sp)
  /* 12109C 80131C4C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1210A0 80131C50 01CF2821 */      addu $a1, $t6, $t7
  /* 1210A4 80131C54 94580024 */       lhu $t8, 0x24($v0)
  /* 1210A8 80131C58 3C0A8013 */       lui $t2, %hi(sMNDataFiles)
  /* 1210AC 80131C5C 3C0B0000 */       lui $t3, %hi(D_NF_00000330)
  /* 1210B0 80131C60 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 1210B4 80131C64 A4480024 */        sh $t0, 0x24($v0)
  /* 1210B8 80131C68 35090001 */       ori $t1, $t0, 1
  /* 1210BC 80131C6C A4490024 */        sh $t1, 0x24($v0)
  /* 1210C0 80131C70 C7A4002C */      lwc1 $f4, 0x2c($sp)
  /* 1210C4 80131C74 256B0330 */     addiu $t3, $t3, %lo(D_NF_00000330)
  /* 1210C8 80131C78 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1210CC 80131C7C C7A60030 */      lwc1 $f6, 0x30($sp)
  /* 1210D0 80131C80 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1210D4 80131C84 8D4A3160 */        lw $t2, %lo(sMNDataFiles)($t2)
  /* 1210D8 80131C88 8FA40028 */        lw $a0, 0x28($sp)
  /* 1210DC 80131C8C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1210E0 80131C90 014B2821 */      addu $a1, $t2, $t3
  /* 1210E4 80131C94 944C0024 */       lhu $t4, 0x24($v0)
  /* 1210E8 80131C98 3C014180 */       lui $at, (0x41800000 >> 16) # 16.0
  /* 1210EC 80131C9C 44815000 */      mtc1 $at, $f10 # 16.0 to cop1
  /* 1210F0 80131CA0 318EFFDF */      andi $t6, $t4, 0xffdf
  /* 1210F4 80131CA4 A44E0024 */        sh $t6, 0x24($v0)
  /* 1210F8 80131CA8 35CF0001 */       ori $t7, $t6, 1
  /* 1210FC 80131CAC A44F0024 */        sh $t7, 0x24($v0)
  /* 121100 80131CB0 C7A8002C */      lwc1 $f8, 0x2c($sp)
  /* 121104 80131CB4 24180004 */     addiu $t8, $zero, 4
  /* 121108 80131CB8 2419001D */     addiu $t9, $zero, 0x1d
  /* 12110C 80131CBC 460A4000 */     add.s $f0, $f8, $f10
  /* 121110 80131CC0 3C088013 */       lui $t0, %hi(sMNDataFiles)
  /* 121114 80131CC4 3C090000 */       lui $t1, %hi(D_NF_00000568)
  /* 121118 80131CC8 25290568 */     addiu $t1, $t1, %lo(D_NF_00000568)
  /* 12111C 80131CCC E4400058 */      swc1 $f0, 0x58($v0)
  /* 121120 80131CD0 C7B00030 */      lwc1 $f16, 0x30($sp)
  /* 121124 80131CD4 A0400065 */        sb $zero, 0x65($v0)
  /* 121128 80131CD8 A0400064 */        sb $zero, 0x64($v0)
  /* 12112C 80131CDC A0580067 */        sb $t8, 0x67($v0)
  /* 121130 80131CE0 A0400066 */        sb $zero, 0x66($v0)
  /* 121134 80131CE4 E450005C */      swc1 $f16, 0x5c($v0)
  /* 121138 80131CE8 8FA30034 */        lw $v1, 0x34($sp)
  /* 12113C 80131CEC A459006A */        sh $t9, 0x6a($v0)
  /* 121140 80131CF0 000318C0 */       sll $v1, $v1, 3
  /* 121144 80131CF4 A4430068 */        sh $v1, 0x68($v0)
  /* 121148 80131CF8 8D083160 */        lw $t0, %lo(sMNDataFiles)($t0)
  /* 12114C 80131CFC E7A00020 */      swc1 $f0, 0x20($sp)
  /* 121150 80131D00 AFA3001C */        sw $v1, 0x1c($sp)
  /* 121154 80131D04 8FA40028 */        lw $a0, 0x28($sp)
  /* 121158 80131D08 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 12115C 80131D0C 01092821 */      addu $a1, $t0, $t1
  /* 121160 80131D10 8FA3001C */        lw $v1, 0x1c($sp)
  /* 121164 80131D14 C7A00020 */      lwc1 $f0, 0x20($sp)
  /* 121168 80131D18 944A0024 */       lhu $t2, 0x24($v0)
  /* 12116C 80131D1C 44839000 */      mtc1 $v1, $f18
  /* 121170 80131D20 314CFFDF */      andi $t4, $t2, 0xffdf
  /* 121174 80131D24 46809120 */   cvt.s.w $f4, $f18
  /* 121178 80131D28 A44C0024 */        sh $t4, 0x24($v0)
  /* 12117C 80131D2C 358D0001 */       ori $t5, $t4, 1
  /* 121180 80131D30 A44D0024 */        sh $t5, 0x24($v0)
  /* 121184 80131D34 46040180 */     add.s $f6, $f0, $f4
  /* 121188 80131D38 E4460058 */      swc1 $f6, 0x58($v0)
  /* 12118C 80131D3C C7A80030 */      lwc1 $f8, 0x30($sp)
  /* 121190 80131D40 E448005C */      swc1 $f8, 0x5c($v0)
  /* 121194 80131D44 8FBF0014 */        lw $ra, 0x14($sp)
  /* 121198 80131D48 27BD0028 */     addiu $sp, $sp, 0x28
  /* 12119C 80131D4C 03E00008 */        jr $ra
  /* 1211A0 80131D50 00000000 */       nop 

  /* 1211A4 80131D54 03E00008 */        jr $ra
  /* 1211A8 80131D58 00000000 */       nop 

glabel mnDataMakeCharactersSObj
  /* 1211AC 80131D5C 3C0E8013 */       lui $t6, %hi(sMNDataIsSoundTestUnlocked)
  /* 1211B0 80131D60 8DCE3088 */        lw $t6, %lo(sMNDataIsSoundTestUnlocked)($t6)
  /* 1211B4 80131D64 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1211B8 80131D68 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1211BC 80131D6C 11C00006 */      beqz $t6, .L80131D88
  /* 1211C0 80131D70 00002025 */        or $a0, $zero, $zero
  /* 1211C4 80131D74 240F0085 */     addiu $t7, $zero, 0x85
  /* 1211C8 80131D78 2418002A */     addiu $t8, $zero, 0x2a
  /* 1211CC 80131D7C AFAF0024 */        sw $t7, 0x24($sp)
  /* 1211D0 80131D80 10000005 */         b .L80131D98
  /* 1211D4 80131D84 AFB80020 */        sw $t8, 0x20($sp)
  .L80131D88:
  /* 1211D8 80131D88 24190071 */     addiu $t9, $zero, 0x71
  /* 1211DC 80131D8C 24080039 */     addiu $t0, $zero, 0x39
  /* 1211E0 80131D90 AFB90024 */        sw $t9, 0x24($sp)
  /* 1211E4 80131D94 AFA80020 */        sw $t0, 0x20($sp)
  .L80131D98:
  /* 1211E8 80131D98 00002825 */        or $a1, $zero, $zero
  /* 1211EC 80131D9C 24060004 */     addiu $a2, $zero, 4
  /* 1211F0 80131DA0 0C00265A */       jal omMakeGObjSPAfter
  /* 1211F4 80131DA4 3C078000 */       lui $a3, 0x8000
  /* 1211F8 80131DA8 3C018013 */       lui $at, %hi(sMNDataCharactersGObj)
  /* 1211FC 80131DAC 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 121200 80131DB0 2409FFFF */     addiu $t1, $zero, -1
  /* 121204 80131DB4 AC223060 */        sw $v0, %lo(sMNDataCharactersGObj)($at)
  /* 121208 80131DB8 AFA2002C */        sw $v0, 0x2c($sp)
  /* 12120C 80131DBC AFA90010 */        sw $t1, 0x10($sp)
  /* 121210 80131DC0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 121214 80131DC4 00402025 */        or $a0, $v0, $zero
  /* 121218 80131DC8 24060002 */     addiu $a2, $zero, 2
  /* 12121C 80131DCC 0C00277D */       jal omAddGObjRenderProc
  /* 121220 80131DD0 3C078000 */       lui $a3, 0x8000
  /* 121224 80131DD4 8FAA0024 */        lw $t2, 0x24($sp)
  /* 121228 80131DD8 8FAB0020 */        lw $t3, 0x20($sp)
  /* 12122C 80131DDC 8FA4002C */        lw $a0, 0x2c($sp)
  /* 121230 80131DE0 448A2000 */      mtc1 $t2, $f4
  /* 121234 80131DE4 448B3000 */      mtc1 $t3, $f6
  /* 121238 80131DE8 24070010 */     addiu $a3, $zero, 0x10
  /* 12123C 80131DEC 46802120 */   cvt.s.w $f4, $f4
  /* 121240 80131DF0 468031A0 */   cvt.s.w $f6, $f6
  /* 121244 80131DF4 44052000 */      mfc1 $a1, $f4
  /* 121248 80131DF8 44063000 */      mfc1 $a2, $f6
  /* 12124C 80131DFC 0C04C709 */       jal mnDataMakeOptionTabSObjs
  /* 121250 80131E00 00000000 */       nop 
  /* 121254 80131E04 3C058013 */       lui $a1, %hi(sMNDataOption)
  /* 121258 80131E08 8CA53078 */        lw $a1, %lo(sMNDataOption)($a1)
  /* 12125C 80131E0C 8FA4002C */        lw $a0, 0x2c($sp)
  /* 121260 80131E10 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121264 80131E14 2CA50001 */     sltiu $a1, $a1, 1
  /* 121268 80131E18 3C0C8013 */       lui $t4, %hi(D_ovl61_80133164)
  /* 12126C 80131E1C 8D8C3164 */        lw $t4, %lo(D_ovl61_80133164)($t4)
  /* 121270 80131E20 3C0D0000 */       lui $t5, %hi(D_NF_000014E0)
  /* 121274 80131E24 25AD14E0 */     addiu $t5, $t5, %lo(D_NF_000014E0)
  /* 121278 80131E28 8FA4002C */        lw $a0, 0x2c($sp)
  /* 12127C 80131E2C 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 121280 80131E30 018D2821 */      addu $a1, $t4, $t5
  /* 121284 80131E34 944E0024 */       lhu $t6, 0x24($v0)
  /* 121288 80131E38 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 12128C 80131E3C A4580024 */        sh $t8, 0x24($v0)
  /* 121290 80131E40 37190001 */       ori $t9, $t8, 1
  /* 121294 80131E44 A4590024 */        sh $t9, 0x24($v0)
  /* 121298 80131E48 8FA80024 */        lw $t0, 0x24($sp)
  /* 12129C 80131E4C 2509001A */     addiu $t1, $t0, 0x1a
  /* 1212A0 80131E50 44894000 */      mtc1 $t1, $f8
  /* 1212A4 80131E54 00000000 */       nop 
  /* 1212A8 80131E58 468042A0 */   cvt.s.w $f10, $f8
  /* 1212AC 80131E5C E44A0058 */      swc1 $f10, 0x58($v0)
  /* 1212B0 80131E60 8FAA0020 */        lw $t2, 0x20($sp)
  /* 1212B4 80131E64 A0400028 */        sb $zero, 0x28($v0)
  /* 1212B8 80131E68 A0400029 */        sb $zero, 0x29($v0)
  /* 1212BC 80131E6C 254B0004 */     addiu $t3, $t2, 4
  /* 1212C0 80131E70 448B8000 */      mtc1 $t3, $f16
  /* 1212C4 80131E74 A040002A */        sb $zero, 0x2a($v0)
  /* 1212C8 80131E78 468084A0 */   cvt.s.w $f18, $f16
  /* 1212CC 80131E7C E452005C */      swc1 $f18, 0x5c($v0)
  /* 1212D0 80131E80 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1212D4 80131E84 27BD0030 */     addiu $sp, $sp, 0x30
  /* 1212D8 80131E88 03E00008 */        jr $ra
  /* 1212DC 80131E8C 00000000 */       nop 

glabel mnDataMakeVSRecordSObj
  /* 1212E0 80131E90 3C0E8013 */       lui $t6, %hi(sMNDataIsSoundTestUnlocked)
  /* 1212E4 80131E94 8DCE3088 */        lw $t6, %lo(sMNDataIsSoundTestUnlocked)($t6)
  /* 1212E8 80131E98 27BDFFD0 */     addiu $sp, $sp, -0x30
  /* 1212EC 80131E9C AFBF001C */        sw $ra, 0x1c($sp)
  /* 1212F0 80131EA0 11C00006 */      beqz $t6, .L80131EBC
  /* 1212F4 80131EA4 00002025 */        or $a0, $zero, $zero
  /* 1212F8 80131EA8 240F0065 */     addiu $t7, $zero, 0x65
  /* 1212FC 80131EAC 24180059 */     addiu $t8, $zero, 0x59
  /* 121300 80131EB0 AFAF0024 */        sw $t7, 0x24($sp)
  /* 121304 80131EB4 10000005 */         b .L80131ECC
  /* 121308 80131EB8 AFB80020 */        sw $t8, 0x20($sp)
  .L80131EBC:
  /* 12130C 80131EBC 24190051 */     addiu $t9, $zero, 0x51
  /* 121310 80131EC0 2408007E */     addiu $t0, $zero, 0x7e
  /* 121314 80131EC4 AFB90024 */        sw $t9, 0x24($sp)
  /* 121318 80131EC8 AFA80020 */        sw $t0, 0x20($sp)
  .L80131ECC:
  /* 12131C 80131ECC 00002825 */        or $a1, $zero, $zero
  /* 121320 80131ED0 24060004 */     addiu $a2, $zero, 4
  /* 121324 80131ED4 0C00265A */       jal omMakeGObjSPAfter
  /* 121328 80131ED8 3C078000 */       lui $a3, 0x8000
  /* 12132C 80131EDC 3C018013 */       lui $at, %hi(sMNDataVSRecordGObj)
  /* 121330 80131EE0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 121334 80131EE4 2409FFFF */     addiu $t1, $zero, -1
  /* 121338 80131EE8 AC223064 */        sw $v0, %lo(sMNDataVSRecordGObj)($at)
  /* 12133C 80131EEC AFA2002C */        sw $v0, 0x2c($sp)
  /* 121340 80131EF0 AFA90010 */        sw $t1, 0x10($sp)
  /* 121344 80131EF4 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 121348 80131EF8 00402025 */        or $a0, $v0, $zero
  /* 12134C 80131EFC 24060002 */     addiu $a2, $zero, 2
  /* 121350 80131F00 0C00277D */       jal omAddGObjRenderProc
  /* 121354 80131F04 3C078000 */       lui $a3, 0x8000
  /* 121358 80131F08 8FAA0024 */        lw $t2, 0x24($sp)
  /* 12135C 80131F0C 8FAB0020 */        lw $t3, 0x20($sp)
  /* 121360 80131F10 8FA4002C */        lw $a0, 0x2c($sp)
  /* 121364 80131F14 448A2000 */      mtc1 $t2, $f4
  /* 121368 80131F18 448B3000 */      mtc1 $t3, $f6
  /* 12136C 80131F1C 24070010 */     addiu $a3, $zero, 0x10
  /* 121370 80131F20 46802120 */   cvt.s.w $f4, $f4
  /* 121374 80131F24 468031A0 */   cvt.s.w $f6, $f6
  /* 121378 80131F28 44052000 */      mfc1 $a1, $f4
  /* 12137C 80131F2C 44063000 */      mfc1 $a2, $f6
  /* 121380 80131F30 0C04C709 */       jal mnDataMakeOptionTabSObjs
  /* 121384 80131F34 00000000 */       nop 
  /* 121388 80131F38 3C058013 */       lui $a1, %hi(sMNDataOption)
  /* 12138C 80131F3C 8CA53078 */        lw $a1, %lo(sMNDataOption)($a1)
  /* 121390 80131F40 8FA4002C */        lw $a0, 0x2c($sp)
  /* 121394 80131F44 38A50001 */      xori $a1, $a1, 1
  /* 121398 80131F48 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 12139C 80131F4C 2CA50001 */     sltiu $a1, $a1, 1
  /* 1213A0 80131F50 3C0C8013 */       lui $t4, %hi(D_ovl61_80133164)
  /* 1213A4 80131F54 8D8C3164 */        lw $t4, %lo(D_ovl61_80133164)($t4)
  /* 1213A8 80131F58 3C0D0000 */       lui $t5, %hi(D_NF_00001900)
  /* 1213AC 80131F5C 25AD1900 */     addiu $t5, $t5, %lo(D_NF_00001900)
  /* 1213B0 80131F60 8FA4002C */        lw $a0, 0x2c($sp)
  /* 1213B4 80131F64 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1213B8 80131F68 018D2821 */      addu $a1, $t4, $t5
  /* 1213BC 80131F6C 944E0024 */       lhu $t6, 0x24($v0)
  /* 1213C0 80131F70 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 1213C4 80131F74 A4580024 */        sh $t8, 0x24($v0)
  /* 1213C8 80131F78 37190001 */       ori $t9, $t8, 1
  /* 1213CC 80131F7C A4590024 */        sh $t9, 0x24($v0)
  /* 1213D0 80131F80 8FA80024 */        lw $t0, 0x24($sp)
  /* 1213D4 80131F84 2509001B */     addiu $t1, $t0, 0x1b
  /* 1213D8 80131F88 44894000 */      mtc1 $t1, $f8
  /* 1213DC 80131F8C 00000000 */       nop 
  /* 1213E0 80131F90 468042A0 */   cvt.s.w $f10, $f8
  /* 1213E4 80131F94 E44A0058 */      swc1 $f10, 0x58($v0)
  /* 1213E8 80131F98 8FAA0020 */        lw $t2, 0x20($sp)
  /* 1213EC 80131F9C A0400028 */        sb $zero, 0x28($v0)
  /* 1213F0 80131FA0 A0400029 */        sb $zero, 0x29($v0)
  /* 1213F4 80131FA4 254B0004 */     addiu $t3, $t2, 4
  /* 1213F8 80131FA8 448B8000 */      mtc1 $t3, $f16
  /* 1213FC 80131FAC A040002A */        sb $zero, 0x2a($v0)
  /* 121400 80131FB0 468084A0 */   cvt.s.w $f18, $f16
  /* 121404 80131FB4 E452005C */      swc1 $f18, 0x5c($v0)
  /* 121408 80131FB8 8FBF001C */        lw $ra, 0x1c($sp)
  /* 12140C 80131FBC 27BD0030 */     addiu $sp, $sp, 0x30
  /* 121410 80131FC0 03E00008 */        jr $ra
  /* 121414 80131FC4 00000000 */       nop 

glabel mnDataMakeSoundTestSObj
  /* 121418 80131FC8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 12141C 80131FCC AFBF001C */        sw $ra, 0x1c($sp)
  /* 121420 80131FD0 00002025 */        or $a0, $zero, $zero
  /* 121424 80131FD4 00002825 */        or $a1, $zero, $zero
  /* 121428 80131FD8 24060004 */     addiu $a2, $zero, 4
  /* 12142C 80131FDC 0C00265A */       jal omMakeGObjSPAfter
  /* 121430 80131FE0 3C078000 */       lui $a3, 0x8000
  /* 121434 80131FE4 3C018013 */       lui $at, %hi(sMNDataSoundTestGObj)
  /* 121438 80131FE8 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 12143C 80131FEC 240EFFFF */     addiu $t6, $zero, -1
  /* 121440 80131FF0 AC223068 */        sw $v0, %lo(sMNDataSoundTestGObj)($at)
  /* 121444 80131FF4 AFA20024 */        sw $v0, 0x24($sp)
  /* 121448 80131FF8 AFAE0010 */        sw $t6, 0x10($sp)
  /* 12144C 80131FFC 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 121450 80132000 00402025 */        or $a0, $v0, $zero
  /* 121454 80132004 24060002 */     addiu $a2, $zero, 2
  /* 121458 80132008 0C00277D */       jal omAddGObjRenderProc
  /* 12145C 8013200C 3C078000 */       lui $a3, 0x8000
  /* 121460 80132010 8FA40024 */        lw $a0, 0x24($sp)
  /* 121464 80132014 3C05428A */       lui $a1, 0x428a
  /* 121468 80132018 3C064308 */       lui $a2, 0x4308
  /* 12146C 8013201C 0C04C709 */       jal mnDataMakeOptionTabSObjs
  /* 121470 80132020 24070010 */     addiu $a3, $zero, 0x10
  /* 121474 80132024 3C058013 */       lui $a1, %hi(sMNDataOption)
  /* 121478 80132028 8CA53078 */        lw $a1, %lo(sMNDataOption)($a1)
  /* 12147C 8013202C 8FA40024 */        lw $a0, 0x24($sp)
  /* 121480 80132030 38A50002 */      xori $a1, $a1, 2
  /* 121484 80132034 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121488 80132038 2CA50001 */     sltiu $a1, $a1, 1
  /* 12148C 8013203C 3C0F8013 */       lui $t7, %hi(D_ovl61_80133164)
  /* 121490 80132040 8DEF3164 */        lw $t7, %lo(D_ovl61_80133164)($t7)
  /* 121494 80132044 3C180000 */       lui $t8, %hi(D_NF_00001D20)
  /* 121498 80132048 27181D20 */     addiu $t8, $t8, %lo(D_NF_00001D20)
  /* 12149C 8013204C 8FA40024 */        lw $a0, 0x24($sp)
  /* 1214A0 80132050 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1214A4 80132054 01F82821 */      addu $a1, $t7, $t8
  /* 1214A8 80132058 94590024 */       lhu $t9, 0x24($v0)
  /* 1214AC 8013205C 3C0142BE */       lui $at, (0x42BE0000 >> 16) # 95.0
  /* 1214B0 80132060 44812000 */      mtc1 $at, $f4 # 95.0 to cop1
  /* 1214B4 80132064 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 1214B8 80132068 44813000 */      mtc1 $at, $f6 # 140.0 to cop1
  /* 1214BC 8013206C 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 1214C0 80132070 A4490024 */        sh $t1, 0x24($v0)
  /* 1214C4 80132074 352A0001 */       ori $t2, $t1, 1
  /* 1214C8 80132078 A44A0024 */        sh $t2, 0x24($v0)
  /* 1214CC 8013207C A0400028 */        sb $zero, 0x28($v0)
  /* 1214D0 80132080 A0400029 */        sb $zero, 0x29($v0)
  /* 1214D4 80132084 A040002A */        sb $zero, 0x2a($v0)
  /* 1214D8 80132088 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1214DC 8013208C E446005C */      swc1 $f6, 0x5c($v0)
  /* 1214E0 80132090 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1214E4 80132094 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1214E8 80132098 03E00008 */        jr $ra
  /* 1214EC 8013209C 00000000 */       nop 

  /* 1214F0 801320A0 948E0024 */       lhu $t6, 0x24($a0)
  /* 1214F4 801320A4 240200FF */     addiu $v0, $zero, 0xff
  /* 1214F8 801320A8 A0800060 */        sb $zero, 0x60($a0)
  /* 1214FC 801320AC 31D8FFDF */      andi $t8, $t6, 0xffdf
  /* 121500 801320B0 A4980024 */        sh $t8, 0x24($a0)
  /* 121504 801320B4 37190001 */       ori $t9, $t8, 1
  /* 121508 801320B8 A4990024 */        sh $t9, 0x24($a0)
  /* 12150C 801320BC A0800061 */        sb $zero, 0x61($a0)
  /* 121510 801320C0 A0800062 */        sb $zero, 0x62($a0)
  /* 121514 801320C4 A0820028 */        sb $v0, 0x28($a0)
  /* 121518 801320C8 A0820029 */        sb $v0, 0x29($a0)
  /* 12151C 801320CC 03E00008 */        jr $ra
  /* 121520 801320D0 A082002A */        sb $v0, 0x2a($a0)

glabel mnDataMakeMenuGObj
  /* 121524 801320D4 27BDFFB8 */     addiu $sp, $sp, -0x48
  /* 121528 801320D8 3C0F8013 */       lui $t7, %hi(D_ovl61_80132F80)
  /* 12152C 801320DC AFBF0014 */        sw $ra, 0x14($sp)
  /* 121530 801320E0 25EF2F80 */     addiu $t7, $t7, %lo(D_ovl61_80132F80)
  /* 121534 801320E4 8DF90000 */        lw $t9, ($t7) # D_ovl61_80132F80 + 0
  /* 121538 801320E8 27AE0034 */     addiu $t6, $sp, 0x34
  /* 12153C 801320EC 8DF80004 */        lw $t8, 4($t7) # D_ovl61_80132F80 + 4
  /* 121540 801320F0 ADD90000 */        sw $t9, ($t6)
  /* 121544 801320F4 8DF90008 */        lw $t9, 8($t7) # D_ovl61_80132F80 + 8
  /* 121548 801320F8 3C098013 */       lui $t1, %hi(D_ovl61_80132F8C)
  /* 12154C 801320FC 25292F8C */     addiu $t1, $t1, %lo(D_ovl61_80132F8C)
  /* 121550 80132100 ADD80004 */        sw $t8, 4($t6)
  /* 121554 80132104 ADD90008 */        sw $t9, 8($t6)
  /* 121558 80132108 8D2A0004 */        lw $t2, 4($t1) # D_ovl61_80132F8C + 4
  /* 12155C 8013210C 8D2B0000 */        lw $t3, ($t1) # D_ovl61_80132F8C + 0
  /* 121560 80132110 27A8001C */     addiu $t0, $sp, 0x1c
  /* 121564 80132114 AD0A0004 */        sw $t2, 4($t0)
  /* 121568 80132118 AD0B0000 */        sw $t3, ($t0)
  /* 12156C 8013211C 8D2B0008 */        lw $t3, 8($t1) # D_ovl61_80132F8C + 8
  /* 121570 80132120 8D2A000C */        lw $t2, 0xc($t1) # D_ovl61_80132F8C + 12
  /* 121574 80132124 00002025 */        or $a0, $zero, $zero
  /* 121578 80132128 AD0B0008 */        sw $t3, 8($t0)
  /* 12157C 8013212C AD0A000C */        sw $t2, 0xc($t0)
  /* 121580 80132130 8D2A0014 */        lw $t2, 0x14($t1) # D_ovl61_80132F8C + 20
  /* 121584 80132134 8D2B0010 */        lw $t3, 0x10($t1) # D_ovl61_80132F8C + 16
  /* 121588 80132138 00002825 */        or $a1, $zero, $zero
  /* 12158C 8013213C 24060005 */     addiu $a2, $zero, 5
  /* 121590 80132140 3C078000 */       lui $a3, 0x8000
  /* 121594 80132144 AD0A0014 */        sw $t2, 0x14($t0)
  /* 121598 80132148 0C00265A */       jal omMakeGObjSPAfter
  /* 12159C 8013214C AD0B0010 */        sw $t3, 0x10($t0)
  /* 1215A0 80132150 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1215A4 80132154 3C018013 */       lui $at, %hi(sMNDataMenuGObj)
  /* 1215A8 80132158 AC22307C */        sw $v0, %lo(sMNDataMenuGObj)($at)
  /* 1215AC 8013215C 03E00008 */        jr $ra
  /* 1215B0 80132160 27BD0048 */     addiu $sp, $sp, 0x48

glabel mnDataHeaderProcRender
  /* 1215B4 80132164 3C038004 */       lui $v1, %hi(gDisplayListHead)
  /* 1215B8 80132168 246365B0 */     addiu $v1, $v1, %lo(gDisplayListHead)
  /* 1215BC 8013216C 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1215C0 80132170 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 1215C4 80132174 AFBF0014 */        sw $ra, 0x14($sp)
  /* 1215C8 80132178 244E0008 */     addiu $t6, $v0, 8
  /* 1215CC 8013217C AFA40018 */        sw $a0, 0x18($sp)
  /* 1215D0 80132180 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1215D4 80132184 3C1FE700 */       lui $ra, 0xe700
  /* 1215D8 80132188 AC5F0000 */        sw $ra, ($v0)
  /* 1215DC 8013218C AC400004 */        sw $zero, 4($v0)
  /* 1215E0 80132190 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1215E4 80132194 3C18E300 */       lui $t8, (0xE3000A01 >> 16) # 3808430593
  /* 1215E8 80132198 37180A01 */       ori $t8, $t8, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 1215EC 8013219C 244F0008 */     addiu $t7, $v0, 8
  /* 1215F0 801321A0 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 1215F4 801321A4 AC400004 */        sw $zero, 4($v0)
  /* 1215F8 801321A8 AC580000 */        sw $t8, ($v0)
  /* 1215FC 801321AC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 121600 801321B0 3C0FA078 */       lui $t7, (0xA07814E6 >> 16) # 2692224230
  /* 121604 801321B4 35EF14E6 */       ori $t7, $t7, (0xA07814E6 & 0xFFFF) # 2692224230
  /* 121608 801321B8 24590008 */     addiu $t9, $v0, 8
  /* 12160C 801321BC AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 121610 801321C0 3C0EFA00 */       lui $t6, 0xfa00
  /* 121614 801321C4 AC4E0000 */        sw $t6, ($v0)
  /* 121618 801321C8 AC4F0004 */        sw $t7, 4($v0)
  /* 12161C 801321CC 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 121620 801321D0 3C0EFFFD */       lui $t6, (0xFFFDF6FB >> 16) # 4294833915
  /* 121624 801321D4 3C19FCFF */       lui $t9, (0xFCFFFFFF >> 16) # 4244635647
  /* 121628 801321D8 24580008 */     addiu $t8, $v0, 8
  /* 12162C 801321DC AC780000 */        sw $t8, ($v1) # gDisplayListHead + 0
  /* 121630 801321E0 3739FFFF */       ori $t9, $t9, (0xFCFFFFFF & 0xFFFF) # 4244635647
  /* 121634 801321E4 35CEF6FB */       ori $t6, $t6, (0xFFFDF6FB & 0xFFFF) # 4294833915
  /* 121638 801321E8 AC4E0004 */        sw $t6, 4($v0)
  /* 12163C 801321EC AC590000 */        sw $t9, ($v0)
  /* 121640 801321F0 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 121644 801321F4 3C190050 */       lui $t9, (0x5041C8 >> 16) # 5259720
  /* 121648 801321F8 3C18E200 */       lui $t8, (0xE200001C >> 16) # 3791650844
  /* 12164C 801321FC 244F0008 */     addiu $t7, $v0, 8
  /* 121650 80132200 AC6F0000 */        sw $t7, ($v1) # gDisplayListHead + 0
  /* 121654 80132204 3718001C */       ori $t8, $t8, (0xE200001C & 0xFFFF) # 3791650844
  /* 121658 80132208 373941C8 */       ori $t9, $t9, (0x5041C8 & 0xFFFF) # 5259720
  /* 12165C 8013220C AC590004 */        sw $t9, 4($v0)
  /* 121660 80132210 AC580000 */        sw $t8, ($v0)
  /* 121664 80132214 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 121668 80132218 3C180038 */       lui $t8, (0x38423C >> 16) # 3686972
  /* 12166C 8013221C 3C0FF64D */       lui $t7, (0xF64D8398 >> 16) # 4132275096
  /* 121670 80132220 244E0008 */     addiu $t6, $v0, 8
  /* 121674 80132224 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 121678 80132228 35EF8398 */       ori $t7, $t7, (0xF64D8398 & 0xFFFF) # 4132275096
  /* 12167C 8013222C 3718423C */       ori $t8, $t8, (0x38423C & 0xFFFF) # 3686972
  /* 121680 80132230 AC580004 */        sw $t8, 4($v0)
  /* 121684 80132234 AC4F0000 */        sw $t7, ($v0)
  /* 121688 80132238 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 12168C 8013223C 3C0FE200 */       lui $t7, (0xE200001C >> 16) # 3791650844
  /* 121690 80132240 3C180055 */       lui $t8, (0x552078 >> 16) # 5578872
  /* 121694 80132244 24590008 */     addiu $t9, $v0, 8
  /* 121698 80132248 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 12169C 8013224C AC400004 */        sw $zero, 4($v0)
  /* 1216A0 80132250 AC5F0000 */        sw $ra, ($v0)
  /* 1216A4 80132254 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1216A8 80132258 37182078 */       ori $t8, $t8, (0x552078 & 0xFFFF) # 5578872
  /* 1216AC 8013225C 35EF001C */       ori $t7, $t7, (0xE200001C & 0xFFFF) # 3791650844
  /* 1216B0 80132260 244E0008 */     addiu $t6, $v0, 8
  /* 1216B4 80132264 AC6E0000 */        sw $t6, ($v1) # gDisplayListHead + 0
  /* 1216B8 80132268 AC580004 */        sw $t8, 4($v0)
  /* 1216BC 8013226C AC4F0000 */        sw $t7, ($v0)
  /* 1216C0 80132270 8C620000 */        lw $v0, ($v1) # gDisplayListHead + 0
  /* 1216C4 80132274 3C0EE300 */       lui $t6, (0xE3000A01 >> 16) # 3808430593
  /* 1216C8 80132278 35CE0A01 */       ori $t6, $t6, (0xE3000A01 & 0xFFFF) # 3808430593
  /* 1216CC 8013227C 24590008 */     addiu $t9, $v0, 8
  /* 1216D0 80132280 AC790000 */        sw $t9, ($v1) # gDisplayListHead + 0
  /* 1216D4 80132284 AC400004 */        sw $zero, 4($v0)
  /* 1216D8 80132288 0C0333AB */       jal func_ovl0_800CCEAC
  /* 1216DC 8013228C AC4E0000 */        sw $t6, ($v0)
  /* 1216E0 80132290 0C0333C0 */       jal func_ovl0_800CCF00
  /* 1216E4 80132294 8FA40018 */        lw $a0, 0x18($sp)
  /* 1216E8 80132298 8FBF0014 */        lw $ra, 0x14($sp)
  /* 1216EC 8013229C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 1216F0 801322A0 03E00008 */        jr $ra
  /* 1216F4 801322A4 00000000 */       nop 

glabel mnDataMakeHeaderSObjs
  /* 1216F8 801322A8 27BDFFD8 */     addiu $sp, $sp, -0x28
  /* 1216FC 801322AC AFBF001C */        sw $ra, 0x1c($sp)
  /* 121700 801322B0 00002025 */        or $a0, $zero, $zero
  /* 121704 801322B4 00002825 */        or $a1, $zero, $zero
  /* 121708 801322B8 24060003 */     addiu $a2, $zero, 3
  /* 12170C 801322BC 0C00265A */       jal omMakeGObjSPAfter
  /* 121710 801322C0 3C078000 */       lui $a3, 0x8000
  /* 121714 801322C4 3C058013 */       lui $a1, %hi(mnDataHeaderProcRender)
  /* 121718 801322C8 240EFFFF */     addiu $t6, $zero, -1
  /* 12171C 801322CC AFA20024 */        sw $v0, 0x24($sp)
  /* 121720 801322D0 AFAE0010 */        sw $t6, 0x10($sp)
  /* 121724 801322D4 24A52164 */     addiu $a1, $a1, %lo(mnDataHeaderProcRender)
  /* 121728 801322D8 00402025 */        or $a0, $v0, $zero
  /* 12172C 801322DC 24060001 */     addiu $a2, $zero, 1
  /* 121730 801322E0 0C00277D */       jal omAddGObjRenderProc
  /* 121734 801322E4 3C078000 */       lui $a3, 0x8000
  /* 121738 801322E8 3C0F8013 */       lui $t7, %hi(sMNDataFiles)
  /* 12173C 801322EC 8DEF3160 */        lw $t7, %lo(sMNDataFiles)($t7)
  /* 121740 801322F0 3C180000 */       lui $t8, %hi(D_NF_000031F8)
  /* 121744 801322F4 271831F8 */     addiu $t8, $t8, %lo(D_NF_000031F8)
  /* 121748 801322F8 8FA40024 */        lw $a0, 0x24($sp)
  /* 12174C 801322FC 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 121750 80132300 01F82821 */      addu $a1, $t7, $t8
  /* 121754 80132304 94590024 */       lhu $t9, 0x24($v0)
  /* 121758 80132308 3C01436B */       lui $at, (0x436B0000 >> 16) # 235.0
  /* 12175C 8013230C 44812000 */      mtc1 $at, $f4 # 235.0 to cop1
  /* 121760 80132310 3C01431E */       lui $at, (0x431E0000 >> 16) # 158.0
  /* 121764 80132314 44813000 */      mtc1 $at, $f6 # 158.0 to cop1
  /* 121768 80132318 3329FFDF */      andi $t1, $t9, 0xffdf
  /* 12176C 8013231C A4490024 */        sh $t1, 0x24($v0)
  /* 121770 80132320 352A0001 */       ori $t2, $t1, 1
  /* 121774 80132324 A44A0024 */        sh $t2, 0x24($v0)
  /* 121778 80132328 A0400028 */        sb $zero, 0x28($v0)
  /* 12177C 8013232C A0400029 */        sb $zero, 0x29($v0)
  /* 121780 80132330 A040002A */        sb $zero, 0x2a($v0)
  /* 121784 80132334 3C0B8013 */       lui $t3, %hi(D_ovl61_80133164)
  /* 121788 80132338 E4440058 */      swc1 $f4, 0x58($v0)
  /* 12178C 8013233C E446005C */      swc1 $f6, 0x5c($v0)
  /* 121790 80132340 8D6B3164 */        lw $t3, %lo(D_ovl61_80133164)($t3)
  /* 121794 80132344 3C0C0000 */       lui $t4, %hi(D_NF_000023A8)
  /* 121798 80132348 258C23A8 */     addiu $t4, $t4, %lo(D_NF_000023A8)
  /* 12179C 8013234C 8FA40024 */        lw $a0, 0x24($sp)
  /* 1217A0 80132350 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1217A4 80132354 016C2821 */      addu $a1, $t3, $t4
  /* 1217A8 80132358 944D0024 */       lhu $t5, 0x24($v0)
  /* 1217AC 8013235C 3C01434E */       lui $at, (0x434E0000 >> 16) # 206.0
  /* 1217B0 80132360 44814000 */      mtc1 $at, $f8 # 206.0 to cop1
  /* 1217B4 80132364 3C014303 */       lui $at, (0x43030000 >> 16) # 131.0
  /* 1217B8 80132368 44815000 */      mtc1 $at, $f10 # 131.0 to cop1
  /* 1217BC 8013236C 31AFFFDF */      andi $t7, $t5, 0xffdf
  /* 1217C0 80132370 A44F0024 */        sh $t7, 0x24($v0)
  /* 1217C4 80132374 35F80001 */       ori $t8, $t7, 1
  /* 1217C8 80132378 A4580024 */        sh $t8, 0x24($v0)
  /* 1217CC 8013237C A0400028 */        sb $zero, 0x28($v0)
  /* 1217D0 80132380 A0400029 */        sb $zero, 0x29($v0)
  /* 1217D4 80132384 A040002A */        sb $zero, 0x2a($v0)
  /* 1217D8 80132388 E4480058 */      swc1 $f8, 0x58($v0)
  /* 1217DC 8013238C E44A005C */      swc1 $f10, 0x5c($v0)
  /* 1217E0 80132390 8FBF001C */        lw $ra, 0x1c($sp)
  /* 1217E4 80132394 27BD0028 */     addiu $sp, $sp, 0x28
  /* 1217E8 80132398 03E00008 */        jr $ra
  /* 1217EC 8013239C 00000000 */       nop 

glabel mnDataMakeDecalSObjs
  /* 1217F0 801323A0 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 1217F4 801323A4 AFBF0024 */        sw $ra, 0x24($sp)
  /* 1217F8 801323A8 AFB00020 */        sw $s0, 0x20($sp)
  /* 1217FC 801323AC 00002025 */        or $a0, $zero, $zero
  /* 121800 801323B0 00002825 */        or $a1, $zero, $zero
  /* 121804 801323B4 24060002 */     addiu $a2, $zero, 2
  /* 121808 801323B8 0C00265A */       jal omMakeGObjSPAfter
  /* 12180C 801323BC 3C078000 */       lui $a3, 0x8000
  /* 121810 801323C0 3C05800D */       lui $a1, %hi(func_ovl0_800CCF00)
  /* 121814 801323C4 240EFFFF */     addiu $t6, $zero, -1
  /* 121818 801323C8 00408025 */        or $s0, $v0, $zero
  /* 12181C 801323CC AFAE0010 */        sw $t6, 0x10($sp)
  /* 121820 801323D0 24A5CF00 */     addiu $a1, $a1, %lo(func_ovl0_800CCF00)
  /* 121824 801323D4 00402025 */        or $a0, $v0, $zero
  /* 121828 801323D8 00003025 */        or $a2, $zero, $zero
  /* 12182C 801323DC 0C00277D */       jal omAddGObjRenderProc
  /* 121830 801323E0 3C078000 */       lui $a3, 0x8000
  /* 121834 801323E4 3C0F8013 */       lui $t7, %hi(sMNDataFiles)
  /* 121838 801323E8 8DEF3160 */        lw $t7, %lo(sMNDataFiles)($t7)
  /* 12183C 801323EC 3C180002 */       lui $t8, %hi(D_NF_00018000)
  /* 121840 801323F0 27188000 */     addiu $t8, $t8, %lo(D_NF_00018000)
  /* 121844 801323F4 02002025 */        or $a0, $s0, $zero
  /* 121848 801323F8 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 12184C 801323FC 01F82821 */      addu $a1, $t7, $t8
  /* 121850 80132400 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 121854 80132404 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 121858 80132408 3C198013 */       lui $t9, %hi(sMNDataFiles)
  /* 12185C 8013240C 3C030000 */       lui $v1, %hi(D_NF_00002A30)
  /* 121860 80132410 E4400058 */      swc1 $f0, 0x58($v0)
  /* 121864 80132414 E440005C */      swc1 $f0, 0x5c($v0)
  /* 121868 80132418 8F393160 */        lw $t9, %lo(sMNDataFiles)($t9)
  /* 12186C 8013241C 24632A30 */     addiu $v1, $v1, %lo(D_NF_00002A30)
  /* 121870 80132420 AFA3002C */        sw $v1, 0x2c($sp)
  /* 121874 80132424 02002025 */        or $a0, $s0, $zero
  /* 121878 80132428 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 12187C 8013242C 03232821 */      addu $a1, $t9, $v1
  /* 121880 80132430 8FA3002C */        lw $v1, 0x2c($sp)
  /* 121884 80132434 94480024 */       lhu $t0, 0x24($v0)
  /* 121888 80132438 3C01430C */       lui $at, (0x430C0000 >> 16) # 140.0
  /* 12188C 8013243C 44812000 */      mtc1 $at, $f4 # 140.0 to cop1
  /* 121890 80132440 3C01430F */       lui $at, (0x430F0000 >> 16) # 143.0
  /* 121894 80132444 44813000 */      mtc1 $at, $f6 # 143.0 to cop1
  /* 121898 80132448 310AFFDF */      andi $t2, $t0, 0xffdf
  /* 12189C 8013244C A44A0024 */        sh $t2, 0x24($v0)
  /* 1218A0 80132450 354B0001 */       ori $t3, $t2, 1
  /* 1218A4 80132454 240C00A0 */     addiu $t4, $zero, 0xa0
  /* 1218A8 80132458 240D0078 */     addiu $t5, $zero, 0x78
  /* 1218AC 8013245C 240E0014 */     addiu $t6, $zero, 0x14
  /* 1218B0 80132460 A44B0024 */        sh $t3, 0x24($v0)
  /* 1218B4 80132464 A04C0028 */        sb $t4, 0x28($v0)
  /* 1218B8 80132468 A04D0029 */        sb $t5, 0x29($v0)
  /* 1218BC 8013246C A04E002A */        sb $t6, 0x2a($v0)
  /* 1218C0 80132470 3C0F8013 */       lui $t7, %hi(sMNDataFiles)
  /* 1218C4 80132474 E4440058 */      swc1 $f4, 0x58($v0)
  /* 1218C8 80132478 E446005C */      swc1 $f6, 0x5c($v0)
  /* 1218CC 8013247C 8DEF3160 */        lw $t7, %lo(sMNDataFiles)($t7)
  /* 1218D0 80132480 02002025 */        or $a0, $s0, $zero
  /* 1218D4 80132484 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 1218D8 80132488 01E32821 */      addu $a1, $t7, $v1
  /* 1218DC 8013248C 94580024 */       lhu $t8, 0x24($v0)
  /* 1218E0 80132490 3C014361 */       lui $at, (0x43610000 >> 16) # 225.0
  /* 1218E4 80132494 44814000 */      mtc1 $at, $f8 # 225.0 to cop1
  /* 1218E8 80132498 3C014260 */       lui $at, (0x42600000 >> 16) # 56.0
  /* 1218EC 8013249C 44815000 */      mtc1 $at, $f10 # 56.0 to cop1
  /* 1218F0 801324A0 3308FFDF */      andi $t0, $t8, 0xffdf
  /* 1218F4 801324A4 A4480024 */        sh $t0, 0x24($v0)
  /* 1218F8 801324A8 35090001 */       ori $t1, $t0, 1
  /* 1218FC 801324AC 240A00A0 */     addiu $t2, $zero, 0xa0
  /* 121900 801324B0 240B0078 */     addiu $t3, $zero, 0x78
  /* 121904 801324B4 240C0014 */     addiu $t4, $zero, 0x14
  /* 121908 801324B8 A4490024 */        sh $t1, 0x24($v0)
  /* 12190C 801324BC A04A0028 */        sb $t2, 0x28($v0)
  /* 121910 801324C0 A04B0029 */        sb $t3, 0x29($v0)
  /* 121914 801324C4 A04C002A */        sb $t4, 0x2a($v0)
  /* 121918 801324C8 3C0D8013 */       lui $t5, %hi(D_ovl61_80133164)
  /* 12191C 801324CC E4480058 */      swc1 $f8, 0x58($v0)
  /* 121920 801324D0 E44A005C */      swc1 $f10, 0x5c($v0)
  /* 121924 801324D4 8DAD3164 */        lw $t5, %lo(D_ovl61_80133164)($t5)
  /* 121928 801324D8 3C0E0000 */       lui $t6, %hi(D_NF_00004A78)
  /* 12192C 801324DC 25CE4A78 */     addiu $t6, $t6, %lo(D_NF_00004A78)
  /* 121930 801324E0 02002025 */        or $a0, $s0, $zero
  /* 121934 801324E4 0C0333F7 */       jal gcAppendSObjWithSprite
  /* 121938 801324E8 01AE2821 */      addu $a1, $t5, $t6
  /* 12193C 801324EC 944F0024 */       lhu $t7, 0x24($v0)
  /* 121940 801324F0 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 121944 801324F4 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 121948 801324F8 24030099 */     addiu $v1, $zero, 0x99
  /* 12194C 801324FC 31F9FFDF */      andi $t9, $t7, 0xffdf
  /* 121950 80132500 A4590024 */        sh $t9, 0x24($v0)
  /* 121954 80132504 37280001 */       ori $t0, $t9, 1
  /* 121958 80132508 A4480024 */        sh $t0, 0x24($v0)
  /* 12195C 8013250C A0430028 */        sb $v1, 0x28($v0)
  /* 121960 80132510 A0430029 */        sb $v1, 0x29($v0)
  /* 121964 80132514 A043002A */        sb $v1, 0x2a($v0)
  /* 121968 80132518 E4400058 */      swc1 $f0, 0x58($v0)
  /* 12196C 8013251C E440005C */      swc1 $f0, 0x5c($v0)
  /* 121970 80132520 8FBF0024 */        lw $ra, 0x24($sp)
  /* 121974 80132524 8FB00020 */        lw $s0, 0x20($sp)
  /* 121978 80132528 27BD0038 */     addiu $sp, $sp, 0x38
  /* 12197C 8013252C 03E00008 */        jr $ra
  /* 121980 80132530 00000000 */       nop 

glabel func_ovl61_80132534
  /* 121984 80132534 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 121988 80132538 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 12198C 8013253C AFBF003C */        sw $ra, 0x3c($sp)
  /* 121990 80132540 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 121994 80132544 240F0014 */     addiu $t7, $zero, 0x14
  /* 121998 80132548 24180000 */     addiu $t8, $zero, 0
  /* 12199C 8013254C 24190008 */     addiu $t9, $zero, 8
  /* 1219A0 80132550 2408FFFF */     addiu $t0, $zero, -1
  /* 1219A4 80132554 24090001 */     addiu $t1, $zero, 1
  /* 1219A8 80132558 240A0001 */     addiu $t2, $zero, 1
  /* 1219AC 8013255C AFAA0030 */        sw $t2, 0x30($sp)
  /* 1219B0 80132560 AFA90028 */        sw $t1, 0x28($sp)
  /* 1219B4 80132564 AFA80020 */        sw $t0, 0x20($sp)
  /* 1219B8 80132568 AFB9001C */        sw $t9, 0x1c($sp)
  /* 1219BC 8013256C AFB80018 */        sw $t8, 0x18($sp)
  /* 1219C0 80132570 AFAF0014 */        sw $t7, 0x14($sp)
  /* 1219C4 80132574 AFAE0010 */        sw $t6, 0x10($sp)
  /* 1219C8 80132578 AFA00024 */        sw $zero, 0x24($sp)
  /* 1219CC 8013257C AFA0002C */        sw $zero, 0x2c($sp)
  /* 1219D0 80132580 AFA00034 */        sw $zero, 0x34($sp)
  /* 1219D4 80132584 24040001 */     addiu $a0, $zero, 1
  /* 1219D8 80132588 00002825 */        or $a1, $zero, $zero
  /* 1219DC 8013258C 24060001 */     addiu $a2, $zero, 1
  /* 1219E0 80132590 0C002E4F */       jal func_8000B93C
  /* 1219E4 80132594 3C078000 */       lui $a3, 0x8000
  /* 1219E8 80132598 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 1219EC 8013259C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 1219F0 801325A0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 1219F4 801325A4 8C430074 */        lw $v1, 0x74($v0)
  /* 1219F8 801325A8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 1219FC 801325AC 44050000 */      mfc1 $a1, $f0
  /* 121A00 801325B0 44060000 */      mfc1 $a2, $f0
  /* 121A04 801325B4 3C07439B */       lui $a3, 0x439b
  /* 121A08 801325B8 24640008 */     addiu $a0, $v1, 8
  /* 121A0C 801325BC 0C001C20 */       jal func_80007080
  /* 121A10 801325C0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 121A14 801325C4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 121A18 801325C8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 121A1C 801325CC 03E00008 */        jr $ra
  /* 121A20 801325D0 00000000 */       nop 

glabel func_ovl61_801325D4
  /* 121A24 801325D4 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 121A28 801325D8 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 121A2C 801325DC AFBF003C */        sw $ra, 0x3c($sp)
  /* 121A30 801325E0 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 121A34 801325E4 240F0028 */     addiu $t7, $zero, 0x28
  /* 121A38 801325E8 24180000 */     addiu $t8, $zero, 0
  /* 121A3C 801325EC 24190004 */     addiu $t9, $zero, 4
  /* 121A40 801325F0 2408FFFF */     addiu $t0, $zero, -1
  /* 121A44 801325F4 24090001 */     addiu $t1, $zero, 1
  /* 121A48 801325F8 240A0001 */     addiu $t2, $zero, 1
  /* 121A4C 801325FC AFAA0030 */        sw $t2, 0x30($sp)
  /* 121A50 80132600 AFA90028 */        sw $t1, 0x28($sp)
  /* 121A54 80132604 AFA80020 */        sw $t0, 0x20($sp)
  /* 121A58 80132608 AFB9001C */        sw $t9, 0x1c($sp)
  /* 121A5C 8013260C AFB80018 */        sw $t8, 0x18($sp)
  /* 121A60 80132610 AFAF0014 */        sw $t7, 0x14($sp)
  /* 121A64 80132614 AFAE0010 */        sw $t6, 0x10($sp)
  /* 121A68 80132618 AFA00024 */        sw $zero, 0x24($sp)
  /* 121A6C 8013261C AFA0002C */        sw $zero, 0x2c($sp)
  /* 121A70 80132620 AFA00034 */        sw $zero, 0x34($sp)
  /* 121A74 80132624 24040001 */     addiu $a0, $zero, 1
  /* 121A78 80132628 00002825 */        or $a1, $zero, $zero
  /* 121A7C 8013262C 24060001 */     addiu $a2, $zero, 1
  /* 121A80 80132630 0C002E4F */       jal func_8000B93C
  /* 121A84 80132634 3C078000 */       lui $a3, 0x8000
  /* 121A88 80132638 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 121A8C 8013263C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 121A90 80132640 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 121A94 80132644 8C430074 */        lw $v1, 0x74($v0)
  /* 121A98 80132648 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 121A9C 8013264C 44050000 */      mfc1 $a1, $f0
  /* 121AA0 80132650 44060000 */      mfc1 $a2, $f0
  /* 121AA4 80132654 3C07439B */       lui $a3, 0x439b
  /* 121AA8 80132658 24640008 */     addiu $a0, $v1, 8
  /* 121AAC 8013265C 0C001C20 */       jal func_80007080
  /* 121AB0 80132660 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 121AB4 80132664 8FBF003C */        lw $ra, 0x3c($sp)
  /* 121AB8 80132668 27BD0040 */     addiu $sp, $sp, 0x40
  /* 121ABC 8013266C 03E00008 */        jr $ra
  /* 121AC0 80132670 00000000 */       nop 

glabel func_ovl61_80132674
  /* 121AC4 80132674 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 121AC8 80132678 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 121ACC 8013267C AFBF003C */        sw $ra, 0x3c($sp)
  /* 121AD0 80132680 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 121AD4 80132684 240F003C */     addiu $t7, $zero, 0x3c
  /* 121AD8 80132688 24180000 */     addiu $t8, $zero, 0
  /* 121ADC 8013268C 24190002 */     addiu $t9, $zero, 2
  /* 121AE0 80132690 2408FFFF */     addiu $t0, $zero, -1
  /* 121AE4 80132694 24090001 */     addiu $t1, $zero, 1
  /* 121AE8 80132698 240A0001 */     addiu $t2, $zero, 1
  /* 121AEC 8013269C AFAA0030 */        sw $t2, 0x30($sp)
  /* 121AF0 801326A0 AFA90028 */        sw $t1, 0x28($sp)
  /* 121AF4 801326A4 AFA80020 */        sw $t0, 0x20($sp)
  /* 121AF8 801326A8 AFB9001C */        sw $t9, 0x1c($sp)
  /* 121AFC 801326AC AFB80018 */        sw $t8, 0x18($sp)
  /* 121B00 801326B0 AFAF0014 */        sw $t7, 0x14($sp)
  /* 121B04 801326B4 AFAE0010 */        sw $t6, 0x10($sp)
  /* 121B08 801326B8 AFA00024 */        sw $zero, 0x24($sp)
  /* 121B0C 801326BC AFA0002C */        sw $zero, 0x2c($sp)
  /* 121B10 801326C0 AFA00034 */        sw $zero, 0x34($sp)
  /* 121B14 801326C4 24040001 */     addiu $a0, $zero, 1
  /* 121B18 801326C8 00002825 */        or $a1, $zero, $zero
  /* 121B1C 801326CC 24060001 */     addiu $a2, $zero, 1
  /* 121B20 801326D0 0C002E4F */       jal func_8000B93C
  /* 121B24 801326D4 3C078000 */       lui $a3, 0x8000
  /* 121B28 801326D8 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 121B2C 801326DC 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 121B30 801326E0 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 121B34 801326E4 8C430074 */        lw $v1, 0x74($v0)
  /* 121B38 801326E8 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 121B3C 801326EC 44050000 */      mfc1 $a1, $f0
  /* 121B40 801326F0 44060000 */      mfc1 $a2, $f0
  /* 121B44 801326F4 3C07439B */       lui $a3, 0x439b
  /* 121B48 801326F8 24640008 */     addiu $a0, $v1, 8
  /* 121B4C 801326FC 0C001C20 */       jal func_80007080
  /* 121B50 80132700 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 121B54 80132704 8FBF003C */        lw $ra, 0x3c($sp)
  /* 121B58 80132708 27BD0040 */     addiu $sp, $sp, 0x40
  /* 121B5C 8013270C 03E00008 */        jr $ra
  /* 121B60 80132710 00000000 */       nop 

glabel func_ovl61_80132714
  /* 121B64 80132714 27BDFFC0 */     addiu $sp, $sp, -0x40
  /* 121B68 80132718 3C0E800D */       lui $t6, %hi(func_ovl0_800CD2CC)
  /* 121B6C 8013271C AFBF003C */        sw $ra, 0x3c($sp)
  /* 121B70 80132720 25CED2CC */     addiu $t6, $t6, %lo(func_ovl0_800CD2CC)
  /* 121B74 80132724 240F0050 */     addiu $t7, $zero, 0x50
  /* 121B78 80132728 24180000 */     addiu $t8, $zero, 0
  /* 121B7C 8013272C 24190001 */     addiu $t9, $zero, 1
  /* 121B80 80132730 2408FFFF */     addiu $t0, $zero, -1
  /* 121B84 80132734 24090001 */     addiu $t1, $zero, 1
  /* 121B88 80132738 240A0001 */     addiu $t2, $zero, 1
  /* 121B8C 8013273C AFAA0030 */        sw $t2, 0x30($sp)
  /* 121B90 80132740 AFA90028 */        sw $t1, 0x28($sp)
  /* 121B94 80132744 AFA80020 */        sw $t0, 0x20($sp)
  /* 121B98 80132748 AFB9001C */        sw $t9, 0x1c($sp)
  /* 121B9C 8013274C AFB80018 */        sw $t8, 0x18($sp)
  /* 121BA0 80132750 AFAF0014 */        sw $t7, 0x14($sp)
  /* 121BA4 80132754 AFAE0010 */        sw $t6, 0x10($sp)
  /* 121BA8 80132758 AFA00024 */        sw $zero, 0x24($sp)
  /* 121BAC 8013275C AFA0002C */        sw $zero, 0x2c($sp)
  /* 121BB0 80132760 AFA00034 */        sw $zero, 0x34($sp)
  /* 121BB4 80132764 24040001 */     addiu $a0, $zero, 1
  /* 121BB8 80132768 00002825 */        or $a1, $zero, $zero
  /* 121BBC 8013276C 24060001 */     addiu $a2, $zero, 1
  /* 121BC0 80132770 0C002E4F */       jal func_8000B93C
  /* 121BC4 80132774 3C078000 */       lui $a3, 0x8000
  /* 121BC8 80132778 3C014120 */       lui $at, (0x41200000 >> 16) # 10.0
  /* 121BCC 8013277C 44810000 */      mtc1 $at, $f0 # 10.0 to cop1
  /* 121BD0 80132780 3C014366 */       lui $at, (0x43660000 >> 16) # 230.0
  /* 121BD4 80132784 8C430074 */        lw $v1, 0x74($v0)
  /* 121BD8 80132788 44812000 */      mtc1 $at, $f4 # 230.0 to cop1
  /* 121BDC 8013278C 44050000 */      mfc1 $a1, $f0
  /* 121BE0 80132790 44060000 */      mfc1 $a2, $f0
  /* 121BE4 80132794 3C07439B */       lui $a3, 0x439b
  /* 121BE8 80132798 24640008 */     addiu $a0, $v1, 8
  /* 121BEC 8013279C 0C001C20 */       jal func_80007080
  /* 121BF0 801327A0 E7A40010 */      swc1 $f4, 0x10($sp)
  /* 121BF4 801327A4 8FBF003C */        lw $ra, 0x3c($sp)
  /* 121BF8 801327A8 27BD0040 */     addiu $sp, $sp, 0x40
  /* 121BFC 801327AC 03E00008 */        jr $ra
  /* 121C00 801327B0 00000000 */       nop 

glabel mnDataInitVars
  /* 121C04 801327B4 3C02800A */       lui $v0, %hi((gSceneData + 0x1))
  /* 121C08 801327B8 90424AD1 */       lbu $v0, %lo((gSceneData + 0x1))($v0)
  /* 121C0C 801327BC 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 121C10 801327C0 24010019 */     addiu $at, $zero, 0x19
  /* 121C14 801327C4 10410007 */       beq $v0, $at, .L801327E4
  /* 121C18 801327C8 AFBF0014 */        sw $ra, 0x14($sp)
  /* 121C1C 801327CC 2401003B */     addiu $at, $zero, 0x3b
  /* 121C20 801327D0 10410008 */       beq $v0, $at, .L801327F4
  /* 121C24 801327D4 240F0002 */     addiu $t7, $zero, 2
  /* 121C28 801327D8 3C018013 */       lui $at, %hi(sMNDataOption)
  /* 121C2C 801327DC 10000007 */         b .L801327FC
  /* 121C30 801327E0 AC203078 */        sw $zero, %lo(sMNDataOption)($at)
  .L801327E4:
  /* 121C34 801327E4 240E0001 */     addiu $t6, $zero, 1
  /* 121C38 801327E8 3C018013 */       lui $at, %hi(sMNDataOption)
  /* 121C3C 801327EC 10000003 */         b .L801327FC
  /* 121C40 801327F0 AC2E3078 */        sw $t6, %lo(sMNDataOption)($at)
  .L801327F4:
  /* 121C44 801327F4 3C018013 */       lui $at, %hi(sMNDataOption)
  /* 121C48 801327F8 AC2F3078 */        sw $t7, %lo(sMNDataOption)($at)
  .L801327FC:
  /* 121C4C 801327FC 3C018013 */       lui $at, %hi(sMNDataFirstAvailableOption)
  /* 121C50 80132800 0C04C6C9 */       jal mnDataCheckSoundTestUnlocked
  /* 121C54 80132804 AC203080 */        sw $zero, %lo(sMNDataFirstAvailableOption)($at)
  /* 121C58 80132808 10400008 */      beqz $v0, .L8013282C
  /* 121C5C 8013280C 24080001 */     addiu $t0, $zero, 1
  /* 121C60 80132810 24180002 */     addiu $t8, $zero, 2
  /* 121C64 80132814 3C018013 */       lui $at, %hi(sMNDataLastAvailableOption)
  /* 121C68 80132818 AC383084 */        sw $t8, %lo(sMNDataLastAvailableOption)($at)
  /* 121C6C 8013281C 3C018013 */       lui $at, %hi(sMNDataIsSoundTestUnlocked)
  /* 121C70 80132820 24190001 */     addiu $t9, $zero, 1
  /* 121C74 80132824 10000005 */         b .L8013283C
  /* 121C78 80132828 AC393088 */        sw $t9, %lo(sMNDataIsSoundTestUnlocked)($at)
  .L8013282C:
  /* 121C7C 8013282C 3C018013 */       lui $at, %hi(sMNDataLastAvailableOption)
  /* 121C80 80132830 AC283084 */        sw $t0, %lo(sMNDataLastAvailableOption)($at)
  /* 121C84 80132834 3C018013 */       lui $at, %hi(sMNDataIsSoundTestUnlocked)
  /* 121C88 80132838 AC203088 */        sw $zero, %lo(sMNDataIsSoundTestUnlocked)($at)
  .L8013283C:
  /* 121C8C 8013283C 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 121C90 80132840 3C028013 */       lui $v0, %hi(sMNDataTotalTimeFrames)
  /* 121C94 80132844 AC203090 */        sw $zero, %lo(sMNDataOptionChangeWait)($at)
  /* 121C98 80132848 24423094 */     addiu $v0, $v0, %lo(sMNDataTotalTimeFrames)
  /* 121C9C 8013284C AC400000 */        sw $zero, ($v0) # sMNDataTotalTimeFrames + 0
  /* 121CA0 80132850 3C018013 */       lui $at, %hi(sMNDataIsOptionSelected)
  /* 121CA4 80132854 AC20308C */        sw $zero, %lo(sMNDataIsOptionSelected)($at)
  /* 121CA8 80132858 8C490000 */        lw $t1, ($v0) # sMNDataTotalTimeFrames + 0
  /* 121CAC 8013285C 8FBF0014 */        lw $ra, 0x14($sp)
  /* 121CB0 80132860 3C018013 */       lui $at, %hi(sMNDataReturnFrame)
  /* 121CB4 80132864 252A4650 */     addiu $t2, $t1, 0x4650
  /* 121CB8 80132868 AC2A3098 */        sw $t2, %lo(sMNDataReturnFrame)($at)
  /* 121CBC 8013286C 03E00008 */        jr $ra
  /* 121CC0 80132870 27BD0018 */     addiu $sp, $sp, 0x18

glabel mnDataMainProcUpdate
  /* 121CC4 80132874 27BDFFC8 */     addiu $sp, $sp, -0x38
  /* 121CC8 80132878 3C0F8013 */       lui $t7, %hi(dMNDataOptionGObjs)
  /* 121CCC 8013287C AFBF0014 */        sw $ra, 0x14($sp)
  /* 121CD0 80132880 AFA40038 */        sw $a0, 0x38($sp)
  /* 121CD4 80132884 25EF2FA4 */     addiu $t7, $t7, %lo(dMNDataOptionGObjs)
  /* 121CD8 80132888 8DF90000 */        lw $t9, ($t7) # dMNDataOptionGObjs + 0
  /* 121CDC 8013288C 27AE0024 */     addiu $t6, $sp, 0x24
  /* 121CE0 80132890 8DF80004 */        lw $t8, 4($t7) # dMNDataOptionGObjs + 4
  /* 121CE4 80132894 ADD90000 */        sw $t9, ($t6)
  /* 121CE8 80132898 8DF90008 */        lw $t9, 8($t7) # dMNDataOptionGObjs + 8
  /* 121CEC 8013289C 3C038013 */       lui $v1, %hi(sMNDataTotalTimeFrames)
  /* 121CF0 801328A0 24633094 */     addiu $v1, $v1, %lo(sMNDataTotalTimeFrames)
  /* 121CF4 801328A4 ADD80004 */        sw $t8, 4($t6)
  /* 121CF8 801328A8 ADD90008 */        sw $t9, 8($t6)
  /* 121CFC 801328AC 8C680000 */        lw $t0, ($v1) # sMNDataTotalTimeFrames + 0
  /* 121D00 801328B0 3C0A8013 */       lui $t2, %hi(sMNDataReturnFrame)
  /* 121D04 801328B4 25090001 */     addiu $t1, $t0, 1
  /* 121D08 801328B8 2921000A */      slti $at, $t1, 0xa
  /* 121D0C 801328BC 14200125 */      bnez $at, .L80132D54
  /* 121D10 801328C0 AC690000 */        sw $t1, ($v1) # sMNDataTotalTimeFrames + 0
  /* 121D14 801328C4 8D4A3098 */        lw $t2, %lo(sMNDataReturnFrame)($t2)
  /* 121D18 801328C8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 121D1C 801328CC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 121D20 801328D0 15490007 */       bne $t2, $t1, .L801328F0
  /* 121D24 801328D4 240C0001 */     addiu $t4, $zero, 1
  /* 121D28 801328D8 904B0000 */       lbu $t3, ($v0) # gSceneData + 0
  /* 121D2C 801328DC A04C0000 */        sb $t4, ($v0) # gSceneData + 0
  /* 121D30 801328E0 0C00171D */       jal func_80005C74
  /* 121D34 801328E4 A04B0001 */        sb $t3, 1($v0) # gSceneData + 1
  /* 121D38 801328E8 1000011B */         b .L80132D58
  /* 121D3C 801328EC 8FBF0014 */        lw $ra, 0x14($sp)
  .L801328F0:
  /* 121D40 801328F0 0C0E42DF */       jal func_ovl1_80390B7C
  /* 121D44 801328F4 00000000 */       nop 
  /* 121D48 801328F8 3C038013 */       lui $v1, %hi(sMNDataTotalTimeFrames)
  /* 121D4C 801328FC 14400005 */      bnez $v0, .L80132914
  /* 121D50 80132900 24633094 */     addiu $v1, $v1, %lo(sMNDataTotalTimeFrames)
  /* 121D54 80132904 8C6D0000 */        lw $t5, ($v1) # sMNDataTotalTimeFrames + 0
  /* 121D58 80132908 3C018013 */       lui $at, %hi(sMNDataReturnFrame)
  /* 121D5C 8013290C 25AE4650 */     addiu $t6, $t5, 0x4650
  /* 121D60 80132910 AC2E3098 */        sw $t6, %lo(sMNDataReturnFrame)($at)
  .L80132914:
  /* 121D64 80132914 3C0F8013 */       lui $t7, %hi(sMNDataIsOptionSelected)
  /* 121D68 80132918 8DEF308C */        lw $t7, %lo(sMNDataIsOptionSelected)($t7)
  /* 121D6C 8013291C 3C038013 */       lui $v1, %hi(sMNDataOptionChangeWait)
  /* 121D70 80132920 24633090 */     addiu $v1, $v1, %lo(sMNDataOptionChangeWait)
  /* 121D74 80132924 11E00005 */      beqz $t7, .L8013293C
  /* 121D78 80132928 2404FFEC */     addiu $a0, $zero, -0x14
  /* 121D7C 8013292C 0C00171D */       jal func_80005C74
  /* 121D80 80132930 00000000 */       nop 
  /* 121D84 80132934 10000108 */         b .L80132D58
  /* 121D88 80132938 8FBF0014 */        lw $ra, 0x14($sp)
  .L8013293C:
  /* 121D8C 8013293C 8C620000 */        lw $v0, ($v1)
  /* 121D90 80132940 10400002 */      beqz $v0, .L8013294C
  /* 121D94 80132944 2458FFFF */     addiu $t8, $v0, -1
  /* 121D98 80132948 AC780000 */        sw $t8, ($v1)
  .L8013294C:
  /* 121D9C 8013294C 0C0E4281 */       jal func_ovl1_80390A04
  /* 121DA0 80132950 24050014 */     addiu $a1, $zero, 0x14
  /* 121DA4 80132954 1040000E */      beqz $v0, .L80132990
  /* 121DA8 80132958 2404FFEC */     addiu $a0, $zero, -0x14
  /* 121DAC 8013295C 0C0E42B0 */       jal func_ovl1_80390AC0
  /* 121DB0 80132960 24050014 */     addiu $a1, $zero, 0x14
  /* 121DB4 80132964 1040000A */      beqz $v0, .L80132990
  /* 121DB8 80132968 00000000 */       nop 
  /* 121DBC 8013296C 0C0E4201 */       jal func_ovl1_80390804
  /* 121DC0 80132970 24040808 */     addiu $a0, $zero, 0x808
  /* 121DC4 80132974 14400006 */      bnez $v0, .L80132990
  /* 121DC8 80132978 00000000 */       nop 
  /* 121DCC 8013297C 0C0E4201 */       jal func_ovl1_80390804
  /* 121DD0 80132980 24040404 */     addiu $a0, $zero, 0x404
  /* 121DD4 80132984 14400002 */      bnez $v0, .L80132990
  /* 121DD8 80132988 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 121DDC 8013298C AC203090 */        sw $zero, %lo(sMNDataOptionChangeWait)($at)
  .L80132990:
  /* 121DE0 80132990 0C0E41DB */       jal func_ovl1_8039076C
  /* 121DE4 80132994 34049000 */       ori $a0, $zero, 0x9000
  /* 121DE8 80132998 1040004D */      beqz $v0, .L80132AD0
  /* 121DEC 8013299C 3C028013 */       lui $v0, %hi(sMNDataOption)
  /* 121DF0 801329A0 8C423078 */        lw $v0, %lo(sMNDataOption)($v0)
  /* 121DF4 801329A4 24010001 */     addiu $at, $zero, 1
  /* 121DF8 801329A8 10400007 */      beqz $v0, .L801329C8
  /* 121DFC 801329AC 00000000 */       nop 
  /* 121E00 801329B0 1041001B */       beq $v0, $at, .L80132A20
  /* 121E04 801329B4 24010002 */     addiu $at, $zero, 2
  /* 121E08 801329B8 1041002F */       beq $v0, $at, .L80132A78
  /* 121E0C 801329BC 00000000 */       nop 
  /* 121E10 801329C0 10000043 */         b .L80132AD0
  /* 121E14 801329C4 00000000 */       nop 
  .L801329C8:
  /* 121E18 801329C8 0C009A70 */       jal func_800269C0
  /* 121E1C 801329CC 2404009E */     addiu $a0, $zero, 0x9e
  /* 121E20 801329D0 3C198013 */       lui $t9, %hi(sMNDataOption)
  /* 121E24 801329D4 8F393078 */        lw $t9, %lo(sMNDataOption)($t9)
  /* 121E28 801329D8 24050002 */     addiu $a1, $zero, 2
  /* 121E2C 801329DC 00194080 */       sll $t0, $t9, 2
  /* 121E30 801329E0 03A84821 */      addu $t1, $sp, $t0
  /* 121E34 801329E4 8D290024 */        lw $t1, 0x24($t1)
  /* 121E38 801329E8 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121E3C 801329EC 8D240000 */        lw $a0, ($t1)
  /* 121E40 801329F0 0C00829D */       jal func_80020A74
  /* 121E44 801329F4 00000000 */       nop 
  /* 121E48 801329F8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 121E4C 801329FC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 121E50 80132A00 904A0000 */       lbu $t2, ($v0) # gSceneData + 0
  /* 121E54 80132A04 240B001A */     addiu $t3, $zero, 0x1a
  /* 121E58 80132A08 A04B0000 */        sb $t3, ($v0) # gSceneData + 0
  /* 121E5C 80132A0C 240C0001 */     addiu $t4, $zero, 1
  /* 121E60 80132A10 3C018013 */       lui $at, %hi(sMNDataIsOptionSelected)
  /* 121E64 80132A14 A04A0001 */        sb $t2, 1($v0) # gSceneData + 1
  /* 121E68 80132A18 100000CE */         b .L80132D54
  /* 121E6C 80132A1C AC2C308C */        sw $t4, %lo(sMNDataIsOptionSelected)($at)
  .L80132A20:
  /* 121E70 80132A20 0C009A70 */       jal func_800269C0
  /* 121E74 80132A24 2404009E */     addiu $a0, $zero, 0x9e
  /* 121E78 80132A28 3C0D8013 */       lui $t5, %hi(sMNDataOption)
  /* 121E7C 80132A2C 8DAD3078 */        lw $t5, %lo(sMNDataOption)($t5)
  /* 121E80 80132A30 24050002 */     addiu $a1, $zero, 2
  /* 121E84 80132A34 000D7080 */       sll $t6, $t5, 2
  /* 121E88 80132A38 03AE7821 */      addu $t7, $sp, $t6
  /* 121E8C 80132A3C 8DEF0024 */        lw $t7, 0x24($t7)
  /* 121E90 80132A40 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121E94 80132A44 8DE40000 */        lw $a0, ($t7)
  /* 121E98 80132A48 0C00829D */       jal func_80020A74
  /* 121E9C 80132A4C 00000000 */       nop 
  /* 121EA0 80132A50 3C02800A */       lui $v0, %hi(gSceneData)
  /* 121EA4 80132A54 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 121EA8 80132A58 90580000 */       lbu $t8, ($v0) # gSceneData + 0
  /* 121EAC 80132A5C 24190019 */     addiu $t9, $zero, 0x19
  /* 121EB0 80132A60 A0590000 */        sb $t9, ($v0) # gSceneData + 0
  /* 121EB4 80132A64 24080001 */     addiu $t0, $zero, 1
  /* 121EB8 80132A68 3C018013 */       lui $at, %hi(sMNDataIsOptionSelected)
  /* 121EBC 80132A6C A0580001 */        sb $t8, 1($v0) # gSceneData + 1
  /* 121EC0 80132A70 100000B8 */         b .L80132D54
  /* 121EC4 80132A74 AC28308C */        sw $t0, %lo(sMNDataIsOptionSelected)($at)
  .L80132A78:
  /* 121EC8 80132A78 0C009A70 */       jal func_800269C0
  /* 121ECC 80132A7C 2404009E */     addiu $a0, $zero, 0x9e
  /* 121ED0 80132A80 3C098013 */       lui $t1, %hi(sMNDataOption)
  /* 121ED4 80132A84 8D293078 */        lw $t1, %lo(sMNDataOption)($t1)
  /* 121ED8 80132A88 24050002 */     addiu $a1, $zero, 2
  /* 121EDC 80132A8C 00095080 */       sll $t2, $t1, 2
  /* 121EE0 80132A90 03AA5821 */      addu $t3, $sp, $t2
  /* 121EE4 80132A94 8D6B0024 */        lw $t3, 0x24($t3)
  /* 121EE8 80132A98 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121EEC 80132A9C 8D640000 */        lw $a0, ($t3)
  /* 121EF0 80132AA0 0C00829D */       jal func_80020A74
  /* 121EF4 80132AA4 00000000 */       nop 
  /* 121EF8 80132AA8 3C02800A */       lui $v0, %hi(gSceneData)
  /* 121EFC 80132AAC 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 121F00 80132AB0 904C0000 */       lbu $t4, ($v0) # gSceneData + 0
  /* 121F04 80132AB4 240D003B */     addiu $t5, $zero, 0x3b
  /* 121F08 80132AB8 A04D0000 */        sb $t5, ($v0) # gSceneData + 0
  /* 121F0C 80132ABC 240E0001 */     addiu $t6, $zero, 1
  /* 121F10 80132AC0 3C018013 */       lui $at, %hi(sMNDataIsOptionSelected)
  /* 121F14 80132AC4 A04C0001 */        sb $t4, 1($v0) # gSceneData + 1
  /* 121F18 80132AC8 100000A2 */         b .L80132D54
  /* 121F1C 80132ACC AC2E308C */        sw $t6, %lo(sMNDataIsOptionSelected)($at)
  .L80132AD0:
  /* 121F20 80132AD0 0C0E41DB */       jal func_ovl1_8039076C
  /* 121F24 80132AD4 24044000 */     addiu $a0, $zero, 0x4000
  /* 121F28 80132AD8 10400009 */      beqz $v0, .L80132B00
  /* 121F2C 80132ADC 3C02800A */       lui $v0, %hi(gSceneData)
  /* 121F30 80132AE0 24424AD0 */     addiu $v0, $v0, %lo(gSceneData)
  /* 121F34 80132AE4 904F0000 */       lbu $t7, ($v0) # gSceneData + 0
  /* 121F38 80132AE8 24180007 */     addiu $t8, $zero, 7
  /* 121F3C 80132AEC A0580000 */        sb $t8, ($v0) # gSceneData + 0
  /* 121F40 80132AF0 0C00171D */       jal func_80005C74
  /* 121F44 80132AF4 A04F0001 */        sb $t7, 1($v0) # gSceneData + 1
  /* 121F48 80132AF8 10000097 */         b .L80132D58
  /* 121F4C 80132AFC 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132B00:
  /* 121F50 80132B00 3C028013 */       lui $v0, %hi(sMNDataOptionChangeWait)
  /* 121F54 80132B04 8C423090 */        lw $v0, %lo(sMNDataOptionChangeWait)($v0)
  /* 121F58 80132B08 14400007 */      bnez $v0, .L80132B28
  /* 121F5C 80132B0C 00000000 */       nop 
  /* 121F60 80132B10 0C0E4201 */       jal func_ovl1_80390804
  /* 121F64 80132B14 24040808 */     addiu $a0, $zero, 0x808
  /* 121F68 80132B18 14400009 */      bnez $v0, .L80132B40
  /* 121F6C 80132B1C AFA20020 */        sw $v0, 0x20($sp)
  /* 121F70 80132B20 3C028013 */       lui $v0, %hi(sMNDataOptionChangeWait)
  /* 121F74 80132B24 8C423090 */        lw $v0, %lo(sMNDataOptionChangeWait)($v0)
  .L80132B28:
  /* 121F78 80132B28 14400040 */      bnez $v0, .L80132C2C
  /* 121F7C 80132B2C 24040014 */     addiu $a0, $zero, 0x14
  /* 121F80 80132B30 0C0E4254 */       jal func_ovl1_80390950
  /* 121F84 80132B34 24050001 */     addiu $a1, $zero, 1
  /* 121F88 80132B38 1040003C */      beqz $v0, .L80132C2C
  /* 121F8C 80132B3C AFA20030 */        sw $v0, 0x30($sp)
  .L80132B40:
  /* 121F90 80132B40 0C009A70 */       jal func_800269C0
  /* 121F94 80132B44 240400A4 */     addiu $a0, $zero, 0xa4
  /* 121F98 80132B48 8FB90020 */        lw $t9, 0x20($sp)
  /* 121F9C 80132B4C 8FA90030 */        lw $t1, 0x30($sp)
  /* 121FA0 80132B50 240A00A0 */     addiu $t2, $zero, 0xa0
  /* 121FA4 80132B54 13200005 */      beqz $t9, .L80132B6C
  /* 121FA8 80132B58 3C0D8013 */       lui $t5, %hi(sMNDataOption)
  /* 121FAC 80132B5C 2408000C */     addiu $t0, $zero, 0xc
  /* 121FB0 80132B60 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 121FB4 80132B64 10000007 */         b .L80132B84
  /* 121FB8 80132B68 AC283090 */        sw $t0, %lo(sMNDataOptionChangeWait)($at)
  .L80132B6C:
  /* 121FBC 80132B6C 01495823 */      subu $t3, $t2, $t1
  /* 121FC0 80132B70 24010007 */     addiu $at, $zero, 7
  /* 121FC4 80132B74 0161001A */       div $zero, $t3, $at
  /* 121FC8 80132B78 00006012 */      mflo $t4
  /* 121FCC 80132B7C 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 121FD0 80132B80 AC2C3090 */        sw $t4, %lo(sMNDataOptionChangeWait)($at)
  .L80132B84:
  /* 121FD4 80132B84 8DAD3078 */        lw $t5, %lo(sMNDataOption)($t5)
  /* 121FD8 80132B88 00002825 */        or $a1, $zero, $zero
  /* 121FDC 80132B8C 000D7080 */       sll $t6, $t5, 2
  /* 121FE0 80132B90 03AE7821 */      addu $t7, $sp, $t6
  /* 121FE4 80132B94 8DEF0024 */        lw $t7, 0x24($t7)
  /* 121FE8 80132B98 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 121FEC 80132B9C 8DE40000 */        lw $a0, ($t7)
  /* 121FF0 80132BA0 3C038013 */       lui $v1, %hi(sMNDataOption)
  /* 121FF4 80132BA4 24633078 */     addiu $v1, $v1, %lo(sMNDataOption)
  /* 121FF8 80132BA8 3C188013 */       lui $t8, %hi(sMNDataFirstAvailableOption)
  /* 121FFC 80132BAC 8F183080 */        lw $t8, %lo(sMNDataFirstAvailableOption)($t8)
  /* 122000 80132BB0 8C620000 */        lw $v0, ($v1) # sMNDataOption + 0
  /* 122004 80132BB4 3C198013 */       lui $t9, %hi(sMNDataLastAvailableOption)
  /* 122008 80132BB8 17020004 */       bne $t8, $v0, .L80132BCC
  /* 12200C 80132BBC 2448FFFF */     addiu $t0, $v0, -1
  /* 122010 80132BC0 8F393084 */        lw $t9, %lo(sMNDataLastAvailableOption)($t9)
  /* 122014 80132BC4 10000002 */         b .L80132BD0
  /* 122018 80132BC8 AC790000 */        sw $t9, ($v1) # sMNDataOption + 0
  .L80132BCC:
  /* 12201C 80132BCC AC680000 */        sw $t0, ($v1) # sMNDataOption + 0
  .L80132BD0:
  /* 122020 80132BD0 8C6A0000 */        lw $t2, ($v1) # sMNDataOption + 0
  /* 122024 80132BD4 24050001 */     addiu $a1, $zero, 1
  /* 122028 80132BD8 000A4880 */       sll $t1, $t2, 2
  /* 12202C 80132BDC 03A95821 */      addu $t3, $sp, $t1
  /* 122030 80132BE0 8D6B0024 */        lw $t3, 0x24($t3)
  /* 122034 80132BE4 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 122038 80132BE8 8D640000 */        lw $a0, ($t3)
  /* 12203C 80132BEC 3C0C8013 */       lui $t4, %hi(sMNDataFirstAvailableOption)
  /* 122040 80132BF0 3C0D8013 */       lui $t5, %hi(sMNDataOption)
  /* 122044 80132BF4 8DAD3078 */        lw $t5, %lo(sMNDataOption)($t5)
  /* 122048 80132BF8 8D8C3080 */        lw $t4, %lo(sMNDataFirstAvailableOption)($t4)
  /* 12204C 80132BFC 3C0E8013 */       lui $t6, %hi(sMNDataOptionChangeWait)
  /* 122050 80132C00 3C048013 */       lui $a0, %hi(sMNDataMenuGObj)
  /* 122054 80132C04 158D0005 */       bne $t4, $t5, .L80132C1C
  /* 122058 80132C08 00000000 */       nop 
  /* 12205C 80132C0C 8DCE3090 */        lw $t6, %lo(sMNDataOptionChangeWait)($t6)
  /* 122060 80132C10 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 122064 80132C14 25CF0008 */     addiu $t7, $t6, 8
  /* 122068 80132C18 AC2F3090 */        sw $t7, %lo(sMNDataOptionChangeWait)($at)
  .L80132C1C:
  /* 12206C 80132C1C 0C0026A1 */       jal omEjectGObj
  /* 122070 80132C20 8C84307C */        lw $a0, %lo(sMNDataMenuGObj)($a0)
  /* 122074 80132C24 0C04C835 */       jal mnDataMakeMenuGObj
  /* 122078 80132C28 00000000 */       nop 
  .L80132C2C:
  /* 12207C 80132C2C 3C028013 */       lui $v0, %hi(sMNDataOptionChangeWait)
  /* 122080 80132C30 8C423090 */        lw $v0, %lo(sMNDataOptionChangeWait)($v0)
  /* 122084 80132C34 14400007 */      bnez $v0, .L80132C54
  /* 122088 80132C38 00000000 */       nop 
  /* 12208C 80132C3C 0C0E4201 */       jal func_ovl1_80390804
  /* 122090 80132C40 24040404 */     addiu $a0, $zero, 0x404
  /* 122094 80132C44 14400009 */      bnez $v0, .L80132C6C
  /* 122098 80132C48 AFA20020 */        sw $v0, 0x20($sp)
  /* 12209C 80132C4C 3C028013 */       lui $v0, %hi(sMNDataOptionChangeWait)
  /* 1220A0 80132C50 8C423090 */        lw $v0, %lo(sMNDataOptionChangeWait)($v0)
  .L80132C54:
  /* 1220A4 80132C54 1440003F */      bnez $v0, .L80132D54
  /* 1220A8 80132C58 2404FFEC */     addiu $a0, $zero, -0x14
  /* 1220AC 80132C5C 0C0E4254 */       jal func_ovl1_80390950
  /* 1220B0 80132C60 00002825 */        or $a1, $zero, $zero
  /* 1220B4 80132C64 1040003B */      beqz $v0, .L80132D54
  /* 1220B8 80132C68 AFA20030 */        sw $v0, 0x30($sp)
  .L80132C6C:
  /* 1220BC 80132C6C 0C009A70 */       jal func_800269C0
  /* 1220C0 80132C70 240400A4 */     addiu $a0, $zero, 0xa4
  /* 1220C4 80132C74 8FB80020 */        lw $t8, 0x20($sp)
  /* 1220C8 80132C78 8FA80030 */        lw $t0, 0x30($sp)
  /* 1220CC 80132C7C 3C0B8013 */       lui $t3, %hi(sMNDataOption)
  /* 1220D0 80132C80 13000005 */      beqz $t8, .L80132C98
  /* 1220D4 80132C84 250A00A0 */     addiu $t2, $t0, 0xa0
  /* 1220D8 80132C88 2419000C */     addiu $t9, $zero, 0xc
  /* 1220DC 80132C8C 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 1220E0 80132C90 10000006 */         b .L80132CAC
  /* 1220E4 80132C94 AC393090 */        sw $t9, %lo(sMNDataOptionChangeWait)($at)
  .L80132C98:
  /* 1220E8 80132C98 24010007 */     addiu $at, $zero, 7
  /* 1220EC 80132C9C 0141001A */       div $zero, $t2, $at
  /* 1220F0 80132CA0 00004812 */      mflo $t1
  /* 1220F4 80132CA4 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 1220F8 80132CA8 AC293090 */        sw $t1, %lo(sMNDataOptionChangeWait)($at)
  .L80132CAC:
  /* 1220FC 80132CAC 8D6B3078 */        lw $t3, %lo(sMNDataOption)($t3)
  /* 122100 80132CB0 00002825 */        or $a1, $zero, $zero
  /* 122104 80132CB4 000B6080 */       sll $t4, $t3, 2
  /* 122108 80132CB8 03AC6821 */      addu $t5, $sp, $t4
  /* 12210C 80132CBC 8DAD0024 */        lw $t5, 0x24($t5)
  /* 122110 80132CC0 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 122114 80132CC4 8DA40000 */        lw $a0, ($t5)
  /* 122118 80132CC8 3C038013 */       lui $v1, %hi(sMNDataOption)
  /* 12211C 80132CCC 24633078 */     addiu $v1, $v1, %lo(sMNDataOption)
  /* 122120 80132CD0 3C0E8013 */       lui $t6, %hi(sMNDataLastAvailableOption)
  /* 122124 80132CD4 8DCE3084 */        lw $t6, %lo(sMNDataLastAvailableOption)($t6)
  /* 122128 80132CD8 8C620000 */        lw $v0, ($v1) # sMNDataOption + 0
  /* 12212C 80132CDC 3C0F8013 */       lui $t7, %hi(sMNDataFirstAvailableOption)
  /* 122130 80132CE0 15C20004 */       bne $t6, $v0, .L80132CF4
  /* 122134 80132CE4 24580001 */     addiu $t8, $v0, 1
  /* 122138 80132CE8 8DEF3080 */        lw $t7, %lo(sMNDataFirstAvailableOption)($t7)
  /* 12213C 80132CEC 10000002 */         b .L80132CF8
  /* 122140 80132CF0 AC6F0000 */        sw $t7, ($v1) # sMNDataOption + 0
  .L80132CF4:
  /* 122144 80132CF4 AC780000 */        sw $t8, ($v1) # sMNDataOption + 0
  .L80132CF8:
  /* 122148 80132CF8 8C790000 */        lw $t9, ($v1) # sMNDataOption + 0
  /* 12214C 80132CFC 24050001 */     addiu $a1, $zero, 1
  /* 122150 80132D00 00194080 */       sll $t0, $t9, 2
  /* 122154 80132D04 03A85021 */      addu $t2, $sp, $t0
  /* 122158 80132D08 8D4A0024 */        lw $t2, 0x24($t2)
  /* 12215C 80132D0C 0C04C6D3 */       jal mnDataUpdateOptionTabSObjs
  /* 122160 80132D10 8D440000 */        lw $a0, ($t2)
  /* 122164 80132D14 3C098013 */       lui $t1, %hi(sMNDataLastAvailableOption)
  /* 122168 80132D18 3C0B8013 */       lui $t3, %hi(sMNDataOption)
  /* 12216C 80132D1C 8D6B3078 */        lw $t3, %lo(sMNDataOption)($t3)
  /* 122170 80132D20 8D293084 */        lw $t1, %lo(sMNDataLastAvailableOption)($t1)
  /* 122174 80132D24 3C0C8013 */       lui $t4, %hi(sMNDataOptionChangeWait)
  /* 122178 80132D28 3C048013 */       lui $a0, %hi(sMNDataMenuGObj)
  /* 12217C 80132D2C 152B0005 */       bne $t1, $t3, .L80132D44
  /* 122180 80132D30 00000000 */       nop 
  /* 122184 80132D34 8D8C3090 */        lw $t4, %lo(sMNDataOptionChangeWait)($t4)
  /* 122188 80132D38 3C018013 */       lui $at, %hi(sMNDataOptionChangeWait)
  /* 12218C 80132D3C 258D0008 */     addiu $t5, $t4, 8
  /* 122190 80132D40 AC2D3090 */        sw $t5, %lo(sMNDataOptionChangeWait)($at)
  .L80132D44:
  /* 122194 80132D44 0C0026A1 */       jal omEjectGObj
  /* 122198 80132D48 8C84307C */        lw $a0, %lo(sMNDataMenuGObj)($a0)
  /* 12219C 80132D4C 0C04C835 */       jal mnDataMakeMenuGObj
  /* 1221A0 80132D50 00000000 */       nop 
  .L80132D54:
  /* 1221A4 80132D54 8FBF0014 */        lw $ra, 0x14($sp)
  .L80132D58:
  /* 1221A8 80132D58 27BD0038 */     addiu $sp, $sp, 0x38
  /* 1221AC 80132D5C 03E00008 */        jr $ra
  /* 1221B0 80132D60 00000000 */       nop 

glabel mnDataInitMenuAll
  /* 1221B4 80132D64 27BDFFB0 */     addiu $sp, $sp, -0x50
  /* 1221B8 80132D68 3C0E001B */       lui $t6, %hi(D_NF_001AC870)
  /* 1221BC 80132D6C 3C0F0000 */       lui $t7, %hi(D_NF_00000854)
  /* 1221C0 80132D70 3C188013 */       lui $t8, %hi(sMNDataStatusBuf)
  /* 1221C4 80132D74 AFBF001C */        sw $ra, 0x1c($sp)
  /* 1221C8 80132D78 25CEC870 */     addiu $t6, $t6, %lo(D_NF_001AC870)
  /* 1221CC 80132D7C 25EF0854 */     addiu $t7, $t7, %lo(D_NF_00000854)
  /* 1221D0 80132D80 271830A0 */     addiu $t8, $t8, %lo(sMNDataStatusBuf)
  /* 1221D4 80132D84 24190018 */     addiu $t9, $zero, 0x18
  /* 1221D8 80132D88 AFAE0030 */        sw $t6, 0x30($sp)
  /* 1221DC 80132D8C AFAF0034 */        sw $t7, 0x34($sp)
  /* 1221E0 80132D90 AFA00038 */        sw $zero, 0x38($sp)
  /* 1221E4 80132D94 AFA0003C */        sw $zero, 0x3c($sp)
  /* 1221E8 80132D98 AFB80040 */        sw $t8, 0x40($sp)
  /* 1221EC 80132D9C AFB90044 */        sw $t9, 0x44($sp)
  /* 1221F0 80132DA0 AFA00048 */        sw $zero, 0x48($sp)
  /* 1221F4 80132DA4 AFA0004C */        sw $zero, 0x4c($sp)
  /* 1221F8 80132DA8 0C0337DE */       jal rdManagerInitSetup
  /* 1221FC 80132DAC 27A40030 */     addiu $a0, $sp, 0x30
  /* 122200 80132DB0 3C048013 */       lui $a0, %hi(dMNDataFileIDs)
  /* 122204 80132DB4 24842F20 */     addiu $a0, $a0, %lo(dMNDataFileIDs)
  /* 122208 80132DB8 0C0337BB */       jal rdManagerGetAllocSize
  /* 12220C 80132DBC 24050002 */     addiu $a1, $zero, 2
  /* 122210 80132DC0 00402025 */        or $a0, $v0, $zero
  /* 122214 80132DC4 0C001260 */       jal gsMemoryAlloc
  /* 122218 80132DC8 24050010 */     addiu $a1, $zero, 0x10
  /* 12221C 80132DCC 3C048013 */       lui $a0, %hi(dMNDataFileIDs)
  /* 122220 80132DD0 3C068013 */       lui $a2, %hi(sMNDataFiles)
  /* 122224 80132DD4 24C63160 */     addiu $a2, $a2, %lo(sMNDataFiles)
  /* 122228 80132DD8 24842F20 */     addiu $a0, $a0, %lo(dMNDataFileIDs)
  /* 12222C 80132DDC 24050002 */     addiu $a1, $zero, 2
  /* 122230 80132DE0 0C033781 */       jal rdManagerLoadFiles
  /* 122234 80132DE4 00403825 */        or $a3, $v0, $zero
  /* 122238 80132DE8 3C058013 */       lui $a1, %hi(mnDataMainProcUpdate)
  /* 12223C 80132DEC 24A52874 */     addiu $a1, $a1, %lo(mnDataMainProcUpdate)
  /* 122240 80132DF0 00002025 */        or $a0, $zero, $zero
  /* 122244 80132DF4 00003025 */        or $a2, $zero, $zero
  /* 122248 80132DF8 0C00265A */       jal omMakeGObjSPAfter
  /* 12224C 80132DFC 3C078000 */       lui $a3, 0x8000
  /* 122250 80132E00 00002025 */        or $a0, $zero, $zero
  /* 122254 80132E04 3C058000 */       lui $a1, 0x8000
  /* 122258 80132E08 24060064 */     addiu $a2, $zero, 0x64
  /* 12225C 80132E0C 00003825 */        or $a3, $zero, $zero
  /* 122260 80132E10 0C002E7F */       jal func_8000B9FC
  /* 122264 80132E14 AFA00010 */        sw $zero, 0x10($sp)
  /* 122268 80132E18 0C04C9ED */       jal mnDataInitVars
  /* 12226C 80132E1C 00000000 */       nop 
  /* 122270 80132E20 0C04C9C5 */       jal func_ovl61_80132714
  /* 122274 80132E24 00000000 */       nop 
  /* 122278 80132E28 0C04C99D */       jal func_ovl61_80132674
  /* 12227C 80132E2C 00000000 */       nop 
  /* 122280 80132E30 0C04C975 */       jal func_ovl61_801325D4
  /* 122284 80132E34 00000000 */       nop 
  /* 122288 80132E38 0C04C94D */       jal func_ovl61_80132534
  /* 12228C 80132E3C 00000000 */       nop 
  /* 122290 80132E40 0C04C8E8 */       jal mnDataMakeDecalSObjs
  /* 122294 80132E44 00000000 */       nop 
  /* 122298 80132E48 0C04C8AA */       jal mnDataMakeHeaderSObjs
  /* 12229C 80132E4C 00000000 */       nop 
  /* 1222A0 80132E50 0C04C757 */       jal mnDataMakeCharactersSObj
  /* 1222A4 80132E54 00000000 */       nop 
  /* 1222A8 80132E58 0C04C7A4 */       jal mnDataMakeVSRecordSObj
  /* 1222AC 80132E5C 00000000 */       nop 
  /* 1222B0 80132E60 3C088013 */       lui $t0, %hi(sMNDataIsSoundTestUnlocked)
  /* 1222B4 80132E64 8D083088 */        lw $t0, %lo(sMNDataIsSoundTestUnlocked)($t0)
  /* 1222B8 80132E68 11000003 */      beqz $t0, .L80132E78
  /* 1222BC 80132E6C 00000000 */       nop 
  /* 1222C0 80132E70 0C04C7F2 */       jal mnDataMakeSoundTestSObj
  /* 1222C4 80132E74 00000000 */       nop 
  .L80132E78:
  /* 1222C8 80132E78 0C04C835 */       jal mnDataMakeMenuGObj
  /* 1222CC 80132E7C 00000000 */       nop 
  /* 1222D0 80132E80 3C02800A */       lui $v0, %hi((gSceneData + 0x1))
  /* 1222D4 80132E84 90424AD1 */       lbu $v0, %lo((gSceneData + 0x1))($v0)
  /* 1222D8 80132E88 24010019 */     addiu $at, $zero, 0x19
  /* 1222DC 80132E8C 00002025 */        or $a0, $zero, $zero
  /* 1222E0 80132E90 10410005 */       beq $v0, $at, .L80132EA8
  /* 1222E4 80132E94 2401001A */     addiu $at, $zero, 0x1a
  /* 1222E8 80132E98 10410003 */       beq $v0, $at, .L80132EA8
  /* 1222EC 80132E9C 2401003B */     addiu $at, $zero, 0x3b
  /* 1222F0 80132EA0 54410004 */      bnel $v0, $at, .L80132EB4
  /* 1222F4 80132EA4 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132EA8:
  /* 1222F8 80132EA8 0C0082AD */       jal func_80020AB4
  /* 1222FC 80132EAC 2405002C */     addiu $a1, $zero, 0x2c
  /* 122300 80132EB0 8FBF001C */        lw $ra, 0x1c($sp)
  .L80132EB4:
  /* 122304 80132EB4 27BD0050 */     addiu $sp, $sp, 0x50
  /* 122308 80132EB8 03E00008 */        jr $ra
  /* 12230C 80132EBC 00000000 */       nop 

glabel mnDataStartScene
  /* 122310 80132EC0 3C0E800A */       lui $t6, %hi(D_NF_800A5240)
  /* 122314 80132EC4 27BDFFE8 */     addiu $sp, $sp, -0x18
  /* 122318 80132EC8 3C048013 */       lui $a0, %hi(D_ovl61_80132FB0)
  /* 12231C 80132ECC 25CE5240 */     addiu $t6, $t6, %lo(D_NF_800A5240)
  /* 122320 80132ED0 24842FB0 */     addiu $a0, $a0, %lo(D_ovl61_80132FB0)
  /* 122324 80132ED4 AFBF0014 */        sw $ra, 0x14($sp)
  /* 122328 80132ED8 25CFE700 */     addiu $t7, $t6, -0x1900
  /* 12232C 80132EDC 0C001C09 */       jal func_80007024
  /* 122330 80132EE0 AC8F000C */        sw $t7, 0xc($a0) # D_ovl61_80132FB0 + 12
  /* 122334 80132EE4 3C188039 */       lui $t8, %hi(func_ovl1_803903E0)
  /* 122338 80132EE8 3C198013 */       lui $t9, %hi(D_NF_80133170)
  /* 12233C 80132EEC 3C048013 */       lui $a0, %hi(D_ovl61_80132FCC)
  /* 122340 80132EF0 27393170 */     addiu $t9, $t9, %lo(D_NF_80133170)
  /* 122344 80132EF4 271803E0 */     addiu $t8, $t8, %lo(func_ovl1_803903E0)
  /* 122348 80132EF8 24842FCC */     addiu $a0, $a0, %lo(D_ovl61_80132FCC)
  /* 12234C 80132EFC 03194023 */      subu $t0, $t8, $t9
  /* 122350 80132F00 0C001A0F */       jal gsGTLSceneInit
  /* 122354 80132F04 AC880010 */        sw $t0, 0x10($a0) # D_ovl61_80132FCC + 16
  /* 122358 80132F08 8FBF0014 */        lw $ra, 0x14($sp)
  /* 12235C 80132F0C 27BD0018 */     addiu $sp, $sp, 0x18
  /* 122360 80132F10 03E00008 */        jr $ra
  /* 122364 80132F14 00000000 */       nop 

  /* 122368 80132F18 00000000 */       nop 
  /* 12236C 80132F1C 00000000 */       nop 

# Likely start of new file
#glabel dMNDataFileIDs   # Routine parsed as data
#  /* 122370 80132F20 00000000 */       nop 
#  /* 122374 80132F24 00000005 */       lsa $zero, $zero, $zero, 1
#glabel dMNDataLights1   # Routine parsed as data
#  /* 122378 80132F28 20202000 */      addi $zero, $at, 0x2000
#  /* 12237C 80132F2C 20202000 */      addi $zero, $at, 0x2000
#glabel D_ovl61_80132F30   # Routine parsed as data
#  /* 122380 80132F30 FFFFFF00 */        sd $ra, -0x100($ra)
#  /* 122384 80132F34 FFFFFF00 */        sd $ra, -0x100($ra)
