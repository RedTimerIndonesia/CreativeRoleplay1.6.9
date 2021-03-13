#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    LoadMOTDs();
    return 1;
}

hook OnGameModeExit()
{
    SaveMOTDs();
    return 1;
}

hook OnPlayerConnect(playerid)
{
    return 1;
}

hook OnPlayerSpawn(playerid)
{
	new MOTD1[256];
	format(MOTD1, sizeof(MOTD1), "MOTD:"YELLOW" %s", GlobalMOTD);
	SendClientMessageEx(playerid, X11_LIGHTBLUE, MOTD1);
	if(pData[playerid][pAdmin] >= 1)
	{
		format(MOTD1, sizeof(MOTD1), "STAFF MOTD:"WHITE" %s", AdminMOTD);
		SendClientMessageEx(playerid, X11_YELLOW, MOTD1);
	}
	if(pData[playerid][pHelper] >= 1)
	{
		format(MOTD1, sizeof(MOTD1), "STAFF MOTD:"WHITE" %s", AdminMOTD);
		SendClientMessageEx(playerid, X11_YELLOW, MOTD1);
	}
	return 0;
}