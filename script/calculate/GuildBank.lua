--------------------------------------------------------------------------------
-- Скрипт системы банка гильдии
-- V3ct0r from WWW.PkoDEV.NET
-- 24.02.2017
--
-- Требуется GameServer.exe с функциями:
-- 1. HandleChat() - Обработчик сообщений местного чата
-- 2. GetItemNumber() - Получить количество предметов в ячейке инвентаря
-- 3. GetItemStackSize() - Получить размер стека предмета
-- 4. GetItemThrowable() - Можно ли выбросить предмет
-- 5. GetItemTransmissible() - Можно ли передать предмет
-- 6. GetItemDestroyable() - Можно ли удалить предмет
--
-- Установка:
-- Подключить данный файл в SkillEffect.lua
-- dofile(GetResPath("script\\calculate\\GuildBank.lua"))
--
-- Команды чата:
-- [3] /ЧтоВбанке
-- [3] /ЧтоВячейке <номер ячейки банка гильдии>
-- [2] /ПоложитьВбанк <ячейка персонажа>, <ячейка банка>, <количество>
-- [1] /ВзятьИзБанка <ячейка банка>, <количество>
-- [Л] /ДатьДоступ <имя персонажа>, <уровень>
-- [Л] /ЗабратьДоступ <имя персонажа>
-- [Л] /УровеньДоступа <имя персонажа>
-- [3] /ПомощьБанк
--
-- Уровни доступа к банку гильдии:
-- 1 Уровень - может брать и класть;
-- 2 Уровень - может только класть;
-- 3 Уровень - может только смотреть.
--------------------------------------------------------------------------------
print "Loading Guild Bank System...";


-- Размер банка (ячейки)
MAX_BANK_SIZE = 60

-- Разрешенные области для банка гильдии
guild_bank_map = {

	--[[
		["карта"] = {
						[1] = {x0, y0, x1, y1},
						...
						[n] = {x0, y0, x1, y1},
					}
	]]--
	
	["magicsea"] = {
					[1] = {1, 1, 4040, 4060},
					[2] = {16, 16, 32, 32}
				},	
				
	["07xmas"] = {
					[1] = {39, 42, 49, 49},
					[2] = {16, 16, 32, 32}
				},
				
	["07xmas"] = {
					[1] = {37, 41, 45, 51},
					[2] = {16, 16, 32, 32}
				},

	["darkblue"] = {
					[1] = {1, 1, 8, 8},
					[2] = {16, 16, 32, 32}
				}
}

-- Поля массива предмета
ITEM_POS       = 1
ITEM_ID        = 2
ITEM_NUMBER    = 3
ITEM_STR       = 4
ITEM_CON       = 5
ITEM_DEX       = 6
ITEM_AGI       = 7
ITEM_STA       = 8
ITEM_URE       = 9
ITEM_MAXURE    = 10
ITEM_ENEGRY    = 11
ITEM_MAXENERGY = 12
ITEM_FORGE0    = 13
ITEM_FORGE1    = 14

-- Описание уровней доступа
guild_bank_access_desc = {
	
	[1] = "\204\238\230\229\242 \225\240\224\242\252 \232 \234\235\224\241\242\252 \226\229\249\232 \232\231/\226 \225\224\237\234 \227\232\235\252\228\232\232",
	[2] = "\204\238\230\229\242\252 \242\238\235\252\234\238 \234\235\224\241\242\252 \226\229\249\232 \226 \225\224\237\234 \227\232\235\252\228\232\232",
	[3] = "\204\238\230\229\242 \242\238\235\252\234\238 \239\240\238\241\236\224\242\240\232\226\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232",

	--[[
		[1] = "Может брать и класть вещи из/в банк гильдии.",
		[2] = "Можеть только класть вещи в банк гильдии.",
		[3] = "Может только просматривать банк гильдии.",
	]]--

}

-- Функции обработки команд чата
chat_guild_bank_cmd = {}

-- Список предметов в банке
-- /ЧтоВбанке
function Cmd_ShowBank(role, bank, param)

	-- Печатаем в систему игрока список предметов в банке
	ShowBank(role, bank)

end

