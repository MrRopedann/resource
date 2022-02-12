--*-------------------------------------------------*--
--* dir parent	: addon	     	    				*--
--* File name	: GuildBank.lua						*--
--* Created by	: Valdiney Eviles, Gustavo Henrique	*--
--* Discord		: Eviles#2759						*--
--*-------------------------------------------------*--
print("* Loading GuildBank")

AntiBuy												= {}
GuildBank											= {}
GuildBank.Cache 									= {}
GuildBank.Conf										= {}
GuildBank.Conf.NPCName								= "[Банк Гильдий]"
GuildBank.Conf.NPC 									= {}
GuildBank.Conf.NPC[GuildBank.Conf.NPCName]			= {}
GuildBank.SlotSize									= {}

GuildBank.Conf.Path									= GetResPath("script/addon/GuildSystem/Data/Banks/")
GuildBank.Conf.LeaderPath							= GetResPath("script/addon/GuildSystem/Data/Leaders/")
GuildBank.Conf.LogPath								= GetResPath("script/addon/GuildSystem/Data/Logs/")

GuildBank.Conf.KeyTake								= 8033				-- ItemInfo.txt ID ключа, чтобы взять вещи.
GuildBank.Conf.KeySend								= 8034				-- ItemInfo.txt ID ключа, чтобы положить вещи.

GuildBank.Conf.MinSlot								= 20				-- Минимальные ячейки в банке (by default: 20).
GuildBank.Conf.MaxSlot								= 120				-- Максимальные ячейки в банке (by default: 120).
GuildBank.Conf.MaxStack								= 244				-- Максимальный стэк вещей в банке (by default: 244).

-- Эти предметы нельзя положить в банк.
GuildBank.Conf.Unbankable							= {3849,3988,4605,7060,7061,7062,7063,7064,7065}

-- Предметы для увеличения слотов банка.
GuildBank.SlotSize[8035]							= {OldSize = 20, NewSize = 36}
GuildBank.SlotSize[8036]							= {OldSize = 36, NewSize = 52}
GuildBank.SlotSize[8037]							= {OldSize = 52, NewSize = 68}
GuildBank.SlotSize[8038]							= {OldSize = 68, NewSize = 84}
GuildBank.SlotSize[8039]							= {OldSize = 84, NewSize = 100}
GuildBank.SlotSize[8040]							= {OldSize = 100, NewSize = 120}

-- Function for creating items with attr, as like: gem level, forge, etc..
GuildBank.MakeItem 									= {}
GuildBank.MakeItem.Attrs 							= {}

GuildBank.Talk										= {		-- General talks
	"Добро пожаловать в Банк Гильдий!",
	"Зайти в Банк",
	"Создать ключ [Взять]",
	"Создать ключ [Положить]",
	"Отключить все доступы",
	"Ключ успешно создан.",
	"Все разрешения успешно удалены.",
	"Вы не состоите в гильдии.",
	"I'm busy with another Guild, please wait.",
	"У вас не прав для просмотра Банка Гильдий.",
	"You do not have access to generate the keys.",
	"You can not remove the access to the Guild Bank.",
	"Ваш инвентарь привязан.",
	"%s нельзя положить в Банк Гильдий.",
	"Банк может содержать только %d слота.",
	"Вы можете делать стэк только до %d предметов а Банке Гильдий.",
	"Некорретное количество предмета!",
	"%s-Положить",
	"%s-Взять",
	"Игрок: %s\tПредмет: %s\tКоличество: %d\t",
	"%s: Загрузка... Пожалуйста подождите %d секунд(ы)!",
	"%s: Невозможно покупать предметы при торговле!",
	"%s: Параметры функции неверны!",
	"Положить",
	"Взять",
	"GetScriptID error! Сообщите администратору.",
	"NpcInfoList error! Сообщите администратору.",
	"Банк Гильдий: У вас нет прав на взятие предметов.",
	"Банк Гильдий: Ваш инвентарь заблокирован.",
	"MoneyOverFlow",
	"%s tried using MoneyOverFlow bug!",
	"%s: У вас не хватает денег.",
	"%s: %s входит в стэк %d предметов!",
	"Купить логи",
	"Нельзя использовать на море.",
	"Этот ключ не принадлежит вашей Гильдии.",
	"Разрешение [%s] успешно предоставлено!",
	"%s можно использовать только если у банка гильдий есть %d слотов!",
	"Воспользуйтесь другим рюкзаком. Данный не подходит!",
	"Банк гильдий успешно увеличен на %d слотов!",
	"Расширить банк может только Глава Гильдии!",
}

