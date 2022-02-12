print("* Loading RankingPrize")
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** LuaSQL - Rank by Database ************************************************************************** --
	-- ***************************************************************************** Scripted by Angelix ***************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** Installation Instructions ************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	--[[
		1.	Load this file by using the 'dofile' function.
		2.	Inside your 'map_run_garner' function add this: RankByDB.Timer()
		3.	Inside 'NpcSdk.lua', look for function 'MsgProc', look for:
					elseif item.func == ChangeItem then
						return ChangeItem(character,npc)
				And below it add:
					elseif item.func == RankByDB.Claim then
						return RankByDB.Claim(character)
		4.	Add an NPC with the function 'RankByDB_NPC' in the line.
		]]--
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************ LuaSQL Database Configuration ************************************************************************ --
	-- ******************************************************************************************************************************************************************************* --
	_SQL = {Database = {}, Handle = {}, Codes = {}}
	_SQL.Database.Account	= {	Name = 'AccountServer',	Host = '127.0.0.1',	User = 'Host_1',	Password = '2020Graf2020'}
	_SQL.Database.Game		= {	Name = 'GameDB',		Host = '127.0.0.1',	User = 'Host_1',	Password = '2020Graf2020'}

	_SQL.Handle.Connect = 'connect'	_SQL.Handle.Fetch = 'fetch'	_SQL.Handle.Free = 'freehandle'	_SQL.Handle.Close = 'close'	_SQL.Handle.Query = 'query'
	_SQL.Codes.LuaError = 10	_SQL.Codes.SuccessInfo = 1	_SQL.Codes.Success = 0	_SQL.Codes.Error = -1	_SQL.Codes.Invalid = -2	_SQL.Codes.NoData = 100
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** Rank by Database Variable ************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	RankByDB = RankByDB or {Conf = {}, Column = {}, Hook = {}, Text = {}}
	
	RankByDB.Conf.Enable = true
	RankByDB.Conf.Name = 'Ranking'
	RankByDB.Conf.DayCheck = 'Saturday'
	RankByDB.Conf.HourCheck = 0
	
	--RankByDB.Text.Column = '[%s]: Weekly [%s] ranking rewards are now stored.'
	--RankByDB.Text.Player = '[%s]: Rank # %d - %s'
	--RankByDB.Text.NoData = 'There\'s no data currently for this week\'s ranking leaderboard.'
	
	RankByDB.Text.Column = '[%s]: \197\230\229\237\229\228\229\235\252\237\251\229 \239\240\232\231\251 [%s] \231\224 \242\238\239 \242\229\239\229\240\252 \245\240\224\237\255\242\241\255.'
	RankByDB.Text.Player = '[%s]: \208\224\237\234 # %d - %s'
	RankByDB.Text.NoData = '\196\224\237\237\251\229 \238 \235\232\228\229\240\224\245 \237\229\228\238\241\242\243\239\237\251.'
	
	
	
	RankByDB.Column['pvp'] = {
		Name = 'PVP',
		Ranking = {
			[1] = {ID = 8139, Qty = 1},
			[2] = {ID = 8140, Qty = 1},
			[3] = {ID = 8141, Qty = 1}
					}
								}
	RankByDB.Column['pk'] = {
		Name = 'PK',
		Ranking = {
			[1] = {ID = 8142, Qty = 1},
			[2] = {ID = 8143, Qty = 1},
			[3] = {ID = 8144, Qty = 1}
					}
								}
	
	RankByDB.Column['KillMobs'] = {
		--Name = 'Убийство монстров',
		Name = '\211\225\232\233\241\242\226\238 \236\238\237\241\242\240\238\226',
		Ranking = {
			[1] = {ID = 8145, Qty = 1},
			[2] = {ID = 8146, Qty = 1},
			[3] = {ID = 8147, Qty = 1}
					}
								}
								
	RankByDB.Cache = RankByDB.Cache or {Date = '', Column = {}}
	-- ******************************************************************************************************************************************************************************* --
	-- ******************************************************************************** NPC Function ******************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
