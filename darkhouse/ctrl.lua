function config(map)
    MapCanSavePos(map, 0)
    MapCanPK(map, 1) 
    MapCanTeam( map, 0 )
    MapType( map , 4 )
    MapCopyNum(map, 1) 
    SingleMapCopyPlyNum(map, 300)   
    MapCanTeam(map , 1)
    MapCanStall(map , 0)
end

function get_map_entry_pos_garner2()   

	local POS_X=1300
	local POS_Y=534
	return POS_X , POS_Y

end

function init_entry(map)

    SetMapEntryMapName(map, "darkblue") 
    SetMapEntryTime(map, "2006/10/18/14/0", "2/0/0", "0/0/30", "0/0/45") 

end