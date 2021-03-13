#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" New 0.3z Weapon DMG System by FeRRum (aka RenSoprano)");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	new Float:HP;
    GetPlayerHealth(playerid, HP);
    if(issuerid != INVALID_PLAYER_ID)
    {
		switch(weaponid)
		{
		    case 22:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-17); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-10); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-7); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-7); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-8); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-8); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-25); // Head
                                }
                        }
                    case 23:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-20); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-14); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-8); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-8); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-10); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-10); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-30); // Head
                                }
                        }
                    case 24:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-30); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-20); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-13); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-13); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-15); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-15); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-65); // Head
                                }
                        }
                    case 25:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-30); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-27); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-23); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-23); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-25); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-25); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-70); // Head
                                }
                        }
                    case 27:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-25); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-14); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-15); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-15); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-18); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-18); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-65); // Head
                                }
                        }
                    case 28:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-15); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-10); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-7); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-7); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-7); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-7); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-25); // Head
                                }
                        }
                    case 29:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-20); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-10); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-8); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-8); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-6); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-6); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-30); // Head
                                }
                        }
                    case 30:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-35); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-17); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-10); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-10); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-9); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-9); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-43); // Head
                                }
                        }
                    case 31:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-30); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-17); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-10); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-10); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-9); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-9); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-48); // Head
                                }
                        }
                    case 32:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-15); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-10); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-7); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-7); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-7); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-7); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-25); // Head
                                }
                        }
                    case 33:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-27); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-22); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-15); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-15); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-15); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-15); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-47); // Head
                                }
                        }
                    case 34:
                        {
                            switch(bodypart)
                                {
                                        case 3: SetPlayerHealth(playerid, HP-50); // Torso
                                        case 4: SetPlayerHealth(playerid, HP-35); // Groin
                                        case 5: SetPlayerHealth(playerid, HP-25); // Left ARM
                                        case 6: SetPlayerHealth(playerid, HP-25); // Right ARM
                                        case 7: SetPlayerHealth(playerid, HP-25); // Left Leg
                                        case 8: SetPlayerHealth(playerid, HP-25); // Right Leg
                                        case 9: SetPlayerHealth(playerid, HP-100); // Head
				}
			}
		}
    }
    return 1;
}
