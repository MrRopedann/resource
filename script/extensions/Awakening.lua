print(" Loading Awakening.lua" )

NaHelm = {}
	NaHelm.conf = {
		HelmID			= 57, 		-- Nightmare Helm ID
		dustID			= 7576, 	-- Dusty Nightmare Helm ID
		enSlot 			= 1,		-- Slot to awaken helm
		maxEn 			= 10,		-- Max of Awakening
		Mxhp_Awaken		= 10,		-- MAX HP Modulus Bonus obtained: 1%
		Mxsp_Awaken		= 10,		-- MAX SP Modulus Bonus obtained: 1%
		Mspd_Awaken		= 10,		-- MSPD Modulus Bonus obtained: 1%
		Pr_Awaken		= 10,			-- Physical Resist Obtained: 1
		HREC_Awaken		= 10,		-- Physical Resist Obtained: 1
		SREC_Awaken		= 10,		-- Physical Resist Obtained: 1
		STR_Awaken		= 10,		-- Physical Resist Obtained: 1
		AGI_Awaken		= 10,			-- Physical Resist Obtained: 1
		DEX_Awaken		= 10,			-- Physical Resist Obtained: 1
		CON_Awaken		= 10,			-- Physical Resist Obtained: 1
		STA_Awaken		= 10,			-- Physical Resist Obtained: 1
	}
	
 	NaHelm.awRate 				= {};
 		NaHelm.awRate[0]			= 1			-- Lv0 to Lv1: 100%
 		NaHelm.awRate[1]			= 1			-- Lv1 to Lv2: 90%
 		NaHelm.awRate[2]			= 1			-- Lv2 to Lv3: 80%
 		NaHelm.awRate[3]			= 1			-- Lv3 to Lv4: 70%
 		NaHelm.awRate[4]			= 1			-- Lv4 to Lv5: 60%
 		NaHelm.awRate[5]			= 1			-- Lv5 to Lv6: 50%
 		NaHelm.awRate[6]			= 1			-- Lv6 to Lv7: 40%
 		NaHelm.awRate[7]			= 1			-- Lv7 to Lv8: 30%
 		NaHelm.awRate[8]			= 1			-- Lv8 to Lv9: 20%
 		NaHelm.awRate[9]			= 1			-- Lv9 to Lv10: 10%	
	
---------------------------------------
-- * Obtain the awaken level of helm --
---------------------------------------
NaHelm.getLv = function(item)
	local getLv = GetItemAttr(item, 55)
		if getLv > 0 then
			return getLv
		end
	return 0
end

