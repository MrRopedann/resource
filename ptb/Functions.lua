-- DO NOT EDIT THIS, PERIOD.
if PTB == nil then
	PTB 											= {}
	PTB.WaitList 									= {}
	PTB.MapCopy 									= {}
	PTB.Spawns 										= {}
	PTB.Rewards										= {}
	PTB.Rewards[1]									= {}
	PTB.Rewards[1].Items								= {}
	PTB.Rewards[2]									= {}
	PTB.Rewards[2].Items								= {}
	PTB.Conf 										= {}
	PTB.Conf.Time 									= {}
	PTB.Conf.BombZone 								= {}
end
-- Calling those customizable variables.
dofile(GetResPath("ptb/Configuration.lua"))
PTB.Log 											= function(Player, Type)
	local PID 										= GetRoleID(Player)
	local Table										= PTB.Conf.SavePath..PID..".txt"
	local Date 										= (tonumber(os.date("%Y")) * 10000) + (tonumber(os.date("%m")) * 100) + (tonumber(os.date("%d")))
	local Value 										= 0
	local Log 										= nil
	if file_exists(Table) == false then
		Log 										= {}
		table.save(Log, Table)
	end
	Log 											= table.load(Table)
	if Log[Date] == nil then
		Log[Date] 									= 0
	end
	if Type == 2 then
		if PTB.Conf.MatchesPerDay == 0 or Log[Date] < PTB.Conf.MatchesPerDay then
			Value 									= 1
		end
	end
	if Type == 3 then
		Log[Date] 									= Log[Date] + 1
	end
	table.save(Log, Table)
	return Value
end
PTB.StartPlayer 									= function(Player, CopyID)
	local TeamID										= 0
	local PID										= GetRoleID(Player)
	if (PTB.MapCopy[CopyID].Green.Counter == PTB.MapCopy[CopyID].Red.Counter) then
		TeamID										= math.random(0,1)
	else
		if (PTB.MapCopy[CopyID].Green.Counter > PTB.MapCopy[CopyID].Red.Counter) then
			TeamID									= 0
		else
			TeamID									= 1
		end
	end
	if (PTB.MapCopy[CopyID].Players[PID] == nil) then
		PTB.MapCopy[CopyID].Players[PID]				= { cha 		= Player,
														side_id 	= TeamID,
														entered 	= LUA_FALSE,
														deadtimer 	= PTB.Conf.SpawnTimer,
														defused 	= 0,
														planted 	= 0 }
	else
		PTB.MapCopy[CopyID].Players[PID].cha			= Player
		PTB.MapCopy[CopyID].Players[PID].side_id		= TeamID
		PTB.MapCopy[CopyID].Players[PID].entered		= LUA_FALSE
		PTB.MapCopy[CopyID].Players[PID].deadtimer 	= PTB.Conf.SpawnTimer
		PTB.MapCopy[CopyID].Players[PID].defused		= 0
		PTB.MapCopy[CopyID].Players[PID].planted		= 0
	end
	if (TeamID == 0) then
		PTB.MapCopy[CopyID].Red.Counter				= PTB.MapCopy[CopyID].Red.Counter + 1
		AddState(Player, Player, STATE_BIW, 10, PTB.Conf.Time.Init)			
		MoveCity(Player, PTB.Spawns[2].Spawn, CopyID)
	else
		PTB.MapCopy[CopyID].Green.Counter			= PTB.MapCopy[CopyID].Green.Counter + 1
		AddState(Player, Player, STATE_BIW, 10, PTB.Conf.Time.Init)			
		MoveCity(Player, PTB.Spawns[1].Spawn, CopyID)
	end
