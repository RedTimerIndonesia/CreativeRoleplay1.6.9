//Job Lumber
//-258.54, -2189.92, 28.97

CreateJoinLumberPoint()
{
	//JOBS
	new strings[128];
	CreateDynamicPickup(1239, 23, -283.02, -2174.36, 28.66, -1);
	format(strings, sizeof(strings), "[LUMBER JOBS]\n{FFFFFF}/joinjob to join");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -283.02, -2174.36, 28.66, 5.0); // lumber
	
	//JOBS
	CreateDynamicPickup(1239, 23, -258.54, -2189.92, 28.97, -1);
	format(strings, sizeof(strings), "[Material]\n{FFFFFF}Material Stock: %d\nMaterial Price: %d\nLumber Price: %d", Material, FormatMoney(MaterialPrice), FormatMoney(LumberPrice));
	MatText = CreateDynamic3DTextLabel(strings, COLOR_YELLOW, -258.54, -2189.92, 28.97, 5.0); // lumber
}

#define     MAX_TREES       (100)   // tree limit
#define     MAX_LUMBERS        (300)   // dropped log limit

#define     CUTTING_TIME    (8)		// required seconds to cut a tree down (Default: 8)
#define     LUMBER_LIMIT     	(10)    // how many logs a player can load to a bobcat (if you change this, don't forget to modify LogAttachOffsets array) (Default: 10)
#define     ATTACH_INDEX    (9)     // for setplayerattachedobject (Default: 7)
#define     TREE_RESPAWN    (300)   // required seconds to respawn a tree (Default: 300)
#define     LUMBER_LIFETIME	(120)   // life time of a dropped log, in seconds (Default: 120)

enum    E_TREE
{
	// loaded from db
	Float: treeX,
	Float: treeY,
	Float: treeZ,
	Float: treeRX,
	Float: treeRY,
	Float: treeRZ,
	// temp
	treeLumber,
	treeSeconds,
	bool: treeGettingCut,
	treeObjID,
	Text3D: treeLabel,
	treeTimer
}

new TreeData[MAX_TREES][E_TREE],
	Iterator:Trees<MAX_TREES>;

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
	
SetPlayerLookAt(playerid, Float:x, Float:y)
{
	// somewhere on samp forums, couldn't find the source
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
}

ConvertToMinutes(time)
{
    // http://forum.sa-mp.com/showpost.php?p=3223897&postcount=11
    new string[15];//-2000000000:00 could happen, so make the string 15 chars to avoid any errors
    format(string, sizeof(string), "%02d:%02d", time / 60, time % 60);
    return string;
}

GetClosestTree(playerid, Float: range = 2.0)
{
	new tid = -1, Float: dist = range, Float: tempdist;
	foreach(new i : Trees)
	{
	    tempdist = GetPlayerDistanceFromPoint(playerid, TreeData[i][treeX], TreeData[i][treeY], TreeData[i][treeZ]);

	    if(tempdist > range) continue;
		if(tempdist <= dist)
		{
			dist = tempdist;
			tid = i;
		}
	}
	return tid;
}

GetClosestLumber(playerid, Float: range = 2.0)
{
	new tid = -1, Float: dist = range, Float: tempdist, Float: pos[3];
	foreach(new i : Lumbers)
	{
		GetDynamicObjectPos(LumberData[i][lumberObjID], pos[0], pos[1], pos[2]);
	    tempdist = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);

	    if(tempdist > range) continue;
		if(tempdist <= dist)
		{
			dist = tempdist;
			tid = i;
		}
	}
	return tid;
}

function LoadTrees()
{
    new tid;
	
	new rows = cache_num_rows();
 	if(rows)
  	{
		for(new i; i < rows; i++)
		{
			cache_get_value_int(i, "id", tid);
			cache_get_value_float(i, "posx", TreeData[tid][treeX]);
			cache_get_value_float(i, "posy", TreeData[tid][treeY]);
			cache_get_value_float(i, "posz", TreeData[tid][treeZ]);
			cache_get_value_float(i, "posrx", TreeData[tid][treeRX]);
			cache_get_value_float(i, "posry", TreeData[tid][treeRY]);
			cache_get_value_float(i, "posrz", TreeData[tid][treeRZ]);
			Tree_Refresh(tid);
			Iter_Add(Trees, tid);
		}
		printf("[Dynamic Tree] Number of Loaded: %d.", rows);
	}
}

Tree_Save(tid)
{
	new cQuery[512];
	format(cQuery, sizeof(cQuery), "UPDATE trees SET posx='%f', posy='%f', posz='%f', posrx='%f', posry='%f', posrz='%f' WHERE id='%d'",
	TreeData[tid][treeX],
	TreeData[tid][treeY],
	TreeData[tid][treeZ],
	TreeData[tid][treeRX],
	TreeData[tid][treeRY],
	TreeData[tid][treeRZ],
	tid
	);
	return mysql_tquery(g_SQL, cQuery);
}

Tree_BeingEdited(tid)
{
	if(!Iter_Contains(Trees, tid)) return 0;
	foreach(new i : Player) if(EditingTreeID[i] == tid) return 1;
	return 0;
}

