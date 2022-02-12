print( "        * Loading Monster Pet Teleport Hooks" )

 
function pet_timer(ignore,host,freq,time)
if(monsterPet[host] ~= nil)then
	local Pet = monsterPet[host]
	local playermap = GetChaMapName(host)
	local petmap = GetChaMapName(Pet)
	local now_tick = GetChaParam(host, 1) 
	if petmap ~= playermap then
		if math.mod(now_tick, 0.5) == 0 and now_tick > 0 then 
		ReCreatePet(host,Pet)
		end
			else
		local distance_to_master = get_distance(Pet, host)
		if distance_to_master > 2000 then
			local cha_map = GetChaMapName(host)
			local hx, hy = GetChaPos(host)
			GoTo(Pet,(math.floor(hx/100) + 2),(math.floor(hy/100) + 2),cha_map)
		end
	end
	if monsterPet[host] ~= nil then
		if(Hp(monsterPet[host]) <= 0)then
		monsterPet[host] = nil
		end
	end
end	
end
Hook:AddPostHook("cha_timer", pet_timer)

