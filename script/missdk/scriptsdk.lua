--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading ScriptSdk.lua" )

Page       = {}				
Exchange  = {}
ExchangeX = {}
FuncList  = {}
Trade     = {}				
Goods	 = {}				
Mission    = {}				
MisLogList = {}				
TriggerList = {}			
NpcMissionList  = {}		
Trigger  = {}

NpcInfoList = {}			
NpcInfoList.count = 0		

MapList = {}				
MapList.count = 0			

RandParam = {}			

NpcList	= {}				

NpcPointer = LUA_NULL	

Profession = {} 			
Category  = {}				

BerthPortList = {}		

ResourceList = {}		
ResourceList.wood = {}
ResourceList.mine = {}

BoatLevelList = {}		
talklist = {}				

PRIZE_SELONE          = 0
PRIZE_SELALL           = 1

NOMAL_MISSION		  = 0 		
RAND_MISSION		  = 1		
WORLD_MISSION		  = 2 	    

ALLWAYS_SHOW		 	= 0 	
COMPLETE_SHOW   		= 1 	
ACCEPT_SHOW				= 2		

MIS_RAND_KILL		  = 0   	
MIS_RAND_GET		  = 1		
MIS_RAND_SEND		  = 2		
MIS_RAND_CONVOY    = 3			
MIS_RAND_EXPLORE	  = 4		

MIS_CONVOY_NPC	  = 0		
MIS_CONVOY_MAP	  = 1		

--´¥·¢Æ÷ÀàÐÍ
MIS_TRIGGER_NOMAL	= 0	 --ÆÕÍ¨
MIS_TRIGGER_RAND		= 1	 --Ëæ»ú(ÓÃÓÚËæ»úÈÎÎñÖÐ£¬Ê¹ÓÃÊ±¸ù¾Ý´«µÝµÄ²ÎÊýÉèÖÃ´¥·¢Æ÷ÐÅÏ¢)

--Ëæ»úÈÎÎñÃ¿¸ö¶Î±ØÐëÍê³ÉµÄÈÎÎñ»ùÊý£¬²Å¿ÉÒÔ²úÉú½±ÀøÎïÆ·
MIS_RAND_MAXCOMPLETE = 1

--Ëæ»úÈÎÎñµÈ¼¶ÀàÐÍ
MIS_LEVEL_CHAR 	= 0	    --½ÇÉ«Ëæ»úÈÎÎñµÈ¼¶ÀàÐÍ
MIS_LEVEL_GANG 	= 1		--¹«»áËæ»úÈÎÎñµÈ¼¶ÀàÐÍ

--Ëæ»úÈÎÎñ½±Àø¾­ÑéÀàÐÍ
MIS_EXP_NOMAL 		= 0		--½±ÀøÆÕÍ¨¾­Ñé
MIS_EXP_SAIL			= 1		--½±Àøº½º£¾­Ñé
MIS_EXP_LIFE			= 2		--½±ÀøÉú»î¾­Ñé

--¸÷ÖÖÊµÌåÀàÐÍÐÅÏ¢
BASE_ENTITY			= 0		--»ù±¾ÊµÌå
RESOURCE_ENTITY	= 1		--×ÊÔ´ÊµÌå
TRANSIT_ENTITY		= 2		--´«ËÍÊµÌå
BERTH_ENTITY		= 3		--Í£²´ÊµÌå

--NPC½»Ò×·½Ê½ÀàÐÍ
TRADE_NOMAL			= 0		--ÆÕÍ¨½»Ò×
TRADE_GOODS		= 2		--»õÎï½»Ò×

--ÈÎÎñ½±ÀøÎïÆ·ÀàÐÍ
MIS_ITEM_INST_BUY	= 0	--ÉÌµêÂòÂô
MIS_ITEM_INST_MONS	= 1	--¹ÖÎïµôÂä
MIS_ITEM_INST_COMP	= 2	--ºÏ³É
MIS_ITEM_INST_TASK	= 3	--ÈÎÎñ»ñµÃ

--ÏÂÃæÊÇleoµÄºÚÊÐÉÌÈË
MoliTable ={}
NakaTable ={}
CoinTable1000 ={}
CoinTable600 ={}

MoliTable[1]=0766
MoliTable[2]=0769
MoliTable[3]=0773
MoliTable[4]=0776
MoliTable[5]=0780
MoliTable[6]=0784
MoliTable[7]=0788
MoliTable[8]=0792
MoliTable[9]=0795
MoliTable[10]=0798
MoliTable[11]=0802
MoliTable[12]=0806

NakaTable[1]=0765
NakaTable[2]=0768
NakaTable[3]=0772
NakaTable[4]=0775
NakaTable[5]=0779
NakaTable[6]=0783
NakaTable[7]=0787
NakaTable[8]=0791
NakaTable[9]=0794
NakaTable[10]=0797
NakaTable[11]=0801
NakaTable[12]=0805
NakaTable[13]=0807
NakaTable[14]=0808
NakaTable[15]=0809
NakaTable[16]=0810
NakaTable[17]=0811
NakaTable[18]=0812
NakaTable[19]=0813
NakaTable[20]=0814
NakaTable[21]=0815
NakaTable[22]=0877

CoinTable1000[1]=7441
CoinTable1000[2]=7442
CoinTable1000[3]=7457
CoinTable1000[4]=7458
CoinTable1000[5]=7459
CoinTable1000[6]=7460
CoinTable1000[7]=7461
CoinTable1000[8]=7462
CoinTable1000[9]=7463
CoinTable1000[10]=7464
CoinTable1000[11]=7465
CoinTable1000[12]=7466
CoinTable1000[13]=7468
CoinTable1000[14]=7470
CoinTable1000[15]=7471
CoinTable1000[16]=7630
CoinTable1000[17]=7631
CoinTable1000[18]=7632
CoinTable1000[19]=7633
CoinTable1000[20]=7634
CoinTable1000[21]=7635
CoinTable1000[22]=7636
CoinTable1000[23]=7637
CoinTable1000[24]=7638
CoinTable1000[25]=7639
CoinTable1000[26]=7640
CoinTable1000[27]=7641
CoinTable1000[28]=7642
CoinTable1000[29]=7647
CoinTable1000[30]=7648
CoinTable1000[31]=7649
CoinTable1000[32]=7650
CoinTable1000[33]=7651
CoinTable1000[34]=7652
CoinTable1000[35]=7653
CoinTable1000[36]=7654

CoinTable600[1]=0763
CoinTable600[2]=0770
CoinTable600[3]=0777
CoinTable600[4]=0781
CoinTable600[5]=0785
CoinTable600[6]=0789
CoinTable600[7]=0799
CoinTable600[8]=0803
CoinTable600[9]=0763
CoinTable600[10]=0770
CoinTable600[11]=0777
CoinTable600[12]=0781
CoinTable600[13]=0785
CoinTable600[14]=0789
CoinTable600[15]=0799
CoinTable600[16]=0803
CoinTable600[17]=0763
CoinTable600[18]=0770
CoinTable600[19]=0777
CoinTable600[20]=0781
CoinTable600[21]=0785
CoinTable600[22]=0789
CoinTable600[23]=0799
CoinTable600[24]=0803
CoinTable600[25]=0763
CoinTable600[26]=0770
CoinTable600[27]=0777
CoinTable600[28]=0781
CoinTable600[29]=0785
CoinTable600[30]=0789
CoinTable600[31]=0799
CoinTable600[32]=0803
CoinTable600[33]=0763
CoinTable600[34]=0770
CoinTable600[35]=0777
CoinTable600[36]=0781
CoinTable600[37]=0785
CoinTable600[38]=0789
CoinTable600[39]=0799
CoinTable600[40]=0803
CoinTable600[41]=0763
CoinTable600[42]=0770
CoinTable600[43]=0777
CoinTable600[44]=0781
CoinTable600[45]=0785
CoinTable600[46]=0789
CoinTable600[47]=0799
CoinTable600[48]=0803
CoinTable600[49]=0763
CoinTable600[50]=0770
CoinTable600[51]=0777
CoinTable600[52]=0781
CoinTable600[53]=0785
CoinTable600[54]=0789
CoinTable600[55]=0799
CoinTable600[56]=0803
----------------leoºÚÊÐÉÌÈË end
------------------------------------------------------------

--³õÊ¼»¯·þÎñÆ÷´¬Ö»Éý¼¶ÐÅÏ¢
function InitBoatLevel()
	BoatLevelList = {}
	BoatLevelList.count = 0
end

--Ìí¼Ó´¬Ö»Éý¼¶Êý¾ÝÐÅÏ¢
function AddBoatLevel( level, money, exp )
	BoatLevelList.count = BoatLevelList.count + 1
	BoatLevelList[level] = {}
	BoatLevelList[level].money = money
	BoatLevelList[level].exp = exp	
	LG( "boatlevel_init", "AddBoatLevel: count, level, money, exp", BoatLevelList.count, level, money, exp )
end

--³õÊ¼»¯µØÍ¼ÁÐ±íÐÅÏ¢
function InitMap()
	MapList = {}
	MapList.idname = {}
	MapList.mapname = {}
	MapList.count = 0
end

--Ìí¼ÓµØÍ¼Ãû³ÆÐÅÏ¢×Ô¶¯Éú³ÉµØÍ¼Î¨Ò»ID
function AddMap( idname, str )
	for n = 1, MapList.count, 1 do
		if MapList.mapname[n] == nil or MapList.idname[n] == nil then
			break
		end
		if MapList.mapname[n] == str or MapList.idname[n] == idname then
			return
		end
	end
	MapList.count = MapList.count + 1
	MapList.idname[MapList.count] = idname
	MapList.mapname[MapList.count] = str
	LG( "mission", "Set map ["..MapList.mapname[MapList.count].."], IDNAME = "..MapList.idname[MapList.count].."ID = "..MapList.count )
	PRINT( "Set map ["..MapList.mapname[MapList.count].."], IDNAME = "..MapList.idname[MapList.count].."ID = "..MapList.count )
	
	local ret = SetMap( MapList.idname[MapList.count], MapList.count )
	if ret == LUA_FALSE then
		LG( "mission", "Set map notice failed ["..MapList.mapname[MapList.count].."], IDNAME = "..MapList.idname[MapList.count].."ID = "..MapList.count )
		PRINT( "Set map notice failed ["..MapList.mapname[MapList.count].."], IDNAME = "..MapList.idname[MapList.count].."ID = "..MapList.count )
	end
end

--»ñµÃÖ¸¶¨IDµÄµØÍ¼Ãû³Æ
function GetMap( mapid )
	if mapid > MapList.count or MapList.mapname[mapid] == nil then
		return "Unknown map name"
	end
	
	return MapList.mapname[mapid]
end

--³õÊ¼»¯¶Ô»°Ò³ÐÅÏ¢
function InitPage()
	Page = {}
	Page.trade = {}
	for i = 1, 32, 1 do
		Page[i] = {}
		Page[i].count = 0
		for n = 1, 12, 1 do
			Page[i][n] = {}
		end
	end
	Page[1].ismission = 1
end

--³õÊ¼»¯½»Ò×Ò³ÐÅÏ¢
function InitTrade()
	Trade = {}
	Trade.tp = TRADE_NOMAL
	Trade.berth = -1
	
	--ÎäÆ÷
	Trade[1] = {}
	Trade[1].itemtype = WEAPON
	Trade[1].count = 0;
	Trade[1].item = {}
	Trade[1].price = {}
	--·À¾ß
	Trade[2] = {}
	Trade[2].itemtype = DEFENCE
	Trade[2].count = 0;
	Trade[2].item = {}
	Trade[2].price = {}
	--ÔÓÏî
	Trade[3] = {}
	Trade[3].itemtype = OTHER
	Trade[3].count = 0;
	Trade[3].item = {}
	Trade[3].price = {}
	--ºÏ³É
	Trade[4] = {}
	Trade[4].itemtype = SYNTHESIS
	Trade[4].count = 0;
	Trade[4].item = {}
	Trade[4].price = {}
end

function InitTradeX( trade )
--	trade = {}
--	trade.tp = TRADE_NOMAL
--	trade.berth = -1
	
	--ÎäÆ÷
--	trade[1] = {}
	trade[1].itemtype = WEAPON
	trade[1].count = 0;
--	trade[1].item = {}
--	trade[1].price = {}
	--·À¾ß
--	trade[2] = {}
	trade[2].itemtype = DEFENCE
	trade[2].count = 0;
--	trade[2].item = {}
--	trade[2].price = {}
	--ÔÓÏî
--	trade[3] = {}
	trade[3].itemtype = OTHER
	trade[3].count = 0;
--	trade[3].item = {}
--	trade[3].price = {}
	--ºÏ³É
--	trade[4] = {}
	trade[4].itemtype = SYNTHESIS
	trade[4].count = 0;
--	trade[4].item = {}
--	trade[4].price = {}
end

--³õÊ¼»¯»õÎï½»Ò×ÐÅÏ¢
function InitGoods( berth )
	Trade = {}
	Trade.tp = TRADE_GOODS
	Trade.berth = berth

	--ÎäÆ÷
	Trade[1] = {}
	Trade[1].itemtype = WEAPON
	Trade[1].count = 0;
	Trade[1].item = {}
	Trade[1].price = {}
	--·À¾ß
	Trade[2] = {}
	Trade[2].itemtype = DEFENCE
	Trade[2].count = 0;
	Trade[2].item = {}
	Trade[2].price = {}
	--ÔÓÏî
	Trade[3] = {}
	Trade[3].itemtype = OTHER
	Trade[3].count = 0;
	Trade[3].item = {}
	Trade[3].price = {}
	--ºÏ³É
	Trade[4] = {}
	Trade[4].itemtype = SYNTHESIS
	Trade[4].count = 0;
	Trade[4].item = {}
	Trade[4].price = {}
end

--³õÊ¼»¯npcÈÎÎñÁÐ±íÐÅÏ¢
function InitNpcMission()
	NpcMissionList = {}
	NpcMissionList.count = 0
	--for n = 1, 32, 1 do
		--NpcMissionList[n] = {}
	--end	
end

--npc¶Ô»°ÐÅÏ¢º¯Êý
function ResetNpcInfo( npc, name )
	InitPage()
	InitTrade()
	InitNpcMission()
	NpcPointer = npc
	local str = "Initialization NPC ["..name.."] script notice successful!"
	PRINT( str )
	LG( "npcinit", str )
end

--»ñÈ¡npc¶Ô»°ÐÅÏ¢ºÍ½»Ò×ÐÅÏ¢ID
function GetNpcInfo( npc, name )
	NpcInfoList.count = NpcInfoList.count + 1
	NpcInfoList[NpcInfoList.count] = {}
	NpcInfoList[NpcInfoList.count].page = Page
	NpcInfoList[NpcInfoList.count].trade = Trade
	NpcInfoList[NpcInfoList.count].eXchange = ExchangeX
	NpcInfoList[NpcInfoList.count].missionlist = NpcMissionList
	SetNpcScriptID( npc, NpcInfoList.count )
	if NpcMissionList.count > 0 then
		LG( "mission", "Set NPC bring quest label!" )
		SetNpcHasMission( npc, 1 )
	end
	NpcPointer = LUA_NULL
	
	local str = "Obtain NPC ["..name.."] script data notice, ID = "..NpcInfoList.count
	PRINT( str )
	LG( "npcinit", str )
end

