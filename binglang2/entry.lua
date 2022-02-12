function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --Оставляем.

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --Не меняем.

	local EntryName = " Мираж Ледыни с 70 LvL "
    SetMapEntryEventName( entry, EntryName )
	
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    Notice("Объявление: В Великом Синем Океане ["..posx..","..posy.."] открылся портал в [Мираж Ледыни].")

end

function after_destroy_entry_binglang2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Объявление: Портал в Мираж Ледыни заркылся!") 

end

function after_player_login_binglang2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry)
    ChaNotice(player_name, "Объявление: В Великом Синем Океане ["..posx..","..posy.."] открылся портал в [Мираж Ледыни].")

end





--Мираж Ледыни (Системные Нотайсы)
--DS team
function check_can_enter_binglang2( role, copy_mgr )
	local i = IsChaStall(role)
	if i == LUA_TRUE then
		SystemNotice(role, "Ты не можешь войти в Мираж Ледыни ")
		return 0    
	end
	if Lv(role) < 70 then
		SystemNotice(role, "Персонажи ниже 70 лвл не могут зайти в Мираж Ледыни ")
		return 0    
	end
	if Lv(role) > 100 then
		SystemNotice(role, "Персонажи 90 лвл и выше не могут зайти в Мираж Ледыни ")
		return 0    
	end
	
	local Num
	Num = CheckBagItem(role,2326)
	if Num < 1 then
		SystemNotice(role, "У тебя нету Маски Реальности ")	
		return 0
	end

	local Credit_Binglang2 = GetCredit(role)
	if Credit_Binglang2 < 10 then
		SystemNotice(role, "Ты имеешь не достаточно репутации, чтобы войти в Мираж Ледыни ")
		return 0
	else
		DelCredit(role,10)
		return 1
	end
end


function begin_enter_binglang2(role, copy_mgr)

	local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 2326, 1)
	
	if Dbag == 1 then
		SystemNotice(role,"Вы вошли в Мираж Ледыни ") 
		MoveCity(role, "Icicle Mirage")

	else
	
		SystemNotice(role, "Ты не можешь войти в Мираж Ледыни")
	end
end