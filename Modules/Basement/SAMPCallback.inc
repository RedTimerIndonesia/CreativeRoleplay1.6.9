#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    LoadBasement();
    return 1;
}

hook OnGameModeExit()
{
    SaveBasement();
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(IsKeyJustDown(KEY_CROUCH, newkeys, oldkeys))
	{
	    for(new i = 0; i < sizeof(BasementInfo); i++)
		{
			if (IsPlayerInRangeOfPoint(playerid,5.0,BasementInfo[i][baseExteriorX],BasementInfo[i][baseExteriorY],BasementInfo[i][baseExteriorZ]))
		 	{
			    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) 
                {
                    SetVehiclePos(GetPlayerVehicleID(playerid), BasementInfo[i][baseInteriorX], BasementInfo[i][baseInteriorY], BasementInfo[i][baseInteriorZ]);
                    SetVehicleZAngle(GetPlayerVehicleID(playerid), BasementInfo[i][baseInteriorA]);
                    SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), BasementInfo[i][baseInteriorVW]);
                    LinkVehicleToInterior(GetPlayerVehicleID(playerid), BasementInfo[i][baseInteriorInt]);
                    SetPlayerVirtualWorld(playerid, BasementInfo[i][baseInteriorVW]);
                    SetPlayerInterior(playerid, BasementInfo[i][baseInteriorInt]);
                    PlayerInfo[playerid][pVW] = BasementInfo[i][baseInteriorVW];
                    PlayerInfo[playerid][pLocal] = BasementInfo[i][baseInteriorVW];
                    PlayerInfo[playerid][pInt] = BasementInfo[i][baseInteriorInt];
            	}
			}
	    }
    return 1;
}