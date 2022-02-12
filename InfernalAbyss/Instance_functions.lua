print("	Loading Instance_functions.lua")

function Instance:spawnWave(map,waveid)
local copy = GetMapCopyID2(map)
	Instance.monsters[copy][waveid] = {}
	for i,v in pairs(Instance.wave[waveid])do
		local MonsterID,x,y = v[1],v[2],v[3]
		local mob = CreateChaEx(MonsterID, x * 100,y * 100, 145, 60,map)
		table.insert(Instance.monsters[copy][waveid],mob)
		SetChaLifeTime(mob,3600000)
	end
	Instance.waveKill[copy][waveid] = 0
end

function GetPlayerKey(role)
	local odd = "A"
	local hex,name = '', GetChaDefaultName(role)
	while string.len(name) > 0 do
		local hb = string.format("%X", string.byte(name, 1, 1))
		if string.len(hb) < 2 then 
			hb = '0' .. hb 
		end        
		hex = hex .. hb        
		name = string.sub(name, 2)    
	end    
	return hex
end

function Instance.PKM(ignore,m,p)
	if(GetChaMapName(p) == Instance.map)then
	local mapcopy = GetChaMapCopy(p)
	local copy = GetMapCopyID2(mapcopy)
	local waveid = Instance.waveNow[copy]
		Instance.waveKill[copy][waveid] = Instance.waveKill[copy][waveid] + 1
	end
end

Hook:AddPostHook("GetExp_PKM",Instance.PKM)
function Instance:AllDead(copy,waveid)
	if(Instance.waveKill[copy][waveid] == nil)then
	return 0
	end
	local killed = Instance.waveKill[copy][waveid]
	if killed == table.getn(Instance.monsters[copy][waveid]) then
		return 1
	end
	return 0
end

function Instance_Reward(c,waveid)
	for i,v in pairs(Instance.rewards[waveid])do
		GiveItem(c,0,v[1],v[2],4)
	end
end

function GetMaxTableVal(ta)
local count = 0
	for i,v in pairs(ta)do
		count = count + 1
	end
return count
end

function Instance:MaxWave(copy)
	if(Instance.waveNow[copy] == GetMaxTableVal(Instance.wave))then
	return 1
	else
	return 0
	end
end

function Instance:TeleportParty(role)
		local TeamCha = {}
		TeamCha[0] = role
		TeamCha[1] = GetTeamCha(role , 0 )
		TeamCha[2] = GetTeamCha(role , 1 )
		TeamCha[3] = GetTeamCha(role , 2 )
		TeamCha[4] = GetTeamCha(role , 3 )
			for i = 0 , 4  , 1 do	
			MoveCity(TeamCha[i],"InfernalAbyss",Instance.copyNow)
			Instance.monsters[Instance.copyNow] = {}
			Instance.waveKill[Instance.copyNow] = {}
			Instance.waveDead[Instance.copyNow] = {}
			Instance.waveNow[Instance.copyNow] = 1	
			Instance.players[Instance.copyNow] = {
			TeamCha[0],
			TeamCha[1],
			TeamCha[2],
			TeamCha[3],
			TeamCha[4]	}
			local playerID = GetPlayerKey(TeamCha[i])
			table.save({day = os.date("%A")},Instance.path..playerID..".txt","w")
			end
			Instance.copyNow = Instance.copyNow + 1
end

function Instance:partyCheck(role)
		local TeamCha = {}
		local count = 0
		TeamCha[0] = role
		TeamCha[1] = GetTeamCha(role , 0 )
		TeamCha[2] = GetTeamCha(role , 1 )
		TeamCha[3] = GetTeamCha(role , 2 )
		TeamCha[4] = GetTeamCha(role , 3 )
			for i = 0 , 4  , 1 do	
			local playerID = GetPlayerKey(TeamCha[i])
			if(file_exists(Instance.path..playerID..".txt") ~= false)then
				local t = table.load(Instance.path..playerID..".txt","r")
				if t.day == os.date("%A") then
					count = count + 1
				end
			end
			if count > 0 then
				return 0
				else return 1
			end
		end
end

function GetTeamMembers(role)
	local	team = {}
        team[0] = role
        team[1] = GetTeamCha(role, 0 )
        team[2] = GetTeamCha(role, 1 )
        team[3] = GetTeamCha(role, 2 )
        team[4] = GetTeamCha(role, 3 )
		if team[1] ~= nil and team[2] ~= nil  and team[3] ~= nil and team[4] ~= nil then
		return 1
		else
		return 0
		end
end

