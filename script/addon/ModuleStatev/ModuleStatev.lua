print("* Loading ModuleStatev.lua")

ModuleStatev = {}
ModuleStatev.Data = GetResPath("script/addon/ModuleStatev/data/")

function SetCharaStatev(value, role, state, skill)
	local ChaID = GetCharID(role)
	local star	= 0
	local star = GetChaAttr(role, state)
	if file_exists(ModuleStatev.Data..ChaID..".txt") == true then
		local Get	= table.load(ModuleStatev.Data..ChaID..".txt","r")
		local STATE	= Get[state][skill]
		if STATE == nil then
			Get[state][skill] = value
		else
			Get[state][skill] = value
		end
		star = star + value
		SetCharaAttr(star, role, state)
		table.save(Get, ModuleStatev.Data..ChaID..".txt","w")
	else
		local Get = {}
		Get[ATTR_STATEV_STR] = {}
		Get[ATTR_STATEV_CON] = {}
		Get[ATTR_STATEV_STA] = {}
		Get[ATTR_STATEV_DEX] = {}
		Get[ATTR_STATEV_AGI] = {}
		Get[ATTR_STATEV_LUK] = {}
		Get[ATTR_STATEV_MF] = {}
		Get[ATTR_STATEV_DEF] = {}
		Get[ATTR_STATEV_HREC] = {}
		Get[ATTR_STATEV_SREC] = {}
		Get[ATTR_STATEV_PDEF] = {}
		Get[ATTR_STATEV_MSPD] = {}
		Get[ATTR_STATEV_ASPD] = {}
		Get[ATTR_STATEV_ADIS] = {}
		Get[ATTR_STATEV_MNATK] = {}
		Get[ATTR_STATEV_MXATK] = {}
		Get[ATTR_STATEV_MXHP] = {}
		Get[ATTR_STATEV_MXSP] = {}
		Get[ATTR_STATEV_FLEE] = {}
		Get[ATTR_STATEV_HIT] = {}
		Get[ATTR_STATEV_CRT] = {}
		Get[ATTR_STATEV_MF] = {}
		Get[ATTR_STATEV_HREC] = {}
		Get[ATTR_STATEV_SREC] = {}
		Get[ATTR_STATEV_COL] = {}
		Get[ATTR_STATEC_STR] = {}
		Get[ATTR_STATEC_AGI] = {}
		Get[ATTR_STATEC_DEX] = {}
		Get[ATTR_STATEC_CON] = {}
		Get[ATTR_STATEC_STA] = {}
		Get[ATTR_STATEC_LUK] = {}
		Get[ATTR_STATEC_ASPD] = {}
		Get[ATTR_STATEC_ADIS] = {}
		Get[ATTR_STATEC_MNATK] = {}
		Get[ATTR_STATEC_MXATK] = {}
		Get[ATTR_STATEC_DEF] = {}
		Get[ATTR_STATEC_MXHP] = {}
		Get[ATTR_STATEC_MXSP] = {}
		Get[ATTR_STATEC_FLEE] = {}
		Get[ATTR_STATEC_HIT] = {}
		Get[ATTR_STATEC_CRT] = {}
		Get[ATTR_STATEC_MF] = {}
		Get[ATTR_STATEC_HREC] = {}
		Get[ATTR_STATEC_SREC] = {}
		Get[ATTR_STATEC_MSPD] = {}
		Get[ATTR_STATEC_COL] = {}
		Get[ATTR_STATEC_PDEF] = {}
		Get[state][skill] = value
		star = star + value
		SetCharaAttr(star, role, state)
		table.save(Get, ModuleStatev.Data..ChaID..".txt","w")
	end
end

function RemCharaStatev(value, role, state, skill)
	local ChaID = GetCharID(role)
	local star = 0
	local star = GetChaAttr(role, state)
	if file_exists(ModuleStatev.Data..ChaID..".txt") == true then
		local Get	= table.load(ModuleStatev.Data..ChaID..".txt","r")
		local STATE	= Get[state][skill]
		if STATE ~= nil then
			star = star - Get[state][skill]
			Get[state][skill] = nil
		end
		SetCharaAttr(star, role, state)
		table.save(Get, ModuleStatev.Data..ChaID..".txt","w")
	else
		local Get = {}
		Get[ATTR_STATEV_STR] = {}
		Get[ATTR_STATEV_CON] = {}
		Get[ATTR_STATEV_STA] = {}
		Get[ATTR_STATEV_DEX] = {}
		Get[ATTR_STATEV_AGI] = {}
		Get[ATTR_STATEV_LUK] = {}
		Get[ATTR_STATEV_MF] = {}
		Get[ATTR_STATEV_DEF] = {}
		Get[ATTR_STATEV_HREC] = {}
		Get[ATTR_STATEV_SREC] = {}
		Get[ATTR_STATEV_PDEF] = {}
		Get[ATTR_STATEV_MSPD] = {}
		Get[ATTR_STATEV_ASPD] = {}
		Get[ATTR_STATEV_ADIS] = {}
		Get[ATTR_STATEV_MNATK] = {}
		Get[ATTR_STATEV_MXATK] = {}
		Get[ATTR_STATEV_MXHP] = {}
		Get[ATTR_STATEV_MXSP] = {}
		Get[ATTR_STATEV_FLEE] = {}
		Get[ATTR_STATEV_HIT] = {}
		Get[ATTR_STATEV_CRT] = {}
		Get[ATTR_STATEV_MF] = {}
		Get[ATTR_STATEV_HREC] = {}
		Get[ATTR_STATEV_SREC] = {}
		Get[ATTR_STATEV_COL] = {}
		Get[ATTR_STATEC_STR] = {}
		Get[ATTR_STATEC_AGI] = {}
		Get[ATTR_STATEC_DEX] = {}
		Get[ATTR_STATEC_CON] = {}
		Get[ATTR_STATEC_STA] = {}
		Get[ATTR_STATEC_LUK] = {}
		Get[ATTR_STATEC_ASPD] = {}
		Get[ATTR_STATEC_ADIS] = {}
		Get[ATTR_STATEC_MNATK] = {}
		Get[ATTR_STATEC_MXATK] = {}
		Get[ATTR_STATEC_DEF] = {}
		Get[ATTR_STATEC_MXHP] = {}
		Get[ATTR_STATEC_MXSP] = {}
		Get[ATTR_STATEC_FLEE] = {}
		Get[ATTR_STATEC_HIT] = {}
		Get[ATTR_STATEC_CRT] = {}
		Get[ATTR_STATEC_MF] = {}
		Get[ATTR_STATEC_HREC] = {}
		Get[ATTR_STATEC_SREC] = {}
		Get[ATTR_STATEC_MSPD] = {}
		Get[ATTR_STATEC_COL] = {}
		Get[ATTR_STATEC_PDEF] = {}
		SetCharaAttr(star, role, state)
		table.save(Get, ModuleStatev.Data..ChaID..".txt","w")
	end
end