end
PTB.RevivePlayer 									= function(MapCopy)
	local CopyID 									= GetMapCopyID2(MapCopy)
	local PlayerNum									= GetMapCopyPlayerNum(MapCopy)
	BeginGetMapCopyPlayerCha(MapCopy)
	for i = 1, PlayerNum, 1 do
		local Player									= GetMapCopyNextPlayerCha(MapCopy)
		if (ValidCha(Player) == 1) then
			local PID								= GetRoleID(Player)
			if GetChaAttr(Player, ATTR_HP) <= 0 then
				BickerNotice(Player, "Вы будете воскрешены через"..PTB.MapCopy[CopyID].Players[PID].deadtimer.." секунды.")
				if PTB.MapCopy[CopyID].Players[PID].deadtimer == 0 then
					PTB.Spawn(Player, MapCopy)
				end
				PTB.MapCopy[CopyID].Players[PID].deadtimer = PTB.MapCopy[CopyID].Players[PID].deadtimer - 1
			end
		end
	end
end
PTB.StartRound 										= function(MapCopy)
	local CopyID 									= GetMapCopyID2(MapCopy)
	if PTB.MapCopy[CopyID].Active == true then
		PTB.MapCopy[CopyID].Round 					= PTB.MapCopy[CopyID].Round + 1
		PTB.MapCopy[CopyID].Time.Round 				= PTB.Conf.Time.Round
		PTB.MapCopy[CopyID].Bomb 					= nil		
		PTB.MapCopy[CopyID].BombZone1 				= 0			
		PTB.MapCopy[CopyID].BombZone2 				= 0
		PTB.MapCopy[CopyID].BombStatus 				= 0			
		PTB.MapCopy[CopyID].PlantTime1 				= PTB.Conf.Time.Planting	
		PTB.MapCopy[CopyID].PlantTime2 				= PTB.Conf.Time.Planting	
		PTB.MapCopy[CopyID].DefuseTime1 				= PTB.Conf.Time.Defusing	
		PTB.MapCopy[CopyID].DefuseTime2 				= PTB.Conf.Time.Defusing	
		MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Раунд #"..PTB.MapCopy[CopyID].Round.." начался!")
	end
end
-- Call that on "is_friend" at functions.lua
PTB.Friendly										= function(ATKER, DEFER)
	local ATKER_Team									= GetChaSideID(ATKER)
	local DEFER_Team									= GetChaSideID(DEFER)
	if ATKER_Team == DEFER_Team then
		return 1
	else
		return 0
	end
end
-- Call that on "birth.lua"
PTB.CreateSpawn = function()
	for a 											= 1, (table.getn(PTB.Spawns)), 1 do
		AddBirthPoint(PTB.Spawns[a].Name, PTB.Spawns[a].Map, PTB.Spawns[a].X, PTB.Spawns[a].Y)
		AddBirthPoint(PTB.Spawns[a].Spawn, PTB.Spawns[a].Map, PTB.Spawns[a].X, PTB.Spawns[a].Y)
	end
