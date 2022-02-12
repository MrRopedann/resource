--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading BountyPK Ctrl.lua" )


function config(map)
    MapCanSavePos(map, 0)
    MapCanPK(map, 1)
    MapCanTeam( map, 0 )
    MapType( map , 3 )
    MapCopyNum(map, 1)
    SingleMapCopyPlyNum(map, 300)
    
end

function get_map_entry_pos_bountypk()   -- Cordinates of portal

	local POS_X=680
	local POS_Y=827
	return POS_X , POS_Y

end

function init_entry(map)

    SetMapEntryMapName(map, "magicsea")
    SetMapEntryTime(map, "2006/10/18/10/0", "0/2/0", "0/0/30", "0/0/45")

end

function after_enter_bountypk( role , map_copy )
end

function before_leave_bountypk( role )
end

function map_copy_run_bountypk( map_copy )
end

function map_copy_run_special_bountypk( map_copy ) 
	local HowManyNoDead = GetMapActivePlayer(map_copy)
	if HowManyNoDead > 4 and HowManyNoDead <= 20 then
	Notice("\205\224 \192\240\229\237\229 \229\249\184 \230\232\226\251 "..HowManyNoDead.." \232\227\240\238\234\238\226 " )
	elseif HowManyNoDead > 1 and HowManyNoDead <= 4 then
	Notice("\205\224 \192\240\229\237\229 \229\249\184 \230\232\226\251 "..HowManyNoDead.." \232\227\240\238\234\224 " )
	elseif HowManyNoDead > 21 and HowManyNoDead <= 24 then
	Notice("\205\224 \192\240\229\237\229 \229\249\184 \230\232\226\251 "..HowManyNoDead.." \232\227\240\238\234\224 " )
	elseif HowManyNoDead > 24 and HowManyNoDead <= 70 then
	Notice("\205\224 \192\240\229\237\229 \229\249\184 \230\232\226\251 "..HowManyNoDead.." \232\227\240\238\234\238\226 " )
	elseif HowManyNoDead == 1 then
	Notice("\205\224 \192\240\229\237\229 \229\249\184 \230\232\226 "..HowManyNoDead.." \232\227\240\238\234 " )
	else
		Notice("\205\224 \192\240\229\237\229 \237\229\242 \237\232 \238\228\237\238\227\238 \232\227\240\238\234\224 ")
	end
	Every_5_minute1 = Every_5_minute1 + 1
	
	if Every_5_minute1 == 1 then
		local Monster2 = CreateChaEx(1120, 6500, 6100, 145, 60,map_copy)
		local Monster3 = CreateChaEx(1120, 6900, 5800, 145, 60,map_copy)
		local Monster4 = CreateChaEx(1120, 6500, 5300, 145, 60,map_copy)
		local Monster5 = CreateChaEx(1120, 6200, 5700, 145, 60,map_copy)
		local Monster6 = CreateChaEx(1213, 5800, 6500, 145, 60,map_copy)
		local Monster7 = CreateChaEx(1214, 5400, 5500, 145, 60,map_copy)
		local Monster8 = CreateChaEx(1215, 5800, 4700, 145, 60,map_copy)
		local Monster9 = CreateChaEx(1216, 6800, 4600, 145, 60,map_copy)
		local Monster10 = CreateChaEx(1213, 8000, 5300, 145, 60,map_copy)
		local Monster11 = CreateChaEx(1214, 7500, 7300, 145, 60,map_copy)
		local Monster12 = CreateChaEx(1215, 5300, 7200, 145, 60,map_copy)
		local Monster13 = CreateChaEx(1216, 6500, 4000, 145, 60,map_copy)
		local Monster14 = CreateChaEx(1213, 6600, 7800, 145, 60,map_copy)
		local Monster15 = CreateChaEx(1214, 4200, 4800, 145, 60,map_copy)
		local Monster16 = CreateChaEx(1215, 4200, 5700, 145, 60,map_copy)
		local Monster17 = CreateChaEx(1216, 4300, 6600, 145, 60,map_copy)
		local Monster18 = CreateChaEx(1213, 3900, 7200, 145, 60,map_copy)
		local Monster19 = CreateChaEx(1214, 9000, 7000, 145, 60,map_copy)
		local Monster20 = CreateChaEx(1215, 9000, 6000, 145, 60,map_copy)
		local Monster21 = CreateChaEx(1216, 9000, 4800, 145, 60,map_copy)
		local Monster22 = CreateChaEx(1214, 7200, 6500, 145, 60,map_copy)
		local Monster23 = CreateChaEx(1229, 6500, 5800, 145, 60,map_copy)		
		SetChaLifeTime(Monster2,297050)
		SetChaLifeTime(Monster3,297100)
		SetChaLifeTime(Monster4,297150)
		SetChaLifeTime(Monster5,297200)
		SetChaLifeTime(Monster6,297250)
		SetChaLifeTime(Monster7,297300)
		SetChaLifeTime(Monster8,297350)
		SetChaLifeTime(Monster9,297400)
		SetChaLifeTime(Monster10,297450)
		SetChaLifeTime(Monster11,297500)
		SetChaLifeTime(Monster12,297550)
		SetChaLifeTime(Monster13,297600)
		SetChaLifeTime(Monster14,297650)
		SetChaLifeTime(Monster15,297700)
		SetChaLifeTime(Monster16,297750)
		SetChaLifeTime(Monster17,297800)
		SetChaLifeTime(Monster18,297850)
		SetChaLifeTime(Monster19,297900)
		SetChaLifeTime(Monster20,297950)
		SetChaLifeTime(Monster21,297000)
		SetChaLifeTime(Monster22,296050)
		SetChaLifeTime(Monster23,296150)
