print( "Loading UtilTimur.lua" )


------------------------------------
--BOSS Dungeon, required functions--
------------------------------------
DealAllChaInCopy						= DealAllChaInCopy or function(Map, f, ...)
	local PlayerNum 						= GetMapCopyPlayerNum(Map)
	local ps 							= {}
	local i 								= 1
	BeginGetMapCopyPlayerCha(Map)
	for i 								= 1, PlayerNum, 1 do
		ps[i] 							= GetMapCopyNextPlayerCha(Map)
	end
	for i 								= 1, PlayerNum, 1 do
		if ps[i] ~= 0 and ps[i] ~= nil then
			_G[f](ps[i], unpack(arg))
		end
	end	
end
PopupNotice 							= PopupNotice or function(Player, Message)
	local Packet 						= GetPacket() 
	WriteCmd(Packet, 503)
	WriteString(Packet, Message)
	SendPacket(Player, Packet) 
end 
ToClockFormat							= toclock or function(Second)
	local Num 							= tonumber(sec)
	if(Num == 0) then
		return "00:00:00"
	else
		now_hour 						= string.format("%02.f",math.floor(Num / 3600 ))
		now_minute 						= string.format("%02.f",math.floor(Num / 60 - (now_hour*60)))
		now_second 						= string.format("%02.f",math.floor(Num - now_hour*3600 - now_minute*60))
		return tonumber(now_hour).." Hour "..tonumber(now_minute).." Minute "..tonumber(now_second).." Second"
	end
end