--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Puzzleworld Ctrl.lua" )


--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀

function config(map)
    MapCanSavePos(map, 0)		-- 1 = Allow players to save respaw // 0 = Do not allow players to save respaw
    MapCanPK(map, 1)			-- 1 = Turns on PK Mouse Sword Icon // 0 = Turns off PK Mouse Sword Icon ( Need to press CTRL key )
    MapCopyNum(map, 1)			-- 1 Copy of the map will be generated by GameServer
    SingleMapCopyPlyNum(map, 300)	-- 300 Players are allowed to enter the map
    MapCanTeam(map , 1)			-- 1 = Allow players to create party // 0 = Do not allow players to create party
    MapType ( map , 4 )			-- 0 = PvP Off // 1 = PvP Off // 2 = PvP On ( Not allowed to kill Guild and Party Mates ) // 3 = PvP On ( Allowed to kill any player but not Party Mates ) // 4 = PvP On ( Not allowed to kill Guild and Party Mates )        
end


function get_map_entry_pos_puzzleworld()   --设置入口的位置的坐标（坐标（米））

	local POS_X=2168
	local POS_Y=2773
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "garner")					-- 设置入口的位置（地图名）
    SetMapEntryTime(map, "2011/3/29/0/0", "0/3/0", "0/2/0", "0/2/0")	-- The first set of numbers is the starting point (Year/Month/Day/Hour/Minute), next is opening interval (Day/Hour/Minute), portal open duration (Day/Hour/Minute), and last is the map duration (Day/Hour/Minute)

end
