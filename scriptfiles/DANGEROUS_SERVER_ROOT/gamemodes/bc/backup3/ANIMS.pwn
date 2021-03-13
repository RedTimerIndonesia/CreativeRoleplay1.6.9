
new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new gPlayerAnimLibsPreloaded[MAX_PLAYERS];

StopLoopingAnim(playerid)
{
	gPlayerUsingLoopingAnim[playerid] = 0;
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.0, 0, 0, 0, 0, 0, 1);
}

PreloadAnimLib(playerid, animlib[])
{
	ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0,1);
}

IsInLowRider(playerid) {
	new pveh = GetPlayerVehicleID(playerid);
	switch(GetVehicleModel(pveh)) {
		case 536, 575, 567: return 1;
	}
	return 0;
}

//OnPlayerSpawn
LoadAnims(playerid)
{
	if(!gPlayerAnimLibsPreloaded[playerid])
	{
	    PreloadAnimLib(playerid,"AIRPORT");
		PreloadAnimLib(playerid,"Attractors");
		PreloadAnimLib(playerid,"BAR");
		PreloadAnimLib(playerid,"BASEBALL");
		PreloadAnimLib(playerid,"BD_FIRE");
		PreloadAnimLib(playerid,"benchpress");
        PreloadAnimLib(playerid,"BF_injection");
        PreloadAnimLib(playerid,"BIKED");
        PreloadAnimLib(playerid,"BIKEH");
        PreloadAnimLib(playerid,"BIKELEAP");
        PreloadAnimLib(playerid,"BIKES");
        PreloadAnimLib(playerid,"BIKEV");
        PreloadAnimLib(playerid,"BIKE_DBZ");
        PreloadAnimLib(playerid,"BMX");
        PreloadAnimLib(playerid,"BOX");
        PreloadAnimLib(playerid,"BSKTBALL");
        PreloadAnimLib(playerid,"BUDDY");
        PreloadAnimLib(playerid,"BUS");
        PreloadAnimLib(playerid,"CAMERA");
        PreloadAnimLib(playerid,"CAR");
        PreloadAnimLib(playerid,"CAR_CHAT");
        PreloadAnimLib(playerid,"CASINO");
        PreloadAnimLib(playerid,"CHAINSAW");
        PreloadAnimLib(playerid,"CHOPPA");
        PreloadAnimLib(playerid,"CLOTHES");
        PreloadAnimLib(playerid,"COACH");
        PreloadAnimLib(playerid,"COLT45");
        PreloadAnimLib(playerid,"COP_DVBYZ");
        PreloadAnimLib(playerid,"CRIB");
        PreloadAnimLib(playerid,"DAM_JUMP");
        PreloadAnimLib(playerid,"DANCING");
        PreloadAnimLib(playerid,"DILDO");
        PreloadAnimLib(playerid,"DODGE");
        PreloadAnimLib(playerid,"DOZER");
        PreloadAnimLib(playerid,"DRIVEBYS");
        PreloadAnimLib(playerid,"FAT");
        PreloadAnimLib(playerid,"FIGHT_B");
        PreloadAnimLib(playerid,"FIGHT_C");
        PreloadAnimLib(playerid,"FIGHT_D");
        PreloadAnimLib(playerid,"FIGHT_E");
        PreloadAnimLib(playerid,"FINALE");
        PreloadAnimLib(playerid,"FINALE2");
        PreloadAnimLib(playerid,"Flowers");
        PreloadAnimLib(playerid,"FOOD");
        PreloadAnimLib(playerid,"Freeweights");
        PreloadAnimLib(playerid,"GANGS");
        PreloadAnimLib(playerid,"GHANDS");
        PreloadAnimLib(playerid,"GHETTO_DB");
        PreloadAnimLib(playerid,"goggles");
        PreloadAnimLib(playerid,"GRAFFITI");
        PreloadAnimLib(playerid,"GRAVEYARD");
        PreloadAnimLib(playerid,"GRENADE");
        PreloadAnimLib(playerid,"GYMNASIUM");
        PreloadAnimLib(playerid,"HAIRCUTS");
        PreloadAnimLib(playerid,"HEIST9");
        PreloadAnimLib(playerid,"INT_HOUSE");
        PreloadAnimLib(playerid,"INT_OFFICE");
        PreloadAnimLib(playerid,"INT_SHOP");
        PreloadAnimLib(playerid,"JST_BUISNESS");
        PreloadAnimLib(playerid,"KART");
        PreloadAnimLib(playerid,"KISSING");
        PreloadAnimLib(playerid,"KNIFE");
        PreloadAnimLib(playerid,"LAPDAN1");
        PreloadAnimLib(playerid,"LAPDAN2");
        PreloadAnimLib(playerid,"LAPDAN3");
        PreloadAnimLib(playerid,"LOWRIDER");
        PreloadAnimLib(playerid,"MD_CHASE");
        PreloadAnimLib(playerid,"MEDIC");
        PreloadAnimLib(playerid,"MD_END");
        PreloadAnimLib(playerid,"MISC");
        PreloadAnimLib(playerid,"MTB");
        PreloadAnimLib(playerid,"MUSCULAR");
        PreloadAnimLib(playerid,"NEVADA");
        PreloadAnimLib(playerid,"ON_LOOKERS");
        PreloadAnimLib(playerid,"OTB");
        PreloadAnimLib(playerid,"PARACHUTE");
        PreloadAnimLib(playerid,"PARK");
        PreloadAnimLib(playerid,"PAULNMAC");
        PreloadAnimLib(playerid,"PED");
        PreloadAnimLib(playerid,"PLAYER_DVBYS");
        PreloadAnimLib(playerid,"PLAYIDLES");
        PreloadAnimLib(playerid,"POLICE");
        PreloadAnimLib(playerid,"POOL");
        PreloadAnimLib(playerid,"POOR");
        PreloadAnimLib(playerid,"PYTHON");
        PreloadAnimLib(playerid,"QUAD");
        PreloadAnimLib(playerid,"QUAD_DBZ");
        PreloadAnimLib(playerid,"RIFLE");
        PreloadAnimLib(playerid,"RIOT");
        PreloadAnimLib(playerid,"ROB_BANK");
        PreloadAnimLib(playerid,"ROCKET");
        PreloadAnimLib(playerid,"RUSTLER");
        PreloadAnimLib(playerid,"RYDER");
        PreloadAnimLib(playerid,"SCRATCHING");
        PreloadAnimLib(playerid,"SHAMAL");
        PreloadAnimLib(playerid,"SHOTGUN");
        PreloadAnimLib(playerid,"SILENCED");
        PreloadAnimLib(playerid,"SKATE");
        PreloadAnimLib(playerid,"SPRAYCAN");
        PreloadAnimLib(playerid,"STRIP");
        PreloadAnimLib(playerid,"SUNBATHE");
        PreloadAnimLib(playerid,"SWAT");
        PreloadAnimLib(playerid,"SWEET");
        PreloadAnimLib(playerid,"SWIM");
        PreloadAnimLib(playerid,"SWORD");
        PreloadAnimLib(playerid,"TANK");
        PreloadAnimLib(playerid,"TATTOOS");
        PreloadAnimLib(playerid,"TEC");
        PreloadAnimLib(playerid,"TRAIN");
        PreloadAnimLib(playerid,"TRUCK");
        PreloadAnimLib(playerid,"UZI");
        PreloadAnimLib(playerid,"VAN");
        PreloadAnimLib(playerid,"VENDING");
        PreloadAnimLib(playerid,"VORTEX");
        PreloadAnimLib(playerid,"WAYFARER");
        PreloadAnimLib(playerid,"WEAPONS");
        PreloadAnimLib(playerid,"WUZI");
        PreloadAnimLib(playerid,"SNM");
        PreloadAnimLib(playerid,"BLOWJOBZ");
        PreloadAnimLib(playerid,"SEX");
   		PreloadAnimLib(playerid,"BOMBER");
   		PreloadAnimLib(playerid,"RAPPING");
    	PreloadAnimLib(playerid,"SHOP");
   		PreloadAnimLib(playerid,"BEACH");
   		PreloadAnimLib(playerid,"SMOKING");
    	PreloadAnimLib(playerid,"FOOD");
    	PreloadAnimLib(playerid,"ON_LOOKERS");
    	PreloadAnimLib(playerid,"DEALER");
		PreloadAnimLib(playerid,"CRACK");
		PreloadAnimLib(playerid,"CARRY");
		PreloadAnimLib(playerid,"COP_AMBIENT");
		PreloadAnimLib(playerid,"PARK");
		PreloadAnimLib(playerid,"INT_HOUSE");
		PreloadAnimLib(playerid,"FOOD");
		gPlayerAnimLibsPreloaded[playerid] = 1;
	}
}