--¶¯Ì¬ÐÞ¸Änpc½Å±¾ÐÅÏ¢
function ModifyNpcInfo( npc, name, id )
	PRINT( "ModifyNpcInfo:npc = , name = , id = ", npc, name, id )
	
	NpcInfoList[id] = {}
	NpcInfoList[id].page = Page
	NpcInfoList[id].trade = Trade
	NpcInfoList[id].eXchange = ExchangeX
	NpcInfoList[id].missionlist = NpcMissionList
	
	PRINT( "set npcscript  notice ID = ", id )
	--SetNpcScriptID( npc, id )
	if NpcMissionList.count > 0 then
		PRINT( "mission", "Set NPC bring quest label!" )
		SetNpcHasMission( npc, 1 )
	else
		PRINT( "mission", "set NPC does not carry quest label !" )
		SetNpcHasMission( npc, 0 )
	end
	
	NpcPointer = LUA_NULL
	
	local str = "ÐÞ¸ÄNPC¡¶"..name.."] script data notice, ID = "..id
	PRINT( str )
	LG( "npcinit", str )
end

-- Âûçîâ ÍÏÑ
function NpcProc( character, npc, rpk, id )
	PRINT( "NpcProc:character, npc, rpk, id",  character, npc, rpk, id )
	if NpcInfoList[id] == nil then
		PRINT( "unable to obtain NPC script notice!ID = ",  id )
		local npcname = GetCharName( npc )
		local str = npcname..":_Ïðèâåò! Íè÷åì íå ìîãó òåáå ïîìî÷ü. "
		SendPage( character, npc, 0, str, nil, 0 )
		return
	end
	MsgProc( character, npc, rpk, NpcInfoList[id].page, NpcInfoList[id].trade, NpcInfoList[id].missionlist )
end

--npcÈÎÎñ×´Ì¬´¦Àíº¯Êý
function NpcState( character, npcid, id )
   PRINT( "NpcState:character, npcid, NpcMissionList", character, npcid, id )
	if NpcInfoList[id] == nil or NpcInfoList[id].missionlist == nil then
		PRINT( "unable to obtain NPC script notice!ID = ",  id )
		LG( "npc_error", "unable to obtain NPC script notice!ID = ",  id )
		return LUA_FALSE
	end

   return MissionState( character, npcid, NpcInfoList[id].missionlist )
end

--ÖØÐÂ×°ÔØnpc´¦ÀíÐÅÏ¢
function NpcInfoReload( name,  func )
	PRINT( "NpcInfoReload: name, findnpc ", name, FindNpc )
	local ret, npc, id = FindNpc( name )
	if ret == LUA_FALSE or npc == nil or id == nil then
		print( "unfound ["..name.."] NPC!" )
		return
	end
	PRINT( "got npc notice, pointer =, id = ", npc, id )
	
	print( GetCharName( npc ) )

	ResetNpcInfo( npc, name )
	PRINT( "ResetNpcInfo, npc = , name = ", npc, name )
	
	func()
	PRINT( "Func = ", func )
	
	ModifyNpcInfo( npc, name, id )
	PRINT( "ModifyNpcInfo, name = , id = ", name, id )
	print( "Edit NPC ["..name.."] script notice successful!" )
end

--¶Ô»°ÃèÊöÐÅÏ¢×¢²á
function Talk( pageid, talk )
	Page[pageid].count = Page[pageid].count + 1
	Page[pageid][Page[pageid].count].talk = talk
	LG( "npcinit", "Talk:pageid, count, talk", pageid, Page[pageid].count, Page[pageid][Page[pageid].count].talk )
end

--¶Ô»°Ñ¡ÏîÐÅÏ¢×¢²á
function Text( pageid, text, func, p1, p2, p3, p4 )
	Page[pageid].count = Page[pageid].count + 1
	Page[pageid][Page[pageid].count].text = text
	Page[pageid][Page[pageid].count].func = func
	Page[pageid][Page[pageid].count].p1 = p1
	Page[pageid][Page[pageid].count].p2 = p2
	Page[pageid][Page[pageid].count].p3 = p3
	Page[pageid][Page[pageid].count].p4 = p4
	LG( "npcinit", "Text:pageid, count, text, func, p1, p2, p3, p4 ", pageid, Page[pageid].count, text, func, p1, p2, p3, p4 )
end

--ÉèÖÃ¶Ô»°Ò³°üº¬ÈÎÎñÐÅÏ¢
function MisListPage( pageid )
	Page[pageid].ismission = 1
	LG( "npcinit", "MisListPage:"..pageid )
end

--½»Ò×ÐÅÏ¢×¢²á
function Weapon( id )
	--ÎäÆ÷
	Trade[1].count = Trade[1].count + 1;
	Trade[1].item[Trade[1].count] = id
	LG( "npcinit", "Weapon:count, id", Trade[1].count, id )
end
function Defence( id )
	--·À¾ß
	Trade[2].count = Trade[2].count + 1;
	Trade[2].item[Trade[2].count] = id
	LG( "npcinit", "Defence:count, id", Trade[2].count, id )
end
function Other( id )
	--ÔÓÏî
	Trade[3].count = Trade[3].count + 1;
	Trade[3].item[Trade[3].count] = id
	LG( "npcinit", "Other:count, id", Trade[3].count, id )
end
function OtherX( trade, id )
	trade[3].count = trade[3].count + 1;
	trade[3].item[trade[3].count] = id
end
function Synthesis( id )
	--ºÏ³É
	Trade[4].count = Trade[4].count + 1;
	Trade[4].item[Trade[4].count] = id
	LG( "npcinit", "Synthesis:count, id", Trade[4].count, id )
end

--½»Ò×»õÎïÂòÂôÊÕ¹ºÐÅÏ¢
function SaleGoodsData( level, id, num, price, pricerange )
	if level == nil or id == nil or num == nil or price == nil or pricerange == nil then
		LG( "npcinit_error", "SaleGoodsData:Function parameter error!level, id, num, price, pricerange", level, id, num, price, pricerange )
		return
	end
	
	Trade[1].count = Trade[1].count + 1	
	
	--¼ÇÂ¼»õÎïÊý¾Ý
	Trade[1].item[Trade[1].count] = {}
	Trade[1].item[Trade[1].count].level = level
	Trade[1].item[Trade[1].count].id = id
	Trade[1].item[Trade[1].count].count = num
	Trade[1].item[Trade[1].count].num = num
	
	--ÎïÆ·¼Û¸ñÐÅÏ¢
	Trade[1].price[Trade[1].count] = {}
	Trade[1].price[Trade[1].count].price = price
	Trade[1].price[Trade[1].count].range = pricerange
	Trade[1].price[Trade[1].count].curprice = price + Rand( pricerange )
	LG( "npcinit_trade", "SaleGoodsData, count, level, id, num, price, range, curprice", Trade[1].count, level, id, num, price, pricerange, Trade[1].price[Trade[1].count].curprice )
end

--³õÊ¼»¯ºÚÊÐ¶Ò»»ÐÅÏ¢
function InitExchange()
	Exchange = {}
	Exchange.count = 0
	Exchange.srcid = {}
	Exchange.srcnum = {}
	Exchange.tarid = {}
	Exchange.tarnum = {}
	Exchange.timenum = {}
end

function InitExchangeX()
	ExchangeX = {}
	ExchangeX.count = 0
	ExchangeX.srcid = {}
	ExchangeX.srcnum = {}
	ExchangeX.tarid = {}
	ExchangeX.tarnum = {}
end

--ºÚÊÐÉÌÈË¶Ò»»
function ExchangeData( srcID, srcNum, tarID, tarNum, timeNum )
	if srcID == nil or srcNum == nil or tarID == nil or tarNum == nil or timeNum == nil then
		LG( "npcinit_error", "ExchangeData:º¯Êý²ÎÊý´íÎó£¡srcID, srcNum, tarID, tarNum, timeNum", srcID, srcNum, tarID, tarNum, timeNum )
		return
	end
	
	Exchange.count = Exchange.count + 1	
	
	--¶Ò»»Êý¾Ý
	Exchange.srcid[Exchange.count] = srcID
	Exchange.srcnum[Exchange.count] = srcNum
	Exchange.tarid[Exchange.count] = tarID
	Exchange.tarnum[Exchange.count] = tarNum
	Exchange.timenum[Exchange.count] = timeNum
end

function ExchangeDataX( srcID, srcNum, tarID, tarNum )
	if srcID == nil or srcNum == nil or tarID == nil or tarNum == nil then
		LG( "npcinit_error", "ExchangeDataX:º¯Êý²ÎÊý´íÎó£¡srcID, srcNum, tarID, tarNum", srcID, srcNum, tarID, tarNum )
		return
	end
	
	ExchangeX.count = ExchangeX.count + 1	
	
	--¶Ò»»Êý¾Ý
	ExchangeX.srcid[ExchangeX.count] = srcID
	ExchangeX.srcnum[ExchangeX.count] = srcNum
	ExchangeX.tarid[ExchangeX.count] = tarID
	ExchangeX.tarnum[ExchangeX.count] = tarNum
end

--LeoµÄºÚÊÐÉÌÈË¼ÓÇ¿°æ£¬È«Ëæ»úÊý
function DoExchange()
	local intMoney =0
	local intGoods =0
	local intMoneyNum =0

	local intNum=0
	local intCount=0

	for intCount=1 , 8 ,1 do
		intNum = math.floor(math.random(1,4))
		if intNum == 1 then	--Ä¦Á¦·ûÊ¯2¸ö
			intMoney = 1028
			intMoneyNum = 2
			intGoods = MoliTable[math.floor(math.random(1,12))]
		elseif intNum ==2 then	--ÄÉ¿¨·ûÊ¯1¸ö	
			intMoney = 3457
			intMoneyNum = 1
			intGoods = NakaTable[math.floor(math.random(1,22))]
		elseif intNum ==3 then	--¾«ÁéÓ²±Ò1000¸ö
			intMoney = 3457
			intMoneyNum = 5000
			intGoods = CoinTable1000[math.floor(math.random(1,36))]
		elseif intNum ==4 then	--¾«ÁéÓ²±Ò600¸ö
			intMoney = 855
			intMoneyNum = 600
			intGoods = CoinTable600[math.floor(math.random(1,56))]
		end

		ExchangeData( intMoney, intMoneyNum , intGoods, 1, 1 )
	end
end

function BuyGoodsData( level, id, num, price, pricerange )
	if level == nil or id == nil or num == nil or price == nil or pricerange == nil then
		LG( "npcinit_error", "BuyGoodsData:Function parameter error!level, id, num, price, pricerange", level, id, num, price, pricerange )
		return
	end
	
	Trade[2].count = Trade[2].count + 1
	
	--¼ÇÂ¼»õÎïÊý¾Ý
	Trade[2].item[Trade[2].count] = {}
	Trade[2].item[Trade[2].count].level = level
	Trade[2].item[Trade[2].count].id = id
	Trade[2].item[Trade[2].count].count = num
	Trade[2].item[Trade[2].count].num = num
	
	--ÎïÆ·¼Û¸ñÐÅÏ¢
	Trade[2].price[Trade[2].count] = {}
	Trade[2].price[Trade[2].count].price = price
	Trade[2].price[Trade[2].count].range = pricerange
	Trade[2].price[Trade[2].count].curprice = price + Rand( pricerange )
	LG( "npcinit_trade", "BuyGoodsData, count, level, id, num, price, range, curprice", Trade[2].count, level, id, num, price, pricerange, Trade[2].price[Trade[2].count].curprice )
end

--»õÎï½»Ò×³öÊÛÎïÆ·¼Û¸ñÊýÁ¿¸üÐÂ
function UpdateGoodsData( tradenpc )
	PRINT( "UpdateGoodsData" )
	if tradenpc == nil then
		PRINT( "UpdateGoodsData:Function parameter error!" )
		LG( "UpdateGoodsData:Function parameter error!" )
		return LUA_ERROR
	end

	local name = GetCharName( tradenpc )
	local ret, id = GetScriptID( tradenpc )
	if ret ~= LUA_TRUE then
		PRINT( "UpdateGoodsData:GetScriptID, obtain npc"..name.."script notice ID failed!" )
		LG( "npctrade_error", "UpdateGoodsData:GetScriptID, obtain npc"..name.."script notice ID failed!" )
		return LUA_FALSE
	end

	if NpcInfoList == nil or NpcInfoList[id] == nil then		
		PRINT( "UpdateGoodsData:GetScriptID, npc"..name.."script notice does not exist! NpcInfoList, ID", NpcInfoList, id )
		LG( "npctrade_error", "UpdateGoodsData:npc"..name.."script notice does not exist! NpcInfoList,  ID", NpcInfoList, id )
		return LUA_FALSE
	end
	
	PRINT( name..": update trade data notice" )	
	local trade = NpcInfoList[id].trade
	for n = 1, trade[1].count, 1 do
		trade[1].item[n].count = trade[1].item[n].num
		trade[1].price[n].curprice = trade[1].price[n].price + Rand( trade[1].price[n].range )
		PRINT( "Sell item: ID = , Count = , CurPrice = ", trade[1].item[n].id, trade[1].item[n].count, trade[1].price[n].curprice )
	end
	
	for n = 1, trade[2].count, 1 do
		trade[2].item[n].count = trade[2].item[n].num
		trade[2].price[n].curprice = trade[2].price[n].price + Rand( trade[2].price[n].range )
		PRINT( "Purchase item: ID = , Count = , CurPrice = ", trade[2].item[n].id, trade[2].item[n].count, trade[2].price[n].curprice )
	end
	
	SendAllGoodsData( tradenpc, trade )
	return LUA_TRUE	
end

--¶¨Ê±¸üÐÂ³öÊÛ»õÎïÖÖÀà
function UpdateGoodsKinds( tradenpc )
	PRINT( "UpdateGoodsData" )
	if tradenpc == nil then
		PRINT( "UpdateGoodsData:º¯Êý²ÎÊý´íÎó£¡" )
		LG( "UpdateGoodsData:º¯Êý²ÎÊý´íÎó£¡" )
		return LUA_ERROR
	end

	local name = GetCharName( tradenpc )
	local ret, id = GetScriptID( tradenpc )
	if ret ~= LUA_TRUE then
		PRINT( "UpdateGoodsData:GetScriptID£¬»ñÈ¡npc"..name.."½Å±¾ÐÅÏ¢IDÊ§°Ü£¡" )
		LG( "npctrade_error", "UpdateGoodsData:GetScriptID£¬»ñÈ¡npc"..name.."½Å±¾ÐÅÏ¢IDÊ§°Ü£¡" )
		return LUA_FALSE
	end

	if NpcInfoList == nil or NpcInfoList[id] == nil then		
		PRINT( "UpdateGoodsData:GetScriptID£¬npc"..name.."½Å±¾ÐÅÏ¢²»´æÔÚ£¡NpcInfoList, ID", NpcInfoList, id )
		LG( "npctrade_error", "UpdateGoodsData:npc"..name.."½Å±¾ÐÅÏ¢²»´æÔÚ£¡NpcInfoList,  ID", NpcInfoList, id )
		return LUA_FALSE
	end
	
	PRINT( name..": ¸üÐÂ½»Ò×Êý¾ÝÐÅÏ¢" )	
	
	local trade = NpcInfoList[id].trade
	InitTradeX( trade )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	OtherX( trade, rand() )
	SendTradeUpdate( tradenpc, tradenpc, trade, TRADE_BUY, 0 )
	
	InitExchange()
	DoExchange()
	SendExchangeUpdateData( tradenpc, tradenpc )
	
	return LUA_TRUE
end

--³õÊ¼»¯È«¾Ö¶àº¯ÊýÁÐ±í
function InitFuncList()
	LG( "npcinit", "InitFuncList" )
	FuncList = {}
	FuncList.count = 0
end

--Ìí¼Óº¯ÊýÁÐ±íÐÅÏ¢
function AddFuncList( func, p1, p2, p3, p4 )
	FuncList.count = FuncList.count + 1
	FuncList[FuncList.count] = {}
	FuncList[FuncList.count].func = func
	FuncList[FuncList.count].p1 = p1
	FuncList[FuncList.count].p2 = p2
	FuncList[FuncList.count].p3 = p3
	FuncList[FuncList.count].p4 = p4
	LG( "npcinit", "AddFuncList, func, p1, p2, p3, p4", func, p1, p2, p3, p4 )
