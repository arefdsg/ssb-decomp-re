#include <ft/fighter.h>

// 0x8015E310
void ftYoshiSpecialNInitCatchVars(ftStruct *fp, void (*proc_catch)(GObj*))
{
    ftCommon_SetCatchVars(fp, FTCATCHKIND_MASK_SPECIALNYOSHI, proc_catch, ftCommon_CaptureYoshi_ProcCapture);
}

// 0x8015E33C
void ftYoshi_SpecialNCatch_UpdateProcStatus(GObj *fighter_gobj, void (*proc_status)(GObj*))
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (((fp->command_vars.flags.flag1 != 0) && (fp->catch_gobj != NULL)) || (fighter_gobj->anim_frame <= 0.0F))
    {
        fp->command_vars.flags.flag1 = 0;

        proc_status(fighter_gobj);
    }
}

// 0x8015E390
void ftYoshi_SpecialNCatch_ProcUpdate(GObj *fighter_gobj)
{
    ftYoshi_SpecialNCatch_UpdateProcStatus(fighter_gobj, ftYoshi_SpecialNRelease_SetStatus);
}

// 0x8015E3B4
void ftYoshi_SpecialAirNCatch_ProcUpdate(GObj *fighter_gobj)
{
    ftYoshi_SpecialNCatch_UpdateProcStatus(fighter_gobj, ftYoshi_SpecialAirNRelease_SetStatus);
}

// 0x8015E3D8
void ftYoshi_SpecialNCatch_UpdateCaptureVars(ftStruct *fp)
{
    if (fp->command_vars.flags.flag2 != 0)
    {
        if (fp->catch_gobj != NULL)
        {
            ftStruct *catch_fp = ftGetStruct(fp->catch_gobj);

            catch_fp->status_vars.common.captureyoshi.stage = 1;

            fp->command_vars.flags.flag2 = 0;
        }
    }
    if (fp->command_vars.flags.flag1 != 0)
    {
        if (fp->catch_gobj != NULL)
        {
            ftStruct *catch_fp = ftGetStruct(fp->catch_gobj);

            catch_fp->status_vars.common.captureyoshi.stage = 3;

            fp->catch_gobj = NULL;

            fp->command_vars.flags.flag1 = 0;

            ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_NONE);
        }
    }
}

// 0x8015E44C
void ftYoshi_SpecialNRelease_ProcUpdate(GObj *fighter_gobj)
{
    ftYoshi_SpecialNCatch_UpdateCaptureVars(ftGetStruct(fighter_gobj));
    ftStatus_IfAnimEnd_SetStatusWait(fighter_gobj);
}

// 0x8015E478
void ftYoshi_SpecialAirNRelease_ProcUpdate(GObj *fighter_gobj)
{
    ftYoshi_SpecialNCatch_UpdateCaptureVars(ftGetStruct(fighter_gobj));
    ftStatus_IfAnimEnd_SetStatusFall(fighter_gobj);
}

// 0x8015E4A4
void ftYoshiSpecialNProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftYoshiSpecialNSwitchStatusAir);
}

// 0x8015E4C8
void ftYoshiSpecialAirNProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftYoshiSpecialAirNSwitchStatusGround);
}

// 0x8015E4EC
void ftYoshi_SpecialNCatch_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftYoshi_SpecialNCatch_SwitchStatusAir);
}

// 0x8015E510
void ftYoshi_SpecialAirNCatch_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftYoshi_SpecialAirNCatch_SwitchStatusGround);
}

// 0x8015E534
void ftYoshi_SpecialNRelease_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftYoshi_SpecialNRelease_SwitchStatusAir);
}

// 0x8015E558
void ftYoshi_SpecialAirNRelease_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftYoshi_SpecialAirNRelease_SwitchStatusGround);
}

// 0x8015E57C
void ftYoshiSpecialNProcStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->command_vars.flags.flag1 = 0;
}

// 0x8015E588
void ftYoshiSpecialAirNProcStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->command_vars.flags.flag2 = 0;
    fp->command_vars.flags.flag1 = 0;
}

// 0x8015E598
void ftYoshiSpecialAirNSwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialN, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE | FTSTATUPDATE_HIT_PRESERVE));
    ftYoshiSpecialNInitCatchVars(fp, ftYoshi_SpecialNCatch_ProcCatch);
}

// 0x8015E5EC
void ftYoshiSpecialNSwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirN, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE | FTSTATUPDATE_HIT_PRESERVE));
    ftYoshiSpecialNInitCatchVars(fp, ftYoshi_SpecialAirNCatch_ProcCatch);
}

// 0x8015E640
void ftYoshi_SpecialAirNCatch_SwitchStatusGround(GObj *fighter_gobj)
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
}

// 0x8015E680
void ftYoshi_SpecialNCatch_SwitchStatusAir(GObj *fighter_gobj)
{
    ftMap_SetAir(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
}

// 0x8015E6C0
void ftYoshi_SpecialAirNRelease_SwitchStatusGround(GObj *fighter_gobj)
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialNRelease, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
}

// 0x8015E700
void ftYoshi_SpecialNRelease_SwitchStatusAir(GObj *fighter_gobj)
{
    ftMap_SetAir(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirNRelease, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
}

// 0x8015E740
void ftYoshiSpecialNSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->proc_status = ftYoshiSpecialNProcStatus;

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialN, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftYoshiSpecialNInitCatchVars(fp, ftYoshi_SpecialNCatch_ProcCatch);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x8015E
void ftYoshiSpecialAirNSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->proc_status = ftYoshiSpecialAirNProcStatus;

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirN, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftYoshiSpecialNInitCatchVars(fp, ftYoshi_SpecialAirNCatch_ProcCatch);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x8015E7F8
void ftYoshi_SpecialNCatch_InitStatusVars(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL); // Store grab vulnerability flags?
    ftPhysics_StopVelAll(fighter_gobj);

    fp->catch_gobj = fp->search_gobj;
}

// 0x8015E83C
void ftYoshi_SpecialNCatch_ProcCatch(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftYoshi_SpecialNCatch_InitStatusVars(fighter_gobj);
}

// 0x8015E880
void ftYoshi_SpecialAirNCatch_ProcCatch(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftYoshi_SpecialNCatch_InitStatusVars(fighter_gobj);
}

// 0x8015E8C4
void ftYoshi_SpecialNRelease_InitStatusVars(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);

    fp->command_vars.flags.flag2 = 0;
    fp->command_vars.flags.flag1 = 0;
}

// 0x8015E8F8
void ftYoshi_SpecialNRelease_SetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialNRelease, 0.0F, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftYoshi_SpecialNRelease_InitStatusVars(fighter_gobj);
}

// 0x8015E93C
void ftYoshi_SpecialAirNRelease_SetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Yoshi_SpecialAirNRelease, 0.0F, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftYoshi_SpecialNRelease_InitStatusVars(fighter_gobj);
}
