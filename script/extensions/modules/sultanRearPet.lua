--[[
** REAR PET SKILLS
** SULTAN
** IN-COMPLETED
]]--
print("Loading REAR PET SKILLS init.lua" )
--[[
Name: Spirit of Thunder
Type: Melee Users
1. Chance to Numb target and to slow him down.
2. Chance to double the received damage.
3. Chance to receive Mini Heals.

Name: Spirit of Light
Type: Magic Users
1. Chance to increase Spiritual Bolt damage by 5%.
2. Chance to stun target using Conch Ray for 2 seconds.
3. Chance to receive Auto Mini Heals if your hp below 70%.

Name: Spirit of Darkness
Type: Melee Users
1. Chance to Poison target to reduce defence & phy.resist.
2. Chance to unleash Black Hole (Increases 30% of your stats for 15 seconds).
3. Chance to receive Buff Curse (Removes opponents buffs and add it to you "if you don't have buffs on")
]]--

rearpet_timer_hook = cha_timer
cha_timer = function(role, freq, time)
rearpet_timer_hook(role,freq,time)
	if(IsPlayer(role) == 1)then
		Spirits(role,freq,time)
	end
end

telf_melee_hook = Skill_Melee_End
Skill_Melee_End = function(ATKER, DEFER, sklv)
	telf_melee_hook( ATKER , DEFER, sklv )
	telf_bonus( ATKER , DEFER )
end

telf_range_hook = Skill_Range_End
Skill_Range_End = function(ATKER, DEFER, sklv)
	telf_range_hook( ATKER , DEFER, sklv )
	telf_bonus( ATKER , DEFER )
end

lelf_bolt_hook = Skill_Xlcz_End
Skill_Xlcz_End = function(ATKER, DEFER, sklv)
	lelf_bolt_hook( ATKER , DEFER, sklv )
	lelf_bonus( ATKER , DEFER )
end

lelf_conch_hook = Skill_Bkcj_End
Skill_Bkcj_End = function(ATKER, DEFER, sklv)
	lelf_conch_hook( ATKER , DEFER, sklv )
	lelf_bonus( ATKER , DEFER )
end

delf_melee_hook = Skill_Melee_End
Skill_Melee_End = function(ATKER, DEFER, sklv)
	delf_melee_hook( ATKER , DEFER, sklv )
	delf_bonus( ATKER , DEFER )
end

delf_range_hook = Skill_Range_End
Skill_Range_End = function(ATKER, DEFER, sklv)
	delf_range_hook( ATKER , DEFER, sklv )
	delf_bonus( ATKER , DEFER )
end

-- --------------------
-- FUNCTIONS;
-- --------------------
function Spirits(role,freq,time)
	if(ThunderRear(role) == 1)then
		if(GetChaStateLv(role,STATE_TELF) < 1)then
		AddState(role, role, STATE_TELF, 1, 3600)
		RefreshCha(role)
		end
	end
	if(LightRear(role) == 1)then
		if(GetChaStateLv(role,STATE_LELF) < 1)then
		AddState(role, role, STATE_LELF, 1, 3600)
		RefreshCha(role)
		end
		local Percentage = Percentage_Random(0.4)
		if Percentage == 1 then
			local hp_percent = math.ceil( (Hp (role) / Mxhp (role)) * 100)
			if hp_percent < 80 then
				local hp_recover = - 1 * ( Hp(role) * 0.3 )
				Hp_Endure_Dmg ( role , hp_recover )
				SystemNotice(role, "Light Spirit Activated Auto Mini Heals.")
				PlayEffect(role,168)
			end
		end
	end
	if(DarknessRear(role) == 1)then
		if(GetChaStateLv(role,STATE_DELF) < 1)then
		AddState(role, role, STATE_DELF, 1, 3600)
		RefreshCha(role)
		end
	end
end

function ThunderRear(role)
local Rear = GetChaItem(role, 2, 5)
local Rear_id = GetItemID(Rear)
	if(Rear_id == 7734)then
		return 1
	else
		return 0
	end
end

function LightRear(role)
local Rear = GetChaItem(role, 2, 5)
local Rear_id = GetItemID(Rear)
	if(Rear_id == 7735)then
		return 1
	else
		return 0
	end
end

function DarknessRear(role)
local Rear = GetChaItem(role, 2, 5)
local Rear_id = GetItemID(Rear)
	if(Rear_id == 7736)then
		return 1
	else
		return 0
	end
end

