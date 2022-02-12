--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading Forge.lua" )


function can_unite_item (...)
	if arg.n ~= 12 then
		return 0
	end
	
	local kkk = 0
	local Check = 0
	Check = can_unite_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_unite_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	local i = 0
	for i = 0 , 2 , 1 do
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1 then
			SystemNotice( role , "Item target unit and item unit illegal")
			return 0
		end
	end

	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]

	local Item1 = GetChaItem ( role , 2 , BagItem1 )
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	
	local ItemID1 = GetItemID ( Item1 )
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )

	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )

	if ItemType1 ~= 47 then
		
		SystemNotice( role ,"Вставьте свиток комбинирования! ")
		return 0
	end

	if ItemType2 ~= 49 or ItemType3 ~= 49 then
		if ItemType2 ~= 50 or ItemType3 ~= 50 then
			SystemNotice( role , "Вставьте самоцвет! ")
			return 0
		end
	end

	if ItemID2 ~= ItemID3 then
		SystemNotice(role ,"Несоответствие самоцветов! ")
		return 0
	end
	
	local Item2_Lv = Get_StoneLv ( Item2 )
	local Item3_Lv = Get_StoneLv ( Item3 )
	--if ItemID2 == 6718 or ItemID2 == 6717 then 
	--	if Item2_Lv>=9 or Item3_Lv >= 9 then 
	--		SystemNotice ( role , "Этот самоцвет можно комбинировать только до 9 уровня! ")
	--		return 0
	--	end
	--end	
	if ItemType2 == 49 and ItemType3 == 49 then
		if Item2_Lv >= 9 or Item3_Lv >= 9 then
			SystemNotice ( role , "Достигнут маскимальный уровень самоцвета! ")
			return 0
		end
	end
	if Item2_Lv ~= Item3_Lv then 
		SystemNotice(role ,"Уровни самоцветов не соответствуют! ")
		return 0
	end
	local Money_Need = getunite_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Недостаточно золота. Комбинирование невозможно! ")
		return 0
	end

	return 1
end

function begin_unite_item (...)
--	Notice("Start Combining")
	
	local Check_CanUnite = 0
--	SystemNotice ( arg[1] , "transfer detect can it be combined into main function")
	Check_CanUnite = can_unite_item_main ( arg )
	if Check_CanUnite == 0 then
		return 0
	end
	
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( arg )

	
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	
	local BagItem1 = arg [3]
	local BagItem2 = arg [6]
	local BagItem3 = arg [9]

	local Item1 = GetChaItem ( role , 2 , BagItem1 )
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	
	local ItemID1 = GetItemID ( Item1 )
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )

	local ItemType2 = GetItemType ( Item2 )

	local Item2_Lv = Get_StoneLv ( Item2 )
	local Item3_Lv = Get_StoneLv ( Item3 )

	local i = 0
	local j = 0

	i = RemoveChaItem ( role , ItemID1 , 1 , 2 , BagItem1 , 2 , 1 , 0)
	j = RemoveChaItem ( role , ItemID3 , 1 , 2 , BagItem3 , 2 , 1 , 0)

	if i == 0 or j == 0 then
		LG( "Hecheng_BS" , "Delete item failed" )
	end
	
	Item2_Lv =Item2_Lv + 1
	
	Set_StoneLv ( Item2 , Item2_Lv )
	
	local Money_Need = getunite_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Currently there are"..Money_Have.."So much gold")
--	Notice ("Must deduct"..Money_Need.."So much gold")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )
	
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_HCGLJB )
	
	Sklv = Sklv + StateLv

	local b = Check_CG_HechengBS ( Item2_Lv , ItemType2 , Sklv )
	if b == 0 then
		i = RemoveChaItem ( role , ItemID2 , 1 , 2 , BagItem2 , 2 , 1 , 0)
		if i == 0 then
			LG( "Hecheng_BS" , "Delete item failed" )
		end
		local cha_name = GetChaDefaultName ( role )
		LG( "JingLian_ShiBai" , "Player"..cha_name.."Gem combining failed" )
		SystemNotice( role , "\206\247\229\237\252 \230\224\235\252, \241\238\247\229\242\224\237\232\229 \237\229 \243\228\224\235\238\241\252. \209\224\236\238\246\226\229\242 \232\241\247\229\231!")
		--SystemNotice( role , "Очень жаль, сочетание не удалось. Самоцвет исчез!")

		return 2					--// Changed Combining Rate - MoMo (default = return 2) 
	end
	local cha_name = GetChaDefaultName ( role )
	LG( "JingLian_ShiBai" , "Player"..cha_name.."Gem combining successful" )
	return 1
end

function get_item_unite_money (...)
--	SystemNotice ( arg[1] , "starts to calculate money" )
	local Money = getunite_money_main ( arg )
--	SystemNotice ( arg[1] , "Calculation completed"..Money )
	return 0
end

function getunite_money_main ( Table )
--	SystemNotice ( Table[1] , "starts to count money" )
	return 50000
end

function can_forge_item(...)
--	Notice ( "Determin if it can be forged")
	if arg.n ~= 12 then
		SystemNotice ( arg[1] , "\199\237\224\247\229\237\232\229 \239\224\240\224\236\229\242\240\224 \231\224\228\224\237\238 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Значение параметра задано не верно"..arg.n )
		return 0
	end

--	local kkk = 0
	
--	for kkk = 2 , arg.n ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end

	local Check = 0
	
	Check = can_forge_item_main ( arg )
	
	if Check == 1 then
		return 1
	else
		return 0
	end
end
	
