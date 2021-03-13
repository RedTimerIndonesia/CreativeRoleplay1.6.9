// -279.67, -2148.42, 28.54 buy product
//-249.79, -2148.05, 29.30 point1
//-244.14, -2146.05, 29.30 point2
//-250.88, -2143.23, 29.32 point 3
//-245.74, -2141.65, 29.32 point4
CreateJoinProductionPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -283.02, -2174.36, 28.66, -1);
	format(strings, sizeof(strings), "[PRODUCTION JOBS]\n{FFFFFF}/joinjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -283.02, -2174.36, 28.66, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job
	
	format(strings, sizeof(strings), "[PRODUCTION JOBS]\n{FFFFFF}/createproduct");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -249.79, -2148.05, 29.30, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job
	
	format(strings, sizeof(strings), "[PRODUCTION JOBS]\n{FFFFFF}/createproduct");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -244.14, -2146.05, 29.30, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job
	
	format(strings, sizeof(strings), "[PRODUCTION JOBS]\n{FFFFFF}/createproduct");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -250.88, -2143.23, 29.32, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job
	
	format(strings, sizeof(strings), "[PRODUCTION JOBS]\n{FFFFFF}/createproduct");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -245.74, -2141.65, 29.32, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // production job
}


CMD:createproduct(playerid, params[])
{
	if(pData[playerid][pJobTime] > 0) return Error(playerid, "Anda harus menunggu "GREY2_E"%d "WHITE_E"detik untuk bisa bekerja kembali.", pData[playerid][pJobTime]);
	if(pData[playerid][pJob] == 6 || pData[playerid][pJob2] == 6)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, -249.79, -2148.05, 29.30) || IsPlayerInRangeOfPoint(playerid, 2.0, -244.14, -2146.05, 29.30)
		|| IsPlayerInRangeOfPoint(playerid, 2.0, -250.88, -2143.23, 29.32) || IsPlayerInRangeOfPoint(playerid, 2.0, -245.74, -2141.65, 29.32))
		{
			new type;
			if(sscanf(params, "d", type)) return Usage(playerid, "/createproduct [type, 1.Food 2.Clothes 3.Equipment");
			
			if(type < 1 || type > 3) return Error(playerid, "Invalid type id.");
			
			if(type == 1)
			{
				
			}
			else if(type == 2)
			{
				if(pData[playerid][pActivityTime] > 5) return Error(playerid, "Anda masih memiliki activity progress!");
				if(pData[playerid][pMaterial] < 20) return Error(playerid, "Material tidak cukup!(Minimal: 20).");
				if(pData[playerid][CarryProduct] != 0) return Error(playerid, "Anda sedang membawa sebuah product");
				pData[playerid][pMaterial] -= 20;
				
				TogglePlayerControllable(playerid, 0);
				Info(playerid, "Anda sedang memproduksi baju dengan 20 material!");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pProducting] = SetTimerEx("CreateClothes", 1000, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Creating...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
				
			}
			else if(type == 3)
			{
				if(pData[playerid][pActivityTime] > 5) return Error(playerid, "Anda masih memiliki activity progress!");
				if(pData[playerid][pMaterial] < 10) return Error(playerid, "Material tidak cukup!(Minimal: 10).");
				if(pData[playerid][pComponent] < 10) return Error(playerid, "Component tidak cukup!(Minimal: 10).");
				if(pData[playerid][CarryProduct] != 0) return Error(playerid, "Anda sedang membawa sebuah product");
				pData[playerid][pMaterial] -= 10;
				pData[playerid][pComponent] -= 10;
				
				TogglePlayerControllable(playerid, 0);
				Info(playerid, "Anda sedang memproduksi equipment dengan 10 material dan 10 component!");
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				pData[playerid][pProducting] = SetTimerEx("CreateEquip", 1000, true, "i", playerid);
				PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Creating...");
				PlayerTextDrawShow(playerid, ActiveTD[playerid]);
				ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);
			}
		}
		else return Error(playerid, "You're not near in production warehouse.");
	}
	else Error(playerid, "Anda bukan pekerja sebagai operator produksi.");
	return 1;
}

