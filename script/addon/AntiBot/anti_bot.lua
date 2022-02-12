-------------
-- Анти-бот --
-------------

function AntiBotSystem(role)
	local name = GetChaDefaultName(role)
	local CheckBot = CheckBot(role)
	if CheckBot == 0 then
		if AntiBot[name] == nil then
			local X,Y = GetChaPos(role)
			AntiBot[name] = { Pos_X = X , Pos_Y = Y }
			return 1
		end
	elseif CheckBot == 1 then
		return 0
	end
end

function CheckBot(role)
	local name = GetChaDefaultName(role)
	local X,Y = GetChaPos(role)

	if AntiBot[name] ~= nil then
		if AntiBot[name].Pos_X == X and AntiBot[name].Pos_Y == Y then
			--SystemNotice ( role , "Невозможно использовать навык стоя на одном месте!" )
			return 1
		else
			AntiBot[name] = nil
			return 0
		end
	else
		return 0
	end
end

function AntiBotSystemLine(role)
	local name = GetChaDefaultName(role)
	local CheckBotLine = CheckBotLine(role)
	local count = 0
	local map = GetChaMapName(role)
	if map == "garner" or map == "magicsea" or map == "darkblue" then
	
		if CheckBotLine == 0 then
			if AntiBotLine[name] == nil then
				local X,Y = GetChaPos(role)
				count = count + 1
				AntiBotLine[name] = { Pos_X = X , Pos_Y = Y, count = count }
				return 1
			elseif AntiBotLine[name] ~= nil then
				count = AntiBotLine[name].count + 1
				X = AntiBotLine[name].Pos_X
				Y = AntiBotLine[name].Pos_Y
				AntiBotLine[name] = { Pos_X = X , Pos_Y = Y, count = count }
				return 1
			end
		elseif CheckBotLine == 1 then
			return 0
		end
	else
		return 1
	end
end

function CheckBotLine(role)
	local name = GetChaDefaultName(role)
	local X,Y = GetChaPos(role)
	if AntiBotLine[name] ~= nil then
	LG("anti-bot", name.." "..AntiBotLine[name].count )
		if AntiBotLine[name].count <= AntiBotCOUNT then
			--SystemNotice(role,"AntiBotLine[name].count <= 3 ")
			if AntiBotLine[name].Pos_X == X and AntiBotLine[name].Pos_Y == Y then
				--SystemNotice(role,"CheckBot Работа")
				LG("anti-bot", name.."  Работа ")
				return 0
			else
				LG("anti-bot", name.."   Удаление перемнных ")
				--SystemNotice(role,"CheckBot Удаление перемнных")
				AntiBotLine[name] = nil
				return 0
			end
		elseif AntiBotLine[name].count > 3 then
			--SystemNotice(role,"AntiBotLine[name].count > 3 ")
			if AntiBotLine[name].Pos_X == X and AntiBotLine[name].Pos_Y == Y then
				LG("anti-bot", name.."  Невозможно использовать навык стоя на одном месте ")
				--SystemNotice ( role , "Невозможно использовать навык стоя на одном месте!" )
				return 1
			else
				LG("anti-bot", name.."   Удаление перемнных ")
				--SystemNotice(role,"CheckBot Удаление перемнных")
				AntiBotLine[name] = nil
				return 0
			end
		end
	else
		return 0
	end
end


