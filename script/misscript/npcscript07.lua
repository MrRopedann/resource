--------------------------------------------------------------------------
--									--
--									--
--		NPCScript07.lua Created by knight.gong 2005.7.12.	--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading NPCScript07.lua" )


function r_mi1kovay3()

	Talk( 1, " Привет,я могу обменять кели на карту перерождения " )
	Text( 1, " Обменять ", JumpPage, 2)

	Talk( 2, "\205\243 \226\238\242, \226\251\225\232\240\224\233 \247\242\238 \242\229\225\229 \237\224\228\238!" )
	Text( 2, "\202\224\240\242\224 \239\229\240\226\238\227\238 \239\229\240\229\240\238\230\228\229\237\232\255", JumpPage, 5)

	Talk(5," получить реберн карту за 25 келей ")
	InitTrigger()
	TriggerCondition( 1, HasItem,3457,25 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3457,25 )
	TriggerAction( 1, GiveItem, 2941,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(5,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk(6,"\207\238\236\229\237\255\242\252 \239\238\234\240\238\226\232\242\229\235\252\241\242\226\238 \225\238\227\232\237\232 \226\241\229\227\238 \237\224 1 \234\229\235\252?")
	InitTrigger()
	TriggerCondition( 1, HasItem,3457,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3457,1 )
	TriggerAction( 1, GiveItem, 938,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(6,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk(7,"\207\238\236\229\237\255\242\252 \202\235\254\247 \247\229\240\237\238\227\238 \228\240\224\234\238\237\224 \237\224 \208\243\237\243 \194\242\238\240\238\227\238 \239\229\240\229\240\238\230\228\229\237\232\255?")
	InitTrigger()
	TriggerCondition( 1, HasItem,182,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 182,1 )
	TriggerAction( 1, GiveItem, 5853,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(7,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk( 17, "\200\231\226\229\237\232, \237\238 \243 \242\229\225\255 \247\229\227\238\242\238 \237\229 \245\226\224\242\224\229\242 ..." )

end

function Unseal_75_1()

Talk( 1, " Сдесь ты можешь поменять руны кэль и лут на 100 ансы " )
Text( 1, " 100 ансы ", JumpPage, 2)

Talk( 2, " Выбери какой ансил ты хочеш! " )
Text( 2, " 100 рука ", JumpPage, 9)
Text( 2, " 100 тело ", JumpPage, 10)
Text( 2, " 100 нога ", JumpPage, 11)
Text( 2, " 100 шапку ", JumpPage, 12)
Text( 2, " Усил.100 рука ", JumpPage, 13)

Talk(9," Давай 500 Рун Кэль,каждых сил(Сила Грома и т.п) по 150шт и 120шт расп хс нач. лв.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0267,150 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0268,150 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0269,150 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0270,150 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2608,120 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,500 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 267,150 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 268,150 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 269,150 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 270,150 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2608,120 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerAction( 1, GiveItem, 826,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(9," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Давай 900 Рун Кэль каждых сил(Сила Грома и т.п) по 180шт и 150 расп хс нач. лв.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0267,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0268,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0269,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0270,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2608,150 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,900 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 267,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 268,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 269,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 270,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2608,150 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 825,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(10," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Давай 500 Рун Кэль каждых сил(Сила Грома и т.п) по 180шт и 120 расп хс нач. лв.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0267,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0268,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0269,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0270,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2608,120 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,500 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 267,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 268,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 269,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 270,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2608,120 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 827,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(11," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Давай 500 Рун Кэль каждых сил(Сила Грома и т.п) по 180шт и 80 расп хс нач. лв. 200 сред расписок и 300 высоких расп! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0267,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0268,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0269,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0270,180 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2608,80 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2609,200 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2610,300 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,500 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 267,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 268,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 269,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 270,180 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2608,80 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2609,200 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2610,300 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 3334,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(12," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Давай 700 Рун Кэль,каждых сил(Сила Грома и т.п) по 250шт и 220шт расп хс нач. лв,130шт ПСТ! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,700 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0267,250 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0268,250 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0269,250 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,0270,250 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,2608,220 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,7355,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,700 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0267,250 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0268,250 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0269,250 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0270,250 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 2608,220 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerAction( 1, TakeItem, 7355,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 1125,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(13," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )

end

function Unseal_75_3()

Talk( 1, " Сдесь ты можешь поменять Руны Кэль на на 75анс оружие " )
Text( 1, " Давай! ", JumpPage, 2)

Talk( 2, " Выбери какой оружие ты хочешь ! " )
Text( 2, " 75 меч на круза ", JumpPage, 8)
Text( 2, " 75 пушка на шарпа ", JumpPage, 9)
Text( 2, " 75 коса на чампа ", JumpPage, 10)
Text( 2, " 75 коса на см ", JumpPage, 11)
Text( 2, " 75 коса на бк ", JumpPage, 12)
Text( 2, " 75 палка на воя ", JumpPage, 13)

Talk(8," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2332,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(8," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2338,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(9," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2334,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(10," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2344,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(11," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2342,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(12," Отдать ",MultiTrigger,GetMultiTrigger(),1)


Talk(13," Давай 15 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 2336,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 16)
Text(13," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Хе-хе-хе! Ты меня не обманеш! Давай кели или вали отсюда " )
Text(14," Валить! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end

function Unseal_95_2()
Talk( 1, " Что ты пялишься Вась?! Ты помоему чтото брать хотел?! Нет?! Тогда Проваливай! " )
Text( 1, " Да, хочу 95 ансы чампу ", JumpPage, 2)
Text( 1, " Да, хочу 95 ансы вою ", JumpPage, 8)

Talk( 2, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 2, " Страж Жертвы(тело) ", JumpPage, 3)
Text( 2, " Милосердие Жертвы(боты) ", JumpPage, 4)
Text( 2, " Благославление Жертвы(перчатки) ", JumpPage, 5)
Text( 2, " Нержавеющий Меч(большой меч) ", JumpPage, 6)
Text( 2, " Искупление Жертвы(корона) ", JumpPage, 7)

Talk( 8, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 8, " Страж Правосудия(тело) ", JumpPage, 9)
Text( 8, " Милосердие Правосудия(боты) ", JumpPage, 10)
Text( 8, " Благославление Правосудия(перчатки) ", JumpPage, 11)
Text( 8, " Бесшумное Лезвие(кинжал) ", JumpPage, 12)
Text( 8, " Искупление Правосудия(корона) ", JumpPage, 13)

Talk(3," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6113,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6115,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6114,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6101,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Давай 35 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,35 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,35 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6112,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6117,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(9," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6119,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(10," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6118,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(11," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6100,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(12," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," Давай 40 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,40 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 6116,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(13," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end

function r_talk04 ()

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 1, " Гина: Привет! Я медсестра Гина. Что ты хочеш чтобы я сделала? " )
	Text( 1, " Полное исцеление ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 1, " Ябвдул тебе детка! ", MultiTrigger,GetMultiTrigger(),2)
	--Text( 1, "Build Ship", JumpPage, 10)

	Talk( 2, " Гина: Извини, но полное исцеление стои 200g. " )

	Talk( 3, " Гина: Извини! Исцеление стоит 50g " )

	Talk( 4, "I do not have any letter. I guess you got the wrong person" )

	Talk( 5, "Ya? Forget it...Thank you. Take this reward for your hard work." )
		
	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 6, "Gina: Hello! I am Nurse Gina. Look for me if you are sick or injured!" )
	Text( 6, "Greater Heal", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 6, "Heal", MultiTrigger,GetMultiTrigger(),2)
	

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

function Unseal_65 ()
Talk( 1, " Что ты пялишься Вась?! Ты помоему чтото брать хотел?! Нет?! Тогда Проваливай! " )
Text( 1, " Да, хочу гемки +14 ", JumpPage, 2)

Talk( 2, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 2, " На стр +14 ", JumpPage, 3)
Text( 2, " На акк +14 ", JumpPage, 4)
Text( 2, " На спр +14 ", JumpPage, 5)
Text( 2, " На аги +14 ", JumpPage, 6)
Text( 2, " На кон +14 ", JumpPage, 7)


Talk(3," Давай 30 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,30 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7108,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Давай 30 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,25 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7110,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Давай 30 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,25 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7109,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 30 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,25 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7112,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Давай 30 келей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,25 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7111,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end


function r_talk11 ()
Talk( 1, " Что ты пялишься Вась?! Ты помоему чтото брать хотел?! Нет?! Тогда Проваливай! " )
Text( 1, " Да, хочу гемки +14 ", JumpPage, 2)

Talk( 2, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 2, " На стр +14 ", JumpPage, 3)
Text( 2, " На акк +14  ", JumpPage, 4)
Text( 2, " На спр +14 ", JumpPage, 5)
Text( 2, " На аги +14 ", JumpPage, 6)
Text( 2, " На кон +14 ", JumpPage, 7)


Talk(3," Давай 15 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7108,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Давай 15 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7110,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Давай 15 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7109,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 15 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7112,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Давай 15 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7111,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end

function r_talk06 ()
Talk( 1, " Что ты пялишься Вась?! Ты помоему чтото брать хотел?! Нет?! Тогда Проваливай! " )
Text( 1, " Да, хочу Рб крылышки ", JumpPage, 2)

Talk( 2, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 2, " 2рб на ланс ", JumpPage, 3)
Text( 2, " 2рб на карциза  ", JumpPage, 4)
Text( 2, " 2рб на ами ", JumpPage, 5)
Text( 2, " 2рб филис ", JumpPage, 6)
Text( 2, " 3рб на ланс ", JumpPage, 7)
Text( 2, " 3рб на карциза ", JumpPage, 8)
Text( 2, " 3рб на ами ", JumpPage, 9)
Text( 2, " 3рб на филис ", JumpPage, 10)


Talk(3," Давай 50 Рун Кэль, 99 пачкуль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,50 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,99 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,50 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,99 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0136,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Давай 50кэлей, 99 пачкуль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,99 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,50 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,99 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0139,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Давай 50кэлей, 99пачкуль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,99 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,50 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,99 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0132,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 50кэлей, 99пачкуль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,4 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,50 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,99 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0129,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Давай 80 Рун Кэль, 90 пачкуль, 15 Анг.костей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,50 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,271,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,80 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,90 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0271,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0137,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Давай 80 Рун Кэль, 90 пачкуль, 15 Анг.костей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,50 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,271,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,80 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,90 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0271,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0140,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(8," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Давай 80 Рун Кэль, 90 пачкуль, 15 Анг.костей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,50 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,271,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,90 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,90 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0271,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0133,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(9," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," Давай 80кэлей, 90 пачкуль, 15 костей! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,1000,50 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasItem,271,5 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,80 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 1000,90 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, TakeItem, 0271,15 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 0130,1,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(10," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end

function forger ()
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
	Defence( 6946	)
	Defence( 890	)
	Defence()
	Defence( 456	)
	Defence( 1020	)
	Defence()
	Defence()
	Defence( 3074	)
	Defence( 3075	)	

end

function bank ()
	
	
	Talk( 1,  "Моника: Привет! Я банкир Моника! В нашем банке ваши вещи всегда под надежной защитой! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "Хранилище (стоимость 200 золотых) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "Простите, вы не имеете достаточное количество золота! " )



end 

function pricha()

	Talk( 1,  "Парикмахер: Привет! Не желаете сменить свою ужасную прическу? " )
	Text( 1,  "Купить парикмахерские принадлежности ", BuyPage )
	Text( 1,  "Я хочу сменить прическу ", JumpPage, 2)

	InitTrade()
	Weapon(	1807	)
	Weapon(	1805	)
	Weapon(	1804	)
	Weapon(	1806	)
	Weapon(	6106	)
	Defence(	1798	)
	Defence(	1800	)
	Defence(	1801	)
	Defence(	1803	)
	Defence(	1797	)
	Defence(	1799	)
	Defence(	1802	)
	Defence(	4610	)
	Defence(	4609	)
	Defence(	4607	)	
	Other(	931	)
	Other(	932	)
	Other(	933	)
	Other(	934	)
	Other(	1808	)
	Other(	1809	)
	Other(	1810	)
	Other(	1811	)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 1807, 1 )
	TriggerAction( 1, OpenHair )
	TriggerFailure( 1, JumpPage, 3 )
	Talk( 2,  "Парикмахер: Отлично. Но вам потребуется Парикмахерская расписка! ")
	Text( 2,  "Да, я знаю ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 2,  "Забудь ", CloseTalk )

	Talk( 3,  "Парикмахер: У тебя нет Парикмахерской расписки! ")


end

function vra43 ()

Talk( 1, " Привет,я могу обменять руны Кэль на еду! " )
Text( 1, " Да, хочу есть!!! ", JumpPage, 2)

Talk( 2, " Хорошо давай 10 рун Кэль и ты получишь 20 Весног.свитка и 20 Креветочных пышек! " )
Text( 2, " давай! ", JumpPage, 3)

Talk(3," Давай 10 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,10 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 1083,20,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerAction( 1, GiveItem, 4024,20,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1) 

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end

function shai ()
	
	
	Talk( 1,  "Амос: Только у меня самые последние разработки. Даже не трудитесь смотреть в другом месте. " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Комбинация самоцветов ", OpenUnite)
	Text( 1,  "Изготовить Маску реальности ",JumpPage, 2 )
	Text( 1,  "Ничего... ",CloseTalk )

	InitTrade()
	Other(	3206	)
	Other(	3208	)
	Other(	3205	)
	Other(	3242	)
	Other(	3210	)
	Other(	3207	)
	Other(	3211	)
	Other(	3215	)
	Other(	3212	)
	Other(	3209	)
	Other(	3220	)
	Other(	3222	)
	Other(	3219	)
	Other(	3218	)
	Other(	3216	)
	Other(	3223	)
	Other(	3217	)
	Other(	3224	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other( 3296 )
	Other( 886 )
	--baby--Йъ»ојјДЬКйLv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
	Other(  2440    )

	AddNpcMission	(1161)
	AddNpcMission	(152)
	AddNpcMission	(153)
	AddNpcMission	(154)
	--AddNpcMission	(5500)

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
	Talk( 2,  "Амос: Для изготовления Маски реальности необходимо 1 Эльфийскую печать, 10000 золота и 10 штук любых ресурсов 3 уровня. " )
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
	Text( 2,  "Обменять Сашими на маску реальности ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Амос: Получите и распишитесь. " )
	Talk( 4,  "Амос: У вас нет всех необходимых ингридиентов или свободных мест в инвентаре. ВОзможно также у вас заблокирован инвентарь. " )

end 

function argent ()

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

function ledin ()
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
	Other( 3296 )
	--baby--Йъ»ојјДЬКйLv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
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

function fargite () 

	Talk( 1, "Гид по серверу: Привет, если ты новенький, то я смогу всё рассказать тебе о Лайт-Сервере. Спрашивай =)" )
	Text( 1,  "Кто Вы? ",JumpPage, 3 )
	Text( 1,  "С чего мне начать? ",JumpPage, 4 )
	Text( 1,  "Где найти основных НПС? ",JumpPage, 5 )
	Text( 1,  "Где взять гемы, рефы? ", JumpPage, 6 )
	Text( 1,  "Где взять деньги? ", JumpPage, 7 )
	Text( 1,  "Как разделить кели по 99 шт? ", JumpPage, 8 )
	Text( 1,  "Где взять Кели? ", JumpPage, 9 )
	Text( 1,  "Где взять Пиастры? ", JumpPage, 10 )


        Talk( 3, "Я отвечаю на вопросы жителей Лайт-Сервера. Если у Вас возникли какие то трудности, то ищите меня :)" )
	Text( 3,  "Назад. ", JumpPage, 1)
	Talk( 4, "Думаю тебе сначала нужно прокачаться, сделать это можно убив пару лесных духов в пати, если не будет идти опыт, то всёравно бей духов пока не стаешь 100 лвл." )
	Text( 4,  "Назад. ", JumpPage, 1)
	Talk( 5,  "В Аргенте у фонтана есть телепорт на остров НПСов, там - то ты их и найдёшь. " )
	Text( 5,  "Назад. ", JumpPage, 1)
	Talk( 6,  "В Аргенте рядом с кузнецом их можно приобрести за даром. " )
	Text( 6,  "Назад. ", JumpPage, 1)
	Talk( 7,  "Их выдаёт вонючая хрюшка, которая стоит около портальщицы аргента, на левых воротах. " )
	Text( 7,  "Назад. ", JumpPage, 1)
	Talk( 8,  "Как тут стекуются кели, спросишь ты?! Стекуются они по 10000. Если тебе нужно разделить их на 99, чтобы было удобнее торговать с игроками, то положи максимальное количество своих келей в банк, а потом с банка перетаскивай в разные ячейки инвертаря по 99 шт. " )
	Text( 8,  "Назад. ", JumpPage, 1)
	Talk( 9,  "Если ты новичёк, то тебе лучше идти в лут-зону, попасть в неё можно через портальщика Хоть куда. Находится он на левом выходе аргента. Там с мобов ты будешь выбивать пачкули которые сможешь обменять у Мистера-Келя на сами собственно кели.  Если ты уже сильный игрок, то можешь фармить кели в подземном мире, открывается он на левом выходе Аргента, каждые три часа по МСК, начиная с 00:00 " )
	Text( 9,  "Назад. ", JumpPage, 1)
	Talk( 10,  "Пиастры можно достать с боссов подземного мира, на 1 и 2 этаже. Один ты наврятли справишься, так что возьми с собой парочку друзей. " )
	Text( 10,  "Назад. ", JumpPage, 1)

end

function arenko ()

	Talk( 1,  "Администратор Арены: Привет! Я Администратор Арены! Вы желаете попробовать свои силы и бросить вызов другим игрокам? " )	
	Text( 1,  "Получить Медаль отваги ", JumpPage, 2)
	--Text( 1,  "Обмен чести ", JumpPage, 3)
	Text( 1,  "Обменять очки взноса отряда ", JumpPage, 3)
	--Text( 1,  "Записать точку возвращения ", SetSpawnPos,  "Arenaa")

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

function m_Certificate()
	Talk(1, "\209\226\255\249\229\237\237\232\234: \207\240\232\226\229\242\241\242\226\243\254, \255 \240\229\227\232\241\242\240\232\240\243\254 \225\240\224\234." )
	--Talk(1, "Священник: Приветствую, я регистрирую брак." )
	Text(1, "\223 \245\238\247\243 \243\231\237\224\242\252 \242\240\229\225\238\226\224\237\232\255 \234 \225\240\224\234\243.", JumpPage, 2)
	--Text(1, "Я хочу узнать требования к браку.", JumpPage, 2)	
	Text(1, "\223 \245\238\247\243 \231\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252 \225\240\224\234.", JumpPage, 3)
	--Text(1, "Я хочу зарегистрировать брак.", JumpPage, 3)	
	Text(1, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
	--Text(1, "Зарегистрироваться позже.", CloseTalk)
	Text (1, "\223 \245\238\247\243 \239\238\235\243\247\232\242\252 \202\238\235\252\246\238 \228\237\255 \209\226. \194\224\235\229\237\242\232\237\224.", JumpPage, 4)
	--Text (1, "Я хочу получить Кольцо дня Св. Валентина.", JumpPage, 4) 	
	Text (1, "\223 \245\238\247\243 \208\224\231\226\229\241\242\232\241\252.", JumpPage, 7)
	--Text (1, "Я хочу Развестись.", JumpPage, 7)
	
	Talk(2, "\210\240\229\225\238\226\224\237\232\255: 1. \211 \236\238\235\238\228\238\230\229\237\238\226 \228\238\235\230\237\251 \225\251\242\252 \202\238\235\252\246\224 \209\226\255\242\238\227\238 \194\224\235\229\237\242\232\237\224. 2. \204\238\235\238\228\238\230\229\237\251 \196\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229. 3. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\240\232\237\229\241\242\232 10 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\251\245. 4. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\238\235\243\247\232\242\252 \232 \238\242\234\240\251\242\252 \241\226\238\232 \241\243\237\228\243\234\232 \244\229\233.")
	--Talk(2, "Требования: 1. У молодоженов должны быть Кольца Святого Валентина. 2. Молодожены Должны быть в группе. 3. Каждый должен принести 10 миллионов золотых. 4. Каждый должен получить и открыть свои сундуки фей.")	
	Text(2, "\213\238\240\238\248\238, \255 \239\238\237\255\235. \199\224\240\229\227\232\241\242\240\232\240\243\233\242\229!", JumpPage, 1)
	--Text(2, "Хорошо, я понял. Зарегистрируйте!", JumpPage, 1)	
	Text(2, "\196\224\233\242\229 \239\238\228\243\236\224\242\252.", CloseTalk)
	--Text(2, "Дайте подумать.", CloseTalk)
	
	Talk(3, "\209\226\255\249\229\237\237\232\234: \197\241\235\232 \242\251 \227\238\242\238\226, \239\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232. \207\238\241\235\229 \240\229\227\232\241\242\240\224\246\232\232 \242\251 \239\238\235\243\247\232\248\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \209 \237\232\236 \236\238\230\237\238 \205\224\247\224\242\252 \246\229\240\229\236\238\237\232\254 \241\226\224\228\252\225\251 \243 \194\238\235\248\229\225\237\232\234\224 \215\232\242\224\237\224")
	--Talk(3, "Священник: Если ты готов, пожалуйста, подтверди. После регистрации ты получишь Свадебный Сертификат. С ним можно Начать церемонию свадьбы у Волшебника Читана")	
	Text(3, "\207\238\228\242\226\229\240\228\232\242\252", MarryCertificate)
	--Text(3, "Подтвердить", MarryCertificate)	
	Text(3, "\196\224\233\242\229 \229\249\229 \240\224\231 \239\238\228\243\236\224\242\252.", CloseTalk)
	--Text(3, "Дайте еще раз подумать.", CloseTalk)

	Talk (4, "\209\226\255\249\229\237\237\232\234: \215\242\238\225\251 \232\231\227\238\242\238\226\232\242\252 \202\238\235\252\246\238 \228\237\255 \209\226. \194\224\235\229\237\242\232\237\224 \194\224\236 \237\229\238\225\245\238\228\232\236\238 \239\240\232\237\229\241\242\232: 10 \209\229\240\228\229\247\229\234 \203\254\225\226\232, 10 \209\229\240\228\229\247\229\234 \194\229\240\237\238\241\242\232 \232 10 \209\229\240\228\229\247\229\234 \194\231\224\232\236\238\239\238\237\232\236\224\237\232\229.")
	--Talk (4, "Священник: Чтобы изготовить Кольцо дня Св. Валентина Вам необходимо принести: 3000 Рун Кэль, 35 Пиастр и 80 Нач расписок хс.")
	Text (4, "\194\238\242 \255 \239\240\232\237\229\241 \226\241\229 \237\229\238\225\245\238\228\232\236\251\229 \236\224\242\229\240\232\224\235\251.", JumpPage, 5)
	--Text (4, "Вот я принес все необходимые материалы.", JumpPage, 5)

	Talk (6, "\209\226\255\249\229\237\237\232\234: \200\231\226\232\237\232\242\229 \237\238 \243\226\224\241 \237\229\245\226\224\242\224\229\242 \237\229\238\225\245\238\228\232\236\251\245 \232\237\227\240\232\228\232\229\237\242\238\226 \232\235\232 \226\251 \243\230\229 \238\225\240\243\247\229\237\251.")
	--Talk (6, "Священник: Извините но увас нехватает необходимых ингридиентов или вы уже обручены.")

	InitTrigger ()
	TriggerCondition (1, HasItem, 3457, 3000)
	TriggerCondition (1, HasItem, 7355, 35)
	TriggerCondition (1, HasItem, 2608, 80)
	TriggerCondition( 1, NoItem, 2520, 1)
	TriggerCondition( 1, NoItem, 2521, 1)
	TriggerCondition( 1, BankNoItem, 2520, 1)
	TriggerCondition( 1, BankNoItem, 2521, 1)
	TriggerAction (1, TakeItem, 3457, 3000)
	TriggerAction (1, TakeItem, 7355, 35)
	TriggerAction (1, TakeItem, 2608, 80)
	TriggerAction (1, GiveItem, 2521, 1, 4)
	TriggerFailure (1, JumpPage, 6)
		Talk (5, "\209\226\255\249\229\237\237\232\234: \194\251 \243\226\229\240\229\237\251 \247\242\238 \245\238\242\232\242\229 \239\238\235\243\247\232\242\252 \253\242\238 \202\238\235\252\246\238?")
		--Talk (5, "Священник: Вы уверены что хотите получить это Кольцо?")
		Text (5, "\196\224 \245\238\247\243", MultiTrigger, GetMultiTrigger (), 1)
		--Text (5, "Да хочу", MultiTrigger, GetMultiTrigger (), 1)

	InitTrigger ()
	TriggerCondition (1, HasItem, 2520, 1)
	TriggerCondition( 1, HasMoney, 10000000 )
	TriggerAction( 1, TakeMoney, 10000000 )
	TriggerAction (1, TakeItem, 2520, 1)
	TriggerAction (1, GiveItem, 2521, 1, 4)
	TriggerFailure (1, JumpPage, 6)
		Talk (7, "\209\226\255\249\229\237\237\232\234: \194\251 \243\226\229\240\229\237\251 \247\242\238 \245\238\242\232\242\229 \208\224\231\226\229\241\242\232\241\252?")
		--Talk (7, "Священник: Вы уверены что хотите Развестись?")
		Text (7, "\196\224 \245\238\247\243", MultiTrigger, GetMultiTrigger (), 1)
		--Text (7, "Да хочу", MultiTrigger, GetMultiTrigger (), 1)
end

function npc_eventer ()

Talk( 1, " Приветствую тебя Пират! Я эвентер,если ты мне принесешь нужный лут, то я смогу тебе дать редкие предметы!(  " )
Text( 1, " Да, я готов! ", JumpPage, 2)

Talk( 2, " Тебе нужно будет убить опасных боссов,таких как Яростная Кара,Дефектный Защитник Реликвий,ДВ 1 и ДВ 2(Принести с них лут: 1 Карты кравожадной медузы,5 Пиастр,1 Души Черного Дракона(Не гем) " )
Text( 2, " Хочу 13 Расписок Хаоса нач.ур ", JumpPage, 3)
Text( 2, " Хочу Великий самоцвет Ярости 5лв ", JumpPage, 4)
Text( 2, " Хочу Великий самоцвет Колоса 5лв ", JumpPage, 5)
Text( 2, " Хочу Великий самоцвет Удара 5лв ", JumpPage, 6)
Text( 2, " Хочу Великий самоцвет Души 5лв ", JumpPage, 7)
Text( 2, " Хочу Великий самоцвет Ветра 5лв  ", JumpPage, 8)

Talk(3," Надеюсь ты принес то что я тебя просил?!(Хочеш забрать расписки) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 2608,13,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Гем) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7108,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(4," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Гем) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7111,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(5," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Гем ) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7110,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(6," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Гем) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7109,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(7," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Гем) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7112,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(8," Да, я хочу свое оружие! ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," Надеюсь ты принес то что я тебя просил?! (Хочеш забрать Пиастры) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7355,7,4 )
TriggerFailure( 1, JumpPage, 19)
Text(9," Да, я хочу! ",MultiTrigger,GetMultiTrigger(),1)


Talk( 19, "Прошу, не обманывай меня! " ) -- страница если не достаточно репы

end

function npc_avrora ()

Talk( 1, " Приветствую тебя! Я НПС Авроры,если ты мне принесешь кусочки золота, то я смогу из них сделать золотую пиастру!(  " )
Text( 1, " Да, я готов! ", JumpPage, 2)

Talk( 2, " Тебе нужно принести мне 30 шт кусочков золота,они выпадают с Сундуков Авроры.Будь осторожен их охраняют злобные твари. " )
Text( 2, " Хочу Gold PST ", JumpPage, 3)

Talk(3," Надеюсь у меня получится!И ты заберешь свою Пиастру ")
InitTrigger()
TriggerCondition( 1, HasItem,7415,30 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7415,30 )
TriggerAction( 1, GiveItem, 7355,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," Да,я молюсь что б получилось! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "Прошу, не обманывай меня! " ) -- страница если не достаточно репы

end

function npc_kril ()

Talk( 1, " Приветствую тебя! Я Брюс Всемогущий,если ты мне принесешь то что я попрошу,то получишь в замен Крыло Повелителя!!!(  " )
Text( 1, " Да, я готов! ", JumpPage, 2)

Talk( 2, " Тебе нужно принести мне 20000 рун Кэль,50 расп.хс нач лв,50 Пиастр,+14 гемы всех видов 7лв,150 кусочков золота. " )
Text( 2, " Вот!!!Давай крылья. ", JumpPage, 3)

Talk(3," Ну что ж как и обещал.")
InitTrigger()
TriggerCondition( 1, HasItem,7415,100 )
TriggerCondition( 1, HasItem,2608,40 )
TriggerCondition( 1, HasItem,3457,20000 )
TriggerCondition( 1, HasItem,7111,1,107 )
TriggerCondition( 1, HasItem,7110,1,107 )
TriggerCondition( 1, HasItem,7109,1,107 )
TriggerCondition( 1, HasItem,7112,1,107 )
TriggerCondition( 1, HasItem,7355,50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7415,150 )
TriggerAction( 1, TakeItem, 2608,50 )
TriggerAction( 1, TakeItem, 3457,20000 )
TriggerAction( 1, TakeItem, 7111,1,107 )
TriggerAction( 1, TakeItem, 7110,1,107 )
TriggerAction( 1, TakeItem, 7109,1,107 )
TriggerAction( 1, TakeItem, 7112,1,107 )
TriggerAction( 1, TakeItem, 7355,50 )
TriggerAction( 1, GiveItem, 7319,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," Спасибо! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "Прошу, не обманывай меня или я превращу тебя в жабу! " ) -- страница если не достаточно репы

end

function r_talk123 ()
Talk( 1, " Что ты пялишься Вась?! Ты помоему чтото брать хотел?! Нет?! Тогда Проваливай! " )
Text( 1, " Да, хочу гемки +14 ", JumpPage, 2)

Talk( 2, " Ок, только не одолевай меня и выбирай быстрее! " )
Text( 2, " На стр +14(8шт) ", JumpPage, 3)
Text( 2, " На акк +14(8шт)  ", JumpPage, 4)
Text( 2, " На спр +14(8шт) ", JumpPage, 5)
Text( 2, " На аги +14(8шт) ", JumpPage, 6)
Text( 2, " На кон +14(8шт) ", JumpPage, 7)


Talk(3," Давай 130 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7108,8,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(3," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," Давай 130 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7110,8,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(4," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," Давай 130 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7109,8,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(5," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," Давай 130 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7112,8,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(6," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," Давай 130 Рун Кэль! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --Это функция проверки какой итем и в каком количестве должен быть в рюкзаке
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- Это функция проверки заблокирован ли инвентарь
TriggerAction( 1, TakeItem, 3457,130 ) -- Это функция "изьятия" предмета и в каком количестве
TriggerAction( 1, GiveItem, 7111,8,4 ) -- Это функция выдачи предмета (ID, кол-во)
TriggerFailure( 1, JumpPage, 14)
Text(7," Отдать ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," Ты что гавнюк, вздумал обмануть меня? Проваливай! " )
Text(14," Ладно, сваливаю, только ГМа не зови!! ",CloseTalk )
Text(14," Поискать заного! ",JumpPage, 1 )

end