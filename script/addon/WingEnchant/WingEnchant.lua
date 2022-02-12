--[[
	[Note]:
		1.	When the wing created, should be with the item quality: 90. For example:
				&make wingid,quantity,90
				GiveItem(role, wingid, quantity, 90)
		2.	Use the ItemInfo lines example that here, or attributes will not work.

	[Installation]:
		1.	Create New folder called "WingEnchant" at: \resource\script\addon\
		1.1	Put this file inside that new folder
		1.2	Go to: \resource\script\addon\
		1.3	Open the file "Install.lua"
		1.4	Put the following inside it:
				dofile(GetResPath("script/addon/WingEnchant/WingEnchant.lua"))
		2	Change the "Wings.Conf.StateID" according to the id you put the skilleff.txt line;
		3 	Go to \resource\script\calculate:
		3.1	Open the file: Functions.lua
		3.2	Search for: SetChaParam(role, 1, now_tick + freq * time)
		3.3	Put the following below that:
				Wings.ApplyEffect(role)
		4.	Go to \resource\script\calculate:
		4.1	Open the file: AttrCalculate.lua
		4.2	Search for: Creat_Item(item, item_type, item_lv, item_event)
		4.3	Below "Reset_item_add()" put the following:
				--Wings
				if item_event == 90 then
					for i = ITEMATTR_VAL_STR, ITEMATTR_VAL_STA do
						Add_Item_Attr(i, 0)
					end
				end	
		5.	That's all!
		
	[ItemInfo]:
		7694	Wings Unseal Device	n2568	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	1000,1000	0,0	0	0	0	0	0	0	0	0	0	WingsUnseal	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Able to unseal Wings that can be enchanted. Double click to use.	0
		7695	Wings Strength Enchant	n29101	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	WingAttrBoost	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Raise wing's strength by 1 upon usage. Can be improved to 300 attributes points at most.	0
		7696	Wings Constitution Enchant	n29098	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	WingAttrBoost	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Raise wing's constitution by 1 upon usage. Can be improved to 300 attributes points at most.	0
		7697	Wings Accuracy Enchant	n29099	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	WingAttrBoost	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Raise wing's accuracy by 1 upon usage. Can be improved to 300 attributes points at most.	0
		7698	Wings Agility Enchant	n29100	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	WingAttrBoost	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Raise wing's agility by 1 upon usage. Can be improved to 300 attributes points at most.	0
		7699	Wings Spirit Enchant	n29097	10130005	0	0	0	0	0	0	86	0	0	0	0	0	1	0	0	1	99	0	10000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	WingAttrBoost	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Raise wing's spirit by 1 upon usage. Can be improved to 300 attributes points at most.	0
		7700	Red Wings	n1225	10130005	0	0	0	0	0	0	44	0	0	0	7	1	0	0	0	1	1	1	20000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,100	0,100	0,100	0,100	0,100	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	1000,1000	1000,1000	0	0	0	0	0	0	0	0	0	0	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	502,24	0,0	0,0	Red Wings. Place at 1st inventory slot to see effect	0
		7701	Yellow Wings	n1224	10130005	0	0	0	0	0	0	44	0	0	0	7	1	0	0	0	1	1	1	20000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,200	0,200	0,200	0,200	0,200	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	1000,1000	1000,1000	0	0	0	0	0	0	0	0	0	0	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	503,24	0,0	0,0	Yellow Wings. Place at 1st inventory slot to see effect	0
		7702	Blue Wings	n1223	10130005	0	0	0	0	0	0	44	0	0	0	7	1	0	0	0	1	1	1	20000	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,300	0,300	0,300	0,300	0,300	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	1000,1000	1000,1000	0	0	0	0	0	0	0	0	0	0	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	504,24	0,0	0,0	Blue Wings. Place at 1st inventory slot to see effect	0
	
	[Skilleff]:
		56	Wings	-1	0	State_Wings_Add	State_Wings_Rem	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	-1	0	0	0	0	-1	0	0
]]
print("* Loading WingEnchant.lua")

Wings							= {}
Wings.Conf						= {}
Wings.UpRate					= {}
Wings.ItemID					= {}
		