alias:anime("an", "anim", "anims", "animation", "animations")
CMD:anime(playerid, params[])// 24/02/2014
{
	new str[3500];
    strcat(str, ""LG_E"/astop(press H to stop anims) /fall - /fallback - /injured - /akick - /push - /lowbodypush - /handsup - /bomb - /drunk - /getarrested\n");
    strcat(str, ""LB_E"/laugh - /sup - /basket - /headbutt - /medic - /spray - /robman - /taichi - /lookout - /kiss - /cellin - /cellout - /crossarms - /lay\n");
	strcat(str, ""LG_E"/deal - /crack - /smokeanim - /groundsit - /chat - /chat2 - /dance - /fucku - /strip - /hide - /vomit - /eat - /chairsit - /reload\n");
    strcat(str, ""LB_E"/koface - /kostomach - /rollfall - /carjacked1 - /carjacked2 - /rcarjack1 - /rcarjack2 - /lcarjack1 - /lcarjack2 - /bat\n");
    strcat(str, ""LG_E"/lifejump - /exhaust - /leftslap - /carlock - /hoodfrisked - /lightcig - /tapcig - /box - /lay2 - /chant - /finger\n");
    strcat(str, ""LB_E"/shouting - /knife - /cop - /elbow - /kneekick - /airkick - /gkick - /gpunch - /fstance - /lowthrow - /highthrow - /aim\n");
    strcat(str, ""LG_E"/pee - /lean - /run - /poli - /surrender - /sit - /breathless - /seat - /rap - /cross - /ped - /jiggy - /gesture\n");
    strcat(str, ""LB_E"/sleep - /smoke - /urinate - /chora - /relax - /crabs - /stop - /wash - /mourn - /fuck - /tosteal\n");
    strcat(str, ""LG_E"/followme - /greeting - /still - /hitch - /palmbitch - /cpranim - /giftgiving - /slap2 - /pump - /cheer\n");
    strcat(str, ""LB_E"/dj - /entrenar - /foodeat - /wave - /slapass - /dealer - /dealstance - /gwalk - /inbedright - /inbedleft\n");
	strcat(str, ""LG_E"/wank - /sexy - /bj - /getup - /follow - /stand - /slapped - /slapass - /yes - /celebrate - /win - /checkout\n");
	strcat(str, ""LB_E"/thankyou - /invite1 - /scratch - /nod - /cry - /carsmoke - /benddown - /shakehead - /angry\n");
	strcat(str, ""LG_E"/cockgun - /bar - /liftup - /putdown - /die - /joint - /bed - /lranim\n");
    ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, ""RED_E"Animations", str, "Close", "");
	return 1;
}

