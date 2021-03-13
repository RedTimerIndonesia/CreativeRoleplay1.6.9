// ======================================================================== >>>CREDITS<<< ========================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Made by Krishhna
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ZCMD : Zeez
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SSCANF : maddinat0r
// ===============================================================================================================================================================

// ===============================================================================================================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> VEHICLE TUNING SYSTEM <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// ===============================================================================================================================================================

#include <a_samp>
#include <sscanf2>
#include <zcmd>

#define SCM SendClientMessage

#define DIALOG_MODLIST 0
#define DIALOG_COLORS 1
#define DIALOG_COLORS_PREMADE 2
#define DIALOG_COLORS_MANUALLY_1 3
#define DIALOG_COLORS_MANUALLY_2 4
#define DIALOG_SPOILER 5
#define DIALOG_PAINTJOB 6
#define DIALOG_HOODS 7
#define DIALOG_VENTS 8
#define DIALOG_LIGHTS 9
#define DIALOG_EXHAUSTS 10
#define DIALOG_FRONT_BUMPERS 11
#define DIALOG_REAR_BUMPERS 12
#define DIALOG_ROOFS 13
#define DIALOG_SIDE_SKIRTS 14
#define DIALOG_BULLBARS 15
#define DIALOG_WHEELS 16
#define DIALOG_STEREO 17
#define DIALOG_HYDRAULICS 18
#define DIALOG_TUNE 19

#define FILTERSCRIPT 

new VehicleNames[][] =
{
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
	"Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
	"Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
	"Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
	"Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
	"Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
	"Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
	"Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
	"Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
	"Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
	"Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
	"Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
	"Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
	"Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin",
	"Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
	"Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
 	"Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
 	"FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
 	"Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
 	"Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
    "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
	"Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
	"Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
	"Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
	"Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
	"News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
	"Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
 	"Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
 	"Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
 	"Tiller", "Utility Trailer"
};

new Color1[MAX_PLAYERS],Color2[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("=========================================================");
	print("\n");
	print("            Vehicle tuning system by Krishhna            ");
	print("\n");
	print("=========================================================");
	return 1;
}

public OnPlayerConnect(playerid)
{
	Color1[playerid] = 0;
	Color2[playerid] = 0;
	SCM(playerid,-1,">> {FFFF00}Welcome to Vehicle tuning system by Krishhna.{FFFFFF}<<");
	return 1;
}

CMD:shortcuts(playerid,params[])
{
	ShowPlayerDialog(playerid,DIALOG_MODLIST,DIALOG_STYLE_MSGBOX,"List of commands","{ED1A1A}/tune\n{FFFFFF}/spawncar \n/vcolor \n/spoiler \n/nitros \n/fix \n/paintjob\n/hood\n/vents\n/lights\n/exhaust\n/fbumpers\n/rbumpers\n/roofs\n/sideskirts\n/bullbars\n/wheels\n/stereo\n/hydraulics\n","Close","");
	return 1;
}

CMD:tune(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to use this cmd.");
	ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
	return 1;
}

CMD:spawncar(playerid,params[])
{
	new carid,color1,color2,Float:x,Float:y,Float:z,Float:angle,vehicle,vehicleid,str[256];
	if(sscanf(params,"ddd",carid,color1,color2)) return SCM(playerid,-1,"{20D61A}Usage : {FFFFFF}/spawncar [carid] [color1] [color2]");
	if(carid < 400 || carid > 611) return SCM(playerid,-1,"{ED1A1A}carid must be between 400 - 611");
	if(color1 < 0 || color1 > 255) return SCM(playerid,-1,"{ED1A1A}Color1 must be between 0 - 255");
	if(color2 < 0 || color2 > 255) return SCM(playerid,-1,"{ED1A1A}Color2 must be between 0 - 255");
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		vehicleid = GetPlayerVehicleID(playerid);
		DestroyVehicle(vehicleid);
	}
	GetPlayerPos(playerid,x,y,z);
	GetPlayerFacingAngle(playerid,angle);
	vehicle = CreateVehicle(carid,x+2,y,z,angle,-1,-1, -1);
	PutPlayerInVehicle(playerid,vehicle,0);
	vehicleid = GetPlayerVehicleID(playerid);
	ChangeVehicleColor(vehicleid,color1,color2);
	format(str,256,">> {20D61A}You have successfully spawned vehicle {FFFFFF}: %d.{20D61A}Vehicle Name{FFFFFF}: %s",carid,GetVehicleName(vehicleid));
	SCM(playerid,-1,str);
	return 1;
}

CMD:vcolor(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to change the vehicle color.");
	ShowPlayerDialog(playerid,DIALOG_COLORS,DIALOG_STYLE_LIST,"Colors","Use pre-made colors\nEnter manually","confirm","back");
	return 1;
}

CMD:nitros(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add nitros.");
	new vehicleid = GetPlayerVehicleID(playerid);
	AddVehicleComponent(vehicleid,1010);
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	new str[256];
	format(str,256,">> {20D61A}Nitros has been added to your {FFFFFF}%s.",GetVehicleName(vehicleid));
	SCM(playerid,-1,str);
	return 1;
}

CMD:fix(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to fix your vehicle.");
	new vehicleid = GetPlayerVehicleID(playerid);
	PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
	RepairVehicle(vehicleid);
	new str[256];
	format(str,256,">> {20D61A}Your {FFFFFF}%s{20D61A} is fixed. ",GetVehicleName(vehicleid));
	SCM(playerid,-1,str);
	return 1;
}

