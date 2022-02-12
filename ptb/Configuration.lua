
-- You can safely edit this. m(^_^)m
	PTB.Conf.MapName 			= "\204\232\237\237\238\229 \207\238\235\229"			-- This is the overall map name, also displayed in notices/messages.
	PTB.Conf.SavePath			= GetResPath("ptb/Var/")
	PTB.Conf.MatchesPerDay 		= 0							-- Number of times a player can participate, leave "0" if they can participate without limits.
	PTB.Conf.NumMapCopy 		= 1							-- Number of map copies available, you must either edit ctrl.lua (v1.X) or MapCopyNum.txt (v2.X) to the same number.
	PTB.Conf.NumPlayer 			= 6							-- Number of players that can enter per match.
	PTB.Conf.MinLv 				= 1							-- Set a minimum level to be able to register.
	PTB.Conf.MaxLv 				= 9000							-- Set a maximum level to be able to register.
	PTB.Conf.ServerLv			= 9000						-- Set the max level available in server, this is needed for EXP rewards.
	PTB.Conf.SpawnTimer			= 5							-- Time in seconds to revive a dead player.
	PTB.Conf.ServerVersion 		= 1							-- This is your server's version (v1.X = 1, v2.X = 2). If your server is v1.x and you put 1, it will automatically create the copies. If your server version is v2.x, put 2 and you have to manually adjust MapCopyNum.txt.
	PTB.Conf.MapType 			= 16						-- This is your map type, it should be different from any other maps you may have, be sure to check your maps or "is_friend" function to avoid duplicates.
	
	PTB.Conf.Time.Init 			= 10						-- Countdown time (in seconds) to start match after player were sent inside map.
	PTB.Conf.Time.Map 			= 900						-- Overall time duration of the whole match, must be at least a few times bigger the the time for round.
	PTB.Conf.Time.Round 		= 120						-- Time duration of a round.
	PTB.Conf.Time.Refresh 		= 30						-- Time (in seconds) to announce round and team score in system.
	
	PTB.Conf.Time.Planting 		= 8							-- Time (in seconds) to plant the bomb in any zone.
	PTB.Conf.Time.Defusing 		= 8							-- Time (in seconds) to defuse the bomb in any zone.
	PTB.Conf.Time.Defuse 		= 60						-- Time (in seconds) to defuse the bomb after planted by red team.
	
	PTB.Conf.OpenDay			= {0,1,2,3,4,5,6}			-- Set the days available to register for Plant The Bomb.	
	PTB.Conf.OpenHour			= {12,13,14,15,16,17,18,19,20,21,22,23,1,2,3,4,5,6,7,8,9}				-- Set the hours available to register for Plant The Bomb.
	
	-- This are the coordinates to the zones which where bomb can be planted/defused (X,Y)
	PTB.Conf.BombZone[1] 		= {12100, 13000, 
									5100, 6000}
	PTB.Conf.BombZone[2] 		= {11900, 12900, 
									13900, 14900}
						
	-- This are the rewards given at the end of the match to the green team
	-- If values are set to "0", if will not prompt to give out that reward, including items.
	-- For "EXP", it's in percentage of player's current level.	
	PTB.Rewards[1].Reputation	= 0
	PTB.Rewards[1].Gold			= 0
	PTB.Rewards[1].Honor			= 0
	PTB.Rewards[1].EXP			= 0
	PTB.Rewards[1].Items[1]		= {ID = 7720, Quantity = 10, Quality = 4}
	
	-- This are the rewards given at the end of the match to the red team
	-- If values are set to "0", if will not prompt to give out that reward, including items.
	-- For "EXP", it's in percentage of player's current level.	
	PTB.Rewards[2].Reputation	= 500
	PTB.Rewards[2].Gold			= 0
	PTB.Rewards[2].Honor			= 0
	PTB.Rewards[2].EXP			= 0
	PTB.Rewards[2].Items[1]		= {ID = 7720, Quantity = 10, Quality = 4}	
	
	-- You can edit this if you are using a different map than the one that came with the files and modify the coordinates if you want different spawns.
	-- This also affects in the code if you aren't using the random spawn function.
	PTB.Spawns[1] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 1", X = 43, Y = 100}
	PTB.Spawns[2] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 2", X = 176, Y = 99}
	PTB.Spawns[3] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 3", X = 160, Y = 159}
	PTB.Spawns[4] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 4", X = 141, Y = 157}
	PTB.Spawns[5] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 5", X = 109, Y = 145}
	PTB.Spawns[6] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 6", X = 127, Y = 110}
	PTB.Spawns[7] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 7", X = 88, Y = 150}
	PTB.Spawns[8] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 8", X = 89, Y = 104}
	PTB.Spawns[9] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 9", X = 106, Y = 82}
	PTB.Spawns[10] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 10", X = 144, Y = 58}	
	PTB.Spawns[11] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 10", X = 107, Y = 33}	
	PTB.Spawns[12] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 10", X = 147, Y = 34}	
	PTB.Spawns[13] 				= {Name = PTB.Conf.MapName, Map = "ptb", Spawn = "PTB 10", X = 159, Y = 57}	

PTB_NPC = function()
	Talk(1, "\196\238\225\240\238 \239\238\230\224\235\238\226\224\242\252 \254\237\251\233 \239\238\228\240\251\226\237\232\234,\237\229 \230\229\235\224\229\248\252 \239\238\241\238\240\229\226\237\238\226\224\242\252\241\255 \241 \228\240\243\227\232\236\232 \239\238\228\240\251\226\237\232\234\224\236\232 \226 \236\238\229\233 \231\238\237\229 \239\238\228 \237\224\231\226\224\237\232\229\236  ["..PTB.Conf.MapName.."].")
	Text(1, "\213\238\247\243", PTB.Register)
end