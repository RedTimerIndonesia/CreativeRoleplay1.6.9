enum boomboxData {
	boomboxPlaced,
	Float:boomboxPos[3],
	boomboxInterior,
	boomboxWorld,
	boomboxObject,
	boomboxURL[128 char],
	Text3D:boomboxText3D
};
new BoomboxData[MAX_PLAYERS][boomboxData];

Boombox_Place(playerid)
{
	new
	    Float:angle;

	GetPlayerFacingAngle(playerid, angle);

	strpack(BoomboxData[playerid][boomboxURL], "", 128 char);
	GetPlayerPos(playerid, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2]);

	BoomboxData[playerid][boomboxPlaced] = true;
	BoomboxData[playerid][boomboxInterior] = GetPlayerInterior(playerid);
	BoomboxData[playerid][boomboxWorld] = GetPlayerVirtualWorld(playerid);

    BoomboxData[playerid][boomboxObject] = CreateDynamicObject(2226, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2] - 0.9, 0.0, 0.0, angle, BoomboxData[playerid][boomboxWorld], BoomboxData[playerid][boomboxInterior]);
    BoomboxData[playerid][boomboxText3D] = CreateDynamic3DTextLabel("[Boombox]\n{FFFFFF}/boombox to use this boombox.", COLOR_BLUE, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2] - 0.7, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, BoomboxData[playerid][boomboxWorld], BoomboxData[playerid][boomboxInterior]);

	return 1;
}

Boombox_Nearest(playerid)
{
	foreach (new i : Player) if (BoomboxData[i][boomboxPlaced] && GetPlayerInterior(playerid) == BoomboxData[i][boomboxInterior] && GetPlayerVirtualWorld(playerid) == BoomboxData[i][boomboxWorld] && IsPlayerInRangeOfPoint(playerid, 30.0, BoomboxData[i][boomboxPos][0], BoomboxData[i][boomboxPos][1], BoomboxData[i][boomboxPos][2])) {
     	return i;
	}
	return INVALID_PLAYER_ID;
}

Boombox_SetURL(playerid, url[])
{
	if (BoomboxData[playerid][boomboxPlaced])
	{
	    strpack(BoomboxData[playerid][boomboxURL], url, 128 char);
	    
	    new Float:pos[3];
	    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);

	    foreach (new i : Player) if (IsPlayerInRangeOfPoint(i, 35.0, pos[0], pos[1], pos[2])) {
	        StopAudioStreamForPlayer(i);
	        PlayAudioStreamForPlayer(i, url, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2], 35.0, 1);
		}
	}
	return 1;
}

Boombox_Destroy(playerid)
{
	if (BoomboxData[playerid][boomboxPlaced])
	{
		if (IsValidDynamicObject(BoomboxData[playerid][boomboxObject]))
		    DestroyDynamicObject(BoomboxData[playerid][boomboxObject]);

		if (IsValidDynamic3DTextLabel(BoomboxData[playerid][boomboxText3D]))
		    DestroyDynamic3DTextLabel(BoomboxData[playerid][boomboxText3D]);

		new Float:pos[3];
	    GetPlayerPos(playerid,pos[0],pos[1],pos[2]);

	    foreach (new i : Player) if (IsPlayerInRangeOfPoint(i, 35.0, pos[0], pos[1], pos[2])) {
		    StopAudioStreamForPlayer(i);
		}
        BoomboxData[playerid][boomboxPlaced] = false;
        BoomboxData[playerid][boomboxInterior] = 0;
        BoomboxData[playerid][boomboxWorld] = 0;
	}
	return 1;
}

CMD:boombox(playerid,params[])
{
	new option[24], value[128];
	/*if (pData[playerid][pBoombox] == 0)
		return Error(playerid, "You don't have boombox!");*/
	if(pData[playerid][pVip] == 1)
		return Error(playerid, "This Command Only For Donator!");

	if (sscanf(params,"s[24]S()[128]",option,value)) {
		Usage(playerid,"/boombox [option]");
		Info(playerid,"[OPTIONS]: place, pickup, url");
		return 1;
	}

	if (!strcmp(option, "place", true)) {
		if (BoomboxData[playerid][boomboxPlaced])
	        return Error(playerid, "You have placed a boombox already.");

		if (Boombox_Nearest(playerid) != INVALID_PLAYER_ID)
		    return Error(playerid, "You are in range of another boombox already.");

		if (IsPlayerInAnyVehicle(playerid))
		    return Error(playerid, "You must exit the vehicle first.");

		Boombox_Place(playerid);

		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s takes out a boombox and sets it down.", ReturnName(playerid));
		Servers(playerid, "You have placed your boombox (use \"/boombox\" for options).");
	} else if (!strcmp(option,"pickup",true)) {
		if (!BoomboxData[playerid][boomboxPlaced])
	        return Error(playerid, "You don't have a boombox deployed.");

		if (!IsPlayerInRangeOfPoint(playerid, 3.0, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2]))
		    return Error(playerid, "You are not in range of your boombox.");

		Boombox_Destroy(playerid);
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has picked up their boombox.", ReturnName(playerid));
	} else if (!strcmp(option,"url",true)) {
		if (sscanf(value,"s[128]",value))
			return Usage(playerid,"/boombox url [link]");
		
		if (!BoomboxData[playerid][boomboxPlaced])
	        return Error(playerid, "You don't have a boombox deployed.");

		if (!IsPlayerInRangeOfPoint(playerid, 3.0, BoomboxData[playerid][boomboxPos][0], BoomboxData[playerid][boomboxPos][1], BoomboxData[playerid][boomboxPos][2]))
		    return Error(playerid, "You are not in range of your boombox.");

		Boombox_SetURL(playerid, value);
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s has changed song of boombox.", ReturnName(playerid));
	}
	return 1;
}