CMD:spoiler(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add spoiler to your vehicle.");
	ShowPlayerDialog(playerid,DIALOG_SPOILER,DIALOG_STYLE_LIST,"Choose below","Wheel Arc. Alien Spoiler\nWheel Arc. X-Flow Spoiler\nTransfender Win Spoiler\nTransfender Fury Spoiler\nTransfender Alpha Spoiler\nTransfender Pro Spoiler\nTransfender Champ Spoiler\nTransfender Race Spoiler\nTransfender Drag Spoiler\n","Choose","back");
	return 1;
}

CMD:paintjob(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add paintjob to your vehicle.");
	ShowPlayerDialog(playerid,DIALOG_PAINTJOB, DIALOG_STYLE_LIST,"Choose paint job","paint job1\npaint job2\npaint job3\n","Confirm","back");
	return 1;
}

CMD:hood(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add hood to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_HOODS, DIALOG_STYLE_LIST, "Hoods", "Fury\nChamp\nRace\nWorx\n", "Confirm", "back");
	return 1;
}

CMD:vents(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add vents to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_VENTS, DIALOG_STYLE_LIST, "Vents", "Oval\nSquare\n", "Confirm", "back");
	return 1;
}

CMD:lights(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add lights to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_LIGHTS, DIALOG_STYLE_LIST, "Lights", "Round\nSquare\n", "Confirm", "back");
	return 1;
}

CMD:exhaust(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add exhaust to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_EXHAUSTS, DIALOG_STYLE_LIST, "Exhausts", "Wheel Arc. Alien exhaust\nWheel Arc. X-Flow exhaust\nLow Co. Chromer exhaust\nLow Co. Slamin exhaust\nTransfender Large exhaust\nTransfender Medium exhaust\nTransfender Small exhaust\nTransfender Twin exhaust\nTransfender Upswept exhaust", "Confirm", "back");
	return 1;
}

CMD:fbumpers(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add front bumpers to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_FRONT_BUMPERS, DIALOG_STYLE_LIST, "Front bumpers", "Wheel Arc. Alien Bumper\nWheel Arc. X-Flow Bumper\nLow co. Chromer Bumper\nLow co. Slamin Bumper", "Confirm", "back");
	return 1;
}

CMD:rbumpers(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add rear bumpers to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_REAR_BUMPERS, DIALOG_STYLE_LIST, "Rear bumpers", "Wheel Arc. Alien Bumper\nWheel Arc. X-Flow Bumper\nLow co. Chromer Bumper\nLow co. Slamin Bumper", "Confirm", "back");
	return 1;
}

CMD:roofs(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add roofs to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_ROOFS, DIALOG_STYLE_LIST, "Roofs", "Wheel Arc. Alien\nWheel Arc. X-Flow\nLow Co. Hardtop Roof\nLow Co. Softtop Roof\nTransfender Roof Scoop", "Confirm", "back");
	return 1;
}

CMD:sideskirts(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add sideskirts to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_SIDE_SKIRTS, DIALOG_STYLE_LIST, "Side skirts", "Wheel Arc. Alien Side Skirt\nWheel Arc. X-Flow Side Skirt\nLocos Chrome Strip\nLocos Chrome Flames\nLocos Chrome Arches \nLocos Chrome Trim\nLocos Wheelcovers\nTransfender Side Skirt", "Confirm", "back");
	return 1;
}

CMD:bullbars(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add bullbars to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_BULLBARS, DIALOG_STYLE_LIST, "Bull bars", "Locos Chrome Grill\nLocos Chrome Bars\nLocos Chrome Lights \nLocos Chrome Bullbar", "Confirm", "back");
	return 1;
}

CMD:wheels(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add wheels to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST, "Wheels", "Offroad\nMega\nWires\nTwist\nGrove\nImport\nAtomic\nAhab\nVirtual\nAccess\nTrance\nShadow\nRimshine\nClassic\nCutter\nSwitch\nDollar", "Confirm", "back");
	return 1;
}

CMD:stereo(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add stereo to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_STEREO, DIALOG_STYLE_LIST, "Car Stereo", "BassBoost", "Confirm", "Close");
	return 1;
}

CMD:hydraulics(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SCM(playerid,-1,"{ED1A1A}You need to be in vehicle to add hydraulics to your vehicle.");
	ShowPlayerDialog(playerid, DIALOG_HYDRAULICS, DIALOG_STYLE_LIST, "Car hydraulics", "Hydaulics", "Confirm", "back");
	return 1;
}

