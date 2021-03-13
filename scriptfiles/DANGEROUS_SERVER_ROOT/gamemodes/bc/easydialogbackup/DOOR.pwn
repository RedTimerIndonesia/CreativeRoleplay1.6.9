//Door System By Dandy Bagus Prasetyo
#define	MAX_DOOR	500

enum ddoor
{
	dName[128],
	dPass[32],
	dIcon,
	dLocked,
	dAdmin,
	dVip,
	dFaction,
	dFamily,
	dCustom,
	dExtvw,
	dExtint,
	Float:dExtpos[4],
	dIntvw,
	dIntint,
	Float:dIntpos[4],
	//NotSave
	Text3D:dLabelext,
	Text3D:dLabelint,
	dPickupext,
	dPickupint
};

new dData[MAX_DOOR][ddoor],
	Iterator: Doors<MAX_DOOR>;
	

Doors_Save(id)
{
	new dquery[2048];
	mysql_format(g_SQL, dquery, sizeof(dquery), "UPDATE doors SET name='%s', password='%s', icon='%d', locked='%d', admin='%d', vip='%d', faction='%d', family='%d', custom='%d', extvw='%d', extint='%d', extposx='%f', extposy='%f', extposz='%f', extposa='%f', intvw='%d', intint='%d', intposx='%f', intposy='%f', intposz='%f', intposa='%f' WHERE ID='%d'",
	dData[id][dName], dData[id][dPass], dData[id][dIcon], dData[id][dLocked], dData[id][dAdmin], dData[id][dVip], dData[id][dFaction], dData[id][dFamily], dData[id][dCustom], dData[id][dExtvw], dData[id][dExtint], dData[id][dExtpos][0], dData[id][dExtpos][1], dData[id][dExtpos][2], dData[id][dExtpos][3], dData[id][dIntvw], dData[id][dIntint],
	dData[id][dIntpos][0], dData[id][dIntpos][1], dData[id][dIntpos][2], dData[id][dIntpos][3], id);
	mysql_tquery(g_SQL, dquery);
	return 1;
}

Doors_Updatelabel(id)
{
	if(id != -1)
	{
		if(IsValidDynamic3DTextLabel(dData[id][dLabelext]))
            DestroyDynamic3DTextLabel(dData[id][dLabelext]);

        if(IsValidDynamicPickup(dData[id][dPickupext]))
            DestroyDynamicPickup(dData[id][dPickupext]);

        if(IsValidDynamic3DTextLabel(dData[id][dLabelint]))
            DestroyDynamic3DTextLabel(dData[id][dLabelint]);

        if(IsValidDynamicPickup(dData[id][dPickupint]))
            DestroyDynamicPickup(dData[id][dPickupint]);
		
		new mstr[512];
		format(mstr,sizeof(mstr),"[ID: %d]\n{FFFFFF}%s\n{FFFFFF}Press {FF0000}ENTER {FFFFFF}to enter", id, dData[id][dName]);
		dData[id][dPickupext] = CreateDynamicPickup(19130, 23, dData[id][dExtpos][0], dData[id][dExtpos][1], dData[id][dExtpos][2], dData[id][dExtvw], dData[id][dExtint]);
		dData[id][dLabelext] = CreateDynamic3DTextLabel(mstr, COLOR_YELLOW, dData[id][dExtpos][0], dData[id][dExtpos][1], dData[id][dExtpos][2]+0.35, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, dData[id][dExtvw], dData[id][dExtint]);

        if(dData[id][dIntpos][0] != 0.0 && dData[id][dIntpos][1] != 0.0 && dData[id][dIntpos][2] != 0.0)
        {
            format(mstr,sizeof(mstr),"[ID: %d]\n{FFFFFF}%s\n{FFFFFF}Press {FF0000}ENTER {FFFFFF}to exit", id, dData[id][dName]);

            dData[id][dLabelint] = CreateDynamic3DTextLabel(mstr, COLOR_YELLOW, dData[id][dIntpos][0], dData[id][dIntpos][1], dData[id][dIntpos][2]+0.7, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, dData[id][dIntvw], dData[id][dIntint]);
            dData[id][dPickupint] = CreateDynamicPickup(19130, 23, dData[id][dIntpos][0], dData[id][dIntpos][1], dData[id][dIntpos][2], dData[id][dIntvw], dData[id][dIntint], -1, 7);
        }
	}
}

