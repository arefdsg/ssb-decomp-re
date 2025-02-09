#ifndef _FTYOSHI_STATUS_INC_C_
#define _FTYOSHI_STATUS_INC_C_

#include <ft/fttypes.h>

// 0x8012AEF8
ftStatusDesc dFTYoshiSpecialStatusDesc[/* */] =
{
	// Status 220 (0xDC): AppearR
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_AppearR,					// Script ID
		ftMotion_AttackIndex_None,				// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_None,				// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftCommon_Appear_ProcUpdate,				// Proc Update
		NULL,									// Proc Interrupt
		ftCommon_Appear_ProcPhysics,			// Proc Physics
		ftMap_UpdateProjectGroundID				// Proc Map
	},

	// Status 221 (0xDD): AppearL
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_AppearL,					// Script ID
		ftMotion_AttackIndex_None,				// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_None,				// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftCommon_Appear_ProcUpdate,				// Proc Update
		NULL,									// Proc Interrupt
		ftCommon_Appear_ProcPhysics,			// Proc Physics
		ftMap_UpdateProjectGroundID				// Proc Map
	},

	// Status 222 (0xDE): SpecialHi
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialHi,				// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		TRUE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshiSpecialHiProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftYoshiSpecialHiProcPhysics,			// Proc Physics
		ftYoshiSpecialHiProcMap				// Proc Map
	},

	// Status 223 (0xDF): SpecialAirHi
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialAirHi,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		TRUE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshiSpecialAirHiProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftYoshiSpecialAirHiProcPhysics,		// Proc Physics
		ftYoshiSpecialAirHiProcMap			// Proc Map
	},

	// Status 224 (0xE0): SpecialLwStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialLwStart,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshiSpecialLwStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelTransNAll,			// Proc Physics
		ftYoshiSpecialLwStartProcMap			// Proc Map
	},

	// Status 225 (0xE1): SpecialLwLanding
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialLwLanding,		// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshiSpecialLwLandingProcUpdate,	// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundBreakSetFall			// Proc Map
	},

	// Status 226 (0xE2): SpecialAirLwStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialAirLwStart,		// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshiSpecialLwStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelTransNAll,			// Proc Physics
		ftYoshiSpecialLwStartProcMap			// Proc Map
	},

	// Status 227 (0xE3): SpecialAirLwLoop
	{
		/////////////////////////// Motion Info ////////////////////////////////
		-1,										// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		NULL,									// Proc Update
		NULL,									// Proc Interrupt
		ftYoshiSpecialAirLwLoopProcPhysics,	// Proc Physics
		ftYoshiSpecialAirLwLoopProcMap		// Proc Map
	},

	// Status 228 (0xE4): SpecialN
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialN,				// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftStatus_IfAnimEnd_SetStatusWait,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftYoshiSpecialNProcMap				// Proc Map
	},

	// Status 229 (0xE5): SpecialNCatch
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialNCatch,			// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshi_SpecialNCatch_ProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftYoshi_SpecialNCatch_ProcMap			// Proc Map
	},

	// Status 230 (0xE6): SpecialNRelease
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialNRelease,			// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshi_SpecialNRelease_ProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftYoshi_SpecialNRelease_ProcMap			// Proc Map
	},

	// Status 231 (0xE7): SpecialAirN
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialAirN,				// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftStatus_IfAnimEnd_SetStatusFall,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelFriction,			// Proc Physics
		ftYoshiSpecialAirNProcMap				// Proc Map
	},

	// Status 232 (0xE8): SpecialAirNCatch
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialAirNCatch,		// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshi_SpecialAirNCatch_ProcUpdate,	// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelFriction,			// Proc Physics
		ftYoshi_SpecialAirNCatch_ProcMap		// Proc Map
	},

	// Status 233 (0xE9): SpecialAirNRelease
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Yoshi_SpecialAirNRelease,		// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftYoshi_SpecialAirNRelease_ProcUpdate,	// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelFriction,			// Proc Physics
		ftYoshi_SpecialAirNRelease_ProcMap		// Proc Map
	}
};

#endif