end
BeginPlantTheBomb 									= function(Player)
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local side_id 									= GetChaSideID(Player)
	local x,y 										= GetChaPos(Player)
	-- Red team
	if (side_id == 2) then
		-- Bomb Zone 1
		local in_zone_1 								= false	
		local plant_time_1							= PTB.MapCopy[CopyID].PlantTime1
		if (x > PTB.Conf.BombZone[1][1] and x < PTB.Conf.BombZone[1][2] and
			y > PTB.Conf.BombZone[1][3] and y < PTB.Conf.BombZone[1][4]) then
			in_zone_1 								= true
		end
		-- Player is in bomb zone 1
		if (in_zone_1 == true) then
			if (plant_time_1 > 0) then
				PTB.MapCopy[CopyID].PlantTime1		= PTB.MapCopy[CopyID].PlantTime1 - 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Предупреждение!!! Бомба будет заложена Красной командой  \"Зоне 1\" через "..PTB.MapCopy[CopyID].PlantTime1.." секунд!")
			else
				-- Planting time reach 0, plant the bomb at zone 1
				PTB.MapCopy[CopyID].BombZone1 		= 1
			end
		else
		-- Reset planting time if player leave bomb zone 2		
			PTB.MapCopy[CopyID].PlantTime1 			= PTB.Conf.Time.Planting
		end
		
		-- Bomb Zone 2
		local in_zone_2 								= false	
		local plant_time_2							= PTB.MapCopy[CopyID].PlantTime2
		if (x > PTB.Conf.BombZone[2][1] and x < PTB.Conf.BombZone[2][2] and
			y > PTB.Conf.BombZone[2][3] and y < PTB.Conf.BombZone[2][4]) then
			in_zone_2 								= true
		end
		-- Player is in bomb zone 2
		if (in_zone_2 == true) then
			if (plant_time_2 > 0) then
				PTB.MapCopy[CopyID].PlantTime2		= plant_time_2 - 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Предупреждение!!! Бомба будет заложена Красной командой \"зоне 2\" через "..PTB.MapCopy[CopyID].PlantTime2.." секунд!")
			else
				-- Planting time reach 0, plant the bomb at zone 2
				PTB.MapCopy[CopyID].BombZone2 		= 1				
			end
		else
		-- Reset planting time if player leave bomb zone 2		
			PTB.MapCopy[CopyID].PlantTime2 			= PTB.Conf.Time.Planting
		end
	end
end
PlantTheBombInZone_1 								= function(Player)
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local side_id 									= GetChaSideID(Player)
	local x,y 										= GetChaPos(Player)
	-- Red team
	if (side_id == 2) then
		-- Bomb Zone 1
		local in_zone_1 								= false	
		if (x > PTB.Conf.BombZone[1][1] and x < PTB.Conf.BombZone[1][2] and
			y > PTB.Conf.BombZone[1][3] and y < PTB.Conf.BombZone[1][4]) then
			in_zone_1 								= true
		end
		-- Player is in bomb zone 1
		if (in_zone_1 == true) then
			local Bomb 								= CreateChaEx(1477, 12600, 5600, 145, 120000, MapCopy)
			PTB.MapCopy[CopyID].Bomb 				= Bomb
			SetChaLifeTime(Bomb, 96000)
			PTB.MapCopy[CopyID].BombStatus			= 1		
			PTB.MapCopy[CopyID].Time.Round 			= PTB.Conf.Time.Defuse
			MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]:Красная команда подложила бомбу в \"зоне 1\". Взрыв будет происходить в "..ToClockFormat(PTB.MapCopy[CopyID].Time.Round).."!")
		end
	end
end
PlantTheBombInZone_2 								= function(Player)
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local side_id 									= GetChaSideID(Player)
	local x,y 										= GetChaPos(Player)
	-- Red team
	if (side_id == 2) then
		-- Bomb Zone 2
		local in_zone_2 								= false	
		if (x > PTB.Conf.BombZone[2][1] and x < PTB.Conf.BombZone[2][2] and
			y > PTB.Conf.BombZone[2][3] and y < PTB.Conf.BombZone[2][4]) then
			in_zone_2 								= true
		end
		-- Player is in bomb zone 2
		if (in_zone_2 == true) then
			local Bomb 								= CreateChaEx(1477, 12500, 14500, 145, 120000, MapCopy)
			PTB.MapCopy[CopyID].Bomb 				= Bomb
			SetChaLifeTime(Bomb, 96000)
			PTB.MapCopy[CopyID].BombStatus			= 1		
			PTB.MapCopy[CopyID].Time.Round 			= PTB.Conf.Time.Defuse
			MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Красная команда подложила бомбу в \"зоне 2\". Взрыв будет происходить "..ToClockFormat(PTB.MapCopy[CopyID].Time.Round).."!")
		end
	end
