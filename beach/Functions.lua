if not Beach then
	Beach 									= {}
	Beach.MapCopy 							= {}
	Beach.Conf 								= {}
	Beach.Conf.Time 						= {}
	Beach.Conf.Balance 						= {}
	Beach.Conf.Boss 						= {}
	Beach.Rewards 							= {}
	Beach.Rewards.Boss 						= {}
	Beach.Rewards.Boss.Items 				= {}
end
dofile(GetResPath("beach/Configuration.lua"))
Beach.Log 									= function(Team, Type)
	local PID 								= GetRoleID(Team)
	local Table 								= Beach.Conf.SavePath..PID..".txt"
	local Date 								= (tonumber(os.date("%Y")) * 10000) + (tonumber(os.date("%m")) * 100) + (tonumber(os.date("%d")))
	local Value 								= 0
	local Log 								= nil
	if file_exists(Table) == false then
		Log 								= {}
		table.save(Log, Table)
	end
	Log 									= table.load(Table)
	if Log[Date] == nil then
		Log[Date] 							= 0
	end
	if Type == 2 then
		if Beach.Conf.PerDay == 0 or Log[Date] < Beach.Conf.PerDay then
			Value 							= 1
		end
	end
	if Type == 3 then
		Log[Date] 							= Log[Date] + 1
	end
	table.save(Log, Table)
	return Value
end
Beach.StartDungeon 							= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)
	if Beach.MapCopy[CopyID].Active == true then
		MapCopyNotice(MapCopy, Beach.Conf.MapName..": \211\225\229\233\242\229 \226\241\229\245 \236\238\237\241\242\240\238\226 \231\224 20 \236\232\237\243\242\247\242\238 \225\251 \239\240\232\231\226\224\242\252 \193\238\241\241\224 \232 \239\240\238\233\242\232 \207\235\255\230")  
		DealAllChaInCopy(MapCopy, "PopupNotice", ""..Beach.Conf.MapName.." \211\225\229\233\242\229 \226\241\229\245 \236\238\237\241\242\240\238\226 \231\224 20 \236\232\237\243\242\247\242\238 \225\251 \239\240\232\231\226\224\242\252 \193\238\241\241\224 \232 \239\240\238\233\242\232 \207\235\255\230")
		Beach.SummonMobs(MapCopy)
		Beach.MapCopy[CopyID].Time.Map 		= Beach.Conf.Time.Map
	end
end
Beach.AvailableCopy 						= function()
	local Value 							= 0
	for a = 1, Beach.Conf.NumMapCopy, 1 do
		if Beach.MapCopy[a] == nil or Beach.MapCopy[a].Initiate == false then
			Value 							= a
			break
		end
	end
	return Value
end
Beach.StartMapCopy 							= function(CopyID)
	LG("Sandy Beach", "Copy ID:", CopyID)
	Beach.MapCopy[CopyID] 					= {}
	Beach.MapCopy[CopyID].Time 				= {}
	Beach.MapCopy[CopyID].Monster 			= {}
	
	Beach.MapCopy[CopyID].Initiate 			= false
	Beach.MapCopy[CopyID].Active 			= false
	Beach.MapCopy[CopyID].BossSummoned 		= 0
	Beach.MapCopy[CopyID].Shutdown 			= 0	
	
	Beach.MapCopy[CopyID].Time.Init 			= 0
	Beach.MapCopy[CopyID].Time.Map 			= 0
	
	Beach.MapCopy[CopyID].Monster[Beach.Conf.Mob.id] = 0	
end
Beach.SummonMobs 							= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)
	local Pos 								= math.random(1, 360)
	local MobID 								= Beach.Conf.Mob.id
	for i = 1, 25 do			
		local Mob 							= CreateChaEx(MobID, math.random(33,78) * 100, math.random(27,250) * 100, Pos, 50000, MapCopy)
		local Mob 							= CreateChaEx(MobID, math.random(132,175) * 100, math.random(32,265) * 100, Pos, 50000, MapCopy)
		local Mob 							= CreateChaEx(MobID, math.random(227,270) * 100, math.random(39,256) * 100, Pos, 50000, MapCopy)
		SetChaLifeTime(Mob, 1200000)
	end
	Beach.MapCopy[CopyID].Monster[MobID] 	= 0
