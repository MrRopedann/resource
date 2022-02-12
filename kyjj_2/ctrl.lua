--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kyjj_2 Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0) --设置地图是否保存角色位置（地图，坐标，方向），此设置影响该地图的所有副本
    MapCanPK(map, 1) --设置地图是否可以PK，此设置影响该地图的所有副本
    MapCopyNum(map, 1) --设置地图的副本数目，如果不调用该语句，则使用默认值1
    SingleMapCopyPlyNum(map, 300)   --设置一个副本的玩家数
	MapCanTeam(map , 1)
    MapType ( map , 4 )
end


function get_map_entry_pos_kyjj_2()   --设置入口的位置的坐标（坐标（米））

end

function init_entry(map)
   
end

function after_enter_kyjj_2( role , map_copy )

local cha_name=GetChaDefaultName(role)

end

function before_leave_kyjj_2 ( role )

end

function map_copy_first_run_kyjj_2( map_copy )



end

function map_copy_run_kyjj_2( map_copy )



end

--每5秒执行一次的
function map_run_kyjj_2( map )


end

--地图关闭时执行
function map_copy_close_kyjj_2 ( map_copy )

end
		
--地图开关判断——————————————————————————————————————————

function can_open_entry_kyjj_2( map ) 

end 