function config(map)
	MapCanSavePos(map, 0)
	MapCanPK(map, 0)
	MapCopyNum(map, Beach.Conf.NumMapCopy)
	SingleMapCopyPlyNum(map, Beach.Conf.NumPlayer)
	MapCanTeam(map, 1)
	MapType(map, 1)
end
function get_map_entry_pos_beach()
	local PosX 										= 0
	local PosY 										= 0
	return PosX, PosY
end
function init_entry(map)
end
function after_enter_beach(Player, MapCopy)
end
function before_leave_beach(Player)
end
function map_run_beach(Map)
end
function map_copy_run_beach(MapCopy)
	local CopyID 									= GetMapCopyID2(MapCopy)
	if Beach.MapCopy[CopyID] ~= nil then 
		if GetMapCopyPlayerNum(MapCopy) ~= 0 then	
			DealAllActivePlayerInMap(MapCopy, "BeachRemoveSoloCha")	
			if Beach.canSummonBoss(MapCopy) == 1 then
				Beach.SummonBoss(MapCopy)
				return
			end
			if Beach.MapCopy[CopyID].Shutdown ~= 0 then
				Beach.MapFinish(MapCopy)
				return
			end
			if Beach.MapCopy[CopyID].Active == true then
				if Beach.MapCopy[CopyID].Time.Map == 0 then
					Beach.DungeonFailed(MapCopy)
					return
				else
					Beach.DungeonTick(MapCopy)
				end
			end	
			Beach.MapCopy[CopyID].Time.Map 			= Beach.MapCopy[CopyID].Time.Map - 1
		else
			Beach.CloseMapCopy(MapCopy)
			return
		end
	end
end