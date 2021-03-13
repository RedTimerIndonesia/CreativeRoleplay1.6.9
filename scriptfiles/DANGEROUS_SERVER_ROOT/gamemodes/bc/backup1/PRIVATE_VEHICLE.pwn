
//Private Vehicle Player System Define

#define MAX_PRIVATE_VEHICLE 1000
#define MAX_PLAYER_VEHICLE 3
//new Float: VehicleFuel[MAX_VEHICLES] = 100.0;
new bool:VehicleHealthSecurity[MAX_VEHICLES] = false, Float:VehicleHealthSecurityData[MAX_VEHICLES] = 1000.0;

enum pvdata
{
	cID,
	cOwner,
	cModel,
	cColor1,
	cColor2,
	cPaintJob,
	cLocked,
	cPlate[15],
	cPrice,
	Float:cHealth,
	cFuel,
	Float:cPos[4],
	cInt,
	cVw,
	cDamage[4],
	cMod[17],
	cVeh
};
new pvData[MAX_PRIVATE_VEHICLE][pvdata],
	Iterator:PVehicles<MAX_PRIVATE_VEHICLE>;

//Private Vehicle Player System Native

new const g_arrVehicleNames[][] = {
        "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
        "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
        "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
        "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
        "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
        "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
        "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
        "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
        "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
        "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
        "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
        "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
        "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
        "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
        "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
        "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
        "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
        "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
        "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
        "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Car", "SFPD Car", "LVPD Car",
        "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
        "Boxville", "Tiller", "Utility Trailer"
};

GetEngineStatus(vehicleid)
{
    static
        engine,
        lights,
        alarm,
        doors,
        bonnet,
        boot,
        objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

    if(engine != 1)
        return 0;

    return 1;
}

GetHoodStatus(vehicleid)
{
    static
        engine,
        lights,
        alarm,
        doors,
        bonnet,
        boot,
        objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

    if(bonnet != 1)
        return 0;

    return 1;
}

GetTrunkStatus(vehicleid)
{
    static
        engine,
        lights,
        alarm,
        doors,
        bonnet,
        boot,
        objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

    if(boot != 1)
        return 0;

    return 1;
}

GetLightStatus(vehicleid)
{
    static
        engine,
        lights,
        alarm,
        doors,
        bonnet,
        boot,
        objective;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

    if(lights != 1)
        return 0;

    return 1;
}


GetNearestVehicle(playerid)
{
    new
        Float:fX,
        Float:fY,
        Float:fZ,
        Float:fSX,
        Float:fSY,
        Float:fSZ,
        Float:fRadius;

    for (new i = 1, j = GetVehiclePoolSize(); i <= j; i ++)
    {
        if(!IsVehicleStreamedIn(i, playerid))
        {
            continue;
        }
        else
        {
            GetVehiclePos(i, fX, fY, fZ);

            GetVehicleModelInfo(GetVehicleModel(i), VEHICLE_MODEL_INFO_SIZE, fSX, fSY, fSZ);

            fRadius = floatsqroot((fSX + fSX) + (fSY + fSY));

            if(IsPlayerInRangeOfPoint(playerid, fRadius, fX, fY, fZ) && GetPlayerVirtualWorld(playerid) == GetVehicleVirtualWorld(i))
            {
                return i;
            }
        }
    }
    return INVALID_VEHICLE_ID;
}

GetVehicleNameByModel(model)
{
    new
        name[32] = "None";

    if(model < 400 || model > 611)
        return name;

    format(name, sizeof(name), g_arrVehicleNames[model - 400]);
    return name;
}

GetVehicleNameByVehicle(vehicleid)
{
    new
        model = GetVehicleModel(vehicleid),
        name[32] = "None";

    if(model < 400 || model > 611)
        return name;

    format(name, sizeof(name), g_arrVehicleNames[model - 400]);
    return name;
}

