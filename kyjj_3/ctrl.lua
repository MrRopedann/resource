--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kyjj_3 Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0) --设置地图是否保存角色位置（地图，坐标，方向），此设置影响该地图的所有副本
    MapCanPK(map, 1) --设置地图是否可以PK，此设置影响该地图的所有副本
    MapCopyNum(map, 1) --设置地图的副本数目，如果不调用该语句，则使用默认值1
    SingleMapCopyPlyNum(map, 300)   --设置一个副本的玩家数
	MapCanTeam(map , 1)
    MapType ( map , 4 )
end

function get_map_entry_pos_kyjj_3()   --设置入口的位置的坐标（坐标（米））

	local POS_X=2168
	local POS_Y=2803
	return POS_X , POS_Y
end


function init_entry(map)
    SetMapEntryMapName(map, "garner")					-- 设置入口的位置（地图名）
    SetMapEntryTime(map, "2011/3/29/0/0", "0/0/0", "0/0/0", "0/0/0")	-- The first set of numbers is the starting point (Year/Month/Day/Hour/Minute), next is opening interval (Day/Hour/Minute), portal open duration (Day/Hour/Minute), and last is the map duration (Day/Hour/Minute)

end
