--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading InfernalAbyss Ctrl.lua" )


function config(map)
    MapCanSavePos(map, 0) 
    MapCanPK(map, 1) 
    MapCanTeam( map, 1 )
    MapType( map , 3 )
    MapCopyNum(map, 60) 
    SingleMapCopyPlyNum(map, 300)  
    MapCanStall(map , 0)
end

function get_map_entry_pos_InfernalAbyss()
	SetMapEntryTime(map, "2006/10/18/14/0", "0/24/0", "0/24/0", "0/24/0")
end

function init_entry(map)
end

function after_enter_InfernalAbyss( role , map_copy )
end

function before_leave_InfernalAbyss( role )
end

function map_copy_run_special_InfernalAbyss( map_copy ) 
end

function map_run_InfernalAbyss(map)
end

function map_copy_run_InfernalAbyss( map )
local copy = GetMapCopyID2(map)
local playersIn = GetMapCopyPlayerNum(map) 
	if(playersIn == 0)then
		return 0
	end
	-- Timer --
	if(Instance.tick[copy] == nil)then
		Instance.tick[copy] = 1
		else
		Instance.tick[copy] = Instance.tick[copy] + 1
		if(Instance.tick[copy] >= (Instance.timer * 60))then
			Instance_FuncAll(Instance.players[copy],"BickerNotice","Failed clearing all waves within "..Instance.timer.." minutes! challenge canceled!")
			Instance_FuncAll(Instance.players[copy],"MoveCity","")
		end
	end
	-- Main Scripts --
	local waveid = Instance.waveNow[copy]
	local party = Instance.players[copy]
	if(Instance.monsters[copy][waveid] == nil)then
		if waveid == 1 then
			if(Instance.waveDelay[copy] == nil)then
				Instance.waveDelay[copy] = 11
			end
			Instance.waveDelay[copy] = Instance.waveDelay[copy] - 1
				Instance_FuncAll(Instance.players[copy]," \207\229\240\226\224\255 \226\238\235\237\224 \247\229\240\229\231 "..Instance.waveDelay[copy].." \241\229\234\243\237\228,\239\240\232\227\238\242\238\226\252\242\229\241\252! ")
				if(Instance.waveDelay[copy] <= 0)then
					Instance:spawnWave(map,waveid)
					Instance.waveDelay[copy] = 5
				end
			else
			Instance:spawnWave(map,waveid)
		end
	else
		if(Instance:AllDead(copy,waveid) == 1)then
			if(Instance.waveDead[copy][waveid] == nil)then
					if(Instance.waveDelay[copy] == nil)then
						if(Instance.boss[Instance.waveNow[copy] + 1] == true)then
							Instance_FuncAll(Instance.players[copy],"BickerNotice","Wave No."..waveid.." is defeated! Abyss Demon - Efreet is spawning!")
							else
							if(Instance:MaxWave(copy) == 0)then
								if(Instance.boss[Instance.waveNow[copy] + 1] ~= true)then
									Instance_FuncAll(Instance.players[copy]," \205\229\226\238\231\236\238\230\237\238! "..waveid.." \193\238\241\241 \239\238\226\229\240\230\229\237! ")--Need to improve text/talk
								end
								if(Instance.boss[Instance.waveNow[copy]] == true)then
									Instance_FuncAll(Instance.players[copy],"Instance_Reward",waveid)
								end
							end
						end
					end
					if(Instance:MaxWave(copy) == 1)then
						if(Instance.closeCount[copy] == nil)then
							Instance_FuncAll(Instance.players[copy],"BickerNotice","Congratulations! You have cleared the trials!")--Need to improve text/talk
							Instance.closeCount[copy] = 30
							if(Instance.boss[Instance.waveNow[copy]] == true)then
								Instance_FuncAll(Instance.players[copy],"BickerNotice","Demon Efreet: This icy feeling is the feeling of death? It has been 3 thousand years since I have experienced it, imbecile mortals! Killing me does not change anything! There will always be greed, despair and misery! I will be back one day!")
								Instance_FuncAll(Instance.players[copy],"Instance_Reward",waveid)
							end
						end
						else
						if(Instance.waveDelay[copy] == nil)then
							Instance.waveDelay[copy] = 6
						end
						Instance.waveDelay[copy] = Instance.waveDelay[copy] - 1
						Instance_FuncAll(Instance.players[copy],"BickerNotice"," \194\238\235\237\224 \247\229\240\229\231 "..Instance.waveDelay[copy].." \241\229\234\243\237\228 ")
						if Instance.waveDelay[copy] <= 0 then
							Instance.waveDead[copy][waveid] = true
							Instance.waveNow[copy] = Instance.waveNow[copy] + 1
							Instance.waveDelay[copy] = nil
						end
					end
					if(Instance.closeCount[copy] ~= nil)then
						Instance.closeCount[copy] = Instance.closeCount[copy] - 1
						Instance_FuncAll(Instance.players[copy],"BickerNotice","Warning! [Infernal Abyss] will collapse in "..Instance.closeCount[copy].." seconds! All adventurer prepare to hide!")
						if(Instance.closeCount[copy] <= 0)then
							Instance_FuncAll(Instance.players[copy],"MoveCity","")
						end
					end
			end
		end
	end
end

function map_copy_before_close_InfernalAbyss( map_copy )
end

function map_copy_close_InfernalAbyss( map_copy )
end