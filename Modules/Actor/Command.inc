CMD:createactor(playerid, params[])
{
	new skin, name[80];
	if(pData[playerid][pAdmin] < 4) return SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	if(sscanf(params, "is[80]", skin, name)) return Usage(playerid, "/createactor [skinid] [name]");
	new Float:X,Float:Y,Float:Z;
	for(new idx=0; idx<MAX_ACTOR; idx++)
	{
	    if(!ActorsInfo[idx][aSkin])
	    {
	        GetPlayerPos(playerid, ActorsInfo[idx][aPosX], ActorsInfo[idx][aPosY], ActorsInfo[idx][aPosZ]);
			GetPlayerFacingAngle(playerid, ActorsInfo[idx][aPosR]);
			GetPlayerPos(playerid, X,Y,Z);
			SetPlayerPos(playerid, X,Y,Z+5);
  			ActorsInfo[idx][aSkin] = skin;
			format(ActorsInfo[idx][aName], 80, "%s", name);
			CreateActors(idx);
			// Text
			/*format(string, sizeof(string), "[AdmCmd]{FFFFFF} %s telah membuat Actors ID %d. (Skin: %d ; Name: %s)", GetPlayerNameEx(playerid), idx, skin, name);
			SendAdminMessage(COLOR_YELLOW, string);
			Log("logs/actors.log", string);*/
			idx = MAX_ACTOR;
			SaveActors();
		}
	}
	return 1;
}

CMD:usedactor(playerid, params[])
{
	new string[128];
	if(pData[playerid][pAdmin] < 4) return SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	SendClientMessage(playerid, X11_LIGHTBLUE, "[Used Actors]:");
	for(new idx=0; idx<MAX_ACTOR; idx++)
	{
	    if(ActorsInfo[idx][aId])
	    {
			format(string, sizeof(string), "ID: %d | Skin: %d | VW: %d | Int: %d", idx, ActorsInfo[idx][aSkin], ActorsInfo[idx][aVW], ActorsInfo[idx][aInt]);
			SendClientMessage(playerid, X11_WHITE, string);
	    }
	}
	return 1;
}

CMD:gotoactor(playerid, params[])
{
    new idx, string[128];
	if(pData[playerid][pAdmin] < 4) return SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	if(sscanf(params, "i", idx)) return Usage(playerid, "/gotoactor [actorid]");
	if(!ActorsInfo[idx][aId]) return SEM(playerid, "ERROR: Invalid actors id.");
	SetPlayerPos(playerid, ActorsInfo[idx][aPosX], ActorsInfo[idx][aPosY], ActorsInfo[idx][aPosZ]);
	format(string, sizeof(string), "TELEPORT: "WHITE"You have teleported to actors ID %d", idx);
	SendClientMessage(playerid, X11_LIGHTBLUE, string);
	return 1;
}

CMD:actorname(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
	{
		SEM(playerid, "ERROR: You don't have the privilege to use this command!");
		return 1;
	}

	new actorid, actorname[128];

	if(sscanf(params, "ds[128]", actorid, actorname)) return Usage(playerid, "/actorname [actorid] [name]");

	format(ActorsInfo[actorid][aName], 80, "%s", actorname);
	SendClientMessageEx(playerid, X11_LIGHTBLUE, "ACTORS: "WHITE"You have changed the name of the actors!");
	if(IsValidActor(ActorsInfo[actorid][aId])) DestroyActor(ActorsInfo[actorid][aId]);
	if(IsValidDynamic3DTextLabel(ActorsInfo[actorid][aTId])) DestroyDynamic3DTextLabel(ActorsInfo[actorid][aTId]);
	CreateActors(actorid);
	SaveActors();

	/*format(string, sizeof(string), "ACTORS: %s has edited actors [ID:%d]'s Name to %s.", GetPlayerNameEx(playerid), actorid, actorname);
	Log("logs/aedit.log", string);*/
	return 1;
}

