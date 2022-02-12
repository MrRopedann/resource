--------------------------------------------------------------------------
--									--
--									--
--NPCScript04.lua Created by Robin 2006.1.21.	--
--									--
--									--
--------------------------------------------------------------------------
print( "loading NPCScript04.lua" )

jp= JumpPage
amp=AutoMissionPage
ct=CloseTalk
am=AddMission
MissionCheck = HasFlag
mc=MissionCheck


------------------------------------------------------------
-- ´º·çÕò Ìú½³¡¤ÎäöÎ
------------------------------------------------------------

function b_talk1()


	Talk( 1, "Wu Xin: \"Emerald Blade on my left, Galiant Sword on my right, Dragon Crown on my head¡­Nothing can stop me!\"" )
	Text( 1, "Trade", BuyPage )
	Text( 1, "Repair", OpenRepair)
	Text( 1, "Regarding Forging", JumpPage, 2)
	Text( 1, "Regarding Combining", JumpPage, 3)

	Talk( 2, "Wu Xin: Forging? Only the blacksmith of Shaitan City knows the secret." )

	Talk( 3, "Wu Xin: You wish to combine something? From what I understand, you need a combination scroll and it will list the required items. Collect the items needed and talk to Grocer - Amos in Shaitan City. He is the only person who knows how to combine." )
	
	Talk( 4, "Blacksmith - Wu Xin: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 4 )
	Start( GetMultiTrigger(), 2 )


	InitTrade()
	Weapon(	0023	)
	Weapon(	1399	)
	Weapon(	0021	)
	Weapon(	1378	)
	Weapon(	1387	)
	Weapon(	0084	)
	Weapon(	1426	)
	Weapon(	1461	)
	Weapon(	0108	)
	Weapon(	4302	)
	Weapon(	1438	)
	Weapon(	1441	)
	Weapon(	1473	)
	Weapon(	1476	)
	Weapon(	0045	)
	Weapon(	1414	)


	AddNpcMission ( 393 )
        AddNpcMission ( 567 )
end


------------------------------------------------------------
-- ´º·çÕò ¿ÍÕ»ÀÏ°å¡¤ÁúÅ®£¨Âô»Ø¸´Æ·)
------------------------------------------------------------

