-- ---------------------------
-- Loading Entry.lua
-- ---------------------------
function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1)
end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    SetMapEntryEventName(entry, SlayerRumble.Portal.EntryName)   
	map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
	Notice("[\216\224\233\242\224\237] \239\238 \234\238\238\240\228\232\237\224\242\224\236 ("..posx..","..posy..") \239\238\255\226\232\235\241\255 \239\238\240\242\224\235 \237\224 \206\241\242\240\238\226 \193\238\227\224\242\241\242\226\224 ")
	SlayerRumble:Init()
end

function after_destroy_entry_SlayerRumble(entry)
end

function after_player_login_SlayerRumble(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "[\216\224\233\242\224\237] \239\238 \234\238\238\240\228\232\237\224\242\224\236 ("..posx..","..posy..") \239\238\255\226\232\235\241\255 \239\238\240\242\224\235 \237\224 \206\241\242\240\238\226 \193\238\227\224\242\241\242\226\224 ")
end

function check_can_enter_SlayerRumble( role, copy_mgr )	
	if(IsInTeam(role) == 1)then
		SystemNotice (role, "\194\251\233\228\232\242\229 \232\231 \238\242\240\255\228\224, \247\242\238 \225\251 \226\238\233\242\232 ")
		return 0	
	end
	local CharacterName = GetChaDefaultName ( role )
	if(SlayerRumble.Players[CharacterName] ~= nil)then
		if(SlayerRumble.Players[CharacterName].Lives <= 0)then
			SystemNotice (role, "\211 \226\224\241 \237\229 \238\241\242\224\235\238\241\252 \238\247\234\238\226 \228\235\255 \226\245\238\228\224.\198\228\232\242\229 \241\235\229\228\243\254\249\229\227\238 \238\242\234\240\251\242\232\255! ")
			return 0
		end
	end
end

function begin_enter_SlayerRumble(role, copy_mgr)
	MoveCity(role, "Slayer Rumble")
end