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
//#include "./map/ext_newdealer.pwn"
//#include "./map/ext_showroom.pwn"
#include "./map/ext_showroomsimple.pwn"
//#include "./map/ext_mc.pwn"	//Mechanic Center
#include "./map/ext_newmc2.pwn"
#include "./map/ext_mcblueberry.pwn"
#include "./map/ext_gasstation.pwn"
//#include "./map/ext_ws_vinewood.pwn"	//WS vinewood
#include "./map/ext_minernew.pwn"	//WS vinewood
#include "./map/ext_production.pwn"
#include "./map/ext_adminjail.pwn"
//#include "./map/ext_spawn.pwn"
//#include "./map/ext_party.pwn"
#include "./map/ext_taxi.pwn"

//#include "./map/ext_newdrag.pwn"
#include "./map/ext_bisnisrobert.pwn"

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
#include "./map/int_pengadilan.pwn"

//Gangs/Fam
//#include "./map/gangs/ext_gangs1.pwn"
//#include "./map/gangs/ext_gangs2.pwn"
#include "./map/gangs/ext_gangsrobert.pwn"
#include "./map/gangs/ext_gangsganton.pwn"

#include "./map/gangs/int_gangsrobert.pwn"


#include "./map/gangs/int_gangs1.pwn"
#include "./map/gangs/int_gangs2.pwn"
#include "./map/gangs/int_gangs3.pwn"
#include "./map/gangs/int_gangs4.pwn"
#include "./map/gangs/int_gangs5.pwn"
#include "./map/gangs/int_gangs6.pwn"
#include "./map/gangs/int_gangs7.pwn"
#include "./map/gangs/int_gangs8.pwn"

//Large
#include "./map/large/int_large1.pwn"
#include "./map/large/int_large2.pwn"
#include "./map/large/int_large3.pwn"
#include "./map/large/int_large4.pwn"
#include "./map/large/int_large5.pwn"

//Medium
#include "./map/medium/int_medium1.pwn"
#include "./map/medium/int_medium2.pwn"
#include "./map/medium/int_medium3.pwn"
//#include "./map/medium/int_medium4.pwn"

//Small
#include "./map/small/int_small1.pwn"
#include "./map/small/int_small2.pwn"
#include "./map/small/int_small3.pwn"
//#include "./map/small/int_small4.pwn"

