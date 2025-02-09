#include <ft/fighter.h>

#define FTKIRBY_SPECIALNSTART_STATUPDATE_FLAGS (FTSTATUPDATE_LOOPSFX_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE)
#define FTKIRBY_SPECIALNLOOP_STATUPDATE_FLAGS (FTSTATUPDATE_RUMBLE_PRESERVE | FTSTATUPDATE_LOOPSFX_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE | FTSTATUPDATE_HIT_PRESERVE)

// 0x80161CA0
void ftKirbySpecialNApplyCaptureDamage(GObj *kirby_gobj, GObj *victim_gobj, s32 damage)
{
    ftStruct *kirby_fp = ftGetStruct(kirby_gobj);
    ftStruct *victim_fp = ftGetStruct(victim_gobj);
    s32 star_dmg_victim = gmCommon_DamageApplyStale(kirby_fp->player, damage, kirby_fp->attack_id, kirby_fp->motion_count);

    damage = star_dmg_victim;

    ftCommon_Damage_UpdateDamageColAnim(victim_gobj, gmCommonObject_DamageCalcKnockback(victim_fp->percent_damage, star_dmg_victim, star_dmg_victim, 0, 100, 0, victim_fp->attributes->weight, kirby_fp->handicap, victim_fp->handicap), 0);
    ftDamageUpdateCheckDropItem(victim_fp, damage);
    ftAttackUpdateMatchStats(kirby_fp->player, victim_fp->player, damage);
    ftAttackAddStaleQueue(kirby_fp->player, victim_fp->player, kirby_fp->attack_id, kirby_fp->motion_count);
}

// 0x80161D6C - distance between Kirby and inhale victim
f32 ftKirbySpecialNGetCaptureDistance(Vec3f *kirby_pos, Vec3f *victim_pos)
{
    f32 dist_x = kirby_pos->x - victim_pos->x;
    f32 dist_y = kirby_pos->y - victim_pos->y;
    f32 dist_z = kirby_pos->z - victim_pos->z;

    return (dist_x * dist_x) + (dist_y * dist_y) + (dist_z * dist_z);
}

// 0x80161DA8
void ftKirbySpecialNAddCaptureDistance(ftStruct *fp, GObj *fighter_gobj, Vec3f *pos)
{
    *pos = DObjGetStruct(fighter_gobj)->translate.vec.f;

    pos->x += (160.0F * fp->lr);
    pos->y += 100.0F;
}

// 0x80161E08
void ftKirbySpecialNInitStatusVars(GObj *fighter_gobj, sb32 unused)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->command_vars.flags.flag0 = 0;
    fp->command_vars.flags.flag2 = 0;
    fp->command_vars.flags.flag1 = 0;

    fp->status_vars.kirby.specialn.copy_id = Ft_Kind_Kirby;
    fp->status_vars.kirby.specialn.release_lag = FTKIRBY_VACUUM_RELEASE_LAG;
    fp->status_vars.kirby.specialn.dist.x = 0.0F;
    fp->status_vars.kirby.specialn.dist.y = 0.0F;
}

// 0x80161E3C
void ftKirbySpecialNInitCatchVars(ftStruct *fp)
{
    if (fp->ground_or_air == GA_Ground)
    {
        ftCommon_SetCatchVars(fp, FTCATCHKIND_MASK_SPECIALNKIRBY, ftKirby_SpecialNCatch_ProcCatch, ftCommon_CaptureKirby_ProcCapture);
    }
    else ftCommon_SetCatchVars(fp, FTCATCHKIND_MASK_SPECIALNKIRBY, ftKirby_SpecialAirNCatch_ProcCatch, ftCommon_CaptureKirby_ProcCapture);
}

// 0x80161E94
void ftKirbySpecialNGotoInitCatchVars(GObj *fighter_gobj)
{
    ftKirbySpecialNInitCatchVars(ftGetStruct(fighter_gobj));
}

