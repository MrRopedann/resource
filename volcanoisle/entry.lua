--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�
    local EntryName = "\196\238\235\232\237\224 \194\243\235\234\224\237\238\226"
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_volcanoisle(entry)

end

function after_player_login_volcanoisle(entry, player_name)
    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    --ChaNotice(player_name, "Announcement: According to reports, near Kyjj Arena 3  at ["..posx..","..posy.."] appears a portal to Volcano Island. Please check it out.") --֪ͨ������������������

end

--���ڼ���������
--����ֵ��0�����������������1���ɹ����롣
function check_can_enter_volcanoisle(role, copy_mgr)

end



function begin_enter_volcanoisle(role, copy_mgr) 

		SystemNotice(role,"\194\251 \226\238\248\235\232 \237\224 \206\241\242\240\238\226 \194\243\235\234\224\237\238\226 ") 
		MoveCity(role, "volcanoisle")

end