GetVehicleModelByName(const name[])
{
    if(IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
        return strval(name);

    for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
    {
        if(strfind(g_arrVehicleNames[i], name, true) != -1)
        {
                    return i + 400;
        }
    }
    return 0;
}

Vehicle_IsOwner(playerid, carid)
{
    if(!pData[playerid][IsLoggedIn] || pData[playerid][pID] == -1)
        return 0;

    if((Iter_Contains(PVehicles, carid) && pvData[carid][cOwner] != 0) && pvData[carid][cOwner] == pData[playerid][pID])
        return 1;

    return 0;
}

Vehicle_Nearest(playerid, Float:range = 3.0)
{
    static
        Float:fX,
        Float:fY,
        Float:fZ;

    for(new i = 0; i != MAX_PRIVATE_VEHICLE; i++) if(Iter_Contains(PVehicles, i)) {
        GetVehiclePos(pvData[i][cVeh], fX, fY, fZ);

        if(IsPlayerInRangeOfPoint(playerid, range, fX, fY, fZ)) {
            return i;
        }
    }
    return -1;
}

Vehicle_GetStatus(carid)
{
    GetVehicleDamageStatus(pvData[carid][cVeh], pvData[carid][cDamage][0], pvData[carid][cDamage][1], pvData[carid][cDamage][2], pvData[carid][cDamage][3]);

    GetVehicleHealth(pvData[carid][cVeh], pvData[carid][cHealth]);
	pvData[carid][cFuel] = GetVehicleFuel(pvData[carid][cVeh]);
    if(pvData[carid][cOwner])
    {
        GetVehiclePos(pvData[carid][cVeh], pvData[carid][cPos][0], pvData[carid][cPos][1], pvData[carid][cPos][2]);
        GetVehicleZAngle(pvData[carid][cVeh],pvData[carid][cPos][3]);
    }
    return 1;
}

SetValidVehicleHealth(vehicleid, Float:health) {
    VehicleHealthSecurity[vehicleid] = true;
    SetVehicleHealth(vehicleid, health);
    return 1;
}

ValidRepairVehicle(vehicleid) {
    VehicleHealthSecurity[vehicleid] = true;
    RepairVehicle(vehicleid);
    return 1;
}


//Private Vehicle Player System Function

function OnPlayerVehicleRespawn(i)
{
	if(IsValidVehicle(pvData[i][cVeh]))
		DestroyVehicle(pvData[i][cVeh]);
		
	pvData[i][cVeh] = CreateVehicle(pvData[i][cModel], pvData[i][cPos][0], pvData[i][cPos][1], pvData[i][cPos][2], pvData[i][cPos][3], pvData[i][cColor1], pvData[i][cColor2], 60000);
	SetVehicleNumberPlate(pvData[i][cVeh], pvData[i][cPlate]);
	SetVehicleVirtualWorld(pvData[i][cVeh], pvData[i][cVw]);
	LinkVehicleToInterior(pvData[i][cVeh], pvData[i][cInt]);
	SetVehicleFuel(pvData[i][cVeh], pvData[i][cFuel]);
	SetValidVehicleHealth(pvData[i][cVeh], pvData[i][cHealth]);
	UpdateVehicleDamageStatus(pvData[i][cVeh], pvData[i][cDamage][0], pvData[i][cDamage][1], pvData[i][cDamage][2], pvData[i][cDamage][3]);
	if(pvData[i][cVeh] != INVALID_VEHICLE_ID)
    {
        if(pvData[i][cPaintJob] != -1)
        {
            ChangeVehiclePaintjob(pvData[i][cVeh], pvData[i][cPaintJob]);
        }
		for(new z = 0; z < 17; z++)
		{
			if(pvData[i][cMod][z]) AddVehicleComponent(pvData[i][cVeh], pvData[i][cMod][z]);
		}
		if(pvData[i][cLocked] == 1)
		{
			SwitchVehicleDoors(pvData[i][cVeh], true);
		}
		else
		{
			SwitchVehicleDoors(pvData[i][cVeh], false);
		}
	}
	return 1;
}

function LoadPlayerVehicle(playerid)
{
	new query[128];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM `vehicle` WHERE `owner` = %d", pData[playerid][pID]);
	mysql_query(g_SQL, query, true);
	new count = cache_num_rows(), tempString[56];
	if(count > 0)
	{
		for(new z = 0; z < count; z++)
		{
			new i = Iter_Free(PVehicles);
			cache_get_value_int(z, "id", pvData[i][cID]);
			//pvData[i][VehicleOwned] = true;
			cache_get_value_int(z, "owner", pvData[i][cOwner]);
			cache_get_value_int(z, "locked", pvData[i][cLocked]);
			cache_get_value_float(z, "x", pvData[i][cPos][0]);
			cache_get_value_float(z, "y", pvData[i][cPos][1]);
			cache_get_value_float(z, "z", pvData[i][cPos][2]);
			cache_get_value_float(z, "a", pvData[i][cPos][3]);
			cache_get_value_float(z, "health", pvData[i][cHealth]);
			cache_get_value_int(z, "fuel", pvData[i][cFuel]);
			cache_get_value_int(z, "int", pvData[i][cInt]);
			cache_get_value_int(z, "vw", pvData[i][cVw]);
			cache_get_value_int(z, "damage0", pvData[i][cDamage][0]);
			cache_get_value_int(z, "damage1", pvData[i][cDamage][1]);
			cache_get_value_int(z, "damage2", pvData[i][cDamage][2]);
			cache_get_value_int(z, "damage3", pvData[i][cDamage][3]);
			cache_get_value_int(z, "color1", pvData[i][cColor1]);
			cache_get_value_int(z, "color2", pvData[i][cColor2]);
			cache_get_value_int(z, "paintjob", pvData[i][cPaintJob]);
			cache_get_value_int(z, "price", pvData[i][cPrice]);
			cache_get_value_int(z, "model", pvData[i][cModel]);
			cache_get_value_name(z, "plate", tempString);
			format(pvData[i][cPlate], 16, tempString);
			
			cache_get_value_int(z, "mod0", pvData[i][cMod][0]);
			cache_get_value_int(z, "mod1", pvData[i][cMod][1]);
			cache_get_value_int(z, "mod2", pvData[i][cMod][2]);
			cache_get_value_int(z, "mod3", pvData[i][cMod][3]);
			cache_get_value_int(z, "mod4", pvData[i][cMod][4]);
			cache_get_value_int(z, "mod5", pvData[i][cMod][5]);
			cache_get_value_int(z, "mod6", pvData[i][cMod][6]);
			cache_get_value_int(z, "mod7", pvData[i][cMod][7]);
			cache_get_value_int(z, "mod8", pvData[i][cMod][8]);
			cache_get_value_int(z, "mod9", pvData[i][cMod][9]);
			cache_get_value_int(z, "mod10", pvData[i][cMod][10]);
			cache_get_value_int(z, "mod11", pvData[i][cMod][11]);
			cache_get_value_int(z, "mod12", pvData[i][cMod][12]);
			cache_get_value_int(z, "mod13", pvData[i][cMod][13]);
			cache_get_value_int(z, "mod14", pvData[i][cMod][14]);
			cache_get_value_int(z, "mod15", pvData[i][cMod][15]);
			cache_get_value_int(z, "mod16", pvData[i][cMod][16]);
			/*for(new x = 0; x < 17; x++)
			{
				format(tempString, sizeof(tempString), "mod%d", x);
				cache_get_value_int(z, tempString, pvData[i][cMod][x]);
			}*/
			OnPlayerVehicleRespawn(i);
			Iter_Add(PVehicles, i);
		}
		printf("[P_VEHICLE] Loaded player vehicle from: %s(%d)", pData[playerid][pName], playerid);
	}
	return true;
}

function EngineStatus(playerid, vehicleid)
{
	if(!GetEngineStatus(vehicleid))
    {
		new Float: f_vHealth;
		GetVehicleHealth(vehicleid, f_vHealth);
		if(f_vHealth < 350.0) return Error(playerid, "The car won't start - it's totalled!");
		if(GetVehicleFuel(vehicleid) <= 0.0) return Error(playerid, "The car won't start - there's no fuel in the tank!");
		
		new rand = random(2);
		if(rand == 0)
		{
			SwitchVehicleEngine(vehicleid, true);
			InfoTD_MSG(playerid, 4000, "Engine ~g~START");
			//GameTextForPlayer(playerid, "~w~ENGINE ~g~START", 1000, 3);
			//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berhasil menghidupkan kendaraan %s.", ReturnName(playerid, 0), GetVehicleNameByVehicle(vehicleid));
		}
		if(rand == 1)
		{
			//Info(playerid, "Mesin kendaraan tidak dapat menyala, silahkan coba lagi!");
			InfoTD_MSG(playerid, 4000, "Engine ~r~CAN'T START");
			//GameTextForPlayer(playerid, "~w~ENGINE ~r~CAN'T START", 1000, 3);
		}
	}
	else
	{
		//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mematikan mesin kendaraan %s.", ReturnName(playerid, 0), GetVehicleNameByVehicle(GetPlayerVehicleID(playerid)));
		SwitchVehicleEngine(vehicleid, false);
		//Info(playerid, "Engine turn off..");
		InfoTD_MSG(playerid, 4000, "Engine ~r~OFF");
	}
	return 1;
}

function RemovePlayerVehicle(playerid)
{
	foreach(new i : PVehicles)
	{
		Vehicle_GetStatus(i);
		if(pvData[i][cOwner] == pData[playerid][pID])
		{
			new cQuery[2048];
			pvData[i][cOwner] = -1;
			//pvData[i][VehicleOwned] = false;
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE `vehicle` SET ");
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`x` = '%f', ", cQuery, pvData[i][cPos][0]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`y` = '%f', ", cQuery, pvData[i][cPos][1]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`z` = '%f', ", cQuery, pvData[i][cPos][2]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`a` = '%f', ", cQuery, pvData[i][cPos][3]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`health` = '%f', ", cQuery, pvData[i][cHealth]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`fuel` = '%d', ", cQuery, pvData[i][cFuel]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`int` = %d, ", cQuery, pvData[i][cInt]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`price` = %d, ", cQuery, pvData[i][cPrice]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`vw` = %d, ", cQuery, pvData[i][cVw]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`model` = %d, ", cQuery, pvData[i][cModel]);
			if(pvData[i][cLocked] == 1)
				mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`locked` = 1, ", cQuery);
			else
				mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`locked` = 0, ", cQuery);
			/*if(pvData[i][VehicleAlarm])
				mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`alarm` = 1, ", cQuery);
			else
				mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`alarm` = 0, ", cQuery);*/
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`plate` = '%e', ", cQuery, pvData[i][cPlate]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`color1` = %d, ", cQuery, pvData[i][cColor1]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`color2` = %d, ", cQuery, pvData[i][cColor2]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`damage0` = %d, ", cQuery, pvData[i][cDamage][0]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`damage1` = %d, ", cQuery, pvData[i][cDamage][1]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`damage2` = %d, ", cQuery, pvData[i][cDamage][2]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`damage3` = %d, ", cQuery, pvData[i][cDamage][3]);
			new tempString[56];
			for(new z = 0; z < 17; z++)
			{
				format(tempString, sizeof(tempString), "mod%d", z);
				mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`%s` = %d, ", cQuery, tempString, pvData[i][cMod][z]);
			}
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%s`paintjob` = %d ", cQuery, pvData[i][cPaintJob]);
			mysql_format(g_SQL, cQuery, sizeof(cQuery), "%sWHERE `id` = %d", cQuery, pvData[i][cID]);
			mysql_query(g_SQL, cQuery, true);
			DestroyVehicle(pvData[i][cVeh]);
			Iter_SafeRemove(PVehicles, i, i);
		}
	}
	return 1;
}