end

--»ñÈ¡º¯ÊýÁÐ±íÐÅÏ¢
function GetFuncList()
	return FuncList
end

function GetNumFunc()
	return FuncList.count
end

--³õÊ¼»¯È«¾Ö´¥·¢Æ÷
function InitTrigger()
	LG( "trigger", "InitTrigger" )
	Trigger = {}	
	for n = 1, 16, 1 do
		Trigger[n] = {}
		Trigger[n].tp = MIS_TRIGGER_NOMAL
		Trigger[n].conditions = {}
		Trigger[n].conditions.count = 0
		Trigger[n].actions = {}
		Trigger[n].actions.count = 0
		Trigger[n].failures = {}
		Trigger[n].failures.count = 0
		--for i = 1, 12, 1 do
			--Trigger[n].conditions[i] = {}
			--Trigger[n].actions[i] = {}
			--Trigger[n].failures[i] = {}
		--end
	end
end

--ÉèÖÃ´¥·¢Æ÷µÄÊÂ¼þÀàÐÍºÍÆô¶¯·½Ê½
function SetTrigger( id, startup, event )	
	if Trigger[id] == nil then
		return LG( "trigger", "SetTrigger: incorrect trigger search ID = "..id )		
	end
	Trigger[id].startup = startup
	Trigger[id].event   = event 
end

--´¥·¢Æ÷ÀàÐÍÉè¶¨
function SetTriggerType( id, tp )
	LG( "trigger", "SetTriggerType: id, tp ", id, tp )
	Trigger[id].tp = tp
end

--´¥·¢Æ÷Ìõ¼þº¯Êý×¢²á
function TriggerCondition( id, func, p1, p2, p3, p4 )
	LG( "trigger", "TriggerCondition: id, func, p1, p2, p3, p4 ", id, func, p1, p2, p3, p4 )
	Trigger[id].conditions.count = Trigger[id].conditions.count + 1
	Trigger[id].conditions[Trigger[id].conditions.count] = {}
	Trigger[id].conditions[Trigger[id].conditions.count].func = func
	Trigger[id].conditions[Trigger[id].conditions.count].p1 = p1
	Trigger[id].conditions[Trigger[id].conditions.count].p2 = p2
	Trigger[id].conditions[Trigger[id].conditions.count].p3 = p3
	Trigger[id].conditions[Trigger[id].conditions.count].p4 = p4
end

--Ëæ»úÈÎÎñÐÞ¸ÄÈ«¾Ö´¥·¢Æ÷¶¯×÷º¯Êý²ÎÊýÖµ
function SetTriggerActionValue( id, index, p1, p2, p3, p4 )
	if id == nil or index == nil or TriggerList[id] == nil then
		PRINT( "SetTriggerActionValue:Function parameter error!triggerid = , index =", id, index )
		LG( "randmission_error", "SetTriggerActionValue:functionparameter error , triggerid = , index", id, index )
		return LUA_FALSE
	end
	
	if TriggerList[id].actions == nil or TriggerList[id].actions[index] == nil then
		PRINT( "SetTriggerActionValue: Trigger no action notice error!triggerid = , index = ", id, index )
		LG( "randmission_error", "SetTriggerActionValue: Trigger no action notice error!triggerid = , index = ", id, index )
		return LUA_FALSE
	end
	TriggerList[id].actions[index].p1 = p1
	TriggerList[id].actions[index].p2 = p2
	TriggerList[id].actions[index].p3 = p3
	TriggerList[id].actions[index].p4 = p4
end

--´¥·¢Æ÷¶¯×÷º¯Êý×¢²á
function TriggerAction( id, func, p1, p2, p3, p4, p5, p6, p7, p8 )
	LG( "trigger", "TriggerAction: id, func, p1, p2, p3, p4 ", id, func, p1, p2, p3, p4 )
	Trigger[id].actions.count = Trigger[id].actions.count + 1
	Trigger[id].actions[Trigger[id].actions.count] = {}
	Trigger[id].actions[Trigger[id].actions.count].func = func
	Trigger[id].actions[Trigger[id].actions.count].p1 = p1
	Trigger[id].actions[Trigger[id].actions.count].p2 = p2
	Trigger[id].actions[Trigger[id].actions.count].p3 = p3
	Trigger[id].actions[Trigger[id].actions.count].p4 = p4
	if p5 ~= nil then
		Trigger[id].actions[Trigger[id].actions.count].p5 = p5
	else
		Trigger[id].actions[Trigger[id].actions.count].p5 = 0
	end
	if p6 ~= nil then
		Trigger[id].actions[Trigger[id].actions.count].p6 = p6
	else
		Trigger[id].actions[Trigger[id].actions.count].p6 = 0
	end
	if p7 ~= nil then
		Trigger[id].actions[Trigger[id].actions.count].p7 = p7
	else
		Trigger[id].actions[Trigger[id].actions.count].p7 = 0
	end
	if p8 ~= nil then
		Trigger[id].actions[Trigger[id].actions.count].p8 = p8
	else
		Trigger[id].actions[Trigger[id].actions.count].p8 = 0
	end	
end

function TriggerFailure( id, func, p1, p2, p3, p4, p5, p6, p7, p8 )
	LG( "trigger", "TriggerFailure: id, func, p1, p2, p3, p4 ", id, func, p1, p2, p3, p4 )
	Trigger[id].failures.count = Trigger[id].failures.count + 1
	Trigger[id].failures[Trigger[id].failures.count] = {}
	Trigger[id].failures[Trigger[id].failures.count].func = func
	Trigger[id].failures[Trigger[id].failures.count].p1 = p1
	Trigger[id].failures[Trigger[id].failures.count].p2 = p2
	Trigger[id].failures[Trigger[id].failures.count].p3 = p3
	Trigger[id].failures[Trigger[id].failures.count].p4 = p4
	if p5 ~= nil then
		Trigger[id].failures[Trigger[id].failures.count].p5 = p5
	else
		Trigger[id].failures[Trigger[id].failures.count].p5 = 0
	end
	if p6 ~= nil then	
		Trigger[id].failures[Trigger[id].failures.count].p6 = p6
	else
		Trigger[id].failures[Trigger[id].failures.count].p6 = 0
	end
	if p7 ~= nil then
		Trigger[id].failures[Trigger[id].failures.count].p7 = p7
	else
		Trigger[id].failures[Trigger[id].failures.count].p7 = 0
	end
	if p8 ~= nil then
		Trigger[id].failures[Trigger[id].failures.count].p8 = p8
	else
		Trigger[id].failures[Trigger[id].failures.count].p8 = 0
	end
end

--»ñÈ¡È«¾Ö´¥·¢Æ÷ÐÅÏ¢
function GetTrigger( id )
	return Trigger[id]
end

function GetMultiTrigger()
	return Trigger
end

--×¢²áµ±Ç°´¥·¢Æ÷µ½È«¾Ö´¥·¢Æ÷ÐÅÏ¢ÖÐ
function RegTrigger( id, triggerid )
	if id == nil or triggerid == nil then
		PRINT( "RegTrigger: register triggered cannot be as null!" )
	end
	if Trigger[triggerid] == nil then
		LG( "trigger_error", "RegTrigger: try registrating a null trigger to all classified trigger list,ID = "..triggerid )
		return
	end
	if TriggerList[id] ~= nil then
		LG( "trigger_error", "RegTrigger: register trigger overlayed original trigger notice. ID = "..id )
	end
	TriggerList[id] = Trigger[triggerid]
end

function RegCurTrigger( id )
	RegTrigger( id, 1 )
end

--¶Ô»°¿ªÊ¼´¥·¢Æ÷×¢²á
function Start( trigger, count )
	LG( "trigger", "Start:trigger, count", trigger, count )
	Page.start = MultiTrigger
	Page.p1 = trigger
	Page.p2 = count
end

function Popup( trigger, p2 )
	Page.start = PopupWindow
	Page.p1 = trigger
	Page.p2 = p2
end

--ÊÖ¶¯½«´¥·¢Æ÷Ìí¼Óµ½NPCÉíÉÏ
function SetNpcTrigger( trigger )
	PRINT( "SetNpcTrigger, trigger = , npc = ", trigger, NpcPointer )
	if trigger == nil or trigger.actions == nil then
		LG( "trigger_error", "SetNpcTrigger: trigger = nil or trigger.actions = nil" )
		PRINT( "SetNpcTrigger: trigger = nil or trigger.actions = nil" )
		return
	end
	local ret = ActionsProc( NpcPointer, trigger.actions, NpcPointer, nil, 0, nil )
	if ret ~= LUA_TRUE then
		LG( "trigger_error", "SetNpcTrigger: ActionsProc called error!" )
		PRINT( "SetNpcTrigger: ActionsProc called error!" )
	end
end

--ÉèÖÃµ±Ç°³õÊ¼»¯NPCÎª¼¤»î×´Ì¬
function SetNpcActive()
	PRINT( "SetNpcActive" )
	local ret = SetActive( NpcPointer )
	if ret ~= LUA_TRUE then
		PRINT( "SetNpcActive: Set current NPC activate status failed!NPC = "..GetCharName( NpcPointer ) )
		LG( "npcinit_error", "SetNpcActive: Set current NPC activate status failed!NPC = "..GetCharName( NpcPointer ) )
	end
end

--ÈÎÎñ»ù±¾ÐÅÏ¢×¢²á
function DefineMission( id, name, misid, show, mistp )
	LG( "mission", "ID: "..id, " Name:"..name, " MisID:"..misid )
	--ÉèÖÃÈÎÎñ»ù±¾ÐÅÏ¢
	Mission[id] = {}
	Mission[id].id = misid		--ÈÎÎñÊ¶±ðID
	Mission[id].sid = id 		--½Å±¾ÈÎÎñË÷ÒýID
	Mission[id].name = name
	if mistp == nil then
		Mission[id].tp = NOMAL_MISSION
	else
		Mission[id].tp = mistp
	end
	if show == nil then
		Mission[id].show = ALWAYS_SHOW
	else
		Mission[id].show = show
	end
	--ÉèÖÃµ±Ç°ÈÎÎñ
	Mission.curmission = Mission[id]
	--ÈÎÎñÐèÇóºÍ½±ÀøÐÅÏ¢
	Mission[id].need = {}
	Mission[id].need.count = 0
	Mission[id].prize = {}
	Mission[id].prize.count = 0
	--Ä¬ÈÏÈÎÎñ½±Àø·½Ê½Îª¶àÑ¡Ò»
	Mission[id].prize.seltp = PRIZE_SELONE
	--ÈÎÎñ¿ªÊ¼ÐÅÏ¢
	Mission[id].begin = {}
	Mission[id].begin.talk = ""
	Mission[id].begin.conditions = {}
	Mission[id].begin.conditions.count = 0
	Mission[id].begin.actions = {}
	Mission[id].begin.actions.count = 0
	Mission[id].begin.baggrid = 0
	--ÈÎÎñ½»¸¶ÐÅÏ¢
	Mission[id].result = {}
	Mission[id].result.talk = ""
	Mission[id].result.help = ""
	Mission[id].result.conditions = {}
	Mission[id].result.conditions.count = 0
	Mission[id].result.actions = {}
	Mission[id].result.actions.count = 0
	Mission[id].result.baggrid = 0
	--ÈÎÎñÈ¡ÏûÐÅÏ¢
	Mission[id].cancel = {}
	Mission[id].cancel.conditions = {}
	Mission[id].cancel.conditions.count = 0
	Mission[id].cancel.actions = {}
	Mission[id].cancel.actions.count = 0
end

--¶¨ÒåÒ»¸öÊÀ½çÈÎÎñ
function DefineWorldMission( id, name, misid )
	DefineMission( id, name, misid, nil, WORLD_MISSION )
end

--ÈÎÎñ´¥·¢Æ÷ÐÅÏ¢×¢²áº¯Êý
function MisBeginTalk( str )
	Mission.curmission.begin.talk = str
	LG( "mission", "MisBeginTalk:talk = "..str )
end

--ÈÎÎñÍê³ÉÐèÇóÐÅÏ¢
function MisNeed( needtype, p1, p2, p3, p4 )
	Mission.curmission.need.count = Mission.curmission.need.count + 1
	Mission.curmission.need[Mission.curmission.need.count] = {}
	Mission.curmission.need[Mission.curmission.need.count].tp = needtype
	Mission.curmission.need[Mission.curmission.need.count].p1 = p1
	Mission.curmission.need[Mission.curmission.need.count].p2 = p2
	Mission.curmission.need[Mission.curmission.need.count].p3 = p3
	Mission.curmission.need[Mission.curmission.need.count].p4 = p4
	LG( "mission", "MisNeed:count, type, p1, p2, p3, p4", Mission.curmission.need.count, needtype, p1, p2, p3, p4 )
end

--ÈÎÎñÍê³É½±ÀøÐÅÏ¢
function MisPrize( prizetype, p1, p2, p3, p4 )
	Mission.curmission.prize.count = Mission.curmission.prize.count + 1
	Mission.curmission.prize[Mission.curmission.prize.count] = {}
	Mission.curmission.prize[Mission.curmission.prize.count].tp = prizetype
	Mission.curmission.prize[Mission.curmission.prize.count].p1 = p1
	Mission.curmission.prize[Mission.curmission.prize.count].p2 = p2
	Mission.curmission.prize[Mission.curmission.prize.count].p3 = p3
	Mission.curmission.prize[Mission.curmission.prize.count].p4 = p4
	LG( "mission", "MisPrize:count, type, p1, p2, p3, p4", Mission.curmission.prize.count, prizetype, p1, p2, p3, p4 )
end

--ÈÎÎñÍê³É½±ÀøÀàÐÍ
function MisPrizeType( seltype )
   LG( "mission", "MisPrizeType: prize select type = "..seltype )
   Mission.curmission.prize.seltp = seltype
end

function MisPrizeSelOne()
	MisPrizeType( PRIZE_SELONE )
end

function MisPrizeSelAll()
	MisPrizeType( PRIZE_SELALL )
end

--ÈÎÎñ¿ªÊ¼Ìõ¼þÐÅÏ¢×¢²á
function MisBeginCondition( func, p1, p2, p3, p4 )
	Mission.curmission.begin.conditions.count = Mission.curmission.begin.conditions.count + 1
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count] = {}
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count].func = func
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count].p1 = p1
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count].p2 = p2
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count].p3 = p3	
	Mission.curmission.begin.conditions[Mission.curmission.begin.conditions.count].p4 = p4
	LG( "mission", "MisBeginCondition:count, func, p1, p2, p3, p4", Mission.curmission.begin.conditions.count, func, p1, p2, p3, p4 )
end

--ÈÎÎñ¿ªÊ¼¶¯×÷ÐÅÏ¢×¢²á
function MisBeginAction( func, p1, p2, p3, p4, p5, p6, p7, p8 )
	Mission.curmission.begin.actions.count = Mission.curmission.begin.actions.count + 1
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count] = {}
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].func = func
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p1 = p1
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p2 = p2
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p3 = p3	
	Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p4 = p4	
	if p5 ~= nil then
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p5 = p5
	else
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p5 = 0
	end
	if p6 ~= nil then
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p6 = p6
	else
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p6 = 0
	end
	if p7 ~= nil then
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p7 = p7
	else
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p7 = 0
	end
	if p8 ~= nil then
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p8 = p8
	else
		Mission.curmission.begin.actions[Mission.curmission.begin.actions.count].p8 = 0
	end
	
	LG( "mission", "MisBeginAction:count, func, p1, p2, p3, p4, p5, p6, p7, p8", Mission.curmission.begin.actions.count, func, p1, p2, p3, p4, p5, p6, p7, p8 )
end

--ÈÎÎñ¿ªÊ¼½ÇÉ«±³°üÈÝÁ¿ÐèÇó
function MisBeginBagNeed( num )
	Mission.curmission.begin.baggrid = num
