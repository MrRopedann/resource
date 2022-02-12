-- Настройка свойств карты 07xmas2 (Снежная война)
-- Имя функции должно заканчиваться названием карты
-- Автор: Larein [MD Piratia Team]
-- Версия 2

function config(map)
    MapCanSavePos(map, 0) 					-- Возможность сохранять позицию персонажа на карте (1 - да, 0 - нет)
    MapCanPK(map, 1) 						-- Возможность атаковать других персонажей (1 - да, 0 - нет)
    MapCanTeam( map, 1 )					-- Возможность создавать отряды (1 - да, 0 - нет)
    MapCopyNum(map, 1) 						-- Количество копий карты (если параметр отсутствует, принимается равным 1)
    SingleMapCopyPlyNum(map, 300)  				-- Количество игроков на карте
    MapType ( map , 3 )						-- Тип карты
    MapCanStall(map , 0)					-- Возможность торговать (1 - да, 0 - нет)
    RepatriateDie(map,0)					-- Неизвестно
end

function get_map_entry_pos_07xmas2()   		-- Расположение точки входа (координаты)
	local POS_X=614
	local POS_Y=923
		return POS_X , POS_Y
end

function init_entry(map)
    SetMapEntryMapName(map, "magicsea")		-- Карта, на которой установлена точка входа на эту карту
											-- Установка времени работы карты
											-- 2010/01/01/5/0 (год/месяц/день/часы/минуты) - время начала работы карты
											-- 0/1/0  (день/час/минута) - время открытия портала (открываем ежечасно)
											-- 0/0/30 (день/час/минута) - время работы портала (портал работает 30 минут)
											-- 0/0/55 (день/час/минута) - время работы карты (карта работает 55 минут)
    SetMapEntryTime(map, "2010/01/01/5/0", "0/3/0", "0/0/30", "0/0/55") 
end

function after_enter_07xmas2( role , map_copy )
end

function before_leave_07xmas2( role )
end

-- Функция выполняется в течении всего времени работы карты
function map_copy_run_special_07xmas2( map_copy ) 

	local Now_Time = tonumber(os.date("%H"))

	local HowManyNoDead = GetMapActivePlayer(map_copy)
	Notice("\206\225\250\255\226\235\229\237\232\229: \194 \209\237\229\230\237\238\233 \226\238\233\237\229 \226\241\229 \229\249\229 \229\241\242\252 \226\251\230\232\226\248\232\229: "..HowManyNoDead.." \232\227\240\238\234(\232)")
		--Notice("Объявление: В Снежной войне все еще есть выжившие: "..HowManyNoDead.." игрок(и)")

	Every_5_minute2 = Every_5_minute2+1

-- ПЕРВАЯ ВОЛНА (5 мин)
	if Every_5_minute2 == 1 then			-- 15 честов (5 нач. лвл, 5 ср. лвл и 5 выс. лвл)

		--Сундук Хаоса нач. ур. (ID 859)
		PutMonsterOnMap(5, 859, map_copy)

		--Стандартный сундук Хаоса (ID 860)
		PutMonsterOnMap(5, 860, map_copy)

		--Сундук Хаоса выс. ур. (ID 861)
		PutMonsterOnMap(5, 861, map_copy)

	end
	
-- ВТОРАЯ ВОЛНА (10 мин)
	if Every_5_minute2 == 2 then			-- 20 честов (12 нач. лвл, 4 ср. лвл и 4 выс. лвл) и простые монстры 

		--Сундук Хаоса нач. ур. (ID 859)
		PutMonsterOnMap(12, 859, map_copy)

		--Стандартный сундук Хаоса (ID 860)
		PutMonsterOnMap(4, 860, map_copy)

		--Сундук Хаоса выс. ур. (ID 861)
		PutMonsterOnMap(4, 861, map_copy)

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then				-- МиниСНВ
			--Ланс - Новичок (ID 1140)
			PutMonsterOnMap(12, 1140, map_copy)

			--Карциз - Новичок (ID 1144)
			PutMonsterOnMap(12, 1144, map_copy)

			--Филлис - Новичок (ID 1147)
			PutMonsterOnMap(12, 1147, map_copy)

			--Ами - Новичок (ID 1151)
			PutMonsterOnMap(12, 1151, map_copy)
		else												  	-- БигСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(12, 1141, map_copy)

			--Ами - Целительница (ID 1152)
			PutMonsterOnMap(12, 1152, map_copy)

			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(12, 1148, map_copy)

			--Карциз - Мечник (ID 1145)
			PutMonsterOnMap(12, 1145, map_copy)
		end



	end