function OnVehCreated(playerid, oid, pid, model, color1, color2, Float:x, Float:y, Float:z, Float:a)
{
	new i = Iter_Free(PVehicles);
	pvData[i][cID] = cache_insert_id();
	pvData[i][cOwner] = pid;
	pvData[i][cModel] = model;
	pvData[i][cColor1] = color1;
	pvData[i][cColor2] = color2;
	pvData[i][cPaintJob] = -1;
	pvData[i][cLocked] = 0;
	pvData[i][cPrice] = 100000;
	pvData[i][cHealth] = 2000;
	pvData[i][cFuel] = 1000;
	format(pvData[i][cPlate], 16, "{FF0000}NoHave");
	pvData[i][cPos][0] = x;
	pvData[i][cPos][1] = y;
	pvData[i][cPos][2] = z;
	pvData[i][cPos][3] = a;
	pvData[i][cInt] = 0;
	pvData[i][cVw] = 0;
	for(new j = 0; j < 17; j++)
		pvData[i][cMod][j] = 0;
	Iter_Add(PVehicles, i);
	OnPlayerVehicleRespawn(i);
	Servers(playerid, "Anda telah membuat kendaraan kepada %s dengan (model=%d, color1=%d, color2=%d)", pData[oid][pName], model, color1, color2);
	return 1;
}