Guild_Bank								= function()
	InitTrigger()
	TriggerAction(1, GuildBank.InitNPC)
	TriggerAction(1, GuildBank.CheckAccess)
	TriggerAction(1, JumpPage, 1)
	Start(GetMultiTrigger(), 1)
	
	Talk(1, GuildBank.Talk[1])
	Text(1, GuildBank.Talk[2], GuildBank.BuyPage)
	
	InitTrigger()
	TriggerAction(2, GuildBank.GiveKey, GuildBank.Conf.KeyTake)
	TriggerAction(2, JumpPage, 2)
	Text(1, GuildBank.Talk[3], MultiTrigger, GetMultiTrigger(), 2)
	
	InitTrigger()
	TriggerAction(3, GuildBank.GiveKey, GuildBank.Conf.KeySend)
	TriggerAction(3, JumpPage, 2)
	Text(1, GuildBank.Talk[4], MultiTrigger, GetMultiTrigger(), 3)	
	
	InitTrigger()
	TriggerAction(4, GuildBank.RemoveAccess)
	TriggerAction(4, JumpPage, 3)
	Text(1, GuildBank.Talk[5], MultiTrigger, GetMultiTrigger(), 4)
	
	Talk(2, GuildBank.Talk[6])
	Talk(3, GuildBank.Talk[7])	
	
	InitTrade()
end

GuildBank.Save						= function(Player)
	if (GetChaGuildID(Player) > 0) then
		local Bank						= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Load()
		Bank							= Bank or {}
		Bank.SlotNum					= GuildBank.Conf.MinSlot
		Bank.Items						= {}
		DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Save()
		DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", {}):Save()
	end
end

GuildBank.Log						= function(filename,text)
	local file						= GuildBank.Conf.LogPath..filename..".txt"
	LogFile							= io.open(file, "a")
	LogFile:write("["..os.date().."]\t"..text.."\n")
	LogFile:close()
end

OverFlowVal							= 2^32-1
ItemIdFlag							= {}
local fp								= assert(io.open(GetResPath('ItemInfo.txt')))
for line in fp:lines() do
	local position					= string.find(line, "[ \t]*//")
	if position ~= 1 then
		local data					= split(line, "\t")
		local id,bargain,drop,cash,max = tonumber(data[1]),tonumber(data[17]),tonumber(data[19]),tonumber(data[23]),tonumber(data[21])
		if id ~= nil then
			ItemIdFlag[id] 			= {trade = bargain, throw = drop, price = cash, stack = max}
		end
	end
end

CheckGuildLeader					= function(Player)
	local GuildID 					= GetChaGuildID(Player)
	local PID 						= GetRoleID(Player)
	local LeaderID 					= GetGuildLeaderID(GuildID)
	if PID ~= LeaderID then
		return LUA_FALSE
	end
	return LUA_TRUE
end

