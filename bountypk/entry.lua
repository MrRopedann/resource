function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "\192\240\229\237\224"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \237\224 \192\240\229\237\243  ")  --

end

function after_destroy_entry_bountypk(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("\207\238\240\242\224\235 \237\224 \192\240\229\237\243 \231\224\234\240\251\235\241\255") 

end

function after_player_login_bountypk(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --
    ChaNotice(player_name, "\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \237\224 \192\240\229\237\243  ")

end

function check_can_enter_bountypk( role, copy_mgr )
	local FightingBook_Num = 0
	FightingBook_Num = CheckBagItem( role,3849 )
	local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "\194 \238\242\240\255\228\229 \237\229\235\252\231\255" )
		return 0
		
	end

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=25 and Lv(Cha) <=9000 then
	
			return 1

	else
		SystemNotice(role, "Characters need to be between Lv 25 to 100 to enter Bounty Hunter Pk")
		return 0    
	end

	if FightingBook_Num <= 0 then
		SystemNotice ( role , "\205\243\230\237\224 \236\229\228\224\235\252 \238\242\226\224\227\232" )
		return 0
	end
end

function begin_enter_bountypk(role, copy_mgr) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = "<\192\240\229\237\224>"..cha_name.." \231\224\248\184\235"
	Notice ( message )
	SystemNotice(role,"\194\245\238\228 [\192\240\229\237\224]") 
	MoveCity(role, "Bounty Hunter PK")

end