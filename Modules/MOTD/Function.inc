new GlobalMOTD[128];
new AdminMOTD[128];
new CAMOTD[128];

stock fcreate(filename[])
{
	if (fexist(filename)) return false;
	new File:fhnd;
	fhnd=fopen(filename,io_write);
	if (fhnd) {
		fclose(fhnd);
		return true;
	}
	return false;
}

LoadMOTDs()
{
	new arrCoords[4][128];
	new strFromFile2[512];
	new File: file = fopen("motd.ini", io_read);
	if (file)
	{
		fread(file, strFromFile2);
		splits(strFromFile2, arrCoords, '|');
		strmid(GlobalMOTD, arrCoords[0], 0, strlen(arrCoords[0]), 255);
		strmid(AdminMOTD, arrCoords[1], 0, strlen(arrCoords[1]), 255);
		strmid(CAMOTD, arrCoords[3], 0, strlen(arrCoords[3]), 255);
		fclose(file);
	}
	else
	{
		fcreate("motd.ini");
		print("motd.ini doesn't exit, setting the default MOTDs");
		format(GlobalMOTD, sizeof(GlobalMOTD), "Welcome to Red Timer Roleplay Server.");
		format(AdminMOTD, sizeof(AdminMOTD), "Admin MOTD: Dilarang Menyalagunakan Command Staff. /forums khusus!.");
		format(CAMOTD, sizeof(CAMOTD), "Helpers MOTD: None.");
  		SaveMOTDs();
	}
	return 1;
}

SaveMOTDs()
{
	new coordsString[512];
	format(coordsString, sizeof(coordsString), "%s|%s|%s", GlobalMOTD,AdminMOTD,CAMOTD);
	new File: file2 = fopen("motd.ini", io_write);
	fwrite(file2, coordsString);
	fclose(file2);
	return 1;
}