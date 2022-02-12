print( "Loading MissionScript05.lua" )
--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
jp= JumpPage
amp=AutoMissionPage
ct=CloseTalk
am=AddMission
MissionCheck = HasFlag
mc=MissionCheck

function AreaMission001()
----------------------------Сбор сладкого мёда
	DefineMission( 600, "\209\225\238\240 \241\235\224\228\234\238\227\238 \236\191\228\224", 600 )
	
	MisBeginTalk( "<t>Как говорится в пословице: Расположи к себе лидера и ты получаешь всё остальное.<n><t>Добудьте <y5 Улей диких пчёл>, что бы расположить к себе уважение подвигами, а не разговорами о них!<n><t>(Улья весят на деревьях в Аскароне, рядом с деревьями летают пчёлы, так, что Вы сразу догадаетесь где их искать)." )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 600)
	MisBeginCondition(NoRecord, 600)
	MisBeginAction(AddMission, 600)
	MisBeginAction(AddTrigger, 6001, TE_GETITEM, 4085, 5 )	--Улей диких пчел
	MisCancelAction(ClearMission, 600)

	MisNeed(MIS_NEED_ITEM, 4085, 5, 10, 5)
		
	MisHelpTalk( "<t>Добудьте 5 Улей диких пчёл в точке (1544.3134) Аскарона и пренесите их Дуриану!" )
	MisResultTalk( "<t>Хе-хе. Вы боялись, что пчёлы Вас покусают когда Вы будете разорять их улья?" )
	MisResultCondition(NoRecord, 600)
	MisResultCondition(HasMission, 600)
	MisResultCondition(HasItem, 4085, 5)
	MisResultAction(TakeItem, 4085, 5)
	MisResultAction(ClearMission, 600)
	MisResultAction(SetRecord, 600)
	MisResultAction(AddExp, 800, 800)	-- Опыт
	MisResultAction(AddMoney,270,270)	-- Деньги


	InitTrigger()
	TriggerCondition( 1, IsItem, 4085 )	
	TriggerAction( 1, AddNextFlag, 600, 10, 5 )
	RegCurTrigger( 6001 )

----------------------------Искоренение пчёл
	DefineMission( 601, "\200\241\234\238\240\229\237\229\237\232\229 \239\247\191\235", 601 )
	
	MisBeginTalk( "<t>О мой Бог... Эти <rДикие Пчёлы> становятся всё агрессивнее и агрессивнее. Я прошёл рядом с клумбой, где они собирали нектар и они всем роем на меня напали.<n><t>От их укусов моё лицо теперь всё в волдырях.<n><t>Не отомстите за меня им? Убейте <r10 Диких пчёл>. Они могут быть рядом с (1623,139)!" )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(HasRecord, 600)
	MisBeginCondition(NoMission, 601)
	MisBeginCondition(NoRecord, 601)
	MisBeginAction(AddMission, 601)
	MisBeginAction(AddTrigger, 6011, TE_KILL, 139, 10 )	--Дикая пчела
	MisCancelAction(ClearMission, 601)

	MisNeed(MIS_NEED_KILL, 139, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы разве уже убили Диких пчёл?" )
	MisResultTalk("<t>Ха-ха-ха! Спасибо тебе добрый человек. Теперь эти Пчёлы будут знать на кого нападать!" )
	MisResultCondition(NoRecord, 601)
	MisResultCondition(HasMission, 601)
	MisResultCondition(HasFlag, 601, 19 )
	MisResultAction(ClearMission, 601)
	MisResultAction(SetRecord, 601)
	MisResultAction(AddExp, 800, 800)
	MisResultAction(AddMoney,270,270)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 139 )	
	TriggerAction( 1, AddNextFlag, 601, 10, 10 )
	RegCurTrigger( 6011 )

-----------------------------------Осуществление мечты
	DefineMission( 602, "\206\241\243\249\229\241\242\226\235\229\237\232\229 \236\229\247\242\251", 602 )
	
	MisBeginTalk( "<t>Ах! Я рад Вас видеть! За последние 2 дня я не смог сомкнуть глаз. Это *урканье* Совёнышей выводит меня из себя!<n><t>Я старый человек и мне необходим покой и сон, но <rСовёныши> мне мешают спать.<n><t>Убейте <r10 Совёнышей>. Вы их сможете найти в Аскароне в точке (1384,3065)." )
	MisBeginCondition(LvCheck, ">", 20 )
	MisBeginCondition(HasRecord, 603)
	MisBeginCondition(NoMission, 602)
	MisBeginCondition(NoRecord, 602)
	MisBeginAction(AddMission, 602)
	MisBeginAction(AddTrigger, 6021, TE_KILL, 224, 10 )--Совеныш
	MisCancelAction(ClearMission, 602)

	MisNeed(MIS_NEED_KILL, 224, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы разве уже убили <r10 Совёнышей>?" )
	MisResultTalk("<t>Спасибо! Теперь я буду спать спокойно." )
	MisResultCondition(NoRecord, 602)
	MisResultCondition(HasMission, 602)
	MisResultCondition(HasFlag, 602, 19 )
	MisResultAction(ClearMission, 602)
	MisResultAction(SetRecord, 602)
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney,285,285)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 224 )	
	TriggerAction( 1, AddNextFlag, 602, 10, 10 )
	RegCurTrigger( 6021 )


-----------------------------------Учёная Сова
	DefineMission( 603, "\211\247\191\237\224\255 \209\238\226\224", 603 )
	
	MisBeginTalk( "<t>Я такое чудо наблюдал на днях, Вы наверно мне не поверите и сочтёте меня сумасшедшим, но я расскажу Вам всё таки то что я видел.<n><t>Я видел как Совы сидели на дереве и читали книгу. Да-да именно книгу и держали книги в своих когтях. Принесите мне эти когти, очень интересно как они в них могли держать книги." )
	MisBeginCondition(LvCheck, ">", 20 )
	MisBeginCondition(NoMission, 603)
	MisBeginCondition(NoRecord, 603)
	MisBeginAction(AddMission, 603)
	MisBeginAction(AddTrigger, 6031, TE_GETITEM, 4432, 5 )--Совиный коготь
	MisCancelAction(ClearMission, 603)

	MisNeed(MIS_NEED_ITEM, 4432, 5, 10, 5)
	
	MisHelpTalk( "<t>Принесите мне 5 когтей!<n><t>Их можно получить убивая <rСовенышей> в Аскароне в точке (632,2533)." )
	MisResultTalk( "<t>Хм... Эти когти ни чем не отличаются от когтей обычных Сов... Наверно я схожу сума?!" )
	MisResultCondition(NoRecord, 603)
	MisResultCondition(HasMission, 603)
	MisResultCondition(HasItem, 4432, 5)
	MisResultAction(TakeItem, 4432, 5 )
	MisResultAction(ClearMission, 603)
	MisResultAction(SetRecord, 603)
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney,571,571)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4432 )	
	TriggerAction( 1, AddNextFlag, 603, 10, 5 )
	RegCurTrigger( 6031 )

-----------------------------------Хитрая Сова
	DefineMission( 604, "\213\232\242\240\224\255 \209\238\226\224", 604 )
	
	MisBeginTalk( "<t>Не так давно я читал книгу у себя во дворе дома, как вдруг налетели <rсовы> и вырвали у меня <yстраницы>.<n><t>Я не успел дочитать свою книгу, не могли ли бы вы мне принести недостающие страницы?<n><t>(<yПропавшие страницы> можно найти в <bПтичьем гнезде> в Аскароне(1268,3060)." )
	MisBeginCondition(LvCheck, ">", 21 )
	MisBeginCondition(NoMission, 604)
	MisBeginCondition(NoRecord, 604)
	MisBeginAction(AddMission, 604)
	MisBeginAction(AddTrigger, 6041, TE_GETITEM, 4086, 5 )--Пропавшая страница
	MisCancelAction(ClearMission, 604)

	MisNeed(MIS_NEED_ITEM, 4086, 5, 10, 5)
	
	MisHelpTalk( "<t>Я не переживу если не дочитаю эту книгу!" )
	MisResultTalk("<t>Спасибо вам! Благодаря Вам я дочитаю книгу и узнаю чем же там всё закончится!" )
	MisResultCondition(NoRecord, 604)
	MisResultCondition(HasMission, 604)
	MisResultCondition(HasItem, 4086, 5)
	MisResultAction(TakeItem, 4086, 5 )
	MisResultAction(ClearMission, 604)
	MisResultAction(SetRecord, 604)
	MisResultAction(AddExp, 1100, 1100)
	MisResultAction(AddMoney,300,300)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4086 )	
	TriggerAction( 1, AddNextFlag, 604, 10, 5 )
	RegCurTrigger( 6041 )

-----------------------------------	Искушение Деликатесом
	DefineMission( 605, "\200\241\234\243\248\229\237\232\229 \196\229\235\232\234\224\242\229\241\238\236", 605 )
	
	MisBeginTalk( "<t>Пообещайте мне, что поможете! Сначала пообещайте, потом я расскажу, что я хочу от вас...<n><t>Как только я подумаю о свинине, у меня текут слюнки... Это такое объедение... принесите мне <y5 Коротких кабаних хвостов>, а я Вас угощу самым вкусным деликатесом в мире." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(NoMission, 605)
	MisBeginCondition(NoRecord, 605)
	MisBeginAction(AddMission, 605)
	MisBeginAction(AddTrigger, 6051, TE_GETITEM, 4433, 5 )--Короткий кабаний хвост
	MisCancelAction(ClearMission, 605)

	MisNeed(MIS_NEED_ITEM, 4433, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы не знаете где раздобыть <bКороткий кабаний хвост>? Отправляйтесь в Аскарон в точку (1251,2962)." )
	MisResultTalk( "<t>Ох... Спасибо Вам огромне! Заходите попозже за своим Деликатесом! " )
	MisResultCondition(NoRecord, 605)
	MisResultCondition(HasMission, 605)
	MisResultCondition(HasItem, 4433, 5)
	MisResultAction(TakeItem, 4433, 5 )
	MisResultAction(ClearMission, 605)
	MisResultAction(SetRecord, 605)
	MisResultAction(AddExp, 1300, 1300)
	MisResultAction(AddMoney,632,632)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4433 )	
	TriggerAction( 1, AddNextFlag, 605, 10, 5 )
	RegCurTrigger( 6051 )

-----------------------------------Сопротивление кабанам
	DefineMission( 606, "\209\238\239\240\238\242\232\226\235\229\237\232\229 \234\224\225\224\237\224\236", 606 )
	
	MisBeginTalk( "<t>Я сегодня чуть не упал от ужаса, когда открыл окно и увидел у себя во дворе целое стадо <rКлыкастых боевых кабанов>. Они уничтожили всё в моём дворе.<n><t>Я не могу их оставить безнаказанными после разгрома моего двора. Убейте <r10 Клыкастых боевых кабанов> и отомстите за меня. Они могут быть в точке(1384,3065)." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(HasRecord, 605)
	MisBeginCondition(NoMission, 606)
	MisBeginCondition(NoRecord, 606)
	MisBeginAction(AddMission, 606)
	MisBeginAction(AddTrigger, 6061, TE_KILL, 264, 10 )--Клыкастый боевой кабан
	MisCancelAction(ClearMission, 606)

	MisNeed(MIS_NEED_KILL, 264, 10, 10, 10)
	
	MisHelpTalk( "<t>А если бы они у Вас так разгромили двор, Вы бы так же их простили?" )
	MisResultTalk( "<t>Ха! Вы проучили их раз и на всегда. Теперь они больше не полезут в чужой двор!" )
	MisResultCondition(NoRecord, 606)
	MisResultCondition(HasMission, 606)
	MisResultCondition(HasFlag, 606, 19 )
	MisResultAction(ClearMission, 606)
	MisResultAction(SetRecord, 606)
	MisCancelAction(ClearMission, 607)
	MisResultAction(AddExp, 1300, 1300)
	MisResultAction(AddMoney,316,316)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 264 )	
	TriggerAction( 1, AddNextFlag, 606, 10, 10 )
	RegCurTrigger( 6061 )

-----------------------------------Не вонять!*Долой Вонючек*!
	DefineMission( 607, "\205\229 \226\238\237\255\242\252!*\196\238\235\238\233 \194\238\237\254\247\229\234*!", 607 )
	
	MisBeginTalk( "<t>ЭЭй, Друг! Вы чувствуете? Как тут пахнет... Мм! Аромат просто завораживает...Шучу...Шучу.*Хе-хе-хе* Тут просто воняет! А знаете почему?! Тут  не  далеко, в точке (1414,2896), завёлся <rСвин-Летун>.<n><t>Убейте <r10 Свинов-Летунов> и спасите чистый воздух." )
	MisBeginCondition(HasRecord, 608)
	MisBeginCondition(LvCheck, ">", 23 )
	MisBeginCondition(NoMission, 607)
	MisBeginCondition(NoRecord, 607)
	MisBeginAction(AddMission, 607)
	MisBeginAction(AddTrigger, 6071, TE_KILL, 295, 10 )--Свин-летун
	MisCancelAction(ClearMission, 607)

	MisNeed(MIS_NEED_KILL, 295, 10, 10, 10)
	
	MisHelpTalk( "<t>Да убейте же на конец <rСвина-летуна>! Я задыхаюсь уже!" )
	MisResultTalk( "<t>Очень хорошо!" )
	MisResultCondition(NoRecord, 607)
	MisResultCondition(HasMission, 607)
	MisResultCondition(HasFlag, 607, 19 )
	MisResultAction(ClearMission, 607)
	MisResultAction(SetRecord, 607)
	MisResultAction(AddExp, 1500, 1500)
	MisResultAction(AddMoney,332,332)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 295 )	
	TriggerAction( 1, AddNextFlag, 607, 10, 10 )
	RegCurTrigger( 6071 )

-----------------------------------Необычный мешок
	DefineMission( 608, "\205\229\238\225\251\247\237\251\233 \236\229\248\238\234", 608 )
	
	MisBeginTalk( "<t>Я думаю, что агрессию и вонь <bСвина-Летуна> мы не можем просто проигнорировать.<n><t>Я хочу заняться независимым расследованием по этому вопросу и узнать, с чем же всё это может быть связано.<n><t>Принесите мне <y5 Необычных мешков> с <rСвинов-Летунов>, что бы я смог их посмотреть." )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 608)
	MisBeginCondition(NoRecord, 608)
	MisBeginAction(AddMission, 608)
	MisBeginAction(AddTrigger, 6081, TE_GETITEM, 4460, 5 )--Необычный мешок
	MisCancelAction(ClearMission, 608)

	MisNeed(MIS_NEED_ITEM, 4460, 5, 10, 5)
	
	MisHelpTalk( "<t>Дя моего исследования необходимы Необычные мешки. Ну не как без них не обойтись, ни как!" )
	MisResultTalk( "<t>Я понял! Они переносят в этих мешках помёт Свинов кабонов!" )
	MisResultCondition(NoRecord, 608)
	MisResultCondition(HasMission, 608)
	MisResultCondition(HasItem, 4460, 5)
	MisResultAction(TakeItem, 4460, 5 )
	MisResultAction(ClearMission, 608)
	MisResultAction(SetRecord, 608)
	MisResultAction(AddExp, 1500, 1500)
	MisResultAction(AddMoney,664,664)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4460 )	
	TriggerAction( 1, AddNextFlag, 608, 10, 5 )
	RegCurTrigger( 6081 )

-----------------------------------Пропавшие Золотые Монеты
	DefineMission( 609, "\207\240\238\239\224\226\248\232\229 \199\238\235\238\242\251\229 \204\238\237\229\242\251", 609 )
	
	MisBeginTalk( "<t>Друг мой, вы должны знать меня! Я самый честный торговец! Но вот несчастье, меня обокрали <rБандиты> и украли моё золото!<n><t>Вы не могли бы сходить и забрать мой <yМешочек с золотыми> у них в убежище?" )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 609)
	MisBeginCondition(NoRecord, 609)
	MisBeginAction(AddMission, 609)
	MisBeginAction(AddTrigger, 6091, TE_GETITEM, 4087, 1 )--Мешочек с золотыми
	MisCancelAction(ClearMission, 609)

	MisNeed(MIS_NEED_ITEM, 4087, 1, 10, 1)
	
	MisHelpTalk( "<t>Спасибо Вам огромное! Вы вернули мне золото и я смогу дальше продолжать свою торговлю!" )
	MisResultTalk("<t>Не, ну ладно я боюсь бандитов. Я старый, мне простительно, но Вам! Как же Вам не стыдно..." )
	MisResultCondition(NoRecord, 609)
	MisResultCondition(HasMission, 609)
	MisResultCondition(HasItem, 4087, 1)
	MisResultAction(TakeItem, 4087, 1 )
	MisResultAction(ClearMission, 609)
	MisResultAction(SetRecord, 609)
	MisResultAction(AddExp, 1800, 1800)
	MisResultAction(AddMoney,1394,1394)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4087 )	
	TriggerAction( 1, AddNextFlag, 609, 10, 1 )
	RegCurTrigger( 6091 )


-----------------------------------Страшные Бандиты
	DefineMission( 610, "\209\242\240\224\248\237\251\229 \193\224\237\228\232\242\251", 610 )
	
	MisBeginTalk( "<t>Эй друг! Тут в Андийских Лесах орудуют Бесстрашные <rБандиты>. Они грабят и убивают всех в подряд.<n><t>Убейте <r10 Бандитов>. Помогите местным жителям." )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 610)
	MisBeginCondition(NoRecord, 610)
	MisBeginAction(AddMission, 610)
	MisBeginAction(AddTrigger, 6101, TE_KILL, 93, 10 )--Бандит
	MisCancelAction(ClearMission, 610)

	MisNeed(MIS_NEED_KILL, 93, 10, 10, 10)
	
	MisHelpTalk( "<t>Убейте 10 Бандитов в Андийском Лесу!" )
	MisResultTalk( "<t>Это станет для них уроком!" )
	MisResultCondition(NoRecord, 610)
	MisResultCondition(HasMission, 610)
	MisResultCondition(HasFlag, 610, 19 )
	MisResultAction(ClearMission, 610)
	MisResultAction(SetRecord, 610)
	MisResultAction(AddExp, 1800, 1800)
	MisResultAction(AddMoney,348,348)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 93 )	
	TriggerAction( 1, AddNextFlag, 610, 10, 10 )
	RegCurTrigger( 6101 )


-----------------------------------Уничтожение Дурмана
	DefineMission( 611, "\211\237\232\247\242\238\230\229\237\232\229 \196\243\240\236\224\237\224", 611 )
	
	MisBeginTalk( "<t>Ходят слухи, что Дурман это живой цветок, способный танцевать под музыку. Я ни разу не видел этого и не верю в его существование.<n><t>Принесите мне <y2 Острых шипа дурмана>, что бы я удостоверился в их существовании. Ходят слухи, что дурман можно найти в точке(1414,2898)." )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 611)
	MisBeginCondition(NoRecord, 611)
	MisBeginAction(AddMission, 611)
	MisBeginAction(AddTrigger, 6111, TE_GETITEM, 4088, 2 )--Острый шип дурмана(квестовый)
	MisCancelAction(ClearMission, 611)

	MisNeed(MIS_NEED_ITEM, 4088, 2, 10, 2)
	
	MisHelpTalk( "<t>Принесите мне докозательства о существовании Дурмана." )
	MisResultTalk( "<t>Спасибо Вам большое! Теперь я верю. Он действительно существует." )
	MisResultCondition(NoRecord, 611)
	MisResultCondition(HasMission, 611)
	MisResultCondition(HasItem, 4088, 2)
	MisResultAction(TakeItem, 4088, 2 )
	MisResultAction(ClearMission, 611)
	MisResultAction(SetRecord, 611)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,730,730)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4088 )	
	TriggerAction( 1, AddNextFlag, 611, 10, 2 )
	RegCurTrigger( 6111 )

-----------------------------------Ликвидация Дурманов
	DefineMission( 612, "\203\232\234\226\232\228\224\246\232\255 \196\243\240\236\224\237\238\226", 612 )
	
	MisBeginTalk( "<t>Жители нашего поселения в ужасе и страхе от Дурмана. У Дурмана есть ядовитые шипы и он может передвигаться по земле. убейте <r10 Дурмана>. Помогите нам избавиться от этой нечисти. Ходят слухи, что его можно найти в точке (1414,2896)." )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 612)
	MisBeginCondition(NoRecord, 612)
	MisBeginAction(AddMission, 612)
	MisBeginAction(AddTrigger, 6121, TE_KILL, 85, 20 )--Дурман
	MisCancelAction(ClearMission, 612)

	MisNeed(MIS_NEED_KILL, 85, 20, 10, 20)
	
	MisHelpTalk( "<t>Вы ещё не убили Дурмана." )
	MisResultTalk( "<t>Очень хорошо! Спасибо Вам огромное за помощь!" )
	MisResultCondition(NoRecord, 612)
	MisResultCondition(HasMission, 612)
	MisResultCondition(HasFlag, 612, 29 )
	MisResultAction(ClearMission, 612)
	MisResultAction(SetRecord, 612)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,365,365)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 85 )	
	TriggerAction( 1, AddNextFlag, 612, 10, 20 )
	RegCurTrigger( 6121 )


-----------------------------------Конкурс
	DefineMission( 613, "\202\238\237\234\243\240\241", 613 )
	
	MisBeginTalk( "<t>Эй, друг! Вы пришли во время! Новый захватывающий конкурс проходит здесь!<n><t>Кто победит <rБоксеру-новичоков> получит приз!<n><t>Вы согласны?Тогда не теряйте время.Вас ждут на месте (1117, 2923)." )
	MisBeginCondition(HasRecord, 614 )
	MisBeginCondition(LvCheck, ">", 26 )
	MisBeginCondition(NoMission, 613)
	MisBeginCondition(NoRecord, 613)
	MisBeginAction(AddMission, 613)
	MisBeginAction(AddTrigger, 6131, TE_KILL, 76, 10 )--Боксеру-новичок
	MisCancelAction(ClearMission, 613)

	MisNeed(MIS_NEED_KILL, 76, 10, 10, 10)
	
	MisHelpTalk( "<t>А почему Вы не приняли участие в конкурсе?" )
	MisResultTalk("<t>Очень хорошо! Вы заняли 2 место и получите утешительный приз!" )
	MisResultCondition(NoRecord, 613)
	MisResultCondition(HasMission, 613)
	MisResultCondition(HasFlag, 613, 19 )
	MisResultAction(ClearMission, 613)
	MisResultAction(SetRecord, 613)
	MisResultAction(AddExp, 2300, 2300)
	MisResultAction(AddMoney,382,382)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 76 )	
	TriggerAction( 1, AddNextFlag, 613, 10, 10 )
	RegCurTrigger( 6131 )

-----------------------------------Боксерские перчатки
	DefineMission( 614, "\193\238\234\241\229\240\241\234\232\229 \239\229\240\247\224\242\234\232", 614 )
	
	MisBeginTalk( "<t>Друг, Вы можете мне помочь? У моего брата скоро день рождение и он хочет в подарок <yБоксерские перчатки>.<n><t>Но я сам не смогу получить их, так как я слаб, а их можно заполучить только убив <rБоксеру-новичока> в Аскроне в точке (1117,2923). Помогите пожалуйста мне!" )
	MisBeginCondition(LvCheck, ">", 26 )
	MisBeginCondition(NoMission, 614)
	MisBeginCondition(NoRecord, 614)
	MisBeginAction(AddMission, 614)
	MisBeginAction(AddTrigger, 6141, TE_GETITEM, 4435, 1 )--Боксерские перчатки
	MisCancelAction(ClearMission, 614)

	MisNeed(MIS_NEED_ITEM, 4435, 1, 10, 1)
	
	MisHelpTalk( "<t>Вы хотите испортить моему братику день рождение?!" )
	MisResultTalk( "<t>Спасибо Вам. Мой Братик будет самым счастливым именинником благодаря Вам." )
	MisResultCondition(NoRecord, 614)
	MisResultCondition(HasMission, 614)
	MisResultCondition(HasItem, 4435, 1)
	MisResultAction(TakeItem, 4435, 1 )
	MisResultAction(ClearMission, 614)
	MisResultAction(SetRecord, 614)
	MisResultAction(AddExp, 2300, 2300)
	MisResultAction(AddMoney,382,382)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4435 )	
	TriggerAction( 1, AddNextFlag, 614, 10, 1 )
	RegCurTrigger( 6141 )

-----------------------------------Взрослая травяная черепаха
	DefineMission( 615, "\194\231\240\238\241\235\224\255 \242\240\224\226\255\237\224\255 \247\229\240\229\239\224\245\224", 615 )
	
	MisBeginTalk( "<t>Я ненавижу <rВзрослую травяную черепаху>! Она меня раздражает, я не могу смотреть на этих черепах. Особенно меня раздражает то что они передвигаются очень медленно и была бы моя воля я бы сделал их на много быстрее. Такие медленные существа вообще не должны существовать на этой земле!<n><t>Убейте <r10 Взрослых травяных черепах>. Они ползали пол века назад в точке(1198,3136), но так как они очень медлительны, они скорее всего ещё там!" )
	MisBeginCondition(LvCheck, ">", 27 )
	MisBeginCondition(NoMission, 615)
	MisBeginCondition(NoRecord, 615)
	MisBeginAction(AddMission, 615)
	MisBeginAction(AddTrigger, 6151, TE_KILL, 135, 10 )--Взрослая травяная черепаха
	MisCancelAction(ClearMission, 615)

	MisNeed(MIS_NEED_KILL, 135, 10, 10, 10)
	
	MisHelpTalk( "<t>О Боже! Вы ещё медлительнее чем они, я не навижу всё, что так долго движется!" )
	MisResultTalk( "<t>Вы их убили?! Спасибо Вам!" )
	MisResultCondition(NoRecord, 615)
	MisResultCondition(HasMission, 615)
	MisResultCondition(HasFlag, 615, 19 )
	MisResultAction(ClearMission, 615)
	MisResultAction(SetRecord, 615)
	MisResultAction(AddExp, 2600, 2600)
	MisResultAction(AddMoney,400,400)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 135 )	
	TriggerAction( 1, AddNextFlag, 615, 10, 10 )
	RegCurTrigger( 6151 )

----------------------------------Кража Черепашьих яиц
	DefineMission( 616, "\202\240\224\230\224 \215\229\240\229\239\224\248\252\232\245 \255\232\246", 616 )
	
	MisBeginTalk( "<t>Эй Друг, позвольте я расскажу Вам секрет! Цена на <bЧерепашьи яйца> очень большая в наши дни!<n><t>Тем не менее я не могу сам справиться с большими монстрами.<n><t>Могли бы Вы сходить в Аскарон в точку(1198,3136) , взять из гнёзд черепах эти яйца и принести мне, я же поделю выручку между нами." )
	MisBeginCondition(LvCheck, ">", 27 )
	MisBeginCondition(NoMission, 616)
	MisBeginCondition(NoRecord, 616)
	MisBeginAction(AddMission, 616)
	MisBeginAction(AddTrigger, 6161, TE_GETITEM, 4089, 10 )--Черепашье яйцо
	MisCancelAction(ClearMission, 616)

	MisNeed(MIS_NEED_ITEM, 4089, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не нашли яйца черепах. Идите и отыщите их." )
	MisResultTalk( "<t>Ха-ха-ха! Я миллионер! Вот Ваша часть!" )
	MisResultCondition(NoRecord, 616)
	MisResultCondition(HasMission, 616)
	MisResultCondition(HasItem, 4089, 10)
	MisResultAction(TakeItem, 4089, 10 )
	MisResultAction(ClearMission, 616)
	MisResultAction(SetRecord, 616)
	MisResultAction(AddExp, 2600, 2600)
	MisResultAction(AddMoney,400,40500)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4089 )	
	TriggerAction( 1, AddNextFlag, 616, 10, 10 )
	RegCurTrigger( 6161 )

-----------------------------------Контрабанда черепашьими панцирями
	DefineMission( 617, "\202\238\237\242\240\224\225\224\237\228\224 \247\229\240\229\239\224\248\252\232\236\232 \239\224\237\246\232\240\255\236\232", 617 )
	
	MisBeginTalk( "<t>В последнее время я стал заниматься торговлей Черепашьих панцирей. Это очень прибыльное дело, если Вам интересно, то я могу взять Вас в компаньоны.<n><t>Принесите мне <y5 Красивых черепашьих панцирей>, что бы я смог обработать их на продажу. Вырученные деньги с продажи поделим по полам.<n><t>Я охочусь на черепах в Аскароне в точке(1198,3116), Вы тоже можете там охотиться на них." )
	MisBeginCondition(HasRecord, 616)
	MisBeginCondition(LvCheck, ">", 28 )
	MisBeginCondition(NoMission, 617)
	MisBeginCondition(NoRecord, 617)
	MisBeginAction(AddMission, 617)
	MisBeginAction(AddTrigger, 6171, TE_GETITEM, 4465, 5 )--Красивый черепаший панцирь
	MisCancelAction(ClearMission, 617)

	MisNeed(MIS_NEED_ITEM, 4465, 5, 10, 5)
	
	MisHelpTalk("<t>Я чувствую что из нас не выйдет команды!" )
	MisResultTalk("<t>Вы принесли то что нужно, спасибо Вам! Вот Ваша часть прибыли!" )
	MisResultCondition(NoRecord, 617)
	MisResultCondition(HasMission, 617)
	MisResultCondition(HasItem, 4465, 5)
	MisResultAction(TakeItem, 4465, 5 )
	MisResultAction(ClearMission, 617)
	MisResultAction(SetRecord, 617)
	MisResultAction(AddExp, 3000, 3000)
	MisResultAction(AddMoney,835,835)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4465 )	
	TriggerAction( 1, AddNextFlag, 617, 10, 5 )
	RegCurTrigger( 6171 )

-----------------------------------Проклятая грязь
	DefineMission( 618, "\207\240\238\234\235\255\242\224\255 \227\240\255\231\252", 618 )
	
	MisBeginTalk( "<t>Хе-хе! Мой Друг, позвольте мне рассказать Вам мою тайну. Недавно я узнал новое проклятие, и я хочу использовать его на моём враге <bКентаро>.<n><t>Но мне не хватает одного ингредиента для завершения отвара. Принесите мне <y10 Бритвенно острых клыков>, что бы я смог доделать свой отвар.<n><t>Необходимый мне предмет Вы сможете получить убив <rБезумного кабана> в точке Аскарона(910,2971)." )
	MisBeginCondition(LvCheck, ">", 28 )
	MisBeginCondition(NoMission, 618)
	MisBeginCondition(NoRecord, 618)
	MisBeginAction(AddMission, 618)
	MisBeginAction(AddTrigger, 6181, TE_GETITEM, 4443, 10 )--Бритвенно острый клык
	MisCancelAction(ClearMission, 618)

	MisNeed(MIS_NEED_ITEM, 4443, 10, 10, 10)
	
	MisHelpTalk( "<t>Не шутит со мной иначе я сделаю отвар и прокляну Вас вместо Кентаро!" )
	MisResultTalk( "<t>Спасибо! Ну теперь держись <bКентаро>!" )
	MisResultCondition(NoRecord, 618)
	MisResultCondition(HasMission, 618)
	MisResultCondition(HasItem, 4443, 10)
	MisResultAction(TakeItem, 4443, 10 )
	MisResultAction(ClearMission, 618)
	MisResultAction(SetRecord, 618)
	MisResultAction(AddExp, 3000, 3000)
	MisResultAction(AddMoney,835,835)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4443 )	
	TriggerAction( 1, AddNextFlag, 618, 10, 10 )
	RegCurTrigger( 6181 )

-----------------------------------День Независимости Кабана
	DefineMission( 619, "\196\229\237\252 \205\229\231\224\226\232\241\232\236\238\241\242\232 \202\224\225\224\237\224", 619 )
	
	MisBeginTalk( "<t>Ах! Я просто ненавижу этих <rБезумных кабанов>. Эти кабаны устроили себе День независимости!<n><t>Они ходят толпами по улицам, и жители боятся выходить из своих домов.<n><t>Отправляйтесь в точку(910,2971) Аскарона и убейте <r10 Безумных кабанов>. Это должно послужить им уроком!" )
	MisBeginCondition(HasRecord, 618)
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 619)
	MisBeginCondition(NoMission, 620)
	MisBeginCondition(NoRecord, 619)
	MisBeginAction(AddMission, 619)
	MisBeginAction(AddTrigger, 6191, TE_KILL, 64, 10 )--Безумный кабан
	MisCancelAction(ClearMission, 619)

	MisNeed(MIS_NEED_KILL, 64, 10, 10, 10)
	
	MisHelpTalk( "<t>Жители до сих пор боятся выходить на улицу!" )
	MisResultTalk( "<t>Ах! Спасибо, Вы настоящий герой и весь город перед Вами в долгу!" )
	MisResultCondition(NoRecord, 619)
	MisResultCondition(HasMission, 619)
	MisResultCondition(HasFlag, 619, 19 )
	MisResultAction(ClearMission, 619)
	MisResultAction(SetRecord, 619)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,424,424)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 64 )	
	TriggerAction( 1, AddNextFlag, 619, 10, 10 )
	RegCurTrigger( 6191 )

-----------------------------------Вызов кабану
	DefineMission( 620, "\194\251\231\238\226 \234\224\225\224\237\243", 620 )
	
	MisBeginTalk( "<t>Привет! Вы недавно приехали к нам? Разве Вы не хотите продемонстрировать свои силы местным жителям?<n><t>Хотите?! Ну отлично! У меня как раз есть задание для героя, если Вам интересно то я продолжу...<n><t>Ну так вот, что бы показать свою силу Вам надо отправиться в точку(911,2973) и убить <r5 Безумных кабанов>. Эти кабаны замучили нашу деревню, Вы поможете нам и тем самым прославите своё имя, как героя." )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 620)
	MisBeginCondition(NoMission, 619)
	MisBeginCondition(NoRecord, 620)
	MisBeginAction(AddMission, 620)
	MisBeginAction(AddTrigger, 6201, TE_KILL, 64, 5 )----Безумный кабан
	MisCancelAction(ClearMission, 620)

	MisNeed(MIS_NEED_KILL, 64, 5, 10, 5)
	
	MisHelpTalk( "<t>Хех... Так Вам не прославить себя как Героя, если только как хвастуна или выскочку!" )
	MisResultTalk( "<t>Да! Вы герой!" )
	MisResultCondition(NoRecord, 620)
	MisResultCondition(HasMission, 620)
	MisResultCondition(HasFlag, 620, 14 )
	MisResultAction(ClearMission, 620)
	MisResultAction(SetRecord, 620)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,424,424)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 64 )	
	TriggerAction( 1, AddNextFlag, 620, 10, 5 )
	RegCurTrigger( 6201 )

-----------------------------------Дорогие травы
	DefineMission( 621, "\196\238\240\238\227\232\229 \242\240\224\226\251", 621 )
	
	MisBeginTalk( "<t>Эй друг, я потерял несколько Дорогих трав по пути сюда.<n><t>Эти травы очень нужны мне.<n><t>Я прошу Вас... Принесите мне с равнин Аскарона(1360,2683) <b6 Ценных трав>." )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 621)
	MisBeginCondition(NoRecord, 621)
	MisBeginAction(AddMission, 621)
	MisBeginAction(AddTrigger, 6211, TE_GETITEM, 4090, 6 )--Ценные травы
	MisCancelAction(ClearMission, 621)

	MisNeed(MIS_NEED_ITEM, 4090, 6, 10, 6)
	
	MisHelpTalk( "<t>Вы уже принесли мне что я просил? Так чего жк Вы ждёте?!" )
	MisResultTalk( "<t>Спасибо! Вы меня спасли!" )
	MisResultCondition(NoRecord, 621)
	MisResultCondition(HasMission, 621)
	MisResultCondition(HasItem, 4090, 6)
	MisResultAction(TakeItem, 4090, 6 )
	MisResultAction(ClearMission, 621)
	MisResultAction(SetRecord, 621)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,424,424)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4090 )	
	TriggerAction( 1, AddNextFlag, 621, 10, 6 )
	RegCurTrigger( 6211 )

-----------------------------------Тайна Кормопроизводства
	DefineMission( 622, "\210\224\233\237\224 \202\238\240\236\238\239\240\238\232\231\226\238\228\241\242\226\224", 622 )
	
	MisBeginTalk( "<t>Я не могу ни как понять почему <rЛуговой лось> обладает такой живучестью и почему у них так развит инстинкт самосохранения.<n><t>Принесите мне <y5Прочных лосиных копыт>, что бы я их смог сравнить с копытами простых лосей. Возможно мне удастся найти в них разницу и понять секрет Луговых лосей.<n><t>Эти Луговые лоси пасутся в Аскароне в точке(1360,2683)." )
	MisBeginCondition(LvCheck, ">", 30 )
	MisBeginCondition(NoMission, 622)
	MisBeginCondition(NoRecord, 622)
	MisBeginAction(AddMission, 622)
	MisBeginAction(AddTrigger, 6221, TE_GETITEM, 4372, 5 )--Прочное лосиное копыто
	MisCancelAction(ClearMission, 622)

	MisNeed(MIS_NEED_ITEM, 4372, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не ходили к Луговым Лосям? Вы не желаете разобраться в чём их сила?" )
	MisResultTalk("<t>Я тчательно осмотрел копыта луговых лосей, которые Вы мне принесли, и я не обноружил ни какой разницы. Возможно секрет не в их копытах..." )
	MisResultCondition(NoRecord, 622)
	MisResultCondition(HasMission, 622)
	MisResultCondition(HasItem, 4372, 5)
	MisResultAction(TakeItem, 4372, 5 )
	MisResultAction(ClearMission, 622)
	MisResultAction(SetRecord, 622)
	MisResultAction(AddExp, 3800, 3800)
	MisResultAction(AddMoney,863,863)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4372 )	
	TriggerAction( 1, AddNextFlag, 622, 10, 5 )
	RegCurTrigger( 6221 )

-----------------------------------Шкура лося
	DefineMission( 623, "\216\234\243\240\224 \235\238\241\255", 623 )
	
	MisBeginTalk( "<t>Эй дружище, я раньше был пиратом, но мне пришлось спрятаться здесь после поражения от экипажа Чёрного Джека!<n><t>Я хочу себе тулуп из Шкуры лося.<n><t>Принесите мне <y5 Качественных Лосиных шкур>. Луговых лосей Вы сможете найти в точке Аскарона(1360,2683)." )
	MisBeginCondition(LvCheck, ">", 30 )
	MisBeginCondition(NoMission, 623)
	MisBeginCondition(NoRecord, 623)
	MisBeginAction(AddMission, 623)
	MisBeginAction(AddTrigger, 6231, TE_GETITEM, 4091, 5 )--Качественная лосиная шкура
	MisCancelAction(ClearMission, 623)

	MisNeed(MIS_NEED_ITEM, 4091, 5, 10, 5)
	
	MisHelpTalk( "<t>Идите и принесите мне наконец 5 Качественной лосиной шкуры!")
	MisResultTalk( "<t>Хе-хе! Вы действительно Герой, а не пустомеля!" )
	MisResultCondition(NoRecord, 623)
	MisResultCondition(HasMission, 623)
	MisResultCondition(HasItem, 4091, 5)
	MisResultAction(TakeItem, 4091, 5 )
	MisResultAction(ClearMission, 623)
	MisResultAction(SetRecord, 623)
	MisResultAction(AddExp, 3800, 3800)
	MisResultAction(AddMoney,863,863)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4091 )	
	TriggerAction( 1, AddNextFlag, 623, 10, 5 )
	RegCurTrigger( 6231 )

