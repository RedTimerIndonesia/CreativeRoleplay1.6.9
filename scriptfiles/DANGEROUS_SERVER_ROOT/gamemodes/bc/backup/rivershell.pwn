#include <a_samp.inc>
#undef MAX_PLAYERS
#define MAX_PLAYERS			500
#include <fixes.inc>
#include <a_mysql.inc>
#include <a_actor.inc>
#include <a_zones.inc>
#include <CTime.inc>
#include <mapfix.inc>
#include <gvar.inc>
#include <easyDialog.inc>
#include <progress2.inc>
#include <izcmd.inc>
#include <mSelection.inc>
#include <TimestampToDate.inc>
#include <EVF.inc>
#include <streamer.inc>
#include <sscanf2.inc>

// MySQL configuration
#define		MYSQL_HOST 			"127.0.0.1"
#define		MYSQL_USER 			"root"
#define		MYSQL_PASSWORD 		""
#define		MYSQL_DATABASE 		"new"

// how many seconds until it kicks the player for taking too long to login
#define		SECONDS_TO_LOGIN 	60

#define 	DEFAULT_POS_X 		1958.3783
#define 	DEFAULT_POS_Y 		1343.1572
#define 	DEFAULT_POS_Z 		15.3746
#define 	DEFAULT_POS_A 		270.1425

// MySQL connection handle
new MySQL: D_SQL;

#define function%0(%1) forward %0(%1); public %0(%1)

static SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
    static
        args,
            str[144];

    /*
         *  Custom function that uses #emit to format variables into a string.
         *  This code is very fragile; touching any code here will cause crashing!
    */
    if((args = numargs()) == 3)
    {
            SendClientMessage(playerid, color, text);
    }
    else
    {
        while (--args >= 3)
        {
            #emit LCTRL 5
            #emit LOAD.alt args
            #emit SHL.C.alt 2
            #emit ADD.C 12
            #emit ADD
            #emit LOAD.I
            #emit PUSH.pri
        }
        #emit PUSH.S text
        #emit PUSH.C 144
        #emit PUSH.C str
        #emit PUSH.S 8
        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessage(playerid, color, str);

        #emit RETN
    }
    return 1;
}

static SendClientMessageToAllEx(color, const text[], {Float, _}:...)
{
    static
        args,
            str[144];

    /*
         *  Custom function that uses #emit to format variables into a string.
         *  This code is very fragile; touching any code here will cause crashing!
    */
    if((args = numargs()) == 2)
    {
            SendClientMessageToAll(color, text);
    }
    else
    {
        while (--args >= 2)
        {
            #emit LCTRL 5
            #emit LOAD.alt args
            #emit SHL.C.alt 2
            #emit ADD.C 12
            #emit ADD
            #emit LOAD.I
            #emit PUSH.pri
        }
        #emit PUSH.S text
        #emit PUSH.C 144
        #emit PUSH.C str
        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri
        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessageToAll(color, str);

        #emit RETN
    }
    return 1;
}

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

// player data
enum PLAYER_DATA
{
	pID,
	pUsername[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	pIP[16],
	pPassword[65], // the output of SHA256_PassHash function (which was added in 0.3.7 R1 version) is always 256 bytes in length, or the equivalent of 64 Pawn cells
	pSalt[17],
	pEmail[24],
	pAdmin,
	pHelper,
	pLevel,
	pLevelup,
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
	pInt,
	pWorld,
	Float:pPosX,
	Float:pPosY,
	Float:pPosZ,
	Float:pPosA,
	Float:pHealth,
    Float:pArmour,
	pHunger,
	pBladder,
	pEnergy,
	pHungerTime,
	pEnergyTime,
	pBladderTime,
	pSick,
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
	pKtp,
	pKtpTime,
	pSim,
	pSimTime,
	pGuns[13],
    pAmmo[13],
	//Not Save Player
	pSpawn,
	pEditingItem[32 char],
	pProductModify,
    Cache: Cache_ID,
	LoginAttempts,
	LoginTimer,
    bool:IsLoggedIn
};
new pData[MAX_PLAYERS][PLAYER_DATA];

ResetVariables(playerid)
{
	for(new i; PLAYER_DATA:i < PLAYER_DATA; i++)
	{
    	pData[playerid][PLAYER_DATA:i] = 0;
	}
}

new g_MysqlRaceCheck[MAX_PLAYERS];

main() {}

#include "COLOR.pwn"

public OnGameModeInit()
{
	new MySQLOpt: option_id = mysql_init_options();

	mysql_set_option(option_id, AUTO_RECONNECT, true); // it automatically reconnects when loosing connection to mysql server

	D_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id); // AUTO_RECONNECT is enabled for this connection handle only
	if (D_SQL == MYSQL_INVALID_HANDLE || mysql_errno(D_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit"); // close the server if there is no connection
		return 1;
	}

	print("MySQL connection is successful.");

	// if the table has been created, the "SetupPlayerTable" function does not have any purpose so you may remove it completely
	SetupPlayerTable();
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	return 1;
}

public OnGameModeExit()
{
	// save all player data before closing connection
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) // GetPlayerPoolSize function was added in 0.3.7 version and gets the highest playerid currently in use on the server
	{
		if (IsPlayerConnected(i))
		{
			// reason is set to 1 for normal 'Quit'
			OnPlayerDisconnect(i, 1);
		}
	}