end
Beach.canSummonBoss 						= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)
	local Completed 							= 0
	local TotalKilled 						= Beach.MapCopy[CopyID].Monster[Beach.Conf.Mob.id]
	local NeedKill 							= Beach.Conf.Mob.qty
	if Beach.MapCopy[CopyID].BossSummoned == 0 then
		if TotalKilled >= NeedKill then
			Completed 						= Completed + 1
		end
	end
	if Completed == 1 then
		return 1
	end
	return 0
end
Beach.SummonBoss 							= function(MapCopy)
	ClearAllSubMapMonster(MapCopy)		
	local CopyID 							= GetMapCopyID2(MapCopy)
	local X,Y 								= 245,66
	local Pos 								= math.random(1,360)
	local BOSS 								= CreateChaEx(Beach.Conf.Boss.Id, X * 100, Y * 100, Pos, 50000, MapCopy)
	SetChaLifeTime(BOSS, 300000)	
	DealAllChaInCopy(MapCopy, "PopupNotice", "\193\206\209\209: ["..GetMonsterName(Beach.Conf.Boss.Id).."] \239\238\255\226\232\235\241\255 \239\238 \234\238\238\240\228\232\237\224\242\224\236 ("..X..","..Y..")")
	Beach.MapCopy[CopyID].BossSummoned 		= 1
end
BeachRemoveSoloCha 							= function(Player)
	if (IsInTeam(Player) == 0) then
		MapCopyNotice(MapCopy, Beach.Conf.MapName..": "..GetChaDefaultName(Player).." \239\238\234\232\237\243\235 \239\235\255\230")  
		MoveCity(Player, "")
	end
end
Beach.CloseMapCopy 							= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)
	Beach.MapCopy[CopyID] 					= nil
	CloseMapCopy("beach", CopyID)
	ClearAllSubMapCha(MapCopy)
	ClearAllSubMapMonster(MapCopy)	
end
Beach.MapFinish 							= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)	
	if Beach.MapCopy[CopyID].Shutdown > 0 then
		for i = 1, table.getn(Beach.Conf.Time.CloseShow) do
			if Beach.MapCopy[CopyID].Shutdown == Beach.Conf.Time.CloseShow[i] then
				DealAllChaInCopy(MapCopy, "BickerNotice", ""..Beach.Conf.MapName.." \239\240\238\233\228\229\237,\226\241\229 \232\227\240\238\234\232 \225\243\228\229\242 \226\238\231\226\240\224\249\229\237\251 \226 \227\238\240\238\228 \247\229\240\229\231 "..Beach.MapCopy[CopyID].Shutdown.." \241\229\234\243\237\228!")
			end
		end
		Beach.MapCopy[CopyID].Shutdown 		= Beach.MapCopy[CopyID].Shutdown - 1
		if Beach.MapCopy[CopyID].Shutdown == 0 then
			DealAllChaInCopy(MapCopy, "MoveCity", "")
			Beach.CloseMapCopy(MapCopy)
		end
	end
end
Beach.DungeonTick 							= function(MapCopy)
	local CopyID 							= GetMapCopyID2(MapCopy)	
	for i = 1, table.getn(Beach.Conf.Time.CloseShow) do
		if Beach.MapCopy[CopyID].Time.Map == Beach.Conf.Time.CloseShow[i] then
			DealAllChaInCopy(MapCopy, "BickerNotice", "\206\241\242\224\235\238\241\252 \226\240\229\236\229\237\232: "..ToClockFormat(Beach.MapCopy[CopyID].Time.Map).."!")
		end
	end
end
Beach.DungeonFailed 						= function(MapCopy)
	DealAllChaInCopy(MapCopy, "BickerNotice", "Your team failed ["..Beach.Conf.MapName.."]!")
	Beach.CloseMapCopy(MapCopy)
	DealAllChaInCopy(MapCopy, "MoveCity", "")