-----------------------------------Белый Совеныш
	DefineMission( 624, "\193\229\235\251\233 \209\238\226\229\237\251\248", 624 )
	
	MisBeginTalk( "<t>Я ненавижу <rБелых Совёнышей>! Они весь день шумят, и от этого у меня болит голова!<n><t>Я сойду с уа если это так и будет продолжаться! Если Вы не против помочь мне, то убейте <r5 Белых Совёнышей> в точке(1360,2683). Я буду очень Вам благодарен если Вы мне поможете." )
	MisBeginCondition(LvCheck, ">", 31 )
	MisBeginCondition(NoMission, 624)
	MisBeginCondition(NoRecord, 624)
	MisBeginAction(AddMission, 624)
	MisBeginAction(AddTrigger, 6241, TE_KILL, 225, 5 )--Белый совеныш
	MisCancelAction(ClearMission, 624)

	MisNeed(MIS_NEED_KILL, 225, 5, 10, 5)
	
	MisHelpTalk( "<t>Я точно сойду с ума." )
	MisResultTalk( "<t>Спасибо большое! Теперь стало гораздо тише и спокойнее." )
	MisResultCondition(NoRecord, 624)
	MisResultCondition(HasMission, 624)
	MisResultCondition(HasFlag, 624, 14 )
	MisResultAction(ClearMission, 624)
	MisResultAction(SetRecord, 624)
	MisResultAction(AddExp, 4300, 4300)
	MisResultAction(AddMoney,438,438)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 225 )	
	TriggerAction( 1, AddNextFlag, 624, 10, 5 )
	RegCurTrigger( 6241 )

-----------------------------------Месть
	DefineMission( 625, "\204\229\241\242\252", 625 )
	
	MisBeginTalk( "<t>Я очень рад видеть Вас. Это хорошо, что Вы пришли ко мне! Я потерял весь урожай и угадайте из-за кого... Да да это из-за <rБелых совёнышей>. Они атаковали мой огород, разорили и опустошили его, потом, как ни в чём ни бывало, улетели к себе в гнездо.<n><t>Накажите их и в знак доказательства того, что Вы отомстили, принесите мне <y5 Острых клювов>. Вы сможете найти их в Аргенте в точке(1360,2683). Ступайте, но будьте осторожны, они опасны. Удачи Вам." )
	MisBeginCondition(LvCheck, ">", 31 )
	MisBeginCondition(HasRecord, 621)
	MisBeginCondition(NoMission, 625)
	MisBeginCondition(NoRecord, 625)
	MisBeginAction(AddMission, 625)
	MisBeginAction(AddTrigger, 6251, TE_GETITEM, 4451, 5 )--Острый клюв
	MisCancelAction(ClearMission, 625)

	MisNeed(MIS_NEED_ITEM, 4451, 5, 10, 5)
	
	MisHelpTalk( "<t>Теперь идите и принесите мне докозательства моей мести!" )
	MisResultTalk( "<t>Хе-хе-хе! Вы отомстили за меня! Спасибо тебе. Вот твоя награда!" )
	MisResultCondition(NoRecord, 625)
	MisResultCondition(HasMission, 625)
	MisResultCondition(HasItem, 4451, 5)
	MisResultAction(TakeItem, 4451, 5 )
	MisResultAction(ClearMission, 625)
	MisResultAction(SetRecord, 625)
	MisResultAction(AddExp, 4300, 4300)
	MisResultAction(AddMoney,877,877)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4451 )	
	TriggerAction( 1, AddNextFlag, 625, 10, 5 )
	RegCurTrigger( 6251 )

-----------------------------------Изгнание Волков
	DefineMission( 626, "\200\231\227\237\224\237\232\229 \194\238\235\234\238\226", 626 )
	
	MisBeginTalk( "<t><rЛуговой волк> это страшное животное, я не когда не видел более ужасного и опасного животного в своей жизни!<n><t>Я вынужден попросить Вас помочь отогнать <rЛугового волка> подальше от нашей деревни.<n><t>Убейте в точке(1143,2705) <r5 Луговых Волков> и тем самым Вы спугнёте оставшуюся часть волчьего стада.<n><t>Будьте осторожны, так как волки охотятся стаей." )
	MisBeginCondition(LvCheck, ">", 32 )
	MisBeginCondition(NoMission, 626)
	MisBeginCondition(NoRecord, 626)
	MisBeginAction(AddMission, 626)
	MisBeginAction(AddTrigger, 6261, TE_KILL, 136, 5 )--Луговой волк
	MisCancelAction(ClearMission, 626)

	MisNeed(MIS_NEED_KILL, 136, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не ходили на Лугового волка? Отгоните их пожалуйста от нашей деревни!" )
	MisResultTalk( "<t>Примите благодарность от всей нашей деревни!" )
	MisResultCondition(NoRecord, 626)
	MisResultCondition(HasMission, 626)
	MisResultCondition(HasFlag, 626, 14 )
	MisResultAction(ClearMission, 626)
	MisResultAction(SetRecord, 626)
	MisResultAction(AddExp, 4800, 4800)
	MisResultAction(AddMoney,446,446)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 136 )	
	TriggerAction( 1, AddNextFlag, 626, 10, 5 )
	RegCurTrigger( 6261 )


-----------------------------------Кровавая резня
	DefineMission( 627, "\202\240\238\226\224\226\224\255 \240\229\231\237\255", 627 )
	
	MisBeginTalk( "<t>Я же Вам уже говорил, что раньше ходил под пиратским флагом?<n><t>Я хоть и бывший пират, но я боюсь <rЛуговых волков>. Не убьёте для меня их? А в благодарность я дам Вам не плохое вознаграждение.<n><t>В доказательство того, что Вы их убили принесите мне <b5 Когтей быстрого волка>. <rЛуговых волков> Вы найдёте у выхода из <pВалгаллы> в точке(1143,2705)." )
	MisBeginCondition(HasRecord, 623)
	MisBeginCondition(LvCheck, ">", 32 )
	MisBeginCondition(NoMission, 627)
	MisBeginCondition(NoRecord, 627)
	MisBeginAction(AddMission, 627)
	MisBeginAction(AddTrigger, 6271, TE_GETITEM, 4469, 5 )--Коготь быстрого волка
	MisCancelAction(ClearMission, 627)

	MisNeed(MIS_NEED_ITEM, 4469, 5, 10, 5)
	
	MisHelpTalk("<t>Вы не получите от меня ни цента, пока я не увижу доказательств!" )
	MisResultTalk( "<t>Хех... Вы настоящий бесстрашный герой! Вот ваша награда!" )
	MisResultCondition(NoRecord, 627)
	MisResultCondition(HasMission, 627)
	MisResultCondition(HasItem, 4469, 5)
	MisResultAction(TakeItem, 4469, 5 )
	MisResultAction(ClearMission, 627)
	MisResultAction(SetRecord, 627)
	MisResultAction(AddExp, 4800, 4800)
	MisResultAction(AddMoney,892,892)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4469 )	
	TriggerAction( 1, AddNextFlag, 627, 10, 5 )
	RegCurTrigger( 6271 )

-----------------------------------Проблема Боксеров
	DefineMission( 628, "\207\240\238\225\235\229\236\224 \193\238\234\241\229\240\238\226", 628 )
	
	MisBeginTalk( "<t>Не спешите! Можете мне помочь? Когда я ночью шёл с работы домой, меня атаковали <rБоксеру-берсерк>!<n><t>Они нападают на всех прохожих без какой либо причины! Пожалуйста положите конец этим нападениям убив <r5 Боксеру-берсерк>. Вы найдёте их в точке(1161,2639)." )
	MisBeginCondition(LvCheck, ">", 33 )
	MisBeginCondition(NoMission, 628)
	MisBeginCondition(NoRecord, 628)
	MisBeginAction(AddMission, 628)
	MisBeginAction(AddTrigger, 6281, TE_KILL, 80, 5 )--Боксеру-берсерк
	MisCancelAction(ClearMission, 628)

	MisNeed(MIS_NEED_KILL, 80, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы разве уже наказали Боксёру-берсек?" )
	MisResultTalk( "<t>Ох! Спасибо тебе! Теперь они не будут нападать на всех прохожих!" )
	MisResultCondition(NoRecord, 628)
	MisResultCondition(HasMission, 628)
	MisResultCondition(HasFlag, 628, 14 )
	MisResultAction(ClearMission, 628)
	MisResultAction(SetRecord, 628)
	MisResultAction(AddExp, 5400, 5400)
	MisResultAction(AddMoney,453,453)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 80 )	
	TriggerAction( 1, AddNextFlag, 628, 10, 5 )
	RegCurTrigger( 6281 )

-----------------------------------Счастливый волшебный камень
	DefineMission( 629, "\209\247\224\241\242\235\232\226\251\233 \226\238\235\248\229\225\237\251\233 \234\224\236\229\237\252", 629 )
	
	MisBeginTalk( "<t>Тсс, это тайна между мной и Вами, и ни кто больше не должен знать об этом!<n><t>Там, где обитают <rБоксеру-Берсек> в точке(1161,2639) есть <pСчастливый волшебный камень>... говорят он приносит удачу тому кто его носит. Принеси мне его и я щедро отблагодарю тебя. Только ищи его лучше, он может быть даже в кустах." )
	MisBeginCondition(LvCheck, ">", 33 )
	MisBeginCondition(NoMission, 629)
	MisBeginCondition(NoRecord, 629)
	MisBeginAction(AddMission, 629)
	MisBeginAction(AddTrigger, 6291, TE_GETITEM, 4092, 3 )--Счастливый волшебный камень
	MisCancelAction(ClearMission, 629)

	MisNeed(MIS_NEED_ITEM, 4092, 3, 10, 3)
	
	MisHelpTalk( "<t>Вы не принесли мне  <pСчастливый волшебный камень>, тогда о какой награде Вы говорите?" )
	MisResultTalk("<t>Ох! Спасибо Вам! Теперь я стану на конец счастлив!" )
	MisResultCondition(NoRecord, 629)
	MisResultCondition(HasMission, 629)
	MisResultCondition(HasItem, 4092, 3)
	MisResultAction(TakeItem, 4092, 3 )
	MisResultAction(ClearMission, 629)
	MisResultAction(SetRecord, 629)
	MisResultAction(AddExp, 5400, 5400)
	MisResultAction(AddMoney,453,453)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4092 )	
	TriggerAction( 1, AddNextFlag, 629, 10, 3 )
	RegCurTrigger( 6291 )

-----------------------------------исследование улитки
	DefineMission( 630, "\200\241\241\235\229\228\238\226\224\237\232\229 \243\235\232\242\234\232", 630 )
	
	MisBeginTalk( "<t>Я удивлён, что Улитки хоть и медлительные, но они могут избежать опасность!<n><t>Или у них радар на панцире, или у них сверх естественные усики. Принесите мне 5 <bКоротких усиков улитки>, что бы провести более подробное исследование этого вопроса. Улиток вы найдёте в точке(1227,2742)." )
	MisBeginCondition(LvCheck, ">", 34 )
	MisBeginCondition(NoMission, 630)
	MisBeginCondition(NoRecord, 630)
	MisBeginAction(AddMission, 630)
	MisBeginAction(AddTrigger, 6301, TE_GETITEM, 4473, 5 )--Короткий усик улитки
	MisCancelAction(ClearMission, 630)

	MisNeed(MIS_NEED_ITEM, 4473, 5, 10, 5)
	
	MisHelpTalk( "<t>Разве Вам самим не интересно почему они избегают опасности?!" )
	MisResultTalk("<t>Я проверил их и пришёл к выводу, что усики у них ни чем не отличаются от обычных!" )
	MisResultCondition(NoRecord, 630)
	MisResultCondition(HasMission, 630)
	MisResultCondition(HasItem, 4473, 5)
	MisResultAction(TakeItem, 4473, 5 )
	MisResultAction(ClearMission, 630)
	MisResultAction(SetRecord, 630)
	MisResultAction(AddExp, 6100, 6100)
	MisResultAction(AddMoney,923,923)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4473 )	
	TriggerAction( 1, AddNextFlag, 630, 10, 5 )
	RegCurTrigger( 6301 )

-----------------------------------Глупая улитка
	DefineMission( 631, "\195\235\243\239\224\255 \243\235\232\242\234\224", 631 )
	
	MisBeginTalk( "<t>Я из принципа не переношу на дух этих <rГлупых улиток>, они такие глупые и такие медленные, что я- купец, который ценит каждую минуту, не могу без ненависти смотреть на этих ползающих еле еле созданий.<n><t>Отправляйтесь в точку(1227,2742) и убейте 10 этих несчастных <rГлупых улиток>. Тем самым Вы спасёте их от долгой и бесполезной жизни!" )
	MisBeginCondition(LvCheck, ">", 34 )
	MisBeginCondition(NoMission, 631)
	MisBeginCondition(NoRecord, 631)
	MisBeginAction(AddMission, 631)
	MisBeginAction(AddTrigger, 6311, TE_KILL, 127, 10 )--Глупая улитка
	MisCancelAction(ClearMission, 631)

	MisNeed(MIS_NEED_KILL, 127, 10, 10, 10)
	
	MisHelpTalk( "<t>Убейте их! Убейте! Я не могу смотреть как они мучаются!" )
	MisResultTalk( "<t>Спасибо! Вы сделали доброе дело!" )
	MisResultCondition(NoRecord, 631)
	MisResultCondition(HasMission, 631)
	MisResultCondition(HasFlag, 631, 19 )
	MisResultAction(ClearMission, 631)
	MisResultAction(SetRecord, 631)
	MisResultAction(AddExp, 6100, 6100)
	MisResultAction(AddMoney,461,461)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 127 )	
	TriggerAction( 1, AddNextFlag, 631, 10, 10 )
	RegCurTrigger( 6311 )


-----------------------------------Падальщик
	DefineMission( 632, "\207\224\228\224\235\252\249\232\234", 632 )
	
	MisBeginTalk( "<t>Всем в этом мире Богиня Кара дала дар. Только есть люди которые отвернулись от Богини и пошли по другой дороге.<n><t>Я хочу провести ритуал против таких людей, но мне не хватает свечей! Вы могли бы мне помочь, принести <p5 свечей>. Они падают когда убиваешь Грязилищь в Шахте(934,2747)." )
	MisBeginCondition(LvCheck, ">", 35 )
	MisBeginCondition(NoMission, 632)
	MisBeginCondition(NoRecord, 632)
	MisBeginAction(AddMission, 632)
	MisBeginAction(AddTrigger, 6321, TE_GETITEM, 4450, 5 )--Таинственная свеча
	MisCancelAction(ClearMission, 632)

	MisNeed(MIS_NEED_ITEM, 4450, 5, 10, 5)
	
	MisHelpTalk("<t>Я не смогу провести обряд без Свечей." )
	MisResultTalk("<t>Спасибо большое, помогая мне Вы помогли самой Богине Каре!" )
	MisResultCondition(NoRecord, 632)
	MisResultCondition(HasMission, 632)
	MisResultCondition(HasItem, 4450, 5)
	MisResultAction(TakeItem, 4450, 5 )
	MisResultAction(ClearMission, 632)
	MisResultAction(SetRecord, 632)
	MisResultAction(AddExp, 6800, 6800)
	MisResultAction(AddMoney,939,939)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4450 )	
	TriggerAction( 1, AddNextFlag, 632, 10, 5 )
	RegCurTrigger( 6321 )

-----------------------------------Песня Жалоклюва
	DefineMission( 633, "\207\229\241\237\255 \198\224\235\238\234\235\254\226\224", 633 )
	
	MisBeginTalk( "<t>Эй дружище, у меня есть для Вас работа, не задавайте лишних вопросов! Просто сделайте то, о чём я Вас сейчас попрошу, и Вы получите неплохое вознаграждение.<n><t>Убейте <r10 Жалоклювов> в точке(935,2687).<n><t>Приходите за наградой ко мне, когда покончите с этими существами." )
	MisBeginCondition(LvCheck, ">", 36 )
	MisBeginCondition(NoMission, 633)
	MisBeginCondition(NoRecord, 633)
	MisBeginAction(AddMission, 633)
	MisBeginAction(AddTrigger, 6331, TE_KILL, 128, 10 )--Жалоклюв
	MisCancelAction(ClearMission, 633)

	MisNeed(MIS_NEED_KILL, 128, 10, 10, 10)
	
	MisHelpTalk( "<t>Просто убейте их и не задавайте лишних вопросов." )
	MisResultTalk( "<t>Очень хорошо! Вы отличный воен! Из Вас выйдет хороший наёмник." )
	MisResultCondition(NoRecord, 633)
	MisResultCondition(HasMission, 633)
	MisResultCondition(HasFlag, 633, 19 )
	MisResultAction(ClearMission, 633)
	MisResultAction(SetRecord, 633)
	MisResultAction(AddExp, 7600, 7600)
	MisResultAction(AddMoney,477,477)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 128 )	
	TriggerAction( 1, AddNextFlag, 633, 10, 10 )
	RegCurTrigger( 6331 )

----------------------------------	Таинственная перо
	DefineMission( 634, "\210\224\232\237\241\242\226\229\237\237\224\255 \239\229\240\238", 634 )
	
	MisBeginTalk( "<t>Я хочу сделать мантию из перьев! Это не такая и глупая затея, как Вам кажется!<n><t>Не так давно я был пиратом, и одного моего слова *Надо* было достаточно, что бы мне принесли эти перья, но сейчас я в другом положении. и за место *Надо* я предлагаю Вам не плохие деньги.<n><t>Отправляйтесь в точку (935,2687) и принесите мне <p5 Блестящи перьев>. Я щедро Вас отблагодарю." )
	MisBeginCondition(LvCheck, ">", 36 )
	MisBeginCondition(NoMission, 634)
	MisBeginCondition(NoRecord, 634)
	MisBeginAction(AddMission, 634)
	MisBeginAction(AddTrigger, 6341, TE_GETITEM, 4472, 5 )--Блестящее перо
	MisCancelAction(ClearMission, 634)

	MisNeed(MIS_NEED_ITEM, 4472, 5, 10, 5)
	
	MisHelpTalk("<t>был бы я ещё пиратом Вы бы у меня пошли на корм акулам." )
	MisResultTalk("<t>Вот и хорошо! Вот Ваша награда!" )
	MisResultCondition(NoRecord, 634)
	MisResultCondition(HasMission, 634)
	MisResultCondition(HasItem, 4472, 5)
	MisResultAction(TakeItem, 4472, 5 )
	MisResultAction(ClearMission, 634)
	MisResultAction(SetRecord, 634)
	MisResultAction(AddExp, 7600, 7600)
	MisResultAction(AddMoney,955,955)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4472 )	
	TriggerAction( 1, AddNextFlag, 634, 10, 5 )
	RegCurTrigger( 6341 )

-----------------------------------Скорлупа яиц зловещей черепахи
	DefineMission( 635, "\209\234\238\240\235\243\239\224 \255\232\246 \231\235\238\226\229\249\229\233 \247\229\240\229\239\224\245\232", 635 )
	
	MisBeginTalk( "<t>По секрету, большинство торговцев ведут не честную торговлю, и я тоже!<n><t>Кто то заказал кристальное яйцо Кабана, но к сожалению я не имею возможности их раздобыть. Хотя если бы Вы принесли мне <pяица зловещей черепахи> в точке(969,2587) Вы сможете их найти. Я бы перекрасил бы их и отдал бы, как яйца кабана. Я щедро отблагодарю Вас за эту хитрость." )
	MisBeginCondition(LvCheck, ">", 37 )
	MisBeginCondition(NoMission, 635)
	MisBeginCondition(NoRecord, 635)
	MisBeginAction(AddMission, 635)
	MisBeginAction(AddTrigger, 6351, TE_GETITEM, 4093, 3 )--Скорлупа яиц зловещей черепахи
	MisCancelAction(ClearMission, 635)

	MisNeed(MIS_NEED_ITEM, 4093, 3, 10, 3)
	
	MisHelpTalk( "<t>Вы не принесли мне то о чём я Вас попросил? Так принесите!" )
	MisResultTalk( "<t>Хе-хе! Спасибо, вот Ваша награда." )
	MisResultCondition(NoRecord, 635)
	MisResultCondition(HasMission, 635)
	MisResultCondition(HasItem, 4093, 3)
	MisResultAction(TakeItem, 4093, 3 )
	MisResultAction(ClearMission, 635)
	MisResultAction(SetRecord, 635)
	MisResultAction(AddExp, 8500, 8500)
	MisResultAction(AddMoney,486,486)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4093 )	
	TriggerAction( 1, AddNextFlag, 635, 10, 3 )
	RegCurTrigger( 6351 )

-----------------------------------Зеленый мох
	DefineMission( 636, "\199\229\235\229\237\251\233 \236\238\245", 636 )
	
	MisBeginTalk( "<t>Меня очень сильно мучает язва! Я не могу больше нормально питаться из-за неё!<n><t>Пожалуйста принесите мне <p5 Зеленого мха>, что бы я смог вылечить им свою язву. Вы найдёте его в точке(732,2697)." )
	MisBeginCondition(LvCheck, ">", 38 )
	MisBeginCondition(NoMission, 636)
	MisBeginCondition(NoRecord, 636)
	MisBeginAction(AddMission, 636)
	MisBeginAction(AddTrigger, 6361, TE_GETITEM, 4094, 5 )--Зеленый мох
	MisCancelAction(ClearMission, 636)

	MisNeed(MIS_NEED_ITEM, 4094, 5, 10, 5)
	
	MisHelpTalk( "<t>Ох моя язва, я чувствую дни мои сочтены." )
	MisResultTalk( "<t>Спасибо Вам, я сейчас же сделаю себе отвар." )
	MisResultCondition(NoRecord, 636)
	MisResultCondition(HasMission, 636)
	MisResultCondition(HasItem, 4094, 5)
	MisResultAction(TakeItem, 4094, 5 )
	MisResultAction(ClearMission, 636)
	MisResultAction(SetRecord, 636)
	MisResultAction(AddExp, 9500, 9500)
	MisResultAction(AddMoney,495,495)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4094 )	
	TriggerAction( 1, AddNextFlag, 636, 10, 5 )
	RegCurTrigger( 6361 )


-----------------------------------Поиск Скользкой скалы
	DefineMission( 637, "\207\238\232\241\234 \209\234\238\235\252\231\234\238\233 \241\234\224\235\251", 637 )
	
	MisBeginTalk( "<t>Мой друг <bМас> очень любит свой город и недавно он решил сделать ремонт в своём городе Ледыни, но ему необходимы материалы.<n><t>Принесите мне <y5 Скользкой скалы> из <rГалемов> в точке(682,2592). Я передам их ему и он начнёт ремонт в городе." )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(NoMission, 637)
	MisBeginCondition(NoRecord, 637)
	MisBeginAction(AddMission, 637)
	MisBeginAction(AddTrigger, 6371, TE_GETITEM, 4455, 5 )--Скользкая скала
	MisCancelAction(ClearMission, 637)

	MisNeed(MIS_NEED_ITEM, 4455, 5, 10, 5)
	
	MisHelpTalk( "<t>Всего 5 скользкой скалы и Мас начнёт ремонт в городе!" )
	MisResultTalk( "<t>Спасибо тебе, я передам их от тебя и скажу, что это Вы помогли ему!" )
	MisResultCondition(NoRecord, 637)
	MisResultCondition(HasMission, 637)
	MisResultCondition(HasItem, 4455, 5)
	MisResultAction(TakeItem, 4455, 5 )
	MisResultAction(ClearMission, 637)
	MisResultAction(SetRecord, 637)
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney,1008,1008)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4455 )	
	TriggerAction( 1, AddNextFlag, 637, 10, 5 )
	RegCurTrigger( 6371 )



-----------------------------------Странный предсказатель
	DefineMission( 638, "\209\242\240\224\237\237\251\233 \239\240\229\228\241\234\224\231\224\242\229\235\252", 638 )
	
	MisBeginTalk( "<t>Этот мир наполнен разными людьми.<n><t>У меня есть знакомый, который занимается предсказаниями используя разные части тел. В этот раз для его предсказания ему нужен <bДлинный язык ящера>. Принесите ему, и он сможет мне предсказать судьбу. <yДлинный язык ящера> Вы сможете найти в точке(892,3273)." )
	MisBeginCondition(LvCheck, ">", 9 )
	MisBeginCondition(NoMission, 638)
	MisBeginCondition(NoRecord, 638)
	MisBeginAction(AddMission, 638)
	MisBeginAction(AddTrigger, 6381, TE_GETITEM, 4415, 5 )--Длинный язык ящера
	MisCancelAction(ClearMission, 638)

	MisNeed(MIS_NEED_ITEM, 4415, 5, 10, 5)
	
	MisHelpTalk( "<t>Помогите мне, мне так необходимо, что бы мне погодали." )
	MisResultTalk( "<t>Спасибо Вам, Вот Ваша награда!" )
	MisResultCondition(NoRecord, 638)
	MisResultCondition(HasMission, 638)
	MisResultCondition(HasItem, 4415, 5)
	MisResultAction(TakeItem, 4415, 5 )
	MisResultAction(ClearMission, 638)
	MisResultAction(SetRecord, 638)
	MisResultAction(AddExp, 120, 120)
	MisResultAction(AddMoney,299,299)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4415 )	
	TriggerAction( 1, AddNextFlag, 638, 10, 5 )
	RegCurTrigger( 6381 )

-----------------------------------Игривый Ящер-попрыгун
	DefineMission( 639, "\200\227\240\232\226\251\233 \223\249\229\240-\239\238\239\240\251\227\243\237", 639 )
	
	MisBeginTalk( "<t>Друг мой! Я больше не могу! Тут такой ужасный запах! Этот запах исходит из <rЯщера-попрыгуна>. Отправляйтесь в точку(892,3273) и убейте <r10 Ящеров-попрыгунов>. Этим Вы очистите воздух во круге." )
	MisBeginCondition(LvCheck, ">", 9 )
	MisBeginCondition(NoMission, 639)
	MisBeginCondition(NoRecord, 639)
	MisBeginAction(AddMission, 639)
	MisBeginAction(AddTrigger, 6391, TE_KILL, 62, 10 )--Ящер-попрыгун
	MisCancelAction(ClearMission, 639)

	MisNeed(MIS_NEED_KILL, 62, 10, 10, 10)
	
	MisHelpTalk( "<t>Я задыхаюсь от этого запаха." )
	MisResultTalk( "<t>Вы чувствуете, что воздух стал свежее?!" )
	MisResultCondition(NoRecord, 639)
	MisResultCondition(HasMission, 639)
	MisResultCondition(HasFlag, 639, 19 )
	MisResultAction(ClearMission, 639)
	MisResultAction(SetRecord, 639)
	MisResultAction(AddExp, 120, 120)
	MisResultAction(AddMoney,149,149)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 62 )	
	TriggerAction( 1, AddNextFlag, 639, 10, 10 )
	RegCurTrigger( 6391 )


-----------------------------------Секреция ящера-попрыгуна
	DefineMission( 640, "\209\229\234\240\229\246\232\255 \255\249\229\240\224-\239\238\239\240\251\227\243\237\224", 640 )
	
	MisBeginTalk( "<t>Я не могу понять от куда этот запах! У меня есть подозрения, что он исходит от <rящера-попрыгуна>. Отправляйтесь в точку(892,3273) и принесите мне из ящеров <y5 Секреций ящера-попрыгуна>. Я постараюсь получше разобраться с этой проблемой." )
	MisBeginCondition(LvCheck, ">", 10 )
	MisBeginCondition(NoMission, 640)
	MisBeginCondition(NoRecord, 640)
	MisBeginAction(AddMission, 640)
	MisBeginAction(AddTrigger, 6401, TE_GETITEM, 4095, 5 )--Секреция ящера-попрыгуна
	MisCancelAction(ClearMission, 640)

	MisNeed(MIS_NEED_ITEM, 4095, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не принесли мне Секрецию ящера-попрыгуна?" )
	MisResultTalk( "<t>Ох! Всё ясно! Они питаются падалью и совсем не ведут гигиену, от этого от них так и пахнет." )
	MisResultCondition(NoRecord, 640)
	MisResultCondition(HasMission, 640)
	MisResultCondition(HasItem, 4095, 5)
	MisResultAction(TakeItem, 4095, 5 )
	MisResultAction(ClearMission, 640)
	MisResultAction(SetRecord, 640)
	MisResultAction(AddExp, 150, 150)
	MisResultAction(AddMoney,318,318)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4095 )	
	TriggerAction( 1, AddNextFlag, 640, 10, 5 )
	RegCurTrigger( 6401 )


-----------------------------------Освобождение от волков
	DefineMission( 641, "\206\241\226\238\225\238\230\228\229\237\232\229 \238\242 \226\238\235\234\238\226", 641 )
	
	MisBeginTalk( "<t>Я боюсь <rВолчат>, они часто появляются в пустыне и нападают стаей. Возможно если Вы убьёте <r10 Волчат>, это отпугнуло ы их. Вы найдёте их в точке." )
	MisBeginCondition(LvCheck, ">", 10 )
	MisBeginCondition(NoMission, 641)
	MisBeginCondition(NoRecord, 641)
	MisBeginAction(AddMission, 641)
	MisBeginAction(AddTrigger, 6411, TE_KILL, 100, 10 )--Волчонок
	MisCancelAction(ClearMission, 641)

	MisNeed(MIS_NEED_KILL, 100, 10, 10, 10)
	
	MisHelpTalk( "<t>Убейте их!" )
	MisResultTalk( "<t>Спасибо, теперь мне не так страшно выходить в пустыню." )
	MisResultCondition(NoRecord, 641)
	MisResultCondition(HasMission, 641)
	MisResultCondition(HasFlag, 641, 19 )
	MisResultAction(ClearMission, 641)
	MisResultAction(SetRecord, 641)
	MisResultAction(AddExp, 150, 150)
	MisResultAction(AddMoney,159,159)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 100 )	
	TriggerAction( 1, AddNextFlag, 641, 10, 10 )
	RegCurTrigger( 6411 )

-----------------------------------Коготь волчонка
	DefineMission( 642, "\202\238\227\238\242\252 \226\238\235\247\238\237\234\224", 642 )
	
	MisBeginTalk( "<t>У меня есть друг, который занимается предсказаниями судьбы по разным частям тел. Вот он мне пообещал предсказать, что меня ждёт в будущем, если я ему принесу <b5 Когтей Волчонка>. Помогите мне, отправляйтесь в точку(687,3093) и раздобудьте мне там 5 когтей Волчонка." )
	MisBeginCondition(LvCheck, ">", 11 )
	MisBeginCondition(NoMission, 642)
	MisBeginCondition(NoRecord, 642)
	MisBeginAction(AddMission, 642)
	MisBeginAction(AddTrigger, 6421, TE_GETITEM, 4096, 5 )--Коготь волчонка
	MisCancelAction(ClearMission, 642)

	MisNeed(MIS_NEED_ITEM, 4096, 5, 10, 5)
	
	MisHelpTalk( "<t>Я не вижу Ваших стараний." )
	MisResultTalk( "<t>Спасибо Вам! Эта награда за Ваши старания." )
	MisResultCondition(NoRecord, 642)
	MisResultCondition(HasMission, 642)
	MisResultCondition(HasItem, 4096, 5)
	MisResultAction(TakeItem, 4096, 5 )
	MisResultAction(ClearMission, 642)
	MisResultAction(SetRecord, 642)
	MisResultAction(AddExp, 190, 190)
	MisResultAction(AddMoney,339,339)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4096 )	
	TriggerAction( 1, AddNextFlag, 642, 10, 5 )
	RegCurTrigger( 6421 )

-----------------------------------Кактус-Убийца
	DefineMission( 643, "\202\224\234\242\243\241-\211\225\232\233\246\224", 643 )
	
	MisBeginTalk( "<t>Мерзость! Это, безусловно, мерзость!<n><t>Я купец и много путешествую, но такую мерзость видел только тут! Вы только себе представьте - Кактусы-Убийцы, которые передвигаются по земле.<n><t>Это ужасное зрелище! Убейте 10 Кактусов, что бы путешественники видя их не пугались и в наш город ездили туристы, не боясь ужасных монстров. Вы найдёте Кактусы Убийцы в точке(884,3156)." )
	MisBeginCondition(LvCheck, ">", 12 )
	MisBeginCondition(NoMission, 643)
	MisBeginCondition(NoRecord, 643)
	MisBeginAction(AddMission, 643)
	MisBeginAction(AddTrigger, 6431, TE_KILL, 43, 10 )--Кактус-Убийца
	MisCancelAction(ClearMission, 643)

	MisNeed(MIS_NEED_KILL, 43, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы не хотите, что бы туристы приезжали к нам в город?" )
	MisResultTalk( "<t>Спасибо Вам дружище!" )
	MisResultCondition(NoRecord, 643)
	MisResultCondition(HasMission, 643)
	MisResultCondition(HasFlag, 643, 19 )
	MisResultAction(ClearMission, 643)
	MisResultAction(SetRecord, 643)
	MisResultAction(AddExp, 240, 240)
	MisResultAction(AddMoney,180,180)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 43 )	
	TriggerAction( 1, AddNextFlag, 643, 10, 10 )
	RegCurTrigger( 6431 )



-----------------------------------Горькое лекарство
	DefineMission( 644, "\195\238\240\252\234\238\229 \235\229\234\224\240\241\242\226\238", 644 )
	
	MisBeginTalk( "<t>Из-за сухого и жаркого климата, людям в пустыне не очень уютно, но есть специальная мазь, с помощью которой, легче переносить климат пустыни.<n><t>Что бы сделать такую мазь, необходимо <p5 Больших клубней кактуса>. Вы сможете найти их в точке(884,3156)." )
	MisBeginCondition(LvCheck, ">", 13 )
	MisBeginCondition(NoMission, 644)
	MisBeginCondition(NoRecord, 644)
	MisBeginAction(AddMission, 644)
	MisBeginAction(AddTrigger, 6441, TE_GETITEM, 4421, 5 )--Большой клубень кактуса
	MisCancelAction(ClearMission, 644)

	MisNeed(MIS_NEED_ITEM, 4421, 5, 10, 5)
	
	MisHelpTalk( "<t>Без этой мази очень трудно в пустыне." )
	MisResultTalk( "<t>Спасибо Вам, Вот Ваша мазь!" )
	MisResultCondition(NoRecord, 644)
	MisResultCondition(HasMission, 644)
	MisResultCondition(HasItem, 4421, 5)
	MisResultAction(TakeItem, 4421, 5 )
	MisResultAction(ClearMission, 644)
	MisResultAction(SetRecord, 644)
	MisResultAction(AddExp, 290, 290)
	MisResultAction(AddMoney,384,384)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4421 )	
	TriggerAction( 1, AddNextFlag, 644, 10, 5 )
	RegCurTrigger( 6441 )


-----------------------------------Кактусовый водный мешок
	DefineMission( 645, "\202\224\234\242\243\241\238\226\251\233 \226\238\228\237\251\233 \236\229\248\238\234", 645 )
	
	MisBeginTalk( "<t>Вы только послушайте какой секрет я узнал... Кактусы способны находиться под солнцем в пустыне очень долго времени. У них есть <yводный мешок>. Если Вы отправитесь в точку(884,3516) и принесёте мне для эксперимента 5 <bКактусовых водных мешков>, то я Вас щедро отблагодарю." )
	MisBeginCondition(LvCheck, ">", 13 )
	MisBeginCondition(NoMission, 645)
	MisBeginCondition(HasRecord, 644)
	MisBeginCondition(NoRecord, 645)
	MisBeginAction(AddMission, 645)
	MisBeginAction(AddTrigger, 6451, TE_GETITEM, 4097, 5 )--Кактусовый водный мешок(квестовый лут)
	MisCancelAction(ClearMission, 645)

	MisNeed(MIS_NEED_ITEM, 4097, 5, 10, 5)
	
	MisHelpTalk( "<t>Пока Вы не принесёте то о чём я вас попросил я не дам Вам награду!" )
	MisResultTalk( "<t>Спасибо, я обязательно узнаю их секрет! Вот Ваша награда!" )
	MisResultCondition(NoRecord, 645)
	MisResultCondition(HasMission, 645)
	MisResultCondition(HasItem, 4097, 5)
	MisResultAction(TakeItem, 4097, 5 )
	MisResultAction(ClearMission, 645)
	MisResultAction(SetRecord, 645)
	MisResultAction(AddExp, 290, 290)
	MisResultAction(AddMoney,384,384)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4097 )	
	TriggerAction( 1, AddNextFlag, 645, 10, 5 )
	RegCurTrigger( 6451 )

----------------------------------·­Гигантская злободыня
	DefineMission( 646, "\195\232\227\224\237\242\241\234\224\255 \231\235\238\225\238\228\251\237\255", 646 )
	
	MisBeginTalk( "<t>Мне интересно от куда столько Злобынь...<n><t>Убейте <r10 Гигантских злободынь> в точке (687,3093), что бы хоть как то уменьшить их численность." )
	MisBeginCondition(LvCheck, ">", 14 )
	MisBeginCondition(NoMission, 646)
	MisBeginCondition(NoRecord, 646)
	MisBeginAction(AddMission, 646)
	MisBeginAction(AddTrigger, 6461, TE_KILL, 294, 10 )--Гигантская злободыня
	MisCancelAction(ClearMission, 646)

	MisNeed(MIS_NEED_KILL, 294, 10, 10, 10)
	
	MisHelpTalk("<t>Вы не выполнели мою просьбу? Очень жаль! Может Вы всё же пойдёте и сделаете то, о чём я Вас попросил?" )
	MisResultTalk("<t>Спасибо Вам, теперь их гораздо меньше!" )
	MisResultCondition(NoRecord, 646)
	MisResultCondition(HasMission, 646)
	MisResultCondition(HasFlag, 646, 19 )
	MisResultAction(ClearMission, 646)
	MisResultAction(SetRecord, 646)
	MisResultAction(AddExp, 360, 360)
	MisResultAction(AddMoney,204,204)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 294 )	
	TriggerAction( 1, AddNextFlag, 646, 10, 10 )
	RegCurTrigger( 6461 )