CMD:actornear(playerid, params[])
{
    if(pData[playerid][pAdmin] >= 4)
	{
		SendClientMessageEx(playerid, COLOR_REALRED, "ACTORS: "WHITE"Listing all Actors within 50 meters of you");
		new Float:X, Float:Y, Float:Z;
  		GetPlayerPos(playerid, X, Y, Z);
		for(new i;i<MAX_ACTOR;i++)
		{
			if(IsPlayerInRangeOfPoint(playerid, 50, ActorsInfo[i][aPosX], ActorsInfo[i][aPosY], ActorsInfo[i][aPosZ]))
			{
			    new string[128];
			   	format(string, sizeof(string), "[ID:%d] | Coordinate: %f ", i, GetDistance(ActorsInfo[i][aPosX], ActorsInfo[i][aPosY], ActorsInfo[i][aPosZ], X, Y, Z));
			   	SendClientMessageEx(playerid, X11_WHITE, string);
   			}
		}
	}
	else
	{
	    SEM(playerid, "ERROR: You don't have the privilege to use this command!");
	}
	return 1;
}

CMD:actoranim(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
	{
		SEM(playerid, "ERROR: You don't have the privilege to use this command!");
		return 1;
	}

	new actorid;
	if(sscanf(params, "d", actorid))
	{
		Usage(playerid, "/actoranim [actorid]");
		return 1;
	}

	SetPVarInt(playerid, "aPlayAnim", actorid);
	if(actorid >= MAX_ACTOR)
	{
  		SEM(playerid, "ERROR: Invalid Actors ID!");
		return 1;
	}

	ShowPlayerDialog(playerid, DIALOG_ACANIM, DIALOG_STYLE_LIST, "Actor Anim",
 	"Seat down\nIdlestance Fat\nIdlestance Old\nPool Idle Stance\nWoman Idlestance\nIdle Stance\nCopbrowse In\nCopbrowse Loop\nCopbrowse Nod\nCopbrowse Out\nCopbrowse shake\nCoplook In\nCoplook Loop\nCoplook Nod\nCoplook Out\nCoplook Shake\nCoplook Think\nCoplook Watch\nLean Idle\nPlyrlean Loop\nKILL Knife Ped Die\nKO Shot Face\nKO Shot Stom\nBike FallR\nBike Fall Off\nGnstwall Injurd\nSweet Injuredloop"
	, "Pilih", "Close");
	return 1;
}

