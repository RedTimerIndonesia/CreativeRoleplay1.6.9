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
#include <crashdetect.inc> 
#include <fixes.inc>
#include <gvar.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
#include <mapfix.inc>
#include <CTime.inc>
#include <gvar.inc>
#include <easyDialog.inc>
#include <progress2.inc>
//#include <izcmd.inc>
#include <Pawn.CMD.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg.inc>
#include <EVF2.inc>
#include <YSI\y_timers>
#include <streamer.inc>
#include <sscanf2.inc>
#include <cuff.inc>
#include <yom_buttons.inc>
#include <PreviewModelDialog2.inc>
//#include <keypadtxd.inc>
//#include <SIF/button.inc>
//#include <SIF/door.inc>

//-----[ Modular ]-----
#include "DEFINE.pwn"


//----------[ New Variable ]-----

// Server Uptime
new up_days,
	up_hours,
	up_minutes,
	up_seconds;

//Model Selection 
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID;
	
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
	SAPDLobbyDoor[4];

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
	pEmail[24],
	pAdmin,
	pHelper,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pCoin,
	pRegDate[50],
	pLastLogin[50],
	pMoney,
	pBankMoney,
	pBankRek,
	pHours,
	pMinutes,
	pSeconds,
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
	pFaction,
	pFactionRank,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pMask,
	pHelmet,
	pSnack,
	pSprunk,
	pGas,
	pBandage,
	pMaterial,
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
	//Not Save
	Cache: Cache_ID,
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
	Text3D:pAdoTag,
	bool:pAdoActive,
	pTrackCar,
	pTrackHouse,
	pTrackBisnis,
	pFacInvite,
	pFacOffer,
	pCuffed,
	pOnDutyTime,
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
	pRefull,
	pHideHBE,
	pHideSpeedo,
	//Player Progress Bar
	PlayerBar:fuelbar,
	PlayerBar:damagebar,
	PlayerBar:hungrybar,
	PlayerBar:energybar,
	PlayerBar:bladdybar
};
new pData[MAX_PLAYERS][E_PLAYERS];

new g_MysqlRaceCheck[MAX_PLAYERS];

//-----[ Modular ]-----
main() {}
#include "COLOR.pwn"
#include "TEXTDRAW.pwn"
#include "WEAPON_ATTH.pwn"
#include "TOYS.pwn"
#include "PRIVATE_VEHICLE.pwn"
#include "DOOR.pwn"
#include "FAMILY.pwn"
#include "HOUSE.pwn"
#include "BISNIS.pwn"
#include "DYNAMIC_LOCKER.pwn"
#include "NATIVE.pwn"
#include "FUNCTION.pwn"
#include "DIALOG.pwn"
#include "CMD\ADMIN.pwn"
#include "CMD\FACTION.pwn"
#include "CMD\PLAYER.pwn"

#include "CMD\ALIAS\ALIAS_ADMIN.pwn"

public OnGameModeInit()
{
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

	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	
	CreateTextDraw();
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
	SetNameTagDrawDistance(10.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(0);
	SetWorldTime(10);
	SetWeather(24);
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
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
	
	new strings[128];
	CreateDynamicPickup(1239, 23, 1392.77, -22.25, 1000.97, -1);
	format(strings, sizeof(strings), "[ID-Card]\n{FFFFFF}/newidcard to create new ID Card");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1392.77, -22.25, 1000.97, 5.0); // ID Card
	
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
	
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
	printf("[Object] Number of Dynamic objects loaded: %d", CountDynamicObjects());
	return 1;
}

