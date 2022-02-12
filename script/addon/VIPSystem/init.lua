--*------------------------------------------*--
--* dir parent	: addon	     	   	 	*--
--* File name		: VIPSystem.lua     		*--
--* Created by 	: Valdiney Eviles			*--
--* Discord		: Eviles#2759				*--
--* PKOdev		: @Satan					*--
--* Credits		: @Billy Hemphill			*--
--*------------------------------------------*--
print("* Loading VIPSystem.lua")

VIPSystem							= {}
VIPSystem.Conf						= {}
VIPSystem.Conf.Card					= {}
VIPSystem.Conf.Bonus				= {}
VIPSystem.Conf.Rewards				= {}
VIPSystem.Conf.Rewards[1]			= {}
VIPSystem.Conf.Rewards[1].Items		= {}
VIPSystem.Conf.Rewards[2]			= {}
VIPSystem.Conf.Rewards[2].Items		= {}
VIPSystem.Conf.Rewards[3]			= {}
VIPSystem.Conf.Rewards[3].Items		= {}

VIPSystem.Conf.Path					= GetResPath(string.format("script/addon/VIPSystem/%s.dat", "vipStatus"))				-- Directory to save VIP information of player.
VIPSystem.Conf.StateID				= 238																				-- Skilleff.txt line ID.

VIPSystem.Conf.Card[7958]			= {Lv = 1, Time = (1*60*60*24)}--1 день	
VIPSystem.Conf.Card[7959]			= {Lv = 1, Time = (10*60*60*24)}--10 дней
VIPSystem.Conf.Card[7960]			= {Lv = 1, Time = (30*60*60*24)}--30 дней														--Lv1 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7961]			= {Lv = 2, Time = (1*60*60*24)}														--Lv2 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7962]			= {Lv = 2, Time = (10*60*60*24)}														--Lv2 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7963]			= {Lv = 2, Time = (30*60*60*24)}														--Lv2 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7964]			= {Lv = 3, Time = (1*60*60*24)}														--Lv3 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7965]			= {Lv = 3, Time = (10*60*60*24)}														--Lv3 VIP Card, 30 day(s) duration (seconds).
VIPSystem.Conf.Card[7966]			= {Lv = 3, Time = (30*60*60*24)}														--Lv3 VIP Card, 30 day(s) duration (seconds).


VIPSystem.Conf.Bonus[1]				= {STR = 500, AGI = 500, ACC = 500, CON = 500, SPR = 500, DEF = 50000, PR = 10, MSPD = 50}	-- Attribute bonuses for Lv1 VIP.
VIPSystem.Conf.Bonus[2]				= {STR = 1000, AGI = 1000, ACC = 1000, CON = 1000, SPR = 1000, DEF = 100000, PR = 20, MSPD = 100}	-- Attribute bonuses for Lv2 VIP.
VIPSystem.Conf.Bonus[3]				= {STR = 1500, AGI = 1500, ACC = 1500, CON = 1500, SPR = 1500, DEF = 150000, PR = 30, MSPD = 150}	-- Attribute bonuses for Lv2 VIP.

-- Rewards for VIP Lv1.
VIPSystem.Conf.Rewards[1].Gold		= 100																				-- Amount gold that player will receive when using Lv1 VIP Card.
VIPSystem.Conf.Rewards[1].Items[1]	= {ID = 885, Quantity = 1, Quality = 101}											-- Items that player will receive when using Lv1 VIP Card.

-- Rewards for VIP Lv2.
VIPSystem.Conf.Rewards[2].Gold		= 200																				-- Amount gold that player will receive when using Lv2 VIP Card.
VIPSystem.Conf.Rewards[2].Items[1]	= {ID = 885, Quantity = 1, Quality = 102}											-- Items that player will receive when using Lv2 VIP Card.

-- Rewards for VIP Lv3.
VIPSystem.Conf.Rewards[3].Gold		= 300																				-- Amount gold that player will receive when using Lv3 VIP Card.
VIPSystem.Conf.Rewards[3].Items[1]	= {ID = 885, Quantity = 1, Quality = 103}											-- Items that player will receive when using Lv3 VIP Card.

