--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading NPCScript06.lua" )
--Обменник Репутации
function Exchange_Reputation()
	Talk( 1, "Привет! Я могу обменять твои свитки на репутацию! " )
	Text( 1, "Хочу свитки на 10 ", JumpPage, 2)
	Text( 1, "Хочу свитки на 50 ", JumpPage, 3)
	Text( 1, "Хочу свитки на 100 ", JumpPage, 4)
	Text( 1, "Хочу свитки на 500 ", JumpPage, 5)
	Text( 1, "Хочу свитки на 1000 ", JumpPage, 6)
	Text( 1, "Уйти. ", CloseTalk )
	
	Talk( 2, "Выберите количество свитков на 10 репутации и завершим обмен. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10 )
		TriggerAction( 1, DelRoleCredit, 10 )
		TriggerAction( 1, GiveItem, 7625, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," х1 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100 )
		TriggerAction( 1, DelRoleCredit, 100 )
		TriggerAction( 1, GiveItem, 7625, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," х10 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7625, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," х100 шт ",MultiTrigger,GetMultiTrigger(),1)
	Text( 2, "Уйти. ", CloseTalk )
	
	Talk( 3, "Выберите количество свитков на 50 репутации и завершим обмен. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 50 )
		TriggerAction( 1, DelRoleCredit, 50 )
		TriggerAction( 1, GiveItem, 7622, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," х1 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 500 )
		TriggerAction( 1, DelRoleCredit, 500 )
		TriggerAction( 1, GiveItem, 7622, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," х10 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 5000 )
		TriggerAction( 1, DelRoleCredit, 5000 )
		TriggerAction( 1, GiveItem, 7622, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," х100 шт ",MultiTrigger,GetMultiTrigger(),1)
	Text( 3, "Уйти. ", CloseTalk )
	
	Talk( 4, "Выберите количество свитков на 100 репутации и завершим обмен. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100 )
		TriggerAction( 1, DelRoleCredit, 100 )
		TriggerAction( 1, GiveItem, 7623, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," х1 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7623, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," х10 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10000 )
		TriggerAction( 1, DelRoleCredit, 10000 )
		TriggerAction( 1, GiveItem, 7623, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," х100 шт ",MultiTrigger,GetMultiTrigger(),1)
	Text( 4, "Уйти. ", CloseTalk )
	
	Talk( 5, "Выберите количество свитков на 500 репутации и завершим обмен. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 500 )
		TriggerAction( 1, DelRoleCredit, 500 )
		TriggerAction( 1, GiveItem, 7624, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," х1 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 5000 )
		TriggerAction( 1, DelRoleCredit, 5000 )
		TriggerAction( 1, GiveItem, 7624, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," х10 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 50000 )
		TriggerAction( 1, DelRoleCredit, 50000 )
		TriggerAction( 1, GiveItem, 7624, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," х100 шт ",MultiTrigger,GetMultiTrigger(),1)
	Text( 5, "Уйти. ", CloseTalk )
	
	Talk( 6, "Выберите количество свитков на 1000 репутации и завершим обмен. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7830, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," х1 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10000 )
		TriggerAction( 1, DelRoleCredit, 10000 )
		TriggerAction( 1, GiveItem, 7830, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," х10 шт ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100000 )
		TriggerAction( 1, DelRoleCredit, 100000 )
		TriggerAction( 1, GiveItem, 7830, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," х100 шт ",MultiTrigger,GetMultiTrigger(),1)
	Text( 6, "Уйти. ", CloseTalk )
	
	Talk( 7, "У вас недостаточно Репутации для обмена! ")
	Text( 7, "Понял, ухожу. ", CloseTalk )
end

function t_povar ()
Talk( 1, "Я очень вкусно готовлю! " )
Text( 1, " Что на ужин? ", JumpPage, 2)

Talk( 2, "Обмениваю талоны на кук " )
Text( 2, " Граната ", JumpPage, 3)
Text( 2, " Флешка ", JumpPage, 4)
Text( 2, " Излучатель ", JumpPage, 5)
Text( 2, " Детектор Души ", JumpPage, 6)
Text( 2, " Землятресение ", JumpPage, 7)


Talk(3," Давай 5 талонов а я тебе 5 гранат " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7456,5 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2791,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 9)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," Давай 5 талонов а я тебе 5 Флешек " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7456,5 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2792,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 9)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(5," Давай 5 талонов а я тебе 5 Излучателеи " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7456,5 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2793,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 9)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 5 талонов а я тебе 5 Детекторов души " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7456,5 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2794,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 9)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(7," Давай 5 талонов а я тебе 5 Землятресении " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 7456,5 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2804,5,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 9)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )

end


function t_krilia ()

	Talk( 1, "Приветик,я повидал весь мир,и собрал свою лучшую коллекцию крыльев " )
	Text( 1, "Посмотреть", BuyPage)


InitTrade  ()
Weapon(	7970	)
Weapon(	7971	)
Weapon(	7972	)
Weapon(	7973	)
Weapon(	7974	)
Weapon(	7975	)
Weapon(	7976	)
Weapon(	7977	)
Weapon(	7978	)
Weapon(	7979	)
Weapon(	7980	)
Weapon(	7981	)
Weapon(	7982	)
Weapon(	7983	)
Weapon(	7984	)
Weapon(	7985	)
Weapon(	7986	)
Weapon(	7987	)
Weapon(	7988	)
Weapon(	7989	)
Weapon(	7990	)
Weapon(	7991	)
	AddNpcMission ( 2039 )

end


function t_loterea ()

	Talk( 1, "Лотерея,совсем скоро ты сможешь испытать свою удачу в новой увлекательной лотереи! " )
	Text( 1, "Жду " )

end

function t_ecxangert ()
    Talk( 1, "Здравствуй, одерживая победу над разными боссами,ты получаешь очки репутации,которые можешь обменять у меня на нужные тебе вещи " )
    Text( 1, "Обмен ", JumpPage, 2)

    Talk( 2, "Выбирай " )
    Text( 2, "Свиток Характеристики +1", JumpPage, 3)
    Text( 2, "Свиток Перефоржа ", JumpPage, 4)
    Text( 2, "Коробка с Аурами ", JumpPage, 5)
    Text( 2, "Свиток Удачи ", JumpPage, 6)
    Text( 2, "Свиток Сокровищ ", JumpPage, 7)
    --Text( 2, "Расписка на Кук ", JumpPage, 8)
    --Text( 2, "Мешок с Песком ", JumpPage, 9)
    Text( 2, "Далее ", JumpPage, 10)
	
	
	Talk( 10, "Выбирай " )
    Text( 10, "Сундук Улучшения Экипировки ", JumpPage, 17)
	Text( 10, "Кость Стража ", JumpPage, 18)
	Text( 10, "Пурпурный Сундук ", JumpPage, 19)
	Text( 10, "Пурпурный Ключ ", JumpPage, 20)
	Text( 10, "Фрукт Роста Феи ", JumpPage, 21)
	Text( 10, "Мощь Огня ", JumpPage, 22)
	Text( 10, "Мощь Ветра ", JumpPage, 23)
	Text( 10, "Мощь Грома ", JumpPage, 24)
	Text( 10, "Мощь Мороза ", JumpPage, 25)


    Talk(3,"Свиток Характеристик добавит вам 1 очко характеристик,стоимость 100 репутации ")
    Text(3,"1 Штука ", JumpPage, 27)
	Text(3,"10 Штук ", JumpPage, 28)
	Text(3,"100 Штук ", JumpPage, 29)
	
	Talk(27,"Свиток Характеристик добавит вам 1 очко характеристик,стоимость 100 репутации ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 100 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 7453,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(27,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28,"Свиток Характеристик 10 штук,стоимость 1000 репутации ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 1000 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7453,10,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(28,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)


	Talk(29,"Свиток Характеристик 100 штук,стоимость 10.000 репутации ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 10000 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 10000 )
    TriggerAction( 1, GiveItem, 7453,100,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(29,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)


    Talk(4,"Свиток Перефоржа будет стоить 2000 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,2000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 2000 )
    TriggerAction( 1, GiveItem, 7451,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(4,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(5,"Коробка с Аурами будет стоить 1000 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7489,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(5,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(6,"Свиток Удачи будет стоить 500 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 7484,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(6,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(7,"Свиток Сокровищ будет стоить 150 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 684,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(7,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(8,"Расписка на Кук будет стоить 5 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,5)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 5 )
    TriggerAction( 1, GiveItem, 7456,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(8,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(9,"Мешок с Песком 1 Уровень - 100.Мешок с Песком 2 Уровень - 300.Мешок с Песком 3 Уровень - 500.Мешок с Песком 4 Уровень - 750.Мешок с Песком 5 Уровень - 1000 ")
    Text( 9, "1 Уровень ", JumpPage, 11)
    Text( 9, "2 Уровень ", JumpPage, 12)
	Text( 9, "3 Уровень ", JumpPage, 13)
	Text( 9, "4 Уровень ", JumpPage, 14)
	Text( 9, "5 Уровень ", JumpPage, 15)


    Talk(11,"1 Уровень будет стоить 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 1145,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(11,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(12,"2 Уровень будет стоить 300 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,300)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 300 )
    TriggerAction( 1, GiveItem, 2729,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(12,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(13,"3 Уровень будет стоить 500 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 2753,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(13,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(14,"4 Уровень будет стоить 750 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,750)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 750 )
    TriggerAction( 1, GiveItem, 2777,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(14,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(15,"5 Уровень будет стоить 1000 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 2801,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(15,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	 Talk(17,"Сундук Улучшения Экипировки будет стоить 200 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,200)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 200 )
    TriggerAction( 1, GiveItem, 7482,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(17,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)

	Talk(18,"Кость Стража стоит 150 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 271,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(18,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19,"Пурпурный Сундук стоит 150 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 5710,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(19,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20,"Пурпурный Ключ стоит 150 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 5702,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(20,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21,"Фрукт Роста Феи стоит 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 578,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(21,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22,"Мощь Огня стоит 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 267,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(22,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23,"Мощь Ветра стоит 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 268,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(23,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(24,"Мощь Грома стоит 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 269,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(24,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25,"Мощь Мороза стоит 100 репутации ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 270,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(25,"Меняю " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(16,"Не пытайся меня обмануть ")
	
	
	AddNpcMission ( 922 )
	AddNpcMission ( 923 )
	
	
end

function t_lotterity ()
    Talk( 1, "Привет дружище,совсем скоро ты сможешь испытать у меня свою удачу,выкупив у меня лотерейный билет за монеты фей,золото,либо руны кэль!Так что откладывай их в банке,скоро они пригодятся тебе) " )
    Text( 1, "Скорее бы уже!) ", JumpPage, 2)
	
	end
	
function r_talk219()
	Talk( 1, "Приветик,мне кажется големы слишком страшные " )
	Text( 1, "Шайтан ", GoTo, 649, 873, "magicsea" )
	Text( 1, "Информация по Шахтам ",JumpPage, 2 )

	Text( 2, "Монстры ", JumpPage, 3)
	Text( 2, "Боссы ", JumpPage, 4)

	Talk( 3, "В данный момент здесь присутствуют: " )
	Text( 3, "Алый Голем ", JumpPage, 5)
	
	Talk( 4, "В данный момент здесь присутствуют: " )
	Text( 4, "Скоро будет ", CloseTalk )
	

	Talk( 5, "Алый Голем,время воскрешения - 30 секунд,список выпадаемых предметов: " )
	Text( 5, "Сундук Пурпурного Кристалла ", CloseTalk)
	Text( 5, "Ключ Пурпурного Кристалла ", CloseTalk)
	Text( 5, "Жребий Фортуны ", CloseTalk)
	Text( 5, "Купюра достоинством 10 тысяч ", CloseTalk)
	
	AddNpcMission	(223)
	AddNpcMission	(224)
	AddNpcMission	(225)
	AddNpcMission	(226)
	
	end
	
function GoTotim()
Talk( 1, "Приветствую,будь осторожен,на этот город не распростроняются законы!Убийства и грабежи здесь нормальное явление! " ) 
Text( 1, "Города ", JumpPage, 3 )
Text( 1, "Острова ", JumpPage, 2 )
Text( 1, "Зоны ", JumpPage, 6 )
--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )

Text( 2, "Остров Мечты ", GoTo, 355, 168, "CrystalShore" )

Text( 3, "Шайтан ", GoTo, 648, 876, "magicsea" )
Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )

--Text( 4, "NEW 1. ", GoTo, 84, 78, "basement" )
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


--Text( 6, "\216\224\245\242\251 (\199\238\235\238\242\238) ", GoTo, 1366, 3029, "magicsea" )


Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 622, 3050, "magicsea" )
Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 763, 2891, "magicsea" )
Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 1013, 2930, "magicsea" )

 end
 
 
function GoTotiim()
Talk( 1, "Привет " ) 
Text( 1, "Город Мечты ", GoTo, 157, 129, "CrystalShore" )

end




