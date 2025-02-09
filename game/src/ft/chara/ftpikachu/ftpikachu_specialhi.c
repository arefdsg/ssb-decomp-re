#include <ft/fighter.h>

#define FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS (FTSTATUPDATE_TEXTUREPART_PRESERVE | FTSTATUPDATE_HITSTATUS_PRESERVE | FTSTATUPDATE_COLANIM_PRESERVE)

// 0x801527B0
void ftPikachuSpecialHiStartProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.anim_frames--;

    if (fp->status_vars.pikachu.specialhi.anim_frames == 0)
    {
        ftPikachuSpecialHiSetStatus(fighter_gobj);
    }
}

// 0x801527E4
void ftPikachuSpecialAirHiStartProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.anim_frames--;

    if (fp->status_vars.pikachu.specialhi.anim_frames == 0)
    {
        ftPikachuSpecialAirHiSetStatus(fighter_gobj);
    }
}

// 0x80152818
void ftPikachuSpecialAirHiStartProcPhysics(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    ftAttributes *attributes = fp->attributes;

    ftPhysics_ApplyGClampTVel(fp, 0.8F, attributes->fall_speed_max);

    if (ftPhysics_CheckClampAirVelXDecMax(fp, attributes) == FALSE)
    {
        ftPhysics_ApplyAirVelXFriction(fp, attributes);
    }
}

// 0x8015286C
void ftPikachuSpecialHiStartProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftPikachuSpecialHiStartSwitchStatusAir);
}

// 0x80152890
void ftPikachuSpecialAirHiStartProcMap(GObj *fighter_gobj)
{
    mpObjectProc_ProcFighterCliffProcMap(fighter_gobj, ftPikachuSpecialAirHiStartSwitchStatusGround);
}

// 0x801528B4
void ftPikachuSpecialAirHiStartSwitchStatusGround(GObj *fighter_gobj)
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHiStart, fighter_gobj->anim_frame, 0.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);
}

// 0x801528F4
void ftPikachuSpecialHiStartSwitchStatusAir(GObj *fighter_gobj)
{
    ftMap_SetAir(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHiStart, fighter_gobj->anim_frame, 0.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);
}

// 0x80152934
void ftPikachuSpecialHiStartInitStatusVars(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->command_vars.flags.flag1 = 0;

    fp->status_vars.pikachu.specialhi.anim_frames = FTPIKACHU_QUICKATTACK_START_TIME;
    fp->status_vars.pikachu.specialhi.is_subsequent_zip = FALSE;
    fp->status_vars.pikachu.specialhi.pass_timer = 0;
    
    fp->phys_info.vel_air.x = fp->phys_info.vel_air.y = fp->phys_info.vel_ground.x = 0.0F;
}

// 0x80152960 - Set hit collision, color animation and anim rate
void ftPikachuSpecialHiInitMiscVars(GObj *fighter_gobj)
{
    ftCollision_SetHitStatusAll(fighter_gobj, gmHitCollision_HitStatus_Intangible); // Set hit status

    ftColor_CheckSetColAnimIndex(fighter_gobj, FTPIKACHU_QUICKATTACK_COLANIM_ID, FTPIKACHU_QUICKATTACK_COLANIM_LENGTH); // Apply color animation

    gcSetDObjAnimPlaybackRate(fighter_gobj, 0.0F); // Set animation speed (0.0F = freeze)
}

// 0x801529A0
void ftPikachuSpecialHiStartSetStatus(GObj *fighter_gobj)
{
    ftPikachuSpecialHiStartInitStatusVars(fighter_gobj);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHiStart, 0.0F, 0.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftPikachuSpecialHiInitMiscVars(fighter_gobj);
}

// 0x801529EC
void ftPikachuSpecialAirHiStartSetStatus(GObj *fighter_gobj)
{
    ftPikachuSpecialHiStartInitStatusVars(fighter_gobj);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHiStart, 0.0F, 0.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
    ftPikachuSpecialHiInitMiscVars(fighter_gobj);
}

// 0x80152A38
void ftPikachuSpecialHiProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.anim_frames--;

    if (fp->status_vars.pikachu.specialhi.anim_frames <= 0) // NOW you're checking if less than too?
    {
        ftPikachuSpecialHiEndSetStatus(fighter_gobj);
    }
}