end
		
		if Every_5_minute1 == 3 then -- 初级宝箱
		local Monster24 = CreateChaEx(1217, 6500, 5200, 145, 60,map_copy)
		local Monster25 = CreateChaEx(1218, 6100, 5700, 145, 60,map_copy)
		local Monster26 = CreateChaEx(1219, 6600, 6200, 145, 60,map_copy)
		local Monster27 = CreateChaEx(1220, 5600, 6700, 145, 60,map_copy)
		local Monster28 = CreateChaEx(1217, 5000, 6600, 145, 60,map_copy)
		local Monster29 = CreateChaEx(1218, 5100, 5800, 145, 60,map_copy)
		local Monster30 = CreateChaEx(1219, 5300, 5100, 145, 60,map_copy)
		local Monster31 = CreateChaEx(1220, 6100, 4700, 145, 60,map_copy)
		local Monster32 = CreateChaEx(1217, 5100, 4300, 145, 60,map_copy)
		local Monster33 = CreateChaEx(1218, 4700, 4700, 145, 60,map_copy)
		local Monster34 = CreateChaEx(1219, 6400, 7000, 145, 60,map_copy)
		local Monster35 = CreateChaEx(1220, 7000, 7500, 145, 60,map_copy)
		local Monster36 = CreateChaEx(1217, 7900, 6900, 145, 60,map_copy)
		local Monster37 = CreateChaEx(1218, 8000, 5900, 145, 60,map_copy)
		local Monster38 = CreateChaEx(1219, 7400, 4900, 145, 60,map_copy)
		local Monster39 = CreateChaEx(1220, 8300, 4500, 145, 60,map_copy)
		local Monster40 = CreateChaEx(1120, 9000, 7100, 145, 60,map_copy)
		local Monster41 = CreateChaEx(1120, 9100, 4800, 145, 60,map_copy)
		local Monster42 = CreateChaEx(1120, 4200, 4800, 145, 60,map_copy)
		local Monster43 = CreateChaEx(1120, 4300, 7200, 145, 60,map_copy)
		SetChaLifeTime(Monster24,297050)
		SetChaLifeTime(Monster25,297100)
		SetChaLifeTime(Monster26,297150)
		SetChaLifeTime(Monster27,297200)
		SetChaLifeTime(Monster28,297250)
		SetChaLifeTime(Monster29,297300)
		SetChaLifeTime(Monster30,297350)
		SetChaLifeTime(Monster31,297400)
		SetChaLifeTime(Monster32,297450)
		SetChaLifeTime(Monster33,297500)
		SetChaLifeTime(Monster34,297550)
		SetChaLifeTime(Monster35,297600)
		SetChaLifeTime(Monster36,297650)
		SetChaLifeTime(Monster37,297700)
		SetChaLifeTime(Monster38,297750)
		SetChaLifeTime(Monster39,297800)
		SetChaLifeTime(Monster40,297850)
		SetChaLifeTime(Monster41,297900)
		SetChaLifeTime(Monster42,297950)
		SetChaLifeTime(Monster43,296150)
		
