//Business
#define MAX_BISNIS 500

enum bisinfo
{
	bOwner[MAX_PLAYER_NAME],
	bName[128],
	bPrice,
	bType,
	bLocked,
	bMoney,
	bProd,
	bP[10],
	bInt,
	Float:bExtpos[4],
	Float:bIntpos[4],
	bVisit,
	bRestock,
	Float:bPoint[3],
	//Not Saved
	bPickPoint,
	Text3D:bLabelPoint,
	bPickup,
	bCP,
	Text3D:bLabel,
};

new bData[MAX_BISNIS][bisinfo],
	Iterator: Bisnis<MAX_BISNIS>;

Bisnis_Save(id)
{
	new cQuery[1536];
	format(cQuery, sizeof(cQuery), "UPDATE bisnis SET owner='%s', name='%s', price='%d', type='%d', locked='%d', money='%d', prod='%d', bprice0='%d', bprice1='%d', bprice2='%d', bprice3='%d', bprice4='%d', bprice5='%d', bprice6='%d', bprice7='%d', bprice8='%d', bprice9='%d', bint='%d', extposx='%f', extposy='%f', extposz='%f', extposa='%f', intposx='%f', intposy='%f', intposz='%f', intposa='%f', pointx='%f', pointy='%f', pointz='%f', visit='%d', restock='%d' WHERE ID='%d'",
	bData[id][bOwner],
	bData[id][bName],
	bData[id][bPrice],
	bData[id][bType],
	bData[id][bLocked],
	bData[id][bMoney],
	bData[id][bProd],
	bData[id][bP][0],
	bData[id][bP][1],
	bData[id][bP][2],
	bData[id][bP][3],
	bData[id][bP][4],
	bData[id][bP][5],
	bData[id][bP][6],
	bData[id][bP][7],
	bData[id][bP][8],
	bData[id][bP][9],
	bData[id][bInt],
	bData[id][bExtpos][0],
	bData[id][bExtpos][1],
	bData[id][bExtpos][2],
	bData[id][bExtpos][3],
	bData[id][bIntpos][0],
	bData[id][bIntpos][1],
	bData[id][bIntpos][2],
	bData[id][bIntpos][3],
	bData[id][bPoint][0],
	bData[id][bPoint][1],
	bData[id][bPoint][2],
	bData[id][bVisit],
	bData[id][bRestock],
	id
	);
	return mysql_tquery(g_SQL, cQuery);
}
	
Player_OwnsBisnis(playerid, id)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(!strcmp(bData[id][bOwner], pData[playerid][pName], true)) return 1;
	return 0;
}

Player_BisnisCount(playerid)
{
	#if LIMIT_PER_PLAYER != 0
    new count;
	foreach(new i : Bisnis)
	{
		if(Player_OwnsBisnis(playerid, i)) count++;
	}

	return count;
	#else
	return 0;
	#endif
}

Bisnis_Reset(id)
{
	format(bData[id][bOwner], MAX_PLAYER_NAME, "-");
	bData[id][bLocked] = 1;
    bData[id][bMoney] = 0;
	bData[id][bProd] = 0;
	bData[id][bVisit] = 0;
	bData[id][bRestock] = 0;
	Bisnis_Refresh(id);
}
	
GetBisnisOwnerID(id)
{
	foreach(new i : Player)
	{
		if(!strcmp(bData[id][bOwner], pData[i][pName], true)) return i;
	}
	return INVALID_PLAYER_ID;
}

GetOwnedBisnis(playerid)
{
	new tmpcount;
	foreach(new bid : Bisnis)
	{
	    if(!strcmp(bData[bid][bOwner], pData[playerid][pName], true))
	    {
     		tmpcount++;
		}
	}
	return tmpcount;
}
ReturnPlayerBisnisID(playerid, hslot)
{
	new tmpcount;
	if(hslot < 1 && hslot > LIMIT_PER_PLAYER) return -1;
	foreach(new bid : Bisnis)
	{
	    if(!strcmp(pData[playerid][pName], bData[bid][bOwner], true))
	    {
     		tmpcount++;
       		if(tmpcount == hslot)
       		{
        		return bid;
  			}
	    }
	}
	return -1;
}

