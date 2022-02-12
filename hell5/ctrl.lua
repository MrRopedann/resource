function config(map)
    MapCanSavePos(map, 0)
    MapCanPK(map, 1)
    MapCopyNum(map, 1)
    MapCopyStartType(map, 1)
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 4 )
end


function get_map_entry_pos_hell5()   --Координаты портала
	
	local POS_X=190
	local POS_Y=303
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "hell3")
    SetMapEntryTime(map, "2010/7/28/0/0", "0/0/0", "0/0/0", "0/0/0")
end

function after_enter_hell5( role , map_copy )


end

function before_leave_hell5 ( role )

end

function map_copy_first_run_hell5( map_copy )



end

function map_copy_run_hell5( map_copy )


end


function map_run_hell5( map )


end


function map_copy_close_hell5 ( map_copy )


end
	
function map_copy_run_special_hell5( map_copy )

end