GuildBank.InitNPC					= function(Player, npc)
	local name 						= GetCharName(npc)
	local guild_id 					= GetChaGuildID(Player)
	local cx,cy 					= GetChaPos(Player)
	
	if guild_id == 0 then
		HelpInfo(Player, 0, GuildBank.Talk[8])
		return LUA_FALSE
	end
	
	if GuildBank.Conf.NPC[name] ~= nil then
		if table.getn(GuildBank.Conf.NPC[name]) > 0 then
			local count 			= 0
			local remRole 			= {}
			local roleNum 			= 0
			local guild_id1 			= 0
			
			for i,v in ipairs(GuildBank.Conf.NPC[name]) do
				if GetChaGuildID(v.role) == 0 then
					table.insert(remRole, i)
				else
					local x,y = GetChaPos(v.role)
					if x == v.x and y == v.y then
						guild_id1 	= GetChaGuildID(v.role)
						count 		= count + 1
					else
						table.insert(remRole, i)
					end
				end
				
				if v.role == Player then
					roleNum 		= i
				end
			end
			
			for i,v in ipairs(remRole) do
				table.remove(GuildBank.Conf.NPC[name], v)
			end
			
			if roleNum > 0 then
				if GuildBank.Conf.NPC[name][roleNum] ~= nil then
					if GuildBank.Conf.NPC[name][roleNum].role == Player then
						table.remove(GuildBank.Conf.NPC[name], roleNum)
					end
				end
			end
			
			if count > 0 then		
				if guild_id == guild_id1 then
					table.insert(GuildBank.Conf.NPC[name], {role = Player, x = cx, y = cy})
				else
					HelpInfo(Player, 0, GuildBank.Talk[9])
					return LUA_FALSE
				end
			else
				table.insert(GuildBank.Conf.NPC[name], {role = Player, x = cx, y = cy})
			end
		else
			table.insert(GuildBank.Conf.NPC[name], {role = Player, x = cx, y = cy})
		end
	else
		GuildBank.Conf.NPC[name] 		= {}
		table.insert(GuildBank.Conf.NPC[name], {role = Player, x = cx, y = cy})
	end
	return LUA_TRUE
end

GuildBank.BuyPage					= function(Player, npc, trade)
	local Bank						= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Load()	
	if (not Bank.SlotNum) then
		Bank						= Bank or {}
		Bank.SlotNum				= GuildBank.Conf.MinSlot
		Bank.Items					= {}
		DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Save()		
	end
	if (Bank.Items) then		
		for i,v in ipairs(Bank.Items) do
			trade[3].item[i] 		= v.ID
		end
		
		trade[3].count 				= table.getn(Bank.Items)
		
		return TradePage(Player, npc, trade, TRADE_BUY, 0)
	end
end

GuildBank.CheckAccess				= function(Player, npc)
	local GuildAccess				= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Load()
	if CheckGuildLeader(Player) == LUA_FALSE then
		HelpInfo(Player, 0, GuildBank.Talk[10])
		return LUA_FALSE
	end
	
	if (GuildAccess) then
		local count 					= 0
		
		for i,v in ipairs(GuildAccess) do
			if v.cha_id == GetRoleID(Player) then
				count 				= count + 1
			end
		end
		
		if CheckGuildLeader(Player) == LUA_TRUE then
			count 					= count + 1
		end
		
		if count <= 0 then
			HelpInfo(Player, 0, GuildBank.Talk[10])
			return LUA_FALSE
		end
	end
	return LUA_TRUE
end

GuildBank.GiveKey					= function(Player, itemId)
	if CheckGuildLeader(Player) == LUA_FALSE then
		HelpInfo(Player, 0, GuildBank.Talk[11])
		return LUA_FALSE
	end
	local r1,r2						= MakeItem(Player, itemId, 1, 4)
	local Item						= GetChaItem(Player, 2, r2)
	SetItemAttr(Item, ITEMATTR_MAXENERGY, GetChaGuildID(Player))
	return LUA_TRUE
end

GuildBank.RemoveAccess				= function(Player)
	local GuildAccess				= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Load()	
	if CheckGuildLeader(Player) == LUA_FALSE then
		HelpInfo(Player, 0, GuildBank.Talk[12])
		return LUA_FALSE
	end
	DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", {}):Save()			
	return LUA_TRUE
end