// 0x80161EB4
void ftKirbySpecialNInitFighterVars(ftStruct *fp)
{
    switch (fp->fighter_vars.kirby.copy_id)
    {
    case Ft_Kind_Samus:
        fp->fighter_vars.kirby.copysamus_charge_level = 0;
        fp->fighter_vars.kirby.copysamus_charge_recoil = 0;
        break;

    case Ft_Kind_Donkey:
        fp->fighter_vars.kirby.copydonkey_charge_level = 0;
        break;

    case Ft_Kind_Captain:
        fp->fighter_vars.kirby.copycaptain_falcon_punch_unk = 0;
        break;

    case Ft_Kind_Purin:
        fp->fighter_vars.kirby.copypurin_unk = 0;
        break;
    }
}

extern intptr_t lFTKirbySpecialNCopyData;
extern void *gFTDataKirbyBattleMotion;

// 0x80161F0C
void ftKirby_SpecialNCopy_InitCopyVars(GObj *fighter_gobj)
{
    s16 index;
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftKirbyCopy *copy_data = (ftKirbyCopy*) ((uintptr_t)gFTDataKirbyBattleMotion + (intptr_t)&lFTKirbySpecialNCopyData); // Linker thing

    if (fp->command_vars.flags.flag1 != 0)
    {
        if (fp->fighter_vars.kirby.copy_id == fp->status_vars.kirby.specialn.copy_id)
        {
            func_800269C0(alSound_SFX_KirbySpecialNCopyUnk); // SFX?
        }
        else
        {
            func_800269C0(alSound_SFX_KirbySpecialNCopyThrow); // SFX?

            index = fp->status_vars.kirby.specialn.copy_id;
            fp->fighter_vars.kirby.copy_id = index;

            ftCommon_SetModelPartRenderStateIndex(fighter_gobj, 6, copy_data[index].copy_hat_rs);
            ftCommon_ResetModelPartRenderAll(fighter_gobj);
            ftKirbySpecialNInitFighterVars(fp);
        }
        fp->command_vars.flags.flag1 = 0;
    }
}

// 0x80161FBC
void ftKirbySpecialNStopGFX(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->is_attach_effect == TRUE)
    {
        ftCommon_ProcStopGFX(fighter_gobj);
    }
}

// 0x80161FF8
void ftKirbySpecialNStartProcUpdate(GObj *fighter_gobj)
{
    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, ftKirbySpecialNLoopSetStatus);
}

// 0x8016201C
void ftKirbySpecialNLoopProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (!(fp->is_attach_effect) && (fp->command_vars.flags.flag0 == 1))
    {
        if (efParticle_KirbyInhaleWind_MakeEffect(fighter_gobj) != NULL)
        {
            fp->command_vars.flags.flag0 = 0;
            fp->is_attach_effect = TRUE;
        }
    }
}

// 0x80162078
void ftKirby_SpecialNCatch_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *kirby_fp = ftGetStruct(fighter_gobj);
    ftKirbyCopy *copy_data = (ftKirbyCopy*) ((uintptr_t)gFTDataKirbyBattleMotion + &lFTKirbySpecialNCopyData); // Linker thing
    ftStruct *victim_fp;
    Vec3f kirby_pos;
    f32 dist;

    ftKirbySpecialNAddCaptureDistance(kirby_fp, fighter_gobj, &kirby_pos);

    dist = ftKirbySpecialNGetCaptureDistance(&DObjGetStruct(kirby_fp->catch_gobj)->translate.vec.f, &kirby_pos);

    if (dist < FTKIRBY_VACUUM_SPECIALNWAIT_DIST_MIN)
    {
        victim_fp = ftGetStruct(kirby_fp->catch_gobj); // No NULL check?

        victim_fp->status_vars.common.capturekirby.is_goto_capturewait = TRUE;

        if ((victim_fp->ft_kind == Ft_Kind_Kirby) || (victim_fp->ft_kind == Ft_Kind_PolyKirby))
        {
            kirby_fp->status_vars.kirby.specialn.copy_id = victim_fp->fighter_vars.kirby.copy_id;
            victim_fp->status_vars.common.capturekirby.is_kirby = TRUE;
        }
        else kirby_fp->status_vars.kirby.specialn.copy_id = copy_data[victim_fp->ft_kind].copy_id;
        
        func_800269C0(alSound_SFX_KirbySpecialNCopyEat);

        if (kirby_fp->ground_or_air == GA_Ground)
        {
            ftKirby_SpecialNEat_SetStatus(fighter_gobj);
        }
        else ftKirby_SpecialAirNEat_SetStatus(fighter_gobj);
    }
    else if (dist < FTKIRBY_VACUUM_STOPGFX_DIST_MIN)
    {
        ftKirbySpecialNStopGFX(fighter_gobj);
    }
}

