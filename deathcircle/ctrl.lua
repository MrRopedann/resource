function config(map)
    MapCanSavePos(map, 0) --
    MapCanPK(map, 1) --
    MapCanTeam( map, 0 )
    MapType( map , 3 )
    MapCopyNum(map, 1) --
    SingleMapCopyPlyNum(map, 300)   --
    --MapCanTeam(map , 1)
    MapCanStall(map , 0)
end
---------------------------------------------------------------------------
---------------------------------------------------------------------------
function get_map_entry_pos_deathcircle()   --

	local POS_X=2225
	local POS_Y=2773
	return POS_X , POS_Y

end

function init_entry(map)

    SetMapEntryMapName(map, "garner") --
    SetMapEntryTime(map, "2006/10/18/0/0", "0/1/0", "0/0/40", "0/0/55") 

end

function after_enter_deathcircle( role , map_copy )
end

function before_leave_deathcircle( role )
end

--function map_copy_first_run_deathcircle( map_copy )
--	lua_SetCopySpecialInter(map_copy , 10000)
--	Notice("10")
--
--end

--function map_copy_run_deathcircle( map_copy )
----Notice("3")
--local new1 = CreateChaEx(791, 120, 120, 145, 50)
--	SetChaLifeTime(new1, 900000)
--		
--end

