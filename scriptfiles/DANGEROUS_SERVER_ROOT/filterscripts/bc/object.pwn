#include <a_samp>
#include <streamer>

new tmpobjid;
//-------[ Map Include ]--------
//Exterior
//#include "./map/ext_sags.pwn"	//
//#include "./map/ext_asgh.pwn"	//
#include "./map/ext_sapd.pwn"	//
//#include "./map/ext_cityhall.pwn"	//
//#include "./map/ext_newcityhall.pwn"
#include "./map/ext_samd_asgh_back.pwn"
#include "./map/ext_sana.pwn"
//#include "./map/ext_ls_showroom.pwn"
#include "./map/ext_newdealer.pwn"
//#include "./map/ext_mc.pwn"	//Mechanic Center
#include "./map/ext_newmc.pwn"
//#include "./map/ext_ws_vinewood.pwn"	//WS vinewood
#include "./map/ext_minernew.pwn"	//WS vinewood
#include "./map/ext_production.pwn"
#include "./map/ext_adminjail.pwn"
#include "./map/ext_spawn.pwn"
//#include "./map/ext_party.pwn"

//Interior
#include "./map/int_bank.pwn"
#include "./map/int_sapd.pwn"
//#include "./map/int_samd_asgh.pwn"
#include "./map/int_newasgh.pwn"
#include "./map/int_sana.pwn"
#include "./map/int_sana_studio.pwn"
#include "./map/int_sags.pwn"
#include "./map/int_samd.pwn"
#include "./map/int_vip.pwn"

//Large
#include "./map/large/int_large1.pwn"
#include "./map/large/int_large2.pwn"
#include "./map/large/int_large3.pwn"
#include "./map/large/int_large4.pwn"
#include "./map/large/int_large5.pwn"

//Medium
#include "./map/medium/int_medium1.pwn"

//Small
#include "./map/small/int_small1.pwn"

public OnPlayerConnect(playerid)
{
	RemoveExtSamdAsghBack(playerid);
	//RemoveExtAsgh(playerid);
	RemoveExtSapd(playerid);
	//RemoveExtShowroom(playerid);
	RemoveExtNewDealer(playerid);
	//RemoveExtMc(playerid);
	RemoveExtNewMC(playerid);
	//RemoveExtWsVinewood(playerid);
	RemoveExtProduction(playerid);
	//RemoveExtNewCityHall(playerid);
	RemoveExtSpawn(playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnFilterScriptExit()
{
	DestroyAllDynamicObjects();
}

public OnFilterScriptInit()
{
	// Config
	Streamer_MaxItems(STREAMER_TYPE_OBJECT, 900000);
	Streamer_MaxItems(STREAMER_TYPE_CP, 200);
	Streamer_MaxItems(STREAMER_TYPE_MAP_ICON, 2000);
	Streamer_MaxItems(STREAMER_TYPE_PICKUP, 2000);
	for(new playerid = (GetMaxPlayers() - 1); playerid != -1; playerid--)
	{
		Streamer_DestroyAllVisibleItems(playerid, 0);
	}
	Streamer_VisibleItems(STREAMER_TYPE_OBJECT, 1000);
	
	//Exterior
	//CreateExtSags();
	//CreateExtCityhall();
	CreateExtSapd();
	CreateExtSana();
	//CreateExtAsgh();
	CreateIntNewASGH();
	CreateExtSamdAsghBack();
	//CreateExtShowroom();
	CreateExtNewDealer();
	//CreateExtMc();
	CreateExtNewMC();
	//CreateExtWsVineWood();
	CreateExtMiner();
	CreateExtProduction();
	CreateExtAdminJail();
	//CreateExtParty();
	//CreateExtNewCityHall();
	CreateExtSpawn();
	
	//Interior
	CreateIntSapd();
	CreateIntBank();
	CreateIntSamd();
	//CreateIntSamdAsgh();
	CreateIntSana();
	CreateIntSanaStudio();
	CreateIntSags();
	CreateIntVip();
	
	CreateIntLarge1();
	CreateIntLarge2();
	CreateIntLarge3();
	CreateIntLarge4();
	CreateIntLarge5();
	
	CreateIntMedium1();
	
	CreateIntSmall1();
	return 1;
}