end

--ÈÎÎñ½»¸¶Íê³É¶Ô»°ÐÅÏ¢×¢²á
function MisResultTalk( str )
	Mission.curmission.result.talk = str
	LG( "mission", "MisCompleteTalk:talk = "..str )
end

--ÈÎÎñ½»¸¶°ïÖú¶Ô»°ÐÅÏ¢×¢²á
function MisHelpTalk( str )
	Mission.curmission.result.help = str
	LG( "mission", "MisHelpTalk:help = "..str )
end

--ÈÎÎñÍê³ÉÌõ¼þÐÅÏ¢×¢²á
function MisResultCondition( func, p1, p2, p3, p4 )
	Mission.curmission.result.conditions.count = Mission.curmission.result.conditions.count + 1
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count] = {}
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count].func = func
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count].p1 = p1
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count].p2 = p2
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count].p3 = p3
	Mission.curmission.result.conditions[Mission.curmission.result.conditions.count].p4 = p4
	LG( "mission", "MisResultCondition:count, func, p1, p2, p3, p4", Mission.curmission.result.conditions.count, func, p1, p2, p3, p4 )
end

--ÈÎÎñÍê³É¶¯×÷ÐÅÏ¢×¢²á
function MisResultAction( func, p1, p2, p3, p4, p5, p6, p7, p8 )
	Mission.curmission.result.actions.count = Mission.curmission.result.actions.count + 1
	Mission.curmission.result.actions[Mission.curmission.result.actions.count] = {}
	Mission.curmission.result.actions[Mission.curmission.result.actions.count].func = func
	Mission.curmission.result.actions[Mission.curmission.result.actions.count].p1 = p1
	Mission.curmission.result.actions[Mission.curmission.result.actions.count].p2 = p2
	Mission.curmission.result.actions[Mission.curmission.result.actions.count].p3 = p3
	Mission.curmission.result.actions[Mission.curmission.result.actions.count].p4 = p4
	if p5 ~= nil then
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p5 = p5
	else
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p5 = 0
	end
	if p6 ~= nil then
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p6 = p6
	else
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p6 = 0
	end
	if p7 ~= nil then
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p7 = p7
	else
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p7 = 0
	end
	if p8 ~= nil then
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p8 = p8
	else
		Mission.curmission.result.actions[Mission.curmission.result.actions.count].p8 = 0
	end	
	LG( "mission", "MisResultAction:count, func, p1, p2, p3, p4, p5, p6, p7, p8", Mission.curmission.result.actions.count, func, p1, p2, p3, p4, p5, p6, p7, p8 )
end

--ÈÎÎñÍê³ÉÊ±±³°üÈÝÁ¿ÐèÇó
function MisResultBagNeed( num )
	Mission.curmission.result.baggrid = num
end

--ÈÎÎñÈ¡ÏûÌõ¼þÐÅÏ¢×¢²á
function MisCancelCondition( func, p1, p2, p3, p4 )
	Mission.curmission.cancel.conditions.count = Mission.curmission.cancel.conditions.count + 1
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count] = {}
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count].func = func
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count].p1 = p1
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count].p2 = p2
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count].p3 = p3
	Mission.curmission.cancel.conditions[Mission.curmission.cancel.conditions.count].p4 = p4
	LG( "mission", "MisCancelCondition:count, func, p1, p2, p3, p4", Mission.curmission.cancel.conditions.count, func, p1, p2, p3, p4 )
end

--ÈÎÎñÈ¡Ïû¶¯×÷ÐÅÏ¢×¢²á
function MisCancelAction( func, p1, p2, p3, p4, p5, p6, p7, p8 )
	Mission.curmission.cancel.actions.count = Mission.curmission.cancel.actions.count + 1
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count] = {}
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].func = func
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p1 = p1
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p2 = p2
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p3 = p3
	Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p4 = p4
	if p5 ~= nil then
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p5 = p5
	else
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p5 = 0
	end
	if p6 ~= nil then
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p6 = p6
	else
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p6 = 0
	end
	if p7 ~= nil then
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p7 = p7
	else
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p7 = 0
	end
	if p8 ~= nil then
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p8 = p8
	else
		Mission.curmission.cancel.actions[Mission.curmission.cancel.actions.count].p8 = 0
	end	
	LG( "mission", "MisCancelAction:count, func, p1, p2, p3, p4, p5, p6, p7, p8", Mission.curmission.cancel.actions.count, func, p1, p2, p3, p4, p5, p6, p7, p8 )
end

--½«ÈÎÎñ×¢²áµ½npcÉíÉÏ
function AddNpcMission( id )
	NpcMissionList.count = NpcMissionList.count + 1
	NpcMissionList[NpcMissionList.count ] = {}
	NpcMissionList[NpcMissionList.count ] = Mission[id]
--	PRINT( "Set quest ["..NpcMissionList.count.."]: ["..id.."]: ["..Mission[id].name.."]" )
	--LG( "missioninit", "Set quest ["..NpcMissionList.count.."]: ["..id.."]: ["..Mission[id].name.."]" )
end

--³õÊ¼»¯Ëæ»úÈÎÎñ²ÎÊý±í½á¹¹
function InitRandParam()
	RandParam = {}
	RandParam.id = 0
	RandParam.sid = 0
	RandParam.tp = 0
	RandParam.bounty = 0
	RandParam.exptp = MIS_EXP_NOMAL
	RandParam.level = 0
	RandParam.numdata = 0
	RandParam.money = 0
	RandParam.exp = 0
	RandParam.prizetp = 0
	RandParam.prizedata = 0
	RandParam.p1 = 0
	RandParam.p2 = 0
	RandParam.npcname = ""
	RandParam.npcarea = ""
	RandParam.data = {}
	for n = 1, 4, 1 do
		RandParam.data[n] = {}
		RandParam.data[n].p1 = 0
		RandParam.data[n].p2 = 0
		RandParam.data[n].p3 = 0
		RandParam.data[n].p4 = 0
	end
end

--Ëæ»úÈÎÎñÐÅÏ¢½Å±¾Éú³Éº¯Êý½Ó¿Ú
function DefineRandMission( id, name, misid, bounty, npcname, npcarea, leveltp )
	LG( "randmission_init", "ID: "..id, " Name:"..name, " MisID:"..misid, "Bounty:"..bounty )
	--ÉèÖÃÈÎÎñ»ù±¾ÐÅÏ¢
	Mission[id] = {}
	Mission[id].id = misid		--ÈÎÎñÊ¶±ðID
	Mission[id].sid = id 		--½Å±¾ÈÎÎñË÷ÒýID
	Mission[id].name = name
	Mission[id].tp = RAND_MISSION
	Mission[id].bounty = bounty --ÈÎÎñ¸øÓèÎïÆ·½±Àø¶È
	if leveltp == nil then
		Mission[id].leveltp = MIS_LEVEL_CHAR
	else
		Mission[id].leveltp = leveltp
	end
	Mission[id].show = ALWAYS_SHOW
	Mission[id].missionlist = {}
	Mission[id].missionlist.count = 0
	Mission[id].loopinfo = {}
	Mission[id].loopinfo.count = 0
	
	if npcname ~= nil and npcarea ~= nil then
		Mission[id].npcname = npcname
		Mission[id].npcarea  = npcarea
	else
		Mission[id].npcname = "Unknown NPC"
		Mission[id].npcarea  = "Unknown map region"
	end	
	
	--ÉèÖÃµ±Ç°ÈÎÎñ
	Mission.curmission = Mission[id]
	--ÈÎÎñ¿ªÊ¼ÐÅÏ¢
	Mission[id].begin = {}
	Mission[id].begin.talk = ""
	Mission[id].begin.conditions = {}
	Mission[id].begin.conditions.count = 0
	Mission[id].begin.actions = {}
	Mission[id].begin.actions.count = 0
	Mission[id].begin.baggrid = 0
	--ÈÎÎñ½»¸¶ÐÅÏ¢
	Mission[id].result = {}
	Mission[id].result.talk = ""
	Mission[id].result.help = ""
	Mission[id].result.conditions = {}
	Mission[id].result.conditions.count = 0
	Mission[id].result.actions = {}
	Mission[id].result.actions.count = 0
	Mission[id].result.baggrid = 0
	--ÈÎÎñÈ¡ÏûÐÅÏ¢
	Mission[id].cancel = {}
	Mission[id].cancel.conditions = {}
	Mission[id].cancel.conditions.count = 0
	Mission[id].cancel.actions = {}
	Mission[id].cancel.actions.count = 0
end

--³õÊ¼»¯Ëæ»úÈÎÎñÇ°ºó×ºÐÅÏ¢ÁÐ±í
function InitTalkList()
	talklist.btalkstart = "Accept quest desription started"
	talklist.btalkend = "Accept quest ends description"
	talklist.rtalkstart = "cycle quest description started"
	talklist.rtalkend = "cycle quest description ended"
	talklist.helpstart = "Quest help description started"
	talklist.helpend = "Quest help description ended"
end

--Ìí¼ÓËæ»úÈÎÎñÃèÊöÐÅÏ¢Ç°×ººó×º
function AddRandMissionBeginTalk( talkstart, talkend )
	if talkstart == nil or talkend  == nil then
		LG( "randmission_inittalk_error", "AddRandMissionBeginTalk: misid = , ", Mission.curmission.sid )
		return
	end
	
	LG( "randmission_init", "AddRandMissionBeginTalk: talkstart = ", talkstart )
	LG( "randmission_init", "AddRandMissionBeginTalk: talkend = ", talkend )
	talklist.btalkstart = talkstart
	talklist.btalkend = talkend
end

function AddRandMissionResultTalk( talkstart, talkend )
	if talkstart == nil or talkend  == nil then
		LG( "randmission_inittalk_error", "AddRandMissionBeginTalk: misid = , ", Mission.curmission.sid )
		return
	end

	LG( "randmission_init", "AddRandMissionResultTalk: talkstart = ", talkstart )
	LG( "randmission_init", "AddRandMissionResultTalk: talkend = ", talkend )	
	talklist.rtalkstart = talkstart
	talklist.rtalkend = talkend
end

function AddRandMissionHelpTalk( talkstart, talkend )
	if talkstart == nil or talkend  == nil then
		LG( "randmission_inittalk_error", "AddRandMissionBeginTalk: misid = , ", Mission.curmission.sid )
		return
	end
	
	LG( "randmission_init", "AddRandMissionHelpTalk: talkstart = ", talkstart )
	LG( "randmission_init", "AddRandMissionHelpTalk: talkend = ", talkend )	
	talklist.helpstart = talkstart
	talklist.helpend = talkend
end

--»ñÈ¡Ëæ»úÈÎÎñÃèÊöÇ°ºó×ºÐÅÏ¢ÁÐ±í
function GetRandMissionTalk()
	return talklist
end