--MONSTERS THAT APPEAR
function map_copy_run_special_deathcircle( map_copy ) 
local HowManyNoDead = GetMapActivePlayer(map_copy)
	Notice(" Âûæèâøèõ "..HowManyNoDead.."  â êðóãó ñìåðòè ")
	Every_5_minute = Every_5_minute+1
	if Every_5_minute == 2 then -- ³õ¼¶±¦Ïä
		local Monster2 = CreateChaEx(859, 9900, 9900, 145, 60,map_copy)
		local Monster3 = CreateChaEx(859, 15500, 3400, 145, 60,map_copy)
		local Monster4 = CreateChaEx(859, 17800, 9600, 145, 60,map_copy)
		local Monster5 = CreateChaEx(859, 15500, 15500, 145, 60,map_copy)
		local Monster6 = CreateChaEx(859, 10000, 17700, 145, 60,map_copy)
		local Monster7 = CreateChaEx(859, 3500, 15500, 145, 60,map_copy)
		local Monster8 = CreateChaEx(859, 1500, 9200, 145, 60,map_copy)
		local Monster9 = CreateChaEx(859, 3500, 3800, 145, 60,map_copy)
		local Monster10 = CreateChaEx(859, 9500, 11100, 145, 60,map_copy)
		local Monster11 = CreateChaEx(859, 10800, 10000, 145, 60,map_copy)
		local Monster12 = CreateChaEx(859, 10200, 8300, 145, 60,map_copy)
		local Monster13 = CreateChaEx(859, 8500, 9000, 145, 60,map_copy)
		local Monster14 = CreateChaEx(859, 10000, 10500, 145, 60,map_copy)
		local Monster15 = CreateChaEx(859, 8750, 9700, 145, 60,map_copy)
		SetChaLifeTime(Monster2,299050)
		SetChaLifeTime(Monster3,299100)
		SetChaLifeTime(Monster4,299150)
		SetChaLifeTime(Monster5,299200)
		SetChaLifeTime(Monster6,299250)
		SetChaLifeTime(Monster7,299300)
		SetChaLifeTime(Monster8,299350)
		SetChaLifeTime(Monster9,299400)
		SetChaLifeTime(Monster10,299450)
		SetChaLifeTime(Monster11,299500)
		SetChaLifeTime(Monster12,299550)
		SetChaLifeTime(Monster13,299600)
		SetChaLifeTime(Monster14,299650)
		SetChaLifeTime(Monster15,299700)

	end
	if Every_5_minute == 3 then -- ÖÐ¼¶±¦Ïä
		local Monster16 = CreateChaEx(860, 15500, 3400, 145, 60,map_copy)
		local Monster17 = CreateChaEx(860, 17800, 9600, 145, 60,map_copy)
		local Monster18 = CreateChaEx(860, 15500, 15500, 145, 60,map_copy)
		local Monster19 = CreateChaEx(860, 10000, 17700, 145, 60,map_copy)
		local Monster20 = CreateChaEx(860, 3500, 15500, 145, 60,map_copy)
		local Monster21 = CreateChaEx(860, 1500, 9200, 145, 60,map_copy)
		local Monster22 = CreateChaEx(860, 3500, 3800, 145, 60,map_copy)
		SetChaLifeTime(Monster16, 299050)
		SetChaLifeTime(Monster17, 299100)
		SetChaLifeTime(Monster18, 299150)
		SetChaLifeTime(Monster19, 299200)
		SetChaLifeTime(Monster20, 299250)
		SetChaLifeTime(Monster21, 299300)
		SetChaLifeTime(Monster22, 299350)

	end
	if Every_5_minute == 4 then -- ¸ß¼¶±¦Ïä
		local Monster23 = CreateChaEx(861, 15500, 3400, 145, 60,map_copy)
		local Monster24 = CreateChaEx(861, 17800, 9600, 145, 60,map_copy)
		local Monster25 = CreateChaEx(861, 15500, 15500, 145, 60,map_copy)
		local Monster26 = CreateChaEx(861, 10000, 17700, 145, 60,map_copy)
		local Monster27 = CreateChaEx(861, 3500, 15500, 145, 60,map_copy)
		local Monster28 = CreateChaEx(861, 1500, 9200, 145, 60,map_copy)
		local Monster29 = CreateChaEx(861, 3500, 3800, 145, 60,map_copy)
		SetChaLifeTime(Monster23, 299050)
		SetChaLifeTime(Monster24, 299100)
		SetChaLifeTime(Monster25, 299150)
		SetChaLifeTime(Monster26, 299200)
		SetChaLifeTime(Monster27, 299250)
		SetChaLifeTime(Monster28, 299300)
		SetChaLifeTime(Monster29, 299350)

	end
	if Every_5_minute == 5 then --ÐÂÊÖ
		local Monster30 = CreateChaEx(870, 15500, 3400, 145, 60,map_copy)
		local Monster31 = CreateChaEx(871, 17800, 9600, 145, 60,map_copy)
		local Monster32 = CreateChaEx(877, 15500, 15500, 145, 60,map_copy)
		local Monster33 = CreateChaEx(871, 10000, 17700, 145, 60,map_copy)
		local Monster34 = CreateChaEx(874, 3500, 15500, 145, 60,map_copy)
		local Monster35 = CreateChaEx(871, 1500, 9200, 145, 60,map_copy)
		local Monster36 = CreateChaEx(870, 3500, 3800, 145, 60,map_copy)
		local Monster37 = CreateChaEx(877, 13800, 9600, 145, 60,map_copy)
		local Monster38 = CreateChaEx(877, 11500, 3400, 145, 60,map_copy)
		local Monster39 = CreateChaEx(877, 11500, 15500, 145, 60,map_copy)
		local Monster40 = CreateChaEx(874, 9000, 13700, 145, 60,map_copy)
		local Monster41 = CreateChaEx(881, 3500, 11500, 145, 60,map_copy)
		local Monster42 = CreateChaEx(870, 6500, 6800, 145, 60,map_copy)
		local Monster43 = CreateChaEx(870, 9900, 9900, 145, 60,map_copy)
		local Monster44 = CreateChaEx(871, 9500, 11100, 145, 60,map_copy)
		local Monster45 = CreateChaEx(881, 10800, 10000, 145, 60,map_copy)
		local Monster46 = CreateChaEx(870, 10200, 8300, 145, 60,map_copy)
		local Monster47 = CreateChaEx(870, 8500, 9000, 145, 60,map_copy)
		local Monster48 = CreateChaEx(874, 10000, 10500, 145, 60,map_copy)
		local Monster49 = CreateChaEx(878, 8050, 10000, 145, 60,map_copy)
		local Monster50 = CreateChaEx(878, 8750, 9700, 145, 60,map_copy)
		local Monster51 = CreateChaEx(878, 12200, 6300, 145, 60,map_copy)
		SetChaLifeTime(Monster30,298050)
		SetChaLifeTime(Monster31,298100)
		SetChaLifeTime(Monster32,298150)
		SetChaLifeTime(Monster33,298200)
		SetChaLifeTime(Monster34,298250)
		SetChaLifeTime(Monster35,298300)
		SetChaLifeTime(Monster36,298350)
		SetChaLifeTime(Monster37,298400)
		SetChaLifeTime(Monster38,298450)
		SetChaLifeTime(Monster39,298500)
		SetChaLifeTime(Monster40,298550)
		SetChaLifeTime(Monster41,291303)
		SetChaLifeTime(Monster42,298650)
		SetChaLifeTime(Monster43,291313)
		SetChaLifeTime(Monster44,291305)
		SetChaLifeTime(Monster45,291310)
		SetChaLifeTime(Monster46,291319)
		SetChaLifeTime(Monster47,298900)
		SetChaLifeTime(Monster48,298950)
		SetChaLifeTime(Monster49,299000)
		SetChaLifeTime(Monster50,299050)
		SetChaLifeTime(Monster51,299100)

	end
	if Every_5_minute == 6 then -- Ò»×ª½ÇÉ«
		local Monster30 = CreateChaEx(1161, 15500, 3400, 145, 60,map_copy)
		local Monster51 = CreateChaEx(1160, 17800, 9600, 145, 60,map_copy)
		local Monster53 = CreateChaEx(1160, 15500, 15500, 145, 60,map_copy)
		local Monster54 = CreateChaEx(1161, 10000, 17700, 145, 60,map_copy)
		local Monster55 = CreateChaEx(1161, 3500, 15500, 145, 60,map_copy)
		local Monster56 = CreateChaEx(1161, 1500, 9200, 145, 60,map_copy)
		local Monster57 = CreateChaEx(1160, 3500, 3800, 145, 60,map_copy)
		local Monster58 = CreateChaEx(1160, 13800, 9600, 145, 60,map_copy)
		local Monster59 = CreateChaEx(1160, 11500, 3400, 145, 60,map_copy)
		local Monster60 = CreateChaEx(1161, 11500, 15500, 145, 60,map_copy)
		local Monster61 = CreateChaEx(1161, 9000, 13700, 145, 60,map_copy)
		local Monster62 = CreateChaEx(1161, 3500, 11500, 145, 60,map_copy)
		local Monster63 = CreateChaEx(1160, 6500, 6800, 145, 60,map_copy)
		local Monster64 = CreateChaEx(1160, 9900, 9900, 145, 60,map_copy)
		local Monster65 = CreateChaEx(1161, 9500, 11100, 145, 60,map_copy)
		local Monster66 = CreateChaEx(1160, 10800, 10000, 145, 60,map_copy)
		local Monster67 = CreateChaEx(1160, 10200, 8300, 145, 60,map_copy)
		local Monster68 = CreateChaEx(1161, 8500, 9000, 145, 60,map_copy)
		local Monster69 = CreateChaEx(1160, 10000, 10500, 145, 60,map_copy)

			SetChaLifeTime(Monster52,297050)
			SetChaLifeTime(Monster53,297100)
			SetChaLifeTime(Monster54,297150)
			SetChaLifeTime(Monster55,297200)
			SetChaLifeTime(Monster56,297250)
			SetChaLifeTime(Monster57,297300)
			SetChaLifeTime(Monster58,297350)
			SetChaLifeTime(Monster59,297400)
			SetChaLifeTime(Monster60,297450)
			SetChaLifeTime(Monster61,297500)
			SetChaLifeTime(Monster62,297550)
			SetChaLifeTime(Monster63,297600)
			SetChaLifeTime(Monster64,297650)
			SetChaLifeTime(Monster65,297700)
			SetChaLifeTime(Monster66,297750)
			SetChaLifeTime(Monster67,297800)
			SetChaLifeTime(Monster68,297850)
			SetChaLifeTime(Monster69,297900)

	end
	if Every_5_minute == 7 then -- ¶þ×ª½ÇÉ«
		local Monster94 = CreateChaEx(1204, 17800, 9600, 145, 60,map_copy)
		local Monster95 = CreateChaEx(1204, 15500, 15500, 145, 60,map_copy)
		local Monster96 = CreateChaEx(1206, 10000, 17700, 145, 60,map_copy)
		local Monster97 = CreateChaEx(1205, 3500, 15500, 145, 60,map_copy)
		local Monster98 = CreateChaEx(1206, 1500, 9200, 145, 60,map_copy)
			SetChaLifeTime(Monster94,296050)
			SetChaLifeTime(Monster95,296100)
			SetChaLifeTime(Monster96,296150)
			SetChaLifeTime(Monster97,296200)
			SetChaLifeTime(Monster98,296250)
			
	end
	if Every_5_minute == 8 then -- ºÚÁú½ÇÉ«
		local Monster167 = CreateChaEx(1196, 17800, 9600, 145, 60,map_copy)
		local Monster168 = CreateChaEx(1196, 15500, 15500, 145, 60,map_copy)
		local Monster169 = CreateChaEx(1196, 10000, 17700, 145, 60,map_copy)
		local Monster170 = CreateChaEx(1196, 3500, 15500, 145, 60,map_copy)
		local Monster171 = CreateChaEx(1196, 1500, 9200, 145, 60,map_copy)

			SetChaLifeTime(Monster168,290050)
			SetChaLifeTime(Monster169,290100)
			SetChaLifeTime(Monster170,290150)
			SetChaLifeTime(Monster171,290200)
			
			
	end
