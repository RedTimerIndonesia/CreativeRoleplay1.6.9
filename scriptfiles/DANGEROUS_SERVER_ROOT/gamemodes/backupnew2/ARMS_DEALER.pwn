//-3807.89, 1312.56, 75.82

CreateArmsPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -3807.89, 1312.56, 75.82, -1);
	format(strings, sizeof(strings), "[Black Market]\n{FFFFFF}/creategun");
	CreateDynamic3DTextLabel(strings, COLOR_GREY, -3807.89, 1312.56, 75.82, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //
}

CMD:creategun(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.5,  -3807.89, 1312.56, 75.82)) return Error(playerid, "You must in Black Market!");
	if(pData[playerid][pLevel] < 3) return Error(playerid, "You dont have skill to creategun.");
	
	new Dstring[512];
	format(Dstring, sizeof(Dstring), "Weapon\tMats & Comps & Price\n\
	Silenced Pistol(ammo 70)\t500 & 500 / $1.000\n");
	format(Dstring, sizeof(Dstring), "%sColt45 9MM(ammo 70)\t500 & 500 & $300\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sDesert Eagle(ammo 70)\t500 & 500 & $6.000\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sShotgun(ammo 50)\t500 & 500 & $4.000\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sRifle(ammo 35)\t500 & 500 & $8.000\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sAK-47(ammo 100)\t500 & 500 & $12.000\n", Dstring);
	format(Dstring, sizeof(Dstring), "%sMicro SMG/Uzi(ammo 200)\t500 & 500 & $10.000\n", Dstring);
	ShowPlayerDialog(playerid, DIALOG_ARMS_GUN, DIALOG_STYLE_TABLIST_HEADERS, "Create Gun", Dstring, "Create", "Cancel");
	return 1;
}

function CreateGun(playerid, gunid, ammo)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!IsValidTimer(pData[playerid][pArmsDealer])) return 0;
	if(gunid == 0 || ammo == 0) return 0;
	if(pData[playerid][pActivityTime] >= 100)
	{
		GivePlayerWeaponEx(playerid, gunid, ammo);
		
		Info(playerid, "Anda telah berhasil membuat senjata ilegal.");
		TogglePlayerControllable(playerid, 1);
		InfoTD_MSG(playerid, 8000, "Weapon Created!");
		KillTimer(pData[playerid][pArmsDealer]);
		pData[playerid][pActivityTime] = 0;
		HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
		PlayerTextDrawHide(playerid, ActiveTD[playerid]);
		pData[playerid][pEnergy] -= 3;
		return 1;
	}
	else if(pData[playerid][pActivityTime] < 100)
	{
		pData[playerid][pActivityTime] += 5;
		SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
		ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	}
	return 1;
}