--Ìí¼Óµ±Ç°Ëæ»úÈÎÎñµÄÀàÐÍÐÅÏ¢
function AddRandMissionType( tp, tprand, talklist, exptp, randnum, p1, p2, p3, p4, p5, p6 )
	if Mission.curmission == nil or tp == nil or tprand == nil or exptp == nil or randnum == nil then
		PRINT( "AddRandMissionType:Mission[id] = nil or tp = nil, exptp = nil or id = "..Mission.curmission.sid..",tp = "..tp )
		return
	end
   
	LG( "randmission_init", "AddRandMissionType:Add rand mission id["..Mission.curmission.sid.."], tp = "..tp )
	
	--¼ì²âÀàÐÍÐÅÏ¢
	for n = 1, Mission.curmission.missionlist.count, 1 do
		if Mission.curmission.missionlist[n].tp == tp then
			PRINT( "AddRandMissionType: adding of random quest type duplicate, tp = "..tp )
			return
		end
	end
	
	--ÐÂÔöÀàÐÍÐÅÏ¢
	Mission.curmission.missionlist.count = Mission.curmission.missionlist.count + 1
	Mission.curmission.missionlist[Mission.curmission.missionlist.count] = {}
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].tp = tp
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].exptp = exptp
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].randnum = randnum

	--ÈÎÎñÊý¾Ý³õÊ¼»¯
	local begin = {}
	local result = {}
	local cancel = {}
	local need = {}
	local prize = {}

	begin.conditions = {}
	begin.conditions.count = 0
	begin.actions = {}
	begin.actions.count = 0
	begin.baggrid = 0
	result.conditions = {}
	result.conditions.count = 0
	result.actions = {}
	result.actions.count = 0
	result.baggrid = 0
	cancel.conditions = {}
	cancel.conditions.count = 0
	cancel.actions = {}
	cancel.actions.count = 0
	need.count = 0
	prize.count = 0
	--Ä¬ÈÏÈÎÎñ½±Àø·½Ê½ÎªÈ«Ñ¡	
	prize.seltp = PRIZE_SELALL
	--Ä¬ÈÏÈÎÎñÃèÊöÐÅÏ¢Îª¿Õ
	begin.talk = ""
	begin.talkstart = talklist.btalkstart
	begin.talkend = talklist.btalkend
	result.talk = ""
	result.talkstart = talklist.rtalkstart
	result.talkend = talklist.rtalkend
	result.help = ""
	result.helpstart = talklist.helpstart
	result.helpend = talklist.helpend
	
	if tp == MIS_RAND_KILL then
		--Ëæ»úÈÎÎñ½±ÀøºÍÐèÇó
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = ""
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_KILL
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_KILL
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_KILL
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_KILL
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		prize.count = prize.count + 1
		prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_MONEY
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		prize.count = prize.count + 1
        prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_ITEM
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		--ÈÎÎñ¿ªÊ¼
		--begin.conditions.count = begin.conditions.count + 1
		--begin.conditions[begin.conditions.count] = {}
		--begin.conditions[begin.conditions.count].func = NoRandMission
		--begin.conditions[begin.conditions.count].p1 = Mission.curmission.id
		
		--begin.actions.count = begin.actions.count + 1
		--begin.actions[begin.actions.count] = {}
		--begin.actions[begin.actions.count].func = AddRandMission
		--begin.actions[begin.actions.count].p1 = Mission.curmission.id
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p1
		begin.actions[begin.actions.count].p2 = TE_KILL
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p2
		begin.actions[begin.actions.count].p2 = TE_KILL
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
        begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p3
		begin.actions[begin.actions.count].p2 = TE_KILL
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p4
		begin.actions[begin.actions.count].p2 = TE_KILL
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		--ÈÎÎñ½áÊøÌõ¼þ
		--result.conditions.count = result.conditions.count + 1
		--result.conditions[result.conditions.count] = {}
		--result.conditions[result.conditions.count].func = HasRandMission
		--result.conditions[result.conditions.count].p1 = Mission.curmission.id
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		--ÈÎÎñ½áÊø¶¯×÷
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = ClearMission
		result.actions[result.actions.count].p1 = Mission.curmission.id
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = AddExpAndType	--AddExp
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		result.actions[result.actions.count].p3 = 0
		
		--ÈÎÎñÈ¡Ïû¶¯×÷
		InitTrigger()
		TriggerCondition( 1, HasCancelMissionMoney )
		TriggerAction( 1, TakeCancelMissionMoney )
		TriggerAction( 1, ClearMission, Mission.curmission.id )
		TriggerAction( 1, FailureRandMissionCount, Mission.curmission.id )
		
		TriggerAction( 2, SystemNotice, "Insufficient gold. Unable to abandon quest!" )

		cancel.actions.count = cancel.actions.count + 1
		cancel.actions[cancel.actions.count] = {}
		cancel.actions[cancel.actions.count].func = MultiTrigger
		cancel.actions[cancel.actions.count].p1 = GetMultiTrigger()
		cancel.actions[cancel.actions.count].p2 = 2
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = ClearMission
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = FailureRandMissionCount
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
				
		--½¨Á¢×î´ó4¸öÈ«¾Ö´¥·¢Æ÷ÓÃÓÚËæ»úÈÎÎñ
		InitTrigger()
		SetTriggerType( 1, MIS_TRIGGER_RAND )
		--TriggerCondition( 1, IsMonster, 0 )
		TriggerAction( 1, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p1, 1 )
		
		SetTriggerType( 2, MIS_TRIGGER_RAND )
		--TriggerCondition( 2, IsMonster, 0 )
		TriggerAction( 2, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 2, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p2, 2 )
		
		SetTriggerType( 3, MIS_TRIGGER_RAND )
		--TriggerCondition( 3, IsMonster, 0 )
		TriggerAction( 3, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 3, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p3, 3 )
		
		SetTriggerType( 4, MIS_TRIGGER_RAND )
		--TriggerCondition( 4, IsMonster, 0 )
		TriggerAction( 4, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 4, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p4, 4 )
		
	elseif tp == MIS_RAND_GET then
		--Ëæ»úÈÎÎñ½±ÀøºÍÐèÇó
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = ""
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_ITEM
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
        need[need.count].tp = MIS_NEED_ITEM
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_ITEM
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_ITEM
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		prize.count = prize.count + 1
		prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_MONEY
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		prize.count = prize.count + 1
        prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_ITEM
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		--ÈÎÎñ¿ªÊ¼
		--begin.conditions.count = begin.conditions.count + 1
		--begin.conditions[begin.conditions.count] = {}
		--begin.conditions[begin.conditions.count].func = NoRandMission
		--begin.conditions[begin.conditions.count].p1 = Mission.curmission.id
		
		--begin.actions.count = begin.actions.count + 1
		--begin.actions[begin.actions.count] = {}
		--begin.actions[begin.actions.count].func = AddRandMission
		--begin.actions[begin.actions.count].p1 = Mission.curmission.id
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p1
		begin.actions[begin.actions.count].p2 = TE_GETITEM
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p2
		begin.actions[begin.actions.count].p2 = TE_GETITEM
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p3
		begin.actions[begin.actions.count].p2 = TE_GETITEM
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p4
		begin.actions[begin.actions.count].p2 = TE_GETITEM
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		--ÈÎÎñ½áÊøÌõ¼þ
		--result.conditions.count = result.conditions.count + 1
		--result.conditions[result.conditions.count] = {}
		--result.conditions[result.conditions.count].func = HasRandMission
		--result.conditions[result.conditions.count].p1 = Mission.curmission.id
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = AlwaysTrue--HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasItem
		result.conditions[result.conditions.count].p1 = 0
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = AlwaysTrue--HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0

		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasItem
		result.conditions[result.conditions.count].p1 = 0
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = AlwaysTrue--HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0

		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasItem
		result.conditions[result.conditions.count].p1 = 0
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = AlwaysTrue--HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0

		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasItem
		result.conditions[result.conditions.count].p1 = 0
		result.conditions[result.conditions.count].p2 = 0
		
		--ÈÎÎñ½áÊø¶¯×÷
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = ClearMission
		result.actions[result.actions.count].p1 = Mission.curmission.id
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = AddExpAndType	--AddExp
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		result.actions[result.actions.count].p3 = 0
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = TakeItem
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = TakeItem
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = TakeItem
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = TakeItem
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		
		--ÈÎÎñÈ¡Ïû¶¯×÷
		InitTrigger()
		TriggerCondition( 1, HasCancelMissionMoney )
		TriggerAction( 1, TakeCancelMissionMoney )
		TriggerAction( 1, ClearMission, Mission.curmission.id )
		TriggerAction( 1, FailureRandMissionCount, Mission.curmission.id )
		
		TriggerAction( 2, SystemNotice, "Insufficient gold. Unable to abandon quest!" )

		cancel.actions.count = cancel.actions.count + 1
		cancel.actions[cancel.actions.count] = {}
		cancel.actions[cancel.actions.count].func = MultiTrigger
		cancel.actions[cancel.actions.count].p1 = GetMultiTrigger()
		cancel.actions[cancel.actions.count].p2 = 2
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = ClearMission
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id

		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = FailureRandMissionCount
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--½¨Á¢×î´ó4¸öÈ«¾Ö´¥·¢Æ÷ÓÃÓÚËæ»úÈÎÎñ
		InitTrigger()
		SetTriggerType( 1, MIS_TRIGGER_RAND )
		--TriggerCondition( 1, IsItem, 0 )
		TriggerAction( 1, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p1, 1 )
		
		SetTriggerType( 2, MIS_TRIGGER_RAND )
		--TriggerCondition( 2, IsItem, 0 )
		TriggerAction( 2, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 2, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p2, 2 )
		
		SetTriggerType( 3, MIS_TRIGGER_RAND )
		--TriggerCondition( 3, IsItem, 0 )
		TriggerAction( 3, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 3, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p3, 3 )
		
		SetTriggerType( 4, MIS_TRIGGER_RAND )
		--TriggerCondition( 4, IsItem, 0 )
		TriggerAction( 4, AddRMNextFlag, Mission.curmission.id, 0, 0 )
		TriggerAction( 4, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p4, 4 )
		
	elseif tp == MIS_RAND_SEND then
		--Ëæ»úÈÎÎñ½±ÀøºÍÐèÇó
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = ""
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		prize.count = prize.count + 1
		prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_MONEY
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		prize.count = prize.count + 1
		prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_ITEM
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		--ÈÎÎñ¿ªÊ¼
		--begin.conditions.count = begin.conditions.count + 1
		--begin.conditions[begin.conditions.count] = {}
		--begin.conditions[begin.conditions.count].func = NoMission
		--begin.conditions[begin.conditions.count].p1 = Mission.curmission.id
		
		--begin.actions.count = begin.actions.count + 1
		--begin.actions[begin.actions.count] = {}
		--begin.actions[begin.actions.count].func = AddMission
		--begin.actions[begin.actions.count].p1 = Mission.curmission.id
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = GiveItem
		begin.actions[begin.actions.count].p1 = 0
		begin.actions[begin.actions.count].p2 = 0
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = GiveItem
		begin.actions[begin.actions.count].p1 = 0
		begin.actions[begin.actions.count].p2 = 0
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = GiveItem
		begin.actions[begin.actions.count].p1 = 0
		begin.actions[begin.actions.count].p2 = 0
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = GiveItem
		begin.actions[begin.actions.count].p1 = 0
		begin.actions[begin.actions.count].p2 = 0
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		--ÈÎÎñ½áÊøÌõ¼þ
		--result.conditions.count = result.conditions.count + 1
		--result.conditions[result.conditions.count] = {}
		--result.conditions[result.conditions.count].func = HasMission
		--result.conditions[result.conditions.count].p1 = Mission.curmission.id
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasRandNpcItemFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasRandNpcItemFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasRandNpcItemFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasRandNpcItemFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		--ÈÎÎñ½áÊø¶¯×÷
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = ClearMission
		result.actions[result.actions.count].p1 = Mission.curmission.id
		
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = AddExpAndType	--AddExp
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		result.actions[result.actions.count].p3 = 0

		--ÈÎÎñÈ¡Ïû¶¯×÷
		InitTrigger()
		TriggerCondition( 1, HasCancelMissionMoney )
		TriggerAction( 1, TakeCancelMissionMoney )
		TriggerAction( 1, TakeAllRandItem, Mission.curmission.id )
		TriggerAction( 1, ClearMission, Mission.curmission.id )
		TriggerAction( 1, FailureRandMissionCount, Mission.curmission.id )
		
		TriggerAction( 2, SystemNotice, "Insufficient gold. Unable to abandon quest!" )

		cancel.actions.count = cancel.actions.count + 1
		cancel.actions[cancel.actions.count] = {}
		cancel.actions[cancel.actions.count].func = MultiTrigger
		cancel.actions[cancel.actions.count].p1 = GetMultiTrigger()
		cancel.actions[cancel.actions.count].p2 = 2
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = TakeAllRandItem
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = ClearMission
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = FailureRandMissionCount
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
	elseif tp == MIS_RAND_CONVOY then
		--Ëæ»úÈÎÎñ½±ÀøºÍÐèÇó
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = ""
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
		need[need.count] = {}
        need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		need.count = need.count + 1
        need[need.count] = {}
		need[need.count].tp = MIS_NEED_DESP
		need[need.count].p1 = 0
		need[need.count].p2 = 0
		need[need.count].p3 = 0
		need[need.count].p4 = 0
		
		prize.count = prize.count + 1
		prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_MONEY
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		prize.count = prize.count + 1
        prize[prize.count] = {}
		prize[prize.count].tp = MIS_PRIZE_ITEM
		prize[prize.count].p1 = 0
		prize[prize.count].p2 = 0
		prize[prize.count].p3 = 0
		prize[prize.count].p4 = 0
		
		--ÈÎÎñ¿ªÊ¼
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p1
		begin.actions[begin.actions.count].p2 = TE_GAMETIME
		begin.actions[begin.actions.count].p3 = TT_MULTITIME
		begin.actions[begin.actions.count].p4 = 1
		begin.actions[begin.actions.count].p5 = 1
		begin.actions[begin.actions.count].p6 = 1
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p2
		begin.actions[begin.actions.count].p2 = TE_GOTO_MAP
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 1
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = ConvoyNpc
		begin.actions[begin.actions.count].p1 = Mission.curmission.id
		begin.actions[begin.actions.count].p2 = 0
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 8
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p3
		begin.actions[begin.actions.count].p2 = TE_GOTO_MAP
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 1
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = ConvoyNpc
		begin.actions[begin.actions.count].p1 = Mission.curmission.id
		begin.actions[begin.actions.count].p2 = 1
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 8
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p4
		begin.actions[begin.actions.count].p2 = TE_GOTO_MAP
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 1
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = ConvoyNpc
		begin.actions[begin.actions.count].p1 = Mission.curmission.id
		begin.actions[begin.actions.count].p2 = 2
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 8
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
        begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = AddTrigger
		begin.actions[begin.actions.count].p1 = p5
		begin.actions[begin.actions.count].p2 = TE_GOTO_MAP
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 0
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0
		begin.actions[begin.actions.count].p7 = 1
		begin.actions[begin.actions.count].p8 = 0
		
		begin.actions.count = begin.actions.count + 1
		begin.actions[begin.actions.count] = {}
		begin.actions[begin.actions.count].func = ConvoyNpc
		begin.actions[begin.actions.count].p1 = Mission.curmission.id
		begin.actions[begin.actions.count].p2 = 3
		begin.actions[begin.actions.count].p3 = 0
		begin.actions[begin.actions.count].p4 = 8
		begin.actions[begin.actions.count].p5 = 0
		begin.actions[begin.actions.count].p6 = 0		
		begin.actions[begin.actions.count].p7 = 0
		begin.actions[begin.actions.count].p8 = 0
		
		--ÈÎÎñ½áÊøÌõ¼þ		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 0
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 1
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 2
		
		result.conditions.count = result.conditions.count + 1
		result.conditions[result.conditions.count] = {}
		result.conditions[result.conditions.count].func = HasFlag
		result.conditions[result.conditions.count].p1 = Mission.curmission.id
		result.conditions[result.conditions.count].p2 = 3
		
		--ÈÎÎñ½áÊø¶¯×÷
		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = ClearMission
		result.actions[result.actions.count].p1 = Mission.curmission.id

		result.actions.count = result.actions.count + 1
		result.actions[result.actions.count] = {}
		result.actions[result.actions.count].func = AddExpAndType	--AddExp
		result.actions[result.actions.count].p1 = 0
		result.actions[result.actions.count].p2 = 0
		result.actions[result.actions.count].p3 = 0

		--ÈÎÎñÈ¡Ïû¶¯×÷
		InitTrigger()
		TriggerCondition( 1, HasCancelMissionMoney )
		TriggerAction( 1, TakeCancelMissionMoney )
		TriggerAction( 1, ClearAllConvoyNpc, Mission.curmission.id )
		TriggerAction( 1, ClearMission, Mission.curmission.id )
		TriggerAction( 1, FailureRandMissionCount, Mission.curmission.id )
		
		TriggerAction( 2, SystemNotice, "Insufficient gold. Unable to abandon quest!" )

		cancel.actions.count = cancel.actions.count + 1
		cancel.actions[cancel.actions.count] = {}
		cancel.actions[cancel.actions.count].func = MultiTrigger
		cancel.actions[cancel.actions.count].p1 = GetMultiTrigger()
		cancel.actions[cancel.actions.count].p2 = 2
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = ClearAllConvoyNpc
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = ClearMission
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--cancel.actions.count = cancel.actions.count + 1
		--cancel.actions[cancel.actions.count] = {}
		--cancel.actions[cancel.actions.count].func = FailureRandMissionCount
		--cancel.actions[cancel.actions.count].p1 = Mission.curmission.id
		
		--½¨Á¢×î´ó4¸öÈ«¾Ö´¥·¢Æ÷ÓÃÓÚËæ»úÈÎÎñ
		InitTrigger()
		--SetTriggerType( 1, MIS_TRIGGER_RAND )
		TriggerAction( 1, ClearConvoyNpc, Mission.curmission.id, 0 )
		TriggerAction( 1, SetFlag, Mission.curmission.id, 0 )
		TriggerAction( 1, HelpInfo, MIS_HELP_DESP, "Thank you for sending me here! Good bye!" )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p2, 1 )
		
		--SetTriggerType( 2, MIS_TRIGGER_RAND )
		TriggerAction( 2, ClearConvoyNpc, Mission.curmission.id, 1 )
		TriggerAction( 2, SetFlag, Mission.curmission.id, 1 )
		TriggerAction( 2, HelpInfo, MIS_HELP_DESP, "Thank you for sending me here! Good bye!" )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p3, 2 )
		
		--SetTriggerType( 3, MIS_TRIGGER_RAND )
		TriggerAction( 3, ClearConvoyNpc, Mission.curmission.id, 2 )
		TriggerAction( 3, SetFlag, Mission.curmission.id, 2 )
		TriggerAction( 3, HelpInfo, MIS_HELP_DESP, "Thank you for sending me here! Good bye!" )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p4, 3 )
		
		--SetTriggerType( 4, MIS_TRIGGER_RAND )
		TriggerAction( 4, ClearConvoyNpc, Mission.curmission.id, 3 )
		TriggerAction( 4, SetFlag, Mission.curmission.id, 3 )
		TriggerAction( 4, HelpInfo, MIS_HELP_DESP, "Thank you for sending me here! Good bye!" )
		TriggerAction( 1, RefreshCompleteFlag, Mission.curmission.sid )
		RegTrigger( p5, 4 )

		--SetTriggerType( 1, MIS_TRIGGER_RAND )
		local help = "accepted quest ["
		help = help..Mission.curmission.name.."] has exceeded time allocated, quest failed! Please delete quest from quest log."
		TriggerAction( 5, ClearAllConvoyNpc, Mission.curmission.id )
		TriggerAction( 5, HelpInfo, MIS_HELP_DESP, help )
		TriggerAction( 5, FailureRandMissionCount, Mission.curmission.id )
		TriggerAction( 5, SetMissionFailure, Mission.curmission.id )
		RegTrigger( p1, 5 )
		
	elseif tp == MIS_RAND_EXPLORE then
	
	end
	
	--Ô¤Éú³ÉËæ»úÈÎÎñÊý¾Ý¸ñÊ½£¬¼ÓËÙ³ÌÐò
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].begin = begin
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].result = result
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].cancel = cancel
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].need  = need
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].prize  = prize
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].name = Mission.curmission.name
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].t1 = p1
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].t2 = p2
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].t3 = p3
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].t4 = p4
	Mission.curmission.missionlist[Mission.curmission.missionlist.count].tprand = tprand
end

