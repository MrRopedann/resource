--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Darkblue Ctrl.lua" )


--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀

function config(map)
    MapCanSavePos(map, 1) --гшг+|+=-||?ё-г+ц-|гл+?г+ги|+=-гм+°-ъгм?-|?гйгм+Tгшг+L-|ь?+|+=-|-T?L|?---
    MapCanPK(map, 1) --гшг+|+=-||?ё?гTLPKгм+Tгшг+L-|ь?+|+=-|-T?L|?---
    MapCopyNum(map, 1) --гшг+|+=-|-?---|¤-?гмLч|v-?|?L+?+Lя-фгмL?||L+-мL|г|1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 4 )

end

function get_map_entry_pos_darkblue()   --设置入口的位置的坐标（坐标（米））

end

function init_entry(map)

end

function after_enter_darkblue( role , map_copy )
end

function before_leave_darkblue( role )
end

function map_copy_first_run_darkblue( map_copy )

end

function map_copy_run_darkblue( map_copy )
end

--每5秒执行一次的
function map_run_darkblue( map )
end

--地图关闭时执行
function map_copy_close_darkblue ( map_copy )
end
		
--地图开关判断——————————————————————————————————————————

function can_open_entry_darkblue( map ) 
end 