Bisnis_BuyMenu(playerid, bizid)
{
    if(bizid <= -1 )
        return 0;

    static
        string[512];

    switch(bData[bizid][bType])
    {
        case 1:
        {
            format(string, sizeof(string), "Fried Chicken - %s\nPizza Stack - %s\nPatty Burger - %s\nSprunk - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, BuyProd, DIALOG_STYLE_LIST, bData[bizid][bName], string, "Buy", "Cancel");
        }
        case 2:
        {
            format(string, sizeof(string), "Snack - %s\nSprunk - %s\nGas Fuel - %s\nBandage - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, BuyProd, DIALOG_STYLE_LIST, bData[bizid][bName], string, "Buy", "Cancel");
        }
        case 3:
        {
            format(string, sizeof(string), "Clothes - %s\nToys - %s\nMask - %s\nHelmet - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, BuyProd, DIALOG_STYLE_LIST, bData[bizid][bName], string, "Buy", "Cancel");
        }
        case 4:
        {
            format(string, sizeof(string), "Armour Protec - %s\nDesert Eagle - %s\nShotgun - %s\nAK-47 - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, BuyProd, DIALOG_STYLE_LIST, bData[bizid][bName], string, "Buy", "Cancel");
        }
    }
    return 1;
}

Bisnis_ProductMenu(playerid, bizid)
{
    if(bizid <= -1)
        return 0;

    static
        string[512];

    switch (bData[bizid][bType])
    {
        case 1:
        {
            format(string, sizeof(string), "Fried Chicken - %s\nPizza Stack - %s\nPatty Burger - %s\nSprunk - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, EditProduct, DIALOG_STYLE_LIST, "Business: Modify Item", string, "Modify", "Cancel");
        }
        case 2:
        {
            format(string, sizeof(string), "Snack - %s\nSprunk - %s\nGas Fuel - %s\nBandage - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, EditProduct, DIALOG_STYLE_LIST, "Business: Modify Item", string, "Modify", "Cancel");
        }
        case 3:
        {
            format(string, sizeof(string), "Clothes - %s\nToys - %s\nMask - %s\nHelmet - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, EditProduct, DIALOG_STYLE_LIST, "Business: Modify Item", string, "Modify", "Cancel");
        }
        case 4:
        {
            format(string, sizeof(string), "Armour Protec - %s\nDesert Eagle - %s\nShotgun - %s\nAK-47 - %s",
                FormatMoney(bData[bizid][bP][0]),
                FormatMoney(bData[bizid][bP][1]),
                FormatMoney(bData[bizid][bP][2]),
                FormatMoney(bData[bizid][bP][3])
            );
            Dialog_Show(playerid, EditProduct, DIALOG_STYLE_LIST, "Business: Modify Item", string, "Modify", "Cancel");
        }
    }
    return 1;
}

Bisnis_Type(bisid)
{
	if(bData[bisid][bType] == 1) // Fast Food
	{
	    switch(random(2))
		{
			case 0:
			{
				bData[bisid][bIntpos][0] = 363.22;
				bData[bisid][bIntpos][1] = -74.86;
				bData[bisid][bIntpos][2] = 1001.50;
				bData[bisid][bIntpos][3] = 319.72;
				bData[bisid][bInt] = 10;
			}
			case 1:
			{
				bData[bisid][bIntpos][0] = 372.34;
				bData[bisid][bIntpos][1] = -133.25;
				bData[bisid][bIntpos][2] = 1001.49;
				bData[bisid][bIntpos][3] = 4.80;
				bData[bisid][bInt] = 5;
			}
		}
	}
	if(bData[bisid][bType] == 2) //Market
	{
	    switch(random(2))
		{
			case 0:
			{
				bData[bisid][bIntpos][0] = 5.73;
				bData[bisid][bIntpos][1] = -31.04;
				bData[bisid][bIntpos][2] = 1003.54;
				bData[bisid][bIntpos][3] = 355.73;
				bData[bisid][bInt] = 10;
			}
			case 1:
			{
				bData[bisid][bIntpos][0] = -26.68;
				bData[bisid][bIntpos][1] = -57.92;
				bData[bisid][bIntpos][2] = 1003.54;
				bData[bisid][bIntpos][3] = 357.58;
				bData[bisid][bInt] = 6;
			}
		}
	}
	if(bData[bisid][bType] == 3) //Clothes
	{
	    switch(random(2))
		{
			case 0:
			{
				bData[bisid][bIntpos][0] = 207.55;
				bData[bisid][bIntpos][1] = -110.67;
				bData[bisid][bIntpos][2] = 1005.13;
				bData[bisid][bIntpos][3] = 0.16;
				bData[bisid][bInt] = 15;
			}
			case 1:
			{
				bData[bisid][bIntpos][0] = 204.49;
				bData[bisid][bIntpos][1] = -168.26;
				bData[bisid][bIntpos][2] = 1000.52;
				bData[bisid][bIntpos][3] = 358.74;
				bData[bisid][bInt] = 14;
			}
		}
	}
	if(bData[bisid][bType] == 4) // Ammunation
	{
	    switch(random(2))
		{
			case 0:
			{
				bData[bisid][bIntpos][0] = 285.93;
				bData[bisid][bIntpos][1] = -86.00;
				bData[bisid][bIntpos][2] = 1001.52;
				bData[bisid][bIntpos][3] = 352.95;
				bData[bisid][bInt] = 4;
			}
			case 1:
			{
				bData[bisid][bIntpos][0] = 316.34;
				bData[bisid][bIntpos][1] = -169.60;
				bData[bisid][bIntpos][2] = 999.60;
				bData[bisid][bIntpos][3] =  357.73;
				bData[bisid][bInt] = 6;
			}
		}
	}
}

Bisnis_Refresh(id)
{
    if(id != -1)
    {
        if(IsValidDynamic3DTextLabel(bData[id][bLabel]))
            DestroyDynamic3DTextLabel(bData[id][bLabel]);

        if(IsValidDynamicPickup(bData[id][bPickup]))
            DestroyDynamicPickup(bData[id][bPickup]);
			
		if(IsValidDynamic3DTextLabel(bData[id][bLabelPoint]))
            DestroyDynamic3DTextLabel(bData[id][bLabelPoint]);

        if(IsValidDynamicPickup(bData[id][bPickPoint]))
            DestroyDynamicPickup(bData[id][bPickPoint]);
		
		if(IsValidDynamicCP(bData[id][bCP]))
			DestroyDynamicCP(bData[id][bCP]);

        static
        string[255], tstr[128];
		
		new type[128];
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
        if(strcmp(bData[id][bOwner], "-"))
		{
			format(string, sizeof(string), "[ID: %d]\n"WHITE_E"Name: {FFFF00}%s\n"WHITE_E"Owned by %s\nPress '{FF0000}ENTER{FFFFFF}' to enter", id, bData[id][bName], bData[id][bOwner]);
			bData[id][bPickup] = CreateDynamicPickup(19133, 23, bData[id][bExtpos][0], bData[id][bExtpos][1], bData[id][bExtpos][2]+0.2, 0, 0, _, 4);
        }
        else
        {
            format(string, sizeof(string), "[ID: %d]\n{00FF00}This bisnis for sell\n{FFFFFF}Location: {FFFF00}%s\n{FFFFFF}Price: {FFFF00}%s\n{FFFFFF}Type: {FFFF00}%s\n"WHITE_E"Type /buy to purchase", id, GetLocation(bData[id][bExtpos][0], bData[id][bExtpos][1], bData[id][bExtpos][2]), FormatMoney(bData[id][bPrice]), type);
            bData[id][bPickup] = CreateDynamicPickup(19133, 23, bData[id][bExtpos][0], bData[id][bExtpos][1], bData[id][bExtpos][2]+0.2, 0, 0, _, 4);
        }
		bData[id][bPickPoint] = CreateDynamicPickup(1274, 23, bData[id][bPoint][0], bData[id][bPoint][1], bData[id][bPoint][2]+0.2, id, bData[id][bInt], _, 4);
		
		format(tstr, 128, "[ID: %d]\n"RED_E"Bisnis Point\n"LG_E"use '/buy' here", id);
		bData[id][bLabelPoint] = CreateDynamic3DTextLabel(tstr, COLOR_YELLOW, bData[id][bPoint][0], bData[id][bPoint][1], bData[id][bPoint][2]+0.5, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, id, bData[id][bInt]);
		
		bData[id][bCP] = CreateDynamicCP(bData[id][bIntpos][0], bData[id][bIntpos][1], bData[id][bIntpos][2], 1, id, bData[id][bInt], -1, 3, -1, 0);
        bData[id][bLabel] = CreateDynamic3DTextLabel(string, COLOR_GREEN, bData[id][bExtpos][0], bData[id][bExtpos][1], bData[id][bExtpos][2]+0.5, 2.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
    }
    return 1;
}

function LoadBisnis()
{
    static bid;
	
	new rows = cache_num_rows(), owner[128], name[128];
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_int(i, "ID", bid);
			cache_get_value_name(i, "owner", owner);
			format(bData[bid][bOwner], 128, owner);
			cache_get_value_name(i, "name", name);
			format(bData[bid][bName], 128, name);
			cache_get_value_int(i, "type", bData[bid][bType]);
			cache_get_value_int(i, "price", bData[bid][bPrice]);
			cache_get_value_float(i, "extposx", bData[bid][bExtpos][0]);
			cache_get_value_float(i, "extposy", bData[bid][bExtpos][1]);
			cache_get_value_float(i, "extposz", bData[bid][bExtpos][2]);
			cache_get_value_float(i, "extposa", bData[bid][bExtpos][3]);
			cache_get_value_float(i, "intposx", bData[bid][bIntpos][0]);
			cache_get_value_float(i, "intposy", bData[bid][bIntpos][1]);
			cache_get_value_float(i, "intposz", bData[bid][bIntpos][2]);
			cache_get_value_float(i, "intposa", bData[bid][bIntpos][3]);
			cache_get_value_int(i, "bint", bData[bid][bInt]);
			cache_get_value_int(i, "money", bData[bid][bMoney]);
			cache_get_value_int(i, "locked", bData[bid][bLocked]);
			cache_get_value_int(i, "prod", bData[bid][bProd]);
			cache_get_value_int(i, "bprice0", bData[bid][bP][0]);
			cache_get_value_int(i, "bprice1", bData[bid][bP][1]);
			cache_get_value_int(i, "bprice2", bData[bid][bP][2]);
			cache_get_value_int(i, "bprice3", bData[bid][bP][3]);
			cache_get_value_int(i, "bprice4", bData[bid][bP][4]);
			cache_get_value_int(i, "bprice5", bData[bid][bP][5]);
			cache_get_value_int(i, "bprice6", bData[bid][bP][6]);
			cache_get_value_int(i, "bprice7", bData[bid][bP][7]);
			cache_get_value_int(i, "bprice8", bData[bid][bP][8]);
			cache_get_value_int(i, "bprice9", bData[bid][bP][9]);
			cache_get_value_float(i, "pointx", bData[bid][bPoint][0]);
			cache_get_value_float(i, "pointy", bData[bid][bPoint][1]);
			cache_get_value_float(i, "pointz", bData[bid][bPoint][2]);
			cache_get_value_int(i, "visit", bData[bid][bVisit]);
			cache_get_value_int(i, "restock", bData[bid][bRestock]);
			Bisnis_Refresh(bid);
			Iter_Add(Bisnis, bid);
		}
		printf("[Bisnis] Number of Loaded: %d.", rows);
	}
}

//------------[ Bisnis Command ]------------
//Bisnis System
CMD:createbisnis(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
	
	new query[512];
	new bid = Iter_Free(Bisnis), address[128];
	if(bid == -1) return Error(playerid, "You cant create more door!");
	new price, type;
	if(sscanf(params, "dd", price, type)) return Usage(playerid, "/createbisnis [price] [type, 1.Fastfood 2.Market 3.Clothes 4.Ammunation]");
	format(bData[bid][bOwner], 128, "-");
	GetPlayerPos(playerid, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]);
	GetPlayerFacingAngle(playerid, bData[bid][bExtpos][3]);
	bData[bid][bPrice] = price;
	bData[bid][bType] = type;
	address = GetLocation(bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]);
	format(bData[bid][bName], 128, address);
	bData[bid][bLocked] = 1;
	bData[bid][bMoney] = 0;
	bData[bid][bProd] = 0;
	bData[bid][bP][0] = 0;
	bData[bid][bP][1] = 0;
	bData[bid][bP][2] = 0;
	bData[bid][bP][3] = 0;
	bData[bid][bP][4] = 0;
	bData[bid][bP][5] = 0;
	bData[bid][bP][6] = 0;
	bData[bid][bP][7] = 0;
	bData[bid][bP][8] = 0;
	bData[bid][bP][9] = 0;
	bData[bid][bInt] = 0;
	bData[bid][bIntpos][0] = 0;
	bData[bid][bIntpos][1] = 0;
	bData[bid][bIntpos][2] = 0;
	bData[bid][bIntpos][3] = 0;
	bData[bid][bVisit] = 0;
	bData[bid][bRestock] = 0;

	Bisnis_Type(bid);
    Bisnis_Refresh(bid);
	Iter_Add(Bisnis, bid);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO bisnis SET ID='%d', owner='%s', price='%d', type='%d', extposx='%f', extposy='%f', extposz='%f', extposa='%f', name='%s'", bid, bData[bid][bOwner], bData[bid][bPrice], bData[bid][bType], bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2], bData[bid][bExtpos][3], bData[bid][bName]);
	mysql_tquery(g_SQL, query, "OnBisnisCreated", "i", bid);
	return 1;
}

function OnBisnisCreated(bid)
{
	Bisnis_Save(bid);
	return 1;
}

CMD:gotobisnis(playerid, params[])
{
	new bid;
	if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);
		
	if(sscanf(params, "d", bid))
		return Usage(playerid, "/gotobisnis [id]");
	if(!Iter_Contains(Bisnis, bid)) return Error(playerid, "The Bisnis you specified ID of doesn't exist.");
	SetPlayerPosition(playerid, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2], bData[bid][bExtpos][3]);
    SetPlayerInterior(playerid, 0);
    SetPlayerVirtualWorld(playerid, 0);
	SendClientMessageEx(playerid, COLOR_WHITE, "You has teleport to bisnis id %d", bid);
	return 1;
}

CMD:editbisnis(playerid, params[])
{
    static
        bid,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", bid, type, string))
    {
        Usage(playerid, "/editbisnis [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, interior, locked, owner, point, price, type, product, restock, reset");
        return 1;
    }
    if((bid < 0 || bid >= MAX_BISNIS))
        return Error(playerid, "You have specified an invalid ID.");
	if(!Iter_Contains(Bisnis, bid)) return Error(playerid, "The bisnis you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]);
		GetPlayerFacingAngle(playerid, bData[bid][bExtpos][3]);
        House_Save(bid);
		House_Refresh(bid);

        SendAdminMessage(COLOR_RED, "%s has adjusted the location of bisnis ID: %d.", pData[playerid][pAdminname], bid);
    }
    else if(!strcmp(type, "interior", true))
    {
        GetPlayerPos(playerid, bData[bid][bIntpos][0], bData[bid][bIntpos][1], bData[bid][bIntpos][2]);
		GetPlayerFacingAngle(playerid, bData[bid][bIntpos][3]);
		bData[bid][bInt] = GetPlayerInterior(playerid);

        Bisnis_Save(bid);
		Bisnis_Refresh(bid);

        SendAdminMessage(COLOR_RED, "%s has adjusted the interior spawn of bisnis ID: %d.", pData[playerid][pAdminname], bid);
    }
    else if(!strcmp(type, "locked", true))
    {
        new locked;

        if(sscanf(string, "d", locked))
            return Usage(playerid, "/editbisnis [id] [locked] [0/1]");

        if(locked < 0 || locked > 1)
            return Error(playerid, "You must specify at least 0 or 1.");

        bData[bid][bLocked] = locked;
        Bisnis_Save(bid);
		Bisnis_Refresh(bid);

        if(locked) {
            SendAdminMessage(COLOR_RED, "%s has locked bisnis ID: %d.", pData[playerid][pAdminname], bid);
        }
        else {
            SendAdminMessage(COLOR_RED, "%s has unlocked bisnis ID: %d.", pData[playerid][pAdminname], bid);
        }
    }
    else if(!strcmp(type, "price", true))
    {
        new price;

        if(sscanf(string, "d", price))
            return Usage(playerid, "/editbisnis [id] [Price] [Amount]");

        bData[bid][bPrice] = price;

        Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has adjusted the price of bisnis ID: %d to %d.", pData[playerid][pAdminname], bid, price);
    }
	else if(!strcmp(type, "type", true))
    {
        new btype;

        if(sscanf(string, "d", btype))
            return Usage(playerid, "/editbisnis [id] [Type] [1.Fastfood 2.Market 3.Clothes 4.Ammunation]");

        bData[bid][bType] = btype;
		Bisnis_Type(bid);
        Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has adjusted the type of bisnis ID: %d to %d.", pData[playerid][pAdminname], bid, btype);
    }
	else if(!strcmp(type, "product", true))
    {
        new prod;

        if(sscanf(string, "d", prod))
            return Usage(playerid, "/editbisnis [id] [product] [Ammount]");

        bData[bid][bProd] = prod;
        Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has adjusted the product of bisnis ID: %d to %d.", pData[playerid][pAdminname], bid, prod);
    }
	else if(!strcmp(type, "restock", true))
    {
        new prod;

        if(sscanf(string, "d", prod))
            return Usage(playerid, "/editbisnis [id] [restock] [0-1]");
		
		if(prod == 0)
		{
			bData[bid][bRestock] = 0;
			Bisnis_Save(bid);
			Bisnis_Refresh(bid);
			SendAdminMessage(COLOR_RED, "%s has adjusted the restock of bisnis ID: %d to disable.", pData[playerid][pAdminname], bid);
		}
		else if(prod == 1)
		{
			bData[bid][bRestock] = 1;
			Bisnis_Save(bid);
			Bisnis_Refresh(bid);
			SendAdminMessage(COLOR_RED, "%s has adjusted the restock of bisnis ID: %d to enable.", pData[playerid][pAdminname], bid);
		}
		else return Error(playerid, "Hanya id 0-1");
    }
    else if(!strcmp(type, "owner", true))
    {
        new owners[MAX_PLAYER_NAME];

        if(sscanf(string, "s[32]", owners))
            return Usage(playerid, "/editbisnis [id] [owner] [player name] (use '-' to no owner)");

        format(bData[bid][bOwner], MAX_PLAYER_NAME, owners);
  
        Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has adjusted the owner of bisnis ID: %d to %s", pData[playerid][pAdminname], bid, owners);
    }
    else if(!strcmp(type, "reset", true))
    {
        Bisnis_Reset(bid);
		Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has reset bisnis ID: %d.", pData[playerid][pAdminname], bid);
    }
	else if(!strcmp(type, "point", true))
    {
		new Float:x, Float:y, Float:z;
        GetPlayerPos(playerid, x, y, z);
		bData[bid][bPoint][0] = x;
		bData[bid][bPoint][1] = y;
		bData[bid][bPoint][2] = z;
		Bisnis_Save(bid);
		Bisnis_Refresh(bid);
        SendAdminMessage(COLOR_RED, "%s has edit bisnis point ID: %d.", pData[playerid][pAdminname], bid);
    }
    return 1;
}
/*
CMD:buybisnis(playerid, params[])
{
	foreach(new id : Bisnis)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[id][bExtpos][0], bData[id][bExtpos][1], bData[id][bExtpos][2]))
		{
			if(bData[id][bPrice] > GetPlayerMoney(playerid)) return Error(playerid, "Not enough money, you can't afford this bisnis.");
			if(strcmp(bData[id][bOwner], "-")) return Error(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 2) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 3) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 1) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[id][bPrice]);
			GetPlayerName(playerid, bData[id][bOwner], MAX_PLAYER_NAME);
			bData[id][bVisit] = gettime();
			
			Bisnis_Refresh(id);
			Bisnis_Save(id);
		}
	}
	return 1;
}*/

CMD:lockbisnis(playerid, params[])
{
	foreach(new bid : Bisnis)
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]))
		{
			if(!Player_OwnsBisnis(playerid, bid)) return Error(playerid, "You don't own this bisnis.");
			if(!bData[bid][bLocked])
			{
				bData[bid][bLocked] = 1;
				Bisnis_Save(bid);

				InfoTD_MSG(playerid, 4000, "You have ~r~locked~w~ your bisnis!");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
			else
			{
				bData[bid][bLocked] = 0;
				Bisnis_Save(bid);

				InfoTD_MSG(playerid, 4000,"You have ~g~unlocked~w~ your bisnis!");
				PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
			}
		}
	}
	return 1;
}

