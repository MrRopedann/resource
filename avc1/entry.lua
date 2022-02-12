--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "\207\243\241\242\251\237\237\251\229 \194\238\233\237\251"
    SetMapEntryEventName( entry, EntryName )


    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
   -- Notice("[\216\224\233\242\224\237] \239\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\255\226\232\235\241\255 \239\238\240\242\224\235 \226 [\207\243\241\242\251\237\237\251\229 \194\238\233\237\251] ") --通知本组服务器的所有玩家

end

function after_destroy_entry_avc1(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
   -- Notice("[\216\224\233\242\224\237] \239\238\240\242\224\235 \226 [\207\243\241\242\251\237\237\251\229 \194\238\233\237\251] \231\224\234\240\251\235\241\255 ") 

end

function after_player_login_avc1(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
   -- ChaNotice(player_name, "Announcement: Deep Blue ["..posx..","..posy.."] emerges a portal to [Kaldron Wars].") --通知本组服务器的所有玩家

end






function check_can_enter_avc1( role, copy_mgr )
	
end

function check_HasMoney(role)
	
end


function begin_enter_avc1(role, copy_mgr) 
	
end