CMD:astop(playerid, params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	ClearAnimations(playerid);
	StopLoopingAnim(playerid);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	TogglePlayerControllable(playerid, 1);
	return 1;
}

CMD:surrender(playerid,params[])
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pInjured] == 0)
	{
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
		return 1;
	}
	else return Error(playerid, "You can't do at this moment.");
}
	
CMD:sit(playerid,params[])
{
	new anim;
	
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	
	if(sscanf(params, "d", anim)) return Usage(playerid,"/sit [1-5]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"BEACH","bather",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"BEACH","Lay_Bac_Loop",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"BEACH","ParkSit_W_loop",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"BEACH","SitnWait_loop_W",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/sit [1-5]");
	}
	return 1;
}
	
/*CMD:sleep(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/sleep [1-2]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"CRACK","crckdeth4",4.1, 0, 1, 1, 1, 1, 1); 
		case 2: ApplyAnimation(playerid,"CRACK","crckidle2",4.1, 0, 1, 1, 1, 1, 1); 
	}
	return 1;
}*/

CMD:cheer(playerid,params[])
{
	new anim;
	
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/cheer [1-8]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"ON_LOOKERS","shout_01",4.1, 0, 1, 1, 1, 1, 1); 
		case 2: ApplyAnimation(playerid,"ON_LOOKERS","shout_02",4.1, 0, 1, 1, 1, 1, 1); 
		case 3: ApplyAnimation(playerid,"ON_LOOKERS","shout_in",4.1, 0, 1, 1, 1, 1, 1); 
		case 4: ApplyAnimation(playerid,"RIOT","RIOT_ANGRY_B",4.1, 0, 1, 1, 1, 1, 1); 
		case 5: ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.1, 0, 1, 1, 1, 1, 1); 
		case 6: ApplyAnimation(playerid,"RIOT","RIOT_shout",4.1, 0, 1, 1, 1, 1, 1); 
		case 7: ApplyAnimation(playerid,"STRIP","PUN_HOLLER",4.1, 0, 1, 1, 1, 1, 1); 
		case 8: ApplyAnimation(playerid,"OTB","wtchrace_win",4.1, 0, 1, 1, 1, 1, 1); 
	}
	return 1;
}
	
CMD:urinate(playerid,params[])
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	SetPlayerSpecialAction(playerid, 68);
	return 1;
}
	
CMD:dj(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/dj [1-4]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"SCRATCHING","scdldlp",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"SCRATCHING","scdlulp",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"SCRATCHING","scdrdlp",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"SCRATCHING","scdrulp",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/dj [1-4]");
	}
	return 1;
}
	
CMD:breathless(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/breathless [1-2]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"PED","IDLE_tired",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"FAT","IDLE_tired",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/breathless [1-2]");
	}
	return 1;
}
	
CMD:poli(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/poli [1-2]");
	switch(anim){
		case 1:ApplyAnimation(playerid,"POLICE","CopTraf_Come",4.1, 0, 1, 1, 1, 1, 1);
		case 2:ApplyAnimation(playerid,"POLICE","CopTraf_Stop",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/poli [1-2]");
	}
	return 1;
}
	
CMD:seat(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/seat [1-7]");
	if(anim < 1 || anim > 7) return Usage(playerid,"/seat [1-7]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"Attractors","Stepsit_in",4.1, 0, 1, 1, 1, 1, 1);// Not looping
		case 2: ApplyAnimation(playerid,"CRIB","PED_Console_Loop",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"INT_HOUSE","LOU_In",4.1, 0, 1, 1, 1, 1, 1); // Not looping
		case 4: ApplyAnimation(playerid,"MISC","SEAT_LR",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"MISC","Seat_talk_01",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"MISC","Seat_talk_02",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"ped","SEAT_down",4.1, 0, 1, 1, 1, 1, 1); // Not looping
	}
	return 1;
}
	
CMD:dance(playerid,params[])
{
	new dancestyle;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", dancestyle)) return Usage(playerid,"/dance [1-3]");
	switch(dancestyle){
		case 1: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	}
	return 1;
}
	
CMD:cross(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/cross [1-5]");

	switch(anim){
		case 1: ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE", 4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid, "DEALER", "DEALER_IDLE_01", 4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"GRAVEYARD","prst_loopa",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/cross [1-5]");
	}
	return 1;
}
	
CMD:jiggy(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/jiggy [1-10]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"DANCING","DAN_Down_A",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"DANCING","DAN_Left_A",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"DANCING","DAN_Loop_A",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"DANCING","DAN_Right_A",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"DANCING","DAN_Up_A",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"DANCING","dnce_M_a",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"DANCING","dnce_M_b",4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid,"DANCING","dnce_M_c",4.1, 0, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid,"DANCING","dnce_M_d",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/jiggy [1-10]");
	}
	return 1;
}
	
