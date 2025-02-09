#include <ft/fighter.h>

// 0x8014D850
void ftDonkey_ThrowFKneeBend_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    fp->status_vars.common.throwf.kneebend_anim_frame++;

    if
    (
        (fp->status_vars.common.throwf.input_source == FTCOMMON_KNEEBEND_INPUT_TYPE_BUTTON)       &&
        (fp->status_vars.common.throwf.kneebend_anim_frame <= FTCOMMON_KNEEBEND_SHORT_HOP_FRAMES) &&
        (fp->input.pl.button_tap_prev & (R_CBUTTONS | L_CBUTTONS | D_CBUTTONS | U_CBUTTONS))
    )
    {
        fp->status_vars.common.throwf.is_short_hop = TRUE;
    }
    if (attributes->kneebend_anim_length <= fp->status_vars.common.throwf.kneebend_anim_frame)
    {
        ftDonkey_ThrowFJump_SetStatus(fighter_gobj);
    }
}

// 0x8014D8E4
void ftDonkey_ThrowFKneeBend_ProcInterrupt(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (ftCommon_LightThrow_CheckInterruptCommon(fighter_gobj) == FALSE)
    {
        if (ftDonkey_ThrowFF_CheckInterruptThrowFCommon(fighter_gobj) == FALSE)
        {
            if (fp->status_vars.common.throwf.jump_force < fp->input.pl.stick_range.y)
            {
                fp->status_vars.common.throwf.jump_force = fp->input.pl.stick_range.y;
            }
        }
    }
}

// 0x8014D950
void ftDonkey_ThrowFKneeBend_SetStatus(GObj *fighter_gobj, s32 input_source)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Donkey_ThrowFKneeBend, 0.0F, 0.0F, FTSTATUPDATE_NONE_PRESERVE);

    fp->status_vars.common.throwf.jump_force = fp->input.pl.stick_range.y;
    fp->status_vars.common.throwf.kneebend_anim_frame = 0.0F;
    fp->status_vars.common.throwf.input_source = input_source;
    fp->status_vars.common.throwf.is_short_hop = FALSE;
}

// 0x8014D9B8
sb32 ftDonkey_ThrowFKneeBend_CheckInterruptThrowFCommon(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    s32 input_source = ftCommon_KneeBend_GetInputTypeCommon(fp);

    if (input_source != FTCOMMON_KNEEBEND_INPUT_TYPE_NONE)
    {
        ftDonkey_ThrowFKneeBend_SetStatus(fighter_gobj, input_source);

        return TRUE;
    }
    else return FALSE;
}