// 0x801621A8
void ftKirbySpecialAirNStartProcUpdate(GObj *fighter_gobj)
{
    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, ftKirbySpecialAirNLoopSetStatus);
}

// 0x801621CC
void ftKirby_SpecialNTurn_ProcUpdate(GObj *fighter_gobj)
{
    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, ftKirby_SpecialNWait_SetStatusFromTurn);
}

// 0x801621F0
void ftKirby_SpecialAirNTurn_ProcUpdate(GObj *fighter_gobj)
{
    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, ftKirby_SpecialAirNWait_SetStatusFromTurn);
}

// 0x80162214
void ftKirby_SpecialNEat_ProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    void (*proc_status)(GObj*) = (fp->ground_or_air == GA_Ground) ? ftKirby_SpecialNWait_SetStatusFromEat : ftKirby_SpecialAirNWait_SetStatusFromEat;

    ftStatus_IfAnimEnd_ProcStatus(fighter_gobj, proc_status);
}

// 0x80162258
void ftKirby_SpecialNThrow_UpdateCheckThrowStar(GObj *fighter_gobj)
{
    ftStruct *kirby_fp = ftGetStruct(fighter_gobj);

    if (kirby_fp->command_vars.flags.flag2 != 0)
    {
        if (kirby_fp->catch_gobj != NULL)
        {
            ftStruct *victim_fp = ftGetStruct(kirby_fp->catch_gobj);

            ftCommon_ThrownKirbyStar_SetStatus(kirby_fp->catch_gobj);
            ftCommon_ThrownUpdateEnemyInfo(victim_fp, fighter_gobj);

            victim_fp->phys_info.vel_air.z = 0.0F;
            victim_fp->phys_info.vel_air.y = 0.0F;
            victim_fp->phys_info.vel_air.x = (-victim_fp->lr * FTKIRBY_VACUUM_THROW_VEL_BASE);
        }
    }
}

// 0x801622DC
void ftKirby_SpecialNCopy_UpdateCheckCopyStar(GObj *fighter_gobj)
{
    ftStruct *kirby_fp = ftGetStruct(fighter_gobj);

    if (kirby_fp->command_vars.flags.flag2 != 0)
    {
        if (kirby_fp->catch_gobj != NULL)
        {
            ftStruct *victim_fp = ftGetStruct(kirby_fp->catch_gobj);

            ftCommon_ThrownCopyStar_SetStatus(kirby_fp->catch_gobj);

            victim_fp->phys_info.vel_air.y = (__sinf(FTKIRBY_VACUUM_COPY_ANGLE) * FTKIRBY_VACUUM_COPY_VEL_BASE);

            victim_fp->phys_info.vel_air.x = (cosf(FTKIRBY_VACUUM_COPY_ANGLE) * victim_fp->lr * FTKIRBY_VACUUM_COPY_VEL_BASE);

            victim_fp->phys_info.vel_air.z = 0.0F;
        }
    }
}

// 0x80162374
void ftKirby_SpecialNThrow_ProcUpdate(GObj *fighter_gobj)
{
    ftKirby_SpecialNThrow_UpdateCheckThrowStar(fighter_gobj);
    ftStatus_IfAnimEnd_SetStatusWait(fighter_gobj);
}

// 0x8016239C
void ftKirby_SpecialAirNThrow_ProcUpdate(GObj *fighter_gobj)
{
    ftKirby_SpecialNThrow_UpdateCheckThrowStar(fighter_gobj);
    ftStatus_IfAnimEnd_SetStatusFall(fighter_gobj);
}

// 0x801623C4
void ftKirby_SpecialNCopy_ProcUpdate(GObj *fighter_gobj)
{
    ftKirby_SpecialNCopy_InitCopyVars(fighter_gobj);
    ftKirby_SpecialNCopy_UpdateCheckCopyStar(fighter_gobj);
    ftStatus_IfAnimEnd_SetStatusWait(fighter_gobj);
}

