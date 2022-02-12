--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("吾��怆屙桢: 项 觐痄桧囹囔 ["..posx..","..posy.."] 项�忤腭� 镱痱嚯 � 青蝈��眄 妙痤�.") --通知本组服务器的所有玩家

    local EntryName = " 青蝈��眄 妙痤� "
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_abandonedcity(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("吾��怆屙桢: 项 觐痄桧囹囔 ["..posx..","..posy.."] 青牮�� 镱痱嚯 � 青蝈��眄 妙痤�.") 

end

function after_player_login_abandonedcity(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    ChaNotice(player_name, "吾��怆屙桢: 项 觐痄桧囹囔 ["..posx..","..posy.."] 项�忤腭� 镱痱嚯 � 青蝈��眄 妙痤�.") --通知本组服务器的所有玩家

end

--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_abandonedcity(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=30 and Lv(Cha) <=45 then
	
		local Num
		Num = CheckBagItem(Cha, 1812)
        	
		if Num >= 1 then
			return 1
	
		else
			SystemNotice(role, "� 忄� 礤蝮 缅礤疣蝾疣 酿邂龛�!")
			return 0
		end
		
	else
		SystemNotice(role, "翌朦觐 镥瘃铐噫� 铗 30 漕 45 脞� 祛泱� 忸轵� � 青蝈��眄 妙痤�!")
		return 0    
	end
end



function begin_enter_abandonedcity(role, copy_mgr) 

		SystemNotice(role,"蔓 忸� � 青蝈��眄 妙痤� ") 
		MoveCity(role, "Forsaken City")

end