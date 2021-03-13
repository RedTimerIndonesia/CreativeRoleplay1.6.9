#define FILTERSCRIPT

#include <a_samp>

#include <discord-connector>

#include <Pawn.CMD>

new DCC_Channel:g_Discord_Chat;

public OnFilterScriptInit()
{
	print("\n===================================");
	print("|      DISCORD IRC SYSTEM V.1.0      |");
	print("|   BY CYBERH4WK LOADED SUCCESFULL   |");
    print("|   Developed by AzharHrj            |");
	print("=====================================\n");
	g_Discord_Chat = DCC_FindChannelById("811110371866837012"); // Discord channel ID
    return 1;
}

forward DCC_OnMessageCreate(DCC_Message:message);

public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    /*if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s",user_name, realMsg);
        SendClientMessageToAll(-1, str);
    }*/

    return 1;
}

public OnPlayerText(playerid, text[])
{

    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);
    new msg[128]; 
    format(msg, sizeof(msg), "```[CHAT] %s: %s```", name, text);
    DCC_SendChannelMessage(g_Discord_Chat, msg);
    return 1;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    new msg[128];
	format(msg, sizeof(msg), "```[CMD]: %s has used the command '%s' (%s)```", name, cmd, params);
    DCC_SendChannelMessage(g_Discord_Chat, msg);
    return 1;
}

/*public OnPlayerCommandText(playerid, cmdtext[]) {

    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    new msg[128];
	format(msg, sizeof(msg), "```[CMD]: %s (%d) has used the command '%s' (%s)```", name, playerid, cmdtext);
    DCC_SendChannelMessage(g_Discord_Chat, msg);
    return 1;
}*/

public OnPlayerConnect(playerid)
{
   	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("811110371866837012"); // Discord channel ID

    new string[128];
    format(string, sizeof string, " ```%s telah terkoneksi kedalam server.```", name);
    DCC_SendChannelMessage(g_Discord_Chat, string);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById("811110371866837012"); // Discord channel ID

    new string[128];
    format(string, sizeof string, " ```%s telah keluar dari server.```", name);
    DCC_SendChannelMessage(g_Discord_Chat, string);
    return 1;
}