function can_forge_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local ItemBagCount_Jinglian = ItemBagCount [0]
	local ItemBag_Jinglian = ItemBag [0]
	local ItemNum_Jinglian = ItemCount [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Check = 0

	if ItemBagCount_Jinglian ~= 1 then
		SystemNotice( role , "\202\238\226\234\224 \239\240\229\228\236\229\242\224 \241\226\255\231\224\237\224\255 \241 \239\235\224\226\235\229\237\232\229\236 \237\238\226\238\227\238 \241\235\238\242\224 \237\229\231\224\234\238\237\224")
		--SystemNotice( role , "Ковка предмета связаная с плавлением нового слота незакона")
		return 0
	end
	
	if ItemNum_Jinglian ~= 1 then
		SystemNotice( role , "\202\238\235\232\247\229\241\242\226\238 \234\243\254\249\232\245\241\255 \239\240\229\228\236\229\242\238\226 \237\229\231\224\234\238\237\238")
		--SystemNotice( role , "Количество кующихся предметов незаконо")
		return 0
	end

	Check = CheckItem_CanJinglian ( Item_Jinglian )

	if Check == 0 then
		SystemNotice( role ,"\205\229\226\238\231\236\238\230\237\238 \242\238\247\232\242\252 \239\240\229\228\236\229\242")
		--SystemNotice( role ,"Невозможно точить предмет")
		return 0
	end
	

	
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \241\224\236\238\246\226\229\242\238\226")
		--SystemNotice ( role ,"Незаконное количество самоцветов")
		return 0
	end

	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Check_Hole = 0

	Check_Hole = CheckItem_HaveHole ( Item_Jinglian , Item_Stone1 , Item_Stone2)

	if Check_Hole == 0 then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\235\238\242\238\226 \226 \239\240\229\228\236\229\242\229" )
		--SystemNotice( role ,"Недостаточно слотов в предмете" )
		return 0
	end
	

	local Check_Stone = 0

	Check_Stone = Check_StoneLv ( Item_Jinglian , Item_Stone1 , Item_Stone2 )

	if Check_Stone == 0 then
		SystemNotice ( role , "\209\224\236\238\246\226\229\242 \232\235\232 \243\240\238\226\229\237\252 \241\224\236\238\246\226\229\242\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242" )
		--SystemNotice ( role , "Самоцвет или уровень самоцвета не соответствует" )
		return 0
	end

	local Check_StoneItem = 0

	Check_StoneItem = Check_StoneItemType ( Item_Jinglian , Item_Stone1 , Item_Stone2 )

	if Check_StoneItem == 0 then
		SystemNotice ( role , "\210\232\239 \209\224\236\238\246\226\229\242\224 \232 \242\232\239 \239\240\229\228\236\229\242\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\254\242" )
		--SystemNotice ( role , "Тип Самоцвета и тип предмета не соответствуют" )
		return 0
	end

	
	local Money_Need = getforge_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \209\238\247\229\242\224\237\232\229 \237\229\226\238\231\236\238\230\237\238.")
		--SystemNotice( role ,"Недостаточно золота. Сочетание невозможно.")
		return 0
	end

	
--SystemNotice(role ,"determination completed ")
	return 1
end

function begin_forge_item(...)
--	Notice("Start to forge")

	local Check_CanForge = 0
	Check_CanForge = can_forge_item_main ( arg )

	if Check_CanForge == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_Jinglian = ItemBag [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Check_Jinglian_Item = 0

	local Money_Need = getforge_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Currently there are"..Money_Have.."So much gold")
--	Notice ("Must deduct"..Money_Need.."So much gold")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local ItemID_Jinglian = GetItemID ( Item_Jinglian )
----------------	
	local Jinglian_Lv_Now = GetItem_JinglianLv ( Item_Jinglian )
----------------
	local Num = GetItemForgeParam ( Item_Jinglian , 1 )
	Num = TansferNum ( Num )

	local Stone1Type = GetItemType ( Item_Stone1 )
	local Stone2Type = GetItemType ( Item_Stone2 )

	local Baoshi = 0

	if Stone1Type == 49 then
		Baoshi = Item_Stone1
	elseif Stone2Type == 49 then
		Baoshi = Item_Stone2
	end
	
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Baoshi_NeedLv = 1

	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	BaoshiType = GetStone_TypeID ( Baoshi )

	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end
----------------
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_JLGLJB )
	
	Sklv = Sklv + StateLv

	Check_A = math.max ( 0.01 , math.min ( 1 , ( 1 - Baoshi_NeedLv * 0.1 + Sklv * 0.1 - 0.2 ) ) )
	local CheckFaild = Percentage_Random ( Check_A )
	
	if Baoshi_NeedLv < 4 then			--// changed forge level check -MoMo (default = if Baoshi_NeedLv < 4 then)
		CheckFaild = 1
	end

	if CheckFaild == 1 then
		Check_Jinglian_Item = Jinglian_Item ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	else
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging of equipment failed. Equipment is not damaged - "..Item_Jinglian_name )
		SystemNotice ( role , "\202 \241\238\230\224\235\229\237\232\254, \243\235\243\228\248\229\237\232\229 \237\229 \243\228\224\235\238\241\252. \202 \241\247\224\241\242\252\254, \238\225\238\240\243\228\238\226\224\237\232\229 \237\229 \239\238\226\240\229\228\232\235\238\241\252" )
		--SystemNotice ( role , "К сожалению, улудшение не удалось. К счастью, оборудование не повредилось" )
	end
------------------

	local ItemID_Stone1 = GetItemID ( Item_Stone1 )
	local ItemID_Stone2 = GetItemID ( Item_Stone2 )

	local Stone1_Lv = Get_StoneLv ( Item_Stone1 )
	local Stone2_Lv = Get_StoneLv ( Item_Stone2 )
	local Jinglianshi_Lv = 0
	if Stone1_Lv > Stone2_Lv then
		Jinglianshi_Lv = Stone1_Lv
	else
		Jinglianshi_Lv = Stone2_Lv
	end

	local Jinglian_Lv = GetItem_JinglianLv ( Item_Jinglian )

	local R1 = 0
	local R2 = 0

	R1 = RemoveChaItem ( role , ItemID_Stone1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	R2 = RemoveChaItem ( role , ItemID_Stone2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )

	if R1 == 0 or R2 == 0 then
		LG( "Jinglian" , "Gem deletion failed" )
	end
	
	if CheckFaild == 0 then
		return 2
	end

	check_item_final_data ( Item_Jinglian )

--	SystemNotice(role , "Return failed")

--	local a = 0.75
	local b = Check_CG_Jinglian ( Jinglian_Lv , Jinglianshi_Lv , Sklv )
	if b == 0 then
		i = RemoveChaItem ( role , ItemID_Jinglian , 1 , 2 , ItemBag [0] , 2 , 1 , 0)
		if i == 0 then
			LG( "Hecheng_BS" , "Delete item failed" )
		end
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging of equipment failed - "..Item_Jinglian_name )
		SystemNotice( role , "\206\247\229\237\252 \230\224\235\252! \202\238\226\234\224 \237\229 \243\228\224\235\224\241\252. \207\240\229\228\236\229\242 \225\251\235 \240\224\231\240\243\248\229\237!")
		--SystemNotice( role , "Очень жаль! Ковка не удалась. Предмет был разрушен!")
		return 2	
	end

--	Notice("Forging completed")
	local cha_name = GetChaDefaultName ( role )
	local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
	LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging successful - "..Item_Jinglian_name )
	return 1
end

function get_item_forge_money(...)
--	Notice("Fee calculation")
	local Money = getforge_money_main ( arg )
	return Money
end

function getforge_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Jinglian = ItemBag [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Jinglian_Lv = 0

	Jinglian_Lv =  GetItem_JinglianLv ( Item_Jinglian )
	Jinglian_Lv = Jinglian_Lv + 1

	local Money_Need = Jinglian_Lv * 100000
	
--	Notice("Calculation completed")
	return Money_Need
end

function Get_StoneLv ( Item )
	local Lv = GetItemAttr ( Item , ITEMATTR_VAL_BaoshiLV )
	return Lv
end

function Set_StoneLv ( Item , Item_Lv )
	local i = 0
	i = SetItemAttr ( Item , ITEMATTR_VAL_BaoshiLV , Item_Lv )
	if i == 0 then
		LG( "Hecheng_BS","Failed to set gem level" )
	end
end

function CheckItem_CanJinglian ( Item )
--	Notice ("CheckItem_CanJinglian ")

	local Item_Type = GetItemType ( Item )
	local i = 0
	for i = 0 , Item_CanJinglian_Num  , 1 do
		if Item_Type == Item_CanJinglian_ID [i] then
			return 1
		end
	end
	
	return 0
	
end

function CheckItem_HaveHole ( Item , Stone1 , Stone2)
--	Notice ("CheckItem_HaveHole")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Hole = GetNum_Part1 ( Num )
	local Item_Stone = {} 
	local Stone1TypeID = 0
	local Stone2TypeID = 0
	
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	local i = 0
	local Hole_empty = 0
	
	for i = 0 , 2 , 1 do
		if Item_Stone[i] == 0 then
			Hole_empty = Hole_empty + 1
		end

		Stone1TypeID = GetStone_TypeID ( Stone1 )
		Stone2TypeID = GetStone_TypeID ( Stone2 )

		if Item_Stone[i] == Stone1TypeID or Item_Stone[i] == Stone2TypeID then

			return 1
		end
	end
	
	local Hole_Used = 3 - Hole_empty
	
	if Hole_Used >= Hole then
		return 0
	else
		return 1
	end
	
end

function Check_StoneLv ( Item , Stone1 , Stone2 )
--	Notice ("Check_StoneLv")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
--	Notice ( Num )
	local Jinglian_Lv =  GetItem_JinglianLv ( Item )
--	Notice ( Jinglian_Lv )
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
--	Notice (Stone1Type)
--	Notice (Stone2Type)
	local Jinglianshi = 0
	local Jinglianshi_Lv = 0
	local Baoshi = 0
	local Baoshi_Lv = 0
	local Baoshi_NeedLv = 0

	if Stone1Type == 50 then
		Jinglianshi = Stone1
	elseif 	Stone2Type == 50 then
		Jinglianshi = Stone2
	end
	
	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end
	
	Jinglianshi_Lv = Get_StoneLv ( Jinglianshi )
	Baoshi_Lv = Get_StoneLv ( Baoshi )

--	Notice("Jinglianshi_Lv= "..Jinglianshi_Lv)
--	Notice("Baoshi_Lv= "..Baoshi_Lv)

	local Item_Stone = {}
	local Item_StoneLv = {}
	
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	BaoshiType = GetStone_TypeID ( Baoshi )

--	Notice("BaoshiType= "..BaoshiType)
	local i = 0

	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end

	local Jinglianshi_NeedLv = Baoshi_NeedLv	
	
	if Baoshi_Lv < Baoshi_NeedLv then
--		Notice("Gem Lv too low")
		return 0
	end

	if Jinglianshi_Lv < Jinglianshi_NeedLv then
--		Notice("Refining Gem level does not match")
		return 0
	end
--	Notice("Return successful")
	return 1

end

function Jinglian_Item ( Item , Stone1 , Stone2 )
--	Notice("Jinglian_Item")
	
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Jinglian_Lv =  GetItem_JinglianLv ( Item )
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
	local Baoshi = 0
	local Num_New = Num

	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end

	Num_New = SetJinglian_Lv ( Baoshi , Baoshi_Lv , Num )

--	Notice(Num_New)
	local i = 0
	
	i = SetItemForgeParam ( Item , 1 , Num_New )
	
	if i == 0 then
		LG( "Jinglian" , "set forging content failed" )
	end

	local Item_URE_Add = 0
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	if Item_MAXURE < 600 then
		Item_MAXURE = math.min ( ( Item_MAXURE + Item_URE_Add ) , 600 )
	end
	
	local j = 0
	j = SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
	
	if j == 0 then
		LG( "Jinglian" , "Forge setting maximum durability failed")
	end
	

	if Num_New == Num then
--		Notice("Set content has not been changed")
	end
	
	return 1	

end

function SetJinglian_Lv ( Baoshi , Baoshi_Lv , Num )
	
--	Notice ("SetJinglian_Lv")
--	Notice (Num)
	local Baoshi_Lv = 0
	Baoshi_Lv = Get_StoneLv ( Baoshi )
	
	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	BaoshiType = GetStone_TypeID ( Baoshi )

--	Notice("BaoshiType= "..BaoshiType)
	
	local i = 0
	local Stone_Check = 0

	for i = 0 , 2 , 1 do
		if BaoshiType == Item_Stone [i] then
			Item_StoneLv [i] = Item_StoneLv [i] + 1
			Stone_Check = i + 1
		end
	end

	if Stone_Check == 1 then
		Num = SetNum_Part3 ( Num , Item_StoneLv[0] )
	elseif Stone_Check == 2 then
		Num = SetNum_Part5 ( Num , Item_StoneLv[1] )
	elseif Stone_Check == 3 then
		Num = SetNum_Part7 ( Num , Item_StoneLv[2] )
	elseif Stone_Check == 0 then
		local Check_empty = 0
		for i = 2 , 0 , -1 do
			if Item_Stone[i] == 0 then
				Check_empty = i + 1
			end
		end

		if Check_empty == 1 then
			Num = SetNum_Part2 ( Num , BaoshiType )
			Num = SetNum_Part3 ( Num , 1 )
		elseif Check_empty == 2 then
			Num = SetNum_Part4 ( Num , BaoshiType )
			Num = SetNum_Part5 ( Num , 1 )
		elseif Check_empty == 3 then
			Num = SetNum_Part6 ( Num , BaoshiType )
			Num = SetNum_Part7 ( Num , 1 )
		end
	end
	
--	Notice("SetJinglian_Lv ended")
	return Num
end

function GetStone_TypeID ( Stone )
--	Notice ("GetStone_TypeID")

	local StoneID = GetItemID ( Stone )
	local i = 0
	for i = 1 , StoneTpye_ID_Num , 1 do
--		Notice ( StoneTpye_ID[i] )
		if StoneTpye_ID[i] == StoneID then
			return i
		end
	end
	return -1
end

function Read_Table ( Table )
--	Notice("Read_Table")
	local role = Table [1]
--	Notice(role)
--	Notice(Table.n)
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 2
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_New = 0
	local i = 0
	local j = 0

	for i = 0 , Get_Count , 1 do
		
		if ItemReadNow <= Table.n then
			ItemBagCount [i] = Table [ItemReadNow]
--			SystemNotice ( role , "aaa  "..ItemBagCount [i] )
			ItemBagCount_New = ItemBagCount_New + 1
--			Notice("ItemBagCount= "..ItemBagCount [i])
			ItemReadNow = ItemReadNow + 1
			ItemReadNext = ItemReadNow + 2 * ( ItemBagCount [i] - 1 )
			ItemReadCount = ItemReadNow
			if ItemBagCount [i] ~= 0  then
				for j = ItemReadCount , ItemReadNext , 2 do
					ItemBag [ItemBag_Now] = Table [j]
--					SystemNotice(role , "aaa  "..ItemBag [ItemBag_Now])
--					Notice("ItemBag= "..ItemBag [ItemBag_Now])
					ItemBag_Now = ItemBag_Now + 1
					ItemCount [ItemCount_Now] = Table [ j+1 ]
--					SystemNotice(role , "aaa  "..ItemCount[ItemCount_Now])
--					Notice("ItemCount= "..ItemCount [ItemCount_Now])
					ItemCount_Now = ItemCount_Now + 1
					ItemReadNow = ItemReadNow + 2
				end
			end
		else
			ItemBagCount [i] = 0
--			SystemNotice ( role , "aaa  "..ItemBagCount [i] )
--			Notice(ItemBagCount [i])
		end
	end
--	Notice("1111")
	return role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_New
end

function check_item_final_data ( Item )
	local Item_TypeCheck = GetItemType ( Item )
	if Item_TypeCheck == 59 then
		return
	end
--	Notice ("check_item_final_data")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
--	Notice(Num)
	local StoneInfo = {}
	local StoneLv = {}
	local ResetCheck = 0
	ResetCheck = ResetItemFinalAttr( Item )
	
	if ResetCheck == 0 then
--		Notice("ResetCheck Failed")
		LG("check_item_final","ResetCheck Failed")
		return
	end
	StoneInfo[0]=0
	StoneInfo[1]=0
	StoneInfo[2]=0
	StoneLv[0]=0
	StoneLv[1]=0
	StoneLv[2]=0
	StoneInfo[0],StoneInfo[1],StoneInfo[2],StoneLv[0],StoneLv[1],StoneLv[2] = CheckStoneInfo ( Num )

	local AddCheck = 0

	local i = 0
	local j = 0
	for i = 0 , 2 , 1 do
		if StoneInfo [i] ~= nil and StoneInfo [i] ~=0  then
--			Notice("StoneInfo"..i.."= "..StoneInfo [i])
			if StoneAttrType[StoneInfo [i]] == ITEMATTR_VAL_MNATK then
--				Notice("Add Attack")
				local Itemattr_Type1 = StoneAttrType[StoneInfo [i]]
				local Itemattr_Type2 = Itemattr_Type1 + 1
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
--				local Item_attr1 = GetItemAttr ( Item , Itemattr_Type1 )
--				local Item_attr2 = GetItemAttr ( Item , Itemattr_Type2 )

--				local Item_Newattr1 = Item_attr1 + ItemAttrEff
--				local Item_Newattr2 = Item_attr2 + ItemAttrEff
				
--				Notice ( "Itemattr_Type1= "..Itemattr_Type1.." Itemattr_Type2= "..Itemattr_Type2)
--				Notice ( "ItemAttrEff= "..ItemAttrEff)
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type1 , ItemAttrEff )
				if AddCheck == 0 then
					LG("check_item_final","AddCheck Failed")
				end
				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type2 , ItemAttrEff )
				if AddCheck == 0 then
					LG("check_item_final","AddCheck Failed")
				end
			else
				local Itemattr_Type = StoneAttrType[StoneInfo [i]]
				local ItemAttrEff = 0
				local num_stone=0
				local lv_stone=0
				if StoneLv[i]>0 and StoneLv[i]<=9 then
					lv_stone=StoneLv[i]
				end
				if StoneInfo [i]>=0 and StoneInfo [i]<=StoneEff_Num then
					num_stone=StoneInfo [i]
					ItemAttrEff =StoneEff [num_stone] * lv_stone
				end
				--local ItemAttrEff = StoneEff[StoneInfo [i]] * StoneLv[i]

--				local Item_attr = GetItemAttr ( Item , Itemattr_Type )
--				local Item_Newattr = Item_attr + ItemAttrEff

				AddCheck = AddItemFinalAttr ( Item , Itemattr_Type , ItemAttrEff )
				if AddCheck == 0 then
					LG("check_item_final","AddCheck Failed")
				end

			end
		end
	end
end

function Check_StoneItemType ( Item , Stone1 , Stone2 )
--	Notice ("Check_StoneItemType")
	local Stone1Type = GetItemType ( Stone1 )
	local Stone2Type = GetItemType ( Stone2 )
	local Baoshi = 0
	local ItemType = GetItemType ( Item )
	
	if Stone1Type == 49 then
		Baoshi = Stone1
	elseif Stone2Type == 49 then
		Baoshi = Stone2
	end

	local Baoshi_ID = GetItemID ( Baoshi )
	local i = 0
	local Baoshi_TypeID = 0
	
	for i = 1 , StoneAttrType_Num , 1 do
		if Baoshi_ID == StoneTpye_ID[i] then
			Baoshi_TypeID = i
		end
	end

	for i = 0 , 15 , 1 do
		if ItemType == StoneItemType[Baoshi_TypeID][i] then
			return 1
		end
		if StoneItemType[Baoshi_TypeID][i] == 0 then
--			Notice ("Return failed")
			return 0
		end
	end
	
--	Notice ("Return failed")
	return 0
end

function GetItem_JinglianLv ( Item )
--	Notice ("GetItem_JinglianLv")
	local Num = GetItemForgeParam ( Item , 1 )
	Num = TansferNum ( Num )
	local Item_StoneLv = {}
	local JinglianLv = 0
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	JinglianLv = Item_StoneLv[0] + Item_StoneLv[1] + Item_StoneLv[2]

	return JinglianLv
end

function CheckStoneInfo( Num )

	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	return Item_Stone[0],Item_Stone[1],Item_Stone[2],Item_StoneLv[0],Item_StoneLv[1],Item_StoneLv[2]
end

function Check_CG_HechengBS ( Item_Lv , Item_Type , Sklv )
	local a = 0
	local b = 0
	Item_Lv = Item_Lv - 1
	if Item_Type == 49 then
		a = math.max ( 0 , math.min ( 1 , ( 1 - Item_Lv * 0.15 + Sklv * 0.15 ) ) )
		b = Percentage_Random ( a )
		if Item_Lv < 8 then
			b = 1
		end
		return b
	elseif Item_Type == 50 then
		a = math.max ( 0 , math.min ( 1 , ( 1 - Item_Lv * 0.05 + Sklv * 0.15 ) ) )
		b = Percentage_Random ( a )
		return b
	else
		LG( "Hecheng_BS","probability check determine item type is not a gem" )
		return 0
	end
end

function Check_CG_Jinglian ( Jinglian_Lv , Stone_Lv , Sklv )
--	local a = 0
	local b = 0

--	a = math.max ( 0.02 , math.min ( 1 , ( 1 - Jinglian_Lv  * 0.05 + Sklv * 0.15 - 0.3 ) ) )
--	b = Percentage_Random ( a )
--	if Jinglian_Lv <= 8 then
		b = 1
--	end
	return b
end

function Roll_DiamondId ( cha ) 
	local a = math.random ( 1 , 8 ) 
	local DiamondId = StoneTpye_ID [ a ] 
	return DiamondId  
end 

--Расписка на Реф 1 уровня
function Transfer_DiamondScript_Lv1 ( role )			
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3877 )
	local DiamondId = Roll_DiamondId ( cha )
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3877 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )

			y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )

		else 
			SystemNotice ( cha , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242" ) 
			--SystemNotice ( cha , "Невозможно использовать Расписку на Самоцвет" ) 
		end 
	else 
		SystemNotice ( cha , "\194\251 \228\238\235\230\237\251 \232\236\229\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 1 \243\240\238\226\237\255 \228\235\255 \242\238\227\238, \247\242\238\225\251 \239\240\238\232\231\226\229\241\242\232 \226\251\234\243\239" )
		--SystemNotice ( cha , "Вы должны иметь Расписку на Самоцвет 1 уровня для того, чтобы произвести выкуп"  ) 
	end 
	if x_give == 1 and y_give ==1 then 
		return 1 
	else 
		return 0 
	end 
end 

--Расписка на Реф 2 уровня
function Transfer_DiamondScript_Lv2 ( role )			
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3878 )
	local DiamondId = Roll_DiamondId ( cha )
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3878 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 102 )

			y_give = GiveItem ( cha , 0 , 885 , 1 , 102 )


		else 
			SystemNotice ( cha , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242" )
			--SystemNotice ( cha , "Невозможно использовать Расписку на Самоцвет" ) 
		end 
	else 
		SystemNotice ( cha , "\194\251 \228\238\235\230\237\251 \232\236\229\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 1 \243\240\238\226\237\255 \228\235\255 \242\238\227\238, \247\242\238\225\251 \239\240\238\232\231\226\229\241\242\232 \226\251\234\243\239" )
		--SystemNotice ( cha , "Вы должны иметь Расписку на Самоцвет 1 уровня для того, чтобы произвести выкуп"  ) 
	end 
	if x_give == 1 and y_give ==1 then 
		return 1 
	else 
		return 0 
	end 
end

function GetChaName_0 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local Item_ID = GetItemID (role)
	if Money_Need > Money_Have and Item_ID == 2887 then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \206\225\236\229\237 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice( role ,"Недостаточно золота. Обмен невозможен.")
	else
	TakeMoney(role,nil,Money_Need)
	end
	local am1 = CheckBagItem( role, 2887 )			
	if am1 < 1 then
		SystemNotice( role ,"\194\224\236 \237\229 \234\224\230\229\242\241\255, \247\242\238 \226\251 \228\238\235\230\237\251 \239\240\232\237\229\241\242\232 \208\238\230\228\229\241\242\226\229\237\241\234\243\254 \239\238\231\228\240\224\226\232\242\229\235\252\237\243\254 \238\242\234\240\251\242\234\243")
		--SystemNotice( role ,"Вам не кажется, что вы должны принести Рождественскую поздравительную открытку")
	else 
	end
	local am2 =TakeItem( role, 0,2887, 1 )			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \208\238\230\228\229\241\242\226\229\237\241\234\238\233 \239\238\231\228\240\224\226\232\242\229\235\252\237\238\233 \238\242\234\240\251\242\234\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен Рождественской поздравительной открытки не удался")
	else
	PlayEffect( npc, 361 )
	Notice(" "..cha_name.." \239\238\235\243\247\224\229\242 \225\235\224\227\238\241\235\238\226\229\237\232\229: \196\224 \225\235\224\227\238\241\235\238\226\232\242 \226\224\241 \195\238\241\239\238\228\252 \237\224 \253\242\238 \208\238\230\228\229\241\242\226\238! \193\238\227\232\237\255 \204\232\235\238\241\229\240\228\232\255 \231\224\249\232\242\232\242 \226\224\241! \193\238\227 \211\228\224\247\232 \238\225\237\232\236\229\242 \226\224\241 \232 \239\238\228\224\240\232\242 \243\228\224\247\243 \226\238 \226\241\184\236! \192\236\243\240 \226\251\241\242\240\229\235\232\242 \226 \226\224\241 \241\226\238\232\236\232 \241\242\240\229\235\224\236\232 \235\254\225\226\232! \193\238\227 \202\243\235\232\237\224\240\232\232 \226\234\243\241\237\238 \237\224\234\238\240\236\232\242 \226\224\241!")
	--Notice(" "..cha_name.." получает благословение: Да благословит вас Господь на это Рождество! Богиня Милосердия защитит вас! Бог Удачи обнимет вас и подарит удачу во всём! Амур выстрелит в вас своими стрелами любви! Бог Кулинарии вкусно накормит вас!")
	end
end

function GetChaName_1 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local Item_ID = GetItemID (role)
	if Money_Need > Money_Have and Item_ID == 2887 then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \206\225\236\229\237 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice( role ,"Недостаточно золота. Обмен невозможен.")
	else
	TakeMoney(role,nil,Money_Need)
	end
	local am1 = CheckBagItem( role, 2887 )			
	if am1 < 1 then
		SystemNotice( role ,"\194\224\236 \237\229 \234\224\230\229\242\241\255, \247\242\238 \226\251 \228\238\235\230\237\251 \239\240\232\237\229\241\242\232 \208\238\230\228\229\241\242\226\229\237\241\234\243\254 \239\238\231\228\240\224\226\232\242\229\235\252\237\243\254 \238\242\234\240\251\242\234\243")
		--SystemNotice( role ,"Вам не кажется, что вы должны принести Рождественскую поздравительную открытку")
	else 
	end
	local am2 =TakeItem( role, 0,2887, 1 )			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \208\238\230\228\229\241\242\226\229\237\241\234\238\233 \239\238\231\228\240\224\226\232\242\229\235\252\237\238\233 \238\242\234\240\251\242\234\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен Рождественской поздравительной открытки не удался")
	else
	PlayEffect( npc, 361 )
	Notice(" "..cha_name.." \239\238\235\243\247\224\229\242 \225\235\224\227\238\241\235\238\226\229\237\232\229: \200\231-\231\224 \239\240\229\228\241\242\238\255\249\229\227\238 \241\238\225\251\242\232\255 \226\238 \226\241\184\236 \236\232\240\229...")
	--Notice(" "..cha_name.." получает благословение: Из-за предстоящего события во всём мире...")
	end
end

function GetChaName_2 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local Item_ID = GetItemID (role)
	if Money_Need > Money_Have and Item_ID == 2887 then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \206\225\236\229\237 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice( role ,"Недостаточно золота. Обмен невозможен.")
	else
	TakeMoney(role,nil,Money_Need)
	end
	local am1 = CheckBagItem( role, 2887 )			
	if am1 < 1 then
		SystemNotice( role ,"\194\224\236 \237\229 \234\224\230\229\242\241\255, \247\242\238 \226\251 \228\238\235\230\237\251 \239\240\232\237\229\241\242\232 \208\238\230\228\229\241\242\226\229\237\241\234\243\254 \239\238\231\228\240\224\226\232\242\229\235\252\237\243\254 \238\242\234\240\251\242\234\243")
		--SystemNotice( role ,"Вам не кажется, что вы должны принести Рождественскую поздравительную открытку")
	else 
	end
	local am2 =TakeItem( role, 0,2887, 1 )			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \208\238\230\228\229\241\242\226\229\237\241\234\238\233 \239\238\231\228\240\224\226\232\242\229\235\252\237\238\233 \238\242\234\240\251\242\234\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен Рождественской поздравительной открытки не удался")
	else
	PlayEffect( npc, 361 )
	Notice(" "..cha_name.." \239\238\235\243\247\224\229\242 \234\240\224\241\232\226\238\229 \239\238\230\229\235\224\237\232\229: \215\242\238\225\251 \239\240\238\226\229\241\242\232 \208\238\230\228\229\241\242\226\238 \226\236\229\241\242\229, \226\238\231\252\236\232\242\229\241\252 \231\224 \240\243\234\232 \232 \241\235\243\248\224\233\242\229 \231\226\238\237 \247\224\241\238\226 \226 \237\238\247\232. \194\251 \245\238\242\232\242\229, \247\242\238\225\251 \232\241\239\238\235\237\232\235\238\241\252 \226\224\248\229 \230\229\235\224\237\232\229? \210\224\234 \231\224\227\224\228\251\226\224\233\242\229!")
	--Notice(" "..cha_name.." получает красивое пожелание: Чтобы провести Рождество вместе, возьмитесь за руки и слушайте звон часов в ночи. Вы хотите, чтобы исполнилось ваше желание? Так загадывайте!")
	end
end

function GetChaName_3 ( role,npc )
	local cha_name = GetChaDefaultName ( role )
	
	local Money_Need = 1000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	local Item_ID = GetItemID (role)
	if Money_Need > Money_Have and Item_ID == 2887 then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \206\225\236\229\237 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice( role ,"Недостаточно золота. Обмен невозможен.")
	else
	TakeMoney(role,nil,Money_Need)
	end
	local am1 = CheckBagItem( role, 2887 )			
	if am1 < 1 then
		SystemNotice( role ,"\194\224\236 \237\229 \234\224\230\229\242\241\255, \247\242\238 \226\251 \228\238\235\230\237\251 \239\240\232\237\229\241\242\232 \208\238\230\228\229\241\242\226\229\237\241\234\243\254 \239\238\231\228\240\224\226\232\242\229\235\252\237\243\254 \238\242\234\240\251\242\234\243")
		--SystemNotice( role ,"Вам не кажется, что вы должны принести Рождественскую поздравительную открытку")
	else 
	end
	local am2 =TakeItem( role, 0,2887, 1 )			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \208\238\230\228\229\241\242\226\229\237\241\234\238\233 \239\238\231\228\240\224\226\232\242\229\235\252\237\238\233 \238\242\234\240\251\242\234\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен Рождественской поздравительной открытки не удался")
	else
	PlayEffect( npc, 361 )
	Notice(" "..cha_name.." \239\238\235\243\247\224\229\242 \234\240\224\241\232\226\238\229 \239\238\230\229\235\224\237\232\229: \207\238\241\235\229 \239\240\238\248\235\238\227\238 \227\238\228\224, \236\251 \226\237\238\226\252 \239\240\232\226\229\242\241\242\226\243\229\236 \253\242\243 \240\238\230\228\229\241\242\226\229\237\241\234\243\254 \237\238\247\252. \221\242\238\242 \236\238\236\229\237\242 \226\240\229\236\229\237\232, \247\242\238\225\251 \225\251\242\252 \241\247\224\241\242\235\232\226\251\236\232; \226\241\239\238\236\232\237\224\242\252 \241\242\224\240\251\245 \228\240\243\231\229\233; \232 \236\229\247\242\251 \241\225\243\228\243\242\241\255... \209 \208\238\230\228\229\241\242\226\238\236 \213\240\232\241\242\238\226\251\236!")
	--Notice(" "..cha_name.." получает красивое пожелание: После прошлого года, мы вновь приветствуем эту рождественскую ночь. Этот момент времени, чтобы быть счастливыми; вспоминать старых друзей; и мечты сбудутся... С Рождеством Христовым!")
	end
end

--Звезда единства
function Transfer_TeamStar( role , level )
	local cha = TurnToCha ( role )  
	local script_count = CheckBagItem ( cha , 1034 )			
	local chaLV =  GetChaAttr( cha , ATTR_LV)
	local job = GetChaAttr( role, ATTR_JOB)

	if script_count >= 1 then
		if chaLV < 9 then
			SystemNotice(role,"\194\224\248\229\233 \231\226\229\231\228\238\233 \229\228\232\237\241\242\226\224 \229\249\184 \236\238\230\237\238 \239\238\235\252\231\238\226\224\242\252\241\255. \194\238\231\226\240\224\249\224\233\242\229\241\252 \239\238\241\235\229 41 \243\240\238\226\237\255.")
			--SystemNotice(role,"Вашей звездой единства ещё можно пользоваться. Возвращайтесь после 41 уровня.")
		else
			if job ~= 12 and job ~= 9 and job ~= 16 and job ~= 8 and job ~= 13 and job ~=14 then
				SystemNotice(role,"\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \239\229\240\241\238\237\224\230\224\236\232 \239\238\235\243\247\232\226\248\232\236\232 \226\242\238\240\243\254 \239\240\238\244\229\241\241\232\254.")
				--SystemNotice(role,"Может быть использовано только персонажами получившими вторую профессию.")
			else
				local x_del = DelBagItem ( cha , 1034 , 1 ) 
				if x_del == 1 then 
					if job == 12 then
						GiveItem( role , 0 , 1409  , 1 , 22 )
					elseif job == 9	then
						GiveItem( role , 0 , 1392  , 1 , 22 )
					elseif job == 16 then
						GiveItem( role , 0 , 1419  , 1 , 22 )
					elseif job == 8	then
						GiveItem( role , 0 , 1382  , 1 , 22 )
					elseif job == 13 then
						GiveItem( role , 0 ,1433  , 1 , 22 )
					elseif job == 14 then
						GiveItem( role , 0 , 1467  , 1 , 22 )
					end
				else 
					SystemNotice ( cha , "\205\229\226\238\231\236\238\230\237\238 \241\238\226\229\240\248\232\242\252 \238\225\236\229\237 \231\226\229\231\228\251 \229\228\232\237\241\242\226\224!" )
					--SystemNotice ( cha , "Невозможно совершить обмен звезды единства!" ) 
				end 
			end
		end
	else 
		SystemNotice ( cha , "\211 \226\224\241 \237\229\242 \231\226\229\231\228\251 \229\228\232\237\241\242\226\224" )
		--SystemNotice ( cha , "У вас нет звезды единства" )
	end 
end

function TransferDiamond( role , level )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229 \226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп не возможен.")
		return
	end
	local retbag

	if level == 1 then
		retbag = HasLeaveBagGrid( role, 2)
			if retbag ~= LUA_TRUE then
				SystemNotice(role,"\194\224\236 \237\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229.")
				--SystemNotice(role,"Вам необходимо 2 свободных слота в инвентаре.")
				return 
			end	
		Transfer_DiamondScript_Lv1 ( role )
	elseif level == 2 then 
		retbag = HasLeaveBagGrid( role, 2)
			if retbag ~= LUA_TRUE then
				SystemNotice(role,"\194\224\236 \237\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229.")
				--SystemNotice(role,"Вам необходимо 2 свободных слота в инвентаре.")
				return 
			end	
		Transfer_DiamondScript_Lv2 ( role )
	elseif level == 3 then
		retbag = HasLeaveBagGrid( role, 1)
			if retbag ~= LUA_TRUE then
				SystemNotice(role,"\194\224\236 \237\229\238\225\245\238\228\232\236 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229.")
				--SystemNotice(role,"Вам необходим 1 свободный слот в инвентаре.")
				return 
			end	
		Transfer_OneStoneScript ( role )
	elseif level == 4 then
		retbag = HasLeaveBagGrid( role, 1)
			if retbag ~= LUA_TRUE then
				SystemNotice(role,"\194\224\236 \237\229\238\225\245\238\228\232\236 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229.")
				--SystemNotice(role,"Вам необходим 1 свободный слот в инвентаре.")
				return 
			end	
		Transfer_OneDiamondScript ( role )
	else
		LG( "BSduihuan","Wrong coupon used" )
	end
end

function Transfer_OneStoneScript ( role )
	local cha = TurnToCha ( role ) 
	local y_give = 0 
	
	local script_count = CheckBagItem ( cha , 3885 )

	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3885 , 1 ) 
		if x_del == 1 then 
			y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )
		else 
			SystemNotice ( cha , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242" ) 
			--SystemNotice ( cha , "Невозможно использовать Расписку на Самоцвет" ) 
		end 
	else 
		SystemNotice ( cha , "\194\224\236 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \208\224\241\239\232\234\243 \237\224 \209\224\236\238\246\226\229\242, \247\242\238\225\251 \241\238\226\229\240\248\232\242\252 \238\225\236\229\237" )
		--SystemNotice ( cha , "Вам необходимо иметь Распику на Самоцвет, чтобы совершить обмен" )
	end 
	if y_give ==1 then 
		return 1 
	else 
		return 0 
	end
end

function Transfer_OneDiamondScript ( role )
	local cha = TurnToCha ( role ) 
	local x_give = 0 
	local y_give = 0 
	local script_count = CheckBagItem ( cha , 3886 )
	local DiamondId = Roll_DiamondId ( cha )
	if script_count >= 1 then 
		x_del = DelBagItem ( cha , 3886 , 1 ) 
		if x_del == 1 then 
			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )

		else 
			SystemNotice ( cha , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242" ) 
			--SystemNotice ( cha , "Невозможно использовать Расписку на Самоцвет" )  
		end 
	else 
		SystemNotice ( cha , "\194\224\236 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \208\224\241\239\232\234\243 \237\224 \209\224\236\238\246\226\229\242, \247\242\238\225\251 \241\238\226\229\240\248\232\242\252 \238\225\236\229\237" )
		--SystemNotice ( cha , "Вам необходимо иметь Распику на Самоцвет, чтобы совершить обмен" ) 
	end 
	if x_give == 1 then 
		return 1 
	else 
		return 0 
	end 
end 

function TansferNum ( Num )
	if Num < 0 then
		Num = Num + 4294967296
	end
	return Num
end

function can_milling_item (...)
--	Notice("Starts to determine")
	if arg.n ~= 12 then
--		Notice("parameter value illegal"..arg.n)
		return 0
	end
	
	local kkk = 0
	
--	for kkk = 2 , arg.n ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end
	
	local Check = 0
--	SystemNotice( arg[1] , "transfer combine test main function")
	Check = can_milling_item_main ( arg )
	if Check == 1 then
		
--		SystemNotice (arg[1] , "Return 1")
		return 1
	else
--		SystemNotice (arg[1] , "Return 0")
		return 0
	end
end

function can_milling_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0

--	SystemNotice( arg[1] , "start transfer parameter analysis")

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Item_Cailiao1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Cailiao2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Check_Cailiao1 = 0
	local Check_Cailiao2 = 0

	Check_Cailiao1 = Check_Jiaguji ( Item_Cailiao1 , Item_Cailiao2 )
	Check_Cailiao2 = Check_Cuihuafen ( Item_Cailiao1 , Item_Cailiao2 )

	if Check_Cailiao1 == 0 then
		SystemNotice ( role , "\196\235\255 \239\235\224\226\234\232 \242\240\229\225\243\229\242\241\255 \209\242\224\225\232\235\232\231\224\242\238\240 \241\237\224\240\255\230\229\237\232\255" )
		--SystemNotice ( role , "Для плавки требуется Стабилизатор снаряжения" )
		return 0
	end

	if Check_Cailiao2 == 0 then
		SystemNotice ( role , "\196\235\255 \239\235\224\226\234\232 \242\240\229\225\243\229\242\241\255 \202\224\242\224\235\232\231\224\242\238\240 \241\237\224\240\255\230\229\237\232\255" )
		--SystemNotice ( role , "Для плавки требуется Катализатор снаряжения" )
		return 0
	end

	local Check_Hole = 0

	Check_Hole = Check_HasHole ( Item_damo )
	
	if Check_Hole >= 3 then
		SystemNotice ( role , "\204\224\234\241\229\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \241\235\238\242\238\226. \205\229\226\238\231\236\238\230\237\238 \239\240\238\228\238\235\230\224\242\252 \239\235\224\226\234\243." )
		--SystemNotice ( role , "Максемальное количество слотов. Невозможно продолжать плавку." )
		return 0
	end

	local Money_Need = get_milling_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \241\228\229\235\224\242\252 \237\238\226\251\233 \241\235\238\242.")
		--SystemNotice( role ,"Недостаточно золота. Невозможно сделать новый слот.")
		return 0
	end

	return 1
end

function get_item_milling_money(...)
--	Notice("Fee calculation")
	local Money = get_milling_money_main ( arg )
	return Money
end

function get_milling_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Hole_Num = 0

	local Num = GetItemForgeParam ( Item_damo , 1 )
	Num = TansferNum ( Num )
	Hole_Num = GetNum_Part1 ( Num )

	local Money_Need = ( Hole_Num + 1 ) * 50000
	
--	Notice("Calculation completed")
	return Money_Need
end

function begin_milling_item (...)
--	Notice("Start to forge")

	local Check_CanMilling = 0
	Check_CanMilling = can_milling_item_main ( arg )

	if Check_CanMilling == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Item_cailiao1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_cailiao2 = GetChaItem ( role , 2 , ItemBag [2] )

	local Money_Need = get_milling_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Currently there are"..Money_Have.."So much gold")
--	Notice ("Must deduct"..Money_Need.."So much gold")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	local ItemID_Cailiao1 = GetItemID ( Item_cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_cailiao2 )

	local R1 = 0
	local R2 = 0

	R1 = RemoveChaItem ( role , ItemID_Cailiao1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	R2 = RemoveChaItem ( role , ItemID_Cailiao2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )

	if R1 == 0 or R2 == 0 then
		LG( "Damo" , "Delete resource failed" )
	end
		
	local Sklv = 1
	

	local b = Check_CG_damo ( Item_damo , Sklv )
	if b == 0 then
		Damo_Shibai ( role , Item_damo )
		return 2
	end

--	Notice("Forging completed")
	
	Damo_ChengGong ( role , Item_damo )
	local cha_name = GetChaDefaultName ( role )
	LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Fusion successful" )

	return 1

end

function Check_Jiaguji ( Item_Cailiao1 , Item_Cailiao2 )

	local ItemID_Cailiao1 = GetItemID ( Item_Cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_Cailiao2 )

	if ItemID_Cailiao1 == 890 then
		return 1
	elseif ItemID_Cailiao2 == 890 then
		return 1
	end
	
	return 0
end

function Check_Cuihuafen ( Item_Cailiao1 , Item_Cailiao2 )

	local ItemID_Cailiao1 = GetItemID ( Item_Cailiao1 )
	local ItemID_Cailiao2 = GetItemID ( Item_Cailiao2 )

	if ItemID_Cailiao1 == 891 then
		return 1
	elseif ItemID_Cailiao2 == 891 then
		return 1
	end
	
	return 0
end

function  Check_HasHole ( Item_damo )

	local Num = GetItemForgeParam ( Item_damo , 1 )
	Num = TansferNum ( Num )
	local Hole_Num = GetNum_Part1 ( Num )
	return Hole_Num
end

function Check_CG_damo ( Item_damo , Sklv )

	local a = 0
	local Hole_Num = Check_HasHole ( Item_damo )
	
	if Hole_Num == 0 then
		a = 1
	end

	if Hole_Num == 1 then
		a = 1
	end

	if Hole_Num == 2 then
		a = 1
	end

	if Hole_Num == 3 then
		a = 1
	end

	local b = Percentage_Random ( a )
	
	return b
end

function Damo_Shibai ( role , Item_damo )
--	local Num = GetItemForgeParam ( Item_damo , 1 )
--	local i = 0
--	Num = TansferNum ( Num )
--	local Hole_Num = GetNum_Part1 ( Num )
	
--	if Hole_Num >= 1 then
--		local a = 0.7
--		local b = Percentage_Random ( a )
--		if b == 0 then
--			SystemNotice ( role , "Fusion failed. Existing socket in equipment disappeared!" )
--			Hole_Num = Hole_Num - 1
--			Delete_Forge_Eff ( role , Item_damo )
--		else
--			SystemNotice ( role , "Fusion failed. Luckily item is still intact" )
--		end

--	else
		local cha_name = GetChaDefaultName ( role )
		LG( "JingLian_ShiBai" , "Player"..cha_name.."Fusion failed" )
		SystemNotice ( role , "Fusion failed. Luckily item is still intact" )
--	end

--	Num = SetNum_Part1 ( Num , Hole_Num )
	
--	i = SetItemForgeParam ( Item_damo , 1 , Num )
--	if i == 0 then
--		LG( "Damo" , "set forging content failed" )
--	end
end

function Damo_ChengGong ( role , Item_damo )
	
	local Num = GetItemForgeParam ( Item_damo , 1 )
	local i = 0
	Num = TansferNum ( Num )
	local Hole_Num = GetNum_Part1 ( Num )
	
	if Hole_Num <= 3 then
		SystemNotice ( role , "\207\235\224\226\234\224 \231\224\226\229\240\248\229\237\224 \243\241\239\229\248\237\238. \207\238\235\243\247\229\237 \237\238\226\251\233 \241\235\238\242 \226 \238\225\238\240\243\228\238\226\224\237\232\232." )
		--SystemNotice ( role , "Плавка завершена успешно. Получен новый слот в оборудовании." )
		Hole_Num = Hole_Num + 1
	else
		SystemNotice ( role , "\204\224\234\241\232\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \241\235\238\242\238\226. \205\229\226\238\231\236\238\230\237\238 \241\228\229\235\224\242\252 \237\238\226\251\233 \241\235\238\242." )
		--SystemNotice ( role , "Максимальное количество слотов. Невозможно сделать новый слот." )
	end

	Num = SetNum_Part1 ( Num , Hole_Num )
	
	i = SetItemForgeParam ( Item_damo , 1 , Num )
	if i == 0 then
		LG( "Damo" , "set forging content failed" )
	end
end

function Delete_Forge_Eff ( role , Item_damo )
	local Jinglian_Lv = GetItem_JinglianLv ( Item_damo )
	if Jinglian_Lv == 0 then
		return
	end
	
	local Num = GetItemForgeParam ( Item_damo , 1 )

	local Item_Stone = {}
	local Item_StoneLv = {}
		
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	local j = 0
	local Del = 0
	for j = 2 , 0 , -1 do
		if Del == 0 then
			if Item_Stone [j] ~= 0 or Item_StoneLv[j] ~= 0 then
				Item_Stone[j] = 0
				Item_StoneLv[j] = 0
				Del = 1
			end
		end
	end
	
	Num = SetNum_Part2( Num , Item_Stone[0] )
	Num = SetNum_Part4( Num , Item_Stone[1] )
	Num = SetNum_Part6( Num , Item_Stone[2] )

	Num = SetNum_Part3( Num , Item_StoneLv[0] )
	Num = SetNum_Part5( Num , Item_StoneLv[1] )
	Num = SetNum_Part7( Num , Item_StoneLv[2] )

	local i = 0
	i = SetItemForgeParam ( Item_damo , 1 , Num )
	if i == 0 then
		LG( "Damo" , "set forging content failed" )
	end

	SystemNotice ( role , "\207\238\235\243\247\229\237 \225\238\237\243\241 \234\238\226\234\232" )
	--SystemNotice ( role , "Получен бонус ковки" )
end

function can_fusion_item(...)

--	Notice ( "See if it can be smelt")
	if arg.n ~= 12 and arg.n ~= 14 then
		SystemNotice ( arg[1] , "\199\237\224\247\229\237\232\229 \239\224\240\224\236\229\242\240\224 \231\224\228\224\237\238 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Значение параметра задано не верно"..arg.n )
		return 0
	end

--	local kkk = 0

--	for kkk = 2 , arg.n ,1 do
--		SystemNotice ( arg[1] , arg[kkk])
--	end

	local Check = 0

	Check = can_fusion_item_main ( arg )

	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_fusion_item_main ( Table )
	
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \238\225\238\240\243\228\238\226\224\237\232\255")
		--SystemNotice ( role ,"Незаконное количество оборудования")
		return 0
	end

	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )

	local  ItemType_Juanzhou = GetItemType ( Item_Juanzhou )
	if ItemType_Juanzhou ~= 60 then
		SystemNotice( role ,"\206\248\232\225\234\224 \239\240\232 \232\241\239\238\235\252\231\238\226\224\237\232\229 \241\226\232\242\234\224")
		--SystemNotice( role ,"Ошибка при использование свитка")
		return 0
	end

		local ItemID_Waiguan = GetItemID ( Item_Waiguan )
	if ItemID_Waiguan <= 15000 or  ItemID_Waiguan >= 20000 then
		SystemNotice( role ,"\207\240\229\228\236\229\242 \237\229 \239\240\229\228\237\224\231\237\224\247\229\237 \228\235\255 \231\224\242\238\247\234\232")
		--SystemNotice( role ,"Предмет не предназначен для заточки")
		return 0
	end

  	local Item_URE = GetItemAttr ( Item_Waiguan , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item_Waiguan , ITEMATTR_MAXENERGY )
	if	Item_URE < Item_MAXENERGY then
		SystemNotice( role ,"\211 \239\240\229\228\236\229\242\224 \237\229\228\238\241\242\224\242\238\247\237\238 \239\240\238\247\237\238\241\242\232")
		--SystemNotice( role ,"У предмета недостаточно прочности")
		return 0		
	end

  	local Item_FUSIONID_star = GetItemAttr ( Item_Shuxing , ITEMATTR_VAL_FUSIONID )
	local ItemID_shuxing_star =  GetItemID ( Item_Shuxing )
	if	Item_FUSIONID_star ==0  and ItemID_shuxing_star>=15000 then
		SystemNotice( role ,"\207\240\229\228\236\229\242 \237\229 \239\240\229\228\237\224\231\237\224\247\229\237 \228\235\255 \239\235\224\226\234\232")
		--SystemNotice( role ,"Предмет не предназначен для плавки")
		return 0		
	end

	local ItemType_Shuxing = GetItemType (Item_Shuxing)
	if  ItemType_Shuxing < 1  then
		SystemNotice( role ,"\205\229\226\238\231\236\238\230\237\238 \226\241\242\224\226\232\242\252 \226 \228\240\243\227\238\233 \239\240\229\228\236\229\242")
		--SystemNotice( role ,"Невозможно вставить в другой предмет")
		return 0
	elseif ItemType_Shuxing > 11 and  ItemType_Shuxing < 20 then
		SystemNotice( role ,"\205\229\226\238\231\236\238\230\237\238 \226\241\242\224\226\232\242\252 \226 \228\240\243\227\238\233 \239\240\229\228\236\229\242")
		--SystemNotice( role ,"Невозможно вставить в другой предмет")
		return 0
	elseif ItemType_Shuxing > 24  and ItemType_Shuxing ~= 27 then
		SystemNotice( role ,"\205\229\226\238\231\236\238\230\237\238 \226\241\242\224\226\232\242\252 \226 \228\240\243\227\238\233 \239\240\229\228\236\229\242")
		--SystemNotice( role ,"Невозможно вставить в другой предмет")
		return 0
	end

	local ItemType_Shuxing = GetItemType ( Item_Shuxing )
	local ItemType_Waiguan = GetItemType ( Item_Waiguan )
	local star=0
	if ItemType_Shuxing ~= 22 and ItemType_Shuxing ~=27 then
	star = 1
	end
	if ItemType_Waiguan~=27  then
		if ItemType_Shuxing ~= ItemType_Waiguan then
		SystemNotice( role ,"\205\229\241\238\238\242\226\229\242\241\242\226\232\229 \242\232\239\224 \238\225\238\240\243\228\238\226\224\237\232\255" )
		--SystemNotice( role ,"Несоответствие типа оборудования" )
		return 0
		end 
	elseif ItemType_Waiguan==27 and star == 1 then
		SystemNotice( role ,"\205\229\241\238\238\242\226\229\242\241\242\226\232\229 \242\232\239\224 \238\225\238\240\243\228\238\226\224\237\232\255" )
		--SystemNotice( role ,"Несоответствие типа оборудования" )
		return 0
	end

	local Check_RongHe = 0
	Check_RongHe = CheckFusionItem( Item_Waiguan , Item_Shuxing )
	if Check_RongHe == LUA_FALSE then
		SystemNotice( role ,"\206\225\224 \242\232\239\224 \239\240\229\228\236\229\242\224 \232\235\232 \234\235\224\241\241\224, \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242 \242\240\229\225\238\226\224\237\232\255\236." )
		--SystemNotice( role ,"Оба типа предмета или класса, не соответствует требованиям." )
		return 0
	end

	if ItemBagCount[3] == 0 then

	local Item_Waiguan_name = GetItemName ( ItemID_Waiguan )
	LG("Ronghe_CuiHuaJi","Combine armors and weapons without catalyst - [",Item_Waiguan_name,"] - No forging effect")
	end
	if ItemBagCount[3] ~= 0 then
	local Item_Cuihuaji =  GetChaItem ( role , 2 , ItemBag [3] )
	local ItemType_Cuihuaji =  GetItemType ( Item_Cuihuaji )
		if  ItemType_Cuihuaji ~= 61 then
			SystemNotice( role ,"\197\241\242\252 \237\229\234\238\242\238\240\251\229 \239\240\238\225\235\229\236\251 \241 \234\224\242\224\235\232\231\224\242\238\240\238\236, \237\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238" )
			--SystemNotice( role ,"Есть некоторые проблемы с катализатором, не может быть использовано" )
			return 0
		end
	end

	local Money_Need = getfusion_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \207\235\224\226\234\224 \237\229\226\238\231\236\238\230\237\224.")
		--SystemNotice( role ,"Недостаточно золота. Плавка невозможна.")
		return 0
	end
--SystemNotice(role ,"determination completed ")
	return 1
end

function begin_fusion_item(...)
--	Notice("Starts Fusion")

	local Check_Canfusion = 0
	Check_Canfusion = can_fusion_item_main ( arg )
	if Check_Canfusion == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )
	local ItemID_Waiguan = GetItemID ( Item_Waiguan )

	local Money_Need = getfusion_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
--	Notice ("Currently there are"..Money_Have.."So much gold")
--	Notice ("Must deduct"..Money_Need.."So much gold")
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	Check_Ronghe_Item = ronghe_item ( arg )

	if Check_Ronghe_Item == 0  then
		SystemNotice ( role ,"\207\235\224\226\234\224 \237\229 \243\228\224\235\238\241\252, \239\238\230\224\235\243\233\241\242\224, \239\240\238\226\229\240\252\242\229 \226\241\184")
		--SystemNotice ( role ,"Плавка не удалось, пожалуйста, проверьте всё")
	end
	--check_item_final_data ( Item_Waiguan )
	SynChaKitbag(role,13)

--------Notice("Fusion has ended")

	local cha_name = GetChaDefaultName ( role )
	SystemNotice ( role ,"\207\235\224\226\234\224 \231\224\226\229\240\248\229\237\224 \243\241\239\229\248\224\237\238")
	--SystemNotice ( role ,"Плавка завершена успешано")
	local Item_Waiguan_name = GetItemName ( ItemID_Waiguan )
	LG( "Ronghe_ShiBai" , "Player ["..cha_name.."] Fusion successful - "..Item_Waiguan_name )
	return 1

end

function get_item_fusion_money(...)
	
--	Notice("Fee calculation")
	local Money = getfusion_money_main ( arg )
	return Money
end

function getfusion_money_main ( Table )
	
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Shuxing = ItemBag [2]
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag_Shuxing )
	local Shuxing_Lv = 0

	local Shuxing_Lv =  GetItemLv ( Item_Shuxing )
	local Money_Need = Shuxing_Lv * 1000

--	Notice("Calculation completed")
	return Money_Need
end