CMD:mybis(playerid)
{
	if(GetOwnedBisnis(playerid) == -1) return Error(playerid, "You don't have a bisnis.");
	//if(!Player_OwnsBusiness(playerid, id)) return Error(playerid, "You don't own this business.");
	new hid, _tmpstring[128], count = GetOwnedBisnis(playerid), CMDSString[512];
	CMDSString = "";
	new lock[128];
	Loop(itt, (count + 1), 1)
	{
	    hid = ReturnPlayerBisnisID(playerid, itt);
		if(hData[hid][hLocked] == 1)
		{
			lock = "{FF0000}Locked";
		
		}
		else
		{
			lock = "{00FF00}Unlocked";
		}
		if(itt == count)
		{
		    format(_tmpstring, sizeof(_tmpstring), ""LB_E"%d.\t{FFFF2A}%s   (%s)\n", itt, bData[hid][bName], lock);
		}
		else format(_tmpstring, sizeof(_tmpstring), ""LB_E"%d.\t{FFFF2A}%s  (%s)\n", itt, bData[hid][bName], lock);
		strcat(CMDSString, _tmpstring);
	}
	Dialog_Show(playerid, DIALOG_MY_BISNIS, DIALOG_STYLE_LIST, "{FF0000}XG:RP: {0000FF}Bisnis", CMDSString, "Select", "Cancel");
	return 1;
}

