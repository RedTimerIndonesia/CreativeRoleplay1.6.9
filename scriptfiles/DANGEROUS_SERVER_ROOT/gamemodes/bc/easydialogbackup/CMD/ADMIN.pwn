//----------[ Admin Commands Level 5 ]------------

CMD:setadminlevel(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
	
	new alevel, otherid;
	if(sscanf(params, "ud", otherid, alevel))
	{
	    Usage(playerid, "/setadminlevel <ID/Name> <level 0 - 4>");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Player not connected!");
	if(alevel > 5)
		return Error(playerid, "Level can't be higher than 5!");
	if(alevel < 0)
		return Error(playerid, "Level can't be lower than 0!");
	
	if(pData[otherid][IsLoggedIn] == false)
	{
		Error(playerid, "Player %s(%i) isn't logged in!", pData[otherid][pName], otherid);
		return true;
	}
	pData[otherid][pAdmin] = alevel;
	Servers(playerid, "You has set admin level %s(%d) to level %d", pData[otherid][pName], otherid, alevel);
	Servers(otherid, "%s(%d) has set your admin level to %d", pData[otherid][pName], playerid, alevel);
	return 1;
}

CMD:sethelperlevel(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
	
	new alevel, otherid;
	if(sscanf(params, "ud", otherid, alevel))
	{
	    Usage(playerid, "/sethelperlevel <ID/Name> <level 0 - 3>");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Player not connected!");
	if(alevel > 3)
		return Error(playerid, "Level can't be higher than 3!");
	if(alevel < 0)
		return Error(playerid, "Level can't be lower than 0!");
	
	if(pData[otherid][IsLoggedIn] == false)
	{
		Error(playerid, "Player %s(%i) isn't logged in!", pData[otherid][pName], otherid);
		return true;
	}
	pData[otherid][pHelper] = alevel;
	Servers(playerid, "You has set helper level %s(%d) to level %d", pData[otherid][pName], otherid, alevel);
	Servers(otherid, "%s(%d) has set your helper level to %d", pData[otherid][pName], playerid, alevel);
	SendStaffMessage(COLOR_RED, "Admin %s telah menset %s(%d) sebagai staff helper level %s(%d)",  pData[playerid][pAdminname], pData[otherid][pName], otherid, GetStaffRank(playerid), alevel);
	return 1;
}

CMD:setadminname(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
	
	new aname[128], otherid, query[128];
	if(sscanf(params, "us[128]", otherid, aname))
	{
	    Usage(playerid, "/setadminname <ID/Name> <admin name>");
	    return true;
	}
	
	mysql_format(g_SQL, query, sizeof(query), "SELECT adminname FROM players WHERE adminname='%s'", aname);
	mysql_tquery(g_SQL, query, "a_ChangeAdminName", "iis", otherid, playerid, aname);
	return 1;
}

CMD:setmoney(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/setmoney <ID/Name> <money>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	ResetPlayerMoneyEx(otherid);
	GivePlayerMoneyEx(otherid, money);
	
	Servers(playerid, "Kamu telah mengset uang %s(%d) menjadi %s!", pData[otherid][pName], otherid, FormatMoney(money));
	Servers(otherid, "Admin %s telah mengset uang anda menjadi %s!",pData[playerid][pAdminname], FormatMoney(money));
	return 1;
}

CMD:givemoney(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/givemoney <ID/Name> <money>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	GivePlayerMoneyEx(playerid, money);
	
	Servers(playerid, "Kamu telah memberikan uang %s(%d) dengan jumlah %s!", pData[otherid][pName], otherid, FormatMoney(money));
	Servers(otherid, "Admin %s telah memberikan uang kepada anda dengan jumlah %s!", pData[playerid][pAdminname], FormatMoney(money));
	return 1;
}

CMD:setbankmoney(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/setbankmoney <ID/Name> <money>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	pData[playerid][pBankMoney] = money;
	
	Servers(playerid, "Kamu telah mengset uang rekening banki %s(%d) menjadi %s!", pData[otherid][pName], otherid, FormatMoney(money));
	Servers(otherid, "Admin %s telah mengset uang rekening bank anda menjadi %s!",pData[playerid][pAdminname], FormatMoney(money));
	return 1;
}

CMD:givebankmoney(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/givebankmoney <ID/Name> <money>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	pData[playerid][pBankMoney] += money;
	
	Servers(playerid, "Kamu telah memberikan uang rekening bank %s(%d) dengan jumlah %s!", pData[otherid][pName], otherid, FormatMoney(money));
	Servers(otherid, "Admin %s telah memberikan uang rekening bank kepada anda dengan jumlah %s!", pData[playerid][pAdminname], FormatMoney(money));
	return 1;
}

CMD:setcoin(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/setcoin <ID/Name> <coin>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	pData[otherid][pCoin] = money;
	
	Servers(playerid, "Kamu telah menset coin %s(%d) dengan jumlah %d!", pData[otherid][pName], otherid, money);
	Servers(otherid, "Admin %s telah menset coin kepada anda dengan jumlah %d!", pData[playerid][pAdminname], money);
	return 1;
}

CMD:givecoin(playerid, params[])
{
	if(pData[playerid][pAdmin] < 5)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/givecoin <ID/Name> <coin>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	
	pData[otherid][pCoin] += money;
	
	Servers(playerid, "Kamu telah memberikan coin %s(%d) dengan jumlah %d!", pData[otherid][pName], otherid, money);
	Servers(otherid, "Admin %s telah memberikan coin kepada anda dengan jumlah %d!", pData[playerid][pAdminname], money);
	return 1;
}

//----------[ Admin Commands Level 4 ]------------

CMD:setvip(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
	
	new alevel, dayz, otherid;
	if(sscanf(params, "udd", otherid, alevel, dayz))
	{
	    Usage(playerid, "/setvip <ID/Name> <level 0 - 3> <time (in days) 0 for permanent>");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Player not connected!");
	if(alevel > 3)
		return Error(playerid, "Level can't be higher than 3!");
	if(alevel < 0)
		return Error(playerid, "Level can't be lower than 0!");
	if(dayz < 0)
		return Error(playerid, "Time can't be lower than 0!");
		
	if(pData[otherid][IsLoggedIn] == false)
	{
		Error(playerid, "Player %s(%i) isn't logged in!", pData[otherid][pName], otherid);
		return true;
	}
	
	if(pData[playerid][pAdmin] < 5 && dayz > 31)
		return Error(playerid, "Anda hanya bisa menset 1 - 31 hari!");
	
	pData[otherid][pVip] = alevel;
	if(dayz == 0)
	{
		pData[otherid][pVipTime] = 0;
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%d) telah menset VIP kepada %s(%d) ke level %s permanent time!", pData[playerid][pAdminname], playerid, pData[otherid][pName], otherid, GetVipRank(otherid));
	}
	else
	{
		pData[otherid][pVipTime] = gettime() + (dayz * 86400);
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%d) telah menset VIP kepada %s(%d) selama %d hari ke level %s!", pData[playerid][pAdminname], playerid, pData[otherid][pName], otherid, dayz, GetVipRank(otherid));
	}
	return 1;
}


CMD:takemoney(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/takemoney <ID/Name> <amount>");
	    return true;
	}

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

 	if(money > pData[otherid][pMoney])
		return Error(playerid, "Player doesn't have enough money to deduct from!");

	GivePlayerMoneyEx(otherid, -money);
	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%i) has taken away money "GREEN_E"%s "RED_E"from %s", pData[playerid][pAdminname], FormatMoney(money), pData[otherid][pName]);
	return true;
}

