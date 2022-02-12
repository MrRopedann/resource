--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "\196\238\235\232\237\224 \194\243\235\234\224\237\238\226"
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_volcanoisle(entry)

end

function after_player_login_volcanoisle(entry, player_name)
    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    --ChaNotice(player_name, "Announcement: According to reports, near Kyjj Arena 3  at ["..posx..","..posy.."] appears a portal to Volcano Island. Please check it out.") --通知本组服务器的所有玩家

end

--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_volcanoisle(role, copy_mgr)

end



function begin_enter_volcanoisle(role, copy_mgr) 

		SystemNotice(role,"\194\251 \226\238\248\235\232 \237\224 \206\241\242\240\238\226 \194\243\235\234\224\237\238\226 ") 
		MoveCity(role, "volcanoisle")

end