end
BeginDefuseInZone_1									= function(Player)
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local side_id 									= GetChaSideID(Player)
	local x,y 										= GetChaPos(Player)
	-- Green team
	if (side_id == 1) then
		-- Bomb Zone 1
		local in_zone_1 								= false	
		local defuse_time_1							= PTB.MapCopy[CopyID].DefuseTime1
		if (x > PTB.Conf.BombZone[1][1] and x < PTB.Conf.BombZone[1][2] and
			y > PTB.Conf.BombZone[1][3] and y < PTB.Conf.BombZone[1][4]) then
			in_zone_1 								= true
		end
		-- Player is in bomb zone 1
		if (in_zone_1 == true) then
			if (defuse_time_1 > 0) then
				PTB.MapCopy[CopyID].DefuseTime1 		= PTB.MapCopy[CopyID].DefuseTime1 - 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда пытается обезвредить бомбу  \"зоне 1\". Оставшееся время: "..PTB.MapCopy[CopyID].DefuseTime1.." секунд!")
			else
				KillCha(PTB.MapCopy[CopyID].Bomb)
				PTB.AddPoint(MapCopy, "Green", 1)
				PTB.MapCopy[CopyID].BombZone1 = 2				
				PTB.MapCopy[CopyID].Time.Round = PTB.Conf.Time.Init				
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Бомба была обезврежена зеленой командой, они получают  [+1] очко")
			end
		else
			PTB.MapCopy[CopyID].DefuseTime1			= PTB.Conf.Time.Defusing
		end
	end
end
BeginDefuseInZone_2									= function(Player)
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local side_id 									= GetChaSideID(Player)
	local x,y 										= GetChaPos(Player)
	-- Green team
	if (side_id == 1) then
		-- Bomb Zone 2
		local in_zone_2 								= false	
		local defuse_time_2							= PTB.MapCopy[CopyID].DefuseTime2
		if (x > PTB.Conf.BombZone[2][1] and x < PTB.Conf.BombZone[2][2] and
			y > PTB.Conf.BombZone[2][3] and y < PTB.Conf.BombZone[2][4]) then
			in_zone_2 								= true
		end
		-- Player is in bomb zone 2
		if (in_zone_2 == true) then
			if (defuse_time_2 > 0) then
				PTB.MapCopy[CopyID].DefuseTime2 		= PTB.MapCopy[CopyID].DefuseTime2 - 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда пытается обезвредить бомбу \"зоне 2\". Оставшееся время "..PTB.MapCopy[CopyID].DefuseTime2.." секунд!")
			else
				KillCha(PTB.MapCopy[CopyID].Bomb)
				PTB.AddPoint(MapCopy, "Green", 1)
				PTB.MapCopy[CopyID].BombZone2 		= 2
				PTB.MapCopy[CopyID].Time.Round 		= PTB.Conf.Time.Init
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Бомба была обезврежена зеленой командой, они получают  [+1] очко")
			end
		else
			PTB.MapCopy[CopyID].DefuseTime2			= PTB.Conf.Time.Defusing
		end
	end
end	
PTB.AvailableCopy 									= function()
	local Value 										= 0
	for a 											= 1, PTB.Conf.NumMapCopy, 1 do
		if PTB.MapCopy[a] == nil or PTB.MapCopy[a].Initiate == false then
			Value 									= a
			break
		end
	end
	return Value
end
PTB.StartMapCopy 									= function(CopyID)
	LG("PTB", "Copy ID:", CopyID)
	PTB.MapCopy[CopyID] 							= {}
	PTB.MapCopy[CopyID].Players 						= {}	
	PTB.MapCopy[CopyID].Team 						= {}	
	PTB.MapCopy[CopyID].Time 						= {}	
	
	
	PTB.MapCopy[CopyID].Time.Init 					= 0
	PTB.MapCopy[CopyID].Time.Round 					= 0
	PTB.MapCopy[CopyID].Time.Map 					= 0

	PTB.MapCopy[CopyID].Initiate 					= false
	PTB.MapCopy[CopyID].Active 						= false	
	PTB.MapCopy[CopyID].Round 						= 0	
	
	PTB.MapCopy[CopyID].PlayerNum					= 0
	
	PTB.MapCopy[CopyID].Green 						= {}
	PTB.MapCopy[CopyID].Red 							= {}	
	
	PTB.MapCopy[CopyID].Green.Counter 				= 0	
	PTB.MapCopy[CopyID].Red.Counter 					= 0
	
	PTB.MapCopy[CopyID].Red.Score 					= 0	
	PTB.MapCopy[CopyID].Green.Score 					= 0	
	
	PTB.MapCopy[CopyID].Winner 						= nil