// Private Vehicle Player System Dialog
Dialog:DIALOG_TRACK_CAR(playerid, response, listitem, inputtext[])
{
    if(response) 
	{
        new Float:posisi[3],
            id = strval(inputtext);
        
        GetVehiclePos(id, posisi[0], posisi[1], posisi[2]);
		pData[playerid][pTrackCar] = 1;
        SetPlayerCheckpoint(playerid, posisi[0], posisi[1], posisi[2], 4.0);
        Info(playerid, "Your car waypoint was set to \"%s\" (marked on radar).", GetLocation(posisi[0], posisi[1], posisi[2]));
    }
    return 1;
}

// Private Vehicle Player System Commands
CMD:createpv(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
	
	new model, color1, color2, otherid;
	if(sscanf(params, "uddd", otherid, model, color1, color2)) return Usage(playerid, "/createpv [name/playerid] [model] [color1] [color2]");
	
	if(color1 < 0 || color1 > 255) { Error(playerid, "Color Number can't be below 0 or above 255 !"); return 1; }
    if(color2 < 0 || color2 > 255) { Error(playerid, "Color Number can't be below 0 or above 255 !"); return 1; }
    if(model < 400 || model > 611) { Error(playerid, "Vehicle Number can't be below 400 or above 611 !"); return 1; }
	if(otherid == INVALID_PLAYER_ID) return Error(playerid, "Invalid player ID!");
	new count = 0, limit = MAX_PLAYER_VEHICLE + pData[otherid][pVip];
	foreach(new ii : PVehicles)
	{
		if(pvData[ii][cOwner] == pData[otherid][pID])
			count++;
	}
	if(count >= limit)
	{
		Error(playerid, "This player have too many vehicles, sell a vehicle first!");
		return 1;
	}
	new cQuery[1024];
	new Float:x,Float:y,Float:z, Float:a;
    GetPlayerPos(otherid,x,y,z);
    GetPlayerFacingAngle(otherid,a);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[otherid][pID], model, color1, color2, x, y, z, a);
	mysql_tquery(g_SQL, cQuery, "OnVehCreated", "ddddddffff", playerid, otherid, pData[otherid][pID], model, color1, color2, x, y, z, a);
	return 1;
}

