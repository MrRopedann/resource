print("* Loading <VipSystem> init.lua" )

---------------------------------------------
-- FEE		= Portal Cost              --
-- MDR		= Monster Drop Rate        --
-- RDR		= Resources Drop Rate      --
-- PEXP		= Player Exp               --
-- PETEXP	= Pet Exp                  --
-- SPREC	= SP Recovery Speed        --
-- HPREC	= HP Recovery Speed        --
-- CSR		= Combining Success Rate   --
---------------------------------------------
VIPSYS = {}
VIPSYS[1] = {FEE = 0.1,		MDR = 0.05,	RDR = 0.05,	PEXP = 0.1,	PETEXP = 2,	SPREC = nil,	HPREC = nil,	CSR = nil}
VIPSYS[2] = {FEE = 0.3,		MDR = 0.10,	RDR = 0.10,	PEXP = 0.3,	PETEXP = 3,	SPREC = 200,	HPREC = 200,	CSR = nil}
VIPSYS[3] = {FEE = 0.5,		MDR = 0.20,	RDR = 0.20,	PEXP = 0.5,	PETEXP = 4,	SPREC = 400,	HPREC = 400,	CSR = 0.10}
VIPSYS[4] = {FEE = 0.7,		MDR = 0.30,	RDR = 0.30,	PEXP = 0.7,	PETEXP = 5,	SPREC = 800,	HPREC = 800,	CSR = 0.20}
VIPSYS[5] = {FEE = 0.8,		MDR = 0.40,	RDR = 0.40,	PEXP = 0.9,	PETEXP = 6,	SPREC = 1600,	HPREC = 1600,	CSR = 0.30}
VIPSYS[6] = {FEE = 0.9,		MDR = 0.50,	RDR = 0.50,	PEXP = 1.1,	PETEXP = 7,	SPREC = 3200,	HPREC = 3200,	CSR = 0.40}
VIPSYS[7] = {FEE = 1.0,		MDR = 0.60,	RDR = 0.60,	PEXP = 1.3,	PETEXP = 8,	SPREC = 6400,	HPREC = 6400,	CSR = 0.50}
VIPSYS.DATA = GetResPath("script/addon/VipSystem/Database/")

function RegVIP(role,Lv,ItemID,Amount)
	local ItemName		= GetItemName(ItemID)
	local ItemCheck		= CheckBagItem(role,ItemID)
	local StartTime		= os.time()
	local ExpiredTime	= StartTime + 2592000
	local VIPLevel		= Lv
	local NDate		= tonumber(os.date("%d"))
	local NMonth		= tonumber(os.date("%m"))
	local NYear		= tonumber(os.date("%Y"))
	local ChaID		= GetCharID(role)
	local ItemCheck		= CheckBagItem(role,ItemID)

	if ItemCheck < Amount then
		HelpInfo(role,0,"Hello yes as it says, required "..Amount.." "..ItemName.."")
		return
	end

	if(file_exists(VIPSYS.DATA..""..ChaID..".txt") == true) then
		local Get		= table.load(VIPSYS.DATA..""..ChaID..".txt","r")
		local GetVIPLV		= Get.VIPLV
		local GetStart		= Get.Start
		local GetExpired	= Get.Expired
		local GetDate		= Get.Date
		local GetMonth		= Get.Month
		local GetYear		= Get.Year
		local WMonth		= ConvertMonthToWord[GetMonth]

		if VIPLevel <= GetVIPLV then
			HelpInfo(role,0,"You're already VIP "..GetVIPLV.." since "..GetDate.." "..WMonth.." "..GetYear.."_")
			return
		elseif VIPLevel > GetVIPLV then
			if (GetVIPLV + 1) == VIPLevel then
				table.save({VIPLV = VIPLevel, Start = StartTime, Expired = ExpiredTime, Date = NDate, Month = NMonth, Year = NYear},VIPSYS.DATA..""..ChaID..".txt","w")
				TakeItem(role,0,ItemID, Amount)
				HelpInfo(role,0,"Congratulations you're now VIP "..VIPLevel.."")
				------------------------------------
				--Added Unlocking Bonus 16/01/2016--
				------------------------------------
				if VIPLevel == 2 then
					GiveGold(role,100000000)
				elseif VIPLevel == 3 then
					GiveGold(role,200000000)
				elseif VIPLevel == 4 then
					GiveGold(role,200000000)
					GiveItem(role, 0, 9847, 2, 4)
				elseif VIPLevel == 5 then
					GiveGold(role,300000000)
					GiveItem(role, 0, 9848, 2, 4)
					GiveItem(role, 0, 9844, 1, 4)
				elseif VIPLevel == 6 then
					GiveGold(role,500000000)
					GiveItem(role, 0, 9849, 2, 4)
					GiveItem(role, 0, 9845, 1, 4)
					GiveItem(role, 0, 9900, 100, 4)
					GiveItem(role, 0, 9901, 1, 4)
				elseif VIPLevel == 7 then
					GiveGold(role,700000000)
					GiveItem(role, 0, 9850, 2, 4)
					GiveItem(role, 0, 9846, 1, 4)
					GiveItem(role, 0, 9900, 300, 4)
					GiveItem(role, 0, 9902, 1, 4)
				end
				------------------------------------
			else
				local VIPFirst = GetVIPLV + 1
				HelpInfo(role,0,"You suppose reach VIP "..VIPFirst.." first before doing this.")
				return
			end
		end
	else
		if VIPLevel == 1 then
			table.save({VIPLV = 1, Start = StartTime, Expired = ExpiredTime, Date = NDate, Month = NMonth, Year = NYear},VIPSYS.DATA..""..ChaID..".txt","w")
			TakeItem(role,0,ItemID, Amount)
			HelpInfo(role,0,"Congratulations you're now VIP 1")
			GiveGold(role,50000000)
		else
			HelpInfo(role,0,"Sorry..but you should get VIP 1 at first.")
			return
		end
	end
end

function VipSystemEff(ignore,role)
	local ChaID = GetCharID(role)
	if(file_exists(VIPSYS.DATA..""..ChaID..".txt") == true) then
		local Get = table.load(VIPSYS.DATA..""..ChaID..".txt","r")
		local GetVIPLV = Get.VIPLV
		if GetVIPLV == 1 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK1 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK1)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK1)
			end
		end
		if GetVIPLV == 2 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK2 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK2)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK2)
			end
		end
		if GetVIPLV == 3 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK3 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK3)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK3)
			end
		end
		if GetVIPLV == 4 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK4 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK4)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK4)
			end
		end
		if GetVIPLV == 5 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK5 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK5)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK5)
			end
		end
		if GetVIPLV == 6 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK6 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK6)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK6)
			end
		end
		if GetVIPLV == 7 then
			local statelv = 1
			local statetime = 3600
			AddState( role , role , STATE_VIPNECK7 , statelv , statetime )
		else
			local state1 = GetChaStateLv(role, STATE_VIPNECK7)
			if state1 ~= 0 then
				RemoveState(role, STATE_VIPNECK7)
			end
		end
	end
end
Hook:AddPostHook("custom_cha_timer",VipSystemEff)