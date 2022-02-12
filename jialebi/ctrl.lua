--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Jialebi Ctrl.lua" )


function config(map)
	MapCanSavePos(map, 0) 
	MapCanPK(map, 1) 
	MapCopyNum(map, 1) 
	MapCopyStartType(map, 1) 
    SingleMapCopyPlyNum(map, 300)   
    MapCanTeam(map , 1)
    MapType ( map , 4 )
end

function init_entry(map)

end


function map_run_jialebi( map )
end