-- ТРЕТЬЯ ВОЛНА (15 мин)
	if Every_5_minute2 == 3 then			-- 20 честов (12 нач. лвл, 4 ср. лвл и 4 выс. лвл) и простые монстры 

		--Сундук Хаоса нач. ур. (ID 859)
		PutMonsterOnMap(12, 859, map_copy)

 
		--Стандартный сундук Хаоса (ID 860)
		PutMonsterOnMap(4, 860, map_copy)

		--Сундук Хаоса выс. ур. (ID 861)
		PutMonsterOnMap(4, 861, map_copy)

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then			-- МиниСНВ
			--Ланс - Новичок (ID 1140)
			PutMonsterOnMap(10, 1140, map_copy)

			--Карциз - Новичок (ID 1144)
			PutMonsterOnMap(10, 1144, map_copy)

			--Филлис - Новичок (ID 1147)
			PutMonsterOnMap(10, 1147, map_copy)

			--Ами - Новичок (ID 1151)
			PutMonsterOnMap(10, 1151, map_copy)
		else												-- БигСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(10, 1141, map_copy)

			--Ами - Целительница (ID 1152)
			PutMonsterOnMap(10, 1152, map_copy)

			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(10, 1148, map_copy)

			--Карциз - Мечник (ID 1145)
			PutMonsterOnMap(10, 1145, map_copy)
		end

	end
	
-- ЧЕТВЕРТАЯ ВОЛНА (20 мин)
	if Every_5_minute2 == 4 then			-- средние монстры

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then			-- МиниСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(12, 1141, map_copy)
	
			--Карциз - Мечник  (ID 1145)
			PutMonsterOnMap(12, 1145, map_copy)

			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(12, 1148, map_copy)
	
			--Ами - Целительница (ID 1152)
			PutMonsterOnMap(12, 1152, map_copy)
		else												-- БигСНВ
			--Ланс - Воитель (ID 1142)
			PutMonsterOnMap(12, 1142, map_copy)
			
			--Филлис - Стрелок (ID 1149)
			PutMonsterOnMap(12, 1149, map_copy)
		
			--Ами - Колдунья (ID 1153)
			PutMonsterOnMap(12, 1153, map_copy)

			--Ланс - Покоритель (ID 1143)
			PutMonsterOnMap(12, 1143, map_copy)
		end

	end

-- ПЯТАЯ ВОЛНА (25 мин)
	if Every_5_minute2 == 5 then			-- средние монстры

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then			-- МиниСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(15, 1141, map_copy)
	
			--Карциз - Мечник  (ID 1145)
			PutMonsterOnMap(15, 1145, map_copy)

			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(15, 1148, map_copy)
	
			--Ами - Целительница (ID 1152)
			PutMonsterOnMap(15, 1152, map_copy)
		else												-- БигСНВ
			--Ланс - Воитель (ID 1142)
			PutMonsterOnMap(15, 1142, map_copy)
			
			--Филлис - Стрелок (ID 1149)
			PutMonsterOnMap(15, 1149, map_copy)
		
			--Ами - Колдунья (ID 1153)
			PutMonsterOnMap(15, 1153, map_copy)

			--Ланс - Покоритель (ID 1143)
			PutMonsterOnMap(15, 1143, map_copy)
		end

	end

-- ШЕСТАЯ ВОЛНА (30 мин)
	if Every_5_minute2 == 6 then			-- сильные монстры

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then			-- МиниСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(18, 1141, map_copy)
	
			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(18, 1148, map_copy)

			--Ланс - Покоритель (ID 1143)
			PutMonsterOnMap(18, 1143, map_copy)

		else												-- БигСНВ
			--Ланс - Черный Войн (ID 1155)
			PutMonsterOnMap(12, 1155, map_copy)

			--Карциз - Черный Войн (ID 1156)
			PutMonsterOnMap(12, 1156, map_copy)
	
			--Филлис - Черный Войн (ID 1157)
			PutMonsterOnMap(12, 1157, map_copy)

			--Ами - Черный Войн (ID 1158)
			PutMonsterOnMap(12, 1158, map_copy)
		end

	end
	
-- СЕДЬМАЯ ВОЛНА (35 мин)
	if Every_5_minute2 == 7 then			-- сильные монстры

		if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then			-- МиниСНВ
			--Ланс - Охотник (ID 1141)
			PutMonsterOnMap(18, 1141, map_copy)
	
			--Филлис - Мореплаватель (ID 1148)
			PutMonsterOnMap(18, 1148, map_copy)

			--Ланс - Покоритель (ID 1143)
			PutMonsterOnMap(18, 1143, map_copy)

		else												-- БигСНВ
			--Ланс - Черный Войн (ID 1155)
			PutMonsterOnMap(12, 1154, map_copy)

			--Карциз - Черный Войн (ID 1156)
			PutMonsterOnMap(12, 1155, map_copy)
	
			--Филлис - Черный Войн (ID 1157)
			PutMonsterOnMap(12, 1156, map_copy)

			--Ами - Черный Войн (ID 1158)
			PutMonsterOnMap(12, 1157, map_copy)
		end

	end	
	if Every_5_minute2 == 8 then -- іхј¶±¦Пд
		local Monster2 = CreateChaEx(1669, 14052, 15058, 145, 60,map_copy)
		SetChaLifeTime(Monster2,897150)