CMD:takecoin(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
		
	new money, otherid;
	if(sscanf(params, "ud", otherid, money))
	{
	    Usage(playerid, "/takecoin <ID/Name> <amount>");
	    return true;
	}

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

 	if(money > pData[otherid][pCoin])
		return Error(playerid, "Player doesn't have enough money to deduct from!");

	pData[otherid][pCoin] -= money;
	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%i) has taken away money "GREEN_E"%s "RED_E"from %s", pData[playerid][pAdminname], FormatMoney(money), pData[otherid][pName]);
	return true;
}

CMD:setfaction(playerid, params[])
{
	new fid, rank, otherid;
    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "udd", otherid, fid, rank))
        return Usage(playerid, "/setfaction [playerid/PartOfName] [1.SAPD, 2.SAGS, 3.SAMD, 4.SANEW] [rank 1-6]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");
	
	if(pData[otherid][pFamily] != -1)
		return Error(playerid, "Player tersebut sudah bergabung family");

    if(fid < 0 || fid > 4)
        return Error(playerid, "You have specified an invalid faction ID 0 - 4.");
		
	if(rank < 1 || rank > 6)
        return Error(playerid, "You have specified an invalid rank 1 - 6.");

	if(fid == 0)
	{
		pData[playerid][pFaction] = 0;
		pData[playerid][pFactionRank] = 0;
		Servers(playerid, "You have removed %s's from faction.", pData[otherid][pName]);
		Servers(otherid, "%s has removed your faction.", pData[playerid][pName]);
	}
	else
	{
		pData[playerid][pFaction] = fid;
		pData[playerid][pFactionRank] = rank;
		Servers(playerid, "You have set %s's faction ID %d with rank %d.", pData[otherid][pName], fid, rank);
		Servers(otherid, "%s has set your faction ID to %d with rank %d.", pData[playerid][pName], fid, rank);
	}
    return 1;
}

CMD:setleader(playerid, params[])
{
	new fid, otherid;
    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "ud", otherid, fid))
        return Usage(playerid, "/setleader [playerid/PartOfName] [0.None, 1.SAPD, 2.SAGS, 3.SAMD, 4.SANEW]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");
	
	if(pData[otherid][pFamily] != -1)
		return Error(playerid, "Player tersebut sudah bergabung family");

    if(fid < 0 || fid > 4)
        return Error(playerid, "You have specified an invalid faction ID 0 - 4.");

	if(fid == 0)
	{
		pData[playerid][pFaction] = 0;
		pData[playerid][pFactionLead] = 0;
		pData[playerid][pFactionRank] = 0;
		Servers(playerid, "You have removed %s's from faction leader.", pData[otherid][pName]);
		Servers(otherid, "%s has removed your faction leader.", pData[playerid][pName]);
	}
	else
	{
		pData[playerid][pFaction] = fid;
		pData[playerid][pFactionLead] = fid;
		pData[playerid][pFactionRank] = 6;
		Servers(playerid, "You have set %s's faction ID %d with leader.", pData[otherid][pName], fid);
		Servers(otherid, "%s has set your faction ID to %d with leader.", pData[playerid][pName], fid);
	}
    return 1;
}

//-----------[ Admin Commands Level 3 ]----------
CMD:oban(playerid, params[])
{
	if(pData[playerid][pAdmin] < 3)
	    return PermissionError(playerid);

	new player[24], datez, reason[50];
	if(sscanf(params, "s[24]D(0)s[50]", player, datez, reason))
	{
	    Usage(playerid, "/oban <ban name> <time in days (0 for permanent ban)> <reason>");
	    Info(playerid, "Will ban a player while he is offline. If time isn't specified it will be a perm ban.");
	    return true;
	}
	if(strlen(reason) > 50) return Error(playerid, "Reason must be shorter than 50 characters.");

	foreach(new ii : Player)
	{
		new PlayerName[24];
		GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

	    if(strfind(PlayerName, player, true) != -1)
		{
			Error(playerid, "Player is online, you can use /ban on him.");
	  		return true;
	  	}
	}

	new query[128];

	mysql_format(g_SQL, query, sizeof(query), "SELECT ip FROM players WHERE username='%e'", player);
	mysql_tquery(g_SQL, query, "OnOBanQueryData", "issi", playerid, player, reason, datez);
	return true;
}

CMD:banip(playerid, params[])
{
    if(pData[playerid][pAdmin] < 3)
     	return PermissionError(playerid);

	if(isnull(params))
	{
	    Usage(playerid, "/banip <IP Address>");
		return true;
	}
	if(strfind(params, "*", true) != -1 && pData[playerid][pAdmin] != 5)
	{
		Error(playerid, "You are not authorized to ban ranges.");
  		return true;
  	}

	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%d) IP banned address %s.", pData[playerid][pAdminname], playerid, params);
	
	new tstr[128];
	format(tstr, sizeof(tstr), "banip %s", params);
	SendRconCommand(tstr);
	return 1;
}

CMD:unbanip(playerid, params[])
{
    if(pData[playerid][pAdmin] < 3)
     	return PermissionError(playerid);

	if(isnull(params))
	{
	    Usage(playerid, "/unbanip <IP Address>");
		return true;
	}
	new mstr[128];
	format(mstr, sizeof(mstr), "unbanip %s", params);
	SendRconCommand(mstr);
	format(mstr, sizeof(mstr), "reloadbans");
	SendRconCommand(mstr);
	Servers(playerid, "You have unbanned IP address %s.", params);
	return 1;
}

