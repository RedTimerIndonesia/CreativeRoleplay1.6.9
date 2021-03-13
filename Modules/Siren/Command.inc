CMD:siren(playerid, params[])
{
	if(pData[playerid][pFaction] < 1)
	{
		if(sscanf(params, "d", type))
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "KEGUNAAN: /siren [type]");
			SendClientMessageEx(playerid, COLOR_GRAD2, "Type: 1 = Inside, 2 = Roof, 3 = Off.");
			return 1;
		}
		switch(type)
		{
		case 1:
			{
				if(Siren[VID] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "This vehicle already has a siren!");
					return 1;
				}
				 new sendername[MAX_PLAYER_NAME];
                 Siren[VID] = 1;
                 GetPlayerName(playerid, sendername, sizeof(sendername));
                 SirenObject[VID] = CreateDynamicObject(18646, 10.0, 10.0, 10.0, 0, 0, 0);
                 AttachDynamicObjectToVehicle(SirenObject[VID], VID, 0.0, 0.75, 0.275, 0.0, 0.1, 0.0);
                 return 1;
			}
		case 2:
			{
				if(Siren[VID] == 1)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "This vehicle already has a siren!");
					return 1;
				}
                        Siren[VID] = 1;
                        new sendername[MAX_PLAYER_NAME];
                        GetPlayerName(playerid, sendername, sizeof(sendername));
                        SirenObject[VID] = CreateDynamicObject(18646, 10.0, 10.0, 10.0, 0, 0, 0);
                        AttachDynamicObjectToVehicle(SirenObject[VID], VID, -0.43, 0.0, 0.785, 0.0, 0.1, 0.0);
                        return 1;
			}
		case 3:
			{
				if(Siren[VID] == 0)
				{
					SendClientMessageEx(playerid, COLOR_GRAD2, "This vehicle doesn't have a siren on it!");
					return 1;
				}
				Siren[VID] = 0;
                new sendername[MAX_PLAYER_NAME];
               	GetPlayerName(playerid, sendername, sizeof(sendername));
               	DestroyDynamicObject(SirenObject[VID]);
               	return 1;
			}
		default:
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Invalid license type! /siren [type]");
				SendClientMessageEx(playerid, COLOR_GRAD2, "Type: 1 = Roof, 2 = Inside, 3 = Off.");
			}
		}
	}
	else SendClientMessageEx(playerid, COLOR_GREY, "You're not authorised to use this command.");
	return 1;
}