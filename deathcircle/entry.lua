--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) 

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) 
    local EntryName = " 署筱 鸯屦蜩 "
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("吾??怆屙桢: 镱 觐铕滂磬蜞? ["..posx..","..posy.."] 镱?忤腭? 镱痱嚯 ? 署筱 锗铖? 鸯屦蜩 ") 

end

function after_destroy_entry_deathcircle(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("吾??怆屙桢: 项痱嚯 ?  [ 署筱 锗铖? 鸯屦蜩 ] 桤麇玎弪. 央邃栩? 玎 眍忸耱?扈. 橡??蝽铋 桡瘥! ") 

end

function after_player_login_deathcircle(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ChaNotice(player_name, "吾??怆屙桢: 镱 觐铕滂磬蜞?  ["..posx..","..posy.."] 镱?忤腭? 镱痱嚯 ? 署筱 锗铖? 鸯屦蜩. ") 

end

function check_can_enter_deathcircle( role, copy_mgr )
        local FightingBook_Num = 0
        FightingBook_Num = CheckBagItem( role,3849 )
        local Team_In = IsInTeam(role)  if Team_In == 1 then
            SystemNotice ( role , "? 署筱 锗铖? 鸯屦蜩 玎躅滂螯 ? 沭箫镥 礤朦??, 桤忮龛蝈 " )
                return 0
        end
        if FightingBook_Num <= 0 then
                SystemNotice ( role , "? 忄? 礤蝮 戾溧腓 铗忄汨 " )
            	return 0
        elseif FightingBook_Num > 1 then
                LG("RYZ_PK","吾豚溧屮 犷朦 1 戾溧腓 玎 铗忄泱 ")
                return 0
        end        
	return 1
end 

function begin_enter_deathcircle(role, copy_mgr) 
	local	Money_Have = GetChaAttr ( role , ATTR_GD )
	local lv= GetChaAttr(role, ATTR_LV)
	local Money_Need = lv*50
	local	Money_Now = Money_Have - Money_Need
	SetChaAttrI( role , ATTR_GD , Money_Now )
	DelCredit(role,30)
		SystemNotice(role, "迈钿 ? 署筱 鸯屦蜩, 忡?蝾: "..Money_Need.." 珙腩蜞 ? 30 疱矬蜞鲨?. ") 
		MoveCity(role, "deathcircle")
Money_all = Money_all + Money_Need * 0.8
end








