#include <YSI_Coding\y_hooks>

hook OnGameModeInit()
{
    txtAnimHelper = TextDrawCreate(542.000000, 417.000000, "~r~~k~~PED_SPRINT~ ~w~untuk menghentikan Animations");
    TextDrawUseBox(txtAnimHelper, 0);
    TextDrawFont(txtAnimHelper, 2);
    TextDrawSetShadow(txtAnimHelper,0); // no shadow
    TextDrawSetOutline(txtAnimHelper,1); // thickness 1
    TextDrawBackgroundColor(txtAnimHelper,0x000000FF);
    TextDrawColor(txtAnimHelper,0xFFFFFFFF);
    TextDrawAlignment(txtAnimHelper,3); // align right
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    return 1;
}