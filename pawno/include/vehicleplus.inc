/*
	Vehicles Plus Include (vehicleplus.inc)
	* Add new features to your vehicles system and have the missing or actually the correct word is needed vehicle functions
	* Gives you advantage over ordinary vehicle manager includes, this is compatiable with other scripts (using property function)
	* Now EditVehicle avalaible with this include

 	Author: (creator)
	* Gammix

	Contributors:
	* Admigo 	- a_OPSVP include (offsets of vehicle bodyparts)
	* Emmet_ 	- random car colors and top speed array
	* Tianmetal - MPH speed support, GVar & Streamer plugin integration, and fixes

	(c) Copyright 2015
  	* This file is provided as is (no warranties).
*/

/*
FUNCTIONS:
native CreateVehicle(modelid, Float:x, Float:y, Float:z, Float:rotation, color1 = -1, color2 = -1, respawn_delay = -1, addsiren = 0, worldid = 0, interiorid = 0, bool:unoccupied_damage = false);
native GetVehicleInterior(vehicleid);
native GetVehicleColor(vehicleid, &color1, &color2);
native GetVehiclePaintjob(vehicleid);
native RemoveVehiclePaintjob(vehicleid);
native SetVehicleHorn(vehicleid, soundid);
native GetVehicleHorn(vehicleid);
native RestoreVehicleHorn(vehicleid);
native ToggleVehicleDamageUpdate(vehicleid, type, bool:toggle);
native IsVehicleDamageToggled(vehicleid, type);
native UpdateVehicleDamageStatusEx(vehicleid, type, update);
native GetVehicleDamageStatusEx(vehicleid, type);
native IsVehicleOccupied(vehicleid);
native GetVehicleDriverID(vehicleid);
native EditVehicle(playerid, vehicleid);
native IsValidVehicle(vehicleid);
native GetVehicleName(vehicleid, string[], len = sizeof(string));
native GetVehicleModelName(modelid, string[], len = sizeof(string));
native SetVehicleParams(vehicleid, type, set);
native GetVehicleParams(vehicleid, type);
native Float:GetVehicleSpeed(vehicleid, bool:kmh = true, Float:velx = 0.0, Float:vely = 0.0, Float:velz = 0.0);
native IsObjectAttachedToVehicle(objectid, vehicleid);
native GetVehicleSlotAttachedObject(vehicleid, slot);
native TeleportVehicle(vehicleid, Float:x, Float:y, Float:z, Float:rotation, worldid = -1, interiorid = -1);
native SetVehicleSpeedCap(vehicleid, Float:maxspeed, bool:kmh = true);
native Float:GetVehicleSpeedCap(vehicleid, bool:kmh = true);
native DisableVehicleSpeedCap(vehicleid);
native GetVehicleTopSpeed(vehicleid, bool:kmh = true);
native GetVehicleModelTopSpeed(modelid, bool:kmh = true);
native SetVehicleSpawnInfo(vehicleid, Float:x, Float:y, Float:z, Float:rotation, worldid, interiorid);
native GetVehicleSpawnInfo(vehicleid, &Float:x, &Float:y, &Float:z, &Float:rotation, &worldid, &interiorid);
native ToggleUnoccupiedVehicleDamage(vehicleid, bool:toggle);
native IsUnoccupiedDamageToggled(vehicleid);
native ToggleVehiclePetrolCapDestroy(vehicleid, bool:toggle);
native IsPetrolCapDestroyToggled(vehicleid);
native SetVehicleBomb(vehicleid, time = 1000);
native GetVehicleBomb(vehicleid);
native RemoveVehicleBomb(vehicleid);
native IsVehicleBombed(vehicleid);
native IsVehicleBombActivated(vehicleid);
native ToggleVehicleSticky(vehicleid, bool:toggle);
native IsVehicleSticky(vehicleid);
native CountAllVehicles();
native DestroyAllVehicles();

CALLBACKS:
public OnPlayerShotVehicle(playerid, vehicleid, weaponid, Float:amount, bodypart)
public OnPlayerEditVehicle(playerid, vehicleid, response, Float:fX, Float:fY, Float:fZ, Float:fRotZ)
public OnPlayerReachSpeedCapLimit(playerid, vehicleid, Float:speed)
public OnVehicleBombActivate(vehicleid)
public OnVehicleBombDeactivate(vehicleid)
public OnVehicleBombExplode(vehicleid)
public OnVehiclePosChange(vehicleid, Float:newx, Float:newy, Float:newz, Float:newrotation, Float:oldx, Float:oldy, Float:oldz, Float:oldrotation)
public OnVehicleVelocityChange(vehicleid, Float:newx, Float:newy, Float:newz, Float:oldx, Float:oldy, Float:oldz)
public OnVehicleHealthChange(vehicleid, Float:newhealth, Float:oldhealth)
public OnTrailerAttach(trailerid,vehicleid)
public OnTrailerDetach(trailerid,old_vehicleid)
public OnPlayerStealVehicle(playerid,targetid,vehicleid)
*/

#tryinclude <YSI_Coding\y_hooks>

#define VEHICLE_DAMAGE_ALL						-1
#define VEHICLE_DAMAGE_PANELS       			0
#define VEHICLE_DAMAGE_DOORS        			1
#define VEHICLE_DAMAGE_LIGHTS					2
#define VEHICLE_DAMAGE_TIRES  					3

#define VEHICLE_BODYPART_FRONT_LEFT_WHEEL   	0
#define VEHICLE_BODYPART_FRONT_RIGHT_WHEEL    	1
#define VEHICLE_BODYPART_BACK_LEFT_WHEEL   		2
#define VEHICLE_BODYPART_BACK_RIGHT_WHEEL    	3
#define VEHICLE_BODYPART_PETROLCAP      		4
#define VEHICLE_BODYPART_UNKNOWN                5

#define VEHICLE_PARAMS_ENGINE      				0
#define VEHICLE_PARAMS_LIGHTS      				1
#define VEHICLE_PARAMS_ALARM       				2
#define VEHICLE_PARAMS_DOORS       				3
#define VEHICLE_PARAMS_BONNET      				4
#define VEHICLE_PARAMS_BOOT       				5
#define VEHICLE_PARAMS_OBJECTIVE   				6

#if ! defined MAX_VEHICLE_ATTACHED_OBJECTS
	#define MAX_VEHICLE_ATTACHED_OBJECTS    	30
#endif

#if ! defined VEHICLE_UPDATE_INTERVAL
	#define VEHICLE_UPDATE_INTERVAL				250
#endif

forward OnPlayerShotVehicle(playerid, vehicleid, weaponid, Float:amount, bodypart);
forward OnVehiclePosChange(vehicleid, Float:newx, Float:newy, Float:newz, Float:newrotation, Float:oldx, Float:oldy, Float:oldz, Float:oldrotation);
forward OnVehicleVelocityChange(vehicleid, Float:newx, Float:newy, Float:newz, Float:oldx, Float:oldy, Float:oldz);
forward OnVehicleHealthChange(vehicleid, Float:newhealth, Float:oldhealth);
forward OnVehicleUpdate(vehicleid);
forward OnTrailerAttach(trailerid,vehicleid);
forward OnTrailerDetach(trailerid,old_vehicleid);
forward OnPlayerStealVehicle(playerid,targetid,vehicleid);

static bool:HasOnPlayerShotVehicle;
static bool:HasOnPlayerEditVehicle;
static bool:HasOnPlayerReachSpeedCapLimit;
static bool:HasOnVehicleBombActivate;
static bool:HasOnVehicleBombDeactivate;
static bool:HasOnVehicleBombExplode;
static bool:HasOnVehiclePosChange;
static bool:HasOnVehicleVelocityChange;
static bool:HasOnVehicleHealthChange;
static bool:HasOnVehicleUpdate;
static bool:HasOnTrailerAttach;
static bool:HasOnTrailerDetach;
static bool:HasOnPlayerStealVehicle;

static gPlayerEdit[MAX_PLAYERS] = INVALID_VEHICLE_ID;
static gVehicleAttachedObject[MAX_VEHICLES][MAX_VEHICLE_ATTACHED_OBJECTS];
static Float:gVehicleFloat[MAX_VEHICLES][10];
static bool:gVehicleDamage[MAX_VEHICLES][4];
static gVehicleDamageValue[MAX_VEHICLES][4];
static gVehicleSpeedCap[MAX_VEHICLES];
static gVehicleDriver[MAX_VEHICLES];
static gVehicleTrailer[MAX_VEHICLES];
static bool:gVehicleIsSticky[MAX_VEHICLES];

#if defined _INC_y_timers
	static Timer:VehicleTimer;
#else
	static VehicleTimer;
	forward Vehicle_UpdateTimer();
#endif

enum E_VEHICLE_INFO
{
	Name[18],
	TopSpeed,
	Float:PetrolCapOffset[3],
	Color[33]
}

