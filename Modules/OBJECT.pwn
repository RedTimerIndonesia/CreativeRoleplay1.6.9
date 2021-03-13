#define MAX_COBJECTS 5000

enum E_Objects {
  objID,
  objModel,
  Float:objPos[3],
  Float:objRPos[3],
  obj
};
new ObjData[MAX_COBJECTS][E_Objects],
    Iterator:Obj<MAX_COBJECTS>;

new Float:objPosX[MAX_PLAYERS],
    Float:objPosY[MAX_PLAYERS],
    Float:objPosZ[MAX_PLAYERS],
    Float:objRotX[MAX_PLAYERS],
    Float:objRotY[MAX_PLAYERS],
    Float:objRotZ[MAX_PLAYERS];

function LoadObjects()
{
  new rows = cache_num_rows();
  if (rows) {
    new id;
    for (new i; i < rows; i ++) {
      cache_get_value_name_int(i, "id", ObjData[id][objID]);
      cache_get_value_name_int(i, "model", ObjData[id][objModel]);
      cache_get_value_name_float(i, "posX", ObjData[id][objPos][0]);
      cache_get_value_name_float(i, "posY", ObjData[id][objPos][1]);
      cache_get_value_name_float(i, "posZ", ObjData[id][objPos][2]);
      cache_get_value_name_float(i, "posRX", ObjData[id][objRPos][0]);
      cache_get_value_name_float(i, "posRY", ObjData[id][objRPos][1]);
      cache_get_value_name_float(i, "posRZ", ObjData[id][objRPos][2]);
      ObjData[id][obj] = CreateDynamicObject(ObjData[id][objModel], ObjData[id][objPos][0], ObjData[id][objPos][1], ObjData[id][objPos][2], ObjData[id][objRPos][0], ObjData[id][objRPos][1], ObjData[id][objRPos][2]);
    }
    Iter_Add(Obj, id);
    printf("[Objects] Number of Objects loaded: %d.", rows);
  }
}

Obj_Save(objid) {
  new query[2045];
  mysql_format(g_SQL, query, sizeof(query), "UPDATE objects SET model='%d', posX='%f', posY='%f', posZ='%f', posRX='%f', posRY='%f', posRZ='%f' WHERE id='%d'",
  ObjData[objid][objPos][0],
  ObjData[objid][objPos][1],
  ObjData[objid][objPos][2],
  ObjData[objid][objRPos][0],
  ObjData[objid][objRPos][1],
  ObjData[objid][objRPos][2],
  objid);

  mysql_tquery(g_SQL, query);
  return 1;
}

function OnObjectCreated(id) {
  Obj_Save(id);
  return 1;
}

CMD:createobject(playerid,params[])
{
  if (pData[playerid][pAdmin] < 3)
    return PermissionError(playerid);

  if (isnull(params))
    return Usage(playerid,"/createobject [modelid]");
  
  new objmodel = strval(params), Float:cPos[3], id = Iter_Free(Obj);
  if (id == -1) return Error(playerid,"Cannot create more object!");
  GetPlayerPos(playerid,cPos[0],cPos[1],cPos[2]);

  ObjData[id][objModel] = objmodel;
  ObjData[id][objPos][0] = cPos[0];
  ObjData[id][objPos][1] = cPos[1];
  ObjData[id][objPos][2] = cPos[2];
  ObjData[id][objRPos][0] = 0.0;
  ObjData[id][objRPos][1] = 0.0;
  ObjData[id][objRPos][2] = 0.0;
  ObjData[id][obj] = CreateDynamicObject(ObjData[id][objModel],ObjData[id][objPos][0],ObjData[id][objPos][1],ObjData[id][objPos][2],ObjData[id][objRPos][0],ObjData[id][objRPos][1],ObjData[id][objRPos][2]);
  Iter_Add(Obj, id);
  new query[2054];
  mysql_format(g_SQL,query,sizeof(query),"INSERT INTO objects SET id='%d', posX='%f', posY='%f', posZ='%f', posRX='%f', posRY='%f', posRZ='%f'",id,ObjData[id][objPos][0],ObjData[id][objPos][1],ObjData[id][objPos][2],ObjData[id][objRPos][0],ObjData[id][objRPos][1],ObjData[id][objRPos][2]);
  mysql_tquery(g_SQL, query, "OnObjectCreated", "i", id);

  Servers(playerid,"You have created object model id: %d and object id: %d",objmodel,id);
  return 1;
}

