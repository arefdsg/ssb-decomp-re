#include <gm/battle.h>
#include <ft/fighter.h>

// 0x800D4520
s32 lbMemory_SaveData_CreateChecksum(gmSaveInfo *sp)
{
    s32 i, checksum = 0;
    u8 *spbyte = (u8*)sp;

    for (i = 0; i < (sizeof(gmSaveInfo) - sizeof(gSaveData.mprotect_hash)); i++)
    {
        checksum += *spbyte++ * (i + 1);
    }
    return checksum;
}

// 0x800D45A4
sb32 lbMemory_SaveData_CheckHashValid(void)
{
    if ((lbMemory_SaveData_CreateChecksum(&gSaveData) == gSaveData.mprotect_hash) && (gSaveData.unk5E4 == 0x29A)) // :otstare:
    {
        return TRUE;
    }
    else return FALSE;
}

// 0x800D45F4
void lbMemory_SaveData_WriteSRAM(void)
{
    gSaveData.mprotect_hash = lbMemory_SaveData_CreateChecksum(&gSaveData);
    dma_sram_write(&gSaveData, ALIGN(sizeof(gmSaveInfo),  0x0), sizeof(gmSaveInfo));
    dma_sram_write(&gSaveData, ALIGN(sizeof(gmSaveInfo), 0x10), sizeof(gmSaveInfo));
}

// 0x800D4644
sb32 lbMemory_SaveData_CheckSaveDataValid(void)
{
    dma_sram_read(ALIGN(sizeof(gmSaveInfo), 0x0), &gSaveData, sizeof(gmSaveInfo));

    if (lbMemory_SaveData_CheckHashValid() == FALSE)
    {
        dma_sram_read(ALIGN(sizeof(gmSaveInfo), 0x10), &gSaveData, sizeof(gmSaveInfo));

        if (lbMemory_SaveData_CheckHashValid() == FALSE)
        {
            gSaveData = gDefaultSaveData;

            lbMemory_SaveData_WriteSRAM();

            return FALSE;
        }
        lbMemory_SaveData_WriteSRAM();
    }
    return TRUE;
}

// 0x800D46F4
void func_ovl0_800D46F4(void)
{
    func_80020A34(gSaveData.sound_mono_or_stereo);
    func_80006E94(gSaveData.unk452, gSaveData.unk452, gSaveData.unk454, gSaveData.unk454);
}

// 0x800D473C
void func_ovl0_800D473C(void)
{
    s32 i;

    if (!((gSaveData.character_mask | GMSAVEINFO_CHARACTER_MASK_STARTER) & (1 << gSaveData.unk456)))
    {
        gSaveData.unk456 = gDefaultSaveData.unk456;
    }
    if (!((gSaveData.character_mask | GMSAVEINFO_CHARACTER_MASK_STARTER) & (1 << gSceneData.ft_kind)))
    {
        gSceneData.ft_kind = Ft_Kind_Null;
    }
    if (!((gSaveData.character_mask | GMSAVEINFO_CHARACTER_MASK_STARTER) & (1 << gSceneData.training_human_char_id)))
    {
        gSceneData.training_human_char_id = Ft_Kind_Null;
    }
    if (!((gSaveData.character_mask | GMSAVEINFO_CHARACTER_MASK_STARTER) & (1 << gSceneData.training_cpu_char_id)))
    {
        gSceneData.training_cpu_char_id = Ft_Kind_Null;
    }
    for (i = 0; i < ARRAY_COUNT(gTransferBattleState.player_block); i++)
    {
        if (!((1 << gTransferBattleState.player_block[i].character_kind) & (gSaveData.character_mask | GMSAVEINFO_CHARACTER_MASK_STARTER)))
        {
            gTransferBattleState.player_block[i].character_kind = Ft_Kind_Null;
            gTransferBattleState.player_block[i].player_kind = Pl_Kind_Man;
        }
    }
    if (!(gSaveData.unlock_mask & GMSAVE_UNLOCK_MASK_INISHIE))
    {
        if (gSceneData.sss_battle_gr_kind == Gr_Kind_Inishie)
        {
            gSceneData.sss_battle_gr_kind = gDefaultSceneData.sss_battle_gr_kind;
        }
        if (gSceneData.sss_training_gr_kind == Gr_Kind_Inishie)
        {
            gSceneData.sss_training_gr_kind = gDefaultSceneData.sss_training_gr_kind;
        }
    }
    if (!(gSaveData.unlock_mask & GMSAVE_UNLOCK_MASK_ITEMSWITCH))
    {
        gTransferBattleState.item_toggles = gDefaultBattleState.item_toggles;
        gTransferBattleState.item_switch  = gDefaultBattleState.item_switch;
    }
}

