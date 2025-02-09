#include <ft/fighter.h>

// 0x80149A10
void ftCommon_Catch_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->status_vars.common.catchmain.catch_pull_frame_begin > 0.0F)
    {
        fp->status_vars.common.catchmain.catch_pull_frame_begin -= fp->status_vars.common.catchmain.catch_pull_anim_frames;

        if (fp->status_vars.common.catchmain.catch_pull_frame_begin <= 0.0F)
        {
            fp->status_vars.common.catchmain.catch_pull_frame_begin = 0.0F;
        }
    }
    if (fp->command_vars.flags.flag2 != 0)
    {
        fp->status_vars.common.catchmain.catch_pull_frame_begin = fp->command_vars.flags.flag2;

        fp->status_vars.common.catchmain.catch_pull_anim_frames = fp->status_vars.common.catchmain.catch_pull_frame_begin / fp->command_vars.flags.flag1;

        fp->command_vars.flags.flag2 = 0;
    }
    ftStatus_IfAnimEnd_SetStatusWait(fighter_gobj);
}

// 0x80149AC8
void ftCommon_Catch_CaptureSetStatusRelease(GObj *fighter_gobj)
{
    ftStruct *this_fp = ftGetStruct(fighter_gobj);
    ftStruct *catch_fp;
    GObj *catch_gobj;

    ftCommon_Fall_SetStatus(fighter_gobj);

    catch_gobj = this_fp->catch_gobj;

    if (catch_gobj != NULL)
    {
        catch_fp = ftGetStruct(catch_gobj);

        ftCommon_Thrown_ReleaseFighterLoseGrip(catch_gobj);

        if (catch_fp->ground_or_air == GA_Ground)
        {
            ftCommon_Wait_SetStatus(catch_gobj);
        }
        else ftCommon_Fall_SetStatus(catch_gobj);

        catch_fp->capture_gobj = NULL;
        this_fp->catch_gobj = NULL;
    }
}

// 0x80149B48
void func_ovl3_80149B48(GObj *fighter_gobj) // Unused
{
    if (ftMap_CheckGroundStanding(fighter_gobj) == FALSE)
    {
        ftCommon_Catch_CaptureSetStatusRelease(fighter_gobj);
    }
}

// 0x80149B78
void ftCommon_Catch_ProcMap(GObj *fighter_gobj)
{
    if (ftMap_CheckGroundStopEdge(fighter_gobj) == FALSE)
    {
        ftCommon_Catch_CaptureSetStatusRelease(fighter_gobj);
    }
}

// 0x80149BA8
void ftCommon_Catch_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Common_Catch, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);

    fp->command_vars.flags.flag1 = 1;
    fp->command_vars.flags.flag2 = 0;

    fp->status_vars.common.catchmain.catch_pull_anim_frames = 0.0F;
    fp->status_vars.common.catchmain.catch_pull_frame_begin = 0.0F;

    ftCommon_SetCatchVars(fp, FTCATCHKIND_MASK_CATCHCOMMON, ftCommon_CatchPull_SetStatus, ftCommon_CapturePulled_ProcCapture);

    fp->is_shield_catch = FALSE;

    if (((fp->ft_kind == Ft_Kind_Samus) || (fp->ft_kind == Ft_Kind_PolySamus)) && (efParticle_GrappleBeamGlow_MakeEffect(fighter_gobj) != NULL))
    {
        fp->is_attach_effect = TRUE;
    }
}

// 0x80149C60
sb32 ftCommon_Catch_CheckInterruptGuard(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;
    sb32 is_shield_catch = fp->status_vars.common.guard.is_setoff;

    if ((fp->input.pl.button_tap & fp->input.button_mask_a) && (attributes->is_have_catch))
    {
        ftCommon_Catch_SetStatus(fighter_gobj);

        fp->is_shield_catch = is_shield_catch;

        return TRUE;
    }
    else return FALSE;
}

// 0x80149CE0
sb32 ftCommon_Catch_CheckInterruptCommon(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    if (ftCommon_LightThrow_CheckItemTypeThrow(fp) != FALSE)
    {
        ftCommon_LightThrow_DecideSetStatus(fighter_gobj);

        return TRUE;
    }
    else if ((fp->input.pl.button_hold & fp->input.button_mask_z) && (fp->input.pl.button_tap & fp->input.button_mask_a) && (attributes->is_have_catch))
    {
        ftCommon_Catch_SetStatus(fighter_gobj);

        return TRUE;
    }
    else return FALSE;
}

// 0x80149D80
sb32 ftCommon_Catch_CheckInterruptDashRun(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    if (ftCommon_LightThrow_CheckItemTypeThrow(fp) != FALSE)
    {
        ftCommon_ItemThrow_SetStatus(fighter_gobj, ftStatus_Common_LightThrowDash);

        return TRUE;
    }
    else if ((fp->input.pl.button_hold & fp->input.button_mask_z) && (fp->input.pl.button_tap & fp->input.button_mask_a) && (attributes->is_have_catch))
    {
        ftCommon_Catch_SetStatus(fighter_gobj);

        return TRUE;
    }
    else return FALSE;
}

// 0x80149E24
sb32 ftCommon_Catch_CheckInterruptAttack11(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    if (ftCommon_LightThrow_CheckItemTypeThrow(fp) != FALSE)
    {
        ftCommon_ItemThrow_SetStatus(fighter_gobj, ftStatus_Common_LightThrowDash);

        return TRUE;
    }
    else if ((fp->input.pl.button_tap & fp->input.button_mask_z) && (attributes->is_have_catch))
    {
        ftCommon_Catch_SetStatus(fighter_gobj);

        return TRUE;
    }
    else return FALSE;
}