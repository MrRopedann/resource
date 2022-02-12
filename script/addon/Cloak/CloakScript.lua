print("* Loading Cloak" )
--********************************************************************************************************************************--   
--##################################################Configurations################################################################--
--********************************************************************************************************************************--  
--7681 
    Cloak                           = {}
        Cloak.conf                  = {
            cloakId                 = 7469,
            dustyId                 = 7528,
            cloakSlot               = 5,
            maxLv                   = 10,
        }
        Cloak.race                  = {
            [1]                     = 234,
            [2]                     = 235,
            [3]                     = 236,
            [4]                     = 237
        }
        Cloak.eff01                 = {
            [1]                     = 75,
            [2]                     = 76,
            [3]                     = 77,
            [4]                     = 78
        }
        Cloak.eff02                 = {
            [1]                     = 80,
            [2]                     = 82,
            [3]                     = 84,
            [4]                     = 190
        }  
        Cloak.eff03                 = {
		
            [1]                     = 210,
            [2]                     = 211,
            [3]                     = 212,
            [4]                     = 213
        }  
		
        Cloak.upRate                = {}
        Cloak.upRate[0]             = .9
        Cloak.upRate[1.1]             = .9
        Cloak.upRate[1.2]             = .9
        Cloak.upRate[1.3]             = .9
        Cloak.upRate[1.4]             = .9
        Cloak.upRate[1.5]             = .9
		Cloak.upRate[1.6]             = .9
        
--********************************************************************************************************************************--
--##################################################Functions#####################################################################--
--********************************************************************************************************************************--
function Cloak.hasCloak(Player)
    local slot                  = GetChaItem(Player, 2, (Cloak.conf['cloakSlot'] -1))
    local slotId                = GetItemID(slot)
    if slotId == Cloak.conf['cloakId'] then
        return 1
    end
    return 0
end

function Cloak.getLv(Cloak)
    local cloakLv               = GetItemAttr(Cloak, 55)
    if cloakLv == nil then
        return 0
    else
        return cloakLv
    end
end
   
function PIO_CloakUnseal(Player, Item)
    local Cha_Boat              = 0
    Cha_Boat                    = GetCtrlBoat(Player)
    if Cha_Boat ~= nil then
        SystemNotice(Player, 'Cannot use while sailing!')
        UseItemFailed(Player)
        return
    end
    local hasDusty              = CheckBagItem(Player, Cloak.conf['dustyId'])
    if hasDusty < 50 then
        BickerNotice(Player, '\194\224\236 \237\243\230\237\238 ['..GetItemName(Cloak.conf['dustyId'])..'] 50 \248\242\243\234!')
        UseItemFailed(Player)
        return
    else
        TakeItem(Player, 0, Cloak.conf['dustyId'], 50)
        GiveItem(Player, 0, Cloak.conf['cloakId'], 1, 88)
        Notice(GetChaDefaultName(Player)..' \243\241\239\229\248\237\238 \241\248\232\235 \207\235\224\249 \192\228\236\232\240\224\235\224 ')
        PlayEffect(Player, 345)
    end
end
   