end
-----------------------------------
function map_run_deathcircle( map )
	
end

-----------------------------------
function map_copy_before_close_deathcircle( map_copy )
	How_Many_Active = GetMapActivePlayer(map_copy)
	if How_Many_Active > 0 then
		DealAllActivePlayerInMap(map_copy,"GiveSpecItem")
	end
	How_Many_Active = 0
	Money_all = 20000000
	Every_5_minute = 0

end

-----------------------------------
function map_copy_close_deathcircle( map_copy )
	ClearAllSubMapCha(map_copy)
end
--

function can_open_entry_deathcircle( map )
	local Now_Time = GetNowTime()
	if Now_Time == 2 or Now_Time == 5 or Now_Time == 8 or Now_Time == 11 or Now_Time == 11 or Now_Time == 14 or Now_Time == 20 or Now_Time == 23 then
		return 1
	else
		return 1
	end
	
end 

function GiveSpecItem( role )
	if How_Many_Active == 0 then
		return
	end
	
	local Money_deathcircle = Money_all/How_Many_Active
--	SystemNotice(role,How_Many_Active)

	if How_Many_Active > 10 then
		AddMoney ( role , 0 , Money_deathcircle )
	--	local message = "½ñÌìµÄÂÒ¶·¹²´æ»îÁË"..How_Many_Active .. "Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®"
	--	SystemNotice(role,How_Many_Active)
		return
	end
	
	if How_Many_Active <  9 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5332  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5332  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  8 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5333  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5333  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  7 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5334  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5334  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  6 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5335  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5335  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  5 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5336  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5336  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end
	if How_Many_Active <  4 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5337  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5337  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  3 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5338  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5338  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end

	if How_Many_Active <  2 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5339  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5339  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_deathcircle )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "½ñÌìµÄÂÒ¶·ÖÐ¹²´æ»îÁË"..How_Many_Active .."Î»Íæ¼Ò,ËûÃÇÃ¿ÈË½«»ñµÃ"..Money_deathcircle .."µÄ½ðÇ®ºÍ1¸öÂÒ¶·Ö®ÐÇ»ÕÕÂ"
		--Notice ( message )
		return
	end
	
	if How_Many_Active == 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5340  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5340  , 1 , 4 )
		end
		AddMoney ( role , 0 , Money_deathcircle )
		local cha_name = GetChaDefaultName ( role )
		local message = "Ïîçäðàâëÿþ "..cha_name.." Âû çàðàáîòàëè ".. Money_deathcircle .." çîëîòûõ è 1 ãåíèðàëüíàÿ ïèðàòñêàÿ ìåäàëü "
	--	SystemNotice(role,How_Many_Active)
		SystemNotice(role,message)
		return
	end
end 