CMD:ped(playerid,params[])
{
	new anim;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", anim)) return Usage(playerid,"/ped [1-26]");
	switch(anim){
		case 1: ApplyAnimation(playerid,"PED","JOG_femaleA",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"PED","JOG_maleA",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"PED","WOMAN_walkfatold",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"PED","run_fat",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"PED","run_fatold",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"PED","run_old",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"PED","Run_Wuzi",4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"PED","swat_run",4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid,"PED","WALK_fat",4.1, 0, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid,"PED","WALK_fatold",4.1, 0, 1, 1, 1, 1, 1);
		case 11: ApplyAnimation(playerid,"PED","WALK_gang1",4.1, 0, 1, 1, 1, 1, 1);
		case 12: ApplyAnimation(playerid,"PED","WALK_gang2",4.1, 0, 1, 1, 1, 1, 1);
		case 13: ApplyAnimation(playerid,"PED","WALK_old",4.1, 0, 1, 1, 1, 1, 1);
		case 14: ApplyAnimation(playerid,"PED","WALK_shuffle",4.1, 0, 1, 1, 1, 1, 1);
		case 15: ApplyAnimation(playerid,"PED","woman_run",4.1, 0, 1, 1, 1, 1, 1);
		case 16: ApplyAnimation(playerid,"PED","WOMAN_runbusy",4.1, 0, 1, 1, 1, 1, 1);
		case 17: ApplyAnimation(playerid,"PED","WOMAN_runfatold",4.1, 0, 1, 1, 1, 1, 1);
		case 18: ApplyAnimation(playerid,"PED","woman_runpanic",4.1, 0, 1, 1, 1, 1, 1);
		case 19: ApplyAnimation(playerid,"PED","WOMAN_runsexy",4.1, 0, 1, 1, 1, 1, 1);
		case 20: ApplyAnimation(playerid,"PED","WOMAN_walkbusy",4.1, 0, 1, 1, 1, 1, 1);
		case 21: ApplyAnimation(playerid,"PED","WOMAN_walkfatold",4.1, 0, 1, 1, 1, 1, 1);
		case 22: ApplyAnimation(playerid,"PED","WOMAN_walknorm",4.1, 0, 1, 1, 1, 1, 1);
		case 23: ApplyAnimation(playerid,"PED","WOMAN_walkold",4.1, 0, 1, 1, 1, 1, 1);
		case 24: ApplyAnimation(playerid,"PED","WOMAN_walkpro",4.1, 0, 1, 1, 1, 1, 1);
		case 25: ApplyAnimation(playerid,"PED","WOMAN_walksexy",4.1, 0, 1, 1, 1, 1, 1);
		case 26: ApplyAnimation(playerid,"PED","WOMAN_walkshop",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/ped [1-26]");
	}
	return 1;
}
	
CMD:rap(playerid,params[])
{
	new rapstyle;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", rapstyle)) return Usage(playerid, "/rap [1-3]");
	switch(rapstyle){
		case 1: ApplyAnimation(playerid,"RAPPING","RAP_A_Loop",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"RAPPING","RAP_C_Loop",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/rap [1-3]");
	}
	return 1;
}
	
CMD:gesture(playerid,params[])
{
	new gesture;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", gesture)) return Usage(playerid, "/gesture [1-15]");
	switch(gesture){
		case 1: ApplyAnimation(playerid,"GHANDS","gsign1",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"GHANDS","gsign1LH",4.1, 0, 1, 1, 1, 1, 1);
		case 3: ApplyAnimation(playerid,"GHANDS","gsign2",4.1, 0, 1, 1, 1, 1, 1);
		case 4: ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1, 0, 1, 1, 1, 1, 1);
		case 5: ApplyAnimation(playerid,"GHANDS","gsign3",4.1, 0, 1, 1, 1, 1, 1);
		case 6: ApplyAnimation(playerid,"GHANDS","gsign3LH",4.1, 0, 1, 1, 1, 1, 1);
		case 7: ApplyAnimation(playerid,"GHANDS","gsign4",4.1, 0, 1, 1, 1, 1, 1);
		case 8: ApplyAnimation(playerid,"GHANDS","gsign4LH",4.1, 0, 1, 1, 1, 1, 1);
		case 9: ApplyAnimation(playerid,"GHANDS","gsign5",4.1, 0, 1, 1, 1, 1, 1);
		case 10: ApplyAnimation(playerid,"GHANDS","gsign5",4.1, 0, 1, 1, 1, 1, 1);
		case 11: ApplyAnimation(playerid,"GHANDS","gsign5LH",4.1, 0, 1, 1, 1, 1, 1);
		case 12: ApplyAnimation(playerid,"GANGS","Invite_No",4.1, 0, 1, 1, 1, 1, 1);
		case 13: ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1, 0, 1, 1, 1, 1, 1);
		case 14: ApplyAnimation(playerid,"GANGS","prtial_gngtlkD",4.1, 0, 1, 1, 1, 1, 1);
		case 15: ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid,"/gesture [1-15]");
	}
	return 1;
}
	
CMD:smoke(playerid,params[])
{
	new gesture;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "d", gesture)) return Usage(playerid, "/smoke [1-2]");
	switch(gesture){
		case 1: ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1, 0, 1, 1, 1, 1, 1);
		case 2: ApplyAnimation(playerid,"SMOKING","M_smklean_loop",4.1, 0, 1, 1, 1, 1, 1);
		default: return Usage(playerid, "/smoke [1-2]");
	}
	return 1;
}
	
