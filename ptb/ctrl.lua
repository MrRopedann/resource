function config(map)
	MapCanSavePos(map, 0)
	MapCanPK(map, 1)
	if PTB.Conf.ServerVersion ~= 2 then
		MapCopyNum(map, PTB.Conf.NumMapCopy)
	end
	SingleMapCopyPlyNum(map, PTB.Conf.NumPlayer)
	MapCanTeam(map, 0)
	MapType(map, PTB.Conf.MapType)
end
function get_map_entry_pos_ptb()
	local PosX 										= 0
	local PosY 										= 0
	return PosX, PosY
end
function init_entry(map)
end
function after_enter_ptb(Player, MapCopy)
	local Message 									= ""		
	local CopyID 									= GetMapCopyID2(MapCopy)
	-- Get player information
	local PID 										= GetRoleID(TurnToCha(Player))
	-- Set the player's side
	if (PTB.MapCopy[CopyID].Players[PID].side_id == 0) then
		-- Red Team
		SetChaSideID(TurnToCha(Player), 2)
		-- Show some messages
		if (PTB.MapCopy[CopyID].Players[PID].entered	== LUA_FALSE) then
			PTB.MapCopy[CopyID].Players[PID].entered = LUA_TRUE
			Message 								= AdjustTextSpace(">> МИННОЕ ПОЛЕ <<", 42, "_")
			Message 								= Message.."Вы в крассной команде!_"
			Message 								= Message.."* Заменируйте бомбу в одной из зон взрыва и избегайте ее обезвреживания зеленой командой, чтобы получить очки._"
			Message 								= Message.."* Наберите 6 очков что бы выграть состязание.._"
			Message 								= Message.."* Убейте всех игроков из зеленой команды, чтобы выиграть битву._"
			HelpInfo(TurnToCha(Player), 0, Message)
		end
	else
		-- Green Team
		SetChaSideID(TurnToCha(Player), 1)
		-- Show some messages
		if (PTB.MapCopy[CopyID].Players[PID].entered	== LUA_FALSE) then
			PTB.MapCopy[CopyID].Players[PID].entered = LUA_TRUE
			Message 								= AdjustTextSpace(">> МИННОЕ ПОЛЕ <<", 42, "_")
			Message 								= Message.."Вы в зеленой команде!_"
			Message 								= Message.."* Избегайте бомбы, заложенние Красной командой, или обезвредьте ее, чтобы получить очко._"
			Message 								= Message.."* Наберите 6 очков что бы выграть состязание._"
			Message 								= Message.."* Убейте всех игроков из красной команды, чтобы выиграть битву._"
			HelpInfo(TurnToCha(Player), 0, Message)
		end	
	end
	PTB.Log(Player, 3)
end
function before_leave_ptb(Player)
	-- Get player information
	local MapCopy 									= GetChaMapCopy(Player)
	local CopyID 									= GetMapCopyID2(MapCopy)	
	local ChaName 									= GetChaDefaultName(Player)
	local TeamID 									= GetChaSideID(Player)
	-- Reduce the number of players
	if PTB.MapCopy[CopyID] ~= nil then
		if (TeamID == 2) then
			-- Reduce the number of players in Red Team
			PTB.MapCopy[CopyID].Red.Counter 		= PTB.MapCopy[CopyID].Red.Counter - 1
			MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: "..ChaName..", покинул Красную команду!")
		else
			-- Reduce the number of players in Green Team
			PTB.MapCopy[CopyID].Green.Counter 		= PTB.MapCopy[CopyID].Green.Counter - 1
			MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: "..ChaName..", покинул Зеленую команду")
		end
	end
