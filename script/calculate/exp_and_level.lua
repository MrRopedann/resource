--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading Exp_And_Level.lua" )

InTeamGetExp_RAID = 1

function AskGuildItem(role,Guild_type)
	local gold = GetChaAttr(role,ATTR_GD)
	local fame = GetChaAttr(role,ATTR_FAME) 
	local attr_guild = HasGuild ( role ) 
	if attr_guild ~= 0 then 
		HelpInfo(role,0,"You are already in a guild")
		--SystemNotice(role,0,"You are already in a guild")
		return 0 
	end 
	local Lv = Lv ( role )
	if Lv < 40 then
		SystemNotice ( role , "Have not reached Lv 40. Unable to create" )
		return 0
	end

	if Guild_type == 1 then						--ÅÐ¶¨º£µÁ¹¤»á
		if Guild2_ItemMax > 0 then
			for i = 1 , Guild2_ItemMax , 1 do
				local K = Check_BagItem(role,Guild2_item[i],Guild2_count[i])
				if K == 0 then
					HelpInfo(role,0,"Items insufficient. Unable to create")
					--SystemNotice(role,0,"Items insufficient. Unable to create")
					return 0
				end
			end
		end

		if gold < Guild2_Gold then
			HelpInfo(role,0,"Insufficient gold. Unable to create")
			--SystemNotice(role,0,"Insufficient gold. Unable to create")
			return 0
		end
		if fame < Guild2_fame then
			HelpInfo(role,0,"Insufficient reputation to create")
			--SystemNotice(role,0,"Insufficient reputation to create")
			return 0
		end
	elseif Guild_type == 0 then					--ÅÐ¶¨º£¾ü¹¤»á
		if Guild1_ItemMax > 0 then
			for i = 1 , Guild1_ItemMax , 1 do
				local K = Check_BagItem(role,Guild1_item[i],Guild1_count[i])
				if K == 0 then
					HelpInfo(role,0,"Items insufficient. Unable to create")
					--SystemNotice(role,0,"Items insufficient. Unable to create")
					return 0
				end
			end
		end
		if gold < Guild1_Gold then
			HelpInfo(role,0,"Insufficient gold. Unable to create")
			--SystemNotice(role,0,"Insufficient gold. Unable to create")
			return 0
		end
		if fame < Guild1_fame then
			HelpInfo(role,0,"Insufficient reputation to create")
			--SystemNotice(role,0,"Insufficient reputation to create")
			return 0
		end
	else
		--LG("checkguild","guide type error  Guild_type = ",Guild_type)
	end
	return 1
end 

function Check_BagItem(role,a,b)		--¼ì²é±³°üÊýÁ¿ÊÇ·ñ×ã¹»
	local a = CheckBagItem ( role , a ) 
	if a>= b then 
		return 1 
	else 
		return 0 
	end 
end 
		


--É¾³ý´´½¨¹¤»áËùÐèÎïÆ·
function DeductGuildItem(role,Guild_type)
	local gold = GetChaAttr(role,ATTR_GD)
	local fame = GetChaAttr(role,ATTR_FAME) 
	local attr_guild = HasGuild ( role )  
--	if attr_guild ~= 0 then 
--		HelpInfo(role,0,"You are already in a guild") 
		--SystemNotice(role,0,"You are already in a guild") 
--		return 0 
--	end 

	if Guild_type == 1 then						--ÅÐ¶¨º£µÁ¹¤»á
--		if Guild2_ItemMax > 0 then
--			for i = 1 ,Guild2_ItemMax,1 do
--				local K = DelBagItem(role,Guild2_item[i],Guild2_count[i])
--			end
--		end
		DelBagItem(role,1780,1)	
		gold = gold - Guild2_Gold
		fame = fame - Guild2_fame
		SetAttrChangeFlag ( role )

		SetChaAttr(role,ATTR_GD,gold)
		SetChaAttr(role,ATTR_FAME,fame)

		SyncChar( role, 4 )
	
	elseif Guild_type == 0	then					--ÅÐ¶¨º£¾ü¹¤»á
--		if Guild1_ItemMax > 0 then
--			for i = 1 ,Guild1_ItemMax,1 do
--				local K = DelBagItem(role,Guild1_item[i],Guild1_count[i])
--			end
--		end
		DelBagItem(role,1780,1)	
		gold = gold - Guild1_Gold
		fame = fame - Guild1_fame
		SetAttrChangeFlag ( role )

		SetChaAttr(role,ATTR_GD,gold)
		SetChaAttr(role,ATTR_FAME,fame)

		SyncChar( role, 4 )
	else
		--LG("checkguild","guide type error Guild_type = ",Guild_type)
	end

end
	

function AskJoinGuild ( role , guild_type ) 					
	local attr_guild = HasGuild ( role )  
	if attr_guild ~= 0 then 
		HelpInfo(role,0,"Âû óæå ñîñòîèòå â ãèëüäèè ") 
		return 0 
	end 
	return 1 
end 