static const gVehicleInfo[][E_VEHICLE_INFO] =
{
	{"Landstalker",157,{-1.06,-2.07,-0.03},{16,4,1,123,1,113,1,11,1,75,1,62,1,4,1,36,1}},
	{"Bravura",147,{1.25,-0.91,0.05},{16,41,41,47,47,52,52,66,66,74,74,87,87,91,91,113,113}},
	{"Buffalo",186,{1.11,-1.92,0.17},{16,1,1,13,13,22,22,3,3,39,39,9,9,98,98,11,11}},
	{"Linerunner",110,{-1.46,0.02,-0.66},{16,36,1,37,1,3,1,28,1,25,1,4,1,11,1,113,1}},
	{"Perrenial",133,{-1.03,-2.37,0.06},{16,113,39,119,5,123,92,19,1,11,11,95,15,83,11,66,25}},
	{"Sentinel",164,{-0.86,-2.16,-0.08},{16,11,1,24,1,36,1,4,1,75,1,91,1,123,1,4,1}},
	{"Dumper",110,{0.00,0.00,0.00},{2,1,1}},
	{"Firetruck",148,{-1.07,-3.74,-0.42},{2,3,1}},
	{"Trashmaster",100,{-1.46,1.24,-0.57},{2,26,26}},
	{"Stretch",158,{-1.04,-2.82,0.14},{2,1,1}},
	{"Manana",129,{-0.96,-1.66,0.23},{16,4,1,9,1,1,1,25,1,36,1,4,1,45,1,84,1}},
	{"Infernus",221,{1.06,-2.10,0.09},{16,12,1,64,1,123,1,116,1,112,1,16,1,8,1,75,1}},
	{"Voodoo",168,{0.00,0.00,0.00},{16,9,1,1,8,11,1,25,8,27,1,29,8,3,1,37,8}},
	{"Pony",110,{-0.46,0.53,-0.79},{16,87,1,88,1,91,1,15,1,19,1,119,1,4,1,25,1}},
	{"Mule",105,{-0.66,-0.71,-0.70},{16,25,1,28,1,43,1,67,1,72,1,9,1,95,1,24,1}},
	{"Cheetah",192,{-1.07,-2.06,0.05},{16,2,1,25,1,36,1,4,1,62,1,75,1,92,1,0,1}},
	{"Ambulance",154,{-1.16,-2.72,-0.21},{2,1,3}},
	{"Leviathan",270,{0.00,0.00,0.00},{0,0,0}},
	{"Moonbeam",115,{-1.24,-1.76,0.03},{16,119,119,117,227,114,114,18,18,95,95,81,81,61,61,41,41}},
	{"Esperanto",149,{-1.09,-1.99,0.06},{16,45,75,47,76,33,75,13,76,54,75,69,76,59,75,87,76}},
	{"Taxi",145,{-1.03,-2.14,0.08},{2,6,1}},
	{"Washington",154,{-1.02,-2.43,-0.14},{16,4,1,13,1,25,1,3,1,36,1,4,1,75,1,95,1}},
	{"Bobcat",140,{-0.93,-0.41,-0.19},{14,96,25,97,25,11,25,111,31,113,36,83,57,67,59}},
	{"Mr Whoopee",99,{-1.13,-1.90,-0.28},{12,1,16,1,56,1,17,1,53,1,5,1,35}},
	{"BF Injection",135,{-1.11,-0.54,-0.10},{16,1,0,2,2,3,2,3,6,6,16,15,3,24,53,35,61}},
	{"Hunter",270,{0.00,0.00,0.00},{2,43,0}},
	{"Premier",173,{-1.00,-2.16,0.06},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Enforcer",165,{-1.27,-3.18,-0.18},{2,0,1}},
	{"Securicar",157,{-1.01,-2.65,-0.56},{2,4,75}},
	{"Banshee",201,{0.00,0.00,0.00},{16,12,12,13,13,14,14,1,2,2,1,1,3,3,1,1,1}},
	{"Predator",190,{0.00,0.00,0.00},{2,46,26}},
	{"Bus",130,{-1.32,-5.47,-0.12},{16,71,59,75,59,92,72,47,74,55,83,59,83,71,87,82,87}},
	{"Rhino",94,{0.00,0.00,0.00},{2,43,0}},
	{"Barracks",110,{-1.51,0.15,-0.67},{2,43,0}},
	{"Hotknife",167,{0.00,0.00,0.00},{14,1,1,12,12,2,2,6,6,4,4,46,46,53,53}},
	{"Trailer 1",0,{0.00,0.00,0.00},{2,1,1}},
	{"Previon",149,{-1.02,-1.81,0.16},{14,83,1,87,1,92,1,95,1,19,1,119,45,11,1}},
	{"Coach",158,{-1.24,-4.98,-0.51},{16,54,7,79,7,87,7,95,16,98,2,15,2,123,2,125,21}},
	{"Cabbie",142,{-1.06,-1.93,-0.00},{2,6,76}},
	{"Stallion",168,{-1.07,-1.50,0.07},{16,57,8,8,17,43,21,54,38,67,8,37,78,65,79,25,78}},
	{"Rumpo",136,{-0.89,-0.47,-0.46},{16,34,34,32,32,2,2,11,11,66,66,84,84,118,118,121,121}},
	{"RC Bandit",145,{0.00,0.00,0.00},{16,2,96,79,42,82,54,67,86,126,96,7,96,11,54,67,98}},
	{"Romero",139,{-1.17,-2.20,0.08},{16,0,0,11,15,25,19,36,0,4,36,75,36,0,36,0,19}},
	{"Packer",126,{-1.24,1.25,-0.91},{16,4,1,2,1,24,1,25,1,36,1,4,1,54,1,84,1}},
	{"Monster",110,{0.00,0.00,0.00},{12,32,36,32,42,32,53,32,66,32,14,32,32}},
	{"Admiral",164,{-1.07,-1.95,0.13},{16,34,34,35,35,37,37,39,39,41,41,43,43,45,45,47,47}},
	{"Squalo",270,{0.00,0.00,0.00},{32,0,0,0,1,1,5,1,1,3,3,0,1,1,22,1,1,1,35,1,1,1,44,1,1,1,53,1,1,1,57,1,1}},
	{"Seasparrow",270,{0.00,0.00,0.00},{2,75,2}},
	{"Pizzaboy",111,{0.00,0.00,0.00},{2,1,3}},
	{"Tram",0,{0.00,0.00,0.00},{2,1,74}},
	{"Trailer 2",0,{0.00,0.00,0.00},{2,1,1}},
	{"Turismo",193,{1.08,-1.21,-0.03},{16,123,123,125,125,36,36,16,16,18,18,46,46,61,61,75,75}},
	{"Speeder",270,{0.00,0.00,0.00},{16,1,3,1,5,1,16,1,22,1,35,1,44,1,53,1,57}},
	{"Reefer",60,{0.00,0.00,0.00},{2,56,56}},
	{"Tropic",135,{0.00,0.00,0.00},{2,26,26}},
	{"Flatbed",157,{-1.52,0.00,-0.74},{16,84,15,84,58,84,31,32,74,43,31,1,31,77,31,32,74}},
	{"Yankee",106,{0.73,-0.05,-0.59},{16,84,63,91,63,12,65,15,72,11,93,121,93,12,95,23,1}},
	{"Caddy",95,{0.00,0.00,0.00},{16,58,1,2,1,63,1,18,1,32,1,45,1,13,1,34,1}},
	{"Solair",157,{-1.11,-2.04,-0.09},{16,91,1,11,1,19,1,113,1,4,1,25,1,3,1,36,1}},
	{"Berkley's RC Van",136,{-0.97,-2.30,0.21},{16,26,26,28,28,44,44,51,51,57,57,72,72,16,16,112,112}},
	{"Skimmer",270,{0.00,0.00,0.00},{16,1,3,1,9,1,18,1,3,17,23,46,23,46,32,57,34}},
	{"PCJ-600",160,{0.00,0.00,0.00},{16,36,1,37,1,43,1,53,1,61,1,75,1,79,1,88,1}},
	{"Faggio",111,{0.00,0.00,0.00},{16,12,12,13,13,14,14,1,2,2,1,1,3,3,1,1,1}},
	{"Freeway",142,{-0.25,0.20,-0.17},{16,79,79,84,84,7,7,11,11,19,19,22,22,36,36,53,53}},
	{"RC Baron",145,{0.00,0.00,0.00},{2,14,75}},
	{"RC Raider",145,{0.00,0.00,0.00},{2,14,75}},
	{"Glendale",147,{0.00,0.00,0.00},{16,67,76,68,76,78,76,2,76,16,76,18,76,25,76,45,88}},
	{"Oceanic",140,{-0.92,-2.30,0.08},{16,51,1,58,8,6,1,68,8,2,1,13,8,22,1,36,8}},
	{"Sanchez",144,{-0.07,0.17,0.69},{8,6,6,46,46,53,53,3,3}},
	{"Sparrow",270,{0.00,0.00,0.00},{0,0,0}},
	{"Patriot",157,{-1.17,-2.37,0.24},{2,43,0}},
	{"Quad",110,{0.00,0.00,0.00},{16,12,117,13,111,12,114,74,91,12,112,74,83,12,113,66,71}},
	{"Coastguard",190,{0.00,0.00,0.00},{4,56,15,56,53}},
	{"Dinghy",190,{0.00,0.00,0.00},{4,56,15,56,53}},
	{"Hermes",149,{0.00,0.00,0.00},{16,97,1,81,1,15,1,11,1,91,1,74,1,84,1,83,1}},
	{"Sabre",173,{-1.09,-1.60,0.13},{16,2,39,9,39,17,1,21,1,33,0,37,0,41,29,56,29}},
	{"Rustler",270,{0.00,0.00,0.00},{16,6,7,7,6,1,6,89,91,119,117,13,12,77,87,71,77}},
	{"ZR-350",186,{-1.03,-1.52,0.15},{16,92,1,94,1,11,1,121,1,0,1,22,1,36,1,75,1}},
	{"Walton",117,{1.01,-0.33,0.23},{16,72,1,66,1,59,1,45,1,4,1,39,1,35,1,2,1}},
	{"Regina",140,{-1.09,-1.98,0.09},{16,27,36,59,36,6,35,55,41,54,31,49,23,45,32,4,29}},
	{"Comet",184,{-1.12,-0.88,0.14},{14,73,45,12,12,2,2,6,6,4,4,46,46,53,53}},
	{"BMX",73,{0.00,0.00,0.00},{16,1,1,3,3,6,6,46,46,65,9,14,1,12,9,26,1}},
	{"Burrito",156,{1.03,-2.26,0.00},{16,41,41,48,48,52,52,64,64,71,71,85,85,1,1,62,62}},
	{"Camper",122,{0.80,-2.50,-0.05},{32,1,31,1,0,1,31,1,0,1,2,3,0,1,5,0,0,0,6,3,0,3,6,3,0,16,0,8,0,17,0,12,0}},
	{"Marquis",190,{0.00,0.00,0.00},{8,12,35,5,32,4,26,66,36}},
	{"Baggage",99,{-0.88,0.71,0.03},{14,1,73,1,74,1,75,1,76,1,77,1,78,1,79}},
	{"Dozer",64,{-0.66,-3.17,0.58},{2,1,1}},
	{"Maverick",270,{0.00,0.00,0.00},{16,26,14,29,42,26,57,54,29,26,3,3,29,12,39,74,35}},
	{"News Chopper",270,{0.00,0.00,0.00},{4,2,26,2,29}},
	{"Rancher",139,{1.22,-0.74,0.02},{12,13,118,14,123,12,123,112,12,84,11,76,12}},
	{"FBI Rancher",157,{0.00,0.00,0.00},{2,0,0}},
	{"Virgo",149,{-1.05,-2.18,0.02},{12,4,65,71,72,52,66,64,72,3,72,6,72}},
	{"Greenwood",140,{-1.07,-2.09,0.17},{16,3,26,77,26,81,27,24,55,28,56,49,59,52,69,71,17}},
	{"Jetmax",270,{0.00,0.00,0.00},{2,36,13}},
	{"Hotring",214,{-1.00,-2.20,0.14},{16,7,94,36,88,51,75,53,75,58,67,75,67,75,61,79,62}},
	{"Sandking",176,{1.16,-1.91,-0.11},{16,123,124,119,122,118,117,116,115,114,18,11,16,88,99,5,6}},
	{"Blista Compact",162,{1.08,-1.83,0.15},{16,74,72,66,72,53,56,37,19,22,22,2,2,9,14,0,0}},
	{"Police Maverick",270,{0.00,0.00,0.00},{2,0,1}},
	{"Boxville",108,{-1.21,-0.01,0.09},{16,11,123,13,12,2,117,24,112,27,17,36,15,37,17,43,93}},
	{"Benson",123,{-1.19,-1.09,-0.31},{16,19,25,19,32,112,32,1,32,3,44,32,52,84,66,84,69}},
	{"Mesa",140,{-0.91,-1.70,-0.06},{16,75,84,4,84,4,11,28,119,25,119,21,119,13,119,4,119}},
	{"RC Goblin",145,{0.00,0.00,0.00},{2,14,75}},
	{"Hotring Racer A",216,{-0.96,-1.88,0.13},{16,83,66,87,74,87,75,98,83,11,1,13,11,117,116,123,36}},
	{"Hotring Racer B",216,{-0.98,-2.03,0.04},{16,36,117,36,13,42,3,42,33,54,36,75,79,92,11,98,19}},
	{"Bloodring Banger",173,{-1.14,-1.82,0.13},{16,51,39,57,38,45,29,34,9,65,9,14,1,12,9,26,1}},
	{"Rancher",140,{1.22,-0.74,0.00},{12,13,118,14,123,12,123,112,12,84,11,76,12}},
	{"Super GT",179,{0.96,-1.11,-0.11},{1,3,3,6,6,7,7,52,52,76,76}},
	{"Elegant",166,{-1.08,-2.30,0.08},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Journey",108,{-1.35,-3.05,-0.67},{2,1,1}},
	{"Bike",79,{0.00,0.00,0.00},{16,7,1,74,1,61,1,16,1,25,1,3,1,36,1,53,1}},
	{"Mountain Bike",101,{0.00,0.00,0.00},{16,43,43,46,46,39,39,28,28,16,16,6,6,5,5,2,2}},
	{"Beagle",270,{0.00,0.00,0.00},{16,3,9,4,9,7,68,8,66,12,6,27,97,34,51,37,51}},
	{"Cropdust",270,{0.00,0.00,0.00},{16,17,39,15,123,32,112,45,88,52,71,57,67,61,96,96,96}},
	{"Stunt",270,{0.00,0.00,0.00},{16,38,51,21,36,21,34,3,34,54,34,55,2,48,18,51,6}},
	{"Tanker",120,{-1.50,-0.88,-0.24},{16,1,1,25,1,28,1,36,1,4,1,54,1,75,1,113,1}},
	{"Roadtrain",142,{-1.08,0.51,-1.43},{16,13,76,24,77,63,78,42,76,54,77,39,78,11,76,62,77}},
	{"Nebula",157,{-1.13,-2.44,-0.01},{16,116,1,119,1,122,1,4,1,9,1,24,1,27,1,36,1}},
	{"Majestic",157,{-1.11,-1.95,0.08},{16,37,36,36,36,4,36,43,41,47,41,51,72,54,75,55,84}},
	{"Buccaneer",164,{1.09,-2.19,-0.08},{16,2,39,9,39,17,1,21,1,33,0,37,0,41,29,56,29}},
	{"Shamal",270,{0.00,0.00,0.00},{2,1,1}},
	{"Hydra",270,{0.00,0.00,0.00},{0,0,0}},
	{"FCR-900",160,{-0.17,0.13,0.52},{16,74,74,75,13,87,118,92,3,115,118,25,118,36,0,118,118}},
	{"NRG-500",176,{-0.14,0.18,0.53},{16,3,3,3,8,6,25,7,79,8,82,36,15,39,16,51,118}},
	{"HPV1000",151,{-0.18,0.24,0.49},{0,0,0}},
	{"Cement Truck",130,{1.24,0.46,-1.06},{32,6,24,23,0,61,27,123,0,65,31,31,0,61,61,3,0,81,35,23,0,62,61,62,0,83,66,64,0,83,64,64,0}},
	{"Tow Truck",160,{-1.31,-0.50,-0.07},{14,1,1,17,2,18,2,22,3,36,43,44,51,52,54}},
	{"Fortune",158,{-0.94,-1.94,0.05},{16,2,39,9,39,17,1,21,1,33,0,37,0,41,29,56,29}},
	{"Cadrona",149,{-1.13,-1.70,0.16},{16,52,1,53,1,66,1,75,1,76,1,81,1,95,1,19,1}},
	{"FBI Truck",176,{-0.51,-2.07,0.01},{0,0,0}},
	{"Willard",149,{-1.15,-2.20,0.22},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Forklift",60,{0.00,0.00,0.00},{16,11,1,111,1,112,1,114,1,119,1,122,1,4,1,13,1}},
	{"Tractor",70,{0.00,0.00,0.00},{12,2,35,36,2,51,53,91,2,11,22,4,35}},
	{"Combine",110,{0.00,-2.43,-0.91},{0,0,0}},
	{"Feltzer",167,{0.91,-1.97,0.11},{16,73,1,74,1,75,1,77,1,79,1,83,1,84,1,91,1}},
	{"Remington",168,{-1.01,-0.83,-0.20},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Slamvan",158,{-1.13,-0.55,0.28},{16,3,1,28,1,31,1,55,1,66,1,97,1,123,1,118,1}},
	{"Blade",173,{-0.98,-1.69,0.06},{16,9,1,12,1,26,96,3,96,32,1,37,1,57,96,71,96}},
	{"Freight",0,{0.00,0.00,0.00},{2,1,1}},
	{"Streak",0,{0.00,0.00,0.00},{2,1,1}},
	{"Vortex",270,{0.00,0.00,0.00},{14,96,67,86,7,79,74,7,86,61,98,75,75,75,91}},
	{"Vincent",149,{-1.23,-2.51,-0.03},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Bullet",203,{0.00,0.00,0.00},{16,51,1,58,8,6,1,68,8,2,1,13,8,22,1,36,8}},
	{"Clover",164,{-0.97,-1.92,0.31},{16,13,118,24,118,31,93,32,92,45,92,113,92,119,113,122,113}},
	{"Sadler",151,{-0.96,-0.94,-0.01},{16,76,8,32,8,43,8,67,8,11,11,8,9,2,2,83,13}},
	{"Firetruck LA",150,{-1.15,2.04,0.32},{2,3,1}},
	{"Hustler",147,{0.00,0.00,0.00},{16,5,1,47,1,44,96,4,96,39,1,3,1,28,96,9,96}},
	{"Intruder",149,{1.22,-1.99,0.16},{16,62,37,78,38,2,62,3,87,2,78,113,78,119,62,7,78}},
	{"Primo",142,{-1.09,-2.00,0.13},{16,122,1,123,1,125,1,1,1,24,1,37,1,55,1,66,1}},
	{"Cargobob",270,{0.00,0.00,0.00},{2,1,1}},
	{"Tampa",153,{-0.89,-1.14,0.18},{16,74,39,72,39,75,39,79,39,83,36,84,36,89,35,91,35}},
	{"Sunrise",145,{-1.10,-2.40,-0.02},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Merit",157,{-1.03,-2.66,0.07},{16,67,1,72,1,75,1,83,1,91,1,11,1,19,1,2,1}},
	{"Utility",121,{-0.95,-0.94,0.45},{6,56,56,49,49,26,124}},
	{"Nevada",270,{0.00,0.00,0.00},{16,38,9,55,23,61,74,71,87,91,87,98,114,12,119,111,3}},
	{"Yosemite",144,{1.27,-2.37,0.13},{16,53,32,15,32,45,32,34,3,65,32,14,32,12,32,43,32}},
	{"Windsor",158,{-0.80,-1.47,0.17},{16,51,1,58,1,6,1,68,1,2,1,13,1,22,1,36,1}},
	{"Monster A",113,{0.00,0.00,0.00},{2,1,1}},
	{"Monster B",113,{0.00,0.00,0.00},{2,1,1}},
	{"Uranus",156,{-0.84,-1.92,0.23},{16,112,1,116,1,117,1,24,1,3,1,35,1,36,1,4,1}},
	{"Jester",178,{-1.01,-1.76,0.25},{16,51,1,58,8,6,1,68,8,2,1,13,8,22,1,36,8}},
	{"Sultan",169,{0.98,-1.83,0.20},{16,52,39,9,39,17,1,21,1,33,0,37,0,41,29,56,29}},
	{"Stratum",154,{1.13,-2.28,0.11},{16,57,8,8,17,43,21,54,38,67,8,37,78,65,79,25,78}},
	{"Elegy",178,{0.93,-0.71,0.05},{16,36,1,35,1,17,1,11,1,116,1,113,1,11,1,92,1}},
	{"Raindance",270,{0.00,0.00,0.00},{2,1,6}},
	{"RC Tiger",145,{0.00,0.00,0.00},{0,0,0}},
	{"Flash",165,{0.95,-0.86,0.09},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Tahoma",160,{1.18,-2.26,0.06},{16,19,1,3,8,95,1,84,8,83,1,72,8,71,1,52,8}},
	{"Savanna",173,{0.00,0.00,0.00},{16,97,96,88,64,9,96,93,64,97,96,99,81,12,114,114,1}},
	{"Bandito",146,{0.00,0.00,0.00},{16,2,39,9,39,17,1,21,1,33,0,37,0,41,29,56,29}},
	{"Freight Flat",0,{0.00,0.00,0.00},{0,0,0}},
	{"Streak Carriage",0,{0.00,0.00,0.00},{2,1,1}},
	{"Kart",93,{0.62,-0.37,0.46},{12,2,35,36,2,51,53,91,2,11,22,4,35}},
	{"Mower",60,{-0.35,-1.03,0.24},{16,94,1,11,1,116,1,117,1,4,1,25,1,3,1,37,1}},
	{"Duneride",110,{0.00,0.00,0.00},{16,91,38,115,43,85,6,79,7,78,8,77,18,79,18,86,24}},
	{"Sweeper",60,{-0.59,-0.94,0.26},{2,26,26}},
	{"Broadway",158,{0.00,0.00,0.00},{16,12,1,19,96,31,64,25,96,38,1,51,96,57,1,66,96}},
	{"Tornado",158,{0.00,0.00,0.00},{16,67,1,68,96,72,1,74,8,75,96,76,8,79,1,84,96}},
	{"AT-400",270,{0.00,0.00,0.00},{12,1,3,8,7,8,1,8,16,23,31,4,44}},
	{"DFT-30",130,{-1.33,2.89,-0.02},{2,1,1}},
	{"Huntley",158,{1.13,-2.29,0.16},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Stafford",153,{1.23,-1.77,0.29},{18,92,92,81,81,67,67,66,66,61,61,53,53,51,51,47,47,43,43}},
	{"BF-400",151,{-0.22,0.01,0.54},{16,54,1,58,1,66,1,72,1,75,1,87,1,11,1,36,1}},
	{"Newsvan",136,{-0.90,0.15,-0.32},{16,41,1,41,2,49,11,56,123,11,113,112,116,114,118,119,11}},
	{"Tug",85,{-0.62,0.37,-0.12},{2,1,1}},
	{"Trailer 3",0,{0.00,0.00,0.00},{2,1,1}},
	{"Emperor",153,{1.07,-2.29,0.20},{16,37,37,42,42,53,53,62,62,7,7,1,1,11,11,15,15}},
	{"Wayfarer",142,{0.00,0.00,0.00},{16,119,1,122,1,8,1,1,1,13,1,25,1,27,1,32,1}},
	{"Euros",165,{-1.22,-1.21,0.12},{16,36,1,4,1,43,1,53,1,72,1,75,1,95,1,11,1}},
	{"Hotdog",108,{-1.20,-2.12,0.23},{2,1,1}},
	{"Club",162,{0.98,-0.89,0.10},{16,37,37,31,31,23,23,22,22,7,7,124,124,114,114,112,112}},
	{"Freight Carriage",0,{0.00,0.00,0.00},{0,0,0}},
	{"Trailer 3",0,{0.00,0.00,0.00},{2,1,1}},
	{"Andromada",270,{0.00,0.00,0.00},{2,1,1}},
	{"Dodo",270,{0.00,0.00,0.00},{16,51,1,58,8,6,1,68,8,2,1,13,8,22,1,36,8}},
	{"RC Cam",130,{0.00,0.00,0.00},{0,0,0}},
	{"Launch",190,{0.00,0.00,0.00},{2,112,2}},
	{"Police Car (LSPD)",175,{-0.97,-2.16,0.06},{2,0,1}},
	{"Police Car (SFPD)",175,{-1.02,-2.16,0.07},{2,0,1}},
	{"Police Car (LVPD)",175,{-1.08,-1.95,0.18},{2,0,1}},
	{"Police Ranger",158,{0.00,0.00,0.00},{2,0,1}},
	{"Picador",151,{0.95,-2.01,0.06},{16,81,8,32,8,43,8,67,8,11,11,8,9,2,2,83,13}},
	{"S.W.A.T. Van",110,{-1.36,-1.69,0.92},{2,1,1}},
	{"Alpha",169,{0.97,-1.95,0.08},{16,58,1,69,1,75,77,18,1,32,1,45,45,13,1,34,1}},
	{"Phoenix",171,{1.24,-2.20,-0.04},{16,58,1,69,1,75,77,18,1,32,1,45,45,13,1,34,1}},
	{"Glendale",148,{0.00,0.00,0.00},{16,67,76,68,76,78,76,2,76,16,76,18,76,25,76,45,88}},
	{"Sadler",152,{-0.95,-0.93,-0.02},{16,61,8,32,8,43,8,67,8,11,11,8,9,2,2,83,13}},
	{"Luggage Trailer A",0,{0.00,0.00,0.00},{0,0,0}},
	{"Luggage Trailer B",0,{0.00,0.00,0.00},{0,0,0}},
	{"Stair Trailer",0,{0.00,0.00,0.00},{2,1,1}},
	{"Boxville",108,{-1.26,-0.03,0.09},{2,36,36}},
	{"Farm Plow",0,{0.00,0.00,0.00},{0,0,0}},
	{"Utility Trailer",0,{0.00,0.00,0.00},{0,0,0}}
};

#define v_interior      	0
#define v_color<%1>     	(%1 + 1)
#define v_paintjob      	3
#define v_horn      		4
#define v_editor      		5
#define v_spawn<%1>     	(%1 + 6)
#define v_spawn_interiorid  10
#define v_spawn_worldid  	11
#define v_spawn_uno_damage  12
#define v_petrolcap			13
#define v_bomb			    14
#define v_bomb_timer        15
#define v_update_timer      16

public OnGameModeInit()
{
	HasOnPlayerShotVehicle = ((funcidx("OnPlayerShotVehicle") != -1) ? true : false);
	HasOnPlayerEditVehicle = ((funcidx("OnPlayerEditVehicle") != -1) ? true : false);
	HasOnPlayerReachSpeedCapLimit = ((funcidx("OnPlayerReachSpeedCapLimit") != -1) ? true : false);
	HasOnVehicleBombActivate = ((funcidx("OnVehicleBombActivate") != -1) ? true : false);
	HasOnVehicleBombDeactivate = ((funcidx("OnVehicleBombDeactivate") != -1) ? true : false);
	HasOnVehicleBombExplode = ((funcidx("OnVehicleBombExplode") != -1) ? true : false);
	HasOnVehiclePosChange = ((funcidx("OnVehiclePosChange") != -1) ? true : false);
	HasOnVehicleVelocityChange = ((funcidx("OnVehicleVelocityChange") != -1) ? true : false);
	HasOnVehicleHealthChange = ((funcidx("OnVehicleHealthChange") != -1) ? true : false);
	HasOnVehicleUpdate = ((funcidx("OnVehicleUpdate") != -1) ? true : false);
	HasOnTrailerAttach = ((funcidx("OnTrailerAttach") != -1) ? true : false);
	HasOnTrailerDetach = ((funcidx("OnTrailerDetach") != -1) ? true : false);
	HasOnPlayerStealVehicle = ((funcidx("OnPlayerStealVehicle") != -1) ? true : false);

	#if defined _INC_y_timers
		VehicleTimer = repeat Vehicle_UpdateTimer();
	#else
		VehicleTimer = SetTimer("Vehicle_UpdateTimer",VEHICLE_UPDATE_INTERVAL,1);
	#endif

	#if defined Vehicle_OnGameModeInit
        return Vehicle_OnGameModeInit();
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnGameModeInit
    forward Vehicle_OnGameModeInit();
#endif
#if defined _ALS_OnGameModeInit
    #undef OnGameModeInit
#else
    #define _ALS_OnGameModeInit
#endif
#define OnGameModeInit Vehicle_OnGameModeInit

public OnGameModeExit()
{
	#if defined _INC_y_timers
		stop VehicleTimer;
	#else
		KillTimer(VehicleTimer);
	#endif

	#if defined Vehicle_OnGameModeExit
        return Vehicle_OnGameModeExit();
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnGameModeExit
    forward Vehicle_OnGameModeExit();
#endif
#if defined _ALS_OnGameModeExit
    #undef OnGameModeExit
#else
    #define _ALS_OnGameModeExit
#endif
#define OnGameModeExit Vehicle_OnGameModeExit

stock static Vehicle_SetPropertyInt(vehicleid, type, set)
{
	#if defined _gvar_included
		switch(type)
		{
			case v_interior: 		SetGVarInt("v_interior",set,vehicleid);
			case v_color<0>: 		SetGVarInt("v_color_1",set,vehicleid);
			case v_color<1>: 		SetGVarInt("v_color_2",set,vehicleid);
			case v_paintjob: 		SetGVarInt("v_paintjob",set,vehicleid);
			case v_horn: 			SetGVarInt("v_horn",set,vehicleid);
			case v_editor: 			SetGVarInt("v_editor",set,vehicleid);
			case v_spawn_interiorid:SetGVarInt("v_spawn_interiorid",set,vehicleid);
			case v_spawn_worldid: 	SetGVarInt("v_spawn_worldid",set,vehicleid);
			case v_spawn_uno_damage:SetGVarInt("v_spawn_uno_damage",set,vehicleid);
			case v_petrolcap:		SetGVarInt("v_petrolcap",set,vehicleid);
			case v_bomb:			SetGVarInt("v_bomb",set,vehicleid);
			case v_bomb_timer:		SetGVarInt("v_bomb_timer",set,vehicleid);
			case v_update_timer:	SetGVarInt("v_update_timer",set,vehicleid);
		}
		return 1;
	#else
		new string[35];
		switch(type)
		{
			case v_interior: 		format(string, sizeof(string), "%i_v_interior", vehicleid);
			case v_color<0>: 		format(string, sizeof(string), "%i_v_color_1", vehicleid);
			case v_color<1>: 		format(string, sizeof(string), "%i_v_color_2", vehicleid);
			case v_paintjob: 		format(string, sizeof(string), "%i_v_paintjob", vehicleid);
			case v_horn: 			format(string, sizeof(string), "%i_v_horn", vehicleid);
			case v_editor: 			format(string, sizeof(string), "%i_v_editor", vehicleid);
			case v_spawn_interiorid:format(string, sizeof(string), "%i_v_spawn_interiorid", vehicleid);
			case v_spawn_worldid: 	format(string, sizeof(string), "%i_v_spawn_worldid", vehicleid);
			case v_spawn_uno_damage:format(string, sizeof(string), "%i_v_spawn_uno_damage", vehicleid);
			case v_petrolcap:		format(string, sizeof(string), "%i_v_petrolcap", vehicleid);
			case v_bomb:			format(string, sizeof(string), "%i_v_bomb", vehicleid);
			case v_bomb_timer:		format(string, sizeof(string), "%i_v_bomb_timer", vehicleid);
			case v_update_timer:	format(string, sizeof(string), "%i_v_update_timer", vehicleid);
		}
		return setproperty(.name = string, .value = set);
	#endif
}

stock static Vehicle_GetPropertyInt(vehicleid, type)
{
	#if defined _gvar_included
		switch(type)
		{
			case v_interior: 		return GetGVarInt("v_interior", vehicleid);
			case v_color<0>: 		return GetGVarInt("v_color_1", vehicleid);
			case v_color<1>: 		return GetGVarInt("v_color_2", vehicleid);
			case v_paintjob: 		return GetGVarInt("v_paintjob", vehicleid);
			case v_horn: 			return GetGVarInt("v_horn", vehicleid);
			case v_editor: 			return GetGVarInt("v_editor", vehicleid);
			case v_spawn_interiorid:return GetGVarInt("v_spawn_interiorid", vehicleid);
			case v_spawn_worldid: 	return GetGVarInt("v_spawn_worldid", vehicleid);
			case v_spawn_uno_damage:return GetGVarInt("v_spawn_uno_damage", vehicleid);
			case v_petrolcap:		return GetGVarInt("v_petrolcap", vehicleid);
			case v_bomb:			return GetGVarInt("v_bomb", vehicleid);
			case v_bomb_timer:		return GetGVarInt("v_bomb_timer", vehicleid);
			case v_update_timer:	return GetGVarInt("v_update_timer", vehicleid);
		}
		return 0;
	#else
		new string[35];
		switch(type)
		{
			case v_interior: 		format(string, sizeof(string), "%i_v_interior", vehicleid);
			case v_color<0>: 		format(string, sizeof(string), "%i_v_color_1", vehicleid);
			case v_color<1>: 		format(string, sizeof(string), "%i_v_color_2", vehicleid);
			case v_paintjob: 		format(string, sizeof(string), "%i_v_paintjob", vehicleid);
			case v_horn: 			format(string, sizeof(string), "%i_v_horn", vehicleid);
			case v_editor: 			format(string, sizeof(string), "%i_v_editor", vehicleid);
			case v_spawn_interiorid:format(string, sizeof(string), "%i_v_spawn_interiorid", vehicleid);
			case v_spawn_worldid: 	format(string, sizeof(string), "%i_v_spawn_worldid", vehicleid);
			case v_spawn_uno_damage:format(string, sizeof(string), "%i_v_spawn_uno_damage", vehicleid);
			case v_petrolcap:		format(string, sizeof(string), "%i_v_petrolcap", vehicleid);
			case v_bomb:			format(string, sizeof(string), "%i_v_bomb", vehicleid);
			case v_bomb_timer:		format(string, sizeof(string), "%i_v_bomb_timer", vehicleid);
			case v_update_timer:	format(string, sizeof(string), "%i_v_update_timer", vehicleid);
		}
		return getproperty(.name = string);
	#endif
}

stock static Vehicle_EncodeString(string[])
{
	new source[2];
    for(new i, j = strlen(string); i < j; i++)
    {
       source[0] = (source[0] + string[i]) 		% 65521;
       source[1] = (source[1] + source[0])     	% 65521;
    }
    return (source[1] << 16) + source[0];
}

stock static Vehicle_SetPropertyFloat(vehicleid, type, Float:set)
{
	#if defined _gvar_included
		switch(type)
		{
			case v_spawn<0>: 	SetGVarFloat("v_spawn_x",set,vehicleid);
			case v_spawn<1>: 	SetGVarFloat("v_spawn_y",set,vehicleid);
			case v_spawn<2>: 	SetGVarFloat("v_spawn_z",set,vehicleid);
			case v_spawn<3>: 	SetGVarFloat("v_spawn_rotation",set,vehicleid);
		}
		return 1;
	#else
		new string[35];
		switch(type)
		{
			case v_spawn<0>: 	format(string, sizeof(string), "%i_v_spawn_x", vehicleid);
			case v_spawn<1>: 	format(string, sizeof(string), "%i_v_spawn_y", vehicleid);
			case v_spawn<2>: 	format(string, sizeof(string), "%i_v_spawn_z", vehicleid);
			case v_spawn<3>: 	format(string, sizeof(string), "%i_v_spawn_rotation", vehicleid);
		}
		new value[8];
		format(value, sizeof(value), "%f", set);
		return setproperty(.value = Vehicle_EncodeString(string), .string = value);
	#endif
}

stock static Float:Vehicle_GetPropertyFloat(vehicleid, type)
{
	#if defined _gvar_included
		switch(type)
		{
			case v_spawn<0>:	return GetGVarFloat("v_spawn_x", vehicleid);
			case v_spawn<1>:	return GetGVarFloat("v_spawn_y", vehicleid);
			case v_spawn<2>:	return GetGVarFloat("v_spawn_z", vehicleid);
			case v_spawn<3>:	return GetGVarFloat("v_spawn_rotation", vehicleid);
		}
		return 0.0;
	#else
		new string[35];
		switch(type)
		{
			case v_spawn<0>: 	format(string, sizeof(string), "%i_v_spawn_x", vehicleid);
			case v_spawn<1>: 	format(string, sizeof(string), "%i_v_spawn_y", vehicleid);
			case v_spawn<2>: 	format(string, sizeof(string), "%i_v_spawn_z", vehicleid);
			case v_spawn<3>: 	format(string, sizeof(string), "%i_v_spawn_rotation", vehicleid);
		}
		new value[8];
		getproperty(.value = Vehicle_EncodeString(string), .string = value);
		return floatstr(value);
	#endif
}

stock static Vehicle_DeleteProperty(vehicleid, type)
{
	#if defined _gvar_included
		switch(type)
		{
			case v_interior: 			DeleteGVar("v_interior",vehicleid);
			case v_color<0>: 			DeleteGVar("v_color_1", vehicleid);
			case v_color<1>: 			DeleteGVar("v_color_2", vehicleid);
			case v_paintjob: 			DeleteGVar("v_paintjob",vehicleid);
			case v_horn: 				DeleteGVar("v_horn", vehicleid);
			case v_editor: 				DeleteGVar("v_editor", vehicleid);
			case v_spawn<0>:			DeleteGVar("v_spawn_x", vehicleid);
			case v_spawn<1>:			DeleteGVar("v_spawn_y", vehicleid);
			case v_spawn<2>:			DeleteGVar("v_spawn_z", vehicleid);
			case v_spawn<3>:			DeleteGVar("v_spawn_rotation", vehicleid);
			case v_spawn<4>: 			DeleteGVar("v_spawn_interiorid", vehicleid);
			case v_spawn<5>: 			DeleteGVar("v_spawn_worldid", vehicleid);
			case v_spawn_uno_damage:	DeleteGVar("v_spawn_uno_damage", vehicleid);
			case v_petrolcap:			DeleteGVar("v_petrolcap", vehicleid);
			case v_bomb:				DeleteGVar("v_bomb", vehicleid);
			case v_bomb_timer:			DeleteGVar("v_bomb_timer", vehicleid);
			case v_update_timer:		DeleteGVar("v_update_timer", vehicleid);
		}
		return 1;
	#else
		new string[35];
		switch(type)
		{
			case v_interior: 	format(string, sizeof(string), "%i_v_interior", vehicleid);
			case v_color<0>: 	format(string, sizeof(string), "%i_v_color_1", vehicleid);
			case v_color<1>: 	format(string, sizeof(string), "%i_v_color_2", vehicleid);
			case v_paintjob: 	format(string, sizeof(string), "%i_v_paintjob", vehicleid);
			case v_horn: 		format(string, sizeof(string), "%i_v_horn", vehicleid);
			case v_editor: 		format(string, sizeof(string), "%i_v_editor", vehicleid);
			case v_spawn<0>:
			{
				format(string, sizeof(string), "%i_v_spawn_x", vehicleid);
				return deleteproperty(.value = Vehicle_EncodeString(string));
			}
			case v_spawn<1>:
			{
				format(string, sizeof(string), "%i_v_spawn_y", vehicleid);
				return deleteproperty(.value = Vehicle_EncodeString(string));
			}
			case v_spawn<2>:
			{
				format(string, sizeof(string), "%i_v_spawn_z", vehicleid);
				return deleteproperty(.value = Vehicle_EncodeString(string));
			}
			case v_spawn<3>:
			{
				format(string, sizeof(string), "%i_v_spawn_rotation", vehicleid);
				return deleteproperty(.value = Vehicle_EncodeString(string));
			}
			case v_spawn<4>: 	format(string, sizeof(string), "%i_v_spawn_interiorid", vehicleid);
			case v_spawn<5>: 	format(string, sizeof(string), "%i_v_spawn_worldid", vehicleid);
			case v_spawn_uno_damage:format(string, sizeof(string), "%i_v_spawn_uno_damage", vehicleid);
			case v_petrolcap:	format(string, sizeof(string), "%i_v_petrolcap", vehicleid);
			case v_bomb:		format(string, sizeof(string), "%i_v_bomb", vehicleid);
			case v_bomb_timer:	format(string, sizeof(string), "%i_v_bomb_timer", vehicleid);
			case v_update_timer:format(string, sizeof(string), "%i_v_update_timer", vehicleid);
		}
		return deleteproperty(.name = string);
	#endif
}

stock Vehicle_CreateVehicle(modelid, Float:x, Float:y, Float:z, Float:rotation, color1 = -1, color2 = -1, respawn_delay = -1, addsiren = 0, worldid = 0, interiorid = 0, bool:unoccupied_damage = false)
{
	if(modelid < 400 || modelid > 611) return false;

	if(	(color1 == -1 || color2 == -1) &&
		gVehicleInfo[(modelid - 400)][Color][0])
	{
		if(gVehicleInfo[(modelid - 400)][Color][0] == 2)
		{
		    color1 = gVehicleInfo[(modelid - 400)][Color][1];
		    color2 = gVehicleInfo[(modelid - 400)][Color][2];
		}
		else
		{
			new index = random(gVehicleInfo[(modelid - 400)][Color][0]) & -2;

			color1 = gVehicleInfo[(modelid - 400)][Color][++index];
			color2 = gVehicleInfo[(modelid - 400)][Color][++index];
		}
	}

	new vehicleid;
	switch(modelid)
	{
		case 569, 570, 537, 538: 	vehicleid = AddStaticVehicleEx(modelid, x, y, z, rotation, color1, color2, respawn_delay, addsiren);
		default: 					vehicleid = CreateVehicle(modelid, Float:x, Float:y, Float:z, Float:rotation, color1, color2, respawn_delay, addsiren);
	}

	LinkVehicleToInterior(vehicleid, interiorid);
	SetVehicleVirtualWorld(vehicleid, worldid);

    Vehicle_SetPropertyInt(vehicleid, v_interior, interiorid);

    Vehicle_SetPropertyInt(vehicleid, v_color<0>, color1);
    Vehicle_SetPropertyInt(vehicleid, v_color<1>, color2);

    Vehicle_SetPropertyInt(vehicleid, v_paintjob, 3);

    Vehicle_SetPropertyInt(vehicleid, v_horn, 0);

	Vehicle_SetPropertyInt(vehicleid, v_editor, INVALID_OBJECT_ID);

	for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
	{
	    gVehicleAttachedObject[vehicleid][i] = INVALID_OBJECT_ID;
	}

	Vehicle_SetPropertyFloat(vehicleid, v_spawn<0>, x);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<1>, y);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<2>, z);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<3>, rotation);

	Vehicle_SetPropertyInt(vehicleid, v_spawn_worldid, worldid);
	Vehicle_SetPropertyInt(vehicleid, v_spawn_interiorid, interiorid);

	Vehicle_SetPropertyInt(vehicleid, v_spawn_uno_damage, _:unoccupied_damage);

	Vehicle_SetPropertyInt(vehicleid, v_petrolcap, 0);

	Vehicle_SetPropertyInt(vehicleid, v_bomb, 0);
	Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, -1);

	Vehicle_SetPropertyInt(vehicleid, v_update_timer, -1);

	gVehicleDriver[vehicleid] = INVALID_PLAYER_ID;
	gVehicleSpeedCap[vehicleid] = 0;
	gVehicleIsSticky[vehicleid] = false;

	gVehicleDamage[vehicleid][0] = true;
	gVehicleDamage[vehicleid][1] = true;
	gVehicleDamage[vehicleid][2] = true;
	gVehicleDamage[vehicleid][3] = true;

	gVehicleFloat[vehicleid][0] = x;
	gVehicleFloat[vehicleid][1] = y;
	gVehicleFloat[vehicleid][2] = z;
	gVehicleFloat[vehicleid][3] = rotation;

	gVehicleFloat[vehicleid][4] = 0.0;
	gVehicleFloat[vehicleid][5] = 0.0;
	gVehicleFloat[vehicleid][6] = 0.0;

	gVehicleFloat[vehicleid][7] = 1000.0;
	gVehicleFloat[vehicleid][8] = -1.0;
	gVehicleFloat[vehicleid][9] = 1000.0;

	gVehicleDamageValue[vehicleid][0] = 0;
	gVehicleDamageValue[vehicleid][1] = 0;
	gVehicleDamageValue[vehicleid][2] = 0;
	gVehicleDamageValue[vehicleid][3] = 0;

	return vehicleid;
}
#if defined _ALS_CreateVehicle
	#undef CreateVehicle
#else
	#define _ALS_CreateVehicle
#endif
#define CreateVehicle Vehicle_CreateVehicle
//
#if defined _ALS_AddStaticVehicleEx
	#undef AddStaticVehicleEx
#else
	#define _ALS_AddStaticVehicleEx
#endif
#define AddStaticVehicleEx Vehicle_CreateVehicle
//
#if defined _ALS_AddStaticVehicle
	#undef AddStaticVehicle
#else
	#define _ALS_AddStaticVehicle
#endif
#define AddStaticVehicle Vehicle_CreateVehicle
//

stock Vehicle_SetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
{
	if(SetVehiclePos(vehicleid, Float:x, Float:y, Float:z))
	{
		gVehicleFloat[vehicleid][0] = x;
		gVehicleFloat[vehicleid][1] = y;
		gVehicleFloat[vehicleid][2] = z;
		return true;
	}
	return false;
}
#if defined _ALS_SetVehiclePos
	#undef SetVehiclePos
#else
	#define _ALS_SetVehiclePos
#endif
#define SetVehiclePos Vehicle_SetVehiclePos

stock Vehicle_SetVehicleZAngle(vehicleid, Float:angle)
{
	if(SetVehicleZAngle(vehicleid, angle))
	{
		gVehicleFloat[vehicleid][3] = angle;
		return true;
	}
	return false;
}
#if defined _ALS_SetVehicleZAngle
	#undef SetVehicleZAngle
#else
	#define _ALS_SetVehicleZAngle
#endif
#define SetVehicleZAngle Vehicle_SetVehicleZAngle

stock Vehicle_DestroyVehicle(vehicleid)
{
	if(DestroyVehicle(vehicleid))
	{
		for(new i; i <= GetPlayerPoolSize(); i++)
		{
			if(IsPlayerConnected(i))
			{
				if(gPlayerEdit[i] == Vehicle_GetPropertyInt(vehicleid, v_editor))
				{
				    CancelEdit(i);
				}
			}
		}

		if(Vehicle_GetPropertyInt(vehicleid, v_update_timer) != -1)
		{
			KillTimer(Vehicle_GetPropertyInt(vehicleid, v_update_timer));
		}

		if(gVehicleDriver[vehicleid] != INVALID_PLAYER_ID)
        {
            DeletePVar(gVehicleDriver[vehicleid],"p_driving_vid");
            gVehicleDriver[vehicleid] = INVALID_PLAYER_ID;
        }
        gVehicleSpeedCap[vehicleid] = 0;
        gVehicleIsSticky[vehicleid] = false;

        gVehicleDamage[vehicleid][0] = true;
		gVehicleDamage[vehicleid][1] = true;
		gVehicleDamage[vehicleid][2] = true;
		gVehicleDamage[vehicleid][3] = true;

		gVehicleDamageValue[vehicleid][0] = 0;
		gVehicleDamageValue[vehicleid][1] = 0;
		gVehicleDamageValue[vehicleid][2] = 0;
		gVehicleDamageValue[vehicleid][3] = 0;

		Vehicle_DeleteProperty(vehicleid, v_interior);

		Vehicle_DeleteProperty(vehicleid, v_color<0>);
		Vehicle_DeleteProperty(vehicleid, v_color<1>);

		Vehicle_DeleteProperty(vehicleid, v_paintjob);

		Vehicle_DeleteProperty(vehicleid, v_horn);

		#if defined STREAMER_TYPE_OBJECT
			DestroyDynamicObject(Vehicle_GetPropertyInt(vehicleid, v_editor));
			for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
			{
	  			if(IsValidDynamicObject(gVehicleAttachedObject[vehicleid][i]))
				{
				    DestroyDynamicObject(gVehicleAttachedObject[vehicleid][i]);
				 	gVehicleAttachedObject[vehicleid][i] = INVALID_OBJECT_ID;
			 	}
			}
		#else
			DestroyObject(Vehicle_GetPropertyInt(vehicleid, v_editor));
			for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
			{
	  			if(IsValidObject(gVehicleAttachedObject[vehicleid][i]))
				{
				    DestroyObject(gVehicleAttachedObject[vehicleid][i]);
				 	gVehicleAttachedObject[vehicleid][i] = INVALID_OBJECT_ID;
			 	}
			}
		#endif

		Vehicle_DeleteProperty(vehicleid, v_editor);

		Vehicle_DeleteProperty(vehicleid, v_spawn<0>);
		Vehicle_DeleteProperty(vehicleid, v_spawn<1>);
		Vehicle_DeleteProperty(vehicleid, v_spawn<2>);
		Vehicle_DeleteProperty(vehicleid, v_spawn<3>);

		Vehicle_DeleteProperty(vehicleid, v_spawn_worldid);
		Vehicle_DeleteProperty(vehicleid, v_spawn_interiorid);

		Vehicle_DeleteProperty(vehicleid, v_spawn_uno_damage);

		Vehicle_DeleteProperty(vehicleid, v_petrolcap);

		Vehicle_DeleteProperty(vehicleid, v_bomb);
		Vehicle_DeleteProperty(vehicleid, v_bomb_timer);

		Vehicle_DeleteProperty(vehicleid, v_update_timer);

		vehicleid = INVALID_VEHICLE_ID;
	}
	return true;
}
#if defined _ALS_DestroyVehicle
	#undef DestroyVehicle
#else
	#define _ALS_DestroyVehicle
#endif
#define DestroyVehicle Vehicle_DestroyVehicle

stock Vehicle_LinkVehicleToInterior(vehicleid, interiorid)
{
	if(LinkVehicleToInterior(vehicleid, interiorid))
	{
	    Vehicle_SetPropertyInt(vehicleid, v_interior, interiorid);
		return true;
	}
	return false;
}
#if defined _ALS_LinkVehicleToInterior
	#undef LinkVehicleToInterior
#else
	#define _ALS_LinkVehicleToInterior
#endif
#define LinkVehicleToInterior Vehicle_LinkVehicleToInterior
//
#if ! defined SetVehicleInterior
	#define SetVehicleInterior Vehicle_LinkVehicleToInterior
#endif
//

stock GetVehicleInterior(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_interior);
}

stock Vehicle_ChangeVehicleColor(vehicleid, color1, color2)
{
	new modelid = GetVehicleModel(vehicleid);

	if(	(color1 == -1 || color2 == -1) &&
		gVehicleInfo[(modelid - 400)][Color][0])
	{
		if(gVehicleInfo[(modelid - 400)][Color][0] == 2)
		{
		    color1 = gVehicleInfo[(modelid - 400)][Color][1];
		    color2 = gVehicleInfo[(modelid - 400)][Color][2];
		}
		else
		{
			new index = random(gVehicleInfo[(modelid - 400)][Color][0]) & -2;

			color1 = gVehicleInfo[(modelid - 400)][Color][++index];
			color2 = gVehicleInfo[(modelid - 400)][Color][++index];
		}
	}

	if(ChangeVehicleColor(vehicleid, color1, color2))
	{
	    Vehicle_SetPropertyInt(vehicleid, v_color<0>, color1);
	    Vehicle_SetPropertyInt(vehicleid, v_color<1>, color2);
		return true;
	}
	return false;
}
#if defined _ALS_ChangeVehicleColor
	#undef ChangeVehicleColor
#else
	#define _ALS_ChangeVehicleColor
#endif
#define ChangeVehicleColor Vehicle_ChangeVehicleColor

#if ! defined SetVehicleColor
	#define SetVehicleColor ChangeVehicleColor
#endif

stock GetVehicleColor(vehicleid, &color1, &color2)
{
	color1 = Vehicle_GetPropertyInt(vehicleid, v_color<0>);
	color2 = Vehicle_GetPropertyInt(vehicleid, v_color<1>);
	return true;
}

stock Vehicle_ChangeVehiclePaintjob(vehicleid, paintjobid)
{
	if(ChangeVehiclePaintjob(vehicleid, paintjobid))
	{
	    Vehicle_SetPropertyInt(vehicleid, v_paintjob, paintjobid);

		if(paintjobid == 3)
		{
			new colors[2];
			GetVehicleColor(vehicleid, colors[0], colors[1]);
			ChangeVehicleColor(vehicleid, colors[0], colors[1]);
		}
		return true;
	}
	return false;
}
#if defined _ALS_ChangeVehiclePaintjob
	#undef ChangeVehiclePaintjob
#else
	#define _ALS_ChangeVehiclePaintjob
#endif
#define ChangeVehiclePaintjob Vehicle_ChangeVehiclePaintjob

stock GetVehiclePaintjob(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_paintjob);
}

stock RemoveVehiclePaintjob(vehicleid)
{
	return ChangeVehiclePaintjob(vehicleid, 3);
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	Vehicle_SetPropertyInt(vehicleid, v_paintjob, paintjobid);

    #if defined Vehicle_OnVehiclePaintjob
        return Vehicle_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnVehiclePaintjob
    forward Vehicle_OnVehiclePaintjob(playerid, vehicleid, paintjobid);
#endif
#if defined _ALS_OnVehiclePaintjob
    #undef OnVehiclePaintjob
#else
    #define _ALS_OnVehiclePaintjob
#endif
#define OnVehiclePaintjob Vehicle_OnVehiclePaintjob

public OnVehicleSpawn(vehicleid)
{
	Vehicle_SetPropertyInt(vehicleid, v_paintjob, 3);

	new colors[2];
	colors[0] = Vehicle_GetPropertyInt(vehicleid, v_color<0>);
	colors[1] = Vehicle_GetPropertyInt(vehicleid, v_color<1>);
	ChangeVehicleColor(vehicleid, colors[0], colors[1]);

	new Float:pos[3];
	GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);

	new Float:angle;
	GetVehicleZAngle(vehicleid, angle);

	new Float:vehicle_pos[3], Float:vehicle_angle, vehicle_worldid, vehicle_interiorid;
	GetVehicleSpawnInfo(vehicleid, vehicle_pos[0], vehicle_pos[1], vehicle_pos[2], vehicle_angle, vehicle_worldid, vehicle_interiorid);

 	if( pos[0] != vehicle_pos[0] ||
		pos[1] != vehicle_pos[1] ||
		pos[2] != vehicle_pos[2] ||
		angle != vehicle_angle ||
		vehicle_worldid != GetVehicleVirtualWorld(vehicleid) ||
		vehicle_interiorid != GetVehicleInterior(vehicleid))
	{
	    TeleportVehicle(vehicleid, vehicle_pos[0], vehicle_pos[1], vehicle_pos[2], vehicle_angle, vehicle_worldid, vehicle_interiorid);
	    gVehicleFloat[vehicleid][0] = vehicle_pos[0];
		gVehicleFloat[vehicleid][1] = vehicle_pos[1];
		gVehicleFloat[vehicleid][2] = vehicle_pos[2];
		gVehicleFloat[vehicleid][3] = vehicle_angle;
	}
	else
	{
		gVehicleFloat[vehicleid][0] = pos[0];
		gVehicleFloat[vehicleid][1] = pos[1];
		gVehicleFloat[vehicleid][2] = pos[2];
		gVehicleFloat[vehicleid][3] = angle;
	}

	gVehicleDamage[vehicleid][0] = true;
	gVehicleDamage[vehicleid][1] = true;
	gVehicleDamage[vehicleid][2] = true;
	gVehicleDamage[vehicleid][3] = true;

	gVehicleFloat[vehicleid][4] = 0.0;
	gVehicleFloat[vehicleid][5] = 0.0;
	gVehicleFloat[vehicleid][6] = 0.0;
	gVehicleFloat[vehicleid][7] = gVehicleFloat[vehicleid][9];
	gVehicleFloat[vehicleid][8] = -1;

	gVehicleDamageValue[vehicleid][0] = 0;
	gVehicleDamageValue[vehicleid][1] = 0;
	gVehicleDamageValue[vehicleid][2] = 0;
	gVehicleDamageValue[vehicleid][3] = 0;

	SetVehicleHealth(vehicleid,gVehicleFloat[vehicleid][7]);

    #if defined Vehicle_OnVehicleSpawn
        return Vehicle_OnVehicleSpawn(vehicleid);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnVehicleSpawn
    forward Vehicle_OnVehicleSpawn(vehicleid);
#endif
#if defined _ALS_OnVehicleSpawn
    #undef OnVehicleSpawn
#else
    #define _ALS_OnVehicleSpawn
#endif
#define OnVehicleSpawn Vehicle_OnVehicleSpawn

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	Vehicle_SetPropertyInt(vehicleid, v_color<0>, color1);
	Vehicle_SetPropertyInt(vehicleid, v_color<1>, color2);

    #if defined Vehicle_OnVehicleRespray
        return Vehicle_OnVehicleRespray(playerid, vehicleid, color1, color2);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnVehicleRespray
    forward Vehicle_OnVehicleRespray(playerid, vehicleid, color1, color2);
#endif
#if defined _ALS_OnVehicleRespray
    #undef OnVehicleRespray
#else
    #define _ALS_OnVehicleRespray
#endif
#define OnVehicleRespray Vehicle_OnVehicleRespray

stock SetVehicleHorn(vehicleid, soundid)
{
	Vehicle_SetPropertyInt(vehicleid, v_horn, soundid);
	return true;
}

stock GetVehicleHorn(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_horn);
}

stock RestoreVehicleHorn(vehicleid)
{
	return SetVehicleHorn(vehicleid, 0);
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_CROUCH)
	{
	    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	    {
	        new horn = Vehicle_GetPropertyInt(GetPlayerVehicleID(playerid), v_horn);
	        if(horn != 0)
	        {
				new Float:pos[3];
				GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

			    for(new i; i < MAX_PLAYERS; i++)
			    {
			        if(IsPlayerInRangeOfPoint(i, 35.0, pos[0], pos[1], pos[2]))
					{
					    PlayerPlaySound(playerid, horn, pos[0], pos[1], pos[2]);
					}
			    }
		    }
		}
	}

	#if defined Vehicle_OnPlayerKeyStateChange
        return Vehicle_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerKeyStateChange
    forward Vehicle_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif
#if defined _ALS_OnPlayerKeyStateChange
    #undef OnPlayerKeyStateChange
#else
    #define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange Vehicle_OnPlayerKeyStateChange

stock ToggleVehicleDamageUpdate(vehicleid, type, bool:toggle)
{
	if(type == VEHICLE_DAMAGE_ALL)
	{
		gVehicleDamage[vehicleid][VEHICLE_DAMAGE_PANELS] = toggle;
		gVehicleDamage[vehicleid][VEHICLE_DAMAGE_DOORS] = toggle;
		gVehicleDamage[vehicleid][VEHICLE_DAMAGE_LIGHTS] = toggle;
		//gVehicleDamage[vehicleid][VEHICLE_DAMAGE_TIRES] = toggle;
	}
	else
	{
		gVehicleDamage[vehicleid][type] = toggle;
	}
    return 1;
}

stock IsVehicleDamageToggled(vehicleid, type)
{
	return gVehicleDamage[vehicleid][type];
}

stock UpdateVehicleDamageStatusEx(vehicleid, type, update)
{
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);

    switch(type)
	{
		case VEHICLE_DAMAGE_PANELS: return UpdateVehicleDamageStatus(vehicleid, update, doors, lights, tires);
		case VEHICLE_DAMAGE_DOORS: return UpdateVehicleDamageStatus(vehicleid, panels, update, lights, tires);
		case VEHICLE_DAMAGE_LIGHTS: return UpdateVehicleDamageStatus(vehicleid, panels, doors, update, tires);
		case VEHICLE_DAMAGE_TIRES: return UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, update);
	}
	return false;
}

stock GetVehicleDamageStatusEx(vehicleid, type)
{
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);

	switch(type)
	{
		case VEHICLE_DAMAGE_PANELS: return panels;
		case VEHICLE_DAMAGE_DOORS: return doors;
		case VEHICLE_DAMAGE_LIGHTS: return lights;
		case VEHICLE_DAMAGE_TIRES: return tires;
	}
	return -1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	new panels, doors, lights, tires;
	GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);

	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_PANELS] = ((gVehicleDamage[vehicleid][VEHICLE_DAMAGE_PANELS]) ? (panels) : (gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_PANELS]));
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_DOORS] = ((gVehicleDamage[vehicleid][VEHICLE_DAMAGE_DOORS]) ? (doors) : (gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_DOORS]));
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_LIGHTS] = ((gVehicleDamage[vehicleid][VEHICLE_DAMAGE_LIGHTS]) ? (lights) : (gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_LIGHTS]));
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_TIRES] = ((gVehicleDamage[vehicleid][VEHICLE_DAMAGE_TIRES]) ? (tires) : (gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_TIRES]));

	UpdateVehicleDamageStatus(vehicleid,gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_PANELS],gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_DOORS],gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_LIGHTS],gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_TIRES]);
	
	#if defined Vehicle_OnVehDmgStatusUpd
        return Vehicle_OnVehDmgStatusUpd(vehicleid, playerid);
    #else
        return 1;
    #endif
}