// 0x800D48E0
void lbMemory_SaveData_BackupClearNewcomers(void)
{
    gSaveData.unlock_mask &= ~GMSAVE_UNLOCK_MASK_NEWCOMERS;
    gSaveData.unlock_mask |= gDefaultSaveData.unlock_mask;

    gSaveData.character_mask = gDefaultSaveData.character_mask;
}

// 0x800D4914
void lbMemory_SaveData_BackupClear1PHighScore(void)
{
    s32 i;

    for (i = 0; i < ARRAY_COUNT(gSaveData.spgame_records); i++)
    {
        gSaveData.spgame_records[i].spgame_hiscore         = gDefaultSaveData.spgame_records[i].spgame_hiscore;
        gSaveData.spgame_records[i].spgame_continues       = gDefaultSaveData.spgame_records[i].spgame_continues;
        gSaveData.spgame_records[i].spgame_bonuses         = gDefaultSaveData.spgame_records[i].spgame_bonuses;
        gSaveData.spgame_records[i].spgame_best_difficulty = gDefaultSaveData.spgame_records[i].spgame_best_difficulty;
        gSaveData.spgame_records[i].spgame_complete        = gDefaultSaveData.spgame_records[i].spgame_complete;
    }
}

//0x800D49E0
void lbMemory_SaveData_BackupClearVSRecord(void)
{
    s32 i;

    for (i = 0; i < ARRAY_COUNT(gSaveData.vs_records); i++)
    {
        gSaveData.vs_records[i] = gDefaultSaveData.vs_records[i];
    }
    gSaveData.vsgame_total = gDefaultSaveData.vsgame_total;
}

// 0x800D4B60
void lbMemory_SaveData_BackupClearBonusStageTime(void)
{
    s32 i;

    for (i = 0; i < ARRAY_COUNT(gSaveData.spgame_records); i++)
    {
        gSaveData.spgame_records[i].bonus1_time       = gDefaultSaveData.spgame_records[i].bonus1_time;
        gSaveData.spgame_records[i].bonus1_task_count = gDefaultSaveData.spgame_records[i].bonus1_task_count;
        gSaveData.spgame_records[i].bonus2_time       = gDefaultSaveData.spgame_records[i].bonus2_time;
        gSaveData.spgame_records[i].bonus2_task_count = gDefaultSaveData.spgame_records[i].bonus2_task_count;
    }
}

// 0x800D4C0C
void lbMemory_SaveData_BackupClearPrize(void)
{
    gSaveData.unlock_mask &= ~GMSAVE_UNLOCK_MASK_PRIZE;
    gSaveData.unlock_mask |= gDefaultSaveData.unlock_mask;

    gSaveData.unlock_task_inishie    = gDefaultSaveData.unlock_task_inishie;
    gSaveData.unlock_task_itemswitch = gDefaultSaveData.unlock_task_itemswitch;
}

// 0x800D4C48
void lbMemory_SaveData_BackupClearAllData(void)
{
    gSaveData = gDefaultSaveData;
}

// 0x800D4C90
void func_ovl0_800D4C90(void) // Unused, did HAL compile with -O3?
{
    return;
}