function GetExp_New(dead , atk  ) 
	if ValidCha(atk) == 0  then 
		LG ( "exp_atker=NIL" , "function GetExp_New : atker = nil " ) 
		return 
	end 
	local a = Check_Combat_Mod(dead , atk ) 
	if a==1 then 
	-- Èãðîê óáèâàåò ìîíñòðîâ
	GetExp_PKM( dead , atk )
	elseif a==2 then 
	-- Ìîíñòð óáèâàåò èãðîêà
	GetExp_MKP(dead , atk) 
	elseif a==3 then 
	-- Èãðîê óáèâàåò èãðîêà
	GetExp_PKP(dead , atk)
	elseif a==4 then 
	-- Ìîíñòð óáèâàåò ìîíñòðà
	GetExp_Noexp(dead , atk)
	else 
		
	end 
end 


function Check_Combat_Mod(dead , atk) 
	local rolemod_atker = IsPlayer(atk) 
	local rolemod_defer = IsPlayer(dead)  
	if (rolemod_atker==0) and (rolemod_defer==0) then 
		return 4 
	elseif rolemod_atker==0 and rolemod_defer==1 then 
		return 2 
	elseif rolemod_atker==1 and rolemod_defer==0 then 
		return 1 
	elseif rolemod_atker==1 and rolemod_defer==1 then 
		return 3 
	else 
		return 
	end 
end 


function GetExp_PKM( dead , atk  )
	--------------------------
	-- Ðàáîòà ñ êîíòðàêòàìè --
	--------------------------
	-- Ïîëó÷àåøü ðàçìåð ðàíöà
	local kbsize = GetKbCap(atk) - 1
	
	-- Ïðîáåãàåøüñÿ ïî ÿ÷åéêàì
	for i = 0, kbsize, 1 do
		-- Ïîëó÷àåì ïðåäìåò
		local item = GetChaItem( atk , 2 , i )
		-- Ïîëó÷àåì ID ïðåäìåòà
		local itemID = GetItemID(item)
		-- Óáåäèìñÿ, ÷òî ýòî êîíòðàêò
		if (itemID == 5803) then
			-- Ñ÷èòûâàåì çàïèñàííûé ID ìîíñòðà
			local kontMobID = GetItemAttr ( item , ITEMATTR_VAL_STR)
			-- Ñ÷èòûâàåì çàïèñàííîå êîë-âî ìîíñòðîâ
			local kontKillCount = GetItemAttr ( item , ITEMATTR_VAL_AGI)
			-- Ïîëó÷àåì ID óáèòîãî ìîíñòðà
			local MobID = GetChaID(dead)
			--Åñëè íàïèñàí âûäóìàííûé ID, ðàâíî 2000, òî..
			if (kontMobID == 3000) then
				-- Óáåäèìñÿ, ÷òî íóæíî óáèòü áîëüøå 0 ìîíñòðîâ
				if (kontKillCount > 0) then
					-- Óìåíüøàåì çàïèñàííîå â ïðåäìåò êîë-âî
					SetItemAttr(item, ITEMATTR_VAL_AGI , kontKillCount - 1)
					--Âèçóàëüíîå îáíîâëåíèå ñòàòîâ ïðåäìåòà
					SynChaKitbag(atk, 13)
					-- À âîò òîò ñàìûé ìîìåíò
					break
				end
			end
			-- Óáåäèìñÿ, ÷òî ýòî êîíòðàêò íà óáèòîãî ìîíñòðà
			if (kontMobID == MobID) then
				-- Óáåäèìñÿ, ÷òî íóæíî óáèòü áîëüøå 0 ìîíñòðîâ
				if (kontKillCount > 0) then
					-- Óìåíüøàåì çàïèñàííîå â ïðåäìåò êîë-âî
					SetItemAttr(item, ITEMATTR_VAL_AGI , kontKillCount - 1)
					--Âèçóàëüíîå îáíîâëåíèå ñòàòîâ ïðåäìåòà
					SynChaKitbag(atk, 13)
					-- À âîò òîò ñàìûé ìîìåíò
					break
				end
			end
		end
	end
	----------------------
	-- Êîíåö êîíòðàêòîâ --
	----------------------
	Beach.PlayerKilledMonster(dead, atk)
	local dead_lv = GetChaAttrI( dead , ATTR_LV ) 
	local dead_exp = GetChaAttrI( dead , ATTR_CEXP ) * EXP_RAID
	LG("exp" , "deadlv = " , dead_lv ) 
	LG("exp" , "dead_exp = " , dead_exp ) 
	local k = {} 
	local kdmg = {} 
	local k_exp = {} 

	k[0] , kdmg[0] = GetChaHarmByNo ( dead , 0 ) 
	k[1] , kdmg[1] = GetChaHarmByNo ( dead , 1 ) 
	k[2] , kdmg[2] = GetChaHarmByNo ( dead , 2 ) 
	k[3] , kdmg[3] = GetChaHarmByNo ( dead , 3 ) 
	k[4] , kdmg[4] = GetChaHarmByNo ( dead , 4 ) 
	local first_atker = GetFirstAtker ( dead ) 
	
	local Gen_dmg = 0 

	for i = 0 , 4 , 1 do 
		if k[i] ~= 0 then 
			Gen_dmg = Gen_dmg + kdmg[i] 
		end 
	end 
	for i = 0 , 4 , 1 do 
		k_exp[i] = 0 

		if ValidCha( k[i] )== 1 then 
			if kdmg[i] > 0 then 
				if k[i] == first_atker then 
					k_exp[i] = dead_exp * ( 0.7 * kdmg[i] / Gen_dmg + 0.3 )		
				else
					k_exp[i] =  dead_exp * 0.7 * kdmg[i] / Gen_dmg 
				end 
				ShareTeamExp ( dead , k[i] , k_exp[i] ,atk ) 
			end 
		end 
	end 
	local item_host = 0 
	local exp_max = k_exp[0] 
	for i = 1 , 4 , 1 do 
		if k_exp [i] > exp_max  then 
			exp_max = k_exp[i] 
			item_host = i 
		end 
	end 		
		
	if ChaIsBoat (k[item_host] ) == 1 then 

		local ship_lv = GetChaAttr ( k[item_host] , ATTR_LV ) 
		local shipowner_lv  = GetChaAttr ( TurnToCha ( k[item_host] ) , ATTR_LV )  
		local ship_exp = GetChaAttr ( k[item_host] , ATTR_CEXP ) 
		local ship_expadd = math.floor ( math.min ( 7 , ( dead_lv / 10 + 2 ) ) ) 
		local lv_limit = math.min ( ship_lv , shipowner_lv ) - 10 
		if dead_lv >= lv_limit then 
			ship_exp = ship_exp + ship_expadd 
			SetCharaAttr (  ship_exp , k[item_host] ,ATTR_CEXP ) 
		end 
	end 
	SetItemHost ( dead , k[item_host] ) 
	--- Âûäà÷à ðåïóòàöèè çà ìîíñòðîâ ---
	local normal_monster = GetChaID( dead )
	local data
	
	for data in BossRepList do
		if normal_monster == BossRepList[data][2] then
			local r = BossRepList[data][3] * REP_RATE
			SystemNotice( atk, "\199\224 \239\238\225\229\228\243 \237\224\228 " ..BossRepList[data][1].. " \239\238\235\243\247\229\237\238 "..r.." \240\229\239\243\242\224\246\232\232" )
			AddCreditX( atk, r )
		end
	end