CMD:actoredit(playerid, params[])
{
    if(pData[playerid][pAdmin] < 4)
	{
		SEM(playerid, "ERROR: You don't have the privilege to use this command!");
		return 1;
	}

	new string[128], choice[32], actorid, amount;
	if(sscanf(params, "s[32]dD", choice, actorid, amount))
	{
		Usage(playerid, "/actoredit [name] [actorid] [amount]");
		SendClientMessageEx(playerid, X11_GREY, "Available name: Exterior, Skin, Delete, Refresh, Clearanim");
		return 1;
	}

	if(actorid >= MAX_ACTOR)
	{
		SEM(playerid, "ERROR: Invalid Actors ID!");
		return 1;
	}

	if(strcmp(choice, "exterior", true) == 0)
	{
  		if(ActorsInfo[actorid][aPosX])
  		{
	  		if(!IsNull(ActorsInfo[actorid][aName]))
	  		{
				GetPlayerPos(playerid, ActorsInfo[actorid][aPosX], ActorsInfo[actorid][aPosY], ActorsInfo[actorid][aPosZ]);
				GetPlayerFacingAngle(playerid, ActorsInfo[actorid][aPosR]);
				ActorsInfo[actorid][aVW] = GetPlayerVirtualWorld(playerid);
				ActorsInfo[actorid][aInt] = GetPlayerInterior(playerid);
				SendClientMessageEx(playerid, X11_LIGHTBLUE, "ACTORS: "WHITE"You have changed the exterior!");
				if(IsValidActor(ActorsInfo[actorid][aId])) DestroyActor(ActorsInfo[actorid][aId]);
				if(IsValidDynamic3DTextLabel(ActorsInfo[actorid][aTId])) DestroyDynamic3DTextLabel(ActorsInfo[actorid][aTId]);
				CreateActors(actorid);
				SaveActors();
				/*format(string, sizeof(string), "[ActorS] Admin %s has edited actorid %d's Exterior.", GetPlayerNameEx(playerid), actorid);
				Log("logs/aedit.log", string);*/
			}
			else
			{
				SEM(playerid, "ERROR: The Actors not created.");
			}
		}
	}
	else if(strcmp(choice, "skin", true) == 0)
	{
		ActorsInfo[actorid][aSkin] = amount;

		format(string, sizeof(string), "ACTORS: "WHITE"You have changed skin "YELLOW"%d", amount);
		SendClientMessageEx(playerid, X11_LIGHTBLUE, string);

		if(IsValidActor(ActorsInfo[actorid][aId])) DestroyActor(ActorsInfo[actorid][aId]);
		if(IsValidDynamic3DTextLabel(ActorsInfo[actorid][aTId])) DestroyDynamic3DTextLabel(ActorsInfo[actorid][aTId]);
		CreateActors(actorid);

		SaveActors();
		/*format(string, sizeof(string), "ACTORS: Admin %s has edited actorid %d's Skin.", GetPlayerNameEx(playerid), actorid);
		Log("logs/aedit.log", string);*/
		return 1;
	}
	else if(strcmp(choice, "clearanim", true) == 0)
	{
		ActorsInfo[actorid][aAnim] = 0;
		ClearActorAnimations(actorid);

		format(string, sizeof(string), "ACTORS: "WHITE"You have clear animation actorid "YELLOW"}%d", actorid);
		SendClientMessageEx(playerid, X11_LIGHTBLUE, string);

		SaveActors();
		/*format(string, sizeof(string), "ACTORS: Admin %s has clear animation actorid %d.", GetPlayerNameEx(playerid), actorid);
		Log("logs/aedit.log", string);*/
		return 1;
	}
	else if(strcmp(choice, "refresh", true) == 0)
	{
		format(string, sizeof(string), "ACTORS: "WHITE"You have refresh actor id "YELLOW"%d", actorid);
		SendClientMessageEx(playerid, X11_LIGHTBLUE, string);

		if(IsValidActor(ActorsInfo[actorid][aId])) DestroyActor(ActorsInfo[actorid][aId]);
		if(IsValidDynamic3DTextLabel(ActorsInfo[actorid][aTId])) DestroyDynamic3DTextLabel(ActorsInfo[actorid][aTId]);
		CreateActors(actorid);

		SaveActors();
		/*format(string, sizeof(string), "ACTORS: Admin %s has refresh actorid %d.", GetPlayerNameEx(playerid), actorid);
		Log("logs/aedit.log", string);*/
		return 1;
	}
	else if(strcmp(choice, "delete", true) == 0)
	{
    	if(IsValidActor(ActorsInfo[actorid][aId])) DestroyActor(ActorsInfo[actorid][aId]);
	    DestroyDynamic3DTextLabel(ActorsInfo[actorid][aTId]);
		ActorsInfo[actorid][aName] = 0;
		ActorsInfo[actorid][aVW] = 0;
		ActorsInfo[actorid][aInt] = 0;
		ActorsInfo[actorid][aPosX] = 0;
		ActorsInfo[actorid][aPosY] = 0;
		ActorsInfo[actorid][aPosZ] = 0;
		ActorsInfo[actorid][aPosR] = 0;
		ActorsInfo[actorid][aSkin] = 0;
		SaveActors();
		/*format(string, sizeof(string), "ACTORS: {FFFFFF}You have delete actor id {FFFF00}%d.", actorid);*/
		//SendClientMessageEx(playerid, COLOR_RIKO, string);
		/*format(string, sizeof(string), "ACTORS: Admin %s has delete actors id %d", GetPlayerNameEx(playerid), actorid);
		Log("logs/aedit.log", string);*/
		return 1;
	}
	return 1;
}