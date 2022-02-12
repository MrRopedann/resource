--[[
							*###########################################################################*
							#                        -Glow Effects NPC by 7n6.-                         #
							#       If used please give credit or I will break your server Kappa.       #
							#                  (But seriously don't remove credits...)                  #
							*###########################################################################*


*******************************************************************************************************************************	
###############################################################################################################################
*******************************************************************************************************************************	

	Installation:
		1) Ensure you have hook.lua loaded
		2) Load this file with DoFile
		
		Please note: ALL STATES that are to be added must NOT have the ALLExAttrSet(role) or AttrRecheck(role) lines, as this would cause an overflow error.
		
	Configuration:
		All sets of equips that add states are stored in the GlowEffects.Effects table.
		To add a new set, add a new entry in the table, for example: 

			{
				State = STATE_BBRING1,
				Fusable = false,
				AllowApparelGlow = false,
				SpecialCheck = nil,
				Kylin = false,
				BlackDragon = false,
				Death = true,
				Chaos = false,
				ItemID = nil,
				Slot = nil,
				Equips = {
					Head = nil ,
					Armour = {2817},
					Boots = nil,
					Gloves = nil,
					LeftHand = nil,
					RightHand = nil,
					LeftRing = nil,
					RightRing = {2577},
					Necklace = nil,
				},
			},
		
		This means that when you have 2817 (SS death torso) or 825 (Kylin armour) equipped as your armour, and 2577 (Hell feather) as your right ring,
		you are given the STATE_BBRING1 state (green glow + stats).
		
		Fusable = false, means that you do NOT get the effect is the equipment is fused.
		AllowApparelGlow = false, means that you do NOT get the effect if the equipment is being used as an apparel.
		SpecialCheck = nil, means no special checks are being done. If you specify a function here, that function must return true to allow the state to be added, eg:
			if we set SpecialCheck = AllowGlow then made this function:
			
				function AllowGlow(role)
					if GetChaDefaultName(role) == "admin" then
						return true
					else
						return false
					end
				end
				
			Only admin would get that glow.
		Kylin = false, BlackDragon = false,Death = true, Chaos = false, These means that this set doesnt grant BD/Kylin/chaos effects, but does grant death (exp loss reduction)
		The Equips table is used to declare which equips are needed in which slots. If multiple equips are specified in one slot, the player must have one of them equipped.
		
		You can also specify an effect with no state by using "State = nil", this can be useful to add kylin effect, but no state, to a set.
		
		ItemID = nil,
		Slot = nil,
		
		Specifys an item that has to be in a slot for effect to work.
		