CMD:reloadweap(playerid, params[])
{
    if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/reloadweps [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    SetWeapons(otherid);
    Servers(playerid, "You have reload %s's weapons.", pData[otherid][pName]);
    Servers(otherid, "Admin %s have reload your weapons.", pData[playerid][pAdminname]);
    return 1;
}

CMD:resetweap(playerid, params[])
{
    if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/resetweps [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    ResetPlayerWeaponsEx(otherid);
    Servers(playerid, "You have reset %s's weapons.", pData[otherid][pName]);
    Servers(otherid, "Admin %s have reset your weapons.", pData[playerid][pAdminname]);
    return 1;
}

CMD:giveweap(playerid, params[])
{
    static
        weaponid,
        ammo;
		
	new otherid;
    if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);

    if(sscanf(params, "udI(250)", otherid, weaponid, ammo))
        return Usage(playerid, "/givewep [playerid/PartOfName] [weaponid] [ammo]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You cannot give weapons to disconnected players.");


    if(weaponid <= 0 || weaponid > 46 || (weaponid >= 19 && weaponid <= 21))
        return Error(playerid, "You have specified an invalid weapon.");

    if(ammo < 1 || ammo > 500)
        return Error(playerid, "You have specified an invalid weapon ammo, 1 - 500");

    GivePlayerWeaponEx(otherid, weaponid, ammo);
    Servers(playerid, "You have give %s a %s with %d ammo.", pData[otherid][pName], ReturnWeaponName(weaponid), ammo);
    return 1;
}

CMD:sethbe(playerid, params[])
{
	if(pData[playerid][pAdmin] < 3)
        return PermissionError(playerid);
	
	new jumlah, otherid;
	if(sscanf(params, "ud", otherid, jumlah))
        return Usage(playerid, "/sethbe [playerid id/name] <jumlah>");
	
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "You have specified an invalid player.");
	pData[otherid][pHunger] = jumlah;
	pData[otherid][pEnergy] = jumlah;
	pData[otherid][pBladder] = jumlah;
	pData[otherid][pSick] = 0;
	SetPlayerDrunkLevel(playerid, 0);
	SendStaffMessage(COLOR_RED, "%s telah men set jumlah hbe player %s", pData[playerid][pAdminname], pData[otherid][pName]);
	Servers(otherid, "Admin %s telah men set HBE anda", pData[playerid][pAdminname]);
	return 1;
}

//-----------[ Admin Commands Level 2 ]-----------

CMD:gotoco(playerid, params[])
{
	if(pData[playerid][pAdmin] < 2)
		return PermissionError(playerid);
		
	new Float: pos[3], int;
	if(sscanf(params, "fffd", pos[0], pos[1], pos[2], int)) return Usage(playerid, "/gotoco [x coordinate] [y coordinate] [z coordinate] [interior]");

	Servers(playerid, "You have been teleported to the coordinates specified.");
	SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
	SetPlayerInterior(playerid, int);
	return 1;
}

CMD:fixveh(playerid, params[])
{
	if(pData[playerid][pAdmin] < 2)
     		return PermissionError(playerid);
	
    if(IsPlayerInAnyVehicle(playerid)) 
	{
        ValidRepairVehicle(GetPlayerVehicleID(playerid));
		SetVehicleFuel(GetPlayerVehicleID(playerid), 1000);
        Servers(playerid, "Vehicle Fixed!");
    }
	else
	{
		Error(playerid, "Kamu tidak berada didalam kendaraan apapun!");
	}
	return 1;
}


CMD:veh(playerid, params[])
{
    static
        model[32],
        color1,
        color2;

    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

    if(sscanf(params, "s[32]I(0)I(0)", model, color1, color2))
        return Usage(playerid, "/veh [model id/name] <color 1> <color 2>");

    if((model[0] = GetVehicleModelByName(model)) == 0)
        return Error(playerid, "Invalid model ID.");

    static
        Float:x,
        Float:y,
        Float:z,
        Float:a,
        vehicleid;

    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);

    vehicleid = CreateVehicle(model[0], x, y, z, a, color1, color2, 0);

    if(GetPlayerInterior(playerid) != 0)
        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));

    if(GetPlayerVirtualWorld(playerid) != 0)
        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));

    if(IsABoat(vehicleid) || IsAPlane(vehicleid) || IsAHelicopter(vehicleid))
        PutPlayerInVehicle(playerid, vehicleid, 0);

    SetVehicleNumberPlate(vehicleid, "STATIC");
    Servers(playerid, "You have spawned a %s (%d, %d).", GetVehicleModelName(model[0]), color1, color2);
    return 1;
}

CMD:setskin(playerid, params[])
{
    new
        skinid,
		otherid;

    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

    if(sscanf(params, "ud", otherid, skinid))
        return Usage(playerid, "/skin [playerid/PartOfName] [skin id]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    if(skinid < 0 || skinid > 299)
        return Error(playerid, "Invalid skin ID. Skins range from 0 to 299.");

    SetPlayerSkin(otherid, skinid);
	pData[otherid][pSkin] = skinid;

    Servers(playerid, "You have set %s's skin to ID: %d.", ReturnName(otherid), skinid);
    Servers(otherid, "%s has set your skin to ID: %d.", ReturnName(playerid), skinid);
    return 1;
}

CMD:explode(playerid, params[])
{
    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);
	new Float:POS[3], otherid, giveplayer[24];
	if(sscanf(params, "u", otherid))
	{
		Usage(playerid, "/explode <ID/Name>");
		return true;
	}

	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Player not connected!");

	GetPlayerName(otherid, giveplayer, sizeof(giveplayer));

	Servers(playerid, "You have exploded %s(%i).", giveplayer, otherid);
	GetPlayerPos(otherid, POS[0], POS[1], POS[2]);
	CreateExplosion(POS[0], POS[1], POS[2], 7, 5.0);
	return true;
}

