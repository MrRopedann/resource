-------------------------------------------------------------------
--									--
--									--
--NPCScript03.lua Created by Robin 2005.6.1.				--
--									--
--									--
--------------------------------------------------------------------------
print( "loading NPCScript03.lua" )

jp= JumpPage
amp=AutoMissionPage
ct=CloseTalk
am=AddMission
MissionCheck = HasFlag
mc=MissionCheck


----------------------------------------------------------
--							--
--							--
--		°×Òø³Ç[½»Ò×Ô±¡¤ºÂÂå¸¦]			--
--							--
--		225538,280188				--
----------------------------------------------------------
-----------------------------------------------------------ÕâÀï¿ªÊ¼P»°ÁÄÌì
function r_talk10 ()
	
	
	Talk( 1, "Chiroro: Hi! I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 1 )
	TriggerAction( 1, TradeBerthList, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 )
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)
	
	Talk( 2, "Chiroro: Sorry, you do not have any ships docked in Argent Harbor . Unable to trade." )
	
	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)
	

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(1)
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

	AddNpcMission 	(443)
	AddNpcMission 	(445)
	AddNpcMission 	(447)
	AddNpcMission	(1020)
	AddNpcMission	(1076)
	AddNpcMission	(1132)
	AddNpcMission	(1183)
	AddNpcMission(	1226	)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<½»Ò×Ô±¡¤ºÂÂå¸¦