#if defined Vehicle_OnVehDmgStatusUpd
    forward Vehicle_OnVehDmgStatusUpd(vehicleid, playerid);
#endif
#if defined _ALS_OnVehicleDamageStatusUpd
    #undef OnVehicleDamageStatusUpdate
#else
    #define _ALS_OnVehicleDamageStatusUpd
#endif
#define OnVehicleDamageStatusUpdate Vehicle_OnVehDmgStatusUpd

stock encode_lights(light1, light2, light3, light4)
{
	return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}
stock encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
	return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}

stock encode_doors(bonnet, boot, driver_door, passenger_door, behind_driver_door, behind_passenger_door)
{
    #pragma unused behind_driver_door
    #pragma unused behind_passenger_door
    return bonnet | (boot << 8) | (driver_door << 16) | (passenger_door << 24);
}

stock static Vehicle_UpdateVehicleDamage(vehicleid, type)
{
    new panels, doors, lights, tires;
    GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
    switch(type)
	{
 		case VEHICLE_DAMAGE_PANELS: panels = encode_panels(1, 1, 1, 1, 3, 3, 3);
   		case VEHICLE_DAMAGE_DOORS: doors = encode_doors(4, 4, 4, 4, 0, 0);
        case VEHICLE_DAMAGE_LIGHTS: lights = encode_lights(1, 1, 1, 1);
    }
    UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(hittype == BULLET_HIT_TYPE_VEHICLE)
    {
        new Float:fHealth;
        GetVehicleHealth(hitid, fHealth);

		if(fHealth > (250 - 1))
		{
			new
				fModelid = GetVehicleModel(hitid),
				Float:fOffSet[3],
				Float:fDamage
			;

			switch(GetPlayerWeapon(playerid))
			{
				case 22: fDamage = 40.0;
				case 23: fDamage = 40.0;
    			case 24: fDamage = 140.0;
       			case 25: fDamage = 80.0;
                case 26: fDamage = 80.0;
                case 27: fDamage = 80.0;
                case 28: fDamage = 25.0;
                case 29: fDamage = 25.0;
                case 30: fDamage = 30.0;
                case 31: fDamage = 30.0;
                case 32: fDamage = 25.0;
                case 33: fDamage = 75.0;
                case 34: fDamage = 125.0;
                case 35: fDamage = 751.0;
                case 36: fDamage = 751.0;
                case 38: fDamage = 50.0;
            }

			GetVehicleModelInfo(fModelid, VEHICLE_MODEL_INFO_WHEELSFRONT, fOffSet[0], fOffSet[1], fOffSet[2]);
			if(	fX >= fOffSet[0] - 2.4 &&
				fX <= fOffSet[0] &&
				fY >= fOffSet[1] - 0.4 &&
				fY <= fOffSet[1] + 0.4 &&
				fZ >= fOffSet[2] - 0.4 &&
				fZ <= fOffSet[2] + 0.4)
			{
				if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_FRONT_LEFT_WHEEL))
				{
					if(IsUnoccupiedDamageToggled(hitid))
					{
						switch(GetVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES))
						{
						    case 0: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 8);
						    case 1: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 9);
						    case 2: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 10);
						    case 3: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 11);
						    case 4: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 12);
						    case 5: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 13);
						    case 6: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 14);
						    case 7: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 15);
						}
						return 1;
					}
				}
				else return 0;
			}
			//right
			if(	fX >= fOffSet[0] - 0.4 &&
				fX <= fOffSet[0] + 0.4 &&
				fY >= fOffSet[1] - 0.4 &&
				fY <= fOffSet[1] + 0.4 &&
				fZ >= fOffSet[2] - 0.4 &&
				fZ <= fOffSet[2] + 0.4)
			{
				if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_FRONT_RIGHT_WHEEL))
				{
					if(IsUnoccupiedDamageToggled(hitid))
					{
						switch(GetVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES))
						{
						    case 0: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 2);
						    case 1: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 3);
						    case 4: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 6);
						    case 5: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 7);
						    case 8: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 10);
						    case 9: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 11);
						    case 12: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 14);
						    case 13: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 15);
						}
						return 1;
					}
				}
				else return 0;
			}

			//back wheels
			GetVehicleModelInfo(fModelid, VEHICLE_MODEL_INFO_WHEELSREAR, fOffSet[0], fOffSet[1], fOffSet[2]);
			//left
			if(	fX >= fOffSet[0] - 2.4 &&
				fX <= fOffSet[0] &&
				fY >= fOffSet[1] - 0.4 &&
				fY <= fOffSet[1] + 0.4 &&
				fZ >= fOffSet[2] - 0.4 &&
				fZ <= fOffSet[2] + 0.4)
			{
				if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_BACK_LEFT_WHEEL))
				{
					if(IsUnoccupiedDamageToggled(hitid))
					{
						switch(GetVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES))
						{
						    case 0: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 4);
						    case 1: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 5);
						    case 2: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 6);
						    case 3: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 7);
						    case 8: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 12);
						    case 9: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 13);
						    case 10: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 14);
						    case 11: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 15);
						}
						return 1;
					}
				}
				else return 0;
			}
			//right
			if(	fX >= fOffSet[0] - 0.4 &&
				fX <= fOffSet[0] + 0.4 &&
				fY >= fOffSet[1] - 0.4 &&
				fY <= fOffSet[1] + 0.4 &&
				fZ >= fOffSet[2] - 0.4 &&
				fZ <= fOffSet[2] + 0.4)
			{
				if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_BACK_RIGHT_WHEEL))
				{
					if(IsUnoccupiedDamageToggled(hitid))
					{
						switch(GetVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES))
						{
						    case 0: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 1);
						    case 2: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 3);
						    case 4: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 5);
						    case 6: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 7);
						    case 8: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 9);
						    case 10: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 11);
						    case 12: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 13);
						    case 14: UpdateVehicleDamageStatusEx(hitid, VEHICLE_DAMAGE_TIRES, 15);
						}
						return 1;
					}
				}
				else return 0;
			}

			//petrol cap
			fModelid -= 400;
			if(	fX >= gVehicleInfo[fModelid][PetrolCapOffset][0] - 0.15 &&
				fX <= gVehicleInfo[fModelid][PetrolCapOffset][0] + 0.15 &&
				fY >= gVehicleInfo[fModelid][PetrolCapOffset][1] - 0.15 &&
				fY <= gVehicleInfo[fModelid][PetrolCapOffset][1] + 0.15 &&
				fZ >= gVehicleInfo[fModelid][PetrolCapOffset][2] - 0.15 &&
				fZ <= gVehicleInfo[fModelid][PetrolCapOffset][2] + 0.15)
			{
				if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_PETROLCAP))
				{
					if(IsPetrolCapDestroyToggled(hitid))
	    			{
						if(	IsUnoccupiedDamageToggled(hitid) ||
							IsVehicleOccupied(hitid))
						{
					        new Float:pos[3];
	                        GetVehiclePos(hitid, pos[0], pos[1], pos[2]);
	                        CreateExplosion(pos[0], pos[1], pos[2], 3, 25.0);
	                        return SetVehicleToRespawn(hitid);
					    }
					}
					else
					{
						fHealth -= fDamage;
						Vehicle_SetVehicleHealth(hitid, fHealth);

						switch(fHealth)
						{
						    case 251..399: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_DOORS);
						    case 400..599: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_PANELS);
						    case 600..700: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_LIGHTS);
						}
					}
				}
				else return 0;
			}

			if(!HasOnPlayerShotVehicle || CallLocalFunction("OnPlayerShotVehicle", "iiifi", playerid, hitid, weaponid, fDamage, VEHICLE_BODYPART_UNKNOWN))
			{
			    if(IsUnoccupiedDamageToggled(hitid))
			    {
					fHealth -= fDamage;
					Vehicle_SetVehicleHealth(hitid, fHealth);

					switch(floatround(fHealth))
					{
					    case 251..399: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_DOORS);
					    case 400..599: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_PANELS);
					    case 600..700: return Vehicle_UpdateVehicleDamage(hitid, VEHICLE_DAMAGE_LIGHTS);
					}
				}
			}
			else return 0;
		}
	}

	#if defined Vehicle_OnPlayerWeaponShot
        return Vehicle_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerWeaponShot
    forward Vehicle_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
