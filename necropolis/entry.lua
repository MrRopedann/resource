
function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1)

end 

function after_create_entry(entry) 

end

function after_destroy_entry_necropolis(entry)


end

function after_player_login_necropolis(entry, player_name)

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --ChaNotice(player_name, "Добро пожаловать пират!")

end


function check_can_enter_necropolis( role, copy_mgr )

end

function check_HasMoney(role)

end


function begin_enter_necropolis(role, copy_mgr) 

end

