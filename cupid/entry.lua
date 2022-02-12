function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1)

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0)
    local EntryName = "\202\240\224\233 \196\240\224\234\238\237\238\226"
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Pirate Radio: On Argent City appears portal to [Ruins of Despero] at ["..posx..","..posy.."], let's check what's happening there.") 

end

function begin_enter_starwalkway(role,copy_mgr) 
	SystemNotice(role,"Entering [Astral Island]") 
	MoveCity(role,"cupid")
end