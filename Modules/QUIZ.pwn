//QUIZ
new quiz,
    answers[256],
    answermade;

CMD:quiz(playerid, params[])
{
    if (pData[playerid][pAdmin] < 1) return PermissionError(playerid);
    new tmp[24], string[256], str[256];
    if(sscanf(params, "s[24]", tmp)) {
        Usage(playerid,"/quiz [options]");
        Info(playerid,"[OPTIONS] question, answer, end");
        return 1;
    }
    if(!strcmp(tmp, "question", true, 8))
    {
        if(sscanf(params, "s[24]s[256]", tmp, str)) return Usage(playerid,"/quiz question [question]");
        if (quiz == 1) return Error(playerid,"Quiz already started you can end it with /quiz end.");
        if (answermade == 0) return Error(playerid,"Please create an answer before!");
        format(string, sizeof(string), "QUIZ: {Ffffff}%s", str);
        SendClientMessageToAll(COLOR_YELLOW, string);
        SendClientMessageToAll(COLOR_YELLOW, "QUIZ: Use {FFFF00}'/quizanswer' {ffffff}to answer the quiz.");
        quiz = 1;
    }
    else if(!strcmp(tmp, "answer", true, 6))
    {
      if(sscanf(params, "s[24]s[256]", tmp, str)) return Usage(playerid, "/quiz answer [answer]");
      if (quiz == 1) return Error(playerid,"Quiz already started you can end it with /quiz end.");
      answers = str;
      answermade = 1;
      Info(playerid,"QUIZ: You've created answer was %s", str);
    }
    else if(!strcmp(tmp, "end", true, 3))
    {
      if (quiz == 0) return Error(playerid,"Quiz has not activated!");
      SendClientMessageToAll(COLOR_YELLOW, "QUIZ: Quiz has been ended by an Admin.");
      answermade = 0;
      quiz = 0;
      answers = "";
    }
    return 1;
}

CMD:quizanswer(playerid, params[])
{
  new tmp[256], string[256];
  if (quiz == 0) return Error(playerid, "There is no active quiz!");
  if (sscanf(params, "s[256]", tmp)) return Usage(playerid,"/quizanswer [answer]");
  if(strcmp(tmp, answers, true)==0)
  {
       format(string, sizeof(string), "QUIZ: {ffffff}The Quiz answer was {FFFF00}'%s'", answers);
       SendClientMessageToAll(COLOR_YELLOW, string);
       format(string, sizeof(string), "QUIZ: %s {ffffff}have won the quiz.", ReturnName(playerid));
       SendClientMessageToAll(COLOR_YELLOW, string);
       answermade = 0;
       quiz = 0;
       answers = "";
  }
  else
  {
       Error(playerid,"Wrong Answer.");
  }
  return 1;
}