function ronghe_item ( Table )
--	Notice("Ronghe_Item")
	

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )

	local ItemID_Juanzhou = GetItemID ( Item_Juanzhou )
	local ItemID_Waiguan = GetItemID ( Item_Waiguan )
	local ItemID_Shuxing = GetItemID ( Item_Shuxing )
	local ItemID_star = ItemID_Shuxing
	local flg=0
	if ItemBagCount[3] ~= 0 then
		local Item_Cuihuaji = GetChaItem ( role , 2 , ItemBag [3] )
		ItemID_Cuihuaji = GetItemID ( Item_Cuihuaji )
		flg=1
	end
		
	local Jinglianxinxi = GetItemForgeParam ( Item_Shuxing , 1 )

	if ItemID_Shuxing > 15000 then

		ItemID_Shuxing = GetItemAttr( Item_Waiguan , ITEMATTR_VAL_FUSIONID )

		SetItemAttr( Item_Waiguan , ITEMATTR_VAL_FUSIONID , ItemID_Shuxing )
	else
		SetItemAttr( Item_Waiguan , ITEMATTR_VAL_FUSIONID , ItemID_Shuxing )
	end

	local Check_FusionItem = FusionItem ( Item_Waiguan, Item_Shuxing )

	local star_lv=0
	if flg==1 then
		if ItemID_star < 15000 then 
			star_lv=10
		else
			star_lv=GetItemAttr ( Item_Shuxing , ITEMATTR_VAL_LEVEL )
		end
	else 
		star_lv=10
	end
	--SystemNotice( role , "star_lv="..star_lv )
	SetItemAttr ( Item_Waiguan , ITEMATTR_VAL_LEVEL , star_lv )
	--local i = GetItemAttr ( Item_Waiguan , ITEMATTR_VAL_LEVEL )
	--SystemNotice( role , "Item Lv="..i )
	local hole_num = Check_HasHole ( Item_Shuxing )

	if Check_FusionItem == 0    then
		SystemNotice( role , "\207\235\224\226\234\224 \237\229 \243\228\224\235\224\241\252")
		--SystemNotice( role , "Плавка не удалась")
		return
	--	else 
	--		for Check_FusionItem = 1 , 49 , 1 do
	--			RO = GetItemAttr ( Item_Waiguan , Check_FusionItem )
	--			SystemNotice( role , "Attribute"..Check_FusionItem.."="..RO )
	--		end
	end

	local Item_Shuxing_ENERGY  = GetItemAttr ( Item_Shuxing , ITEMATTR_ENERGY )
	local Item_Shuxing_MAXURE  = GetItemAttr ( Item_Shuxing , ITEMATTR_MAXURE )
	local cha_name = GetChaDefaultName ( role )
	local num={}
	local numAttr={}
	local b = 0
	local a = {}

	for b=1,5,1 do
		num [b]=0
		numAttr [b]=0
	end
	b = 0
	for i=1,47,1 do
	    a [i]=GetItemAttr ( Item_Shuxing , i )
		if a [i]~=0 then
	--		SystemNotice( role , a [i] )
				b = b + 1
				num [b]=i
				numAttr [b]=a[i]
		end
	end
	--LG( "ZhuangBeiRH_XinXi" , cha_name , ItemID_Waiguan , ItemID_Shuxing , Item_Shuxing_ENERGY , Item_Shuxing_MAXURE , num[1],numAttr[1],num[2],numAttr[2],num[3],numAttr[3],num[4],numAttr[4],num[5],numAttr[5],Jinglianxinxi,flg)
	LG( "ZhuangBeiRH_XinXi" , cha_name , ItemID_Waiguan , ItemID_Shuxing , Item_Shuxing_ENERGY , Item_Shuxing_MAXURE , STAR_ATTR[num[1]],numAttr[1],STAR_ATTR[num[2]],numAttr[2],STAR_ATTR[num[3]],numAttr[3],STAR_ATTR[num[4]],numAttr[4],STAR_ATTR[num[5]],numAttr[5],Jinglianxinxi,flg)

	local attr1=GetItemAttr ( Item_Waiguan , num[1] )
	local attr2=GetItemAttr ( Item_Waiguan , num[2] )
	local attr3=GetItemAttr ( Item_Waiguan , num[3] )
	local attr4=GetItemAttr ( Item_Waiguan , num[4] )
	local attr5=GetItemAttr ( Item_Waiguan , num[5] )
	LG( "RHWaiguan_XinXi" , cha_name , ItemID_Waiguan , STAR_ATTR[num[1]],attr1,STAR_ATTR[num[2]],attr2,STAR_ATTR[num[3]],attr3,STAR_ATTR[num[4]],attr4,STAR_ATTR[num[5]],attr5)

	SetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE , 20000 )
	SetItemAttr ( Item_Waiguan , ITEMATTR_URE , 20000 )
	local R1 = 0
	local R2 = 0
	local R3 = 1
	R1 = RemoveChaItem ( role , ItemID_Juanzhou , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )
	R2 = RemoveChaItem ( role , ItemID_Shuxing , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )
	if ItemID_Cuihuaji ~= 0 then
		R3 = RemoveChaItem ( role , ItemID_Cuihuaji , 1 , 2 , ItemBag [3] , 2 , 1 , 0 )
	end
	if R1 == 0 or R2 == 0 or R3 == 0 then
		SystemNotice( role , "\207\229\240\229\236\229\249\229\237\232\229 \239\240\229\228\236\229\242\224 \237\229 \243\228\224\235\238\241\252")
		--SystemNotice( role , "Перемещение предмета не удалось")
		return
	end

	if ItemID_Cuihuaji ~= 0 then
		local Check_SetItemForgeParam = SetItemForgeParam( Item_Waiguan , 1 , Jinglianxinxi )
		if Check_SetItemForgeParam == 0 then
			SystemNotice( role , "\205\229\238\225\245\238\228\232\236\238 \237\224\241\242\240\238\232\242\252 \239\224\240\224\236\229\242\240 \234\238\226\234\232")
			--SystemNotice( role , "Необходимо настроить параметр ковки")
			return
		end
	else 
		local Part1_Jinglianxinxi = GetNum_Part1 ( Jinglianxinxi )
		local Part2_Jinglianxinxi = GetNum_Part2 ( Jinglianxinxi )	
		local Part3_Jinglianxinxi = GetNum_Part3 ( Jinglianxinxi )
		local Part4_Jinglianxinxi = GetNum_Part4 ( Jinglianxinxi )
		local Part5_Jinglianxinxi = GetNum_Part5 ( Jinglianxinxi )
		local Part6_Jinglianxinxi = GetNum_Part6 ( Jinglianxinxi )
		local Part7_Jinglianxinxi = GetNum_Part7 ( Jinglianxinxi )
		Jinglianxinxi = SetNum_Part1 ( Jinglianxinxi , hole_num )
		Jinglianxinxi = SetNum_Part2 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part3 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part4 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part5 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part6 ( Jinglianxinxi , 0 )
		Jinglianxinxi = SetNum_Part7 ( Jinglianxinxi , 0 )
		local Check_SetItemForgeParam = SetItemForgeParam( Item_Waiguan , 1 , Jinglianxinxi )
		if Check_SetItemForgeParam == 0 then
			SystemNotice( role , "\205\229\238\225\245\238\228\232\236\238 \237\224\241\242\240\238\232\242\252 \239\224\240\224\236\229\242\240 \234\238\226\234\232")
			--SystemNotice( role , "Необходимо настроить параметр ковки")
			return
		end	
	end
end



--заточка шмота
function can_upgrade_item (...)
	if arg.n ~= 12 then
		SystemNotice ( arg[1] , "parameter value illegal"..arg.n )
		return 0
	end
	local Check = 0
	Check = can_beuplv_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_beuplv_item_main ( Table )
	local role = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}										
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	local ItemBagCount_beuplv = ItemBagCount [1]
	local ItemBag_beuplv = ItemBag [1]
	local ItemNum_beuplv = ItemCount [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv ) 
	local Item_beuplv_Type = GetItemType ( Item_beuplv )		
	local Item_beuplv_ID = GetItemID ( Item_beuplv )		
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		
	local Item_ScItem_Type = GetItemType ( Item_ScItem )		
	local Item_YxItem_Type = GetItemType ( Item_YxItem )		
	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	
	local ItemAttr_Val_Fusionid = GetItemAttr ( Item_beuplv , ITEMATTR_VAL_FUSIONID ) 
	if Item_beuplv_ID < 15000 or Item_beuplv_ID > 20000 then					
		SystemNotice( role ,"Этот предмет нельзя плавить ")
		return 0
	end
	if  ItemAttr_Val_Fusionid == 0 then
		SystemNotice( role , "Предмет невозможно улучшить ")
		return 0
	end
	if Item_beuplv_Lv >= 50 then					-- Максимальный уровень улучшения 180%
		SystemNotice( role ,"Вы достигли максимального уровня заточки ")
		return 0
	end
	if ItemBagCount_beuplv ~= 1 then				
		SystemNotice( role , "Недопустимый уровень улучшения ")
		return 0
	end
	if Item_ScItem_Type ~= 62 then
		SystemNotice( role , "У вас нет Улучшающего свитка ")
		return 0
	end
	if Item_YxItem_Type ~= 63 then
		SystemNotice( role , "У вас нет Усиливающего кристалла ")
		return 0
	end
	if ItemNum_beuplv ~= 1 then
		SystemNotice( role , "Неверный номер улучшения ")
		return 0
	end
	if ItemCount [0] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [2] ~= 1 then  
		SystemNotice ( role ,"Ошибка предмета из ИМ или игрового материала ")
		return 0
	end
	local Money_Need = getupgrade_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"У вас не хватает золота. Невозможно провести улучшение ")
		return 0
	end
	return 1
end



function begin_upgrade_item (...)
	local Check_Canbeuplv = 0
	Check_Canbeuplv = can_beuplv_item_main ( arg )
	if Check_Canbeuplv == 0 then
		return 0
	end
	local role = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}										
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )
	local ItemBag_beuplv = ItemBag [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv )    
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		
	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	 
	local R1 = 0
	local R2 = 0
	
	R1 = RemoveChaItem ( role , Item_ScItem_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		
	R2 = RemoveChaItem ( role , Item_YxItem_ID , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		
	if R1 == 0 or R2 == 0 then
			LG( "beuplv" , "Удалить предмет не удалось " )
	end
	local Money_Need = getupgrade_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )						
	local a = Check_CG_beuplv ( Item_beuplv_Lv )			
	if a == 0 then
		R1 = RemoveChaItem ( role , Item_ScItem_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		
		R2 = RemoveChaItem ( role , Item_YxItem_ID , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		
		if R1 == 0 or R2 == 0 then
			LG( "beuplv" , "Удалить предмет не удалось " )
		end
		local cha_name = GetChaDefaultName ( role )
		LG( "JingLian_ShiBai" , "Игрок "..cha_name.." не смог улучшить предмет " )
		SystemNotice( role , "Извините, заточить аппарель неудалось ")
		return 
	end
	Item_beuplv_Lv = Item_beuplv_Lv + 1 --25 = 150%
	SetChaKitbagChange( role , 1 )
	Set_Itembeuplv_Lv ( Item_beuplv , Item_beuplv_Lv )		
	SynChaKitbag( role, 4 )
	local LvD = GetItemAttr( Item_beuplv , ITEMATTR_VAL_LEVEL )
	SynChaKitbag(role,13)
	SystemNotice( role , "Вы заточили шмотку ")
	local cha_name = GetChaDefaultName ( role )
	LG( "JingLian_ShiBai" , "Игрок "..cha_name.." успешно провел усиление " )
	return 1
end

--function beuplv ( item )

--	local can_beuplv = 0
--	can_beuplv = can_beuplv_item(...)

--	if can_beuplv == 0 then
--		return 0
--	end
--end

function Get_Itembeuplv_Lv ( Item )								
	local Lv = GetItemAttr ( Item , ITEMATTR_VAL_LEVEL )
	return Lv
end

function Set_Itembeuplv_Lv ( Item , Item_Lv )							
	local i = 0
	i = SetItemAttr ( Item , ITEMATTR_VAL_LEVEL , Item_Lv )
	if i == 0 then
		LG( "Hecheng_BS","Failed to set gem level" )
	end
end

--Улудшение аппарелей
function Check_CG_beuplv ( Item_Lv )				
	local	ran = math.random ( 1, 100 )
	if Item_Lv <= 10 then					
		return 1			-- 100%
	end
	if Item_Lv>10 and Item_Lv <= 15 then			
		if ran <= 100 then		-- 50%
		return 1
		else
		return 0
		end
	end
	if Item_Lv>15 and Item_Lv <= 60 then			
		if ran <= 100 then		--50%
		return 1
		else
		return 0
		end
	end
end

function get_item_upgrade_money(...)
	local Money = getupgrade_money_main ( arg )
	return Money
end

function getupgrade_money_main ( Table )
	local role = 0
	local ItemBag = {}										
	local ItemCount = {}										
	local ItemBagCount = {}									
	local ItemBag_Num = 0									
	local ItemCount_Num = 0									
	local ItemBagCount_Num = 0								
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	local ItemBag_Waiguan = ItemBag [1]
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag_Waiguan )
	local Waiguan_Lv = 0
	local Waiguan_Lv =  Get_Itembeuplv_Lv ( Item_Waiguan )
	local Money_Need = ( Waiguan_Lv + 1 )*( Waiguan_Lv + 1 )*1000
	return Money_Need
end

function can_jlborn_item(...)
	if arg.n ~= 12  then
		SystemNotice ( arg[1] , "\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Параметр задан не верно"..arg.n )
		return 0
	end
	local Check = 0
	Check = can_jlborn_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_jlborn_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \238\225\238\240\243\228\238\226\224\237\232\255")
		--SystemNotice ( role ,"Незаконное количество оборудования")
		return 0
	end

	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )
	local Item_JLone_ID = GetItemID ( Item_JLone )
	local Item_JLother_ID = GetItemID ( Item_JLother )

	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone

	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother

	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )
	local Part2_JLone = GetNum_Part2 ( Num_JLone )	
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )

	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )
	local Part2_JLother = GetNum_Part2 ( Num_JLother )	
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 3 then
		SystemNotice(role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \242\240\229\225\243\229\242\241\255 \234\224\234 \236\232\237\232\236\243\236 3 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Для Брака фей требуется как минимум 3 свободных слота в инвентаре")
		return 0
	end	

	local  Item_EMstone_ID = GetItemID ( Item_EMstone )
	if Item_EMstone_ID ~= 3918 and Item_EMstone_ID ~= 3919 and Item_EMstone_ID ~= 3920 and Item_EMstone_ID ~= 3921 and Item_EMstone_ID ~= 3922 and Item_EMstone_ID ~= 3924 and Item_EMstone_ID ~= 3925 then
		SystemNotice( role ,"\206\248\232\225\234\224 \232\241\239\238\235\252\231\238\226\224\237\232\255 \196\229\236\238\237\232\247\229\241\234\238\227\238 \244\240\243\234\242\224")
		--SystemNotice( role ,"Ошибка использования Демонического фрукта")
		return 0
	end

	if Item_EMstone_ID == 3918 then--адский фрукт анжелы
	local i1 = CheckBagItem( role, 4530 )
	local i2 = CheckBagItem( role, 3434 )
		if i1 < 0 or i2 < 0 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3919 then--анжелы младшей фрукт
	local i1 = CheckBagItem( role, 4531 )
	local i2 = CheckBagItem( role, 3435 )
		if i1 < 0 or i2 < 0 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3920 then
	local i1 = CheckBagItem( role,1196 )
	local i2 = CheckBagItem( role,3436 )
		if i1 < 0 or i2 < 0 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3921 then
	local i1 = CheckBagItem( role, 4533 )
	local i2 = CheckBagItem( role, 3437 )
		if i1 < 0 or i2 < 0 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3922 then
	local i1 = CheckBagItem( role,4537 )      
	local i2 = CheckBagItem( role,3444 )
		if i1 < 10 or i2 < 10 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3924 then
	local i1 = CheckBagItem( role, 4540 )
	local i2 = CheckBagItem( role, 3443 )
		if i1 < 10 or i2 < 10 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3925 then
	local i1 = CheckBagItem( role, 1253 )
	local i2 = CheckBagItem( role, 3442 )
		if i1 < 10 or i2 < 10 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	local ItemType_JLone = GetItemType (Item_JLone)
	local ItemType_JLother = GetItemType (Item_JLother)
	if  ItemType_JLone ~=59 or ItemType_JLother ~=59  then
			SystemNotice( role ,"\194\251 \237\229 \239\238\236\229\241\242\232\235\232 \241\226\238\229\227\238 \239\232\242\238\236\246\224.")
			--SystemNotice( role ,"Вы не поместили своего питомца.")
		return 0
	end

	if ItemBag [1]==ItemBag [2] then
		SystemNotice( role ,"\204\232\235\251\233 \236\238\233 \240\229\225\184\237\238\234, \234\224\234 \236\238\230\237\238 \230\229\237\232\242\252\241\255 \237\224 \241\229\225\229?")
		-- SystemNotice( role ,"Милый мой ребёнок, как можно жениться на себе?ПОПРОБОВАТЬ КАК ВАРИК РАЩА")
		return 0		
	end

	--if  Part1_JLone ~=59 or Part1_JLother ~=59 and Part1_JLone ~=0 or Part1_JLother ~=0 then
		--SystemNotice( role ,"\210\238\235\252\234\238 \237\238\240\236\224\235\252\237\251\229 \244\229\232 \236\238\227\243\242 \226\241\242\243\239\224\242\252 \226 \225\240\224\234")
		--SystemNotice( role ,"Только нормальные феи могут вступать в брак")
		--return 0
	--end

	if  lv_JLone < 200 then
		--SystemNotice( role ,"\207\232\242\238\236\246\251 \237\232\230\229 20 \243\240\238\226\237\255 \237\229 \236\238\227\243\242 \230\229\237\232\242\252\241\255")
		SystemNotice( role ,"Феи ниже 200 уровня не могут жениться")
		return 0
	end

	if URE_JLone < MAXURE_JLone then
		SystemNotice( role ,"\193\240\224\234 \255\226\235\255\229\242\241\255 \242\240\243\228\238\229\236\234\232\236 \239\240\238\246\229\241\241\238\236. \207\238\230\224\235\243\233\241\242\224, \237\224\234\238\240\236\232\242\229 \239\238\235\237\238\241\242\252\254 \226\224\248\232\245 \239\232\242\238\236\246\229\226")
		--SystemNotice( role ,"Брак является трудоемким процессом. Пожалуйста, накормите полностью ваших питомцев")
		return 0
	end

	local Money_Need = getjlborn_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \208\238\230\228\229\237\232\229 \237\238\226\238\227\238 \239\232\242\238\236\246\224 \237\229\226\238\231\236\238\230\237\238.")
		--SystemNotice( role ,"Недостаточно золота. Рождение нового питомца невозможно.")
		return 0
	end
	return 1
end

function begin_jlborn_item(...)

	local Check_Canjlborn = 0
	Check_Canjlborn = can_jlborn_item_main ( arg )
	if Check_Canjlborn == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )

	local Money_Need = getjlborn_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )

	Check_JLBorn_Item = jlborn_item ( arg )
	if Check_JLBorn_Item == 0  then
		SystemNotice ( role ,"\193\240\224\234 \237\229 \243\228\224\235\241\255. \207\238\230\224\235\243\233\241\242\224, \239\229\240\229\239\240\238\226\229\240\252\242\229 \226\241\184")
		--SystemNotice ( role ,"Брак не удался. Пожалуйста, перепроверьте всё")
	end
	local cha_name = GetChaDefaultName ( role )
	SystemNotice ( role ,"\193\240\224\234 \231\224\226\229\240\248\229\237 \243\241\239\229\248\237\238")
	--SystemNotice ( role ,"Брак завершен успешно")
	LG( "JLBorn_ShiBai" , "Player"..cha_name.."'s pet fairy has gotten married successfully" )
	return 1
end

function get_item_jlborn_money(...)
	local Money = getjlborn_money_main ( arg )
	return Money
end

function getjlborn_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )

	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone

	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother
	local  Money_Need = 0
	if lv_JLone>400 then
		 Money_Need = 0
	end
	return Money_Need
end

function jlborn_item ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_EMstone_ID = GetItemID ( Item_EMstone )
	local Item_JLone_ID = GetItemID ( Item_JLone )

	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone

	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother

	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )
	local Part2_JLone = GetNum_Part2 ( Num_JLone )	
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )

	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )
	local Part2_JLother = GetNum_Part2 ( Num_JLother )	
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )

	local new_str = math.floor ((str_JLone+str_JLother)*0.125 )
	local new_con = math.floor ((con_JLone+con_JLother)*0.125 )
	local new_agi = math.floor ((agi_JLone+agi_JLother)*0.125 )
	local new_dex = math.floor ((dex_JLone+dex_JLother)*0.125 )
	local new_sta = math.floor ((sta_JLone+sta_JLother)*0.125 )
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		new_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		new_MAXURE = 32000
	end

	if Item_EMstone_ID ==3918 then--Фрукт анжелы(забирает джунов)
		local j1 = TakeItem( role, 0,681, 0 )
		local j2 = TakeItem( role, 0,7669, 0 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end 
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==681 or Item_JLother_ID ==7669 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 7127  , 1 , 4 )
			elseif lv_JLone>=0 and lv_JLone<0 and lv_JLother >=0 and lv_JLother<0 and rad>=88 then
				r1,r2 =MakeItem ( role , 7127  , 1 , 4 )
			elseif lv_JLone>=0 and lv_JLone<0 and lv_JLother >=0 and lv_JLother<0 and rad>=50 then 
				r1,r2 =MakeItem ( role , 7127  , 1 , 4 )
			elseif lv_JLone>=0 and lv_JLother >=0 and rad>=10 then
				r1,r2 =MakeItem ( role , 7127  , 1 , 4 )			
		end
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Item_newJL_ID = GetItemID ( Item_newJL )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )			
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
		
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3919 then
		local j1 = TakeItem( role, 0,450, 1 )
		local j2 = TakeItem( role, 0,450, 1 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==450 or Item_JLother_ID ==450 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 7080  , 1 , 4 )
			elseif lv_JLone>=200 and lv_JLone<205 and lv_JLother >=200 and lv_JLother<205 and rad>=88 then
				r1,r2 =MakeItem ( role , 7080  , 1 , 4 )
			elseif lv_JLone>=250 and lv_JLone<255 and lv_JLother >=250 and lv_JLother<255 and rad>=50 then 
				r1,r2 =MakeItem ( role , 7080  , 1 , 4 )
			elseif lv_JLone>=300 and lv_JLother >=300 and rad>=10 then
				r1,r2 =MakeItem ( role , 7080  , 1 , 4 )			
		end
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )	----------¶юЧЄ±кјЗ
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3920 then
		local j1 =TakeItem( role, 0, 451, 1 )
		local j2 = TakeItem( role, 0,451, 1 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==451 or Item_JLother_ID ==451 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=200 and lv_JLone<205 and lv_JLother >=200 and lv_JLother<205 and rad>=88 then	--12% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=250 and lv_JLone<305 and lv_JLother >=205 and lv_JLother<305 and rad>=50 then	--50% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=300 and lv_JLother >=305 and rad>=10 then	--90% шанс Мордо ДЖ
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )	--Мордо ДЖ
			else
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )	--Фея силы
			end
		elseif Item_JLone_ID ==451 or Item_JLother_ID ==451 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=200 and lv_JLone<205 and lv_JLother >=200 and lv_JLother<205 and rad>=94 then
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=205 and lv_JLone<305 and lv_JLother >=205 and lv_JLother<305 and rad>=75 then
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			elseif lv_JLone>=305 and lv_JLother >=305 and rad>=60 then
				r1,r2 =MakeItem ( role , 7081  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 7081  , 1 , 4 )	--Фея силы
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3921 then
		local j1 =TakeItem( role, 0, 4533, 10 )
		local j2 = TakeItem( role, 0,3437, 10 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then	--12% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then	--50% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then	--90% шанс мордо Дж
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )	--Мордо ДЖ	
			else
				r1,r2 =MakeItem ( role , 234  , 1 , 4 )	--Фея духа
			end
		elseif Item_JLone_ID ==681 or Item_JLother_ID ==681 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=94 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=75 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=60 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 234  , 1 , 4 )	--Фея духа
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
	
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3922 then
		local j1 =TakeItem( role, 0,4537, 10 )
		local j2 = TakeItem( role, 0,3444, 10 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then	--12% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then	--50% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then	--90% шанс Мордо ДЖ
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )	--Мордо Дж	
			else
				r1,r2 =MakeItem ( role , 235  , 1 , 4 )	--Фея точности
			end
		elseif Item_JLone_ID ==681 or Item_JLother_ID ==681 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=94 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=75 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=60 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			end
		else
			 r1,r2 =MakeItem ( role , 235  , 1 , 4 )	--Фея точности
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_JLother )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end
	if Item_EMstone_ID ==3924 then
		local j1 = TakeItem( role, 0,4540, 10 )
		local j2 = TakeItem( role, 0,3443, 10 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif  lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then---12%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then ---50%
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then   --90% шанс Мордо ДЖ
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )    --Мордо ДЖ
			else
				r1,r2 =MakeItem ( role , 236  , 1 , 4 )    --Фея ловкости
			end
		elseif Item_JLone_ID ==681 or Item_JLother_ID ==681 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=94 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=75 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=60 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 236  , 1 , 4 )    --Фея ловкости
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )    
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL= GetNum_Part7 ( Num_newJL )
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )    
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )     
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )     
	end
	if Item_EMstone_ID ==3925 then
		local j1 = TakeItem( role, 0,1253, 10 )
		local j2 = TakeItem( role, 0,3442, 10 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID ==680 or Item_JLother_ID ==680 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=88 then	--12% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=50 then	--50% Chance of Mordo JR
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=10 then	--90% Шанс мордо ДЖ
				r1,r2 =MakeItem ( role , 681  , 1 , 4 )	--Мордо ДЖ	
			else
				r1,r2 =MakeItem ( role , 237  , 1 , 4 )	--Фея Зла
			end
		elseif Item_JLone_ID ==681 or Item_JLother_ID ==681 then
			if Item_JLone_ID==Item_JLother_ID then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=20 and lv_JLone<25 and lv_JLother >=20 and lv_JLother<25 and rad>=94 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=25 and lv_JLone<35 and lv_JLother >=25 and lv_JLother<35 and rad>=75 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			elseif lv_JLone>=35 and lv_JLother >=35 and rad>=60 then
				r1,r2 =MakeItem ( role , 57  , 1 , 4 )
			end
		else
			r1,r2 =MakeItem ( role , 237 , 1 , 4 )	--Фея Зла
		end
		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )	
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE ) 	
	end

	local cha_name = GetChaDefaultName ( role )
	--LG( "star_JLZS_lg" ,cha_name,Item_JLone_ID , lv_JLone , str_JLone , con_JLone , agi_JLone , dex_JLone , sta_JLone , Item_JLother_ID , lv_JLother  , str_JLother , con_JLother , agi_JLother , dex_JLother , sta_JLother )
	LG( "star_JLZS_lg" ,cha_name, Item_EMstone_ID , Item_JLone_ID , lv_JLone ,  Item_JLother_ID , lv_JLother , Item_newJL_ID )

	R1 = RemoveChaItem ( role , Item_EMstone_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )
	if R1 == 0  then
		SystemNotice( role , "\211\228\224\235\229\237\232\229 \196\229\236\238\237\232\247\229\241\234\238\227\238 \244\240\243\234\242\224 \237\229 \243\228\224\235\238\241\252")
		--SystemNotice( role , "Удаление Демонического фрукта не удалось")
		return
	end
	 Elf_Attr_cs ( role , Item_JLone , Item_JLother )	
end

function can_energy_item(...)
--	Notice ( "Determine if its possible to recharge coral")
	if arg.n ~= 10 and arg.n ~= 14 then
		SystemNotice ( arg[1] , "\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Параметр задан не верно"..arg.n )
		return 0
	end
	local Check = 0
	Check = can_energy_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_energy_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\238\226")
		--SystemNotice ( role ,"Незаконное количество предметов")
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Вам потребуется 1 свободный слот в инвентаре")
		UseItemFailed ( role )
		return
	end

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )

	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )


	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )

	local item_energy = GetItemAttr(Item_mainitem,ITEMATTR_ENERGY)
	local item_maxenergy = GetItemAttr(Item_mainitem,ITEMATTR_MAXENERGY)

	if ItemType_mainitem~=29 then
		SystemNotice( role ,"\210\238\235\252\234\238 \253\237\229\240\227\232\255 \234\238\240\224\235\235\238\226 \236\238\230\229\242 \225\251\242\252 \239\238\239\238\235\237\229\237\224")
		--SystemNotice( role ,"Только энергия кораллов может быть пополнена")
		return 0	
	end

	if ItemID_otheritem ~= 1022 and ItemID_otheritem ~= 1024 then
		SystemNotice( role ,"\196\235\255 \231\224\240\255\228\234\232 \237\229\238\225\245\238\228\232\236\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\224\242\224\240\229\233\234\243")
		--SystemNotice( role ,"Для зарядки необходимо использовать батарейку")
		return 0	
	end

	if item_energy==item_maxenergy then
		SystemNotice( role ,"\221\237\229\240\227\232\255 \234\238\240\224\235\235\224 \229\249\184 \237\229 \232\241\242\238\249\229\237\224")
		--SystemNotice( role ,"Энергия коралла ещё не истощена")
		return 0	
	end

	local Money_Need = get_item_energy_money ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229 \245\226\224\242\224\229\242 \231\238\235\238\242\224. \205\229 \243\228\224\184\242\241\255 \239\229\240\229\231\224\240\255\228\232\242\252 \234\238\240\224\235\235")
		--SystemNotice( role ,"Не хватает золота. Не удаётся перезарядить коралл")
		return 0
	end
	--SystemNotice(role ,"determination completed ")
	return 1
end

function begin_energy_item(...)
	--Notice("Coral recharging")

	local Check_Canenergy = 0
	Check_Canenergy = can_energy_item_main ( arg )
	if Check_Canenergy == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )

	local Money_Need = get_item_energy_money ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	Check_Energy_Item = energy_item ( arg )
	if Check_Energy_Item == 0  then
		SystemNotice ( role ,"Coral recharge fail. Please check your procedure.")
	end
	-------check_item_final_data ( Item_Waiguan )
	--------Notice("Coral charging has ended")
	return 1
end

function get_item_energy_money(...)
	--Notice("Fee calculation")
	local Money = energy_money_main ( arg )
	return Money
end

function energy_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )

		local ItemID_otheritem = GetItemID ( Item_otheritem )

	if ItemID_otheritem==1022 then
		Money_Need=300
	else
		Money_Need=1000
	end
	--Notice("Calculation completed")
	return Money_Need
end

function energy_item ( Table )
	--	Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )
	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local item_energy = GetItemAttr(Item_mainitem,ITEMATTR_ENERGY)
		--SystemNotice( role , "Current energy=="..item_energy)

	local item_maxenergy = GetItemAttr(Item_mainitem,ITEMATTR_MAXENERGY)
		--SystemNotice( role , "Max Energy=="..item_maxenergy)

	local energy_differ=0
	local star=math.random(1,20)
		--SystemNotice( role , "star=="..star)
	if ItemID_otheritem==1022 then
		energy_differ=star*50
	else
		energy_differ=1500
	end
		--SystemNotice( role , "energy_differ=="..energy_differ)
	item_energy=item_maxenergy--math.min( item_maxenergy , (item_energy+energy_differ) )
		--SystemNotice( role , "item_energy=="..item_energy)
	SetItemAttr ( Item_mainitem ,ITEMATTR_ENERGY, item_energy )

	local cha_name = GetChaDefaultName ( role )
	LG( "star_CHONGDIAN_lg" ,cha_name, ItemID_mainitem , ItemID_otheritem )

	local R1 = 0
	R1 = RemoveChaItem ( role , Item_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	if R1 == 0 then
		SystemNotice( role , "\207\229\240\229\236\229\249\229\237\232\229 \239\240\229\228\236\229\242\224 \237\229 \243\228\224\235\238\241\252")
		--SystemNotice( role , "Перемещение предмета не удалось")
		return
	end
end

function can_getstone_item(...)
	--Notice ( "Determine whether to extract Gem")
	if arg.n ~= 10 and arg.n ~= 14 then
		SystemNotice ( arg[1] , "\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Параметр задан не верно"..arg.n )
		return 0
	end
	local Check = 0
	Check = can_getstone_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_getstone_item_main( Table )
	--Notice ( "Detect if it is possible to extract gem main function")
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\238\226")
		--SystemNotice ( role ,"Незаконное количество предметов")
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Вам потребуется 1 свободный слот в инвентаре")
		UseItemFailed ( role )
		return
	end

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )
	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )

	local Item_Stone = {}
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_mainitem , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )
	Item_Stone[0] = GetNum_Part2 ( Jinglianxinxi )
	Item_Stone[1] = GetNum_Part4 ( Jinglianxinxi )
	Item_Stone[2] = GetNum_Part6 ( Jinglianxinxi )
	
	Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )

	local checkstar=CheckItem_CanJinglian(Item_mainitem)
	if checkstar==0 then
		SystemNotice( role ,"\205\229\241\238\238\242\226\229\242\241\242\226\232\229 \242\232\239\238\226 \239\240\229\228\236\229\242\224")
		--SystemNotice( role ,"Несоответствие типов предмета")
		return 0	
	end
	if Item_Stone[0]==0 and Item_Stone[1]==0 and Item_Stone[2]==0 then
		SystemNotice( role ,"\209\237\224\240\255\230\229\237\232\229 \237\229 \243\241\242\224\237\224\226\235\232\226\224\229\242\241\255 \225\229\231 \241\224\236\238\246\226\229\242\238\226")
		--SystemNotice( role ,"Снаряжение не устанавливается без самоцветов")
		return 0		
	end
	if ItemID_otheritem ~= 1020 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \232\241\239\238\235\252\231\243\233\242\229 \202\235\229\249\232 \202\243\231\237\229\246\224")
		--SystemNotice( role ,"Пожалуйста, используйте Клещи Кузнеца")
		return 0			
	end

	local Money_Need = getstone_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \226\251\242\224\249\232\242\252 \241\224\236\238\246\226\229\242")
		--SystemNotice( role ,"Недостаточно золота. Невозможно вытащить самоцвет")
		return 0
	end
	--SystemNotice(role ,"determination completed ")
	return 1