/*LoadDoors()
{
	mysql_tquery(D_SQL, "SELECT ID,name,password,icon,locked,admin,vip,faction,family,custom,extvw,extint,extposx,extposy,extposz,extposa,intvw,intint,intposx,intposy,intposz,intposa FROM doors ORDER BY ID", "LoadDoorsData");
}*/

function OnDoorsCreated(id)
{
	Doors_Save(id);
	Doors_Updatelabel(id);
	return 1;
}

function LoadDoors()
{
    new rows = cache_num_rows();
 	if(rows)
  	{
   		new did, name[128], password[128];
		for(new i; i < rows; i++)
		{
  			cache_get_value_int(i, "ID", did);
	    	cache_get_value(i, "name", name);
			format(dData[did][dName], 128, name);
		    cache_get_value(i, "password", password);
			format(dData[did][dPass], 128, password);
		    cache_get_value_int(i, "icon", dData[did][dIcon]);
		    cache_get_value_int(i, "locked", dData[did][dLocked]);
		    cache_get_value_int(i, "admin", dData[did][dAdmin]);
		    cache_get_value_int(i, "vip", dData[did][dVip]);
		    cache_get_value_int(i, "faction", dData[did][dFaction]);
		    cache_get_value_int(i, "family", dData[did][dFamily]);
		    cache_get_value_int(i, "custom", dData[did][dCustom]);
		    cache_get_value_int(i, "extvw", dData[did][dExtvw]);
		    cache_get_value_int(i, "extint", dData[did][dExtint]);
		    cache_get_value_float(i, "extposx", dData[did][dExtpos][0]);
			cache_get_value_float(i, "extposy", dData[did][dExtpos][1]);
			cache_get_value_float(i, "extposz", dData[did][dExtpos][2]);
			cache_get_value_float(i, "extposa", dData[did][dExtpos][3]);
			cache_get_value_int(i, "intvw", dData[did][dIntvw]);
			cache_get_value_int(i, "intint", dData[did][dIntint]);
			cache_get_value_float(i, "intposx", dData[did][dIntpos][0]);
			cache_get_value_float(i, "intposy", dData[did][dIntpos][1]);
			cache_get_value_float(i, "intposz", dData[did][dIntpos][2]);
			cache_get_value_float(i, "intposa", dData[did][dIntpos][3]);
			
			Iter_Add(Doors, did);
			Doors_Updatelabel(did);
	    }
	    printf("[Doors] Number of Doors loaded: %d.", rows);
	}
}

//Door System
CMD:createdoor(playerid, params[])
{
	if(pData[playerid][pAdmin] < 3)
		return PermissionError(playerid);
	
	new did = Iter_Free(Doors), mstr[128], query[248];
	if(did == -1) return Error(playerid, "You cant create more door!");
	new name[128];
	if(sscanf(params, "s[128]", name)) return Usage(playerid, "/createdoor [name]");
	format(dData[did][dName], 128, name);
	GetPlayerPos(playerid, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2]);
	GetPlayerFacingAngle(playerid, dData[did][dExtpos][3]);
	dData[did][dExtvw] = GetPlayerVirtualWorld(playerid);
	dData[did][dExtint] = GetPlayerInterior(playerid);
	dData[did][dPass][0] = 0;
	dData[did][dIcon] = 19130;
	dData[did][dLocked] = 0;
	dData[did][dAdmin] = 0;
	dData[did][dVip] = 0;
	dData[did][dFaction] = 0;
	dData[did][dFamily] = -1;
	dData[did][dCustom] = 0;
	dData[did][dIntvw] = 0;
	dData[did][dIntint] = 0;
	dData[did][dIntpos][0] = 0;
	dData[did][dIntpos][1] = 0;
	dData[did][dIntpos][2] = 0;
	dData[did][dIntpos][3] = 0;
	
	format(mstr,sizeof(mstr),"[ID: %d]\n{FFFFFF}%s\n{FFFFFF}Press {FF0000}ENTER {FFFFFF}to enter", did, dData[did][dName]);
	dData[did][dPickupext] = CreateDynamicPickup(19130, 23, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2], dData[did][dExtvw], dData[did][dExtint]);
	dData[did][dLabelext] = CreateDynamic3DTextLabel( mstr, COLOR_YELLOW, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2]+0.35, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, dData[did][dExtvw], dData[did][dExtint]);
    Doors_Updatelabel(did);
	Iter_Add(Doors, did);

	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO doors SET ID=%d, extvw=%d, extint=%d, extposx=%f, extposy=%f, extposz=%f, extposa=%f, name='%s'", did, dData[did][dExtvw], dData[did][dExtint], dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2], dData[did][dExtpos][3], name);
	mysql_tquery(g_SQL, query, "OnDoorsCreated", "i", did);
	return 1;
}