--Ìí¼ÓËæ»úÈÎÎñÉú³ÉÐÅÏ¢
function AddRandMissionInfo( id, level, tp, p1, p2, p3, p4, p5, p6, p7, p8 )	
	if Mission[id] == nil then
		LG( "randmission_init", "AddRandMissionInfo:Mission[id] = nil, id = "..id )
		PRINT( "AddRandMissionInfo:Mission[id] = nil, id = "..id )
		return LUA_FALSE
	end

	if Mission[id].RandInfo == nil then
		Mission[id].RandInfo = {}
	end
	
	--ÅÐ¶Ï¸ÃÀàÐÍÊÇ·ñÒÑ´ò¿ª
	local flag = 0
	for n = 1, Mission.curmission.missionlist.count, 1 do
		if Mission.curmission.missionlist[n].tp == tp then
			flag = 1
		end
	end
	if flag == 0 then
		PRINT( "AddRandMissionInfo: Add data fail due to target data type switch is not opened. id, level, tp, p1, p2, p3, p4, p5, p6", id, level, tp, p1, p2, p3, p4, p5, p6 )
		LG( "randmission_error", "AddRandMissionInfo: add data failed die to data type switch not opened.", tp )
	end
	
	if Mission[id].RandInfo[level] == nil then
		Mission[id].RandInfo[level] = {}
		Mission[id].RandInfo[level].KillInfo = {}
		Mission[id].RandInfo[level].KillInfo.count = 0
		Mission[id].RandInfo[level].GetInfo = {}
		Mission[id].RandInfo[level].GetInfo.count = 0
		Mission[id].RandInfo[level].SendInfo = {}
		Mission[id].RandInfo[level].SendInfo.count = 0
		Mission[id].RandInfo[level].SendItem = {}
		Mission[id].RandInfo[level].SendItem.count = 0
		Mission[id].RandInfo[level].ConvoyInfo = {}
		Mission[id].RandInfo[level].ConvoyInfo.count = 0
		Mission[id].RandInfo[level].ExploreInfo = {}
		Mission[id].RandInfo[level].ExploreInfo.count = 0
		Mission[id].RandInfo[level].LoopData = {}
		Mission[id].RandInfo[level].LoopData.count = 0
		
		Mission[id].RandInfo[level].PrizeItem = {}
		Mission[id].RandInfo[level].PrizeItem.count = 0
		Mission[id].RandInfo[level].PrizeItem.odds = 0
		Mission[id].RandInfo[level].PrizeItem.num = 0
		--Ëæ»úÈÎÎñ²úÉú¿ì½ÝÐÅÏ¢
		Mission[id].RandInfo[level].tpinfo = {}
		Mission[id].RandInfo[level].tpinfo.count = 0
	end

	LG( "randmission_init", "mission = , mission.RandInfo = , mission.RandInfo[level] = ", Mission[id], Mission[id].RandInfo, Mission[id].RandInfo[level] )
	
	if tp == MIS_RAND_KILL then					--ÁÔÉ±¹ÖÎï
		Mission[id].RandInfo[level].KillInfo.count = Mission[id].RandInfo[level].KillInfo.count + 1
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count] = {}
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p1 = p1
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p2 = p2
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p3 = p3
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p4 = p4
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p5 = p5
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p6 = p6
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p7 = p7
		Mission[id].RandInfo[level].KillInfo[Mission[id].RandInfo[level].KillInfo.count].p8 = p8
	elseif tp == MIS_RAND_GET then			--»ñÈ¡ÎïÆ·
		Mission[id].RandInfo[level].GetInfo.count = Mission[id].RandInfo[level].GetInfo.count + 1
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count] = {}
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p1 = p1
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p2 = p2
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p3 = p3
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p4 = p4
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p5 = p5
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p6 = p6
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p7 = p7
		Mission[id].RandInfo[level].GetInfo[Mission[id].RandInfo[level].GetInfo.count].p8 = p8
	elseif tp == MIS_RAND_SEND then			--ËÍ¸øÎïÆ·
		Mission[id].RandInfo[level].SendInfo.count = Mission[id].RandInfo[level].SendInfo.count + 1
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count] = {}
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p1 = p1
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p2 = p2
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p3 = p3
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p4 = p4
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p5 = p5
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p6 = p6
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p7 = p7
		Mission[id].RandInfo[level].SendInfo[Mission[id].RandInfo[level].SendInfo.count].p8 = p8
	elseif tp == MIS_RAND_CONVOY then		--»¤ËÍNPC
		Mission[id].RandInfo[level].ConvoyInfo.count = Mission[id].RandInfo[level].ConvoyInfo.count + 1
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count] = {}
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p1 = p1
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p2 = p2
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p3 = p3
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p4 = p4
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p5 = p5
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p6 = p6
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p7 = p7
		Mission[id].RandInfo[level].ConvoyInfo[Mission[id].RandInfo[level].ConvoyInfo.count].p8 = p8
	elseif tp == MIS_RAND_EXPLORE then	--Ì½Ë÷µØÍ¼
		Mission[id].RandInfo[level].ExploreInfo.count = Mission[id].RandInfo[level].ExploreInfo.count + 1
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count] = {}
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p1 = p1
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p2 = p2
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p3 = p3
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p4 = p4
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p5 = p5
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p6 = p6
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p7 = p7
		Mission[id].RandInfo[level].ExploreInfo[Mission[id].RandInfo[level].ExploreInfo.count].p8 = p8
	else
		PRINT( "AddRandMissionInfo: adds data type error, tp = "..tp )
		LG( "randmission_init",  "AddRandMissionInfo: adds data type error, tp = "..tp )
		return LUA_FALSE
	end

	--ÅÐ¶Ï¸ÃÀàÐÍÊý¾ÝÐÅÏ¢Ë÷ÒýÊÇ·ñÒÑ¼ÓÈë
	local count = 0
	for n = 1, Mission[id].RandInfo[level].tpinfo.count, 1 do
		if Mission[id].RandInfo[level].tpinfo[n].tp == tp then
			count = 1
			break
		end
	end
	if count == 0 then
		local tprand = 1
		for n = 1, Mission.curmission.missionlist.count, 1 do
			if Mission.curmission.missionlist[n].tp == tp and Mission.curmission.missionlist[n].tprand ~= nil then
				tprand = Mission.curmission.missionlist[n].tprand
				break
			end
		end
		Mission[id].RandInfo[level].tpinfo.count = Mission[id].RandInfo[level].tpinfo.count + 1
		Mission[id].RandInfo[level].tpinfo[Mission[id].RandInfo[level].tpinfo.count] = {}
		Mission[id].RandInfo[level].tpinfo[Mission[id].RandInfo[level].tpinfo.count].tp = tp
		Mission[id].RandInfo[level].tpinfo[Mission[id].RandInfo[level].tpinfo.count].tprand = tprand
	end
	LG( "randmission_init", "mission = , mission.RandInfo = , mission.RandInfo[level] = ", Mission[id], Mission[id].RandInfo, Mission[id].RandInfo[level] )
	LG( "randmission_init",  "AddRandMissionInfo:id = , level = , tp = , tprand = , p1 =, p2 =, p3 =, p4 =, p5 =, p6 =, p7 =, p8 =", id, level, tp, tprand, p1, p2, p3, p4, p5, p6, p7, p8 )
	return LUA_TRUE
end

--Ìí¼Ó´Ý»ÙÎï¼þÀàÐÍµÃËæ»ú¿âÐÅÏ¢
function AddRandKillInfo( level, monsterid, randvalue, randscope, exp, money )
	if Mission.curmission == nil or Mission.curmission.sid == nil then
		PRINT( "AddRandKillInfo: register random quest notice, please define a random quest!level, monsterid,  randvalue, randscope, exp, money", level, monsterid, randvalue, randscope, exp, money )
		LG( "randmission_error", "AddRandKillInfo: register random quest notice, please define a random quest!level, monsterid,  randvalue, randscope, exp, money", level, monsterid, randvalue, randscope, exp, money )
		return
	end
	
	local ret = AddRandMissionInfo( Mission.curmission.sid, level, MIS_RAND_KILL, monsterid, randvalue, randscope, exp, money )
	if ret ~= LUA_TRUE then
			PRINT( "AddRandKillInfo:AddRandMissionInfo: register random quest notice error! level, monsterid,  randvalue, randscope, exp, money", level, monsterid, randvalue, randscope, exp, money )
			LG( "randmission_error", "AddRandKillInfo:AddRandMissionInfo: register random quest notice error! level, monsterid,  randvalue, randscope, exp, money", level, monsterid, randvalue, randscope, exp, money )
			return
	end	
	LG( "randmission_init", "AddRandKillInfo:level, monsterid, randvalue, randscope, exp, money", level, monsterid, randvalue, randscope, exp, money )
end

--Ìí¼Ó»ñÈ¡ÎïÆ·ÀàÐÍËæ»ú¿âÐÅÏ¢
function AddRandGetItem( level, itemid, randvalue, randscope, exp, money )
	if Mission.curmission == nil or Mission.curmission.sid == nil then
		PRINT( "AddRandGetItem: register random quest notice, please define a random quest!level, itemid,  randvalue, randscope, exp, money", level, itemid, randvalue, randscope, exp, money )
		LG( "randmission_error", "AddRandGetItem: register random quest notice, please define a random quest!level, itemid,  randvalue, randscope, exp, money", level, itemid, randvalue, randscope, exp, money )
		return
	end
	
	local ret = AddRandMissionInfo( Mission.curmission.sid, level, MIS_RAND_GET, itemid, randvalue, randscope, exp, money )
	if ret ~= LUA_TRUE then
			PRINT( "AddRandGetItem:AddRandMissionInfo: register random quest notice error! level, monsterid,  randvalue, randscope, exp, money", level, itemid, randvalue, randscope, exp, money )
			LG( "randmission_error", "AddRandGetItem:AddRandMissionInfo: register random quest notice error! level, itemid,  randvalue, randscope, exp, money", level, itemid, randvalue, randscope, exp, money )
			return
	end
	LG( "randmission_init", "AddRandGetItem:level, itemid, randvalue, randscope, exp, money", level, itemid, randvalue, randscope, exp, money )
end

--Ìí¼ÓËÍÎï¼þÀàÐÍËæ»ú¿âÐÅÏ¢
function AddRandSendInfo( level, npcid, exp, money )
	if Mission.curmission == nil or Mission.curmission.sid == nil then
		PRINT( "AddRandSendInfo: register random quest notice, please define a random quest!level, npcid, exp, money", level, npcid, exp, money )
		LG( "randmission_error", "AddRandSendInfo: register random quest notice, please define a random quest!level, npcid, exp, money", level, npcid, exp, money )
		return
	end
	
	if npcid == nil or NpcList[npcid] == nil or NpcList[npcid].mapid == nil or NpcList[npcid].areaid == nil then
		PRINT( "AddRandSendInfo: Please input correct NPC ID notice. npcid = ", npcid )
		LG( "randmission_error", "AddRandSendInfo: Please input correct NPC ID notice. npcid = ", npcid )
		return
	end
	
	local ret = AddRandMissionInfo( Mission.curmission.sid, level, MIS_RAND_SEND, npcid, NpcList[npcid].areaid, NpcList[npcid].mapid, exp, money )
	if ret ~= LUA_TRUE then
			PRINT( "AddRandSendInfo:AddRandMissionInfo: register random quest notice error! level, npcid, mapid, areaid, mapid, exp, money", level, npcid, NpcList[npcid].areaid, NpcList[npcid].mapid, exp, money )
			LG( "randmission_error", "AddRandSendInfo:AddRandMissionInfo: register random quest notice error! level, npcid, areaid, mapid, exp, money", level, npcid, NpcList[npcid].areaid, NpcList[npcid].mapid, exp, money )
			return
	end
	LG( "randmission_init", "AddRandSendInfo:level, npcid, mapid, areaid, exp, money", level, npcid, NpcList[npcid].areaid, NpcList[npcid].mapid, exp, money )
end

--Ìí¼ÓËÍÎï¼þÀàÐÍËæ»ú¿â¿ÉÑ¡Îï¼þÐÅÏ¢
function AddRandSendItem( level, item )
	if Mission.curmission.RandInfo[level] == nil then
		PRINT( "AddRandSendItem: add send letter random quest item, exceeds level.level = ", level )
		LG( "randmission_error", "AddRandSendItem: add send letter random quest item, exceeds level.level = ", level )
		return
	end
	Mission.curmission.RandInfo[level].SendItem.count = Mission.curmission.RandInfo[level].SendItem.count + 1
	Mission.curmission.RandInfo[level].SendItem[Mission.curmission.RandInfo[level].SendItem.count] = item
	LG( "randmission_init", "AddRandSendItem:misid, level, item", Mission.curmission.sid, level, item )
end

--Ìí¼Ó»¤ËÍÀàÐÍËæ»ú¿âÐÅÏ¢
function AddRandConvoyInfo( level, charid, mapid, areaid, x, y, scope, exp, money )
	if Mission.curmission == nil or Mission.curmission.sid == nil then
		PRINT( "AddRandConvoyInfo: when registering random quest notice , please define a random quest!level, npcid, areaid, mapid, exp, money", level, areaid, mapid, exp, money )
		LG( "randmission_error", "AddRandConvoyInfo: when registering random quest notice , please define a random quest!level, npcid, areaid, mapid, exp, money", level, areaid, mapid, exp, money )
		return
	end

	local ret = AddRandMissionInfo( Mission.curmission.sid, level, MIS_RAND_CONVOY, charid, mapid, areaid, x, y, scope, exp, money )
	if ret ~= LUA_TRUE then
			PRINT( "AddRandConvoyInfo:AddRandMissionInfo: Register random quest notice error! level, charid, mapid, mapid, areaid, x, y, scope, exp, money", level, charid, mapid, areaid, x, y, scope, exp, money )
			LG( "randmission_error", "AddRandConvoyInfo:AddRandMissionInfo: register random quest notice error! level, charid, mapid, areaid, x, y, scope, exp, money", level, charid, mapid, areaid, x, y, scope, exp, money )
			return
	end
	LG( "randmission_init", "AddRandConvoyInfo:level, charid, mapid, areaid, x, y, scope, exp, money", level, charid, mapid, areaid, x, y, scope, exp, money )
end

--Ìí¼ÓÌ½Ë÷ÀàÐÍËæ»ú¿âÐÅÏ¢
function AddRandExploreInfo( level, mapid, areaid, x, y, exp, money )
end

function AddRandPriceCess( level, cess, cessrange )
	LG( "randmission_init", "AddRandPrizeItem:misid, level, cess, cessrange", Mission.curmission.sid, level, cess, cessrange )
	if Mission.curmission.RandInfo[level] == nil then
		LG( "randmission_prize_error", "AddRandPriceCess, level data error.", level )
		return
	end
	
	Mission.curmission.RandInfo[level].LoopData.count = Mission.curmission.RandInfo[level].LoopData.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = 0
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.tp = MIS_PRIZE_CESS
	
	local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_CESS
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = cess
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = cessrange
end

--Ëæ»úÈÎÎñ½ÇÉ«ÉùÍû½±Àø
function AddRandPriceFrame( level, frame, framerange )
	LG( "randmission_init", "AddRandPrizeItem:misid, level, frame, framerange" )
	if Mission.curmission.RandInfo[level] == nil then
		LG( "randmission_prize_error", "AddRandPriceFrame, level data error.", level )
		return
	end
	
	Mission.curmission.RandInfo[level].LoopData.count = Mission.curmission.RandInfo[level].LoopData.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = 0
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.tp = MIS_PRIZE_FAME
	
	local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_FAME
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = frame
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = framerange
end

--Ëæ¼´ÈÎÎñ½ÇÉ«³èÎï¾­Ñé½±Àø
function AddRandPricePetExp( level, exp, exprange )
	LG( "randmission_init", "AddRandPricePetExp:misid, level, exp, exprange" )
	if Mission.curmission.RandInfo[level] == nil then
		LG( "randmission_prize_error", "AddRandPricePetExp, level data error.", level )
		return
	end
	
	Mission.curmission.RandInfo[level].LoopData.count = Mission.curmission.RandInfo[level].LoopData.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = 0
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.tp = MIS_PRIZE_PETEXP
	
	local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_PETEXP
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = exp
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = exprange
end

