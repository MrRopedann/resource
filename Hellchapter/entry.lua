function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)

    local EntryName = "\192\228"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ScrollNotice("Hell Chapter has started! Argent - ["..posx..","..posy.."]", 1)

end

function after_destroy_entry_runff(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ScrollNotice(" Hell Chapter is now closed", 1)

end
function after_player_login_Hellchapter(entry, player_name)

end

--Entry conditions for the detection
--Return value: 0, does not meet entry conditions. 1, successfully entered.

function check_can_enter_Hellchapter( role, copy_mgr )

	local FightingBook_Num = 0
	FightingBook_Num = CheckBagItem( role,3849 )
	local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "Be happy, system lets you enter Hell Chapter in a Party." )
		return 0
		
	end
	if FightingBook_Num <= 0 then
		SystemNotice ( role , "You do not have a medal of Valor." )
		return 0
	elseif FightingBook_Num > 1 then
		LG("RYZ_PK","Possess more than 1 Medal of Valor")
		return 0
	end

	if Lv(role) < 20 then
	SystemNotice(role, "To enter Hell Chapter, players need to be above level 20")
		return 0    
	end
	local Has_money = check_HasMoney(role)
	if Has_money == 1 then
		
		return 1
		
	else
		SystemNotice(role,"You do not have sufficient gold to enter Hell Chapter")
		return 0
	end
			
end

function begin_enter_Hellchapter(role, copy_mgr) 

		SystemNotice(role,"Entering [Hell Chapter]") 
		MoveCity(role, "Hell Chapter")

end