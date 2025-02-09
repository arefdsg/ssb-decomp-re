#include <ft/fighter.h>

// 0x8015A2F0
void ftMasterHand_Okukouki_ProcUpdate(GObj *fighter_gobj)
{
    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, ftMasterHand_Wait_SetStatus);
}

// 0x8015A314
void ftMasterHand_Okukouki_SetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_MasterHand_Okukouki, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMasterHand_Common_CheckPlayerInvertLR(fighter_gobj);
}
