CMD:motd(playerid, params[])
{
    if(pData[playerid][pAdmin] >= 6)
    {
		if(isnull(params)) return Usage(playerid, "/motd [text (Max tulisan 250 Character)]");
    	/*format(String, sizeof(String), "AdmCmd: %s has changed the global motd to: %s.", GetName(playerid), params);
		ABroadCast( COLOR_LIGHTRED, String, 1);*/
		format(GlobalMOTD, sizeof(GlobalMOTD), "%s "RED"- %s", params, pData[playerid][pAdminname]);
		SendClientMessageEx(playerid, X11_LIGHTBLUE, "MOTDs: "WHITE"You've adjusted the Global MOTD.");
		SaveMOTDs();
	}
	return 1;
}

CMD:amotd(playerid, params[])
{
    if(pData[playerid][pAdmin] >= 6)
    {
		if(isnull(params)) return Usage(playerid, "/amotd [text (Max tulisan 250 Character)]");
		format(AdminMOTD, sizeof(AdminMOTD), "%s "RED"- %s", params, pData[playerid][pAdminname]);
		/*format(String, sizeof(String), "AdmCmd: %s has changed the admin motd to: %s.", GetName(playerid), params);
		ABroadCast( COLOR_LIGHTRED, String, 1);*/
		SendClientMessageEx(playerid, X11_LIGHTBLUE, "MOTDs: "WHITE"You've adjusted the Admin MOTD.");
		SaveMOTDs();
	}
	return 1;
}