GuildBank_Key						= function(role, Item)
	local Cha_Boat 					= GetCtrlBoat(role)
	local itemId 					= GetItemID(Item)
	local guild_id 					= GetChaGuildID(role)
	local guild_name 				= GetGuildName(guild_id)
	local guild_id1 				= GetItemAttr(Item, ITEMATTR_MAXENERGY)
	
	if Cha_Boat ~= nil then
		SystemNotice(role, GuildBank.Talk[35])
		UseItemFailed(role)
		return
	end
	
	if itemId ~= GuildBank.Conf.KeyTake and itemId ~= GuildBank.Conf.KeySend then
		UseItemFailed(role)
		return
	end
	
	if guild_id == 0 then
		SystemNotice(role, GuildBank.Talk[8])
		UseItemFailed(role)
		return
	end
	
	if guild_id ~= guild_id1 then
		SystemNotice(role, GuildBank.Talk[36])
		UseItemFailed(role)
		return
	end
	
	local GuildAccess				= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Load()
	if (GuildAccess) then
		local index 					= 0
		
		for i,v in ipairs(GuildAccess) do
			if v.cha_id == GetRoleID(role) then
				index 				= i
				break
			end
		end
		
		if itemId == GuildBank.Conf.KeyTake then -- Guild Key [Take Items]
			if index ~= 0 then
				GuildAccess[index].buy = 1
			else
				table.insert(GuildAccess, {cha_id = GetRoleID(role), buy = 1, sell = 0})
			end
		elseif itemId == GuildBank.Conf.KeySend then -- Guild Key [Give items]
			if index ~= 0 then
				GuildAccess[index].sell = 1
			else
				table.insert(GuildAccess, {cha_id = GetRoleID(role), buy = 0, sell = 1})
			end
		end
		
		SystemNotice(role, string.format(GuildBank.Talk[37], guild_name))
		DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Save()			
	end
end

GuildBank_Enlarger					= function(role, Item)
	if ChaIsBoat(role) == 1 then
		SystemNotice(role, GuildBank.Talk[35])
		UseItemFailed(role)
		return
	end
	local item_id						= GetItemID(Item)
	local item_name						= GetItemName(item_id)
	if GuildBank.SlotSize[item_id] == nil then
		BickerNotice(role, GuildBank.Talk[39])
		UseItemFailed(role)
	end
	if (GetChaGuildID(Player) == 0) then
		BickerNotice(role, GuildBank.Talk[8])
		UseItemFailed(role)
		return
	end
	local Bank							= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Load()
	if (not Bank) then
		BickerNotice(role, GuildBank.Talk[8])
		UseItemFailed(role)
		return
	end
	if CheckGuildLeader(role) == LUA_FALSE then
		BickerNotice(role, GuildBank.Talk[41])
		UseItemFailed(role)
		return
	end	
	local Num					= GuildBank.SlotSize[item_id].NewSize
	if Num > GuildBank.Conf.MaxSlot or Bank.SlotNum > GuildBank.Conf.MaxSlot then
		Num						= GuildBank.MaxSlot
	end
	if Bank.SlotNum ~= GuildBank.SlotSize[item_id].OldSize then
		BickerNotice(role, string.format(GuildBank.Talk[38], item_name, GuildBank.SlotSize[item_id].OldSize))
		UseItemFailed(role)
		return
	end
	Bank.SlotNum			= Num
	DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Save()
	BickerNotice(role, string.format(GuildBank.Talk[40], Num))
end

