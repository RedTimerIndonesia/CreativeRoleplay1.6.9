CMD:acmds(playerid)
{
	if(pData[playerid][pAdmin] < 1)
		return PermissionError(playerid);

	new line3[2480];
	strcat(line3, ""WHITE_E"Administrator Commands:"LB2_E"\n\
 	/aduty /a /h /asay /togooc /o /goto /sendto /gethere /freeze /unfreeze /spec /slap\n\
 	/caps /peject /astats /ostats /acuff /auncuff /givejectpack /getip /aka /akaip /vmodels\n\
	/vehname /jail /unjail /kick /ban");

	strcat(line3, "\n\n"WHITE_E"Senior Admin Commands:"LB2_E"\n\
 	/gotoco /fixveh /repairveh /veh /setskin /explode /akill\n\
    /settime /setweather");

	strcat(line3, "\n\n"WHITE_E"Lead Admin Commands:"LB2_E"\n\
	/oban /banip /unbanip /reloadweap /resetweap /giveweap\n\
 	/sethbe /ojail /owarn /clearreports /createdoor /editdoor /gotodoor");

	strcat(line3, ""WHITE_E"\n\nHead Admin Commands:"LB2_E"\n\
	/setvip /takemoney /takecoin /setfaction /setleader\n\
 	/createhouse /edithouse /gotohouse /createbisnis /editbisnis /gotobisnis");

	strcat(line3, "\n\n"WHITE_E"Server Owner Commands:"LB2_E"\n\
	/sethelperlevel /setadminname /setmoney /givemoney /setbankmoney /givebankmoney\n\
	/setcoin /givecoin /setmaterial /setcomponent /setprice");
 	
	strcat(line3, "\n"BLUE_E"HCv4 "WHITE_E"- Anti-Cheat is actived.\n\
	"PINK_E"NOTE: All admin commands log is saved in database! | Abuse Commands? Kick And Demote Premanent!.");
	ShowPlayerDialog(playerid, NO_DIALOG, DIALOG_STYLE_MSGBOX, ""ORANGE_E"SoI:RP: "YELLOW_E"Staff Commands", line3, "OK","");
	return true;
}


CMD:hcmds(playerid)
{
	if(pData[playerid][pAdmin] < 1)
		if(pData[playerid][pHelper] == 0)
		return PermissionError(playerid);

	new line3[2480];
	strcat(line3, ""WHITE_E"Junior Helper Commands:"LB2_E"\n\
 	/aduty /h /asay /o /goto /sendto /gethere /freeze /unfreeze\n\
	/kick /slap /caps /acuff /auncuff /vmodels");

	strcat(line3, "\n\n"WHITE_E"Senior Helper Commands:"LB2_E"\n\
 	/spec /peject /astats /ostats /givejectpack\n\
    /jail /unjail");

	strcat(line3, "\n\n"WHITE_E"Head Helper Commands:"LB2_E"\n\
	/ban /unban");
 	
	strcat(line3, "\n"BLUE_E"HCv4 "WHITE_E"- Anti-Cheat is actived.\n\
	"PINK_E"NOTE: All admin commands log is saved in database! | Abuse Commands? Kick And Demote Premanent!.");
	ShowPlayerDialog(playerid, NO_DIALOG, DIALOG_STYLE_MSGBOX, ""ORANGE_E"SoI:RP: "YELLOW_E"Staff Commands", line3, "OK","");
	return true;
}