CMD:gotodoor(playerid, params[])
{
	new did;
	if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);
		
	if(sscanf(params, "d", did))
		return Usage(playerid, "/gotodoor [id]");
	if(!Iter_Contains(Doors, did)) return Error(playerid, "The doors you specified ID of doesn't exist.");
	SetPlayerPosition(playerid, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2], dData[did][dExtpos][3]);
    SetPlayerInterior(playerid, dData[did][dExtint]);
    SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
	pData[playerid][pInDoor] = -1;
	pData[playerid][pInHouse] = -1;
	pData[playerid][pInBiz] = -1;
	SendClientMessageEx(playerid, COLOR_WHITE, "You has teleport to door id %d", did);
	return 1;
}
CMD:editdoor(playerid, params[])
{
    static
        did,
        type[24],
        string[128];

    if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", did, type, string))
    {
        Usage(playerid, "/editdoor [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, interior, password, name, locked, admin, vip, faction, family, custom, virtual");
        return 1;
    }
    if((did < 0 || did >= MAX_DOOR))
        return Error(playerid, "You have specified an invalid entrance ID.");
	if(!Iter_Contains(Doors, did)) return Error(playerid, "The doors you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2]);
		GetPlayerFacingAngle(playerid, dData[did][dExtpos][3]);

        dData[did][dExtvw] = GetPlayerVirtualWorld(playerid);
		dData[did][dExtint] = GetPlayerInterior(playerid);
        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has adjusted the location of entrance ID: %d.", pData[playerid][pAdminname], did);
    }
    else if(!strcmp(type, "interior", true))
    {
        GetPlayerPos(playerid, dData[did][dIntpos][0], dData[did][dIntpos][1], dData[did][dIntpos][2]);
		GetPlayerFacingAngle(playerid, dData[did][dIntpos][3]);

        dData[did][dIntvw] = GetPlayerVirtualWorld(playerid);
		dData[did][dIntint] = GetPlayerInterior(playerid);
        Doors_Save(did);
		Doors_Updatelabel(did);

       /*foreach (new i : Player)
        {
            if(pData[i][pEntrance] == EntranceData[id][entranceID])
            {
                SetPlayerPos(i, EntranceData[id][entranceInt][0], EntranceData[id][entranceInt][1], EntranceData[id][entranceInt][2]);
                SetPlayerFacingAngle(i, EntranceData[id][entranceInt][3]);

                SetPlayerInterior(i, EntranceData[id][entranceInterior]);
                SetCameraBehindPlayer(i);
            }
        }*/
        SendAdminMessage(COLOR_RED, "%s has adjusted the interior spawn of entrance ID: %d.", pData[playerid][pAdminname], did);
    }
    else if(!strcmp(type, "custom", true))
    {
        new status;

        if(sscanf(string, "d", status))
            return Usage(playerid, "/editdoor [id] [custom] [0/1]");

        if(status < 0 || status > 1)
            return Error(playerid, "You must specify at least 0 or 1.");

        dData[did][dCustom] = status;
        Doors_Save(did);
		Doors_Updatelabel(did);

        if(status) {
            SendAdminMessage(COLOR_RED, "%s has enabled custom interior mode for entrance ID: %d.", pData[playerid][pAdminname], did);
        }
        else {
            SendAdminMessage(COLOR_RED, "%s has disabled custom interior mode for entrance ID: %d.", pData[playerid][pAdminname], did);
        }
    }
    else if(!strcmp(type, "virtual", true))
    {
        new worldid;

        if(sscanf(string, "d", worldid))
            return Usage(playerid, "/editdoor [id] [virtual] [interior world]");

        dData[did][dExtvw] = worldid;

        Doors_Save(did);
		Doors_Updatelabel(did);
        SendAdminMessage(COLOR_RED, "%s has adjusted the virtual of entrance ID: %d to %d.", pData[playerid][pAdminname], did, worldid);
    }
    else if(!strcmp(type, "password", true))
    {
        new password[32];

        if(sscanf(string, "s[32]", password))
            return Usage(playerid, "/editdoor [id] [password] [entrance pass] (use 'none' to disable)");

        if(!strcmp(password, "none", true)) {
            dData[did][dPass][0] = 0;
        }
        else {
            format(dData[did][dPass], 32, password);
        }
        Doors_Save(did);
		Doors_Updatelabel(did);
        SendAdminMessage(COLOR_RED, "%s has adjusted the password of entrance ID: %d to %s", pData[playerid][pAdminname], did, password);
    }
    else if(!strcmp(type, "locked", true))
    {
        new locked;

        if(sscanf(string, "d", locked))
            return Usage(playerid, "/editdoor [id] [locked] [locked 0/1]");

        if(locked < 0 || locked > 1)
            return Error(playerid, "Invalid value. Use 0 for unlocked and 1 for locked.");

        dData[did][dLocked] = locked;
        Doors_Save(did);
		Doors_Updatelabel(did);

        if(locked) {
            SendAdminMessage(COLOR_RED, "%s has locked entrance ID: %d.", pData[playerid][pAdminname], did);
        } else {
            SendAdminMessage(COLOR_RED, "%s has unlocked entrance ID: %d.", pData[playerid][pAdminname], did);
        }
    }
    else if(!strcmp(type, "name", true))
    {
        new name[128];

        if(sscanf(string, "s[128]", name))
            return Usage(playerid, "/editdoor [id] [name] [new name]");

        format(dData[did][dName], 128, ColouredText(name));

        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has adjusted the name of entrance ID: %d to \"%s\".", pData[playerid][pAdminname], did, ColouredText(name));
    }
	else if(!strcmp(type, "admin", true))
    {
        new level;

        if(sscanf(string, "d", level))
            return Usage(playerid, "/editdoor [id] [admin] [level]");

        if(level < 0 || level > 5)
            return Error(playerid, "Invalid value. Use 0 - 5 for level.");

        dData[did][dAdmin] = level;
        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has set entrance ID: %d to admin level %d.", pData[playerid][pAdminname], did, level);
    }
	else if(!strcmp(type, "vip", true))
    {
        new level;

        if(sscanf(string, "d", level))
            return Usage(playerid, "/editdoor [id] [VIP] [level]");

        if(level < 0 || level > 3)
            return Error(playerid, "Invalid value. Use 0 - 3 for level.");

        dData[did][dVip] = level;
        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has set entrance ID: %d to VIP level %d.", pData[playerid][pAdminname], did, level);
    }
	else if(!strcmp(type, "faction", true))
    {
        new fid;

        if(sscanf(string, "d", fid))
            return Usage(playerid, "/editdoor [id] [faction] [faction id]");

        if(fid < 0 || fid > 4)
            return Error(playerid, "Invalid value. Use 0 - 4 for type.");

        dData[did][dFaction] = fid;
        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has set entrance ID: %d to faction id %d.", pData[playerid][pAdminname], did, fid);
    }
	else if(!strcmp(type, "family", true))
    {
        new fid;

        if(sscanf(string, "d", fid))
            return Usage(playerid, "/editdoor [id] [family] [family id]");

        if(fid < 0 || fid > 9)
            return Error(playerid, "Invalid value. Use 0 - 9 for family id.");

        dData[did][dFamily] = fid;
        Doors_Save(did);
		Doors_Updatelabel(did);

        SendAdminMessage(COLOR_RED, "%s has set entrance ID: %d to family id %d.", pData[playerid][pAdminname], did, fid);
    }
    return 1;
}