RemoveVendingMachines(playerid)
{
	RemoveBuildingForPlayer(playerid, 956, 1634.1487,-2238.2810,13.5077, 20.0); //Snack vender @ LS Airport
	RemoveBuildingForPlayer(playerid, 956, 2480.9885,-1958.5117,13.5831, 20.0); //Snack vender @ Sushi Shop in Willowfield
	RemoveBuildingForPlayer(playerid, 955, 1729.7935,-1944.0087,13.5682, 20.0); //Sprunk machine @ Unity Station
	RemoveBuildingForPlayer(playerid, 955, 2060.1099,-1898.4543,13.5538, 20.0); //Sprunk machine opposite Tony's Liqour in Willowfield
	RemoveBuildingForPlayer(playerid, 955, 2325.8708,-1645.9584,14.8270, 20.0); //Sprunk machine @ Ten Green Bottles
	RemoveBuildingForPlayer(playerid, 955, 1153.9130,-1460.8893,15.7969, 20.0); //Sprunk machine @ Market
	RemoveBuildingForPlayer(playerid, 955,1788.3965,-1369.2336,15.7578, 20.0); //Sprunk machine in Downtown Los Santos
	RemoveBuildingForPlayer(playerid, 955, 2352.9939,-1357.1105,24.3984, 20.0); //Sprunk machine @ Liquour shop in East Los Santos
	RemoveBuildingForPlayer(playerid, 1775, 2224.3235,-1153.0692,1025.7969, 20.0); //Sprunk machine @ Jefferson Motel
	RemoveBuildingForPlayer(playerid, 956, 2140.2566,-1161.7568,23.9922, 20.0); //Snack machine @ pick'n'go market in Jefferson
	RemoveBuildingForPlayer(playerid, 956, 2154.1199,-1015.7635,62.8840, 20.0); //Snach machine @ Carniceria El Pueblo in Las Colinas
	RemoveBuildingForPlayer(playerid, 956, 662.5665,-551.4142,16.3359, 20.0); //Snack vender at Dillimore Gas Station
	RemoveBuildingForPlayer(playerid, 955, 200.2010,-107.6401,1.5513, 20.0); //Sprunk machine @ Blueberry Safe House
	RemoveBuildingForPlayer(playerid, 956, 2271.4666,-77.2104,26.5824, 20.0); //Snack machine @ Palomino Creek Library
	RemoveBuildingForPlayer(playerid, 955, 1278.5421,372.1057,19.5547, 20.0); //Sprunk machine @ Papercuts in Montgomery
	RemoveBuildingForPlayer(playerid, 955, 1929.5527,-1772.3136,13.5469, 20.0); //Sprunk machine @ Idlewood Gas Station
 
	//San Fierro
	RemoveBuildingForPlayer(playerid, 1302, -2419.5835,984.4185,45.2969, 20.0); //Soda machine 1 @ Juniper Hollow Gas Station
	RemoveBuildingForPlayer(playerid, 1209, -2419.5835,984.4185,45.2969, 20.0); //Soda machine 2 @ Juniper Hollow Gas Station
	RemoveBuildingForPlayer(playerid, 956, -2229.2075,287.2937,35.3203, 20.0); //Snack vender @ King's Car Park
	RemoveBuildingForPlayer(playerid, 955, -1349.3947,493.1277,11.1953, 20.0); //Sprunk machine @ SF Aircraft Carrier
	RemoveBuildingForPlayer(playerid, 956, -1349.3947,493.1277,11.1953, 20.0); //Snack vender @ SF Aircraft Carrier
	RemoveBuildingForPlayer(playerid, 955, -1981.6029,142.7232,27.6875, 20.0); //Sprunk machine @ Cranberry Station
	RemoveBuildingForPlayer(playerid, 955, -2119.6245,-422.9411,35.5313, 20.0); //Sprunk machine 1/2 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2097.3696,-397.5220,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2068.5593,-397.5223,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2039.8802,-397.5214,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2011.1403,-397.5225,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2005.7861,-490.8688,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2034.5267,-490.8681,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2063.1875,-490.8687,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
	RemoveBuildingForPlayer(playerid, 955, -2091.9780,-490.8684,35.5313, 20.0); //Sprunk machine 3 @ SF Stadium
 
	//Las Venturas
	RemoveBuildingForPlayer(playerid, 956, -1455.1298,2592.4138,55.8359, 20.0); //Snack vender @ El Quebrados GONE
	RemoveBuildingForPlayer(playerid, 955, -252.9574,2598.9048,62.8582, 20.0); //Sprunk machine @ Las Payasadas GONE
	RemoveBuildingForPlayer(playerid, 956, -252.9574,2598.9048,62.8582, 20.0); //Snack vender @ Las Payasadas GONE
	RemoveBuildingForPlayer(playerid, 956, 1398.7617,2223.3606,11.0234, 20.0); //Snack vender @ Redsands West GONE
	RemoveBuildingForPlayer(playerid, 955, -862.9229,1537.4246,22.5870, 20.0); //Sprunk machine @ The Smokin' Beef Grill in Las Barrancas GONE
	RemoveBuildingForPlayer(playerid, 955, -14.6146,1176.1738,19.5634, 20.0); //Sprunk machine @ Fort Carson GONE
	RemoveBuildingForPlayer(playerid, 956, -75.2839,1227.5978,19.7360, 20.0); //Snack vender @ Fort Carson GONE
	RemoveBuildingForPlayer(playerid, 955, 1519.3328,1055.2075,10.8203, 20.0); //Sprunk machine @ LVA Freight Department GONE
	RemoveBuildingForPlayer(playerid, 956, 1659.5096,1722.1096,10.8281, 20.0); //Snack vender near Binco @ LV Airport GONE
	RemoveBuildingForPlayer(playerid, 955, 2086.5872,2071.4958,11.0579, 20.0); //Sprunk machine @ Sex Shop on The Strip
	RemoveBuildingForPlayer(playerid, 955, 2319.9001,2532.0376,10.8203, 20.0); //Sprunk machine @ Pizza co by Julius Thruway (North)
	RemoveBuildingForPlayer(playerid, 955, 2503.2061,1244.5095,10.8203, 20.0); //Sprunk machine @ Club in the Camels Toe
	RemoveBuildingForPlayer(playerid, 956, 2845.9919,1294.2975,11.3906, 20.0); //Snack vender @ Linden Station
 
	//Interiors: 24/7 and Clubs
	RemoveBuildingForPlayer(playerid, 1775, 496.0843,-23.5310,1000.6797, 20.0); //Sprunk machine 1 @ Club in Camels Toe
	RemoveBuildingForPlayer(playerid, 1775, 501.1219,-2.1968,1000.6797, 20.0); //Sprunk machine 2 @ Club in Camels Toe
	RemoveBuildingForPlayer(playerid, 1776, 501.1219,-2.1968,1000.6797, 20.0); //Snack vender @ Club in Camels Toe
	RemoveBuildingForPlayer(playerid, 1775, -19.2299,-57.0460,1003.5469, 20.0); //Sprunk machine @ Roboi's type 24/7 stores
	RemoveBuildingForPlayer(playerid, 1776, -35.9012,-57.1345,1003.5469, 20.0); //Snack vender @ Roboi's type 24/7 stores
	RemoveBuildingForPlayer(playerid, 1775, -17.0036,-90.9709,1003.5469, 20.0); //Sprunk machine @ Other 24/7 stores
	RemoveBuildingForPlayer(playerid, 1776, -17.0036,-90.9709,1003.5469, 20.0); //Snach vender @ Others 24/7 stores
}

