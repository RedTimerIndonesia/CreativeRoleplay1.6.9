// Toy System
enum e_toy_data
{
	toy_model,
	toy_bone,
	Float:toy_x,
	Float:toy_y,
	Float:toy_z,
	Float:toy_rx,
	Float:toy_ry,
	Float:toy_rz,
	Float:toy_sx,
	Float:toy_sy,
	Float:toy_sz
}
new pToys[MAX_PLAYERS][6][e_toy_data];

// Toy System
MySQL_LoadPlayerToys(playerid)
{
	new longquery[1000], tstr[128];
	strcat(longquery, "SELECT Slot0_Model,Slot0_Bone,Slot0_XPos,Slot0_YPos,Slot0_ZPos,Slot0_XRot,Slot0_YRot,Slot0_ZRot,Slot0_XScale,Slot0_YScale,Slot0_ZScale,\
	Slot1_Model,Slot1_Bone,Slot1_XPos,Slot1_YPos,Slot1_ZPos,Slot1_XRot,Slot1_YRot,Slot1_ZRot,Slot1_XScale,Slot1_YScale,Slot1_ZScale,\
	Slot2_Model,Slot2_Bone,Slot2_XPos,Slot2_YPos,Slot2_ZPos,Slot2_XRot,Slot2_YRot,Slot2_ZRot,Slot2_XScale,Slot2_YScale,Slot2_ZScale,");

	strcat(longquery, "Slot3_Model,Slot3_Bone,Slot3_XPos,Slot3_YPos,Slot3_ZPos,Slot3_XRot,Slot3_YRot,Slot3_ZRot,Slot3_XScale,Slot3_YScale,Slot3_ZScale,\
	Slot4_Model,Slot4_Bone,Slot4_XPos,Slot4_YPos,Slot4_ZPos,Slot4_XRot,Slot4_YRot,Slot4_ZRot,Slot4_XScale,Slot4_YScale,Slot4_ZScale,\
	Slot5_Model,Slot5_Bone,Slot5_XPos,Slot5_YPos,Slot5_ZPos,Slot5_XRot,Slot5_YRot,Slot5_ZRot,Slot5_XScale,Slot5_YScale,Slot5_ZScale");

	mysql_format(g_SQL, tstr, sizeof(tstr), " FROM toys WHERE Owner='%d'", pData[playerid][pID]);
	strcat(longquery, tstr);
	mysql_tquery(g_SQL, longquery, "LoadPlayerToys", "i", playerid);
}