CMD:bm(playerid, params[])
{
	if(!Player_OwnsBisnis(playerid, pData[playerid][pInBiz])) return Error(playerid, "You don't own this bisnis.");
    Dialog_Show(playerid, BISNIS_MENU, DIALOG_STYLE_LIST, "Bisnis Menu","Bisnis Info\nChange Name\nBisnis Vault\nProduct Menu\nRequest Restock","Next","Close");
    return 1;
}

//--------------[ Dialog Bisnis ]-----------
Dialog:DIALOG_MY_BISNIS(playerid, response, listitem, inputtext[])
{
	if(!response) return true;
	SetPVarInt(playerid, "ClickedBisnis", ReturnPlayerBisnisID(playerid, (listitem + 1)));
	Dialog_Show(playerid, DIALOG_BISNIS_INFO, DIALOG_STYLE_LIST, "{FF0000}XG:RP {0000FF}Bisnis", "Show Information\nTrack Bisnis", "Select", "Cancel");
	return 1;
}

Dialog:DIALOG_BISNIS_INFO(playerid, response, listitem, inputtext[])
{
	if(!response) return true;
	new bid = GetPVarInt(playerid, "ClickedBisnis");
	switch(listitem)
	{
		case 0:
		{
			new line9[900];
			new lock[128], type[128];
			if(bData[bid][bLocked] == 1)
			{
				lock = "{FF0000}Locked";
		
			}
			else
			{
				lock = "{00FF00}Unlocked";
			}
			if(bData[bid][bType] == 1)
			{
				type = "Fast Food";
		
			}
			else if(bData[bid][bType] == 2)
			{
				type = "Market";
			}
			else if(bData[bid][bType] == 3)
			{
				type = "Clothes";
			}
			else if(bData[bid][bType] == 4)
			{
				type = "Ammunation";
			}
			else
			{
				type = "Unknow";
			}
			format(line9, sizeof(line9), "Bisnis ID: %d\nBisnis Owner: %s\nBisnis Name: %s\nBisnis Price: %s\nBisnis Type: %s\nBisnis Status: %s",
			bid, bData[bid][bOwner], bData[bid][bName], FormatMoney(bData[bid][bPrice]), type, lock);

			ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Bisnis Info", line9, "Close","");
		}
		case 1:
		{
			pData[playerid][pTrackBisnis] = 1;
			SetPlayerCheckpoint(playerid, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2], 4.0);
			Info(playerid, "Ikuti checkpoint untuk menemukan bisnis anda!");
		}
	}
	return 1;
}

