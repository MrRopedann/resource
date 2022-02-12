--ґЛОДјюЦРЈ¬·ІКЗїЙДЬ±»¶аґОЦґРРµДєЇКэЈ¬єЇКэГы¶јТЄјУЙПµШНјГыЗ°ЧєЈ¬Изafter_destroy_entry_testpk
--ґЛОДјюГїРРЧоґуЧЦ·ыёцКэОЄ255Ј¬ИфУРТмТйЈ¬ЗлУліМРтМЅМЦ

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --ЙиЦГµШНјИлїЪКµМеµД±аєЕЈЁёГ±аєЕ¶ФУ¦УЪcharacterinfo.txtµДЛчТэЈ©

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --ґґЅЁё±±ѕ№ЬАн¶ФПуЈ¬ґЛєЇКэФЪУРПФКЅИлїЪµДµШНјЦР±ШРлµчУГЈ¬¶ФУЪТюКЅИлїЪµДµШНјЈЁИз¶УОйМфХЅЈ©ОЮТЄµчУГёГЅУїЪ

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ИЎµШНјИлїЪµДО»ЦГРЕПўЈЁµШНјГыЈ¬Чш±кЈ¬Дї±кµШНјГыЈ©
    Notice("Объявление: По кординатам ["..posx..","..posy.."] Появился портал в Затерянный Город.") --НЁЦЄ±ѕЧй·юОсЖчµДЛщУРНжјТ

    local EntryName = " Затерянный Город "
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_abandonedcity(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Объявление: По кординатам ["..posx..","..posy.."] Закрылся портал в Затерянный Город.") 

end

function after_player_login_abandonedcity(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ИЎµШНјИлїЪµДО»ЦГРЕПўЈЁµШНјГыЈ¬Чш±кЈ¬Дї±кµШНјГыЈ©
    ChaNotice(player_name, "Объявление: По кординатам ["..posx..","..posy.."] Появился портал в Затерянный Город.") --НЁЦЄ±ѕЧй·юОсЖчµДЛщУРНжјТ

end

--УГУЪјмІвЅшИлМхјю
--·µ»ШЦµЈє0Ј¬І»ВъЧгЅшИлМхјюЎЈ1Ј¬іЙ№¦ЅшИлЎЈ
function check_can_enter_abandonedcity(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=30 and Lv(Cha) <=45 then
	
		local Num
		Num = CheckBagItem(Cha, 1812)
        	
		if Num >= 1 then
			return 1
	
		else
			SystemNotice(role, "У вас нету Генератора Древних!")
			return 0
		end
		
	else
		SystemNotice(role, "Только персонажи от 30 до 45 лвл могут войти в Затерянный Город!")
		return 0    
	end
end



function begin_enter_abandonedcity(role, copy_mgr) 

		SystemNotice(role,"Вы вошли в Затерянный Город ") 
		MoveCity(role, "Forsaken City")

end