function PIO_CloakInjection(Player, Item)
    local Cha_Boat              = 0
    Cha_Boat                    = GetCtrlBoat(Player)
    if Cha_Boat ~= nil then
        SystemNotice(Player, 'Cannot use while sailing!')
        UseItemFailed(Player)
        return
    end
    local Injection             = {}
    Injection[7705]             = {AttrType = ITEMATTR_VAL_STR, AttrAdd = 1, AttrMax = 5, AttrName = 'Strength'}        --Cloak Strength Injection
    Injection[7707]             = {AttrType = ITEMATTR_VAL_CON, AttrAdd = 1, AttrMax = 5, AttrName = 'Constitution'}    --Cloak Constitution Injection
    Injection[7708]             = {AttrType = ITEMATTR_VAL_DEX, AttrAdd = 1, AttrMax = 5, AttrName = 'Accuracy'}        --Cloak Accuracy Injection
    Injection[7706]             = {AttrType = ITEMATTR_VAL_AGI, AttrAdd = 1, AttrMax = 5, AttrName = 'Agility'}         --Cloak Agility Injection
    Injection[7709]             = {AttrType = ITEMATTR_VAL_STA, AttrAdd = 1, AttrMax = 5, AttrName = 'Spirit'} 
	Injection[7710]             = {AttrType = ITEMATTR_VAL_STR, AttrAdd = 2, AttrMax = 5, AttrName = 'Strength'}        --Cloak Strength Injection
    Injection[7712]             = {AttrType = ITEMATTR_VAL_CON, AttrAdd = 2, AttrMax = 5, AttrName = 'Constitution'}    --Cloak Constitution Injection
    Injection[7713]             = {AttrType = ITEMATTR_VAL_DEX, AttrAdd = 2, AttrMax = 5, AttrName = 'Accuracy'}        --Cloak Accuracy Injection
    Injection[7711]             = {AttrType = ITEMATTR_VAL_AGI, AttrAdd = 2, AttrMax = 5, AttrName = 'Agility'}         --Cloak Agility Injection
    Injection[7714]             = {AttrType = ITEMATTR_VAL_STA, AttrAdd = 2, AttrMax = 5, AttrName = 'Spirit'}  
	Injection[7715]             = {AttrType = ITEMATTR_VAL_STR, AttrAdd = 3, AttrMax = 5, AttrName = 'Strength'}        --Cloak Strength Injection
    Injection[7717]             = {AttrType = ITEMATTR_VAL_CON, AttrAdd = 3, AttrMax = 5, AttrName = 'Constitution'}    --Cloak Constitution Injection
    Injection[7718]             = {AttrType = ITEMATTR_VAL_DEX, AttrAdd = 3, AttrMax = 5, AttrName = 'Accuracy'}        --Cloak Accuracy Injection
    Injection[7716]             = {AttrType = ITEMATTR_VAL_AGI, AttrAdd = 3, AttrMax = 5, AttrName = 'Agility'}         --Cloak Agility Injection
    Injection[7719]             = {AttrType = ITEMATTR_VAL_STA, AttrAdd = 3, AttrMax = 5, AttrName = 'Spirit'}   			--Cloak Spirit Injection
    local ItemId                = GetItemID(Item)
    if Injection[ItemId] == nil then
        SystemNotice(Player, 'Internal error!')
        UseItemFailed(Player)
        return
    end
    local slot                  = GetChaItem(Player, 2, (Cloak.conf['cloakSlot'] -1))
    local slotId                = GetItemID(slot)
    local cloakLv               = Cloak.getLv(slot)
    if slot == nil then
        BickerNotice(Player, 'Поместите Плащ Адмирала в 5 слот инвентаря ')
        UseItemFailed(Player)
        return
    end
    if slotId ~= Cloak.conf['cloakId'] then
        BickerNotice(Player, GetItemName(Cloak.conf['cloakId'])..' должен находится в 5 слоте инвентаря ')
        UseItemFailed(Player)
        return
    end
    if cloakLv >= Cloak.conf['maxLv'] then
        BickerNotice(Player, GetItemName(Cloak.conf['cloakId'])..' arealdy maxed attributes!')
        UseItemFailed(Player)
        return
    end
    local upChance              = Percentage_Random(Cloak.upRate[cloakLv])     
    local statAdd               = Injection[ItemId].AttrAdd
    local attrNum               = GetItemAttr(slot, Injection[ItemId].AttrType)
	--Берем статы плаща
		local cloakStr          = GetItemAttr(slot, ITEMATTR_VAL_STR)
        local cloakSta          = GetItemAttr(slot, ITEMATTR_VAL_STA)          
        local cloakAgi          = GetItemAttr(slot, ITEMATTR_VAL_AGI)          
        local cloakCon          = GetItemAttr(slot, ITEMATTR_VAL_CON)
        local cloakDex          = GetItemAttr(slot, ITEMATTR_VAL_DEX)
	--Берем их сумму
		local sum_attr = cloakStr + cloakSta + cloakAgi + cloakCon + cloakDex
		if sum_attr < 400 then
			if upChance == 1 then
				cloakLv = cloakLv
				attrNum                 = attrNum + statAdd
				SetItemAttr(slot, Injection[ItemId].AttrType, attrNum)
				SetItemAttr(slot, 55, cloakLv)
				SystemNotice(Player, 'У плаща -  '..sum_attr..' уровень! ' )
				PlayEffect(Player, 829)
				RefreshCha(Player)
			else
				SystemNotice(Player, 'Улучшение не удалось.. ')
				PlayEffect(Player, 346)
			end
		else
		HelpInfo( Player, 0, "Плащ достиг максимального уровня! ")
	end
end
   
function State_AC_Add(Player, StateLv)
	if (IsPlayer(Player) == 1) then
		local slot				= GetChaItem(Player, 2, (Cloak.conf['cloakSlot'] -1))
		local cloakStr 			= GetItemAttr(slot, ITEMATTR_VAL_STR)
		local cloakSta 			= GetItemAttr(slot, ITEMATTR_VAL_STA)			
		local cloakAgi 			= GetItemAttr(slot, ITEMATTR_VAL_AGI)			
		local cloakCon 			= GetItemAttr(slot, ITEMATTR_VAL_CON)
		local cloakDex 			= GetItemAttr(slot, ITEMATTR_VAL_DEX)
		local strVal			= 0
		local sprVal			= 0
		local agiVal			= 0
		local conVal			= 0
		local accVal			= 0
		if Cloak.hasCloak(Player) == 1 then
			strVal				= cloakStr
			sprVal				= cloakSta
			agiVal				= cloakAgi
			conVal				= cloakCon
			accVal				= cloakDex
		end
		SetCharaStatev(strVal, Player, ATTR_STATEV_STR, "STATE_AC")
		SetCharaStatev(sprVal, Player, ATTR_STATEV_STA, "STATE_AC")
		SetCharaStatev(agiVal, Player, ATTR_STATEV_AGI, "STATE_AC")
		SetCharaStatev(conVal, Player, ATTR_STATEV_CON, "STATE_AC")
		SetCharaStatev(accVal, Player, ATTR_STATEV_DEX, "STATE_AC")			
		RefreshCha(Player)			
	end
end

function State_AC_Rem(Player, StateLv)
	RemCharaStatev(0 , Player , ATTR_STATEV_STR , "STATE_AC") 
	RemCharaStatev(0 , Player , ATTR_STATEV_AGI , "STATE_AC") 
	RemCharaStatev(0 , Player , ATTR_STATEV_DEX , "STATE_AC") 
	RemCharaStatev(0 , Player , ATTR_STATEV_CON , "STATE_AC") 
	RemCharaStatev(0 , Player , ATTR_STATEV_STA , "STATE_AC")
	RefreshCha(Player)	 
end
	
--Проверка на слот для cha_timer
Cloak.ApplyEffect				= function(role)
	if (IsPlayer(role) == 1) then
		local slot                  = GetChaItem(role, 2, (Cloak.conf['cloakSlot'] -1))
        local cloakLv               = Cloak.getLv(slot)
        local chaType               = GetChaTypeID(role)
        local capeEff               = Cloak.race[chaType]
		if (Cloak.hasCloak(role) == 1) then
			AddState(role, role, capeEff, 1, 3600)
		else
			if (GetChaStateLv(role, Cloak.conf.StateID) > 0) then
				RemoveState(role, capeEff)
			end
		end
	end
end