function LoadPlayerToys(playerid)
{
	new rows = cache_num_rows();
	if(rows)
	{
		pData[playerid][PurchasedToy] = true;
		//SetPVarInt(playerid, "HelmetDisabled", 1);
		// Toy slot 1
		cache_get_value_int(0, 0, pToys[playerid][0][toy_model]);
  		cache_get_value_int(0, 1, pToys[playerid][0][toy_bone]);
  		cache_get_value_float(0, 2, pToys[playerid][0][toy_x]);
  		cache_get_value_float(0, 3, pToys[playerid][0][toy_y]);
  		cache_get_value_float(0, 4, pToys[playerid][0][toy_z]);
  		cache_get_value_float(0, 5, pToys[playerid][0][toy_rx]);
  		cache_get_value_float(0, 6, pToys[playerid][0][toy_ry]);
  		cache_get_value_float(0, 7, pToys[playerid][0][toy_rz]);
  		cache_get_value_float(0, 8, pToys[playerid][0][toy_sx]);
  		cache_get_value_float(0, 9, pToys[playerid][0][toy_sy]);
		cache_get_value_float(0, 10, pToys[playerid][0][toy_sz]);

		// Toy slot 2
  		cache_get_value_int(0, 11, pToys[playerid][1][toy_model]);
  		cache_get_value_int(0, 12, pToys[playerid][1][toy_bone]);
  		cache_get_value_float(0, 13, pToys[playerid][1][toy_x]);
  		cache_get_value_float(0, 14, pToys[playerid][1][toy_y]);
  		cache_get_value_float(0, 15, pToys[playerid][1][toy_z]);
  		cache_get_value_float(0, 16, pToys[playerid][1][toy_rx]);
  		cache_get_value_float(0, 17, pToys[playerid][1][toy_ry]);
  		cache_get_value_float(0, 18, pToys[playerid][1][toy_rz]);
  		cache_get_value_float(0, 19, pToys[playerid][1][toy_sx]);
  		cache_get_value_float(0, 20, pToys[playerid][1][toy_sy]);
		cache_get_value_float(0, 21, pToys[playerid][1][toy_sz]);

		// Toy slot 3
  		cache_get_value_int(0, 22, pToys[playerid][2][toy_model]);
  		cache_get_value_int(0, 23, pToys[playerid][2][toy_bone]);
  		cache_get_value_float(0, 24, pToys[playerid][2][toy_x]);
  		cache_get_value_float(0, 25, pToys[playerid][2][toy_y]);
  		cache_get_value_float(0, 26, pToys[playerid][2][toy_z]);
  		cache_get_value_float(0, 27, pToys[playerid][2][toy_rx]);
  		cache_get_value_float(0, 28, pToys[playerid][2][toy_ry]);
  		cache_get_value_float(0, 29, pToys[playerid][2][toy_rz]);
  		cache_get_value_float(0, 30, pToys[playerid][2][toy_sx]);
  		cache_get_value_float(0, 31, pToys[playerid][2][toy_sy]);
		cache_get_value_float(0, 32, pToys[playerid][2][toy_sz]);

		// Toy slot 4
  		cache_get_value_int(0, 33, pToys[playerid][3][toy_model]);
  		cache_get_value_int(0, 34, pToys[playerid][3][toy_bone]);
  		cache_get_value_float(0, 35, pToys[playerid][3][toy_x]);
  		cache_get_value_float(0, 36, pToys[playerid][3][toy_y]);
  		cache_get_value_float(0, 37, pToys[playerid][3][toy_z]);
  		cache_get_value_float(0, 38, pToys[playerid][3][toy_rx]);
  		cache_get_value_float(0, 39, pToys[playerid][3][toy_ry]);
  		cache_get_value_float(0, 40, pToys[playerid][3][toy_rz]);
  		cache_get_value_float(0, 41, pToys[playerid][3][toy_sx]);
  		cache_get_value_float(0, 42, pToys[playerid][3][toy_sy]);
		cache_get_value_float(0, 43, pToys[playerid][3][toy_sz]);

		// Toy slot 5
  		cache_get_value_int(0, 44, pToys[playerid][4][toy_model]);
  		cache_get_value_int(0, 45, pToys[playerid][4][toy_bone]);
  		cache_get_value_float(0, 46, pToys[playerid][4][toy_x]);
  		cache_get_value_float(0, 47, pToys[playerid][4][toy_y]);
  		cache_get_value_float(0, 48, pToys[playerid][4][toy_z]);
  		cache_get_value_float(0, 49, pToys[playerid][4][toy_rx]);
  		cache_get_value_float(0, 50, pToys[playerid][4][toy_ry]);
  		cache_get_value_float(0, 51, pToys[playerid][4][toy_rz]);
  		cache_get_value_float(0, 52, pToys[playerid][4][toy_sx]);
  		cache_get_value_float(0, 53, pToys[playerid][4][toy_sy]);
		cache_get_value_float(0, 54, pToys[playerid][4][toy_sz]);

  		// Toy slot 6
  		cache_get_value_int(0, 55, pToys[playerid][5][toy_model]);
  		cache_get_value_int(0, 56, pToys[playerid][5][toy_bone]);
  		cache_get_value_float(0, 57, pToys[playerid][5][toy_x]);
  		cache_get_value_float(0, 58, pToys[playerid][5][toy_y]);
  		cache_get_value_float(0, 59, pToys[playerid][5][toy_z]);
  		cache_get_value_float(0, 60, pToys[playerid][5][toy_rx]);
  		cache_get_value_float(0, 61, pToys[playerid][5][toy_ry]);
  		cache_get_value_float(0, 62, pToys[playerid][5][toy_rz]);
  		cache_get_value_float(0, 63, pToys[playerid][5][toy_sx]);
  		cache_get_value_float(0, 64, pToys[playerid][5][toy_sy]);
		cache_get_value_float(0, 65, pToys[playerid][5][toy_sz]);
  		AttachPlayerToys(playerid); // Attach player Toys.
		printf("[P_TOYS] Success loaded from %s(%d)", pData[playerid][pName], playerid);
	}
	return true;
}

