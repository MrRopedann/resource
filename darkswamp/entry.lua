--´ËÎÄ¼þÖÐ£¬·²ÊÇ¿ÉÄÜ±»¶à´ÎÖ´ÐÐµÄº¯Êý£¬º¯ÊýÃû¶¼Òª¼ÓÉÏµØÍ¼ÃûÇ°×º£¬Èçafter_destroy_entry_testpk
--´ËÎÄ¼þÃ¿ÐÐ×î´ó×Ö·û¸öÊýÎª255£¬ÈôÓÐÒìÒé£¬ÇëÓë³ÌÐòÌ½ÌÖ

function config_entry(entry) 
    SetMapEntryEntiID(entry, 193,1) --ÉèÖÃµØÍ¼Èë¿ÚÊµÌåµÄ±àºÅ£¨¸Ã±àºÅ¶ÔÓ¦ÓÚcharacterinfo.txtµÄË÷Òý£©
end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --´´½¨¸±±¾¹ÜÀí¶ÔÏó£¬´Ëº¯ÊýÔÚÓÐÏÔÊ½Èë¿ÚµÄµØÍ¼ÖÐ±ØÐëµ÷ÓÃ£¬¶ÔÓÚÒþÊ½Èë¿ÚµÄµØÍ¼£¨Èç¶ÓÎéÌôÕ½£©ÎÞÒªµ÷ÓÃ¸Ã½Ó¿Ú

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --È¡µØÍ¼Èë¿ÚµÄÎ»ÖÃÐÅÏ¢£¨µØÍ¼Ãû£¬×ø±ê£¬Ä¿±êµØÍ¼Ãû£©
    Notice("Îáúÿâëåíèå: Ïî êîðäèíàòàì ["..posx..","..posy.."] Ïîÿâèëñÿ ïîðòàë â Ëîãîâî áàíäèòîâ.") --Í¨Öª±¾×é·þÎñÆ÷µÄËùÓÐÍæ¼Ò

    local EntryName = " Ëîãîâî áàíäèòîâ "
    SetMapEntryEventName( entry, EntryName )
end

function after_destroy_entry_darkswamp(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Îáúÿâëåíèå: Ïî êîðäèíàòàì ["..posx..","..posy.."] Çàêðûëñÿ ïîðòàë â Ëîãîâî áàíäèòîâ.") 

end

function after_player_login_darkswamp(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --È¡µØÍ¼Èë¿ÚµÄÎ»ÖÃÐÅÏ¢£¨µØÍ¼Ãû£¬×ø±ê£¬Ä¿±êµØÍ¼Ãû£©
    ChaNotice(player_name, "Îáúÿâëåíèå: Ïî êîðäèíàòàì ["..posx..","..posy.."] Ïîÿâèëñÿ ïîðòàë â Ëîãîâî áàíäèòîâ.") --Í¨Öª±¾×é·þÎñÆ÷µÄËùÓÐÍæ¼Ò

end


--ÓÃÓÚ¼ì²â½øÈëÌõ¼þ
--·µ»ØÖµ£º0£¬²»Âú×ã½øÈëÌõ¼þ¡£1£¬³É¹¦½øÈë¡£
function check_can_enter_darkswamp( role, copy_mgr )
    local Cha = TurnToCha(role)
  
	if Lv(Cha) >=45 and Lv(Cha) <=100 then
		
		return 1

	else
		SystemNotice(role, "Òîëüêî ïåðñîíàæè îò 45 äî 100 ìîãóò âîéòè â Ëîãîâî áàíäèòîâ!")
		return 0
	end
end


function begin_enter_darkswamp(role, copy_mgr) 

	SystemNotice(role,"Âû âîøëè â Ëîãîâî áàíäèòîâ! ") 
	MoveCity(role, "Dark Swamp")

end 