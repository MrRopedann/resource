-- ***********************************
-- Sample AI handling system
-- By Matt @serverdev.net
-- ***********************************
local PLUGIN_NAME = "[[CUSTOM AI]]"
local PLUGIN_VERSION = "0.3"
local PLUGIN_AUTHOR = "Matt {http://serverdev.net}"

-- --------------------------
-- Display loading message on startup
-- --------------------------
print(">> Loading plugin "..PLUGIN_NAME.."(V"..PLUGIN_VERSION..") from "..PLUGIN_AUTHOR)

-- --------------------------
-- Load re-usable functions
-- --------------------------
dofile(GetResPath("script/extensions/custom_ai/lib.lua"))

-- --------------------------
-- Define the custom AI types
-- --------------------------
AI_CUSTOM_HANDLERS = {}

-- --------------------------
-- AI_PET
-- --------------------------
dofile(GetResPath("script/extensions/custom_ai/AI_PET.lua"))
AI_PET = 12

AI_CUSTOM_HANDLERS[AI_PET] = {}
AI_CUSTOM_HANDLERS[AI_PET]["has_target"] = AI_PET_has_target
AI_CUSTOM_HANDLERS[AI_PET]["no_target"] = AI_PET_no_target
AI_CUSTOM_HANDLERS[AI_PET]["tick"] = AI_PET_tick


-- --------------------------
-- Hook  the default AI loop
-- to plug our custom processing
-- --------------------------
print( "        * Activating ai_loop hook" )
if (ai_loop == nil) then
	print( "                => Hooking failed, ai_loop is not yet defined" )
end


ai_loop_original = ai_loop
ai_loop = function (monster)
	-- Retrive monster s AI type
	local ai_type = GetChaAIType(monster)
	-- Check if the AI Type is a custom one
	if (AI_CUSTOM_HANDLERS[ai_type] == nil) then
		-- call the original AI handler
		ai_loop_original(monster)
	else
		-- handle custom AI
		ai_custom_loop(monster, ai_type)
	end
end
-- --------------------------
-- AI LOOP.
-- This AI loop handler is called every tick by the server
-- for monsters having a custom AI.
-- It delegates "Wisdom" to function dedicated to one customized
-- AI and corresponding to one of the following status of the monster:
--      * Monster is currently having an assigned target
--      * Monster is currently having no assigned target
-- Additionnaly, each loop triggers a call to the dedicated "tick" function.
-- --------------------------
function ai_custom_loop(monster, ai_type)
	-- Retrieve monster current target
	local target = GetChaTarget(monster) --取出当前角色的目标
	if target ~= nil then
		-- Monster has a target, call the dedicated handler if it is defined
		if (AI_CUSTOM_HANDLERS[ai_type]["has_target"] ~= nil) then
			local skill_id = select_skill(monster)
			ChaUseSkill(monster, target, skill_id)
			AI_CUSTOM_HANDLERS[ai_type]["has_target"](monster,target)
		end
	else
		-- Monster has not target, call the dedicated handler if it is defined
		if (AI_CUSTOM_HANDLERS[ai_type]["no_target"] ~= nil) then
			AI_CUSTOM_HANDLERS[ai_type]["no_target"](monster)
		end
	end
	-- Trigger Tick dedicated handler if it is defined
	if (AI_CUSTOM_HANDLERS[ai_type]["tick"] ~= nil) then
		AI_CUSTOM_HANDLERS[ai_type]["tick"](monster)
	end
end

-- ***********************************
-- "is_friend"
-- ***********************************
is_friend_original = is_friend
is_friend = function (cha1 , cha2)
    local type1 = GetChaAIType(cha1)
    local type2 = GetChaAIType(cha2)
	local chaName = GetChaDefaultName(cha2)
    if (type1 == AI_PET or type2 == AI_PET ) then
        return isFriendly(cha1,cha2)
    else
        return is_friend_original(cha1 , cha2  )
    end
end
 
monsterPet = {}
function SpawnMonsterPet(cha,id)
	local x, y = GetChaPos( cha )
	local MonsterID =  1135
	local chaName = GetChaDefaultName(cha)
	local Refresh = 50					--重生时间，秒单位
	local life = 400000000					--生命时间，毫秒单位
	local new = CreateCha( MonsterID , x , y , 145 , Refresh )
	SetChaLifeTime( new, life )
	SetChaAIType( new , AI_PET )
	SetChaHost( new , cha )
	monsterPet[cha] = new
end


function UseAnySkill(ATKER,DEFER,sklv)
	if(monsterPet[ATKER] ~= nil)then
		SetChaTarget(monsterPet[ATKER],DEFER)
	end
	if(monsterPet[DEFER] ~= nil)then
		SetChaTarget(monsterPet[DEFER],ATKER)
	end
end
	Hook:SetHookPattern("(Skill_%a+_End)", "PRE", UseAnySkill)
	Check_Baoliao_orginal = Check_Baoliao
	Check_Baoliao = function(atker,defer,...)
		if(GetChaHost(defer) ~= nil)then
		return
		else
		Check_Baoliao_orginal(atker,defer,unpack(arg))
		end
	end