Wings.Conf.Slot					= 1								-- Inventory slot which  wing should be placed to have bonuses.
Wings.Conf.StateID				= 56							-- ID from skilleff.txt to apply state to character.
Wings.Conf.MaxLv				= 50000							-- Max level that wing can reach.
Wings.Conf.BlueID				= 7957							-- That to cap enchant when blue wing reach +300.

Wings.ItemID[141]				= {MaxLv = 50000, NewID = nil}
Wings.ItemID[142]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[904]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[905]				= {MaxLv = 50000, NewID = nil}
Wings.ItemID[935]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[936]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[937]				= {MaxLv = 50000, NewID = nil}
Wings.ItemID[7534]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7535]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7536]				= {MaxLv = 50000, NewID = nil}
Wings.ItemID[7537]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7538]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7539]				= {MaxLv = 50000, NewID = nil}
Wings.ItemID[7540]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7602]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7603]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7604]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7605]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7606]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7607]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7608]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7609]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7845]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7312]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7312]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7313]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7314]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7315]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7316]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7317]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7318]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7326]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7327]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7328]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7330]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7331]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7332]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7333]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7334]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7356]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7359]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7361]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7362]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7363]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7364]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7365]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7366]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7367]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7368]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7369]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7370]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7380]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7381]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7383]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7384]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7385]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7386]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7387]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7388]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7389]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7392]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7393]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7394]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7395]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7396]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7397]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7398]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7399]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7400]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7401]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7402]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7403]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7405]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7406]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7408]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7410]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7411]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7412]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7413]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7365]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7366]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7367]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7368]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7369]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7370]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7379]				= {MaxLv = 50000, NewID = nil}		
Wings.ItemID[7590]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7846]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7532]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7533]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7319]				= {MaxLv = 50000, NewID = nil}	
Wings.ItemID[7407]				= {MaxLv = 50000, NewID = nil}	


for i 							= 0, 50000 do						-- Lv1-300 Wings enchant rate.
	Wings.UpRate[i]				= .8								-- 100%.
end

Wings.Message					= {								-- Messages that will appear when using Enchant item.
	"\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \236\238\240\229!",
	"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229",
	"\194\237\243\242\240\229\237\237\255\255 \238\248\232\225\234\224.\209\238\238\225\249\232\242\229 \210\232\236\243\240\243!",
	"\207\238\236\229\241\242\232\242\229 \202\240\251\235\252\255 \226 1 \241\235\238\242 \232\237\226\229\237\242\224\240\255",
	"%s \243\230\229 \228\238\241\242\232\227\235\232 \236\224\234\241\232\236\224\235\252\237\238\233 \239\240\238\234\224\247\234\232!",
	"\202\240\251\235\252\255 %s \225\251\235\232 \243\235\243\247\248\229\237\251 \228\238 %s",
	"\205\229 \243\228\224\235\238\241\252 \243\228\224\235\232\242\252 \234\240\251\235\252\255",
	"\194\251 \243\235\243\247\248\232\235\232 %s",
	"\211\235\243\247\248\229\237\232\229 \237\229 \243\228\224\235\238\241\252...",
}

Wings.HasWing					= function(Player)
	local Slot					= GetChaItem(Player, 2, (Wings.Conf.Slot	-1))
	local SlotID					= GetItemID(Slot)
	if (Wings.ItemID[SlotID] ~= nil) then
		return 1
	end
	return 0
end

Wings.GetLv						= function(Wing)
	local STR 					= GetItemAttr(Wing, ITEMATTR_VAL_STR)
	local CON 					= GetItemAttr(Wing, ITEMATTR_VAL_CON)
	local AGI 					= GetItemAttr(Wing, ITEMATTR_VAL_AGI)
	local ACC 					= GetItemAttr(Wing, ITEMATTR_VAL_DEX)
	local SPR 					= GetItemAttr(Wing, ITEMATTR_VAL_STA)
	return (STR + CON + AGI + ACC + SPR)
end


WingsUnseal						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7955, 1, 90)
	PlayEffect(Player, 345)
end

Wingseben						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 141, 1, 90)
	PlayEffect(Player, 345)
end