GuildBank.Sale						= function(Player, npc, index, count)
	if (IsChaStall(Player) == 1) then
		SystemNotice(Player, GuildBank.Talk[22])
		return LUA_FALSE
	end

	if (index == nil or count == nil) then
		SystemNotice(Player, GuildBank.Talk[23])
		return LUA_FALSE
	end
	
	local item 						= GetChaItem(Player, 2, index)
	local itemId 					= GetItemID(item)
	local ItemName					= GetItemName(itemId)	
	
	local TradeValue				= math.floor(ItemIdFlag[itemId].price/2)*count
	if (TradeValue > 10000000) then
		return LUA_FALSE
	end	
		
	if (GetCharName(npc) == GuildBank.Conf.NPCName) then
		local ret, id 				= GetScriptID(npc)
		if (ret ~= LUA_TRUE) then
			GuildBank.Log(GuildBank.Talk[24], GuildBank.Talk[26])
			return LUA_FALSE
		end

		if (NpcInfoList == nil or NpcInfoList[id] == nil) then
			GuildBank.Log(GuildBank.Talk[24], GuildBank.Talk[27])
			return LUA_FALSE
		end
		
		local GuildAccess				= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Load()
		if (GuildAccess) then
			local NumAccess 			= 0
			
			for i,v in ipairs(GuildAccess) do
				if v.cha_id == GetRoleID(Player) then
					if (v.sell == 1) then
						NumAccess 		= NumAccess + 1
					end
				end
			end
			
			if (CheckGuildLeader(Player) == LUA_TRUE) then
				NumAccess 				= NumAccess + 1
			end
			
			if (NumAccess <= 0) then
				HelpInfo(Player, 0, GuildBank.Talk[10])
				return LUA_FALSE
			end
		end
		
		local Save					= GuildBank.CreateItemTable(item)
		if (itemId == 0) then
			SystemNotice(Player, "Invalid item.")
			return LUA_FALSE
		end
		
		local Bank					= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Load()
		local BankCap				= Bank.SlotNum		
		local BankSize				= table.getn(Bank.Items)	
		local index2				= GuildBank.CheckDuplicate(Bank.Items, Save)
		if (BankCap > GuildBank.Conf.MaxSlot and (index2 == false or Bank.Items[index2].Num + count > ItemIdFlag[itemId].stack)) then
			BankCap					= GuildBank.Conf.MaxSlot
			SystemNotice(Player, string.format(GuildBank.Talk[15], BankCap))
			return LUA_FALSE
		end
		if ((BankSize+1) > BankCap and (index2 == false or Bank.Items[index2].Num + count > ItemIdFlag[itemId].stack)) then
			SystemNotice(Player, string.format(GuildBank.Talk[15], BankCap))
			return LUA_FALSE
		end
		if (count > GuildBank.Conf.MaxStack) then
			SystemNotice(Player, string.format(GuildBank.Talk[16], GuildBank.Conf.MaxStack))
			count 					= GuildBank.Conf.MaxStack
		end		
		local count1				= CheckBagItem(Player, itemId)
		if (count1 < count) then
			SystemNotice(Player, "Invalid item quantity.")
			return LUA_FALSE
		end
		if (ItemIdFlag[itemId].trade ~= 1) then
			SystemNotice(Player, string.format(GuildBank.Talk[14], ItemName))
			return LUA_FALSE
		end
		if (ItemIdFlag[itemId].throw == 0) then
			SystemNotice(Player, string.format(GuildBank.Talk[14], ItemName))
			return LUA_FALSE
		end		
		for i,v in pairs(GuildBank.Conf.Unbankable) do
			if itemId == v then
				SystemNotice(Player, string.format(GuildBank.Talk[14], ItemName))
				return LUA_FALSE
			end
		end		
		
		RemoveChaItem(Player, itemId, count, 2, index, 2 , 1 , 0)
		local count2				= CheckBagItem(Player, itemId)
		SynChaKitbag(Player, 13)
		if (count1 == count2 + count) then
			if (index2 ~= false and Bank.Items[index2].Num + count < ItemIdFlag[itemId].stack) then
				Bank.Items[index2].Num 	= Bank.Items[index2].Num + count
				Save.Num			= Bank.Items[index2].Num
			else
				Save.Num			= count
				table.insert(Bank.Items, Save)
			end
			GuildBank.Log(string.format(GuildBank.Talk[18], GetGuildName(GetChaGuildID(Player))), string.format(GuildBank.Talk[20], GetChaDefaultName(Player), ItemName, count))	
			DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Save()
			
			local trade				= NpcInfoList[id].trade	
			for i,v in ipairs(Bank.Items) do
				trade[3].item[i] 	= v.ID
			end
			
			trade[3].count 			= table.getn(Bank.Items)
			SendTradeUpdate(Player, npc, trade, TRADE_BUY, 0)
			return LUA_TRUE
		end
	else
		SafeSale(Player, index, count)
	end
	return LUA_TRUE
