function config(map)
    MapCanSavePos(map, 0)
    MapCanPK(map, 1) -- This Map Can be PK Set.
    MapCanTeam( map, 0 )
    MapType( map , 3 )
    MapCopyNum(map, 1)
    SingleMapCopyPlyNum(map, 300)
    --MapCanTeam(map , 1) -- map can be party.
    --MapCanStall(map , 0) -- map can set stall.
end


function get_map_entry_pos_glacierpk()   -- Cordinates of portal

	local POS_X=903
	local POS_Y=3563
	return POS_X , POS_Y

end

function init_entry(map)

    SetMapEntryMapName(map, "magicsea") -- This Is where the portal map located
    SetMapEntryTime(map, "2006/10/18/1/0", "0/1/0", "0/0/30", "0/0/40")

end

function after_enter_glacierpk( role , map_copy )
end

function before_leave_glacierpk( role )
end

--function map_copy_first_run_glacierpk( map_copy )
--	lua_SetCopySpecialInter(map_copy , 10000)
--	Notice("10")
--
--end

--function map_copy_run_glacierpk( map_copy )
----Notice("3")
--local new1 = CreateChaEx(791, 120, 120, 145, 50)
--	SetChaLifeTime(new1, 900000)
--		
--end


function map_copy_run_special_glacierpk( map_copy ) 
	local HowManyNoDead = GetMapActivePlayer(map_copy)
	Notice("There are current "..HowManyNoDead.." survivor in Glacier Armageddon")

end

function map_run_glacierpk( map )
	
end


function map_copy_before_close_glacierpk( map_copy )
	How_Many_Active = GetMapActivePlayer(map_copy)
	if How_Many_Active > 0 then
		DealAllActivePlayerInMap(map_copy,"GiveSpecItem")
	end
	How_Many_Active = 0
	Money_all = 1000000
	Every_5_minute = 0
end


function map_copy_close_glacierpk( map_copy )
	ClearAllSubMapCha(map_copy)
end


function GiveSpecItem( role )
	if How_Many_Active == 0 then
		return
	end
	
	local Money_glacierpk = Money_all/How_Many_Active
--	SystemNotice(role,How_Many_Active)

	if How_Many_Active > 5 then
		AddMoney ( role , 0 , Money_glacierpk )
	--	local message = "今天的乱斗共存活了"..How_Many_Active .. "位玩家,他们每人将获得"..Money_glacierpk .."的金钱"
	--	SystemNotice(role,How_Many_Active)
		return
	end

	if How_Many_Active <  6 and How_Many_Active > 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5866  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5866  , 1 , 4 )
		end
			 
		AddMoney ( role , 0 , Money_glacierpk )
		--SystemNotice(role,How_Many_Active)
					
		--local message = "今天的乱斗中共存活了"..How_Many_Active .."位玩家,他们每人将获得"..Money_glacierpk .."的金钱和1个乱斗之星徽章"
		--Notice ( message )
		return
	end
	
	if How_Many_Active == 1 then
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		if Item_CanGet <= 0 then
			GiveItemX ( role , 0 , 5867  , 1 , 4 )
		else
			GiveItem ( role , 0 , 5867  , 1 , 4 )
		end
		AddMoney ( role , 0 , Money_glacierpk )
		local cha_name = GetChaDefaultName ( role )
		local message = "Congratulations "..cha_name.." you have earned ".. Money_glacierpk .." gold and 1 King of the Ring Emblem"
	--	SystemNotice(role,How_Many_Active)
		SystemNotice(role,message)
		return
	end
end 