-----------------------------------Горький фрукт
	DefineMission( 647, "\195\238\240\252\234\232\233 \244\240\243\234\242", 647 )
	
	MisBeginTalk( "<t><bГорький фрукт> от <rГигантской злободыни> горький, но очень сочный.<n><t>Теперешняя молодежь использует <bГорький фрукт> для напитка.<n><t>Я сам лично изготовляю этот напиток, но у меня закончились запасы <bГорького Фрукта>. Если Вы мне принесёте <b5 Горьких Фруктов> с <rГигантской злободыни> в точке(687,3097), то я буду Вам очень сильно благодарен." )
	MisBeginCondition(LvCheck, ">", 14 )
	MisBeginCondition(NoMission, 647)
	MisBeginCondition(NoRecord, 647)
	MisBeginAction(AddMission, 647)
	MisBeginAction(AddTrigger, 6471, TE_GETITEM, 4475, 5 )--Горький фрукт
	MisCancelAction(ClearMission, 647)

	MisNeed(MIS_NEED_ITEM, 4475, 5, 10, 5)
	
	MisHelpTalk( "<t>Как, Вы ещё не принесли мне Горький Фрукт? Поторопитесь!" )
	MisResultTalk( "<t>Спасибо Вам, теперь я очень Вам благодарен!" )
	MisResultCondition(NoRecord, 647)
	MisResultCondition(HasMission, 647)
	MisResultCondition(HasItem, 4475, 5)
	MisResultAction(TakeItem, 4475, 5 )
	MisResultAction(ClearMission, 647)
	MisResultAction(SetRecord, 647)
	MisResultAction(AddExp, 360, 360)
	MisResultAction(AddMoney,408,408)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4475 )	
	TriggerAction( 1, AddNextFlag, 647, 10, 5 )
	RegCurTrigger( 6471 )

----------------------------------Легенда о Древопризраке
	DefineMission( 648, "\203\229\227\229\237\228\224 \238 \196\240\229\226\238\239\240\232\231\240\224\234\229", 648 )
	
	MisBeginTalk( "<t>Ходят слухи, что <rДревопризрак> символизирует обречённость.<n><t>Эти <rДревопризраки> настоящее исчадие зла! Пожалуйста уничтожьте <r10 Древопризраков> в точке(885,3027) и положите начало уничтожению нечести." )
	MisBeginCondition(LvCheck, ">", 15 )
	MisBeginCondition(NoMission, 648)
	MisBeginCondition(NoRecord, 648)
	MisBeginAction(AddMission, 648)
	MisBeginAction(AddTrigger, 6481, TE_KILL, 203, 10 )--Древопризрак
	MisCancelAction(ClearMission, 648)

	MisNeed(MIS_NEED_KILL, 203, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не убили 10 Древопризраков!" )
	MisResultTalk( "<t>Спасибо Вам!" )
	MisResultCondition(NoRecord, 648)
	MisResultCondition(HasMission, 648)
	MisResultCondition(HasFlag, 648, 19 )
	MisResultAction(ClearMission, 648)
	MisResultAction(SetRecord, 648)
	MisResultAction(AddExp, 450, 450)
	MisResultAction(AddMoney,216,216)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 203 )	
	TriggerAction( 1, AddNextFlag, 648, 10, 10 )
	RegCurTrigger( 6481 )


-----------------------------------Вернуть праздник
	DefineMission( 649, "\194\229\240\237\243\242\252 \239\240\224\231\228\237\232\234", 649 )
	
	MisBeginTalk( "<t>Когда есть вода, это праздник для жителей пустыни, но этот праздник могут испортить <rДревопризраки>, у них есть корни, которыми они поглощают всю воду и жителям не хватает воды. Принесите мне <y5 Корней древопризрака>, что бы я смог разобраться, как им удаётся поглощать всю воду в пустыне." )
	MisBeginCondition(LvCheck, ">", 16 )
	MisBeginCondition(NoMission, 649)
	MisBeginCondition(NoRecord, 649)
	MisBeginAction(AddMission, 649)
	MisBeginAction(AddTrigger, 6491, TE_GETITEM, 4098, 5 )--Корень древопризрака
	MisCancelAction(ClearMission, 649)

	MisNeed(MIS_NEED_ITEM, 4098, 5, 10, 5)
	
	MisHelpTalk( "<t>Вода пустыни под угрозой." )
	MisResultTalk( "<t>Сасибо, возможно разобравшись в этих корнях я смогу придумать, как спасти воду!" )
	MisResultCondition(NoRecord, 649)
	MisResultCondition(HasMission, 649)
	MisResultCondition(HasItem, 4098, 5)
	MisResultAction(TakeItem, 4098, 5 )
	MisResultAction(ClearMission, 649)
	MisResultAction(SetRecord, 649)
	MisResultAction(AddExp, 550, 550)
	MisResultAction(AddMoney,459,459)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4098 )	
	TriggerAction( 1, AddNextFlag, 649, 10, 5 )
	RegCurTrigger( 6491 )

-----------------------------------Превосходный случай
	DefineMission( 650, "\207\240\229\226\238\241\245\238\228\237\251\233 \241\235\243\247\224\233", 650 )
	
	MisBeginTalk( "<t>*Хнык* Я всего лишь простая несчастная женщина. Однако этим беспощадным Бандитам было всё равно на меня и на мою судьбу, они ограбили меня и забрали последнее что осталось от моей матери. Они забрали <yНефритовый браслет> и отнесли его к себе в лагерь.<n><t>Вы не могли бы заступиться за бедную и несчастную женщину и вернуть <yНефритовый браслет>. Лагерь бандитов находится в точке(716,3290). Заберите у них мой <bНефритовый браслет>." )
	MisBeginCondition(LvCheck, ">", 17 )
	MisBeginCondition(NoMission, 650)
	MisBeginCondition(NoRecord, 650)
	MisBeginAction(AddMission, 650)
	MisBeginAction(AddTrigger, 6501, TE_GETITEM, 4099, 1 )
	MisCancelAction(ClearMission, 650)

	MisNeed(MIS_NEED_ITEM, 4099, 1, 10, 1)
	
	MisHelpTalk( "<t>*Хнык* Моя Мама... У меня больше нет о тебе памяти!" )
	MisResultTalk( "<t>Ах! как это благородно с Вашей стороны! Спасибо Вам!" )
	MisResultCondition(NoRecord, 650)
	MisResultCondition(HasMission, 650)
	MisResultCondition(HasItem, 4099, 1)
	MisResultAction(TakeItem, 4099, 1 )
	MisResultAction(ClearMission, 650)
	MisResultAction(SetRecord, 650)
	MisResultAction(AddExp, 650, 650)
	MisResultAction(AddMoney,242,242)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4099 )	
	TriggerAction( 1, AddNextFlag, 650, 10, 1 )
	RegCurTrigger( 6501 )


----------------------------------Избавление от бандитов
	DefineMission( 651, "\200\231\225\224\226\235\229\237\232\229 \238\242 \225\224\237\228\232\242\238\226", 651 )
	
	MisBeginTalk( "<t><rПесчаные разбойники> приходят из пустыни. Они  грабят не только торговцев, но и  беспомощных женщин и детей.<n><t>Жители деревень пришли с наградой, чтобы избавиться от них. Вы можете помочь нам? Выследите 10 <rПесчаных разбойников> в точке (716,3290)." )
	MisBeginCondition(LvCheck, ">", 18 )
	MisBeginCondition(NoMission, 651)
	MisBeginCondition(NoRecord, 651)
	MisBeginAction(AddMission, 651)
	MisBeginAction(AddTrigger, 6511, TE_KILL, 131, 10 )--Песчаный разбойник
	MisCancelAction(ClearMission, 651)

	MisNeed(MIS_NEED_KILL, 131, 10, 10, 10)
	
	MisHelpTalk("<t>Убейте Разбойников и получите награду!" )
	MisResultTalk("<t>Превосходно! Вот Ваша награда." )
	MisResultCondition(NoRecord, 651)
	MisResultCondition(HasMission, 651)
	MisResultCondition(HasFlag, 651, 19 )
	MisResultAction(ClearMission, 651)
	MisResultAction(SetRecord, 651)
	MisResultAction(AddExp, 750, 750)
	MisResultAction(AddMoney,256,256)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 131 )	
	TriggerAction( 1, AddNextFlag, 651, 10, 10 )
	RegCurTrigger( 6511 )

----------------------------------Ужасные Голодные волки
	DefineMission( 652, "\211\230\224\241\237\251\229 \195\238\235\238\228\237\251\229 \226\238\235\234\232", 652 )
	
	MisBeginTalk( "<t>Я набираю добровольцев на борьбу с  <rГолоднами волками>.<n><t>Они заставляют путешественников обходить наши земли стороной<n><t>Если Вы поможете убить 10 <rГолодных волков> в точке (718,2938), я щедро Вас вознагражу." )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 652)
	MisBeginCondition(NoRecord, 652)
	MisBeginAction(AddMission, 652)
	MisBeginAction(AddTrigger, 6521, TE_KILL, 101, 10 )--Голодный волк
	MisCancelAction(ClearMission, 652)

	MisNeed(MIS_NEED_KILL, 101, 10, 10, 10)
	
	MisHelpTalk( "<t>Убейте Голодных Волков и Вы получите вознаграждение." )
	MisResultTalk( "<t>Очень хорошо! Вот Ваша награда." )
	MisResultCondition(NoRecord, 652)
	MisResultCondition(HasMission, 652)
	MisResultCondition(HasFlag, 652, 19 )
	MisResultAction(ClearMission, 652)
	MisResultAction(SetRecord, 652)
	MisResultAction(AddExp, 880, 880)
	MisResultAction(AddMoney,270,270)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 101 )	
	TriggerAction( 1, AddNextFlag, 652, 10, 10 )
	RegCurTrigger( 6521 )

----------------------------------Восстание Пустынной черепахи
	DefineMission( 653, "\194\238\241\241\242\224\237\232\229 \207\243\241\242\251\237\237\238\233 \247\229\240\229\239\224\245\232", 653 )
	
	MisBeginTalk( "<t>Я не знаю, что случилось с <rПесчаными черепахами>, они разбрелись по пустыне и нападают на всех подряд!<n><t>Можете ли вы помочь мне убить 10 <rПесчанных черепах> в точке (1197,3270)?" )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 653)
	MisBeginCondition(NoRecord, 653)
	MisBeginAction(AddMission, 653)
	MisBeginAction(AddTrigger, 6531, TE_KILL, 134, 10 )--Пустынная черепаха
	MisCancelAction(ClearMission, 653)

	MisNeed(MIS_NEED_KILL, 134, 10, 10, 10)
	
	MisHelpTalk( "<t>Пожалуйста! Убейте их!" )
	MisResultTalk( "<t>Очень хорошо!" )
	MisResultCondition(NoRecord, 653)
	MisResultCondition(HasMission, 653)
	MisResultCondition(HasFlag, 653, 19 )
	MisResultAction(ClearMission, 653)
	MisResultAction(SetRecord, 653)
	MisResultAction(AddExp, 880, 880)
	MisResultAction(AddMoney,270,270)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 134 )	
	TriggerAction( 1, AddNextFlag, 653, 10, 10 )
	RegCurTrigger( 6531 )

-----------------------------------Перемещение Сада
	DefineMission( 654, "\207\229\240\229\236\229\249\229\237\232\229 \209\224\228\224", 654 )
	
	MisBeginTalk( "<t><rПесчаные черепахи> медленные, но огромные существа. Они под своим панцирем прячут пустынное зернышко.<n><t>Мне очень нужны эти семена. Можете ли Вы собирать для меня  <y5Пустынных зернышек> из <rПесчаных черепах> в точке (1197,3270)?" )
	MisBeginCondition(LvCheck, ">", 20 )
	MisBeginCondition(NoMission, 654)
	MisBeginCondition(NoRecord, 654)
	MisBeginAction(AddMission, 654)
	MisBeginAction(AddTrigger, 6541, TE_GETITEM, 4466, 5 )
	MisCancelAction(ClearMission, 654)

	MisNeed(MIS_NEED_ITEM, 4466, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы мне разве не поможете?" )
	MisResultTalk( "<t>Большое Вам спасибо!" )
	MisResultCondition(NoRecord, 654)
	MisResultCondition(HasMission, 654)
	MisResultCondition(HasItem, 4466, 5)
	MisResultAction(TakeItem, 4466, 5 )
	MisResultAction(ClearMission, 654)
	MisResultAction(SetRecord, 654)
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney,571,571)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4466 )	
	TriggerAction( 1, AddNextFlag, 654, 10, 5 )
	RegCurTrigger( 6541 )

----------------------------------Препорат
	DefineMission( 655, "\207\240\229\239\238\240\224\242", 655 )
	
	MisBeginTalk( "<t>Я готовлюсь отправить торговый караван в <bАргент>.<n><t>Но мне придется пройти через лагерь <pПесчаных Бандитов>. Я боюсь, что они ограбят меня.<n><t>Не могли бы Вы убить 10 Песчаных Бандитов? Мой путь лежит через точку(1339,3300)." )
	MisBeginCondition(LvCheck, ">", 21 )
	MisBeginCondition(NoMission, 655)
	MisBeginCondition(NoRecord, 655)
	MisBeginAction(AddMission, 655)
	MisBeginAction(AddTrigger, 6551, TE_KILL, 45, 10 )--Песчаный бандит
	MisCancelAction(ClearMission, 655)

	MisNeed(MIS_NEED_KILL, 45, 10, 10, 10)
	
	MisHelpTalk( "<t>Я сомневаюсь, что путь стал безопаснее!" )
	MisResultTalk( "<t>Спасибо большое! Теперь мне нечего опасаться." )
	MisResultCondition(NoRecord, 655)
	MisResultCondition(HasMission, 655)
	MisResultCondition(HasFlag, 655, 19 )
	MisResultAction(ClearMission, 655)
	MisResultAction(SetRecord, 655)
	MisResultAction(AddExp, 1200, 1200)
	MisResultAction(AddMoney,300,300)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 45 )	
	TriggerAction( 1, AddNextFlag, 655, 10, 10 )
	RegCurTrigger( 6551 )

-----------------------------------Грибной суп
	DefineMission( 656, "\195\240\232\225\237\238\233 \241\243\239", 656 )
	
	MisBeginTalk( "<t>Ах... Когда я смотрю на эти <rПесчаные грибы>, то у меня сразу перед глазами становится образ Грибного супа!<n><t>Я так хочу попробовать этот суп...<n><t>Принесите мне <y5 Зонтичных грибa>, что бы я смог сварить замечательный Грибной суп. Вы найдёте <rПесчаные грибы> в точке(1334,3438)." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(NoMission, 656)
	MisBeginCondition(NoRecord, 656)
	MisBeginAction(AddMission, 656)
	MisBeginAction(AddTrigger, 6561, TE_GETITEM, 4476, 5 )--Зонтичный гриб
	MisCancelAction(ClearMission, 656)

	MisNeed(MIS_NEED_ITEM, 4476, 5, 10, 5)
	
	MisHelpTalk( "<t>Я так хочу грибной суп, а Вы до сих пор не принесли мне 5 Зонтичных Грибов." )
	MisResultTalk( "<t>Спасибо Вам! Заходите на Грибной суп попозже." )
	MisResultCondition(NoRecord, 656)
	MisResultCondition(HasMission, 656)
	MisResultCondition(HasItem, 4476, 5)
	MisResultAction(TakeItem, 4476, 5 )
	MisResultAction(ClearMission, 656)
	MisResultAction(SetRecord, 656)
	MisResultAction(AddExp, 1400, 1400)
	MisResultAction(AddMoney,632,632)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4476 )	
	TriggerAction( 1, AddNextFlag, 656, 10, 5 )
	RegCurTrigger( 6561 )

-----------------------------------Беглец
	DefineMission( 657, "\193\229\227\235\229\246", 657 )
	
	MisBeginTalk( "<t>Я люблю заниматься садоводством.<n><t>Дня 2 назад я гуляла в своём саду и заметила, что чего то не хватает.<n><t>Осмотрев свой сад я поняла, что нехватает <bГрибов>. Но без них я не вижу полноценности моего сада.<n><t>Вы не помогли бы мне принести <y5 Пустынных спор>, что бы я по новой смогла развести Грибы в своём саду.<n><t>Грибы Вы найдёте в точке(1334,3438)." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(NoMission, 657)
	MisBeginCondition(NoRecord, 657)
	MisBeginAction(AddMission, 657)
	MisBeginAction(AddTrigger, 6571, TE_GETITEM, 4100, 5 )--Пустынная спора(квестовый лут)
	MisCancelAction(ClearMission, 657)

	MisNeed(MIS_NEED_ITEM, 4100, 5, 10, 5)
	
	MisHelpTalk( "<t>Я не смогу развести в своём саду Грибы без Вашей помощи!" )
	MisResultTalk( "<t>Спасибо, как только Грибы приживутся, мой сад будет самым лучшим садом в мире!" )
	MisResultCondition(NoRecord, 657)
	MisResultCondition(HasMission, 657)
	MisResultCondition(HasItem, 4100, 5)
	MisResultAction(TakeItem, 4100, 5 )
	MisResultAction(ClearMission, 657)
	MisResultAction(SetRecord, 657)
	MisResultAction(AddExp, 1400, 1400)
	MisResultAction(AddMoney,316,316)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4100 )	
	TriggerAction( 1, AddNextFlag, 657, 10, 5 )
	RegCurTrigger( 6571 )

-----------------------------------Грязь и магия
	DefineMission( 658, "\195\240\255\231\252 \232 \236\224\227\232\255", 658 )
	
	MisBeginTalk( "<t>Эй! Друг! Вы как раз вовремя! У нас проводят ежегодный конкурс грязи и тот у кого будет больше грязи тот получит магический Шар, который сможет предсказывать будущее. Помогите мне добыть <b5 Зараженной грязи> из <rГрязедемона> обитающего в точке(1438,3414) и тогда я выиграю этот магический Шар, я буду Вам очень благодарен и заплачу хорошие деньги за это." )
	MisBeginCondition(LvCheck, ">", 23 )
	MisBeginCondition(NoMission, 658)
	MisBeginCondition(NoRecord, 658)
	MisBeginAction(AddMission, 658)
	MisBeginAction(AddTrigger, 6581, TE_GETITEM, 4436, 5 )--Зараженная грязь
	MisCancelAction(ClearMission, 658)

	MisNeed(MIS_NEED_ITEM, 4436, 5, 10, 5)
	
	MisHelpTalk( "<t>Я выйграю этот Шар только если вы мне поможите!" )
	MisResultTalk( "<t>Спасибо Вам!" )
	MisResultCondition(NoRecord, 658)
	MisResultCondition(HasMission, 658)
	MisResultCondition(HasItem, 4436, 5)
	MisResultAction(TakeItem, 4436, 5 )
	MisResultAction(ClearMission, 658)
	MisResultAction(SetRecord, 658)
	MisResultAction(AddExp, 1600, 1600)
	MisResultAction(AddMoney,664,664)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4436 )	
	TriggerAction( 1, AddNextFlag, 658, 10, 5 )
	RegCurTrigger( 6581 )

----------------------------------Грязедемон
	DefineMission( 659, "\195\240\255\231\229\228\229\236\238\237", 659 )
	
	MisBeginTalk( "<t>Бррр, я грязный! Это всё из-за <rГрязедемона>!<n><t>Эти <rГрязедемоны> стали очень злыми в последнее время, и все кто подходит к ним становятся их жертвами! Ваша задача будет убить <r10 Грязедемонов> и показать им, кто главнее. Вы найдёте их в точке(1438,3413)." )
	MisBeginCondition(LvCheck, ">", 23 )
	MisBeginCondition(NoMission, 659)
	MisBeginCondition(NoRecord, 659)
	MisBeginAction(AddMission, 659)
	MisBeginAction(AddTrigger, 6591, TE_KILL, 251, 10 )--Грязедемон
	MisCancelAction(ClearMission, 659)

	MisNeed(MIS_NEED_KILL, 251, 10, 10, 10)
	
	MisHelpTalk( "<t>Похоже они Вас победили! И они главнее?! Вы так думаете? Идите и докажите им обратное!" )
	MisResultTalk( "<t>Вы справелись с этим! Вы настоящий герой!" )
	MisResultCondition(NoRecord, 659)
	MisResultCondition(HasMission, 659)
	MisResultCondition(HasFlag, 659, 19 )
	MisResultAction(ClearMission, 659)
	MisResultAction(SetRecord, 659)
	MisResultAction(AddExp, 1600, 1600)
	MisResultAction(AddMoney,332,332)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 251 )	
	TriggerAction( 1, AddNextFlag, 659, 10, 10 )
	RegCurTrigger( 6591 )

----------------------------------Опасные Рейдеры
	DefineMission( 660, "\206\239\224\241\237\251\229 \208\229\233\228\229\240\251", 660 )
	
	MisBeginTalk( "<t><rПесчаные Бандиты> властвуют в течении долгого времени в пустыне <bШайтана>. Они на столько жестоки, что убивают всех кого повстречают у себя на пути. Их основной лагерь в точке(13027,3011). Отправляйтесь к ним в лагерь и убейте 10 <rПесчаных всадников>. Этим Вы утихомирите их пыл и они начнут уважать законы!" )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 660)
	MisBeginCondition(NoRecord, 660)
	MisBeginAction(AddMission, 660)
	MisBeginAction(AddTrigger, 6601, TE_KILL, 49, 10 )--Песчаный всадник
	MisCancelAction(ClearMission, 660)

	MisNeed(MIS_NEED_KILL, 49, 10, 10, 10)
	
	MisHelpTalk( "<t>Пока вы их не накажете они так и будут безнаказано убивать каждого встречного." )
	MisResultTalk( "<t>Спасибо Вам, Вы преподали им урок!" )
	MisResultCondition(NoRecord, 660)
	MisResultCondition(HasMission, 660)
	MisResultCondition(HasFlag, 660, 19 )
	MisResultAction(ClearMission, 660)
	MisResultAction(SetRecord, 660)
	MisResultAction(AddExp, 1800, 1800)
	MisResultAction(AddMoney,348,348)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 49 )	
	TriggerAction( 1, AddNextFlag, 660, 10, 10 )
	RegCurTrigger( 6601 )

----------------------------------Искоренение пауков
	DefineMission( 661, "\200\241\234\238\240\229\237\229\237\232\229 \239\224\243\234\238\226", 661 )
	
	MisBeginTalk( "<t>Я раньше очень любил гулять  вдоль пляжа, но сейчас там опасно из-за <rПауков-каннибалов>. Убейте пожалуйста <r10 Пауков-каннибалов>, что бы можно стало опять гулять  вдоль берега. Вы натолкнётесь на них в точке(1093,2948)!" )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 661)
	MisBeginCondition(NoRecord, 661)
	MisBeginAction(AddMission, 661)
	MisBeginAction(AddTrigger, 6611, TE_KILL, 210, 10 )--Паук-каннибал
	MisCancelAction(ClearMission, 661)

	MisNeed(MIS_NEED_KILL, 210, 10, 10, 10)
	
	MisHelpTalk( "<t>На пляже так же небезопасно как и раньше!" )
	MisResultTalk( "<t>Спасибо Вам, тепрь я могу как и прежде гулять по пляжу!" )
	MisResultCondition(NoRecord, 661)
	MisResultCondition(HasMission, 661)
	MisResultCondition(HasFlag, 661, 19 )
	MisResultAction(ClearMission, 661)
	MisResultAction(SetRecord, 661)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,365,365)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 210 )	
	TriggerAction( 1, AddNextFlag, 661, 10, 10 )
	RegCurTrigger( 6611 )

-----------------------------------Ходки волков
	DefineMission( 662, "\213\238\228\234\232 \226\238\235\234\238\226", 662 )
	
	MisBeginTalk( "<t>Мне интересно, почему <rДикие волки> могут перемещаться на двух ногах как человек. Отправляйтесь в точку(1473,3295) и достаньте для меня из <rДиких волков> <y5 Огромных волчих когтей>.<n><t>Возможно я смогу понять их секрет!" )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 662)
	MisBeginCondition(NoRecord, 662)
	MisBeginAction(AddMission, 662)
	MisBeginAction(AddTrigger, 6621, TE_GETITEM, 4439, 5 )--Огромный волчий коготь
	MisCancelAction(ClearMission, 662)

	MisNeed(MIS_NEED_ITEM, 4439, 5, 10, 5)
	
	MisHelpTalk("<t>Хм.. Странно, но Вы мне ни чего не принесли." )
	MisResultTalk("<t>Ага! Я так и думал! Они Мутанты!" )
	MisResultCondition(NoRecord, 662)
	MisResultCondition(HasMission, 662)
	MisResultCondition(HasItem, 4439, 5)
	MisResultAction(TakeItem, 4439, 5 )
	MisResultAction(ClearMission, 662)
	MisResultAction(SetRecord, 662)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,730,730)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4439 )	
	TriggerAction( 1, AddNextFlag, 662, 10, 5 )
	RegCurTrigger( 6621 )

-----------------------------------Золотой паук
	DefineMission( 663, "\199\238\235\238\242\238\233 \239\224\243\234", 663 )
	
	MisBeginTalk( "<t>Дорогой друг! Вы как раз вовремя! Пауки украли у меня <yМешок с Золотом> и унесли в точку(1093,2948). Отправляйтесь туда и верните мой <yМешочек с золотом>, я не останусь в долгу перед Вами." )
	MisBeginCondition(LvCheck, ">", 26 )
	MisBeginCondition(NoMission, 663)
	MisBeginCondition(NoRecord, 663)
	MisBeginAction(AddMission, 663)
	MisBeginAction(AddTrigger, 6631, TE_GETITEM, 4101, 1 )--Мешочек с золотом
	MisCancelAction(ClearMission, 663)

	MisNeed(MIS_NEED_ITEM, 4101, 1, 10, 1)
	
	MisHelpTalk( "<t>О каком вознаграждении Вы говорите? Я не вижу своего Мешка с золотом!" )
	MisResultTalk( "<t>Вот он мой родненький! Вот Ваша награда! Спасибо Вам огромное!" )
	MisResultCondition(NoRecord, 663)
	MisResultCondition(HasMission, 663)
	MisResultCondition(HasItem, 4101, 1)
	MisResultAction(TakeItem, 4101, 1 )
	MisResultAction(ClearMission, 663)
	MisResultAction(SetRecord, 663)
	MisResultAction(AddExp, 2400, 2400)
	MisResultAction(AddMoney,382,382)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4101 )	
	TriggerAction( 1, AddNextFlag, 663, 10, 1 )
	RegCurTrigger( 6631 )

-----------------------------------Ключник
	DefineMission( 664, "\202\235\254\247\237\232\234", 664 )
	
	MisBeginTalk( "<t>Тссс! пожалуйста говорите тише!<n><t>Моя подруга собирается бежать со своим парнем из дому, так как им запрещают встречаться её родители. Только тссс!<n><t>Я благословляю их и хочу дать им подарок. Это ключи, пусть они будут ключами от их счастья.<n><t>Отправляйтесь в точку(1255,2974) и принесите из <rВсадников> Два <yГлавных ключа>. Только это большая тайна влюблённых, не говорите ни кому о их побеге!" )
	MisBeginCondition(LvCheck, ">", 26 )
	MisBeginCondition(NoMission, 664)
	MisBeginCondition(NoRecord, 664)
	MisBeginAction(AddMission, 664)
	MisBeginAction(AddTrigger, 6641, TE_GETITEM, 4478, 2 )--Главный ключ
	MisCancelAction(ClearMission, 664)

	MisNeed(MIS_NEED_ITEM, 4478, 2, 10, 2)
	
	MisHelpTalk( "<t>А за что я должен Вас благодарить? Вы ещё не принесли мне 2 Главных ключа!" )
	MisResultTalk( "<t>Спасибо Друг!" )
	MisResultCondition(NoRecord, 664)
	MisResultCondition(HasMission, 664)
	MisResultCondition(HasItem, 4478, 2)
	MisResultAction(TakeItem, 4478, 2 )
	MisResultAction(ClearMission, 664)
	MisResultAction(SetRecord, 664)
	MisResultAction(AddExp, 2400, 2400)
	MisResultAction(AddMoney,765,765)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4478 )	
	TriggerAction( 1, AddNextFlag, 664, 10, 2 )
	RegCurTrigger( 6641 )

----------------------------------Предводитель песчаных бандитов - Гарет
	DefineMission( 665, "\207\240\229\228\226\238\228\232\242\229\235\252 \239\229\241\247\224\237\251\245 \225\224\237\228\232\242\238\226 - \195\224\240\229\242", 665 )
	
	MisBeginTalk( "<t>Как говориться в очень мудрой пословице: Рубите проблему на корню!<n><t>Большой проблемой является в Пустыне, нападения Бандитов и разбойников. Убейте их Вожака в точке(1170,3026) и нападений станет значительно меньше!" )
	MisBeginCondition(LvCheck, ">", 27 )
	MisBeginCondition(NoMission, 665)
	MisBeginCondition(NoRecord, 665)
	MisBeginAction(AddMission, 665)
	MisBeginAction(AddTrigger, 6651, TE_KILL, 106, 1 )--Предводитель песчаных бандитов - Гарет
	MisCancelAction(ClearMission, 665)

	MisNeed(MIS_NEED_KILL, 106, 1, 10, 1)
	
	MisHelpTalk( "<t>Вы ещё не убили Предводителя песчаных бандитов - Гарета!" )
	MisResultTalk( "<t>Хе-хе! Вы положили начало концу приступности!" )
	MisResultCondition(NoRecord, 665)
	MisResultCondition(HasMission, 665)
	MisResultCondition(HasFlag, 665, 10 )
	MisResultAction(ClearMission, 665)
	MisResultAction(SetRecord, 665)
	MisResultAction(AddExp, 2700, 2700)
	MisResultAction(AddMoney,400,400)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 106 )	
	TriggerAction( 1, AddNextFlag, 665, 10, 1 )
	RegCurTrigger( 6651 )

----------------------------------Вызов кавалерии
	DefineMission( 666, "\194\251\231\238\226 \234\224\226\224\235\229\240\232\232", 666 )
	
	MisBeginTalk( "<t><bВсадники> в пустыне наводят страх на жителей Шайтана. Свирепее их нет бандитов!<n><t>Докажите свою доблесть убив в точке(1255,2974) <r10 Всадников>!" )
	MisBeginCondition(LvCheck, ">", 28 )
	MisBeginCondition(NoMission, 666)
	MisBeginCondition(NoRecord, 666)
	MisBeginAction(AddMission, 666)
	MisBeginAction(AddTrigger, 6661, TE_KILL, 200, 10 )--Всадник
	MisCancelAction(ClearMission, 666)

	MisNeed(MIS_NEED_KILL, 200, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы не доказали свою доблесть." )
	MisResultTalk( "<t>Теперь я вижу, что Вы настоящий борец за справедливость!" )
	MisResultCondition(NoRecord, 666)
	MisResultCondition(HasMission, 666)
	MisResultCondition(HasFlag, 666, 19 )
	MisResultAction(ClearMission, 666)
	MisResultAction(SetRecord, 666)
	MisResultAction(AddExp, 3000, 3000)
	MisResultAction(AddMoney,417,417)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 200 )	
	TriggerAction( 1, AddNextFlag, 666, 10, 10 )
	RegCurTrigger( 6661 )

-----------------------------------Корона ящера
	DefineMission( 667, "\202\238\240\238\237\224 \255\249\229\240\224", 667 )
	
	MisBeginTalk( "<t>Ну не может носить животное корону счетая себя королём! В точке(1507,2970) обитают <rКороли ящеров> и носят короны! Принеси мне <y10 корон ящера> что бы мы смогли положить конец этой неспраедливости." )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 667)
	MisBeginCondition(NoRecord, 667)
	MisBeginAction(AddMission, 667)
	MisBeginAction(AddTrigger, 6671, TE_GETITEM, 1757, 10 )--Корона ящера
	MisCancelAction(ClearMission, 667)

	MisNeed(MIS_NEED_ITEM, 1757, 10, 10, 10)
	
	MisHelpTalk( "<t>Что? Несите мне эти короны или Вы тоже против Королевы?!" )
	MisResultTalk( "<t>Спасибо! Это начало революции!" )
	MisResultCondition(NoRecord, 667)
	MisResultCondition(HasMission, 667)
	MisResultCondition(HasItem, 1757, 10)
	MisResultAction(TakeItem, 1757, 10 )
	MisResultAction(ClearMission, 667)
	MisResultAction(SetRecord, 667)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,849,849)


	InitTrigger()
	TriggerCondition( 1, IsItem, 1757 )	
	TriggerAction( 1, AddNextFlag, 667, 10, 10 )
	RegCurTrigger( 6671 )

-----------------------------------Шапочка пингвина-морячка
	DefineMission( 668, "\216\224\239\238\247\234\224 \239\232\237\227\226\232\237\224-\236\238\240\255\247\234\224", 668 )
	
	MisBeginTalk( "<t>Эй! Задержись на минуту! Можете мне помочь? Вчера я видел милого <r Пингвина-морячка>. Мне очень понравилась его <yШапочка пингвина-морячка>! Я хочу её получить!<n><t>Принесите мне, пожалуйста, 2 <yШапочки пингвина-морячка> от <rПингвина-морячка>.Ты их найдешь в точке (995,365)!" )
	MisBeginCondition(LvCheck, ">", 9 )
	MisBeginCondition(NoMission, 668)
	MisBeginCondition(NoRecord, 668)
	MisBeginAction(AddMission, 668)
	MisBeginAction(AddTrigger, 6681, TE_GETITEM, 4102, 2 )--Шапочка пингвина-морячка
	MisCancelAction(ClearMission, 668)

	MisNeed(MIS_NEED_ITEM, 4102, 2, 10, 2)
	
	MisHelpTalk("<t>Я хочу получить эту <yШапочку пингвина-морячка> чего бы это мне ни стояло." )
	MisResultTalk("<t>Ох! Спасибо, она очень мне нравится!" )
	MisResultCondition(NoRecord, 668)
	MisResultCondition(HasMission, 668)
	MisResultCondition(HasItem, 4102, 2)
	MisResultAction(TakeItem, 4102, 2 )
	MisResultAction(ClearMission, 668)
	MisResultAction(SetRecord, 668)
	MisResultAction(AddExp, 120, 120)
	MisResultAction(AddMoney,299,299)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4102 )	
	TriggerAction( 1, AddNextFlag, 668, 10, 2 )
	RegCurTrigger( 6681 )

-----------------------------------Сердце наяды
	DefineMission( 669, "\209\229\240\228\246\229 \237\224\255\228\251", 669 )
	
	MisBeginTalk( "<t><bНаяда> является мирным и самым спокойным существом. Ходит легенда, что обладатель <yсердца наяды> приобретёт спокойствие Наяды. Принесите мне два <yсердца Наяды>, что бы я проверил эту легенду." )
	MisBeginCondition(LvCheck, ">", 9 )
	MisBeginCondition(NoMission, 669)
	MisBeginCondition(NoRecord, 669)
	MisBeginAction(AddMission, 669)
	MisBeginAction(AddTrigger, 6691, TE_GETITEM, 4418, 2 )--Сердце наяды
	MisCancelAction(ClearMission, 669)

	MisNeed(MIS_NEED_ITEM, 4418, 2, 10, 2)
	
	MisHelpTalk( "<t>Что бы проверить эту легенду мне необходимо 2 <yсердца наяды>." )
	MisResultTalk( "<t>Спасибо! я тут же начну проверять свои нервишки." )
	MisResultCondition(NoRecord, 669)
	MisResultCondition(HasMission, 669)
	MisResultCondition(HasItem, 4418, 2)
	MisResultAction(TakeItem, 4418, 2 )
	MisResultAction(ClearMission, 669)
	MisResultAction(SetRecord, 669)
	MisResultAction(AddExp, 120, 120)
	MisResultAction(AddMoney,299,299)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4418 )	
	TriggerAction( 1, AddNextFlag, 669, 10, 2 )
	RegCurTrigger( 6691 )

-----------------------------------Идеальный кристалл
	DefineMission( 670, "\200\228\229\224\235\252\237\251\233 \234\240\232\241\242\224\235\235", 670 )
	
	MisBeginTalk( "<t>Все кристаллы имеют дефекты. Однако, <rНаяда> способна убирать с кристаллов дефекты и убив наяду можно получить <yИдеальный кристалл>. Вы смогли бы принести мне 5 <yИдеальных кристаллов>, я бы Вас отблагодарил бы за это!<n><t>Наяду Вы найдёте в точке(1079,518)." )
	MisBeginCondition(LvCheck, ">", 10 )
	MisBeginCondition(NoMission, 670)
	MisBeginCondition(NoRecord, 670)
	MisBeginAction(AddMission, 670)
	MisBeginAction(AddTrigger, 6701, TE_GETITEM, 4103, 5 )--Безупречный кристалл(квестовый лут)
	MisCancelAction(ClearMission, 670)

	MisNeed(MIS_NEED_ITEM, 4103, 5, 10, 5)
	
	MisHelpTalk( "<t>Наяда хоть и миролюбивое существо и её жалко убивать, но мне нужны эти Идеальные кристаллы!" )
	MisResultTalk( "<t>Спасибо Вам! Вот Ваша награда!" )
	MisResultCondition(NoRecord, 670)
	MisResultCondition(HasMission, 670)
	MisResultCondition(HasItem, 4103, 5)
	MisResultAction(TakeItem, 4103, 5 )
	MisResultAction(ClearMission, 670)
	MisResultAction(SetRecord, 670)
	MisResultAction(AddExp, 150, 150)
	MisResultAction(AddMoney,318,318)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4103 )	
	TriggerAction( 1, AddNextFlag, 670, 10, 5 )
	RegCurTrigger( 6701 )

----------------------------------Страдания лосей
	DefineMission( 671, "\209\242\240\224\228\224\237\232\255 \235\238\241\229\233", 671 )
	
	MisBeginTalk( "<t>Не подумайте ни чего плохого, но у меня очень странная привычка... Я люблю слушать стоны страдающих лосей! Чем жалобнее и сильнее будут стоны лосей, тем счастливее я буду себя чувствовать!<n><t>Я отблагодарю тебя если ты мне доставишь это удовольствие и убьёшь в точке(885,333) <r10 Лосей>." )
	MisBeginCondition(LvCheck, ">", 11 )
	MisBeginCondition(NoMission, 671)
	MisBeginCondition(NoRecord, 671)
	MisBeginAction(AddMission, 671)
	MisBeginAction(AddTrigger, 6711, TE_KILL, 266, 10 )--Лось
	MisCancelAction(ClearMission, 671)

	MisNeed(MIS_NEED_KILL, 266, 10, 10, 10)
	
	MisHelpTalk("<t>Я так несчастен, подарите мне хоть каплю счастья, убейте 10 Лосей в точке(885,333)." )
	MisResultTalk("<t>О! Это восхитительно! Вот Ваша награда." )
	MisResultCondition(NoRecord, 671)
	MisResultCondition(HasMission, 671)
	MisResultCondition(HasFlag, 671, 19 )
	MisResultAction(ClearMission, 671)
	MisResultAction(SetRecord, 671)
	MisResultAction(AddExp, 190, 190)
	MisResultAction(AddMoney,169,169)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 266 )	
	TriggerAction( 1, AddNextFlag, 671, 10, 10 )
	RegCurTrigger( 6711 )