----------------------------------------------------------
--							--
--							--
--		À×öª±¤[½»Ò×Ô±¡¤É£¼ª]			--
--							--
--		103877,127848				--
----------------------------------------------------------
-----------------------------------------------------------ÕâÀï¿ªÊ¼P»°ÁÄÌì
function r_talk27 ()
	
	
	Talk( 1, " Sanjay: Hi, Baby! I am in charge of the trade here¡­and girls too." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 2 )
	TriggerAction( 1, TradeBerthList, 2 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)
	
	Talk( 2, "Sanjay: Sorry! Your ship is not docked in Thundoria Harbor. Unable to trade." )	
	
	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")
	
	
	
	InitGoods( 2)
	SaleGoodsData(	1	,	4597	,	480	,	436	,	97	)
	SaleGoodsData(	2	,	4598	,	300	,	472	,	105	)
	SaleGoodsData(	2	,	4599	,	240	,	508	,	113	)
	SaleGoodsData(	3	,	4600	,	60	,	571	,	127	)
	SaleGoodsData(	3	,	4601	,	40	,	643	,	143	)
	
	BuyGoodsData(0,	4573	,	-1	,	554	,	123	)
	BuyGoodsData(0,	4574	,	-1	,	711	,	158	)
	BuyGoodsData(0,	4576	,	-1	,	872	,	193	)
	BuyGoodsData(0,	4581	,	-1	,	548	,	121	)
	BuyGoodsData(0,	4583	,	-1	,	740	,	165	)
	BuyGoodsData(0,	4587	,	-1	,	900	,	600	)
	BuyGoodsData(0,	4591	,	-1	,	880	,	195	)
	BuyGoodsData(0,	4593	,	-1	,	1029	,	229	)
	BuyGoodsData(0,	4595	,	-1	,	976	,	651	)
	BuyGoodsData(0,	4553	,	-1	,	826	,	183	)
	BuyGoodsData(0,	4555	,	-1	,	793	,	177	)
	BuyGoodsData(0,	4556	,	-1	,	860	,	191	)
	BuyGoodsData(0,	4557	,	-1	,	960	,	213	)
	BuyGoodsData(0,	4559	,	-1	,	920	,	205	)
	BuyGoodsData(0,	4560	,	-1	,	1039	,	231	)
	BuyGoodsData(0,	4563	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4566	,	-1	,	831	,	185	)
	BuyGoodsData(0,	4569	,	-1	,	1089	,	243	)
	BuyGoodsData(0,	4572	,	-1	,	924	,	205	)
	BuyGoodsData(0,	4547	,	-1	,	100	,	0	)
	BuyGoodsData(0,	4549	,	-1	,	450	,	0	)
	BuyGoodsData(0,	4550	,	-1	,	1000	,	0	)
	BuyGoodsData(0,	4548	,	-1	,	300	,	0	)
	BuyGoodsData(0,	4551	,	-1	,	20	,	0	)
	BuyGoodsData(0,	3913	,	-1	,	1248	,	832 	)
	BuyGoodsData(0,	3912	,	-1	,	1395	,	930 	)
	BuyGoodsData(0,	3914	,	-1	,	1614	,	1077	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()

	AddNpcMission	(1021)
	AddNpcMission	(1077)
	AddNpcMission	(1133)
	AddNpcMission	(1184)

end 

----------------------------------------------------------
--							--
--							--
--		É³á°³Ç[´¬¹¤¡¤¸¥À¼¿Ë]			--
--							--
--		90391,366735				--
----------------------------------------------------------
-----------------------------------------------------------ÕâÀï¿ªÊ¼P»°ÁÄÌì
-- function r_talk60()
	-- Talk( 1, "Êîðàáåëüùè?Ïðèâåò! Èíòåðåñóþò ëó÷øèå ñóäí? ")
	-- InitTrigger()
	-- TriggerCondition( 1, IsBoatFull )
	-- TriggerAction( 1, SystemNotice, "Äîñòèãíóòî ìàêñèìàëüíîå êîëè÷åñòâî êîðàáëåé. Íåëü? áîëüøå ïîñòðîèò?êîðàáë? ")
	-- TriggerFailure( 1, JumpPage, 2 )
	-- Text( 1, "Ïîñòðîèò?êîðàáë?, MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, HasBoatInBerth, 3 )
	-- TriggerAction( 1, BoatLevelBerthList, 3 )
	-- TriggerFailure( 1, JumpPage, 3 )
	-- Text( 1, "Óëó÷øèòü êîðàáë?", MultiTrigger, GetMultiTrigger(), 1 )
	
	-- Talk( 2, "Êîðàáåëüùè? êàêî?êîðàáë?æåëàåò?ïîñòðîèò? ")
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 1 )
	-- TriggerAction( 1, CreateBoat, 1, 3 )
	-- Text( 2, "Ïîñòðîèò?Ãóïï?", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 2 )
	-- TriggerAction( 1, CreateBoat, 2, 3 )
	-- Text( 2, "Ïîñòðîèò?Òðàíñïîðòå?", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 3 )
	-- TriggerAction( 1, CreateBoat, 3, 3 )
	-- Text( 2, "Ïîñòðîèò?Ëåòó÷ó?ðûáó ", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 6 )
	-- TriggerAction( 1, CreateBoat, 6, 3 )
	-- Text( 2, "Ïîñòðîèò?Ðûáó-ìå?", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 6 )
	-- TriggerAction( 1, CreateBoat, 12, 3 )
	-- Text( 2, "Ïîñòðîèò?Ìåòåîð ", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 13 )
	-- TriggerAction( 1, CreateBoat, 13, 3 )
	-- Text( 2, "Ïîñòðîèò?Àêóë?", MultiTrigger, GetMultiTrigger(), 1 )
	-- InitTrigger()
	-- TriggerCondition( 1, BoatBuildCheck, 16 )
	-- TriggerAction( 1, CreateBoat, 16, 3 )
	-- Text( 2, "Ïîñòðîèò?Îðåë ", MultiTrigger, GetMultiTrigger(), 1 )

	-- Talk( 3, "Êîðàáåëüùè? ×òîá?óëó÷øèòü ñóäí?âû äîëæíû ïîñòàâèò?åã??ýò?ãàâàíü. Êðîì?òîãî ?âà?äîëæíî áûòü íåîáõîäèìî?êîëè÷åñòâî îïûò?êîðàáëÿ. Îïûò ìîæí?çàðàáîòàòü óáèâ? ìîðñêè?ìîíñòðîâ. ")

-- end 
---<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<´¬³§¹¤ÈË¡¤¸¥À¼¿Ë

------------------------------------------------------------
-- °×Òø³Ç-----º£ÊÂËùÖúÀí¡¤ÂÞÀ­ÄÈ
------------------------------------------------------------

function r_talk150()

	Talk( 1, "Alena: Hi! I am the Maritime Assistant. Can I help you?" )

	AddNpcMission 	(437)
	AddNpcMission 	(439)
	AddNpcMission 	(441)


end

------------------------------------------------------------
-- °×Òø³Ç-----´¬¹¤¡¤Ë¹°Í¿Ë
------------------------------------------------------------

function r_talk151 ()
		
	Talk( 1, "Ñèíäáà? Ïðèâåò! ?îòâå÷à?çäåñ?çà ïîòðîéêó êîðàáëåé! ")
	InitTrigger()
	TriggerCondition( 1, IsBoatFull )
	TriggerAction( 1, SystemNotice, "Äîñòèãíóòî ìàêñèìàëüíîå êîëè÷åñòâî êîðàáëåé. Íåëü? áîëüøå ïîñòðîèò?êîðàáë? ")
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Ïîñòðîèò?êîðàáë?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 1 )
	TriggerAction( 1, BoatLevelBerthList, 1 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Óëó÷øèòü êîðàáë?", MultiTrigger, GetMultiTrigger(), 1 )
	
	Talk( 2, "Ñèíäáà? êàêî?êîðàáë?æåëàåò?ïîñòðîèò? ")
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 1 )
	TriggerAction( 1, CreateBoat, 1, 1 )
	Text( 2, "Ïîñòðîèò?Ãóïï?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 2 )
	TriggerAction( 1, CreateBoat, 2, 1 )
	Text( 2, "Ïîñòðîèò?Òðàíñïîðòå?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 3 )
	TriggerAction( 1, CreateBoat, 3, 1 )
	Text( 2, "Ïîñòðîèò?Ëåòó÷ó?ðûáó ", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 6 )
	TriggerAction( 1, CreateBoat, 6, 1 )
	Text( 2, "Ïîñòðîèò?Ðûáó-ìå?", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "Ñèíäáà? ×òîá?óëó÷øèòü ñóäí?âû äîëæíû ïîñòàâèò?åã??ýò?ãàâàíü. Êðîì?òîãî ?âà?äîëæíî áûòü íåîáõîäèìî?êîëè÷åñòâî îïûò?êîðàáëÿ. Îïûò ìîæí?çàðàáîòàòü óáèâ? ìîðñêè?ìîíñòðîâ. ")
end
------------------------------------------------------------
-- °×Òø³Ç-----º£¸ÛÖ¸»Ó¡¤Ñ©Àò
------------------------------------------------------------

function r_talk152()

	Talk( 1, "Ìàéê? Ïðèâåò ÿ Âëàäåëåö ïîðò? õî÷åøü ïîïëàâàò? " )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 1 )
	--TriggerAction( 1, RemoveYS )
	TriggerAction( 1, LuanchBerthList, 1, 2260,2829, 177 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Âûéò??ìîðå ", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 1 )
	TriggerAction( 2, RepairBerthList, 1 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Ïî÷èíê?", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 1 )
	TriggerAction( 2, SupplyBerthList, 1 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Çàïðàâêà ", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 1 )
	TriggerAction( 1, SalvageBerthList, 1 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Âîñòàíîâëåíè?êîðàáëÿ ", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Èçâèíè, íî ?òå? íåòó êîðàáëÿ, êà?êóïèøü, òîãä??ïðèõîä?" )
	Talk( 4, "Èçâèíè, íî ?òå? íåõâàòàå?äåíå?íà ïî÷èíê?êîðàáëÿ " )
	Talk( 5, "Èçâèíè, íî ?òå? íåõâàòàå?äåíå?íà çàïðàâêó êîðàáëÿ " )
	Talk( 6, "Èçâèíè, íî ?òå? íåõâàòàå?äåíå?íà âîñòàíîâëåíè?êîðàáëÿ " )

	AddNpcMission ( 289 )
	AddNpcMission ( 290 )


end

------------------------------------------------------------
-- É³á°³Ç-----º£¸ÛÖ¸»Ó¡¤Âí¿Ë
------------------------------------------------------------

function r_talk153()
	Talk( 1, "Ìàðê: Ïðèâåò! ?îïåðàòîð ôëîò? ×å?ÿ ìîãó ïîìî÷ü? ")
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 832, 3698, 180 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Îòïðàâèòüñÿ ?ïóòü ", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 3 )
	TriggerAction( 2, RepairBerthList, 3 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Ïî÷èíèòü ñóäí?", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 3 )
	TriggerAction( 2, SupplyBerthList, 3 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Çàïðàâèò?ñóäí?", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 3 )
	TriggerAction( 1, SalvageBerthList, 3 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Âîññòàíîâèòü ñóäí?", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Ïðîñòèòå. ?âà?íå?ñóäí??ýòîì ïîðò? Åñëè ñóäí?óòîíóë? òî âà?íåîáõîäèìî åã?âîññòàíîâèòü. ")
	Talk( 4, "Ïðîñòèòå. ?âà?íå?ñóäí??ýòîì ïîðò? Åñëè ñóäí?óòîíóë? òî âà?íåîáõîäèìî åã?âîññòàíîâèòü. ")
	Talk( 5, "Ïðîñòèòå. ?âà?íå?ñóäí??ýòîì ïîðò? Åñëè ñóäí?óòîíóë? òî âà?íåîáõîäèìî åã?âîññòàíîâèòü. ")
	Talk( 6, "Ïðîñòèòå, íî âû ìîæåòå âîññòàíîâèòü ñóäí?ëèøü ?òî?ïîðò? ãä?îí?ïðèïèñàí? ")
end

------------------------------------------------------------
--±ùÀÇ±¤-----´¬¹¤¡¤ÇÇÖÎ
------------------------------------------------------------
function r_talk155 ()
		
	Talk( 1, "George: Hey you! Want to go sailing? How can you do so without a good ship! Come have a look at what I have!" )
	InitTrigger()
	TriggerCondition( 1, IsBoatFull )
	TriggerAction( 1, SystemNotice, "Ships limit reached. Unable to build more ship" )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Build Ship", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 4 )
	TriggerAction( 1, BoatLevelBerthList, 4 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Upgrade ship", MultiTrigger, GetMultiTrigger(), 1 )
	
	Talk( 2, "George: What type of ship you wish to build? I have a few models for you to choose from. I have some discount for you if you are interested." )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 2 )
	TriggerAction( 1, CreateBoat, 2, 4 )
	Text( 2, "Build Transporter", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 5 )
	TriggerAction( 1, CreateBoat, 5, 4 )
	Text( 2, "Build Windseeker", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 3 )
	TriggerAction( 1, CreateBoat, 3, 4 )
	Text( 2, "Build Flying Fish", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 4 )
	TriggerAction( 1, CreateBoat, 4, 4 )
	Text( 2, "Build Turtle", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 16 )
	TriggerAction( 1, CreateBoat, 16, 4 )
	Text( 2, "Build Eagle", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "George: You need to have your ship docked at my harbor in order to level it. Ships get better as they level up. To level up your ship, come back when it has gained enough experience from sailing or killing monsters out in the sea." )
		
end 

------------------------------------------------------------
-- ±ùÀÇ±¤-----º£¸ÛÖ¸»Ó¡¤Ï¯ÁÖ
------------------------------------------------------------

function r_talk154()

	Talk( 1, "Silion: Hi! Hi, I am the Harbor Operator for Icicle City. All procedure must come through me. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 4 )
	TriggerAction( 1, LuanchBerthList, 4, 1196,673, 177 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 4 )
	TriggerAction( 2, RepairBerthList, 4 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 4 )
	TriggerAction( 2, SupplyBerthList, 4 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 4 )
	TriggerAction( 1, SalvageBerthList, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 


	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )

	AddNpcMission ( 294 )
	AddNpcMission ( 295 )

end


------------------------------------------------------------
-- º£·çµº-----º£¸ÛÖ¸»Ó¡¤Â··²
------------------------------------------------------------

function r_talk178()

	Talk( 1, "Ìå? Òû íå çàõîäè?åù??ïîðòàë? Òà?ïðîèñõîäÿ?îïàñíû?âåùè!" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 5 )
	TriggerAction( 1, LuanchBerthList, 5, 3240, 3314, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Íå? åù?íåáû?òà?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 5 )
	TriggerAction( 2, RepairBerthList, 5 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Íå?", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 5 )
	TriggerAction( 2, SupplyBerthList, 5 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Ñåé÷àñ ïðîâåðèì!", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 5 )
	TriggerAction( 1, SalvageBerthList, 5 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Ìí?ñòðàøí?", MultiTrigger, GetMultiTrigger(), 1 ) 

        Talk( 3, "Íó òà?ñõîä? ÷¸!" )
	Talk( 4, "Íå òóïè, èä?ïðîâåð?" )
	Talk( 5, "Ïðîâåðÿ? ÷¸ òóïèøü?!" )
	Talk( 6, "Ïõàõàõàõ, ëî?" )

end

------------------------------------------------------------
-- Ëé±ùµº-----º£¸ÛÖ¸»Ó¡¤Åµ¶ûÂÞµÂ
------------------------------------------------------------

function r_talk179()

	Talk( 1, "Noel: Hi! I am the Harbor Operator around here. Anything I can help you with?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 6 )
	TriggerAction( 1, LuanchBerthList, 6, 2301, 1144, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 6 )
	TriggerAction( 2, RepairBerthList, 6 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 6 )
	TriggerAction( 2, SupplyBerthList, 6 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 6 )
	TriggerAction( 1, SalvageBerthList, 6 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )

end

------------------------------------------------------------
-- Ñ©Ôôµº-----º£¸ÛÖ¸»Ó¡¤Â³×ÈÂ³ÒÁ
------------------------------------------------------------

function r_talk180()

	Talk( 1, "Lucci: Hi! I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 7 )
	TriggerAction( 1, LuanchBerthList, 7, 3628, 770, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 7 )
	TriggerAction( 2, RepairBerthList, 7 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 7 )
	TriggerAction( 2, SupplyBerthList, 7 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 7 )
	TriggerAction( 1, SalvageBerthList, 7 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )

end

------------------------------------------------------------
-- ÈøÀ­²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤ÎÂÑÇËþ
------------------------------------------------------------

function r_talk181()

	Talk( 1, "Whitney: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 
	
	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )


	AddNpcMission	(763)
	AddNpcMission(	1742	)
	AddNpcMission (	1938	)
	AddNpcMission (	1953	)
----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤ÎÂÑÇËþ--03
	AddNpcMission	(5511)
	AddNpcMission	(5512)
	

end

------------------------------------------------------------
-- °¢¶û²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤´ïÒ®´ï
------------------------------------------------------------

function r_talk182()

	Talk( 1, "Daruka: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 


	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	AddNpcMission	(379)
	AddNpcMission	(380)
----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤´ïÒ®´ï--03
	AddNpcMission (5533 )
	AddNpcMission (5534 )
end

------------------------------------------------------------
-- ¹þ¶û²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤ÍßÀ×Ã×
------------------------------------------------------------

function r_talk183()

	Talk( 1, "Whitcombe: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 
--Text( 1, "Obtained Fairy Soul", JumpPage, 6 ) 
	
	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	InitTrigger()
	TriggerCondition( 1, HasItem, 3116, 50 )
	TriggerAction( 1, TakeItem, 3116, 50 )
	TriggerAction( 1, GiveItem, 3337, 1, 4 )
	TriggerFailure( 1, JumpPage, 7 )
	Talk( 6, "Whitcombe: Hi! You wish to have a Fairy Soul? Then you must bring me 50 Elven Fruits." )
	Text( 6, "I have enough Elven Fruits", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 7, "Whitcombe: Hey! I said before. You must give me 50 Elven Fruits." )


	AddNpcMission(	1740	)
	AddNpcMission (	1936	)
	AddNpcMission (	1951	)
	AddNpcMission (	381	)
	AddNpcMission (	382	)
----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤ÍßÀ×Ã×--03
	AddNpcMission (5531 )
	AddNpcMission (5532 )
	
end

------------------------------------------------------------
-- ¸¥Àï¶Ø²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤·¨µÚ¶û
------------------------------------------------------------

function r_talk184()

	Talk( 1, "Fardell: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )


	AddNpcMission(	1739	)
	AddNpcMission (	1935	)
	AddNpcMission (	1950	)
	AddNpcMission (	383	)
	AddNpcMission (	384	)
	AddNpcMission (	385	)

	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤·¨µÚ¶û--03
	AddNpcMission (5529 )
	AddNpcMission (5530 )



end

------------------------------------------------------------
-- º£·çµº-----½»Ò×Ô±¡¤²¼¶û×È
------------------------------------------------------------

function r_talk185()

	Talk( 1, "Burgess: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 5 )
	TriggerAction( 1, TradeBerthList, 5 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)	

	Talk( 2, "Burgess: Sorry! You ship is not docked in Zephyr Harbor. Unable to trade." )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(5)
	SaleGoodsData(	0	,	4552	,	800	,	315	,	70	)
	SaleGoodsData(	1	,	4553	,	700	,	405	,	90	)
	SaleGoodsData(	1	,	4554	,	480	,	477	,	106	)

	BuyGoodsData(0,	4574	,	-1	,	697	,	155	)
	BuyGoodsData(0,	4578	,	-1	,	960	,	213	)
	BuyGoodsData(0,	4580	,	-1	,	972	,	648	)
	BuyGoodsData(0,	4582	,	-1	,	664	,	147	)
	BuyGoodsData(0,	4584	,	-1	,	818	,	181	)
	BuyGoodsData(0,	4586	,	-1	,	895	,	199	)
	BuyGoodsData(0,	4588	,	-1	,	969	,	646	)
	BuyGoodsData(0,	4590	,	-1	,	725	,	161	)
	BuyGoodsData(0,	4592	,	-1	,	1017	,	226	)
	BuyGoodsData(0,	4594	,	-1	,	1071	,	238	)
	BuyGoodsData(0,	4598	,	-1	,	888	,	197	)
	BuyGoodsData(0,	4599	,	-1	,	955	,	213	)
	BuyGoodsData(0,	4601	,	-1	,	991	,	661	)
	BuyGoodsData(0,	4557	,	-1	,	981	,	218	)
	BuyGoodsData(0,	4560	,	-1	,	1124	,	249	)
	BuyGoodsData(0,	4563	,	-1	,	976	,	217	)
	BuyGoodsData(0,	4566	,	-1	,	763	,	169	)
	BuyGoodsData(0,	4569	,	-1	,	981	,	218	)
	BuyGoodsData(0,	4572	,	-1	,	950	,	211	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()



	AddNpcMission	(760)
		
end

------------------------------------------------------------
-- Ëé±ùµº-----½»Ò×Ô±¡¤ÈüÉªÄá
------------------------------------------------------------

function r_talk186()

	Talk( 1, "Sacenis: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 6 )
	TriggerAction( 1, TradeBerthList, 6 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)

	Talk( 2, "Sacenis: Sorry, you do not have any ships docked in Glacier Harbor. Unable to trade." )
	
	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(6)
	SaleGoodsData(	1	,	4555	,	480	,	405	,	90	)
	SaleGoodsData(	2	,	4556	,	300	,	468	,	104	)
	SaleGoodsData(	2	,	4557	,	240	,	522	,	116	)

	BuyGoodsData(0,	4573	,	-1	,	554	,	123	)
	BuyGoodsData(0,	4574	,	-1	,	711	,	158	)
	BuyGoodsData(0,	4575	,	-1	,	780	,	173	)
	BuyGoodsData(0,	4585	,	-1	,	936	,	208	)
	BuyGoodsData(0,	4586	,	-1	,	970	,	215	)
	BuyGoodsData(0,	4590	,	-1	,	699	,	155	)
	BuyGoodsData(0,	4592	,	-1	,	963	,	214	)
	BuyGoodsData(0,	4594	,	-1	,	997	,	221	)
	BuyGoodsData(0,	4596	,	-1	,	1027	,	685	)
	BuyGoodsData(0,	4597	,	-1	,	855	,	190	)
	BuyGoodsData(0,	4600	,	-1	,	857	,	571	)
	BuyGoodsData(0,	4554	,	-1	,	991	,	221	)
	BuyGoodsData(0,	4558	,	-1	,	828	,	184	)
	BuyGoodsData(0,	4559	,	-1	,	910	,	203	)
	BuyGoodsData(0,	4562	,	-1	,	819	,	183	)
	BuyGoodsData(0,	4563	,	-1	,	879	,	195	)
	BuyGoodsData(0,	4566	,	-1	,	831	,	185	)
	BuyGoodsData(0,	4569	,	-1	,	1126	,	251	)
	BuyGoodsData(0,	4572	,	-1	,	924	,	205	)


	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()
		
	AddNpcMission	(761)
end

------------------------------------------------------------
-- Ñ©Ôôµº-----½»Ò×Ô±¡¤·Ê¾¨µÂÀ­µÂ
------------------------------------------------------------

function r_talk187()

	Talk( 1, "Dilady: Hi, I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 7 )
	TriggerAction( 1, TradeBerthList, 7 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)

	Talk( 2, "Dilady: Sorry, you do not have any ships docked in Outlaw Harbor. Unable to trade." )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")


	InitGoods(7)
	SaleGoodsData(	2	,	4558	,	300	,	450	,	100	)
	SaleGoodsData(	2	,	4559	,	240	,	495	,	110	)
	SaleGoodsData(	3	,	4560	,	60	,	571	,	127	)

	BuyGoodsData(0,	4576	,	-1	,	898	,	199	)
	BuyGoodsData(0,	4577	,	-1	,	930	,	207	)
	BuyGoodsData(0,	4585	,	-1	,	936	,	208	)
	BuyGoodsData(0,	4587	,	-1	,	938	,	625	)
	BuyGoodsData(0,	4589	,	-1	,	548	,	121	)
	BuyGoodsData(0,	4591	,	-1	,	844	,	187	)
	BuyGoodsData(0,	4593	,	-1	,	972	,	216	)
	BuyGoodsData(0,	4595	,	-1	,	900	,	600	)
	BuyGoodsData(0,	4597	,	-1	,	881	,	195	)
	BuyGoodsData(0,	4599	,	-1	,	945	,	210	)
	BuyGoodsData(0,	4600	,	-1	,	866	,	577	)
	BuyGoodsData(0,	4554	,	-1	,	1020	,	227	)
	BuyGoodsData(0,	4555	,	-1	,	793	,	177	)
	BuyGoodsData(0,	4556	,	-1	,	860	,	191	)
	BuyGoodsData(0,	4557	,	-1	,	960	,	213	)
	BuyGoodsData(0,	4561	,	-1	,	808	,	179	)
	BuyGoodsData(0,	4566	,	-1	,	876	,	195	)
	BuyGoodsData(0,	4569	,	-1	,	1089	,	243	)
	BuyGoodsData(0,	4572	,	-1	,	924	,	205	)



	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()


	AddNpcMission	(762)	
end

------------------------------------------------------------
-- ±ùÑ©µº-----º£¸ÛÖ¸»Ó¡¤²¨¶û
------------------------------------------------------------

function r_talk188()

	Talk( 1, "Paul: Hi! I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 8 )
	TriggerAction( 1, LuanchBerthList, 8, 2351, 767, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 8 )
	TriggerAction( 2, RepairBerthList, 8 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 8 )
	TriggerAction( 2, SupplyBerthList, 8 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 8 )
	TriggerAction( 1, SalvageBerthList, 8 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
	
end

------------------------------------------------------------
-- ÃùÉ³µº-----º£¸ÛÖ¸»Ó¡¤ÍÐÂê
------------------------------------------------------------

function t_tomas()

	Talk( 1, "Òîìà?Ïðèâåò ñêîð?ÿ áóäó ÷ò?òî ìå?òü" )
	
	
end

------------------------------------------------------------
-- Õæ°®µº-----º£¸ÛÖ¸»Ó¡¤ÏÄµÂÀû
------------------------------------------------------------
function r_talk190()

	Talk( 1, "Xad: Hi, I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 10 )
	TriggerAction( 1, LuanchBerthList, 10, 2527, 2358, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 10 )
	TriggerAction( 2, RepairBerthList, 10 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 10 )
	TriggerAction( 2, SupplyBerthList, 10 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 10 )
	TriggerAction( 1, SalvageBerthList, 10 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
end

------------------------------------------------------------
-- ËÕ¸Û²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤Â³Î÷
------------------------------------------------------------
function r_talk191()

	Talk( 1, "Luigi: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )
	 -------------¼ªÄáË¹--ËÕ¸Û²¹¸øÕ¾,º£¸ÛÖ¸»Ó¡¤Â³Î÷(464,468)--03
	AddNpcMission (5527 )
	AddNpcMission (5528 )


end

------------------------------------------------------------
-- °£¸¥Àï²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤²¼Å¦
------------------------------------------------------------
function r_talk192()

	Talk( 1, "Buni: Hi, I am the harbor operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	AddNpcMission ( 304 )
	AddNpcMission ( 305 )
	AddNpcMission(	1743	)
	AddNpcMission (	1939	)
	AddNpcMission (	1954	)
	AddNpcMission (	386	)
	AddNpcMission (	387	)

	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤²¼Å¦--03
	AddNpcMission (5525 )
	AddNpcMission (5526 )
end


------------------------------------------------------------
-- À­¹Å²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤¶àÁ®´ï
------------------------------------------------------------
function r_talk193()

	Talk( 1, "Domoru: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	AddNpcMission(	1441	)
	AddNpcMission (	1931	)

	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤¶àÁ®´ï--03
	AddNpcMission (5523 )
	AddNpcMission (5524 )


end

------------------------------------------------------------
-- ÆäË÷µ¥²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤ÌØ°ÍÆë¶û
------------------------------------------------------------
function r_talk194()

	Talk( 1, "Teba: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

end

------------------------------------------------------------
-- ÄÂÄÂ¶û²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤°Í°Â
------------------------------------------------------------
function r_talk195()

	Talk( 1, "Baros: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	AddNpcMission ( 291 )
	AddNpcMission ( 292 )
	AddNpcMission ( 293 )
	AddNpcMission(	1443	)
	AddNpcMission (	1932	)

	


end

------------------------------------------------------------
-- Ð¡¿Ï²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤µÏµÏÈø
------------------------------------------------------------
function r_talk196()

	Talk( 1, "Didane: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )
	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤µÏµÏÈø--03
	AddNpcMission (5515 )
	AddNpcMission (5516 )
end

------------------------------------------------------------
-- Ð¤·Ð²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤µ¤ÄáË¹
------------------------------------------------------------
function r_talk197()

	Talk( 1, "Dannis: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	----------------1.7
	AddNpcMission (5133 )
	AddNpcMission (5134 )
	AddNpcMission (5135 )

	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤µ¤ÄáË¹--03
	AddNpcMission (5513 )
	AddNpcMission (5514 )
end

------------------------------------------------------------
-- °£Æ¤¶Å²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤Ë÷¶û
------------------------------------------------------------
function r_talk198()

	Talk( 1, "Soc: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )
	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤Ë÷¶û--03
	AddNpcMission (5517 )
	AddNpcMission (5518 )
end

------------------------------------------------------------
-- ±ùÑ©µº-----½»Ò×Ô±¡¤Î÷¶û°à
------------------------------------------------------------

function r_talk199()

	Talk( 1, "Sibun: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 8 )
	TriggerAction( 1, TradeBerthList, 8 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)

	Talk( 2, "Sibun: Sorry! You do not have any ships docked in Harbor of Chill. Unable to trade" )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(8)
	SaleGoodsData(	1	,	4561	,	480	,	400	,	89	)
	SaleGoodsData(	2	,	4562	,	300	,	436	,	97	)
	SaleGoodsData(	2	,	4563	,	240	,	468	,	104	)

	BuyGoodsData(0,	4578	,	-1	,	1014	,	225	)
	BuyGoodsData(0,	4580	,	-1	,	1056	,	705	)
	BuyGoodsData(0,	4586	,	-1	,	936	,	208	)
	BuyGoodsData(0,	4588	,	-1	,	1042	,	695	)
	BuyGoodsData(0,	4590	,	-1	,	673	,	149	)
	BuyGoodsData(0,	4592	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4594	,	-1	,	954	,	212	)
	BuyGoodsData(0,	4596	,	-1	,	955	,	637	)
	BuyGoodsData(0,	4598	,	-1	,	954	,	212	)
	BuyGoodsData(0,	4599	,	-1	,	988	,	219	)
	BuyGoodsData(0,	4601	,	-1	,	1049	,	699	)
	BuyGoodsData(0,	4554	,	-1	,	1077	,	239	)
	BuyGoodsData(0,	4556	,	-1	,	879	,	195	)
	BuyGoodsData(0,	4558	,	-1	,	837	,	186	)
	BuyGoodsData(0,	4559	,	-1	,	920	,	205	)
	BuyGoodsData(0,	4560	,	-1	,	1039	,	231	)
	BuyGoodsData(0,	4566	,	-1	,	854	,	189	)
	BuyGoodsData(0,	4569	,	-1	,	1052	,	233	)
	BuyGoodsData(0,	4572	,	-1	,	872	,	193	)


	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()


	
end

------------------------------------------------------------
-- ÃùÉ³µº-----½»Ò×Ô±¡¤Ã×Ë÷ÑÇË¹
------------------------------------------------------------
------------------------------------------------------------
-- Õæ°®µº-----½»Ò×Ô±¡¤ÓÈ¿¨
------------------------------------------------------------

function r_talk201()

	Talk( 1, "Yuka: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 10 )
	TriggerAction( 1, TradeBerthList, 10 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)
	
	Talk( 2, "Yuka: Sorry! You do not have any ships docked in Cupid Harbor. Unable to trade" )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(10)
	SaleGoodsData(	1	,	4567	,	600	,	360	,	80	)
	SaleGoodsData(	2	,	4568	,	400	,	468	,	104	)
	SaleGoodsData(	2	,	4569	,	240	,	522	,	116	)

	BuyGoodsData(0,	4576	,	-1	,	924	,	205	)
	BuyGoodsData(0,	4577	,	-1	,	999	,	223	)
	BuyGoodsData(0,	4578	,	-1	,	1014	,	225	)
	BuyGoodsData(0,	4582	,	-1	,	664	,	147	)
	BuyGoodsData(0,	4584	,	-1	,	818	,	181	)
	BuyGoodsData(0,	4589	,	-1	,	542	,	121	)
	BuyGoodsData(0,	4593	,	-1	,	904	,	201	)
	BuyGoodsData(0,	4595	,	-1	,	846	,	564	)
	BuyGoodsData(0,	4597	,	-1	,	986	,	219	)
	BuyGoodsData(0,	4599	,	-1	,	1061	,	235	)
	BuyGoodsData(0,	4600	,	-1	,	1017	,	678	)
	BuyGoodsData(0,	4554	,	-1	,	991	,	221	)
	BuyGoodsData(0,	4557	,	-1	,	1126	,	251	)
	BuyGoodsData(0,	4560	,	-1	,	1220	,	271	)
	BuyGoodsData(0,	4563	,	-1	,	943	,	209	)
	BuyGoodsData(0,	4564	,	-1	,	577	,	129	)
	BuyGoodsData(0,	4565	,	-1	,	666	,	149	)
	BuyGoodsData(0,	4570	,	-1	,	550	,	123	)
	BuyGoodsData(0,	4571	,	-1	,	842	,	187	)





	
	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()


end

------------------------------------------------------------
-- ºÃÔËµº-----º£¸ÛÖ¸»Ó¡¤Â¬¿Ë
------------------------------------------------------------
function r_talk202()

	Talk( 1, "Hux: Hi! I am the Harbor Operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 11 )
	TriggerAction( 1, LuanchBerthList, 11, 1642, 2005, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 11 )
	TriggerAction( 2, RepairBerthList, 11 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 11 )
	TriggerAction( 2, SupplyBerthList, 11 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 11 )
	TriggerAction( 1, SalvageBerthList, 11 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
end

------------------------------------------------------------
-- ÈøµÏÀÕ²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤ÇÇ¶ûÇÇÄá
------------------------------------------------------------
function r_talk203()

	Talk( 1, "Gregory: Hi! I am in charge of ship refuel. Is there anything you need?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )

	AddNpcMission(	1741	)
	AddNpcMission (	1937	)
	AddNpcMission (	1952	)
	------------------eleven
	AddNpcMission (	5063 )
	AddNpcMission (	5071 )
--------------------1.7
	AddNpcMission ( 5075	)
	AddNpcMission(	5091 )
	AddNpcMission (5105 )
	AddNpcMission (5106 )
	AddNpcMission (5107 )
	AddNpcMission (5108 )
	AddNpcMission (5115 )
	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤ÇÇ¶ûÇÇÄá--03
	AddNpcMission (5521 )
	AddNpcMission (5522 )
	--Ñâÿùåííûé îãîí?
	AddNpcMission	(6260)
	AddNpcMission	(6261)
end

------------------------------------------------------------
-- ¿¨ÂíÈü²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤°ÂµÇ
------------------------------------------------------------
function r_talk204()

	Talk( 1, "Odie: Hi, I am the harbor operator. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )
	----------------¼ªÄáË¹---º£¸ÛÖ¸»Ó¡¤°ÂµÇ--03
	AddNpcMission (5519 )
	AddNpcMission (5520 )
end

------------------------------------------------------------
-- Ë¼Ë¼Ë÷²¹¸øÕ¾-----º£¸ÛÖ¸»Ó¡¤À­Ã×ÐÞ
------------------------------------------------------------
function r_talk205()

	Talk( 1, "Ramus: Hi! I am in charge of the ship refuel here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 1 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 4, "Sorry! Repair need 1000G" )
	Talk( 5, "Sorry! Refuel needs a fee of 200G" )
end

------------------------------------------------------------
-- ºÃÔËµº-----½»Ò×Ô±¡¤ÅÁµÂÁðË¹
------------------------------------------------------------

function r_talk206()

	Talk( 1, "Bowey: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 11 )
	TriggerAction( 1, TradeBerthList, 11 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)

	Talk( 2, "Bowey: Sorry, you do not have any ships docked in Harbor of Fortune. Unable to trade." )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(11)
	SaleGoodsData(	1	,	4570	,	560	,	270	,	60	)
	SaleGoodsData(	1	,	4571	,	360	,	405	,	90	)
	SaleGoodsData(	2	,	4572	,	200	,	432	,	96	)

	BuyGoodsData(0,	4577	,	-1	,	1059	,	235	)
	BuyGoodsData(0,	4578	,	-1	,	1089	,	243	)
	BuyGoodsData(0,	4579	,	-1	,	1049	,	699	)
	BuyGoodsData(0,	4583	,	-1	,	740	,	165	)
	BuyGoodsData(0,	4584	,	-1	,	866	,	193	)
	BuyGoodsData(0,	4589	,	-1	,	537	,	119	)
	BuyGoodsData(0,	4591	,	-1	,	807	,	179	)
	BuyGoodsData(0,	4592	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4597	,	-1	,	986	,	219	)
	BuyGoodsData(0,	4599	,	-1	,	1061	,	235	)
	BuyGoodsData(0,	4600	,	-1	,	1017	,	678	)
	BuyGoodsData(0,	4554	,	-1	,	1106	,	245	)
	BuyGoodsData(0,	4557	,	-1	,	1089	,	243	)
	BuyGoodsData(0,	4560	,	-1	,	1220	,	271	)
	BuyGoodsData(0,	4562	,	-1	,	881	,	195	)
	BuyGoodsData(0,	4563	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4566	,	-1	,	808	,	179	)
	BuyGoodsData(0,	4568	,	-1	,	879	,	195	)
	BuyGoodsData(0,	4569	,	-1	,	981	,	218	)


	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()	


	

end

------------------------------------------------------------
-- À×öª±¤¾ü¸Û-----º£¸ÛÖ¸»Ó¡¤²é¿É·òÖÐÎ¾
------------------------------------------------------------
function r_talk207()

	Talk( 1, "Lt. Wayne: Hi! I am the Harbor Operator. Can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 2 )
	TriggerAction( 1, LuanchBerthList, 2, 1064, 1324, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 2 )
	TriggerAction( 2, RepairBerthList, 2 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 2 )
	TriggerAction( 2, SupplyBerthList, 2 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 2 )
	TriggerAction( 1, SalvageBerthList, 2 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked in this harbor. Please pay 1000G." )
	Talk( 5, "Sorry, you need to dock your ship in our harbor in order to refuel. Please pay 200G" )
	Talk( 6, "Sorry! We only salvage ships docked in our harbor. You have to pay a fee of 1000G." )
end

------------------------------------------------------------
-- É³á°ÐÂ³Ç-----½»Ò×Ô±¡¤Î÷¶à·ò
------------------------------------------------------------

function r_talk208()
	Talk( 1, "Ñèäî? Ïðèâåò! ?ìåñòíû?êóïå? ×å?ÿ ìîãó ïîìî÷ü? ")
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3 )
	TriggerAction( 1, TradeBerthList, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Òîðã ãðóçîì  ", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Óçíàòü ?ïîâûøåíè?óðîâ? òîðãîâîé ëèöåíçèè ",JumpPage, 3)

	Talk( 2, "Ñèäî? ïðîñòèòå íî ?âà?íå?êîðàáëÿ ?ìåñòíî?ïîðò? ")

	Talk( 3, "Ïðèâåò! Åñëè âû õîòèòå òîðãîâàò? òî âû íóæäàåòåñü ?òîðãîâîé ëèöåíçèè. Óçíàòü ?òîðãîâîé ëèöåíçèè ìîæí??êóïö?Øàéòàí? ")
	Text( 3, "Óçíàòü ?íàëîãå ",JumpPage, 7)
	Text( 3, "Ëèöåíç? íèçêîã?óðîâ? ",JumpPage, 4)
	Text( 3, "Ëèöåíç? ñòàíäàðòíîãî óðîâ? ",JumpPage, 5)
	Text( 3, "Ëèöåíç? âûñøåã?óðîâ? ",JumpPage, 6)

	Talk( 4, "Ëèöåíçèþ íèçêîã?óðîâ? ïîëó÷èòü íåñëîæíî. Äëÿ ýòîã?âà?íàäî áûòü íå ìåíå?20 óðîâ? ?íàéò?êóïö?Øàéòàí? ")
	Talk( 5, "×òîá?ïîëó÷èòü ëèöåíçèþ ñòàíäàðòíîãî óðîâ? âû äîëæíû áûòü íå ìåíå?40 óðîâ? ?èìåò?íå áîëüøå 20% íàëîãà ")
	Talk( 6, "×òîá?ïîëó÷èòü ëèöåíçèþ âûñøåã?óðîâ? âû äîëæíû áûòü íå ìåíå?60 óðîâ? ?èìåò?íå áîëüøå 10% íàëîãà ")
	Talk( 7, "Òåêóùè?óðîâåí?íàëîãà âû ìîæåòå óâèäåò?íà âàøå?òîðãîâîé ëèöåíçèè. Îí âë?åò íà ñòîèìîñò?ïîêóïê??ïðîäàæ?òîâàðà òîðãîâöà? ")

	InitGoods(3)
	SaleGoodsData(	0	,	4581	,	900	,	270	,	60	)
	SaleGoodsData(	0	,	4582	,	800	,	319	,	71	)
	SaleGoodsData(	1	,	4583	,	700	,	355	,	79	)
	SaleGoodsData(	1	,	4584	,	480	,	405	,	90	)
	SaleGoodsData(	2	,	4585	,	300	,	450	,	100	)
	SaleGoodsData(	2	,	4586	,	240	,	481	,	107	)
	SaleGoodsData(	3	,	4587	,	60	,	549	,	122	)
	SaleGoodsData(	3	,	4588	,	40	,	639	,	142	)

	BuyGoodsData(0,	4573	,	-1	,	560	,	125	)
	BuyGoodsData(0,	4575	,	-1	,	798	,	177	)
	BuyGoodsData(0,	4577	,	-1	,	930	,	207	)
	BuyGoodsData(0,	4589	,	-1	,	548	,	121	)
	BuyGoodsData(0,	4591	,	-1	,	844	,	187	)
	BuyGoodsData(0,	4593	,	-1	,	972	,	216	)
	BuyGoodsData(0,	4595	,	-1	,	900	,	600	)
	BuyGoodsData(0,	4598	,	-1	,	954	,	212	)
	BuyGoodsData(0,	4599	,	-1	,	988	,	219	)
	BuyGoodsData(0,	4552	,	-1	,	655	,	145	)
	BuyGoodsData(0,	4553	,	-1	,	807	,	179	)
	BuyGoodsData(0,	4557	,	-1	,	1052	,	233	)
	BuyGoodsData(0,	4560	,	-1	,	1172	,	261	)
	BuyGoodsData(0,	4563	,	-1	,	909	,	202	)
	BuyGoodsData(0,	4564	,	-1	,	577	,	129	)
	BuyGoodsData(0,	4566	,	-1	,	740	,	165	)
	BuyGoodsData(0,	4568	,	-1	,	870	,	193	)
	BuyGoodsData(0,	4569	,	-1	,	970	,	215	)
	BuyGoodsData(0,	4572	,	-1	,	872	,	193	)
	BuyGoodsData(0,	4547	,	-1	,	200	,	0	)
	BuyGoodsData(0,	4549	,	-1	,	360	,	0	)
	BuyGoodsData(0,	4550	,	-1	,	1000	,	0	)
	BuyGoodsData(0,	4551	,	-1	,	20	,	0	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()

	
end

------------------------------------------------------------
-- ±ùÀÇ±¤-----½»Ò×Ô±¡¤ÅåÂ³Åµ
------------------------------------------------------------

function r_talk209()

	Talk( 1, "Pahniro: Hi! I am in charge of the trade here. How can I help you?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 4 )
	TriggerAction( 1, TradeBerthList, 4 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Cargo Trade", MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 1, "Regarding High Lv Commerce Permit",JumpPage, 3)
	
	Talk( 2, "Pahniro: Sorry, you do not have any ships docked in Icicle Harbor. Unable to trade." )	

	Talk( 3, "Hi! If you want to get rich, then you will need a \"Commerce Permit!\" With it you can have more products for commerce trade and also reduce your capital to maximize your profits! Currently, players can only obtain Commerce Permit from Shaitan Trading Post.")
	Text( 3, "Regarding Tax Rate",JumpPage, 7)
	Text( 3, "Low Lv Commerce Permit",JumpPage, 4)
	Text( 3, "Mid Lv Commerce Permit",JumpPage, 5)
	Text( 3, "High Lv Commerce Permit",JumpPage, 6)

	Talk( 4, "Low Lv Commerce Permit is easy to obtain. When you reaches Lv 20, go to the trading post in Shaitan and complete a simple task to have one.")
	Talk( 5, "When you reaches Lv 40 and reduces your tax rate to 20%, you can go to Shaitan Trading Post and obtain a Mid Lv Commerce Permit.")
	Talk( 6, "When you have reached level 60 and possess a Commerce Permit with 10% tax, you can activate the quest for High Lv Commerce.")
	Talk( 7, "Check your Commerce Permit to see the current Tax Rate imposed on your product when you sell it to any trader. Complete some quest at Shaitan Trading Post to reduce the Tax Rate.")

	InitGoods(4)
	SaleGoodsData(	0	,	4589	,	900	,	161	,	57	)
	SaleGoodsData(	0	,	4590	,	800	,	238	,	84	)
	SaleGoodsData(	1	,	4591	,	700	,	297	,	105	)
	SaleGoodsData(	1	,	4592	,	600	,	425	,	150	)
	SaleGoodsData(	2	,	4593	,	400	,	467	,	165	)
	SaleGoodsData(	2	,	4594	,	240	,	561	,	198	)
	SaleGoodsData(	3	,	4595	,	120	,	612	,	216	)
	SaleGoodsData(	1	,	4596	,	80	,	705	,	249	)

	BuyGoodsData(0,	4577	,	-1	,	750	,	643	)
	BuyGoodsData(0,	4578	,	-1	,	802	,	689	)
	BuyGoodsData(0,	4582	,	-1	,	471	,	403	)
	BuyGoodsData(0,	4584	,	-1	,	691	,	593	)
	BuyGoodsData(0,	4586	,	-1	,	737	,	633	)
	BuyGoodsData(0,	4597	,	-1	,	728	,	625	)
	BuyGoodsData(0,	4599	,	-1	,	1092	,	936	)
	BuyGoodsData(0,	4600	,	-1	,	1139	,	977	)
	BuyGoodsData(0,	4554	,	-1	,	844	,	725	)
	BuyGoodsData(0,	4557	,	-1	,	892	,	765	)
	BuyGoodsData(0,	4560	,	-1	,	992	,	851	)
	BuyGoodsData(0,	4561	,	-1	,	627	,	539	)
	BuyGoodsData(0,	4562	,	-1	,	649	,	557	)
	BuyGoodsData(0,	4563	,	-1	,	735	,	630	)
	BuyGoodsData(0,	4566	,	-1	,	569	,	487	)
	BuyGoodsData(0,	4568	,	-1	,	710	,	609	)
	BuyGoodsData(0,	4569	,	-1	,	761	,	653	)
	BuyGoodsData(0,	4571	,	-1	,	596	,	511	)
	BuyGoodsData(0,	4547	,	-1	,	300	,	0	)
	BuyGoodsData(0,	4550	,	-1	,	1000	,	0	)
	BuyGoodsData(0,	4548	,	-1	,	300	,	0	)
	BuyGoodsData(0,	4551	,	-1	,	20	,	0	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()


end

------------------------------------------------------------
-- À×öª±¤¾ü¸Û-----´¬¹¤¡¤°¢º©
------------------------------------------------------------
function r_talk210 ()
		
	Talk( 1, "Ïðèâåò ìî?? òåáå íóæå?êîðàáë? Íó âûáåðà?" )
	InitTrigger()
	TriggerCondition( 1, IsBoatFull )
	TriggerAction( 1, SystemNotice, "Ships limit reached. Unable to build more ship" )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Ñîçäàò?êîðàáë?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 2 )
	TriggerAction( 1, BoatLevelBerthList, 2 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Àïãðåéäèòü ", MultiTrigger, GetMultiTrigger(), 1 )
	
	Talk( 2, "Ñèíäáà? êàêî?êîðàáë?æåëàåò?ïîñòðîèò? ")
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 1 )
	TriggerAction( 1, CreateBoat, 1, 1 )
	Text( 2, "Ïîñòðîèò?Ãóïï?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 2 )
	TriggerAction( 1, CreateBoat, 2, 1 )
	Text( 2, "Ïîñòðîèò?Òðàíñïîðòå?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 3 )
	TriggerAction( 1, CreateBoat, 3, 1 )
	Text( 2, "Ïîñòðîèò?Ëåòó÷ó?ðûáó ", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, BoatBuildCheck, 6 )
	TriggerAction( 1, CreateBoat, 6, 1 )
	Text( 2, "Ïîñòðîèò?Ðûáó-ìå?", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 3, "Àòòà? ×òîá?àïäåéòèò?ñâîé êîðàáë? íàõîäèñü áîëüøå ?ìîðå ?óáèâàé ìîíñòðîâ, çà ýò?òåáå áóäó?äàâàòü êîðàáåëüíû?îïûò." )
end 
----------------------
function r_talk214()

	Talk( 1, "Huradar: Hi! I am the Freights NPC here. I can help you load the products up your ship if it is docked in Argent Harbor." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 1)
	TriggerAction( 1, PackBagList, 1, RES_MINE, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Crystal", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Huradar: Hi! Your ship is not docked in Argent Harbor" )
		
end

------------------------------------------------------------
-- À×öª±¤¾ü¸Û-----´ò°üÈË¡¤·ÑµÂË÷À­
------------------------------------------------------------

function r_talk215()

	Talk( 1, "Fernando: Hi! I am the Freights NPC here. I can help you load the products up your ship if it is docked in Thundoria Harbor." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 2)
	TriggerAction( 1, PackBagList, 2, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Fernando: Hey there! You do not have any ships docked at Thundoria Harbor" )
		
end

------------------------------------------------------------
-- °×ÒøÁÖÇø-----´ò°üÈË¡¤Ä¦¸ù
------------------------------------------------------------

function r_talk216()

	Talk( 1, "Moken: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Argent Harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 1)
	TriggerAction( 1, PackBagList, 1, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Moken: Hey there! You do not have any ships docked at Argent Harbor" )

	AddNpcMission(	1436	)
	AddNpcMission (	1930	)
		
end

------------------------------------------------------------
-- ±ùÑ©µº-----´ò°üÈË¡¤°¢ÀïÎ÷Ë¹
------------------------------------------------------------

function r_talk217()

	Talk( 1, "Alexis: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Harbor of Chill" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 8)
	TriggerAction( 1, PackBagList, 8, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Alexis: Hi! You do not have any ships docked in Harbor of Chill." )
		
end

------------------------------------------------------------
-- ÃùÉ³µº-----´ò°üÈË¡¤ÒÁ¼Ó¿¨°à
------------------------------------------------------------

function r_talk218()

	Talk( 1, "Yevgeni: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Canary Harbor." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 9)
	TriggerAction( 1, PackBagList, 9, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Yevgeni: Hi! You do not have any ships docked in Canary Harbor." )
		
end

function r_talk220()

	Talk( 1, "Alkins: Hi! I am the Freights NPC here. I can help you load the products up your ship if it is docked in Icicle Harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 4)
	TriggerAction( 1, PackBagList, 4, RES_MINE, 2 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Iron Ore", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 4)
	TriggerAction( 1, PackBagList, 4, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Alkins: Hi! You do not have any ships docked in Icicle Harbor" )

	AddNpcMission(	1581	)
	AddNpcMission (	1933	)

	
end


------------------------------------------------------------
-- ¿¨¶û¼ÓµÂÑ©Ô­-----´ò°üÈË¡¤¿²±´¶û
------------------------------------------------------------

function r_talk243()

	Talk( 1, "Canari: Hi! I am the Freights NPC here. I can help you load the products up your ship if it is docked in Thundoria Harbor." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 2)
	TriggerAction( 1, PackBagList, 2, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Canari: Hi! You do not have any ships docked in Thundoria Harbor" )
		
end

------------------------------------------------------------
-- µÂ¶ûÎ¬Æ½Ô­-----´ò°üÈË¡¤Ë÷À­Ë¹
------------------------------------------------------------

function r_talk244()

	Talk( 1, "Soraris: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Argent Harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 1)
	TriggerAction( 1, PackBagList, 1, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Soraris: Hey, you do not have any ships docked in Argent Harbor." )

end



------------------------------------------------------------
-- ÅÁ¿Ë»ÄÄ®-----´ò°üÈË¡¤°²ÈûÀ­
------------------------------------------------------------

function r_talk245()

	Talk( 1, "Ansto: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Shaitan Harbor." )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3)
	TriggerAction( 1, PackBagList, 3, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Ansto: Hi! You do not have any ship docked at Shaitan Harbor" )
		
end


------------------------------------------------------------
-- ±ù¼«-----´ò°üÈË¡¤°¢¼ÓÎ÷
------------------------------------------------------------

function r_talk246()

	Talk( 1, "Jas: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Icicle Harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 4)
	TriggerAction( 1, PackBagList, 4, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Jas: Hi friend! You do not have any ships docked here in Icicle Harbor" )
	
end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----¸Û¿ÚÖ¸»Ó¡òÃÔ
------------------------------------------------------------
function r_talk247()

	Talk( 1, "Mist: Hi, I can help you salvage any sunken ships in this mysterious land. Do you need any help?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 1341, 3257, 0 )
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
	Talk( 4, "Sorry I only repair ships docked at Mystery Harbor. Please pay 1000G" )
	Talk( 5, "Sorry! I only refuel ships docked at Maze Harbor. Please pay 200G as repair fee." )
	Talk( 6, "Sorry, I only salvage sunken ship docked in Maze Harbor. Please pay 1000G" )

end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°±±²¿ÉÌµêº£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk248()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 116, 51, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	

end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°±±²¿ÖÐÑëº£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk249()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 235, 123, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	

end


------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°¶«²¿º£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk250()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 248, 352, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	

end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°ÄÏ²¿ÉÌµêº£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk251()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 353, 428, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )


end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°±±²¿ÏÂº£º£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk257()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 231,211, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )


end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Ð¡»¨Ô°ÄÏ²¿ÏÂº£º£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk258()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 231,256, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )


end


------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----Òõ°µÕÓÔóº£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk261()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 295, 352, 0 )
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
	Talk( 4, "Sorry I only repair ships docked at Mystery Harbor. Please pay 1000G" )
	Talk( 5, "Sorry! I only refuel ships docked at Maze Harbor. Please pay 200G as repair fee." )
	Talk( 6, "Sorry, I only salvage sunken ship docked in Maze Harbor. Please pay 1000G" )

end

------------------------------------------------------------
-- ÃÔÖ®¸Û¿Ú-----·ÏÁéÖ®¶¼º£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk262()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 299, 321, 0 )
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
	Talk( 4, "Sorry I only repair ships docked at Mystery Harbor. Please pay 1000G" )
	Talk( 5, "Sorry! I only refuel ships docked at Maze Harbor. Please pay 200G as repair fee." )
	Talk( 6, "Sorry, I only salvage sunken ship docked in Maze Harbor. Please pay 1000G" )

end

----------------------------------------------------------
--							--
--							--
--		¾º¼¼»¨Ô°[ÉñÃØÉÌÈË]			--
--							--
--		225538,280188				--
----------------------------------------------------------
-----------------------------------------------------------ÕâÀï¿ªÊ¼P»°ÁÄÌì
function r_talk259 ()
	
	
	Talk( 1, "Mystery Merchant: Hi! I have some great stuff here! Want to have a look?" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 12 )
	TriggerAction( 1, TradeBerthList, 12 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Trade", MultiTrigger, GetMultiTrigger(), 1 )

	
	Talk( 2, "Mystery Merchant: Sorry, you do not have any ships docked in Mystery Harbor. Unable to trade." )
	
	InitGoods(12)
	SaleGoodsData(	0	,	1861	,	500	,	5000	,	5000	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 52, TE_GAMETIME, TT_CYCLETIME, 15, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()

	AddNpcMission 	(443)
	AddNpcMission 	(445)
	AddNpcMission 	(447)
	AddNpcMission	(1020)
	AddNpcMission	(1076)
	AddNpcMission	(1132)
	AddNpcMission	(1183)
	AddNpcMission(	1226	)
	
end 



------------------------------------------------------------
-- Ð¡»¨Ô°-----Ò©²ÝÉÌÈË
------------------------------------------------------------

function r_talk260()

	Talk( 1, "Physician: Hi, I have a variety of rare herbs, do you need any?" )
	Text( 1, "Trade", BuyPage )
	Text( 1, "Nothing, I am just looking around",CloseTalk )

	InitTrade()
	Other(	3460	)
	Other(	3461	)

end

------------------------------------------------------------
-- É³á°ÐÂ³Ç-----ÉñÃØº£¸ÛÖ¸»Ó
------------------------------------------------------------
function r_talk263()

	Talk( 1, "Ïðèâåò, ÿ âîçâðàùà??äàíæåé êîðàáë?" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 12 )
	TriggerAction( 1, LuanchBerthList, 12, 2261, 2825, 0 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Ïîïëûò?", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, RepairBerthList, 12 )
	TriggerFailure( 2, JumpPage, 3 )
	Text( 1, "Ïî÷èíèòü ", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 12 )
	TriggerAction( 2, SupplyBerthList, 12 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Çàïðàâèò?", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 12 )
	TriggerAction( 1, SalvageBerthList, 12 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 1, "Âîñòàíîâèò?", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 2, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 3, "Sorry I only repair ships docked at Mystery Harbor. Please pay 1000G" )
	Talk( 4, "Sorry! I only refuel ships docked at Maze Harbor. Please pay 200G as repair fee." )
	Talk( 5, "Sorry, I only salvage sunken ship docked in Maze Harbor. Please pay 1000G" )

end

----------------------------------------------------
--ÀÞÖ÷¹«»áÌØÊâÃ³Ò×Æ·
----------------------------------------------------
--¾ü»ðÉÌ


function r_talk264()
	Talk( 1, "Òîðãîâåö îðóæèå? Ïðèâåò! ?òîðãîâåö öåííûì îðóæèå? Îäíàêî ÿ äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé ïåðâîå ìåñò? ")
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3 )
	TriggerCondition( 1, HasGuildLevel, 1 )
	TriggerAction( 1, TradeBerthList, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Òîðã ", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 2, "Òîðãîâåö îðóæèå? ?äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé ïåâî?ìåñò? Êðîì?òîãî ?âà?äîëæåí áûòü êîðàáë??ïîðò?Øàéòàí? ")

	InitGoods(3)
	SaleGoodsData(	0	,	3914	,	150	,	990	,	220	)
	
	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()
end

--¾«ÃÜÒÇÆ÷¹©Ó¦ÉÌ	

function r_talk265()
	Talk( 1, "Òîðãîâåö ðåäêèì?ìàòåðèàëàì? Ïðèâåò! ?òîðãóþ ðåäêèì?ìàòåðèàëàì? Îäíàêî ÿ äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé âòîðîå ìåñò? ")
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3 )
	TriggerCondition( 1, HasGuildLevel, 2 )
	TriggerAction( 1, TradeBerthList, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Òîðã ãðóçîì  ", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 2, "Òîðãîâåö ðåäêèì?ìàòåðèàëàì? ?äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé âòîðîå ìåñò? Êðîì?òîãî ?âà?äîëæåí áûòü êîðàáë??ïîðò?Øàéòàí? ")

	InitGoods(3)
	SaleGoodsData(	0	,	3912	,	200	,	855	,	190	)

	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()
end

--Ï¡ÓÐ½ðÊô¹©Ó¦ÉÌ

function r_talk266()
	Talk( 1, "Òîðãîâåö ðåäêèì?ìåòàëëàì? Ïðèâåò! ?ïðîäàþ ðåäêèå ìåòàëë? Îäíàêî ÿ äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé òðåòüå ìåñò? ")
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3 )
	TriggerCondition( 1, HasGuildLevel, 3 )
	TriggerAction( 1, TradeBerthList, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Òîðã ãðóçîì  ", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 2, "Òîðãîâåö ðåäêèì?ìåòàëëàì? ?äîâå??ëèøü ÷ëåíàì ãèëüäè?çàíèìàþùåé òðåòüå ìåñò? Êðîì?òîãî ?âà?äîëæåí áûòü êîðàáë??ïîðò?Øàéòàí? ")

	InitGoods(3)
	SaleGoodsData(	0	,	3913	,	250	,	765	,	170	)
	
	InitTrigger()
	TriggerAction( 1, AddNpcTrigger, 51, TE_GAMETIME, TT_CYCLETIME, 30, 0 )
	SetNpcTrigger( GetTrigger( 1 ) )
	SetNpcActive()
end



------------------------------------------------------------
-- É³á°ÐÂ³Ç-----´ò°üÈË¡¤°¢ÀïÆßÆß
------------------------------------------------------------

function m_talk001()

	Talk( 1, "Ali Q: Yo! I am the Freights NPC. I will load your products for trading up your ship if it is docked in Shaitan Harbor" )
	InitTrigger()
	TriggerCondition( 1, HasBoatInBerth, 3)
	TriggerAction( 1, PackBagList, 3, RES_WOOD, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Load Wood", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Ali Q: Hi! You do not have any ships docked in Shaitan Harbor." )
		
end


------------------------------------------------------------
-- ÏÄµº±±¸Û-----º£¸ÛÖ¸»Ó
------------------------------------------------------------
function b_talk19()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 14 )
	TriggerAction( 1, LuanchBerthList, 14, 3662, 2645, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 14 )
	TriggerAction( 2, RepairBerthList, 14 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 14 )
	TriggerAction( 2, SupplyBerthList, 14 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 14 )
	TriggerAction( 1, SalvageBerthList, 14 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry I only repair ships docked at Summer Island northern harbor. Please pay 1000G" )
	Talk( 5, "Sorry! I only refuel ships docked at Summer Island Harbor. Please pay 200G" )
	Talk( 6, "Sorry! I only salvage sunken ships docked in northern Summer Island. Please pay 1000G." )

end


------------------------------------------------------------
-- ÏÄµºÄÏ¸Û-----º£¸ÛÖ¸»Ó
------------------------------------------------------------
function b_talk20()

	Talk( 1, "Operator: Hi! Do you wish to go sailing? Maybe I can help you" )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 15 )
	TriggerAction( 1, LuanchBerthList, 15, 3324, 3541, 0 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, RepairBoat )
	TriggerCondition( 2, HasBoatInBerth, 15 )
	TriggerAction( 2, RepairBerthList, 15 )
	TriggerFailure( 2, JumpPage, 4 )
	Text( 1, "Repair Ship", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasLuanchOut )
	TriggerAction( 1, SupplyBoat )
	TriggerCondition( 2, HasBoatInBerth, 15 )
	TriggerAction( 2, SupplyBerthList, 15 )
	TriggerFailure( 2, JumpPage, 5 )
	Text( 1, "Refuel", MultiTrigger, GetMultiTrigger(), 2 ) 
	InitTrigger()
	TriggerCondition( 1, HasDeadBoatInBerth, 15 )
	TriggerAction( 1, SalvageBerthList, 15 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 1, "Salvage Ship", MultiTrigger, GetMultiTrigger(), 1 ) 

	Talk( 3, "Sorry, you do not have a ship at the harbor or it was sunken. Please salvage it before setting sail again!" )
	Talk( 4, "Sorry! I only repair ships docked at southern Summer Island. Please pay 1000G as repair fee." )
	Talk( 5, "Sorry, I only refuel ships docked at Summer Island southern harbor. Please pay 200G" )
	Talk( 6, "Sorry! I only salvage ships docked in Summer Island. Please pay 1000G." )

end

-----------ºÚÊÐÉÌÈË
function leo_talk10()
 
    Talk( 1, "Òîðãîâåö íà ÷åðíîì ðûíê? Õî-õî, òà?ýò?òû ìå? èùåù? Õî-õî, ÷ò?òåáå íóæí? ")
    Text( 1, "Îñîáåííû?âåùè ", JumpPage, 2 )
    Text( 1, "Ïîñìîòðåòü àññîðòèìåí?", BuyPage)
 
    Talk( 2, " Òîðãîâåö ÷¸ðíîã?ðûíê? Äà âû î÷åí?äàæå îñâåäîìëåí?..")
    Text( 2, " Ïîçâîë?ìí?ñíà÷àë?âçãëÿíóòü íà òâîé òîâà?", SendExchangeData )
 
 
    InitExchange()
    DoExchange()
 
    InitTrade()
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
    Other(    rand()    )
 
    InitTrigger()
    TriggerAction( 1, AddNpcTrigger, 53, TE_GAMETIME, TT_CYCLETIME, 120, 4 )
    SetNpcTrigger( GetTrigger( 1 ) )
    SetNpcActive()
end

function rand()	--ºÚÊÐËæ»ú×°±¸ÁÐ±í
	local tabunknow = {}
	tabunknow[	1	] =	0088
	tabunknow[	2	] =	0089
	tabunknow[	3	] =	3302
	tabunknow[	4	] =	3303
	tabunknow[	5	] =	3304
	tabunknow[	6	] =	3305
	tabunknow[	7	] =	3306
	tabunknow[	8	] =	3307
	tabunknow[	9	] =	3308
	tabunknow[	10	] =	3309
	tabunknow[	11	] =	3310
	tabunknow[	12	] =	3311
	tabunknow[	13	] =	3312
	tabunknow[	14	] =	3313
	tabunknow[	15	] =	3314
	tabunknow[	16	] =	3315
	tabunknow[	17	] =	3316
	tabunknow[	18	] =	3317
	tabunknow[	19	] =	3318
	tabunknow[	20	] =	3319
	tabunknow[	21	] =	3320
	tabunknow[	22	] =	3321
	tabunknow[	23	] =	3322
	tabunknow[	24	] =	3323
	tabunknow[	25	] =	3324
	tabunknow[	26	] =	3325
	tabunknow[	27	] =	3326
	tabunknow[	28	] =	3327
	tabunknow[	29	] =	3328
	tabunknow[	30	] =	3329
	tabunknow[	31	] =	3330
	tabunknow[	32	] =	3331
	tabunknow[	33	] =	3332
	tabunknow[	34	] =	3333

	return tabunknow[math.floor(math.random(1,34))]
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÁã
------------------------------------------------------------
function star_talk001()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 148 , 154, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÒ»
------------------------------------------------------------
function star_talk002()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 169 , 176, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁã¶þ
------------------------------------------------------------
function star_talk003()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 168 , 111, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÈý
------------------------------------------------------------
function star_talk004()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 452 , 135, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãËÄ
------------------------------------------------------------
function star_talk005()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 496 , 164, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÎå
------------------------------------------------------------
function star_talk006()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 453 , 175, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÁù
------------------------------------------------------------
function star_talk007()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3 , 262 , 181, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤ÁãÁãÆß
------------------------------------------------------------
function star_talk008()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 348 , 175, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÁã
------------------------------------------------------------
function star_talk009()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 110 , 460, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end

------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÒ»
------------------------------------------------------------
function star_talk010()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 169 , 493, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛ¶þ
------------------------------------------------------------
function star_talk011()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 82 , 456, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÈý
------------------------------------------------------------
function star_talk012()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 463 , 453, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛËÄ
------------------------------------------------------------
function star_talk013()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 492 , 460, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÎå
------------------------------------------------------------
function star_talk014()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 453 , 506, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÁù
------------------------------------------------------------
function star_talk015()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 357 , 450, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end
------------------------------------------------------------
-- Ê¥Õ½-----º£¸ÛÖ¸»Ó¡¤çÛçÛÆß
------------------------------------------------------------
function star_talk016()
	Talk( 1, "Harbour Operator: Hi! I'm the Harbour Operator for this Sacred War. I have records of all boats docked at Shaitan Harbour. Please register with me before you set sail, else you will be disallowed." )
	InitTrigger()
	TriggerCondition( 1, HasAllBoatInBerth, 3 )
	TriggerAction( 1, LuanchBerthList, 3, 256 , 450, 180 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Set sail", MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2, "Sorry, your boat is not docked at this harbor." )
end