end
Beach.PlayerKilledMonster 					= function(Monster, Killer)
	local MapCopy 							= GetChaMapCopy(Killer)
	local CopyID 							= GetMapCopyID2(MapCopy)
	if GetChaMapName(Killer) == "beach" then
		if Beach.MapCopy[CopyID] ~= nil then 
			if Beach.MapCopy[CopyID].Monster[GetChaID(Monster)] ~= nil then
				Beach.MapCopy[CopyID].Monster[GetChaID(Monster)] = Beach.MapCopy[CopyID].Monster[GetChaID(Monster)] + 1
				local qtyc 					= 0
				if GetChaID(Monster) == Beach.Conf.Mob.id then
					qtyc 					= Beach.Conf.Mob.qty
				end
				DealAllChaInCopy(MapCopy, "BickerNotice", "\194\241\229\227\238 ["..Beach.Conf.MapName.." \236\238\237\241\242\240\238\226] \243\225\232\242\238: "..Beach.MapCopy[CopyID].Monster[GetChaID(Monster)].." !")				
			end
			-- BOSS Rewards to party members
			if GetChaID(Monster) == Beach.Conf.Boss.Id then
				local Team 					= {Killer, GetTeamCha(Killer, 0), GetTeamCha(Killer, 1), GetTeamCha(Killer, 2), GetTeamCha(Killer, 3)}
				for i,v in pairs(Team) do
					Beach.GiveRewards(v, Beach.Rewards.Boss)
				end
				MapCopyNotice(MapCopy, "\193\206\209\209: ["..GetMonsterName(Beach.Conf.Boss.Id).."] \225\251\235 \243\225\232\242!")				
				Beach.MapCopy[CopyID].Shutdown = Beach.Conf.Time.Close
			end
		end
	end
end
Beach.GiveRewards 							= function(Player, Reward)
	if Reward.Gold > 0 then
		AddMoney(Player, 0, Reward.Gold)
	end
	if Reward.Reputation > 0 then
		AddCreditX(Player, Reward.Reputation)
	end
	if Reward.Honor > 0 and CheckBagItem(Player, 3849) == 1 then
		local Medal 						= GetChaItem2(Player, 2, 3849)
		local Honor 						= Reward.Honor + GetItemAttr(Medal, ITEMATTR_VAL_STR)
		SetItemAttr(Medal, ITEMATTR_VAL_STR, Honor)
	end	
	if Reward.Items ~= nil then
		if GetChaFreeBagGridNum(Player) > 0 then
			local ItemID 					= Reward.Items[math.random(1,table.getn(Reward.Items))].ID
			local Quantity 					= Reward.Items[math.random(1,table.getn(Reward.Items))].Quantity
			local Quality 					= Reward.Items[math.random(1,table.getn(Reward.Items))].Quality
			GiveItem(Player, 0, ItemID, Quantity, Quality)
			PopupNotice(Player, "\207\238\235\243\247\229\237\238 "..Quantity.."x "..GetItemName(ItemID))
		else
			GiveItemX(Player, 0, ItemID, Quantity, Quality)
			PopupNotice(Player, "\207\238\235\243\247\229\237\238 "..Quantity.."x "..GetItemName(ItemID))
		end
	end
	local Level 							= Lv(Player)
	if Reward.EXP > 0 and Level < Beacj.Conf.ServerLv then
		local CurrentEXP 					= GetChaAttr(Player, ATTR_CEXP) + ((DEXP[Level+1] - DEXP[Level]) * (Reward.EXP/100))
		SetChaAttrI(Player, ATTR_CEXP, CurrentEXP)
	end	
