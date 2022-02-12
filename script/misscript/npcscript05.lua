--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "loading NPCScript05.lua" )


----------------------------------------------------------Appereal Carsise

function t_ledset()
	Talk( 1, "Здравствуй,за чем пожаловал в эти края? " )
	Text( 1, "Ледяное Оружие (400 Уровень) ", JumpPage, 2)
	Text( 1, "Ледяная Экипировка (400 Уровень) ", JumpPage, 3)
	Text( 1, "Ледяное Кольцо (400 Уровень) ", JumpPage, 4)
	Text( 1, "Ледяное Ожерелье (400 Уровень) ", JumpPage, 5)
	Text( 1, "Ледяная Шапка (400 Уровень) ", JumpPage, 6)

	Talk( 2, "Камень улучшения Паучьего оружия до Ледяного будет стоить: 100 Ледяных Кристаллов,100 Пива Пиратов,100,Платков Северного Пирата,100 Барбекю Пирата,100 Эмблема Пирата,а так же 1000 Рун Кэль,1 Карту Главного Пирата,400 Репутации и 40.000.000 золота " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 7673, 100 )
	TriggerCondition( 1, HasItem, 7674, 100 )
	TriggerCondition( 1, HasItem, 7675, 100 )
	TriggerCondition( 1, HasItem, 7676, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 7673, 100 )
	TriggerAction( 1, TakeItem, 7674, 100 )
	TriggerAction( 1, TakeItem, 7675, 100 )
	TriggerAction( 1, TakeItem, 7676, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7684, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 2, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(3,"Выбирай ")
	Text( 3, "Броня ", JumpPage, 8)
	Text( 3, "Перчатки ", JumpPage, 9)
	Text( 3, "Ботинки ", JumpPage, 10)

	Talk( 4, "Вы должны иметь Паучье Кольцо,и с помощью Ледяного Осколка улучшить его у Кузнеца.Ледяной Осколок выпадает с Главного Пирата,шанс выпадения - 5% " )
	Text( 4, "Спасибо ", CloseTalk)

	Talk(5,"Камень улучшения Паучьего Ожерелья до Ледяного будет стоить: 100 Платков Северного Пирата,100,Ледяных Полумесяцев,100 Эмблема Пирата,3 Карты Северного Воина,1 Карта Арамиса,1 Карта Главного Пирата,400 Репутации и 40.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7675, 100 )
	TriggerCondition( 1, HasItem, 7612, 100 )
	TriggerCondition( 1, HasItem, 7676, 100 )
	TriggerCondition( 1, HasItem, 7441, 1 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7773, 3 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7675, 100 )
	TriggerAction( 1, TakeItem, 7612, 100 )
	TriggerAction( 1, TakeItem, 7676, 100 )
	TriggerAction( 1, TakeItem, 7441, 1 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7773, 3 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7672, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 5, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk(6,"Камень улучшения Паучьей Шапки до Ледяной будет стоить:100 Ледяных Полумесяцев,100 Пива Пиратов,100 Барбекю Пирата,1 Карта Арамиса,1 Карта Шкатулки Арамиса,2 Карты Северного Воина,2 Карты Младшего Пирата,2 Карты Пирата Абордажника,2 Карты Старшего Пирата,400 репутации и 40.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7612, 100 )
	TriggerCondition( 1, HasItem, 7673, 100 )
	TriggerCondition( 1, HasItem, 7674, 100 )
	TriggerCondition( 1, HasItem, 7441, 1 )
	TriggerCondition( 1, HasItem, 7777, 1 )
	TriggerCondition( 1, HasItem, 7773, 2 )
	TriggerCondition( 1, HasItem, 7774, 2 )
	TriggerCondition( 1, HasItem, 7775, 2 )
	TriggerCondition( 1, HasItem, 7776, 2 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7612, 100 )
	TriggerAction( 1, TakeItem, 7673, 100 )
	TriggerAction( 1, TakeItem, 7674, 100 )
	TriggerAction( 1, TakeItem, 7441, 1 )
	TriggerAction( 1, TakeItem, 7777, 1 )
	TriggerAction( 1, TakeItem, 7773, 2 )
	TriggerAction( 1, TakeItem, 7774, 2 )
	TriggerAction( 1, TakeItem, 7775, 2 )
	TriggerAction( 1, TakeItem, 7776, 2 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7756, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 6, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)

	
	Talk(7,"Не хватает лута! ")
	
	
	Talk(8,"Камень улучшения Паучьей Брони до Ледяной будет стоить: 1000 Рун Кэль,100 Ледяных Кристаллов,100 Золотых Монет,1 Карту Главного Пиратов,1 Карту Младшего Пирата,1 Карту Пирата Абордажника,1 Карту Старшего Пирата,400 Репутации 40.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7757, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 8, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk(9,"Камень улучшения Паучьих Перчаток до Ледяных будет стоить: 1000 Рун Кэль,100 Ледяных Кристаллов,100 Золотых Монет,1 Карту Главного Пиратов,1 Карту Младшего Пирата,1 Карту Пирата Абордажника,1 Карту Старшего Пирата,400 Репутации 40.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7758, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 9, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)


	Talk(10,"Камень улучшения Паучьих Ботинок до Ледяных будет стоить: 1000 Рун Кэль,100 Ледяных Кристаллов,100 Золотых Монет,1 Карту Главного Пиратов,1 Карту Младшего Пирата,1 Карту Пирата Абордажника,1 Карту Старшего Пирата,400 Репутации 40.000.000 золота ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7759, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 10, "Обмен ", MultiTrigger, GetMultiTrigger(), 1)


end

function t_ledinfa()
	Talk( 1, "Здесь не жарко,так что долго не задерживайся... " )
	Text( 1, "Вернутся в Шайтан ", GoTo, 644, 868, "magicsea" )
	Text( 1, "Информация об острове ", JumpPage, 2)
	
	Talk( 2, "Остров состоит из двух частей,что соединяет океан... " )
	Text( 2, "Монстры ", JumpPage, 3)
	Text( 2, "Боссы ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Младший Пират ", JumpPage, 5)
	Text( 3, "Пират Абордажник ", JumpPage, 6)
	Text( 3, "Старший Пират ", JumpPage, 7)

	Talk( 4, "В данный момент здесь присутствуют: " )
	Text( 4, "Батя Пиратов ", JumpPage, 8)


	Talk( 5, "Младший Пират,время воскрешения - 30 секунд,список выпадаемых предметов: " )
	Text( 5, "Золотая Монета ", CloseTalk)
	Text( 5, "Ледяной Кристалл ", CloseTalk)
	Text( 5, "Пиво Пиратов ", CloseTalk)
	Text( 5, "Барбекю Пиратов ", CloseTalk)
	Text( 5, "Карта Пирата ", CloseTalk)
	Text( 5, "Сундук Заточки ", CloseTalk)

	
	Talk( 6, "Пират Абордажник,время воскрешения - 30 секунд,список выпадаемых предметов: " )
	Text( 6, "Золотая Монета ", CloseTalk)
	Text( 6, "Ледяной Кристалл ", CloseTalk)
	Text( 6, "Пиво Пиратов ", CloseTalk)
	Text( 6, "Барбекю Пиратов ", CloseTalk)
	Text( 6, "Карта Пирата ", CloseTalk)
	Text( 6, "Сундук Заточки ", CloseTalk)
	
	Talk( 7, "Старший Пират,время воскрешения - 30 секунд,список выпадаемых предметов: " )
	Text( 7, "Золотая Монета ", CloseTalk)
	Text( 7, "Ледяной Кристалл ", CloseTalk)
	Text( 7, "Пиво Пиратов ", CloseTalk)
	Text( 7, "Барбекю Пиратов ", CloseTalk)
	Text( 7, "Карта Пирата ", CloseTalk)
	Text( 7, "Сундук Заточки ", CloseTalk)
	
	Talk( 8, "Батя Пиратов,время воскрешения - 30 минут,список выпадаемых предметов: " )
	Text( 8, "Карта Главаря Пиратов ", CloseTalk)
	Text( 8, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 8, "Ледяная Сфера ", CloseTalk)
	Text( 8, "Ключ из Пурпурного Кристалла ", CloseTalk)
	Text( 8, "Сундук из Пурпурного Кристалла ", CloseTalk)
end



function t_ledinfo()
	Talk( 1, "Вы находитесь на Стуже 2,это вторая часть острова.Здесь вы можете встретить Арамиса,а так же отыскать его сокровища... " )
	Text( 1, "Монстры ", JumpPage, 2)
	Text( 1, "Боссы ", JumpPage, 3)

	Talk( 2, "В данный момент здесь присутствуют: " )
	Text( 2, "Северный Воин ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Арамис ", JumpPage, 5)
	Text( 3, "Сундук Арамиса ", JumpPage, 6)

	Talk( 4, "Северный Воин,время воскрешения - 30 секунд,список выпадаемых предметов: " )
	Text( 4, "Ледяной Полумесяц ", CloseTalk)
	Text( 4, "Платок Северного Пирата ", CloseTalk)
	Text( 4, "Эмблема Пирата ", CloseTalk)
	Text( 4, "Купюра 10.000 ", CloseTalk)
	Text( 4, "Сундук Заточки ", CloseTalk)

	
	Talk( 5, "Арамис,время воскрешения - 30 минут,список выпадаемых предметов: " )
	Text( 5, "Ключ Арамиса ", CloseTalk)
	Text( 5, "Карта Арамиса ", CloseTalk)
	Text( 5, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 5, "Расписка на Нефрит ", CloseTalk)
	Text( 5, "Ключ из Пурпурного Кристалла ", CloseTalk)
	Text( 5, "Ключ Зеленого Дракона ", CloseTalk)
	Text( 5, "Ключ Черного Дракона ", CloseTalk)
	Text( 5, "Купюра 500.000 ", CloseTalk)
	
	Talk( 6, "Сундук Арамиса,время воскрешения - 30 минут,список выпадаемых предметов: " )
	Text( 6, "Сундук Арамиса ", CloseTalk)
	Text( 6, "Сундук из Пурпурного Кристалла ", CloseTalk)
	Text( 6, "Сундук Зеленого Дракона ", CloseTalk)
	Text( 6, "Сундук Черного Дракона ", CloseTalk)
	Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 6, "Купюра 500.000 (2шт) ", CloseTalk)
end

function JoJo_05 () -- Honor Exchanger

	Talk( 1, " Exchange 4M For 9999 Honor" )

	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, HasMoney, 4000000 )
	TriggerAction( 1, TakeMoney, 4000000 )
	TriggerAction( 1, AddCredit, 9999 )
	Text( 1, "obtain 9999 honor", MultiTrigger, GetMultiTrigger(), 1)

end


function JoJo_13 ()

	Talk( 1, "Hello! Reputation Shop!!" )
	Text( 1, "Learn Navigation Skill", BuyPage )
	Text(1,"Exchange Money To Reputation!",JumpPage,2)
	Text( 1, "Thanks [Close]", CloseTalk)
   
	InitTrigger()
	TriggerCondition( 1, HasMoney, 4000000 )
	TriggerAction( 1, TakeMoney, 4000000 )
	TriggerAction( 1, DelRoleCredit, -9999 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "If You Want Get 9999 Reputation, Pay Me 4 Millions Gold! And Dont Forget Say Thanks!" )
	Text( 2, "Get 9999 Reputation",  MultiTrigger, GetMultiTrigger(), 1 )
	Text( 2, "I Will Get Money Later [Close]", CloseTalk)

	Talk(3, "I Hope You Know How Use So Much Reputation!")

	Talk(4, "Sorry, But You Dont Have 4 Million Gold! Come Back When You Have!.")
	end 


function sky_07 ()
	
	
	Talk( 1, "\199\228\240\224\241\242\226\243\233, \243 \236\229\237\255 \229\241\242\252 \238\247\229\237\252 \236\237\238\227\238 \232\237\242\229\240\229\241\237\251\245 \226\229\249\229\233." )
	Text( 1, "\207\238\241\236\238\242\240\229\242\252", BuyPage )
	
	InitTrade()
	Weapon(	453	) 
	Weapon(	455	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	891	)
	Weapon(	454	)
	Weapon(	890	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	) 
	Defence(	3112	)
	Defence(	3113	)
	Other(	3300	)
	Other(	3301	)

end


function r_HeSToP3 ()

	--Карта
	local CurMapName1 = "hell"


	--Абаддон05
	local GoTo01X = 110
	local GoTo01Y = 230
	local GoTo01M = CurMapName1

	--Абаддон06
	local GoTo02X = 225
	local GoTo02Y = 30
	local GoTo02M = CurMapName1

	--Абаддон07
	local GoTo03X = 110
	local GoTo03Y = 150
	local GoTo03M = CurMapName1

	--Абаддон08
	local GoTo04X = 230
	local GoTo04Y = 150
	local GoTo04M = CurMapName1

	Talk( 1, "\207\238\240\242\224\235\252\249\232\234 \224\225\224\228\228\238\237\224: \207\240\232\226\229\242! \198\229\235\224\229\248\252 \238\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237?" )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 05", JumpPage, 2 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 06", JumpPage, 3 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 07", JumpPage, 4 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 08", JumpPage, 5 )
	Text( 1, "\211\233\242\232", CloseTalk )

	--Абаддон05
	InitTrigger()
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	Talk( 2, " \192\225\224\228\228\238\237 05? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 2, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2)

	--Абаддон06
	InitTrigger()
	TriggerAction( 2,  GoTo, GoTo02X, GoTo01Y, GoTo02M )
	Talk( 3, " \192\225\224\228\228\238\237 06? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 3, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2 )

	--Абаддон07
	InitTrigger()
	TriggerAction( 2,  GoTo, GoTo03X, GoTo03Y, GoTo03M )
	Talk( 4, " \192\225\224\228\228\238\237 07? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 4, "\210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2 )

	--Абаддон08
	InitTrigger()
	TriggerAction( 2, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	Talk( 5, " \192\225\224\228\228\238\237 08? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 5, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2)

end



function PVP_npc()

	Talk( 1, "PvP \240\229\230\232\236" ) -- PvP режим
	Text( 1, "\194\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", JumpPage, 2) -- Включить PK статус
	Text( 1, " \194\251\234\235\254\247\232\242\252 PK \241\242\224\242\243\241  ", JumpPage, 3) -- Выключить PK статус
	
	InitTrigger()
	TriggerAction( 1, SetPkState, 1 ) -- Устанавливаем PK статус на 1. Т.е. включаем
	TriggerAction(1,SystemNotice, "\194\251 \226\238\248\235\232 \226 PK \241\242\224\242\243\241. \210\229\239\229\240\252 \194\251 \236\238\230\229\242\229 \237\224\239\224\228\224\242\252 \237\224 \228\240\243\227\232\245 \232\227\240\238\234\238\226, \243 \234\238\242\238\240\251\245 \242\238\230\229 \226\234\235\254\247\229\237 PK \241\242\224\242\243\241.  " ) -- Сообщение в систему "Вы вошли в PK статус. Теперь Вы можете нападать на других игроков, у которых тоже включен PK статус. " 
	TriggerFailure( 1, JumpPage, 4 ) -- Если не удалось включить PK статус нас откинет на 4 страницу
	Talk( 2, " \194\251 \228\229\233\241\242\226\232\242\229\235\252\237\238 \245\238\242\232\242\229 \226\234\235\254\247\232\242\252 PvP \240\229\230\232\236? ")
	Text( 2, " \194\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", MultiTrigger, GetMultiTrigger(), 1) --Включить PK статус
	
	InitTrigger()
	TriggerAction( 1, SetPkState, 0 ) -- Устанавливаем PK статус на 0. Т.е. отключаем
	TriggerAction(1,SystemNotice, "PK статус выключен." ) -- Сообщение в систему "PK статус выключен." 
	TriggerFailure( 1, JumpPage, 4 ) -- Если не удалось включить PK статус нас откинет на 4 страницу
	Talk( 3, " \194\251 \228\229\233\241\242\226\232\242\229\235\252\237\238 \245\238\242\232\242\229 \226\251\234\235\254\247\232\242\252 PvP \240\229\230\232\236? " ) --Вы действительно хотите выключить PvP режим?
	Text( 3, " \194\251\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", MultiTrigger, GetMultiTrigger(), 1) -- Выключить PK статус


	Talk( 4, " \205\229 \243\228\224\235\238\241\252 \226\238\233\242\232 \226 PVP \240\229\230\232\236  " ) -- Не удалось войти в PVP режим 
	

end

function Spirit_10 () 

	Talk( 1, "Exchanger: Выберете оружие !заметка: 600 карт болотного духа на 95 ансилы " )
	Text( 1, " Искупление Чести ( голова ) ", JumpPage,3)
	Text( 1, " Страж Чести ( тело) ", JumpPage, 4)
	Text( 1, " Благославление Чести ( руки ) ", JumpPage,5 )
	Text( 1, " Милосердие Чести ( ноги ) ", JumpPage, 6)
	Text( 1, " следующяя страница ", JumpPage,12 )
	Text( 12, " Искупление Жертвы ( голова ) ", JumpPage, 14)
	Text( 12, " Страж Жертвы ( тело ) ", JumpPage, 15)
	Text( 12, " Благославление Жертвы ( руки ) ", JumpPage, 16)
	Text( 12, " Милосердие Жертвы ( ноги ) ", JumpPage, 17)
	
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3499, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3500, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3501, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3502, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3503, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(13,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3511, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(14,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3512, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(15,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3513, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(16,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3514, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(17,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_11 () 

	Talk( 1, "Exchanger: Выберете оружие !заметка: 600 карт болотного духа на 95 ансилы " )
	Text( 1, " Искупление Эпической Доблести( голова ) ", JumpPage,3)
	Text( 1, " Страж Эпической Доблести ( тело) ", JumpPage,4)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3505, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3506, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_12 () 

	Talk( 1, "Exchanger: Выберете оружие !заметка: 600 карт болотного духа на 95 ансилы " )
	Text( 1, " Искупление Жертвы ( голова ) ", JumpPage, 3)
	Text( 1, " Страж Жертвы ( тело ) ", JumpPage, 4)
	Text( 1, " Благославление Жертвы ( руки ) ", JumpPage, 5)
	Text( 1, " Милосердие Жертвы ( ноги ) ", JumpPage, 6)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3511, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3512, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3513, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3514, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_13 () 

	Talk( 1, "Exchanger: Выберете оружие !заметка: 600 карт болотного духа на 95 ансилы " )
	Text( 1, " Искупление Правосудия ( голова) ", JumpPage, 3)
	Text( 1, " Страж Правосудия ( тело ) ", JumpPage, 4)
	Text( 1, " Благославление Правосудия ( руки ) ", JumpPage, 5)
	Text( 1, " Милосердие Правосудия ( ноги ) ", JumpPage,6)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3515, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3516, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3517, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3518, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3519, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_14 () 

	Talk( 1, "Exchanger: Выберете оружие !заметка: 600 карт болотного духа на 95 ансилы " )
	Text( 1, " Искупление Сочувствия ( голова ) ", JumpPage,3)
	Text( 1, " Страж Сочувствия ( тело ) ", JumpPage,4)
	Text( 1, " Благославление Сочувствия ( руки ) ", JumpPage,5)
	Text( 1, " Милосердие Сочувствия ( ноги ) ", JumpPage,6)
	Text( 1, " следующяя страница ", JumpPage,12 )
	Text( 12, " Искупление Вдохновения ( голова) ", JumpPage,8)
	Text( 12, " Страж Вдохновения ( тело ) ", JumpPage,9 )
	Text( 12, " Благославление Вдохновения ( руки) ", JumpPage, 10)
	Text( 12, " Милосердие Вдохновения ( ноги) ", JumpPage, 11)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3520, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3521, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3522, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3523, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3524, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3525, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(7,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3526, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(8,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3527, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(9,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3528, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(10,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3529, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(11,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_Exc () 

	Talk( 1, "Exchanger:Я распечатаю ваш 95 ансил за 20 рун каждого вида:Учтивости,Благочестия,Сострадания,Храбрости,Льда!" )
	Text( 1, " Меч Небес ", JumpPage, 5 )
	Text( 1, " Щит Кавалериста ", JumpPage, 6 )
	Text( 1, " Карающий Лук ", JumpPage, 7 )
	Text( 1, " Оружие правосудия ", JumpPage, 8 )
	Text( 1, " Бесшумное Лезвие ", JumpPage, 9 )
	Text( 1, " Нержавеющий Меч ", JumpPage, 10 )
	Text( 1, " Посох Жертвы ", JumpPage,11 )
	Text( 1, " Посох Жизни ", JumpPage,12 )

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6165, 1 )	
	TriggerAction( 1, TakeItem, 6165, 1 )
	TriggerAction( 1, GiveItem, 3499, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6166, 1 )	
	TriggerAction( 1, TakeItem, 6166, 1 )
	TriggerAction( 1, GiveItem, 6097, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6167, 1 )	
	TriggerAction( 1, TakeItem, 6167, 1 )
	TriggerAction( 1, GiveItem, 3504, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(7,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6168, 1 )	
	TriggerAction( 1, TakeItem, 6168, 1 )
	TriggerAction( 1, GiveItem, 3509, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(8,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6169, 1 )	
	TriggerAction( 1, TakeItem, 6169, 1 )
	TriggerAction( 1, GiveItem, 3515, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(9,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6170, 1 )	
	TriggerAction( 1, TakeItem, 6170, 1 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(10,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6171, 1 )	
	TriggerAction( 1, TakeItem, 6171, 1 )
	TriggerAction( 1, GiveItem, 3525, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(11,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6172, 1 )	
	TriggerAction( 1, TakeItem, 6172, 1 )
	TriggerAction( 1, GiveItem, 3520, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(12,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "У вас нет необходимых вещей!" )
	Talk( 27, "Можете одеть ваше оружие!" )
end

function JoJo_06 () -- Newbie Quests

	Talk( 1, "Newbie Quest:welcome here for Newbie Quest" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(1122)
	AddNpcMission(1130)
	AddNpcMission(1135)

	Text( 2, "Newbie Quest", JumpPage,3 )
	Text( 2, "Newbie Quest 2", JumpPage,4 )
	Text( 2, "Newbie Quest 3", JumpPage,5 )

	Talk( 3, "1620 | 3116 | 3130" )

	Talk( 4, "855" )

	Talk( 5, "2588" )
end

function JoJo_07 () -- Equips Quest

	Talk( 1, "Equips Quests" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(9977)
	AddNpcMission(9966)
	AddNpcMission(9955)
	AddNpcMission(9944)
	AddNpcMission(9933)
	AddNpcMission(9922)
	AddNpcMission(9911)

	Talk( 2, "2476" )
end

function JoJo_08 () -- Higher level Quest

	Talk( 1, "Higher Level Quests:Hi! im Leveler Quest" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(1123)
	AddNpcMission(1124)

	Text( 2, "Lv80-90", JumpPage,3 )
	Text( 2, "Lv90-150", JumpPage,4 )

	Talk( 3, "2605 | 3085 | 4783" )
	Talk( 4, "3453 | 3826" )
end

function ingrysty()
Talk( 1, "Я обмениваю ансы 45 на 10 новых пергаментов " )
Text( 1, "Хочу хочу ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 684 , 10 , 786 , 1 , 1)
ExchangeDataX( 684 , 10 , 778 , 1 , 1)
ExchangeDataX( 684 , 10 , 774 , 1 , 1)
ExchangeDataX( 684 , 10 , 790 , 1 , 1)
ExchangeDataX( 684 , 10 , 764 , 1 , 1)
ExchangeDataX( 684 , 10 , 804 , 1 , 1)
ExchangeDataX( 684 , 10 , 793 , 1 , 1)
ExchangeDataX( 684 , 10 , 796 , 1 , 1)
ExchangeDataX( 684 , 10 , 771 , 1 , 1)
ExchangeDataX( 684 , 10 , 800 , 1 , 1)
ExchangeDataX( 684 , 10 , 767 , 1 , 1)
ExchangeDataX( 684 , 10 , 782 , 1 , 1)

end  

function ingrysty1()
Talk( 1, "Я обмениваю ансы 55 на 1 изменчивую руну " )
Text( 1, "Хочу хочу ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 1028 , 1 , 877 , 1 , 1)
ExchangeDataX( 1028 , 1 , 815 , 1 , 1)
ExchangeDataX( 1028 , 1 , 810 , 1 , 1)
ExchangeDataX( 1028 , 1 , 809 , 1 , 1)
ExchangeDataX( 1028 , 1 , 808 , 1 , 1)
ExchangeDataX( 1028 , 1 , 807 , 1 , 1)
ExchangeDataX( 1028 , 1 , 805 , 1 , 1)
ExchangeDataX( 1028 , 1 , 801 , 1 , 1)
ExchangeDataX( 1028 , 1 , 787 , 1 , 1)
ExchangeDataX( 1028 , 1 , 783 , 1 , 1)
ExchangeDataX( 1028 , 1 , 779 , 1 , 1)
ExchangeDataX( 1028 , 1 , 775 , 1 , 1)
ExchangeDataX( 1028 , 1 , 772 , 1 , 1)
ExchangeDataX( 1028 , 1 , 768 , 1 , 1)
ExchangeDataX( 1028 , 1 , 765 , 1 , 1)
ExchangeDataX( 1028 , 1 , 791 , 1 , 1)
ExchangeDataX( 1028 , 1 , 794 , 1 , 1)
ExchangeDataX( 1028 , 1 , 797 , 1 , 1)
ExchangeDataX( 1028 , 1 , 811 , 1 , 1)
ExchangeDataX( 1028 , 1 , 812 , 1 , 1)

end  

function ingrysty2()
Talk( 1, "Я обмениваю ансы 65 на 2 изменчивой руны " )
Text( 1, "Хочу хочу ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 1028 , 2 , 773 , 1 , 1)
ExchangeDataX( 1028 , 2 , 776 , 1 , 1)
ExchangeDataX( 1028 , 2 , 788 , 1 , 1)
ExchangeDataX( 1028 , 2 , 795 , 1 , 1)
ExchangeDataX( 1028 , 2 , 802 , 1 , 1)
ExchangeDataX( 1028 , 2 , 784 , 1 , 1)
ExchangeDataX( 1028 , 2 , 769 , 1 , 1)
ExchangeDataX( 1028 , 2 , 798 , 1 , 1)
ExchangeDataX( 1028 , 2 , 780 , 1 , 1)
ExchangeDataX( 1028 , 2 , 806 , 1 , 1)
ExchangeDataX( 1028 , 2 , 792 , 1 , 1)
ExchangeDataX( 1028 , 2 , 766 , 1 , 1)

end

function ingrysty3()
Talk( 1, "Я обмениваю всякие разности на что нибудь вкусненькое " )
Text( 1, "Хочу хочу ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 681 , 2 , 7125 , 1 , 1)
ExchangeDataX( 7125 , 2 , 7126 , 1 , 1)
ExchangeDataX( 6249 , 10 , 7002 , 1 , 1)
ExchangeDataX( 6249 , 15 , 5702 , 1 , 1)
ExchangeDataX( 3116 , 35 , 1812 , 1 , 1)

end

function ghfr3 ()

	Talk( 1, "Обмен на Карту перерождения: Нужно 10 ангельских костей, 10 мощь (Грома, Мороза, Ветра, Огонь) " )
	Text( 1, "Хочу хочу ", JumpPage, 5)

	InitTrigger()
	Talk( 5, "У вас точно все есть? ну тогда обменивайте " )
	TriggerCondition( 1, LvCheck, ">", 85 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 271, 10 )
	TriggerCondition( 1, HasItem, 270, 10 )
	TriggerCondition( 1, HasItem, 269, 10 )
	TriggerCondition( 1, HasItem, 268, 10 )
	TriggerCondition( 1, HasItem, 267, 10 )	
	TriggerAction( 1, TakeItem, 271, 10 )
	TriggerAction( 1, TakeItem, 270, 10 )
	TriggerAction( 1, TakeItem, 269, 10 )
	TriggerAction( 1, TakeItem, 268, 10 )
	TriggerAction( 1, TakeItem, 267, 10 )
	TriggerAction( 1, GiveItem, 2941, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "Обмен прошел не удачно " )
	Talk( 27, "Обмен прошел удачно " )

end

function ghfr9 ()

	Talk( 1, "Я обменник на свитки колец и ожерельев! " )
	Text( 1, "Свиток колец ", JumpPage, 5)
	Text( 1, "Свиток ожерельев ", JumpPage, 6)

	InitTrigger()
	Talk( 5, "Нужно по 10 расписок, 1;2;3 приз! " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2668, 10 )
	TriggerCondition( 1, HasItem, 2667, 10 )
	TriggerCondition( 1, HasItem, 2666, 10 )	
	TriggerAction( 1, TakeItem, 2668, 10 )
	TriggerAction( 1, TakeItem, 2667, 10 )
	TriggerAction( 1, TakeItem, 2666, 10 )
	TriggerAction( 1, GiveItem, 580, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 6, "Нужно по 10 расписок, 1;2;3 приз! " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2668, 10 )
	TriggerCondition( 1, HasItem, 2667, 10 )
	TriggerCondition( 1, HasItem, 2666, 10 )	
	TriggerAction( 1, TakeItem, 2668, 10 )
	TriggerAction( 1, TakeItem, 2667, 10 )
	TriggerAction( 1, TakeItem, 2666, 10 )
	TriggerAction( 1, GiveItem, 581, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "Обмен прошел не удачно " )
	Talk( 27, "Обмен прошел удачно " )

end


function old2()


	Talk( 1,  "Продовщица фей: Приветик, я тебе могу предложить все для феи, заходи!) " )
	Text( 1,  "Посмотреть ", BuyPage )
	Text( 1,  "Свадьба фей ", OpenEidolonMetempsychosis )

		InitTrade()
	Defence(	0280	)
	Defence(	0232	)
	Defence(	0233	)
	Defence(	0234	)
	Defence(	0235	)
        Defence(	0609	)
	Defence(	0279	)
	Defence(	0278	)
	Defence(	0277	)
	Defence(	0276	)
	Defence(	  226)
	Defence(	  225)
	Defence(	  222)
	Defence(	  224)
	Defence(	0260	)
	Defence(	0253	)
	Defence(	0250	)
	Defence(	0223	)
	Defence(	0247	)
	Defence(	0244	)
	Defence(	2312	)
	Defence(	3918	)
	Defence(      578	)
	Defence(    3919	)
	Defence(	 3920)
	Defence(	 3921)
	Defence(	 3922)
	Defence(	 3925)
	Other( 4540	)
	Other( 3443	)
	Other( 4533	)
	Other( 3437	)
	Other( 4530	)
	Other( 3436	)
	Other( 3434	)
	Other( 1196	)
	Other( 3436	)
	Other( 3442	)
	Other( 1253	)
	Other( 4537	)
	Other( 3444	)
	
end


function ghfr25 ()

	Talk( 1, "Я обменник Монет Фей на что нибудь вкусное " )
	Text( 1, "МФ на деньги ", JumpPage, 5)
	Text( 1, "Получить 10 дерева ", JumpPage, 6)
	--Text( 1, "Крылья бабочки ", JumpPage, 7)
	--Text( 1, "Дьявольские крылья ", JumpPage, 8)
	--Text( 1, "Крылья дракона ", JumpPage, 9)
	--Text( 1, "Вампирские крылья ", JumpPage, 10)
	--Text( 1, "Радужные крылья ", JumpPage, 11)

	InitTrigger()
	Talk( 5, "За 50 мф, я тебе дам 50к денег " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 855, 50 )	
	TriggerAction( 1, TakeItem, 855, 50 )
	TriggerAction( 1, AddMoney, 50000 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 6, "Нужно 300 МФ для обмена на 10 дерево " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 855, 300 )	
	TriggerAction( 1, TakeItem, 855, 300 )
	TriggerAction( 1, GiveItem, 4543, 10, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 7, "Нужно 100 Нержавеющей стали | 300 Высохший корня " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 935, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(7,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 8, "Нужно 100 Нержавеющей стали | 300 Высохший корня " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 906, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(8,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 9, "Нужно 100 Нержавеющей стали | 300 Высохший корня " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 905, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(9,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 10, "Нужно 100 Нержавеющей стали | 300 Высохший корня " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 904, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(10,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 11, "Нужно 100 Нержавеющей стали | 300 Высохший корня " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 142, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(11,"Обменять " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "Обмен прошел не удачно " )
	Talk( 27, "Обмен прошел удачно " )

end

function r_LiveExp()

	Talk( 1, "Здравствуй, я даю за 3кк, 1 мирное очко " )
	Text( 1, "Обменять ", JumpPage, 2)

	Talk(2,"Точно хочешь?) ")
	InitTrigger()
	TriggerCondition( 1, HasMoney, 3000000 )
	TriggerAction( 1, TakeMoney, 3000000 )
	TriggerAction( 1, AddExpAndType,2,20000,20000)
	TriggerFailure( 1, JumpPage, 3 )
	TriggerAction( 1, JumpPage, 4 )
	Text(2,"Да ",MultiTrigger,GetMultiTrigger(),1)

	Talk( 3, "К сожелению у тебя не хватает денег ")
	Talk( 4, "Ты получил 1 мирное очко ")

end

function r_LiveEx()

	Talk( 1, "Пойдёшь со мной? " )
	--Text( 1, "Камень перерождения ", JumpPage, 2)
	Text(1, "Идём ", GoTo, 1751,914, "jialebi")


	Talk(2,"За 100кк ты его получишь ")
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, GiveItem, 2235, 1, 4 )
	TriggerFailure( 1, JumpPage, 3 )
	TriggerAction( 1, JumpPage, 4 )
	Text(2,"Да ",MultiTrigger,GetMultiTrigger(),1)

	Talk( 3, "К сожелению у тебя не хватает денег ")
	Talk( 4, "Ты получил Камень перерождения ")

end

function r_Live()

	Talk(1, "Здравствуй пацан, куда ты хочешь полететь?")
	Text(1, "Затерянный город ", GoTo, 304, 305, "abandonedcity")
	Text(1, "Темная топь ", GoTo, 327, 333, "darkswamp")
	Text(1, "Уйти", CloseTalk)

end

function npc_job ()

	Talk(1, "Профессор: Вы хотите стать Мечником?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(1, "Мечник", MultiTrigger, GetMultiTrigger(), 1)

	Talk(2, "Профессор: Вы хотите стать Чемпионом?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 8)
	TriggerFailure(1, JumpPage, 11)
	Text(2, "Чемпион", MultiTrigger, GetMultiTrigger(), 1)

	Talk(3, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Мечник", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 2)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Стрелок", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	--Text(4, "Swordsman", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 2)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Стрелок", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Целитель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "Целитель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 9)
	TriggerFailure(1, JumpPage, 11)
	Text(6, "Воитель ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 12)
	TriggerFailure(1, JumpPage, 11)
	Text(7, "Стрелок ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 16)
	TriggerFailure(1, JumpPage, 11)
	Text(8, "Покоритель морей ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(9, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 13)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "Клерик ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 14)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "Колдунья ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(10, "Профессор: у вас должен быть уровень "..JobCh.Level.First.." и "..JobCh.Money.First.." золота, чтобы получить первую профессию! ")
	Text(10, "Уйти ", CloseTalk)

	Talk(11, "Профессор: у вас должен быть уровень "..JobCh.Level.Second.." и "..JobCh.Money.Second.." золота, чтобы получить вторую профессию! ")
	Text(11, "Уйти ", CloseTalk)

	Talk(12, "Профессор: О чем вы беспокоитесь? У вас уже есть профессия! ")
	Text(12, "Уйти ", CloseTalk)

	InitTrigger()
	-- Carsise Swordman
	TriggerCondition(1, PfEqual, 0)
	TriggerCondition(1, IsCategory, 2)
	TriggerAction(1, JumpPage, 1)
	-- Carsise Champion
	TriggerCondition(2, PfEqual, 1)
	TriggerCondition(2, IsCategory, 2)
	TriggerAction(2, JumpPage, 2)
	-- Lance: Swordsman/Hunter/Explorer
	TriggerCondition(3, PfEqual, 0)
	TriggerCondition(3, IsCategory, 1)
	TriggerAction(3, JumpPage, 3)
	-- Phyllis: Swordsman/Hunter/Exporer/Herbalist
	TriggerCondition(4, PfEqual, 0)
	TriggerCondition(4, IsCategory, 3)
	TriggerAction(4, JumpPage, 4)
	-- Ami: Explorer/Herbalist
	TriggerCondition(5, PfEqual, 0)
	TriggerCondition(5, IsCategory, 4)
	TriggerAction(5, JumpPage, 5)
	-- Lance/Phyllis: Crusader
	TriggerCondition(6, PfEqual, 1)
	TriggerAction(6, JumpPage, 6)
	-- Lance/Phyllis: Sharpshooter
	TriggerCondition(7, PfEqual, 2)
	TriggerAction(7, JumpPage, 7)
	-- Lance/Phyllis/Ami: Voyager
	TriggerCondition(8, PfEqual, 4)
	TriggerAction(8, JumpPage, 8)
	-- Phyllis/Ami: Cleric/Seal Master
	TriggerCondition(9, PfEqual, 5)
	TriggerAction(9, JumpPage, 9)
	TriggerAction(10, JumpPage, 12)
	Start(GetMultiTrigger(), 10)

end

function dmg_99  ()
	
	
	Talk( 1, "Привет я продавец шапок!  " )
	Text( 1, "Купить", BuyPage )

	InitTrade()
Defence(	2583	)
Defence(	2553	)
Defence(	2584	)
Defence(		)
Defence(		)

end
function lol_bot33  ()
	
	
	Talk( 1, "Привет я продавец крыльев!  " )
	Text( 1, "Купить", BuyPage )

	InitTrade()
Defence(	904	)
Defence(	906	)
Defence(	937	)
Defence(	936	)
Defence(	905	)
Defence(	141	)
Defence(	142	)
Defence(	935	)

end


function t_talkt1 ()
Talk( 1, "Для вытаскивания аппарели из экипировки,поместите её в 4 слот инвентаря " )
Text( 1,  "Положить ", JumpPage, 2)
Text( 1,  "Вытащи мне самоцвет ", OpenGetStone )
Text( 1,  "Вытащи мою аппарель ", UnfuseNpc )

Text( 2, " Забрать реф 2 уровня! ", JumpPage, 3)
Text( 2, " Забрать реф 3 уровня! ", JumpPage, 4)
Text( 2, " Забрать реф 4 уровня! ", JumpPage, 5)
Text( 2, " Забрать реф 5 уровня! ", JumpPage, 6)
Text( 2, " Забрать реф 6 уровня! ", JumpPage, 7)
Text( 2, " Забрать реф 7 уровня! ", JumpPage, 8)
Text( 2, " Забрать реф 8 уровня! ", JumpPage, 9)
Text( 2, " Забрать реф 9 уровня! ", JumpPage, 10)


Talk(3," Давай 2 расписки и 2 чёрные жемчужины! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,2 )
TriggerAction( 1, GiveItem, 885,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," Давай 4 расписки и 4 чёрные жемчужины! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,4 )
TriggerAction( 1, GiveItem, 885,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(5," Давай 8 расписок и 8 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,8 )
TriggerAction( 1, GiveItem, 885,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 16 расписок и 16 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,16 )
TriggerAction( 1, GiveItem, 885,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(7," Давай 32 расписок и 32 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,32 )
TriggerAction( 1, GiveItem, 885,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(8," Давай 64 расписок и 64 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,64 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,64 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,64 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,64 )
TriggerAction( 1, GiveItem, 885,1,107 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(8," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(9," Давай 128 расписок и 128 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,128 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,128 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,128 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,128 )
TriggerAction( 1, GiveItem, 885,1,108 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(9," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(10," Давай 256 расписок и 256 чёрных жемчужин! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,256 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,3362,256 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3877,256 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 3362,256 )
TriggerAction( 1, GiveItem, 885,1,109 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(10," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(2," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )

end


function t_derevpa()
Talk( 1, "Добро пожаловать в Деревню Пауков,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 641, 875, "magicsea" )
Text( 1, "Информация по Деревне ", JumpPage, 2)

	Text( 2, "Монстры ", JumpPage, 3)
	Text( 2, "Боссы ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Паук ", JumpPage, 5)
	
	Talk( 4, "В данный момент здесь присутствуют: " )
	Text( 4, "Батя Пауков ", JumpPage, 6)
	
	Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	Text( 5, "Паутина ", CloseTalk)
	Text( 5, "Расписка на Реф ", CloseTalk)
	Text( 5, "Руна Кэль ", CloseTalk)
	Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 5, "Паучий Яд ", CloseTalk)
	Text( 5, "Сундук Заточки ", CloseTalk)
	Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	Text( 6, "Карта Паука ", CloseTalk)
	Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 6, "Купюра 100.000 ", CloseTalk)
	Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_derevband()
Talk( 1, "Добро пожаловать в Лагерь Бандитов,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "Информация по Лагерю ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Ждёмс ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Ждёмс ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_oazisph()
Talk( 1, "Добро пожаловать в Пчелиный Оазис,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "Информация по Оазису ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Ждёмс ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Ждёмс ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_cherepx()
Talk( 1, "Добро пожаловать в Рощу Черепах,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "Информация по Оазису ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Ждёмс ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Ждёмс ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_skelets()
Talk( 1, "Добро пожаловать в Лагерь Пустынных Скелетов,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "Информация по Оазису ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Ждёмс ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Ждёмс ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_pchoaz()
Talk( 1, "Добро пожаловать в Лагерь Пустынных Скелетов,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "Информация по Оазису ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Ждёмс ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Ждёмс ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end


function r_comb ()
Talk( 1, "Привет мой отец был комбайнером,по этому равных мне по умению ты не найдёшь нигде! " )
Text( 1, " Гем +4 2 уровня ", JumpPage, 3)
Text( 1, " Гем +4 3 уровня ", JumpPage, 4)
Text( 1, " Гем +4 4 уровня ", JumpPage, 5)
Text( 1, " Гем +4 5 уровня ", JumpPage, 6)

Talk(3," Какие гемы тебя интересуют? " )
Text( 3, " Самоцвет Силы ", JumpPage, 11)
Text( 3, " Самоцвет Ловкости ", JumpPage, 12)
Text( 3, " Самоцвет Телосложения ", JumpPage, 13)
Text( 3, " Самоцвет Точности ", JumpPage, 14)
Text( 3, " Самоцвет Духа ", JumpPage, 15)

Talk(4," Какие гемы тебя интересуют? " )
Text( 4, " Самоцвет Силы ", JumpPage, 16)
Text( 4, " Самоцвет Ловкости ", JumpPage, 17)
Text( 4, " Самоцвет Телосложения ", JumpPage, 18)
Text( 4, " Самоцвет Точности ", JumpPage, 19)
Text( 4, " Самоцвет Духа ", JumpPage, 20)

Talk(5," Какие гемы тебя интересуют? " )
Text( 5, " Самоцвет Силы ", JumpPage, 21)
Text( 5, " Самоцвет Ловкости ", JumpPage, 22)
Text( 5, " Самоцвет Телосложения ", JumpPage, 23)
Text( 5, " Самоцвет Точности ", JumpPage, 24)
Text( 5, " Самоцвет Духа ", JumpPage, 25)

Talk(6," Какие гемы тебя интересуют? " )
Text( 6, " Самоцвет Силы ", JumpPage, 26)
Text( 6, " Самоцвет Ловкости ", JumpPage, 27)
Text( 6, " Самоцвет Телосложения ", JumpPage, 28)
Text( 6, " Самоцвет Точности ", JumpPage, 29)
Text( 6, " Самоцвет Духа ", JumpPage, 30)

Talk(11," Для этого нужно 2 самоцвета и 2кк золота! " )

Text(11,'Отдать',FastCombiner,6828,2)

Talk(12," Для этого нужно 2 самоцвета и 2кк золота! " )

Text(12,'Отдать',FastCombiner,6819,2)

Talk(13," Для этого нужно 2 самоцвета и 2кк золота! " )

Text(13,'Отдать',FastCombiner,6825,2)

Talk(14," Для этого нужно 2 самоцвета и 2кк золота! " )

Text(14,'Отдать',FastCombiner,6822,2)

Talk(15," Для этого нужно 2 самоцвета и 2кк золота! " )

Text(15,'Отдать',FastCombiner,6831,2)





Talk(16," Для этого нужно 4 самоцвета и 3кк золота! " )

Text(16,'Отдать',FastCombiner,6828,3)

Talk(17," Для этого нужно 4 самоцвета и 3кк золота! " )

Text(17,'Отдать',FastCombiner,6819,3)

Talk(18," Для этого нужно 4 самоцвета и 3кк золота! " )

Text(18,'Отдать',FastCombiner,6825,3)

Talk(19," Для этого нужно 4 самоцвета и 3кк золота! " )

Text(19,'Отдать',FastCombiner,6822,3)

Talk(20," Для этого нужно 4 самоцвета и 3кк золота! " )

Text(20,'Отдать',FastCombiner,6831,3)



Talk(21," Для этого нужно 8 самоцвета и 4кк золота! " )

Text(21,'Отдать',FastCombiner,6828,4)

Talk(22," Для этого нужно 8 самоцвета и 4кк золота! " )

Text(22,'Отдать',FastCombiner,6819,4)

Talk(23," Для этого нужно 8 самоцвета и 4кк золота! " )

Text(23,'Отдать',FastCombiner,6825,4)

Talk(24," Для этого нужно 8 самоцвета и 4кк золота! " )

Text(24,'Отдать',FastCombiner,6822,4)

Talk(25," Для этого нужно 8 самоцвета и 4кк золота! " )

Text(25,'Отдать',FastCombiner,6831,4)


Talk(26," Для этого нужно 16 самоцвета и 5кк золота! " )

Text(26,'Отдать',FastCombiner,6828,5)

Talk(27," Для этого нужно 16 самоцвета и 5кк золота! " )

Text(27,'Отдать',FastCombiner,6819,5)

Talk(28," Для этого нужно 16 самоцвета и 5кк золота! " )

Text(28,'Отдать',FastCombiner,6825,5)

Talk(29," Для этого нужно 16 самоцвета и 5кк золота! " )

Text(29,'Отдать',FastCombiner,6822,5)

Talk(30," Для этого нужно 16 самоцвета и 5кк золота! " )

Text(30,'Отдать',FastCombiner,6831,5)

Talk(31," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )


end


function AddSkillNPC1()
    Talk( 1,  "Мастер Краб: Привет,я помогу постичь не постижимое.А если у тебя не хватит очков навыков,ты всегда можешь вернутся позже " )
    Text( 1,  "Тренировка ", AddSkillNPC)
    Text( 1,  "В другой раз ", CloseTalk )
end

function r_chaoss()
	Talk( 1,  "Администратор Хаоса: В бою выживают лишь сильнейшие, и лишь сильнейшие получают уважение. " )
	Text( 1,  "Посмотреть ТОП Хаоса ", Garner2GetWiner)
	Text( 1,  "Войти в ТОП Хаоса ", Garner2RequestReorder)
	
	AddNpcMission (2027 )
	
end

function r_gemsnefrit ()
Talk( 1, "Надеюсь у тебя хватит расписок на нефрит " )

Text( 1, " Красный Нефрит ", JumpPage, 2)
Text( 1, " Жёлтый Нефрит ", JumpPage, 3)
Text( 1, " Синий Нефрит ", JumpPage, 4)


Talk(2," Выберите нужный уровень самоцвета " )

Text( 2, " 3 уровень ", JumpPage, 8)
Text( 2, " 4 уровень ", JumpPage, 9)
Text( 2, " 5 уровень ", JumpPage, 10)
Text( 2, " 6 уровень ", JumpPage, 11)
Text( 2, " 7 уровень ", JumpPage, 12)

Talk(3," Выберите нужный уровень самоцвета " )

Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)
Text( 3, " 6 уровень ", JumpPage, 16)
Text( 3, " 7 уровень ", JumpPage, 17)

Talk(4," Выберите нужный уровень самоцвета " )

Text( 4, " 3 уровень ", JumpPage, 18)
Text( 4, " 4 уровень ", JumpPage, 19)
Text( 4, " 5 уровень ", JumpPage, 20)
Text( 4, " 6 уровень ", JumpPage, 21)
Text( 4, " 7 уровень ", JumpPage, 22)

Talk(8," С тебя 4 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5751,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(8," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," С тебя 8 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5751,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(9," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," С тебя 16 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5751,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(10," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," С тебя 32 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5751,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(11," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," С тебя 64 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,64 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5751,1,107 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(12," Держи ",MultiTrigger,GetMultiTrigger(),1)

---

Talk(13," С тебя 4 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5750,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(13," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," С тебя 8 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5750,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(14," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," С тебя 16 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5750,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(15," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," С тебя 32 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5750,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(16," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," С тебя 64 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,64 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5750,1,107 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(17," Держи ",MultiTrigger,GetMultiTrigger(),1)


---
Talk(18," С тебя 4 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5752,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(18," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," С тебя 8 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5752,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(19," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," С тебя 16 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5752,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(20," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," С тебя 32 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5752,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(21," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," С тебя 64 расписки на нефрит " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7494,64 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5752,1,107 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 33)
Text(22," Держи ",MultiTrigger,GetMultiTrigger(),1)

end



function r_setstraja ()
Talk( 1, "Рад тебя видеть.Все мои друзья пропали без вести в Лагере Мёртвых Душ.Я единственный выживший.Убегая от толп врагов я обронил свою Книгу,но успел кое что прихватить " )

Text( 1, " И что же? ", JumpPage, 2)

Talk( 2, "Марк,Алтарь Стража! Друзья говорили что если собрать все осколки для снятия проклятий и положить их на него,а так же один из трёх видов камней, то ты получишь часть экипировки Стража " )
Text( 2, " Расскажи мне о Камнях ", JumpPage, 3)
Text( 2, " Мне нужен Алтарь ", JumpPage, 4)
Text( 2, " Мне нужно Оружие Стража ", JumpPage, 5)
Text( 2, " Мне нужна Шапка Стража ", JumpPage, 8)
Text( 2, " Мне нужно Кольцо Стража ", JumpPage, 6)
Text( 2, " Мне нужна Бижутерия Стража ", JumpPage, 7)


Talk( 3, "Марк: Есть 3 вида камней.Камень Силы,Камень Точности и Камень Скорости.Каждый из них необходим для сета Стража. Камень Силы - Броня,Точности - Перчатки,Скорости - Ботинки.Камни можно получить убив босса 3 этажа в Лагере Мёртвых Душ " )
Text( 3, " Спасибо ", CloseTalk)
	
	InitTrigger()
	TriggerCondition( 2, NoItem, 266, 1 )
	TriggerCondition( 2, BankNoItem, 266, 1 )

	TriggerAction( 2, GiveItem, 266, 1, 4 )
	TriggerFailure( 2, JumpPage, 11 )
	
Talk( 4, "Марк,Алтарь это далеко всё что я успел забрать сбегая из Лагеря,так что я могу подарить тебе его! Мне не жалко,вовсе не жалко... " )
Text( 4, "Принять в дар ", MultiTrigger, GetMultiTrigger(), 2)


Talk( 5, "Марк:Если тебя интересует Оружие Стража,я готов обменять его на 3 Руны Стража,300 Осколков Стража,300 Частей Души,и 1 Свидетельство Стража 800 Репутации и 80.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,4092,3 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2324,300 )
TriggerCondition( 1, HasItem,4571,300 )
TriggerCondition( 1, HasItem,6225,1 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 4092,3 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2324,300 )
TriggerAction( 1, TakeItem, 4571,300 )
TriggerAction( 1, TakeItem, 6225,1 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7689,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(5," Меняю ",MultiTrigger,GetMultiTrigger(),1)

Talk( 6, "Марк:Хочешь улучшить своё Кольцо Испытания моей руной которую я принёс из лагеря?Тогда в замен я хочу:1 Руну Стража,2500 Рун Кэль,5 Карт Мёртвых Душ,300 Частей Души,800 Репутации и 80.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,4092,1 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7464,5 )
TriggerCondition( 1, HasItem,4571,300 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 4092,1 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7464,5 )
TriggerAction( 1, TakeItem, 4571,300 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7790,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(6," Колдуй ",MultiTrigger,GetMultiTrigger(),1)


Talk( 7, "Марк:Ты можешь улучшить свою Бижутерию Испытания,заколдовав её руной что я принёс из Лагеря.Добудь 2 Руны Стража,5000 Рун Кэль,10 Карт Мёртвых Душ,500 Частей Души,800 Репутации и 80.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5000 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,4092,2 )
TriggerCondition( 1, HasItem,7464,10 )
TriggerCondition( 1, HasItem,4571,500 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,5000 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 4092,2 )
TriggerAction( 1, TakeItem, 7464,10 )
TriggerAction( 1, TakeItem, 4571,500 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7791,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(7," Колдуй ",MultiTrigger,GetMultiTrigger(),1)

Talk( 8, "Марк:Знаешь,она мне очень нравиться,жальчто размер не мой,если она тебе так нужна то я отдам тебе её за Книгу,которую я обронил в Лагере Мёртвых Душ,а так же 200 Осколков Стража,1 Свидетельства Стража1 Часть Души,800 Репутации и 80.000.000 золота " )
InitTrigger()
TriggerCondition( 1, HasItem,7512,1 )
TriggerCondition( 1, HasItem,2324,200 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,6225,1 )
TriggerCondition( 1, HasItem,4571,1 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7512,1 )
TriggerAction( 1, TakeItem, 2324,200 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 6225,1 )
TriggerAction( 1, TakeItem, 4571,1 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7792,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 10)
Text(8," Держи свою Книгу и нужный лут ",MultiTrigger,GetMultiTrigger(),1)
Text(8," Где мне искать Книгу? ", JumpPage, 9)

Talk( 9, "Книгу можно найти убивая и обыскивая мертвецов в Лагере " )

Talk( 11, " Можно иметь при себе только 1 Алтарь! " )
Talk( 10, " Недостаточно свободного места,либо лута! " )

end

function r_timnecrop ()
Talk( 1, "Привет,будь осторожнее! " )
Text( 1, " Некрополис ", GoTo, 98, 113, "necropolis" )

AddNpcMission 	(2028)
AddNpcMission 	(2029)
AddNpcMission 	(2030)
AddNpcMission 	(2031)
AddNpcMission 	(2038)

end


function r_gemsdeaths ()
Talk( 1, " За расписки с Лагеря Мёртвых Душ,можно и гемчиков прикупить хороших " )
Text( 1, " Покупаю +14 Силы ", JumpPage, 2)
Text( 1, " Покупаю +14 Телосложения ", JumpPage, 3)
Text( 1, " Покупаю +14 Ловкости ", JumpPage, 4)
Text( 1, " Покупаю +14 Точности ", JumpPage, 5)
Text( 1, " Покупаю +14 Духа ", JumpPage, 6)

Talk( 2," Выберите нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 7)
Text( 2, " 3 уровень ", JumpPage, 8)
Text( 2, " 4 уровень ", JumpPage, 9)
Text( 2, " 5 уровень ", JumpPage, 10)
Text( 2, " 6 уровень ", JumpPage, 11)

Talk( 3," Выберите нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 12)
Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)
Text( 3, " 6 уровень ", JumpPage, 16)

Talk( 4," Выберите нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 17)
Text( 4, " 3 уровень ", JumpPage, 18)
Text( 4, " 4 уровень ", JumpPage, 19)
Text( 4, " 5 уровень ", JumpPage, 20)
Text( 4, " 6 уровень ", JumpPage, 21)

Talk( 5," Выберите нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 22)
Text( 5, " 3 уровень ", JumpPage, 23)
Text( 5, " 4 уровень ", JumpPage, 24)
Text( 5, " 5 уровень ", JumpPage, 25)
Text( 5, " 6 уровень ", JumpPage, 26)

Talk( 6," Выберите нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 27)
Text( 6, " 3 уровень ", JumpPage, 28)
Text( 6, " 4 уровень ", JumpPage, 29)
Text( 6, " 5 уровень ", JumpPage, 30)
Text( 6, " 6 уровень ", JumpPage, 31)

Talk(7," Это будет стоить 2 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5845,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(7," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Это будет стоить 4 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5845,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(8," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Это будет стоить 8 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5845,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(9," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Это будет стоить 16 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5845,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(10," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Это будет стоить 32 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5845,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(11," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Это будет стоить 2 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5846,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(12," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Это будет стоить 4 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5846,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(13," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Это будет стоить 8 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5846,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(14," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," Это будет стоить 16 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5846,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(15," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," Это будет стоить 32 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5846,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(16," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," Это будет стоить 2 расписки +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5849,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(17," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," Это будет стоить 4 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5849,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(18," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," Это будет стоить 8 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5849,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(19," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," Это будет стоить 16 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5849,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(20," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," Это будет стоить 32 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5849,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(21," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," Это будет стоить 2 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5848,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(22," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," Это будет стоить 4 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5848,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(23," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," Это будет стоить 8 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,8 )
TriggerAction( 1, GiveItem, 5848,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," Это будет стоить 16 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,16 )
TriggerAction( 1, GiveItem, 5848,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," Это будет стоить 32 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7510,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 5848,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(26," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," Это будет стоить 2 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,2 )
TriggerAction( 1, GiveItem, 5847,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," Это будет стоить 4 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,4 )
TriggerAction( 1, GiveItem, 5847,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," Это будет стоить 8 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,8 )
TriggerAction( 1, GiveItem, 5847,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," Это будет стоить 16 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,16 )
TriggerAction( 1, GiveItem, 5847,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," Это будет стоить 32 расписок +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,32 )
TriggerAction( 1, GiveItem, 5847,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," Недостаточно свободного места,либо нужного лута " )
end

function r_newbicomb ()
Talk( 1, " Я дружу с учеником кузнеца,мы лучшие друзья! " )
Text( 1, " Огненный Самоцвет ", JumpPage, 2)
Text( 1, " Самоцвет Ярости ", JumpPage, 3)
Text( 1, " Взрывной Самоцвет ", JumpPage, 4)
Text( 1, " Сияющий Самоцвет ", JumpPage, 5)
Text( 1, " Блестящий Самоцвет ", JumpPage, 6)
Text( 1, " Люстриновый Самоцвет ", JumpPage, 7)

Talk( 2," Выбери нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 13)
Text( 2, " 3 уровень ", JumpPage, 14)
Text( 2, " 4 уровень ", JumpPage, 15)
Text( 2, " 5 уровень ", JumpPage, 16)

Talk( 3," Выбери нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 17)
Text( 3, " 3 уровень ", JumpPage, 18)
Text( 3, " 4 уровень ", JumpPage, 19)
Text( 3, " 5 уровень ", JumpPage, 20)

Talk( 4," Выбери нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 21)
Text( 4, " 3 уровень ", JumpPage, 22)
Text( 4, " 4 уровень ", JumpPage, 23)
Text( 4, " 5 уровень ", JumpPage, 24)

Talk( 5," Выбери нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 25)
Text( 5, " 3 уровень ", JumpPage, 26)
Text( 5, " 4 уровень ", JumpPage, 27)
Text( 5, " 5 уровень ", JumpPage, 28)

Talk( 6," Выбери нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 29)
Text( 6, " 3 уровень ", JumpPage, 30)
Text( 6, " 4 уровень ", JumpPage, 31)
Text( 6, " 5 уровень ", JumpPage, 32)

Talk( 7," Выбери нужный уровень самоцвета " )
Text( 7, " 2 уровень ", JumpPage, 8)
Text( 7, " 3 уровень ", JumpPage, 9)
Text( 7, " 4 уровень ", JumpPage, 10)
Text( 7, " 5 уровень ", JumpPage, 11)

Talk(8," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(8,'Отдать',FastCombiner,881,2)

Talk(9," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(9,'Отдать',FastCombiner,881,3)

Talk(10," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(10,'Отдать',FastCombiner,881,4)

Talk(11," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(11,'Отдать',FastCombiner,881,5)

Talk(13," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(13,'Отдать',FastCombiner,878,2)

Talk(14," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(14,'Отдать',FastCombiner,878,3)

Talk(15," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(15,'Отдать',FastCombiner,878,4)

Talk(16," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(16,'Отдать',FastCombiner,878,5)

Talk(17," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(17,'Отдать',FastCombiner,863,2)

Talk(18," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(18,'Отдать',FastCombiner,863,3)

Talk(19," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(19,'Отдать',FastCombiner,863,4)

Talk(20," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(20,'Отдать',FastCombiner,863,5)

Talk(21," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(21,'Отдать',FastCombiner,880,2)

Talk(22," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(22,'Отдать',FastCombiner,880,3)

Talk(23," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(23,'Отдать',FastCombiner,880,4)

Talk(24," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(24,'Отдать',FastCombiner,880,5)

Talk(25," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(25,'Отдать',FastCombiner,882,2)

Talk(26," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(26,'Отдать',FastCombiner,882,3)

Talk(27," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(27,'Отдать',FastCombiner,882,4)

Talk(28," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(28,'Отдать',FastCombiner,882,5)

Talk(29," Для этого нужно 2 самоцвета и 2кк золота! " )
Text(29,'Отдать',FastCombiner,883,2)

Talk(30," Для этого нужно 4 самоцвета и 3кк золота! " )
Text(30,'Отдать',FastCombiner,883,3)

Talk(31," Для этого нужно 8 самоцвета и 4кк золота! " )
Text(31,'Отдать',FastCombiner,883,4)

Talk(32," Для этого нужно 16 самоцвета и 5кк золота! " )
Text(32,'Отдать',FastCombiner,883,5)
end

function r_ghssdeaths ()
Talk( 1, " Только расписки с Хаоса " )
Text( 1, " Покупаю +20 Силы ", JumpPage, 2)
Text( 1, " Покупаю +20 Телосложения ", JumpPage, 3)
Text( 1, " Покупаю +20 Ловкости ", JumpPage, 4)
Text( 1, " Покупаю +20 Точности ", JumpPage, 5)
Text( 1, " Покупаю +20 Духа ", JumpPage, 6)

Talk( 2," Выберите нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 7)
Text( 2, " 3 уровень ", JumpPage, 8)
Text( 2, " 4 уровень ", JumpPage, 9)
Text( 2, " 5 уровень ", JumpPage, 10)
Text( 2, " 6 уровень ", JumpPage, 11)

Talk( 3," Выберите нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 12)
Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)
Text( 3, " 6 уровень ", JumpPage, 16)

Talk( 4," Выберите нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 17)
Text( 4, " 3 уровень ", JumpPage, 18)
Text( 4, " 4 уровень ", JumpPage, 19)
Text( 4, " 5 уровень ", JumpPage, 20)
Text( 4, " 6 уровень ", JumpPage, 21)

Talk( 5," Выберите нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 22)
Text( 5, " 3 уровень ", JumpPage, 23)
Text( 5, " 4 уровень ", JumpPage, 24)
Text( 5, " 5 уровень ", JumpPage, 25)
Text( 5, " 6 уровень ", JumpPage, 26)

Talk( 6," Выберите нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 27)
Text( 6, " 3 уровень ", JumpPage, 28)
Text( 6, " 4 уровень ", JumpPage, 29)
Text( 6, " 5 уровень ", JumpPage, 30)
Text( 6, " 6 уровень ", JumpPage, 31)

Talk(7," Это будет стоить 2 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7615,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(7," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Это будет стоить 4 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7615,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(8," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Это будет стоить 8 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7615,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(9," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Это будет стоить 16 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7615,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(10," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Это будет стоить 32 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7615,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(11," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Это будет стоить 2 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7618,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(12," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Это будет стоить 4 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7618,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(13," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Это будет стоить 8 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7618,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(14," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," Это будет стоить 16 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7618,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(15," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," Это будет стоить 32 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7618,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(16," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," Это будет стоить 2 расписки +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7619,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(17," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," Это будет стоить 4 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7619,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(18," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," Это будет стоить 8 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7619,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(19," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," Это будет стоить 16 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7619,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(20," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," Это будет стоить 32 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7619,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(21," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," Это будет стоить 2 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7617,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(22," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," Это будет стоить 4 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7617,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(23," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," Это будет стоить 8 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,8 )
TriggerAction( 1, GiveItem, 7617,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," Это будет стоить 16 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,16 )
TriggerAction( 1, GiveItem, 7617,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," Это будет стоить 32 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7620,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7617,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(26," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," Это будет стоить 2 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,2 )
TriggerAction( 1, GiveItem, 7616,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," Это будет стоить 4 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,4 )
TriggerAction( 1, GiveItem, 7616,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," Это будет стоить 8 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,8 )
TriggerAction( 1, GiveItem, 7616,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," Это будет стоить 16 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,16 )
TriggerAction( 1, GiveItem, 7616,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," Это будет стоить 32 расписок +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,32 )
TriggerAction( 1, GiveItem, 7616,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," Недостаточно свободного места,либо нужного лута " )
end


function r_povar ()
Talk( 1, "Привет,я могу обучить тебя кулинарии " )

Text( 1, "Обучи меня ", JumpPage, 2)
Text( 1, "Торг ", BuyPage)
Text( 1, "Починить инструмент ", OpenItemFix )
Text( 1, "Я хочу узнать больше о кулинарии ", JumpPage, 3)

InitTrade()
Weapon(	2236	)

Talk( 2, "Обучиться кулинарии можно у Мудреца возле фонтана,но обучить кулинарии фею,смогу лишь я.Для этого внучёк принеси мне 2 Королевские Печати Феи,10 сундуков Кэлей (1000шт),1000 Репутации, 1 Золотую Рыбку и 50.000.000 золота" )
Text( 2, "Хочу Обучить Фею ", JumpPage, 6)
Text( 2, "Пойду собирать ", CloseTalk)


Talk( 3, "Кулинария включает в себя комплекс технологий,оборудования и рецептов.Кулинария — это совокупность способов приготовления из минералов и продуктов растительного и животного происхождения самой различной пищи,для жизни,здоровья игрока,а так же получения дополнительных бонусов. " )
Text( 3, "Что за Ремонтный Инструмент? ", JumpPage, 4)
Text( 3, "Как использовать костёр? ", JumpPage, 5)
Text( 3, "Спасибо ", CloseTalk)

Talk( 4, "Ремонтный инструмент необходим для починки котла.Если котёл сломается,вы не сможете варить еду. " )
Text( 4, "Ясненько ", CloseTalk)

Talk( 5, "Тебе нужно разместить чертёж,три материала,котёл и фею с навыком кулинарии.После чего нажать старт.Обрати внимание на вероятность успеха,она указана на чертеже " )
Text( 5, "Ясненько ", CloseTalk)

Talk(6," Я записала все свои знания в эту книгу,вам она точно нужна?... " )
InitTrigger()
TriggerCondition( 1, HasItem,2589,2 )
TriggerCondition( 1, HasItem,7746,10 )
TriggerCondition( 1, HasItem,7727,1 )
TriggerCondition( 1, HasMoney, 50000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2589,2 )
TriggerAction( 1, TakeItem, 7746,10 )
TriggerAction( 1, TakeItem, 7727,1 )
TriggerAction( 1, TakeMoney, 50000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 1064,1,4 )
TriggerFailure( 1, JumpPage, 32)
Text(6," Нужна ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," Недостаточно свободного места,либо нужного лута " )

AddNpcMission(214)
AddNpcMission(215)
end

function r_djektpf ()
Talk( 1, "Привет " )
Text( 1, "Шайтан ", GoTo, 645, 873, "magicsea" )
 end 
 


function r_elka ()
	
Talk( 1, " Приветствую тебя Друг! Новый год все ближе и ближе, и каждому хочеться получить подарки, и Лайт-Сервер Вас тоже не обделит подарками :)  " )
Text( 1, " Хочу подарок! ", JumpPage, 2)

Talk( 2, " Ты и вправду хочешь подарок? " )
Text( 2, " ДА! ", JumpPage, 3)

Talk(3," Ну что-же, принеси мне 5 новогодних открыток, и получишь подарок от Лайт-Сервера! ")
InitTrigger()
TriggerCondition( 1, HasItem,2887,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2887,5 )
TriggerAction( 1, GiveItem, 7414,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," Да, я хочу свой подарок! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "Не получишь подарок в этом году нубас! " ) -- страница если не достаточно репы

end

 function inet_mag()
 Talk( 1,  "Привет!Я продаю предметы Интернет магазина за рубли, рубли вы можете купить у игроков либо у Администратора по скайпу xxxkeksonxxx " )
 Text( 1,  "Посмотреть предметы ", SendExchangeData)

 InitExchange()

 ExchangeData( 7416 , 1 , 7355 , 1 , 1)
      ExchangeData( 7417 , 9 , 7320 , 1 , 1)
	ExchangeData( 7417 , 9 , 7321 , 1 , 1)
	ExchangeData( 7417 , 9 , 7322 , 1 , 1)
	ExchangeData( 7417 , 9 , 7323 , 1 , 1)
	ExchangeData( 7417 , 9 , 7324 , 1 , 1)
	ExchangeData( 7417 , 9 , 7325 , 1 , 1)
	ExchangeData( 7417 , 15 , 192 , 1 , 1)
	ExchangeData( 7417 , 8 , 7336 , 1 , 1)
	
end


function podarok_k ()

Talk( 1, " Здравствуйте!Я могу обменять подарочные мешки на сам подарок и не только!  " )
Text( 1, " Да, давай! ", JumpPage, 2)

Talk( 2, " Да я хотел бы обменять!!! " )
Text( 2, " Давай 6 подарочных мешка и ты получишь 1 подарок в честь открытия! ", JumpPage, 3)
Text( 2, " Давай 1 подарочных мешка и ты получишь Камень клятвы! ", JumpPage, 4)
Text( 2, " Давай 3 Трупных ядра 3лвл и ты получишь 1 5лвл ! ", JumpPage, 5)
Text( 2, " Давай 2 Трупных ядра 4лвл и ты получишь 1 5лвл ! ", JumpPage, 6)

Talk(3," На вот! ")
InitTrigger()
TriggerCondition( 1, HasItem,7338,6 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7338,6 )
TriggerAction( 1, GiveItem, 7414,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," Ура подарок! ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," На вот! ")
InitTrigger()
TriggerCondition( 1, HasItem,7338,1 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7338,1 )
TriggerAction( 1, GiveItem, 1780,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(4," Спасибо! ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," На вот! ")
InitTrigger()
TriggerCondition( 1, HasItem,2754,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2754,3 )
TriggerAction( 1, GiveItem, 2802,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(5," Спасибо! ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," На вот! ")
InitTrigger()
TriggerCondition( 1, HasItem,2778,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2778,2 )
TriggerAction( 1, GiveItem, 2802,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(6," Спасибо! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "Прошу, не обманывай меня! " ) -- страница если не достаточно репы

end



function t_oazis()
Talk( 1, "Добро пожаловать в Оазис,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 642, 870, "magicsea" )
Text( 1, "Информация по Оазису ", JumpPage, 2)

	Text( 2, "Монстры ", JumpPage, 3)
	Text( 2, "Боссы ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Жди ", JumpPage, 5)
	
	Talk( 4, "В данный момент здесь присутствуют: " )
	Text( 4, "Жди ", JumpPage, 6)
	
	Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	Text( 5, "Паутина ", CloseTalk)
	Text( 5, "Расписка на Реф ", CloseTalk)
	Text( 5, "Руна Кэль ", CloseTalk)
	Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	Text( 5, "Паучий Яд ", CloseTalk)
	Text( 5, "Сундук Заточки ", CloseTalk)
	Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	Text( 6, "Карта Паука ", CloseTalk)
	Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	Text( 6, "Купюра 100.000 ", CloseTalk)
	Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_oazisulit()
Talk( 1, "Добро пожаловать в Оазис,что тебе угодно путник? " )
Text( 1, "Вернутся в Шайтан ", GoTo, 642, 870, "magicsea" )
Text( 1, "Информация по Оазису ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Жди ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Жди ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end

function t_skorptp()
Talk( 1, "Привет " )
Text( 1, "Вернутся в Шайтан ", GoTo, 642, 870, "magicsea" )
Text( 1, "Информация по зоне ", JumpPage, 2)

	-- Text( 2, "Монстры ", JumpPage, 3)
	-- Text( 2, "Боссы ", JumpPage, 4)

	-- Talk( 3, "В данный момент здесь присутствуют: " )
	-- Text( 3, "Жди ", JumpPage, 5)
	
	-- Talk( 4, "В данный момент здесь присутствуют: " )
	-- Text( 4, "Жди ", JumpPage, 6)
	
	-- Talk( 5, "Паук,время воскрешения - 20 секунд,список выпадаемых предметов: " )
	-- Text( 5, "Паутина ", CloseTalk)
	-- Text( 5, "Расписка на Реф ", CloseTalk)
	-- Text( 5, "Руна Кэль ", CloseTalk)
	-- Text( 5, "Сундук Кэлей (10 штук) ", CloseTalk)
	-- Text( 5, "Паучий Яд ", CloseTalk)
	-- Text( 5, "Сундук Заточки ", CloseTalk)
	-- Text( 5, "Купюра на 10 тысяч ", CloseTalk)

	-- Talk( 6, "Батя Пауков,время воскрешения - 20 минут,список выпадаемых предметов: " )
	-- Text( 6, "Паучья Экипировка (200 уровень) ", CloseTalk)
	-- Text( 6, "Паучье Оружие (200 уровень) ", CloseTalk)
	-- Text( 6, "Карта Паука ", CloseTalk)
	-- Text( 6, "Сундук Улучшения Экипировки ", CloseTalk)
	-- Text( 6, "Купюра 100.000 ", CloseTalk)
	-- Text( 6, "Великий Свиток Удачи ", CloseTalk)
	
end



function r_ghstimzgge ()
Talk( 1, " Только расписки с +40 " )
Text( 1, " Покупаю +40 Силы ", JumpPage, 2)
Text( 1, " Покупаю +40 Телосложения ", JumpPage, 3)
Text( 1, " Покупаю +40 Ловкости ", JumpPage, 4)
Text( 1, " Покупаю +40 Точности ", JumpPage, 5)
Text( 1, " Покупаю +40 Духа ", JumpPage, 6)

Talk( 2," Выберите нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 7)
Text( 2, " 3 уровень ", JumpPage, 8)
Text( 2, " 4 уровень ", JumpPage, 9)
Text( 2, " 5 уровень ", JumpPage, 10)
Text( 2, " 6 уровень ", JumpPage, 11)

Talk( 3," Выберите нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 12)
Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)
Text( 3, " 6 уровень ", JumpPage, 16)

Talk( 4," Выберите нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 17)
Text( 4, " 3 уровень ", JumpPage, 18)
Text( 4, " 4 уровень ", JumpPage, 19)
Text( 4, " 5 уровень ", JumpPage, 20)
Text( 4, " 6 уровень ", JumpPage, 21)

Talk( 5," Выберите нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 22)
Text( 5, " 3 уровень ", JumpPage, 23)
Text( 5, " 4 уровень ", JumpPage, 24)
Text( 5, " 5 уровень ", JumpPage, 25)
Text( 5, " 6 уровень ", JumpPage, 26)

Talk( 6," Выберите нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 27)
Text( 6, " 3 уровень ", JumpPage, 28)
Text( 6, " 4 уровень ", JumpPage, 29)
Text( 6, " 5 уровень ", JumpPage, 30)
Text( 6, " 6 уровень ", JumpPage, 31)

Talk(7," Это будет стоить 2 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7820,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(7," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Это будет стоить 4 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7820,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(8," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Это будет стоить 8 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7820,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(9," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Это будет стоить 16 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7820,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(10," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Это будет стоить 32 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7820,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(11," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Это будет стоить 2 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7823,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(12," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Это будет стоить 4 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7823,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(13," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Это будет стоить 8 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7823,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(14," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," Это будет стоить 16 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7823,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(15," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," Это будет стоить 32 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7823,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(16," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," Это будет стоить 2 расписки +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7824,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(17," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," Это будет стоить 4 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7824,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(18," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," Это будет стоить 8 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7824,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(19," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," Это будет стоить 16 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7824,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(20," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," Это будет стоить 32 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7824,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(21," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," Это будет стоить 2 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7822,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(22," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," Это будет стоить 4 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7822,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(23," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," Это будет стоить 8 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,8 )
TriggerAction( 1, GiveItem, 7822,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," Это будет стоить 16 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,16 )
TriggerAction( 1, GiveItem, 7822,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," Это будет стоить 32 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7825,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7822,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(26," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," Это будет стоить 2 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,2 )
TriggerAction( 1, GiveItem, 7821,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," Это будет стоить 4 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,4 )
TriggerAction( 1, GiveItem, 7821,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," Это будет стоить 8 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,8 )
TriggerAction( 1, GiveItem, 7821,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," Это будет стоить 16 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,16 )
TriggerAction( 1, GiveItem, 7821,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," Это будет стоить 32 расписок +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,32 )
TriggerAction( 1, GiveItem, 7821,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," Недостаточно свободного места,либо нужного лута " )
end

function r_ckoruad ()

Talk( 1, "Если ты действитель храбрый воин,тогда докажи!А если твой уровень равен 5000,тогда у меня есть к тебе отдельный разговор! " )
Text( 1, "Легко!" )
 
AddNpcMission(2032)
AddNpcMission(2033)
AddNpcMission(2034)
AddNpcMission(2035)
AddNpcMission(2036)
AddNpcMission(2037)
 end 



function r_gggshmtt ()
Talk( 1, " Только расписки с +30 " )
Text( 1, " Покупаю +30 Силы ", JumpPage, 2)
Text( 1, " Покупаю +30 Телосложения ", JumpPage, 3)
Text( 1, " Покупаю +30 Ловкости ", JumpPage, 4)
Text( 1, " Покупаю +30 Точности ", JumpPage, 5)
Text( 1, " Покупаю +30 Духа ", JumpPage, 6)

Talk( 2," Выберите нужный уровень самоцвета " )
Text( 2, " 2 уровень ", JumpPage, 7)
Text( 2, " 3 уровень ", JumpPage, 8)
Text( 2, " 4 уровень ", JumpPage, 9)
Text( 2, " 5 уровень ", JumpPage, 10)
Text( 2, " 6 уровень ", JumpPage, 11)

Talk( 3," Выберите нужный уровень самоцвета " )
Text( 3, " 2 уровень ", JumpPage, 12)
Text( 3, " 3 уровень ", JumpPage, 13)
Text( 3, " 4 уровень ", JumpPage, 14)
Text( 3, " 5 уровень ", JumpPage, 15)
Text( 3, " 6 уровень ", JumpPage, 16)

Talk( 4," Выберите нужный уровень самоцвета " )
Text( 4, " 2 уровень ", JumpPage, 17)
Text( 4, " 3 уровень ", JumpPage, 18)
Text( 4, " 4 уровень ", JumpPage, 19)
Text( 4, " 5 уровень ", JumpPage, 20)
Text( 4, " 6 уровень ", JumpPage, 21)

Talk( 5," Выберите нужный уровень самоцвета " )
Text( 5, " 2 уровень ", JumpPage, 22)
Text( 5, " 3 уровень ", JumpPage, 23)
Text( 5, " 4 уровень ", JumpPage, 24)
Text( 5, " 5 уровень ", JumpPage, 25)
Text( 5, " 6 уровень ", JumpPage, 26)

Talk( 6," Выберите нужный уровень самоцвета " )
Text( 6, " 2 уровень ", JumpPage, 27)
Text( 6, " 3 уровень ", JumpPage, 28)
Text( 6, " 4 уровень ", JumpPage, 29)
Text( 6, " 5 уровень ", JumpPage, 30)
Text( 6, " 6 уровень ", JumpPage, 31)

Talk(7," Это будет стоить 2 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7925,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(7," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Это будет стоить 4 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7925,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(8," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Это будет стоить 8 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7925,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(9," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Это будет стоить 16 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7925,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(10," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Это будет стоить 32 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7925,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(11," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Это будет стоить 2 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7928,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(12," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Это будет стоить 4 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7928,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(13," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Это будет стоить 8 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7928,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(14," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," Это будет стоить 16 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7928,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(15," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," Это будет стоить 32 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7928,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(16," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," Это будет стоить 2 расписки +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7929,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(17," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," Это будет стоить 4 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7929,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(18," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," Это будет стоить 8 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,8 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7929,1,104 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(19," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," Это будет стоить 16 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,16 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7929,1,105 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(20," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," Это будет стоить 32 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7929,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(21," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," Это будет стоить 2 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,2 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7927,1,102 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(22," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," Это будет стоить 4 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,4 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7927,1,103 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(23," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," Это будет стоить 8 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,8 )
TriggerAction( 1, GiveItem, 7927,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," Это будет стоить 16 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,16 )
TriggerAction( 1, GiveItem, 7927,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," Это будет стоить 32 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7930,32 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7927,1,106 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 32)
Text(26," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," Это будет стоить 2 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,2 )
TriggerAction( 1, GiveItem, 7926,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," Это будет стоить 4 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,4 )
TriggerAction( 1, GiveItem, 7926,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," Это будет стоить 8 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,8 )
TriggerAction( 1, GiveItem, 7926,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," Это будет стоить 16 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,16 )
TriggerAction( 1, GiveItem, 7926,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," Это будет стоить 32 расписок +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,32 )
TriggerAction( 1, GiveItem, 7926,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," Держи ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," Недостаточно свободного места,либо нужного лута " )
end