end
function map_run_ptb(Map)
	local CopyID 									= PTB.AvailableCopy()
	local Func 										= PTB.WaitFunc()
	Func.UpdateList()
	if CopyID ~= 0 and Func.ReturnSize() >= PTB.Conf.NumPlayer then
		PTB.StartMapCopy(CopyID)
		PTB.MapCopy[CopyID].Initiate 				= true
		PTB.MapCopy[CopyID].Time.Init 				= PTB.Conf.Time.Init
		PTB.MapCopy[CopyID].Time.Round 				= PTB.Conf.Time.Round
		PTB.MapCopy[CopyID].Time.Map 				= PTB.Conf.Time.Map		
		for a = 1, PTB.Conf.NumPlayer, 1 do
			PTB.StartPlayer(Func.GetPlayer(), CopyID)
		end
		Notice("["..PTB.Conf.MapName.."]: Начался новый матч, игроки в списке ожидания были перемещены на назначенное поле.")
	end
end
function map_copy_run_ptb(MapCopy)
	local CopyID 									= GetMapCopyID2(MapCopy)
	if PTB.MapCopy[CopyID] ~= nil then
		if PTB.MapCopy[CopyID].Active == false then
			if PTB.MapCopy[CopyID].Time.Init ~= 0 then
				DealAllChaInCopy(MapCopy, "BickerNotice", "Countdown: "..(PTB.MapCopy[CopyID].Time.Init).."!")
				PTB.MapCopy[CopyID].Time.Init 		= PTB.MapCopy[CopyID].Time.Init - 1
			else
				PTB.MapCopy[CopyID].Active 			= true
				PTB.StartRound(MapCopy)
			end	
		end
		if PTB.MapCopy[CopyID].Active == true then
			local red_score 							= PTB.MapCopy[CopyID].Red.Score
			local green_score 						= PTB.MapCopy[CopyID].Green.Score			
			if (math.mod(PTB.MapCopy[CopyID].Time.Map, PTB.Conf.Time.Refresh) == 0 and PTB.MapCopy[CopyID].Time.Map > 0) then
				local Message 						= ""
				Message 							= "["..PTB.Conf.MapName.."]: Раунд "..PTB.MapCopy[CopyID].Round.."/6, Текущий счет Красныйх ["..red_score.."].Зеленых ["..green_score.."]!"
				DealAllChaInCopy(MapCopy, "BickerNotice", Message)
			end
			local bomb_zone_1 						= PTB.MapCopy[CopyID].BombZone1
			local bomb_zone_2 						= PTB.MapCopy[CopyID].BombZone2
			local bomb_status 						= PTB.MapCopy[CopyID].BombStatus
			local bomb_created 						= PTB.MapCopy[CopyID].Bomb	
			local red_inside 						= PTB.MapCopy[CopyID].Red.Counter
			local green_inside 						= PTB.MapCopy[CopyID].Green.Counter				
			-- Red team arealdy has reached 6 point(s), end battle
			if red_score > 5 then
				PTB.MapCopy[CopyID].Winner 			= 2
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Красная команда выигрывает битву. Счет: "..red_score.." и "..green_score.." очков!")
				PTB.Finish(MapCopy)
				DealAllActivePlayerInMap(MapCopy, "TakeOutSide")
				return						
			end
			-- Green team arealdy has reached 6 point(s), end battle
			if green_score > 5 then
				PTB.MapCopy[CopyID].Winner 			= 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда выигрывает битву. Счет: "..green_score.." и "..red_score.." очков!")
				PTB.Finish(MapCopy)
				DealAllActivePlayerInMap(MapCopy, "TakeOutSide")
				return						
			end				
			-- No players from green team alive in map, red team win battle
			if green_inside < 1 then
				PTB.MapCopy[CopyID].Winner 			= 2
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда покидает поле боя. Красная команда выигрывает игру!")				
				PTB.Finish(MapCopy)
				DealAllActivePlayerInMap(MapCopy, "TakeOutSide")
				return
			end
			-- No players from red team alive in map, green team win battle
			if red_inside < 1 then
				PTB.MapCopy[CopyID].Winner 			= 1
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Красная команда покидает поле боя. Зеленая команда выигрывает игру!")				
				PTB.Finish(MapCopy)
				DealAllActivePlayerInMap(MapCopy, "TakeOutSide")
				return
			end				
			------------
			--RED TEAM--
			------------
			-- 1. Check if a member from red team is in bomb zones and begin plant it
			if bomb_status < 1 and bomb_zone_1 < 1 and bomb_zone_2 < 1 then
				DealAllActivePlayerInMap(MapCopy, "BeginPlantTheBomb")
			end
			-- 2. Check if the bomb has been planted at zone 1 and summon it
			if bomb_created == nil and bomb_status < 1 and bomb_zone_2 < 1 and bomb_zone_1 > 0 then
				DealAllActivePlayerInMap(MapCopy, "PlantTheBombInZone_1")
			end
			-- 3. Check if the bomb has been planted at zone 2 and summon it
			if bomb_created == nil and bomb_status < 1 and bomb_zone_1 < 1 and bomb_zone_2 > 0 then
				DealAllActivePlayerInMap(MapCopy, "PlantTheBombInZone_2")
			end	
			--------------
			--GREEN TEAM--
			--------------
			-- 1. Check if the bomb has been summoned and planted at zone 1 to begin defuse it
			if bomb_created ~= nil and bomb_status == 1 and bomb_zone_1 == 1 and bomb_zone_2 == 0 then
				DealAllActivePlayerInMap(MapCopy, "BeginDefuseInZone_1")
			end
			-- 2. Check if the bomb has been summoned and planted at zone 2 to begin defuse it
			if bomb_created ~= nil and bomb_status == 1 and bomb_zone_2 == 1 and bomb_zone_1 == 0 then
				DealAllActivePlayerInMap(MapCopy, "BeginDefuseInZone_2")
			end
			if PTB.MapCopy[CopyID].Time.Map == 0 then
				PTB.Finish(MapCopy)
				return
			end
			if PTB.MapCopy[CopyID].Time.Round == 0 then			
				-- Bomb has not been planted, green team gains +1 point
				if bomb_created == nil and bomb_status < 1 and bomb_zone_1 < 1 and bomb_zone_2 < 1 then
					MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Бомба была заложена не Красной командой. Зеленая команда выиграет этот раунд!")
					PTB.AddPoint(MapCopy, "Green", 1)
				end
				-- Bomb in zone 1 has exploded, red team gains +1 point
				if bomb_created ~= nil and bomb_status > 0 and bomb_zone_1 == 1 then
					MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда не смогла вовремя обезвредить бомбу, предоставив [+1] очко красной команде!")
					PTB.AddPoint(MapCopy, "Red", 1)
					PTB.BombExplode(MapCopy)
					KillCha(PTB.MapCopy[CopyID].Bomb)
				end
				-- Bomb in zone 2 has exploded, red team gains +1 point
				if bomb_created ~= nil and bomb_status > 0 and bomb_zone_2 == 1 then
					MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Зеленая команда не смогла вовремя обезвредить бомбу, предоставив [+1] очко красной команде!")				
					PTB.AddPoint(MapCopy, "Red", 1)
					KillCha(PTB.MapCopy[CopyID].Bomb)
				end				
				PTB.StartRound(MapCopy)
			end			
			if PTB.MapCopy[CopyID].Time.Round <= 10 then
				MapCopyNotice(MapCopy, "["..PTB.Conf.MapName.."]: Раунд #"..PTB.MapCopy[CopyID].Round.." закончиться через "..PTB.MapCopy[CopyID].Time.Round.." секунд!")
			end	
			PTB.RevivePlayer(MapCopy)
			PTB.MapCopy[CopyID].Time.Map 			= PTB.MapCopy[CopyID].Time.Map - 1
			PTB.MapCopy[CopyID].Time.Round 			= PTB.MapCopy[CopyID].Time.Round - 1	
		end
	end
end