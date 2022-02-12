print("Loading lonetower.lua")

local ext = {};
ext.title = 'Lonetower Instance';
ext.author = 'xtc';
-- kmlor031[at]gmail[dot]com
-----------------------------------------------------------
-- Please do not redistribute or claim/delete ownership!!!
-- Credits: WPO
-- Credits: MaTT@serverdev.net for hook library
-- Required File: 
--			* serialize.lua (http://lua-users.org/wiki/TableSerialization)
--			* hook.lua
-- Support: TXT files
-- Compatibility: windows OS | LUA 5.0 | sfiles 1.3X-2.4
-- Discription: 
--			* Lone Tower composes of 6 waves
--			* Upon completing each wave will grant "PARTY" rewards
--			* Each Party having seperate assigned map copy
--			* Each floor resembles per wave.
--			* 5min starting duration (maxmin)
-- ChangeLogs:
ext.version = '1.0' --------------------------------------
--			= Regrouped Mobs by wave
ext.version = '1.1' --------------------------------------
--     		= Added Command to check Kill Count
--          = Hooked so that mobs doesn't DROP anything
--          = Looped Triggers manually
ext.version = '1.2' --------------------------------------
--     		= Hooked map_run function 
--          = Manually Add Hooks to AddHelpNpc.lua
ext.version = '1.3' --------------------------------------
--     	 	= Created Registration NPC
--          = ADDED .TXT Database so players can only register once a day
--          = NPC Functions
--          = Remove lonetower mobs from mlist manually
ext.version = '1.4' --------------------------------------
--			= Give all LT mob (x3 HP)
ext.version = '1.5' --------------------------------------
--			= Map data will not be erased when using updateall
--			= Nil Drop formated
ext.version = '1.6' --------------------------------------
--			= command to clear data (&lua ltdbclear = true)
--			= automatically create database folder
--			= fix single party teleportation
--			= Party members (dead) do not advance to next level
--			= Party members (dead) do not receive rewards
--			= pkm Display patched
--			= clear monster when first enter map
ext.version = '1.7' -------------------------------------- (01.03.16)
--			= Automatic clean map when all members die
--			= distance variable
--			= fixed msg system (bugged on Sundays)
--			= code optimization (removed open[])
ext.version = '1.8' --------------------------------------
--			= configured how many times can enter per week
--			= fixed random teleportation of Party leader
--			= number of map_copies
--			= erase contents in swhports and mlist
--			= remove party dead when transporting to new level (TODO)
ext.version = '1.9' -------------------------------------- (01.06.16)
--			= fix map data clearning (LoneInst.mapAssign and CloseMapCopy)
print('Loading '..ext.title..' v'..ext.version..' (by '..ext.author..')')
if table.load == nil then print('serialize.lua cannot be found!'); end
-----------------------------------------------------------
if LoneInst == nil then LoneInst = {}; else LoneInst.HOOKS(); end
	-- Configurations
	LoneInst.conf 	= {
		maxwave 	= 6,										-- Number of waves
		prepare 	= 30,										-- Prepare Countdown time
		maxmin		= 5 * 60,									-- Numbers in minutes of each wave
		maxcopy 	= 4,										-- Number of possible map_copies
		member 		= 2,										-- number of teams members required to enter
		closing 	= 15,
		closeshow	= {1,2,3,4,5,6,7,8,9,10,30,45,60,120,180,240,300,360,420,480,540,600,660,720,780,840,900},
		minlv		= 1000,										-- Minimum level to enter
		openday		= {0,1,2,3,4,5,6},							-- days that are open
		openhour 	= {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21},					-- hours that are open
		distance	= 1500,										-- The distance party members must be within the NPC
		mob 		= {},
		prize 		= {
			perwave = {id = 7720, qty = 3, gold = 100000},		-- prizes per wave
			lastwave= {id = 7655, qty = 10, gold = 500000}		-- prizes on final wave
		}
	};
	LoneInst.map 	= 'lonetower';
	LoneInst.path = GetResPath(LoneInst.map..'/cache/');
	
	-- Auto create database folder
	local function getDir(sPath)
		if type(sPath) ~= "string" then return false end
		local response = os.execute("cd "..sPath)
		return response == 0
	end
	if not getDir(LoneInst.path) then
		os.execute("mkdir \""..LoneInst.path.."\"")
	end
	-- LoneInst.delDb = function() os.execute("del \""..LoneInst.path.."\"") end
	LoneInst.delDb = function() os.remove(LoneInst.path..'/*.dat/'); end

	LoneInst.mapData = function()
		if LoneInst.mapcount == nil then LoneInst.mapcount = 0; end
		if LoneInst.mapAssign == nil then LoneInst.mapAssign = {}; end
	end
	LoneInst.mapData();

	-- Format: {id = monsterId, qty = numberOfMonsters}
	LoneInst.conf['mob'] = {
		-- Wave 1:
		{{id = 523, qty = 12},	{id = 524, qty = 12},	{id = 525, qty = 10},	{id = 36, qty = 8}},
		-- Wave 2:
		{{id = 526, qty = 15},	{id = 35, qty = 15},	{id = 527, qty = 15},	{id = 529, qty = 15}},
		-- Wave 3:
		{{id = 531, qty = 26},	{id = 533, qty = 26},	{id = 532, qty = 25},	{id = 509, qty = 16}},
		-- Wave 4:
		{{id = 534, qty = 25},	{id = 557, qty = 22},	{id = 550, qty = 24}},
		-- Wave 5:
		{{id = 554, qty = 23},	{id = 553, qty = 24},	{id = 559, qty = 24}},
		-- Final Wave
		{{id = 1244, qty = 1}}
	};
	
	-- Merchant
	LoneInst.EXCHANGER = function()
		LoneInst.shop = {}
		LoneInst.shop[1] = {id = 4019, qty = 3, currency = 3493, price = 5} 	-- CODFISH
		LoneInst.shop[2] = {id = 3885, qty = 1, currency = 3493, price = 5} 	-- REF
		LoneInst.shop[3] = {id = 7519, qty = 15, currency = 3493, price = 10}	-- F-Card
		LoneInst.shop[4] = {id = 6664, qty = 1, currency = 3493, price = 25}	-- LV75 RING VOUCH
		LoneInst.shop[5] = {id = 7417, qty = 1, currency = 3493, price = 50}
		LoneInst.shop[6] = {id = 7418, qty = 1, currency = 3493, price = 15}
		local a = table.getn(ChangeItemList)
		for i,v in pairs(LoneInst.shop) do
			a = a + 1;
			ChangeItemList[a] = {v.currency, v.price, v.id, v.qty}
		end
	end
	LoneInst.EXCHANGER();
	
-----------------------------------------------------------
-- Below are the no-touch zones if you do not know
-- what you are doing!!!
-----------------------------------------------------------
	LoneInst.hook = { pkm = GetExp_PKM };
	if LoneInst.data == nil then LoneInst.data = {}; end
	
	LoneInst.birthbywave = {'LoneInstance 1','LoneInstance 2','LoneInstance 3','LoneInstance 4','LoneInstance 5','LoneInstance 6'}
	
	LoneInst.AddBirth = function()
		AddBirthPoint("LoneInstance Admin", garner, 730,1590);
		AddBirthPoint(LoneInst.birthbywave[1], LoneInst.map, 352,374);
		AddBirthPoint(LoneInst.birthbywave[2], LoneInst.map, 36,24);
		AddBirthPoint(LoneInst.birthbywave[3], LoneInst.map, 119,407);
		AddBirthPoint(LoneInst.birthbywave[4], LoneInst.map, 319,172);
		AddBirthPoint(LoneInst.birthbywave[5], LoneInst.map, 486,122);
		AddBirthPoint(LoneInst.birthbywave[6], LoneInst.map, 494,297);
	end
	LoneInst.AddBirth();

-- Required Functions
	DealAllChaInCopy = function(mp, f, ...)
		local ply_n = GetMapCopyPlayerNum(mp);
		local ps = {};
		local i = 1;
		BeginGetMapCopyPlayerCha(mp)
		for i = 1, ply_n, 1 do
			ps[i] = GetMapCopyNextPlayerCha(mp);
		end
		for i = 1, ply_n, 1 do
			if ps[i] ~= 0 and ps[i] ~= nil then
				_G[f](ps[i], unpack(arg))
			end
		end
	end

	ToClockFormat = function(sec)
		local num = tonumber(sec)
		if num == 0 then
			return "00:00:00";
		else
			now_hour = string.format("%02.f",math.floor(num / 3600 ))
			now_minute = string.format("%02.f",math.floor(num / 60 - (now_hour*60)))
			now_second = string.format("%02.f",math.floor(num - now_hour*3600 - now_minute*60))
			return now_hour..":"..now_minute..":"..now_second
		end
	end

	FileToArray = function(file)
		local f = io.open(file, "r")
		local arr = {}
		for line in f:lines() do
			table.insert(arr, line)
		end
		return arr
	end

	file_exists = function(name)
		local f = io.open(name, 'r')
		if(f ~= nil)then io.close(f) return true
		else return false
		end
	end
	
	function lonetower_map_tick(...)
		local old, map_copy = arg[1], arg[2]
		if GetMapCopyPlayerNum(map_copy) ~= 0 then
			if LoneInst.data[map_copy] == nil then
				-- Clear everything and initialize the wave instance
				ClearAllSubMapMonster(map_copy);
				LoneInst.InitCopy(map_copy);
			end
			-- prompt countdown to begin
			if LoneInst.data[map_copy].begin ~= nil then
				if LoneInst.data[map_copy].begin > 0 then
					DealAllChaInCopy(map_copy, 'BickerNotice', '\209\242\224\240\242 '..LoneInst.data[map_copy].begin..'!')
					LoneInst.data[map_copy].begin = LoneInst.data[map_copy].begin - 1
				end
				-- Start the spawning
				if LoneInst.data[map_copy].begin == 0 then
					LoneInst.InitWave(map_copy);
				end
			else
				-- Countdown time limit
				if LoneInst.data[map_copy].tick > 0 and LoneInst.data[map_copy].shutdown == nil then
					LoneInst.data[map_copy].tick = LoneInst.data[map_copy].tick - 1
				end
			end
			-- All players are dead
			if LoneInst.deadParty(map_copy) then
				-- Countdown to close
				--[[if LoneInst.data[map_copy].close == nil then
					LoneInst.data[map_copy].close = os.time();
				end
				local cd = LoneInst.data[map_copy].close - os.time();
				if cd > 0 then
					DealAllChaInCopy(map_copy, 'BickerNotice', 'The Lone Tower is collapsing in: '..cd..'!');
				else
					LoneInst.closecopy(map_copy);
				end ]]
				LoneInst.closecopy(map_copy);
			else
				-- Normal map tick
				DealAllActivePlayerInMap(map_copy, 'RemoveSoloCha')
				LoneInst.mapTick(map_copy);
				LoneInst.mapClear(map_copy);
			end
		else
			LoneInst.closecopy(map_copy)
		end
	end

	LoneInst.InitCopy = function(map_copy)
		LoneInst.data[map_copy] = {
			wave	= 0,
			tick	= nil,
			begin	= LoneInst.conf['prepare'],
			id		= {}
		};
	end

	LoneInst.InitWave = function(map_copy)
		if LoneInst.data[map_copy].tick == nil then
			for i = 1, table.getn(LoneInst.conf['mob'][1]) do
				LoneInst.data[map_copy].id[LoneInst.conf['mob'][1][i].id] = 0;
			end
			LoneInst.data[map_copy].tick = LoneInst.conf['maxmin'];
		else
			LoneInst.data[map_copy].tick = LoneInst.data[map_copy].tick + LoneInst.conf['maxmin'];
		end
		LoneInst.data[map_copy].begin = nil;
		LoneInst.data[map_copy].wave = LoneInst.data[map_copy].wave + 1;
		DealAllChaInCopy(map_copy, 'BickerNotice', '\194\238\235\237\224: 0'..LoneInst.data[map_copy].wave..' \194\240\229\236\255 \228\238 \231\224\234\240\251\242\232\255 \253\242\224\230\224 '..ToClockFormat(LoneInst.data[map_copy].tick))
		LoneInst.spawn(map_copy);
	end

	LoneInst.mapTick = function(map_copy)
		if LoneInst.data[map_copy].tick > 0 then
			DealAllActivePlayerInMap(map_copy, 'TowerAdvance')
			for i = 1, table.getn(LoneInst.conf['closeshow']) do
				if LoneInst.data[map_copy].tick == LoneInst.conf['closeshow'][i] then
					DealAllChaInCopy(map_copy, 'BickerNotice', '\194\240\229\236\229\237\232 \238\241\242\224\235\238\241\252 '..ToClockFormat(LoneInst.data[map_copy].tick)..'!')
				end
			end
		else
			LoneInst.closecopy(map_copy)
		end
	end

	LoneInst.closecopy = function(map_copy)
		DealAllChaInCopy(map_copy, 'SystemNotice', '\202 \241\238\230\224\235\229\237\232\254 \226\224\236 \237\229 \243\228\224\235\238\241\252 \239\240\238\233\242\232 \226\241\229 \253\242\224\230\232.. ')
		LoneInst.data[map_copy] = nil;
		--LoneInst.mapAssign[map_copy] = nil;
		--01.06.15
		LoneInst.mapAssign[GetMapCopyID2(map_copy)] = nil;
		ClearAllSubMapCha(map_copy);
		ClearAllSubMapMonster(map_copy);
		--CloseMapCopy(LoneInst.map);
		CloseMapCopy(LoneInst.map, GetMapCopyID2(map_copy));
	end

	LoneInst.clearTime = function(map_copy)
		local total = LoneInst.conf['maxwave'] * LoneInst.conf['maxmin'];
		local used = LoneInst.data[map_copy].tick
		return total - used;
	end

	LoneInst.giveReward = function(cha, wave)
		if wave == LoneInst.conf['maxwave'] then
			local cg = GetChaFreeBagGridNum(cha)
			if cg <= 0 then
				GiveItemX(cha, 0, LoneInst.conf['prize'].lastwave.id, LoneInst.conf['prize'].lastwave.qty, 4)
				SystemNotice(cha, "Inventory Full added rewards to Temporary Bag")
			else
				GiveItem(cha, 0, LoneInst.conf['prize'].lastwave.id, LoneInst.conf['prize'].lastwave.qty, 4)
			end
		else
			local cg = GetChaFreeBagGridNum(cha)
			if cg <= 0 then
				GiveItemX(cha, 0, LoneInst.conf['prize'].perwave.id, LoneInst.conf['prize'].perwave.qty, 4)
				SystemNotice(cha, "Inventory Full added rewards to Temporary Bag")
			else
				GiveItem(cha, 0, LoneInst.conf['prize'].perwave.id, LoneInst.conf['prize'].perwave.qty, 4)
			end
		end
	end

	LoneInst.canAdvance = function(map_copy)
		local c = 0;
		for i,v in pairs(LoneInst.conf['mob'][LoneInst.data[map_copy].wave]) do
		if (LoneInst.data[map_copy].id[v.id]) >= v.qty then
			c = c + 1;
			end
		end
		if c == table.getn(LoneInst.conf.mob[LoneInst.data[map_copy].wave]) then
			return 1;
		end
		return 0;
	end

	LoneInst.mapClear = function(map_copy)
		if LoneInst.data[map_copy].shutdown ~= nil then
			if LoneInst.data[map_copy].shutdown > 0 then
				for i = 1, table.getn(LoneInst.conf['closeshow']) do
					if LoneInst.data[map_copy].shutdown == LoneInst.conf['closeshow'][i] then
						MapCopyNotice(map_copy, 'Map service time has expired,closing in '..LoneInst.data[map_copy].shutdown..' secs.');
					end
				end
				LoneInst.data[map_copy].shutdown = LoneInst.data[map_copy].shutdown - 1;
			end
			if LoneInst.data[map_copy].shutdown == 0 then
				DealAllChaInCopy(map_copy, 'MoveCity', 'LoneInstance Admin');
				LoneInst.closecopy(map_copy);
			end
		end
	end
	
	LoneInst.deadParty = function(map_copy)
		local mpCha = GetMapCopyPlayerNum(map_copy);
		local ps = {};
		local i = 1;
		BeginGetMapCopyPlayerCha(map_copy);
		for i = 1, mpCha do
			ps[i] = GetMapCopyNextPlayerCha(map_copy);
		end
		local a = 0;
		for i = 1, mpCha do
			if Hp(ps[i]) <= 0 then
				a = a + 1;
			end
		end
		if a == mpCha then return true; end
		return false
	end

	function TowerAdvance(cha)
		local map_copy = GetChaMapCopy(cha)
		if CheckMonsterDead(cha) == 0 then
			if LoneInst.data[map_copy] ~= nil then
				if LoneInst.canAdvance(map_copy) == 1 then
					if LoneInst.data[map_copy].wave == LoneInst.conf['maxwave'] then
						if LoneInst.data[map_copy].shutdown == nil then
							LoneInst.giveReward(cha, LoneInst.data[map_copy].wave);
							LoneInst.data[map_copy].shutdown = 60;
						end
					else
						LoneInst.giveReward(cha, LoneInst.data[map_copy].wave);
						SystemNotice(cha, 'Completed: '..LoneInst.data[map_copy].wave..' / '..LoneInst.conf['maxwave']..' Waves!')
						LoneInst.data[map_copy].wave = LoneInst.data[map_copy].wave + 1
						LoneInst.data[map_copy].tick = LoneInst.data[map_copy].tick + LoneInst.conf['maxmin']
						-- MoveCity(cha, LoneInst.birthbywave[LoneInst.data[map_copy].wave])
						DealAllChaInCopy(map_copy, 'MoveCity', LoneInst.birthbywave[LoneInst.data[map_copy].wave]);
						LoneInst.spawn(map_copy)
						BickerNotice(cha, 'Wave: '..LoneInst.data[map_copy].wave..' Time Limit: '..ToClockFormat(LoneInst.data[map_copy].tick))
						for i = 1, table.getn(LoneInst.conf['mob'][LoneInst.data[map_copy].wave]) do
							LoneInst.data[map_copy].id[LoneInst.conf['mob'][LoneInst.data[map_copy].wave][i].id] = 0
						end
					end
				end
			end
		end
	end

	function RemoveSoloCha(cha)
		if IsInTeam(cha) == 0 then
			MapCopyNotice(GetChaMapCopy(cha), '\200\227\240\238\234: '..GetChaDefaultName(cha)..' \239\238\234\232\237\243\235 \238\242\240\255\228,\226\238\231\226\240\224\249\224\229\236 \226\224\241 \226 \227\238\240\238\228 ')
			MoveCity(cha, '')
		end
	end

	-- Hooks
	GetExp_PKM = function(dead, atk)
		LoneInst.hook['pkm'](dead, atk)
		local map_copy = GetChaMapCopy(atk)
		local cha = {atk, GetTeamCha(atk, 0), GetTeamCha(atk, 1), GetTeamCha(atk, 2), GetTeamCha(atk, 3)}
		if GetChaMapName(atk) == LoneInst.map then
			if LoneInst.data[map_copy] ~= nil then
				if LoneInst.data[map_copy].id[GetChaID(dead)] ~= nil then
					LoneInst.data[map_copy].id[GetChaID(dead)] = LoneInst.data[map_copy].id[GetChaID(dead)] + 1
					local qtyc = 0;
					for i,v in pairs(LoneInst.conf.mob[LoneInst.data[map_copy].wave]) do
						if GetChaID(dead) == v.id then
							qtyc = v.qty
						end
					end
					if qtyc ~= 0 then
						PartyNotice(cha, '['..GetChaDefaultName(dead)..'] \211\225\232\242\238: '..LoneInst.data[map_copy].id[GetChaID(dead)]..' / '..qtyc..'!', PARTY_BICKER)
					end
				end
			end
		end
	end

	TowerOpen = {Day = {}, Hour = {}}
	LoneInst.SetOpen = function()
		for i,v in pairs(LoneInst.conf['openday']) do TowerOpen.Day[v] = true; end
		for i,v in pairs(LoneInst.conf['openhour']) do TowerOpen.Hour[v] = true; end
	end
	LoneInst.SetOpen();

	LoneInst.IsOpen = function()
		local nowDay = tonumber(os.date('%w'));
		local nowHr = tonumber(os.date('%H'));
		if TowerOpen.Hour[nowHr] and TowerOpen.Day[nowDay] then
			return true;
		end
		return false;
	end

	if npc_timer ~= nil then
		LoneInst.hook['timer'] = npc_timer;
		--
		npc_timer = function(...)
			LoneInst.hook['timer'](unpack(arg))
			local npc,freq,time = arg[1],arg[2],arg[3];
			if LoneInst.IsOpen() then
				local npcName = GetChaDefaultName(npc);
				if npcName == 'Newbie Guide - Senna' then
					local tick = GetChaParam(npc, 1);
					if math.mod(tick, 10*60) == 0 and tick > 0 then
						Notice('The Lone Tower Instance is open. Prepare your party and register at (729,1590), Thunderia @ [Tower Guard Shen]!');
					end
				end
			end
		end
	end

	LoneInst.HOOKS = function()
		if _G['map_copy_run_'..LoneInst.map] == nil then
			_G['map_copy_run_'..LoneInst.map] = function(map_copy)
			end
		end
		Hook:AddPostHook('map_copy_run_'..LoneInst.map, lonetower_map_tick, 1);
	end

	LoneInst.addHOOKS = function(str)
		local file = GetResPath('/script/help/AddHelpNPC.lua');
		local index = FileToArray(file);
		local r = 0
		for i = 1, table.getn(index) do
			if index[i] ~= tostring(str) then
				r = r + 1;
			end
		end
		if r == table.getn(index) then 
			local LF = io.open(file, 'a');
			LF:write('\n');
			LF:write(tostring(str));
			LF:close();
		end
	end
	LoneInst.addHOOKS('LoneInst.HOOKS()');

	-- Npc Functions
	if PartyNotice == nil then
		PARTY_HELP		= 1;
		PARTY_SYSTEM	= 2;
		PARTY_BICKER	= 3;
		-- Function
		PartyNotice = function(players, notice, mtype)
			mtype = mtype or 2;
			for i = 1, table.getn(players), 1 do
				if Hp(players[i]) ~= 0 then
					mtype = tonumber(mtype);
					if(mtype == PARTY_HELP)then
						HelpInfo(players[i], 0, notice)
					elseif(mtype == PARTY_SYSTEM)then
						SystemNotice(players[i], notice)
					elseif(mtype == PARTY_BICKER)then
						BickerNotice(players[i], notice)
					end
				end
			end
		end
	end

	function table.getmin(arr)
		local n;
		if n == nil then n = arr[1]; end
		for m = 1, table.getn(arr) do
			if arr[m] < n then
				n = arr[m];
			end
		end
		return n;
	end

	LoneInst.teamCount = function(team)
		local ret = 0;
		for i,v in pairs(team) do
			ret = ret + 1;
		end
		return ret;
	end

	LoneInst.teamLv = function(team)
		local ret = 0;
		for i = 1, table.getn(team) do
			if Lv(team[i]) >= LoneInst.conf['minlv'] then
				ret = ret + 1;
			end
		end
		if ret == table.getn(team) then
			return 1;
		end
		return 0;
	end

	LoneInst.createDB = function(dbfile)
		if not file_exists(LoneInst.path..dbfile) then
			local f = io.open(LoneInst.path..dbfile, 'a')
			table.save({}, LoneInst.path..dbfile)
			f:close()
		end
	end

	LoneInst.addVisit = function(team)
		local date = tonumber(os.date('%j'));
		local t = table.load(LoneInst.path..tostring(date)..'.dat');
		for i = 1, table.getn(team) do
			t[GetChaDefaultName(team[i])] = 1;
		end
		table.save(t, LoneInst.path..date..'.dat')
	end

	LoneInst.getChaDB = function(cha)
		local date = tonumber(os.date('%j'));
		date = tostring(date);
		LoneInst.createDB(date..'.dat');
		local t = table.load(LoneInst.path..date..'.dat');
		local chaName = GetChaDefaultName(cha);
		if t[chaName] ~= nil then
			return t[chaName];
		end
		return 0;
	end

	LoneInst.checkDB = function(team)
		local valid = 0;
		for i = 1, table.getn(team) do
			if LoneInst.getChaDB(team[i]) == 0 then
				valid = valid + 1;
			end
		end
		if valid == table.getn(team) then
			return 1;
		end
		return 0;
	end

	LoneInst.inRegion = function(team)
		local valid = 0;
		local mapName = GetChaMapName(team[1]);
		for i = 1, table.getn(team) do
			if GetChaMapName(team[i]) == mapName then
				valid = valid + 1;
			end
		end
		if valid == table.getn(team) then
			return 1;
		end
		return 0;
	end

	LoneInst.isNearby = function(cha, team)
		local ret = 0;
		for i,v in pairs(team) do
			if get_distance(cha, v) <= LoneInst.conf['distance'] then
				ret = ret + 1;
			end
		end
		if ret == table.getn(team) then
			return 1;
		end
		return 0;
	end

	LoneInst.getDay = function(num)
		num = tonumber(num);
		local dayname = {'Monday','Tuseday','Wednesday','Thursday','Friday','Saturday'};
		-- this was the bug
		dayname[0] = 'Sunday';
		return dayname[num];
	end

	function RegLoneInst(role)
		-- Check if have enough team members
		local team = {role,GetTeamCha(role, 0),GetTeamCha(role, 1),GetTeamCha(role, 2),GetTeamCha(role, 3)};
		--local open = { day = {}, hour = {} };
		--for i,v in pairs(LoneInst.conf['openday']) do
			--open.day[v] = true;
		--end
		-- Check if Instance is open today
		local nowDay = tonumber(os.date('%w'));
		--if open.day[nowDay] == nil then
		if not TowerOpen.Day[nowDay] then
			--SystemNotice(role, 'The Lone Tower Instance isn\'t open today! Please try again tomorrow...');
			PartyNotice(team, 'The Lone Tower Instance isn\'t open today! Please try again tomorrow...');
			return 0;
		end
		--for i,v in pairs(LoneInst.conf['openhour']) do
			--open.hour[v] = true;
		--end
		-- Check if Instance is open this hour
		local nowHr = tonumber(os.date('%H'));
		if not TowerOpen.Hour[nowHr] then
		--if open.hour[nowHr] == nil then
			--SystemNotice(role, 'The Lone Tower Instance is closed at this hour! Please try again later...');
			PartyNotice(team, 'The Lone Tower Instance is closed at this hour! Please try again later...');
			return 0;
		end
		-- Check if player is in a party
		if IsInTeam(role) == 0 then
			SystemNotice(role, 'You are not in a party! Unable to register!');
			return 0;
		end
		-- Check if player is the team leader
		if IsTeamLeader(role) == 0 then
			SystemNotice(role, 'You are not the party leader! Unable to register!');
			return 0;
		end
		if table.getn(team) < LoneInst.conf['member'] then
			PartyNotice(team, 'You must have atleast ['..LoneInst.conf['member']..'] members in your party!', 2);
			return 0;
		end
		-- Check for level requirements
		if LoneInst.teamLv(team) == 0 then
			PartyNotice(team, 'All members of party must be Level ['..LoneInst.conf['minlv']..'+]!', 2);
			return 0;
		end
		-- Check if Player has already been in Instance
		if LoneInst.checkDB(team) == 0 then
			PartyNotice(team, 'A party member(s) has already entered the Lone Tower today. Please try again...', 2);
			return 0;
		end
		-- Check if party members in the same map
		if LoneInst.inRegion(team) == 0 then
			PartyNotice(team, 'All party member(s) must be in the same Region!', 2);
			return 0;
		end
		if LoneInst.isNearby(role, team) == 0 then
			PartyNotice(team, 'All party member(s) must be gather around Tower Guard Shen!', 2);
			return 0;
		end
		-- Check if there is available map copy
		local proxy = {};
		for i = 1, LoneInst.conf['maxcopy'] do
			if LoneInst.mapAssign[i] == nil then
				table.insert(proxy, i);
			end
		end
		if table.getn(proxy) ~= 0 then
			local map_copy = table.getmin(proxy);
			LoneInst.mapAssign[map_copy] = true;
			LoneInst.addVisit(team);
			for i = 1, table.getn(team) do
				MoveCity(team[i], 'LoneInstance 1', map_copy);
			end
			return 1;
		else
			PartyNotice(team, 'All towers are currently being challenged! Please wait...', 2);
			return 0;
		end
	end

function r_talkLT01()
		local d = '';
		Talk(1, '\209\242\240\224\230\237\232\234: \203\232\248\252 \242\229,\234\242\238 \238\225\252\229\228\229\237\232\242\252\241\255 \241\236\238\230\229\242 \239\240\238\233\242\232 \228\224\235\252\248\229...')
		Text(1, '\206\242\239\240\224\226\252 \236\229\237\255 ', GoTo, 354, 375,  "lonetower" )
		Text(1, '\207\240\224\226\232\235\224', JumpPage, 2)
		for i,v in pairs(LoneInst.conf['openday']) do
			d = d..LoneInst.getDay(v)..', '
		end
		Talk(2, '\194\245\238\228 \238\242 2 \247\229\235\238\226\229\234,\226\251\248\229 1000 \243\240\238\226\237\255!')
		end
	
	function r_talkLTEx()
		InitTrigger()
		TriggerCondition(1, HasItem, 3457, 1)
		TriggerAction(1, JumpPage, 1)
		TriggerFailure(1, JumpPage, 3)
		Start( GetMultiTrigger(), 1)
		
		Talk (1, 'Lone Researcher: There is a very strange source of power within the Blue Crystals in Lone tower. '..
				 'Bring me some and I can work something out of it for you!')
		Text (1, 'Enter Shop', SendExchangeXData)
		InitExchangeX()
		for i,v in pairs(LoneInst.shop) do
			ExchangeDataX(v.currency, v.price, v.id, v.qty, 1)
		end
		Talk (2, 'Lone Researcher: You\'ve brought me some Blue Crystals? Sorry, my craft shop is only available weekdays, '..
				 'Monday - Friday. Please come again!')
		Talk (3, 'Lone Researcher: To reveal my shop, you must bring some Blue Crystals. Do you have not?')
	end


	LoneInst.spawn = function(map_copy)
		local pos = math.random(1, 360)
		if LoneInst.data[map_copy].wave == 1 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 28693, 30291, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 27217, 26260, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 29760, 27940, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 28449, 31450, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 29489, 31137, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 30054, 35614, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 31064, 29746, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 32976, 27285, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 32057, 27933, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 33918, 31989, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 34243, 36093, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 35492, 36544, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 29268, 26662, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 26815, 30981, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 28780, 31673, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 29814, 31558, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 30819, 35477, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 31790, 26920, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 33255, 28006, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 35092, 32398, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 34569, 36365, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 35238, 37141, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 26346, 26435, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 35492, 36544, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 26311, 27867, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 28137, 28007, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 26737, 33978, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 28458, 32514, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 30051, 35056, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 31184, 34607, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 33063, 26887, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 33459, 32163, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 35020, 32872, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 33526, 37017, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 34097, 28341, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 35000, 26801, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 35338, 27209, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 36744, 26821, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 36860, 27541, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 36602, 27792, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 36443, 32152, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 37447, 33545, pos, 50000, map_copy)
			SetChaLifeTime(m,300000)
		elseif LoneInst.data[map_copy].wave == 2 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 13740, 12393, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 6061, 3041, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 6133, 7264, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 3360, 7758, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 6312, 12684, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 4894, 14704, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 3068, 17055, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 8126, 12932, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 9305, 17269, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 9609, 12856, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 8995, 6157, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 11001, 2938, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 12582, 12600, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 15836, 9939, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 14940, 10785, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 5385, 3161, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 6487, 7115, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 3017, 7712, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 6048, 12464, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 4446, 13364, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 2860, 15803, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 7816, 12701, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 7469, 15283, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 9895, 12508, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 10513, 10077, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 9041, 4159, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 14597, 4434, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 8038, 12424, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 16660, 10581, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 16672, 6322, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 3336, 2236, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 6359, 4422, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 2767, 4825, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 6023, 8633, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 4254, 13007, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 5410, 14929, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 5788, 15772, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 7646, 14638, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 9573, 17487, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 11027, 8042, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 10707, 6299, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 8089, 3822, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 13036, 12566, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 16728, 9960, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 11787, 10792, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 3715, 2512, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 6425, 4923, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 2922, 5486, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 5848, 10347, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 3893, 13075, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 3369, 16404, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 5751, 16469, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 7854, 14788, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 9538, 12203, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 11414, 15220, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 10921, 6571, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 15380, 4413, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 14636, 12543, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 15914, 10633, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 16211, 6159, pos, 50000, map_copy)
			SetChaLifeTime(m,300000)
		elseif LoneInst.data[map_copy].wave == 3 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 14162, 28422, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 2804, 28838, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 3503, 31495, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 3626, 35891, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 4375, 34288, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 4591, 32814, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 5357, 27347, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 5800, 30468, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 7860, 36306, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 8293, 38858, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 7385, 33692, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 6652, 25476, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 7865, 26969, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 9715, 37441, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 11310, 38515, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 12341, 40260, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 14768, 37829, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 15500, 39225, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 16507, 37608, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 18244, 38364, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 18270, 35293, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 19020, 33185, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 16178, 33873, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 9616, 25361, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 16765, 31148, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 18610, 28128, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 3353, 27207, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 3342, 31309, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 3540, 35561, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 6269, 36540, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 5233, 34857, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 4641, 28394, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 5601, 30760, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 6397, 34434, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 8071, 38585, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 8121, 32623, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 8141, 29378, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 7848, 25800, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 9755, 35756, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 11091, 38098, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 11936, 39928, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 14358, 37780, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 14699, 38823, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 17372, 40376, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 16372, 38520, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 17955, 36474, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 18892, 33869, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 16581, 32715, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 16205, 35410, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 9573, 26038, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 14460, 28396, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 17004, 26871, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 2967, 27320, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 3027, 29056, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 3604, 34061, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 4376, 36668, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 4416, 35854, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 4946, 32573, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 6140, 28272, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 5656, 33343, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 7976, 36695, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 8687, 39976, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 7974, 30349, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 6834, 26423, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 9580, 35335, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 10058, 37787, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 11582, 39481, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 6015, 42374, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 14189, 38672, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 16275, 40102, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 17299, 38014, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 18174, 37089, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 17935, 34773, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 17199, 32036, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 15732, 34117, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 10434, 26067, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 15920, 29661, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 18287, 26806, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 15812, 35796, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 14679, 36013, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 14447, 36440, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13311, 35757, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 11678, 34495, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 12118, 34010, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 12724, 32421, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13186, 32676, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13069, 31383, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 12625, 29973, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13015, 29322, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 10272, 25717, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 10344, 27390, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13232, 27773, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13702, 27835, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][4].id, 13889, 30139, pos, 50000, map_copy)
			SetChaLifeTime(m, 300000)
		elseif LoneInst.data[map_copy].wave == 4 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 34370, 3046, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 24326, 6469, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 24414, 9458, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 27911, 9311, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 25968, 7346, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 29140, 2110, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 27994, 11821, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 28991, 16751, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 32164, 2100, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 29481, 8021, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 33081, 7736, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 31966, 10767, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 29698, 14048, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 31402, 16196, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 34167, 14887, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 36180, 16978, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 36874, 8055, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 37964, 11697, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 35971, 12577, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 34742, 8581, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 33944, 2230, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 37947, 5751, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 36727, 6601, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 38006, 7905, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 38935, 10671, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 24451, 4213, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 24341, 9188, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 27935, 11056, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 27711, 8568, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 28188, 2056, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 27839, 6520, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 27977, 16902, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 28328, 15508, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 29519, 6981, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 30737, 7913, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 30734, 9197, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 29817, 12361, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 3604, 14787, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 34402, 16247, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 36397, 14672, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 38005, 13552, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 34617, 13258, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 35975, 10177, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 32007, 5988, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 38163, 4745, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 36545, 5730, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 36736, 7791, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 38931, 9291, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 24284, 3956, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 24278, 7289, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 24363, 10618, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 27272, 9138, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 28020, 4007, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 29056, 3272, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 27902, 14228, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 28687, 16948, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 29597, 5376, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 29206, 8790, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 33099, 9152, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 31582, 11387, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 30073, 14352, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 32168, 16789, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 34476, 15449, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 37514, 17003, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 38137, 8079, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 34330, 12842, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 36203, 11488, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 34277, 8513, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 34541, 2681, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 36635, 4920, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 38061, 6655, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 36713, 8995, pos, 50000, map_copy)
			SetChaLifeTime(m, 300000)
		elseif LoneInst.data[map_copy].wave == 5 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 48324, 3508, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 49113, 5307, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 50100, 8583, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 5807, 7746, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 51515, 10006, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 49109, 12141, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 51382, 15795, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 54115, 13957, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 57684, 14966, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 59551, 14078, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 61736, 14832, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 61072, 13445, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 59770, 10246, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 55331, 11465, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 55897, 6253, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 52332, 3958, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 57234, 3007, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 58238, 8383, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 59352, 5810, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 60627, 2333, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 62135, 4659, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 61868, 8919, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 63421, 7550, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 63737, 4983, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 62012, 3482, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 48716, 4856, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 50042, 7376, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 50202, 10389, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 51535, 9009, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 50264, 12215, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 47091, 6073, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 51443, 14951, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 50079, 16639, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 57718, 14180, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 57958, 15876, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 61267, 14470, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 62317, 15918, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 60387, 10294, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 55323, 10566, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 54602, 6469, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 54297, 2733, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 55619, 4485, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 57333, 7069, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 59459, 7515, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 59116, 2796, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 62139, 2615, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 61934, 7543, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 63317, 10124, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][2].id, 63756, 4645, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 48710, 3574, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 49532, 6640, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 50029, 9568, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 51565, 8435, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 50741, 11420, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 48356, 12167, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 51433, 13759, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 50407, 15766, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 55008, 14238, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 57630, 16038, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 59560, 14609, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 61759, 15958, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 60447, 11454, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 58073, 10592, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 52916, 11175, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 54301, 4489, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 55693, 2565, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 57152, 4052, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 57125, 10288, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 58909, 4124, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 61788, 2553, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 62201, 6122, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 62251, 10083, pos, 50000, map_copy)
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][3].id, 63805, 2154, pos, 50000, map_copy)
			SetChaLifeTime(m, 300000)
		elseif LoneInst.data[map_copy].wave == 6 then
			local m = CreateChaEx(LoneInst.conf['mob'][LoneInst.data[map_copy].wave][1].id, 54505, 28154, pos, 50000, map_copy)
			SetChaLifeTime(m, 300000)
		end
	end
-----------------------------------------------------------
-- lonetower/ctrl.lua:
-- Delete everything and paste:
-----------------------------------------------------------
--[[
print( "Loading Lonetower Ctrl.lua" )

function config(map)
	MapCanSavePos(map, 0)
	MapCopyNum(map, LoneInst.conf['maxcopy'])
	MapCanPK(map, 0)
	SingleMapCopyPlyNum(map, 5)
	MapCanTeam(map, 1)
	MapType(map, 4)
end

function init_entry(map)
end
]]