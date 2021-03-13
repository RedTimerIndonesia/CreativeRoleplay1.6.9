#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    LoadActors();
    return 1;
}

hook OnGameModeExit()
{
    SaveActors();
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_ACANIM)//ACTOR SYSTEM
	{
	    if(!response) return -1;
        new actorid = GetPVarInt(playerid, "aPlayAnim");
	    if(response)
	    {
	        if(listitem == 0)
	        {
				ApplyActorAnimation(actorid,"ped","SEAT_down",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 1;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 1)
	        {
				ApplyActorAnimation(actorid,"ped","Idlestance_fat",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 2;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 2)
	        {
				ApplyActorAnimation(actorid,"ped","Idlestance_old",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 3;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 3)
	        {
				ApplyActorAnimation(actorid,"POOL","POOL_Idle_Stance",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 4;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 4)
	        {
				ApplyActorAnimation(actorid,"ped","woman_idlestance",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 5;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 5)
	        {
				ApplyActorAnimation(actorid,"ped","IDLE_stance",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 6;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 6)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_in",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 7;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 7)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_loop",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 8;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 8)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_nod",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 9;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 9)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_out",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 10;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 10)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_shake",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 11;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 11)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_in",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 12;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 12)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_loop",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 13;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 13)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_nod",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 14;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 14)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_out",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 15;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 15)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_shake",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 16;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 16)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_think",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 17;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 17)
	        {
				ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_watch",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 18;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 18)
	        {
				ApplyActorAnimation(actorid,"GANGS","leanIDLE",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 19;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 19)
	        {
				ApplyActorAnimation(actorid,"MISC","Plyrlean_loop",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 20;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 20)
	        {
				ApplyActorAnimation(actorid,"KNIFE", "KILL_Knife_Ped_Die",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 21;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 21)
	        {
				ApplyActorAnimation(actorid,"PED", "KO_shot_face",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 22;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 22)
	        {
				ApplyActorAnimation(actorid,"PED", "KO_shot_stom",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 23;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 23)
	        {
				ApplyActorAnimation(actorid,"PED", "BIKE_fallR",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 24;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 24)
	        {
				ApplyActorAnimation(actorid,"PED", "BIKE_fall_off",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 25;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 25)
	        {
				ApplyActorAnimation(actorid,"SWAT","gnstwall_injurd",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 26;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
	        if(listitem == 26)
	        {
				ApplyActorAnimation(actorid,"SWEET","Sweet_injuredloop",4.0,0,0,0,1,0);
				ActorsInfo[actorid][aAnim] = 27;
				SaveActors();

				SendClientMessageEx(playerid, COLOR_RIKO, "ACTORS: "WHITE"You have changed animation");
				/*format(string, sizeof(string), "{B0C4DE}ACTORS: Admin {FF0000}%s {FFFFFF}has edited actorid {FFFF00}%d{FFFFFF}'s Animation.", GetPlayerNameEx(playerid), actorid);
				Log("logs/acedit.log", string);*/
			}
		}
	}
    return 1;
}

forward splits(const strsrc[], strdest[][], delimiter);

public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}