end


function ValidCha(ter)
  if ter==nil or ter==0 then 
	return 0 
  end
  return 1
end

function ShareTeamExp ( dead , team_atker , dead_exp , The_Killer) 
	local cha_name1100 = GetChaDefaultName (team_atker )	
	local star111=GetChaAttr (  team_atker , ATTR_CEXP )
	local atker_role = ChaIsBoat ( team_atker ) 
	local monster_location = IsChaInLand ( dead ) 
	if atker_role == 1 and monster_location == 1 then 
		dead_exp = math.floor ( dead_exp / 5 + 1 ) 
	end 


	local dead_lv = GetChaAttrI( dead , ATTR_LV )			 
	local t = {} 
	t[0] = team_atker  
	if ValidCha (team_atker) == 0 then 
		return 
	end 
	t[1] = GetTeamCha(team_atker, 0 )  
	t[2] = GetTeamCha(team_atker, 1 )   
	t[3] = GetTeamCha(team_atker, 2 )    
	t[4] = GetTeamCha(team_atker, 3 )
    
	local count = 0 
	local NewPlayer_CanGet = 0
	local NewPlayer_Lv = 0
	local NewPlayer_Lv_dif = -100
	local Check_Killer = 0
	if t[0] == The_Killer then
		Check_Killer = 1
	end
	for i = 0 , 4 , 1 do	
		if ValidCha( t[i] )== 1  then					
			a = CheckExpShare ( t[i] , team_atker ) 
			if a == 1 then 
				count = count + 1 
				NewPlayer_Lv = Lv( TurnToCha(t[i]) )
				NewPlayer_Lv_dif = dead_lv - NewPlayer_Lv
				if NewPlayer_Lv <=30 and NewPlayer_Lv >= 10 and NewPlayer_Lv_dif >= -5 then
					NewPlayer_CanGet = NewPlayer_CanGet + 1
				end
			end 
		end 
        end 
	if count == 0 then 
		return 
	end 
	local TeamExp_Increas = 0.25 * TeamExp_RAID

	local exp_add = math.floor( dead_exp * ( 1 + (count -1 )* TeamExp_Increas ) ) 
	local exp_increase = math.floor ( dead_exp * (count -1 )* TeamExp_Increas )

	if count >=2 then
		exp_add = exp_add * InTeamGetExp_RAID
	end

	local exp_up

	for i = 0 , 4 , 1 do	
		if ValidCha(t[i])==1 then			
			local a = 1							
			local b = 1							

			if i >= 1 then 
				a = CheckExpShare ( t[i] , team_atker ) 		
				exp_up = math.max (1,  math.floor ( exp_add/count ) )  * a 
			else 
				exp_up = math.max ( 1, math.floor ( exp_add/count ) )  
			end 

			t_lv = GetChaAttrI ( TurnToCha(t[i]) , ATTR_LV ) 

			lv_dis =  t_lv - dead_lv 	
			if lv_dis >= 4 then 
				b = math.min ( 10 , 1 + ( math.abs ( lv_dis - 4 ) * 0.4 ) ) 
			elseif lv_dis <= -1 * 10 then 
				b = math.min ( 4 , 1 + math.abs ( lv_dis - 10)  * 0.1 )    
			end 
			
			exp_up = math.floor ( math.max ( 1 , exp_up / b ) ) * a 
			
			if count >=3 and NewPlayer_CanGet <= 0 and Check_Killer == 1 then				
				if lv_dis <=3 then
					Add_RYZ_TeamPoint ( TurnToCha(t[i]) , count , 1)
				end
			end
			if t_lv >= 50 and NewPlayer_CanGet > 0 and Check_Killer == 1 then
				Add_RYZ_TeamPoint ( TurnToCha(t[i]) , 6 , NewPlayer_CanGet)
			end

			exp = GetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP ) 
			local EXP_RAID_STATE = 1
			local StateLv = GetChaStateLv ( t[i] , STATE_SBJYGZ )
			
			
			if StateLv > 0 and StateLv <= 10 then
				if StateLv == 1 then
					EXP_RAID_STATE = StateLv + 1
				end
				if StateLv == 2 then
					EXP_RAID_STATE = 2
				end
				if StateLv == 3	then
					EXP_RAID_STATE = 2.5
				end
				if StateLv == 4	then
					EXP_RAID_STATE = 3
				end
				if StateLv == 5	then
					EXP_RAID_STATE = 3.5
				end
				if StateLv == 6	then
					EXP_RAID_STATE = 4
				end
				if StateLv == 7	then
					EXP_RAID_STATE = 5
				end
				if StateLv == 8	then
					EXP_RAID_STATE = 6
				end
				if StateLv == 9	then
					EXP_RAID_STATE = 7
				end
				if StateLv == 10	then
					EXP_RAID_STATE = 8
				end
				if StateLv == 1 then
					MF_RAID_STATE = StateLv + 1
				end
				if StateLv == 2 then
					MF_RAID_STATE = 2
				end
				if StateLv == 3	then
					MF_RAID_STATE = 2.5
				end
				if StateLv == 4	then
					MF_RAID_STATE = 3
				end
				if StateLv == 5	then
					MF_RAID_STATE = 3.5
				end
				if StateLv == 6	then
					MF_RAID_STATE = 4
				end
			end
			
			if StateLv > 1 then
				local CheckLucky = 0
				CheckLucky = CheckLuckyFinish ( StateLv )
				if CheckLucky == 1 then
					EXP_RAID_STATE = EXP_RAID_STATE * 2
					SystemNotice ( TurnToCha(t[i]) , "\209\247\224\241\242\235\232\226\251\233 \243\228\224\240! \206\239\251\242 \243\226\229\235\232\247\232\226\224\229\242\241\255 \226 2 \240\224\231\224 " )
				end
				if CheckLucky == 2 then
					EXP_RAID_STATE = 10
					SystemNotice ( TurnToCha(t[i]) , "\209\243\239\229\240 \209\247\224\241\242\235\232\226\251\233 \243\228\224\240! \206\239\251\242 \243\226\229\235\232\247\232\226\224\229\242\241\255 \226 10 \240\224\231 " )
				end
			end

			if exp_up == 0 then 
				LG ( "exp" , "No experience growth" ) 
				return 
			end
			local Weekend_exp = 1
			if Now_Week == 6 or Now_Week == 7 then -- §á§â§à§Ó§Ö§â§Ü§Ñ §ß§Ñ §å§ã§Ý§à§Ó§Ú§Ö §Õ§Ö§ß§î §ß§Ö§Õ§Ö§Ý§Ú = §ã§å§Ò§Ò§à§ä§Ñ §Ú§Ý§Ú §Ó§à§ã§Ü§â§Ö§ã§Ö§ß§î§Ö, §Ö§ã§Ý§Ú §à§ß§à §Ó§Ö§â§ß§à: §â§Ö§Û§ä§í §ç2
				Weekend_exp = 2
			end
			exp_up = exp_up * EXP_RAID_STATE * Weekend_exp
			if Lv ( TurnToCha(t[i]) ) >= 80 then 
				exp_up = math.floor ( exp_up / 5 ) 
			end 
					local Item_bg = GetChaItem ( t[i] , 2 , 1  )
					local Get_Item_Type = GetItemType ( Item_bg ) 
					if Get_Item_Type==59 then 
						local  Item_ID = GetItemID ( Item_bg )	
						local str = GetItemAttr( Item_bg ,ITEMATTR_VAL_STR )		
						local con = GetItemAttr( Item_bg ,ITEMATTR_VAL_CON )		
						local agi = GetItemAttr( Item_bg ,ITEMATTR_VAL_AGI )		
						local dex = GetItemAttr( Item_bg ,ITEMATTR_VAL_DEX )		
						local sta = GetItemAttr( Item_bg ,ITEMATTR_VAL_STA )		
						local URE = GetItemAttr( Item_bg ,ITEMATTR_URE )			
						local MAXURE = GetItemAttr( Item_bg ,ITEMATTR_MAXURE )		
						local lv_JL = str + con + agi + dex + sta
						local Num_JL = GetItemForgeParam ( Item_bg , 1 )
						local Part1 = GetNum_Part1 ( Num_JL )	
						local Part2 = GetNum_Part2 ( Num_JL )	
						local Part3 = GetNum_Part3 ( Num_JL )
						local StateLv1 = GetChaStateLv( t[i], STATE_JLFT7 )
						local StateLv2 = GetChaStateLv( t[i], STATE_JLFT3 )
						local StateLv3 = GetChaStateLv( t[i], STATE_JLFT2 )
						local StateLv4 = GetChaStateLv( t[i], STATE_JLFT5 )
						local StateLv5 = GetChaStateLv( t[i], STATE_JLFT6 )
						local flag=0
					    if Item_ID==681 and StateLv1~=0 then
							flag=1
						end
						if Item_ID==450 and StateLv2~=0 then
							flag=1
						end
						if Item_ID==451 and StateLv3~=0 then
							flag=1
						end
						if Item_ID==235	and StateLv4~=0 then
							flag=1
						end
						if Item_ID==459 and StateLv5~=0 then
							flag=1
						end
						if Item_ID==452 and StateLv5~=0 then
							flag=1
						end
						if Item_ID==234 and StateLv5~=0 then
							flag=1
						end
						if flag==1 then
							if StateLv1 ~= 0 then
								exp_up = exp_up*(lv_JL*0.002+1)
							end
							if StateLv2 ~= 0 then 
								exp_up = exp_up*(lv_JL*0.004+1)
							end
							if StateLv3 ~= 0 then 
								exp_up = exp_up*(lv_JL*0.006+1)
							end
							if StateLv4 ~= 0 then 
								exp_up = exp_up*(lv_JL*0.008+1)
							end
							if StateLv5 ~= 0 then 
								exp_up = exp_up*(lv_JL*0.010+1)
							end
						end
						SetItemAttr ( Item_bg , ITEMATTR_URE , URE )
					end
			local Check = {}
				Check[0] = t[i]  
				Check[1] = GetTeamCha( t[i] , 0 )  
				Check[2] = GetTeamCha( t[i] , 1 )   
				Check[3] = GetTeamCha( t[i] , 2 )    
				Check[4] = GetTeamCha( t[i] , 3 )
	
			for j = 0 , 4 , 1 do	
				if ValidCha( Check[j] )== 1  then
					local star = IsTeamLeader( Check[j] )
					if	star==1 then 			
						local StateLv = GetChaStateLv ( Check[j] , STATE_ZDSBJYGZ )
						local	Isshare = CheckExpShare ( t[i] , Check[j])
						if StateLv == 1 and Isshare == 1 then
							exp_up = 1.5*exp_up
						end
					end
				end
			end

		local expGetNow = exp_up		
		local expCanGive = 0
		t[i] = TurnToCha ( t[i]  )
		local ptnItem = GetEquipItemP( t[i] , 8)	
		local IdItem = GetItemID ( ptnItem )	
		local lvPerson = GetChaAttr(t[i] , ATTR_LV)
		if IdItem==1034 and lvPerson < 3001 then
			local expItemNow = GetItemAttr( ptnItem , ITEMATTR_URE)*10  
			local expItemMax = GetItemAttr ( ptnItem , ITEMATTR_MAXURE)*10
			local retIsInTeam = IsInTeam(t[i] )
			if retIsInTeam ~= LUA_TRUE then			
				expItemNow = expItemNow + expGetNow
				if expItemNow >= expItemMax then
					expItemNow = expItemMax
				end
			else						
				if HasTeammate(t[i] ,0, 5) == LUA_TRUE then
					local ptnLowLvPlayer = returnLowLVPlayer( t[i], t[0], t[1], t[2], t[3], t[4]) 
					if ValidCha(ptnLowLvPlayer) == 1 then     
					
						local expCanUse = expItemNow - 1				
							if expGetNow * 1>= expCanUse then
								expCanGive = expCanUse
								expItemNow = 1
							else
								expItemNow = expItemNow - expGetNow*1
								expCanGive = expGetNow * 1
							end
							if expItemNow <= 1 then
								expItemNow = 1
							end
						exp_up = exp_up + expCanGive
					else																				
						expCanGive = 0
						exp_up = exp_up + expCanGive
					end
					
					local expCanUse = expItemNow - 1

			
				end
			end
			expItemNow= math.floor(expItemNow/10.02)
			SetItemAttr ( ptnItem ,ITEMATTR_URE , expItemNow )
		end			
			if exp_up > 20000 then
				local cha_name = GetChaDefaultName ( TurnToCha(t[i]) )
				local Monster_name = GetChaDefaultName ( dead )
			end
			if exp_up == 0 then 
				SystemNotice ( TurnToCha(t[i]) , "\206\239\251\242\224 \239\238\235\243\247\229\237\238. " )
			end
			exp = exp + exp_up 
			--§£§í§Õ§Ñ§é§Ñ §Ù§à§Ý§à§ä§Ñ §Ù§Ñ §å§Ò§Ú§Û§ã§ä§Ó§à §Þ§à§ß§ã§ä§â§à§Ó
			AddMoney ( TurnToCha(t[i]), 0 , math.random(100,5000))
			--§°§ã§ä§Ñ§ß§à§Ó§Ü§Ñ §à§á§í§ä§Ñ, §Ö§ã§Ý§Ú §Ó §Ú§ß§Ó§Ö§ß§ä§Ñ§â§Ö §Ö§ã§ä§î §á§â§Ö§Õ§Þ§Ö§ä
            local ItemID = 3336 -- ID §á§â§Ö§Õ§Þ§Ö§ä§Ñ §Ó§Ñ§ê§Ö§Ô§à §á§â§Ö§Õ§Þ§Ö§ä§Ñ 
			if (CheckBagItem(t[i], ItemID) > 0) then 
				exp = 0 
			end
			--§µ§Ù§ß§Ñ§Ö§Þ §â§Ñ§Ù§ß§Ú§è§å §å§â§à§Ó§ß§Ö§Û §Þ§à§ß§ã§ä§â§Ñ §Ú §á§Ö§â§ã§Ñ
			--local lv_gap = Lv (dead) - Lv (t[i])
			SetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP, exp )
		else 
	        --SystemNotice ( team_atker , "Member Arrangement ["..i.."]'s value as null")
		end 
	end 