end

function begin_getstone_item(...)
	--Notice("Entering gem extraction")

	local Check_Cangetstone = 0
	Check_Cangetstone = can_getstone_item_main ( arg )
	if Check_Cangetstone == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )

	local Money_Need = getstone_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	Check_TiChun_Item = getstone_item ( arg )
	if Check_TiChun_Item == 0  then
		SystemNotice ( role ,"\196\238\225\251\247\224 \241\224\236\238\246\226\229\242\238\226 \237\229 \243\228\224\235\224\241\252. \207\238\230\224\235\243\233\241\242\224, \239\238\226\242\238\240\232\242\229 \239\240\238\246\229\241\241")
		--SystemNotice ( role ,"Добыча самоцветов не удалась. Пожалуйста, повторите процесс")
	end
	--------Notice("Extraction of gem completed")
	return 1
end

function get_item_getstone_money(...)
	--Notice("Fee calculation")
	local Money = getstone_money_main ( arg )
	return Money
end

function getstone_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	
	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	
	local Item_StoneLv = {}
	local Jinglianxinxi = GetItemForgeParam ( Item_mainitem , 1 )
	Jinglianxinxi = TansferNum ( Jinglianxinxi )

	Item_StoneLv[0] = GetNum_Part3 ( Jinglianxinxi )
	Item_StoneLv[1] = GetNum_Part5 ( Jinglianxinxi )
	Item_StoneLv[2] = GetNum_Part7 ( Jinglianxinxi )

	local Money_Need = (Item_StoneLv[0]+Item_StoneLv[1]+Item_StoneLv[2])*10000

	return Money_Need
end

function getstone_item ( Table )
	--Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )
	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local Item_mainitem_Lv =  GetItemLv ( Item_mainitem )
	local Item_otheritem_Lv =  GetItemLv ( Item_otheritem )

	local Num = GetItemForgeParam ( Item_mainitem , 1 )
	Num = TansferNum ( Num )
	local lg_Num=Num
		--SystemNotice( role , "Num=="..Num)
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Item_StoneID = {}
     
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )

	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )

	Item_StoneID[0] = StoneTpye_ID[Item_Stone[0]]
	Item_StoneID[1] = StoneTpye_ID[Item_Stone[1]]
	Item_StoneID[2] = StoneTpye_ID[Item_Stone[2]]

	local r1 = 0
	local r2 = 0
	local Item_Lv = 0
	local item_tureID=0
	if Item_StoneID[0]~=0 then
		item_tureID = Item_StoneID[0]
		--Item_Stone[0] = 0
		Item_Lv = Item_StoneLv[0]
		Item_StoneLv[0] = Item_StoneLv[0]-1
		if Item_StoneLv[0]==0 then
			Item_Stone[0] = 0
		end
	elseif Item_StoneID[0]==0 and Item_StoneID[1]~=0 then
		item_tureID = Item_StoneID[1]
		--Item_Stone[1] = 0
		Item_Lv = Item_StoneLv[1]
		Item_StoneLv[1] = Item_StoneLv[1]-1
		if Item_StoneLv[1]==0 then
			Item_Stone[1] = 0
		end
	elseif Item_StoneID[0]==0 and Item_StoneID[1]==0  and Item_StoneID[2]~=0 then
		item_tureID = Item_StoneID[2]
		--Item_Stone[2] = 0
		Item_Lv = Item_StoneLv[2]
		Item_StoneLv[2] = Item_StoneLv[2]-1
		if Item_StoneLv[2]==0 then
			Item_Stone[2] = 0
		end
	else 
		SystemNotice( role , "\207\240\232 \228\238\225\251\247\232 \241\224\236\238\246\226\229\242\224 \239\240\238\232\231\238\248\235\224 \238\248\232\225\234\224")
		--SystemNotice( role , "При добычи самоцвета произошла ошибка")
		return		
	end
	r1,r2 =MakeItem ( role , item_tureID , 1 , 2 )	
	local Item_ture = GetChaItem ( role , 2 , r2 )

	SetItemAttr ( Item_ture , ITEMATTR_VAL_BaoshiLV , Item_Lv )

	Num = SetNum_Part2 ( Num , Item_Stone[0] )
	Num = SetNum_Part3 ( Num , Item_StoneLv[0] )
	Num = SetNum_Part4 ( Num , Item_Stone[1] )
	Num = SetNum_Part5 ( Num , Item_StoneLv[1] )
	Num = SetNum_Part6 ( Num , Item_Stone[2] )
	Num = SetNum_Part7 ( Num , Item_StoneLv[2] )
	SetItemForgeParam ( Item_mainitem , 1 , Num )
	--------------LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_tiqu_lg" ,cha_name, item_tureID , Item_Lv , lg_Num , Num )

	local R1 = 0
	R1 = RemoveChaItem ( role , ItemID_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	if R1 == 0 then
		SystemNotice( role , "\207\229\240\229\236\229\249\229\237\232\229 \239\240\229\228\236\229\242\224 \237\229 \243\228\224\235\238\241\252")
		--SystemNotice( role , "Перемещение предмета не удалось")
		return
	end
	
end

--can_manufacture_item
--begin_manufacture_item
--end_manufacture_item
function can_manufacture_item (...)
	--Notice("Starts to determine")
	local ItemBagCount = arg[2]
	--Notice("Parameter unit"..ItemBagCount)
	local Length = ItemBagCount+3
	if arg.n ~= Length then
		Notice("\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n)
		--Notice("Параметр задан не верно"..arg.n)
		return 0
	end	
	local Check = 0
--	SystemNotice( arg[1] , "transfer combine test main function")
	Check = can_manufacture_item_main ( arg )
	if Check == 1 then		
		return 1
	else
		return 0
	end
end

function can_manufacture_item_main ( Table )
	--Notice ( "Entering combining main function")
	local role = 0
	local ItemBag = {}
	local ItemBagCount = 0
	
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Вам потребуется 1 свободный слот в инвентаре")
		UseItemFailed ( role )
		return
	end
	local i = 0
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for i = 1 , ItemBagCount , 1 do
		--if ItemBag[i] == 0  then
		--	SystemNotice( role , "Illegal item unit")
		--	return 0
		--end

		Item[i] = GetChaItem ( role , 2 , ItemBag [i] )
		ItemID[i] = GetItemID ( Item[i] )
		ItemType[i] = GetItemType ( Item[i] )
	end

	--SystemNotice( role ,"ItemType[1]=="..ItemType[1])
	--SystemNotice( role ,"ItemType[2]=="..ItemType[2])
	if ItemType[1] ~= 59 then
		SystemNotice( role ,"\194\241\229\236\238\227\243\249\232\233: \204\238\184 \228\232\242\255, \239\238\230\224\235\243\233\241\242\224 \245\238\242\255\225\251 \226\227\235\255\237\232.")
		--SystemNotice( role ,"Всемогущий: Моё дитя, пожалуйста хотябы вгляни.")
		return 0
	end
	local URE_JLone = GetItemAttr( Item[1] ,ITEMATTR_URE )
	if URE_JLone<=0 then
		SystemNotice( role ,"\194\241\229\236\238\227\243\249\232\233: \221\242\238 \241\235\232\248\234\238\236 \230\229\241\242\238\234\238! \207\238\230\224\235\243\233\241\242\224, \237\224\234\238\240\236\232\242\229 \226\224\248\229\227\238 \239\232\242\238\236\246\224!")
		--SystemNotice( role ,"Всемогущий: Это слишком жестоко! Пожалуйста, накормите вашего питомца!")
		return 0	
	end

	local Num_JL = GetItemForgeParam ( Item[1] , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	local JL_jineng=0
	local JL_jineng_lv=0
	local life_lv = 0
	if ItemID[2]==2300 then
		if Part2_JL==13 then
			JL_jineng=Part2_JL
			JL_jineng_lv=Part3_JL
		elseif Part4_JL==13 then
			JL_jineng=Part4_JL
			JL_jineng_lv=Part5_JL
		elseif Part6_JL==13 then
			JL_jineng=Part6_JL
			JL_jineng_lv=Part7_JL
		end
		life_lv=GetSkillLv( role , SK_ZHIZAO )
	end
	if ItemID[2]==2301 then
		if Part2_JL==14 then
			JL_jineng=Part2_JL
			JL_jineng_lv=Part3_JL
		elseif Part4_JL==14 then
			JL_jineng=Part4_JL
			JL_jineng_lv=Part5_JL
		elseif Part6_JL==14 then
			JL_jineng=Part6_JL
			JL_jineng_lv=Part7_JL
		end	
		life_lv=GetSkillLv( role , SK_ZHUZAO )
	end
	if ItemID[2]==2302 then
		if Part2_JL==16 then
			JL_jineng=Part2_JL
			JL_jineng_lv=Part3_JL
		elseif Part4_JL==16 then
			JL_jineng=Part4_JL
			JL_jineng_lv=Part5_JL
		elseif Part6_JL==16 then
			JL_jineng=Part6_JL
			JL_jineng_lv=Part7_JL
		end
		life_lv=GetSkillLv( role , SK_PENGREN )
	end
	if ItemID[3]~=1067 and ItemID[3]~=1068 and ItemID[3]~=1069 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \232\241\239\238\235\252\231\243\233\242\229 \237\229\238\225\245\238\228\232\236\251\233 \232\237\241\242\240\243\236\229\237\242")
		--SystemNotice( role ,"Пожалуйста, используйте необходимый инструмент")
		return 0	
	end
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then
		local Gj_ure=GetItemAttr ( Item[3] , ITEMATTR_URE )
		if Gj_ure<=0 then
			Gj_ure=0
			SystemNotice( role ,"\207\240\238\247\237\238\241\242\252 \232\237\241\242\240\243\236\229\237\242\224 \241\235\232\248\234\238\236 \237\232\231\234\224. \223 \239\240\229\228\235\224\227\224\254 \226\224\236 \226\231\255\242\252 \241 \241\238\225\238\233 \240\229\236\238\237\242\237\251\233 \232\237\241\242\240\243\236\229\237\242 \232 \238\242\239\240\224\226\232\242\241\255 \226 \194\229\241\237\238\227\238\240\224\228 \228\235\255 \240\229\236\238\237\242\224.")
			--SystemNotice( role ,"Прочность инструмента слишком низка. Я предлагаю вам взять с собой ремонтный инструмент и отправится в Весногорад для ремонта.")
			return 0
		end
		if ItemID[3]==1068 and  ItemID[2]~=2300 then
			SystemNotice( role ,"\210\232\239 \247\229\240\242\229\230\224 \232 \200\237\241\242\240\243\236\229\237\242 \237\229\241\238\238\242\226\229\242\241\242\226\243\254\242")
			--SystemNotice( role ,"Тип чертежа и Инструмент несоответствуют")
			return 0			
		end
		if ItemID[3]==1069 and  ItemID[2]~=2301 then
			SystemNotice( role ,"\210\232\239 \247\229\240\242\229\230\224 \232 \200\237\241\242\240\243\236\229\237\242 \237\229\241\238\238\242\226\229\242\241\242\226\243\254\242")
			--SystemNotice( role ,"Тип чертежа и Инструмент несоответствуют")	
			return 0			
		end	
		if ItemID[3]==1067 and ItemID[2]~=2302 then
			SystemNotice( role ,"\210\232\239 \247\229\240\242\229\230\224 \232 \200\237\241\242\240\243\236\229\237\242 \237\229\241\238\238\242\226\229\242\241\242\226\243\254\242")
			--SystemNotice( role ,"Тип чертежа и Инструмент несоответствуют")
			return 0			
		end
		local Gj_lv=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
		JL_jineng_lv=3*JL_jineng_lv+1
		if JL_jineng_lv<Gj_lv then
			SystemNotice( role ,"\202\226\224\235\232\244\232\234\224\246\232\255 \212\229\232 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242 \243\240\238\226\237\254 \232\237\241\242\240\243\236\229\237\242\224")
			--SystemNotice( role ,"Квалификация Феи не соответствует уровню инструмента")
			return 0			
		end
	end

	if ItemType[2] ~= 69 then
		SystemNotice( role ,"\194\241\229\236\238\227\243\249\232\233: \194\251 \241\236\229\229\242\229 \232\241\239\238\235\252\231\238\226\224\242\252 \239\238\228\228\229\235\252\237\251\233 \215\229\240\242\184\230?")
		--SystemNotice( role ,"Всемогущий: Вы смеете использовать поддельный Чертёж?")
		return 0
	end
		--SystemNotice( role ,"ItemBag [1]=="..ItemBag [1])
		--SystemNotice( role ,"ItemBag [2]=="..ItemBag [2])
		--SystemNotice( role ,"ItemBag [3]=="..ItemBag [3])
		--SystemNotice( role ,"ItemBag [4]=="..ItemBag [4])
		--SystemNotice( role ,"ItemBag [5]=="..ItemBag [5])
		--SystemNotice( role ,"ItemBag [6]=="..ItemBag [6])

		--SystemNotice( role ,"ItemID1=="..ItemID[4])
		--SystemNotice( role ,"ItemID2=="..ItemID[5])
		--SystemNotice( role ,"ItemID3=="..ItemID[6])

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )
	if life_lv<paper_lv then
		SystemNotice( role ,"\202\226\224\235\232\244\232\234\224\246\232\255 \239\229\240\241\238\237\224\230\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242 \243\240\238\226\237\254 \215\229\240\242\229\230\224")
		--SystemNotice( role ,"Квалификация персонажа не соответствует уровню Чертежа")
		return 0
	end
	local paper_id1=GetItemAttr(Item[2], ITEMATTR_VAL_STR )
	--SystemNotice( role ,"Required item 1ID=="..paper_id1)

	local paper_id2=GetItemAttr(Item[2], ITEMATTR_VAL_CON )
	--SystemNotice( role ,"Required item 2ID=="..paper_id2)

	local paper_id3=GetItemAttr(Item[2], ITEMATTR_VAL_DEX )
	--SystemNotice( role ,"Required item 3ID=="..paper_id3)

	if ItemID[4]~=paper_id1 or  ItemID[5]~=paper_id2 or  ItemID[6]~=paper_id3 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\240\238\226\229\240\252\242\229 \242\232\239 \236\224\242\229\240\232\224\235\224 \232 \240\224\231\236\229\249\229\237\232\229 \229\227\238 \239\238\231\232\246\232\232, \247\242\238\225\251 \238\237\224 \241\238\226\239\224\228\224\235\224 \241 \242\240\229\225\238\226\224\237\232\255\236\232 \226 \247\229\240\242\229\230\229.")
		--SystemNotice( role ,"Пожалуйста, проверьте тип материала и размещение его позиции, чтобы она совпадала с требованиями в чертеже.")
		return 0		
	end

	local Num_paper = GetItemForgeParam ( Item[2] , 1 )
	Num_paper = TansferNum ( Num_paper )
	local Part1_paper = GetNum_Part1 ( Num_paper )
	local Part2_paper = GetNum_Part2 ( Num_paper )
	--SystemNotice( role ,"Required Item 1 Quantity=="..Part2_paper)

	local Part3_paper = GetNum_Part3 ( Num_paper )	
	local Part4_paper = GetNum_Part4 ( Num_paper )
	--SystemNotice( role ,"Required item 2 quantity=="..Part4_paper)

	local Part5_paper = GetNum_Part5 ( Num_paper )
	local Part6_paper = GetNum_Part6 ( Num_paper )
	--SystemNotice( role ,"Required item 3 quantity=="..Part6_paper)

	local Part7_paper = GetNum_Part7 ( Num_paper )
	local i1 = CheckBagItem( role, ItemID[4] )
	local i2 = CheckBagItem( role, ItemID[5] )
	local i3 = CheckBagItem( role, ItemID[6] )
	--SystemNotice( role ,"Required item 3 quantity i1="..i1)
	--SystemNotice( role ,"Required item 3 quantity i2=="..i2)
	--SystemNotice( role ,"Required item 3 quantity i2=="..i2)
	if i1 < Part2_paper or i2 < Part4_paper or i3 < Part6_paper  then
		SystemNotice( role ,"\206\242\241\243\242\241\242\226\243\229\242 \237\229\234\238\242\238\240\238\229 \234\238\235\232\247\229\241\242\226\238 \237\229\238\225\245\238\228\232\236\251\245 \239\240\229\228\236\229\242\238\226")
		--SystemNotice( role ,"Отсутствует некоторое количество необходимых предметов")
		return 0
	end
	local paper_num=GetItemAttr(Item[2], ITEMATTR_VAL_STA )
		--SystemNotice( role ,"Blueprint usage count=="..paper_num)
	if paper_num==0 then
		SystemNotice( role ,"\215\229\240\242\184\230 \255\226\235\255\229\242\241\255 \243\230\229 \225\229\241\239\238\235\229\231\237\251\236.")
		--SystemNotice( role ,"Чертёж является уже бесполезным.")
		return 0
	end
	local a1 = CheckBagItem( role, 855 )
	local a1_num=GetItemAttr(Item[2], ITEMATTR_MAXURE )
	if a1< a1_num then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\238\237\229\242 \212\229\232 \226 \240\254\234\231\224\234\229.")
		--SystemNotice( role ,"Недостаточно монет Феи в рюкзаке.")
		return 0
	end
	--SystemNotice( role ,"Done")
	return 1
end

function Read_manufacture ( Table )

	local role = Table [1]
	local ItemBagCount = Table [2]
	local ItemBag = {}
--	local ItemCount = {}
	local i = 0
	--Notice( " Read_manufacture_ItemBagCount=="..ItemBagCount)
	if ItemBagCount==0 then
		return role , ItemBag , ItemBagCount
	end
	for i = 1 , ItemBagCount , 1 do
		local ReadNow = i + 2
		ItemBag [i] = Table [ReadNow]
		--Notice( " Read_manufacture_ItemBag"..i.."=="..ItemBag [i])
		--ItemCount [i] = Table [ReadNow+1]
	end

	return role , ItemBag , ItemBagCount
end

function begin_manufacture_item (...)
	--Notice(  "Manufacturing")
	--local check_begin = can_manufacture_item (...)
	--if check_begin == 1 then		
	--	return 1
	--else
	--	return 0
	--end
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	
	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end
	
	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
		--if ItemBag[i] == 0  then
		--	SystemNotice( role , "Illegal item unit")
		--	return 0
		--end
	--end
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
	end
	local Gj_lv= 0
	if ItemID[3]==1068 then
		Gj_lv=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
	end
	local life_lv=GetSkillLv( role , SK_ZHIZAO )

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )

	local paper_energy = GetItemAttr(Item[2], ITEMATTR_MAXENERGY )-100
	local star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100
	local star_radom = math.random ( 1, 100 )
			--SystemNotice( role , "star_good=="..star_good)
			--SystemNotice( role , "star_radom=="..star_radom)
	local eleven=2
	local a1 = star_radom+7
	local a2 = star_radom+14
	local a3 = star_radom+21
	local a4  = star_radom+28
	local a5  = star_radom+35
	local a6  = star_radom+42
	local a7  = star_radom+49
	local a8  = star_radom+56
	local a9  = star_radom+63

	if star_good<star_radom then
		eleven=1
	elseif star_good>=98 then
		eleven=11
	elseif star_good>=a9 then
		eleven=10
	elseif star_good>=a8 then
		eleven=9
	elseif star_good>=a7 then
		eleven=8
	elseif star_good>=a6 then
		eleven=7
	elseif star_good>=a5 then
		eleven=6
	elseif star_good>=a4 then
		eleven=5
	elseif star_good>=a3 then
		eleven=4
	elseif star_good>=a2 then
		eleven=3
	elseif star_good>=a1 then
		eleven=2
	end
	local star_begin=3*(1+paper_lv)
	local star_end=5*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	local run_time = star
	--local WORD_LIST = "AbCdE"
	--local star1=math.random ( 1, 52 )
	--local star2=math.random ( 1, 52 )
	--local star3=math.random ( 1, 52 )
	--local star4=math.random ( 1, 52 )
	--local star5=math.random ( 1, 52 )
	--local star6=math.random ( 1, 52 )
	--local star7=math.random ( 1, 52 )
	--local star8=math.random ( 1, 52 )

	--local WORD_LIST1 = ""..WORD[star1]..WORD[star2]..WORD[star3]
	--local WORD_LIST2 = ""..WORD[star1]..WORD[star2]..WORD[star3]..WORD[star4]
	--local WORD_LIST3 =""..WORD[star1]..WORD[star2]..WORD[star3]..WORD[star4]..WORD[star5]
	--local WORD_LIST4 = ""..WORD[star1]..WORD[star2]..WORD[star3]..WORD[star4]..WORD[star5]..WORD[star6]
	--local WORD_LIST5 =""..WORD[star1]..WORD[star2]..WORD[star3]..WORD[star4]..WORD[star5]..WORD[star6]..WORD[star7]
	--local WORD_LIST6 =""..WORD[star1]..WORD[star2]..WORD[star3]..WORD[star4]..WORD[star5]..WORD[star6]..WORD[star7]..WORD[star8]

	--if eleven==1 then
	--	WORD_LIST=WORD_LIST1
	--elseif eleven==2 then
	--	WORD_LIST=WORD_LIST2
	--elseif eleven==3 then
	--	WORD_LIST=WORD_LIST3
	--elseif eleven==4 then
	--	WORD_LIST=WORD_LIST4
	--elseif eleven==5 then
	--	WORD_LIST=WORD_LIST5
	--else
	--	WORD_LIST=WORD_LIST6
	--end
	return 2,run_time,eleven
end

function begin_manufacture1_item (...)
	--Notice(  "Crafting")
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
	--	if ItemBag[i] == 0  then
	--		SystemNotice( role , "Illegal item unit")
	--		return 0
	--	end
	--end
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	--Notice( " Crafting_ItemBagCount=="..ItemBagCount)
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
		--Notice( " Crafting_ItemID["..j.."]=="..ItemID[j])
		--Notice( " Crafting_ItemType["..j.."]=="..ItemType[j])
	end

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )
	--Notice(  "paper_lv"..paper_lv)

	local star_begin=3*(1+paper_lv)
	local star_end=5*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	local run_time = star
	local WORD1 =math.random ( 1, 6 )
	local WORD2 =math.random ( 1, 6 )
	local WORD3 =math.random ( 1, 6 )
	local str =""..WORD1..","..WORD2..","..WORD3
	--Notice(  "Crafting_str=="..str)
	return 2,run_time,str
end

function begin_manufacture2_item (...)
	--Notice(  "Cooking")
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	--Notice(  "aaaaaaaaaaaa")

	local Check1 = can_manufacture_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
	--	if ItemBag[i] == 0  then
	--		SystemNotice( role , "Illegal item unit")
	--		return 0
	--	end
	--end
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	--Notice(  "bbbbbbbbbbbb")
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
	end

	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )
	--Notice(  "paper_lv"..paper_lv)

	local star_begin=3*(1+paper_lv)
	local star_end=4*(1+paper_lv)
	local star=math.random ( star_begin , star_end )
	if star>64 then
		star=64
	end
	local run_time = star
	
	local star_ok = 12
			--SystemNotice( role , "run_time==="..run_time)

	return 2,run_time,star_ok
end

function begin_manufacture3_item (...)
	--Notice(  "Analyze")
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local Check1 = can_fenjie_item_main ( arg )
	if Check1 ~= 1 then
		return 0
	end

	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
	--	if ItemBag[i] == 0  then
	--		SystemNotice( role , "Illegal item unit")
	--		return 0
	--	end
	--end
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
	end
	local Item_Lv =  GetItemLv ( Item[3] )
	if ItemID[3]>=5000 then
		local tmd_rad=math.random ( 1 , 10 )
		if tmd_rad==1 then
			Item_Lv=80
		elseif tmd_rad==2 then
			Item_Lv=70
		elseif tmd_rad==3 then
			Item_Lv=60
		elseif tmd_rad==4 then
			Item_Lv=50
		elseif tmd_rad==5 then
			Item_Lv=40
		elseif tmd_rad==6 then
			Item_Lv=30
		elseif tmd_rad==7 then
			Item_Lv=20
		else
			Item_Lv=10
		end
	end
	local base_rad=0
	base_rad=math.max((80-math.max(Item_Lv,10))*0.01,0.15)

	local Num_JL = GetItemForgeParam ( Item[1] , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	local JL_jineng=0
	local JL_jineng_lv=0
	if Part2_JL==16 then
		JL_jineng=Part2_JL
		JL_jineng_lv=Part3_JL
	elseif Part4_JL==16 then
		JL_jineng=Part4_JL
		JL_jineng_lv=Part5_JL
	elseif Part6_JL==16 then
		JL_jineng=Part6_JL
		JL_jineng_lv=Part7_JL
	end

	local Gj_lv=0
	if  ItemID[2]==1070 then
		Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
	end

	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )

	local run_time = math.random ( 4, 8 )
	local word_test = math.floor((JL_jineng_lv*0.05+life_lv*0.02+Gj_lv*0.03+base_rad)*100000)
	if word_test>99999 then
		word_test=99999	
	end
	local word_radom = math.random ( 10000, 99999 )
	local str =""..word_test..","..word_radom
	--Notice(  "Begin - Analyze - End")

	return 2,run_time,str
end

function end_manufacture_item (...)
	--Notice(  "end_manufacture_item")
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )
	--Notice( "Final results arg[arg.n]=="..arg[arg.n])
	--Notice( "Final acquisition arg.n=="..arg.n)

	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
		--Notice( " end_manufacture_item_ItemBag"..i.."=="..ItemBag [i])
	--	if ItemBag[i] == 0  then
	--		SystemNotice( role , "Illegal item unit")
	--		return 0
	--	end
	--end
	local star_check=0 
	--SystemNotice( role , "end_manufacture_item_star_check=="..star_check)
	star_check=arg[arg.n] 
	--SystemNotice( role , "Final acquisition star_check=="..star_check)
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	local check = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
	end
	local paper_id1=GetItemAttr(Item[2], ITEMATTR_VAL_STR )
	local paper_id2=GetItemAttr(Item[2], ITEMATTR_VAL_CON )
	local paper_id3=GetItemAttr(Item[2], ITEMATTR_VAL_DEX )
	local Num_paper = GetItemForgeParam ( Item[2] , 1 )
	Num_paper = TansferNum ( Num_paper )
	local Part2_paper = GetNum_Part2 ( Num_paper )
	local Part4_paper = GetNum_Part4 ( Num_paper )
	local Part6_paper = GetNum_Part6 ( Num_paper )


	local life_lv = 0
	local Gj_lv= 0
	local paper_lv = GetItemAttr(Item[2], ITEMATTR_URE )
	local num_x=1
	local star_num_qulity=4
	if ItemID[2]==2300 then
		life_lv=GetSkillLv( role , SK_ZHIZAO )
		if star_check==1 then
			num_x=0
		elseif star_check==2 or star_check==3 or star_check==4 then
			num_x=1
		elseif star_check==5 or star_check==6 or star_check==7 then 
			num_x=2
		elseif star_check==8 or star_check==9 or star_check==10 then 
			num_x=3
		elseif star_check==11 then
			num_x=4			
		end
	end
	if ItemID[2]==2301 then
		life_lv=GetSkillLv( role , SK_ZHUZAO )
	end
	if ItemID[2]==2302 then
		life_lv=GetSkillLv( role , SK_PENGREN )
		local differ_check=math.abs(star_check-75)
		if differ_check==0 then
			num_x=5
		elseif differ_check==1 then
			num_x=4
		elseif differ_check==2  then
			num_x=3
		elseif differ_check>=3 and differ_check<=6 and star_check<=77 then
			num_x=2
		elseif differ_check>=7 and differ_check<=25 and star_check<=77 then
			num_x=1		
		else
			num_x=0
		end
	end
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then
		Gj_lv=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
	end

	local i1 = 0
	local i2 = 0
	local i3 = 0
	i1 =TakeItem( role, 0, paper_id1, Part2_paper)-- RemoveChaItem ( role , paper_id1 , Part2_paper , 2 , ItemBag [4] , 2 , 1 , 1)
	i2 =TakeItem( role, 0, paper_id2, Part4_paper)-- RemoveChaItem ( role , paper_id2 , Part4_paper , 2 , ItemBag [5] , 2 , 1 , 1)
	i3 =TakeItem( role, 0, paper_id3, Part6_paper)-- RemoveChaItem ( role , paper_id3 , Part6_paper , 2 , ItemBag [6] , 2 , 1 , 1)
	if i1 == 0 or  i2 == 0 or  i3 == 0 then
		LG( "Hecheng_BS" , "Delete item failed" )
	end
	local a1_num=GetItemAttr(Item[2], ITEMATTR_MAXURE )
	local a1=TakeItem( role, 0, 855, a1_num )			   
	if a1==0  then
		SystemNotice ( role ,"\205\229 \243\228\224\235\238\241\252 \243\228\224\235\232\242\252 \236\238\237\229\242\251 \244\229\232")
		--SystemNotice ( role ,"Не удалось удалить монеты феи")
		return
	end 

	local new_num = GetItemAttr(Item[2], ITEMATTR_VAL_AGI )
	if ItemID[2]==2300 then
		if new_num==1067 or  new_num==1068 or new_num==1069 or new_num==1070 or  new_num==2236 then
			num_x=1
		end
	end
	local paper_energy = GetItemAttr(Item[2], ITEMATTR_MAXENERGY )-100
	local star_good=(math.min(life_lv,paper_lv)*0.03+Gj_lv*0.05+(100-paper_energy*10)*0.01)*100
	local star_radom = math.random ( 1, 100 )
	local m1 = -1
	local m2 = -1	
	if ItemID[2]==2300 then
		if star_check>=2 then
			star_good=100
			star_radom=1
		else
			star_good=1
			star_radom=100
		end
	end
	local star_check_chenggong=0
	if star_check~=0 and star_good >star_radom and num_x~=0 then
		star_check_chenggong=1
		m1, m2 = MakeItem ( role , new_num  , num_x , star_num_qulity )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		if ItemID[2]==2301 and CheckItem_CanJinglian(Itemfinal)==1 then
			local Itemfinal_energy=GetItemAttr ( Itemfinal ,ITEMATTR_ENERGY)
			local itemfinal_maxenergy =GetItemAttrRange(new_num , ITEMATTR_MAXENERGY , 1 )
			local itemfinal_minenergy = GetItemAttrRange(new_num ,ITEMATTR_MAXENERGY , 0 )
		 	--SystemNotice( role , "Itemfinal_energy=="..Itemfinal_energy)
	 		--SystemNotice( role , "itemfinal_maxenergy=="..itemfinal_maxenergy)
	 		--SystemNotice( role , "itemfinal_minenergy=="..itemfinal_minenergy)
			if paper_energy>7 then
				paper_energy=7
			end 
			if itemfinal_maxenergy~=itemfinal_minenergy then
				Itemfinal_energy=math.mod(Itemfinal_energy,1000)+paper_energy*1000
				SetItemAttr ( Itemfinal ,ITEMATTR_MAXENERGY , Itemfinal_energy)
				SetItemAttr ( Itemfinal ,ITEMATTR_ENERGY , Itemfinal_energy)
			end
		end
		local item_final_ID=GetItemID(Itemfinal)
			--SystemNotice( role , "item_final_ID="..item_final_ID)
		if item_final_ID==1067 or item_final_ID==1068 or item_final_ID==1069 or item_final_ID==1070 then
			SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)
			SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)
			SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)
			--local a=GetItemAttr(Itemfinal, ITEMATTR_VAL_STR )
			--local b=GetItemAttr(Itemfinal, ITEMATTR_MAXENERGY)
			--local c=GetItemAttr(Itemfinal, ITEMATTR_ENERGY)
			--SystemNotice( role , "Tool Level="..a)
			--SystemNotice( role , "Max Energy="..b)
			--SystemNotice( role , "Current Energy="..c)
		end
		if item_final_ID==2236 then
			SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,paper_lv)
		end
	else
	 	SystemNotice( role , "\194\224\248 \239\240\238\246\229\241\241 \226\238\231\236\238\230\237\238 \225\251\235 \237\229\239\240\224\226\232\235\252\237\251\233 \232\235\232 \226\224\248 \232\237\241\242\240\243\236\229\237\242 \241\235\232\248\234\238\236 \237\232\231\234\238\227\238 \243\240\238\226\237\255. \209\235\232\248\234\238\236 \242\255\230\229\235\224\255 \240\224\225\238\242\224, \232 \237\229\234\238\242\238\240\251\229 \239\240\229\228\236\229\242\251 \232\241\247\229\231\235\232.")
		--SystemNotice( role , "Ваш процесс возможно был неправильный или ваш инструмент слишком низкого уровня. Слишком тяжелая работа, и некоторые предметы исчезли.")
	end

	local paper_num=GetItemAttr(Item[2], ITEMATTR_VAL_STA )
	paper_num=paper_num-1
	--SystemNotice( role , "Blueprint usage count="..paper_num)
	--if paper_num<=0 then
	--	local s1 = 0
	--	s1= RemoveChaItem ( role , ItemID[2] , 1 , 2 , ItemBag [2] , 2 , 1 , 1)		--ТЖіэ
	 --	SystemNotice( role , "Blueprint's durability has reached its limit and has disappeared")
	--	if s1 == 0 then
	--		LG( "TUZHI_BS" , "Delete item failed" )
	--	end		
	--end
	--if paper_num>=1 then
		SetItemAttr(Item[2], ITEMATTR_VAL_STA , paper_num )
	--end

	local Gj_ure=0
	if ItemID[3]==1067 or ItemID[3]==1068 or ItemID[3]==1069 or ItemID[3]==1070 then
		Gj_ure=GetItemAttr ( Item[3] , ITEMATTR_URE )
		local star_gjlv_num=GetItemAttr ( Item[3] , ITEMATTR_VAL_STR )
		Gj_ure=Gj_ure-50*star_gjlv_num
		if Gj_ure<=0 then
			Gj_ure=0
		end
		--if Gj_ure==0 then
		--	local k1 = 0
		--	k1= RemoveChaItem ( role , ItemID[3] , 1 , 2 , ItemBag [3] , 2 , 1 , 1)
	 	--	SystemNotice( role , "Life of tool has reached its limit.")
		--	if k1 == 0 then
		--		LG( "FENJIE_BS" , "Delete item failed" )
		--	end
		--end
		local star_lv_num = GetItemAttr( Item[3] ,ITEMATTR_ENERGY )
		if star_check_chenggong==1 then
			star_lv_num=star_lv_num+paper_lv
		else
			star_lv_num=star_lv_num+1			
		end
		if star_lv_num>=10000 then
			star_lv_num=10000
		end
	 	SystemNotice( role , "\194\224\248 \232\237\241\242\240\243\236\229\237\242 \226 \237\224\241\242\238\255\249\229\229 \226\240\229\236\255 \232\236\229\229\242 "..star_lv_num.." \238\247\234\238(\226) \238\239\251\242\224")
		--SystemNotice( role , "Ваш инструмент в настоящее время имеет "..star_lv_num.." очко(в) опыта")
		if star_lv_num>=star_gjlv_num*star_gjlv_num*100 then
			star_gjlv_num=star_gjlv_num+1
			SetItemAttr ( Item[3] , ITEMATTR_VAL_STR ,star_gjlv_num)
	 		SystemNotice( role , "\207\238\231\228\240\224\226\235\255\229\236, \226\224\248 \232\237\241\242\240\243\236\229\237\242 \243\226\229\235\232\247\232\235 \241\226\238\233 \243\240\238\226\229\237\252!")
			--SystemNotice( role , "Поздравляем, ваш инструмент увеличил свой уровень!")
			star_lv_num=0
		end
		SetItemAttr (  Item[3] , ITEMATTR_ENERGY , star_lv_num )
		SetItemAttr ( Item[3] , ITEMATTR_URE ,Gj_ure)
	end
	--------------LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_SHENGHUO_lg" ,cha_name, star_check , ItemID[2] , paper_lv , paper_id1 , Part2_paper ,  paper_id2 , Part4_paper ,  paper_id3 , Part6_paper , ItemID[3] , Gj_lv ,  life_lv )
	SynChaKitbag(role,13)
	--check_item_final_data(Item[2])
	--check_item_final_data(Item[3])
	return m2