--младшая анжела
	DefineMission( 906, "Фрукт Анжелы Младшей ", 906 )
	
	MisBeginTalk( " Если у тебя есть то, что мне нужно, тогда я согласна на обмен " )
	MisBeginCondition(LvCheck, ">", 999 )
	MisBeginCondition(NoRecord, 906)
	MisBeginAction(AddMission, 906)
	MisBeginAction(AddTrigger, 9061, TE_GETITEM, 2438, 100 )--монеты
	MisBeginAction(AddTrigger, 9062, TE_GETITEM, 7612, 100 )--аббадона
	MisBeginAction(AddTrigger, 9063, TE_GETITEM, 7464, 4 )--карта мёртвой
	MisBeginAction(AddTrigger, 9064, TE_GETITEM, 7466, 4 )--главарь пиратов
	MisBeginAction(AddTrigger, 9065, TE_GETITEM, 7441, 4 )--карта арамиса
	MisBeginAction(AddTrigger, 9066, TE_GETITEM, 7777, 4 )--пирата
	MisBeginAction(AddTrigger, 9067, TE_GETITEM, 7467, 20 )--честэ кэли
	MisBeginAction(AddTrigger, 9068, TE_GETITEM, 7493, 50 )--купюра
	MisCancelAction(ClearMission, 906)


	MisNeed(MIS_NEED_ITEM, 2438, 100, 10, 100)
	MisNeed(MIS_NEED_ITEM, 7612, 100, 20, 100)
	MisNeed(MIS_NEED_ITEM, 7464, 4, 30, 4)
	MisNeed(MIS_NEED_ITEM, 7466, 4, 40, 4)
	MisNeed(MIS_NEED_ITEM, 7441, 4, 50, 4)
	MisNeed(MIS_NEED_ITEM, 7777, 4, 60, 4)
	MisNeed(MIS_NEED_ITEM, 7467, 20, 70, 20)
	MisNeed(MIS_NEED_ITEM, 7493, 50, 80, 50)

	
	MisPrize(MIS_PRIZE_ITEM, 3919, 1, 4) 
	MisPrizeSelAll()

	MisHelpTalk( " <t>Ну что,ты принёс мне карты? " )
	MisResultTalk( "<t> Не ожидал что ты всё соберёшь,ну тогда держи как договаривались " )
	MisResultCondition(NoRecord, 906)
	MisResultCondition(HasMission, 906)
	MisResultCondition(HasItem, 2438, 100)
	MisResultCondition(HasItem, 7612, 100)
	MisResultCondition(HasItem, 7464, 4)
	MisResultCondition(HasItem, 7466, 4)
	MisResultCondition(HasItem, 7441, 4)
	MisResultCondition(HasItem, 7777, 4)
	MisResultCondition(HasItem, 7467, 20)
	MisResultCondition(HasItem, 7493, 50)
	MisResultAction(TakeItem, 2438, 100 )
	MisResultAction(TakeItem, 7612, 100 )
	MisResultAction(TakeItem, 7464, 4 )
	MisResultAction(TakeItem, 7466, 4 )
	MisResultAction(TakeItem, 7441, 4 )
	MisResultAction(TakeItem, 7777, 4 )
	MisResultAction(TakeItem, 7467, 20 )
	MisResultAction(TakeItem, 7493, 50 )
	MisResultAction(ClearMission, 906)
	MisResultBagNeed(1)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2438 )	
	TriggerAction( 1, AddNextFlag, 906, 10, 100 )
	RegCurTrigger( 9061 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7612 )	
	TriggerAction( 1, AddNextFlag, 906, 20, 100 )
	RegCurTrigger( 9062 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 7464 )	
	TriggerAction( 1, AddNextFlag, 906, 30, 24)
	RegCurTrigger( 9063 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7466 )	
	TriggerAction( 1, AddNextFlag, 906, 40, 4 )
	RegCurTrigger( 9064 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7441 )	
	TriggerAction( 1, AddNextFlag, 906, 50, 4 )
	RegCurTrigger( 9065 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7777 )	
	TriggerAction( 1, AddNextFlag, 906, 60, 4 )
	RegCurTrigger( 9066 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7467 )	
	TriggerAction( 1, AddNextFlag, 906, 70, 20 )
	RegCurTrigger( 9067 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7493 )	
	TriggerAction( 1, AddNextFlag, 906, 80, 50 )
	RegCurTrigger( 9068 )
	
	-- Шапка 100 уровень --
	DefineMission( 990, "Шапка Кенгуру (Уровень 100) ", 990 )
	MisBeginTalk( "Чтобы получить Шапку Кенгуру, принеси мне:<n>1. <yДоказательство Кенгуру> - 1шт;<n>2. <yКарта Кенгуру> - 1шт;<n>3. <yЗолото> - 10 миллионов. " )
	MisBeginCondition(LvCheck, ">", 1 )
	MisBeginAction(AddMission, 990)
	MisBeginCondition(NoRecord, 990)
	MisBeginAction(AddTrigger, 9901, TE_GETITEM, 7457, 1 )
	MisBeginAction(AddTrigger, 9902, TE_GETITEM, 5004, 1 )
	MisCancelAction(ClearMission, 990)

	MisNeed(MIS_NEED_ITEM, 7457, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 5004, 1, 20, 1)

	
	MisPrize(MIS_PRIZE_ITEM, 3611, 1, 4) 
	MisPrizeSelAll() 
	
	MisHelpTalk( " <t>Мне тоже не хочется приносить им боль и страдания, но они сами на это напросились. " )
	MisResultTalk( "<t> Спасибо Вам, надеюсь это послужило для них уроком. " )
	MisResultCondition(NoRecord, 990)
	MisResultCondition(HasMission, 990)
	MisResultCondition(HasItem, 7457,1)
	MisResultCondition(HasItem, 5004,1)
	MisResultAction(TakeItem, 7457, 1 )
	MisResultAction(TakeItem, 5004, 1 )
	MisResultAction(TakeMoney, 10000000 )
	MisResultAction(ClearMission, 990)
	MisResultAction(SetRecord, 990 )
	MisResultBagNeed(1)

		InitTrigger()
	TriggerCondition( 1, IsItem, 7457 )	
	TriggerAction( 1, AddNextFlag, 990, 10, 1 )
	RegCurTrigger( 9901 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 5004 )	
	TriggerAction( 1, AddNextFlag, 990, 20,  1)
	RegCurTrigger( 9902 )
	

---------------------------------------------------


    DefineMission( 991, "Фрукт Анжелы ", 991 )
	
	MisBeginTalk( " Если у тебя есть то, что мне нужно, тогда я согласна на обмен " )
	MisBeginCondition(LvCheck, ">", 499 )
	MisBeginCondition(NoRecord, 991)
	MisBeginAction(AddMission, 991)
	MisBeginAction(AddTrigger, 9911, TE_GETITEM, 7465, 3 )
	MisBeginAction(AddTrigger, 9912, TE_GETITEM, 7457, 3 )
	MisBeginAction(AddTrigger, 9913, TE_GETITEM, 7461, 3 )
	MisBeginAction(AddTrigger, 9914, TE_GETITEM, 7462, 3 )
	MisBeginAction(AddTrigger, 9915, TE_GETITEM, 7460, 3 )--бандита
	MisBeginAction(AddTrigger, 9916, TE_GETITEM, 7458, 3 )--абба
	MisBeginAction(AddTrigger, 9917, TE_GETITEM, 7467, 10 )
	MisBeginAction(AddTrigger, 9918, TE_GETITEM, 7493, 50 )--купюра

	MisCancelAction(ClearMission, 991)

	
	MisNeed(MIS_NEED_ITEM, 7465, 3, 10, 3)
	MisNeed(MIS_NEED_ITEM, 7457, 3, 20, 3)
	MisNeed(MIS_NEED_ITEM, 7461, 3, 30, 3)
	MisNeed(MIS_NEED_ITEM, 7462, 3, 40, 3)
	MisNeed(MIS_NEED_ITEM, 7460, 3, 50, 3)
	MisNeed(MIS_NEED_ITEM, 7458, 3, 60, 3)
	MisNeed(MIS_NEED_ITEM, 7467, 10, 70, 10)
	MisNeed(MIS_NEED_ITEM, 7493, 50, 80, 50)
	
	MisPrize(MIS_PRIZE_ITEM, 3918, 1, 4) 
	MisPrizeSelAll()

	MisHelpTalk( " <t>Ну что,ты принёс мне карты? " )
	MisResultTalk( "<t> Не ожидал что ты всё соберёшь,ну тогда держи как договаривались " )
	MisResultCondition(NoRecord, 991)
	MisResultCondition(HasMission, 991)
	MisResultCondition(HasItem, 7465, 3)
	MisResultCondition(HasItem, 7457, 3)
	MisResultCondition(HasItem, 7461, 3)
	MisResultCondition(HasItem, 7462, 3)
	MisResultCondition(HasItem, 7460, 3)
	MisResultCondition(HasItem, 7458, 3)
	MisResultCondition(HasItem, 7467, 10)
	MisResultCondition(HasItem, 7493, 50)
	MisResultAction(TakeItem, 7465, 3 )
	MisResultAction(TakeItem, 7457, 3 )
	MisResultAction(TakeItem, 7461, 3 )
	MisResultAction(TakeItem, 7462, 3 )
	MisResultAction(TakeItem, 7460, 3 )
	MisResultAction(TakeItem, 7458, 3 )
	MisResultAction(TakeItem, 7467, 10 )
	MisResultAction(TakeItem, 7493, 50 )
	MisResultAction(ClearMission, 991)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 7465 )	
	TriggerAction( 1, AddNextFlag, 991, 10, 3 )
	RegCurTrigger( 9911 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7457 )	
	TriggerAction( 1, AddNextFlag, 991, 20, 3 )
	RegCurTrigger( 9912 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7461 )	
	TriggerAction( 1, AddNextFlag, 991, 30, 3 )
	RegCurTrigger( 9913 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7462 )	
	TriggerAction( 1, AddNextFlag, 991, 40, 3 )
	RegCurTrigger( 9914 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7460 )	
	TriggerAction( 1, AddNextFlag, 991, 50, 3 )
	RegCurTrigger( 9915 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7458 )	
	TriggerAction( 1, AddNextFlag, 991, 60, 3 )
	RegCurTrigger( 9916 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7467 )	
	TriggerAction( 1, AddNextFlag, 991, 70, 10 )
	RegCurTrigger( 9917 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 7493 )	
	TriggerAction( 1, AddNextFlag, 991, 80, 50 )
	RegCurTrigger( 9918 )
	

	
	-- Кольца на 100 уровень --
	DefineMission( 999, "Кольца Ящера (Уровень 100) ", 999 )
	MisBeginTalk( "Если тебе нужны кольца, принеси мне:<n>1. <yКарта Ящера> - 2шт;<n>2. <yДоказательство Дурачка> - 1шт. " )
	MisBeginCondition(LvCheck, ">", 1 )
	MisBeginAction(AddMission, 999)
	MisBeginCondition(NoRecord, 999)
	MisBeginAction(AddTrigger, 9991, TE_GETITEM, 7465, 2 )
	MisBeginAction(AddTrigger, 9992, TE_GETITEM, 5003, 1 )
	MisCancelAction(ClearMission, 999)

	MisNeed(MIS_NEED_ITEM, 7465, 2, 10, 2)
	MisNeed(MIS_NEED_ITEM, 5003, 1, 20, 1)

	
	MisPrize(MIS_PRIZE_ITEM, 3603, 2, 4) 
	MisPrizeSelAll() 
	
	MisHelpTalk( " <t>Мне тоже не хочется приносить им боль и страдания, но они сами на это напросились. " )
	MisResultTalk( "<t> Спасибо Вам, надеюсь это послужило для них уроком. " )
	MisResultCondition(NoRecord, 999)
	MisResultCondition(HasMission, 999)
	MisResultCondition(HasItem, 7465,2)
	MisResultCondition(HasItem, 5003,1)
	MisResultAction(TakeItem, 7465, 2 )
	MisResultAction(TakeItem, 5003, 1 )
	MisResultAction(ClearMission, 999)
	MisResultAction(SetRecord, 999 )
	MisResultBagNeed(1)

		InitTrigger()
	TriggerCondition( 1, IsItem, 7465 )	
	TriggerAction( 1, AddNextFlag, 999, 10, 1 )
	RegCurTrigger( 9991 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 5003 )	
	TriggerAction( 1, AddNextFlag, 999, 20,  2)
	RegCurTrigger( 9992 )

	
	DefineMission( 1000, "Ожерелье Разбойника (Уровень 100) ", 1000 )
	MisBeginTalk( "Если ты хочешь ожерелье, принеси мне:<n><yКарта Разбойника> - 1шт;<n><yДоказательство Бандита> - 1шт. " )
	MisBeginCondition(LvCheck, ">", 1 )
	MisBeginAction(AddMission, 1000)
	MisBeginCondition(NoRecord, 1000)
	MisBeginAction(AddTrigger, 10001, TE_GETITEM, 7460, 1 )
	MisBeginAction(AddTrigger, 10002, TE_GETITEM, 5005, 1) 
	MisCancelAction(ClearMission, 1000)

	MisNeed(MIS_NEED_ITEM, 7460, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 5005, 1, 20, 1) 

	
	MisPrize(MIS_PRIZE_ITEM, 3604, 1, 4) 
	MisPrizeSelAll() 
	
	MisHelpTalk( " <t>Мне тоже не хочется приносить им боль и страдания, но они сами на это напросились. " )
	MisResultTalk( "<t> Спасибо Вам, надеюсь это послужило для них уроком. " )
	MisResultCondition(NoRecord, 1000)
	MisResultCondition(HasMission, 1000)
	MisResultCondition(HasItem, 7460,1)
	MisResultCondition(HasItem, 5005,1)
	MisResultAction(TakeItem, 7460, 1 )
	MisResultAction(TakeItem, 5005, 1 )
	MisResultAction(ClearMission, 1000)
	MisResultAction(SetRecord, 1000 )
	MisResultBagNeed(1)

		InitTrigger()
	TriggerCondition( 1, IsItem, 7460 )	
	TriggerAction( 1, AddNextFlag, 1000, 10, 1 )
	RegCurTrigger( 10001 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 5005 )	
	TriggerAction( 1, AddNextFlag, 1000, 20, 1)
	RegCurTrigger( 10002 )
	
-----------------------------------Очень много мыслей
	DefineMission( 673, "\206\247\229\237\252 \236\237\238\227\238 \236\251\241\235\229\233", 673 )
	
	MisBeginTalk( "<t>В наших краях ходит легенда, если подвесить на карнизе <y2 Креветочных платочка>, то вернётся удача и все удачные моменты.<n><t>Из-за своей постоянной занятности, у меня ещё небыло любви, может быть это мне поможет найти свою половинку...<n><t>Принесите мне <r2 Креветочных платочка>. Вы их сможете найти у <rКреветки-матроса> в точке(738,426)." )
	MisBeginCondition(LvCheck, ">", 13 )
	MisBeginCondition(NoMission, 673)
	MisBeginCondition(NoRecord, 673)
	MisBeginAction(AddMission, 673)
	MisBeginAction(AddTrigger, 6731, TE_GETITEM, 1839, 2 )--Креветочный платок
	MisCancelAction(ClearMission, 673)

	MisNeed(MIS_NEED_ITEM, 1839, 2, 10, 2)
	
	MisHelpTalk( "<t>Разве Вам не хочеться найти свою вторую половинку? И что бы к Вам вернулась удача?!" )
	MisResultTalk( "<t>Спасибо, я надеюсь это мне поможет!" )
	MisResultCondition(NoRecord, 673)
	MisResultCondition(HasMission, 673)
	MisResultCondition(HasItem, 1839, 2)
	MisResultAction(TakeItem, 1839, 2 )
	MisResultAction(ClearMission, 673)
	MisResultAction(SetRecord, 673)
	MisResultAction(AddExp, 290, 290)
	MisResultAction(AddMoney,384,384)


	InitTrigger()
	TriggerCondition( 1, IsItem, 1839 )	
	TriggerAction( 1, AddNextFlag, 673, 10, 2 )
	RegCurTrigger( 6731 )


----------------------------------Снежная летучая мышь
	DefineMission( 674, "\209\237\229\230\237\224\255 \235\229\242\243\247\224\255 \236\251\248\252", 674 )
	
	MisBeginTalk( "<t>От Снежных летучих мышей исходит раздражительный писк! Из-за него много скотины померло! Убейте <r10 Снежных летучих мышей> и мы, от всего нашего колхоза от благодарим Вас." )
	MisBeginCondition(LvCheck, ">", 14 )
	MisBeginCondition(NoMission, 674)
	MisBeginCondition(NoRecord, 674)
	MisBeginAction(AddMission, 674)
	MisBeginAction(AddTrigger, 6741, TE_KILL, 46, 10 )--Снежная летучая мышь
	MisCancelAction(ClearMission, 674)

	MisNeed(MIS_NEED_KILL, 46, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё ни чего не сделали полезного для нас." )
	MisResultTalk("<t>От всего колхоза: Спасибо Вам мил человек." )
	MisResultCondition(NoRecord, 674)
	MisResultCondition(HasMission, 674)
	MisResultCondition(HasFlag, 674, 19 )
	MisResultAction(ClearMission, 674)
	MisResultAction(SetRecord, 674)
	MisResultAction(AddExp, 360, 360)
	MisResultAction(AddMoney,204,204)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 46 )	
	TriggerAction( 1, AddNextFlag, 674, 10, 10 )
	RegCurTrigger( 6741 )

-----------------------------------Ингредиент для колдовства
	DefineMission( 675, "\200\237\227\240\229\228\232\229\237\242 \228\235\255 \234\238\235\228\238\226\241\242\226\224", 675 )
	
	MisBeginTalk( "<t>Я хочу видеть будущее и у меня есть даже заклинание, но у меня нету необходимого ингредиента.<n><t>Принесите мне пожалуйста <y5 Клыков летучей мыши> (743,358) и я Вас щедро отблагодарю." )
	MisBeginCondition(LvCheck, ">", 14 )
	MisBeginCondition(NoMission, 675)
	MisBeginCondition(NoRecord, 675)
	MisBeginAction(AddMission, 675)
	MisBeginAction(AddTrigger, 6751, TE_GETITEM, 4427, 5 )--Клыки летучей мыши
	MisCancelAction(ClearMission, 675)

	MisNeed(MIS_NEED_ITEM, 4427, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы не принесли мне то о чём я Вас просил?" )
	MisResultTalk( "<t>Хех. Спасибо Вам, теперь я буду видеть будущее." )
	MisResultCondition(NoRecord, 675)
	MisResultCondition(HasMission, 675)
	MisResultCondition(HasItem, 4427, 5)
	MisResultAction(TakeItem, 4427, 5 )
	MisResultAction(ClearMission, 675)
	MisResultAction(SetRecord, 675)
	MisResultAction(AddExp, 360, 360)
	MisResultAction(AddMoney,408,408)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4427 )	
	TriggerAction( 1, AddNextFlag, 675, 10, 5 )
	RegCurTrigger( 6751 )


----------------------------------Грязная струя
	DefineMission( 676, "\195\240\255\231\237\224\255 \241\242\240\243\255", 676 )
	
	MisBeginTalk( "<t>Ну это уже слишком... Представляете, невозможно выйти за пределы нашего поселения, как на людей сразу нападают эти противные <rКальмарчики-моряки>. Они плюют в людей своими чернилами и пачкают с ног до головы. Отправляетесь в точку(657,411) и преподайте им урок убив <r10 Кальмарчиков-моряков>. Да и будьте осторожны, они пачкают так, что потом трудно отстираться!" )
	MisBeginCondition(LvCheck, ">", 15 )
	MisBeginCondition(NoMission, 676)
	MisBeginCondition(NoRecord, 676)
	MisBeginAction(AddMission, 676)
	MisBeginAction(AddTrigger, 6761, TE_KILL, 233, 10 )--Кальмарчик-моряк
	MisCancelAction(ClearMission, 676)

	MisNeed(MIS_NEED_KILL, 233, 10, 10, 10)
	
	MisHelpTalk( "<t>Судя по всему Вас они тоже запачкали, и Вы это так и оставите?" )
	MisResultTalk( "<t>Надеюсь это послужит им уроком. Спасибо Вам!" )
	MisResultCondition(NoRecord, 676)
	MisResultCondition(HasMission, 676)
	MisResultCondition(HasFlag, 676, 19 )
	MisResultAction(ClearMission, 676)
	MisResultAction(SetRecord, 676)
	MisResultAction(AddExp, 450, 450)
	MisResultAction(AddMoney,216,216)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 233 )	
	TriggerAction( 1, AddNextFlag, 676, 10, 10 )
	RegCurTrigger( 6761 )

-----------------------------------Шапочка кальмара
	DefineMission( 677, "\216\224\239\238\247\234\224 \234\224\235\252\236\224\240\224", 677 )
	
	MisBeginTalk( "<t>Вы только не подумайте ни чего плохого, но мне опять нужна Ваша помощь... Принесите мне <y2 Шапочки кальмара>... Они просто такие красивые, что я не могу перед ними устоять. Вы их найдёте у <rКальмарчиков> в точке(657,411)." )
	MisBeginCondition(LvCheck, ">", 15 )
	MisBeginCondition(NoMission, 677)
	MisBeginCondition(NoRecord, 677)
	MisBeginCondition(HasRecord, 668)
	MisBeginAction(AddMission, 677)
	MisBeginAction(AddTrigger, 6771, TE_GETITEM, 1840, 2 )--Шапочка кальмара
	MisCancelAction(ClearMission, 677)

	MisNeed(MIS_NEED_ITEM, 1840, 2, 10, 2)
	
	MisHelpTalk( "<t>Вы разве мне не поможете?" )
	MisResultTalk( "<t>Ох! Они просто великолепны. Спасибо Вам!" )
	MisResultCondition(NoRecord, 677)
	MisResultCondition(HasMission, 677)
	MisResultCondition(HasItem, 1840, 2)
	MisResultAction(TakeItem, 1840, 2 )
	MisResultAction(ClearMission, 677)
	MisResultAction(SetRecord, 677)
	MisResultAction(AddExp, 450, 450)
	MisResultAction(AddMoney,433,433)


	InitTrigger()
	TriggerCondition( 1, IsItem, 1840 )	
	TriggerAction( 1, AddNextFlag, 677, 10, 2 )
	RegCurTrigger( 6771 )

----------------------------------Грибная эпидемия
	DefineMission( 678, "\195\240\232\225\237\224\255 \253\239\232\228\229\236\232\255", 678 )
	
	MisBeginTalk( "<t>Я ненавижу Грибы! Они как губки собирают всю гадость с земли, и заражают и отравляют наивных людей!<n><t>Отправляйтесь в точку(952,550) и уничтожьте <r10 Снежных грибочкa>. Спасите наивных бабушек которые и сами травятся и травят своих гостей этими мерзкими Грибами." )
	MisBeginCondition(LvCheck, ">", 16 )
	MisBeginCondition(NoMission, 678)
	MisBeginCondition(NoRecord, 678)
	MisBeginAction(AddMission, 678)
	MisBeginAction(AddTrigger, 6781, TE_KILL, 130, 10 )--Снежный грибочек
	MisCancelAction(ClearMission, 678)

	MisNeed(MIS_NEED_KILL, 130, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не сделали то, о чём я Вас попросил." )
	MisResultTalk( "<t>Спасибо Вам, Вы опять мне помогли." )
	MisResultCondition(NoRecord, 678)
	MisResultCondition(HasMission, 678)
	MisResultCondition(HasFlag, 678, 19 )
	MisResultAction(ClearMission, 678)
	MisResultAction(SetRecord, 678)
	MisResultAction(AddExp, 550, 550)
	MisResultAction(AddMoney,229,229)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 130 )	
	TriggerAction( 1, AddNextFlag, 678, 10, 10 )
	RegCurTrigger( 6781 )

-----------------------------------Грибной отвар
	DefineMission( 679, "\195\240\232\225\237\238\233 \238\242\226\224\240", 679 )
	
	MisBeginTalk( "<t>Мои года уже не позволяют мне наслаждаться вкусной, жирной и хорошо поджаренной пищей, но я могу подлечить свой желудок Отваром из Грибов.<n><t>Принесите мне <5 Снежных грибов> из <rСнежных грибочков>(952,550), что бы я отварив и выпив зелье смогла опять насладиться вкусом свежо-прожаренного кабанчика." )
	MisBeginCondition(LvCheck, ">", 16 )
	MisBeginCondition(NoMission, 679)
	MisBeginCondition(NoRecord, 679)
	MisBeginAction(AddMission, 679)
	MisBeginAction(AddTrigger, 6791, TE_GETITEM, 4104, 5 )--Снежный гриб(квестовый лут)
	MisCancelAction(ClearMission, 679)

	MisNeed(MIS_NEED_ITEM, 4104, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не принесли мне Снежный Гриб!?" )
	MisResultTalk( "<t>Ох! это прекрасно. Я сейчас же начну готовить отвар!" )
	MisResultCondition(NoRecord, 679)
	MisResultCondition(HasMission, 679)
	MisResultCondition(HasItem, 4104, 5)
	MisResultAction(TakeItem, 4104, 5 )
	MisResultAction(ClearMission, 679)
	MisResultAction(SetRecord, 679)
	MisResultAction(AddExp, 550, 550)
	MisResultAction(AddMoney,459,459)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4104 )	
	TriggerAction( 1, AddNextFlag, 679, 10, 5 )
	RegCurTrigger( 6791 )


----------------------------------Маленькая маленькая улитка
	DefineMission( 680, "\204\224\235\229\237\252\234\224\255 \236\224\235\229\237\252\234\224\255 \243\235\232\242\234\224!", 680 )
	
	MisBeginTalk( "<t><rСнежные улитки> хоть и медлительны, но всё таки очень назойливые, и очень уж они мне мешают.<n><t>Я стал часто спотыкаться об них в точке(657,334). Убейте там <r10 Снежных улиток> для меня." )
	MisBeginCondition(LvCheck, ">", 17 )
	MisBeginCondition(NoMission, 680)
	MisBeginCondition(NoRecord, 680)
	MisBeginAction(AddMission, 680)
	MisBeginAction(AddTrigger, 6801, TE_KILL, 228, 10 )--Снежная улитка
	MisCancelAction(ClearMission, 680)

	MisNeed(MIS_NEED_KILL, 228, 10, 10, 10)
	
	MisHelpTalk( "<t>Нет молодой человек. Так дела не делают! Идите и убейте 10 Снежных улиток в точке(657,334)!" )
	MisResultTalk( "<t>Огромное Вам спасибо, теперь я не буду об них спотыкаться!" )
	MisResultCondition(NoRecord, 680)
	MisResultCondition(HasMission, 680)
	MisResultCondition(HasFlag, 680, 19 )
	MisResultAction(ClearMission, 680)
	MisResultAction(SetRecord, 680)
	MisResultAction(AddExp, 650, 650)
	MisResultAction(AddMoney,242,242)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 228 )	
	TriggerAction( 1, AddNextFlag, 680, 10, 10 )
	RegCurTrigger( 6801 )

-----------------------------------Цветочный камень
	DefineMission( 681, "\214\226\229\242\238\247\237\251\233 \234\224\236\229\237\252", 681 )
	
	MisBeginTalk( "<t>Под ракушкой <rСнежной улитки> находится редкий <yЦветочный камень>.<n><t>Этот камень сотворила сама богиня Кара, что бы понять язык цветов.<n><t>Принесите мне для опытов <y5 Цветочных каменей> из Снежных Улиток. Они появляются в точке(657,334)." )
	MisBeginCondition(LvCheck, ">", 18 )
	MisBeginCondition(NoMission, 681)
	MisBeginCondition(NoRecord, 681)
	MisBeginAction(AddMission, 681)
	MisBeginAction(AddTrigger, 6811, TE_GETITEM, 4105, 5 )--Цветочный камень
	MisCancelAction(ClearMission, 681)

	MisNeed(MIS_NEED_ITEM, 4105, 5, 10, 5)
	
	MisHelpTalk( "<t>Я не буду с Вами разговаривать пока Вы не соизволите выполнить моё поручение!" )
	MisResultTalk( "<t>Спасибо Вам огромное. Вот Ваша награда!" )
	MisResultCondition(NoRecord, 681)
	MisResultCondition(HasMission, 681)
	MisResultCondition(HasItem, 4105, 5)
	MisResultAction(TakeItem, 4105, 5 )
	MisResultAction(ClearMission, 681)
	MisResultAction(SetRecord, 681)
	MisResultAction(AddExp, 750, 750)
	MisResultAction(AddMoney,513,513)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4105 )	
	TriggerAction( 1, AddNextFlag, 681, 10, 5 )
	RegCurTrigger( 6811 )

-----------------------------------Чутье Улитки
	DefineMission( 682, "\215\243\242\252\229 \211\235\232\242\234\232", 682 )
	
	MisBeginTalk( "<t>Я ставлю эксперимент на чувствительности <rСнежных Улиток> обитающих в точке(657,334).<n><t>Мне необходимо понять... Почему они так хорошо реагируют на приближение человека и успевают спрятаться.<n><t>Принесите мне <y5 замороженных усика улитки>, что бы я смог разобраться в этом вопросе." )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 682)
	MisBeginCondition(NoRecord, 682)
	MisBeginAction(AddMission, 682)
	MisBeginAction(AddTrigger, 6821, TE_GETITEM, 4428, 5 )--Замороженный усик улитки
	MisCancelAction(ClearMission, 682)

	MisNeed(MIS_NEED_ITEM, 4428, 5, 10, 5)
	
	MisHelpTalk( "<t>От Вас требуется всего 5 Замороженных усиков улитки." )
	MisResultTalk( "<t>Очень хорошо! Вы помогли мне в моих опытах!" )
	MisResultCondition(NoRecord, 682)
	MisResultCondition(HasMission, 682)
	MisResultCondition(HasItem, 4428, 5)
	MisResultAction(TakeItem, 4428, 5 )
	MisResultAction(ClearMission, 682)
	MisResultAction(SetRecord, 682)
	MisResultAction(AddExp, 880, 880)
	MisResultAction(AddMoney,541,541)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4428 )	
	TriggerAction( 1, AddNextFlag, 682, 10, 5 )
	RegCurTrigger( 6821 )

-----------------------------------Поиски снежного сердца
	DefineMission( 683, "\207\238\232\241\234\232 \241\237\229\230\237\238\227\238 \241\229\240\228\246\224", 683 )
	
	MisBeginTalk( "<t>Постойте! Помогите мне! Мой племянник заразился странным вирусом и умирает! Только <yЗамерзшее сердце> из <rНаивной снегурки> в точке(1055,738) сможет вылечить его.<n><t>Принесите мне <y5 Замерзших сердец>!" )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 683)
	MisBeginCondition(NoRecord, 683)
	MisBeginAction(AddMission, 683)
	MisBeginAction(AddTrigger, 6831, TE_GETITEM, 4431, 5 )--Замерзшее сердце
	MisCancelAction(ClearMission, 683)

	MisNeed(MIS_NEED_ITEM, 4431, 5, 10, 5)
	
	MisHelpTalk( "<t>Поспешите, мой племянник присмерти!" )
	MisResultTalk( "<t>Мне очень повезло, что я доверил эту не простую задачу именно Вам!" )
	MisResultCondition(NoRecord, 683)
	MisResultCondition(HasMission, 683)
	MisResultCondition(HasItem, 4431, 5)
	MisResultAction(TakeItem, 4431, 5 )
	MisResultAction(ClearMission, 683)
	MisResultAction(SetRecord, 683)
	MisResultAction(AddExp, 880, 880)
	MisResultAction(AddMoney,541,541)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4431 )	
	TriggerAction( 1, AddNextFlag, 683, 10, 5 )
	RegCurTrigger( 6831 )


----------------------------------Наивная снегурка
	DefineMission( 684, "\205\224\232\226\237\224\255 \241\237\229\227\243\240\234\224", 684 )
	
	MisBeginTalk( "<t>Ходят слухи, что <rНаивная снегурка> обладает способностью творить настоящее зло!<n><t>Хоть это и слухи, всё же надо принять все меры предосторожности.<n><t>Отправляйтесь в точку(1055,738) и убейте <r10 Наивных снегурок>, дабы предотвратить зло!" )
	MisBeginCondition(LvCheck, ">", 19 )
	MisBeginCondition(NoMission, 684)
	MisBeginCondition(NoRecord, 684)
	MisBeginAction(AddMission, 684)
	MisBeginAction(AddTrigger, 6841, TE_KILL, 255, 10 )--Наивная снегурка
	MisCancelAction(ClearMission, 684)

	MisNeed(MIS_NEED_KILL, 255, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы уже убили 10 Наивных снегурок? Нет? Так чего Вы ждёте?" )
	MisResultTalk( "<t>Спасибо Вам! Вы предовратили зло." )
	MisResultCondition(NoRecord, 684)
	MisResultCondition(HasMission, 684)
	MisResultCondition(HasFlag, 684, 19 )
	MisResultAction(ClearMission, 684)
	MisResultAction(SetRecord, 684)
	MisResultAction(AddExp, 880, 880)
	MisResultAction(AddMoney,270,270)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 255 )	
	TriggerAction( 1, AddNextFlag, 684, 10, 10 )
	RegCurTrigger( 6841 )

----------------------------------Снежный медвежонок
	DefineMission( 685, "\209\237\229\230\237\251\233 \236\229\228\226\229\230\238\237\238\234", 685 )
	
	MisBeginTalk( "<t>Такие животные как медведи в морозы очень опасны! Когда их разбудят зимой они ходят и нападают на всех кто бы им не попался на пути, их по этому и называют \"Шатунами\". Вот таких медведей и разбудили в точке(958,661), теперь они не дают покоя ни кому, нападая на всё живое. Отправляйтесь туда и убейте <r10 Снежных медвежат>. Это должно их немного успокоить!" )
	MisBeginCondition(LvCheck, ">", 20 )
	MisBeginCondition(NoMission, 685)
	MisBeginCondition(NoRecord, 685)
	MisBeginAction(AddMission, 685)
	MisBeginAction(AddTrigger, 6851, TE_KILL, 142, 10 )--Снежный медвежонок
	MisCancelAction(ClearMission, 685)

	MisNeed(MIS_NEED_KILL, 142, 10, 10, 10)
	
	MisHelpTalk( "<t>Медведи до сих пор ходят и нападают на прохожих!" )
	MisResultTalk( "<t>Спасибо Вам, теперь они станут на много спокойнее!" )
	MisResultCondition(NoRecord, 685)
	MisResultCondition(HasMission, 685)
	MisResultCondition(HasFlag, 685, 19 )
	MisResultAction(ClearMission, 685)
	MisResultAction(SetRecord, 685)
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney,285,285)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 142 )	
	TriggerAction( 1, AddNextFlag, 685, 10, 10 )
	RegCurTrigger( 6851 )

-----------------------------------Слёзы снега
	DefineMission( 686, "\209\235\191\231\251 \241\237\229\227\224", 686 )
	
	MisBeginTalk( "<t>Я пришёл сюда с пустыни в поисках <rСнежной королевы>. Говорят она младшая сестра Богини Кары. Я очень хотел бы с ней встретиться, но мои поиски до сих пор не принесли результатов и я уже начинаю думать, что всё это большой миф и сказка детям на ночь.<n><t>Не могли бы вы принести мне <y5 Совершенных снежинок>, что бы удостовериться в их существовании.<n><t>Ходят слухи, что они обитают в точке(873,646)." )
	MisBeginCondition(LvCheck, ">", 21 )
	MisBeginCondition(NoMission, 686)
	MisBeginCondition(NoRecord, 686)
	MisBeginAction(AddMission, 686)
	MisBeginAction(AddTrigger, 6861, TE_GETITEM, 4438, 5 )--Совершенная снежинка
	MisCancelAction(ClearMission, 686)

	MisNeed(MIS_NEED_ITEM, 4438, 5, 10, 5)
	
	MisHelpTalk( "<t>Помогите мне найти докозательство существования Снежной королевы!" )
	MisResultTalk( "<t>Спасибо! Я теперь вижу, что они существуют!" )
	MisResultCondition(NoRecord, 686)
	MisResultCondition(HasMission, 686)
	MisResultCondition(HasItem, 4438, 5)
	MisResultAction(TakeItem, 4438, 5 )
	MisResultAction(ClearMission, 686)
	MisResultAction(SetRecord, 686)
	MisResultAction(AddExp, 1200, 1200)
	MisResultAction(AddMoney,601,601)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4438 )	
	TriggerAction( 1, AddNextFlag, 686, 10, 5 )
	RegCurTrigger( 6861 )


-----------------------------------Снежный кристалл
	DefineMission( 687, "\209\237\229\230\237\251\233 \234\240\232\241\242\224\235\235", 687 )
	
	MisBeginTalk( "<t>Эй друг, вы слышали последние новости? Теперь самый ценный товар на Чёрном рынке это <yСнежный кристалл> из <rСнежной королевы> обитающей в точке(873,646). Она его использует, что бы замораживать людей и животных нарушивших её покой!<n><t>Принесите мне <y5 Снежных кристаллов>, что бы я смог получше разобраться как она с помощью его живое существо превращает в Ледяную статую." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(NoMission, 687)
	MisBeginCondition(NoRecord, 687)
	MisBeginAction(AddMission, 687)
	MisBeginAction(AddTrigger, 6871, TE_GETITEM, 4106, 5 )--Снежный кристалл
	MisCancelAction(ClearMission, 687)

	MisNeed(MIS_NEED_ITEM, 4106, 5, 10, 5)
	
	MisHelpTalk( "<t>Да вы не бойтесь, просто сильно её не злите и всё у Вас получиться." )
	MisResultTalk( "<t>Я вижу Вы принесли мне то, что я попросил, вот Ваше вознаграждение!" )
	MisResultCondition(NoRecord, 687)
	MisResultCondition(HasMission, 687)
	MisResultCondition(HasItem, 4106, 5)
	MisResultAction(TakeItem, 4106, 5 )
	MisResultAction(ClearMission, 687)
	MisResultAction(SetRecord, 687)
	MisResultAction(AddExp, 1400, 1400)
	MisResultAction(AddMoney,316,316)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4106 )	
	TriggerAction( 1, AddNextFlag, 687, 10, 5 )
	RegCurTrigger( 6871 )

----------------------------------Плач Снежной королевы
	DefineMission( 688, "\207\235\224\247 \209\237\229\230\237\238\233 \234\238\240\238\235\229\226\251", 688 )
	
	MisBeginTalk( "<t>Очень хорошо, что Вы тут! Вам не попадалась на пути <rСнежная Королева>? Они очень опасны!<n><t>Если их разозлить они могут вызвать снежную бурю!<n><t>Вы мне не верите? Попробуйте проверить это сами... Отправляйтесь в точку(873,646) и убейте <r10 Снежных королев>." )
	MisBeginCondition(LvCheck, ">", 22 )
	MisBeginCondition(NoMission, 688)
	MisBeginCondition(NoRecord, 688)
	MisBeginAction(AddMission, 688)
	MisBeginAction(AddTrigger, 6881, TE_KILL, 281, 10 )--Снежная королева
	MisCancelAction(ClearMission, 688)

	MisNeed(MIS_NEED_KILL, 281, 10, 10, 10)
	
	MisHelpTalk( "<t>Я же вам говорил что они опасны, попробуйте ещё раз." )
	MisResultTalk( "<t>Вы справелись с этой стихией. Я в Вас ошибался!" )
	MisResultCondition(NoRecord, 688)
	MisResultCondition(HasMission, 688)
	MisResultCondition(HasFlag, 688, 19 )
	MisResultAction(ClearMission, 688)
	MisResultAction(SetRecord, 688)
	MisResultAction(AddExp, 1400, 1400)
	MisResultAction(AddMoney,316,316)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 281 )	
	TriggerAction( 1, AddNextFlag, 688, 10, 10 )
	RegCurTrigger( 6881 )