#if defined _ALS_OnPlayerWeaponShot
    #undef OnPlayerWeaponShot
#else
    #define _ALS_OnPlayerWeaponShot
#endif
#define OnPlayerWeaponShot Vehicle_OnPlayerWeaponShot

stock IsVehicleOccupied(vehicleid)
{
    for(new i, j = GetPlayerPoolSize(); i < j; i++)
    {
        if(IsPlayerConnected(i) && IsPlayerInVehicle(i, vehicleid))
		{
			return true;
        }
    }
    return false;
}

stock GetVehicleDriverID(vehicleid)
{
	return gVehicleDriver[vehicleid];
}

stock Veh_GetDriver(vehicleid)
{
	#if defined _Y_ITERATE_LOCAL_VERSION
	foreach(new i : Player)
	{
	#else
	for(new i; i <= GetPlayerPoolSize(); i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	#endif
	    if(IsPlayerInVehicle(i,vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER) return i;
	}
	return INVALID_PLAYER_ID;
}

stock EditVehicle(playerid, vehicleid)
{
	#if defined STREAMER_TYPE_OBJECT
		if(IsValidDynamicObject(Vehicle_GetPropertyInt(vehicleid, v_editor))) return false;

		new Float:pos[3];
		GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
		Vehicle_SetPropertyInt(vehicleid, v_editor, CreateDynamicObject(19300, pos[0], pos[1], pos[2], 0.0, 0.0, 0.0));

		EditDynamicObject(playerid, Vehicle_GetPropertyInt(vehicleid, v_editor));
	#else
		if(IsValidObject(Vehicle_GetPropertyInt(vehicleid, v_editor))) return false;

		new Float:pos[3];
		GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
		Vehicle_SetPropertyInt(vehicleid, v_editor, CreateObject(19300, pos[0], pos[1], pos[2], 0.0, 0.0, 0.0));

		EditObject(playerid, Vehicle_GetPropertyInt(vehicleid, v_editor));
	#endif
	gPlayerEdit[playerid] = vehicleid;
	return true;
}

#if ! defined IsValidVehicle
	native IsValidVehicle(vehicleid);
#endif

#if ! defined STREAMER_TYPE_OBJECT

public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	if(IsValidVehicle(gPlayerEdit[playerid]))
	{
	    if(Vehicle_GetPropertyInt(gPlayerEdit[playerid], v_editor) == objectid)
	    {
	        SetVehiclePos(gPlayerEdit[playerid], fX, fY, fZ);
			SetVehicleZAngle(gPlayerEdit[playerid], fRotZ);

			if(HasOnPlayerEditVehicle) CallLocalFunction("OnPlayerEditVehicle", "iiiffff", playerid, gPlayerEdit[playerid], response, fX, fY, fZ, fRotZ);

	        switch(response)
	        {
	            case EDIT_RESPONSE_CANCEL, EDIT_RESPONSE_FINAL:
	            {
					DestroyObject(objectid);
					Vehicle_SetPropertyInt(gPlayerEdit[playerid], v_editor, INVALID_OBJECT_ID);

					SetVehicleVelocity(gPlayerEdit[playerid], 0.0, 0.0, 0.0);

					gPlayerEdit[playerid] = INVALID_VEHICLE_ID;
	            }
	        }
	    }
	}

	#if defined Vehicle_OnPlayerEditObject
        return Vehicle_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerEditObject
    forward Vehicle_OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ);
#endif
#if defined _ALS_OnPlayerEditObject
    #undef OnPlayerEditObject
#else
    #define _ALS_OnPlayerEditObject
#endif
#define OnPlayerEditObject Vehicle_OnPlayerEditObject

#else

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(IsValidVehicle(gPlayerEdit[playerid]))
	{
	    if(Vehicle_GetPropertyInt(gPlayerEdit[playerid], v_editor) == objectid)
	    {
	        SetVehiclePos(gPlayerEdit[playerid], x, y, z);
			SetVehicleZAngle(gPlayerEdit[playerid], rz);

			if(HasOnPlayerEditVehicle) CallLocalFunction("OnPlayerEditVehicle", "iiiffff", playerid, gPlayerEdit[playerid], response, x, y, z, rz);

	        switch(response)
	        {
	            case EDIT_RESPONSE_CANCEL, EDIT_RESPONSE_FINAL:
	            {
					DestroyDynamicObject(objectid);
					Vehicle_SetPropertyInt(gPlayerEdit[playerid], v_editor, INVALID_OBJECT_ID);

					SetVehicleVelocity(gPlayerEdit[playerid], 0.0, 0.0, 0.0);

					gPlayerEdit[playerid] = INVALID_VEHICLE_ID;
	            }
	        }
	    }
	}

	#if defined Veh_OnPlayerEditDynamicObject
        return Veh_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
    #else
        return 1;
    #endif
}
#if defined Veh_OnPlayerEditDynamicObject
    forward Veh_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz);