end
-- ВОСЬМАЯ ВОЛНА (40 мин)
	if Every_5_minute2 == 9 then			-- боссы

		-- Если игроков меньше 10, вызывается уникальный босс
		if HowManyNoDead <= 10 then
			local boss_percent = math.random(1,100)

			if boss_percent <= 70 then									-- 70% Олень Апокалипсиса
				if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then
					local BossID = 1669 									-- МиниСНВ
				else
					local BossID = 1669									-- БигСНВ
				end
			elseif boss_percent > 70 and boss_percent <= 95 then					-- 25% Курица Судного Дня
				if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then
					local BossID = 1669									-- МиниСНВ
				else
					local BossID = 1669									-- БигСНВ
				end
			else													-- Лорд Бездны – Хардин
				GMNotice("\194 \209\237\229\230\237\238\233 \226\238\233\237\229 \237\224\241\242\243\239\232\235 \192\240\236\224\227\229\228\228\238\237! ")
					--Notice("Внимание: В Снежной войне наступил Армагеддон!")
				local BossID = 1669
				
			end

			local BOSS_CREATE  = CreateChaEx(BossID , 14500,  15000,  145, 60, map_copy)
			SetChaLifeTime(BOSS_CREATE,870150)
			Snow_BOSS = 1

		-- Иначе вызываем 4 мини-боссов и сильных монстров
		else
			if Now_Time == 5 or Now_Time == 12 or Now_Time == 21 then
				local miniBOSS_ID = 1669
			else
				local miniBOSS_ID = 1669
			end

			local Monster1  = CreateChaEx(miniBOSS_ID, 23000,  23000, 145, 60, map_copy)
			local Monster2  = CreateChaEx(miniBOSS_ID, 23000,  6000,  145, 60, map_copy)
			local Monster3  = CreateChaEx(miniBOSS_ID, 6000,   23000, 145, 60, map_copy)
			local Monster4  = CreateChaEx(miniBOSS_ID, 6000,   6000,  145, 60, map_copy)
				SetChaLifeTime(Monster1,290050)
				SetChaLifeTime(Monster2,290100)
				SetChaLifeTime(Monster3,290150)
				SetChaLifeTime(Monster4,290200)

			-- Сильные монстры

		end

	end


		end


-- Функция выполняется один раз в 5 секунд
function map_run_07xmas2( map )
end

-- Функция выполняется перед закрытием карты
function map_copy_before_close_07xmas2( map_copy )
	How_Many_Active_snv = GetMapActivePlayer(map_copy)
	if How_Many_Active_snv  > 0 then
		DealAllActivePlayerInMap(map_copy,"GiveSpecItem")
	end
	ClearAllSubMapMonster(map_copy)
	How_Many_Active_snv = 0				-- Обнуляем переменную, содержащую число активных персонажей на карте
	Every_5_minute2 = 0				-- Обнуляем переменную обозначающую каждые 5 минут			
	Snow_BOSS = 0					-- Обнуляем переменную Snow_BOSS (0 - босс не вызывался, 1 - босс вызывался)
end

-- Функция закрытия карты
function map_copy_close_07xmas2( map_copy )
	ClearAllSubMapCha(map_copy)
--	CloseMapEntry ( "07xmas2" )
--	CloseMapCopy ( "07xmas2" )
end

-- Функция выдачи денег, используется внутри функции  map_copy_before_close_07xmas2()
function GiveSpecItem( role )
	if How_Many_Active_snv == 1 then
		AddMoney ( role , 0 , 1000000 )
		return
	else
		local Money_07xmas2 = math.floor (1000000/How_Many_Active_snv)
		AddMoney ( role , 0 , Money_07xmas2 )
		return
	end
end

-- Функция возвращает 1, если карту можно открыть и 0, если нельзя
function can_open_entry_07xmas2( map ) 

end 

-- Функция возвращает координаты X и Y монстра из массива
function GetMonsterPosition(pos)
    	x_start = pos[1]*100
	y_start = pos[2]*100
    	x_end = pos[3]*100
	y_end = pos[4]*100

	x = math.random (x_start, x_end)
	y = math.random (y_start, y_end)
    return x,y 
end

-- Функция расстанавливает монстров на карте
function PutMonsterOnMap(count, monsterID, map_copy)
	-- Массив с координатами точек появления сундуков и монстров
	local position = {}
		position[1]={19,  25,  108,  101} 
		position[2]={112, 57,  173,  68} 
		position[3]={181, 31,  264,  101} 
		position[4]={254, 109, 266,  189} 
		position[5]={180, 198, 265,  268} 
		position[6]={115, 239, 177,  263} 
		position[7]={24,  197, 103,  265} 
		position[8]={22,  105, 32,   185}
		position[9]={140, 75,  149,  124}  

		for i = 1 , count , 1 do 
			local temp = math.random(1,9)
			local angle = math.random(1,360)
			local x, y = GetMonsterPosition(position[temp])
			local Monster = CreateChaEx(monsterID, x,  y, angle , 60, map_copy)
	            SetChaLifeTime(Monster , 298050)
		end
end