
-- You can safely edit this. m(^_^)m
	Beach.Conf.MapName 				= "Sandy Beach"				-- This is the overall map name, also displayed in notices/messages.
	Beach.Conf.SavePath				= GetResPath("beach/Var/")	-- Save path to save daily entered times.
	Beach.Conf.PerDay 				= 10							-- Number of times a player can participate, leave "0" if they can participate without limits.
	Beach.Conf.NumMapCopy 			= 1							-- Number of map copies available, you must either edit ctrl.lua (v1.X) or MapCopyNum.txt (v2.X) to the same number.
	Beach.Conf.NumPlayer 			= 5							-- Number of players that can enter per match.
	Beach.Conf.MinLv 				= 1						-- Set a minimum level to be able to register.
	Beach.Conf.MaxLv 				= 9000						-- Set a maximum level to be able to register.
	Beach.Conf.Member 				= 2						-- Minimum players in party needed to register.
	Beach.Conf.Class 				= 2							-- Cannot allow this many of same class on party.
	Beach.Conf.ServerLv				= 5000						-- Maximum player level on server.
	
	Beach.Conf.OpenDay				= {0,1,2,3,4,5,6}			-- Set the days available to register for Beach.	
	Beach.Conf.OpenHour				= {5,6,7,8,9,16,17,18,19,20,21}				-- Set the hours available to register for Beach.	
	Beach.Conf.Distance				= 1500						-- The distance party members must be within register NPC.
	
	Beach.Conf.Balance[8] 			= {Max = {HP = 5570, SP = 155}, Attack = {Min = 332, Max = 428, Speed = 500}, Defense = 292, PhysicalResist = 28, HitRate = 146, Dodge = 142, Critical = 15, Recovery = {HP = 56, SP = 2}, MoveSpeed = 900}	
	Beach.Conf.Balance[9] 			= {Max = {HP = 2858, SP = 155}, Attack = {Min = 352, Max = 387, Speed = 500}, Defense = 125, PhysicalResist = 25, HitRate = 151, Dodge = 181, Critical = 15, Recovery = {HP = 31, SP = 3}, MoveSpeed = 900}	
	Beach.Conf.Balance[12] 			= {Max = {HP = 2811, SP = 155}, Attack = {Min = 398, Max = 525, Speed = 500}, Defense = 105, PhysicalResist = 25, HitRate = 185, Dodge = 161, Critical = 15, Recovery = {HP = 34, SP = 1}, MoveSpeed = 900}
	Beach.Conf.Balance[13] 			= {Max = {HP = 2953, SP = 1700}, Attack = {Min = 168, Max = 234, Speed = 500}, Defense = 118, PhysicalResist = 24, HitRate = 154, Dodge = 148, Critical = 15, Recovery = {HP = 42, SP = 19}, MoveSpeed = 900}
	Beach.Conf.Balance[14] 			= {Max = {HP = 3652, SP = 1341}, Attack = {Min = 168, Max = 234, Speed = 500}, Defense = 137, PhysicalResist = 24, HitRate = 154, Dodge = 147, Critical = 15, Recovery = {HP = 55, SP = 15}, MoveSpeed = 900}
	Beach.Conf.Balance[16] 			= {Max = {HP = 3707, SP = 1307}, Attack = {Min = 162, Max = 215, Speed = 500}, Defense = 139, PhysicalResist = 24, HitRate = 146, Dodge = 147, Critical = 15, Recovery = {HP = 52, SP = 16}, MoveSpeed = 900}
	
	Beach.Conf.Time.Close 			= 12						-- Time in seconds to close map copy after kill BOSS.
	Beach.Conf.Time.Map 			= 1200						-- Overall time duration to players complete the dungeon (20 minutes).
	Beach.Conf.Time.CloseShow		= {1,2,3,4,5,6,7,8,9,10,30,45,60,120,180,240,300,360,420,480,540,600,660,720,780,840,900}
	
	Beach.Conf.Mob 					= {id = 186, qty = 75}	
	Beach.Conf.Boss.Id 				= 274
	
	Beach.Rewards.Boss.Reputation 	= 100
	Beach.Rewards.Boss.Gold 		= 5000000
	Beach.Rewards.Boss.Honor 		= 0
	Beach.Rewards.Boss.EXP 			= 0	
	Beach.Rewards.Boss.Items[1] 	= {ID = 7720, Quantity = 5, Quality = 4} 	-- Heaven's Berry 3*
	Beach.Rewards.Boss.Items[2] 	= {ID = 7993, Quantity = 5, Quality = 4} 	-- Fruit of Growth 3*
	Beach.Rewards.Boss.Items[3] 	= {ID = 7915, Quantity = 2, Quality = 4} 	-- Amplifier of Strive
	Beach.Rewards.Boss.Items[4] 	= {ID = 7958, Quantity = 1, Quality = 4} 	-- Charmed Berry
	Beach.Rewards.Boss.Items[4] 	= {ID = 7503, Quantity = 1, Quality = 4} 	-- Party EXP Fruit
	Beach.Rewards.Boss.Items[5] 	= {ID = 7624, Quantity = 1, Quality = 4} 	-- Refining Gem

Beach_NPC = function()
	Talk(1, "\213\238\242\232\242\229 \239\238\239\224\241\242\252 \237\224 \239\235\255\230? ")
	Text(1, "\208\229\227\232\241\242\240\224\246\232\255", Beach.Register)
	Text(1, "\205\229 \241\229\233\247\224\241", CloseTalk)
end

Beach_Crab = function()
	Talk(1, "")
	InitTrigger()
	TriggerCondition(1, Beach.NotActive)
	TriggerAction(1, Beach.Activate)
	TriggerFailure(1, JumpPage, 2)
	Text(1, "\192\234\242\232\226\232\240\238\226\224\242\252 \207\235\255\230", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk(2, "\207\235\255\230 \226 \228\224\237\237\251\233 \236\238\236\229\237\242 \231\224\237\255\242 \228\240\243\227\232\236 \238\242\240\255\228\238\236,\238\230\232\228\224\233\242\229 \232\245 \226\251\245\238\228\224 ")
end