public OnDialogResponse(playerid,dialogid,response,listitem,inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_COLORS:
		{
			if(response)
			{
				if(listitem == 0)
				{
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 1)
				{
					ShowPlayerDialog(playerid,DIALOG_COLORS_MANUALLY_1,DIALOG_STYLE_INPUT,"color1","Enter color1 (between 0 - 255)","confirm","back");
				}
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_COLORS_PREMADE:
		{
			if(response)
			{
				if(listitem == 0)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,1,1);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}White.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 1)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,0,0);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Black.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 2)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,3,3);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Red.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 3)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,128,128);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Green.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 4)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,6,6);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Yellow.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 5)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,79,79);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Blue.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 6)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,126,126);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Pink.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
				if(listitem == 7)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					ChangeVehicleColor(vehicleid,30,30);
					PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
					SCM(playerid,-1,"{20D61A}Vehicle color changed to {FFFFFF}Brown.");
					ShowPlayerDialog(playerid,DIALOG_COLORS_PREMADE,DIALOG_STYLE_LIST,"choose your color","White\nBlack\nRed\nGreen\nYellow\nBlue\nPink\nBrown","confirm","back");
				}
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_COLORS,DIALOG_STYLE_LIST,"Colors","Use pre-made colors\nEnter manually","confirm","back");
			}
		}
		case DIALOG_COLORS_MANUALLY_1:
		{
			if(response)
			{
				if(strval(inputtext) < 0 || strval(inputtext) > 255) return ShowPlayerDialog(playerid,DIALOG_COLORS_MANUALLY_1,DIALOG_STYLE_INPUT,"color1","Enter correct value of color1 (between 0 - 255)","confirm","back");
				ShowPlayerDialog(playerid,DIALOG_COLORS_MANUALLY_2,DIALOG_STYLE_INPUT,"color2","Enter color2 (between 0 - 255)","confirm","back");
				Color1[playerid] = strval(inputtext);
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_COLORS,DIALOG_STYLE_LIST,"Colors","Use pre-made colors\nEnter manually","confirm","back");
			}
		}
		case DIALOG_COLORS_MANUALLY_2:
		{
			if(response)
			{
				if(strval(inputtext) < 0 || strval(inputtext) > 255) return ShowPlayerDialog(playerid,DIALOG_COLORS_MANUALLY_1,DIALOG_STYLE_INPUT,"color2","Enter correct value of color2 (between 0 - 255)","confirm","back");
				Color2[playerid] = strval(inputtext);
				new vehicleid = GetPlayerVehicleID(playerid);
				ChangeVehicleColor(vehicleid,Color1[playerid],Color2[playerid]);
				new str[256];
				format(str,256,">> {20D61A}Color changed. color1:{FFFFFF}%d{20D61A} color2:{FFFFFF}%d.",Color1[playerid],Color2[playerid]);
				SCM(playerid,-1,str);
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_COLORS_MANUALLY_1,DIALOG_STYLE_INPUT,"color1","Enter color1 (between 0 - 255)","confirm","back");
			}
		}
		case DIALOG_SPOILER:
		{	
			if(response)
			{
				if(listitem == 0)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Wheel Arc. Alien Spoiler");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1147);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1049);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1162);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1058);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1138);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1164);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 1)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Wheel Arc. X-Flow Spoiler");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1146);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1050);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1158);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1060);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1139);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1163);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 2)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Win Spoiler");
					if(VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 527 ||
					VehicleModel == 415 ||
					VehicleModel == 546 ||
					VehicleModel == 603 ||
					VehicleModel == 426 ||
					VehicleModel == 436 ||
					VehicleModel == 405 ||
					VehicleModel == 477 ||
					VehicleModel == 580 ||
					VehicleModel == 550 ||
					VehicleModel == 549)
					{
						if(VehicleModel == 401)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 518)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 527)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 415)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 546)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 603)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 426)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 436)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 405)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 477)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 580)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 550)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 549)
						{
							AddVehicleComponent(vehicleid,1001);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [401,518,527,415,546,603,426,436,405,477,580,550,549]");
					}
				}
				if(listitem == 3)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Fury Spoiler");
					if(VehicleModel == 518 ||
					VehicleModel == 415 ||
					VehicleModel == 546 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 405 ||
					VehicleModel == 477 ||
					VehicleModel == 580 ||
					VehicleModel == 550 ||
					VehicleModel == 549)
					{
						if(VehicleModel == 518)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 415)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 546)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 517)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 603)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 405)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 477)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 580)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 550)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 549)
						{
							AddVehicleComponent(vehicleid,1023);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [518,415,546,517,603,405,477,580,550,549]");
					}
				}
				if(listitem == 4)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256," Transfender Alpha Spoiler ");
					if(VehicleModel == 518 ||
					VehicleModel == 415 ||
					VehicleModel == 401 ||
					VehicleModel == 517 ||
					VehicleModel == 426 ||
					VehicleModel == 436 ||
					VehicleModel == 477 ||
					VehicleModel == 547 ||
					VehicleModel == 550 ||
					VehicleModel == 549)
					{
						if(VehicleModel == 518)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 415)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 401)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 517)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 426)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 436)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 477)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 547)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 550)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 549)
						{
							AddVehicleComponent(vehicleid,1003);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [518,415,401,517,426,436,477,547,550,549]");
					}
				}
				if(listitem == 5)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Pro Spoiler");
					if(VehicleModel == 589 ||
					VehicleModel == 492 ||
					VehicleModel == 547 ||
					VehicleModel == 405)
					{
						if(VehicleModel == 589)
						{
							AddVehicleComponent(vehicleid,1000);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 492)
						{
							AddVehicleComponent(vehicleid,1000);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 547)
						{
							AddVehicleComponent(vehicleid,1000);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 405)
						{
							AddVehicleComponent(vehicleid,1000);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [589,492,547,405]");
					}
				}
				if(listitem == 6)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Champ Spoiler");
					if(VehicleModel == 527 ||
					VehicleModel == 542 ||
					VehicleModel == 405)
					{
						if(VehicleModel == 527)
						{
							AddVehicleComponent(vehicleid,1014);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 542)
						{
							AddVehicleComponent(vehicleid,1014);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 405)
						{
							AddVehicleComponent(vehicleid,1014);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [405,542,527]");
					}
				}
				if(listitem == 7)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Race Spoiler");
					if(VehicleModel == 527 ||
					VehicleModel == 542)
					{
						if(VehicleModel == 527)
						{
							AddVehicleComponent(vehicleid,1014);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 542)
						{
							AddVehicleComponent(vehicleid,1014);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [542,527]");
					}
				}
				if(listitem == 8)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new SpoilerName[256];
					format(SpoilerName,256,"Transfender Drag Spoiler");
					if(VehicleModel == 546 ||
					VehicleModel == 517)
					{
						if(VehicleModel == 546)
						{
							AddVehicleComponent(vehicleid,1002);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
						if(VehicleModel == 517)
						{
							AddVehicleComponent(vehicleid,1002);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}%s added to your {FFFFFF}%s.",SpoilerName,GetVehicleName(vehicleid));
							SCM(playerid,-1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this spoiler to this vehicle. Choose vehicles from [546,517]");
					}
				}
				ShowPlayerDialog(playerid,DIALOG_SPOILER,DIALOG_STYLE_LIST,"Choose below","Wheel Arc. Alien Spoiler\nWheel Arc. X-Flow Spoiler\nTransfender Win Spoiler\nTransfender Fury Spoiler\nTransfender Alpha Spoiler\nTransfender Pro Spoiler\nTransfender Champ Spoiler\nTransfender Race Spoiler\nTransfender Drag Spoiler\n","Choose","back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_PAINTJOB:
		{
			if(response)
			{
				if(listitem == 0)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 560 ||
					VehicleModel == 575 ||
					VehicleModel == 534 || 
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 535 ||
					VehicleModel == 576 ||
					VehicleModel == 558)
					{
						ChangeVehiclePaintjob(vehicleid,0);
						PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
						new str[256];
						format(str,256,">> {20D61A}You have successfully applied paint job 1 to your {FFFFFF}%s.",GetVehicleName(vehicleid));
						SCM(playerid,-1,str);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot apply this paint job to this vehicle. Choose vehicles from [562,565,559,561,560,575,534,567,536,535,576,558]");
					}
				}
				if(listitem == 1)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 560 ||
					VehicleModel == 575 ||
					VehicleModel == 534 || 
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 535 ||
					VehicleModel == 576 ||
					VehicleModel == 558)
					{
						ChangeVehiclePaintjob(vehicleid,1);
						PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
						new str[256];
						format(str,256,">> {20D61A}You have successfully applied paint job 2 to your {FFFFFF}%s.",GetVehicleName(vehicleid));
						SCM(playerid,-1,str);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot apply this paint job to this vehicle. Choose vehicles from [562,565,559,561,560,575,534,567,536,535,576,558]");
					}
				}
				if(listitem == 2)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 560 ||
					VehicleModel == 575 ||
					VehicleModel == 534 || 
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 535 ||
					VehicleModel == 576 ||
					VehicleModel == 558)
					{
						ChangeVehiclePaintjob(vehicleid,2);
						PlayerPlaySound(playerid, 1134, 0.0, 0.0, 0.0);
						new str[256];
						format(str,256,">> {20D61A}You have successfully applied paint job 3 to your {FFFFFF}%s.",GetVehicleName(vehicleid));
						SCM(playerid,-1,str);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot apply this paint job to this vehicle. Choose vehicles from [562,565,559,561,560,575,534,567,536,535,576,558]");
					}
				}
				ShowPlayerDialog(playerid,DIALOG_PAINTJOB, DIALOG_STYLE_LIST,"Choose paint job","paint job1\npaint job2\npaint job3\n","Confirm","back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_HOODS:
		{
			if(response)
			{
				if(listitem == 0)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new HoodName[256];
					format(HoodName,255,"Fury");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 589 ||
					VehicleModel == 492 ||
					VehicleModel == 426 ||
					VehicleModel == 550)
					{
						AddVehicleComponent(vehicleid,1005);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added hood {FFFFFF}%s{20D61A} to your {FFFFFF}%s",HoodName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this hood to this vehicle. Choose vehicles from [401,518,589,492,426,550]");
					}
				}
				if(listitem == 1)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new HoodName[256];
					format(HoodName,255,"Champ");
					if(
					VehicleModel == 401 ||
					VehicleModel == 402 ||
					VehicleModel == 546 ||
					VehicleModel == 426 ||
					VehicleModel == 550)
					{
						AddVehicleComponent(vehicleid,1004);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added hood {FFFFFF}%s{20D61A} to your {FFFFFF}%s",HoodName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this hood to this vehicle. Choose vehicles from [401,402,546,426,550]");
					}
				}
				if(listitem == 2)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new HoodName[256];
					format(HoodName,255,"Race");
					if(VehicleModel == 401)
					{
						AddVehicleComponent(vehicleid,1011);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added hood {FFFFFF}%s{20D61A} to your {FFFFFF}%s",HoodName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this hood to this vehicle. Choose vehicles from [401]");
					}
				}
				if(listitem == 3)
				{
					new vehicleid = GetPlayerVehicleID(playerid);
					new VehicleModel = GetVehicleModel(vehicleid);
					new HoodName[256];
					format(HoodName,255,"Worx");
					if(VehicleModel == 549)
					{
						AddVehicleComponent(vehicleid,1012);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added hood {FFFFFF}%s{20D61A} to your {FFFFFF}%s",HoodName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this hood to this vehicle. Choose vehicles from [401]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_HOODS, DIALOG_STYLE_LIST, "Hoods", "Fury\nChamp\nRace\nWorx\n", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_VENTS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new VentName[256];
					format(VentName,255,"Oval");
					if(VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 546 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 547 ||
					VehicleModel == 439 ||
					VehicleModel == 550 ||
					VehicleModel == 549)
					{
						AddVehicleComponent(vehicleid,1142);
			            AddVehicleComponent(vehicleid,1143);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added vent {FFFFFF}%s{20D61A} to your {FFFFFF}%s",VentName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Vent to this vehicle. Choose vehicles from [401,518,546,517,603,547,439,550,549]");
					}
				}
				if(listitem == 1)
				{
					new VentName[256];
					format(VentName,255,"Square");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 589 ||
					VehicleModel == 546 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 439 ||
					VehicleModel == 550 ||
					VehicleModel == 549)
					{
						AddVehicleComponent(vehicleid,1144);
			            AddVehicleComponent(vehicleid,1145);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added vent {FFFFFF}%s{20D61A} to your {FFFFFF}%s",VentName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Vent to this vehicle. Choose vehicles from [401,518,589,546,517,603,439,550,549]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_VENTS, DIALOG_STYLE_LIST, "Vents", "Oval\nSquare\n", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_LIGHTS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new LightName[256];
					format(LightName,255,"Round");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 589 ||
					VehicleModel == 400 ||
					VehicleModel == 436 ||
					VehicleModel == 439)
					{
						AddVehicleComponent(vehicleid,1013);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added Light {FFFFFF}%s{20D61A} to your {FFFFFF}%s",LightName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Light to this vehicle. Choose vehicles from [401,518,589,400,436,439]");
					}
				}
				if(listitem == 1)
				{
					new LightName[256];
					format(LightName,255,"Square");
					if(
					VehicleModel == 589 ||
					VehicleModel == 603 ||
					VehicleModel == 400)
					{
						AddVehicleComponent(vehicleid,1024);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added Light {FFFFFF}%s{20D61A} to your {FFFFFF}%s",LightName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Light to this vehicle. Choose vehicles from [589,603,400]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_LIGHTS, DIALOG_STYLE_LIST, "Lights", "Round\nSquare\n", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_EXHAUSTS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Wheel Arc. Alien exhaust");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 558 ||
					VehicleModel == 561 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1034);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1046);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1065);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1064);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1028);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1089);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [562,565,559,558,561,560]");
					}
				}
				if(listitem == 1)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Wheel Arc. X-Flow exhaust");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1037);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1045);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1066);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1059);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1029);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1092);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [562,565,559,558,561,560]");
					}
				}
				if(listitem == 2)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Low Co. Chromer exhaust");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1044);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1126);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1129);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1104);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1113);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1136);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [575,534,567,536,576,535]");
					}
				}
				if(listitem == 3)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Low Co. Slamin exhaust");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1043);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1127);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1132);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1105);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1114);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1135);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [575,534,567,536,576,535]");
					}
				}
				if(listitem == 4)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Transfender Large exhaust");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 527 ||
					VehicleModel == 542 ||
					VehicleModel == 589 ||
					VehicleModel == 400 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 426 ||
					VehicleModel == 547 ||
					VehicleModel == 405 ||
					VehicleModel == 580 ||
					VehicleModel == 550 ||
					VehicleModel == 549 ||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1020);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [401,518,527,542,589,400,517,603,426,547,405,580,550,549,477]");
					}
				}
				if(listitem == 5)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Transfender Medium exhaust");
				    if(
					VehicleModel == 527 ||
					VehicleModel == 542 ||
					VehicleModel == 400 ||
					VehicleModel == 426 ||
					VehicleModel == 436 ||
					VehicleModel == 547 ||
					VehicleModel == 405 ||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1021);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [527,542,400,426,436,547,405,477]");
					}
				}
				if(listitem == 6)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Transfender Small exhaust");
				    if(VehicleModel == 436)
					{
						AddVehicleComponent(vehicleid,1022);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [436]");
					}
				}
				if(listitem == 7)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Transfender Twin exhaust");
				    if(
					VehicleModel == 518 ||
					VehicleModel == 415 ||
					VehicleModel == 542 ||
					VehicleModel == 546 ||
					VehicleModel == 400 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 426 ||
					VehicleModel == 436 ||
					VehicleModel == 547 ||
					VehicleModel == 405 ||
					VehicleModel == 550 ||
					VehicleModel == 549 ||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1019);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [518,415,542,546,400,517,603,426,436,547,405,550,549,477]");
					}
				}
				if(listitem == 8)
				{
					new ExhaustName[256];
					format(ExhaustName,255,"Transfender Upswept exhaust");
				    if(
                    VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 415 ||
					VehicleModel == 542 ||
					VehicleModel == 546 ||
					VehicleModel == 400 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 426 ||
					VehicleModel == 415 ||
					VehicleModel == 547 ||
					VehicleModel == 405 ||
					VehicleModel == 550 ||
					VehicleModel == 549 ||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1018);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",ExhaustName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Exhaust to this vehicle. Choose vehicles from [401,518,415,542,546,400,517,603,426,415,547,405,550,549,477]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_EXHAUSTS, DIALOG_STYLE_LIST, "Exhausts", "Wheel Arc. Alien exhaust\nWheel Arc. X-Flow exhaust\nLow Co. Chromer exhaust\nLow Co. Slamin exhaust\nTransfender Large exhaust\nTransfender Medium exhaust\nTransfender Small exhaust\nTransfender Twin exhaust\nTransfender Upswept exhaust", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
			
		}
		case DIALOG_FRONT_BUMPERS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new BumperName[256];
					format(BumperName,256,"Wheel Arc. Alien Bumper");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1171);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1153);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1160);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1155);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1169);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1166);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 1)
				{
					new BumperName[256];
					format(BumperName,256,"Wheel Arc. X-Flow Bumper");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1172);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1152);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1173);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1157);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1170);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1165);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 2)
				{
					new BumperName[256];
					format(BumperName,256,"Low co. Chromer Bumper");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1174);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1179);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1189);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1182);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1115);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1191);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,535,575,534,576,536]");
					}
				}
				if(listitem == 3)
				{
					new BumperName[256];
					format(BumperName,256,"Low co. Slamin Bumper");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1175);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1185);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1188);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1181);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1116);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1190);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,535,575,534,576,536]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_FRONT_BUMPERS, DIALOG_STYLE_LIST, "Front bumpers", "Wheel Arc. Alien Bumper\nWheel Arc. X-Flow Bumper\nLow co. Chromer Bumper\nLow co. Slamin Bumper", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_REAR_BUMPERS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new BumperName[256];
					format(BumperName,256,"Wheel Arc. Alien Bumper");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1149);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1150);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1159);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1154);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1141);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1168);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 1)
				{
					new BumperName[256];
					format(BumperName,256,"Wheel Arc. X-Flow Bumper");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1148);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1151);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1161);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1156);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1140);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1167);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 2)
				{
					new BumperName[256];
					format(BumperName,256,"Low co. Chromer Bumper");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1176);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1180);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1187);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1184);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1109);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1192);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,535,575,534,576,536]");
					}
				}
				if(listitem == 3)
				{
					new BumperName[256];
					format(BumperName,256,"Low co. Slamin Bumper");
					if(VehicleModel == 575 ||
					VehicleModel == 534 ||
					VehicleModel == 567 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 535)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1177);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 534)
						{
							AddVehicleComponent(vehicleid,1178);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1186);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1183);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 535)
						{
							AddVehicleComponent(vehicleid,1110);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1193);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BumperName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,535,575,534,576,536]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_REAR_BUMPERS, DIALOG_STYLE_LIST, "Rear bumpers", "Wheel Arc. Alien Bumper\nWheel Arc. X-Flow Bumper\nLow co. Chromer Bumper\nLow co. Slamin Bumper", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_ROOFS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new RoofName[256];
					format(RoofName,256,"Wheel Arc. Alien roof");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1038);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1054);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1067);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1055);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1032);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1088);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,560,558]");
					}
				}
				if(listitem == 1)
				{
					new RoofName[256];
					format(RoofName,256,"Wheel Arc. X-Flow roof");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1035);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1053);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1068);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1061);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1033);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1091);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,560,558]");
					}
				}
				if(listitem == 2)
				{
					new RoofName[256];
					format(RoofName,256,"Low Co. Hardtop Roof");
					if(VehicleModel == 567 ||
					VehicleModel == 536)
					{
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1130);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1128);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,536]");
					}
				}
				if(listitem == 3)
				{
					new RoofName[256];
					format(RoofName,256,"Low Co. Softtop Roof");
					if(VehicleModel == 567 ||
					VehicleModel == 536)
					{
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1131);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1103);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,536]");
					}
				}
				if(listitem == 4)
				{
					new RoofName[256];
					format(RoofName,256,"Transfender Roof Scoop");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 589 ||
					VehicleModel == 492 ||
					VehicleModel == 546 ||
					VehicleModel == 603 ||
					VehicleModel == 426 ||
					VehicleModel == 436 ||
					VehicleModel == 580 ||
					VehicleModel == 550||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1006);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",RoofName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [567,536]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_ROOFS, DIALOG_STYLE_LIST, "Roofs", "Wheel Arc. Alien\nWheel Arc. X-Flow\nLow Co. Hardtop Roof\nLow Co. Softtop Roof\nTransfender Roof Scoop", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_SIDE_SKIRTS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new SkirtName[256];
					format(SkirtName,256,"Wheel Arc. Alien Side Skirt");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1036);
							AddVehicleComponent(vehicleid,1040);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1047);
							AddVehicleComponent(vehicleid,1051);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1069);
							AddVehicleComponent(vehicleid,1071);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1056);
							AddVehicleComponent(vehicleid,1062);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1026);
							AddVehicleComponent(vehicleid,1027);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1090);
							AddVehicleComponent(vehicleid,1094);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 1)
				{
					new SkirtName[256];
					format(SkirtName,256,"Wheel Arc. X-Flow Side Skirt");
					if(VehicleModel == 562 ||
					VehicleModel == 565 ||
					VehicleModel == 559 ||
					VehicleModel == 561 ||
					VehicleModel == 558 ||
					VehicleModel == 560)
					{
						if(VehicleModel == 562)
						{
							AddVehicleComponent(vehicleid,1039);
							AddVehicleComponent(vehicleid,1041);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 565)
						{
							AddVehicleComponent(vehicleid,1048);
							AddVehicleComponent(vehicleid,1052);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 559)
						{
							AddVehicleComponent(vehicleid,1070);
							AddVehicleComponent(vehicleid,1072);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 561)
						{
							AddVehicleComponent(vehicleid,1057);
							AddVehicleComponent(vehicleid,1063);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 560)
						{
							AddVehicleComponent(vehicleid,1031);
							AddVehicleComponent(vehicleid,1030);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 558)
						{
							AddVehicleComponent(vehicleid,1093);
							AddVehicleComponent(vehicleid,1095);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [562,565,559,561,558,560]");
					}
				}
				if(listitem == 2)
				{
					new SkirtName[256];
					format(SkirtName,256,"Locos Chrome Strip Skirt");
					if(VehicleModel == 575 ||
					VehicleModel == 536 ||
					VehicleModel == 576 ||
					VehicleModel == 567)
					{
						if(VehicleModel == 575)
						{
							AddVehicleComponent(vehicleid,1042);
							AddVehicleComponent(vehicleid,1099);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 567)
						{
							AddVehicleComponent(vehicleid,1102);
							AddVehicleComponent(vehicleid,1133);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 576)
						{
							AddVehicleComponent(vehicleid,1134);
							AddVehicleComponent(vehicleid,1137);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
						if(VehicleModel == 536)
						{
							AddVehicleComponent(vehicleid,1108);
							AddVehicleComponent(vehicleid,1107);
							PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
							new String[256];
							format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
							SCM(playerid, -1,String);
						}
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [575,536,576,567]");
					}
				}
				if(listitem == 3)
				{
					new SkirtName[256];
					format(SkirtName,256,"Locos Chrome Flames Skirt");
					if(VehicleModel == 534)
					{
						AddVehicleComponent(vehicleid,1102);
						AddVehicleComponent(vehicleid,1101);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [534]");
					}
				}
				if(listitem == 4)
				{
					new SkirtName[256];
					format(SkirtName,256,"Locos Chrome Arches Skirt");
					if(VehicleModel == 534)
					{
						AddVehicleComponent(vehicleid,1106);
						AddVehicleComponent(vehicleid,1124);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [534]");
					}
				}
				if(listitem == 5)
				{
					new SkirtName[256];
					format(SkirtName,256,"Locos Chrome Trim Skirt");
					if(VehicleModel == 535)
					{
						AddVehicleComponent(vehicleid,1118);
						AddVehicleComponent(vehicleid,1120);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [535]");
					}
				}
				if(listitem == 6)
				{
					new SkirtName[256];
					format(SkirtName,256,"Locos Wheelcovers Skirt");
					if(VehicleModel == 535)
					{
						AddVehicleComponent(vehicleid,1119);
						AddVehicleComponent(vehicleid,1121);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [535]");
					}
				}
				if(listitem == 7)
				{
					new SkirtName[256];
					format(SkirtName,256,"Transfender Side Skirt");
					if(
					VehicleModel == 401 ||
					VehicleModel == 518 ||
					VehicleModel == 527 ||
					VehicleModel == 415 ||
					VehicleModel == 589 ||
					VehicleModel == 546 ||
					VehicleModel == 517 ||
					VehicleModel == 603 ||
					VehicleModel == 436 ||
					VehicleModel == 439 ||
					VehicleModel == 580 ||
					VehicleModel == 549 ||
					VehicleModel == 477)
					{
						AddVehicleComponent(vehicleid,1007);
						AddVehicleComponent(vehicleid,1017);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",SkirtName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [401,518,527,415,589,546,517,603,436,439,580,549,477]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_SIDE_SKIRTS, DIALOG_STYLE_LIST, "Side skirts", "Wheel Arc. Alien Side Skirt\nWheel Arc. X-Flow Side Skirt\nLocos Chrome Strip\nLocos Chrome Flames\nLocos Chrome Arches \nLocos Chrome Trim\nLocos Wheelcovers\nTransfender Side Skirt", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_BULLBARS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				new VehicleModel = GetVehicleModel(vehicleid);
				if(listitem == 0)
				{
					new BullBarName[256];
					format(BullBarName,256,"Locos Chrome Grill bar");
					if(VehicleModel == 534)
					{
						AddVehicleComponent(vehicleid,1100);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BullBarName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [534]");
					}
				}
				if(listitem == 1)
				{
					new BullBarName[256];
					format(BullBarName,256,"Locos Chrome bar");
					if(VehicleModel == 534)
					{
						AddVehicleComponent(vehicleid,1123);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BullBarName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [534]");
					}
				}
				if(listitem == 2)
				{
					new BullBarName[256];
					format(BullBarName,256,"Locos Chrome Lights bar");
					if(VehicleModel == 534)
					{
						AddVehicleComponent(vehicleid,1125);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BullBarName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [534]");
					}
				}
				if(listitem == 3)
				{
					new BullBarName[256];
					format(BullBarName,256,"Locos Chrome bullbar");
					if(VehicleModel == 535)
					{
						AddVehicleComponent(vehicleid,1117);
						PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
						new String[256];
						format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",BullBarName,GetVehicleName(vehicleid));
						SCM(playerid, -1,String);
					}
					else
					{
						SCM(playerid,-1,"{ED1A1A}You cannot add this Bumper to this vehicle. Choose vehicles from [535]");
					}
				}
				ShowPlayerDialog(playerid, DIALOG_BULLBARS, DIALOG_STYLE_LIST, "Bull bars", "Locos Chrome Grill\nLocos Chrome Bars\nLocos Chrome Lights \nLocos Chrome Bullbar", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","Close");
			}
		}
		case DIALOG_WHEELS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(listitem == 0)
				{
					new WheelName[256];
					format(WheelName,256,"Offroad wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1025);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 1)
				{
					new WheelName[256];
					format(WheelName,256,"Mega wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1074);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 2)
				{
					new WheelName[256];
					format(WheelName,256,"Wires wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1076);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 3)
				{
					new WheelName[256];
					format(WheelName,256,"Twist wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1078);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 4)
				{
					new WheelName[256];
					format(WheelName,256,"Grove wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1081);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 5)
				{
					new WheelName[256];
					format(WheelName,256,"Import wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1082);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 6)
				{
					new WheelName[256];
					format(WheelName,256,"Atomic wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1085);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 7)
				{
					new WheelName[256];
					format(WheelName,256,"Ahab wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1096);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 8)
				{
					new WheelName[256];
					format(WheelName,256,"Virtual wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1097);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 9)
				{
					new WheelName[256];
					format(WheelName,256,"Access wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1098);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 10)
				{
					new WheelName[256];
					format(WheelName,256,"Trance wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1084);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 11)
				{
					new WheelName[256];
					format(WheelName,256,"Shadow wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1073);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 12)
				{
					new WheelName[256];
					format(WheelName,256,"Rimishine wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1075);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 13)
				{
					new WheelName[256];
					format(WheelName,256,"Classic wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1077);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 14)
				{
					new WheelName[256];
					format(WheelName,256,"Cutter wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1079);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 15)
				{
					new WheelName[256];
					format(WheelName,256,"Switch wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1080);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				if(listitem == 16)
				{
					new WheelName[256];
					format(WheelName,256,"Dollar wheels");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",WheelName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1083);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				ShowPlayerDialog(playerid, DIALOG_WHEELS, DIALOG_STYLE_LIST, "Wheels", "Offroad\nMega\nWires\nTwist\nGrove\nImport\nAtomic\nAhab\nVirtual\nAccess\nTrance\nShadow\nRimshine\nClassic\nCutter\nSwitch\nDollar", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_STEREO:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(listitem == 0)
				{
					new StereoName[256];
					format(StereoName,256,"BassBoost Stereo");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",StereoName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1086);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				ShowPlayerDialog(playerid, DIALOG_STEREO, DIALOG_STYLE_LIST, "Car Stereo", "BassBoost", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_HYDRAULICS:
		{
			if(response)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(listitem == 0)
				{
					new StereoName[256];
					format(StereoName,256,"Hydraulics");
					new String[256];
					format(String,256,">> {20D61A}You have successfully added {FFFFFF}%s{20D61A} to your {FFFFFF}%s",StereoName,GetVehicleName(vehicleid));
					SCM(playerid, -1,String);
					AddVehicleComponent(vehicleid,1087);
					PlayerPlaySound(playerid, 1133, 0.0, 0.0, 0.0);
				}
				ShowPlayerDialog(playerid, DIALOG_HYDRAULICS, DIALOG_STYLE_LIST, "Car hydraulics", "Hydaulics", "Confirm", "back");
			}
			else
			{
				ShowPlayerDialog(playerid,DIALOG_TUNE,DIALOG_STYLE_LIST,"Tune","Color\nPaint job\nSpoilers\nHood\nVents\nLights\nExhaust\nFront bumpers\nRear Bumpers\nRoofs\nSide skirts\nBullbars\nWheels\nStereo\nHydraulics\nNitros\nFix","Confirm","cancel");
			}
		}
		case DIALOG_TUNE:
		{
			if(response)
			{
				if(listitem == 0)
				{
					return cmd_vcolor(playerid, "");
				}
				if(listitem == 1)
				{
					return cmd_paintjob(playerid, "");
				}
				if(listitem == 2)
				{
					return cmd_spoiler(playerid, "");
				}
				if(listitem == 3)
				{
					return cmd_hood(playerid, "");
				}
				if(listitem == 4)
				{
					return cmd_vents(playerid, "");
				}
				if(listitem == 5)
				{
					return cmd_lights(playerid, "");
				}
				if(listitem == 6)
				{
					return cmd_exhaust(playerid, "");
				}
				if(listitem == 7)
				{
					return cmd_fbumpers(playerid, "");
				}
				if(listitem == 8)
				{
					return cmd_rbumpers(playerid, "");
				}
				if(listitem == 9)
				{
					return cmd_roofs(playerid, "");
				}
				if(listitem == 10)
				{
					return cmd_sideskirts(playerid, "");
				}
				if(listitem == 11)
				{
					return cmd_bullbars(playerid, "");
				}
				if(listitem == 12)
				{
					return cmd_wheels(playerid, "");
				}
				if(listitem == 13)
				{
					return cmd_stereo(playerid, "");
				}
				if(listitem == 14)
				{
					return cmd_hydraulics(playerid, "");
				}
				if(listitem == 15)
				{
					return cmd_nitros(playerid, "");
				}
				if(listitem == 16)
				{
					return cmd_fix(playerid, "");
				}
			}
		}
	}
	
	return 1;
}

stock GetVehicleName(vehicleid)
{
	new String[10];
	format(String,sizeof(String),"%s",VehicleNames[GetVehicleModel(vehicleid) - 400]);
	return String;
}