----------------------------------Расплата волкам
	DefineMission( 689, "\208\224\241\239\235\224\242\224 \226\238\235\234\224\236", 689 )
	
	MisBeginTalk( "<t>Помогите! Помогите! За мной гналась стая <rСнежных Волков>! Мне так страшно!<n><t>Пожалуйста убейте <r10 Снежных волков> в точке(965,775)." )
	MisBeginCondition(LvCheck, ">", 23 )
	MisBeginCondition(NoMission, 689)
	MisBeginCondition(NoRecord, 689)
	MisBeginAction(AddMission, 689)
	MisBeginAction(AddTrigger, 6891, TE_KILL, 137, 10 )--Снежный волк
	MisCancelAction(ClearMission, 689)

	MisNeed(MIS_NEED_KILL, 137, 10, 10, 10)
	
	MisHelpTalk( "<t>Помогите!" )
	MisResultTalk( "<t>Ох! Спасибо Вам!" )
	MisResultCondition(NoRecord, 689)
	MisResultCondition(HasMission, 689)
	MisResultCondition(HasFlag, 689, 19 )
	MisResultAction(ClearMission, 689)
	MisResultAction(SetRecord, 689)
	MisResultAction(AddExp, 1600, 1600)
	MisResultAction(AddMoney,332,332)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 137 )	
	TriggerAction( 1, AddNextFlag, 689, 10, 10 )
	RegCurTrigger( 6891 )

-----------------------------------Травяное желе
	DefineMission( 690, "\210\240\224\226\255\237\238\229 \230\229\235\229", 690 )
	
	MisBeginTalk( "<t>Вы как раз вовремя дружище!<n><t>Я так хочу попробовать <yТравное желе>, но его можно получить только из <rВоенных черепах> обитающих в точке(891,750).<n><t>Пожалуйста помогите мне, я так хочу отведать <yТравяное желе>." )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 690)
	MisBeginCondition(NoRecord, 690)
	MisBeginAction(AddMission, 690)
	MisBeginAction(AddTrigger, 6901, TE_GETITEM, 4442, 5 )--Травяное желе
	MisCancelAction(ClearMission, 690)

	MisNeed(MIS_NEED_ITEM, 4442, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не ходили?" )
	MisResultTalk( "<t>Ням ням... Это настоящее лакомство." )
	MisResultCondition(NoRecord, 690)
	MisResultCondition(HasMission, 690)
	MisResultCondition(HasItem, 4442, 5)
	MisResultAction(TakeItem, 4442, 5 )
	MisResultAction(ClearMission, 690)
	MisResultAction(SetRecord, 690)
	MisResultAction(AddExp, 1800, 1800)
	MisResultAction(AddMoney,697,697)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4442 )	
	TriggerAction( 1, AddNextFlag, 690, 10, 5 )
	RegCurTrigger( 6901 )

----------------------------------Длинный нос Черепахи
	DefineMission( 691, "\196\235\232\237\237\251\233 \237\238\241 \215\229\240\229\239\224\245\232", 691 )
	
	MisBeginTalk( "<t>Друг мой! Я только что видел страшных существ около деревни.<n><t>Они как обычные черепахи, но с Булавами по бокам панциря. Я слышал, что их называют <rВоенными черепахами>.<n><t>Не могли бы Вы убить <r10 Военных черепах> в точке (930,792), чтобы обуздать мои страхи к ним?" )
	MisBeginCondition(LvCheck, ">", 24 )
	MisBeginCondition(NoMission, 691)
	MisBeginCondition(NoRecord, 691)
	MisBeginAction(AddMission, 691)
	MisBeginAction(AddTrigger, 6911, TE_KILL, 265, 10 )--Военная черепаха
	MisCancelAction(ClearMission, 691)

	MisNeed(MIS_NEED_KILL, 265, 10, 10, 10)
	
	MisHelpTalk( "<t>Я ещё боюсь их!" )
	MisResultTalk( "<t>Спасибо Вам, мне теперь не так страшно!" )
	MisResultCondition(NoRecord, 691)
	MisResultCondition(HasMission, 691)
	MisResultCondition(HasFlag, 691, 19 )
	MisResultAction(ClearMission, 691)
	MisResultAction(SetRecord, 691)
	MisResultAction(AddExp, 1800, 1800)
	MisResultAction(AddMoney,348,348)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 265 )	
	TriggerAction( 1, AddNextFlag, 691, 10, 10 )
	RegCurTrigger( 6911 )

----------------------------------Грубый Бронекраб
	DefineMission( 692, "\195\240\243\225\251\233 \193\240\238\237\229\234\240\224\225", 692 )
	
	MisBeginTalk( "<t>Боже мой! Целая армия <rБроникрабов> лишила меня моего товара! Да как они посмели?! Не поможете ли Вы мне преподать им урок? Отправляйтесь в точку(994,857) и убейте <r10 Бронекрабов>, что бы другим было не повадно!" )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 692)
	MisBeginCondition(NoRecord, 692)
	MisBeginAction(AddMission, 692)
	MisBeginAction(AddTrigger, 6921, TE_KILL, 143, 10 )--Бронекраб
	MisCancelAction(ClearMission, 692)

	MisNeed(MIS_NEED_KILL, 143, 10, 10, 10)
	
	MisHelpTalk( "<t>Пожалуйста убейте 10 Бронекрабов в точке(994,857)." )
	MisResultTalk( "<t>Хе-хе! Теперь им будет неповадно нападать на простых жителей Ледыни." )
	MisResultCondition(NoRecord, 692)
	MisResultCondition(HasMission, 692)
	MisResultCondition(HasFlag, 692, 19 )
	MisResultAction(ClearMission, 692)
	MisResultAction(SetRecord, 692)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,365,365)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 143 )	
	TriggerAction( 1, AddNextFlag, 692, 10, 10 )
	RegCurTrigger( 6921 )

-----------------------------------Яйцо бронекраба
	DefineMission( 693, "\223\233\246\238 \225\240\238\237\229\234\240\224\225\224", 693 )
	
	MisBeginTalk( "<t>Когда я только сюда переехал жить, у меня появилась мечта попробовать яичницу из <yяиц бронекраба>. Помогите мне её приготовить, для этого мне надо <y5 Яиц Бронекраба> обитающих в точке(994,857)." )
	MisBeginCondition(LvCheck, ">", 25 )
	MisBeginCondition(NoMission, 693)
	MisBeginCondition(NoRecord, 693)
	MisBeginAction(AddMission, 693)
	MisBeginAction(AddTrigger, 6931, TE_GETITEM, 4107, 5 )--Яйцо бронекраба
	MisCancelAction(ClearMission, 693)

	MisNeed(MIS_NEED_ITEM, 4107, 5, 10, 5)
	
	MisHelpTalk( "<t>По видимому я не тому доверил свой секрет... Идите и принесите мне <yяйца Броникраба>, пока я не разозлился!" )
	MisResultTalk( "<t>Спасибо! Я ни когда ещё не ел такой вкусной яичницы!" )
	MisResultCondition(NoRecord, 693)
	MisResultCondition(HasMission, 693)
	MisResultCondition(HasItem, 4107, 5)
	MisResultAction(TakeItem, 4107, 5 )
	MisResultAction(ClearMission, 693)
	MisResultAction(SetRecord, 693)
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney,730,730)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4107 )	
	TriggerAction( 1, AddNextFlag, 693, 10, 5 )
	RegCurTrigger( 6931 )

-----------------------------------Замороженное мясо улитки
	DefineMission( 694, "\199\224\236\238\240\238\230\229\237\237\238\229 \236\255\241\238 \243\235\232\242\234\232", 694 )
	
	MisBeginTalk( "<t>Вы пробовали когда ни будь <yЗамороженное мясо улитки>? Нет? О! вы многое потеряли, я очень люблю <yЗамороженное мясо улитки>.<n><t>Принесите мне их в размере 5 штук и я Вас щедро отблагодарю! Найти Вы их сможете в точке(802,750). Удачи Вам В поисках!" )
	MisBeginCondition(LvCheck, ">", 26 )
	MisBeginCondition(NoMission, 694)
	MisBeginCondition(NoRecord, 694)
	MisBeginAction(AddMission, 694)
	MisBeginAction(AddTrigger, 6941, TE_GETITEM, 4464, 5 )
	MisCancelAction(ClearMission, 694)

	MisNeed(MIS_NEED_ITEM, 4464, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы ещё не принесли мне Замороженное мясо улитки? Как жаль! Но я жду Вас с ним!" )
	MisResultTalk( "<t>Мммм... Это обьядение!" )
	MisResultCondition(NoRecord, 694)
	MisResultCondition(HasMission, 694)
	MisResultCondition(HasItem, 4464, 5)
	MisResultAction(TakeItem, 4464, 5 )
	MisResultAction(ClearMission, 694)
	MisResultAction(SetRecord, 694)
	MisResultAction(AddExp, 2400, 2400)
	MisResultAction(AddMoney,765,765)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4464 )	
	TriggerAction( 1, AddNextFlag, 694, 10, 5 )
	RegCurTrigger( 6941 )

-----------------------------------Сбор Непорочнго сердца
	DefineMission( 695, "\209\225\238\240 \205\229\239\238\240\238\247\237\227\238 \241\229\240\228\246\224", 695 )
	
	MisBeginTalk( "<t>Постойте! У Вас не найдётся для меня минутки? Отлично! Мой друг занимается магией и ему необходимо <r5 Непорочных Сердец> из <rСнежного духа>. Вы найдёте <rСнежный дух> в точке(1060,805). Поторопитесь, мой друг предложил хорошее вознаграждение тому кто принесёт первым <y5 Непорочных сердец>." )
	MisBeginCondition(LvCheck, ">", 27 )
	MisBeginCondition(NoMission, 695)
	MisBeginCondition(NoRecord, 695)
	MisBeginAction(AddMission, 695)
	MisBeginAction(AddTrigger, 6951, TE_GETITEM, 4481, 5 )--Непорочное сердце
	MisCancelAction(ClearMission, 695)

	MisNeed(MIS_NEED_ITEM, 4481, 5, 10, 5)
	
	MisHelpTalk( "<t>Поторопитесь, и награда будет Ваша!" )
	MisResultTalk( "<t>Спасибо Вам за помощь, вот Ваша награда." )
	MisResultCondition(NoRecord, 695)
	MisResultCondition(HasMission, 695)
	MisResultCondition(HasItem, 4481, 5)
	MisResultAction(TakeItem, 4481, 5 )
	MisResultAction(ClearMission, 695)
	MisResultAction(SetRecord, 695)
	MisResultAction(AddExp, 2700, 2700)
	MisResultAction(AddMoney,800,800)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4481 )	
	TriggerAction( 1, AddNextFlag, 695, 10, 5 )
	RegCurTrigger( 6951 )

----------------------------------Хрупкая снегурка
	DefineMission( 696, "\213\240\243\239\234\224\255 \241\237\229\227\243\240\234\224", 696 )
	
	MisBeginTalk( "<t><rХрупкая снегурка> постоянно создаёт угрозу жителям деревни! Не помогли ли бы Вы жителям убить <r10 Хрупких снегурок> в точке(908,842)." )
	MisBeginCondition(LvCheck, ">", 28 )
	MisBeginCondition(NoMission, 696)
	MisBeginCondition(NoRecord, 696)
	MisBeginAction(AddMission, 696)
	MisBeginAction(AddTrigger, 6961, TE_KILL, 256, 10 )--Хрупкая снегурка
	MisCancelAction(ClearMission, 696)

	MisNeed(MIS_NEED_KILL, 256, 10, 10, 10)
	
	MisHelpTalk( "<t>Пожалуйста помогите нам!" )
	MisResultTalk( "<t>Вы настоящий герой!" )
	MisResultCondition(NoRecord, 696)
	MisResultCondition(HasMission, 696)
	MisResultCondition(HasFlag, 696, 19 )
	MisResultAction(ClearMission, 696)
	MisResultAction(SetRecord, 696)
	MisResultAction(AddExp, 3000, 3000)
	MisResultAction(AddMoney,417,417)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 256 )	
	TriggerAction( 1, AddNextFlag, 696, 10, 10 )
	RegCurTrigger( 6961 )

----------------------------------Йети
	DefineMission( 697, "\201\229\242\232", 697 )
	
	MisBeginTalk( "<t>Привет! Вы хотите доказать, что вы настоящий смелый и отважный герой? Отлично! У Вас прекрасный шанс это сделать!<n><t>Убейте <r10 Йети> В точке(1495,667) и Вы этим докажете, что Вы герой!" )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 697)
	MisBeginCondition(NoRecord, 697)
	MisBeginAction(AddMission, 697)
	MisBeginAction(AddTrigger, 6971, TE_KILL, 98, 10 )--Йети
	MisCancelAction(ClearMission, 697)

	MisNeed(MIS_NEED_KILL, 98, 10, 10, 10)
	
	MisHelpTalk( "<t>Не... ТАких героев нам не надо....." )
	MisResultTalk( "<t>А вот я и не сомневался в Вас ни на минуту." )
	MisResultCondition(NoRecord, 697)
	MisResultCondition(HasMission, 697)
	MisResultCondition(HasFlag, 697, 19 )
	MisResultAction(ClearMission, 697)
	MisResultAction(SetRecord, 697)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,424,424)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 98 )	
	TriggerAction( 1, AddNextFlag, 697, 10, 10 )
	RegCurTrigger( 6971 )

-----------------------------------Забытая тайна
	DefineMission( 698, "\199\224\225\251\242\224\255 \242\224\233\237\224", 698 )
	
	MisBeginTalk( "<t>В Ледыне часто пропадают люди и мне кажется что виной этому Йети обитающие в точке(1495,667). Убейте их и принесите в доказательство победы над ними <y5 Когтей Йети>." )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 698)
	MisBeginCondition(NoRecord, 698)
	MisBeginAction(AddMission, 698)
	MisBeginAction(AddTrigger, 6981, TE_GETITEM, 4446, 5 )--Коготь йети
	MisCancelAction(ClearMission, 698)

	MisNeed(MIS_NEED_ITEM, 4446, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы их убили? Ха-ха-ха! Не смешите! Я не вижу доказательств их смерти!" )
	MisResultTalk( "<t>Вы заслужили награду!" )
	MisResultCondition(NoRecord, 698)
	MisResultCondition(HasMission, 698)
	MisResultCondition(HasItem, 4446, 5)
	MisResultAction(TakeItem, 4446, 5 )
	MisResultAction(ClearMission, 698)
	MisResultAction(SetRecord, 698)
	MisResultAction(AddExp, 3400, 3400)
	MisResultAction(AddMoney,849,849)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4446 )	
	TriggerAction( 1, AddNextFlag, 698, 10, 5 )
	RegCurTrigger( 6981 )

----------------------------------Хрю-хрю
	DefineMission( 699, "\213\240\254-\245\240\254!", 699 )
	
	MisBeginTalk( "<t>Ой,Ой! Мне страшно! Я боюсь Выходить за пределы Ледыни! Эти Летающие Свинокрылы меня пугают! Убейте <r10 Боевых свинокрылов> в точке(1453,560), чтобы я мог спокойно сам выходить за пределы городских стен!" )
	MisBeginCondition(LvCheck, ">", 30 )
	MisBeginCondition(NoMission, 699)
	MisBeginCondition(NoRecord, 699)
	MisBeginAction(AddMission, 699)
	MisBeginAction(AddTrigger, 6991, TE_KILL, 296, 10 )--Боевой свинокрыл
	MisCancelAction(ClearMission, 699)

	MisNeed(MIS_NEED_KILL, 296, 10, 10, 10)
	
	MisHelpTalk( "<t>Идите на конец и покончите с Боевыми Свинокрылами!" )
	MisResultTalk( "<t>Ой! Я даже не знаю как Вас и благодарить!" )
	MisResultCondition(NoRecord, 699)
	MisResultCondition(HasMission, 699)
	MisResultCondition(HasFlag, 699, 19 )
	MisResultAction(ClearMission, 699)
	MisResultAction(SetRecord, 699)
	MisResultAction(AddExp, 3900, 3900)
	MisResultAction(AddMoney,431,431)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 296 )	
	TriggerAction( 1, AddNextFlag, 699, 10, 10 )
	RegCurTrigger( 6991 )

----------------------------------Игривая снегурка
	DefineMission( 800, "\200\227\240\232\226\224\255 \241\237\229\227\243\240\234\224", 800 )
	
	MisBeginTalk( "<t>Я тут отвечаю за безопасность туристов и иностранцев! Но даже я не в силах справиться самостоятельно с проблемой <rИгривой снегурки>. Они так разыгрались, что нападают на всех, думая что это всего лишь игра, но уже очень много людей попало в больницы из-за их развлечений! Отправляйтесь в точку(1746,530) и накажите <r10 Игривых Снегурок>!" )
	MisBeginCondition(LvCheck, ">", 32 )
	MisBeginCondition(NoMission, 800)
	MisBeginCondition(NoRecord, 800)
	MisBeginAction(AddMission, 800)
	MisBeginAction(AddTrigger, 8001, TE_KILL, 257, 10 )--Игривая снегурка
	MisCancelAction(ClearMission, 800)

	MisNeed(MIS_NEED_KILL, 257, 10, 10, 10)
	
	MisHelpTalk( "<t>Эх! Бедные туристы!" )
	MisResultTalk( "<t>Я Вам очень благодарен! Вы можете обращаться ко мне за помощью теперь." )
	MisResultCondition(NoRecord, 800)
	MisResultCondition(HasMission, 800)
	MisResultCondition(HasFlag, 800, 19 )
	MisResultAction(ClearMission, 800)
	MisResultAction(SetRecord, 800)
	MisResultAction(AddExp, 4900, 4900)
	MisResultAction(AddMoney,446,446)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 257 )	
	TriggerAction( 1, AddNextFlag, 800, 10, 10 )
	RegCurTrigger( 8001 )

-----------------------------------Самоцвет духа
	DefineMission( 801, "\209\224\236\238\246\226\229\242 \228\243\245\224", 801 )
	
	MisBeginTalk( "<t>Всё больше и больше несчастных случаев происходит в мире. С этим надо что-то делать! Люди стали пропадать в точке(1746,530). В тех местах обитают <rИгривые снегурки> и возможно именно они имеют к этому непосредственное отношение.<n><t>Отправляйтесь в точку(1746,530) и принесите мне с <rИгривых снегурок> <y5 Самоцветов духа>, что бы выяснить причастны они в исчезновениях людей или нет." )
	MisBeginCondition(LvCheck, ">", 33 )
	MisBeginCondition(NoMission, 801)
	MisBeginCondition(NoRecord, 801)
	MisBeginAction(AddMission, 801)
	MisBeginAction(AddTrigger, 8011, TE_GETITEM, 4108, 5 )--Самоцвет духа(Игривая снегурка)Квестовый лут
	MisCancelAction(ClearMission, 801)

	MisNeed(MIS_NEED_ITEM, 4108, 5, 10, 5)
	
	MisHelpTalk( "<t>Вы мне ещё не принесли 5 <yСамоцветов духа>?" )
	MisResultTalk( "<t>Ох! Спасибо Вам!<n><t>Я сейчас же отправлю Самоцветы Духа в город для более тщательного расследования!" )
	MisResultCondition(NoRecord, 801)
	MisResultCondition(HasMission, 801)
	MisResultCondition(HasItem, 4108, 5)
	MisResultAction(TakeItem, 4108, 5 )
	MisResultAction(ClearMission, 801)
	MisResultAction(SetRecord, 801)
	MisResultAction(AddExp, 5500, 5500)
	MisResultAction(AddMoney,907,907)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4108 )	
	TriggerAction( 1, AddNextFlag, 801, 10, 5 )
	RegCurTrigger( 8011 )

----------------------------------Убийства невинных
	DefineMission( 802, "\211\225\232\233\241\242\226\224 \237\229\226\232\237\237\251\245", 802 )
	
	MisBeginTalk( "<t>Я хочу, чтобы Вы убили <r10 Боевых черепах> для меня! Особых причин нет, просто они мне не нравятся.<n><t>Я Вас отблагодарю." )
	MisBeginCondition(LvCheck, ">", 34 )
	MisBeginCondition(NoMission, 802)
	MisBeginCondition(NoRecord, 802)
	MisBeginAction(AddMission, 802)
	MisBeginAction(AddTrigger, 8021, TE_KILL, 141, 10 )--Боевая черепаха
	MisCancelAction(ClearMission, 802)

	MisNeed(MIS_NEED_KILL, 141, 10, 10, 10)
	
	MisHelpTalk( "<t>Мне кажется, что Вы взялись мне помочь. Я не вижу Вашей помощи." )
	MisResultTalk( "<t>Отлично! Вот Ваша награда." )
	MisResultCondition(NoRecord, 802)
	MisResultCondition(HasMission, 802)
	MisResultCondition(HasFlag, 802, 19 )
	MisResultAction(ClearMission, 802)
	MisResultAction(SetRecord, 802)
	MisResultAction(AddExp, 6200, 6200)
	MisResultAction(AddMoney,461,461)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 141 )	
	TriggerAction( 1, AddNextFlag, 802, 10, 10 )
	RegCurTrigger( 8021 )

-----------------------------------Вечная рана
	DefineMission( 803, "\194\229\247\237\224\255 \240\224\237\224", 803 )
	
	MisBeginTalk( "<t>Не так давно я был ранен <rСкелетом воином>. И если бы не морозы я так бы и истекал кровью, но здешний климат не позволяет быстро циркулировать кровь и рана начала заживать.<n><t>Но! у меня началась гангрена и я слышал, что <yПоджаренный черепаший панцирь> из <rСнежной черепахи> обитающей в точке(2165,462)способен избавить меня от гниения.<n><t>Принесите мне <y5 Поджаренных черепашьих панцирей>!" )
	MisBeginCondition(LvCheck, ">", 34 )
	MisBeginCondition(NoMission, 803)
	MisBeginCondition(NoRecord, 803)
	MisBeginAction(AddMission, 803)
	MisBeginAction(AddTrigger, 8031, TE_GETITEM, 4468, 5 )--Поджаренный черепаший панцирь
	MisCancelAction(ClearMission, 803)

	MisNeed(MIS_NEED_ITEM, 4468, 5, 10, 5)
	
	MisHelpTalk( "<t>Если Вы мне не принесёте 5 Поджаренных черепаших панцирей, то я умру от гангрены!" )
	MisResultTalk( " Спасибо Вам, Вы спасли мне жизнь." )
	MisResultCondition(NoRecord, 803)
	MisResultCondition(HasMission, 803)
	MisResultCondition(HasItem, 4468, 5)
	MisResultAction(TakeItem, 4468, 5 )
	MisResultAction(ClearMission, 803)
	MisResultAction(SetRecord, 803)
	MisResultAction(AddExp, 6900, 6900)
	MisResultAction(AddMoney,939,939)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4468 )	
	TriggerAction( 1, AddNextFlag, 803, 10, 5 )
	RegCurTrigger( 8031 )

----------------------------------Сумасшедшая овца
	DefineMission( 804, "\209\243\236\224\241\248\229\228\248\224\255 \238\226\246\224", 804 )
	
	MisBeginTalk( "<t>Эй, вы видели эти <rБезумных овец> в точке(226,590)? Я слышал, что они были простыми овцами, но из-за гнева Богини Кары мутировали в этих ужасных монстров!<n><t>Это само воплощение зла и наказание людям за грехи.<n><t>Друг мой, помоги нам и избавь от этого проклятия наш посёлок! Убей <r10 Безумных овец>. Этим мы сделаем вызов Богам! Вам не интересно?!" )
	MisBeginCondition(LvCheck, ">", 36 )
	MisBeginCondition(NoMission, 804)
	MisBeginCondition(NoRecord, 804)
	MisBeginAction(AddMission, 804)
	MisBeginAction(AddTrigger, 8041, TE_KILL, 297, 10 )--Безумная овца
	MisCancelAction(ClearMission, 804)

	MisNeed(MIS_NEED_KILL, 297, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не убили 10 Безумных овец?" )
	MisResultTalk( "<t>Спасибо за помошь! Не бойтесь гнева Богов!" )
	MisResultCondition(NoRecord, 804)
	MisResultCondition(HasMission, 804)
	MisResultCondition(HasFlag, 804, 19 )
	MisResultAction(ClearMission, 804)
	MisResultAction(SetRecord, 804)
	MisResultAction(AddExp, 7700, 7700)
	MisResultAction(AddMoney,477,477)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 297 )	
	TriggerAction( 1, AddNextFlag, 804, 10, 10 )
	RegCurTrigger( 8041 )

-----------------------------------	Яд скорпиона
	DefineMission( 805, "\223\228 \241\234\238\240\239\232\238\237\224", 805 )
	
	MisBeginTalk( "<t>Привет! Вы как раз вовремя! Моя подруга <bНана> была ужалена скорпионом и сейчас лежит в коме. Что бы спасти её мне нужно <y5 Крови скорпиона> из <rСвирепых скорпионов> в точке(2370,548).Я бы и сам сходил но не могу оставить Нану одну. Вы мне поможете?" )
	MisBeginCondition(LvCheck, ">", 37 )
	MisBeginCondition(NoMission, 805)
	MisBeginCondition(NoRecord, 805)
	MisBeginAction(AddMission, 805)
	MisBeginAction(AddTrigger, 8051, TE_GETITEM, 4482, 5 )--Кровь скорпиона
	MisCancelAction(ClearMission, 805)

	MisNeed(MIS_NEED_ITEM, 4482, 5, 10, 5)
	
	MisHelpTalk( "<t>Моей подруге поможет только <yКровь скорпиона> прийти в себя!" )
	MisResultTalk( "<t>Спасибо! Вы спасли её!" )
	MisResultCondition(NoRecord, 805)
	MisResultCondition(HasMission, 805)
	MisResultCondition(HasItem, 4482, 5)
	MisResultAction(TakeItem, 4482, 5 )
	MisResultAction(ClearMission, 805)
	MisResultAction(SetRecord, 805)
	MisResultAction(AddExp, 8600, 8600)
	MisResultAction(AddMoney,972,972)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4482 )	
	TriggerAction( 1, AddNextFlag, 805, 10, 5 )
	RegCurTrigger( 8051 )

----------------------------------їЄВ·ПИ·ж
----------------------------------Первооткрыватель
	DefineMission( 806, "\207\229\240\226\238\238\242\234\240\251\226\224\242\229\235\252", 806 )
	
	MisBeginTalk( "<t>Привет! Вы вовремя!<n><t>Мы хотим отправиться с Наной в путешествие в неизведанные страны, но на нашем пути появилось серьёзное препятствие!<n><t>В точке(1981,530) обитают <rПолярные медведи>. Они очень опасные и могут убить человека. Пожалуйста убейте <r10 Полярных медведей> и освободите нам дорогу. Мы щедро Вас отблагодарим." )
	MisBeginCondition(LvCheck, ">", 38 )
	MisBeginCondition(NoMission, 806)
	MisBeginCondition(NoRecord, 806)
	MisBeginAction(AddMission, 806)
	MisBeginAction(AddTrigger, 8061, TE_KILL, 259, 10 )--Полярный медведь
	MisCancelAction(ClearMission, 806)

	MisNeed(MIS_NEED_KILL, 259, 10, 10, 10)
	
	MisHelpTalk( "<t>Я Вас попросил очистить нам дорогу от полярных медведей." )
	MisResultTalk( "<t>Спасибо Вам! Теперь мы можем отправляться в путешествие!" )
	MisResultCondition(NoRecord, 806)
	MisResultCondition(HasMission, 806)
	MisResultCondition(HasFlag, 806, 19 )
	MisResultAction(ClearMission, 806)
	MisResultAction(SetRecord, 806)
	MisResultAction(AddExp, 9600, 9600)
	MisResultAction(AddMoney,495,495)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 259 )	
	TriggerAction( 1, AddNextFlag, 806, 10, 10 )
	RegCurTrigger( 8061 )

-----------------------------------Призрачный меч
	DefineMission( 807, "\207\240\232\231\240\224\247\237\251\233 \236\229\247", 807 )
	
	MisBeginTalk( "<t>Привет! Вы знаете почему рядом с (2269,590) бродят Призрачные мечники? Они охраняют <yПризрачный меч>. Мне очень очень хочется посмотреть на него. Принесите мне его за вознаграждение." )
	MisBeginCondition(LvCheck, ">", 38 )
	MisBeginCondition(NoMission, 807)
	MisBeginCondition(NoRecord, 807)
	MisBeginAction(AddMission, 807)
	MisBeginAction(AddTrigger, 8071, TE_GETITEM, 4109, 1 )--Призрачный меч(квестовый лут)
	MisCancelAction(ClearMission, 807)

	MisNeed(MIS_NEED_ITEM, 4109, 1, 10, 1)
	
	MisHelpTalk( "<t>Я ещё не видел призрачный меч!" )
	MisResultTalk( "<t>Ваа! Он прекрасен!" )
	MisResultCondition(NoRecord, 807)
	MisResultCondition(HasMission, 807)
	MisResultCondition(HasItem, 4109, 1)
	MisResultAction(TakeItem, 4109, 1 )
	MisResultAction(ClearMission, 807)
	MisResultAction(SetRecord, 807)
	MisResultAction(AddExp, 9600, 9600)
	MisResultAction(AddMoney,495,495)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4109 )	
	TriggerAction( 1, AddNextFlag, 807, 10, 1 )
	RegCurTrigger( 8071 )

----------------------------------Душа воина
	DefineMission( 808, "\196\243\248\224 \226\238\232\237\224", 808 )
	
	MisBeginTalk( "<t>Может я экстрасенс, так как я слышу стоны погибших воинов. Эти стоны не дают мне покоя! В точке(2269,470) они особенно сильные.<n><t>Я думаю эти стоны издают <rСкелеты-воины>. Пожалуйста отправляйтесь в точку(2269,470) и убейте 10 Скелетов-воинов, что бы отправить их в мир иной и что бы они не мучились на этой земле." )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(NoMission, 808)
	MisBeginCondition(NoRecord, 808)
	MisBeginAction(AddMission, 808)
	MisBeginAction(AddTrigger, 8081, TE_KILL, 268, 10 )--Скелет-воин
	MisCancelAction(ClearMission, 808)

	MisNeed(MIS_NEED_KILL, 268, 10, 10, 10)
	
	MisHelpTalk( "<t>Я всё ещё слышу стоны!" )
	MisResultTalk( "<t>Вы очень добры! Спасибо вам." )
	MisResultCondition(NoRecord, 808)
	MisResultCondition(HasMission, 808)
	MisResultCondition(HasFlag, 808, 19 )
	MisResultAction(ClearMission, 808)
	MisResultAction(SetRecord, 808)
	MisResultAction(AddExp, 10600, 10600)
	MisResultAction(AddMoney,504,504)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 268 )	
	TriggerAction( 1, AddNextFlag, 808, 10, 10 )
	RegCurTrigger( 8081 )

----------------------------------Кровососущее существо
	DefineMission( 809, "\202\240\238\226\238\241\238\241\243\249\229\229 \241\243\249\229\241\242\226\238", 809 )
	
	MisBeginTalk( "<t>В <pСеребренных шахтах> обитает существо, которое питается человеческой кровью.<n><t>Шахтёры боятся там работать! Помогите нам убить <r10 Летучих мышей-вампиров>!" )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 809)
	MisBeginCondition(NoRecord, 809)
	MisBeginAction(AddMission, 809)
	MisBeginAction(AddTrigger, 8091, TE_KILL, 82, 10 )--Летучая мышь-вампир
	MisCancelAction(ClearMission, 809)

	MisNeed(MIS_NEED_KILL, 82, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не убили их, шахтёры в опасности." )
	MisResultTalk( "<t>Спасибо Вам за помощь!" )
	MisResultCondition(NoRecord, 809)
	MisResultCondition(HasMission, 809)
	MisResultCondition(HasFlag, 809, 19 )
	MisResultAction(ClearMission, 809)
	MisResultAction(SetRecord, 809)
	MisResultAction(AddExp, 3500, 3500)
	MisResultAction(AddMoney,424,424)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 82 )	
	TriggerAction( 1, AddNextFlag, 809, 10, 10 )
	RegCurTrigger( 8091 )

-----------------------------------Каска крота-рудокопа
	DefineMission( 810, "\202\224\241\234\224 \234\240\238\242\224-\240\243\228\238\234\238\239\224", 810 )
	
	MisBeginTalk( "<t>Я хочу пойти с Лулу в Шахты поиграть, но нас не пускают Шахтёры из-за того, что на нас нет Касок! Не помогли бы Вы нам? Принесите <y2 Каски крота-рудокопа>, что бы нас пропустили в шахты. Мы Вас отблагодарим.<n><t>Эти каски Вы сможете получить убив Крота рудокопа!" )
	MisBeginCondition(LvCheck, ">", 32 )
	MisBeginCondition(NoMission, 810)
	MisBeginCondition(NoRecord, 810)
	MisBeginAction(AddMission, 810)
	MisBeginAction(AddTrigger, 8101, TE_GETITEM, 4448, 2 )--Каска крота-рудокопа
	MisCancelAction(ClearMission, 810)

	MisNeed(MIS_NEED_ITEM, 4448, 2, 10, 2)
	
	MisHelpTalk( "<t>Как же Вы не поймёте, что без касок нас не пустят в Шахты!?" )
	MisResultTalk( "<t>Спасибо Вам!" )
	MisResultCondition(NoRecord, 810)
	MisResultCondition(HasMission, 810)
	MisResultCondition(HasItem, 4448, 2)
	MisResultAction(TakeItem, 4448, 2 )
	MisResultAction(ClearMission, 810)
	MisResultAction(SetRecord, 810)
	MisResultAction(AddExp, 4900, 4900)
	MisResultAction(AddMoney,892,892)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4448 )	
	TriggerAction( 1, AddNextFlag, 810, 10, 2 )
	RegCurTrigger( 8101 )


-----------------------------------Таинственная грязь
	DefineMission( 811, "\210\224\232\237\241\242\226\229\237\237\224\255 \227\240\255\231\252", 811 )
	
	MisBeginTalk( "<t>Я в шоке! Меня атаковала какая-то мерзкая куча грязи! Её шахтёры называют <rГрязилищем>. Я даже не могла представить, что комок грязи может жить, и тем более нападать на людей! Принесите мне с <rГрязилища> <y5 Грязных липких кексов>, что бы более подробно изучить этот феномен." )
	MisBeginCondition(LvCheck, ">", 33 )
	MisBeginCondition(NoMission, 811)
	MisBeginCondition(NoRecord, 811)
	MisBeginAction(AddMission, 811)
	MisBeginAction(AddTrigger, 8111, TE_GETITEM, 4363, 5 )--Грязный липкий кекс
	MisCancelAction(ClearMission, 811)

	MisNeed(MIS_NEED_ITEM, 4363, 5, 10, 5)
	
	MisHelpTalk( "<t>Отправляйтесь в <pШахты> и прнесите мне от туда <y5 Грязных липких кексов>!" )
	MisResultTalk( "<t>Ох спасибо Вам! Я небедленно начну ставить опыты с этой грязью!" )
	MisResultCondition(NoRecord, 811)
	MisResultCondition(HasMission, 811)
	MisResultCondition(HasItem, 4363, 5)
	MisResultAction(TakeItem, 4363, 5 )
	MisResultAction(ClearMission, 811)
	MisResultAction(SetRecord, 811)
	MisResultAction(AddExp, 5500, 5500)
	MisResultAction(AddMoney,907,907)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4363 )	
	TriggerAction( 1, AddNextFlag, 811, 10, 5 )
	RegCurTrigger( 8111 )

----------------------------------Месть грязи
	DefineMission( 812, "\204\229\241\242\252 \227\240\255\231\232", 812 )
	
	MisBeginTalk( "<t>Я хотел в <pСеребренных Шахтах> немного по добывать Руды, но на меня напали <rГрязилища>. Вы не могли бы убить 10 Грязилищь в точке(934,2747), что бы можно было без боязни Грязилищь добывать руду?" )
	MisBeginCondition(LvCheck, ">", 34 )
	MisBeginCondition(NoMission, 812)
	MisBeginCondition(NoRecord, 812)
	MisBeginAction(AddMission, 812)
	MisBeginAction(AddTrigger, 8121, TE_KILL, 253, 10 )--Грязилище
	MisCancelAction(ClearMission, 812)

	MisNeed(MIS_NEED_KILL, 253, 10, 10, 10)
	
	MisHelpTalk( "<t>Мне до сих пор страшно!" )
	MisResultTalk( "<t>Спасибо, спасибо вам!" )
	MisResultCondition(NoRecord, 812)
	MisResultCondition(HasMission, 812)
	MisResultCondition(HasFlag, 812, 19 )
	MisResultAction(ClearMission, 812)
	MisResultAction(SetRecord, 812)
	MisResultAction(AddExp, 6200, 6200)
	MisResultAction(AddMoney,461,461)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 253 )	
	TriggerAction( 1, AddNextFlag, 812, 10, 10 )
	RegCurTrigger( 8121 )


----------------------------------Крот-рудокоп
	DefineMission( 813, "\202\240\238\242-\240\243\228\238\234\238\239", 813 )
	
	MisBeginTalk( "<t>Я, как раз заканчивал свои исследования в <pСеребренных шахтах>, как на меня напали <rКроты-рудокопы>. Не помогли бы Вы мне с завершением моих исследований? Убейте <r10 Кротов Рудокопов> мешающих моим исследованиям!" )
	MisBeginCondition(LvCheck, ">", 35 )
	MisBeginCondition(NoMission, 813)
	MisBeginCondition(NoRecord, 813)
	MisBeginAction(AddMission, 813)
	MisBeginAction(AddTrigger, 8131, TE_KILL, 88, 10 )--Крот-рудокоп
	MisCancelAction(ClearMission, 813)

	MisNeed(MIS_NEED_KILL, 88, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы не убили ещё 10 Кротов Рудокопов!" )
	MisResultTalk( "<t>Спасибо! Вы мне очень помогли!" )
	MisResultCondition(NoRecord, 813)
	MisResultCondition(HasMission, 813)
	MisResultCondition(HasFlag, 813, 19 )
	MisResultAction(ClearMission, 813)
	MisResultAction(SetRecord, 813)
	MisResultAction(AddExp, 6900, 6900)
	MisResultAction(AddMoney,469,469)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 88 )	
	TriggerAction( 1, AddNextFlag, 813, 10, 10 )
	RegCurTrigger( 8131 )