end 



function returnLowLVPlayer(PlayerNow,Player1,Player2,Player3,Player4,Player5)    --·µ»Ø¶ÓÎéÖÐ±È×Ô¼ºµÈ¼¶Ð¡5¼¶µÄÍæ¼ÒÖ¸Õë
	local lvPlayerNow = GetChaAttr(PlayerNow, ATTR_LV)
	PlayerNow = TurnToCha(PlayerNow)
	Player1 = TurnToCha(Player1)
	Player2 = TurnToCha(Player2)
	Player3 = TurnToCha(Player3)
	Player4 = TurnToCha(Player4)
	Player5 = TurnToCha(Player5)
	
	if ValidCha(Player1) == 1 then
		local lvPlayer1 = GetChaAttr(Player1, ATTR_LV)
		if lvPlayerNow > lvPlayer1 + 5 then
			return Player1
		end
	end
	
	if ValidCha(Player2) == 1 then
		local lvPlayer2 = GetChaAttr(Player2, ATTR_LV)
		if lvPlayerNow > lvPlayer2 + 5 then
			return Player2
		end
	end
	
	if ValidCha(Player3) == 1 then
		local lvPlayer3 = GetChaAttr(Player3, ATTR_LV)
		if lvPlayerNow > lvPlayer3 + 5 then
			return Player3
		end
	end
	
	if ValidCha(Player4) == 1 then
		local lvPlayer4 = GetChaAttr(Player4, ATTR_LV)
		if lvPlayerNow > lvPlayer4 + 5 then
			return Player4
		end
	end
	
	if ValidCha(Player5) == 1 then
		local lvPlayer5 = GetChaAttr(Player5, ATTR_LV)
		if lvPlayerNow > lvPlayer5 + 5 then
			return Player5
		end
	end
	
	return 0
