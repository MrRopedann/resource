print( "Loading Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0)
    MapCanPK(map, 1)
	MapCopyNum(map, 1)
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 3 )
end

function get_map_entry_pos_shalan2()

	local POS_X=701
	local POS_Y=825
	return POS_X , POS_Y
end

function init_entry(map)
    SetMapEntryMapName(map, "magicsea")
    SetMapEntryTime(map, "2010/7/28/0/0", "0/0/0", "0/0/0", "0/0/0")
end

function map_run_shalan2( map )

end

function map_copy_run_shalan2(map_copy)

end