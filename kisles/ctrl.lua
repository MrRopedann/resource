--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kisles Ctrl.lua" )


--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀

function config(map)
   
	MapCanSavePos(map, 1) --гшг+?+=-??ВЮ-г+ц-?гл+Вг+ги?+=-гм+?-ъгмВ-?ёгйгм+Tгшг+L-?ьВ+?+=-?-T?L?В---
    MapCanPK(map, 1) --гшг+?+=-??ВЮВгTLPKгм+Tгшг+L-?ьВ+?+=-?-T?L?В---
    MapCopyNum(map, 1) --гшг+?+=-?-В---?я-ВгмLч?v-В?ЩL+В+LЯ-фгмLё??L+-мL?г?1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 3 )
	
end


function get_map_entry_pos_kisles()   --设置入口的位置的坐标（坐标（米））

end

function init_entry(map)

end

function after_enter_kisles( role , map_copy )
end

function before_leave_kisles( role )
end

function map_copy_first_run_kisles( map_copy )

end

function map_copy_run_kisles( map_copy )
end

--每5秒执行一次的
function map_run_kisles( map )
end

--地图关闭时执行
function map_copy_close_kisles ( map_copy )
end
		
--地图开关判断——————————————————————————————————————————

function can_open_entry_kisles( map ) 
end 