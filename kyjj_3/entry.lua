--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口

    local EntryName = " 祟泐忸 葩屙蝾� "
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("吾��怆屙桢: � 礼赅痤礤 ["..posx..","..posy.."] 镱�忤腭� 镱痱嚯 � [祟泐忸 葩屙蝾鈃.")

end

function after_destroy_entry_leiting2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("吾��怆屙桢: 项 桁妣轳� 桧纛痨圉梃, 镱痱嚯 � [祟泐忸 葩屙蝾鈃 桉麇�!") 

end

function after_player_login_leiting2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --吾��怆屙�� 钺 铗牮梃 镱痱嚯� � 惕疣� 灭铎钽疣溧.
    ChaNotice(player_name, "吾��怆屙桢: � 礼赅痤礤 ["..posx..","..posy.."] 镱�忤腭� 镱痱嚯 � [祟泐忸 葩屙蝾鈃.")

end










--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_kyjj_3( role, copy_mgr )
	if Lv(role) < 60 then
		SystemNotice(role, "襄瘃铐噫� 恹 60 脞� 礤 漕矬耜帼蝰� � 祟泐忸 葩屙蝾� ")
		return 0    
	end
end

function begin_enter_kyjj_3(role, copy_mgr) 
    
		SystemNotice(role,"蔓 忸� � 祟泐忸 葩屙蝾�! 馏潼蝈 铖蝾痤骓� 蝮� 铒囫眍! ") 
		MoveCity(role, "Cultivation of the land")

end