// 0x80152A6C
void ftPikachuSpecialAirHiProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.anim_frames--;

    if (fp->status_vars.pikachu.specialhi.anim_frames <= 0) // NOW you're checking if less than too?
    {
        ftPikachuSpecialAirHiEndSetStatus(fighter_gobj);
    }
}

// 0x80152AA0
void ftPikachuSpecialHiUpdateModelRollScale(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->joint[FTPIKACHU_QUICKATTACK_BASE_JOINT]->rotate.vec.f.x = (atan2f(fp->phys_info.vel_air.x, fp->phys_info.vel_air.y) * fp->lr) - F_DEG_TO_RAD(90.0F); // HALF_PI32

    fp->joint[FTPIKACHU_QUICKATTACK_BASE_JOINT]->scale.vec.f.x = FTPIKACHU_QUICKATTACK_SCALE_X;
    fp->joint[FTPIKACHU_QUICKATTACK_BASE_JOINT]->scale.vec.f.y = FTPIKACHU_QUICKATTACK_SCALE_Y;
    fp->joint[FTPIKACHU_QUICKATTACK_BASE_JOINT]->scale.vec.f.z = FTPIKACHU_QUICKATTACK_SCALE_Z;

    func_ovl2_800EB528(fp->joint[FTPIKACHU_QUICKATTACK_BASE_JOINT]);
}

// 0x80152B24
void ftPikachuSpecialHiProcPhysics(GObj *fighter_gobj)
{
    ftPhysics_ApplyGroundVelTransferAir(fighter_gobj);
    ftPikachuSpecialHiUpdateModelRollScale(fighter_gobj);
}

// 0x80152B4C
void ftPikachuSpecialAirHiProcPhysics(GObj *fighter_gobj)
{
    ftPikachuSpecialHiUpdateModelRollScale(fighter_gobj);
}

// 0x80152B6C
void ftPikachuSpecialHiProcMap(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (ftMap_CheckGroundStanding(fighter_gobj) == FALSE)
    {
        if (fp->coll_data.coll_mask_curr & (MPCOLL_KIND_RWALL | MPCOLL_KIND_LWALL))
        {
            ftMap_SetAir(fp);
            ftPikachuSpecialAirHiEndSetStatus(fighter_gobj);
        }
        else ftPikachuSpecialHiSwitchStatusAir(fighter_gobj);
    }
    else if (fp->coll_data.coll_mask_curr & (MPCOLL_KIND_RWALL | MPCOLL_KIND_LWALL))
    {
        ftPikachuSpecialHiEndSetStatus(fighter_gobj);
    }
}

// 0x80152BF4
sb32 ftPikachuSpecialHiCheckIgnorePass(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (!(fp->coll_data.ground_flags & MPCOLL_VERTEX_CLL_PASS) || (fp->status_vars.pikachu.specialhi.pass_timer >= FTPIKACHU_QUICKATTACK_PASS_BUFFER_MAX))
    {
        return TRUE;
    }
    else return FALSE;
}

// 0x80152C2C
void ftPikachuSpecialAirHiProcMap(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.pass_timer++;

    if (mpObjectProc_ProcFighterPassCliff(fighter_gobj, ftPikachuSpecialHiCheckIgnorePass) != FALSE)
    {
        if (fp->coll_data.coll_mask_stat & MPCOLL_KIND_CLIFF_MASK)
        {
            ftCommon_CliffCatch_SetStatus(fighter_gobj);

        }
        else if (FTPIKACHU_QUICKATTACK_HALT_ANGLE < lbVector_Vec3fAngleDiff(&fp->coll_data.ground_angle, &fp->phys_info.vel_air))
        {
            ftMap_SetGround(fp);
            ftPikachuSpecialHiEndSetStatus(fighter_gobj);
        }
        else ftPikachuSpecialAirHiSwitchStatusGround(fighter_gobj);
    }
    else
    {
        if ((fp->coll_data.coll_mask_curr & MPCOLL_KIND_CEIL) && (FTPIKACHU_QUICKATTACK_HALT_ANGLE < lbVector_Vec3fAngleDiff(&fp->coll_data.ceil_angle, &fp->phys_info.vel_air)))
        {
            ftPikachuSpecialAirHiEndSetStatus(fighter_gobj);
        }
        if ((fp->coll_data.coll_mask_curr & MPCOLL_KIND_LWALL) && (FTPIKACHU_QUICKATTACK_HALT_ANGLE < lbVector_Vec3fAngleDiff(&fp->coll_data.lwall_angle, &fp->phys_info.vel_air)))
        {
            ftPikachuSpecialAirHiEndSetStatus(fighter_gobj);
        }
        if ((fp->coll_data.coll_mask_curr & MPCOLL_KIND_RWALL) && (FTPIKACHU_QUICKATTACK_HALT_ANGLE < lbVector_Vec3fAngleDiff(&fp->coll_data.rwall_angle, &fp->phys_info.vel_air)))
        {
            ftPikachuSpecialAirHiEndSetStatus(fighter_gobj);
        }
    }
}

