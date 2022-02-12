--[[
							*###########################################################################*
							#                           -Auction NPC by 7n6.-                           #
							#       If used please give credit or I will break your server Kappa.       #
							#                  (But seriously don't remove credits...)                  #
							*###########################################################################*

	NpcSdk.lua: MsgProc :
		elseif item.func ==  Bidding.Bid then
			return Bidding.Bid(character, item.p1)	
		elseif item.func ==  Bidding.ClaimOwed then
			return Bidding.ClaimOwed(character)	
			
	MissionSdk.lua: ActionsProc :
		elseif actions[i].func == Bidding.Reload then
			local ret = Bidding.Reload()

			
	Example NPC line:
		195	Bidding	1	262	0	220300,270100	220300,270100	180	Argent City	3	0	BiddingNPC	0
		
*******************************************************************************************************************************	
###############################################################################################################################
*******************************************************************************************************************************	


		Installation and use:
			Installation:
				1) Add the above lines to your MissionSdk.lua and NpcSdk.lua
				2) Add a NPC on any map.
				3) If you change the name of this NPC, change the Bidding.Name table to that NPCs name.
				4) If you are adding multiple auction NPCs, add each name to the Bidding.Name table.
				5) Edit the Bidding.SavePath and Bidding.OwedSavePath variable to your desired save paths.
				6) Edit Bidding.TimeZone to be your timezone, relative to UTC.
				7) If you do not have a GS with GetGmLv, edit the IsGM table to contain the ID and gm level of your GM chars.
				8) This extension requires serialize.
				9) Load this file using DoFile()
				
				
			Adding a new auction:
				The Bidding.Add(role,message) allows a GM to add a new auction.
				It is designed to be used with a chat handler.
				An example command is as follows: (/addnewitem is just an example)
				
				/AddNewItem new 1 2 100 1000 14652551231 new_Item_Innit
				
				This would create an auction called "new" where you would bid on 2 short swords( id = 1).
				The starting price would be 100, and each bid costs 1000 on top of that.
				The bid would end at 14652551231, which is 04/27/2434 @ 5:07pm
				See http://www.unixtimestamp.com/index.php for conversion into Unix time.
				The description of this item would be new Item Innit.
				
				You can also add multiple items in one auction:
				
				/AddNewItem new 1,2,3 2,3,3 100 1000 14652551231 newItemInnit
				
				This would give you 2x 1, 3x 2 and 3x 3.
				Please ensure you fill out a quantity for each item, to prevent bugs.
				
				
			User guide:
				Placing a bid:
					Talk to the NPC.
					Click "View current auctions"
					Click on the auction you wish to partake in.
					Click "Place bid"
					This will take an amount of gold away from you.
					
				Claiming auction prize or gold back:
					Talk to the NPC
					Click "claim back gold or items".
					The gold or items will be added to your bag.
					
					
					
		Notes:
			General Info:
				Persists over updateall.
				Persists over server restart.
				
			To do:
				Allow use of attributes on item
				Display attributes of item on auction
				
*******************************************************************************************************************************	
###############################################################################################################################
*******************************************************************************************************************************	
]]

--Create bidding object
Bidding = {}
--Declare savepath for table of active bids.
Bidding.SavePath = GetResPath("script/newextension/Data/Bid.txt")
--Declare savepath for table of owed items/gold
Bidding.OwedSavePath = GetResPath("script/newextension/Data/BidItems.txt")
--Declare NPC names, required for reload function
Bidding.Name = {"Bidding"}
--Declare timezone relative to UTC. 
Bidding.TimeZone = -1
--Start page for the NPC
Bidding.Start = 1
--Start of the list for NPC
Bidding.ListPageStart = 2

--Toggle claim functionality.
--true = if you dont win, you can claim back gold used to bid
--false = no claims on the gold.
Bidding.AllowGoldClaim = true
--Table of messages from NPC.
Bidding.Messages = {
	"Here you can place a bid on these items!",
	"Auction for: ",
	"Current Bid: ",
	"Bidding Increment: ",
	"Place Bid",
	"Bidding ends at: ", 
	"You do not have enough gold to bid.",
	"Bid placed sucessfully.",
	"Current top bidder: ",
	"You are already the top bidder.",
	"Description: ",
	"View current auctions",
	"Claim back gold or items",
	"Next Page",
	"Bidding has already ended.",
	"You are not owed any gold.",
	"Gold is saturated. Unable to claim gold.",
	"--------",
	"Bag is full, but you have more items to claim",
	"You are not owed any items.",
	"Bid $X gold.",
	"Recieved $X gold.",
	"Contains: ",
}

--This function is only needed if you do not have the GetGmLv function on your GS.
if GetGmLv == nil then
	print("Simple GetGmLv() loaded.")
	IsGM = {
		[0193] = 99,
	}
	function GetGmLv(role)
		local PID = GetRoleID(role)
		if IsGM[PID] ~= nil then
			return IsGM[PID]
		else
			return 0
		end
	end
