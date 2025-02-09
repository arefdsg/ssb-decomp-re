#include <ft/fighter.h>
#include <ef/effect.h>

// Covers DownBounce, DownWait

// 0x8012C970
u16 ftCommon_DownBounce_SFX[/* */] =
{
    alSound_SFX_DownBounceMario,        // Mario
    alSound_SFX_DownBounceFox,          // Fox
    alSound_SFX_DownBounceDonkey,       // Donkey Kong
    alSound_SFX_DownBounceSamus,        // Samus
    alSound_SFX_DownBounceMario,        // Luigi
    alSound_SFX_DownBounceLink,         // Link
    alSound_SFX_DownBounceYoshi,        // Yoshi
    alSound_SFX_DownBounceCaptain,      // Captain Falcon
    alSound_SFX_DownBounceKirby,        // Kirby
    alSound_SFX_DownBouncePikachu,      // Pikachu
    alSound_SFX_DownBouncePurin,        // Jigglypuff
    alSound_SFX_DownBounceNess,         // Ness
    alSound_SFX_DownBounceMario,        // Master Hand
    alSound_SFX_DownBounceMario,        // Metal Mario
    alSound_SFX_DownBounceMario,        // Poly Mario
    alSound_SFX_DownBounceFox,          // Poly Fox
    alSound_SFX_DownBounceDonkey,       // Poly Donkey Kong
    alSound_SFX_DownBounceSamus,        // Poly Samus
    alSound_SFX_DownBounceMario,        // Poly Luigi
    alSound_SFX_DownBounceLink,         // Poly Link
    alSound_SFX_DownBounceYoshi,        // Poly Yoshi
    alSound_SFX_DownBounceCaptain,      // Poly Captain Falcon
    alSound_SFX_DownBounceKirby,        // Poly Kirby
    alSound_SFX_DownBouncePikachu,      // Poly Pikachu
    alSound_SFX_DownBouncePurin,        // Poly Jigglypuff
    alSound_SFX_DownBounceNess,         // Poly Ness
    alSound_SFX_DownBounceDonkey        // Giant Donkey Kong
};

#define FTCOMMON_DOWNBOUNCE_STATUPDATE_FLAGS (FTSTATUPDATE_PLAYERTAG_PRESERVE | FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_SLOPECONTOUR_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE)

// 0x80144220
void ftCommon_DownWait_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.common.downwait.stand_wait--;

    if (fp->status_vars.common.downwait.stand_wait == 0)
    {
        ftCommon_DownStand_SetStatus(fighter_gobj);
    }
}

// 0x80144254
void ftCommon_DownWait_ProcInterrupt(GObj *fighter_gobj)
{
    if ((ftCommon_DownAttack_CheckInterruptDownWait(fighter_gobj) == FALSE) && (ftCommon_DownForwardOrBack_CheckInterruptCommon(fighter_gobj) == FALSE))
    {
        ftCommon_DownStand_CheckInterruptCommon(fighter_gobj);
    }
}

// 0x80144294
void ftCommon_DownWait_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    s32 status_id;

    if (fp->status_info.status_id == ftStatus_Common_DownBounceD)
    {
        status_id = ftStatus_Common_DownWaitD;
    }
    else status_id = ftStatus_Common_DownWaitU;

    ftMainSetFighterStatus(fighter_gobj, status_id, 0.0F, 1.0F, FTCOMMON_DOWNBOUNCE_STATUPDATE_FLAGS);

    fp->status_vars.common.downwait.stand_wait = FTCOMMON_DOWNWAIT_STAND_WAIT;

    ftSetCaptureIgnoreMask(fp, (FTCATCHKIND_MASK_SPECIALHICAPTAIN | FTCATCHKIND_MASK_CATCHCOMMON | FTCATCHKIND_MASK_SPECIALNKIRBY | FTCATCHKIND_MASK_SPECIALNYOSHI));

    fp->damage_mul = 0.5F;
}

// 0x80144308
void ftCommon_DownBounce_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->status_vars.common.downbounce.attack_buffer != 0)
    {
        fp->status_vars.common.downbounce.attack_buffer--;
    }
    if (fp->input.pl.button_tap & (fp->input.button_mask_a | fp->input.button_mask_b))
    {
        fp->status_vars.common.downbounce.attack_buffer = FTCOMMON_DOWNBOUNCE_ATTACK_BUFFER;
    }
    if ((fighter_gobj->anim_frame <= 0.0F) && (ftCommon_DownAttack_CheckInterruptDownBounce(fighter_gobj) == FALSE) && (ftCommon_DownForwardOrBack_CheckInterruptCommon(fighter_gobj) == FALSE))
    {
        ftCommon_DownWait_SetStatus(fighter_gobj);
    }
}

// 0x80144398
sb32 ftCommon_DownBounce_UpOrDown(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    f32 rot_x = fp->joint[4]->rotate.vec.f.x;

    rot_x /= F_DEG_TO_RAD(360.0F); // DOUBLE_PI32

    rot_x -= (s32)rot_x;

    if ((rot_x < -0.5F) || (rot_x > 0.0F) && (rot_x < 0.5F))
    {
        return 1;
    }
    else return 0;
}

// 0x80144428
void ftCommon_DownBounce_UpdateEffects(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftParticle_MakeEffectKind(fighter_gobj, Ef_Kind_ImpactWave, ftParts_Joint_TopN, NULL, NULL, fp->lr, FALSE, FALSE);
    func_800269C0(ftCommon_DownBounce_SFX[fp->ft_kind]);
    ftMainMakeRumble(fp, 4, 0);
}

// 0x80144498
void ftCommon_DownBounce_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    s32 status_id;

    if (fp->ground_or_air == GA_Air)
    {
        ftMap_SetGround(fp);
    }
    if (ftCommon_DownBounce_UpOrDown(fighter_gobj) != 0)
    {
        status_id = ftStatus_Common_DownBounceD;
    }
    else status_id = ftStatus_Common_DownBounceU;

    ftMainSetFighterStatus(fighter_gobj, status_id, 0.0F, 1.0F, FTSTATUPDATE_PLAYERTAG_PRESERVE);
    ftCommon_DownBounce_UpdateEffects(fighter_gobj);

    fp->status_vars.common.downbounce.attack_buffer = 0;
    fp->damage_mul = 0.5F;

    ftCommon_VelDamageTransferGround(fp);
}