function CheckTeamLevels(role)
	local	team = {}
        team[0] = role
        team[1] = GetTeamCha(role, 0 )
        team[2] = GetTeamCha(role, 1 )
        team[3] = GetTeamCha(role, 2 )
        team[4] = GetTeamCha(role, 3 )
		local count = 0
		for i = 0,4,1 do
			if(Lv(team[i]) >= 60)then
				count = count + 1
			end
		end
		if count == 5 then
			return 1
			else return 0
		end
end

function file_exists(name)
	local f=io.open(name,"r")
	if f~=nil then io.close(f) return true else return false end
end

function Instance_RegParty(cha)
        	local Team_In = IsInTeam(cha)
        	if Team_In ~= 1 then
           		HelpInfo(cha,0, "\194\251 \237\229 \241\238\241\242\238\232\242\229 \226 \238\242\240\255\228\229 "..Instance.name.."" )
			return 0
        end       
        	local leader = IsTeamLeader( cha)
        	if(leader == 0)then
			HelpInfo(cha,0,"\194\251 \237\229 \235\232\228\229\240 \238\242\240\255\228\224 "..Instance.name.."")
			return 0
	else
		local levelCheck = CheckTeamLevels(cha)
		if levelCheck == 0 then
			HelpInfo(cha,0,"\194 \238\242\240\255\228\229 \237\229 \241\238\238\242\226\229\242\241\242\226\243\254\249\232\233 \243\240\238\226\229\237\252 \232\227\240\238\234\238\226"..Instance.reqLv.."! \205\229\235\252\231\255 \226\238\233\242\232 "..Instance.name.."")
			return 0
		end
        end
		local team = GetTeamMembers(cha)
		if(team == 0)then
			HelpInfo(cha,0,"\194\224\236 \237\243\230\229\237 \239\238\235\237\251\233 \238\242\240\255\228 "..Instance.name.."")
			return 0
        end
		local checker = Instance:partyCheck(cha)
		if checker == 0 then
			HelpInfo(cha,0,"Сегодня уже был игрок "..Instance.name.." ")
			return 0
		end
		Instance:TeleportParty(cha)
end

function Instance_wasIn(cha)
	local playerID = GetPlayerKey(cha)
	if(file_exists(Instance.path..playerID..".txt") ~= false)then
		local t = table.load(Instance.path..playerID..".txt","r")
		if t.day == os.date("%A") then
			return true
		end
	end
	return false
end

function Instance_ConfirmParty(cha)
	if(GetTeamMembers(cha) == 0)then
		HelpInfo(cha,0," \209\237\224\247\224\235\224 \241\238\225\229\240\232\242\229 \239\238\235\237\243\254 \234\238\236\224\237\228\243! ")
		return 0
	end
	local team = {}
        team[0] = cha
        team[1] = GetTeamCha(cha, 0 )
        team[2] = GetTeamCha(cha, 1 )
        team[3] = GetTeamCha(cha, 2 )
        team[4] = GetTeamCha(cha, 3 )
		--print(team[0],team[1],team[2],team[3],team[4])
		local entered = {}
		entered[true] = "\232\241\239\238\235\252\231\238\226\224\235 \241\226\238\254 \239\238\239\251\242\234\243 \241\229\227\238\228\237\255 "
		entered[false] = "\237\229 \232\241\239\238\235\252\231\238\226\224\235 \241\226\238\254 \239\238\239\251\242\234\243 \241\229\227\238\228\237\255 "
		HelpInfo(cha,0,"\209\238\241\242\238\255\237\232\229 \234\238\236\224\237\228\251:_1."..GetChaDefaultName(team[1]).." : "..entered[Instance_wasIn(team[1])].."_2."..GetChaDefaultName(team[2]).." : "..entered[Instance_wasIn(team[2])].."_3."..GetChaDefaultName(team[3]).." : "..entered[Instance_wasIn(team[3])].."_4."..GetChaDefaultName(team[4]).." : "..entered[Instance_wasIn(team[4])].."")
end

function Instance_DayCheck()
local Day = os.date("%A")
	if(Instance.openDay[Day] == true)then
		return LUA_TRUE else return LUA_FALSE
	end
end

function Instance_FuncAll(t,func,p1,p2,p3,p4)
local Function = _G[func]
	for i,v in pairs(t)do
		if p1 ~= nil and p2 == nil and p3 == nil and p4 == nil then
			Function(v,p1)
			elseif p1 ~= nil and p2 ~= nil and p3 == nil and p4 == nil then
			Function(v,p1,p2)
			elseif p1 ~= nil and p2 ~= nil and p3 ~= nil and p4 == nil then
			Function(v,p1,p2,p3)
			elseif p1 ~= nil and p2 ~= nil and p3 ~= nil and p4 ~= nil then
			Function(v,p1,p2,p3,p4)
		end
	end
end

print("	---* [Infernal Abyss] Instance Loaded *---")