-- ????? ??????? ?????? ????????????? ????????? ?????, ????? ??? after_destroy_entry_guildwar(entry)
-- ?????????? ????? ???????? ? ?????? ?????????? 255

function config_entry(entry) 
    SetMapEntryEntiID(entry,2492,1) 

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) 

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) -- ????????? ?????????? ? ????? ????? (???????? ?????, ??????????, ???????? ??????? ?????)
    --Notice("\194\237\232\236\224\237\232\229: \194 \216\224\233\242\224\237\229 \239\238 \234\238\238\240\228\232\237\224\242\224\236 ["..posx..","..posy.."] \238\242\234\240\251\235\241\255 \239\238\240\242\224\235 \226 \209\226\255\249\229\237\237\243\254 \226\238\233\237\243 45-64! ") 
	--Notice("????????: ? ??????? ?? ??????????? ["..posx..","..posy.."] ???????? ?????? ? ????????? ????? 45-64! ") 

    local EntryName = "\209\226\255\249\229\237\251\229 \194\238\233\237\251 "
	--local EntryName = "?????? ? ??: [????] ?????? [???????] (??????? 65 ? ????) "
    SetMapEntryEventName( entry, EntryName )
    
end

function after_destroy_entry_guildwar(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
	Notice("\206\225\250\255\226\235\229\237\232\229: \207\238\240\242\224\235 \226 [\209\226\255\249\229\237\237\243\254 \194\238\233\237\243] \231\224\234\240\251\235\241\255!") 
    --Notice("??????????: ?????? ? [????????? ?????] ????????!") 

end

function after_player_login_guildwar(entry, player_name)

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) -- ????????? ?????????? ? ????? ????? (???????? ?????, ??????????, ???????? ??????? ?????)
    ChaNotice(player_name, "\207\232\240\224\242\241\234\238\229 \206\225\250\255\226\235\229\237\232\229: \194 \204\224\227\232\247\229\241\234\238\236 \206\234\229\224\237\229 ["..posx..","..posy.."] \225\251\235 \238\225\237\224\240\230\229\237 \239\238\240\242\224\235 \226 [\209\226\255\249\229\237\237\243\254 \194\238\233\237\243] (\211\240\238\226\229\237\252 65 \232 \225\238\235\252\248\229)!")
	--ChaNotice(player_name, "????????? ??????????: ? ?????????? ?????? ["..posx..","..posy.."] ??? ???????? ?????? ? [????????? ?????] (??????? 65 ? ??????)!")

end




function check_can_enter_guildwar( role, copy_mgr )

local FightingBook_Num = 0
      FightingBook_Num = CheckBagItem( role,3849 )

if FightingBook_Num <= 0 then
		SystemNotice(role,"\210\251 \237\229 \236\238\230\229\248\252 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243, \239\238\242\238\236\243 \247\242\238 \243 \242\229\225\255 \237\229\242\243 \204\229\228\224\235\232 \206\242\226\224\227\232. \207\238\230\224\235\243\233\241\242\224 \239\238\235\243\247\232 \229\229 \243 \192\228\236\232\237\232\241\242\240\224\242\238\240\224 \192\240\229\237\251 \226 \192\240\227\229\237\242\229.")
		--SystemNotice(role,"?? ?? ?????? ????? ? ????????? ?????, ?????? ??? ? ???? ???? ?????? ??????. ?????????? ?????? ?? ? ?????????????? ????? ? ???????.")
		return 0
	elseif FightingBook_Num > 1 then
		return 0
	end


local Team_In = IsInTeam(role)
	if Team_In == 1 then
		SystemNotice ( role , "\210\251 \237\224\245\238\228\232\248\252\241\255 \226 \238\242\240\255\228\229, \239\238\253\242\238\236\243 \237\229 \236\238\230\229\248\252 \231\224\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243 " )
		--SystemNotice ( role , "?? ?????????? ? ??????, ??????? ?? ?????? ????? ? ????????? ????? " )
		return 0
		
	end

 if  GetChaGuildID(role) == 0 then
	 SystemNotice(role,"\207\240\238\241\242\232, \237\238 \247\242\238\225\251 \239\238\239\224\241\242\252 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243 \242\229\225\229 \237\243\230\237\238 \225\251\242\252 \235\232\225\238 \226\238 \212\235\238\242\241\234\238\233, \235\232\225\238 \226 \207\232\240\224\242\241\234\238\233 \227\232\235\252\228\232\232!")	
	 --SystemNotice(role,"??????, ?? ????? ??????? ? ????????? ????? ???? ????? ???? ???? ?? ????????, ???? ? ????????? ???????!")
     return 0
		
	