#endif
#if defined _ALS_OnPlayerEditDynamicObject
    #undef OnPlayerEditDynamicObject
#else
    #define _ALS_OnPlayerEditDynamicObject
#endif
#define OnPlayerEditDynamicObject Veh_OnPlayerEditDynamicObject

#endif

forward OnPlayerEditVehicle(playerid, vehicleid, response, Float:fX, Float:fY, Float:fZ, Float:fRotZ);

stock GetVehicleName(vehicleid, string[], len = sizeof(string))
{
	strcat(string, gVehicleInfo[GetVehicleModel(vehicleid) - 400][Name], len);
	return true;
}

stock GetVehicleModelName(modelid, string[], len = sizeof(string))
{
	strcat(string, gVehicleInfo[modelid - 400][Name], len);
	return true;
}

stock SetVehicleParams(vehicleid, type, set)
{
	new params[7];

    if(GetVehicleParamsEx(vehicleid, params[0], params[1], params[2], params[3], params[4], params[5], params[6]))
	{
		params[type] = set;
		SetVehicleParamsEx(vehicleid, params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
		return true;
	}
	return false;
}

stock GetVehicleParams(vehicleid, type)
{
	new params[7];
	GetVehicleParamsEx(vehicleid, params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
	return params[type];
}

stock SetVehicleSpeed(vehicleid, Float:speed, bool:kmh = true)
{
	new Float:vPos[4];
	GetVehicleVelocity(vehicleid,vPos[0],vPos[1],vPos[2]);
    GetVehicleZAngle(vehicleid, vPos[3]);
    speed = (kmh ? (speed / 136.666667) : (speed / 85.4166672));
    return SetVehicleVelocity(vehicleid, speed * floatsin(-vPos[3], degrees), speed * floatcos(-vPos[3], degrees), (vPos[2]-0.005));
}

stock Float:GetVehicleSpeed(vehicleid, bool:kmh = true, Float:velx = 0.0, Float:vely = 0.0, Float:velz = 0.0)
{
	if(	velx == 0.0 &&
		vely == 0.0 &&
		velz == 0.0)
 	{
		GetVehicleVelocity(vehicleid, velx, vely, velz);
	}
	return float(floatround((floatsqroot(((velx * velx) + (vely * vely)) + (velz * velz)) * (kmh ? (136.666667) : (85.4166672))), floatround_round));
}

/*
#if defined STREAMER_TYPE_OBJECT

	stock Veh_AttachDynamicObjectToVeh(objectid, vehicleid, Float:OffsetX, Float:OffsetY, Float:OffsetZ, Float:RotX, Float:RotY, Float:RotZ)
	{
		for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
	  		if(gVehicleAttachedObject[vehicleid][i] == INVALID_OBJECT_ID)
			{
			    if(AttachDynamicObjectToVehicle(objectid, vehicleid, OffsetX, OffsetY, OffsetZ, RotX, RotY, RotZ))
				{
					gVehicleAttachedObject[vehicleid][i] = objectid;
			    	return true;
			    }
			}
			else if(gVehicleAttachedObject[vehicleid][i] == objectid) return 1;
		}
		printf("WARNING: The object wasn't attached to the vehicle (id: %i), This may occur because the MAX_VEHICLE_ATTACHED_OBJECT limit was exceeded or the vehicle wasn't created. <vehicleplus.inc>", vehicleid);
		return false;
	}

	#if defined _ALS_AttachDynamicObjectToVeh
    #undef AttachDynamicObjectToVehicle
	#else
	    #define _ALS_AttachDynamicObjectToVeh
	#endif
	#define AttachDynamicObjectToVehicle Veh_AttachDynamicObjectToVeh

	stock IsObjectAttachedToVehicle(objectid, vehicleid)
	{
		for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
	  		if(IsValidDynamicObject(gVehicleAttachedObject[vehicleid][i]))
			{
			    if(gVehicleAttachedObject[vehicleid][i] == objectid) return true;
			}
		}
		return false;
	}

	stock GetVehicleSlotAttachedObject(vehicleid, slot)
	{
		if(! IsValidDynamicObject(gVehicleAttachedObject[vehicleid][slot])) return -1;

		return gVehicleAttachedObject[vehicleid][slot];

	}

	stock DestroyVehicleAttachedObject(vehicleid, objectid)
	{
		if(!IsValidDynamicObject(objectid)) return 0;
		for(new i = 0; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
			if(IsValidDynamicObject(gVehicleAttachedObject[vehicleid][i]) && (gVehicleAttachedObject[vehicleid][i] == objectid))
			{
				DestroyDynamicObject(objectid);
				gVehicleAttachedObject[vehicleid][i] = INVALID_OBJECT_ID;
				return 1;
			}
		}
		return 0;
	}

#else

	stock Vehicle_AttachObjectToVehicle(objectid, vehicleid, Float:OffsetX, Float:OffsetY, Float:OffsetZ, Float:RotX, Float:RotY, Float:RotZ)
	{
	    for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
	  		if(! IsValidObject(gVehicleAttachedObject[vehicleid][i]))
			{
			    if(AttachObjectToVehicle(objectid, vehicleid, OffsetX, OffsetY, OffsetZ, RotX, RotY, RotZ))
				{
					gVehicleAttachedObject[vehicleid][i] = objectid;
			    	return true;
			    }
			}
		}

		printf("WARNING: The object wasn't attached to the vehicle (id: %i), This may occur because the MAX_VEHICLE_ATTACHED_OBJECT limit was exceeded or the vehicle wasn't created. <vehicleplus.inc>", vehicleid);
		return false;
	}

	#if defined _ALS_AttachObjectToVehicle
	    #undef AttachObjectToVehicle
	#else
	    #define _ALS_AttachObjectToVehicle
	#endif
	#define AttachObjectToVehicle Vehicle_AttachObjectToVehicle

	stock IsObjectAttachedToVehicle(objectid, vehicleid)
	{
		for(new i; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
	  		if(IsValidObject(gVehicleAttachedObject[vehicleid][i]))
			{
			    if(gVehicleAttachedObject[vehicleid][i] == objectid) return true;
			}
		}
		return false;
	}

	stock GetVehicleSlotAttachedObject(vehicleid, slot)
	{
		if(! IsValidObject(gVehicleAttachedObject[vehicleid][slot])) return -1;

		return gVehicleAttachedObject[vehicleid][slot];

	}

	stock DestroyVehicleAttachedObject(vehicleid, objectid)
	{
		if(!IsValidObject(objectid)) return 0;
		for(new i = 0; i < MAX_VEHICLE_ATTACHED_OBJECTS; i++)
		{
			if(IsValidObject(gVehicleAttachedObject[vehicleid][i]) && (gVehicleAttachedObject[vehicleid][i] == objectid))
			{
				DestroyObject(objectid);
				gVehicleAttachedObject[vehicleid][i] = INVALID_OBJECT_ID;
				return 1;
			}
		}
		return 0;
	}

#endif
*/

stock TeleportVehicle(vehicleid, Float:x, Float:y, Float:z, Float:rotation, worldid = -1, interiorid = -1)
{
	#if defined _Y_ITERATE_LOCAL_VERSION
	foreach(new i : Player)
	{
	#else
	for(new i; i <= GetPlayerPoolSize(); i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	#endif
        if(GetPlayerVehicleID(i) == vehicleid)
        {
            if(worldid != -1) SetPlayerVirtualWorld(i, worldid);
            if(interiorid != -1) SetPlayerInterior(i, interiorid);
        }
	}
 	if(worldid != -1) SetVehicleVirtualWorld(vehicleid, worldid);
	if(interiorid != -1) SetVehicleInterior(vehicleid, interiorid);

	SetVehiclePos(vehicleid, x, y, z);
	SetVehicleZAngle(vehicleid, rotation);
	return true;
}

stock SetVehicleSpeedCap(vehicleid, Float:maxspeed, bool:kmh = true)
{
	gVehicleSpeedCap[vehicleid] = floatround((kmh ? maxspeed : (maxspeed * 1.5999)));
	return 1;
}

stock Float:GetVehicleSpeedCap(vehicleid, bool:kmh = true)
{
	return (kmh ? float(gVehicleSpeedCap[vehicleid]) : (float(gVehicleSpeedCap[vehicleid]) * 0.6250));
}

stock DisableVehicleSpeedCap(vehicleid)
{
	return SetVehicleSpeedCap(vehicleid, 0);
}

public OnPlayerUpdate(playerid)
{
 	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid;
		vehicleid = GetPlayerVehicleID(playerid);

		new Float:speedcap;
		speedcap = GetVehicleSpeedCap(vehicleid);

		new Float:vel[3];
		GetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);

		new Float:speed;
		speed = GetVehicleSpeed(vehicleid, true, vel[0], vel[1], vel[2]);

		if(speedcap != 0.0)
		{
			if(speed > speedcap)
			{
			    if(!HasOnPlayerReachSpeedCapLimit || CallLocalFunction("OnPlayerReachSpeedCapLimit", "iif", playerid, vehicleid, speed))
			    {
					vel[0] = (vel[0] / speed) * speedcap;
					vel[1] = (vel[1] / speed) * speedcap;
					vel[2] = (vel[2] / speed) * speedcap;

					SetVehicleVelocity(vehicleid, vel[0], vel[1], vel[2]);
				}
			}
		}
	}

	#if defined Vehicle_OnPlayerUpdate
        return Vehicle_OnPlayerUpdate(playerid);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerUpdate
    forward Vehicle_OnPlayerUpdate(playerid);
#endif
#if defined _ALS_OnPlayerUpdate
    #undef OnPlayerUpdate
#else
    #define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate Vehicle_OnPlayerUpdate

public OnPlayerDisconnect(playerid,reason)
{
 	if(GetPVarType(playerid,"p_driving_vid") > 0)
    {
        new vehid = GetPVarInt(playerid,"p_driving_vid");
        DeletePVar(playerid,"p_driving_vid");
        if(gVehicleDriver[vehid] == playerid)
        {
            gVehicleDriver[vehid] = INVALID_PLAYER_ID;
        }
    }
	#if defined Vehicle_OnPlayerDisconnect
        return Vehicle_OnPlayerDisconnect(playerid,reason);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerDisconnect
    forward Vehicle_OnPlayerDisconnect(playerid,reason);
#endif
#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect Vehicle_OnPlayerDisconnect

forward OnPlayerReachSpeedCapLimit(playerid, vehicleid, Float:speed);

stock GetVehicleModelTopSpeed(modelid, bool:kmh = true)
{

	return (kmh ? gVehicleInfo[(modelid - 400)][TopSpeed] : floatround(float(gVehicleInfo[modelid - 400][TopSpeed]) * 0.6250));
}

stock GetVehicleTopSpeed(vehicleid, bool:kmh = true)
{
	return GetVehicleModelTopSpeed(GetVehicleModel(vehicleid),kmh);
}

stock SetVehicleSpawnInfo(vehicleid, Float:x, Float:y, Float:z, Float:rotation, worldid, interiorid)
{
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<0>, x);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<1>, y);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<2>, z);
	Vehicle_SetPropertyFloat(vehicleid, v_spawn<3>, rotation);

	Vehicle_SetPropertyInt(vehicleid, v_spawn_worldid, worldid);
	Vehicle_SetPropertyInt(vehicleid, v_spawn_interiorid, interiorid);
	return true;
}