CMD:akill(playerid, params[])
{
    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);
	new reason[60], otherid, giveplayer[24];
	if(sscanf(params, "uS(*)[60]", otherid, reason))
	{
	    Usage(playerid, "/akill <ID/Name> <optional: reason>");
	    return 1;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");


	GetPlayerName(otherid, giveplayer, sizeof(giveplayer));

	SetPlayerHealth(otherid, 0.0);

	if(reason[0] != '*')
	{
		SendClientMessageToAllEx(COLOR_RED, "Servers: "GREY2_E"Admin %s(%i) has killed %s(%i). "GREY_E"[Reason: %s]", pData[playerid][pAdminname], playerid, giveplayer, otherid, reason);
	}
	else
	{
		SendClientMessageToAllEx(COLOR_RED, "Servers: "GREY2_E"Admin %s(%i) has killed %s(%i).", pData[playerid][pAdminname], playerid, giveplayer, otherid);
	}
	return 1;
}

CMD:settime(playerid, params[])
{
    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

	new time, mstr[128];
	if(sscanf(params, "d", time))
	{
		Usage(playerid, "/time <time ID>");
		return true;
	}

	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s(%i) has changed the time to: "YELLOW_E"%d", pData[playerid][pAdminname], playerid, time);

	format(mstr, sizeof(mstr), "~r~Time changed: ~b~%d", time);
	GameTextForAll(mstr, 3000, 5);

	SetWorldTime(time);
	foreach(new ii : Player)
	{
		SetPlayerTime(ii, time, 0);
	}
	return true;
}

CMD:setweather(playerid, params[])
{
    new weatherid;

    if(pData[playerid][pAdmin] < 2)
        return PermissionError(playerid);

    if(sscanf(params, "d", weatherid))
        return Usage(playerid, "/setweather [weather ID]");

    SetWeather(weatherid);
    SetGVarInt("g_Weather", weatherid);
    SendClientMessageToAllEx(COLOR_RED,"Server: "GREY2_E"%s have changed the weather ID", pData[playerid][pAdminname]);
    Servers(playerid, "You have changed the weather to ID: %d.", weatherid);
    return 1;
}

//-----------[ Admin Commands Level 1 ]-----------
CMD:aduty(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
			
	if(!strcmp(pData[playerid][pAdminname], "None"))
		return Error(playerid, "You must set your admin name to owner!");
	
	if(!pData[playerid][pAdminDuty])
    {
		if(pData[playerid][pAdmin] > 0)
		{
			SetPlayerColor(playerid, 0xFF000000);
			pData[playerid][pAdminDuty] = 1;
			SetPlayerName(playerid, pData[playerid][pAdminname]);
			SendStaffMessage(COLOR_RED, "* %s telah on duty admin.", pData[playerid][pName]);
		}
		else
		{
			SetPlayerColor(playerid, COLOR_GREEN);
			pData[playerid][pAdminDuty] = 1;
			SetPlayerName(playerid, pData[playerid][pAdminname]);
			SendStaffMessage(COLOR_RED, "* %s telah on helper duty.", pData[playerid][pName]);
		}
    }
    else
    {
        if(pData[playerid][pFaction] != -1 && pData[playerid][pOnDuty]) 
            SetFactionColor(playerid);
        else 
            SetPlayerColor(playerid, COLOR_WHITE);
                
        SetPlayerName(playerid, pData[playerid][pName]);
        pData[playerid][pAdminDuty] = 0;
        SendStaffMessage(COLOR_RED, "* %s telah off admin duty.", pData[playerid][pName]);
    }
	return 1;
}

CMD:asay(playerid, params[]) 
{
    new text[225];

    if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);

    if(sscanf(params,"s[225]",text))
        return Usage(playerid, "/asay [text]");
        
    SendClientMessageToAllEx(COLOR_RED,"**[ADMIN]** (%s) "YELLOW_E"%s: %s", GetStaffRank(playerid), pData[playerid][pAdminname], ColouredText(text));
    return 1;
}

CMD:h(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);

	if(isnull(params))
	{
	    Usage(playerid, "/h <text>");
	    return true;
	}

    // Decide about multi-line msgs
	new i = -1;
	new line[512];
	if(strlen(params) > 70)
	{
		i = strfind(params, " ", false, 60);
		if(i > 80 || i == -1) i = 70;

		// store the second line text
		line = " ";
		strcat(line, params[i]);

		// delete the rest from msg
		params[i] = EOS;
	}
	new mstr[512];
	format(mstr, sizeof(mstr), ""SBLUE_E"[Helper Chat] (%s) "WHITEP_E"%s(%i): "LB_E"%s", GetStaffRank(playerid), pData[playerid][pAdminname], playerid, params);
	foreach(new ii : Player) 
	{
		if(pData[ii][pAdmin] > 0 || pData[ii][pHelper] == 1)
		{
			SendClientMessage(ii, COLOR_LB, mstr);	
		}
	}
	if(i != -1)
	{
		foreach(new ii : Player)
		{
			if(pData[ii][pAdmin] > 0 || pData[ii][pHelper] == 1)
			{
				SendClientMessage(ii, COLOR_LB, line);
			}
		}
	}
	return 1;
}

CMD:a(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
			return PermissionError(playerid);

	if(isnull(params))
	{
	    Usage(playerid, "/a <text>");
	    return true;
	}

    // Decide about multi-line msgs
	new i = -1;
	new line[512];
	if(strlen(params) > 70)
	{
		i = strfind(params, " ", false, 60);
		if(i > 80 || i == -1) i = 70;

		// store the second line text
		line = " ";
		strcat(line, params[i]);

		// delete the rest from msg
		params[i] = EOS;
	}
	new mstr[512];
	format(mstr, sizeof(mstr), ""RED_E"[Admin Chat] %s "LG_E"%s(%i): "LB_E"%s", GetStaffRank(playerid), pData[playerid][pAdminname], playerid, params);
	foreach(new ii : Player) 
	{
		if(pData[ii][pAdmin] > 0)
		{
			SendClientMessage(ii, COLOR_LB, mstr);	
		}
	}
	if(i != -1)
	{
		foreach(new ii : Player)
		{
			if(pData[ii][pAdmin] > 0)
			{
				SendClientMessage(ii, COLOR_LB, line);
			}
		}
	}
	return true;
}

CMD:togooc(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
        return PermissionError(playerid);

    if(TogOOC == 0)
    {
        SendClientMessageToAllEx(COLOR_LRED, "Admin %s has disabled global OOC chat.", pData[playerid][pAdminname]);
        TogOOC = 1;
    }
    else
    {
        SendClientMessageToAllEx(COLOR_LRED, "Admin %s has enabled global OOC chat (DON'T SPAM).", pData[playerid][pAdminname]);
        TogOOC = 0;
    }
    return 1;
}