public OnGameModeExit()
{
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}

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
	return 1;
}


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
	// Anti-Caps
	if(GetPVarType(playerid, "Caps"))
		UpperToLower(text);
	new lstr[1024];
	format(lstr, sizeof(lstr), "%s says: %s", ReturnName(playerid), text);
	ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
	SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
	return 0;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (result == -1)
    {
        Error(playerid, "Unknow Command! /help for more info.");
        return 0;
    }
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	new PlayerIP[16];
	g_MysqlRaceCheck[playerid]++;
	ResetVariables(playerid);
	CreatePlayerTextDraws(playerid);
	TextDrawShowForPlayer(playerid, TextDate);
	TextDrawShowForPlayer(playerid, TextTime);
	
	GetPlayerName(playerid, pData[playerid][pName], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	
	pData[playerid][damagebar] = CreatePlayerProgressBar(playerid, 459.000000, 415.749938, 61.000000, 9.000000, 16711935, 1000.0, 0);
	pData[playerid][fuelbar] = CreatePlayerProgressBar(playerid, 459.500000, 432.083221, 61.000000, 9.000000, 16711935, 1000.0, 0);
                
	pData[playerid][hungrybar] = CreatePlayerProgressBar(playerid, 565.500000, 405.833404, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][energybar] = CreatePlayerProgressBar(playerid, 565.500000, 420.416717, 68.000000, 8.000000, 16711935, 100.0, 0);
	pData[playerid][bladdybar] = CreatePlayerProgressBar(playerid, 565.500000, 435.000091, 68.000000, 8.000000, 16711935, 100.0, 0);
	
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pName]);
	mysql_tquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);
	SendClientMessageToAllEx(COLOR_RED, "* %s(%d) "YELLOW_E"telah bergabung ke dalam server.", pData[playerid][pName], playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	g_MysqlRaceCheck[playerid]++;
	UpdatePlayerData(playerid);
	RemovePlayerVehicle(playerid);
	
	if (cache_is_valid(pData[playerid][Cache_ID]))
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	switch(reason)
	{
	    case 0:
		{
			SendClientMessageToAllEx(COLOR_RED, "* %s(%d) "YELLOW_E"telah meninggalkan server.(timeout/crash)", pData[playerid][pName], playerid);
		}
	    case 1:
		{
			SendClientMessageToAllEx(COLOR_RED, "* %s(%d) "YELLOW_E"telah meninggalkan server.(leaving)", pData[playerid][pName], playerid);
		}
	    case 2:
		{
	 		SendClientMessageToAllEx(COLOR_RED, "* %s(%d) "YELLOW_E"telah meninggalkan server.(kicked/banned)", pData[playerid][pName], playerid);
		}
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	
	if(pData[playerid][pHideHBE] == 0)
	{
		ShowPlayerProgressBar(playerid, pData[playerid][hungrybar]);
		ShowPlayerProgressBar(playerid, pData[playerid][energybar]);
		ShowPlayerProgressBar(playerid, pData[playerid][bladdybar]);
		for(new txd; txd < 5; txd++)
		{
			TextDrawShowForPlayer(playerid, TDEditor_TD[txd]);
		}
	}
	TextDrawShowForPlayer(playerid, SOIRP_TXD);
	SetPlayerSpawn(playerid);
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
			Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
		}
		else
		{
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			SetTimerEx("SpawnTimer", 3000, false, "d", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerColor(playerid, COLOR_WHITE);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	SetWeapons(playerid);
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	pData[playerid][pSpawned] = 1;
	AttachPlayerToys(playerid);
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
            bData[bizid][bMoney] += price;
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
            bData[bizid][bMoney] += price;
            Bisnis_Save(bizid);
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
			if(!pData[playerid][PurchasedToy]) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			Dialog_Show(playerid, TOY_BUY_POSISI, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli object ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += price;
            Bisnis_Save(bizid);
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	foreach(new ii : Player)
    {
        if(pData[ii][pAdmin] > 0)
        {
            SendDeathMessageToPlayer(ii, killerid, playerid, reason);
        }
    }
	return 1;
}

public OnPlayerEditAttachedObject( playerid, response, index, modelid, boneid,
                                   Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ,
                                   Float:fRotX, Float:fRotY, Float:fRotZ,
                                   Float:fScaleX, Float:fScaleY, Float:fScaleZ )
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if (response)
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
        EditingWeapon[playerid] = 0;
    }
	else
	{
		if(response)
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
		else
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

public OnPlayerEnterCheckpoint(playerid)
{
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis anda!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerCheckpoint(playerid);
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2]))
			{
				if(dData[did][dIntpos][0] == 0.0 && dData[did][dIntpos][1] == 0.0 && dData[did][dIntpos][2] == 0.0)
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

				if(dData[did][dCustom])
					SetPlayerPositionEx(playerid, dData[did][dIntpos][0], dData[did][dIntpos][1], dData[did][dIntpos][2], dData[did][dIntpos][3]);

				else
					SetPlayerPosition(playerid, dData[did][dIntpos][0], dData[did][dIntpos][1], dData[did][dIntpos][2], dData[did][dIntpos][3]);

				SetPlayerInterior(playerid, dData[did][dIntint]);
				SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
				SetCameraBehindPlayer(playerid);
				pData[playerid][pInDoor] = did;
				SetPlayerWeather(playerid, 24);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.5, dData[did][dIntpos][0], dData[did][dIntpos][1], dData[did][dIntpos][2]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
					SetPlayerPositionEx(playerid, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2], dData[did][dExtpos][3]);

				else
					SetPlayerPositionEx(playerid, dData[did][dExtpos][0], dData[did][dExtpos][1], dData[did][dExtpos][2], dData[did][dExtpos][3]);

				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				pData[playerid][pInDoor] = -1;
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtpos][0], hData[hid][hExtpos][1], hData[hid][hExtpos][2]))
			{
				if(hData[hid][hIntpos][0] == 0.0 && hData[hid][hIntpos][1] == 0.0 && hData[hid][hIntpos][2] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
					
				SetPlayerPositionEx(playerid, hData[hid][hIntpos][0], hData[hid][hIntpos][1], hData[hid][hIntpos][2], hData[hid][hIntpos][3]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				pData[playerid][pInHouse] = hid;
				SetPlayerWeather(playerid, 24);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.5, hData[inhouseid][hIntpos][0], hData[inhouseid][hIntpos][1], hData[inhouseid][hIntpos][2]))
		{
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtpos][0], hData[inhouseid][hExtpos][1], hData[inhouseid][hExtpos][2], hData[inhouseid][hExtpos][3]);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			pData[playerid][pInHouse] = -1;
		}
		//Bisnis
		foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[bid][bExtpos][0], bData[bid][bExtpos][1], bData[bid][bExtpos][2]))
			{
				if(bData[bid][bIntpos][0] == 0.0 && bData[bid][bIntpos][1] == 0.0 && bData[bid][bIntpos][2] == 0.0)
					return Error(playerid, "Interior bisnis masih kosong, atau tidak memiliki interior.");

				if(bData[bid][bLocked])
					return Error(playerid, "This bisnis is locked!");
					
				SetPlayerPositionEx(playerid, bData[bid][bIntpos][0], bData[bid][bIntpos][1], bData[bid][bIntpos][2], bData[bid][bIntpos][3]);

				SetPlayerInterior(playerid, bData[bid][bInt]);
				SetPlayerVirtualWorld(playerid, bid);
				SetCameraBehindPlayer(playerid);
				pData[playerid][pInBiz] = bid;
				SetPlayerWeather(playerid, 24);
			}
        }
		new inbisnisid = pData[playerid][pInBiz];
		if(pData[playerid][pInBiz] != -1 && IsPlayerInRangeOfPoint(playerid, 2.5, bData[inbisnisid][bIntpos][0], bData[inbisnisid][bIntpos][1], bData[inbisnisid][bIntpos][2]))
		{
			SetPlayerPositionEx(playerid, bData[inbisnisid][bExtpos][0], bData[inbisnisid][bExtpos][1], bData[inbisnisid][bExtpos][2], bData[inbisnisid][bExtpos][3]);

			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			pData[playerid][pInBiz] = -1;
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, fData[fid][fExtpos][0], fData[fid][fExtpos][1], fData[fid][fExtpos][2]))
			{
				if(fData[fid][fIntpos][0] == 0.0 && fData[fid][fIntpos][1] == 0.0 && fData[fid][fIntpos][2] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0 || pData[playerid][pFamily] == -1)
					return Error(playerid, "You dont have registered for this door!");
					
				SetPlayerPositionEx(playerid, fData[fid][fIntpos][0], fData[fid][fIntpos][1], fData[fid][fIntpos][2], fData[fid][fIntpos][3]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = fid;
				SetPlayerWeather(playerid, 24);
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.5, fData[fid][fIntpos][0], fData[fid][fIntpos][1], fData[fid][fIntpos][2]))
			{
				SetPlayerPositionEx(playerid, fData[fid][fExtpos][0], fData[fid][fExtpos][1], fData[fid][fExtpos][2], fData[fid][fExtpos][3]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				//pData[playerid][pInBiz] = -1;
			}
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
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
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
            RemoveFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemoveFromVehicle(playerid);
			
		PlayerTextDrawHide(playerid, DPvehname[playerid]);
        PlayerTextDrawHide(playerid, DPvehengine[playerid]);
        PlayerTextDrawHide(playerid, DPvehspeed[playerid]);
		
        TextDrawHideForPlayer(playerid, TDEditor_TD[5]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[6]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[7]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[8]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[9]);
		TextDrawHideForPlayer(playerid, TDEditor_TD[10]);
        
        HidePlayerProgressBar(playerid, pData[playerid][fuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][damagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            Info(playerid, "Anda tidak memiliki surat izin mengemudi, berhati-hatilah.");
        }
		
		if(pData[playerid][pHideSpeedo] == 0)
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
	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{

	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 35);

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
}

ptask PlayerVehicleUpdate[200](playerid)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid), Float:fHealth;
		GetVehicleHealth(vehicleid, fHealth);
		if(IsValidVehicle(vehicleid) && fHealth < 350.0)
		{
			SetValidVehicleHealth(vehicleid, 251.0);
			SwitchVehicleEngine(vehicleid, false);
			GameTextForPlayer(playerid, "~r~Totalled!", 2500, 3);
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(pData[playerid][pHideSpeedo] == 0)
		{
			new Float:fDamage, fFuel, color1, color2;
			new vehicleid = GetPlayerVehicleID(playerid), tstr[64];
			
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
		pData[playerid][pArmour] = 0;
		SendClientMessageToAllEx(COLOR_RED, "Anti-Cheat: "GREY2_E"%s(%i) has been auto kicked for armour hacks!", pData[playerid][pName], playerid);
		KickEx(playerid);
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
	GetPlayerHealth(playerid, pData[playerid][pHealth]);
    GetPlayerArmour(playerid, pData[playerid][pArmour]);
	
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
	if(pData[playerid][pHealth] > 100)
	{
		SetPlayerHealthEx(playerid, 100);
	}
	
	if(pData[playerid][pHideHBE] == 0 && pData[playerid][IsLoggedIn] == true)
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
		format(tstr, sizeof(tstr), "Coin: %d", pData[playerid][pCoin]);
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
	if(pData[playerid][pInjured] == 1)
    {
        if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 100)
            {
                Info(playerid, "Now you can spawn, type '/death' for spawn to hospital.");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
    }
	if(pData[playerid][pHospital] == 1)
    {
        pData[playerid][pHospitalTime]++;
		new mstr[64];
        format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

        ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);

        if(pData[playerid][pHospitalTime] >= 15)
        {
            SetPlayerPosition(playerid, 1182.8778, -1324.2023, 13.5784, 269.8747);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

			SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
            SendClientMessage(playerid, COLOR_WHITE, "Kamu telah keluar dari rumah sakit, kamu membayar $20.000 kerumah sakit.");
            SendClientMessage(playerid, COLOR_GREY, "--------------------------------------------------------------------------------------------------------");
			GivePlayerMoneyEx(playerid, -20000);
			SetPlayerHealthEx(playerid, 50);
			pData[playerid][pInjured] = 0;
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
        }
    }
	if(pData[playerid][pInjured] == 1 && GetPlayerAnimationIndex(playerid) != 388)
    {
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 100)
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
        if(++ pData[playerid][pEnergyTime] >= 80)
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
        if(++ pData[playerid][pBladderTime] >= 60)
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
}