end
function can_fenjie_item (...)
	--Notice("Starts to determine")
	local ItemBagCount = arg[2]
	--Notice("Parameter unit"..ItemBagCount)
	local Length = ItemBagCount+3
	if arg.n ~= Length then
		Notice("\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n)
		--Notice("Параметр задан не верно"..arg.n)
		return 0
	end	
	local Check = 0
--	SystemNotice( arg[1] , "Transfer Analyze detect main function")
	Check = can_fenjie_item_main ( arg )
	if Check == 1 then		
		return 1
	else
		return 0
	end
	--Notice("Start analyzing--End")

end

function can_fenjie_item_main ( Table )
	--Notice ( "Entering Analyze main function")
	local role = 0
	local ItemBag = {}
	local ItemBagCount = 0
	
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	--Notice( "Entering Analyzation main fuction ItemBag [1]=="..ItemBag [1])
	--Notice( "Entering Analyzation main function ItemBag [2]=="..ItemBag [2])
	--Notice( "Entering Analyzation main function ItemBag [3]=="..ItemBag [3])
	--Notice( "Entering Analyzation main function ItemBag [4]=="..ItemBag [4])
	role , ItemBag , ItemBagCount = Read_manufacture ( Table )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Вам потребуется 1 свободный слот в инвентаре")
		UseItemFailed ( role )
		return
	end
	local i = 0
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	for i = 1 , ItemBagCount , 1 do
		--if ItemBag[i] == 0  then
		--	SystemNotice( role , "Illegal item unit")
		--	return 0
		--end
		--ИЎіцµАѕЯ(1-ѕ«Бй,2-№¤ѕЯ,3-Ф­БП,4-·ЦЅв·ЅПт)
		Item[i] = GetChaItem ( role , 2 , ItemBag [i] )
		ItemID[i] = GetItemID ( Item[i] )
		ItemType[i] = GetItemType ( Item[i] )
		--Notice( " Analyze_ItemID["..i.."]=="..ItemID[i])
		--Notice( " Analyze_ItemType["..i.."]=="..ItemType[i])
	end

	if ItemType[1] ~= 59 then
		SystemNotice( role ,"\194\241\229\236\238\227\243\249\232\233: \204\238\184 \228\232\242\255, \239\238\230\224\235\243\233\241\242\224 \245\238\242\255\225\251 \226\227\235\255\237\232.")
		--SystemNotice( role ,"Всемогущий: Моё дитя, пожалуйста хотябы вгляни.")
		return 0
	end
	local URE_JLone = GetItemAttr( Item[1] ,ITEMATTR_URE )
	if URE_JLone<=0 then
		SystemNotice( role ,"\194\241\229\236\238\227\243\249\232\233: \221\242\238 \241\235\232\248\234\238\236 \230\229\241\242\238\234\238! \207\238\230\224\235\243\233\241\242\224, \237\224\234\238\240\236\232\242\229 \226\224\248\229\227\238 \239\232\242\238\236\246\224!")
		--SystemNotice( role ,"Всемогущий: Это слишком жестоко! Пожалуйста, накормите вашего питомца!")
		return 0	
	end
	local type_check=0
	type_check=CheckItem_CanJinglian ( Item[3] )
	if type_check==0 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\236\229\241\242\232\242\229 \238\240\243\230\232\229 \232\235\232 \228\238\241\239\229\245\232 \226 \241\239\229\246\232\224\235\252\237\251\233 \241\235\238\242 \228\235\255 \224\237\224\235\232\231\224")
		--SystemNotice( role ,"Пожалуйста, поместите оружие или доспехи в специальный слот для анализа")
		return 0		
	end

	local Num_JL = GetItemForgeParam ( Item[1] , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	local JL_jineng=0
	local JL_jineng_lv=0
	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )
	if Part2_JL==15 then
		JL_jineng=Part2_JL
		JL_jineng_lv=Part3_JL
	elseif Part4_JL==15 then
		JL_jineng=Part4_JL
		JL_jineng_lv=Part5_JL
	elseif Part6_JL==15 then
		JL_jineng=Part6_JL
		JL_jineng_lv=Part7_JL
	end
			--SystemNotice( role ,"AnalyzingЎ­aaaaaaaaa")

	if  ItemID[2]~=1070 then
			SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \232\241\239\238\235\252\231\243\233\242\229 \202\240\232\241\242\224\235\252\237\243\254 \247\224\241\242\232\246\243")
			--SystemNotice( role ,"Пожалуйста, используйте Кристальную частицу")
			return 0	
	else
		local Gj_ure=GetItemAttr ( Item[2] , ITEMATTR_URE )
		if Gj_ure<=0 then
			Gj_ure=0
			SystemNotice( role ,"\200\237\241\242\240\243\236\229\237\242 \232\241\247\229\240\239\224\235 \226\241\254 \239\240\238\247\237\238\241\242\252. \194\238\231\252\236\232\242\229 \237\238\226\251\233 \232\235\232 \239\238\247\232\237\232\242\229 \253\242\238\242 \226 \194\229\241\237\238\227\240\224\228\229.")
			--SystemNotice( role ,"Инструмент исчерпал всю прочность. Возьмите новый или почините этот в Веснограде.")
			return 0
		end
		local Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		JL_jineng_lv=3*JL_jineng_lv+1
		if JL_jineng_lv<Gj_lv then
			SystemNotice( role ,"\202\226\224\235\232\244\232\234\224\246\232\255 \212\229\232 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242 \243\240\238\226\237\254 \232\237\241\242\240\243\236\229\237\242\224")
			--SystemNotice( role ,"Квалификация Феи не соответствует уровню инструмента")
			return 0			
		end
	end

	if ItemID[4] ~=2625 and ItemID[4] ~=2630 and ItemID[4] ~=2634 and ItemID[4] ~=2635 and ItemID[4] ~=2636 and ItemID[4] ~=2637 and ItemID[4] ~=2638  then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224 \239\238\236\229\241\242\232\242\229 \226 \241\239\229\246\232\224\235\252\237\251\233 \241\235\238\242 \234\224\242\224\235\232\231\224\242\238\240 \228\235\255 \192\237\224\235\232\231\224")
		--SystemNotice( role ,"Пожалуйста поместите в специальный слот катализатор для Анализа")
		return 0			
	end

	--Notice ( "Entering Analyzation main function - - End")

	return 1
end

function end_fenjie_item (...)
	--Notice(  "end_fenjie_item")
	local role = 0
	local ItemBag = {}
	--local ItemCount = {}
	local ItemBagCount = 0

	role , ItemBag , ItemBagCount = Read_manufacture ( arg )

	local i = 0
	local j = 0
	--local q =0
	--for i = 1 , ItemBagCount , 1 do
	--	if ItemBag[i] == 0  then
	--		Notice( "Illegal item unit")
	--		return 0
	--	end
	--end
	--Notice( "arg.n=="..arg.n)
	--Notice( "arg[arg.n]=="..arg[arg.n])

	local star_check=0 
	--Notice( "star_check=="..star_check)
	star_check=arg[arg.n] 
	--Notice( "Analyze_star_check=="..star_check)
	--SystemNotice(role ,"Analyze_star_check=="..star_check)
	
	local Item = {}
	local ItemID = {}
	local ItemType = {}
	--local check = {}
	for j = 1 , ItemBagCount , 1 do
		Item[j] = GetChaItem ( role , 2 , ItemBag [j] )
		ItemID[j] = GetItemID ( Item[j] )
		ItemType[j] = GetItemType ( Item[j] )
	end
	local Item_Lv =  GetItemLv ( Item[3] )
	--Notice( "Pet Level aaaaaaaaaaaaa")

	local Num_JL = GetItemForgeParam ( Item[1] , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	local JL_jineng=0
	local JL_jineng_lv=0
	if Part2_JL==16 then
		JL_jineng=Part2_JL
		JL_jineng_lv=Part3_JL
	elseif Part4_JL==16 then
		JL_jineng=Part4_JL
		JL_jineng_lv=Part5_JL
	elseif Part6_JL==16 then
		JL_jineng=Part6_JL
		JL_jineng_lv=Part7_JL
	end
	--Notice( "Fairy Lv bbbbbbbbbbbbbb")

	local Gj_lv=0
	if  ItemID[2]==1070 then
		Gj_lv=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
	end

	local life_lv = 0
	life_lv=GetSkillLv( role , SK_FENJIE )
	local num_new =math.min(math.max(1,math.floor( (JL_jineng_lv*0.1+life_lv*0.05+Gj_lv*0.05 )*10)),10)
	--local star_good=(life_lv*0.3+Gj_lv*0.5+0.1)*100
	--local star_radom = math.random ( 1, 100 )
	--Notice( "Fairy level cccccccccccccccc")

	local i1 = 0
	local i2 = 0
	i1= RemoveChaItem ( role , ItemID[3] , 1 , 2 , ItemBag [3] , 2 , 1 , 1)
	i2= RemoveChaItem ( role , ItemID[4] , 1 , 2 , ItemBag [4] , 2 , 1 , 1)
	if i1 == 0 or  i2 == 0 then
		LG( "Hecheng_BS" , "Delete item failed" )
	end
	local new_num=1346
	if ItemID[4] ==2625 then
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 131, 143 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 116, 130 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 94, 115 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 72, 93 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 49, 71 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 27, 48 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 13, 26 )
		else
			rad1=math.random ( 1, 12 )
		end
		new_num=STONE1_ID[rad1]
	elseif ItemID[4] ==2630	 then
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 150, 151 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 145, 149 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 119, 144 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 101, 118 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 76, 100 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 41, 75 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 25, 40 )
		else
			rad1=math.random ( 1, 24 )
		end
		new_num=FOOD_ID[rad1]
	elseif ItemID[4] ==2634	 then
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 336, 346 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 249, 335 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 191, 248 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 127, 190 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 89, 126 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 57, 88 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 19, 56 )
		else
			rad1=math.random ( 1, 18 )
		end
		new_num=SPECIL_ID[rad1]
	elseif ItemID[4] ==2635	 then
		local rad1=0
		if Item_Lv>=80 then
			rad1=math.random ( 171, 176 )
		elseif Item_Lv>=70 then
			rad1=math.random ( 155, 170 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 133, 154 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 109, 132 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 88, 108 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 56, 87 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 38, 55 )
		else
			rad1=math.random ( 1, 37 )
		end
		new_num=BONE_ID[rad1]
	elseif ItemID[4] ==2636	 then
		local rad1=0
		if Item_Lv>=70 then
			rad1=math.random ( 65, 72 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 57, 69 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 57, 63 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 57, 61 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 37, 56 )
		else
			rad1=math.random ( 1, 36 )
		end
		new_num=TREE_ID[rad1]
	elseif ItemID[4] ==2637 then
		local rad1=0
		if Item_Lv>=70 then
			rad1=math.random ( 82, 97 )
		elseif Item_Lv>=60 then
			rad1=math.random ( 77, 93 )
		elseif Item_Lv>=50 then
			rad1=math.random ( 63, 81 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 48, 62 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 30, 47 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 20, 29 )
		else
			rad1=math.random ( 1, 19 )
		end
		new_num=SKIP_ID[rad1]
	elseif ItemID[4] ==2638 then
		local rad1=0
		if Item_Lv>=50 then
			rad1=math.random ( 33, 37 )
		elseif Item_Lv>=40 then
			rad1=math.random ( 28, 32 )
		elseif Item_Lv>=30 then
			rad1=math.random ( 19, 27 )
		elseif Item_Lv>=20 then
			rad1=math.random ( 12, 18 )
		else
			rad1=math.random ( 1, 11 )
		end
		new_num=WATER_ID[rad1]
	end
	--Notice( "new_num======"..new_num)
	--Notice( "num_new======"..num_new)

	--if star_check~=0  and num_new~=0 then
	GiveItem ( role , 0 , new_num  , num_new , 4  ) 
	--else
	-- 	SystemNotice( role , "As some of your process has gone wrong, some of the items have disappeared as a result")
	--end

	if ItemID[2]==1070 then
		local Gj_ure=GetItemAttr ( Item[2] , ITEMATTR_URE )
		local star_gjlv_num=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		Gj_ure=Gj_ure-50*star_gjlv_num
		if Gj_ure<=0 then
			Gj_ure=0
		end
		--if Gj_ure==0 then
		--	local k1 = 0
		--	k1= RemoveChaItem ( role , ItemID[2] , 1 , 2 , ItemBag [2] , 2 , 1 , 1)
	 	--	SystemNotice( role , "Life of tool has reached its limit.")
		--	if k1 == 0 then
		--		LG( "FENJIE_BS" , "Delete item failed" )
		--	end
		--end
		local star_lv_num = GetItemAttr( Item[2] ,ITEMATTR_ENERGY )
		star_lv_num=star_lv_num+1
		if star_lv_num>=10000 then
			star_lv_num=10000
		end
	 	SystemNotice( role , "\194\224\248 \232\237\241\242\240\243\236\229\237\242 \226 \237\224\241\242\238\255\249\229\229 \226\240\229\236\255 \232\236\229\229\242 "..star_lv_num.." \238\247\234\238(\226) \238\239\251\242\224")
		--SystemNotice( role , "Ваш инструмент в настоящее время имеет "..star_lv_num.." очко(в) опыта")
		local star_gjlv_num=GetItemAttr ( Item[2] , ITEMATTR_VAL_STR )
		if star_lv_num>=star_gjlv_num*star_gjlv_num*100 then
			star_gjlv_num=star_gjlv_num+1
			SetItemAttr ( Item[2] , ITEMATTR_VAL_STR ,star_gjlv_num)
	 		SystemNotice( role , "\207\238\231\228\240\224\226\235\255\229\236, \226\224\248 \232\237\241\242\240\243\236\229\237\242 \243\226\229\235\232\247\232\235 \241\226\238\233 \243\240\238\226\229\237\252!")
			--SystemNotice( role , "Поздравляем, ваш инструмент увеличил свой уровень!")
			star_lv_num=0
		end
		SetItemAttr (  Item[2] , ITEMATTR_ENERGY , star_lv_num )
		SetItemAttr ( Item[2] , ITEMATTR_URE ,Gj_ure)
	end
	--------------LG
	local cha_name = GetChaDefaultName ( role )
	LG( "star_FENJIE_lg" ,cha_name, star_check, ItemID[2] , ItemID[3] , ItemID[4] , Gj_lv ,  life_lv )
	--check_item_final_data(Item[3])
	SynChaKitbag(role,13)
	--Notice(  "end_fenjie_item-------End")
	return 1
end

function can_shtool_item(...)
--	Notice ( "Determine if damaged cauldron can be fixed")
	if arg.n ~= 10 and arg.n ~= 14 then
		SystemNotice ( arg[1] , "\207\224\240\224\236\229\242\240 \231\224\228\224\237 \237\229 \226\229\240\237\238"..arg.n )
		--SystemNotice ( arg[1] , "Параметр задан не верно"..arg.n )
		return 0
	end
	local Check = 0
	Check = can_shtool_item_main ( arg )
	if Check == 1 then
		return 1
	else
		return 0
	end
end

function can_shtool_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [0] ~= 1 or ItemCount [1] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [1] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\238\226")
		--SystemNotice ( role ,"Незаконное количество предметов")
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Вам потребуется 1 свободный слот в инвентаре")
		UseItemFailed ( role )
		return
	end

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )
	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local Item_mainitem_Lv =  GetItemAttr ( Item_mainitem, ITEMATTR_VAL_STR )

	local Item_otheritem_Lv =  GetItemAttr ( Item_otheritem , ITEMATTR_VAL_STR)

	local item_shtool_ure = GetItemAttr(Item_mainitem,ITEMATTR_URE)
	local item_shtool_maxure = GetItemAttr(Item_mainitem,ITEMATTR_MAXURE)

	if ItemType_mainitem~=70 then
		SystemNotice( role ,"\207\238\226\240\229\230\228\229\237\237\251\229 \202\240\232\241\242\224\235\252\237\251\233 \234\238\242\229\235, \202\240\232\241\242\224\235\235 \247\229\240\237\238\233 \228\251\240\251, \202\240\232\241\242\224\235\235 \224\237\242\232\226\229\249\229\241\242\226\224 \232 \202\240\232\241\242\224\235\252\237\224\255 \247\224\241\242\232\246\224 \236\238\227\243\242 \225\251\242\252 \238\242\240\229\236\238\237\242\232\240\238\226\224\237\251 \231\228\229\241\252.")
		--SystemNotice( role ,"Поврежденные Кристальный котел, Кристалл черной дыры, Кристалл антивещества и Кристальная частица могут быть отремонтированы здесь.")
		return 0	
	end
	if ItemID_mainitem~=1067 and ItemID_mainitem~=1068 and ItemID_mainitem~=1069 and ItemID_mainitem~=1070 then
		SystemNotice( role ,"\207\238\226\240\229\230\228\229\237\237\251\229 \202\240\232\241\242\224\235\252\237\251\233 \234\238\242\229\235, \202\240\232\241\242\224\235\235 \247\229\240\237\238\233 \228\251\240\251, \202\240\232\241\242\224\235\235 \224\237\242\232\226\229\249\229\241\242\226\224 \232 \202\240\232\241\242\224\235\252\237\224\255 \247\224\241\242\232\246\224 \236\238\227\243\242 \225\251\242\252 \238\242\240\229\236\238\237\242\232\240\238\226\224\237\251 \231\228\229\241\252.")
		--SystemNotice( role ,"Поврежденные Кристальный котел, Кристалл черной дыры, Кристалл антивещества и Кристальная частица могут быть отремонтированы здесь.")
		return 0	
	end

	if ItemType_otheritem ~= 70 or ItemID_otheritem~=2236 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \232\241\239\238\235\252\231\243\233\242\229 \208\229\236\238\237\242\237\251\233 \232\237\241\242\240\243\236\229\237\242.")
		--SystemNotice( role ,"Пожалуйста, используйте Ремонтный инструмент.")
		return 0	
	end

	if item_shtool_ure>=item_shtool_maxure then
		SystemNotice( role ,"\200\237\241\242\240\243\236\229\237\242 \237\229 \225\251\235 \239\238\226\240\229\230\228\229\237 \232 \237\229 \239\238\228\235\229\230\232\242 \240\229\236\238\237\242\243.")
		--SystemNotice( role ,"Инструмент не был поврежден и не подлежит ремонту.")
		return 0	
	end

	if Item_mainitem_Lv>Item_otheritem_Lv then
		SystemNotice( role ,"\211\240\238\226\229\237\252 \240\229\236\238\237\242\237\238\227\238 \232\237\241\242\240\243\236\229\237\242\224 \237\229 \236\238\230\229\242 \225\251\242\252 \237\232\230\229, \247\229\236 \243\240\238\226\229\237\252 \240\229\236\238\237\242\232\240\243\229\236\238\227\238 \232\237\241\242\240\243\236\229\237\242\224")
		--SystemNotice( role ,"Уровень ремонтного инструмента не может быть ниже, чем уровень ремонтируемого инструмента")
		return 0	
	end

	local Money_Need = get_item_shtool_money ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \208\229\236\238\237\242 \232\237\241\242\240\243\236\229\237\242\224 \237\229\226\238\231\236\238\230\229\237!")
		--SystemNotice( role ,"Недостаточно золота. Ремонт инструмента невозможен!")
		return 0
	end
	--SystemNotice(role ,"determination completed ")
	return 1
end

function begin_shtool_item(...)
	--Notice("Repairing damaged pan")

	local Check_Canshtool = 0
	Check_Canshtool = can_shtool_item_main ( arg )
	if Check_Canshtool == 0 then
		return 0
	end

	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )

	local Money_Need = get_item_shtool_money ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	--Money_Have = Money_Have - Money_Need
	--SetCharaAttr ( Money_Have , role , ATTR_GD )
	--ALLExAttrSet( role )
	TakeMoney(role,nil,Money_Need)

	Check_shtool_Item = shtool_item ( arg )
	if Check_shtool_Item == 0  then
		SystemNotice ( role ,"\206\248\232\225\234\224 \239\240\232 \240\229\236\238\237\242\229 \232\237\241\242\240\243\236\229\237\242\224 \236\232\240\237\251\245 \237\224\226\251\234\238\226. \207\238\230\224\235\243\233\241\242\224, \239\229\240\229\239\240\238\226\229\240\252\242\229 \226\241\184 \232 \239\238\226\242\238\240\232\242\229 \239\240\238\246\229\241\241")
		--SystemNotice ( role ,"Ошибка при ремонте инструмента мирных навыков. Пожалуйста, перепроверьте всё и повторите процесс")
	end
	-------check_item_final_data ( Item_Waiguan )
	--------Notice("Repair of broken pan completed")
	return 1
end

function get_item_shtool_money(...)
	--Notice("Fee calculation")
	local Money = shtool_money_main ( arg )
	return Money
end

function shtool_money_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	--local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )

       -- local Item_mainitem_Lv = GetItemAttr ( Item_mainitem, ITEMATTR_VAL_STR )
	local Money_Need=200--*Item_mainitem_Lv*Item_mainitem_Lv
	--Notice("Calculation completed")
	return Money_Need
end

function shtool_item ( Table )
	--	Notice("Ronghe_Item")
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local Item_mainitem = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_otheritem = GetChaItem ( role , 2 , ItemBag [1] )
	
	local  ItemType_mainitem = GetItemType ( Item_mainitem )
	local  ItemType_otheritem = GetItemType ( Item_otheritem )

	local ItemID_mainitem = GetItemID ( Item_mainitem )
	local ItemID_otheritem = GetItemID ( Item_otheritem )

	local item_shtool_ure = GetItemAttr(Item_mainitem,ITEMATTR_URE)
	local item_shtool_maxure = GetItemAttr(Item_mainitem,ITEMATTR_MAXURE)

	SetItemAttr ( Item_mainitem ,ITEMATTR_URE, item_shtool_maxure )

	local cha_name = GetChaDefaultName ( role )
	LG( "star_xiuguo_lg" ,cha_name, ItemID_mainitem , ItemID_otheritem )

	local R1 = 0
	R1 = RemoveChaItem ( role , Item_otheritem , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	if R1 == 0 then
		SystemNotice( role , "\207\229\240\229\236\229\249\229\237\232\229 \239\240\229\228\236\229\242\224 \237\229 \243\228\224\235\238\241\252")
		--SystemNotice( role , "Перемещение предмета не удалось")
		return
	end
	SynChaKitbag(role,13)
end

 function GetChaName_4 ( role,npc )
	local el1= CheckBagItem( role,2242 )			
	local el2 = CheckBagItem( role,2243 )
	local el3 = CheckBagItem( role,2244 )
	local el4 = CheckBagItem( role,2245 )  
		if el1 ~=0  then 
			TakeItem( role, 0,2242, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 ) 
		elseif el2 ~= 0  then
			TakeItem( role, 0,2243, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 ) 
		elseif el3 ~= 0  then
			TakeItem( role, 0,2244, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 )  
		elseif el4 ~= 0  then
			TakeItem( role, 0,2245, 1 )
			GiveItem ( role , 0 , 3077  , 10 , 4 )  
		else
			SystemNotice( role ,"\211 \226\224\241 \237\229\242 \239\238\228\245\238\228\255\249\229\233 \240\224\241\239\232\241\234\232.")
			--SystemNotice( role ,"У вас нет подходящей расписки.")
		end
end

function GetChaName_5 ( role,npc )
	local cha_name = GetChaDefaultName ( role )

	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	
	local am1 = CheckBagItem( role, 2240 )			
	if am1 < 1 then
		SystemNotice( role ,"\211 \226\224\241 \237\229\242 \207\232\240\224\242\241\234\238\233 \208\224\241\239\232\241\234\232 №6.")
		--SystemNotice( role ,"У вас нет Пиратской Расписки №6.")
		return
	else
	local am2 =TakeItem( role, 0,2240, 1 )			                   
		if am2==0  then
			SystemNotice ( role ,"\206\248\232\225\234\224 \238\225\236\229\237\224 \207\232\240\224\242\241\234\238\233 \208\224\241\239\232\241\234\232 №6.")
			--SystemNotice ( role ,"Ошибка обмена Пиратской Расписки №6.")
			return
		end
	end
	GiveItem( role , 0 , 1028  , 1 , 4 )
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name..", \238\237 \239\238\235\243\247\224\229\242 1 \200\231\236\229\237\247\232\226\243\254 \240\243\237\243.")
	--Notice("Поздравляем игрока "..cha_name..", он получает 1 Изменчивую руну.")	
end

 function GetChaName_6 ( role,npc )
	
				
		local job = GetChaAttr( role, ATTR_JOB)
		
		if job ~= 12 and job ~= 9 and job ~= 16 and job ~= 8 and job ~= 13 and job ~=14 then
			SystemNotice(role,"\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \239\229\240\241\238\237\224\230\229\236 \226\242\238\240\238\233 \239\240\238\244\229\241\232\232.")
			--SystemNotice(role,"Может быть использовано только персонажем второй професии.")
			return
		end
	local el_count0 = CheckBagItem ( role , 3850)
	local el_count1 = CheckBagItem ( role , 3853)
	local el_count2 = CheckBagItem ( role , 3854)
	local el_count3 = CheckBagItem ( role , 3856)
	local el_count4 = CheckBagItem ( role , 3857)
	local el_count5 = CheckBagItem ( role , 3858)
	local el_count6 = CheckBagItem ( role , 3863)
	local el_count7 = CheckBagItem ( role , 3866)
	local el_count8 = CheckBagItem ( role , 3868)
	local el_count9 = CheckBagItem ( role , 3870)
	local el_count10 = CheckBagItem ( role ,3872 )


		if el_count0 >= 1 and el_count1 >= 1 and el_count2 >= 1 and el_count3 >= 2 and el_count4 >= 3 and el_count5 >= 2 and el_count6 >= 2 and el_count7 >= 1 and el_count8 >= 1 and el_count9 >= 1 and el_count10 >= 1 then 
		
		local x_del_0 = DelBagItem ( role , 3850 , 1 ) 
		local x_del_1 = DelBagItem ( role , 3853 , 1 ) 
		local x_del_2 = DelBagItem ( role , 3854 , 1 ) 
		local x_del_3 = DelBagItem ( role , 3856 , 2 ) 
		local x_del_4 = DelBagItem ( role , 3857 , 3 ) 
		local x_del_5 = DelBagItem ( role , 3858 , 2 ) 
		local x_del_6 = DelBagItem ( role , 3863 , 2 ) 
		local x_del_7 = DelBagItem ( role , 3866 , 1 ) 
		local x_del_8 = DelBagItem ( role , 3868 , 1 ) 
		local x_del_9 = DelBagItem ( role , 3870 , 1 ) 
		local x_del_10 = DelBagItem ( role ,3872 , 1 ) 

		else
			SystemNotice( role ,"\211 \226\224\241 \237\229\242 \239\238\228\245\238\228\255\249\229\227\238 \224\235\244\224\226\232\242\224 \234\224\240\242.")
			--SystemNotice( role ,"У вас нет подходящего алфавита карт.")
			return
		end

				if job == 12 then
						GiveItem( role , 0 , 2536  , 1 , 4 )
					elseif job == 9	then
						GiveItem( role , 0 , 2533  , 1 , 4 )
					elseif job == 16 then
						GiveItem( role , 0 , 2539  , 1 , 4 )
					elseif job == 8	then
						GiveItem( role , 0 , 2530  , 1 , 4 )
					elseif job == 13 then
						GiveItem( role , 0 ,2542  , 1 , 4 )
					elseif job == 14 then
						GiveItem( role , 0 , 2545  , 1 , 4 )

				end	
