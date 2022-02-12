function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "\204\232\240\238\226\238\233 \193\238\241\241"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \234 \204\232\240\238\226\238\236\243 \193\238\241\241\243") 

end

function after_destroy_entry_ruins(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("\207\238\240\242\224\235 \234 \204\232\240\238\226\238\236\243 \193\238\241\241\243 \231\224\234\240\251\235\241\255 ") 

end

function after_player_login_ruins(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "\207\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \239\238\240\242\224\235 \234 \204\232\240\238\226\238\236\243 \193\238\241\241\243")

end

function begin_enter_ruins(role,copy_mgr) 
	SystemNotice(role,"\194\251 \226\238\248\235\232 \226 \235\238\234\224\246\232\254 \204\232\240\238\226\238\233 \193\238\241\241") 
	MoveCity(role,"Ruins of Despero")
end