end



--Initial function to create empty tables.
function Bidding.Initial()
	Table = io.open(Bidding.SavePath,"r")
	Table2 = io.open(Bidding.OwedSavePath,"r")
	if Table~=nil then 
		io.close(Table) 
	else 
		table.save({},Bidding.SavePath,"w")
	end
	if Table2~=nil then 
		io.close(Table2) 
	else 
		table.save({},Bidding.OwedSavePath,"w")
	end
end
Bidding.Initial()

--NPC function.
function BiddingNPC()
	Bidding.ReloadTrigger()
	Talk(Bidding.Start,Bidding.Messages[1])
	Text(Bidding.Start,Bidding.Messages[12],JumpPage,Bidding.ListPageStart)
	Text(Bidding.Start,Bidding.Messages[13],Bidding.ClaimOwed)
	Bidding.GenerateList()
end

--Trigger for refreshing the NPC
--Updates prices, bidders, etc
function Bidding.ReloadTrigger()
	InitTrigger()
		TriggerAction( 1, JumpPage,Bidding.Start)
		TriggerAction( 1, Bidding.Reload)
	Start( GetMultiTrigger(), 1)
end

--Generates the list of active auctions
function Bidding.GenerateList()
	local Bids = table.load(Bidding.SavePath,"r")
	local ListPages = math.ceil(table.getn(Bids)/7)
	local ItemPage = Bidding.ListPageStart + ListPages 
	local page = Bidding.ListPageStart
	for i,v in pairs(Bids) do
		if math.mod(i,8) == 0 then
			Text(page,Bidding.Messages[14],JumpPage,page + 1)
			page = page + 1
		end
		Text(page,v.Name.."		"..Bidding.Messages[3]..v.Cost,JumpPage,ItemPage)
		Talk(ItemPage,Bidding.GenerateText(v))
		Text(ItemPage,Bidding.Messages[5], Bidding.Bid,i)
		ItemPage = ItemPage + 1
	end
end

--Generates the text for the page of an auction.
--Uses messages from the messages table.
function Bidding.GenerateText(v)
	local msg = Bidding.PadString(Bidding.Messages[2]..v.Name)..Bidding.PadString(Bidding.Messages[3]..v.Cost)..Bidding.PadString(Bidding.Messages[4]..v.Increment)
	msg = msg..Bidding.PadString(Bidding.Messages[6]..os.date("%c",v.Time))..Bidding.PadString(Bidding.Messages[9]..v.Bidder)
	msg = msg..Bidding.MultiLinePadString(Bidding.Messages[11]..v.Description)..Bidding.PadString("")
	msg = msg..Bidding.PadString(Bidding.Messages[23])
	for j,k in pairs(v.Items) do
		msg = msg..Bidding.PadString(v.Quantitys[j].."x "..GetItemName(k))
	end
	return msg
end

--function for a user to place a bid on an item
function Bidding.Bid(role,ID)
	if ChaIsBoat ( role ) == 1 then		
		return
	end
	local Bids = table.load(Bidding.SavePath,"r")
	local cost = Bids[ID].Cost + Bids[ID].Increment
	local gold = GetChaAttr(role,8)
	if Bidding.SystemTimeNow() >= Bids[ID].Time then
		SystemNotice(role,Bidding.Messages[15])
	elseif gold < cost then
		SystemNotice(role,Bidding.Messages[7])
	elseif GetChaDefaultName(role) == Bids[ID].Bidder then
		SystemNotice(role,Bidding.Messages[10])
	else
		gold = gold - cost
		SetCharaAttr(gold ,role , 8)
		Bidding.AddOwedGold(Bids[ID].Bidder,Bids[ID].Cost)
		Bids[ID].Cost = cost
		Bids[ID].Bidder = GetChaDefaultName(role)
		table.save(Bids,Bidding.SavePath,"w")
		SystemNotice(role,Bidding.Messages[8])
		local msg = string.gsub(Bidding.Messages[21],"$X",cost)
		SystemNotice(role,msg)
		RefreshCha(role)
		Bidding.Reload()
	
	end
end

--Function called for the user to claim back gold
--Also claims won items
function Bidding.ClaimOwed(role)
	if ChaIsBoat ( role ) == 1 then		
		return
	end
	if Bidding.AllowGoldClaim == true  then
		Bidding.ClaimOwedGold(role)
	end
	Bidding.ClaimItems(role)
end

--Claims gold used to bid on an item the user didnt win.
function Bidding.ClaimOwedGold(role)
	local name = GetChaDefaultName(role)
	local Owed = table.load(Bidding.OwedSavePath,"r")
	local gold = GetChaAttr(role,8)
	if Owed[name] == nil or Owed[name].Gold == 0 then
		SystemNotice(role,Bidding.Messages[16])
	elseif gold == 2000000000 then
		SystemNotice(role,Bidding.Messages[17])
	else
		local givenGold = math.min(2000000000 - gold,Owed[name].Gold)
		Owed[name].Gold = Owed[name].Gold - givenGold
		table.save(Owed,Bidding.OwedSavePath,"w")
		SetCharaAttr(givenGold ,role , 8)
		RefreshCha(role)
		local msg = string.gsub(Bidding.Messages[22],"$X",givenGold)
		SystemNotice(role,msg)
	end
