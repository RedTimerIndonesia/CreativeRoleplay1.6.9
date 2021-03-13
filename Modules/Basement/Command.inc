CMD:basename(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 9)
	{
	    SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	    return 1;
	}
	new string[512], baseid, name[128];
	if(sscanf(params, "ds[128]", baseid, name)) return SendKegunaan(playerid, "/basename [basement id] [name]");
	if(baseid >= MAX_BASEMENT) return SEM(playerid, "ERROR: Invalid Basement ID!");
	FormatText(name);
	format(BasementInfo[baseid][baseName], 128, "%s", name);
	SendClientMessageEx(playerid, COLOR_RIKO, "BASEMENT: You have changed the name of the Basement!");
	if(IsValidDynamicPickup(BasementInfo[baseid][basePickupID])) DestroyDynamicPickup(BasementInfo[baseid][basePickupID]);
	if(IsValidDynamic3DTextLabel(BasementInfo[baseid][baseText])) DestroyDynamic3DTextLabel(BasementInfo[baseid][baseText]);
	if(IsValidDynamicCP(BasementInfo[baseid][baseCP])) DestroyDynamicCP(BasementInfo[baseid][baseCP]);
	if(BasementInfo[baseid][baseExteriorX])
	{
 		format(string, sizeof(string), "[id:%d]\n{00FF00}%s",baseid,BasementInfo[baseid][baseName]);
   		BasementInfo[baseid][basePickupID] = CreateDynamicPickup(19130, 23, BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ]);
	    BasementInfo[baseid][baseText] = CreateDynamic3DTextLabel(string, COLOR_RIKO, BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ]+1,10.0, .testlos = 1, .streamdistance = 5.0);
	    BasementInfo[baseid][baseCP] = CreateDynamicCP(BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ], 4,  BasementInfo[baseid][baseExteriorVW], BasementInfo[baseid][baseExteriorInt], -1, 5.0);
	}
	SaveBasement();
	return 1;
}

