--------------------------------------------------------------------------
--									--
--									--
--		EventEntity.lua 					--
--									--
--定义各个地图上的事件实体						--
--------------------------------------------------------------------------
print( "Loading Kisles EventEntity.lua" )


--初始化深蓝大陆的事件实体信息
function InitKislesEntity()

	CreateBerthEntity( "Docked", 455, 2, 69700,43400,-10, 154, 670,426, 0 )
	CreateBerthEntity( "Docked", 455, 2, 57700,56700,-10, 155, 589,571, 0 )
	CreateBerthEntity( "Docked", 455, 2, 96100,76100,-10, 153, 973,763, 0 )

end

InitKislesEntity()