VIPSystem.Talk						= {
	"\207\240\232\226\229\242,\243 \236\229\237\255 \236\238\230\237\238 \239\240\238\226\229\240\232\242\252 \241\226\238\233 \226\232\239 \241\242\224\242\243\241! ",
	"\211\231\237\224\242\252 \241\226\238\233 \226\232\239 \241\242\224\242\243\241",
	"\211\231\237\224\242\252 \239\240\238 \194\200\207 \241\232\241\242\229\236\243",
	"\205\229 \241\229\233\247\224\241",
	"\194\241\229\227\238 3 \243\240\238\226\237\255 \226\232\239,\234\224\230\228\251\233 \243\240\238\226\229\237\252 \243\226\229\235\232\247\232\226\224\229\242 \226\224\248\232 \245\224\240\224\234\242\229\240\232\241\242\232\234\232 \237\224 500,\231\224\249\232\242\243 \237\224 50.000,\225\229\227 \237\224 100 \232 \248\224\237\241 \226\251\239\224\228\229\237\232\255 \226\229\249\229\233 \237\224 10%",
	"H\202\224\234 \239\238\235\243\247\232\242\252 \194\200\207?",
	"How to receive rewards and benefits?",
	"What is renew?",
	"What happens if i don't renew?",
	"What are rewards and benefits?",
	"\207\238\235\243\247\232\242\252 \194\200\207 \241\242\224\242\243\241 \236\238\230\237\238 \225\243\228\229\242 \232\227\240\238\226\251\236 \239\243\242\184\236 \241 26 \247\232\241\235\224 \253\242\238\227\238 \236\229\241\255\246\224,\226\241\229 \239\238\228\240\238\225\237\238\241\242\232 \225\243\228\243\242 \243 \236\229\237\255!",
	"Layla: After you purchase, the Game Master will have a contact with you to send the VIP Card according to amount donated.",
	"Layla: Renew is the amount of Item Mall Point(s) you should purchase during the VIP time to maintain the same VIP Level for another 30 day(s).",
	"Layla: If you don't purchase the renew during your VIP time, after 30 days, your VIP Level will be decreased or removed. For eg: If you're VIP-3, after 30 days, you will be VIP-2, but, if you are VIP-1, you will lose all the VIP benefits.",
	"Layla: VIP Rewards are special prizes which you receive every 30 days according to you VIP Level. VIP benefits are bonuses granted.__Note: The VIP rewards are showed in first NPC page, check the option [VIP Levels].",
	"Cannot use while sailing!",
	"\210\240\229\225\243\229\242\241\255 %d \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229",
	"VIP Card no longer registered.",
	"\207\238\235\243\247\229\237 \194\200\207 \241\242\224\242\243\241 %d\243\240\238\226\237\255 \237\224 %s \228\237\229\233!",
	"-- [\194\200\207 \209\242\224\242\243\241] --",
	"\194\200\207 \243\240\238\226\229\237\252: ",
	"\194\200\207 \224\234\242\232\226\232\240\238\226\224\237: ",
	"\194\200\207 \231\224\234\238\237\247\232\242\252\241\255: ",
	"\194\200\207 \238\241\242\224\235\238\241\252: ",
	" \228\237\229\233",
	"\194\200\207 \241\242\224\242\243\241 \237\229\224\234\242\232\226\229\237",
	"\194\251 \237\229 \232\236\229\229\242\229 \194\200\207 \241\242\224\242\243\241\224",
}

VIPSystem.SystemTimeNow				= function()
	local OsTime 					= os.date("*t")
	local Time 						= os.time{day = OsTime.day, month = OsTime.month, year = OsTime.year, hour = OsTime.hour, min = OsTime.min, sec = OsTime.sec}
	return Time
end

VIPSystem.CheckVIP					= function(Player)
	local Table						= DataFile:Init(VIPSystem.Conf.Path, Table):Load()
	local PID						= GetCharID(Player)	
	if (Table[PID] == nil) or (Table[PID].Duration <= VIPSystem.SystemTimeNow()) then
		return false
	end
	return true
end

