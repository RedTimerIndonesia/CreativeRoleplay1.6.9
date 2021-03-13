//2254.83, -1984.17, 13.58
//point 2277.32, -1989.31, 13.58
//point 2266.58, -1989.80, 13.58

CreateJoinMechPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, 2254.83, -1984.17, 13.58, -1);
	format(strings, sizeof(strings), "[MECH JOBS]\n{FFFFFF}/joinjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 2254.83, -1984.17, 13.58, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Taxi
}

//Mechanic jobs
CMD:mechduty(playerid, params[])
{
	if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
	{		
		if(pData[playerid][pMechDuty] == 0)
		{
			pData[playerid][pMechDuty] = 1;
			SetPlayerColor(playerid, COLOR_GREEN);
			//SendClientMessageToAllEx(COLOR_GREEN, "[MECH]"WHITE_E" %s is now on taxi duty. Type \"/call 1222\" to call a taxi!", ReturnName(playerid, 0));
		}
		else
		{
			pData[playerid][pMechDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "Anda telah off dari mech duty!");
		}
	}
	else return Error(playerid, "Anda bukan pekerja mechanic!");
	return 1;
}

CMD:service(playerid, params[])
{
	if(pData[playerid][pJob] == 2 || pData[playerid][pJob2] == 2)
	{
		if(pData[playerid][pMechVeh] == INVALID_VEHICLE_ID)
		{
			new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);
			
			if(vehicleid == INVALID_VEHICLE_ID) return Error(playerid, "You not in near any vehicles.");
			if(pData[playerid][pActivityTime] > 5) return Error(playerid, "You already checking vehicle!");
			
			Info(playerid, "Don't move from your position or you will failed to checking this vehicle!");
			ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
			pData[playerid][pActivity] = SetTimerEx("CheckCar", 1000, true, "dd", playerid, vehicleid);
			PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Checking...");
			PlayerTextDrawShow(playerid, ActiveTD[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
			return 1;
		}
		
		if(GetNearestVehicleToPlayer(playerid, 3.5, false) == pData[playerid][pMechVeh])
		{
			new Dstring[512], Float:health, engine;
			new panels, doors, light, tires, body;
			GetVehicleHealth(pData[playerid][pMechVeh], health);
			if(health > 1000.0) health = 1000.0;
			if(health > 0.0) health *= -1;
			engine = floatround(health, floatround_round) / 10 + 100;
			
			GetVehicleDamageStatus(pData[playerid][pMechVeh], panels, doors, light, tires);
		    new cpanels = panels / 1000000;
		    new lights = light / 2;
		    new pintu;
		    if(doors != 0) pintu = 5;
		    if(doors == 0) pintu = 0;
		    body = cpanels + lights + pintu;
			/*if(health >= 1000)
			{
				engine = 5;
			}
			else if(health >= 800)
			{
				engine = 10;
			}
			else if(health >= 700)
			{
				engine = 20;
			}
			else if(health >= 600)
			{
				engine = 30;
			}
			else if(health >= 500)
			{
				engine = 40;
			}
			else if(health <= 400)
			{
				engine = 50;
			}*/
			format(Dstring, sizeof(Dstring), "Service Name\tComponent\n\
			Engine Fix\t%d\n", engine);
			format(Dstring, sizeof(Dstring), "%sBody Fix\t%d", Dstring, body);
			
			ShowPlayerDialog(playerid, DIALOG_SERVICE, DIALOG_STYLE_TABLIST_HEADERS, "Mech Service", Dstring, "Service", "Cancel");
		}
		else
		{
			KillTimer(pData[playerid][pActivity]);
			HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
			PlayerTextDrawHide(playerid, ActiveTD[playerid]);
			pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
			pData[playerid][pActivityTime] = 0;
			Info(playerid, "Kendaraan pelanggan anda yang sebelumnya sudah terlalu jauh.");
			return 1;
		}
	}
	else return Error(playerid, "Anda bukan pekerja mechanic!");
	return 1;
}