end
Beach.MapBalance							= function(Player)
	if (GetChaMapName(Player) == "beach") then
		local Job 							= GetChaAttr(Player, ATTR_JOB)
		if (Beach.Conf.Balance[Job] ~= nil) then
			local mf_final 					= Mf_final(Player)	
			local crt_final 				= Crt_final(Player)
			local hrec_final 				= Hrec_final(Player)
			local srec_final 				= Srec_final(Player)
			local adis_final 				= Adis_final(Player)
			SetCharaAttr(Beach.Conf.Balance[Job].Max.HP, Player, ATTR_MXHP)
			SetCharaAttr(Beach.Conf.Balance[Job].Max.SP, Player, ATTR_MXSP)
			SetCharaAttr(Beach.Conf.Balance[Job].Attack.Min, Player, ATTR_MNATK)
			SetCharaAttr(Beach.Conf.Balance[Job].Attack.Max, Player, ATTR_MXATK)
			SetCharaAttr(Beach.Conf.Balance[Job].Defense, Player, ATTR_DEF )
			SetCharaAttr(Beach.Conf.Balance[Job].PhysicalResist, Player, ATTR_PDEF) 
			SetCharaAttr(Beach.Conf.Balance[Job].HitRate, Player, ATTR_HIT )
			SetCharaAttr(Beach.Conf.Balance[Job].Dodge, Player, ATTR_FLEE)
			SetCharaAttr(mf_final, Player, ATTR_MF )
			SetCharaAttr(crt_final, Player, ATTR_CRT )
			SetCharaAttr(hrec_final, Player, ATTR_HREC )
			SetCharaAttr(srec_final, Player, ATTR_SREC )
			SetCharaAttr(adis_final, Player, ATTR_ADIS )
			SetCharaAttr(Beach.Conf.Balance[Job].MoveSpeed, Player, ATTR_MSPD )
			SetCharaAttr(100000/Beach.Conf.Balance[Job].Attack.Speed, Player, ATTR_ASPD )	
		end
	end
end
Beach.NotActive 							= function(Player)
	local MapCopy 							= GetChaMapCopy(Player)
	local CopyID 							= GetMapCopyID2(Player)
	if Beach.MapCopy[CopyID] ~= nil then
		if Beach.MapCopy[CopyID].Active == true then
			return LUA_FALSE
		end
	end
	return LUA_TRUE
end
Beach.Activate 								= function(Player) 
	local MapCopy 							= GetChaMapCopy(Player)
	local CopyID 							= GetMapCopyID2(MapCopy)
	if IsTeamLeader(Player) == 1 then
		Beach.MapCopy[CopyID].Active 		= true
		Beach.StartDungeon(MapCopy)
	else
		BickerNotice(Player, "\210\238\235\252\234\238 \235\232\228\229\240 \238\242\240\255\228\224 \236\238\230\229\242 \224\234\242\232\226\232\240\238\226\224\242\252 \207\235\255\230")
		return LUA_FALSE
	end
	return LUA_TRUE
end
Beach.ClassRestrict 						= function(Player, Count)
	local Team 								= {Player, GetTeamCha(Player, 0), GetTeamCha(Player, 1), GetTeamCha(Player, 2), GetTeamCha(Player, 3)}
	local Valid 							= 0
	for i = 1, table.getn(Team) do
		local ChaJob 						= GetChaAttr(Team[i], ATTR_JOB)
		Valid 								= 1
		for i = i + 1, table.getn(Team) do
			if GetChaAttr(Team[i], ATTR_JOB) == ChaJob then
				Valid 						= Valid + 1
			end
		end
		if Valid >= Count then 
			break
		else 
			Valid 							= 0
		end
	end
	if Valid >= Count then
		return 0
	end
	return 1
end
Beach.OpenDay								= function()
	local RegOpen							= {Day = {}, Hour = {}}
	for i,v in pairs(Beach.Conf.OpenDay) do
		RegOpen.Day[v]						= true
	end
	if (RegOpen.Day[tonumber(os.date("%w"))] == true) then
		return 1
	end
	return 0
end
Beach.OpenHour								= function()
	local RegOpen							= {Day = {}, Hour = {}}
	for i,v in pairs(Beach.Conf.OpenHour) do
		RegOpen.Hour[v]						= true
	end
	if (RegOpen.Hour[tonumber(os.date("%H"))] == true) then
		return 1
	end	
	return 0
end
Beach.InRegion								= function(Team)
	local Valid								= 0
	local MapName							= GetChaMapName(Team[1])
	for i = 1, table.getn(Team) do
		if (GetChaMapName(Team[i]) == MapName) then
			Valid							= Valid + 1
		end
	end
	return Valid				== table.getn(Team)