stock GetVehicleSpawnInfo(vehicleid, &Float:x, &Float:y, &Float:z, &Float:rotation, &worldid, &interiorid)
{
	x = Vehicle_GetPropertyFloat(vehicleid, v_spawn<0>);
	y = Vehicle_GetPropertyFloat(vehicleid, v_spawn<1>);
	z = Vehicle_GetPropertyFloat(vehicleid, v_spawn<2>);
	rotation = Vehicle_GetPropertyFloat(vehicleid, v_spawn<3>);

	worldid = Vehicle_GetPropertyInt(vehicleid, v_spawn_worldid);
	interiorid = Vehicle_GetPropertyInt(vehicleid, v_spawn_interiorid);
	return true;
}

stock ToggleUnoccupiedVehicleDamage(vehicleid, bool:toggle)
{
	return Vehicle_SetPropertyInt(vehicleid, v_spawn_uno_damage, _:toggle);
}

stock IsUnoccupiedDamageToggled(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_spawn_uno_damage);
}

stock ToggleVehiclePetrolCapDestroy(vehicleid, bool:toggle)
{
	return Vehicle_SetPropertyInt(vehicleid, v_petrolcap, _:toggle);
}

stock IsPetrolCapDestroyToggled(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_petrolcap);
}

stock SetVehicleBomb(vehicleid, time = 1000)
{
	if(IsVehicleBombed(vehicleid))
	{
	    SetVehicleParams(vehicleid, VEHICLE_PARAMS_ALARM, VEHICLE_PARAMS_OFF);
		if(Vehicle_GetPropertyInt(vehicleid, v_bomb_timer) != -1)
		{
		    KillTimer(Vehicle_GetPropertyInt(vehicleid, v_bomb_timer));
		    Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, -1);
		}
	}
	return Vehicle_SetPropertyInt(vehicleid, v_bomb, time);
}