end
PTB.Spawn											= function(Player, MapCopy)
	local CopyID 									= GetMapCopyID2(MapCopy)
	ReAll(Player)
	MoveCity(Player, PTB.Conf.MapName, CopyID)
	RefreshCha(Player)
	MoveCity(Player, PTB.Conf.MapName, CopyID)
	
	local PlayerNum									= GetMapCopyPlayerNum(MapCopy)
	BeginGetMapCopyPlayerCha(MapCopy)
	for i = 1, PlayerNum, 1 do
		local Player									= GetMapCopyNextPlayerCha(MapCopy)
		if (ValidCha(Player) == 1) then
			local PID								= GetRoleID(Player)
			if PTB.MapCopy[CopyID].Players[PID].deadtimer < 1 then
				PTB.MapCopy[CopyID].Players[PID].deadtimer = PTB.Conf.SpawnTimer
			end
		end
	end
end
PTB.AddPoint 										= function(MapCopy, Team, Point)
	local CopyID 									= GetMapCopyID2(MapCopy)
	if Team == "Green" then
		PTB.MapCopy[CopyID].Green.Score 				= PTB.MapCopy[CopyID].Green.Score + Point
	elseif Team == "Red" then
		PTB.MapCopy[CopyID].Red.Score 				= PTB.MapCopy[CopyID].Red.Score + Point
	end
end
PTB.GiveRewards 									= function(Player, Reward)
	if Reward.Gold > 0 then
		AddMoney(Player, 0, Reward.Gold)
	end
	if Reward.Reputation > 0 then
		AddCreditX(Player, 0, Reward.Reputation)
	end
	if Reward.Honor > 0 and CheckBagItem(Player, 3849) == 1 then
		local Medal 								= GetChaItem2(Player, 2, 3849)
		local Honor 								= Reward.Honor + GetItemAttr(Medal, ITEMATTR_VAL_STR)
		SetItemAttr(Medal, ITEMATTR_VAL_STR, Honor)
	end	
	for i 										= 1, table.getn(Reward.Items), 1 do
		if Reward.Items[i].ID ~= 0 then
			if GetChaFreeBagGridNum(Player) > 0 then
				GiveItem(Player, 0, Reward.Items[i].ID, Reward.Items[i].Quantity, Reward.Items[i].Quality)
			else
				GiveItemX(Player, 0, Reward.Items[i].ID, Reward.Items[i].Quantity, Reward.Items[i].Quality)
			end
		end
	end
	local Level 									= Lv(Player)
	if Reward.EXP > 0 and Level < PTB.Conf.ServerLv then
		local CurrentEXP 						= GetChaAttr(Player, ATTR_CEXP) + ((DEXP[Level+1] - DEXP[Level]) * (Reward.EXP/100))
		SetChaAttrI(Player, ATTR_CEXP, CurrentEXP)
	end	