end
Beach.IsNearby								= function(Player, Team)
	local Valid								= 0
	for i,v in pairs(Team) do
		if (get_distance(Player, v) <= Beach.Conf.Distance) then
			Valid							= Valid + 1
		end
	end
	return Valid				== table.getn(Team)
end
Beach.Register 								= function(Player)
	if IsInTeam(Player) == 0 then
		HelpInfo(Player, 0, "\194\251 \237\229 \241\238\241\242\238\232\242\229 \226 \238\242\240\255\228\229,\240\229\227\232\241\242\240\224\246\232\255 \237\229 \226\238\231\236\238\230\237\224!")
		return
	end
	if IsTeamLeader(Player) == 0 then
		HelpInfo(Player, 0, "\194\251 \237\229 \235\232\228\229\240 \238\242\240\255\228\224,\240\229\227\232\241\242\240\224\246\232\255 \237\229 \226\238\231\236\238\230\237\224!")
		return
	end
	local Team 								= {Player, GetTeamCha(Player, 0), GetTeamCha(Player, 1), GetTeamCha(Player, 2), GetTeamCha(Player, 3)}
	if table.getn(Team) < Beach.Conf.Member then
		HelpInfo(Player, 0, "\194\251 \228\238\235\230\237\251 \232\236\229\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 ["..Bech.Conf.Member.."] \247\229\235\238\226\229\234 \226 \238\242\240\255\228\229")
		return
	end
	if not Beach.InRegion(Team) then
		HelpInfo(Player, 0, "\194\241\229 \247\235\229\237\251 \238\242\240\255\228\224 \228\238\235\230\237\251 \225\251\242\252 \240\255\228\238\236")
		return
	end
	if not Beach.IsNearby(Player, Team) then
		HelpInfo(Player, 0, "\194\241\229 \247\235\229\237\251 \238\242\240\255\228\224 \228\238\235\230\237\251 \225\251\242\252 \240\255\228\238\236")
		return
	end
	if not Beach.OpenDay() then
		HelpInfo(Player, 0, "Fukei: Registering for "..Beach.Conf.MapName.." Dungeon is unavailable today, please come back again tommorow.")
		return
	end
	if not Beach.OpenHour() then
		HelpInfo(Player, 0, "Fukei: Registering for "..Beach.Conf.MapName.." Dungeon is unavailable at this hour, please come back later.")
		return
	end	
	if Beach.ClassRestrict(Player, Beach.Conf.Class) == 0 then
		HelpInfo(Player, 0, "\205\229\235\252\231\255 \247\242\238 \225\251 \225\251\235\238 \225\238\235\252\248\229 "..Beach.Conf.Class.." \232\227\240\238\234\238\226 \238\228\237\238\227\238 \234\235\224\241\241\224")
		return
	end	
	local CopyID = Beach.AvailableCopy()
	if CopyID == 0 then
		HelpInfo(Player, 0, "\202\224\240\242\224 \243\230\229 \231\224\237\255\242\224,\239\238\228\238\230\228\232\242\229 \239\238\234\224 \238\242\240\255\228 \231\224\234\238\237\247\232\242!")
		return
	end
	for i = 1, table.getn(Team) do
		if Beach.Log(Team[i], 2) == 0 then
			HelpInfo(Player, 0, "\215\235\229\237 \238\242\240\255\228\224 "..Beach.Conf.MapName.." \243\230\229 \239\238\241\229\249\224\235 \239\235\255\230 \241\229\227\238\228\237\255.")
			return
		else
			Beach.Log(Team[i], 3)
			MoveCity(Team[i], Beach.Conf.MapName, CopyID)			
		end	
	end
	Beach.StartMapCopy(CopyID)
	Beach.MapCopy[CopyID].Initiate 			= true	
	Notice("["..Beach.Conf.MapName.."]: "..GetChaDefaultName(Player).." \232 \229\227\238 \234\238\236\224\237\228\224 \231\224\248\235\224 \237\224 \207\235\255\230")	
end