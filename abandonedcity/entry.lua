--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    Notice("����������: �� ���������� ["..posx..","..posy.."] �������� ������ � ���������� �����.") --֪ͨ������������������

    local EntryName = " ���������� ����� "
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_abandonedcity(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("����������: �� ���������� ["..posx..","..posy.."] �������� ������ � ���������� �����.") 

end

function after_player_login_abandonedcity(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    ChaNotice(player_name, "����������: �� ���������� ["..posx..","..posy.."] �������� ������ � ���������� �����.") --֪ͨ������������������

end

--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_abandonedcity(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=30 and Lv(Cha) <=45 then
	
		local Num
		Num = CheckBagItem(Cha, 1812)
        	
		if Num >= 1 then
			return 1
	
		else
			SystemNotice(role, "� ��� ���� ���������� �������!")
			return 0
		end
		
	else
		SystemNotice(role, "������ ��������� �� 30 �� 45 ��� ����� ����� � ���������� �����!")
		return 0    
	end
end



function begin_enter_abandonedcity(role, copy_mgr) 

		SystemNotice(role,"�� ����� � ���������� ����� ") 
		MoveCity(role, "Forsaken City")

end