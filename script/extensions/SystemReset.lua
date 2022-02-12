print("* Loading Reset" )

--Второй ресет
function Reset_Graf_3 ( role )
	local check=Get_Reset_3 ( role )
	--Проверяем, есть ли золото, 1000 уровень и сняты ли вещи
	if check==0 then
		SystemNotice( role, "\205\229 \226\251\239\238\235\237\229\237\251 \240\229\234\238\236\229\237\228\224\246\232\232 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \240\229\241\229\242\224! " )
		return
	end
	--Идем дальше
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 1000000000
	local final_gd = cha_gd - need_gd
	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	--Обнуляем очки скиллов
	SetChaAttr(role, ATTR_TP ,0 ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=ap+cha_str+cha_dex+cha_agi+cha_con+cha_sta-25
	SetChaAttr(role, ATTR_BSTR ,200 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,200 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,200 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,200 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,200 ) 
	SyncChar(role,4)
	--Ставим опыт = 1
	SetChaAttr(role, ATTR_CEXP,1 )
	SyncChar(role,4)
	SetChaAttr(role, ATTR_LV,1 )
	SyncChar(role,4)
	SetChaAttr(role,ATTR_GD,final_gd )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )
	RefreshCha ( role )

	--GMNotice("Поздравляем! "..cha_name.." успешно прошел ресет!")
	GMNotice("\207\238\231\228\240\224\226\235\255\229\236! "..cha_name.." \243\241\239\229\248\237\238 \239\240\238\248\229\235 2 \240\229\241\229\242!_Congratulation! Player "..cha_name" take 2 reset!")
	local cha_job = GetChaAttr( role , ATTR_JOB )
		--Выдаем сундук новичка
		GiveItem ( role , 0 , 436 , 1 , 4 ) 
		
	return 1
end

function Get_Reset_3 ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 100000000
	local final_gd = cha_gd - need_gd
	local item_empty=IsEquip(role)
	--Проверка на золото
	if cha_gd < need_gd then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \232\236\229\242\252 - "..need_gd.." \231\238\235\238\242\224 \228\235\255 \240\229\241\229\242\224. ")
		--HelpInfo( role, 0 ,"Ты должен иметь - "..need_gd.." золота для ресета. ")
		return 0
	end
	--Проверка на уровень
	if cha_lv < 4999 then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \225\251\242\252 \226\251\248\229 1399 \243\240\238\226\237\255. ")
		--HelpInfo( role, 0 ,"Ты должен быть выше 1399 уровня. ")
		return 0
	end
	--Проверка на одетые вещи
	if item_empty==LUA_TRUE then
		HelpInfo(role, 0, "\209\237\232\236\232\242\229 \226\241\254 \253\234\232\239\232\240\238\226\234\243 \241 \239\229\240\241\238\237\224\230\224. ")
		--HelpInfo(role, 0, "Снимите всю экипировку с персонажа. ")
		return 0	
	end
	--Проверка на ресет
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 2 then
		HelpInfo(role, 0 ,"\194\251 \243\230\229 \239\240\238\248\235\232 3 \240\229\241\229\242!")
		--SystemNotice(role ,"Вы уже прошли 3 ресет!")
		return 0
	end
	--Проверка на вещь
	local item_1 = TakeItem( role, 0,7834, 100 ) 
	local item_2 = TakeItem( role, 0,7835, 100 )
	local item_3 = TakeItem( role, 0,7836, 100 ) 
	local item_4 = TakeItem( role, 0,7837, 3 )  
	if item_1 == 0 and item_2 == 0 and item_3 == 0 and item_1 == 0 then
		HelpInfo( role, 0 ,"\194\251 \239\240\232\237\229\241\235\232 \236\237\229 \237\229 \226\229\241\252 \235\243\242!")
		
		return 0
	end
	RefreshCha ( role )
end


--Второй ресет
function Reset_Graf_2 ( role )
	local check=Get_Reset_2 ( role )
	--Проверяем, есть ли золото, 1000 уровень и сняты ли вещи
	if check==0 then
		SystemNotice( role, "\205\229 \226\251\239\238\235\237\229\237\251 \240\229\234\238\236\229\237\228\224\246\232\232 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \240\229\241\229\242\224! " )
		return
	end
	--Идем дальше
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 1000000000
	local final_gd = cha_gd - need_gd
	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	--Обнуляем очки скиллов
	SetChaAttr(role, ATTR_TP ,0 ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=5
	SetChaAttr(role, ATTR_BSTR ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,10 ) 
	SyncChar(role,4)
	--Ставим опыт = 1
	SetChaAttr(role, ATTR_CEXP,1 )
	SyncChar(role,4)
	SetChaAttr(role, ATTR_LV,1 )
	SyncChar(role,4)
	SetChaAttr(role,ATTR_GD,final_gd )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )
	RefreshCha ( role )

	--GMNotice("Поздравляем! "..cha_name.." успешно прошел ресет!")
	GMNotice("\207\238\231\228\240\224\226\235\255\229\236! "..cha_name.." \243\241\239\229\248\237\238 \239\240\238\248\229\235 2 \240\229\241\229\242!_Congratulation! Player "..cha_name" take 2 reset!")
	local cha_job = GetChaAttr( role , ATTR_JOB )
		--Выдаем сундук новичка
		GiveItem ( role , 0 , 436 , 1 , 4 ) 
		
	return 1