Wingsrad						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 142, 1, 90)
	PlayEffect(Player, 345)
end

Wingsvamp						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 904, 1, 90)
	PlayEffect(Player, 345)
end

Wingsdrag						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 905, 1, 90)
	PlayEffect(Player, 345)
end

Wingself						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 935, 1, 90)
	PlayEffect(Player, 345)
end

Wingsbutter						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 936, 1, 90)
	PlayEffect(Player, 345)
end

Wingszayan						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 937, 1, 90)
	PlayEffect(Player, 345)
end


Wingszelbab						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7534, 1, 90)
	PlayEffect(Player, 345)
end

Wingslunbab						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7535, 1, 90)
	PlayEffect(Player, 345)
end

Wingssvvalen						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7536, 1, 90)
	PlayEffect(Player, 345)
end

Wingsastreb						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7537, 1, 90)
	PlayEffect(Player, 345)
end

Wingsfury						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7538, 1, 90)
	PlayEffect(Player, 345)
end


Wingssinbab						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7539, 1, 90)
	PlayEffect(Player, 345)
end


Wingsskrf						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7540, 1, 90)
	PlayEffect(Player, 345)
end


Wingsgolakd						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7602, 1, 90)
	PlayEffect(Player, 345)
end

Wingsredk						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7603, 1, 90)
	PlayEffect(Player, 345)
end

Wingsoranj						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7604, 1, 90)
	PlayEffect(Player, 345)
end

Wingsblack						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7605, 1, 90)
	PlayEffect(Player, 345)
end

Wingsizumr						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7606, 1, 90)
	PlayEffect(Player, 345)
end

Wingsfiol						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7607, 1, 90)
	PlayEffect(Player, 345)
end

Wingsyellow						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7608, 1, 90)
	PlayEffect(Player, 345)
end

Wingsdiavol						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7609, 1, 90)
	PlayEffect(Player, 345)
end

Wingsfobos						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7845, 1, 90)
	PlayEffect(Player, 345)
end

auraplam						= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 1) then
		SystemNotice(Player, Wings.Message[2])
		UseItemFailed(Player)
		return
	end
	GiveItem(Player, 0, 7312, 1, 90)
	PlayEffect(Player, 345)
end



WingAttrBoost					= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, Wings.Message[1])
		UseItemFailed(Player)
		return
	end
	local Injection				= {}
	Injection[7950]				= {AttrType = ITEMATTR_VAL_STR, AttrAdd = 1, AttrName = 'Strength'}			--Wings Strength Enchant
	Injection[7951]				= {AttrType = ITEMATTR_VAL_CON, AttrAdd = 1, AttrName = 'Constitution'}		--Wings Constitution Enchant
	Injection[7952]				= {AttrType = ITEMATTR_VAL_DEX, AttrAdd = 1, AttrName = 'Accuracy'}			--Wings Accuracy Enchant
	Injection[7953]				= {AttrType = ITEMATTR_VAL_AGI, AttrAdd = 1, AttrName = 'Agility'}			--Wings Agility Enchant
	Injection[7954]				= {AttrType = ITEMATTR_VAL_STA, AttrAdd = 1, AttrName = 'Spirit'}			--Wings Spirit Enchant
	local ItemId					= GetItemID(Item)
	if Injection[ItemId] == nil then
		SystemNotice(Player, Wings.Message[3])
		UseItemFailed(Player)
		return
	end
	local Slot					= GetChaItem(Player, 2, (Wings.Conf.Slot	-1))
	local SlotID					= GetItemID(Slot)
	local Name					= GetItemName(SlotID)
	if (Slot == nil) then
		SystemNotice(Player, Wings.Message[4])
		UseItemFailed(Player)
		return
	end
	if (Wings.ItemID[SlotID] == nil) then
		SystemNotice(Player, Wings.Message[4])
		UseItemFailed(Player)
		return
	end
	local WingLv					= Wings.GetLv(Slot)
	local upChance				= Percentage_Random(Wings.UpRate[WingLv])		
	local statAdd				= Injection[ItemId].AttrAdd
	local attrNum 				= GetItemAttr(Slot, Injection[ItemId].AttrType)
	local newLv					= WingLv + statAdd
	local TakeWing				= 0		
	if (SlotID == Wings.Conf.BlueID and WingLv == Wings.ItemID[SlotID].MaxLv) then
		SystemNotice(Player, string.format(Wings.Message[5], Name))
		UseItemFailed(Player)
		return
	end	
	if (upChance == 1) then
		if (SlotID ~= Wings.Conf.BlueID and newLv == Wings.ItemID[SlotID].MaxLv) then
			TakeWing			= RemoveChaItem(Player, SlotID, 1, 2, (Wings.Conf.Slot - 1), 2, 1)	
			r1,r2				= MakeItem(Player, Wings.ItemID[SlotID].NewID, 1, 90)
			local NewWing		= GetChaItem(Player, 2, r2)
			local NewName		= GetItemName(GetItemID(NewWing))
			SystemNotice(Player, string.format(Wings.Message[6], Name, NewName))
			PlayEffect(Player, 345)
			RefreshCha(Player)
			if (TakeWing == 0) then
				SystemNotice(Player, Wings.Message[7])
				UseItemFailed(Player)
				return
			end
		else
			attrNum				= attrNum + statAdd
			SetItemAttr(Slot, Injection[ItemId].AttrType, attrNum)
			SystemNotice(Player, string.format(Wings.Message[8], Name))
			PlayEffect(Player, 345)
			RefreshCha(Player)
		end
	else
		SystemNotice(Player, Wings.Message[9])
		PlayEffect(Player, 346)
	end
