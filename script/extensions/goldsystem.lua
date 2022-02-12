-- Lottery System V(1.0) - Xeon
print("Loading lottery.lua");

FILE_READ = 'r'
FILE_WRITE = 'w'

LotterySystem = { }

LotterySystem.Database = GetResPath("script/extension/LotterySystem/Lottery.dat")

LotterySystem.Rewards = {
						Items = {
									--{ ItemID = 3457, Qua = 2, Param = 4 }, -- Kal
									---{ ItemID = 3457, Qua = 2, Param = 4 }, -- Kal
									--{ ItemID = 3457, Qua = 2, Param = 4 }, -- Kal
									{ ItemID = 3457, Qua = 2, Param = 4 }, -- Kal	
									--{ ItemID = 860, Qua = 1, Param = 4 }, -- Gem of the Wind
									--{ ItemID = 861, Qua = 1, Param = 4 }, -- Gem of Striking
									--{ ItemID = 862, Qua = 1, Param = 4 }, -- Gem of Colossus
									--{ ItemID = 863, Qua = 1, Param = 4 }, -- Gem of Rage
									--{ ItemID = 7305, Qua = 1, Param = 4 }, -- Gem of Soul
									--{ ItemID = 6727, Qua = 1, Param = 4 }, -- Ref Gem Random lv1-4
									--{ ItemID = 7312, Qua = 1, Param = 4 }, -- Unique Gem Chest
									{ ItemID = 3143, Qua = 99, Param = 4 }, -- Revival Clover 
									{ ItemID = 3336, Qua = 99, Param = 4 }, -- Mystic Clover
									{ ItemID = 3460, Qua = 99, Param = 4 }, -- Cakes
									{ ItemID = 267, Qua = 1, Param = 4 }, -- Power of Flame
									{ ItemID = 268, Qua = 1, Param = 4 }, -- Power of Wind
									{ ItemID = 269, Qua = 1, Param = 4 }, -- Power of Thunder
									{ ItemID = 270, Qua = 1, Param = 4 }, -- Power of Frost
									{ ItemID = 271, Qua = 1, Param = 4 }, -- Angelic Dices
									--{ ItemID = 854, Qua = 1, Param = 4 }, -- Million Dollar Note
									{ ItemID = 7547, Qua = 1, Param = 4 }, -- 500K Dollar Note
									{ ItemID = 1000, Qua = 15, Param = 4 }, -- Blurry Blueprint
									{ ItemID = 1136, Qua = 10, Param = 4 }, -- Flash Bomb Lv1
									{ ItemID = 1135, Qua = 10, Param = 4 }, -- Grenade Lv1
									{ ItemID = 1137, Qua = 10, Param = 4 }, -- Radiation Lv1
									{ ItemID = 1138, Qua = 10, Param = 4 }, -- Soul Detector Lv1
									{ ItemID = 2729, Qua = 5, Param = 4 }, -- Sand bag lv2
									{ ItemID = 1854, Qua = 3, Param = 4 }, -- Bull Potion
									{ ItemID = 1855, Qua = 3, Param = 4 }, -- Battle Potion
									{ ItemID = 1856, Qua = 3, Param = 4 }, -- Berserk Potion
									{ ItemID = 1857, Qua = 3, Param = 4 }, -- Energy Potion
									{ ItemID = 1858, Qua = 3, Param = 4 }, -- Harden Potion
									{ ItemID = 1859, Qua = 3, Param = 4 }, -- Accurate Potion
									{ ItemID = 855, Qua = 99, Param = 4 }, -- Fairy Coins
									{ ItemID = 2312, Qua = 1, Param = 4 }, -- Autos Rations
									{ ItemID = 7548, Qua = 1, Param = 4 }, -- Lost Ticket
									{ ItemID = 7548, Qua = 1, Param = 4 }, -- Lost Ticket
									{ ItemID = 7548, Qua = 1, Param = 4 }, -- Lost Ticket
									{ ItemID = 7548, Qua = 1, Param = 4 }, -- Lost Ticket
									{ ItemID = 7548, Qua = 1, Param = 4 }, -- Lost Ticket
									{ ItemID = 855, Qua = 99, Param = 4 }, -- Fairy Coins
									{ ItemID = 3336, Qua = 99, Param = 4 }, -- Mystic Clover
									--{ ItemID = 6727, Qua = 1, Param = 4 }, -- Ref Gem Random 1-4
								},
					 }
					 
function LotterySystem:Init()
	if(file_exists(LotterySystem.Database) ~= true) then
		table.save({}, LotterySystem.Database, FILE_WRITE)
	end
LotterySystem:Init()
end


function HasReceivedTicket(r)
	local database = table.load(LotterySystem.Database, FILE_READ)
	local c = GetChaDefaultName(r)
	if(database[c] ~= nil) then
		if(database[c] == true) then
			return LUA_FALSE
		else
			return LUA_TRUE
		end
	else
		return LUA_TRUE
	end
end

function SaveLotteryTicket(r)
	local database = table.load(LotterySystem.Database, FILE_READ)
	local c = GetChaDefaultName(r)

	if(database[c] == nil) then
		database[c] = true
	end
	
	table.save(database, LotterySystem.Database, FILE_READ)
end

function UseLotteryTicket(r, i)
	local space = GetChaFreeBagGridNum(r)
	local n = math.random(1, table.getn(LotterySystem['Rewards'].Items))
	local c = GetChaDefaultName(r)

	if(space < 1) then
		BickerNotice(r, 'Must have more than 1 free slot(s) in your inventory!')
		UseItemFailed(r)
		return
	end
	
	GiveItem(r, 0, LotterySystem['Rewards'].Items[n].ItemID, LotterySystem['Rewards'].Items[n].Qua, LotterySystem['Rewards'].Items[n].Param)
	BickerNotice(r, 'You have received x'..LotterySystem['Rewards'].Items[n].Qua..' ['..GetItemName(LotterySystem['Rewards'].Items[n].ItemID)..']')

	local itemname = GetItemName(LotterySystem['Rewards'].Items[n].ItemID)
	
	Notice("Player ["..c.."] used a Lottery Ticket and obtained ["..itemname.."]")
end

