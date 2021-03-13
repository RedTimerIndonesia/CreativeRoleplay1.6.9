
/*enum
{
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_WEAPONS
}*/

//----------[ Dialog Login Register]----------

Dialog:DIALOG_LOGIN(playerid, response, listitem, inputtext[])
{
	if (!response) return Kick(playerid);

	new hashed_pass[65];
	SHA256_PassHash(inputtext, pData[playerid][pSalt], hashed_pass, 65);

	if (strcmp(hashed_pass, pData[playerid][pPassword]) == 0)
	{
		Dialog_Show(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have been successfully logged in.", "Okay", "");

		cache_set_active(pData[playerid][Cache_ID]);

		AssignPlayerData(playerid);

		cache_delete(pData[playerid][Cache_ID]);
		pData[playerid][Cache_ID] = MYSQL_INVALID_CACHE;

		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
		pData[playerid][IsLoggedIn] = true;

		SetSpawnInfo(playerid, NO_TEAM, 0, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ], pData[playerid][pPosA], 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
	}
	else
	{
		pData[playerid][LoginAttempts]++;

		if (pData[playerid][LoginAttempts] >= 3)
		{
			Dialog_Show(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "Login", "You have mistyped your password too often (3 times).", "Okay", "");
			KickEx(playerid);
		}
		else Dialog_Show(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Wrong password!\nPlease enter your password in the field below:", "Login", "Abort");
	}
	return 1;
}

Dialog:DIALOG_REGISTER(playerid, response, listitem, inputtext[])
{
	if (!response) return Kick(playerid);
	
	if (strlen(inputtext) <= 5) return Dialog_Show(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Registration", "Your password must be longer than 5 characters!\nPlease enter your password in the field below:", "Register", "Abort");

	for (new i = 0; i < 16; i++) pData[playerid][pSalt][i] = random(94) + 33;
	SHA256_PassHash(inputtext, pData[playerid][pSalt], pData[playerid][pPassword], 65);

	new query[512], PlayerIP[16];
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	mysql_format(g_SQL, query, sizeof query, "INSERT INTO `players` (`username`, `password`, `salt`, `ip`, `reg_date`, `last_login`) VALUES ('%e', '%s', '%e', '%s', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP())", pData[playerid][pName], pData[playerid][pPassword], pData[playerid][pSalt], PlayerIP);
	mysql_tquery(g_SQL, query, "OnPlayerRegister", "d", playerid);
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
        /*switch (listitem) 
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
        }*/
        pData[playerid][pSkin] = (listitem) ? (233) : (98);
        SetPlayerSkin(playerid,pData[playerid][pSkin]);
		pData[playerid][pMoney] = 100000;
		SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1744.3411, -1862.8655, 13.3983, 270.0000, 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
    }
    else Dialog_Show(playerid, DIALOG_GENDER, DIALOG_STYLE_LIST, "Gender", "1. Male/Laki-Laki\n2. Female/Perempuan", "Pilih", "Batal");
	return 1;
}

//------------[ Player Commands Dialog ]------------
Dialog:DIALOG_HELP(playerid, response, listitem, inputtext[])
{
	if(!response) return true;
	switch(listitem)
	{
		case 0:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "PLAYER: /help /afk /drag /undrag /pay /stats /items /frisk /use /give /ktp /sim");
			SendClientMessageEx(playerid, COLOR_WHITE, "PLAYER: /hidehbe /hidespeedo /try /mask /helmet /death /accept /cancel /buy");
		}
		case 1:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "CHAT: /b /l /s /pm /togpm /w /o /me /ame /do /ado");
		}
		case 2:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "VEHICLE: /v /fill");
		}
		case 3:
		{
			//return callcmd::jobhelp(playerid);
		}
		case 4:
		{
			//return callcmd::factionhelp(playerid);
		}
		case 5:
		{
			
		}
		case 6:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "BISNIS: /buy /bm /lockbisnis /unlockbisnis /mybis");
		}
		case 7:
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "HOUSE: /buy /storage /lockhouse /unlockhouse /myhouse");
		}
		case 8:
		{
			return callcmd::donate(playerid);
		}
		case 9:
		{
			return callcmd::credits(playerid);
		}
	}
	return 1;
}

Dialog:Dialog_Pay(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		new mstr[128];
		new otherid = GetPVarInt(playerid, "gcPlayer");
		new money = GetPVarInt(playerid, "gcAmount");

		if(otherid == INVALID_PLAYER_ID)
			return Error(playerid, "Player not connected!");
		GivePlayerMoneyEx(otherid, money);
		GivePlayerMoneyEx(playerid, -money);

		format(mstr, sizeof(mstr), "Server: "YELLOW_E"You have sent %s(%i) "GREEN_E"%s", ReturnName(otherid), otherid, FormatMoney(money));
		SendClientMessage(playerid, COLOR_GREY, mstr);
		format(mstr, sizeof(mstr), "Server: "YELLOW_E"%s(%i) has sent you "GREEN_E"%s", ReturnName(playerid), playerid, FormatMoney(money));
		SendClientMessage(otherid, COLOR_GREY, mstr);
		InfoTD_MSG(playerid, 3500, "~g~~h~Money Sent!");
		InfoTD_MSG(otherid, 3500, "~g~~h~Money received!");
		ApplyAnimation(playerid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
		ApplyAnimation(otherid, "DEALER", "shop_pay", 4.0, 0, 0, 0, 0, 0);
	}
	return 1;
}