CMD:v(playerid, params[])
{
	static
        type[20],
        string[225],
		vehicleid;

    if(sscanf(params, "s[20]S()[128]", type, string))
    {
        SendClientMessage(playerid,COLOR_BLUE,"|__________________ Vehicle Command __________________|");
        SendClientMessage(playerid,COLOR_WHITE,"VEHICLE: /v [engine(Y)] [lights(N)] [hood] [trunk] [tow] [untow]");
		SendClientMessage(playerid,COLOR_WHITE,"VEHICLE: /v [track] [lock] [park]");
        return 1;
    }
	
	if(!strcmp(type, "engine", true))
    {
		vehicleid = GetPlayerVehicleID(playerid);
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{	
			if(!IsEngineVehicle(vehicleid))
            return Error(playerid, "You are not in any vehicle.");
			
			if(GetEngineStatus(vehicleid))
			{
				EngineStatus(playerid, vehicleid);
			}
			else
			{
				//Info(playerid, "Anda mencoba menyalakan mesin kendaraan..");
				//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencoba menghidupkan mesin kendaraan %s.", ReturnName(playerid, 0), GetVehicleNameByVehicle(GetPlayerVehicleID(playerid)));
				InfoTD_MSG(playerid, 4000, "Starting Engine...");
				SetTimerEx("EngineStatus", 3000, false, "dd", playerid, vehicleid);
			}
		}
		else return Error(playerid, "Anda harus mengendarai kendaraan!");
	}
	else if(!strcmp(type,"lights",true))
	{
		vehicleid = GetPlayerVehicleID(playerid);
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{	
			if(!IsEngineVehicle(vehicleid))
            return Error(playerid, "You are not in any vehicle.");
			
			switch(GetLightStatus(vehicleid))
			{
				case false:
				{
					SwitchVehicleLight(vehicleid, true);
				}
				case true:
				{
					SwitchVehicleLight(vehicleid, false);
				}
			}
		}
		else return Error(playerid, "Anda harus mengendarai kendaraan!");
	}
	else if(!strcmp(type,"hood",true))
    {
        vehicleid = GetPlayerVehicleID(playerid);

        if(!IsEngineVehicle(vehicleid))
            return Error(playerid, "You are not in any vehicle.");

        if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
            return Error(playerid, "You can't do this as you're not the driver.");

        switch (GetHoodStatus(vehicleid))
        {
            case false:
            {
                SwitchVehicleBonnet(vehicleid, true);
                InfoTD_MSG(playerid, 4000, "Vehicle Hood ~g~Open");
            }
            case true:
            {
                SwitchVehicleBonnet(vehicleid, false);
                InfoTD_MSG(playerid, 4000, "Vehicle Hood ~r~Close");
            }
        }
    }
    else if(!strcmp(type,"trunk",true))
    {
        vehicleid = GetNearestVehicle(playerid);

		if(vehicleid == INVALID_VEHICLE_ID)
			return Error(playerid, "You not in near any vehicles.");
			
        switch (GetTrunkStatus(vehicleid))
        {
            case false:
            {
                SwitchVehicleBoot(vehicleid, true);
                Info(playerid, "Vehicle trunk "GREEN_E"opened.");
            }
            case true:
            {
                SwitchVehicleBoot(vehicleid, false);
                Info(playerid, "Vehicle trunk "RED_E"close.");
            }
        }
    }
	else if(!strcmp(type,"lock",true))
	{
		static
			id = -1;

		if((id = Vehicle_Nearest(playerid)) != -1)
		{
			if(Vehicle_IsOwner(playerid, id))
			{
				if(!pvData[id][cLocked])
				{
					pvData[id][cLocked] = 1;

					InfoTD_MSG(playerid, 4000, "You have ~r~locked~w~ the vehicle!");
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);

					SwitchVehicleDoors(pvData[id][cVeh], true);
				}
				else
				{
					pvData[id][cLocked] = 0;
					InfoTD_MSG(playerid, 4000, "You have ~g~unlocked~w~ the vehicle!");
					PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);

					SwitchVehicleDoors(pvData[id][cVeh], false);
				}
			}
			//else SendErrorMessage(playerid, "You are not in range of anything you can lock.");
		}
		else Error(playerid, "You are not in range of vehicle you can lock.");
	}
	else if(!strcmp(type,"track",true))
	{
		new bool:found = false, msg2[512], Float:fx, Float:fy, Float:fz;
		format(msg2, sizeof(msg2), "ID\tModel\tLocation\n");
		foreach(new i : PVehicles)
		{
			if(pvData[i][cOwner] == pData[playerid][pID])
			{
				GetVehiclePos(pvData[i][cVeh], fx, fy, fz);
				format(msg2, sizeof(msg2), "%s%d\t%s\t%s\n", msg2, pvData[i][cVeh], GetVehicleNameByModel(pvData[i][cModel]), GetLocation(fx, fy, fz));
				found = true;
			}
		}
		if(found)
			Dialog_Show(playerid, DIALOG_TRACK_CAR, DIALOG_STYLE_TABLIST_HEADERS, "My Vehicles", msg2, "Find", "Close");
		else
			Dialog_Show(playerid, NO_DIALOG, DIALOG_STYLE_MSGBOX, "Vehicles", "Anda tidak memeliki kendaraan", "Close", "");
	}
	return 1;
}