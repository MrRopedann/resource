print( "Loading NPCScript02.lua" )

function for_test()
	Talk( 1,  "Тестовый диалог (заглушка) " )
	Text( 1,  "Закрыть ",CloseTalk )
end

function t_kelili ()
	
	
	Talk( 1,  "Привет,укомплектовать твои руны кэль,или может репутацию? " )
	Text( 1,  "Укомплектовать руны Кэль ", JumpPage, 2)
	Text( 1,  "Открыть руны Кэль ", JumpPage, 3)
	Text( 1,  "Укомплектовать Репутацию ", JumpPage, 11)
	Text( 1,  "Обменять Свитки ", JumpPage, 24)
	
Talk( 2, "Я мигом укомплектую их " )
Text( 2,  "Малая коробка 10 штук  ", JumpPage, 4)
Text( 2,  "Малая коробка 10 штук (х10)  ", JumpPage, 6)
Text( 2,  "Малая коробка 10 штук (х100)  ", JumpPage, 27)
Text( 2,  "Большая коробка 100 штук  ", JumpPage, 5)
Text( 2,  "Большая коробка 100 штук (х10)  ", JumpPage, 18)
Text( 2,  "Большая коробка 100 штук (х100)  ", JumpPage, 28)
Text( 2,  "Огромная коробка 1000 штук  ", JumpPage, 19)
Text( 2,  "Огромная коробка 1000 штук (х10)  ", JumpPage, 29)

Talk( 3, "С лёгкостью открою их все " )
--Text( 3,  "Малая коробка 10 штук (х10)  ", JumpPage, 8)
Text( 3,  "Малая коробка 10 штук (х100)  ", JumpPage, 22)
Text( 3,  "Малая коробка 10 штук (х1000)  ", JumpPage, 23)
Text( 3,  "Средняя коробка 50 штук (х10)  ", JumpPage, 9)
Text( 3,  "Средняя коробка 50 штук (х100)  ", JumpPage, 30)
Text( 3,  "Средняя коробка 50 штук (х1000)  ", JumpPage, 31)
Text( 3,  "Большая коробка 100 штук (х10)  ", JumpPage, 16)
Text( 3,  "Большая коробка 100 штук (х100)  ", JumpPage, 17)
Text( 3,  "Большая коробка 100 штук (х1000)  ", JumpPage, 21)

Talk( 11, "Сегодня будет доступно,так что ожидать не долго " )
Text( 11,  "Укомплектуй 10 Репутации  ", JumpPage, 15)
Text( 11,  "Укомплектуй 50 Репутации  ", JumpPage, 12)
Text( 11,  "Укомплектуй 100 Репутации  ", JumpPage, 13)
Text( 11,  "Укомплектуй 500 Репутации  ", JumpPage, 14)
Text( 11,  "Укомплектуй 1000 Репутации  ", JumpPage, 32)

Talk( 4, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,10 )
TriggerAction( 1, GiveItem, 7450,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(4," Пакуй ",MultiTrigger,GetMultiTrigger(),1)

Talk( 5, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,100 )
TriggerAction( 1, GiveItem, 7467,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(5," Пакуй ",MultiTrigger,GetMultiTrigger(),1)


Talk( 6, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,100 )
TriggerAction( 1, GiveItem, 7450,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(6," Пакуй ",MultiTrigger,GetMultiTrigger(),1)



Talk( 8, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7450,10 )
TriggerAction( 1, GiveItem, 3457,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(8," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 9, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7692,10 )
TriggerAction( 1, GiveItem, 3457,500,4 )
TriggerFailure( 1, JumpPage, 10)
Text(9," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 12, " Люблю свою работу " )
InitTrigger()
TriggerCondition( 1, HasCredit, 50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, DelRoleCredit, 50 )
TriggerAction( 1, GiveItem, 7622,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(12," Меняй ",MultiTrigger,GetMultiTrigger(),1)


Talk( 13, " Люблю свою работу " )
InitTrigger()
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, GiveItem, 7623,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(13," Меняй ",MultiTrigger,GetMultiTrigger(),1)

Talk( 14, " Люблю свою работу " )
InitTrigger()
TriggerCondition( 1, HasCredit, 500 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, DelRoleCredit, 500 )
TriggerAction( 1, GiveItem, 7624,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(14," Меняй ",MultiTrigger,GetMultiTrigger(),1)

Talk( 15, " Люблю свою работу " )
InitTrigger()
TriggerCondition( 1, HasCredit, 10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, DelRoleCredit, 10 )
TriggerAction( 1, GiveItem, 7625,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(15," Меняй ",MultiTrigger,GetMultiTrigger(),1)


Talk( 16, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7467,10 )
TriggerAction( 1, GiveItem, 3457,1000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(16," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 17, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7467,100 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(17," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 18, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7467,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(18," Открывай ",MultiTrigger,GetMultiTrigger(),1)


Talk( 19, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7746,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(19," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 21, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7467,1000 )
TriggerAction( 1, GiveItem, 3457,100000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(21," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 22, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7450,100 )
TriggerAction( 1, GiveItem, 3457,1000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(22," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 23, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7450,1000 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(23," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 24, "Обращайся в любой момент " )
Text( 24,  "Великий Свиток Удачи  ", JumpPage, 25)
Text( 24,  "Мифический Свиток Удачи  ", JumpPage, 26)

Talk( 25, "Один Великий Свиток будет стоить 3 Свитка Удачи" )
InitTrigger()
TriggerCondition( 1, HasItem,7484,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7484,3 )
TriggerAction( 1, GiveItem, 7502,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(25," Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk( 26, "Один Мифический Свиток будет стоить 5 Великих Свитков Удачи" )
InitTrigger()
TriggerCondition( 1, HasItem,7502,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7502,5 )
TriggerAction( 1, GiveItem, 7503,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(26," Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk( 27, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7450,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(27," Пакуй ",MultiTrigger,GetMultiTrigger(),1)

Talk( 28, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,10000 )
TriggerAction( 1, GiveItem, 7467,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(28," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 29, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,10000 )
TriggerAction( 1, GiveItem, 7746,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(29," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 30, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7692,100 )
TriggerAction( 1, GiveItem, 3457,5000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(30," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 31, "Обращайся в любой момент " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7692,1000 )
TriggerAction( 1, GiveItem, 3457,20000,4 )
TriggerAction( 1, GiveItem, 3457,20000,4 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(31," Открывай ",MultiTrigger,GetMultiTrigger(),1)

Talk( 32, " Люблю свою работу " )
InitTrigger()
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7830,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(32," Меняй ",MultiTrigger,GetMultiTrigger(),1)


Talk( 10, "Ты что-то напутал! " )

	AddNpcMission ( 2026 )
end 

-------------------------------------------------------------------
--								--
--		°ЧТшіЗЈЁМъЅіЎЄЎЄРЎЅрЅрЈ©		--
--		219533,270323				--
-------------------------------------------------------------------
function r_trade01 ()
	Talk( 1, "Голди: Привет! У меня всегда есть первосортное оружие для тебя! " )
	Text( 1, "Торг ", BuyPage)
	Text( 1, "Ремонт ", OpenRepair)
	Text( 1, "Комбинировать ", OpenUnite)
	Text( 1, "Вставить самоцвет ", OpenForge)
	Text( 1, "Сделать слот ", OpenMilling)
	Text( 1, "Вставить в аппарель ", OpenFusion)
	Text( 1, "Улучшение аппарели ", OpenUpgrade)
	Text( 1, "Вытащить самоцвет ", OpenGetStone )
	Text( 1, "Починка инструментов ", OpenItemFix )
	Text( 1,"Починка легированной кирки ",JumpPage,9)
	Talk(9,"Голди: Сломалась легированная кирка? Нет проблем! Я готов починить ее для тебя! ")
	Text(9,"Я хочу отремонтировать свою кирку ",CheckMetal)
	Text(9,"Нет, спасибо. ",CloseTalk)




	InitTrade()
	Weapon(	0008	)
	Weapon(	0196	)
	Weapon(	0197	)
	Weapon(	0198	)
	Weapon(	0001	)
	Weapon(	0010	)
	Weapon(	0002	)
	Weapon(	0011	)
	Weapon(	0003	)
	Weapon(	0012	)
	Weapon(	0013	)
	Weapon(	0014	)
	Weapon(	0022	)
	Weapon(	0005	)
	Weapon(	0023	)
	Weapon(	1388	)
	Weapon(	1389	)
	Weapon(	1390	)
	Weapon(	1391	)
	Weapon(	1392	)
	Weapon(	1395	)
	Weapon(	1396	)
	Weapon(	1397	)
	Weapon(	1398	)
	Weapon(	1399	)
	Weapon(	0121	)
	Weapon(	0122	)
	Weapon(	0123	)
	Weapon(	0124	)
	Weapon(	0125	)
	Weapon(	0126	)
	Weapon(	0015	)
	Weapon(	0020	)
	Weapon(	0016	)
	Weapon(	0021	)
	Weapon(	0004	)
	Weapon(	1370	)
	Weapon(	1371	)
	Weapon(	1372	)
	Weapon(	1373	)
	Weapon(	1377	)
	Weapon(	1378	)
	Weapon(	1379	)
	Weapon(	1380	)
	Weapon(	1381	)
	Weapon(	1382	)
	Weapon(	1386	)
	Weapon(	1387	)
	Weapon(	0073	)
	Weapon(	0080	)
	Weapon(	0074	)
	Weapon(	0081	)
	Weapon(	0075	)
	Weapon(	0082	)
	Weapon(	0076	)
	Weapon(	0083	)
	Weapon(	0077	)
	Weapon(	0084	)
	Weapon(	1415	)
	Weapon(	1416	)
	Weapon(	1417	)
	Weapon(	1418	)
	Weapon(	1419	)
	Weapon(	1422	)
	Weapon(	1423	)
	Weapon(	1424	)
	Weapon(	1425	)
	Weapon(	1426	)
	Weapon(	1443	)
	Weapon(	1444	)
	Weapon(	1445	)
	Weapon(	1446	)
	Weapon(	1447	)
	Weapon(	1450	)
	Weapon(	1451	)
	Weapon(	1452	)
	Weapon(	1460	)
	Weapon(	1461	)
	Defence( 455	)
	Defence( 453	)
	Defence()
	Defence()
	Defence( 891	)
	Defence( 6846	)
	Defence( 890	)
	Defence()
	Defence( 456	)
	Defence( 1020	)
	Defence()
	Defence()
	Defence( 3074	)
	Defence( 3075	)	



	Talk( 4, "Голди: Какую маску желаешь изготовить? ")
	Text( 4, "Маску снегурки ",JumpPage,5)
	Text( 4, "Тыквенную маску ", JumpPage,6)
	Text( 4, "Маску черепа ", JumpPage,7)


	InitTrigger() --¶?»»????????
	TriggerCondition( 1, HasItem, 4358, 30 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 4358, 30 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1120, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(5, "Голди: Для изготовления Маски снегурки мне необходимо 30 Синих снежков ")
	Text( 5, "Обменять ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --¶?»»????
	TriggerCondition( 1, HasItem, 4809, 30 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 4809, 30 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1121, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(6, "Голди: Для изготовления Тыквенной маски мне необходимо 30 Тыквенных голов ")
	Text( 6, "Обменять ",MultiTrigger, GetMultiTrigger(), 1) 
	
	InitTrigger() --¶?»»????
	TriggerCondition( 1, HasItem, 2419, 20 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 2419, 20 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1122, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(7, "Голди: Для изготовления Маски черепа мне необходимо 30 Волшебных костей ")
	Text( 7, "Обменять ",MultiTrigger, GetMultiTrigger(), 1) 
	
	Talk( 8, "Голди: У тебя нет всех необходимых компонентов или твой инвентарь заблокирован ")
	
	AddNpcMission ( 703 )
	AddNpcMission	(1044)
	AddNpcMission	(1096)
	AddNpcMission	(1155)
	AddNpcMission	(1207)
	AddNpcMission	(58)
	AddNpcMission	(59)
	AddNpcMission	(60)
	AddNpcMission(	1221	)


end
-----------------------------------------------------------------РЎЅрЅрМъЅіЅбКш----------------------------------------------------------------------------------------------




------------------------------------------------------------------
--								--
--								--
------------------------°ЧТшіЗГШКйЛ№їЛМШ---------------------------
--			221925,274925				--
--								--
------------------------------------------------------------------
function r_talk01 ()
	
	Talk( 1,  "Гид по серверу: Здравствуйте, Вы похожи на новичка в этих краях. Могу ли я чем то помочь? " )
	Text( 1,  "Кто Вы? ", JumpPage, 2)
	Text( 1,  "С чего мне начать? ", JumpPage, 3 )
	Text( 1,  "Где найти основных НПС? ", JumpPage, 5 )
	Text( 1,  "Где взять гемы, рефы? ", JumpPage, 6 )
	Text( 1,  "Где взять деньги? ", JumpPage, 7 )
	Text( 1,  "Как разделить кели по 99 шт? ", JumpPage, 8 )
	Text( 1,  "Где взять Кели? ", JumpPage, 9 )
	Text( 1,  "Где взять Пиастры? ", JumpPage, 10 )
	
	Text( 1,  "Я думаю все понял. Спасибо. ", CloseTalk)

	Talk( 2,  "Гид по серверу: Я отвечаю на вопросы жителей Лайт-Сервера. Если у Вас возникли какие то трудности, то ищите меня :) " )
	Text( 2,  "Назад. ", JumpPage, 1)

	Talk( 3,  "Гид по серверу: Думаю тебе сначала нужно прокачаться, сделать это можно убив пару лесных духов в пати, если не будет идти опыт, то всёравно бей духов пока не стаешь 100 лвл. " )
	Text( 3,  "Назад. ", JumpPage, 1)

	Talk( 5,  "Гид по серверу: В Аргенте у фонтана есть телепорт на остров НПСов, там - то ты их и найдёшь. " )
	Text( 5,  "Назад. ", JumpPage, 1)

	Talk( 6,  "Гид по серверу: В Аргенте рядом с кузнецом их можно приобрести за даром. " )
	Text( 6,  "Назад. ", JumpPage, 1)

	Talk( 7,  "Гид по серверу: Их выдаёт вонючая хрюшка, которая стоит около портальщицы аргента, на левых воротах. " )
	Text( 7,  "Назад. ", JumpPage, 1)

	Talk( 8,  "Гид по серверу: Как тут стекуются кели, спросишь ты?! Стекуются они по 10000. Если тебе нужно разделить их на 99, чтобы было удобнее торговать с игроками, то положи максимальное количество своих келей в банк, а потом с банка перетаскивай в разные ячейки инвертаря по 99 шт. " )
	Text( 8,  "Назад. ", JumpPage, 1)

	Talk( 9,  "Гид по серверу: Ну если ты новичёк, то тебе лучше идти в лут-зону, попасть в неё можно через портальщика . Находится он на левом выходе аргента. Тебя телепортирует в шахты, там тебежелательно пройти на второй уровень, потому что там нет пвп зоны в отличии от первого уровня шахт. Там с мобов ты будешь выбивать пачкули которые сможешь обменять у  на сами собственно кели. Если ты уже сильный игрок, то можешь фармить кели в подземном мире, открывается он каждые три часа по МСК, начиная с 00:00 " )
	Text( 9,  "Назад. ", JumpPage, 1)

	Talk( 9,  "Гид по серверу: Пиастры можно достать с боссов подземного мира, на 1 и 2 этаже. Один ты наврятли справишься, так что возьми с собой парочку друзей. " )
	Text( 9,  "Назад. ", JumpPage, 1)





----------------ЧўІбИООс

	AddNpcMission ( 203 )
	AddNpcMission ( 204 )
	AddNpcMission ( 205 )
	AddNpcMission ( 206 )
	AddNpcMission ( 221 )
	AddNpcMission ( 222 )
	AddNpcMission ( 1002 )
	AddNpcMission ( 1057 )
	AddNpcMission ( 1112 )
	AddNpcMission ( 1166 )
	AddNpcMission ( 55 )
	AddNpcMission ( 56 )
	AddNpcMission ( 57 )
	AddNpcMission ( 1220 )
	AddNpcMission ( 319 )
	AddNpcMission ( 325 )
	AddNpcMission ( 326 )
---------eleven
	AddNpcMission ( 5037 )	



	MisListPage(8)
end 
---------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<NPC Ў¶Л№їЛМШЎ·ЅбКшБЛ!
----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[АПДМДМ]				--
--							--
--		227725,276925				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk02 ()

	
	Talk( 1,  "Бабуля: Здравствуйте молодой человек. " )
	Text( 1,  "Зернышко Любви. ", JumpPage, 2)
	Text( 1,  "Обменять 10 Зернышек Любви. ", JumpPage, 3)
	Text( 1,  "Обменять 100 Зернышек Любви. ", JumpPage, 4)
	Text( 1,  "Обменять 1000 Зернышек Любви. ", JumpPage, 5)
	Text( 1,  "Сделать светильник. ", JumpPage, 7 )
	Text( 1,  "До свидания... ", CloseTalk)
	
	
	Talk( 2,  "Бабуля: Чтобы сделать Зернышко Любви необходимо 1 Чистую воду, 1 Лепесток многоцвета, 1 Идеальный сапфир и 1 Сердце наяды. " )
	Text( 2,  "Сделать Зернышко Любви. ", GetChaName_21, 1 )

	Talk( 3,  "Бабуля: Вы можете обменять 10 Зернышек Любви на 1 Медовый шоколад. ")
	Text(3, "Обменять ",  GetChaName_22, 1)

	Talk( 4,  "Бабуля: Вы можете обменять 100 Зернышек Любви на 3 Усилителя стремлений. ")
	Text(4, "Обменять ",  GetChaName_23, 1)

	Talk( 5,  "Бабуля: Вы можете обменять 1000 Зернышек Любви на 1 Пропуск в Абаддон 4. ")
	Text(5, "Обменять ",  GetChaName_24, 1)
	
	InitTrigger() --¶Ф»»µЖБэ
	TriggerCondition( 1, HasItem, 3904, 15 )
	TriggerCondition( 1, HasItem, 3911, 15 )
	TriggerCondition( 1, HasItem, 4450, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeItem, 3904, 15 )
	TriggerAction( 1, TakeItem, 3911, 15 )
	TriggerAction( 1, TakeItem, 4450, 1 )
 	TriggerAction( 1, GiveItem, 3342, 1 ,4)
	TriggerFailure( 1, JumpPage, 9 ) 
	Talk( 7,  "Бабуля: дайте мне 15 Красной бумаги, 15 Бамбуковых палочек, и 1 Странную свечу для обмена на Светильник. ")
	Text( 7,  "Обмен. ", MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 9,  "Бабуля у Вас нет необходимых ингридиентов. ")

	MisListPage(1)

	AddNpcMission ( 282 )
	AddNpcMission ( 283 )
	AddNpcMission	(1026)
	AddNpcMission	(1084)
	AddNpcMission	(1137)
	AddNpcMission	(1189)
	AddNpcMission(	1224	)
	AddNpcMission(	373	)
	AddNpcMission(	374	)
	AddNpcMission(	388	)
--	AddNpcMission( 906 )



end 

function r_talk04 ()

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 1,  "Джина: Привет! Я медсестра Джина! Ищите меня если больны или травмированы. " )
	Text( 1,  "Большое исцеление ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 1,  "Исцеление ", MultiTrigger,GetMultiTrigger(),2)
	--Text( 1,  "Build Ship ", JumpPage, 10)

	Talk( 2,  "Джина: Прошу прощения, но Большое исцеление стоит 200 золотых. У вас недостаточно денег! " )

	Talk( 3,  "Джина: Прошу прощения, но Исцеление стоит 50 золотых. У вас недостаточно денег! " )

	Talk( 4,  "Я не жду никакого письма. Полагаю вы ошиблись. " )

	Talk( 5,  "Забудьте это. Вот возьмите награду за свою нелегкую работу. " )
		
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 6,  "Джина: Привет! Я медсестра Джина! Ищите меня если больны или травмированы. " )
	Text( 6,  "Большое исцеление ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 6,  "Исцеление ", MultiTrigger,GetMultiTrigger(),2)
	

	InitTrigger()
	TriggerCondition( 1, HasMission, 53 )
	TriggerCondition( 1, HasFlag, 53, 1 )
	TriggerCondition( 1, NoRecord, 53 )
	TriggerCondition( 1, NoFlag, 53, 4 )
	TriggerCondition( 1, HasItem, 2304, 1 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 1 )

	Start( GetMultiTrigger(), 1 )
	AddNpcMission	(1048)
	AddNpcMission	(1210)
	AddNpcMission	(920)-----------------------------------------
	AddNpcMission	(921)

	MisListPage(6)
	
	-----МъИЛБщПо
	AddNpcMission ( 6117 )
	AddNpcMission ( 6118 )
	AddNpcMission ( 6119 )
	AddNpcMission ( 6120 )

end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤КїРЎЅгЎЄЎЄб°б°         ЅбКшї©



----------------------------------------------------------
----							--
--							--
--		°ЧТшіЗ[ѕЖ°ЙЕ® - µЩДИ]			--
--							--
--		225325,278875				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk05 ()

	Talk( 1,  "Донна: Привет, я Донна! Вы действительно моряк? Наверное вы знаете так много замечательных историй... " )
	Text( 1,  "Купить вино ", BuyPage )
	Text(1,  "Обменять репутацию ",JumpPage,4)
	Text(1,  "Сделка с Королевскими пиратами ",JumpPage,7)
	InitTrade()
	Other(	3916	)

	Talk( 2,  "Донна: Я слышала вы ищете Вино восьми драгоценностей? У меня есть в запасе оно. Если вы хотите его купить, то принесите мне 100000 золотых. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeMoney, 100000 )
	TriggerAction( 1, GiveItem, 4072, 1, 4 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2,  "Вино восьми драгоценностей ", MultiTrigger,GetMultiTrigger(),1)

	Talk( 3,  "Донна: Кажется вы имеете недостаточно денег. Это вино не для бедных! Возвращайтесь как соберете достаточную сумму. " )

	Talk(4, "Репутация очень важна! Те кто делают полезное для общества получают репутацию. Полученную репутацию вы можете обменять здесь на необходимые предметы. ")
	Text(4, "Я верю в свою репутацию. Я здесь чтобы получить награду. ", JumpPage,5)

	Talk(5, "Выберите нужную награду. Когда вы получите предмет ваша репутация будет уменьшена. ")
	InitTrigger()
	TriggerCondition( 1, HasCredit,20 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 20 )
	TriggerAction( 1, GiveItem, 2602,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "Эмблема сремления новичка - стоимость 20 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,200 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 200 )
	TriggerAction( 1, GiveItem, 2603,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "Эмблема стремления станд. ур. - стоимость 200 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,2000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 2000 )
	TriggerAction( 1, GiveItem, 2604,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "Эмблема стремления выс. ур. - стоимость 2000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)
	Talk(6, "Пожалуйста проверьте есть ли у вас свободные ячейки в инвентаре и что вы имеете достаточно репутации. Заработать репутацию вы можете например взяв себе ученика. ",CloseTalk)

	Talk(7, "Привет! Мы Короли пиратов и служим только пиратам с отличной репутацией. Набрав требуемое количество репутации вы можете обменять ее на необходимые предметы. ")
	InitTrigger()
	TriggerCondition( 1, HasCredit,500 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 500 )
	TriggerAction( 1, GiveItem, 855,5,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "5 Монет феи - стоимость 500 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,5000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 5000 )
	TriggerAction( 1, GiveItem, 3094,3,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "3 Усилителя стремлений - стоимость 5000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,20000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 20000 )
	TriggerAction( 1, GiveItem, 0610,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "Самоуничтожение начального уровня - стоимость 20000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,50000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 50000 )
	TriggerAction( 1, GiveItem, 0885,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "Очищающий самоцвет 1 уровня - стоимость 50000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,200000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 200000 )
	TriggerAction( 1, GiveItem, 0862,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "Самоцвет колосса - стоимость 200000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,600000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 600000 )
	TriggerAction( 1, GiveItem, 1012,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "Самоцвет души - стоимость 600000 очков репутации. " ,MultiTrigger,GetMultiTrigger(),1)

	Talk(8, "Добро пожаловать в Королевские пираты! Работайте больше для достижения своей цели. ")

	InitTrigger()
	TriggerCondition( 1, HasRecord, 255 )
	TriggerCondition( 1, NoItem, 4072, 1 )
	TriggerCondition( 1, NoRecord, 242 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )


	Start( GetMultiTrigger(), 1 )

	MisListPage(2)

	AddNpcMission ( 268 )
	AddNpcMission ( 269 )
	AddNpcMission ( 288 )
	AddNpcMission ( 502 )
	AddNpcMission ( 334 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕЖ°ЙЕ® - µЩДИЅбКш



----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[РЎЙЅіµ]				--
--							--
--		219350,273050				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk06 ()
	
	
	Talk( 1,  "Малыш Дэниель: Доводилось вам быть у святыни в пустыне? Или в Одинокой башне в чаще Священного леса? В молодом возрасте нужно больше исследовать мир. " )
	--Text( 1,  "Learn Navigation Skill ", BuyPage )
	Text(1, "Сделать Генератор древних ",JumpPage,2)
	Text( 1,  "Спасибо за подсказку. ", CloseTalk)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 3933, 10 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, TakeItem, 3933, 10 )
	TriggerAction( 1, TakeMoney, 5000 )
	TriggerAction( 1, GiveItem, 1812, 1, 4 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Малыш Дэниель: О, опять эти детали машин. В последнее время мы все чаще находим их в телах пиратов! Принесите мне 10 Деталей робота и 5000 золотых и я сделаю для вас Генератор древних. " )
	Text( 2,  "Сделать Генератор древних ",  MultiTrigger, GetMultiTrigger(), 1 )
	Text( 2,  "Нет, я передумал. ", CloseTalk)

	Talk(3,  "Малыш Дэниель: Вот, держите Генератор древних. Он позволит вам проникнуть в Заброшенный город. Приходите если вам потребуется еще. ")

	Talk(4,  "Малыш Дэниель: Простите, у вас нет 10 Деталей робота или 5000 золотых. ")

	InitTrade()
	Other(	3243	)
	Other(	3244	)
	Other(	3245	)
	Other(	3246	)
	Other(	3247	)
	Other(	3248	)
	Other(	3249	)
	Other(	3250	)
	Other(	3251	)
	Other(	3252	)
	Other(	3253	)
	Other(	3254	)
	Other(	3255	)
	Other(	3256	)
	Other(	3257	)
	Other(	3258	)
	Other(	3259	)
	Other(	3260	)
	Other(	3261	)
	Other(	3262	)
	Other(	3263	)
	Other(	3264	)
	Other(	3265	)
	Other(	3266	)
	Other(	3267	)
	Other(	3268	)
	Other(	3269	)
	Other(	3270	)
	Other(	3271	)
	Other(	3272	)
	Other(	3273	)
	Other(	3274	)
	Other(	3275	)
	Other(	3276	)
	Other(	3277	)
	Other(	3278	)
	Other(	3279	)
	Other(	3280	)
	Other(	3281	)
	Other(	3282	)
	Other(	3283	)
	Other(	3284	)
	Other(	3285	)
	Other(	3286	)
	Other(	3287	)
	Other(	3288	)
	Other(	3289	)
	Other(	3290	)
	Other(	3291	)
	Other(	3292	)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3933, 10 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )

	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 748 )
	AddNpcMission	(1045)
	AddNpcMission	(1099)
	AddNpcMission	(1157)
	AddNpcMission	(758)
	AddNpcMission	(103)
	AddNpcMission	(191)
	AddNpcMission	(192)
	AddNpcMission	(193)
	AddNpcMission	(197)
	AddNpcMission(	1225	)
	AddNpcMission(	503	)
	AddNpcMission	(330)
	AddNpcMission	(331)
	AddNpcMission	(332)
	AddNpcMission	(335)
	AddNpcMission	(359)
	AddNpcMission	(360)
	AddNpcMission	(361)
	AddNpcMission	(362)
	AddNpcMission	(363)
	AddNpcMission	(364)
	AddNpcMission	(365)
	AddNpcMission	(366)
	AddNpcMission	(367)
	AddNpcMission	(368)
	AddNpcMission	(369)
	AddNpcMission	(370)
	AddNpcMission	(371)
	AddNpcMission	(522)
------------eleven
	AddNpcMission	(5058)
	AddNpcMission	(5062)
	

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<РЎЙЅіµЅбКш






----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ФУ»хЙМИЛ - јЄЖХБў]			--
--							--
--		225075,277025				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk07 ()

	Talk( 1,  "Джимберри: Привет! Могу я тебе чем-нибудь помочь? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )
	Text( 1,  "Сделать Маску реальности. ",JumpPage, 2 )

	InitTrade()
	Other(	3297	)
	Other(	3298	)
	Other(	3164	)
	Other(	3160	)
	Other(	3161	)
	Other(	3165	)
	Other(	3238	)
	Other(	3170	)
	Other(	3293	)
	Other(	3174	)
	Other(	3163	)
	Other(	3176	)
	Other(	3180	)
	Other(	3179	)
	Other(	3177	)
	Other(	3168	)
	Other(	3162	)
	Other(	3166	)
	Other(	3167	)
	Other(	3172	)
	Other(	3173	)
	Other(	3227	)
	Other(	3231	)
	Other(	3228	)
	Other(	3229	)
	Other(	3230	)
	Other(	3232	)
	Other(	3233	)
	Other(	3234	)
	Other(	3235	)
	Other(	3236	)
	Other(	3237	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other(	3141	)
	Other(	4602	)
	Other(	3296	)
	Other(	3299	)
	--baby--Йъ»ојјДЬКйLv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--leo
	Other(  2440    )
	--AddNpcMission	(5501)


	---bragi
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1624, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1624, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Для создания Маски реальности необходимы 1 Эльфийская печать, 10000 золота и 10 любых ресурсов 3 уровня. " )
	Text( 2,  "Обменять Осколок кости на Маску реальности. ", MultiTrigger, GetMultiTrigger(), 1)

	---InitTrigger()
	---TriggerCondition( 1, HasLeaveBagGrid, 1 )
	---TriggerCondition( 1, KitbagLock, 0 )
	---TriggerCondition( 1, HasItem, 2588, 1 )
	---TriggerCondition( 1, HasItem, 1842, 10 )
	---TriggerCondition( 1, HasMoney, 10000 )
	---TriggerAction( 1, TakeItem, 2588, 1 )
	---TriggerAction( 1, TakeItem, 1842, 10 )
	---TriggerAction( 1, TakeMoney, 10000 )
	---TriggerAction( 1, GiveItem, 2326, 1 , 4)
	---TriggerAction( 1, JumpPage, 3 )
	---TriggerFailure( 1, JumpPage, 4 )
	---Text( 2,  "Exchange Razor Tooth for Reality Mask ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4545, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4545, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Руду на Маску реальности. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4543, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4543, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Дерево на Маску реальности. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1478, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1478, 10 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Сашими на Маску реальности. ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Джимбери: Держите! Маска реальности готова. " )
	Talk( 4,  "Джимбери: Вы не имеете всех необходимых компонентов или ваш инвентарь заблокирован. " )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ФУ»хЙМИЛ - јЄЖХБўЅбКш


----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ѕУГсЎ¤ВкёсАцМШ]			--
--							--
--		227459,277722				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk08 ()

	Talk( 1,  "Маргарет: Привет! Вчера по телевидению... Хахаха... видела его. Он такой забавный... " )
	Text( 1,  "Сделать укрепляющую пищу ", JumpPage, 2)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3122, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Вы хотите действительно вкусную и полезную пищу? Тогда вы действительно по адресу! " )
	Text( 2,  "Сделать Сок эльфийского фрукта. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3117, 10 )
	TriggerAction( 1, TakeItem, 3117, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3123, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "Сделать Чай из красных фиников. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3118, 10 )
	TriggerAction( 1, TakeItem, 3118, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3124, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 2,  "Сделать Грибной суп. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3119, 10 )
	TriggerAction( 1, TakeItem, 3119, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3125, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 7 )
	Text( 2,  "Сделать Сок плодов дурмана. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3120, 10 )
	TriggerAction( 1, TakeItem, 3120, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3126, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 2,  "Сделать Мороженное ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Маргарет: Вот то что вы хотели! Не больше и не меньше. " )
	Talk( 4,  "Маргарет: Чтобы сделать 1 Сок эльфийского фрукта необходимо 10 Эльфийских фруктов и 1 Стакан. " )
	Talk( 5,  "Margaret: Чтобы сделать 1 Чай из красных фиников необходимо 10 Красных фиников и 1 Стакан. " )
	Talk( 6,  "Маргарет: Чтобы сделать 1 Грибной суп необходимо 10 Грибов и 1 Стакан. " )
	Talk( 7,  "Маргарет: Чтобы сделать 1 Сок плодов дурмана необходимо 10 Плодов дурмана и 1 Стакан. " )
	Talk( 8,  "Маргарет: Чтобы сделать 1 Мороженное необходимо 10 Ледянных фруктов и 1 Стакан. " )
	AddNpcMission	(1023)
	AddNpcMission	(1080)
	AddNpcMission	(1135)
	AddNpcMission	(1186)
	AddNpcMission(	1223	)
	




end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕУГсЎ¤ВкёсАцМШ


----------------------------------------------------------
--							--
--							--

	--°ЧТшіЗ[ВГµкАП°еЎ¤ВкА­ТААј]		--
--							--
--		221150,278125				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk09 ()
	
	
	Talk( 1,  "Мариам: Вас интересуют лучшие краски для волос? " )		
	Text( 1,  "Сделать краситель для волос. ", JumpPage, 2)
	--Text( 1,  "Торг Pet Items ", BuyPage )
	
	-- Рождественский ивент
	Text(1,  "Приготовить Вкусное индюшачье мясо ", JumpPage, 10)
	Text(1,  "Приготовить Рождественский обед ", JumpPage, 13)

InitTrade()
	Other(	227	)
	Other(	5826	)
	Other(	5827	)
	Other(	5828	)
	Other(	578	) 
	Other(	262	)
	Other(	1015	)
	Other(	679	)
	Other(	222	)
	Other(	276	)
	Other(	5829	)
	Other(	5830	)
	Other(	223	)
	Other(	277	)
	Other(	5831	)
	Other(	5832	)
	Other(	224	)
	Other(	278	)
	Other(	5833	)
	Other(	5834	)
	Other(	225	)
	Other(	279	)
	Other(	5835	)
	Other(	5836	)
	Other(	226	)
	Other(	280	)
	Other(	5837	)
	Other(	5838	)
	Other(	244	)
	Other(	260	)
	Other(	253	)
	Other(	247	)
	Other(	250	)
	Other(	239	)
	Other(	608	)
	Other(	610	)
	Other(	3918	)
	Other(	3919	)
	Other(	3920	)
	Other(	3921	)
	Other(	3922	)
	Other(	3924	)
	Other(	3925	)
	Weapon(	2337	)
	Weapon(	5011	)
	Weapon(	3187	)
	Weapon(	3188	)
	Weapon(	3190	)
	Weapon(	3239	)
	Weapon(	3197	)
	Weapon(	3193	)
	Weapon(	3241	)
	Weapon(	3192	)
	Weapon(	3198	)
	Weapon(	3202	)
	Weapon(	3203	)
	Weapon(	3204	)
	Weapon(	3225	)
	Weapon(	3226	)
	Weapon(	3294	)
	Weapon(	3295	)
	Weapon(	3141	)
	Weapon(	4602	)
	Weapon( 3296 )
	--baby--Йъ»ојјДЬКйLv1
	Weapon(	2679	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	2709	)
	--Leog
	Weapon(  2440    )
	
---------------------ЕлµчГАО¶µД»рј¦Ив
	InitTrigger()
	TriggerCondition( 1, HasItem, 2886, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2886,10 )
	TriggerAction( 1, GiveItem, 2895, 1 , 4)
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 12)
	Talk( 10,  "Марриам: Мне требуется 10 Индюшатины и 10000 золота. ")
	Text(10,  "Приготовить ",  MultiTrigger, GetMultiTrigger(), 1)

	Talk(11,  "Марриам: Вот Вкусное мясо индюшки! Надеюсь вы оцените его сочный вкус! " )

	Talk( 13,  "Марриам: Каждом положено не более трех Рождественских обедов! ")
	Text(13,  "Первый Рождественский обед. ",  JumpPage, 15)
	Text(13,  "Второй Рождественский обед. ",  JumpPage, 16)
	Text(13,  "Третий Рождественский обед. ", JumpPage, 17)
	---------------------ЕлµчКҐµ®ґуІН
	InitTrigger()
	TriggerCondition( 1, NoRecord, 815 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction( 1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 815 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 14 )
	Talk( 15,  "Марриам: Сделать хороший Рождественнский обед не просто. Мне необходимы 10 кусков Вкусной индюшатины и 1 Рождественнская роза. Также вы должны заплатить 10000 золота. Я смогу приготовить Рождественнский обед лишь 3 раза! ")
	Text( 15,  "Приготовить ",  MultiTrigger, GetMultiTrigger(), 1)

	

	---------------------ЕлµчКҐµ®ґуІН
	InitTrigger()
	TriggerCondition( 1, HasRecord, 815 )
	TriggerCondition( 1, NoRecord, 816 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney,1000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 1000000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction(1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 816 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 18 )
	Talk(16,  "Марриам: Сделать хороший Рождественнский обед не просто. Мне необходимы 10 кусков Вкусной индюшатины и 1 Рождественнская роза. Также вы должны заплатить 1000000 золота. Я смогу приготовить Рождественнский обед лишь 3 раза! ")
	Text( 16,  "Приготовить ",  MultiTrigger, GetMultiTrigger(), 1)

	---------------------ЕлµчКҐµ®ґуІН
	InitTrigger()
	TriggerCondition( 1, HasRecord, 816 )
	TriggerCondition( 1, NoRecord, 817 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney, 10000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction( 1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 817 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage,19 )
	Talk(17,  "Марриам: Сделать хороший Рождественнский обед не просто. Мне необходимы 10 кусков Вкусной индюшатины и 1 Рождественнская роза. Также вы должны заплатить 10000000 золота. Я смогу приготовить Рождественнский обед лишь 3 раза! ")
	Text( 17,  "Приготовить ",  MultiTrigger, GetMultiTrigger(), 1)
	Talk( 14,  "Марриам: Кажется вы не имеете всех необходимых компонентов или достаточно золота! Также вы должны иметь 1 свободную ячейку в инвентаре. Вы делаете Рождественнский обед впервые? Вы сможете приготовить его лишь 3 раза! ")
	Talk( 18,  "Марриам: Кажется вы не имеете всех необходимых компонентов или достаточно золота! Также вы должны иметь 1 свободную ячейку в инвентаре. Вы делаете Рождественнский обед второй раз? Вы сможете приготовить его лишь 3 раза! ")
	Talk( 19,  "Марриам: Кажется вы не имеете всех необходимых компонентов или достаточно золота! Также вы должны иметь 1 свободную ячейку в инвентаре. Вы делаете Рождественнский обед в третий раз? Вы сможете приготовить его лишь 3 раза! ")
	Talk( 12,  "Марриам: Кажется вы не имеете всех необходимых компонентов или достаточно золота! Также вы должны иметь 1 свободную ячейку в инвентаре. ")
------------------µчЕдємЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1787, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1787, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1797, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Марриам: Иметь один и тот же цвет прически постоянно скучно. Я могу приготовить для вас краситель для интересующего вас цвета. " )
	Text( 2,  "Сделать Красный краситель ", MultiTrigger, GetMultiTrigger(), 1)
---------------------µчЕдіИЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1788, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1788, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1798, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "Сделать Оранжевый краситель ", MultiTrigger, GetMultiTrigger(), 1)
---------------------µчЕдєЪЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 4606, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 4606, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 4607, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 2,  "Сделать Черный краситель ", MultiTrigger, GetMultiTrigger(), 1)
---------------------µчЕдєЦЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 4608, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 4608, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 4609, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 9 )
	Text( 2,  "Сделать коричневый краситель ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Марриам: Готово! Возьмите этот превосходный краситель, сваренный именно для вас. " )
	Talk( 4,  "Марриам: Чтобы приготовить 1 Красный краситель необходимо 5 Красной краски, 1 Особый газ, 1 Радужный стакан и 200 золотых. " )
	Talk( 5,  "Марриам: Чтобы приготовить 1 Оранжевый краситель необходимо 5 Оранжевой краски, 1 Особый газ, 1 Радужный стакан и 200 золотых. " )

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 2 )
	TriggerAction( 1, AddExp, 116688305, 116688305 )
	TriggerAction( 1, AddExpAndType,2,370500,370500)
	TriggerAction( 1, AddMoney, 1000000 )
	TriggerFailure( 1, JumpPage, 7 )
	Talk( 6,  "Marriam: To test PK, I will make you Lv 65 and add 1 million gold for you. " )
	Text( 6,  "Ok ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 7,  "Marriam: I only give this chance to level 1 new players. " )

	Talk( 8,  "Марриам: Чтобы приготовить 1 Черный краситель необходимо 5 Черной краски, 1 Особый газ, 1 Радужный стакан и 200 золотых. " )
	Talk( 9,  "Марриам: Чтобы приготовить 1 Коричневой краситель необходимо 5 Коричневой краски, 1 Особый газ, 1 Радужный стакан и 200 золотых. " )

	AddNpcMission	(1029)
	AddNpcMission	(1192)
	------------¶юФВ-----------ЗйОЄєООп-----------ЗгіЗЦ®Бµ------------РТФЛЦнЦн----------ЖЯЦнїЄМ©
	--AddNpcMission	(5505)
	--AddNpcMission	(5506)
	--AddNpcMission	(5508)
	--AddNpcMission	(5509)
	--AddNpcMission	(5536)

end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ВГµкАП°еЎ¤ВкА­ТААј




----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[·рД·]				--
--							--
--		222629,272668				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk11 ()
	
	
	Talk( 1,  "Форбей: Привет! Я расскажу вам одну длинную историю... Подождите! Не уходите! " )


	AddNpcMission	(1009)
	AddNpcMission	(1173)

	-----МъИЛБщПо
	AddNpcMission ( 6123 )
	AddNpcMission ( 6124 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·рД·



----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[Л®КЦЎ¤єЈФЖ]			--
--							--
--		235013,284694				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk12 ()
	
	
	Talk( 1,  "Коди: Привет! Я моряк Коди. " )

--	InitTrigger()
--	TriggerCondition( 1, HasMission, 1043 )
--	TriggerCondition( 1, HasRecord, 1042 )
--	TriggerCondition( 1, NoRecord, 1058 )
--	TriggerAction( 1, JumpPage, 2 )
--	TriggerFailure( 1, JumpPage, 3 )
--	Text( 1,  "First question ",MultiTrigger, GetMultiTrigger(), 1 )
--
--	InitTrigger()
--	TriggerAction( 1, SetRecord, 1044 )
--	TriggerAction( 1, SetRecord, 1058 )
--	TriggerAction( 1, JumpPage, 4 )
--	Talk( 2,  "Is killing Mystic Shrubs fun? ")
--	Text( 2,  "Good ",MultiTrigger, GetMultiTrigger(), 1 )
--
--	InitTrigger()
--	TriggerAction( 1, SetRecord, 1045 )
--	TriggerAction( 1, SetRecord, 1058 )
--	TriggerAction( 1, JumpPage, 5 )
--	Text( 2,  "Not happy ",MultiTrigger, GetMultiTrigger(), 1  )
--
--
--	Talk( 3,  "Who are you? I do not know you! ")
--	Talk( 4,  "Good? Let's continue. ")
--	Talk( 5,  "No satisfied? Let's change another for you to kill ")

	AddNpcMission	(1039)
	AddNpcMission	(1202)
	AddNpcMission	(80)
	AddNpcMission	(81)
	AddNpcMission	(79)
	----------------јЄДбЛ№-єЈФЖ---01
	AddNpcMission	(5510)
--	AddNpcMission ( 6061 )
--	AddNpcMission ( 6062 )
--	AddNpcMission ( 6063 )
--	AddNpcMission ( 6064 )
--	AddNpcMission ( 6065 )
--	AddNpcMission ( 6066 )
--	AddNpcMission ( 6067 )
--	AddNpcMission ( 6068 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Л®КЦЎ¤єЈФЖ


----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ТшРРіцДЙЎ¤Д¦ДЭСЕ]			--
--							--
--		222050,270400				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk13 ()
	
	
	Talk( 1,  "Моника: Привет! Я банкир Моника! В нашем банке ваши вещи всегда под надежной защитой! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (стоимость 200 золотых) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "Простите, вы не имеете достаточное количество золота! " )

	AddNpcMission	(1050)
	AddNpcMission	(1212)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ТшРРіцДЙЎ¤Д¦ДЭСЕ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[єЈѕьЙЩЅ«Ў¤Ню¶ыЛ№]			--
--							--
--		230228,270157				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk14 ()
	
	
	Talk( 1,  "Вильям: Привет, Я генерал Вильям. Тут я самый главный! " )
	

	InitTrigger()
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, GiveItem, 4082, 1, 4)
	Talk( 2,  "Вильям: Что? Вы потеряли Древний премиальный знак? Правитель не будет с вами разговаривать без него. К счастью за 20000 золота я смогу вам его восстановить! ")
	Text( 2,  "Хорошо, я хочу купить Древний премиальный знак. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasMission, 248 )
	TriggerCondition( 1, NoItem, 4082, 1 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerCondition( 2, HasRecord, 249 )
	TriggerCondition( 2, NoRecord, 250 )
	TriggerCondition( 2, NoItem, 4082, 1 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerFailure( 2, JumpPage, 1 )

	Start( GetMultiTrigger(), 2 )

	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 274 )
	AddNpcMission ( 275 )
	AddNpcMission ( 276 )
	AddNpcMission	(1016)
	AddNpcMission	(1179)
	AddNpcMission	(69)
	AddNpcMission	(70)
	AddNpcMission	(71)
	AddNpcMission	(194)
	AddNpcMission	(195)
	AddNpcMission	(196)
	AddNpcMission	(318)
	AddNpcMission	(323)
	AddNpcMission	(324)
----------eleven
	AddNpcMission	(5053)

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈѕьЙЩЅ«Ў¤Ню¶ыЛ№



----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[Йіб°іЗґуК№Ў¤ПЇ°Н]			--
--							--
--		225648,270640				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk15 ()
Talk( 1, " Качнуть? " )

InitTrigger()
TriggerCondition( 1, HasMoney, 0 )
TriggerAction( 1, TakeMoney, 0 )
TriggerAction( 1, AddExp, 9000000 )

Text( 1, " Давай ", MultiTrigger, GetMultiTrigger(), 1)

end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Йіб°іЗґуК№Ў¤ПЇ°Н


----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[°ЧТшіЗЙМ»б»бі¤Ў¤АНВЧµПВнЛ№]		--
--							--
--		224207,274850				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk16 ()
	
	
	Talk( 1,  "Ронни: Я правитель и отвечаю за всю торговлю в этом городе. Я могу научить вас как стать самым богатым в Аргенте. " )
	
	AddNpcMission ( 271 )
	AddNpcMission ( 277 )
	AddNpcMission ( 278 )
	AddNpcMission ( 280 )
	AddNpcMission ( 286 )
------------1.7
	AddNpcMission (5076 )
	AddNpcMission (5077 )
	AddNpcMission (5078 )
	AddNpcMission (5079 )
	AddNpcMission (5088 )
	AddNpcMission (5110 )
	AddNpcMission (5112 )
	AddNpcMission (5114 )
	AddNpcMission (5116 )
	AddNpcMission (5147 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<°ЧТшіЗЙМ»б»бі¤Ў¤АНВЧµПВнЛ№

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[АПХЯЎ¤єэНїЙЅИЛ]			--
--							--
--		227208,270036				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk17 ()
	
	
	Talk( 1,  "Пачкули: Бабушка Белди печет самое вкусное печенье! " )

	AddNpcMission ( 266 )
	AddNpcMission ( 267 )
	AddNpcMission ( 270 )
	AddNpcMission ( 272 )
	AddNpcMission ( 273 )
	AddNpcMission ( 337 )
	AddNpcMission ( 338 )
	AddNpcMission ( 554 )
	AddNpcMission ( 555 )
	AddNpcMission ( 901 )
	---------------°ЧСт
	AddNpcMission	(5557)
	AddNpcMission	(5558)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<АПХЯЎ¤єэНїЙЅИЛ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[»бі¤ЦъАнЎ¤ВЮТБ]			--
--							--
--		224075,275275				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk18 ()
	
	
	Talk( 1,  "Рори: Я думаю у нашего правителя есть тайна и я действительно очень хочу ее узнать. " )
	
	AddNpcMission ( 76 )
	AddNpcMission ( 77 )
	AddNpcMission ( 78 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»бі¤ЦъАнЎ¤ВЮТБ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[В·ИЛЎ¤јЧ]				--
--							--
--		221588,282819				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk19 ()
	
	
	Talk( 1,  "Прохожий: Из всех морских монстров наибольший страх мне внушает Пузырчатый моллюск. Это правда! Я видел Однажды в порту огромную особь. Если бы в него не начали стрелять Сакура 13, я думаю он мог бы убить горожан. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤јЧ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ѕЖ№нЎ¤·ТµВДЪ]			--
--							--
--		236002,281965				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk20 ()
	
	
	Talk( 1,  "Энтони: Э? Что? Вы что то хотите? Боюсь вы не по адресу. " )
	
	AddNpcMission ( 500 )
	AddNpcMission ( 501 )
	AddNpcMission ( 358 )
	AddNpcMission ( 372 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕЖ№нЎ¤·ТµВДЪ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ЙЩДкЎ¤МЖµВ]			--
--							--
--		196225,269425				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk21 ()
	
	
	Talk( 1,  "Томми: Привет, я Томми. А вы? Монстры что то какие то неспокойные в последнее время. " )
	
	AddNpcMission ( 210 )
	AddNpcMission ( 211 )
	AddNpcMission	(1034)
	AddNpcMission	(1197)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ЙЩДкЎ¤МЖµВ

----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[ЦЖФмК¦Ў¤µВИшїЛ]			--
--							--
--		173269,278261				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk22 ()
	
	
	Talk( 1,  "Дезмонд: Работа ремесленника лучше чем у вас! Но вы люди слишком высокомерны чтобы это признать. " )
	
	AddNpcMission	(1054)
	AddNpcMission	(1216)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ЦЖФмК¦Ў¤µВИшїЛ


----------------------------------------------------------
--							--
--							--
--		°ЧТшіЗ[D°жЙМЎ¤ЧЯЛЅНГ]			--
--							--
--		2298,2520				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk23 ()
	
	
	Talk( 1,  "Контрабандист Банни: Запрещенные товары? Я имею все, в чем вы нуждаетесь! " )
	
	AddNpcMission	(1000)
	AddNpcMission	(1164)
			--------УЮИЛЅЪ
	--AddNpcMission	(5601)
	--AddNpcMission	(5602)
	--AddNpcMission	(5603)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<D°жЙМЎ¤ЧЯЛЅНГ


----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[єЈѕьЛѕБо№ЩЎ¤µВЛ№ЛюВЮ]		--
--							--
--		71350,141619				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk24 ()
	
	
	Talk( 1,  "Дессаро: Привет! Я являюсь самым главным в Громограде. Не желаете присоединится к нашей команде? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerCondition( 1, NoGuild )
	TriggerAction( 1, CreateGuild, 0 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Создать гильдию Флота ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 2,  "Дессаро: Чтобы создать гильдию Флота вы должны заплатить 100000 золота и принести Камень клятвы. так вы докажете вашу преданность. " )
        
	AddNpcMission	(566)
	AddNpcMission	(477)
	AddNpcMission	(478)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈѕьЛѕБо№ЩЎ¤µВЛ№ЛюВЮ


----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ѕЖ°Й·юОсФ±Ў¤ГЧДИ]			--
--							--
--		99053,133465				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk25 ()
	
	
	Talk( 1,  "Мона: Привет! Вы слышали про пирата Сакура 13? Она мой идол! Я желаю поскорее оставить это скучное место и стать таким пиратом как она! " )
	AddNpcMission	(1022)
	AddNpcMission	(1079)
	AddNpcMission	(1134)
	AddNpcMission	(1185)
	AddNpcMission	(378)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕЖ°Й·юОсФ±Ў¤ГЧДИ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[Л®КЦЎ¤µП°В]			--
--							--
--		108330,128563				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk26 ()
	
	
	Talk( 1,  "Дио: Привет! Я моряк Дио. Будьте осторожны в открытом море, там есть много свирепых монстров, а особенно акулы! Они откусят вам ногу также как мою. О, моя бедная нога... " )
	AddNpcMission	(1038)
	AddNpcMission	(1092)
	AddNpcMission	(1150)
	AddNpcMission	(1201)
----------------јЄДбЛ№---Л®КЦЎ¤µП°В--01
	AddNpcMission (5535 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Л®КЦЎ¤µП°В






----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ѕьТЅЎ¤ВкЙі]			--
--							--
--		77300,154900				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk28 ()
	
	
	Talk( 1,  "Маса: С вами что то не так? Я военный доктор Громограда. Не ищите меня по пустякам! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)

	AddNpcMission	(1024)
	AddNpcMission	(1081)
	AddNpcMission	(1136)
	AddNpcMission	(1187)
	----------------1.7
	AddNpcMission (5130 )
	AddNpcMission (5131 )
	AddNpcMission (5132 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕьТЅЎ¤ВкЙі

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ТшРРіцДЙЎ¤ВкїЁ¶а]			--
--							--
--		74300,153400				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk29 ()
	
	
	Talk( 1,  "Макурдо: Добро пожаловать в банк Громограда! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (200 золотых) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "Простите, у вас недостаточно золота для входа в хранилище! " )

	AddNpcMission	(1049)
	AddNpcMission	(1103)
	AddNpcMission	(1159)
	AddNpcMission	(1211)
	AddNpcMission	(320)
	AddNpcMission	(375)
	AddNpcMission	(376)
	AddNpcMission	(377)
	AddNpcMission	(432)
	AddNpcMission	(560)
	AddNpcMission	(561)
	AddNpcMission	(542)
	AddNpcMission	(562)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ТшРРіцДЙЎ¤ВкїЁ¶а


----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[МъЅіЎ¤·рАКёз]			--
--							--
--		76662,144769				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk30 ()
	
	
	Talk( 1,  "Фурлингтон: Что? Плавка? Хехе. " )
	Text( 1,  "Очистить ", JumpPage, 2)
	Text( 1,  "Ничего... ",CloseTalk )


----------------Б¶ЦЖЛ®ѕ§Й°ЛйЖ¬
	InitTrigger()
	TriggerCondition( 1, HasItem, 1784, 10 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1784, 10 )
	TriggerAction( 1, GiveItem, 1785, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Фурлингтон: Ковка, ковка, ковка. И так каждый день, одна ковка. " )
	Text( 2,  "Очистить Кусок звенящего кристалла. ",MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 3,  "Фурлингтон: Ваш Кусок звенящего кристалла готов. Ищите меня снова если потребуется помощь. " )
	Talk( 4,  "Фурлингтон: Чтобы приготовить 1 Кусок звенящего кристалла мне необходимо 10 Звенящего песка и 200 золота. " )
	AddNpcMission	(1042)
	AddNpcMission	(1094)
	AddNpcMission	(1153)
	AddNpcMission	(1205)


	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<МъЅіЎ¤·рАКёз
----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ЙЩЕ®Ў¤РБµЩ]			--
--							--
--		74026,145143				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk31 ()
	
	
	Talk( 1,  "Синди: Привет! Я люблю хороший материал. Если вы найдете что то ценное, то сохраните для меня. " )
	
	Text( 1,  "Дворец Овна-вампира (Гороскоп) ", JumpPage,6 )
	Text( 1,  "Награда моряка ", JumpPage,8 )
	Text( 1,  "Награда пирата ", JumpPage,11 )
	Text( 1,  "Награда капитана ", JumpPage,12 )
	Text( 1,  "Сделать краситель для волос ", JumpPage, 2)

	Talk( 6,  "Синди: Пожалуйста выберите сложность в порядке от моряка к капитану. Чем больше сложность, тем более лучшие награды. Вы сделали выбор? Изменить его потом будет невозможно! " )

	InitTrigger()
	TriggerCondition( 1, NoRecord,834 )
	TriggerCondition( 1, NoRecord,835 )
	TriggerAction( 1, SetRecord, 833 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "Моряк ",MultiTrigger_1, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord,833 )
	TriggerCondition( 1, NoRecord,835 )
	TriggerAction( 1, SetRecord, 834 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "Пират ",MultiTrigger_2, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord,834 )
	TriggerCondition( 1, NoRecord,833 )
	TriggerAction( 1, SetRecord, 835 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "Капитан ",MultiTrigger_3, GetMultiTrigger(), 1)

	Talk( 7,  "Синди: Желаю удачи! " )
  



	InitTrigger()
	TriggerCondition( 1, HasRecord,833 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )
	TriggerAction( 1, SetLog  , 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 1 , 4)
	TriggerAction( 1, AddMoney, 10000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 8,  "Синди: Соберите 7 эмблем для получения Печати Овна и пропуска к следующему дворцу. " )
	Text( 8,  "Обменять ",MultiTrigger_0, GetMultiTrigger(), 1)



	InitTrigger()
	TriggerCondition( 1, HasRecord,834 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 3 , 4)
	TriggerAction( 1, AddMoney, 50000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 11,  "Синди: Соберите 7 эмблем для получения Печати Овна и пропуска к следующему дворцу. " )
	Text( 11,  "Обменять ",MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerCondition( 1, HasRecord,835 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 5 , 4)
	TriggerAction( 1, AddMoney, 80000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 12,  "Синди: Соберите 7 эмблем для получения Печати Овна и пропуска к следующему дворцу. " )
	Text( 12,  "Обменять ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10,  "Синди: Вы не собрали все эмблемы, или ваш инвентарь заблокирован. Возможно также у вас нет свободных ячеек. ")
	Talk( 9,  "Синди: Дворец Тельца ждет вас! ")
	Talk( 13,  "Синди: Вы можете делать свой выбор лишь 1 раз! ")

	InitTrigger()
	TriggerCondition( 1, HasItem, 1789, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1789, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1799, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Синди: Планируете сменить прическу? Я приготовлю для вас лучшие красители! " )
	Text( 2,  "Сделать Желтый краситель ",MultiTrigger, GetMultiTrigger(), 1)
---------------µчЕдВМЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1790, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1790, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1800, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "Сделать Зеленый краситель ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Синди: Вот краситель, в котором вы нуждались! " )
	Talk( 4,  "Синди: Чтобы сделать Желтый краситель необходмо 5 Желтых красок, 1 Особый газ, 1 радужный стакан и 200 золотых! " )
	Talk( 5,  "Синди: Чтобы сделать Зеленый краситель необходмо 5 Зеленых красок, 1 Особый газ, 1 радужный стакан и 200 золотых! " )
	AddNpcMission	(1036)
	AddNpcMission	(1090)
	AddNpcMission	(1148)
	AddNpcMission	(1199)
	AddNpcMission	(867)
	AddNpcMission	(863)
	------------------------------------------
	AddNpcMission	(5536)
	AddNpcMission	(5537)
	AddNpcMission	(5538)
	AddNpcMission	(5539)
	AddNpcMission	(5540)
	AddNpcMission	(5541)

	AddNpcMission	(5542)
	AddNpcMission	(5543)
	AddNpcMission	(5544)
	AddNpcMission	(5545)
	AddNpcMission	(5546)
	AddNpcMission	(5547)

	AddNpcMission	(5548)
	AddNpcMission	(5549)
	AddNpcMission	(5550)
	AddNpcMission	(5551)
	AddNpcMission	(5552)


	AddNpcMission	(5597)
	AddNpcMission	(5600)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ЙЩЕ®Ў¤РБµЩ


----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[Йіб°Ч¤АЧцЄ±¤ґуК№Ў¤°ЈµВјУ]		--
--							--
--		71220,150827				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk32 ()
	
	
	Talk( 1,  "Аликс: Привет! Я посол Шайтана. У вас есть вопросы? Если что ищите меня в этом месте! " )
	AddNpcMission	(1033)
	AddNpcMission	(1088)
	AddNpcMission	(1145)
	AddNpcMission	(1196)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Йіб°Ч¤АЧцЄ±¤ґуК№Ў¤°ЈµВјУ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[µАѕЯЙМИЛЎ¤РЭІјАоО¬Л№]		--
--							--
--		74100,156300				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk33 ()
	
	
	Talk( 1,  "Уисли: Привет! Я тоже новичок в этом городе. Прошу вас посещайте меня почаще. " )

	AddNpcMission	(1008)
	AddNpcMission	(1063)
	AddNpcMission	(1118)
	AddNpcMission	(1172)
	AddNpcMission	(850)
	AddNpcMission	(861)
	AddNpcMission	(868)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<µАѕЯЙМИЛЎ¤РЭІјАоО¬Л№

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ВГ№ЭАП°еЎ¤ВкСЕЖЕЖЕ]		--
--							--
--		69761,154269				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk34 ()
	
	
	Talk( 1,  "Бабушка Майа: Моя гостиница закрыта, поскольку мне нездоровится. " )
	AddNpcMission	(1030)
	AddNpcMission	(1086)
	AddNpcMission	(1139)
	AddNpcMission	(1193)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ВГ№ЭАП°еЎ¤ВкСЕЖЕЖЕ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[·юЧ°µкЦчЎ¤µПАЦ]			--
--							--
--		75450,151200				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk35 ()
	
	
	Talk( 1,  "Диттер: Привет! В данный момент мы закрыты! " )
	Text( 1,  "Спасибо... ",CloseTalk )
	AddNpcMission	(1010)
	AddNpcMission	(1066)
	AddNpcMission	(1122)
	AddNpcMission	(1174)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·юЧ°µкЦчЎ¤µПАЦ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[°ЧТшіЗЧ¤АЧцЄ±¤ґуК№Ў¤ТБЛю¶а]		--
--							--
--		74171,155325				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk36 ()
	
	
	Talk( 1,  "Ята: Только злые торговцы сделали его таким большим. Хахаха. " )
	AddNpcMission	(1003)
	AddNpcMission	(1058)
	AddNpcMission	(1113)
	AddNpcMission	(1167)
--	AddNpcMission ( 6025 )
--	AddNpcMission ( 6026 )
--	AddNpcMission ( 6027 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<°ЧТшіЗЧ¤АЧцЄ±¤ґуК№Ў¤ТБЛю¶а

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[»¤ОАі¤Ў¤еИВФїЛ]			--
--							--
--		79600,148800				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk37 ()
	
	
	Talk( 1,  "Мэллоу: Привет! Я стражник крепости Громограда. " )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 1 )
	TriggerCondition( 1, HasItem, 1673, 1 )
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerAction( 1, TakeItem, 1673, 1 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, SetProfession, 10 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 2 )
	TriggerCondition( 2, PfEqual, 1 )
	TriggerCondition( 2, HasItem, 1673, 1 )
	TriggerCondition( 2, HasMoney, 20000 )
	TriggerAction( 2, TakeItem, 1673, 1 )
	TriggerAction( 2, TakeMoney, 20000 )
	TriggerAction( 2, SetProfession, 10  )
	TriggerAction( 2, JumpPage, 3 )
	TriggerFailure( 2, JumpPage, 4 )

	Talk(2,  "Pirates and monsters are rampant nowadays. We are lacking of Swordsman to deal with them. Hmm...You look suitable to become a Swordsman. Want to consider being the one to defend the peace? ")
	Text(2,  "Ok, become a White Knight ", MultiTrigger, GetMultiTrigger(), 2)
	Text(2,  "No, it is good enough for now. ", CloseTalk)

	Talk(3,  "Keeping the peace is the job of a White Knight. Please remember this in your heart. ")

	Talk(4,  "Want to become a White Knight? Come back to me when you have reached Lv 40. You must train your swordsmanship well. Remember to bring 1 Strange Metal Fragment and 20000G as a proof of your training too. ")
	

	
	
	
		

	----------ЧЄЦ°іЙОЄЅЈ¶ЬКї
	--TriggerCondition( 1, LvCheck,  "> ", 39 )
	--TriggerCondition( 1, IsCategory, 1 )
	--TriggerCondition( 1, PfEqual, 1 )
	--TriggerAction( 1, JumpPage, 2 )

	--TriggerCondition( 2, LvCheck,  "> ", 39 )
	--TriggerCondition( 2, IsCategory, 2 )
	--TriggerCondition( 2, PfEqual, 1 )
	--TriggerAction( 2, JumpPage, 2 )

-------------------ЧЄѕС»чКЦЕР¶П

	AddNpcMission	(1019)
	AddNpcMission	(1074)
	AddNpcMission	(1130)
	AddNpcMission	(1182)
	AddNpcMission	(852)
	AddNpcMission	(855)
	AddNpcMission	(865)
	AddNpcMission	(473)

	MisListPage(5)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤ОАі¤Ў¤еИВФїЛ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ФУ»хЙМИЛЎ¤№ѕаЅ]			--
--							--
--		72500,155100				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk38 ()
	
	
	Talk( 1,  "Куду: Привет! Вы прибыли как раз вовремя. Вы можете получить скидку у меня! " )
	Text( 1,  "Ничего... ",CloseTalk )
	AddNpcMission	(1053)
	AddNpcMission	(1107)
	AddNpcMission	(1163)
	AddNpcMission	(1215)

		
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ФУ»хЙМИЛЎ¤№ѕаЅ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[ЙЩЕ®Ў¤ВЮАт]			--
--							--
--		101653,128642				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk39 ()
	
	
	Talk( 1,  "Риоли: Вы были во многих местах. Встречали ли вы Генерала Вильяма? Его отправили в Аргент. Слишком скучное место. " )
	AddNpcMission	(1035)
	AddNpcMission	(1089)
	AddNpcMission	(1147)
	AddNpcMission	(1198)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ЙЩЕ®Ў¤ВЮАт

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[єЈѕьЧЬІїЦё»У№ЩЎ¤»щ.°ЈЛ№ОчЧјЅ«]	--
--							--
--		80800,152100				--
---------------------2005-3-8-------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk40 ()
	
	
	Talk( 1,  "Генерал Кен: Я чувствую Макси затевает мне неприятности. Он всегда устраивает для меня мнеприятности. " )
	AddNpcMission	(1017)
	AddNpcMission	(1071)
	AddNpcMission	(1127)
	AddNpcMission	(1180)
---------------°ЧСт
	AddNpcMission	(5575)
	AddNpcMission	(5576)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈѕьЧЬІїЦё»У№ЩЎ¤»щ.°ЈЛ№ОчЧјЅ«

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[єЈѕьЧЬІїІОД±і¤Ў¤ВкСЗЧИЙЩРЈ]		--
--							--
--		65323,150512				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk41 ()
	
	
	Talk( 1,  "Полковник Макси: Привет! Генерал Кен отправил меня заботится об этом месте. Хехе. Я люблю устраивать ему неприятности. " )
	
	AddNpcMission	(849)
	AddNpcMission	(856)
	AddNpcMission	(858)
	AddNpcMission	(860)
	AddNpcMission	(866)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈѕьЧЬІїІОД±і¤Ў¤ВкСЗЧИЙЩРЈ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[Д¦¶ыїЛИЛєуТбЎ¤·Ж¶щ]		--
--							--
--		65146,158595				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk42 ()
	
	
	Talk( 1,  "Фрея: Вы парни считаете нас за демонов? Не заговаривайте со мной! " )
	
	AddNpcMission	(851)
	AddNpcMission	(853)
	AddNpcMission	(854)
	AddNpcMission	(862)
	AddNpcMission	(864)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Д¦¶ыїЛИЛєуТбЎ¤·Ж¶щ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[»¤ОАЎ¤ДбЛЙ]			--
--							--
--		71187,141438				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk43 ()
	
	
	Talk( 1,  "Ниссон: Привет! Я близкий друг Сонни. Мы с ним оба превосходные стражники Флота! " )

	AddNpcMission	(859)
	AddNpcMission	(857)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤ОАЎ¤ДбЛЙ

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[»¤ОАЎ¤ЛЙДб]			--
--							--
--		71536,141462				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk44 ()
	
	
	Talk( 1,  "Сонни: Привет! Никогда не заговаривай со мной о деньгах! " )

	AddNpcMission	(474)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤ОАЎ¤ЛЙДб

----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[В·ИЛЎ¤±ы]				--
--							--
--		66976,155428				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk45 ()
	
	
	Talk( 1,  "Бей: Громоград имеет хороший бар в порту. К сожалению туда очень далеко добираться. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤±ы


----------------------------------------------------------
--							--
--							--
--		АЧцЄ±¤[В·ИЛЎ¤°Н±И]				--
--							--
--		99475,123473				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk46 ()
	
	
	Talk( 1,  "Барби: Привет! Действительно ли вы бывший пират? В Громограде встречаются только люди из флота, пираты не осмеливаются туда приближаться. " )
	Text( 1,  "Очистить ", JumpPage, 2)

--------------Б¶ФмµШЅр
	InitTrigger()
	TriggerCondition( 1, HasItem, 1782, 10 )
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, TakeItem, 1782, 10 )
	TriggerAction( 1, GiveItem, 1783, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Барби: Моя работа - объединять множество фрагментов руды в одну. " )
	Text( 2,  "Очистить Терранский золотой ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Барби: Я дам вам Терранский золотой. Не пожалейте в будущем. " )
	Talk( 4,  "Барби: Терранский золотой? Принесите мне 10 Терранской золотой руды и 2000 золота. " )
	
	--Священный огонь
    AddNpcMission	(6256)
	AddNpcMission	(6257)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤°Н±И

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[ґуЙс№ЩЎ¤ёКµШО¬А­]			--
--							--
--		86299,350092				--
 
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk47 ()
	
	
	Talk( 1,  "Боб: Здравствуй мой друг. Да благославит тебя Богиня Кара! Я высший священник Шайтана " )
	Text( 1,  "Ясненько ", JumpPage, 2)
	
	AddNpcMission ( 203 )
	AddNpcMission ( 204 )
	AddNpcMission ( 205 )
	AddNpcMission ( 206 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ґуЙс№ЩЎ¤ёКµШО¬А­


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[КПЧеі¤Ў¤°ўІј¶аВЮ.Ао]		--
--							--
--		90374,364023				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk48 ()
	
	
	Talk( 1,  "Альбуда: Привет, я руководитель клана. Могу я чем то помочь? " )
	InitTrigger()
	TriggerCondition( 1, HasMission, 1014 )
	TriggerCondition( 1, HasRecord, 1013 )
	TriggerCondition( 1, NoRecord, 1059 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "Выбрать путь перерождения ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerCondition( 1, HasRecord, 1059 )
	TriggerCondition( 1, HasNOZSExp )
	TriggerCondition( 1, NoRecord, 1056 )
	TriggerAction( 1, JumpPage, 5 )
	TriggerFailure( 1, JumpPage, 6)
	Text( 1,  "Сменить путь перерождения ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 1,  "До свидания ", CloseTalk)


	InitTrigger()
	TriggerAction( 1, SetRecord, 1015 )
	TriggerAction( 1, SetRecord, 1059 )
	TriggerAction( 1, JumpPage, 4 )
	Talk( 2,  "Альбуда: Для перерождения есть 2 пути. Вы вправе выбрать любой из них. Первый - сложный. Вам на пути встретятся очень сильные монстры и опасные задания. Второй путь - долгий. Этот путь для терпеливых. ")
	Text( 2,  "Сложный путь ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerAction( 1, SetRecord, 1016 )
	TriggerAction( 1, SetRecord, 1059 )
	TriggerAction( 1, JumpPage, 4 )
	Text( 2,  "Долгий путь ",MultiTrigger, GetMultiTrigger(), 1  )

	Talk( 3,  "Альбуда: Вы не можете выбрать путь перерождения или уже выбрали ")

	Talk( 4,  "Альбуда: После выбора пути посетите Тинк! ")


	InitTrigger()
	TriggerCondition( 1, HasRecord, 1016 )
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerAction( 1, ClearRecord, 1016 )
	TriggerAction( 1, SetRecord, 1015 )
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8)
	Talk( 5,  "Альбуда: Смена пути перерождения потребует высокой цены. Готовы вы заплатить за это 5000000 золота? ")
	Text( 5,  "Изменить на сложный путь ",MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition( 1, HasRecord, 1015 )
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerAction( 1, ClearRecord, 1015 )
	TriggerAction( 1, SetRecord, 1016 )
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8)
	Text( 5,  "Изменить на долгий путь ",MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 6,  "Альбуда: Вы не можете сменить путь перерождения. Это путь для игроков сожалеющих о ранее выбранном пути. ")

	Talk( 7,  "Альбуда: Теперь вы должны работать усерднее. ")

	Talk( 8,  "Альбуда: У вас недостаточно золота или данный путь уже выбран. ")

	AddNpcMission ( 231 )
	AddNpcMission ( 232 )
	AddNpcMission ( 234 )
	AddNpcMission	(1037)
	AddNpcMission	(1091)
	AddNpcMission	(1149)
	AddNpcMission	(1200)
	AddNpcMission(	1228	)
	AddNpcMission	(327)
	AddNpcMission	(339)
	AddNpcMission	(340)
	AddNpcMission ( 6017 )
	AddNpcMission ( 6018 )
	



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<КПЧеі¤Ў¤°ўІј¶аВЮ.Ао


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[µАѕЯµкЦчЎ¤Е·µФ]			--
--							--
--		86214,359121				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм


-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<µАѕЯµкЦчЎ¤Е·µФ


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[·юЧ°µкЦчЎ¤ДЄСЗ]			--
--							--
--		89463,360213				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk50 ()
	
	
	Talk( 1,  "Мойа: Я потомственный портной. Посмотрите мои вещи, возможно вас что то заинтересует. " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Defence(	0365	)
	Defence(	0541	)
	Defence(	0717	)
	Defence(	0372	)
	Defence(	0548	)
	Defence(	0724	)
	Defence(	0366	)
	Defence(	0542	)
	Defence(	0718	)
	Defence(	0373	)
	Defence(	0549	)
	Defence(	0725	)
	Defence(	0368	)
	Defence(	0544	)
	Defence(	0720	)
	Defence(	0374	)
	Defence(	0550	)
	Defence(	0726	)
	Defence(	0367	)
	Defence(	0543	)
	Defence(	0719	)
	Defence(	0375	)
	Defence(	0551	)
	Defence(	0727	)
	Defence(	0369	)
	Defence(	0545	)
	Defence(	0721	)
	Defence(	0376	)
	Defence(	0552	)
	Defence(	0728	)
	Defence(	0370	)
	Defence(	0546	)
	Defence(	0722	)
	Defence(	0378	)
	Defence(	0554	)
	Defence(	0730	)
	Defence(	0371	)
	Defence(	0547	)
	Defence(	0723	)
	Defence(	0379	)
	Defence(	0555	)
	Defence(	0731	)
	Defence(	0383	)
	Defence(	0559	)
	Defence(	0735	)
	Defence(	0359	)
	Defence(	0535	)
	Defence(	0711	)
	Defence(	0381	)
	Defence(	0557	)
	Defence(	0733	)
	Defence(	0360	)
	Defence(	0536	)
	Defence(	0712	)
	Defence(	0389	)
	Defence(	0565	)
	Defence(	0741	)
	Defence(	0361	)
	Defence(	0537	)
	Defence(	0713	)
	Defence(	0390	)
	Defence(	0566	)
	Defence(	0742	)
	Defence(	0362	)
	Defence(	0538	)
	Defence(	0714	)
	Defence(	0385	)
	Defence(	0561	)
	Defence(	0737	)
	Defence(	0363	)
	Defence(	0539	)
	Defence(	0715	)
	Defence(	0392	)
	Defence(	0568	)
	Defence(	0744	)
	Defence(	0388	)
	Defence(	0564	)
	Defence(	0740	)
	Defence(	0382	)
	Defence(	0558	)
	Defence(	0734	)
	Defence(	0391	)
	Defence(	0567	)
	Defence(	0743	)


	AddNpcMission ( 715 )
	AddNpcMission	(1011)
	AddNpcMission	(1068)
	AddNpcMission	(1123)
	AddNpcMission	(1175)
	AddNpcMission(	1230	)
	



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·юЧ°µкЦчЎ¤ДЄСЗ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[ТшРРіцДЙЎ¤ЦмµПЛ№]			--
--							--
--		90637,353900				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk51 ()
	
	
	Talk( 1,  "Юдис: Привет! Добро пожаловать в Банк Шайтана. Могу ли я чем либо помочь? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (200 золота) ", MultiTrigger, GetMultiTrigger(), 1)
	--Text( 1,  "Покупка Купюр ", BuyPage )
	Text( 1,  "Покупка Купюр ", JumpPage, 3)
	Talk( 2,  "Прости, но у тебя недостаточно денег на счету " )

	InitTrade()
	Weapon(	7476	)
	Weapon(	7491	)
	Weapon(	7492	)
	Weapon(	7493	)
	
	AddNpcMission	(1051)
	AddNpcMission	(1104)
	AddNpcMission	(1160)
	AddNpcMission	(1213)
	AddNpcMission(	1231	)
-------eleven
	AddNpcMission(	5012	)	
	
Talk( 3, "В наличии остались только крупные купюры " )
--Text( 3,  "Купюра 10кк (10 штук)", JumpPage, 4)
--Text( 3,  "Купюра 10кк (50 штук)", JumpPage, 5)
--Text( 3,  "Купюра 50кк ", JumpPage, 6)
--Text( 3,  "Купюра 100кк ", JumpPage, 7)
Text( 3,  "Купюра 500.000 ", JumpPage, 8)
Text( 3,  "Купюра 500.000 10 штук", JumpPage, 7)
Text( 3,  "Купюра 1.000.000 ", JumpPage, 9)
Text( 3,  "Купюра 5.000.000 ", JumpPage, 10)
Text( 3,  "Купюра 50.000.000 ", JumpPage, 11)
Text( 3,  "Купюра 100.000.000", JumpPage, 12)
Text( 3,  "Купюра 500.000.000", JumpPage, 13)
Text( 3,  "Купюра 1.000.000.000", JumpPage, 14)
Talk( 4, "Ну для новичка сойдёт " )
InitTrigger()
TriggerCondition( 1, HasItem,7476,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7476,10 )
TriggerAction( 1, AddMoney, 100000000 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(4," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 5, "Вполне неплохо " )
InitTrigger()
TriggerCondition( 1, HasItem,7476,50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7476,50 )
TriggerAction( 1, AddMoney, 500000000 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(5," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 6, "Хорошо " )
InitTrigger()
TriggerCondition( 1, HasItem,7491,1 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7491,1 )
TriggerAction( 1, AddMoney, 50000000 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(6," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 7, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 5000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 5000000 )
TriggerAction( 1, GiveItem, 7493,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(7," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 8, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 500000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 500000 )
TriggerAction( 1, GiveItem, 7493,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(8," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 9, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 1000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 1000000 )
TriggerAction( 1, GiveItem, 854,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(9," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 10, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 5000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 5000000 )
TriggerAction( 1, GiveItem, 7734,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(10," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 11, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 50000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 50000000 )
TriggerAction( 1, GiveItem, 7735,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(11," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 12, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, GiveItem, 7742,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(12," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 13, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 500000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 500000000 )
TriggerAction( 1, GiveItem, 7736,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(13," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 14, "Да ну?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 1000000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeMoney, 1000000000 )
TriggerAction( 1, GiveItem, 7743,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(14," Меняю ",MultiTrigger,GetMultiTrigger(),1)


	AddNpcMission ( 2024 )
	AddNpcMission ( 2025 )

end 

function r_talk52 ()
	
	
	Talk( 1,  "Франко: Я хотел вступить во Флот, но к сожалению из за недоразумения меня отправили сюда. " )
	Text( 1,  "Ничего... ",CloseTalk )
	
	
	----------------ЧЄЦ°іЙОЄСµКЮК¦
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 2 )
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerCondition( 1, HasItem, 3364, 1 )
	TriggerAction( 1, TakeItem, 3364, 1 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, SetProfession, 11 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 2 )
	TriggerCondition( 2, HasMoney, 20000 )
	TriggerCondition( 2, HasItem, 3364, 1 )
	TriggerAction( 2, TakeItem, 3364, 1 )
	TriggerAction( 2, TakeMoney, 20000 )
	TriggerAction( 2, SetProfession, 11  )
	TriggerAction( 2, JumpPage, 6 )
	TriggerFailure( 2, JumpPage, 7 )

	Talk(5,  "SighЎ­it's a pity that you are not a Beast Tamer. I believed that you have the ability to become one. Let me teach you how! ")
	Text(5,  "Ok, I will become a Beast Tamer ", MultiTrigger, GetMultiTrigger(), 2)
	Text(5,  "No, it is good enough for now. ", CloseTalk)

	Talk(6,  "How is it? I knew you are born to be a Beast Tamer! ")

	Talk(7,  "Want to become a Beast Tamer? Come back to me when you have reached Lv 40. Train your hunter skills well as they are important foundation for you to advance further. Remember to bring 1 Clarity Crystal and 20000G too. ")


	--TriggerCondition( 2, LvCheck,  "> ", 39 )
	--TriggerCondition( 2, IsCategory, 1 )
	--TriggerCondition( 2, PfEqual, 2 )
	--TriggerAction( 2, JumpPage, 5 )
	--TriggerCondition( 3, LvCheck,  "> ", 39 )
	--TriggerCondition( 3, IsCategory, 3 )
	--TriggerCondition( 3, PfEqual, 2 )
	--TriggerAction( 3, JumpPage, 5 )
	

	--Start( GetMultiTrigger(), 1 )
	

	AddNpcMission ( 243 )
	AddNpcMission ( 244 )
	AddNpcMission	(1012)
	AddNpcMission	(1069)
	AddNpcMission	(1124)
	AddNpcMission	(1176)
	AddNpcMission	(88)
	AddNpcMission	(89)
	AddNpcMission	(90)
	AddNpcMission(	1232	)
	



	
	MisListPage(5)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ёЫОА¶УіЙФ±Ў¤рСріІЭ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[МъЅіЎ¤Н­Н­№Д]			--
--							--
--		90424,349871				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk53 ()
	
	
	Talk( 1,  "Кузнец:при улучшении экипировки,убедитесь что в вашем инвентаре достаточно свободного места!При полном инвентаре вещь исчезает! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Улучшение экипировки ", OpenItemTiChun)
	Text( 1,  "Комбинация самоцветов ", OpenUnite)
	Text( 1,  "Вставить самоцвет ", OpenForge)
	Text( 1,  "Улучшение аппарели ", OpenUpgrade)
	Text( 1,  "Вставить в аппарель ", OpenFusion)
	Text( 1,  "Сделать слот ", OpenMilling)
	Text( 1,  "Ремонт ", OpenRepair )


	InitTrade()
	Weapon(	0453	)
	Weapon(	0454	)
	Weapon(	0891	)
	Weapon(	0890	)
	Weapon(	1020	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	0886	)

	Defence( 6819	) 
	Defence( 6822	)
    Defence( 6825	) 
    Defence( 6828	) 
	Defence( 6831	)
	Defence( 0878	) 
	Defence( 0879	)
    Defence( 0880	) 
    Defence( 0881	) 
    Defence( 0882	)
	Defence( 0883	) 
	Defence( 0884	)
	Defence( 0887	) 
    
	Defence( 5772	) 
	Defence( 5773	)
    Defence( 5774	) 
    Defence( 5775	) 

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<МъЅіЎ¤Н­Н­№Д




--------------------------------------------------------------МъЅіµДНЅµЬ 
function mmm_talk04 ()
Talk( 1,  "Ученик: Привет! Когда я выросту,я хочу быть похожим на кузнеца! " )
Text( 1, " Теневой Самоцвет ", JumpPage, 2)
Text( 1, " Самоцвет Духа ", JumpPage, 3)
Text( 1, " Удар Лока ", JumpPage, 4)
Text( 1, " Уклонение Бинга ", JumpPage, 5)
Text( 1, " Защита Фенга ", JumpPage, 6)
Text( 1, " Усиление Акулы ", JumpPage, 7)

Talk( 2," Выбери нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 8)
Text( 2, " 3 уровень ", JumpPage, 9)
Text( 2, " 4 уровень ", JumpPage, 10)
Text( 2, " 5 уровень ", JumpPage, 11)

Talk( 3," Выбери нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 12)
Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)

Talk( 4," Выбери нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 16)
Text( 4, " 3 уровень ", JumpPage, 17)
Text( 4, " 4 уровень ", JumpPage, 18)
Text( 4, " 5 уровень ", JumpPage, 19)

Talk( 5," Выбери нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 20)
Text( 5, " 3 уровень ", JumpPage, 21)
Text( 5, " 4 уровень ", JumpPage, 22)
Text( 5, " 5 уровень ", JumpPage, 23)

Talk( 6," Выбери нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 24)
Text( 6, " 3 уровень ", JumpPage, 25)
Text( 6, " 4 уровень ", JumpPage, 26)
Text( 6, " 5 уровень ", JumpPage, 27)

Talk( 7," Выбери нужный уровень самоцвета " )
Text( 7, " 2 уровень ", JumpPage, 28)
Text( 7, " 3 уровень ", JumpPage, 29)
Text( 7, " 4 уровень ", JumpPage, 30)
Text( 7, " 5 уровень ", JumpPage, 31)


Talk(8," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(8,'Отдать',FastCombiner,884,2)

Talk(9," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(9,'Отдать',FastCombiner,884,3)

Talk(10," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(10,'Отдать',FastCombiner,884,4)

Talk(11," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(11,'Отдать',FastCombiner,884,5)

Talk(12," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(12,'Отдать',FastCombiner,887,2)

Talk(13," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(13,'Отдать',FastCombiner,887,3)

Talk(14," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(14,'Отдать',FastCombiner,887,4)

Talk(15," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(15,'Отдать',FastCombiner,887,5)

Talk(16," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(16,'Отдать',FastCombiner,5772,2)

Talk(17," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(17,'Отдать',FastCombiner,5772,3)

Talk(18," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(18,'Отдать',FastCombiner,5772,4)

Talk(19," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(19,'Отдать',FastCombiner,5772,5)

Talk(20," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(20,'Отдать',FastCombiner,5773,2)

Talk(21," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(21,'Отдать',FastCombiner,5773,3)

Talk(22," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(22,'Отдать',FastCombiner,5773,4)

Talk(23," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(23,'Отдать',FastCombiner,5773,5)

Talk(24," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(24,'Отдать',FastCombiner,5774,2)

Talk(25," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(25,'Отдать',FastCombiner,5774,3)

Talk(26," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(26,'Отдать',FastCombiner,5774,4)

Talk(27," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(27,'Отдать',FastCombiner,5774,5)

Talk(28," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(28,'Отдать',FastCombiner,5775,2)

Talk(29," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(29,'Отдать',FastCombiner,5775,3)

Talk(30," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(30,'Отдать',FastCombiner,5775,4)

Talk(31, "Для этого нужно 16 самоцвета и 5кк золота! " )
Text(31,'Отдать',FastCombiner,5775,5)
end

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[АтДИ]				--
--							--
--		88307,352019				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk54 ()
	
	
	Talk( 1,  "Продавец Фей: Привет! Я жена кузнеца!Достигнув определённого уровня,ты сможешь получить задания на фрукты фей " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Улучшение Фей ", OpenItemTiChun )
	Text( 1,  "Великие Фрукты Фей 200-500 ", JumpPage, 2)
	Text( 1,  "Легендарные Фрукты Фей 500-800 ", JumpPage, 11)
	Text( 1,  "Обмен Монет Фей ", JumpPage, 8)
	Text( 1,  "Расскажи про задания ", JumpPage, 17)
	
	Talk( 2," Выберите нужный фрукт " )
	Text( 2, " Фрукт Силы ", JumpPage, 3)
	Text( 2, " Фрукт Ловкости ", JumpPage, 4)
	Text( 2, " Фрукт Точности ", JumpPage, 5)
	Text( 2, " Фрукт Телосложения ", JumpPage, 6)
	Text( 2, " Фрукт Духа ", JumpPage, 7)
	
	Talk( 8," Эльфийская печать будет стоить 30 монет феи,а королевская аж 500! " )
	Text( 8, " Эльфийская Печать ", JumpPage, 9)
	Text( 8, " Королевская Печать ", JumpPage, 10)
	
	Talk( 11," Выберите нужный фрукт " )
	Text( 11, " Фрукт Силы ", JumpPage, 12)
	Text( 11, " Фрукт Ловкости ", JumpPage, 13)
	Text( 11, " Фрукт Точности ", JumpPage, 14)
	Text( 11, " Фрукт Телосложения ", JumpPage, 15)
	Text( 11, " Фрукт Духа ", JumpPage, 16)
	
	Talk( 17," Для Задания Фрукта Феи Анжелы тебе необходим 500 уровень.Для Феи Анжелы Младшей - 1000 уровень.Для Феи Августа - 2000 уровень! " )
	
	Talk( 3," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )

	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7431,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(3,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(3,"10 Фруктов ", JumpPage, 18)
	
	Talk(4," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7430,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(4,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(4,"10 Фруктов ", JumpPage, 19)
	
	Talk(5," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7433,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(5,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(5,"10 Фруктов ", JumpPage, 20)
	
	Talk(6," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7419,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(6,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(6,"10 Фруктов ", JumpPage, 21)
	
	Talk(7," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7434,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(7,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(7,"10 Фруктов ", JumpPage, 22)
	
	Talk(9," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2588,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,30,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(9,"1 Штука ",MultiTrigger,GetMultiTrigger(),1)
	Text(9,"10 Штук ", JumpPage, 28)
	
	Talk(10," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2589,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2589,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,500,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(10,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(12," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7506,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(12,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(12,"10 Фруктов ", JumpPage, 23)
	
	Talk(13," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7505,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(13,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(13,"10 Фруктов ", JumpPage, 24)
	
	Talk(14," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7507,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(14,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(14,"10 Фруктов ", JumpPage, 25)
	
	Talk(15," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7504,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(15,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(15,"10 Фруктов ", JumpPage, 26)
	
	Talk(16," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7508,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(16,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(16,"10 Фруктов ", JumpPage, 27)
	
	Talk(29," Недостаточно свободного места,либо необходимого лута " )
	
	Talk(18," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7431,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(18,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7430,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(19,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7433,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(20,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7419,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(21,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7434,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(22,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7506,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(23,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

	Talk(24," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7505,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(24,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7507,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(25,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(26," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7504,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(26,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(27," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7508,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(27,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2588,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,300,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(28,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
    Weapon(	0681	)
	Weapon(	2312	)
	Weapon(	0247	)
	Weapon(	0244	)
	Weapon(	0250	)
	Weapon(	0253	)
	Weapon(	0260	)
    Weapon(	0609	)
	Defence(	0222	)
	Defence(	0223	)
	Defence(	0224	)
	Defence(	0225	)
	Defence(	0226	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Other(  3300    )
	Other(  3462    )
	
	AddNpcMission ( 991 )
	AddNpcMission ( 906 )
	AddNpcMission ( 2041 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<АтДИ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[ФУ»хЙМИЛЎ¤°¬Д«]			--
--							--
--		84040,358567				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk55 ()
	
	
	Talk( 1,  "Амос: Только у меня самые последние разработки. Даже не трудитесь смотреть в другом месте. " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Комбинация самоцветов ", OpenUnite)

	InitTrade()
	Weapon(	3206	)
	Weapon(	3208	)
	Weapon(	3205	)
	Weapon(	3242	)
	Weapon(	3210	)
	Weapon(	3207	)
	Weapon(	3211	)
	Weapon(	3215	)
	Weapon(	3212	)
	Weapon(	3209	)
	Weapon(	3220	)
	Weapon(	3222	)
	Weapon(	3219	)
	Weapon(	3218	)
	Weapon(	3216	)
	Weapon(	3223	)
    Weapon(	3217	)
	Weapon(	3224	) 
	Weapon(	3187	)
	Weapon(	3188	)
	Weapon(	3190	)
	Weapon(	3197	)
	Weapon(	3239	)
	Weapon(	3241	)
	Weapon(	3193	)
	Weapon(	3192	)
	Weapon(	3202	)
	Weapon(	3203	)
	Weapon(	3204	)
	Weapon(	3198	)
	Weapon(	3229	)
	Weapon(	3228	)
	Weapon(	3235	)
	Weapon(	3237	)
	Weapon(	3233	)
	Weapon(	3231	)
	Weapon(	3232	)
	Weapon(	3234	)
	Weapon(	3230	)
	Weapon(	3236	)
	Weapon(	3227	)
	Defence(	3160	)
	Defence(	3164	)
	Defence(	3238	)
	Defence(	3170	)
	Defence(	3176	)
	Defence(	3297	)
	Defence(	3174	)
	Defence(	3298	)
	Defence(	3293	)
	Defence(	3177	)
	Defence(	3163	)
	Defence(	3161	)
	Defence(	3179	)
	Defence(	3180	)
	Defence(	3165	)
	Defence(	3167	)
	Defence(	3168	)
	Defence(	3166	)	
	Defence(	3173	)
	Defence(	3162	)	
    Defence(	3172	)		
	Other(  3296    )
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
    Other(  2440     )
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ФУ»хЙМИЛЎ¤°¬Д«

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[ВГµкАП°еЎ¤№юёщ]			--
--							--
--		81035,349813				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk56 ()
	
	
	Talk( 1,  "Мокен: Привет! Не где остановиться? Я могу предложить чудесную комнату для двоих! " )
	Text( 1,  "Сделать десерт ", JumpPage, 2)


--------------------µчЕдОеІКБрБ§Ц­
	InitTrigger()
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasItem, 3121, 4 )
	TriggerCondition( 1, HasMoney, 50 )
	TriggerAction( 1, TakeMoney, 50 )
	TriggerAction( 1, TakeItem, 3121, 4 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 3127, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Мокен: Мой бизнес в этом году просто превосходен. Я уже распродал большую часть товара! " )
	Text( 2,  "Смешать Сок радужных фруктов ",MultiTrigger, GetMultiTrigger(), 1)

----------------µчЕдЧЫєП№ыЦ­
	InitTrigger()
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasItem, 3122, 1 )
	TriggerCondition( 1, HasItem, 3123, 1 )
	TriggerCondition( 1, HasItem, 3124, 1 )
	TriggerCondition( 1, HasItem, 3125, 1 )
	TriggerCondition( 1, HasMoney, 50 )
	TriggerAction( 1, TakeMoney, 50 )
	TriggerAction( 1, TakeItem, 3122, 1 )
	TriggerAction( 1, TakeItem, 3123, 1 )
	TriggerAction( 1, TakeItem, 3124, 1 )
	TriggerAction( 1, TakeItem, 3125, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 3128, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "Смешать Фруктовый коктейль ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Мокен: Напиток что вы заказали готов! Приятного времяпровождения! " )
	Talk( 4,  "Мокен: Простите, но для приготовления 1 Сока радужных фруктов необходимо 4 Радужных фрукта, 1 Радужный стакан и 50 золота. " )
	Talk( 5,  "Мокен: Простите, но для изготовления 1 Фруктового коктейля необходимо 1 Сок эльфийского фрукта, 1 Чай из красных фиников, 1 Грибной суп, 1 Сок из плодов дурмана, 1 Радужный стакан и 50 золота. " )
	AddNpcMission	(1138)
	AddNpcMission	(1161)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ВГµкАП°еЎ¤№юёщ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[»¤КїРЎЅгЎ¤АјАј]			--
--							--
--		87954,356282				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk57 ()
	
	Talk( 1,  "Всё для кача: Привет! Сегодня распродажа! " )
	Text( 1,  "Торг ", BuyPage )
   
	Weapon(	3096    )
	Weapon(	3097	)
	Weapon(	3094    )
	Weapon(	3095	)
	Weapon(	5694	)
	Weapon(	5695	)
	Weapon(	0849	)
    Defence(	3088	)
	Defence(	3089	)
	Defence(	3090	)
	Defence(	3091	)
	Defence(	3092	)
	Defence(	3093	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	)
	Defence(	3112	)
	Defence(	3113	)
	Other(	3098	)
	Other(	3099	)
	Other(	7837	)
	Other(	7838	)
	Other(	3143	)
	--Other(	3105	)
	--Other(	3107	)
	Other(	3047	)
	Other(	2440	)
	Other(	3301	)
	Other(	3463	)
	Other(	4603	)
	Other(	2816	)
	
end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤КїРЎЅгЎ¤АјАј

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[єЈµБЎ¤µВїЛ]			--
--							--
--		80262,364842				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk58 ()
	
	
	Talk( 1,  "Декки: Привет, я лидер пиратов-оборотней. В настоящий момент я на 7-ом месте в списке самых разыскиваемых пиратов флотом. Почему я тебе это рассказываю? Я не боюсь флота! Хехе " )
	AddNpcMission	(1125)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈµБЎ¤µВїЛ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[РВКЦЦёµјЎ¤А­Лї±М]			--
--							--
--		87614,357250				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<РВКЦЦёµјЎ¤А­Лї±М


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[єЈѕь°мКВґ¦№ЩФ±Ў¤°¬Оў¶ыЙЩРЈ]		--
--							--
--		86507,364804				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk61 ()
	
	
	Talk( 1,  "Адмирал Ник: Привет! Я первая девушка-офицер в этих местах! " )
	AddNpcMission	(1126)
	AddNpcMission	(98)
	AddNpcMission	(99)
	AddNpcMission	(150)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єЈѕь°мКВґ¦№ЩФ±Ў¤°¬Оў¶ыЙЩРЈ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[Йіб°іЗЙМ»б»бі¤Ў¤№ЕАы»ч]		--
--							--
--		87362,354566				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk62 ()
	
	
	Talk( 1,  "Гилье: Я люблю собирать странные вещи. Кроме того я всегда ищу товар по более низкой цене и продаю по более высокой. Меня можно назвать самым находчивым продавцом. " )
	Text( 1,  "До свидания ",CloseTalk )
	AddNpcMission	(1144)

	-----МъИЛБщПо
	AddNpcMission ( 6115 )
	AddNpcMission ( 6116 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Йіб°іЗЙМ»б»бі¤Ў¤№ЕАы»ч

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[В·ИЛЎ¤Йєєчіж]		--
--							--
--		84634,349945				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk63 ()
	
	
	Talk( 1,  "Вово: Малышу Дэниелю нельзя доверять. Я переехал сюда только чтобы быть от него подальше. " )

--	AddNpcMission ( 6028 )
--	AddNpcMission ( 6029 )
--	AddNpcMission ( 6054 )
--	AddNpcMission ( 6055 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤Йєєчіж

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[РЎСтЎ¤НюАы]			--
--							--
--		89875,368331				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk64 ()
	
	
	Talk( 1,  "Уоли: Привет! Я первая в мире говорящая овечка! Бееее " )

	AddNpcMission ( 233 )
	---------------°ЧСт
	AddNpcMission	(5565)
	AddNpcMission	(5566)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<РЎСтЎ¤НюАы

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[»бі¤ЦъАнЎ¤МбЛѕГж°ь]		--
--							--
--		87171,354774				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk65 ()
	
	
	Talk( 1,  "Тинтин: Мы всегда обещаем, но никогда не выполняем. " )
--	AddNpcMission ( 905 )
	----------------ЦЬЛк°ь
	AddNpcMission ( 5604 )
	AddNpcMission ( 5605 )
	AddNpcMission ( 5606 )
	AddNpcMission ( 5607 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»бі¤ЦъАнЎ¤МбЛѕГж°ь

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[В·ИЛЎ¤ТТ]				--
--							--
--		79792,355469				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk66 ()
	
	
	Talk( 1,  "Яй: Святая жрица в храме города Шайтана. Она благославляет своих приверженцов. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤ТТ

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[Йі·ЛЎ¤ЙБ№вПА°ЛКА]			--
--							--
--		108242,310135				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk67 ()
	
	
	Talk( 1,  "Супермум: Я великий потомок супермена! Я буду владеть всей пустыней с помощью своей супер силы! (О Боже, он опять грезит наяву) " )
	
	AddNpcMission ( 237 )
	AddNpcMission ( 238 )
	AddNpcMission ( 239 )
	AddNpcMission ( 240 )
	AddNpcMission ( 248 )
	AddNpcMission ( 557 )
--------eleven
	AddNpcMission (5011 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Йі·ЛЎ¤ЙБ№вПА°ЛКА


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[ИЛУгНхЧУЎ¤№юЙіМШ]			--
--							--
--		125471,349171				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk68 ()
	
	
	Talk( 1,  "Хассан: Хмм.. На днях я начал чувствовать здесь какой то особый запах. Как хочется узнать что же это такое... " )
	Text( 1,  "Комбинировать ", JumpPage, 2)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1785, 10 )
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, TakeItem, 1785, 10 )
	TriggerAction( 1, GiveItem, 1786, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Хассан: Кусок звенящего кристалла имеет небольшую ценность. Хотели бы вы объединить его в Звенящий кристалл? " )
	Text( 2,  "Объединить Звенящий кристалл ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Хассан: Ваш Звенящий кристалл готов. Приходите еще! " )
	Talk( 4,  "Хассан: Для создания Звенящего кристалла необходимы 10 Кусков звенящего кристалла и 2000 золота. " )
	-------------eleven
	AddNpcMission ( 5010)
	AddNpcMission ( 5014)
	AddNpcMission ( 5033)
	AddNpcMission ( 5034)
	---------------°ЧСт
	AddNpcMission	(5553)
	AddNpcMission	(5554)
	--Священный огонь
	AddNpcMission	(6258)
	AddNpcMission	(6259)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ИЛУгНхЧУЎ¤№юЙіМШ


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[АЦЖчЧЁјТЎ¤ЙіГ·¶э]			--
--							--
--		66465,609367				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk69 ()
	
	
	Talk( 1,  "Шамель: Привет! Я местный музыкант. " )
---------------°ЧСт
	AddNpcMission	(5559)
	AddNpcMission	(5560)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<АЦЖчЧЁјТЎ¤ЙіГ·¶э


----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[КҐЕ®Ў¤°¬ґп]			--
--							--
--		86248,330381				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk70 ()
	
	
	Talk( 1,  "Ада: Здравствуй мой друг. Пусть Кара благославляет твой путь. Я Верховная жрица Ада. " )

	AddNpcMission ( 756 )
	AddNpcMission ( 341 )
	AddNpcMission ( 356 )
	AddNpcMission ( 357 )
	AddNpcMission ( 521 )
	AddNpcMission ( 539 )
	AddNpcMission ( 540 )
	AddNpcMission ( 541 )
	AddNpcMission ( 552 )
	AddNpcMission ( 553 )
	AddNpcMission ( 556 )

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<КҐЕ®Ў¤°¬ґп

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[В·ИЛЎ¤·ЁАы¶ы]			--
--							--
--		93176,352977				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk71 ()
	
	
	Talk( 1,  "Файру: Знаете ли вы что у кактуса тоже бывают цветы? У них такой чудесный запах! " )
	
	AddNpcMission ( 210 )
	AddNpcMission ( 211 )
end
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤·ЁАы¶ы

----------------------------------------------------------
--							--
--							--
--		Йіб°іЗ[№¤»б»бі¤Ў¤·рИр]			--
--							--
--		83171,354853				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk72 ()
	
	Talk( 1,  "Форлан: Сила в единстве! Хотите бросить вызов одной из 3 самых сильных гильдий? Хотите править этим миром? " )
	Text( 1,  "Топ 3 гильдий ", ListChallenge)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<№¤»б»бі¤Ў¤·рИр

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[МъЅіЎ¤±©±щ]			--
--							--
--		134423,52988				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk73 ()
	
	
	Talk( 1,  "Бэш: Добро пожаловать! Я продаю все виды оружия! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ремонт ", OpenRepair)
	Text( 1,  "Вставить самоцвет ", OpenForge)
	Text( 1,  "Сделать слот ", OpenMilling)
	Text( 1,  "Вставить в аппарель ", OpenFusion)
	Text( 1,  "Улучшение аппарели ", OpenUpgrade)
	Text( 1,  "Ничего ",CloseTalk )

	Talk( 2,  "Бэш: Вставить самоцвет? Только кузнец Шайтана знает как это делать. " )

	Talk( 3, "Бэш: Хочешь соединить что-нибудь? Насколько я понимаю, тебе понадобится свиток ковки со списком необходимых предметов. Собери все, что понадобится, и поговори с Бакалейщиком - Амосом из Шайтана. Только он владеет искусством соединения." )


	InitTrade()
	Weapon(	0008	)
	Weapon(	0196	)
	Weapon(	0197	)
	Weapon(	0198	)
	Weapon(	0025	)
	Weapon(	0032	)
	Weapon(	0026	)
	Weapon(	0033	)
	Weapon(	0027	)
	Weapon(	0034	)
	Weapon(	1400	)
	Weapon(	1401	)
	Weapon(	1402	)
	Weapon(	1403	)
	Weapon(	1404	)
	Weapon(	1405	)
	Weapon(	0037	)
	Weapon(	0038	)
	Weapon(	0039	)
	Weapon(	0044	)
	Weapon(	0040	)
	Weapon(	0045	)
	Weapon(	1406	)
	Weapon(	1407	)
	Weapon(	1408	)
	Weapon(	1409	)
	Weapon(	1413	)
	Weapon(	1414	)
	Weapon(	1410	)




	AddNpcMission ( 723 )
	AddNpcMission	(1041)
	AddNpcMission	(1093)
	AddNpcMission	(1152)
	AddNpcMission	(1204)
	AddNpcMission(	1233	)
	--Священный огонь
	AddNpcMission	(6251)
	AddNpcMission	(6252)
	AddNpcMission	(6253)
	


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<МъЅіЎ¤±©±щ

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[ФУ»хЙМИЛЎ¤І®Ві]			--
--							--
--		135671,48320				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk74 ()
	Talk( 1,  "Палпин: Привет! Я бакалейщик Ледыни. Ищи меня когда достигнешь 10 уровня, я дам тебе задание кое что найти. За это я хорошо заплачу! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )
	Text( 1,  "Изготовить Маску реальности ",JumpPage, 2 )

	InitTrade()
	Other(	3187	)
	Other(	3188	)
	Other(	3190	)
	Other(	3239	)
	Other(	3197	)
	Other(	3193	)
	Other(	3241	)
	Other(	3192	)
	Other(	3198	)
	Other(	3202	)
	Other(	3203	)
	Other(	3204	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other(	3141	)
	Other(	4602	)
	Other(	4603	)
	Other(	4604	)
	Other( 3296 )
	--baby--Йъ»ојјДЬКйLv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
	Other(	1611	)
	Other(	1682	)
	Other(	1842	)
	Other(	1612	)
	Other(	1710	)
	Other(	1693	)
	Other(	4716	)
	Other(	1716	)
	Other(	1711	)
	Other(	3384	)
	Other(	3932	)
	Other(	1619	)
	Other(	2396	)
	Other(	1729	)
	Other(	4459	)
	Other(	1697	)
	Other(	1730	)
	Other(	1712	)
	Other(	1734	)
	Other(	1621	)
	Other(	1703	)
	Other(  2440    )


	AddNpcMission	(1052)
	AddNpcMission	(1106)
	AddNpcMission	(1162)
	AddNpcMission	(1214)
	AddNpcMission	(181)
	AddNpcMission	(182)
	AddNpcMission	(183)
	AddNpcMission	(1234)
	--AddNpcMission	(5502)

	---bragi
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1624, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1624, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Палпин: Для изготовления Маски реальности необходимо 1 Эльфийскую печать, 10000 золота и 10 любых ресурсов 3 уровня. " )
	Text( 2,  "Обменять Осколок кости на Маску реальности ", MultiTrigger, GetMultiTrigger(), 1)

	---InitTrigger()
	---TriggerCondition( 1, HasLeaveBagGrid, 1 )
	---TriggerCondition( 1, KitbagLock, 0 )
	---TriggerCondition( 1, HasItem, 2588, 1 )
	---TriggerCondition( 1, HasItem, 1842, 10 )
	---TriggerCondition( 1, HasMoney, 10000 )
	---TriggerAction( 1, TakeItem, 2588, 1 )
	---TriggerAction( 1, TakeItem, 1842, 10 )
	---TriggerAction( 1, TakeMoney, 10000 )
	---TriggerAction( 1, GiveItem, 2326, 1 , 4)
	---TriggerAction( 1, JumpPage, 3 )
	---TriggerFailure( 1, JumpPage, 4 )
	---Text( 2,  "Exchange Razor Tooth for Reality Mask ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4545, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4545, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Руду на Маску реальности ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4543, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4543, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Дерево на Маску реальности  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1478, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1478, 10 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Обменять Сашими на Маску реальности ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Палпин: Вот, держите что заказали. " )
	Talk( 4,  "Palpin: Вы не имеете всех необходимых ингридиентов  или у вас недостаточно свободного места в инвентаре. Также возможно что ваш инвентарь заблокирован. " )
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ФУ»хЙМИЛЎ¤І®Ві

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[Т©µкАП°еЎ¤ґпєХ]			--
--							--
--		135298,49926				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk75 ()
	
	
	Talk( 1,  "Дайша: Привет! У меня лучшие травы во всей Ледыни! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )
	
	Talk( 2,  "Daisha: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Argent or Shaitan by using the teleporter. " )
	Text( 2,  "Торг ", BuyPage )
	Text( 2,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)
	--Leo
	Other(	1576	)
	Other(	4049	)
	Other(	4050	)
	Other(	1578	)
	Other(	4060	)
	Other(	4055	)
	Other(	4061	)
	Other(	2225	)
	Other(	4057	)
	Other(	1768	)

	---------------------НжјТі¬№э9ј¶
	--InitTrigger()
	--TriggerCondition( 1, LvCheck,  "> ", 8 )
	--TriggerCondition( 1, LvCheck,  "< ", 10 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerFailure( 1, JumpPage, 1 )
	--Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 727 )
	--AddNpcMission ( 735 )
	--AddNpcMission ( 746 )
	--AddNpcMission ( 747 )
	AddNpcMission	(1047)
	AddNpcMission	(1101)
	AddNpcMission	(1158)
	AddNpcMission	(1209)
	AddNpcMission(	1235	)
---------eleven	
	AddNpcMission(	5067)
	AddNpcMission(	593)
	AddNpcMission(	594	)
	AddNpcMission(	596	)	

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Т©µкАП°еЎ¤ґпєХ


----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[»¤КїРЎЅгЎ¤°ІДЭ]			--
--							--
--		131725,50169				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk76 ()
	
	
	Talk( 1,  "Анна: Првиет! Я медстестра Анна! Поскольку я пока нахожусь на обучении я не могу вам ничем помочь. " )
	AddNpcMission	(1018)
	AddNpcMission	(1073)
	AddNpcMission	(1128)
	AddNpcMission	(1181)
	AddNpcMission(	1236	)
	



	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»¤КїРЎЅгЎ¤°ІДЭ

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[РВКЦЦёµјЎ¤°ІзчВ¶СЗ]		--
--							--
--		131577,50700				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk77 ()
	
	Talk( 1,  "Анжела: Привет! Я наставница Ледыни. Я буду учить вас некоторым основным знаниям. Наслаждайтесь вечной зимой! " )
	Text( 1,  "Звезда Единства ", JumpPage, 31 )
	Text( 1,  "Я бы хотел кое о чем спросить ", JumpPage, 4 )
	Text( 1,  "Узнать о классах и атрибутах ", JumpPage, 11 )
	Text( 1,  "Узнать координаты монстров ", JumpPage, 30 )
	Text( 1,  "Спасибо, я все понял ", CloseTalk )
--	Text( 1,  "Спасибо, я все понял ", CloseTalk )


	Talk( 4,  "Анжела: Ледынь это место, где вечная зима. Чтобы тут выжить надо знать где найти нужные вещи. " )
	Text( 4,  "Узнать об оружейном магазине ", JumpPage, 5 )
	Text( 4,  "Узнать о магазине доспехов ", JumpPage, 7 )
	Text( 4,  "Узнать о магазине предметов ", JumpPage, 8 )
	Text( 4,  "Узнать о магазине портальщиках ", JumpPage, 9 )
	Text( 4,  "Узнать о магазине лечении ", JumpPage, 10 )

	Talk( 5,  "Анжела: Отсюда двигайтесь на юг, а затем сверрните направо на перекрестке. Там вы увидите нашего кузнеца. " )
	Text( 5,  "Унать о других продавцах ", JumpPage, 4 )
	Text( 5,  "Спасибо, я все понял ", CloseTalk )

--	Talk( 6,  "Look for me again if there is anything you don't understand ", CloseTalk )

	Talk( 7,  "Анжела: Чтобы купить доспехи ищите нашего портного. Он очень добрый человек. Находится в правой части города. " )
	Text( 7,  "Унать о других продавцах ", JumpPage, 4 )
	Text( 7,  "Спасибо, я все понял ", CloseTalk )

	Talk( 8,  "Анжела: Купить предметы вы можете у бакалейщика нашего города. У него есть все для путешевствия. Он находится в западном углу этого города. " )
	Text( 8,  "Унать о других продавцах ", JumpPage, 4 )
	Text( 8,  "Спасибо, я все понял ", CloseTalk )

	Talk( 9,  "Анжела: Идите по дороге на юг и вы увидите красивую леди стоящую там. Это наша портальщица. С помощью нее вы можете переместиться в любой крупный город этого мира. Также вы можете записать у нее точку возвращения. " )
	Text( 9,  "Унать о других продавцах ", JumpPage, 4 )
	Text( 9,  "Спасибо, я все понял ", CloseTalk )

	Talk( 10,  "Анжела: Медсестра - девушка стоящая с другой стороны фонтана. Не забудьте найти ее если вы больны. " )
	Text( 10,  "Унать о других продавцах ", JumpPage, 4 )
	Text( 10,  "Спасибо, я все понял ", CloseTalk )

	InitTrigger()
	TriggerCondition( 1, NoRecord, 700 )
	TriggerCondition( 1, HasMission, 700 )
	TriggerCondition( 1, NoFlag, 700, 10 )
	TriggerAction( 1, SetFlag, 700, 10)
	TriggerAction( 1, JumpPage, 12 )
	TriggerFailure( 1, JumpPage, 12 )
	Talk( 11,  "Анжела: Вам как новому игроку необходимо очень много узнать. Я готовоа вам в этом помочь. " )
	Text( 11,  "Узнать о классах ", JumpPage, 12)
	Text( 11,  "Узнать о других атрибутах ", JumpPage, 13)

	--Text( 11,  "Узнать о классах ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord, 700 )
	TriggerCondition( 1, HasMission, 700 )
	TriggerCondition( 1, NoFlag, 700, 20 )
	TriggerAction( 1, SetFlag, 700, 20)
	TriggerAction( 1, JumpPage, 13 )
	TriggerFailure( 1, JumpPage, 13 )
	--Text( 11,  "Узнать о других атрибутах ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 12,  "Анжела: Всего существует 4 базовых класса. Каждый имеет свои особенности. " )
	Text( 12,  "Узнать о мечниках ", JumpPage, 14 )
	Text( 12,  "Узнать об охотниках ", JumpPage, 15 )
--	Text( 12,  "Regarding Sailor ", JumpPage, 16 )
	Text( 12,  "Узнать об исследователях ", JumpPage, 17 )
	Text( 12,  "Узнать об знахарках ", JumpPage, 18 )
--	Text( 12,  "Regarding Artisan ", JumpPage, 19 )
--	Text( 12,  "Regarding Merchant ", JumpPage, 20 )
	Text( 12,  "Я все понял. Хочу узнать кое что другое. ", JumpPage, 11 )

	Talk( 13,  "Анжела: Всего существует 5 базовых атрибута. Каждый атрибут может иметь максимальное значение в 100. У новичка все атрибуты равны 5. Каждый уровень вам будет выдаваться еще 1 пункт атрибута и навыка. В начале игры у вас есть 5 свободных пункта, которые вы можете рас " )
	Text( 13,  "Узнать о силе ", JumpPage, 21 )
	Text( 13,  "Узнать о ловкости ", JumpPage, 22 )
	Text( 13,  "Узнать о телосложении ", JumpPage, 23 )
	Text( 13,  "Узнать о духе ", JumpPage, 24 )
	--Text( 13,  "Regarding Luck ", JumpPage, 25 )
	Text( 13,  "Узнать о точности ", JumpPage, 26 )
	Text( 13,  "Я все понял. Хочу узнать кое что другое. ", JumpPage, 11 )

	Talk( 14,  "Мечники имеют самое высокое физическое сопротивление в этой игре. Мечником может стать только Ланс, Филисс или Карциз. Если хотите стать мечником, то обратитесь к Стражнику Питеру в Аргенте. " )
	Text( 14,  "Узнать о других классах ", JumpPage, 12)
	Text( 14,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 14,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 15,  "Анжела: Охотники это единственный класс использующий оружие с дистанционной атакой. Охотником может стать только Филисс или Ланс. Чтобы стать охотником необходимо обратится к мечнику Рею в Ледыни. " )
	Text( 15,  "Узнать о других классах ", JumpPage, 12)
	Text( 15,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 15,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 16,  "Анжела: Sailor is the strongest class in the sea. It is still unreleased in current version. " )
	Text( 16,  "Узнать о других классах ", JumpPage, 12)
	Text( 16,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 16,  "Спасибо, я все понял ", JumpPage, 27)
	
	Talk( 17,  "Анжела: Исследователь это лучший класс для морских путешевствий. Исследователем могут стать только Филисс, Ланс или Ами. Чтобы стать исследователем обратись к Малышу Дэниэлю в Аргенте. " )
	Text( 17,  "Узнать о других классах ", JumpPage, 12)
	Text( 17,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 17,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 18,  "Анжела: Гербалисты это приверженцы культа Богини Кары, за это им дарована магическая сила. Гербалистом может стать только Филисс или Ами. Чтобы стать Гербалистом ищи Верховного жреца Геньона в Шайтане. " )
	Text( 18,  "Узнать о других классах ", JumpPage, 12)
	Text( 18,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 18,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 19,  "Анжела: Анжела: Artisan is the only class that can make item. They will be in-charge of building structures for the guild. It is still unreleased in current version. " )
	Text( 19,  "Узнать о других классах ", JumpPage, 12)
	Text( 19,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 19,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 20,  "Анжела: Merchant is the richest of all classes as they specialise in commerce. It is still unreleased in current version. " )
	Text( 20,  "Узнать о других классах ", JumpPage, 12)
	Text( 20,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 20,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 21,  "Анжела: Сила влияет на физический урон. " )
	Text( 21,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 21,  "Узнать о других классах ", JumpPage, 12)
	Text( 21,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 22,  "Анжела: Ловкость влияет на уклонение и скорость атаки. " )
	Text( 22,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 22,  "Узнать о других классах ", JumpPage, 12)
	Text( 22,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 23,  "Анжела: Телосложение влияет на количество жизни и на защиту. " )
	Text( 23,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 23,  "Узнать о других классах ", JumpPage, 12)
	Text( 23,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 24,  "Анжела: Дух влияет на количество маны, магическую защиту и урон от некоторых скиллов. " )
	Text( 24,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 24,  "Узнать о других классах ", JumpPage, 12)
	Text( 24,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 25,  "Анжела: Luck increases Critical strike and Combine success rate " )
	Text( 25,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 25,  "Узнать о других классах ", JumpPage, 12)
	Text( 25,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 26,  "Анжела: Точность влияет на шанс урона и силу дистанционной атаки. " )
	Text( 26,  "Узнать о других атрибутах ", JumpPage, 13)
	Text( 26,  "Узнать о других классах ", JumpPage, 12)
	Text( 26,  "Спасибо, я все понял ", JumpPage, 27)

	Talk( 27,  "Анжела: Отлично! Ищи меня если что то понадобится. ")

	Talk( 28,  "Анжела: Очень хорошо! Вы очень хорошо увоили основы. Попробуйте теперь пообщаться с другими жителями и постараться найти работу. " )
	Text( 28,  "Я бы хотел кое о чем спросить ", JumpPage, 4 )
	Text( 28,  "Узнать о классах и атрибутах ", JumpPage, 11 )
	Text( 28,  "Спасибо, я все понял ",  CloseTalk )

	Talk( 29,  "Анжела: Хорошо! Теперь вы можете определится с будующей профессией и обратится к тренеру своего класса. " )
	Text( 29,  "Я бы хотел кое о чем спросить ", JumpPage, 4 )
	Text( 29,  "Узнать о классах и атрибутах ", JumpPage, 11 )
	Text( 29,  "Спасибо, я все понял ",  CloseTalk)

	Talk( 30,  "Анжела: Чтобы узнать координаты монстров обратись к Пьянице Энтони в Баре Аргента. " )

	InitTrigger()
	TriggerCondition( 1, NoItem, 1034, 1 )
	TriggerCondition( 1, NoItem, 1033, 1 )
	TriggerCondition( 1, BankNoItem, 1034, 1 )
	TriggerCondition( 1, BankNoItem, 1033, 1 )
	TriggerCondition( 1, EquipNoItem, 1034, 1 )
	TriggerCondition( 1, EquipNoItem, 1033, 1 )

	TriggerCondition( 1, LvCheck,  "< ", 41 )
	TriggerAction( 1, GiveItem, 1033, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )

	Talk( 31,  "Анжела: Звезда Единства - таинственный предмет из другого мира. При ношении способна накапливать опыт хозяина, а затем при некоторых условиях отдавать накопленное количество опыта назад. Кроме того вы можете обменять Звезду Единства на экипировку своего класса на 50 уровень когда достигнете 41 уровня. " )
	Text( 31,  "Получить Звезду Единства ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 31,  "Обмен Звезды Единства ",JumpPage, 32 )

	Talk( 32,  "Анжела: Спасибо за использование наших продуктов. Вы можете обменять Звезду Единства на экипировку своего класса на 50 уровень. Вас это интересует? ")
	Text( 32,  "Получить оружие класса ", Transfer_TeamStar, 1)

	Talk( 6,  "Анжела: Прошу прощения, но вы не подходите по требованиям. " )

	--InitTrigger()
	---------------------НжјТі¬№э6ј¶НкіЙ№эЙЄ°ІµДХЅ¶·СµБ·ИООс
	--TriggerCondition( 1, LvCheck,  "> ", 4 )
	--TriggerCondition( 1, LvCheck,  "< ", 9 )
	--TriggerCondition( 1, HasRecord, 716 )
	--TriggerAction( 1, JumpPage, 28 )
	--TriggerCondition( 2, LvCheck,  "> ", 8 )
	--TriggerCondition( 2, PfEqual, 0 )
	--TriggerAction( 2, JumpPage, 29 )
	--TriggerFailure( 2, JumpPage, 1 )

	--Start( GetMultiTrigger(), 2 )

	
	AddNpcMission ( 721 )
	AddNpcMission ( 722 )
	AddNpcMission ( 724 )
	AddNpcMission ( 726 )
	AddNpcMission ( 728 )
	AddNpcMission ( 201 )
	AddNpcMission 	(406)
	AddNpcMission 	(62)
	AddNpcMission 	(63)
	AddNpcMission 	(64)
	AddNpcMission 	(65)
	AddNpcMission 	(162)
	AddNpcMission 	(163)
	AddNpcMission 	(173)
	AddNpcMission 	(190)


	MisListPage(28)
	MisListPage(29)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<РВКЦЦёµјЎ¤°ІзчВ¶СЗ


----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[±щАЗ±¤ЅЈКїЎ¤АЧЕ·]		--
--							--
--		136573,57078				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk78 ()
	
	-------------------ЧЄЦ°Л«ЅЈ
	Talk( 1,  "Рэй: Привет! Я наемный охотник, люблю охотится за нежитью. Если вас это интересует, то могу показать несколько хороших мест. " )

		----------------ЧЄЦ°іЙОЄБФИЛ
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 9 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 0 )
	TriggerCondition( 1, HasMoney, 1000 )
	TriggerCondition( 1, HasItem, 3955, 1 )
	TriggerAction( 1, TakeItem, 3955, 1 )
	TriggerAction( 1, TakeMoney, 1000 )
	TriggerAction( 1, GiveItem, 3187, 1 , 4)
	TriggerAction( 1, GiveItem, 25, 1 , 4)
	TriggerAction( 1, SetProfession, 2 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerCondition( 2, LvCheck,  "> ", 7 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 0 )
	TriggerCondition( 2, HasMoney, 1000 )
	TriggerCondition( 2, HasItem, 3955, 1 )
	TriggerAction( 2, TakeItem, 3955, 1 )
	TriggerAction( 2, TakeMoney, 1000 )
	TriggerAction( 2, GiveItem, 3187, 1 , 4)
	TriggerAction( 2, GiveItem, 25, 1, 4)
	TriggerAction( 2, SetProfession, 2  )
	TriggerAction( 2, JumpPage, 3 )
	TriggerFailure( 2, JumpPage, 4 )

	Talk(2,  "Hi my friend. You have great reflexes, suitable to become a hunter. Why don't you become a hunter now? I believe that you will not be disappointed. ")
	Text(2,  "Ok, class change to be Hunter ", MultiTrigger, GetMultiTrigger(), 2)
	Text(2,  "No, it is good enough for now. ", CloseTalk)

	Talk(3,  "I have told you all I can about being a Hunter. Now its up to you to become the best Hunter. ")

	Talk(4,  "Want to be a Hunter? Only players Lv 8 and above who possess a Hunter Manual can register with me for 1000G. Muscular guy or little girl are not suitable. ")

	----------------ЧЄЦ°іЙОЄѕС»чКЦ
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 2 )
	TriggerCondition( 1, HasMoney, 15000 )
	TriggerCondition( 1, HasItem, 3364, 1 )
	TriggerAction( 1, TakeItem, 3364, 1 )
	TriggerAction( 1, TakeMoney, 15000 )
	TriggerAction( 1, SetProfession, 12 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 2 )
	TriggerCondition( 2, HasMoney, 15000 )
	TriggerCondition( 2, HasItem, 3364, 1 )
	TriggerAction( 2, TakeItem, 3364, 1 )
	TriggerAction( 2, TakeMoney, 15000 )
	TriggerAction( 2, SetProfession, 12  )
	TriggerAction( 2, JumpPage, 6 )
	TriggerFailure( 2, JumpPage, 7 )

	Talk(5,  "Sharpshoots nowadays only want to earn more money. They will kill anyone on sight as long as there is a bounty. Friend, it seems that you are suitable to become a sharpshooter. You have a good character and build. Would you consider to be one so that you might restore the glory of the Sharpshooters one day? ")
	Text(5,  "Ok, I will become a Sharpshooter ", MultiTrigger, GetMultiTrigger(), 2)
	Text(5,  "No, it is good enough for now. ", CloseTalk)

	Talk(6,  "Sharpshooters are not assassins. You must not forget the principles of the sharpshooters in the future. ")

	Talk(7,  "Want to become a Sharpshooter? Come back here when you are Lv 40. Remember to bring along 1 Clarity Crystal and 15000G too! ")

	--InitTrigger()

-------------------ЧЄБФИЛЕР¶П
	--TriggerCondition( 1, LvCheck,  "> ", 9 )
	----TriggerCondition( 1, IsCategory, 1 )
	--TriggerCondition( 1, PfEqual, 0 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerCondition( 2, LvCheck,  "> ", 9 )
	--TriggerCondition( 2, IsCategory, 3 )
	--TriggerCondition( 2, PfEqual, 0 )
	--TriggerAction( 2, JumpPage, 2 )
	--TriggerFailure( 2, JumpPage, 1 )

----------------ѕС»чКЦ

	--TriggerCondition( 3, LvCheck,  "> ", 39 )
	--TriggerCondition( 3, IsCategory, 1 )
	--TriggerCondition( 3, PfEqual, 2 )
	--TriggerAction( 3, JumpPage, 5 )
	--TriggerCondition( 4, LvCheck,  "> ", 39 )
	--TriggerCondition( 4, IsCategory, 3 )
	--TriggerCondition( 4, PfEqual, 2 )
	--TriggerAction( 4, JumpPage, 5 )
	--TriggerFailure( 4, JumpPage, 1 )

	--Start( GetMultiTrigger(), 2 )
	
	--AddNpcMission ( 729 )
	AddNpcMission ( 101 )
	AddNpcMission ( 251 )
	AddNpcMission ( 252 )
	AddNpcMission ( 260 )
	AddNpcMission ( 261 )
	AddNpcMission 	(410)
	AddNpcMission 	(757)
	AddNpcMission 	(167)
	AddNpcMission 	(168)
	AddNpcMission 	(169)
	AddNpcMission 	(174)
	AddNpcMission 	(175)
	AddNpcMission 	(176)
	AddNpcMission 	(180)
	AddNpcMission 	(523)
	AddNpcMission(	1237	)
-------------eleven
	AddNpcMission(	5057	)
	AddNpcMission(	5061	)	
	AddNpcMission(	5069	)
----------1.7
	AddNpcMission(	5168	)
	AddNpcMission(	5090	)
	AddNpcMission (5097 )
	AddNpcMission (5098 )
	AddNpcMission (5099 )
	AddNpcMission (5100 )
	AddNpcMission (5111 )

	MisListPage(2)


	-----МъИЛБщПо
	AddNpcMission ( 6125 )


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<±щАЗ±¤ЅЈКїЎ¤АЧЕ·

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[±щАЗ±¤ЙМ»б»бі¤Ў¤°¬БўїЛ]		--
--							--
--		129486,49842				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk79 ()
	
	
	Talk( 1,  "Рэйно: Привет! Я председатель Ледыни, самый богатый человек города. Я везде где есть деньги. " )
	Text( 1,  "Сделать восстанавливающее зелье ", JumpPage, 5)

	--------------------ЕЪЦЖМбЙсјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1779, 1 )
	TriggerCondition( 1, HasItem, 3138, 2 )
	TriggerCondition( 1, HasItem, 3137, 2 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3138, 2 )
	TriggerAction( 1, TakeItem, 3137, 2 )
	TriggerAction( 1, TakeItem, 1779, 1 )
	TriggerAction( 1, GiveItem, 3139, 1 , 4)
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 7 )
	Talk( 5,  "Рэйно: Те травы, что продают целители самые обычные. Только я продаю самые волшебные травы! " )
	Text( 5,  "Сделать Агрипнотик ",MultiTrigger, GetMultiTrigger(), 1)

	----------------єПіЙД§»ГТ©Л®
	InitTrigger()
	TriggerCondition( 1, HasItem, 1779, 1 )
	TriggerCondition( 1, HasItem, 3133, 1 )
	TriggerCondition( 1, HasItem, 3134, 1 )
	TriggerCondition( 1, HasItem, 3135, 1 )
	TriggerCondition( 1, HasItem, 3136, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3133, 1 )
	TriggerAction( 1, TakeItem, 3134, 1 )
	TriggerAction( 1, TakeItem, 3135, 1 )
	TriggerAction( 1, TakeItem, 3136, 1 )
	TriggerAction( 1, TakeItem, 1779, 1 )
	TriggerAction( 1, GiveItem, 3140, 1 , 4)
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 5,  "Сделать Волшебное зелье ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6,  "Рэйно: Вот то, что вы заказывали. " )
	Talk( 7,  "Рэйно: Чтобы сделать 1 Агрипнотик необходимо 2 Тиамарина, 2 Загадочных фрукта, 1 Стакан и 200 золота. " )
	Talk( 8,  "Рэйно: Чтобы сделать 1 Волшебное зелье необходимо 1 Лакричное зелье, 1 Чай Бодрячок, 1 Чудо-мазь, 1 Брикет снежной травы, 1 Стакан и 200 золота. " )

	AddNpcMission 	(459)
	AddNpcMission 	(465)
	AddNpcMission 	(699)
	AddNpcMission 	(800)
	AddNpcMission	(1005)
	AddNpcMission	(1060)
	AddNpcMission	(1115)
	AddNpcMission	(1169)
	AddNpcMission(	1238	)
	--------------------1.7
	AddNpcMission ( 5084	)
	AddNpcMission ( 5085	)
	AddNpcMission ( 5086	)
	AddNpcMission ( 5087	)
	AddNpcMission (5143 )
	AddNpcMission (5144 )
	AddNpcMission (5145 )
	AddNpcMission (5146 )
	AddNpcMission (5151 )



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ЙМ»б»бі¤Ў¤°¬БўїЛ

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[±щАЗ±¤№уЧеЎ¤Вн¶ыРЮЛ№]		--
--							--
--		134652,45141				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk80 ()
	
	
	Talk( 1,  "Мас: История моей семьи началась также давно как основали замок Ледыни. Здесь все меня знают и уважают. " )
	Text( 1,  "Создать пиратскую гильдию ",JumpPage, 2 )
	Text( 1,  "Ничего... ",CloseTalk )


	Talk( 2,  "Мас: Хохо.. Хотите создать пиратскую гильдию? Думаю вам это по силам. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerAction( 1, CreateGuild, 1 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2,  "Создать пиратскую гильдию ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Мас: Стать лидером пиратской гильдии не так просто. Вам нужно принести 1 камень клятвы и 100000 золота. " )


	AddNpcMission ( 253 )
	AddNpcMission ( 254 )
	AddNpcMission (	453 )
	AddNpcMission 	(698)
	AddNpcMission 	(801)
	AddNpcMission	(1004)
	AddNpcMission	(1059)
	AddNpcMission	(1114)
	AddNpcMission	(1168)
	AddNpcMission	(317)
	AddNpcMission	(321)
	AddNpcMission	(322)
-----------eleven
	AddNpcMission	(5045)
	AddNpcMission	(5046)
	AddNpcMission	(5047)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<±щАЗ±¤№уЧеЎ¤Вн¶ыРЮЛ№

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[ТшРРіцДЙЎ¤ІјАцДИ]		--
--							--
--		136058,51931				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk81 ()
	
	
	Talk( 1,  "Белинда: Добро пожаловать в банк Ледыни! ЧЕм я могу помочь? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (200 золотых) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "Простите, но у вас недостаточно денег для входа в хранилище. " )

	AddNpcMission	(1102)
	AddNpcMission	(187)
	AddNpcMission	(188)
	AddNpcMission	(189)
----------eleven
	AddNpcMission	(597)
	AddNpcMission	(598)	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ТшРРіцДЙЎ¤ІјАцДИ

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[ѕЖ°Й·юОсФ±Ў¤°Е°ЕА­]		--
--							--
--		131083,53031				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk82 ()
	
	
	Talk( 1,  "Барбара: Здравствуйте! Не найдется ли у вас интересных историй для меня? " )
	Text( 1,  "Сделать краситель ", JumpPage, 2)
	Text( 1,  "Сделать сок ", JumpPage, 6)

-----------µчЕдА¶Й«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1792, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1792, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1802, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "Барбара: Вы столкнулись с чем то интересным? Сообщите мне! " )
	Text( 2,  "Сделать Голубой краситель ", MultiTrigger, GetMultiTrigger(), 1)
-------------------------µчЕдЧПЙ«Иѕ·ўјБ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1793, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1793, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1803, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "Сделать Пурпурный краситель ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Барбара: Вот, то что вы просили готово! " )
	Talk( 4,  "Барбара: Для приготовления 1 Голубого красителя нужно 5 Голубой краски, 1 Особый газ, 1 Радужный стакан и 200 золота. " )
	Talk( 5,  "Барбара: Для приготовления 1 Пурпурного красителя нужно 5 Пурпурной краски, 1 Особый газ, 1 Радужный стакан и 200 золота. " )

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3122, 1 , 4)
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8 )
	Talk( 6,  "Барбара: У меня лучший сок во всей Ледыни! Вы приготовили стакан? " )
	Text( 6,  "Сделать Сок эльфийского фрукта ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 7,  "Барбара: Держите ваш самый вкусный сок, как и просили. " )

	Talk( 8,  "Барбара: Простите, но для приготовления 1 Сок эльфийского фрукта требуется 10 Эльфийских фруктов и 1 Стакан. " )
	AddNpcMission	(1078)
	AddNpcMission	(389)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ѕЖ°Й·юОсФ±Ў¤°Е°ЕА­

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[·юЧ°µкЦчЎ¤єІДИ]		--
--							--
--		134926,53992				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk83 ()
	
	
	Talk( 1,  "Ханна: Привет, я портной Ледыни. У меня вы можете найти лучшие доспехи в городе! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )
	
	InitTrade()
	Defence(	0305	)
	Defence(	0481	)
	Defence(	0657	)
	Defence(	0313	)
	Defence(	0487	)
	Defence(	0665	)
	Defence(	0306	)
	Defence(	0482	)
	Defence(	0658	)
	Defence(	0311	)
	Defence(	0489	)
	Defence(	0663	)
	Defence(	0307	)
	Defence(	0483	)
	Defence(	0659	)
	Defence(	0314	)
	Defence(	0490	)
	Defence(	0666	)
	Defence(	0310	)
	Defence(	0486	)
	Defence(	0662	)
	Defence(	0491	)
	Defence(	0315	)
	Defence(	0667	)
	Defence(	0312	)
	Defence(	0488	)
	Defence(	0664	)
	Defence(	0316	)
	Defence(	0492	)
	Defence(	0668	)
	Defence(	0317	)
	Defence(	0493	)
	Defence(	0669	)




	AddNpcMission ( 725 )
	AddNpcMission	(1067)
	AddNpcMission	(170)
	AddNpcMission	(171)
	AddNpcMission	(172)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·юЧ°µкЦчЎ¤єІДИ

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[ВГµкАП°еЎ¤ФјЙЄ·т]		--
--							--
--		129074,54098				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk84 ()
	
	
	Talk( 1,  "Яски: Добро пожаловать в гостиницу Ледыни. Я ее владелец Яски. " )
	AddNpcMission	(1085)
	AddNpcMission	(184)
	AddNpcMission	(185)
	AddNpcMission	(186)

	

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ВГµкАП°еЎ¤ФјЙЄ·т

----------------------------------------------------------
--							--
--							--
--		±щАЗ±¤[В·ИЛЎ¤¶Ў]		--
--							--
--		133550,46900				--
----------------------------------------------------------
-----------------------------------------------------------ХвАпїЄКјP»°БДМм
function r_talk85 ()
	
	
	Talk( 1,  "Тинк: Вы видели трех моих братьев? Они живут в Громограде, Аргенте и Шайтане. " )
	--Text( 1,  "Refine ", JumpPage, 2)
-------------------Б¶ФмµШЅрїуКЇ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1781, 10 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1781, 10 )
	TriggerAction( 1, GiveItem, 1782, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )	
	Talk( 2,  "Tink: I am not just a normal NPC. The game cannot do without me! Hoho! Let me prove it to you! " )
	Text( 2,  "Refine Terra Gold ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Tink: Ok! This Terra Gold Ore is yours! " )
	Talk( 4,  "Tink: Tink: I have a method to make Terra Gold Ore. Pass me 10 Terra Gold Fragment and 200G and it'll be yours. " )

	AddNpcMission ( 6015 )
	AddNpcMission ( 6016 )
	AddNpcMission ( 6019 )
	AddNpcMission ( 6020 )
	AddNpcMission ( 6021 )
	AddNpcMission ( 6022 )
	AddNpcMission ( 6023 )
	AddNpcMission ( 6024 )

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<В·ИЛЎ¤¶Ў





-- Толик
function Npc_Tolik ()   
	Talk( 1, "Приветствую тебя, пират! У меня ты найдешь множество интересных мисси! ")    
	Text( 1, "Уйти. ", CloseTalk)
	
	-- Миссии
	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 2019 )--доп квесты на кактусов
	AddNpcMission ( 2020 )--доп разбойники
	AddNpcMission ( 2021 )--доп энты
	AddNpcMission ( 2022 )--доп разборка с главарями
end

-- Обменник репутации
function rep_Exchanger ()
    Talk( 1, "Приветствую тебя, пират! Хочешь обменять свою репутацию на что-то стоющее?_Выбирай: " )
    Text( 1, "Мешки с Песком ", JumpPage, 2)
	InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7958,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 1ур(1 день) - 1000 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,2000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 2000 )
    TriggerAction( 1, GiveItem, 7961,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 2ур(1 день) - 2000 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,3000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 3000 )
    TriggerAction( 1, GiveItem, 7964,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 3ур(1 день) - 3000 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 271,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"Кость Стража - 500 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	Text( 1, "------------>", JumpPage, 4)
    Text( 1, "Уйти ", CloseTalk )
	
	Talk( 2,"Мешок 3р. - 500 репутации;_Мешок 4р. - 800 репутации;_Мешок 5р. - 1000 репутации. ")
	InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 2753,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"Обменять Мешок 3 ур. " ,MultiTrigger,GetMultiTrigger(),1)

    InitTrigger()
    TriggerCondition( 1, HasCredit,800)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 800 )
    TriggerAction( 1, GiveItem, 2777,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"Обменять Мешок 4 ур. " ,MultiTrigger,GetMultiTrigger(),1)
	
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 2801,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"Обменять Мешок 5 ур. " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 3, "Для обмена вам не хватает репутации! ")
	Text( 3, "Понял. ", CloseTalk )

	Talk(4, "Вторая страница: ")
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 267,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"Мощь Огня - 350 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 268,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"Мощь Ветра - 350 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 553500 )
    TriggerAction( 1, GiveItem, 269,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"Мощь Грома - 350 реп. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 270,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"Мощь Мороза - 350 реп. " ,MultiTrigger,GetMultiTrigger(),1)
    Text( 4, "Уйти ", CloseTalk )

	-- Миссии
	AddNpcMission ( 922 )
	AddNpcMission ( 923 )
end

-- Понедельник
function Npc_Monday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по понедельникам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Вторник
function Npc_Tuesday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 2 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по вторникам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Среда
function Npc_Wensday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по средам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Четверг
function Npc_Thusday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 4 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по четвергам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Пятница
function Npc_Friday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 5 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по пятницам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Суббота
function Npc_Satturday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 6 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по субботам! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Воскресенье 
function Npc_Sunday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 7 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "Приветствую тебя, пират! Я разговариваю только по воскресеньям! ")
	Text( 2, "Понял, до встречи! ", CloseTalk )
end

-- Медсестра
function Medsestra ()
	InitTrigger()
	TriggerAction( 1, ReAll )
	Start( GetMultiTrigger(),1 )
end

-- Баффер
function Buffer ()
	InitTrigger()
	TriggerAction( 1, MegaBuff )
	Start( GetMultiTrigger(), 1 )
end

-- Продавец бижутерии
function Trade_Neck()
	Talk( 1, "Приветствую тебя, странник! Решил присмотреть бижутерию? " )
	Text( 1, "Посмотреть ассортимент! ", BuyPage)
	
	Other(	6662  )
	Other(	6661  )
	Other(	6660  )
	Other(	6659  )
	Other(	6658  )
	Other(	6657  )
	Other(	6656  )
	Other(	6655  )
	Other(	6654  )
	Other(	6653  )
	Other(	6652  )
	Other(	6651  )
	Other(	6650  )
	Other(	6649  )
	Other(	6648  )
	Other(	6647  )
	Other(	6648  )
	Other(	6647  )
	Other(	6646  )
	Other(	6645  )
	Other(	6644  )
	Other(	6643  )
	Other(	6642  )
	Other(	6641  )
	Other(	6640  )
	Other(	6639  )
	Other(	6638  )
	Other(	6904  )
	Other(	6905  )
	Other(	6906  )
	Other(	6907  )
	Other(	6908  )

end

-- Обменник самоцветов +7
function Exchange_gem_7 ()
	Talk( 1, "Приветствую тебя, пират!_Обменивай у меня свитки Форжа +7_С ними ты сможешь стать сильнее!. ")
	Text( 1, "Свиток Силы +7 ", JumpPage, 2)
	Text( 1, "Свиток Телосложения +7 ", JumpPage, 3)
	Text( 1, "Свиток Ловкости +7 ", JumpPage, 4)
	Text( 1, "Свиток Точности +7 ", JumpPage, 5)
	Text( 1, "Свиток Духа +7 ", JumpPage, 6)
	Talk( 2," Выберите нужное кол-во свитков " )
	Text( 2, " 1 свиток ", JumpPage, 7)
	Text( 2, " 5 свитков ", JumpPage, 8)
	Text( 2, " 10 свитков ", JumpPage, 9)
	Talk( 3," Выберите нужное кол-во свитков " )
	Text( 3, " 1 свиток ", JumpPage, 10)
	Text( 3, " 5 свитков ", JumpPage, 11)
	Text( 3, " 10 свитков ", JumpPage, 12)
	Talk( 4," Выберите нужное кол-во свитков " )
	Text( 4, " 1 свиток ", JumpPage, 13)
	Text( 4, " 5 свитков ", JumpPage, 14)
	Text( 4, " 10 свитков ", JumpPage, 15)
	Talk( 5," Выберите нужное кол-во свитков " )
	Text( 5, " 1 свиток ", JumpPage, 16)
	Text( 5, " 5 свитков ", JumpPage, 17)
	Text( 5, " 10 свитков ", JumpPage, 18)
	Talk( 6," Выберите нужное кол-во свитков " )
	Text( 6, " 1 свиток ", JumpPage, 19)
	Text( 6, " 5 свитков ", JumpPage, 20)
	Text( 6, " 10 свитков ", JumpPage, 21)
	-- Сила +7
	Talk(7," Это будет стоить 1 расписка +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5205,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," Это будет стоить 5 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5205,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," Это будет стоить 10 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5205,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Телосложение +7
	Talk(10," Это будет стоить 1 расписка +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5204,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," Это будет стоить 5 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5204,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," Это будет стоить 10 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5204,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Ловкость +7
	Talk(13," Это будет стоить 1 расписка +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5202,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," Это будет стоить 5 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5202,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," Это будет стоить 10 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5202,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Точность +7
	Talk(16," Это будет стоить 1 расписка +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5203,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," Это будет стоить 5 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5203,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," Это будет стоить 10 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5203,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	-- Дух +7
	Talk(19," Это будет стоить 1 расписка +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5206,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," Это будет стоить 5 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5206,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," Это будет стоить 10 расписок +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7483,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5206,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"Дорогой пират!_Недостаточно свободного места в инвентаре,_Либо отсутствует нужное количество расписок +7 " )
end

function Exchange_gem_14 ()
	Talk( 1, "Приветствую тебя, пират!_Обменивай у меня свитки Форжа +14_С ними ты сможешь стать сильнее!. ")
	Text( 1, "Свиток Силы +14 ", JumpPage, 2)
	Text( 1, "Свиток Телосложения +14 ", JumpPage, 3)
	Text( 1, "Свиток Ловкости +14 ", JumpPage, 4)
	Text( 1, "Свиток Точности +14 ", JumpPage, 5)
	Text( 1, "Свиток Духа +14 ", JumpPage, 6)
	Talk( 2," Выберите нужное кол-во свитков " )
	Text( 2, " 1 свиток ", JumpPage, 7)
	Text( 2, " 5 свитков ", JumpPage, 8)
	Text( 2, " 10 свитков ", JumpPage, 9)
	Talk( 3," Выберите нужное кол-во свитков " )
	Text( 3, " 1 свиток ", JumpPage, 10)
	Text( 3, " 5 свитков ", JumpPage, 11)
	Text( 3, " 10 свитков ", JumpPage, 12)
	Talk( 4," Выберите нужное кол-во свитков " )
	Text( 4, " 1 свиток ", JumpPage, 13)
	Text( 4, " 5 свитков ", JumpPage, 14)
	Text( 4, " 10 свитков ", JumpPage, 15)
	Talk( 5," Выберите нужное кол-во свитков " )
	Text( 5, " 1 свиток ", JumpPage, 16)
	Text( 5, " 5 свитков ", JumpPage, 17)
	Text( 5, " 10 свитков ", JumpPage, 18)
	Talk( 6," Выберите нужное кол-во свитков " )
	Text( 6, " 1 свиток ", JumpPage, 19)
	Text( 6, " 5 свитков ", JumpPage, 20)
	Text( 6, " 10 свитков ", JumpPage, 21)
	-- Сила +14
	Talk(7," Это будет стоить 1 расписка +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5210,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," Это будет стоить 5 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5210,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," Это будет стоить 10 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5210,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Телосложение +14
	Talk(10," Это будет стоить 1 расписка +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5209,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," Это будет стоить 5 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5209,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," Это будет стоить 10 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5209,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Ловкость +14
	Talk(13," Это будет стоить 1 расписка +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5207,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," Это будет стоить 5 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5207,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," Это будет стоить 10 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5207,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Точность +14
	Talk(16," Это будет стоить 1 расписка +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5208,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," Это будет стоить 5 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5208,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," Это будет стоить 10 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5208,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	-- Дух +14
	Talk(19," Это будет стоить 1 расписка +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5211,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," Это будет стоить 5 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5211,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," Это будет стоить 10 расписок +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7510,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5211,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"Дорогой пират!_Недостаточно свободного места,_Либо отсутствует нужное количество расписок +14 " )
end
function Exchange_gem_20 ()
	Talk( 1, "Приветствую тебя, пират!_Обменивай у меня свитки Форжа +20_С ними ты сможешь стать сильнее!. ")
	Text( 1, "Свиток Силы +20 ", JumpPage, 2)
	Text( 1, "Свиток Телосложения +20 ", JumpPage, 3)
	Text( 1, "Свиток Ловкости +20 ", JumpPage, 4)
	Text( 1, "Свиток Точности +20 ", JumpPage, 5)
	Text( 1, "Свиток Духа +20 ", JumpPage, 6)
	Talk( 2," Выберите нужное кол-во свитков " )
	Text( 2, " 1 свиток ", JumpPage, 7)
	Text( 2, " 5 свитков ", JumpPage, 8)
	Text( 2, " 10 свитков ", JumpPage, 9)
	Talk( 3," Выберите нужное кол-во свитков " )
	Text( 3, " 1 свиток ", JumpPage, 10)
	Text( 3, " 5 свитков ", JumpPage, 11)
	Text( 3, " 10 свитков ", JumpPage, 12)
	Talk( 4," Выберите нужное кол-во свитков " )
	Text( 4, " 1 свиток ", JumpPage, 13)
	Text( 4, " 5 свитков ", JumpPage, 14)
	Text( 4, " 10 свитков ", JumpPage, 15)
	Talk( 5," Выберите нужное кол-во свитков " )
	Text( 5, " 1 свиток ", JumpPage, 16)
	Text( 5, " 5 свитков ", JumpPage, 17)
	Text( 5, " 10 свитков ", JumpPage, 18)
	Talk( 6," Выберите нужное кол-во свитков " )
	Text( 6, " 1 свиток ", JumpPage, 19)
	Text( 6, " 5 свитков ", JumpPage, 20)
	Text( 6, " 10 свитков ", JumpPage, 21)
	-- Сила +20
	Talk(7," Это будет стоить 1 расписка +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5215,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," Это будет стоить 5 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5215,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," Это будет стоить 10 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5215,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Телосложение +20
	Talk(10," Это будет стоить 1 расписка +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5214,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," Это будет стоить 5 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5214,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," Это будет стоить 10 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5214,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Ловкость +20
	Talk(13," Это будет стоить 1 расписка +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5212,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," Это будет стоить 5 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5212,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," Это будет стоить 10 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5212,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Точность +20
	Talk(16," Это будет стоить 1 расписка +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5213,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," Это будет стоить 5 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5213,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," Это будет стоить 10 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5213,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	-- Дух +20
	Talk(19," Это будет стоить 1 расписка +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5216,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," Это будет стоить 5 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5216,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," Это будет стоить 10 расписок +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7620,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5216,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"Дорогой пират!_Недостаточно свободного места в инвентаре,_Либо отсутствует нужное количество расписок +20 " )
end
function Exchange_gem_30 ()
	Talk( 1, "Приветствую тебя, пират!_Обменивай у меня свитки Форжа +30_С ними ты сможешь стать сильнее!. ")
	Text( 1, "Свиток Силы +30 ", JumpPage, 2)
	Text( 1, "Свиток Телосложения +30 ", JumpPage, 3)
	Text( 1, "Свиток Ловкости +30 ", JumpPage, 4)
	Text( 1, "Свиток Точности +30 ", JumpPage, 5)
	Text( 1, "Свиток Духа +30 ", JumpPage, 6)
	Talk( 2," Выберите нужное кол-во свитков " )
	Text( 2, " 1 свиток ", JumpPage, 7)
	Text( 2, " 5 свитков ", JumpPage, 8)
	Text( 2, " 10 свитков ", JumpPage, 9)
	Talk( 3," Выберите нужное кол-во свитков " )
	Text( 3, " 1 свиток ", JumpPage, 10)
	Text( 3, " 5 свитков ", JumpPage, 11)
	Text( 3, " 10 свитков ", JumpPage, 12)
	Talk( 4," Выберите нужное кол-во свитков " )
	Text( 4, " 1 свиток ", JumpPage, 13)
	Text( 4, " 5 свитков ", JumpPage, 14)
	Text( 4, " 10 свитков ", JumpPage, 15)
	Talk( 5," Выберите нужное кол-во свитков " )
	Text( 5, " 1 свиток ", JumpPage, 16)
	Text( 5, " 5 свитков ", JumpPage, 17)
	Text( 5, " 10 свитков ", JumpPage, 18)
	Talk( 6," Выберите нужное кол-во свитков " )
	Text( 6, " 1 свиток ", JumpPage, 19)
	Text( 6, " 5 свитков ", JumpPage, 20)
	Text( 6, " 10 свитков ", JumpPage, 21)
	-- Сила +30
	Talk(7," Это будет стоить 1 расписка +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5220,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," Это будет стоить 5 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5220,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," Это будет стоить 10 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5220,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Телосложение +30
	Talk(10," Это будет стоить 1 расписка +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5219,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," Это будет стоить 5 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5219,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," Это будет стоить 10 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5219,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Ловкость +30
	Talk(13," Это будет стоить 1 расписка +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5217,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," Это будет стоить 5 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5217,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," Это будет стоить 10 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5217,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Точность +30
	Talk(16," Это будет стоить 1 расписка +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5218,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," Это будет стоить 5 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5218,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," Это будет стоить 10 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5218,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	-- Дух +30
	Talk(19," Это будет стоить 1 расписка +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5221,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," Это будет стоить 5 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5221,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," Это будет стоить 10 расписок +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7930,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5221,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"Дорогой пират!_Недостаточно свободного места в инвентаре,_Либо отсутствует нужное количество расписок +30 " )
end
function Exchange_gem_40 ()
	Talk( 1, "Приветствую тебя, пират!_Обменивай у меня свитки Форжа +40_С ними ты сможешь стать сильнее!. ")
	Text( 1, "Свиток Силы +40 ", JumpPage, 2)
	Text( 1, "Свиток Телосложения +40 ", JumpPage, 3)
	Text( 1, "Свиток Ловкости +40 ", JumpPage, 4)
	Text( 1, "Свиток Точности +40 ", JumpPage, 5)
	Text( 1, "Свиток Духа +40 ", JumpPage, 6)
	Talk( 2," Выберите нужное кол-во свитков " )
	Text( 2, " 1 свиток ", JumpPage, 7)
	Text( 2, " 5 свитков ", JumpPage, 8)
	Text( 2, " 10 свитков ", JumpPage, 9)
	Talk( 3," Выберите нужное кол-во свитков " )
	Text( 3, " 1 свиток ", JumpPage, 10)
	Text( 3, " 5 свитков ", JumpPage, 11)
	Text( 3, " 10 свитков ", JumpPage, 12)
	Talk( 4," Выберите нужное кол-во свитков " )
	Text( 4, " 1 свиток ", JumpPage, 13)
	Text( 4, " 5 свитков ", JumpPage, 14)
	Text( 4, " 10 свитков ", JumpPage, 15)
	Talk( 5," Выберите нужное кол-во свитков " )
	Text( 5, " 1 свиток ", JumpPage, 16)
	Text( 5, " 5 свитков ", JumpPage, 17)
	Text( 5, " 10 свитков ", JumpPage, 18)
	Talk( 6," Выберите нужное кол-во свитков " )
	Text( 6, " 1 свиток ", JumpPage, 19)
	Text( 6, " 5 свитков ", JumpPage, 20)
	Text( 6, " 10 свитков ", JumpPage, 21)
	-- Сила +40
	Talk(7," Это будет стоить 1 расписка +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5225,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," Это будет стоить 5 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5225,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," Это будет стоить 10 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5225,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Телосложение +40
	Talk(10," Это будет стоить 1 расписка +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," Это будет стоить 5 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," Это будет стоить 10 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Ловкость +40
	Talk(13," Это будет стоить 1 расписка +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5222,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," Это будет стоить 5 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5222,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," Это будет стоить 10 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5222,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	-- Точность +40
	Talk(16," Это будет стоить 1 расписка +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," Это будет стоить 5 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," Это будет стоить 10 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5223,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	-- Дух +40
	Talk(19," Это будет стоить 1 расписка +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5226,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," Это будет стоить 5 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,5 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5226,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," Обмен ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," Это будет стоить 10 расписок +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7825,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 5226,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," Обмен ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"Дорогой пират!_Недостаточно свободного места в инвентаре_Либо отсутствует нужное количество расписок +40 " )
end

-- Обменник СУЭ
function exchange_sue()
	Talk( 1, "Приветствую тебя, пират! Хочешь обменять свои СУЭ? Выбирай количество! ")
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,10 )
	TriggerAction( 1, exchange_sue_fast, 10 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"СУЭ х10 ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,50 )
	TriggerAction( 1, exchange_sue_fast, 50 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"СУЭ х50 ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,100 )
	TriggerAction( 1, exchange_sue_fast, 100 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"СУЭ х100 ",MultiTrigger,GetMultiTrigger(),1)


	Text( 1, "Уйти. ", CloseTalk)

	Talk(10, "Что-то пошло не так! ")
	Text(10, "Вернусь позже. ", CloseTalk)
end

-- Страж Новичков(контракты новичка и удаление контрактов)
function straj_Newbie()
	Talk( 1, "Приветствую тебя, пират!_Выполняй контракты и получай свои волшебные призы!_О призах я рассказать не могу. ")
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, GetKontrakt, 4, 3000, 50 )
	Text( 1, "Контракт усиления ", MultiTrigger, GetMultiTrigger(), 1)
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, GetKontrakt, 5, 294, 20 )
	Text( 1, "Контракт опыта ", MultiTrigger, GetMultiTrigger(), 1)
	--	InitTrigger()
	--	TriggerCondition( 1, LvCheck, "<", 101 )
	--	TriggerFailure( 1, JumpPage, 2 )
	--	TriggerAction( 1, GetKontrakt, 6, 3000, 300 )
	--Text( 1, "VIP контракт ", MultiTrigger, GetMultiTrigger(), 1)
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, DeleteKontrakt )
	Text( 1, "Удалить 1 контракт ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 1, "Уйти. ", CloseTalk )
	
	Talk( 2, "Чтобы пользоваться этим контрактом, нужно быть меньше 100 уровня. ")
	Text( 2, "", CloseTalk)
end

-- Торговец пряностями(сусы, рюкзаки и тд)
function sell_all ()
	
	Talk( 1,  "Привет! Заходи в мой магазин, я продаю много интересного! " )
	Text( 1,  "Посмотреть ассортимент ", BuyPage )
   
	Weapon(	3096    )
	Weapon(	3097	)
	Weapon(	3094    )
	Weapon(	3095	)
	Weapon(	0849	)
    Defence(	3088	)
	Defence(	3089	)
	Defence(	3090	)
	Defence(	3091	)
	Defence(	3092	)
	Defence(	3093	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	)
	Defence(	3112	)
	Defence(	3113	)
	Other(	3098	)
	Other(	3099	)
	Other(	7837	)
	Other(	7838	)
	Other(	3143	)
	Other(	3047	)
	Other(	2440	)
	Other(	3301	)
	Other(	3463	)
	Other(	4603	)
	Other(	2816	)
	
end

-- Телепорт в Шайтане
function Tp_all()
	Talk( 1, "Приветствую тебя, странник! Куда хочешь попасть на этот раз? " ) 
	--Text( 1, "Города ", JumpPage, 3 )
	Text( 1, "Острова ", JumpPage, 2 )
	Text( 1, "Зоны ", JumpPage, 6 )
	--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )
	
	Text( 2, "\206\241\242\240\238\226 \196\230\229\234\224 ", GoTo, 1503, 1036, "magicsea" )
	Text( 2, "\206\241\242\240\238\226 \209\242\243\230\232 ", GoTo, 77, 199, "stuja" )
	--Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
	--Text( 2, "Остров Стужи ", GoTo, 77, 199, "stuja" )
	--Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
	--Text( 2, "\206\241\242\240\238\226 \213\253\235\235\238\243\232\237\224 ", GoTo, 160,140, "halloween" )
	--Text( 2, "\206\241\242\240\238\226 \209\234\238\240\225\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 99, 103, "farmer1" )
	Text( 2, "Рыбный остров ", GoTo, 56, 90, "fishing" )
	--Text( 2, "\206\241\242\240\238\226 \210\251\234\226 ", GoTo, 160, 140, "halloween" )
	--Text( 2, "\196\224\235\229\229 ", JumpPage, 4 )
	
	--Text( 3, "\195\238\240\238\228 \209\243\228\252\225\251 ", GoTo, 157, 128, "CrystalShore" )
	--Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
	--Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
	--Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )
	--Text( 4, "NEW 2. ", GoTo, 98, 113, "necropolis" )
	
	
	--Text( 5, "1 ", GoTo, 311, 297, "eastgoaf" )
	--Text( 5, "2 ", GoTo, 56, 252, "eastgoaf" )
	--Text( 5, "3 ", GoTo, 889, 526, "eastgoaf" )
	--Text( 5, "4 ", GoTo, 768,661, "eastgoaf" )
	--Text( 5, "5 ", GoTo, 777,730, "eastgoaf" )
	--Text( 5, "6 ", GoTo, 612,626, "jialebi" )
	--Text( 5, "7 ", GoTo, 1263,1008, "jialebi" )
	--Text( 5, "8 ", GoTo, 947,837, "jialebi" )
	--Text( 5, "9 ", GoTo, 1247,601, "jialebi" )
	
	Talk( 6, "Выбирай, в какую зону хочешь попасть: ")
	Text( 6, "Шахты (Добыча золота) ", GoTo, 1139, 297, "magicsea" )
	Text( 6, "Деревня Пауков (ур. 200) ", GoTo, 639, 568, "magicsea" )
	--Text( 6, "\208\238\249\224 \215\229\240\229\239\224\245 (\211\240. 230-300) ", GoTo, 983, 455, "magicsea" )
	--Text( 6, "\203\224\227\229\240\252 \207\243\241\242\251\237\237\251\245 \209\234\229\235\229\242\238\226 (\211\240. 350-400) ", GoTo, 951, 319, "magicsea" )
	--Text( 6, "\207\247\229\235\232\237\251\233 \206\224\231\232\241 (\211\240. 450-500) ", GoTo, 868, 393, "magicsea" )
	--Text( 6, "\203\224\227\229\240\252 \206\224\231\232\241 (\211\240. 550-600) ", GoTo, 564, 383, "magicsea" )
	--Text( 6, "\211\235\232\242\238\247\237\251\233 \206\224\231\232\241 (\211\240. 650-700) ", GoTo, 466, 395, "magicsea" )
	--Text( 6, "\196\224\235\229\229 ", JumpPage, 7 )
	
	--Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
	--Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 357, 181, "magicsea" )
	--Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 451, 189, "magicsea" )
	--Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 536, 185, "magicsea" )

 end

 function Npc_Jessika ()
	Talk( 1, "Приветствую тебя, пират!_Чем тебе может помочь юная дева? " )
	Text( 1, "Хочу что-нибудь купить ", BuyPage)
	Text( 1, "Уйти ", CloseTalk)

	InitTrade()
	Weapon(	3343	)
	Weapon(	3077	)
	Weapon(	2870	)
	Weapon(	3355	)
	Weapon(	3351	)
	Weapon(	3352	)
	Weapon(	3353	)
	Weapon(	4264	)
	Weapon(	4265	)
	Weapon(	4266	)
	Weapon(	4267	)
	Weapon(	4268	)
	Weapon(	4269	)
	Weapon(	4270	)

	AddNpcMission ( 919 )
	AddNpcMission ( 924 )
	AddNpcMission ( 2040 )
end

--Банк
function npc_bank ()
	
	Talk( 1, "Привет! Добро пожаловать в Банк Шайтана. Могу ли я чем-либо помочь? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (50000 золота) ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 1,  "Покупка Купюр ", JumpPage, 3)
	Talk( 2,  "Прости, но у тебя недостаточно денег на счету " )
	
	Talk( 3, "В наличии остались только крупные купюры " )
	--Text( 3,  "Купюра 10кк (10 штук)", JumpPage, 4)
	--Text( 3,  "Купюра 10кк (50 штук)", JumpPage, 5)
	--Text( 3,  "Купюра 50кк ", JumpPage, 6)
	--Text( 3,  "Купюра 100кк ", JumpPage, 7)
	Text( 3,  "Купюра 500.000 ", JumpPage, 8)
	Text( 3,  "Купюра 500.000 10 штук", JumpPage, 7)
	Text( 3,  "Купюра 1.000.000 ", JumpPage, 9)
	Text( 3,  "Купюра 5.000.000 ", JumpPage, 10)
	Text( 3,  "Купюра 50.000.000 ", JumpPage, 11)
	Text( 3,  "Купюра 100.000.000", JumpPage, 12)
	Text( 3,  "Купюра 500.000.000", JumpPage, 13)
	Text( 3,  "Купюра 1.000.000.000", JumpPage, 14)
	Talk( 4, "Ну для новичка сойдёт " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7476,10 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7476,10 )
	TriggerAction( 1, AddMoney, 100000000 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(4," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 5, "Вполне неплохо " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7476,50 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7476,50 )
	TriggerAction( 1, AddMoney, 500000000 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(5," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 6, "Хорошо " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7491,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 7491,1 )
	TriggerAction( 1, AddMoney, 50000000 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 10)
	Text(6," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 7, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, GiveItem, 7493,10,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(7," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 8, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 500000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 500000 )
	TriggerAction( 1, GiveItem, 7493,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(8," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 9, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 1000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 1000000 )
	TriggerAction( 1, GiveItem, 854,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(9," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 10, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, GiveItem, 7734,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(10," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 11, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 50000000 )
	TriggerAction( 1, GiveItem, 7735,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(11," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 12, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, GiveItem, 7742,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(12," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 13, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 500000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 500000000 )
	TriggerAction( 1, GiveItem, 7736,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(13," Меняю ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 14, "Да ну?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 1000000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeMoney, 1000000000 )
	TriggerAction( 1, GiveItem, 7743,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(14," Меняю ",MultiTrigger,GetMultiTrigger(),1)


	AddNpcMission (	2024	)
	AddNpcMission (	2025	)
	AddNpcMission (	1051	)
	AddNpcMission (	1104	)
	AddNpcMission (	1160	)
	AddNpcMission (	1213	)
	AddNpcMission (	1231	)
	AddNpcMission (	5012	)	
end 



--НПС с феями
function npc_fairy ()
	
	Talk( 1,  "Продавец Фей: Привет! Я жена кузнеца!Достигнув определённого уровня,ты сможешь получить задания на фрукты фей " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Улучшение Фей ", OpenItemTiChun )
	Text( 1,  "Великие Фрукты Фей 200-500 ", JumpPage, 2)
	Text( 1,  "Легендарные Фрукты Фей 500-800 ", JumpPage, 11)
	Text( 1,  "Обмен Монет Фей ", JumpPage, 8)
	Text( 1,  "Расскажи про задания ", JumpPage, 17)
	
	Talk( 2," Выберите нужный фрукт " )
	Text( 2, " Фрукт Силы ", JumpPage, 3)
	Text( 2, " Фрукт Ловкости ", JumpPage, 4)
	Text( 2, " Фрукт Точности ", JumpPage, 5)
	Text( 2, " Фрукт Телосложения ", JumpPage, 6)
	Text( 2, " Фрукт Духа ", JumpPage, 7)
	
	Talk( 8," Эльфийская печать будет стоить 30 монет феи,а королевская аж 500! " )
	Text( 8, " Эльфийская Печать ", JumpPage, 9)
	Text( 8, " Королевская Печать ", JumpPage, 10)
	
	Talk( 11," Выберите нужный фрукт " )
	Text( 11, " Фрукт Силы ", JumpPage, 12)
	Text( 11, " Фрукт Ловкости ", JumpPage, 13)
	Text( 11, " Фрукт Точности ", JumpPage, 14)
	Text( 11, " Фрукт Телосложения ", JumpPage, 15)
	Text( 11, " Фрукт Духа ", JumpPage, 16)
	
	Talk( 17," Для Задания Фрукта Феи Анжелы тебе необходим 500 уровень.Для Феи Анжелы Младшей - 1000 уровень.Для Феи Августа - 2000 уровень! " )
	
	Talk( 3," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )

	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7431,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(3,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(3,"10 Фруктов ", JumpPage, 18)
	
	Talk(4," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7430,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(4,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(4,"10 Фруктов ", JumpPage, 19)
	
	Talk(5," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7433,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(5,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(5,"10 Фруктов ", JumpPage, 20)
	
	Talk(6," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7419,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(6,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(6,"10 Фруктов ", JumpPage, 21)
	
	Talk(7," Это будет стоить 1 Кристалл Фей (добыть их можно с мобов в Абаддоне 1-4 и Испытании) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7434,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(7,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(7,"10 Фруктов ", JumpPage, 22)
	
	Talk(9," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2588,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,30,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(9,"1 Штука ",MultiTrigger,GetMultiTrigger(),1)
	Text(9,"10 Штук ", JumpPage, 28)
	
	Talk(10," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2589,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2589,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,500,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(10,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(12," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7506,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(12,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(12,"10 Фруктов ", JumpPage, 23)
	
	Talk(13," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7505,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(13,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(13,"10 Фруктов ", JumpPage, 24)
	
	Talk(14," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7507,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(14,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(14,"10 Фруктов ", JumpPage, 25)
	
	Talk(15," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7504,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(15,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(15,"10 Фруктов ", JumpPage, 26)
	
	Talk(16," Это будет стоить 1 Камень Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,1 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7508,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(16,"1 Фрукт ",MultiTrigger,GetMultiTrigger(),1)
	Text(16,"10 Фруктов ", JumpPage, 27)
	
	Talk(29," Недостаточно свободного места,либо необходимого лута " )
	
	Talk(18," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7431,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(18,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7430,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(19,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7433,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(20,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7419,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(21,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22," Это будет стоить 10 Кристаллов Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1028,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7434,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(22,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7506,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(23,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

	Talk(24," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7505,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(24,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7507,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(25,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(26," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7504,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(26,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(27," Это будет стоить 10 Камней Высших Фей (добыть их можно с мобов в Лагере Мёртвых Душ) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 4832,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 7508,10,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(27,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28," Советую потратить их на игровой автомат (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 2588,10 ) -- Это функция "изьятия" предмета и в каком количестве
	TriggerAction( 1, GiveItem, 855,300,4 ) -- Это функция выдачи предмета (ID, кол-во)
	TriggerFailure( 1, JumpPage, 29)
	Text(28,"Обмен ",MultiTrigger,GetMultiTrigger(),1)
	
    Weapon(	0681	)
	Weapon(	2312	)
	Weapon(	0247	)
	Weapon(	0244	)
	Weapon(	0250	)
	Weapon(	0253	)
	Weapon(	0260	)
    Weapon(	0609	)
	Defence(	0222	)
	Defence(	0223	)
	Defence(	0224	)
	Defence(	0225	)
	Defence(	0226	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Other(  3300    )
	Other(  3462    )
	
	AddNpcMission ( 991 )
	AddNpcMission ( 906 )
	AddNpcMission ( 2041 )

end 

--Обмен 200 бижутерии, колец и шапки
function Pauk_200 ()   
Talk( 1, "Привет! Ты уже дошел до сета Паука? Выбирай, что ты хочешь обменять: ")    
Text( 1, "Вернуться в Шайтан ", GoTo, 667, 839, "magicsea" )
Text( 1, "Паучья Шапка ", JumpPage, 5)
Text( 1, "Паучье Ожерелье ", JumpPage, 3)
Text( 1, "Паучье Кольцо ", JumpPage, 4)



Talk(3,"Для получения Паучьего Ожерелья, принеси мне:_1. Руна Кэль - 900шт;_2. Чёрная Жемчужина - 300шт;_3. Яд - 150шт;_4. Карта Главного Паука - 1шт;_5. Карта Паука - 3шт;_6. Репутация - 200шт;_7. Золото - 20 миллионов. ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 )
TriggerCondition( 1, HasItem,3362,300 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,3 )
TriggerCondition( 1, HasItem,4441,150 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,900 )
TriggerAction( 1, TakeItem, 3362,300 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,3 )
TriggerAction( 1, TakeItem, 4441,150 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7755,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," Обменять Ожерелье Паука ",MultiTrigger,GetMultiTrigger(),1)

Talk(4,"Чтобы обменять Кольцо Паука, принеси мне:_1. Руна Кэль - 450шт;_2. Чёрная Жемчужина - 150шт;_3. Яд - 75шт;_4. Карта Главного Паука - 1шт;_5. Карта Паука - 1шт;_6. Репутация - 200шт;_7. Золото - 20 миллионов. " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,450 )
TriggerCondition( 1, HasItem,3362,150 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,1 )
TriggerCondition( 1, HasItem,4441,75 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,450 )
TriggerAction( 1, TakeItem, 3362,150 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,1 )
TriggerAction( 1, TakeItem, 4441,75 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7754,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4,"Обменять Кольцо Паука ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"Чтобы обменять Шапочку Паука, принеси мне:_1. Паутинка - 200шт;_2. Яд - 200шт;_3. Карта Главного Паука - 1шт;)_4. Карта Рыцаря Пустыни - 1шт;_5. Карта Паука - 2шт;_6. Репутация - 200шт;_7. Золото - 20 миллионов. " )
InitTrigger()
TriggerCondition( 1, HasItem,1728,200 )
TriggerCondition( 1, HasItem,4441,200 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,2 )
TriggerCondition( 1, HasItem,7461,1 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 1728,200 )
TriggerAction( 1, TakeItem, 4441,200 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,2 )
TriggerAction( 1, TakeItem, 7461,1 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7753,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(5,"Обменять Шапочку Паука ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Не хватает лута! " )

end

--Мирные навыки
function Mirniy_navik ()
	
	Talk( 1,  "Привет! Интересуешься мирными навыками? У меня большой выбор! " )
	Text( 1,  "Посмотреть ассортимент ", BuyPage )
   
	Weapon(	3296	)
	Weapon(	3226    )
	Weapon(	3225	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	3288	)
	Defence( 3279	)
	
	--Миссии
	AddNpcMission	(221)
	AddNpcMission	(222)
end

-- Аппарели Ланса
function app_lanc () 

	Talk( 1, "Приветствую тебя, пират! Хочешь приобрести украшения на Ланса? " )
	Text( 1, "Посмотреть ассортимент", BuyPage)

	InitTrade  ()
	Weapon(	15013	)
	Weapon(	15021	)
	Weapon(	15029	)
	Weapon(	15017	)
	Weapon(	15025	)
	Weapon(	15033	)
	Weapon(	15041	)
	Weapon(	15045	)
	Weapon(	15049	)
	Weapon(	15057	)
	Weapon(	15061	)
	Weapon(	15065	)
	Weapon(	15075	)
	Weapon(	15076	)
	Weapon(	15077	)
	Weapon(	15119	)
	Weapon(	15120	)
	Weapon(	15121	)
	Weapon(	15123	)
	Weapon(	15124	)
	Weapon(	15125	)
	Weapon(	15127	)
	Weapon(	15128	)
	Weapon(	15129	)
	Weapon(	15154	)
	Weapon(	15155	)
	Weapon(	15156	)
	Weapon(	15157	)
	Weapon(	15158	)
	Weapon(	15159	)
	Weapon(	15160	)
	Weapon(	15161	)
	Weapon(	15162	)
	Weapon(	15205	)
	Weapon(	15206	)
	Weapon(	15207	)
	Weapon(	15221	)
	Weapon(	15222	)
	Weapon(	15223	)
	Weapon(	15224	)
	Weapon(	15225	)
	Weapon(	15226	)
	Weapon(	15227	)
	Weapon(	15228	)
	Weapon(	15229	)
	Weapon(	15264	)
	Weapon(	15265	)
	Weapon(	15266	)
	Weapon(	15288	)
	Weapon(	15289	)
	Weapon(	15290	)
	Weapon(	15303	)
	Weapon(	15304	)
	Weapon(	15305	)
	Weapon(	15316	)
	Weapon(	15317	)
	Weapon(	15318	)
	Weapon(	15341	)
	Weapon(	15342	)
	Weapon(	15343	)
	Weapon(	15357	)
	Weapon(	15358	)
	Weapon(	15359	)
	Weapon(	15373	)
	Weapon(	15374	)
	Weapon(	15375	)
	Weapon(	15389	)
	Weapon(	15390	)
	Weapon(	15391	)
	Weapon(	15405	)
	Weapon(	15406	)
	Weapon(	15432	)
	Weapon(	15433	)
	Weapon(	15436	)
	Weapon(	15440	)
	Weapon(	15444	)
	Weapon(	15457	)
	Weapon(	15458	)
	Weapon(	15459	)
	Weapon(	15488	)
	Weapon(	15489	)
	Weapon(	15490	)
	Weapon(	15501	)
	Weapon(	15502	)
	Weapon(	15503	)
	Weapon(	15946	)
	Weapon(	15947	)
	Weapon(	15948	)
	Weapon(	15762	)
	Weapon(	15763	)
	Defence(	15522	)
	Defence(	15523	)
	Defence(	15524	)
	Defence(	15538	)
	Defence(	15539	)
	Defence(	15540	)
	Defence(	15554	)
	Defence(	15555	)
	Defence(	15556	)
	Defence(	15570	)
	Defence(	15571	)
	Defence(	15572	)
	Defence(	15578	)
	Defence(	15579	)
	Defence(	15580	)
	Defence(	15594	)
	Defence(	15595	)
	Defence(	15596	)
	Defence(	15652	)
	Defence(	15653	)
	Defence(	15654	)
	Defence(	15662	)
	Defence(	15663	)
	Defence(	15664	)
	Defence(	15678	)
	Defence(	15679	)
	Defence(	15680	)
	Defence(	15727	)
	Defence(	15728	)
	Defence(	15729	)
	Defence(	15743	)
	Defence(	15744	)
	Defence(	15745	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15971	)
	Defence(	15972	)
	Defence(	15973	)
	Defence(	15992	)
	Defence(	15993	)
	Defence(	15994	)
	Defence(	16344	)
	Defence(	16345	)
	Defence(	16346	)
	Defence(	16353	)
	Defence(	16354	)
	Defence(	16355	)
	Defence(	16369	)
	Defence(	16370	)
	Defence(	16371	)
	Defence(	16385	)
	Defence(	16386	)
	Defence(	16387	)
	Defence(	16401	)
	Defence(	16402	)
	Defence(	16403	)
	Defence(	16417	)
	Defence(	16418	)
	Defence(	16419	)
	Defence(	16433	)
	Defence(	16434	)
	Defence(	16435	)
	Defence(	16449	)
	Defence(	16450	)
	Defence(	16451	)
	Defence(	16465	)
	Defence(	16466	)
	Defence(	16467	)
	Defence(	16481	)
	Defence(	16482	)
	Defence(	16483	)
	Defence(	16521	)
	Defence(	16522	)
	Defence(	16523	)
	Defence(	16545	)
	Defence(	16546	)
	Defence(	16547	)
	Defence(	16549	)
	Defence(	16550	)
	Defence(	16551	)
	Defence(	16553	)
	Defence(	16554	)
	Defence(	16555	)
	Defence(	16561	)
	Defence(	16562	)
	Defence(	16563	)
	Defence(	16577	)
	Defence(	16578	)
	Defence(	16579	)
	Defence(	16537	)
	Defence(	16538	)
	Defence(	16539	)
	Other(	15122	)
	Other(	15126	)
	Other(	15220	)
	Other(	15287	)
	Other(	15945	)
	Other(	15472	)
	Other(	15476	)
	Other(	15480	)
	Other(	15484	)
	Other(	15456	)
	Other(	15404	)
	Other(	15388	)
	Other(	15372	)
	Other(	15356	)
	Other(	15315	)
	Other(	15569	)
	Other(	15577	)
	Other(	15521	)
	Other(	15537	)
	Other(	15553	)
	Other(	15593	)
	Other(	15651	)
	Other(	15661	)
	Other(	15677	)
	Other(	15726	)
	Other(	15742	)
	Other(	15965	)
	Other(	15970	)
	Other(	15843	)
end

-- Аппарели Карциз
function app_carcis() 

	Talk( 1, "Приветствую тебя, пират! Хочешь посмотреть украшения на Карциза? " )
	Text( 1, "Посмотреть ассортимент ", BuyPage)

	InitTrade()
	Weapon(	15014	)
	Weapon(	15018	)
	Weapon(	15022	)
	Weapon(	15026	)
	Weapon(	15030	)
	Weapon(	15034	)
	Weapon(	15039	)
	Weapon(	15040	)
	Weapon(	15042	)
	Weapon(	15046	)
	Weapon(	15050	)
	Weapon(	15058	)
	Weapon(	15062	)
	Weapon(	15066	)
	Weapon(	15084	)
	Weapon(	15085	)
	Weapon(	15086	)
	Weapon(	15087	)
	Weapon(	15088	)
	Weapon(	15089	)
	Weapon(	15090	)
	Weapon(	15091	)
	Weapon(	15092	)
	Weapon(	15093	)
	Weapon(	15094	)
	Weapon(	15095	)
	Weapon(	15096	)
	Weapon(	15097	)
	Weapon(	15098	)
	Weapon(	15107	)
	Weapon(	15108	)
	Weapon(	15109	)
	Weapon(	15111	)
	Weapon(	15112	)
	Weapon(	15113	)
	Weapon(	15115	)
	Weapon(	15116	)
	Weapon(	15117	)
	Weapon(	15195	)
	Weapon(	15196	)
	Weapon(	15197	)
	Weapon(	15231	)
	Weapon(	15232	)
	Weapon(	15233	)
	Weapon(	15235	)
	Weapon(	15236	)
	Weapon(	15237	)
	Weapon(	15238	)
	Weapon(	15239	)
	Weapon(	15240	)
	Weapon(	15267	)
	Weapon(	15268	)
	Weapon(	15269	)
	Weapon(	15292	)
	Weapon(	15293	)
	Weapon(	15294	)
	Weapon(	15306	)
	Weapon(	15307	)
	Weapon(	15308	)
	Weapon(	15320	)
	Weapon(	15321	)
	Weapon(	15322	)
	Weapon(	15345	)
	Weapon(	15346	)
	Weapon(	15347	)
	Weapon(	15361	)
	Weapon(	15362	)
	Weapon(	15363	)
	Weapon(	15377	)
	Weapon(	15378	)
	Weapon(	15379	)
	Weapon(	15393	)
	Weapon(	15394	)
	Weapon(	15395	)
	Weapon(	15408	)
	Weapon(	15409	)
	Weapon(	15434	)
	Weapon(	15435	)
	Weapon(	15437	)
	Weapon(	15441	)
	Weapon(	15445	)
	Weapon(	15461	)
	Weapon(	15462	)
	Weapon(	15463	)
	Weapon(	15491	)
	Weapon(	15492	)
	Weapon(	15493	)
	Weapon(	15504	)
	Weapon(	15505	)
	Weapon(	15506	)
	Weapon(	15574	)
	Weapon(	15575	)
	Weapon(	15576	)
	Weapon(	16592	)
	Weapon(	16593	)
	Defence(	15526	)
	Defence(	15527	)
	Defence(	15528	)
	Defence(	15542	)
	Defence(	15543	)
	Defence(	15544	)
	Defence(	15558	)
	Defence(	15559	)
	Defence(	15560	)
	Defence(	15582	)
	Defence(	15583	)
	Defence(	15584	)
	Defence(	15598	)
	Defence(	15599	)
	Defence(	15600	)
	Defence(	15656	)
	Defence(	15657	)
	Defence(	15658	)
	Defence(	15666	)
	Defence(	15667	)
	Defence(	15668	)
	Defence(	15682	)
	Defence(	15683	)
	Defence(	15684	)
	Defence(	15731	)
	Defence(	15732	)
	Defence(	15733	)
	Defence(	15747	)
	Defence(	15748	)
	Defence(	15749	)
	Defence(	15950	)
	Defence(	15951	)
	Defence(	15952	)
	Defence(	15969	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15975	)
	Defence(	15976	)
	Defence(	15977	)
	Defence(	15793	)
	Defence(	15794	)
	Defence(	15795	)
	Defence(	15783	)
	Defence(	15784	)
	Defence(	15785	)
	Defence(	16336	)
	Defence(	16345	)
	Defence(	16346	)
	Defence(	16357	)
	Defence(	16358	)
	Defence(	16359	)
	Defence(	16373	)
	Defence(	16374	)
	Defence(	16375	)
	Defence(	16389	)
	Defence(	16390	)
	Defence(	16391	)
	Defence(	16405	)
	Defence(	16406	)
	Defence(	16407	)
	Defence(	16421	)
	Defence(	16422	)
	Defence(	16423	)
	Defence(	16437	)
	Defence(	16438	)
	Defence(	16439	)
	Defence(	16453	)
	Defence(	16454	)
	Defence(	16455	)
	Defence(	16469	)
	Defence(	16470	)
	Defence(	16471	)
	Defence(	16485	)
	Defence(	16486	)
	Defence(	16487	)
	Defence(	16525	)
	Defence(	16526	)
	Defence(	16527	)
	Defence(	16517	)
	Defence(	16518	)
	Defence(	16519	)
	Defence(	16541	)
	Defence(	16542	)
	Defence(	16543	)
	Defence(	16585	)
	Defence(	16586	)
	Defence(	16587	)
	Defence(	16588	)
	Defence(	16589	)
	Defence(	16590	)
	Defence(	16595	)
	Defence(	16596	)
	Defence(	16597	)
	Defence(	16598	)
	Defence(	16599	)
	Defence(	16600	)
	Defence(	16602	)
	Defence(	16603	)
	Defence(	16604	)
	Other(	15573	)
	Other(	15557	)
	Other(	15541	)
	Other(	15485	)
	Other(	15473	)
	Other(	15477	)
	Other(	15481	)
	Other(	15460	)
	Other(	15106	)
	Other(	15407	)
	Other(	15392	)
	Other(	15218	)
	Other(	15110	)
	Other(	15114	)
	Other(	15230	)
	Other(	15234	)
	Other(	15291	)
	Other(	15319	)
	Other(	15360	)
	Other(	15376	)
	Other(	15581	)
	Other(	15597	)
	Other(	15665	)
	Other(	15525	)
	Other(	15655	)
	Other(	15730	)
	Other(	15746	)
	Other(	15949	)
	Other(	15965	)
	Other(	15974	)
	Other(	15681	)
	Other(	15792	)
	Other(	15843	)
end

-- Аппарели Филлис
function app_fillis () 

	Talk( 1, "Приветствую тебя, пират! Хочешь посмотреть украшения на Филлис? " )
	Text( 1, "Посмотреть ассортимент! ", BuyPage)

	InitTrade()
	Weapon(	15015	)
	Weapon(	15019	)
	Weapon(	15023	)
	Weapon(	15027	)
	Weapon(	15031	)
	Weapon(	15035	)
	Weapon(	15043	)
	Weapon(	15047	)
	Weapon(	15051	)
	Weapon(	15059	)
	Weapon(	15063	)
	Weapon(	15081	)
	Weapon(	15082	)
	Weapon(	15083	)
	Weapon(	15084	)
	Weapon(	15085	)
	Weapon(	15086	)
	Weapon(	15087	)
	Weapon(	15088	)
	Weapon(	15089	)
	Weapon(	15090	)
	Weapon(	15091	)
	Weapon(	15092	)
	Weapon(	15093	)
	Weapon(	15094	)
	Weapon(	15095	)
	Weapon(	15096	)
	Weapon(	15097	)
	Weapon(	15098	)
	Weapon(	15143	)
	Weapon(	15144	)
	Weapon(	15145	)
	Weapon(	15147	)
	Weapon(	15148	)
	Weapon(	15149	)
	Weapon(	15151	)
	Weapon(	15152	)
	Weapon(	15153	)
	Weapon(	15166	)
	Weapon(	15167	)
	Weapon(	15168	)
	Weapon(	15169	)
	Weapon(	15170	)
	Weapon(	15171	)
	Weapon(	15172	)
	Weapon(	15173	)
	Weapon(	15174	)
	Weapon(	15202	)
	Weapon(	15203	)
	Weapon(	15204	)
	Weapon(	15241	)
	Weapon(	15242	)
	Weapon(	15243	)
	Weapon(	15245	)
	Weapon(	15246	)
	Weapon(	15247	)
	Weapon(	15249	)
	Weapon(	15250	)
	Weapon(	15251	)
	Weapon(	15270	)
	Weapon(	15271	)
	Weapon(	15272	)
	Weapon(	15296	)
	Weapon(	15297	)
	Weapon(	15298	)
	Weapon(	15309	)
	Weapon(	15310	)
	Weapon(	15311	)
	Weapon(	15324	)
	Weapon(	15325	)
	Weapon(	15326	)
	Weapon(	15349	)
	Weapon(	15350	)
	Weapon(	15351	)
	Weapon(	15365	)
	Weapon(	15366	)
	Weapon(	15367	)
	Weapon(	15381	)
	Weapon(	15382	)
	Weapon(	15383	)
	Weapon(	15397	)
	Weapon(	15398	)
	Weapon(	15399	)
	Weapon(	15411	)
	Weapon(	15412	)
	Weapon(	15416	)
	Weapon(	15417	)
	Weapon(	15418	)
	Weapon(	15426	)
	Weapon(	15427	)
	Weapon(	15438	)
	Weapon(	15442	)
	Weapon(	15446	)
	Weapon(	15466	)
	Weapon(	15467	)
	Defence(	15494	)
	Defence(	15495	)
	Defence(	15496	)
	Defence(	15507	)
	Defence(	15508	)
	Defence(	15509	)
	Defence(	15530	)
	Defence(	15531	)
	Defence(	15532	)
	Defence(	15546	)
	Defence(	15547	)
	Defence(	15548	)
	Defence(	15562	)
	Defence(	15563	)
	Defence(	15564	)
	Defence(	15586	)
	Defence(	15587	)
	Defence(	15588	)
	Defence(	15602	)
	Defence(	15603	)
	Defence(	15604	)
	Defence(	15660	)
	Defence(	15670	)
	Defence(	15671	)
	Defence(	15672	)
	Defence(	15686	)
	Defence(	15687	)
	Defence(	15688	)
	Defence(	15735	)
	Defence(	15736	)
	Defence(	15737	)
	Defence(	15851	)
	Defence(	15852	)
	Defence(	15853	)
	Defence(	15954	)
	Defence(	15955	)
	Defence(	15956	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15979	)
	Defence(	15980	)
	Defence(	15981	)
	Defence(	15987	)
	Defence(	15988	)
	Defence(	15989	)
	Defence(	15753	)
	Defence(	15755	)
	Other(	15142	)
	Other(	15146	)
	Other(	15150	)
	Other(	15219	)
	Other(	15244	)
	Other(	15248	)
	Other(	15295	)
	Other(	15323	)
	Other(	15364	)
	Other(	15380	)
	Other(	15396	)
	Other(	15410	)
	Other(	15464	)
	Other(	15474	)
	Other(	15478	)
	Other(	15482	)
	Other(	15484	)
	Other(	15529	)
	Other(	15545	)
	Other(	15561	)
	Other(	15585	)
	Other(	15601	)
	Other(	15659	)
	Other(	15669	)
	Other(	15685	)
	Other(	15734	)
	Other(	15850	)
	Other(	15953	)
	Other(	15965	)
	Other(	15978	)
	Other(	15986	)
	Other(	15756	)
	Other(	15760	)
	Other(	15776	)
	Other(	15843	)
	Other(	15760	)
end 

-- Аппарели Ами
function app_ami () 

	Talk( 1, "Приветствую тебя, пират! Хочешь посмотреть украшения на Ами? " )
	Text( 1, "Посмотреть ассортимент! ", BuyPage)
	
	InitTrade()
	Weapon(	15016	)
	Weapon(	15020	)
	Weapon(	15024	)
	Weapon(	15028	)
	Weapon(	15032	)
	Weapon(	15036	)
	Weapon(	15044	)
	Weapon(	15048	)
	Weapon(	15052	)
	Weapon(	15060	)
	Weapon(	15064	)
	Weapon(	15068	)
	Weapon(	15132	)
	Weapon(	15133	)
	Weapon(	15135	)
	Weapon(	15136	)
	Weapon(	15137	)
	Weapon(	15139	)
	Weapon(	15140	)
	Weapon(	15141	)
	Weapon(	15175	)
	Weapon(	15176	)
	Weapon(	15177	)
	Weapon(	15179	)
	Weapon(	15180	)
	Weapon(	15181	)
	Weapon(	15183	)
	Weapon(	15184	)
	Weapon(	15185	)
	Weapon(	15187	)
	Weapon(	15188	)
	Weapon(	15189	)
	Weapon(	15191	)
	Weapon(	15192	)
	Weapon(	15193	)
	Weapon(	15198	)
	Weapon(	15199	)
	Weapon(	15200	)
	Weapon(	15253	)
	Weapon(	15254	)
	Weapon(	15255	)
	Weapon(	15257	)
	Weapon(	15258	)
	Weapon(	15259	)
	Weapon(	15261	)
	Weapon(	15262	)
	Weapon(	15263	)
	Weapon(	15273	)
	Weapon(	15274	)
	Weapon(	15275	)
	Weapon(	15300	)
	Weapon(	15301	)
	Weapon(	15302	)
	Weapon(	15312	)
	Weapon(	15313	)
	Weapon(	15314	)
	Weapon(	15328	)
	Weapon(	15329	)
	Weapon(	15330	)
	Weapon(	15353	)
	Weapon(	15354	)
	Weapon(	15355	)
	Weapon(	15369	)
	Weapon(	15370	)
	Weapon(	15371	)
	Weapon(	15385	)
	Weapon(	15386	)
	Weapon(	15387	)
	Weapon(	15401	)
	Weapon(	15402	)
	Weapon(	15403	)
	Weapon(	15414	)
	Weapon(	15415	)
	Weapon(	15419	)
	Weapon(	15420	)
	Weapon(	15421	)
	Weapon(	15429	)
	Weapon(	15430	)
	Weapon(	15431	)
	Weapon(	15439	)
	Weapon(	15443	)
	Weapon(	15447	)
	Weapon(	15469	)
	Weapon(	15470	)
	Weapon(	15471	)
	Weapon(	15498	)
	Weapon(	15499	)
	Weapon(	15500	)
	Defence(	15511	)
	Defence(	15512	)
	Defence(	15513	)
	Defence(	15517	)
	Defence(	15518	)
	Defence(	15519	)
	Defence(	15534	)
	Defence(	15535	)
	Defence(	15536	)
	Defence(	15550	)
	Defence(	15551	)
	Defence(	15552	)
	Defence(	15566	)
	Defence(	15567	)
	Defence(	15568	)
	Defence(	15590	)
	Defence(	15591	)
	Defence(	15592	)
	Defence(	15606	)
	Defence(	15607	)
	Defence(	15608	)
	Defence(	15674	)
	Defence(	15675	)
	Defence(	15676	)
	Defence(	15690	)
	Defence(	15691	)
	Defence(	15692	)
	Defence(	15739	)
	Defence(	15740	)
	Defence(	15741	)
	Defence(	15855	)
	Defence(	15856	)
	Defence(	15857	)
	Defence(	15958	)
	Defence(	15959	)
	Defence(	15960	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15987	)
	Defence(	15988	)
	Defence(	15989	)
	Defence(	15983	)
	Defence(	15984	)
	Defence(	15985	)
	Defence(	15779	)
	Defence(	15780	)
	Defence(	15781	)
	Other(	15037	)
	Other(	15038	)
	Other(	15056	)
	Other(	15069	)
	Other(	15130	)
	Other(	15131	)
	Other(	15134	)
	Other(	15138	)
	Other(	15178	)
	Other(	15182	)
	Other(	15186	)
	Other(	15190	)
	Other(	15194	)
	Other(	15201	)
	Other(	15252	)
	Other(	15256	)
	Other(	15260	)
	Other(	15299	)
	Other(	15327	)
	Other(	15352	)
	Other(	15368	)
	Other(	15384	)
	Other(	15400	)
	Other(	15413	)
	Other(	15428	)
	Other(	15468	)
	Other(	15475	)
	Other(	15479	)
	Other(	15483	)
	Other(	15487	)
	Other(	15497	)
	Other(	15510	)
	Other(	15533	)
	Other(	15549	)
	Other(	15565	)
	Other(	15589	)
	Other(	15605	)
	Other(	15673	)
	Other(	15689	)
	Other(	15738	)
	Other(	15854	)
	Other(	15957	)
	Other(	15965	)
	Other(	15982	)
	Other(	15986	)
	Other(	15766	)
	Other(	15778	)
	Other(	15843	)
end 

-- Аппарели оружия
function app_weapon () 

	Talk( 1, "Приветствую тебя, странник! Хочешь посмотреть украшения на оружия? " )
	Text( 1, "Посмотреть ассортимент! ", BuyPage)

	InitTrade()
	Weapon(	15001	)
	Weapon(	15002	)
	Weapon(	15003	)
	Weapon(	15004	)
	Weapon(	15005	)
	Weapon(	15006	)
	Weapon(	15007	)
	Weapon(	15008	)
	Weapon(	15009	)
	Weapon(	15010	)
	Weapon(	15011	)
	Weapon(	15012	)
	Weapon(	15053	)
	Weapon(	15054	)
	Weapon(	15055	)
	Weapon(	15070	)
	Weapon(	15071	)
	Weapon(	15072	)
	Weapon(	15073	)
	Weapon(	15099	)
	Weapon(	15100	)
	Weapon(	15103	)
	Weapon(	15104	)
	Weapon(	15105	)
	Weapon(	15208	)
	Weapon(	15209	)
	Weapon(	15210	)
	Weapon(	15211	)
	Weapon(	15212	)
	Weapon(	15213	)
	Weapon(	15214	)
	Weapon(	15215	)
	Weapon(	15216	)
	Weapon(	15217	)
	Weapon(	15276	)
	Weapon(	15277	)
	Weapon(	15278    )
	Weapon( 15279    )
    Defence( 15280  )
	Defence( 15281  )
	Defence( 15282  )
	Defence( 15283  )
	Defence( 15284  )
	Defence( 15285  )
	Defence( 15286  )
	Defence( 15448  )
	Defence( 15449  )
	Defence( 15450  )
	Defence( 15451  )
	Defence( 15452  )
	Defence( 15453  )
	Defence( 15454  )
	Defence( 15455  )
	Defence( 15609  )
	Defence( 15610  )
	Defence( 15611  )
	Defence( 15612  )
	Defence( 15613  )
	Defence( 15614  )
	Defence( 15615  )
	Defence( 15616  )
	Defence( 15617  )
	Defence( 15618  )
	Defence( 15619  )
	Defence( 15620  )
	Defence( 15621  )
	Defence( 15622  )
	Defence( 15625  )
	Defence( 15626  )
	Defence( 15627  )
	Defence( 15628  )
	Defence( 15629  )
	Defence( 15630  )
	Defence( 15631  )
	Defence( 15632  )
	Defence( 15633  )
	Defence( 15634  )
	Defence( 15635  )
	Defence( 15636  )
	Defence( 15637  )
	Other( 15638  )
	Other( 15639  )
	Other( 15640  )
	Other( 15641  )
	Other( 15642  )
	Other( 15643  )
	Other( 15696  )
	Other( 15697  )
	Other( 15990  )
	Other( 15991  )
end

-- Пиратские Гильдии
function Pirat_guilds ()
	Talk( 1, "Приветствую тебя, пират! Решился узнать о Пиратских Гильдиях? Выбирай, что тебя интересует: ")
	InitTrigger()
	TriggerCondition( 1, IsGuildType, 1 )
	TriggerAction( 1, ListAllGuild, 1 )
	TriggerCondition( 2, IsGuildType, 0 )
	TriggerAction( 2, JumpPage, 3 )
	TriggerCondition( 3, NoGuild )
	TriggerAction( 3, ListAllGuild, 1 )
	TriggerFailure( 3, JumpPage, 4 )
	Text( 1, "Посмотреть пиратские гильдии! ", MultiTrigger, GetMultiTrigger(), 3)
	Text( 1, "Создать пиратскую гильдию ",JumpPage, 2 )
	
	Talk( 2, "Чтобы создать Пиратскую Гильдию, вам нужно:_1. Камень клятвы - 1шт;_2. Золото - 100 миллионов. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, CreateGuild, 1 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2, "Создать Пиратскую Гильдию! ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3, "Я не люблю Пиратов Флота! Попрошу вас уйти! ")
	
	Talk( 4, "Не пытайтесь меня обмануть! Чтобы создать Пиратскую Гильдию, вам нужно:_1. Камень клятвы - 1шт;_2. Золото - 100 миллионов. " )
end

--Флотские Гильдии
function Flot_Guilds ()
	Talk( 1, "Приветствую тебя, пират! Решился узнать о Флотских Гильдиях? Выбирай, что тебя интересует: ")
	
	InitTrigger()
	TriggerCondition( 1, IsGuildType, 0 )
	TriggerAction( 1, ListAllGuild, 0 )
	TriggerCondition( 2, IsGuildType, 1 )
	TriggerAction( 2, JumpPage, 3 )
	TriggerCondition( 3, NoGuild )
	TriggerAction( 3, ListAllGuild, 0 )
	TriggerFailure( 3, JumpPage, 3 )
	Text( 1, "Посмотреть Флотские Гильдии! ", MultiTrigger, GetMultiTrigger(), 3)
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerCondition( 1, NoGuild )
	TriggerAction( 1, CreateGuild, 0 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Создать Флотскую Гильдию! ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 2,  "Не пытайтесь меня обмануть! Чтобы создать Флотскую Гильдию, вам нужно:_1. Камень клятвы - 1шт;_2. Золото - 100 миллионов." )

	Talk( 3, "Вы не принадлежите к флоту. Я не буду давать вам никакую информацию! ")
end
function r_NewbieCouch ()
	Talk( 1,  "Приветствую тебя, пират! Добро пожаловать на наш сервер, для твоих сражений и посещений подземелий понадобиться медаль отваги " )
	Text( 1,  "Получить Медаль отваги ", JumpPage, 2)

	Talk( 2,  "Помошница: Чтобы получить Медаль отваги вы должны быть 25 уровня и заплатить 50000 золота. Медаль отваги записывает все ваши победы и поражения в бою. После получения ее нельзя будет уничтожить. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Получить Медаль отваги ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	AddNpcMission ( 711 )
	AddNpcMission ( 200 )
	AddNpcMission ( 920 ) --красные каблуки
	AddNpcMission ( 921 )--крас
end 

-- Администратор Хаоса
function r_chaoss()
	Talk( 1,  "Администратор Хаоса: В бою выживают лишь сильнейшие, и лишь сильнейшие получают уважение. " )
	Text( 1,  "Посмотреть ТОП Хаоса ", Garner2GetWiner)
	Text( 1,  "Войти в ТОП Хаоса ", Garner2RequestReorder)
	
	AddNpcMission (2027 )
	
end




------------------------------------------------------------
-- НЁУГѕєјјіЎЅЕ±ѕ
------------------------------------------------------------

function r_talk87 ()

	Talk( 1,  "Администратор Арены: Привет! Я Администратор Арены! Вы желаете попробовать свои силы и бросить вызов другим игрокам? " )	
	Text( 1,  "Получить Медаль отваги ", JumpPage, 2)
	--Text( 1,  "Обмен чести ", JumpPage, 3)
	Text( 1,  "Обменять очки взноса отряда ", JumpPage, 3)
	Text( 1,  "Записать точку возвращения ", SetSpawnPos,  "Arenaa")

	Talk( 2,  "Администратор Арены: Чтобы получить Медаль отваги вы должны быть 25 уровня и заплатить 50000 золота. Медаль отваги записывает все ваши победы и поражения в бою. После получения ее нельзя будет уничтожить. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "Получить Медаль отваги ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Администратор Арены: При отрицательном количестве чести вы можете обменять свои очки взноса отряда на очки чести. Стоимость 1 очка чести равна 10 очкам взноса отряда и 500 золота. " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 10 )
	TriggerCondition( 1, HasMoney, 500 )
	TriggerAction( 1, TakeMoney, 500 )
	TriggerAction( 1, TakeOffer, 10 )
	TriggerAction( 1, AddCredit, 1 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 3,  "Обменять 10 очков взноса отряда ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 50 )
	TriggerCondition( 1, HasMoney, 2500 )
	TriggerAction( 1, TakeMoney, 2500 )
	TriggerAction( 1, TakeOffer, 50 )
	TriggerAction( 1, AddCredit, 5 )
	TriggerFailure( 1, JumpPage, 11 )
	Text( 3,  "Обменять 50 очков взноса отряда ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 100 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, TakeMoney, 5000 )
	TriggerAction( 1, TakeOffer, 100 )
	TriggerAction( 1, AddCredit, 10 )
	TriggerFailure( 1, JumpPage, 12 )
	Text( 3,  "Обменять 100 очков взноса отряда ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 300 )
	TriggerCondition( 1, HasMoney, 15000 )
	TriggerAction( 1, TakeMoney, 15000 )
	TriggerAction( 1, TakeOffer, 300 )
	TriggerAction( 1, AddCredit, 30 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 3,  "Обменять 300 очков взноса отряда ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 4,  "Администратор Арены: Простите но вы не подходите по требованию. Также возможно у вас уже есть Медаль отваги. " )

	Talk( 5,  "Администратор Арены: Для обмена очков взноса отряда вы должны иметь отрицательную честь, кроме того заплатить 10 очков взноса отряда и 500 золота за каждое очко чести. " )

	Talk( 6,  "Администратор Арены: Regarding Honor system as followed " )
	Text( 6,  "Regarding Battle Count ", JumpPage, 7)
	Text( 6,  "Regarding Challenge Honor ", JumpPage, 8)
	Text( 6,  "Regarding Victory Honor ", JumpPage, 9)
	Text( 6,  "Regarding Escape Penalty ", JumpPage, 10)

	Talk( 7,  "Администратор Арены: Each battle will increase battle count by 1 " )

	Talk( 8,  "Администратор Арены: Each kill will increase Kill count by 1 and 1 Honor point (Opponent lower by 10 levels will not have any Honor. Those higher by 10 levels will earn a bonus 1 Honor). Vice versa for those defeated in challenge. " )

	Talk( 9,  "Администратор Арены: Each victory to the party will increase victory count by 1 and gain Honor points according to the differences between the average level of the two parties. " )

	Talk( 10,  "Администратор Арены: Each time a party escape or quit battle, System will deduct Honor points according to the average level of both party and an additional of 2 Honor points per person. The other party will gain Honor points based on those lost by the party. " )

	Talk( 11,  "Администратор Арены: Hi! To exchange 50 Party Contribution points for 5 Honor points, you will need to have 50 Party Contribution points, 2500G and a negative Honor value. " )

	Talk( 12,  "Администратор Арены: Hi, 100 Party Contribution points can be exchanged for 10 Honor points. You also need to pay 5000G and have a negative Honor point value in order to exchange. " )

	Talk( 13,  "Администратор Арены: Hi, exchanging 300 Party Contribution points for 30 Honor points requires 300 Party Contribution points, 15000G and negative Honor points " )

end



------------------------------------------------------------
-- °ЧТшіЗЎЄЎЄСІВЯ±шЎ¤Вн¶ыЛ№
------------------------------------------------------------

function r_talk88 ()

	Talk( 1,  "Маркуза: Привет, я здесь новичок. Вокруг Аргента собирается много кальмаров, а капитан отправляет меня их убирать. От их чернил у меня постоянно слезятся глаза. Тут всегда так издеваются над новичком? " )

	Talk( 2,  "Marcusa: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). Explorer look for Little Daniel at (2193, 2730). You can reach Icicle or Shaitan by using the teleporter. " )


	---------------------НжјТі¬№э9ј¶
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 730 )
	--AddNpcMission ( 736 )
	--AddNpcMission ( 737 )
	AddNpcMission ( 400 )
	AddNpcMission ( 52 )
	AddNpcMission ( 53 )
	AddNpcMission ( 54 )

	MisListPage(2)

end

------------------------------------------------------------
-- Йіб°іЗЎЄЎЄСІВЯ±шЎ¤ВхїЛ
------------------------------------------------------------

function r_talk89 ()

	Talk( 1,  "Майкл: Привет, я патрулирую местность в округе. Будьте осторожны, скорпионы довольно опасны! " )
	
	Talk( 2,  "Michael: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Icicle or Argent by using the teleporter. " )

	---------------------НжјТі¬№э9ј¶
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 731 )
	--AddNpcMission ( 740 )
	--AddNpcMission ( 741 )
	AddNpcMission ( 235 )
	AddNpcMission ( 236 )
	AddNpcMission ( 241 )
	AddNpcMission ( 242 )
	AddNpcMission 	(412)
	AddNpcMission 	(85)
	AddNpcMission 	(86)
	AddNpcMission 	(87)
	AddNpcMission 	(922)--------------------------------------------
	AddNpcMission 	(923)
	AddNpcMission 	(924)------------


	MisListPage(2)

end

------------------------------------------------------------
-- ±щАЗ±¤ЎЄЎЄСІВЯ±шЎ¤РЎДЄ
------------------------------------------------------------

function r_talk90 ()

	Talk( 1,  "Малыш Мо: Я патрулирую местность и мне ужасно хочется есть. У вас нет с собой при себе ничего чтобы поесть? Здесь в округе совсем нет еды... " )

	Talk( 2,  "Little Mo: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Icicle or Shaitan by using the teleporter. " )

	---------------------НжјТі¬№э9ј¶
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 732 )
	--AddNpcMission ( 742 )
	--AddNpcMission ( 743 )
	AddNpcMission ( 255 )
	AddNpcMission ( 256 )
	AddNpcMission 	(408)
	AddNpcMission 	(164)
	AddNpcMission 	(165)
	AddNpcMission 	(166)
	AddNpcMission 	(177)
	AddNpcMission 	(178)
	AddNpcMission 	(179)


	MisListPage(2)

end

------------------------------------------------------------
-- Йіб°іЗЎЄЎЄТ©ІДЙМИЛЎ¤ЙіА­А­
------------------------------------------------------------

function r_talk91 ()

	Talk( 1,  "Шала: Привет! Я целитель Шайтана! Я могу тебе чем то помочь? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )
	
	Talk( 2,  "Shala: Very good. You have advanced to Lv9. You can select a class at Lv 10. Now is the time for you to make a decision. Look for Peter in Argent City at (2192, 2767) if you want to become a Swordsman. Look for High Priest - Gannon in Shaitan City at (862, 3500) to be a Herbalist. To be a Hunter, look for Swordsman Ray in Icicle City at (1365, 570). As the journey to Argent and Icicle is too far, look for the Teleporter to teleport you there in an instant. " )
	Text( 2,  "Торг ", BuyPage )
	Text( 2,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)
	--Leo
	Other(	1576	)
	Other(	4049	)
	Other(	4050	)
	Other(	1578	)
	Other(	4060	)
	Other(	4055	)
	Other(	4061	)
	Other(	2225	)
	Other(	4057	)
	Other(	1768	)


	---------------------НжјТі¬№э9ј¶
	--InitTrigger()
	--TriggerCondition( 1, LvCheck,  "> ", 8 )
	--TriggerCondition( 1, LvCheck,  "< ", 10 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerFailure( 1, JumpPage, 1 )
	--Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 717 )
	--AddNpcMission ( 734 )
	--AddNpcMission ( 744 )
	--AddNpcMission ( 745 )

	MisListPage(2)

end 

------------------------------------------------------------
--їЁ¶ыјУµВС©Ф­    ВГРРТЅЙъЎ¤НЯВЮОВДЭ
------------------------------------------------------------

function r_talk92 ()

	Talk( 1,  "Чиво: Привет! Я местный доктор! Вам нужны какие нибудь травы? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission(	471	)
	AddNpcMission(	472	)
	AddNpcMission	(753)
	
end

------------------------------------------------------------
-- Аµ°ІЙ­БЦЎЄЎЄВГРРТЅЙъЎ¤ГЧДОПЈ¶ы
------------------------------------------------------------

function r_talk93 ()

	Talk( 1,  "Миносиво: Привет! Я местный доктор! Что вас интересует? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission(	1442	)
	AddNpcMission (	1900	)

	---------------°ЧСт
	AddNpcMission	(5567)
	AddNpcMission	(5568)
--	AddNpcMission ( 6052 )
--	AddNpcMission ( 6053 )
	


	
end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----ёЈїЛ
------------------------------------------------------------

function r_talk94 ()

	Talk( 1,  "Фукей: Возможно вы скажете что я высокомерен, но я хочу быть высокомерным моряком. Я уже говорил это? " )

end

------------------------------------------------------------
-- ±щј«І№ёшХѕ-----·ЁµП¶ы
------------------------------------------------------------

function r_talk95 ()

	Talk( 1,  "Фардей: Мой немой друг хочет привезти зимние шубы, чтобы продавать их в горячем Шайтане. Как мне его удержать? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
		
	AddNpcMission	(1065)
	AddNpcMission	(	869	)
	AddNpcMission	(	872	)
	AddNpcMission	(	874	)
	AddNpcMission	(	878	)
	AddNpcMission	(	886	)
	AddNpcMission	(	889	)
	AddNpcMission	(	470	)
	AddNpcMission(	1738	)
	AddNpcMission (	1927	)
	AddNpcMission (	1948	)

	------------------¶юФВ
	--AddNpcMission (5504	)



end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----ПЇМШ
------------------------------------------------------------

function r_talk96 ()

	Talk( 1,  "Кситрон: Все в округе говорят что я волк в овечьей шкуре. Хехе " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----СПВЮЛю
------------------------------------------------------------


------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----ІјІј
------------------------------------------------------------

function r_talk98 ()

	Talk( 1,  "Бубу: Мой отец пират! А я хочу присоединится к флоту и быть шпионом. " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----ВіВі
------------------------------------------------------------

function r_talk99 ()

	Talk( 1,  "Лулу: Хаха. Не видишь никакого зла? " )

	AddNpcMission(	1736	)
	AddNpcMission (	1925	)
	AddNpcMission (	1946	)

	---------------°ЧСт
	AddNpcMission	(5561)
	AddNpcMission	(5562)
--	AddNpcMission ( 6040 )
--	AddNpcMission ( 6041 )



end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----°ВµПЛ№.ЙБ№в
------------------------------------------------------------

function r_talk100()

	Talk( 1,  "Одессис: Я так стар... Но тем не менее хочу отправится на остров Демонов и увидеть вулканическое извержение. " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----Г·¶ы
------------------------------------------------------------

function r_talk101()

	Talk( 1,  "Меллиса: Если хотите прекратить сплетню, то создайте новую. " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----№ЕІ©А­
------------------------------------------------------------

function r_talk102()

	Talk( 1,  "Гадор: Я написал ндавно книгу-бестселлер. Теперь я слышал что она популярна у пиратов. " )

	AddNpcMission 	(603)
	AddNpcMission 	(608)
	AddNpcMission 	(613)
	AddNpcMission 	(615)
	AddNpcMission 	(618)


end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----РЎїв¶ыЙ­
------------------------------------------------------------

function r_talk103()

	Talk( 1,  "Маленький Квин: мама запрещает мне разговаривать с незнакомцами. Вы угостите меня конфетой? " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----Вкј§ЙфЙф
------------------------------------------------------------

function r_talk104()

	Talk( 1,  "Тетушка Мэри: Я люблю поесть Шварцальский пирог с толстым слоем конфет наверху. Эта вкуснятина заставляет меня пускать слюни. " )

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----НЯИш·Ё¶ы
------------------------------------------------------------

function r_talk105()

	Talk( 1,  "Ваала: Рассказать секрет? Я недавно придумал новую игру в карты! Она требует 4 друзей и 108 карт. " )

	AddNpcMission 	(451)
	AddNpcMission 	(457)
	AddNpcMission 	(621)
	AddNpcMission 	(625)
	AddNpcMission(	1590	)
	AddNpcMission (	1902	)
	AddNpcMission (	1940	)

	




end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----ЦмАцІјВк
------------------------------------------------------------

function r_talk106()

	Talk( 1,  "Джули Берн: Хотите узнать почему наш кузнец лысый? Я сплетница? С вами так скучно... " )

	AddNpcMission 	(689)
	AddNpcMission	(1109)
	AddNpcMission(	1579	)
	AddNpcMission (	1918	)





end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----°ўАпїЛЛ№
------------------------------------------------------------

function r_talk107()

	Talk( 1,  "Александрис: Жизнь жестока! Так почему бы не поиграть в нее онлайн? " )
	AddNpcMission 	(425)
	AddNpcMission 	(431)
	AddNpcMission 	(436)
	AddNpcMission 	(442)
	AddNpcMission 	(448)
	AddNpcMission 	(601)
	AddNpcMission 	(607)
	AddNpcMission 	(610)
	AddNpcMission 	(612)
	AddNpcMission	(1001)
	AddNpcMission	(1165)



end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----АПїв¶ыЙ­
------------------------------------------------------------

function r_talk108()

	Talk( 1,  "Старик Квин: В этот жаркий день я мечтаю пойти на необитаемый остров и веселится в одиночестве. " )

	AddNpcMission	(475)

end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----єЈѕьБР±ш
------------------------------------------------------------

function r_talk109()

	Talk( 1,  "Тсссс, потише! Наш адмирал говорит." )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----јЄ¶ыДбДбЛ№
------------------------------------------------------------

function r_talk110()

	Talk( 1,  "Джернис: Моя семья лесорубы, однако недавно их забрал какой то страж природы. Так неприятно. " )

	AddNpcMission 	(411)
	AddNpcMission 	(669)
	AddNpcMission 	(675)
	AddNpcMission 	(678)
	AddNpcMission 	(680)
	AddNpcMission	(1075)



end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----ГЧ¶ыГЧАт
------------------------------------------------------------

function r_talk111()

	Talk( 1,  "Миннели: Привет! Мои друзья называют меня Элли. Я не буду возражать если вы тоже будете меня так называть. " )


end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----°ВёсЙ­
------------------------------------------------------------

function r_talk112()

	Talk( 1,  "Августин: Есть много мифов и легенд ждущих большого авантюриста. " )

	AddNpcMission	(1111)


end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----јУОчСЗЎ¤ЖЖ·«
------------------------------------------------------------

function r_talk113()

	Talk( 1,  "Джейна: Привет! Я Джейна!. " )
	AddNpcMission	(1131)

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----µПµПВнРЮ
------------------------------------------------------------

function r_talk114()

	Talk( 1,  "Дитаро: Путешевственники! Давайте отправимся в открытый океан! " )

	AddNpcMission 	(640)
	AddNpcMission 	(644)
	AddNpcMission 	(645)
	AddNpcMission 	(646)
	AddNpcMission 	(651)
	AddNpcMission	(1119)
	AddNpcMission(	1437	)
	AddNpcMission (	1911	)
--	AddNpcMission ( 6038 )
--	AddNpcMission ( 6039 )

	





end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----¶нїЛБрОчЛ№
------------------------------------------------------------

function r_talk115()

	Talk( 1,  "Рубен Актус: Я нуждаюсь в большом количестве золота. Но так как у меня его нет, то я нуждаюсь в друге, у которого есть большое количество золота. " )
	AddNpcMission	(1120)


end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----Г·АыОчСЗЎ¤ГЁСЫ
------------------------------------------------------------

function r_talk116()

	Talk( 1,  "Викси: Почему вы так удивлены? Вы никогда не видели кошку-пирата?               Ах да,и ещё,только герои с репутацией   1000 и выше достойны моего внимания! " )
	
	AddNpcMission	(2023)

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----№ЕµГЛюїЛЎ¤»ТЗЅ
------------------------------------------------------------

function r_talk117()

	Talk( 1,  "Гудас: Кто сказал что я страдаю морской болезнью? Я не страдаю морской болезни, просто я еще не привык к новому судну. " )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----їьИьЛ№Ў¤їсЙі
------------------------------------------------------------

function r_talk118()

	Talk( 1,  "Гасардис: Я не плачу чтобы быть добрым. " )
	
	AddNpcMission ( 257 )
	AddNpcMission ( 258 )
	AddNpcMission ( 259 )
	AddNpcMission 	(435)
	AddNpcMission 	(686)
	AddNpcMission 	(691)
	AddNpcMission 	(693)
	AddNpcMission 	(694)
	AddNpcMission	(1082)



end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----НЁБйХЯЎ¤ФВ№вСЫ
------------------------------------------------------------

function r_talk119()

	Talk( 1,  "Оракул Лунного света: Я могу видеть то, что другие не видят. " )

	AddNpcMission 	(804)
	AddNpcMission 	(808)
	
	AddNpcMission	(	468	)
	AddNpcMission(	1586	)
	AddNpcMission (	1920	)

	
---------------°ЧСт
	AddNpcMission	(5585)
	AddNpcMission	(5586)



end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----їЁ¶ыЛХЛ№Ў¤Да°Н
------------------------------------------------------------

function r_talk120()

	Talk( 1,  "Каворский: Я не завидую бывшему секретарю Аргента или чиновникам Громограда. Мне нравится быть собой. " )

	AddNpcMission 	(407)
	AddNpcMission 	(638)
	AddNpcMission 	(642)
	AddNpcMission(	1438	)
	AddNpcMission (	1912	)

	



end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----ДбАп°¬СЗЎ¤і¤·ў
------------------------------------------------------------

function r_talk121()

	Talk( 1,  "Нейла: А, это вы? как жаль... Я сказал это вслух? " )

	
	AddNpcMission	(	870	)
	AddNpcMission	(	875	)
	AddNpcMission	(	876	)
	AddNpcMission	(	880	)
	AddNpcMission	(	882	)
	AddNpcMission	(	885	)
	AddNpcMission	(	888	)
	AddNpcMission	(	891	)
	AddNpcMission	(	892	)
	AddNpcMission(	1735	)
	AddNpcMission (	1924	)
	AddNpcMission (	1945	)

	


end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----їЛАтАтСЕ
------------------------------------------------------------

function r_talk122()

	Talk( 1,  "Гелия: Аргент известен как законодатель моды. Только пираты не следуют моде. " )

	AddNpcMission 	(428)
	AddNpcMission 	(812)
	AddNpcMission	(1025)
	AddNpcMission	(1188)


end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----±ґїЛ
------------------------------------------------------------

function r_talk123()

	Talk( 1,  "Бек: У меня есть брат по имени Хэм. Однако я более симпатичен. " )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----єєД·
------------------------------------------------------------

function r_talk124()

	Talk( 1,  "Хэм: У меня есть брат по имени Бек. Однако я более симпатичен. " )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----°®¶ыУИАыЎ¤Оў·з
------------------------------------------------------------

function r_talk125()

	Talk( 1,  "Влюбленный Юрий: Любовь так рядом, но все же пока... " )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----Ю±Ат¶ы
------------------------------------------------------------

function r_talk126()

	Talk( 1,  "Вилли: Во первых никогда не говорите что я жирный, во вторых никогда не говорите что я пухлый, в третьих никогда не говорите что я похож на свинью. Теперь можете говорить вы. " )

	AddNpcMission 	(685)
	AddNpcMission 	(688)
	AddNpcMission 	(690)
	AddNpcMission	(1097)
--	AddNpcMission ( 6034 )
--	AddNpcMission ( 6035 )


end
------------------------------------------------------------
-- ЕБїЛ»ДД®-----¶¬ґпГЧЖЕЖЕ
------------------------------------------------------------
function r_talk127()
Talk( 1,  "Бабушка Донг. Молодой человек, путешевствуйте пока вы молоды! " )
	
	InitTrigger()
	TriggerCondition( 1, HasRecord, 1557 )
	TriggerCondition( 1, NoRecord, 1558 )
	TriggerCondition( 1, NoRecord, 1559 )
	TriggerCondition( 1, NoRecord, 1560 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "Привет!! ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerCondition( 1, HasMission, 1561 )
	TriggerCondition( 1, HasRecord, 1558 )
	TriggerCondition( 1, HasRecord, 1559 )
	TriggerCondition( 1, NoRecord, 1569 )
	TriggerCondition( 1, NoRecord, 1561 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "Привет снова! ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 1,  "Я только проходил мимо ",JumpPage, 3  )
	
	InitTrigger()
	TriggerAction( 1, SetRecord, 1558 )
	TriggerAction( 1, SetRecord, 1559 )
	TriggerAction( 1, JumpPage, 4 )
	Talk( 2,  "Бабушка Донг: Что появилось раньше - яйцо или курица? ")
	Text(2,  "Курица ", MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerAction( 1, SetRecord, 1558 )
	TriggerAction( 1, SetRecord, 1560 )
	TriggerAction( 1, JumpPage, 5 )
	Text(2,  "Яйцо ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 3,  "Бабушка Донг: Молодой человек, я очень занята. Если нет ничего важного, то пожалуйста отойдите! ")
	Talk( 10,  "Бабушка Донг: Молодой человек, вы ответили неправильно! Подумайте снова прежде чем подходить. ")

	Talk( 4,  "Бабушка Донг: Поздравляю! Не плохо! ")

	Talk( 5,  "Бабушка Донг: Может ли быть старчески маразм заразным? ")
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1563 )
	TriggerAction( 1, JumpPage, 7 )
	Talk( 6,  "Бабушка Донг: Кролик и черепаха учавствуют в гонке. Кто победит? ")
	Text( 6,  "Черепаха ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 6,  "Кролик ",JumpPage, 10  )

	Talk( 7,  "Бабушка Донг: Конечно черепаха победит. Ведь черепаха, которая работает движется быстрее ветра. ")
	Text( 7,  "Следующий вопрос ",JumpPage, 8  )
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1564 )
	TriggerAction( 1, JumpPage, 9 )
	Talk( 8,  "Бабушка Донг: В гонке учавствуют кролик и черепаха в солнечных очках. КТо победит? ")
	Text( 8,  "Черепаха в солнечных очках ",MultiTrigger, GetMultiTrigger(), 1 )
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1565 )
	TriggerAction( 1, JumpPage, 9 )
	Text( 8,  "Кролик ",MultiTrigger, GetMultiTrigger(), 1  )

	Talk( 9,  "Бабушка Донг: Кролик не победит, потому что черепаха в солнечных очках раллийный гонщик! ")
	--Start( GetMultiTrigger(), 1 )
	AddNpcMission 	(417)
	AddNpcMission 	(674)
	AddNpcMission 	(676)
	AddNpcMission 	(681)
	AddNpcMission	(1064)
	AddNpcMission	(752)

	
	------------------1.7
	AddNpcMission (5153 )
	AddNpcMission (5154 )
	AddNpcMission (5155 )
	AddNpcMission (5156 )
	AddNpcMission (5157 )
	AddNpcMission (5159 )
	end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----ВЮ±цЛ№Ў¤±і°ь
------------------------------------------------------------

function r_talk128()

	Talk( 1,  "Робин: Когда я был маленький мой отец ложил меня в мой рюкзак и бродил по миру. Я хотел бы сделать также. " )

end

------------------------------------------------------------
-- ЕБїЛ»ДД®-----ИрµГЎ¤Ж¤ёк
------------------------------------------------------------

function r_talk129()

	Talk( 1,  "Дон Пит: Ах... Кто вы? Вы ищете меня? " )

	AddNpcMission 	(623)
	AddNpcMission 	(627)
	AddNpcMission 	(634)
	AddNpcMission	(1031)
	AddNpcMission	(1194)
	AddNpcMission(	1591	)
	AddNpcMission (	1905	)
	AddNpcMission (	1941	)

	---------------°ЧСт
	AddNpcMission	(5583)
	AddNpcMission	(5584)



end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ОВАтЎ¤±щИЄ
------------------------------------------------------------

function r_talk130()

	Talk( 1,  "Вин: Мой дом находится в Ледыни. Вы его видели? " )
---------------°ЧСт
	AddNpcMission	(5581)
	AddNpcMission	(5582)
end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----АЧЛ№Ў¤РЎіж
------------------------------------------------------------

function r_talk131()

	Talk( 1,  "Лесси: Все люди меня называют маленьким червячкосм. Но я не буду оставаться маленьким навсегда. " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ґпГЧ¶ыЎ¤аЅаЅ
------------------------------------------------------------

function r_talk132()

	Talk( 1,  "Додо: Додо додо додо " )
	AddNpcMission	(1061)
	AddNpcMission	(1007)
	AddNpcMission	(1062)
	AddNpcMission	(1117)
	AddNpcMission	(1171)


end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ЛчА­Д·Ў¤ИшјУ
------------------------------------------------------------

function r_talk133()

	Talk( 1,  "Солару: Вы слышали о таинственном сундуке сокровищ? Я ищу его уже много лет. " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----АЗСАА­Д·
------------------------------------------------------------

function r_talk134()

	Talk( 1,  "Ламут: За 3 дня ходьбы я не вижу города. Я потерялся? " )
	AddNpcMission	(1083)

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----АЗСАА­Д·
------------------------------------------------------------

function r_talk135()

	Talk( 1,  "Ирисис: Если вы не принесли мне письмо для Легендарного принца, то лучше не говорите со мной. " )
	AddNpcMission	(1098)

end


------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----°¬ВЧДИ
------------------------------------------------------------

function r_talk136()

	Talk( 1,  "Элуна: Я готовлюсь сегодня идти на распродажу. Если я опоздаю, то ничего не останется. " )

	AddNpcMission ( 262 )
	AddNpcMission ( 263 )
	AddNpcMission ( 264 )
	AddNpcMission ( 265 )
	AddNpcMission	(1056)


end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----єХ¶ыґпґп
------------------------------------------------------------

function r_talk137()

	Talk( 1,  "шереда: Скучно... Здесь очень скучно... " )
	AddNpcMission	(1072)

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ФјЙЄ·тЎ¤ЗЗ
------------------------------------------------------------

function r_talk138()

	Talk( 1,  "Чао: Я ненавижу кальмаров. Они всегда брызгаются своими чернилами. " )
	AddNpcMission	(1105)

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ІЭЭ®УЕУЕ
------------------------------------------------------------

function r_talk139()

	Talk( 1,  "Земляничка: Вы видели тех розовых поросят? Они самые вкусные в округе. " )
---------------°ЧСт
	AddNpcMission	(5555)
	AddNpcMission	(5556)
end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ТБОД
------------------------------------------------------------

function r_talk140()

	Talk( 1,  "Эве: Привет, я Эве. Что вы здесь делаете? " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ЛХЙєДИ
------------------------------------------------------------

function r_talk141()

	Talk( 1,  "Сюзанна: О мой Бог. Время пролетает так быстро. " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----їЁЕµБЦ
------------------------------------------------------------

function r_talk142()

	Talk( 1,  "Кэролин: Я вегетарианец и меня кое что беспокоит. Катящаяся дыня это животное или растение? " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ХІД·Л№
------------------------------------------------------------

function r_talk143()

	Talk( 1,  "Джеймсон: Я слышал что в мире есть говорящий ягненок. " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----В¶ОчАцАцСЕ
------------------------------------------------------------

function r_talk144()

	Talk( 1,  "Люси: Привет посетитель! " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----УИАјґпїЛ
------------------------------------------------------------

function r_talk145()

	Talk( 1,  "Юландор: Я всегда зарабатываю убивая монстров. Однако с недавних пор заметил что у них стал маленький кошелек. " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----І©¶ы·ТДб
------------------------------------------------------------

function r_talk146()

	Talk( 1,  "Профессор Фенни: Однажды я встретил русалку в море. Правда забыл спрсить где она взяла такие очаровательные реснички. " )

	AddNpcMission 	(622)
	AddNpcMission 	(624)
	AddNpcMission 	(628)
	AddNpcMission 	(630)
	AddNpcMission 	(636)
	AddNpcMission	(1006)
	AddNpcMission	(1170)
	AddNpcMission(	1592	)
	AddNpcMission (	1906	)
	AddNpcMission (	1942	)
--	AddNpcMission ( 6036 )
--	AddNpcMission ( 6037 )

	



end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----МФМФ
------------------------------------------------------------

function r_talk147()

	Talk( 1,  "Бэрри: Это нбо такое синее! Синий океан, синий цвет... И настроение у меня синее синее. " )

	AddNpcMission ( 401 )
	AddNpcMission 	(810)
	AddNpcMission	(1040)
	AddNpcMission	(1203)
	AddNpcMission(	1433	)
	AddNpcMission (	1909	)

	
---------------°ЧСт
	AddNpcMission	(5579)
	AddNpcMission	(5580)





end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----їЖИрЖд
------------------------------------------------------------

function r_talk148()

	Talk( 1,  "Кетан: Привет, я думаю почему тут нет луны. А вы? " )

end

------------------------------------------------------------
-- °ўАј±ИЛ№±щФ­-----ГЧРЄ¶ыГ·БЦ·Т
------------------------------------------------------------

function r_talk149()

	Talk( 1,  "Миссис Элли: Мне нечего вам сказать... " )

end

------------------------------------------------------------
-- ±щАЗ±¤-----Л®КЦЎ¤°ЈµПјУ
------------------------------------------------------------

function r_talk156()

	Talk( 1,  "Аякс: Привет! Я лучший моряк в округе! Нуждаетесь в моей помощи? " )

end

------------------------------------------------------------
-- №ЕАпї©АыІ№ёшХѕ-----БсБ«
------------------------------------------------------------

function r_talk157()

	Talk( 1,  "Дуриан: Я всегда хочу есть и ем я много. Мне кажется это болезнь. " )

	AddNpcMission 	(419)
	AddNpcMission 	(460)
	AddNpcMission 	(600)
	AddNpcMission 	(604)
	AddNpcMission 	(606)
	AddNpcMission 	(611)
	AddNpcMission 	(614)
	AddNpcMission 	(619)
	AddNpcMission	(1028)
	AddNpcMission	(1191)
	AddNpcMission(	1434	)
	AddNpcMission (	1903	)

	---------------°ЧСт
	AddNpcMission	(5587)
	AddNpcMission	(5588)

--	AddNpcMission ( 6042 )
--	AddNpcMission ( 6043 )


end

------------------------------------------------------------
-- №ЕАпї©АыІ№ёшХѕ-----Б«ДИТМ
------------------------------------------------------------

function r_talk158()

	Talk( 1,  "Лейна: Что вы хотите купить? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(450)
	AddNpcMission 	(452)
	AddNpcMission 	(602)
	AddNpcMission 	(605)
	AddNpcMission 	(609)
	AddNpcMission 	(616)
	AddNpcMission 	(617)
	AddNpcMission(	1435	)
	AddNpcMission (	1904	)

	



	
end

------------------------------------------------------------
-- НЯ¶ыЕµІ№ёшХѕ-----№ЕДОЛ№
------------------------------------------------------------

function r_talk159()

	Talk( 1,  "Гвидериус: Покупки и продажи, ищите меня. " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	
	AddNpcMission 	(463)
	AddNpcMission 	(620)
	AddNpcMission 	(626)
	AddNpcMission 	(629)
	AddNpcMission 	(631)
	AddNpcMission 	(632)
	AddNpcMission 	(633)
	AddNpcMission 	(635)
	AddNpcMission 	(637)
	AddNpcMission	(1015)
	AddNpcMission	(1178)
	AddNpcMission(	1593	)
	AddNpcMission (	1907	)
	AddNpcMission (	1943	)

	


end

------------------------------------------------------------
-- ·ПїуІ№ёшХѕ-----АпїЁ¶ы
------------------------------------------------------------

function r_talk160()

	Talk( 1,  "Кэль: Привет! Я стражник Кэль. Это место в безопасности! " )

	AddNpcMission ( 223 )
	AddNpcMission ( 224 )
	AddNpcMission ( 225 )
	AddNpcMission ( 226 )
	AddNpcMission ( 227 )
	AddNpcMission ( 228 )
	AddNpcMission ( 229 )
	AddNpcMission ( 230 )
	AddNpcMission	(1055)
	AddNpcMission	(1217)
	AddNpcMission(	1432	)
	AddNpcMission (	1908	)

	



	
end

------------------------------------------------------------
-- ·ПїуІ№ёшХѕ-----АпїЁ¶ы
------------------------------------------------------------

function r_talk161()

	Talk( 1,  "Друнки: Я так хочу есть... И кажется я потерял свою бутылку. " )

	AddNpcMission ( 284 )
	AddNpcMission ( 285 )
	AddNpcMission ( 311 )
	--Священный огонь
	AddNpcMission	(6272)
	AddNpcMission	(6273)
	AddNpcMission	(6274)
end

------------------------------------------------------------
-- ·ПїуІ№ёшХѕ-----№ЕБйѕ«
------------------------------------------------------------

function r_talk162()

	Talk( 1,  "Грег: Привет, я Грег. Нужна моя помощь? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(455)
	AddNpcMission 	(461)
	AddNpcMission 	(811)
	AddNpcMission 	(814)
	AddNpcMission	(1013)
	AddNpcMission	(1014)
	AddNpcMission	(1177)

	-----МъИЛБщПо
	AddNpcMission ( 6121 )
	AddNpcMission ( 6122 )

	
end

------------------------------------------------------------
-- ОВДГІ№ёшХѕ-----БХґп
------------------------------------------------------------

function r_talk163()

	Talk( 1,  "Линда: Я не хочу работать, но мой начальник вынуждает меня работать каждый день. А я хочу большей зарплаты! " )
	AddNpcMission	(1027)
	AddNpcMission	(1190)
----------------1.7
	AddNpcMission (5139 )
	AddNpcMission (5140 )
	AddNpcMission (5141 )
--	AddNpcMission ( 6044 )
--	AddNpcMission ( 6045 )

end

------------------------------------------------------------
-- ОВДГІ№ёшХѕ-----ґпґпВхСЗ
------------------------------------------------------------

function r_talk164()

	Talk( 1,  "Дада: Привет мой друг. Вы приехали в столь опасное место не привезя с собой товара? " )

end

------------------------------------------------------------
-- ОВДГІ№ёшХѕ-----№ЕБ¦№ы
------------------------------------------------------------

function r_talk165()

	Talk( 1,  "Грег: Привет! Есть ли что то, что вам нужно? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	---------------°ЧСт
	AddNpcMission	(5563)
	AddNpcMission	(5564)
end

------------------------------------------------------------
-- °НІјІ№ёшХѕ-----ДўДў
------------------------------------------------------------

function r_talk166()

	Talk( 1,  "Момо: Привет, я Момо. У меня вы можете купить неплохую пищу! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	3098	)

end

------------------------------------------------------------
-- ЙіИЄІ№ёшХѕ-----О¬ДИ
------------------------------------------------------------

function r_talk167()

	Talk( 1,  "Венома: Я скоро женюсь! Я хочу чтобы все разделили мою радость! " )

	AddNpcMission 	(418)
	AddNpcMission 	(641)
	AddNpcMission 	(650)
	AddNpcMission	(1156)

	
end


------------------------------------------------------------
-- ЙіИЄІ№ёшХѕ-----·Ж·Ж
------------------------------------------------------------

function r_talk168()

	Talk( 1,  "Фей фей: Привет, я Фей фей. " )

	AddNpcMission 	(422)
	AddNpcMission 	(639)
	AddNpcMission 	(648)
	AddNpcMission	(1121)
	AddNpcMission(	1439	)
	AddNpcMission (	1916	)

	---------------¶юФВ
	--AddNpcMission (5503	)

---------------°ЧСт
	AddNpcMission	(5569)
	AddNpcMission	(5572)

	
end

------------------------------------------------------------
-- ЙіИЄІ№ёшХѕ-----ВнВе
------------------------------------------------------------

function r_talk169()

	Talk( 1,  "Маркус: Я могу пополнить ваши запасы. В чем вы нуждаетесь? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(403)
	AddNpcMission 	(413)
	AddNpcMission 	(420)
	AddNpcMission 	(643)
	AddNpcMission 	(647)
	AddNpcMission 	(649)
	AddNpcMission 	(652)
	AddNpcMission	(1140)
	AddNpcMission(	1440	)
	AddNpcMission (	1917	)

	----------------1.7
	AddNpcMission (5124 )
	AddNpcMission (5125 )
	AddNpcMission (5126 )
end

------------------------------------------------------------
-- °ўАј±ИЛ№І№ёшХѕ-----Цм±И
------------------------------------------------------------

function r_talk170()

	Talk( 1,  "Зурби: Я всегда слышу зов моря. Я думаю там есть много интересного, что нужно исследовать. " )

	AddNpcMission 	(429)
	AddNpcMission 	(464)
	AddNpcMission 	(466)
	AddNpcMission 	(684)
	AddNpcMission 	(696)
	AddNpcMission 	(697)
	AddNpcMission	(1108)

----------------1.7
	AddNpcMission (5136 )
	AddNpcMission (5137 )
	AddNpcMission (5138 )

end

------------------------------------------------------------
-- ЙіИЄІ№ёшХѕ-----УИЛюАпДб
------------------------------------------------------------

function r_talk171()

	Talk( 1,  "Улькар: Привет! Вы хотите немного хлеба? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(423)
	AddNpcMission 	(440)
	AddNpcMission 	(446)
	AddNpcMission 	(462)
	AddNpcMission 	(683)
	AddNpcMission 	(687)
	AddNpcMission 	(692)
	AddNpcMission 	(695)
	AddNpcMission(	1580	)
	AddNpcMission (	1919	)
	AddNpcMission (	1955	)

	




end

------------------------------------------------------------
-- чјчГУЄµШІ№ёшХѕ-----РЮЛѕ
------------------------------------------------------------

function r_talk172()

	Talk( 1,  "Ксеус: Убивать-воровать презренно. " )

	AddNpcMission 	(802)
	AddNpcMission 	(807)
	AddNpcMission	(1100)
	AddNpcMission(	1587	)
	AddNpcMission (	1921	)
	AddNpcMission (	1922	)
----------------1.7
	AddNpcMission (5127 )
	AddNpcMission (5128 )
	AddNpcMission (5129 )
--	AddNpcMission ( 6046 )
--	AddNpcMission ( 6047 )

	


end

------------------------------------------------------------
-- чјчГУЄµШІ№ёшХѕ-----ОыОы№ю№ю
------------------------------------------------------------

function r_talk173()

	Talk( 1,  "Хохо: Привет! Нуждаетесь в каких нибудь припасах? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(467)
	AddNpcMission 	(803)
	AddNpcMission(	1588	)
	AddNpcMission (	1923	)
	AddNpcMission (	1944	)

	





end

------------------------------------------------------------
-- ±щј«І№ёшХѕ-----ГЧїЄАК·СВЮ
------------------------------------------------------------

function r_talk174()

	Talk( 1,  "Меккилон: Мой отец восхищался великими художниками и назвал меня в честь одного из них. " )

	
	AddNpcMission	(	871	)
	AddNpcMission	(	873	)
	AddNpcMission	(	879	)
	AddNpcMission	(	887	)
	AddNpcMission	(	890	)
	AddNpcMission	(	893	)
	AddNpcMission(	1737	)
	AddNpcMission (	1926	)
	AddNpcMission (	1947	)

	



end

------------------------------------------------------------
-- ±щ¶јІ№ёшХѕ-----ДОДО
------------------------------------------------------------

function r_talk175()

	Talk( 1,  "Нана: Я настолько глуп, что могу потеряться за пределами города. Конечно если со мной не будет гида. " )

	AddNpcMission 	(405)
	AddNpcMission 	(432)
	AddNpcMission 	(668)
	AddNpcMission 	(672)
	AddNpcMission 	(673)
	AddNpcMission 	(677)
	AddNpcMission	(1087)
	AddNpcMission(	1429	)
	AddNpcMission (	1928	)
---------------°ЧСт
	AddNpcMission	(5589)
	AddNpcMission	(5590)
--	AddNpcMission ( 6050 )
--	AddNpcMission ( 6051 )
	




end

------------------------------------------------------------
-- ±щ¶јІ№ёшХѕ-----№ЦЫЕТЇТЇ
------------------------------------------------------------

function r_talk176()

	Talk( 1,  "Таинственный Грампа: Хоть я и выгляжу странно, но я являюсь местным целителем. " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(430)
	AddNpcMission 	(434)
	AddNpcMission 	(670)
	AddNpcMission 	(671)
	AddNpcMission 	(679)
	AddNpcMission 	(682)
	AddNpcMission	(1070)
	AddNpcMission(	1430	)
	AddNpcMission (	1929	)

	---------------1.7
	AddNpcMission (5148 )
	AddNpcMission (5150 )
	AddNpcMission (5152 )
	AddNpcMission (5158 )
	AddNpcMission (5160 )
	AddNpcMission (5161 )
	AddNpcMission (5162 )
	AddNpcMission (5163 )
	AddNpcMission (5164 )
	AddNpcMission (5165 )
	AddNpcMission (5166 )
	AddNpcMission (5169 )


end


------------------------------------------------------------
-- чјчГУЄµШІ№ёшХѕ-----°ўМ©
------------------------------------------------------------

function r_talk177()

	Talk( 1,  "Тай: Я хочу организовать группу, состоящую из одних морских обитетелей. " )

	AddNpcMission 	(805)
	AddNpcMission 	(806)
	AddNpcMission(	1589	)
	AddNpcMission (	1934	)
	AddNpcMission (	1949	)

	




	
end

------------------------------------------------------------
-- µВ¶ыО¬ЖЅФ­-----±ґїЗЙМИЛЎ¤А­Д·
------------------------------------------------------------

function r_talk221()

	Talk( 1,  "Ламон: Я люблю собирать кораллы. У меня есть много уникальных. Хотите взглянуть? " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Восстановление энергии коралла ", JumpPage, 2 )
	Text( 1,  "Ничего... ",CloseTalk )


	Talk( 2,  "Ламон: Коралл можно заряжать когда он опустеет. Коралл грозы заряжает гроза, коралл ветра - ветер, коралл тумана заряжается в тумане, а коралл удара можно зарядить в Веснограде. ")


	InitTrade()
	Weapon(	0817	)
	Weapon(	0818	)
	Weapon(	0867	)
	Weapon(	0868	)
	Weapon(	0872	)
	Weapon(	0873	)
	Weapon(	0635	)
	Weapon(	0636	)



end




------------------------------------------------------------
-- °ЧТшіЗ-----·юЧ°µкЦъАнЎтЭнЭн
------------------------------------------------------------
function r_talk222()


	Talk( 1,  "Бебе: Привет! Я новый портной. Я продаю любые типы одежды! " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	0335	)
	Defence(	0511	)
	Defence(	0687	)
	Defence(	0336	)
	Defence(	0512	)
	Defence(	0688	)
	Defence(	0338	)
	Defence(	0514	)
	Defence(	0690	)
	Defence(	0337	)
	Defence(	0513	)
	Defence(	0689	)
	Defence(	0340	)
	Defence(	0516	)
	Defence(	0692	)
	Defence(	0339	)
	Defence(	0515	)
	Defence(	0691	)
	Defence(	0341	)
	Defence(	0517	)
	Defence(	0693	)
	Defence(	0342	)
	Defence(	0518	)
	Defence(	0694	)
	Defence(	0345	)
	Defence(	0521	)
	Defence(	0697	)
	Defence(	0343	)
	Defence(	0519	)
	Defence(	0695	)
	Defence(	0380	)
	Defence(	0556	)
	Defence(	0732	)
	Defence(	0351	)
	Defence(	0527	)
	Defence(	0703	)
	Defence(	0386	)
	Defence(	0562	)
	Defence(	0738	)
	Defence(	0352	)
	Defence(	0528	)
	Defence(	0704	)
	Defence(	0350	)
	Defence(	0526	)
	Defence(	0702	)
	Defence(	0354	)
	Defence(	0530	)
	Defence(	0706	)
	Defence(	0353	)
	Defence(	0529	)
	Defence(	0705	)
	Defence(	0356	)
	Defence(	0532	)
	Defence(	0708	)
	Defence(	0355	)
	Defence(	0531	)
	Defence(	0707	)
	Defence(	0357	)
	Defence(	0533	)
	Defence(	0709	)
----------------1.7
	AddNpcMission (5118 )
	AddNpcMission (5119 )
	AddNpcMission (5120 )

end
------------------------------------------------------------
-- ЗпЦ®µє-----АіДИ
------------------------------------------------------------
function r_talk223()


	Talk( 1,  "Лана: Привет, я портальщик острова Осени. Чем я могу помочь? " )
	Text( 1,  "Вернуться в Ледынь ", GoTo, 1318, 510,  "darkblue " )

end


------------------------------------------------------------
-- ±щС©µє-----єЈµБЅЬАпГЧ
------------------------------------------------------------
function r_talk224()


	Talk( 1,  "Пират Джереми: Привет! Я пират и я счастлив! " )

	AddNpcMission ( 306 )
	AddNpcMission ( 307 )
	AddNpcMission ( 308 )

end

------------------------------------------------------------
-- ГщЙіµє-----ЅЬїЛґ¬і¤
------------------------------------------------------------
function r_talk225()


	Talk( 1,  "Капитан Джек: Привет! Я богат, красив и знаменит! Меня все боготворят! " )

	AddNpcMission ( 309 )
	AddNpcMission ( 310 )
	AddNpcMission ( 312 )
	AddNpcMission ( 313 )
	AddNpcMission ( 314 )
	AddNpcMission ( 315 )
	AddNpcMission ( 316 )
	AddNpcMission ( 328 )
	AddNpcMission ( 329 )
	AddNpcMission ( 333 )
	AddNpcMission ( 336 )
	AddNpcMission ( 483 )
	AddNpcMission ( 484 )
end


------------------------------------------------------------
-- ±щАЗ±¤ПВіЗ-----ВіёсАј
------------------------------------------------------------
function r_talk226()


	Talk( 1,  "Люк: Мой брат любит постоянно устраивать мне неприятности. " )
	
	Talk( 2,  "Luke: My brother loves to create trouble for meЎ­always expecting me to clear the mess. SighЎ­ ")
	Text( 2,  "I lost the ring you gave me ", JumpPage, 3)

	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 4144, 1 , 4)
	TriggerAction( 1, JumpPage, 4 )
	TriggerFailure( 1, JumpPage, 5 )
	Talk( 3,  "Luke: You lost such an expensive ring? Pay me 50000G and I will remake for you. ")
	Text( 3,  "Okay, heres 50000G. ", MultiTrigger, GetMultiTrigger(), 1 )
	Text( 3,  "This is extortion! I do not have so much ", CloseTalk )

	Talk( 4,  "Luke: Keep it well, this ring is for you ")

	Talk( 5,  "Luke: You don't seems to have enough gold...Its 50000G... ")

	InitTrigger()
	-----------јмІвИООсДГБЛУгБЫЅдЦё,µ«КЗ¶ЄБЛІ»јыБЛ
	TriggerCondition( 1, HasRecord, 260 )
	TriggerCondition( 1, NoRecord, 262 )
	TriggerCondition( 1, NoItem, 4144, 1 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	
	Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 296 )
	AddNpcMission ( 297 )
	AddNpcMission ( 298 )
	AddNpcMission ( 302 )
	AddNpcMission ( 303 )

end


------------------------------------------------------------
-- чјчГУЄµШІ№ёшХѕ-----їЛА­А­ґуК¦
------------------------------------------------------------
function r_talk227()

	Talk( 1,  "Мастер Керра: Каждый думает что у меня сильная выдержка. Наверное потому что не имеют своей. " )

	AddNpcMission ( 299 )
	AddNpcMission ( 300 )
	AddNpcMission ( 469 )
	AddNpcMission ( 391 )
	----------------1.7
	AddNpcMission (5121 )
	AddNpcMission (5122 )
	AddNpcMission (5123 )
end

------------------------------------------------------------
-- їЁ¶ыјУµВІ№ёшХѕ-----ИшДПЎ¤ёсБ¦µВ
------------------------------------------------------------
function r_talk228()

	Talk( 1,  "Саймон Джилтер: И когда же я стану чиновником флота... Я же так очарователен. " )
	
	AddNpcMission ( 837 )
	AddNpcMission ( 838 )
	AddNpcMission ( 839 )

end

------------------------------------------------------------
-- їЁ¶ыјУµВІ№ёшХѕ-----єЈА¶Ў¤Оў·з
------------------------------------------------------------
function r_talk229()

	Talk( 1,  "Лазурный бриз: Пожалуйста не забудьте найти красивую веточку для меня. " )

	AddNpcMission ( 840 )
---------------°ЧСт
	AddNpcMission	(5591)
	AddNpcMission	(5592)
--	AddNpcMission ( 6048 )
--	AddNpcMission ( 6049 )

end

------------------------------------------------------------
-- їЁ¶ыјУµВІ№ёшХѕ-----?Ў¤Д§Б¦
------------------------------------------------------------
function r_talk230()

	Talk( 1,  "Са Мори: Нет в этом мире девушки красивее меня! " )

	AddNpcMission ( 844 )
	AddNpcMission ( 841 )
	AddNpcMission ( 842 )
	AddNpcMission ( 843 )

end

------------------------------------------------------------
-- їЁ¶ыјУµВІ№ёшХѕ-----їЁРЭЎ¤ЛйКЇ
------------------------------------------------------------
function r_talk231()

	Talk( 1,  "Кэрин Ливингстоун: Я ненавижу ту жирную старуху! До сих пор утверждает что она молода и красива. " )

	AddNpcMission ( 845 )
	AddNpcMission ( 846 )
	AddNpcMission ( 847 )
	AddNpcMission ( 848 )

end

------------------------------------------------------------
-- ±щј«І№ёшХѕ-----ИыО¬Ў¤Цм¶ы
------------------------------------------------------------
function r_talk232()

	Talk( 1,  "Саша: Здесь очень сильный ветер и до моей кожи часто добирается песок. Это очень ее портит. " )
	
	AddNpcMission ( 877 )
	AddNpcMission ( 883 )
	AddNpcMission ( 884 )


end

------------------------------------------------------------
-- ±щј«І№ёшХѕ-----ї­ОДЎ¤АЗ
------------------------------------------------------------
function r_talk233()

	Talk( 1,  "Кэвин Вульф: Я волк блуждающий по пустыне. " )

	AddNpcMission ( 881 )
end

------------------------------------------------------------
-- ·ПїуІ№ёшХѕ-----КОЖ·ЙМИЛЎ¤ІјїЁ
------------------------------------------------------------
function r_talk235()

	Talk( 1,  "Пукан: Я продаю различные ожерелья и кольца. Может вас что то заинтересует? " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4611	)
	Defence(	4612	)
	Defence(	4613	)
	Defence(	4614	)
	Defence(	4615	)
	Defence(	4616	)
	Defence(	4617	)
	Defence(	4618	)
	Defence(	4619	)
	Defence(	4620	)

end

------------------------------------------------------------
-- Аµ°ІЙ­БЦІ№ёшХѕ-----КОЖ·ЙМИЛЎ¤АпїЛ
------------------------------------------------------------
function r_talk236()

	Talk( 1,  "Рикка: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4626	)
	Defence(	4627	)
	Defence(	4628	)
	Defence(	4629	)
	Defence(	4630	)
	Defence(	4631	)
	Defence(	4632	)
	Defence(	4633	)
	Defence(	4634	)
	Defence(	4635	)
end

------------------------------------------------------------
-- НЯ¶ыЕµІ№ёшХѕ-----КОЖ·ЙМИЛЎ¤·СА­Ап
------------------------------------------------------------
function r_talk237()

	Talk( 1,  "Ферэрри: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4631	)
	Defence(	4632	)
	Defence(	4633	)
	Defence(	4634	)
	Defence(	4635	)
	Defence(	4636	)
	Defence(	4637	)
	Defence(	4638	)
	Defence(	4639	)
	Defence(	4640	)

end

------------------------------------------------------------
-- АЧцЄ±¤-----КОЖ·ЙМИЛЎ¤О¬їЛ¶а
------------------------------------------------------------
function r_talk238()

	Talk( 1,  "Ветиго: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4641	)
	Defence(	4642	)
	Defence(	4643	)
	Defence(	4644	)
	Defence(	4645	)
	Defence(	4646	)
	Defence(	4647	)
	Defence(	4648	)
	Defence(	4649	)
	Defence(	4650	)
	Defence(	4706	)
	Defence(	4707	)
	Defence(	4708	)
	Defence(	4709	)
	Defence(	4711	)
	Defence(	4712	)
	Defence(	4713	)
	Defence(	4714	)
	Defence(	4715	)

end

------------------------------------------------------------
-- їЁ¶ыјУµВІ№ёшХѕ-----КОЖ·ЙМИЛЎ¤°¬¶ы
------------------------------------------------------------
function r_talk239()

	Talk( 1,  "Аии: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4651	)
	Defence(	4652	)
	Defence(	4653	)
	Defence(	4654	)
	Defence(	4655	)
	Defence(	4656	)
	Defence(	4657	)
	Defence(	4658	)
	Defence(	4659	)
	Defence(	4660	)

end

------------------------------------------------------------
-- °НІјІ№ёшХѕ-----КОЖ·ЙМИЛЎ¤°¬ВЧ
------------------------------------------------------------
function r_talk240()

	Talk( 1,  "Лавочник - Дунман: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4666	)
	Defence(	4667	)
	Defence(	4668	)
	Defence(	4669	)
	Defence(	4671	)
	Defence(	4672	)
	Defence(	4673	)
	Defence(	4674	)
	Defence(	4675	)
	Defence(	4676	)
	Defence(	4677	)
	Defence(	4678	)
	Defence(	4679	)
	Defence(	4681	)
	Defence(	4682	)
	Defence(	4683	)
	Defence(	4684	)
	Defence(	4685	)

end

------------------------------------------------------------
-- ±щј«І№ёшХѕ-----КОЖ·ЙМИЛЎ¤Ир¶ч
------------------------------------------------------------
function r_talk241()

	Talk( 1,  "Дунман: Я продаю разнообразные кольца и ожерелья. Посмотрите, возможно вас что-нибудь заинтересует. " )
	Text( 1,  "Торг ", BuyPage )

	InitTrade()
	Defence(	4686	)
	Defence(	4687	)
	Defence(	4688	)
	Defence(	4689	)
	Defence(	4691	)
	Defence(	4692	)
	Defence(	4693	)
	Defence(	4694	)
	Defence(	4695	)
	Defence(	4696	)
	Defence(	4697	)
	Defence(	4698	)
	Defence(	4699	)
	Defence(	4701	)
	Defence(	4702	)
	Defence(	4703	)
	Defence(	4704	)
	Defence(	4705	)

end


------------------------------------------------------------
-- °ЧТшіЗ-----ЗеПґ»ъ
------------------------------------------------------------
function r_talk252()
	
	InitFuncList()
	AddFuncList( GiveItem,	0817	,	1	,	4)
	AddFuncList( GiveItem,	0818	,	1	,	4)
	AddFuncList( GiveItem,	0819	,	1	,	4)
	AddFuncList( GiveItem,	0867	,	1	,	4)
	AddFuncList( GiveItem,	0868	,	1	,	4)
	AddFuncList( GiveItem,	0869	,	1	,	4)
	AddFuncList( GiveItem,	0872	,	1	,	4)
	AddFuncList( GiveItem,	0873	,	1	,	4)
	AddFuncList( GiveItem,	0874	,	1	,	4)
	AddFuncList( GiveItem,	1630	,	2	,	4)
	AddFuncList( GiveItem,	1631	,	1	,	4)
	AddFuncList( GiveItem,	1632	,	1	,	4)
	AddFuncList( GiveItem,	1633	,	2	,	4)
	AddFuncList( GiveItem,	1634	,	1	,	4)
	AddFuncList( GiveItem,	1635	,	1	,	4)
	AddFuncList( GiveItem,	1636	,	2	,	4)
	AddFuncList( GiveItem,	1637	,	1	,	4)
	AddFuncList( GiveItem,	1638	,	1	,	4)
	AddFuncList( GiveItem,	1639	,	2	,	4)
	AddFuncList( GiveItem,	1640	,	1	,	4)
	AddFuncList( GiveItem,	1641	,	1	,	4)
	AddFuncList( GiveItem,	1642	,	2	,	4)
	AddFuncList( GiveItem,	1643	,	1	,	4)
	AddFuncList( GiveItem,	1644	,	1	,	4)
	AddFuncList( GiveItem,	3360	,	1	,	4)
	AddFuncList( GiveItem,	3361	,	1	,	4)
	AddFuncList( GiveItem,	3362	,	1	,	4)
	AddFuncList( GiveItem,	3363	,	1	,	4)
	AddFuncList( GiveItem,	3364	,	1	,	4)
	AddFuncList( GiveItem,	3365	,	1	,	4)
	AddFuncList( GiveItem,	3366	,	1	,	4)
	AddFuncList( GiveItem,	3367	,	1	,	4)
	AddFuncList( GiveItem,	3425	,	1	,	4)
	AddFuncList( GiveItem,	3426	,	1	,	4)
	AddFuncList( GiveItem,	3427	,	1	,	4)
	AddFuncList( GiveItem,	3428	,	1	,	4)
	AddFuncList( GiveItem,	3429	,	1	,	4)
	AddFuncList( GiveItem,	3430	,	1	,	4)
	AddFuncList( GiveItem,	3431	,	1	,	4)
	AddFuncList( GiveItem,	3432	,	1	,	4)
	AddFuncList( GiveItem,	3433	,	1	,	4)
	AddFuncList( GiveItem,	1804	,	1	,	4)
	AddFuncList( GiveItem,	1805	,	1	,	4)
	AddFuncList( GiveItem,	1806	,	1	,	4)
	AddFuncList( GiveItem,	1807	,	1	,	4)
	AddFuncList( GiveItem,	1808	,	1	,	4)
	AddFuncList( GiveItem,	1809	,	1	,	4)
	AddFuncList( GiveItem,	1810	,	1	,	4)
	AddFuncList( GiveItem,	1811	,	1	,	4)
	AddFuncList( GiveItem,	1787	,	1	,	4)
	AddFuncList( GiveItem,	1788	,	1	,	4)
	AddFuncList( GiveItem,	1789	,	1	,	4)
	AddFuncList( GiveItem,	1790	,	1	,	4)
	AddFuncList( GiveItem,	1791	,	1	,	4)
	AddFuncList( GiveItem,	1792	,	1	,	4)
	AddFuncList( GiveItem,	1793	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3927, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3927, 1 )
	TriggerAction( 1, RandFunction, GetFuncList(), GetNumFunc() )
	TriggerFailure( 1, JumpPage, 2 )
	Talk( 1,  "Это очень старый чистильщик, способный очистить любую грязь. " )
	Text( 1,  "Очистить Грязь ", MultiTrigger, GetMultiTrigger(), 1)
	--Text( 1,  "Очистить Рождественский подарок ", JumpPage, 3)

	InitTrigger()
	TriggerCondition( 1, HasItem, 2892, 1 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2892, 1 )
	TriggerAction( 1, GiveItem, 2893, 1 , 4)
	TriggerAction( 1, JumpPage, 4)
	TriggerFailure( 1, JumpPage, 2 )
	Talk( 3,  "Фу... Какая грязная коробка. ЧТобы ее почистить вам придется заплатить 10000 золота! " )
	Text( 3,  "Очистить ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 4,  "Какой красивый сундук! Открой и получишь сюрприз! " )
	Talk( 2,  "Невозможно очистить. У вас недостаточно денег или нет предметов для очистки. " )
end


------------------------------------------------------------
-- їј№Е¶Уі¤-----їј№ЕС§јТ
------------------------------------------------------------
function r_talk253()
	
	Talk( 1,  "Исследователь: Привет! Я отношусь к гильдии исследователей. Я долго изучал древние прокляться. Чем я могу помочь? " )
	Text( 1,  "Избавится от печати огня ", JumpPage, 3)

	Talk( 3,  "Исследователь: Хорошо, я помогу вам. Эта печать очень древняя, снять ее можно только используя руны.  " )
	Text( 3,  "Мантия тайного знания ", JumpPage, 6)
	Text( 3,  "Посох миражей ", JumpPage, 7)
	Text( 3,  "Посох исчезновения ", JumpPage, 8)
	Text( 3,  "Покров исчезновения ", JumpPage, 9)
	Text( 3,  "Плащ исчезновения ", JumpPage, 10)
	Text( 3,  "Тату исчезновения ", JumpPage, 11)
	Text( 3,  "Доспех исчезновения ", JumpPage, 12)
	Text( 3,  "Дальше --> ", JumpPage, 4)

	Talk( 4,  "Исследователь: Хорошо, я помогу вам. Эта печать очень древняя, снять ее можно только используя руны. " )
	Text( 4,  "Вопль исчезновения ", JumpPage, 13)
	Text( 4,  "Рык исчезновения ", JumpPage, 14)
	Text( 4,  "Танец исчезновения ", JumpPage, 15)
	Text( 4,  "Зуб исчезновения ", JumpPage, 16)
	Text( 4,  "Мантия оскорбления ", JumpPage, 17)
	Text( 4,  "Рукавицы мсчезновения ", JumpPage, 18)
	Text( 4,  "Поножи исчезновения ", JumpPage, 19)
	Text( 4,  "Дальше --> ", JumpPage, 5)

	Talk( 5,  "Исследователь: Хорошо, я помогу вам. Эта печать очень древняя, снять ее можно только используя руны. " )
	Text( 5,  "Перчатки исчезновения ", JumpPage, 20)
	Text( 5,  "Башмаки исчезновения ", JumpPage, 21)
	Text( 5,  "Перчатки проклятья ", JumpPage, 22)
	Text( 5,  "Сапоги оскорбления ", JumpPage, 23)
	Text( 5,  "Перчатки тайного знания ", JumpPage, 24)
	Text( 5,  "Сапоги тайного знания ", JumpPage, 25)
	Text( 5,  "Тяжелые перчатки исчезновения ", JumpPage, 26)
	Text( 5,  "Сапоги исчезновения ", JumpPage, 27)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1912, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1912, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 791, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 6,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1915, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1915, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 794, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 7,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1908, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1908, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 787, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 8,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1926, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1926, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 805, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 9,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1900, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1900, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 779, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 10,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1886, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1886, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 765, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 11,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1889, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1889, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 768, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 12,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1904, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1904, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 783, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 13,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1893, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1893, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 772, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 14,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1896, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1896, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 775, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 15,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1922, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1922, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 801, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 16,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1918, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1918, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 797, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 17,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1988, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1988, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0807, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 18,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 18,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1989, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1989, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0808, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 19,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 19,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1990, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1990, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0809, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 20,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 20,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1991, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1991, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0810, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 21,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 21,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1992, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1992, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0811, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 22,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 22,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerCondition( 1, HasItem, 1994, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1994, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0813, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 23,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 23,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1993, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1993, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0812, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 24,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 24,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1995, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1995, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0814, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 25,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 25,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1996, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1996, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0815, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 26,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 26,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1997, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1997, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0877, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 27,  "Исследователь: Для снятия печати с этого предмета вам потребуется: запечатанный предмет, 5 рун Фэл, 10 рун Джа, 10 рун Тэф и 600000 золота. " )
	Text( 27,  "Снять печать  ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 30,  "Исследователь: Прошу прощения, но у вас нет всего необходимого. Я не могу снять печать. " )


end

------------------------------------------------------------
-- ·ПБйЦ®¶ј-----їј№ЕС§јТ
------------------------------------------------------------
function r_talk254()
	
	Talk( 1,  "Исследователь: Привет! Я принадлежу к гильдии исследователей.Я занимаюсь исследованием Заброшенного города. Могу ли я чем то помочь? " )
	Text( 1,  "Узнать о Заброшенном городе ", JumpPage, 2)

	Talk( 2,  "Исследователь: Я занимаюсь исследованием Заброшенного города уже долгое время. Я умею снимать печати с найденных там проклятых вещей. " )
	Text( 2,  "Снять печать ", JumpPage, 3)
	
	Talk( 3,  "Исследователь: В Заброшенном городе есть много оставленной запечатанной экипировки нежити. За годы работы я научился снимать печати с этих вещей. С чего вы хотите снять печать? " )
	Text( 3,  "Зуб призрака ", JumpPage, 6)
	Text( 3,  "Накидка нага ", JumpPage, 7)
	Text( 3,  "Посох мстителя ", JumpPage, 8)
	Text( 3,  "Меч печали ", JumpPage, 9)
	Text( 3,  "Мантия смерти ", JumpPage, 10)
	Text( 3,  "Касание смерти ", JumpPage, 11)
	Text( 3,  "Мантия ядовитой ведьмы ", JumpPage, 12)
	Text( 3,  "Доспех возвращенного ", JumpPage, 13)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1920, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1920, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 799, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 6,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1924, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1924, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 803, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 7,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1906, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1906, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 785, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 8,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1891, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1891, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 770, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 9,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1898, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1898, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 777, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 10,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1902, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1902, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 781, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 11,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1910, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1910, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 789, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 12,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1884, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1884, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 763, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "Исследователь: Чтобы снять печать с этого предмета мне понадобится - запечатанный предмет, 5 рун Ял, 5 рун Эль, 10 рун Наль и 200000 золота. " )
	Text( 13,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "Исследователь: Простите, но у вас нет всехнеобходимых предметов. " )

end

------------------------------------------------------------
-- Д§·ЅКАЅз-----їј№ЕС§јТ
------------------------------------------------------------
function r_talk255()
	
	Talk( 1,  "Исследователь: Привет! Я принадлежу к гильдии исследователей. Я занимаюсь исследованием проклятий Мира демонов. Могу я вам чем то помочь? " )
	Text( 1,  "Узнать о Мире демонов ", JumpPage, 2)

	Talk( 2,  "Исследователь: Я занимаюсь исследованиями Мира демонов уже многое время, и могу снимать проклятья с обнаруженных там вещей с помощью рун. " )
	Text( 2,  "Unseal curse ", JumpPage, 3)
	
	Talk( 3,  "Исследователь: В Мире демонов осталось много предметов, запечатанных льдом. Если у вас есть предмет с печатью льда, то я попробую распечатать его для вас. " )
	Text( 3,  "Посох потаенного ", JumpPage, 6)
	Text( 3,  "Накидка сфинкса ", JumpPage, 7)
	Text( 3,  "Крис сфинкса ", JumpPage, 8)
	Text( 3,  "Правосудие потаенного ", JumpPage, 9)
	Text( 3,  "Аркебуз потаенного ", JumpPage, 10)
	Text( 3,  "Накидка потаенного ", JumpPage, 11)
	Text( 3,  "Плащ потаенного ", JumpPage, 12)
	Text( 3,  "Дальше --> ", JumpPage, 4)

	Talk( 4,  "Исследователь: В Мире демонов осталось много предметов, запечатанных льдом. Если у вас есть предмет с печатью льда, то я попробую распечатать его для вас. " )
	Text( 4,  "Клинок потаенного ", JumpPage, 13)
	Text( 4,  "Тату потаенного ", JumpPage, 14)
	Text( 4,  "Доспех потаенного ", JumpPage, 15)
	Text( 4,  "Мантия сфинкса ", JumpPage, 16)
	Text( 4,  "Посох сфинкса ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1909, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1909, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 788, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 6,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1927, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1927, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 806, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 7,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1923, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1923, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 802, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 8,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1894, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1894, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 773, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 9,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1905, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1905, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 784, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 10,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1901, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1901, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 780, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 11,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1913, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1913, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 792, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 12,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1897, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1897, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 776, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 13,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1887, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1887, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 766, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 14,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1890, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1890, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 769, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 15,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1919, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1919, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 798, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 16,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1916, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1916, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 795, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "Исследователь: Для снятия печати с этого предмета тебе нужно принести - запечатанный предмет, 5 рун Кэль, 10 рун Фа, 20 рун Тер и 800000 золота. " )
	Text( 17,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "Исследователь: Простите, но у вас нет всех необходимых предметов. " )

end


------------------------------------------------------------
-- Тх°µХУФу-----їј№ЕС§јТ¶Уі¤
------------------------------------------------------------
function r_talk256()
	
	Talk( 1,  "Исследователь: Привет! Я принадлежу к гильдии исследователей. Я занимаюсь исследованиями проклятий Темной топи. МОгу я вам чем то помочь? " )
	Text( 1,  "Узнать о Темной топи ", JumpPage, 2)

	Talk( 2,  "Исследователь: Я занимаюсь исследованиями Темной топи уже долгое время. Чтобы снять печать с предметов Темной топи вы должны принести мне некоторые руны. Кроме того если вы найдете немного Темного масла я могу изготовить для вас Огненное зернышко. " )
	Text( 2,  "Снять печати", JumpPage, 3)
	Text( 2,  "Узнать о Огненном зернышке ", JumpPage, 5)
	
	Talk( 3,  "Исследователь: В Темной топи есть много предметов с печатью земли. За время работы там я научился снимать эти печати. Если у вас есть предмет с печатью земли, то я помогу вам. " )
	Text( 3,  "Плащ призыва ", JumpPage, 6)
	Text( 3,  "Тату проклятого воина ", JumpPage, 7)
	Text( 3,  "Накидка проклятого пламени ", JumpPage, 8)
	Text( 3,  "Посох заклинаний ", JumpPage, 9)
	Text( 3,  "Посох Кабалы ", JumpPage, 10)
	Text( 3,  "Мантия каббалы ", JumpPage, 11)
	Text( 3,  "Клинок заклинаний ", JumpPage, 12)
	Text( 3,  "Дальше --> ", JumpPage, 4)

	Talk( 4,  "Исследователь: В Темной топи есть много предметов с печатью земли. За время работы там я научился снимать эти печати. Если у вас есть предмет с печатью земли, то я помогу вам. " )
	Text( 4,  "Пояс заклинаний ", JumpPage, 13)
	Text( 4,  "Большой меч заклинаний ", JumpPage, 14)
	Text( 4,  "Зуб проклятого ", JumpPage, 15)
	Text( 4,  "Пластинчатый доспех проклятого ", JumpPage, 16)
	Text( 4,  "Поцелуй проклятого ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3930, 5 )
	TriggerCondition( 1, HasItem, 3931, 1 )
	TriggerCondition( 1, HasItem, 3932, 5 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3930, 5 )
	TriggerAction( 1, TakeItem, 3931, 1 )
	TriggerAction( 1, TakeItem, 3932, 5 )
	TriggerAction( 1, GiveItem, 3934, 1, 4 )
	TriggerFailure( 1, JumpPage, 31 )
	Talk( 5,  "Исследователь: Для изготовления Огненного зернышка необходимо: 5 Темное масло, 1 Зажигалка, 5 Клочок ткани. " )
	Text( 5,  "Сделать Огненное зернышко ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1911, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1911, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 790, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 6,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1885, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1885, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 764, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 7,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1925, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1925, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 804, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 8,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1907, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1907, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 786, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 9,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1914, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1914, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 793, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 10,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1917, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1917, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 796, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 11,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1895, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1895, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 774, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 12,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1899, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1899, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 778, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 13,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1892, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1892, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 771, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 14,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1921, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1921, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 800, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 15,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1888, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1888, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 767, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 16,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1903, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1903, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 782, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "Исследователь: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 5 рун Лам, 10 рун Сол, 5 рун Кам и 400000 золота. " )
	Text( 17,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "Исследователь: Простите, но у вас нет всех необходимых предметов. " )

	Talk( 31,  "Исследователь: Простите, но у вас нет всех необходимых предметов. " )


end


------------------------------------------------------------
-- °ЧТшіЗ-----йД№ы
------------------------------------------------------------
function r_talk242()
	Talk( 14,  "Бинго: Дайте мне расписку для получения самоцвета высокого класса. " )
	InitTrigger() 
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0860, 3, 101 )
	TriggerFailure( 1, JumpPage, 15 )
	Text( 14,  "Получить 3 Самоцвета ветра ",MultiTrigger, GetMultiTrigger(), 1) 
	InitTrigger() 
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0861, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "Получить 3 Самоцвета удара ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger()
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0862, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "Получить 3 Самоцвета колосса ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0863, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "Получить 3 Самоцвета ярости ",MultiTrigger, GetMultiTrigger(), 1) 
	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 1012, 1,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "Получить 1 Самоцвет души ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 15,  "Бинго: Обмен невозможен! У вас нет расписки или заблокирован инвентарь  " )
	Talk( 16,  "С Новым годом! " )

	Talk( 1,  "Бинго: Привет! Я отдающая долги Бинго. У вас есть что то для меня? ")
	Text( 1,  "Расписка на Рождественский самоцвет ", JumpPage, 14 )
    Text( 1,  "Расписка на самоцвет ", JumpPage, 5 )
	Text( 1,  "Расписка на уникальный самоцвет ", JumpPage, 12 )
	Text( 1,  "Расписка на Очищающий самоцвет 1 уровня ", JumpPage, 2 )
	Text( 1,  "Расписка на Очищающий самоцвет 2 уровня ", JumpPage, 3 )
	Text( 1,  "Расписка на Очищающий самоцвет ", JumpPage, 4 )
	Text( 1,  "Дальше --> ", JumpPage, 21 )
	Talk( 21,  "Бинго: Привет! Я отдающая долги Бинго. У вас есть что то для меня? ")
	Text( 21,  "Пиратская расписка ", JumpPage, 17 )
    Text( 21,  "Объединить Камень желаний ", JumpPage, 6 )
	Text( 21,  "Обменять Лунный пирог ", JumpPage, 20 )		-------ФВ±э¶Т»»
	Text( 21,  "Получить Мартовскую фею ", JumpPage, 10 )
	Text( 21,  "<-- Назад ", JumpPage, 1 )
      
	
	Talk( 2,  "Бинго: Дай мне расписку на Очищающий самоцвет 1 уровня для получения очищающего самоцвета, а также еще 1 случайного самоцвета 1 уровня. ")
	Text( 2,  "Обменять ", TransferDiamond, 1)

	Talk( 3,  "Бинго: Дай мне расписку на Очищающий самоцвет 2 уровня для получения очищающего самоцвета, а также еще 1 случайного самоцвета 2 уровня. ")
	Text( 3,  "Обменять ", TransferDiamond, 2)

	Talk( 4,  "Бинго: Дай мне расписку на очищающий самоцвет для получения 1 очищающего самоцвета 1 уровня ")
	Text( 4,  "Обменять ", TransferDiamond, 3)

	Talk( 5,  "Бинго: Дай мне 1 расписку на самоцвет для получения 1 случайного самоцвета 1 уровня ")
	Text( 5,  "Обменять ", TransferDiamond, 4)



	Talk( 17,  "Бинго: У вас есть Пиратская расписка? ")
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 2238, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2238, 1 )
 	TriggerAction( 1, GiveItem, 2306, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "У меня есть пиратская расписка 8 ",MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()--¶Т»»Д¦Б¦·ыКЇ
	TriggerCondition( 1, HasItem, 2240, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2240, 1 )
 	TriggerAction( 1, GiveItem, 1028, 1 ,4)
	TriggerAction( 1,JumpPage, 19 )------------------
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "У меня есть пиратская расписка 6 ",MultiTrigger, GetMultiTrigger(), 1)

	Text( 17,  "У меня есть пиратская расписка 6 ",JumpPage, 19)
	Talk(19, "Бинго: Вы хотите обменять? ")
	Text( 19,  "Обменять ",GetChaName_5, 1)

	InitTrigger()--¶Т»»ѕ«БйУІ±Т99ёц
	TriggerCondition( 1, HasItem, 2237, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2237, 1 )
 	TriggerAction( 1, GiveItem, 855, 99 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "У меня есть пиратская расписка 9 ",MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()-- ¶Т»»ЦэФмНјЦЅ "Encrypted Blueprint "Ј±ХЕ
	TriggerCondition( 1, HasItem, 2239, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2239, 1 )
 	TriggerAction( 1, GiveItem, 1001, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "У меня есть пиратская расписка 7 ",MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()--¶Т»»јУЛЩіЙі¤№ы1ёц
	TriggerCondition( 1, HasItem, 2241, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2241, 1 )
 	TriggerAction( 1, GiveItem, 0578, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "У меня есть пиратская расписка 5 ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 17,  "Общая сумма пиратских расписок ", GetChaName_4, 1)



	Talk( 18,  "Бинго: Кажется вы не имеете подходящую пиратскую расписку. Убедитесь также что ваш инвентарь не заблокирован и имеется хотя бы одно свободное место. ")

 	InitTrigger() --єПіЙРнФёКЇ
	TriggerCondition( 1, HasItem, 3905, 5 )
	TriggerCondition( 1, HasItem, 3907, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3905, 5 )
	TriggerAction( 1, TakeItem, 3907, 1 )
 	TriggerAction( 1, GiveItem, 3906, 1 ,4)
	TriggerFailure( 1, JumpPage, 8 )
	Talk( 6,  "Бинго: Принесите мне 5 Темных камней желанийи 1 Катализатор ковки для обмена на 1 Искрящийся камень желаний ")
	Text( 6,  "Комбинировать ",MultiTrigger, GetMultiTrigger(), 1)        
 	
	Talk( 8,  "Бинго: Вы не имеете нужное количество Темных камней желаний или Катализаторов ковки. Убедитесь также что у вас имеется хотя бы 1 свободное место в инвентаре. ")

	InitTrigger() --¶Т»»ИэФВѕ«Бй
	TriggerCondition( 1, HasItem, 3342, 2 )
	TriggerCondition( 1, HasItem, 3337, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3342, 2 )
	TriggerAction( 1, TakeItem, 3337, 1 )
	TriggerAction( 1, GiveItem, 3335, 1 ,4)
	TriggerFailure( 1, JumpPage, 11 ) 
	Talk( 10,  "Бинго: Принесите мне 2 Светильника и 1 Душу феи для обмена на Мартовскую фею. Душу феи можно найти у Уиткомбы в Бухте Хафта. ")
	Text( 10,  "Обменять ",MultiTrigger, GetMultiTrigger(), 1) 
   
	Talk( 11,  "У вас нет всего необходимого для обмена. Возможно также у вас нет свободных мест в инвентаре или он заблокирован. ")
	
	Talk( 12,  "Бинго: Дайте мне 1 расписку на уникальный самоцвет для обмена на уникальный самоцвет. ")

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0863, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "Получить самоцвет ярости ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid,1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 1012, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "Получить самоцвет души ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0862, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "Получить самоцвет колосса ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1)
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0861, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "Получить самоцвет удара ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --ёЯј¶±¦КЇ¶Т»»ИЇ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0860, 1, 101 )
	TriggerFailure( 1, JumpPage, 13 ) 
	Text( 12,  "Получить самоцвет ветра ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 13,  "Бинго: У вас нет расписки на уникальный самоцвет! Возможно также ваш инвентарь переполнен или заблокирован. ")
	
	Talk( 20,  "Бинго: Я обожаю Лунные пироги? У вас есть? Я дам за них превосходный товар " )
	InitTrigger() --99ёцЈєГФЦ®Лш10ёц
	TriggerCondition( 1, HasItem,3095, 99 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3915, 99 )
	TriggerAction( 1, GiveItem, 2440, 10, 4 )
	TriggerFailure( 1, JumpPage, 21 )
	Text( 20,  "Обменять 99 пирогов на Супер усилитель стремлений ",MultiTrigger, GetMultiTrigger(), 1) 
	
	InitTrigger() --100ёцЈєІЖё»1ёц
	TriggerCondition( 1, HasItem,3097, 99 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3915, 100 )
	TriggerAction( 1, GiveItem, 3096, 1,4 )
	TriggerFailure( 1, JumpPage, 21 )
	Text( 20,  "Обменять 99 пирогов на Большой усилитель удачи ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 21,  "Бинго: У вас нет необходимого количества предметов! Возможно также ваш инвентарь переполнен или заблокирован. ") 

end
------------------------------------------------------------
-- °ЧТшіЗ-----»о¶ЇЧЁФ±
------------------------------------------------------------
function mmm_talk01()
	Talk( 1,  "Ведущий мероприятий: Обо всех готовящихся или проводимых мероприятиях вы можете узнать у меня. ")
--	Text( 1, bganswer1_13, JumpPage, 13)
--	Text( 1, bganswer1_14, JumpPage, 14)
--	Text( 1, bganswer1_15, JumpPage, 15)
--	Text( 1, bganswer1_16, JumpPage, 16)
--	Text( 1, bganswer1_17, JumpPage, 17)
	--Text( 1,  "Lucky Alphabet Card Exchange " ,JumpPage, 18 )

	InitTrigger()
	TriggerCondition( 1, HasRecord, 1007 )
	TriggerAction( 1, ClearRecord, 1000 )
	TriggerAction( 1, ClearRecord, 1001 )
	TriggerAction( 1, ClearRecord, 1002 )
	TriggerAction( 1, ClearRecord, 1003 )
	TriggerAction( 1, ClearRecord, 1004 )
	TriggerAction( 1, ClearRecord, 1005 )
	TriggerAction( 1, ClearRecord, 1006 )
	TriggerAction( 1, ClearRecord, 1007 )
	TriggerAction( 1, JumpPage, 20)
	TriggerFailure( 1, JumpPage, 21)
	Text( 1,  "Start challenge again " ,MultiTrigger, GetMultiTrigger(), 1)

	----------------11.20-11.26	
	InitTrigger()						----50WєЈµБ±Т
	TriggerCondition( 1, CheckZMKTime )
	TriggerCondition( 1, HasItem, 3869, 1 )			----t
	TriggerCondition( 1, HasItem, 3864, 1 )			----0
	TriggerCondition( 1, HasItem, 3865, 1 )			----p

	TriggerAction( 1, TakeItem,   3869, 1 )
	TriggerAction( 1, TakeItem,   3864, 1 )
	TriggerAction( 1, TakeItem,   3865, 1 )
	TriggerAction( 1, AddMoney, 500000)
	TriggerFailure( 1, JumpPage, 19 )
	Talk( 18,  "Pappa: This week's lucky combination is: top. Exchangable for 500000G. ")
	Text(18,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 19,  "Pappa: Do you have enough Cards on you? Please check if your inventory is binded! ")
	Talk( 20,  "You can take the challenge of Hexathlon again now! ")
	Talk( 21,  "you can do the challenge now.please don't joke with me.i'm busy now. ")
	-----МъИЛБщПо
	AddNpcMission ( 6114 )


	----------------11.27-12.3
--	InitTrigger()					----10ёцЙсПЙЅ¬№ы
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3858, 1 )			----i
--	TriggerCondition( 1, HasItem, 3856, 2 )			----g
--	TriggerCondition( 1, HasItem, 3869, 1 )			----t
--	TriggerCondition( 1, HasItem, 3864, 1 )			----0
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--
--	TriggerAction( 1, TakeItem,   3858, 1 )
--	TriggerAction( 1, TakeItem,   3856, 2 )
--	TriggerAction( 1, TakeItem,   3869, 1 )
--	TriggerAction( 1, TakeItem,   3864, 1 )
--	TriggerAction( 1, TakeItem,   3865, 1 )
--	TriggerAction( 1, GiveItem, 3844, 10, 4)
--	TriggerFailure( 1, JumpPage, 19 )
--	Talk( 18,  "Pappa: This week's lucky combination is: iggtop. Exchangable for 10 Heaven's Berry. ")
--	Text(18,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)


	---------------12.4-12.10
--	InitTrigger()						----МжЙнНЮНЮ10ёц+5ёцЙсПЙЅ¬№ы
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3857, 1 )			----h
--	TriggerCondition( 1, HasItem, 3864, 2 )			----0
--	TriggerCondition( 1, HasItem, 3869, 2 )			----t
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--
--	TriggerAction( 1, TakeItem, 3857, 1 )			----h
--	TriggerAction( 1, TakeItem, 3864, 2 )			----0
--	TriggerAction( 1, TakeItem, 3869, 2 )			----t
--	TriggerAction( 1, TakeItem, 3865, 1 )			----p
--	TriggerAction( 1, GiveItem, 3844, 5, 4)
--	TriggerAction( 1, GiveItem, 3846, 10, 4)
--	TriggerFailure( 1, JumpPage, 19 )
--	Talk( 18,  "Pappa: This week's lucky combination is: hottop. Exchangable for 10 Voodoo Doll and 5 Heaven's Berry. ")
--	Text(18,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

	---------------12.11-12.17
--	InitTrigger()						----єЪБъ
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3869, 2 )			----t
--	TriggerCondition( 1, HasItem, 3850, 2 )			----a
--	TriggerCondition( 1, HasItem, 3861, 1 )			----l
--	TriggerCondition( 1, HasItem, 3854, 2 )			----e
--	TriggerCondition( 1, HasItem, 3868, 2 )			----s
--	TriggerCondition( 1, HasItem, 3864, 1 )			----o
--	TriggerCondition( 1, HasItem, 3855, 1 )			----f
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--	TriggerCondition( 1, HasItem, 3858, 1 )			----i
--	TriggerCondition( 1, HasItem, 3867, 1 )			----r
--
--	TriggerAction( 1, TakeItem, 3869, 2 )			----t
--	TriggerAction( 1, TakeItem, 3850, 2 )			----a
--	TriggerAction( 1, TakeItem, 3861, 1 )			----l
--	TriggerAction( 1, TakeItem, 3854, 2 )			----e
--	TriggerAction( 1, TakeItem, 3868, 2 )			----s
--	TriggerAction( 1, TakeItem, 3864, 1 )			----o
--	TriggerAction( 1, TakeItem, 3855, 1 )			----f
--	TriggerAction( 1, TakeItem, 3865, 1 )			----p
--	TriggerAction( 1, TakeItem, 3858, 1 )			----i
--	TriggerAction( 1, TakeItem, 3867, 1 )			----r
--	TriggerAction( 1, GiveItem, 0845, 1, 4)
--	TriggerAction( 1, GiveItem, 0846, 1, 4)
--	TriggerAction( 1, GiveItem, 0847, 1, 4)
--	TriggerAction( 1, GiveItem, 0848, 1, 4)
--	Talk( 18,  "Pappa: This week's lucky combination is: talesofpirates. Exchangable for A set of Black Dragon apparel. ")
--	Text(18,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

--	Talk( 13, bgtalk13)
--	Talk( 14, bgtalk14)
--	Talk( 15, bgtalk15)
--	Talk( 16, bgtalk16)
--	Talk( 17, bgtalk17)

end

------------------------------------------------------------
-- °ЧТшіЗ-----ЗьФ­
------------------------------------------------------------
function mmm_talk02()
	Talk( 1,  "Ку Ванг: Эх... Снова длинная поездка домой... ")
	AddNpcMission ( 902 )
	AddNpcMission ( 903 )
	AddNpcMission ( 904 )
end
-----------------------------------------------------------
---Йіб°іЗ---іиОп№ЬАнФ±Ў¤АКДГ¶И
-----------------------------------------------------------
function e_talk01 ()
	Talk( 1,  "Ланга: Демонический фрукт определяет какой тип феи получится в результате свадьбы фей. После свадьбы уровень фей учавствовавших в ней понизится на 4 уровня. " )
	Text( 1,  "Особенности фей нового поколения " ,JumpPage, 2)
	Text( 1,  "Условия спаривания фей ", JumpPage, 3)
	Text( 1,  "Свадьба фей ", OpenEidolonMetempsychosis )
	Talk( 2,  "Ланга: Фея нового поколения может изучить навыки саморазрушение и посешена. Кроме того феи Силы, Ловкости, Телосложения, Духа и Точности могут поднять соответствующий навык у своего владельца при использовании посешена. Фея Удачи и фея Зла могу поднять вероятность выпадения вещей и количество опыта соответственно. А Мордо младший способен сделать все это сразу. ")	
	Talk( 3,  "Ланга: На уровень полученной феи нового поколения очень влияет уровень родителей. Кроме того у каждого вида есть свои способности. Какой вас интересует? ")
	Text( 3,  "Условия для получения феи Силы ", JumpPage, 4  )
	Text( 3,  "Условия для получения феи Телосложения ", JumpPage, 5  )
	Text( 3,  "Условия для получения феи Точности ", JumpPage, 6  )
	Text( 3,  "Условия для получения феи Духа ", JumpPage, 7  )
	Text( 3,  "Условия для получения феи Ловкости ", JumpPage, 8  )
	Text( 3,  "Условия для получеиня феи Удачи ", JumpPage, 9 )
	Text( 3,  "Условия для получения феи Зла ", JumpPage, 10 )
	Text( 3,  "Условия для получения Мордо младшего ", JumpPage, 11 )	
	Talk(  4,  "Ланга: Для получения феи Силы необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт силы, 10 Фрагментов арабской жемчужины, 10 Трупов стенающего воина и немного золота. ")
	Talk(  5,  "Ланга: Для получения феи Телосложения необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт храбрости, 10 Треснутых арабских жемчужин, 10 Трупов печального лучника и немного золота. ")
	Talk(  6,  "Ланга: Для получения феи Точности необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт энергии, 10 Рыбьих шипов, 10 Грязной колоды и немного золота. ")
	Talk(  7,  "Ланга: Для создания феи Духа необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт интеллекта, 10 Хвостов выползня, 10 Трупов стенающего лучника и немного золота. ")
	Talk(  8,  "Ланга: Для создания феи Ловкости необходимо - 2 феи старше 20 уровня, 1 Пьяные мечты, 10 Плавников акулы, 10 Болотное дерево и немного золота. ")
	Talk(  9,  "Ланга: Для создания феи Удачи необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт кислоты, 10 Вкусного мяса кальмара, 10 Трупов печального воина и немного золота. ")
	Talk(  10,  "Ланга: Для создания феи Зла необходимо - 2 феи старше 20 уровня, 1 Демонический фрукт тайны, 10 Частей искрящейся арабской жемчужины, 10 Комков грязи и немного золота. ")
	Talk(  11,  "Ланга: При создании Мордо младшего не имеет значение какой фрукт используется. Для этого необходимы лишь 2 феи Мордо старше 20 уровня. При спаривании феи Мордо с любой другой феей вероятность получения Мордо младшего будет зависеть от уровня этих фей. ")

-----------eleven
	AddNpcMission ( 5019 )
	AddNpcMission ( 5032 )

	--------------------1.7
	AddNpcMission ( 5080	)
	AddNpcMission ( 5081	)
	AddNpcMission ( 5082	)
	AddNpcMission ( 5083	)
	AddNpcMission (5117 )
	AddNpcMission (5142 )
	AddNpcMission (5149 )
end 

------------------------------С°ХТТЕК§µД°®Зй
function el_talk01()
	Talk( 1,  "Маленькая рыбка: Вернитесь скорее, я не справлюсь с этим один... ")	
	AddNpcMission ( 907 )
	AddNpcMission ( 911 )
	AddNpcMission ( 912 )
	AddNpcMission ( 917 )
end
function el_talk02()
	Talk( 1,  "Бабочка: Я близкий друг Цветочка... ")
	AddNpcMission ( 908 )
	AddNpcMission ( 909 )
	AddNpcMission ( 910 )
end
-----------------------------------------------------------
---°ЧТш---ЙсГШЖЕЖЕ
-----------------------------------------------------------
-------------------------------------°®ЗйЦШЙъ
function el_talk03()
	Talk( 1,  "Таинственная бабуля: Я не понимаю что во мне такого таинственного... ")	


	AddNpcMission ( 918 )
--------eleven
	AddNpcMission ( 5018 )
	AddNpcMission ( 5020 )
	AddNpcMission ( 5021)
	AddNpcMission ( 5022)
end
-----------------------------------------------------------
---ґє·зХт---ЙсГШµДВЇЧУ
-----------------------------------------------------------
function star_talk02 ()
	Talk( 1,  "Очаг Бессмертия: Что вы так смотрите? Никогда не видели такую красивую печь? " )
	Text( 1,  "Описание функции ", JumpPage, 2 )
	Text( 1,  "Улучшение особого набора ", OpenItemTiChun )
	Text( 1,  "Зарядка коралла ", OpenItemEnergy )
	Text( 1,  "Вытащить самоцвет ", OpenGetStone )
	Text( 1,  "Починить инструмент ", OpenItemFix )
	Talk( 2,  "Очаг Бессмертия: Я больше не буду говорить ни о чем. Пробуйте сами. " )
	Text( 2,  "Об улучшении набора Кайлин, набора Черного дракона и снаряжения босса 70 уровня. ", JumpPage, 3)
	Text( 2,  "Узнать о зарядке коралла ", JumpPage, 4 )
	Text( 2,  "Узнать о вытаскивании саомцвета ", JumpPage, 5 )
	Text( 2,  "Узнать о починке инструментов ", JumpPage, 6)
	Talk( 3,  "Очаг Бессмертия: С помощью этой функции вы можете улучшить набор Кайлин, набор Черного дракона или снаряжение босса 70 уровня в набор Смерти 75 уровня. Вставленные в предмет самоцветы сохранятся. " )
	Talk( 4,  "Очаг Бессмертия: Вы можете зарядить свой коралл используя особые батареи. Например Перезаряжаемая батарея способна зарядить от 50 до 1000 энергии коралла, а Перезаряжаемая супербатарея способна зарядить до 1500 энергии коралла. После использования батарея исчезает! " )
	Talk( 5,  "Очаг Бессмертия: Извлечение самоцвета из слота идет сверху вниз. Уровень извлекаемого самоцвета будет равен уровню вставленного самоцвета. После извлечения уровень вставленного самоцвета уменьшается на 1 единицу. Извлечения каждого самоцвета требует 1 Клещи кузнеца. ")
	Text( 5,  "Пример вытаскивания самоцвета ", JumpPage, 7 )
	Talk( 6,  "Очаг Бессмертия: Ремонтировать можно только поврежденные Кристальный котел, Кристалл антиматерии, Черную дыру, Частицу антивещества. Ремонтирование каждого предмета потребует использование 1 Ремонтного инструмента. Уровень ремонтного инструмента должен быть равен уровню повредленного инструмента. " )
	Talk( 7,  "Очаг Бессмертия: Возьмем Меч дракона с 3 слотами для примера. В первом слоте Самоцвет ярости 3 уровня, во втором Огненный самоцвет 2 уровня и в третьем Глаз Черного дракона 1 уровня. При извлечении мы получим Самоцвет ярости 3 уровня, а в первом слоте будет Самоцвет ярости 2 уровня. Извлечение всегда идет с 1 слота поочередно. " )
end 
-----------------------------------------------------------
---°ЧТш---ЕцЕцАЦ
-----------------------------------------------------------
function star_talk03 ()
	Talk( 1,  "Джекпот: Привет! Испытаешь удачу? " )
	Text( 1,  "Узнать про игру ", JumpPage, 2 )
	Text( 1,  "Играть в Джекпот ", OpenTiger )
	Talk( 2,  "Джекпот: Каждая игра требует минимум 5 Монет феи. Играть вы можете любое количество раз. Чем больше вы играете, тем выше шанс на победу! " )
end 
--------------------------------------СЄРИµДёЯёъР¬
function el_talk04 ()
	
	Talk( 1,  "Тощий рабочий: Эх... Ох... Кто бы мог помочь мне... " )-------------(2249,2705)
	AddNpcMission ( 919 )
end

-----------------------------------------------------------
---УЎµЪ°ІДЙЎ¤ЗнЛ№
-----------------------------------------------------------
function llleo_talk01()
	Talk( 1,  "Индиана Джонс: Я нашел тайну Мира дмонов. Вы хотите знать об этом?" )
	Text( 1,  "Узнать секрет ", JumpPage, 2)

	Talk( 2,  "Индиана Джонс: Ходит слух что Мир демонов состоит из 2 измерений, а значит вы можете быть в каждом из 2 измерений одновременно. И теперь есть другой способ распечатать предметы оттуда. Другие исследователи не знают о нем. Если вы хотите его попробовать, то я вам помогу. " )
	Text( 2,  "Снять печати ", JumpPage, 3)
	
	Talk( 3,  "Индиана Джонс: Распечатывание уникального снаряжения требует огромного количества энергии. Другие исследователи используют для этого энергию большого количества рун. Мне же достаточно энергии одной руны - Изменчивой руны. " )
	Text( 3,  "Посох потаенного ", JumpPage, 6)
	Text( 3,  "Накидка сфинкса ", JumpPage, 7)
	Text( 3,  "Крис сфинкса ", JumpPage, 8)
	Text( 3,  "Правосудие потаенного ", JumpPage, 9)
	Text( 3,  "Аркебуз потаенного ", JumpPage, 10)
	Text( 3,  "Накидка потаенного ", JumpPage, 11)
	Text( 3,  "Плащ потаенного ", JumpPage, 12)
	Text( 3,  "Дальше --> ", JumpPage, 4)

	Talk( 4,  "Индиана Джонс: Распечатывание уникального снаряжения требует огромного количества энергии. Другие исследователи используют для этого энергию большого количества рун. Мне же достаточно энергии одной руны - Изменчивой руны. " )
	Text( 4,  "Клинок потаенного ", JumpPage, 13)
	Text( 4,  "Тату потаенного ", JumpPage, 14)
	Text( 4,  "Доспех потаенного ", JumpPage, 15)
	Text( 4,  "Мантия сфинкса ", JumpPage, 16)
	Text( 4,  "Посох сфинкса ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1909, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1909, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 788, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 6,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1927, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1927, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 806, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 7,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1923, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1923, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 802, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 8,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1894, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1894, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 773, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 9,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1905, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1905, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 784, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 10,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1901, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1901, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 780, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 11,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1913, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1913, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 792, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 12,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1897, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1897, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 776, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 13,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1887, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1887, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 766, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 14,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1890, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1890, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 769, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 15,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1919, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1919, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 798, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 16,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1916, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1916, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 795, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "Индиана Джонс: Для снятия печати с этого предмета мне необходимо - запечатанный предмет, 1 Изменчивая руна и 800000 золота. " )
	Text( 17,  "Снять печать ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "Индианна Джонс: Простите, но у вас нет всех необходимых предметов. " )

end

function t_haos ()

	Talk( 1,  "Администратор Хаоса: В бою выживают лишь сильнейшие, и лишь сильнейшие получают уважение. " )
	Text( 1,  "Получить Медаль отваги ", JumpPage, 2)
	Text( 1,  "Получить награды ", JumpPage ,7)
	Text( 1,  "Посмотреть ТОП Хаоса ", Garner2GetWiner)
	Text( 1,  "Войти в ТОП Хаоса ", Garner2RequestReorder)
	Text( 1,  "Узнать о ранге Хаоса ", JumpPage ,3)
	Text( 1,  "Узнать о Хаосе Города Счастья ", JumpPage ,13)

	Talk( 2,  "Администратор Арены: Чтобы получить Медаль отваги вы должны быть 25 уровня и заплатить 50000 золота. Медаль отваги записывает все ваши победы и поражения в бою. После получения ее нельзя будет уничтожить. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 23 )
	Text( 2,  "Получить Медаль отваги ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Администратор Хаоса: Оцениваются все участники сражения, однако войти в список могут лишь пятеро сильнейших. " )
	Text( 3, "Узнать о очках Хаоса ",JumpPage ,4)
	Text( 3, "Узнать о экипировке Хаоса ",JumpPage ,6)


	Talk( 4,  "Администратор Хаоса: Вы можете получать очки Хаоса побеждая противников примерно вашего уровня. Все очки записываются в вашу Медаль отваги. " )
	Talk( 23,  "Администратор Хаоса: Простите но вы не подходите по требованию. Также возможно у вас уже есть Медаль отваги. " )
	Talk( 6,  "Администратор Хаоса: Набор Хаоса включает в себя Огненный камень Хаоса, Каменную руку Хаоса и Каменную ногу Хаоса. При ношении полного набора можно получить определенный бонус в зависимости от положение в ТОП Хаоса. " )

	Talk( 7,  "Администратор Хаоса: Обращайтесь ко мне, если хотите получить ценные вещи. " )
	Text( 7, "Получить Стандартную расписку Хаоса ",JumpPage ,8)
	Text( 7, "Получить Сундук Хаоса ",JumpPage ,9)
	Text( 7, "Обменять на Эмблему короля ринга ",JumpPage ,10)
	Text( 7, "Получить гайд ",SendExchangeXData)
	Text( 7, "Получить Символ Чести ",JumpPage ,12)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1031, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1031, 1 )
	TriggerAction( 1, GiveItem, 2609, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )

	Talk( 8,  "Администратор Хаоса: Необходимо 1 Святой эмблемы кольца " )
	Text( 8,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1032, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1032, 1 )
	TriggerAction( 1, GiveItem, 1134, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )
	
	Talk( 9,  "Chaos Администратор Арены: Необходимо 1 Эмблема короля ринга " )
	Text( 9,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1031, 5 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1031, 5 )
	TriggerAction( 1, GiveItem, 1032, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )

	Talk( 10,  "Администратор Хаоса: Необходимо 5 Святой эмблемы кольца" )
	Text( 10,  "Обменять ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 11,  "Администратор Хаоса: Найдите меня как соберете все необходимые предметы. Также не забудьте освободить 1 Свободное место в инвентаре. " )

	Talk( 12,  "Администратор Хаоса: Символы Чести это Сердце Искры, Отважное сердце и Сердце великолепия. Они требуют для получения 200, 2000 и 20000 очков репутации соответственно. " )
	Text( 12,  "Получить Сердце искры ", Change_shanyao)
	Text( 12,  "Получить Отважное сердце ", Change_rongyao)
	Text( 12,  "Получить Сердце великолепия ", Change_huihuang)

	Talk( 13,  "Администратор Хаоса: Хаос Города Счастья позволяет игрокам проводть свободные сражения на своей территории. Чтобы войти в Хаос Города Счастья игрок должен быть как минимум 20 уровня и больше, и небольшое количество золота. " )

	--Священный огонь
	AddNpcMission	(6268)
	AddNpcMission	(6269)

end 

function b_talk25 ()
	Popup( LifeSkillBegin , 3 )	

end 

function b_talk26 ()
	Popup( LifeSkillBegin , 2 )	

end 

function b_talk27 ()
	Popup( LifeSkillBegin , 0 )
end 

function b_talk28 ()
	Popup( LifeSkillBegin , 1 )	

end 

function leo_talkaa()
	Talk( 1,  "Посмотрите все наши изделия! Качество гарантируем! " )
	Text( 1,  "Посмотреть предметы ", SendExchangeXData)

	
	--¶Т»»ЛщРиОпЖ· ID,КэБї,¶Т»»ЛщµГОпЖ·КэБї,ёіУиµДЦµ
	InitExchangeX()

	ExchangeDataX(	3989	,	99	,	3999	,	20	,	1)
	ExchangeDataX(	3990	,	99	,	4000	,	20	,	1)
	ExchangeDataX(	3991	,	99	,	4001	,	20	,	1)
	ExchangeDataX(	3992	,	99	,	4002	,	20	,	1)
	ExchangeDataX(	3993	,	99	,	4003	,	20	,	1)
	ExchangeDataX(	3994	,	99	,	4004	,	20	,	1)
	ExchangeDataX(	3995	,	99	,	4005	,	20	,	1)
	ExchangeDataX(	3996	,	99	,	4006	,	20	,	1)
	ExchangeDataX(	3997	,	99	,	4007	,	20	,	1)
	ExchangeDataX(	3998	,	99	,	4008	,	20	,	1)

end

function leo_talkbb()
	Talk( 1,  "Продажа камней! Не подходите если не имеете при себе деньги! " )
	Text( 1,  "У меня есть деньги ", SendExchangeXData)

	
	--¶Т»»ЛщРиОпЖ· ID,КэБї,¶Т»»ЛщµГОпЖ·КэБї,ёіУиµДЦµ
	InitExchangeX()

	ExchangeDataX(	4029	,	99	,	4039	,	20	,	1)
	ExchangeDataX(	4030	,	99	,	4040	,	20	,	1)
	ExchangeDataX(	4031	,	99	,	4041	,	20	,	1)
	ExchangeDataX(	4032	,	99	,	4042	,	20	,	1)
	ExchangeDataX(	4033	,	99	,	4043	,	20	,	1)
	ExchangeDataX(	4034	,	99	,	4044	,	20	,	1)
	ExchangeDataX(	4035	,	99	,	4045	,	20	,	1)
	ExchangeDataX(	4036	,	99	,	4046	,	20	,	1)
	ExchangeDataX(	4037	,	99	,	4047	,	20	,	1)
	ExchangeDataX(	4038	,	99	,	4048	,	20	,	1)
	ExchangeDataX(	1670	,	99	,	1671	,	20	,	1)
	ExchangeDataX(	1668	,	99	,	3368	,	20	,	1)
	ExchangeDataX(	1667	,	99	,	3360	,	20	,	1)
	ExchangeDataX(	1642	,	99	,	1643	,	20	,	1)
	ExchangeDataX(	4825	,	99	,	1638	,	20	,	1)
	ExchangeDataX(	1633	,	99	,	1641	,	20	,	1)
	ExchangeDataX(	1782	,	99	,	1769	,	20	,	1)
	ExchangeDataX(	2815	,	99	,	1775	,	20	,	1)
	ExchangeDataX(	1674	,	99	,	1767	,	20	,	1)
	ExchangeDataX(	4832	,	99	,	2901	,	20	,	1)

end

function leo_talkcc ()
	Talk( 1,  "Не покупайте ничего у Торговца черного рынка. Он жульничает! Лучше покупайте у меня." )
	Text( 1,  "Дайте взглянуть на ваши вещи. ", SendExchangeXData)

	InitExchangeX()
	ExchangeDataX(	855	,	60	,	2617	,	1	,	1)
	ExchangeDataX(	2588	,	3	,	2619	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2622	,	1	,	1)
	ExchangeDataX(	2589	,	5	,	2624	,	1	,	1)
	ExchangeDataX(	2588	,	3	,	2640	,	1	,	1)
	ExchangeDataX(	855	,	60	,	2641	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2642	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2643	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2644	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2649	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1055	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1056	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1058	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1059	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1061	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1062	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1064	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1065	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2680	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2681	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2682	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2683	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2684	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2685	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2690	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2691	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2692	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2693	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2694	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2695	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2700	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2701	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2702	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2703	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2704	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2705	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2710	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2711	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2712	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2713	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2714	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2715	,	1	,	1)

end
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<єПіЙЅйЙЬФ±
-----ЅйЙЬФ±-А¶
function max_talka1()
	Talk( 1,  "Помощник: Привет, я помощник! Я могу помочь вам с проблемами, с которыми вы столкнетесь при использовании инструмента для анализа. " )
	Text( 1,  "Что за инструмент для анализа? ", JumpPage ,2)
	Text( 1,  "Я могу использовать анализатор? ", JumpPage ,7)
	Text( 1,  "Как работает анализатор? ", JumpPage ,3)
	Text( 1,  "Что можно анализировать? ", JumpPage ,4)
	Text( 1,  "Спасибо, я все знаю ", JumpPage ,6)

	Talk( 2,  "Помощник: Инструмент для анализа это таинственный инструмент. Он позволяет получить исходные компоненты любого предмета. " )
	Text( 2,  "Я хочу задать другой вопрос", JumpPage ,1)
	Text( 2,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 3,  "Помощник: Вы должны приготовить фею, инструмент и катализатор для анализа. Затем поместите все предметы в правильные ячейки. У феи должен быть соответствующий навык. " )
	Text( 3,  "Что будет если анализ провалится? ", JumpPage ,5)
	Text( 3,  "Вы кажется упомянули инструменты? ", JumpPage ,9)
	Text( 3,  "Я хочу задать другой вопрос ", JumpPage ,1)
	Text( 3,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 4,  "Помощник: Анализировать можно доспехи и оружие. Использование разных катализаторов приводит к получению разных предметов. " )
	Text( 4,  "Как можно получить катализатор? ", JumpPage ,8)
	Text( 4,  "Я хочу задать другой вопрос", JumpPage ,1)
	Text( 4,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 5,  "Помощник: Не волнуйтесь, использование анализатора совершенно безопасно. Однако при провале вы потеряете анализируемый предмет и катализатор. ")
	Text( 5,  "Я хочу задать другой вопрос ", JumpPage ,1)
	Text( 5,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 6,  "Помощник: Надеюсь у вас все пройдет удачно! ")
	Text( 6,  "Продолжить ", CloseTalk)

	Talk( 7,  "Помощник: Конечно вы можете. Только сначала вам придется купить руководство по анализу у бакалейщика. ")
	Text( 7,  "Я хочу задать другой вопрос ", JumpPage ,1)
	Text( 7,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 8,  "Помощник: Катализаторы можно получить у некоторых торговцев, а также как награду за квесты. " )
	Text( 8,  "Я хочу задать другой вопрос ", JumpPage ,1)
	Text( 8,  "Понятно... Вопросов больше нет. ", CloseTalk)

	Talk( 9,  "Помощник: Инструмент это необходимый для анализа предмет. Однако не забудьте что уровень инструмента для анализа должен быть не меньше уровня навыка анализа. " )
	Text( 9,  "Я хочу задать другой вопрос ", JumpPage ,1)
	Text( 9,  "Понятно... Вопросов больше нет. ", CloseTalk)

end

-----уф»рЖЕЖЕ
function max_talka2()
	Talk( 1,  "Бабушка Спичка: Привет! Я бабушка Спичка. Когда то давно я была самым известным поваром! ЧЕм я могу помочь? " )
	Text( 1,  "Я хочу узнать где я могу готовить ", JumpPage ,2)
	Text( 1,  "Я могу научится кулинарии? ", JumpPage ,3)
	Text( 1,  "Вы можете научить меня готовить? ", JumpPage ,4)
	Text( 1,  "Для этого нужно что то особое? ", JumpPage ,5)
	Text( 1,  "Я просто проходил мимо... ", JumpPage ,6)

	Talk( 2,  "Бабушка Спичка: Для приготовления пищи вам необходим огонь. Огнем нужно дорожить! " )
	Text( 2,  "Задать другие вопросы ", JumpPage ,1)
	Text( 2,  "Спасибо бабушка, я все понял. ", CloseTalk)

	Talk( 3,  "Бабушка Спичка: Да, конечно. Но сначала вы должны изучать соответствующий навык. Книгу навыка можно приобрести у бакалейщика. " )
	Text( 3,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 3,  "Спасибо бабушка, я все понял. ", CloseTalk)

	Talk( 4,  " Бабушка Спичка: Кулинария - сложный навык. Во первых вам необходим Кристальный котел. Также необходима фея с соответствующим навыком, рецепт и все компоненты. Затем необходимо правильно разложить все ингридиенты. Не забывайте также что пища может как недоварится, так и сгореть! " )
	Text( 4,  "When will the fire be just nice? ", JumpPage ,7)
	Text( 4,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 4,  "Спасибо бабушка, я все понял. ", CloseTalk)

	Talk( 5,  "Бабушка Спичка: Если пища готовится при правильной температуре, то она имеет не только приятный вкус, но и особую силу. " )
	Text( 5,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 5,  "Спасибо бабушка, я все понял. ", CloseTalk)

	Talk( 6,  "Бабушка Спичка: Надеюсь у вас все пройдет великолепно! ")
	Text( 6,  "I'm really just passing by ", CloseTalk)

	Talk( 7,  "Бабушка Спичка: Самый лучший результат вы получите примерно на 75% варки пищи. Не забывайте об этом! ")
	Text( 7,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 7,  "Спасибо бабушка, я все понял. ", CloseTalk)

end

-----ИЫВЇјјК¦Ў¤Г·їЛ
function max_talka3()
	Talk( 1,  "Ремесленник печи: Привет! Вы ищете меня? " )
	Text( 1,  "Скажите что может делать печь ", JumpPage ,2)
	Text( 1,  "Как использовать печь? ", JumpPage ,3)
	Text( 1,  "Скажите тайну печи ", JumpPage ,4)
	Text( 1,  "Я просто проходил мимо ", JumpPage ,5)


	Talk( 2,  "Ремесленник печи: Печь используется для изготовления экипировки. " )
	Text( 2,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 2,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 3,  "Ремесленник печи: Чтобы использовать печь вам необходимо выучить навык ремесла. Книгу навыка вы можете приобрести у бакалейщика. " )
	Text( 3,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 3,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 4,  "Ремесленник печи: Вы должны иметь фею с соответствующим навыком. Кроме того вам потребуется инструмент, чертеж и все необходимые компоненты. Не забудьте рассатвить компоненты в правильном порядке. " )
	Text( 4,  "Как делать лучшие вещи? ", JumpPage ,7)
	Text( 4,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 7,  "Ремесленник печи: В процессе производства вы можете получить предметы с магическими свойствами. Однако это потребует большого количество материалов и более высокий навык питомца. " )
	Text( 7,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 7,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 5,  "Ремесленник печи: Вы волк? Так зачем тут гуляете? ")
	Text( 5,  "Я только проходил мимо... ", CloseTalk)

end

-----СРѕїЙъ
function max_talka4()
	Talk( 1,  "Специалист: Привет! Что я могу для вас сделать? " )
	Text( 1,  "Что это рядом с вами?", JumpPage ,2)
	Text( 1,  "Я могу использовать Генератор материи? ", JumpPage ,3)
	Text( 1,  "Как работает Генератор материи? ", JumpPage ,4)
	Text( 1,  "Что может произвести генератор? ", JumpPage ,5)
	Text( 1,  "Я просто прохожу мимо ", JumpPage ,6)


	Talk( 2,  "Специалист: Это наше последнее изобретение - Генератор вещества. Мы используем его для очистки металлов. " )
	Text( 2,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 2,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 3,  "Специалист: Сначала изучите навык производства. Книгу навыка можно купить у бакалейщика. " )
	Text( 3,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 3,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 4,  "Специалист: Вам необходимо иметь фею с соответствующим навыком. Кроме тоговам нужен инструмент, ертеж и все необходимые компоненты. " )
	Text( 4,  "Какой может быть результат? ", JumpPage ,7)
	Text( 4,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 4,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 5,  "Специалист: Можно произвести различные предметы. Если все компоненты разложены в правильном порядке, то вы не будете разочарованы в результате. " )
	Text( 5,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 5,  "Спасибо! Я все понял. ", CloseTalk)

	Talk( 6,  "Специалист: Похоже это вы... ")
	Text( 6,  "Я просто прохожу мимо... ", CloseTalk)

	Talk( 7,  "Специалист: Поскольку мы не всемогущи, то и продукт не всегда получается идеальным. ЧТобы отличить качество продукта были сделаны соответствующие метки. ")
	Text( 7,  "Я хочу задать другие вопросы ", JumpPage ,1)
	Text( 7,  "Спасибо! Я все понял. ", CloseTalk)
end

---------------------КҐµ®Кч
function el_talk05 ()
	
	Talk( 1,  "Рождественская ель: С Новым годом тебя! Каждая добрая душа получит благословление! " )
	Text( 1,  "Получить благословление ",JumpPage, 2  )
	
	Talk ( 2,  "Рождественская ель: Вы хотите получить ваше благословление? Это потребует 1 Рождественскую открытку и 1000 золота. " )
	Text( 2,  "Я хочу получить свое благословление ",JumpPage, 3  )
	
	Talk( 3,  "Рождественская ель: Да благославит вас Бог в этом году! Пусть вам улыбается удача! ")
	Text(3, "Я хочу получить благословление ",  GetChaName_0, 1)
	Text( 3,  "Дальше --> ",JumpPage, 6  )

	Talk( 6,  "Рождественская ель: Да благославит вас Бог в этом году! Пусть вам улыбается удача! ")
	Text(6, "Я хочу получить благословление ",  GetChaName_1, 1)
	Text( 6,  "Дальше --> ",JumpPage, 7  )
	Text( 6,  "<-- Назад ",JumpPage, 3  )

	Talk( 7,  "Рождественская ель: Да благославит вас Бог в этом году! Пусть вам улыбается удача! ")
	Text(7, "Я хочу получить благословление ",  GetChaName_2, 1)
	Text( 7,  "Дальше --> ",JumpPage, 8  )
	Text( 7,  "<-- Назад ",JumpPage, 6  )

	Talk( 8,  "Рождественская ель: Да благославит вас Бог в этом году! Пусть вам улыбается удача! ")
	Text(8, "Я хочу получить благословление ",  GetChaName_3, 1)
	Text( 8,  "<-- Назад ",JumpPage, 7  )
---------------------------------------------------------------------------------------------------------------	
end

----------------------------------------»фЅрЛ№-------------------------
--------------------------------јЕДЇЦ®Лю6Іг(51300,26900)
--------------------------------------eleven------------------------------------------
function el_talk07 ()

	InitTrigger()
	TriggerCondition( 1, HasMission, 1300 )
	TriggerCondition( 1, LvCheck,  "> ", 74 )
	TriggerCondition( 1, HasCredit,9999 )
	TriggerCondition( 1, NoRecord, 1300 )
	TriggerCondition( 1, NoRecord, 1301 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, CloseTalk  )

	Talk( 1,  "Хаскинсон: Я машина смерти! Не заговаривай со мной если у тебя меньше 75 уровня и 9999 очков репутации. " )
	Text( 1,  "Привет! ",MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2,  "Хаскинсон: Чтобы получить фрагменты вы должны ответить на несколько вопросов! Какая из этих историй связана с поисками пропавшего мальчика? " )
	Text( 2,  "Отравление еды ",JumpPage, 3  )
	Text( 2,  "Пропавшие инструменты ",JumpPage, 4  )
	Text( 2,  "Причина сумасшествия ",JumpPage, 3  )---------
	Text( 2,  "Убийство грибов ",JumpPage, 32  )

	Talk( 3,  "Хаскинсон: Не будьте так высокомерны! Дальше... Кто любит Эндрю? " )
	Text( 3,  "Кодди ",JumpPage, 4  )
	Text( 3,  "Жоу ",JumpPage, 32  )
	Text( 3,  "Маленькая рыбка ",JumpPage,5  )
	Text( 3,  "Ян Бин ",JumpPage, 2  )
	Text( 3,  "Хами ",JumpPage, 4  )--------------
	Text( 3,  "Ли Жанг Йонг ",JumpPage, 4  )

	Talk( 4,  "Хаскинсон: Что из ниже перечисленного является ингридиентом для производства?" )
	Text( 4,  "Темная кровь выползня и Чистая вода ",JumpPage, 5  )
	Text( 4,  "Шкура кровавого выползня и Чай-бодрячок ",JumpPage, 5  )
	Text( 4,  "Кровь зловещего выползня и Стимулятор ",JumpPage, 2  )
	Text( 4,  "Кровь прозрачного выползня и Чистая вода ",JumpPage, 32 )
	Text( 4,  "Толстый хвост прозрач. выползня ",JumpPage, 6  )
	Text( 4,  "Чай-бодрячок и Стимулятор ",JumpPage, 19  )-----------
	Text( 4,  "Кровь зловещего выползня ",JumpPage, 5  )


	Talk( 5,  "Хаскинсон: Любовный подарок от таинственной бабушки это...? " )
	Text( 5,  "Кристальная слеза ",JumpPage, 32  )
	Text( 5,  "Слеза Камня правды ",JumpPage, 6  )
	Text( 5,  "Камень Ланга ",JumpPage, 3  )
	Text( 5,  "Янтарная слеза ",JumpPage, 22  )----------
	Text( 5,  "Сад камня Кануна ",JumpPage, 7  )
	Text( 5,  "Слеза Кары ",JumpPage, 7  )
	Text( 5,  "Слеза первой любви ",JumpPage, 32  )

	Talk( 6,  "Хаскинсон: Какие отношения между Анубисом и Ричи? " )
	Text( 6,  "Отец и сын ",JumpPage, 4  )
	Text( 6,  "Дед и внук ",JumpPage, 8  )
	Text( 6,  "Братья ",JumpPage, 7  )
	Text( 6,  "Любимые ",JumpPage, 32  )
	Text( 6,  "Нет отношений ",JumpPage, 32  )
	Text( 6,  "Дальние родственники ",JumpPage, 32  )
	Text( 6,  "Кузены ",JumpPage, 7  )-----------------
	Text( 6,  "Сестры ",JumpPage, 7  )

	Talk( 7,  "Хаскинсон: Для чего используют Демонический фрукт? " )
	Text( 7,  "Для свадьбы фей ",JumpPage, 32  )
	Text( 7,  "Как Яблоко ",JumpPage, 8  )----------
	Text( 7,  "Для демонов ",JumpPage, 9  )
	Text( 7,  "Для управления фруктами демонов ",JumpPage, 5  )
	Text( 7,  "Для закалки ",JumpPage, 32  )

	Talk( 8,  "Хаскинсон: Кем Голди работал раньше? " )
	Text( 8,  "Мясником ",JumpPage, 3  )
	Text( 8,  "Звездой кино ",JumpPage, 32  )
	Text( 8,  "Преподавателем ",JumpPage, 32  )
	Text( 8,  "Моделью ",JumpPage, 9  )--------
	Text( 8,  "ГМом ",JumpPage, 7  )
	Text( 8,  "Директором компании ",JumpPage, 9  )

	Talk( 9,  "Хаскинсон: Какое утверждение из ниже указанных верное? " )
	Text( 9,  "Вы будете сожалеть выбрав меня ",JumpPage, 4  )
	Text( 9,  "Хами - незаконный мын Санг Ди ",JumpPage, 10 )-----------
	Text( 9,  "Белди не умеет печь пироги ",JumpPage, 32  )
	Text( 9,  "Санг Ди живет дольше Таинственной бабушки ",JumpPage, 23 )
	Text( 9,  "Верховный жрец был раньше пиратом ",JumpPage, 6  )

	Talk( 10,  "Хаскинсон: Торговец Черного рынка был обычным. Это было...  " )
	Text( 10,  "10 лет назад ",JumpPage, 5  )
	Text( 10,  "Полгода назад ",JumpPage, 5  )
	Text( 10,  "Когда он торговал антиквариатом ",JumpPage, 32 )
	Text( 10,  "Когда он только пришел в Ледынь ",JumpPage, 8  )
	Text( 10,  "Прежде чем он влюбился в Донну ",JumpPage, 11  )-----------
	Text( 10,  "После того как был брошен Донной",JumpPage, 32  )
	Text( 10,  "Когда учился в институте Торговцев Черного рынка ",JumpPage, 8  )


	Talk( 11,  "Хаскинсон: Как вы думаете какой НПС Паппа? " )
	Text( 11,  "25 летний симпатичный парень ",JumpPage, 32 )
	Text( 11,  "Нежная девушка ",JumpPage, 30  )
	Text( 11,  "Жестокая девочка-сорванец ",JumpPage, 13  )
	Text( 11,  "Страшный брачный аферист ",JumpPage, 2  )
	Text( 11,  "Счастливая симпатичная девушка ",JumpPage, 13  )---------------
	Text( 11,  "Очаровательный идол ",JumpPage, 32  )
	Text( 11,  "Нет правильных ответов. ",JumpPage, 28  )

	Talk( 30,  "Хаскинсон: Вы очень глубоко заблуждаетесь!"  )
	Text( 30,  "Далее --> ",JumpPage, 32  )
	Talk( 31,  "Хаскинсон: Не позволяйте ей узнать что вы выбрали этот ответ!" )
	Text( 31,  "Далее --> ",JumpPage, 32  )



	--Talk( 12,  "Хаскинсон: Which of the below description is wrong? " )
	--Text( 12,  "Minelli is the High Priest's secretary ",JumpPage, 32 )
	--Text( 12,  "You can win Black Dragon equipment from Lucky Chance ",JumpPage, 3 )
	--Text( 12,  "Ditto knows how to concort the Reverse Love Potion. ",JumpPage,8 )
	--Text( 12,  "Roland is the most desired lover ",JumpPage, 10 )
	--Text( 12,  "Kentaro feels that Mas is a very clever person ",JumpPage, 13 )---------------
	--Text( 12,  "Horrific Cursed Corpse is near Ascaron at (360, 1340) ",JumpPage, 5 )
	--Text( 12,  "Merman Prince used to be just a frog ",JumpPage, 13 )
	--Text( 12,  "Minelli used to be Carsise's lover ",JumpPage, 13 )

	Talk( 13,  "Хаскинсон: Что из ниже сказанного неверно? " )
	Text( 13,  "Клещи кузнеца необходимы для извлечения ",JumpPage, 5 )
	Text( 13,  "Каждый самоцвет извлекается поочередно ",JumpPage, 3 )
	Text( 13,  "Число слотов не изменяется после извлечения самоцвета ",JumpPage, 32 )
	Text( 13,  "Стоимисть извлечения- уровень предмета*1000 золота ",JumpPage, 14 )
	Text( 13,  "Вы можете начать извлекать только из 1 слота ",JumpPage, 10 )
	Text( 13,  "Уровень извлеченного самоцвета ниже чем вставленного в слот ",JumpPage, 14 )-----------------
	Text( 13,  "Все вышеназванное неверно ",JumpPage, 8 )

	Talk( 14,  "Хаскинсон: Кто знает тайну самородной серы? " )
	Text( 14,  "Хьюстон ",JumpPage, 4 )
	Text( 14,  "Ланга и Таинственная бабушка ",JumpPage, 32 )
	Text( 14,  "Морской принци и Лазурная сирена ",JumpPage, 7 )
	Text( 14,  "Дитто и Таинственная бабушка ",JumpPage, 15 )
	Text( 14,  "Дитто и Ланга ",JumpPage, 15 )-----------------
	Text( 14,  "Таинственная бабушка и Морской принц ",JumpPage, 8 )
	Text( 14,  "Хьюстон и Морской принц ",JumpPage, 12 )


	Talk( 15,  "Хаскинсон: какая из нижеуказанных трав имеет побочный эффект? " )
	Text( 15,  "Восстанавливающее зелье ",JumpPage,13 )
	Text( 15,  "Оживляющий клевер ",JumpPage, 32 )
	Text( 15,  "Капсула памяти ",JumpPage, 16 )--------------
	Text( 15,  "Отворотное зелье ",JumpPage, 5 )
	Text( 15,  "Суп памяти ",JumpPage, 4 )
	Text( 15,  "Волшебная костная мука ",JumpPage, 16 )
	Text( 15,  "Защитное средство ",JumpPage, 9 )

	Talk( 16,  "Хаскинсон: Что правильно? " )
	Text( 16,  "Таинственная бабушка: Я люблю Ланга ",JumpPage, 32 )
	Text( 16,  "Генерал Вильям: Маска Зорро не у меня. ",JumpPage, 17 )-----------
	Text( 16,  "Ланга: Таинственная бабуля не в моем сердце.",JumpPage, 17 )
	Text( 16,  "Паппа: Я была красавицей прежде чем стала пингвином. ",JumpPage, 5 )
	Text( 16,  "Санг Ди: Я знаю как говорить на языке, который не понимают люди. ",JumpPage, 10 )
	Text( 16,  "Мордо младший: У меня родители не только Мордо ",JumpPage, 15 )

	Talk( 17,  "Хаскинсон: Вы любите играть в эту игру? " )
	Text( 17,  "Люблю ",JumpPage, 32 )
	Text( 17,  "Я очень люблю ",JumpPage, 32 )
	Text( 17,  "Я обожаю ",JumpPage, 32 )
	Text( 17,  "Я люблю! ",JumpPage, 32 )
	Text( 17,  "Я люблю!! ",JumpPage, 18 )-----------------
	Text( 17,  "Я люблю!!! ",JumpPage, 5 )
	Text( 17,  "Пока еще люблю... ",JumpPage, 15 )

	Talk( 18,  "Хаскинсон: Какую вредную привычку имеет верховный жрец? " )
	Text( 18,  "Плакать ",JumpPage, 5 )
	Text( 18,  "Ковыряться в носу ",JumpPage, 14 )
	Text( 18,  "Подглядывать ",JumpPage, 2 )
	Text( 18,  "Пить ",JumpPage, 9 )
	Text( 18,  "Курить ",JumpPage, 12 )
	Text( 18,  "Играть в азартные игры ",JumpPage, 10 )
	Text( 18,  "Ходить в туалет ",JumpPage, 12 )------------------
	Text( 18,  "Мыть руки ",JumpPage, 4 )


	Talk( 19,  "Хаскинсон: Вы уверены насчет своего выбора? " )
	Text( 19,  "Я уверен ",JumpPage, 21  )
	Text( 19,  "Я выбрал неверно ",JumpPage, 20  )
	Text( 19,  "Я должен подумать ",JumpPage, 32  )

	Talk( 20,  "Хаскинсон: Пожалуйста пробуйте снова " )
	Text( 20,  "Дальше -->",JumpPage, 3  )

	Talk( 21,  "Хаскинсон: Уверенность это главное для пирата! " )
	Text( 21,  "Подтвердить ",JumpPage, 5  )

	Talk( 22,  "Хаскинсон: Вы уверены насчет своего выбора? " )
	Text( 22,  "Я уверен ",JumpPage, 24  )
	Text( 22,  "Я выбрал неверно ",JumpPage, 20  )
	Text( 22,  "Я должен подумать ",JumpPage, 32  )


	Talk( 23,  "Хаскинсон: Вы уверены насчет своего выбора? " )
	Text( 23,  "Я уверен ",JumpPage, 25  )
	Text( 23,  "Я выбрал неверно ",JumpPage, 8  )
	Text( 23,  "Я должен подумать ",JumpPage, 32  )

	Talk( 24,  "Хаскинсон: Вера - это главное чтобы стать пиратом! ")
	Text( 24,  "Дальше -->",JumpPage, 6   )
	Talk( 25,  "Хаскинсон: Пожалуйста используйте мозг. Не всегда выбирайте тот же ответ! ")
	Text( 25,  "Дальше -->",JumpPage, 32  )

	Talk( 26,  "Хаскинсон: Вы уверены насчет своего выбора? " )
	Text( 26,  "Я уверен ",JumpPage, 28  )
	Text( 26,  "Я выбрал неверно ",JumpPage, 27  )
	Text( 26,  "Я должен подумать ",JumpPage, 32  )

	Talk( 27,  "Хаскинсон: Это движение позволит вам сэкономить время. "   )
	Text( 27,  "Дальше -->",JumpPage, 12  )

	Talk( 28,  "Хаскинсон: Вы слишком самонадеянны. Это не достоинство пирата. "  )
	Text( 28,  "Дальше -->",JumpPage, 32  )



	InitTrigger()
	TriggerCondition( 1, HasMission, 1300 )
	TriggerCondition( 1, NoRecord, 1300 )
	TriggerAction( 1, SetRecord, 1301 )
	TriggerAction( 1, JumpPage, 29 )
	
	Talk( 12,  "Хаскинсон: Я думаю эти загадки интересны. Вы хотите попробовать? "  )
	Text( 12,  "Хочу ",MultiTrigger, GetMultiTrigger(), 1  )
	Text( 12,  "Нет ",JumpPage, 2  )

	Talk( 29,  "Хаскинсон: Поздравляю! Ваша мудрость дарует вам фрагменты! Идите и докажите свою силу. " )

	Talk(32,  "Хаскинсон: Вы так глупы? " )
	Text( 32,  "Нет, я хочу попробовать снова! ",JumpPage, 2  )
	Text( 32,  "Я глупец, пожалуй лучше уйду. ",CloseTalk  )
	AddNpcMission	(6001)
	AddNpcMission	(6002)
	
		
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<»фЅрЛ№



----------------------------------------НРВнЛ№Ў¤НјНј-------------------------
--------------------------------Д§·ЅКАЅз¶юІг(26600,25900)
--------------------------------------eleven------------------------------------------

function el_talk08 ()


	Talk( 1,  "Томас Туту: Организовываем тур! 3 дня и 2 ночи в Пещере демонов. Действуют скидки! " )
	 
	 AddNpcMission	(6010)
	AddNpcMission	(6011)
	AddNpcMission	(6012)
	AddNpcMission	(6013)
	AddNpcMission	(6014)

	end
	-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<НРВнЛ№Ў¤НјНј
	
	--ЙсК№
	
function Leo_talkQ()
	Talk(1, "Представитель порядка, закона и правосудия! Я помогу вам связаться с ГМом. ")
	Text(1, "Узнать подробности ",JumpPage,2)
	Text(1, "Задать вопрос " , OpenGMSend)
	Text(1, "Проверить ответы " , OpenGMRecv)
	
	Talk(2, "Я помощник ГМов. Я передаю им вопросы и возвращаю назад ответы от них. Вопрос не должен иметь больше 256 знаков или 128 слов. Одновременно вы можете задать лишь 1 вопрос. Пока вы не получите на него ответа задать другой вы не сможете. Пожалуйста задавайте вопросы только асательно игры! ")
	Text(2, "Я понял " , CloseTalk)
end


-------------------------bargi-----------------------------
function smzh_talk ()

Text( 1, "Вернутся в Шайтан ", GoTo, 891, 3575, "magicsea" )
Text( 1, "Информация по Пустыни ", JumpPage, 2)

	Text( 2, "Монстры ", JumpPage, 3)
	Text( 2, "Боссы ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Всадник ", JumpPage, 5)
	Text( 3, "Древопризрак ", JumpPage, 6)
	Text( 3, "Военная Черепаха ", JumpPage, 7)
	Text( 3, "Страж Реликвий ", JumpPage, 8)
	
	Talk( 4, "В данный момент здесь присутствуют: " )
	Text( 4, "Рыцарь Пустыни ", JumpPage, 9)
	Text( 4, "Сундук Пустыни ", JumpPage, 10)

	Talk( 5, "Всадник,время воскрешения - 5 минут,список выпадаемых предметов: " )
	Text( 5, "Расписка на самоцвет +7 ", CloseTalk)
	Text( 5, "Расписка на Реф ", CloseTalk)
	Text( 5, "Руна Кэль ", CloseTalk)
	Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 5, "10 Репутации ", CloseTalk)
	Text( 5, "Сундук Заточки ", CloseTalk)
	Text( 5, "Купюра достоинством 10 тысяч ", CloseTalk)
	Text( 5, "Купюра достоинством 50 тысяч ", CloseTalk)
	Text( 5, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 5, "Черная Жемчужина ", CloseTalk)

	Talk( 6, "Древопризрак,время воскрешения - 5 минут,список выпадаемых предметов: " )
	Text( 6, "Расписка на самоцвет +7 ", CloseTalk)
	Text( 6, "Расписка на Реф ", CloseTalk)
	Text( 6, "Руна Кэль ", CloseTalk)
	Text( 6, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 6, "10 Репутации ", CloseTalk)
	Text( 6, "Сундук Заточки ", CloseTalk)
	Text( 6, "Купюра достоинством 10 тысяч ", CloseTalk)
	Text( 6, "Купюра достоинством 50 тысяч ", CloseTalk)
	Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 6, "Черная Жемчужина ", CloseTalk)
	
	Talk( 7, "Военная Черепаха,время воскрешения - 5 минут,список выпадаемых предметов: " )
	Text( 7, "Расписка на самоцвет +7 ", CloseTalk)
	Text( 7, "Расписка на Реф ", CloseTalk)
	Text( 7, "Руна Кэль ", CloseTalk)
	Text( 7, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 7, "10 Репутации ", CloseTalk)
	Text( 7, "Сундук Заточки ", CloseTalk)
	Text( 7, "Купюра достоинством 10 тысяч ", CloseTalk)
	Text( 7, "Купюра достоинством 50 тысяч ", CloseTalk)
	Text( 7, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 7, "Черная Жемчужина ", CloseTalk)
	
	Talk( 8, "Страж Реликвий,время воскрешения - 5 минут,список выпадаемых предметов: " )
	Text( 8, "Расписка на самоцвет +7 ", CloseTalk)
	Text( 8, "Расписка на Реф ", CloseTalk)
	Text( 8, "Руна Кэль ", CloseTalk)
	Text( 8, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 8, "10 Репутации ", CloseTalk)
	Text( 8, "Сундук Заточки ", CloseTalk)
	Text( 8, "Купюра достоинством 10 тысяч ", CloseTalk)
	Text( 8, "Купюра достоинством 50 тысяч ", CloseTalk)
	Text( 8, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 8, "Черная Жемчужина ", CloseTalk)

	Talk( 9, "Рыцарь Пустыни,время воскрешения - 40 минут,список выпадаемых предметов: " )
	Text( 9, "Карта Рыцаря Пустыни ", CloseTalk)
	Text( 9, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 9, "Купюра достоинством 500 тысяч ", CloseTalk)
	Text( 9, "Ключ Пурпурного Кристалла ", CloseTalk)
	Text( 9, "Сундук Пурпурного Кристалла ", CloseTalk)
	Text( 9, "50 Репутации ", CloseTalk)
	Text( 9, "Свиток Удачи ", CloseTalk)
	Text( 9, "Сундук Кэлей (100 штук) ", CloseTalk)
	Text( 9, "Свиток Перефоржа ", CloseTalk)
	
	Talk( 10, "Сундук Пустыни,время воскрешения - 1 час,список выпадаемых предметов: " )
	Text( 10, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 10, "Расписка на самоцвет +7 от 1 до 8 штук", CloseTalk)
	Text( 10, "Расписка на самоцвет +20 ", CloseTalk)
end 

function leo_talkzz ()
	Talk(1, "Привет! Я НПС поддержки. Я помогаю игрокам решить некоторые проблемы. ")
	Text( 1, "Проблема с Картой перерождения ",JumpPage,3)
	 
	Talk(3,  "Привет! У вас проблема с Картой перерождения? Такое иногда случается. У меня вы можете восстановить свою карту. ")
	Text( 3,  "Восстановить ",GetChaName_25, 1) 
end



function simplepro_01 () 

	Talk( 1, "Привет! У меня есть большой выбор фей, и всё для их роста и развития." )
	Text( 1, "Хочу хочу ", BuyPage)
	Text( 1,  "Свадьба фей ", OpenEidolonMetempsychosis )

	InitTrade()
	Weapon(	3918	)
	Weapon(	3919	)
	Weapon(	3920	)
	Weapon(	3921	)
	Weapon(	3922	)
	Weapon(	3924	)
	Weapon(	3925	)
	Defence(	0679	)
	Defence(	0244	)
	Defence(	0247	)
	Defence(	0250	)
	Defence(	0253	)
	Defence(	0260	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Defence(	0578	)
 	Other( 4531 )
 	Other( 3435 )
 	Other( 4540 )
 	Other( 3443 )
 	Other( 1196 )
 	Other( 3436 )
 	Other( 4533 )
	Other( 3437 )
 	Other( 1253 )
 	Other( 3442 )
 	Other( 4537 )
 	Other( 3444 )
 	Other( 4530 )
 	Other( 3434 )




end

function ghfr()

	Talk(1, "Привет! Выбери место, куда ты хочешь отправиться:")
	Text(1, "4 аббадон ! ", GoTo, 153, 905, "jialebi")
	Text(1, "5 аббадон !", GoTo, 27, 26, "hell") 
	Text(1, "6 аббадон !", GoTo, 220, 26, "hell")
	Text(1, "7 аббадон !", GoTo, 230, 150, "hell") 
	Text(1, "8 аббадон !", GoTo, 110, 230, "hell")
  	Text(1, "Следущая страница ",JumpPage,2)
	Text(2, "10 аббадон !", GoTo, 31, 31, "hell3")
	Text(2, "11 аббадон !", GoTo, 153, 32, "hell3")
	Text(2, "12 аббадон !", GoTo, 269, 30, "hell3")
	Text(2, "13 аббадон !", GoTo, 30, 150, "hell3")
	Text(2, "14 аббадон !", GoTo, 273, 151, "hell3")
  	Text(2, "Следущая страница ",JumpPage,3)
	Text(3, "15 аббадон !", GoTo, 31, 269, "hell3")
	Text(3, "16 аббадон !", GoTo, 150, 269, "hell3")
	Text(3, "17 аббадон !", GoTo, 273, 266, "hell3")
	Text(3, "Логово БД !", GoTo, 769, 667, "eastgoaf")
	Text(3, "Уйти", CloseTalk)

end

function ghfr1()

	Talk(1, "Привет! Выбери место, куда ты хочешь отправиться:")
	Text(1, "Одинокая башня 2 ", GoTo, 35, 21, "lonetower") 
	Text(1, "Одинокая башня 3 ", GoTo, 120, 406, "lonetower")
	Text(1, "Одинокая башня 4 ", GoTo, 320, 175, "lonetower") 
	Text(1, "Одинокая башня 5 ", GoTo, 483, 121, "lonetower")
	Text(1, "Одинокая башня 6 ", GoTo, 494, 297, "lonetower")
	Text(3, "Уйти", CloseTalk)

end

function ghfr2()

	Talk(1, "Привет! Выбери место, куда ты хочешь отправиться:")
	Text(1, "Скалистый удел ", GoTo, 1517, 3091, "garner")
	Text(1, "Андийский лес ", GoTo, 1007, 2966, "garner")
	Text(1, "Валхаллу ", GoTo, 1120, 2773, "garner")
	Text(1, "Обитель радости ", GoTo, 535, 2433, "garner")
	Text(1, "Халдийский оплот ", GoTo, 633, 2100, "garner")
	Text(3, "Уйти", CloseTalk)

end

function ghfr7()

	Talk(1, "Привет! Выбери место, куда ты хочешь отправиться:")
	Text(1, "Заброшенная шахта ", GoTo, 1903, 2807, "garner")
	Text(3, "Уйти", CloseTalk)

end


function lala ()

	Talk( 1,  "Привет, я записываю точку возрождения здесь! " )
	Text( 1,  "Записать точку возвращения ", SetSpawnPos,  "Arenaa")

end

function ghfr10()

	Talk(1, "Привет! Выбери место, куда ты хочешь отправиться:")
	Text(1, "Заброшенная шахта ", GoTo, 2232, 2787, "garner")
	Text(1, "Уйти", CloseTalk)

end

function r_bilet ()
	
	Talk( 1,  "Старик:Привет! Интересуешься мирными навыками? Выбирай... " )
	Text( 1,  "Торг ", BuyPage )
   
	Weapon(	3296	)
	Weapon(	3226    )
	Weapon(	3225	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	3288	)
	Defence( 3279	)

AddNpcMission	(221)
AddNpcMission	(222)

end

function leo_talkaa()
	Talk( 1,  "Посмотрите все наши изделия! Качество гарантируем! " )
	Text( 1,  "Посмотреть предметы ", SendExchangeXData)

	
	--¶Т»»ЛщРиОпЖ· ID,КэБї,¶Т»»ЛщµГОпЖ·КэБї,ёіУиµДЦµ
	InitExchangeX()

	ExchangeDataX(	3989	,	99	,	3999	,	20	,	1)
	ExchangeDataX(	3990	,	99	,	4000	,	20	,	1)
	ExchangeDataX(	3991	,	99	,	4001	,	20	,	1)
	ExchangeDataX(	3992	,	99	,	4002	,	20	,	1)
	ExchangeDataX(	3993	,	99	,	4003	,	20	,	1)
	ExchangeDataX(	3994	,	99	,	4004	,	20	,	1)
	ExchangeDataX(	3995	,	99	,	4005	,	20	,	1)
	ExchangeDataX(	3996	,	99	,	4006	,	20	,	1)
	ExchangeDataX(	3997	,	99	,	4007	,	20	,	1)
	ExchangeDataX(	3998	,	99	,	4008	,	20	,	1)

end

function t_ecxange ()
Talk( 1, "Пингвинчик: Приветствую тебя, пират меня решили прокачать и добавить обмен кэлей а так же новой валюты на уникальные сундуки с аппарелями,совсем скоро подходи " )
--Text( 1, "Посмотреть ассортимент. ", SendExchangeData)
Text( 1, "Жду ", CloseTalk)
    InitExchange() 
    ExchangeData(    7459    ,    1    ,    2842    ,    1    ,    1) 
	ExchangeData(    3457    ,    500    ,    7487    ,    1    ,    1)
	ExchangeData(    7461    ,    1    ,    7488    ,    1    ,    1) 
	ExchangeData(    7461    ,    1    ,    7531    ,    1    ,    1) 
	ExchangeData(    7498    ,    1    ,    7497    ,    1    ,    1) 
	ExchangeData(    7499    ,    1    ,    7500    ,    1    ,    1) 
	
end

function t_jora ()   
Talk( 1, "Приветствую тебя, герой!_Чем тебе помочь? ")    
Text( 1, "Оружие Смерти (100 уровень) ",JumpPage,2)
Text( 1, "Экипировка Смерти (100 уровень) ",JumpPage,3)
Text( 1, "Уйти. ", CloseTalk )


Talk(2,"Комплект Оружия Смерти будет стоить 250 Рун Кэль,100 Чёрных Жемчужин,1 Карту Главного Юного Кактуса,100 Репутации и 10.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,250 )
TriggerCondition( 1, HasItem,3362,100 )
TriggerCondition( 1, HasItem,7704,1 )
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasMoney, 10000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,250 )
TriggerAction( 1, TakeItem, 3362,100 )
TriggerAction( 1, TakeItem, 7704,1 )
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, TakeMoney, 10000000 )
TriggerAction( 1, GiveItem, 2842,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 4)
Text(2,"Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(3,"Комплект Экипировки Смерти будет стоить 500 Рун Кэль,100 Чёрных Жемчужин,1 Карту Песчаного Разбойника,100 Репутации и 10.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 )
TriggerCondition( 1, HasItem,3362,100 )
TriggerCondition( 1, HasItem,7761,1 )
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasMoney, 10000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,500 )
TriggerAction( 1, TakeItem, 3362,100 )
TriggerAction( 1, TakeItem, 7761,1 )
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, TakeMoney, 10000000 )
TriggerAction( 1, GiveItem, 7487,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 4)
Text(3,"Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk( 4, "Не хватает лута... " )
Text( 4, "Уйти. ", CloseTalk )

AddNpcMission	(990)
AddNpcMission	(999)
AddNpcMission	(1000)
AddNpcMission	(217)
AddNpcMission	(218)
AddNpcMission	(219)
AddNpcMission	(220)
end

function r_kacer ()
	
Talk( 1, " Качнуть? " )

InitTrigger()
TriggerCondition( 1, HasMoney, 0 )
TriggerAction( 1, TakeMoney, 0 )
TriggerAction( 1, AddExp, 9000000 )

Text( 1, " Давай ", MultiTrigger, GetMultiTrigger(), 1)

end

function t_puct ()   
Talk( 1, " Здравствуй,я очень устал дай мне отдохнуть скоро я буду менять что-то из пустыни ")    
Text( 1, " Понял,подожду ", JumpPage, 3)

end

function t_bija ()   
Talk( 1, "Если бы я не застрял давным-давно,то врятли мы бы подружились... ")    
Text( 1, "Паучья Шапка ", JumpPage, 5)
Text( 1, "Паучье Ожерелье ", JumpPage, 3)
Text( 1, "Паучье Кольцо ", JumpPage, 4)



Talk(3," Нужно 900 Кэлей,300 Чёрных Жемчужин,150 Ядов,1 карту Главного Паука,3 карты Паука,200 Репутации и 20.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 )
TriggerCondition( 1, HasItem,3362,300 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,3 )
TriggerCondition( 1, HasItem,4441,150 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,900 )
TriggerAction( 1, TakeItem, 3362,300 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,3 )
TriggerAction( 1, TakeItem, 4441,150 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7755,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," Беру ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," Нужно 450 Кэлей,150 Чёрных Жемчужин,75 Ядов,1 карту Главного Паука,1 Карту Паука,200 Репутации и 20.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,450 )
TriggerCondition( 1, HasItem,3362,150 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,1 )
TriggerCondition( 1, HasItem,4441,75 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,450 )
TriggerAction( 1, TakeItem, 3362,150 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,1 )
TriggerAction( 1, TakeItem, 4441,75 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7754,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4," Беру ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Нужно 200 Паутинок,200 Ядов,1 карту Главного Паука,1 карту Рыцаря Пустыни,2 карты Паука,200 Репутации,и 20.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,1728,200 )
TriggerCondition( 1, HasItem,4441,200 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,2 )
TriggerCondition( 1, HasItem,7461,1 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 1728,200 )
TriggerAction( 1, TakeItem, 4441,200 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,2 )
TriggerAction( 1, TakeItem, 7461,1 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7753,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(5," Беру ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Не хватает лута! " )

end

function t_new ()   
Talk( 1, " Приветствую! Пока что я не знаю зачем я здесь,скорее всего буду осуществлять связь с админом ")    
Text( 1, " Понятненько ", JumpPage, 3)
end

function t_tolik ()   
Talk( 1, " Привет,будь аккуратнее вокруг множество злых тварей ")    
Text( 1, " Хорошо ", JumpPage, 3)

	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 2019 )--доп квесты на кактусов
	AddNpcMission ( 2020 )--доп разбойники
	AddNpcMission ( 2021 )--доп энты
	AddNpcMission ( 2022 )--доп разборка с главарями
end



function t_weaponsabs ()   
Talk( 1, " Здравствуй,я могу обменять собранные тобою души! ")    
Text( 1, " Оружие Испытания ", JumpPage, 3)
Text( 1, " Экипировка Испытания ", JumpPage, 4)



Talk(3," Ты хочешь получить Оружие Испытания?Если хочешь, принеси мне души Чампа,Круза,Шарпа,Бк,См и Воя по 1 штуке,5 Карт Анубиса,5 Карт Фараона,1 Знак Испытания,600 Репутации и 60.000.000 золота,и тогда я дам тебе его.Души ты можешь найти пройдя испытание у Гарри (882,3580) ")
InitTrigger()
TriggerCondition( 1, HasItem,2927,1 )
TriggerCondition( 1, HasItem,2928,1 )
TriggerCondition( 1, HasItem,2929,1 )
TriggerCondition( 1, HasItem,2930,1 )
TriggerCondition( 1, HasItem,2931,1 )
TriggerCondition( 1, HasItem,2932,1 )
TriggerCondition( 1, HasItem,7666,5 )
TriggerCondition( 1, HasItem,7781,5 )
TriggerCondition( 1, HasItem,7786,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2927,1 )
TriggerAction( 1, TakeItem, 2928,1 )
TriggerAction( 1, TakeItem, 2929,1 )
TriggerAction( 1, TakeItem, 2930,1 )
TriggerAction( 1, TakeItem, 2931,1 )
TriggerAction( 1, TakeItem, 2932,1 )
TriggerAction( 1, TakeItem, 7666,5 )
TriggerAction( 1, TakeItem, 7781,5 )
TriggerAction( 1, TakeItem, 7786,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7687,1,1 )
TriggerFailure( 1, JumpPage, 8)
Text(3," Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Ты хочешь получить Броню Испытания?Тогда тебе нужно принести мне кристалл Круза,Шарпа(пуха),Чампа(одноручки),Чампа(щит),Шарпа(лук),Целительницы,Колдуньи,Мореплавателя по 1 штуке,600 Репутации и  60.000.000 и ты получишь его.Души ты можешь найти пройдя испытание у Гарри (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7778,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 8)
Text(5," Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Ты хочешь получить Перчатки Испытания?Тогда тебе нужно принести мне кристалл Круза,Шарпа(пуха),Чампа(одноручки),Чампа(щит),Шарпа(лук),Целительницы,Колдуньи,Мореплавателя по 1 штуке,600 Репутации и  60.000.000 и ты получишь его.Души ты можешь найти пройдя испытание у Гарри (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7779,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 8)
Text(6," Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Ты хочешь получить Ботинки Испытания?Тогда тебе нужно принести мне кристалл Круза,Шарпа(пуха),Чампа(одноручки),Чампа(щит),Шарпа(лук),Целительницы,Колдуньи,Мореплавателя по 1 штуке,600 Репутации и  60.000.000 и ты получишь его.Души ты можешь найти пройдя испытание у Гарри (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7780,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 8)
Text(7," Получить ",MultiTrigger,GetMultiTrigger(),1)



Talk(4," Что тебя интересует? " )
Text(4," Броня ", JumpPage, 5)
Text(4," Перчатки ", JumpPage, 6)
Text(4," Ботинки ", JumpPage, 7)


Talk(8," Не хватает лута! " )
end

function t_abbbijewap ()   
Talk( 1, " Приветствую,у меня есть вещи мертвецов...  ")    
Text( 1, " Шапка Испытания (600 Уровень) ", JumpPage, 3)
Text( 1, " Бижутерия Испытания (600 Уровень) ", JumpPage, 4)
Text( 1, " Кольцо Испытания (600 Уровень) ", JumpPage, 5)



Talk(3," Хмм...Шапка Испытания штука редкая,но за слово ABADDON и 50 Сердец Смерти я готов дать тебе его,ах да и ещё не забудь 600 Репутации и 60.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,3850,2 )
TriggerCondition( 1, HasItem,3851,1 )
TriggerCondition( 1, HasItem,3853,2 )
TriggerCondition( 1, HasItem,3864,1 )
TriggerCondition( 1, HasItem,3863,1 )
TriggerCondition( 1, HasItem,2857,50 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3850,2 )
TriggerAction( 1, TakeItem, 3851,1 )
TriggerAction( 1, TakeItem, 3853,2 )
TriggerAction( 1, TakeItem, 3864,1 )
TriggerAction( 1, TakeItem, 3863,1 )
TriggerAction( 1, TakeItem, 2857,50 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7665,1,1 )
TriggerFailure( 1, JumpPage, 6)
Text(3," Получить ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," Могу предложить тебе помочь улучшить твою Ледяную Бижутерию,до Бижутерии испытания,но в замен ты мне принесёшь 5 Карт Абаддона, 50 Сердец Смерти,по 5 Рун каждого Церебруса(их ты сможешь найти в центре Абаддона 1-4),и соберёшь из карт слово BIJA,а так же не забудешь 600 Репутации и 60.000.000 золота,то я вознагражу тебя ею " )
InitTrigger()
TriggerCondition( 1, HasItem,7463,5 )
TriggerCondition( 1, HasItem,6231,5 )
TriggerCondition( 1, HasItem,6232,5 )
TriggerCondition( 1, HasItem,6233,5 )
TriggerCondition( 1, HasItem,6234,5 )
TriggerCondition( 1, HasItem,3851,1 )
TriggerCondition( 1, HasItem,3858,1 )
TriggerCondition( 1, HasItem,3859,1 )
TriggerCondition( 1, HasItem,3850,1 )
TriggerCondition( 1, HasItem,2857,50 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7463,5 )
TriggerAction( 1, TakeItem, 6231,5 )
TriggerAction( 1, TakeItem, 6232,5 )
TriggerAction( 1, TakeItem, 6233,5 )
TriggerAction( 1, TakeItem, 6234,5 )
TriggerAction( 1, TakeItem, 3851,1 )
TriggerAction( 1, TakeItem, 3858,1 )
TriggerAction( 1, TakeItem, 3859,1 )
TriggerAction( 1, TakeItem, 3850,1 )
TriggerAction( 1, TakeItem, 2857,50 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7664,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 6)
Text(4," Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Хочешь улучшить своё Ледяное Кольцо до кольца Испытания? За 25 Сердец Смерти,5 Карт Абаддона,по 2 Руны каждого Церебруса(можно найти в центер абаддона 1-4) 600 Репутации и    60.000.000 я улучшу её " )
InitTrigger()
TriggerCondition( 1, HasItem,2857,25 )
TriggerCondition( 1, HasItem,7463,5 )
TriggerCondition( 1, HasItem,6231,2 )
TriggerCondition( 1, HasItem,6232,2 )
TriggerCondition( 1, HasItem,6233,2 )
TriggerCondition( 1, HasItem,6234,2 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 2857,25 )
TriggerAction( 1, TakeItem, 7463,5 )
TriggerAction( 1, TakeItem, 6231,2 )
TriggerAction( 1, TakeItem, 6232,2 )
TriggerAction( 1, TakeItem, 6233,2 )
TriggerAction( 1, TakeItem, 6234,2 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7663,1,1 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 6)
Text(5," Получить ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Не хватает лута! " )
	

end 

function t_ecxang743 ()   
Talk( 1, " Мои камушки самые ценные в нашем регионе ")    
Text( 1, " Камень Первого Перерождения ", JumpPage, 3)
Text( 1, " Камень Второго Перерождения ", JumpPage, 4)
Text( 1, " Камень Третьего Перерождения ", JumpPage, 5)


Talk(3," Я хочу от тебя 20 Карт Дракона,Карт Хаоса,Карт Арены и карт Абаддона.3 карты Башни Арены.По 1 Карте Надзирателя и Повелителя Арены.По мимо карт от вас так же требуется 50 Сундуков Кэлей (1000шт),15.000 Репутации,50 Сфер Хаоса,50 Сфер Арены и 5 Сертификатов Хаоса.Ах да, не забудь про 100.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,7654,20 )
TriggerCondition( 1, HasItem,7652,20 )
TriggerCondition( 1, HasItem,7653,20 )
TriggerCondition( 1, HasItem,7463,20 )
TriggerCondition( 1, HasItem,7632,3 )
TriggerCondition( 1, HasItem,7630,1 )
TriggerCondition( 1, HasItem,7631,1 )
TriggerCondition( 1, HasItem,7746,50 )
TriggerCondition( 1, HasItem,7621,50 )
TriggerCondition( 1, HasItem,7626,50 )
TriggerCondition( 1, HasItem,7614,5 )
TriggerCondition( 1, HasCredit, 15000 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7654,20 )
TriggerAction( 1, TakeItem, 7652,20 )
TriggerAction( 1, TakeItem, 7653,20 )
TriggerAction( 1, TakeItem, 7463,20)
TriggerAction( 1, TakeItem, 7632,3 )
TriggerAction( 1, TakeItem, 7630,1 )
TriggerAction( 1, TakeItem, 7631,1 )
TriggerAction( 1, TakeItem, 7746,50 )
TriggerAction( 1, TakeItem, 7621,50 )
TriggerAction( 1, TakeItem, 7626,50 )
TriggerAction( 1, TakeItem, 7614,5 )
TriggerAction( 1, DelRoleCredit, 15000 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, GiveItem, 2235,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," Если ты хочешь,тогда неси мне по 1 карте Хаоса,Арены,Башни Арены,Надзирателя Арены,Повелителя Арены.По 2 карты Главной Черепахи,Дамы,Хранителя Леса,Ледяного Дракона,Дракона Призрака,Снежного Волка,Фобоса и Гидры.И 5 карт Дракона,а так же 100 Сфер Хаоса,100 Сфер Арены и 25.000 репутации " )
InitTrigger()
TriggerCondition( 1, HasItem,7652,1 )
TriggerCondition( 1, HasItem,7653,1 )
TriggerCondition( 1, HasItem,7630,1 )
TriggerCondition( 1, HasItem,7631,1 )
TriggerCondition( 1, HasItem,7632,1 )
TriggerCondition( 1, HasItem,7642,2 )
TriggerCondition( 1, HasItem,7648,2 )
TriggerCondition( 1, HasItem,7647,2 )
TriggerCondition( 1, HasItem,7649,2 )
TriggerCondition( 1, HasItem,7650,2 )
TriggerCondition( 1, HasItem,7651,2 )
TriggerCondition( 1, HasItem,7634,2 )
TriggerCondition( 1, HasItem,7635,2 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7621,100 )
TriggerCondition( 1, HasItem,7626,100 )
TriggerCondition( 1, HasCredit, 25000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7652,1 )
TriggerAction( 1, TakeItem, 7653,1 )
TriggerAction( 1, TakeItem, 7630,1 )
TriggerAction( 1, TakeItem, 7631,1 )
TriggerAction( 1, TakeItem, 7632,1 )
TriggerAction( 1, TakeItem, 7642,2 )
TriggerAction( 1, TakeItem, 7648,2 )
TriggerAction( 1, TakeItem, 7647,2 )
TriggerAction( 1, TakeItem, 7649,2 )
TriggerAction( 1, TakeItem, 7650,2 )
TriggerAction( 1, TakeItem, 7651,2 )
TriggerAction( 1, TakeItem, 7634,2 )
TriggerAction( 1, TakeItem, 7635,2 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7621,100 )
TriggerAction( 1, TakeItem, 7626,100 )
TriggerAction( 1, DelRoleCredit, 25000 )
TriggerAction( 1, GiveItem, 6949,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Привоз камушка будет совсем скоро " )

Talk(6," Не хватает лута! " )

end


function t_dragset ()   
Talk( 1, "Староват я уже,но драконов люблю словно маленький мальчик,не мог бы ты сходить на остров драконов и принести мне кое что?А в замен можешь выбрать то,что тебя устроит .У меня есть весь драконий арсенал,кроме оружия,его украли ныне живущие боссы острова ")    
Text( 1, "Доспех Дракона (Уровень 1000) ", JumpPage, 3)
Text( 1, "Перчатки Дракона (Уровень 1000) ", JumpPage, 4)
Text( 1, "Ботинки Дракона (Уровень 1000) ", JumpPage, 5)
Text( 1, "Шапка Дракона (Уровень 1000) ", JumpPage, 6)
Text( 1, "Кольцо Дракона (Уровень 1000) ", JumpPage, 7)
Text( 1, "Бижутерия Дракона (Уровень 1000) ", JumpPage, 8)

Talk(3,"Интересует Доспех? Изволь принести 500 Слёз Дракона,1000 Чёрных Жемчужин(Остров Купидона),5000 кэлей.10 Карт Дракона(Мобы).По 10 Карт Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,а так же 1000 Репутации и 100.000.000 золота ")
InitTrigger()
TriggerCondition( 1, HasItem,7646,500 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,5000 )
TriggerCondition( 1, HasItem,7647,10 )
TriggerCondition( 1, HasItem,7654,10 )
TriggerCondition( 1, HasItem,7648,10 )
TriggerCondition( 1, HasItem,7649,10 )
TriggerCondition( 1, HasItem,7650,10 )
TriggerCondition( 1, HasItem,7651,10 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,500 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,5000 )
TriggerAction( 1, TakeItem, 7647,10 )
TriggerAction( 1, TakeItem, 7654,10 )
TriggerAction( 1, TakeItem, 7648,10 )
TriggerAction( 1, TakeItem, 7649,10 )
TriggerAction( 1, TakeItem, 7650,10 )
TriggerAction( 1, TakeItem, 7651,10 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7800,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(3,"Обмен ",MultiTrigger,GetMultiTrigger(),1)


Talk(4,"Для Перчаток нужно принести 250 Слёз Дракона,1000 Чёрных Жемчужин(Остров Купидона),2500 Кэлей.5 Карт Дракона(Мобы).По 5 Карт Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,а так же 1000 Репутации и 100.000.000 золота  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,250 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,250 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7801,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(4,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"Если Ботинки захотел,тогда нужно принести 250 Слёз Дракона,1000 Чёрных Жемчужин(Остров Купидона),2500 Кэлей.5 Карт Дракона(Мобы).По 5 Карт Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,а так же 1000 Репутации и и 100.000.000 золота  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,250 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,250 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7802,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(5,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(6,"Для Шапки нужно принести 300 Слёз Дракона.10 Карт Дракона(Мобы).По 3 Карты Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,а так же 1000 Репутации и 100.000.000 золота  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,300 )
TriggerCondition( 1, HasItem,7654,10 )
TriggerCondition( 1, HasItem,7647,3 )
TriggerCondition( 1, HasItem,7648,3 )
TriggerCondition( 1, HasItem,7649,3 )
TriggerCondition( 1, HasItem,7650,3 )
TriggerCondition( 1, HasItem,7651,3 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,300 )
TriggerAction( 1, TakeItem, 7654,10 )
TriggerAction( 1, TakeItem, 7647,3 )
TriggerAction( 1, TakeItem, 7648,3 )
TriggerAction( 1, TakeItem, 7649,3 )
TriggerAction( 1, TakeItem, 7650,3 )
TriggerAction( 1, TakeItem, 7651,3 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7799,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(6," Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(7,"Для Кольца тебе потребуется,300 Слёз Дракона,5 Карт Дракона(Мобы).По 3 Карты Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,1000 Репутации и 100.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,300 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,3 )
TriggerCondition( 1, HasItem,7648,3 )
TriggerCondition( 1, HasItem,7649,3 )
TriggerCondition( 1, HasItem,7650,3 )
TriggerCondition( 1, HasItem,7651,3 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,300 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,3 )
TriggerAction( 1, TakeItem, 7648,3 )
TriggerAction( 1, TakeItem, 7649,3 )
TriggerAction( 1, TakeItem, 7650,3 )
TriggerAction( 1, TakeItem, 7651,3 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7797,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(7," Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(8,"Для Ожерелья тебе потребуется,500 Замороженных чешуй дракона,500 Слёз Дракона,20 Карт Дракона(Мобы).По 5 Карты Хранителя Леса,Дамы,Ледяного Дракона,Дракона Призрака и Снежного Волка,1000 Репутации и 100.000.000 золота  " )
InitTrigger()
TriggerCondition( 1, HasItem,3067,500 )
TriggerCondition( 1, HasItem,7646,500 )
TriggerCondition( 1, HasItem,7654,20 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3067,500 )
TriggerAction( 1, TakeItem, 7646,500 )
TriggerAction( 1, TakeItem, 7654,20 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7798,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(8,"Окей ",MultiTrigger,GetMultiTrigger(),1)

Talk(11,"Не хватает лута! " )

end

function t_gamplaw ()   

Talk( 1, "Привет,если ты принесёшь мне 50 Частей Плаща и 5000 Репутации,то я дам основу для Плаща Адмирала которую ты сможешь сшить! " ) 
Text( 1, "Принёс ", JumpPage, 3)
Text( 1, "Улучшение Плаща ", JumpPage, 5)

Talk(3," Держи, сжила для тебя от всей души! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,5000)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 5000 )
TriggerAction( 1, GiveItem, 7681,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Одно улучшение будет стоить 10 частей плаща и 40 репутации " )
Text( 5, "Улучшение Силы ", JumpPage, 7)
Text( 5, "Улучшение Ловкости ", JumpPage, 8)
Text( 5, "Улучшение Телосложения ", JumpPage, 9)
Text( 5, "Улучшение Точности ", JumpPage, 10)
Text( 5, "Улучшение Духа ", JumpPage, 11)

Talk(7," Выбирай, сжила для тебя от всей души! " )
Text( 7, "Улучшение Силы 1шт", JumpPage, 12)
Text( 7, "Улучшение Силы 5шт", JumpPage, 13)

Talk(12," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7705,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(12," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7705,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(13," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(8," Выбирай, сжила для тебя от всей души! " )
Text( 8, "Улучшение Ловкости 1шт", JumpPage, 14)
Text( 8, "Улучшение Ловкости 5шт", JumpPage, 15)

Talk(14," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7706,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(14," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7706,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(15," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(9," Держи, сжила для тебя от всей души! " )
Text( 9, "Улучшение Телосложения 1шт", JumpPage, 16)
Text( 9, "Улучшение Телосложения 5шт", JumpPage, 17)


Talk(16," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7707,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(16," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7707,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(17," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Держи, сжила для тебя от всей души! " )
Text( 10, "Улучшение Точности 1шт", JumpPage, 18)
Text( 10, "Улучшение Точности 5шт", JumpPage, 19)

Talk(18," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7708,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(18," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7708,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(19," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Держи, сжила для тебя от всей души! " )
Text( 11, "Улучшение Духа 1шт", JumpPage, 20)
Text( 11, "Улучшение Духа 5шт", JumpPage, 21)


Talk(20," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7709,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(20," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," Хороший выбор! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7709,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(21," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Не обманывай меня! " )
end

function t_gzbtplaw ()   

Talk( 1, "На сервере один Админ и он же Хост,для октрытие сервера и его дальнейшей работы ежемесечно нужно 3.500рублей,кто может помочь напишите Тимуру,он вас от души вознаградит!Он старается каждый день для вас и будет старатся дальше,делая обновы и улучшая сервер " ) 
Text( 1, " ЗБТ ", BuyPage)


InitTrade  ()
Weapon(	2941	)
Weapon(	6947	)
Weapon(	6948	)
Weapon(	7489	)
Weapon(	7532	)
Weapon(	7533	)
Weapon(	7477	)
Weapon(	7478	)
Weapon(	7479	)
Weapon(	7480	)
Weapon(	7481	)
Weapon(	7451	)
Weapon(	7456	)
Weapon(	7455	)
Weapon(	7668	)
Weapon(	7528	)
Weapon(	7670	)
Weapon(	7702	)
--Weapon(	7681	)
--Weapon(	7683	)
--Weapon(	7682	)
--Weapon(	5702	)
--Weapon(	5710	)


end

function garoldtp()
Talk( 1, "Привет ", JumpPage, 2 )
Text( 1, "Вернутся в Шайтан ", GoTo, 643, 877, "magicsea" )
Text( 1, "Информация об острове ", JumpPage, 2)

 end
 
function Instance_NPC()
	InitTrigger()
	TriggerCondition( 1, Instance_DayCheck, 1 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerFailure( 1, JumpPage, 4 )
	Start( GetMultiTrigger(), 1 )
	Talk(1,"Кристи Привет,если ты собрал могучую команду,тогда рискнёте ли вы бросить вызов всему миру? " )
	Text(1,"Мы готовы ! ",Instance_RegParty)
	Text(1,"Проверить состояние команды ",Instance_ConfirmParty)
	Text(1,"Расскажи мне поподробнее ",JumpPage,2)
	Text(1,"Требования ",JumpPage,3)
	
end


function Hell_tele01 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 82
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele02 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 105
        local GoTo01Y = 146
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: что вы хотите? " ) 
        Text( 1, "Обратно ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "Обратно отведу вас бесплатно " )
        Text( 2, "Вперёд ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele03 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 89
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

       Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele04 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 95
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: что вы хотите? " ) 
        Text( 1, "Обратно ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "Обратно отведу вас бесплатно " )
        Text( 2, "Вперёд ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele05 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 165
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele06 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 160
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: что вы хотите? " ) 
        Text( 1, "Обратно ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "Обратно отведу вас бесплатно " )
        Text( 2, "Вперёд ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele07 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 164
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele08 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 160
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: что вы хотите? " ) 
        Text( 1, "Обратно ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "Обратно отведу вас бесплатно " )
        Text( 2, "Вперёд ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele09 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 237
        local GoTo01Y = 116
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele10 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 237
        local GoTo01Y = 126
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele11 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 126
        local GoTo01Y = 35
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele12 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 129
        local GoTo01Y = 35
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele13 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 14
        local GoTo01Y = 124
        local GoTo01M = CurMapName1
   

         Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele14 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 14
        local GoTo01Y = 119
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele15 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 131
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele16 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 125
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

      Talk( 1, "Телепорт: Что бы пройти дальше,отдай мне 1 Камень Ада " ) 
        Text( 1, "Хорошо ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Точно? " )
        Text( 2, "Да ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "В другой раз " , JumpPage, 1 )

        Talk( 5, "У тебя не хватает Камней Ада! " )
         

end

function Hell_tele17 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 59
        local GoTo01Y = 37
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Ты уверен? " ) 
        Text( 1, "Да! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6882, 2 )
	TriggerAction( 1, TakeItem, 6882, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Телепорт: Для прохода в комнату дайте мне 2 Знака Асмодея " )
        Text( 2, "Держи ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "Передумал " , JumpPage, 1 )

        Talk( 5, "Недостаточно Знаков! " )
         

end

function Hell_tele18 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 188
        local GoTo01Y = 34
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Ты уверен? " ) 
        Text( 1, "Да! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6883, 2 )
	TriggerAction( 1, TakeItem, 6883, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Телепорт: Для прохода в комнату дайте мне 2 Знака Люцифера " )
        Text( 2, "Держи ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "Передумал " , JumpPage, 1 )

        Talk( 5, "Недостаточно Знаков! " )
         

end

function Hell_tele19 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 60
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Ты уверен? " ) 
        Text( 1, "Да! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6880, 2 )
	TriggerAction( 1, TakeItem, 6880, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Телепорт: Для прохода в комнату дайте мне 2 Знака Левиафана " )
        Text( 2, "Держи ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "Передумал " , JumpPage, 1 )

        Talk( 5, "Недостаточно Знаков! " )
         

end

function Hell_tele20 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 190
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "Телепорт: Ты уверен? " ) 
        Text( 1, "Да! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6881, 2 )
	TriggerAction( 1, TakeItem, 6881, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "Телепорт: Для прохода в комнату дайте мне 2 Знака Бельфегора " )
        Text( 2, "Держи ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "Передумал " , JumpPage, 1 )

        Talk( 5, "Недостаточно Знаков! " )
         

end


function Hell_ad ()

		Talk( 1, "Привет,в Аду можно раздобыть уникальную экипировку 1200 уровня,ну или умереть... " )
        Text( 1, "Отправь меня в Ад ", GoTo, 119, 119, "Hellchapter" )
		Text( 1, "Снаряжение Ада (1200 Уровень) ",  JumpPage, 2)
		
		Talk( 2, "Неужели ты решил что сможешь справится с чудищами из глубин Ада.. " )
		Text( 2, "Оружие",  JumpPage, 3)
		Text( 2, "Экипировка",  JumpPage, 4)
		
	Talk( 3, "Возможно я ошибался на твой счёт.Дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7803, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 3, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 4, "Только сильнейшим войнам подвластна экипировка из Ада.. " )
	Text( 4, "Шапка ",  JumpPage, 5)
	Text( 4, "Доспех",  JumpPage, 6)
	Text( 4, "Перчатки",  JumpPage, 7)
	Text( 4, "Ботинки ",  JumpPage, 8)
	Text( 4, "Кольцо ",  JumpPage, 9)
	Text( 4, "Ожерелье ",  JumpPage, 10)
	
	
	Talk( 5, "Шапку хочешь? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7806, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 5, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 6, "Интересует Доспех? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7807, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 6, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 7, "Интересуют Перчатки? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7808, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 7, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 8, "Интересуют Ботинки? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7809, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 8, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 9, "Интересует Кольцо? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7804, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 9, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10, "Интересует Ожерелье? Тогда дай мне по 5 карт Асмодея,Левиафана,Бельфегора и Люцифера,а так же 100 Адских Камней,100 Адских Кукол,100 Частиц Ада,20 Адских Договоров,1200 Репутации и 120.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7805, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 10, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 20, "Не достаточно предметов для обмена! " )     
end

function r_rybak ()	
	
	Talk( 1,  "Привет,хочешь порыбачить? " )
	Text( 1,  "Торг ", BuyPage )
	
	Weapon(	7726	)
	Weapon(	7733	)
	
	
	end
	
function t_tpfish ()

        --Maps--Mazes
        local CurMapName1 = "fishing"

        --Forsaken City(FC)
        local GoTo01X = 63
        local GoTo01Y = 49
        local GoTo01M = CurMapName1
   

        Talk( 1, "Что бы пройти к стражу острова,принеси мне по 10 штук каждого вида рыб." ) 
        Text( 1, "Хорошо",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
		TriggerCondition( 1, HasItem, 7727, 10 )
		TriggerCondition( 1, HasItem, 7728, 10 )
		TriggerCondition( 1, HasItem, 7729, 10 )
		TriggerCondition( 1, HasItem, 7730, 10 )
		TriggerCondition( 1, HasItem, 7731, 10 )
		TriggerCondition( 1, HasItem, 7732, 10 )
		TriggerAction( 1, TakeItem, 7727, 10 ) 
		TriggerAction( 1, TakeItem, 7728, 10 )
		TriggerAction( 1, TakeItem, 7729, 10 )
		TriggerAction( 1, TakeItem, 7730, 10 )
		TriggerAction( 1, TakeItem, 7731, 10 )
		TriggerAction( 1, TakeItem, 7732, 10 )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "Ты готов? " )
        Text( 2, "Да",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "Пойду рыбачить" , JumpPage, 1 )

        Talk( 5, "Недостаточно лута." )
       
end


function t_tpfisr ()
Talk( 1, "Привет " )
Text( 1, "Шайтан ", GoTo, 642, 870, "magicsea" )
end
-------Sacred War Administrator

function roico_talk()

	Talk( 1, "У меня можно будет обменивать интересные штучки,но не сегодня =) " )
	--Text( 1, "Обменять Кровавые контракты на БС ",JumpPage, 2 )
	Text( 1, "Расскажи мне про Остров ", JumpPage, 2 )
	
	Talk( 2, "У каждого игрока есть 3 попытки на вход,если игрок был убит другим игроков,то он забирает одну их его оставшихся попыток и плюсует к своим.Если вы использовали все свои попытки то зайти вы сможете только при следующем открытии локации! " )
	Text( 2, "Спасибо ", CloseTalk )



end

function r_abatp()

	Talk(1, "Что тебе здесь нужно? ")
	Text(1, "Отведи меня в Шайтан ", JumpPage, 2 )
	Text(1, "Знак Испытания ", JumpPage, 3 )
	
	Talk(2, "Идём?  ")
	Text(2, "Да ", GoTo, 647, 869, "magicsea")
	Text(2, "Нет ", CloseTalk )	
	
	Talk(3,"Хмм..Я смогу собрать его используя 5 Сундуков Кэлей (1000шт),500 Репутации и 50.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7746, 5 )
	TriggerCondition( 1, HasCredit, 500 )
	TriggerCondition( 1, HasMoney, 50000000 )
	TriggerAction( 1, TakeItem, 7746, 5 )
	TriggerAction( 1, DelRoleCredit, 500 )
	TriggerAction( 1, TakeMoney, 50000000 )
	TriggerAction( 1, GiveItem, 7786, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 5 )
	Text(3, "Собирай ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"Не достаточно лута ")


end

function r_abatp2()

	Talk(1, "Что тебе здесь нужно? ")
	Text(1, "Отведи меня в Шайтан ", JumpPage, 2 )
	Text(1, "Предыдущий этаж ", GoTo, 28, 30, "hell")

	Talk(2, "Идём?  ")
	Text(2, "Да ", GoTo, 647, 869, "magicsea")
	Text(2, "Нет ", CloseTalk )	
	
end

function r_abatp3()

	Talk(1, "Что тебе здесь нужно? ")
	Text(1, "Отведи меня в Шайтан ", JumpPage, 2 )
	Text(1, "Предыдущий этаж ", GoTo, 225, 31, "hell")

	Talk(2, "Идём?  ")
	Text(2, "Да ", GoTo, 647, 869, "magicsea")
	Text(2, "Нет ", CloseTalk )	
	
end

function r_abatp4()

	Talk(1, "Что тебе здесь нужно? ")
	Text(1, "Отведи меня в Шайтан ", JumpPage, 2 )
	Text(1, "Предыдущий этаж ", GoTo, 222, 220, "hell")

	Talk(2, "Идём?  ")
	Text(2, "Да ", GoTo, 647, 869, "magicsea")
	Text(2, "Нет ", CloseTalk )	
	
end

function t_gemssetqua()
Talk( 1, "Сетовые вещи могут быть повышены в качестве...Позже смогу рассказать об этом подробнее...А пока что для улучшения и обмена доступен 100 сет ")    
Text( 1, "Чары Мёртвого (100 Уровень) ", JumpPage, 2)

Talk(2,"Второй уровень чар - 2 Свитка,Третий - 3,Чертвёртый - 4,Пятый - 5 ")
Text(2, "2 Уровень ", JumpPage, 3)
Text(2, "3 Уровень ", JumpPage, 4)
Text(2, "4 Уровень ", JumpPage, 5)
Text(2, "5 Уровень ", JumpPage, 6)

Talk(3,"Хороший выбор ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,2 )
TriggerAction( 1, GiveItem, 7811,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(3,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(4,"Хороший выбор ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,3 )
TriggerAction( 1, GiveItem, 7812,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(4,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"Хороший выбор ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,4 )
TriggerAction( 1, GiveItem, 7813,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(5,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

Talk(6,"Хороший выбор ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,5 )
TriggerAction( 1, GiveItem, 7814,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(6,"Обмен ",MultiTrigger,GetMultiTrigger(),1)

end

function t_kuppf()
Talk( 1, "Привет " )
Text( 1, "Шайтан ", GoTo, 869, 3608, "magicsea" )
end

function ckorb_t ()

		Talk( 1, "Обдумай,может быть не стоит идти против сил природы? " )
        Text( 1, "Я пойду ", GoTo, 68, 60, "farmer1" )
		Text( 1, "Снаряжение Скорби (1400 Уровень) ",  JumpPage, 2)
		
		Talk( 2, "Не верю,ты действительно одолел силы природы?Если это правда,тогда выбирай то,что тебя интересует " )
		Text( 2, "Оружие",  JumpPage, 3)
		Text( 2, "Экипировка",  JumpPage, 4)
		
	Talk( 3, "Оружие стоит 5 карт Гл.Девы Энтов,Гл.Тёмной Девы Энтов,Гл.Осы и Гл.Ящерицы,а так же по 20 Карт Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,по мимо этого 150 Зёрен Скорби,1 Карту Дракона Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 20 )
	TriggerCondition( 1, HasItem, 7897, 20 )
	TriggerCondition( 1, HasItem, 7899, 20 )
	TriggerCondition( 1, HasItem, 7901, 20 )
	TriggerCondition( 1, HasItem, 7914, 150 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 20)
	TriggerAction( 1, TakeItem, 7897, 20 )
	TriggerAction( 1, TakeItem, 7899, 20 )
	TriggerAction( 1, TakeItem, 7901, 20 )
	TriggerAction( 1, TakeItem, 7914, 150 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7887, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 3, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 4, "Выбирай " )
	Text( 4, "Шапка ",  JumpPage, 5)
	Text( 4, "Доспех",  JumpPage, 6)
	Text( 4, "Перчатки",  JumpPage, 7)
	Text( 4, "Ботинки ",  JumpPage, 8)
	Text( 4, "Кольцо ",  JumpPage, 9)
	Text( 4, "Ожерелье ",  JumpPage, 10)
	
	
	Talk( 5, "Для Шапки нужно по 5 Карт Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 10 Карт Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,200 Зёрен Скорби,1 Карту Дракона Скорби,1400 Репутации и 140.000.000 золота   " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 10 )
	TriggerCondition( 1, HasItem, 7897, 10 )
	TriggerCondition( 1, HasItem, 7899, 10 )
	TriggerCondition( 1, HasItem, 7901, 10 )
	TriggerCondition( 1, HasItem, 7914, 200 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 10)
	TriggerAction( 1, TakeItem, 7897, 10 )
	TriggerAction( 1, TakeItem, 7899, 10 )
	TriggerAction( 1, TakeItem, 7901, 10 )
	TriggerAction( 1, TakeItem, 7914, 200)
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7890, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 5, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 6, "Для Доспеха нужно по 5 Карт Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 5 Карт Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,1 Карту Дракона Скорби,100 Скорбящих Душ,100 Зёрен Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 5 )
	TriggerCondition( 1, HasItem, 7897, 5 )
	TriggerCondition( 1, HasItem, 7899, 5 )
	TriggerCondition( 1, HasItem, 7901, 5 )
	TriggerCondition( 1, HasItem, 7910, 100 )
	TriggerCondition( 1, HasItem, 7914, 100 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 5 )
	TriggerAction( 1, TakeItem, 7897, 5 )
	TriggerAction( 1, TakeItem, 7899, 5 )
	TriggerAction( 1, TakeItem, 7901, 5 )
	TriggerAction( 1, TakeItem, 7910, 100)
	TriggerAction( 1, TakeItem, 7914, 100 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7891, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 6, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 7, "Для Перчаток нужно по 3 Карты Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 3 Карты Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,1 Карту Дракона Скорби,50 Песок Скорби,50 Зёрен Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 3 )
	TriggerCondition( 1, HasItem, 7898, 3 )
	TriggerCondition( 1, HasItem, 7900, 3 )
	TriggerCondition( 1, HasItem, 7902, 3 )
	TriggerCondition( 1, HasItem, 7895, 3 )
	TriggerCondition( 1, HasItem, 7897, 3 )
	TriggerCondition( 1, HasItem, 7899, 3 )
	TriggerCondition( 1, HasItem, 7901, 3 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7911, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 3 )
	TriggerAction( 1, TakeItem, 7898, 3 )
	TriggerAction( 1, TakeItem, 7900, 3 )
	TriggerAction( 1, TakeItem, 7902, 3 )
	TriggerAction( 1, TakeItem, 7895, 3 )
	TriggerAction( 1, TakeItem, 7897, 3 )
	TriggerAction( 1, TakeItem, 7899, 3 )
	TriggerAction( 1, TakeItem, 7901, 3 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7911, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7892, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 7, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 8, "Для Ботинок нужно по 3 Карты Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 3 Карты Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,1 Карту Дракона Скорби,50 Увядшая Ветка,50 Зёрен Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 3 )
	TriggerCondition( 1, HasItem, 7898, 3 )
	TriggerCondition( 1, HasItem, 7900, 3 )
	TriggerCondition( 1, HasItem, 7902, 3 )
	TriggerCondition( 1, HasItem, 7895, 3 )
	TriggerCondition( 1, HasItem, 7897, 3 )
	TriggerCondition( 1, HasItem, 7899, 3 )
	TriggerCondition( 1, HasItem, 7901, 3 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7912, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 3 )
	TriggerAction( 1, TakeItem, 7898, 3 )
	TriggerAction( 1, TakeItem, 7900, 3 )
	TriggerAction( 1, TakeItem, 7902, 3 )
	TriggerAction( 1, TakeItem, 7895, 3 )
	TriggerAction( 1, TakeItem, 7897, 3 )
	TriggerAction( 1, TakeItem, 7899, 3 )
	TriggerAction( 1, TakeItem, 7901, 3 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7912, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7893, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 8, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 9, "Для Кольца нужно по 6 Карт Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 6 Карты Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,1 Карту Дракона Скорби,50 Увядшая Ветка,50 Зёрен Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 6 )
	TriggerCondition( 1, HasItem, 7898, 6 )
	TriggerCondition( 1, HasItem, 7900, 6 )
	TriggerCondition( 1, HasItem, 7902, 6 )
	TriggerCondition( 1, HasItem, 7895, 6 )
	TriggerCondition( 1, HasItem, 7897, 6 )
	TriggerCondition( 1, HasItem, 7899, 6 )
	TriggerCondition( 1, HasItem, 7901, 6 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7913, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 6 )
	TriggerAction( 1, TakeItem, 7898, 6 )
	TriggerAction( 1, TakeItem, 7900, 6 )
	TriggerAction( 1, TakeItem, 7902, 6 )
	TriggerAction( 1, TakeItem, 7895, 6 )
	TriggerAction( 1, TakeItem, 7897, 6 )
	TriggerAction( 1, TakeItem, 7899, 6 )
	TriggerAction( 1, TakeItem, 7901, 6 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7913, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7888, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 9, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10, "Для Ожерелья нужно по 12 Карт Главной Осы,Главной Ящерицы,Главной Девы Энтов,Гл Тёмной Девы Энтов,по 12 Карт Девы Энтов,Тёмной Девы Энтов,Осы и Ящерицы,1 Карту Дракона Скорби,100 Скорбящая Душа,100 Песок Скорби,100 Острый Зуб,100 Увядшая Ветка,100 Зёрен Скорби,1400 Репутации и 140.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 12 )
	TriggerCondition( 1, HasItem, 7898, 12 )
	TriggerCondition( 1, HasItem, 7900, 12 )
	TriggerCondition( 1, HasItem, 7902, 12 )
	TriggerCondition( 1, HasItem, 7895, 12 )
	TriggerCondition( 1, HasItem, 7897, 12 )
	TriggerCondition( 1, HasItem, 7899, 12 )
	TriggerCondition( 1, HasItem, 7901, 12 )
	TriggerCondition( 1, HasItem, 7910, 100 )
	TriggerCondition( 1, HasItem, 7911, 100 )
	TriggerCondition( 1, HasItem, 7912, 100 )
	TriggerCondition( 1, HasItem, 7913, 100 )
	TriggerCondition( 1, HasItem, 7914, 100 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 12 )
	TriggerAction( 1, TakeItem, 7898, 12 )
	TriggerAction( 1, TakeItem, 7900, 12 )
	TriggerAction( 1, TakeItem, 7902, 12 )
	TriggerAction( 1, TakeItem, 7895, 12 )
	TriggerAction( 1, TakeItem, 7897, 12 )
	TriggerAction( 1, TakeItem, 7899, 12 )
	TriggerAction( 1, TakeItem, 7901, 12 )
	TriggerAction( 1, TakeItem, 7910, 100)
	TriggerAction( 1, TakeItem, 7911, 100 )
	TriggerAction( 1, TakeItem, 7912, 100 )
	TriggerAction( 1, TakeItem, 7913, 100 )
	TriggerAction( 1, TakeItem, 7914, 100 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7889, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 10, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 20, "Не достаточно предметов для обмена! " )     
end

--Ангел Ресета
function Angel_Reset()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 4999)
	TriggerCondition( 2, NPCcheck_Reset, 0 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "Чтобы поговорить с НПС, нужно быть выше 999 уровня и не иметь Первого ресета. ")    
Text( 12, "Уйти ", CloseTalk	)

Talk( 1, "Чтобы получить Первый ресет, нужно:_25 Звезд крови;_25 Ангелов;_25 Демонов;_1 Скелет;_1.000.000.000 золота. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "Ресетнуться. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "Закрыть. ", CloseTalk )

Talk( 3, "У вас не хватает вещей, чтобы выполнить первый ресет! ")    
Text( 3, "Уйти ", CloseTalk	)

end

--Ангел Ресета 2
function Angel_Reset_2()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 1199)
	TriggerCondition( 2, NPCcheck_Reset, 1 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "Чтобы поговорить с НПС, нужно быть выше 1199 уровня и не иметь Второго ресета. ")    
Text( 12, "Уйти ", CloseTalk	)

Talk( 1, "Чтобы получить Второй ресет, нужно:_50 Звезд крови;_50 Ангелов;_50 Демонов;_2 Скелет;_1.000.000.000 золота. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "Ресетнуться. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "Закрыть. ", CloseTalk )

Talk( 3, "У вас не хватает вещей, чтобы выполнить второй ресет! ")    
Text( 3, "Уйти ", CloseTalk	)

end

--Ангел Ресета 3
function Angel_Reset_3()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 1399)
	TriggerCondition( 2, NPCcheck_Reset, 2 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "Чтобы поговорить с НПС, нужно быть выше 1399 уровня и не иметь Третьего ресета. ")    
Text( 12, "Уйти ", CloseTalk	)

Talk( 1, "Чтобы получить Третий ресет, нужно:_100 Звезд крови;_100 Ангелов;_100 Демонов;_3 Скелет;_1.000.000.000 золота. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "Ресетнуться. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "Закрыть. ", CloseTalk )

Talk( 3, "У вас не хватает вещей, чтобы выполнить третий ресет! ")    
Text( 3, "Уйти ", CloseTalk	)

end

function gatkvostr()
Talk( 1, "Привет у меня будут задания по этому острову ", JumpPage, 2 )
Text( 1, "Вернутся в Шайтан ", GoTo, 891, 3575, "magicsea" )
Text( 1, "Жду ", JumpPage, 2)

 end

function GoToWhere()
Talk( 1, "\208\224\228\224 \226\224\241 \226\232\228\229\242\252 " ) 
Text( 1, "\195\238\240\238\228\224 ", JumpPage, 3 )
Text( 1, "\206\241\242\240\238\226\224 ", JumpPage, 2 )
Text( 1, "\199\238\237\251 ", JumpPage, 6 )
--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )

Text( 2, "\206\241\242\240\238\226 \196\230\229\234\224 ", GoTo, 1503, 1036, "magicsea" )
Text( 2, "\206\241\242\240\238\226 \209\242\243\230\232 ", GoTo, 77, 199, "stuja" )
Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
--Text( 2, "\206\241\242\240\238\226 \213\253\235\235\238\243\232\237\224 ", GoTo, 160,140, "halloween" )
--Text( 2, "\206\241\242\240\238\226 \209\234\238\240\225\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 99, 103, "farmer1" )
Text( 2, "\206\241\242\240\238\226 \208\251\225\224\234\238\226 ", GoTo, 56, 90, "fishing" )
Text( 2, "\206\241\242\240\238\226 \210\251\234\226 ", GoTo, 160, 140, "halloween" )
--Text( 2, "\196\224\235\229\229 ", JumpPage, 4 )

Text( 3, "\195\238\240\238\228 \209\243\228\252\225\251 ", GoTo, 157, 128, "CrystalShore" )
Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )
--Text( 4, "NEW 2. ", GoTo, 98, 113, "necropolis" )


Text( 5, "1 ", GoTo, 311, 297, "eastgoaf" )
Text( 5, "2 ", GoTo, 56, 252, "eastgoaf" )
Text( 5, "3 ", GoTo, 889, 526, "eastgoaf" )
Text( 5, "4 ", GoTo, 768,661, "eastgoaf" )
Text( 5, "5 ", GoTo, 777,730, "eastgoaf" )
Text( 5, "6 ", GoTo, 612,626, "jialebi" )
Text( 5, "7 ", GoTo, 1263,1008, "jialebi" )
Text( 5, "8 ", GoTo, 947,837, "jialebi" )
Text( 5, "9 ", GoTo, 1247,601, "jialebi" )


Text( 6, "\216\224\245\242\251 (\199\238\235\238\242\238) ", GoTo, 1139, 297, "magicsea" )
Text( 6, "\196\229\240\229\226\237\255 \207\224\243\234\238\226 (\211\240. 200) ", GoTo, 639, 568, "magicsea" )
Text( 6, "\208\238\249\224 \215\229\240\229\239\224\245 (\211\240. 230-300) ", GoTo, 983, 455, "magicsea" )
Text( 6, "\203\224\227\229\240\252 \207\243\241\242\251\237\237\251\245 \209\234\229\235\229\242\238\226 (\211\240. 350-400) ", GoTo, 951, 319, "magicsea" )
Text( 6, "\207\247\229\235\232\237\251\233 \206\224\231\232\241 (\211\240. 450-500) ", GoTo, 868, 393, "magicsea" )
Text( 6, "\203\224\227\229\240\252 \206\224\231\232\241 (\211\240. 550-600) ", GoTo, 564, 383, "magicsea" )
Text( 6, "\211\235\232\242\238\247\237\251\233 \206\224\231\232\241 (\211\240. 650-700) ", GoTo, 466, 395, "magicsea" )
Text( 6, "\196\224\235\229\229 ", JumpPage, 7 )

Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 357, 181, "magicsea" )
Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 451, 189, "magicsea" )
Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 536, 185, "magicsea" )

 end
------------------------------------------------------------
-- ???????
----------------------------------------------------------

function telepotrow ()
Talk( 1, "\204\237\229 \242\224\234 \237\240\224\226\232\242\241\255 \253\242\238 \230\224\240\234\238\229 \241\238\235\237\246\229,\237\229 \245\238\247\229\248\252 \239\240\238\227\243\235\255\242\241\255? " )
Text( 1, "\216\224\233\242\224\237 ", GoTo, 891, 3575, "magicsea" )
	
end

function t_socrovi ()
Talk( 1, "\204\237\238\227\232\229 \238\245\238\242\237\232\234\232 \231\224 \241\238\234\240\238\226\232\249\224\236\232 \242\224\234 \232 \237\229 \226\229\240\237\243\235\232\241\252.... " )
Text( 1, "\206\242\226\229\228\232 \236\229\237\255 \226 \199\224\235\232\226 \209\238\234\240\238\226\232\249 ", GoTo, 620, 951, "jialebi" )
	
end

------------------------------------------------------------
-- ???????
------------------------------------------------------------

function JoJo_99 () -- Pirate Chest

	Talk( 1, "Hello! Iam Story Question" )
	Text( 1, "\202\243\239\232\242\252", BuyPage)

	InitTrade()
	Weapon(	854  )
	Weapon(	127  )
	Weapon(	776  )
	Weapon(	784  )
	Weapon(	773  )
	Weapon(	802  )
	Weapon(	2820  )
	Weapon(	2817  )
	Weapon(	2339  )
	Weapon(	2821  )
	Weapon(	2822  )
	Weapon(	2332  )
	Weapon(	2338  )
	Weapon(	2337  )
	Weapon(	2823  )
	Weapon(	2824  )
	Weapon(	2825  )
	Weapon(	864  )
	Weapon(	865  )
	Weapon(	866  )
	Weapon(	885  )
	Weapon(	5845  )
	Weapon(	5846  )
	Weapon(	5847  )
	Weapon(	5848  )
	Weapon(	5849  )
	Weapon(	1145  )
	Weapon(	2729  )
	Weapon(	2753  )
	Weapon(	2777  )
	Weapon(	2801  )
	Weapon(	2794  )
	Weapon(	2367  )
	Weapon(	0807  )
	Weapon(	0808  )
	Weapon(	0809  )
	Weapon(	0810  )
	Weapon(	0811  )
	Weapon(	0812  )
	Weapon(	0813  )
	Weapon(	0814  )
	Weapon(	0815  )
	Weapon(	3404  ) 
	Weapon(	3416  )
	Weapon(	3417  )
	Weapon(	3418  )
	Weapon(	3419  )
	Weapon(	3420  )
	Weapon(	2941  )
	Defence(	585	) -- Wings of Light
	Defence(	4976	) -- Nature's Whisper
	Defence(	4938	) -- Hammer of Thunder
	Defence(	4957	) -- Eye of Lighting
	Defence(	4974	) -- Morning Bell
	Defence(	860	) -- Ray's Fury
	Defence(	861	) -- Kiss of Nic
	Defence(	862	) -- Consecration of Priestess
	Defence(	863	) -- Peter's Call
	Defence(	1012	) -- Daniel's Regret
	Defence(	5773	) -- Nimble Venturer
	Defence(	5774	) -- Soul Generator
	Defence(	2956	) -- Daniel's Regret
	Defence(	2326	) -- Nimble Venturer
	Defence(	2844	) -- Soul Generator

	Defence(	5775	) -- Daniel's Regret
	Defence(	5772	) -- Nimble Venturer
	Defence(	5771	) -- Daniel's Regret
	Defence(	5770	) -- Nimble Venturer

	Defence(	5751	) -- Daniel's Regret
	Defence(	5772	) -- Nimble Venturer
	Defence(	5771	) -- Daniel's Regret
	Defence(	5770	) -- Nimble Venturer

	Other(	584	) -- Skeletar Chest of Swordsman
	Other(	3880	) -- Skeletar Chest of Hunter
	Other(	3882	) -- Skeletar Chest of Herbalist
	Other(	1134	) -- Skeletar Chest of Explorer
	Other(	2898	) -- Incantation Chest of Crusader
	Other(	2953	) -- Incantation Chest of Champion
	Other(	3338	) -- Incantation Chest of Sharpshooter
	Other(	2988	) -- Incantation Chest of Cleric
	Other(	1083	) -- Incantation Chest of Seal Master
	Other(	1854	) -- Incantation Chest of Voyager
	Other(	3116	) -- Evanescence Chest of Crusader
	Other(	1858	) -- Evanescence Chest of Champion
	Other(	3458	) -- Evanescence Chest of Sharpshooter
	Other(	1854	) -- Evanescence Chest of Cleric
	Other(	3414	) -- Evanescence Chest of Seal Master
	Other(	3415	) -- Evanescence Chest of Voyager
	Other(	3416	) -- Enigma Chest of Crusader
	Other(	3417	) -- Enigma Chest of Champion
	Other(	3418	) -- Enigma Chest of Sharpshooter
	Other(	3419	) -- Enigma Chest of Cleric
	Other(	3420	) -- Enigma Chest of Seal Master
	Other(	3421	) -- Enigma Chest of Voyager



end

------------------------------------------------------------
-- ??????
------------------------------------------------------------

function island()
	local CancelSelectTalk = "Забудь, я останусь здесь "
	local CancelSelectPage = 27
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName3 = "eastgoaf"
	local CurMapName4 = "lonetower"
	local CurMapName5 = "darkblue"
	
	local GoTo01X = 3260
	local GoTo01Y = 3280
	local GoTo01M = CurMapName1
	
	local GoTo02X = 2273
	local GoTo02Y = 1122
	local GoTo02M = CurMapName1
	
	local GoTo03X = 3590
	local GoTo03Y = 755
	local GoTo03M = CurMapName1
	
	local GoTo04X = 2376
	local GoTo04Y = 725
	local GoTo04M = CurMapName2
	
	local GoTo05X = 1730
	local GoTo05Y = 3775
	local GoTo05M = CurMapName2
	
	local GoTo06X = 2529
	local GoTo06Y = 2406
	local GoTo06M = CurMapName2
	
	local GoTo07X = 1631
	local GoTo07Y = 1974
	local GoTo07M = CurMapName5
	
	local GoTo08X = 2231
	local GoTo08Y = 2788
	local GoTo08M = CurMapName1
	
	Talk( 1, "Сильвий: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 1, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 1, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 1, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 1, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 1, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 1, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 1, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 1, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 2, "Андреа: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 2, "Перейти в Аргент ", JumpPage, 21 )
	Text( 2, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 2, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 2, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 2, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 2, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 2, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 2, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 3, "Арсин: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 3, "Перейти в Аргент ", JumpPage, 21 )
	Text( 3, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 3, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 3, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 3, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 3, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 3, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 3, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 4, "Шейла: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 4, "Перейти в Аргент ", JumpPage, 21 )
	Text( 4, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 4, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 4, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 4, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 4, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 4, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 4, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 5, "Джули: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 5, "Перейти в Аргент ", JumpPage, 21 )
	Text( 5, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 5, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 5, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 5, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 5, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 5, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 5, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 6, "Винни: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 6, "Перейти в Аргент ", JumpPage, 21 )
	Text( 6, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 6, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 6, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 6, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 6, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 6, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 6, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 7, "Ванда: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 7, "Перейти в Аргент ", JumpPage, 21 )
	Text( 7, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 7, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 7, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 7, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 7, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 7, "Перейти на остров Удачи ", JumpPage, 20 )
	Text( 7, "Записать точку возвращения ", JumpPage, 25 )
	
	Talk( 8, "Джульета: Привет, я островной портальщик. Стоимость перемещения 2000 золотых. Куда хотите отправиться? " )
	Text( 8, "Перейти в Аргент ", JumpPage, 21 )
	Text( 8, "Перейти на остров Зефира ", JumpPage, 14 )
	Text( 8, "Перейти на Ледниковый остров ", JumpPage, 15 )
	Text( 8, "Перейти на остров Отверженных ", JumpPage, 16 )
	Text( 8, "Перейти на остров Стужи ", JumpPage, 17 )
	Text( 8, "Перейти на остров Канареек ", JumpPage, 18 )
	Text( 8, "Перейти на остров Купидона ", JumpPage, 19 )
	Text( 8, "Записать точку возвращения ", JumpPage, 25 )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 14, "Перейти на остров Зефира? Нет проблем! Стоимость 2000 золотых " )
	Text( 14, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 14, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 15, "Перейти на Ледниковый остров? Нет проблем! Стоимость 2000 золотых " )
	Text( 15, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 15, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 16, "Перейти на остров Отверженных? Нет проблем! Стоимость 2000 золотых " )
	Text( 16, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 )   
	Text( 16, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 17, "Перейти на остров Стужи? Нет проблем! Стоимость 2000 золотых " )
	Text( 17, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 17, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 18, "Перейти на остров Канареек? Нет проблем! Стоимость 2000 золотых " )
	Text( 18, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 18, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 19, "Перейти на остров Купидона? Нет проблем! Стоимость 2000 золотых " )
	Text( 19, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 19, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo07X, GoTo07Y, GoTo07M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 20, "Перейти на остров Удачи? Нет проблем! Стоимость 2000 золотых " )
	Text( 20, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 20, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo08X, GoTo08Y, GoTo08M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 21, "Перейти в Аргент? Нет проблем! Стоимость 2000 золотых " )
	Text( 21, "Перейти ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 21, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, SetSpawnPos, "Argent City")
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, SetSpawnPos, "Zephyr Isle")
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, SetSpawnPos, "Glacier Isle")
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, SetSpawnPos, "Outlaw Isle")
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, SetSpawnPos, "Isle of Chill")
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, SetSpawnPos, "Canary Isle")
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, SetSpawnPos, "Cupid Isle")
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, SetSpawnPos, "Isle of Fortune")
	TriggerFailure( 8, JumpPage, 28 )
	Talk( 25, "Записать точку возвращения? " )
	Text( 25, "Да, пожалуйста запиши ", MultiTrigger, GetMultiTrigger(), 8 )
	Text( 25, "Нет, спасибо ",CloseTalk )
	
	Talk( 26, "Простите, у вас недостаточно денег для перемещения! " )
	
	Talk( 27, "Найди меня если потребуется помощь ", CloseTalk )
	
    Talk( 28, "Невозможно записать точку сохранения! ", CloseTalk )
	
	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, JumpPage, 3 )
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, JumpPage, 4 )
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, JumpPage, 5)
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, JumpPage, 6 )
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, JumpPage, 7)
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, JumpPage, 8 )
	Start( GetMultiTrigger(), 8 )
end

function r_talk221()

	Talk( 1, "Lamon:???? ????? ??? ??????" )
	Text( 1, "??", BuyPage )
	Text( 1, "??????????", JumpPage, 2 )
	Text( 1, "???...",CloseTalk )


	Talk( 2, "Lamon: Corals can be recharged. In the sea, there are many regions. Wind corals need to go to Wind region, Thunder corals to Thunder region and Fog coral to Fog regions...I remember that there is a Thunder region near Argent at (2500, 2850). You can try it there. Remember to equip back the coral after it is recharged.")
	InitTrade()
	Weapon(	0508	)
	Weapon(	0509	)
	Weapon(	0510	)
	Weapon(	0522	)
	Weapon(	0523	)
	Weapon(	0498	)
	Weapon(	0503	)
	Weapon(	0504	)
	Weapon(	0505	)
	Weapon(	0506	)
	Weapon(	0872	)--Fog Coral Lvl 1
	Weapon(	0873	)--Fog Coral Lvl 2
	Weapon(	0874	)--Fog Coral Lvl 3
	Weapon(	0875	)--Fog Coral Lvl 4
	Weapon( 0876	)--Fog Coral Lvl 5
	Weapon(	0635	)
	Weapon(	0636	)
	Weapon(	0637	)
	Weapon(	0638	)
	Weapon(	0639	)
end
function Spirit_04()
	Talk(1, "???! ??? ??? ?? ? ??? ??????:") 
	Text(1, "?? ??? 1", GoTo, 175, 206, "mjing1") 
	Text(1, "?? ??? 2", GoTo, 175, 206, "mjing2") 
	Text(1, "?? ??", GoTo, 205, 264, "mjing3")
	Text(1, "?? ?? 2", GoTo, 205, 264, "mjing4")
	Text(1, "??????????? ?????!", GoTo, 185, 186, "shalan2")  
	Text(1, "??", CloseTalk)
end

function t_abaddon()
Talk( 1, "\193\243\228\252 \238\241\242\240\238\230\237\229\229" )
Text( 1, "\194\238\233\242\232 \226 \192\225\224\228\228\238\237 1 ", GoTo, 154, 786, "jialebi" )
Text( 1, "\205\224\247\224\242\252 \200\241\239\251\242\224\237\232\229... ", GoTo, 28, 30, "hell" )
end

function t_drakon()
Talk( 1, " \207\240\232\226\229\242,\255 \236\238\227\243 \238\242\239\240\224\226\232\242\252 \242\229\225\255 \237\224 \206\241\242\240\238\226 \196\240\224\234\238\237\238\226 " )
Text( 1, " \206\242\239\240\224\226\232\242\241\255 ", GoTo, 275, 209, "prisonisland" )
 end
 
 function t_elizatp()
Talk( 1, " \205\229 \225\238\232\248\252\241\255 \239\243\242\229\248\229\241\242\226\238\226\224\242\252 \226 \253\242\232\245 \234\240\224\255\245?\202\238\227\228\224 \242\238 \231\228\229\241\252 \225\251\235\232 \235\254\228\232,\237\238 \226 \238\228\232\237 \228\229\237\252 \239\240\232\235\229\242\229\235\232 \228\240\224\234\238\237\251 \232 \243\237\232\247\242\238\230\232\235\232 \241\235\224\226\237\251\233 \227\238\240\238\228 \192\235\252\244\245\229\233\236... " )
Text( 1, " \207\240\238\226\238\228\232 \236\229\237\255 \226 \216\224\233\242\224\237 ", GoTo, 642, 874, "magicsea" )

 end
 
 --Тюрьма
function prison_talk01 ()
    Talk ( 1, "\205\243 \239\240\232\226\229\242 \239\235\238\242\226\224,\237\229 \225\238\241\252 \238\242 \241\242\240\224\245\224 \243\230\229 \228\243\236\224\229\248\252 \234\224\234 \225\251 \239\238\241\234\238\240\229\229 \238\242 \241\254\228\224 \241\225\229\230\224\242\252... ")
    Text ( 1, "\211\231\237\224\242\252 \241\239\238\241\238\225 \234\224\234 \226\251\225\240\224\242\252\241\255 \232\231 \242\254\240\252\236\251", JumpPage, 2)
 
    Talk ( 2, "\197\241\242\252 \242\240\232 \241\239\238\241\238\225\224 \226\251\225\240\224\242\252\241\255 \238\242\241\254\228\224.\197\241\235\232 \234\238\237\229\247\237\238 \243 \242\229\225\255 \234\232\248\234\224 \237\229 \242\238\237\234\224! ")
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 1", JumpPage, 3)
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 2", JumpPage, 4)
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 3", JumpPage, 5)
 
    Talk ( 3, "\209\239\238\241\238\225 1: \194\251 \236\238\230\229\242\229 \239\238\228\238\233\242\232 \234 \205\224\228\231\232\240\224\242\229\235\254,\239\238\235\243\247\232\242\252 \196\229\235\238 \238 \224\240\229\241\242\229.\207\238\236\229\241\242\232\226 \253\242\238\242 \228\238\234\243\236\229\237\242 \226 \242\240\229\242\232\233 \241\235\238\242 \226\224\248\229\227\238 \232\237\226\229\237\242\224\240\255,\232 \239\240\238\225\251\226 2 \247\224\241\224 \226 \242\254\240\252\236\229,\226\251 \241\236\238\230\229\242\229 \238\225\236\229\237\255\242\252 \229\227\238 \237\224 \241\226\238\225\238\228\243 ")
    Text ( 3, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 3, "\211\233\242\232", CloseTalk)
 
    Talk ( 4, "\209\239\238\241\238\225 \237\238\236\229\240 2: \200\231\226\229\241\242\237\238,\247\242\238 \243 \195\235\224\226\251 \199\224\234\235\254\247\229\237\237\251\245 \229\241\242\252 \196\238\234\243\236\229\237\242 \237\224 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229.\197\241\235\232 \242\251 \241\236\238\230\229\248 \226\231\255\242\252 \229\227\238 \241\232\235\238\233, \242\238\227\228\224 \242\251 \225\243\228\229\248\252 \238\241\226\238\225\238\230\228\229\237 \205\224\228\231\232\240\224\242\229\235\229\236. ")
    Text ( 4, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 4, "\211\233\242\232", CloseTalk)
 
    Talk ( 5, "\209\239\238\241\238\225 \237\238\236\229\240 3: \197\241\235\232 \243 \226\224\241 \229\241\242\252 \210\224\235\238\237 \207\238\241\235\243\248\237\238\227\238 \195\240\224\230\228\224\237\232\237\224, \226\251 \242\224\234\230\229 \236\238\230\229\242\229 \239\240\232\237\229\241\242\232 \229\229 \205\224\228\231\232\240\224\242\229\235\254 \242\254\240\252\236\251 \232 \236\238\235\232\242\252 \238\225 \238\241\226\238\225\238\230\228\229\237\232\232.")
    Text ( 5, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 5, "\211\233\242\232", CloseTalk)
 
    AddNpcMission   (6231)
end
 
function prison_talk02 ()
    Talk ( 1, "\199\228\240\224\226\241\242\226\243\233.\210\251 \237\224\245\238\228\232\248\252\241\255 \237\224 \236\238\229\233 \242\229\240\240\232\242\238\240\232\232.\199\228\229\241\252 \255 \243\241\242\224\237\238\226\232\235 \241\226\238\232 \239\240\224\226\232\235\224 \232 \242\251 \228\238\235\230\229\237\237 \232\245 \241\238\225\235\254\228\224\242\252.\207\238\237\255\242\237\238?!")
    InitTrigger()
    TriggerCondition( 1, NoItem, 5724, 1 )
    TriggerCondition( 1, HasRecord, 1280 )
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, GiveItem, 5724, 1, 4)
    TriggerAction( 1, JumpPage, 2)
    TriggerFailure( 1, JumpPage, 5)
    Text ( 1, "\223 \245\238\247\243 \239\238\235\243\247\232\242\252 \196\229\235\238 \238 \192\240\229\241\242\229", MultiTrigger, GetMultiTrigger(), 1)
    Text ( 1, "\223 \245\238\247\243 \226\251\225\240\224\242\252\241\255 \238\242\241\254\228\224...", JumpPage, 4)
 
    Talk ( 2, "\205\229 \231\224\225\243\228\252\242\229 \239\238\236\229\241\242\232\242\252 \196\229\235\238 \238 \192\240\229\241\242\229 \226 \242\240\229\242\232\233 \241\235\238\242 \226\224\248\229\227\238 \232\237\226\229\237\242\224\240\255.")
 
    Talk ( 4, "\197\241\235\232 \243 \226\224\241 \229\241\242\252 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229 \232\235\232 \226\251 \238\242\225\251\235\232 \241\226\238\233 \241\240\238\234 \237\224\234\224\231\224\237\232\255,\242\238 \226\251 \236\238\230\229\242\229 \239\238\234\232\237\243\242\252 \242\229\240\240\232\242\238\240\232\254 \242\254\240\252\236\251.")
    InitTrigger()
    TriggerCondition( 1, Checkjlktime )
    TriggerAction( 1, TakeItem, 5724, 1)
    TriggerAction( 1, Leaveprison )
    TriggerCondition( 2, HasItem, 5723, 1)
    TriggerAction( 2, TakeItem, 5723, 1)
    TriggerAction( 2, Leaveprison )
    TriggerFailure( 2, JumpPage, 6)
    Text ( 4, "\207\238\242\226\229\240\228\232\242\252 \226\251\245\238\228", MultiTrigger, GetMultiTrigger(), 2)
    Text ( 4, "\223 \238\241\242\224\254\241\252 \231\228\229\241\252", CloseTalk)
 
    Talk ( 5, "\194\251 \237\229 \236\238\230\229\242\229 \226\231\255\242\252 \196\229\235\238 \238 \192\240\229\241\242\229!\207\240\238\226\229\240\252\242\229,\231\224\234\238\237\247\232\235\232 \235\232 \226\251 \234\226\229\241\242 [\207\243\242\252 \206\241\226\238\225\238\230\228\229\237\232\255].\197\241\235\232 \226\251 \229\227\238 \226\251\239\238\235\237\232\235\232 \232 \226\241\229 \229\249\229 \237\229 \236\238\230\229\242\229 \226\231\255\242\252 \196\229\235\238 \238 \192\240\229\241\242\229,\239\240\238\226\229\240\252\242\229 \226\224\248 \232\237\226\229\237\242\224\240\252 (\197\241\242\252 \235\232 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \232 \238\237 \237\229 \231\224\225\235\238\234\232\240\238\226\224\237).\194\229\241\252\236\224 \226\238\231\236\238\230\237\238 \247\242\238 \226\251 \243\230\229 \239\238\235\243\247\232\235\232 \238\228\237\238 \196\229\235\238 \238 \192\240\229\241\242\229.")
    Talk ( 6, "\194\251\239\238\235\237\229\237\251 \237\229 \226\241\229 \243\241\235\238\226\232\255.\194\251 \238\241\242\224\229\242\229\241\252 \231\228\229\241\252.")
 
    AddNpcMission   (6230)
 
end

function prison_talk03 ()
    Talk ( 1, "\204\224\241\242\229\240: \207\240\232\226\229\242 \226\232\237\238\226\224\242\251\233,\237\243 \247\242\238 \230\229 \245\238\247\229\248\252 \226\251\225\240\224\242\252\241\255 \238\242 \241\254\228\224 \240\224\237\252\248\229 \241\240\238\234\224? ")
    Text ( 1, "\196\224", JumpPage, 2)
 
    Talk ( 2, "\210\238\227\228\224 \242\229\225\229 \239\238\242\240\229\225\243\229\242\241\255 \245\238\240\238\248\229\237\252\234\238 \239\238\240\224\225\238\242\224\242\252.\207\240\232\237\229\241\232 \236\237\229 100 \210\254\240\229\236\237\238\233 \208\243\228\251,\232 100 \210\254\240\229\236\237\251\245 \193\240\184\226\229\237,\226 \231\224\236\229\237 \255 \228\238\227\238\226\238\240\254\241\252 \241 \205\224\247\224\235\252\237\232\234\238\236!")
    Text ( 2, "\194\238\242 \238\237\232!", JumpPage, 3)

    Talk ( 3, "\197\241\235\232 \243 \226\224\241 \229\241\242\252 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229 \232\235\232 \226\251 \238\242\225\251\235\232 \241\226\238\233 \241\240\238\234 \237\224\234\224\231\224\237\232\255,\242\238 \226\251 \236\238\230\229\242\229 \239\238\234\232\237\243\242\252 \242\229\240\240\232\242\238\240\232\254 \242\254\240\252\236\251,\239\238\227\238\226\238\240\232\226 \241 \205\224\247\224\235\252\237\232\234\238\236! ")
    InitTrigger()
    TriggerCondition( 1, HasItem, 1670, 100)
	TriggerCondition( 1, HasItem, 7659, 100)
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
	TriggerAction( 1, TakeItem, 1670, 100)
	TriggerAction( 1, TakeItem, 7659, 100)
	TriggerAction( 1, GiveItem, 5723, 1, 4)
    TriggerFailure( 1, JumpPage, 5)
    Text(3,"\213\238\240\238\248\238 ",MultiTrigger,GetMultiTrigger(),1)

 
    Talk ( 5, "\204\229\237\255 \237\229 \238\225\236\224\237\243\242\252! ")
 
 
end


--Священник
--Служит для выдачи Свадебных сертификатов

function wedding_npc01()
 
    Talk(1, "\209\226\255\249\229\237\237\232\234: \207\240\232\226\229\242\241\242\226\243\254, \255 \240\229\227\232\241\242\240\232\240\243\254 \225\240\224\234." )
    Text(1, "\223 \245\238\247\243 \243\231\237\224\242\252 \242\240\229\225\238\226\224\237\232\255 \234 \225\240\224\234\243.", JumpPage, 2)
    Text(1, "\223 \245\238\247\243 \231\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252 \225\240\224\234.", JumpPage, 3)
    Text(1, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
   
   
    Talk(2, "\210\240\229\225\238\226\224\237\232\255: 1. \211 \236\238\235\238\228\238\230\229\237\238\226 \228\238\235\230\237\251 \225\251\242\252 \202\238\235\252\246\224 \209\226\255\242\238\227\238 \194\224\235\229\237\242\232\237\224. 2. \204\238\235\238\228\238\230\229\237\251 \196\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229. 3. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\240\232\237\229\241\242\232 10 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\251\245. 4. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\238\235\243\247\232\242\252 \232 \238\242\234\240\251\242\252 \241\226\238\232 \241\243\237\228\243\234\232 \244\229\233.")
    Text(2, "\213\238\240\238\248\238, \255 \239\238\237\255\235. \199\224\240\229\227\232\241\242\240\232\240\243\233\242\229!", JumpPage, 3)
    Text(2, "\196\224\233\242\229 \239\238\228\243\236\224\242\252...", CloseTalk)
   
   
    Talk(3, "\209\226\255\249\229\237\237\232\234: \197\241\235\232 \242\251 \227\238\242\238\226, \239\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232. \207\238\241\235\229 \240\229\227\232\241\242\240\224\246\232\232 \242\251 \239\238\235\243\247\232\248\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \209 \237\232\236 \236\238\230\237\238 \237\224\247\224\242\252 \246\229\240\229\236\238\237\232\254 \241\226\224\228\252\225\251 \243 \194\238\235\248\229\225\237\232\234\224 \215\232\242\224\237\224")
   
    InitTrigger()
    TriggerCondition(1, MarryCertificate)
    TriggerAction(1, JumpPage, 4)
    TriggerFailure(1, JumpPage, 5)
    Text(3, "\207\238\228\242\226\229\240\228\232\242\252", MultiTrigger, GetMultiTrigger(), 1)
    Text(3, "\196\224\233\242\229 \229\249\229 \240\224\231 \239\238\228\243\236\224\242\252.", CloseTalk)
   
   
    Talk(4, "\209\226\255\249\229\237\237\232\234: \207\238\231\228\240\224\226\235\255\254! \210\251 \242\238\235\252\234\238 \247\242\238 \239\238\235\243\247\232\235 \209\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242! \221\242\238 \241\224\236\251\233 \239\229\240\226\251\233 \248\224\227 \234 \225\240\224\234\243. \210\229\239\229\240\252 \238\247\229\240\229\228\252 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232, \229\241\235\232 \243 \237\229\229 \226\241\229 \229\249\229 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224...")
    Text(4, "\209\239\224\241\232\225\238!", CloseTalk)
   
   
    Talk(5, "\209\226\255\249\229\237\237\232\234: \205\229 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \241\238\225\235\254\228\229\237\251! \207\238\230\224\235\243\233\241\242\224, \238\231\237\224\234\238\236\252\241\255 \241 \242\240\229\225\238\226\224\237\232\255\236\232 \234 \225\240\224\234\243.")
    Text(5, "\211\231\237\224\242\252 \241 \242\240\229\225\238\226\224\237\232\255\236\232 \234 \225\240\224\234\243.", JumpPage, 2)
    Text(5, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
 
end
 

--Майлада
--Служит для:
-- * Покупки билетов на посещение церкви
-- * Проведения аукционов на церковь
-- * Покупки приглашений на свадьбу

function wedding_npc02()
   
    Talk( 1, "\204\224\233\235\224\228\224: \225\238\227 \236\232\235\238\241\229\240\228\229\237. \223 \239\240\232\227\235\224\248\224\254 \242\229\225\255 \237\224 \209\226\255\242\243\254 \231\229\236\235\254 \232\236\229\237\229\236 \241\226\238\229\227\238 \227\238\241\239\238\228\232\237\224!" )
    Text( 1, "\206 \214\229\240\234\226\232", JumpPage, 17)
 
    Talk( 17, "\204\224\233\235\224\228\224: \213\238\247\229\248\252 \224\240\229\237\228\238\226\224\242\252 \214\229\240\234\238\226\252? \223 \236\238\227\243 \241\228\229\235\224\242\252 \241\229\227\238\228\237\255 \241\234\232\228\234\243." )
    Text( 17, "\202\240\224\242\234\238\229 \238\239\232\241\224\237\232\229 \246\229\240\234\226\232", JumpPage, 6)
    Text( 17, "\214\229\240\234\238\226\237\224\255 \241\242\224\226\234\224", ListAuction)
    Text( 17, "\202\243\239\232\242\252 \225\232\235\229\242 \226 \246\229\240\234\238\226\252", JumpPage, 2 )
    Text( 17, "\202\243\239\232\242\252 \239\240\232\227\235\224\248\229\237\232\255", JumpPage, 5)
 
    InitTrigger()
    TriggerCondition( 1, HasMoney,5000 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerAction( 1, TakeMoney, 5000 )
    TriggerAction(1, GiveItem, 3024, 1 , 4)
    TriggerAction( 1, JumpPage, 3)
    TriggerFailure( 1, JumpPage, 4 )
    Talk(2, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\252 \253\242\238 \236\229\241\242\238 \227\228\229 \237\224\247\232\237\224\229\242\241\255 \241\247\224\241\242\252\229, \227\228\229 \235\254\225\238\226\252 \253\242\238 \227\235\224\226\237\238\229. \207\240\232\245\238\228\232 \237\224 \253\234\241\234\243\240\241\232\254 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234 \241 17:00 \228\238 17:10. \225\232\235\229\242 \241\242\238\232\242 \226\241\229\227\238 5000 \231\238\235\238\242\251\245.")
    Text(2, "\207\238\228\242\226\229\240\228\232\242\252 \239\238\234\243\239\234\243",  MultiTrigger, GetMultiTrigger(), 1)
 
    Talk(3, "\207\240\232\227\235\224\248\224\229\236 \237\224 \253\234\241\234\243\240\241\232\254 \226\238 \226\240\229\236\229\237\232.")
    Talk(4, "\204\224\233\235\224\228\224: \211 \242\229\225\255 \237\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224! \200\235\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252. \207\238\236\237\232, \237\243\230\237\224 1 \239\243\241\242\224\255 \255\247\229\233\234\224.")
   
    Talk( 5, "\204\224\233\235\224\228\224: \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \228\235\255 \239\238\235\243\247\229\237\232\255 \241\238\238\242\226\229\242\241\242\226\243\254\249\232\245 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\245 \225\232\235\229\242\238\226. \202\224\230\228\251\229 10 \234\243\241\238\247\234\238\226 \239\240\232\227\235\224\241\232\242\229\235\252\237\238\227\238 \225\232\235\229\242\224 \241\238\241\242\224\226\235\255\254\242 \229\228\232\237\238\229 \246\229\235\238\229. 50 000 \231\238\235\238\242\251\245 \228\238\235\230\237\238 \225\251\242\252 \243\239\235\224\247\229\237\238 \231\224 1 \248\242\243\234\243. \207\240\232\227\235\224\241\232 \228\240\243\231\229\233 \237\224 \226\229\247\229\240\232\237\234\243!" )
    Text( 5, "\207\238\228\242\226\229\240\228\232\242\252 \239\238\234\243\239\234\243", ChangeItem, 1)
   
    Talk( 6, "\204\224\233\235\224\228\224: \206 \247\229\236 \242\251 \245\238\247\229\248\252 \243\231\237\224\242\252?" )
    Text( 6, "\206 \239\238\241\229\249\229\237\232\232", JumpPage, 7)
    Text( 6, "\206 \214\229\240\234\238\226\237\238\236 \224\243\234\246\232\238\237\229", JumpPage, 8)
    Text( 6, "\206\225 \232\241\239\238\235\252\231\238\226\224\237\232\232 \246\229\240\226\234\232", JumpPage, 9)
    Text( 6, "\206 \208\224\231\240\229\248\229\237\232\232 \214\229\240\234\226\232", JumpPage, 10)
 
    Talk( 7, "\204\224\233\235\224\228\224: \200\227\240\238\234\232 \234\238\242\238\240\251\229 \234\243\239\232\235\232 \225\232\235\229\242\251 \226 \246\229\240\234\238\226\252 \236\238\227\243\242 \239\238\241\229\242\232\242\252 \229\229 \241 17:00 \228\238 17:10 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234.")
    Text( 7, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 7, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 8, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\237\251\233 \192\243\234\246\232\238\237 \239\240\238\245\238\228\232\242 \241 18:00 \228\238 20:30 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234. \204\232\237\232\236\224\235\252\237\251\233 \248\224\227 \224\243\234\246\232\238\237\224: \209\242\224\226\238\247\237\224\255 \234\224\240\242\238\247\234\224. \214\229\240\229\236\238\237\232\232 \239\240\238\226\238\228\255\242\241\255 \239\238 2 \234\224\230\228\251\233 \226\251\245\238\228\237\238\233.")
    Text( 8, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 8, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 9, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\237\251\233 \192\243\234\246\232\238\237 \239\238\228\229\235\229\237 \237\224 4 \239\229\240\232\238\228\224. \207\238\225\229\228\232\242\229\235\252 \239\238\235\243\247\224\229\242 \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \232 10 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\245 \225\232\235\229\242\238\226.")
    Text( 9, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 9, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 10, "\204\224\233\235\224\228\224: \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \239\238\231\226\238\235\232\242 \234\243\239\232\242\252 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\229 \225\232\235\229\242\251, \228\226\238\233\237\238\229 \237\224\230\224\242\232\229 \239\238 \208\224\231\240\229\248\229\237\232\254 \239\229\240\229\236\229\241\242\232\242 \242\229\225\255 \226 \246\229\240\234\238\226\252. \209\239\243\241\242\255 2 \247\224\241\224 \226\241\229 \243\247\224\241\242\237\232\234\232 \225\243\228\243\242 \226\238\231\226\240\224\249\229\237\251 \226 \216\224\233\242\224\237.")
    Text( 10, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 10, "\205\224\231\224\228", JumpPage, 6)
end
 

--Свидетель
--Служит для запуска фейерверков

function wedding_npc03()
 
    InitTrigger()
    TriggerCondition(1, CheckWeddingTime)
    TriggerAction(1, JumpPage, 1)
    TriggerFailure(1, JumpPage, 3)
    Start(GetMultiTrigger(), 1)
   
    Talk (1, "\209\226\232\228\229\242\229\235\252: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
 
    InitTrigger()
    TriggerCondition( 1, HasMoney, 200)
    TriggerAction(1, TakeMoney, 200)
    TriggerAction(1, LaunchFirework)
    TriggerFailure(1, JumpPage, 2)
 
    Text(1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
    Text(1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
 
    Talk(2, "\209\226\232\228\229\242\229\235\252: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
    Text(2, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
   
    Talk(3, "\209\226\232\228\229\242\229\235\252: \207\240\232\226\229\242! \202\224\234 \242\229\225\229 \226 \246\229\240\234\226\232?")
end
 

--Свидетельница
--Служит для запуска фейерверков

function wedding_npc04()
 
    InitTrigger()
    TriggerCondition(1, CheckWeddingTime)
    TriggerAction(1, JumpPage, 1)
    TriggerFailure(1, JumpPage, 3)
    Start(GetMultiTrigger(), 1)
   
    Talk (1, "\209\226\232\228\229\242\229\235\252\237\232\246\224: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
 
    InitTrigger()
    TriggerCondition(1, HasMoney, 200)
    TriggerAction(1, TakeMoney, 200)
    TriggerAction(1, LaunchFirework)
    TriggerFailure(1, JumpPage, 2)
 
    Text (1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
    Text (1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
 
    Talk (2, "\209\226\232\228\229\242\229\235\252\246\224: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
    Text (2, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
   
    Talk(3, "\209\226\232\228\229\242\229\235\252\237\232\246\224: \207\240\232\226\229\242! \202\224\234 \242\229\225\229 \226 \246\229\240\234\226\232?")
end
 

--Первосвященник
--Служит для свадьбы персонажей

function wedding_npc05()

	InitTrigger()
    TriggerAction(1, Marry)
    TriggerFailure(1, JumpPage, 4)
   
    Talk(1, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \193\229\240\229\248\252 \235\232 \242\251 \226  \231\224\234\238\237\237\251\229 \230\229\237\251(\236\243\230\252\255) \253\242\238\227\238 \247\229\235\238\226\229\234\224? \209\238\227\235\224\241\229\237(\224) \235\232 \242\251 \232 \226 \227\238\240\229 \232 \226 \240\224\228\238\241\242\232 \225\251\242\252 \241 \237\232\236?" )
    Text(1, "\196\224. \223 \241\238\227\235\224\241\229\237(\224).", MultiTrigger, GetMultiTrigger(), 1)
    Text(1, "\204\237\229 \237\224\228\238 \239\238\228\243\236\224\242\252...", CloseTalk)
   
    Talk(2, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \207\238\231\228\240\224\226\235\255\229\236 \194\224\241! \210\229\239\229\240\252 \194\251 \236\243\230 \232 \230\229\237\224!")
    Talk(3, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \223 \237\229 \236\238\227\243 \226\229\237\247\224\242\252 \194\224\241! \205\229 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \241\238\225\235\254\228\229\237\251!")
   
    Talk(4, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \199\228\240\224\226\241\242\226\243\233, \243\228\224\247\237\238\233 \253\234\241\234\243\240\241\232\232 \239\238 \246\229\240\234\226\232...")
   
end

function reading_talk01 ()
 
    Talk (1, "\221\234\231\224\236\229\237\224\242\238\240: \205\224\228\229\254\241\252 \242\251 \226\241\184 \226\251\243\247\232\235? ")
        --Talk (1, "Экзаменатор: Я экзаменатор Ледыни, буду помогать тебе проходить тесты. Положи Студенческую карту в инвентарь, перед началом испытаний.")
 
    InitTrigger ()
    TriggerCondition (1, HasItem, 3279, 1)
    TriggerCondition (1, HasItem, 3289, 1)
    TriggerAction (1, checkcytime)
    TriggerFailure (1, JumpPage, 4)
    Text (1, "\207\229\240\229\226\238\228 \238\239\251\242\224 \241 \234\224\240\242\251", MultiTrigger, GetMultiTrigger (), 1)
        --Text (1, "Перевод опыта с карты.", MultiTrigger, GetMultiTrigger (), 1)
 
    Text (1, "\210\240\229\225\238\226\224\237\232\255 \228\235\255 \239\229\240\229\226\238\228\224 \238\239\251\242\224", JumpPage, 5)
        --Text (1, "Требования для перевода опыта.", JumpPage, 5)
   
    Text (1, "\215\242\238 \229\249\229 \231\224 \242\229\241\242\232\240\238\226\224\237\232\229? ", JumpPage, 6)
        --Text (1, "Что еще за тестирование?", JumpPage, 6)
 
    Talk (4, "\221\234\231\224\236\229\237\224\242\238\240: \194 \242\226\238\229\236 \232\237\226\229\237\242\224\240\229 \237\229\242 \209\242\243\228\229\237\247\229\241\234\238\233 \234\224\240\242\251!")
        --Talk (4, "Экзаменатор: В твоем инвентаре нет Студенческой карты!")
 
    Talk (5, "\221\234\231\224\236\229\237\224\242\238\240: \210\240\229\225\238\226\224\237\232\255 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255 \241\242\240\238\227\232. \194 \242\226\238\229\236 \240\254\234\231\224\234\229 \228\238\235\230\237\224 \225\251\242\252 \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224.")
        --Talk (5, "Экзаменатор: Требования для прохождения тестирования строги. В твоем рюкзаке должна быть Студенческая карта.")
 
    Talk (6, "\221\234\231\224\236\229\237\224\242\238\240: \194 \240\254\234\231\224\234\229 \228\238\235\230\237\224 \225\251\242\252 \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224 \228\235\255 \237\224\247\224\235\224 \242\229\241\242\232\240\238\226\224\237\232\255. \207\238\241\235\229 \226\251\239\238\235\237\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255, \194\224\236 \225\243\228\229\242 \226\251\228\224\237 \242\224\225\229\235\252 \238\225 \243\241\239\229\226\224\229\236\238\241\242\232 \226 \241\238\238\242\226\229\241\242\226\232\232 \241 \194\224\248\232\236\232 \243\241\239\229\245\224\236\232..")
        --Talk (6, "Экзаменатор: В рюкзаке должна быть Студенческая карта для начала тестирования. После выполнения тестирования, Вам будет выдан табель об успеваемости в соотвествии с Вашими успехами..")
 
    AddNpcMission (112)
 
end
 
function reading_talk02 () 
	Talk (1, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \223 \239\229\240\229\226\238\228\237\238\233 \253\234\231\224\236\229\237\224\242\238\240 \203\229\228\251\237\232. \223 \239\240\238\228\224\254 \242\229\241\242\238\226\251\229 \231\224\228\224\237\232\255 \228\235\255 \207\229\240\229\226\238\228\237\238\227\238 \253\234\231\224\236\229\237\224.")
		--Talk (1, "Переводной Экзаменатор: Я переводной экзаменатор Ледыни. Я продаю тестовые задания для Переводного экзамена.") 

	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, HasLeaveBagGrid, 1) 
	TriggerCondition (1, HasNoItem, 3280) 
	TriggerCondition (1, HasNoItem, 3281) 
	TriggerCondition (1, HasNoItem, 3282) 
	TriggerAction (1, AddChaItem7) 
	TriggerFailure (1, JumpPage, 2) 
	Text (1, "\223 \245\238\242\229\235 \225\251 \231\224\225\240\224\242\252 \242\229\241\242\238\226\251\229 \231\224\228\224\237\232\255!", MultiTrigger, GetMultiTrigger (), 1)
		--Text (1, "Я хотел бы забрать тестовые задания!", MultiTrigger, GetMultiTrigger (), 1) 

	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, CheckKJNum) 
	TriggerCondition (1, HasItem, 3280, 1) 
	TriggerCondition (1, HasItem, 3282, 1) 
	TriggerAction (1, AddChaItem8) 
	TriggerAction (1, TakeItem, 3282, 1) 
	TriggerFailure (1, JumpPage, 3) 
	Text (1, "\223 \226\251\239\238\235\237\232\235 \242\229\241\242 \232 \245\238\247\243 \239\238\235\243\247\232\242\252 \210\224\225\229\235\252 \243\241\239\229\226\224\229\236\238\241\242\232!", MultiTrigger, GetMultiTrigger (), 2) 
		--Text (1, "Я выполнил тест и хочу получить Табель успеваемости!", MultiTrigger, GetMultiTrigger (), 2) 
	
	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, HasItem, 3289, 1) 
	TriggerCondition (1, HasItem, 3281, 1) 
 	TriggerAction (1, checksjtime) 
 	TriggerFailure (1, JumpPage, 4)
	Text (1, "\194\238\231\252\236\232 \242\224\225\229\235\252 \232 \239\240\238\226\229\240\252 \241\226\238\232 \240\229\231\243\235\252\242\224\242\251!", MultiTrigger, GetMultiTrigger (), 1) 
		--Text (1, "Возьми табель и проверь свои результаты!", MultiTrigger, GetMultiTrigger (), 1) 

	Text (1, "\202\224\234\232\229 \242\240\229\225\238\226\224\237\232\255 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255?", JumpPage, 5) 
		--Text (1, "Какие требования для прохождения тестирования?", JumpPage, 5) 

	Text (1, "\215\242\238 \232\231 \241\229\225\255 \239\240\229\228\241\242\224\226\235\255\229\242 \242\229\241\242\232\240\238\226\224\237\232\229?", JumpPage, 6)
		--Text (1, "Что из себя представляет тестирование?", JumpPage, 6) 
 
	Talk (2, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\251 \237\229 \236\238\230\229\248\252 \237\224\247\224\242\252 \242\229\241\242. \207\240\238\226\229\240\252, \247\242\238 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \226\251\239\238\235\237\229\237\251.") 
		--Talk (2, "Переводной Экзаменатор: Ты не можешь начать тест. Проверь, что все требования выполнены.") 

	Talk (3, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \211 \242\229\225\255 \228\238\235\230\237\224 \225\251\242\252 \238\228\237\224 \225\243\236\224\227\224 \241 \242\229\241\242\238\236 \232 \238\228\232\237 \235\232\241\242 \241 \238\242\226\229\242\224\236\232 \228\235\255 \239\238\235\243\247\229\237\232\255 \242\224\225\229\235\255.") 
		--Talk (3, "Переводной Экзаменатор: У тебя должна быть одна бумага с тестом и один лист с ответами для получения табеля.") 

	Talk (4, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \211 \242\229\225\255 \237\229\242 \210\224\225\229\235\255 \243\241\239\229\226\224\229\236\238\241\242\232.")
		--Talk (4, "Переводной Экзаменатор: У тебя нет Табеля успеваемости.") 

	Talk (5, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\240\229\225\238\226\224\237\232\255 \228\235\255 \243\247\224\241\242\232\255 \226 \207\229\240\229\226\238\228\237\238\236 \221\234\231\224\236\229\237\229 \241\235\229\228\243\254\249\232\229: \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224 \241 \239\238\235\237\251\236 \234\238\235\232\247\229\241\242\226\238\236 \238\239\251\242\224. \192 \242\224\234 \230\229, \243 \242\229\225\255 \237\229 \228\238\235\230\237\238 \225\251\242\252 \242\229\241\242\238\226\251\245 \225\243\236\224\227, \235\232\241\242\238\226 \241 \238\242\226\229\242\224\236\232 \232 \242\224\225\229\235\229\233 \243\241\239\229\226\224\229\236\238\241\242\232.")
		--Talk (5, "Переводной Экзаменатор: Требования для участия в Переводном Экзамене следующие: Студенческая карта с полным количеством опыта. А так же, у тебя не должно быть тестовых бумаг, листов с ответами и табелей успеваемости.") 

	Talk (6, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\251 \228\238\230\229\237 \239\238\235\243\247\232\242\252 \242\229\241\242 \239\229\240\229\228 \237\224\247\224\235\238\236 \207\229\240\229\226\238\228\237\238\227\238 \221\234\231\224\236\229\237\224. \207\238\241\235\229 \231\224\226\229\240\248\229\237\232\255 \242\229\225\229 \228\224\228\243\242 \235\232\241\242 \228\235\255 \238\242\226\229\242\238\226. \207\240\232\237\229\241\232 \236\237\229 \229\227\238 \232 \239\238\235\243\247\232\248\252 \242\224\225\229\235\252 \241 \238\246\229\237\234\238\233. \223 \237\224\227\240\224\230\243 \242\229\225\255 \239\238 \243\241\239\229\226\224\229\236\238\241\242\232.") 
		--Talk (6, "Переводной Экзаменатор: Ты дожен получить тест перед началом Переводного Экзамена. После завершения тебе дадут лист для ответов. Принеси мне его и получишь табель с оценкой. Я награжу тебя по успеваемости.") 
 
	AddNpcMission (6138) 

end

 function t_ckorb()
Talk( 1, " \206\241\242\240\238\226 \209\234\238\240\225\232,\242\238 \236\229\241\242\238 \227\228\229 \235\254\228\232 \242\229\240\255\254\242 \239\238\241\235\229\228\237\254\254 \237\224\228\229\230\228\243,\231\240\255 \226\251 \241\254\228\224 \239\240\232\248\235\232.... " )
Text( 1, " \207\240\238\226\238\228\232 \236\229\237\255 \226 \216\224\233\242\224\237 ", GoTo, 643, 871, "magicsea" )

 end