-----------------------------------Меч ниндзя
	DefineMission( 814, "\204\229\247 \237\232\237\228\231\255", 814 )
	
	MisBeginTalk( "<t><rКрот-нинзя> использует уникальное оружие. Это оружие носит название <yМеч ниндзя>. Это очень хорошее оружие, оно опасное и, в то же время, точно бьющее.<n><t>Принесите мне <y10 мечей ниндзя>. Кротов нинзя Вы встретите в <pСеребренных шахтах 2>. Я буду ждать Вас тут!" )
	MisBeginCondition(LvCheck, ">", 33 )
	MisBeginCondition(NoMission, 814)
	MisBeginCondition(NoRecord, 814)
	MisBeginAction(AddMission, 814)
	MisBeginAction(AddTrigger, 8141, TE_GETITEM, 3935, 10 )--Меч ниндзя
	MisCancelAction(ClearMission, 814)

	MisNeed(MIS_NEED_ITEM, 3935, 10, 10, 10)
	
	MisHelpTalk( "<t>Вы ещё не принеси мне Меч Ниндзя?" )
	MisResultTalk( "<t>Я очень Вам благодарен!" )
	MisResultCondition(NoRecord, 814)
	MisResultCondition(HasMission, 814)
	MisResultCondition(HasItem, 3935, 10)
	MisResultAction(TakeItem, 3935, 10 )
	MisResultAction(ClearMission, 814)
	MisResultAction(SetRecord, 814)
	MisResultAction(AddExp, 8600, 8600)
	MisResultAction(AddMoney,972,972)


	InitTrigger()
	TriggerCondition( 1, IsItem, 3935 )	
	TriggerAction( 1, AddNextFlag, 814, 10, 10 )
	RegCurTrigger( 8141 )

-----------------------------------Тест
	DefineMission( 837, "\210\229\241\242", 837 )
	
	MisBeginTalk( "<t>Вы в первые в <pХолдейском оплоте>? Я уверен, что Вы ищите приключения и работу.<n><t>Почему бы Вам не пройти моё испытание и если у вас получится я дам для Вас работу!.<n><t>Убейте <r5 Опытных туземных воинов> и возвращайтесь ко мне." )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(NoMission, 837)
	MisBeginCondition(NoRecord, 837)
	MisBeginAction(AddMission, 837)
	MisBeginAction(AddTrigger, 8371, TE_KILL, 248, 5 )--Опытный туземный воин
	MisCancelAction(ClearMission, 837)

	MisNeed(MIS_NEED_DESP, "Help Simon Gilter at (646, 2088) to get rid of 5 Tribal Warriors")
	MisNeed(MIS_NEED_KILL, 248, 5, 10, 5)

	MisHelpTalk( "Вы не прошли моё испытание! Попробуйте ещё раз сходить и убить 5 Опытных туземных воинов!" )
	MisResultTalk( "Хорошо! Вы заслужили моё доверие." )
	MisResultCondition(NoRecord, 837)
	MisResultCondition(HasMission, 837)
	MisResultCondition(HasFlag, 837, 14)
	MisResultAction(ClearMission, 837)
	MisResultAction(SetRecord, 837)
	MisResultAction(AddExp,15692,15692)
	MisResultAction(AddMoney,1026,1026)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 248 )	
	TriggerAction( 1, AddNextFlag, 837, 10, 5 )
	RegCurTrigger( 8371 )


-----------------------------------Тест2
	DefineMission( 838, "\210\229\241\242 2", 838 )
	
	MisBeginTalk( "<t>Хотя... Убить <r5 Опытных туземных воинов> а вот с армией из <r30 Опытных туземных воинов> справиться ни каждый! Докажи что ты не трус и убей <r30 Опытных туземных воинов>." )
	--MisBeginCondition(LvCheck, ">", 40 )
	MisBeginCondition(HasRecord, 837)
	MisBeginCondition(NoMission, 838)
	MisBeginCondition(NoRecord, 838)
	MisBeginAction(AddMission, 838)
	MisBeginAction(AddTrigger, 8381, TE_KILL, 248, 30 )--Опытный туземный воин
	MisCancelAction(ClearMission, 838)
	
	MisNeed(MIS_NEED_DESP, "Help Simon Gilter at (646, 2088) to get rid of 30 Tribal Warriors")
	MisNeed(MIS_NEED_KILL, 248, 30, 10, 30)
	
	MisHelpTalk( " Вы ещё не доказали мне что Вы не простой проходимец!" )
	MisResultTalk( " Вы оказались достойным войном!" )
	MisResultCondition(NoRecord, 838)
	MisResultCondition(HasMission, 838)
	MisResultCondition(HasFlag, 838, 39)
	MisResultAction(ClearMission, 838)
	MisResultAction(SetRecord, 838)
	MisResultAction(AddExp,15692,15692)
	MisResultAction(AddMoney,1026,1026)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 248 )	
	TriggerAction( 1, AddNextFlag, 838, 10, 30 )
	RegCurTrigger( 8381 )


-----------------------------------Работа
	DefineMission( 839, "\208\224\225\238\242\224", 839 )
	
	MisBeginTalk( "<t>Отлично! Я вижу, что вы готовы к тому, что бы я дал для Вас работу! Отнеситесь со всей серьёзностью к ней!<n><t>Я собираю коллекционные предметы, и в моей коллекции не хватает <yТуземного щита>. Принесите мне <y12 Туземных щитов>, что бы я смог выбрать самый хороший из них." )
	--MisBeginCondition(LvCheck, ">", 40 )
	MisBeginCondition(HasRecord, 838)
	MisBeginCondition(NoMission, 839)
	MisBeginCondition(NoRecord, 839)
	MisBeginAction(AddMission, 839)
	MisBeginAction(AddTrigger, 8391, TE_GETITEM, 4914, 12 )--Туземный щит
	MisCancelAction(ClearMission, 839)
	
	MisNeed(MIS_NEED_DESP, " Принести <bСимону Гилтеру> в точку(646,2088) <12 Туземных щитов>." )
	MisNeed(MIS_NEED_ITEM, 4914, 12, 10, 12)
	
	MisHelpTalk( " Вы ещё не принесли мне 12 Туземных Щитов." )
	MisResultTalk( "<t>О Боже! Все 12 Щитов такие прекрасные, что я теряюсь в выборе! Спасибо Вам большое." )
	MisResultCondition(NoRecord, 839)
	MisResultCondition(HasMission, 839)
	MisResultCondition(HasItem, 4914, 12)
	MisResultAction(TakeItem, 4914, 12)
	MisResultAction(ClearMission, 839)
	MisResultAction(SetRecord, 839)
	MisResultAction(AddExp,15692,15692)
	MisResultAction(AddMoney,10026,10026)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4914 )	
	TriggerAction( 1, AddNextFlag, 839, 10, 12 )
	RegCurTrigger( 8391 )



-----------------------------------Энтузиаст-----Азур Бриз---Холдея--
	DefineMission( 840, "\221\237\242\243\231\232\224\241\242", 840 )
	
	MisBeginTalk( "<t>Привет! Я занимаюсь искусным делом. Я вырезаю из корней деревьев красивые поделки, такие как: вазы, вешалки и ещё много чего.<n><t>У меня закончились корни, не могли бы Вы принести мне <y5 Высохших корней> из <rЭнта>?" )
	MisBeginCondition(LvCheck, ">", 42 )
	--MisBeginCondition(HasRecord, 838)
	MisBeginCondition(NoMission, 840)
	MisBeginCondition(NoRecord, 840)
	MisBeginAction(AddMission, 840)
	MisBeginAction(AddTrigger, 8401, TE_GETITEM, 4915, 5 )--Высохший корень
	MisCancelAction(ClearMission, 840)
	
	MisNeed(MIS_NEED_DESP, " Принести <y5 Высохших корней> <bАзур Бриз> в точку (622,2106)" )
	MisNeed(MIS_NEED_ITEM, 4915, 5, 10, 5)
	
	MisHelpTalk( " Спасибо что решили мне помочь! Принесите мне 5 Высохших корней." )
	MisResultTalk( " Спасибо! Следущую вещь которую я сделаю это будет Ваша статуя!" )
	MisResultCondition(NoRecord, 840)
	MisResultCondition(HasMission, 840)
	MisResultCondition(HasItem, 4915, 5)
	MisResultAction(TakeItem, 4915, 5)
	MisResultAction(ClearMission, 840)
	MisResultAction(SetRecord, 840)
	MisResultAction(AddExp,19294,19294)	
	MisResultAction(AddMoney,1064,1064)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4915 )	
	TriggerAction( 1, AddNextFlag, 840, 10, 5 )
	RegCurTrigger( 8401 )

-----------------------------------Сбор образцов---Са Мори--холдея---
	DefineMission( 841, "\209\225\238\240 \238\225\240\224\231\246\238\226", 841 )
	
	MisBeginTalk( "<t>Вы знаете как сделать так, что бы свечи горели всегда? Они сделаны из специальных корней, которые можно найти к востоку от сюда. Однако, на пути будет очень много страшных монстров." )
	--MisBeginCondition(LvCheck, ">", 42 )
	MisBeginCondition(HasRecord, 844)
	MisBeginCondition(NoMission, 841)
	MisBeginCondition(NoRecord, 841)
	MisBeginAction(AddMission, 841)
	MisBeginAction(AddTrigger, 8411, TE_GETITEM, 4915, 1 )--Высохший корень
	MisBeginAction(AddTrigger, 8412, TE_KILL, 107, 5 )------Энт
	MisCancelAction(ClearMission, 841)
	
	MisNeed(MIS_NEED_DESP, " Убить <r5 Энтов> и принести один <yВысохший корень> <bСа Мори> в точку(628,2095)." )
	MisNeed(MIS_NEED_ITEM, 4915, 1, 20, 1)
	MisNeed(MIS_NEED_KILL, 107, 5, 10, 5)
	
	MisHelpTalk( " Принесите мне всё необходимое, что бы я сделала свечки, которые будут гореть всё вечно!" )
	MisResultTalk( " Спасибо Вам! Возможно в будующем Вы их увидете!" )
	MisResultCondition(NoRecord, 841)
	MisResultCondition(HasMission, 841)
	MisResultCondition(HasItem, 4915, 1)
	MisResultCondition(HasFlag, 841, 14)
	MisResultAction(TakeItem, 4915, 1)
	MisResultAction(ClearMission, 841)
	MisResultAction(SetRecord, 841)
	MisResultAction(AddExp,19294,19294)
	MisResultAction(AddMoney,1064,1064)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4915 )	
	TriggerAction( 1, AddNextFlag, 841, 20, 1 )
	RegCurTrigger( 8411 )
	InitTrigger()
	TriggerCondition( 1, IsMonster,	107 )	
	TriggerAction( 1, AddNextFlag, 841, 10, 5 )
	RegCurTrigger( 8412 )

-----------------------------------Вечное пламя свечей
	DefineMission( 842, "\194\229\247\237\238\229 \239\235\224\236\255 \241\226\229\247\229\233", 842 )
	
	MisBeginTalk( "<t>Я только что закончила изучать метод изготовления вечно-горящих свечей. Я хочу попробовать приготовить большую партию свечей, для этого мне надо <y15 Высохших корней>." )
	--MisBeginCondition(LvCheck, ">", 42 )
	MisBeginCondition(HasRecord, 841)
	MisBeginCondition(NoMission, 842)
	MisBeginCondition(NoRecord, 842)
	MisBeginAction(AddMission, 842)
	MisBeginAction(AddTrigger, 8421, TE_GETITEM, 4915, 15 )--Высохший корень
	MisCancelAction(ClearMission, 842)
	
	MisNeed(MIS_NEED_DESP, " Принести <y15 высохших корней> <bСа Мори> в точку(628,2095)." )
	MisNeed(MIS_NEED_ITEM, 4915, 15, 10, 15)
	
	MisHelpTalk( " Принесите мне игредиенты для изготовления свечей и я поделюсь с Вами доходом с их продаж!" )
	MisResultTalk( " Спасибо! Вот Ваша доля!" )
	MisResultCondition(NoRecord, 842)
	MisResultCondition(HasMission, 842)
	MisResultCondition(HasItem, 4915, 15)
	MisResultAction(TakeItem, 4915, 15)
	MisResultAction(ClearMission, 842)
	MisResultAction(SetRecord, 842)
	MisResultAction(AddExp,19294,19294)	
	MisResultAction(AddMoney,1064,1064)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4915 )	
	TriggerAction( 1, AddNextFlag, 842, 10, 15 )
	RegCurTrigger( 8421 )

-----------------------------------Черный монстр
	DefineMission( 843, "\215\229\240\237\251\233 \236\238\237\241\242\240", 843 )
	
	MisBeginTalk( "<t>Не так давно я видел в здешних лесах Чёрных монстров со свечами на головах. Именно их свечи и заинтересовали меня.<n><t>Принесите мне 1 <yИспользованную свечу> и убейте <r5 Темных грязилищ>. После чего возвращайтесь ко мне за наградой!" )
	MisBeginCondition(LvCheck, ">", 42 )
	--MisBeginCondition(HasRecord, 844)
	MisBeginCondition(NoMission, 843)
	MisBeginCondition(NoRecord, 843)
	MisBeginAction(AddMission, 843)
	MisBeginAction(AddTrigger, 8431, TE_GETITEM, 4823, 1 )--Использованная свеча
	MisBeginAction(AddTrigger, 8432, TE_KILL, 503, 5 )------Темное грязилище
	MisCancelAction(ClearMission, 843)
	
	MisNeed(MIS_NEED_DESP, " Убейте <r5 Тёмных Грязилищ> и пренисите 1 <yИспользованную Свечу> в точку (628,2095)" )
	MisNeed(MIS_NEED_ITEM, 4823, 1, 20, 1)
	MisNeed(MIS_NEED_KILL, 503, 5, 10, 5)
	
	MisHelpTalk( " Эти существа обитают в здешних лесах." )
	MisResultTalk( " Спасибо Вам большое!" )
	MisResultCondition(NoRecord, 843)
	MisResultCondition(HasMission, 843)
	MisResultCondition(HasItem, 4823, 1)
	MisResultCondition(HasFlag, 843, 14)
	MisResultAction(TakeItem, 4823, 1)
	MisResultAction(ClearMission, 843)
	MisResultAction(SetRecord, 843)
	MisResultAction(AddExp,19294,19294)
	MisResultAction(AddMoney,1064,1064)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4823 )	
	TriggerAction( 1, AddNextFlag, 843, 20, 1 )
	RegCurTrigger( 8431 )
	InitTrigger()
	TriggerCondition( 1, IsMonster,	503 )	
	TriggerAction( 1, AddNextFlag, 843, 10, 5 )
	RegCurTrigger( 8432 )

-----------------------------------Исследование свечей
	DefineMission( 844, "\200\241\241\235\229\228\238\226\224\237\232\229 \241\226\229\247\229\233", 844 )
	
	MisBeginTalk( "<t>Я изучил Свечку которую Вы мне принесли и пришёл к выводу, что эти свечи обладают магической силой. Но одной свечки мне мало для точного вывода, по этому принесите мне больше свечей!" )
	--MisBeginCondition(LvCheck, ">", 42 )
	MisBeginCondition(HasRecord, 843)
	MisBeginCondition(NoMission, 844)
	MisBeginCondition(NoRecord, 844)
	MisBeginAction(AddMission, 844)
	MisBeginAction(AddTrigger, 8441, TE_GETITEM, 4823, 10 )--Использованная свеча
	MisCancelAction(ClearMission, 844)
	
	MisNeed(MIS_NEED_DESP, "<t>Принести в точку (628,2095) 10 Использованных свечей!" )
	MisNeed(MIS_NEED_ITEM, 4823, 10, 10, 10)
	
	MisHelpTalk( " Я жду когда Вы мне принесёте 10 Использованных свечей!" )
	MisResultTalk( " Спасибо! Я немедленно приступаю к экспериментам!" )
	MisResultCondition(NoRecord, 844)
	MisResultCondition(HasMission, 844)
	MisResultCondition(HasItem, 4823, 10)
	MisResultAction(TakeItem, 4823, 10)
	MisResultAction(ClearMission, 844)
	MisResultAction(SetRecord, 844)
	MisResultAction(AddExp,19294,19294)
	MisResultAction(AddMoney,1064,1064)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4823 )	
	TriggerAction( 1, AddNextFlag, 844, 10, 10 )
	RegCurTrigger( 8441 )


-----------------------------------Гранитный голем
	DefineMission( 845, "\195\240\224\237\232\242\237\251\233 \227\238\235\229\236", 845 )
	
	MisBeginTalk( "<t>В здешних местах участились нападения на людей от <rГранитных Големов>.<n><t>Идите и убейте <r5 Гранитных Голема> и принесите в знак доказательства <y1 кусок мерцающего камня>!" )
	MisBeginCondition(LvCheck, ">", 45 )
	--MisBeginCondition(HasRecord, 844)
	MisBeginCondition(NoMission, 845)
	MisBeginCondition(NoRecord, 845)
	MisBeginAction(AddMission, 845)
	MisBeginAction(AddTrigger, 8451, TE_GETITEM, 4825, 1 )--Кусок мерцающего камня
	MisBeginAction(AddTrigger, 8452, TE_KILL, 505, 5 )------Гранитный голем
	MisCancelAction(ClearMission, 845)
	
	MisNeed(MIS_NEED_DESP, " Убейте <r5 Гранитных Големов> и принесите 1 <yКусок мерцающего камня> в точку(626,2100)." )
	MisNeed(MIS_NEED_ITEM, 4825, 1, 20, 1)
	MisNeed(MIS_NEED_KILL, 505, 5, 10, 5)
	
	MisHelpTalk( " Вы ещё не сделали то о чём я Вас попросил." )
	MisResultTalk( " Спасибо Вы мне помогли!" )
	MisResultCondition(NoRecord, 845)
	MisResultCondition(HasMission, 845)
	MisResultCondition(HasItem, 4825, 1)
	MisResultCondition(HasFlag, 845, 14)
	MisResultAction(TakeItem, 4825, 1)
	MisResultAction(ClearMission, 845)
	MisResultAction(SetRecord, 845)
	MisResultAction(AddExp,26112,26112)	
	MisResultAction(AddMoney,1125,1125)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4825 )	
	TriggerAction( 1, AddNextFlag, 845, 20, 1 )
	RegCurTrigger( 8451 )
	InitTrigger()
	TriggerCondition( 1, IsMonster,	505 )	
	TriggerAction( 1, AddNextFlag, 845, 10, 5 )
	RegCurTrigger( 8452 )

-----------------------------------Камень на экспертизу
	DefineMission( 846, "\202\224\236\229\237\252 \237\224 \253\234\241\239\229\240\242\232\231\243", 846 )
	
	MisBeginTalk( "<t>Тот камень, который Вы мне принесли обладает странными свойствами, он притягивает другие камни и оживляет их. Не принесёте мне ещё <y6 Кусоков мерцающего камня> для исследования?" )
	--MisBeginCondition(LvCheck, ">", 42 )
	MisBeginCondition(HasRecord, 845)
	MisBeginCondition(NoMission, 846)
	MisBeginCondition(NoRecord, 846)
	MisBeginAction(AddMission, 846)
	MisBeginAction(AddTrigger, 8461, TE_GETITEM, 4825, 6 )--Кусок мерцающего камня
	MisCancelAction(ClearMission, 846)
	
	MisNeed(MIS_NEED_DESP, " Принести <y6 Кусоков мерцающего камня> в точку(626,2100)" )
	MisNeed(MIS_NEED_ITEM, 4825, 6, 10, 6)
	
	MisHelpTalk( " Вы ещё не пробовали сходить за Кусокоми мерцающего камня?" )
	MisResultTalk( " Вы сыграли большую роль в этом исследованние." )
	MisResultCondition(NoRecord, 846)
	MisResultCondition(HasMission, 846)
	MisResultCondition(HasItem, 4825, 6)
	MisResultAction(TakeItem, 4825, 6)
	MisResultAction(ClearMission, 846)
	MisResultAction(SetRecord, 846)
	MisResultAction(AddExp,26112,26112)	
	MisResultAction(AddMoney,1125,1125)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4825 )	
	TriggerAction( 1, AddNextFlag, 846, 10, 6 )
	RegCurTrigger( 8461 )


-----------------------------------	Действительность
	DefineMission( 847, "\196\229\233\241\242\226\232\242\229\235\252\237\238\241\242\252", 847 )
	
	MisBeginTalk( "<t>Я бы ещё хотел провести независимое расследование о монстрах этих лесов и для этого мне нужна Ваша помошь!" )
	--MisBeginCondition(LvCheck, ">", 45 )
	MisBeginCondition(HasRecord, 846)
	MisBeginCondition(NoMission, 847)
	MisBeginCondition(NoRecord, 847)
	MisBeginAction(AddMission, 847)
	MisBeginAction(AddTrigger, 8471, TE_GETITEM, 4917, 1 )--Непробиваемый шлем
	MisBeginAction(AddTrigger, 8472, TE_KILL, 267, 5 )------Неупокоенный воин
	MisCancelAction(ClearMission, 847)
	
	MisNeed(MIS_NEED_DESP, " Убейте <r5 Неупокоенных воинов> и пренесите 1 <yнепробиваемый шлем> <bКарину Ливингстону> в точку(626,2100)." )
	MisNeed(MIS_NEED_ITEM, 4917, 1, 20, 1)
	MisNeed(MIS_NEED_KILL, 267, 5, 10, 5)
	
	MisHelpTalk( " Пожалуйста сделайте то о чём я Вас попросил." )
	MisResultTalk(" Спасибо! Вы мне очень помогли." )
	MisResultCondition(NoRecord, 847)
	MisResultCondition(HasMission, 847)
	MisResultCondition(HasItem, 4917, 1)
	MisResultCondition(HasFlag, 847, 14)
	MisResultAction(TakeItem, 4917, 1)
	MisResultAction(ClearMission, 847)
	MisResultAction(SetRecord, 847)
	MisResultAction(AddExp,28832,28832)
	MisResultAction(AddMoney,1146,1146)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4917 )	
	TriggerAction( 1, AddNextFlag, 847, 20, 1 )
	RegCurTrigger( 8471 )
	InitTrigger()
	TriggerCondition( 1, IsMonster,	267 )	
	TriggerAction( 1, AddNextFlag, 847, 10, 5 )
	RegCurTrigger( 8472 )


-----------------------------------Непробиваемый шлем
	DefineMission( 848, "\205\229\239\240\238\225\232\226\224\229\236\251\233 \248\235\229\236", 848 )
	
	MisBeginTalk( "<t>Если бы я смог понять из чего эти шлемы, то возможно я бы смог изготовлять их сам!" )
	--MisBeginCondition(LvCheck, ">", 42 )
	MisBeginCondition(HasRecord, 847)
	MisBeginCondition(NoMission, 848)
	MisBeginCondition(NoRecord, 848)
	MisBeginAction(AddMission, 848)
	MisBeginAction(AddTrigger, 8481, TE_GETITEM, 4917, 10 )--Непробиваемый шлем
	MisCancelAction(ClearMission, 848)
	
	MisNeed(MIS_NEED_DESP, " Принести <y10 Непробиваемых шлемов> <bКарину Ливингстону> в точку(626,2100)" )
	MisNeed(MIS_NEED_ITEM, 4917, 10, 10, 10)
	
	MisHelpTalk( " Так Вы мне поможете или просто будете тратить моё время?!" )
	MisResultTalk( " Я смогу много заработать на изготовлении таких шлемов. Вот Ваша награда." )
	MisResultCondition(NoRecord, 848)
	MisResultCondition(HasMission, 848)
	MisResultCondition(HasItem, 4917, 10)
	MisResultAction(TakeItem, 4917, 10)
	MisResultAction(ClearMission, 848)
	MisResultAction(SetRecord, 848)
	MisResultAction(AddExp,28832,28832)
	MisResultAction(AddMoney,1146,1146)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4917 )	
	TriggerAction( 1, AddNextFlag, 848, 10, 10 )
	RegCurTrigger( 8481 )

-----------------------------------Распад----Navy HQ - Полковник Макси
	DefineMission( 849, "\208\224\241\239\224\228", 849 )
	
	MisBeginTalk( "<t>Если Вы тут на экскурсии то Вы нашли самое не подходящее время! Наш Город находится в оцеплении ужасных монстров!<n><t>Если бы Вы смогли помочь нашему Городу я был бы Вам очень признателен.<n><t>Ослабьте силы противника убив <r20 Непобедимых Вервольф-воинов>." )
	MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(NoMission, 849)
	MisBeginCondition(NoRecord, 849)
	MisBeginAction(AddMission, 849)
	MisBeginAction(AddTrigger, 8491, TE_KILL, 513, 20 )--Непобедимый Вервольф-воин
	MisCancelAction(ClearMission, 849)

	MisNeed(MIS_NEED_DESP, " Убить <r20 Непобедимых Вервольф-воинов> и доложить о выполнении задачи <bПолковнику Макси> в точке(653,1505)" )
	MisNeed(MIS_NEED_KILL, 513, 20, 10, 20)

	MisHelpTalk(" Я ещё раз повторяю! Это Вам не экскурсия и если Вы решили нам помочь то помогайте! Нет... Так не крутитесь под ногами!" )
	MisResultTalk( " Спасибо! Вы сделали доброе дело!" )
	MisResultCondition(NoRecord, 849)
	MisResultCondition(HasMission, 849)
	MisResultCondition(HasFlag, 849, 29)
	MisResultAction(ClearMission, 849)
	MisResultAction(SetRecord, 849)
	MisResultAction(AddExp,31809,31809)
	MisResultAction(AddMoney,1167,1167)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 513 )	
	TriggerAction( 1, AddNextFlag, 849, 10, 20 )
	RegCurTrigger( 8491 )

-----------------------------------Кровожадный молот---Инструменты Уэсли
	DefineMission( 850, "\202\240\238\226\238\230\224\228\237\251\233 \236\238\235\238\242", 850 )
	
	MisBeginTalk( "<t>Я коллекционер! И я собираю только лучшее оружие. Не так давно я обратил внимание на <yКровожадный молот> у <rНепобедимого Вервольф-воина>, он великолепен! Принесите мне <y10 Кровожадных молотов>, что бы я мог выбрать из них самый лучший!" )
	MisBeginCondition(LvCheck, ">", 48 )
	--MisBeginCondition(HasRecord, 847)
	MisBeginCondition(NoMission, 850)
	MisBeginCondition(NoRecord, 850)
	MisBeginAction(AddMission, 850)
	MisBeginAction(AddTrigger, 8501, TE_GETITEM, 4833, 10 )--Кровожадный молот
	MisCancelAction(ClearMission, 850)
	
	MisNeed(MIS_NEED_DESP, " Принести <bУэсли> в точку(741,1563) <y10 Кровожадных молотов>." )
	MisNeed(MIS_NEED_ITEM, 4833, 10, 10, 10)
	
	MisHelpTalk( " Я же уже дал Вам поручение!" )
	MisResultTalk( " Они великолепны! Вы сделали меня самым счастливым коллекционером." )
	MisResultCondition(NoRecord, 850)
	MisResultCondition(HasMission, 850)
	MisResultCondition(HasItem, 4833, 10)
	MisResultAction(TakeItem, 4833, 10)
	MisResultAction(ClearMission, 850)
	MisResultAction(SetRecord, 850)
	MisResultAction(AddExp,35066,35066)	
	MisResultAction(AddMoney,1189,1189)



	InitTrigger()
	TriggerCondition( 1, IsItem, 4833 )	
	TriggerAction( 1, AddNextFlag, 850, 10, 10 )
	RegCurTrigger( 8501 )


-----------------------------------Первый ингредиент----Морфеус Фрея
	DefineMission( 851, "\207\229\240\226\251\233 \232\237\227\240\229\228\232\229\237\242", 851 )
	
	MisBeginTalk( "<t>Если Вы лентяй или у Вас нету желания чего ни будь делать, то лучше не тратьте моё время! Если всё же Вы не такой, то я возьму Вас в свои помощники и заплачу Вам за Вашу работу!<n><t>Первое, что мне необходимо, это собрать особые ингредиенты для опытов!" )
	MisBeginCondition(LvCheck, ">", 47 )
	--MisBeginCondition(HasRecord, 847)
	MisBeginCondition(NoMission, 851)
	MisBeginCondition(NoRecord, 851)
	MisBeginAction(AddMission, 851)
	MisBeginAction(AddTrigger, 8511, TE_GETITEM, 4883, 8 )--Ноготь мумии
	MisCancelAction(ClearMission, 851)
	
	MisNeed(MIS_NEED_DESP, " Принести <bФрею> в точку (651,1585) <y8 Ногтей мумии>." )
	MisNeed(MIS_NEED_ITEM, 4883, 8, 10, 8)
	
	MisHelpTalk( " Коллега, Вы так ещё и не принесли мне <y8 ногтей мумии>." )
	MisResultTalk( " Спасибо, подойдите ко мне по-позже. У меня ещё будут для Вас поручения." )
	MisResultCondition(NoRecord, 851)
	MisResultCondition(HasMission, 851)
	MisResultCondition(HasItem, 4883, 8)
	MisResultAction(TakeItem, 4883, 8)
	MisResultAction(ClearMission, 851)
	MisResultAction(SetRecord, 851)
	MisResultAction(AddExp,31809,31809)	
	MisResultAction(AddMoney,1167,1167)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4883 )	
	TriggerAction( 1, AddNextFlag, 851, 10, 8 )
	RegCurTrigger( 8511 )

-----------------------------------Месть---Капита стражи Маллак
	DefineMission( 852, "\204\229\241\242\252", 852 )
	
	MisBeginTalk( "Черт бы побрал этих <rЖелезных мумии>! Они убили мою жену и превратил ее в себе подобную! Я очень любил свою жену, и до сих пор люблю, и не могу убивать их так, как не буду уверен в том, что убиваю не свою жену. Вы могли бы пойти и сделать это за меня?!" )
	MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(NoMission, 852)
	MisBeginCondition(NoRecord, 852)
	MisBeginAction(AddMission, 852)
	MisBeginAction(AddTrigger, 8521, TE_KILL, 41, 15 )--Железная мумия
	MisCancelAction(ClearMission, 852)

	MisNeed(MIS_NEED_DESP, " Убить <r15 Железных Мумии> и вернуться к <bКапитану стражи Малку> в точку(706,1465)." )
	MisNeed(MIS_NEED_KILL, 41, 15, 10, 15)

	MisHelpTalk( " Вы не поможете мне отомстить?" )
	MisResultTalk( " Спасибо Вам, если бы не Вы мне самому пришлось бы это сделать, но я потом не смог бы себе простить и жил бы с мыслью, что убил свою жену." )
	MisResultCondition(NoRecord, 852)
	MisResultCondition(HasMission, 852)
	MisResultCondition(HasFlag, 852, 24)
	MisResultAction(ClearMission, 852)
	MisResultAction(SetRecord, 852)
	MisResultAction(AddExp,31809,31809)	
	MisResultAction(AddMoney,1167,1167)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 41 )	
	TriggerAction( 1, AddNextFlag, 852, 10, 15 )
	RegCurTrigger( 8521 )

-----------------------------------Третий компонент
	DefineMission( 853, "\210\240\229\242\232\233 \234\238\236\239\238\237\229\237\242", 853 )
	
	MisBeginTalk( "<t>С первыми моими просьбами Вы справились как нельзя лучше! Вот Вам моё третее поручение: Принесите мне <y10 Громадных шипов дурмана>." )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 854)
	MisBeginCondition(NoMission, 853)
	MisBeginCondition(NoRecord, 853)
	MisBeginAction(AddMission, 853)
	MisBeginAction(AddTrigger, 8531, TE_GETITEM, 4834, 10 )--Громадный шип дурмана
	MisCancelAction(ClearMission, 853)
	
	MisNeed(MIS_NEED_DESP, " Принести 10 Громадных шипов дурмана в точку(651,1585)." )
	MisNeed(MIS_NEED_ITEM, 4834, 10, 10, 10)
	
	MisHelpTalk( " Не растраивайте меня!" )
	MisResultTalk( "Хорошо! Мне Вы ещё нужны будете, но позже." )
	MisResultCondition(NoRecord, 853)
	MisResultCondition(HasMission, 853)
	MisResultCondition(HasItem, 4834, 10)
	MisResultAction(TakeItem, 4834, 10)
	MisResultAction(ClearMission, 853)
	MisResultAction(SetRecord, 853)
	MisResultAction(AddExp,35066,35066)	
	MisResultAction(AddMoney,1189,1189)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4834 )	
	TriggerAction( 1, AddNextFlag, 853, 10, 10 )
	RegCurTrigger( 8531 )

-----------------------------------	Второй ингредиент
	DefineMission( 854, "\194\242\238\240\238\233 \232\237\227\240\229\228\232\229\237\242", 854 )
	
	MisBeginTalk( "<t>Я не буду повторяться! Вы уже поняли, что я ставлю эксперименты и мне нужны ингредиенты.<n><t>Принесите мне <y10 Волос Мумии>." )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 851)
	MisBeginCondition(NoMission, 854)
	MisBeginCondition(NoRecord, 854)
	MisBeginAction(AddMission, 854)
	MisBeginAction(AddTrigger, 8541, TE_GETITEM, 4884, 10 )--Волосы мумии
	MisCancelAction(ClearMission, 854)
	
	MisNeed(MIS_NEED_DESP, " Принести <bМорфеусу Фрею> в точку(651,1585) <y10 Волос мумии>." )
	MisNeed(MIS_NEED_ITEM, 4884, 10, 10, 10)
	
	MisHelpTalk( " Время деньги мой друг! Поспешите!" )
	MisResultTalk( " Отлично! Не уходите далеко!" )
	MisResultCondition(NoRecord, 854)
	MisResultCondition(HasMission, 854)
	MisResultCondition(HasItem, 4884, 10)
	MisResultAction(TakeItem, 4884, 10)
	MisResultAction(ClearMission, 854)
	MisResultAction(SetRecord, 854)
	MisResultAction(AddExp,35066,35066)
	MisResultAction(AddMoney,1189,1189)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4884 )	
	TriggerAction( 1, AddNextFlag, 854, 10, 10 )
	RegCurTrigger( 8541 )

-----------------------------------Репеллент Души--(Капита стражи Маллак)
	DefineMission( 855, "\208\229\239\229\235\235\229\237\242 \196\243\248\232", 855 )
	
	MisBeginTalk( "<t>Я в гневе! Хоть я уже не волнуюсь за свою жену, но я волнуюсь за жителей своего города. Эти мумии ещё ходят по земле!<n><t>Убейте <r15 стальных мумии> и освободите землю от нежити!" )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 852)
	MisBeginCondition(NoMission, 855)
	MisBeginCondition(NoRecord, 855)
	MisBeginAction(AddMission, 855)
	MisBeginAction(AddTrigger, 8551, TE_KILL, 42, 15 )--Стальная мумия
	MisCancelAction(ClearMission, 855)

	MisNeed(MIS_NEED_DESP, " Убить <r15 Стальных Мумии> и вернуться к <bКапитану стражи Маллаку> в точку(706,1465)." )
	MisNeed(MIS_NEED_KILL, 42, 15, 10, 15)

	MisHelpTalk( " Вы разве забыли о чём я Вас попросил?" )
	MisResultTalk( " Спасибо Вам ещё раз! Вы сделали очень добрый поступок." )
	MisResultCondition(NoRecord, 855)
	MisResultCondition(HasMission, 855)
	MisResultCondition(HasFlag, 855, 24)
	MisResultAction(ClearMission, 855)
	MisResultAction(SetRecord, 855)
	MisResultAction(AddExp,35066,35066)	
	MisResultAction(AddMoney,1189,1189)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 42 )	
	TriggerAction( 1, AddNextFlag, 855, 10, 15 )
	RegCurTrigger( 8551 )

-----------------------------------Нашествие племени---Полковник Макси
	DefineMission( 856, "\205\224\248\229\241\242\226\232\229 \239\235\229\236\229\237\232", 856 )
	
	MisBeginTalk( "<t>Непобедимый Вервольф-воин больше не угрожает нашему городу. Тем не менее над нашим городом повисла новая опасность! Гром-Град атакуют племена туземцев и если не предпринять ни каких действий они разгромят наш Город!<n><t>Необходимо преподать им урок и уничтожить их предводителей." )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 849)
	MisBeginCondition(NoMission, 856)
	MisBeginCondition(NoRecord, 856)
	MisBeginAction(AddMission, 856)
	MisBeginAction(AddTrigger, 8561, TE_KILL, 515, 15 )--Неуловимый туземец
	MisBeginAction(AddTrigger, 8562, TE_KILL, 38, 5 )----Туземный шаман
	MisCancelAction(ClearMission, 856)

	MisNeed(MIS_NEED_DESP, " Убить <r15 неуловимых туземцев> и <r5 Туземных Шаманов>.<n><t>Доложить о выполнении поручения <bПолковнику Макси> в точке (653,1505)." )
	MisNeed(MIS_NEED_KILL, 515, 15, 10, 15)
	MisNeed(MIS_NEED_KILL, 38, 5, 30, 5)

	MisHelpTalk( " Необходимо защитить наш Город!" )
	MisResultTalk( " Ха-ха! Теперь они ещё не скоро оправяться после Вашей атаки!" )
	MisResultCondition(NoRecord, 856)
	MisResultCondition(HasMission, 856)
	MisResultCondition(HasFlag, 856, 24)
	MisResultCondition(HasFlag, 856, 34)
	MisResultAction(ClearMission, 856)
	MisResultAction(SetRecord, 856)
	MisResultAction(AddExp,38628,38628)
	MisResultAction(AddMoney,1212,1212)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 515 )	
	TriggerAction( 1, AddNextFlag, 856, 10, 15 )
	RegCurTrigger( 8561 )
	InitTrigger()
	TriggerCondition( 1, IsMonster, 38 )	
	TriggerAction( 1, AddNextFlag, 856, 30, 5 )
	RegCurTrigger( 8562 )

-----------------------------------Трофеи победителю-----(Страж Ниссон)
	DefineMission( 857, "\210\240\238\244\229\232 \239\238\225\229\228\232\242\229\235\254", 857 )
	
	MisBeginTalk( "<t>Вы великий воин? Возможно это так, но настоящий воин сможет заполучить трофеи!" )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 856)
	MisBeginCondition(NoMission, 857)
	MisBeginCondition(NoRecord, 857)
	MisBeginAction(AddMission, 857)
	MisBeginAction(AddTrigger, 8571, TE_GETITEM, 4919, 5 )--Туземная маска
	MisBeginAction(AddTrigger, 8572, TE_GETITEM, 4835, 5 )--Таинственная кость
	MisCancelAction(ClearMission, 857)
	
	MisNeed(MIS_NEED_DESP, "<t> Принести <bСтражу Ниссон> в точку (711,1414) <y5 Туземных Масок> и <y5 Таинственных костей>." )
	MisNeed(MIS_NEED_ITEM, 4919, 5, 10, 5)
	MisNeed(MIS_NEED_ITEM, 4835, 5, 20, 5)
	
	MisHelpTalk( " Без трофеев Вы не воин а зазнийка!" )
	MisResultTalk( " Я беру свои слова обратно! Вы Герой и настоящий воин!" )
	MisResultCondition(NoRecord, 857)
	MisResultCondition(HasMission, 857)
	MisResultCondition(HasItem, 4919, 5)
	MisResultCondition(HasItem, 4835, 5)
	MisResultAction(TakeItem, 4835, 5)
	MisResultAction(TakeItem, 4919, 5)
	MisResultAction(ClearMission, 857)
	MisResultAction(SetRecord, 857)
	MisResultAction(AddExp,42522,42522)	
	MisResultAction(AddMoney,1235,1235)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4919 )	
	TriggerAction( 1, AddNextFlag, 857, 10, 5 )
	RegCurTrigger( 8571 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4835 )	
	TriggerAction( 1, AddNextFlag, 857, 20, 5 )
	RegCurTrigger( 8572 )

