-- ---------------------------
-- Conf.lua
-- ---------------------------
print("	>> Loading Conf.lua")

-- ---------------------------
-- Table Load;
------------------------------
SlayerRumble = {}

-- ---------------------------
-- Portal Coordinates Settings;
------------------------------
SlayerRumble.Portal = { EntryName = "\206\241\242\240\238\226 \193\238\227\224\242\241\242\226\224", Map = "magicsea", X = 689, Y = 791 }

-- ---------------------------
-- Portal Schedule Settings;
------------------------------
SlayerRumble.Time = { Open = "0/3/0", Close = "0/0/30", Shutdown = "0/0/40" }

-- ---------------------------
-- Winner Rewards;
-- ---------------------------
SlayerRumble.Rewards = { 
Money = 50000000,
{ ID = 7720, QUANTITY = 10, QUALITY = 4 },
{ ID = 7844, QUANTITY = 1, QUALITY = 4 }
}

-- ---------------------------
-- Birth Places;
-- ---------------------------
AddBirthPoint("Slayer Rumble", "SlayerRumble", 149,84)
AddBirthPoint("Slayer Rumble", "SlayerRumble", 121,83)
AddBirthPoint("Slayer Rumble", "SlayerRumble", 51,112)
AddBirthPoint("Slayer Rumble", "SlayerRumble", 54,45)
AddBirthPoint("Slayer Rumble", "SlayerRumble", 31,133)
AddBirthPoint("Slayer Rumble", "SlayerRumble", 61,86)

-- -----------------------------
-- Hooking Player kills player;
-- -----------------------------
PKPHook = GetExp_PKP
GetExp_PKP = function (dead, atk)
	if(GetChaMapName(atk) ~= "SlayerRumble")then
		PKPHook(dead, atk)
	else
		SlayerRumblePK(atk, dead)
	end
end

-- ---------------------------
-- Start up Init; - DONT TOUCH
------------------------------
function SlayerRumble:Init()
SlayerRumble.Players = {}
SlayerRumble.Opened = nil
SlayerRumble.Winner = nil
SlayerRumble.PlayerCounts = 0
SlayerRumble.Tick = 60
end