print("* Loading UpgradeSystem.lua" )

function can_tichun_item(...)
	if arg.n ~= 10 and arg.n ~= 14 then
		SystemNotice(arg[1], "Parameter value illegal."..arg.n)
		return 0
	end
	local Check = 0
	Check = can_tichun_item_main(arg)
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_tichun_item_main(Table)
	local Player = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}										
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Now, ItemCount_Now, ItemBagCount_Num = Read_Table(Table)
	if ItemCount[0] ~= 1 or ItemCount[1] ~= 1 or ItemBagCount[0] ~= 1 or ItemBagCount[1] ~= 1 then
		SystemNotice(Player,"������ ���������! �������� �������������!")
		return 0
	end
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])
	local ItemType_mainitem = GetItemType(ItemMain)
	local ItemType_otheritem = GetItemType(ItemCatalyst)
	local ItemMainID = GetItemID(ItemMain)
	local ItemCatalystID = GetItemID(ItemCatalyst)
	local ItemMainID_Lv = GetItemLv(ItemMain)
	local ItemCatalystID_Lv = GetItemLv(ItemCatalyst)
	local MainID = ItemMainID		
	local CatalystID = ItemCatalystID
	-- �������� �� ������ �����
	-- ������������ ���-�� ������� �����
	if (MainID >= 5202 and MainID <= 5226) then
		local perebor
		for perebor in ScrollGems do
			if (MainID == ScrollGems[perebor][1]) then
				local gem_id = ScrollGems[perebor][2]
				local gem_lv = 1
				-- ��������� ������� ������ �� ���
				if (ItemType_otheritem == 1 or ItemType_otheritem == 2 or ItemType_otheritem == 3 or ItemType_otheritem == 4 or ItemType_otheritem == 7 or ItemType_otheritem == 9 or ItemType_otheritem == 11 or ItemType_otheritem == 20 or ItemType_otheritem == 22 or ItemType_otheritem == 23 or ItemType_otheritem == 24 or ItemType_otheritem == 25 or ItemType_otheritem == 26 or ItemType_otheritem == 27) then
					-- �������� ���� ��������
					-- ����� ������� �� �������� ����������
					local forgeItem = ItemCatalyst
					--������ ��������� ����� �� ��������
					local forgeItemParam = GetItemForgeParam(forgeItem,1)
					-- ��������� ��������� �� ����������� ������
					forgeItemParam = TansferNum(forgeItemParam)
					-- ������� ����� � �������
					local Item_Stone = {}
					local Item_StoneLv = {}
					-- ���������� ��� ����������
					local SocketCount = 0
					local FinalForgeLv = 0
					-- ����� ��������� �����
					forgeItemParam = TansferNum(forgeItemParam)
					-- ������ �������� � 1 �����
					Item_Stone[0] = GetNum_Part2(forgeItemParam)
					SystemNotice(Player, "gemid="..Item_Stone[0])
					-- ������ ������� ��������� � 1 �����
					Item_StoneLv[0] = GetNum_Part3(forgeItemParam)
					-- ������ �������� � 2 �����
					Item_Stone[1] = GetNum_Part4(forgeItemParam)
					SystemNotice(Player, "gemid="..Item_Stone[1])
					-- ������ ������� ��������� � 2 �����
					Item_StoneLv[1] = GetNum_Part5(forgeItemParam)
					-- ������ �������� � 3 �����
					Item_Stone[2] = GetNum_Part6(forgeItemParam)
					SystemNotice(Player, "gemid="..Item_Stone[2])
					-- ������ ������� ��������� � 3 �����
					Item_StoneLv[2] = GetNum_Part7(forgeItemParam)
					-- ���������, ���� �� �������� � �������
					--if(ScrollGems[perebor][3] ~= nil) then

					--else
					--	SystemNotice(Player, "�� ������� � ��������� ���������? ")
					--	return 0
					--end
					local NeedsSlot = 0
					-- �������� �� ���������� ������� ��������� � ���������� ��� �����
					-- ���������, ���� �� ��������� �������� � ����� �� ������.
					if(ScrollGems[perebor][3] == Item_Stone[0]) then
						NeedsSlot = 0
						Item_Stone[0] = ScrollGems[perebor][3]
						Item_StoneLv[0] = Item_StoneLv[0]
					elseif(ScrollGems[perebor][3] == Item_Stone[1]) then
						NeedsSlot = 1
						Item_Stone[1] = ScrollGems[perebor][3]
						Item_StoneLv[1] = Item_StoneLv[1]
					elseif(ScrollGems[perebor][3] == Item_Stone[2]) then
						NeedsSlot = 2
						Item_Stone[2] = ScrollGems[perebor][3]
						Item_StoneLv[2] = Item_StoneLv[2]
					-- ���� �� � ����� ����� �������� �� ������
					-- ���� � ������ ����� �����, ��...
					elseif (Item_Stone[0] == 0) then
						NeedsSlot = 0
						Item_Stone[0] = ScrollGems[perebor][3]
						Item_StoneLv[0] = Item_StoneLv[0]
					elseif (Item_Stone[1] == 0) then
						NeedsSlot = 1
						Item_Stone[1] = ScrollGems[perebor][3]
						Item_StoneLv[1] = Item_StoneLv[1]
					elseif (Item_Stone[2] == 0) then
						NeedsSlot = 2
						Item_Stone[2] = ScrollGems[perebor][3]
						Item_StoneLv[2] = Item_StoneLv[2]
					end

					-- �������, ������� ����� ������ �� ������� ���������(1��)*(����� ������� ���������� � ���� ������)
					local Need_Money = ScrollGems.Money * (Item_StoneLv[0]+Item_StoneLv[1]+Item_StoneLv[2]+gem_lv)
					-- ��������� ������� ������ � ��������� �� ������� 1 ������� * �� ������� ���������
					if (GetChaAttr ( Player , ATTR_GD) >= Need_Money) then
						TakeMoney( Player , 0, Need_Money)
						TakeItem ( Player , 0 , ItemMainID , 1 )
					else
						HelpInfo(Player, 0, "----------------- ���� -----------------_��� ���������:_����: ["..GetItemName(GetItemID(forgeItem)).."]_�������� ����: [+"..Item_StoneLv[0]+Item_StoneLv[1]+Item_StoneLv[2]+gem_lv.."]_���������� ������: ["..Need_Money.."]_----------------------------------------")
						return 0
					end
					if (NeedsSlot == 0) then
						-- ��������� �������� ������ ����
						forgeItemParam = SetNum_Part2(forgeItemParam, Item_Stone[NeedsSlot])
						--� ������� ����, ��� ��� ������, �� +1
						forgeItemParam = SetNum_Part3(forgeItemParam, Item_StoneLv[NeedsSlot]+gem_lv)
						SystemNotice(Player, "������ 1 ����... ")
					elseif (NeedsSlot == 1) then
						-- ��������� �������� ������ ����
						forgeItemParam = SetNum_Part4(forgeItemParam, Item_Stone[NeedsSlot])
						--� ������� ����, ��� ��� ������, �� +1
						forgeItemParam = SetNum_Part5(forgeItemParam, Item_StoneLv[NeedsSlot]+gem_lv)
						SystemNotice(Player, "������ 2 ����... ")
					elseif (NeedsSlot == 2) then
						-- ��������� �������� ������ ����
						forgeItemParam = SetNum_Part6(forgeItemParam, Item_Stone[NeedsSlot])
						--� ������� ����, ��� ��� ������, �� +1
						forgeItemParam = SetNum_Part7(forgeItemParam, Item_StoneLv[NeedsSlot]+gem_lv)
						SystemNotice(Player, "������ 3 ����... ")
					end

					-- ��������� ������� ���������. ���� �� < 9 , �� ���������
					if (Item_StoneLv[NeedsSlot] <= 9) then     
						SetItemForgeParam(forgeItem, 1, forgeItemParam)
						SystemNotice(Player, "���������! ")
					else
						SystemNotice(Player, "�� �������� ������������� ������ ���������! ")
						return 0
					end
					-- ������� ���� � ������� ������ � ����������, ����� ������� ���� � ���.
					if (Item_Stone[NeedsSlot] ~= 0 and Item_StoneLv[NeedsSlot] ~= 0) then
						SocketCount = SocketCount + 1
						FinalForgeLv = Item_StoneLv[NeedsSlot] + gem_lv
					end
					-- ���� ������ ������ 0
					if (SocketCount > 0) then
						-- ������ ����� � ��������
						local Socket = GetItemForgeParam(forgeItem, 1)
						-- ��������� � �����
						Socket = TansferNum(Socket)
						Socket = SetNum_Part1(Socket, SocketCount)
						-- ��������� ���� � ��������
						SetItemForgeParam(forgeItem, 1, Socket)
					end
					-- ������ ��������� ������� �����.
					if (FinalForgeLv > 0) then
						SystemNotice(Player,"������� �������� �� + "..FinalForgeLv.."!")
						GMNotice(GetChaDefaultName(Player).." �������� ["..GetItemName(GetItemID(forgeItem)).."] �� [+"..FinalForgeLv.."]")
					end
					-- ��������� �������������� ��������
					check_item_final_data(forgeItem)
					SynChaKitbag(Player,13)
					return 0
				else
					HelpInfo(Player, 0, "������ "..ScrollGems[perebor].." ������ ������������ � ��������� ���� "..ItemType_otheritem)
					return 0
				end
			end
		end
	end
	if MainID > 8000 then
		MainID = GetItemAttr(ItemMain, ITEMATTR_VAL_FUSIONID)
	end
	local Check = 0
	for i = 1, table.getn(Upgrade), 1 do
		if MainID == Upgrade[i].ID then
			if CatalystID == Upgrade[i].Catalyst then
				Check = 1
			end
		end
	end
	local Item_CanGet = GetChaFreeBagGridNum ( Player )
	 if Item_CanGet < 5 then
		SystemNotice(Player ,"������������ ��������� ������ � ���������/ ��������� ������� 5.")
		UseItemFailed ( Player )
		return
	end
	if Check == 0 then
		SystemNotice(Player, "�� �� ������ ������������ ["..MainID.."] � ����������� ["..CatalystID.."]" )
		return 0		
	end
	if gettichun_money_main(Table) > GetChaAttr(Player, ATTR_GD) then
		SystemNotice(Player, "��� ����� "..gettichun_money_main(Table).." ������ ��� ���������! ")
		return 0
	end
	return 1
