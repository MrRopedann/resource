--[[
							*###########################################################################*
							#                           -Exchanger NPC by 7n6.-                         #
							#       If used please give credit or I will break your server Kappa.       #
							#                  (But seriously don't remove credits...)                  #
							*###########################################################################*
	

	
	
	
*******************************************************************************************************************************	
###############################################################################################################################
*******************************************************************************************************************************	

	NPCSDK.LUA : MsgProc:
		elseif item.func ==  Market.Trade then
			return Market.Trade(character, item.p1)	
			
			
*******************************************************************************************************************************	
##################################################Installation#################################################################
*******************************************************************************************************************************	
	Add the above block of code into MsgProc.
	Add an NPC with the MarketNpc function, eg:
		196	Market	1	431	0	222600,270700	222600,270700	180	Argent City	1	0	MarketNpc	0
	Add the name of the NPC to the Market.Name table.
	Load this file using DoFile()
*******************************************************************************************************************************	
##################################################Adding more Exchanges########################################################
*******************************************************************************************************************************	
	
	Example exchange:
	
		
			Cost = {                                --This part of the table is the items the player must collect.
				{
					ItemID = {3116}, 				--table of potential ID for the first item (set to 0 for blank)
					QuantityMin = 10, 				--min amount for that item
					QuantityMax = 50,				--Max amount for that item
				},
				{
					ItemID = {3113,3115,3114}, 
					QuantityMin = 20, 
					QuantityMax = 50,
				},
				{
					ItemID = {3117}, 
					QuantityMin = 1, 
					QuantityMax = 5,
				},
			},
			Reward = {							--This part of the table is the reward.
				{
					ItemID = {7720}, 			--table of potential ID for the first reward
					QuantityMin = 1, 			--min amount for that item
					QuantityMax = 5,            --Max amount for that item
				},
				{
					ItemID = {7721},			--table of potential ID for the second reward
					QuantityMin = 2,            --min amount for that item
					QuantityMax = 20,           --Max amount for that item
				},
			}	
		

	In this example, the player would collect:
		between 10 and 50 of 3116,
		between 20 and 50 of (3113, or 3114, or 3115)
		between 1 and 5 of 3117.
		
	This could then be exchanged for:
		between 1 and 5 of 7720,
		between 2 and 20 of 7721.

	More exchanges can easily be added, for example: 
		Market.Exchanges = {
			{
				Cost = {
					{
						ItemID = {3116}, 
						QuantityMin = 10, 
						QuantityMax = 50,
					},
					{
						ItemID = {3116,3115,3114}, 
						QuantityMin = 10, 
						QuantityMax = 50,
					},
					{
						ItemID = {3116}, 
						QuantityMin = 10, 
						QuantityMax = 50,
					},
				},
				Reward = {
					{
						ItemID = {7720}, 
						QuantityMin = 1, 
						QuantityMax = 5,
					},
				}
				
				
			},
			{
				Cost = {
					{
						ItemID = {1126}, 
						QuantityMin = 120, 
						QuantityMax = 520,
					},
					{
						ItemID = {3112}, 
						QuantityMin = 10, 
						QuantityMax = 50,
					},
					{
						ItemID = {3114}, 
						QuantityMin = 10, 
						QuantityMax = 50,
					},
				},
				Reward = {
					{
						ItemID = {7722}, 
						QuantityMin = 1, 
						QuantityMax = 5,
					},
				}
			},
		}
*******************************************************************************************************************************	
##################################################Refreshing the exchanges#####################################################
*******************************************************************************************************************************	
	On server reload, the exchanges on the npc are reloaded.
	By changing Market.RefreshCount , you can control when it is reloaded.
	The value is the amount of trades that can happen before a reload.
	Set it to -1 to disable refreshes.

*******************************************************************************************************************************	
####################################Changing the amount of exchanges displayed#################################################
*******************************************************************************************************************************	
	Market.MinTrades and Market.MaxTrades control the amount of exchanges to display.
	Upon reload, a number within that range (inclusive) is the amount of trades.
	Make sure max is greater than min, or it may crash.
	Remember, this requires 1 page per 7 items, and 1 page per item.
]]

