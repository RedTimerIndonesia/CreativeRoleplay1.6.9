#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    return 1;
}

hook OnPlayerConnect(playerid)
{
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    DestroyDynamicObject(SirenObject[VID]);
    return 1;
}

hook OnGameModeExit()
{
    return 1;
}