VIPSystem.ApplyEffect				= function(Player)
	if (IsPlayer(Player) == 1) then
		if (VIPSystem.CheckVIP(Player) == true) then
			AddState(Player, Player, VIPSystem.Conf.StateID, 1, 0)
		else
			if (GetChaStateLv(Player, VIPSystem.Conf.StateID) > 0) then
				RemoveState(Player, VIPSystem.Conf.StateID)
			end
		end
	end
end

State_VIP_Add						= function(Player, StateLv)
	local Table						= DataFile:Init(VIPSystem.Conf.Path, Table):Load()
	local PID						= GetCharID(Player)
	if (Table[PID] ~= nil) then
		local VIPLv					= Table[PID].VIPLv
		if (VIPLv ~= nil) and (VIPLv > 0) then
			local STR					= VIPSystem.Conf.Bonus[VIPLv].STR
			local AGI					= VIPSystem.Conf.Bonus[VIPLv].AGI
			local ACC					= VIPSystem.Conf.Bonus[VIPLv].ACC
			local CON					= VIPSystem.Conf.Bonus[VIPLv].CON
			local SPR					= VIPSystem.Conf.Bonus[VIPLv].SPR
			local DEF					= VIPSystem.Conf.Bonus[VIPLv].DEF
			local PR						= VIPSystem.Conf.Bonus[VIPLv].PR
			local MSPD					= VIPSystem.Conf.Bonus[VIPLv].MSPD	
			SetCharaStatev(STR, Player, ATTR_STATEV_STR, "STATE_VIP")
			SetCharaStatev(SPR, Player, ATTR_STATEV_STA, "STATE_VIP")
			SetCharaStatev(AGI, Player, ATTR_STATEV_AGI, "STATE_VIP")
			SetCharaStatev(CON, Player, ATTR_STATEV_CON, "STATE_VIP")
			SetCharaStatev(ACC, Player, ATTR_STATEV_DEX, "STATE_VIP")				
			SetCharaStatev(DEF, Player, ATTR_STATEV_DEF, "STATE_VIP")				
			SetCharaStatev(PR, Player, ATTR_STATEV_PDEF, "STATE_VIP")				
			SetCharaStatev(MSPD, Player, ATTR_STATEV_MSPD, "STATE_VIP")			
			ALLExAttrSet(Player)	
		end
	end
end

State_VIP_Rem							= function(Player, Statelv)
	RemCharaStatev(0, Player, ATTR_STATEV_STR, "STATE_VIP")
	RemCharaStatev(0, Player, ATTR_STATEV_STA, "STATE_VIP")
	RemCharaStatev(0, Player, ATTR_STATEV_AGI, "STATE_VIP")
	RemCharaStatev(0, Player, ATTR_STATEV_CON, "STATE_VIP")
	RemCharaStatev(0, Player, ATTR_STATEV_DEX, "STATE_VIP")				
	RemCharaStatev(0, Player, ATTR_STATEV_DEF, "STATE_VIP")				
	RemCharaStatev(0, Player, ATTR_STATEV_PDEF, "STATE_VIP")				
	RemCharaStatev(0, Player, ATTR_STATEV_MSPD, "STATE_VIP")	
	ALLExAttrSet(Player)
end

VIPStatus							= function(Player, Item)
	if (ChaIsBoat(Player) == 1) then
		SystemNotice(Player, VIPSystem.Talk[16])
		UseItemaFailed(Player)
		return
	end
	if (GetChaFreeBagGridNum(Player) < 6) then
		SystemNotice(Player, string.format(VIPSystem.Talk[17], 1))
		UseItemFailed(Player)
		return
	end	
	local Table						= DataFile:Init(VIPSystem.Conf.Path, Table):Load()
	local PID						= GetCharID(Player)	
	local ItemID						= GetItemID(Item)
	local StateTime					= VIPSystem.Conf.Card[ItemID].Time
	local OsTime						= os.time()
	if (VIPSystem.Conf.Card[ItemID] == nil) then
		SystemNotice(Player, VIPSystem.Talk[18])
		UseItemFailed(Player)
		return
	end
	if (StateTime ~= nil) then
		if (VIPSystem.CheckVIP(Player) == false) then
			Table[PID]				= {VIPLv = 0, Start = OsTime, Duration = VIPSystem.SystemTimeNow()}
		end
		Table[PID].VIPLv				= VIPSystem.Conf.Card[ItemID].Lv
		Table[PID].Start				= OsTime
		Table[PID].Duration			= Table[PID].Duration + StateTime
		VIPSystem.GiveRewards(Player, VIPSystem.Conf.Rewards[Table[PID].VIPLv])
		local Left					= math.ceil((Table[PID].Duration - os.time()) / (60*60*24))	
		PopupNotice(Player, string.format(VIPSystem.Talk[19], VIPSystem.Conf.Card[ItemID].Lv, Left))
		DataFile:Init(VIPSystem.Conf.Path, Table):Save()		
	end