-----------------------------------Новое оружие
	DefineMission( 858, "\205\238\226\238\229 \238\240\243\230\232\229", 858 )
	
	MisBeginTalk( "<t>Нам необходимо придумать более эффективное оружие против монстров. Для изготовления нового оружия нам необходимы следующие материалы: одина <yСломанная ангельская палочка> и один <yЗазубренный священный лук>. Принесите мне это." )
	--MisBeginCondition(LvCheck, ">", 47 )
	MisBeginCondition(HasRecord, 856)
	MisBeginCondition(NoMission, 858)
	MisBeginCondition(NoRecord, 858)
	MisBeginAction(AddMission, 858)
	MisBeginAction(AddTrigger, 8581, TE_GETITEM, 4918, 1 )--Сломанная ангельская палочка
	MisBeginAction(AddTrigger, 8582, TE_GETITEM, 4921, 1 )--Зазубренный священный лук
	MisCancelAction(ClearMission, 858)
	
	MisNeed(MIS_NEED_DESP, " Принести <bПолковнику Макси> одну <yсломанную ангельскую палочку> и один <yЗазубренный священный лук>." )
	MisNeed(MIS_NEED_ITEM, 4918, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 4921, 1, 20, 1)
	
	MisHelpTalk( " Без этих материалов нам не сделать нового оружия." )
	MisResultTalk( " С таким оружием у нас больше шансов на победу." )
	MisResultCondition(NoRecord, 858)
	MisResultCondition(HasMission, 858)
	MisResultCondition(HasItem, 4918, 1)
	MisResultCondition(HasItem, 4921, 1)
	MisResultAction(TakeItem, 4921, 1)
	MisResultAction(TakeItem, 4918, 1)
	MisResultAction(ClearMission, 858)
	MisResultAction(SetRecord, 858)
	MisResultAction(AddExp,42522,42522)	
	MisResultAction(AddMoney,1235,1235)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4918 )	
	TriggerAction( 1, AddNextFlag, 858, 10, 1 )
	RegCurTrigger( 8581 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4921 )	
	TriggerAction( 1, AddNextFlag, 858, 20, 1 )
	RegCurTrigger( 8582 )

-----------------------------------Отверженный Ангел-----(Страж Ниссон)
	DefineMission( 859, "\206\242\226\229\240\230\229\237\237\251\233 \192\237\227\229\235", 859 )
	
	--MisBeginTalk( "<t>Вы видели ангелов-хранителей за пределами нашего города?<n><t>Вы думаете они заслуживают носить такое святое имя как \"Ангел\"? Отправьте этих ангелов на небо на перевоспитание." )
	MisBeginTalk( "<t>\194\251 \226\232\228\229\235\232 \224\237\227\229\235\238\226-\245\240\224\237\232\242\229\235\229\233 \231\224 \239\240\229\228\229\235\224\236\232 \237\224\248\229\227\238 \227\238\240\238\228\224?<n><t>\194\251 \228\243\236\224\229\242\229 \238\237\232 \231\224\241\235\243\230\232\226\224\254\242 \237\238\241\232\242\252 \242\224\234\238\229 \241\226\255\242\238\229 \232\236\255 \234\224\234 \"\192\237\227\229\235\"? \206\242\239\240\224\226\252\242\229 \253\242\232\245 \224\237\227\229\235\238\226 \237\224 \237\229\225\238 \237\224 \239\229\240\229\226\238\241\239\232\242\224\237\232\229." )
	MisBeginCondition(LvCheck, ">", 50 )
	--MisBeginCondition(HasRecord, 849)
	MisBeginCondition(NoMission, 859)
	MisBeginCondition(NoRecord, 859)
	MisBeginAction(AddMission, 859)
	MisBeginAction(AddTrigger, 8591, TE_KILL, 284, 12 )--Ангел-хранитель
	MisCancelAction(ClearMission, 859)

	MisNeed(MIS_NEED_DESP, " Убить <r12 Ангел-хранителей> и доложить о завершении поручения <bСтражу Нуссону> в точке(711,1414)." )
	MisNeed(MIS_NEED_KILL, 284, 12, 10, 12)

	MisHelpTalk( " Вы ещё не ходили к Ангелам-Хранителям? Так чего Вы ждёте?" )
	MisResultTalk( " Спасибо Вам, надеюсь они там научаться хорошим манерам." )
	MisResultCondition(NoRecord, 859)
	MisResultCondition(HasMission, 859)
	MisResultCondition(HasFlag, 859, 21)
	MisResultAction(ClearMission, 859)
	MisResultAction(SetRecord, 859)
	MisResultAction(AddExp,42522,42522)
	MisResultAction(AddMoney,1235,1235)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 284 )	
	TriggerAction( 1, AddNextFlag, 859, 10, 12 )
	RegCurTrigger( 8591 )

-----------------------------------Экспедиция---(Полковник Макси)
	DefineMission( 860, "\221\234\241\239\229\228\232\246\232\255", 860 )
	
	MisBeginTalk( "<t>Враг за городскими стенами был повержен! Однако идёт новая армия монстров со стороны снежной горы.<n><t>Наша цель: Отправиться к снежной горе и убить наступающего противника." )
	MisBeginCondition(LvCheck, ">", 51 )
	MisBeginCondition(HasRecord, 858)
	MisBeginCondition(NoMission, 860)
	MisBeginCondition(NoRecord, 860)
	MisBeginAction(AddMission, 860)
	MisBeginAction(AddTrigger, 8601, TE_KILL, 521, 8 )--Адский неупокоенный воин
	MisBeginAction(AddTrigger, 8602, TE_KILL, 541, 8 )--Смертоносный скелет-лучник
	MisCancelAction(ClearMission, 860)

	MisNeed(MIS_NEED_DESP, " Убить <r8 Смертоносных скелетов-лучников> и <r8 Адских неупокоенных воинов> и вернуться к <bМакси> в точку (653, 1505)." )
	MisNeed(MIS_NEED_KILL, 521, 8, 10, 8)
	MisNeed(MIS_NEED_KILL, 541, 8, 30, 8)

	MisHelpTalk( " Поспешите, Времени нет на болтавню!" )
	MisResultTalk( " О! Вы так быстро выполнили моё поручение, что я и глазом не успел маргнуть!" )
	MisResultCondition(NoRecord, 860)
	MisResultCondition(HasMission, 860)
	MisResultCondition(HasFlag, 860, 17)
	MisResultCondition(HasFlag, 860, 37)
	MisResultAction(ClearMission, 860)
	MisResultAction(SetRecord, 860)
	MisResultAction(AddExp,46776,46776)
	MisResultAction(AddMoney,1258,1258)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 521 )	
	TriggerAction( 1, AddNextFlag, 860, 10, 8 )
	RegCurTrigger( 8601 )
	InitTrigger()
	TriggerCondition( 1, IsMonster, 541 )	
	TriggerAction( 1, AddNextFlag, 860, 30, 8 )
	RegCurTrigger( 8602 )

-----------------------------------Шлем падшего---Уэсли
	DefineMission( 861, "\216\235\229\236 \239\224\228\248\229\227\238", 861 )
	
	MisBeginTalk( "<t>Вы принимали участие в военных действиях?<n><t>А Вы случайно не захватили для моей коллекции Шлем Падшего?<n><t>Принесите пожалуйста 5 Шлемов, что бы я смог выбрать самый лучший." )
	MisBeginCondition(LvCheck, ">", 51 )
	MisBeginCondition(HasRecord, 850)
	MisBeginCondition(NoMission, 861)
	MisBeginCondition(NoRecord, 861)
	MisBeginAction(AddMission, 861)
	MisBeginAction(AddTrigger, 8611, TE_GETITEM, 4837, 5 )--Шлем падшего
	MisCancelAction(ClearMission, 861)
	
	MisNeed(MIS_NEED_DESP, " Принести <bУэсли> в точку(741,1563) <y5 Шлемов падшего>." )
	MisNeed(MIS_NEED_ITEM, 4837, 5, 10, 5)
	
	MisHelpTalk( " Вы разве не хотите заработать денего?" )
	MisResultTalk( " Спасибо Вам! Они прекрасны! Вот Ваша награда!" )
	MisResultCondition(NoRecord, 861)
	MisResultCondition(HasMission, 861)
	MisResultCondition(HasItem, 4837, 5)
	MisResultAction(TakeItem, 4837, 5)
	MisResultAction(ClearMission, 861)
	MisResultAction(SetRecord, 861)
	MisResultAction(AddExp,46776,46776)
	MisResultAction(AddMoney,1258,1258)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4837 )	
	TriggerAction( 1, AddNextFlag, 861, 10, 5 )
	RegCurTrigger( 8611 )


-----------------------------------Четвертый ингредиент---Морфеус Фрея
	DefineMission( 862, "\215\229\242\226\229\240\242\251\233 \232\237\227\240\229\228\232\229\237\242", 862 )
	
	MisBeginTalk( "<t>Четвёртым ингредиентом, который Вы мне принесёте, будет <yЦельное ребро>, его можно получить только убив <rСмертоносного скелета-лучника>, но предупреждаю Вас, ещё ни кому не удавалось их убить и вернуться живым!" )
	MisBeginCondition(LvCheck, ">", 52 )
	MisBeginCondition(HasRecord, 853)
	MisBeginCondition(NoMission, 862)
	MisBeginCondition(NoRecord, 862)
	MisBeginAction(AddMission, 862)
	MisBeginAction(AddTrigger, 8621, TE_GETITEM, 4858, 8 )--Цельное ребро
	MisCancelAction(ClearMission, 862)
	
	MisNeed(MIS_NEED_DESP, " Принести Морфеусу 8 Цельных рёбер..." )
	MisNeed(MIS_NEED_ITEM, 4858, 8, 10, 8)
	
	MisHelpTalk( " Вы ещё не принесли мне 8 Цельных рёбер!" )
	MisResultTalk( " Я правельно сделал, когда взял Вас в свои коллеги. Отлично!" )
	MisResultCondition(NoRecord, 862)
	MisResultCondition(HasMission, 862)
	MisResultCondition(HasItem, 4858, 8)
	MisResultAction(TakeItem, 4858, 8)
	MisResultAction(ClearMission, 862)
	MisResultAction(SetRecord, 862)
	MisResultAction(AddExp,51423,51423)
	MisResultAction(AddMoney,1282,1282)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4858 )	
	TriggerAction( 1, AddNextFlag, 862, 10, 8 )
	RegCurTrigger( 8621 )

-----------------------------------Испытание Священного Леса----(Девочка Синди)
	DefineMission( 863, "\200\241\239\251\242\224\237\232\229 \209\226\255\249\229\237\237\238\227\238 \203\229\241\224", 863 )
	
	MisBeginTalk( "<t>Очень тяжёлое испытание Вас ждёт. Достаточно ли Вы смелый, что бы взяться за это испытание? Я буду молиться за Вас!" )
	MisBeginCondition(LvCheck, ">", 52 )
	--MisBeginCondition(HasRecord, 863)
	MisBeginCondition(NoMission, 863)
	MisBeginCondition(NoRecord, 863)
	MisBeginAction(AddMission, 863)
	MisBeginAction(AddTrigger, 8631, TE_KILL, 261, 10 )--Лесной охотник
	MisCancelAction(ClearMission, 863)

	MisNeed(MIS_NEED_DESP, " Убить <r10 Лесных охотников> и вернуться к <bДевочке Синди> в точку(740,1451)." )
	MisNeed(MIS_NEED_KILL, 261, 10, 10, 10)

	MisHelpTalk( " Не теряйте по напрасну время, ведь оно безценно!" )
	MisResultTalk( " Превосходно! Вы прошли моё испытание!" )
	MisResultCondition(NoRecord, 863)
	MisResultCondition(HasMission, 863)
	MisResultCondition(HasFlag, 863, 19)
	MisResultAction(ClearMission, 863)
	MisResultAction(SetRecord, 863)
	MisResultAction(AddExp,51423,51423)
	MisResultAction(AddMoney,1282,1282)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 261 )	
	TriggerAction( 1, AddNextFlag, 863, 10, 10 )
	RegCurTrigger( 8631 )


-----------------------------------	Последний ингредиент
	DefineMission( 864, "\207\238\241\235\229\228\237\232\233 \232\237\227\240\229\228\232\229\237\242", 864 )
	
	MisBeginTalk( "<t>Не время отступать! Мы на гране открытия, я расскажу какой эксперимент я ставил...<n><t>Я изготовляю эликсир бессмертия... И даже дам его попробовать! Но если Вы откажетесь мне помочь с последним ингредиентом, мне придётся Вас убить!<n><t>Принесите мне <y10 Осколков кости скелета>, что бы закончить эликсир." )
	MisBeginCondition(LvCheck, ">", 53 )
	MisBeginCondition(HasRecord, 862)
	MisBeginCondition(NoMission, 864)
	MisBeginCondition(NoRecord, 864)
	MisBeginAction(AddMission, 864)
	MisBeginAction(AddTrigger, 8641, TE_GETITEM, 4886, 10 )--Осколок кости скелета
	MisCancelAction(ClearMission, 864)
	
	MisNeed(MIS_NEED_DESP, " Принести <y10 Осколков кости скелета> <Фрею> в точку(651,1585)." )
	MisNeed(MIS_NEED_ITEM, 4886, 10, 10, 10)
	
	MisHelpTalk( " Я же Вас просил, кажеться, принести мне 10 Осколков кости скелета! Где они?!" )
	MisResultTalk( " Спасибо Вам огромное, Вы можете испытать Элексир!" )
	MisResultCondition(NoRecord, 864)
	MisResultCondition(HasMission, 864)
	MisResultCondition(HasItem, 4886, 10)
	MisResultAction(TakeItem, 4886, 10)
	MisResultAction(ClearMission, 864)
	MisResultAction(SetRecord, 864)
	MisResultAction(AddExp,56496,56496)	
	MisResultAction(AddMoney,1306,1306)
	MisResultAction(GiveItem, 6921, 3, 4 )--Зелье Бога(15 сек невидимости)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4886 )	
	TriggerAction( 1, AddNextFlag, 864, 10, 10 )
	RegCurTrigger( 8641 )

-----------------------------------Проклятое тело--копитан стражи Маллок
	DefineMission( 865, "\207\240\238\234\235\255\242\238\229 \242\229\235\238", 865 )
	
	MisBeginTalk( "<t>Я проанализировал результаты и пришёл к мнению что во всём виновато Проклятое тело.<n><t>Положите конец этому аду на земле и убейте Проклятое тело!" )
	MisBeginCondition(LvCheck, ">", 53 )
	MisBeginCondition(HasRecord, 855)
	MisBeginCondition(NoMission, 865)
	MisBeginCondition(NoRecord, 865)
	MisBeginAction(AddMission, 865)
	MisBeginAction(AddTrigger, 8651, TE_KILL, 52, 10 )--Проклятое тело
	MisCancelAction(ClearMission, 865)

	MisNeed(MIS_NEED_DESP, " Убить <r10 Проклятых тел> и вернутьс к <bМаллаку> в точку(706,1465)." )
	MisNeed(MIS_NEED_KILL, 52, 10, 10, 10)

	MisHelpTalk(" Мумии это детище Проклятого тела. Положите конец прородителю и дети не смогут дальше развиваться без родителей!" )
	MisResultTalk(" Вы сделали правильно, что немедленно отправились и положили конец страданиям и смертям!" )
	MisResultCondition(NoRecord, 865)
	MisResultCondition(HasMission, 865)
	MisResultCondition(HasFlag, 865, 19)
	MisResultAction(ClearMission, 865)
	MisResultAction(SetRecord, 865)
	MisResultAction(AddExp,56496,56496)	
	MisResultAction(AddMoney,1306,1306)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 52 )	
	TriggerAction( 1, AddNextFlag, 865, 10, 10 )
	RegCurTrigger( 8651 )

----------------------------------Последний враг----Полковник Макси
	DefineMission( 866, "\207\238\241\235\229\228\237\232\233 \226\240\224\227", 866 )
	
	MisBeginTalk( "<t>Остался последний враг! Не щадите его! Уничтожьте его и вернитесь ко мне за наградой!" )
	MisBeginCondition(LvCheck, ">", 53 )
	MisBeginCondition(HasRecord, 860)
	MisBeginCondition(NoMission, 866)
	MisBeginCondition(NoRecord, 866)
	MisBeginAction(AddMission, 866)
	MisBeginAction(AddTrigger, 8661, TE_KILL, 565, 10 )-----Предводитель скелетов-воинов
	MisBeginAction(AddTrigger, 8662, TE_GETITEM, 4879, 1 )--Символ главы воинов
	MisCancelAction(ClearMission, 866)

	MisNeed(MIS_NEED_DESP, " Убить <r10 Предводителей скелетов-воинов> и заполучить 1 <yСимвол главы воинов>.<n><t>Доложить <bПолковнику Макси> в точке (653,1505) о завершении миссии по освобождению Города." )
	MisNeed(MIS_NEED_KILL, 565, 10, 10, 10)
	MisNeed(MIS_NEED_ITEM, 4879, 1, 20, 1)

	MisHelpTalk( " У нас остался только один враг, не думаю что с ним нам надо тянуть время и играть в кошки-мышки." )
	MisResultTalk( " Последний Враг уничтожен! Вы герой этой войны!" )
	MisResultCondition(NoRecord, 866)
	MisResultCondition(HasMission, 866)
	MisResultCondition(HasFlag, 866, 19)
	MisResultCondition(HasItem, 4879, 1)
	MisResultAction(TakeItem, 4879, 1)
	MisResultAction(ClearMission, 866)
	MisResultAction(SetRecord, 866)
	MisResultAction(AddExp,56496,56496)
	MisResultAction(AddMoney,1306,1306)
	

	InitTrigger()
	TriggerCondition( 1, IsMonster, 565 )	
	TriggerAction( 1, AddNextFlag, 866, 10, 10 )
	RegCurTrigger( 8661 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4879 )	
	TriggerAction( 1, AddNextFlag, 866, 20, 1 )
	RegCurTrigger( 8662 )

-----------------------------------Испытания кровавого Фонтома
	DefineMission( 867, "\200\241\239\251\242\224\237\232\255 \234\240\238\226\224\226\238\227\238 \212\238\237\242\238\236\224", 867 )
	
	MisBeginTalk( "<t>Только избавившись от чёрной ауры Вы обретёте настоящее счастье! Убейте <r15 Кровожадных охотников> и очистите свою душу от пороков и грехов!" )
	MisBeginCondition(LvCheck, ">", 54 )
	--MisBeginCondition(HasRecord, 860)
	MisBeginCondition(NoMission, 867)
	MisBeginCondition(NoRecord, 867)
	MisBeginAction(AddMission, 867)
	MisBeginAction(AddTrigger, 8671, TE_KILL, 666, 15 )--Кровожадный охотник
	MisCancelAction(ClearMission, 867)

	MisNeed(MIS_NEED_DESP, " Убить <r15 Кровожадных охотников> и вернуться к <bДевочке Синди> в точку(740,1451)." )
	MisNeed(MIS_NEED_KILL, 666, 15, 10, 15 )

	MisHelpTalk( " Вы ещё не сделали всего необходимого, чтобы очистить свю душу." )
	MisResultTalk( " Богиня Вас благославляет и дарит Вам Счастье! Вы счастливы?" )
	MisResultCondition(NoRecord, 867)
	MisResultCondition(HasMission, 867)
	MisResultCondition(HasFlag, 867, 24)
	MisResultAction(ClearMission, 867)
	MisResultAction(SetRecord, 867)
	MisResultAction(AddExp,62032,62032)
	MisResultAction(AddMoney,1331,1331)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 666 )	
	TriggerAction( 1, AddNextFlag, 867, 10, 15 )
	RegCurTrigger( 8671 )

-----------------------------------Темный лук--Уэсли
	DefineMission( 868, "\210\229\236\237\251\233 \235\243\234", 868 )
	
	MisBeginTalk( "<t>Эх... Мне бы в мою коллекцию ещё бы Тёмный лук...<n><t>Принесите мне 5 Луков, я Выберу самый лучший!")
	MisBeginCondition(LvCheck, ">", 54 )
	MisBeginCondition(HasRecord, 861)
	MisBeginCondition(NoMission, 868)
	MisBeginCondition(NoRecord, 868)
	MisBeginAction(AddMission, 868)
	MisBeginAction(AddTrigger, 8681, TE_GETITEM, 4922, 5 )--Темный лук
	MisCancelAction(ClearMission, 868)
	
	MisNeed(MIS_NEED_DESP, " Принести Уэсли 5 Тёмных Луков." )
	MisNeed(MIS_NEED_ITEM, 4922, 5, 10, 5)
	
	MisHelpTalk( " Без Тёмного Лука коллекция моя не полная... Думайте сами, как я Вас отблагодарю, если моя коллекция будет полная!" )
	MisResultTalk( " Спасибо Вам! Вот теперь моя коллекция полная!" )
	MisResultCondition(NoRecord, 868)
	MisResultCondition(HasMission, 868)
	MisResultCondition(HasItem, 4922, 5)
	MisResultAction(TakeItem, 4922, 5)
	MisResultAction(ClearMission, 868)
	MisResultAction(SetRecord, 868)
	MisResultAction(AddExp,6232,6232)	
	MisResultAction(AddMoney,1331,1331)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4922 )	
	TriggerAction( 1, AddNextFlag, 868, 10, 5 )
	RegCurTrigger( 8681 )


-----------------------------------Снежный человечище--Фардей
	DefineMission( 869, "\209\237\229\230\237\251\233 \247\229\235\238\226\229\247\232\249\229", 869 )
	
	MisBeginTalk( "<t>У меня есть для Вас работа!<n><t>В точке(2471,502) обитает <rСнежный человечище>. Убейте <r15 Снежных Человечищ> и вернитесь ко мне за наградой!" )
	MisBeginCondition(LvCheck, ">", 35 )
	--MisBeginCondition(HasRecord, 860)
	MisBeginCondition(NoMission, 869)
	MisBeginCondition(NoRecord, 869)
	MisBeginAction(AddMission, 869)
	MisBeginAction(AddTrigger, 8691, TE_KILL, 516, 15 )--Снежный человечище
	MisCancelAction(ClearMission, 869)

	MisNeed(MIS_NEED_DESP, " Убить <r15 Снежных Человечищ> и вернуться в точку(2680,657) за наградой." )
	MisNeed(MIS_NEED_KILL, 516, 15, 10, 15 )

	MisHelpTalk( " Пока я не увижу результатов вашей работы, я не буду Вам платить!" )
	MisResultTalk( " Вы отлично справились со своей работой!" )
	MisResultCondition(NoRecord, 869)
	MisResultCondition(HasMission, 869)
	MisResultCondition(HasFlag, 869, 24)
	MisResultAction(ClearMission, 869)
	MisResultAction(SetRecord, 869)
	MisResultAction(AddExp,9170,9170)	
	MisResultAction(AddMoney,939,939)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 516 )	
	TriggerAction( 1, AddNextFlag, 869, 10, 15 )
	RegCurTrigger( 8691 )

----------------------------------Вторжение оборотней---Нейла
	DefineMission( 870, "\194\242\238\240\230\229\237\232\229 \238\225\238\240\238\242\237\229\233", 870 )
	
	MisBeginTalk( "<t>Опять пришли эти проклятые Оборотни! Тут становиться с каждым днём всё опаснее и опаснее находиться! Убейте в точке(2580,553) Вервольф-воинов и положите конец убийствам." )
	MisBeginCondition(LvCheck, ">", 36 )
	--MisBeginCondition(HasRecord, 860)
	MisBeginCondition(NoMission, 870)
	MisBeginCondition(NoRecord, 870)
	MisBeginAction(AddMission, 870)
	MisBeginAction(AddTrigger, 8701, TE_KILL, 271, 15 )--Вервольф-воин
	MisCancelAction(ClearMission, 870)

	MisNeed(MIS_NEED_DESP, " Помочь <bНейле> убить <r15 Вервольф-воинов>." )
	MisNeed(MIS_NEED_KILL, 271, 15, 10, 15 )

	MisHelpTalk( " Возращайтесь когда выполните мою просьбу!" )
	MisResultTalk( " Спасибо Вам!" )
	MisResultCondition(NoRecord, 870)
	MisResultCondition(HasMission, 870)
	MisResultCondition(HasFlag, 870, 24)
	MisResultAction(ClearMission, 870)
	MisResultAction(SetRecord, 870)
	MisResultAction(AddExp,10238,10238)
	MisResultAction(AddMoney,955,955)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 271 )	
	TriggerAction( 1, AddNextFlag, 870, 10, 15 )
	RegCurTrigger( 8701 )

-----------------------------------Коллекционер барахла---Меккилон
	DefineMission( 871, "\202\238\235\235\229\234\246\232\238\237\229\240 \225\224\240\224\245\235\224", 871 )
	
	MisBeginTalk( "<t>Только не спрашивайте зачем мне это всё! Просто принесите: 5 Ржавых палашей, 5 Сломанных молотов и 5 Неотесанных дубин.<n><t>Вы это найдёте без проблем в точках(2580,553), (2811,565), (2471,502)." )
	MisBeginCondition(LvCheck, ">", 36 )
	--MisBeginCondition(HasRecord, 861)
	MisBeginCondition(NoMission, 871)
	MisBeginCondition(NoRecord, 871)
	MisBeginAction(AddMission, 871)
	MisBeginAction(AddTrigger, 8711, TE_GETITEM, 4836, 5 )--Ржавый палаш
	MisBeginAction(AddTrigger, 8712, TE_GETITEM, 4907, 5 )--Сломанный молот
	MisBeginAction(AddTrigger, 8713, TE_GETITEM, 4838, 5 )--Неотесанная дубина
	MisCancelAction(ClearMission, 871)
	
	MisNeed(MIS_NEED_DESP, " Принести <bМекиллону> в точку(2662,648): <r5 Ржавых палашей, 5 Сломанных молотов и 5 Неотёссаных дубин>." )
	MisNeed(MIS_NEED_ITEM, 4836, 5, 10, 5)
	MisNeed(MIS_NEED_ITEM, 4907, 5, 10, 5)
	MisNeed(MIS_NEED_ITEM, 4838, 5, 10, 5)
	
	MisHelpTalk( " Я Вам тоже дам подарок." )
	MisResultTalk( " Ха-ха! Я единственный коллекционер Мусара!" )
	MisResultCondition(NoRecord, 871)
	MisResultCondition(HasMission, 871)
	MisResultCondition(HasItem, 4836, 5)
	MisResultCondition(HasItem, 4907, 5)
	MisResultCondition(HasItem, 4838, 5)
	MisResultAction(TakeItem, 4836, 5)
	MisResultAction(TakeItem, 4907, 5)
	MisResultAction(TakeItem, 4838, 5)
	MisResultAction(ClearMission, 871)
	MisResultAction(SetRecord, 871)
	MisResultAction(AddExp,10238,10238)	
	MisResultAction(AddMoney,955,955)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4836 )	
	TriggerAction( 1, AddNextFlag, 871, 10, 5 )
	RegCurTrigger( 8711 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4907 )	
	TriggerAction( 1, AddNextFlag, 871, 20, 5 )
	RegCurTrigger( 8712 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4838 )	
	TriggerAction( 1, AddNextFlag, 871, 30, 5 )
	RegCurTrigger( 8713 )


-----------------------------------Новая битва
	DefineMission( 872, "\205\238\226\224\255 \225\232\242\226\224", 872 )
	
	MisBeginTalk( "<t>Война перешла на новый уровень! Сейчас на нас нападает <rСнежный человек>.<n><t>Идите в точку(2587,455) и положите конец этим нападениям." )
	MisBeginCondition(LvCheck, ">", 37 )
	MisBeginCondition(HasRecord, 869)
	MisBeginCondition(NoMission, 872)
	MisBeginCondition(NoRecord, 872)
	MisBeginAction(AddMission, 872)
	MisBeginAction(AddTrigger, 8721, TE_KILL, 194, 15 )--Снежный человек
	MisCancelAction(ClearMission, 872)

	MisNeed(MIS_NEED_DESP, " Фердей в точке(2680,657) попросил Вас убить 15 Снежных людей." )
	MisNeed(MIS_NEED_KILL, 194, 15, 10, 15 )

	MisHelpTalk( " На войне нет времени на обсуждения." )
	MisResultTalk( " Спасибо Вам за верность и за помощь!" )
	MisResultCondition(NoRecord, 872)
	MisResultCondition(HasMission, 872)
	MisResultCondition(HasFlag, 872, 24)
	MisResultAction(ClearMission, 872)
	MisResultAction(SetRecord, 872)
	MisResultAction(AddExp,11413,11413)	
	MisResultAction(AddMoney,972,972)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 194 )	
	TriggerAction( 1, AddNextFlag, 872, 10, 15 )
	RegCurTrigger( 8721 )

-----------------------------------Гигантский палаш---Меккилон
	DefineMission( 873, "\195\232\227\224\237\242\241\234\232\233 \239\224\235\224\248", 873 )
	
	MisBeginTalk( "<t>Вы меня не забыли? Теперь мне надо <y5 Гигантских палашей>. Вы сможете их получить из <rСнежного человека> в точке(2587,455)." )
	MisBeginCondition(LvCheck, ">", 38 )
	MisBeginCondition(HasRecord, 871)
	MisBeginCondition(NoMission, 873)
	MisBeginCondition(NoRecord, 873)
	MisBeginAction(AddMission, 873)
	MisBeginAction(AddTrigger, 8731, TE_GETITEM, 4861, 5 )--Гигантский палаш
	MisCancelAction(ClearMission, 873)
	
	MisNeed(MIS_NEED_DESP, " Принести Мекллиону в точку(2662,648) 5 Гиганских палашей." )
	MisNeed(MIS_NEED_ITEM, 4861, 5, 10, 5)
	
	MisHelpTalk( " Я буду Вас тут ждать." )
	MisResultTalk( " Спасибо Вам!" )
	MisResultCondition(NoRecord, 873)
	MisResultCondition(HasMission, 873)
	MisResultCondition(HasItem, 4861, 5)
	MisResultAction(TakeItem, 4861, 5)
	MisResultAction(ClearMission, 873)
	MisResultAction(SetRecord, 873)
	MisResultAction(AddExp,11413,11413)
	MisResultAction(AddMoney,972,972)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4861 )	
	TriggerAction( 1, AddNextFlag, 873, 10, 5 )
	RegCurTrigger(8731)

-----------------------------------Избавление от Йети
	DefineMission( 874, "\200\231\225\224\226\235\229\237\232\229 \238\242 \201\229\242\232", 874 )
	
	MisBeginTalk( "<t><rГигантский йети> намного опаснее <rСнежного человека>. Однако мне необходимо, что бы убили для меня 12 Гигантских йети. Вы найдёте их в точке(2811,565)." )
	MisBeginCondition(LvCheck, ">", 38 )
	MisBeginCondition(HasRecord, 872)
	MisBeginCondition(NoMission, 874)
	MisBeginCondition(NoRecord, 874)
	MisBeginAction(AddMission, 874)
	MisBeginAction(AddTrigger, 8741, TE_KILL, 517, 12 )--Гигантский йети
	MisCancelAction(ClearMission, 874)

	MisNeed(MIS_NEED_DESP, " Убить 12 Гиганских йети для Фердей(2680,657)." )
	MisNeed(MIS_NEED_KILL, 517, 12, 10, 12 )

	MisHelpTalk( " Вы справитесь! Я в Вас верю!" )
	MisResultTalk( " Отлично! Вот Ваша награда!" )
	MisResultCondition(NoRecord, 874)
	MisResultCondition(HasMission, 874)
	MisResultCondition(HasFlag, 874, 21)
	MisResultAction(ClearMission, 874)
	MisResultAction(SetRecord, 874)
	MisResultAction(AddExp,12706,12706)
	MisResultAction(AddMoney,990,990)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 517 )	
	TriggerAction( 1, AddNextFlag, 874, 10, 12 )
	RegCurTrigger( 8741 )

-----------------------------------Охота на улиток---Нейла
	DefineMission( 875, "\206\245\238\242\224 \237\224 \243\235\232\242\238\234", 875 )
	
	MisBeginTalk( "<t>Мы занимаемся охотой на улиток! Не думайте что это просто! Если не верите попробуйте сами. В точке(2733,651) самое лучшее место для охоты." )
	MisBeginCondition(LvCheck, ">", 38 )
	--MisBeginCondition(HasRecord, 872)
	MisBeginCondition(NoMission, 875)
	MisBeginCondition(NoRecord, 875)
	MisBeginAction(AddMission, 875)
	MisBeginAction(AddTrigger, 8751, TE_KILL, 501, 20 )------Улитка со стальным панцирем
	MisBeginAction(AddTrigger, 8752, TE_GETITEM, 4821, 6 )---Стальной усик
	MisCancelAction(ClearMission, 875)

	MisNeed(MIS_NEED_DESP, " Убить для <bНаны> <r20 Улиток со стальным панцирем> и принести <y6 стальных усиков>." )
	MisNeed(MIS_NEED_KILL, 501, 20, 10, 20 )
	MisNeed(MIS_NEED_ITEM, 4821, 6, 40, 6 )

	MisHelpTalk( " Ну в первый раз всегда сложно! Попробуйте ещё." )
	MisResultTalk( " Отлично! Вы прирождённый охотник." )
	MisResultCondition(NoRecord, 875)
	MisResultCondition(HasMission, 875)
	MisResultCondition(HasFlag, 875, 29)
	MisResultCondition(HasItem, 4821, 6)
	MisResultAction(TakeItem, 4821, 6)
	MisResultAction(ClearMission, 875)
	MisResultAction(SetRecord, 875)
	MisResultAction(AddExp,12706,12706)
	MisResultAction(AddMoney,990,990)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 501 )	
	TriggerAction( 1, AddNextFlag, 875, 10, 20 )
	RegCurTrigger( 8751 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4821 )	
	TriggerAction( 1, AddNextFlag, 875, 40, 6 )
	RegCurTrigger( 8752 )

-----------------------------------Новый захватчик
	DefineMission( 876, "\205\238\226\251\233 \231\224\245\226\224\242\247\232\234", 876 )
	
	MisBeginTalk( "<t>После того как мы избавились от Вертвольфа-Воина на наше поселение стали нападать <rНеупокоенные лучники>. Они гораздо опаснее прежних монстров! Отправляйтесь в точку(2746,451) и положите конец этим мучениям убив <r12 Неупокоенных лучников>!" )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(HasRecord, 870)
	MisBeginCondition(NoMission, 876)
	MisBeginCondition(NoRecord, 876)
	MisBeginAction(AddMission, 876)
	MisBeginAction(AddTrigger, 8761, TE_KILL, 270, 12 )--Неупокоенный лучник
	MisCancelAction(ClearMission, 876)

	MisNeed(MIS_NEED_DESP, " Убейте <r12 Неупокоенных лучников> и вернитесь к <bНейле> в точку (2675,631)." )
	MisNeed(MIS_NEED_KILL, 270, 12, 10, 12 )

	MisHelpTalk( " Вы ещё не избавели нашу деревню от новых захватчиков!" )
	MisResultTalk( " Вы уже второй раз спасаете нашу деревню! спасибо Вам за помощь!" )
	MisResultCondition(NoRecord, 876)
	MisResultCondition(HasMission, 876)
	MisResultCondition(HasFlag, 876, 21)
	MisResultAction(ClearMission, 876)
	MisResultAction(SetRecord, 876)
	MisResultAction(AddExp,14128,14128)	
	MisResultAction(AddMoney,1008,1008)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 270 )	
	TriggerAction( 1, AddNextFlag, 876, 10, 12 )
	RegCurTrigger( 8761 )

-----------------------------------Это пренадлежало скелету--Саша
	DefineMission( 877, "\221\242\238 \239\240\229\237\224\228\235\229\230\224\235\238 \241\234\229\235\229\242\243", 877 )
	
	MisBeginTalk( "<t>Мне очень нравиться <yСтрелы смерти> из <rНеупокоенных лучников> обитающих в точке(2746,451). Если бы Вы мне принесли их в количестве 10 штук, то я бы сделал бы из них очень красивое украшение..." )
	MisBeginCondition(LvCheck, ">", 39 )
	--MisBeginCondition(HasRecord, 871)
	MisBeginCondition(NoMission, 877)
	MisBeginCondition(NoRecord, 877)
	MisBeginAction(AddMission, 877)
	MisBeginAction(AddTrigger, 8771, TE_GETITEM, 4911, 10 )--Стрела смерти
	MisCancelAction(ClearMission, 877)
	
	MisNeed(MIS_NEED_DESP, " Принести <y10 Стрел смерти> <bСаше> в точку(2678,631)." )
	MisNeed(MIS_NEED_ITEM, 4911, 10, 10, 10)
	
	MisHelpTalk( " Вы еще не принесли мне 10 стрел смерти." )
	MisResultTalk( " Спаибо Вам, я не забуду вашу доброту!" )
	MisResultCondition(NoRecord, 877)
	MisResultCondition(HasMission, 877)
	MisResultCondition(HasItem, 4911, 10)
	MisResultAction(TakeItem, 4911, 10)
	MisResultAction(ClearMission, 877)
	MisResultAction(SetRecord, 877)
	MisResultAction(AddExp,14128,14128)	
	MisResultAction(AddMoney,1008,1008)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4911 )	
	TriggerAction( 1, AddNextFlag, 877, 10, 10 )
	RegCurTrigger(8771)

-----------------------------------Высокая ставка--Фардей
	DefineMission( 878, "\194\251\241\238\234\224\255 \241\242\224\226\234\224", 878 )
	
	MisBeginTalk( "<t>Настало время всерьез взяться за уничтожение нежити в этих лесах!<n><t>Это задание я поручаю Вам! Отправляйтесь в точку(2855,451) и избавьтесь от <rГигантских йети>." )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(HasRecord, 874)
	MisBeginCondition(NoMission, 878)
	MisBeginCondition(NoRecord, 878)
	MisBeginAction(AddMission, 878)
	MisBeginAction(AddTrigger, 8781, TE_KILL, 195, 12 )--Гигантский йети
	MisCancelAction(ClearMission, 878)

	MisNeed(MIS_NEED_DESP, " Убейте для Фардея <r12 Гигантских йети>." )
	MisNeed(MIS_NEED_KILL, 195, 12, 10, 12 )

	MisHelpTalk( " Если Вы устали - отдохните, но не забудьте о моей просьбе." )
	MisResultTalk( " Вот Ваша награда." )
	MisResultCondition(NoRecord, 878)
	MisResultCondition(HasMission, 878)
	MisResultCondition(HasFlag, 878, 21)
	MisResultAction(ClearMission, 878)
	MisResultAction(SetRecord, 878)
	MisResultAction(AddExp,14128,14128)
	MisResultAction(AddMoney,1008,1008)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 195 )	
	TriggerAction( 1, AddNextFlag, 878, 10, 12 )
	RegCurTrigger( 8781 )