end

function Get_Reset_2 ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 100000000
	local final_gd = cha_gd - need_gd
	local item_empty=IsEquip(role)
	--Проверка на золото
	if cha_gd < need_gd then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \232\236\229\242\252 - "..need_gd.." \231\238\235\238\242\224 \228\235\255 \240\229\241\229\242\224. ")
		--HelpInfo( role, 0 ,"Ты должен иметь - "..need_gd.." золота для ресета. ")
		return 0
	end
	--Проверка на уровень
	if cha_lv < 4999 then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \225\251\242\252 \226\251\248\229 1199 \243\240\238\226\237\255. ")
		--HelpInfo( role, 0 ,"Ты должен быть выше 1199 уровня. ")
		return 0
	end
	--Проверка на одетые вещи
	if item_empty==LUA_TRUE then
		HelpInfo(role, 0, "\209\237\232\236\232\242\229 \226\241\254 \253\234\232\239\232\240\238\226\234\243 \241 \239\229\240\241\238\237\224\230\224. ")
		--HelpInfo(role, 0, "Снимите всю экипировку с персонажа. ")
		return 0	
	end
	--Проверка на ресет
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 1 then
		HelpInfo(role, 0 ,"\194\251 \243\230\229 \239\240\238\248\235\232 2 \240\229\241\229\242!")
		--SystemNotice(role ,"Вы уже прошли 2 ресет!")
		return 0
	end
	--Проверка на вещь
	local item_1 = TakeItem( role, 0,7834, 50 ) 
	local item_2 = TakeItem( role, 0,7835, 50 )
	local item_3 = TakeItem( role, 0,7836, 50 ) 
	local item_4 = TakeItem( role, 0,7837, 2 )  
	if item_1 == 0 and item_2 == 0 and item_3 == 0 and item_1 == 0 then
		HelpInfo( role, 0 ,"\194\251 \239\240\232\237\229\241\235\232 \236\237\229 \237\229 \226\229\241\252 \235\243\242!")
		
		return 0
	end
	RefreshCha ( role )
end

--Первый ресет
function Reset_Graf ( role )
	local check=Get_Reset ( role )
	--Проверяем, есть ли золото, 1000 уровень и сняты ли вещи
	if check==0 then
		SystemNotice( role, "\205\229 \226\251\239\238\235\237\229\237\251 \240\229\234\238\236\229\237\228\224\246\232\232 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \240\229\241\229\242\224! " )
		return
	end
	--Идем дальше
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 1000000000
	local final_gd = cha_gd - need_gd
	local cha_name = GetChaDefaultName ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_job = GetChaAttr(role, ATTR_JOB)
	--Обнуляем очки скиллов
	SetChaAttr(role, ATTR_TP ,0 ) 

	local ap = GetChaAttr( role , ATTR_AP )

	local cha_str = GetChaAttr(role, ATTR_BSTR  ) 
	local cha_dex = GetChaAttr(role, ATTR_BDEX  ) 
	local cha_agi = GetChaAttr(role, ATTR_BAGI  ) 
	local cha_con = GetChaAttr(role, ATTR_BCON ) 
	local cha_sta = GetChaAttr(role, ATTR_BSTA )
	ap=5
	SetChaAttr(role, ATTR_BSTR ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BDEX ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BAGI ,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BCON,10 ) 
	SyncChar(role,4)
	SetChaAttr(role, ATTR_BSTA,10 ) 
	SyncChar(role,4)
	--Ставим опыт = 1
	SetChaAttr(role, ATTR_CEXP,1 )
	SyncChar(role,4)
	SetChaAttr(role, ATTR_LV,1 )
	SyncChar(role,4)
	SetChaAttr(role,ATTR_GD,final_gd )
	SyncChar(role,4)
	AddSailExp(role, npc , 1 , 1 )
	RefreshCha ( role )

	--GMNotice("Поздравляем! "..cha_name.." успешно прошел ресет!")
	GMNotice("\207\238\231\228\240\224\226\235\255\229\236! "..cha_name.." \243\241\239\229\248\237\238 \239\240\238\248\229\235 \240\229\241\229\242!_Congratulation! Player "..cha_name" take reset!")
	local cha_job = GetChaAttr( role , ATTR_JOB )
		--Выдаем звезду
		GiveItem ( role , 0 , 7833 , 1 , 4 ) 
		GiveItem ( role , 0 , 436 , 1 , 4 ) 
		
	return 1
end

