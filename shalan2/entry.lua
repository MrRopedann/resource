function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)
end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
	local EntryName = " ������� "
	SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
end

function after_destroy_entry_shalan2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
end

function after_player_login_shalan2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "�� ����������� ["..posx..","..posy.."] ������ � ������� ")
end

function check_can_enter_shalan2( role, copy_mgr )
	local i = IsChaStall(role)
	if i == LUA_TRUE then
		PopupNotice(role, "�� �������� �����������������! ")
		return 0    
	end
	if Lv(role) < 150 then
		SystemNotice(role, "�������� ������ ����� 150 �������(��� ����), ����� ������� � �������! ")
		return 0    
	end
	if Lv(role) > 9000 then
		SystemNotice(role, "�������� �� ������ ���� ���� 9000 ������, ����� ������� � �������! ")
		return 0    
	end
	local Num
	Num = CheckBagItem(role,2326)
	if Num < 1 then
		SystemNotice(role, "����������� ����� �� ����.")	
		return 0
	end
end

function begin_enter_shalan2(role, copy_mgr)
	local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 2326, 1)
	
	if Dbag == 1 then
		SystemNotice(role,"�� ����� � ������� ") 
		MoveCity(role, "Shaitan Mirage")
	else
		SystemNotice(role, "� ��� ��� ������ �� ����. �� �� ������ ������� � �������! ")
	end
end