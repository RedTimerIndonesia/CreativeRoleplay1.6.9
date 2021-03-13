/*
1. login register /
2. admin system   /
3. banned system /
4. door system /
5. bisnis /
6. house /
7. faction
8. family
9. weapon system /
10. anti cheat /
11. toys/object /
12. private vehicle /
13. All Jobs
14. VIP system
*/

#include <a_samp>
#undef MAX_PLAYERS
#define MAX_PLAYERS	500
//#include <nex-ac>
#include <crashdetect.inc> 
//#include <audio.inc>
//#include <fixes.inc>
#include <gvar.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
//#include <mapfix.inc>
#include <CTime.inc>
#include <gvar.inc>
//#include <easyDialog.inc>
#include <progress2.inc>
//#include <izcmd.inc>
#include <Pawn.CMD.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg.inc>
#include <streamer.inc>
#include <EVF2.inc>
#include <YSI\y_timers>
#include <sscanf2.inc>
//#include <cuff.inc>
#include <yom_buttons.inc>
//#include <PreviewModelDialog2.inc>
#include <geoiplite.inc>
#include <garageblock.inc>
#include <timerfix.inc>
//#include <keypadtxd.inc>
//#include <SIF/button.inc>
//#include <SIF/door.inc>

//-----[ Modular ]-----
#include "DEFINE.pwn"


//----------[ New Variable ]-----
enum
{
	//---[ DIALOG PUBLIC ]---
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	//-----------------------
	DIALOG_GOLDSHOP,
	DIALOG_GOLDNAME,
	//---[ DIALOG BISNIS ]---
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	//---[ DIALOG HOUSE ]---
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_WITHDRAWMONEY,
	HOUSE_DEPOSITMONEY,
	//---[ DIALOG PRIVATE VEHICLE ]---
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	//---[ DIALOG TOYS ]---
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	//---[ DIALOG PLAYER ]---
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_GPS_JOB,
	DIALOG_PAY,
	//---[ DIALOG WEAPONS ]---
	DIALOG_EDITBONE,
	//---[ DIALOG FAMILY ]---
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	//---[ DIALOG FACTION ]---
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	
	DIALOG_LOCKERVIP,
	//---[ DIALOG JOB ]---
	//MECH
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	//Trucker
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	
	//ARMS Dealer
	DIALOG_ARMS_GUN,
	
	//Farmer job
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	//----[ Items ]-----
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	//Bank
	DIALOG_ATM,
	DIALOG_ATMWITHDRAW,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	
	//reports
	DIALOG_REPORTS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	
	//Sidejob
	DIALOG_SWEEPER,
	DIALOG_BUS
}

// Countdown
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];
new CountText[5][5] =
{
	"~r~1",
	"~g~2",
	"~y~3",
	"~g~4",
	"~b~5"
};

// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

//Model Selection 
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID;
	
// Faction Vehicle
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[30],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];

// Faction Vehicle
IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}

//Showroom Checkpoint
new ShowRoomCP,
	ShowRoomCPRent;

// Showroom Vehicles
//new SRV[35],
//	VSRV[20];
	
/*// Button and Doors
new SAGSLobbyBtn[2],
	SAGSLobbyDoor;
new gMyButtons[2],
	gMyDoor;*/
	
/*//Keypad Txd
new SAGSLobbyKey[2],
	SAGSLobbyDoor;
*/

// Yom Button
new SAGSLobbyBtn[2],
	SAGSLobbyDoor,
	SAPDLobbyBtn[4],
	SAPDLobbyDoor[4],
	LLFLobbyBtn[2],
	LLFLobbyDoor;

// MySQL connection handle
new MySQL: g_SQL;

new TogOOC = 1;

// Player data
enum E_PLAYERS
{
	pID,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pIP[16],
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pBankMoney,
	pBankRek,
	pPhone,
	pPhoneCredit,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pGender,
	pAge[50],
	pInDoor,
	pInHouse,
	pInBiz,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
	pHunger,
	pBladder,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pBladderTime,
	pSick,
	pSickTime,
	pHospital,
	pHospitalTime,
	pInjured,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pGPS,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	pPrice4,
	pMarijuana,
	pPlant,
	pPlantTime,
	pFishTool,
	pWorm,
	pFish,
	pInFish,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pBoatLic,
	pBoatLicTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogLog,
	pTogAds,
	pTogWT,
	Text3D:pAdoTag,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pSeatBelt,
	pReportTime,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
	PlayerBar:bladdybar,
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:spbladdybar,
	PlayerBar:activitybar,
	pProducting,
	pCooking,
	pArmsDealer,
	pMechanic,
	pActivity,
	pActivityTime,
	//Jobs
	pSideJob,
	pSideJobTime,
	pGetJob,
	pGetJob2,
	pTaxiDuty,
	pTaxiTime,
	pFare,
	pFareTimer,
	pTotalFare,
	Float:pFareOldX,
	Float:pFareOldY,
	Float:pFareOldZ,
	Float:pFareNewX,
	Float:pFareNewY,
	Float:pFareNewZ,
	pMechDuty,
	pMechVeh,
	pMechColor1,
	pMechColor2,
	//ATM
	EditingATMID,
	//lumber job
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Miner job
	EditingOreID,
	MiningOreID,
	CarryingLog,
	LoadingPoint,
	//production
	CarryProduct,
	//trucker
	pMission,
	pHauling,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillTime,
	pFillPrice,
	//Gate
	gEditID,
	gEdit
	
};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];


//----------[ Lumber Object Vehicle Job ]------------
#define MAX_LUMBERS 50
#define LUMBER_LIFETIME 100
#define LUMBER_LIMIT 10

enum    E_LUMBER
{
	// temp
	lumberDroppedBy[MAX_PLAYER_NAME],
	lumberSeconds,
	lumberObjID,
	lumberTimer,
	Text3D: lumberLabel
}
new LumberData[MAX_LUMBERS][E_LUMBER],
	Iterator:Lumbers<MAX_LUMBERS>;

new
	LumberObjects[MAX_VEHICLES][LUMBER_LIMIT];
	
new
	Float: LumberAttachOffsets[LUMBER_LIMIT][4] = {
	    {-0.223, -1.089, -0.230, -90.399},
		{-0.056, -1.091, -0.230, 90.399},
		{0.116, -1.092, -0.230, -90.399},
		{0.293, -1.088, -0.230, 90.399},
		{-0.123, -1.089, -0.099, -90.399},
		{0.043, -1.090, -0.099, 90.399},
		{0.216, -1.092, -0.099, -90.399},
		{-0.033, -1.090, 0.029, -90.399},
		{0.153, -1.089, 0.029, 90.399},
		{0.066, -1.091, 0.150, -90.399}
	};

//---------[ Ores miner Job Log ]-------	
#define LOG_LIFETIME 100
#define LOG_LIMIT 10
#define MAX_LOG 100

enum    E_LOG
{
	// temp
	bool:logExist,
	logType,
	logDroppedBy[MAX_PLAYER_NAME],
	logSeconds,
	logObjID,
	logTimer,
	Text3D:logLabel
}
new LogData[MAX_LOG][E_LOG];

new
	LogStorage[MAX_VEHICLES][2];
	
//------[ Trucker ]--------

new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];
//-----[ Modular ]-----
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
}
#include "COLOR.pwn"
#include "TEXTDRAW.pwn"
#include "ANIMS.pwn"
#include "PRIVATE_VEHICLE.pwn"
#include "REPORT.pwn"
#include "WEAPON_ATTH.pwn"
#include "TOYS.pwn"
#include "HELMET.pwn"
#include "SERVER.pwn"
#include "DOOR.pwn"
#include "FAMILY.pwn"
#include "HOUSE.pwn"
#include "BISNIS.pwn"
#include "GAS_STATION.pwn"
#include "DYNAMIC_LOCKER.pwn"
#include "NATIVE.pwn"
#include "JOB\JOB_SWEEPER.pwn"
#include "JOB\JOB_BUS.pwn"
#include "VOUCHER.pwn"
#include "SALARY.pwn"
#include "ATM.pwn"
#include "ARMS_DEALER.pwn"
#include "GATE.pwn"
//#include "AUDIO.pwn"
#include "JOB\JOB_TAXI.pwn"
#include "JOB\JOB_MECH.pwn"
#include "JOB\JOB_LUMBER.pwn"
#include "JOB\JOB_MINER.pwn"
#include "JOB\JOB_PRODUCTION.pwn"
#include "JOB\JOB_TRUCKER.pwn"
#include "JOB\JOB_FISH.pwn"
#include "JOB\JOB_FARMER.pwn"

#include "CMD\ADMIN.pwn"
#include "CMD\FACTION.pwn"
#include "CMD\PLAYER.pwn"

#include "SAPD_TASER.pwn"
#include "SAPD_SPIKE.pwn"

#include "DIALOG.pwn"

#include "CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "CMD\ALIAS\ALIAS_HOUSE.pwn"
#include "CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"

#include "FUNCTION.pwn"

