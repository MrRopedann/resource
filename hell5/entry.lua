function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1)

end 

function after_create_entry(entry) 

    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = " ������� ��������� "
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
   -- Notice("���������: �� ����������� "["..posx..","..posy.."]" �������� ������,������� � ���������")

end

function after_destroy_entry_hell5(entry)
   -- map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Announcement: Challenge for today has ended.") 

end

function after_player_login_hell5(entry, player_name)

end


function check_can_enter_hell5( role, copy_mgr )

	Num = CheckBagItem(role,7786)
	if Num < 1 then
		SystemNotice(role, "����� ���� ��������� ")	
		return 0
	end

end

function begin_enter_hell5(role, copy_mgr) 
local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 7786, 1)
	
	if Dbag == 1 then
		SystemNotice(role,"�� ����� � ������� ��������� ") 
		MoveCity(role, "Eternal Abaddon")
	else
		SystemNotice(role, "� ��� ��� ������ �� ����. �� �� ������ ������� � �������!")
	end
end
	