end
		if Every_5_minute1 == 4 then -- 初级宝箱
		local Monster44 = CreateChaEx(1230, 6500, 5800, 145, 60,map_copy)
		local Monster45 = CreateChaEx(1120, 6200, 6100, 145, 60,map_copy)
		local Monster46 = CreateChaEx(1120, 6800, 6100, 145, 60,map_copy)
		local Monster47 = CreateChaEx(1120, 6500, 5300, 145, 60,map_copy)
		local Monster48 = CreateChaEx(1221, 5000, 6600, 145, 60,map_copy)
		local Monster49 = CreateChaEx(1222, 5100, 5800, 145, 60,map_copy)
		local Monster50 = CreateChaEx(1223, 5300, 5100, 145, 60,map_copy)
		local Monster51 = CreateChaEx(1224, 6100, 4700, 145, 60,map_copy)
		local Monster52 = CreateChaEx(1221, 5100, 4300, 145, 60,map_copy)
		local Monster53 = CreateChaEx(1222, 4700, 4700, 145, 60,map_copy)
		local Monster54 = CreateChaEx(1223, 6400, 7000, 145, 60,map_copy)
		local Monster55 = CreateChaEx(1224, 7000, 7500, 145, 60,map_copy)
		local Monster56 = CreateChaEx(1221, 7900, 6900, 145, 60,map_copy)
		local Monster57 = CreateChaEx(1222, 8000, 5900, 145, 60,map_copy)
		local Monster58 = CreateChaEx(1223, 7400, 4900, 145, 60,map_copy)
		local Monster59 = CreateChaEx(1224, 8300, 4500, 145, 60,map_copy)
		local Monster60 = CreateChaEx(1221, 9000, 7100, 145, 60,map_copy)
		local Monster61 = CreateChaEx(1222, 9100, 4800, 145, 60,map_copy)
		local Monster62 = CreateChaEx(1223, 4200, 4800, 145, 60,map_copy)
		local Monster63 = CreateChaEx(1224, 4300, 7200, 145, 60,map_copy)
		SetChaLifeTime(Monster44,297050)
		SetChaLifeTime(Monster45,297100)
		SetChaLifeTime(Monster46,297150)
		SetChaLifeTime(Monster47,297200)
		SetChaLifeTime(Monster48,297250)
		SetChaLifeTime(Monster49,297300)
		SetChaLifeTime(Monster50,297350)
		SetChaLifeTime(Monster51,297400)
		SetChaLifeTime(Monster52,297450)
		SetChaLifeTime(Monster53,297500)
		SetChaLifeTime(Monster54,297550)
		SetChaLifeTime(Monster55,297600)
		SetChaLifeTime(Monster56,297650)
		SetChaLifeTime(Monster57,297700)
		SetChaLifeTime(Monster58,297750)
		SetChaLifeTime(Monster59,297800)
		SetChaLifeTime(Monster60,297850)
		SetChaLifeTime(Monster61,297900)
		SetChaLifeTime(Monster62,297950)
		SetChaLifeTime(Monster63,296150)
		end

		if Every_5_minute1 == 5 then -- 初级宝箱
		local Monster64 = CreateChaEx(1231, 6500, 5800, 145, 60,map_copy)
		local Monster65 = CreateChaEx(1121, 6500, 5300, 145, 60,map_copy)
		local Monster66 = CreateChaEx(1121, 6500, 6100, 145, 60,map_copy)
		local Monster67 = CreateChaEx(1225, 5600, 6700, 145, 60,map_copy)
		local Monster68 = CreateChaEx(1226, 5000, 6600, 145, 60,map_copy)
		local Monster69 = CreateChaEx(1227, 5100, 5800, 145, 60,map_copy)
		local Monster70 = CreateChaEx(1228, 5300, 5100, 145, 60,map_copy)
		local Monster71 = CreateChaEx(1225, 6100, 4700, 145, 60,map_copy)
		local Monster72 = CreateChaEx(1226, 5100, 4300, 145, 60,map_copy)
		local Monster73 = CreateChaEx(1227, 4700, 4700, 145, 60,map_copy)
		local Monster74 = CreateChaEx(1228, 6400, 7000, 145, 60,map_copy)
		local Monster75 = CreateChaEx(1225, 7000, 7500, 145, 60,map_copy)
		local Monster76 = CreateChaEx(1226, 7900, 6900, 145, 60,map_copy)
		local Monster77 = CreateChaEx(1227, 8000, 5900, 145, 60,map_copy)
		local Monster78 = CreateChaEx(1228, 7400, 4900, 145, 60,map_copy)
		local Monster79 = CreateChaEx(1225, 8300, 4500, 145, 60,map_copy)
		local Monster80 = CreateChaEx(1226, 9000, 7100, 145, 60,map_copy)
		local Monster81 = CreateChaEx(1227, 9100, 4800, 145, 60,map_copy)
		local Monster82 = CreateChaEx(1228, 4200, 4800, 145, 60,map_copy)
		local Monster83 = CreateChaEx(1225, 4300, 7200, 145, 60,map_copy)
		SetChaLifeTime(Monster64,297050)
		SetChaLifeTime(Monster65,297100)
		SetChaLifeTime(Monster66,297150)
		SetChaLifeTime(Monster67,297200)
		SetChaLifeTime(Monster68,297250)
		SetChaLifeTime(Monster69,297300)
		SetChaLifeTime(Monster70,297350)
		SetChaLifeTime(Monster71,297400)
		SetChaLifeTime(Monster72,297450)
		SetChaLifeTime(Monster73,297500)
		SetChaLifeTime(Monster74,297550)
		SetChaLifeTime(Monster75,297600)
		SetChaLifeTime(Monster76,297650)
		SetChaLifeTime(Monster77,297700)
		SetChaLifeTime(Monster78,297750)
		SetChaLifeTime(Monster79,297800)
		SetChaLifeTime(Monster80,297850)
		SetChaLifeTime(Monster81,297900)
		SetChaLifeTime(Monster82,297950)
		SetChaLifeTime(Monster83,296150)
		end
		end
		
