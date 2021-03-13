/*#define MAX_SALARY 15

enum E_SALARY
{
	salOwner,
	salInfo[16],
	salMoney,
	salDate[30]
};
new SalData[MAX_SALARY][E_SALARY];*/

AddPlayerSalary(playerid, info[], money)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO salary(owner, info, money, date) VALUES ('%d', '%s', '%d', CURRENT_TIMESTAMP())", pData[playerid][pID], info, money);
	mysql_tquery(g_SQL, query);
	return true;
}

alias:salary("mysalary")

CMD:salary(playerid, params[])
{
	DisplaySalary(playerid);
	return 1;
}


DisplaySalary(playerid)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM salary WHERE owner='%d' ORDER BY id ASC LIMIT 30", pData[playerid][pID]);
	mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new list[2000], date[30], info[46], money, totalduty, totalsal, total;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pOnDutyTime]));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pTaxiTime]));
		}
		for(new i; i < rows; ++i)
	    {
			cache_get_value(i, "info", info);
			cache_get_value(i, "date", date);
			cache_get_value_int(i, "money", money);
			
			format(list, sizeof(list), "%s"WHITE_E"%s\t%s\t"LG_E"%s\n", list, date, info, FormatMoney(money));
			totalsal += money;
		}
		total = totalduty + totalsal;
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(total));
		
		new title[48];
		format(title, sizeof(title), "Salary: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Close", "");
	}
	else
	{
		new list[2000], totalduty;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pOnDutyTime]));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pTaxiTime]));
		}
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(totalduty));
		
		new title[48];
		format(title, sizeof(title), "Salary: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Close", "");
	}
	return 1;
}


DisplayPaycheck(playerid)
{
	new query[512];
	mysql_format(g_SQL, query, sizeof(query), "SELECT * FROM salary WHERE owner='%d' ORDER BY id ASC LIMIT 30", pData[playerid][pID]);
	mysql_query(g_SQL, query);
	new rows = cache_num_rows();
	if(rows) 
	{
		new list[2000], date[30], info[46], money, totalduty, totalsal, total, bunga, pajak, hasil;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pOnDutyTime]));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pTaxiTime]));
		}
		for(new i; i < rows; ++i)
	    {
			cache_get_value(i, "info", info);
			cache_get_value(i, "date", date);
			cache_get_value_int(i, "money", money);
			
			format(list, sizeof(list), "%s"WHITE_E"%s\t%s\t"LG_E"%s\n", list, date, info, FormatMoney(money));
			totalsal += money;
		}
		if(pData[playerid][pVip] == 1)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 2;
			format(list, sizeof(list), "%s"WHITE_E"Regular Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else if(pData[playerid][pVip] == 2)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 3;
			format(list, sizeof(list), "%s"WHITE_E"Permium Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else if(pData[playerid][pVip] == 3)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 4;
			format(list, sizeof(list), "%s"WHITE_E"VIP Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else
		{
			bunga = 0;
		}
		total = totalduty + totalsal + bunga;
		pajak = total / 100 * 10;
		hasil = total - pajak;
		format(list, sizeof(list), "%s"WHITE_E"     \tTax:\t"RED_E"%s\n", list, FormatMoney(pajak));
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(hasil));
		new title[48];
		format(title, sizeof(title), "Paycheck: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_PAYCHECK, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Get", "Close");
	}
	else
	{
		new list[2000], totalduty, total, bunga, pajak, hasil;
		
		totalduty = pData[playerid][pOnDutyTime] + pData[playerid][pTaxiTime];
		format(list, sizeof(list), ""WHITE_E"Date\tInfo\tAmmount\n");
		if(pData[playerid][pFaction] >= 1)
		{
			format(list, sizeof(list), "%sCurrent Time\tFaction\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pOnDutyTime]));
		}
		if(pData[playerid][pJob] == 1 || pData[playerid][pJob2] == 1)
		{
			format(list, sizeof(list), "%s"WHITE_E"Current Time\tTaxi Duty\t"LG_E"%s\n", list, FormatMoney(pData[playerid][pTaxiTime]));
		}
		if(pData[playerid][pVip] == 1)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 2;
			format(list, sizeof(list), "%s"WHITE_E"Regular Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else if(pData[playerid][pVip] == 2)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 3;
			format(list, sizeof(list), "%s"WHITE_E"Permium Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else if(pData[playerid][pVip] == 3)
		{
			bunga = pData[playerid][pBankMoney] / 100 * 4;
			format(list, sizeof(list), "%s"WHITE_E"VIP Bank\tInterest:\t"LG_E"%s\n", list, FormatMoney(bunga));
		}
		else
		{
			bunga = 0;
		}
		total = totalduty + bunga;
		pajak = total / 100 * 10;
		hasil = total - pajak;
		format(list, sizeof(list), "%s"WHITE_E"     \tTax:\t"RED_E"%s\n", list, FormatMoney(pajak));
		format(list, sizeof(list), "%s"WHITE_E"     \tTotal:\t"LG_E"%s\n", list, FormatMoney(hasil));
		new title[48];
		format(title, sizeof(title), "Paycheck: %s", pData[playerid][pName]);
		ShowPlayerDialog(playerid, DIALOG_PAYCHECK, DIALOG_STYLE_TABLIST_HEADERS, title, list, "Get", "Close");
	}
	return 1;
}


