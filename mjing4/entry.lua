--scripted by skyfear919@hotmail.com

function config_entry(entry)
   SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry)
    local copy_mgr = GetMapEntryCopyObj(entry, 0)

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Portal to Dark Area at [315,194], what are you waiting for?")

end

function after_destroy_entry_mjing4(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Portal to Dark Area destroyed, please try again later!")

end

function after_player_login_mjing4(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "Portal At [315,194] Be Careful")

end