RankByDB_NPC = function()
	--Talk(1, 'Привет. Я выдаю призы за первые 3 места Топов.')
	--Text(1, 'Забрать приз.', RankByDB.Claim)
	--Text(1, 'Уйти.', CloseTalk)
	Talk(1, '\207\240\232\226\229\242. \223 \226\251\228\224\254 \239\240\232\231\251 \231\224 \239\229\240\226\251\229 3 \236\229\241\242\224 \210\238\239\238\226.')
	Text(1, '\199\224\225\240\224\242\252 \239\240\232\231', RankByDB.Claim)
	Text(1, '\211\233\242\232', CloseTalk)
	
end
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** Rank by Database Function ************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	CachedRank = true
RankByDB.Timer = function()
	if not RankByDB.Conf.Enable then
		return
	end
	local Hour = tonumber(os.date("%I"))
	local Minute = tonumber(os.date("%M"))
	local Second = tonumber(os.date("%S"))
	local Day = tostring(os.date("%A"))
	local Date = tostring(os.date("%x"))
	if Day == RankByDB.Conf.DayCheck and Hour == RankByDB.Conf.HourCheck and Minute == 0 and Second <= 5 then
		if RankByDB.Cache.Date == Date then
			return
		end
		RankByDB.Cache.Date = Date
		for Column, Table in pairs(RankByDB.Column) do
			RankByDB.Cache.Column[Column] = {}
			Notice(string.format(RankByDB.Text.Column, RankByDB.Conf.Name, Table.Name))
			for Rank, Reward in pairs(Table.Ranking) do
				local PlyrData = RankByDB.GetValue(Column, Rank)
				local PlyrName = PlyrData['cha_name']
				RankByDB.Cache.Column[Column][Rank] = {Name = PlyrName, Claimed = false}
				Notice(string.format(RankByDB.Text.Player, RankByDB.Conf.Name, Rank, PlyrName))
			end
		end
	end
end
RankByDB.Claim = function(Player)
	if RankByDB.Cache.Date == '' then
		HelpInfo(Player, 0, string.format(RankByDB.Text.NoData))
		return
	end
	local PlayerName = GetChaDefaultName(Player)
	for Column, Table in pairs(RankByDB.Cache.Column) do
		for Rank, Var in pairs(Table) do
			if Var.Name == PlayerName and not Var.Claimed then
				local Item = RankByDB.Column[Column].Ranking[Rank]
				if GiveItem(Player, NPC, Item.ID, Item.Qty, 4) == 1 then
					Var.Claimed = true
				end
			end
		end
	end
end
	-- ******************************************************************************************************************************************************************************* --
	-- ************************************************************************** LuaSQL Database Functions ************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
RankByDB.GetValue = function(Column, Position)
	local String = ''
	--Топ PVP
	if Column == 'pvp' then
		String = 'SELECT * FROM (SELECT cha_name, RANK() OVER (ORDER BY pvp DESC, degree DESC, CASE WHEN (exp < 0) THEN (exp+4294967296) ELSE exp END DESC) as Rank'
	--Топ PK
	elseif Column == 'pk' then
		String = 'SELECT * FROM (SELECT cha_name, RANK() OVER (ORDER BY pk DESC, degree DESC, CASE WHEN (exp < 0) THEN (exp+4294967296) ELSE exp END DESC) as Rank'
	--Топ Убийств
	elseif Column == 'KillMobs' then
		String = 'SELECT * FROM (SELECT cha_name, RANK() OVER (ORDER BY KillMobs DESC, degree DESC, CASE WHEN (exp < 0) THEN (exp+4294967296) ELSE exp END DESC) as Rank'
	end
	if String == '' then
		return _SQL.Codes.LuaError
	end
	String = String..' FROM '.._SQL.Database.Game.Name..'.dbo.character WHERE delflag = 0) A WHERE A.Rank = '..Position..''
	local Connect, CID = LuaSQL(_SQL.Handle.Connect, _SQL.Database.Game.Host, _SQL.Database.Game.User, _SQL.Database.Game.Password)
	if Connect == _SQL.Codes.SuccessInfo then
		local Success, Query = LuaSQL(_SQL.Handle.Query, CID, String)
		if Success == _SQL.Codes.SuccessInfo then
			local Data = LuaSQL(_SQL.Handle.Fetch, CID, Query)
			LuaSQL(_SQL.Handle.Free, CID, Query)
			LuaSQL(_SQL.Handle.Close, CID)
			if Data == _SQL.Codes.NoData then
				return _SQL.Codes.NoData
			else
				return Data
			end
		end
	end
end
