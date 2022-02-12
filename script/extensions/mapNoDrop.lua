-- Xtacy
-- No drop per map definition

if NilDrop == nil then
	NilDrop = {};
	NilDrop.hook = { drop = Check_Baoliao };
end
		NilDrop.map = {}
		NilDrop.map['lonetower'] = true;
		NilDrop.map['PKmap'] = true;

if FileToArray == nil then
	FileToArray = function(file)
		local f = io.open(file, "r")
		local arr = {}
		for line in f:lines() do
			table.insert(arr, line)
		end
		return arr
	end
end

function NilDrop:AddHook()
	local file = GetResPath("/script/MisScript/NpcScript08.lua")
	local index = FileToArray(file)
	local func = 'if NilDrop ~= nil then NilDrop:SetHook(); end'
	local r = 0
	for i = 1, table.getn(index) do
		if index[i] ~= tostring(func) then
			r = r + 1;
		end
	end
	if r == table.getn(index) then 
		local LF = io.open(file,'a')
		LF:write("\n")
		LF:write(tostring(func))
		LF:close()
	end
end
NilDrop:AddHook()

function NilDrop:SetHook()
	Hook:AddPostHook('Check_Baoliao', NilDrop.Func, 1)
end

function NilDrop.Func(o, a, d)
	a,d = TurnToCha(a),TurnToCha(d)
	local c = 0;
	local item = {}
	if NilDrop.map[GetChaMapName(a)] == true then
		if IsPlayer(d) == 1 then
			return
		else
			return
			SetItemFall(count, item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8], item[9], item[10])
		end
	end
end