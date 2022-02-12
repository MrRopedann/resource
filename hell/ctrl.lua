print( "‡ Јаг§Є  Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0) 
    MapCanPK(map, 1) 
    MapCopyNum(map, 1) 
    MapCopyStartType(map, 1) 
    SingleMapCopyPlyNum(map, 300)   
    MapCanTeam(map , 1)
    MapType ( map , 4 )
end

function get_map_entry_pos_hell()   

end

function init_entry(map)

end

function after_enter_hell( role , map_copy )
local cha_name=GetChaDefaultName(role)
	SystemNotice ( role, "Таинственный голос "..cha_name..",готов ли ты пройти Испытание? " ) 
end

function before_leave_hell ( role )

end

function map_copy_first_run_hell( map_copy )

end

function map_copy_run_hell( map_copy )

end


function map_run_hell( map )

end


function map_copy_close_hell ( map_copy )


end

function can_open_entry_hell( map ) 

end 	

function map_copy_run_special_hell( map_copy )

end