end

function GuildBank.CreateItemTable(Item)
	local Attrs = GuildBank.GetItemAttrs(Item)
	local ForgeParam = TansferNum(GetItemForgeParam(Item,1))
	local ID = GetItemID(Item)
	local ItemTable = {
		ID = ID,
		MaxGrowth = GetItemAttr(Item,53),
		Growth = GetItemAttr(Item,56),
		FuseID = GetItemAttr(Item,184),
		FuseLevel = GetItemAttr(Item,183),
		MaxStamina = GetItemAttr(Item,51),
		Stamina = GetItemAttr(Item,54),
		Attr55 = GetItemAttr(Item,55),
		Sockets = GetNum_Part1(ForgeParam),
		Gem1 = GetNum_Part2(ForgeParam),
		Gem2 = GetNum_Part4(ForgeParam),
		Gem3 = GetNum_Part6(ForgeParam),
		Level1 = GetNum_Part3(ForgeParam),
		Level2 = GetNum_Part5(ForgeParam),
		Level3 = GetNum_Part7(ForgeParam),
		Num = 1,
		Type = GetItemType(Item),
	}
	for i,v in pairs(Attrs) do
		ItemTable[i] = v
	end
	return ItemTable
end

function GuildBank.GetItemAttrs(Item)
	local Stats = {}
	local count = 0
	for i = 1,47 do
		if	GetItemAttr(Item,i) ~= 0 then
			Stats[count] = {Attr = i, AttrNum = GetItemAttr(Item,i)}
			count = count + 1
		else
			SetItemAttr(Item,i,1)
			if	GetItemAttr(Item,i) ~= 0 then
				Stats[count] = {Attr = i, AttrNum = 0}
				count = count + 1
			end
		end
	end
	local AttrTable = {}
	for i = 0,4 do
		if Stats[i] ~= nil then
			if Stats[i].Attr ~= nil then
				AttrTable[string.format('Attr%s',(i+1))] = Stats[i].Attr
			end
			if Stats[i].Attr ~= nil then
				AttrTable[string.format('Attr%sNum',(i+1))] = Stats[i].AttrNum
			end
		end
	end
	return AttrTable
end


function GuildBank.CheckDuplicate(array,item)
	for i,v in pairs(array) do
		local equal = true
		for j,k in pairs(item) do
			if v[j] ~= k and j ~= 'Num' then
				equal = false
				break
			end
		end
		if equal == true then
			return i
		end
	end
	return false
end