CMD:o(playerid, params[])
{
    if(TogOOC == 1 && pData[playerid][pAdmin] < 1 && pData[playerid][pHelper] < 1) 
            return Error(playerid, "An administrator has disabled global OOC chat.");

    if(isnull(params))
        return Usage(playerid, "/o [global OOC]");

    /*if(pData[playerid][pDisableOOC])
        return Error(playerid, "You must enable OOC chat first.");*/

    if(strlen(params) < 90)
    {
        foreach (new i : Player) if(pData[i][IsLoggedIn] == true && pData[i][pSpawned] == 1)
        {
            if(pData[playerid][pAdmin] > 1 && pData[playerid][pAdminDuty] == 1)
			{
                SendClientMessageEx(i, COLOR_WHITE, "(( {FF0000}[ADMIN] %s{FFFFFF}: %s {FFFFFF}))", pData[playerid][pAdminname], ColouredText(params));
			}
			else if(pData[playerid][pHelper] > 1 && pData[playerid][pAdmin] == 0 && pData[playerid][pAdminDuty] == 1)
			{
				SendClientMessageEx(i, COLOR_WHITE, "(( {00FF00}[HELPER] %s{FFFFFF}: %s {FFFFFF}))", pData[playerid][pAdminname], ColouredText(params));
			}
			if(pData[playerid][pAdmin] > 1 && pData[playerid][pAdminDuty] == 0)
			{
                SendClientMessageEx(i, COLOR_WHITE, "(( {FF0000}[ADMIN] %s{FFFFFF}: %s {FFFFFF}))", pData[playerid][pName], ColouredText(params));
			}
			else if(pData[playerid][pHelper] > 1 && pData[playerid][pAdmin] == 0 && pData[playerid][pAdminDuty] == 0)
			{
				SendClientMessageEx(i, COLOR_WHITE, "(( {00FF00}[HELPER] %s{FFFFFF}: %s {FFFFFF}))", pData[playerid][pName], ColouredText(params));
			}
            else
            {
                SendClientMessageEx(i, COLOR_WHITE, "(( {33FFCC}Player %s{FFFFFF} (%d): %s ))", pData[playerid][pName], playerid, params);
            }
        }
    }
    else
        return Error(playerid, "The text to long, maximum character is 90");

    return 1;
}

CMD:goto(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/goto [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "The specified user(s) are not connected.");
		
	SendPlayerToPlayer(playerid, otherid);
	Servers(playerid, "You has teleport to %s position.", pData[otherid][pName]);
	return 1;
}

CMD:sendto(playerid, params[])
{
    static
        type[24],
		otherid;

    if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);

    if(sscanf(params, "us[32]", otherid, type))
    {
        Usage(playerid, "/send [player] [name]");
        Info(playerid, "[NAMES]:{FFFFFF} ls, lv, sf");
        return 1;
    }
    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

	if(!strcmp(type,"ls")) 
	{
        if(GetPlayerState(otherid) == PLAYER_STATE_DRIVER) 
		{
            SetVehiclePos(GetPlayerVehicleID(otherid),1482.0356,-1724.5726,13.5469);
        }
        else 
		{
            SetPlayerPosition(otherid,1482.0356,-1724.5726,13.5469,750);
        }
        SetPlayerFacingAngle(otherid,179.4088);
        SetPlayerInterior(otherid, 0);
        SetPlayerVirtualWorld(otherid, 0);
		Servers(playerid, "Player %s telah berhasil di teleport", pData[otherid][pName]);
		Servers(otherid, "Admin %s telah mengirim anda ke teleport spawn", pData[playerid][pAdminname]);
    }
    else if(!strcmp(type,"sf")) 
	{
        if(GetPlayerState(otherid) == PLAYER_STATE_DRIVER) 
		{
            SetVehiclePos(GetPlayerVehicleID(otherid),-1425.8307,-292.4445,14.1484);
        }
        else 
		{
            SetPlayerPosition(otherid,-1425.8307,-292.4445,14.1484,750);
        }
        SetPlayerFacingAngle(otherid,179.4088);
        SetPlayerInterior(otherid, 0);
        SetPlayerVirtualWorld(otherid, 0);
		Servers(playerid, "Player %s telah berhasil di teleport", pData[otherid][pName]);
		Servers(otherid, "Admin %s telah mengirim anda ke teleport spawn", pData[playerid][pAdminname]);
    }
    else if(!strcmp(type,"lv")) 
	{
        if(GetPlayerState(otherid) == PLAYER_STATE_DRIVER) 
		{
            SetVehiclePos(GetPlayerVehicleID(otherid),1686.0118,1448.9471,10.7695);
        }
        else 
		{
            SetPlayerPosition(otherid,1686.0118,1448.9471,10.7695,750);
        }
        SetPlayerFacingAngle(otherid,179.4088);
        SetPlayerInterior(otherid, 0);
        SetPlayerVirtualWorld(otherid, 0);
		Servers(playerid, "Player %s telah berhasil di teleport", pData[otherid][pName]);
		Servers(otherid, "Admin %s telah mengirim anda ke teleport spawn", pData[playerid][pAdminname]);
    }
    return 1;
}

