print("* Loading Reset System.lua")

--[[
	[Установка]:
		1.	Загрузить аддон и подгрузить.
		2.	Создать НПС, по примеру ниже:
			###	Character Reborn	1	564	0	217275,277575	217275,277575	180	Argent City	1	1	RebornNPC	0
		3.	Идем в : \resource\script\MisSdk\
		3.1	Открываем файл: NpcSdk.lua
		3.2	Ищем: return ChangeItem(character,npc)
		3.3	И вставляем ниже:
			elseif item.func == Reborn.Push then
				return Reborn.Push(character,item.p1)
		4.	Усе готово, бро!
]]

Reborn								= {}				-- Массив объектов ресета
Reborn.List							= {}				-- Массив объектов для листа ресетов
Reborn.Conf							= {}				-- Массив объектов для конфигурации ресета

Reborn.Conf.Active					= true			-- Включить/выключить НПС с ресетом
Reborn.Conf.Page					= 2				-- Стартовая страница у НПС с ресетом (лучше не менять)

-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
Reborn.List[1]						= {
	MinLv							= 50,
	MaxLv							= 1000,
	Need							= {
		Gold						= 10000,
		ItemID						= nil,
		Quantity					= nil,
	},
	Reward							= {
		Gold						= 0,
		Item						= {
			[1]						= {ItemID = 8109, Quantity = 1, Quality = 4},
			[2]						= {ItemID = 436, Quantity = 1, Quality = 4},
		}
	}
}
-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
Reborn.List[2]						= {
	MinLv							= 100,
	MaxLv							= 1000,
	Need							= {
		Gold						= 6000000,
		ItemID						= 2480,
		Quantity					= 100,
	},
	Reward							= {
		Gold						= 0,
		Item						= {
			[1]						= {ItemID = 436, Quantity = 1, Quality = 4},
			[2]						= {ItemID = nil, Quantity = nil, Quality = nil},
		}
	}
}
-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
Reborn.List[3]						= {
	MinLv							= 150,
	MaxLv							= 1000,
	Need							= {
		Gold						= 10000000,
		ItemID						= 1749,
		Quantity					= 230,
	},
	Reward							= {
		Gold						= 0,
		Item						= {
			[1]						= {ItemID = 436, Quantity = 1, Quality = 4},
			[2]						= {ItemID = nil, Quantity = nil, Quality = nil},
		}
	}
}
-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
Reborn.List[4]						= {
	MinLv							= 200,
	MaxLv							= 1000,
	Need							= {
		Gold						= 20000000,
		ItemID						= 1763,
		Quantity					= 260,
	},
	Reward							= {
		Gold						= 0,
		Item						= {
			[1]						= {ItemID = 436, Quantity = 1, Quality = 4},
			[2]						= {ItemID = nil, Quantity = nil, Quality = nil},
		}
	}
}

-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
Reborn.List[5]						= {
	MinLv							= 250,
	MaxLv							= 1000,
	Need							= {
		Gold						= 35000000,
		ItemID						= 1732,
		Quantity					= 300,
	},
	Reward							= {
		Gold						= 0,
		Item						= {
			[1]						= {ItemID = 436, Quantity = 1, Quality = 4},
			[2]						= {ItemID = nil, Quantity = nil, Quality = nil},
		}
	}
}

-- Требования и награды у НПС с ресетом
-- Чтобы добавить следующий, просто дублируем Reborn.List[i]
-- НПС автоматически генерирует текст, исходя из требований ниже...
-- Reborn.List[3]						= {
	-- MinLv							= 31,
	-- MaxLv							= 40,
	-- Need							= {
		-- Gold						= 0,
		-- ItemID						= 885,
		-- Quantity					= 1,
	-- },
	-- Reward							= {
		-- Gold						= 0,
		-- Item						= {
			-- [1]						= {ItemID = nil, Quantity = nil, Quality = nil},
			-- [2]						= {ItemID = nil, Quantity = nil, Quality = nil},
		-- }
	-- }
-- }

