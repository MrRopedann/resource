--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) 

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) 
    local EntryName = " ���� ������ "
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("����������: �� ����������� ["..posx..","..posy.."] �������� ������ � ���� ����� ������ ") 

end

function after_destroy_entry_deathcircle(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("����������: ������ �  [ ���� ����� ������ ] ��������. ������� �� ���������. �������� ����! ") 

end

function after_player_login_deathcircle(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ChaNotice(player_name, "����������: �� �����������  ["..posx..","..posy.."] �������� ������ � ���� ����� ������. ") 

end

function check_can_enter_deathcircle( role, copy_mgr )
        local FightingBook_Num = 0
        FightingBook_Num = CheckBagItem( role,3849 )
        local Team_In = IsInTeam(role)  if Team_In == 1 then
            SystemNotice ( role , "� ���� ����� ������ �������� � ������ ������, �������� " )
                return 0
        end
        if FightingBook_Num <= 0 then
                SystemNotice ( role , "� ��� ���� ������ ������ " )
            	return 0
        elseif FightingBook_Num > 1 then
                LG("RYZ_PK","�������� ������ 1 ������ �� ������ ")
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
		SystemNotice(role, "���� � ���� ������, �����: "..Money_Need.." ������ � 30 ���������. ") 
		MoveCity(role, "deathcircle")
Money_all = Money_all + Money_Need * 0.8
end