CMD:chora(playerid,params[]) { ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_watch",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:relax(playerid,params[]) { ApplyAnimation(playerid, "CRACK", "crckidle1",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:crabs(playerid,params[]) { ApplyAnimation(playerid,"MISC","Scratchballs_01",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:greeting(playerid,params[]) { ApplyAnimation(playerid,"ON_LOOKERS","Pointup_loop",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:stop(playerid,params[]) { ApplyAnimation(playerid,"PED","endchat_01",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:wash(playerid,params[]) { ApplyAnimation(playerid,"BD_FIRE","wash_up",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:mourn(playerid,params[]) { ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:followme(playerid,params[]) { ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:still(playerid,params[]) { ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:hitch(playerid,params[]) { ApplyAnimation(playerid,"MISC","Hiker_Pose", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:palmbitch(playerid,params[]) { ApplyAnimation(playerid,"MISC","bitchslap",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:cpranim(playerid,params[]) { ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:giftgiving(playerid,params[]) { ApplyAnimation(playerid,"KISSING","gift_give",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:slap2(playerid,params[]) { ApplyAnimation(playerid,"SWEET","sweet_ass_slap",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:drunk(playerid,params[]) { ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:pump(playerid,params[]) { ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:tosteal(playerid,params[]) { ApplyAnimation(playerid,"ped", "ARRESTgun", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:laugh(playerid,params[]) { ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:lookout(playerid,params[])  { ApplyAnimation(playerid, "SHOP", "ROB_Shifty", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:robman(playerid,params[]) { ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:hide(playerid,params[]) { ApplyAnimation(playerid, "ped", "cower",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:vomit(playerid,params[]) { ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:eat(playerid,params[]) { ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:crack(playerid,params[]) { ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:fuck(playerid,params[]) { ApplyAnimation(playerid,"PED","fucku",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:taichi(playerid,params[]) { ApplyAnimation(playerid,"PARK","Tai_Chi_Loop", 4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:entrenar(playerid,params[]) { ApplyAnimation(playerid,"PARK","Tai_Chi_Loop", 4.1, 0, 1, 1, 1, 1, 1); return 1; } // amin para magos
CMD:kiss(playerid,params[]) { ApplyAnimation(playerid,"KISSING","Playa_Kiss_01",4.1, 0, 1, 1, 1, 1, 1); return 1; }
CMD:carjacked1(playerid, params[])//17, 12:58pm, 4/27/2012
{
	ApplyAnimation(playerid,"PED","CAR_jackedLHS",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}
CMD:carjacked2(playerid, params[])//18, 12:59pm, 4/27/2012
{
	 ApplyAnimation(playerid,"PED","CAR_jackedRHS",4.1, 0, 1, 1, 1, 1, 1);
     return 1;
}
CMD:handsup(playerid, params[])//19 1:00 pm , 4/27/2012
{
	//SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
	ApplyAnimation(playerid, "ROB_BANK","SHP_HandsUp_Scr",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}
CMD:cellin(playerid, params[])// 20 1:01 pm, 4/27/2012
{
	    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
		return 1;
}
CMD:cellout(playerid, params[])//21 1:02 pm , 4/27/2012
{
	    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
		return 1;
}
CMD:bomb(playerid, params[])//23 4/27/2012
{
	ClearAnimations(playerid);
	ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.1, 0, 1, 1, 1, 1, 1); // Place Bomb
	return 1;
}
CMD:getarrested(playerid, params[])//24 4/27/2012
{
	ApplyAnimation(playerid,"ped", "ARRESTgun", 4.1, 0, 1, 1, 1, 1, 1); // Gun Arrest
	return 1;
}
CMD:crossarms(playerid, params[])//28
{
	ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.1, 0, 1, 1, 1, 1, 1); // Arms crossed
	return 1;
}

CMD:lay(playerid, params[])//29
{
	ApplyAnimation(playerid,"BEACH", "bather",4.1, 0, 1, 1, 1, 1, 1); // Lay down
	return 1;
}

CMD:foodeat(playerid, params[])//32
{
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.1, 0, 1, 1, 1, 1, 1); // Eat Burger
	return 1;
}

CMD:wave(playerid, params[])//33
{
	ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.1, 0, 1, 1, 1, 1, 1); // Wave
	return 1;
}

CMD:slapass(playerid, params[])//34
{
	ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.1, 0, 1, 1, 1, 1, 1); // Ass Slapping
 	return 1;
}

CMD:dealer(playerid, params[])//35
{
	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.1, 0, 1, 1, 1, 1, 1); // Deal Drugs
	return 1;
}

CMD:groundsit(playerid, params[])//38
{
	ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.1, 0, 1, 1, 1, 1, 1); // Sit
	return 1;
}

CMD:chat(playerid, params[])//39
{
	new num;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", num)) return Usage(playerid, "/chat [1-2]");
	if(num > 2 || num < 1) return Usage(playerid, "/chat [1-2]");
	if(num == 1) { ApplyAnimation(playerid,"PED","IDLE_CHAT",4.1, 0, 1, 1, 1, 1, 1); }
	if(num == 2) { ApplyAnimation(playerid,"MISC","Idle_Chat_02",4.1, 0, 1, 1, 1, 1, 1); }
    return 1;
}