// 0x80152D98
void ftPikachuSpecialAirHiSwitchStatusGround(GObj *fighter_gobj)
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHi, fighter_gobj->anim_frame, 0.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);
}

// 0x80152DD8
void ftPikachuSpecialHiSwitchStatusAir(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftMap_SetAir(fp);
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHi, fighter_gobj->anim_frame, 0.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);

    fp->jumps_used = fp->attributes->jumps_max;
}

// 0x80152E2C
void ftPikachuSpecialHiInitStatusVarsZip(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.anim_frames = FTPIKACHU_QUICKATTACK_ZIP_TIME;
    fp->jumps_used = fp->attributes->jumps_max;
}

// 0x80152E48
void ftPikachuSpecialHiSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    f32 sqrt_stick_range;
    f32 temp_stick_x;
    Vec3f stick_range;
    f32 temp_stick_y;

    temp_stick_x = fp->input.pl.stick_range.x;
    temp_stick_y = fp->input.pl.stick_range.y;

    sqrt_stick_range = sqrtf(SQUARE(temp_stick_x) + SQUARE(temp_stick_y));

    if (sqrt_stick_range > F_CONTROLLER_RANGE_MAX)
    {
        sqrt_stick_range = F_CONTROLLER_RANGE_MAX;
    }
    if (!(sqrt_stick_range < FTPIKACHU_QUICKATTACK_STICK_RANGE_MIN) && !(fp->coll_data.ground_flags & MPCOLL_VERTEX_CLL_PASS))
    {
        stick_range.x = fp->input.pl.stick_range.x;
        stick_range.y = fp->input.pl.stick_range.y;
        stick_range.z = 0.0F;

        if (lbVector_Vec3fAngleDiff(&fp->coll_data.ground_angle, &stick_range) < F_DEG_TO_RAD(90.0F)) goto block_end; /* HALF_PI32 */

        fp->status_vars.pikachu.specialhi.stick_range.x = stick_range.x;
        fp->status_vars.pikachu.specialhi.stick_range.y = stick_range.y;

        ftCommon_StickInputSetLR(fp);
        ftPikachuSpecialHiInitStatusVarsZip(fighter_gobj);

        fp->phys_info.vel_ground.x = (FTPIKACHU_QUICKATTACK_VEL_BASE * sqrt_stick_range) + FTPIKACHU_QUICKATTACK_VEL_ADD;

        if (fp->status_vars.pikachu.specialhi.is_subsequent_zip != FALSE)
        {
            fp->phys_info.vel_ground.x *= FTPIKACHU_QUICKATTACK_VEL_MUL;
        }
        ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHi, 0.0F, 0.0F, FTSTATUPDATE_NONE_PRESERVE);
        ftMainUpdateAnimCheckInterrupt(fighter_gobj);

        return;
    }
block_end:
    ftMap_SetAir(fp);

    ftPikachuSpecialAirHiSetStatus(fighter_gobj);
}