public OnGameModeInit()
{
	//mysql_log(ALL);
	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	
	CreateTextDraw();
	CreateServerPoint();
	CreateJoinLumberPoint();
	CreateJoinTaxiPoint();
	CreateJoinMechPoint();
	CreateJoinMinerPoint();
	CreateJoinProductionPoint();
	CreateJoinTruckPoint();
	CreateArmsPoint();
	CreateJoinFarmerPoint();
	LoadTazerSAPD();
	//SetupPlayerTable();
	
	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname San Andreas");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(15.0);
	SetNameTagDrawDistance(20.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	
	
	new strings[128];
	CreateDynamicPickup(1239, 23, 1392.77, -22.25, 1000.97, -1);
	format(strings, sizeof(strings), "[City Hall]\n{FFFFFF}/newidcard - create new ID Card\n/newage - Change Birthday\n/sellhouse - sell your house\n/sellbisnis - sell your bisnis");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1392.77, -22.25, 1000.97, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // ID Card
	
	CreateDynamicPickup(1239, 23, 1395.82, -20.65, 1000.97, -1);
	format(strings, sizeof(strings), "[Veh Insurance]\n{FFFFFF}/buyinsu - buy insurance\n/claimpv - claim insurance\n/sellpv - sell vehicle");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1395.82, -20.65, 1000.97, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, 252.22, 117.43, 1003.21, -1);
	format(strings, sizeof(strings), "[License]\n{FFFFFF}/newdrivelic - create new license");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 252.22, 117.43, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Driving Lic
	
	CreateDynamicPickup(1239, 23, 240.80, 112.95, 1003.21, -1);
	format(strings, sizeof(strings), "[Plate]\n{FFFFFF}/buyplate - create new plate");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 240.80, 112.95, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Plate
	
	CreateDynamicPickup(1239, 23, 246.45, 118.53, 1003.21, -1);
	format(strings, sizeof(strings), "[Ticket]\n{FFFFFF}/payticket - to pay ticket");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 246.45, 118.53, 1003.21, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Ticket
	
	CreateDynamicPickup(1239, 23, 224.11, 118.50, 999.10, -1);
	format(strings, sizeof(strings), "[ARREST POINT]\n{FFFFFF}/arrest - arrest wanted player");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 224.11, 118.50, 999.10, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1142.38, -1330.74, 13.62, -1);
	format(strings, sizeof(strings), "[Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_PINK, 1142.38, -1330.74, 13.62, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	CreateDynamicPickup(1239, 23, 2246.46, -1757.03, 1014.77, -1);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/newrek - create new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2246.46, -1757.03, 1014.77, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 2246.55, -1750.25, 1014.77, -1);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/bank - access rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2246.55, -1750.25, 1014.77, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 2461.21, 2270.42, 91.67, -1);
	format(strings, sizeof(strings), "[IKLAN]\n{FFFFFF}/ads - public ads");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 2461.21, 2270.42, 91.67, 3.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan
	
	//Dynamic CP
	ShowRoomCP = CreateDynamicCP(1750.25, -1766.13, 13.54, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Buy Vehicle", COLOR_GREEN, 1750.25, -1766.13, 13.54, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	ShowRoomCPRent = CreateDynamicCP(1750.16, -1761.53, 13.54, 1.0, -1, -1, -1, 5.0);
	CreateDynamic3DTextLabel("Rental Vehicle\n"YELLOW_E"/unrentpv", COLOR_LBLUE, 1750.16, -1761.53, 13.54, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, -1);
	
	SAGSLobbyBtn[0] = CreateButton(1388.987670, -25.291969, 1001.358520, 180.000000);
	SAGSLobbyBtn[1] = CreateButton(1391.275756, -25.481920, 1001.358520, 0.000000);
	SAGSLobbyDoor = CreateDynamicObject(1569, 1389.375000, -25.387500, 999.978210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	
	SAPDLobbyBtn[0] = CreateButton(252.95264, 107.67332, 1004.00909, 264.79898);
	SAPDLobbyBtn[1] = CreateButton(253.43437, 110.62970, 1003.92737, 91.00000);
	SAPDLobbyDoor[0] = CreateDynamicObject(1569, 253.10965, 107.61060, 1002.21368,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[1] = CreateDynamicObject(1569, 253.12556, 110.49657, 1002.21460,   0.00000, 0.00000, -91.00000);

	SAPDLobbyBtn[2] = CreateButton(239.82739, 116.12640, 1004.00238, 91.00000);
	SAPDLobbyBtn[3] = CreateButton(238.75888, 116.12949, 1003.94086, 185.00000);
	SAPDLobbyDoor[2] = CreateDynamicObject(1569, 239.69435, 116.15908, 1002.21411,   0.00000, 0.00000, 91.00000);
	SAPDLobbyDoor[3] = CreateDynamicObject(1569, 239.64050, 119.08750, 1002.21332,   0.00000, 0.00000, 270.00000);
	
	//Family Button
	LLFLobbyBtn[0] = CreateButton(-2119.90039, 655.96808, 1062.39954, 184.67528);
	LLFLobbyBtn[1] = CreateButton(-2119.18481, 657.88519, 1062.39954, 90.00000);
	LLFLobbyDoor = CreateDynamicObject(1569, -2119.21509, 657.54187, 1060.73560,   0.00000, 0.00000, -90.00000);
	
	//Sidejob Vehicle
	AddSweeperVehicle();
	AddBusVehicle();
	
	/*new vehtext[128];
	SRV[0] = AddStaticVehicleEx(481, 1782.8107, -1789.0009, 13.4394, 270.4302, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[0]), FormatMoney(GetVehicleCost(481)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[0], 0);
	
	SRV[1] = AddStaticVehicleEx(509, 1783.0245, -1791.1428, 13.3071, 273.1105, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[1]), FormatMoney(GetVehicleCost(509)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[1], 0);
	
	SRV[2] = AddStaticVehicleEx(510, 1783.1400, -1793.4265, 13.4333, 270.4050, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[2]), FormatMoney(GetVehicleCost(510)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[2], 0);
	
	SRV[3] = AddStaticVehicleEx(463, 1771.0209, -1787.5016, 13.3307, 270.3632, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[3]), FormatMoney(GetVehicleCost(463)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[3], 0);
	
	SRV[4] = AddStaticVehicleEx(521, 1779.4094, -1797.8444, 13.3432, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[4]), FormatMoney(GetVehicleCost(521)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[4], 0);
	
	SRV[5] = AddStaticVehicleEx(461, 1776.8307, -1797.8292, 13.3249, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[5]), FormatMoney(GetVehicleCost(461)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[5], 0);
	
	SRV[6] = AddStaticVehicleEx(581, 1774.1938, -1797.7860, 13.3410, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[6]), FormatMoney(GetVehicleCost(581)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[6], 0);
	
	SRV[7] = AddStaticVehicleEx(468, 1770.8420, -1795.0306, 13.4695, 268.9327, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[7]), FormatMoney(GetVehicleCost(468)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[7], 0);
	
	SRV[8] = AddStaticVehicleEx(586, 1771.0509, -1791.2056, 13.3481, 271.8937, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[8]), FormatMoney(GetVehicleCost(586)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[8], 0);
	
	SRV[9] = AddStaticVehicleEx(462, 1783.1074, -1796.4341, 13.3418, 272.3698, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[9]), FormatMoney(GetVehicleCost(462)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[9], 0);
	
	SRV[10] = AddStaticVehicleEx(562, 1780.6313, -1746.7004, 13.4339, 272.3674, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[10]), FormatMoney(GetVehicleCost(562)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[10], 0);
	
	SRV[11] = AddStaticVehicleEx(559, 1780.5088, -1751.0884, 13.4335, 269.1176, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[11]), FormatMoney(GetVehicleCost(559)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[11], 0);
	
	SRV[12] = AddStaticVehicleEx(558, 1780.4934, -1755.6046, 13.3330, 270.1825, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[12]), FormatMoney(GetVehicleCost(558)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[12], 0);
	
	SRV[13] = AddStaticVehicleEx(560, 1780.3639, -1760.2197, 13.3498, 269.5254, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[13]), FormatMoney(GetVehicleCost(560)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[13], 0);
	
	SRV[14] = AddStaticVehicleEx(534, 1780.1563, -1765.0363, 13.5380, 269.2734, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[14]), FormatMoney(GetVehicleCost(534)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[14], 0);
	
	SRV[15] = AddStaticVehicleEx(535, 1780.0767, -1769.8610, 13.4390, 270.8372, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[15]), FormatMoney(GetVehicleCost(535)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[15], 0);
	
	SRV[16] = AddStaticVehicleEx(561, 1780.2644, -1775.0776, 13.5963, 270.4830, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[16]), FormatMoney(GetVehicleCost(561)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[16], 0);
	
	SRV[17] = AddStaticVehicleEx(565, 1780.2485, -1780.0298, 13.5388, 268.5630, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[17]), FormatMoney(GetVehicleCost(565)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[17], 0);
	
	SRV[18] = AddStaticVehicleEx(536, 1777.2966, -1792.3629, 13.4448, 266.4421, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[18]), FormatMoney(GetVehicleCost(536)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[18], 0);
	
	SRV[19] = AddStaticVehicleEx(567, 1777.0505, -1787.6537, 13.5397, 269.1854, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[19]), FormatMoney(GetVehicleCost(567)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[19], 0);
	
	SRV[20] = AddStaticVehicleEx(575, 1773.6133, -1746.8940, 13.4415, 267.7987, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[20]), FormatMoney(GetVehicleCost(575)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[20], 0);
	
	SRV[21] = AddStaticVehicleEx(576, 1773.8724, -1751.1239, 13.3463, 269.8656, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[21]), FormatMoney(GetVehicleCost(576)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[21], 0);
	
	SRV[22] = AddStaticVehicleEx(603, 1773.4714, -1755.6996, 13.5358, 269.4989, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[22]), FormatMoney(GetVehicleCost(603)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[22], 0);
	
	SRV[23] = AddStaticVehicleEx(421, 1773.2870, -1760.1803, 13.6587, 268.1767, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[23]), FormatMoney(GetVehicleCost(421)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[23], 0);
	
	SRV[24] = AddStaticVehicleEx(602, 1773.1527, -1765.1130, 13.5350, 269.3487, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[24]), FormatMoney(GetVehicleCost(602)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[24], 0);
	
	SRV[25] = AddStaticVehicleEx(424, 1763.0251, -1747.0309, 13.4563, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[25]), FormatMoney(GetVehicleCost(424)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[25], 0);
	
	SRV[26] = AddStaticVehicleEx(545, 1767.9030, -1747.1432, 13.6429, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[26]), FormatMoney(GetVehicleCost(545)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[26], 0);
	
	SRV[27] = AddStaticVehicleEx(470, 1763.0076, -1752.5802, 13.5407, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[27]), FormatMoney(GetVehicleCost(470)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[27], 0);
	
	SRV[28] = AddStaticVehicleEx(405, 1767.8601, -1752.9895, 13.6361, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[28]), FormatMoney(GetVehicleCost(405)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[28], 0);
	
	SRV[29] = AddStaticVehicleEx(445, 1762.8158, -1758.9573, 13.6367, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[29]), FormatMoney(GetVehicleCost(445)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[29], 0);
	
	SRV[30] = AddStaticVehicleEx(579, 1767.6091, -1759.2477, 13.6316, 0.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[30]), FormatMoney(GetVehicleCost(579)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[30], 0);
	
	SRV[31] = AddStaticVehicleEx(507, 1765.8990, -1765.1198, 13.6521, 270.5802, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"LG_E"%s", GetVehicleName(SRV[31]), FormatMoney(GetVehicleCost(507)));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, SRV[31], 0);

	VSRV[0] = AddStaticVehicleEx(522, 1764.1200, -1767.0721, 19.0150, 267.2831, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[0]), GetVipVehicleCost(522));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[0], 0);
	
	VSRV[1] = AddStaticVehicleEx(411, 1764.5015, -1763.0033, 19.1138, 269.4697, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[1]), GetVipVehicleCost(411));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[1], 0);
	
	VSRV[2] = AddStaticVehicleEx(451, 1764.4136, -1757.9407, 18.9155, 270.6092, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[2]), GetVipVehicleCost(451));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[2], 0);
	
	VSRV[3] = AddStaticVehicleEx(415, 1764.8381, -1752.6050, 19.2127, 269.6837, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[3]), GetVipVehicleCost(415));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[3], 0);
	
	VSRV[4] = AddStaticVehicleEx(402, 1765.0895, -1747.2574, 19.1356, 268.8522, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[4]), GetVipVehicleCost(402));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[4], 0);
	
	VSRV[5] = AddStaticVehicleEx(541, 1775.5743, -1763.1888, 18.9185, 269.6231, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[5]), GetVipVehicleCost(541));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[5], 0);
	
	VSRV[6] = AddStaticVehicleEx(429, 1775.4403, -1757.9485, 18.9151, 268.5131, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[6]), GetVipVehicleCost(429));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[6], 0);
	
	VSRV[7] = AddStaticVehicleEx(506, 1775.5327, -1752.8689, 19.1126, 269.4091, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[7]), GetVipVehicleCost(506));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[7], 0);
	
	VSRV[8] = AddStaticVehicleEx(494, 1773.2062, -1789.9043, 19.1187, -91.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[8]), GetVipVehicleCost(494));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[8], 0);
	
	VSRV[9] = AddStaticVehicleEx(502, 1773.0939, -1784.8964, 19.2225, 268.5928, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[9]), GetVipVehicleCost(502));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[9], 0);
	
	VSRV[10] = AddStaticVehicleEx(503, 1773.3008, -1780.1669, 19.1467, -91.0000, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[10]), GetVipVehicleCost(503));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[10], 0);
	
	VSRV[11] = AddStaticVehicleEx(409, 1774.4655, -1795.3044, 19.2847, 270.3382, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[11]), GetVipVehicleCost(409));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[11], 0);
	
	VSRV[12] = AddStaticVehicleEx(477, 1775.4735, -1747.1354, 19.1130, 269.5970, 0, 0, 100);
	format(vehtext, sizeof(vehtext), "%s\n"YELLOW_E"%d Coin", GetVehicleName(VSRV[12]), GetVipVehicleCost(477));
	CreateDynamic3DTextLabel(vehtext, COLOR_WHITE, 1782.8107, -1789.0009, 13.4394, 3.0, INVALID_PLAYER_ID, VSRV[12], 0);*/
	
	//SAPD LSPD Vehicles
	SAPDVehicles[0] = AddStaticVehicleEx(596,1602.0660,-1683.9678,5.6124,90.3080,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[1] = AddStaticVehicleEx(596,1602.1194,-1687.9663,5.6107,90.5233,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[2] = AddStaticVehicleEx(596,1602.1680,-1692.0110,5.6113,89.5516,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[3] = AddStaticVehicleEx(596,1602.1666,-1696.1469,5.6123,90.4002,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[4] = AddStaticVehicleEx(596,1602.1936,-1700.1580,5.6113,89.7974,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[5] = AddStaticVehicleEx(596,1602.1382,-1704.3373,5.6118,88.9091,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[6] = AddStaticVehicleEx(407,1595.5073,-1710.6666,5.6109,0.1711,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[7] = AddStaticVehicleEx(544,1591.3687,-1710.6256,5.6119,358.8773,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[8] = AddStaticVehicleEx(596,1587.3217,-1710.6517,5.6118,0.3150,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[9] = AddStaticVehicleEx(596,1583.3668,-1710.7098,5.6118,0.0238,0,1, VEHICLE_RESPAWN, 1); // Cruiser
	SAPDVehicles[10] = AddStaticVehicleEx(599,1545.7213,-1655.0195,6.0814,90.4218,0,1, VEHICLE_RESPAWN, 1); // Rancher
	SAPDVehicles[11] = AddStaticVehicleEx(599,1545.8069,-1651.1516,6.0790,88.2897,0,1, VEHICLE_RESPAWN, 1); // Rancher
	SAPDVehicles[12] = AddStaticVehicleEx(601,1526.5850,-1644.1801,5.6494,180.3210,1,1, VEHICLE_RESPAWN, 1); // Splashy
	SAPDVehicles[13] = AddStaticVehicleEx(601,1530.7244,-1644.2538,5.6494,179.6148,1,1, VEHICLE_RESPAWN, 1); // Splashy
	//SAPDVehicles[14] = AddStaticVehicleEx(427,1534.8553,-1644.8682,6.0226,180.7921,0,0, VEHICLE_RESPAWN, 1); // Enforcer
	//SAPDVehicles[15] = 	AddStaticVehicleEx(427,1538.9325,-1644.9508,6.0226,179.5991,0,0, VEHICLE_RESPAWN, 1); // Enforcer
	SAPDVehicles[14] = AddStaticVehicleEx(528,1527.6542,-1655.9646,5.9339,270.1992,0,0, VEHICLE_RESPAWN, 1); // SWAT Van
	SAPDVehicles[15] = AddStaticVehicleEx(560,1584.7515,-1667.5281,5.5974,270.7136,0,0, VEHICLE_RESPAWN, 1); // Sultan
	SAPDVehicles[16] = AddStaticVehicleEx(560,1584.7291,-1671.6987,5.5982,268.7675,0,0, VEHICLE_RESPAWN, 1); // Sultan
	SAPDVehicles[17] = AddStaticVehicleEx(523,1584.7783,-1675.3850,5.4639,270.6620,0,0, VEHICLE_RESPAWN, 1); // Police Bike
	SAPDVehicles[18] = AddStaticVehicleEx(523,1585.0814,-1680.4186,5.4661,272.0062,0,0, VEHICLE_RESPAWN, 1); // Police Bike
	SAPDVehicles[19] = AddStaticVehicleEx(523,1587.2833,-1677.7260,5.4654,269.2448,0,0, VEHICLE_RESPAWN, 1); // Police Bike
	SAPDVehicles[20] = AddStaticVehicleEx(596,1535.9803,-1677.6580,13.1176,359.4672,0,1, VEHICLE_RESPAWN, 1); // Cruiser (Front)
	SAPDVehicles[21] = AddStaticVehicleEx(596,1535.9502,-1667.3008,13.1039,180.1666,0,1, VEHICLE_RESPAWN, 1); // Cruiser (Front)
	SAPDVehicles[22] = AddStaticVehicleEx(525,1556.5985,-1606.3214,13.2680,179.1279,17,20, VEHICLE_RESPAWN, 1); // Tow Truck
	SAPDVehicles[23] = AddStaticVehicleEx(525,1560.8201,-1606.3423,13.2557,178.6305,18,20, VEHICLE_RESPAWN, 1); // Tow Truck
	SAPDVehicles[24] = AddStaticVehicleEx(497,1569.1587,-1641.0361,28.5788,89.5537,0,1, VEHICLE_RESPAWN, 1); // Maverick
	SAPDVehicles[25] = AddStaticVehicleEx(497,1547.7992,-1643.6317,28.5923,91.2595,0,1, VEHICLE_RESPAWN, 1); // Maverick
 	SAPDVehicles[26] = AddStaticVehicleEx(411,1578.5643,-1710.6968,5.6112,0.0933,0,1, VEHICLE_RESPAWN, 1); // Infernus
	SAPDVehicles[27] = AddStaticVehicleEx(411,1574.3217,-1710.7924,5.6117,0.8341,0,1, VEHICLE_RESPAWN, 1); // Infernus

	for(new x;x<sizeof(SAPDVehicles);x++)
	{
	    format(strings, sizeof(strings), "SAPD-%d", SAPDVehicles[x]);
	    SetVehicleNumberPlate(SAPDVehicles[x], strings);
	    SetVehicleToRespawn(SAPDVehicles[x]);
	}
	
	/*SAGSVehicles[0] = AddStaticVehicleEx(409, 1534.4767, -1757.0521, 13.1437, 180.2723, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[1] = AddStaticVehicleEx(409, 1545.6013, -1757.0219, 13.1437, 180.2723, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[2] = AddStaticVehicleEx(409, 1539.9905, -1757.0594, 13.1437, 180.2723, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[3] = AddStaticVehicleEx(400, 1553.3678, -1775.4850, 13.5501, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[4] = AddStaticVehicleEx(400, 1553.2333, -1771.4791, 13.5501, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[5] = AddStaticVehicleEx(560, 1553.9814, -1783.3425, 13.0479, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[6] = AddStaticVehicleEx(560, 1553.9375, -1779.5382, 13.0479, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[7] = AddStaticVehicleEx(426, 1553.6774, -1787.2021, 13.1542, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[8] = AddStaticVehicleEx(439, 1553.3984, -1791.1477, 13.2904, 90.3328, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[9] = AddStaticVehicleEx(562, 1553.8031, -1795.1871, 13.1378, 91.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[10] = AddStaticVehicleEx(437, 1545.9094, -1819.8540, 13.4641, 0.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[11] = AddStaticVehicleEx(483, 1540.3176, -1818.8209, 13.4678, 0.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[12] = AddStaticVehicleEx(521, 1524.2035, -1754.7806, 12.9503, 178.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[13] = AddStaticVehicleEx(521, 1527.6666, -1754.8362, 12.9503, 178.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[14] = AddStaticVehicleEx(521, 1525.8569, -1754.8169, 12.9503, 178.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[15] = AddStaticVehicleEx(461, 1518.5685, -1754.8243, 12.9700, 178.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[16] = AddStaticVehicleEx(461, 1522.2450, -1754.6913, 12.9700, 178.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[17] = AddStaticVehicleEx(461, 1520.4065, -1754.8032, 12.9700, 178.0000, 0, 1, VEHICLE_RESPAWN);
	//SAGSVehicles[18] = AddStaticVehicleEx(417, 1530.6005, -1807.9861, 13.7233, 0.0000, -1, -1, VEHICLE_RESPAWN);	//heli
	//SAGSVehicles[19] = AddStaticVehicleEx(487, 1510.3551, -1816.0139, 13.6872, -84.0000, -1, -1, VEHICLE_RESPAWN);	//heli*/
	
	/*SAGSVehicles[0] = AddStaticVehicleEx(409, 1414.6333, -1859.0222, 13.1326, 90.3330, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[1] = AddStaticVehicleEx(409, 1415.2675, -1844.1443, 13.1326, 90.3330, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[2] = AddStaticVehicleEx(411, 1415.4066, -1834.1469, 13.2399, 90.5851, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[3] = AddStaticVehicleEx(411, 1415.4929, -1839.2155, 13.2399, 90.5851, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[4] = AddStaticVehicleEx(507, 1415.2688, -1829.0492, 13.2130, 89.9329, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[5] = AddStaticVehicleEx(431, 1413.0757, -1854.6390, 13.5431, 89.7958, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[6] = AddStaticVehicleEx(437, 1413.4871, -1849.3666, 13.5798, 90.3041, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[7] = AddStaticVehicleEx(521, 1459.8047, -1819.2911, 12.9433, 0.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[8] = AddStaticVehicleEx(581, 1454.9469, -1818.9352, 13.0384, 0.0000, 0, 1, VEHICLE_RESPAWN);
	SAGSVehicles[9] = AddStaticVehicleEx(461, 1449.7579, -1818.8969, 13.0665, 0.0000, 0, 1, VEHICLE_RESPAWN);*/
	
	SAGSVehicles[0] = AddStaticVehicleEx(405, 1507.6377, -1747.9199, 13.5757, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[1] = AddStaticVehicleEx(405, 1455.3049, -1748.5181, 13.3789, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[2] = AddStaticVehicleEx(409, 1498.6385, -1744.0792, 13.2442, 91.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[3] = AddStaticVehicleEx(409, 1463.2329, -1743.9989, 13.2442, -91.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[4] = AddStaticVehicleEx(411, 1524.1866, -1846.0491, 13.3714, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[5] = AddStaticVehicleEx(411, 1534.8187, -1845.9094, 13.3714, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[6] = AddStaticVehicleEx(411, 1529.4353, -1845.9347, 13.3714, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[7] = AddStaticVehicleEx(521, 1512.8479, -1846.1010, 13.0548, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[8] = AddStaticVehicleEx(521, 1519.4961, -1846.0326, 13.0548, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[9] = AddStaticVehicleEx(521, 1515.9736, -1845.9476, 13.0548, 0.0000, 0, 0, VEHICLE_RESPAWN);
	SAGSVehicles[10] = AddStaticVehicleEx(437, 1494.1495, -1845.1425, 13.5694, -91.0000, 0, 0, VEHICLE_RESPAWN);

	
	for(new x;x<sizeof(SAGSVehicles);x++)
	{
	    format(strings, sizeof(strings), "SAGS-%d", SAGSVehicles[x]);
	    SetVehicleNumberPlate(SAGSVehicles[x], strings);
	    SetVehicleToRespawn(SAGSVehicles[x]);
	}
	
	SAMDVehicles[0] = AddStaticVehicleEx(407, 1111.0358, -1328.3903, 13.6102, 0.0000, -1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[1] = AddStaticVehicleEx(407, 1098.1630, -1328.7020, 13.7072, 0.0000, -1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[2] = AddStaticVehicleEx(544, 1124.4944, -1327.0439, 13.9194, 0.0000, -1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[3] = AddStaticVehicleEx(416, 1116.0294, -1296.6489, 13.6160, 179.4438, 1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[4] = AddStaticVehicleEx(416, 1125.8785, -1296.2780, 13.6160, 179.4438, 1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[5] = AddStaticVehicleEx(416, 1121.1556, -1296.4138, 13.6160, 179.4438, 1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[6] = AddStaticVehicleEx(442, 1111.1719, -1296.7606, 13.4886, 185.0000, 0, 1, VEHICLE_RESPAWN, 1);
	SAMDVehicles[7] = AddStaticVehicleEx(426, 1136.0360, -1341.2158, 13.3050, 0.0000, 0, 1, VEHICLE_RESPAWN, 1);
	SAMDVehicles[8] = AddStaticVehicleEx(416, 1178.5963, -1338.9039, 14.1457, -91.0000, 1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[9] = AddStaticVehicleEx(586, 1130.7795, -1330.4045, 13.3639, 0.0000, 0, 1, VEHICLE_RESPAWN, 1);
	SAMDVehicles[10] = AddStaticVehicleEx(563, 1162.9077, -1313.8203, 32.1891, 270.6980, -1, 3, VEHICLE_RESPAWN, 1);
	SAMDVehicles[11] = AddStaticVehicleEx(487, 1163.0469, -1297.5098, 31.5550, 269.6279, -1, 3, VEHICLE_RESPAWN, 1);
	
	for(new x;x<sizeof(SAMDVehicles);x++)
	{
	    format(strings, sizeof(strings), "SAMD-%d", SAMDVehicles[x]);
	    SetVehicleNumberPlate(SAMDVehicles[x], strings);
	    SetVehicleToRespawn(SAMDVehicles[x]);
	}
	
	SANAVehicles[0] = AddStaticVehicleEx(582, 781.4338, -1337.5022, 13.9482, 91.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[1] = AddStaticVehicleEx(582, 758.7664, -1336.1642, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[2] = AddStaticVehicleEx(582, 764.4276, -1336.1959, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[3] = AddStaticVehicleEx(582, 770.3247, -1335.9663, 13.9482, 179.0212, -1, -1, VEHICLE_RESPAWN);
	//SANAVehicles[4] = AddStaticVehicleEx(582, 781.8044, -1348.0001, 13.9482, 91.0000, -1, -1, VEHICLE_RESPAWN);
	//SANAVehicles[5] = AddStaticVehicleEx(582, 781.6168, -1342.6869, 13.9482, 91.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[4] = AddStaticVehicleEx(418, 737.3025, -1334.3344, 14.1711, 246.6513, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[5] = AddStaticVehicleEx(413, 736.4621, -1338.6304, 13.7490, -113.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[6] = AddStaticVehicleEx(405, 737.4107, -1343.0820, 13.7357, -113.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[7] = AddStaticVehicleEx(461, 749.7194, -1334.2122, 13.2465, 178.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[8] = AddStaticVehicleEx(461, 753.8127, -1334.2727, 13.2465, 178.0000, -1, -1, VEHICLE_RESPAWN);
	//SANAVehicles[11] = AddStaticVehicleEx(461, 751.7328, -1334.2236, 13.2465, 178.0000, -1, -1, VEHICLE_RESPAWN);
	SANAVehicles[9] = AddStaticVehicleEx(488, 741.9925, -1371.2443, 25.8111, 0.0000, -1, -1, VEHICLE_RESPAWN);
	
	for(new x;x<sizeof(SANAVehicles);x++)
	{
	    format(strings, sizeof(strings), "SANA-%d", SANAVehicles[x]);
	    SetVehicleNumberPlate(SANAVehicles[x], strings);
	    SetVehicleToRespawn(SANAVehicles[x]);
	}
	
	
	/*CreateDynamicObject(19305, 1388.987670, -25.291969, 1001.358520, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19305, 1391.275756, -25.481920, 1001.358520, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SAGSLobbyKey[0] = CreateKeypadEx(1388.987670, -25.291969, 1001.358520, "1234");
    SAGSLobbyKey[1] = CreateKeypadEx(1391.275756, -25.481920, 1001.358520, "1234");
	SAGSLobbyDoor = CreateDynamicObject(1569, 1389.375000, -25.387500, 999.978210, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);*/
	
	/*CreateButton(Float:x, Float:y, Float:z, text[],
	world = 0, interior = 0, Float:areasize = 1.0, label = 0,
	labeltext[] = "", labelcolour = 0xFFFF00FF, Float:streamdist = BTN_DEFAULT_STREAMDIST, testlos = true)
	
	
	SAGSLobbyBtn[0] = CreateButton(1388.987670, -25.291969, 1001.358520, "SAGS Lobby", 0, 0, 1.0, 0, "No", 0xFFFF00FF, BTN_DEFAULT_STREAMDIST, true);
    SAGSLobbyBtn[1] = CreateButton(1391.275756, -25.481920, 1001.358520, "SAGS Lobby", 0,  0, 1.0, 0, "No", 0xFFFF00FF, BTN_DEFAULT_STREAMDIST, true);

	SAGSLobbyDoor = CreateDoor(1569, SAGSLobbyBtn,
		1389.375000, -25.387500, 999.978210, 0.00000, 0.00000, 0.00000,
		1387.9232, -25.3887, 999.9782, 0.00000, 0.00000, 0.00000,
		.movespeed = 1.0, .closedelay = 3000, .maxbuttons = 2, .movesound = 1186, .stopsound = 1186, .worldid = 0, .interiorid = 0, .initstate = DR_STATE_CLOSED);
	*/
	
	printf("[Object] Number of Dynamic objects loaded: %d", CountDynamicObjects());
	return 1;
}

public OnGameModeExit()
{
	new count = 0, count1 = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station] Number of Saved: %d", count);
	
	foreach(new pid : Plants)
	{
		if(Iter_Contains(Plants, pid))
		{
			count1++;
			Plant_Save(pid);
		}
	}
	printf("[Farmer Plant] Number of Saved: %d", count1);
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	UnloadTazerSAPD();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	return 1;
}

function SAGSLobbyDoorClose()
{
	MoveDynamicObject(SAGSLobbyDoor, 1389.375000, -25.387500, 999.978210, 3);
	return 1;
}

function SAPDLobbyDoorClose()
{
	MoveDynamicObject(SAPDLobbyDoor[0], 253.10965, 107.61060, 1002.21368, 3);
	MoveDynamicObject(SAPDLobbyDoor[1], 253.12556, 110.49657, 1002.21460, 3);
	MoveDynamicObject(SAPDLobbyDoor[2], 239.69435, 116.15908, 1002.21411, 3);
	MoveDynamicObject(SAPDLobbyDoor[3], 239.64050, 119.08750, 1002.21332, 3);
	return 1;
}

function LLFLobbyDoorClose()
{
	MoveDynamicObject(LLFLobbyDoor, -2119.21509, 657.54187, 1060.73560, 3);
	return 1;
}

public OnPlayerPressButton(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0] || buttonid == SAGSLobbyBtn[1])
	{
	    if(pData[playerid][pFaction] == 2)
	    {
	        MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
			SetTimer("SAGSLobbyDoorClose", 5000, 0);
	    }
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[0] || buttonid == SAPDLobbyBtn[1])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[0], 253.14204, 106.60210, 1002.21368, 3);
			MoveDynamicObject(SAPDLobbyDoor[1], 253.24377, 111.94370, 1002.21460, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == SAPDLobbyBtn[2] || buttonid == SAPDLobbyBtn[3])
	{
		if(pData[playerid][pFaction] == 1)
		{
			MoveDynamicObject(SAPDLobbyDoor[2], 239.52385, 114.75534, 1002.21411, 3);
			MoveDynamicObject(SAPDLobbyDoor[3], 239.71977, 120.21591, 1002.21332, 3);
			SetTimer("SAPDLobbyDoorClose", 5000, 0);
		}
		else
	    {
	        Error(playerid, "Access denied.");
			return 1;
		}
	}
	if(buttonid == LLFLobbyBtn[0] || buttonid == LLFLobbyBtn[1])
	{
		if(pData[playerid][pFamily] == 0)
		{
			MoveDynamicObject(LLFLobbyDoor, -2119.27148, 656.04028, 1060.73560, 3);
			SetTimer("LLFLobbyDoorClose", 5000, 0);
		}
		else
		{
			Error(playerid, "Access denied.");
			return 1;
		}
	}
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "You are not SANEW!");
			}
		}
		if(GetVehicleModel(vehicleid) == 548 || GetVehicleModel(vehicleid) == 417 || GetVehicleModel(vehicleid) == 487 || GetVehicleModel(vehicleid) == 488 ||
		GetVehicleModel(vehicleid) == 497 || GetVehicleModel(vehicleid) == 563 || GetVehicleModel(vehicleid) == 469)
		{
			if(pData[playerid][pLevel] < 5)
			{
				RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
				Error(playerid, "Anda tidak memiliki izin!");
			}
		}
		/*foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) && pvData[pv][cLocked] == 1)
				{
					RemovePlayerFromVehicle(playerid);
					new Float:slx, Float:sly, Float:slz;
					GetPlayerPos(playerid, slx, sly, slz);
					SetPlayerPos(playerid, slx, sly, slz);
					Error(playerid, "This bike is locked by owner.");
				}
			}
		}*/
	}
	return 1;
}


/*public OnVehicleStreamIn(vehicleid, forplayerid)
{
	foreach(new pv : PVehicles)
	{
		if(vehicleid == pvData[pv][cVeh])
		{
			if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
			{
				if(pvData[pv][cLocked] == 1)
				{
					SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);
				}
			}
		}
	}
	return 1;
}*/

/*
public OnPlayerEnterKeypadArea(playerid, keypadid)
{
    ShowPlayerKeypad(playerid, keypadid);
    return 1;
}

public OnKeypadResponse(playerid, keypadid, bool:response, bool:success, code[])
{
    if(keypadid == SAGSLobbyKey[0])
    {
        if(!response)
        {
            HidePlayerKeypad(playerid, keypadid);
            return 1;
        }
		if(response)
        {
            if(!success)
            {
                Error(playerid, "Wrong Code.");
            }
			if(success)
			{
				Info(playerid, "Welcome.");
				MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
				SetTimer("SAGSLobbyDoorClose", 5000, 0);
			}
		}
	}
    if(keypadid == SAGSLobbyKey[1])
    {
        if(!response)
        {
            HidePlayerKeypad(playerid, keypadid);
            return 1;
        }
        if(response)
        {
            if(!success)
            {
                Error(playerid, "Wrong Code.");
            }
            if(success)
            {
                Info(playerid, "Welcome.");
				MoveDynamicObject(SAGSLobbyDoor, 1387.9232, -25.3887, 999.9782, 3);
				SetTimer("SAGSLobbyDoorClose", 5000, 0);
            }
        }
    }
    return 1;
} */

/*public OnPlayerActivateDoor(playerid, doorid)
{
	if(doorid == SAGSLobbyDoor)
	{
		if(pData[playerid][pFaction] != 2)
		{
			Error(playerid, "You dont have access!");
			return 1; // Cancels the door from being opened
		}
	}
	if(doorid == gMyDoor)
	{
		new bool:gIsDoorLocked = false;
		if(gIsDoorLocked == true)
		{
			SendClientMessage(playerid, -1, "Door is locked, can't open!");
			return 1; // Cancels the door from being opened
		}
	}
	return 1;
}

public OnButtonPress(playerid, buttonid)
{
	if(buttonid == SAGSLobbyBtn[0])
	{
		Info(playerid, "Well done!");
	}
	if(buttonid == SAGSLobbyBtn[1])
	{
		Info(playerid, "Well done!");
	}
}*/

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	printf("[CHAT] %s(%d) : %s", pData[playerid][pName], playerid, text);
	
	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s take the weapon off the belt and ready to shoot anytime.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s shocked after crash.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '!')
	{
		new tmp[512];
		if(text[1] == ' ')
		{
			format(tmp, sizeof(tmp), "%s", text[2]);
		}
		else
		{
			format(tmp, sizeof(tmp), "%s", text[1]);
		}
		if(pData[playerid][pAdminDuty] == 1)
		{
			if(strlen(tmp) > 64)
			{
				SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), tmp);
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", tmp[64]);
				return 0;
			}
			else
			{
				SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), tmp);
				return 0;
			}
		}
		else
		{
			if(strlen(tmp) > 64)
			{
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %.64s ..", ReturnName(playerid), tmp);
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", tmp[64]);
				return 0;
			}
			else
			{
				SendNearbyMessage(playerid, 20.0, COLOR_WHITE, "%s: (( %s ))", ReturnName(playerid), tmp);
				return 0;
			}
		}
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "You dont have phone credits!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "You cant do at this time.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "This number is not actived!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];
					
					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "(cellphone) %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		
		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		return 0;
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (result == -1)
    {
        Error(playerid, "Unknow Command! /help for more info.");
        return 0;
    }
	printf("[CMD]: %s(%d) has used the command '%s' (%s)", pData[playerid][pName], playerid, cmd, params);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	ResetVariables(playerid);
	CreatePlayerTextDraws(playerid);
	TextDrawShowForPlayer(playerid, TextDate);
	TextDrawShowForPlayer(playerid, TextTime);
	
	GetPlayerName(playerid, pData[playerid][pName], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	
	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pName]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);
	
	foreach(new ii : Player)
	{
		if(pData[ii][pTogLog] == 0)
		{
			SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has joined to the server.(%s, %s)", pData[playerid][pName], playerid, city, country);
		}
	}

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 8.000000, 5930683, 100, 0);
	
	//HBE textdraw Modern
	pData[playerid][damagebar] = CreatePlayerProgressBar(playerid, 459.000000, 415.749938, 61.000000, 9.000000, 16711935, 1000.0, 0);
	pData[playerid][fuelbar] = CreatePlayerProgressBar(playerid, 459.500000, 432.083221, 61.000000, 9.000000, 16711935, 1000.0, 0);
                
	pData[playerid][hungrybar] = CreatePlayerProgressBar(playerid, 565.500000, 405.833404, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][energybar] = CreatePlayerProgressBar(playerid, 565.500000, 420.416717, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][bladdybar] = CreatePlayerProgressBar(playerid, 565.500000, 435.000091, 68.000000, 8.000000, 16711935, 100.0, 0);
	
	//HBE textdraw Simple
	pData[playerid][spdamagebar] = CreatePlayerProgressBar(playerid, 565.500000, 383.666717, 51.000000, 7.000000, 16711935, 1000.0, 0);
	pData[playerid][spfuelbar] = CreatePlayerProgressBar(playerid, 566.000000, 398.250061, 51.000000, 7.000000, 16711935, 1000.0, 0);
                
	pData[playerid][sphungrybar] = CreatePlayerProgressBar(playerid, 467.500000, 433.833282, 41.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][spenergybar] = CreatePlayerProgressBar(playerid, 531.500000, 433.249938, 41.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][spbladdybar] = CreatePlayerProgressBar(playerid, 595.500000, 433.250061, 41.000000, 8.000000, 16711935, 100.0, 0);

	//PlayAudioStreamForPlayer(playerid, "http://www.soi-rp.com/music/songs/LP-A_Light.mp3");
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }
	//UpdateWeapons(playerid);
	g_MysqlRaceCheck[playerid]++;
	
	UpdatePlayerData(playerid);
	RemovePlayerVehicle(playerid);
	Report_Clear(playerid);
	Player_ResetMining(playerid);
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetHarvest(playerid);
	KillTazerTimer(playerid);
	
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);

    pData[playerid][pAdoActive] = false;
	
	/*if(cache_is_valid(pData[playerid][Cache_ID]) && pData[playerid][IsLoggedIn] == false)
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}*/

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	
	foreach(new ii : Player)
	{
		if(IsPlayerInRangeOfPoint(ii, 40.0, x, y, z))
		{
			switch(reason)
			{
				case 0:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(timeout/crash)", pData[playerid][pName], playerid);
				}
				case 1:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(leaving)", pData[playerid][pName], playerid);
				}
				case 2:
				{
					SendClientMessageEx(ii, COLOR_RED, "[SERVER]"YELLOW_E" %s(%d) has leave from the server.(kicked/banned)", pData[playerid][pName], playerid);
				}
			}
		}
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	//SetSpawnInfo(playerid, 0, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	//SpawnPlayer(playerid);
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);
	
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 1716.1129, -1880.0715, -10.0);
			SetPlayerCameraPos(playerid,1755.0413,-1824.8710,20.2100);
			SetPlayerCameraLookAt(playerid,1716.1129,-1880.0715,22.0264);
			SetPlayerVirtualWorld(playerid, 0);
			ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Enter", "Batal");
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				ShowPlayerProgressBar(playerid, pData[playerid][sphungrybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][spenergybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][spbladdybar]);
				for(new txd = 12; txd > 11 && txd < 16; txd++)
				{
					TextDrawShowForPlayer(playerid, TDEditor_TD[txd]);
				}
			}
			if(pData[playerid][pHBEMode] == 2) //modern
			{
				ShowPlayerProgressBar(playerid, pData[playerid][hungrybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][energybar]);
				ShowPlayerProgressBar(playerid, pData[playerid][bladdybar]);
				for(new txd; txd < 5; txd++)
				{
					TextDrawShowForPlayer(playerid, TDEditor_TD[txd]);
				}
			}
			else
			{
				
			}
			TextDrawShowForPlayer(playerid, SOIRP_TXD);

			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid); 
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	return 1;
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	if(listid == SpawnFemale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
    }
	//Locker Faction Skin
	if(listid == SAPDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAPDWar)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAGSFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SAMDFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWMale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	if(listid == SANEWFemale)
    {
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
    }
	///Bisnis buy skin clothes
	if(listid == MaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == FemaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPMaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == VIPFemaleSkins)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
            Bisnis_Save(bizid);
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
	return 1;
}

/*public OnPlayerRequestClass(playerid, classid)
{
	//SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}*/

public OnPlayerDeath(playerid, killerid, reason)
{
	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;
	Player_ResetCutting(playerid);
	Player_RemoveLumber(playerid);
	Player_ResetMining(playerid);
	Player_ResetHarvest(playerid);
	
	pData[playerid][CarryProduct] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pTaxiDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
        }
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];
 
            GetWeaponName(weaponid, weaponname, sizeof(weaponname));
           
            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;
 
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
 
            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);
           
            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			GameTextForPlayer(playerid, "~g~~h~Toy Position Updated~y~!", 4000, 5);

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			GameTextForPlayer(playerid, "~r~~h~Selection Cancelled~y~!", 4000, 5);

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(pData[playerid][EditingTreeID] != -1 && Iter_Contains(Trees, pData[playerid][EditingTreeID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        TreeData[etid][treeX] = x;
	        TreeData[etid][treeY] = y;
	        TreeData[etid][treeZ] = z;
	        TreeData[etid][treeRX] = rx;
	        TreeData[etid][treeRY] = ry;
	        TreeData[etid][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_X, TreeData[etid][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Y, TreeData[etid][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[etid][treeLabel], E_STREAMER_Z, TreeData[etid][treeZ] + 1.5);

		    Tree_Save(etid);
	        pData[playerid][EditingTreeID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingTreeID];
	        SetDynamicObjectPos(objectid, TreeData[etid][treeX], TreeData[etid][treeY], TreeData[etid][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[etid][treeRX], TreeData[etid][treeRY], TreeData[etid][treeRZ]);
	        pData[playerid][EditingTreeID] = -1;
	    }
	}
	if(pData[playerid][EditingOreID] != -1 && Iter_Contains(Ores, pData[playerid][EditingOreID]))
	{
	    if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        OreData[etid][oreX] = x;
	        OreData[etid][oreY] = y;
	        OreData[etid][oreZ] = z;
	        OreData[etid][oreRX] = rx;
	        OreData[etid][oreRY] = ry;
	        OreData[etid][oreRZ] = rz;

	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_X, OreData[etid][oreX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Y, OreData[etid][oreY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, OreData[etid][oreLabel], E_STREAMER_Z, OreData[etid][oreZ] + 1.5);

		    Ore_Save(etid);
	        pData[playerid][EditingOreID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingOreID];
	        SetDynamicObjectPos(objectid, OreData[etid][oreX], OreData[etid][oreY], OreData[etid][oreZ]);
	        SetDynamicObjectRot(objectid, OreData[etid][oreRX], OreData[etid][oreRY], OreData[etid][oreRZ]);
	        pData[playerid][EditingOreID] = -1;
	    }
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(checkpointid == pData[playerid][LoadingPoint])
	{
	    if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		return 1;
	}
	if(checkpointid == ShowRoomCP)
	{
		ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "Showroom", "Bikes\nCars\nUnique Cars\nJob Cars", "Select", "Cancel");
	}
	if(checkpointid == ShowRoomCPRent)
	{
		new str[1024];
		format(str, sizeof(str), ""WHITE_E"%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days\n%s\t"LG_E"$500 / one days",
		GetVehicleModelName(414), 
		GetVehicleModelName(455), 
		GetVehicleModelName(456),
		GetVehicleModelName(498),
		GetVehicleModelName(499),
		GetVehicleModelName(609),
		GetVehicleModelName(478),
		GetVehicleModelName(422),
		GetVehicleModelName(543),
		GetVehicleModelName(554),
		GetVehicleModelName(525),
		GetVehicleModelName(438),
		GetVehicleModelName(420)
		);
		
		ShowPlayerDialog(playerid, DIALOG_RENT_JOBCARS, DIALOG_STYLE_LIST, "Rent Job Cars", str, "Rent", "Close");
	}
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis anda!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pHauling] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Hauling) , /storegas.");
	}
	DisablePlayerRaceCheckpoint(playerid);
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(pData[playerid][CarryingLog] != -1)
	{
		if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
		new vehicleid = GetPVarInt(playerid, "LastVehicleID"), type[64], carid = -1;
		if(pData[playerid][CarryingLog] == 0)
		{
			type = "Metal";
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			type = "Coal";
		}
		else
		{
			type = "Unknown";
		}
		if(Vehicle_LogCount(vehicleid) >= LOG_LIMIT) return Error(playerid, "You can't load any more ores to this vehicle.");
		if((carid = Vehicle_Nearest2(playerid)) != -1)
		{
			if(pData[playerid][CarryingLog] == 0)
			{
				pvData[carid][cMetal] += 1;
			}
			else if(pData[playerid][CarryingLog] == 1)
			{
				pvData[carid][cCoal] += 1;
			}
		}
		LogStorage[vehicleid][ pData[playerid][CarryingLog] ]++;
		Info(playerid, "MINING: Loaded %s.", type);
		ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);
		Player_RemoveLog(playerid);
		DisablePlayerCheckpoint(playerid);
		return 1;
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 1)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 574)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint1))
			{
				SetPlayerCheckpoint(playerid, sweperpoint2, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint2))
			{
				SetPlayerCheckpoint(playerid, sweperpoint3, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint3))
			{
				SetPlayerCheckpoint(playerid, sweperpoint4, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint4))
			{
				SetPlayerCheckpoint(playerid, sweperpoint5, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint5))
			{
				SetPlayerCheckpoint(playerid, sweperpoint6, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint6))
			{
				SetPlayerCheckpoint(playerid, sweperpoint7, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint7))
			{
				SetPlayerCheckpoint(playerid, sweperpoint8, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint8))
			{
				SetPlayerCheckpoint(playerid, sweperpoint9, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint9))
			{
				SetPlayerCheckpoint(playerid, sweperpoint10, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint10))
			{
				SetPlayerCheckpoint(playerid, sweperpoint11, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint11))
			{
				SetPlayerCheckpoint(playerid, sweperpoint12, 7.0);
				//GameTextForPlayer(playerid, "~g~Bersih!", 1000, 3);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,sweperpoint12))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSideJobTime] = 600;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Sweeper)", 150);
				Info(playerid, "Sidejob(Sweeper) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pSideJobTime] = 900;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 200);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	//DisablePlayerCheckpoint(playerid);
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(pData[playerid][CarryingLumber])
		{
			Player_DropLumber(playerid);
		}
		else if(pData[playerid][CarryingLog] == 0)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping metal ore.");
			DisablePlayerCheckpoint(playerid);
		}
		else if(pData[playerid][CarryingLog] == 1)
		{
			Player_DropLog(playerid, pData[playerid][CarryingLog]);
			Info(playerid, "You dropping coal ore.");
			DisablePlayerCheckpoint(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return Error(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return Error(playerid, "This door only for family.");
				}
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return Error(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return Error(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					pData[playerid][pInDoor] = did;
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bIntposX] == 0.0 && bData[bid][bIntposY] == 0.0 && bData[bid][bIntposZ] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");
					
				pData[playerid][pInBiz] = bid;
				SetPlayerPositionEx(playerid, bData[bid][bIntposX], bData[bid][bIntposY], bData[bid][bIntposZ], bData[bid][bIntposA]);
				
				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, bData[inbisnisid][bIntposX], bData[inbisnisid][bIntposY], bData[inbisnisid][bIntposZ]))
		{
			pData[playerid][pInBiz] = -1;
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtposX], bData[inbisnisid][bExtposY], bData[inbisnisid][bExtposZ], bData[inbisnisid][bExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ], fData[fid][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
				//pData[playerid][pInBiz] = -1;
			}
        }
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "You got tased for %d secounds!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	//Vehicle
	if((newkeys & KEY_YES ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "engine");
		}
	}
	if((newkeys & KEY_NO ))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::v(playerid, "lights");
		}
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Kamu terlalu banyak minum.");
	   	}
	   	else
	   	{
	   		pData[playerid][pBladder] -= 1;
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(PRESSED( KEY_FIRE ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
		{
			foreach(new did : Doors)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
							return Error(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

						if(dData[did][dLocked])
							return Error(playerid, "This entrance is locked at the moment.");
							
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
						if(dData[did][dFamily] > 0)
						{
							if(dData[did][dFamily] != pData[playerid][pFamily])
								return Error(playerid, "This door only for family.");
						}
						
						if(dData[did][dVip] > pData[playerid][pVip])
							return Error(playerid, "Your VIP level not enough to enter this door.");
						
						if(dData[did][dAdmin] > pData[playerid][pAdmin])
							return Error(playerid, "Your admin level not enough to enter this door.");
							
						if(strlen(dData[did][dPass]))
						{
							new params[256];
							if(sscanf(params, "s[256]", params)) return Usage(playerid, "/enter [password]");
							if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
							
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
						else
						{
							if(dData[did][dCustom])
							{
								SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							else
							{
								SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
							}
							pData[playerid][pInDoor] = did;
							SetPlayerInterior(playerid, dData[did][dIntint]);
							SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
							SetCameraBehindPlayer(playerid);
							SetPlayerWeather(playerid, 0);
						}
					}
				}
				if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
				{
					if(dData[did][dGarage] == 1)
					{
						if(dData[did][dFaction] > 0)
						{
							if(dData[did][dFaction] != pData[playerid][pFaction])
								return Error(playerid, "This door only for faction.");
						}
					
						if(dData[did][dCustom])
						{
							SetVehiclePositionEx(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						else
						{
							SetVehiclePosition(playerid, GetPlayerVehicleID(playerid), dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
						}
						pData[playerid][pInDoor] = -1;
						SetPlayerInterior(playerid, dData[did][dExtint]);
						SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
						SetCameraBehindPlayer(playerid);
						SetPlayerWeather(playerid, WorldWeather);
					}
				}
			}
		}
	}
	//if(IsKeyJustDown(KEY_CTRL_BACK,newkeys,oldkeys))
	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			ClearAnimations(playerid);
			StopLoopingAnim(playerid);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
    }
	if(IsKeyJustDown(KEY_SECONDARY_ATTACK, newkeys, oldkeys))
	{
		if(GetPVarInt(playerid, "UsingSprunk"))
		{
			DeletePVar(playerid, "UsingSprunk");
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_PASSENGER)
	{
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
			
		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
		
        TextDrawHideForPlayer(playerid, TDEditor_TD[5]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[6]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[7]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[8]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[9]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[10]);
		
		TextDrawHideForPlayer(playerid, TDEditor_TD[11]);
		TextDrawHideForPlayer(playerid, DPvehfare[playerid]);
		
		//HBE textdraw Simple
		PlayerTextDrawHide(playerid, SPvehname[playerid]);
        PlayerTextDrawHide(playerid, SPvehengine[playerid]);
        PlayerTextDrawHide(playerid, SPvehspeed[playerid]);
		
		TextDrawHideForPlayer(playerid, TDEditor_TD[16]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[17]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[18]);
		
		if(pData[playerid][pTaxiDuty] == 1)
		{
			pData[playerid][pTaxiDuty] = 0;
			SetPlayerColor(playerid, COLOR_WHITE);
			Servers(playerid, "You are no longer on taxi duty!");
		}
		if(pData[playerid][pFare] == 1)
		{
			KillTimer(pData[playerid][pFareTimer]);
			Info(playerid, "Anda telah menonaktifkan taxi fare pada total: {00FF00}%s", FormatMoney(pData[playerid][pTotalFare]));
			pData[playerid][pFare] = 0;
			pData[playerid][pTotalFare] = 0;
		}
        
		HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
		
        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		/*if(IsSRV(vehicleid))
		{
			new tstr[128], price = GetVehicleCost(GetVehicleModel(vehicleid));
			format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "LG_E"%s", GetVehicleName(vehicleid), FormatMoney(price));
			ShowPlayerDialog(playerid, DIALOG_BUYPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
		}
		else if(IsVSRV(vehicleid))
		{
			new tstr[128], price = GetVipVehicleCost(GetVehicleModel(vehicleid));
			if(pData[playerid][pVip] == 0)
			{
				Error(playerid, "Kendaraan Khusus VIP Player.");
				RemovePlayerFromVehicle(playerid);
				//SetVehicleToRespawn(GetPlayerVehicleID(playerid));
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
			else
			{
				format(tstr, sizeof(tstr), ""WHITE_E"Anda akan membeli kendaraan "PINK_E"%s "WHITE_E"dengan harga "YELLOW_E"%d Coin", GetVehicleName(vehicleid), price);
				ShowPlayerDialog(playerid, DIALOG_BUYVIPPV, DIALOG_STYLE_MSGBOX, "Private Vehicles", tstr, "Buy", "Batal");
			}
		}*/
		
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						Error(playerid, "This bike is locked by owner.");
						return 1;
					}
				}
			}
		}
		
		if(IsASweeperVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_SWEEPER, DIALOG_STYLE_MSGBOX, "Side Job - Sweeper", "Anda akan bekerja sebagai pembersih jalan?", "Start Job", "Close");
		}
		if(IsABusVeh(vehicleid))
		{
			ShowPlayerDialog(playerid, DIALOG_BUS, DIALOG_STYLE_MSGBOX, "Side Job - Bus", "Anda akan bekerja sebagai pengangkut penumpang bus?", "Start Job", "Close");
		}
		
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            Info(playerid, "Anda tidak memiliki surat izin mengemudi, berhati-hatilah.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[16]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[17]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[18]);
			
			PlayerTextDrawShow(playerid, SPvehname[playerid]);
			PlayerTextDrawShow(playerid, SPvehengine[playerid]);
			PlayerTextDrawShow(playerid, SPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][spfuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][spdamagebar]);
		}
		else if(pData[playerid][pHBEMode] == 2)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[5]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[6]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[7]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[8]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[9]);
			TextDrawShowForPlayer(playerid, TDEditor_TD[10]);
			
			PlayerTextDrawShow(playerid, DPvehname[playerid]);
			PlayerTextDrawShow(playerid, DPvehengine[playerid]);
			PlayerTextDrawShow(playerid, DPvehspeed[playerid]);
			ShowPlayerProgressBar(playerid, pData[playerid][fuelbar]);
			ShowPlayerProgressBar(playerid, pData[playerid][damagebar]);
		}
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{

	return 1;
}