	mysql_close(D_SQL);
	return 1;
}

public OnPlayerConnect(playerid)
{
	g_MysqlRaceCheck[playerid]++;

	// reset player data
	ResetVariables(playerid);
	//static const empty_player[E_PLAYERS];
	//pData[playerid] = empty_player;

	GetPlayerName(playerid, pData[playerid][pUsername], MAX_PLAYER_NAME);

	// send a query to recieve all the stored player data from the table
	new query[103];
	mysql_format(D_SQL, query, sizeof query, "SELECT * FROM `players` WHERE `username` = '%e' LIMIT 1", pData[playerid][pUsername]);
	mysql_tquery(D_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	g_MysqlRaceCheck[playerid]++;

	UpdatePlayerData(playerid);

	// if the player was kicked (either wrong password or taking too long) during the login part, remove the data from the memory
	if (cache_is_valid(pData[playerid][Cache_ID]))
	{
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
	}

	// if the player was kicked before the time expires (30 seconds), kill the timer
	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	// sets "IsLoggedIn" to false when the player disconnects, it prevents from saving the player data twice when "gmx" is used
	pData[playerid][IsLoggedIn] = false;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// spawn the player to their last saved position
	pData[playerid][pSpawn] = 1;
	SetPlayerHealth(playerid, 100.0);
	SetPlayerArmour(playerid, 0.0);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	TogglePlayerControllable(playerid, 0);
	SetCameraBehindPlayer(playerid);
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
			SetPlayerPos(playerid, 1716.1129, -1880.0715, -10.0);
			SetPlayerCameraPos(playerid,1755.0413,-1824.8710,20.2100);
			SetPlayerCameraLookAt(playerid,1716.1129,-1880.0715,22.0264);
			SetPlayerVirtualWorld(playerid, 0);
			Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
		}
		else
		{
			SetTimerEx("SpawnTimer", 3000, false, "d", playerid);
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				//SetFactionColor(playerid);
			}
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
	SetPlayerSkin(playerid, pData[playerid][pSkin]);
	if(pData[playerid][pOnDuty] >= 1)
	{
		SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
		//SetFactionColor(playerid);
	}
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	TogglePlayerControllable(playerid, 1);
	return 1;
}

Dialog:DIALOG_AGE(playerid, response, listitem, inputtext[])
{
    if(!response) return Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
    if(response)
    {
        new
            iDay,
            iMonth,
            iYear,
            day,
            month,
            year;
            
        getdate(year, month, day);

        static const
                arrMonthDays[] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        if(sscanf(inputtext, "p</>ddd", iDay, iMonth, iYear)) {
            Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error! Invalid Input\nMasukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
        }
        else if(iYear < 1900 || iYear > year) {
            Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tahun Lahir", "Error! Invalid Input\nMasukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
        }
        else if(iMonth < 1 || iMonth > 12) {
            Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Bulan Lahir", "Error! Invalid Input\nMasukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
        }
        else if(iDay < 1 || iDay > arrMonthDays[iMonth - 1]) {
            Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Error! Invalid Input\nMasukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
        }
        else 
		{
            format(pData[playerid][pAge], 50, inputtext);
			Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Gender", "1. Male/Laki-Laki\n2. Female/Perempuan", "Pilih", "Batal");
        }
    }
    else Dialog_Show(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun):", "Pilih", "Batal");
    return 1;
}

