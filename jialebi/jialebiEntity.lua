--------------------------------------------------------------------------
--									--
--									--
--		EventEntity.lua Created by knight 2005.5.16.		--
--									--
--定义各个地图上的事件实体						--
--------------------------------------------------------------------------
print( "Loading Jialebi EventEntity.lua" )


--初始化加纳大陆的事件实体信息
function InitGarnerEntity()

	--创建加勒比港口实体
	CreateBerthEntity( "Docked", 455, 2, 63614, 91411, -10, 12, 631, 927, 0 )
	CreateBerthEntity( "Docked", 455, 2, 65411, 100611,-10, 12, 658,993, 0 )
	CreateBerthEntity( "Docked", 455, 2, 62411, 62811,-10, 12, 612,622, 0 )
	CreateBerthEntity( "Docked", 455, 2, 38011, 15611,-10, 12, 370,165, 0 )
	CreateBerthEntity( "Docked", 455, 2, 108200, 22500,-10, 12, 1082,211, 0 )



end

InitGarnerEntity()