#ifndef _FTCAPTAIN_H_
#define _FTCAPTAIN_H_

#include <ft/fttypes.h>

#include "ftcaptain_functions.h"

#define FTCAPTAIN_FALCONPUNCH_VEL_BASE 65.0F
#define FTCAPTAIN_FALCONPUNCH_VEL_MUL 0.92

#define FTCAPTAIN_FALCONDIVE_UNK_TIMER 15
#define FTCAPTAIN_FALCONDIVE_TURN_STICK_RANGE_MIN 18
#define FTCAPTAIN_FALCONDIVE_FALLSPECIAL_DRIFT 0.72F
#define FTCAPTAIN_FALCONDIVE_AIR_ACCEL_MUL 1.1F
#define FTCAPTAIN_FALCONDIVE_AIR_SPEED_MAX_MUL 0.8F
#define FTCAPTAIN_FALCONDIVE_LANDING_LAG 0.65F

#define FTCAPTAIN_FALCONKICK_VEL_SCALE_APPLY_TIME 6
#define FTCAPTAIN_FALCONKICK_VEL_SCALE_DIV 2.0F

extern ftStatusDesc dFTCaptainSpecialStatusDesc[/* */];

extern void *gFTDataCaptainMain;
extern void *gFTDataCaptainBattleMotion;
extern void *gFTDataCaptainModel;
extern void *gFTDataCaptainSpecial2;
extern void *gFTDataCaptainSpecial3;
extern u32 gFTDataCaptainParticleBankID;

extern void *gFTDataPolyCaptainMain;
extern void *gFTDataPolyCaptainSubMotion;
extern void *gFTDataPolyCaptainModel;
extern u32 gFTDataPolyCaptainParticleBankID;

typedef enum ftCaptainMotion
{
    ftMotion_Captain_Attack13 = ftMotion_Common_SpecialStart,
    ftMotion_Captain_Attack100Start,
    ftMotion_Captain_Attack100Loop,
    ftMotion_Captain_Attack100End,
    ftMotion_Captain_AppearRStart,
    ftMotion_Captain_AppearLStart,
    ftMotion_Captain_AppearREnd,
    ftMotion_Captain_AppearLEnd,
    ftMotion_Captain_SpecialN,
    ftMotion_Captain_SpecialAirN,
    ftMotion_Captain_SpecialLw,                                 // Grounded Falcon Kick
    ftMotion_Captain_SpecialLwAir,                              // Grounded -> aerial Falcon Kick
    ftMotion_Captain_SpecialLwLanding,                          // Landing from aerial Falcon Kick                             
    ftMotion_Captain_SpecialAirLw,                              // Aerial Falcon Kick
    ftMotion_Captain_SpecialLwBound,                            // Wall collision from Falcon Kick
    ftMotion_Captain_SpecialHi,
    ftMotion_Captain_SpecialHiCatch,
    ftMotion_Captain_SpecialHiThrow,
    ftMotion_Captain_SpecialAirHi

} ftCaptainMotion;

typedef enum ftCaptainStatus
{
    ftStatus_Captain_Attack13 = ftStatus_Common_SpecialStart,
    ftStatus_Captain_Attack100Start,
    ftStatus_Captain_Attack100Loop,
    ftStatus_Captain_Attack100End,
    ftStatus_Captain_AppearRStart,
    ftStatus_Captain_AppearLStart,
    ftStatus_Captain_AppearREnd,
    ftStatus_Captain_AppearLEnd,
    ftStatus_Captain_SpecialN,
    ftStatus_Captain_SpecialAirN,
    ftStatus_Captain_SpecialLw,                                 // Grounded Falcon Kick
    ftStatus_Captain_SpecialLwAir,                              // Grounded -> aerial Falcon Kick
    ftStatus_Captain_SpecialLwLanding,                          // Landing from aerial Falcon Kick                             
    ftStatus_Captain_SpecialAirLw,                              // Aerial Falcon Kick
    ftStatus_Captain_SpecialLwBound,                            // Wall collision from Falcon Kick
    ftStatus_Captain_SpecialHi,
    ftStatus_Captain_SpecialHiCatch,
    ftStatus_Captain_SpecialHiThrow,
    ftStatus_Captain_SpecialAirHi

} ftCaptainStatus;

typedef struct ftCaptain_FighterVars
{
    s32 falcon_punch_unk;

} ftCaptain_FighterVars;

typedef struct ftCaptainSpecialHiStatusVars
{
    u16 flags;
    Vec3f vel;

} ftCaptainSpecialHiStatusVars;

typedef struct ftCaptainSpecialLwStatusVars
{
    u16 scale_apply_timer;
    f32 vel_scale;

} ftCaptainSpecialLwStatusVars;

typedef union ftCaptain_StatusVars
{
    ftCaptainSpecialHiStatusVars specialhi;
    ftCaptainSpecialLwStatusVars speciallw;

} ftCaptain_StatusVars;

#endif