end

function CheckExpShare ( ti , atk ) --tiÈç¹ûatkÏàµÈÄÇ¾ÍÓÐÎÊÌâÁË
	if ValidCha(ti)==0 then 
		LG ( "luascript_err" , "fucntion CheckExpShare : party member count as null\n" ) 
		return 0
	end 

	if IsInSameMap ( atk , ti ) == 0   then 
		--SystemNotice( atk , "As you are in a map different from your party members, you will not be able to receive battle EXP") 
		return 0 
	end 

	local pos_ti_x , pos_ti_y = GetChaPos ( ti ) 
	if ValidCha( atk ) == 0 then 
		LG ( "luascript_err" , "fucntion CheckExpShare : Monster killer as null\n" ) 
		return 0
	end 

		
	local pos_atk_x , pos_atk_y = GetChaPos ( atk ) 
	local distance = Dis ( pos_ti_x , pos_ti_y , pos_atk_x , pos_atk_y ) 
	if distance >= 4000 then 
--		HelpInfo(ti,0,"You are too far away from your party to gain any experience") 
		return 0 
	end 
	if IsChaInRegion ( ti , AREA_SAFE ) == 1 then 
--		HelpInfo(ti,0,"Unable to receive any experience from party kill as you are in Safe Zone") 
		return 0 
	end 
	return 1 