end

function GetChaName_7 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2846 )	
	local am2 = CheckBagItem( role, 2847 )	
	local am3 = CheckBagItem( role, 2848 )	
	local am4 = CheckBagItem( role, 2849 )	
	local am5 = CheckBagItem( role, 2850 )	
	local am6 = CheckBagItem( role, 2851 )	
	local am7 = CheckBagItem( role, 2852 )	
	local am8 = CheckBagItem( role, 2853 )	
	       
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1 or am6 < 1 or am7 < 1 or am8 < 1   then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2846, 1 )
	local an2 =TakeItem( role, 0,2847, 1 )
	local an3 =TakeItem( role, 0,2848, 1 )
	local an4 =TakeItem( role, 0,2849, 1 )
	local an5 =TakeItem( role, 0,2850, 1 )
	local an6 =TakeItem( role, 0,2851, 1 )
	local an7 =TakeItem( role, 0,2852, 1 )
	local an8 =TakeItem( role, 0,2853, 1 )
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 or an6==0 or an7==0 or an8==0  then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2934  , 1 , 4 ) 
	LG( "SSYRDH" ,cha_name,"Melancholy of Phantom Baron"..am1.." ","Melancholy of Demon Flame"..am2.." ","Melancholy of Evil Beast"..am3.." ","Melancholy of Tyran"..am4.." ","Melancholy of Phoenix"..am5.." ","Melancholy of Despair"..am6.." ","Melancholy of Drakan"..am7.." ","Melancholy of Tidal"..am8.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \209\232\235\243\253\242\224 \241\236\229\240\242\232.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Силуэта смерти.")
	end
end

function GetChaName_8 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2927 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2927, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2935  , 1 , 4 ) 
	LG( "HDSZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Hardin"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \213\224\240\228\232\237\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Хардина.")
	end
end

function GetChaName_9 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2928 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2928, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2936  , 1 , 4 )
	LG( "HAZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Darkness"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \210\252\236\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Тьмы.")
	end
end

function GetChaName_10 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2929 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2929, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2937  , 1 , 4 ) 
	LG( "DYZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Abaddon"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \192\225\224\228\228\238\237\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Абаддона.")
	end
end

function GetChaName_11  ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2931 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2931, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2939  , 1 , 4 )
	LG( "YMZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Abyss"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \193\229\231\228\237\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Бездны.")
	end
end

function GetChaName_12 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2932 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2932, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2940  , 1 , 4 ) 
	LG( "MHZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Styx"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \209\242\232\234\241\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Стикса.")
	end
end

function GetChaName_13 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2854 )	
	local am2 = CheckBagItem( role, 2855 )	
	local am3 = CheckBagItem( role, 2856 )	
	local am4 = CheckBagItem( role, 2857 )	
	local am5 = CheckBagItem( role, 2930 )	
	
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1  then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2854, 1 )
	local an2 =TakeItem( role, 0,2855, 1 )
	local an3 =TakeItem( role, 0,2856, 1 )
	local an4 =TakeItem( role, 0,2857, 1 )
	local an5 =TakeItem( role, 0,2930, 1 )
	
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2938  , 1 , 4 )
	LG( "XLZZDH" ,cha_name,"Hair of Death"..am1.." ","Tooth of Death"..am2.." ","Eye of Death"..am3.." ","Heart of Death"..am4.." ","Sealed Soul of Asura"..am5.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \207\240\238\234\235\255\242\232\255 \192\241\243\240\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Проклятия Асуры.")
	end
end

function GetChaName_14 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2935 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2935, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2562  , 1 , 4 ) 
	LG( "HDSHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Hardin"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \213\224\240\228\232\237\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Хардина.")
	end
end

function GetChaName_15 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2936 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2936, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2563  , 1 , 4 ) 
	LG( "HAHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Darkness"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \210\252\236\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Тьмы.")
	end
end

function GetChaName_16 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2937 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2937, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2564  , 1 , 4 )
	LG( "DYHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Abaddon"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \192\225\224\228\228\238\237\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Абаддона.")
	end
end

function GetChaName_17 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2939 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2939, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2566  , 1 , 4 )
	LG( "YMHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Abyss"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \193\229\231\228\237\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Бездны.")
	end
end

function GetChaName_18 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2940 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2940, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2567  , 1 , 4 )
	LG( "MHHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Styx"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \209\242\232\234\241\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Стикса.")
	end
end

function GetChaName_19 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2934 )	
	local am2 = CheckBagItem( role, 2938 )	
	
	if am1 < 1 or am2 < 1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2934, 1 )
	local an2 =TakeItem( role, 0,2938, 1 )
	
	if an1==0 or an2==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2565  , 1 , 4 )
	LG( "XLHPDH" ,cha_name,"Silhouette of Death"..am1.." ","Curse of Asura"..am2.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \192\241\243\240\251.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Асуры.")
	end
end

function GetChaName_20 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	--local Item_ID = GetItemID (role)
	local am1 = CheckBagItem( role, 2562 )	
	local am2 = CheckBagItem( role, 2563 )	
	local am3 = CheckBagItem( role, 2564 )	
	local am4 = CheckBagItem( role, 2565 )	
	local am5 = CheckBagItem( role, 2566 )	
	local am6 = CheckBagItem( role, 2567 )	
	local am7 = CheckBagItem( role, 2933 )	
	local am8 = CheckBagItem( role, 2934 )	
	       
	if am1 < 1 or am2 < 1 or am3 < 1 or am4 < 1 or am5 < 1 or am6 < 1 or am7 < 1 or am8 < 1   then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	end
	local an1 =TakeItem( role, 0,2562, 1 )
	local an2 =TakeItem( role, 0,2563, 1 )
	local an3 =TakeItem( role, 0,2564, 1 )
	local an4 =TakeItem( role, 0,2565, 1 )
	local an5 =TakeItem( role, 0,2566, 1 )
	local an6 =TakeItem( role, 0,2567, 1 )
	local an7 =TakeItem( role, 0,2933, 1 )
	local an8 =TakeItem( role, 0,2934, 1 )
	if an1==0 or an2==0 or an3==0 or an4==0  or an5==0 or an6==0 or an7==0 or an8==0  then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
	else
	GiveItem ( role , 0 , 2404  , 1 , 4 ) 
	LG( "HLHPDH" ,cha_name,"Soul of Darkness"..am1.." ","Soul of Asura"..am2.." ","Soul of Hardin"..am3.." ","Soul of Abaddon"..am4.." ","Soul of Abyss"..am5.." ","Soul of Styx"..am6.." ","Silhouette of Death"..am7.." ","Titter of Black Dragon"..am8.." ")
	Notice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \241 \243\241\239\229\248\237\251\236 \239\238\235\243\247\229\237\232\229\236 1 \196\243\248\232 \215\184\240\237\238\227\238 \196\240\224\234\238\237\224.")
	--Notice("Поздравляем игрока "..cha_name.." с успешным получением 1 Души Чёрного Дракона.")
	end
end

function GetChaName_21 ( role,npc )

	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum > 31421 then
		SystemNotice ( role , "\203\232\236\232\242 \226\240\229\236\229\237\232 \231\224\234\238\237\247\232\235\241\255. \194\224\236 \239\240\232\228\229\242\241\255 \239\238\228\238\230\228\224\242\252 \228\238 \241\235\229\228\243\254\249\229\227\238 \227\238\228\224" )
		--SystemNotice ( role , "Лимит времени закончился. Вам придется подождать до следующего года" )
		UseItemFailed ( role )
		return
	end
	
	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	
	local am1 = CheckBagItem( role, 1649 )	
	       am2 = CheckBagItem( role, 3130 )
	       am3 = CheckBagItem( role, 1641 )
	       am4 = CheckBagItem( role, 4418 )
	if am1 < 1 or am2<1 or am3<1 or am4<1 then
		SystemNotice( role ,"\194\251, \234\224\230\229\242\241\255, \237\229 \238\225\235\224\228\224\229\242\229 \237\243\230\237\251\236 \239\240\229\228\236\229\242\238\236 \228\235\255 \226\251\234\243\239\224")
		--SystemNotice( role ,"Вы, кажется, не обладаете нужным предметом для выкупа")
		return
	else
	local am5 =TakeItem( role, 0,1649, 1)
	       am6 =TakeItem( role, 0,3130, 1)
	       am7 =TakeItem( role, 0,1641, 1)
	       am8 =TakeItem( role, 0,4418, 1)
		if am5==0 or am6==0 or am7==0 or am8==0 then
		SystemNotice ( role ,"\194\251\234\243\239 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Выкуп не удался.")
			return
		end
	end
	GiveItem( role , 0 , 1074  , 1 , 4 )
	LG( "ZAZZ" , "Player"..cha_name.."Redeem 1 Seed of Love" )
end

function GetChaName_22 ( role,npc )
		
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum

	if CheckDateNum < 31420  then
		SystemNotice ( role , "\205\229 \226\238\235\237\243\233\242\229\241\252, \235\254\225\226\232 \237\243\230\237\238 \237\229\234\238\242\238\240\238\229 \226\240\229\236\255. \207\238\230\224\235\243\233\241\242\224, \228\238\230\228\232\242\229\241\252 14 \236\224\240\242\224, \239\240\238\236\229\230\243\242\234\224 \226\240\229\236\229\237\232 \241 20 \228\238 22 \247\224\241\238\226" )
		--SystemNotice ( role , "Не волнуйтесь, любви нужно некоторое время. Пожалуйста, дождитесь 14 марта, промежутка времени с 20 до 22 часов" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		SystemNotice ( role , "\203\232\236\232\242 \226\240\229\236\229\237\232 \231\224\234\238\237\247\232\235\241\255. \194\224\236 \239\240\232\228\229\242\241\255 \239\238\228\238\230\228\224\242\252 \228\238 \241\235\229\228\243\254\249\229\227\238 \227\238\228\224" )
		--SystemNotice ( role , "Лимит времени закончился. Вам придется подождать до следующего года" )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )

	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 10 then
		SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \241\229\236\255\237 \235\254\225\226\232.")
		--SystemNotice( role ,"У вас нехватает семян любви.")
		return
	else
	local am2 =TakeItem( role, 0,1074, 10)			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \234\238\235\235\229\234\246\232\232 \232\231 10 \241\229\236\255\237 \235\254\225\226\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен коллекции из 10 семян любви не удался")
			return
		end
	end
	GiveItem( role , 0 , 3077  , 1 , 4 )
end

function GetChaName_23 ( role,npc )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 31420  then
		SystemNotice ( role , "\205\229 \226\238\235\237\243\233\242\229\241\252, \235\254\225\226\232 \237\243\230\237\238 \237\229\234\238\242\238\240\238\229 \226\240\229\236\255. \207\238\230\224\235\243\233\241\242\224, \228\238\230\228\232\242\229\241\252 14 \236\224\240\242\224, \239\240\238\236\229\230\243\242\234\224 \226\240\229\236\229\237\232 \241 20 \228\238 22 \247\224\241\238\226" )
		--SystemNotice ( role , "Не волнуйтесь, любви нужно некоторое время. Пожалуйста, дождитесь 14 марта, промежутка времени с 20 до 22 часов" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		SystemNotice ( role , "\203\232\236\232\242 \226\240\229\236\229\237\232 \231\224\234\238\237\247\232\235\241\255. \194\224\236 \239\240\232\228\229\242\241\255 \239\238\228\238\230\228\224\242\252 \228\238 \241\235\229\228\243\254\249\229\227\238 \227\238\228\224" )
		--SystemNotice ( role , "Лимит времени закончился. Вам придется подождать до следующего года" )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 100 then
		SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \241\229\236\255\237 \235\254\225\226\232.")
		--SystemNotice( role ,"У вас нехватает семян любви.")
		return
	else
	local am2 =TakeItem( role, 0,1074, 100)			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \234\238\235\235\229\234\246\232\232 \232\231 100 \241\229\236\255\237 \235\254\225\226\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен коллекции из 100 семян любви не удался")
			return
		end
	end
	GiveItem( role , 0 , 3094  , 3 , 4 )
end

function GetChaName_24 ( role,npc )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 31420  then
		SystemNotice ( role , "\205\229 \226\238\235\237\243\233\242\229\241\252, \235\254\225\226\232 \237\243\230\237\238 \237\229\234\238\242\238\240\238\229 \226\240\229\236\255. \207\238\230\224\235\243\233\241\242\224, \228\238\230\228\232\242\229\241\252 14 \236\224\240\242\224, \239\240\238\236\229\230\243\242\234\224 \226\240\229\236\229\237\232 \241 20 \228\238 22 \247\224\241\238\226" )
		--SystemNotice ( role , "Не волнуйтесь, любви нужно некоторое время. Пожалуйста, дождитесь 14 марта, промежутка времени с 20 до 22 часов" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 31421 then
		SystemNotice ( role , "\203\232\236\232\242 \226\240\229\236\229\237\232 \231\224\234\238\237\247\232\235\241\255. \194\224\236 \239\240\232\228\229\242\241\255 \239\238\228\238\230\228\224\242\252 \228\238 \241\235\229\228\243\254\249\229\227\238 \227\238\228\224" )
		--SystemNotice ( role , "Лимит времени закончился. Вам придется подождать до следующего года" )
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	
	local am1 = CheckBagItem( role, 1074 )			
	if am1 < 1000 then
		SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \241\229\236\255\237 \235\254\225\226\232.")
		--SystemNotice( role ,"У вас нехватает семян любви.")
		return
	else
	local am2 =TakeItem( role, 0,1074, 1000)			                   
		if am2==0  then
			SystemNotice ( role ,"\206\225\236\229\237 \234\238\235\235\229\234\246\232\232 \232\231 1000 \241\229\236\255\237 \235\254\225\226\232 \237\229 \243\228\224\235\241\255")
			--SystemNotice ( role ,"Обмен коллекции из 1000 семян любви не удался")
			return
		end
	end
	GiveItem( role , 0 , 2844  , 1 , 4 )
end

function GetChaName_25 ( role,npc )
	local ret = KitbagLock(role,0)
	if ret ~= LUA_TRUE then
		SystemNotice(role,"\200\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237. \194\251\234\243\239 \237\229\226\238\231\236\238\230\229\237.")
		--SystemNotice(role,"Инвентарь заблокирован. Выкуп невозможен.")
		return
	end
	local retbag = HasLeaveBagGrid( role, 1)
	if retbag ~= LUA_TRUE then
		SystemNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229.")
		--SystemNotice(role,"Недостаточно места в инвентаре.")
		return 
	end	 
	local cha_name = GetChaDefaultName ( role )
	local am1 = CheckBagItem( role, 2235 )	
	
	
	if am1 < 1  then
		SystemNotice( role ,"\194\224\236 \237\229\238\225\245\238\228\232\236 \202\224\236\229\237\252 \207\229\240\229\240\238\230\228\229\237\232\255.")
		--SystemNotice( role ,"Вам необходим Камень Перерождения.")
		return
	end
	local an1 =TakeItem( role, 0,2235, 1 )
	
	
	if an1==0  then
		SystemNotice ( role ,"\206\225\236\229\237 \237\229 \243\228\224\235\241\255.")
		--SystemNotice ( role ,"Обмен не удался.")
	else
	GiveItem ( role , 0 , 2941  , 1 , 4 )
	LG( "ZSK" ,cha_name,"Rebirth Stone"..am1.." ")
	end
end

function GetChaName1_guildwar( role,npc )
	local num_count = CheckBagItem(role, 2859)
	if num_count >=20 then
		TakeItem( role, 0,2859, 20 )
	local a = math.random ( 1 , 4 )
		if a == 1 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_QINGZ , 10 , 300 )
		elseif a ==2 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_YS , 10 , 300 )
		elseif a ==3 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_HFZQ , 10 , 10 )
		else
	AddState ( role , role , STATE_JRQKL , 10 , 180 )
		end
	end
	if num_count < 20 then
	SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\238\226\255\231\238\234!")
	--SystemNotice( role ,"Вам не хватает Повязок!")
	end
end
--Св Флот
function GetChaName2_guildwar( role,npc )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then
		local bs_def = Def(haijunSide_BaseRole)
		local bs_reseist = Resist(haijunSide_BaseRole)
		local def_20 = 20
		local pedf_1 = 1
		local bs_def_after = bs_def + def_20
		local bs_reseist_after = bs_reseist + pedf_1

		local num_count = CheckBagItem(role, 4546)
			if num_count >=30 then
				TakeItem( role, 0,4546, 30 )
			SetChaAttrI( haijunSide_BaseRole , ATTR_DEF ,bs_def_after )
			SetChaAttrI( haijunSide_BaseRole , ATTR_PDEF, bs_reseist_after )
				SystemNotice( role ,"\206\225\238\240\238\237\224 \209\242\224\242\243\232 \212\235\238\242\224 \225\251\235\224  \243\226\229\235\232\247\229\237\224!")
				--SystemNotice( role ,"Оборона Статуи Флота была  увеличена!")
			end
			if num_count < 30 then
				SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \202\240\232\241\242\224\235\252\237\238\233 \240\243\228\251.")
				--SystemNotice( role ,"У вас нехватает Кристальной руды.")
			end
     
	elseif map_name_role == "guildwar2" then
		local bs_def = Def(di_haijunSide_BaseRole)
		local bs_reseist = Resist(di_haijunSide_BaseRole)
		local def_20 = 20
		local pedf_1 = 1
		local bs_def_after = bs_def + def_20
		local bs_reseist_after = bs_reseist + pedf_1

		local num_count = CheckBagItem(role, 4546)
			if num_count >=30 then
				TakeItem( role, 0,4546, 30 )
			SetChaAttrI( di_haijunSide_BaseRole , ATTR_DEF ,bs_def_after )
			SetChaAttrI( di_haijunSide_BaseRole , ATTR_PDEF, bs_reseist_after )
				SystemNotice( role ,"\206\225\238\240\238\237\224 \209\242\224\242\243\232 \212\235\238\242\224 \225\251\235\224  \243\226\229\235\232\247\229\237\224!")
				--SystemNotice( role ,"Оборона Статуи Флота была  увеличена!")
			end
			if num_count < 30 then
				SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \202\240\232\241\242\224\235\252\237\238\233 \240\243\228\251.")
				--SystemNotice( role ,"У вас нехватает Кристальной руды.")
			end
	end 
end

function GetChaName3_guildwar( role,npc )
    
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then
    
		local num_count_1 = CheckBagItem(role, 1684)
		local num_count_2 = CheckBagItem(role, 4012)
		if num_count_1 >= 4 and num_count_2 >= 9 then
			TakeItem( role, 0,1684, 4 )
			TakeItem( role, 0,4012, 9 )
		AddState ( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKWD , 10 , 180 )
			SystemNotice( role ,"\209\242\224\242\243\255 \212\235\238\242\224 \241\242\224\237\238\226\232\242\241\255 \237\229\243\255\231\226\232\236\238\233 \237\224 3 \236\232\237\243\242\251!")
			--SystemNotice( role ,"Статуя Флота становится неуязвимой на 3 минуты!")
		else
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\224!")
			--SystemNotice( role ,"Вам не хватает материала!")
		end
 	end
	if map_name_role == "guildwar2" then
		
		local num_count_1 = CheckBagItem(role, 1684)
		local num_count_2 = CheckBagItem(role, 4012)
		if num_count_1 >= 4 and num_count_2 >= 9 then
			TakeItem( role, 0,1684, 4 )
			TakeItem( role, 0,4012, 9 )
		AddState ( di_haijunSide_BaseRole , di_haijunSide_BaseRole , STATE_PKWD , 10 , 180 )
			SystemNotice( role ,"\209\242\224\242\243\255 \212\235\238\242\224 \241\242\224\237\238\226\232\242\241\255 \237\229\243\255\231\226\232\236\238\233 \237\224 3 \236\232\237\243\242\251!")
			--SystemNotice( role ,"Статуя Флота становится неуязвимой на 3 минуты!")
		else
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\224!")
			--SystemNotice( role ,"Вам не хватает материала!")
		end
	end
end

