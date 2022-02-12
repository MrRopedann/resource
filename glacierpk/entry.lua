function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "\209\229\226\229\240"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Announcement: According to reports, near Lower Icicle Castle at ["..posx..","..posy.."] appears a portal to Glacier Armageddon. Please check it out.")

end

function after_destroy_entry_glacierpk(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: According to reports, portal to [Glacier Armageddon] has vanished. Check announcement for more details. Enjoy!") 

end

function after_player_login_glacierpk(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "Announcement: According to reports, Lower Icicle Castle at ["..posx..","..posy.."] appears a portal to Glacier Armageddon. Please check it out.")

end






function check_can_enter_glacierpk( role, copy_mgr )
	local FightingBook_Num = 0
	FightingBook_Num = CheckBagItem( role,3849 )
	local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "You cannot enter Glacier Armageddon in a Party." )
		return 0
		
	end
	if FightingBook_Num <= 0 then
		SystemNotice ( role , "You must have a Medal of Valor to enter Glacier Armageddon" )
		return 0
	elseif FightingBook_Num > 1 then
		LG("RYZ_PK","超过一个勇者之证")
		return 0
	end

    local Cha = TurnToCha(role)
  
	if Lv(Cha) >=2 and Lv(Cha) <=300 then
		
		return 1

	else
		SystemNotice(role, "To enter Glacier Armageddon, players must be between Lv 65 to 90")
		return 0
	end
	--if HonorPoint >30000 then
		--SystemNotice ( role , "You cannot enter Chaos Icicle you have to much Honor" )
		--return 0
	--end

	--local Credit_bountypk= GetCredit(role)
	 --if Credit_bountypk < 30 then 
		--SystemNotice ( role , "You do not have enough Reputation Points" )
		--return 0
	--else
		--DelCredit(role,30)
	--end

	--if Lv(role) < 20 then
		--SystemNotice ( role , "You do not have enough Reputation Points" )
		--return 0    
	--end
	--local Has_money = check_HasMoney(role)
	--if Has_money == 1 then
		
		--return 1
		
	--else
		--SystemNotice(role,"You do not have enough Gold to enter Chaos Icicle")
		--return 0
	--end
				
end

function begin_enter_glacierpk(role, copy_mgr) 

		SystemNotice(role,"Entering [Glacier Armageddon]") 
		MoveCity(role, "Glacier Armageddon")

end