-- --------------------
-- SKILLS;
-- --------------------
function telf_bonus(ATKER, DEFER)
	local RearAttacker = ThunderRear(ATKER)
	local RearDefender = ThunderRear(DEFER)
	if(RearAttacker == 1)then
		local Percentage = Percentage_Random(0.05)
		if(Percentage == 1)then
			i = math.random(1,20)
			if(i >= 1 and i <= 5)then
			AddState(ATKER, DEFER, STATE_MB, 7, 5)
			BickerNotice(ATKER, "Thunder Spirit Activated Lightning.")
			elseif(i >= 6 and i <= 10)then
			hpdmg = hpdmg * 2
			BickerNotice(ATKER, "Thunder Spirit Activated Double Damage.")
			PlayEffect(DEFER,270)
			Hp_Endure_Dmg(DEFER, hpdmg)
			end
		end	
	end
	if(RearDefender == 1)then
		local Percentage = Percentage_Random(0.1)
		if(Percentage == 1)then
		local hp_recover = - 1 * ( Hp(DEFER) * 0.04 )
		Hp_Endure_Dmg(DEFER, hp_recover)
		BickerNotice(DEFER, "Thunder Spirit Activated Mini Heals.")
		RefreshCha(DEFER)
		end
	end
end

function lelf_bonus(ATKER, DEFER)
	local RearAttacker = LightRear(ATKER)
	local RearDefender = LightRear(DEFER)
	if(RearAttacker == 1)then
		local Percentage = Percentage_Random(0.5)
		local Job = GetChaAttr(ATKER, ATTR_JOB)
		if(Job ~= 16)then
			if(Percentage == 1)then
				hpdmg = hpdmg * 0.5
				BickerNotice(ATKER, "Light Spirit Activated Extra Damage.")
				Hp_Endure_Dmg(DEFER, hpdmg)
			end
		else
			if(Percentage == 1)then
				AddState(ATKER, DEFER, STATE_XY, 1, 2)
				BickerNotice(ATKER, "Light Spirit Activated Stun for 2 Secs.")
			end
		end	
	end
end

function delf_bonus(ATKER, DEFER)
	local RearAttacker = DarknessRear(ATKER)
	local RearDefender = DarknessRear(DEFER)
	local AtkBuffState1 = GetChaStateLv (ATKER, STATE_XLZH)
	local AtkBuffState2 = GetChaStateLv (ATKER, STATE_SHPF)
	local AtkBuffState3 = GetChaStateLv (ATKER, STATE_MLCH)
	local AtkBuffState4 = GetChaStateLv (ATKER, STATE_FZLZ)
	local DefBuffState1 = GetChaStateLv (DEFER, STATE_XLZH)
	local DefBuffState2 = GetChaStateLv (DEFER, STATE_SHPF)
	local DefBuffState3 = GetChaStateLv (DEFER, STATE_MLCH)
	local DefBuffState4 = GetChaStateLv (DEFER, STATE_FZLZ)
	if(RearAttacker == 1)then
		local Percentage = Percentage_Random(0.05)
		if(Percentage == 1)then
			i = math.random(1,40)
			if(i >= 1 and i <= 5)then
			AddState(ATKER, DEFER, STATE_PJ, 4, 10)
			BickerNotice(ATKER, "Darkness Spirit Activated Poison.")
			elseif(i >= 6 and i <= 10)then
			AddState(ATKER, ATKER, STATE_CZZX, 1, 15)
			BickerNotice(ATKER, "Darkness Spirit Activated Black Hole.")
			PlayEffect(ATKER,394)
			elseif(i >= 11 and i <= 30)then
				if(DefBuffState1 > 0 or DefBuffState2 > 0 or DefBuffState3 > 0 or DefBuffState4 > 0)then
					BickerNotice(ATKER, "Darkness Spirit Activated Buff Curse.")
					RemoveState(DEFER,STATE_XLZH)
					RemoveState(DEFER,STATE_SHPF)
					RemoveState(DEFER,STATE_MLCH)
					RemoveState(DEFER,STATE_FZLZ)
					RefreshCha(DEFER)
					if(AtkBuffState1 < 1 or AtkBuffState2 < 1 or AtkBuffState3 < 1 or AtkBuffState4 < 1)then
					AddState(ATKER, ATKER, STATE_XLZH, 10, 120)
					AddState(ATKER, ATKER, STATE_SHPF, 10, 120)
					AddState(ATKER, ATKER, STATE_MLCH, 10, 120)
					AddState(ATKER, ATKER, STATE_FZLZ, 10, 120)
					RefreshCha(ATKER)
					end
				end
			end
		end	
	end
end