function CreateClothes(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!IsValidTimer(pData[playerid][pProducting])) return 0;
	if(pData[playerid][pJob] == 6 || pData[playerid][pJob2] == 6)
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, -249.79, -2148.05, 29.30) || IsPlayerInRangeOfPoint(playerid, 2.0, -244.14, -2146.05, 29.30)
			|| IsPlayerInRangeOfPoint(playerid, 2.0, -250.88, -2143.23, 29.32) || IsPlayerInRangeOfPoint(playerid, 2.0, -245.74, -2141.65, 29.32))
			{
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
				SetPlayerAttachedObject(playerid, 9, 2391, 5, 0.105, 0.086, 0.22, -80.3, 3.3, 28.7, 0.35, 0.35, 0.35);
				pData[playerid][CarryProduct] = 2;
				Info(playerid, "Anda telah berhasil membuat product baju, /sellproduct untuk menjualnya.");
				TogglePlayerControllable(playerid, 1);
				InfoTD_MSG(playerid, 8000, "Clothes Created!");
				KillTimer(pData[playerid][pProducting]);
				pData[playerid][pActivityTime] = 0;
				HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
				PlayerTextDrawHide(playerid, ActiveTD[playerid]);
				pData[playerid][pEnergy] -= 3;
				ClearAnimations(playerid);
			}
		}
		else if(pData[playerid][pActivityTime] < 100)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, -249.79, -2148.05, 29.30) || IsPlayerInRangeOfPoint(playerid, 2.0, -244.14, -2146.05, 29.30)
			|| IsPlayerInRangeOfPoint(playerid, 2.0, -250.88, -2143.23, 29.32) || IsPlayerInRangeOfPoint(playerid, 2.0, -245.74, -2141.65, 29.32))
			{
				pData[playerid][pActivityTime] += 5;
				SetPlayerProgressBarValue(playerid, pData[playerid][activitybar], pData[playerid][pActivityTime]);
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
			}
		}
	}
	return 1;
}

function CreateEquip(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!IsValidTimer(pData[playerid][pProducting])) return 0;
	if(pData[playerid][pJob] == 6 || pData[playerid][pJob2] == 6)
	{
		if(pData[playerid][pActivityTime] >= 100)
		{
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 9, 2912, 5, 0.105, 0.086, 0.22, -80.3, 3.3, 28.7, 0.35, 0.35, 0.35);
			pData[playerid][CarryProduct] = 3;
			Info(playerid, "Anda telah berhasil membuat product equipment, /sellproduct untuk menjualnya.");
			TogglePlayerControllable(playerid, 1);
			InfoTD_MSG(playerid, 8000, "Equipment Created!");
			KillTimer(pData[playerid][pProducting]);
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
	}
	return 1;
}

CMD:sellproduct(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid, 3.0, -279.67, -2148.42, 28.54)) return Error(playerid, "You're not near in production warehouse.");
	if(pData[playerid][CarryProduct] == 0) return Error(playerid, "You are not holding any products.");
	
	if(pData[playerid][CarryProduct] == 1)
	{
		Info(playerid, "Stock makanan masih belum ada yaa!");
	}
	else if(pData[playerid][CarryProduct] == 2)
	{
		RemovePlayerAttachedObject(playerid, 9);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		pData[playerid][CarryProduct] = 0;
		GivePlayerMoneyEx(playerid, 1000);
		
		Product += 10;
		Server_MinMoney(1000);
		Info(playerid, "Anda menjual 10 product baju dengan harga $1.000");
		pData[playerid][pJobTime] += 150;
	}
	else if(pData[playerid][CarryProduct] == 3)
	{
		RemovePlayerAttachedObject(playerid, 9);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		pData[playerid][CarryProduct] = 0;
		GivePlayerMoneyEx(playerid, 2000);
		
		Product += 10;
		Server_MinMoney(2000);
		Info(playerid, "Anda menjual 10 product baju dengan harga $2.000");
		pData[playerid][pJobTime] += 150;
	}
	return 1;
}