stock GetVehicleBomb(vehicleid)
{
	return Vehicle_GetPropertyInt(vehicleid, v_bomb);
}

stock RemoveVehicleBomb(vehicleid)
{
	return SetVehicleBomb(vehicleid, 0);
}

stock IsVehicleBombed(vehicleid)
{
	if(GetVehicleBomb(vehicleid)) return true;
	return false;
}

stock IsVehicleBombActivated(vehicleid)
{
    if(IsVehicleBombed(vehicleid))
    {
        if(Vehicle_GetPropertyInt(vehicleid, v_bomb_timer) != -1)
        {
            return true;
        }
    }
    return false;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		if(IsVehicleBombed(vehicleid))
		{
		    if(! IsVehicleBombActivated(vehicleid))
		    {
		        if(!HasOnVehicleBombActivate || CallLocalFunction("OnVehicleBombActivate", "i", vehicleid))
		        {
		            new interval = (GetVehicleBomb(vehicleid) - 1750);
		            if(interval < 1750)
		            {
    					SetVehicleParams(vehicleid, VEHICLE_PARAMS_ALARM, VEHICLE_PARAMS_ON);
		            	Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, SetTimerEx("Vehicle_OnVehicleBombExplode", GetVehicleBomb(vehicleid), false, "ii", playerid, vehicleid));
					}
		            else
		            {
		        		Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, SetTimerEx("Vehicle_OnVehicleBombActivate", interval, false, "ii", playerid, vehicleid));
					}
				}
		    }
		}

		if(IsVehicleSticky(vehicleid))
		{
		    SetVehicleParams(vehicleid, VEHICLE_PARAMS_ENGINE, VEHICLE_PARAMS_OFF);
		}

        SetPVarInt(playerid,"p_driving_vid",vehicleid);
        gVehicleDriver[vehicleid] = playerid;
	}
    else
    {
        if(oldstate == PLAYER_STATE_DRIVER)
        {
        	if(GetPVarType(playerid,"p_driving_vid") > 0)
            {
                new vehicleid = GetPVarInt(playerid,"p_driving_vid");
                DeletePVar(playerid,"p_driving_vid");
                if(gVehicleDriver[vehicleid] == playerid)
                {
                	gVehicleDriver[vehicleid] = INVALID_PLAYER_ID;
                    if(HasOnPlayerStealVehicle)
                    {
                    	new stealer = Veh_GetDriver(vehicleid);
                    	if(stealer != INVALID_VEHICLE_ID) CallLocalFunction("OnPlayerStealVehicle","ddd",stealer,playerid,vehicleid);
                    }
                }
            }
        }
    }

	if(oldstate == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		if(IsVehicleSticky(vehicleid))
		{
		    SetVehicleParams(vehicleid, VEHICLE_PARAMS_ENGINE, VEHICLE_PARAMS_ON);
		}
	}

	#if defined Vehicle_OnPlayerStateChange
        return Vehicle_OnPlayerStateChange(playerid, newstate, oldstate);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnPlayerStateChange
    forward Vehicle_OnPlayerStateChange(playerid, newstate, oldstate);
