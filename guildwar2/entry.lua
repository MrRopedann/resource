function config_entry(entry) 
    SetMapEntryEntiID(entry,193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("����������: � ������� ����� ������  ["..posx..","..posy.."] �������� ������ � [����-��������� �����]. ������ ��� ������� � 45 �� 64 �������!")


    
--local copy_mgr = GetMapEntryCopyObj(entry, 0)
--    SetMapCopyParam(copy_mgr, 1, 3)
--    SetMapCopyParam(copy_mgr, 2, 2)
--    SetMapCopyParam(copy_mgr, 3, HaiJunSide) 
--    SetMapCopyParam(copy_mgr, 4, HaiDaoSide)
--    SetMapCopyParam(copy_mgr, 5, 0)
--    FinishSetMapEntryCopy(entry, 1) 

    --local RedSideName = GetGuildName( RedSide_GuildID ) 
    --local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    local EntryName = "������ � ����-��: [����] ������ [�������] (45-64 �������)"
    SetMapEntryEventName( entry, EntryName )
    
    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    --Notice("�����㲥��������ս�����ڿ�ʼ�������˫�������ǣ������ "["..RedSideName.."]"��������ս��"["..BlueSideName.."]"��˫������ĳ�Ա����ͨ��ħŮ֮��"["..posx..","..posy.."]"�������н��뾺����԰")

end

function after_destroy_entry_guildwar2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("����������: ������ � [����-��������� �����] ��������!") 

end

function after_player_login_guildwar2(entry, player_name)
--    local copy_mgr = GetMapEntryCopyObj(entry, 1) 
--    local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
--    local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )
--    local RedSideName = GetGuildName( RedSide_GuildID ) 
--    local BlueSideName = GetGuildName( BlueSide_GuildID ) 

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
   ChaNotice(player_name, "��������� ����������: � ������� ����� ������ ["..posx..","..posy.."] ��� ��������� ������ � [����-��������� �����] (45-64 �������)!")

end



function check_can_enter_guildwar2( role, copy_mgr )

local FightingBook_Num = 0
      FightingBook_Num = CheckBagItem( role,3849 )

if FightingBook_Num <= 0 then
		SystemNotice(role,"�� �� ������ ����� � ��������� �����, ��������� � ���� ���� ������ ������. ���������� ������ �� � �������������� ����� � �������.")
		--Notice("You cannot enter Sacred war without Medal of Valor. Please obtain your Medal of Valor from Arena Administrator first")
		return 0
	elseif FightingBook_Num > 1 then
		LG("RYZ_PK","Possess more than 1 Medal of Valor")
		return 0
	end

local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "�� ���������� � ������, ������� �� ������ ����� � ����-��������� �����." )
		return 0
		
	end



	--local Cha = TurnToCha(role)

    --local RedSide_GuildID = GetMapCopyParam(copy_mgr, 3 )
    --local BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4 )



 if  GetChaGuildID(role) == 0 then
	

     SystemNotice(role,"������, �� ����� ������� � ����-��������� ����� ���� ����� ���� ���� �� ��������, ���� � ��������� �������!")
     return 0
		
	
elseif Lv(role) < 45 or Lv(role) > 64  then

	SystemNotice(role, "� ����-��������� ����� ����� ����� ������ ��������� 45-64 ������.")
	     return 0    
	end


        local Num_1= CheckBagItem(role,4661)
	if Num_1 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ������ ��� �������, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_2= CheckBagItem(role,4546)
	if Num_2 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ����������� ����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_3= CheckBagItem(role,1684)
	if Num_3 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ������� ��������� �������, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_4= CheckBagItem(role,1683)
	if Num_4 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� �������� ����������� �������, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_5= CheckBagItem(role,4012)
	if Num_5 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ����������� �����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_6= CheckBagItem(role,4013)
	if Num_6 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� �������� �������, ����� ����� � ����-��������� �����.")	
		return 0
	end

        local Num_7= CheckBagItem(role,2964)
	if Num_7 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ���� �����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_8= CheckBagItem(role,3001)
	if Num_8 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ��������� ����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_9= CheckBagItem(role,4011)
	if Num_9 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ���������� ����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_10= CheckBagItem(role,1720)
	if Num_10 >= 1 then
		SystemNotice(role, "����������, ����� �� ������ ������� ���� �����, ����� ����� � ����-��������� �����.")	
		return 0
	end

	local Num_11= CheckBagItem(role,2382)
	if Num_11 < 1 then
		SystemNotice(role, "����������, ����� ����� � ����-��������� ����� ����� ���� ����� � ������, ��� �� ������ �������� � ���, ������� ����� �� ����.")	
		return 0
	end

end

function begin_enter_guildwar2(role, copy_mgr) 

--local role_RY = GetChaItem2 ( role , 2 , 3849 )
--local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)
--local HonorPoint_now = HonorPoint - 15
--
--	if HonorPoint < 15 then
--		SystemNotice ( role , "You do not have enough honor points to enter Sacred War" )
--		return 0
--	else
--
--	SetItemAttr( role_RY , ITEMATTR_VAL_STR , HonorPoint_now )
--	        
--	end

    --local RedSide_GuildID, BlueSide_GuildID
    --RedSide_GuildID = GetMapCopyParam(copy_mgr, 3)
    --BlueSide_GuildID = GetMapCopyParam(copy_mgr, 4)

     local Cha = TurnToCha(role)
     if  GetChaGuildID(Cha) <= 100 and GetChaGuildID(Cha) > 0 then
	     if count_haijun2 < 45 then
	        
	        SystemNotice(role,"���� � [����-��������� �����]")
		MoveCity(role, "guildwarnavyside2")
                count_haijun2 = count_haijun2 + 1
	      else 
	        SystemNotice(role,"������� ����� ���������.")
	      end
	
     end	        
		
     if GetChaGuildID(Cha) > 100 and GetChaGuildID(Cha) <= 200 then
             if count_haidao2 < 45 then
	        SystemNotice(role,"���� � [����-��������� �����].")
		MoveCity(role, "guildwarpirateside2")
		count_haidao2=count_haidao2 + 1
	     else
	        SystemNotice(role,"������� ������� ���������.")
	     end

     end 
end