print("* Loading <Achievement> init.lua" )
dofile(GetResPath("script\\extensions\\Achievement\\quest.lua"))

Achievement = {}
Achievement.Combine	= GetResPath("script/extensions/Achievement/Combine/")
Achievement.LevelUp	= GetResPath("script/extensions/Achievement/LevelUp/")
Achievement.KillMonster = GetResPath("script/extensions/Achievement/KillMonster/")
Achievement.TimeOnline	= GetResPath("script/extensions/Achievement/TimeOnline/")

function AchievementUpdateCombine(role,lv)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	local Lv	= lv
	if(file_exists(Achievement.Combine..""..ChaID.."_Lv"..Lv..".txt") == true) then
		local Get	= table.load(Achievement.Combine..""..ChaID.."_Lv"..Lv..".txt","r")
		local GetNum	= Get.Num
		local Total	= GetNum + 1
		table.save({Num = Total},Achievement.Combine..""..ChaID.."_Lv"..Lv..".txt","w")

		if Total < 100 then
			BickerNotice(role,"Combining Gem Lv"..Lv.." "..Total.."/100")
		else
			BickerNotice(role,"Combining Gem Lv"..Lv.." Completed")
		end
	else
		table.save({Num = 1},Achievement.Combine..""..ChaID.."_Lv"..Lv..".txt","w")
		BickerNotice(role,"Combining Gem Lv"..Lv.." 1/100")
	end
end