Tree_Refresh(tid)
{
    if(tid != -1)
	{
		new label[96];
		
		if(IsValidDynamic3DTextLabel(TreeData[tid][treeLabel]))
			DestroyDynamic3DTextLabel(TreeData[tid][treeLabel]);
				
		if(IsValidDynamicObject(TreeData[tid][treeObjID]))
			DestroyDynamicObject(TreeData[tid][treeObjID]);
		
		if(TreeData[tid][treeLumber] > 0) 
		{
			format(label, sizeof(label), "Tree (%d)\n.", tid, TreeData[tid][treeLumber]);
			TreeData[tid][treeLabel] = CreateDynamic3DTextLabel(label, COLOR_BLUE, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ]+0.5, 2);
			
			TreeData[tid][treeObjID] = CreateDynamicObject(657, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ], TreeData[tid][treeRX], TreeData[tid][treeRY], TreeData[tid][treeRZ]);
		}
		else
		{
			TreeData[tid][treeTimer] = SetTimerEx("RespawnTree", 1000, true, "i", tid);
			
			format(label, sizeof(label), "Tree (%d)\n\n{FFFFFF}%s", tid, ConvertToMinutes(TreeData[tid][treeSeconds]));
			TreeData[tid][treeLabel] = CreateDynamic3DTextLabel(label, COLOR_BLUE, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ]+0.5, 2);
			
			TreeData[tid][treeObjID] = CreateDynamicObject(657, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ], TreeData[tid][treeRX], TreeData[tid][treeRY], TreeData[tid][treeRZ]);
		}
	}
	return 1;
}

CMD:createtree(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
	new tid = Iter_Free(Trees), query[512];
	if(tid == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Can't add any more trees.");
 	new Float: x, Float: y, Float: z, Float: a;
 	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, a);
 	x += (3.0 * floatsin(-a, degrees));
	y += (3.0 * floatcos(-a, degrees));
	z -= 1.0;
	
	TreeData[tid][treeX] = x;
	TreeData[tid][treeY] = y;
	TreeData[tid][treeZ] = z;
	TreeData[tid][treeRX] = TreeData[tid][treeRY] = TreeData[tid][treeRZ] = 0.0;
	
	Tree_Refresh(tid);
	Iter_Add(Trees, tid);
	
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO trees SET id='%d', posx='%f', posy='%f', posz='%f', posrx='%f', posry='%f', posrz='%f'", tid, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ], TreeData[tid][treeRX], TreeData[tid][treeRY], TreeData[tid][treeRZ]);
	mysql_tquery(g_SQL, query, "OnTreeCreated", "di", playerid, tid);
	return 1;
}

function OnTreeCreated(playerid, tid)
{
	Tree_Save(tid);
	
	EditingTreeID[playerid] = tid;
	EditDynamicObject(playerid, TreeData[tid][treeObjID]);
	SendClientMessage(playerid, 0x3498DBFF, "LUMBERJACK: {FFFFFF}Tree created.");
	SendClientMessage(playerid, 0x3498DBFF, "LUMBERJACK: {FFFFFF}You can edit it right now, or cancel editing and edit it some other time.");
	return 1;
}

CMD:edittree(playerid, params[])
{
    if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
    if(EditingTreeID[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're already editing a tree.");
	new tid;
	if(sscanf(params, "i", tid)) return SendClientMessage(playerid, 0xE88732FF, "SYNTAX: {FFFFFF}/edittree [tree id]");
	if(!Iter_Contains(Trees, tid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Invalid ID.");
	if(TreeData[tid][treeGettingCut]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Can't edit specified tree because its getting cut down.");
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, TreeData[tid][treeX], TreeData[tid][treeY], TreeData[tid][treeZ])) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not near the tree you want to edit.");
	EditingTreeID[playerid] = tid;
	EditDynamicObject(playerid, TreeData[tid][treeObjID]);
	return 1;
}

CMD:removetree(playerid, params[])
{
    if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
	new tid, query[512];
	if(sscanf(params, "i", tid)) return SendClientMessage(playerid, 0xE88732FF, "SYNTAX: {FFFFFF}/removetree [tree id]");
	if(!Iter_Contains(Trees, tid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Invalid ID.");
	if(TreeData[tid][treeGettingCut]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Can't remove specified tree because its getting cut down.");
	if(Tree_BeingEdited(tid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Can't remove specified tree because its being edited.");
	DestroyDynamicObject(TreeData[tid][treeObjID]);
	DestroyDynamic3DTextLabel(TreeData[tid][treeLabel]);
	if(TreeData[tid][treeTimer] != -1) KillTimer(TreeData[tid][treeTimer]);
	
	TreeData[tid][treeLumber] = TreeData[tid][treeSeconds] = 0;
	TreeData[tid][treeObjID] = TreeData[tid][treeTimer] = -1;
	TreeData[tid][treeLabel] = Text3D: -1;
	Iter_Remove(Trees, tid);
	
	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM trees WHERE id=%d", tid);
	mysql_tquery(g_SQL, query);
	SendClientMessage(playerid, 0x3498DBFF, "LUMBERJACK: {FFFFFF}Tree removed.");
	return 1;
}