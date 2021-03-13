//Enums
#define MAX_REPORTS (50)

enum reportData {
    rExists,
    rType,
    rPlayer,
    rText[128 char]
};
new ReportData[MAX_REPORTS][reportData];


Report_GetCount(playerid)
{
    new count;

    for (new i = 0; i != MAX_REPORTS; i ++)
    {
        if(ReportData[i][rExists] && ReportData[i][rPlayer] == playerid)
        {
        count++;
        }
    }
    return count;
}

Report_Clear(playerid)
{
    for (new i = 0; i != MAX_REPORTS; i ++)
    {
        if(ReportData[i][rExists] && ReportData[i][rPlayer] == playerid)
        {
            Report_Remove(i);
        }
    }
}

Report_Add(playerid, const text[], type = 1)
{
    for (new i = 0; i != MAX_REPORTS; i ++)
    {
        if(!ReportData[i][rExists])
        {
            ReportData[i][rExists] = true;
            ReportData[i][rType] = type;
            ReportData[i][rPlayer] = playerid;

            strpack(ReportData[i][rText], text, 128 char);
            return i;
        }
    }
    return -1;
}

Report_Remove(reportid)
{
    if(reportid != -1 && ReportData[reportid][rExists])
    {
        ReportData[reportid][rExists] = false;
        ReportData[reportid][rPlayer] = INVALID_PLAYER_ID;
    }
    return 1;
}

CMD:report(playerid, params[])
{
    new reportid = -1;

    if(isnull(params))
    {
        Usage(playerid, "/report [reason]");
        Info(playerid, "Please only use this command for valid purposes only.");
        return 1;
    }
    if(Report_GetCount(playerid) > 3)
        return Error(playerid, "You already have 3 active reports!");

    if(pData[playerid][pReportTime] >= gettime())
        return Error(playerid, "You must wait %d seconds before sending another report.", pData[playerid][pReportTime] - gettime());

    if((reportid = Report_Add(playerid, params)) != -1)
    {
        Servers(playerid, "YOUR REPORT: {FFFF00}%s", params);
        SendStaffMessage(COLOR_RED, "[Report: #%d] "WHITE_E"%s (ID: %d) reported: %s", reportid, pData[playerid][pName], playerid, params);
        pData[playerid][pReportTime] = gettime() + 180;
    }
    else Error(playerid, "The report list is full. Please wait for a while.");
    return 1;
}

CMD:ar(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);

    if(isnull(params))
        return Usage(playerid, "/ar [report id] (/reports for a list)");

    new
        reportid = strval(params);
        
    if((reportid < 0 || reportid >= MAX_REPORTS) || !ReportData[reportid][rExists])
        return Error(playerid, "Invalid report ID. Reports list from 0 to %d.", MAX_REPORTS);

    SendStaffMessage(COLOR_RED, "%s has accepted %s(%d) report.", pData[playerid][pAdminname], pData[ReportData[reportid][rPlayer]][pName], ReportData[reportid][rPlayer]);
    Servers(ReportData[reportid][rPlayer], "ACCEPT REPORT: {FF0000}%s {FFFFFF}accept your report.", pData[playerid][pAdminname]);
    Report_Remove(reportid);
    return 1;
}

CMD:dr(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return Error(playerid, "You are not authorized to use this command!");

    new reportid, msg[32];
    if(sscanf(params,"ds[32]", reportid, msg))
        return Usage(playerid, "/dr [report id] [reason] (/reports for a list)");

    if((reportid < 0 || reportid >= MAX_REPORTS) || !ReportData[reportid][rExists])
        return Error(playerid, "Invalid report ID. Reports list from 0 to %d.", MAX_REPORTS);

    SendStaffMessage(COLOR_RED, "%s has denied %s(%d) report.", pData[playerid][pAdminname], pData[ReportData[reportid][rPlayer]][pName], ReportData[reportid][rPlayer]);
    Servers(ReportData[reportid][rPlayer], "DENY REPORT: {FF0000}%s {FFFFFF}denied your report: %s.", pData[playerid][pAdminname], msg);

    Report_Remove(reportid);
    return 1;
}

CMD:reports(playerid, params[])
{
    if(pData[playerid][pAdmin] < 1)
   		if(pData[playerid][pHelper] == 0)
     		return PermissionError(playerid);
			
	new gstr[1024], mstr[128], lstr[512];
    strcat(gstr,"ID\tReported\tReport\n",sizeof(gstr));
    for (new i = 0; i != MAX_REPORTS; i ++)
    {
        if(!ReportData[i][rExists])
            continue;

        strunpack(mstr, ReportData[i][rText]);

        if(strlen(mstr) > 32)
            format(lstr,sizeof(lstr), "#%d\t%s (%d)\t%.32s ...\n", i, pData[ReportData[i][rPlayer]][pName], ReportData[i][rPlayer], mstr);
        else
            format(lstr,sizeof(lstr), "#%d\t%s (%d)\t%s\n", i, pData[ReportData[i][rPlayer]][pName], ReportData[i][rPlayer], mstr);

        strcat(gstr,lstr,sizeof(gstr));
        ShowPlayerDialog(playerid, DIALOG_REPORTS, DIALOG_STYLE_TABLIST_HEADERS,"Report's",gstr,"Next","Cancle");
    }
    return 1;
}

CMD:clearreports(playerid, params[])
{
    if(pData[playerid][pAdmin] < 3)
            return PermissionError(playerid);
    new
        count;

    for (new i = 0; i != MAX_REPORTS; i ++)
    {
        if(ReportData[i][rExists]) {
            Report_Remove(i);
            count++;
        }
    }
    if(!count)
        return Error(playerid, "There are no active reports to display.");
            
    SendStaffMessage(COLOR_RED, "%s has removed all reports on the server.", pData[playerid][pAdminname]);
    return 1;
}