--*******************************************************************************************************************************--	
--##################################################Config#######################################################################--
--*******************************************************************************************************************************--
print("Loading market init.lua" )
--Market object
Market = {}
--Min amount of trades to display
Market.MinTrades = 5
--Max amount of trades to display
Market.MaxTrades = 20
--Amount of trades to complete before trades are refreshed
Market.RefreshCount = 1    
--Name of the NPC
Market.Name = {"Market"}


--Table containing exchange details.
--This is used to make a table of current active exchanges.
Market.Exchanges = {
	{ --Exchange 1
		Cost = {
			{
				ItemID = {3457}, 
				QuantityMin = 200, 
				QuantityMax = 2500,
			},
			{
				ItemID = {3457,3877,3362}, 
				QuantityMin = 200, 
				QuantityMax = 2500,
			},
			{
				ItemID = {3457}, 
				QuantityMin = 200, 
				QuantityMax = 2500,
			},
		},
		Reward = {
			{
				ItemID = {7528,3087,7444,7625,5702,5710,7482,684,1145}, 
				QuantityMin = 1, 
				QuantityMax = 3,
			},
			{
				ItemID = {7655,7620,7720,7484,7502,7493,7483,7494,7623,7453}, 
				QuantityMin = 1, 
				QuantityMax = 1,
			},
		}
		
		
	},
	
	{ --Exchange 2
		Cost = {
			{
				ItemID = {3457}, 
				QuantityMin = 300, 
				QuantityMax = 1500,
			},
			{
				ItemID = {3877}, 
				QuantityMin = 300, 
				QuantityMax = 1500,
			},
			{
				ItemID = {3362}, 
				QuantityMin = 300, 
				QuantityMax = 500,
			},
		},
		Reward = {
			{
				ItemID = {7655}, 
				QuantityMin = 1, 
				QuantityMax = 4,
			},
			{
				ItemID = {7655,7620,7720}, 
				QuantityMin = 1, 
				QuantityMax = 3,
			},
			{
				ItemID = {684,7528,7627,7628,7620,7451}, 
				QuantityMin = 1, 
				QuantityMax = 3,
			},
		}
		
		
	},
}


--Table containing messages in the npc.
Market.Messages = {
	"\207\238\241\235\229 \234\224\230\228\238\227\238 \238\225\236\229\237\224,\227\229\237\229\240\232\240\243\254\242\241\255 \237\238\226\251\229 \241\228\229\235\234\232! ", --Inital talk from the NPC
	"\207\240\238\241\236\238\242\240 \239\240\229\228\235\238\230\229\237\232\233 ",	--Text on initial page
	"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229 ",	--Error when bag is full
	"\205\229\228\238\241\242\224\242\238\247\237\238 \239\240\229\228\236\229\242\238\226 ",	--Error when trade requirements are not met
	"\196\238\241\242\243\239\237\251\229 \241\228\229\235\234\232: ",	--Talk on each page listing trades
	"\209\228\229\235\234\224 \243\241\239\229\248\237\224!",	--HelpInfo message to tell the player trade was completed
	"\209\235\229\228\243\254\249\224\255 \241\242\240\224\237\232\246\224",	--Text message for page transitions
	"\206\225\236\229\237 ",	--Text message to confirm the trade
	"\206\248\232\225\234\224 ",	--Error message if something goes wrong
}

--Initial page
Market.InitialPage = 1
--First page of the list
Market.StartPage = 2
--Table with (generated) active trades
Market.ActiveExchanges = {}
--Contains amount of trades since last refresh
Market.RefreshCountVal = 0  

--*******************************************************************************************************************************--	
--##################################################NPC functions################################################################--
--*******************************************************************************************************************************--

--NPC function to begin the exchange
function MarketNpc()
	Talk(Market.InitialPage,Market.Messages[1])
	Text(Market.InitialPage,Market.Messages[2],JumpPage,Market.StartPage)
	Talk(Market.StartPage,Market.Messages[5])
	Market.GenerateTradeList()
end

--Function to create the list of trades
function Market.GenerateTradeList()
	local TradeNum = math.random(Market.MinTrades,Market.MaxTrades)
	local DescPage = 2 + math.ceil(TradeNum/7)
	local page = Market.StartPage
	local count = 0
	for i = Market.MinTrades , TradeNum do
		count = count + 1
		if math.mod(count,8) == 0 then
			Text(page,Market.Messages[7],JumpPage,page + 1)
			page = page + 1
			Talk(page,Market.Messages[5])
		end
		Market.GenerateTrade(page,DescPage,count)
		DescPage = DescPage + 1
	end