--		Название навыка		
skill_coldown = {}																																																																																																			
skill_coldown[	1	]=	0 -- 	1	Удар ветра																																																																																																					
skill_coldown[	2	]=	400 -- 	2	Обжигающий удар																																																																																																					
skill_coldown[	3	]=	400 -- 	3	Иллюзорный удар																																																																																																					
skill_coldown[	4	]=	0 -- 	4	Косой удар феникса																																																																																																					
skill_coldown[	5	]=	0 -- 	5	Огненная стрела																																																																																																					
skill_coldown[	6	]=	400 -- 	6	Ледяная стрела																																																																																																					
skill_coldown[	7	]=	0 -- 	7	Массовый выстрел																																																																																																					
skill_coldown[	8	]=	0 -- 	8	Расщепляющий выстрел																																																																																																					
skill_coldown[	9	]=	0 -- 	9	Сверкающий щит																																																																																																					
skill_coldown[	10	]=	0 -- 	10	Огромное ядро																																																																																																					
skill_coldown[	11	]=	0 -- 	11	Пушечный залп																																																																																																					
skill_coldown[	12	]=	0 -- 	12	Звуковой взрыв																																																																																																					
skill_coldown[	13	]=	0 -- 	13	Призыв																																																																																																					
skill_coldown[	14	]=	0 -- 	14	Маскировка																																																																																																					
skill_coldown[	15	]=	0 -- 	15	Водная волна																																																																																																					
skill_coldown[	16	]=	0 -- 	16	Циклон																																																																																																					
skill_coldown[	17	]=	0 -- 	17	Священный луч																																																																																																					
skill_coldown[	18	]=	0 -- 	18	Ангел-хранитель																																																																																																					
skill_coldown[	19	]=	0 -- 	19	Благословение																																																																																																					
skill_coldown[	20	]=	0 -- 	20	Заклинание																																																																																																					
skill_coldown[	22	]=	0 -- 	22	Падший фараон																																																																																																					
skill_coldown[	23	]=	0 -- 	23	Отравляющее облако																																																																																																					
skill_coldown[	24	]=	0 -- 	24	Огненный щит																																																																																																					
skill_coldown[	25	]=	0 -- 	25	Голая рука																																																																																																					
skill_coldown[	26	]=	400 -- 	26	Двойной взрыв																																																																																																					
skill_coldown[	27	]=	400 -- 	27	Выстрел пушки																																																																																																					
skill_coldown[	28	]=	0 -- 	28	Меч																																																																																																					
skill_coldown[	29	]=	0 -- 	29	Большой меч																																																																																																					
skill_coldown[	30	]=	0 -- 	30	Лук																																																																																																					
skill_coldown[	31	]=	0 -- 	31	Мушкет																																																																																																					
skill_coldown[	32	]=	0 -- 	32	Клинок																																																																																																					
skill_coldown[	33	]=	0 -- 	33	Боксерские перчатки																																																																																																					
skill_coldown[	34	]=	0 -- 	34	Кинжал																																																																																																					
skill_coldown[	35	]=	0 -- 	35	Мешочек с золотом																																																																																																					
skill_coldown[	36	]=	0 -- 	36	Короткий посох																																																																																																					
skill_coldown[	37	]=	0 -- 	37	Молот																																																																																																					
skill_coldown[	38	]=	0 -- 	38	Двуручное оружие																																																																																																					
skill_coldown[	39	]=	0 -- 	39	Подключение																																																																																																					
skill_coldown[	40	]=	0 -- 	40	Отправиться в плавание																																																																																																					
skill_coldown[	42	]=	0 -- 	42	Взрыв чернил																																																																																																					
skill_coldown[	43	]=	400 -- 	43	Грозовой удар																																																																																																					
skill_coldown[	44	]=	0 -- 	44	Исследование огнестрельного оружия																																																																																																					
skill_coldown[	45	]=	400 -- 	45	Ангельское благословение																																																																																																					
skill_coldown[	46	]=	0 -- 	46	Удар на пари																																																																																																					
skill_coldown[	47	]=	0 -- 	47	Косой удар фантома																																																																																																					
skill_coldown[	48	]=	400 -- 	48	Лечение																																																																																																					
skill_coldown[	49	]=	0 -- 	49	Слепой																																																																																																					
skill_coldown[	50	]=	0 -- 	50	Предохранительный щит																																																																																																					
skill_coldown[	51	]=	0 -- 	51	Щит мороза																																																																																																					
skill_coldown[	52	]=	0 -- 	52	Очищенный порох																																																																																																					
skill_coldown[	53	]=	0 -- 	53	Слабость атаки																																																																																																					
skill_coldown[	54	]=	400 -- 	54	Ангельское благословение																																																																																																					
skill_coldown[	55	]=	400 -- 	55	Благословение																																																																																																					
skill_coldown[	56	]=	400 -- 	56	Адские крылья																																																																																																					
skill_coldown[	57	]=	400 -- 	57	Священный луч																																																																																																					
skill_coldown[	58	]=	400 -- 	58	Святая геральдика																																																																																																					
skill_coldown[	59	]=	400 -- 	59	Луч удачи																																																																																																					
skill_coldown[	60	]=	400 -- 	60	Пересечение																																																																																																					
skill_coldown[	61	]=	400 -- 	61	Адский взрыв																																																																																																					
skill_coldown[	62	]=	400 -- 	62	Искусство владеть мечом																																																																																																					
skill_coldown[	63	]=	400 -- 	63	Стальная воля																																																																																																					
skill_coldown[	64	]=	400 -- 	64	Усиление																																																																																																					
skill_coldown[	65	]=	0 -- 	65	Сноровка																																																																																																					
skill_coldown[	66	]=	0 -- 	66	Концентрация																																																																																																					
skill_coldown[	67	]=	0 -- 	67	Мастер большого меча																																																																																																					
skill_coldown[	68	]=	400 -- 	68	Кровавый бык																																																																																																					
skill_coldown[	69	]=	0 -- 	69	Отклонение																																																																																																					
skill_coldown[	70	]=	0 -- 	70	Кровавое безумие																																																																																																					
skill_coldown[	71	]=	0 -- 	71	Звериная сила																																																																																																					
skill_coldown[	72	]=	0 -- 	72	Восстанавливать																																																																																																					
skill_coldown[	73	]=	400 -- 	73	Владение щитом																																																																																																					
skill_coldown[	74	]=	400 -- 	74	Мастер стрелкового оружия																																																																																																					
skill_coldown[	75	]=	400 -- 	75	Путь ветра																																																																																																					
skill_coldown[	76	]=	400 -- 	76	Следопыт																																																																																																					
skill_coldown[	77	]=	400 -- 	77	Охотничий камуфляж																																																																																																					
skill_coldown[	78	]=	0 -- 	78	Мастер огнестрельного оружия																																																																																																					
skill_coldown[	79	]=	0 -- 	79	Сила																																																																																																					
skill_coldown[	80	]=	400 -- 	80	Благодать господня																																																																																																					
skill_coldown[	81	]=	400 -- 	81	Иллюзорный удар																																																																																																					
skill_coldown[	82	]=	400 -- 	82	Могучий удар																																																																																																					
skill_coldown[	83	]=	400 -- 	83	Первобытная ярость																																																																																																					
skill_coldown[	84	]=	400 -- 	84	Берсерк																																																																																																					
skill_coldown[	85	]=	400 -- 	85	Удар в спину																																																																																																					
skill_coldown[	86	]=	400 -- 	86	Теневой удар																																																																																																					
skill_coldown[	87	]=	400 -- 	87	Ядовитый дротик																																																																																																					
skill_coldown[	88	]=	0 -- 	88	Оцепенение																																																																																																					
skill_coldown[	89	]=	0 -- 	89	Глаз орла																																																																																																					
skill_coldown[	90	]=	400 -- 	90	Двойной выстрел																																																																																																					
skill_coldown[	91	]=	400 -- 	91	Охотничий удар																																																																																																					
skill_coldown[	92	]=	400 -- 	92	Звездный удар																																																																																																					
skill_coldown[	93	]=	400 -- 	93	Ледяная стрела																																																																																																					
skill_coldown[	94	]=	400 -- 	94	Калечащий выстрел																																																																																																					
skill_coldown[	95	]=	400 -- 	95	Ослабление																																																																																																					
skill_coldown[	96	]=	400 -- 	96	Выстрел в голову																																																																																																					
skill_coldown[	97	]=	400 -- 	97	Исцеление																																																																																																					
skill_coldown[	98	]=	400 -- 	98	Восстановление																																																																																																					
skill_coldown[	99	]=	400 -- 	99	Призрачный удар																																																																																																					
skill_coldown[	100	]=	400 -- 	100	Призрачный огонь																																																																																																					
skill_coldown[	101	]=	400 -- 	101	Мощь бури																																																																																																					
skill_coldown[	102	]=	400 -- 	102	Воронка торнадо																																																																																																					
skill_coldown[	103	]=	400 -- 	103	Ангельский щит																																																																																																					
skill_coldown[	104	]=	400 -- 	104	Печать старейшины																																																																																																					
skill_coldown[	105	]=	400 -- 	105	Росчерк тени																																																																																																					
skill_coldown[	106	]=	400 -- 	106	Магический щит																																																																																																					
skill_coldown[	107	]=	400 -- 	107	Вой																																																																																																					
skill_coldown[	108	]=	400 -- 	108	Варварское дробление																																																																																																					
skill_coldown[	109	]=	400 -- 	109	Рубка двумя мечами																																																																																																					
skill_coldown[	110	]=	0 -- 	110	Шипастый щит																																																																																																					
skill_coldown[	111	]=	0 -- 	111	Парирование																																																																																																					
skill_coldown[	112	]=	400 -- 	112	Метеоритный дождь																																																																																																					
skill_coldown[	113	]=	400 -- 	113	Зажигательная пуля																																																																																																					
skill_coldown[	114	]=	0 -- 	114	Дробь																																																																																																					
skill_coldown[	115	]=	400 -- 	115	Проникающая пуля																																																																																																					
skill_coldown[	116	]=	400 -- 	116	Истинное зрение																																																																																																					
skill_coldown[	117	]=	400 -- 	117	Великое исцеление																																																																																																					
skill_coldown[	118	]=	400 -- 	118	Мощное Восстановление																																																																																																					
skill_coldown[	119	]=	400 -- 	119	Проклятый огонь																																																																																																					
skill_coldown[	120	]=	400 -- 	120	Контргард																																																																																																					
skill_coldown[	121	]=	400 -- 	121	Бездонное болото																																																																																																					
skill_coldown[	122	]=	400 -- 	122	Исцеляющий источник																																																																																																					
skill_coldown[	123	]=	400 -- 	123	Скрытность																																																																																																					
skill_coldown[	124	]=	400 -- 	124	Воскрешение																																																																																																					
skill_coldown[	125	]=	400 -- 	125	Поклонение тотему																																																																																																					
skill_coldown[	126	]=	0 -- 	126	Исследование пороха																																																																																																					
skill_coldown[	127	]=	400 -- 	127	Рык тигра																																																																																																					
skill_coldown[	128	]=	0 -- 	128	Слюна ящера																																																																																																					
skill_coldown[	129	]=	0 -- 	129	Игла дурмана																																																																																																					
skill_coldown[	130	]=	0 -- 	130	Камень энта																																																																																																					
skill_coldown[	131	]=	0 -- 	131	Бамбуковый побег панды																																																																																																					
skill_coldown[	132	]=	0 -- 	132	Арбалетный болт терранского старейшины																																																																																																					
skill_coldown[	133	]=	0 -- 	133	Арбалетный болт наяды																																																																																																					
skill_coldown[	134	]=	0 -- 	134	Устрица																																																																																																					
skill_coldown[	135	]=	0 -- 	135	Пузырчатый моллюск																																																																																																					
skill_coldown[	136	]=	0 -- 	136	Детеныш ледяного дракона																																																																																																					
skill_coldown[	137	]=	0 -- 	137	Ледяной дракон																																																																																																					
skill_coldown[	138	]=	0 -- 	138	Колчан тени																																																																																																					
skill_coldown[	139	]=	0 -- 	139	Туман Снежной королевы																																																																																																					
skill_coldown[	140	]=	0 -- 	140	Огненный шар вождя																																																																																																					
skill_coldown[	141	]=	0 -- 	141	Колчан вервольфа																																																																																																					
skill_coldown[	142	]=	0 -- 	142	Огненный шар гигантского слизня																																																																																																					
skill_coldown[	143	]=	0 -- 	143	Ледяной кубик королевского пингвина																																																																																																					
skill_coldown[	144	]=	0 -- 	144	Дротик крота-ниндзя																																																																																																					
skill_coldown[	145	]=	0 -- 	145	Сердце русалки																																																																																																					
skill_coldown[	146	]=	0 -- 	146	Защитник реликвий																																																																																																					
skill_coldown[	147	]=	0 -- 	147	Волна королевской черепахи																																																																																																					
skill_coldown[	148	]=	0 -- 	148	Пузырь Водной Танцовщицы																																																																																																					
skill_coldown[	149	]=	0 -- 	149	Грязь грязедемона																																																																																																					
skill_coldown[	150	]=	0 -- 	150	Рука дурмана																																																																																																					
skill_coldown[	151	]=	0 -- 	151	Ангел-хранитель																																																																																																					
skill_coldown[	152	]=	0 -- 	152	Душа богини																																																																																																					
skill_coldown[	153	]=	0 -- 	153	Туман снежной королевы																																																																																																					
skill_coldown[	154	]=	0 -- 	154	Глыба грязевого короля																																																																																																																																																																																																									
skill_coldown[	199	]=	0 -- 	199	Банк																																																																																																					
skill_coldown[	200	]=	0 -- 	200	Рубка леса																																																																																																					
skill_coldown[	201	]=	0 -- 	201	Добыча руды																																																																																																					
skill_coldown[	202	]=	400 -- 	202	Место																																																																																																					
skill_coldown[	210	]=	400 -- 	210	Усердие																																																																																																					
skill_coldown[	211	]=	400 -- 	211	Водоток																																																																																																					
skill_coldown[	212	]=	400 -- 	212	Броня из раковин																																																																																																					
skill_coldown[	213	]=	400 -- 	213	Торнадо																																																																																																					
skill_coldown[	214	]=	400 -- 	214	Молния																																																																																																					
skill_coldown[	215	]=	400 -- 	215	Переплетение водорослей																																																																																																					
skill_coldown[	216	]=	400 -- 	216	Коралловый луч																																																																																																					
skill_coldown[	217	]=	400 -- 	217	Попутный ветер																																																																																																					
skill_coldown[	218	]=	400 -- 	218	Вихрь																																																																																																					
skill_coldown[	219	]=	400 -- 	219	Туман																																																																																																					
skill_coldown[	220	]=	400 -- 	220	Грозовая завеса																																																																																																					
skill_coldown[	222	]=	400 -- 	222	Бронелом																																																																																																					
skill_coldown[	223	]=	400 -- 	223	Воодушевление																																																																																																					
skill_coldown[	224	]=	400 -- 	224	Отравленная стрела																																																																																																					
skill_coldown[	225	]=	400 -- 	225	Закалка																																																																																																					
skill_coldown[	226	]=	0 -- 	226	Мастерство канонира																																																																																																					
skill_coldown[	227	]=	0 -- 	227	Усилен. дерев. конструкции																																																																																																					
skill_coldown[	228	]=	0 -- 	228	Мореходство																																																																																																					
skill_coldown[	229	]=	0 -- 	229	Усиление корпуса																																																																																																					
skill_coldown[	230	]=	0 -- 	230	Улучшение топливного бака																																																																																																					
skill_coldown[	231	]=	0 -- 	231	Рыболовство																																																																																																					
skill_coldown[	232	]=	0 -- 	232	Траление																																																																																																					
skill_coldown[	233	]=	0 -- 	233	Артобстрел																																																																																																					
skill_coldown[	234	]=	0 -- 	234	Крик смерти																																																																																																					
skill_coldown[	235	]=	0 -- 	235	Кровавая ярость																																																																																																					
skill_coldown[	236	]=	0 -- 	236	Логово																																																																																																					
skill_coldown[	237	]=	0 -- 	237	Землетрясение																																																																																																					
skill_coldown[	238	]=	0 -- 	238	Удар колосса																																																																																																					
skill_coldown[	239	]=	0 -- 	239	Поцелуй мороза																																																																																																					
skill_coldown[	240	]=	0 -- 	240	Кровожадный клинок																																																																																																					
skill_coldown[	241	]=	0 -- 	241	Поставить ларек																																																																																																					
skill_coldown[	242	]=	400 -- 	242	Насмешка																																																																																																					
skill_coldown[	243	]=	400 -- 	243	Рык																																																																																																					
skill_coldown[	244	]=	400 -- 	244	Копия																																																																																																					
skill_coldown[	245	]=	0 -- 	245	Ловушка морской водоросли																																																																																																					
skill_coldown[	246	]=	0 -- 	246	Электрический разряд медузы																																																																																																					
skill_coldown[	247	]=	0 -- 	247	Водоворотный удар кальмара																																																																																																					
skill_coldown[	248	]=	0 -- 	248	Атака акулы																																																																																																					
skill_coldown[	249	]=	0 -- 	249	Самоуничтожение выползня																																																																																																					
skill_coldown[	250	]=	0 -- 	250	Примитивное умение 1																																																																																																					
skill_coldown[	251	]=	0 -- 	251	Первобытная ярость 2																																																																																																					
skill_coldown[	252	]=	0 -- 	252	Взрыв водяной мины																																																																																																					
skill_coldown[	253	]=	0 -- 	253	Пушечный удар																																																																																																					
skill_coldown[	254	]=	0 -- 	254	Ремонт																																																																																																					
skill_coldown[	255	]=	400 -- 	255	Кристальное благословение																																																																																																					
skill_coldown[	256	]=	400 -- 	256	Сильная магия																																																																																																					
skill_coldown[	257	]=	0 -- 	257	Трупная атака																																																																																																					
skill_coldown[	258	]=	0 -- 	258	Дистанционная атака трупа																																																																																																					
skill_coldown[	259	]=	0 -- 	259	Волшебство лисьего даоса																																																																																																					
skill_coldown[	260	]=	0 -- 	260	Волшебство кицуне																																																																																																					
skill_coldown[	261	]=	0 -- 	261	Восхищать																																																																																																					
skill_coldown[	262	]=	0 -- 	262	Волшебство бессмертной лисы																																																																																																					
skill_coldown[	263	]=	0 -- 	263	Область действия заклинания бессмертной лисы																																																																																																					
skill_coldown[	264	]=	0 -- 	264	Ритуал																																																																																																					
skill_coldown[	265	]=	0 -- 	265	Колдовство сахема																																																																																																					
skill_coldown[	266	]=	0 -- 	266	Закрученный крюк																																																																																																					
skill_coldown[	267	]=	0 -- 	267	Собачий вой																																																																																																					
skill_coldown[	268	]=	0 -- 	268	Трупный яд																																																																																																					
skill_coldown[	269	]=	0 -- 	269	Удар ледяного дракона																																																																																																					
skill_coldown[	270	]=	0 -- 	270	Блокада киборга																																																																																																					
skill_coldown[	271	]=	0 -- 	271	Крабовая оплетка																																																																																																					
skill_coldown[	272	]=	0 -- 	272	Проклятие келпи																																																																																																					
skill_coldown[	273	]=	0 -- 	273	Морозное дыхание																																																																																																					
skill_coldown[	274	]=	0 -- 	274	Танец Ледяного дракона																																																																																																					
skill_coldown[	275	]=	0 -- 	275	Ужас черного дракона																																																																																																					
skill_coldown[	276	]=	0 -- 	276	Рык Черного дракона																																																																																																					
skill_coldown[	277	]=	0 -- 	277	Полет черного дракона																																																																																																					
skill_coldown[	278	]=	0 -- 	278	Дыхание черного дракона																																																																																																					
skill_coldown[	279	]=	400 -- 	279	Воскресить																																																																																																					
skill_coldown[	280	]=	400 -- 	280	Тело феи																																																																																																					
skill_coldown[	281	]=	0 -- 	281	Рык Черного дракона																																																																																																					
skill_coldown[	282	]=	0 -- 	282	Черный дракон Молния																																																																																																					
skill_coldown[	283	]=	0 -- 	283	Ускользающий удар черного дракона 																																																																																																					
skill_coldown[	284	]=	0 -- 	284	Огненный шар черного дракона																																																																																																					
skill_coldown[	285	]=	0 -- 	285	Призыв черного дракона																																																																																																					
skill_coldown[	286	]=	0 -- 	286	Мертвая душа Зажигательная пуля																																																																																																					
skill_coldown[	287	]=	0 -- 	287	Ускорение Мертвой души																																																																																																					
skill_coldown[	288	]=	0 -- 	288	Атака Мушкета																																																																																																					
skill_coldown[	289	]=	0 -- 	289	Ракета Мертвой души																																																																																																					
skill_coldown[	290	]=	0 -- 	290	Лазерный лук																																																																																																					
skill_coldown[	291	]=	0 -- 	291	Отравленный дротик мертвых душ																																																																																																					
skill_coldown[	292	]=	0 -- 	292	Призыв мертвой души																																																																																																					
skill_coldown[	293	]=	0 -- 	293	Удаленный взрыв																																																																																																					
skill_coldown[	294	]=	0 -- 	294	Атака Облака																																																																																																					
skill_coldown[	295	]=	0 -- 	295	Отягощенный скелет																																																																																																					
skill_coldown[	296	]=	0 -- 	296	Мифическое перемещение																																																																																																					
skill_coldown[	297	]=	0 -- 	297	Скелетная защита																																																																																																					
skill_coldown[	298	]=	0 -- 	298	Злая атака																																																																																																					
skill_coldown[	299	]=	0 -- 	299	Мертвая душа																																																																																																					
skill_coldown[	301	]=	0 -- 	301	Стенания мертвой души																																																																																																					
skill_coldown[	302	]=	0 -- 	302	Насмешка мертвых душ																																																																																																					
skill_coldown[	303	]=	0 -- 	303	Проклятая кровь																																																																																																					
skill_coldown[	304	]=	0 -- 	304	Восстанавливающий лунный свет																																																																																																					
skill_coldown[	305	]=	0 -- 	305	Мертвая душа Водяной Стрелы																																																																																																					
skill_coldown[	306	]=	0 -- 	306	Вихрь Мертвой души																																																																																																					
skill_coldown[	307	]=	0 -- 	307	Мертвая душа Грозовой завесы																																																																																																					
skill_coldown[	308	]=	0 -- 	308	Бомбометание																																																																																																					
skill_coldown[	309	]=	0 -- 	309	Духовный дротик																																																																																																					
skill_coldown[	310	]=	0 -- 	310	Физический дротик																																																																																																					
skill_coldown[	311	]=	400 -- 	311	Самоуничтожение																																																																																																					
skill_coldown[	312	]=	400 -- 	312	Навык - Вонючка																																																																																																					
skill_coldown[	313	]=	400 -- 	313	Навык - Белье																																																																																																					
skill_coldown[	314	]=	400 -- 	314	Навык - Лифчик																																																																																																					
skill_coldown[	315	]=	400 -- 	315	Навык - Монетный дождь																																																																																																					
skill_coldown[	316	]=	400 -- 	316	Навык - Дурак																																																																																																					
skill_coldown[	317	]=	400 -- 	317	Навык - Сноб																																																																																																					
skill_coldown[	318	]=	400 -- 	318	Навык - Трюкач																																																																																																					
skill_coldown[	319	]=	400 -- 	319	Навык - Тупица																																																																																																					
skill_coldown[	320	]=	0 -- 	320	Ботинок заграждения																																																																																																					
skill_coldown[	321	]=	0 -- 	321	Кулинария																																																																																																					
skill_coldown[	322	]=	0 -- 	322	Производство																																																																																																					
skill_coldown[	323	]=	0 -- 	323	Ремесло																																																																																																					
skill_coldown[	324	]=	0 -- 	324	Анализировать																																																																																																					
skill_coldown[	325	]=	0 -- 	325	Иллюзия ускользающего удара																																																																																																					
skill_coldown[	326	]=	0 -- 	326	Иллюзия кораллового луча																																																																																																					
skill_coldown[	327	]=	0 -- 	327	Иллюзия выстрела в голову																																																																																																					
skill_coldown[	328	]=	0 -- 	328	Иллюзия Призрачной стрелы																																																																																																					
skill_coldown[	329	]=	400 -- 	329	Граната																																																																																																					
skill_coldown[	330	]=	400 -- 	330	Фотобомба																																																																																																					
skill_coldown[	331	]=	400 -- 	331	Излучатель																																																																																																					
skill_coldown[	332	]=	400 -- 	332	Детектор																																																																																																					
skill_coldown[	333	]=	400 -- 	333	Ускоритель кораблей																																																																																																					
skill_coldown[	334	]=	400 -- 	334	Распылитель																																																																																																					
skill_coldown[	335	]=	400 -- 	335	Пробойник																																																																																																					
skill_coldown[	336	]=	400 -- 	336	Корабельный таран																																																																																																					
skill_coldown[	337	]=	400 -- 	337	Корабельный огнемет																																																																																																					
skill_coldown[	338	]=	400 -- 	338	Производство																																																																																																					
skill_coldown[	339	]=	400 -- 	339	Кулинария																																																																																																					
skill_coldown[	340	]=	400 -- 	340	Ремесло																																																																																																					
skill_coldown[	341	]=	400 -- 	341	Анализировать																																																																																																					
skill_coldown[	342	]=	400 -- 	342	Граната 2 ур.																																																																																																					
skill_coldown[	343	]=	400 -- 	343	Световая бомба 2 ур.																																																																																																					
skill_coldown[	344	]=	400 -- 	344	Излучатель 2 ур.																																																																																																					
skill_coldown[	345	]=	400 -- 	345	Детектор души 2 ур.																																																																																																					
skill_coldown[	346	]=	400 -- 	346	Корабельный ускоритель 2 ур.																																																																																																					
skill_coldown[	347	]=	400 -- 	347	Распылитель кораблей 2 ур.																																																																																																					
skill_coldown[	348	]=	400 -- 	348	Корабельный пробойник 2 ур.																																																																																																					
skill_coldown[	349	]=	400 -- 	349	Корабельный кол, 2 ур.																																																																																																					
skill_coldown[	350	]=	400 -- 	350	Корабельный огнемет 2 ур.																																																																																																					
skill_coldown[	351	]=	400 -- 	351	Граната 3 ур.																																																																																																					
skill_coldown[	352	]=	400 -- 	352	Световая бомба 3 ур.																																																																																																					
skill_coldown[	353	]=	400 -- 	353	Излучатель 3 ур.																																																																																																					
skill_coldown[	354	]=	400 -- 	354	Детектор души 3 ур.																																																																																																					
skill_coldown[	355	]=	400 -- 	355	Корабельный ускоритель 3 ур.																																																																																																					
skill_coldown[	356	]=	400 -- 	356	Распылитель кораблей 3 ур.																																																																																																					
skill_coldown[	357	]=	400 -- 	357	Корабельный пробойник 3 ур.																																																																																																					
skill_coldown[	358	]=	400 -- 	358	Корабельный кол 3 ур.																																																																																																					
skill_coldown[	359	]=	400 -- 	359	Корабельный огнемет 3 ур.																																																																																																					
skill_coldown[	360	]=	400 -- 	360	Граната 4 ур.																																																																																																					
skill_coldown[	361	]=	400 -- 	361	Световая бомба 4 ур.																																																																																																					
skill_coldown[	362	]=	400 -- 	362	Излучатель 4 ур.																																																																																																					
skill_coldown[	363	]=	400 -- 	363	Детектор души 4 ур.																																																																																																					
skill_coldown[	364	]=	400 -- 	364	Корабельный ускоритель 4 ур.																																																																																																					
skill_coldown[	365	]=	400 -- 	365	Распылитель кораблей 4 ур.																																																																																																					
skill_coldown[	366	]=	400 -- 	366	Корабельный пробойник 4 ур.																																																																																																					
skill_coldown[	367	]=	400 -- 	367	Корабельный кол 4 ур.																																																																																																					
skill_coldown[	368	]=	400 -- 	368	Корабельный огнемет 4 ур.																																																																																																					
skill_coldown[	369	]=	400 -- 	369	Граната 5 ур.																																																																																																					
skill_coldown[	370	]=	400 -- 	370	Световая бомба 5 ур.																																																																																																					
skill_coldown[	371	]=	400 -- 	371	Излучатель 5 ур.																																																																																																					
skill_coldown[	372	]=	400 -- 	372	Детектор души, 5 ур.																																																																																																					
skill_coldown[	373	]=	400 -- 	373	Корабельный ускоритель 5 ур.																																																																																																					
skill_coldown[	374	]=	400 -- 	374	Распылитель кораблей 5 ур.																																																																																																					
skill_coldown[	375	]=	400 -- 	375	Корабельный пробойник 5 ур.																																																																																																					
skill_coldown[	376	]=	400 -- 	376	Корабельный кол 5 ур.																																																																																																					
skill_coldown[	377	]=	400 -- 	377	Корабельный огнемет 5 ур.																																																																																																					
skill_coldown[	378	]=	400 -- 	378	Снежок																																																																																																					
skill_coldown[	379	]=	400 -- 	379	Трупное ядро 1 ур.																																																																																																					
skill_coldown[	380	]=	400 -- 	380	Источник шума 1 ур.																																																																																																					
skill_coldown[	381	]=	400 -- 	381	Генератор землетрясений 1 ур.																																																																																																					
skill_coldown[	382	]=	400 -- 	382	Сцепленные пули 1 ур.																																																																																																					
skill_coldown[	383	]=	400 -- 	383	Генератор миража 1 ур.																																																																																																					
skill_coldown[	384	]=	400 -- 	384	Скрытный корабль 1 ур.																																																																																																					
skill_coldown[	385	]=	400 -- 	385	Радар, 1 ур.																																																																																																					
skill_coldown[	386	]=	400 -- 	386	Ремонт корпуса 1 ур.																																																																																																					
skill_coldown[	387	]=	400 -- 	387	Создание еды 1 ур.																																																																																																					
skill_coldown[	388	]=	400 -- 	388	Трупная пуля 1 ур.																																																																																																					
skill_coldown[	389	]=	400 -- 	389	Генератор иллюзий 1 ур.																																																																																																					
skill_coldown[	390	]=	400 -- 	390	Взрываюшаяся овечка ур. 1																																																																																																					
skill_coldown[	391	]=	400 -- 	391	Водяная мина, 1 ур.																																																																																																					
skill_coldown[	392	]=	400 -- 	392	Трупное ядро 2 ур.																																																																																																					
skill_coldown[	393	]=	400 -- 	393	Источник шума 2 ур.																																																																																																					
skill_coldown[	394	]=	400 -- 	394	Генератор землетрясений 2 ур.																																																																																																					
skill_coldown[	395	]=	400 -- 	395	Цепная пуля 2 ур.																																																																																																					
skill_coldown[	396	]=	400 -- 	396	Генератор миражей 2 ур.																																																																																																					
skill_coldown[	397	]=	400 -- 	397	Корабль-невидимка 2 ур.																																																																																																					
skill_coldown[	398	]=	400 -- 	398	Радар 2 ур.																																																																																																					
skill_coldown[	399	]=	400 -- 	399	Ремонт корпуса 2 ур.																																																																																																					
skill_coldown[	400	]=	400 -- 	400	Создание еды 2 ур.																																																																																																					
skill_coldown[	401	]=	400 -- 	401	Трупная пуля 2 ур.																																																																																																					
skill_coldown[	402	]=	400 -- 	402	У°ПсФЩЙъТЗLV2																																																																																																					
skill_coldown[	403	]=	400 -- 	403	Взрывающаяся овечка 2 ур.																																																																																																					
skill_coldown[	404	]=	400 -- 	404	Водяная мина 2 ур.																																																																																																					
skill_coldown[	405	]=	400 -- 	405	Трупное ядро 3 ур.																																																																																																					
skill_coldown[	406	]=	400 -- 	406	Источник шума 3 ур.																																																																																																					
skill_coldown[	407	]=	400 -- 	407	Генератор землетрясений 3 ур.																																																																																																					
skill_coldown[	408	]=	400 -- 	408	Цепная пуля 5 ур.																																																																																																					
skill_coldown[	409	]=	400 -- 	409	Генератор миражей 3 ур.																																																																																																					
skill_coldown[	410	]=	400 -- 	410	Корабль-невидимка, 3 ур.																																																																																																					
skill_coldown[	411	]=	400 -- 	411	Радар 3 ур.																																																																																																					
skill_coldown[	412	]=	400 -- 	412	Ремонт корпуса 3 ур.																																																																																																					
skill_coldown[	413	]=	400 -- 	413	Создание еды 3 ур.																																																																																																					
skill_coldown[	414	]=	400 -- 	414	Трупная пуля 3 ур.																																																																																																					
skill_coldown[	415	]=	400 -- 	415	Генератор иллюзий 3 ур.																																																																																																					
skill_coldown[	416	]=	400 -- 	416	Взрывающаяся овечка 3 ур.																																																																																																					
skill_coldown[	417	]=	400 -- 	417	Водяная мина 3 ур.																																																																																																					
skill_coldown[	418	]=	400 -- 	418	Трупное ядро, 4 ур.																																																																																																					
skill_coldown[	419	]=	400 -- 	419	Шумогенератор, 4 ур.																																																																																																					
skill_coldown[	420	]=	400 -- 	420	Генератор землетрясений 4 ур.																																																																																																					
skill_coldown[	421	]=	400 -- 	421	Цепная пуля 4 ур.																																																																																																					
skill_coldown[	422	]=	400 -- 	422	Генератор иллюзий 4 ур.																																																																																																					
skill_coldown[	423	]=	400 -- 	423	Корабль-невидимка 4 ур.																																																																																																					
skill_coldown[	424	]=	400 -- 	424	Радар 4 ур.																																																																																																					
skill_coldown[	425	]=	400 -- 	425	Ремонт корпуса 4 ур.																																																																																																					
skill_coldown[	426	]=	400 -- 	426	Создание еды 4 ур.																																																																																																					
skill_coldown[	427	]=	400 -- 	427	Трупная пуля 4 ур.																																																																																																					
skill_coldown[	428	]=	400 -- 	428	Генератор иллюзий 4 ур.																																																																																																					
skill_coldown[	429	]=	400 -- 	429	Взрывающаяся овечка 4 ур.																																																																																																					
skill_coldown[	430	]=	400 -- 	430	Водяная мина 4 ур.																																																																																																					
skill_coldown[	431	]=	400 -- 	431	Трупное ядро 5 ур.																																																																																																					
skill_coldown[	432	]=	400 -- 	432	Шумогенератор 5 ур.																																																																																																					
skill_coldown[	433	]=	400 -- 	433	µШХр·ўЙъЖчLV5																																																																																																					
skill_coldown[	434	]=	400 -- 	434	Цепная пуля 5 ур.																																																																																																					
skill_coldown[	435	]=	400 -- 	435	Генератор миражей 5 ур.																																																																																																					
skill_coldown[	436	]=	400 -- 	436	Корабль-невидимка 5 ур.																																																																																																					
skill_coldown[	437	]=	400 -- 	437	АЧґпLV5																																																																																																					
skill_coldown[	438	]=	400 -- 	438	Ремонт корпуса 5 ур.																																																																																																					
skill_coldown[	439	]=	400 -- 	439	Создание еды 5 ур.																																																																																																					
skill_coldown[	440	]=	400 -- 	440	ёЇКґµЇLV5																																																																																																					
skill_coldown[	441	]=	400 -- 	441	Генератор иллюзий 5 ур.																																																																																																					
skill_coldown[	442	]=	400 -- 	442	Взрывающаяся овечка 5 ур.																																																																																																					
skill_coldown[	443	]=	400 -- 	443	Водяная мина 5 ур.																																																																																																					
skill_coldown[	444	]=	0 -- 	444	Благословляющее зелье																																																																																																					
skill_coldown[	445	]=	0 -- 	445	Замедление																																																																																																					
skill_coldown[	446	]=	0 -- 	446	Дьявольская башня																																																																																																					
skill_coldown[	447	]=	0 -- 	447	Атака змеи																																																																																																					
skill_coldown[	448	]=	0 -- 	448	Пиратская волна																																																																																																					
skill_coldown[	449	]=	0 -- 	449	Волна флота																																																																																																					
skill_coldown[	450	]=	0 -- 	450	Удар Духа																																																																																																					
skill_coldown[	451	]=	0 -- 	451	Священная свеча																																																																																																					
skill_coldown[	452	]=	0 -- 	452	Статуя Богини																																																																																																					
skill_coldown[	453	]=	0 -- 	453	Духовный удар																																																																																																					
skill_coldown[	454	]=	0 -- 	454	Сверхсознание																																																																																																					
skill_coldown[	455	]=	0 -- 	455	Удар легиона																																																																																																					
skill_coldown[	456	]=	0 -- 	456	Пушка грома																																																																																																					
skill_coldown[	457	]=	0 -- 	457	Дьявольское проклятие																																																																																																					
skill_coldown[	458	]=	0 -- 	458	Священный суд																																																																																																					
skill_coldown[	459	]=	0 -- 	459	Мистическая Сила Перерождения																																																																																																					
skill_coldown[	460	]=	0 -- 	460	Кольцо холода																																																																																																					
skill_coldown[	461	]=	0 -- 	461	Ученичество																																																																																																					
skill_coldown[	462	]=	0 -- 	462	Целебное зелье, восстанавливает здоровье со временем																																																																																																					
skill_coldown[	463	]=	0 -- 	463	Titan Potoin																																																																																																					
skill_coldown[	464	]=	0 -- 	464	Благословление																																																																																																					
skill_coldown[	465	]=	0 -- 	465	Смесь Энергии																																																																																																					
skill_coldown[	466	]=	0 -- 	466	Сердце Дьявольского Дракона																																																																																																					
skill_coldown[	467	]=	0 -- 	467	Узы любви																																																																																																					
skill_coldown[	468	]=	0 -- 	468	Ордер на арест 1 уровня																																																																																																					
skill_coldown[	469	]=	0 -- 	469	Ордер на арест 2 уровня																																																																																																					
skill_coldown[	470	]=	0 -- 	470	Ордер на арест 3 уровня																																																																																																					
skill_coldown[	471	]=	0 -- 	471	Ордер на арест 4 уровня																																																																																																					
skill_coldown[	472	]=	0 -- 	472	Тысячи золота																																																																																																					
skill_coldown[	473	]=	0 -- 	473	Exploding Zeus																																																																																																					
skill_coldown[	474	]=	0 -- 	474	Супер Зажигательная пуля																																																																																																					
skill_coldown[	475	]=	0 -- 	475	Мощный удар новичка																																																																																																					
skill_coldown[	476	]=	0 -- 	476	Перезарядка АОЕ																																																																																																					
skill_coldown[	477	]=	0 -- 	477	Deity Totem Призыв																																																																																																					
skill_coldown[	478	]=	0 -- 	478	Holy Totem Призыв																																																																																																					
skill_coldown[	479	]=	0 -- 	479	Тотем Дрожи																																																																																																					
skill_coldown[	480	]=	0 -- 	480	Тотем Поцелуя																																																																																																					
skill_coldown[	481	]=	0 -- 	481	Devil Fireball																																																																																																					
skill_coldown[	482	]=	0 -- 	482	Big Frost Spear																																																																																																					
skill_coldown[	483	]=	0 -- 	483	Small Frost Spear																																																																																																					
skill_coldown[	484	]=	0 -- 	484	Dead Scream																																																																																																					
skill_coldown[	485	]=	0 -- 	485	Большая Молния																																																																																																					
skill_coldown[	486	]=	0 -- 	486	Маленькая Молния																																																																																																					
skill_coldown[	487	]=	0 -- 	487	Дьявольский Клинок																																																																																																					
skill_coldown[	488	]=	0 -- 	488	Protector Призыв																																																																																																					
skill_coldown[	489	]=	0 -- 	489	Devil Frostball				
																																																																																																	
