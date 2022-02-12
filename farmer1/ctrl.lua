--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading farmer1 Ctrl.lua" )


--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀

function config(map)
     MapCanSavePos(map, 1) 
    MapCanPK(map, 1) 
    MapCopyNum(map, 1) 
    SingleMapCopyPlyNum(map, 300)   
    MapCanTeam(map , 1)
    MapType ( map , 3 )
end


function get_map_entry_pos_farmer1()   --设置入口的位置的坐标（坐标（米））

end

function init_entry(map)

end

function after_enter_farmer1( role , map_copy )
end

function before_leave_farmer1( role )
end

function map_copy_first_run_farmer1( map_copy )

end

function map_copy_run_farmer1( map_copy )
end

--每5秒执行一次的
function map_run_farmer1( map )
end

--地图关闭时执行
function map_copy_close_farmer1 ( map_copy )
end
		
--地图开关判断——————————————————————————————————————————

function can_open_entry_farmer1( map ) 
end 