// 0x801623F4
void ftKirby_SpecialAirNCopy_ProcUpdate(GObj *fighter_gobj)
{
    ftKirby_SpecialNCopy_InitCopyVars(fighter_gobj);
    ftKirby_SpecialNCopy_UpdateCheckCopyStar(fighter_gobj);
    ftStatus_IfAnimEnd_SetStatusFall(fighter_gobj);
}

// 0x80162424
sb32 ftKirbySpecialNLoopCheckContinueLoop(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->status_vars.kirby.specialn.release_lag != 0)
    {
        fp->status_vars.kirby.specialn.release_lag--;
        
        return TRUE;
    }
    else if (fp->input.pl.button_hold & fp->input.button_mask_b)
    {
        return TRUE;
    }
    else return FALSE;
}

// 0x80162468
void ftKirbySpecialNLoopProcInterrupt(GObj *fighter_gobj)
{
    if (ftKirbySpecialNLoopCheckContinueLoop(fighter_gobj) == FALSE)
    {
        ftKirbySpecialNEndSetStatus(fighter_gobj);
    }
}

// 0x80162498
void ftKirbySpecialAirNLoopProcInterrupt(GObj *fighter_gobj)
{
    if (ftKirbySpecialNLoopCheckContinueLoop(fighter_gobj) == FALSE)
    {
        ftKirbySpecialAirNEndSetStatus(fighter_gobj);
    }
}

// 0x801624C8
sb32 ftKirby_SpecialNThrow_CheckGotoThrow(GObj *fighter_gobj, void (*proc_status)(GObj*))
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->input.pl.button_tap & fp->input.button_mask_a)
    {
        if (fp->catch_gobj != NULL)
        {
            if (fp->catch_gobj != NULL) // Now you check twice? Bruh.
            {
                ftKirbySpecialNApplyCaptureDamage(fighter_gobj, fp->catch_gobj, FTKIRBY_VACUUM_THROW_DAMAGE);
            }
            proc_status(fighter_gobj);

            return TRUE;
        }
    }
    return FALSE;
}

// 0x80162534
sb32 ftKirby_SpecialNCopy_CheckGotoCopy(GObj *fighter_gobj, void (*proc_status)(GObj*))
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if ((fp->input.pl.button_tap & fp->input.button_mask_b) || (fp->input.pl.stick_range.y < FTKIRBY_VACUUM_COPY_STICK_RANGE_MIN))
    {
        if (fp->catch_gobj != NULL)
        {
            if (fp->catch_gobj != NULL)
            {
                ftKirbySpecialNApplyCaptureDamage(fighter_gobj, fp->catch_gobj, FTKIRBY_VACUUM_COPY_DAMAGE);
            }
            proc_status(fighter_gobj);

            return TRUE;
        }
    }
    return FALSE;
}

// 0x801625B0
sb32 ftKirby_SpecialNTurn_CheckGotoTurn(GObj *fighter_gobj, void (*proc_status)(GObj*))
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    s32 stick_x = fp->input.pl.stick_range.x;

    if (ABS(stick_x) < FTKIRBY_VACUUM_TURN_STICK_RANGE_MIN) stick_x = 0; // HAL Meme Laboratory

    if (((stick_x < 0) && (fp->lr == LR_Right)) || ((stick_x > 0) && (fp->lr == LR_Left)))
    {
        proc_status(fighter_gobj);

        return TRUE;
    }
    else return FALSE;
}

// 0x80162634
void ftKirby_SpecialNWait_ProcInterrupt(GObj *fighter_gobj)
{
    if ((ftKirby_SpecialNThrow_CheckGotoThrow(fighter_gobj, ftKirby_SpecialNThrow_SetStatus) == FALSE) && (ftKirby_SpecialNCopy_CheckGotoCopy(fighter_gobj, ftKirby_SpecialNCopy_SetStatus) == FALSE))
    {
        ftKirby_SpecialNTurn_CheckGotoTurn(fighter_gobj, ftKirby_SpecialNTurn_SetStatus);
    }
}