MySQL_CreatePlayerToy(playerid)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `toys` (`Owner`) VALUES ('%d');", pData[playerid][pID]);
	mysql_tquery(g_SQL, query);
	pData[playerid][PurchasedToy] = true;

	for(new i = 0; i < 6; i++)
	{
		pToys[playerid][i][toy_model] = 0;
		pToys[playerid][i][toy_bone] = 1;
		pToys[playerid][i][toy_x] = 0.0;
		pToys[playerid][i][toy_y] = 0.0;
		pToys[playerid][i][toy_z] = 0.0;
		pToys[playerid][i][toy_rx] = 0.0;
		pToys[playerid][i][toy_ry] = 0.0;
		pToys[playerid][i][toy_rz] = 0.0;
		pToys[playerid][i][toy_sx] = 1.0;
		pToys[playerid][i][toy_sy] = 1.0;
		pToys[playerid][i][toy_sz] = 1.0;
	}
}

AttachPlayerToys(playerid)
{
	if(!pData[playerid][PurchasedToy]) return true;

	for(new i = 0; i < 6; i++)
	{
		if(pToys[playerid][i][toy_model] != 0)
		{
	        SetPlayerAttachedObject(playerid,
	            i,
	            pToys[playerid][i][toy_model],
	            pToys[playerid][i][toy_bone],
	            pToys[playerid][i][toy_x],
	            pToys[playerid][i][toy_y],
	            pToys[playerid][i][toy_z],
	            pToys[playerid][i][toy_rx],
	            pToys[playerid][i][toy_ry],
	            pToys[playerid][i][toy_rz],
	            pToys[playerid][i][toy_sx],
	            pToys[playerid][i][toy_sy],
	            pToys[playerid][i][toy_sz]);
  		}
	}
	return true;
}

MySQL_SavePlayerToys(playerid)
{
	if(!pData[playerid][PurchasedToy]) return true;
	if(!GetPVarInt(playerid, "UpdatedToy")) return true;

	new line4[1600], lstr[1024];

	mysql_format(g_SQL, lstr, sizeof(lstr),
	"UPDATE `toys` SET \
	`Slot0_Model` = %i, `Slot0_Bone` = %i, `Slot0_XPos` = %.3f, `Slot0_YPos` = %.3f, `Slot0_ZPos` = %.3f, `Slot0_XRot` = %.3f, `Slot0_YRot` = %.3f, `Slot0_ZRot` = %.3f, `Slot0_XScale` = %.3f, `Slot0_YScale` = %.3f, `Slot0_ZScale` = %.3f,",
		pToys[playerid][0][toy_model],
        pToys[playerid][0][toy_bone],
        pToys[playerid][0][toy_x],
        pToys[playerid][0][toy_y],
        pToys[playerid][0][toy_z],
        pToys[playerid][0][toy_rx],
        pToys[playerid][0][toy_ry],
        pToys[playerid][0][toy_rz],
        pToys[playerid][0][toy_sx],
        pToys[playerid][0][toy_sy],
        pToys[playerid][0][toy_sz]);
	strcat(line4, lstr);

	mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot1_Model` = %i, `Slot1_Bone` = %i, `Slot1_XPos` = %.3f, `Slot1_YPos` = %.3f, `Slot1_ZPos` = %.3f, `Slot1_XRot` = %.3f, `Slot1_YRot` = %.3f, `Slot1_ZRot` = %.3f, `Slot1_XScale` = %.3f, `Slot1_YScale` = %.3f, `Slot1_ZScale` = %.3f,",
		pToys[playerid][1][toy_model],
        pToys[playerid][1][toy_bone],
        pToys[playerid][1][toy_x],
        pToys[playerid][1][toy_y],
        pToys[playerid][1][toy_z],
        pToys[playerid][1][toy_rx],
        pToys[playerid][1][toy_ry],
        pToys[playerid][1][toy_rz],
        pToys[playerid][1][toy_sx],
        pToys[playerid][1][toy_sy],
        pToys[playerid][1][toy_sz]);
  	strcat(line4, lstr);

    mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot2_Model` = %i, `Slot2_Bone` = %i, `Slot2_XPos` = %.3f, `Slot2_YPos` = %.3f, `Slot2_ZPos` = %.3f, `Slot2_XRot` = %.3f, `Slot2_YRot` = %.3f, `Slot2_ZRot` = %.3f, `Slot2_XScale` = %.3f, `Slot2_YScale` = %.3f, `Slot2_ZScale` = %.3f,",
		pToys[playerid][2][toy_model],
        pToys[playerid][2][toy_bone],
        pToys[playerid][2][toy_x],
        pToys[playerid][2][toy_y],
        pToys[playerid][2][toy_z],
        pToys[playerid][2][toy_rx],
        pToys[playerid][2][toy_ry],
        pToys[playerid][2][toy_rz],
        pToys[playerid][2][toy_sx],
        pToys[playerid][2][toy_sy],
        pToys[playerid][2][toy_sz]);
  	strcat(line4, lstr);

    mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot3_Model` = %i, `Slot3_Bone` = %i, `Slot3_XPos` = %.3f, `Slot3_YPos` = %.3f, `Slot3_ZPos` = %.3f, `Slot3_XRot` = %.3f, `Slot3_YRot` = %.3f, `Slot3_ZRot` = %.3f, `Slot3_XScale` = %.3f, `Slot3_YScale` = %.3f, `Slot3_ZScale` = %.3f,",
		pToys[playerid][3][toy_model],
        pToys[playerid][3][toy_bone],
        pToys[playerid][3][toy_x],
        pToys[playerid][3][toy_y],
        pToys[playerid][3][toy_z],
        pToys[playerid][3][toy_rx],
        pToys[playerid][3][toy_ry],
        pToys[playerid][3][toy_rz],
        pToys[playerid][3][toy_sx],
        pToys[playerid][3][toy_sy],
        pToys[playerid][3][toy_sz]);
  	strcat(line4, lstr);

	mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot4_Model` = %i, `Slot4_Bone` = %i, `Slot4_XPos` = %.3f, `Slot4_YPos` = %.3f, `Slot4_ZPos` = %.3f, `Slot4_XRot` = %.3f, `Slot4_YRot` = %.3f, `Slot4_ZRot` = %.3f, `Slot4_XScale` = %.3f, `Slot4_YScale` = %.3f, `Slot4_ZScale` = %.3f,",
		pToys[playerid][4][toy_model],
        pToys[playerid][4][toy_bone],
        pToys[playerid][4][toy_x],
        pToys[playerid][4][toy_y],
        pToys[playerid][4][toy_z],
        pToys[playerid][4][toy_rx],
        pToys[playerid][4][toy_ry],
        pToys[playerid][4][toy_rz],
        pToys[playerid][4][toy_sx],
        pToys[playerid][4][toy_sy],
        pToys[playerid][4][toy_sz]);
  	strcat(line4, lstr);

	mysql_format(g_SQL, lstr, sizeof(lstr),
	" `Slot5_Model` = %i, `Slot5_Bone` = %i, `Slot5_XPos` = %.3f, `Slot5_YPos` = %.3f, `Slot5_ZPos` = %.3f, `Slot5_XRot` = %.3f, `Slot5_YRot` = %.3f, `Slot5_ZRot` = %.3f, `Slot5_XScale` = %.3f, `Slot5_YScale` = %.3f, `Slot5_ZScale` = %.3f WHERE `Owner` = '%d'",
		pToys[playerid][5][toy_model],
        pToys[playerid][5][toy_bone],
        pToys[playerid][5][toy_x],
        pToys[playerid][5][toy_y],
        pToys[playerid][5][toy_z],
        pToys[playerid][5][toy_rx],
        pToys[playerid][5][toy_ry],
        pToys[playerid][5][toy_rz],
        pToys[playerid][5][toy_sx],
        pToys[playerid][5][toy_sy],
        pToys[playerid][5][toy_sz],
		pData[playerid][pID]);
  	strcat(line4, lstr);

    mysql_tquery(g_SQL, line4);
    return 1;
}

