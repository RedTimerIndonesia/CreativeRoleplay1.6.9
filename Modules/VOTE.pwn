//Vote System
new VoteVoted[MAX_PLAYERS];
new VoteY;
new VoteOn;
new VoteN;

//========================================||Vote CMD||===============================================
CMD:vote(playerid, params[])
{
	new string[128];
	if(pData[playerid][pAdmin] < 1) return PermissionError(playerid);
	if(sscanf(params, "s[128]", params)) return Usage(playerid, "/vote [pertanyaan]");
	if(strlen(params) > 128) return SendClientMessage(playerid, COLOR_LIGHTGREEN, "[VOTE]{FFFFFF} membuat kalimat VOTE harus 128 kata.");
	if(VoteOn) return SendClientMessage(playerid, COLOR_GREY, "[VOTE] Vote telah berlangsung");
	format(string, sizeof(string), "[VOTE]{FFFFFF} Pertanyan: %s.", params);
	SendClientMessageToAll(COLOR_RED, string);
	format(string, sizeof(string), "[VOTE]{FFFFFF} Tekan '{006600}Y{FFFFFF}' untuk {006600}SETUJU, {FFFFFF}Tekan '{FF0000}N{FFFFFF}' untuk {FF0000}TIDAK SETUJU.");
	SendClientMessageToAll(COLOR_RED, string);
	format(string, sizeof(string), "[VOTE]{FFFFFF} Vote akan berakhir dalam 1 menit.");
	SendClientMessageToAll(COLOR_RED, string);
	VoteOn = 1;
	VoteN = 0;
	foreach (new i : Player)
	{
		VoteVoted[i] = 0;
	}
	VoteY = 0;
	SetTimer("VoteEnd", 60000, false);
	return 1;
}

forward VoteEnd(playerid);
public VoteEnd(playerid)
{
	new string[128];
    format(string, sizeof(string), "[HASIL VOTE]{FFFFFF} YES: %d | NO: %d", VoteY, VoteN);
    SendClientMessageToAll(COLOR_LIGHTGREEN, string);
    VoteOn = 0;
	return 1;
}