end	

VIPSystem.GiveRewards				= function(Player, Reward)
	if (Reward.Gold > 0) then
		AddMoney(Player, 0, Reward.Gold)
	end
	for i 							= 1, table.getn(Reward.Items), 1 do
		if Reward.Items[i].ID ~= 0 then
			if GetChaFreeBagGridNum(Player) > 0 then
				GiveItem(Player, 0, Reward.Items[i].ID, Reward.Items[i].Quantity, Reward.Items[i].Quality)
			else
				GiveItemX(Player, 0, Reward.Items[i].ID, Reward.Items[i].Quantity, Reward.Items[i].Quality)
			end
		end
	end	
end

VIPSystem.Display					= function(Player)
	local Table						= DataFile:Init(VIPSystem.Conf.Path, Table):Load()
	local PID						= GetCharID(Player)
	if (Table[PID] ~= nil) then
		local Message				= nil
		local Left					= math.ceil((Table[PID].Duration - os.time()) / (60*60*24))
		local VIPLv					= Table[PID].VIPLv
		local VIPSince				= os.date("%d/%m/%Y", Table[PID].Start)
		local VIPExpire				= os.date("%d/%m/%Y", Table[PID].Duration)
		Message						= AdjustTextSpace(VIPSystem.Talk[20], 44, "_")
		Message						= Message..AdjustTextSpace(VIPSystem.Talk[21], 12)..AdjustTextSpace(VIPLv, 28, "_")
		Message						= Message..AdjustTextSpace(VIPSystem.Talk[22], 12)..AdjustTextSpace(VIPSince, 26, "_")
		Message						= Message..AdjustTextSpace(VIPSystem.Talk[23], 9)..AdjustTextSpace(VIPExpire, 33, "_")
		Message						= Message..AdjustTextSpace(VIPSystem.Talk[24], 16)..AdjustTextSpace(Left..VIPSystem.Talk[25], 20, "_")
		if (VIPSystem.CheckVIP(Player) == true) then
			HelpInfo(Player, 0, Message)
		else
			HelpInfo(Player, 0, VIPSystem.Talk[26])
			return LUA_FALSE
		end
	else
		HelpInfo(Player, 0, VIPSystem.Talk[27])
		return LUA_FALSE
	end
end

VIP_NPC								= function()
	Talk(1, VIPSystem.Talk[1])
	Text(1, VIPSystem.Talk[2], VIPSystem.Display)
	Text(1, VIPSystem.Talk[3], JumpPage, 2)
	Text(1, VIPSystem.Talk[4], CloseTalk)
	
	Talk(2, VIPSystem.Talk[5])
	Text(2, VIPSystem.Talk[6], JumpPage, 3)
	--Text(2, VIPSystem.Talk[7], JumpPage, 4)
	--Text(2, VIPSystem.Talk[8], JumpPage, 5)
	--Text(2, VIPSystem.Talk[9], JumpPage, 6)
	--Text(2, VIPSystem.Talk[10], JumpPage, 7)
	
	Talk(3, VIPSystem.Talk[11])
	Talk(4, VIPSystem.Talk[12])
	Talk(5, VIPSystem.Talk[13])
	Talk(6, VIPSystem.Talk[14])
	Talk(7, VIPSystem.Talk[15])
end