// 0x80162684
void ftKirby_SpecialAirNWait_ProcInterrupt(GObj *fighter_gobj)
{
    if (ftKirby_SpecialNThrow_CheckGotoThrow(fighter_gobj, ftKirby_SpecialAirNThrow_SetStatus) == FALSE)
    {
        ftKirby_SpecialNCopy_CheckGotoCopy(fighter_gobj, ftKirby_SpecialAirNCopy_SetStatus);
    }
}

// 0x801626C0
void ftKirby_SpecialAirNWait_ProcPhysics(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    if (fp->is_fast_fall)
    {
        ftPhysics_ApplyFastFall(fp, attributes);
    }
    else ftPhysics_ApplyGClampTVel(fp, FTKIRBY_VACUUM_GRAVITY_MUL * attributes->gravity, FTKIRBY_VACUUM_FALL_MAX_MUL * attributes->fall_speed_max);
    
    if (ftPhysics_CheckClampAirVelXDecMax(fp, attributes) == FALSE)
    {
        ftPhysics_ApplyAirVelXFriction(fp, attributes);
    }
}

// 0x80162750
void ftKirbySpecialNStartProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirbySpecialNStartSwitchStatusAir);
}

// 0x80162774
void ftKirbySpecialNLoopProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirbySpecialNLoopSwitchStatusAir);
}

// 0x80162798
void ftKirbySpecialNEndProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirbySpecialNEndSwitchStatusAir);
}

// 0x801627BC
void ftKirby_SpecialNCatch_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirby_SpecialNCatch_SwitchStatusAir);
}

// 0x801627E0
void ftKirby_SpecialNEat_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirby_SpecialNEat_SwitchStatusAir);
}

// 0x80162804
void ftKirby_SpecialNThrow_ProcMap(GObj *fighter_gobj)
{
    ftMap_CheckGroundBreakEdgeProcMap(fighter_gobj, ftKirby_SpecialNThrow_SwitchStatusAir);
}

// 0x80162828
void ftKirby_SpecialNWait_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirby_SpecialNWait_SwitchStatusAir);
}

// 0x8016184C
void ftKirby_SpecialNTurn_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirby_SpecialNTurn_SwitchStatusAir);
}

// 0x80162870
void ftKirby_SpecialNCopy_ProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftKirby_SpecialNCopy_SwitchStatusAir);
}

// 0x80162894
void ftKirbySpecialAirNStartProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirbySpecialAirNStartSwitchStatusGround);
}

// 0x801628B8
void ftKirbySpecialAirNLoopProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirbySpecialAirNLoopSwitchStatusGround);
}

// 0x801628DC
void ftKirbySpecialAirNEndProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirbySpecialAirNEndSwitchStatusGround);
}

// 0x80162900
void ftKirby_SpecialAirNCatch_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNCatch_SwitchStatusGround);
}

// 0x80162924
void ftKirby_SpecialAirNEat_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNEat_SwitchStatusGround);
}
 
// 0x80162948
void ftKirby_SpecialAirNThrow_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNThrow_SwitchStatusGround);
}

// 0x8016296C
void ftKirby_SpecialAirNWait_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNWait_SwitchStatusGround);
}

// 0x80162990
void ftKirby_SpecialAirNTurn_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNTurn_SwitchStatusGround);
}

// 0x801629B4
void ftKirby_SpecialAirNCopy_ProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterGroundProcMap(fighter_gobj, ftKirby_SpecialAirNCopy_SwitchStatusGround);
}

// 0x801629D8
void ftKirbySpecialAirNStartSwitchStatusGround(GObj *fighter_gobj)
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNStart, fighter_gobj->anim_frame, 1.0F, FTKIRBY_SPECIALNSTART_STATUPDATE_FLAGS);
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
}

// 0x80162A20
void ftKirbySpecialAirNLoopSwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNLoop, fighter_gobj->anim_frame, 1.0F, FTKIRBY_SPECIALNLOOP_STATUPDATE_FLAGS);
    ftKirbySpecialNInitCatchVars(fp);
}

// 0x80162A6C
void ftKirbySpecialAirNEndSwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNEnd, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162ABC
void ftKirbySpecialNStartSwitchStatusAir(GObj *fighter_gobj)
{
    ftMap_SetAir(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNStart, fighter_gobj->anim_frame, 1.0F, FTKIRBY_SPECIALNSTART_STATUPDATE_FLAGS);
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
}

