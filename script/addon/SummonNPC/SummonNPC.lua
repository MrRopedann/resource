	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** Monster Summon NPC Script ************************************************************************** --
	-- ***************************************************************************** Scripted by Angelix ***************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** Installation Instructions ************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	--[[
		1.	Load this file by using the 'dofile' function.
		2.	Inside 'NpcSdk.lua', look for function 'MsgProc', look for:
					elseif item.func == ChangeItem then
						return ChangeItem(character,npc)
				And below it add:
					elseif item.func == MonsterSummon then
						return MonsterSummon(character, npc, item.p1)
		4.	Add an NPC with the function 'MonsterNPC' in the line.
		]]--
	-- ******************************************************************************************************************************************************************************* --
	-- ******************************************************************************** NPC Functions ******************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
MonsterSummon = function(Player, NPC, StringText)
	local _, _, ItemID = string.find(StringText, 'ItemID: (%d+)')
	local _, _, Quantity = string.find(StringText, 'Quantity: (%d+)')
	local _, _, MonsterID = string.find(StringText, 'MonsterID: (%d+)')
	local _, _, Time = string.find(StringText, 'Time: (%d+)')
	local _, _, PosX = string.find(StringText, 'PosX: (%d+)')
	local _, _, PosY = string.find(StringText, 'PosY: (%d+)')
	ItemID, Quantity, MonsterID, Time, PosX, PosY = tonumber(ItemID), tonumber(Quantity), tonumber(MonsterID), tonumber(Time), tonumber(PosX), tonumber(PosY)
	if not MonsterID or not PosX or not PosY then
		SystemNotice(Player, 'Cannot summon this option is missing parameters.')
		return LUA_FALSE
	end
	if ItemID and ItemID ~= 0 then
		Quantity = Quantity or 1
		if KitbagLock(Player, 0) == LUA_FALSE then
			SystemNotice(Player, 'Cannot summon, your inventory is locked.')
			return LUA_FALSE
		end
		if CheckBagItem(Player, ItemID) < Quantity then
			SystemNotice(Player, string.format('You need %dx %s in order to summon this monster.', Quantity, GetItemName(ItemID)))
			return LUA_FALSE
		end
		if TakeItem(Player, 0, ItemID, Quantity) == LUA_FALSE then
			SystemNotice(Player, string.format('You need %dx %s in order to summon this monster.', Quantity, GetItemName(ItemID)))
			return LUA_FALSE
		end
	end
	local MapCopy = GetChaMapCopy(Player)
	local Monster = CreateChaEx(MonsterID, (PosX * 100), (PosY * 100), 145, 60, MapCopy)
	if Time then
		SetChaLifeTime(Monster, (Time * 60 * 1000))
	else
		SetChaLifeTime(Monster, -1)
	end
	return LUA_TRUE
end
-- MonsterNPC = function()
	-- Talk(1, 'Want to summon monsters in this map?')
	-- --	Text(1, '<TextOption>', MonsterSummon, 'ItemID: <ItemID>, Quantity: <Quantity>, MonsterID: <MonsterID>, Time: <Time>, PosX: <PosX>, PosY: <PosY>')	--	This is the format needed. Time is expressed in minutes.
	-- Text(1, 'Black Dragon', MonsterSummon, 'ItemID: 885, Quantity: 1, MonsterID: 870, Time: 10, PosX: 2165, PosY: 2780')	--	This is an example. Full parameters.
	-- Text(1, 'Black Dragon', MonsterSummon, 'ItemID: 885, Quantity: 1, MonsterID: 870, PosX: 2165, PosY: 2780')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(1, 'Black Dragon', MonsterSummon, 'ItemID: 885, MonsterID: 870, Time: 10, PosX: 2165, PosY: 2780')					--	This is an example. Missing quantity, will default to 1.
	-- Text(1, 'Black Dragon', MonsterSummon, 'MonsterID: 870, Time: 10, PosX: 2165, PosY: 2780')								--	This is an example. Missing ItemID, will not ask for an item.
	-- Text(1, 'Black Dragon', MonsterSummon, 'MonsterID: 870, PosX: 2165, PosY: 2780')										--	This is an example.
	