Dialog:BISNIS_MENU(playerid, response, listitem, inputtext[])
{   
	new bid = pData[playerid][pInBiz];
	new lock[128], mstr[248];
	if(bData[bid][bLocked] == 1)
	{
		lock = "Locked";
	}
	else
	{
		lock = "Unlocked";
	}
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                format(mstr,sizeof(mstr),"Bisnis ID %d", bid);
                Dialog_Show(playerid, BISNIS_INFO, DIALOG_STYLE_TABLIST, mstr,"Bisnis Name:\t%s\nBisnis Locked:\t%s\nBisnis Product:\t%d\nBisnis Vault:\t%s","Back","Close", bData[bid][bName], lock, bData[bid][bProd], FormatMoney(bData[bid][bMoney]));
            }
            case 1: Dialog_Show(playerid, BISNIS_NAME, DIALOG_STYLE_INPUT,"Bisnis Name","Nama sebelumnya: %s\n\nMasukkan nama bisnis yang kamu inginkan\nMaksimal 32 karakter untuk nama bisnis","Done","Back", bData[bid][bName]);
            case 2: Dialog_Show(playerid, BISNIS_VAULT, DIALOG_STYLE_LIST,"Bisnis Vault","Deposit\nWithdraw","Next","Back");
            case 3:
            {
                Bisnis_ProductMenu(playerid, bid);
            }
			case 4:
			{
				if(bData[bid][bProd] > 20)
					return Error(playerid, "Bisnis ini masih memiliki cukup produck.");
				if(bData[bid][bMoney] < 50000)
					return Error(playerid, "Setidaknya anda mempunyai uang dalam bisnis anda senilai $50.000 untuk membeli product.");
				bData[bid][bRestock] = 1;
				Info(playerid, "Anda berhasil me-request untuk mengisi stock product, harap tunggu beberapa saat.");
			}
        }
    }
    return 1;
}

