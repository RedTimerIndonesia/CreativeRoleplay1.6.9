enum Actor
{
	aId,
	Text3D: aTId,
	aSkin,
	aAnim,
	Float:aPosX,
	Float:aPosY,
	Float:aPosZ,
	Float:aPosR,
	aName[80],
	aVW,
	aInt
}

Float:GetDistance( Float: x1, Float: y1, Float: z1, Float: x2, Float: y2, Float: z2 )
{
	new Float:d;
	d += floatpower(x1-x2, 2.0 );
	d += floatpower(y1-y2, 2.0 );
	d += floatpower(z1-z2, 2.0 );
	d = floatsqroot(d);
	return d;
}

new ActorsInfo[MAX_ACTOR][Actor];

CreateActors(actorid)
{
	new string[256];
	format(string, sizeof(string), "{ADD8E6}[Actors:%d]\n{FFFFFF}%s",actorid, ActorsInfo[actorid][aName]);

	ActorsInfo[actorid][aId] = CreateActor(ActorsInfo[actorid][aSkin], ActorsInfo[actorid][aPosX], ActorsInfo[actorid][aPosY], ActorsInfo[actorid][aPosZ], ActorsInfo[actorid][aPosR]);
	ActorsInfo[actorid][aTId] = CreateDynamic3DTextLabel(string, COLOR_WHITE, ActorsInfo[actorid][aPosX], ActorsInfo[actorid][aPosY], ActorsInfo[actorid][aPosZ]+1,10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, ActorsInfo[actorid][aVW], ActorsInfo[actorid][aInt], -1);
	switch(ActorsInfo[actorid][aAnim])
	{
		case 1: {ApplyActorAnimation(actorid,"ped","SEAT_down",4.0,0,0,0,1,0);}
		case 2: {ApplyActorAnimation(actorid,"ped","Idlestance_fat",4.0,0,0,0,1,0);}
		case 3: {ApplyActorAnimation(actorid,"ped","Idlestance_old",4.0,0,0,0,1,0);}
		case 4: {ApplyActorAnimation(actorid,"POOL","POOL_Idle_Stance",4.0,0,0,0,1,0);}
		case 5: {ApplyActorAnimation(actorid,"ped","woman_idlestance",4.0,0,0,0,1,0);}
		case 6: {ApplyActorAnimation(actorid,"ped","IDLE_stance",4.0,0,0,0,1,0);}
		case 7: {ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_in",4.0,0,0,0,1,0);}
		case 8: {ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_loop",4.0,0,0,0,1,0);}
		case 9: {ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_nod",4.0,0,0,0,1,0);}
		case 10: {ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_out",4.0,0,0,0,1,0);}
		case 11: {ApplyActorAnimation(actorid,"COP_AMBIENT","Copbrowse_shake",4.0,0,0,0,1,0);}
		case 12: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_in",4.0,0,0,0,1,0);}
		case 13: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_loop",4.0,0,0,0,1,0);}
		case 14: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_nod",4.0,0,0,0,1,0);}
		case 15: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_out",4.0,0,0,0,1,0);}
		case 16: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_shake",4.0,0,0,0,1,0);}
		case 17: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_think",4.0,0,0,0,1,0);}
		case 18: {ApplyActorAnimation(actorid,"COP_AMBIENT","Coplook_watch",4.0,0,0,0,1,0);}
		case 19: {ApplyActorAnimation(actorid,"GANGS","leanIDLE",4.1,0,0,0,1,0);}
		case 20: {ApplyActorAnimation(actorid,"MISC","Plyrlean_loop",4.1,0,0,0,1,0);}
		case 21: {ApplyActorAnimation(actorid,"KNIFE", "KILL_Knife_Ped_Die",4.1,0,0,0,1,0);}
		case 22: {ApplyActorAnimation(actorid,"PED", "KO_shot_face",4.0,0,0,0,1,0);}
		case 23: {ApplyActorAnimation(actorid,"PED", "KO_shot_stom",4.0,0,0,0,1,0);}
		case 24: {ApplyActorAnimation(actorid,"PED", "BIKE_fallR",4.0,0,0,0,1,0);}
		case 25: {ApplyActorAnimation(actorid,"PED", "BIKE_fall_off",4.0,0,0,0,1,0);}
		case 26: {ApplyActorAnimation(actorid,"SWAT","gnstwall_injurd",4.0,0,0,0,1,0);}
		case 27: {ApplyActorAnimation(actorid,"SWEET","Sweet_injuredloop",4.0,0,0,0,1,0);}
	}
}

LoadActors()
{
	new arrCoords[25][64];
	new strFromFile2[256];
	new File: file = fopen("actors.cfg", io_read);
	if (file)
	{
		new idx;
		while (idx < sizeof(ActorsInfo))
		{
			fread(file, strFromFile2);
			splits(strFromFile2, arrCoords, '|');
	  		ActorsInfo[idx][aId] = strval(arrCoords[0]);
	  		ActorsInfo[idx][aSkin] = strval(arrCoords[1]);
	  		ActorsInfo[idx][aAnim] = strval(arrCoords[2]);
	  		ActorsInfo[idx][aPosX] = floatstr(arrCoords[3]);
	  		ActorsInfo[idx][aPosY] = floatstr(arrCoords[4]);
	  		ActorsInfo[idx][aPosZ] = floatstr(arrCoords[5]);
	  		ActorsInfo[idx][aPosR] = floatstr(arrCoords[6]);
	  		strmid(ActorsInfo[idx][aName], arrCoords[7], 0, strlen(arrCoords[7]), 80);
	  		ActorsInfo[idx][aVW] = strval(arrCoords[8]);
	  		ActorsInfo[idx][aInt] = strval(arrCoords[9]);

	  		if(ActorsInfo[idx][aPosX])
	  		{
		  		if(!IsNull(ActorsInfo[idx][aName]))
		  		{
		  		    CreateActors(idx);
				}
			}

			idx++;
		}
		fclose(file);
	}
	print("[RT:RP Database] Actors Loaded Successfully");
	return 1;
}

SaveActors()
{
	new
		szFileStr[512],
		File: fHandle = fopen("actors.cfg", io_write);

	for(new iIndex; iIndex < MAX_ACTOR; iIndex++) {
		format(szFileStr, sizeof(szFileStr), "%d|%d|%d|%f|%f|%f|%f|%s|%d|%d\r\n",
			ActorsInfo[iIndex][aId],
			ActorsInfo[iIndex][aSkin],
			ActorsInfo[iIndex][aAnim],
			ActorsInfo[iIndex][aPosX],
			ActorsInfo[iIndex][aPosY],
			ActorsInfo[iIndex][aPosZ],
			ActorsInfo[iIndex][aPosR],
			ActorsInfo[iIndex][aName],
			ActorsInfo[iIndex][aVW],
			ActorsInfo[iIndex][aInt]
		);
		fwrite(fHandle, szFileStr);
	}
	print("[RT:RP Database] Actors saved successfully");
	return fclose(fHandle);
}