CMD:toys(playerid)
{
	if(IsPlayerInAnyVehicle(playerid)) return Error(playerid, "This command can only be used on foot, exit your vehicle!");
	if(pData[playerid][IsLoggedIn] == false) return Error(playerid, "You must be logged in to attach objects to your character!");
	new string[350];
	if(pToys[playerid][0][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 1\n");
	}
	else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

	if(pToys[playerid][1][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 2\n");
	}
	else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

	if(pToys[playerid][2][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 3\n");
	}
	else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

	if(pToys[playerid][3][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 4\n");
	}
	else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");

	/*if(pToys[playerid][4][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 5\n");
	}
	else strcat(string, ""dot"Slot 5 "RED_E"(Used)\n");
	
	if(pToys[playerid][5][toy_model] == 0)
	{
	    strcat(string, ""dot"Slot 6\n");
	}
	else strcat(string, ""dot"Slot 6 "RED_E"(Used)\n");*/

	Dialog_Show(playerid, TOY_DIALOG, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", string, "Select", "Cancel");
	return 1;
}

Dialog:TOY_DIALOG(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: //slot 1
			{
				pData[playerid][toySelected] = 0;
				if(pToys[playerid][0][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 1: //slot 2
			{
				pData[playerid][toySelected] = 1;
				if(pToys[playerid][1][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 2: //slot 3
			{
				pData[playerid][toySelected] = 2;
				if(pToys[playerid][2][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 3: //slot 4
			{
				pData[playerid][toySelected] = 3;
				if(pToys[playerid][3][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 4: //slot 5
			{
				pData[playerid][toySelected] = 4;
				if(pToys[playerid][4][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 5: //slot 6
			{
				pData[playerid][toySelected] = 5;
				if(pToys[playerid][5][toy_model] == 0)
				{
					//ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
		}
	}
	return 1;
}

Dialog:TOY_EDIT(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: // edit
			{
				EditAttachedObject(playerid, pData[playerid][toySelected]);
				InfoTD_MSG(playerid, 4000, "~b~~h~You are now editing your toy.");
			}
			case 1: // change bone
			{
				new finstring[750];

				strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
				strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");

				Dialog_Show(playerid, TOY_POSISI, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", finstring, "Select", "Cancel");
			}
			case 2: // remove toy
			{
				if(IsPlayerAttachedObjectSlotUsed(playerid, pData[playerid][toySelected]))
				{
					RemovePlayerAttachedObject(playerid, pData[playerid][toySelected]);
				}
				pToys[playerid][pData[playerid][toySelected]][toy_model] = 0;
				GameTextForPlayer(playerid, "~r~~h~Toy Removed~y~!", 3000, 4);
				SetPVarInt(playerid, "UpdatedToy", 1);
				TogglePlayerControllable(playerid, true);
			}
		}
	}
	return 1;
}

Dialog:TOY_POSISI(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		listitem++;
		pToys[playerid][pData[playerid][toySelected]][toy_bone] = listitem;
		if(IsPlayerAttachedObjectSlotUsed(playerid, pData[playerid][toySelected]))
		{
			RemovePlayerAttachedObject(playerid, pData[playerid][toySelected]);
		}
		listitem = pData[playerid][toySelected];
		SetPlayerAttachedObject(playerid,
				listitem,
				pToys[playerid][listitem][toy_model],
				pToys[playerid][listitem][toy_bone],
				pToys[playerid][listitem][toy_x],
				pToys[playerid][listitem][toy_y],
				pToys[playerid][listitem][toy_z],
				pToys[playerid][listitem][toy_rx],
				pToys[playerid][listitem][toy_ry],
				pToys[playerid][listitem][toy_rz],
				pToys[playerid][listitem][toy_sx],
				pToys[playerid][listitem][toy_sy],
				pToys[playerid][listitem][toy_sz]);
		GameTextForPlayer(playerid, "~g~~h~Bone Changed~y~!", 3000, 4);
		SetPVarInt(playerid, "UpdatedToy", 1);
	}
	return 1;
}

Dialog:TOY_BUY_POSISI(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		listitem++;
		pToys[playerid][pData[playerid][toySelected]][toy_bone] = listitem;
		SetPlayerAttachedObject(playerid, pData[playerid][toySelected], pToys[playerid][pData[playerid][toySelected]][toy_model], listitem);
		EditAttachedObject(playerid, pData[playerid][toySelected]);
		InfoTD_MSG(playerid, 5000, "~g~~h~Object Attached!~n~~w~Adjust the position than click on the save icon!");
	}
	return 1;
}

Dialog:TOY_BUY(playerid, response, listitem, inputtext[])
{
	if(response)
	{
		switch(listitem)
		{
			case 0: //slot 1
			{
				pData[playerid][toySelected] = 0;
				if(pToys[playerid][0][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 1: //slot 2
			{
				pData[playerid][toySelected] = 1;
				if(pToys[playerid][1][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 2: //slot 3
			{
				pData[playerid][toySelected] = 2;
				if(pToys[playerid][2][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 3: //slot 4
			{
				pData[playerid][toySelected] = 3;
				if(pToys[playerid][3][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 4: //slot 5
			{
				pData[playerid][toySelected] = 4;
				if(pToys[playerid][4][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
			case 5: //slot 6
			{
				pData[playerid][toySelected] = 5;
				if(pToys[playerid][5][toy_model] == 0)
				{
					ShowModelSelectionMenu(playerid, toyslist, "Select Toy", 0x4A5A6BBB, 0x282828FF, 0x4A5A6BBB);
				}
				else
				{
					Dialog_Show(playerid, TOY_EDIT, DIALOG_STYLE_LIST, ""RED_E"XGRP: "WHITE_E"Player Toys", ""dot"Edit Toy Position\n"dot"Change Bone\n"dot""GREY_E"Remove Toy", "Select", "Cancel");
				}
			}
		}
	}
	return 1;
}