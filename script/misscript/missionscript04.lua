print( "‡ Јаг§Є  MissionScript04.lua" )

jp= JumpPage
amp=AutoMissionPage
ct=CloseTalk
am=AddMission
MissionCheck = HasFlag
mc=MissionCheck

function CenterMission001()

	DefineMission( 400, "Блуждающие Существа ", 400 )
	
	MisBeginTalk( "<t>Большой лес - это опасное место, будьте осторожны с местными жителями.<n><t>Хотя, мой племянник, <bБерри>, живет рядом с <pШахтами> расположенный на краю леса. Не могли ли бы Вы навестить его и посмотреть как живёт мой любимый племянник?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 400)
	MisBeginCondition(NoMission, 400)
	MisBeginAction(AddMission, 400)
	MisCancelAction(ClearMission, 400)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с <bБерри> в (1893, 2812)")
	
	MisHelpTalk(" Берри всегда играет около Шахт, я надеюсь у него всё хорошо.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 401, "Блуждающие Существа ", 400, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t>Привет! Медвежата не такие и опасные, как думает мой дядя. Они безобидные и мне нравится с ними играть.")
	MisResultCondition(NoRecord, 400)
	MisResultCondition(HasMission, 400)
	MisResultAction(ClearMission, 400 )
	MisResultAction(SetRecord, 400 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)



	DefineMission( 402, "Последнее Прибытие ", 401 )
	
	MisBeginTalk( "<t>Привет! Вы приехали во время! Я как раз должен с минуты на минуту встретиться с Шайтанскими торговцами. Они приезжают к нам сюда каждый год что бы обменяться товаром. Но их давно нет. <n> <t> Не могли б вы найти <bМаркуса> в <pОазисе> и узнавать что их так задержало?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 401)
	MisBeginCondition(NoMission, 401)
	MisBeginAction(AddMission, 401)
	MisCancelAction(ClearMission, 401)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с <bМаркусом> в <pОазисе> (789, 3112)")
	
	MisHelpTalk( " Эй! Вы ещё тут? Вы нашли Маркуса?")
	MisResultCondition(AlwaysFailure )

	DefineMission( 403, "Последнее Прибытие ", 401, COMPLETE_SHOW )--Последнее Прибытие
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>О, нам мешают эти песчаные бури, они тут зачастили, и по этому мы вынуждены отложить поездку по другим городам. Не волнуйтесь, как только буря утихнет, мы обязательно отправимся в Аргент, и мы не упустим возможность заработать деньги, а торговать в Аргенте это хороший бизнес!")
	MisResultCondition(NoRecord, 401)
	MisResultCondition(HasMission, 401)
	MisResultAction(ClearMission, 401 )
	MisResultAction(SetRecord, 401 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)



	DefineMission( 404, "Исследование Тундры ", 402 )--Исследование Тундры
	
	MisBeginTalk( "<t>Привет мой друг, Вы развиваетесь быстро. Эти маленькие животные больше Вам не соперники.<n><t>Я слышал что в <pЛедянном Шипе> нанимают отважных героев и щедро им платят за работу. Почему бы и вам не попробовать у них подзаработать? Я напишу Вам рекомендательное письмо <bНане>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 402)
	MisBeginCondition(NoMission, 402)
	MisBeginAction(AddMission, 402)
	MisCancelAction(ClearMission, 402)
		
	MisNeed(MIS_NEED_DESP, " Ищите Бабушку в (798, 369).")
	
	MisHelpTalk( " Пожалуйста ищите Бабушку как можно скорее. Она, больна, и заставлять старых людей ждать не хорошо.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 405, "Исследование Тундры ", 402, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Я не сомневаюсь в Ваших способностях так как Вас послал сам <bПиттер> ко мне.<n><t>Вы должены быть благодарны ему за его рекомендацию.")
	MisResultCondition(NoRecord, 402)
	MisResultCondition(HasMission, 402)
	MisResultAction(ClearMission, 402 )
	MisResultAction(SetRecord, 402 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 406, "в Пустыню!", 403 )---в Пустыню
	
	MisBeginTalk( "<t>Привет! Я не встречал ещё героев таких как Вы.<n><t>Монстры в округе Ледыни для Вас уже не соперники. Если Вам интересно, я могу рекомендовать Вас <bКавайскому> в <pОазисе>, ему как раз нужны храбрые герои." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 403)
	MisBeginCondition(NoMission, 403)
	MisBeginAction(AddMission, 403)
	MisCancelAction(ClearMission, 403)
		
	MisNeed(MIS_NEED_DESP, " Отправляйтесь к <bКовайскому> в Оазис (779, 3098)")
	
	MisHelpTalk(" Не бойтесь Ковайского, он дружелюбный.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 407, "в Пустыню!", 403, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t> Я не откажусь от Вашей помощи. Я Вам дам задание, это задание для настоящих героев!")
	MisResultCondition(NoRecord, 403)
	MisResultCondition(HasMission, 403)
	MisResultAction(ClearMission, 403 )
	MisResultAction(SetRecord, 403 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 408, "Приглашение в Аскарон ", 404 )
	
	MisBeginTalk( "<t>Послушайте меня. Ледынь очень холодный город, Вы запросто заболеете. <n> <t> Люди из <pШахт> просили помощи у меня. <n> <t>, Если Вы не против, можете отравиться в солнечный Аргент на поиски <bКентаро>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 404)
	MisBeginCondition(NoMission, 404)
	MisBeginAction(AddMission, 404)
	MisCancelAction(ClearMission, 404)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с <bКетаро> (1894, 2798)")
	
	MisHelpTalk(" Отправляйтесь в Аргент в шахты и поговорите с Кентаро!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 409, "Приглашение в Аскарон ", 404, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Я верю в Вас, с тех пор как Вас направил ко мне <bПитерр>.")
	MisResultCondition(NoRecord, 404)
	MisResultCondition(HasMission, 404)
	MisResultAction(ClearMission, 404 )
	MisResultAction(SetRecord, 404 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 410, "Отзвуки Гром-Града ", 405 )
	
	MisBeginTalk( "<t>Эй! Вы во время.<n><t><bДжернис> в беде в <pЛедяном шипе> ей необходима ваша помощь.<n><t> Отправляйтесь скорее и помогите ей." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 405)
	MisBeginCondition(NoMission, 405)
	MisBeginAction(AddMission, 405)
	MisCancelAction(ClearMission, 405)
		
	MisNeed(MIS_NEED_DESP, " Отыщите Джернис в (803,352)")
	
	MisHelpTalk(" Пока Вы тут занимаетесь ерундой, Джернис может погибнуть.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 411, "Отзвуки Гром-Града ", 405, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Я в Вас верю так как Вас рекомендовал <bОдессис>.<n><t>Не уходите далеко, похоже у меня есть для Вас задание.")
	MisResultCondition(NoRecord, 405)
	MisResultCondition(HasMission, 405 )
	MisResultAction(ClearMission, 405 )
	MisResultAction(SetRecord, 405 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 412, "Торговые поставки ", 406 )
	
	MisBeginTalk( "<t>Привет, мне нужна Ваша помощь. Я отвечаю за поставку товара в <pОазис>. Однако здешние волки совсем страх потеряли и нападают на всех среди белого дня. Не моли ли бы Вы попросить <bМаркуса> в Оазисе, что бы он мне рассказал о другом пути?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 406)
	MisBeginCondition(NoMission, 406)
	MisBeginAction(AddMission, 406)
	MisCancelAction(ClearMission, 406)
		
	MisNeed(MIS_NEED_DESP, " Найти <pМаркуса> (789, 3112)")
	
	MisHelpTalk(" Вы ещё тут? Отправляйтесь на поиски Маркуса в Оазис.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 413, "Торговые поставки ", 406, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Большое спасибо! Без этих поставок, мы не дожили бы до следующей недели.")
	MisResultCondition(NoRecord, 406)
	MisResultCondition(HasMission, 406 )
	MisResultAction(ClearMission, 406 )
	MisResultAction(SetRecord, 406 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 414, "Рекрут воина ", 407 )
	
	MisBeginTalk( "<t>Послушайте друг. Шайтан - пыльный город, и не стоит в нём долго находиться, пыль вредна для здаровья. <n> <t> <pШахтёры> просили помочь меня. <n> <t>, Отправляйтесь в солнечный Аргент и помогите  <bКентаро>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 407)
	MisBeginCondition(NoMission, 407)
	MisBeginAction(AddMission, 407)
	MisCancelAction(ClearMission, 407)
		
	MisNeed(MIS_NEED_DESP, " Отыщите Кентаро у Шахт (1894, 2798)")
	
	MisHelpTalk( " Вы не нашли Кентаро? Отправляйтесь в Шахты и найдите его!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 415, "Рекрут воина ", 407, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>О! Вы от <bРезлины>. В последнее время он ведёт себя очеь странно.<n><t>Но так как Вы - здесь... хорошо...")
	MisResultCondition(NoRecord, 407)
	MisResultCondition(HasMission, 407 )
	MisResultAction(ClearMission, 407 )
	MisResultAction(SetRecord, 407 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 416, "Последователи Аши ", 408 )
	
	MisBeginTalk( "<t>Выкак раз вовремя!<n><t>Мой хороший друг, <bГрени Донг>, переехал  в <pЛедяной Шип> 10 лет назад. Однако, суровые морозы его не щадят.<n><t>Отправляйтесь к нему и передайте моё благословление." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 408)
	MisBeginCondition(NoMission, 408)
	MisBeginAction(AddMission, 408)
	MisCancelAction(ClearMission, 408)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Грени Донг в (795,363)")
	
	MisHelpTalk(" Ну что же Вы? Отправляйтесь в Ледынь к Грени Донг!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 417, "Последователи Аши ", 408, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Спасибо Вам большое, это благословление дало мне сил!")
	MisResultCondition(NoRecord, 408)
	MisResultCondition(HasMission, 408 )
	MisResultAction(ClearMission, 408 )
	MisResultAction(SetRecord, 408 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 418, "Исследования Джунглей ", 409 )
	
	MisBeginTalk( "<t>Привет, я вижу Вы не равнодушны к путишествиям.<n><t>Но тут не место для путешественников. Отыщите <pДариана> в <pРоще Акаций>. У неё есть для Вас пару заданий." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 409)
	MisBeginCondition(NoMission, 409)
	MisBeginAction(AddMission, 409)
	MisCancelAction(ClearMission, 409)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с <pДарианой> в(1535,3071)")
	
	MisHelpTalk(" Отправляйтесь в Рощу Акаций!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 419, "Исследования Джунглей", 409, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вас порекомендовала <bВеннона>, думаю я смогу найти для Вас работу.")
	MisResultCondition(NoRecord, 409)
	MisResultCondition(HasMission, 409 )
	MisResultAction(ClearMission, 409 )
	MisResultAction(SetRecord, 409 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)



	DefineMission( 420, "Путешествие на Восток", 410 )
	
	MisBeginTalk( "<t>Эй, я Вас знаю.<n><t>О Вас уже ходят легенды. Эта деревенка маловата для человека Вашего уровня.<n><t>Ищите <bСолари> он сможет Вам найти задание." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 410)
	MisBeginCondition(NoMission, 410)
	MisBeginAction(AddMission, 410)
	MisCancelAction(ClearMission, 410)
		
	MisNeed(MIS_NEED_DESP, " Ищите <bСолари> в (1202, 3179)")
	
	MisHelpTalk(" Так дело не пойдёт! Отправляйтесь на поиски!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 421, "Путешествие на Восток", 410, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Ох, Я слышал о Вас. <bМаркус> Мог бы служить в разведке.<n><t>Не уходите далеко, возможно у меня будет для Вас пручение.")
	MisResultCondition(NoRecord, 410)
	MisResultCondition(HasMission, 410 )
	MisResultAction(ClearMission, 410 )
	MisResultAction(SetRecord, 410 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 422, "В поисках телохранителя ", 411 )
	
	MisBeginTalk( "<t>Привет! Вы выглядите раздражительным, может Вы не можете найти для себя противника по силе? Позвольте познакомить Вас с  <bЮлкаром> в <pАтлантисе>.<n><t>У него есть хорошая работа для Вас, не упустите этот шанс!" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 411)
	MisBeginCondition(NoMission, 411)
	MisBeginAction(AddMission, 411)
	MisCancelAction(ClearMission, 411)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с Улкаром (1059, 661)")
	
	MisHelpTalk( " Отправляйтесь в Антлантис, Юлкар не будет долго ждать!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 423, "В поисках телохранителя ", 411, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Так как Вас рекомендовал <bХей Хей>, то я дам Вам поручение.")
	MisResultCondition(NoRecord, 411)
	MisResultCondition(HasMission, 411 )
	MisResultAction(ClearMission, 411 )
	MisResultAction(SetRecord, 411 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 424, "Лесные исследования ", 412 )
	
	MisBeginTalk( "<t>Привет! я вижу Вы лубите приключения.<n><t>Но тут Вам его не найти.<n><t>Предлогаю <pРощи Акаций>. Там Вы сможите найти <bАлександра> у него то точно найдётся не лёгкое поручение для Вас." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 412)
	MisBeginCondition(NoMission, 412)
	MisBeginAction(AddMission, 412)
	MisCancelAction(ClearMission, 412)
		
	MisNeed(MIS_NEED_DESP, " Ищите Александра в (1526,3089)")
	
	MisHelpTalk( " Отправляйтесь к Александру немедленно.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 425, "Лесные исследования ", 412, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t><bКентаро> редко кого может похвалить.<n><t>И если он Вас похвалил, значит Вы это действительно заслужили.")
	MisResultCondition(NoRecord, 412)
	MisResultCondition(HasMission, 412 )
	MisResultAction(ClearMission, 412 )
	MisResultAction(SetRecord, 412 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 426, "Опасные времена ", 413 )
	
	MisBeginTalk( "<t>Привет, у меня есть для Вас просьба, <bСолару>, был тяжело ранен бандитами несколько дней назад, пока искал сокровища. Теперь он в  <pРоще Акаций> проходит курс лечения.<n><t>К сожалению я не могу к нему съездить в гости, не могли бы Вы навестить его от моего имени?" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 413)
	MisBeginCondition(NoMission, 413)
	MisBeginAction(AddMission, 413)
	MisCancelAction(ClearMission, 413)
		
	MisNeed(MIS_NEED_DESP, " Навестить Солара (1202,3179)")
	
	MisHelpTalk( " Отправляйтесь в Рощу Акаций к моему другу!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 427, "Опасные времена ", 413, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Привет! Значит обо мне не забыли! Не волнуйтесь за меня, через пару дней я буду опять полон сил.<n><t>Спасибо за заботу!")
	MisResultCondition(NoRecord, 413)
	MisResultCondition(HasMission, 413 )
	MisResultAction(ClearMission, 413 )
	MisResultAction(SetRecord, 413 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 428, "Подмога для Атлантис ", 414 )
	
	MisBeginTalk( "<t>Привет. Вся наша деревня Вам очень благодарна за всё что Вы для нас сделали.<n><t>Однако в <pАтлантисе> Вы могли бы помоч больше местным жителям.<n><t>Найдите <bЦуби>, помогите ему!" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 414)
	MisBeginCondition(NoMission, 414)
	MisBeginAction(AddMission, 414)
	MisCancelAction(ClearMission, 414)
		
	MisNeed(MIS_NEED_DESP, " Искать Цуби (1037, 671)")
	
	MisHelpTalk(" Жители Атлантиса нуждаются в Вас! n><t>Не теряйте зря время.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 429, "Подмога для Атлантис ", 414, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Привет! Как хорошо что Вы приехали.<n><t>Не уходите далеко, у меня есть пару заданий для Вас!")
	MisResultCondition(NoRecord, 414)
	MisResultCondition(HasMission, 414 )
	MisResultAction(ClearMission, 414 )
	MisResultAction(SetRecord, 414 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 430, "Пробуждение ", 415 )
	
	MisBeginTalk( "<t>Если Вы тут и дальше будите террорезировать местных зверей и жителей то навлекёте на себя беду.<n><t>Почему бы Вам не отправиться в настоящее путишествие, полное риском и опасностью? Мой ученик, <bАлександрис>, в настоящее время живёт в <pРОще Акаций>.<n><t>Отправляйтесь к нему и скажите что Вы от меня, он найдёт для Вас задания." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 415)
	MisBeginCondition(NoMission, 415)
	MisBeginAction(AddMission, 415)
	MisCancelAction(ClearMission, 415)
		
	MisNeed(MIS_NEED_DESP, " Найти Александриса в роще Акаций (1526,3089)")
	
	MisHelpTalk(" Я ещё раз повторяю, Хватит террорезировать местную округу! отправляйтесь в Рощу Акаций!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 431, "Пробуждение ", 415, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>О! Вас послал ко мне сам Учитель? Чувствуйте себя тут как дома.")
	MisResultCondition(NoRecord, 415)
	MisResultCondition(HasMission, 415 )
	MisResultAction(ClearMission, 415 )
	MisResultAction(SetRecord, 415 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)



	DefineMission( 432, "Исследования пустыни ", 416 )
	
	MisBeginTalk( "<t>Я знаю что Вы отважный герой, но Вам тут нечего делать. Отправляйтесь в <pРощу Акаций> и отыщите <bМомо>. <n> <t> Там Вам найдут приминение." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 416)
	MisBeginCondition(NoMission, 416)
	MisBeginAction(AddMission, 416)
	MisCancelAction(ClearMission, 416)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с Момо (1209, 3196)" )
	
	MisHelpTalk( " Что? Вы ещё тут? Момо не будет долго ждать Вас!" )
	MisResultCondition(AlwaysFailure )


	DefineMission( 433, "Исследования пустыни ", 416, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Если даже и сама <bНана> Вас ко мне направила это ещё не значит, что я буду кланиться к Вам в ноги, Вам прийдёться доказать мне, что Вы и есть тот самый лигендарный герой!")
	MisResultCondition(NoRecord, 416)
	MisResultCondition(HasMission, 416 )
	MisResultAction(ClearMission, 416 )
	MisResultAction(SetRecord, 416 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 434, "Путешествие на Юг ", 417 )
	
	MisBeginTalk( "<t>Если Вы тут и дальше будите террорезировать местных зверей и жителей то навлекёте на себя беду.<n><t>Почему бы Вам не отправиться в настоящее путишествие, полное риском и опасностью? Мой ученик, <bКасардис>, в настоящее время живёт в <pАтлантике>.<n><t>Отправляйтесь к нему и скажите что Вы от меня, он найдёт для Вас задания." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 417)
	MisBeginCondition(NoMission, 417)
	MisBeginAction(AddMission, 417)
	MisCancelAction(ClearMission, 417)
		
	MisNeed(MIS_NEED_DESP, " Ищите Касардиса (1028, 649)")
	
	MisHelpTalk(" Идите же и отыщите Касардиса.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 435, "Путешествие на Юг ", 417, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Ох, не ухадите делако, Позвольте, по моему я смогу найти для Вас работу.")
	MisResultCondition(NoRecord, 417)
	MisResultCondition(HasMission, 417 )
	MisResultAction(ClearMission, 417 )
	MisResultAction(SetRecord, 417 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 436, "Мечта о Море ", 418 )
	
	MisBeginTalk( "<t>О! Мой юный пират, не говорите мне что Вы всё знаете и умеете!?<n><t>Отправляйтесь в <pАргент> к <bАлине>. Она поможет Вам обуздать морскую стихию." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 418)
	MisCancelAction(ClearMission, 418)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Алиной (2247,2858)")
	
	MisHelpTalk( " Алина живёт в Аргенте, отправляйтесь туда и поговорите с ней.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 437, "Мечта о Море ", 418, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Не волнуйтесь, я обучу Вас хитростям морских пиратов!!" )
	MisResultCondition(NoRecord, 418)
	MisResultCondition(HasMission, 418 )
	MisResultAction(ClearMission, 418 )
	MisResultAction(SetRecord, 418 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 438, "Новый набор во Флот!", 419 )
	
	MisBeginTalk( "<t>Вы раньше не были в море? Может уже самое время.<n><t>Позвольте направить Вас в  <pАргент> к <bАлине>. Она обучит Вас морским хитростям." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 419)
	MisCancelAction(ClearMission, 419)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Алиной (2247,2858)")
	
	MisHelpTalk( " Алина живёт в Аргенте, отправляйтесь туда и поговорите с ней." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 439, "Новый набор во Флот!", 419, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Не волнуйтесь, я обучу Вас хитростям морских пиратов!!" )
	MisResultCondition(NoRecord, 419)
	MisResultCondition(HasMission, 419 )
	MisResultAction(ClearMission, 419 )
	MisResultAction(SetRecord, 419 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 440, "Управление ВМС ", 420 )
	
	MisBeginTalk( "<t>Вы раньше не были в море? Может уже самое время. <n> <t> Позвольте направить Вас в  <pАргент> к <bАлине>. Она обучит Вас морским хитростям." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 420)
	MisCancelAction(ClearMission, 420)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с Алиной (2247,2858)")
	
	MisHelpTalk( " Алина живёт в Аргенте, отправляйтесь туда и поговорите с ней." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 441, "Управление ВМС ", 420, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Не волнуйтесь, я обучу Вас хитростям морских пиратов!!" )
	MisResultCondition(NoRecord, 420)
	MisResultCondition(HasMission, 420 )
	MisResultAction(ClearMission, 420 )
	MisResultAction(SetRecord, 420 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 442, "Прекрасный мир торговца ", 421 )
	
	MisBeginTalk( "<t>Наконецто, Вы прибыли! Мы дружим с <bТорговцем Тайны>. Я слышал он ищет учиника, и хочет передать все знания морской торговли.<n><t>Если Вы хотите научиться морской торговле отправляйтесь к нему немедленно." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 421)
	MisCancelAction(ClearMission, 421)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Торговцем Тайны (2331, 2821)")
	
	MisHelpTalk( " Отправляйетесь в Аргент и поговорите с торговцем.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 443, "Прекрасный мир торговца ", 421, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вы! Вы хотите стать лучшим торговцем?<n><t>Отлично, Вы тот кто мне нужен.")
	MisResultCondition(NoRecord, 421)
	MisResultCondition(HasMission, 421 )
	MisResultAction(ClearMission, 421 )
	MisResultAction(SetRecord, 421 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 444, "Торговый центр Аскарона ", 422 )
	
	MisBeginTalk( "<t>Наконецто, Вы прибыли! Мы дружим с <bТорговцем Тайны>. Я слышал он ищет учиника, и хочет передать все знания морской торговли.<n><t>Если Вы хотите научиться морской торговле отправляйтесь к нему немедленно." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 422)
	MisCancelAction(ClearMission, 422)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Торговцем Тайны (2331, 2821)")
	
	MisHelpTalk( " Отправляйетесь в Аргент и поговорите с торговцем.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 445, "Торговый центр Аскарона ", 422, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вы! Вы хотите стать лучшим торговцем?<n><t>Отлично, Вы тот кто мне нужен.")
	MisResultCondition(NoRecord, 422)
	MisResultCondition(HasMission, 422 )
	MisResultAction(ClearMission, 422 )
	MisResultAction(SetRecord, 422 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)



	DefineMission( 446, "Морская торговля ", 423 )
	
	MisBeginTalk( "<t>Наконецто, Вы прибыли! Мы дружим с <bТорговцем Тайны>. Я слышал он ищет учиника, и хочет передать все знания морской торговли.<n><t>Если Вы хотите научиться морской торговле отправляйтесь к нему немедленно." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 423)
	MisCancelAction(ClearMission, 423)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Торговцем Тайны (2331, 2821)")
	
	MisHelpTalk( " Отправляйетесь в Аргент и поговорите с торговцем.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 447, "Морская торговля ", 423, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вы! Вы хотите стать лучшим торговцем?<n><t>Отлично, Вы тот кто мне нужен.")
	MisResultCondition(NoRecord, 423)
	MisResultCondition(HasMission, 423 )
	MisResultAction(ClearMission, 423 )
	MisResultAction(SetRecord, 423 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 448, "Засада мечника ", 424 )
	
	MisBeginTalk( "<t>О дорогой!<n><t>Даже <bКентаро>, не смотря на его опыт был ранен монстром в <pШахтах>.<n><t>Навестите его, и узнайте, как он поживает?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 424)
	MisBeginCondition(NoMission, 424)
	MisBeginAction(AddMission, 424)
	MisCancelAction(ClearMission, 424)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Кентаро (1894, 2798)")
	
	MisHelpTalk( " Навестите Кентаро, Прошу Вас." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 449, "Засада мечника ", 424, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Я отвлёкся всего лишь на минуту, как меня тут же ранили эти ужасные монстры. <n> <t> Ну ни чего, я уже выздоравливаю.")
	MisResultCondition(NoRecord, 424)
	MisResultCondition(HasMission, 424 )
	MisResultAction(ClearMission, 424 )
	MisResultAction(SetRecord, 424 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 450, "Обход ", 425)
	
	MisBeginTalk( "<t>Ужасные существа поджидают своих жертв на пути через <pАндийский Лес> к <pВалагале>. Не каждый осмелиться на такое путешествие.<n><t>Однако Вы похожи на того смельчака, который сможет бросить вызов монстрам. Сжальтесь над бедной старушкой, помогите, передайте моему внуку  <bВаллау> моё послание!<n><t>Передайте ему что бы он навестил меня." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 425)
	MisBeginCondition(NoMission, 425)
	MisBeginAction(AddMission, 425)
	MisCancelAction(ClearMission, 425)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Валли (1136, 2778)" )
	
	MisHelpTalk( "Отправляйтесь в Валагалу." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 451, "Обход " , 425, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вы от моей бабули? Я навещу её обязательно.")
	MisResultCondition(NoRecord, 425)
	MisResultCondition(HasMission, 425 )
	MisResultAction(ClearMission, 425 )
	MisResultAction(SetRecord, 425 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 452, "Тайна ", 426)
	
	MisBeginTalk( "<t><pЛедынь> Это великий город. Хотя рельеф города не очень благоприятный.<n><t>В близи города поселились монстры, и ходят слухи о пропажах лудей. <bМас>, Мэр <pЛедыни> я бы сам ему рассказал о произходящем, но увы не то уже здоровье что бы путешествовать.<n><t>Может Вы поговорите с мэром?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 426)
	MisBeginCondition(NoMission, 426)
	MisBeginAction(AddMission, 426)
	MisCancelAction(ClearMission, 426)
		
	MisNeed(MIS_NEED_DESP, " Рассказать о пропажах людей мэру Ледыни (1346, 451)")
	
	MisHelpTalk( " Отправляйтесь к мэру, пока ещё кто нибуть не пострадал." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 453, "Тайна ", 426, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>О, Так как Валла не может сделать это, я найду других людей.<n><t>Спасибо за то, что передали письмо." )
	MisResultCondition(NoRecord, 426)
	MisResultCondition(HasMission, 426 )
	MisResultAction(ClearMission, 426 )
	MisResultAction(SetRecord, 426 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 454, "Иследование Шахт ", 427)
	
	MisBeginTalk( "<t>Из-за вековой горной промышленности, я оставил Серебрянный.<n><t>Много монстров обитает в Шахтах.<n><t>Навестите <bГрега> в <pШахтах>. возможно там требуется Ваша помощь." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 427)
	MisBeginCondition(NoMission, 427)
	MisBeginAction(AddMission, 427)
	MisCancelAction(ClearMission, 427)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с Грегом (1883, 2805)")
	
	MisHelpTalk( " Отправляйтесь в Серебряный в Шахты!" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 455, "Иследование Шахт ", 427, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Я верю в Вас, с тех пор как <bПиттер> направил Вас.<n><t>Вы должны быть благодарны своему учителю.")
	MisResultCondition(NoRecord, 427)
	MisResultCondition(HasMission, 427 )
	MisResultAction(ClearMission, 427 )
	MisResultAction(SetRecord, 427 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 456, "Кризис ", 428 )
	
	MisBeginTalk( "<t>Что Вас так задержало?!<n><t>Мое дорогое детя <bВалло> исследует <pВалагалу>. Однако, он потерял провизию и мед препораты пока добирался до Валагалы. <n> <t> Не отнесёте ли Вы ему эти припораты и провизию?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 428)
	MisBeginCondition(NoMission, 428)
	MisBeginAction(AddMission, 428)
	MisCancelAction(ClearMission, 428)
		
	MisNeed(MIS_NEED_DESP, " Отправиться в Валагалу и передать посылку Валло (1136, 2778)" )
	
	MisHelpTalk( "Вы мне поможете или нет?" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 457, "Кризис ", 428, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Вода... Вода... Ах... Я чувствую себя лучше.<n><t>Спасибо! Я встану на ноги после небольшого сна.")
	MisResultCondition(NoRecord, 428)
	MisResultCondition(HasMission, 428 )
	MisResultAction(ClearMission, 428 )
	MisResultAction(SetRecord, 428 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 458, "Тайна ", 429 )
	
	MisBeginTalk( "<t>Эй, я нашел карту замка Ледыни, исследуя древние тома.<n><t>Председатель Ледыни, <bРеуно> Будет рад узнав об этом. Не передадите ему о моей находке?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 429)
	MisBeginCondition(NoMission, 429)
	MisBeginAction(AddMission, 429)
	MisCancelAction(ClearMission, 429)
		
	MisNeed(MIS_NEED_DESP, " Отправляйтесь в (1294, 498)")
	
	MisHelpTalk(" Пожалуйсто поторопитесь, это великая находка!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 459, "Тайна ", 429, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Это великолепно, это великая находка, спасибо что сообщили мне об этом!")
	MisResultCondition(NoRecord, 429)
	MisResultCondition(HasMission, 429 )
	MisResultAction(ClearMission, 429 )
	MisResultAction(SetRecord, 429 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 460, "Тайна Шахт ", 430)
	
	MisBeginTalk( "<t>Из-за вековой горной промышленности, я оставил Серебрянный.<n><t>Много монстров обитает в Шахтах.<n><t>Навестите <bГрега> в <pШахтах>. возможно там требуется Ваша помощь." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 430)
	MisBeginCondition(NoMission, 430)
	MisBeginAction(AddMission, 430)
	MisCancelAction(ClearMission, 430)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Грегом (1883, 2805)")
	
	MisHelpTalk( " Отправляйтесь в Шахты Серебрянного города!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 461, "Тайна Шахт", 430, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Ну и что что Вас порекомендовал <bДариан>? Мне что? Падать к Вашим ногам? Докажите мне что Вы Герой, а то у меня складывается впечатление что Вы просто ляля заблудившаяся в парке.")
	MisResultCondition(NoRecord, 430)
	MisResultCondition(HasMission, 430 )
	MisResultAction(ClearMission, 430 )
	MisResultAction(SetRecord, 430 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 462, "Поиск талантов ", 431)
	
	MisBeginTalk( "<t>Привет. Мой друг, <bГвидериус> ищет надежного человека, чтобы помочь ему в <pВалагале>. Он попросил меня найти этого человека.<n><t>И я по хоже нашёл, этот человек Вы!" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 431)
	MisBeginCondition(NoMission, 431)
	MisBeginAction(AddMission, 431)
	MisCancelAction(ClearMission, 431)
		
	MisNeed(MIS_NEED_DESP, " Поговорите с <bГвидериус> в (1123, 2766)")
	
	MisHelpTalk( " Не разачеровывайте меня!" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 463, "Поиск талантов ", 431, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Так как Вас направил ко мне Юлкар, я верю в Вас!<n><t>И у меня есть для Вас особые поручения.")
	MisResultCondition(NoRecord, 431)
	MisResultCondition(HasMission, 431 )
	MisResultAction(ClearMission, 431 )
	MisResultAction(SetRecord, 431 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 464, "Исследование ", 432 )
	
	MisBeginTalk( "<t>Друг мой, эти монстры уже не для Вас. Почему бы Вам не отправиться в <pЛедынь>? <n> <t> Мэр Ледыни, <bРеуне>, как раз ищет героев, для борьбы с монстрами.<n><t>Если Вы желаете, я могу написать Вам рекомендацию." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 432)
	MisBeginCondition(NoMission, 432)
	MisBeginAction(AddMission, 432)
	MisCancelAction(ClearMission, 432)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с мером Ледыни (1294, 498)")
	
	MisHelpTalk(" Отправляйтесь в Ледыню и поговорите с Мэром!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 465, "Исследование ", 432, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>И что, что из того что Вас порекомендовала  <bЦуби>? Да хоть Папа Римский! Пока я сам не удостоверюсь в Ваших силах мне чхать на других мнени и рекомендации.")
	MisResultCondition(NoRecord, 432)
	MisResultCondition(HasMission, 432 )
	MisResultAction(ClearMission, 432 )
	MisResultAction(SetRecord, 432 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 466, "Встреча ", 433 )
	
	MisBeginTalk( "<t>О Великие Боги! Мой друг, <bХохо> сумел избежать смерти после глубокого ранения катаны <rВойна Скелета>.<n><t>Я бы и сам посетил его, но злые монстры  <pБерега скелетов> не пускают меня.<n><t>Пожалуйста навестите моего друга." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 433)
	MisBeginCondition(NoMission, 433)
	MisBeginAction(AddMission, 433)
	MisCancelAction(ClearMission, 433)
		
	MisNeed(MIS_NEED_DESP, " Навестить <rХохо> (2142, 556)")
	
	MisHelpTalk("Пожалуйста отправляйтесь на Берег Скелетов!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 467, "Встреча ", 433, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Большое спасибо! Мои друзья боятся здешних мест и я стал одинок с тех пор как переехал сюда.")
	MisResultCondition(NoRecord, 433)
	MisResultCondition(HasMission, 433 )
	MisResultAction(ClearMission, 433 )
	MisResultAction(SetRecord, 433 )
	MisResultAction(AddExp, 3500, 3500)
	MisResultAction(AddMoney, 1000, 1000)

	DefineMission( 468, "Восточный Учитель ", 434 )
	
	MisBeginTalk( "<t>Дорогой путешественник! Я искал моего учителя, <bМастера Керро>, многие годы, но напрасно. Недавно, я услышал, что она двигалась в <pЛедяной шип>. <n> <t>, Если Вы её встретите передайте ей что я нашёл \"Сердце желания \"?" )
	MisBeginCondition( LvCheck, ">", 39 )
	MisBeginCondition(NoRecord, 434)
	MisBeginCondition(NoMission, 434)
	MisBeginAction(AddMission, 434)
	MisCancelAction(ClearMission, 434)
		
	MisNeed(MIS_NEED_DESP, " Поговорить с Керрой (2664, 654)")
	
	MisHelpTalk( " Скажите учительнице в Ледяном Шипе что я нашёл то что искал.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 469, "Восточный Учитель ", 434, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Сасибо что навестили старую женщину. Так Вы говорите мой любимый ученик всё таки добился чего хотел?!")
	MisResultCondition(NoRecord, 434)
	MisResultCondition(HasMission, 434 )
	MisResultAction(ClearMission, 434 )
	MisResultAction(SetRecord, 434 )
	MisResultAction(AddExp, 6000, 6000)	
	MisResultAction(AddMoney, 1000, 1000)


	DefineMission( 470, "Изменение профессии ", 435 )
	
	MisBeginTalk( "<t>О дорогой! Вы можете выручить меня? Моя сестра, <bДоктор-Чиво>. Недавно, она отправилась в <pХолдею>, Я не могу её навестить, это так далеко! <n> <t> Может Вы её навестите от моего имени?" )
	MisBeginCondition( LvCheck, ">", 44 )
	MisBeginCondition(NoRecord, 435)
	MisBeginCondition(NoMission, 435)
	MisBeginAction(AddMission, 435)
	MisCancelAction(ClearMission, 435)
		
	MisNeed(MIS_NEED_DESP, " Навестить Доктора-Чиво (630, 2091)")
	
	MisHelpTalk( " Навестите Доктора-Чиво в Холдейском оплоте." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 471, "Изменение профессии ", 435, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Ха-ха-ха! Мой Братишка любит совать свой нос куда попало. Мне очень нарвется тут жить.")
	MisResultCondition(NoRecord, 435)
	MisResultCondition(HasMission, 435 )
	MisResultAction(ClearMission, 435 )
	MisResultAction(SetRecord, 435 )
	MisResultAction(AddExp, 10000, 10000)	
	MisResultAction(AddMoney, 1100, 1100)


	DefineMission( 472, "Флот Гром-Града ", 436 )
	
	MisBeginTalk( "<t>Я слышал, что <pГром-Град> нуждается в рабочей силе.<n><t>Я могу порекомендовать Вас копитану охраны <bМаллоку>, если Вы не против." )
	MisBeginCondition( LvCheck, ">", 49 )
	MisBeginCondition(NoRecord, 436)
	MisBeginCondition(NoMission, 436)
	MisBeginAction(AddMission, 436)
	MisCancelAction(ClearMission, 436)
		
	MisNeed(MIS_NEED_DESP, " Отправляйтесь в Гром-Град (706, 1465)")
	
	MisHelpTalk( " Не теряйте время даром, идите в Гром-Град." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 473, "Флот Гром-Града ", 436, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Привет, Вы тут не на долго?<n><t>Хорошо, но соблюдайте правила нашего города.")
	MisResultCondition(NoRecord, 436)
	MisResultCondition(HasMission, 436 )
	MisResultAction(ClearMission, 436 )
	MisResultAction(SetRecord, 436 )
	MisResultAction(AddExp, 16000, 16000)
	MisResultAction(AddMoney, 1200, 1200)


	DefineMission( 474, "Глубокий глубокий лес ", 437)
	
	MisBeginTalk( "<t>Страшный лес Аскарона, там обитают злые туземцы.<n><t>Не могли бы Вы навестить моего друга в <pОбители радости>?" )
	MisBeginCondition( LvCheck, ">", 54 )
	MisBeginCondition(NoRecord, 437)
	MisBeginCondition(NoMission, 437)
	MisBeginAction(AddMission, 437)
	MisCancelAction(ClearMission, 437)
		
	MisNeed(MIS_NEED_DESP, " Отправляйтесь в точку (529, 2458)")
	
	MisHelpTalk( " Спасибо мой друг, но вам всё же стоит поторопиться в Обитель Радости.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 475, "Глубокий глубокий лес ", 437, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>Спасибо за заботу. Я даже не думал, что Сонни все еще помнит меня спустя стольких лет.")
	MisResultCondition(NoRecord, 437)
	MisResultCondition(HasMission, 437 )
	MisResultAction(ClearMission, 437 )
	MisResultAction(SetRecord, 437 )
	MisResultAction(AddExp, 25000, 25000)
	MisResultAction(AddMoney, 1300, 1300)




----------------------------------------
--                                    --
--        Жалоба Командующего         --
--                                    --
----------------------------------------


	DefineMission(476, "Жалоба Командующего ", 438 )

	MisBeginTalk( "<t>Морской Командующий Гром-Града только что послал за мной.<n><t>Однако я не могу ехать один. Может Вы за меня съездите?<n><t>Но не забудьте вернуться ко мне и рассказать как съездили.")
	MisBeginCondition(NoRecord, 438)
	MisBeginCondition(NoMission,438)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 438)
	MisCancelAction(ClearMission, 438)
	MisHelpTalk( "<t> Вы поторопитесь всё таки, если согласились помочь!" )

	MisNeed(MIS_NEED_DESP, " Съездите к Главнокомандующему вместо Веленгтона ")

	MisResultCondition(AlwaysFailure)

	DefineMission( 477,"Жалоба Командующего ", 438, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>Жаль что Веленгтон не смог сам приехать. Ну не берите в голову.")

	MisResultCondition(HasMission, 438)
	MisResultCondition(NoRecord, 438)
	MisResultCondition(HasNavyGuild)

	MisResultAction(ClearMission, 438)
	MisResultAction(SetRecord, 438)

	
	DefineMission(478, "Секрет для Командующего ", 439 )

	MisBeginTalk( "<t>Так как Веленгтон не смог приехать, пожалуйста передайте это письмо ему.<n><t>И будьте осторожны. Это письмо очень важное!")
	MisBeginCondition(HasRecord, 438)
	MisBeginCondition(NoRecord, 439)
	MisBeginCondition(NoMission,439)
	MisBeginCondition(HasNavyGuild)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 439)
	MisBeginAction(GiveItem, 2430, 1, 4)
	MisCancelAction(ClearMission, 439)
	MisHelpTalk( "<t> Пожалуйста поспешите!" )
	MisNeed(MIS_NEED_DESP, " Вернитесь к Веленгтону." )

	MisResultCondition(AlwaysFailure)


	DefineMission( 479, "Секрет для Командующего ", 439, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>Это командующий просил Вас передать письмо? (Задумался).<n><t>Отдохни боец, у нас ещё не выполненная миссия.")

	MisResultCondition(HasMission, 439)
	MisResultCondition(NoRecord, 439)

	MisResultCondition(HasItem, 2430,1 )
	MisResultCondition(HasNavyGuild)

	MisResultAction(ClearMission, 439)
	MisResultAction(TakeItem, 2430,1 )
	MisResultAction(SetRecord, 439)
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 25000, 25000)



	DefineMission(480, "Оружие флота ", 440 )

	MisBeginTalk( "<t>Вы готовы? Слушайте внимательно тогда.<n><t>От имени главнокомандующего флотом имени королевы приказываю, убитьМёртвую душу и принести мне в докозательство <r5 Души нежити>.")

	MisBeginCondition(HasRecord, 439)
	MisBeginCondition(NoMission, 440)
	MisBeginCondition(NoRecord, 440)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 440)
	MisBeginAction(AddTrigger, 4401, TE_GETITEM, 2386, 5)

	MisNeed(MIS_NEED_ITEM, 2386, 5, 10, 5)

	MisCancelAction(ClearMission, 440)
	
	MisHelpTalk( "<t> Вы уже разве принесли Души нежити!")
	
	MisResultTalk( "<t> Не так и плохо, Вы не думали о том что бы присоедениться к флоту её величества?")

	MisResultCondition(HasMission, 440)
	MisResultCondition(NoRecord, 440)
	MisResultCondition(HasItem, 2386, 5)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem, 2386, 5)
	MisResultAction(ClearMission, 440)
	MisResultAction(SetRecord, 440)
	MisResultAction(AddExp, 250000, 250000)
	MisResultAction(AddMoney, 150000, 150000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2386)
	TriggerAction(1, AddNextFlag, 440, 10, 5)
	RegCurTrigger(4401)

	
	DefineMission( 481, "Руководство Флота ", 441 )

	MisBeginTalk( "<t>После боёв со стороной зла, силы мёртвых душ значительно ослабли. <n> <t> За время боёв мы нашли отличную тактику. Но шпионы украли наши планы и разработки тактических действий. Это оскорбление самой Королеве! <n> <t> От имени королевы приказываю! Отправляйтесь в Флот нави и сокрушите врага, так же соберите все 8 Страниц Тома. Склейте страницы в единый Том <pСупер клеем> <rКомандира мертвых душ>. <n> <t> И не идите под трибунал, жду Вас с целым томом тут. Удачи Боец!")


	MisBeginCondition(HasRecord, 440)
	MisBeginCondition(NoRecord, 441)
	MisBeginCondition(NoMission, 441)

	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 441)

	MisBeginAction(AddTrigger, 4411, TE_GETITEM, 2388, 1)--Том, страница 1
	MisBeginAction(AddTrigger, 4412, TE_GETITEM, 2389, 1)--2
	MisBeginAction(AddTrigger, 4413, TE_GETITEM, 2390, 1)--3
	MisBeginAction(AddTrigger, 4414, TE_GETITEM, 2391, 1)--4
	MisBeginAction(AddTrigger, 4415, TE_GETITEM, 2392, 1)--5
	MisBeginAction(AddTrigger, 4416, TE_GETITEM, 2393, 1)--6
	MisBeginAction(AddTrigger, 4417, TE_GETITEM, 2394, 1)--7
	MisBeginAction(AddTrigger, 4418, TE_GETITEM, 2395, 1)--Страница тома 8
	MisBeginAction(AddTrigger, 4419, TE_GETITEM, 2441, 1)--Суперклей

	MisNeed(MIS_NEED_ITEM, 2388, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2389, 1, 20, 1)
	MisNeed(MIS_NEED_ITEM, 2390, 1, 30, 1)
	MisNeed(MIS_NEED_ITEM, 2391, 1, 40, 1)
	MisNeed(MIS_NEED_ITEM, 2392, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2393, 1, 60, 1)
	MisNeed(MIS_NEED_ITEM, 2394, 1, 70, 1)
	MisNeed(MIS_NEED_ITEM, 2395, 1, 80, 1)
	MisNeed(MIS_NEED_ITEM, 2441, 1, 90, 1)

	MisCancelAction(ClearMission, 441)

	MisHelpTalk( "<t> Мы не дложны позволить нашим врагам знать наши стратегии!")
	
	MisResultTalk( "<t>Это... Это - это... Вы - действительно наш герой!<n><t>Это невероятно! Я не могу просто выразить своего восторга, я должен остыть... О право... Вы заслужили награду от самой Королевы.")

	MisResultCondition(HasMission, 441)
	MisResultCondition(NoRecord, 441)
	MisResultCondition(HasItem, 2388, 1)
	MisResultCondition(HasItem, 2389, 1)
	MisResultCondition(HasItem, 2390, 1)
	MisResultCondition(HasItem, 2391, 1)
	MisResultCondition(HasItem, 2392, 1)
	MisResultCondition(HasItem, 2393, 1)
	MisResultCondition(HasItem, 2394, 1)
	MisResultCondition(HasItem, 2395, 1)
	MisResultCondition(HasItem, 2441, 1)
	MisResultBagNeed(1)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem, 2388, 1)
	MisResultAction(TakeItem, 2389, 1)
	MisResultAction(TakeItem, 2390, 1)
	MisResultAction(TakeItem, 2391, 1)
	MisResultAction(TakeItem, 2392, 1)
	MisResultAction(TakeItem, 2393, 1)
	MisResultAction(TakeItem, 2394, 1)
	MisResultAction(TakeItem, 2395, 1)
	MisResultAction(TakeItem, 2441, 1)

	MisResultAction(ClearMission, 441)
	MisResultAction(SetRecord, 441)
	MisResultAction(AddExp, 500000, 500000)
	MisResultAction(AddMoney, 500000, 500000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2388)
	TriggerAction(1, AddNextFlag, 441, 10, 1)
	RegCurTrigger(4411)

	InitTrigger()
	TriggerCondition(1, IsItem, 2389)
	TriggerAction(1, AddNextFlag, 441, 20, 1)
	RegCurTrigger(4412)

	InitTrigger()
	TriggerCondition(1, IsItem, 2390)
	TriggerAction(1, AddNextFlag, 441, 30, 1)
	RegCurTrigger(4413)

	InitTrigger()
	TriggerCondition(1, IsItem, 2391)
	TriggerAction(1, AddNextFlag, 441, 40, 1)
	RegCurTrigger(4414)

	InitTrigger()
	TriggerCondition(1, IsItem, 2392)
	TriggerAction(1, AddNextFlag, 441, 50, 1)
	RegCurTrigger(4415)

	InitTrigger()
	TriggerCondition(1, IsItem, 2393)
	TriggerAction(1, AddNextFlag, 441, 60, 1)
	RegCurTrigger(4416)

	InitTrigger()
	TriggerCondition(1, IsItem, 2394)
	TriggerAction(1, AddNextFlag, 441, 70, 1)
	RegCurTrigger(4417)

	InitTrigger()
	TriggerCondition(1, IsItem, 2395)
	TriggerAction(1, AddNextFlag, 441, 80, 1)
	RegCurTrigger(4418)

	InitTrigger()
	TriggerCondition(1, IsItem, 2441)
	TriggerAction(1, AddNextFlag, 441, 90, 1)
	RegCurTrigger(4419)



	DefineMission( 482, "СОС ", 442 )

	MisBeginTalk( "<t>Я признаю что наш видимый враг не такой уж и слабый как мы могли подумать с самого начала, по этому я обратился за помощью к Капитану Джеку. <n> <t> Отправляйтесь к нему и передайте о военном положении, найти его можно в магическом океане. Поторопитесь.")
	MisBeginCondition(NoRecord, 442)
	MisBeginCondition(NoMission,442)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 442)
	MisCancelAction(ClearMission, 442)
	MisHelpTalk( "<t> Поторопитесь, это не терпит отлагательств!")

	MisNeed(MIS_NEED_DESP, " О как он заговорил!")

	MisResultCondition(AlwaysFailure)



	DefineMission( 483, "СОС ", 442, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>Что! Он смеет просить о помощи меня? Ха-ха-ха. Как смешно.<n><t>Отправляйтесь обратно к нему и передайте, что если он хочет от меня помощи, пусть победит меня в честном поединке!")

	MisResultCondition(HasMission, 442)
	MisResultCondition(NoRecord, 442)
	MisBeginCondition(HasPirateGuild)

	MisResultAction(ClearMission, 442)
	MisResultAction(SetRecord, 442)

	DefineMission( 484, "Джек против Джека ", 443 )

	MisBeginTalk( "<t>Это-письмо о вызове его на поединок. Отнесите его Джеку Арроу.<n><t>Скажите ему, что я буду ждать его в павильоне в полночь в полнолуние восьмого месяца.")
	MisBeginCondition(HasRecord, 442)
	MisBeginCondition(NoRecord, 443)
	MisBeginCondition(NoMission,443)
	MisBeginCondition(HasPirateGuild)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 443)

	MisCancelAction(ClearMission, 443)
	MisBeginAction(GiveItem, 2431, 1, 4)
	MisHelpTalk( "<t>Прекратите мечтать, отправляйтесь с послание немедленно!" )

	MisNeed(MIS_NEED_DESP, "Передайте Письмо Вызова Капитана Джека Джеку Арроу." )

	MisResultCondition(AlwaysFailure)



	DefineMission( 485, "Джек против Джека ", 443, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>Эх... Жаль, но нам не дождаться помощи от этого самодовольного дегенерата.<n><t>Вы устали наверно бегая просто так. Отдохните.")

	MisResultCondition(HasItem,2431,1)
	MisResultCondition(HasMission, 443)
	MisResultCondition(NoRecord, 443)
	MisResultCondition(HasPirateGuild)

	MisResultAction(ClearMission, 443)
	MisResultAction(TakeItem,2431,1)
	MisResultAction(SetRecord, 443)
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 50000, 50000)


	DefineMission( 486, "Сокровища Карибского моря ", 444 )

	MisBeginTalk( "<t>На Острове Скелетов много Душ нежити.<n><t>Души нежити нам необходимы, что бы восстановить Сердце Дэйви Джоунса.<n><t>Это даст нам большое преимущество перед нашими врагами.")

	MisBeginCondition(HasRecord, 443)
	MisBeginCondition(NoRecord, 444)
	MisBeginCondition(NoMission, 444)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 444)---гроб, собирающий души
	MisBeginAction(AddTrigger, 4441, TE_GETITEM, 2444, 1)--сердце джонса

	MisNeed(MIS_NEED_ITEM, 2444, 1, 10, 1)
	MisCancelAction(ClearMission, 444)

	MisHelpTalk( "<t>Седце Это Вы сможите добыть из гроба, собирающего души!" )

	MisResultTalk( "<t>Отлично! Я Верил в Вас." )

	MisResultCondition(NoRecord, 444)
	MisResultCondition(HasMission, 444)
	MisResultCondition(HasPirateGuild)
	MisResultCondition(HasItem,2444,1)

	MisResultAction(TakeItem, 2444, 1)
	MisResultAction(ClearMission, 444)
	MisResultAction(SetRecord, 444)

	MisResultAction(AddExp, 250000, 250000)
	MisResultAction(AddMoney, 150000, 150000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2444)
	TriggerAction(1, AddNextFlag, 444, 10, 1)
	RegCurTrigger(4441)

	
	DefineMission( 487, "Конгрегация ", 445 )

	MisBeginTalk( "<t>До меня дошли слухи о Ваших героических поступках.<n><t>Вы знаете почему армия Душ такая сильная? У меня есть предположение что это связано с тем что они собрали монеты душ. Я точно не знаю, но мне кажется что всё это не приведет ни к чему хорошему.<n><t>В можете мне принести Запачканную кровью монету и 40 золотых монет.")

	MisBeginCondition(HasRecord, 444)
	MisBeginCondition(NoRecord, 445)
	MisBeginCondition(NoMission, 445)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 445)
	MisBeginAction(AddTrigger, 4451, TE_GETITEM, 2427, 1)
	MisBeginAction(AddTrigger, 4452, TE_GETITEM, 2438, 40)
	

	MisNeed(MIS_NEED_ITEM, 2427, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2438, 40, 20, 40)
	

	MisCancelAction(ClearMission, 445)
	MisHelpTalk( "<t>Вы думаете, что если Вы тут будите стоять что ни буть изменится?" )

	MisResultTalk( "<t>О да! это то самое... (старец начинает что то петь на не понятном языке: ??????????????).<n><t>Возьмите. Я снял проклятие!")

	MisResultCondition(NoRecord, 445)
	MisResultCondition(HasMission, 445)
	MisResultCondition(HasItem, 2438, 40)
	MisResultCondition(HasItem, 2427, 1)
	MisResultCondition(HasPirateGuild)

	MisResultAction(TakeItem, 2438, 40)
	MisResultAction(TakeItem, 2427, 1)
	MisResultAction(ClearMission ,445)
	MisResultAction(SetRecord, 445)

	MisResultAction(AddExp, 500000,500000)
	MisResultAction(AddMoney, 800000, 800000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2427)
	TriggerAction(1, AddNextFlag, 445, 10, 1)
	RegCurTrigger(4451)

	InitTrigger()
	TriggerCondition(1, IsItem, 2438)
	TriggerAction(1, AddNextFlag, 445, 20, 40)
	RegCurTrigger(4452)

end
CenterMission001()