CMD:gethere(playerid, params[])
{
    new targetid, otherid;

	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
    if(sscanf(params, "uu", otherid, targetid))
        return Usage(playerid, "/gethere [playerid/PartOfName] to [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID || targetid == INVALID_PLAYER_ID)
        return Error(playerid, "The specified user(s) are not connected.");
		
/*	if(IsPlayerPaused(otherid))
		return Error(playerid, "Player tersebut tidak dapat diteleport, karena AFK!");*/
	
	if(pData[targetid][pSpawned] == 0 || pData[otherid][pSpawned] == 0)
	{
		Error(playerid, "Player/Target sedang tidak spawn!");
		return 1;
	}
	if(pData[otherid][pJail] > 0 || pData[targetid][pJail] > 0)
		return Error(playerid, "Player/Target sedang di jail");
		
	if(pData[otherid][pArrest] > 0 || pData[targetid][pArrest] > 0)
		return Error(playerid, "Player/Target sedang di arrest");

    SendPlayerToPlayer(otherid, targetid);

    Servers(playerid, "You have teleported %s to %s.", ReturnName(otherid), ReturnName(targetid));
    Servers(otherid, "%s has teleported you to %s.", ReturnName(playerid), ReturnName(targetid));
    return 1;
}

CMD:freeze(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/freeze [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    pData[playerid][pFreeze] = 1;

    TogglePlayerControllable(otherid, 0);
    Servers(playerid, "You have frozen %s's movements.", ReturnName(otherid));
	Servers(otherid, "You have been frozen movements by admin %s.", pData[playerid][pAdminname]);
    return 1;
}

CMD:unfreeze(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/unfreeze [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    pData[playerid][pFreeze] = 0;

    TogglePlayerControllable(otherid, 1);
    Servers(playerid, "You have unfrozen %s's movements.", ReturnName(otherid));
	Servers(otherid, "You have been unfrozen movements by admin %s.", pData[playerid][pAdminname]);
    return 1;
}

CMD:spec(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);

    if(!isnull(params) && !strcmp(params, "off", true))
    {
        if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
            return Error(playerid, "You are not spectating any player.");

		pData[pData[playerid][pSpec]][playerSpectated]--;
        PlayerSpectatePlayer(playerid, INVALID_PLAYER_ID);
        PlayerSpectateVehicle(playerid, INVALID_VEHICLE_ID);

        SetSpawnInfo(playerid, 0, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
        TogglePlayerSpectating(playerid, false);
		pData[playerid][pSpec] = -1;

        return Servers(playerid, "You are no longer in spectator mode.");
    }
	new otherid;
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/spectate [playerid/PartOfName] - Type '/spec off' to stop spectating.");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");
	if(otherid == playerid)
		return Error(playerid, "You can't spectate yourself bro..");

    if(pData[playerid][pAdmin] < pData[otherid][pAdmin])
        return Error(playerid, "You can't spectate admin higher than you.");
		
	if(pData[otherid][pSpawned] == 0)
	{
	    Error(playerid, "%s(%i) isn't spawned!", pData[otherid][pName], otherid);
	    return true;
	}

    if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
    {
        GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
        GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);

        pData[playerid][pInt] = GetPlayerInterior(playerid);
        pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
    }
    SetPlayerInterior(playerid, GetPlayerInterior(otherid));
    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(otherid));

    TogglePlayerSpectating(playerid, 1);

    if(IsPlayerInAnyVehicle(otherid))
	{
		new vID = GetPlayerVehicleID(otherid);
        PlayerSpectateVehicle(playerid, GetPlayerVehicleID(otherid));
		if(GetPlayerState(otherid) == PLAYER_STATE_DRIVER)
	    {
	    	Servers(playerid, "You are now spectating %s(%i) who is driving a %s(%d).", pData[otherid][pName], otherid, GetVehicleModelName(GetVehicleModel(vID)), vID);
		}
		else
		{
		    Servers(playerid, "You are now spectating %s(%i) who is a passenger in %s(%d).", pData[otherid][pName], otherid, GetVehicleModelName(GetVehicleModel(vID)), vID);
		}
	}
    else
	{
        PlayerSpectatePlayer(playerid, otherid);
	}
	pData[otherid][playerSpectated]++;
    SendStaffMessage(COLOR_RED, "%s now spectating %s (ID: %d).", pData[playerid][pAdminname], pData[otherid][pName], otherid);
    Servers(playerid, "You are now spectating %s (ID: %d).", pData[otherid][pName], otherid);
    pData[playerid][pSpec] = otherid;
    return 1;
}

CMD:slap(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
	new Float:POS[3], otherid;
	if(sscanf(params, "u", otherid))
	{
	    Usage(playerid, "/slap <ID>");
	    return true;
	}

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

	GetPlayerPos(otherid, POS[0], POS[1], POS[2]);
	SetPlayerPos(otherid, POS[0], POS[1], POS[2] + 9.0);
	if(IsPlayerInAnyVehicle(otherid)) 
	{
		RemovePlayerFromVehicle(otherid);
		//OnPlayerExitVehicle(otherid, GetPlayerVehicleID(otherid));
	}
	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah men-slap player %s", pData[playerid][pAdminname], pData[otherid][pName]);

	PlayerPlaySound(otherid, 1130, 0.0, 0.0, 0.0);
	return true;
}

CMD:caps(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
	new otherid;
 	if(sscanf(params, "u", otherid))
	{
	    Usage(playerid, "/caps <ID>");
	    Info(playerid, "Function: Will disable caps for the player, type again to enable caps.");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

	if(!GetPVarType(otherid, "Caps"))
	{
	    // Disable Caps
	    SetPVarInt(otherid, "Caps", 1);
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah menon-aktifkan anti caps kepada player %s", pData[playerid][pAdminname], pData[playerid][pName]);
	}
	else
	{
	    // Enable Caps
		DeletePVar(otherid, "Caps");
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah meng-aktifkan anti caps kepada player %s", pData[playerid][pAdminname], pData[playerid][pName]);
	}
	return true;
}

CMD:peject(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    Usage(playerid, "/peject <ID>");
	    return true;
	}

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

	if(!IsPlayerInAnyVehicle(otherid))
	{
		Error(playerid, "Player tersebut tidak berada dalam kendaraan!");
		return true;
	}

	new vv = GetVehicleModel(GetPlayerVehicleID(otherid));
	Servers(playerid, "You have successfully ejected %s(%i) from their %s.", pData[otherid][pName], otherid, GetVehicleModelName(vv - 400));
	Servers(otherid, "%s(%i) has ejected you from your %s.", pData[playerid][pName], playerid, GetVehicleModelName(vv));

	RemovePlayerFromVehicle(otherid);
	return true;
}

CMD:astats(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
	new otherid;
	if(sscanf(params, "u", otherid))
        return Usage(playerid, "/check [playerid/PartOfName]");
		
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

	if(pData[otherid][IsLoggedIn] == false)
        return Error(playerid, "That player is not logged in yet.");

	DisplayStats(playerid, otherid);
	return 1;
}

CMD:ostats(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
			
	new name[24], PlayerName[24];
	if(sscanf(params, "s[24]", name))
	{
	    Usage(playerid, "/ostats <player name>");
 		return true;
 	}

 	foreach(new ii : Player)
	{
		GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

		if(!strcmp(PlayerName, name, true))
		{
			Error(playerid, "Player is online, you can use /stats on them.");
	  		return true;
	  	}
	}

	// Load User Data
    new cVar[500];
    new cQuery[600];

	strcat(cVar, "email,admin,helper,level,levelup,vip,vip_time,coin,reg_date,last_login,money,bmoney,brek,hours,minutes,seconds,");
	strcat(cVar, "gender,age,faction,family,warn,job,job2,interior,world");

	mysql_format(g_SQL, cQuery, sizeof(cQuery), "SELECT %s FROM players WHERE username='%e' LIMIT 1", cVar, name);
	mysql_tquery(g_SQL, cQuery, "LoadStats", "is", playerid, name);
	return true;
}

