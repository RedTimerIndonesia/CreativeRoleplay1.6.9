CMD:anim(playerid, params[])
{
    new 
        Index = strval(params),
        AnimLib[32],
        AnimName[32];

    //cek apakah animnya 0 atau lebih dari 1812
    if(Index < 1 || Index > 1812)
        return Usage(playerid, "/anim [1-1812] Note: Klik kiri atau CTRL Kiri untuk Men-stop animation");

    //kalau bukan ya eksekusi, get animasi nya.
    GetAnimationName(Index, AnimLib, 32, AnimName, 32);

    //kalau datanya sudah diambil, ya tinggal Aplikasikan animasinya ke player dong.
    ApplyAnimation(playerid, AnimLib, AnimName, 4.1, 1, 1, 1, 1, 1, 1);
    return 1;
}  