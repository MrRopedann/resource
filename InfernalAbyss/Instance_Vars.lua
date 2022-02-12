print("	---* Loading [Infernal Abyss] Instance *---")
print("	Loading Instance_Vars.lua")
--print("* Loading Instance Functions PACK !")

function ResetInstanceVARS()
------------------------------------------
--------- DO NOT EDIT THESE --------------
------------------------------------------
Instance = {
boss = {},
tick = {},
wave = {},
rewards = {},
players = {},
bossNow = {},
waveNow = {},
waveDead = {},
closeCount = {},
waveDelay = {},
monsters = {},
openDay = {},
deadMob = {},
waveKill = {},
copyNow = 1
}

-------------------------------------------
------------ Modify These -----------------
-------------------------------------------
Instance.map = "InfernalAbyss" -- Map name
Instance.path = GetResPath(Instance.map.."/cache/") -- cache path
Instance.timer = 60 -- Time for the challenge to end in minutes
Instance.birth = "InfernalAbyss" -- Birth name from birthconf.lua
Instance.name = "Infernal Abyss"
-- Days the map open
Instance.openDay["Monday"] = true
Instance.openDay["Tuesday"] = true
Instance.openDay["Wednesday"] = true
Instance.openDay["Thursday"] = true
Instance.openDay["Friday"] = true
Instance.openDay["Saturday"] = true
Instance.openDay["Sunday"] = true
-- Enterance Requirements
Instance.reqLv = 5000
Instance.reqPt = 5
dofile(GetResPath("InfernalAbyss/Instance_monsterConf.lua"))
dofile(GetResPath("InfernalAbyss/Instance_functions.lua"))
end

ResetInstanceVARS()
--print("* Instance Function PACK loaded!")