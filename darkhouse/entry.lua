function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) 

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) 

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice(":\194\237\232\236\224\237\232\229! \207\238\240\242\224\235 \226 \196\238\236 \242\252\236\251 \238\242\234\240\251\235\241\255 \226 \235\229\228\251\237\232, \239\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."]. ") 

end

function after_destroy_entry_garner2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("\207\238\240\242\224\235 \226 [  \196\238\236 \210\252\236\251 ] \231\224\234\240\251\235\241\255, \243\228\224\247\232!") 

end

function after_player_login_garner2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    ChaNotice(player_name, "\242\251 \226\238\248\229\235 \226 [ \196\238\236 \242\252\236\251 ].") 

end
