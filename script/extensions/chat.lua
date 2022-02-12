function HandleChat(role, message)
	local ChaName	= GetChaDefaultName(TurnToCha(role))
	local ChaID	= GetCharID(TurnToCha(role))
	local NDate	= tonumber(os.date("%d"))
	local NMonth	= tonumber(os.date("%m"))
	local NYear	= tonumber(os.date("%Y"))
	local isMsg = 0
	-----------
	--AntiBot--
	-----------
	--local q,w = string.gsub(message,"","")
	--if w > 0 then
	--	if(file_exists(antiBot.store..(GetCharID(role))..".txt") ~= false) then
	--		local plyCaptcha = table.load(antiBot.store..(GetCharID(role))..".txt","r")
	--		if(q == plyCaptcha[1])then
	--			antiBot_confirm(role)
	--			SystemNotice(role,"Serial Key has been authorized")
	--			return 0
	--		else
	--			SystemNotice(role,"Incorrect Serial Key, try again..!")
	--			HelpInfo(role,0,"                Enter Serial Key_                     "..plyCaptcha[1])
	--			return 0
	--		end
	--	end
	--end

	----------------
	--Monster Info--
	----------------
	local e,r = string.gsub(message,"MobInfo ","")
	if r > 0 then
		onlynumeric = tonumber(e)
		if onlynumeric ~= nil and onlynumeric > 0 and onlynumeric < 1426 then
			local a,b,c,d,e,f,g,h,i,j = GetMonsterDrop(onlynumeric,1)
			local k,l,m,n,o,p,q,r,s,t = GetMonsterDrop(onlynumeric,2)
			local NAME,CHAID,LV,MXHP,MXSP,MINATK,MAXATK,RESIST,DEF,HIT,DOD,HPREC,SPREC,EXP = GetMonsterDB(onlynumeric)
			HelpInfo(role,0,"Monster Name        : "..NAME.."_HP/SP               : "..MXHP.."/"..MXSP.."_Min/Max Attack      : "..MINATK.."/"..MAXATK.."_Hit Rate/Dodge      : "..HIT.."/"..DOD.."_Defense/Resist      : "..DEF.."/"..RESIST.."_Item Drops:_"..GetItemName(a).." - "..math.floor(10000/k).."%_"..GetItemName(b).." - "..math.floor(10000/l).."%_"..GetItemName(c).." - "..math.floor(10000/m).."%_"..GetItemName(d).." - "..math.floor(10000/n).."%_"..GetItemName(e).." - "..math.floor(10000/o).."%_"..GetItemName(f).." - "..math.floor(10000/p).."%_"..GetItemName(g).." - "..math.floor(10000/q).."%_"..GetItemName(h).." - "..math.floor(10000/r).."%_"..GetItemName(i).." - "..math.floor(10000/s).."%_"..GetItemName(j).." - "..math.floor(10000/t).."%")
			return 0
		end
	end

	-------------
	--SafeConch--
	-------------
	local t,y = string.gsub(message,"SafeConch ","")
	if y > 0 then
		local Job = GetChaAttr(role,ATTR_JOB)
		if Job == 16 or Job == 18 then
			local statelv	= 1
			local statetime	= 3600
			local state_scr	= GetChaStateLv(role, STATE_SCR)
			if (t == "On") then
				if state_scr >= 1 then
					SystemNotice(role,"Warning: SafeConch activated!")
					return 0
				else
        				AddState(role, role, STATE_SCR, statelv , statetime )
					SystemNotice(role,"Warning: SafeConch activated!")
					return 0
				end
			elseif (t == "Off") then
				if state_scr >= 1 then
					RemoveState(role, STATE_SCR)
					SystemNotice(role,"Warning: SafeConch de-activated!")
					return 0
				else
					SystemNotice(role,"Warning: SafeConch de-activated!")
					return 0
				end
			end
		end
	end
	----------
	--AutoQA--
	----------
	local u,i = string.gsub(message,"","")
	if i > 0 then
		if(file_exists(AutoQA.Logs..""..ChaID..".txt") == true) then
			local getCorrect = table.load(AutoQA.Logs..""..ChaID..".txt","r")
			if(u == getCorrect[1]) then
				SystemNotice(role,"Correct")
				AutoQA_Confirm(role)
				local gRandom = math.random(1,2)
				if gRandom == 1 then
					Notice("Congratulation! "..ChaName.." just winning 1x Wicked Coin from Q and A Event.")
					GiveItem(role,0,9808,1,4)
				else
					Notice("Congratulation! "..ChaName.." just winning 1M Gold from Q and A Event.")
					GiveGold(role,1000000)
				end
				return 0
			else
				CloseTalk(role,role)
				os.remove(AutoQA.Logs..""..ChaID..".txt")
				SystemNotice(role,"Incorrect!")
				AutoQA_Confirm(role)
				return 0
			end
		end
	end
	------------------------
	--Reputation Exchanger--
	------------------------
	local o,p = string.gsub(message,"Exchange ","")
	if p > 0 then
		onlynumeric = tonumber(o)
		if onlynumeric ~= nil and onlynumeric > 0 and onlynumeric < 100000000 then
			local Fame		= GetChaAttr(role, ATTR_FAME)
			local FameRed 		= onlynumeric
			local FameMinLimit	= 0
			if Fame < FameRed then
				SystemNotice(role,"Please put a correct number.")
				return 0
			else
				GiveGold(role,math.floor(FameRed*35))
				GiveReputation(role,-FameRed)
				SystemNotice(role,"Exchanging process "..FameRed.." Reputation to "..math.floor(FameRed*35).."G has been granted.")
				return 0
			end
		end
	end

	----------
	--No Exp--
	----------
	local a,s = string.gsub(message,"Exp ","")
	if s > 0 then
		local statelv		= 1 
		local statetime		= -1
		local state_noexp	= GetChaStateLv(role, STATE_NOEXP)
		if (a == "Off") then
			if state_noexp >= 1 then
				BickerNotice(role,"Warning: Exp turned off. no longer receives any experience!")
				return 0
			else
        			AddState(role, role, STATE_NOEXP, statelv , statetime )
				BickerNotice(role,"Warning: Exp turned off. no longer receives any experience!")
				return 0
			end
		elseif (a == "On") then
			if state_noexp >= 1 then
				RemoveState(role, STATE_NOEXP)
				BickerNotice(role,"Warning: Exp turned on!")
				return 0
			else
				BickerNotice(role,"Warning: Exp turned on!")
				return 0
			end
		end
	end

	--------------
	--Clean Junk--
	--------------
	local d,f = string.gsub(message,"","")
	if f > 0 then
		if d == "Clean Junk" then
			local k ={}
			for i = 0,47 do
				k[i] = GetItemID(GetChaItem(role, 2, i))
				if GetItemName(k[i]) == "READ ME" then
					local Amount = CheckBagItem(role,k[i])
					DelBagItem (role , k[i], Amount)
					SystemNotice(role,"Inventory cleaned!")
					return 0
				end
			end
		end
	end

	-----------
	--Command--
	-----------
	if (message == "Bank") then
        	OpenBank( role, role )

	elseif (message == "Plier") then
        	OpenGetStone( role, role )

	elseif (message == "Forge") then
        	OpenForge( role, role )

	elseif (message == "Socket") then
        	OpenMilling( role, role )

	elseif (message == "Repair") then
        	OpenRepair( role, role )

	elseif (message == "Combine") then
        	OpenUnite( role, role )

	elseif (message == "Apparel") then
        	OpenFusion( role, role )

	elseif (message == "Apparel Up") then
        	OpenUpgrade( role, role )

	elseif (message == "Equipment Up") then
        	OpenItemTiChun( role, role )

	elseif (message == "DIR") then
		HelpInfo(role,0,"            User Command Directory_MobInfo ID    : Show monster details_Exchange Num  : Exchange Reputation - Gold_Exp Off       : Turn Off Exp gained_Exp On        : Turn On Exp gained_SafeConch On  : Safe conch enable_SafeConch Off : Safe conch disable_Clean Junk    : Clean up READ ME items_DIR         : Command Directory_Bank        : Open bank page_Plier       : Open plier page_Forge       : Open forging page_Socket      : Open socket page_Repair      : Open repair page_Combine     : Open combining page_Apparel     : Open apparel fusion page_Apparel Up  : Open apparel upgrade page_Equipment Up: Open equipment upgrade page")
    	else
        	isMsg = 1
    	end
    	return isMsg
end