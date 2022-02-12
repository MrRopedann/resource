print( "Loading magicsea" )
print( "Loading Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 1) 
    MapCanPK(map, 0) 
    MapCopyNum(map, 1) 
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 1 )

end

function map_run_magicsea( map )
	
end

function init_entry(map)

end

function after_enter_magicsea( role , map_copy )

end

function map_copy_run_special_magicsea( map_copy )

end

function before_leave_magicsea( role )

end

function map_copy_run_magicsea(map_copy)
 
end