function GetChaName4_guildwar( role,npc )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then

	local num_count_1 = CheckBagItem(role, 4011)
	local num_count_2 = CheckBagItem(role, 1720)
		if num_count_1 >= 12 and num_count_2 >= 12 then
			TakeItem( role, 0,4011, 12 )
			TakeItem( role, 0,1720, 12 )
		local min_atk = Mnatk(haijunSide_JTRole_1)
		local max_atk = Mxatk(haijunSide_JTRole_1)
    
			if min_atk == 0 then
				local min_atk = Mnatk(haijunSide_JTRole_2)
				local max_atk = Mxatk(haijunSide_JTRole_2)
			end
		local min_atk_after = min_atk + 25
		local max_atk_after = max_atk + 25
		SetChaAttrI( haijunSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( haijunSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
		SetChaAttrI( haijunSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( haijunSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
			SystemNotice( role ,"\209\239\238\241\238\225\237\238\241\242\232 \237\224\239\224\228\229\237\232\255 \193\224\248\229\237 \212\235\238\242\224 \225\251\235\232 \243\226\229\235\232\247\229\237\251!")
			--SystemNotice( role ,"Способности нападения Башен Флота были увеличены!")
		elseif num_count_1 < 12 and num_count_2 < 12 then
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\224!")
			--SystemNotice( role ,"Вам не хватает материала!")
		end
	end

	if map_name_role == "guildwar2" then
	local num_count_1 = CheckBagItem(role, 4011)
	local num_count_2 = CheckBagItem(role, 1720)
		if num_count_1 >= 12 and num_count_2 >= 12 then
			TakeItem( role, 0,4011, 12 )
			TakeItem( role, 0,1720, 12 )
		local min_atk = Mnatk(di_haijunSide_JTRole_1)
		local max_atk = Mxatk(di_haijunSide_JTRole_1)
    
			if min_atk == 0 then
				local min_atk = Mnatk(di_haijunSide_JTRole_2)
				local max_atk = Mxatk(di_haijunSide_JTRole_2)
			end
		local min_atk_after = min_atk + 25
		local max_atk_after = max_atk + 25
		SetChaAttrI( di_haijunSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( di_haijunSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
		SetChaAttrI( di_haijunSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( di_haijunSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
			SystemNotice( role ,"\209\239\238\241\238\225\237\238\241\242\232 \237\224\239\224\228\229\237\232\255 \193\224\248\229\237 \212\235\238\242\224 \225\251\235\232 \243\226\229\235\232\247\229\237\251!")
			--SystemNotice( role ,"Способности нападения Башен Флота были увеличены!")
     
		elseif num_count_1 < 12 and num_count_2 < 12 then
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\224!")
			--SystemNotice( role ,"Вам не хватает материала!")
		end 
	end  
end

function GetChaName5_guildwar(role)
	local num_count_1 = CheckBagItem(role, 2964)
	local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 30641 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

	elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 30641 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
	else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName6_guildwar(role)
	local num_count_1 = CheckBagItem(role, 2964)
	local map_name_cha = GetChaMapName ( role )
	if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
	else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName7_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end 
end

function GetChaName8_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName9_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName10_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 999 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 11241 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 15 )
	local Monster1 =CreateChaX( 1025 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 11241 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

--function GetChaName11_guildwar(role)-------К№УГ15ёцєЈѕьБоЈЁЦРВ·Ј©
--     local num_count_1 = CheckBagItem(role, 176)----ІРИ±µД№ьК¬Іј
--     local map_name_cha = GetChaMapName ( role )
--     if num_count_1 >= 15 and map_name_cha == "guildwar" then
--        TakeItem( role, 0,176, 15 )
--        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
--	local Monster1 =CreateChaX( 999 , 30500 , 30800 , 145 , 310,role )
--	SetChaLifeTime( Monster1, 300 )
--	SetChaSideID(Monster1, 1)
--	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
--	local Monster2 =CreateChaX( 999 , 30641 , 30802 , 145 , 310,role )
--	SetChaLifeTime( Monster2, 300 )
--	SetChaSideID(Monster2, 1)
--	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
--	local Monster3 =CreateChaX( 999 , 30541 , 30702 , 145 , 310,role )
--	SetChaLifeTime( Monster3, 300 )
--	SetChaSideID(Monster3, 1)
--	
--        SystemNotice( role ,"Surprise Attack Successfully Summoned!")
--     else
--     SystemNotice( role ,"You don't have enough Navy Tokens!")
--     end
--end

function GetChaName11_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!"))

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName12_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName13_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end


function GetChaName14_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName15_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName16_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 999 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 999 , 11041 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 999 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 11100 , 11800 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 999 , 11241 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 999 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

     elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 30 )
        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1025 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1025 , 11141 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 11100 , 11900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1025 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1025 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName17_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 999 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 999 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	local Monster5 =CreateChaX( 999 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	local Monster6 =CreateChaX( 999 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	local Monster8 =CreateChaX( 999 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	local Monster2 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	local Monster3 =CreateChaX( 1025 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	local Monster5 =CreateChaX( 1025 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	local Monster6 =CreateChaX( 1025 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)
	local Monster8 =CreateChaX( 1025 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName18_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
       local Monster1 =CreateChaX( 999 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName19_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 999 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName20_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 999 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 30841 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 30541 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 30441 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 30700 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 30741 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 30700 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 30841 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 30741 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 30741 , 11002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 30841 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 30541 , 11102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 30441 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName21_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 999 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 51241 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 51241 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 51041 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 51141 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 51341 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 51200 , 10000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 51241 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 51341 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 51441 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 51241 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 51141 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 51041 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 51141 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName22_guildwar(role)
    local num_count_1 = CheckBagItem(role, 2964)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,2964, 45 )
        local Monster1 =CreateChaX( 999 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 999 , 11041 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 999 , 11141 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 999 , 11100 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 999 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 999 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 999 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 999 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 999 , 11441 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 999 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 999 , 10941 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,2964, 45 )
	local Monster1 =CreateChaX( 1025 , 11100 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 1)
	
	local Monster2 =CreateChaX( 1025 , 11041 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 1)
	
	local Monster3 =CreateChaX( 1025 , 11141 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 1)
	local Monster4 =CreateChaX( 1025 , 11100 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 1)
	
	local Monster5 =CreateChaX( 1025 , 11241 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 1)
	
	local Monster6 =CreateChaX( 1025 , 11241 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 1)
	local Monster7 =CreateChaX( 1025 , 11341 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 1)

	local Monster8 =CreateChaX( 1025 , 11141 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 1)
	local Monster9 =CreateChaX( 1025 , 11441 , 11902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 1)
	local Monster10 =CreateChaX( 1025 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 1)
	local Monster11 =CreateChaX( 1025 , 10941 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 1)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \199\237\224\234\238\226 \244\235\238\242\224!")
		--SystemNotice( role ,"Вам не хватает Знаков флота!")
    end
end

function GetChaName23_guildwar( role,npc )
    local num_count = CheckBagItem(role, 2858)
    if num_count >=20 then
        TakeItem( role, 0,2858, 20 )
	local a = math.random ( 1 , 4 )
        if a == 1 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
        AddState ( role , role , STATE_QINGZ , 10 , 300 )
	elseif a ==2 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_YS , 10 , 300 )
	elseif a ==3 then
	--AddState ( role , role , STATE_JRQKL , 10 , 180 )
	AddState ( role , role , STATE_HFZQ , 10 , 10 )
	else
	AddState ( role , role , STATE_JRQKL , 10 , 180 )
	end
    end
    if num_count < 20 then
    SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \210\224\225\224\234\224")
	--SystemNotice( role ,"Вам не хватает Табака")
    end
end
--Св Пираты
function GetChaName24_guildwar( role,npc )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then
		local bs_def = Def(haidaoSide_BaseRole)
		local bs_reseist = Resist(haidaoSide_BaseRole)
		local def_20 = 20
		local pedf_1 = 1
		local bs_def_after = bs_def + def_20
		local bs_reseist_after = bs_reseist + pedf_1
		local num_count = CheckBagItem(role, 4546)
			if num_count >=30 then
				TakeItem( role, 0,4546, 30 )
			SetChaAttrI( haidaoSide_BaseRole , ATTR_DEF ,bs_def_after )
			--AddState( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKLC, 10 , 10800 )
			SetChaAttrI( haidaoSide_BaseRole , ATTR_PDEF, bs_reseist_after )
				SystemNotice( role ,"\206\225\238\240\238\237\224 \209\242\224\242\243\232 \207\232\240\224\242\238\226 \225\251\235\224  \243\226\229\235\232\247\229\237\224!")
				--SystemNotice( role ,"Оборона Статуи Пиратов была  увеличена!")
			end
			if num_count < 30 then
				SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \202\240\232\241\242\224\235\252\237\238\233 \240\243\228\251.")
				--SystemNotice( role ,"У вас нехватает Кристальной руды.")
			end
	elseif map_name_role == "guildwar2" then
		local bs_def = Def(di_haidaoSide_BaseRole)
		local bs_reseist = Resist(di_haidaoSide_BaseRole)
		local def_20 = 20
		local pedf_1 = 1
		local bs_def_after = bs_def + def_20
		local bs_reseist_after = bs_reseist + pedf_1
		local num_count = CheckBagItem(role, 4546)
			if num_count >=30 then
				TakeItem( role, 0,4546, 30 )
			SetChaAttrI( di_haidaoSide_BaseRole , ATTR_DEF ,bs_def_after )
			--AddState( haijunSide_BaseRole , haijunSide_BaseRole , STATE_PKLC, 10 , 10800 )
			SetChaAttrI( di_haidaoSide_BaseRole , ATTR_PDEF, bs_reseist_after )
				SystemNotice( role ,"\206\225\238\240\238\237\224 \209\242\224\242\243\232 \207\232\240\224\242\238\226 \225\251\235\224  \243\226\229\235\232\247\229\237\224!")
				--SystemNotice( role ,"Оборона Статуи Пиратов была  увеличена!")
			end
			if num_count < 30 then
				SystemNotice( role ,"\211 \226\224\241 \237\229\245\226\224\242\224\229\242 \202\240\232\241\242\224\235\252\237\238\233 \240\243\228\251.")
				--SystemNotice( role ,"У вас нехватает Кристальной руды.")
			end
	end
end

function GetChaName25_guildwar( role,npc )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then
		local num_count_1 = CheckBagItem(role, 4013)
		local num_count_2 = CheckBagItem(role, 1683)
		if num_count_1 >= 4 and num_count_2 >= 9 then
			TakeItem( role, 0,4013, 4 )
			TakeItem( role, 0,1683, 9 )
		AddState ( haidaoSide_BaseRole , haidaoSide_BaseRole , STATE_PKWD , 10 , 180 )
			SystemNotice( role ,"\209\242\224\242\243\255 \207\232\240\224\242\238\226 \241\242\224\237\238\226\232\242\241\255 \237\229\243\255\231\226\232\236\238\233 \237\224 3 \236\232\237\243\242\251!")
			--SystemNotice( role ,"Статуя Пиратов становится неуязвимой на 3 минуты!")
		else
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\238\226!")
			--SystemNotice( role ,"Вам не хватает материалов!")
		end
	end
	if map_name_role == "guildwar2" then
		local num_count_1 = CheckBagItem(role, 4013)
		local num_count_2 = CheckBagItem(role, 1683)
		if num_count_1 >= 4 and num_count_2 >= 9 then
			TakeItem( role, 0,4013, 4 )
			TakeItem( role, 0,1683, 9 )
		AddState ( di_haidaoSide_BaseRole , di_haidaoSide_BaseRole , STATE_PKWD , 10 , 180 )
			SystemNotice( role ,"\209\242\224\242\243\255 \207\232\240\224\242\238\226 \241\242\224\237\238\226\232\242\241\255 \237\229\243\255\231\226\232\236\238\233 \237\224 3 \236\232\237\243\242\251!")
			--SystemNotice( role ,"Статуя Пиратов становится неуязвимой на 3 минуты!")
		else
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\238\226!")
			--SystemNotice( role ,"Вам не хватает материалов!")
		end
	end
end

function GetChaName26_guildwar( role,npc )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "guildwar" then
		local num_count_1 = CheckBagItem(role, 4011)
		local num_count_2 = CheckBagItem(role, 1720)
		if num_count_1 >= 12 and num_count_2 >= 12 then
			TakeItem( role, 0,4011, 12 )
			TakeItem( role, 0,1720, 12 )
		local min_atk = Mnatk(haidaoSide_JTRole_1)
		local max_atk = Mxatk(haidaoSide_JTRole_1)
		if min_atk == 0 then
			local min_atk = Mnatk(haidaoSide_JTRole_2)
			local max_atk = Mxatk(haidaoSide_JTRole_2)
		end
		local min_atk_after = min_atk + 25
		local max_atk_after = max_atk + 25
		SetChaAttrI( haidaoSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( haidaoSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
		SetChaAttrI( haidaoSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( haidaoSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
			SystemNotice( role ,"\209\239\238\241\238\225\237\238\241\242\232 \237\224\239\224\228\229\237\232\255 \193\224\248\229\237 \207\232\240\224\242\238\226 \225\251\235\232 \243\226\229\235\232\247\229\237\251!")
			--SystemNotice( role ,"Способности нападения Башен Пиратов были увеличены!")
		elseif num_count_1 < 12 and num_count_2 < 12 then
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\238\226!")
			--SystemNotice( role ,"Вам не хватает материалов!")
		end
	end
	if map_name_role == "guildwar2" then
		local num_count_1 = CheckBagItem(role, 4011)
		local num_count_2 = CheckBagItem(role, 1720)
		if num_count_1 >= 12 and num_count_2 >= 12 then
			TakeItem( role, 0,4011, 12 )
			TakeItem( role, 0,1720, 12 )
		local min_atk = Mnatk(di_haidaoSide_JTRole_1)
		local max_atk = Mxatk(di_haidaoSide_JTRole_1)
		if min_atk == 0 then
			local min_atk = Mnatk(di_haidaoSide_JTRole_2)
			local max_atk = Mxatk(di_haidaoSide_JTRole_2)
		end
		local min_atk_after = min_atk + 25
		local max_atk_after = max_atk + 25
		SetChaAttrI( di_haidaoSide_JTRole_1 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( di_haidaoSide_JTRole_1 , ATTR_MXATK ,max_atk_after )
		SetChaAttrI( di_haidaoSide_JTRole_2 , ATTR_MNATK ,min_atk_after )
		SetChaAttrI( di_haidaoSide_JTRole_2 , ATTR_MXATK ,max_atk_after )
			SystemNotice( role ,"\209\239\238\241\238\225\237\238\241\242\232 \237\224\239\224\228\229\237\232\255 \193\224\248\229\237 \207\232\240\224\242\238\226 \225\251\235\232 \243\226\229\235\232\247\229\237\251!")
			--SystemNotice( role ,"Способности нападения Башен Пиратов были увеличены!")

		elseif num_count_1 < 12 and num_count_2 < 12 then
			SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \236\224\242\229\240\232\224\235\238\226!")
			--SystemNotice( role ,"Вам не хватает материалов!"))
		end
	end
end

function GetChaName27_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30741 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30741 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30941 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName28_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 51141 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
    --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 51200 , 9800 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 51141 , 9802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 51341 , 9902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName29_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11141 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11300 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 11241 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11141 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName30_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )

	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30700 , 51700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30841 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30700 , 51770 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 51670 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30941 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName31_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 12000 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11900 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName32_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 15 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 52300 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 52441 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 52541 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 15 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 15 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 52300 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 52200 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 52100 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

--function GetChaName11_guildwar(role)-------К№УГ15ёцєЈѕьБоЈЁЦРВ·Ј©
--     local num_count_1 = CheckBagItem(role, 176)----ІРИ±µД№ьК¬Іј
--     local map_name_cha = GetChaMapName ( role )
--     if num_count_1 >= 15 and map_name_cha == "guildwar" then
--        TakeItem( role, 0,176, 15 )
--        --local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
--	local Monster1 =CreateChaX( 999 , 30500 , 30800 , 145 , 310,role )
--	SetChaLifeTime( Monster1, 300 )
--	SetChaSideID(Monster1, 2)
--	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
--	local Monster2 =CreateChaX( 999 , 30641 , 30802 , 145 , 310,role )
--	SetChaLifeTime( Monster2, 300 )
--	SetChaSideID(Monster2, 2)
--	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
--	local Monster3 =CreateChaX( 999 , 30541 , 30702 , 145 , 310,role )
--	SetChaLifeTime( Monster3, 300 )
--	SetChaSideID(Monster3, 2)
--	
--        SystemNotice( role ,"Surprise Attack Successfully Summoned!")
--     else
--     SystemNotice( role ,"You don't have enough Navy Tokens!")
--     end
--end

function GetChaName33_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30600 , 10200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30641 , 10302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30541 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30541 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30600 , 10200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30641 , 10302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30541 , 10102 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 30741 , 10202 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30541 , 10002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName34_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 51200 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 51141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 51241 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 51000 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 51141 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 51341 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 51041 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 51200 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 51141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 51241 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 51000 , 10900 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 51141 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 51341 , 10902 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 51041 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName35_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11400 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 11541 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 11400 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 11341 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 11341 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11400 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 11541 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 11400 , 11700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 11341 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 11341 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11441 , 11802 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end


function GetChaName36_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 30841 , 51600 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 30741 , 51600 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30700 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 30641 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 30741 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30741 , 51300 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName37_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 ,12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName38_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 30 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1000 , 52100 , 52200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1000 , 52241 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1000 , 52041 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52400 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1000 , 51941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1000 , 51941 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 30 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 30 )
	--local Monster1 = CreateChaEx(999, 30641, 51702, 237, 60)
	local Monster1 =CreateChaX( 1026 , 52100 , 52200 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster2 =CreateChaX( 1026 , 52241 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster3 =CreateChaX( 1026 , 52041 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52400 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	--local Monster2 = CreateChaEx(999, 30841, 51702, 237, 60)
	local Monster5 =CreateChaX( 1026 , 51941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	--local Monster3 = CreateChaEx(999, 30941, 51702, 237, 60)
	local Monster6 =CreateChaX( 1026 , 51941 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName39_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 30700 , 10500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 30541 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 30741 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 30541 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30641 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 30841 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 30841 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 30741 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1026 , 30700 , 10500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 30541 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 10400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 30741 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 30541 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30641 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 30841 , 10402 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 30841 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 30741 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 30641 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName40_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 52100 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 52241 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 52141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52200 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 52041 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 52141 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52341 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 52341 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 52041 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 52041 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 52341 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1026 , 52100 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 52241 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 52141 , 10802 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52200 , 10700 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 52041 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 52141 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52341 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 52341 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 52041 , 10502 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 52041 , 10602 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 52341 , 10702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName41_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 11500 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 11441 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 11400 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 11541 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 11541 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 11641 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1026 , 11500 , 11600 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 11441 , 11602 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 11541 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 11400 , 11500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 11541 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 11541 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 11641 , 11502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 11641 , 11402 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 11641 , 11702 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName42_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1026 , 30700 , 51500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 30541 , 51602 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 30500 , 51400 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 30741 , 51402 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 30541 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 30641 , 51502 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 30841 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 30841 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 30741 , 51302 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 30741 , 51202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName43_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 11900 , 52100 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 11941 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 12000 , 52000 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 12141 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 11841 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 11841 , 52002 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 12041 , 51702 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 12141 , 51902 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 12141 , 52102 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 12641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName44_guildwar(role)
    local num_count_1 = CheckBagItem(role, 3001)
    local map_name_cha = GetChaMapName ( role )
    if num_count_1 >= 45 and map_name_cha == "guildwar" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1000 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1000 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1000 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1000 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1000 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1000 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1000 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1000 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1000 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1000 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")

    elseif num_count_1 >= 45 and map_name_cha == "guildwar2" then
        TakeItem( role, 0,3001, 45 )
	local Monster1 =CreateChaX( 1000 , 52300 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster1, 300000 )
	SetChaSideID(Monster1, 2)
	local Monster2 =CreateChaX( 1026 , 52241 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster2, 300000 )
	SetChaSideID(Monster2, 2)
	local Monster3 =CreateChaX( 1026 , 52341 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster3, 300000 )
	SetChaSideID(Monster3, 2)
	local Monster4 =CreateChaX( 1026 , 52000 , 52500 , 145 , 310,role )
	SetChaLifeTime( Monster4, 300000 )
	SetChaSideID(Monster4, 2)
	local Monster5 =CreateChaX( 1026 , 52141 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster5, 300000 )
	SetChaSideID(Monster5, 2)
	local Monster6 =CreateChaX( 1026 , 52241 , 52402 , 145 , 310,role )
	SetChaLifeTime( Monster6, 300000 )
	SetChaSideID(Monster6, 2)
	local Monster7 =CreateChaX( 1026 , 52241 , 52602 , 145 , 310,role )
	SetChaLifeTime( Monster7, 300000 )
	SetChaSideID(Monster7, 2)
	local Monster8 =CreateChaX( 1026 , 52441 , 52502 , 145 , 310,role )
	SetChaLifeTime( Monster8, 300000 )
	SetChaSideID(Monster8, 2)
	local Monster9 =CreateChaX( 1026 , 52641 , 52702 , 145 , 310,role )
	SetChaLifeTime( Monster9, 300000 )
	SetChaSideID(Monster9, 2)
	local Monster10 =CreateChaX( 1026 , 52641 , 52202 , 145 , 310,role )
	SetChaLifeTime( Monster10, 300000 )
	SetChaSideID(Monster10, 2)
	local Monster11 =CreateChaX( 1026 , 52641 , 52302 , 145 , 310,role )
	SetChaLifeTime( Monster11, 300000 )
	SetChaSideID(Monster11, 2)
    	SystemNotice( role ,"\194\237\229\231\224\239\237\224\255 \224\242\224\234\224!")
		--SystemNotice( role ,"Внезапная атака!")
    else
		SystemNotice( role ,"\194\224\236 \237\229 \245\226\224\242\224\229\242 \207\232\240\224\242\241\234\232\245 \204\229\242\238\234!")
		--SystemNotice( role ,"Вам не хватает Пиратских Меток!")
    end
end

function GetChaName45_guildwar(character,npc)

		local i= CheckBagItem( character, 3849 )
		
		if i~=1 then
			SystemNotice( character , "\211 \226\224\241 \237\229\242 [\204\229\228\224\235\232 \238\242\226\224\227\232]!")
			--SystemNotice( character , "У вас нет [Медали отваги]!")
			return 0
		end

		local s= CheckBagItem( character, 2382 )
		if s >=1 then
		SystemNotice( character , "\205\229\235\252\231\255 \232\236\229\242\252 \241\240\224\231\243 2 \199\237\224\234\224! ")
		--SystemNotice( character , "У вас нет [Знака жизни и смерти]!")
			return 0
		end

		local retbag = HasLeaveBagGrid( character, 1)
	        if retbag ~= LUA_TRUE then
		SystemNotice(character,"\194\224\236 \239\238\242\240\229\225\243\229\242\241\255 \236\232\237\232\236\243\236 \238\228\232\237 \241\226\238\225\238\228\237\251\233 \241\235\238\242, \247\242\238\225\251 \239\238\235\243\247\232\242\252 [\199\237\224\234 \230\232\231\237\232 \232 \241\236\229\240\242\232]!")
		--SystemNotice(character,"Вам потребуется минимум один свободный слот, чтобы получить [Знак жизни и смерти]!")
		return 
	end	 
		local role_RY = GetChaItem2 ( character , 2 , 3849 )
                local HonorPoint = GetItemAttr ( role_RY , ITEMATTR_VAL_STR)
                local HonorPoint_now = HonorPoint - 15
	if HonorPoint < 0 then
		SystemNotice ( character , "\194\224\236 \237\229 \245\226\224\242\224\229\242 \238\247\234\238\226 \247\229\241\242\232, \247\242\238\225\251 \239\238\235\243\247\232\242\252 [\199\237\224\234 \230\232\231\237\232 \232 \241\236\229\240\242\232]!" )
		--SystemNotice ( character , "Вам не хватает очков чести, чтобы получить [Знак жизни и смерти]!" )
		return 0
	else   
	        SetItemAttr( role_RY , ITEMATTR_VAL_STR , HonorPoint_now )
		GiveItem ( character , 0 , 2382  , 1 , 4 )

	end
	
end

--Первое перерождение

--Перерождение Воителя
function GetChaName1_born ( role,npc )

        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type ~= 3 then
		SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241 \236\238\230\229\242 \241\242\224\242\252 \194\238\232\242\229\235\229\236 ")
		--SystemNotice( role ,"Только Ланс или Филлис могут стать воителями")
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255 ")
		--SystemNotice( role ,"Не выполнены требования Перерождения")
		return
	end

	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,9 )
	GiveItem_chibang ( role  )					--Выдача крыльев перерождения
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end

--Перерождение чемпиона
function GetChaName2_born ( role,npc )

        local cha_type = GetChaTypeID ( role )
	if cha_type~=2 then
		SystemNotice( role ,"\210\238\235\252\234\238 \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \215\229\236\239\232\238\237\238\236")
		--SystemNotice( role ,"Только Карциз может стать Чемпионом")
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice( role ,"Не выполнены требования Перерождения")
		return
	end

	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,8 )
	GiveItem_chibang ( role  )					--Выдача крыльев перерождения
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end

--Перерождение Покорителя морей
function GetChaName3_born ( role,npc )

        local cha_type = GetChaTypeID ( role )
	if cha_type~=1 and cha_type~=3 and cha_type~=4 then
		SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241, \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \207\238\234\224\240\232\242\229\235\255\236\232 \236\238\240\229\233")
		--SystemNotice( role ,"Только Ланс, Филлис или Ами могут стать Покарителями морей")
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice( role ,"Не выполнены требования Перерождения")
		return
	end

	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,16 )
	GiveItem_chibang ( role  )					--Выдача крыльев перерождения
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end

--Перерождение Стрелка
function GetChaName4_born ( role,npc )
	
	local cha_type = GetChaTypeID( role )
	if cha_type ~= 1 and cha_type ~= 3 then
		SystemNotice( role, "Только Ланс и Филлис могут стать Стрелком " )
		return
	end

	local check = GetChaName_born( role )
	if check == 0 then
		SystemNotice( role, "Требования перерождения не выполнены " )
		return
	end

	local cha_job = GetChaAttr( role, ATTR_JOB )
	SetChaAttr( role, ATTR_JOB, 12 )
	GiveItem_chibang( role )
	GiveItem_zsbook( role )
	RefreshCha( role )
end

--Перерождение Целительници
function GetChaName5_born ( role,npc )

        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \214\229\235\232\242\229\235\255\236\232")
		--SystemNotice( role ,"Только Филлис или Ами могут стать Целителями")
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice( role ,"Не выполнены требования Перерождения")
		return
	end

	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,13 )
	GiveItem_chibang ( role  )					--Выдача крыльев перерождения
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end

--Перерождение Колдуньи
function GetChaName6_born ( role,npc )

        local cha_type = GetChaTypeID ( role )
	if cha_type~=3 and cha_type~=4 then
		SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \202\238\235\228\243\237\252\255\236\232")
		--SystemNotice( role ,"Только Филлис или Ами могут стать Колдуньями")
		return
	end
	local check=GetChaName_born ( role )
	if check==0 then
		SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice( role ,"Не выполнены требования Перерождения")
		return
	end

	local cha_job = GetChaAttr( role , ATTR_JOB )
	SetChaAttr(role, ATTR_JOB ,14 ) 	
	GiveItem_chibang ( role  )					--Выдача крыльев перерождения
	GiveItem_zsbook ( role )
	RefreshCha ( role )
end

--выдача крыльев первого перерождения
function GiveItem_chibang ( role  )
        local cha_type = GetChaTypeID ( role )	
	if cha_type==1 then
		GiveItem( role , 0 , 134  , 1 , 4 )
	elseif cha_type==2 then
		GiveItem( role , 0 , 138  , 1 , 4 )
	elseif cha_type==3 then
		GiveItem( role , 0 , 128  , 1 , 4 )
	elseif cha_type==4 then
		GiveItem( role , 0 , 131  , 1 , 4 )
	end
end

--выдачи книги первого перерождения
function GiveItem_zsbook ( role )
	local cha_job = GetChaAttr(role, ATTR_JOB)
	---SystemNotice( role ,""..cha_job )
	if cha_job == 8 then
		GiveItem( role , 0 , 2957 , 1 , 4 )
	elseif cha_job == 9 then
		GiveItem( role , 0 , 2956 , 1 , 4 )
	elseif cha_job == 12 then
		GiveItem( role , 0 , 2961 , 1 , 4 )
	elseif cha_job == 13 then
		GiveItem( role , 0 , 2959 , 1 , 4 )
	elseif cha_job == 14 then
		GiveItem( role , 0 , 2958 , 1 , 4 )
	elseif cha_job == 16 then
		GiveItem( role , 0 , 2960 , 1 , 4 )
	end
end

--Выдача кольца 85 уровня
-- function GiveItem_ring ( role  )
	-- local cha_job = GetChaAttr(role, ATTR_JOB)
	--SystemNotice( role ,""..cha_job )
	-- if cha_job == 8 then
		-- GiveItem( role , 0 , 2577 , 1 , 4 )--кольцо 85 уровень на Чемпиона
	-- elseif cha_job == 9 then
		-- GiveItem( role , 0 , 2578 , 1 , 4 )--кольцо 85 уровень на Воителя
	-- elseif cha_job == 12 then
		-- GiveItem( role , 0 , 2579 , 1 , 4 )--кольцо 85 уровень на Стрелка
	-- elseif cha_job == 13 then
		-- GiveItem( role , 0 , 2582 , 1 , 4 )--кольцо 85 уровень на Цилительницу
	-- elseif cha_job == 14 then
		-- GiveItem( role , 0 , 2581 , 1 , 4 )--кольцо 85 уровень на Колдунью
	-- elseif cha_job == 16 then
		-- GiveItem( role , 0 , 2580 , 1 , 4 )--кольцо 85 уровень на Покорителя морей

	-- end
-- end

-- function TakeItem_ring ( role  )
	-- local cha_job = GetChaAttr(role, ATTR_JOB)
	--SystemNotice( role ,""..cha_job )
	-- if cha_job == 8 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )
	-- elseif cha_job == 9 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )
	-- elseif cha_job == 12 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )
	-- elseif cha_job == 13 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )
	-- elseif cha_job == 14 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )
	-- elseif cha_job == 16 then
		-- TakeItem ( role , 0 , 2520 , 1 )
		-- TakeItem ( role , 0 , 2521 , 1 )

	-- end
-- end


function GetChaName_born ( role )

	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	local i = CheckBagItem( role, 2235 )    
	if i < 1 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\234\224\230\232\242\229 \228\238\234\224\231\224\242\229\235\252\241\242\226\238 \226\224\248\229\227\238 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice( role ,"Пожалуйста, покажите доказательство вашего Перерождения")
		return 0
	end

	local item_empty=IsEquip(role)
	if item_empty==LUA_TRUE then
		SystemNotice(role,"\207\238\230\224\235\243\233\241\242\224 \241\237\232\236\232\242\229 \226\241\184 \241\226\238\184 \241\237\224\240\255\230\229\237\232\229, \226\234\235\254\247\224\255 \234\238\235\252\246\224 \232 \225\232\230\243\242\229\240\232\254")
		--SystemNotice(role,"Пожалуйста снимите всё своё снаряжение, включая кольца и бижутерию")
		return 0	
	end

	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 5 then
		SystemNotice(role ,"\211 \226\224\241 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229, \237\229\238\225\245\238\228\232\236\238 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226")
		--SystemNotice(role ,"У вас недостаточно места в инвентаре, необходимо 5 свободных слотов")
		UseItemFailed ( role )
		return 0
	end
	local zs1 =TakeItem( role, 0,2235, 1 )
	if zs1==0 then
		SystemNotice ( role ,"\211 \226\224\241 \237\229\242\243 \202\224\236\237\255 \207\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice ( role ,"У вас нету Камня Перерождения")
		return 0
	end

	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 0 then
		SystemNotice(role ,"\194\251 \243\230\229 \239\229\240\229\240\238\230\228\229\237\251")
		--SystemNotice(role ,"Вы уже перерождены")
		return 0
	end


	local QLZX= GetSkillLv ( role, SK_QLZX )
	local cha_skill_num=GetChaAttr(role, ATTR_TP  )
	local clear_skill_num=ClearFightSkill(role)

	cha_skill_num=cha_skill_num+clear_skill_num

	if QLZX == 1 then
		cha_skill_num = cha_skill_num - 1
		AddChaSkill ( role , SK_QLZX , 1 , 1 , 0 )
	end

	SetChaAttr(role, ATTR_TP ,cha_skill_num ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
	SetChaAttr(role, ATTR_BSTR ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,5 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,5 ) 
	SyncChar(role,4)
	SetChaAttr(role , ATTR_AP,ap  )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )
	local sk_add = SK_ZSSL
	AddChaSkill ( role , sk_add , 1 , 1 , 0 )

	local effect = 138              -- ID эффекта из sceneffectinfo.txt
    PlayEffect (role, effect )      -- Заставляем проигрывать э
	GMNotice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \207\229\240\226\238\229 \207\229\240\229\240\238\230\228\229\237\232\229 \243\241\239\229\248\237\238 \239\240\238\233\228\229\237\238!\209\235\224\226\224 \227\229\240\238\254! ")
	--Notice("Поздравляем "..cha_name.." Первое Перерождение успешно пройдено! Благословение от всего сервера "..cha_name.." Богиня благословляет Вас Слава героям!")
	return 1
end

--Второе Перерождение

--Перерождение Воителя
function GetChaName1_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
        if cha_type~=1 and cha_type~=3 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241 \232\235\232 \212\232\235\235\232\241 \236\238\227\243\242 \241\242\224\242\252 \226\238\232\242\229\235\255\236\232")
			--SystemNotice( role ,"Только Ланс или Филлис могут стать воителями")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,9 )  
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end

--Перерождение Чемпиона
function GetChaName2_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=2 then
			SystemNotice( role ,"\210\238\235\252\234\238 \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \215\229\236\239\232\238\237\238\236")
			--SystemNotice( role ,"Только Карциз может стать Чемпионом")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,8 )
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end
--Перерождение Покорителя морей
function GetChaName3_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=1 and cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241, \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \207\238\234\224\240\232\242\229\235\255\236\232 \236\238\240\229\233")
			--SystemNotice( role ,"Только Ланс, Филлис или Ами могут стать Покарителями морей")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,16 )         
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end

--Перерождение Стрелок
function GetChaName4_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=1 and cha_type~=3 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241 \232\235\232 \212\232\235\235\232\241 \236\238\227\243\242 \241\242\224\242\252 \209\242\240\229\235\234\224\236\232")
			--SystemNotice( role ,"Только Ланс или Филлис могут стать Стрелками")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,12 )         
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end

--Перерождение Цилительница
function GetChaName5_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \214\229\235\232\242\229\235\255\236\232")
			--SystemNotice( role ,"Только Филлис или Ами могут стать Целителями")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,13 )         
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end

--Перерождение Колдунья
function GetChaName6_born2 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \202\238\235\228\243\237\252\255\236\232")
			--SystemNotice( role ,"Только Филлис или Ами могут стать Колдуньями")
				return
		end
	local check=GetChaName_born2 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,14 )         
		GiveItem_chibang2 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook2 ( role )
		RefreshCha ( role )

end

--выдача крыльев второго перерождения
function GiveItem_chibang2 ( role  )
	local cha_type = GetChaTypeID ( role )  
		if cha_type==1 then
			GiveItem( role , 0 , 136  , 1 , 4 )--Ланс
		elseif cha_type==2 then
			GiveItem( role , 0 , 139  , 1 , 4 )--Карциз
		elseif cha_type==3 then
			GiveItem( role , 0 , 129  , 1 , 4 )--Филлис
		elseif cha_type==4 then
			GiveItem( role , 0 , 132  , 1 , 4 )--Ами
		end
end

--выдача книги второго перерождения
function GiveItem_zsbook2 ( role )
	local cha_job = GetChaAttr(role, ATTR_JOB)
	---SystemNotice( role ,""..cha_job )
	if cha_job == 8 then
		GiveItem( role , 0 , 6013 , 1 , 4 )--книга второго перерождения чемпиона
	elseif cha_job == 9 then
		GiveItem( role , 0 , 6012 , 1 , 4 )--книга второго перерождения воителя
	elseif cha_job == 12 then
		GiveItem( role , 0 , 6017 , 1 , 4 )--книга второго перерождения стрелка
	elseif cha_job == 13 then
		GiveItem( role , 0 , 6015 , 1 , 4 )--книга второго перерождения цилительници
	elseif cha_job == 14 then
		GiveItem( role , 0 , 6014 , 1 , 4 )--книга второго перерождения колдуньи
	elseif cha_job == 16 then
		GiveItem( role , 0 , 6016 , 1 , 4 )--книга второго перерождения покорителя морей
	end
end

function GetChaName_born2 ( role )

	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	local i = CheckBagItem( role, 6949 )--ID Камня (стоит ID Камня второго Перерождения)
		if i < 1 then
			SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\234\224\230\232\242\229 \228\238\234\224\231\224\242\229\235\252\241\242\226\238 \226\224\248\229\227\238 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Пожалуйста, покажите доказательство вашего Перерождения")
				return 0
		end

	local item_empty=IsEquip(role)
		if item_empty==LUA_TRUE then
			SystemNotice(role,"\207\238\230\224\235\243\233\241\242\224 \241\237\232\236\232\242\229 \226\241\184 \241\226\238\184 \241\237\224\240\255\230\229\237\232\229, \226\234\235\254\247\224\255 \234\238\235\252\246\224 \232 \225\232\230\243\242\229\240\232\254")
			--SystemNotice(role,"Пожалуйста снимите всё своё снаряжение, включая кольца и бижутерию")
				return 0	
		end

	local Item_CanGet = GetChaFreeBagGridNum ( role )	
		if Item_CanGet < 5 then
			SystemNotice(role ,"\211 \226\224\241 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229, \237\229\238\225\245\238\228\232\236\238 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226")
			--SystemNotice(role ,"У вас недостаточно места в инвентаре, необходимо 5 свободных слотов")
			UseItemFailed ( role )
				return 0
		end
	local zs1 = TakeItem( role, 0,6949, 1 )--ID Камня (стоит ID Камня Второго Перерождения)
		if zs1==0 then
			SystemNotice ( role ,"\211 \226\224\241 \237\229\242\243 \202\224\236\237\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice ( role ,"У вас нету Камня Перерождения")
				return 0
		end

	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
		if Zs_Exp > 10000 then
			SystemNotice(role ,"\194\251 \243\230\229 \239\229\240\229\240\238\230\228\229\237\251")
			--SystemNotice(role ,"Вы уже перерождены")
				return 0
		end

	local QLZX = GetSkillLv ( role, SK_QLZX )
	local cha_skill_num=GetChaAttr(role, ATTR_TP  )
	local clear_skill_num=ClearFightSkill(role)
		cha_skill_num=cha_skill_num+clear_skill_num

		if QLZX == 1 then
			cha_skill_num = cha_skill_num - 1
			AddChaSkill ( role , SK_QLZX , 2 , 2 , 0 )
		end

	SetChaAttr(role, ATTR_TP ,cha_skill_num ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
		ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
		SetChaAttr(role, ATTR_BSTR ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BDEX ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BAGI ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BCON ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BSTA ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role , ATTR_AP,ap  )
		SyncChar(role,4)
		AddSailExp(role, npc , 1 , 1 )
	local sk_add = SK_ZSSL
		AddChaSkill ( role , sk_add , 2 , 2 , 0 )

		PlayEffect( npc, 361 )
			GMNotice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \194\242\238\240\238\229 \207\229\240\229\240\238\230\228\229\237\232\229 \243\241\239\229\248\237\238 \239\240\238\233\228\229\237\238!\209\235\224\226\224 \227\229\240\238\254!")
			--Notice("Поздравляем "..cha_name.." Второе Перерождение успешно пройдено! Благословение от всего сервера "..cha_name.." Богиня благословляет Вас Слава героям!")
				return 1

end

--Третье Перерождение

--Перерождение Воителя
function GetChaName1_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
        if cha_type~=1 and cha_type~=3 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241 \232\235\232 \212\232\235\235\232\241 \236\238\227\243\242 \241\242\224\242\252 \226\238\232\242\229\235\255\236\232")
			--SystemNotice( role ,"Только Ланс или Филлис могут стать воителями")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,9 )  
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end

--Перерождение Чемпиона
function GetChaName2_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=2 then
			SystemNotice( role ,"\210\238\235\252\234\238 \202\224\240\246\232\231 \236\238\230\229\242 \241\242\224\242\252 \215\229\236\239\232\238\237\238\236")
			--SystemNotice( role ,"Только Карциз может стать Чемпионом")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,8 )
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end
--Перерождение Покорителя морей
function GetChaName3_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=1 and cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241, \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \207\238\234\224\240\232\242\229\235\255\236\232 \236\238\240\229\233")
			--SystemNotice( role ,"Только Ланс, Филлис или Ами могут стать Покарителями морей")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,16 )         
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end

--Перерождение Стрелок
function GetChaName4_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=1 and cha_type~=3 then
			SystemNotice( role ,"\210\238\235\252\234\238 \203\224\237\241 \232\235\232 \212\232\235\235\232\241 \236\238\227\243\242 \241\242\224\242\252 \209\242\240\229\235\234\224\236\232")
			--SystemNotice( role ,"Только Ланс или Филлис могут стать Стрелками")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,12 )         
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end

--Перерождение Цилительница
function GetChaName5_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \214\229\235\232\242\229\235\255\236\232")
			--SystemNotice( role ,"Только Филлис или Ами могут стать Целителями")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,13 )         
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end

--Перерождение Колдунья
function GetChaName6_born3 ( role,npc )
	local cha_type = GetChaTypeID ( role )
		if cha_type~=3 and cha_type~=4 then
			SystemNotice( role ,"\210\238\235\252\234\238 \212\232\235\235\232\241 \232\235\232 \192\236\232 \236\238\227\243\242 \241\242\224\242\252 \202\238\235\228\243\237\252\255\236\232")
			--SystemNotice( role ,"Только Филлис или Ами могут стать Колдуньями")
				return
		end
	local check=GetChaName_born3 ( role )
		if check==0 then
			SystemNotice( role ,"\205\229 \226\251\239\238\235\237\229\237\251 \242\240\229\225\238\226\224\237\232\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Не выполнены требования Перерождения")
				return
		end
--добавление Скилла перерождения
	local cha_job = GetChaAttr( role , ATTR_JOB )
		SetChaAttr(role, ATTR_JOB ,14 )         
		GiveItem_chibang3 ( role  )					--Выдача крыльев перерождения
		GiveItem_zsbook3 ( role )
		RefreshCha ( role )

end

--Выдача крыльев третьего перерождения
function GiveItem_chibang3 ( role  )
	local cha_type = GetChaTypeID ( role )  
		if cha_type==1 then
			GiveItem( role , 0 , 137  , 1 , 4 )--Ланс
		elseif cha_type==2 then
			GiveItem( role , 0 , 140  , 1 , 4 )--Карциз
		elseif cha_type==3 then
			GiveItem( role , 0 , 130  , 1 , 4 )--Филлис
		elseif cha_type==4 then
			GiveItem( role , 0 , 133  , 1 , 4 )--Ами
		end
end

--выдача книги третьего перерождения
function GiveItem_zsbook3 ( role )
	local cha_job = GetChaAttr(role, ATTR_JOB)
	---SystemNotice( role ,""..cha_job )
	if cha_job == 8 then
		GiveItem( role , 0 , 6020 , 1 , 4 )--книга третьего перерождения чемпиона
	elseif cha_job == 9 then
		GiveItem( role , 0 , 6019 , 1 , 4 )--книга третьего перерождения воителя
	elseif cha_job == 12 then
		GiveItem( role , 0 , 6024 , 1 , 4 )--книга третьего  перерождения стрелка
	elseif cha_job == 13 then
		GiveItem( role , 0 , 6022 , 1 , 4 )--книга третьего  перерождения цилительници
	elseif cha_job == 14 then
		GiveItem( role , 0 , 6021 , 1 , 4 )--книга третьего  перерождения колдуньи
	elseif cha_job == 16 then
		GiveItem( role , 0 , 6023 , 1 , 4 )--книга третьего  перерождения покорителя морей
	end
end

function GetChaName_born3 ( role )

	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	local i = CheckBagItem( role, 6950 )--ID Камня (стоит ID Камня третьтего Перерождения)
		if i < 1 then
			SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\234\224\230\232\242\229 \228\238\234\224\231\224\242\229\235\252\241\242\226\238 \226\224\248\229\227\238 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice( role ,"Пожалуйста, покажите доказательство вашего Перерождения")
				return 0
		end

	local item_empty=IsEquip(role)
		if item_empty==LUA_TRUE then
			SystemNotice(role,"\207\238\230\224\235\243\233\241\242\224 \241\237\232\236\232\242\229 \226\241\184 \241\226\238\184 \241\237\224\240\255\230\229\237\232\229, \226\234\235\254\247\224\255 \234\238\235\252\246\224 \232 \225\232\230\243\242\229\240\232\254")
			--SystemNotice(role,"Пожалуйста снимите всё своё снаряжение, включая кольца и бижутерию")
				return 0	
		end

	local Item_CanGet = GetChaFreeBagGridNum ( role )	
		if Item_CanGet < 5 then
			SystemNotice(role ,"\211 \226\224\241 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229, \237\229\238\225\245\238\228\232\236\238 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226")
			--SystemNotice(role ,"У вас недостаточно места в инвентаре, необходимо 5 свободных слотов")
			UseItemFailed ( role )
				return 0
		end
	local zs1 = TakeItem( role, 0,6950, 1 )--ID Камня (стоит ID Камня третьего Перерождения)
		if zs1==0 then
			SystemNotice ( role ,"\211 \226\224\241 \237\229\242\243 \202\224\236\237\255 \207\229\240\229\240\238\230\228\229\237\232\255")
			--SystemNotice ( role ,"У вас нету Камня Перерождения")
				return 0
		end

	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
		if Zs_Exp > 50000 then
			SystemNotice(role ,"\194\251 \243\230\229 \239\229\240\229\240\238\230\228\229\237\251")
			--SystemNotice(role ,"Вы уже перерождены")
				return 0
		end

	local QLZX = GetSkillLv ( role, SK_QLZX )
	local cha_skill_num=GetChaAttr(role, ATTR_TP  )
	local clear_skill_num=ClearFightSkill(role)
		cha_skill_num=cha_skill_num+clear_skill_num

		if QLZX == 1 then
			cha_skill_num = cha_skill_num - 1
			AddChaSkill ( role , SK_QLZX , 3 , 3 , 0 )
		end

	SetChaAttr(role, ATTR_TP ,cha_skill_num ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
		ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
		SetChaAttr(role, ATTR_BSTR ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BDEX ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BAGI ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BCON ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role, ATTR_BSTA ,5 ) 
		SyncChar(role,4)
		SetChaAttr(role , ATTR_AP,ap  )
		SyncChar(role,4)
		AddSailExp(role, npc , 1 , 1 )
	local sk_add = SK_ZSSL
		AddChaSkill ( role , sk_add , 3 , 3 , 0 )

		PlayEffect( npc, 361 )
			GMNotice("\207\238\231\228\240\224\226\235\255\229\236 \232\227\240\238\234\224 "..cha_name.." \210\240\229\242\252\229 \207\229\240\229\240\238\230\228\229\237\232\229 \243\241\239\229\248\237\238 \239\240\238\233\228\229\237\238!\209\235\224\226\224 \227\229\240\238\254!")
			--Notice("Поздравляем "..cha_name.." Третье Перерождение успешно пройдено! Благословение от всего сервера "..cha_name.." Богиня благословляет Вас Слава героям!")
				return 1

end

function ChangeItem(character, npc)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
	if Item_CanGet <1 then
		SystemNotice(character ,"\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \239\238\235\243\247\232\242\252 \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232")
		--SystemNotice(character ,"Требуется 1 свободная ячейка в инвентаре, чтобы получить Разрешение Церкви")
		return 0
	end
	local am1 = CheckBagItem( character, 3066 )			
	if am1 < 1 then
		SystemNotice( character ,"\211 \242\229\225\255 \237\229\242 \208\224\231\240\229\248\229\237\232\255 \214\229\240\234\226\232")
		--SystemNotice( character ,"У тебя нет Разрешения Церкви")
		return 0
	end
	local Money_Need = 50000
	local Money_Have = GetChaAttr ( character , ATTR_GD )
	if Money_Need > Money_Have  then
		SystemNotice( character ,"\205\229\245\226\224\242\224\229\242 \228\229\237\229\227. \205\243\230\237\238 50000 \236\238\237\229\242")
		--SystemNotice( character ,"Нехватает денег. Нужно 50000 монет")
		return 0
	else
		TakeMoney(character,nil,Money_Need)
	end

	local r1=0
	local r2=0
	r1,r2 =MakeItem ( character , 3078  , 10 , 4 )
	local Item_el = GetChaItem ( character , 2 , r2 )

	local item_old = GetChaItem2 ( character , 2 , 3066 )
	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)	
	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)
	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)  
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)
	

	SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month )
	SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day )  
	SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour )
	SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute )

	SynChaKitbag(character,13)
	