end

--Function to add trades to the npc
function Market.GenerateTrade(page,DescPage,count)
	local ID = math.random(1,table.getn(Market.Exchanges))
	Market.ActiveExchanges[count] = {
		Take = {},
		Give = {},
	}
	Market.GenerateTradeTable(Market.Exchanges[ID].Cost,count,"Take")
	Market.GenerateTradeTable(Market.Exchanges[ID].Reward,count,"Give")
	Text(page,"\209\228\229\235\234\224 "..count,JumpPage,DescPage)
	Talk(DescPage,Market.GenerateTradeText(count))
	Text(DescPage,Market.Messages[8],Market.Trade,count)
end

--function to create message for the trade page
function Market.GenerateTradeText(ID)
	if Market.ActiveExchanges[ID] == nil then
		return Market.Messages[9]
	end
	local msg = ""
	for i,v in pairs(Market.ActiveExchanges[ID].Take) do
		msg = msg..Market.PadString("	"..v.."x "..GetItemName(i)..",")
	end
		msg = msg..Market.PadString("\206\225\236\229\237\255\242\252 \237\224:")
	for i,v in pairs(Market.ActiveExchanges[ID].Give) do
		msg = msg..Market.PadString("	"..v.."x "..GetItemName(i)..",")
	end
	return msg
end

--Generates the table for active exchanges from the exchanges table
function Market.GenerateTradeTable(array,count,exType)
	for i,v in pairs(array) do
		local index = math.random(1,table.getn(v.ItemID))
		local ItemID = v.ItemID[index]
		local ItemQuantity = math.random(v.QuantityMin, v.QuantityMax)
		if ItemID ~= 0 and ItemQuantity ~= 0 then
			if Market.ActiveExchanges[count][exType][ItemID] == nil then
				Market.ActiveExchanges[count][exType][ItemID] = ItemQuantity
			else
				Market.ActiveExchanges[count][exType][ItemID] = ItemQuantity + Market.ActiveExchanges[count][exType][ItemID]
			end
		end
	end	
end


--*******************************************************************************************************************************--	
--##################################################Misc#########################################################################--
--*******************************************************************************************************************************--

--Reloads the active trades, resets the counter
function Market.Reload()
	Market.ActiveExchanges = {}
	Market.RefreshCountVal = 0
	for i,v in pairs(Market.Name) do
		NpcInfoReload(v,MarketNpc)
	end
end

--pads a string to 42 chars (1 line)
function Market.PadString(str)
	local Len = string.len(str)
	if Len == 42 then
		return str
	end
	if Len < 42 then
		for i = 1,42-Len do
			str = str.." "
		end
	end
	return str
end

function Market.CountArray(array)
	local count = 0
	for i,v in pairs(array) do
		count = count + 1
	end
	return count
end
--*******************************************************************************************************************************--	
--##################################################Exchange function############################################################--
--*******************************************************************************************************************************--

--Trade function.
function Market.Trade(role,ID)
	local slots = GetChaFreeBagGridNum(role)
	local freeSlots =  Market.CountArray(Market.ActiveExchanges[ID].Give)
	if slots < freeSlots then
		HelpInfo(role,0,Market.Messages[3])
		return 0
	end
	for i,v in pairs(Market.ActiveExchanges[ID].Take) do
		local check = CheckBagItem( role,i )
		if check < v then
			HelpInfo(role,0,Market.Messages[4])
			return 0
		end
	end
	for i,v in pairs(Market.ActiveExchanges[ID].Take) do
		TakeItem( role, 0, i , v)
	end
	for i,v in pairs(Market.ActiveExchanges[ID].Give) do
		GiveItem ( role , 0 , i  , v , 4 )	
	end
	HelpInfo(role,0,Market.Messages[6])
	Market.RefreshCountVal = Market.RefreshCountVal + 1
	if Market.RefreshCountVal >= Market.RefreshCount and Market.RefreshCount ~= -1 then
		Market.Reload()
	end
end