end

Wings.ApplyEffect				= function(Player)
	if (IsPlayer(Player) == 1) then
		local Slot				= GetChaItem(Player, 2, (Wings.Conf.Slot	-1))
		local SlotID				= GetItemID(Slot)
		if (Wings.HasWing(Player) == 1) then
			AddState(Player, Player, Wings.Conf.StateID, 1, 3600)
		else
			if (GetChaStateLv(Player, Wings.Conf.StateID) > 0) then
				RemoveState(Player, Wings.Conf.StateID)
			end
		end
	end
end

State_Wings_Add 				= function(Player, StateLv)
	local Slot					= GetChaItem(Player, 2, (Wings.Conf.Slot	-1))
	local wingStr 				= GetItemAttr(Slot, ITEMATTR_VAL_STR)
	local wingSta 				= GetItemAttr(Slot, ITEMATTR_VAL_STA)			
	local wingAgi 				= GetItemAttr(Slot, ITEMATTR_VAL_AGI)			
	local wingCon 				= GetItemAttr(Slot, ITEMATTR_VAL_CON)
	local wingDex 				= GetItemAttr(Slot, ITEMATTR_VAL_DEX)
	local strVal					= 0
	local sprVal					= 0
	local agiVal					= 0
	local conVal					= 0
	local accVal					= 0
	if (Wings.HasWing(Player) == 1) then
		strVal					= wingStr
		sprVal					= wingSta
		agiVal					= wingAgi
		conVal					= wingCon
		accVal					= wingDex
	end
	SetCharaStatev(strVal, Player, ATTR_STATEV_STR, "STATE_WING")
	SetCharaStatev(sprVal, Player, ATTR_STATEV_STA, "STATE_WING")
	SetCharaStatev(agiVal, Player, ATTR_STATEV_AGI, "STATE_WING")
	SetCharaStatev(conVal, Player, ATTR_STATEV_CON, "STATE_WING")
	SetCharaStatev(accVal, Player, ATTR_STATEV_DEX, "STATE_WING")			
	RefreshCha(Player)			
end
	
State_Wings_Rem 				= function(Player, StateLv)
	RemCharaStatev(0, Player, ATTR_STATEV_STR, "STATE_WING") 
	RemCharaStatev(0, Player, ATTR_STATEV_AGI, "STATE_WING") 
	RemCharaStatev(0, Player, ATTR_STATEV_DEX, "STATE_WING") 
	RemCharaStatev(0, Player, ATTR_STATEV_CON, "STATE_WING") 
	RemCharaStatev(0, Player, ATTR_STATEV_STA, "STATE_WING")
	RefreshCha(Player)		
end	