GuildBank.Buy						= function(Player, npc, trade, itemtype, index1, index2, count)
	local delay 						= math.random(1, 2)
	if AntiBuy[Player] == nil then
		AntiBuy[Player] 			= os.time()
	end
	
	local npcName					= GetChaDefaultName(npc)
	local cd 						= AntiBuy[Player] - os.time()
	if cd > 0 then
		SystemNotice(Player, string.format(GuildBank.Talk[21], npcName, cd))
		return LUA_FALSE
	end
	
	if IsChaStall(Player) == 1 then
		SystemNotice(Player, string.format(GuildBank.Talk[22], npcName))
		return LUA_FALSE
	end	

	itemtype 						= itemtype + 1
	index1 							= index1 + 1
	if trade[itemtype] == nil or trade[itemtype].item == nil or trade[itemtype].item[index1] == nil then
		SystemNotice( Player, GuildBank.Talk[23])
		return LUA_FALSE
	end
	
	AntiBuy[Player] 				= os.time() + delay
	
	local itemid 					= trade[itemtype].item[index1]
	local ItemName					= GetItemName(itemid)		
	local name 						= GetCharName(npc)
	local cha_name 					= GetChaDefaultName(Player)
	
	if name == GuildBank.Conf.NPCName then
		local GuildAccess			= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player).."_allowed.dat", GuildAccess):Load()
		if (GuildAccess) then
			local NumAccess 		= 0
			
			for i,v in ipairs(GuildAccess) do
				if v.cha_id == GetRoleID(Player) then
					if v.buy == 1 then
						NumAccess 	= NumAccess + 1
					end
				end
			end
			
			if CheckGuildLeader(Player) == LUA_TRUE then
				NumAccess 			= NumAccess + 1
			end
			
			if NumAccess <= 0 then
				HelpInfo(Player, 0, GuildBank.Talk[28])
				return LUA_FALSE
			end
		end
		
		local Bank					= DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Load()
		local Update				= 0
		if (Bank.Items[index1] == nil) then
			SystemNotice(Player, "Invalid item.")
			return LUA_FALSE
		elseif (Bank.Items[index1].ID ~= itemid) then
			SystemNotice(Player, "Item mismatch.")
			return LUA_FALSE
		elseif (GetChaFreeBagGridNum(Player) < 1) then
			SystemNotice(Player, "Requires at least 1 empty Inventory Slot.")
			return LUA_FALSE
		elseif (KitbagLock(Player, 0) == LUA_FALSE) then
			SystemNotice(Player, 0, GuildBank.Talk[29])
			return LUA_FALSE
		end
				
		count							= math.min(Bank.Items[index1].Num, count)
		if (ItemIdFlag[Bank.Items[index1].ID].stack > 1) then
			GiveItem(Player, 0, Bank.Items[index1].ID, count, 4)
			Bank.Items[index1].Num 		= Bank.Items[index1].Num - count
		else
			count						= 1
			GuildBank.MakeItem.Make(Player, Bank.Items[index1].ID, Bank.Items[index1])
			Bank.Items[index1].Num		= Bank.Items[index1].Num - 1
		end
		GuildBank.Log(string.format(GuildBank.Talk[19], GetGuildName(GetChaGuildID(Player))), string.format(GuildBank.Talk[20], cha_name, ItemName, count))
		if (Bank.Items[index1].Num == 0) then
			table.remove(Bank.Items, index1)
			Update 						= 1
		end
		DataFile:Init(GuildBank.Conf.Path..GetChaGuildID(Player)..".dat", Bank):Save()
		if (Update > 0) then
			for i,v in ipairs(Bank.Items) do
				trade[3].item[i] = v.ID
			end
			
			trade[3].count 		= table.getn(Bank.Items)
			SendTradeUpdate(Player, npc, trade, TRADE_BUY, 0)
		end		
		return LUA_TRUE
	else
		local TradeValue				= ItemIdFlag[itemid].price * count
		if TradeValue > OverFlowVal then
			LG(GuildBank.Talk[30], string.format(GuildBank.Talk[31], cha_name))
			BickerNotice(Player, GuildBank.Talk[32])
			return LUA_FALSE
		end	
		
		local Money					= GetChaAttr(Player, ATTR_GD)
		if TradeValue > Money then
			LG(GuildBank.Talk[30], string.format(GuildBank.Talk[31], cha_name))
			BickerNotice(Player, GuildBank.Talk[32])
			return LUA_FALSE
		end	

		if count > ItemIdFlag[itemid].stack then
			BickerNotice(Player, string.format(GuildBank.Talk[33], npcName, ItemName, count))
			return LUA_FALSE
		end		
		
		SafeBuy(Player, itemid, index2, count)
		LG(GuildBank.Talk[34], cha_name, itemid, ItemName)			
	end
	return LUA_TRUE
end

