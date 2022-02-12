--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------

print( "‡ Јаг§Є  EudemonScript.lua" )
print( "Eudemon init" )
print( "-------------------------------------------------------------------------------" )
print( "‡ Јаг§Є  Є ав:" )
print( "-------------------------------------------------------------------------------" )

--Профессии
JobCh = {}
JobCh.Money = {}
JobCh.Money.First = 5000	-- Деньги для получения первой профессии
JobCh.Money.Second = 50000	-- Деньги для получения второй профессии
JobCh.Level = {}
JobCh.Level.First = 9		-- Уровень для получения первой профессии
JobCh.Level.Second = 40		-- Уровень для получения второй профессии

function Eudemon()
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

function EudemonMission()
	InitTrigger()
	RegTrigger( 8889, 1 )

	DefineWorldMission( 1, "Добро Пожаловать ", 1 )
	
	MisBeginTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу Новичков (2223,2785). Она живет в Аргенте (2223,2785) и помогает новичкам.<n><t>Удачных приключений!" )
	MisHelpTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу - Синну (2223,2785). Она живет в Аргенте (2223,2785) и помогает новичкам.<n><t>Удачных приключений!" )
	MisBeginAction( AddMission, 1 )
	MisBeginAction( SetFlag, 1, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "Найди <Наставницу новичков - Синну (2223,2785)> в районе (2223,2785), чтобы побольше узнать о классах и характеристиках.")

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 2, "Добро Пожаловать ", 2 )
	
	MisBeginTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу Новичков.Она живет в Шайтане (877,3573) и помогает новичкам.<n><t>Удачных приключений!" )
	MisHelpTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу - Рислину (877,3573). Она живет в Шайтане (877,3573) и помогает новичкам.<n><t>Удачных приключений!" )
	MisBeginAction( AddMission, 2 )
	MisBeginAction( SetFlag, 2, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "Найди Наставницу Новичков,в Шайтане(877,3573),чтобы начать свой путь!")

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 3, "Добро Пожаловать ", 3 )
	
	MisBeginTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу - Анжелу (1315,507). Она живет в Ледыне (1315,507) и помогает новичкам.<n><t>Удачных приключений!" )
	MisHelpTalk( "<t>Добро пожаловать в Пиратию Онлайн!<n><t> Мир, полный таинственных созданий, сокровищ, и, конечно же, опасностей и приключений. Ты свободно можешь исследовать город, а освоившись, ты, вероятно, пожелаешь записаться во Флот или присоедениться к Пиратам и охотиться за сокровищами и славой!<n><t>Твоим первым заданием будет найти Наставницу - Анжелу (1315,507). Она живет в Ледыне (1315,507) и помогает новичкам.<n><t>Удачных приключений!" )
	MisBeginAction( AddMission, 3 )
	MisBeginAction( SetFlag, 3, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "Найди <jНаставницу новичков - Анжелу (1315,507)> в районе (1315,507), чтобы побольше узнать о классах и характеристиках.")

	MisResultCondition( AlwaysFailure )
	DefineWorldMission( 4, "Заманить бехамота ", 4 )

	MisBeginTalk( "<t>Идите в <jЗаброшенные шахты 2 (135,137)> и отыщите логово Бехамота.<n><t>Когда вы найдете его, используйте <yПеченье>. Помните, у вас будет всего 1 час." )
	MisHelpTalk( "<t>Идите в <jЗаброшенные шахты 2 (135,137)> и отыщите логово Бехамота.<n><t>Когда вы найдете его, используйте <yПеченье>. Помните, у вас будет всего 1 час." )
	MisBeginAction( AddMission, 4 )
	MisBeginAction(SystemNotice, "Получено задание: \"Заманить бехамота\"" )

	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Найди логово <bБехамота> и используй специальный бисквит, чтобы приманить его " )
	MisNeed(MIS_NEED_KILL, 99, 1, 10, 1)

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 5, "Для тех, кого это касается ", 5 )
	
	MisBeginTalk( "<t>Письмо адресованно <bСупермуну><n><t>Срочно доложите <jМерикс (1118,3611)>." )
	MisHelpTalk( "<t>Письмо адресованно <bСупермуну><n><t>Срочно доложите <jМерикс (1118,3611)>." )
	MisBeginAction( AddMission, 5 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Доложите о том, кому на самом деле адресованно письмо. Найдите <jМерикс в точке (1118,3611)>.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 6, "Неверный вопрос ", 6 )
	
	MisBeginTalk( "<t>Похоже, что Ронни что-то не договаривают. Поговори со <jСтариком - Пачкулей в точке (2272,2700)>." )
	MisHelpTalk( "<t>Похоже, что Ронни что-то не договаривают. Поговори со <jСтариком - Пачкулей в точке (2272,2700)>." )
	MisBeginAction( AddMission, 6 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговорите со <jСтариком - Пачкулей в точке (2272,2700)>")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 7, "Вернуться в Ледынь ", 7 )
	
	MisBeginTalk( "<t>Пришло время поговорить с <jЛюком (1320,585)>. Узнай больше о Девятой бухте." )
	MisHelpTalk( "<t>Пришло время поговорить с <jЛюком (1320,585)>. Узнай больше о Девятой бухте." )
	MisBeginAction( AddMission, 7 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори о Девятой бухте с <jЛюком в точке (1320,585)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 8, "Кровь пирата ", 8 )
	
	MisBeginTalk( "<t>Когда я взял в руки это, меня пронзил таинственный голос: \" Кровь Пирата, тобой принесенная в жертву мне, позволит показать тебе путь\"...<n>Поговори с <jДжеком (1672,3777)>. Может быть ты узнаешь от него что-то новое..." )
	MisHelpTalk( "<t>Когда я взял в руки это, меня пронзил таинственный голос: \" Кровь Пирата, тобой принесенная в жертву мне, позволит показать тебе путь\"...<n>Поговори с <jДжеком (1672,3777)>. Может быть ты узнаешь от него что-то новое..." )
	MisBeginAction( AddMission, 8 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори с <jДжеком (1672,3777)>. Ответ в твоем сердце ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 9, "Душа флота ", 9 )
	
	MisBeginTalk( "<t>Когда я обоими руками коснулся черного объекта, мистический голос сказал мне: \" Душа Флота, тобой принесенная в жертву мне, позволит показать тебе путь\"...<n>Что за душа флота, я не понял. Может быть <jДжек (1672,3777)> знает что-нибудь?" )
	MisHelpTalk( "<t>Когда я обоими руками коснулся черного объекта, мистический голос сказал мне: \" Душа Флота, тобой принесенная в жертву мне, позволит показать тебе путь\"...<n>Что за душа флота, я не понял. Может быть <jДжек (1672,3777)> знает что-нибудь?" )
	MisBeginAction( AddMission, 9 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори с <jДжеком (1672,3777)>. Ответ в твоем сердце ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 10, "Безымянный ", 10 )
	
	MisBeginTalk( "<t>Когда я дотронулся обоими руками до той черной штуки, таинственный голос раздался во мне: \"Безымянный, докажи свою храбрость и я покажу тебе дорогу\"...<n><t>Я долго думал о том, кто такой Безымянный. И как мне доказать свою храбрость? Может быть, <jДжек (1672,3777)> знает хоть что-то?" )
	MisHelpTalk( "<t>Когда я дотронулся обоими руками до той черной штуки, таинственный голос раздался во мне: \"Безымянный, докажи свою храбрость и я покажу тебе дорогу\"...<n><t>Я долго думал о том, кто такой Безымянный. И как мне доказать свою храбрость? Может быть, <jДжек> (1672,3777)> знает хоть что-то?" )
	MisBeginAction( AddMission, 10 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори с <jДжеком (1672,3777)>. Ответ в твоем сердце ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 11, "Кровь Пирата ", 11 )
	
	MisBeginTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить тебе с <jГлавой Ледыни - Рейно (1346,451)>." )
	MisHelpTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить тебе с <jГлавой Ледыни - Рейно (1346,451)>." )
	MisBeginAction( AddMission, 11 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори с <jГлавой Ледыни - Рейно (1346, 451)> о Крови Пирата.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 12, "Душа Флота ", 12 )

	MisBeginTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить с <jГенералом - Вильямом (2277, 2831)>." )
	MisHelpTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить с <jГенералом - Вильямом (2277, 2831)>." )
	MisBeginAction( AddMission, 12 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Иди в точку и спроси <jГенерала - Вильяма (2277,2831)> о Душе Флота.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 13, "Безымянный ", 13 )
	
	MisBeginTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить с <jСекретарем Аргента - Сальвером (2219,2749)>." )
	MisHelpTalk( "<t>Я чувствую, что Джек знает, но он не хочет говорить мне. Неужели это потому, что я убил так много его Приспешников? Хм.. Я лучше побегу побыстрее. Пришло время поговорить с <jСекретарем Аргента - Сальвером (2219,2749)>." )
	MisBeginAction( AddMission, 13 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Спроси <bСекретаря Аргента - Сальвера (2219,2749)> о безымянном человеке.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 14, "Чудесный свет ", 14 )
	
	MisBeginTalk( "<t>Когда я обнаружил эту странную часть океана, мы с экипажем моего судна сильно потрепались. Но если я не смогу найти ничего стоящего, то у меня просто не хватит мужества вернуться домой. На данный момент сердце моряка еще горит. Я чувствую, что восстановлю мой корабль в полном объеме. Вот сюрприз так сюрприз. *Моряк улыбается, видимо, он действительно рад этому повороту событий*<n><t>Я испытываю желание изъявить благодарность <jСекретарю Аргента - Сальверу (2219,2749)>. Он должен быть в состоянии объяснить мне, что произошло." )
	MisHelpTalk( "<t>Когда я обнаружил эту странную часть океана, мы с экипажем моего судна сильно потрепались. Но если я не смогу найти ничего стоящего, то у меня просто не хватит мужества вернуться домой. На данный момент сердце моряка еще горит. Я чувствую, что восстановлю мой корабль в полном объеме. Вот сюрприз так сюрприз. *Моряк улыбается, видимо, он действительно рад этому повороту событий*<n><t>Я испытываю желание изъявить благодарность <jСекретарю Аргента - Сальверу (2219,2749)>. Он должен быть в состоянии объяснить мне, что произошло." )
	MisBeginAction( AddMission, 14 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Поговори с <bСекретарем Аргента - Сальвером (2219, 2749)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 15, "Банк Громограда ", 15 )
	
	MisBeginTalk( "<t>Я изучила ключ, который находится у меня в руках. Он выглядит изысканно и красиво. Несмотря на то, что он стар, он станет замечательным логотипом банка Громограда. Похоже, у меня есть идея.." )
	MisHelpTalk( "<t>Я изучила ключ, который находится у меня в руках. Он выглядит изысканно и красиво. Несмотря на то, что он стар, он станет замечательным логотипом банка Громограда. Похоже, у меня есть идея.." )
	MisBeginAction( AddMission, 15 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Принеси <rКлюч древних> <jБанкиру - Макурдо (743,1534)> в банк Громограда ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 16, "Завещание Андрея ", 16 )
	
	MisBeginTalk( "<t>\"Я маленькая птичка, которая стремится к свободе небес... Пожалуйста, не смотрите так на меня, я стесняюсь...\"<n><t> Что это было? Я уснул? Или это Воля Андрея??? Необходимо спросить об этом <rДжека>." )
	MisHelpTalk( "<t>\" Я маленькая птичка, которая стремится к свободе небес... Пожалуйста, не смотрите так на меня, я стесняюсь...\"<n><t> Что это было? Я уснул? Или это Воля Андрея??? Необходимо спросить об этом <rДжека>." )
	MisBeginAction( AddMission, 16 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Найди <jДжека (1672,3777)>, чтобы узнать, что это было ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 17, "Любовное переплетение ", 17 )
	
	MisBeginTalk( "<t>Похоже, месть между Малышом Даниэлем и Капитаном Джеком будет зависеть от этой головы тыквы. Может быть, она навеет сладкие воспоминания <rМалышу Даниэлю>." )
	MisHelpTalk( "<t>Похоже, месть между Малышом Даниэлем и Капитаном Джеком будет зависеть от этой головы тыквы. Может быть, она навеет сладкие воспоминания <rМалышу Даниэлю>." )
	MisBeginAction( AddMission, 17 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Отнеси <bТыквенную голову> <jМалышу Даниэлю (2193,2730)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 18, "Язык пиратов ", 18 )
	
	MisBeginTalk( "<t>Когда я покорно окропил текст Проявителем Невидимых Чернил по приказу Андрея, случилось нечто поразительное. Слова стали постепенно исчезать, открывая странные предложения, отвратительно написанные непонятным пиратским языком: \"Звуки победы приведут к тропе смерти. Обязан ты идти к горизонту из скелетов. Когда кровь снова польется по иссушенным костям, найти ты сможешь несметные сокровища.\" <n><t>Что бы это значило? Наверняка Джек знает что-то про это." )
	MisHelpTalk( "<t>Когда я покорно окропил текст Проявителем Невидимых Чернил по приказу Андрея, случилось нечто поразительное. Слова стали постепенно исчезать, открывая странные предложения, отвратительно написанные непонятным пиратским языком: \"Звуки победы приведут к тропе смерти. Обязан ты идти к горизонту из скелетов. Когда кровь снова польется по иссушенным костям, найти ты сможешь несметные сокровища.\" <n><t>Что бы это значило? Наверняка Джек знает что-то про это." )
	MisBeginAction( AddMission, 18 )
	MisBeginAction( TakeItem, 4228, 1 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Найди <jКапитана Джека (1672, 3777)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 19, "Сокровище русалки ", 19 )
	
	MisBeginTalk( "<t>Должно быть, это <rРусалочье тело>! Все равно здесь нет ни намека на сокровища. Мне кажется, что Джек все же ошибся. Подождите-ка... Что это? Похоже, что тут написано, <p\"(1843, 1717)\">. Должно быть, это координаты сокровища!<n><t>Но что за море!? Видимо, придется искать методом проб и ошибок. Как сказал Джек, если я пролью свою кровь на <rРусалочье тело>, откроется правильное местоположение. Звучит не так уж и плохо, но будет больно!" )
	MisHelpTalk( "<t>Должно быть, это <rРусалочье тело>! Все равно здесь нет ни намека на сокровища. Мне кажется, что Джек все же ошибся. Подождите-ка... Что это? Похоже, что тут написано, <p\"(1843, 1717)\">. Должно быть, это координаты сокровища!<n><t>Но что за море!? Видимо, придется искать методом проб и ошибок. Как сказал Джек, если я пролью свою кровь на <rРусалочье тело>, откроется правильное местоположение. Звучит не так уж и плохо, но будет больно!" )
	MisBeginAction( AddMission, 19 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Отправляйся <jв точку (1843,1717)> и используй <rРусалочье тело> чтобы увидеть, что будет ")
	
	MisResultCondition( AlwaysFailure )
	MisResultAction(AddExp,100000,100000)
	MisResultAction(AddMoney,12000,12000)
	MisResultAction(AddExpAndType,2,30000,30000)
	MisResultAction(GiveItem,3462,20,4)

	DefineWorldMission( 20, "Таинственный дневник ", 20 )
	
	MisBeginTalk( "<t>Когда моя кровь пролилась на останки русалки, я ощутил ужасную боль, что чуть не потерял сознание.<n><t>Когда я проснулся, кости русалки исчезли и в моих руках оказался дневник Андрея. Сверху имя обладателя дневника было написано на демоническом языке.<n><t>Протирая глаза я приоткрыл дневник и понял - это был журнал мореплавателя. Все было написано на демоническом языке но, тем не менее, на некоторых страницах упоминался таинственный городок.<n><t>На сколько я помню, <rСтарик - Пачкуля> в точке (2272, 2700) сказал мне, что если возникнут трудности с языками, он может помочь. Не мог бы ты поговорить с ним?" )
	MisHelpTalk( "<t>Когда моя кровь пролилась на останки русалки, я ощутил ужасную боль, что чуть не потерял сознание.<n><t>Когда я проснулся, кости русалки исчезли и в моих руках оказался дневник Андрея. Сверху имя обладателя дневника было написано на демоническом языке.<n><t>Протирая глаза я приоткрыл дневник и понял - это был журнал мореплавателя. Все было написано на демоническом языке но, тем не менее, на некоторых страницах упоминался таинственный городок.<n><t>На сколько я помню, <rСтарик - Пачкуля> в точке (2272, 2700) сказал мне, что если возникнут трудности с языками, он может помочь. Не мог бы ты поговорить с ним?" )
	MisBeginAction( AddMission, 20 )
	MisBeginAction( SetRecord, 19 )
	MisBeginAction( ClearMission, 19 )
	MisBeginAction( TakeItem, 4230, 1 )
	MisBeginAction( GiveItem, 4231, 1, 4 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Отнеси дневник в точку и поговори со <jСтариком - Пачкулей (2272,2700)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 21, "Таинственный город ", 21 )
	
	MisBeginTalk( "<t>\"Я был в том городе немного, около одной недели. Этот город запомнился в моих глазах мистическими событиями. Ведь такое невозможно - там все время весна. Вы вряд ли найдете еще один такой город.<n><t> Я бы хотел остаться в этом городе навсегда, наслаждаясь своей  жизнью. Однако кажется странным видеть то, когда рассвет только начинается и какой-нибудь корабль уже появляется на горизонте. Я хотел уйти сейчас, иначе этот маленький город будет страдать так же, как и мой родной.<n><t>Если тебе попадется этот дневник, я надеюсь, что жители могли бы поделиться памятью о моем пребывании там. Я знаю этот город как Весноград <n> <t> Хм… это кажется шуткой, но лучше спросить об этом <rБлагочестивую Жрицу>, чтобы она рассказала про этот город." )
	MisHelpTalk( "<t>\"Я был в том городе немного, около одной недели. Этот город запомнился в моих глазах мистическими событиями. Ведь такое невозможно - там все время весна. Вы вряд ли найдете еще один такой город.<n><t> Я бы хотел остаться в этом городе навсегда, наслаждаясь своей  жизнью. Однако кажется странным видеть то, когда рассвет только начинается и какой-нибудь корабль уже появляется на горизонте. Я хотел уйти сейчас, иначе этот маленький город будет страдать так же, как и мой родной.<n><t>Если тебе попадется этот дневник, я надеюсь, что жители могли бы поделиться памятью о моем пребывании там. Я знаю этот город как Весноград <n> <t> Хм… это кажется шуткой, но лучше спросить об этом <rБлагочестивую Жрицу>, чтобы она рассказала про этот город." )
	MisBeginAction( AddMission, 21 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Расспроси <jДостопочтенную жрицу - Аду (862,3303)> о Веснограде.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 22, "Колесо судьбы ", 22 )
	
	MisBeginTalk( "<t>Однажды, я семь дней бороздил просторы туннеля без единого источника света. Со мной лишь было Водяное колесо.<n><t>Внезапно я услышал чей-то крик. Будучи оптным моряком я сразу изменил курс судна на крик. <n><t>Было ли это ловушка? Непонятно..." )
	MisHelpTalk( "<t>Однажды, я семь дней бороздил просторы туннеля без единого источника света. Со мной лишь было Водяное колесо.<n><t>Внезапно я услышал чей-то крик. Будучи оптным моряком я сразу изменил курс судна на крик. <n><t>Было ли это ловушка? Непонятно..." )
	MisBeginAction( AddMission, 22 )
	MisBeginAction( TakeItem, 4237,1 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Отправляйся в <jАскарон (1497, 1707)> и посмотри, есть ли там что-нибудь ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 24, "Слеза дракона ", 24)
	
	MisBeginTalk( "<t>Если я не ошибся, Ледяной Дракон тоже плачет. Правда слеза быстро застыла... В результате, она превратилась в драгоценный самоцвет. Чтобы такое заставило дракона прослезиться?<n><t>Похоже есть действительно сильные вещи..." )
	MisHelpTalk( "<t>Если я не ошибся, Ледяной Дракон тоже плачет. Правда слеза быстро застыла... В результате, она превратилась в драгоценный самоцвет. Чтобы такое заставило дракона прослезиться?<n><t>Похоже есть действительно сильные вещи..." )
	MisBeginAction( AddMission, 24 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Принесите Слезу Дракона и расспросите о ней жителей ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 25, "Тайна слезы дракона ", 25)
	
	MisBeginTalk( "<t>Это был обман или легенда правда подтвердилась?<n><t>Слеза внезапно замерцала...и кажется, что луч указывал на Шайтан...<n><t>Может это знак? Поговори с моим старым другом, <bДостопочтенной жрицой - Адой>, может она прольет свет на эту историю." )
	MisHelpTalk( "<t>Это был обман или легенда правда подтвердилась?<n><t>Слеза внезапно замерцала...и кажется, что луч указывал на Шайтан...<n><t>Может это знак? Поговори с моим старым другом, <bДостопочтенной жрицой - Адой>, может она прольет свет на эту историю." )
	MisBeginAction( AddMission, 25 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Поговори с <jДостопочтеной жрицей - Адой (862,3303)> и спроси у нее про Слезу Дракона ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 26, "Месторождение Хассли ", 26)
	
	MisBeginTalk( "<t>Дорогой друг, спасибо что ты освободил меня. Все это время я был заключен в тело ледяного дракона и не осознавал что делаю. Беспомощный, я видел, как убиваю всех людей, что встали у меня на пути, но я не мог остановить себя. Неужели люди посчитают неправильным то, что я собираюсь использовать слезы дракона, чтобы оживить свою сестру? Я не знаю, существует ли бог в этом мире, но то, что я действительно знаю, так это то, что этот мир состоит из множества тайн и загадок, таких, например, как слезы дракона.<n><t> Увы, мое время здесь истекает. У меня хранится немного денег в банке Аргента, думаю, это поможет тебе. Напоследок я оставлю тебе один добрый совет. Все, что ты видишь - не то, что тебе кажется. Твой собственный глаз часто является главной причиной обмана." )
	MisHelpTalk( "<t>Дорогой друг, спасибо что ты освободил меня. Все это время я был заключен в тело ледяного дракона и не осознавал что делаю. Беспомощный, я видел, как убиваю всех людей, что встали у меня на пути, но я не мог остановить себя. Неужели люди посчитают неправильным то, что я собираюсь использовать слезы дракона, чтобы оживить свою сестру? Я не знаю, существует ли бог в этом мире, но то, что я действительно знаю, так это то, что этот мир состоит из множества тайн и загадок, таких, например, как слезы дракона.<n><t> Увы, мое время здесь истекает. У меня хранится немного денег в банке Аргента, думаю, это поможет тебе. Напоследок я оставлю тебе один добрый совет. Все, что ты видишь - не то, что тебе кажется. Твой собственный глаз часто является главной причиной обмана." )
	MisBeginAction( AddMission, 26 )
	MisBeginAction( TakeItem, 4240, 1 )
	MisBeginAction( SetRecord, 370 )
	MisBeginAction( ClearMission, 370 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Отправься в <jБанк Громограда (743,1534)> и сними немного денег со счета ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 27, "Любовное письмо Чжоу ", 27)
	
	MisBeginTalk( "<t>Хоть это и не хорошо открывать и читать письма, адресованные другим, но мне было уж очень любопытно что мог написать столь страшный человек. В общем - я открыл это письмо очень аккуратно, не повредив печати и чтобы его можно было снова запечатать. Я пожалел, что открыл это письмо после прочтения первого же предложения. Это - любовное письмо.<n><t> Я быстро запечатал конверт, мое сердце стучало, словно я бегу 1000 метров. Интересно, что бы сказал Ванг Мо..." )
	MisHelpTalk( "<t>Хоть это и не хорошо открывать и читать письма, адресованные другим, но мне было уж очень любопытно что мог написать столь страшный человек. В общем - я открыл это письмо очень аккуратно, не повредив печати и чтобы его можно было снова запечатать. Я пожалел, что открыл это письмо после прочтения первого предложения. Это - любовное письмо.<n><t> Я быстро запечатал конверт, мое сердце стучало, словно я бегу 1000 метров. Интересно, что бы сказал Ванг Мо..." )
	MisBeginAction( AddMission, 27 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Отнеси <rРозовое письмо> <jВанг Мо (3290,2512)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 28, "Исследование моря ", 28)
	
	MisBeginTalk( "<t>Если я не ошибаюсь, то это лодка Эри. Не удивительно, что это дырявое корыто еще на плаву. Если бы я выпил все запасы вина, что стоят в трюме этого корабля, то я никогда бы вновь не протрезвел. Похоже, Длинный Эр даже и не беспокоится. Я должен вернуться, чтобы доложить начальству об этом." )
	MisHelpTalk( "<t>Если я не ошибаюсь, то это лодка Эри. Не удивительно, что это дырявое корыто еще на плаву. Если бы я выпил все запасы вина, что стоят в трюме этого корабля, то я никогда бы вновь не протрезвел. Похоже, Длинный Эр даже и не беспокоится. Я должен вернуться, чтобы доложить начальству об этом." )
	MisBeginAction( AddMission, 28 )
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Поговорить с <jДлинным - Эром (3195,2506)> ")
	
	MisResultCondition( AlwaysFailure )
	
	DefineWorldMission( 29, "Трагедия ", 29)
	
	MisBeginTalk( "<t>В ходе моих исследований я наткнулся на странное <rПисьмо в бутылке>. Оно сделано из шкур разных животных. Я не могу разобраться в этих странных каракулях что, наверное, было волей того, кто писал это письмо. Не мог бы ты отнести это письмо <rВерховной жрице - Аде> и узнать, возможно ли расшифровать его?" )
	MisHelpTalk( "<t>В ходе моих исследований я наткнулся на странное <rПисьмо в бутылке>. Оно сделано из шкур разных животных. Я не могу разобраться в этих странных каракулях что, наверное, было волей того, кто писал это письмо. Не мог бы ты отнести это письмо <rВерховной жрице - Аде> и узнать, возможно ли расшифровать его?" )
	MisBeginAction( AddMission, 29 )
	MisBeginAction( SetRecord, 381 )
	MisBeginAction( ClearMission, 381 )
	MisBeginAction( TakeItem, 4253, 1, 4 )
	MisBeginAction( GiveItem, 4233, 1,4)
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )
	MisNeed(MIS_NEED_DESP, "Отнеси это <rСообщение в бутылке> <jДостопочтенной жрице - Аде (862, 3303)>")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 30, "Языковой барьер ", 30 )

	MisBeginTalk( "<t>Привет, это говорит <bРецепт говорящего зелья>. Даже не спрашивай, почему я умею разговаривать.<n><t>И не вздумай поджигать меня! Хорошо, хорошо, ты выиграл, я расскажу тебе, как создать говорящее зелье. Значит так, тебе понадобится: 30 Полосатых рыбьих костей, 30 Толстых рыбьих костей, 30 Гнилых рыбьих костей и 10 Светящихся покров медуз. Да, это все. Всего 4 ингредиента. Когда ты соберешь их все, отнеси меня и эти ингредиенты <bМастеру Керра>, и он поможет тебе создать это зелье.")
	MisHelpTalk( "<t>Привет, это говорит <bРецепт говорящего зелья>. Даже не спрашивай, почему я умею разговаривать.<n><t>И не вздумай поджигать меня! Хорошо, хорошо, ты выиграл, я расскажу тебе, как создать говорящее зелье. Значит так, тебе понадобится: 30 Полосатых рыбьих костей, 30 Толстых рыбьих костей, 30 Гнилых рыбьих костей и 10 Светящихся покров медуз. Да, это все. Всего 4 ингредиента. Когда ты соберешь их все, отнеси меня и эти ингредиенты <bМастеру Керра>, и он поможет тебе создать это зелье.")
	MisBeginAction(AddMission, 30)
	MisBeginAction(TakeItem, 4256, 1)
	MisBeginAction(AddTrigger, 301, TE_GETITEM, 4938, 30)
	MisBeginAction(AddTrigger, 302, TE_GETITEM, 4957, 30)
	MisBeginAction(AddTrigger, 303, TE_GETITEM, 4976, 30)
	MisBeginAction(AddTrigger, 304, TE_GETITEM, 4974, 10)
	MisCancelAction(SystemNotice, "Задание нельзя отменить " )

	MisNeed(MIS_NEED_DESP, "Следуй инструкции рецепта и принеси требуемые ингредиенты <jМастеру Керра (2664,654)> ")
	MisNeed(MIS_NEED_ITEM, 4938, 30, 1, 30)
	MisNeed(MIS_NEED_ITEM, 4957, 30, 31, 30)
	MisNeed(MIS_NEED_ITEM, 4976, 30, 61, 30)
	MisNeed(MIS_NEED_ITEM, 4974, 10, 91, 10)

	MisResultCondition( AlwaysFailure )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4938 )
	TriggerAction( 1, AddNextFlag, 30, 1, 30 )
	RegCurTrigger( 301 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4957 )
	TriggerAction( 1, AddNextFlag, 30, 31, 30 )
	RegCurTrigger( 302 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4976 )
	TriggerAction( 1, AddNextFlag, 30, 61, 30 )
	RegCurTrigger( 303 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4974 )
	TriggerAction( 1, AddNextFlag, 30, 91, 10 )
	RegCurTrigger( 304 )
end
EudemonMission()