-- Сообщения для разговора с НПС
Reborn.Talk							= {
	-- "Привет. Я могу сделать ресет за вознаграждение!",
	-- "Сделать Ресет",
	-- "Уйти",
	-- "Каково уровня ваш персонаж?",
	-- "Ур.%d-%d",
	-- "[Далее]",
	-- "[Назад]",
	-- "После ресета ваш персонаж вернется на первый уровень! ",
	-- "Сделать Ресет",
	-- "Пожалуйста, снимите экипировку!",
	-- "Персонаж должен быть от Ур.%d до Lv%d!",
	-- "У вас должно быть %dg золота для ресета!",
	-- "Требуется %dx %s для выполнения Ресета!",
	-- "{%s}, успешно сделал ресет!",
	-- "Извините, в настоящее время система недоступна!",
	"\207\240\232\226\229\242. \223 \236\238\227\243 \241\228\229\235\224\242\252 \240\229\241\229\242 \231\224 \226\238\231\237\224\227\240\224\230\228\229\237\232\229!",
	"\209\228\229\235\224\242\252 \208\229\241\229\242",
	"\211\233\242\232",
	"\202\224\234\238\226\238 \243\240\238\226\237\255 \226\224\248 \239\229\240\241\238\237\224\230?",
	"\211\240.%d-%d",
	"[\196\224\235\229\229]",
	"[\205\224\231\224\228]",
	"\207\238\241\235\229 \240\229\241\229\242\224 \226\224\248 \239\229\240\241\238\237\224\230 \226\229\240\237\229\242\241\255 \237\224 \239\229\240\226\251\233 \243\240\238\226\229\237\252!",
	"\209\228\229\235\224\242\252 \208\229\241\229\242",
	"\207\238\230\224\235\243\233\241\242\224, \241\237\232\236\232\242\229 \253\234\232\239\232\240\238\226\234\243!",
	"\207\229\240\241\238\237\224\230 \228\238\235\230\229\237 \225\251\242\252 \238\242 \211\240.%d \228\238 Lv%d!",
	"\211 \226\224\241 \228\238\235\230\237\238 \225\251\242\252 %dg \231\238\235\238\242\224 \228\235\255 \240\229\241\229\242\224!",
	"\210\240\229\225\243\229\242\241\255 %dx %s \228\235\255 \226\251\239\238\235\237\229\237\232\255 \208\229\241\229\242\224!",
	"{%s}, \243\241\239\229\248\237\238 \241\228\229\235\224\235 \240\229\241\229\242!",
	"\200\231\226\232\237\232\242\229, \226 \237\224\241\242\238\255\249\229\229 \226\240\229\236\255 \241\232\241\242\229\236\224 \237\229\228\238\241\242\243\239\237\224!",
}
-- Функция НПС
RebornNPC							= function()
	if (Reborn.Conf.Active) then
		Talk(1, Reborn.Talk[1])
		Text(1, Reborn.Talk[2], JumpPage, Reborn.Conf.Page)
		Text(1, Reborn.Talk[3], CloseTalk)
		Reborn.GenerateText()
	else
		Talk(1, Reborn.Talk[15])
	end
end

-- Генератор текста на странице
-- Лимит 7 предметов на странице
Reborn.GenerateText					= function()
	local Page,Count,Total			= Reborn.Conf.Page,0,0
	for i,v in pairs(Reborn.List) do
		Total						= Total + 1
	end
	local Pages						= math.ceil(Total/7) + 2
	Talk(Page, Reborn.Talk[4])	
	for i,v in pairs(Reborn.List) do
		if (Count == 7) then
			Text(Page, Reborn.Talk[6], JumpPage, Page + 1)			
			Page					= Page + 1
			Talk(Page, Reborn.Talk[4])					
			Count					= 0
		end
		local Range					= string.format(Reborn.Talk[5], Reborn.List[i].MinLv, Reborn.List[i].MaxLv)
		Text(Page, Range, JumpPage, Pages)
		Reborn.GeneratePage(Pages, i, Page)
		Pages						= Pages + 1
		Count						= Count + 1
	end
end

-- Генератор страниц для НПС
Reborn.GeneratePage					= function(Pages, i, BackPage)
	Talk(Pages, Reborn.Talk[8])
	Text(Pages, Reborn.Talk[9], Reborn.Push, i)	
	Text(Pages, Reborn.Talk[7], JumpPage, BackPage)
end