function GuildBank.MakeItem.Make(role,ID,AttrTable)
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role, "Requires at least 1 empty Inventory Slot.")
		return false
	end
	if AttrTable.Attr1~= nil and AttrTable.Attr1Num ~= nil and AttrTable.Attr1 ~= 0  then 
		GuildBank.MakeItem.Attrs[AttrTable.Attr1] = AttrTable.Attr1Num
	end
	if AttrTable.Attr2~= nil and AttrTable.Attr2Num ~= nil and AttrTable.Attr2 ~= 0 then
		GuildBank.MakeItem.Attrs[AttrTable.Attr2] = AttrTable.Attr2Num  
	end
	if AttrTable.Attr3~= nil and AttrTable.Attr3Num ~= nil and AttrTable.Attr3 ~= 0 then
		GuildBank.MakeItem.Attrs[AttrTable.Attr3] = AttrTable.Attr3Num  
	end
	if AttrTable.Attr4~= nil and AttrTable.Attr4Num ~= nil and AttrTable.Attr4 ~= 0 then
		GuildBank.MakeItem.Attrs[AttrTable.Attr4] = AttrTable.Attr4Num  
	end
	if AttrTable.Attr5~= nil and AttrTable.Attr5Num ~= nil and AttrTable.Attr5 ~= 0 then
		GuildBank.MakeItem.Attrs[AttrTable.Attr5] = AttrTable.Attr5Num  
	end
	local Ignore 
	local Slot 
	Ignore,Slot = MakeItem ( role , ID , 1 , 1 )
	local Item = GetChaItem ( role , 2 , Slot )
	for i,v in pairs(GuildBank.MakeItem.Attrs) do
		SetItemAttr(Item,i,v)
	end
	GuildBank.MakeItem.Attrs = {}
	local ForgeParam = 0
	if AttrTable.Sockets ~= nil then
		ForgeParam = SetNum_Part1(ForgeParam, AttrTable.Sockets)
	end
	if AttrTable.Gem1 ~= nil then
		ForgeParam = SetNum_Part2(ForgeParam, AttrTable.Gem1)
	end
	if AttrTable.Level1 ~= nil then
		ForgeParam = SetNum_Part3(ForgeParam, AttrTable.Level1)
	end
	if AttrTable.Gem2 ~= nil then
		ForgeParam = SetNum_Part4(ForgeParam, AttrTable.Gem2)
	end
	if AttrTable.Level2 ~= nil then
		ForgeParam = SetNum_Part5(ForgeParam, AttrTable.Level2)
	end
	if AttrTable.Gem3 ~= nil then
		ForgeParam = SetNum_Part6(ForgeParam, AttrTable.Gem3)
	end
	if AttrTable.Level3 ~= nil then
		ForgeParam = SetNum_Part7(ForgeParam, AttrTable.Level3)
	end
	ForgeParam = TansferNum(ForgeParam)
	SetItemForgeParam(Item, 1, ForgeParam)
	if AttrTable.MaxGrowth ~= nil then
		if AttrTable.Growth == nil then
			AttrTable.Growth = AttrTable.MaxGrowth
		end
		SetItemAttr(Item,53,AttrTable.MaxGrowth)
		SetItemAttr(Item,56,AttrTable.Growth)
	end
	if AttrTable.FuseLevel == nil then
		AttrTable.FuseLevel = 10
	end
	if AttrTable.FuseID ~= nil then
		SetItemAttr(Item,184,AttrTable.FuseID)
		SetItemAttr(Item,183,AttrTable.FuseLevel)
	end
	if AttrTable.Stamina == nil then
		AttrTable.Stamina = 0
	end
	if AttrTable.MaxStamina ~= nil then
		SetItemAttr(Item,51,AttrTable.MaxStamina)
		SetItemAttr(Item,54,AttrTable.Stamina)
	end
	SynChaKitbag(role,13)
	return Ignore,Slot
end

-- Overwrite existing functions.
Sale								= GuildBank.Sale
Buy									= GuildBank.Buy