Dialog:DIALOG_GENDER(playerid, response, listitem, inputtext[])
{
    if(!response) return Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Gender", "1. Male/Laki-Laki\n2. Female/Perempuan", "Pilih", "Batal");
    if(response)
    {
        pData[playerid][pGender] = listitem + 1;
        switch (listitem) 
		{
            case 0: 
			{
				SendClientMessageEx(playerid,COLOR_WHITE,"Server : Registrasi Berhasil! Terima kasih telah bergabung ke dalam server!");
				SendClientMessageEx(playerid,COLOR_WHITE,"Server : Tanggal Lahir : %s | Gender : Male/Laki-Laki", pData[playerid][pAge]);
                switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SpawnMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SpawnFemale, "Choose your skin");
                }
			}
            case 1: 
			{
                SendClientMessageEx(playerid,COLOR_WHITE,"Registrasi Berhasil! Terima kasih telah bergabung ke dalam server!");
				SendClientMessageEx(playerid,COLOR_WHITE,"Server : Tanggal Lahir : %s | Gender : Female/Perempuan", pData[playerid][pAge]);
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SpawnMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SpawnFemale, "Choose your skin");
                }
            }
        }
		//SetPlayerPosition(playerid, 1744.3411, -1862.8655, 13.3983, 10.0);
        pData[playerid][pSkin] = (listitem) ? (233) : (98);
        SetPlayerSkin(playerid,pData[playerid][pSkin]);
		pData[playerid][pMoney] = 100000;
    }
    else Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Gender", "1. Male/Laki-Laki\n2. Female/Perempuan", "Pilih", "Batal");
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
			SetTimerEx("SpawnTimer", 1000, false, "d", playerid);
		}
    }
	if(listid == SpawnFemale)
    {
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
			SetTimerEx("SpawnTimer", 1000, false, "d", playerid);
		}
    }
	/*//Locker Faction Skin
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
	//Bisnis buy skin clothes
	if(listid == MaleSkins)
    {
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerCash(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid, 0), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Tax_Percent(price);
            Bisnis_Save(bizid);
            Tax_AddPercent(price);
			Servers(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
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
			GivePlayerCash(playerid, -price);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid, 0), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Tax_Percent(price);
            Bisnis_Save(bizid);
            Tax_AddPercent(price);
			Servers(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
    }
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerCash(playerid, -price);
			if(!PurchasedToy[playerid]) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][toySelected[playerid]][toy_model] = modelid;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			Dialog_Show(playerid, TOY_BUY_POSISI, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Select", "Cancel");
			
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid, 0), modelid, FormatMoney(price));
            bData[bizid][bProd]--;
            bData[bizid][bMoney] += Tax_Percent(price);
            Bisnis_Save(bizid);
            Tax_AddPercent(price);
		}
		else return Servers(playerid, "Canceled buy toys");
	}*/
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	//UpdatePlayerDeaths(playerid);
//	UpdatePlayerKills(killerid);
	return 1;
}

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[])
{
	if (!response) return Kick(playerid);

	new hashed_pass[65];
	SHA256_PassHash(inputtext, pData[playerid][pSalt], hashed_pass, 65);

	if (strcmp(hashed_pass, pData[playerid][pPassword]) == 0)
	{
		//correct password, spawn the player
		Dialog_Show(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have been successfully logged in.", "Okay", "");

		// sets the specified cache as the active cache so we can retrieve the rest player data
		cache_set_active(pData[playerid][Cache_ID]);

		AssignPlayerData(playerid);

		// remove the active cache from memory and unsets the active cache as well
		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;

		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
		pData[playerid][IsLoggedIn] = true;

		// spawn the player to their last saved position after login
		SetSpawnInfo(playerid, NO_TEAM, pData[playerid][pSkin], pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
	}
	else
	{
		pData[playerid][LoginAttempts]++;

		if (pData[playerid][LoginAttempts] >= 3)
		{
			Dialog_Show(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have mistyped your password too often (3 times).", "Okay", "");
			DelayedKick(playerid);
		}
		else Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Wrong password!\nPlease enter your password in the field below:", "Login", "Abort");
	}
	return 1;
}

IsValidPassword(const name[])
{
	new len = strlen(name);

	for(new ch = 0; ch != len; ch++)
	{
		switch(name[ch])
		{
			case 'A' .. 'Z', 'a' .. 'z', '0' .. '9', ']', '[', '(', ')', '_', '.', '@', '#': continue;
			default: return false;
		}
	}
	return true;
}

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[])
{
	if (!response) return Kick(playerid);

	if(strlen(inputtext) == 0)
	{
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");
	}
	if(!(3 < strlen(inputtext) < 18))
	{
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");
	}
	if(!IsValidPassword(inputtext))
	{
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");
	}
	// 16 random characters from 33 to 126 (in ASCII) for the salt
	for (new i = 0; i < 16; i++) pData[playerid][pSalt][i] = random(94) + 33;
	SHA256_PassHash(inputtext, pData[playerid][pSalt], pData[playerid][pPassword], 65);

	new query[512], PlayerIP[128];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	mysql_format(D_SQL, query, sizeof query, "INSERT INTO `players` (`username`, `password`, `salt`, `IP`, `reg_date`, `last_login`) VALUES ('%e', '%s', '%e', '%s', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP())", pData[playerid][pUsername], pData[playerid][pPassword], pData[playerid][pSalt], PlayerIP);
	mysql_tquery(D_SQL, query, "OnPlayerRegister", "d", playerid);
	
	return 1;
}

//-----------------------------------------------------

forward OnPlayerDataLoaded(playerid, race_check);
public OnPlayerDataLoaded(playerid, race_check)
{
	if (race_check != g_MysqlRaceCheck[playerid]) return Kick(playerid);

	new string[115];
	if(cache_num_rows() > 0)
	{
		// we store the password and the salt so we can compare the password the player inputs
		// and save the rest so we won't have to execute another query later
		cache_get_value(0, "password", pData[playerid][pPassword], 65);
		cache_get_value(0, "salt", pData[playerid][pSalt], 17);

		// saves the active cache in the memory and returns an cache-id to access it for later use
		pData[playerid][Cache_ID] = cache_save();

		format(string, sizeof string, "This account (%s) is registered. Please login by entering your password in the field below:", pData[playerid][pUsername]);
		Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", string, "Login", "Abort");

		// from now on, the player has 30 seconds to login
		pData[playerid][LoginTimer] = SetTimerEx("OnLoginTimeout", SECONDS_TO_LOGIN * 1000, false, "d", playerid);
	}
	else
	{
		format(string, sizeof string, "Welcome %s, you can register by entering your password in the field below:", pData[playerid][pUsername]);
		Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", string, "Register", "Abort");
	}
	return 1;
}

forward OnLoginTimeout(playerid);
public OnLoginTimeout(playerid)
{
	// reset the variable that stores the timerid
	pData[playerid][LoginTimer] = 0;

	Dialog_Show(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Login", "You have been kicked for taking too long to login successfully to your account.", "Okay", "");
	DelayedKick(playerid);
	return 1;
}

forward OnPlayerRegister(playerid);
public OnPlayerRegister(playerid)
{
	// retrieves the ID generated for an AUTO_INCREMENT column by the sent query
	pData[playerid][pID] = cache_insert_id();

	Dialog_Show(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Registration", "Account successfully registered, you have been automatically logged in.", "Okay", "");

	pData[playerid][IsLoggedIn] = true;

	pData[playerid][pPosX] = DEFAULT_POS_X;
	pData[playerid][pPosY] = DEFAULT_POS_Y;
	pData[playerid][pPosZ] = DEFAULT_POS_Z;
	pData[playerid][pPosA] = DEFAULT_POS_A;
	
	SetSpawnInfo(playerid, NO_TEAM, 0, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
	SpawnPlayer(playerid);
	return 1;
}

forward _KickPlayerDelayed(playerid);
public _KickPlayerDelayed(playerid)
{
	Kick(playerid);
	return 1;
}


//-----------------------------------------------------

AssignPlayerData(playerid)
{	
	new aname[128], email[128], age[128], ip[128], regdate[50], lastlogin[50];
	
	cache_get_value_int(0, "ID", pData[playerid][pID]);
	cache_get_value(0, "adminname", aname);
	format(pData[playerid][pAdminname], 128, "%s", aname);
	cache_get_value(0, "IP", ip);
	format(pData[playerid][pIP], 128, "%s", ip);
	cache_get_value(0, "email", email);
	format(pData[playerid][pEmail], 128, "%s", email);
	cache_get_value_int(0, "admin", pData[playerid][pAdmin]);
	cache_get_value_int(0, "helper", pData[playerid][pHelper]);
	cache_get_value_int(0, "level", pData[playerid][pLevel]);
	cache_get_value_int(0, "levelup", pData[playerid][pLevelup]);
	cache_get_value_int(0, "vip", pData[playerid][pVip]);
	cache_get_value_int(0, "vip_time", pData[playerid][pVipTime]);
	cache_get_value_int(0, "coin", pData[playerid][pCoin]);
	cache_get_value(0, "reg_date", regdate);
	format(pData[playerid][pRegDate], 128, "%s", regdate);
	cache_get_value(0, "last_login", lastlogin);
	format(pData[playerid][pLastLogin], 128, "%s", lastlogin);
	cache_get_value_int(0, "money", pData[playerid][pMoney]);
	cache_get_value_int(0, "bmoney", pData[playerid][pBankMoney]);
	cache_get_value_int(0, "brek", pData[playerid][pBankRek]);
	cache_get_value_int(0, "hours", pData[playerid][pHours]);
	cache_get_value_int(0, "minutes", pData[playerid][pMinutes]);
	cache_get_value_int(0, "seconds", pData[playerid][pSeconds]);
	cache_get_value_int(0, "skin", pData[playerid][pSkin]);
	cache_get_value_int(0, "facskin", pData[playerid][pFacSkin]);
	cache_get_value_int(0, "gender", pData[playerid][pGender]);
	cache_get_value(0, "age", age);
	format(pData[playerid][pAge], 128, "%s", age);
	cache_get_value_int(0, "indoor", pData[playerid][pInDoor]);
	cache_get_value_int(0, "inhouse", pData[playerid][pInHouse]);
	cache_get_value_int(0, "inbiz", pData[playerid][pInBiz]);
	cache_get_value_int(0, "interior", pData[playerid][pInt]);
	cache_get_value_int(0, "world", pData[playerid][pWorld]);
	cache_get_value_float(0, "pPosX", pData[playerid][pPosX]);
	cache_get_value_float(0, "pPosY", pData[playerid][pPosY]);
	cache_get_value_float(0, "pPosZ", pData[playerid][pPosZ]);
	cache_get_value_float(0, "ppPosA", pData[playerid][pPosA]);
	cache_get_value_float(0, "health", pData[playerid][pHealth]);
	cache_get_value_float(0, "armour", pData[playerid][pArmour]);
	cache_get_value_int(0, "hunger", pData[playerid][pHunger]);
	cache_get_value_int(0, "bladder", pData[playerid][pBladder]);
	cache_get_value_int(0, "energy", pData[playerid][pEnergy]);
	cache_get_value_int(0, "sick", pData[playerid][pSick]);
	cache_get_value_int(0, "hospital", pData[playerid][pHospital]);
	cache_get_value_int(0, "injured", pData[playerid][pInjured]);
	cache_get_value_int(0, "duty", pData[playerid][pOnDuty]);
	cache_get_value_int(0, "faction", pData[playerid][pFaction]);
	cache_get_value_int(0, "factionrank", pData[playerid][pFactionRank]);
	cache_get_value_int(0, "family", pData[playerid][pFamily]);
	cache_get_value_int(0, "familyrank", pData[playerid][pFamilyRank]);
	cache_get_value_int(0, "jail", pData[playerid][pJail]);
	cache_get_value_int(0, "arrest", pData[playerid][pArrest]);
	cache_get_value_int(0, "arrest_time", pData[playerid][pArrestTime]);
	cache_get_value_int(0, "warn", pData[playerid][pWarn]);
	cache_get_value_int(0, "job", pData[playerid][pJob]);
	cache_get_value_int(0, "job2", pData[playerid][pJob2]);
	cache_get_value_int(0, "mask", pData[playerid][pMask]);
	cache_get_value_int(0, "helmet", pData[playerid][pHelmet]);
	cache_get_value_int(0, "snack", pData[playerid][pSnack]);
	cache_get_value_int(0, "sprunk", pData[playerid][pSprunk]);
	cache_get_value_int(0, "gas", pData[playerid][pGas]);
	cache_get_value_int(0, "bandage", pData[playerid][pBandage]);
	cache_get_value_int(0, "material", pData[playerid][pMaterial]);
	cache_get_value_int(0, "ktp", pData[playerid][pKtp]);
	cache_get_value_int(0, "ktp_time", pData[playerid][pKtpTime]);
	cache_get_value_int(0, "sim", pData[playerid][pSim]);
	cache_get_value_int(0, "sim_time", pData[playerid][pSimTime]);
	
	cache_get_value_int(0, "Gun1", pData[playerid][pGuns][0]);
	cache_get_value_int(0, "Gun2", pData[playerid][pGuns][1]);
	cache_get_value_int(0, "Gun3", pData[playerid][pGuns][2]);
	cache_get_value_int(0, "Gun4", pData[playerid][pGuns][3]);
	cache_get_value_int(0, "Gun5", pData[playerid][pGuns][4]);
	cache_get_value_int(0, "Gun6", pData[playerid][pGuns][5]);
	cache_get_value_int(0, "Gun7", pData[playerid][pGuns][6]);
	cache_get_value_int(0, "Gun8", pData[playerid][pGuns][7]);
	cache_get_value_int(0, "Gun9", pData[playerid][pGuns][8]);
	cache_get_value_int(0, "Gun10", pData[playerid][pGuns][9]);
	cache_get_value_int(0, "Gun11", pData[playerid][pGuns][10]);
	cache_get_value_int(0, "Gun12", pData[playerid][pGuns][11]);
	cache_get_value_int(0, "Gun13", pData[playerid][pGuns][12]);
	
	cache_get_value_int(0, "Ammo1", pData[playerid][pAmmo][0]);
	cache_get_value_int(0, "Ammo2", pData[playerid][pAmmo][1]);
	cache_get_value_int(0, "Ammo3", pData[playerid][pAmmo][2]);
	cache_get_value_int(0, "Ammo4", pData[playerid][pAmmo][3]);
	cache_get_value_int(0, "Ammo5", pData[playerid][pAmmo][4]);
	cache_get_value_int(0, "Ammo6", pData[playerid][pAmmo][5]);
	cache_get_value_int(0, "Ammo7", pData[playerid][pAmmo][6]);
	cache_get_value_int(0, "Ammo8", pData[playerid][pAmmo][7]);
	cache_get_value_int(0, "Ammo9", pData[playerid][pAmmo][8]);
	cache_get_value_int(0, "Ammo10", pData[playerid][pAmmo][9]);
	cache_get_value_int(0, "Ammo11", pData[playerid][pAmmo][10]);
	cache_get_value_int(0, "Ammo12", pData[playerid][pAmmo][11]);
	cache_get_value_int(0, "Ammo13", pData[playerid][pAmmo][12]);
	return 1;
}

DelayedKick(playerid, time = 500)
{
	SetTimerEx("_KickPlayerDelayed", time, false, "d", playerid);
	return 1;
}

SetupPlayerTable()
{
	mysql_tquery(D_SQL, "CREATE TABLE IF NOT EXISTS `players` (`id` int(11) NOT NULL AUTO_INCREMENT,`username` varchar(24) NOT NULL,`password` char(64) NOT NULL,`salt` char(16) NOT NULL,`kills` mediumint(8) NOT NULL DEFAULT '0',`deaths` mediumint(8) NOT NULL DEFAULT '0',`x` float NOT NULL DEFAULT '0',`y` float NOT NULL DEFAULT '0',`z` float NOT NULL DEFAULT '0',`angle` float NOT NULL DEFAULT '0',`interior` tinyint(3) NOT NULL DEFAULT '0', PRIMARY KEY (`id`), UNIQUE KEY `username` (`username`))");
	return 1;
}

UpdatePlayerData(playerid)
{
	if (pData[playerid][IsLoggedIn] == false) return 0;
	
	new cQuery[2048], PlayerIP[128];
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pInt] = GetPlayerInterior(playerid);
	pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);
//	UpdateWeapons(playerid);

    format(cQuery, sizeof(cQuery), "UPDATE `players` SET `username`='%s',`adminname`='%s', `IP`='%s',`email`='%s',admin=%d,helper=%d,level=%d,levelup=%d,vip=%d,vip_time=%d,coin=%d,money=%d,bmoney=%d,brek=%d,hours=%d,minutes=%d,seconds=%d,skin=%d,facskin=%d,gender=%d,age='%s',indoor=%d,inhouse=%d,inbiz=%d,interior=%d,world=%d,posx='%f',posy='%f',posz='%f',posa='%f'",
	pData[playerid][pUsername],
	pData[playerid][pAdminname],
	PlayerIP,
	pData[playerid][pEmail],
	pData[playerid][pAdmin],
	pData[playerid][pHelper],
	pData[playerid][pLevel],
	pData[playerid][pLevelup],
	pData[playerid][pVip],
	pData[playerid][pVipTime],
	pData[playerid][pCoin],
	pData[playerid][pMoney],
	pData[playerid][pBankMoney],
	pData[playerid][pBankRek],
	pData[playerid][pHours],
	pData[playerid][pMinutes],
	pData[playerid][pSeconds],
	pData[playerid][pSkin],
	pData[playerid][pFacSkin],
	pData[playerid][pGender],
	pData[playerid][pAge],
	pData[playerid][pInDoor],
	pData[playerid][pInHouse],
	pData[playerid][pInBiz],
	pData[playerid][pInt],
	pData[playerid][pWorld],
	pData[playerid][pPosX],
	pData[playerid][pPosY],
	pData[playerid][pPosZ],
	pData[playerid][pPosA]);
	
	for (new i = 0; i < 13; i ++) {
        format(cQuery, sizeof(cQuery), "%s, `Gun%d` = '%d', `Ammo%d` = '%d'", cQuery, i + 1, pData[playerid][pGuns][i], i + 1, pData[playerid][pAmmo][i]);
    }
	
	format(cQuery, sizeof(cQuery), "%s, health='%f',armour='%f',hunger=%d,bladder=%d,energy=%d,sick=%d,hospital=%d,injured=%d,duty=%d,faction=%d,factionrank=%d,family=%d,familyrank=%d,jail=%d,arrest=%d,arrest_time=%d,warn=%d,job=%d,job2=%d,mask=%d,helmet=%d,snack=%d,sprunk=%d,gas=%d,bandage=%d,material=%d,ktp=%d,ktp_time=%d,sim=%d,sim_time=%d,last_login=CURRENT_TIMESTAMP() WHERE ID=%d",
	cQuery,
	pData[playerid][pHealth],
	pData[playerid][pArmour],
	pData[playerid][pHunger],
	pData[playerid][pBladder],
	pData[playerid][pEnergy],
	pData[playerid][pSick],
	pData[playerid][pHospital],
	pData[playerid][pInjured],
	pData[playerid][pOnDuty],
	pData[playerid][pFaction],
	pData[playerid][pFactionRank],
	pData[playerid][pFamily],
	pData[playerid][pFamilyRank],
	pData[playerid][pJail],
	pData[playerid][pArrest],
	pData[playerid][pArrestTime],
	pData[playerid][pWarn],
	pData[playerid][pJob],
	pData[playerid][pJob2],
	pData[playerid][pMask],
	pData[playerid][pHelmet],
	pData[playerid][pSnack],
	pData[playerid][pSprunk],
	pData[playerid][pGas],
	pData[playerid][pBandage],
	pData[playerid][pMaterial],
	pData[playerid][pKtp],
	pData[playerid][pKtpTime],
	pData[playerid][pSim],
	pData[playerid][pSimTime],
	pData[playerid][pID]);
	mysql_tquery(D_SQL, cQuery);
	return 1;
}