function map_run_bountypk( map )
	
end

function map_copy_before_close_bountypk( map_copy )
	How_Many_Active = GetMapActivePlayer(map_copy)
	if How_Many_Active > 0 then
		DealAllActivePlayerInMap(map_copy,"GiveSpecItem")
	end
	How_Many_Active = 0
	Money_all = 200000000
	Every_5_minute1 = 0
end

function map_copy_close_bountypk( map_copy )
	ClearAllSubMapCha(map_copy)
end


function GiveSpecItem( role )
	if How_Many_Active == 0 then
		return
	end
	
	local Money_bountypk = Money_all/How_Many_Active

	if How_Many_Active > 5 then
		AddMoney ( role , 0 , Money_bountypk )

		return
	end

	if How_Many_Active <  3 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 7502  , 1 , 4 )
		else
			GiveItem ( role , 0 , 7502  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_bountypk )
					
		return
	end
	
	if How_Many_Active == 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 7486  , 1 , 4 )
		else
			GiveItem ( role , 0 , 7486  , 1 , 4 )

		end
		AddMoney ( role , 0 , Money_bountypk )
		local cha_name = GetChaDefaultName ( role )
		local Notice_all = "<"..cha_name.."> has won Bounty Hunter PK and obtained  [2x Ring Card | 2x Neck Card | 1x Azrael Gem Chest]"
		SystemNotice(role,message)
		return
	end
end