-- Если игрок все снял, то...
Reborn.Push							= function(Player, i)
	if (IsEquip(Player) == LUA_TRUE) then
		PopupNotice(Player, Reborn.Talk[10])
		return
	end
	if (GetChaAttr(Player, ATTR_LV) < Reborn.List[i].MinLv or GetChaAttr(Player, ATTR_LV) > Reborn.List[i].MaxLv) then
		PopupNotice(Player, string.format(Reborn.Talk[11], Reborn.List[i].MinLv, Reborn.List[i].MaxLv))
		return
	end
	if (GetChaAttr(Player, ATTR_GD) < Reborn.List[i].Need.Gold) then
		PopupNotice(Player, string.format(Reborn.Talk[12], Reborn.List[i].Need.Gold))
		return
	end
	if (CheckBagItem(Player, Reborn.List[i].Need.ItemID) < Reborn.List[i].Need.Quantity) then
		PopupNotice(Player, string.format(Reborn.Talk[13], Reborn.List[i].Need.Quantity, GetItemName(Reborn.List[i].Need.ItemID)))
		return
	end
	--------- Берем значение Reset из БД ----------
	local Lv_Reset = 0
	local IDCha = GetRoleID(Player)
	local CheckReset = HandleLuaSql("SELECT Reset FROM GameDB.dbo.character WHERE cha_id = '"..IDCha.."'")
	local Lv_Reset = tonumber(CheckReset["Reset"])
	if Lv_Reset >= i then
		--PopupNotice(Player, "Вы уже делали "..i.." ресет! ")
		PopupNotice(Player, "\194\251 \243\230\229 \228\229\235\224\235\232 "..i.." \240\229\241\229\242! ")
		return
	end
	Reborn.Begin(Player, i)
end

-- Сбро уровня персонажа и базовых характеристик
-- Забираем вещи и золото.
-- Выдаем награду персонажу
-- Пишем в систему, что персонаж переродился.
Reborn.Begin						= function(Player, i)
	SetChaAttr(Player, ATTR_TP, 0)
	SetChaAttr(Player, ATTR_BSTR, 5)
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_BCON, 5)
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_BAGI, 5)
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_BDEX, 5)
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_BSTA, 5)
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_AP, 5)	
	SyncChar(Player, 4)	
	SetChaAttr(Player, ATTR_CEXP, 0)
	SyncChar(Player, 4)
	local IDCha = GetRoleID(Player)
	local CheckReset = HandleLuaSql("UPDATE GameDB.dbo.character SET Reset = Reset + 1 WHERE cha_id = '"..IDCha.."'")
	SetChaAttr(Player, ATTR_LV, 1)	
	SyncChar(Player, 4)		
	TakeMoney(Player, 0, Reborn.List[i].Need.Gold)
	TakeItem(Player, 0, Reborn.List[i].Need.ItemID, Reborn.List[i].Need.Quantity)
	PlayEffect(Player, 361)	
	--GMNotice(string.format(Reborn.Talk[14], GetChaDefaultName(Player), GetChaDefaultName(Player)))
	--GMNotice("Игрок - "..GetChaDefaultName(Player).." успешно прошел ["..i.."] ресет! ")
	GMNotice("\200\227\240\238\234 - "..GetChaDefaultName(Player).." \243\241\239\229\248\237\238 \239\240\238\248\229\235 ["..i.."] \240\229\241\229\242! ")
	Reborn.Rewards(Player, i)
	RefreshCha(Player)
	
end

-- Читаем награждения из таблицы и выдаем персонажу
Reborn.Rewards						= function(Player, i)
	if (Reborn.List[i].Reward.Gold > 0) then
		AddMoney(Player, 0, Reborn.List[i].Need.Gold)
	end
	for k							= 1, table.getn(Reborn.List[i].Reward.Item) do
		if (Reborn.List[i].Reward.Item[k].ItemID ~= nil) then
			if (GetChaFreeBagGridNum(Player) > 0) then
				GiveItem(Player, 0, Reborn.List[i].Reward.Item[k].ItemID, Reborn.List[i].Reward.Item[k].Quantity, Reborn.List[i].Reward.Item[k].Quality)
			else
				GiveItemX(Player, 0, Reborn.List[i].Reward.Item[k].ItemID, Reborn.List[i].Reward.Item[k].Quantity, Reborn.List[i].Reward.Item[k].Quality)
			end
		end
	end
end