--¿ªÊ¼Ìí¼ÓËæ»úÈÎÎñ¸ß¼¶½±Àø
function SetRandPrizeItem( level )
	LG( "randmission_init2", "SetRandPrizeItem:misid, level", Mission.curmission.sid, level )
	if Mission.curmission.RandInfo[level] == nil then
		LG( "randmission_prize_error", "SetRandPrizeItem, level data error.", level )
		return
	end
	
	Mission.curmission.RandInfo[level].LoopData.count = Mission.curmission.RandInfo[level].LoopData.count + 1
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count] = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize = {}
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = 0
	Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.tp = MIS_PRIZE_ITEM
end

--Ëæ»úÈÎÎñ¸ß¼¶ÎïÆ·½±Àø
function AddRandPrizeItem( level, item1, itemdata1, item2, itemdata2, item3, itemdata3, item4, itemdata4 )	
	if Mission.curmission.RandInfo[level] == nil then
		LG( "randmission_prize_error", "AddRandPrizeItem, level data error.", level )
		return
	end
	
	if Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count] == nil or Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize == nil then
		LG( "randmission_error", "AddRandPrizeItem: level data notice has not initialized, misid = , level = ", Mission.curmission.sid, level )
		return
	end
	LG( "randmission_init2", "AddRandPrizeItem:misid, level, item1, itemdata1, item2, itemdata2, item3, itemdata3, item4, itemdata4", Mission.curmission.sid, level, item1, itemdata1, item2, itemdata2, item3, itemdata3, item4, itemdata4 )
	
	if item1 ~= nil then
		local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_ITEM
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = item1
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = itemdata1
	else
		return
	end
	
	if item2 ~= nil then
		local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_ITEM
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = item2
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = itemdata2
	else
		return
	end

	if item3 ~= nil then
		local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_ITEM
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = item3
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = itemdata3
	else
		return
	end

	if item4 ~= nil then
		local count = Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count + 1
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize.count = count
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count] = {}
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].tp = MIS_PRIZE_ITEM
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p1 = item4
		Mission.curmission.RandInfo[level].LoopData[Mission.curmission.RandInfo[level].LoopData.count].Prize[count].p2 = itemdata4
	else
		return
	end

end

--ÉèÖÃËæ»úÈÎÎñ¶ÎÍê³É¸ßµÈ¼¶×°±¸½±ÀøµÄËæ»úÂÊºÍÐèÒªÍê³É×î´óÊýÁ¿
function SetRandPrizeOdds( loopnum, odds, completenum )
	--Mission.curmission.RandInfo[level].PrizeItem.odds = odds
	--Mission.curmission.RandInfo[level].PrizeItem.num  = completenum
	--LG( "randmission_init", "AddRandPrizeItem:Add item, level, odds, completenum", level, odds, completenum )
	
	LG( "randmission_init", "SetRandPrizeOdds:loopnum, odds, completenum", loopnum, odds, completenum )
	if Mission.curmission.loopinfo[loopnum] ~= nil then
		PRINT( "SetRandPrizeOdds: data set duplicate.loopnum, odds completenum", loopnum, Mission.curmission.loopinfo[loopnum].odds, Mission.curmission.loopinfo[loopnum].completenum )
		LG( "randmission_error", "SetRandPrizeOdds: data set duplicate.loopnum, odds completenum", loopnum, Mission.curmission.loopinfo[loopnum].odds, Mission.curmission.loopinfo[loopnum].completenum )
	end
	
	Mission.curmission.loopinfo[loopnum] = {}
	Mission.curmission.loopinfo[loopnum].odds = odds
	Mission.curmission.loopinfo[loopnum].num = completenum
end

--³õÊ¼»¯ÊÀ½çNPCÐÅÏ¢ÁÐ±í
function InitNpcList()
	NpcList = {}
	NpcList.count = 0
end

--Ìí¼ÓNPCÐÅÏ¢
function AddNpcInfo( npcid, name, mapid, areaid )
	PRINT( "Add NPC, ID["..npcid.."], Name ["..name.."] , MapID = "..mapid.."AreaID = "..areaid )
	LG( "npcinfo", "AddNpcInfo:npcid = "..npcid.."name = "..name.."mapid = "..mapid.."areaid = "..areaid )
	if NpcList[npcid] ~= nil then
		LG( "npcinfo", "AddNpcInfo: found duplicate ID while adding notice, overlay original NPC notice.ID = "..npcid.."name = "..NpcList[npcid].name )
		PRINT( "AddNpcInfo: found duplicate ID while adding notice, overlay original NPC notice.ID = "..npcid.."name = "..NpcList[npcid].name )
	end
	NpcList[npcid] = {}
	NpcList[npcid].name = name
	NpcList[npcid].mapid = mapid
	NpcList[npcid].areaid = areaid
end

function GetNpcName( npcid )
	if npcid == nil or NpcList[npcid] == nil or NpcList[npcid].name == nil then
		return "Unknown NPC"..npcid
	end
	return NpcList[npcid].name
end

--³õÊ¼»¯×ÊÔ´ÐÅÏ¢ÁÐ±í
function InitResource()
	ResourceList = {}		--×ÊÔ´ÐÅÏ¢
	ResourceList.wood = {}
	ResourceList.mine = {}
end

--Ìí¼Ó×ÊÔ´ÐÅÏ¢
function SetWoodResource( level, itemid, count, pileid )
	if level == nil or itemid == nil or count == nil or pileid == nil then
		PRINT( "SetWoodResource:Function parameter error!level, itemid, count, pileid", level, itemid, count, pileid )
		LG( "goods_error", "SetWoodResource:Function parameter error!level, itemid, count, pileid", level, itemid, count, pileid )
		return LUA_FALSE
	end
	
	if ResourceList == nil or ResourceList.wood == nil then
		PRINT( "SetWoodResource: resource notice list cannot be as null!" )
		LG( "goods_error", "SetWoodResource: resource notice list cannot be as null!" )
		return LAU_FALSE
	end
	
	if ResourceList.wood[level] ~= nil then
		PRINT( "While setting wood resource loading notice, overlay of notice level is discovered!old data, level, itemid, count, pileid", level, itemid, count, pileid )
		LG( "goods_error", "While setting wood resource loading notice, overlay of notice level is discovered!old data, level, itemid, count, pileid", level, itemid, count, pileid )
	end
	
	ResourceList.wood[level] = {}
	ResourceList.wood[level].itemid = itemid
	ResourceList.wood[level].count = count
	ResourceList.wood[level].pileid  = pileid
	PRINT( "Set wood resource loading notice: Level, ItemID, Count, PileID", level, itemid, count, pileid )
	LG( "packbag_init", "Set wood resource loading notice: Level, ItemID, Count, PileID", level, itemid, count, pileid )
	return LUA_TRUE
end

function SetMineResource( level, itemid, count, pileid )
	if level == nil or itemid == nil or count == nil or pileid == nil then
		PRINT( "SetMineResource:Function parameter error!level, itemid, count, pileid", level, itemid, count, pileid )
		LG( "goods_error", "SetMineResource:Function parameter error!level, itemid, count, pileid", level, itemid, count, pileid )
		return LUA_FALSE
	end
	
	if ResourceList == nil or ResourceList.mine == nil then
		PRINT( "SetMineResource: resource notice list cannot be as null!" )
		LG( "goods_error", "SetMineResource: resource notice list cannot be as null!" )
		return LAU_FALSE
	end
	
	if ResourceList.mine[level] ~= nil then
		PRINT( "While setting ore resource loading notice, level notice discovered to be overlayed! old data, level, itemid, count, pileid", level, itemid, count, pileid )
		LG( "goods_error", "While setting ore resource loading notice, level notice discovered to be overlayed! old data, level, itemid, count, pileid", level, itemid, count, pileid )
	end
	
	ResourceList.mine[level] = {}
	ResourceList.mine[level].itemid = itemid
	ResourceList.mine[level].count = count
	ResourceList.mine[level].pileid  = pileid
	PRINT( "set ore resource loading notice: level, ItemID, Count, PileID", level, itemid, count, pileid )
	LG( "packbag_init", "set ore resource loading notice: level, ItemID, Count, PileID", level, itemid, count, pileid )
	return LUA_TRUE
end

--Ìí¼Ó¸Û¿ÚÐÅÏ¢
function AddBerthPort( id, name )
	PRINT( "Add Harbor Notice: ID["..id.."], Name["..name.."]" )
	LG( "boat_init", "Add Harbor Notice: ID["..id.."], Name["..name.."]" )
	if BerthPortList[id] ~= nil then
		LG( "boat_error", "AddBerthPort: adds harbor notice sending duplicate ID found, overlayed date: ID = "..id.."name = "..BerthPortList[id].name )
		PRINT( "AddBerthPort: adds harbor notice sending duplicate ID found, overlayed date: ID = "..id.."name = "..BerthPortList[id].name )
	end
	
	BerthPortList[id] = {}
	BerthPortList[id].name = name
end

--»ñÈ¡¸Û¿ÚÐÅÏ¢
function GetBerthData( id )
	if id == nil or BerthPortList[id] == nil or BerthPortList[id].name == nil then		
		return "Unknown Harbor name"..id
	end
	return BerthPortList[id].name
end

--´´½¨ÊÂ¼þÊµÌå
function CreateBerthEntity( name, cid, infoid, xpos1, ypos1, dir1, berth, xpos2, ypos2, dir2 )
	PRINT( "Build Dock", name, cid, infoid, xpos1, ypos1, dir1, berth, xpos2, ypos2, dir2 )
	if name == nil or cid == nil or infoid == nil or xpos1 == nil or ypos1 == nil or dir1 == nil or berth == nil or xpos2 == nil or ypos2 == nil or dir2 == nil then
		PRINT( "CreateBerthEntity: Create function parameter notice error!" )
		LG( "entity_error", "CreateBerthEntity: Create function parameter notice error!" )
		return
	end
	LG( "entity_init", "CreateBerthEntity:name, cid, infoid, xpos1, ypos1, dir1, berth, xpos2, ypos2, dir2", name, cid, infoid, xpos1, ypos1, dir1, berth, xpos2, ypos2, dir2 )	
	
	local ret, submap = GetCurSubmap()
	if ret ~= LUA_TRUE then
		PRINT( "CreateBerthEntity:GetCurSubmapfunctiontransfer failed!" )
		LG( "entity_error", "CreateBerthEntity:GetCurSubmapfunctiontransfer failed!" )
		return
	end
	local ret, e = CreateEventEntity( BERTH_ENTITY, submap, name, cid, infoid, xpos1, ypos1, dir1 )
	if ret ~= LUA_TRUE then
		PRINT( "CreateBerthEntity:CreateEventEntity:functiontransfer failed!tp, submap, name, cid, infoid, xpos1, ypos1, dir1", BERTH_ENTITY, submap, name, cid, infoid, xpos1, ypos1, dir1 )
		LG( "entity_error", "CreateBerthEntity:CreateEventEntity function transfer failed! tp, submap, name, cid, infoid, xpos1, ypos1, dir1", BERTH_ENTITY, submap, name, cid, infoid, xpos1, ypos1, dir1 )
		return
	end
	ret = SetEntityData( e, berth, xpos2, ypos2, dir2 )
	if ret ~= LUA_TRUE then
		PRINT( "CreateBerthEntity:SetEntityDatafunctiontransfer failed!e, berth, xpos2, ypos2, dir2 ", e, berth, xpos2, ypos2, dir2 )
		LG( "entity_error", "CreateBerthEntity:e, berth, xpos2, ypos2, dir2", e, berth, xpos2, ypos2, dir2 )
		return
	end
end

--´´½¨×ÊÔ´ÊµÌå
function CreateResourceEntity( name, cid, infoid, xpos, ypos, dir, itemid, count, time )
	PRINT( "create resource entity", name, cid, infoid, xpos, ypos, dir, itemid, count, time )
	if name == nil or cid == nil or infoid == nil or xpos == nil or ypos == nil or dir == nil or itemid == nil or count == nil or time == nil then
		PRINT( "CreateResourceEntity: create function parameter notice error!" )
		LG( "entity_error", "CreateResourceEntity: create function parameter notice error!" )
		return
	end
	LG( "entity_init", "CreateResourceEntity:name, cid, infoid, xpos, ypos, dir, itemid, count, time", name, cid, infoid, xpos, ypos, dir, itemid, count, time )	
	
	local ret, submap = GetCurSubmap()
	if ret ~= LUA_TRUE then
		PRINT( "CreateResourceEntity:GetCurSubmapfunctiontransfer failed!" )
		LG( "entity_error", "CreateResourceEntity:GetCurSubmapfunctiontransfer failed!" )
		return
	end
	local ret, e = CreateEventEntity( RESOURCE_ENTITY, submap, name, cid, infoid, xpos, ypos, dir )
	if ret ~= LUA_TRUE then
		PRINT( "CreateResourceEntity:CreateEventEntity: function transfer failed!tp, submap, name, cid, infoid, xpos, ypos, dir", RESOURCE_ENTITY, submap, name, cid, infoid, xpos, ypos, dir )
		LG( "entity_error", "CreateResourceEntity:CreateEventEntityfunctiontransfer failed!tp, submap, name, cid, infoid, xpos, ypos, dir", RESOURCE_ENTITY, submap, name, cid, infoid, xpos, ypos, dir )
		return
	end
	ret = SetEntityData( e, itemid, count, time )
	if ret ~= LUA_TRUE then
		PRINT( "CreateResourceEntity:SetEntityDatafunctiontransfer failed!e, itemid, count, time ", e, itemid, count, time )
		LG( "entity_error", "CreateResourceEntity:e, itemid, count, time", e, itemid, count, time )
		return
	end
end

--ÉèÖÃ½ÇÉ«×ªÖ°Ö°ÒµÀà±ðºÍ½ÇÉ«ÀàÐÍÏÞ¶¨Ìõ¼þÅÐ¶ÏÐÅÏ¢£¬
function AddPfTable( curpf, uppf )
	if Profession[curpf] == nil then
		Profession[curpf] = {}
		Profession[curpf].count = 0
	end
	
	for n = 1, Profession[curpf].count, 1 do
		if Profession[curpf][n] == uppf then
			PRINT( "Set target class advancement list notice already existed, add target notice failed!curpf = , uppf = ", curpf, uppf )
			LG( "PfTable_error", "Set target class advancement list notice already existed, add target notice failed!" )
			return
		end
	end
	
	Profession[curpf].count = Profession[curpf].count + 1
	Profession[curpf][Profession[curpf].count] = uppf
	
	LG( "PfTable", "AddPfTable, curpf, uppf, count", curpf, uppf, Profession[curpf].count )
end

function AddCatTable( cat, pf )
	if Category[cat] == nil then
		Category[cat] = {}
		Category[cat].count = 0
	end
	
	for n = 1, Category[cat].count, 1 do
		if Category[cat][n] == pf then
			PRINT( "Set target size class advancement restriction notice already existed add target notice failed!, cat, pt ", cat, pf )
			LG( "PfTable_error", "Set target size class advancement restriction notice already existed, add target notice failed!" )
			return
		end
	end
	
	Category[cat].count = Category[cat].count + 1
	Category[cat][Category[cat].count] = pf
	
	LG( "PfTable", "AddCatTable, cat, pf, count ", cat, pf, Category[cat].count )
end