end

--Claims items won on the auction
function Bidding.ClaimItems(role)
	local name = GetChaDefaultName(role)
	local Owed = table.load(Bidding.OwedSavePath,"r")
	if table.getn(Owed[name].Items) == 0 then
		SystemNotice(role,Bidding.Messages[20])
	end
	for i,v in pairs(Owed[name].Items) do
		if GetChaFreeBagGridNum(role) > 0  then
			for j,k in pairs(v.Items) do
				GiveItem(role,0,k,Owed[name].Items[i].Quantitys[j],4)
			end
			table.remove(Owed[name].Items,i)
		else
			SystemNotice(role,Bidding.Messages[19])
			break
		end
	end
	table.save(Owed,Bidding.OwedSavePath,"w")
end

--Assign an expired auction to a user, and remove it from the list.
--Function is called on reload.
function Bidding.AssignExpiredItems()
	local Bids = table.load(Bidding.SavePath,"r")
	for i,v in pairs(Bids) do
		if v.Time <= Bidding.SystemTimeNow() then
			if v.Bidder ~= Bidding.Messages[18] then
				Bidding.AddOwedItem(v)
			end
			table.remove(Bids,i)
		end
	end
	table.save(Bids,Bidding.SavePath,"w")
end

--Add the expired item to the user.
function Bidding.AddOwedItem(v)
	local Owed = table.load(Bidding.OwedSavePath,"r")
	if Owed[v.Bidder] == nil then
		Owed[v.Bidder] = {
			Gold = 0,
			Items = {},
		}
	end
	table.insert(Owed[v.Bidder].Items,v)
	table.save(Owed,Bidding.OwedSavePath,"w")
end

--Add an amount of gold to a users owed gold table
function Bidding.AddOwedGold(name,amount)
	if name == Bidding.Messages[18] then
		return
	end
	local Owed = table.load(Bidding.OwedSavePath,"r")
	if Owed[name] == nil then
		Owed[name] = {
			Gold = amount,
			Items = {},
		}
	else
		Owed[name].Gold = amount + Owed[name].Gold
	end
	table.save(Owed,Bidding.OwedSavePath,"w")
end

--Admin function to create a new auction.
--If you do not have a gameserver with GetGmLv, create a function to check if the players name is the name of the admin.
function Bidding.Add(role,message)
	if GetGmLv(role) ~= 99 then
		SystemNotice(role,"ERROR")
		return
	end
	local Bids = table.load(Bidding.SavePath,"r")
	local words = split(message," ")
	local NewBid = {
		Name = string.gsub(words[2],"_"," "),
		Items = split(words[3],","),
		Quantitys = split(words[4],","),
		Cost = math.floor(tonumber(words[5])),
		Increment = math.floor(tonumber(words[6])),
		Time = math.floor(tonumber(words[7])),
		Description = string.gsub(words[8],"_"," "),
		Bidder = Bidding.Messages[18],
	}
	table.insert(Bids,NewBid)
	table.save(Bids,Bidding.SavePath,"w")
	Bidding.Reload()
end

--Reload the NPC, to refresh prices etc
function Bidding.Reload()
	Bidding.AssignExpiredItems()
	for i,v in pairs(Bidding.Name) do
		NpcInfoReload(v,BiddingNPC)
	end
end

--Pads string to 42 chars.
function Bidding.PadString(str)
	local Len = string.len(str)
	local Lines = math.ceil(Len/42)
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

--pad a multiline string
function Bidding.MultiLinePadString (str)
	local words = split(str, " ")
	local count = table.getn(words)
	local finalStrings = {}
	local Lines = 0
	finalStrings[Lines] = ""
	for i,v in words do
		if string.len(finalStrings[Lines]) + string.len(v)  > 42 then
			finalStrings[Lines] = Bidding.PadString(finalStrings[Lines])
			Lines = Lines + 1
			finalStrings[Lines] = ""
		end
		finalStrings[Lines] = finalStrings[Lines]..v.." "
		if i == count then
			finalStrings[Lines] = Bidding.PadString(finalStrings[Lines])
		end
	end
	local finalString = ""
	for i = 0, Lines do
		finalString = finalString..finalStrings[i]
	end
	return finalString
end

--Returns the standard unix time, adjusted to timezone
function Bidding.SystemTimeNow()
	local TimeNow = os.date("*t")
	local Value = os.time{day = TimeNow.day ,month = TimeNow.month,year = TimeNow.year,hour = TimeNow.hour, min = TimeNow.min,sec = TimeNow.sec}
	return Value + (3600 * Bidding.TimeZone)
end