end

function begin_tichun_item(...)
	local Check_Cantichun = 0
	Check_Cantichun = can_tichun_item_main(arg)
	if Check_Cantichun == 0 then
		return 0
	end
	local Player = 0
	local ItemBag = {}											
	local ItemCount = {}											
	local ItemBagCount = {}										
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(arg)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])	
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])	
	local Money_Need = gettichun_money_main(arg)
	TakeMoney(Player, nil, Money_Need)
	Check_TiChun_Item = tichun_item(arg)
	if Check_TiChun_Item == 0  then
		SystemNotice(Player, "������ �2 ��������� �����! �������� �������������!")
	end
	return 1
end
function get_item_tichun_money(...)
	local Money = gettichun_money_main(arg)
	return Money
end
function gettichun_money_main(Table)
	local Player = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}									
	local ItemBag_Num = 0									
	local ItemCount_Num = 0									
	local ItemBagCount_Num = 0								
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(Table)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])	
	local ItemMainLv =  GetItemLv(ItemMain)
	local Money_Need = Upgrade.Money * ItemMainLv
	return Money_Need
end
function tichun_item(Table)
	local Player = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}										
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	Player, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(Table)
	local ItemMain = GetChaItem(Player, 2, ItemBag[0])
	local ItemCatalyst = GetChaItem(Player, 2, ItemBag[1])	
	local ItemType_mainitem = GetItemType(ItemMain)
	local ItemType_otheritem = GetItemType(ItemCatalyst)
	local ItemMainID = GetItemID(ItemMain)
	local ItemCatalystID = GetItemID(ItemCatalyst)
	local ItemMainID_Lv = GetItemLv(ItemMain)
	local ItemCatalystID_Lv = GetItemLv(ItemCatalyst)
	local MainID = ItemMainID		
	local CatalystID = ItemCatalystID
	if MainID > 8000 then
		MainID = GetItemAttr(ItemMain, ITEMATTR_VAL_FUSIONID)
	end
	local Forge = GetItemForgeParam(ItemMain, 1)
	local r1 = 0
	local r2 = 0
	local ItemEnergy = GetItemAttr(ItemMain, ITEMATTR_ENERGY) 
	local ItemQuality = 12	
	
	for k = 1, table.getn(Upgrade) do
		if MainID == Upgrade[k].ID and CatalystID == Upgrade[k].Catalyst then
			if ItemEnergy < 1000 then
				ItemQuality = 2
			elseif ItemEnergy >= 1000 and ItemEnergy < 2000 then
				ItemQuality = 12
			elseif ItemEnergy >= 2000 and ItemEnergy < 3000 then
				ItemQuality = 13
			elseif ItemEnergy >= 3000 and ItemEnergy < 4000 then
				ItemQuality = 14
			elseif ItemEnergy >= 4000 and ItemEnergy < 5000 then
				ItemQuality = 15
			elseif ItemEnergy >= 5000 and ItemEnergy < 6000 then
				ItemQuality = 16
			elseif ItemEnergy >= 6000 and ItemEnergy < 7000 then
				ItemQuality = 17
			elseif ItemEnergy >= 7000 and ItemEnergy < 8000 then
				ItemQuality = 18
			elseif ItemEnergy >= 8000 and ItemEnergy < 9000 then
				ItemQuality = 19
			elseif ItemEnergy >= 9000 and ItemEnergy < 10000 then
				ItemQuality = 20
			end
			MainID = Upgrade[k].Result
			r1,r2 = MakeItem(Player, MainID, 1, ItemQuality)
		end
	end
	local RemMain = 0
	local RemCata = 0
	RemMain = RemoveChaItem(Player, ItemMainID, 1, 2, ItemBag[0], 2, 1, 1)
	RemCata = RemoveChaItem(Player, ItemCatalystID, 1, 2, ItemBag[1], 2, 1, 1)	
	if RemMain == 0 or RemCata == 0 then
		SystemNotice(Player, "������ �������� ��������! �������� �������������!")
		return
	end
	local NewItem = GetChaItem(Player, 2, r2)
	local CheckForge = SetItemForgeParam(NewItem, 1, Forge)
	if CheckForge == 0 then
		SystemNotice(Player, "Fail to set forging attribute settings.")
		return
	end

	-----------------------------------
	-- ������� � �� ��� ��� �� ������� --
	-------------------------------------
	GMNotice("\207\238\231\228\240\224\226\235\255\229\236! \200\227\240\238\234 ["..GetChaDefaultName(Player).."] \243\235\243\247\248\232\235 "..GetItemName(ItemMainID).." \232 \239\238\235\243\247\232\235 "..GetItemName(MainID)..".")
	LG("Upgrade System", "Player: ["..GetChaDefaultName(Player).."], Equipment: ["..GetItemName(ItemMainID).."], Catalyst: ["..GetItemName(ItemCatalystID).."], Result: ["..GetItemName(MainID).."]")
	SynChaKitbag(Player, 13)
end