public OnPlayerUpdate(playerid)
{
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 15);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 200)
            {
               Info(GetVehicleDriver(i), "This vehicle is low on fuel. You must visit a fuel station!");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				Iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}

public OnVehicleSpawn(vehicleid)
{
	foreach(new ii : PVehicles)
	{
		if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0)
		{
			/*if(pvData[ii][cClaim] != 0)
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
				{
					Info(pid, "Anda masih memiliki claim kendaraan, silahkan ambil di city hall!");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);
					
				return 1;
			}*/
			if(pvData[ii][cInsu] > 0)
    		{
				pvData[ii][cInsu]--;
				pvData[ii][cClaim] = 1;
				pvData[ii][cClaimTime] = gettime() + (1 * 86400);
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
            		Info(pid, "Kendaraan anda hancur dan anda masih memiliki insuransi, silahkan ambil di kantor sags setelah 24 jam.");
				}
				if(IsValidVehicle(pvData[ii][cVeh]))
					DestroyVehicle(pvData[ii][cVeh]);
				
				pvData[ii][cVeh] = 0;
			}
			else
			{
				foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
        		{
					new query[128];
					mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[pid][cID]);
					mysql_tquery(g_SQL, query);
					if(IsValidVehicle(pvData[ii][cVeh]))
						DestroyVehicle(pvData[ii][cVeh]);
            		Info(pid, "Kendaraan anda hancur dan tidak memiliki insuransi.");
					Iter_SafeRemove(PVehicles, ii, ii);
				}
			}
		}
	}
	return 1;
}

ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{	
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 350.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				GameTextForPlayer(playerid, "~r~Totalled!", 2500, 3);
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
				new Float:fDamage, fFuel, color1, color2;
				new tstr[64];
				
				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);
				
				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;
				
				fFuel = GetVehicleFuel(vehicleid);
				
				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;
				
				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, SPvehengine[playerid], "~r~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, SPvehengine[playerid], "~g~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][spfuelbar], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][spdamagebar], fDamage);

				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, SPvehname[playerid], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, SPvehspeed[playerid], tstr);
			}
			else if(pData[playerid][pHBEMode] == 2)
			{
				new Float:fDamage, fFuel, color1, color2;
				new tstr[64];
				
				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);
				
				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 1000.0) fDamage = 1000.0;
				
				fFuel = GetVehicleFuel(vehicleid);
				
				if(fFuel < 0) fFuel = 0;
				else if(fFuel > 1000) fFuel = 1000;
				
				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~r~OFF");
				}
				else
				{
					PlayerTextDrawSetString(playerid, DPvehengine[playerid], "~g~ON");
				}

				SetPlayerProgressBarValue(playerid, pData[playerid][fuelbar], fFuel);
				SetPlayerProgressBarValue(playerid, pData[playerid][damagebar], fDamage);

				format(tstr, sizeof(tstr), "%s", GetVehicleName(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehname[playerid], tstr);

				format(tstr, sizeof(tstr), "%.0f Mph", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, DPvehspeed[playerid], tstr);
				
				/*if(GetVehicleModel(vehicleid) != GetPVarInt(playerid, "veh_model"))
				{
					PlayerTextDrawSetPreviewModel(playerid, DPvehmodel[playerid], GetVehicleModel(vehicleid));
					PlayerTextDrawSetPreviewVehCol(playerid, DPvehmodel[playerid], color1, color2);
					PlayerTextDrawShow(playerid, DPvehmodel[playerid]);
					SetPVarInt(playerid, "veh_model", GetVehicleModel(vehicleid));
				}*/
			}
			else
			{
			
			}
		}
	}
}