end


function MarryCertificate(role, npc)
--Настройка--
local money_need = 10000000 --Кол-во золота, необходимое для получения сертификата
local fata_need = 1 --Ами и Филлис должны одевать фату? (1 - да; 0 - нет)
--
	if IsInTeam(role)== 1 then

		if PartyNum(role) > 2 then
			SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \238\241\242\224\237\252\242\229\241\252 \237\224\229\228\232\237\229 \226 \227\240\243\239\239\229 \241\238 \241\226\238\229\233 \239\238\235\238\226\232\237\234\238\233.")
				--SystemNotice(role, "Пожалуйста, останьтесь наедине в группе со своей половинкой.")
			return
		end

		local player = {}
		player[1] = role
		player[2] = GetTeamCha( role , 0 )

			local freebag1 = GetChaFreeBagGridNum(role)
			local freebag2 = GetChaFreeBagGridNum(role)
				if freebag1 < 1 then
					SystemNotice(role, "\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229!")
						--SystemNotice(role, "Требуется 1 свободная ячейка в инвентаре!")
					SystemNotice(player[2], "\194\224\248\229\233 \239\238\235\238\226\232\237\234\229 \242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229!")
						--SystemNotice(player[2], "Вашей половинке требуется 1 свободная ячейка в инвентаре!")
					return
				end

				if freebag2 < 1 then
					SystemNotice(player[2], "\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229!")
						--SystemNotice(player[2], "Требуется 1 свободная ячейка в инвентаре!")
					SystemNotice(role, "\194\224\248\229\233 \239\238\235\238\226\232\237\234\229 \242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229!")
						--SystemNotice(role, "Вашей половинке требуется 1 свободная ячейка в инвентаре!")
					return
				end

			local NocLock1 =	KitbagLock( role, 0 )
			local NocLock2 =	KitbagLock( player[2], 0 )
			if NocLock1  == 0 then
				SystemNotice(role, "\211 \194\224\241 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(role, "У Вас заблокирован инвентарь!")
				SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(player[2], "У Вашей половинки заблокирован инвентарь!")
				return
			end
			if NocLock2  == 0 then
				SystemNotice(player[2], "\211 \194\224\241 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(player[2], "У Вас заблокирован инвентарь!")
				SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(role, "У Вашей половинки заблокирован инвентарь!")
				return
			end

				local GetCertificate1 = CheckBagItem(role, 2913 )
				local GetCertificate2 = CheckBagItem(player[2], 2913 )
					if GetCertificate1 > 0 then
						SystemNotice(role, "\211 \194\224\241 \243\230\229 \229\241\242\252 \241\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242!")
							--SystemNotice(role, "У Вас уже есть свадебный сертификат!")
						SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \229\241\242\252 \241\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242!")
							--SystemNotice(player[2], "У Вашей половинки уже есть свадебный сертификат!")
						return
					end
					if GetCertificate2 > 0 then
						SystemNotice(player[2], "\211 \194\224\241 \243\230\229 \229\241\242\252 \241\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242!")
							--SystemNotice(player[2], "У Вас уже есть свадебный сертификат!")
						SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \229\241\242\252 \241\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242!")
							--SystemNotice(role, "У Вашей половинки уже есть свадебный сертификат!")
						return
					end

				local GetMarryRing1 = CheckBagItem(role, 2520 )
				local GetMarryRing2 = CheckBagItem(player[2], 2520 )
					if GetMarryRing1 > 0 then
						SystemNotice(role, "\211 \194\224\241 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
							--SystemNotice(role, "У Вас уже была Свадьба!")	
						SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
							--SystemNotice(player[2], "У Вашей половинки уже была Свадьба!")
						return
					end
					if GetMarryRing2 > 0 then
						SystemNotice(player[2], "\211 \194\224\241 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
							--SystemNotice(player[2], "У Вас уже была Свадьба!")
						SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
							--SystemNotice(role, "У Вашей половинки уже была Свадьба!")
						return
					end

						if WeddingRace(role, player[2])==0 then
							return
						end
								if ValentinesRing(role)==0 then
									SystemNotice(role, "\211 \242\229\225\255 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
										--SystemNotice(role, "У тебя нет Кольца дня Св.Валентина!")
									SystemNotice(player[2], "\211 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
										--SystemNotice(player[2], "У твоей половинки нет Кольца дня Св.Валентина!")
										return
								end
								if ValentinesRing(player[2])==0 then
									SystemNotice(player[2], "\211 \242\229\225\255 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
										--SystemNotice(player[2], "У тебя нет Кольца дня Св.Валентина!")
									SystemNotice(role, "\211 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
										--SystemNotice(role, "У твоей половинки нет Кольца дня Св.Валентина!")
										return
								end
								if CheckMoney(role, money_need) ==0 then
									SystemNotice(role, "\205\229\228\238\241\242\224\242\238\247\237\238 \228\229\237\229\227. \205\243\230\237\238 "..money_need.."!")
										--SystemNotice(role, "Недостаточно денег. Нужно "..money_need.."!")
									SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \237\229\228\238\241\242\224\242\238\247\237\238 \228\229\237\229\227. \205\243\230\237\238 "..money_need.."!")
										--SystemNotice(player[2], "У Вашей половинки недостаточно денег. Нужно "..money_need.."!")
									return
								end
								if CheckMoney(player[2], money_need) ==0 then
									SystemNotice(player[2], "\205\229\228\238\241\242\224\242\238\247\237\238 \228\229\237\229\227. \205\243\230\237\238 "..money_need.."!")
										--SystemNotice(player[2], "Недостаточно денег. Нужно "..money_need.."!")
									SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \237\229\228\238\241\242\224\242\238\247\237\238 \228\229\237\229\227. \205\243\230\237\238 "..money_need.."!")
										--SystemNotice(role, "У Вашей половинки недостаточно денег. Нужно "..money_need.."!")
									return
								end
										if WeddingDress(role, fata_need)==0 then
											SystemNotice(role, "\205\224\228\229\237\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
												--SystemNotice(role, "Надень свадебный наряд!")
											SystemNotice(player[2], "\194\224\248\224 \239\238\235\238\226\232\237\234\224 \228\238\235\230\237\224 \237\224\228\229\242\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
												--SystemNotice(player[2], "Ваша половинка должна надеть свадебный наряд!")
											return
										end
										if WeddingDress(player[2], fata_need)==0 then
											SystemNotice(player[2], "\205\224\228\229\237\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
												--SystemNotice(player[2], "Надень свадебный наряд!")
											SystemNotice(role, "\194\224\248\224 \239\238\235\238\226\232\237\234\224 \228\238\235\230\237\224 \237\224\228\229\242\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
												--SystemNotice(role, "Ваша половинка должна надеть свадебный наряд!")
											return
										end		
												local money1 = GetChaAttr(role, ATTR_GD)
												local money2 = GetChaAttr(player[2], ATTR_GD)
												if money1 < money_need or money2 < money_need then
													SystemNotice(role, "\194\224\248\229\233 \239\224\240\229 \237\229 \245\226\224\242\224\229\242 \228\229\237\229\227.")
														--SystemNotice(role, "Вашей паре не хватает денег.")
													SystemNotice(player[2], "\194\224\248\229\233 \239\224\240\229 \237\229 \245\226\224\242\224\229\242 \228\229\237\229\227.")
														--SystemNotice(player[2], "Вашей паре не хватает денег.")
													return
												end
														local Ring = GetChaItem2 ( role , 2 , 2521 )
														local CheckRing = GetChaItem2 ( player[2] , 2 , 2521 )
														local Num = GetItemForgeParam ( CheckRing , 1 )
														CheckNum = TansferNum ( Num )
														if CheckNum == 0 then
															SetItemForgeParam ( Ring, 1 , 1 )
															SystemNotice(role, "\196\238\230\228\232\242\229\241\252 \239\238\234\224 \226\224\248\224 \226\242\238\240\224\255 \239\238\235\238\226\232\237\234\224 \239\238\227\238\226\238\240\232\242 \241\238 \209\226\255\249\229\237\237\232\234\238\236.")
																--SystemNotice(role, "Дождитесь пока ваша вторая половинка поговорит со Священником.")
															SystemNotice(player[2], "\194\224\248\224 \226\242\238\240\224\255 \239\238\235\238\226\232\237\234\224 \243\230\229 \239\238\227\238\226\238\240\232\235\224 \241\238 \209\226\255\249\229\237\237\232\234\238\236. \210\229\239\229\240\252 \226\224\248\224 \238\247\229\240\229\228\252.")
																--SystemNotice(player[2], "Ваша вторая половинка уже поговорила со Священником. Теперь ваша очередь.")
														else
															SetItemForgeParam ( CheckRing, 1 , 1 )
															TakeMoney(role, nil, money_need)
															TakeMoney(player[2], nil, money_need)
															RefreshCha(role)
															RefreshCha(player[2])
																	PlayEffect(npc, 366)
																	PlayEffect(role, 370)
																	PlayEffect(player[2], 370)
																	GiveItem (role , 0 , 2913  , 1 , 1)
																	GiveItem (player[2] , 0 , 2913  , 1 , 1)
																	SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \239\238\235\243\247\232\235\232 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \198\229\235\224\229\236 \226\224\236 \241\247\224\241\242\252\255 \226 \241\238\226\236\229\241\242\237\238\233 \230\232\231\237\232 \241 \194\224\248\229\233 \226\242\238\240\238\233 \239\238\235\238\226\232\237\234\238\233!")
																		--SystemNotice(role, "Вы успешно получили Свадебный Сертификат. Желаем вам счастья в совместной жизни с Вашей второй половинкой!")
																	SystemNotice(player[2], "\194\251 \243\241\239\229\248\237\238 \239\238\235\243\247\232\235\232 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \198\229\235\224\229\236 \226\224\236 \241\247\224\241\242\252\255 \226 \241\238\226\236\229\241\242\237\238\233 \230\232\231\237\232 \241 \194\224\248\229\233 \226\242\238\240\238\233 \239\238\235\238\226\232\237\234\238\233!")
																		--SystemNotice(player[2], "Вы успешно получили Свадебный Сертификат. Желаем вам счастья в совместной жизни с Вашей второй половинкой!")
														end

	else
		SystemNotice(role, "\215\242\238\225\251 \239\238\235\243\247\232\242\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242 \236\238\235\238\228\238\230\229\237\251 \228\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229!")
			--SystemNotice(role, "Чтобы получить Свадебный Сертификат молодожены должны быть в группе!")
		return
	end
end

function Marry(role, npc)
--Настройка--
local fata_need = 1 --Ами и Филлис должны одевать фату? (1 - да; 0 - нет)
local sk_add = SK_QLZX
--
	if IsInTeam(role)== 1 then

		if PartyNum(role) > 2 then
			SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \238\241\242\224\237\252\242\229\241\252 \237\224\229\228\232\237\229 \226 \227\240\243\239\239\229 \241\238 \241\226\238\229\233 \239\238\235\238\226\232\237\234\238\233.")
				-- SystemNotice(role, "Пожалуйста, останьтесь наедине в группе со своей половинкой.")
			return
		end

		local player = {}
		player[1] = role
		player[2] = GetTeamCha( role , 0 )
-- Наличие Свадебного сертификата
			local GetCertificate1 = CheckBagItem(role, 2913 )
			local GetCertificate2 = CheckBagItem(player[2], 2913 )
				if GetCertificate1 < 1 then
					SystemNotice(role, "\211 \194\224\241 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224!")
						--SystemNotice(role, "У Вас нет Свадебного сертификата!")
					SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224!")
						--SystemNotice(player[2], "У Вашей половинки нет Свадебного сертификата!")
					return
				end
				if GetCertificate2 < 1 then
					SystemNotice(player[2], "\211 \194\224\241 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224!")
						--SystemNotice(player[2], "У Вас нет Свадебного сертификата!")
					SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224!")
						--SystemNotice(role, "У Вашей половинки нет Свадебного сертификата!")
					return
				end
-- Блокировка инвентаря
			local NocLock1 =	KitbagLock( role, 0 )
			local NocLock2 =	KitbagLock( player[2], 0 )
			if NocLock1  == 0 then
				SystemNotice(role, "\211 \194\224\241 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(role, "У Вас заблокирован инвентарь!")
				SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(player[2], "У Вашей половинки заблокирован инвентарь!")
				return
			end
			if NocLock2  == 0 then
				SystemNotice(player[2], "\211 \194\224\241 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(player[2], "У Вас заблокирован инвентарь!")
				SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252!")
					--SystemNotice(role, "У Вашей половинки заблокирован инвентарь!")
				return
			end
-- Наличие Кольца влюбленных
			local GetMarryRing1 = CheckBagItem(role, 2520 )
			local GetMarryRing2 = CheckBagItem(player[2], 2520 )
				if GetMarryRing1 > 0 then
					SystemNotice(role, "\211 \194\224\241 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
						--SystemNotice(role, "У Вас уже была Свадьба!")	
					SystemNotice(player[2], "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
						--SystemNotice(player[2], "У Вашей половинки уже была Свадьба!")
					return
				end
				if GetMarryRing2 > 0 then
					SystemNotice(player[2], "\211 \194\224\241 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
						--SystemNotice(player[2], "У Вас уже была Свадьба!")
					SystemNotice(role, "\211 \194\224\248\229\233 \239\238\235\238\226\232\237\234\232 \243\230\229 \225\251\235\224 \209\226\224\228\252\225\224!")
						--SystemNotice(role, "У Вашей половинки уже была Свадьба!")
					return
				end
-- Раса
				if WeddingRace(role, player[2])==0 then
					return
				end
-- Наличие Кольца Св.Валентина
				if ValentinesRing(role)==0 then
					SystemNotice(role, "\211 \242\229\225\255 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
						--SystemNotice(role, "У тебя нет Кольца дня Св.Валентина!")
					SystemNotice(player[2], "\211 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
						--SystemNotice(player[2], "У твоей половинки нет Кольца дня Св.Валентина!")
					return
				end
				if ValentinesRing(player[2])==0 then
					SystemNotice(player[2], "\211 \242\229\225\255 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
						--SystemNotice(player[2], "У тебя нет Кольца дня Св.Валентина!")
					SystemNotice(role, "\211 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232 \237\229\242 \202\238\235\252\246\224 \228\237\255 \209\226.\194\224\235\229\237\242\232\237\224!")
						--SystemNotice(role, "У твоей половинки нет Кольца дня Св.Валентина!")
					return
				end
-- Свадебный наряд
				if WeddingDress(role, fata_need)==0 then
					SystemNotice(role, "\205\224\228\229\237\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
						--SystemNotice(role, "Надень свадебный наряд!")
					SystemNotice(player[2], "\194\224\248\224 \239\238\235\238\226\232\237\234\224 \228\238\235\230\237\224 \237\224\228\229\242\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
						--SystemNotice(player[2], "Ваша половинка должна надеть свадебный наряд!")
					return
				end
				if WeddingDress(player[2], fata_need)==0 then
					SystemNotice(player[2], "\205\224\228\229\237\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
						--SystemNotice(player[2], "Надень свадебный наряд!")
					SystemNotice(role, "\194\224\248\224 \239\238\235\238\226\232\237\234\224 \228\238\235\230\237\224 \237\224\228\229\242\252 \241\226\224\228\229\225\237\251\233 \237\224\240\255\228!")
						--SystemNotice(role, "Ваша половинка должна надеть свадебный наряд!")
					return
				end	

					local Ring = GetChaItem2 ( role , 2 , 2521 )
					local CheckRing = GetChaItem2 ( player[2] , 2 , 2521 )
					local Num = GetItemForgeParam ( CheckRing , 1 )
					CheckNum = TansferNum ( Num )
						if CheckNum ~= 2 then
							SetItemForgeParam ( Ring, 1 , 2 )
							SystemNotice(role, "\196\238\230\228\232\242\229\241\252 \239\238\234\224 \226\224\248\224 \226\242\238\240\224\255 \239\238\235\238\226\232\237\234\224 \239\238\227\238\226\238\240\232\242 \241 \207\229\240\226\238\241\255\249\229\237\237\232\234\238\236.")
								--SystemNotice(role, "Дождитесь пока ваша вторая половинка поговорит с Первосященником.")
							SystemNotice(player[2], "\194\224\248\224 \226\242\238\240\224\255 \239\238\235\238\226\232\237\234\224 \243\230\229 \239\238\227\238\226\238\240\232\235\224 \241 \207\229\240\226\238\241\255\249\229\237\237\232\234\238\236. \210\229\239\229\240\252 \226\224\248\224 \238\247\229\240\229\228\252.")
								--SystemNotice(player[2], "Ваша вторая половинка уже поговорила с Первосященником. Теперь ваша очередь.")
						else

							local ID_Num1 = GetPlayerID(GetChaPlayer(role))
							local ID_Num2 = GetPlayerID(GetChaPlayer(player[2]))

							local cha_name1 = GetChaDefaultName ( role )
							local cha_name2 = GetChaDefaultName ( player[2] )

								TakeItem ( role, 0, 2913, 1 )   				-- Свадебные сертификаты
								TakeItem ( player[2], 0, 2913, 1 )

								TakeItem ( role, 0, 2521, 1 )   				-- Кольца Св. Валентина
								TakeItem ( player[2], 0, 2521, 1 )
																	-- Выдаем Кольца влюбленных
								MakeItem ( role ,  2520 , 1 , 1 )
									local ring1 = GetChaItem2 ( role , 2 , 2520 )
									SetItemForgeParam ( ring1, 1 , ID_Num2 )

								MakeItem ( player[2],  2520 , 1 , 1 )
									local ring2 = GetChaItem2 ( player[2], 2 , 2520 )
									SetItemForgeParam ( ring2, 1 , ID_Num1 )

								AddChaSkill ( role , sk_add, 1 , 1 , 0 )			-- Обучение скиллу "Узы любви"
								AddChaSkill ( player[2] , sk_add, 1 , 1 , 0 )

								PlayEffect(npc, 366)
																	-- Тут должны быть аура
                                                                PlayEffect(role, 838)
								PlayEffect(player[2], 838)

								local message = "\207\238\231\228\240\224\226\235\255\229\236 "..cha_name1.." \232 "..cha_name2.." \241 \241\238\241\242\238\255\226\248\229\233\241\255 \241\226\224\228\252\225\238\233. \206\242 \226\241\229\233 \228\243\248\232 \230\229\235\224\229\236 \226\224\236 \241\247\224\241\242\252\255 \226 \241\238\226\236\229\241\242\237\238\233 \230\232\231\237\232."
								--local message = "Поздравляем "..cha_name1.." и "..cha_name2.." с состоявшейся свадьбой. От всей души желаем вам счастья в совместной жизни."
								Notice ( message )

						end
	else
			SystemNotice(role, "\215\242\238\225\251 \241\238\229\228\232\237\232\242\252 \194\224\248\232 \241\229\240\228\246\224 \236\238\235\238\228\238\230\229\237\251 \228\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229!")
				--SystemNotice(role, "Чтобы соединить Ваши сердца молодожены должны быть в группе!")
		return
	end

end
---------------------------------------------------------

function StandartBuff1( role )

	local money = HasMoney(role , 10000)
	
	if money == 0 then
		SystemNotice( role ,"У Вас недостаточно золота! ")
	end
	
	local StateType = GetChaStateLv ( role , STATE_XLZH )
	if StateType == 0 then
		AddState( role , role , STATE_XLZH, 10 , 1800 ) --Наложить состояние STATE_XLZH (Призрачный огонь) 10лвл сроком на 300 секунд (5 минут). Здесь уровень состояния МОЖНО менять. Уровень состояния будет соответсвовать уровню накладываемого заклинания.
		TakeMoney (role, nil, 10000)
		SystemNotice( role ,"Наложен Призрачный огонь 10лвл на 30 минут! ")
	else
		SystemNotice( role ,"Нельзя использовать одновременно два заклинания одного типа! ")
	end
end

function StandartBuff2( role )

	local money = HasMoney(role , 10000)
	
	if money == 0 then
		SystemNotice( role ,"У Вас недостаточно золота! ")
	end
	
	local StateType = GetChaStateLv ( role , STATE_SHPF )
	if StateType == 0 then
		AddState ( role , role , STATE_SHPF , 10 , 1800 )
		TakeMoney (role, nil, 10000)
		SystemNotice( role ,"Наложена Закалка 10лвл на 30 минут! ")
	else
		SystemNotice( role ,"Нельзя использовать одновременно два заклинания одного типа! ")
	end
end

function StandartBuff3( role )

	local money = HasMoney(role , 10000)
	
	if money == 0 then
		SystemNotice( role ,"У Вас недостаточно золота! ")
	end
	
	local StateType = GetChaStateLv ( role , STATE_TSHD )
	if StateType == 0 then
		AddState( role , role , STATE_TSHD, 10 , 1800 )
		TakeMoney (role, nil, 10000)
		SystemNotice( role ,"Наложен Ангельский щит 10лвл на 30 минут! ")
	else
		SystemNotice( role ,"Нельзя использовать одновременно два заклинания одного типа! ")
	end
end

function StandartBuff4( role )

	local money = HasMoney(role , 10000)
	
	if money == 0 then
		SystemNotice( role ,"У Вас недостаточно золота! ")
	end
	
	local StateType = GetChaStateLv ( role , STATE_MLCH )
	if StateType == 0 then
		AddState ( role , role , STATE_MLCH , 10 , 1800 )
		TakeMoney (role, nil, 10000)
		SystemNotice( role ,"Наложена Интенсивная магия 10лвл на 30 минут! ")
	else
		SystemNotice( role ,"Нельзя использовать одновременно два заклинания одного типа! ")
	end
end

function StandartBuff5( role )

	local money = HasMoney(role , 10000)
	
	if money == 0 then
		SystemNotice( role ,"У Вас недостаточно золота! ")
	end
	
	local StateType = GetChaStateLv ( role , STATE_FZLZ )
	if StateType == 0 then
		AddState ( role , role , STATE_FZLZ , 10 , 1800 )
		TakeMoney (role, nil, 10000)
		SystemNotice( role ,"Наложена Мощь бури 10лвл на 30 минут! ")  
	else
		SystemNotice( role ,"Нельзя использовать одновременно два заклинания одного типа! ")
	end
end

function MegaBuff( role )

	local money = HasMoney(role , 1000000)
	if money == 0 then
	HelpInfo(role,0,"Мои услуги стоят 1.000.000 ")
	return 0
	end

	local StateType = GetChaStateLv ( role , STATE_XLZH ) -- ???? ????? ??
	local StateType = GetChaStateLv ( role , STATE_SHPF ) -- ???? ????? ??
	local StateType = GetChaStateLv ( role , STATE_TSHD ) -- ???? ????? ??
	local StateType = GetChaStateLv ( role , STATE_MLCH ) -- ???? ????? ??
	local StateType = GetChaStateLv ( role , STATE_FZLZ ) -- ???? ????? ??

	if StateType == 0 then

		AddState (role, role, STATE_XLZH, 10, 1800)
		AddState (role, role, STATE_SHPF, 10, 1800)
		AddState (role, role, STATE_MLCH, 10, 1800)
		AddState (role, role, STATE_FZLZ, 10, 1800)
		AddState (role, role, STATE_JSFB, 10, 1800)
		AddState (role, role, STATE_TSHD, 10, 1800)
		EffectPanel_Add(role, "STATE_ZDSBJYGZ", statelv, "n1405", EffectPanel_TimeConvertor(statetime))
		ALLExAttrSet(role)
		RefreshCha(role)
		
		TakeMoney (role, nil, 1000000) -- ?????10?
		SystemNotice( role ,"Все усиления 10 уровня успешно наложены на 30 минут ") -- ???????? ??????????? ???? ??
	else

		HelpInfo(role,0,"Баффы уже наложены! ") -- ????? ????????????

	end

end

function BDAltar (role, Item )
    local Item_CanGet = GetChaFreeBagGridNum ( role )
    if Item_CanGet <1 then
        SystemNotice(role ,"Требуется 1 свободный слот в инвентаре, чтобы получить Алтарь Стража.")
        UseItemFailed ( role )
        return
    end
    local r1,r2 =MakeItem ( role , 266  , 1 , 4 )
    local Item_BDAltar = GetChaItem ( role , 2 , r2 )
    

    local str_BDAltar = GetItemAttr( Item_BDAltar ,ITEMATTR_VAL_STR )
    local con_BDAltar = GetItemAttr( Item_BDAltar ,ITEMATTR_VAL_CON )
    local agi_BDAltar = GetItemAttr( Item_BDAltar ,ITEMATTR_VAL_AGI )
    local dex_BDAltar = GetItemAttr( Item_BDAltar ,ITEMATTR_VAL_DEX )


    
    str_JLone    = -95
    con_JLone = -95
    agi_JLone    = -95
    dex_JLone = -95


    
    SetItemAttr ( Item_BDAltar ,ITEMATTR_VAL_STR , str_JLone )
    SetItemAttr ( Item_BDAltar ,ITEMATTR_VAL_CON , con_JLone )
    SetItemAttr ( Item_BDAltar ,ITEMATTR_VAL_AGI , agi_JLone )
    SetItemAttr ( Item_BDAltar ,ITEMATTR_VAL_DEX , dex_JLone)
    RefreshCha(role)

    
    
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------LiptonTea---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------2010 - 2011---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------