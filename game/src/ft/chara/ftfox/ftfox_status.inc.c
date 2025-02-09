#ifndef _FTFOX_STATUS_INC_C_
#define _FTFOX_STATUS_INC_C_

#include <ft/fttypes.h>

// 0x8012A214
ftStatusDesc dFTFoxSpecialStatusDesc[/* */] =
{
	// Status 220 (0xDC): Attack100Start
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_Attack100Start,			// Script ID
		ftMotion_AttackIndex_Attack100,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_Attack100,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftCommon_Attack100Start_ProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,	    // Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 221 (0xDD): Attack100Loop
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_Attack100Loop,				// Script ID
		ftMotion_AttackIndex_Attack100,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_Attack100,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftCommon_Attack100Loop_ProcUpdate,		// Proc Update
		ftCommon_Attack100Loop_ProcInterrupt,	// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,	    // Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 222 (0xDE): Attack100End
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_Attack100End,				// Script ID
		ftMotion_AttackIndex_Attack100,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_Attack100,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftStatus_IfAnimEnd_SetStatusWait,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,	    // Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 223 (0xDF): AppearR
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_AppearR,					// Script ID
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

	// Status 224 (0xE0): AppearL
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_AppearL,					// Script ID
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

	// Status 225 (0xE1): SpecialN
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialN,					// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		TRUE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialNProcUpdate,				// Proc Update
		ftFoxSpecialNProcInterrupt,			// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 226 (0xE2): SpecialAirN
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirN,				// Script ID
		ftMotion_AttackIndex_SpecialN,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		TRUE,									// Is projectile?
		ftStatus_AttackIndex_SpecialN,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialNProcUpdate,				// Proc Update
		ftFoxSpecialNProcInterrupt,			// Proc Interrupt
		ftPhysics_ApplyAirVelDrift,				// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	},

	// Status 227 (0xE3): SpecialHiStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialHiStart,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialHiStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftFoxSpecialHiStartProcMap			// Proc Map
	},

	// Status 228 (0xE4): SpecialAirHiStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirHiStart,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialAirHiStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirHiStartProcPhysics,	// Proc Physics
		ftFoxSpecialAirHiStartProcMap			// Proc Map
	},

	// Status 229 (0xE5): SpecialHiHold
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialHiHold,				// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialHiHoldProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftFoxSpecialHiHoldProcMap				// Proc Map
	},

	// Status 230 (0xE6): SpecialAirHiHold
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirHiHold,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialHiHoldProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirHiStartProcPhysics,	// Proc Physics
		ftFoxSpecialAirHiHoldProcMap			// Proc Map
	},

	// Status 231 (0xE7): SpecialHi
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialHi,					// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialHiProcUpdate,				// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialHiProcPhysics,			// Proc Physics
		ftFoxSpecialHiProcMap					// Proc Map
	},

	// Status 232 (0xE8): SpecialAirHi
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirHi,				// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialHiProcUpdate,				// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirHiProcPhysics,			// Proc Physics
		ftFoxSpecialAirHiProcMap				// Proc Map
	},

	// Status 233 (0xE9): SpecialHiEnd
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialHiEnd,				// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftStatus_IfAnimEnd_SetStatusWait,		// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialHiEndProcPhysics,			// Proc Physics
		ftMap_CheckGroundBreakSetFall				// Proc Map
	},

	// Status 234 (0xEA): SpecialAirHiEnd
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirHiEnd,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialAirHiEndProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyAirVelDrift,				// Proc Physics
		ftFoxSpecialAirHiEndProcMap			// Proc Map
	},

	// Status 235 (0xEB): SpecialAirHiBound
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirHiBound,			// Script ID
		ftMotion_AttackIndex_SpecialHi,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialHi,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFox_SpecialAirHiBound_ProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftFox_SpecialAirHiBound_ProcPhysics,	// Proc Physics
		ftFox_SpecialAirHiBound_ProcMap			// Proc Map
	},

	// Status 236 (0xEC): SpecialLwStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialLwStart,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 237 (0xED): SpecialLwHit
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialLwHit,				// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwHitProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 238 (0xEE): SpecialLwEnd
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialLwEnd,				// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwHitProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 239 (0xEF): SpecialLwLoop
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialLwLoop,				// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwLoopProcUpdate,			// Proc Update
		ftFoxSpecialLwLoopProcInterrupt,		// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 240 (0xF0): SpecialLwTurn
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialLwLoop,				// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Ground,								// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwTurnProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftPhysics_ApplyGroundVelFriction,		// Proc Physics
		ftMap_CheckGroundStopEdgeFall			// Proc Map
	},

	// Status 241 (0xF1): SpecialAirLwStart
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirLwStart,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwStartProcUpdate,		// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirLwCommonProcPhysics,	// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	},

	// Status 242 (0xF2): SpecialAirLwHit
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirLwHit,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwHitProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirLwCommonProcPhysics,	// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	},

	// Status 243 (0xF3): SpecialAirLwEnd
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirLwEnd,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwEndProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirLwCommonProcPhysics,	// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	},

	// Status 244 (0xF4): SpecialAirLwLoop
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirLwLoop,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwLoopProcUpdate,			// Proc Update
		ftFoxSpecialLwLoopProcInterrupt,		// Proc Interrupt
		ftFoxSpecialAirLwCommonProcPhysics,	// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	},

	// Status 245 (0xF5): SpecialAirLwTurn
	{
		/////////////////////////// Motion Info ////////////////////////////////
		ftMotion_Fox_SpecialAirLwLoop,			// Script ID
		ftMotion_AttackIndex_SpecialLw,			// Motion attack ID

		/////////////////////////// Status Info ////////////////////////////////
		0,										// ??? (Might be 3 individual bits?)
		FALSE,									// Is Smash attack?
		GA_Air,									// Grounded or aerial attack?
		FALSE,									// Is projectile?
		ftStatus_AttackIndex_SpecialLw,			// Status attack ID

		//////////////////////// Process Callbacks /////////////////////////////
		ftFoxSpecialLwTurnProcUpdate,			// Proc Update
		NULL,									// Proc Interrupt
		ftFoxSpecialAirLwCommonProcPhysics,	// Proc Physics
		ftMap_CheckGroundSetWaitOrLanding						// Proc Map
	}
};

#endif