*******************************************************************************************************************************	
###############################################################################################################################
*******************************************************************************************************************************	
]]
print(" Loading <GlowEffect> init.lua" )
--Glow Effects Object
GlowEffects = {}
--Table containing set glows
GlowEffects.Effects = {
	{
		State = nil,
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = false,
		Chaos = true,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = nil ,
			Armour = {1124},
			Gloves = {1125},
			Boots = {1126},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = nil,
			RightRing = nil,
			Necklace = nil,
		},
	},
	
	{
		State = STATE_BBRING1,--100сет
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3611},
			Armour = {3598},
			Gloves = {3599},
			Boots = {3600},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3603},
			RightRing = {3603},
			Necklace = {3604},
		},
	},
	
	{
		State = STATE_BBRING3,--200сет
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3000},
			Armour = {2997},
			Gloves = {2998},
			Boots = {2999},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3667,7335},
		    RightRing = {3667,7335},
		    Necklace = {3668,7336},
		},
	},

	{
		State = STATE_BBRING4, --400 сет
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3615},
			Armour = {3612},
			Gloves = {3613},
			Boots = {3614},
			Necklace = {3670,7678},
			LeftHand = nil,
			LeftRing = {3669,7677},
			RightRing = {3669,7677},
			RightHand = nil,
		},
	},
	
	{
		State = STATE_BBRING6,--600 сет
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3628},
			Armour = {3632},
			Gloves = {3633},
			Boots = {3634},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3630},
			RightRing = {3630},
			Necklace = {3631},
		},
	},
	
	{
		State = STATE_BBRING5,--800
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3643},
			Armour = {3647},
			Gloves = {3648},
			Boots = {3649},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3645},
			RightRing = {3645},
			Necklace = {3646},
		},
	},
	
	{
		State = STATE_BBRING2,--1000
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3658},
			Armour = {3662},
			Gloves = {3663},
			Boots = {3664},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3660},
			RightRing = {3660},
			Necklace = {3666},
		},
	},
	
	{
		State = nil,--1200
		Fusable = true,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = false,
		Death = true,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = {3591},
			Armour = {3594},
			Gloves = {3595},
			Boots = {3596},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = {3593},
			RightRing = {3593},
			Necklace = {3597},
		},
	},
	
	{
		State = STATE_CORPEFFECT,
		Fusable = false,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = true,
		BlackDragon = false,
		Death = false,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = nil,
			Armour = {2549},
			Gloves = {2550},
			Boots = {2551},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = nil,
			RightRing = nil,
			Necklace =nil,
		},
	},
	
	{
		State = nil,
		Fusable = false,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = true,
		BlackDragon = false,
		Death = false,
		Chaos = false,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = nil,
			Armour = {825,2549},
			Gloves = {826,2550},
			Boots = {827,2551},
			LeftHand = nil,
			RightHand = nil,
			LeftRing = nil,
			RightRing = nil,
			Necklace =nil,
		},
	},
	
	{
		State = nil,
		Fusable = false,
		AllowApparelGlow = false,
		SpecialCheck = nil,
		Kylin = false,
		BlackDragon = true,
		Death = true,
		Chaos = true,
		ItemID = nil,
		Slot = nil,
		Equips = {
			Head = nil,
			Armour = nil,
			Gloves = nil,
			Boots = nil,
			LeftHand = nil,
			RightHand = nil,
			LeftRing = nil,
			RightRing = nil,
			Necklace =nil,
		},
	},
	
	-- {
		-- State = 234,
		-- Fusable = false,
		-- AllowApparelGlow = false,
		-- SpecialCheck = VIP.CheckVIP,
		-- Kylin = false,
		-- BlackDragon = true,
		-- Death = false,
		-- Chaos = false,
		-- ItemID = nil,
		-- Slot = nil,
		-- Equips = {
			-- Head = nil,
			-- Armour = nil,
			-- Gloves = nil,
			-- Boots = nil,
			-- LeftHand = nil,
			-- RightHand = nil,
			-- LeftRing = nil,
			-- RightRing = nil,
			-- Necklace =nil,
		-- },
	-- },
}


--*******************************************************************************************************************************--	
--###############################################################################################################################--
--*******************************************************************************************************************************--	

-- function AllowGlow(role)
		-- local statelv = 1
		-- local statetime = 3600
		-- if GetChaDefaultName(role) =="Jasper" then
		-- elseif GetChaDefaultName(role) =="\210\232\236\243\240" then
		-- AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		-- AddState( role , role , STATE_SBBLGZ , statelv , statetime )
						-- return true
					-- else
						-- return false
					-- end
				-- end
				
--function to iterate through the table and check each glow
function GlowEffects.CheckGlows(role)
	local States = {}
	for i,v in pairs(GlowEffects.Effects) do
		if v.State ~= nil then
			if GlowEffects.CheckGlow(role,i) == true then
				AddState(role,role,v.State,1,0)
				States[v.State] = true
			end
		end
	end
	GlowEffects.RemoveGlows(role,States)
end

--function to check if the player meets the requirements for a glow.
function GlowEffects.CheckGlow(role,ID)
	local Equips = GlowEffects.GetEquips(role)
	local FusedEquips = GlowEffects.GetFusedEquips(role)
	if GlowEffects.Effects[ID].SpecialCheck ~= nil then
		if GlowEffects.Effects[ID].SpecialCheck(role) == false then
			return false
		end
	end
	if (GlowEffects.Effects[ID].Slot ~= nil and GetItemID(GetChaItem ( role , 2 , GlowEffects.Effects[ID].Slot)) ~= GlowEffects.Effects[ID].ItemID ) then
		return false
	end
	for i,v in pairs(GlowEffects.Effects[ID].Equips) do
		if (GlowEffects.InArray (v , Equips[i]) == false or (FusedEquips[i] ~= 0 and GlowEffects.Effects[ID].AllowApparelGlow == false)) 
		and (GlowEffects.Effects[ID].Fusable == false or GlowEffects.InArray (v , FusedEquips[i]) == false) then
			return false
		end
	end
	return true
