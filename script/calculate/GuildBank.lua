--------------------------------------------------------------------------------
-- ������ ������� ����� �������
-- V3ct0r from WWW.PkoDEV.NET
-- 24.02.2017
--
-- ��������� GameServer.exe � ���������:
-- 1. HandleChat() - ���������� ��������� �������� ����
-- 2. GetItemNumber() - �������� ���������� ��������� � ������ ���������
-- 3. GetItemStackSize() - �������� ������ ����� ��������
-- 4. GetItemThrowable() - ����� �� ��������� �������
-- 5. GetItemTransmissible() - ����� �� �������� �������
-- 6. GetItemDestroyable() - ����� �� ������� �������
--
-- ���������:
-- ���������� ������ ���� � SkillEffect.lua
-- dofile(GetResPath("script\\calculate\\GuildBank.lua"))
--
-- ������� ����:
-- [3] /���������
-- [3] /���������� <����� ������ ����� �������>
-- [2] /������������� <������ ���������>, <������ �����>, <����������>
-- [1] /������������ <������ �����>, <����������>
-- [�] /���������� <��� ���������>, <�������>
-- [�] /������������� <��� ���������>
-- [�] /�������������� <��� ���������>
-- [3] /����������
--
-- ������ ������� � ����� �������:
-- 1 ������� - ����� ����� � ������;
-- 2 ������� - ����� ������ ������;
-- 3 ������� - ����� ������ ��������.
--------------------------------------------------------------------------------
print "Loading Guild Bank System...";


-- ������ ����� (������)
MAX_BANK_SIZE = 60

-- ����������� ������� ��� ����� �������
guild_bank_map = {

	--[[
		["�����"] = {
						[1] = {x0, y0, x1, y1},
						...
						[n] = {x0, y0, x1, y1},
					}
	]]--
	
	["magicsea"] = {
					[1] = {1, 1, 4040, 4060},
					[2] = {16, 16, 32, 32}
				},	
				
	["07xmas"] = {
					[1] = {39, 42, 49, 49},
					[2] = {16, 16, 32, 32}
				},
				
	["07xmas"] = {
					[1] = {37, 41, 45, 51},
					[2] = {16, 16, 32, 32}
				},

	["darkblue"] = {
					[1] = {1, 1, 8, 8},
					[2] = {16, 16, 32, 32}
				}
}

-- ���� ������� ��������
ITEM_POS       = 1
ITEM_ID        = 2
ITEM_NUMBER    = 3
ITEM_STR       = 4
ITEM_CON       = 5
ITEM_DEX       = 6
ITEM_AGI       = 7
ITEM_STA       = 8
ITEM_URE       = 9
ITEM_MAXURE    = 10
ITEM_ENEGRY    = 11
ITEM_MAXENERGY = 12
ITEM_FORGE0    = 13
ITEM_FORGE1    = 14

-- �������� ������� �������
guild_bank_access_desc = {
	
	[1] = "\204\238\230\229\242 \225\240\224\242\252 \232 \234\235\224\241\242\252 \226\229\249\232 \232\231/\226 \225\224\237\234 \227\232\235\252\228\232\232",
	[2] = "\204\238\230\229\242\252 \242\238\235\252\234\238 \234\235\224\241\242\252 \226\229\249\232 \226 \225\224\237\234 \227\232\235\252\228\232\232",
	[3] = "\204\238\230\229\242 \242\238\235\252\234\238 \239\240\238\241\236\224\242\240\232\226\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232",

	--[[
		[1] = "����� ����� � ������ ���� ��/� ���� �������.",
		[2] = "������ ������ ������ ���� � ���� �������.",
		[3] = "����� ������ ������������� ���� �������.",
	]]--

}

-- ������� ��������� ������ ����
chat_guild_bank_cmd = {}

-- ������ ��������� � �����
-- /���������
function Cmd_ShowBank(role, bank, param)

	-- �������� � ������� ������ ������ ��������� � �����
	ShowBank(role, bank)

end

