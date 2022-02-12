print( "Loading Lonetower Ctrl.lua" )

function config(map)
	MapCanSavePos(map, 0)
	MapCopyNum(map, LoneInst.conf['maxcopy'])
	MapCanPK(map, 0)
	SingleMapCopyPlyNum(map, 5)
	MapCanTeam(map, 1)
	MapType(map, 4)
end

function init_entry(map)
 
end

function map_run_lonetower( map )

end

function after_enter_lonetower( role , map_copy )

end


function before_leave_lonetower( role )

end

function map_copy_run_lonetower( map_copy )

end

function map_copy_run_special_lonetower( map_copy )

end