Dialog:BISNIS_INFO(playerid, response, listitem, inputtext[])
{
    if(response)
        return callcmd::bm(playerid, "\0");

    return 1;
}

Dialog:BISNIS_NAME(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        new bid = pData[playerid][pInBiz];

        if(!Player_OwnsBisnis(playerid, pData[playerid][pInBiz])) return Error(playerid, "You don't own this bisnis.");
        
        if (isnull(inputtext))
            return Dialog_Show(playerid, BISNIS_NAME, DIALOG_STYLE_INPUT,"Bisnis Name",""RED_E"NOTE: "WHITE_E"Nama Bisnis tidak di perbolehkan kosong!\n\n"WHITE_E"Nama sebelumnya: %s\n\nMasukkan nama Bisnis yang kamu inginkan\nMaksimal 32 karakter untuk nama Bisnis","Done","Back", bData[bid][bName]);

        if(strlen(inputtext) > 32 || strlen(inputtext) < 5)
            return Dialog_Show(playerid, BISNIS_NAME, DIALOG_STYLE_INPUT,"Bisnis Name",""RED_E"NOTE: "WHITE_E"Nama Bisnis harus 5 sampai 32 karakter.\n\n"WHITE_E"Nama sebelumnya: %s\n\nMasukkan nama Bisnis yang kamu inginkan\nMaksimal 32 karakter untuk nama Bisnis","Done","Back", bData[bid][bName]);
        
        format(bData[bid][bName], 32, ColouredText(inputtext));

        Bisnis_Refresh(bid);
        Bisnis_Save(bid);

        Servers(playerid, "Bisnis name set to: \"%s\".", bData[bid][bName]);
    }
    else
        return callcmd::bm(playerid, "\0");
    return 1;
}