// 0x80162B04
void ftKirbySpecialNLoopSwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNLoop, fighter_gobj->anim_frame, 1.0F, FTKIRBY_SPECIALNLOOP_STATUPDATE_FLAGS);
    ftKirbySpecialNInitCatchVars(fp);
}

// 0x80162B50
void ftKirbySpecialNEndSwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNEnd, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162BA0
void ftKirby_SpecialNEat_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNEat, fighter_gobj->anim_frame, 1.0F, FTSTATUPDATE_GFX_PRESERVE);
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162BF0
void ftKirby_SpecialNCatch_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162C40
void ftKirby_SpecialAirNCatch_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNCatch, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162C90
void ftKirby_SpecialAirNEat_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNEat, fighter_gobj->anim_frame, 1.0F, FTSTATUPDATE_GFX_PRESERVE);
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162CE0
void ftKirby_SpecialNThrow_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNThrow, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162D30
void ftKirby_SpecialAirNThrow_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNThrow, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162D80
void ftKirby_SpecialNWait_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNWait, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162DD0
void ftKirby_SpecialAirNWait_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNWait, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162E20
void ftKirby_SpecialNTurn_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNTurn, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162E70
void ftKirby_SpecialAirNTurn_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNTurn, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162EC0
void ftKirby_SpecialNCopy_SwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNCopy, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162F10
void ftKirby_SpecialAirNCopy_SwitchStatusGround(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetGround(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNCopy, fighter_gobj->anim_frame, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
}

// 0x80162F60
void ftKirby_SpecialNWait_UpdateLR(GObj *fighter_gobj)
{
    ftStruct *kirby_fp = ftGetStruct(fighter_gobj);

    if (kirby_fp->catch_gobj != NULL)
    {
        ftStruct *victim_fp = ftGetStruct(kirby_fp->catch_gobj);

        victim_fp->lr = kirby_fp->lr;
    }
    kirby_fp->lr *= -1.0F; // Why is this a float operation? It gets converted back into signed long...
}

// 0x80162FA8
void ftKirby_SpecialNWait_SetStatusFromTurn(GObj *fighter_gobj)
{
    ftKirby_SpecialNWait_UpdateLR(fighter_gobj);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNWait, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
}

// 0x80162FE0
void ftKirby_SpecialAirNWait_SetStatusFromTurn(GObj *fighter_gobj)
{
    ftKirby_SpecialNWait_UpdateLR(fighter_gobj);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNWait, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
}

Vec3f ftKirbySpecialNUnusedVec = { 0.0F, 0.0F, 0.0F };

void ftKirby_SpecialNEat_SetStatusParam(GObj *fighter_gobj, s32 status_id)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    Vec3f pos = ftKirbySpecialNUnusedVec; // Never used???

    ftMainSetFighterStatus(fighter_gobj, status_id, 0.0F, 1.0F, FTSTATUPDATE_SLOPECONTOUR_PRESERVE);
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);

    if (fp->proc_slope != NULL)
    {
        fp->proc_slope(fighter_gobj);
    }
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801630A0
void ftKirby_SpecialNCatchEat_SetStatusParam(GObj *fighter_gobj, s32 status_id)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    Vec3f pos;

    ftMainSetFighterStatus(fighter_gobj, status_id, 0.0F, 1.0F, (FTSTATUPDATE_LOOPSFX_PRESERVE | FTSTATUPDATE_SLOPECONTOUR_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);

    fp->catch_gobj = fp->search_gobj;

    fp->x192_flag_b3 = FALSE;

    if (fp->proc_slope != NULL)
    {
        fp->proc_slope(fighter_gobj);
    }
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftKirbySpecialNAddCaptureDistance(fp, fighter_gobj, &pos);

    fp->status_vars.kirby.specialn.dist.x = DObjGetStruct(fp->catch_gobj)->translate.vec.f.x - pos.x;
    fp->status_vars.kirby.specialn.dist.y = DObjGetStruct(fp->catch_gobj)->translate.vec.f.y - pos.y;
}

