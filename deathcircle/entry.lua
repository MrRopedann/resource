--ґЛОДјюЦРЈ¬·ІКЗїЙДЬ±»¶аґОЦґРРµДєЇКэЈ¬єЇКэГы¶јТЄјУЙПµШНјГыЗ°ЧєЈ¬Изafter_destroy_entry_testpk
--ґЛОДјюГїРРЧоґуЧЦ·ыёцКэОЄ255Ј¬ИфУРТмТйЈ¬ЗлУліМРтМЅМЦ

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) 

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) 
    local EntryName = " Круг Смерти "
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Обьявление: по координатам ["..posx..","..posy.."] появился портал в Круг Хаоса Смерти ") 

end

function after_destroy_entry_deathcircle(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Обьявление: Портал в  [ Круг Хаоса Смерти ] изчезает. Следите за новостями. Приятной игры! ") 

end

function after_player_login_deathcircle(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ChaNotice(player_name, "Обьявление: по координатам  ["..posx..","..posy.."] появился портал в Круг Хаоса Смерти. ") 

end

function check_can_enter_deathcircle( role, copy_mgr )
        local FightingBook_Num = 0
        FightingBook_Num = CheckBagItem( role,3849 )
        local Team_In = IsInTeam(role)  if Team_In == 1 then
            SystemNotice ( role , "В Круг Хаоса Смерти заходить в группе нельзя, извените " )
                return 0
        end
        if FightingBook_Num <= 0 then
                SystemNotice ( role , "У вас нету медали отваги " )
            	return 0
        elseif FightingBook_Num > 1 then
                LG("RYZ_PK","Обладаеш больше 1 медали за отвагу ")
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
		SystemNotice(role, "Вход в Круг Смерти, взято: "..Money_Need.." золота и 30 репутации. ") 
		MoveCity(role, "deathcircle")
Money_all = Money_all + Money_Need * 0.8
end