CMD:editobject(playerid,params[])
{
  if (pData[playerid][pAdmin] < 3)
    return PermissionError(playerid);

  new subparams[64], id, value[64];
  if (sscanf(params, "s[64]dS()[64]", subparams, id, value)) {
    Usage(playerid,"/editobject [options] [object id]");
    Info(playerid,"[OPTIONS]: position, change, delete");
    return true;
  }

  if ((id < 0 || id >= MAX_COBJECTS))
    return Error(playerid,"Invalid object id!");

  if (!Iter_Contains(Obj, id))
    return Error(playerid,"Invalid object id or object doesn't exists!");

  if (!strcmp(subparams, "position", true)) {
    EditingObject[playerid] = 1;
    EditingObjectID[playerid] = id;
    GetDynamicObjectPos(ObjData[id][obj], objPosX[playerid], objPosY[playerid], objPosZ[playerid]);
    GetDynamicObjectRot(ObjData[id][obj], objRotX[playerid], objRotY[playerid], objRotZ[playerid]);
    EditDynamicObject(playerid, ObjData[id][obj]);
    Info(playerid,"You are now editing object id: %d.",id);
  } else if (!strcmp(subparams, "change", true)) {
    new newmodel;
    if (sscanf(value, "d", newmodel))
      return Usage(playerid,"/editobject change [id] [model id]");

    ObjData[id][objModel] = newmodel;
    DestroyDynamicObject(ObjData[id][obj]);
    ObjData[id][obj] = CreateDynamicObject(ObjData[id][objModel],ObjData[id][objPos][0],ObjData[id][objPos][1],ObjData[id][objPos][2],ObjData[id][objRPos][0],ObjData[id][objRPos][1],ObjData[id][objRPos][2]);
    Info(playerid,"You has changed object model id: %d to %d.",id,newmodel);
    Obj_Save(id);
  } else if (!strcmp(subparams, "delete", true)) {
    new query[128];
    ObjData[id][objModel] = 0;
    ObjData[id][objPos][0] = 0.0;
    ObjData[id][objPos][1] = 0.0;
    ObjData[id][objPos][2] = 0.0;
    ObjData[id][objRPos][0] = 0.0;
    ObjData[id][objRPos][1] = 0.0;
    ObjData[id][objRPos][2] = 0.0;
    
    DestroyDynamicObject(ObjData[id][obj]);

    Iter_Remove(Obj, id);

    mysql_format(g_SQL,query,sizeof(query),"DELETE FROM objects WHERE id='%d'", id);
    mysql_tquery(g_SQL,query);
    Info(playerid,"You has deleted object id %d.",id);
  }
  return 1;
}

CMD:onear(playerid)
{
  if (pData[playerid][pAdmin] < 3)
    return PermissionError(playerid);

  foreach (new i : Obj) {
    new Float:pX, Float:pY, Float:pZ;
    new Float:oX, Float:oY, Float:oZ;
    GetDynamicObjectPos(ObjData[i][obj], oX, oY, oZ);
    GetPlayerPos(playerid, pX, pY, pZ);
    if (IsPlayerInRangeOfPoint(playerid, 35.0, oX, oY, oZ)) {
      Info(playerid,"[Objects Nearest]: Object id %d is %f from you", i, GetPlayerDistanceFromPoint(playerid, oX, oY, oZ));
    }
  }
  return 1;
}

CMD:gotoobject(playerid, params[])
{
  if (pData[playerid][pAdmin] < 3)
    return PermissionError(playerid);

  new objid;
  if (sscanf(params, "d", objid))
    return Usage(playerid,"/gotoobject [object id]");

  if (!Iter_Contains(Obj, objid)) return Error(playerid,"Invalid object id!");

  SetPlayerPos(playerid, ObjData[objid][objPos][0], ObjData[objid][objPos][1], ObjData[objid][objPos][2]);
  SetPlayerInterior(playerid, 0);
  SetPlayerVirtualWorld(playerid, 0);
  pData[playerid][pInDoor] = -1;
  pData[playerid][pInHouse] = -1;
  pData[playerid][pInBiz] = -1;
  Info(playerid,"You've been teleported to object ID: %d.",objid);
  return 1;
}