end 

---------------------
-- Øòðàô çà ñìåðòü --
---------------------
function Dead_Punish ( dead , atk )
	local map_name = GetChaMapName ( dead )
	if map_name == "leiting2" or map_name == "binglang2" or map_name == "shalan2" or map_name == "guildwar" or map_name == "guildwar2" then
		return
	end

	local map_name = GetChaMapName ( dead )
	if map_name == "garner2" then
		--Ìàíó íà 0
		SetCharaAttr(0, dead, ATTR_SP)
		return
	end
	dead = TurnToCha ( dead ) 
	local lv = GetChaAttr( dead, ATTR_LV ) 
	local check_pirate=CheckItem_pirate(dead)
	local check_death=CheckItem_Death(dead)
	local Time = os.date("%H")
	local TimeNum = tonumber(Time)

	if lv<=10 then
		return 
	end --[[ÅÐ¶¨´óÓÚ10¼¶¿Û³ý¾­Ñé]]--
	if lv >= 70 and check_pirate ==1 then
		if TimeNum<=6 or TimeNum >=18 then
			SystemNotice (dead , "Received blessing from moonlight. Death penalty will be removed" ) 
			return
		end
	end
	if lv >= 75 and check_death ==1 then
		if TimeNum<=6 or TimeNum >=18 then
			SystemNotice (dead , "Received blessing from death. Death penalty will be removed" ) 
			return
		end
	end
	local exp_red 
	local exp = Exp(dead) 
	local nlexp = GetChaAttrI ( dead , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( dead , ATTR_CLEXP ) 
	if  exp <= clexp then 
		exp_red = 0 
	else 
		exp_red = math.min ( math.floor ( ( nlexp - clexp ) * 0.02 ) , math.max ( exp - clexp , 0 ) ) 
	end 
	SetCharaAttr(0, dead, ATTR_SP) 
	local i1 = CheckBagItem( dead,3846 )
	local i2 = CheckBagItem( dead,3047 )

	if map_name == "secretgarden" or map_name == "teampk" then
	SetCharaAttr(0, dead, ATTR_SP)
		return
	end
	
	local i= CheckBagItem( dead, 2954 )-------ËÀÍöÖ¤Ã÷
	--SystemNotice( dead , "i=="..i)
	if i==1 then
		local Dead_BK = GetChaItem2 ( dead , 2 , 2954 )
		local DeadPoint=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
			--SystemNotice( dead , "DeadPointÖ®Ç°Îª=="..DeadPoint)

		local DeadPoint=DeadPoint+1
			SetItemAttr( Dead_BK , ITEMATTR_VAL_STR , DeadPoint )
				local DeadPoint1=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
				--SystemNotice( dead , "DeadPointÏÖÔÚÎª=="..DeadPoint1)

		if DeadPoint>=100 then
		end
	end

	if i1 <= 0 and i2 <= 0 then ---Ã»ÍÞÍÞÃ»±¦±¦
		exp = Exp(dead) - exp_red 
		if Lv ( dead ) >= 80 then 
			exp_red_80 = exp_red * 50 
			SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red_80.." \238\247\234\238\226 \238\239\251\242\224" ) 
		else 
			SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red.." \238\247\234\238\226 \238\239\251\242\224" ) 
		end 
		SetChaAttrI( dead , ATTR_CEXP , exp ) --[[¿Û³ýËÀÍöÍæ¼ÒËùÔÚ¼¶±ð¾­ÑéµÄ2£¥]]--
		if lv > 20 then
			Dead_Punish_ItemURE ( dead )
		end
	
	elseif i1~=0 and i2==0 then --ÓÐÍÞÍÞÃ»±¦±¦
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red_80.." \238\247\234\238\226 \238\239\251\242\224" ) 
			else 
				SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red.." \238\247\234\238\226 \238\239\251\242\224" ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[¿Û³ýËÀÍöÍæ¼ÒËùÔÚ¼¶±ð¾­ÑéµÄ2£¥]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1==0 and i2~=0 then --Ã»ÍÞÍÞÓÐ±¦±¦
		local j2 = TakeItem( dead,0,3047,1)
		if j2 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty: Lost "..exp_red_80.." experience point(s)" ) 
			else 
				SystemNotice (dead , "Death penalty: Lost "..exp_red.." experience point(s)" ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[¿Û³ýËÀÍöÍæ¼ÒËùÔÚ¼¶±ð¾­ÑéµÄ2£¥]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1~=0 and i2~=0 then --ÓÐÍÞÍÞÓÐ±¦±¦--Ñ¡ÔñÏÈÉ¾³ýÍÞÍÞ
		local j3 = TakeItem( dead,0,3846,1)
		if j3 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red_80.." \238\247\234\238\226 \238\239\251\242\224" ) 
			else 
				SystemNotice (dead , "\207\235\224\242\224 \231\224 \241\236\229\240\242\252 "..exp_red.." \238\247\234\238\226 \238\239\251\242\224" ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[¿Û³ýËÀÍöÍæ¼ÒËùÔÚ¼¶±ð¾­ÑéµÄ2£¥]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	end
	
	local name = GetChaDefaultName ( dead )
	local exp_new = ( exp - clexp ) / ( nlexp - clexp )
	
	LG ( "die_exp" , "Óìåð èãðîê [" , name , "]	Óðîâåíü = ", lv , "	Øòðàô îïûòà çà ñìåðòü = " , exp_red , "	Îñòàëîñü îïûòà = " , exp_new )

	local mars = 0
	for mars = 0 , 4 , 1 do
		if name == CheckDmgChaNameTest [mars] then
			LG ( "whydie" , name.."Hang" )
		end
	end
end 


function GetExp_MKP(dead , atk) -- Èãðîê óáèâàåì ìîíñòðà
	Dead_Punish( dead , atk) 
end 

function GetExp_PKP(dead , atk) -- Èãðîê óáèâàåò èãðîêà
	Dead_Punish( dead , atk) 
end 

function GetExp_Noexp(dead , atk) --[[ÎÞ½±³Í¾­ÑéÖµ¸Ä±ä¹«Ê½]]-- 
	--LuaPrint("Enter function GetExp_Noexp() --[[no rewards or penalty experience value change formula]]-- ".."\n" ) 
	--LuaPrint("Out function GetExp_Noexp() --[[no reward experience value changes formula]]-- ".."\n" ) 
end 

function Relive ( role )							
	local mxhp = GetChaAttr ( role , ATTR_MXHP ) 
	local mxsp = GetChaAttr ( role , ATTR_MXSP ) 
	local hp = math.max ( 1, math.floor(  ( mxhp * 0.01 ) + 0.5 ) ) 
	local sp = math.max ( 1, math.floor(  ( mxsp * 0.01 ) + 0.5 ) ) 
	SetCharaAttr ( hp , role , ATTR_HP ) 
	SetCharaAttr ( sp , role , ATTR_SP ) 
end 

function Relive_now ( role , sklv ) 
	local cha_role = TurnToCha ( role ) 
	local hp = math.max ( 1 , math.floor ( 0.05 * sklv * Mxhp ( cha_role ) ) ) 
	local sp = math.max ( 1 , math.floor ( 0.05 * sklv * Mxsp ( cha_role ) ) ) 
	SetCharaAttr ( hp , cha_role , ATTR_HP ) 
	SetCharaAttr ( sp , cha_role , ATTR_SP ) 
end 


function  Ship_ShipDieAttr ( role ) 
	local bmxhp = GetChaAttr ( role , ATTR_BMXHP ) 
	local dead_count = GetChaAttr ( role , ATTR_BOAT_DIECOUNT ) 
	LG ( "shipmxhp" , "___a new dead ship_____________________________________________________" ) 
	LG ( "shipmxhp" , "role = " , role ,  "dead_count = " , dead_count , "form_mxhp = " , bmxhp ) 
	bmxhp = bmxhp * math.max ( 0 , ( 1 - 0.02 - dead_count * 0.01 )  ) 
	LG ( "shipmxhp" , "role = " , role ,   "now_mxhp = " , bmxhp ) 
	SetCharaAttr ( bmxhp , role , ATTR_BMXHP ) 
end  


function BoatLevelUpProc ( cha, boat, levelup, exp, money ) 
	if ValidCha( cha ) == 0 then 
		LG ( "luascript_err" , "function BoatLevelUpProc : cha as null" ) 
		return 0 
	end 
	if ValidCha( boat ) == 0 then 
		LG ( "luascript_err" , "function BoatLevelUpProc : boat as null" ) 
		return 0 
	end 
	PRINT( "BoatLevelUpProc: levelup = , exp = , money = ", levelup, exp, money )
	local lv_up	= levelup 
	local req_exp	= exp 
	local req_gold	= money 
	local boat_lv = GetChaAttr ( boat , ATTR_LV ) 
	if boat_lv ~= lv_up - 1 then 
		PRINT( "BoatLevelUpProc:function BoatLevelUpProc : ship current level and upgrade level does not match" )
		LG ( "luascript_err" , "function BoatLevelUpProc : ship current level and level to upgrade does not match" )
		return 0 
	end 

	local boat_exp = GetChaAttr ( boat , ATTR_CEXP ) 
	if boat_exp < req_exp then 
		SystemNotice ( cha , "Insufficient EXP to level up ship. Please try harder") 
		return 0 
	end 


	local cha_money = GetChaAttr ( cha , ATTR_GD ) 
	if cha_money < req_gold then 
		SystemNotice ( cha , "Insufficient gold to level up ship. Please try harder") 
		return 0 
	end 
	PRINT( "BoatLevelUpProc: boat_exp, req_exp, cha_money, req_gold", boat_exp, req_exp, cha_money, req_gold )
	SetAttrChangeFlag( boat)	
	SetAttrChangeFlag( cha)	

	boat_exp = boat_exp - req_exp 
	SetCharaAttr ( boat_exp , boat , ATTR_CEXP ) 
	cha_money = cha_money - req_gold 	
	SetCharaAttr ( cha_money , cha , ATTR_GD ) 
	SetCharaAttr ( lv_up , boat , ATTR_LV ) 
	ALLExAttrSet ( boat ) 
	SystemNotice ( cha , "Ship level up successfully") 
	SystemNotice ( cha , "Gold Deducted: "..req_gold) 
	SystemNotice ( cha , "Consume experience: "..req_exp) 
	SyncBoat ( boat, 4 )
	SyncChar ( cha, 4 )
	PRINT( "BoarLevelUpProc: return 1" )
	return 1 

end 




function Ship_Tran (  buyer , boat ) 
	local ship_lv = GetChaAttr ( boat , ATTR_LV ) 
	local ship_exp = GetChaAttr ( boat , ATTR_CEXP ) 
--	if ValidCha ( seller ) == 0 then 
--		LG ( "luascript_err"  , "function Ship_Tran : seller as null"  ) 
--		return 
--	end 
--	if ValidCha ( buyer ) == 0 then 
--		LG ( "luascript_err"  , "function Ship_Tran : buyer as null"  ) 
--		return 
--	end 
	SetAttrChangeFlag( boat)	

	ship_lv = math.max ( 1 , math.max (math.floor ( ship_lv /2 ), ship_lv - 10 ) )  
	ship_exp = 0 
	SetCharaAttr ( ship_exp , boat , ATTR_CEXP ) 
	SetCharaAttr ( ship_lv , boat , ATTR_LV ) 
	SystemNotice ( buyer , "After trade, ship level becomes "..ship_lv )	
	SystemNotice ( buyer , "After trade, ship experience reduced to "..ship_exp )	 

	SyncBoat ( boat, 4 )
end 


--ÐÒÔËÒ»»÷
function CheckLuckyFinish ( StateLv )
	if StateLv == 3 then
		local Huge_Lucky = Percentage_Random ( 0.01 )
		if Huge_Lucky == 1 then
			return 2
		end
	end
	
	local a = 0.1
	local b = Percentage_Random ( a )
	return b
end

