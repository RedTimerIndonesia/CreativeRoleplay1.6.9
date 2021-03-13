CreateJoinTruckPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -77.38, -1136.52, 1.07, -1);
	format(strings, sizeof(strings), "[TRUCKER JOBS]\n{FFFFFF}/joinjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -77.38, -1136.52, 1.07, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // truck
}

GetRestockBisnis()
{
	new tmpcount;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}

ReturnRestockBisnisID(slot)
{
	new tmpcount;
	if(slot < 1 && slot > MAX_BISNIS) return -1;
	foreach(new id : Bisnis)
	{
	    if(bData[id][bRestock] == 1)
	    {
     		tmpcount++;
       		if(tmpcount == slot)
       		{
        		return id;
  			}
	    }
	}
	return -1;
}

CMD:mission(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		if(GetRestockBisnis() <= 0) return Error(playerid, "Mission sedang kosong.");
		new id, count = GetRestockBisnis(), mission[128], type[32], lstr[512];
		
		strcat(mission,"No\tBusID\tBusType\tBusName\n",sizeof(mission));
		Loop(itt, (count + 1), 1)
		{
			id = ReturnRestockBisnisID(itt);
			if(bData[id][bType] == 1)
			{
				type= "Fast Food";
			}
			else if(bData[id][bType] == 2)
			{
				type= "Market";
			}
			else if(bData[id][bType] == 3)
			{
				type= "Clothes";
			}
			else if(bData[id][bType] == 4)
			{
				type= "Ammunation";
			}
			else
			{
				type= "Unknow";
			}
			if(itt == count)
			{
				format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, bData[id][bName]);	
			}
			else format(lstr,sizeof(lstr), "%d\t%d\t%s\t%s\n", itt, id, type, bData[id][bName]);
			strcat(mission,lstr,sizeof(mission));
		}
		ShowPlayerDialog(playerid, DIALOG_RESTOCK, DIALOG_STYLE_TABLIST_HEADERS,"Mission",mission,"Start","Cancel");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}

CMD:storeproduct(playerid, params[])
{
	if(pData[playerid][pJob] == 4 || pData[playerid][pJob2] == 4)
	{
		new bid = pData[playerid][pMission], vehicleid = GetPlayerVehicleID(playerid), carid = -1, pay;
		if(bid == -1) return Error(playerid, "You dont have mission.");
		if(IsPlayerInRangeOfPoint(playerid, 4.5, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]))
		{
			if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER && GetVehicleModel(vehicleid) != 456) return Error(playerid, "Anda harus mengendarai truck yankee.");
			if(VehProduct[vehicleid] < 1) return Error(playerid, "Product is empty in this vehicle.");
			pay = VehProduct[vehicleid] * ProductPrice + 500;
			bData[bid][bProd] += VehProduct[vehicleid];
			bData[bid][bMoney] -= VehProduct[vehicleid] * ProductPrice;
			Info(playerid, "Anda menjual "RED_E"%d "WHITE_E"product dengan seharga "GREEN_E"%s", VehProduct[vehicleid], FormatMoney(pay));
			GivePlayerMoneyEx(playerid, pay);
			if((carid = Vehicle_Nearest2(playerid)) != -1)
			{
				pvData[carid][cProduct] = 0;
			}
			VehProduct[vehicleid] = 0;
			pData[playerid][pMission] = -1;
		}
		else return Error(playerid, "Anda harus berada didekat dengan bisnis mission anda.");
	}
	else return Error(playerid, "You are not trucker job.");
	return 1;
}