Dialog:BISNIS_VAULT(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        switch(listitem)
        {
            case 0:
            {
                Dialog_Show(playerid, Bisnis_Deposit, DIALOG_STYLE_INPUT, "Deposit", "Uang kamu: %s.\n\nMasukkan berapa banyak uang yang akan kamu simpan di dalam bisnis ini", "Deposit", "Back", FormatMoney(GetPlayerMoney(playerid)));
            }
            case 1:
            {
                Dialog_Show(playerid, Bisnis_Withdraw, DIALOG_STYLE_INPUT,"Withdraw","Business Vault: %s\n\nMasukkan berapa banyak uang yang akan kamu ambil di dalam bisnis ini","Withdraw","Back", FormatMoney(bData[pData[playerid][pInBiz]][bMoney]));
            }
        }
    }
    return 1;
}

Dialog:Bisnis_Withdraw(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        new bid = pData[playerid][pInBiz];
		new amount = floatround(strval(inputtext));
        if(amount < 1 || amount > bData[bid][bMoney])
            return Error(playerid, "Invalid amount specified!");

        bData[bid][bMoney] -= amount;
        Bisnis_Save(bid);

        GivePlayerMoneyEx(playerid, amount);

        SendClientMessageEx(playerid, COLOR_LBLUE,"BUSINESS: "WHITE_E"You have withdrawn "GREEN_E"%s "WHITE_E"from the business vault.", FormatMoney(strval(inputtext)));
    }
    else
        Dialog_Show(playerid, BISNIS_VAULT, DIALOG_STYLE_LIST,"Business Vault","Deposit\nWithdraw","Next","Back");
    return 1;
}

Dialog:Bisnis_Deposit(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        new bid = pData[playerid][pInBiz];
        new amount = floatround(strval(inputtext));
        if(amount < 1 || amount > GetPlayerMoney(playerid))
            return Error(playerid, "Invalid amount specified!");

        bData[bid][bMoney] += amount;
        Bisnis_Save(bid);

        GivePlayerMoneyEx(playerid, -amount);
        
        SendClientMessageEx(playerid, COLOR_LBLUE,"BUSINESS: "WHITE_E"You have deposit "GREEN_E"%s "WHITE_E"into the business vault.", FormatMoney(strval(inputtext)));
    }
    else
        Dialog_Show(playerid, BISNIS_VAULT, DIALOG_STYLE_LIST,"Business Vault","Deposit\nWithdraw","Next","Back");
    return 1;
}

