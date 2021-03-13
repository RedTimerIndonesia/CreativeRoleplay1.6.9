new PlayersInJob[MAX_PLAYERS];
new Constructor[MAX_PLAYERS];
new Mescla[MAX_PLAYERS];
new Oldskin2[MAX_PLAYERS];
new carConstructor[2];
new obrero1, obrero2, obrero3;

function PlayersToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);

		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi))) {
			return 1;
		}
	}
	return 0;
}

CreatePointBuilder()
{
	CreateDynamicObject(16317,-2045.4228500,250.0506000,33.6999600,0.0000000,0.0000000,105.1200000);
	CreateDynamicObject(11010,-2047.5931400,303.2439000,40.1397200,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(9618,-2027.2752700,298.4577000,45.4836000,0.0000000,0.0000000,273.0000000);
	CreateDynamicObject(9817,-2027.4805900,298.3765900,45.5223500,0.0000000,0.0000000,-86.0000000);
	CreateDynamicObject(9361,-2073.3432600,213.0565300,37.1063800,0.0000000,0.0000000,135.0000000);
	CreateDynamicObject(15037,-2071.0981400,213.4631200,34.9468000,0.0000000,0.0000000,168.0000000);
	CreateDynamicObject(1702,-2075.0278300,210.6733400,34.6057000,0.0000000,0.0000000,178.0000000);
	CreateDynamicObject(2196,-2070.4455600,213.9948900,35.3558100,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2894,-2071.0039100,213.1021000,35.3616000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2200,-2069.7009300,210.6899700,34.7407000,0.0000000,0.0000000,179.0000000);
	CreateDynamicObject(2427,-2072.3356900,210.1186100,34.7315000,0.0000000,0.0000000,178.0000000);
	CreateDynamicObject(1736,-2072.4355500,210.3427000,36.4335000,0.0000000,0.0000000,175.0000000);
	CreateDynamicObject(1819,-2075.8796400,211.9547000,34.7341000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(1702,-2077.4233400,214.0963900,34.6057000,0.0000000,0.0000000,0.0000000);
	CreateDynamicObject(2690,-2074.0048800,209.9333600,36.2589000,0.0000000,0.0000000,91.0000000);
	CreateDynamicObject(3472,-2075.4834000,215.8594100,34.9217000,0.0000000,0.0000000,40.0000000);
	CreateDynamicObject(17050,-2028.3393600,302.1193800,29.9562000,0.0000000,0.0000000,280.0000000);
	CreateDynamicObject(17050,-2017.4615500,303.1171900,34.0074000,0.0000000,0.0000000,280.0000000);

	obrero1 = CreateDynamicPickup(1239, 23, -2070.4971,211.5426,35.7314, -1);////te pones uniforme y empiezas
	// ObreroCP1 = CreateDynamicCP(-2070.4971, 211.5426, 35.7314, 2.5, -1, -1, -1, 5.0);
	obrero2 = CreateDynamicPickup(1239, 23, -2073.0662,210.3388,35.7314, -1);///tequitas uniforme
	// ObreroCP2 = CreateDynamicCP(-2073.0662, 210.3388, 35.7314, 2.5, -1, -1, -1, 5.0);
	obrero3 = CreateDynamicPickup(1239, 23, -2071.45, 225.67, 36.10, -1);///letrero de bienvenida en la entrada llegando a la obra
	// ObreroCP3 = CreateDynamicCP(-2071.45, 225.67, 36.10, 2.5, -1, -1, -1, 5.0);
	Create3DTextLabel("[BUILDER]\nHere you ask for a job and wear a uniform.",0x0000FFAA,-2073.0662,210.3388,35.7314,20.0,0, 1);
	Create3DTextLabel("[BUILDER]\nUniform deliveries and get paid here.",0x0000FFAA,-2070.4971,211.5426,35.7314,20.0,0, 1);
	Create3DTextLabel("[BUILDER]\nWelcome to Builder go to the office to apply for a job.",0x0000FFAA,-2035.3964,231.3907,35.0084,20.0,0, 1);
	carConstructor[0] = AddStaticVehicleEx(486, -2087.9299, 261.1356, 35.9089, 309.0000, -1, -1, 100);//borren ya que cualquiera puede suar
	carConstructor[1] = AddStaticVehicleEx(524, -2088.8799, 250.3840, 36.6111, 0.0000, -1, -1, 100);///estos dos vehiculos o agregen segun su gm
}