-----------------------------------Гигантская орясина--Меккилон
	DefineMission( 879, "\195\232\227\224\237\242\241\234\224\255 \238\240\255\241\232\237\224", 879 )
	
	MisBeginTalk( "<t>До меня дошли слухи, что Вы избавляете лес от ужасных Существ.<n><t>Захватите мне тогда за вознаграждение <y10 Гиганских орясин>. Вы их получите убив в точке(2855,451) Гигантского йети." )
	MisBeginCondition(LvCheck, ">", 39 )
	MisBeginCondition(HasRecord, 873)
	MisBeginCondition(NoMission, 879)
	MisBeginCondition(NoRecord, 879)
	MisBeginAction(AddMission, 879)
	MisBeginAction(AddTrigger, 8791, TE_GETITEM, 4862, 10 )--Гигантская орясина
	MisCancelAction(ClearMission, 879)
	
	MisNeed(MIS_NEED_DESP, " Принести <bМеккилону> <y10 Гиганских орясин>." )
	MisNeed(MIS_NEED_ITEM, 4862, 10, 10, 10)
	
	MisHelpTalk( " Как? Вы не принесли мне ещё 10 Гиганских орясин? Ну Вы же принесёте? Я на Вас так надеюсь..." )
	MisResultTalk( " Я найду им хорошее приминение!" )
	MisResultCondition(NoRecord, 879)
	MisResultCondition(HasMission, 879)
	MisResultCondition(HasItem, 4862, 10)
	MisResultAction(TakeItem, 4862, 10)
	MisResultAction(ClearMission, 879)
	MisResultAction(SetRecord, 879)
	MisResultAction(AddExp,14128,14128)
	MisResultAction(AddMoney,1008,1008)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4862 )	
	TriggerAction( 1, AddNextFlag, 879, 10, 10 )
	RegCurTrigger(8791)

-----------------------------------В тыл к противнику--Нейла
	DefineMission( 880, "\194 \242\251\235 \234 \239\240\238\242\232\226\237\232\234\243", 880 )
	
	MisBeginTalk( "<t>Все жители нашей деревни поспорили, сможете ли Вы убить 12 Метких скелетов-стрелков или нет! Если что, я за то что Вы сможете!" )
	MisBeginCondition(LvCheck, ">", 41 )
	MisBeginCondition(HasRecord, 876)
	MisBeginCondition(NoMission, 880)
	MisBeginCondition(NoRecord, 880)
	MisBeginAction(AddMission, 880)
	MisBeginAction(AddTrigger, 8801, TE_KILL, 502, 12 )--Меткий скелет-лучник
	MisCancelAction(ClearMission, 880)

	MisNeed(MIS_NEED_DESP, " Убить для <bНейлы> <r12 Мметких скелетов-лучников>." )
	MisNeed(MIS_NEED_KILL, 502, 12, 10, 12 )

	MisHelpTalk( " Как? Вы разве ещё не покончили с Меткими скелетами-лучниками?" )
	MisResultTalk( " Спасибо Вам! По заслугам им..." )
	MisResultCondition(NoRecord, 880)
	MisResultCondition(HasMission, 880)
	MisResultCondition(HasFlag, 880, 21)
	MisResultAction(ClearMission, 880)
	MisResultAction(SetRecord, 880)
	MisResultAction(AddExp,17409,17409)
	MisResultAction(AddMoney,1045,1045)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 502 )	
	TriggerAction( 1, AddNextFlag, 880, 10, 12 )
	RegCurTrigger( 8801 )

-----------------------------------Слава прошлого---Кевин Уолф
	DefineMission( 881, "\209\235\224\226\224 \239\240\238\248\235\238\227\238", 881 )
	
	MisBeginTalk( "<t>Вы не встречались ещё с <rМетким скелетом-лучником>?<n><t>Когда я был молод, как Вы, они не знали от меня пощады, но годы берут своё...<n><t>Но я часто вспоминаю те дни... Не принесли бы Вы мне их трофей <yСломанное ребро> на память? Я был бы Вам признателен?" )
	MisBeginCondition(LvCheck, ">", 41 )
	--MisBeginCondition(HasRecord, 873)
	MisBeginCondition(NoMission, 881)
	MisBeginCondition(NoRecord, 881)
	MisBeginAction(AddMission, 881)
	MisBeginAction(AddTrigger, 8811, TE_GETITEM, 4822, 8 )--Сломанное ребро
	MisCancelAction(ClearMission, 881)
	
	MisNeed(MIS_NEED_DESP, " Принести <bКевину Уолфу> в точку(2688,628) <y8 Сломаных рёбер>." )
	MisNeed(MIS_NEED_ITEM, 4822, 8, 10, 8)
	
	MisHelpTalk( " Вы ещё не ходили выполнять мою просьбу?" )
	MisResultTalk( " Да, да, это те самый Сломанные рёбра! Эх, сколько же времени с тех пор прошло..." )
	MisResultCondition(NoRecord, 881)
	MisResultCondition(HasMission, 881)
	MisResultCondition(HasItem, 4822, 8)
	MisResultAction(TakeItem, 4822, 8)
	MisResultAction(ClearMission, 881)
	MisResultAction(SetRecord, 881)
	MisResultAction(AddExp,17409,17409)
	MisResultAction(AddMoney,1045,1045)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4822 )	
	TriggerAction( 1, AddNextFlag, 881, 10, 8 )
	RegCurTrigger(8811)

----------------------------------Охота на Ледяного дракончика--Нейла
	DefineMission( 882, "\206\245\238\242\224 \237\224 \203\229\228\255\237\238\227\238 \228\240\224\234\238\237\247\232\234\224", 882 )
	
	MisBeginTalk( "<t>А теперь мы пойдём на охоту...<n><t>Охотиться мы будем на <rЛедяных дракончиков>.<n><t>Убейте для меня <r10 Ледяных дракончиков>, за небольшое вознаграждение." )
	MisBeginCondition(LvCheck, ">", 41 )
	MisBeginCondition(HasRecord, 875)
	MisBeginCondition(NoMission, 882)
	MisBeginCondition(NoRecord, 882)
	MisBeginAction(AddMission, 882)
	MisBeginAction(AddTrigger, 8821, TE_KILL, 530, 10 )------Ледяной дракончик
	MisBeginAction(AddTrigger, 8822, TE_GETITEM, 4850, 1 )---Кусочек сердца из лед. кристалла
	MisCancelAction(ClearMission, 882)

	MisNeed(MIS_NEED_DESP, " Убить для Нейлы <r10 Ледяных дракончиков> и принести <yКусочек сердца из лед. кристалла>." )
	MisNeed(MIS_NEED_KILL, 530, 10, 10, 10 )
	MisNeed(MIS_NEED_ITEM, 4850, 1, 20, 1 )

	MisHelpTalk( " Вы щё не ходили на охоту?" )
	MisResultTalk( " Смотрю я на Вас и вижу настоящего егеря!" )
	MisResultCondition(NoRecord, 882)
	MisResultCondition(HasMission, 882)
	MisResultCondition(HasFlag, 882, 19)
	MisResultCondition(HasItem, 4850, 1)
	MisResultAction(TakeItem, 4850, 1)
	MisResultAction(ClearMission, 882)
	MisResultAction(SetRecord, 882)
	MisResultAction(AddExp,17409,17409)
	MisResultAction(AddMoney,1045,1045)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 530 )	
	TriggerAction( 1, AddNextFlag, 882, 10, 10 )
	RegCurTrigger( 8821 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4850 )	
	TriggerAction( 1, AddNextFlag, 882, 20, 1 )
	RegCurTrigger( 8822 )

-----------------------------------Кристаллическая головоломка--Саша
	DefineMission( 883, "\202\240\232\241\242\224\235\235\232\247\229\241\234\224\255 \227\238\235\238\226\238\235\238\236\234\224", 883 )
	
	MisBeginTalk( "<t>До меня дошли слухи, что Вы охотитесь на <rЛедяного дракончика>. Захватите мне пожалуйста с него <y5 Кусочков сердца из лед. кристалла>." )
	MisBeginCondition(LvCheck, ">", 41 )
	MisBeginCondition(HasRecord, 882)
	MisBeginCondition(NoMission, 883)
	MisBeginCondition(NoRecord, 883)
	MisBeginAction(AddMission, 883)
	MisBeginAction(AddTrigger, 8831, TE_GETITEM, 4850, 5 )--Кусочек сердца из лед. кристалла
	MisCancelAction(ClearMission, 883)
	
	MisNeed(MIS_NEED_DESP, " Принести <bСаше> в точку(2678,631) <y5 Кусочеков сердца из лед. кристалла>." )
	MisNeed(MIS_NEED_ITEM, 4850, 5, 10, 5)
	
	MisHelpTalk( " Вы уже вернулись? А кристаллы? Ну не чего страшного, я подожду!" )
	MisResultTalk( "О! Спасибо Вам. Спасибо!" )
	MisResultCondition(NoRecord, 883)
	MisResultCondition(HasMission, 883)
	MisResultCondition(HasItem, 4850, 5)
	MisResultAction(TakeItem, 4850, 5)
	MisResultAction(ClearMission, 883)
	MisResultAction(SetRecord, 883)
	MisResultAction(AddExp,17409,17409)	
	MisResultAction(AddMoney,1045,1045)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4850 )	
	TriggerAction( 1, AddNextFlag, 883, 10, 5 )
	RegCurTrigger(8831)


-----------------------------------Кристальное сердце
	DefineMission( 884, "\202\240\232\241\242\224\235\252\237\238\229 \241\229\240\228\246\229", 884 )
	
	MisBeginTalk( "<t>Есть легенда, что <yКристалл чистоты> можно преобразовать в <yкристальное сердце> и жить вечно! Давайте проверим это?! Принесите мне <y5 Кристаллов чистоты>." )
	MisBeginCondition(LvCheck, ">", 43 )
	MisBeginCondition(HasRecord, 883)
	MisBeginCondition(NoMission, 884)
	MisBeginCondition(NoRecord, 884)
	MisBeginAction(AddMission, 884)
	MisBeginAction(AddTrigger, 8841, TE_GETITEM, 4895, 5 )--Кристалл чистоты
	MisCancelAction(ClearMission, 884)
	
	MisNeed(MIS_NEED_DESP, " Принести <bСаше> <y5 Кристаллов чистоты>." )
	MisNeed(MIS_NEED_ITEM, 4895, 5, 10, 5)
	
	MisHelpTalk( " Разве Вам не интересно проверить легенду." )
	MisResultTalk( "Спасибо! К сожалению, это всего лишь красивая легенда." )
	MisResultCondition(NoRecord, 884)
	MisResultCondition(HasMission, 884)
	MisResultCondition(HasItem, 4895, 5)
	MisResultAction(TakeItem, 4895, 5)
	MisResultAction(ClearMission, 884)
	MisResultAction(SetRecord, 884)
	MisResultAction(AddExp,21361,21361)	
	MisResultAction(AddMoney,1084,1084)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4895 )	
	TriggerAction( 1, AddNextFlag, 884, 10, 5 )
	RegCurTrigger(8841)

-----------------------------------Охота на белого медведя--нейла
	DefineMission( 885, "\206\245\238\242\224 \237\224 \225\229\235\238\227\238 \236\229\228\226\229\228\255", 885 )
	
	MisBeginTalk( "<t>Я предлагаю пойти на охоту! А охотиться я предлагаю на Огромных полярных медведей!" )
	MisBeginCondition(LvCheck, ">", 43 )
	MisBeginCondition(HasRecord, 882)
	MisBeginCondition(NoMission, 885)
	MisBeginCondition(NoRecord, 885)
	MisBeginAction(AddMission, 885)
	MisBeginAction(AddTrigger, 8851, TE_KILL, 504, 8 )------Огромный полярный медведь
	MisBeginAction(AddTrigger, 8852, TE_GETITEM, 4824, 3 )--Острейший клык медведя
	MisCancelAction(ClearMission, 885)

	MisNeed(MIS_NEED_DESP, " Убейте для <bНейлы> <y8 Огромных полярных медведей> и принесите <y3 острейших клыка медведя>." )
	MisNeed(MIS_NEED_KILL, 504, 8, 10, 8 )
	MisNeed(MIS_NEED_ITEM, 4824, 3, 20, 3 )

	MisHelpTalk( " Вы не любите охоту?" )
	MisResultTalk( " Вам понравилась охота?" )
	MisResultCondition(NoRecord, 885)
	MisResultCondition(HasMission, 885)
	MisResultCondition(HasFlag, 885, 17)
	MisResultCondition(HasItem, 4824, 3)
	MisResultAction(TakeItem, 4824, 3)
	MisResultAction(ClearMission, 885)
	MisResultAction(SetRecord, 885)
	MisResultAction(AddExp,21361,21361)	
	MisResultAction(AddMoney,1084,1084)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 504 )	
	TriggerAction( 1, AddNextFlag, 885, 10, 8 )
	RegCurTrigger( 8851 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4824 )	
	TriggerAction( 1, AddNextFlag, 885, 20, 3 )
	RegCurTrigger( 8852 )

-----------------------------------Снежный человек--Фардей
	DefineMission( 886, "\209\237\229\230\237\251\233 \247\229\235\238\226\229\234", 886 )
	
	MisBeginTalk( "<t>Давайте положим на конец монстрам обитающих в лесах Ледыни! Убейте <r16 Снежных Человек>!" )
	MisBeginCondition(LvCheck, ">", 44 )
	MisBeginCondition(HasRecord, 872)
	MisBeginCondition(NoMission, 886)
	MisBeginCondition(NoRecord, 886)
	MisBeginAction(AddMission, 886)
	MisBeginAction(AddTrigger, 8861, TE_KILL, 194, 16 )--Снежный человек
	MisCancelAction(ClearMission, 886)

	MisNeed(MIS_NEED_DESP, " Убить для <bФардея> <r16 Снежных человек>." )
	MisNeed(MIS_NEED_KILL, 194, 16, 10, 16 )

	MisHelpTalk( " Не возвращайтесь ко мне пока не сделаете то, о чём я Вас попросил!" )
	MisResultTalk( " Вы лучший убийца монстров которых я когда ли бо встречал!" )
	MisResultCondition(NoRecord, 886)
	MisResultCondition(HasMission, 886)
	MisResultCondition(HasFlag, 886, 25)
	MisResultAction(ClearMission, 886)
	MisResultAction(SetRecord, 886)
	MisResultAction(AddExp,23628,23628)	
	MisResultAction(AddMoney,1104,1104)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 194 )	
	TriggerAction( 1, AddNextFlag, 886, 10, 16 )
	RegCurTrigger( 8861 )

-----------------------------------Ужасающий меч гиганта--Меккилон
	DefineMission( 887, "\211\230\224\241\224\254\249\232\233 \236\229\247 \227\232\227\224\237\242\224", 887 )
	
	MisBeginTalk( "<t>Хех, рад видеть Вас живым и невредимым!<n><t>Так, как вы уже знакомы с <rСнежным ужасом>, не могли бы Вы мне принести <y5 Ужасающих мечей гиганта>?" )
	MisBeginCondition(LvCheck, ">", 43 )
	MisBeginCondition(HasRecord, 883)
	MisBeginCondition(NoMission, 887)
	MisBeginCondition(NoRecord, 887)
	MisBeginAction(AddMission, 887)
	MisBeginAction(AddTrigger, 8871, TE_GETITEM, 4910, 5 )--Ужасающий меч гиганта
	MisCancelAction(ClearMission, 887)
	
	MisNeed(MIS_NEED_DESP, " Принести <bМеккилону> в точку(2662,648) <yУжасающий меч гиганта>." )
	MisNeed(MIS_NEED_ITEM, 4910, 5, 10, 5)
	
	MisHelpTalk( " Вы испугались опять столкнуться с Снежным ужасом?" )
	MisResultTalk( " Ва! Вы настоящий мастер своего дела!" )
	MisResultCondition(NoRecord, 887)
	MisResultCondition(HasMission, 887)
	MisResultCondition(HasItem, 4910, 5)
	MisResultAction(TakeItem, 4910, 5)
	MisResultAction(ClearMission, 887)
	MisResultAction(SetRecord, 887)
	MisResultAction(AddExp,23628,23628)	
	MisResultAction(AddMoney,1104,1104)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4910 )	
	TriggerAction( 1, AddNextFlag, 887, 10, 5 )
	RegCurTrigger(8871)

-----------------------------------Оборотень Лучник
	DefineMission( 888, "\206\225\238\240\238\242\229\237\252 \203\243\247\237\232\234", 888 )
	
	MisBeginTalk( "<t>Как Вы уже поняли, мы идём на охоту! Нашей жертвой будет <rВервольф лучник>! Главное, нам самим не стать его жертвой!" )
	MisBeginCondition(LvCheck, ">", 45 )
	MisBeginCondition(HasRecord, 880)
	MisBeginCondition(NoMission, 888)
	MisBeginCondition(NoRecord, 888)
	MisBeginAction(AddMission, 888)
	MisBeginAction(AddTrigger, 8881, TE_KILL, 272, 20 )-------Вервольф лучник
	MisBeginAction(AddTrigger, 8882, TE_GETITEM, 4916, 5 )----Сломанный лук Вервольфа
	MisCancelAction(ClearMission, 888)

	MisNeed(MIS_NEED_DESP, " Убить <r20 Вервольф лучников> и принести <y5 Сломанных луков Вервольфа> <bНейле>." )
	MisNeed(MIS_NEED_KILL, 272, 20, 10, 20 )
	MisNeed(MIS_NEED_ITEM, 4916, 5, 40, 5 )

	MisHelpTalk( " Вы устали от охоты? Отдохните!" )
	MisResultTalk( " Потрясающе!" )
	MisResultCondition(NoRecord, 888)
	MisResultCondition(HasMission, 888)
	MisResultCondition(HasFlag, 888, 29)
	MisResultCondition(HasItem, 4916, 5)
	MisResultAction(TakeItem, 4916, 5)
	MisResultAction(ClearMission, 888)
	MisResultAction(SetRecord, 888)
	MisResultAction(AddExp,26112,26112)
	MisResultAction(AddMoney,1125,1125)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 272 )	
	TriggerAction( 1, AddNextFlag, 888, 10, 20 )
	RegCurTrigger( 8881 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4916 )	
	TriggerAction( 1, AddNextFlag, 888, 40, 5 )
	RegCurTrigger( 8882 )

-----------------------------------Последний Йети--Фардей
	DefineMission( 889, "\207\238\241\235\229\228\237\232\232 \200\229\242\232", 889 )
	
	MisBeginTalk( "<t>Это самый страшный Лесной монстр которого я видел в своей жизни, будьте с ним очень осторожны!" )
	MisBeginCondition(LvCheck, ">", 45 )
	MisBeginCondition(HasRecord, 878)
	MisBeginCondition(NoMission, 889)
	MisBeginCondition(NoRecord, 889)
	MisBeginAction(AddMission, 889)
	MisBeginAction(AddTrigger, 8891, TE_KILL, 545, 15 )--Кровожадный йети
	MisCancelAction(ClearMission, 889)

	MisNeed(MIS_NEED_DESP, " Убейте для <bФардей> <r15 Кровожадных йети>." )
	MisNeed(MIS_NEED_KILL, 545, 15, 10, 15 )

	MisHelpTalk( " Время - деньги, мой друг!" )
	MisResultTalk( "Отлично! Вот Ваша награда." )
	MisResultCondition(NoRecord, 889)
	MisResultCondition(HasMission, 889)
	MisResultCondition(HasFlag, 889, 24)
	MisResultAction(ClearMission, 889)
	MisResultAction(SetRecord, 889)
	MisResultAction(AddExp,26112,26112)
	MisResultAction(AddMoney,1125,1125)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 545 )	
	TriggerAction( 1, AddNextFlag, 889, 10, 15 )
	RegCurTrigger( 8891 )

----------------------------------Ужасающее оружие лесных монстров--Меккилон
	DefineMission( 890, "\211\230\224\241\224\254\249\229\229 \238\240\243\230\232\229 \235\229\241\237\251\245 \236\238\237\241\242\240\238\226", 890 )
	
	MisBeginTalk( "<t>У меня для Вас очень ответсвенное поручение! Доставьте мне <у5 Ужасающих посохов гиганта>, но ни кому не говорите, что Вы их ищите для меня." )
	MisBeginCondition(LvCheck, ">", 45 )
	MisBeginCondition(HasRecord, 887)
	MisBeginCondition(NoMission, 890)
	MisBeginCondition(NoRecord, 890)
	MisBeginAction(AddMission, 890)
	MisBeginAction(AddTrigger, 8901, TE_GETITEM, 4912, 5 )--Ужасающий посох гиганта
	MisCancelAction(ClearMission, 890)
	
	MisNeed(MIS_NEED_DESP, " Принести <bМеккилонув> точку (2662,648) <y5 Ужасающих посохов Гиганта>." )
	MisNeed(MIS_NEED_ITEM, 4912, 5, 10, 5)
	
	MisHelpTalk( " Я всё ещё жду, что Вы мне принесёте то, что я Вам заказал!" )
	MisResultTalk( " Спасибо вам!" )
	MisResultCondition(NoRecord, 890)
	MisResultCondition(HasMission, 890)
	MisResultCondition(HasItem, 4912, 5)
	MisResultAction(TakeItem, 4912, 5)
	MisResultAction(ClearMission, 890)
	MisResultAction(SetRecord, 890)
	MisResultAction(AddExp,26112,26112)
	MisResultAction(AddMoney,1125,1125)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4912 )	
	TriggerAction( 1, AddNextFlag, 890, 10, 5 )
	RegCurTrigger(8901)

-----------------------------------	За Честь--нейла
	DefineMission( 891, "\199\224 \215\229\241\242\252", 891 )
	
	MisBeginTalk( "<t>Некоторые люди идут на войну ради установления мира, другие ради собственной чести. Если Вы хотите доказать, что Вы достойный воин, выполните моё поручение.<n><t>Не ради мира, а ради чести и славы!" )
	MisBeginCondition(LvCheck, ">", 46 )
	MisBeginCondition(HasRecord, 888)
	MisBeginCondition(NoMission, 891)
	MisBeginCondition(NoRecord, 891)
	MisBeginAction(AddMission, 891)
	MisBeginAction(AddTrigger, 8911, TE_KILL, 506, 10 )---------Скелет-воитель
	MisBeginAction(AddTrigger, 8912, TE_GETITEM, 4826, 1 )------Знак воинской чести
	MisCancelAction(ClearMission, 891)

	MisNeed(MIS_NEED_DESP, " Убить для <bНейлы>, находящей в точке(2675,631), <r10 скелетов-воителей> и принести один <yзнак воинской чести>." )
	MisNeed(MIS_NEED_KILL, 506, 10, 10, 10 )
	MisNeed(MIS_NEED_ITEM, 4826, 1, 20, 1 )

	MisHelpTalk( " Вы не хотите сами себе доказать, что Вы настоящий воин?" )
	MisResultTalk("Очень хорошо! Вы справились с моей не простой задачей!" )
	MisResultCondition(NoRecord, 891)
	MisResultCondition(HasMission, 891)
	MisResultCondition(HasFlag, 891, 19)
	MisResultCondition(HasItem, 4826, 1)
	MisResultAction(TakeItem, 4826, 1)
	MisResultAction(ClearMission, 891)
	MisResultAction(SetRecord, 891)
	MisResultAction(AddExp,28832,28832)
	MisResultAction(AddMoney,1146,1146)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 506 )	
	TriggerAction( 1, AddNextFlag, 891, 10, 10 )
	RegCurTrigger( 8911 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4826 )	
	TriggerAction( 1, AddNextFlag, 891, 20, 1 )
	RegCurTrigger( 8912 )


-----------------------------------	Охота на Ящера--нейла
	DefineMission( 892, "\206\245\238\242\224 \237\224 \223\249\229\240\224", 892 )
	
	MisBeginTalk( "<t>Все, на кого мы ходили охотиться, по сравнению с Ящером просто баловство! Ящер - вот настоящий стимул охоты!" )
	MisBeginCondition(LvCheck, ">", 49 )
	MisBeginCondition(HasRecord, 885)
	MisBeginCondition(NoMission, 892)
	MisBeginCondition(NoRecord, 892)
	MisBeginAction(AddMission, 892)
	MisBeginAction(AddTrigger, 8921, TE_KILL, 196, 15 )--Ящер
	MisCancelAction(ClearMission, 892)

	MisNeed(MIS_NEED_DESP, " Убить <r15 Ящеров> для <bНейлы>(2675,631)." )
	MisNeed(MIS_NEED_KILL, 196, 15, 10, 15 )

	MisHelpTalk( " Уже убили 15 Ящеров? Тогда идите и убейте." )
	MisResultTalk(" После моих испытаний Вы научились обладать своими желаниями и научились охотиться." )
	MisResultCondition(NoRecord, 892)
	MisResultCondition(HasMission, 892)
	MisResultCondition(HasFlag, 892, 24)
	MisResultAction(ClearMission, 892)
	MisResultAction(SetRecord, 892)
	MisResultAction(AddExp,38628,38628)
	MisResultAction(AddMoney,1212,1212)


	InitTrigger()
	TriggerCondition( 1, IsMonster, 196 )	
	TriggerAction( 1, AddNextFlag, 892, 10, 15 )
	RegCurTrigger( 8921 )

-----------------------------------Коллекция Топоров ящера
	DefineMission( 893, "\202\238\235\235\229\234\246\232\255 \210\238\239\238\240\238\226 \255\249\229\240\224", 893 )
	
	MisBeginTalk( "<t>Ах! Как бы я хотел иметь коллекцию из <yтопоров ящера>..." )
	MisBeginCondition(LvCheck, ">", 49 )
	MisBeginCondition(HasRecord, 890)
	MisBeginCondition(NoMission, 893)
	MisBeginCondition(NoRecord, 893)
	MisBeginAction(AddMission, 893)
	MisBeginAction(AddTrigger, 8931, TE_GETITEM, 4920, 5 )--Топор ящера
	MisCancelAction(ClearMission, 893)
	
	MisNeed(MIS_NEED_DESP, " Принести в точку(2662,648) <bМеккилону> <y5 топоров ящера>." )
	MisNeed(MIS_NEED_ITEM, 4920, 5, 10, 5)
	
	MisHelpTalk( " Я не спешу! Но Вы обещаете мне принести <yтопоры ящера>?" )
	MisResultTalk( " Спасибо Вам! Вы мне очень помогли." )
	MisResultCondition(NoRecord, 893)
	MisResultCondition(HasMission, 893)
	MisResultCondition(HasItem, 4920, 5)
	MisResultAction(TakeItem, 4920, 5)
	MisResultAction(ClearMission, 893)
	MisResultAction(SetRecord, 893)
	MisResultAction(AddExp,38628,38628)
	MisResultAction(AddMoney,1212,1212)


	InitTrigger()
	TriggerCondition( 1, IsItem, 4920 )	
	TriggerAction( 1, AddNextFlag, 893, 10, 5 )
	RegCurTrigger(8931)


---------------------------------------------------------------
--							    							 --
--			незаконное издание корибских морей			     --
--														     --
---------------------------------------------------------------


----------------------------------------
--                                    --
--              Миссия "Викинг"       --
--                                    --
----------------------------------------

--Марк Тёрнер(о.Скелетов)-"Обнаружение"
	DefineMission(894, "\196\238\234\224\231\224\242\229\235\252\241\242\226\224 \240\224\241\241\235\229\228\238\226\224\237\232\255", 894)--Доказательства расследования---Марк Тёрнер(о.Скелетов)
	MisBeginTalk( "<t>Эй, ты! А ну ка стоять! Ха! Ты пират! Ты тут недавно?<n><t>Если Ты пират, то докажи мне это! Уничтожь <r4 Турель мертвых душ> в <pВоенной Базе>. Это опасно, но докажет твою преданность к пиратам." )
	
	MisBeginCondition(NoRecord, 894)
	MisBeginCondition(NoMission, 894)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 894)
	MisBeginAction(AddTrigger, 8941, TE_KILL, 801, 4)--Турель мертвых душ

	MisCancelAction(ClearMission, 894)

	MisNeed(MIS_NEED_KILL, 801, 4, 10, 4)
	

	MisHelpTalk( "<t>Что? Ты ещё не выполнил моё поручение? Ступай немедленно!" )
	MisResultTalk( "<t>Ты настоящий пират! И, как я только мог сомневаться в этом! Я рассказал о твоём героическом подвиге <bПирату Джеку>, он заинтересовался в тебе!<n><t>Отправляйся к <bПирату Джеку> и поговори с ним!" )

	MisResultCondition(HasMission , 894)
	MisResultCondition(NoRecord, 894)
	MisResultCondition(HasFlag, 894, 13)
	MisResultCondition(HasPirateGuild)

	MisResultAction(ClearMission, 894)
	MisResultAction(SetRecord, 894)

	MisResultAction(AddExp, 80000,80000)
	MisResultAction(AddMoney, 40000,40000)

	InitTrigger()
	TriggerCondition(1, IsMonster, 801)
	TriggerAction(1, AddNextFlag, 894, 10, 4)
	RegCurTrigger(8941)
		

--Пират Джек (Бесподобный пират)

	DefineMission( 895, "\193\229\241\239\238\228\238\225\237\251\233 \239\232\240\224\242", 895 )
	MisBeginTalk( "<t>Мне, о тебе рассказал <pТёрнер>! Я восхищён твоей решимостью и смелостью! Ты подходишь для моего особого поручения!<n><t>Мы сейчас воюем с пиратами призраками! Это армия <pБарбаросо>! Ты нам нужен, что бы одержать пообеду! Но для начала ты должен ослабить армию противника убив <r30 Солдат мёртвых душ> и <r15 Мёртвых душ>. Я верю в тебя!" )
	
	MisBeginCondition(HasRecord, 894)
	MisBeginCondition(NoRecord, 895)
	MisBeginCondition(NoMission, 895)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 895)
	MisBeginAction(AddTrigger, 8951, TE_KILL, 808, 30)--Солдат мертвых душ
	MisBeginAction(AddTrigger, 8952, TE_KILL, 817, 15)--мертвая душа

	MisCancelAction(ClearMission, 895)

	MisNeed(MIS_NEED_KILL, 808, 30, 30, 30)
	MisNeed(MIS_NEED_KILL, 817, 15, 70, 15)
	

	MisHelpTalk( "<t>Это не простое поручение! От этого зависит судьба пиратов." )
	MisResultTalk( "<t>Ты действительно <pвеликий пират>! Тебе необходимо немного отдохнуть перед великим боем!" )

	MisResultCondition(HasMission ,895)
	MisResultCondition(NoRecord , 895)
	MisResultCondition(HasFlag, 895, 59)
	MisResultCondition(HasFlag, 895, 84)
	MisResultCondition(HasPirateGuild)

	MisResultAction(ClearMission, 895)
	MisResultAction(SetRecord, 895)

	MisResultAction(AddExp, 200000,200000)
	MisResultAction(AddMoney, 150000,150000)

	InitTrigger()
	TriggerCondition(1, IsMonster, 808)
	TriggerAction(1, AddNextFlag, 895, 30, 30)
	RegCurTrigger(8951)
		
	InitTrigger()
	TriggerCondition(1, IsMonster, 817)
	TriggerAction(1, AddNextFlag, 895, 70, 15)
	RegCurTrigger(8952)
	
	
-- Пират Джек "Голова Командующего"

	DefineMission( 896, "\193\238\229\226\238\233 \241\242\240\238\233", 896 )
	MisBeginTalk( "<t>Ты хорошо отдохнул? Отлично! Мои пираты готовы выступить, но для начала ты должен помочь мне избавить их от страха.<n><t>Убей <rКомандира мёртвых душ> и принеси его <yголову>. Это придаст уверенности моим пиратам." )
	
	MisBeginCondition(HasRecord, 895)
	MisBeginCondition(NoRecord, 896)
	MisBeginCondition(NoMission, 896)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 896)
	MisBeginAction(AddTrigger, 8961, TE_KILL, 807, 1)--------------Командир мёртвых душ
	MisBeginAction(AddTrigger, 8962, TE_GETITEM, 2387, 1)----------Глава разделенного командования

	MisCancelAction(ClearMission, 896)

	MisNeed(MIS_NEED_KILL, 807, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2387, 1, 20, 1)
	

	MisHelpTalk( "<t>Не рескуй по напрасну! Это очень опасное задание!" )
	MisResultTalk( "<t>Ха-ха-ха! Да ты вскружил ему голову! Ха-ха-ха... он её просто потерял!" )

	MisResultCondition(HasMission, 896)
	MisResultCondition(NoRecord, 896)
	MisResultCondition(HasFlag, 896, 10)
	MisResultCondition(HasItem, 2387, 1)
	MisResultBagNeed(1)
	MisResultCondition(HasPirateGuild)

	MisResultAction(TakeItem, 2387, 1)
	MisResultAction(ClearMission, 896)
	MisResultAction(SetRecord, 896)

	MisResultAction(AddExp, 500000,500000)
	MisResultAction(AddMoney, 1000000,1000000)

	InitTrigger()
	TriggerCondition(1, IsMonster, 807)
	TriggerAction(1, AddNextFlag, 896, 10, 1)
	RegCurTrigger(8961)
		
	InitTrigger()
	TriggerCondition(1, IsItem, 2387)
	TriggerAction(1, AddNextFlag, 896, 20, 1)
	RegCurTrigger(8962)




----------------------------------------
--                                    --
--       Морское путешествие  		  --
--           Флот                     --
----------------------------------------

-- Веллингтон--Продовольствия пиратов
	DefineMission( 897, "\207\240\238\228\238\226\238\235\252\241\242\226\232\255 \239\232\240\224\242\238\226", 897 )

	MisBeginTalk( "<t>Становись! Смирно! Равнение на меня! Боец! Ты переходишь под моё командование! Твоя первая задача это: принести <y5 Пиво Пиратов> и <y5 Барбекю пиратов>! Сначало выполнение задачи, а уже потом вопросы!" )
	MisBeginCondition(NoRecord, 897)
	MisBeginCondition(NoMission,897)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 897)
	MisBeginAction(AddTrigger, 8971,TE_GETITEM, 2413, 5)--Пиво пиратов
	MisBeginAction(AddTrigger, 8972,TE_GETITEM, 2414, 5)--Барбекю пиратов
	
	MisCancelAction(ClearMission, 897)

	MisNeed(MIS_NEED_ITEM, 2413, 5, 10, 5)
	MisNeed(MIS_NEED_ITEM, 2414, 5, 20, 5)

	MisHelpTalk( "<t>Ты это всё сможешь получить убив корабль призрак! Нам необходимо понять почему они такие сильные. и ходят легенды, что эта провизия им придаёт силу!" )

	MisResultTalk( " Так, так! Ага! Это то самое! Дайте ка я посмотрю... Хм...<n><t>Эта провизия ни чем не отличается от простой еды! По видимому это всего лишь легенда!" )
	
	MisResultCondition(HasMission, 897)
	MisResultCondition(NoRecord, 897)
	MisResultCondition(HasItem, 2413, 5)
	MisResultCondition(HasItem, 2414, 5)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem , 2413, 5)
	MisResultAction(TakeItem , 2414, 5)
	MisResultAction(ClearMission, 897)
	MisResultAction(SetRecord, 897)

	MisResultAction(AddExp ,200000, 200000)
	MisResultAction(AddMoney ,100000, 100000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2413)
	TriggerAction(1,AddNextFlag, 897, 10, 5)
	RegCurTrigger(8971)

	InitTrigger()
	TriggerCondition(1, IsItem, 2414)
	TriggerAction(1,AddNextFlag, 897, 20, 5)
	RegCurTrigger(8972)
	
-- Веллингтон--Истребление Пиратов
	DefineMission( 898, "\200\241\242\240\229\225\235\229\237\232\229 \207\232\240\224\242\238\226", 898 )

	MisBeginTalk( "<t>Эй, боец! У меня есть новая задача для тебя!<n><t>Принесите мне <y15 Пиратских костей>! Не задавай лишних вопросов! Просто принеси мне их!" )
	MisBeginCondition(HasRecord, 897)
	MisBeginCondition(NoRecord, 898)
	MisBeginCondition(NoMission,898)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 898)
	MisBeginAction(AddTrigger, 8981, TE_GETITEM, 2419, 15)--Пиратская кость
	
	MisCancelAction(ClearMission, 898)

	MisNeed(MIS_NEED_ITEM, 2419, 15, 30, 15)

	MisHelpTalk( "<t>Ты отказываешься выполнять приказы вышестоящего офицера? За это я тебя под требунал..." )

	MisResultTalk( "<t>Да! Я так и думал! Корабли призраки действуют по примому приказу Чёрной жемчужины! Отдохните перед важной миссией." )
	
	MisResultCondition(HasMission, 898)
	MisResultCondition(NoRecord, 898)
	MisResultCondition(HasItem, 2419, 15)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem , 2419, 15)
	MisResultAction(ClearMission, 898)
	MisResultAction(SetRecord, 898)

	MisResultAction(AddExp ,250000, 250000)
	MisResultAction(AddMoney ,150000, 150000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2419)
	TriggerAction(1,AddNextFlag, 898, 30, 15)
	RegCurTrigger(8981)


-- Веллингтон--Проклятый Черный бриллиант
	DefineMission( 899, "\207\240\238\234\235\255\242\251\233 \215\229\240\237\251\233 \225\240\232\235\235\232\224\237\242", 899 )

	MisBeginTalk( "<t><rЧёрный Брилиант> пугает мою армию, а так как ты уже доказал своё бестрашие я поручаю тебе избавиться от него! И принеси мне ещё <yЗнак копитана>! Ступай!" )
	MisBeginCondition(HasRecord, 898)
	MisBeginCondition(NoRecord, 899)
	MisBeginCondition(NoMission,899)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 899)
	MisBeginAction(AddTrigger, 8991,TE_KILL, 815, 1 )---------Чёрный брилиант
	MisBeginAction(AddTrigger, 8992,TE_GETITEM, 2429, 1 )----Знак Капитана
	
	MisCancelAction(ClearMission, 899)

	MisNeed(MIS_NEED_KILL, 815, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2429, 1, 20, 1)

	MisHelpTalk( "<t>Как только мы заполучим <yЗнак копитана> и убьём <rЧёрную жемчужину>, моя армия разгромит пиратов!" )

	MisResultTalk( "<t>Отлично! Ты опровдал мои надежды! Вот твоя награда, за проделанную работу!" )
	
	MisResultCondition(HasMission, 899)
	MisResultCondition(NoRecord, 899)
	MisResultCondition(HasFlag, 899, 10)
	MisResultCondition(HasItem, 2429, 1)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem , 2429, 1)
	MisResultAction(ClearMission, 899)
	MisResultAction(SetRecord, 899)

	MisResultAction(AddExp ,500000, 500000)
	MisResultAction(AddMoney ,1000000, 1000000)

	InitTrigger()
	TriggerCondition(1, IsMonster, 815, 1)
	TriggerAction(1,AddNextFlag, 899, 10,1)
	RegCurTrigger(8991)

	InitTrigger()
	TriggerCondition(1, IsItem, 2429, 1)
	TriggerAction(1,AddNextFlag, 899, 20,1)
	RegCurTrigger(8992)
end
AreaMission001()