end

--function to remove all glows that the user does not meet the requirements for.
function GlowEffects.RemoveGlows(role,States)
	for i,v in pairs(GlowEffects.Effects) do
		if GetChaStateLv ( role , v.State) > 0 and States[v.State] ~= true then
			RemoveState ( role ,  v.State )
		end
	end
end

--function to check if a data item is within an array
function GlowEffects.InArray(array,str)
	for i,v in pairs(array) do
		if v == str then
			return true
		end
	end
	return false
end

--returns a table of user equips
function  GlowEffects.GetEquips(role)
	return {
		Head = GetItemID(GetEquipItemP(role,0)),
		Armour = GetItemID(GetEquipItemP(role, 2)),
		Gloves = GetItemID(GetEquipItemP(role,3)),
		Boots = GetItemID(GetEquipItemP(role,4)),
		Necklace = GetItemID(GetEquipItemP(role,5)),
		LeftHand = GetItemID(GetEquipItemP(role,6)),
		LeftRing = GetItemID(GetEquipItemP(role,7)),
		RightRing = GetItemID(GetEquipItemP(role,8)),
		RightHand = GetItemID(GetEquipItemP(role,9)),
	}
end

--returns a table of user equips fusion IDs
function GlowEffects.GetFusedEquips(role)
	return {
		Head = GlowEffects.VerifyApparel(role, 0),
		Armour = GlowEffects.VerifyApparel(role, 2),
		Gloves = GlowEffects.VerifyApparel(role, 3),
		Boots = GlowEffects.VerifyApparel(role, 4),
		Necklace = GlowEffects.VerifyApparel(role, 5),
		LeftHand = GlowEffects.VerifyApparel(role, 6),
		LeftRing = GlowEffects.VerifyApparel(role, 7),
		RightRing = GlowEffects.VerifyApparel(role, 8),
		RightHand = GlowEffects.VerifyApparel(role, 9),
	}
end

--verifys if a slot is empty
function GlowEffects.VerifyApparel(role, slot)
	if GetItemID(GetEquipItemP(role,slot)) == 0 then
		return 0
	else
		return GetItemAttr(GetEquipItemP(role,slot), ITEMATTR_VAL_FUSIONID)
	end
end
--function called to check for kylin effect
function GlowEffects.CheckKylin ( role )
	return GlowEffects.CheckEffect(role,"Kylin")
end
--function called to check for BD effect
function GlowEffects.CheckBlackDragon ( role )
	return GlowEffects.CheckEffect(role,"BlackDragon")
end
--function called to check for Death effect
function GlowEffects.CheckDeath ( role )
	return GlowEffects.CheckEffect(role,"Death")
end
--function called to check for Chaos effect
function GlowEffects.CheckChaos ( role )
	return GlowEffects.CheckEffect(role,"Chaos")
end
--iterates through table to check effects
function GlowEffects.CheckEffect(role,effect)
	for i,v in pairs(GlowEffects.Effects) do
		if v[effect] == true then
			if GlowEffects.CheckGlow(role,i) == true then
				return 1
			end
		end
	end
	return 0
end

--Hooked on taking damage
function GlowEffects.CheckGlows2(role,num)
	if Is_NormalMonster ( role ) ~= 1 then
		GlowEffects.CheckGlows(role)
	end
end
--Hooks
Hook:AddPreHook("Hp_Endure_Dmg",GlowEffects.CheckGlows2) --Hook on taking damage to check states, not needed if you do not have effects that need a stone.
Hook:AddPreHook("AttrRecheck",GlowEffects.CheckGlows) --Hook on updating stats to check states
Hook:AddReplacementHook("CheckItem_Nianshou",GlowEffects.CheckKylin) --Hook to check kylin set
Hook:AddReplacementHook("CheckItem_Heilong",GlowEffects.CheckBlackDragon) --Hook to check BD set
Hook:AddReplacementHook("CheckItem_Death",GlowEffects.CheckDeath) --Hook to check Death set
Hook:AddReplacementHook("CheckItem_fighting",GlowEffects.CheckChaos) --Hook to check Chaos set


