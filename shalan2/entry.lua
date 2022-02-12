function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)
end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
	local EntryName = " Пустыня "
	SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
end

function after_destroy_entry_shalan2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
end

function after_player_login_shalan2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "По координатам ["..posx..","..posy.."] портал в Пустыню ")
end

function check_can_enter_shalan2( role, copy_mgr )
	local i = IsChaStall(role)
	if i == LUA_TRUE then
		PopupNotice(role, "Не возможно телепортироваться! ")
		return 0    
	end
	if Lv(role) < 150 then
		SystemNotice(role, "Персонаж должен иметь 150 уровень(или выше), чтобы попасть в Пустыню! ")
		return 0    
	end
	if Lv(role) > 9000 then
		SystemNotice(role, "Персонаж не должен быть выше 9000 уровня, чтобы попасть в Пустыню! ")
		return 0    
	end
	local Num
	Num = CheckBagItem(role,2326)
	if Num < 1 then
		SystemNotice(role, "Отсутствует талон на вход.")	
		return 0
	end
end

function begin_enter_shalan2(role, copy_mgr)
	local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 2326, 1)
	
	if Dbag == 1 then
		SystemNotice(role,"Вы вошли в Пустыню ") 
		MoveCity(role, "Shaitan Mirage")
	else
		SystemNotice(role, "У вас нет талона на вход. Вы не можете попасть в Пустыню! ")
	end
end