------------------------------------------------------------
--²âÊÔ´úÂë
function TestDefPage()
	--µÚÒ»Ò³
	Talk( 1, "Granny: \"Hello, young fellow!\"" )
	Text( 1, "Quest", amp, 2 )
	Text( 1, "bye", ct, 2 )

	--µÚ¶þÒ³
	Talk( 2, "Granny: \"Nothing¡­Go do your stuff\"" )

	--µÚÈýÒ³
	Talk( 3, "Granny: \"Did you help me collect Leaf Buds? I need 10. Get them from the Mystic Shrub outside of Argent City.\"" )
	Text( 3, "Ok, I understand", ct )

	--³õÊ¼»¯MultiTrigger
	InitTrigger()

	--µÚÒ»¸ö´¥·¢Æ÷
	TriggerCondition( 1, HasMission, 12 )
	TriggerCondition( 1, NoRecord, 145 )
	TriggerAction( 1, GiveItem, 789 )

	--µÚ¶þ¸ö´¥·¢Æ÷
	TriggerCondition( 2, HasMission, 12 )
	TriggerCondition( 2, NoRecord, 145 )
	TriggerAction( 2, GiveItem, 789 )

	--³õÊ¼»¯¶àº¯ÊýÁÐ±í
	InitFuncList()
	
	--Ìí¼Óº¯Êýµ½º¯ÊýÁÐ±íÖÐ
	AddFuncList( CreditExchange, 0 ) --ÒªÇ®
	AddFuncList( CreditExchange, 1 ) --ÒªÎï
	--ÒÔÉÏÁ½ÕßÈ¡ÆäÒ»
	
	--µÚËÄÒ³
	Talk( 4, "Granny: \"Remember to bring the medicine to the physician. He should be near the starry bar in Argent City.\"" )
	Text( 4, "Ok", MultiTrigger, GetMultiTrigger(), 2 )
	
	--³õÊ¼»¯¶àº¯ÊýÁÐ±í
	InitFuncList()
	
	--Ìí¼Óº¯Êýµ½º¯ÊýÁÐ±íÖÐ
	AddFuncList( CreditExchange, 0 ) --ÒªÇ®
	Test( 4, "Redeem gold", MultiFunc, GetFuncList(), GetNumFunc() )
	
	--³õÊ¼»¯¶àº¯ÊýÁÐ±í
	InitFuncList()
	
	--Ìí¼Óº¯Êýµ½º¯ÊýÁÐ±íÖÐ
	AddFuncList( CreditExchange, 1 ) --ÒªÎï	
	Test( 4, "Redemption item", MultiFunc, GetFuncList(), GetNumFunc() )
	
	--¶¨Òå½»Ò×ÐÅÏ¢
	InitTrade()

	--ÎäÆ÷
	Weapon( 1721 )
	Weapon( 1722 )
	Weapon( 1723 )

	--·À¾ß
	Defence( 1001 )

	--ÆäËû
	Other( 1991 )

	--³õÊ¼»¯MultiTrigger
	InitTrigger()

	--µÚÒ»¸ö´¥·¢Æ÷
	TriggerCondition( 1, HasMission, 12 )
	TriggerCondition( 1, NoRecord, 145 )
	TriggerAction( 1, jp, 1 )

	--µÚ¶þ¸ö´¥·¢Æ÷
	TriggerCondition( 2, HasMission, 13 )
	TriggerCondition( 2, NoRecord, 146 )
	TriggerAction( 2, jp, 2 )

	--Ò³¿ªÊ¼´¥·¢Æ÷
	Start( GetMultiTrigger(), 2 )
end

--²âÊÔ¶Ô»°Ò³º¯Êý
--ResetNpcInfo( "TestNpc" )
--TestDefPage()

--Ëæ»úÈÎÎñ½ÓÊÜËÍÐÅNPCÈÎÎñÐÅÏ¢¶¨Òå
function TestDefMission( id, name, misid, scriptid, npcid, areaid )
	DefineMission( id, name, misid, COMPLETE_SHOW )
	
	MisPrize( MIS_PRIZE_MONEY, 300, 1 )
	MisPrizeSelAll() --È«²¿¸øÓè
	
	MisBeginTalk( "Thank you for sending my parcel over!" )
	MisBeginCondition( AlwaysFailure )
	
	MisReultTalk( "Thank you for sending my parcel over!" )
	MisHelpTalk( "Quest incompleted, please continue" )
	
	MisResultCondition( HasRandMissionNpc, misid, npcid, areaid )
	MisResultCondition( NoRandNpcItemFlag, misid, npcid )
	
	MisResultAction( TakeRandNpcItem, misid, npcid, GetNpcName( npcid ) )
	MisResultAction( AddExp, 100, 1000 )
	MisResultAction( RefreshCompleteFlag, scriptid )
end

--TestDefMission( 1, "Parcel of Peter", 8, 3, 1 )
--AddNpcInfo( 3, "Peter", 1, 1 ) --Ìí¼Ó¸ÃNPCµ½ÐÅÏ¢¿âÖÐ

--TestDefMission( 2, "Parcel of Shaitan Teleporter", 8, 4, 1 )
--AddNpcInfo( 4, "Shaitan Teleporter", 1, 1 )

function TestRegNpcMission()
	AddNpcMission( 2 )
end

--¶¨ÒåÒ»¸öËæ»úÈÎÎñ
function TestRandMission()
	PRINT( "TestRandMission" )
   --³õÊ¼»¯Ëæ»úÈÎÎñ»ù±¾ÐÅÏ¢
   DefineRandMission( 10, "Random Quest", 8 )

   --ÉèÖÃËæ»úÈÎÎñÀàÐÍ
   --AddRandMissionType( MIS_RAND_KILL, 1, 2, 3, 4 )
   --AddRandMissionType( MIS_RAND_GET, 5, 6, 7, 8 )
   --AddRandMissionType( MIS_RAND_SEND, 9, 10, 11, 12 )
   AddRandMissionType( MIS_RAND_CONVOY, 1, 2, 3, 4, 5 )
   --AddRandMissionType( MIS_RAND_EXPLORE )
   PRINT( "AddRandMissionType" )
   
   --ÉèÖÃ´Ý»ÙÊý¾Ý¿âÐÅÏ¢
   --AddRandKillInfo( 1, 69, 1, 8, 100, 50 )
   --AddRandKillInfo( 2, 69, 1, 4, 200, 100 )
   --AddRandKillInfo( 2, 70, 1, 4, 400, 200 )
   
   --
   --AddRandGetItem( 2, 1721, 1, 4, 18, 80 )
   --AddRandGetItem( 2, 1715, 5, 4, 80, 800 )
   
   --
   --AddRandSendInfo( 2, 3, 190, 290 )
   --AddRandSendInfo( 2, 4, 390, 890 )

   --2¼¶Ëæ»ú¿ÉËÍµÄÎïÆ·ÐÅÏ¢Ìí¼Ó
   --AddRandSendItem( 2, 1721 )
   --AddRandSendItem( 2, 1722 )
   --AddRandSendItem( 2, 1723 )
   --AddRandSendItem( 2, 1715 )
   
   --
   AddRandConvoyInfo( 2, 1, 1, 1, 2198, 2780, 10, 60, 120 )
   
   --   AddRandPrizeItem( 2, 2 )
   AddRandPrizeItem( 2, 3 )
   AddRandPrizeItem( 2, 4 )
   AddRandPrizeItem( 2, 5 )
   AddRandPrizeItem( 2, 6 )
   
   SetRandPrizeOdds( 2, 50, 5 )

end

--TestRandMission()

--²âÊÔÈÎÎñÐÅÏ¢×¢²áº¯Êý
--ResetNpcInfo( "TestNpc" )
--TestDefMission()
--TestRegNpcMission()

--²âÊÔ³öÉú
function TestBorn()
	PRINT( "TestBorn" )
	InitTrigger()
	--TriggerAction( 1, AddTrigger, 24, TE_LEVELUP, 15, 1 )
	--TriggerAction( 1, AddTrigger, 25, TE_GOTO_MAP, 1, 2198, 2780, 10 )
	--TriggerAction( 1, AddTrigger, 26, TE_GAMETIME, TT_MULTITIME, 1, 1 )
	--TriggerAction( 1, AddTrigger, 27, TE_GAMETIME, TT_CYCLETIME, 1, 0 )
	--TriggerAction( 1, AddTrigger, 28, TE_GAMETIME, TT_MULTITIME, 1, 10 )
	--TriggerAction( 1, AddTrigger, 29, TE_KILL, 69, 2 )
	--TriggerAction( 1, AddTrigger, 30, TE_GETITEM, 1721, 2 )
	RegTrigger( 88888, 1 )
	
	--define trigger 24
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Level up 15! trigger action!" )
	RegTrigger( 24, 1 )
	
	--define trigger 25
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Goto map, 2197, 2780, 10 m!" )
	TriggerAction( 1, SummonNpc, 1, 1, "Physican - Ditto", 4 )
	RegTrigger( 25, 1 )
	
	--define trigger 26
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Time single per 1 minute trig" )
	TriggerAction( 1, SystemNotice, "Welcome to the world of Pirate King Online!" )
	RegTrigger( 26, 1 )
	
	--define trigger 27
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Time cycle per 1 minute" )
	TriggerAction( 1, HelpInfo, MIS_HELP_DESP, "You are still new. Work hard and train hard!" )
	TriggerAction( 1, HelpInfo, MIS_HELP_IMAGE, "ÐÂÊÖmap Ö¸µ¼ÊÖ²á.tga" )
	TriggerAction( 1, HelpInfo, MIS_HELP_SOUNT, 18 )
	RegTrigger( 27, 1 )
	
	--define trigger 28
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Time multitime per 1 minute 10 count" )
	RegTrigger( 28, 1 )
	
	--define trigger 29
	InitTrigger()
	TriggerAction( 1, SystemNotice, "kill 69 monster" )
	RegTrigger( 29, 1 )
	
	--define trigger 30
	InitTrigger()
	TriggerAction( 1, SystemNotice, "Getitem 1721" )
	RegTrigger( 30, 1 )	
	
end
--TestBorn()


--ÉèÖÃ×ªÖ°ÏÞÖÆÐÅÏ¢
function TestConvertProfession()
	--ÐÂÊÖÎÞ×ªÖ°ÏÞÖÆ 
	
	--½£Ê¿×ªÖ°
	AddPfTable( 1, 8 )		--×ªÖ°Îª¾Þ½£Ê¿
	AddPfTable( 1, 9 )		--×ªÖ°ÎªË«½£Ê¿
	AddPfTable( 1, 10 )		--×ªÖ°Îª½£¶ÜÊ¿
	
	--ÁÔÈË×ªÖ°
	AddPfTable( 2, 11 )		--×ªÖ°ÎªÑµÊÞÊ¦
	AddPfTable( 2, 12 )		--×ªÖ°Îª¾Ñ»÷ÊÖ
	
	--Ë®ÊÖ×ªÖ°
	AddPfTable( 3, 15 )		--×ªÖ°Îª´¬³¤
	
	--Ã°ÏÕÕß×ªÖ°
	AddPfTable( 4, 16 ) 	--×ªÖ°Îªº½º£Ê¿
	
	--ÆíÔ¸Ê¹×ªÖ°
	AddPfTable( 5, 13 )		--×ªÖ°ÎªÊ¥Ö°Õß
	AddPfTable( 5, 14 )		--×ªÖ°Îª·âÓ¡Ê¦
	
	--¼¼Ê¦×ªÖ°
	AddPfTable( 6, 18 )		--×ªÖ°Îª¹¤³ÌÊ¦
	
	--ÉÌÈË×ªÖ°
	AddPfTable( 7, 17 )		--×ªÖ°ÎªÉÌÈË
	
	--½ÇÉ«ÌåÐÎÏÞÖÆ
	--³¤·¢ÄÐ×ªÖ°
	AddCatTable( 1, 1 )		--×ªÖ°Îª½£Ê¿
	AddCatTable( 1, 2 )		--×ªÖ°ÎªÁÔÈË
	AddCatTable( 1, 4 )		--×ªÖ°ÎªÃ°ÏÕÕß
	AddCatTable( 1, 7 )		--×ªÖ°ÎªÉÌÈË
	AddCatTable( 1, 9 )		--×ªÖ°ÎªË«½£Ê¿
	AddCatTable( 1, 10 )	--×ªÖ°Îª½£¶ÜÊ¿
	AddCatTable( 1, 11 )	--×ªÖ°ÎªÑ±ÊÞÊ¦
	AddCatTable( 1, 12 )	--×ªÖ°Îª¾Ñ»÷ÊÖ
	AddCatTable( 1, 16 )	--×ªÖ°Îªº½º£Ê¿
	AddCatTable( 1, 17 )	--×ªÖ°Îª±¬·¢»§
	
	--¿ýÎàÄÐ×ªÖ°
	AddCatTable( 2, 1 )		--×ªÖ°Îª½£Ê¿
	AddCatTable( 2, 3 )		--×ªÖ°ÎªË®ÊÖ
	AddCatTable( 2, 6 )		--×ªÖ°Îª¼¼Ê¦
	AddCatTable( 2, 7 )		--×ªÖ°ÎªÉÌÈË
	AddCatTable( 2, 8 )		--×ªÖ°Îª¾Þ½£Ê¿
	AddCatTable( 2, 10 )	--×ªÖ°Îª½£¶ÜÊ¿
	AddCatTable( 2, 17 )	--×ªÖ°Îª±¬·¢»§
	
	--Å®Ö÷½ÇÒ»×ªÖ°
	AddCatTable( 3, 1 )
	AddCatTable( 3, 2 )		--×ªÖ°ÎªÁÔÈË
	AddCatTable( 3, 3 )		--×ªÖ°ÎªË®ÊÖ
	AddCatTable( 3, 5 )		--×ªÖ°ÎªÆíÔ¸Ê¹
	AddCatTable( 3, 7 )		--×ªÖ°ÎªÉÌÈË
	AddCatTable( 3, 9 )
	AddCatTable( 3, 11 )	--×ªÖ°ÎªÑµÊÞÊ¦
	AddCatTable( 3, 12 )	--×ªÖ°Îª¾Ñ»÷ÊÖ
	AddCatTable( 3, 13 )	--×ªÖ°ÎªÊ¥Ö°Õß
	AddCatTable( 3, 14 )	--×ªÖ°Îª·âÓ¡Ê¦
	AddCatTable( 3, 15 )	--×ªÖ°Îª´¬³¤
	AddCatTable( 3, 17 )	--×ªÖ°Îª±©·¢»§
	
	--Å®Ö÷½Ç¶þ×ªÖ°
	AddCatTable( 4, 4 )		--×ªÖ°ÎªÃ°ÏÕÕß
	AddCatTable( 4, 5 )		--×ªÖ°ÎªÆíÔ¸Ê¹
	AddCatTable( 4, 6 )		--×ªÖ°Îª¼¼Ê¦
	AddCatTable( 4, 7 )		--×ªÖ°ÎªÉÌÈË
	AddCatTable( 4, 13 )	--×ªÖ°ÎªÊ¥Ö°Õß
	AddCatTable( 4, 14 )	--×ªÖ°Îª·âÓ¡Ê¦
	AddCatTable( 4, 16 )	--×ªÖ°Îªº½º£Ê¿
	AddCatTable( 4, 17 )	--×ªÖ°Îª±©·¢»§
	AddCatTable( 4, 18 )	--×ªÖ°Îª¹¤³ÌÊ¦
end

--TestConvertProfession()

--²âÊÔ´ò°ü
--SetWoodResource( 1, 3989, 10, 3999 )
--SetMineResource( 1, 1, 1, 2 )

--´¬Ö»Éý¼¶Êý¾Ý²âÊÔ
--InitBoatLevel()
--AddBoatLevel( 1, 10, 0)
--AddBoatLevel( 2, 10, 0)
--AddBoatLevel( 3, 10, 0)
--AddBoatLevel( 4, 10, 0)
--AddBoatLevel( 5, 10, 0)
--AddBoatLevel( 6, 10, 0)
--AddBoatLevel( 7, 10, 0)

-- My Stuff