-- ����� ������� ����� � ������
-- /���������� [������ �����]
function Cmd_ShowCell(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\215\242\238\194\255\247\229\233\234\229 <\255\247\229\233\234\224 \226 \225\224\237\234\229>")
		--SystemNotice(role, "���������: /���������� <������ � �����>")
		return
	end

	-- ��������� ��� ����������
	local pos = 0
	if (type(tonumber(param[1])) == "number") then
		pos = tonumber(param[1])
	else
		SystemNotice(role, "\205\238\236\229\240 \255\247\229\233\234\232 \226 \225\224\237\234\229 \228\238\235\230\229\237 \225\251\242\252 \247\232\241\235\238\226\251\236 \231\237\224\247\229\237\232\229\236!")
		--SystemNotice(role, "����� ������ � ����� ������ ���� �������� ���������!")
		return
	end

	-- �������� � ������� ������ ���������� ������ pos
	ShowCell(role, bank, pos)

end

-- �������� ������� � ����
-- /������������� [������ ���������], [������ �����], [����������]
function Cmd_PushItem(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 3) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\226\224\248\224 \255\247\229\233\234\224>, <\255\247\229\233\234\224 \226 \225\224\237\234\229>, <\234\238\235\232\247\229\241\242\226\238>")
		--SystemNotice(role, "���������: /������������� <���� ������>, <������ � �����>, <����������>")
		return
	end

	-- ��������� ��� ����������
	local role_pos, bank_pos, number = 0, 0,0
	if (type(tonumber(param[1])) == "number" 
			and type(tonumber(param[2])) == "number"
			and type(tonumber(param[3])) == "number") then
		role_pos = tonumber(param[1])
		bank_pos = tonumber(param[2])
		number = tonumber(param[3])
	else
		SystemNotice(role, "\205\238\236\229\240\224 \255\247\229\229\234 \232 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\224 \228\238\235\230\237\251 \225\251\242\252 \247\232\241\235\238\226\251\236\232 \231\237\224\247\229\237\232\255\236\232!")
		--SystemNotice(role, "������ ����� � ���������� �������� ������ ���� ��������� ����������!")
		return
	end

	-- ������ ������� � ����
	PushItem(role, bank, role_pos, bank_pos, number)

end

-- ����� ������� �� �����
-- /������������ [������], [����������]
function Cmd_PopItem(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 2) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \226 \225\224\237\234\229>, <\234\238\235\232\247\229\241\242\226\238>")
		--SystemNotice(role, "���������: /������������ <������ � �����>, <����������>")
		return
	end

	-- ��������� ��� ����������
	local pos, number = 0, 0
	if (type(tonumber(param[1])) == "number" 
			and type(tonumber(param[2])) == "number") then
		pos = tonumber(param[1])
		number = tonumber(param[2])
	else
		SystemNotice(role, "\205\238\236\229\240 \255\247\229\233\234\232 \232 \234\238\235\232\247\229\241\242\226\238 \239\240\229\228\236\229\242\224 \228\238\235\230\237\251 \225\251\242\252 \247\232\241\235\238\226\251\236\232 \231\237\224\247\229\237\232\255\236\232!")
		--SystemNotice(role, "����� ������ � ���������� �������� ������ ���� ��������� ����������!")
		return
	end

	-- ����� ������� �� �����
	PopItem(role, bank, pos, number)

end

-- ������ ������ � ����� �������
-- /���������� [��� ���������], [�������]
function Cmd_GiveAccess(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 2) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252 \228\238\241\242\243\239\224>")
		--SystemNotice(role, "���������: /���������� <��� ���������>, <������� �������>")
		return
	end

	-- ��������� ��� ����������
	local cha_name, level = "", 0
	if (type(tostring(param[1])) == "string" and 
			type(tonumber(param[2])) == "number") then
		cha_name = tostring(param[1])
		level = tonumber(param[2])
	else
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233, \224 \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 - \247\232\241\235\238\236 \238\242 1 \228\238 3!")
		--SystemNotice(role, "��� ��������� ������ ���� �������, � ������� ������� - ������ �� 1 �� 3!")
		return
	end

	-- ������ ����� ������� � ����� �������
	GiveAccess(role, level, bank, cha_name)

end

-- ������� ������ � ����� �������
-- /������������� [��� ���������]
function Cmd_TakeAccess(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
		--SystemNotice(role, "���������: /������������� <��� ���������>")
		return
	end

	-- ��������� ��� ����������
	if (type(tostring(param[1])) ~= "string") then
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233!")
		--SystemNotice(role, "��� ��������� ������ ���� �������!")
		return
	end

	-- �������� ������ � ����� �������
	local cha_name = tostring(param[1])
	TakeAccess(role, bank, cha_name)

end

-- ����������� ������� ������� ���������
-- /�������������� [��� ���������]
function Cmd_ShowAccess(role, bank, param)

	-- ��������� ���������� ����������
	if (param.n ~= 1) then
		SystemNotice(role, "\209\232\237\242\224\234\241\232\241: /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
		--SystemNotice(role, "���������: /�������������� <��� ���������>")
		return
	end

	-- ��������� ��� ����������
	if (type(tostring(param[1])) ~= "string") then
		SystemNotice(role, "\200\236\255 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\238 \225\251\242\252 \241\242\240\238\234\238\233!")
		--SystemNotice(role, "��� ��������� ������ ���� �������!")
		return
	end

	-- ���������� ������� �������
	local cha_name = tostring(param[1])
	ShowAccess(role, bank, cha_name)

end

-- ���������� ������ ������
-- /����������
function Cmd_Help(role, bank, param)

	SystemNotice(role, "\202\238\236\224\237\228\251 \228\235\255 \240\224\225\238\242\251 \241 \225\224\237\234\238\236:")
	SystemNotice(role, "[3] /\215\242\238\194\225\224\237\234\229")
	SystemNotice(role, "[3] /\215\242\238\194\255\247\229\233\234\229 <\237\238\236\229\240 \255\247\229\233\234\232 \225\224\237\234\224 \227\232\235\252\228\232\232>")
	SystemNotice(role, "[2] /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\255\247\229\233\234\224 \239\229\240\241\238\237\224\230\224>, <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
	SystemNotice(role, "[1] /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
	SystemNotice(role, "[\203] /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252>")
	SystemNotice(role, "[\203] /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
	SystemNotice(role, "[\203] /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
	SystemNotice(role, "[3] /\207\238\236\238\249\252\193\224\237\234")

end

-- ������� ��������� �������� ����
function GuildHandleChat(role, message)

	-- ������� ��������� ������ ����
	if (string.find(message, "/") == 1) then

	    -- ������� ����� �� ������ �������
	    local cmd = string.lower(string.sub(message, 2))
	    
	    if (cmd == "") then
	    	SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\236\224\237\228\243 \239\238\241\235\229 \247\229\240\242\251: /<\234\238\236\224\237\228\224> <\239\224\240\224\236\229\242\240\251>")
	        --SystemNotice(role, "������� ������� ����� �����: /<�������> <���������>")
	        return 0
	    end
	   
	    -- ������ ��������� (��� ����������� Insider'�)
	    local param = {n = 0}
	   
	    cmd = explode(" ", cmd)

	    if cmd[2] ~= nil then
	        param = explode(",", cmd[2])
	        param.n = table.getn(param)
	    end
	       
	    cmd = cmd[1]

	    -- �������� ���������� �������
		
	    if (chat_guild_bank_cmd[cmd] ~= nil) then
		
			-- ��������� ��� �������� �� � �����
			if (GetChaStateLv(role, 99) > 0) then
				SystemNotice(role, "\194\251 \237\229 \236\238\230\229\242\229 \232\241\239\238\235\252\231\238\226\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232 \237\224\245\238\228\255\241\252 \226 \242\238\240\227\238\226\238\236 \235\238\242\234\229!")
				--SystemNotice(role, "�� �� ������ ������������ ���� ������� �������� � �������� �����!")
				return 0
			end
	    	-- ��������� ��� � ������ ���� �������
	    	if (HasGuild(role) == 0) then
	    		SystemNotice(role, "\196\235\255 \232\241\239\238\235\252\231\238\226\224\237\232\255 \234\238\236\224\237\228\251 /" .. cmd .. " \194\251 \228\238\235\230\237\251 \225\251\242\252 \226 \227\232\235\252\228\232\232!")
	    		--SystemNotice(role, "��� ������������� ������� /" .. cmd .. " �� ������ ���� � �������!")
	    		return 0
	    	end

	    	-- �������� ���� ���������
	    	local bank = LoadGuildBank(role)

	    	-- ��������� ��� � ������� ���� ����
	    	if (bank.activated == 0) then
	    		SystemNotice(role, "\211 \194\224\248\229\233 \227\232\235\252\228\232\232 \239\238\234\224 \237\229\242 \225\224\237\234\224...")
	    		--SystemNotice(role, "� ����� ������� ���� ��� �����...")
	    		return 0
	    	end

	    	-- ���������, ��� �������� ��������� � ����������� �������
	    	if (IsInBankArea(role) == 0) then
	    		SystemNotice(role, "\194 \253\242\238\233 \236\229\241\242\237\238\241\242\232 \237\229\228\238\241\242\243\239\229\237 \225\224\237\234 \227\232\235\252\228\232\232!")
	    		--SystemNotice(role, "� ���� ��������� ���������� ���� �������!")
	    		return 0
	    	end
			

	    	-- ��������� ������� �������
	    	if (GetRoleID(role) ~= bank.leader_id) then
		    	if (chat_guild_bank_cmd[cmd].access == 0) then
		    		-- ����� ������ ���� ������� �������
		    		SystemNotice(role, "\196\224\237\237\243\254 \234\238\236\224\237\228\243 \236\238\230\229\242 \226\251\239\238\235\237\232\242\252 \242\238\235\252\234\238 \235\232\228\229\240 \227\232\235\252\228\232\232.")
		    		--SystemNotice(role, "������ ������� ����� ��������� ������ ����� �������.")
		    		return
		    	else
		    		-- � ������ ������ ���� ������� �������
		    		local cha_access = GetAccess(bank, GetChaDefaultName(role))
		    		if (cha_access > chat_guild_bank_cmd[cmd].access or cha_access == 0) then
		    			SystemNotice(role, "\211 \194\224\241 \237\229\228\238\241\242\224\242\238\247\237\238 \239\240\224\226 \228\238\241\242\243\239\224 \228\235\255 \226\251\239\238\235\237\229\237\232\255 \228\224\237\237\238\233 \234\238\236\224\237\228\251.")
		    			--SystemNotice(role, "� ��� ������������ ���� ������� ��� ���������� ������ �������.")
		    			return
		    		end
		    	end
	    	end

	    	-- �������� ���������� ������� ����
	        chat_guild_bank_cmd[cmd].func(role, bank, param)

	        return 0

	    end

	end
	
	return HandleChat_original(role, message)

end

-- ������� ����������� ����� �������� �������
function AfterGuildCreate(role, guild_type)

	-- ������� ����� ���� ��� �������
	local guild_id = GetChaGuildID(role)
	local cha_id = GetRoleID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "w+")
	if (file == nil) then
		SystemNotice(role, "\205\229 \243\228\224\235\238\241\252 \241\238\231\228\224\242\252 \225\224\237\234 \227\232\235\252\228\232\232 (ID: " .. guild_id ..")! \206\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243!")
		--SystemNotice(role, "�� ������� ������� ���� ������� (ID: " .. guild_id ..")! ���������� � ��������������!")
	else
		-- ���������� ID ����� �������
		file:write(cha_id .. ";0;0;;;;0;")
		file:close()

		--[[
			SystemNotice(role, "\211 \194\224\248\229\233 \227\232\235\252\228\232\232 \229\241\242\252 \225\224\237\234.")
			SystemNotice(role, "\202\238\236\224\237\228\251 \228\235\255 \240\224\225\238\242\251 \241 \225\224\237\234\238\236:")
			SystemNotice(role, "[3] /\215\242\238\194\225\224\237\234\229")
			SystemNotice(role, "[3] /\215\242\238\194\255\247\229\233\234\229 <\237\238\236\229\240 \255\247\229\233\234\232 \225\224\237\234\224 \227\232\235\252\228\232\232>")
			SystemNotice(role, "[2] /\207\238\235\238\230\232\242\252\194\225\224\237\234 <\255\247\229\233\234\224 \239\229\240\241\238\237\224\230\224>, <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
			SystemNotice(role, "[1] /\194\231\255\242\252\200\231\193\224\237\234\224 <\255\247\229\233\234\224 \225\224\237\234\224>, <\234\238\235\232\247\229\241\242\226\238>")
			SystemNotice(role, "[\203] /\196\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>, <\243\240\238\226\229\237\252>")
			SystemNotice(role, "[\203] /\199\224\225\240\224\242\252\196\238\241\242\243\239 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
			SystemNotice(role, "[\203] /\211\240\238\226\229\237\252\196\238\241\242\243\239\224 <\232\236\255 \239\229\240\241\238\237\224\230\224>")
			SystemNotice(role, "[3] /\207\238\236\238\249\252\193\224\237\234")
		]]--

		--[[
			SystemNotice(role, "� ����� ������� ���� ����.")
			SystemNotice(role, "������� ��� ������ � ������:")
			SystemNotice(role, "[3] /���������")
			SystemNotice(role, "[3] /���������� <����� ������ ����� �������>")
			SystemNotice(role, "[2] /������������� <������ ���������>, <������ �����>, <����������>")
			SystemNotice(role, "[1] /������������ <������ �����>, <����������>")
			SystemNotice(role, "[�] /���������� <��� ���������>, <�������>")
			SystemNotice(role, "[�] /������������� <��� ���������>")
			SystemNotice(role, "[�] /�������������� <��� ���������>")
			SystemNotice(role, "[3] /����������")
		]]--
	end

	-- �������� �������� � ������, �����������
	-- ��� �������� �������
	DeductGuildItem_original(role, guild_type)

end

-- ��������� ���� ������� �� ������
function String2Bank(raw_bank)

	-- ��� ����
	local bank = {}

	-- ������ ������
	local bank_table = explode(";", raw_bank)

	-- ��������� ����
	-- ID ������
	bank.leader_id = tonumber(bank_table[1])

	-- ����������� �� ����
	bank.activated = tonumber(bank_table[2])

	-- ������ �����
	bank.size = tonumber(bank_table[3])

	-- ������ �������
		bank.access = {
			[1] = explode(",", bank_table[4]),
			[2] = explode(",", bank_table[5]),
			[3] = explode(",", bank_table[6]),
		}

	-- ���������� ���������
	local n = tonumber(bank_table[7])

	-- �������� � �����
	bank.items = {}
	for i = 1, n, 1 do
		local temp_item = explode(",", bank_table[7 + i])

		bank.items[i] = {}
		bank.items[i][ITEM_POS]       = tonumber(temp_item[1])
		bank.items[i][ITEM_ID]        = tonumber(temp_item[2])
		bank.items[i][ITEM_NUMBER]    = tonumber(temp_item[3])
		bank.items[i][ITEM_STR]       = tonumber(temp_item[4])
		bank.items[i][ITEM_CON]       = tonumber(temp_item[5])
		bank.items[i][ITEM_DEX]       = tonumber(temp_item[6])
		bank.items[i][ITEM_AGI]       = tonumber(temp_item[7])
		bank.items[i][ITEM_STA]       = tonumber(temp_item[8])
		bank.items[i][ITEM_URE]       = tonumber(temp_item[9])
		bank.items[i][ITEM_MAXURE]    = tonumber(temp_item[10])
		bank.items[i][ITEM_ENEGRY]    = tonumber(temp_item[11])
		bank.items[i][ITEM_MAXENERGY] = tonumber(temp_item[12])
		bank.items[i][ITEM_FORGE0]    = tonumber(temp_item[13])
		bank.items[i][ITEM_FORGE1]    = tonumber(temp_item[14])
	end

	return bank

end

-- ������������� ���� � ������
function Bank2String(bank)

	-- ����� ID ������ �������
	local raw_bank = bank.leader_id .. ";"

	-- ����� ����������� �� ����
	raw_bank = raw_bank .. bank.activated .. ";"

	-- ����� ������ �����
	raw_bank = raw_bank .. bank.size .. ";" 

	-- ����� ������ ������� � ����� �������
	for i = 1, table.getn(bank.access), 1 do
		raw_bank = raw_bank .. implode(",", bank.access[i]) .. ";"
	end

	-- ����� ���������� ���������
	local n = table.getn(bank.items)
	raw_bank = raw_bank .. n .. ";"

	-- ����� ��������, ������� ����� � �����
	for i = 1, n, 1 do
		raw_bank = raw_bank .. implode(",", bank.items[i])
		if (i < n) then
			raw_bank = raw_bank .. ";"
		end
	end

	return raw_bank

end

-- ����������� ������ ��������� � �����
function ShowBank(role, bank)

	-- ��������� ��� ���������� ����� � ����� ������ 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "� ����� ����� ������� ��� �����. ����������, ����������� ������.")
		return
	end

	-- ���������� ������� ����� � ����� �������
	local n = table.getn(bank.items)

	-- ������� ������ ������� ����� ������
	if (n > 0) then 
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \231\224\237\255\242\238 " .. n .. " \255\247\229\229\234 \232\231 " .. bank.size .. ":")
		--SystemNotice(role, "� ����� ����� ������� ������ " .. n .. " ����� �� " .. bank.size .. ":")
		--SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \231\224\237\255\242\238 " .. n .. " \255\247\229\229\234 \232\231 " .. MAX_BANK_SIZE .. ":")
		--SystemNotice(role, "� ����� ����� ������� ������ " .. n .. " ����� �� " .. MAX_BANK_SIZE .. ":")

		-- ������ � ��������
		local items = {}

		-- ��������� ������ ���������
		for i = 1, n, 1 do
			items[i] = {}
			items[i].pos = bank.items[i][ITEM_POS]
			items[i].name = GetItemName(bank.items[i][ITEM_ID])
			items[i].number = bank.items[i][ITEM_NUMBER]
		end

		-- ��������� ������ �� �������
		table.sort(items,   function(a, b)
								if (a.pos > b.pos) then
									return false
								end

								return true
							end
				)

		-- �������� ���������������� ������
		for i = 1, n, 1 do
			SystemNotice(role, "[" .. items[i].pos .. "] " .. items[i].name .. " x " .. items[i].number)
		end
	else
		-- � ����� ����� ...
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \239\243\241\242\238...")
		--SystemNotice(role, "� ����� ����� ������� �����...")
	end

end

-- ��������� ���������� ������ �����
function ShowCell(role, bank, pos)

	-- ��������� ��� ���������� ����� � ����� ������ 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "� ����� ����� ������� ��� �����. ����������, ����������� ������.")
		return
	end

	-- ��������� ��� ����� ���� ���������� ����� ������ �����
	--if ((pos > MAX_BANK_SIZE) or (pos < 1)) then
	if ((pos > bank.size) or (pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- ���� ������ pos
	for i = 1, table.getn(bank.items), 1 do
		if (bank.items[i][ITEM_POS] == pos) then
			SystemNotice(role, "[" .. pos .. "] " .. GetItemName(bank.items[i][ITEM_ID]) .. " x " .. bank.items[i][ITEM_NUMBER])
			return
		end
	end

	-- � ������ �����
	SystemNotice(role, "[" .. pos .. "] \207\243\241\242\238")
	--SystemNotice(role, "[" .. pos .. "] �����")

end

-- �������� ������� � ����
function PushItem(role, bank, role_pos, bank_pos, number)

	-- ��������� ��� ����� ���� ���������� ����� ������ ���������
	local kbsize = GetKbCap(role)
	if ((role_pos < 1) or(role_pos > kbsize)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232 \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255: \238\242 1 \228\238 " .. kbsize .. "!")
		--SystemNotice(role, "������� ���������� ����� ������ ������ ���������: �� 1 �� " .. kbsize .. "!")
		return
	end

	-- ��������� ��� ���������� ����� � ����� ������ 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "� ����� ����� ������� ��� �����. ����������, ����������� ������.")
		return
	end

	-- ��������� ��� ����� ���� ���������� ����� ������ �����
	--if ((bank_pos > MAX_BANK_SIZE) or (bank_pos < 1)) then
	if ((bank_pos > bank.size) or (bank_pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- ��������� ��� ����� ���� ��������� ����� ���������
	if ((number < 1) or (number > 99)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\238\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226: \238\242 1 \228\238 99!")
		--SystemNotice(role, "������� ���������� ����� ���������: �� 1 �� 99!")
		return
	end

	-- ���������, ��� ��������� ������ �� ������������
	if (KitbagLock(role, 0) ~= 1) then
		SystemNotice(role, "\194\224\248 \232\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237!")
		--SystemNotice(role, "��� ��������� ������������!")
		return
	end

	-- �������� ������� �� ��������� ���������
	local Item = GetChaItem(role, 2, role_pos - 1)
	if (Item == 0 or Item == nil) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. role_pos .. "] \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255 \239\243\241\242\238!")
		--SystemNotice(role, "� ������ [" .. role_pos .. "] ������ ��������� �����!")
		return
	end
Notice("2222")
	-- ���������, ��� ������� ����� ��������
	local item_id = GetItemID(Item)
	if (GetItemTransmissible(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "������ ������� ������ �������� � ���� �������!")
		return
	end
	
	-- ���������, ��� ��� �� �������.
	if item_id == 3988 or item_id == 3849 then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		return
	end
	
	Notice("1")
	
	-- ���������, ��� ������� ����� �������
	if (GetItemDestroyable(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "������ ������� ������ �������� � ���� �������!")
		return
	end
Notice("2")
	-- ���������, ��� ������� ����� ���������
	if (GetItemThrowable(item_id) == 0) then
		SystemNotice(role, "\196\224\237\237\251\233 \239\240\229\228\236\229\242 \237\229\235\252\231\255 \239\238\235\238\230\232\242\252 \226 \225\224\237\234 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "������ ������� ������ �������� � ���� �������!")
		return
	end
Notice("3")
	-- ��������� ��� ����� ���� ���������� �� ������ ������� �����
	local stack_size = GetItemStackSize(item_id)
	if (number > stack_size) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226, \237\229 \239\240\229\226\251\248\224\254\249\229\229 \240\224\231\236\229\240 \241\242\229\234\224. \196\235\255 " .. GetItemName(item_id) .. " \236\224\234\241\232\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \226 \255\247\229\233\234\229: " .. stack_size .. ".")
		--SystemNotice(role, "������� ����� ���������, �� ����������� ������ �����. ��� " .. GetItemName(item_id) .. " ������������ ���������� � ������: " .. stack_size .. ".")
		return
	end
Notice("4")
	-- ��������� ��� � ��������� ���� ����������� ���������� ���������
	local item_number = GetItemNumber(Item)
	if (item_number < number) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. role_pos .. "] \194\224\248\229\227\238 \232\237\226\229\237\242\224\240\255 \237\229\228\238\241\242\224\242\238\247\237\238 \239\240\229\228\236\229\242\238\226 (\211 \194\224\241 " .. item_number .. ", \194\251 \245\238\242\232\242\229 \239\238\235\238\230\232\242\252 " .. number ..").")
		--SystemNotice(role, "� ������ [" .. role_pos .. "] ������ ��������� ������������ ��������� (� ��� " .. item_number .. ", �� ������ �������� " .. number ..").")
		return
	end
Notice("5")
	-- ��������� �������� � ������
	local item_pos = -1
	for i = 1, table.getn(bank.items), 1 do
		local bank_item = bank.items[i]
		if (bank_item[ITEM_POS] == bank_pos) then
			if (item_id == bank_item[ITEM_ID]) then	
				-- ��������� ��� ������ �� ���������
				if (stack_size < (bank_item[ITEM_NUMBER] + number)) then
					SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. bank_pos .. "] \225\224\237\234\224 \227\232\235\252\228\232\232 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224!")
					--SystemNotice(role, "� ������ [" .. bank_pos .. "] ����� ������� ������������ �����!")
					
					local d = stack_size - bank_item[ITEM_NUMBER]
					if (d > 0) then
						SystemNotice(role, "\194\251 \236\238\230\229\242\229 \239\238\235\238\230\232\242\252 " .. d .. " \239\240\229\228\236\229\242(\224/\238\226).")
						--SystemNotice(role, "�� ������ �������� " .. d .. " �������(�/��).")
					end

					return
				end

				item_pos = i
			else
				SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. bank_pos .. "] \243\230\229 \235\229\230\232\242 \239\240\229\228\236\229\242 " .. GetItemName(bank_item[ITEM_ID]) .. " x " .. bank_item[ITEM_NUMBER] .. "! \194\251 \236\238\230\229\242\229 \239\238\235\238\230\232\242\252 \241\254\228\224 \242\238\235\252\234\238 \239\240\229\228\236\229\242\251 \228\224\237\237\238\227\238 \242\232\239\224.")
				--SystemNotice(role, "� ������ [" .. bank_pos .. "] ��� ����� ������� " .. GetItemName(bank_item[ITEM_ID]) .. " x " .. bank_item[ITEM_NUMBER] .. "! �� ������ �������� ���� ������ �������� ������� ����.")
				return
			end

			break
		end
	end
Notice("6")
	-- ������ ������� � ����
	if (item_pos == -1) then
		-- ������� ����� ������� � �����
		local item_add = {}

		-- �������� �������������� ��������
		local item_id = GetItemID(Item)
		local item_str = GetItemAttr(Item, ITEMATTR_VAL_STR)
		local item_con = GetItemAttr(Item, ITEMATTR_VAL_CON)
		local item_agi = GetItemAttr(Item, ITEMATTR_VAL_AGI)
		local item_dex = GetItemAttr(Item, ITEMATTR_VAL_DEX)
		local item_sta = GetItemAttr(Item, ITEMATTR_VAL_STA)
		local item_ure = GetItemAttr(Item, ITEMATTR_URE)
		local item_maxure = GetItemAttr(Item, ITEMATTR_MAXURE)
		local item_forge0 = GetItemForgeParam(Item, 0)
		local item_forge1 = GetItemForgeParam(Item, 1)
		local item_energy =  GetItemAttr(Item, ITEMATTR_ENERGY) 
		local item_maxenergy = GetItemAttr(Item, ITEMATTR_MAXENERGY) 

		--[[
			SystemNotice(role, "Item ID = "   .. item_id)
			SystemNotice(role, "str = "       .. str)
			SystemNotice(role, "con = "       .. con)
			SystemNotice(role, "agi = "       .. agi)
			SystemNotice(role, "dex = "       .. dex)
			SystemNotice(role, "sta = "       .. sta)
			SystemNotice(role, "ure = "       .. ure)
			SystemNotice(role, "maxure = "    .. maxure)
			SystemNotice(role, "energy = "    .. energy)
			SystemNotice(role, "maxenergy = " .. maxenergy)
			SystemNotice(role, "forge0 = "    .. forge0)
			SystemNotice(role, "forge1 = "    .. forge1)
		]]--

		-- �������� �������������� �������� � ����
		item_add[ITEM_POS]       = bank_pos
		item_add[ITEM_ID]        = item_id
		item_add[ITEM_NUMBER]    = number
		item_add[ITEM_STR]       = item_str
		item_add[ITEM_CON]       = item_con
		item_add[ITEM_DEX]       = item_dex
		item_add[ITEM_AGI]       = item_agi
		item_add[ITEM_STA]       = item_sta
		item_add[ITEM_URE]       = item_ure
		item_add[ITEM_MAXURE]    = item_maxure
		item_add[ITEM_ENEGRY]    = item_energy
		item_add[ITEM_MAXENERGY] = item_maxenergy
		item_add[ITEM_FORGE0]    = item_forge0
		item_add[ITEM_FORGE1]    = item_forge1
		
		r1 = TakeItem(role, 0, item_id, number) 
		if r1 == 0 then
			SystemNotice(role, "������� �� ������� �������� � ����.")
			return
		end
		
		-- ������ ������� � ����
		table.insert(bank.items, item_add)
	else
		r1 = TakeItem(role, 0, item_id, number) 
		if r1 == 0 then
			SystemNotice(role, "������� �� ������� �������� � ����.")
			return
		end
		bank.items[item_pos][ITEM_NUMBER] = bank.items[item_pos][ITEM_NUMBER] + number
	end
	-- �������� ������� � ���������
	-- DelBagItem2(role, Item, number)

	-- ��������� ����
	UpdateBank(role, bank)

	-- ��������� ������
	if (item_pos == -1) then
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \239\238\235\238\230\232\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \226 \255\247\229\233\234\243 [" .. bank_pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "�� ������� �������� (" .. GetItemName(item_id) ..") x " .. number .. " � ������ [" .. bank_pos .. "] ����� ����� �������!")
	else
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \228\238\225\224\226\232\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \226 \255\247\229\233\234\243 [" .. bank_pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \210\229\239\229\240\252 \242\224\236 " .. bank.items[item_pos][ITEM_NUMBER] .. " \239\240\229\228\236\229\242\238\226.")
		--SystemNotice(role, "�� ������� �������� (" .. GetItemName(item_id) ..") x " .. number .. " � ������ [" .. bank_pos .. "] ����� ����� �������! ������ ��� " .. bank.items[item_pos][ITEM_NUMBER] .. " ���������.")
	end

end

-- �������� ������� �� �����
function PopItem(role, bank, pos, number)

	-- ��������� ��� ���������� ����� � ����� ������ 0
	if (bank.size == 0) then
		SystemNotice(role, "\194 \225\224\237\234\229 \194\224\248\229\233 \227\232\235\252\228\232\232 \237\229\242 \255\247\229\229\234. \207\238\230\224\235\243\233\241\242\224, \239\240\232\238\225\240\229\242\232\242\229 \255\247\229\233\234\232.")
		--SystemNotice(role, "� ����� ����� ������� ��� �����. ����������, ����������� ������.")
		return
	end

	-- ��������� ������
	if ((pos > bank.size) or (pos < 1)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. bank.size .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. bank.size  .. "!")
		--SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\251\233 \237\238\236\229\240 \255\247\229\233\234\232: \238\242 1 \228\238 " .. MAX_BANK_SIZE .. "!")
		--SystemNotice(role, "������� ���������� ����� ������: �� 1 �� " .. MAX_BANK_SIZE  .. "!")
		return
	end

	-- ���������, ��� ����� ���� ��������� ����� ���������
	if ((number < 1) or (number > 99)) then
		SystemNotice(role, "\194\226\229\228\232\242\229 \234\238\240\240\229\234\242\237\238\229 \247\232\241\235\238 \239\240\229\228\236\229\242\238\226: \238\242 1 \228\238 99!")
		--SystemNotice(role, "������� ���������� ����� ���������: �� 1 �� 99!")
		return
	end

	-- ���������, ��� ��������� ������ �� ������������
	if (KitbagLock(role, 0) ~= 1) then
		SystemNotice(role, "\194\224\248 \232\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237!")
		--SystemNotice(role, "��� ��������� ������������!")
		return
	end

	-- �������� ������� �� ������
	local item, p = nil, 0
	for i = 1, table.getn(bank.items), 1 do
		if (pos == bank.items[i][ITEM_POS]) then
			item = bank.items[i]
			p = i
			break
		end
	end

	-- ���������, ��� � ������ ���� �������
	if (item == nil) then
		SystemNotice(role, "\223\247\229\233\234\224 [" .. pos .. "] \239\243\241\242\224\255!")
		--SystemNotice(role, "������ [" .. pos .. "] ������!")
		return
	end

	-- ���������, ��� � ������ ����������� ���������� ���������
	local item_id = item[ITEM_ID]
	local n = item[ITEM_NUMBER]
	if (n < number) then
		SystemNotice(role, "\194 \255\247\229\233\234\229 [" .. pos .. "] \229\241\242\252 \242\238\235\252\234\238 " .. n .. " x " .. GetItemName(item_id) .. "!")
		--SystemNotice(role, "� ������ [" .. pos .. "] ���� ������ " .. n .. " x " .. GetItemName(item_id) .. "!")
		return
	end

	-- ���������, ��� � ������ ���� ����� � ���������
	if (GetChaFreeBagGridNum(role) == 0) then
		SystemNotice(role, "\194 \226\224\248\229\236 \232\237\226\229\237\242\224\240\229 \237\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224!")
		--SystemNotice(role, "� ����� ��������� ������������ �����!")
		return
	end

	-- ������� �������� �� ������
	if (n == number) then	
		-- ����� ������ ��� �������� �� ������
		table.remove(bank.items, p)
	else
		-- ����� ������ �� ��� �������� �� ������
		bank.items[p][ITEM_NUMBER] = n - number
	end

	-- ��������� ����
	UpdateBank(role, bank)

	-- ������ ������� ������
	local r1, r2 = MakeItem(role, item_id, number, 4)
	local MadeItem = GetChaItem(role, 2, r2)

	-- ������������� �������������� ��������
	SetItemAttr(MadeItem, ITEMATTR_VAL_STR, item[ITEM_STR])
	SetItemAttr(MadeItem, ITEMATTR_VAL_CON, item[ITEM_CON])
	SetItemAttr(MadeItem, ITEMATTR_VAL_AGI, item[ITEM_AGI])
	SetItemAttr(MadeItem, ITEMATTR_VAL_DEX, item[ITEM_DEX])
	SetItemAttr(MadeItem, ITEMATTR_VAL_STA, item[ITEM_STA])
	SetItemAttr(MadeItem, ITEMATTR_URE, item[ITEM_URE])
	SetItemAttr(MadeItem, ITEMATTR_MAXURE, item[ITEM_MAXURE])
	SetItemAttr(MadeItem, ITEMATTR_ENERGY, item[ITEM_ENEGRY])
	SetItemAttr(MadeItem, ITEMATTR_MAXENERGY, item[ITEM_MAXENERGY])
	SetItemForgeParam(MadeItem, 0, item[ITEM_FORGE0])
	SetItemForgeParam(MadeItem, 1, item[ITEM_FORGE1])

	-- ��������� ��������� ���������
	SynChaKitbag(role, 13)

	-- ��������� ������
	if (n == number) then	
		-- � ������ �� �������� ���������
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \231\224\225\240\224\235\232 \226\241\229 (" .. GetItemName(item_id) ..") x " .. number .. " \232\231 \255\247\229\233\234\232 [" .. pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \223\247\229\233\234\224 \242\229\239\229\240\252 \239\243\241\242\224\255.")
		--SystemNotice(role, "�� ������� ������� ��� (" .. GetItemName(item_id) ..") x " .. number .. " �� ������ [" .. pos .. "] ����� ����� �������! ������ ������ ������.")
	else
		-- � ������ ��� �������� ��������
		SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \226\231\255\235\232 (" .. GetItemName(item_id) ..") x " .. number .. " \232\231 \255\247\229\233\234\232 [" .. pos .. "] \225\224\237\234\224 \194\224\248\229\233 \227\232\235\252\228\232\232! \206\241\242\224\235\238\241\252 " .. (n - number) .. ".")
		--SystemNotice(role, "�� ������� ����� (" .. GetItemName(item_id) ..") x " .. number .. " �� ������ [" .. pos .. "] ����� ����� �������! �������� " .. (n - number) .. ".")
	end

end

-- ������ ������ ����� ������� � ����� �������
function GiveAccess(role, level, bank, cha_name)
	cha_name = string.lower(cha_name)

	-- ���������, ��� ����� ����� �������
	local role_id = GetRoleID(role)
	if(role_id ~= bank.leader_id) then
		SystemNotice(role, "\196\224\237\237\238\229 \228\229\233\241\242\226\232\229 \228\238\241\242\243\239\237\238 \242\238\235\252\234\238 \235\232\228\229\240\243 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "������ �������� �������� ������ ������ �������!")
		return
	end

	-- ��������� ����� ����� ���������
	local length = string.len(cha_name)
	if ((length < 1) or (length > 16)) then
		SystemNotice(role, "\196\235\232\237\224 \232\236\229\237\232 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\224 \225\251\242\252 \238\242 1 \228\238 16 \241\232\236\226\238\235\238\226!")
		--SystemNotice(role, "����� ����� ��������� ������ ���� �� 1 �� 16 ��������!")
		return
	end

	-- ��������� ��� ����� ���� ��������� ������� �������
	if ((level < 1) or (level > 3)) then
		SystemNotice(role, "\211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \236\238\230\229\242 \225\251\242\252 1, 2, 3!")
		--SystemNotice(role, "������� ������� ����� ���� 1, 2, 3!")
		return
	end

	-- ������� ������ ���� ����� ������� ������� ������� �������
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]), 1 do
			if (cha_name == bank.access[i][j]) then
				table.remove(bank.access[i], j)
				SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \225\251\235 " .. i .. " \211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 (" .. guild_bank_access_desc[i] ..").")
				--SystemNotice(role, "� ��������� (" .. cha_name ..") ��� " .. i .. " ������� ������� � ����� ������� (" .. guild_bank_access_desc[i] ..").")
				break
			end
		end
	end

	-- ������ ������ ������
	table.insert(bank.access[level], cha_name)

	-- ��������� ���� �������
	UpdateBank(role, bank)

	-- ����� ��������� ������
	SystemNotice(role, "\194\251 \226\251\228\224\235\232 \239\229\240\241\238\237\224\230\243 (" .. cha_name ..") " .. level .. " \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 (" .. guild_bank_access_desc[level] ..").")
	--SystemNotice(role, "�� ������ ��������� (" .. cha_name ..") " .. level .. " ������� ������� � ����� ������� (" .. guild_bank_access_desc[level] ..").")

end

-- ������� � ������ ����� ������� � ����� �������
function TakeAccess(role, bank, cha_name)
	cha_name = string.lower(cha_name)
	-- ���������, ��� ����� ����� �������
	local role_id = GetRoleID(role)
	if(role_id ~= bank.leader_id) then
		SystemNotice(role, "\196\224\237\237\238\229 \228\229\233\241\242\226\232\229 \228\238\241\242\243\239\237\238 \242\238\235\252\234\238 \235\232\228\229\240\243 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "������ �������� �������� ������ ������ �������!")
		return
	end

	-- ��������� ����� ����� ���������
	local length = string.len(cha_name)
	if ((length < 1) or (length > 16)) then
		SystemNotice(role, "\196\235\232\237\224 \232\236\229\237\232 \239\229\240\241\238\237\224\230\224 \228\238\235\230\237\224 \225\251\242\252 \238\242 1 \228\238 16 \241\232\236\226\238\235\238\226!")
		--SystemNotice(role, "����� ����� ��������� ������ ���� �� 1 �� 16 ��������!")
		return
	end

	-- ���� ������ � ������ �������
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]) do
			if (bank.access[i][j] == cha_name) then
				table.remove(bank.access[i], j)
				UpdateBank(role, bank)

				SystemNotice(role, "\194\251 \231\224\225\240\224\235\232 \228\238\241\242\243\239 \234 \225\224\237\234\243 \227\232\235\252\228\232\232 \243 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..")! \211 \237\229\227\238 \225\251\235 " .. i .. " \243\240\238\226\229\237\252 \228\238\241\242\243\239\224 (" .. guild_bank_access_desc[i] ..").")
				--SystemNotice(role, "�� ������� ������ � ����� ������� � ��������� (" .. cha_name ..")! � ���� ��� " .. i .. " ������� ������� (" .. guild_bank_access_desc[i] ..").")
				
				return
			end
		end
	end


	-- ���������� ��������� ������ ��� �������� �� ������
	SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \237\229\242 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\228\232\232!")
	--SystemNotice(role, "� ��������� (" .. cha_name ..") ��� ������� � ����� �������!")

end

-- ��������� ������� ������� ���������
function GetAccess(bank, cha_name)
	cha_name = string.lower(cha_name)
	--for i = 1, table.getn(bank.access), 1 do
	--	Notice("Level " .. i .. ":")
	--	for j = 1, table.getn(bank.access[i]), 1 do
	--		Notice(bank.access[i][j])
	--	end
	--end
	for i = 1, table.getn(bank.access), 1 do
		for j = 1, table.getn(bank.access[i]), 1 do
			if (cha_name == bank.access[i][j]) then
				return i
			end
		end
	end

	return 0

end

-- ���������� ������� ������� ���������
function ShowAccess(role, bank, cha_name)

	local level = GetAccess(bank, cha_name)
	if (level > 0) then
		SystemNotice(role, "\211\240\238\226\229\237\252 \228\238\241\242\243\239\224 \239\229\240\241\238\237\224\230\224 (" .. cha_name .."): " .. level .. " (" .. guild_bank_access_desc[level] ..").")
		--SystemNotice(role, "������� ������� ��������� (" .. cha_name .."): " .. level .. " (" .. guild_bank_access_desc[level] ..").")
	else
		SystemNotice(role, "\211 \239\229\240\241\238\237\224\230\224 (" .. cha_name ..") \237\229\242 \228\238\241\242\243\239\224 \234 \225\224\237\234\243 \227\232\235\252\232\232.")
		--SystemNotice(role, "� ��������� (" .. cha_name ..") ��� ������� � ����� ������.")
	end

end

-- ��������� ���� �� �����
function LoadGuildBank(role)

	-- ��������� ���� �������
	local guild_id = GetChaGuildID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "r")
	if (file == nil) then
		SystemNotice(role, "\193\224\237\234 \227\232\235\252\228\232\232 \226\240\229\236\229\237\237\238 \237\229\228\238\241\242\243\239\229\237, \238\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243! \202\238\228 \238\248\232\225\234\232 1.")
		--SystemNotice(role, "���� ������� �������� ����������, ���������� � ��������������! ��� ������ 1.")
		return nil
	end

	-- ������ ������ �� �����
	local raw_bank = file:read("*all")
	file:close()
	if (raw_bank == "") then
		SystemNotice(role, "\193\224\237\234 \227\232\235\252\228\232\232 \226\240\229\236\229\237\237\238 \237\229\228\238\241\242\243\239\229\237, \238\225\240\224\242\232\242\229\241\252 \234 \224\228\236\232\237\232\241\242\240\224\242\238\240\243! \202\238\228 \238\248\232\225\234\232 2.")
		--SystemNotice(role, "���� ������� �������� ����������, ���������� � ��������������! ��� ������ 2.")
		return nil
	end

	return String2Bank(raw_bank)

end

-- �������� ���� �����
function UpdateBank(role, bank)

	if (HasGuild(role) == 0) then
		return
	end

	local guild_id = GetChaGuildID(role)
	local file = io.open("GuildBank/bank_" .. guild_id .. ".dat", "w+")
	local raw_bank = Bank2String(bank)
	file:write(raw_bank)
	file:close()

end

-- ��������� ��� ����� ��������� � ����������� �������
function IsInBankArea(role)

	-- ���������, ��� �������� ��������� �� ����������� �����
	local cha_map = GetChaMapName(role)
	if (guild_bank_map[cha_map] == nil) then
		return 0
	end

	-- ���������, ��� �������� ��������� � ����������� �������
	local area_arr = guild_bank_map[cha_map]
	local x, y = GetChaPos(role)
	x = math.floor(x / 100)
	y = math.floor(y / 100)

	for i = 1, table.getn(area_arr), 1 do
		local x0, y0 = area_arr[i][1], area_arr[i][2]
		local x1, y1 = area_arr[i][3], area_arr[i][4]

		if ((x >= x0 and x <= x1) and (y >= y0 and y <= y1)) then
			return 1
		end
	end

	return 0

end

--------------------------------------------------------------------------------
-- ������� ���������
--------------------------------------------------------------------------------

-- ������ ����� �������
function ItemUse_GuildBankStone(role, Item)

	-- ���������, ��� �������� � �������
	if (HasGuild(role) == 0) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "�� ������ ���� ������� �������, ����� ������������ ������ ����� �������!")
		UseItemFailed(role)
		return
	end

	-- �������� ���� �������
	local Bank = LoadGuildBank(role)
	if (Bank == nil) then
		SystemNotice(role, "\194 \228\224\237\237\251\233 \236\238\236\229\237\242 \237\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "� ������ ������ ���������� ������������ ������ ����� �������!")
		UseItemFailed(role)
		return
	end

	-- ��������� ��� �������� ����� �������
	if (GetRoleID(role) ~= Bank.leader_id) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "�� ������ ���� ������� �������, ����� ������������ ������ ����� �������!")
		UseItemFailed(role)
		return
	end
	
	-- ��������, ��� ���� ��� �����������
	if (Bank.activated == 1) then
		SystemNotice(role, "\193\224\237\234 \194\224\248\229\233 \227\232\235\252\228\232\232 \243\230\229 \224\234\242\232\226\232\240\238\226\224\237!")
		--SystemNotice(role, "���� ����� ������� ��� �����������!")
		UseItemFailed(role)
		return
	end

	-- ���������� ���� �������
	Bank.activated = 1

	-- ��������� ���� �������
	UpdateBank(role, Bank)

	-- ����� ��������� ������
	SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \224\234\242\232\226\232\240\238\226\224\235\232 \225\224\237\234 \227\232\235\252\228\232\232!")
	--SystemNotice(role, "�� ������� ������������ ���� �������!")

end

-- ������ ���������� ����� �������
function ItemUse_GuildBankUp(role, Item)

	-- ���������, ��� �������� � �������
	if (HasGuild(role) == 0) then
		SystemNotice(role, "\194\251 \228\238\235\230\237\251 \225\251\242\252 \235\232\228\229\240\238\236 \227\232\235\252\228\232\232, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "�� ������ ���� ������� �������, ����� ������������ ������ ���������� ����� �������!")
		UseItemFailed(role)
		return
	end

	-- �������� ���� �������
	local Bank = LoadGuildBank(role)
	if (Bank == nil) then
		SystemNotice(role, "\194 \228\224\237\237\251\233 \236\238\236\229\237\242 \237\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \225\224\237\234\224 \227\232\235\252\228\232\232!")
		--SystemNotice(role, "� ������ ������ ���������� ������������ ������ ���������� ����� �������!")
		UseItemFailed(role)
		return
	end

	-- ��������� ��� �������� ����� �������
	if (GetRoleID(role) ~= Bank.leader_id) then
		SystemNotice(role, "�� ������ ���� ������� �������, ����� ��������� ���������� ����� � ����� �������!")
		--SystemNotice(role, "�� ������ ���� ������� �������, ����� ������������ ������ ���������� ����� �������!")
		UseItemFailed(role)
		return
	end

	-- ��������� ������ �����
	if (Bank.size >= MAX_BANK_SIZE) then
		SystemNotice(role, "\193\224\237\234 \194\224\248\229\233 \227\232\235\252\228\232\232 \232\236\229\229\242 \236\224\234\241\232\236\224\235\252\237\238\229 \234\238\235\232\247\229\241\242\226\238 \255\247\229\229\234!")
		--SystemNotice(role, "���� ����� ������� ����� ������������ ���������� �����!")
		UseItemFailed(role)
		return
	end

	-- ��������� 3 ������
	local cell_add = 3
	local dif = MAX_BANK_SIZE - Bank.size

	if (dif > cell_add) then
		Bank.size = Bank.size + cell_add
	else
		Bank.size = Bank.size + diff
	end

	-- ��������� ���� �������
	UpdateBank(role, Bank)

	-- ����� ��������� ������
	SystemNotice(role, "\194\251 \243\241\239\229\248\237\238 \240\224\241\248\232\240\232\235\232 \225\224\237\234 \227\232\235\252\228\232\232! \210\229\239\229\240\252 \229\227\238 \240\224\231\236\229\240 " .. Bank.size .. " \255\247\229\229\234.")
	--SystemNotice(role, "�� ������� ��������� ���� �������! ������ ��� ������ " .. Bank.size .. " �����.")

end

--------------------------------------------------------------------------------
-- ��������������� �������
--------------------------------------------------------------------------------

-- �������� ������� �� �������� ������
function trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- ������� ������ �� �����������
function explode(separator, str)
    local pos, arr = 0, {}
    for st, sp in function() return string.find(str, separator, pos, true) end do
        table.insert(arr, string.sub(str, pos, st-1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end

-- ������� ������ �� ������� � ������������
function implode(separator, arr)
	return table.concat(arr, separator)
end

--------------------------------------------------------------------------------
-- ����
--------------------------------------------------------------------------------
DeductGuildItem_original = DeductGuildItem
DeductGuildItem = AfterGuildCreate
HandleChat_original = HandleChat
HandleChat = GuildHandleChat

--------------------------------------------------------------------------------
-- ������������ ����������� ������ ����
--------------------------------------------------------------------------------
chat_guild_bank_cmd["\215\242\238\194\225\224\237\234\229"] = {access = 3, func = Cmd_ShowBank}
chat_guild_bank_cmd["\207\238\235\238\230\232\242\252\194\225\224\237\234"] = {access = 2, func = Cmd_PushItem}
chat_guild_bank_cmd["\194\231\255\242\252\200\231\193\224\237\234\224"] = {access = 1, func = Cmd_PopItem}
chat_guild_bank_cmd["\215\242\238\194\255\247\229\233\234\229"] = {access = 3, func = Cmd_ShowCell}
chat_guild_bank_cmd["\196\224\242\252\196\238\241\242\243\239"] = {access = 0, func = Cmd_GiveAccess}
chat_guild_bank_cmd["\199\224\225\240\224\242\252\196\238\241\242\243\239"] = {access = 0, func = Cmd_TakeAccess}
chat_guild_bank_cmd["\211\240\238\226\229\237\252\196\238\241\242\243\239\224"] = {access = 0, func = Cmd_ShowAccess}
chat_guild_bank_cmd["\207\238\236\238\249\252\193\224\237\234"] = {access = 3, func = Cmd_Help}