function Get_Reset ( role )
	local cha_lv = GetChaAttr(role, ATTR_LV) 
	local cha_gd = GetChaAttr(role, ATTR_GD)
	local need_gd = 100000000
	local final_gd = cha_gd - need_gd
	local item_empty=IsEquip(role)
	--Проверка на золото
	if cha_gd < need_gd then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \232\236\229\242\252 - "..need_gd.." \231\238\235\238\242\224 \228\235\255 \240\229\241\229\242\224. ")
		--HelpInfo( role, 0 ,"Ты должен иметь - "..need_gd.." золота для ресета. ")
		return 0
	end
	--Проверка на уровень
	if cha_lv < 4999 then
		HelpInfo( role, 0 ,"\210\251 \228\238\235\230\229\237 \225\251\242\252 \226\251\248\229 999 \243\240\238\226\237\255. ")
		--HelpInfo( role, 0 ,"Ты должен быть выше 999 уровня. ")
		return 0
	end
	--Проверка на одетые вещи
	if item_empty==LUA_TRUE then
		HelpInfo(role, 0, "\209\237\232\236\232\242\229 \226\241\254 \253\234\232\239\232\240\238\226\234\243 \241 \239\229\240\241\238\237\224\230\224. ")
		--HelpInfo(role, 0, "Снимите всю экипировку с персонажа. ")
		return 0	
	end
	--Проверка на ресет
	local Zs_Exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if Zs_Exp > 0 then
		HelpInfo(role, 0 ,"\194\251 \243\230\229 \239\240\238\248\235\232 \239\229\240\226\251\233 \240\229\241\229\242!")
		--SystemNotice(role ,"Вы уже прошли первый ресет!")
		return 0
	end
	--Проверка на вещь
	local item_1 = TakeItem( role, 0,7834, 25 ) 
	local item_2 = TakeItem( role, 0,7835, 25 )
	local item_3 = TakeItem( role, 0,7836, 25 ) 
	local item_4 = TakeItem( role, 0,7837, 1 )  
	if item_1 == 0 and item_2 == 0 and item_3 == 0 and item_1 == 0 then
		HelpInfo( role, 0 ,"\194\251 \239\240\232\237\229\241\235\232 \236\237\229 \237\229 \226\229\241\252 \235\243\242!")
		
		return 0
	end
	RefreshCha ( role )
end

--Проверка для НПС
--Любой ресет
function NPCcheck_Reset( role, lvReset )
	local checkRb = GetChaAttr ( role , ATTR_CSAILEXP )
	if checkRb == lvReset then
		return 1
	else
		return 0
	end
end
	

--Бонусы для медали
function State_Reset_Add(role, StateLv)
    --Берем статы
	--Скорость бега
	local move_speed = GetChaAttr ( role , ATTR_STATEV_MSPD )
	--Скорость атаки
	local attack_speed = GetChaAttr ( role , ATTR_STATEV_ASPD )
	--ПР
	local def = GetChaAttr ( role , ATTR_STATEV_PDEF )
	--Минимальная атака
	local mn_atk = GetChaAttr ( role , ATTR_STATEV_MNATK )
	--Максимальная атака
	local mx_atk = GetChaAttr ( role , ATTR_STATEV_MXATK )
	--Защита
	local phis_def = GetChaAttr ( role , ATTR_STATEV_DEF )
	--Берем опыт ресета
	local reset_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if reset_exp == 1 then
		local res1_move = move_speed / 20 * StateLv
		local res1_aspid = attack_speed / 20 * StateLv
		local res1_def = def / 20 * StateLv
		local res1_mn = mn_atk / 20 * StateLv
		local res1_mx = mx_atk / 20 * StateLv
		local res1_pr = phis_def / 20 * StateLv
			local new_one = move_speed + res1_move
			local new_two = attack_speed + res1_aspid
			local new_three = def + res1_def
			local new_four = mn_atk + res1_mn
			local new_five = mx_atk + res1_mx
			local new_six = phis_def + res1_pr
			
		SetCharaAttr( new_one , role , ATTR_STATEV_MSPD )
		SetCharaAttr( new_two , role , ATTR_STATEV_ASPD )
		SetCharaAttr( new_three , role , ATTR_STATEV_PDEF )
		SetCharaAttr( new_four , role , ATTR_STATEV_MNATK )
		SetCharaAttr( new_five , role , ATTR_STATEV_MXATK )
		SetCharaAttr( new_six , role , ATTR_STATEV_DEF )
	end     
            RefreshCha(role)         
end
   
function State_Reset_Rem(role, StateLv)
    SetCharaAttr(0 , role , ATTR_STATEV_MSPD)
    SetCharaAttr(0 , role , ATTR_STATEV_ASPD)
    SetCharaAttr(0 , role , ATTR_STATEV_PDEF)
    SetCharaAttr(0 , role , ATTR_STATEV_MNATK)
    SetCharaAttr(0 , role , ATTR_STATEV_MXATK)
    SetCharaAttr(0 , role , ATTR_STATEV_DEF)
    RefreshCha(role)     
end
	