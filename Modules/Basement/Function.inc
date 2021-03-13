enum basementInfo
{
	basePickupID,
	Text3D:baseText,
	baseName[128],
	baseCP,
	baseExteriorVW,
	baseExteriorInt,
	baseInteriorVW,
	baseInteriorInt,
	Float:baseExteriorX,
	Float:baseExteriorY,
	Float:baseExteriorZ,
	Float:baseExteriorA,
	Float:baseInteriorX,
	Float:baseInteriorY,
	Float:baseInteriorZ,
	Float:baseInteriorA
}
new BasementInfo[MAX_BASEMENT][basementInfo];

SaveBasement() 
{
	new
	    base[1024],
		File: fHandle = fopen("basement.cfg", io_write);
		
	for(new iIndex; iIndex < MAX_BASEMENT; iIndex++)
	{
	    format(base, sizeof(base), "%s|%d|%d|%d|%d|%f|%f|%f|%f|%f|%f|%f|%f\r\n",
	        BasementInfo[iIndex][baseName],
	        BasementInfo[iIndex][baseExteriorVW],
	        BasementInfo[iIndex][baseExteriorInt],
	        BasementInfo[iIndex][baseInteriorVW],
	        BasementInfo[iIndex][baseInteriorInt],
	        BasementInfo[iIndex][baseExteriorX],
	        BasementInfo[iIndex][baseExteriorY],
	        BasementInfo[iIndex][baseExteriorZ],
	        BasementInfo[iIndex][baseExteriorA],
	        BasementInfo[iIndex][baseInteriorX],
	        BasementInfo[iIndex][baseInteriorY],
	        BasementInfo[iIndex][baseInteriorZ],
	        BasementInfo[iIndex][baseInteriorA]
		);
		fwrite(fHandle, base);
	}
	return fclose(fHandle);
}

LoadBasement()
{
	if(!fexist("basement.cfg")) return 1;
	new
	    base[1024],
	    File: iFileHandle = fopen("basement.cfg", io_read),
		iIndex;
	while(iIndex < sizeof(BasementInfo) && fread(iFileHandle, base)) {
	    sscanf(base, "p<|>s[128]iiiiffffffff",
	        BasementInfo[iIndex][baseName],
	        BasementInfo[iIndex][baseExteriorVW],
			BasementInfo[iIndex][baseExteriorInt],
			BasementInfo[iIndex][baseInteriorVW],
			BasementInfo[iIndex][baseInteriorInt],
			BasementInfo[iIndex][baseExteriorX],
			BasementInfo[iIndex][baseExteriorY],
			BasementInfo[iIndex][baseExteriorZ],
			BasementInfo[iIndex][baseExteriorA],
			BasementInfo[iIndex][baseInteriorX],
			BasementInfo[iIndex][baseInteriorY],
			BasementInfo[iIndex][baseInteriorZ],
			BasementInfo[iIndex][baseInteriorA]
		);
		if(BasementInfo[iIndex][baseExteriorX])
		{
		    format(base, sizeof(base), "[id:%d]\n{00FF00}%s",iIndex,BasementInfo[iIndex][baseName]);
		    BasementInfo[iIndex][basePickupID] = CreateDynamicPickup(19130, 23, BasementInfo[iIndex][baseExteriorX], BasementInfo[iIndex][baseExteriorY], BasementInfo[iIndex][baseExteriorZ]);
		    BasementInfo[iIndex][baseText] = CreateDynamic3DTextLabel(base, COLOR_RIKO, BasementInfo[iIndex][baseExteriorX], BasementInfo[iIndex][baseExteriorY], BasementInfo[iIndex][baseExteriorZ]+1,10.0, .testlos = 1, .streamdistance = 5.0);
		    BasementInfo[iIndex][baseCP] = CreateDynamicCP(BasementInfo[iIndex][baseExteriorX], BasementInfo[iIndex][baseExteriorY], BasementInfo[iIndex][baseExteriorZ], 4, BasementInfo[iIndex][baseExteriorVW], BasementInfo[iIndex][baseExteriorInt], -1, 5.0);
		}
		++iIndex;
	}
	return fclose(iFileHandle);
}