ptask PlayerUpdate[999](playerid)
{
	//Anti-Cheat Vehicle health hack
	for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
    {
        new Float:health;
        GetVehicleHealth(v, health);
        if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
        {
			if(GetPlayerVehicleID(playerid) == v)
			{
				new playerState = GetPlayerState(playerid);
				if(playerState == PLAYER_STATE_DRIVER)
				{
					SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
					SendClientMessageToAllEx(COLOR_RED, "Anti-Cheat: "GREY2_E"%s have been auto kicked for vehicle health hack!", pData[playerid][pName]);
					KickEx(playerid);
				}
			}
        }
        if(VehicleHealthSecurity[v] == true)
        {
            VehicleHealthSecurity[v] = false;
        }
        VehicleHealthSecurityData[v] = health;
    }
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	//Anti Armour Hacks
	new Float:A;
	GetPlayerArmour(playerid, A);
	if(A > 98)
	{
		SetPlayerArmourEx(playerid, 0);
		SendClientMessageToAllEx(COLOR_RED, "Anti-Cheat: "GREY2_E"%s(%i) has been auto kicked for armour hacks!", pData[playerid][pName], playerid);
		KickEx(playerid);
	}
	//Weapon AC
	if(pData[playerid][pSpawned] == 1)
    {
        if(GetPlayerWeapon(playerid) != pData[playerid][pWeapon])
        {
            pData[playerid][pWeapon] = GetPlayerWeapon(playerid);

            if(pData[playerid][pWeapon] >= 1 && pData[playerid][pWeapon] <= 45 && pData[playerid][pWeapon] != 40 && pData[playerid][pWeapon] != 2 && pData[playerid][pGuns][g_aWeaponSlots[pData[playerid][pWeapon]]] != GetPlayerWeapon(playerid))
            {
                SendAdminMessage(COLOR_RED, "%s(%d) has possibly used weapon hacks (%s), Please to check /spec this player first!", pData[playerid][pName], playerid, ReturnWeaponName(pData[playerid][pWeapon]));
                //SendClientMessageToAllEx(COLOR_RED, "BotCmd: %s was kicked by BOT. Reason: used weapon hacks (%s).", pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                SetWeapons(playerid); //Reload old weapons
				//KickEx(playerid);
                //Log_Write("logs/cheat_log.txt", "[%s] %s has possibly used weapon hacks (%s).", ReturnDate(), pData[playerid][pName], ReturnWeaponName(pData[playerid][pWeapon]));
                //return 1;
            }
        }
    }
	//Weapon Atth
	if(NetStats_GetConnectedTime(playerid) - WeaponTick[playerid] >= 250)
	{
		static weaponid, ammo, objectslot, count, index;
 
		for (new i = 2; i <= 7; i++) //Loop only through the slots that may contain the wearable weapons
		{
			GetPlayerWeaponData(playerid, i, weaponid, ammo);
			index = weaponid - 22;
		   
			if (weaponid && ammo && !WeaponSettings[playerid][index][Hidden] && IsWeaponWearable(weaponid) && EditingWeapon[playerid] != weaponid)
			{
				objectslot = GetWeaponObjectSlot(weaponid);
 
				if (GetPlayerWeapon(playerid) != weaponid)
					SetPlayerAttachedObject(playerid, objectslot, GetWeaponModel(weaponid), WeaponSettings[playerid][index][Bone], WeaponSettings[playerid][index][Position][0], WeaponSettings[playerid][index][Position][1], WeaponSettings[playerid][index][Position][2], WeaponSettings[playerid][index][Position][3], WeaponSettings[playerid][index][Position][4], WeaponSettings[playerid][index][Position][5], 1.0, 1.0, 1.0);
 
				else if (IsPlayerAttachedObjectSlotUsed(playerid, objectslot)) RemovePlayerAttachedObject(playerid, objectslot);
			}
		}
		for (new i = 4; i <= 8; i++) if (IsPlayerAttachedObjectSlotUsed(playerid, i))
		{
			count = 0;
 
			for (new j = 22; j <= 38; j++) if (PlayerHasWeapon(playerid, j) && GetWeaponObjectSlot(j) == i)
				count++;
 
			if(!count) RemovePlayerAttachedObject(playerid, i);
		}
		WeaponTick[playerid] = NetStats_GetConnectedTime(playerid);
	}
	
	//Player Update Online Data
	//GetPlayerHealth(playerid, pData[playerid][pHealth]);
    //GetPlayerArmour(playerid, pData[playerid][pArmour]);
	
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
		if(pData[playerid][pBladder] > 100)
		{
			pData[playerid][pBladder] = 100;
		}
		if(pData[playerid][pBladder] < 0)
		{
			pData[playerid][pBladder] = 0;
		}
		/*if(pData[playerid][pHealth] > 100)
		{
			SetPlayerHealthEx(playerid, 100);
		}*/
	}
	
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		SetPlayerProgressBarValue(playerid, pData[playerid][sphungrybar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][sphungrybar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][spenergybar], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][spenergybar], ConvertHBEColor(pData[playerid][pEnergy]));
		SetPlayerProgressBarValue(playerid, pData[playerid][spbladdybar], pData[playerid][pBladder]);
		SetPlayerProgressBarColour(playerid, pData[playerid][spbladdybar], ConvertHBEColor(pData[playerid][pBladder]));
	}
	else if(pData[playerid][pHBEMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		SetPlayerProgressBarValue(playerid, pData[playerid][hungrybar], pData[playerid][pHunger]);
		SetPlayerProgressBarColour(playerid, pData[playerid][hungrybar], ConvertHBEColor(pData[playerid][pHunger]));
		SetPlayerProgressBarValue(playerid, pData[playerid][energybar], pData[playerid][pEnergy]);
		SetPlayerProgressBarColour(playerid, pData[playerid][energybar], ConvertHBEColor(pData[playerid][pEnergy]));
		SetPlayerProgressBarValue(playerid, pData[playerid][bladdybar], pData[playerid][pBladder]);
		SetPlayerProgressBarColour(playerid, pData[playerid][bladdybar], ConvertHBEColor(pData[playerid][pBladder]));
		new strings[64], tstr[64];
		format(strings, sizeof(strings), "%s", pData[playerid][pName]);
		PlayerTextDrawSetString(playerid, DPname[playerid], strings);
		PlayerTextDrawShow(playerid, DPname[playerid]);
		format(tstr, sizeof(tstr), "Gold: %d", pData[playerid][pGold]);
		PlayerTextDrawSetString(playerid, DPcoin[playerid], tstr);
		PlayerTextDrawShow(playerid, DPcoin[playerid]);
		PlayerTextDrawSetString(playerid, DPmoney[playerid], FormatMoney(GetPlayerMoney(playerid)));
		PlayerTextDrawShow(playerid, DPmoney[playerid]);
		/*if(GetPlayerSkin(playerid) != GetPVarInt(playerid, "hbe_skin"))
		{
			PlayerTextDrawSetPreviewModel(playerid, DPskin[playerid], GetPlayerSkin(playerid));
			PlayerTextDrawShow(playerid, DPskin[playerid]);
			SetPVarInt(playerid, "hbe_skin", GetPlayerSkin(playerid));
		}*/
	}
	else
	{
	
	}
	
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, -2028.32, -92.87, 1067.43, 275.78, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, -2024.67, -93.13, 1066.78);
			SetPlayerCameraLookAt(playerid, -2028.32, -92.87, 1067.43);
			ResetPlayerWeaponsEx(playerid);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 50;
			pData[playerid][pEnergy] = 50;
			pData[playerid][pBladder] = 50;
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -150);
			SetPlayerHealthEx(playerid, 50);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar $150 kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
			
			SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new mstr[64];
        format(mstr, sizeof(mstr), "/death for spawn to hospital");
		InfoTD_MSG(playerid, 1000, mstr);
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 150)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            else if(pData[playerid][pHunger] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 120)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            else if(pData[playerid][pEnergy] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pEnergyTime] = 0;
        }
        if(++ pData[playerid][pBladderTime] >= 100)
        {
            if(pData[playerid][pBladder] > 0)
            {
                pData[playerid][pBladder]--;
            }
            else if(pData[playerid][pBladder] <= 0)
            {
                //SetPlayerHealth(playerid, health - 10);
          		//SetPlayerDrunkLevel(playerid, 8000);
          		pData[playerid][pSick] = 1;
            }
            pData[playerid][pBladderTime] = 0;
        }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					SetPlayerDrunkLevel(playerid, 8000);
					ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,1,1);
					Info(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					SetPlayerHealth(playerid, hp - 3);
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be unjail in ~w~%d ~b~~h~seconds.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1482.0356,-1724.5726,13.5469,750, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			SendClientMessageToAllEx(COLOR_RED, "Server: "GREY2_E" %s(%d) have been un-jailed by the server. (times up)", pData[playerid][pName], playerid);
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~You will be released in ~w~%d ~b~~h~seconds.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1526.69, -1678.05, 5.89, 267.76, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			Info(playerid, "You have been auto release. (times up)");
		}
	}
}

/*
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
    if (dialogid == 0) 
	{
        if (response) 
		{
            SetPlayerSkin(playerid, listitem);
            GameTextForPlayer(playerid, "~g~Skin Changed!", 3000, 3);
        }
    }
	if(dialogid == 1) 
	{
		if (response) 
		{
			if (GetPlayerMoney(playerid) < WEAPON_SHOP[listitem][WEAPON_PRICE]) 
			{
				SendClientMessage(playerid, 0xAA0000FF, "Not enough money to purchase this gun!");
				return callcmd::weapons(playerid);
			}
			
			GivePlayerMoney(playerid, -WEAPON_SHOP[listitem][WEAPON_PRICE]);
			GivePlayerWeapon(playerid, WEAPON_SHOP[listitem][WEAPON_ID], WEAPON_SHOP[listitem][WEAPON_AMMO]);
			
			GameTextForPlayer(playerid, "~g~Gun Purchased!", 3000, 3);
		}
	}
    return 1;
} */