CMD:fucku(playerid, params[])//40
{
	ApplyAnimation(playerid,"PED","fucku",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:chairsit(playerid, params[])//42
{
	ApplyAnimation(playerid,"PED","SEAT_idle",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fall(playerid, params[])//43
{
	ApplyAnimation(playerid,"PED","KO_skid_front",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fallback(playerid, params[])//44
{
	ApplyAnimation(playerid, "PED","FLOOR_hit_f", 4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:injured(playerid, params[])//46
{
	ApplyAnimation(playerid, "SWEET", "Sweet_injuredloop", 4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:sup(playerid, params[])//47
{
	new number;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", number)) return Usage(playerid,"/sup [1-3]");
	if(number < 1 || number > 3) return Usage(playerid,"/sup [1-3]");
	if(number == 1) { ApplyAnimation(playerid,"GANGS","hndshkba",4.1, 0, 1, 1, 1, 1, 1); }
	if(number == 2) { ApplyAnimation(playerid,"GANGS","hndshkda",4.1, 0, 1, 1, 1, 1, 1); }
    if(number == 3) { ApplyAnimation(playerid,"GANGS","hndshkfa_swt",4.1, 0, 1, 1, 1, 1, 1); }
   	return 1;
}

CMD:push(playerid, params[])// 49
{
	ApplyAnimation(playerid,"GANGS","shake_cara",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:akick(playerid, params)// 50
{
	ApplyAnimation(playerid,"POLICE","Door_Kick",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lowbodypush(playerid, params[])// 51
{
	ApplyAnimation(playerid,"GANGS","shake_carSH",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:spray(playerid, params[])// 52
{
	ApplyAnimation(playerid,"SPRAYCAN","spraycan_full",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:headbutt(playerid, params[])//53
{
	ApplyAnimation(playerid,"WAYFARER","WF_Fwd",4.1, 0, 1, 1, 1, 1, 1);
	return 1;
}

CMD:medic(playerid, params[])//54
{
	ApplyAnimation(playerid,"MEDIC","CPR",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:koface(playerid, params[])//55
{
	ApplyAnimation(playerid,"PED","KO_shot_face",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:kostomach(playerid, params[])//56
{
	ApplyAnimation(playerid,"PED","KO_shot_stom",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lifejump(playerid, params[])//57
{
	ApplyAnimation(playerid,"PED","EV_dive",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:exhaust(playerid, params[])//58
{
	ApplyAnimation(playerid,"PED","IDLE_tired",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:leftslap(playerid, params[])//59
{
	ApplyAnimation(playerid,"PED","BIKE_elbowL",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:rollfall(playerid, params[])//60
{
	ApplyAnimation(playerid,"PED","BIKE_fallR",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:carlock(playerid, params[])//61
{
	ApplyAnimation(playerid,"PED","CAR_doorlocked_LHS",4.1, 0, 1, 1, 1, 1, 1);
	return 1;
}

CMD:rcarjack1(playerid, params[])//62
{
	ApplyAnimation(playerid,"PED","CAR_pulloutL_LHS",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lcarjack1(playerid, params[])//63
{
	ApplyAnimation(playerid,"PED","CAR_pulloutL_RHS",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}
CMD:rcarjack2(playerid, params[])//64
{
	ApplyAnimation(playerid,"PED","CAR_pullout_LHS",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lcarjack2(playerid, params[])//65
{
	ApplyAnimation(playerid,"PED","CAR_pullout_RHS",4.1, 0, 1, 1, 1, 1, 1);
	return 1;
}

CMD:hoodfrisked(playerid, params[])//66
{
	ApplyAnimation(playerid,"POLICE","crm_drgbst_01",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lightcig(playerid, params[])//67
{
	ApplyAnimation(playerid,"SMOKING","M_smk_in",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:tapcig(playerid, params[])//68
{
	ApplyAnimation(playerid,"SMOKING","M_smk_tap",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:bat(playerid, params[])//69
{
	ApplyAnimation(playerid,"BASEBALL","Bat_IDLE",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:box(playerid, params[])//70
{
	ApplyAnimation(playerid,"GYMNASIUM","GYMshadowbox",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lay2(playerid, params[])//71
{
	ApplyAnimation(playerid,"SUNBATHE","Lay_Bac_in",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:chant(playerid, params[])//72
{
	ApplyAnimation(playerid,"RIOT","RIOT_CHANT",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:finger(playerid, params[])//73
{
	ApplyAnimation(playerid,"RIOT","RIOT_FUKU",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:shouting(playerid, params[])//74
{
	ApplyAnimation(playerid,"RIOT","RIOT_shout",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:cop(playerid,params[])//75
{
	ApplyAnimation(playerid,"SWORD","sword_block",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:elbow(playerid, params[])//76
{
	ApplyAnimation(playerid,"FIGHT_D","FightD_3",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:kneekick(playerid, params[])//77
{
	ApplyAnimation(playerid,"FIGHT_D","FightD_2",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:fstance(playerid, params[])//78
{
	ApplyAnimation(playerid,"FIGHT_D","FightD_IDLE",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:gpunch(playerid, params[])//79
{
	ApplyAnimation(playerid,"FIGHT_B","FightB_G",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:airkick(playerid, params[])//80
{
	ApplyAnimation(playerid,"FIGHT_C","FightC_M",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:gkick(playerid, params[])//81
{
	ApplyAnimation(playerid,"FIGHT_D","FightD_G",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:lowthrow(playerid, params[])//82
{
	ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:highthrow(playerid, params[])//83
{
	ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:dealstance(playerid, params[])//84
{
	ApplyAnimation(playerid,"DEALER","DEALER_IDLE",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:pee(playerid, params[])//85
{
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	SetPlayerSpecialAction(playerid, 68);
    return 1;
}

CMD:knife(playerid, params[])//86
{
	new nbr;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", nbr)) return Usage(playerid,"/knife [1-4]");
    if(nbr < 1 || nbr > 4) return Usage(playerid,"/knife [1-4]"); 
	switch(nbr)
	{ 
		case 1: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Damage",4.1, 0, 1, 1, 1, 1, 1); }
		case 2: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1, 0, 1, 1, 1, 1, 1); }
		case 3: { ApplyAnimation(playerid,"KNIFE","KILL_Knife_Player",4.1, 0, 1, 1, 1, 1, 1); }
		case 4: { ApplyAnimation(playerid,"KNIFE","KILL_Partial",4.1, 0, 1, 1, 1, 1, 1); }
	}
	return 1;
}

CMD:basket(playerid, params[])//87
{
	new ddr;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if (sscanf(params, "i", ddr)) return Usage(playerid,"/basket [1-6]");
    if(ddr < 1 || ddr > 6) return Usage(playerid,"/basket [1-6]"); 
    switch(ddr)
	{
		case 1: { ApplyAnimation(playerid,"BSKTBALL","BBALL_idleloop",4.1, 0, 1, 1, 1, 1, 1); }
		case 2: { ApplyAnimation(playerid,"BSKTBALL","BBALL_Jump_Shot",4.1, 0, 1, 1, 1, 1, 1); }
		case 3: { ApplyAnimation(playerid,"BSKTBALL","BBALL_pickup",4.1, 0, 1, 1, 1, 1, 1); }
		case 4: { ApplyAnimation(playerid,"BSKTBALL","BBALL_run",4.1, 0, 1, 1, 1, 1, 1); }
		case 5: { ApplyAnimation(playerid,"BSKTBALL","BBALL_def_loop",4.1, 0, 1, 1, 1, 1, 1); }
		case 6: { ApplyAnimation(playerid,"BSKTBALL","BBALL_Dnk",4.1, 0, 1, 1, 1, 1, 1); }
	}
   	return 1;
}

CMD:reload(playerid, params[])//88
{
	new result[128];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[24]", result)) return Usage(playerid,"/reload [deagle/smg/ak/m4]");
    if(strcmp(result,"deagle", true) == 0)
	{
		ApplyAnimation(playerid,"COLT45","colt45_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
    else if(strcmp(result,"smg", true) == 0)
    {
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
	else if(strcmp(result,"ak", true) == 0)
	{
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
	else if(strcmp(result,"m4", true) == 0)
	{
		ApplyAnimation(playerid,"UZI","UZI_reload",4.1, 0, 1, 1, 1, 1, 1);
    }
   	else { Usage(playerid,"/reload [deagle/smg/ak/m4]"); }
   	return 1;
}

CMD:gwalk(playerid, params[])//89
{
	new ssr;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", ssr)) return Usage(playerid,"/gwalk [1/2]");
	if(ssr < 1 || ssr > 2) return Usage(playerid,"/gwalk [1/2]");
	if (ssr == 1) { ApplyAnimation(playerid,"PED","WALK_gang1",4.1, 0, 1, 1, 1, 1, 1); }
 	if (ssr == 2) { ApplyAnimation(playerid,"PED","WALK_gang2",4.1, 0, 1, 1, 1, 1, 1); }
   	return 1;
}

CMD:aim(playerid, params[])//90
{
	new lmb;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", lmb)) return Usage(playerid,"/aim [1-3]");
	if(lmb == 1) { ApplyAnimation(playerid,"PED","gang_gunstand",4.1, 0, 1, 1, 1, 1, 1); }
    if(lmb == 2) { ApplyAnimation(playerid,"PED","Driveby_L",4.1, 0, 1, 1, 1, 1, 1); }
    if(lmb == 3) { ApplyAnimation(playerid,"PED","Driveby_R",4.1, 0, 1, 1, 1, 1, 1); }
    else { Usage(playerid,"/aim [1-3]"); }
    return 1;
}

CMD:lean(playerid, params[])//91
{
	new mj;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "i", mj)) return Usage(playerid,"/lean [1-2]");
	if(mj < 1 || mj > 2) { Usage(playerid,"/lean [1-2]"); }
    if(mj == 1) { ApplyAnimation(playerid,"GANGS","leanIDLE",4.1, 0, 1, 1, 1, 1, 1); }
	if(mj == 2) { ApplyAnimation(playerid,"MISC","Plyrlean_loop",4.1, 0, 1, 1, 1, 1, 1); }
   	return 1;
}

CMD:clearanim(playerid, params[])//92
{
	    if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
		ApplyAnimation(playerid, "CARRY", "crry_prtial", 1.0, 0, 0, 0, 0, 0);
		return 1;
}

CMD:strip(playerid, params[])//93
{
	new kj;
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
    if(sscanf(params, "i", kj)) return Usage(playerid,"/strip [1-7]");
	if(kj < 1 || kj > 7) { Usage(playerid,"/strip [1-7]"); }
	if(kj == 1) { ApplyAnimation(playerid,"STRIP", "strip_A", 4.1, 0, 1, 1, 1, 1, 1 ); }
	if(kj == 2) { ApplyAnimation(playerid,"STRIP", "strip_B", 4.1, 0, 1, 1, 1, 1, 1 ); }
    if(kj == 3) { ApplyAnimation(playerid,"STRIP", "strip_C", 4.1, 0, 1, 1, 1, 1, 1 ); }
    if(kj == 4) { ApplyAnimation(playerid,"STRIP", "strip_D", 4.1, 0, 1, 1, 1, 1, 1 ); }
    if(kj == 5) { ApplyAnimation(playerid,"STRIP", "strip_E", 4.1, 0, 1, 1, 1, 1, 1 ); }
    if(kj == 6) { ApplyAnimation(playerid,"STRIP", "strip_F", 4.1, 0, 1, 1, 1, 1, 1 ); }
    if(kj == 7) { ApplyAnimation(playerid,"STRIP", "strip_G", 4.1, 0, 1, 1, 1, 1, 1 ); }
 	return 1;
}

CMD:inbedright(playerid, params[])//94
{
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:inbedleft(playerid, params[])//95
{
	ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_L",4.1, 0, 1, 1, 1, 1, 1);
    return 1;
}

CMD:wank(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/wank [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"PAULNMAC","wank_in",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}
CMD:sexy(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/sexy [1-8]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKING_IDLEW",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKING_IDLEP",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKINGW",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKINGP",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "5", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKEDW",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "6", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKEDP",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "7", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKING_ENDW",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "8", true) == 0)
	{
		ApplyAnimation(playerid,"SNM","SPANKING_ENDP",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:bj(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/bj [1-4]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_P",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_START_W",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_P",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid,"BLOWJOBZ","BJ_COUCH_LOOP_W",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:stand(playerid, params[])
{
	ApplyAnimation(playerid,"WUZI","Wuzi_stand_loop", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:follow(playerid, params[])
{
	ApplyAnimation(playerid,"WUZI","Wuzi_follow",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
    return 1;
}

CMD:getup(playerid, params[])
{
	ApplyAnimation(playerid,"PED","getup",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:slapped(playerid, params[])
{
	ApplyAnimation(playerid,"SWEET","ho_ass_slapped",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
    return 1;
}

CMD:win(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/win [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"CASINO","cards_win", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"CASINO","Roulette_win", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:celebrate(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/celebrate [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"benchpress","gym_bp_celebrate", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GYMNASIUM","gym_tread_celebrate", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:yes(playerid, params[])
{
	ApplyAnimation(playerid,"CLOTHES","CLO_Buy", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:deal(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/deal [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"DEALER","DRUGS_BUY", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:thankyou(playerid, params[])
{
	ApplyAnimation(playerid,"FOOD","SHP_Thank", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:invite1(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/invite1 [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"GANGS","Invite_Yes",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GANGS","Invite_No",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:scratch(playerid, params[])
{
	ApplyAnimation(playerid,"MISC","Scratchballs_01", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
    return 1;
}
CMD:checkout(playerid, params[])
{
	ApplyAnimation(playerid, "GRAFFITI", "graffiti_Chkout", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:nod(playerid, params[])
{
	ApplyAnimation(playerid,"COP_AMBIENT","Coplook_nod",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:cry(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/cry [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GRAVEYARD","mrnM_loop", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}
CMD:bed(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/bed [1-4]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_In_L",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_In_R",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_L", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid,"INT_HOUSE","BED_Loop_R", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}
CMD:carsmoke(playerid, params[])
{
	ApplyAnimation(playerid,"PED","Smoke_in_car", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:angry(playerid, params[])
{
	ApplyAnimation(playerid,"RIOT","RIOT_ANGRY",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:benddown(playerid, params[])
{
	ApplyAnimation(playerid, "BAR", "Barserve_bottle", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:shakehead(playerid, params[])
{
	ApplyAnimation(playerid, "MISC", "plyr_shkhead", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:cockgun(playerid, params[])
{
	ApplyAnimation(playerid, "SILENCED", "Silence_reload", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:bar(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "/bar [1-4]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid, "BAR", "Barcustom_get", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"GHANDS","gsign2LH",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid, "BAR", "Barcustom_order", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid, "BAR", "Barserve_give", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid, "BAR", "Barserve_glass", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}
CMD:liftup(playerid, params[])
{
	ApplyAnimation(playerid, "CARRY", "liftup", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:putdown(playerid, params[])
{
	ApplyAnimation(playerid, "CARRY", "putdwn", 4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:joint(playerid, params[])
{
	ApplyAnimation(playerid,"GANGS","smkcig_prtl",4.1, 0, 1, 1, 1, 1, 1);
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}
CMD:die(playerid, params[])
{
	new choice[32];
	if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
	if(sscanf(params, "s[32]", choice))
	{
		Usage(playerid, "USAGE: /die [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"KNIFE","KILL_Knife_Ped_Die",4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid, "PARACHUTE", "FALL_skyDive_DIE", 4.1, 0, 1, 1, 1, 1, 1);
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:lranim(playerid, params[])
{
	if(IsInLowRider(playerid))
	{
		new choice;
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1) return Error(playerid, "You can't do at this moment.");
		if(sscanf(params, "i", choice))
		{
			Usage(playerid, "/lranim [0-36]");
			return 1;
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
		    Error(playerid, "You cannot be the driver of the vehicle!");
		    return 1;
		}
		switch(choice)
		{
		    case 0:
		    {
				ApplyAnimation(playerid, "LOWRIDER", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 1:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_bdbnce", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 2:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hair", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 3:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_hurry", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 4:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_idleloop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 5:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_idle_to_l0", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 6:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l0_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 7:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l0_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 8:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l0_to_l1", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 9:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l12_to_l0", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 10:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l1_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 11:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l1_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 12:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l1_to_l2", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 13:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l2_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 14:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l2_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 15:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l2_to_l3", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 16:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l345_to_l1", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 17:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l3_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 18:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l3_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 19:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l3_to_l4", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 20:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l4_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 21:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l4_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 22:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l4_to_l5", 4.0, 0, 0, 0, 1, 0, 1);
		    }
		    case 23:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l5_bnce", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 24:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "lrgirl_l5_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 25:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 26:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkB", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 27:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkC", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 28:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkD", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 29:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkF", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 30:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkG", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 31:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "prtial_gngtlkH", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 32:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "RAP_A_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 33:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "RAP_B_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 34:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "RAP_C_Loop", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 35:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "Sit_relaxed", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		    case 36:
		    {
		        ApplyAnimation(playerid, "LOWRIDER", "Tap_hand", 4.0, 1, 0, 0, 0, 0, 1);
		    }
		}
	}
	else
	{
		Error(playerid, "  You must be in a compatible lowrider to use this command!");
	}
	return 1;
}