// 0x80163154
void ftKirbySpecialNStartSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNStart, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftKirbySpecialNInitStatusVars(fighter_gobj, FALSE);
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801631A0
void ftKirbySpecialNLoopSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNLoop, 0.0F, 1.0F, (FTSTATUPDATE_LOOPSFX_PRESERVE | FTSTATUPDATE_SLOPECONTOUR_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801630A0
void ftKirby_SpecialNCatch_ProcCatch(GObj *fighter_gobj)
{
    ftKirby_SpecialNCatchEat_SetStatusParam(fighter_gobj, ftStatus_Kirby_SpecialNCatch);
}

// 0x80163204
void ftKirby_SpecialNEat_SetStatus(GObj *fighter_gobj)
{
    ftKirby_SpecialNEat_SetStatusParam(fighter_gobj, ftStatus_Kirby_SpecialNEat);
}

// 0x80163224
void ftKirby_SpecialNThrow_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNThrow, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163274
void ftKirby_SpecialNWait_SetStatusFromEat(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNWait, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801632C4
void ftKirby_SpecialNTurn_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNTurn, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163314
void ftKirby_SpecialNCopy_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNCopy, 0.0F, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163364
void ftKirbySpecialNEndSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialNEnd, 0.0F, 1.0F, FTSTATUPDATE_GFX_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801633A0
void ftKirbySpecialAirNStartSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNStart, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftKirbySpecialNInitStatusVars(fighter_gobj, TRUE);
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801633EC
void ftKirbySpecialAirNLoopSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNLoop, 0.0F, 1.0F, (FTSTATUPDATE_LOOPSFX_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftKirbySpecialNGotoInitCatchVars(fighter_gobj);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163430
void ftKirby_SpecialAirNCatch_ProcCatch(GObj *fighter_gobj)
{
    ftKirby_SpecialNCatchEat_SetStatusParam(fighter_gobj, ftStatus_Kirby_SpecialAirNCatch);
}

// 0x80163450
void ftKirby_SpecialAirNEat_SetStatus(GObj *fighter_gobj)
{
    ftKirby_SpecialNCatchEat_SetStatusParam(fighter_gobj, ftStatus_Kirby_SpecialAirNEat);
}

// 0x80163470
void ftKirby_SpecialAirNThrow_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNThrow, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801634C0
void ftKirby_SpecialAirNWait_SetStatusFromEat(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNWait, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163510
void ftKirby_SpecialAirNTurn_SetStatus(GObj *fighter_gobj) // Unused
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNTurn, 0.0F, 1.0F, (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80163560
void ftKirby_SpecialAirNCopy_SetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNCopy, 0.0F, 1.0F, (FTSTATUPDATE_MODELPART_PRESERVE | FTSTATUPDATE_GFX_PRESERVE));
    ftSetCaptureIgnoreMask(fp, FTCATCHKIND_MASK_ALL);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801635B0
void ftKirbySpecialAirNEndSetStatus(GObj *fighter_gobj)
{
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Kirby_SpecialAirNEnd, 0.0F, 1.0F, FTSTATUPDATE_GFX_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801635EC
void ftKirbySpecialNLoseCopy(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftKirbySpecialNInitFighterVars(fp);
    efParticle_LoseKirbyStar_MakeEffect(fighter_gobj);
    func_800269C0(alSound_SFX_KirbySpecialNLoseCopy);

    fp->fighter_vars.kirby.copy_id = Ft_Kind_Kirby;

    ftCommon_SetModelPartRenderStateIndex(fighter_gobj, 6, 0);
    ftCommon_ResetColAnimStatUpdate(fighter_gobj);
}

// 0x80163648
void ftKirbySpecialNDamageCheckLoseCopy(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if 
    (
        (
            (fp->ft_kind == Ft_Kind_Kirby)    ||
            (fp->ft_kind == Ft_Kind_PolyKirby)
        )                                                       &&
        (fp->fighter_vars.kirby.copy_id != Ft_Kind_Kirby)       &&
        (fp->fighter_vars.kirby.is_ignore_losecopy == FALSE)    &&
        (lbRandom_GetFloat() < FTKIRBY_COPYDAMAGE_LOSECOPY_RANDOM)
    )
    {
        ftKirbySpecialNLoseCopy(fighter_gobj);
    }
}