CMD:acuff(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid, mstr[128];		
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/acuff [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "That player is disconnected.");

    if(otherid == playerid)
        return Error(playerid, "You cannot handcuff yourself.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(GetPlayerState(otherid) != PLAYER_STATE_ONFOOT)
        return Error(playerid, "The player must be onfoot before you can cuff them.");

    if(pData[otherid][pCuffed])
        return Error(playerid, "The player is already cuffed at the moment.");

    pData[otherid][pCuffed] = 1;
	SetPlayerCuffed(otherid, true);

    format(mstr, sizeof(mstr), "You've been ~r~cuffed~w~ by %s.", pData[playerid][pName]);
    InfoTD_MSG(otherid, 3500, mstr);

    Servers(playerid, "Player %s telah berhasil di cuffed.", pData[otherid][pName]);
    Servers(otherid, "Admin %s telah mengcuffed anda.", pData[playerid][pName]);
    return 1;
}

CMD:auncuff(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid;		
    if(sscanf(params, "u", otherid))
        return Usage(playerid, "/auncuff [playerid/PartOfName]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "That player is disconnected.");

    if(otherid == playerid)
        return Error(playerid, "You cannot uncuff yourself.");

    if(!NearPlayer(playerid, otherid, 5.0))
        return Error(playerid, "You must be near this player.");

    if(!pData[otherid][pCuffed])
        return Error(playerid, "The player is not cuffed at the moment.");

    static
        string[64];

    pData[otherid][pCuffed] = 0;
    SetPlayerCuffed(otherid, false);

    format(string, sizeof(string), "You've been ~g~uncuffed~w~ by %s.", pData[playerid][pName]);
    InfoTD_MSG(otherid, 3500, string);
	Servers(playerid, "Player %s telah berhasil uncuffed.", pData[otherid][pName]);
    Servers(otherid, "Admin %s telah uncuffed tangan anda.", pData[playerid][pName]);
    return 1;
}

CMD:givejetpack(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
	new otherid;		
    if(sscanf(params, "u", otherid))
    {
        //pData[playerid][pJetpack] = 1;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
    }
    else
    {
        //pData[playerid][pJetpack] = 1;
        SetPlayerSpecialAction(otherid, SPECIAL_ACTION_USEJETPACK);
        Servers(playerid, "You have spawned a jetpack for %s.", pData[playerid][pName]);
    }
    return 1;
}

CMD:getip(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
     	return PermissionError(playerid);
	new otherid, PlayerIP[16], giveplayer[24];
	if(sscanf(params, "u", otherid))
 	{
  		Usage(playerid, "/getip <ID>");
		return true;
	}
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "Player not connected!");
	if(pData[otherid][pAdmin] == 5)
 	{
  		Error(playerid, "You can't get the server owners ip!");
  		Servers(otherid, "%s(%i) tried to get your IP!", pData[playerid][pName], playerid);
  		return 1;
    }
	GetPlayerName(otherid, giveplayer, sizeof(giveplayer));
	GetPlayerIp(otherid, PlayerIP, sizeof(PlayerIP));

	Servers(playerid, "%s(%i)'s IP: %s", giveplayer, otherid, PlayerIP);
	return true;
}

CMD:aka(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
     	return PermissionError(playerid);
	new otherid, PlayerIP[16], query[128];
	if(sscanf(params, "u", otherid))
	{
	    Usage(playerid, "/aka <ID/Name>");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
	if(pData[otherid][pAdmin] == 5)
 	{
  		Error(playerid, "You can't AKA the server owner!");
  		Servers(otherid, "%s(%i) tried to AKA you!", pData[playerid][pName], playerid);
  		return 1;
    }
	GetPlayerIp(otherid, PlayerIP, sizeof(PlayerIP));
	mysql_format(g_SQL, query, sizeof(query), "SELECT username FROM players WHERE IP='%s'", PlayerIP);
	mysql_tquery(g_SQL, query, "CheckPlayerIP", "is", playerid, PlayerIP);
	return true;
}

CMD:akaip(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
     	return PermissionError(playerid);
	new query[128];
	if(isnull(params))
	{
	    Usage(playerid, "/akaip <IP>");
		return true;
	}

	mysql_format(g_SQL, query, sizeof(query), "SELECT username FROM players WHERE IP='%s'", params);
	mysql_tquery(g_SQL, query, "CheckPlayerIP2", "is", playerid, params);
	return true;
}

CMD:vmodels(playerid, params[])
{
    new string[3500];

    if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);

    for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
    {
        format(string,sizeof(string), "%s%d - %s\n", string, i+400, g_arrVehicleNames[i]);
    }
    Dialog_Show(playerid, DIALOG_UNUSED, DIALOG_STYLE_LIST, "Vehicle Models", string, "Close", "");
    return 1;
}

CMD:vehname(playerid, params[]) {

	if(pData[playerid][pAdmin] >= 1) 
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "--------------------------------------------------------------------------------------------------------------------------------");
		SendClientMessageEx(playerid, COLOR_WHITE, "Vehicle Search:");

		new
			string[128];

		if(isnull(params)) return Error(playerid, "No keyword specified.");
		if(!params[2]) return Error(playerid, "Search keyword too short.");

		for(new v; v < sizeof(g_arrVehicleNames); v++) 
		{
			if(strfind(g_arrVehicleNames[v], params, true) != -1) {

				if(isnull(string)) format(string, sizeof(string), "%s (ID %d)", g_arrVehicleNames[v], v+400);
				else format(string, sizeof(string), "%s | %s (ID %d)", string, g_arrVehicleNames[v], v+400);
			}
		}

		if(!string[0]) Error(playerid, "No results found.");
		else if(string[127]) Error(playerid, "Too many results found.");
		else SendClientMessageEx(playerid, COLOR_WHITE, string);

		SendClientMessageEx(playerid, COLOR_YELLOW, "--------------------------------------------------------------------------------------------------------------------------------");
	}
	else
	{
		PermissionError(playerid);
	}
	return 1;
}