-------------------------------------
-- * Dusty Nightmare Helm function --
-------------------------------------
DustyNightmare = function(role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local HasItem = CheckBagItem(role, NaHelm.conf['dustID']);
	if HasItem < 1 then
		BickerNotice(role,"["..GetItemName(NaHelm.conf['dustID']).."] is not in inventory!");
		UseItemFailed(role);
		return
	else	
		----------------------------------------------------------------
		-- Set attributes to helm by default: +1% Mx HP/SP, +1% Mspd; --
		----------------------------------------------------------------		
		local r1, r2 = MakeItem(role, NaHelm.conf['HelmID'], 1, 25) -- If not set quality 25, awaken will not work;
		local Awaken = GetChaItem(role,  2, r2) 
		SetItemAttr(Awaken, ITEMATTR_COE_MXHP, NaHelm.conf['Mxhp_Awaken']); 	-- MAX HP Modulus Bonus;
		SetItemAttr(Awaken, ITEMATTR_COE_MXSP, NaHelm.conf['Mxsp_Awaken']);		-- MAX SP Modulus Bonus;
		SetItemAttr(Awaken, ITEMATTR_COE_MSPD, NaHelm.conf['Mspd_Awaken']);		-- MSPD Modulus Bonus;
		SetItemAttr(Awaken, 55, 1); 											-- Set Awaken level;
		Notice(''..GetChaDefaultName(role)..', sucesfully unsealed '..GetItemName(NaHelm.conf['dustID'])..'!');
	end
end

------------------------------------
-- * Scroll of Awakening function --
------------------------------------
AwakeningScroll = function(role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
		if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	
	-- Obtains helm slot to awaken, 1st slot;
	local helm = GetChaItem(role, 2, (NaHelm.conf['enSlot'] - 1))
	local slotId = GetItemID(helm)
	local helmLv = NaHelm.getLv(helm)
	local sourceId = GetItemID(Item)
	if slotId ~= NaHelm.conf['HelmID'] then
		BickerNotice(role, 'Cannot use ['..GetItemName(sourceId)..'] on '..GetItemName(slotId)..'!')
		UseItemFailed(role)
		return
	end	
	
	-- Check if awaken level of helm is not max;
	if helmLv >= NaHelm.conf['maxEn'] then
		BickerNotice(role, '['..GetItemName(slotId)..'] already maxed Nightmare Helm!')
		UseItemFailed(role)
		return
	end	
	
	-- Awakening from Lv1 to Lv6 with sucess rate and Lv addition;
	local success_Rate = Percentage_Random(NaHelm.awRate[helmLv]);
	local LvAddition = helmLv + 1	
	local physical = GetItemAttr(helm, ITEMATTR_VAL_PDEF)
	local HREC = GetItemAttr(helm, ITEMATTR_VAL_HREC)
	local SREC = GetItemAttr(helm, ITEMATTR_VAL_SREC)
	local STR = GetItemAttr(helm, ITEMATTR_VAL_STR)
	local AGI = GetItemAttr(helm, ITEMATTR_VAL_AGI)
	local DEX = GetItemAttr(helm, ITEMATTR_VAL_DEX)
	local CON = GetItemAttr(helm, ITEMATTR_VAL_CON)
	local STA = GetItemAttr(helm, ITEMATTR_VAL_STA)
		if helmLv >= 1 and helmLv <= 6 then
		if success_Rate == 1 then
			SetItemAttr(helm, ITEMATTR_COE_MXHP, (LvAddition * NaHelm.conf['Mxhp_Awaken']));	-- MAX HP Modulus Bonus;
			SetItemAttr(helm, ITEMATTR_COE_MXSP, (LvAddition * NaHelm.conf['Mxsp_Awaken']));	-- MAX SP Modulus Bonus;
			SetItemAttr(helm, ITEMATTR_COE_MSPD, (LvAddition * NaHelm.conf['Mspd_Awaken']));	-- MSPD Modulus Bonus;
			SetItemAttr(helm, 55, helmLv + 1); 													-- Set Awaken level;		
			PlayEffect(role, 345);																-- Success effect;	
		else
			SystemNotice(role , "Sorry, awaken has failed!");
			PlayEffect(role, 346);																-- Failure effect;
		end				
	end
	-- Awakening from Lv7 to Lv10 with sucess rate and Lv addition, increases physical resist at Lv8-10;	
		if helmLv >= 7 and helmLv <= 9 then
		if success_Rate == 1 then
			SetItemAttr(helm, ITEMATTR_COE_MXHP, (LvAddition * NaHelm.conf['Mxhp_Awaken']));	-- MAX HP Modulus Bonus;
			SetItemAttr(helm, ITEMATTR_COE_MXSP, (LvAddition * NaHelm.conf['Mxsp_Awaken']));	-- MAX SP Modulus Bonus;
			SetItemAttr(helm, ITEMATTR_COE_MSPD, (LvAddition * NaHelm.conf['Mspd_Awaken']));	-- MSPD Modulus Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_PDEF, (LvAddition + NaHelm.conf['Pr_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_HREC, (LvAddition + NaHelm.conf['HREC_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_SREC, (LvAddition + NaHelm.conf['SREC_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_STR, (LvAddition + NaHelm.conf['STR_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_AGI, (LvAddition + NaHelm.conf['AGI_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_DEX, (LvAddition + NaHelm.conf['DEX_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_CON, (LvAddition + NaHelm.conf['CON_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, ITEMATTR_VAL_STA, (LvAddition + NaHelm.conf['STA_Awaken']));		-- Physical Resist Bonus;
			SetItemAttr(helm, 55, helmLv + 1); 													-- Set Awaken level;		
			PlayEffect(role, 345);																-- Success effect;		
		else
			SystemNotice(role , "Sorry, awaken has failed!");
			PlayEffect(role, 346);																-- Failure effect;
		end				
	end			
end