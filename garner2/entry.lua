--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺����after_destroy_entry_testpk
--���ļ�ÿ������ַ�����Ϊ255���������飬�������̽��

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) --���õ�ͼ���ʵ��ı�ţ��ñ�Ŷ�Ӧ��characterinfo.txt��������

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --��������������󣬴˺���������ʽ��ڵĵ�ͼ�б�����ã�������ʽ��ڵĵ�ͼ���������ս����Ҫ���øýӿ�

	local EntryName = " \213\224\238\241 "
	SetMapEntryEventName( entry, EntryName )
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    Notice("\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \226 \213\224\238\241") --֪ͨ������������������

end

function after_destroy_entry_garner2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("\207\238\240\242\224\235 \226 \213\224\238\241 \231\224\234\240\251\235\241\255") 

end

function after_player_login_garner2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ȡ��ͼ��ڵ�λ����Ϣ����ͼ�������꣬Ŀ���ͼ����
    ChaNotice(player_name, "\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \226 \213\224\238\241") --֪ͨ������������������

end



function check_can_enter_garner2( role, copy_mgr )
	local FightingBook_Num = 0
	FightingBook_Num = CheckBagItem( role,3849 )
	local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "\194 \238\242\240\255\228\229 \237\229\235\252\231\255" )
		return 0
		
	end
	if FightingBook_Num <= 0 then
		SystemNotice ( role , "\241\238\230\224\235\229\237\232\254, \243 \226\224\241 \237\229\242 \204\229\228\224\235\232 \206\242\226\224\227\232 " )
		return 0
	elseif FightingBook_Num > 1 then
		LG("RYZ_PK","����֧ҧ�֧��� 1 ���֧էѧݧ� ����ӧѧԧ� ")
		return 0
	end
	local role_RY = GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)

	if HonorPoint < 0 then
		SystemNotice ( role , "You do not have enough honour to enter Chaos Argent" )
		return 0
	end

	if HonorPoint >500000 then
		SystemNotice ( role , "You cannot enter Chaos Argent you have to much Honour" )
		return 0
	end

	local Credit_Garner2 = GetCredit(role)
	 if Credit_Garner2 < 0 then 
		SystemNotice ( role , "\205\243\230\237\238 0 \240\229\239\243\242\224\246\232\232 " )
		return 0
	--else
--		DelCredit(role,30)
	end

	if Lv(role) < 20 then
	SystemNotice(role, "You must be above level 20 to enter Chaos Argent")
		return 0    
	end		
local Has_money = check_HasMoney(role)
	if Has_money == 1 then
		return 1
	else
		SystemNotice(role,"\205\229 \245\226\224\242\224\229\242 \231\238\235\238\242\224 \228\235\255 \226\245\238\228\224 ")
		return 0
	end
end

function check_HasMoney(role)
	local lv= GetChaAttr(role, ATTR_LV)
	local Money_Need = lv*100
	local Money_Have = GetChaAttr ( role , ATTR_GD )
		if Money_Have >= Money_Need then
		return 1
		end
end

function begin_enter_garner2(role, copy_mgr) 
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local lv= GetChaAttr(role, ATTR_LV)
	local Money_Need = lv*100
	local Money_Now = Money_Have - Money_Need
	SetChaAttrI( role , ATTR_GD , Money_Now )
	DelCredit(role,30)
	SystemNotice(role,"\194\231\237\238\241 \231\224 \226\245\238\228 "..Money_Need.." \231\238\235\238\242\224 ") 
	MoveCity( role, "Chaos Argent" )
	Money_all = Money_all + Money_Need * 0.8
end