/*enum E_WEAPON_SHOP_DATA {
    WEAPON_MODELID,
    WEAPON_NAME[35],
    WEAPON_PRICE,
    WEAPON_AMMO,
    WEAPON_ID
};

new const WEAPON_SHOP[][E_WEAPON_SHOP_DATA] = {
    {335, "Knife", 0, 1, WEAPON_KNIFE},
    {341, "Chainsaw", 1500, 1, WEAPON_CHAINSAW},
    {342, "Grenade", 1545, 1, WEAPON_GRENADE},
    {343, "Moltove", 1745, 1, WEAPON_MOLTOV},
    {347, "Silenced 9mm", 1500, 150, WEAPON_SILENCED},
    {348, "Desert Eagle", 3199, 150, WEAPON_DEAGLE},
    {350, "Sawed Off Shotgun", 4999, 100, WEAPON_SAWEDOFF},
    {351, "Spas12 Shotgun", 3870, 100, WEAPON_SHOTGSPA},
    {352, "Micro-UZI", 3500, 300, WEAPON_UZI},
    {353, "MP5", 2999, 200, WEAPON_MP5},
    {372, "Tec-9", 3500, 300, WEAPON_TEC9},
    {358, "Sniper Rifle", 4999, 50, WEAPON_SNIPER},
    {355, "Ak47", 2999, 200, WEAPON_AK47},
    {356, "M4", 3155, 200, WEAPON_M4},
    {359, "RPG", 1999, 1, WEAPON_ROCKETLAUNCHER},
    {361, "Flamethrower", 3500, 350, WEAPON_FLAMETHROWER},
    {362, "Minigun", 10000, 350, WEAPON_MINIGUN},
    {363, "Satchel Charge", 1999, 2, WEAPON_SATCHEL},
    {365, "Spray Can", 800, 200, WEAPON_SPRAYCAN},
    {366, "Fire Extinguisher", 855, 200, WEAPON_FIREEXTINGUISHER}
};

CMD:weapons(playerid) {
    new subString[64];
    static string[sizeof(WEAPON_SHOP) * sizeof(subString)];

    if (string[0] == EOS) {
        for (new i; i < sizeof(WEAPON_SHOP); i++) {
            format(subString, sizeof(subString), "%i(0.0, 0.0, -50.0, 1.5)\t%s~n~~g~~h~$%i\n", WEAPON_SHOP[i][WEAPON_MODELID], WEAPON_SHOP[i][WEAPON_NAME], WEAPON_SHOP[i][WEAPON_PRICE]);
            strcat(string, subString);
        }
    }

    return ShowPlayerDialog(playerid, 1, DIALOG_STYLE_PREVIEW_MODEL, "Weapon Shop Dialog", string, "Purchase", "Cancel");
}

CMD:skins(playerid) {
    const MAX_SKINS = 312;
    new subString[16];
    static string[MAX_SKINS * sizeof(subString)];

    if (string[0] == EOS) {
        for (new i; i < MAX_SKINS; i++) {
            format(subString, sizeof(subString), "%i\tID: %i\n", i, i);
            strcat(string, subString);
        }
    }
    return ShowPlayerDialog(playerid, 0, DIALOG_STYLE_PREVIEW_MODEL, "Skin Selection Dialog", string, "Select", "Cancel");
}

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