CMD:jail(playerid, params[])
{
   	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);

	new reason[60], timeSec, otherid;
	if(sscanf(params, "uD(180)S(*)[60]", otherid, timeSec, reason))
	{
	    Usage(playerid, "/jail <ID/Name> (optional: <time in seconds> <reason>)");
	    return true;
	}

	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

	if(pData[otherid][pJail] > 0)
	{
	    Servers(playerid, "%s(%i) is already jailed (gets out in %d seconds)", pData[otherid][pName], otherid, pData[otherid][pJail]);
	    Info(playerid, "/unjail <ID/Name> to unjail.");
	    return true;
	}
	if(pData[otherid][pSpawned] == 0)
	{
	    Error(playerid, "%s(%i) isn't spawned!", pData[otherid][pName], otherid);
	    return true;
	}
	if(reason[0] != '*' && strlen(reason) > 60)
	{
	 	Error(playerid, "Reason too long! Must be smaller than 60 characters!");
	   	return true;
	}
	if(timeSec < 10 || timeSec > 600)
	{
	    if(pData[playerid][pAdmin] != 5)
	 	{
			Error(playerid, "Jail time must remain between 10 and 600 seconds");
	    	return true;
	  	}
	}
	pData[otherid][pJail] = timeSec;
	JailPlayer(otherid);
	if(reason[0] == '*')
	{
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah menjail player %s selama %d detik.", pData[playerid][pAdminname], pData[otherid][pName], timeSec);
	}
	else
	{
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah menjail player %s selama %d detik. "GREY2_E"[Reason: %s]", pData[playerid][pAdminname], pData[otherid][pName], timeSec, reason);
	}
	return true;
}


CMD:unjail(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);

	new otherid;
	if(sscanf(params, "u", otherid))
	{
	    Usage(playerid, "/unjail <ID/Name>");
	    return true;
	}

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");

	if(pData[otherid][pJail] == 0)
	    return Error(playerid, "The player isn't in jail!");

	pData[otherid][pJail] = 0;
	SetPlayerInterior(otherid, 0);
	SetPlayerVirtualWorld(otherid, 0);
	SpawnPlayer(otherid);
	SetPlayerPos(otherid, 1529.6,-1691.2,13.3);
	SetPlayerSpecialAction(otherid, SPECIAL_ACTION_NONE);

	SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah unjailed %s", pData[playerid][pAdminname], pData[otherid][pName]);
	return true;
}

CMD:kick(playerid, params[])
{
    static
        reason[128];

	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
			return PermissionError(playerid);
			
	new otherid;
    if(sscanf(params, "us[128]", otherid, reason))
        return Usage(playerid, "/kick [playerid/PartOfName] [reason]");

    if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "You have specified an invalid player.");

    if(pData[otherid][pAdmin] > pData[playerid][pAdmin])
        return Error(playerid, "The specified player has higher authority.");

    SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"%s was kicked by admin %s. Reason: %s.", pData[otherid][pName], pData[playerid][pAdminname], reason);
    //Log_Write("logs/kick_log.txt", "[%s] %s has kicked %s for: %s.", ReturnTime(), ReturnName(otherid, 0), ReturnName(otherid, 0), reason);
	SetPlayerPosition(otherid, 227.46, 110.0, 999.02, 360.0000, 10);
    KickEx(otherid);
    return 1;
}

CMD:ban(playerid, params[])
{
	if(pData[playerid][pAdmin] < 1)
	    return PermissionError(playerid);

	new ban_time, datez, tmp[60], otherid;
	if(sscanf(params, "uds[60]", otherid, datez, tmp))
	{
	    Usage(playerid, "/tempban <ID/Name> <time (in days) 0 for permanent> <reason> ");
	    return true;
	}
	if(otherid == INVALID_PLAYER_ID)
        return Error(playerid, "Player not connected!");
 	if(datez < 0) Error(playerid, "Please input a valid ban time.");
	if(pData[playerid][pAdmin] < 2)
	{
		if(datez > 10 || datez <= 0) return Error(playerid, "Anda hanya dapat membanned selama 1-10 hari!");
	}
	/*if(otherid == playerid)
	    return Error(playerid, "You are not able to ban yourself!");*/
	if(pData[otherid][pAdmin] > pData[playerid][pAdmin])
	{
		Servers(otherid, "** %s(%i) has just tried to ban you!", pData[playerid][pName], playerid);
 		Error(playerid, "You are not able to ban a admin with a higher level than you!");
 		return true;
   	}
	new PlayerIP[16], giveplayer[24];
	
   	//SetPlayerPosition(otherid, 405.1100,2474.0784,35.7369,360.0000);
	GetPlayerName(otherid, giveplayer, sizeof(giveplayer));
	GetPlayerIp(otherid, PlayerIP, sizeof(PlayerIP));

	if(!strcmp(tmp, "ab", true)) tmp = "Airbreak";
	else if(!strcmp(tmp, "ad", true)) tmp = "Advertising";
	else if(!strcmp(tmp, "ads", true)) tmp = "Advertising";
	else if(!strcmp(tmp, "hh", true)) tmp = "Health Hacks";
	else if(!strcmp(tmp, "wh", true)) tmp = "Weapon Hacks";
	else if(!strcmp(tmp, "sh", true)) tmp = "Speed Hacks";
	else if(!strcmp(tmp, "mh", true)) tmp = "Money Hacks";
	else if(!strcmp(tmp, "rh", true)) tmp = "Ram Hacks";
	else if(!strcmp(tmp, "ah", true)) tmp = "Ammo Hacks";
	if(datez != 0)
	{
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah membanned player %s selama %d hari. "GREY2_E"[Reason: %s]", pData[playerid][pAdminname], giveplayer, datez, tmp);
	}
	else
	{
		SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E"Admin %s telah membanned permanent player %s. "GREY2_E"[Reason: %s]", pData[playerid][pAdminname], giveplayer, tmp);
	}
	SetPlayerPosition(otherid, 227.46, 110.0, 999.02, 360.0000, 10);
	BanPlayerMSG(otherid, playerid, tmp);
 	if(datez != 0)
    {
		Servers(otherid, "This is a "RED_E"TEMP-BAN "GREY2_E"that will last for %d days.", datez);
		ban_time = gettime() + (datez * 86400);
	}
	else
	{
		Servers(otherid, "This is a "RED_E"Permanent Banned "GREY2_E"please contack admin for unbanned!.", datez);
		ban_time = datez;
	}
	new query[248];
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO banneds(name, ip, admin, reason, ban_date, ban_expire) VALUES ('%s', '%s', '%s', '%s', %i, %d)", giveplayer, PlayerIP, pData[playerid][pAdminname], tmp, gettime(), ban_time);
	mysql_tquery(g_SQL, query);
	KickEx(otherid);
	return true;
}