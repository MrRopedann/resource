-- --------------------------
-- AI DEDICATED TO "AI_PET"
-- --------------------------
-- AI_PET Mod is a sample of what can be done.
-- The base idea will be that the summoned pet is
-- not aggressive toward owner. Whenever it has nothing to
-- do, it will attempt to follow its master.
-- Othervise, it will try to attack the master s target.

-- -----------------------
-- Unfinished stuffs:-
-- * Monster dies when master logout.
-- * Monster teleport when master is in another map.
-- * Monster walk in safe zone.
-- -----------------------

-- **************************************
-- This script was edited by YellowFlash.
-- The pet will teleport to the master when he's away.
-- The pet will attack other monster's near.
-- The pet can buff the master.
-- You cannot release it anywhere.
-- This credits stays here.
-- **************************************


print( "        * Loading AI_PET functions" )



-- This is what happen when a pet has a target
function AI_PET_has_target(monster, target)
	-- If target is friendly, change target. Othervise, attack it !
	local master = GetChaHost(monster)
	local skill_id = select_skill(monster)
	-- If target is friendly, change target. Othervise, attack it !
	if (isFriendly(monster, target) == true) then
		clear_target(monster)
	else
		ChaUseSkill(monster, target, skill_id)
	end
	local distance_to_master = get_distance(monster, master)
	if distance_to_master > 800 then
	local hx, hy = GetChaPos(master)
	local rx = 200 - Rand(400)
	local ry = 200 - Rand(400)
	flee(monster,target)
	clear_target(monster)
	ChaMove(monster, hx + rx, hy + ry)
	end
end


-- This is what happen when a pet has no target
function AI_PET_no_target(monster)
	local master = GetChaHost(monster)
	-- No target and no master, switch to aggressive mode
	if (master == nil) then
		SetChaAIType(monster, AI_ATK)
		return
	end
	-- Nothing todo Go to our Master
	local distance_to_master = get_distance(monster, master)
	if distance_to_master > 400 then
		local hx, hy = GetChaPos(master)
		local rx = 200 - Rand(400)
		local ry = 200 - Rand(400)
		ChaMove(monster, hx + rx, hy + ry)
		-- Lets make our Pet talk a bit
				local Rad = math.random(1,30)
				if Rad == 1 then
				Say(monster,"\207\238\227\238\228\232 \210\232\236\247\232\234 \255 \241 \242\238\225\238\233 ")
				elseif Rad == 2 then
				Say(monster,"\223 \235\254\225\235\254 \242\238\235\252\234\238 \241\226\238\229\227\238 \245\238\231\255\232\237\224 "..GetChaDefaultName(master).."! ")
				elseif Rad == 3 then
				Say(monster,"\202\238\236\243 \235\254\235\229\233 \237\224\226\229\248\224\242\252? ")
			end
		end
	end



-- This is what happen everytime
function AI_PET_tick(monster)
	local master = GetChaHost(monster)
	local name = GetChaDefaultName(master)
	if(monsterPet[master] == nil)then
		monsterPet[master] = monster
	end
end