function b_talk2()


	Talk( 1, "Long Er: \"Welcome! We have all type of crusine for you to choose from. Anything to your liking?\"")
	Text( 1, "Trade", BuyPage )
	
	Talk( 2, "Long Er: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )


   	InitTrade()
	Other(	1078	)
	Other(	1079	)
	Other(	1080	)
	Other(	1082	)  
	Other(	1083	)

	AddNpcMission ( 394 )
	AddNpcMission ( 536 )
	AddNpcMission ( 537 )
	AddNpcMission ( 538 )
        AddNpcMission ( 569 )

end

------------------------------------------------------------
-- ´º·çÕò ÔÓ»õÉÌÈË¡¤Â³ÄÈ¶ù(Âô·É»úÆ±)
------------------------------------------------------------

function b_talk3()


	Talk( 1, "Luna: \"Hmm¡­Someone seems be have the same name as me¡­.I might sue that person for copyrights infringement!\"" )
	Text( 1, "Trade", BuyPage )
	Talk( 2, "Luna: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )



	InitTrade()
	Other(	4602	)

	AddNpcMission ( 395 )
	AddNpcMission ( 517 )
	AddNpcMission ( 519 )
	AddNpcMission ( 525 )
	AddNpcMission ( 526 )
	--AddNpcMission ( 535 )
        AddNpcMission ( 564 )
end

------------------------------------------------------------
-- ´º·çÕò Ã³Ò×ÉÌÈË¡¤ÓÍÀî£¨º½º£Ã³Ò×Æ·
------------------------------------------------------------

function b_talk4()


	Talk( 1, "Yuri: \"Have you heard of Fountain of Life before?Devil Beast? What! You know nothing? How about Mahjong? Oh man¡­What sort of adventurer are you?\"" )
	--Text( 1, "Trade", BuyPage )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 13 )
	TriggerAction( 1, TradeBerthList, 13 )
	TriggerFailure( 1, JumpPage, 2 )
	--Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 )
	--Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)
	
	Talk( 2, "Yuri: Sorry! Your ship is not docked in Spring Harbor. Unable to trade." )
	
	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)
	

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")
	Talk( 8, "Yuri: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 8 )
	Start( GetMultiTrigger(), 2 )


	InitGoods()
	SaleGoodsData(	0	,	4573	,	900	,	279	,	62	)
	SaleGoodsData(	0	,	4574	,	800	,	342	,	76	)
	SaleGoodsData(	1	,	4575	,	700	,	391	,	87	)
	SaleGoodsData(	1	,	4576	,	480	,	432	,	96	)
	SaleGoodsData(	2	,	4577	,	300	,	495	,	110	)
	SaleGoodsData(	2	,	4578	,	240	,	522	,	116	)
	SaleGoodsData(	3	,	4579	,	60	,	589	,	131	)
	SaleGoodsData(	3	,	4580	,	40	,	648	,	144	)

	BuyGoodsData(0,	4581	,	-1	,	542	,	121	)
	BuyGoodsData(0,	4583	,	-1	,	724	,	161	)
	BuyGoodsData(0,	4585	,	-1	,	846	,	188	)
	BuyGoodsData(0,	4587	,	-1	,	846	,	564	)
	BuyGoodsData(0,	4593	,	-1	,	1000	,	223	)
	BuyGoodsData(0,	4595	,	-1	,	938	,	625	)
	BuyGoodsData(0,	4597	,	-1	,	881	,	195	)
	BuyGoodsData(0,	4598	,	-1	,	878	,	195	)
	BuyGoodsData(0,	4600	,	-1	,	866	,	577	)
	BuyGoodsData(0,	4552	,	-1	,	642	,	143	)
	BuyGoodsData(0,	4553	,	-1	,	789	,	175	)
	BuyGoodsData(0,	4554	,	-1	,	934	,	207	)
	BuyGoodsData(0,	4556	,	-1	,	870	,	193	)
	BuyGoodsData(0,	4557	,	-1	,	970	,	215	)
	BuyGoodsData(0,	4560	,	-1	,	1056	,	235	)
	BuyGoodsData(0,	4563	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4566	,	-1	,	785	,	175	)
	BuyGoodsData(0,	4569	,	-1	,	1014	,	225	)
	BuyGoodsData(0,	4572	,	-1	,	924	,	205	)
	BuyGoodsData(0,	4547	,	-1	,	100	,	0	)
	BuyGoodsData(0,	4549	,	-1	,	500	,	0	)
	BuyGoodsData(0,	4548	,	-1	,	300	,	0	)
	BuyGoodsData(0,	4551	,	-1	,	20	,	0	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()

	AddNpcMission ( 396 )
	AddNpcMission ( 530 )
	AddNpcMission ( 545 )
	AddNpcMission ( 546 )
	AddNpcMission ( 547 )
        AddNpcMission ( 572 )

end

------------------------------------------------------------
-- ´º·çÕò ´«ËÍÊ¹¡¤´ºÀò
------------------------------------------------------------

function b_talk5()
	--È¡Ïû´«ËÍ·µ»ØÑ¡Ôñ´«ËÍµØµãµÄ¶Ô»°ÄÚÈÝºÍÒ³Ãæ±àºÅ
	local ReSelectTalk = "I need to reconsider¡­"
	local ReSelectPage = 1

	--È¡Ïû´«ËÍºÍÍË³ö´«ËÍµÄ¶Ô»°ºÍÒ³Ãæ±àºÅ
	local CancelSelectTalk = "Forget it¡­I will stay here"
	local CancelSelectPage = 7

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName5 = "darkblue"

	--°×ÒøÖ®³Ç×ø±ê
	local GoTo01X = 2231
	local GoTo01Y = 2788
	local GoTo01M = CurMapName1

	--É³á°Ö®³Ç×ø±ê
	local GoTo02X = 890
	local GoTo02Y = 3575
	local GoTo02M = CurMapName2

	--±ùÀÇ±¤×ø±ê
	local GoTo04X = 1318
	local GoTo04Y = 510
	local GoTo04M = CurMapName5

	Talk( 1, "Chun Li: \"I am proud that I did not leave anyone in the sky \"" )
	Text( 1, "Go to Argent City!", JumpPage, 2 )
	Text( 1, "Go to Shaitan City!", JumpPage, 3 )
	Text( 1, "Go to Icicle City!", JumpPage, 4 )
	Text( 1, "Record Spawn point", JumpPage, 5 )
	
	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 2, JumpPage, 6 )
	Talk( 2, "Teleports to Argent City? No problem! Please pay 500G. Free for players Lv 10 and below!" )
	Text( 2, "Teleport",MultiTrigger, GetMultiTrigger(), 2 ) 
	Text( 2, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2,  GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 6 )
	Talk( 3, "I just love Shaitan City! Please pay 500G! Players Lv 10 and below free of charge!" )
	Text( 3, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 3, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 2, JumpPage, 6 )
	Talk( 4, "Teleport to Icicle City? No problem! Please pay 500G! Players Lv 10 and below free!" )
	Text( 4, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 4, CancelSelectTalk, JumpPage , CancelSelectPage )

	Talk( 5, "Chun Li: Want to record in Spring Town? Is that correct?" )
	Text( 5, "Yes. Please record.", SetSpawnPos, "Spring Town" )
	Text( 5, "No, thank you",CloseTalk )

	Talk( 6, "Sorry! You do not have enough gold to teleport." )

	Talk( 7, "Remember to look for me if you need teleportation services", CloseTalk )
	Talk( 8, "Chun Li: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 8 )
	Start( GetMultiTrigger(), 2 )

	AddNpcMission ( 397 )
	 AddNpcMission ( 559 )
	MisListPage(8)

	

end

------------------------------------------------------------
-- ´º·çÕò ËãÃüÏÈÉú¡¤ËãÆÆÌì
------------------------------------------------------------

function b_talk6()


	Talk( 1, "Hocus Pocus: \"Hello there! I can see that you are blessed by the deities and fortune is smiling upon you. Since this is your lucky day, I will sell you a Pirate Manual for 500G. How is it?\"" )
	Text( 1, "I want 1 Career Lot", JumpPage, 2 )
	Text( 1, "I want 1 Fortune Lot", JumpPage, 3 )
	Text( 1, "Bargain of Death", JumpPage, 6 )

	Talk( 6, "Hocus Pocus: Darkness is the mask of Death¡­ What do you want to redeem?")
	Text( 6, "Silhouette of Death",JumpPage,7)
	Text( 6, "Curse series", JumpPage,8)
	Text( 6, "Soul Series", JumpPage,9)


	--InitTrigger() --¶Ò»»ËÀÉñµÄÒÅÈÝ
	--TriggerCondition( 1, HasItem, 2846, 1 )
	--TriggerCondition( 1, HasItem, 2847, 1 )
	--TriggerCondition( 1, HasItem, 2848, 1 )
	--TriggerCondition( 1, HasItem, 2849, 1 )
	--TriggerCondition( 1, HasItem, 2850, 1 )
	--TriggerCondition( 1, HasItem, 2851, 1 )
	--TriggerCondition( 1, HasItem, 2852, 1 )
	--TriggerCondition( 1, HasItem, 2853, 1 )

       -- TriggerAction( 1, TakeItem,  2846, 1 )
	--TriggerAction( 1, TakeItem,  2847, 1 )
	--TriggerAction( 1, TakeItem,  2848, 1 )
	--TriggerAction( 1, TakeItem,  2849, 1 )
	--TriggerAction( 1, TakeItem,  2850, 1 )
	--TriggerAction( 1, TakeItem,  2851, 1 )
	--TriggerAction( 1, TakeItem,  2852, 1 )
	--TriggerAction( 1, TakeItem,  2853, 1 )
	--TriggerAction( 1, GiveItem,2934, 1,4 )
	--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(7, "Hocus Pocus: 1 Melancholy of Phantom Baron, 1 Melancholy of Demon Flame, 1 Melancholy of Evil Beast, 1 Melancholy of Tyran, 1 Melancholy of Phoenix, 1 Melancholy of Despair, 1 Melancholy of Drakan and 1 Melancholy of Tidal= 1 Silhouette of Death.")
	Text( 7, "Confirm to redeem",GetChaName_7, 1) 

	Talk( 8, "Hocus Pocus: A kind child will not go around cursing others¡­")
	Text( 8, "Curse of Hardin",JumpPage,11)
	Text( 8, "Curse of Darkness", JumpPage,12)
	Text( 8, "Curse of Abaddon", JumpPage,13)
	Text( 8, "Curse of Abyss", JumpPage,14)
	Text( 8, "Curse of Styx", JumpPage,15)
	Text( 8, "Curse of Asura", JumpPage,16)



	--InitTrigger() --¶Ò»»¹þµÏË¹µÄ×çÖä
	
	--TriggerCondition( 1, HasItem, 2854, 1 )
	--TriggerCondition( 1, HasItem, 2855, 1 )
	--TriggerCondition( 1, HasItem, 2856, 1 )
	--TriggerCondition( 1, HasItem, 2857, 1 )
	--TriggerCondition( 1, HasItem, 2927, 1 )
      
	--TriggerAction( 1, TakeItem,  2854, 1 )
	--TriggerAction( 1, TakeItem,  2855, 1 )
	--TriggerAction( 1, TakeItem,  2856, 1 )
	--TriggerAction( 1, TakeItem,  2857, 1 )
	--TriggerAction( 1, TakeItem,  2927, 1 )
	--TriggerAction( 1, GiveItem,2935, 1,4 )
	--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(11, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Hardin= 1 Curse of Hardin")
	Text( 11, "Confirm to redeem",GetChaName_8, 1) 


--InitTrigger() --¶Ò»»ºÚ°µµÄ×çÖä	
--TriggerCondition( 1, HasItem, 2854, 1 )
--TriggerCondition( 1, HasItem, 2855, 1 )
--TriggerCondition( 1, HasItem, 2856, 1 )
--TriggerCondition( 1, HasItem, 2857, 1 )
--TriggerCondition( 1, HasItem, 2928, 1 )
--
--TriggerAction( 1, TakeItem,  2854, 1 )
--TriggerAction( 1, TakeItem,  2855, 1 )
--TriggerAction( 1, TakeItem,  2856, 1 )
--TriggerAction( 1, TakeItem,  2857, 1 )
--TriggerAction( 1, TakeItem,  2928, 1 )
--TriggerAction( 1, GiveItem,2936, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(12, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Darkness= 1 Curse of Darkness")
	Text( 12, "Confirm to redeem",GetChaName_9, 1) 


--InitTrigger() --¶Ò»»µØÓüµÄ×çÖä

--TriggerCondition( 1, HasItem, 2854, 1 )
--TriggerCondition( 1, HasItem, 2855, 1 )
--TriggerCondition( 1, HasItem, 2856, 1 )
--TriggerCondition( 1, HasItem, 2857, 1 )
--TriggerCondition( 1, HasItem, 2929, 1 )

--TriggerAction( 1, TakeItem,  2854, 1 )
--TriggerAction( 1, TakeItem,  2855, 1 )
--TriggerAction( 1, TakeItem,  2856, 1 )
--TriggerAction( 1, TakeItem,  2857, 1 )
--TriggerAction( 1, TakeItem,  2929, 1 )
--TriggerAction( 1, GiveItem,2937, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(13, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Abaddon = 1 Curse of Abaddon")
	Text( 13, "Confirm to redeem",GetChaName_10, 1) 



--InitTrigger() --¶Ò»»ÓÄÚ¤µÄ×çÖä
--TriggerCondition( 1, HasItem, 2854, 1 )
--TriggerCondition( 1, HasItem, 2855, 1 )
--TriggerCondition( 1, HasItem, 2856, 1 )
--TriggerCondition( 1, HasItem, 2857, 1 )
--TriggerCondition( 1, HasItem, 2931, 1 )

--TriggerAction( 1, TakeItem,  2854, 1 )
--TriggerAction( 1, TakeItem,  2855, 1 )
--TriggerAction( 1, TakeItem,  2856, 1 )
--TriggerAction( 1, TakeItem,  2857, 1 )
--TriggerAction( 1, TakeItem,  2931, 1 )
--TriggerAction( 1, GiveItem,2939, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(14, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Abyss= 1 Curse of Abyss")
	Text( 14, "Confirm to redeem",GetChaName_11, 1) 

--	InitTrigger() --¶Ò»»Ú¤ºÓµÄ×çÖä
--TriggerCondition( 1, HasItem, 2854, 1 )
--TriggerCondition( 1, HasItem, 2855, 1 )
--TriggerCondition( 1, HasItem, 2856, 1 )
--TriggerCondition( 1, HasItem, 2857, 1 )
--TriggerCondition( 1, HasItem, 2932, 1 )
--
--TriggerAction( 1, TakeItem,  2854, 1 )
--TriggerAction( 1, TakeItem,  2855, 1 )
--TriggerAction( 1, TakeItem,  2856, 1 )
--TriggerAction( 1, TakeItem,  2857, 1 )
--TriggerAction( 1, TakeItem,  2932, 1 )
--TriggerAction( 1, GiveItem,2940, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(15, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Styx= 1 Curse of Styx")
	Text( 15, "Confirm to redeem",GetChaName_12, 1) 



--InitTrigger() --¶Ò»»ÐÞÂÞµÄ×çÖä
--TriggerCondition( 1, HasItem, 2854, 1 )
--TriggerCondition( 1, HasItem, 2855, 1 )
--TriggerCondition( 1, HasItem, 2856, 1 )
--TriggerCondition( 1, HasItem, 2857, 1 )
--TriggerCondition( 1, HasItem, 2930, 1 )
--
--TriggerAction( 1, TakeItem,  2854, 1 )
--TriggerAction( 1, TakeItem,  2855, 1 )
--TriggerAction( 1, TakeItem,  2856, 1 )
--TriggerAction( 1, TakeItem,  2857, 1 )
--TriggerAction( 1, TakeItem,  2930, 1 )
--TriggerAction( 1, GiveItem,2938, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(16, "Hocus Pocus: 1 Fur of Death, 1 Tooth of Death, 1 Eye of Death, 1 Heart of Death and 1 Sealed Soul of Asura= 1 Curse of Asura")
	Text( 16, "Confirm to redeem",GetChaName_13, 1) 


	Talk( 9, "Hocus Pocus: I heard human souls weigh 0.1g. I wonder how heavy does the soul of Death weighs.")
	Text( 9, "Soul of Hardin",JumpPage,17)
	Text( 9, "Soul of Darkness", JumpPage,18)
	Text( 9, "Soul of Abaddon", JumpPage,19)
	Text( 9, "Soul of Abyss", JumpPage,20)
	Text( 9, "Soul of Styx", JumpPage,21)
	Text( 9, "Soul of Asura", JumpPage,22)
	Text( 9, "Soul of Black Dragon", JumpPage,23)


--InitTrigger() --¶Ò»»¹þµÏË¹µÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2935, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, TakeItem,  2935, 1 )
--TriggerAction( 1, GiveItem,2562, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(17, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Hardin= 1 Soul of Hardin")
	Text( 17, "Confirm to redeem",GetChaName_14, 1) 
--
--
--InitTrigger() --¶Ò»»ºÚ°µµÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2936, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, TakeItem,  2936, 1 )
--TriggerAction( 1, GiveItem,2563, 1,4 )
	--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(18, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Darkness= 1 Soul of Darkness")
	Text( 18, "Confirm to redeem",GetChaName_15, 1) 



--InitTrigger() --¶Ò»»µØÓüµÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2937, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, TakeItem,  2937, 1 )
--TriggerAction( 1, GiveItem,2564, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(19, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Abaddon= 1 Soul of Abaddon")
	Text( 19, "Confirm to redeem",GetChaName_16, 1) 
--
--
--
--InitTrigger() --¶Ò»»ÓÄÚ¤µÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2939, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--	TriggerAction( 1, TakeItem,  2939, 1 )
--TriggerAction( 1, GiveItem,2566, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(20, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Abyss= 1 Soul of Abyss")
	Text( 20, "Confirm to redeem",GetChaName_17, 1) 
--
--
--InitTrigger() --¶Ò»»Ú¤ºÓµÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2940, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, TakeItem,  2940, 1 )
--TriggerAction( 1, GiveItem,2567, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(21, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Styx = 1 Soul of Styx")
	Text( 21, "Confirm to redeem",GetChaName_18, 1) 
--
--

--InitTrigger() --¶Ò»»ÐÞÂÞµÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2934, 1 )
--TriggerCondition( 1, HasItem, 2938, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, TakeItem,  2938, 1 )
--TriggerAction( 1, GiveItem,2565, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(22, "Hocus Pocus: 1 Silhouette of Death + 1 Curse of Asura= 1 Soul of Asura")
	Text( 22, "Confirm to redeem",GetChaName_19, 1) 
--
--InitTrigger() --¶Ò»»ºÚÁúµÄ»êÆÇ
--TriggerCondition( 1, HasItem, 2562, 1 )
--TriggerCondition( 1, HasItem, 2563, 1 )
--TriggerCondition( 1, HasItem, 2564, 1 )
--TriggerCondition( 1, HasItem, 2565, 1 )
--TriggerCondition( 1, HasItem, 2566, 1 )
--TriggerCondition( 1, HasItem, 2567, 1 )
--TriggerCondition( 1, HasItem, 2933, 1 )
--TriggerCondition( 1, HasItem, 2934, 1 )
--
--TriggerAction( 1, TakeItem,  2562, 1 )
--TriggerAction( 1, TakeItem,  2563, 1 )
--TriggerAction( 1, TakeItem,  2564, 1 )
--TriggerAction( 1, TakeItem,  2565, 1 )
--TriggerAction( 1, TakeItem,  2566, 1 )
--TriggerAction( 1, TakeItem,  2567, 1 )
--TriggerAction( 1, TakeItem,  2933, 1 )
--TriggerAction( 1, TakeItem,  2934, 1 )
--TriggerAction( 1, GiveItem,2404, 1,4 )
--TriggerFailure( 1, JumpPage, 10 ) 
	Talk(23, "Hocus Pocus: 1 Soul of Darkness, 1 Soul of Asura, 1 Soul of Hardin, 1 Soul of Abaddon, 1 Soul of Abyss, 1 Soul of Styx, 1 Silhouette of Death and 1 Titter of Black Dragon= 1 Soul of Black Dragon")
	Text( 23, "Confirm to redeem",GetChaName_20, 1) 

	Talk( 10, "You do not have the items required for exchanging, or your inventory might be binded or you do not have sufficient inventory slots." )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeMoney, 5000)
	TriggerAction( 1, GiveItem, 3086,1, 4 )
	TriggerFailure( 1, JumpPage, 5 )
	Talk( 2, "Career Lot? 5000G please!" )
	Text( 2, "Ok, I give you 5000G",MultiTrigger, GetMultiTrigger(), 1 ) 

	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeMoney, 5000)
	TriggerAction( 1, GiveItem, 3087,1, 4 )
	TriggerFailure( 1, JumpPage, 5 )
	Talk( 3, "Buying a Fortune Lot? 5000G!" )
	Text( 3, "Ok, I give you 5000G",MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 4, "Hocus Pocus: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )

	Talk( 5, "You do not have enough gold, inventory space or your inventory has been binded" )

	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 4 )
	Start( GetMultiTrigger(), 4 )
	
	AddNpcMission ( 520 )
        AddNpcMission ( 900 )
---------------------ÐÂÀúÊ·ÈÎÎñ
	AddNpcMission(	5065)
	AddNpcMission(	595	)
	AddNpcMission(	599	)
	AddNpcMission(	5000	)
	AddNpcMission(	5001	)
	AddNpcMission(	5002	)
	AddNpcMission(	5003 )
	AddNpcMission(	5066)

end
------------------------------------------------------------
-- ´º·çÕò ¾ÆµêÀÏ°å¡¤ÅáµÙ
------------------------------------------------------------

function b_talk7()


	Talk( 1, "Sang Di: \"Hey guys! Come to receive the guest!\"" )
   	--Text( 1, "Trade", BuyPage )
	
	Talk( 2, "Sang Di: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )

	InitTrade()
	Other(	1084	)
	Other(	1085	)
	Other(	1087	)
	Other(	1088	)
	Other(	1089	)
	Other(	1090	) 


	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )


	AddNpcMission ( 392 )
	AddNpcMission ( 514 )
	AddNpcMission ( 516 )
	AddNpcMission ( 527 )
	AddNpcMission ( 528 )
	AddNpcMission ( 529 )
	AddNpcMission ( 548 )
	AddNpcMission ( 550 )
	AddNpcMission ( 551 )
       AddNpcMission ( 558 )
       AddNpcMission ( 571 )
------------ÐÂÔöÀúÊ·ÈÎÎñ
	AddNpcMission(	592	)
	AddNpcMission(	5004	)
	AddNpcMission(	5005	)
	AddNpcMission(	5006	)
	AddNpcMission(	5007	)
	AddNpcMission(	5008	)
	AddNpcMission(	5043	)
	AddNpcMission(	5054	)
	AddNpcMission(	5055	)
end

------------------------------------------------------------
-- ´º·çÕò ¸Û¿ÚÖ¸»Ó¡¤ËªÆæ
------------------------------------------------------------

function b_talk8()


	Talk( 1, "Shuang: \"Sailing? Salvage? Repair? Refuel?\"" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 13 )
	TriggerAction( 1, LuanchBerthList, 13, 3426, 2575, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 13 )
	TriggerAction( 2, RepairBerthList, 13 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 13 )
	TriggerAction( 2, SupplyBerthList, 13 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 13 )
	TriggerAction( 1, SalvageBerthList, 13 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Shuang: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )


	AddNpcMission ( 398 )
	AddNpcMission ( 565 )


end

------------------------------------------------------------
-- ´º·çÕò ÒøÐÐ×Ü¹Ü¡¤ÍõÄ«
------------------------------------------------------------

function b_talk9()


	Talk( 1, "Wang Mo: \"You¡­look familiar? Do you have anything that requires storage?\"" )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Vault (200G Fee)", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2, "Sorry! You do not have enough gold to pay the fee to access the bank." )
	Talk( 3, "Wang Mo: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 3 )
	Start( GetMultiTrigger(), 2 )



	AddNpcMission ( 399 )
	AddNpcMission ( 510 )
	AddNpcMission ( 511 )
	AddNpcMission ( 512 )
	AddNpcMission ( 513 )
	AddNpcMission ( 543 )
	AddNpcMission ( 544 )
        AddNpcMission ( 570 )
 
end

------------------------------------------------------------
-- ´º·çÕò ÎÀ±ø¡¤ÕÔÇ®Ëï
------------------------------------------------------------

function b_talk10()


	Talk( 1, "Zhao: \"So hungry¡­What time is my dinner arriving¡­?\"" )
	Talk( 2, "Zhao: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

end

------------------------------------------------------------
-- ´º·çÕò ÎÀ±ø¡¤ÖÜÎâÖ£
------------------------------------------------------------

function b_talk11()


	Talk( 1, "Zhou: \"1 plus 1equals 2? Not 2? 2? Actually I am only talking to myself. You don't have to be so worked up. Equals 2? Not equals 2¡­? \"" )
	Talk( 2, "Zhou: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

	AddNpcMission ( 531 )
	AddNpcMission ( 532 )
	AddNpcMission ( 533 )
	AddNpcMission ( 534 )

end

------------------------------------------------------------
-- ´º·çÕò ÇàÄêÄÐ×Ó¡¤Á÷ÔÆ
------------------------------------------------------------

function b_talk12()


	Talk( 1, "Cloud: \"Have you seen Misty? She is my girlfriend.\"" )
	Talk( 2, "Cloud: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )
         
	 AddNpcMission ( 533 )
	 AddNpcMission ( 563 )
end

------------------------------------------------------------
-- ´º·çÕò ÇàÄêÅ®×Ó¡¤Ë®Îí
------------------------------------------------------------

function b_talk13()


	Talk( 1, "Misty: \"Have you seen Cloud? He is my boyfriend\"" )
	Talk( 2, "Misty: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

end

------------------------------------------------------------
-- ´º·çÕò ÖÐÄêÄÐ×Ó¡¤±È¸Ç
------------------------------------------------------------

function b_talk14()


	Talk( 1, "Bill: \"Trouble? No trouble? I am earning millions each second! Do not disturb me!\"" )
	Talk( 2, "Bill: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

        AddNpcMission ( 568 )
		--Ñâÿùåííûé îãîí?
	AddNpcMission	(6262)
	AddNpcMission	(6263)
end

------------------------------------------------------------
-- ´º·çÕò ÖÐÄêÅ®×Ó¡¤ÍõÈØ
------------------------------------------------------------

function b_talk15()


	Talk( 1, "Wang Rong: \"I does not know any martial art. Don't bully me¡­\"" )
	Talk( 2, "Wang Rong: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

end

------------------------------------------------------------
-- ´º·çÕò ¶«·½º£µÁ¡¤Áå×ôÌïÉ½
------------------------------------------------------------

function b_talk16()


	Talk( 1, "Yakamoto: \"Seriously¡­can't you see that we are robbers? \"" )
	Talk( 2, "Yakamoto: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )

end


------------------------------------------------------------
-- ´º·çÕò ³±Á÷Àí·¢Ê¦
------------------------------------------------------------

function b_talk17()


	Talk( 1, "Hairstylist: \"Braid¡­¡­\"" )
        Text( 1, "I want to change my hairstyle", JumpPage, 2)
	InitTrigger()
	TriggerCondition( 1, HasItem, 1807, 1 )
	TriggerAction( 1, OpenHair )
	TriggerFailure( 1, JumpPage, 3 )
	Talk( 2, "Hairstylist: Want a change of hairstyle? Let me have a look at your Hairstyling Coupon.")
	Text( 2, "Yes I'm sure", MultiTrigger, GetMultiTrigger(), 1)
	Text( 2, "Forget it, let me think it over.", CloseTalk )

	Talk( 3, "Hairstylist: You don't seem to possess Hairstyling Voucher. I cannot style your hair.")
	Talk( 4, "Hairstylist: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 4 )
	Start( GetMultiTrigger(), 2 )

	AddNpcMission	(6003)
	AddNpcMission	(6004)
	AddNpcMission	(6005)
	AddNpcMission	(6006)
	AddNpcMission	(6007)
	AddNpcMission	(6008)
	AddNpcMission	(6009)
end

------------------------------------------------------------
-- ´º·çÕò ½©Ê¬¡¤ÅáÓÀ¾ü
------------------------------------------------------------

function b_talk18()


	Talk( 1, "Hami: \"¡­¡­\"" )
	Talk( 2, "Hami: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 2 )
	Start( GetMultiTrigger(), 2 )
	
	AddNpcMission ( 515 )
	AddNpcMission ( 518 )
	AddNpcMission ( 524 )
end

------------------------------------------------------------
--ºÚÁú³²Ñ¨ Ò»²ãto¶þ²ã
------------------------------------------------------------

function b_talk21()


	--È¡Ïû´«ËÍ·µ»ØÑ¡Ôñ´«ËÍµØµãµÄ¶Ô»°ÄÚÈÝºÍÒ³Ãæ±àºÅ
	local ReSelectTalk = "I need to reconsider¡­"
	local ReSelectPage = 1

	--È¡Ïû´«ËÍºÍÍË³ö´«ËÍµÄ¶Ô»°ºÍÒ³Ãæ±àºÅ
	local CancelSelectTalk = "Forget it¡­I will stay here"
	local CancelSelectPage = 5

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "eastgoaf"


	--ºÚÁú³²Ñ¨¶þ²ã×ø±ê
	local GoTo01X = 767
	local GoTo01Y = 602
	local GoTo01M = CurMapName

	Talk( 1, "Guardian Statue: \"I am the Goddess that sealed Death within.\"" )
	Text( 1, "Go to Black Dragon Lair 2!", JumpPage, 2 )

	InitTrigger()
	TriggerCondition( 1, HasItem, 179,1 )
	TriggerCondition( 1, HasItem, 3084,1 )
	TriggerCondition( 1, HasItem, 3085,1 )
	TriggerAction( 1, TakeItem, 179,1 )
	TriggerAction( 1, TakeItem, 3084,1 )
	TriggerAction( 1, TakeItem, 3085,1 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "Teleport to Black Dragon Lair 2 requires 1<ySigil of Anubis>, 1 <yMask of Mummy King> and 1 <yTimeless Machine>!" )
	Text( 2, "Teleport",MultiTrigger, GetMultiTrigger(), 2 ) 
	Text( 2, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	Talk( 3, "Guardian Statue: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 3 )
	Start( GetMultiTrigger(), 3 )

	Talk( 4, "Sorry, you have not collect all 3 items!" )

	Talk( 5, "Remember to look for me again if you need to teleport", CloseTalk )
end

------------------------------------------------------------
--ºÚÁú³²Ñ¨ ¶þ²ãtoÒ»²ã
------------------------------------------------------------

function b_talk22()


	--È¡Ïû´«ËÍ·µ»ØÑ¡Ôñ´«ËÍµØµãµÄ¶Ô»°ÄÚÈÝºÍÒ³Ãæ±àºÅ
	local ReSelectTalk = "I need to reconsider¡­"
	local ReSelectPage = 1

	--È¡Ïû´«ËÍºÍÍË³ö´«ËÍµÄ¶Ô»°ºÍÒ³Ãæ±àºÅ
	local CancelSelectTalk = "Forget it¡­I will stay here"
	local CancelSelectPage = 4

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "eastgoaf"


	--ºÚÁú³²Ñ¨Èý²ã×ø±ê
	local GoTo01X = 847
	local GoTo01Y = 247
	local GoTo01M = CurMapName

	Talk( 1, "Guardian Statue: \"I am the Goddess that sealed Death within.\"" )
	Text( 1, "Go to Black Dragon Lair 1!", JumpPage, 2 )

	InitTrigger()
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	Talk( 2, "Do you wish to go out?" )
	Text( 2, "Teleport",MultiTrigger, GetMultiTrigger(), 2 ) 
	Text( 2, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	Talk( 3, "Guardian Statue: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )



	InitTrigger()
	TriggerCondition( 1, HasRecord, 330 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, NoRecord, 330 )
	TriggerAction( 2, JumpPage, 3 )
	Start( GetMultiTrigger(), 3 )

	Talk( 4, "Remember to look for me again if you need to teleport", CloseTalk )



end

------------------------------------------------------------
--ºÚÁú³²Ñ¨ ¶þ²ãtoÈý²ã
------------------------------------------------------------

function b_talk23()

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "eastgoaf"


	--ºÚÁú³²Ñ¨Èý²ã×ø±ê
	local GoTo01X = 772
	local GoTo01Y = 722
	local GoTo01M = CurMapName


	InitTrigger()
	TriggerCondition( 1, HasItem, 182,1 )
	--TriggerAction( 1, TakeItem, 1091,1 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 1, "Guardian Statue: \"I am the Goddess that sealed Death within.\"" )
	Text( 1, "Go to Black Dragon Lair 3!", MultiTrigger, GetMultiTrigger(), 1 )

	--Talk( 3, "Guardian Statue: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )
	--InitTrigger()
--	TriggerCondition( 1, HasRecord, 330 )
--	TriggerAction( 1, JumpPage, 1 )
--	TriggerCondition( 2, NoRecord, 330 )
--	TriggerAction( 2, JumpPage, 3 )
--	Start( GetMultiTrigger(), 3 )

	Talk( 4, "Statue is being sealed. You need a <Dragon Key> to access it" )

--	Talk( 4, "The statue emits a energy shield to keep me away. Looks like I am not strong enough to break it yet. I must think of other ways." )


end

------------------------------------------------------------
--ºÚÁú±¦Ïä
------------------------------------------------------------

function b_talk24()

	InitFuncList()
	AddFuncList( GiveItem,	110	,	1	,	4)
	AddFuncList( GiveItem,	112	,	1	,	4)
	AddFuncList( GiveItem,	114	,	1	,	4)
	AddFuncList( GiveItem,	116	,	1	,	4)
	AddFuncList( GiveItem,	118	,	1	,	4)
	AddFuncList( GiveItem,	120	,	1	,	4)
	AddFuncList( GiveItem,	151	,	1	,	4)

	InitTrigger()
	TriggerCondition( 1, HasItem, 182, 1 )
	TriggerAction( 1, TakeItem, 182, 1 )
	TriggerAction( 1, RandFunction, GetFuncList(), GetNumFunc() )
	TriggerFailure( 1, JumpPage, 2 )
	Talk( 1, "This is a mysterious chest. It seems to be locked¡­" )
	Text( 1, "Forbidden words", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 2, "Failed to open. It seems that some sort of key is needed" )

end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  Ìú½³
------------------------------------------------------------

function l_talk01()
	Talk(1, "Jack Arrow and I have been here for almost a month but failed to find the way out. And I don't know where is my loved one now! Arrgh! I hate this hellish place!")

	AddNpcMission(894)
	AddNpcMission(487)
	AddNpcMission(504)
	AddNpcMission(508)
	AddNpcMission(509)
	AddNpcMission(573)
	AddNpcMission(581)
	AddNpcMission(582)
	AddNpcMission(583)

end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ½Ü¿ËÊ·ÅÉÂÞ
------------------------------------------------------------

function l_talk02()
	Talk(1, "Rumored that Barborosa got his monstrous power from the curse. This place is no longer safe, please be careful and these monsters aren't vegetarian.")

	AddNpcMission(895)
	AddNpcMission(896)
	AddNpcMission(482)
	AddNpcMission(485)
	AddNpcMission(486)
	AddNpcMission(574)
	AddNpcMission(575)
	AddNpcMission(584)
	AddNpcMission(585)
	AddNpcMission(586)
end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÅµÁé¶Ù½«¾ü
------------------------------------------------------------

function l_talk03()
	Talk(1, "Damn Jack! If he did not steal our war galley, I would not be stuck in this hellhole")

	AddNpcMission(897)
	AddNpcMission(898)
	AddNpcMission(899)
	AddNpcMission(476)
	AddNpcMission(479)
	AddNpcMission(480)
	AddNpcMission(481)
	AddNpcMission(576)
	AddNpcMission(577)
	AddNpcMission(578)
	AddNpcMission(589)
	AddNpcMission(590)

end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÒÁÀöÉ¯°×
------------------------------------------------------------

function l_talk04()
	Talk(1, "Where am I? How did I ended up here? Mark! Sob¡­Sob¡­")
	Text( 1, "Trade", BuyPage )

	InitTrade()
	Other(	3141	)
	Other(	4602	)
	Other(	4603	)
	Other(	4604	)

	AddNpcMission(505)
	AddNpcMission(506)
	AddNpcMission(507)
	AddNpcMission(579)
	AddNpcMission(580)
	AddNpcMission(587)
	AddNpcMission(588)
	AddNpcMission(591)

	---------------°×Ñò
	AddNpcMission	(5573)
	AddNpcMission	(5574)
end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ²Ø±¦º£Íå±±º£¸ÛÖ¸»Ó¡¤ÅíÄá
------------------------------------------------------------
function mmm_talk06()

	Talk( 1, "Penny: Dock? Set sail? Salvage? Repair? Refuel?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 650,999, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Shuang: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )




end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ²Ø±¦º£ÍåÄÏº£¸ÛÖ¸»Ó¡¤¿­Ææ
------------------------------------------------------------
function mmm_talk05()

	Talk( 1, "Catchy: Dock? Set sail? Salvage? Repair? Refuel?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 625,925, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Catchy: ..................^$&#&^%.................." )




end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÷¼÷Ãº£¸ÛÖ¸»Ó
------------------------------------------------------------
function mmm_talk07()
Talk( 1, "Seaport Commander: Dock? Set sail? Salvage? Repair? Refuel?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 620,628, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Seaport Commander: ..................^$&#&^%.................." )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÉñÃØÈË³öº£ÈË
------------------------------------------------------------
function mmm_talk08()
Talk( 1, "Mysterious Sailor: Dock? Set sail? Salvage? Repair? Refuel?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 380,161, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Mysterious Sailor: ..................^$&#&^%.................." )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  º£¾ü»ùµØº£¸ÛÖ¸»Ó
------------------------------------------------------------
function mmm_talk09()
Talk( 1, "Seaport Commander: Dock? Set sail? Salvage? Repair? Refuel?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 1070,212, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Seaport Commander: ¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­" )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ´ò°üÈË¡¤´÷ÆÕ
------------------------------------------------------------
function mmm_talk10()
Talk( 1, "Zabu: Hi! I am the Freights NPC here. I can help you load the products up your ship if it is docked in this harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 12)
	TriggerAction( 1, PackBagList, 12, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 12)
	TriggerAction( 1, PackBagList, 12, RES_MINE, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Crystal", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Zabu:  Hi! You do not have any ship docked at this harbor" )

end

function t_diana()
	Talk( 1, "\207\240\232\226\229\242,\242\251 \243\226\229\240\229\237 \247\242\238 \245\238\247\229\248\252 \228\224\235\252\248\229?" )
	Text( 1, "\196\224 ", GoTo, 1582,1109, "jialebi" )
	Text( 1, "\205\229\242", JumpPage, 2 )
	Talk( 2, " \205\243, \234\224\234 \245\238\247\229\248\252 ")
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±A
------------------------------------------------------------
function mmm_talk13()
	Talk( 1, "Bewildered Researcher A: Hi, I have been lost for a long time. I got some good stuff with me, do you wish to do an exchange?" )
	Text( 1, "Redeem Secrets set item", JumpPage, 2)

	Talk( 2, "Bewildered Researcher A: These good items are also known as Tsunami set!" )
	Text( 2, "Redeem Armor of Secrets (Lance Crusader)", JumpPage, 3)
	Text( 2, "Redeem Gloves of Secrets (Lance Crusader)", JumpPage, 4)
	Text( 2, "Redeem Boots of Secrets (Lance Crusader)", JumpPage, 5)
	Text( 2, "Redeem Drakan (Lance Crusader)", JumpPage, 6)

	Talk(3,"To redeem Armor of Secrets requires 1 Guise Veilstone, 30 Rainbow Fruit, 20 Animal Skin, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2467, 1 )
	TriggerCondition( 1, HasItem, 3121, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2467, 1 )
	TriggerAction( 1, TakeItem, 3121, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0396, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 3, "Obtained Armor of Secrets", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4,"To redeem Gloves of Secrets requires 1 Avow Blotstone, 30 Rainbow Fruit, 20 Hard Shell, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2473, 1 )
	TriggerCondition( 1, HasItem, 3121, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2473, 1 )
	TriggerAction( 1, TakeItem, 3121, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0588, 1 , 4)
	TriggerFailure( 1, JumpPage, 7)
	Text( 4, "Obtained Gloves of Secrets ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"To redeem Boots of Secrets requires 1 Mirage Shadestone, 30 Rainbow Fruit, 20 Special Gas, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2479, 1 )
	TriggerCondition( 1, HasItem, 3121, 30 )
	TriggerCondition( 1, HasItem, 1657, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2479, 1 )
	TriggerAction( 1, TakeItem, 3121, 30 )
	TriggerAction( 1, TakeItem, 1657, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0748, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 5, "Obtained Boots of Secrets", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6,"To redeem Drakan requires 1 Demonic Orestone, 30 Agate Crystal, 20 Extender, 10 Magical Bone and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2463, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2463, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0114, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 6, "Obtained Drakan", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7,"Sorry, you do not have the required items to redeem")
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±B
------------------------------------------------------------


------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±C
------------------------------------------------------------
function mmm_talk15()
	Talk( 1, "Bewildered Researcher C: Hi, I have been lost for a long time. I got some good stuff with me, do you wish to do an exchange?" )
	Text( 1, "Redeem Dragon Lord set", JumpPage, 2)
	Text( 1, "Redeem Tsunami set", JumpPage, 9)

	Talk( 2, "Bewildered Researcher C: These good items are also known as Dragon Lord set!" )
	Text( 2, "Redeem Dragon Lord Costume (Ami Voyager)", JumpPage, 3)
	Text( 2, "Redeem Dragon Lord Muffs (Ami Voyager)", JumpPage, 4)
	Text( 2, "Redeem Dragon Lord Shoes (Ami Voyager)", JumpPage, 5)
	Text( 2, "Redeem Dragon Lord Cap (Ami Voyager)", JumpPage, 6)
	Text( 2, "Redeem Riven Soul (Ami Voyager)", JumpPage, 7)

	Talk(3,"To redeem Dragon Lord Costume requires 1 Beastie Finestone, 30 Rainbow Glass, 20 Animal Skin, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2472, 1 )
	TriggerCondition( 1, HasItem, 1778, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2472, 1 )
	TriggerAction( 1, TakeItem, 1778, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0413, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 3, "Obtained Dragon Lord Costume", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4,"To redeem Dragon Lord Muffs requires 1 Beastie Toothstone, 30 Rainbow Glass, 20 Hard Shell, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2477, 1 )
	TriggerCondition( 1, HasItem, 1778, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2477, 1 )
	TriggerAction( 1, TakeItem, 1778, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0602, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 4, "Obtained Dragon Lord Muffs", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"To redeem Dragon Lord Shoes requires 1 Cadavar Orestone, 30 Rainbow Glass, 20 Special Gas, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2483, 1 )
	TriggerCondition( 1, HasItem, 1778, 30 )
	TriggerCondition( 1, HasItem, 1657, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2483, 1 )
	TriggerAction( 1, TakeItem, 1778, 30 )
	TriggerAction( 1, TakeItem, 1657, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0824, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 5, "Obtained Dragon Lord Shoes ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6,"To redeem Dragon Lord Cap requires 1 Beastie Borestone, 30 Rainbow Glass, 20 Life Stones, 10 Meteorites and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2487, 1 )
	TriggerCondition( 1, HasItem, 1778, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 3391, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2487, 1 )
	TriggerAction( 1, TakeItem, 1778, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 3391, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 2223, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 6, "Obtained Dragon Lord Cap ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7,"To redeem Riven Soul requires 1 Tear Soothstone, 30 Agate Crystal, 20 Extender, 10 Magical Bone and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2466, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2466, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0151, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 7, "Obtained Riven Soul", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8,"Sorry, you do not have the required items to redeem")

	Talk( 9, "Bewildered Researcher C: These good items are also known as Tsunami set!" )
	Text( 9, "Redeem Tsunami Robe (Lance, Phyllis Voyager)", JumpPage, 10)
	Text( 9, "Redeem Tsunami Gloves (Lance, Phyllis Voyager)", JumpPage, 11)
	Text( 9, "Redeem Tsunami Shoes (Lance, Phyllis Voyager)", JumpPage, 12)
	Text( 9, "Redeem Riven Soul (Lance, Phyllis Voyager)", JumpPage, 7)

	Talk(10,"To redeem Tsunami Robe requires 1 Beastie Finestone, 30 Agate Crystal, 20 Animal Skin, 10 Earthen Element Fragment and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2472, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2472, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0411, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 10, "Obtained Tsunami Robe", MultiTrigger, GetMultiTrigger(), 1)

	Talk(11,"To redeem Tsunami Gloves requires 1 Zest Jadestone, 30 Quartz Crystals, 20 Extender, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2474, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2474, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0600, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 11, "Obtained Tsunami Gloves", MultiTrigger, GetMultiTrigger(), 1)

	Talk(12,"To redeem Tsunami Shoes requires 1 Mirage Shadestone, 30 Agate Crystal, 20 Life Stone, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2479, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2479, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0760, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 12, "Obtained Tsunami Shoes", MultiTrigger, GetMultiTrigger(), 1)
end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±D
------------------------------------------------------------
function mmm_talk26()
	Talk( 1, "Bewildered Researcher D: Hi, I have been lost for a long time. I got some good stuff with me, do you wish to do an exchange?" )
	Text( 1, "Redeem Fish Fairy set", JumpPage, 2)
	Text( 1, "Redeem Faerie set", JumpPage, 9)

	Talk( 2, "Bewildered Researcher D: These good items are also known as Fish Fairy set!" )
	Text( 2, "Redeem Fish Fairy Costume (Ami Cleric)", JumpPage, 3)
	Text( 2, "Redeem Fish Fairy Muffs (Ami Cleric)", JumpPage, 4)
	Text( 2, "Redeem Fish Fairy Shoes (Ami Cleric)", JumpPage, 5)
	Text( 2, "Redeem Fish Fairy Cap (Ami Cleric)", JumpPage, 6)
	Text( 2, "Redeem Revered Staff (Ami Cleric)", JumpPage, 7)

	Talk(3,"To redeem Fish Fairy Costume requires 1 Searing Debstone, 30 Life Stone Fragment, 20 Animal Skin, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2471, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2471, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0408, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 3, "Obtained Fish Fairy Costume", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4,"To redeem Fish Fairy Muffs requires 1 Dark Soothstone, 30 Life Stone Fragment, 20 Hard Shell, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2476, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2476, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0598, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 4, "Obtained Fish Fairy Muffs", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"To redeem Fish Fairy Shoes requires 1 Pearl Soothstone, 30 Life Stone Fragment, 20 Special Gas, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2482, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1657, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2482, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1657, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0758, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 5, "Obtained Fish Fairy Shoes", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6,"To redeem Fish Fairy Cap requires 1 Oceanic Gutstone, 30 Life Stone Fragment, 20 Life Stone, 10 Meteorite and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2486, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 3391, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2486, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 3391, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 2221, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 6, "Obtained Fish Fairy Cap", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7,"To redeem Revered Staff requires 1 Goddess Mudstone, 30 Agate Crystal, 20 Extender, 10 Magical Bone and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2461, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2461, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0110, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 7, "Obtained Revered Staff", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8,"Sorry, you do not have the required items to redeem")

	Talk( 9, "Bewildered Researcher D: These good items are also known as Faerie set!" )
	Text( 9, "Redeem Faerie Robe (Phyllis Cleric)", JumpPage, 10)
	Text( 9, "Redeem Faerie Gloves (Phyllis Cleric) ", JumpPage, 11)
	Text( 9, "Redeem Faerie Shoes (Phyllis Cleric)", JumpPage, 12)
	Text( 9, "Redeem Revered Staff (Phyllis Cleric)", JumpPage, 7)

	Talk(10,"To redeem Faerie Robe requires 1 Myth Flamestone, 30 Life Stone Fragment, 20 Life Stone, 10 Pearl and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2468, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2468, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0406, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 10, "Obtained Faerie Robe", MultiTrigger, GetMultiTrigger(), 1)

	Talk(11,"To redeem Faerie Gloves requires 1 Dark Soothstone, 30 Agate Crystal, 20 Animal Skin, 10 Splendor Cloth and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2476, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2476, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0596, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 11, "Obtained Faerie Gloves", MultiTrigger, GetMultiTrigger(), 1)

	Talk(12,"To redeem Faerie Shoes requires 1 Goddess Tearstone, 30 Life Stone Fragment, 20 Life Stone, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2480, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2480, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0756, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 12, "Obtained Faerie Shoes", MultiTrigger, GetMultiTrigger(), 1)
end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±E
------------------------------------------------------------
function mmm_talk27()
	Talk( 1, "Bewildered Researcher E: Hi, I have been lost for a long time. I got some good stuff with me. Do you wish to do an exchange?" )
	Text( 1, "Redeem Panda set", JumpPage, 2)
	Text( 1, "Redeem Sage set", JumpPage, 9)

	Talk( 2, "Bewildered Researcher E: These good items are also known as Panda set!" )
	Text( 2, "Redeem Mystic Panda Costume (Ami Seal Master)", JumpPage, 3)
	Text( 2, "Redeem Mystic Panda Gloves (Ami Seal Master)", JumpPage, 4)
	Text( 2, "Redeem Mystic Panda Shoes (Ami Seal Master)", JumpPage, 5)
	Text( 2, "Redeem Mystic Panda Cap (Ami Seal Master)", JumpPage, 6)
	Text( 2, "Redeem Crimson Rod (Ami Seal Master)", JumpPage, 7)

	Talk(3,"To redeem Mystic Panda Costume requires 1 Dim Jadestone, 30 Quartz Crystal, 20 Animal Skin, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2470, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2470, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0404, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 3, "Obtained Mystic Panda Costume", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4,"To redeem Mystic Panda Gloves requires 1 Worldstone, 30 Quartz Crystal, 20 Hard Shell, 10 Earthen Element Fragment and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2475, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2475, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0594, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 4, "Obtained Mystic Panda Gloves", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"To redeem Mystic Panda Shoes requires 1 Crystal Zionstone, 30 Quartz Crystal, 20 Special Gas, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2481, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1657, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2481, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1657, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0754, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 5, "Obtained Mystic Panda Shoes", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6,"To redeem Mystic Panda Cap requires 1 Sky Shadestone, 30 Quartz Crystals, 20 Life Stones, 10 Meteorites and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2485, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1631, 20 )
	TriggerCondition( 1, HasItem, 3391, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2485, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1631, 20 )
	TriggerAction( 1, TakeItem, 3391, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 2219, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 6, "Obtained Mystic Panda Cap", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7,"To redeem Crimson Rod requires 1 Abrade Orestone, 30 Agate Crystal, 20 Extender, 10 Magical Bone and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2462, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2462, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0112, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 7, "Obtained Crimson Rod", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8,"Sorry, you do not have the required items to redeem")

	Talk( 9, "Bewildered Researcher E: These good items are also known as Sage set!" )
	Text( 9, "Redeem Robe of the Sage (Phyllis Seal Master)", JumpPage, 10)
	Text( 9, "Redeem Gloves of the Sage (Phyllis Seal Master)", JumpPage, 11)
	Text( 9, "Redeem Boots of the Sage (Phyllis Seal Master)", JumpPage, 12)
	Text( 9, "Redeem Crimson Rod (Phyllis Seal Master)", JumpPage, 7)

	Talk(10,"To redeem Robe of the Sage requires 1 Dim Jadestone, 30 Quartz Crystal, 20 Hard Shell, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2470, 1 )
	TriggerCondition( 1, HasItem, 1699, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2470, 1 )
	TriggerAction( 1, TakeItem, 1699, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0402, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 10, "Obtained Robe of the Sage", MultiTrigger, GetMultiTrigger(), 1)

	Talk(11,"To redeem Gloves of the Sage requires 1 Rainbow Soothstone, 30 Life Stone Fragment, 20 Extender, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2478, 1 )
	TriggerCondition( 1, HasItem, 1630, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2478, 1 )
	TriggerAction( 1, TakeItem, 1630, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0592, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 11, "Obtained Gloves of the Sage", MultiTrigger, GetMultiTrigger(), 1)

	Talk(12,"To redeem Boots of the Sage requires 1 Pearl Soothstone, 30 Agate Crystal, 20 Animal Skin, 10 Magical Bone and 50000")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2482, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2482, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0752, 1 , 4)
	TriggerFailure( 1, JumpPage, 8 )
	Text( 12, "Obtained Boots of the Sage", MultiTrigger, GetMultiTrigger(), 1)
end

------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÃÔÊ§µÄ¿¼¹Å¶Ó³ÉÔ±F
------------------------------------------------------------
function mmm_talk28()
	Talk( 1, "Bewildered Researcher F: Hi, I have been lost for a long time. I got some good stuff with me, do you wish to do an exchange?" )
	Text( 1, "Redeem Apollo set", JumpPage, 2)

	Talk( 2, "Bewildered Researcher F: These good items are also known as Apollo set!" )
	Text( 2, "Redeem Vest of Apollo (Lance, Phyllis Sharpshooter)", JumpPage, 3)
	Text( 2, "Redeem Gloves of Apollo (Lance, Phyllis Sharpshooter) ", JumpPage, 4)
	Text( 2, "Redeem Boots of Apollo (Lance, Phyllis Sharpshooter)", JumpPage, 5)
	Text( 2, "Redeem Twilight (Lance, Phyllis Sharpshooter)", JumpPage, 6)

	Talk(3,"To redeem Vest of Apollo requires 1 Hervo Bloodstone, 30 Clarity Crystal, 20 Animal Skin, 10 Splendor Cloth and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2469, 1 )
	TriggerCondition( 1, HasItem, 3364, 30 )
	TriggerCondition( 1, HasItem, 1608, 20 )
	TriggerCondition( 1, HasItem, 3385, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2469, 1 )
	TriggerAction( 1, TakeItem, 3364, 30 )
	TriggerAction( 1, TakeItem, 1608, 20 )
	TriggerAction( 1, TakeItem, 3385, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0400, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 3, "Obtained Vest of Apollo", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4,"To redeem Gloves of Apollo requires 1 Zest Jadestone, 30 Clarity Crystals, 20 Hard Shells, 10 Earthen Element Fragments and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2474, 1 )
	TriggerCondition( 1, HasItem, 3364, 30 )
	TriggerCondition( 1, HasItem, 1614, 20 )
	TriggerCondition( 1, HasItem, 1658, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2474, 1 )
	TriggerAction( 1, TakeItem, 3364, 30 )
	TriggerAction( 1, TakeItem, 1614, 20 )
	TriggerAction( 1, TakeItem, 1658, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0590, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 4, "Obtained Gloves of Apollo", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"To redeem Boots of Apollo requires 1 Goddess Tearstone, 30 Clarity Crystal, 20 Special Gas, 10 Pearl and 50000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2480, 1 )
	TriggerCondition( 1, HasItem, 3364, 30 )
	TriggerCondition( 1, HasItem, 1657, 20 )
	TriggerCondition( 1, HasItem, 3361, 10 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeItem, 2480, 1 )
	TriggerAction( 1, TakeItem, 3364, 30 )
	TriggerAction( 1, TakeItem, 1657, 20 )
	TriggerAction( 1, TakeItem, 3361, 10 )
	TriggerAction( 1, TakeMoney, 50000 )

	TriggerAction( 1, GiveItem, 0750, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 5, "Obtained Boots of Apollo", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6,"To redeem Twilight requires 1 Oceanic Soulstone, 30 Agate Crystal, 20 Extender, 10 Magical Bone and 100000G")
	InitTrigger()
	TriggerCondition( 1, HasItem, 2465, 1 )
	TriggerCondition( 1, HasItem, 3380, 30 )
	TriggerCondition( 1, HasItem, 1652, 20 )
	TriggerCondition( 1, HasItem, 1626, 10 )
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeItem, 2465, 1 )
	TriggerAction( 1, TakeItem, 3380, 30 )
	TriggerAction( 1, TakeItem, 1652, 20 )
	TriggerAction( 1, TakeItem, 1626, 10 )
	TriggerAction( 1, TakeMoney, 100000 )

	TriggerAction( 1, GiveItem, 0118, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 6, "Obtained Twilight", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7,"Sorry, you do not have the required items to redeem")
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  Â½µØÒ»²ã´«ËÍÊ¹
------------------------------------------------------------
function mmm_talk16()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--º£¾üÂëÍ·×ø±ê
	local GoTo01X = 1250
	local GoTo01Y = 1010
	local GoTo01M = CurMapName

	Talk( 1, "Want to find out what is underneath? Pay me 5000G and I will send you in!" )
	Text( 1, "Vile merchant! Never mind...I will pay", JumpPage, 2 )
	Text( 1, "Forget it! I do not have enough money to go", JumpPage, 3 )

	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "Below leads to the Underground Dock of the Deathsouls. Are you brave enough to enter?" )
	Text( 2, "Yes! Go to Underground Dock!", MultiTrigger,GetMultiTrigger(), 1)

	Talk( 3, "Go away beggar!" )
	Talk( 4, "You do not have enough gold", CloseTalk)
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÊµÑéÊÒ¿´ÊØÈËA
------------------------------------------------------------
function mmm_talk17()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"

	--ÊµÑéÊÒA×ø±ê
	local GoTo01X = 968
	local GoTo01Y = 828
	local GoTo01M = CurMapName

	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Vile merchant! Never mind...I will pay", JumpPage, 2 )
	Text( 1, "Forget it! I do not have enough money to go", JumpPage, 3 )
	
	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )

	Talk( 2, "The Research Room of the Deathsouls is on the inside. Do you dare to enter?" )
	Text( 2, "Go to Research Room A!", MultiTrigger,GetMultiTrigger(), 1)

	Talk( 3, "Go away beggar!" )
	Talk( 4, "You do not have enough gold", CloseTalk)
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÊµÑéÊÒ¿´ÊØÈËB2386
------------------------------------------------------------
function mmm_talk18()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--ÊµÑéÊÒB×ø±ê
	local GoTo01X = 968
	local GoTo01Y = 906
	local GoTo01M = CurMapName

	Talk( 1, "Do you wish to know what is inside? Bring me 20 Soul of Undead and I will let you in!" )
	Text( 1, "Bring me in", JumpPage, 2 )
	Text( 1, "Forget it! I do not want to go", JumpPage, 3 )

	InitTrigger()
	TriggerCondition( 1, HasItem, 2386, 20 )
	TriggerAction( 1, TakeItem, 2386, 20 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )

	Talk( 2, "Research Room B consists of a terrifying Deathsoul Commander. Do you still wish to enter?" )
	Text( 2, "Go to Research Room B!", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "Go away beggar!" )
	Talk( 4, "You have not collect 20 Souls of Undead", CloseTalk)
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  ÊµÑéÊÒ¿´ÊØÈËC
------------------------------------------------------------
function mmm_talk19()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--ÊµÑéÊÒC×ø±ê
	local GoTo01X = 968
	local GoTo01Y = 993
	local GoTo01M = CurMapName

	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Vile merchant! Never mind...I will pay", JumpPage, 2 )
	Text( 1, "Forget it! I do not have enough money to go", JumpPage, 3 )

	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )

	Talk( 2, "Research Room C is on the other side" )
	Text( 2, "Yes! Go to Research Room C!", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "Go away beggar!" )
	Talk( 4, "You do not have enough gold", CloseTalk)
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  µØÏÂ´¬ÎëÊØÎÀ
------------------------------------------------------------
function mmm_talk20()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--ÊµÑéÊÒ×ø±ê
	local GoTo01X = 1076
	local GoTo01Y = 869
	local GoTo01M = CurMapName

	Talk( 1, "Want to know what is inside?" )
	Text( 1, "What is underneath?", JumpPage, 2 )
	Text( 1, "I do not wish to know", JumpPage, 3 )

	InitTrigger()
	TriggerCondition(1,HasItem , 2408,1)
	TriggerCondition(1,HasItem , 2409,1)
	TriggerCondition(1,HasItem , 2410,1)
	TriggerCondition(1,HasItem , 2411,1)
	TriggerCondition(1,HasItem , 2412,1)

	TriggerAction(1,TakeItem,2408,1)
	TriggerAction(1,TakeItem,2409,1)
	TriggerAction(1,TakeItem,2410,1)
	TriggerAction(1,TakeItem,2411,1)
	TriggerAction(1,TakeItem,2412,1)

	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "On the inside will be the Research Room of the Deathsouls. Many dangers lie in it and if you wish to enter, collect the full set of Passwords: AB, BC, CD, DE, EF." )
	Text( 2, "Go to Research Room!", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "......Bye!" )
	Talk( 4, "You have not finish collecting all the Passwords", CloseTalk)
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  µØÓüÒ»²ãÁ¶ÓüÈË
------------------------------------------------------------
function mmm_talk22()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--µØÓü¶þ²ã×ø±ê
	local GoTo01X = 79
	local GoTo01Y = 823
	local GoTo01M = CurMapName


	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Vile merchant! Never mind...I will pay", JumpPage, 2 )
	Text( 1, "Forget it! I do not have enough money to go", JumpPage, 3 )
	Text( 1, "I heard that you have some good items here", JumpPage, 5 )


	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )

	Talk( 2, "Go to Abaddon 2?" )
	Text( 2, "Yes! Go to Abaddon 2!", MultiTrigger, GetMultiTrigger(), 1 )
	
	Talk( 3, "Go away beggar!" )
	Talk( 4, "You do not have enough gold" ,CloseTalk)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerAction( 1, TakeItem, 3457, 5 )
	TriggerAction( 1, GiveItem, 0267, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 5, "Abaddon 1 Warden: Hi, I got some good stuff with me but don't expect me to give it for free. Bring me 5 Kal Runestone and I might reconsider" )
	Text( 5, "Obtain Power of Flame", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6, "Abaddon 1 Warden: Come back again after you have the required items" )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  µØÓü¶þ²ãÁ¶ÓüÈË
------------------------------------------------------------
function mmm_talk23()
	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--µØÓüÒ»²ã×ø±ê
	local GoTo01X = 199
	local GoTo01Y = 824
	local GoTo01M = CurMapName

	--µØÓüÈý²ã×ø±ê
	local GoTo02X = 70
	local GoTo02Y = 952
	local GoTo02M = CurMapName


	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Go to Abaddon 1", JumpPage, 2 )
	Text( 1, "Go to Abaddon 3", JumpPage, 3 )
	Text( 1, "I heard that you have some good items here", JumpPage, 5 )

	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "Do you wish to go to Abaddon 1?" )
	Text( 2, "Go to Abaddon 1", MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition(2,HasMoney,5000)
	TriggerAction(2,TakeMoney,5000)
	TriggerAction( 2, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 4 )
	Talk( 3, "Go to Abaddon 3?" )
	Text( 3, "Yes! Go to Abaddon 3!", MultiTrigger, GetMultiTrigger(),2 )
	
	Talk( 4, "You do not have enough gold" ,CloseTalk)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerAction( 1, TakeItem, 3457, 5 )
	TriggerAction( 1, GiveItem, 0268, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 5, "Abaddon 2 Warden: Hi, I got some good stuff with me but don't expect me to give it for free. Bring me 5 Kal Runestone and I might reconsider" )
	Text( 5, "Obtained Power of Wind", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6, "Abaddon 2 Warden: Come back again after you have the required items" )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  µØÓüÈý²ãÁ¶ÓüÈË
------------------------------------------------------------
function mmm_talk24()

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--µØÓü¶þ²ã×ø±ê
	local GoTo01X = 79
	local GoTo01Y = 823
	local GoTo01M = CurMapName

	--µØÓüËÄ²ã×ø±ê
	local GoTo02X = 209
	local GoTo02Y = 955
	local GoTo02M = CurMapName


	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Go to Abaddon 2", JumpPage, 2 )
	Text( 1, "Go to Abaddon 4", JumpPage, 3 )
	Text( 1, "I heard that you have some good items here", JumpPage, 5 )

	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "Go to Abaddon 2?" )
	Text( 2, "Yes! Go to Abaddon 2!", MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition(2,HasMoney,5000)
	TriggerAction(2,TakeMoney,5000)
	TriggerAction( 2, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 4 )
	Talk( 3, "Do you wish to go to Abaddon 4?" )
	Text( 3, "Go to Abaddon 4", MultiTrigger, GetMultiTrigger(), 2 )
	
	Talk( 4, "You do not have enough gold" ,CloseTalk)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerAction( 1, TakeItem, 3457, 5 )
	TriggerAction( 1, GiveItem, 0269, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 5, "Abaddon 3 Warden: Hi, I got some good stuff with me but don't expect me to give it for free. Äàâà?5 êýëü íà 1 ñèëó" )
	Text( 5, "Power of Thunder", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6, "Abaddon 3 Warden: Come back again after you have the required items" )
end
------------------------------------------------------------
-- ¼ÓÀÕ±Èº£µÁ°æ±¾ -----  µØÓüËÄ²ãÁ¶ÓüÈË
------------------------------------------------------------
function mmm_talk25()

		--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName = "jialebi"


	--µØÓüÈý²ã×ø±ê
	local GoTo01X = 70
	local GoTo01Y = 952
	local GoTo01M = CurMapName

	--²Ø±¦º£Íå×ø±ê
	local GoTo02X = 690
	local GoTo02Y = 1043
	local GoTo02M = CurMapName


	Talk( 1, "Want to find out what is inside? Pay me 5000G and I will send you in!" )
	Text( 1, "Go back to Abaddon 3", JumpPage, 2 )
	Text( 1, "I want to leave this hellish place", JumpPage, 3 )
	Text( 1, "I heard that you have some good items here", JumpPage, 5 )

	InitTrigger()
	TriggerCondition(1,HasMoney,5000)
	TriggerAction(1,TakeMoney,5000)
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "Go to Abaddon 3?" )
	Text( 2, "Yes! Go to Abaddon 3!", MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition(2,HasMoney,5000)
	TriggerAction(2,TakeMoney,5000)
	TriggerAction( 2, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 4 )
	Talk( 3, "Do you wish to go out?" )
	Text( 3, "Yes! Let me out!", MultiTrigger, GetMultiTrigger(), 2 )
	
	Talk( 4, "You do not have enough gold" ,CloseTalk)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerAction( 1, TakeItem, 3457, 5 )
	TriggerAction( 1, GiveItem, 0270, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 5, "Abaddon 4 Warden: Hi, I got some good stuff with me but don't expect me to give it for free. Bring me 5 Kal Runestone and I might reconsider" )
	Text( 5, "Power of Frost", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6, "Abaddon 4 Warden: Come back again after you have the required items" )
end


------------------------------------------------------------
-- ²Ø±¦º£Íå ´«ËÍÊ¹
------------------------------------------------------------

function mmm_talk29()
	--È¡Ïû´«ËÍ·µ»ØÑ¡Ôñ´«ËÍµØµãµÄ¶Ô»°ÄÚÈÝºÍÒ³Ãæ±àºÅ
	local ReSelectTalk = "I need to reconsider¡­"
	local ReSelectPage = 1

	--È¡Ïû´«ËÍºÍÍË³ö´«ËÍµÄ¶Ô»°ºÍÒ³Ãæ±àºÅ
	local CancelSelectTalk = "Forget it¡­I will stay here"
	local CancelSelectPage = 7

	--µØÍ¼Ãû³ÆÐÅÏ¢
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName5 = "darkblue"

	--°×ÒøÖ®³Ç×ø±ê
	local GoTo01X = 2231
	local GoTo01Y = 2788
	local GoTo01M = CurMapName1

	--É³á°Ö®³Ç×ø±ê
	local GoTo02X = 890
	local GoTo02Y = 3575
	local GoTo02M = CurMapName2

	--±ùÀÇ±¤×ø±ê
	local GoTo04X = 1318
	local GoTo04Y = 510
	local GoTo04M = CurMapName5

	Talk( 1, "Teleporter: Do you wish to leave the beautiful Treasure Gulf?" )
	Text( 1, "Go to Argent City!", JumpPage, 2 )
	Text( 1, "Go to Shaitan City!", JumpPage, 3 )
	Text( 1, "Go to Icicle City!", JumpPage, 4 )
	Text( 1, "Record Spawn point", JumpPage, 5 )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 500 )
	TriggerAction( 1, TakeMoney, 500 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 2, "Teleports to Argent City? No problem! Please pay 500G." )
	Text( 2, "Teleport",MultiTrigger, GetMultiTrigger(), 2 ) 
	Text( 2, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, HasMoney, 500 )
	TriggerAction( 1, TakeMoney, 500 )
	TriggerAction( 1,  GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 6 )
	Talk( 3, "I love Shaitan City! Please pay 500G" )
	Text( 3, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 3, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, HasMoney, 500 )
	TriggerAction( 1, TakeMoney, 500 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 4, "Teleports to Icicle City? No problem! Please pay 500G." )
	Text( 4, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 4, CancelSelectTalk, JumpPage , CancelSelectPage )

	Talk( 6, "Sorry! You do not have enough gold to teleport." )

	Talk( 7, "Remember to look for me if you need teleportation services", CloseTalk )
	Talk( 8, "..................^$&#&^%.................." )



	InitTrigger()
	TriggerAction( 1, JumpPage, 1 )
	TriggerAction( 2, JumpPage, 8 )
	Start( GetMultiTrigger(), 2 )

	

end


-- Å®Éñ
------------------------------------------------------------

	
function mmm_talk30()
	Talk(1, "\211\245\238\228\232 \238\242 \241\254\228\224... ")
	Text(1, "\211\233\242\232 ", GoTo, 643, 869, "magicsea" )

end

function dydz_talk()


	Talk( 1, "Abaddon Vagabond: \"If you treasured your life, leave now! I have seen too much adventurers like you!\"" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 40,74, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "What are you thinking? You don't have a boat that you can use anymore. Now scram if you value your life!" )
	Talk( 4, "Don't think that your boat will be repaired for free here. Dock your boat and prepare a fee of 1000G." )
	Talk( 5, "Don't think you can refuel your ship here for free. Dock your ship and prepare a fee of 200G." )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	Talk( 7, "Abaddon Vagabond: \"¡­¡­¡­¡­¡­¡­^$&#&^%¡­¡­¡­¡­¡­¡­\"" )

end
----------------------------
---     momo code --------
-----------------------------

function dysr_talk ()

	Talk( 1, "Abaddon Merchant: On command of my lord, Death. I am here to provide help to you brave warriors, and to witness your deaths. Haha!" )
	Text( 1, "Trade", BuyPage)
	Text( 1, "Repair", OpenRepair)

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)
	Other(	637	)
	Other(	819	)
	Other(	869	)
	Other(	874	)


end 


function zsts_talk()
	
	Talk( 1, "\210\238\235\252\234\238 \241\224\236\251\229 \235\243\247\248\232\229 \232 \253\235\232\242\237\251\229 \212\235\238\242\232\235\232\232 \232\235\232 \207\232\240\224\242\251 \241\236\238\227\243\242 \239\229\240\229\240\238\228\232\242\241\255 ")
	Text( 1, "\207\238\228\240\238\225\237\229\229 \238 \207\229\240\229\240\238\230\228\229\237\232\229 ", JumpPage, 2)
	Text( 1, "\223 \245\238\247\243 \207\229\240\229\240\238\228\232\242\252\241\255 ", JumpPage, 6)

	Talk( 2, "\215\242\238 \226\251 \245\238\242\232\242\229 \243\231\237\224\242\252? ")
	Text( 2, "\202\235\224\241\241\251 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 3)
	Text( 2, "\215\242\238 \225\243\228\229\242 \241 \238\247\234\224\236\232 \241\242\224\242\238\226, \232 \238\247\234\224\236\232 \243\236\229\237\232\233 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 4)

	Talk( 3, "\200\227\240\238\234\232 \236\238\227\243\242 \239\238\226\242\238\240\237\238 \226\251\225\240\224\242\252 \234\235\224\241\241 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255: \203\224\237\241 \236\238\230\229\242 \241\242\224\242\252 \194\238\232\242\229\235\229\236, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \247\229\236\239\232\238\237\238\236. \212\232\235\235\232\241 \236\238\230\229\242 \241\242\224\242\252 \214\232\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \192\236\232 \236\238\230\229\242 \241\242\224\242\252 \214\229\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233 \232\235\232 \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 ")
	Text( 3, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 4, "\194\241\229 \238\247\234\232 \241\242\224\242\238\226 \232 \243\236\229\237\232\233 \225\243\228\243\242 \241\225\240\238\248\229\237\251 \232 \226\251 \241\236\238\230\229\242\229 \231\224\237\238\227\238 \232\245 \239\229\240\229\240\224\241\239\240\229\228\229\235\232\242\252 ")
	Text( 4, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 6, "\202\229\236 \225\251 \226\251 \245\238\242\229\235\232 \241\242\224\242\252 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? " )
	Text( 6, "\209\242\224\242\252 \194\238\232\242\229\235\229\236 ",  GetChaName1_born, 1)
	Text( 6, "\209\242\224\242\252 \215\229\236\239\232\238\237\238\236 ",  GetChaName2_born, 1)
	Text( 6, "\209\242\224\242\252 \207\238\234\238\240\232\242\229\235\229\236 \204\238\240\229\233 ",  GetChaName3_born, 1)
	Text( 6, "\209\242\224\242\252 \209\242\240\229\235\234\238\236 ",  GetChaName4_born, 1)
	Text( 6, "\209\242\224\242\252 \214\229\235\232\242\229\235\229\236 ", GetChaName5_born, 1)
	Text( 6, "\209\242\224\242\252 \202\238\235\228\243\237\252\229\233 ", GetChaName6_born, 1)

end

function zstd_talk()
	
	Talk( 1, "\210\238\235\252\234\238 \241\224\236\251\229 \235\243\247\248\232\229 \232 \253\235\232\242\237\251\229 \212\235\238\242\232\235\232\232 \232\235\232 \207\232\240\224\242\251 \241\236\238\227\243\242 \239\229\240\229\240\238\228\232\242\241\255 ")
	Text( 1, "\207\238\228\240\238\225\237\229\229 \238 \207\229\240\229\240\238\230\228\229\237\232\229 ", JumpPage, 2)
	Text( 1, "\223 \245\238\247\243 \207\229\240\229\240\238\228\232\242\252\241\255 ", JumpPage, 6)

	Talk( 2, "\215\242\238 \226\251 \245\238\242\232\242\229 \243\231\237\224\242\252? ")
	Text( 2, "\202\235\224\241\241\251 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 3)
	Text( 2, "\215\242\238 \225\243\228\229\242 \241 \238\247\234\224\236\232 \241\242\224\242\238\226, \232 \238\247\234\224\236\232 \243\236\229\237\232\233 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 4)

	Talk( 3, "\200\227\240\238\234\232 \236\238\227\243\242 \239\238\226\242\238\240\237\238 \226\251\225\240\224\242\252 \234\235\224\241\241 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255: \203\224\237\241 \236\238\230\229\242 \241\242\224\242\252 \194\238\232\242\229\235\229\236, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \247\229\236\239\232\238\237\238\236. \212\232\235\235\232\241 \236\238\230\229\242 \241\242\224\242\252 \214\232\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \192\236\232 \236\238\230\229\242 \241\242\224\242\252 \214\229\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233 \232\235\232 \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 ")
	Text( 3, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 4, "\194\241\229 \238\247\234\232 \241\242\224\242\238\226 \232 \243\236\229\237\232\233 \225\243\228\243\242 \241\225\240\238\248\229\237\251 \232 \226\251 \241\236\238\230\229\242\229 \231\224\237\238\227\238 \232\245 \239\229\240\229\240\224\241\239\240\229\228\229\235\232\242\252 ")
	Text( 4, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 6, "\202\229\236 \225\251 \226\251 \245\238\242\229\235\232 \241\242\224\242\252 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? " )
	Text( 6, "\209\242\224\242\252 \194\238\232\242\229\235\229\236 ",  GetChaName1_born2, 1)
	Text( 6, "\209\242\224\242\252 \215\229\236\239\232\238\237\238\236 ",  GetChaName2_born2, 1)
	Text( 6, "\209\242\224\242\252 \207\238\234\238\240\232\242\229\235\229\236 \204\238\240\229\233 ",  GetChaName3_born2, 1)
	Text( 6, "\209\242\224\242\252 \209\242\240\229\235\234\238\236 ",  GetChaName4_born2, 1)
	Text( 6, "\209\242\224\242\252 \214\229\235\232\242\229\235\229\236 ", GetChaName5_born2, 1)
	Text( 6, "\209\242\224\242\252 \202\238\235\228\243\237\252\229\233 ", GetChaName6_born2, 1)

end

function zstt_talk()
	
	Talk( 1, "\210\238\235\252\234\238 \241\224\236\251\229 \235\243\247\248\232\229 \232 \253\235\232\242\237\251\229 \212\235\238\242\232\235\232\232 \232\235\232 \207\232\240\224\242\251 \241\236\238\227\243\242 \239\229\240\229\240\238\228\232\242\241\255 ")
	Text( 1, "\207\238\228\240\238\225\237\229\229 \238 \207\229\240\229\240\238\230\228\229\237\232\229 ", JumpPage, 2)
	Text( 1, "\223 \245\238\247\243 \207\229\240\229\240\238\228\232\242\252\241\255 ", JumpPage, 6)

	Talk( 2, "\215\242\238 \226\251 \245\238\242\232\242\229 \243\231\237\224\242\252? ")
	Text( 2, "\202\235\224\241\241\251 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 3)
	Text( 2, "\215\242\238 \225\243\228\229\242 \241 \238\247\234\224\236\232 \241\242\224\242\238\226, \232 \238\247\234\224\236\232 \243\236\229\237\232\233 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? ", JumpPage, 4)

	Talk( 3, "\200\227\240\238\234\232 \236\238\227\243\242 \239\238\226\242\238\240\237\238 \226\251\225\240\224\242\252 \234\235\224\241\241 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255: \203\224\237\241 \236\238\230\229\242 \241\242\224\242\252 \194\238\232\242\229\235\229\236, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \247\229\236\239\232\238\237\238\236. \212\232\235\235\232\241 \236\238\230\229\242 \241\242\224\242\252 \214\232\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233, \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 \232\235\232 \209\242\240\229\235\234\238\236. \192\236\232 \236\238\230\229\242 \241\242\224\242\252 \214\229\235\232\242\229\235\229\236, \202\238\235\228\243\237\252\229\233 \232\235\232 \207\238\234\238\240\232\242\229\235\229\236 \236\238\240\229\233 ")
	Text( 3, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 4, "\194\241\229 \238\247\234\232 \241\242\224\242\238\226 \232 \243\236\229\237\232\233 \225\243\228\243\242 \241\225\240\238\248\229\237\251 \232 \226\251 \241\236\238\230\229\242\229 \231\224\237\238\227\238 \232\245 \239\229\240\229\240\224\241\239\240\229\228\229\235\232\242\252 ")
	Text( 4, "\209\239\224\241\232\225\238, \255 \226\241\229 \239\238\237\255\235 ", CloseTalk)

	Talk( 6, "\202\229\236 \225\251 \226\251 \245\238\242\229\235\232 \241\242\224\242\252 \239\238\241\235\229 \239\229\240\229\240\238\230\228\229\237\232\255? " )
	Text( 6, "\209\242\224\242\252 \194\238\232\242\229\235\229\236 ",  GetChaName1_born3, 3)
	Text( 6, "\209\242\224\242\252 \215\229\236\239\232\238\237\238\236 ",  GetChaName2_born3, 3)
	Text( 6, "\209\242\224\242\252 \207\238\234\238\240\232\242\229\235\229\236 \204\238\240\229\233 ",  GetChaName3_born3, 3)
	Text( 6, "\209\242\224\242\252 \209\242\240\229\235\234\238\236 ",  GetChaName4_born3, 3)
	Text( 6, "\209\242\224\242\252 \214\229\235\232\242\229\235\229\236 ", GetChaName5_born3, 3)
	Text( 6, "\209\242\224\242\252 \202\238\235\228\243\237\252\229\233 ", GetChaName6_born3, 3)

end

function simplepro_02 () -- Áèëåòû

	Talk( 1, "\207\240\232\226\229\242, \234\243\228\224 \225\251 \242\251 \245\238\242\229\235 \238\242\239\240\224\226\232\242\241\255?" )
	Text( 1, "\207\238\241\236\238\242\240\229\242\252", BuyPage)
	

	InitTrade()
	Other(	4602	) -- Argent
	Other(	3057	) -- silver mine 2
	
end 

function r_talkmo2 ()

	Talk( 1, "Hi! Welcome to Pirate Wear Inc, Pls Look Around!" )
	Text( 1, "Trade", BuyPage)

	InitTrade()
	Other(	5482	)--Lance Wild West Hat
	Other(	5483	)--Lance Wild West Suit
	Other(	5484	)--Lance Wild West Gloves
	Other(	5485	)--Lance Wild West Boots
	Other(	5486	)--Phyllis Wild West Hat
	Other(	5487	)--Phyllis Wild West Coat
	Other(	5488	)--Phyllis Wild West Gloves
	Other(	5489	)--Phyllis Wild West Boots
	Other(	5490	)--Carsise Wild West Hat
	Other(	5491	)--Carsise Wild West Jacket
	Other(	5492	)--Carsise Wild West Gloves
	Other(	5493	)--Carsise Wild West Boots
	Other(	5494	)--Ami Wild West Hat
	Other(	5495	)--Ami Wild West Suit
	Other(	5496	)--Ami Wild West Gloves
	Other(	5497	)--Ami Wild West Boots
	Other(	5593	)--Lance Pirate Hat
	Other(	5594	)--Lance Pirate Suit
	Other(	5595	)--Lance Pirate Gloves
	Other(	5596	)--Lance Pirate Shoes
	Other(	5597	)--carsise Pirate Hat
	Other(	5598	)--Carsise Pirate Robe
	Other(	5599	)--Carsise Pirate Gloves
	Other(	5600	)--Carsise Pirate Boots
	Other(	5601	)--Phyllis Pirate Hat
	Other(	5602	)--Phyllis Pirate Coat
	Other(	5603	)--Phyllis Pirate Gloves
	Other(	5604	)--Phyllis Pirate Shoes
	Other(	5605	)--Ami Pirate Diadem
	Other(	5606	)--Ami Pirate Costume
	Other(	5607	)--Ami Pirate Muffs
	Other(	5608	)--Ami Pirate Shoes
	Other(	5661	)--Blood Moon Lance Cap
	Other(	5662	)--Blood Moon Lance Armor
	Other(	5663	)--Blood Moon Lance Gloves
	Other(	5664	)--Blood Moon Lance Boots
	Other(	5693	)--Lance Streetlove Hat
	Other(	5694	)--Lance Streetlove Robe
	Other(	5695	)--Lance Streetlove Gloves
	Other(	5696	)--Lance Streetlove Boots
	Other(	5697	)--carsise Streetlove Hat
	Other(	5698	)--Carsise Streetlove Robe
	Other(	5699	)--Carsise Streetlove Gloves
	Other(	5700	)--Carsise Streetlove Boots
	Other(	5701	)--Phyllis Streetlove Hat
	Other(	5702	)--Phyllis Streetlove Robe
	Other(	5703	)--Phyllis Streetlove Gloves
	Other(	5704	)--Phyllis Streetlove Shoes
	Other(	5705	)--Lance Matrix Hat
	Other(	5706	)--Lance Matrix Suit
	Other(	5707	)--Lance Matrix Gloves
	Other(	5708	)--Lance Matrix Shoes
	Other(	5709	)--Phyllis Matrix Hat
	Other(	5710	)--Phyllis Matrix Coat
	Other(	5711	)--Phyllis Matrix Gloves
	Other(	5712	)--Phyllis Matrix Shoes
	Other(	5713	)--carsise Matrix Hat
	Other(	5714	)--Carsise Matrix Robe
	Other(	5715	)--Carsise Matrix Gloves
	Other(	5716	)--Carsise Matrix Boots
	Other(	5721	)--Ami Matrix Diadem
	Other(	5722	)--Ami Matrix Costume
	Other(	5723	)--Ami Matrix Muffs
	Other(	5724	)--Ami Matrix Shoes
	Other(	5725	)--carsise Ninja Hat
	Other(	5726	)--Carsise Ninja Robe
	Other(	5727	)--Carsise Ninja Gloves
	Other(	5728	)--Carsise Ninja Boots
	Other(	5729	)--Lance Ninja Hat
	Other(	5730	)--Lance Ninja Suit
	Other(	5731	)--Lance Ninja Gloves
	Other(	5732	)--Lance Ninja Shoes
	Other(	5733	)--Phyllis Ninja Hat
	Other(	5734	)--Phyllis Ninja Coat
	Other(	5735	)--Phyllis Ninja Gloves
	Other(	5736	)--Phyllis Ninja Shoes
	Other(	5737	)--Ami Ninja Diadem
	Other(	5738	)--Ami Ninja Costume
	Other(	5739	)--Ami Ninja Muffs
	Other(	5740	)--Ami Ninja Shoes
	Other(	5741	)--carsise Superman Hat
	Other(	5742	)--Carsise Superman Robe
	Other(	5743	)--Carsise Superman Gloves
	Other(	5744	)--Carsise Superman Boots
	Other(	5745	)--Lance Superman Hat
	Other(	5746	)--Lance Superman Suit
	Other(	5747	)--Lance Superman Gloves
	Other(	5748	)--Lance Superman Shoes
	Other(	5749	)--carsise Shinigami Hat
	Other(	5750	)--Carsise Shinigami Robe
	Other(	5751	)--Carsise Shinigami Gloves
	Other(	5752	)--Carsise Shinigami Boots
	Other(	5753	)--Lance Shinigami Hat
	Other(	5754	)--Lance Shinigami Suit
	Other(	5755	)--Lance Shinigami Gloves
	Other(	5756	)--Lance Shinigami Shoes
	Other(	5757	)--Phyllis Shinigami Hat
	Other(	5758	)--Phyllis Shinigami Coat
	Other(	5759	)--Phyllis Shinigami Gloves
	Other(	5760	)--Phyllis Shinigami Shoes
	Other(	5761	)--Ami Shinigami Diadem
	Other(	5762	)--Ami Shinigami Costume
	Other(	5763	)--Ami Shinigami Muffs
	Other(	5764	)--Ami Shinigami Shoes
	Other(	453 	)--Fusions Scroll
	Other(	454		)--Fusion Catalyst
end 

function r_talkmo3 () -- General Store

	Talk( 1, "\207\240\232\226\229\242, \255 \241\229\241\242\240\224 \225\224\234\224\235\229\233\249\232\234\224. \210\238\226\224\240 \243 \236\229\237\255 \237\229 \245\243\230\229 \247\229\236 \243 \237\229\227\238, \241\238\226\229\242\243\254 \226\231\227\235\255\237\243\242\252." )
	Text( 1, "\202\243\239\232\242\252", BuyPage)


	InitTrade()
	Defence(	3096	) -- Icy Crystal
	Defence(	3463	) -- Icy Crystal
	Defence(	3846	) -- voodoo doll
	Defence(	3336	) -- mystic clover
	Defence(	3462	) -- magical clover
	Defence(	3300	) -- intense magic
	Defence(	3301	) -- crystalline blessing
	Defence(	2326	) -- reality mask
	Defence(	3088	) -- reality mask
	Defence(	3089	) -- reality mask
	Defence(	3090	) -- reality mask
	Defence(	3091	) -- reality mask
	Defence(	3092	)
	Defence(	3093	)
	Defence(	0208	) -- reality mask
	Defence(	0207	) -- reality mask
	Defence(	3908	) -- reality mask
	Defence(	3143	) -- reality mask
        Other(	876	) -- reality mask
	Other(	871	) -- reality mask
	Other(	821	) -- reality mask
	Other(	639	) -- reality mask
	Other(	875	) -- reality mask
	Other(	870	) -- reality mask
	Other(	820	) -- reality mask
	Other(	638	) -- reality mask
        Other(	1089	) -- reality mask
	Other(	2380	) -- reality mask
	Other(	850	) -- reality mask
	Other(	2890	) -- reality mask
	Other(	2889	) -- reality mask
	Other(	3107	) -- reality mask



	
end 

function church_talk01()
	Talk (1, "\209\226\232\228\229\242\229\235\252: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
	--Talk (1, "Ñâèäåòåë? Ïðèâåò. Çà 200 çîëîòû?ÿ ìîãó óñòðîèòü äëÿ æåíèõà ?íåâåñòîé ãðàíäèîçíû?ñàëþ? Õî÷åøü?")

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 ) 
	TriggerAction( 1, TakeMoney, 200) 
	TriggerAction( 1, FireworksChurch ) 
	TriggerFailure( 1, JumpPage, 3)

	Text (1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
	--Text (1, "Êîíå÷í?",  MultiTrigger, GetMultiTrigger(), 1)
	Text (1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
	--Text (1, "Íå? ñïàñèá?", CloseTalk)

	Talk (3, "\209\226\232\228\229\242\229\235\252: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
	--Talk (3, "Ñâèäåòåë? Èçâèíèòå, íî ?Âà?íå?äåíå?")
	Text (3, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
	--Text (3, "Äî ñâèäàí?.", CloseTalk)
end

function church_talk02()
	Talk (1, "\209\226\232\228\229\242\229\235\252\237\232\246\224: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
	--Talk (1, "Ñâèäåòåëüíèö? Ïðèâåò. Çà 200 çîëîòû?ÿ ìîãó óñòðîèòü äëÿ æåíèõà ?íåâåñòîé ãðàíäèîçíû?ñàëþ? Õî÷åøü?")

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 ) 
	TriggerAction( 1, TakeMoney, 200) 
	TriggerAction( 1, FireworksChurch ) 
	TriggerFailure( 1, JumpPage, 3)

	Text (1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
	--Text (1, "Êîíå÷í?",  MultiTrigger, GetMultiTrigger(), 1)
	Text (1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
	--Text (1, "Íå? ñïàñèá?", CloseTalk)

	Talk (3, "\209\226\232\228\229\242\229\235\252\246\224: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
	--Talk (3, "Ñâèäåòåëüö? Èçâèíèòå, íî ?Âà?íå?äåíå?")
	Text (3, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
	--Text (3, "Äî ñâèäàí?.", CloseTalk)
end

function church_talk03()

	Talk( 1, "\207\229\240\226\238\241\255\249\229\237\237\232\234: \196\238\225\240\238 \239\238\230\224\235\238\226\242\252 \226 \214\229\240\234\238\226\252. \196\224\226\224\233\242\229 \237\224\247\237\229\236 \246\229\240\229\236\238\237\232\254.")
		--Talk( 1, "Ïåðâîñÿùåííèê: Äîáð?ïîæàëîâò??Öåðêîâ? Äàâàéò?íà÷íåì öåðåìîíè?")
	Text( 1, "\205\224\247\224\242\252 \246\229\240\229\236\238\237\232\254", JumpPage, 2)
		--Text( 1, "Íà÷àòü öåðåìîíè?, JumpPage, 2)

	Talk( 2, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \193\229\240\229\248\252 \235\232 \242\251 \226  \231\224\234\238\237\237\251\229 \230\229\237\251(\236\243\230\252\255) \253\242\238\227\238 \247\229\235\238\226\229\234\224? \209\238\227\235\224\241\229\237(\224) \235\232 \242\251 \232 \226 \227\238\240\229 \232 \226 \240\224\228\238\241\242\232 \225\251\242\252 \241 \237\232\236?" )
		--Talk( 2, "Ïåðâîñ?ùåííèê: Áåðåøü ëè òû ? çàêîííûå æåíû(ìóæüÿ) ýòîã?÷åëîâåêà? Ñîãëàñåí(? ëè òû ??ãîðå ??ðàäîñò?áûòü ?íè?" )
	Text( 2, "\196\224. \223 \241\238\227\235\224\241\229\237(\224).", Marry)
		--Text( 2, "Äà. ?ñîãëàñåí(?.", Marry)
	Text( 2, "\204\237\229 \237\224\228\238 \239\238\228\243\236\224\242\252...", CloseTalk)
		--Text( 2, "Ìí?íàäî ïîäóìàòü...", CloseTalk)

end

function church_talk04()

	Talk( 1, "\207\240\232\245\238\230\224\237\234\224: \196\238\225\240\251\233 \228\229\237\252! \192 \194\251 \237\224 \241\226\224\228\252\225\243? \205\229 \230\229\235\224\229\242\229 \241\228\229\235\224\242\252 \241\254\240\239\240\232\231 \236\238\235\238\228\238\230\229\237\224\236?")
		--Talk( 1, "Ïðèõîæàíêà: Äîáðûé äåíü! ?Âû íà ñâàäüá? Íå æåëàåò?ñäåëàò?ñþðïðè?ìîëîäîæåíà?")
	Text( 1, "\202\224\234\238\233?", JumpPage, 2)
		--Text( 1, "Êàêî?", JumpPage, 2)
	Text( 1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
		--Text( 1, "Íå? ñïàñèá?", CloseTalk)
	
	Talk( 2, "\207\240\232\245\238\230\224\237\234\224: \211 \236\229\237\255 \229\241\242\252 \243\237\232\234\224\235\252\237\251\229 \241\226\232\242\234\232 \226\251\231\238\226\224. \223 \238\247\229\237\252 \228\229\248\229\227\238 \232\245 \238\242\228\224\254.")
		--Talk( 2, "Ïðèõîæàíêà: ?ìå? åñòü óíèêàëüíûå ñâèòêè âûçîâà. ?î÷åí?äåøåãî èõ îòäà?")
	Text( 2, "\214\226\229\242\238\247\237\251\233 \248\224\240", JumpPage, 3)
		--Text( 2, "Öâåòî÷íû?øà?, JumpPage, 3)
	Text( 2, "\208\224\241\239\232\241\234\224 \237\224 \232\227\240\243 \241 \216\224\240\232\234\224\236\232", JumpPage, 4)
		--Text( 2, "Ðàñïèñêà íà èãðó ?Øàðèêàìè", JumpPage, 4)

	Talk( 3, "\207\240\232\245\238\230\224\237\234\224: \193\240\224\247\237\251\233 \224\244\229\240\232\241\242 \238\247\229\237\252 \224\227\240\229\241\232\226\229\237. \197\241\235\232 \229\227\238 \243\228\224\240\232\242\252, \238\237 \237\229 \238\242\241\242\224\237\229\242 \238\242 \194\224\241. \193\243\228\252\242\229 \238\241\242\238\240\238\230\237\251!")
		--Talk( 3, "Ïðèõîæàíêà: Áðà÷íû?àôåðèñ?î÷åí?àãðåñèâå? Åñëè åã?óäàðèò? îí íå îòñòàíåò îò Âà? Áóäüòå îñòîðîæí?")

	InitTrigger()
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, HasMoney, 75000 )
	TriggerAction( 1, TakeMoney, 75000 )
	TriggerAction( 1, GiveItem , 3080  , 1 , 4  ) 
	TriggerFailure( 1, JumpPage, 5 )
	Text( 3, "\202\243\239\232\242\252 \231\224 75.000 \231\238\235\238\242\251\245", MultiTrigger, GetMultiTrigger(), 1)
		--Text( 3, "Êóïèòü çà 75.000 çîëîòû?, MultiTrigger, GetMultiTrigger(), 1)
	Text( 3, "\205\224\231\224\228", JumpPage, 2)
		--Text( 3, "Íàçà?, JumpPage, 2)

	Talk( 4, "\207\240\232\245\238\230\224\237\234\224: \194\238\231\228\243\248\237\251\229 \248\224\240\251... \223 \238\247\229\237\252 \235\254\225\235\254 \243\234\240\224\248\224\242\252 \232\236\232 \241\226\238\233 \228\238\236. \192 \194\251 \234\238\227\228\224-\237\232\225\243\228\252 \239\240\238\225\251\226\224\235\232?")
		--Talk( 4, "Ïðèõîæàíêà: Âîçäóøíû?øàðû... ?î÷åí?ëþáë?óêðàøàòü èì?ñâîé äî? ?Âû êîãä?íèáóäü ïðîáûâàë?")

	InitTrigger()
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, HasMoney, 75000 )
	TriggerAction( 1, TakeMoney, 75000 )
	TriggerAction( 1, GiveItem , 3083  , 1 , 4  ) 
	TriggerFailure( 1, JumpPage, 5 )
	Text( 4, "\202\243\239\232\242\252 \231\224 75.000 \231\238\235\238\242\251\245", MultiTrigger, GetMultiTrigger(), 1)
		--Text( 4, "Êóïèòü çà 75.000 çîëîòû?, MultiTrigger, GetMultiTrigger(), 1)
	Text( 4, "\205\224\231\224\228", JumpPage, 2)
		--Text( 4, "Íàçà?, JumpPage, 2)

	Talk( 5, "\207\240\232\245\238\230\224\237\234\224: \202\224\234 \226\251 \241\236\229\229\242\229 \238\225\236\224\237\251\226\224\242\252? \199\228\229\241\252! \194 \214\229\240\234\226\232!")
		--Talk( 5, "Ïðèõîæàíêà: Êà?âû ñìååòå îáìàíûâàòü? Çäåñ? ?Öåðêâè!")
	Text( 5, "\200\231\226\232\237\232\242\229", CloseTalk)
		--Text( 5, "Èçâèíèòå", CloseTalk)
end

function m_Certificate()
	Talk(1, "\209\226\255\249\229\237\237\232\234: \207\240\232\226\229\242\241\242\226\243\254, \255 \240\229\227\232\241\242\240\232\240\243\254 \225\240\224\234." )
    Text(1, "\223 \245\238\247\243 \243\231\237\224\242\252 \242\240\229\225\238\226\224\237\232\255 \234 \225\240\224\234\243.", JumpPage, 2)
	Text(1, "\223 \245\238\247\243 \231\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252 \225\240\224\234.", JumpPage, 3)
	Text(1, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
	
	Talk(2, "\210\240\229\225\238\226\224\237\232\255: 1. \211 \236\238\235\238\228\238\230\229\237\238\226 \228\238\235\230\237\251 \225\251\242\252 \202\238\235\252\246\224 \209\226\255\242\238\227\238 \194\224\235\229\237\242\232\237\224. 2. \204\238\235\238\228\238\230\229\237\251 \196\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229. 3. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\240\232\237\229\241\242\232 10 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\251\245. 4. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\238\235\243\247\232\242\252 \232 \238\242\234\240\251\242\252 \241\226\238\232 \241\243\237\228\243\234\232 \244\229\233.")
	Text(2, "\213\238\240\238\248\238, \255 \239\238\237\255\235. \199\224\240\229\227\232\241\242\240\232\240\243\233\242\229!", JumpPage, 1)
	Text(2, "\196\224\233\242\229 \239\238\228\243\236\224\242\252.", CloseTalk)
	
	Talk(3, "\209\226\255\249\229\237\237\232\234: \197\241\235\232 \242\251 \227\238\242\238\226, \239\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232. \207\238\241\235\229 \240\229\227\232\241\242\240\224\246\232\232 \242\251 \239\238\235\243\247\232\248\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \209 \237\232\236 \236\238\230\237\238 \205\224\247\224\242\252 \246\229\240\229\236\238\237\232\254 \241\226\224\228\252\225\251 \243 \194\238\235\248\229\225\237\232\234\224 \215\232\242\224\237\224")
	Text(3, "\207\238\228\242\226\229\240\228\232\242\252", MarryCertificate)
	Text(3, "\196\224\233\242\229 \229\249\229 \240\224\231 \239\238\228\243\236\224\242\252.", CloseTalk)
	
end

function t_abaddonn()
Talk( 1, "\223 \241\235\251\248\224\235 \247\242\238 \237\224 \234\224\230\228\238\236 \253\242\224\230\229 \229\241\242\252 \241\235\243\227\224 \241\236\229\240\242\232..." )
Text( 1, "\194\238\233\242\232 \226 \192\225\224\228\228\238\237 2 ", GoTo, 35, 788, "jialebi" )
Text( 1, "\216\224\233\242\224\237", GoTo, 647, 869, "magicsea" )
end

function t_abaddonn2()
Talk( 1, "\223 \241\235\251\248\224\235 \247\242\238 \237\224 \234\224\230\228\238\236 \253\242\224\230\229 \229\241\242\252 \241\235\243\227\224 \241\236\229\240\242\232..." )
Text( 1, "\194\229\240\237\243\242\252\241\255 \226 \192\225\224\228\228\238\237 1 ", GoTo, 154, 786, "jialebi" )
Text( 1, "\194\238\233\242\232 \226 \192\225\224\228\228\238\237 3 ", GoTo, 35, 908, "jialebi" )
Text( 1, "\216\224\233\242\224\237", GoTo, 647, 869, "magicsea" )
end

function t_abaddonn3()
Talk( 1, "\223 \241\235\251\248\224\235 \247\242\238 \237\224 \234\224\230\228\238\236 \253\242\224\230\229 \229\241\242\252 \241\235\243\227\224 \241\236\229\240\242\232..." )
Text( 1, "\194\229\240\237\243\242\252\241\255 \226 \192\225\224\228\228\238\237 2 ", GoTo, 35, 788, "jialebi" )
Text( 1, "\194\238\233\242\232 \226 \192\225\224\228\228\238\237 4 ", GoTo, 155, 908, "jialebi" )
Text( 1, "\216\224\233\242\224\237", GoTo, 647, 869, "magicsea" )
end

function t_abaddonn4()
Talk( 1, "\223 \241\235\251\248\224\235 \247\242\238 \237\224 \234\224\230\228\238\236 \253\242\224\230\229 \229\241\242\252 \241\235\243\227\224 \241\236\229\240\242\232..." )
Text( 1, "\194\229\240\237\243\242\252\241\255 \226 \192\225\224\228\228\238\237 3 ", GoTo, 35, 908, "jialebi" )
Text( 1, "\216\224\233\242\224\237", GoTo, 647, 869, "magicsea" )
end