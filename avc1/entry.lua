--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�
    local EntryName = "\207\243\241\242\251\237\237\251\229 \194\238\233\237\251"
    SetMapEntryEventName( entry, EntryName )


    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
   -- Notice("[\216\224\233\242\224\237] \239\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\255\226\232\235\241\255 \239\238\240\242\224\235 \226 [\207\243\241\242\251\237\237\251\229 \194\238\233\237\251] ") --֪ͨ������������������

end

function after_destroy_entry_avc1(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
   -- Notice("[\216\224\233\242\224\237] \239\238\240\242\224\235 \226 [\207\243\241\242\251\237\237\251\229 \194\238\233\237\251] \231\224\234\240\251\235\241\255 ") 

end

function after_player_login_avc1(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
   -- ChaNotice(player_name, "Announcement: Deep Blue ["..posx..","..posy.."] emerges a portal to [Kaldron Wars].") --֪ͨ������������������

end






function check_can_enter_avc1( role, copy_mgr )
	
end

function check_HasMoney(role)
	
end


function begin_enter_avc1(role, copy_mgr) 
	
end