// 0x80152FEC
void ftPikachuSpecialAirHiSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    f32 tangent;
    f32 sqrt_stick_range = sqrtf(SQUARE((f32)fp->input.pl.stick_range.x) + SQUARE((f32)fp->input.pl.stick_range.y));

    if (sqrt_stick_range > F_CONTROLLER_RANGE_MAX)
    {
        sqrt_stick_range = F_CONTROLLER_RANGE_MAX;
    }
    ftCommon_StickInputSetLR(fp);

    if (sqrt_stick_range > FTPIKACHU_QUICKATTACK_STICK_RANGE_MIN)
    {
        tangent = atan2f(fp->input.pl.stick_range.y, fp->input.pl.stick_range.x * fp->lr);

        fp->status_vars.pikachu.specialhi.stick_range.x = fp->input.pl.stick_range.x;
        fp->status_vars.pikachu.specialhi.stick_range.y = fp->input.pl.stick_range.y;
    }
    else
    {
        tangent = 0.9F;
        sqrt_stick_range = F_CONTROLLER_RANGE_MAX;

        fp->status_vars.pikachu.specialhi.stick_range.x = 0;
        fp->status_vars.pikachu.specialhi.stick_range.y = I_CONTROLLER_RANGE_MAX;
    }

    ftPikachuSpecialHiInitStatusVarsZip(fighter_gobj);

    fp->phys_info.vel_air.x = cosf(tangent) * ((FTPIKACHU_QUICKATTACK_VEL_BASE * sqrt_stick_range) + FTPIKACHU_QUICKATTACK_VEL_ADD) * fp->lr;

    fp->phys_info.vel_air.y = __sinf(tangent) * ((FTPIKACHU_QUICKATTACK_VEL_BASE * sqrt_stick_range) + FTPIKACHU_QUICKATTACK_VEL_ADD);

    if (fp->status_vars.pikachu.specialhi.is_subsequent_zip != FALSE)
    {
        fp->phys_info.vel_air.x *= FTPIKACHU_QUICKATTACK_VEL_MUL;
        fp->phys_info.vel_air.y *= FTPIKACHU_QUICKATTACK_VEL_MUL;
    }
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHi, 0.0F, 0.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x801531AC
sb32 ftPikachuSpecialHiCheckGotoSubZip(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);
    Vec3f current_angle;
    Vec3f previous_angle;
    f32 unused[2];
    f32 temp_stick_x;
    f32 temp_stick_y;

    temp_stick_x = (f32)fp->input.pl.stick_range.x;
    temp_stick_y = (f32)fp->input.pl.stick_range.y;

    if (sqrtf((temp_stick_x * temp_stick_x) + (temp_stick_y * temp_stick_y)) < FTPIKACHU_QUICKATTACK_STICK_RANGE_MIN)
    {
        return FALSE;
    }
    else if (fp->status_vars.pikachu.specialhi.is_subsequent_zip == FALSE)
    {
        current_angle.x = fp->input.pl.stick_range.x;
        current_angle.y = fp->input.pl.stick_range.y;
        current_angle.z = 0.0F;

        previous_angle.x = fp->status_vars.pikachu.specialhi.stick_range.x;
        previous_angle.y = fp->status_vars.pikachu.specialhi.stick_range.y;
        previous_angle.z = 0.0F;

        if (FTPIKACHU_QUICKATTACK_ANGLE_DIFF_MIN < lbVector_Vec3fAngleDiff(&previous_angle, &current_angle))
        {
            return TRUE;
        }
        else return FALSE;
    }
    else return FALSE;
}

// 0x801532B8
void ftPikachuSpecialHiEndProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->command_vars.flags.flag1 == 1)
    {
        if (ftPikachuSpecialHiCheckGotoSubZip(fighter_gobj) != FALSE)
        {
            fp->command_vars.flags.flag1 = 0;

            fp->status_vars.pikachu.specialhi.is_subsequent_zip = TRUE;

            ftPikachuSpecialHiSetStatus(fighter_gobj);
        }
        else fp->command_vars.flags.flag1 = 2;
    }
    else if (fighter_gobj->anim_frame <= 0.0F)
    {
        ftCommon_Wait_SetStatus(fighter_gobj);
    }
}

// 0x80153340
void ftPikachuSpecialAirHiEndProcUpdate(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->command_vars.flags.flag1 == 1)
    {
        if (ftPikachuSpecialHiCheckGotoSubZip(fighter_gobj) != FALSE)
        {
            fp->command_vars.flags.flag1 = 0;
            fp->status_vars.pikachu.specialhi.is_subsequent_zip = TRUE;

            ftPikachuSpecialAirHiSetStatus(fighter_gobj);
        }
        else fp->command_vars.flags.flag1 = 2;
    }
    else if (fighter_gobj->anim_frame <= 0.0F)
    {
        ftCommon_FallSpecial_SetStatus(fighter_gobj, FTPIKACHU_QUICKATTACK_FALLSPECIAL_DRIFT, FALSE, TRUE, TRUE, FTPIKACHU_QUICKATTACK_LANDING_LAG, FALSE);
    }
}