Dialog:BuyProd(playerid, response, listitem, inputtext[])
{
    static
        bizid = -1,
        price;

    if((bizid = pData[playerid][pInBiz]) != -1 && response)
    {
        price = bData[bizid][bP][listitem];

        if(GetPlayerMoney(playerid) < price)
            return Error(playerid, "Not enough money!");

        if(bData[bizid][bProd] < 1)
            return Error(playerid, "This business is out of stock product.");
			
		new Float:health;
		GetPlayerHealth(playerid,health);
        if(bData[bizid][bType] == 1)
        {
            switch(listitem)
            {
				case 0:
				{
                    GivePlayerMoneyEx(playerid, -price);
					SetPlayerHealthEx(playerid, health+30);
					pData[playerid][pHunger] += 35;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli makanan seharga %s dan langsung memakannya.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 1:
				{
					GivePlayerMoneyEx(playerid, -price);
					SetPlayerHealthEx(playerid, health+45);
					pData[playerid][pHunger] += 50;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli makanan seharga %s dan langsung memakannya.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 2:
				{
					GivePlayerMoneyEx(playerid, -price);
					SetPlayerHealthEx(playerid, health+70);
					pData[playerid][pHunger] += 75;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli makanan seharga %s dan langsung memakannya.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 3:
				{
					GivePlayerMoneyEx(playerid, -price);
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
					SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DRINK_SPRUNK);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli minuman seharga %s.", ReturnName(playerid), FormatMoney(price));
					SetPVarInt(playerid, "UsingSprunk", 1);
				}
			}
		}
		else if(bData[bizid][bType] == 2)
		{
			switch(listitem)
            {
				case 0:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pSnack]++;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli snack seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 1:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pSprunk]++;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Sprunk seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 2:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pGas]++;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Gas Fuel seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 3:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pBandage]++;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Perban seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
			}
		}
		else if(bData[bizid][bType] == 3)
		{
			switch(listitem)
            {
				case 0:
				{
					switch(pData[playerid][pGender])
					{
						case 1: ShowModelSelectionMenu(playerid, MaleSkins, "Choose your skin");
						case 2: ShowModelSelectionMenu(playerid, FemaleSkins, "Choose your skin");
					}
				}
				case 1:
				{
					new string[248];
					if(pToys[playerid][0][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 1\n");
					}
					else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

					if(pToys[playerid][1][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 2\n");
					}
					else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

					if(pToys[playerid][2][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 3\n");
					}
					else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

					if(pToys[playerid][3][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 4\n");
					}
					else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");

					/*if(pToys[playerid][4][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 5\n");
					}
					else strcat(string, ""dot"Slot 5 "RED_E"(Used)\n");

					if(pToys[playerid][5][toy_model] == 0)
					{
						strcat(string, ""dot"Slot 6\n");
					}
					else strcat(string, ""dot"Slot 6 "RED_E"(Used)\n");*/

					Dialog_Show(playerid, TOY_BUY, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", string, "Select", "Cancel");
				}
				case 2:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pMask] = 1;
					pData[playerid][pMaskID] = random(90000) + 10000;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli mask seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 3:
				{
					GivePlayerMoneyEx(playerid, -price);
					pData[playerid][pHelmet] = 1;
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Helmet seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
			}
		}
		else if(bData[bizid][bType] == 4)
		{
			switch(listitem)
            {
				case 0:
				{
					GivePlayerMoneyEx(playerid, -price);
					SetPlayerArmourEx(playerid, 97);
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Armour protect seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd]--;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 1:
				{
					GivePlayerMoneyEx(playerid, -price);
					GivePlayerWeaponEx(playerid, 24, 30);
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Desert Eagle seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd] -= 30;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 2:
				{
					GivePlayerMoneyEx(playerid, -price);
					GivePlayerWeaponEx(playerid, 25, 40);
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli Shotgun seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd] -= 40;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
				case 3:
				{
					GivePlayerMoneyEx(playerid, -price);
					GivePlayerWeaponEx(playerid, 30, 60);
                    SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli AK-47 seharga %s.", ReturnName(playerid), FormatMoney(price));
                    bData[bizid][bProd] -= 60;
                    bData[bizid][bMoney] += price;
                    Bisnis_Save(bizid);
				}
			}
		}
	}
	return 1;
}

Dialog:EditProduct(playerid, response, listitem, inputtext[])
{
	if(Player_OwnsBisnis(playerid, pData[playerid][pInBiz]))
    {
        if(response)
        {
            static
                item[24];

            strmid(item, inputtext, 0, strfind(inputtext, "-") - 1);
            strpack(pData[playerid][pEditingItem], item, 32 char);

            pData[playerid][pProductModify] = listitem;
            Dialog_Show(playerid, PriceSet, DIALOG_STYLE_INPUT, "Business: Set Price", "Please enter the new product price for \"%s\":", "Modify", "Back", item);
        }
        else
            return callcmd::bm(playerid, "\0");
    }
    return 1;
}

Dialog:PriceSet(playerid, response, listitem, inputtext[])
{
    static
        item[32];
	new bizid = pData[playerid][pInBiz];
	if(Player_OwnsBisnis(playerid, pData[playerid][pInBiz]))
    {
        if(response)
        {
            strunpack(item, pData[playerid][pEditingItem]);

            if(isnull(inputtext))
                return Dialog_Show(playerid, PriceSet, DIALOG_STYLE_INPUT, "Business: Set Price", "Please enter the new product price for \"%s\":", "Modify", "Back", item);

            if(strval(inputtext) < 1 || strval(inputtext) > 50000)
                return Dialog_Show(playerid, PriceSet, DIALOG_STYLE_INPUT, "Business: Set Price", "Please enter the new product price for \"%s\" ($1 to $50,000):", "Modify", "Back", item);

            bData[bizid][bP][pData[playerid][pProductModify]] = strval(inputtext);
            Bisnis_Save(bizid);

            Servers(playerid, "You have adjusted the price of %s to: %s!", item, FormatMoney(strval(inputtext)));
            Bisnis_ProductMenu(playerid, bizid);
        }
        else
        {
            Bisnis_ProductMenu(playerid, bizid);
        }
    }
    return 1;
}