-- end
-- MonsterNPC = function()
	-- Talk(1, 'Хотите призвать боссов?')
	-- Text(1, 'Затерянное очко', JumpPage, 2)
	-- Text(1, 'Мир Дерьма', JumpPage, 3)
	-- Text(1, 'Уйти.', CloseTalk)
	-- --	Text(1, '<TextOption>', MonsterSummon, 'ItemID: <ItemID>, Quantity: <Quantity>, MonsterID: <MonsterID>, Time: <Time>, PosX: <PosX>, PosY: <PosY>')	--	This is the format needed. Time is expressed in minutes.
	-- Talk(2, "Чтобы призывать мини-босса, дай мне: 200 Пламенных баксов. Чтобы призвать мегабосса - 2000.")
	-- Text(2, '[Мини-босс] Печальный воин', MonsterSummon, 'ItemID: 1464, Quantity: 200, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(2, '[Мини-босс] Стенающий воин', MonsterSummon, 'ItemID: 1465, Quantity: 200, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(2, '[Мини-босс] Стенающий лучник', MonsterSummon, 'ItemID: 1466, Quantity: 200, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(2, '[Мини-босс] Печальный лучник', MonsterSummon, 'ItemID: 1467, Quantity: 200, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(2, '[Мегабосс] Рыцарь смерти', MonsterSummon, 'ItemID: 1468, Quantity: 2000, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(2, 'Уйти.', CloseTalk)
	
	-- Talk(3, "Чтобы призывать мини-босса, дай мне: 500 Пламенных баксов. Чтобы призвать мегабосса - 5000.")
	-- Text(3, '[Мини-босс] Болото', MonsterSummon, 'ItemID: 1469, Quantity: 500, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(3, '[Мини-босс] Болотный человек', MonsterSummon, 'ItemID: 1470, Quantity: 500, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(3, '[Мини-босс] Смотрящий за болотом', MonsterSummon, 'ItemID: 1471, Quantity: 500, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(3, '[Мини-босс] Болотный смотритель', MonsterSummon, 'ItemID: 1472, Quantity: 500, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(3, 'Главная болотная тварь', MonsterSummon, 'ItemID: 1473, Quantity: 5000, MonsterID: 870, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	-- Text(3, 'Уйти.', CloseTalk)
-- end
MonsterNPC = function()
	Talk(1, '\213\238\242\232\242\229 \239\240\232\231\226\224\242\252 \225\238\241\241\238\226?')
	Text(1, '\199\224\242\229\240\255\237\237\238\229 \238\247\234\238', JumpPage, 2)
	Text(1, '\204\232\240 \196\229\240\252\236\224', JumpPage, 3)
	Text(1, '\211\233\242\232.', CloseTalk)
	--	Text(1, '<TextOption>', MonsterSummon, 'ItemID: <ItemID>, Quantity: <Quantity>, MonsterID: <MonsterID>, Time: <Time>, PosX: <PosX>, PosY: <PosY>')	--	This is the format needed. Time is expressed in minutes.
	Talk(2, "\215\242\238\225\251 \239\240\232\231\251\226\224\242\252 \236\232\237\232-\225\238\241\241\224, \228\224\233 \236\237\229: 200 \207\235\224\236\229\237\237\251\245 \225\224\234\241\238\226. \215\242\238\225\251 \239\240\232\231\226\224\242\252 \236\229\227\224\225\238\241\241\224 - 2000.")
	Text(2, '\207\229\247\224\235\252\237\251\233 \226\238\232\237', MonsterSummon, 'ItemID: 3458, Quantity: 200, MonsterID: 1464, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(2, '\209\242\229\237\224\254\249\232\233 \226\238\232\237', MonsterSummon, 'ItemID: 3458, Quantity: 200, MonsterID: 1465, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(2, '\209\242\229\237\224\254\249\232\233 \235\243\247\237\232\234', MonsterSummon, 'ItemID: 3458, Quantity: 200, MonsterID: 1466, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(2, '\207\229\247\224\235\252\237\251\233 \235\243\247\237\232\234', MonsterSummon, 'ItemID: 3458, Quantity: 200, MonsterID: 1467, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(2, '\208\251\246\224\240\252 \241\236\229\240\242\232', MonsterSummon, 'ItemID: 3458, Quantity: 2000, MonsterID: 1468, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(2, '\211\233\242\232.', CloseTalk)
	
	Talk(3, "\215\242\238\225\251 \239\240\232\231\251\226\224\242\252 \236\232\237\232-\225\238\241\241\224, \228\224\233 \236\237\229: 500 \207\235\224\236\229\237\237\251\245 \225\224\234\241\238\226. \215\242\238\225\251 \239\240\232\231\226\224\242\252 \236\229\227\224\225\238\241\241\224 - 5000.")
	Text(3, '\193\238\235\238\242\238', MonsterSummon, 'ItemID: 3458, Quantity: 500, MonsterID: 1469, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(3, '\193\238\235\238\242\237\251\233 \247\229\235\238\226\229\234', MonsterSummon, 'ItemID: 3458, Quantity: 500, MonsterID: 1470, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(3, '\209\236\238\242\240\255\249\232\233 \231\224 \225\238\235\238\242\238\236', MonsterSummon, 'ItemID: 3458, Quantity: 500, MonsterID: 1471, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(3, '\193\238\235\238\242\237\251\233 \241\236\238\242\240\232\242\229\235\252', MonsterSummon, 'ItemID: 3458, Quantity: 500, MonsterID: 1472, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(3, '\195\235\224\226\237\224\255 \225\238\235\238\242\237\224\255 \242\226\224\240\252', MonsterSummon, 'ItemID: 3458, Quantity: 5000, MonsterID: 1473, PosX: 2153, PosY: 2779')				--	This is an example. Missing time, monster spawned is infinite till killed.
	Text(3, '\211\233\242\232.', CloseTalk)
end