public OnPlayerConnect(playerid)
{
	RemoveVendingMachines(playerid);
	
	RemoveExtSamdAsghBack(playerid);
	//RemoveExtAsgh(playerid);
	RemoveExtSapd(playerid);
	RemoveExtShowroom(playerid);
	//RemoveExtNewDealer(playerid);
	//RemoveExtMc(playerid);
	RemoveExtNewMC2(playerid);
	RemoveExtMCBlueberry(playerid);
	//RemoveExtWsVinewood(playerid);
	RemoveExtProduction(playerid);
	//RemoveExtNewCityHall(playerid);
	//RemoveExtSpawn(playerid);
	RemoveExtTaxi(playerid);
	
	RemoveExtBisnisRobert(playerid);
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
	Streamer_MaxItems(STREAMER_TYPE_OBJECT, 990000);
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
	CreateExtShowroom();
	//CreateExtNewDealer();
	//CreateExtMc();
	CreateExtNewMC2();
	CreateExtMCBlueberry();
	CreateExtGasStation();
	//CreateExtWsVineWood();
	CreateExtMiner();
	CreateExtProduction();
	CreateExtAdminJail();
	//CreateExtParty();
	//CreateExtNewCityHall();
	//CreateExtSpawn();
	CreateExtTaxi();
	
	//CreateExtDrag();
	CreateExtBisnisRobert();
	
	//Interior
	CreateIntSapd();
	CreateIntBank();
	CreateIntSamd();
	//CreateIntSamdAsgh();
	CreateIntSana();
	CreateIntSanaStudio();
	CreateIntSags();
	CreateIntVip();
	CreateIntPengadilan();
	
	//Gangs/Fams
	//CreateExtGangs1();
	//CreateExtGangs2();
	CreateExtGangsRobert();
	CreateExtGangsGanton();
	
	CreateIntGangsRobert();
	
	CreateIntGangs1();
	CreateIntGangs2();
	CreateIntGangs3();
	CreateIntGangs4();
	CreateIntGangs5();
	CreateIntGangs6();
	CreateIntGangs7();
	CreateIntGangs8();
	
	CreateIntLarge1();
	CreateIntLarge2();
	CreateIntLarge3();
	CreateIntLarge4();
	CreateIntLarge5();
	
	CreateIntMedium1();
	CreateIntMedium2();
	CreateIntMedium3();
	
	CreateIntSmall1();
	CreateIntSmall2();
	CreateIntSmall3();
	return 1;
}