//------------[ Faction Dialog ]---------------
//Locker SAPD
Dialog:LockerSAPD(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
            case 0: 
			{
				if(pData[playerid][pOnDuty] == 1)
				{
					pData[playerid][pOnDuty] = 0;
					SetPlayerColor(playerid, COLOR_WHITE);
					SetPlayerSkin(playerid, pData[playerid][pSkin]);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s places their badge and gun in their locker.", ReturnName(playerid));
				}
				else
				{
					pData[playerid][pOnDuty] = 1;
					SetFactionColor(playerid);
					if(pData[playerid][pGender] == 1)
					{
						SetPlayerSkin(playerid, 300);
						pData[playerid][pFacSkin] = 300;
					}
					else
					{
						SetPlayerSkin(playerid, 306);
						pData[playerid][pFacSkin] = 306;
					}
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s withdraws their badge and on duty from their locker", ReturnName(playerid));
				}
			}
            case 1: 
			{
                SetPlayerHealthEx(playerid, 100);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil medical kit dari locker", ReturnName(playerid));
            }
			case 2:
			{
				SetPlayerArmourEx(playerid, 97);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil armour pelindung dari locker", ReturnName(playerid));
			}
			case 3:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
					
				Dialog_Show(playerid, WeaponSAPD, DIALOG_STYLE_LIST, "SAPD Weapons", "SPRAYCAN\nPARACHUTE\nNITE STICK\nKNIFE\nCOLT45\nSILENCED\nDEAGLE\nSHOTGUN\nSHOTGSPA\nMP5\nM4\nRIFLE\nSNIPER", "Pilih", "Batal");
			}
			case 4:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
				
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SAPDMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SAPDFemale, "Choose your skin");
                }
			}
			case 5:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
				
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SAPDWar, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SAPDFemale, "Choose your skin");
                }
			}
        }
	}
	return 1;
}
Dialog:WeaponSAPD(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 41, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(41));
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 46, 1);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(46));
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 3, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(3));
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 4, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(4));
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 22, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(22));
			}
			case 5:
			{
				if(pData[playerid][pFactionRank] < 2)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 23, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(23));
			}
			case 6:
			{
				if(pData[playerid][pFactionRank] < 2)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 24, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(24));
			}	
			case 7:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 25, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(25));
			}
			case 8:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 27, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(27));
			}
			case 9:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 29, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(29));
			}
			case 10:
			{
				if(pData[playerid][pFactionRank] < 4)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 31, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(31));
			}
			case 11:
			{
				if(pData[playerid][pFactionRank] < 4)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 33, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(33));
			}
			case 12:
			{
				if(pData[playerid][pFactionRank] < 4)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 34, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(34));
			}
		}
	}
	return 1;
}
//Locker SAGS
Dialog:LockerSAGS(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
            case 0: 
			{
				if(pData[playerid][pOnDuty] == 1)
				{
					pData[playerid][pOnDuty] = 0;
					SetPlayerColor(playerid, COLOR_WHITE);
					SetPlayerSkin(playerid, pData[playerid][pSkin]);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s places their badge and gun in their locker.", ReturnName(playerid));
				}
				else
				{
					pData[playerid][pOnDuty] = 1;
					SetFactionColor(playerid);
					if(pData[playerid][pGender] == 1)
					{
						SetPlayerSkin(playerid, 295);
						pData[playerid][pFacSkin] = 295;
					}
					else
					{
						SetPlayerSkin(playerid, 141);
						pData[playerid][pFacSkin] = 141;
					}
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s withdraws their badge and on duty from their locker", ReturnName(playerid));
				}
			}
            case 1: 
			{
                SetPlayerHealthEx(playerid, 100);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil medical kit dari locker", ReturnName(playerid));
            }
			case 2:
			{
				SetPlayerArmourEx(playerid, 97);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil armour pelindung dari locker", ReturnName(playerid));
			}
			case 3:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
					
				Dialog_Show(playerid, WeaponSAGS, DIALOG_STYLE_LIST, "SAGS Weapons", "SPRAYCAN\nPARACHUTE\nNITE STICK\nKNIFE\nCOLT45\nSILENCED\nDEAGLE\nMP5", "Pilih", "Batal");
			}
			case 4:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SAGSMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SAGSFemale, "Choose your skin");
                }
			}
        }
	}
	return 1;
}
Dialog:WeaponSAGS(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 41, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(41));
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 46, 1);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(46));
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 3, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(3));
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 4, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(4));
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 22, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(22));
			}
			case 5:
			{
				if(pData[playerid][pFactionRank] < 2)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 23, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(23));
			}
			case 6:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 24, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(24));
			}	
			case 7:
			{
				if(pData[playerid][pFactionRank] < 4)
					return Error(playerid, "You are not allowed!");
				GivePlayerWeaponEx(playerid, 29, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(29));
			}
		}
	}
	return 1;
}
//Locker SAMD
Dialog:LockerSAMD(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
            case 0: 
			{
				if(pData[playerid][pOnDuty] == 1)
				{
					pData[playerid][pOnDuty] = 0;
					SetPlayerColor(playerid, COLOR_WHITE);
					SetPlayerSkin(playerid, pData[playerid][pSkin]);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s places their badge and gun in their locker.", ReturnName(playerid));
				}
				else
				{
					pData[playerid][pOnDuty] = 1;
					SetFactionColor(playerid);
					if(pData[playerid][pGender] == 1)
					{
						SetPlayerSkin(playerid, 276);
						pData[playerid][pFacSkin] = 276;
					}
					else
					{
						SetPlayerSkin(playerid, 308);
						pData[playerid][pFacSkin] = 308;
					}
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s withdraws their badge and on duty from their locker", ReturnName(playerid));
				}
			}
            case 1: 
			{
                SetPlayerHealthEx(playerid, 100);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil medical kit dari locker", ReturnName(playerid));
            }
			case 2:
			{
				SetPlayerArmourEx(playerid, 97);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil armour pelindung dari locker", ReturnName(playerid));
			}
			case 3:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
					
				Dialog_Show(playerid, WeaponSAMD, DIALOG_STYLE_LIST, "SAMD Weapons", "FIREEXTINGUISHER\nSPRAYCAN\nPARACHUTE\nNITE STICK\nKNIFE\nCOLT45\nSILENCED\nDEAGLE", "Pilih", "Batal");
			}
			case 4:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SAMDMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SAMDFemale, "Choose your skin");
                }
			}
        }
	}
	return 1;
}
Dialog:WeaponSAMD(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 42, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(42));
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 41, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(41));
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 46, 1);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(46));
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 3, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(3));
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 4, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(4));
			}
			case 5:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 22, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(22));
			}
			case 6:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 23, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(23));
			}
			case 7:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 24, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(24));
			}	
		}
	}
	return 1;
}
//Locker SANEW
Dialog:LockerSANEW(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
            case 0: 
			{
				if(pData[playerid][pOnDuty] == 1)
				{
					pData[playerid][pOnDuty] = 0;
					SetPlayerColor(playerid, COLOR_WHITE);
					SetPlayerSkin(playerid, pData[playerid][pSkin]);
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s places their badge and gun in their locker.", ReturnName(playerid));
				}
				else
				{
					pData[playerid][pOnDuty] = 1;
					SetFactionColor(playerid);
					if(pData[playerid][pGender] == 1)
					{
						SetPlayerSkin(playerid, 189);
						pData[playerid][pFacSkin] = 189;
					}
					else
					{
						SetPlayerSkin(playerid, 150); //194
						pData[playerid][pFacSkin] = 150; //194
					}
					SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s withdraws their badge and on duty from their locker", ReturnName(playerid));
				}
			}
            case 1: 
			{
                SetPlayerHealthEx(playerid, 100);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil medical kit dari locker", ReturnName(playerid));
            }
			case 2:
			{
				SetPlayerArmourEx(playerid, 97);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "* %s telah mengambil armour pelindung dari locker", ReturnName(playerid));
			}
			case 3:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
					
				Dialog_Show(playerid, WeaponSANEW, DIALOG_STYLE_LIST, "SAPD Weapons", "CAMERA\nSPRAYCAN\nPARACHUTE\nNITE STICK\nKNIFE\nCOLT45", "Pilih", "Batal");
			}
			case 4:
			{
				if(pData[playerid][pOnDuty] <= 0)
					return Error(playerid, "Kamu harus On duty untuk mengambil barang!");
				switch (pData[playerid][pGender])
                {
                    case 1: ShowModelSelectionMenu(playerid, SANEWMale, "Choose your skin");
                    case 2: ShowModelSelectionMenu(playerid, SANEWFemale, "Choose your skin");
                }
			}
        }
	}
	return 1;
}
Dialog:WeaponSANEW(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch (listitem) 
		{
			case 0:
			{
				GivePlayerWeaponEx(playerid, 43, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(43));
			}
			case 1:
			{
				GivePlayerWeaponEx(playerid, 41, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(41));
			}
			case 2:
			{
				GivePlayerWeaponEx(playerid, 46, 1);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(46));
			}
			case 3:
			{
				GivePlayerWeaponEx(playerid, 3, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(3));
			}
			case 4:
			{
				GivePlayerWeaponEx(playerid, 4, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(4));
			}
			case 5:
			{
				if(pData[playerid][pFactionRank] < 3)
					return Error(playerid, "You are not allowed!");
					
				GivePlayerWeaponEx(playerid, 22, 900);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s reaches inside the locker and equips a %s.", ReturnName(playerid), ReturnWeaponName(22));
			}
		}
	}
	return 1;
}