------------
--Level Up--
------------
function AchievementLevelUp(ignore,role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	local Lv	= GetChaAttr(role,ATTR_LV)

	if(file_exists(Achievement.LevelUp..""..ChaID..".txt") == true) then
		local Get	= table.load(Achievement.LevelUp..""..ChaID..".txt","r")
		local GetLv10	= Get.Lv10
		local GetLv30	= Get.Lv30
		local GetLv50 	= Get.Lv50
		local GetLv70 	= Get.Lv70
		local GetLv100 	= Get.Lv100
		local GetLv120 	= Get.Lv120
		local GetLv150 	= Get.Lv150
		local GetLv200 	= Get.Lv200

		if GetLv120 == nil then
			GetLv120 = 0
		end
		if GetLv150 == nil then
			GetLv150 = 0
		end
		if GetLv200 == nil then
			GetLv200 = 0
		end

		if Lv == 10 then
			table.save({Lv10 = 1, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 30 then
			table.save({Lv10 = GetLv10, Lv30 = 1, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 50 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = 1, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 70 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = 1, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 100 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = 1, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 120 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = 1, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 150 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = 1, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 200 then
			table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = 1},Achievement.LevelUp..""..ChaID..".txt","w")
		end

	else
		if Lv == 10 then
			table.save({Lv10 = 1, Lv30 = 0, Lv50 = 0, Lv70 = 0, Lv100 = 0, Lv120 = 0, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 30 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 0, Lv70 = 0, Lv100 = 0, Lv120 = 0, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 50 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 0, Lv100 = 0, Lv120 = 0, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 70 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 1, Lv100 = 0, Lv120 = 0, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 100 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 1, Lv100 = 1, Lv120 = 0, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 120 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 1, Lv100 = 1, Lv120 = 1, Lv150 = 0, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 150 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 1, Lv100 = 1, Lv120 = 1, Lv150 = 1, Lv200 = 0},Achievement.LevelUp..""..ChaID..".txt","w")
		end
		if Lv == 200 then
			table.save({Lv10 = 1, Lv30 = 1, Lv50 = 1, Lv70 = 1, Lv100 = 1, Lv120 = 1, Lv150 = 1, Lv200 = 1},Achievement.LevelUp..""..ChaID..".txt","w")
		end
	end
end
Hook:AddPostHook("BsAttrUpgrade",AchievementLevelUp)

function DisplayAchievementLeveledUp(role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	local Lv10,Lv30,Lv50,Lv70,Lv100,Lv120,Lv150,Lv200 = 0,0,0,0,0,0,0,0
	if(file_exists(Achievement.LevelUp..""..ChaID..".txt") == true) then
		local Get = table.load(Achievement.LevelUp..""..ChaID..".txt","r")
		Lv10,Lv30,Lv50,Lv70,Lv100,Lv120,Lv150,Lv200 = Get.Lv10,Get.Lv30,Get.Lv50,Get.Lv70,Get.Lv100,Get.Lv120,Get.Lv150,Get.Lv200
	end

	if Lv10 == 1 then
		Lv10 = "Complete"
	elseif Lv10 == 2 then
		Lv10 = "Claimed"
	else
		Lv10 = "Incomplete"
	end

	if Lv30 == 1 then
		Lv30 = "Complete"
	elseif Lv30 == 2 then
		Lv30 = "Claimed"
	else
		Lv30 = "Incomplete"
	end

	if Lv50 == 1 then
		Lv50 = "Complete"
	elseif Lv50 == 2 then
		Lv50 = "Claimed"
	else
		Lv50 = "Incomplete"
	end

	if Lv70 == 1 then
		Lv70 = "Complete"
	elseif Lv70 == 2 then
		Lv70 = "Claimed"
	else
		Lv70 = "Incomplete"
	end

	if Lv100 == 1 then
		Lv100 = "Complete"
	elseif Lv100 == 2 then
		Lv100 = "Claimed"
	else
		Lv100 = "Incomplete"
	end

	if Lv120 == 1 then
		Lv120 = "Complete"
	elseif Lv120 == 2 then
		Lv120 = "Claimed"
	else
		Lv120 = "Incomplete"
	end

	if Lv150 == 1 then
		Lv150 = "Complete"
	elseif Lv150 == 2 then
		Lv150 = "Claimed"
	else
		Lv150 = "Incomplete"
	end

	if Lv200 == 1 then
		Lv200 = "Complete"
	elseif Lv200 == 2 then
		Lv200 = "Claimed"
	else
		Lv200 = "Incomplete"
	end

	HelpInfo(role,0,"             Level Up Achievement_Reach Lv10          : "..Lv10.."_Reach Lv30          : "..Lv30.."_Reach Lv50          : "..Lv50.."_Reach Lv70          : "..Lv70.."_Reach Lv100         : "..Lv100.."_Reach Lv120         : "..Lv120.."_Reach Lv150         : "..Lv150.."_Reach Lv200         : "..Lv200.."_")	
end

function ClaimLeveledUpReward(role,lv,reward)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	if(file_exists(Achievement.LevelUp..""..ChaID..".txt") == true) then
		local Get = table.load(Achievement.LevelUp..""..ChaID..".txt","r")
		local GetLv10	= Get.Lv10
		local GetLv30	= Get.Lv30
		local GetLv50 	= Get.Lv50
		local GetLv70 	= Get.Lv70
		local GetLv100 	= Get.Lv100
		local GetLv120 	= Get.Lv120
		local GetLv150 	= Get.Lv150
		local GetLv200 	= Get.Lv200

		if GetLv120 == nil then
			GetLv120 = 0
		end
		if GetLv150 == nil then
			GetLv150 = 0
		end
		if GetLv200 == nil then
			GetLv200 = 0
		end

		if lv == 10 then
			if GetLv10 == 1 then
				table.save({Lv10 = 2, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 30 then
			if GetLv30 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = 2, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 50 then
			if GetLv50 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = 2, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 70 then
			if GetLv70 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = 2, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 100 then
			if GetLv100 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = 2, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 120 then
			if GetLv120 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = 2, Lv150 = GetLv150, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 150 then
			if GetLv150 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = 2, Lv200 = GetLv200},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end

		elseif lv == 200 then
			if GetLv200 == 1 then
				table.save({Lv10 = GetLv10, Lv30 = GetLv30, Lv50 = GetLv50, Lv70 = GetLv70, Lv100 = GetLv100, Lv120 = GetLv120, Lv150 = GetLv150, Lv200 = 2},Achievement.LevelUp..""..ChaID..".txt","w")
				GiveItem(role,0,7482,reward,4)
			else
				HelpInfo(role,0,"You already claimed the reward.")
				return
			end
		else
			HelpInfo(role,0,"System Error!")
			return
		end
	else
		HelpInfo(role,0,"Sorry nothing to do here!")
		return
	end
end

-----------------
--Monster Kills--
-----------------
function AchievementKillMonster(ignore,dead,atk)
	local ChaID	= GetPlayerID(GetChaPlayer(atk))
	if(file_exists(Achievement.KillMonster..""..ChaID..".txt") == true) then
		local Get		= table.load(Achievement.KillMonster..""..ChaID..".txt","r")
		local GetKillNum	= Get.KillNum
		local GetKill1K		= Get.Kill1K
		local GetKill5K		= Get.Kill5K
		local GetKill10K	= Get.Kill10K
		local GetKill25K	= Get.Kill25K
		local GetKill50K	= Get.Kill50K
		local GetKill100K	= Get.Kill100K
		local GetKill200K	= Get.Kill200K
		local GetKill500K	= Get.Kill500K
		local KillNumAdd	= GetKillNum + 1

		if GetKill100K == nil then
			GetKill100K = 0
		end
		if GetKill200K == nil then
			GetKill200K = 0
		end
		if GetKill500K == nil then
			GetKill500K = 0
		end

		if KillNumAdd >= 1000 and GetKill1K == 0 then
			GetKill1K = 1
		end
		if KillNumAdd >= 5000 and GetKill5K == 0 then
			GetKill5K = 1
		end
		if KillNumAdd >= 10000 and GetKill10K == 0 then
			GetKill10K = 1
		end
		if KillNumAdd >= 25000 and GetKill25K == 0 then
			GetKill25K = 1
		end
		if KillNumAdd >= 50000 and GetKill50K == 0 then
			GetKill50K = 1
		end
		if KillNumAdd >= 100000 and GetKill100K == 0 then
			GetKill100K = 1
		end
		if KillNumAdd >= 200000 and GetKill200K == 0 then
			GetKill200K = 1
		end
		if KillNumAdd >= 500000 and GetKill500K == 0 then
			GetKill500K = 1
		end

		table.save({KillNum = KillNumAdd, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
	else
		table.save({KillNum = 1, Kill1K = 0, Kill5K = 0, Kill10K = 0, Kill25K = 0, Kill50K = 0, Kill100K = 0, Kill200K = 0, Kill500K = 0},Achievement.KillMonster..""..ChaID..".txt","w")
	end
end
Hook:AddPostHook("GetExp_PKM",AchievementKillMonster)

function DisplayAchievementMonsterKills(role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	local GetKillNum,Kill1K,Kill5K,Kill10K,Kill25K,Kill50K = 0,0,0,0,0,0
	if(file_exists(Achievement.KillMonster..""..ChaID..".txt") == true) then
		local Get	= table.load(Achievement.KillMonster..""..ChaID..".txt","r")
		GetKillNum	= Get.KillNum
		GetKill1K	= Get.Kill1K
		GetKill5K	= Get.Kill5K
		GetKill10K	= Get.Kill10K
		GetKill25K	= Get.Kill25K
		GetKill50K	= Get.Kill50K
		GetKill100K	= Get.Kill100K
		GetKill200K	= Get.Kill200K
		GetKill500K	= Get.Kill500K
	end

	if GetKill1K == 1 then
		GetKill1K = "Completed"
	elseif GetKill1K == 2 then
		GetKill1K = "Claimed"
	else
		if GetKillNum > 0 then
			GetKill1K = ""..GetKillNum.."/1000"
		else
			GetKill1K = "Incomplete"
		end
	end

	if GetKill5K == 1 then
		GetKill5K = "Completed"
	elseif GetKill5K == 2 then
		GetKill5K = "Claimed"
	else
		if GetKillNum > 1000 then
			GetKill5K = ""..GetKillNum.."/5000"
		else
			GetKill5K = "Incomplete"
		end
	end

	if GetKill10K == 1 then
		GetKill10K = "Completed"
	elseif GetKill10K == 2 then
		GetKill10K = "Claimed"
	else
		if GetKillNum > 5000 then
			GetKill10K = ""..GetKillNum.."/10000"
		else
			GetKill10K = "Incomplete"
		end
	end

	if GetKill25K == 1 then
		GetKill25K = "Completed"
	elseif GetKill25K == 2 then
		GetKill25K = "Claimed"
	else
		if GetKillNum > 10000 then
			GetKill25K = ""..GetKillNum.."/25000"
		else
			GetKill25K = "Incomplete"
		end
	end

	if GetKill50K == 1 then
		GetKill50K = "Completed"
	elseif GetKill50K == 2 then
		GetKill50K = "Claimed"
	else
		if GetKillNum > 25000 then
			GetKill50K = ""..GetKillNum.."/50000"
		else
			GetKill50K = "Incomplete"
		end
	end

	if GetKill100K == 1 then
		GetKill100K = "Completed"
	elseif GetKill100K == 2 then
		GetKill100K = "Claimed"
	else
		if GetKillNum > 50000 then
			GetKill100K = ""..GetKillNum.."/100000"
		else
			GetKill100K = "Incomplete"
		end
	end

	if GetKill200K == 1 then
		GetKill200K = "Completed"
	elseif GetKill200K == 2 then
		GetKill200K = "Claimed"
	else
		if GetKillNum > 100000 then
			GetKill200K = ""..GetKillNum.."/200000"
		else
			GetKill200K = "Incomplete"
		end
	end

	if GetKill500K == 1 then
		GetKill500K = "Completed"
	elseif GetKill500K == 2 then
		GetKill500K = "Claimed"
	else
		if GetKillNum > 200000 then
			GetKill500K = ""..GetKillNum.."/500000"
		else
			GetKill500K = "Incomplete"
		end
	end			
	HelpInfo(role,0,"                 Achievement_Kills 1K Monster    : "..GetKill1K.."_Kills 5K Monster    : "..GetKill5K.."_Kills 10K Monster   : "..GetKill10K.."_Kills 25K Monster   : "..GetKill25K.."_Kills 50K Monster   : "..GetKill50K.."_Kills 100K Monster  : "..GetKill100K.."_Kills 200K Monster  : "..GetKill200K.."_Kills 500K Monster  : "..GetKill500K.."_")	
end

function ClaimMonsterKillsReward(role,kill,reward)
	local ChaName	= GetChaDefaultName(role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	if(file_exists(Achievement.KillMonster..""..ChaID..".txt") == true) then
		local Get		= table.load(Achievement.KillMonster..""..ChaID..".txt","r")
		local GetKillNum	= Get.KillNum
		local GetKill1K		= Get.Kill1K
		local GetKill5K		= Get.Kill5K
		local GetKill10K	= Get.Kill10K
		local GetKill25K	= Get.Kill25K
		local GetKill50K	= Get.Kill50K
		local GetKill100K	= Get.Kill100K
		local GetKill200K	= Get.Kill200K
		local GetKill500K	= Get.Kill500K

		if kill == 1000 then
			if GetKillNum >= kill and GetKill1K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = 2, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 5000 then
			if GetKillNum >= kill and GetKill5K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = 2, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 10000 then
			if GetKillNum >= kill and GetKill10K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = 2, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 25000 then
			if GetKillNum >= kill and GetKill25K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = 2, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 50000 then
			if GetKillNum >= kill and GetKill50K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = 2, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 100000 then
			if GetKillNum >= kill and GetKill100K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = 2, Kill200K = GetKill200K, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 200000 then
			if GetKillNum >= kill and GetKill200K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = 2, Kill500K = GetKill500K},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif kill == 500000 then
			if GetKillNum >= kill and GetKill500K == 1 then
				table.save({KillNum = GetKillNum, Kill1K = GetKill1K, Kill5K = GetKill5K, Kill10K = GetKill10K, Kill25K = GetKill25K, Kill50K = GetKill50K, Kill100K = GetKill100K, Kill200K = GetKill200K, Kill500K = 2},Achievement.KillMonster..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end
		else
			HelpInfo(role,0,"System error!")
			return
		end	
	else
		HelpInfo(role,0,"Sorry nothing to do here!")
		return
	end
end

---------------
--Time Online--
---------------
function TimeOnlineCounter(ignore,role)
	if IsPlayer(role) == 1 then
		local ChaID	= GetPlayerID(GetChaPlayer(role))
		local Get,GetTimeOnline,Update = 0,0,0
		if(file_exists(Achievement.TimeOnline..""..ChaID..".txt") ~= false) then
			Get		= table.load(Achievement.TimeOnline..""..ChaID..".txt","r")
			GetTimeOnline	= Get.TimeOnline
			Update		= GetTimeOnline + 1
			local Get1Hours	= Get.Hours1
			local Get2Hours	= Get.Hours2
			local Get4Hours	= Get.Hours4
			local Get8Hours	= Get.Hours8
			local Get12Hours = Get.Hours12
			local Get24Hours = Get.Hours24
			local Get48Hours = Get.Hours48
			local Get72Hours = Get.Hours72
			local Get96Hours = Get.Hours96
			local Get120Hours = Get.Hours120
			local Get144Hours = Get.Hours144
			local Get168Hours = Get.Hours168
			local Get192Hours = Get.Hours192
			local Get216Hours = Get.Hours216
			local Get240Hours = Get.Hours240
			local Get480Hours = Get.Hours480
			local Get1000Hours = Get.Hours1000
			local Get1500Hours = Get.Hours1500
			local Get2000Hours = Get.Hours2000
			local Get5000Hours = Get.Hours5000

			if Update >= 3600 and Get1Hours == 0 then
				Get1Hours = 1
			end
			if Update >= 7200 and Get2Hours == 0 then
				Get2Hours = 1
			end
			if Update >= 14400 and Get4Hours == 0 then
				Get4Hours = 1
			end
			if Update >= 28800 and Get8Hours == 0 then
				Get8Hours = 1
			end
			if Update >= 43200 and Get12Hours == 0 then
				Get12Hours = 1
			end
			if Update >= 86400 and Get24Hours == 0 then
				Get24Hours = 1
			end
			if Update >= 172800 and Get48Hours == 0 then
				Get48Hours = 1
			end
			if Update >= 259200 and Get72Hours == 0 then
				Get72Hours = 1
			end
			if Update >= 345600 and Get96Hours == 0 then
				Get96Hours = 1
			end
			if Update >= 432000 and Get120Hours == 0 then
				Get120Hours = 1
			end
			if Update >= 518400 and Get144Hours == 0 then
				Get144Hours = 1
			end
			if Update >= 604800 and Get168Hours == 0 then
				Get168Hours = 1
			end
			if Update >= 691200 and Get192Hours == 0 then
				Get192Hours = 1
			end
			if Update >= 777600 and Get216Hours == 0 then
				Get216Hours = 1
			end
			if Update >= 864000 and Get240Hours == 0 then
				Get240Hours = 1
			end
			if Update >= 1728000 and Get480Hours == 0 then
				Get480Hours = 1
			end
			if Update >= 3600000 and Get1000Hours == 0 then
				Get1000Hours = 1
			end
			if Update >= 5400000 and Get1500Hours == 0 then
				Get1500Hours = 1
			end
			if Update >= 7200000 and Get2000Hours == 0 then
				Get2000Hours = 1
			end
			if Update >= 18000000 and Get5000Hours == 0 then
				Get5000Hours = 1
			end
			table.save({TimeOnline = Update,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
		else
			table.save({TimeOnline = 0,Hours1 = 0,Hours2 = 0,Hours4 = 0,Hours8 = 0,Hours12 = 0,Hours24 = 0,Hours48 = 0,Hours72 = 0,Hours96 = 0,Hours120 = 0,Hours144 = 0,Hours168 = 0,Hours192 = 0,Hours216 = 0,Hours240 = 0,Hours480 = 0,Hours1000 = 0,Hours1500 = 0,Hours2000 = 0,Hours5000 = 0},Achievement.TimeOnline..""..ChaID..".txt","w")
		end
	end
end
Hook:AddPostHook("custom_cha_timer",TimeOnlineCounter)

function DisplayAchievementTimeOnline(role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	if(file_exists(Achievement.TimeOnline..""..ChaID..".txt") == true) then
		local Get		= table.load(Achievement.TimeOnline..""..ChaID..".txt","r")
		local GetTimeOnline	= Get.TimeOnline
		local Get1Hours	= Get.Hours1
		local Get2Hours	= Get.Hours2
		local Get4Hours	= Get.Hours4
		local Get8Hours	= Get.Hours8
		local Get12Hours = Get.Hours12
		local Get24Hours = Get.Hours24
		local Get48Hours = Get.Hours48
		local Get72Hours = Get.Hours72
		local Get96Hours = Get.Hours96
		local Get120Hours = Get.Hours120
		local Get144Hours = Get.Hours144
		local Get168Hours = Get.Hours168
		local Get192Hours = Get.Hours192
		local Get216Hours = Get.Hours216
		local Get240Hours = Get.Hours240
		local Get480Hours = Get.Hours480
		local Get1000Hours = Get.Hours1000
		local Get1500Hours = Get.Hours1500
		local Get2000Hours = Get.Hours2000
		local Get5000Hours = Get.Hours5000

		if Get1Hours == 1 then
			Get1Hours = "Completed"
		elseif Get1Hours == 2 then
			Get1Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline < 3600 then
				Get1Hours = timeConvert(GetTimeOnline)
			else
				Get1Hours = "Incomplete"
			end
		end
		if Get2Hours == 1 then
			Get2Hours = "Completed"
		elseif Get2Hours == 2 then
			Get2Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 3600 then
				Get2Hours = timeConvert(GetTimeOnline)
			else
				Get2Hours = "Incomplete"
			end
		end

		if Get4Hours == 1 then
			Get4Hours = "Completed"
		elseif Get4Hours == 2 then
			Get4Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 7200 then
				Get4Hours = timeConvert(GetTimeOnline)
			else
				Get4Hours = "Incomplete"
			end
		end

		if Get8Hours == 1 then
			Get8Hours = "Completed"
		elseif Get8Hours == 2 then
			Get8Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 14400 then
				Get8Hours = timeConvert(GetTimeOnline)
			else
				Get8Hours = "Incomplete"
			end
		end

		if Get12Hours == 1 then
			Get12Hours = "Completed"
		elseif Get12Hours == 2 then
			Get12Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 28800 then
				Get12Hours = timeConvert(GetTimeOnline)
			else
				Get12Hours = "Incomplete"
			end
		end


		if Get24Hours == 1 then
			Get24Hours = "Completed"
		elseif Get24Hours == 2 then
			Get24Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 43200 then
				Get24Hours = timeConvert(GetTimeOnline)
			else
				Get24Hours = "Incomplete"
			end
		end

		if Get48Hours == 1 then
			Get48Hours = "Completed"
		elseif Get48Hours == 2 then
			Get48Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 86400 then
				Get48Hours = timeConvert(GetTimeOnline)
			else
				Get48Hours = "Incomplete"
			end
		end

		if Get72Hours == 1 then
			Get72Hours = "Completed"
		elseif Get72Hours == 2 then
			Get72Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 172800 then
				Get72Hours = timeConvert(GetTimeOnline)
			else
				Get72Hours = "Incomplete"
			end
		end

		if Get96Hours == 1 then
			Get96Hours = "Completed"
		elseif Get96Hours == 2 then
			Get96Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 259200 then
				Get96Hours = timeConvert(GetTimeOnline)
			else
				Get96Hours = "Incomplete"
			end
		end

		if Get120Hours == 1 then
			Get120Hours = "Completed"
		elseif Get120Hours == 2 then
			Get120Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 345600 then
				Get120Hours = timeConvert(GetTimeOnline)
			else
				Get120Hours = "Incomplete"
			end
		end

		if Get144Hours == 1 then
			Get144Hours = "Completed"
		elseif Get144Hours == 2 then
			Get144Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 432000 then
				Get144Hours = timeConvert(GetTimeOnline)
			else
				Get144Hours = "Incomplete"
			end
		end

		if Get168Hours == 1 then
			Get168Hours = "Completed"
		elseif Get168Hours == 2 then
			Get168Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 518400 then
				Get168Hours = timeConvert(GetTimeOnline)
			else
				Get168Hours = "Incomplete"
			end
		end

		if Get192Hours == 1 then
			Get192Hours = "Completed"
		elseif Get192Hours == 2 then
			Get192Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 604800 then
				Get192Hours = timeConvert(GetTimeOnline)
			else
				Get192Hours = "Incomplete"
			end
		end

		if Get216Hours == 1 then
			Get216Hours = "Completed"
		elseif Get216Hours == 2 then
			Get216Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 691200 then
				Get216Hours = timeConvert(GetTimeOnline)
			else
				Get216Hours = "Incomplete"
			end
		end

		if Get240Hours == 1 then
			Get240Hours = "Completed"
		elseif Get240Hours == 2 then
			Get240Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 777600 then
				Get240Hours = timeConvert(GetTimeOnline)
			else
				Get240Hours = "Incomplete"
			end
		end

		if Get480Hours == 1 then
			Get480Hours = "Completed"
		elseif Get480Hours == 2 then
			Get480Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 864000 then
				Get480Hours = timeConvert(GetTimeOnline)
			else
				Get480Hours = "Incomplete"
			end
		end

		if Get1000Hours == 1 then
			Get1000Hours = "Completed"
		elseif Get1000Hours == 2 then
			Get1000Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 1728000 then
				Get1000Hours = timeConvert(GetTimeOnline)
			else
				Get1000Hours = "Incomplete"
			end
		end


		if Get1500Hours == 1 then
			Get1500Hours = "Completed"
		elseif Get1500Hours == 2 then
			Get1500Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 3600000 then
				Get1500Hours = timeConvert(GetTimeOnline)
			else
				Get1500Hours = "Incomplete"
			end
		end

		if Get2000Hours == 1 then
			Get2000Hours = "Completed"
		elseif Get2000Hours == 2 then
			Get2000Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 5400000 then
				Get2000Hours = timeConvert(GetTimeOnline)
			else
				Get2000Hours = "Incomplete"
			end
		end

		if Get5000Hours == 1 then
			Get5000Hours = "Completed"
		elseif Get5000Hours == 2 then
			Get5000Hours = "Claimed"
		else
			if GetTimeOnline > 0 and GetTimeOnline > 7200000 then
				Get5000Hours = timeConvert(GetTimeOnline)
			else
				Get5000Hours = "Incomplete"
			end
		end
		HelpInfo(role,0,"             Time Online Achievement_1 Hours Online      : "..Get1Hours.."_2 Hours Online      : "..Get2Hours.."_4 Hours Online      : "..Get4Hours.."_8 Hours Online      : "..Get8Hours.."_12 Hours Online     : "..Get12Hours.."_24 Hours Online     : "..Get24Hours.."_48 Hours Online     : "..Get48Hours.."_72 Hours Online     : "..Get72Hours.."_96 Hours Online     : "..Get96Hours.."_120 Hours Online    : "..Get120Hours.."_144 Hours Online    : "..Get144Hours.."_168 Hours Online    : "..Get168Hours.."_192 Hours Online    : "..Get192Hours.."_216 Hours Online    : "..Get216Hours.."_240 Hours Online    : "..Get240Hours.."_480 Hours Online    : "..Get480Hours.."_1000 Hours Online   : "..Get1000Hours.."_1500 Hours Online   : "..Get1500Hours.."_2000 Hours Online   : "..Get2000Hours.."_5000 Hours Online   : "..Get5000Hours.."_")	
	end
end

function ClaimTimeOnlineReward(role,time,reward)
	local ChaName	= GetChaDefaultName(role)
	local ChaID	= GetPlayerID(GetChaPlayer(role))
	if(file_exists(Achievement.TimeOnline..""..ChaID..".txt") == true) then
		local Get		= table.load(Achievement.TimeOnline..""..ChaID..".txt","r")
		local GetTimeOnline	= Get.TimeOnline
		local Get1Hours	= Get.Hours1
		local Get2Hours	= Get.Hours2
		local Get4Hours	= Get.Hours4
		local Get8Hours	= Get.Hours8
		local Get12Hours = Get.Hours12
		local Get24Hours = Get.Hours24
		local Get48Hours = Get.Hours48
		local Get72Hours = Get.Hours72
		local Get96Hours = Get.Hours96
		local Get120Hours = Get.Hours120
		local Get144Hours = Get.Hours144
		local Get168Hours = Get.Hours168
		local Get192Hours = Get.Hours192
		local Get216Hours = Get.Hours216
		local Get240Hours = Get.Hours240
		local Get480Hours = Get.Hours480
		local Get1000Hours = Get.Hours1000
		local Get1500Hours = Get.Hours1500
		local Get2000Hours = Get.Hours2000
		local Get5000Hours = Get.Hours5000

		if time == 3600 then
			if GetTimeOnline >= time and Get1Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = 2,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 7200 then
			if GetTimeOnline >= time and Get2Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = 2,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 14400 then
			if GetTimeOnline >= time and Get4Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = 2,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 28800 then
			if GetTimeOnline >= time and Get8Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = 2,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 43200 then
			if GetTimeOnline >= time and Get12Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = 2,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 86400 then
			if GetTimeOnline >= time and Get24Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = 2,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 172800 then
			if GetTimeOnline >= time and Get48Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = 2,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 259200 then
			if GetTimeOnline >= time and Get72Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = 2,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 345600 then
			if GetTimeOnline >= time and Get96Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = 2,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 432000 then
			if GetTimeOnline >= time and Get120Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = 2,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 518400 then
			if GetTimeOnline >= time and Get144Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = 2,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 604800 then
			if GetTimeOnline >= time and Get168Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = 2,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 691200 then
			if GetTimeOnline >= time and Get192Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = 2,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 777600 then
			if GetTimeOnline >= time and Get216Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = 2,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 864000 then
			if GetTimeOnline >= time and Get240Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = 2,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 1728000 then
			if GetTimeOnline >= time and Get480Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = 2,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 3600000 then
			if GetTimeOnline >= time and Get1000Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = 2,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 5400000 then
			if GetTimeOnline >= time and Get1500Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = 2,Hours2000 = Get2000Hours,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 7200000 then
			if GetTimeOnline >= time and Get2000Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = 2,Hours5000 = Get5000Hours},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end

		elseif time == 18000000 then
			if GetTimeOnline >= time and Get5000Hours == 1 then
				table.save({TimeOnline = GetTimeOnline,Hours1 = Get1Hours,Hours2 = Get2Hours,Hours4 = Get4Hours,Hours8 = Get8Hours,Hours12 = Get12Hours,Hours24 = Get24Hours,Hours48 = Get48Hours,Hours72 = Get72Hours,Hours96 = Get96Hours,Hours120 = Get120Hours,Hours144 = Get144Hours,Hours168 = Get168Hours,Hours192 = Get192Hours,Hours216 = Get216Hours,Hours240 = Get240Hours,Hours480 = Get480Hours,Hours1000 = Get1000Hours,Hours1500 = Get1500Hours,Hours2000 = Get2000Hours,Hours5000 = 2},Achievement.TimeOnline..""..ChaID..".txt","w")
				GiveItem(role,0,9808,reward,4)
			else
				HelpInfo(role,0,"Not enough points or you already claimed the reward.")
				return
			end
		else
			HelpInfo(role,0,"System error!")
			return
		end	
	else
		HelpInfo(role,0,"Sorry nothing to do here!")
		return
	end
end

function DisplayAchievementBossKills(role)
	HelpInfo(role,0,"Coming soon!")
end

function ClaimBossKillsReward(role,kill,reward)

end