#endif
#if defined _ALS_OnPlayerStateChange
    #undef OnPlayerStateChange
#else
    #define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange Vehicle_OnPlayerStateChange

forward OnVehicleBombActivate(vehicleid);

forward Vehicle_OnVehicleBombActivate(playerid, vehicleid);
public Vehicle_OnVehicleBombActivate(playerid, vehicleid)
{
    SetVehicleParams(vehicleid, VEHICLE_PARAMS_ALARM, VEHICLE_PARAMS_ON);
    Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, SetTimerEx("Vehicle_OnVehicleBombExplode", 1750, false, "ii", playerid, vehicleid));
	return 1;
}

forward Vehicle_OnVehicleBombExplode(playerid, vehicleid);
public Vehicle_OnVehicleBombExplode(playerid, vehicleid)
{
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	{
	    if(!HasOnVehicleBombDeactivate || !CallLocalFunction("OnVehicleBombDeactivate", "i", vehicleid))
		{
    		return SetVehicleParams(vehicleid, VEHICLE_PARAMS_ALARM, VEHICLE_PARAMS_OFF);
		}
	}
	
	if(HasOnVehicleBombExplode) CallLocalFunction("OnVehicleBombExplode", "i", vehicleid);

	SetVehicleParams(vehicleid, VEHICLE_PARAMS_ALARM, VEHICLE_PARAMS_OFF);

	new Float:pos[3];
    GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
   	CreateExplosion(pos[0], pos[1], pos[2], 3, 30.0);
   	SetVehicleToRespawn(vehicleid);

   	if(GetPlayerVehicleID(playerid) == vehicleid)
   	{
   		SetPlayerHealth(playerid, 0.0);
   		GameTextForPlayer(playerid, "~r~Bombed !", 3500, 3);
   	}

    Vehicle_SetPropertyInt(vehicleid, v_bomb_timer, -1);
	return 1;
}

forward OnVehicleBombDeactivate(vehicleid);
forward OnVehicleBombExplode(vehicleid);

stock ToggleVehicleSticky(vehicleid, bool:toggle)
{
	gVehicleIsSticky[vehicleid] = toggle;
    return 1;
}

stock IsVehicleSticky(vehicleid)
{
	return (gVehicleIsSticky[vehicleid]);
}

/*public OnVehicleStreamIn(vehicleid, forplayerid)
{
	if(Vehicle_GetPropertyInt(vehicleid, v_update_timer) == -1)
	{
		Vehicle_SetPropertyInt(vehicleid, v_update_timer, SetTimerEx("OnVehicleTimeUpdate", VEHICLE_UPDATE_INTERVAL, true, "i", vehicleid));
	}

	#if defined Vehicle_OnVehicleStreamIn
        return Vehicle_OnVehicleStreamIn(vehicleid, forplayerid);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnVehicleStreamIn
    forward Vehicle_OnVehicleStreamIn(vehicleid, forplayerid);
#endif
#if defined _ALS_OnVehicleStreamIn
    #undef OnVehicleStreamIn
#else
    #define _ALS_OnVehicleStreamIn
#endif
#define OnVehicleStreamIn Vehicle_OnVehicleStreamIn

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	if(Vehicle_GetPropertyInt(vehicleid, v_update_timer) != -1)
	{
	    for(new i,j = GetPlayerPoolSize(); i <= j; i++)
	    {
	        if(IsPlayerStreamedIn(vehicleid, i)) break;

			if(i == j)
			{
				KillTimer(Vehicle_GetPropertyInt(vehicleid, v_update_timer));
				Vehicle_SetPropertyInt(vehicleid, v_update_timer, -1);
			}
		}
	}

	#if defined Vehicle_OnVehicleStreamOut
        return Vehicle_OnVehicleStreamOut(vehicleid, forplayerid);
    #else
        return 1;
    #endif
}
#if defined Vehicle_OnVehicleStreamOut
    forward Vehicle_OnVehicleStreamOut(vehicleid, forplayerid);
#endif
#if defined _ALS_OnVehicleStreamOut
    #undef OnVehicleStreamOut
#else
    #define _ALS_OnVehicleStreamOut
#endif
#define OnVehicleStreamOut Vehicle_OnVehicleStreamOut*/

#if defined _INC_y_timers
timer Vehicle_UpdateTimer[VEHICLE_UPDATE_INTERVAL]()
#else
public Vehicle_UpdateTimer()
#endif
{
	new Float:FloatData[4];
	#if defined _Y_ITERATE_LOCAL_VERSION
	foreach(new vehicleid : Vehicle)
	{
	#else
	for(new vehicleid = 1, size = GetVehiclePoolSize(); vehicleid < size; vehicleid++)
	{
		if(GetVehicleModel(vehicleid) == 0) continue;
	#endif
		if(IsVehicleSticky(vehicleid))
		{
			GetVehiclePos(vehicleid, FloatData[0], FloatData[1], FloatData[2]);
			GetVehicleZAngle(vehicleid, FloatData[3]);
		 	if(	(FloatData[0] > gVehicleFloat[vehicleid][0] + 0.5 || FloatData[0] < gVehicleFloat[vehicleid][0] - 0.5) ||
				(FloatData[1] > gVehicleFloat[vehicleid][1] + 0.5 || FloatData[1] < gVehicleFloat[vehicleid][1] - 0.5) ||
				(FloatData[2] > gVehicleFloat[vehicleid][2] + 0.5 || FloatData[2] < gVehicleFloat[vehicleid][2] - 0.5) ||
				(FloatData[3] > gVehicleFloat[vehicleid][3] + 0.5 || FloatData[3] < gVehicleFloat[vehicleid][3] - 0.5))
			{
				TeleportVehicle(vehicleid, gVehicleFloat[vehicleid][0], gVehicleFloat[vehicleid][1], gVehicleFloat[vehicleid][2], gVehicleFloat[vehicleid][3], GetVehicleInterior(vehicleid), GetVehicleVirtualWorld(vehicleid));
	 	 	}
	    }

	    if(HasOnTrailerAttach || HasOnTrailerDetach)
	    {
	    	new trailer = GetVehicleTrailer(vehicleid);
	    	if(gVehicleTrailer[vehicleid] != trailer)
	    	{
	    		if(trailer != 0 && HasOnTrailerAttach)
	    		{
	    			CallLocalFunction("OnTrailerAttach","dd",trailer,vehicleid);
	    		}
	    		else if(trailer == 0 && HasOnTrailerDetach)
	    		{
	    			CallLocalFunction("OnTrailerDetach","dd",trailer,vehicleid);
	    		}
	    		gVehicleTrailer[vehicleid] = trailer;
	    	}
	    }

		if(HasOnVehiclePosChange && !IsVehicleSticky(vehicleid))
		{
			GetVehiclePos(vehicleid, FloatData[0], FloatData[1], FloatData[2]);
			GetVehicleZAngle(vehicleid, FloatData[3]);
			if(	FloatData[0] != gVehicleFloat[vehicleid][0] ||
			    FloatData[1] != gVehicleFloat[vehicleid][1] ||
			    FloatData[2] != gVehicleFloat[vehicleid][2] ||
			    FloatData[3] != gVehicleFloat[vehicleid][3])
		 	{
		 	    if(CallLocalFunction("OnVehiclePosChange", "iffffffff", vehicleid, FloatData[0], FloatData[1], FloatData[2], FloatData[3], gVehicleFloat[vehicleid][0], gVehicleFloat[vehicleid][1], gVehicleFloat[vehicleid][2], gVehicleFloat[vehicleid][3]))
		 	    {
		 	        gVehicleFloat[vehicleid][0] = FloatData[0];
				    gVehicleFloat[vehicleid][1] = FloatData[1];
				    gVehicleFloat[vehicleid][2] = FloatData[2];
				   	gVehicleFloat[vehicleid][3] = FloatData[3];
		 	    }
		 	    else
		 	    {
		 	        TeleportVehicle(vehicleid, gVehicleFloat[vehicleid][0], gVehicleFloat[vehicleid][1], gVehicleFloat[vehicleid][2], gVehicleFloat[vehicleid][3], GetVehicleInterior(vehicleid), GetVehicleVirtualWorld(vehicleid));
		 	    }
			}
	 	}

		if(HasOnVehicleVelocityChange && !IsVehicleSticky(vehicleid))
	 	{
	 		GetVehicleVelocity(vehicleid, FloatData[0], FloatData[1], FloatData[2]);
		 	if(	FloatData[0] != gVehicleFloat[vehicleid][4] ||
			    FloatData[1] != gVehicleFloat[vehicleid][5] ||
			    FloatData[2] != gVehicleFloat[vehicleid][6])
	 		{
		 	    if(CallLocalFunction("OnVehicleVelocityChange", "iffffff", vehicleid, FloatData[0], FloatData[1], FloatData[2], gVehicleFloat[vehicleid][4], gVehicleFloat[vehicleid][5], gVehicleFloat[vehicleid][6]))
		 	    {
			 	    gVehicleFloat[vehicleid][4] = FloatData[0];
					gVehicleFloat[vehicleid][5] = FloatData[1];
					gVehicleFloat[vehicleid][6] = FloatData[2];
		 	    }
		 	    else
		 	    {
		 	        SetVehicleVelocity(vehicleid, gVehicleFloat[vehicleid][4], gVehicleFloat[vehicleid][5], gVehicleFloat[vehicleid][6]);
		 	    }
			}
		}

		GetVehicleHealth(vehicleid, FloatData[0]);
 		if(gVehicleFloat[vehicleid][8] != -1.0)
		{
			SetVehicleHealth(vehicleid,gVehicleFloat[vehicleid][8]);
			gVehicleFloat[vehicleid][7] = gVehicleFloat[vehicleid][8];
			gVehicleFloat[vehicleid][8] = -1.0;
		}
	 	else if(HasOnVehicleHealthChange && (FloatData[0] != gVehicleFloat[vehicleid][7]))
	 	{
	 	    if(CallLocalFunction("OnVehicleHealthChange", "iff", vehicleid, FloatData[0], gVehicleFloat[vehicleid][7]))
	 	    {
				gVehicleFloat[vehicleid][7] = FloatData[0];
	 	    }
	 	    else
	 	    {
				SetVehicleHealth(vehicleid, gVehicleFloat[vehicleid][7]);
	 	    }
	 	}

		if(HasOnVehicleUpdate) CallLocalFunction("OnVehicleUpdate", "i", vehicleid);
	}
	return 1;
}

stock Vehicle_SetVehicleHealth(vehicleid, Float:health)
{
    if(SetVehicleHealth(vehicleid, health))
	{
		gVehicleFloat[vehicleid][7] = health;
		gVehicleFloat[vehicleid][8] = health;
		return 1;
	}
	return 0;
}
#if defined _ALS_SetVehicleHealth
    #undef SetVehicleHealth
#else
    #define _ALS_SetVehicleHealth
#endif
#define SetVehicleHealth Vehicle_SetVehicleHealth

stock Vehicle_RepairVehicle(vehicleid)
{
    if(RepairVehicle(vehicleid))
	{
		gVehicleFloat[vehicleid][7] = gVehicleFloat[vehicleid][9];
		gVehicleFloat[vehicleid][8] = gVehicleFloat[vehicleid][9];
		gVehicleDamageValue[vehicleid][0] = 0;
		gVehicleDamageValue[vehicleid][1] = 0;
		gVehicleDamageValue[vehicleid][2] = 0;
		gVehicleDamageValue[vehicleid][3] = 0;
		return 1;
	}
	return 0;
}
#if defined _ALS_RepairVehicle
    #undef RepairVehicle
#else
    #define _ALS_RepairVehicle
#endif
#define RepairVehicle Vehicle_RepairVehicle

stock Vehicle_UpdateDamageStatus(vehicleid, panels, doors, lights, tires)
{
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_PANELS] = panels;
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_DOORS] = doors;
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_LIGHTS] = lights;
	gVehicleDamageValue[vehicleid][VEHICLE_DAMAGE_TIRES] = tires;
	return UpdateVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
}
#if defined _ALS_UpdateVehicleDamageStatus
    #undef UpdateVehicleDamageStatus
#else
    #define _ALS_UpdateVehicleDamageStatus
#endif
#define UpdateVehicleDamageStatus Vehicle_UpdateDamageStatus

stock SetVehicleMaxHealth(vehicleid, Float:health)
{
	gVehicleFloat[vehicleid][9] = health;
	return 1;
}
stock Float:GetVehicleMaxHealth(vehicleid)
{
	return gVehicleFloat[vehicleid][9];
}

stock CountAllVehicles()
{
	#if defined _Y_ITERATE_LOCAL_VERSION
	return Iter_Count(Vehicles);
	#else
	new count = 0;
	for(new i; i <= GetVehiclePoolSize(); i++)
	{
		if(!IsValidVehicle(i)) continue;
		count++;
	}
	return count;
	#endif
}

stock DestroyAllVehicles()
{
	new count = 0;
	for(new i; i <= GetVehiclePoolSize(); i++)
	{
		if(!IsValidVehicle(i)) continue;
		DestroyVehicle(i);
		count++;
	}
	return count;
}