-- Какой предмет лежит в ячейке
-- /ЧтоВячейке [ячейка банка]
function Cmd_ShowCell(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\215\242\238\194\255\247\229\233\234\229 <\255\247\229\233\234\224 \226 \225\224\237\234\229>")
		--SystemNotice(role, "Синтаксис: /ЧтоВячейке <ячейка в банке>")
		return
	end

	-- Проверяем тип параметров
	local pos = 0
	if (type(tonumber(param[1])) == "number") then
		pos = tonumber(param[1])
	else
		SystemNotice(role, "\205\238\236\229\240 \255\247\229\233\234\232 \226 \225\224\237\234\229 \228\238\235\230\229\237 \225\251\242\252 \247\232\241\235\238\226\251\236 \231\237\224\247\229\237\232\229\236!")
		--SystemNotice(role, "Номер ячейки в банке должен быть числовым значением!")
		return
	end

	-- Печатаем в систему игрока содержимое ячейки pos
	ShowCell(role, bank, pos)

end

-- Положить предмет в банк
-- /ПоложитьВбанк [ячейка инвентаря], [ячейка банка], [количество]
function Cmd_PushItem(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 3) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\226\224\248\224 \255\247\229\233\234\224>, <\255\247\229\233\234\224 \226 \225\224\237\234\229>, <\234\238\235\232\247\229\241\242\226\238>")
		--SystemNotice(role, "Синтаксис: /ПоложитьВбанк <ваша ячейка>, <ячейка в банке>, <количество>")
		return
	end

	-- Проверяем тип параметров
	local role_pos, bank_pos, number = 0, 0,0
	if (type(tonumber(param[1])) == "number" 
			and type(tonumber(param[2])) == "number"
			and type(tonumber(param[3])) == "number") then
		role_pos = tonumber(param[1])
		bank_pos = tonumber(param[2])
		number = tonumber(param[3])
	else
		SystemNotice(role, "\205\238\236\229\240\224 \255\247\229\229\234 \232 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\224 \228\238\235\230\237\251 \225\251\242\252 \247\232\241\235\238\226\251\236\232 \231\237\224\247\229\237\232\255\236\232!")
		--SystemNotice(role, "Номера ячеек и количество предмета должны быть числовыми значениями!")
		return
	end

	-- Кладем предмет в банк
	PushItem(role, bank, role_pos, bank_pos, number)

end

-- Взять предмет из банка
-- /ВзятьИзБанка [ячейка], [количество]
function Cmd_PopItem(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 2) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \226 \225\224\237\234\229>, <\234\238\235\232\247\229\241\242\226\238>")
		--SystemNotice(role, "Синтаксис: /ВзятьИзБанка <ячейка в банке>, <количество>")
		return
	end

	-- Проверяем тип параметров
	local pos, number = 0, 0
	if (type(tonumber(param[1])) == "number" 
			and type(tonumber(param[2])) == "number") then
		pos = tonumber(param[1])
		number = tonumber(param[2])
	else
		SystemNotice(role, "\205\238\236\229\240 \255\247\229\233\234\232 \232 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\224 \228\238\235\230\237\251 \225\251\242\252 \247\232\241\235\238\226\251\236\232 \231\237\224\247\229\237\232\255\236\232!")
		--SystemNotice(role, "Номер ячейки и количество предмета должны быть числовыми значениями!")
		return
	end

	-- Берем предмет из банка
	PopItem(role, bank, pos, number)

end

-- Выдать доступ к банку гильдии
-- /ДатьДоступ [имя персонажа], [уровень]
function Cmd_GiveAccess(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 2) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252 \228\238\241\242\243\239\224>")
		--SystemNotice(role, "Синтаксис: /ДатьДоступ <имя персонажа>, <уровень доступа>")
		return
	end

	-- Проверяем тип параметров
	local cha_name, level = "", 0
	if (type(tostring(param[1])) == "string" and 
			type(tonumber(param[2])) == "number") then
		cha_name = tostring(param[1])
		level = tonumber(param[2])
	else
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233, \224 \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 - \247\232\241\235\238\236 \238\242 1 \228\238 3!")
		--SystemNotice(role, "Имя персонажа должно быть строкой, а уровень доступа - числом от 1 до 3!")
		return
	end

	-- Выдаем права доступа к банку гильдии
	GiveAccess(role, level, bank, cha_name)

end

-- Забрать доступ к банку гильдии
-- /ЗабратьДоступ [имя персонажа]
function Cmd_TakeAccess(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
		--SystemNotice(role, "Синтаксис: /ЗабратьДоступ <имя персонажа>")
		return
	end

	-- Проверяем тип параметров
	if (type(tostring(param[1])) ~= "string") then
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233!")
		--SystemNotice(role, "Имя персонажа должно быть строкой!")
		return
	end

	-- Забираем доступ к банку гильдии
	local cha_name = tostring(param[1])
	TakeAccess(role, bank, cha_name)

end

-- Просмотреть уровень доступа персонажа
-- /УровеньДоступа [имя персонажа]
function Cmd_ShowAccess(role, bank, param)

	-- Проверяем количество параметров
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
		--SystemNotice(role, "Синтаксис: /УровеньДоступа <имя персонажа>")
		return
	end

	-- Проверяем тип параметров
	if (type(tostring(param[1])) ~= "string") then
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233!")
		--SystemNotice(role, "Имя персонажа должно быть строкой!")
		return
	end

	-- Отображаем уровень доступа
	local cha_name = tostring(param[1])
	ShowAccess(role, bank, cha_name)

end

-- Отобразить список команд
-- /ПомощьБанк
function Cmd_Help(role, bank, param)

	SystemNotice(role, "\202\238\236\224\237\228\251 \228\235\255 \240\224\225\238\242\251 \241 \225\224\237\234\238\236:")
	SystemNotice(role, "[3] /\215\242\238\194\225\224\237\234\229")
	SystemNotice(role, "[3] /\215\242\238\194\255\247\229\233\234\229 <\237\238\236\229\240 \255\247\229\233\234\232 \225\224\237\234\224 \227\232\235\252\228\232\232>")
	SystemNotice(role, "[2] /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\255\247\229\233\234\224 \239\229\240\241\238\237\224\230\224>, <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
	SystemNotice(role, "[1] /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
	SystemNotice(role, "[\203] /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252>")
	SystemNotice(role, "[\203] /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
	SystemNotice(role, "[\203] /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
	SystemNotice(role, "[3] /\207\238\236\238\249\252\193\224\237\234")

end

-- Функция обработки местного чата
function GuildHandleChat(role, message)

	-- Система обработки команд чата
	if (string.find(message, "/") == 1) then

	    -- Удаляем черту из строки команды
	    local cmd = string.lower(string.sub(message, 2))
	    
	    if (cmd == "") then
	    	SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\236\224\237\228\243 \239\238\241\235\229 \247\229\240\242\251: /<\234\238\236\224\237\228\224> <\239\224\240\224\236\229\242\240\251>")
	        --SystemNotice(role, "Введите команду после черты: /<команда> <параметры>")
	        return 0
	    end
	   
	    -- Парсим параметры (код принадлежит Insider'у)
	    local param = {n = 0}
	   
	    cmd = explode(" ", cmd)

	    if cmd[2] ~= nil then
	        param = explode(",", cmd[2])
	        param.n = table.getn(param)
	    end
	       
	    cmd = cmd[1]

	    -- Вызываем обработчик команды
		
	    if (chat_guild_bank_cmd[cmd] ~= nil) then
		
			-- Проверяем что персонаж не в лотке
			if (GetChaStateLv(role, 99) > 0) then
				SystemNotice(role, "\194\251 \237\229 \236\238\230\229\242\229 \232\241\239\238\235\252\231\238\226\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232 \237\224\245\238\228\255\241\252 \226 \242\238\240\227\238\226\238\236 \235\238\242\234\229!")
				--SystemNotice(role, "Вы не можете использовать банк гильдии находясь в торговом лотке!")
				return 0
			end
	    	-- Проверяем что у игрока есть гильдия
	    	if (HasGuild(role) == 0) then
	    		SystemNotice(role, "\196\235\255 \232\241\239\238\235\252\231\238\226\224\237\232\255 \234\238\236\224\237\228\251 /" .. cmd .. " \194\251 \228\238\235\230\237\251 \225\251\242\252 \226 \227\232\235\252\228\232\232!")
	    		--SystemNotice(role, "Для использования команды /" .. cmd .. " Вы должны быть в гильдии!")
	    		return 0
	    	end

	    	-- Получаем банк персонажа
	    	local bank = LoadGuildBank(role)

	    	-- Проверяем что у гильдии есть банк
	    	if (bank.activated == 0) then
	    		SystemNotice(role, "\211 \194\224\248\229\233 \227\232\235\252\228\232\232 \239\238\234\224 \237\229\242 \225\224\237\234\224...")
	    		--SystemNotice(role, "У Вашей гильдии пока нет банка...")
	    		return 0
	    	end

	    	-- Проверяем, что персонаж находится в разрешенной области
	    	if (IsInBankArea(role) == 0) then
	    		SystemNotice(role, "\194 \253\242\238\233 \236\229\241\242\237\238\241\242\232 \237\229\228\238\241\242\243\239\229\237 \225\224\237\234 \227\232\235\252\228\232\232!")
	    		--SystemNotice(role, "В этой местности недоступен банк гильдии!")
	    		return 0
	    	end
			

	    	-- Проверяем уровень доступа
	    	if (GetRoleID(role) ~= bank.leader_id) then
		    	if (chat_guild_bank_cmd[cmd].access == 0) then
		    		-- Игрок должен быть лидером гильдии
		    		SystemNotice(role, "\196\224\237\237\243\254 \234\238\236\224\237\228\243 \236\238\230\229\242 \226\251\239\238\235\237\232\242\252 \242\238\235\252\234\238 \235\232\228\229\240 \227\232\235\252\228\232\232.")
		    		--SystemNotice(role, "Данную команду может выполнить только лидер гильдии.")
		    		return
		    	else
		    		-- У игрока должен быть уровень доступа
		    		local cha_access = GetAccess(bank, GetChaDefaultName(role))
		    		if (cha_access > chat_guild_bank_cmd[cmd].access or cha_access == 0) then
		    			SystemNotice(role, "\211 \194\224\241 \237\229\228\238\241\242\224\242\238\247\237\238 \239\240\224\226 \228\238\241\242\243\239\224 \228\235\255 \226\251\239\238\235\237\229\237\232\255 \228\224\237\237\238\233 \234\238\236\224\237\228\251.")
		    			--SystemNotice(role, "У Вас недостаточно прав доступа для выполнения данной команды.")
		    			return
		    		end
		    	end
	    	end

	    	-- Вызываем обработчик команды чата
	        chat_guild_bank_cmd[cmd].func(role, bank, param)

	        return 0

	    end

	end
	
	return HandleChat_original(role, message)

end

-- Функция выполняется после создания гильдии
function AfterGuildCreate(role, guild_type)

	-- Создаем новый банк для гильдии
	local guild_id = GetChaGuildID(role)
	local cha_id = GetRoleID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "w+")
	if (file == nil) then
		SystemNotice(role, "\205\229 \243\228\224\235\238\241\252 \241\238\231\228\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232 (ID: " .. guild_id ..")! \206\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243!")
		--SystemNotice(role, "Не удалось создать банк гильдии (ID: " .. guild_id ..")! Обратитесь к администратору!")
	else
		-- Записываем ID главы гильдии
		file:write(cha_id .. ";0;0;;;;0;")
		file:close()

		--[[
			SystemNotice(role, "\211 \194\224\248\229\233 \227\232\235\252\228\232\232 \229\241\242\252 \225\224\237\234.")
			SystemNotice(role, "\202\238\236\224\237\228\251 \228\235\255 \240\224\225\238\242\251 \241 \225\224\237\234\238\236:")
			SystemNotice(role, "[3] /\215\242\238\194\225\224\237\234\229")
			SystemNotice(role, "[3] /\215\242\238\194\255\247\229\233\234\229 <\237\238\236\229\240 \255\247\229\233\234\232 \225\224\237\234\224 \227\232\235\252\228\232\232>")
			SystemNotice(role, "[2] /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\255\247\229\233\234\224 \239\229\240\241\238\237\224\230\224>, <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
			SystemNotice(role, "[1] /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
			SystemNotice(role, "[\203] /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252>")
			SystemNotice(role, "[\203] /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
			SystemNotice(role, "[\203] /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
			SystemNotice(role, "[3] /\207\238\236\238\249\252\193\224\237\234")
		]]--

		--[[
			SystemNotice(role, "У Вашей гильдии есть банк.")
			SystemNotice(role, "Команды для работы с банком:")
			SystemNotice(role, "[3] /ЧтоВбанке")
			SystemNotice(role, "[3] /ЧтоВячейке <номер ячейки банка гильдии>")
			SystemNotice(role, "[2] /ПоложитьВбанк <ячейка персонажа>, <ячейка банка>, <количество>")
			SystemNotice(role, "[1] /ВзятьИзБанка <ячейка банка>, <количество>")
			SystemNotice(role, "[Л] /ДатьДоступ <имя персонажа>, <уровень>")
			SystemNotice(role, "[Л] /ЗабратьДоступ <имя персонажа>")
			SystemNotice(role, "[Л] /УровеньДоступа <имя персонажа>")
			SystemNotice(role, "[3] /ПомощьБанк")
		]]--
	end

	-- Забираем предметы и золото, необходимые
	-- для создания гильдии
	DeductGuildItem_original(role, guild_type)

end

-- Загрузить банк гильдии из строки
function String2Bank(raw_bank)

	-- Наш банк
	local bank = {}

	-- Парсим строку
	local bank_table = explode(";", raw_bank)

	-- Заполняем банк
	-- ID лидера
	bank.leader_id = tonumber(bank_table[1])

	-- Активирован ли банк
	bank.activated = tonumber(bank_table[2])

	-- Размер банка
	bank.size = tonumber(bank_table[3])

	-- Уровни доступа
		bank.access = {
			[1] = explode(",", bank_table[4]),
			[2] = explode(",", bank_table[5]),
			[3] = explode(",", bank_table[6]),
		}

	-- Количество предметов
	local n = tonumber(bank_table[7])

	-- Предметы в банке
	bank.items = {}
	for i = 1, n, 1 do
		local temp_item = explode(",", bank_table[7 + i])

		bank.items[i] = {}
		bank.items[i][ITEM_POS]       = tonumber(temp_item[1])
		bank.items[i][ITEM_ID]        = tonumber(temp_item[2])
		bank.items[i][ITEM_NUMBER]    = tonumber(temp_item[3])
		bank.items[i][ITEM_STR]       = tonumber(temp_item[4])
		bank.items[i][ITEM_CON]       = tonumber(temp_item[5])
		bank.items[i][ITEM_DEX]       = tonumber(temp_item[6])
		bank.items[i][ITEM_AGI]       = tonumber(temp_item[7])
		bank.items[i][ITEM_STA]       = tonumber(temp_item[8])
		bank.items[i][ITEM_URE]       = tonumber(temp_item[9])
		bank.items[i][ITEM_MAXURE]    = tonumber(temp_item[10])
		bank.items[i][ITEM_ENEGRY]    = tonumber(temp_item[11])
		bank.items[i][ITEM_MAXENERGY] = tonumber(temp_item[12])
		bank.items[i][ITEM_FORGE0]    = tonumber(temp_item[13])
		bank.items[i][ITEM_FORGE1]    = tonumber(temp_item[14])
	end

	return bank

end

-- Преобразовать банк в строку
function Bank2String(bank)

	-- Пишем ID лидера гильдии
	local raw_bank = bank.leader_id .. ";"

	-- Пишем активирован ли банк
	raw_bank = raw_bank .. bank.activated .. ";"

	-- Пишем размер банка
	raw_bank = raw_bank .. bank.size .. ";" 

	-- Пишем список доступа к банку гильдии
	for i = 1, table.getn(bank.access), 1 do
		raw_bank = raw_bank .. implode(",", bank.access[i]) .. ";"
	end

	-- Пишем количество предметов
	local n = table.getn(bank.items)
	raw_bank = raw_bank .. n .. ";"

	-- Пишем предметы, которые лежат в банке
	for i = 1, n, 1 do
		raw_bank = raw_bank .. implode(",", bank.items[i])
		if (i < n) then
			raw_bank = raw_bank .. ";"
		end
	end

	return raw_bank

end

-- Распечатать список предметов в банке
function ShowBank(role, bank)

	-- Проверяем что количество ячеек в банке больше 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "В банке Вашей гильдии нет ячеек. Пожалуйста, приобретите ячейки.")
		return
	end

	-- Количество занятых ячеек в банке гильдии
	local n = table.getn(bank.items)

	-- Говорим игроку сколько ячеек занято
	if (n > 0) then 
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \231\224\237\255\242\238 " .. n .. " \255\247\229\229\234 \232\231 " .. bank.size .. ":")
		--SystemNotice(role, "В банке Вашей гильдии занято " .. n .. " ячеек из " .. bank.size .. ":")
		--SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \231\224\237\255\242\238 " .. n .. " \255\247\229\229\234 \232\231 " .. MAX_BANK_SIZE .. ":")
		--SystemNotice(role, "В банке Вашей гильдии занято " .. n .. " ячеек из " .. MAX_BANK_SIZE .. ":")

		-- Массив с ячейками
		local items = {}

		-- Формируем массив предметов
		for i = 1, n, 1 do
			items[i] = {}
			items[i].pos = bank.items[i][ITEM_POS]
			items[i].name = GetItemName(bank.items[i][ITEM_ID])
			items[i].number = bank.items[i][ITEM_NUMBER]
		end

		-- Сортируем массив по ячейкам
		table.sort(items,   function(a, b)
								if (a.pos > b.pos) then
									return false
								end

								return true
							end
				)

		-- Печатаем отрсортированный массив
		for i = 1, n, 1 do
			SystemNotice(role, "[" .. items[i].pos .. "] " .. items[i].name .. " x " .. items[i].number)
		end
	else
		-- В банке пусто ...
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \239\243\241\242\238...")
		--SystemNotice(role, "В банке Вашей гильдии пусто...")
	end

end

-- Отобразть содержимое ячейки банка
function ShowCell(role, bank, pos)

	-- Проверяем что количество ячеек в банке больше 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "В банке Вашей гильдии нет ячеек. Пожалуйста, приобретите ячейки.")
		return
	end

	-- Проверяем что игрок ввел корректный номер ячейки банка
	--if ((pos > MAX_BANK_SIZE) or (pos < 1)) then
	if ((pos > bank.size) or (pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- Ищем ячейку pos
	for i = 1, table.getn(bank.items), 1 do
		if (bank.items[i][ITEM_POS] == pos) then
			SystemNotice(role, "[" .. pos .. "] " .. GetItemName(bank.items[i][ITEM_ID]) .. " x " .. bank.items[i][ITEM_NUMBER])
			return
		end
	end

	-- В ячейке пусто
	SystemNotice(role, "[" .. pos .. "] \207\243\241\242\238")
	--SystemNotice(role, "[" .. pos .. "] Пусто")

end

-- Положить предмет в банк
function PushItem(role, bank, role_pos, bank_pos, number)

	-- Проверяем что игрок ввел корректный номер ячейки инвентаря
	local kbsize = GetKbCap(role)
	if ((role_pos < 1) or(role_pos > kbsize)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232 \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255: \238\242 1 \228\238 " .. kbsize .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки Вашего инвентаря: от 1 до " .. kbsize .. "!")
		return
	end

	-- Проверяем что количество ячеек в банке больше 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "В банке Вашей гильдии нет ячеек. Пожалуйста, приобретите ячейки.")
		return
	end

	-- Проверяем что игрок ввел корректный номер ячейки банка
	--if ((bank_pos > MAX_BANK_SIZE) or (bank_pos < 1)) then
	if ((bank_pos > bank.size) or (bank_pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- Проверяем что игрок ввел корретное число предметов
	if ((number < 1) or (number > 99)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\238\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226: \238\242 1 \228\238 99!")
		--SystemNotice(role, "Введите корректное число предметов: от 1 до 99!")
		return
	end

	-- Проверяем, что инвентарь игрока не заблокирован
	if (KitbagLock(role, 0) ~= 1) then
		SystemNotice(role, "\194\224\248 \232\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237!")
		--SystemNotice(role, "Ваш инвентарь заблокирован!")
		return
	end

	-- Получаем предмет из инвентаря персонажа
	local Item = GetChaItem(role, 2, role_pos - 1)
	if (Item == 0 or Item == nil) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. role_pos .. "] \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255 \239\243\241\242\238!")
		--SystemNotice(role, "В ячейке [" .. role_pos .. "] Вашего инвентаря пусто!")
		return
	end
Notice("2222")
	-- Проверяем, что предмет можно передать
	local item_id = GetItemID(Item)
	if (GetItemTransmissible(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Данный предмет нельзя положить в банк гильдии!")
		return
	end
	
	-- Проверяем, что это не корабль.
	if item_id == 3988 or item_id == 3849 then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		return
	end
	
	Notice("1")
	
	-- Проверяем, что предмет можно удалить
	if (GetItemDestroyable(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Данный предмет нельзя положить в банк гильдии!")
		return
	end
Notice("2")
	-- Проверяем, что предмет можно выбросить
	if (GetItemThrowable(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Данный предмет нельзя положить в банк гильдии!")
		return
	end
Notice("3")
	-- Проверяем что игрок ввел количество не больше размера стека
	local stack_size = GetItemStackSize(item_id)
	if (number > stack_size) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226, \237\229 \239\240\229\226\251\248\224\254\249\229\229 \240\224\231\236\229\240 \241\242\229\234\224. \196\235\255 " .. GetItemName(item_id) .. " \236\224\234\241\232\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \226 \255\247\229\233\234\229: " .. stack_size .. ".")
		--SystemNotice(role, "Введите число предметов, не превышающее размер стека. Для " .. GetItemName(item_id) .. " максимальное количество в ячейке: " .. stack_size .. ".")
		return
	end
Notice("4")
	-- Проверяем что у персонажа есть достаточное количество предметов
	local item_number = GetItemNumber(Item)
	if (item_number < number) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. role_pos .. "] \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255 \237\229\228\238\241\242\224\242\238\247\237\238 \239\240\229\228\236\229\242\238\226 (\211 \194\224\241 " .. item_number .. ", \194\251 \245\238\242\232\242\229 \239\238\235\238\230\232\242\252 " .. number ..").")
		--SystemNotice(role, "В ячейке [" .. role_pos .. "] Вашего инвентаря недостаточно предметов (У Вас " .. item_number .. ", Вы хотите положить " .. number ..").")
		return
	end
Notice("5")
	-- Проверяем предметы в ячейке
	local item_pos = -1
	for i = 1, table.getn(bank.items), 1 do
		local bank_item = bank.items[i]
		if (bank_item[ITEM_POS] == bank_pos) then
			if (item_id == bank_item[ITEM_ID]) then	
				-- Проверяем что ячейка не заполнена
				if (stack_size < (bank_item[ITEM_NUMBER] + number)) then
					SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. bank_pos .. "] \225\224\237\234\224 \227\232\235\252\228\232\232 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224!")
					--SystemNotice(role, "В ячейке [" .. bank_pos .. "] банка гильдии недостаточно места!")
					
					local d = stack_size - bank_item[ITEM_NUMBER]
					if (d > 0) then
						SystemNotice(role, "\194\251 \236\238\230\229\242\229 \239\238\235\238\230\232\242\252 " .. d .. " \239\240\229\228\236\229\242(\224/\238\226).")
						--SystemNotice(role, "Вы можете положить " .. d .. " предмет(а/ов).")
					end

					return
				end

				item_pos = i
			else
				SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. bank_pos .. "] \243\230\229 \235\229\230\232\242 \239\240\229\228\236\229\242 " .. GetItemName(bank_item[ITEM_ID]) .. " x " .. bank_item[ITEM_NUMBER] .. "! \194\251 \236\238\230\229\242\229 \239\238\235\238\230\232\242\252 \241\254\228\224 \242\238\235\252\234\238 \239\240\229\228\236\229\242\251 \228\224\237\237\238\227\238 \242\232\239\224.")
				--SystemNotice(role, "В ячейке [" .. bank_pos .. "] уже лежит предмет " .. GetItemName(bank_item[ITEM_ID]) .. " x " .. bank_item[ITEM_NUMBER] .. "! Вы можете положить сюда только предметы данного типа.")
				return
			end

			break
		end
	end
Notice("6")
	-- Кладем предмет в банк
	if (item_pos == -1) then
		-- Создаем новый предмет в банке
		local item_add = {}

		-- Получаем характеристики предмета
		local item_id = GetItemID(Item)
		local item_str = GetItemAttr(Item, ITEMATTR_VAL_STR)
		local item_con = GetItemAttr(Item, ITEMATTR_VAL_CON)
		local item_agi = GetItemAttr(Item, ITEMATTR_VAL_AGI)
		local item_dex = GetItemAttr(Item, ITEMATTR_VAL_DEX)
		local item_sta = GetItemAttr(Item, ITEMATTR_VAL_STA)
		local item_ure = GetItemAttr(Item, ITEMATTR_URE)
		local item_maxure = GetItemAttr(Item, ITEMATTR_MAXURE)
		local item_forge0 = GetItemForgeParam(Item, 0)
		local item_forge1 = GetItemForgeParam(Item, 1)
		local item_energy =  GetItemAttr(Item, ITEMATTR_ENERGY) 
		local item_maxenergy = GetItemAttr(Item, ITEMATTR_MAXENERGY) 

		--[[
			SystemNotice(role, "Item ID = "   .. item_id)
			SystemNotice(role, "str = "       .. str)
			SystemNotice(role, "con = "       .. con)
			SystemNotice(role, "agi = "       .. agi)
			SystemNotice(role, "dex = "       .. dex)
			SystemNotice(role, "sta = "       .. sta)
			SystemNotice(role, "ure = "       .. ure)
			SystemNotice(role, "maxure = "    .. maxure)
			SystemNotice(role, "energy = "    .. energy)
			SystemNotice(role, "maxenergy = " .. maxenergy)
			SystemNotice(role, "forge0 = "    .. forge0)
			SystemNotice(role, "forge1 = "    .. forge1)
		]]--

		-- Копируем характеристики предмета в банк
		item_add[ITEM_POS]       = bank_pos
		item_add[ITEM_ID]        = item_id
		item_add[ITEM_NUMBER]    = number
		item_add[ITEM_STR]       = item_str
		item_add[ITEM_CON]       = item_con
		item_add[ITEM_DEX]       = item_dex
		item_add[ITEM_AGI]       = item_agi
		item_add[ITEM_STA]       = item_sta
		item_add[ITEM_URE]       = item_ure
		item_add[ITEM_MAXURE]    = item_maxure
		item_add[ITEM_ENEGRY]    = item_energy
		item_add[ITEM_MAXENERGY] = item_maxenergy
		item_add[ITEM_FORGE0]    = item_forge0
		item_add[ITEM_FORGE1]    = item_forge1
		
		r1 = TakeItem(role, 0, item_id, number) 
		if r1 == 0 then
			SystemNotice(role, "Предмет не удалось положить в банк.")
			return
		end
		
		-- Кладем предмет в банк
		table.insert(bank.items, item_add)
	else
		r1 = TakeItem(role, 0, item_id, number) 
		if r1 == 0 then
			SystemNotice(role, "Предмет не удалось положить в банк.")
			return
		end
		bank.items[item_pos][ITEM_NUMBER] = bank.items[item_pos][ITEM_NUMBER] + number
	end
	-- Забираем предмет у персонажа
	-- DelBagItem2(role, Item, number)

	-- Обновляем банк
	UpdateBank(role, bank)

	-- Сообщение игроку
	if (item_pos == -1) then
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \239\238\235\238\230\232\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \226 \255\247\229\233\234\243 [" .. bank_pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Вы успешно положили (" .. GetItemName(item_id) ..") x " .. number .. " в ячейку [" .. bank_pos .. "] банка Вашей гильдии!")
	else
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \228\238\225\224\226\232\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \226 \255\247\229\233\234\243 [" .. bank_pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \210\229\239\229\240\252 \242\224\236 " .. bank.items[item_pos][ITEM_NUMBER] .. " \239\240\229\228\236\229\242\238\226.")
		--SystemNotice(role, "Вы успешно добавили (" .. GetItemName(item_id) ..") x " .. number .. " в ячейку [" .. bank_pos .. "] банка Вашей гильдии! Теперь там " .. bank.items[item_pos][ITEM_NUMBER] .. " предметов.")
	end

end

-- Получить предмет из банка
function PopItem(role, bank, pos, number)

	-- Проверяем что количество ячеек в банке больше 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "В банке Вашей гильдии нет ячеек. Пожалуйста, приобретите ячейки.")
		return
	end

	-- Проверяем ячейку
	if ((pos > bank.size) or (pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "Введите корректный номер ячейки: от 1 до " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- Проверяем, что игрок ввел корретное число предметов
	if ((number < 1) or (number > 99)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\238\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226: \238\242 1 \228\238 99!")
		--SystemNotice(role, "Введите корректное число предметов: от 1 до 99!")
		return
	end

	-- Проверяем, что инвентарь игрока не заблокирован
	if (KitbagLock(role, 0) ~= 1) then
		SystemNotice(role, "\194\224\248 \232\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237!")
		--SystemNotice(role, "Ваш инвентарь заблокирован!")
		return
	end

	-- Получаем предмет из ячейки
	local item, p = nil, 0
	for i = 1, table.getn(bank.items), 1 do
		if (pos == bank.items[i][ITEM_POS]) then
			item = bank.items[i]
			p = i
			break
		end
	end

	-- Проверяем, что в ячейке есть предмет
	if (item == nil) then
		SystemNotice(role, "\223\247\229\233\234\224 [" .. pos .. "] \239\243\241\242\224\255!")
		--SystemNotice(role, "Ячейка [" .. pos .. "] пустая!")
		return
	end

	-- Проверяем, что в ячейке достаточное количество предметов
	local item_id = item[ITEM_ID]
	local n = item[ITEM_NUMBER]
	if (n < number) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. pos .. "] \229\241\242\252 \242\238\235\252\234\238 " .. n .. " x " .. GetItemName(item_id) .. "!")
		--SystemNotice(role, "В ячейке [" .. pos .. "] есть только " .. n .. " x " .. GetItemName(item_id) .. "!")
		return
	end

	-- Проверяем, что у игрока есть место в инвентаре
	if (GetChaFreeBagGridNum(role) == 0) then
		SystemNotice(role, "\194 \226\224\248\229\236 \232\237\226\229\237\242\224\240\229 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224!")
		--SystemNotice(role, "В вашем инвентаре недостаточно места!")
		return
	end

	-- Удаляем предметы из ячейки
	if (n == number) then	
		-- Игрок забрал все предметы из ячейки
		table.remove(bank.items, p)
	else
		-- Игрок забрал не все предметы из ячейки
		bank.items[p][ITEM_NUMBER] = n - number
	end

	-- Обновляем банк
	UpdateBank(role, bank)

	-- Выдаем предмет игроку
	local r1, r2 = MakeItem(role, item_id, number, 4)
	local MadeItem = GetChaItem(role, 2, r2)

	-- Устанавливаем характеристики предмета
	SetItemAttr(MadeItem, ITEMATTR_VAL_STR, item[ITEM_STR])
	SetItemAttr(MadeItem, ITEMATTR_VAL_CON, item[ITEM_CON])
	SetItemAttr(MadeItem, ITEMATTR_VAL_AGI, item[ITEM_AGI])
	SetItemAttr(MadeItem, ITEMATTR_VAL_DEX, item[ITEM_DEX])
	SetItemAttr(MadeItem, ITEMATTR_VAL_STA, item[ITEM_STA])
	SetItemAttr(MadeItem, ITEMATTR_URE, item[ITEM_URE])
	SetItemAttr(MadeItem, ITEMATTR_MAXURE, item[ITEM_MAXURE])
	SetItemAttr(MadeItem, ITEMATTR_ENERGY, item[ITEM_ENEGRY])
	SetItemAttr(MadeItem, ITEMATTR_MAXENERGY, item[ITEM_MAXENERGY])
	SetItemForgeParam(MadeItem, 0, item[ITEM_FORGE0])
	SetItemForgeParam(MadeItem, 1, item[ITEM_FORGE1])

	-- Обновляем инвентарь персонажа
	SynChaKitbag(role, 13)

	-- Сообщение игроку
	if (n == number) then	
		-- В ячейке не осталось предметов
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \231\224\225\240\224\235\232 \226\241\229 (" .. GetItemName(item_id) ..") x " .. number .. " \232\231 \255\247\229\233\234\232 [" .. pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \223\247\229\233\234\224 \242\229\239\229\240\252 \239\243\241\242\224\255.")
		--SystemNotice(role, "Вы успешно забрали все (" .. GetItemName(item_id) ..") x " .. number .. " из ячейки [" .. pos .. "] банка Вашей гильдии! Ячейка теперь пустая.")
	else
		-- В ячейке еще остались предметы
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \226\231\255\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \232\231 \255\247\229\233\234\232 [" .. pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \206\241\242\224\235\238\241\252 " .. (n - number) .. ".")
		--SystemNotice(role, "Вы успешно взяли (" .. GetItemName(item_id) ..") x " .. number .. " из ячейки [" .. pos .. "] банка Вашей гильдии! Осталось " .. (n - number) .. ".")
	end

end

-- Выдать игроку права доступа к банку гильдии
function GiveAccess(role, level, bank, cha_name)
	cha_name = string.lower(cha_name)

	-- Проверяем, что игрок глава гильдии
	local role_id = GetRoleID(role)
	if(role_id ~= bank.leader_id) then
		SystemNotice(role, "\196\224\237\237\238\229 \228\229\233\241\242\226\232\229 \228\238\241\242\243\239\237\238 \242\238\235\252\234\238 \235\232\228\229\240\243 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Данное действие доступно только лидеру гильдии!")
		return
	end

	-- Проверяем длину имени персонажа
	local length = string.len(cha_name)
	if ((length < 1) or (length > 16)) then
		SystemNotice(role, "\196\235\232\237\224 \232\236\229\237\232 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\224 \225\251\242\252 \238\242 1 \228\238 16 \241\232\236\226\238\235\238\226!")
		--SystemNotice(role, "Длина имени персонажа должна быть от 1 до 16 символов!")
		return
	end

	-- Проверяем что игрок ввел корретный уровень доступа
	if ((level < 1) or (level > 3)) then
		SystemNotice(role, "\211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \236\238\230\229\242 \225\251\242\252 1, 2, 3!")
		--SystemNotice(role, "Уровень доступа может быть 1, 2, 3!")
		return
	end

	-- Удаляем игрока если новый уровень доступа сильнее старого
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]), 1 do
			if (cha_name == bank.access[i][j]) then
				table.remove(bank.access[i], j)
				SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \225\251\235 " .. i .. " \211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 (" .. guild_bank_access_desc[i] ..").")
				--SystemNotice(role, "У персонажа (" .. cha_name ..") был " .. i .. " Уровень доступа к банку гильдии (" .. guild_bank_access_desc[i] ..").")
				break
			end
		end
	end

	-- Выдаем игроку доступ
	table.insert(bank.access[level], cha_name)

	-- Обновляем банк гильдии
	UpdateBank(role, bank)

	-- Пишем сообщение игроку
	SystemNotice(role, "\194\251 \226\251\228\224\235\232 \239\229\240\241\238\237\224\230\243 (" .. cha_name ..") " .. level .. " \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 (" .. guild_bank_access_desc[level] ..").")
	--SystemNotice(role, "Вы выдали персонажу (" .. cha_name ..") " .. level .. " уровень доступа к банку гильдии (" .. guild_bank_access_desc[level] ..").")

end

-- Забрать у игрока права доступа к банку гильдии
function TakeAccess(role, bank, cha_name)
	cha_name = string.lower(cha_name)
	-- Проверяем, что игрок глава гильдии
	local role_id = GetRoleID(role)
	if(role_id ~= bank.leader_id) then
		SystemNotice(role, "\196\224\237\237\238\229 \228\229\233\241\242\226\232\229 \228\238\241\242\243\239\237\238 \242\238\235\252\234\238 \235\232\228\229\240\243 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Данное действие доступно только лидеру гильдии!")
		return
	end

	-- Проверяем длину имени персонажа
	local length = string.len(cha_name)
	if ((length < 1) or (length > 16)) then
		SystemNotice(role, "\196\235\232\237\224 \232\236\229\237\232 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\224 \225\251\242\252 \238\242 1 \228\238 16 \241\232\236\226\238\235\238\226!")
		--SystemNotice(role, "Длина имени персонажа должна быть от 1 до 16 символов!")
		return
	end

	-- Ищем игрока в списке доступа
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]) do
			if (bank.access[i][j] == cha_name) then
				table.remove(bank.access[i], j)
				UpdateBank(role, bank)

				SystemNotice(role, "\194\251 \231\224\225\240\224\235\232 \228\238\241\242\243\239 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 \243 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..")! \211 \237\229\227\238 \225\251\235 " .. i .. " \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 (" .. guild_bank_access_desc[i] ..").")
				--SystemNotice(role, "Вы забрали доступ к банку гильдии у персонажа (" .. cha_name ..")! У него был " .. i .. " уровень доступа (" .. guild_bank_access_desc[i] ..").")
				
				return
			end
		end
	end


	-- Отправляем сообщение игроку что персонаж не найден
	SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \237\229\242 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232!")
	--SystemNotice(role, "У персонажа (" .. cha_name ..") нет доступа к банку гильдии!")

end

-- Проверить уровень доступа персонажа
function GetAccess(bank, cha_name)
	cha_name = string.lower(cha_name)
	--for i = 1, table.getn(bank.access), 1 do
	--	Notice("Level " .. i .. ":")
	--	for j = 1, table.getn(bank.access[i]), 1 do
	--		Notice(bank.access[i][j])
	--	end
	--end
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]), 1 do
			if (cha_name == bank.access[i][j]) then
				return i
			end
		end
	end

	return 0

end

-- Отобразить уровень доступа персонажа
function ShowAccess(role, bank, cha_name)

	local level = GetAccess(bank, cha_name)
	if (level > 0) then
		SystemNotice(role, "\211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \239\229\240\241\238\237\224\230\224 (" .. cha_name .."): " .. level .. " (" .. guild_bank_access_desc[level] ..").")
		--SystemNotice(role, "Уровень доступа персонажа (" .. cha_name .."): " .. level .. " (" .. guild_bank_access_desc[level] ..").")
	else
		SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \237\229\242 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\232\232.")
		--SystemNotice(role, "У персонажа (" .. cha_name ..") нет доступа к банку гильии.")
	end

end

-- Загрузить банк из файла
function LoadGuildBank(role)

	-- Открываем банк гильдии
	local guild_id = GetChaGuildID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "r")
	if (file == nil) then
		SystemNotice(role, "\193\224\237\234 \227\232\235\252\228\232\232 \226\240\229\236\229\237\237\238 \237\229\228\238\241\242\243\239\229\237, \238\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243! \202\238\228 \238\248\232\225\234\232 1.")
		--SystemNotice(role, "Банк гильдии временно недоступен, обратитесь к администратору! Код ошибки 1.")
		return nil
	end

	-- Читаем строку из банка
	local raw_bank = file:read("*all")
	file:close()
	if (raw_bank == "") then
		SystemNotice(role, "\193\224\237\234 \227\232\235\252\228\232\232 \226\240\229\236\229\237\237\238 \237\229\228\238\241\242\243\239\229\237, \238\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243! \202\238\228 \238\248\232\225\234\232 2.")
		--SystemNotice(role, "Банк гильдии временно недоступен, обратитесь к администратору! Код ошибки 2.")
		return nil
	end

	return String2Bank(raw_bank)

end

-- Обновить файл банка
function UpdateBank(role, bank)

	if (HasGuild(role) == 0) then
		return
	end

	local guild_id = GetChaGuildID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "w+")
	local raw_bank = Bank2String(bank)
	file:write(raw_bank)
	file:close()

end

-- Проверить что игрок находится в разрешенной области
function IsInBankArea(role)

	-- Проверяем, что персонаж находится на разрешенной карте
	local cha_map = GetChaMapName(role)
	if (guild_bank_map[cha_map] == nil) then
		return 0
	end

	-- Проверяем, что персонаж находится в разрешенной области
	local area_arr = guild_bank_map[cha_map]
	local x, y = GetChaPos(role)
	x = math.floor(x / 100)
	y = math.floor(y / 100)

	for i = 1, table.getn(area_arr), 1 do
		local x0, y0 = area_arr[i][1], area_arr[i][2]
		local x1, y1 = area_arr[i][3], area_arr[i][4]

		if ((x >= x0 and x <= x1) and (y >= y0 and y <= y1)) then
			return 1
		end
	end

	return 0

end

--------------------------------------------------------------------------------
-- Функции предметов
--------------------------------------------------------------------------------

-- Камень банка гильдии
function ItemUse_GuildBankStone(role, Item)

	-- Проверяем, что персонаж в гильдии
	if (HasGuild(role) == 0) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Вы должны быть лидером гильдии, чтобы использовать Камень банка гильдии!")
		UseItemFailed(role)
		return
	end

	-- Получаем банк гильдии
	local Bank = LoadGuildBank(role)
	if (Bank == nil) then
		SystemNotice(role, "\194 \228\224\237\237\251\233 \236\238\236\229\237\242 \237\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "В данный момент невозможно использовать Камень банка гильдии!")
		UseItemFailed(role)
		return
	end

	-- Проверяем что персонаж лидер гильдии
	if (GetRoleID(role) ~= Bank.leader_id) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Вы должны быть лидером гильдии, чтобы использовать Камень банка гильдии!")
		UseItemFailed(role)
		return
	end
	
	-- Проверим, что банк был активирован
	if (Bank.activated == 1) then
		SystemNotice(role, "\193\224\237\234 \194\224\248\229\233 \227\232\235\252\228\232\232 \243\230\229 \224\234\242\232\226\232\240\238\226\224\237!")
		--SystemNotice(role, "Банк Вашей гильдии уже активирован!")
		UseItemFailed(role)
		return
	end

	-- Активируем банк гильдии
	Bank.activated = 1

	-- Сохраняем банк гильдии
	UpdateBank(role, Bank)

	-- Пишем сообщение игроку
	SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \224\234\242\232\226\232\240\238\226\224\235\232 \225\224\237\234 \227\232\235\252\228\232\232!")
	--SystemNotice(role, "Вы успешно активировали банк гильдии!")

end

-- Камень увеличения банка гильдии
function ItemUse_GuildBankUp(role, Item)

	-- Проверяем, что персонаж в гильдии
	if (HasGuild(role) == 0) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "Вы должны быть лидером гильдии, чтобы использовать Камень увеличения банка гильдии!")
		UseItemFailed(role)
		return
	end

	-- Получаем банк гильдии
	local Bank = LoadGuildBank(role)
	if (Bank == nil) then
		SystemNotice(role, "\194 \228\224\237\237\251\233 \236\238\236\229\237\242 \237\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "В данный момент невозможно использовать Камень увеличения банка гильдии!")
		UseItemFailed(role)
		return
	end

	-- Проверяем что персонаж лидер гильдии
	if (GetRoleID(role) ~= Bank.leader_id) then
		SystemNotice(role, "Вы должны быть лидером гильдии, чтобы увеличить количество ячеек в Банке Гильдии!")
		--SystemNotice(role, "Вы должны быть лидером гильдии, чтобы использовать Камень увеличения банка гильдии!")
		UseItemFailed(role)
		return
	end

	-- Проверяем размер банка
	if (Bank.size >= MAX_BANK_SIZE) then
		SystemNotice(role, "\193\224\237\234 \194\224\248\229\233 \227\232\235\252\228\232\232 \232\236\229\229\242 \236\224\234\241\232\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \255\247\229\229\234!")
		--SystemNotice(role, "Банк Вашей гильдии имеет максимальное количество ячеек!")
		UseItemFailed(role)
		return
	end

	-- Добавляем 3 ячейки
	local cell_add = 3
	local dif = MAX_BANK_SIZE - Bank.size

	if (dif > cell_add) then
		Bank.size = Bank.size + cell_add
	else
		Bank.size = Bank.size + diff
	end

	-- Сохраняем банк гильдии
	UpdateBank(role, Bank)

	-- Пишем сообщение игроку
	SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \240\224\241\248\232\240\232\235\232 \225\224\237\234 \227\232\235\252\228\232\232! \210\229\239\229\240\252 \229\227\238 \240\224\231\236\229\240 " .. Bank.size .. " \255\247\229\229\234.")
	--SystemNotice(role, "Вы успешно расширили банк гильдии! Теперь его размер " .. Bank.size .. " ячеек.")

end

--------------------------------------------------------------------------------
-- Вспомогательные функции
--------------------------------------------------------------------------------

-- Обрезает пробелы по границам строки
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- Разбить строку по разделителю
function explode(separator, str)
    local pos, arr = 0, {}
    for st, sp in function() return string.find(str, separator, pos, true) end do
        table.insert(arr, string.sub(str, pos, st-1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end

-- Собрать строку из массива с разделителем
function implode(separator, arr)
	return table.concat(arr, separator)
end

--------------------------------------------------------------------------------
-- Хуки
--------------------------------------------------------------------------------
DeductGuildItem_original = DeductGuildItem
DeductGuildItem = AfterGuildCreate
HandleChat_original = HandleChat
HandleChat = GuildHandleChat

--------------------------------------------------------------------------------
-- Регистрируем обработчики команд чата
--------------------------------------------------------------------------------
chat_guild_bank_cmd["\215\242\238\194\225\224\237\234\229"] = {access = 3, func = Cmd_ShowBank}
chat_guild_bank_cmd["\207\238\235\238\230\232\242\252\194\225\224\237\234"] = {access = 2, func = Cmd_PushItem}
chat_guild_bank_cmd["\194\231\255\242\252\200\231\193\224\237\234\224"] = {access = 1, func = Cmd_PopItem}
chat_guild_bank_cmd["\215\242\238\194\255\247\229\233\234\229"] = {access = 3, func = Cmd_ShowCell}
chat_guild_bank_cmd["\196\224\242\252\196\238\241\242\243\239"] = {access = 0, func = Cmd_GiveAccess}
chat_guild_bank_cmd["\199\224\225\240\224\242\252\196\238\241\242\243\239"] = {access = 0, func = Cmd_TakeAccess}
chat_guild_bank_cmd["\211\240\238\226\229\237\252\196\238\241\242\243\239\224"] = {access = 0, func = Cmd_ShowAccess}
chat_guild_bank_cmd["\207\238\236\238\249\252\193\224\237\234"] = {access = 3, func = Cmd_Help}