elseif Lv(role) < 65  then

	SystemNotice(role, "\194 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243 \236\238\227\243\242 \226\238\233\242\232 \242\238\235\252\234\238 \239\229\240\241\238\237\224\230\232 \243\240\238\226\237\255 65 \232 \226\251\248\229.")
	--SystemNotice(role, "? ????????? ????? ????? ????? ?????? ????????? ?????? 65 ? ????.")
	     return 0    
	end


        local Num_1= CheckBagItem(role,4661)
	if Num_1 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \196\229\240\229\226\238 \228\235\255 \240\229\236\238\237\242\224, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ?????? ??? ???????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_2= CheckBagItem(role,4546)
	if Num_2 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \202\240\232\241\242\224\235\252\237\243\254 \208\243\228\243, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")	
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ??????????? ????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_3= CheckBagItem(role,1684)
	if Num_3 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \210\226\229\240\228\251\233 \247\229\240\229\239\224\248\232\233 \239\224\237\246\232\240\252, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ??????? ????????? ???????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_4= CheckBagItem(role,1683)
	if Num_4 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \212\240\224\227\236\229\237\242 \247\229\240\229\239\224\248\252\229\227\238 \239\224\237\246\232\240\255, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")	
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ???????? ??????????? ???????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_5= CheckBagItem(role,4012)
	if Num_5 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \203\243\237\238\245\226\238\241\242\251\233 \243\227\238\240\252, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")	
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ??????????? ?????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_6= CheckBagItem(role,4013)
	if Num_6 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \205\251\240\255\254\249\232\233 \236\238\235\235\254\241\234, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ???????? ???????, ????? ????? ? ????????? ?????.")	
		return 0
	end

        local Num_7= CheckBagItem(role,2964)
	if Num_7 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \199\237\224\234 \212\235\238\242\224, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ???? ?????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_8= CheckBagItem(role,3001)
	if Num_8 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \207\232\240\224\242\241\234\232\233 \199\237\224\234, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")	
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ????????? ????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_9= CheckBagItem(role,4011)
	if Num_9 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \208\229\224\234\242\232\226\237\224\255 \240\251\225\224, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")	
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ?????????? ????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_10= CheckBagItem(role,1720)
	if Num_10 >= 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \243\225\229\240\232 \232\231 \241\226\238\229\227\238 \240\254\234\231\224\234\224 \208\251\225\224 \234\238\241\242\252, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243.")
		--SystemNotice(role, "??????????, ????? ?? ?????? ??????? ???? ?????, ????? ????? ? ????????? ?????.")	
		return 0
	end

	local Num_11= CheckBagItem(role,2382)
	if Num_11 < 1 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \247\242\238\225\251 \226\238\233\242\232 \226 \209\226\255\249\229\237\237\243\254 \194\238\233\237\243 \237\243\230\229\237 \199\237\224\234 \198\232\231\237\232 \232 \209\236\229\240\242\232, \229\227\238 \226\251 \236\238\230\229\242\229 \238\225\236\229\237\255\242\252 \243 \205\207\209, \241\242\238\255\249\229\233 \240\255\228\238\236 \241\238 \236\237\238\233.")	
		--SystemNotice(role, "??????????, ????? ????? ? ????????? ????? ????? ???? ????? ? ??????, ??? ?? ?????? ???????? ? ???, ??????? ????? ?? ????.")	
		return 0
	end

end

function begin_enter_guildwar(role, copy_mgr) 

     local Cha = TurnToCha(role)
     if  GetChaGuildID(Cha) <= 100 and GetChaGuildID(Cha) > 0 then
	     if count_haijun < 45 then
	        
	        SystemNotice(role,"\194\245\238\228 \226 [\209\226\255\249\229\237\237\243\254 \194\238\233\237\243] ")
			--SystemNotice(role,"???? ? [????????? ?????] ")
		MoveCity(role, "guildwarnavyside")
                count_haijun = count_haijun + 1
	      else 
	        SystemNotice(role,"\202\238\236\224\237\228\224 \212\235\238\242\224 \231\224\239\238\235\237\229\237\224.")
			--SystemNotice(role,"??????? ????? ?????????.")
	      end
	
     end	        
		
     if GetChaGuildID(Cha) > 100 and GetChaGuildID(Cha) <= 200 then
             if count_haidao < 45 then
	        SystemNotice(role,"\194\245\238\228 \226 [\209\226\255\249\229\237\237\243\254 \194\238\233\237\243] ")
			--SystemNotice(role,"???? ? [????????? ?????] ")
		MoveCity(role, "guildwarpirateside")
		count_haidao=count_haidao + 1
	     else
	        SystemNotice(role,"\202\238\236\224\237\228\224 \207\232\240\224\242\238\226 \231\224\239\238\235\237\229\237\224.")
			--SystemNotice(role,"??????? ??????? ?????????.")
	     end

     end 
end