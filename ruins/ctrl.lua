--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Ruins Ctrl.lua" )



function config(map)
    MapCanSavePos(map, 0)						-- 1 = Allow players to save respaw // 0 = Do not allow players to save respaw
    MapCanPK(map, 0)							-- 1 = Turns on PK Mouse Sword Icon // 0 = Turns off PK Mouse Sword Icon ( Need to press CTRL key )
    MapCopyNum(map, 1)							-- 1 = Copy of the map will be generated by GameServer
    SingleMapCopyPlyNum(map, 150) 				-- 150 Players are allowed to enter the map
    MapCanTeam(map,1)							-- 1 = Allow players to create party // 0 = Do not allow players to create party
    MapType(map,1)								-- 0 = PvP Off // 1 = PvP Off // 2 = PvP On ( Not allowed to kill Guild and Party Mates ) // 3 = PvP On ( Allowed to kill any player but not Party Mates ) // 4 = PvP On ( Not allowed to kill Guild and Party Mates )        
end


function get_map_entry_pos_ruins()   
	local POS_X=680
	local POS_Y=866
	return POS_X , POS_Y
end

function init_entry(map)
	SetMapEntryMapName(map,"magicsea")
	SetMapEntryTime(map, "2012/10/18/12/0", "0/6/0", "0/1/0", "0/1/0")	-- The first set of numbers is the starting point (Year/Month/Day/Hour/Minute), next is opening interval (Day/Hour/Minute), portal open duration (Day/Hour/Minute), and last is the map duration (Day/Hour/Minute)

end

function after_enter_ruins(role,map_copy)
	local cha_name = GetChaDefaultName(role)
	local rand = math.random(1,2)
		if rand == 1 then
		SystemNotice(role,"\223 \230\228\243 \242\229\225\255 "..cha_name.." \239\238\234\224\230\232 \247\242\238 \243\236\229\229\248\252" )
		elseif rand == 2 then
		SystemNotice(role,"\193\243\228\252\242\229 \227\238\242\238\226\251 \243\236\229\240\229\242\252")
	end
end	

function map_run_ruins(map)

end

function map_copy_run_ruins(map_copy)
		if Ruins[1] == 1 then
			if Ruins[2] == 0 then
			MapCopyNotice(map_copy,"Devil Barr: Your Despero will start now!")
			CreateCha(1252,8400,3200,145,10800)
				Ruins[2] = Ruins[2] + 1
			end
		end	
		
		if Ruins[2] == 1 then
			if RUINSCLOSETIME == 1800 then
			Notice("Now kill the last Boss Devil Barr, you have 1 hour for kill hin, after time end map will close.")
		end	
		
		local closenotice = RUINSCLOSETIME
			for i = 1 , RUINSMAXNOTICE , 1 do
				if closenotice == RUINSNOTICETIME[i] then
				MapCopyNotice(map_copy,"You have "..math.floor(closenotice/60).." minute(s) for kill Devil Barr after time end, map will close.")
			end
		end
		RUINSCLOSETIME = RUINSCLOSETIME - 1
		
		if RUINSCLOSETIME == 0 then

			RUINSCLOSETIME = 1800
			Ruins[1] = 0
			Ruins[2] = 0
			CloseMapEntry("ruins")
			CloseMapCopy("ruins")
				end
		end
end
	

function map_copy_close_ruins(map_copy)
	ClearAllSubMapCha(map_copy)
			RUINSCLOSETIME = 1800
			Ruins[1] = 0
			Ruins[2] = 0	
end


function map_copy_run_special_ruins(map_copy)

end

function can_open_entry_ruins(map)

end	