CMD:editbasement(playerid, params[])
{
	if(PlayerInfo[playerid][pAdmin] < 9)
	{
	    SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	    return 1;
	}
	new string[512], choice[32], baseid;
	if(sscanf(params, "s[32]d", choice, baseid))
	{
	    SendKegunaan(playerid, "/editbasement [choice] [baseid] [amount]");
	    SEM(playerid, "Choice: Exterior, Interior, Delete");
	    return 1;
	}
	if(baseid >= MAX_BASEMENT)
	{
	    SEM(playerid, "ERROR: Invalid Basement ID!");
	    return 1;
	}
	if(strcmp(choice, "interior", true) == 0)
	{
	    GetPlayerPos(playerid, BasementInfo[baseid][baseInteriorX], BasementInfo[baseid][baseInteriorY], BasementInfo[baseid][baseInteriorZ]);
	    GetPlayerFacingAngle(playerid, BasementInfo[baseid][baseInteriorA]);
	    BasementInfo[baseid][baseInteriorVW] = GetPlayerVirtualWorld(playerid);
	    BasementInfo[baseid][baseInteriorInt] = GetPlayerInterior(playerid);
	    SCME(playerid, COLOR_RIKO, "BASEMENT: {FFFFFF}You've changed interior!");
	    SaveBasement();
	    return 1;
	}
	else if(strcmp(choice, "exterior", true) == 0)
	{
	    GetPlayerPos(playerid, BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ]);
	    GetPlayerFacingAngle(playerid, BasementInfo[baseid][baseExteriorA]);
	    BasementInfo[baseid][baseExteriorVW] = GetPlayerVirtualWorld(playerid);
	    BasementInfo[baseid][baseExteriorInt] = GetPlayerInterior(playerid);
	    SCME(playerid, COLOR_RIKO, "BASEMENT: {FFFFFF}You've changed exterior!");
	    if(IsValidDynamicPickup(BasementInfo[baseid][basePickupID])) DestroyDynamicPickup(BasementInfo[baseid][basePickupID]);
		if(IsValidDynamic3DTextLabel(BasementInfo[baseid][baseText])) DestroyDynamic3DTextLabel(BasementInfo[baseid][baseText]);
		if(IsValidDynamicCP(BasementInfo[baseid][baseCP])) DestroyDynamicCP(BasementInfo[baseid][baseCP]);
		if(BasementInfo[baseid][baseExteriorX])
		{
		    format(string, sizeof(string), "[id:%d]\n{00FF00}%s",baseid,BasementInfo[baseid][baseName]);
		    BasementInfo[baseid][basePickupID] = CreateDynamicPickup(19130, 23, BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ]);
		    BasementInfo[baseid][baseText] = CreateDynamic3DTextLabel(string, COLOR_RIKO, BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ]+1,10.0, .testlos = 1, .streamdistance = 5.0);
		    BasementInfo[baseid][baseCP] = CreateDynamicCP(BasementInfo[baseid][baseExteriorX], BasementInfo[baseid][baseExteriorY], BasementInfo[baseid][baseExteriorZ], 4,  BasementInfo[baseid][baseExteriorVW], BasementInfo[baseid][baseExteriorInt], -1, 5.0);
		}
		SaveBasement();
	}
	else if(strcmp(choice, "delete", true) == 0)
	{
	    BasementInfo[baseid][baseExteriorX] = 0;
		BasementInfo[baseid][baseExteriorY] = 0;
		BasementInfo[baseid][baseExteriorZ] = 0;
		BasementInfo[baseid][baseInteriorX] = 0;
		BasementInfo[baseid][baseInteriorY] = 0;
		BasementInfo[baseid][baseInteriorZ] = 0;
		BasementInfo[baseid][baseExteriorVW] = 9999;
		BasementInfo[baseid][baseExteriorInt] = 9999;
		BasementInfo[baseid][baseInteriorVW] = 9999;
		BasementInfo[baseid][baseInteriorInt] = 9999;
	    if(IsValidDynamicPickup(BasementInfo[baseid][basePickupID])) DestroyDynamicPickup(BasementInfo[baseid][basePickupID]);
		if(IsValidDynamic3DTextLabel(BasementInfo[baseid][baseText])) DestroyDynamic3DTextLabel(BasementInfo[baseid][baseText]);
		if(IsValidDynamicCP(BasementInfo[baseid][baseCP])) DestroyDynamicCP(BasementInfo[baseid][baseCP]);
		SCME(playerid, COLOR_RIKO, "BASEMENT: {FFFFFF}You've deleted Basement!");
		SaveBasement();
	}
	return 1;
}

for(new i = 0; i < sizeof(BasementInfo); i++)
	{
		if(IsPlayerInRangeOfPoint(playerid,5.0,BasementInfo[i][baseExteriorX],BasementInfo[i][baseExteriorY],BasementInfo[i][baseExteriorZ]))
		{
			AC_BS_SetPlayerInterior(playerid,BasementInfo[i][baseInteriorInt]);
			SetPlayerInterior(playerid, BasementInfo[i][baseInteriorInt]);
   			PlayerInfo[playerid][pInt] = BasementInfo[i][baseInteriorInt];
      		PlayerInfo[playerid][pLocal] = BasementInfo[i][baseInteriorVW];
        	PlayerInfo[playerid][pVW] = BasementInfo[i][baseInteriorVW];
          	AC_BS_SetPlayerVirtualWorld(playerid, BasementInfo[i][baseInteriorVW]);
          	SetPlayerVirtualWorld(playerid, BasementInfo[i][baseInteriorVW]);
           	AC_BS_SetPlayerPos(playerid,BasementInfo[i][baseInteriorX],BasementInfo[i][baseInteriorY],BasementInfo[i][baseInteriorZ]);
            SetPlayerFacingAngle(playerid,BasementInfo[i][baseInteriorA]);
            SetCameraBehindPlayer(playerid);
			Streamer_UpdateEx(playerid, BasementInfo[i][baseInteriorX],BasementInfo[i][baseInteriorY],BasementInfo[i][baseInteriorZ]);
		}
	}