end
PTB.Finish 											= function(MapCopy)
	MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Этот матч подошел к концу, надеюсь, вам понравилось!")
	local CopyID 									= GetMapCopyID2(MapCopy)
	local PlayerNum									= GetMapCopyPlayerNum(MapCopy)
	BeginGetMapCopyPlayerCha(MapCopy)
	for i = 1, PlayerNum, 1 do
		local Player									= GetMapCopyNextPlayerCha(MapCopy)
		if (ValidCha(Player) == 1) then
			local SideID								= GetChaSideID(Player)
			if SideID == PTB.MapCopy[CopyID].Winner then
				PTB.GiveRewards(Player, PTB.Rewards[SideID])
			end
		end
	end
	PTB.MapCopy[CopyID] 							= nil
	CloseMapCopy(PTB.Conf.MapName, CopyID)	
end
TakeOutSide											= function(Player)
	MoveCity(Player, "")
end
PTB.WaitFunc 										= function()
	local Self 										= {}
	Self.Push 										= function(Player)
		table.insert(PTB.WaitList, Player)
	end
	Self.ReturnSize 								= function()
		return table.getn(PTB.WaitList)
	end
	Self.CheckIsEmpty 								= function()
		return table.getn(PTB.WaitList) == 0
	end
	Self.UpdateList 								= function()
		for a = 1, Self.ReturnSize(), 1 do
			if IsPlayer(PTB.WaitList[a]) ~= 1 or IsPlayer(PTB.WaitList[a]) == nil then
				table.remove(PTB.WaitList, a)
			end
		end
	end
	Self.CheckList 									= function(Player)
		Self.UpdateList()
		for b = 1, Self.ReturnSize(), 1 do
			if PTB.WaitList[b] == Player then
				return 1
			end
		end
		return 0
	end
	Self.NextInLine 								= function()
		Self.UpdateList()
		return PTB.WaitList[1]
	end
	Self.GetPlayer 									= function()
		Self.UpdateList()
		return table.remove(PTB.WaitList, 1)
	end
	return Self
end
PTB.OpenDay						= function()
	local RegOpen				= {Day = {}, Hour = {}}
	for i,v in pairs(PTB.Conf.OpenDay) do
		RegOpen.Day[v]			= true
	end
	if (RegOpen.Day[tonumber(os.date("%w"))] == true) then
		return 1
	end
	return 0
end
PTB.OpenHour					= function()
	local RegOpen				= {Day = {}, Hour = {}}
	for i,v in pairs(PTB.Conf.OpenHour) do
		RegOpen.Hour[v]			= true
	end
	if (RegOpen.Hour[tonumber(os.date("%H"))] == true) then
		return 1
	end	
	return 0
end
PTB.Register 										= function(Player)
	local Func 										= PTB.WaitFunc()
	Func.UpdateList()
	if Func.CheckList(Player) == 1 then
		BickerNotice(Player, "Вы уже в списке ожидания, будьте терпеливы.")
		return
	end
	if PTB.OpenDay() == 0 then
		BickerNotice(Player, "Регистрация для "..PTB.Conf.MapName.." сегодня он недоступен, пожалуйста, приходите снова завтра.")
		return
	end
	if PTB.OpenHour() == 0 then
		BickerNotice(Player, "Регистрация для "..PTB.Conf.MapName.." в этот час он недоступен, пожалуйста, приходите позже.")
		return
	end		
	if IsInTeam(Player) == 1 then
		BickerNotice(Player, "Вы находитеь в отряде,регистрация не возомжна!")
		return
	end
	if PTB.Conf.MinLv > GetChaAttr(Player, ATTR_LV) or (PTB.Conf.MaxLv ~= 0 and PTB.Conf.MaxLv < GetChaAttr(Player, ATTR_LV)) then
		BickerNotice(Player, "Только игроки с уровнем от "..PTB.Conf.MinLv.." до "..PTB.Conf.MaxLv.." могут участвовать.")
		return
	end	
	if PTB.Log(Player, 2) == 0 then
		BickerNotice(Player, "У вас не осталось попыток на сегодня.")
		return
	end	
	Func.Push(Player)
	BickerNotice(Player, "Ваша регистрация успешна  "..PTB.Conf.MapName.." пожалуйста дождитесь старта!.")
end