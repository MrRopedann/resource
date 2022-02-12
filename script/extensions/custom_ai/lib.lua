-- ***********************************
-- Sample AI handling system 
-- By Matt @serverdev.net
-- ***********************************

-- --------------------------
-- Set of functions which might be useful to all AI
-- But does not exists in standard
-- --------------------------

print( "        * Loading Lib functions" )


-- Return true is the unit is friendly, false othervise
-- A unit is considered friendly if:
--   * the target master is same as the monster master
--   * the target is the host of the source monster
--   * the target belongs to the same party as the sources host
--   * the target belongs to the same guild as the sources host
function isFriendly(source, target)
	local source_host = GetChaHost(source)
	local target_host = GetChaHost(target)
	if(target == source_host)then
	return true
	end
	if(target == source)then
	return true
	end
	if(source_host == target_host)then
	return true
	end
	-- Target is in hosts team
	local sourceTeamID = GetChaTeamID(source_host)
	if (sourceTeamID ~= 0 and sourceTeamID == GetChaTeamID(target)) then 
		return true
	end

	-- Target is in hosts guild
	local sourceGuildID = GetChaGuildID(source_host)
	if (sourceGuildID ~= 0 and sourceGuildID == GetChaGuildID(target)) then
		return true
	end

	-- Target is in hosts side
	local sourceSideID = GetChaSideID(source_host)
	if (sourceSideID ~= 0 and sourceSideID == GetChaSideID(target)) then 
		return true
	end
	
	local team = is_teammate(source_host, target)
	if (team == 1) then
		return true
	end
	
    local map_type = GetChaMapType(source)
	if(map_type == 0)then -- PVP is OFF
		if(IsPlayer(target) == 1) then
			return true
		end
		if(target_host ~= nil)then
			if(IsPlayer(target_host) == 1) then
				return true
			end
		end
	end
	
--[[	if(target_host ~= nil)then
		if(is_teammate(source_host, target_host) == 1)then
			return true
		end
		print("yes")
	end ]]--

	return false
end

function isAlive(source)
	if source == nil or source == 0 then
		return false
	end
	if Hp(source) <= 0 then
		return false
	end
	if IsChaLiving(source) ~= 1 then
		return false
	end
	
	return true
end

function IsHere(cha)
	local host = GetChaHost(cha)
	if host == nil then
		SetChaLifeTime(cha,500)
		return false
	else
		return true
	end
end

function isSealed(cha)
	local magic_seal = GetChaStateLv ( cha , STATE_JNJZ ) 
	local phsic_seal = GetChaStateLv ( cha , STATE_GJJZ ) 
	if magic_seal >= 1 then
		return true
	end
	if phsic_seal >= 1 then
		return true
	end
	
	return false
end


function LocalChat(role,target,text)
        local pkt = GetPacket()
        local tid = GetCharID( target )
        WriteCmd( pkt, 501 );
        WriteDword( pkt, tid );
        WriteString( pkt, text);
        SendPacket( role, pkt );
end

function Say(character,text)
        local map_copy = GetChaMapCopy ( character )
        local ply_num = GetMapCopyPlayerNum(map_copy)
        local ps={}
        local i = 1
        
        BeginGetMapCopyPlayerCha ( map_copy )
        for i = 1 ,ply_num , 1 do
           ps[i]=GetMapCopyNextPlayerCha ( map_copy )
        end
        
        for i=1,ply_num,1 do
                if(ps[i]~=0 and ps[i]~=nil)then
                        LocalChat( ps[i], character, text )
                end
        end
end