// 0x801533E4
void ftPikachuSpecialHiEndProcPhysics(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->command_vars.flags.flag1 != 0)
    {
        ftPhysics_ApplyGroundVelFriction(fighter_gobj);
    }
}

// 0x80153414
void ftPikachuSpecialAirHiEndProcPhysics(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (fp->command_vars.flags.flag1 != 0)
    {
        ftAttributes *attributes;

        ftPhysics_ApplyGravityDefault(fp, fp->attributes);

        attributes = fp->attributes;

        ftPhysics_ClampAirVelXStickRange(fp, FTPHYSICS_AIRDRIFT_CLAMP_RANGE_MIN, attributes->aerial_acceleration * FTPIKACHU_QUICKATTACK_AIR_ACCEL_MUL, attributes->aerial_speed_max_x * FTPIKACHU_QUICKATTACK_AIR_SPEED_MUL);
       
        ftPhysics_ApplyAirVelXFriction(fp, fp->attributes);
    }
    else
    {
        fp->phys_info.vel_air.y -= (fp->phys_info.vel_air.y / FTPIKACHU_QUICKATTACK_VEL_Y_DIV);

        ftPhysics_ApplyAirVelXFriction(fp, fp->attributes);
    }
}

// 0x801534BC
void ftPikachuSpecialHiEndProcMap(GObj *fighter_gobj)
{
    ftMap_ProcFighterAirProcMap(fighter_gobj, ftPikachuSpecialHiEndSwitchStatusAir);
}

// 0x801534E0
void ftPikachuSpecialAirHiEndProcMap(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    if (mpObjectProc_ProcFighterCliff(fighter_gobj) != FALSE)
    {
        if (fp->coll_data.coll_mask_stat & MPCOLL_KIND_CLIFF_MASK)
        {
            ftCommon_CliffCatch_SetStatus(fighter_gobj);
        }
        else ftCommon_LandingFallSpecial_SetStatus(fighter_gobj, FALSE, FTPIKACHU_QUICKATTACK_LANDING_LAG);
    }
}

// 0x80153544
void ftPikachuSpecialAirHiEndSwitchStatusGround(GObj *fighter_gobj) // Unused
{
    ftMap_SetGround(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHiEnd, fighter_gobj->anim_frame, 1.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);
}

// 0x80153584
void ftPikachuSpecialHiEndSwitchStatusAir(GObj *fighter_gobj)
{
    ftMap_SetAir(ftGetStruct(fighter_gobj));
    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHiEnd, fighter_gobj->anim_frame, 1.0F, FTPIKACHU_SPECIALHI_STATUPDATE_FLAGS);
}

// 0x801535C4
void ftPikachuSpecialHiEndBackupVel(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    fp->status_vars.pikachu.specialhi.vel_x_bak = fp->phys_info.vel_air.x;
    fp->status_vars.pikachu.specialhi.vel_y_bak = fp->phys_info.vel_air.y;
    fp->status_vars.pikachu.specialhi.vel_ground_bak = fp->phys_info.vel_ground.x;

    fp->phys_info.vel_air.x = fp->phys_info.vel_air.y = 0.0F;
    fp->phys_info.vel_ground.x = 0.0F;
}

// 0x801535F4
void ftPikachuSpecialHiEndSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftPikachuSpecialHiEndBackupVel(fighter_gobj);

    fp->phys_info.vel_ground.x = fp->status_vars.pikachu.specialhi.vel_ground_bak * FTPIKACHU_QUICKATTACK_VEL_BAK_MUL;

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialHiEnd, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}

// 0x80153654
void ftPikachuSpecialAirHiEndSetStatus(GObj *fighter_gobj)
{
    ftStruct *fp = ftGetStruct(fighter_gobj);

    ftPikachuSpecialHiEndBackupVel(fighter_gobj);

    fp->phys_info.vel_air.x = fp->status_vars.pikachu.specialhi.vel_x_bak * FTPIKACHU_QUICKATTACK_VEL_BAK_MUL;
    fp->phys_info.vel_air.y = fp->status_vars.pikachu.specialhi.vel_y_bak * FTPIKACHU_QUICKATTACK_VEL_BAK_MUL;

    ftMainSetFighterStatus(fighter_gobj, ftStatus_Pikachu_SpecialAirHiEnd, 0.0F, 1.0F, FTSTATUPDATE_NONE_PRESERVE);
    ftMainUpdateAnimCheckInterrupt(fighter_gobj);
}
