--ґЛОДјюЦРЈ¬·ІКЗїЙДЬ±»¶аґОЦґРРµДєЇКэЈ¬єЇКэГы¶јТЄјУЙПµШНјГыЗ°ЧєЈ¬Изafter_destroy_entry_testpk
--ґЛОДјюГїРРЧоґуЧЦ·ыёцКэОЄ255Ј¬ИфУРТмТйЈ¬ЗлУліМРтМЅМЦ

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --ЙиЦГµШНјИлїЪКµМеµД±аєЕЈЁёГ±аєЕ¶ФУ¦УЪcharacterinfo.txtµДЛчТэЈ©

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --ґґЅЁё±±ѕ№ЬАн¶ФПуЈ¬ґЛєЇКэФЪУРПФКЅИлїЪµДµШНјЦР±ШРлµчУГЈ¬¶ФУЪТюКЅИлїЪµДµШНјЈЁИз¶УОйМфХЅЈ©ОЮТЄµчУГёГЅУїЪ

    local EntryName = " Логово Эвентов "
    SetMapEntryEventName( entry, EntryName )

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --ИЎµШНјИлїЪµДО»ЦГРЕПўЈЁµШНјГыЈ¬Чш±кЈ¬Дї±кµШНјГыЈ©
    Notice("Объявление: В Аскароне ["..posx..","..posy.."] появился портал в [Логово Эвентов].")

end

function after_destroy_entry_leiting2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Объявление: По имеющейся информации, портал в [Логово Эвентов] исчез!") 

end

function after_player_login_leiting2(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --Объявления об открытии портала в Мираж Громограда.
    ChaNotice(player_name, "Объявление: В Аскароне ["..posx..","..posy.."] появился портал в [Логово Эвентов].")

end










--УГУЪјмІвЅшИлМхјю
--·µ»ШЦµЈє0Ј¬І»ВъЧгЅшИлМхјюЎЈ1Ј¬іЙ№¦ЅшИлЎЈ
function check_can_enter_kyjj_3( role, copy_mgr )
	if Lv(role) < 60 then
		SystemNotice(role, "Персонажи выше 60 лвл не допускаются в Логово Эвентов ")
		return 0    
	end
end

function begin_enter_kyjj_3(role, copy_mgr) 
    
		SystemNotice(role,"Вы вошли в Логово Эвентов! Будьте осторожны тут опасно! ") 
		MoveCity(role, "Cultivation of the land")

end