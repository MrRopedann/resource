
function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1)

end 

function after_create_entry(entry) 
    --local copy_mgr = GetMapEntryCopyObj(entry, 0)
    --local EntryName = "Остров Ресурсов "
    --SetMapEntryEventName( entry, EntryName )

    --map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    --Notice("Внимание,по координатам ["..posx..","..posy.."] открылся портал ведущий на Остров Ресурсов.")

end

function after_destroy_entry_prison(entry)


end

function after_player_login_prison(entry, player_name)

end


function check_can_enter_prison( role, copy_mgr )

	--if Lv(role) > 55 then
	--SystemNotice(role, "Ваш уровень больше 55!")
	--	return 0    
	--end	
end

function check_HasMoney(role)
	--local lv= GetChaAttr(role, ATTR_LV)
	--local Money_Need = lv*50
	--local Money_Have = GetChaAttr ( role , ATTR_GD )
	--	if Money_Have >= Money_Need then
	--		return 1
	--	end

end


function begin_enter_prison(role, copy_mgr) 
	--SystemNotice(role,"Вы попали на Остров Ресурсов") 
	--GoTo(role,75,78,"prison")
end

