--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- 2022		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading Functions.lua" )

MFRADIX=100 
CRTRADIX=100 
ATKER=0 
DEFER=1 
count_haidao = 0
count_haijun = 0
five_seconds = 0
second_five_seconds = 0
time_can_setmonster = 0
time_can_setnvsheng = 0
check_need_show = 0 
create_boss_hj = 0
create_boss_hd = 0
count_haijun2 = 0
count_haidao2 = 0
five_seconds2 = 0
second_five_seconds2 = 0
time_can_setmonster2 = 0
time_can_setnvsheng2 = 0
check_need_show2 = 0
create_boss_hj2 = 0
create_boss_hd2 = 0

--Для вызова профессий через камень
function FakeNPC(role, page) 

  local ret, npc = GetEudemon()
  local ret, id = GetScriptID(npc)
  local name = GetCharName(npc)
  
  if (NpcInfoList[id].page.start == MultiTrigger) then
    MultiTrigger( role, npc, NpcInfoList[id].page, NpcInfoList[id].page.p1, NpcInfoList[id].page.p2 )
  else
    JumpPage(role, npc, NpcInfoList[id].page, page)
  end
end

-- Отрисовка ников (by LifeIsGood)
function SetChaNameByVision(role, opponent)

	local final_name = GetChaDefaultName(opponent)

	return final_name

end
---- срабатывает при входе на персонажа;
function LoginGame(role)
	--local gift_daily = CheckGiftDaily(role)
	--if gift_daily > 0 then
	--	SendPrizeForm(role, gift_daily)
	--end
	local cha_id = GetRoleID(role)
	
	-- Игрок получает награду в первый раз
	if (IsDataExist(cha_id) == false) then
		CreateData(cha_id)  -- Создадим файл
		SendPrizeForm(role, 1)
	else
		local dayArr = GetDayInfo(cha_id)
		-- Выдаем приз
		if (dayArr["dayType"] > 0) then
		
			local dayNumber = dayArr["dayNumber"] -- Текущий день
			SendPrizeForm(role, dayNumber)
			
		else -- Следующий день не наступил
		end
	end
end


function get_repatriate_city_guildwar(role)

  local map_name_role_guildwar = GetChaMapName ( role )
  return map_name_role_guildwar

end

function get_repatriate_city_guildwar2(role)

  local map_name_role_guildwar2 = GetChaMapName ( role )
  return map_name_role_guildwar2

end

atk_statecheck = {} 
def_statecheck = {} 

function Reset_Statecheck () 
	for i = 1 , 100 , 1 do 
		atk_statecheck[i] = 0 
		def_statecheck[i] = 0 
	end 
end 

---------------------------------------------
--- Призыв мини-боссов за Пламенные Баксы ---
---------------------------------------------
function Spawn_MiniBoss(role, MonsterID, lifetime, iditem, count)
	local x, y = GetChaPos(role)
	---Проверяем баксы
	local CheckBaks = DelBagItem( role , iditem , count )
	if CheckBaks == 1 then
		local CreateMonster = CreateCha( MonsterID , x , y , 145 , 30 )
		SetChaLifeTime( CreateMonster, lifetime )
	else
		--HelpInfo(role, 0, "Вам не хватает предметов для вызова босса!")
		HelpInfo(role, 0, "\194\224\236 \237\229 \245\226\224\242\224\229\242 \239\240\229\228\236\229\242\238\226 \228\235\255 \226\251\231\238\226\224 \225\238\241\241\224!")
	end
end

--Монстр пропадает, но не убит.
function event_cha_lifetime(role)

end

-- Функция обработки шанса комбайна
function CombineChance(role, scroll_pos, gem1_pos, gem2_pos) 

	-- Получаем свиток
	local scroll = GetChaItem(role, 2, scroll_pos)

	-- Получаем 1 самоцвет
	local gem1 = GetChaItem(role, 2, gem1_pos)
	-- Получаем 2 самоцвет
	local gem2 = GetChaItem(role, 2, gem2_pos)
	local Lv_Gem1 = Get_StoneLv ( gem1 )
	local Lv_Gem2 = Get_StoneLv ( gem2 )
	local chance = 0
	-- Если нужно по ID самоцвета --
	--local GetID_Gem1 = GetItemID(
	--Если первый уровень самоцветов, то..
	if (Lv_Gem1 and Lv_Gem2 == 1) then
		--Шанс - 90%
		chance = 90
	elseif (Lv_Gem1 and Lv_Gem2 == 2) then
		chance = 70
	end
	
	

	-- Эта часть кода возвращает процент
	local sendPacket = GetPacket()
	WriteCmd(sendPacket, 781)
	WriteWord(sendPacket, chance)
	SendPacket(role, sendPacket)


end

-- Обработчик повышения уровня
-- role - указатель на персонажа, lv - новый уровень
function OnLvUpHandler(role, lv)
	if (lv == 10) then
		-- Камень изменения профессии
		GiveItem ( role , 0 , 5330  , 1 , 4 )
	elseif (lv == 25) then
		-- Контракт для 100 колец
		GetKontrakt(role, 1, 62, 200)
	elseif (lv == 45) then
		-- Камень изменения профессии
		GiveItem ( role , 0 , 5330  , 1 , 4 )
	elseif (lv == 50) then
		--Контракт для 100 шапки
		GetKontrakt(role, 2, 1037, 100)
	elseif (lv == 75) then
		--Контракт для 100 ожерелья
		GetKontrakt(role, 3, 226, 150)
	end
end

---------------------
-- Панель эффектов --
---------------------
-- Добавляет эффект в панель эффектов
function EffectPanel_Add(role, effect_name, effect_lv, icon_name, work_time)

  local packet = GetPacket()
  WriteCmd( packet, 777 )
  WriteString( packet, effect_name)
  WriteDword( packet, effect_lv )
  WriteString( packet, icon_name)
  WriteDword( packet, work_time )
  SendPacket( role, packet )

end

-- Очищает панель эффектов
function EffectPanel_Clear(role)

  local packet = GetPacket()
  WriteCmd( packet, 778 )
  SendPacket( role, packet )

end

-- Удаляет эффект из панели эффектов персонажа
function EffectPanel_Remove(role, effect_name)

  local packet = GetPacket()
  WriteCmd( packet, REMOVE_EFFECT )
  WriteString( packet, effect_name)
  SendPacket( role, packet )

end

-- Конвертер времени
function EffectPanel_TimeConvertor(time_in_second)

  return (time_in_second * 1000)

end

function PacketHandler(role, rpk, packet_id)

	-- return 1 - продолжить обработку в GameServer, 
	-- return 0 - остановить обработку в GameServer.

	--SystemNotice(role, "Получен пакет № "..packet_id)
	--print("Gives Packet: "..packet_id)
	-- Ежедневный приз
	local cha_id = GetRoleID(role)
	if (packet_id == 110) then
	
		local data = ReadData(cha_id)
		local nowDay = tonumber(data["Now Day"])
		
		GiveDeilyGift(role, nowDay)
	
	end
	
	-- Пакет шанса комбайна
	if (packet_id == 107) then
	
		-- Считываем входящий пакет
		local scrollPos = ReadByte(rpk)
		local firstGemPos = ReadByte(rpk)
		local secondGemPos = ReadByte(rpk)
		
		-- Вызываем функцию обработки шанса комбайна
		CombineChance(role, scrollPos, firstGemPos, secondGemPos)
		
		return 0 -- прекращаем обработку в ГС
	
	end
  
	--[[
  
	-- это пакет входящих сообщений в местный чат
	if (packet_id == 1) then
	
		-- Создаем копию пакета (не влияя на основной)
		local clone = ClonePacket(rpk)

		-- Читаем копию пакета
		local message = ReadString(clone)
		
		if (message ~= "&updateall") then
		
			SystemNotice(role, "Вы отправил в местный чат: "..message)
			return 1 -- Блокируем обработку в Гейм Сервере (то есть обработка будет только в этой функции).
		
		end

	end
	
	]]--

	return 1

end


function EightyLv_ExpAdd ( cha , expadd ) 

	if ValidCha (cha) ==1 then					--????
		if ChaIsBoat ( cha ) == 0 then			--??????????
			if Lv ( cha ) >= 80 then 
				expadd = math.floor ( expadd / 50 ) 
			end 
			if expadd == 0 then 
				SystemNotice ( TurnToCha(cha) , "Distance is too far to obtain any EXP" )
			end 
		end 
		exp = GetChaAttr ( cha , ATTR_CEXP ) 
		exp = exp + expadd 
		SetCharaAttr ( exp , cha , ATTR_CEXP ) 
	end 
end 



function Check_State ( atk_role , def_role ) 
	Reset_Statecheck() 
	--??????
--	atk_statecheck[STATE_ZMYJ] = GetChaStateLv ( ATKER , STATE_ZMYJ ) 
--	atk_statecheck[STATE_SMYB] = GetChaStateLv ( ATKER , STATE_SMYB ) 
	atk_statecheck[STATE_YS] = GetChaStateLv ( atk_role , STATE_YS ) 
	--??????
--	def_statecheck[STATE_ZJFT] = GetChaStateLv ( DEFER , STATE_ZJFT ) 
--	def_statecheck[STATE_BSHD] = GetChaStateLv ( DEFER , STATE_BSHD ) 
end 

function CreatChaSkill ( role ) 
end 


function CheckJobLegal ( job ) 
	local check_job = 1 
	if job < JOB_TYPE_XINSHOU or job > JOB_TYPE_GONGCHENGSHI then 
		check_job = 0 
	end 
	return check_job 
end 

function RemoveYS( role )
	--SystemNotice ( role , "come here" )
	RemoveState( role , STATE_YS )					
	return 1 
end

function Rem_State_Unnormal ( role ) 
	RemoveState( role , STATE_ZD )					--??
	RemoveState( role , STATE_MB )					--??
	RemoveState( role , STATE_ZZZH )				--????
	RemoveState( role , STATE_SYNZ)				--????
	RemoveState( role , STATE_SDBZ )				--????
	RemoveState( role , STATE_TJ )					--??
	RemoveState( role , STATE_SJ )					--??
--	RemoveState( role , STATE_XY )					--??
	RemoveState( role , STATE_JNJZ )				--????
	RemoveState( role , STATE_GJJZ )				--????
	RemoveState( role , STATE_BDJ )					--???
	RemoveState( role , STATE_XN )					--??
	RemoveState( role , STATE_NT )					--??
	RemoveState( role , STATE_DIZ )					--??
	RemoveState( role , STATE_SWCX )				--????
	RemoveState( role , STATE_JSDD )				--????
	RemoveState( role , STATE_HYMH )				--????-??
	RemoveState( role , STATE_HLKJ )				--??-??
	RemoveState( role , STATE_HLLM )				--??-??
	RemoveState( role , STATE_CRXSF )				--???-??
	RemoveState( role , STATE_BlackHX )				--????
	RemoveState( role , STATE_HLKJ )				--????
end 
------------------------------------------REMOVE????
function Rem_State_StarUnnormal ( role ) 
	RemoveState( role , STATE_KUANGZ )					--???     
	RemoveState( role , STATE_QUANS )					--????  
	RemoveState( role , STATE_QINGZ )					--????  
end 
function Rem_State_NOSEA ( role ) ------------------???????
	RemoveState( role , STATE_KB )					
	RemoveState( role , STATE_XLZH )					
	RemoveState( role , STATE_PKJSYS )				
	RemoveState( role , STATE_PKSFYS)				
	RemoveState( role , STATE_TSHD )				
	RemoveState( role , STATE_FZLZ )					
	RemoveState( role , STATE_PKZDYS )					
	RemoveState( role , STATE_PKKBYS )					
	RemoveState( role , STATE_YSLLQH )				
	RemoveState( role , STATE_YSMJQH )				
	RemoveState( role , STATE_YSLQQH )					
	RemoveState( role , STATE_YSTZQH )					
	RemoveState( role , STATE_YSJSQH )					
	RemoveState( role , STATE_DENGLONG )					
	RemoveState( role , STATE_YSMspd )				
	RemoveState( role , STATE_PKSBYS )				
	RemoveState( role , STATE_KUANGZ )				
	RemoveState( role , STATE_QUANS )				
	RemoveState( role , STATE_QINGZ )				
	RemoveState( role , STATE_CJBBT )				
	RemoveState( role , STATE_JRQKL )				
	RemoveState( role , STATE_KALA )	
	RemoveState( role , STATE_CZZX )
	RemoveState( role , STATE_JLFT1 )				
	RemoveState( role , STATE_JLFT2 )				
	RemoveState( role , STATE_JLFT3 )				
	RemoveState( role , STATE_JLFT4 )				
	RemoveState( role , STATE_JLFT5 )				
	RemoveState( role , STATE_JLFT6 )				
	RemoveState( role , STATE_JLFT7 )				
	RemoveState( role , STATE_JLFT8 )				
end 
function SetCharaAttr(a,b,c) --[[??????????:???,????,????]]--
	local x,y=b,c 
	local z=math.floor(a) 
--	LuaPrint("Set character"..b) 
	--LuaPrint("Attribute"..c) 
	--LuaPrint(a.."\n") 
	--LG("setchaattr","Setting"..c, "number attribute", "= ", a ,"\n") 
	SetChaAttr(x,y,z) 
end 

function Attr_ap(a) --[[??????????]]--
	--LuaPrint("Obtain character attribute remain_ap") 
	local attr_ap=GetChaAttr(a,ATTR_AP) 
	return attr_ap 
end 

function Attr_tp(a) 
	--LuaPrint("Obtain character attribute remain_tp") 
	local attr_tp=GetChaAttr(a,ATTR_TP) 
	return attr_tp 
end 

function CheckCha_Job(a) --[[?????]]-- 
	--LuaPrint("Obtain character attribute job") 
	local role_attr_job=GetChaAttr(a,ATTR_JOB) 
	return role_attr_job 
end 

function Exp(a) 
	--LuaPrint("obtain character current exp or monster exp") 
	local exp=GetChaAttr(a,ATTR_CEXP) --[[?exp]]--
	return exp 
end 

function Lv(a)
	--LuaPrint("Obtain character attribute lv") 
	local b = TurnToCha ( a ) 
	local lv=GetChaAttr( b , ATTR_LV ) --[[?lv]]--
	return lv 
end 

function Hp(a)
	--LuaPrint("Obtain character attribute hp") 
	local hp=GetChaAttr(a,ATTR_HP) --[[?hp]]--
	return hp 
end 

function Mxhp(a)
	--LuaPrint("Obtain character attribute mxhp") 
	local mxhp=GetChaAttr(a,ATTR_MXHP) --[[?mxhp]]--
	return mxhp 
end 

function MxhpSa(a)
	--LuaPrint("Obtain character attribute mxhp_sa") 
	local mxhpsa= GetChaAttr(a, ATTR_STATEC_MXHP)/ATTR_RADIX   --[[?mxhp?????]]--
	return mxhpsa 
end 

function MxhpSb(a)
	--LuaPrint("Obtain character attributemxhp_sb") 
	local mxhpsb=GetChaAttr(a, ATTR_STATEV_MXHP) --[[?mxhp????]]--
	return mxhpsb 
end 

function MxhpIa(a)
	--LuaPrint("Obtain character attribute mxhp_ia") 
	local mxhpia=GetChaAttr(a, ATTR_ITEMC_MXHP)/ATTR_RADIX --[[?mxhp?????]]--
	return mxhpia 
end 

function MxhpIb(a)
	--LuaPrint("Obtain character attribute mshp_ib") 
	local mxhpib=GetChaAttr(a, ATTR_ITEMV_MXHP) --[[?mxhp????]]--
	return mxhpib 
end 

function Sp(a)
	--LuaPrint("Obtain player attribute sp") 
	local sp=GetChaAttr(a,ATTR_SP) --[[?sp]]--
	return sp 
end 

function Mxsp(a)
	--LuaPrint("Obtain character attribute mxsp") 
	local mxsp=GetChaAttr(a,ATTR_MXSP) --[[?mxsp]]--
	return mxsp 
end 

function MxspSa(a)
	--LuaPrint("Obtain player attribute mxsp_sa") 
	local mxspsa=GetChaAttr(a, ATTR_STATEC_MXSP)/ATTR_RADIX  --[[?mxsp?????]]--
	return mxspsa 
end 

function MxspSb(a)
	--LuaPrint("Obtain character attribute mxsp_sb") 
	local mxspsb=GetChaAttr(a, ATTR_STATEV_MXSP) --[[?mxsp????]]--
	return mxspsb 
end 

function MxspIa(a)
	--LuaPrint("Obtain character attribute mxsp_ia") 
	local mxspia=GetChaAttr(a, ATTR_ITEMC_MXSP)/ATTR_RADIX --[[?mxsp?????]]--
	return mxspia 
end 

function MxspIb(a)
	--LuaPrint("Obtain character attribute mxsp_ib") 
	local mxspib=GetChaAttr(a, ATTR_ITEMV_MXSP) --[[?mxsp????]]--
	return mxspib 
end 

function Mnatk(a)
	--LuaPrint("Obtain character attribute mnatk") 
	local mnatk=GetChaAttr(a,ATTR_MNATK) --[[?mnatk]]--
	return mnatk 
end 

function MnatkSa(a)
	--LuaPrint("Obtain character attribute mnatk_sa") 
	local mnatksa= GetChaAttr(a, ATTR_STATEC_MNATK)/ATTR_RADIX --[[?mnatk?????]]--
	return mnatksa 
end 

function MnatkSb(a)
	--LuaPrint("Obtain character attributemnatk_sb") 
	local mnatksb=GetChaAttr(a, ATTR_STATEV_MNATK) --[[?mnatk????]]--
	return mnatksb 
end 

function MnatkIa(a)
	--LuaPrint("Obtain character attribute mnatk_ia") 
	local mnatkia=GetChaAttr(a, ATTR_ITEMC_MNATK)/ATTR_RADIX --[[?mnatk?????]]--
	return mnatkia 
end 

function MnatkIb(a)
	--LuaPrint("Obtain player attribute mnatk_ib") 
	local mnatkib=GetChaAttr(a, ATTR_ITEMV_MNATK) --[[?mnatk????]]--
	return mnatkib 
end 

function Mxatk(a)
	--LuaPrint("Obtain player attribute mxatk") 
	local mxatk=GetChaAttr(a,ATTR_MXATK) --[[?mxatk]]--
	return mxatk 
end 

function MxatkSa(a)
	--LuaPrint("Obtain character attribute mxatk_sa") 
	local mxatksa= GetChaAttr(a, ATTR_STATEC_MXATK)/ATTR_RADIX  --[[?mxatk?????]]--
	return mxatksa 
end 

function MxatkSb(a)
	--LuaPrint("Obtain character attribute mxatk_sb") 
	local mxatksb=GetChaAttr(a, ATTR_STATEV_MXATK) --[[?mxatk????]]--
	return mxatksb 
end 

function MxatkIa(a)
	--LuaPrint("Obtain character attribute mxatk_ia") 
	local mxatkia=GetChaAttr(a, ATTR_ITEMC_MXATK)/ATTR_RADIX --[[?mxatk?????]]--
	return mxatkia 
end 

function MxatkIb(a)
	--LuaPrint("Obtain character attributemxatk_ib") 
	local mxatkib=GetChaAttr(a, ATTR_ITEMV_MXATK) --[[?mxatk????]]--
	return mxatkib 
end 

function Def(a)
	--LuaPrint("Obtain character attribute def") 
	local def=GetChaAttr(a,ATTR_DEF) --[[?def]]--
	return def 
end 

function DefSa(a)
	--LuaPrint("Obtain player attribute def_sa") 
	local defsa= GetChaAttr(a, ATTR_STATEC_DEF)/ATTR_RADIX  --[[?def?????]]--
	return defsa 
end 

function DefSb(a)
	--LuaPrint("Obtain character attribute def_sb") 
	local defsb=GetChaAttr(a, ATTR_STATEV_DEF) --[[?def????]]--
	--LG("setchaattr","obtain character",ATTR_STATEV_DEF,"number attribute= ", defsb,"\n" ) 
	return defsb 
end 

function DefIa(a)
	--LuaPrint("Obtain character attribute def_ia") 
	local defia=GetChaAttr(a, ATTR_ITEMC_DEF)/ATTR_RADIX --[[?def?????]]--
	return defia 
end 

function DefIb(a)
	--LuaPrint("Obtain character attribute def_ib") 
	local defib=GetChaAttr(a, ATTR_ITEMV_DEF) --[[?def????]]--
	return defib 
end 

function Resist(a)
	--LuaPrint("Obtain character attribute def") 
	local def=GetChaAttr(a,ATTR_PDEF) --[[?def]]--
	return def 
end 

function ResistSa(a)
	--LuaPrint("Obtain player attribute def_sa") 
	local defsa= GetChaAttr(a, ATTR_STATEC_PDEF)/ATTR_RADIX  --[[?def?????]]--
	return defsa 
end 

function ResistSb(a)
	--LuaPrint("Obtain character attribute def_sb") 
	local defsb=GetChaAttr(a, ATTR_STATEV_PDEF) --[[?def????]]--
	return defsb 
end 

function ResistIa(a)
	--LuaPrint("Obtain character attribute def_ia") 
	local defia=GetChaAttr(a, ATTR_ITEMC_PDEF)/ATTR_RADIX --[[?def?????]]--
	return defia 
end 

function ResistIb(a)
	--LuaPrint("Obtain character attribute def_ib") 
	local defib=GetChaAttr(a, ATTR_ITEMV_PDEF) --[[?def????]]--
	return defib 
end 

function Hit(a)
	--LuaPrint("Obtain character attribute hit") 
	local hit=GetChaAttr(a,ATTR_HIT) --[[?hit]]--
	return hit 
end 

function HitSa(a)
	--LuaPrint("Obtain character attribute hit_sa") 
	local hitsa= GetChaAttr(a, ATTR_STATEC_HIT)/ATTR_RADIX   --[[?hit?????]]--
	return hitsa 
end 

function HitSb(a)
	--LuaPrint("Obtain character attribute hit_sb") 
	local hitsb=GetChaAttr(a, ATTR_STATEV_HIT) --[[?hit????]]--
	return hitsb 
end 

function HitIa(a)
	--LuaPrint("Obtain character attribute hit_ia") 
	local hitia=GetChaAttr(a, ATTR_ITEMC_HIT)/ATTR_RADIX --[[?hit?????]]--
	return hitia 
end 

function HitIb(a)
	--LuaPrint("Obtain character attribute hit_ib") 
	local hitib=GetChaAttr(a, ATTR_ITEMV_HIT) --[[?hit????]]--
	return hitib 
end 

function Flee(a)
	--LuaPrint("Obtain character attribute flee") 
	local flee=GetChaAttr(a,ATTR_FLEE) --[[?flee]]--
	return flee 
end 

function FleeSa(a)
	--LuaPrint("Obtain character attribute flee_sa") 
	local fleesa=  GetChaAttr(a, ATTR_STATEC_FLEE)/ATTR_RADIX  --[[?flee?????]]--
	return fleesa 
end 

function FleeSb(a)
	--LuaPrint("Obtain character attribute flee_sb") 
	local fleesb=GetChaAttr(a, ATTR_STATEV_FLEE) --[[?flee????]]--
	return fleesb 
end 

function FleeIa(a)
	--LuaPrint("Obtain character attribute flee_ia") 
	local fleeia=GetChaAttr(a, ATTR_ITEMC_FLEE)/ATTR_RADIX --[[?flee?????]]--
	return fleeia 
end 

function FleeIb(a)
	--LuaPrint("Obtain character attribute flee_ib") 
	local fleeib=GetChaAttr(a, ATTR_ITEMV_FLEE) --[[?flee????]]--
	return fleeib 
end 

function Mf(a)
	--LuaPrint("Obtain character attribute mf") 
	local mf=GetChaAttr(a,ATTR_MF)/MFRADIX --[[?mf]]--
	return mf 
end 

function MfSa(a)
	--LuaPrint("Obtain character attributemf_sa") 
	local mfsa= GetChaAttr(a, ATTR_STATEC_MF)/ATTR_RADIX  --[[?mf?????]]--
	return mfsa 
end 

function MfSb(a)
	--LuaPrint("Obtain character attribute mf_sb") 
	local mfsb=GetChaAttr(a, ATTR_STATEV_MF) --[[?mf????]]--
	return mfsb 
end 

function MfIa(a)
	--LuaPrint("Obtain player attribute mf_ia") 
	local mfia=GetChaAttr(a, ATTR_ITEMC_MF)/ATTR_RADIX --[[?mf?????]]--
	return mfia 
end 

function MfIb(a)
	--LuaPrint("Obtain character attribute mf_ib") 
	local mfib=GetChaAttr(a, ATTR_ITEMV_MF) --[[?mf????]]--
	return mfib 
end 

function Crt(a)
	--LuaPrint("Obtain character attribute crt") 
	local crt=GetChaAttr(a,ATTR_CRT)/CRTRADIX --[[?crt]]--
	return crt 
end 

function CrtSa(a)
	--LuaPrint("Obtain player attribute crt_sa") 
	local crtsa= GetChaAttr(a, ATTR_STATEC_CRT)/ATTR_RADIX  --[[?crt?????]]--
	return crtsa 
end 

function CrtSb(a)
	--LuaPrint("Obtain character attribute crt_sb") 
	local crtsb=GetChaAttr(a, ATTR_STATEV_CRT) --[[?crt????]]--
	return crtsb 
end 

function CrtIa(a)
	--LuaPrint("Obtain character attribute crt_ia") 
	local crtia=GetChaAttr(a, ATTR_ITEMC_CRT)/ATTR_RADIX --[[?crt?????]]--
	return crtia 
end 

function CrtIb(a)
	--LuaPrint("Obtain character attribute crt_ib") 
	local crtib=GetChaAttr(a, ATTR_ITEMV_CRT) --[[?crt????]]--
	return crtib 
end 

function Hrec(a)
	--LuaPrint("Obtain character attribute hrec") 
	local hrec=GetChaAttr(a,ATTR_HREC) --[[?hrec]]--
	return hrec 
end 

function HrecSa(a)
	--LuaPrint("Obtain character attribute hrec_sa") 
	local hrecsa=  GetChaAttr(a, ATTR_STATEC_HREC)/ATTR_RADIX  --[[?hrec?????]]--
	return hrecsa 
end 

function HrecSb(a)
	--LuaPrint("Obtain character attribute hrec_sb") 
	local hrecsb=GetChaAttr(a, ATTR_STATEV_HREC) --[[?hrec????]]--
	return hrecsb 
end 

function HrecIa(a)
	--LuaPrint("Obtain character attribute hrec_ia") 
	local hrecia=GetChaAttr(a, ATTR_ITEMC_HREC)/ATTR_RADIX --[[?hrec?????]]--
	return hrecia 
end 

function HrecIb(a)
	--LuaPrint("Obtain character attribute hrec_ib") 
	local hrecib=GetChaAttr(a, ATTR_ITEMV_HREC) --[[?hrec????]]--
	return hrecib 
end 

function Srec(a)
	--LuaPrint("Obtain character attribute srec") 
	local srec=GetChaAttr(a,ATTR_SREC) --[[?srec]]--
	return srec 
end 

function SrecSa(a)
	--LuaPrint("Obtain character attribute srec_sa") 
	local srecsa= GetChaAttr(a, ATTR_STATEC_SREC)/ATTR_RADIX  --[[?srec?????]]--
	return srecsa 
end 

function SrecSb(a)
	--LuaPrint("Obtain character attribute srec_sb") 
	local srecsb=GetChaAttr(a, ATTR_STATEV_SREC) --[[?srec????]]--
	return srecsb 
end 

function SrecIa(a)
	--LuaPrint("Obtain character attribute srec_ia") 
	local srecia=GetChaAttr(a, ATTR_ITEMC_SREC)/ATTR_RADIX --[[?srec?????]]--
	return srecia 
end 

function SrecIb(a)
	--LuaPrint("Obtain character attribute srec_ib") 
	local srecib=GetChaAttr(a, ATTR_ITEMV_SREC) --[[?srec????]]--
	return srecib 
end 

function Aspd(a)
	--LuaPrint("Obtain character attribute aspd") 
	local aspd=math.floor ( 100000 / GetChaAttr(a,ATTR_ASPD) )  --[[?aspd]]--
	return aspd 
end 

function AspdSa(a)
	--LuaPrint("Obtain character attribute aspd_sa") 
	local aspdsa=  GetChaAttr(a, ATTR_STATEC_ASPD)/ATTR_RADIX    --[[?aspd?????]]--
	return aspdsa 
end 

function AspdSb(a)
	--LuaPrint("Obtain character attributeaspd_sb") 
	local aspdsb=GetChaAttr(a, ATTR_STATEV_ASPD) --[[?aspd????]]--
	return aspdsb 
end 

function AspdIa(a)
	--LuaPrint("Obtain character attribute aspd_ia") 
	local aspdia=GetChaAttr(a, ATTR_ITEMC_ASPD)/ATTR_RADIX --[[?aspd?????]]--
	return aspdia 
end 

function AspdIb(a)
	--LuaPrint("Obtain player attribute aspd_ib") 
	local aspdib=GetChaAttr(a, ATTR_ITEMV_ASPD) --[[?aspd????]]--
	return aspdib 
end 

function Adis(a)
	--LuaPrint("Obtain character attribute adis") 
	local adis=GetChaAttr(a,ATTR_ADIS) --[[?adis]]--
	return adis 
end 

function AdisSa(a)
	--LuaPrint("Obtain character attribute adis_sa") 
	local adissa=  GetChaAttr(a, ATTR_STATEC_ADIS)/ATTR_RADIX   --[[?adis?????]]--
	return adissa 
end 

function AdisSb(a)
	--LuaPrint("Obtain player attribute adis_sb") 
	local adissb=GetChaAttr(a, ATTR_STATEV_ADIS) --[[?adis????]]--
	return adissb 
end 

function AdisIa(a)
	--LuaPrint("Obtain character attribute aids_ia") 
	local adisia=GetChaAttr(a, ATTR_ITEMC_ADIS)/ATTR_RADIX --[[?adis?????]]--
	return adisia 
end 

function AdisIb(a)
	--LuaPrint("Obtain character attribute adis_ib") 
	local adisib=GetChaAttr(a, ATTR_ITEMV_ADIS) --[[?adis????]]--
	return adisib 
end 

function Mspd(a)
	--LuaPrint("Obtain character attribute mspd") 
	local mspd=GetChaAttr(a,ATTR_MSPD) --[[?mspd]]--
	return mspd 
end 

function MspdSa(a)
	--LuaPrint("Obtain character attribute mspd_sa") 
	local mspdsa=  GetChaAttr(a, ATTR_STATEC_MSPD)/ATTR_RADIX   --[[?mspd?????]]--
	return mspdsa 
end 
function MspdSb(a)
	--LuaPrint("Obtain character attribute mspd_sb") 
	local mspdsb=GetChaAttr(a, ATTR_STATEV_MSPD) --[[?mspd????]]--
	return mspdsb 
end 
function MspdIa(a)
	--LuaPrint("Obtain character attributemspd_ia") 
	local mspdia=GetChaAttr(a, ATTR_ITEMC_MSPD)/ATTR_RADIX --[[?mspd?????]]--
	return mspdia 
end 

function MspdIb(a)
	--LuaPrint("Obtain character attribute Mspd_ib") 
	local mspdib=GetChaAttr(a, ATTR_ITEMV_MSPD) --[[?mspd????]]--
	return mspdib 
end 

function Col(a)
	--LuaPrint("Obtain character attribute col") 
	local col=GetChaAttr(a,ATTR_COL) --[[?col]]--
	return col 
end 

function ColSa(a) 
	--LuaPrint("Obtain character attribute col_sa") 
	local colsa= GetChaAttr(a, ATTR_STATEC_COL)/ATTR_RADIX  --[[?col?????]]--
	return colsa 
end 

function ColSb(a) 
	--LuaPrint("Obtain character attribute col_sb") 
	local colsb=GetChaAttr(a, ATTR_STATEV_COL) --[[?col????]]--
	return colsb 
end 

function ColIa(a) 
	--LuaPrint("Obtain character attribute col_ia") 
	local colia=GetChaAttr(a, ATTR_ITEMC_COL)/ATTR_RADIX --[[?col?????]]--
	return colia 
end 

function ColIb(a) 
	--LuaPrint("Obtain character attribute col_ib") 
	local colib=GetChaAttr(a, ATTR_ITEMV_COL) --[[?col????]]--
	return colib 
end 

function Str(a) 
	--LuaPrint("Obtain character attribute str") 
	local str=GetChaAttr(a,ATTR_STR) --[[?str]]--
	return str 
end 

function StrSa(a) 
	--LuaPrint("Obtain character attribute str_sa") 
	local strsa= GetChaAttr(a, ATTR_STATEC_STR)/ATTR_RADIX   --[[?str?????]]--
	return strsa 
end 

function StrSb(a) 
	--LuaPrint("Obtain character attribute str_sb") 
	local strsb=GetChaAttr(a, ATTR_STATEV_STR) --[[?str????]]--
	return strsb 
end 

function StrIa(a)
	--LuaPrint("Obtain character attribute str_ia") 
	local stria=GetChaAttr(a,ATTR_ITEMC_STR)/ATTR_RADIX --[[?str?????]]--
	return stria 
end 

function StrIb(a)
	--LuaPrint("Obtain character attribute str_ib") 
	local strib=GetChaAttr(a,ATTR_ITEMV_STR) --[[?str????]]--
	return strib 
end 

function Dex(a)
	--LuaPrint("Obtain character attribute dex") 
	local dex=GetChaAttr(a,ATTR_DEX) --[[?dex]]--
	return dex 
end 

function DexSa(a)
	--LuaPrint("Obtain character attribute dex_sa") 
	local dexsa= GetChaAttr(a, ATTR_STATEC_DEX)/ATTR_RADIX  --[[?dex?????]]--
	return dexsa 
end 

function DexSb(a)
	--LuaPrint("Obtain player attribute dex_sb") 
	local dexsb=GetChaAttr(a, ATTR_STATEV_DEX) --[[?dex????]]--
	return dexsb 
end 

function DexIa(a)
	--LuaPrint("Obtain character attribute dex_ia") 
	local dexia=GetChaAttr(a,ATTR_ITEMC_DEX)/ATTR_RADIX --[[?dex?????]]--
	return dexia 
end 

function DexIb(a)
	--LuaPrint("Obtain character attribute dex_ib") 
	local dexib=GetChaAttr(a,ATTR_ITEMV_DEX) --[[?dex????]]--
	return dexib 
end 

function Agi(a) 
	--LuaPrint("Obtain character attribute agi") 
	local agi=GetChaAttr(a,ATTR_AGI) --[[?agi]]--
	return agi 
end 

function AgiSa(a)
	--LuaPrint("Obtain character attribute agi_sa") 
	local agisa= GetChaAttr(a, ATTR_STATEC_AGI)/ATTR_RADIX  --[[?agi?????]]--
	return agisa 
end 

function AgiSb(a)
	--LuaPrint("Obtain character attribute agi_sb") 
	local agisb=GetChaAttr(a, ATTR_STATEV_AGI) --[[?agi????]]--
	return agisb 
end 

function AgiIa(a)
	--LuaPrint("Obtain character attribute agi_ia") 
	local agiia=GetChaAttr(a,ATTR_ITEMC_AGI)/ATTR_RADIX --[[?agi?????]]--
	return agiia 
end 

function AgiIb(a)
	--LuaPrint("Obtain character attribute agi_ib") 
	local agiib=GetChaAttr(a,ATTR_ITEMV_AGI) --[[?agi????]]--
	return agiib 
end 

function Con(a)
	--LuaPrint("Obtain character attribute con") 
	local con=GetChaAttr(a,ATTR_CON) --[[?con]]--
	return con 
end 

function ConSa(a)
	--LuaPrint("Obtain character attribute con_sa") 
	local consa= GetChaAttr(a, ATTR_STATEC_CON)/ATTR_RADIX  --[[?con?????]]--
	return consa 
end 

function ConSb(a)
	--LuaPrint("Obtain character attribute con_sb") 
	local consb=GetChaAttr(a, ATTR_STATEV_CON) --[[?con????]]--
	return consb 
end 

function ConIa(a)
	--LuaPrint("Obtain character attribute con_ia") 
	local conia=GetChaAttr(a, ATTR_ITEMC_CON)/ATTR_RADIX --[[?con?????]]--
	return conia 
end 

function ConIb(a)
	--LuaPrint("Obtain character attribute con_ib") 
	local conib=GetChaAttr(a, ATTR_ITEMV_CON) --[[?con????]]--
	return conib 
end 

function Sta(a)
	--LuaPrint("Obtain character attribute sta") 
	local sta=GetChaAttr(a,ATTR_STA) --[[?sta]]--
	return sta 
end 

function StaSa(a)
	--LuaPrint("Obtain character attribute sta_sa") 
	local stasa= GetChaAttr(a, ATTR_STATEC_STA)/ATTR_RADIX  --[[?sta?????]]--
	return stasa 
end 

function StaSb(a)
	--LuaPrint("Obtain character attribute sta_sb") 
	local stasb=GetChaAttr(a, ATTR_STATEV_STA) --[[?sta????]]--
	return stasb 
end 

function StaIa(a)
	--LuaPrint("Obtain character attribute sta_ia") 
	local staia=GetChaAttr(a, ATTR_ITEMC_STA)/ATTR_RADIX --[[?sta?????]]--
	return staia 
end 

function StaIb(a)
	--LuaPrint("Obtain character attribute sta_ib") 
	local staib=GetChaAttr(a, ATTR_ITEMV_STA) --[[?sta????]]--
	return staib 
end 

function Luk(a)
	--LuaPrint("Obtain character attribute luk") 
	local luk=GetChaAttr(a,ATTR_LUK) --[[?luk]]--
	return luk 
end 

function LukSa(a)
	--LuaPrint("Obtain character attribute luk_sa") 
	local luksa= GetChaAttr(a, ATTR_STATEC_LUK)/ATTR_RADIX   --[[?luk?????]]--
	return luksa 
end 

function LukSb(a)
	--LuaPrint("Obtain character attribute luk_sb") 
	local luksb=GetChaAttr(a, ATTR_STATEV_LUK) --[[?luk????]]--
	return luksb 
end 

function LukIa(a)
	--LuaPrint("Obtain character attribute luk_ia") 
	local lukia=GetChaAttr(a, ATTR_ITEMC_LUK)/ATTR_RADIX --[[?luk?????]]--
	return lukia 
end 

function LukIb(a)
	--LuaPrint("Obtain character attribute luk_ib") 
	local lukib = GetChaAttr(a, ATTR_ITEMV_LUK) --[[?luk????]]--
	return lukib 
end 




function BSMxhp(a) --[[???mxhp]]--
	--LuaPrint("Obtain character attribute bsmxhp") 
	local bsmxhp=GetChaAttr(a,ATTR_BMXHP) 
	return bsmxhp 
end 

function Mxhp_final(a) 
	local mxhp_final=(BSMxhp(a) * MxhpIa(a) + MxhpIb(a) ) * math.max(0, MxhpSa(a))  + MxhpSb(a) --[[?????mxhp]]--
	--LG("chaattr_set", " BSMxhp = " , BSMxhp(a) , "MxhpIa = " , MxhpIa(a) , " MxhpIb = " , MxhpIb(a) , "MxhpSa = " , MxhpSa(a) , "MxhpSb = ", MxhpSb(a) , "\n" ) 
	--LG("chaattr_set", "mxhp_final = ", mxhp_final , "\n" ) 
	return mxhp_final 
end 


function Sp_final(a)
	local sp_final=(BSSp(a) * SpIa(a) + SpIb(a) ) * math.max(0 , SpSa(a)) + SpSb(a) --[[?????sp]]--
	--LG("chaattr_set", " BSMxhp = " , BSmxhp(a) , "MxhpIa = " , MxhpIa(a) , " MxhpIb = " , MxhpIb(a) , "MxhpSa = " , MxhpSa(a) , "MxhpSb = ", MxhpSb(a) , "\n" ) 
	--LG("chaattr_set", "mxhp_final = ", mxhp_final , "\n" ) 
	return sp_final 
end 

function BSMxsp(a) --[[???mxsp]]--
	--LuaPrint("Obtain character attribute bsmxsp") 
	local bsmxsp=GetChaAttr(a,ATTR_BMXSP) 
	return bsmxsp 
end 

function Mxsp_final(a)
	local mxsp_final=(BSMxsp(a) * MxspIa(a) + MxspIb(a) ) * math.max ( 0 , MxspSa(a) ) + MxspSb(a) --[[?????mxsp]]--
	--LG("chaattr_set", " BSMxsp = " , BSMxsp(a) , "MxspIa = " , MxspIa(a) , " MxspIb = " , MxspIb(a) , "MxspSa = " , MxspSa(a) , "MxspSb = ", MxspSb(a) , "\n" ) 
	--LG("chaattr_set", "mxsp_final = ", mxsp_final , "\n" ) 
	return mxsp_final 
end 

function BSMnatk(a) --[[???mnatk]]--
	--LuaPrint("Obtain character attribute bsmnatk") 
	local bsmnatk=GetChaAttr(a,ATTR_BMNATK) 
	return bsmnatk 
end

function Mnatk_final(a)
	local mnatk_final=math.max ( (BSMnatk(a) * MnatkIa(a) + MnatkIb(a) ) * math.max ( 0 , MnatkSa(a)) + MnatkSb(a) , 1 ) --[[?????mnatk]]--
	--LG("chaattr_set", " BSMnatk = " , BSMnatk(a) , "MnatkIa = " , MnatkIa(a) , " MnatkIb = " , MnatkIb(a) , "MnatkSa = " , MnatkSa(a) , "MnatkSb = ", MnatkSb(a) , "\n" ) 
	--LG("chaattr_set", "mnatk_final = ", mnatk_final , "\n" ) 
	return mnatk_final 
end 

function BSMxatk(a) --[[???mxatk]]--
	--LuaPrint("Obtain character attribute bsmxatk") 
	local bsmxatk=GetChaAttr(a,ATTR_BMXATK) 
	return bsmxatk 
end

function Mxatk_final(a)
	local mxatk_final=math.max ( (BSMxatk(a) * MxatkIa(a) + MxatkIb(a) ) * math.max ( 0 , MxatkSa(a) ) + MxatkSb(a) , 1 ) --[[?????mxatk]]--
	return mxatk_final 
end 

function BSDef(a) --[[???def]]--
	--LuaPrint("Obtain character attributebsdef") 
	local bsdef=GetChaAttr(a,ATTR_BDEF) 
	return bsdef 
end


function Def_final(a)
	local def_final=math.max ( (BSDef(a) * DefIa(a) + DefIb(a) ) * math.max ( 0 , DefSa(a) ) + DefSb(a) , 0 ) --[[?????def]]--
	--LG("chaattr_set", " BSDef = " , BSDef(a) , "DefIa = " , DefIa(a) , " DefIb = " , DefIb(a) , "DefSa = " , DefSa(a) , "DefSb = ", DefSb(a) , "\n" ) 
	--LG("chaattr_set", "def_final = ", def_final , "\n" ) 
	return def_final 
end 

function BSResist(a) --[[?????]]--
   --LuaPrint("Obtain player attribute bsresist") 
   local bsresist = GetChaAttr(a, ATTR_BPDEF) 
   return bsresist 
end 

function Resist_final(a) 
   local resist_final=(BSResist(a) * ResistIa(a) + ResistIb(a) ) * math.max ( 0 , ResistSa(a) ) + ResistSb(a) --[[???resist]]--
   return resist_final 
end 


function BSHit(a) --[[???hit]]--
	--LuaPrint("Obtain character attribute bshit") 
	local bshit=GetChaAttr(a,ATTR_BHIT) 
	return bshit 
end

function Hit_final(a)
	local hit_final = (BSHit(a) * HitIa(a) + HitIb(a) ) * math.max ( 0 , HitSa(a) ) + HitSb(a) --[[?????hit]]--
	return hit_final 
end 

function BSFlee(a) --[[???flee]]--
	--LuaPrint("Obtain character attribute bsflee") 
	local bsflee=GetChaAttr(a,ATTR_BFLEE) 
	return bsflee 
end

function Flee_final(a) 
	local flee_final=(BSFlee(a) * FleeIa(a) + FleeIb(a) ) * math.max ( 0 , FleeSa(a) ) + FleeSb(a)  --[[?????flee]]--
	return flee_final 
end 

function BSMf(a) --[[???mf]]--
	--LuaPrint("Obtain character attribute bsmf") 
	local bsmf=GetChaAttr(a,ATTR_BMF) 
	return bsmf 
end

function Mf_final(a)
	local mf_final=(BSMf(a) * MfIa(a) + MfIb(a) )* math.max ( 0 , MfSa(a) ) + MfSb(a) --[[?????mf]]--
	return mf_final 
end 

function BSCrt(a) --[[???crt]]--
	--LuaPrint("Obtain character attributebscrt") 
	local bscrt=GetChaAttr(a,ATTR_BCRT) 
	return bscrt 
end

function Crt_final(a)
	local crt_final=(BSCrt(a) * CrtIa(a) + CrtIb(a) ) * math.max ( 0 , CrtSa(a) )  + CrtSb(a) --[[?????crt]]--
	return crt_final 
end 

function BSHrec(a) --[[???hrec]]--
	--LuaPrint("Obtain character attribute bshrec") 
	local bshrec=GetChaAttr(a,ATTR_BHREC) 
	return bshrec 
end

function Hrec_final(a)
	local hrec_final=( BSHrec(a) * HrecIa(a) + HrecIb(a) ) * math.max ( 0 , HrecSa(a) ) + HrecSb(a) --[[?????hrec]]--
	return hrec_final 
end 

function BSSrec(a) --[[???srec]]--
	--LuaPrint("Obtain character attribute bssrec") 
	local bssrec=GetChaAttr(a,ATTR_BSREC) 
	return bssrec 
end

function Srec_final(a)
	local srec_final=(BSSrec(a) * SrecIa(a) + SrecIb(a) ) * math.max ( 0 , SrecSa(a) ) + SrecSb(a) --[[?????srec]]--
	return srec_final 
end 

function BSAspd(a) --[[???aspd]]--
	--LuaPrint("Obtain character attribute bsaspd") 
	local bsaspd=math.floor ( 100000 / GetChaAttr(a,ATTR_BASPD) ) 
	return bsaspd 
end

function Aspd_final(a)
	local aspd_final=( BSAspd(a)  * AspdIa(a) + AspdIb(a) ) * math.max ( 0 , AspdSa(a) ) + AspdSb(a) --[[?????aspd]]--
	--LG("aspd", "baspd = " , BSAspd(a),"aspdia= " , AspdIa(a) , " AspdIb = ", AspdIb(a), "AspdSa = " , AspdSa(a) , "AspdSb = " , AspdSb(a) ) 
	return aspd_final 
end 

function BSAdis(a) --[[???adis]]--
	--LuaPrint("Obtain character attribute bsadis") 
	local bsadis=GetChaAttr(a,ATTR_BADIS) 
	return bsadis 
end

function Adis_final(a)
	local adis_final=(BSAdis(a) * AdisIa(a) + AdisIb(a) ) * math.max ( 0 , AdisSa(a) ) + AdisSb(a) --[[?????adis]]--
	return adis_final 
end 

function BSMspd(a) --[[???mspd]]--
	--LuaPrint("Obtain character attribute bsmspd") 
	local bsmspd=GetChaAttr(a,ATTR_BMSPD) 
	return bsmspd 
end

function Mspd_final(a)
	local mspd_final=math.max ( BSMspd(a) * 0.3 , ( (BSMspd(a) * MspdIa(a) + MspdIb(a) ) * math.max ( 0.3 , MspdSa(a))  + MspdSb(a) )  )  --[[?????mspd]]--
	return mspd_final 
end 

function BSCol(a) --[[???col]]--
	--LuaPrint("Obtain character attribute bscol") 
	local bscol=GetChaAttr(a,ATTR_BCOL) 
	return bscol 
end

function Col_final(a)
	local col_final=(BSCol(a) * ColIa(a) + ColIb(a) ) * math.max ( 0 , ColSa(a) ) + ColSb(a) --[[?????col]]--
	return col_final 
end 

function BSStr(a) --[[???str]]--
	--LuaPrint("Obtain character attribute bsstr") 
	local bsstr=GetChaAttr(a,ATTR_BSTR) 
	return bsstr 
end

function Str_final(a)
	local str_final=(BSStr(a) * StrIa(a) + StrIb(a) ) * math.max ( 0 , StrSa(a) ) + StrSb(a) --[[?????str]]--
	return str_final 
end 

function BSDex(a) --[[???dex]]--
	--LuaPrint("Obtain character attribute bsdex") 
	local bsdex=GetChaAttr(a,ATTR_BDEX) 
	return bsdex 
end

function Dex_final(a)
	local dex_final=(BSDex(a) * DexIa(a) + DexIb(a) ) * math.max ( 0 , DexSa(a) ) + DexSb(a) --[[?????dex]]--
	return dex_final 
end 

function BSAgi(a) --[[???agi]]--
	--LuaPrint("Obtain character attribute bsagi") 
	local bsagi=GetChaAttr(a,ATTR_BAGI) 
	return bsagi 
end

function Agi_final(a)
	local agi_final=(BSAgi(a) * AgiIa(a) + AgiIb(a) ) * math.max ( 0 , AgiSa(a) ) + AgiSb(a) --[[?????agi]]--
	return agi_final 
end 

function BSCon(a) --[[???con]]--
	--LuaPrint("Obtain character attribute bscon") 
	local bscon=GetChaAttr(a,ATTR_BCON) 
	return bscon 
end

function Con_final(a)
	local con_final=(BSCon(a) * ConIa(a) + ConIb(a)) * math.max ( 0 , ConSa(a) ) + ConSb(a) --[[?????con]]--
	return con_final 
end 

function BSSta(a) --[[???sta]]--
	--LuaPrint("Obtain character attribute bssta") 
	local bssta=GetChaAttr(a,ATTR_BSTA) 
	return bssta 
end

function Sta_final(a)
	local sta_final=(BSSta(a) * StaIa(a) + StaIb(a) ) * math.max ( 0 , StaSa(a) ) + StaSb(a) --[[?????sta]]--
	return sta_final 
end 

function BSLuk(a) --[[???luk]]--
	--LuaPrint("Obtain character attribute bsluk") 
	local bsluk=GetChaAttr(a,ATTR_BLUK) 
	return bsluk 
end

function Luk_final(a)
	local luk_final=(BSLuk(a)  *LukIa(a) + LukIb(a) ) * math.max ( 0 , LukSa(a) ) + LukSb(a) --[[?????luk]]--
	return luk_final 
end 



--?????????-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Ship_BSMnatk ( ship_role )						--????????
	local ship_bsmnatk=GetChaAttr( ship_role , ATTR_BMNATK ) 
	return ship_bsmnatk 
end 

function Ship_BSMxatk ( ship_role )						--????????
	local ship_bsmxatk=GetChaAttr( ship_role , ATTR_BMXATK ) 
	return ship_bsmxatk 
end 
	
function Ship_BSAdis ( ship_role )							--????????
	local ship_bsadis=GetChaAttr( ship_role , ATTR_BADIS ) 
	return ship_bsadis  
end 

function Ship_BSCspd ( ship_role )							--????????
	local ship_bscspd=GetChaAttr( ship_role , ATTR_BOAT_BCSPD ) 
	return ship_bscspd  
end 

function Ship_BSAspd ( ship_role ) 						--????????
	local ship_bsaspd=GetChaAttr( ship_role , ATTR_BASPD ) 
	return ship_bsaspd  
end 

function Ship_BSCrange ( ship_role ) 						--????????
	local ship_bscrange=GetChaAttr( ship_role , ATTR_BOAT_BCRANGE ) 
	return ship_bscrange  
end 


function Ship_BSDef ( ship_role ) 							--??????
	local ship_bsdef=GetChaAttr( ship_role , ATTR_BDEF ) 
	return ship_bsdef   
end 


function Ship_BSResist ( ship_role ) 						--??????
	local ship_bsresist=GetChaAttr( ship_role , ATTR_BPDEF ) 
	return ship_bsresist   
end 

function Ship_BSMxhp ( ship_role ) 						--????????
	local ship_bsmxhp=GetChaAttr( ship_role , ATTR_BMXHP ) 
	return ship_bsmxhp    
end 

function Ship_BSHrec ( ship_role ) 						--??????????
	local ship_bshrec=GetChaAttr( ship_role , ATTR_BHREC ) 
	return ship_bshrec 
end 

function Ship_BSSrec ( ship_role ) 							--??????????
	local ship_bssrec=GetChaAttr( ship_role , ATTR_BSREC ) 
	return ship_bssrec 
end 

function Ship_BSMspd ( ship_role ) 						--????????
	local ship_bsmspd=GetChaAttr( ship_role , ATTR_BMSPD ) 
	return ship_bsmspd 
end 

function Ship_BSMxsp ( ship_role ) 						--?????????
	local ship_bsmxsp=GetChaAttr( ship_role , ATTR_BMXSP ) 
	return ship_bsmxsp 
end 


--????????????--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Ship_MnatkSa ( cha_role )						--????????????????
	local ship_mnatksa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MNATK ) / ATTR_RADIX
	return ship_mnatksa 
end 

function Ship_MnatkSb ( cha_role )						--????????????????
	local ship_mnatksb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MNATK ) 
	return ship_mnatksb 
end 

function Ship_MxatkSa ( cha_role )						--????????????????
	local ship_mxatksa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXATK ) / ATTR_RADIX
	return ship_mxatksa 
end 

function Ship_MxatkSb ( cha_role )						--????????????????
	local ship_mxatksb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXATK ) 
	return ship_mxatksb 
end 
	
function Ship_AdisSa ( cha_role )							--????????????????
	local ship_adissa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_ADIS ) / ATTR_RADIX
	return ship_adissa  
end 

function Ship_AdisSb ( cha_role )							--????????????????
	local ship_adissb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_ADIS ) 
	return ship_adissb  
end 



function Ship_CspdSa ( cha_role )							--????????????????
	local ship_cspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_CSPD ) / ATTR_RADIX
	return ship_cspdsa  
end 

function Ship_CspdSb ( cha_role )							--????????????????
	local ship_cspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_CSPD ) 
	return ship_cspdsb  
end 



function Ship_AspdSa ( cha_role ) 						--????????????????
	local ship_aspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_ASPD ) / ATTR_RADIX
	return ship_aspdsa  
end 


function Ship_AspdSb ( cha_role ) 						--????????????????
	local ship_aspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_ASPD ) 
	return ship_aspdsb  
end 




function Ship_CrangeSa ( cha_role ) 						--????????????????
	local ship_crangesa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_CRANGE ) / ATTR_RADIX
	return ship_crangesa  
end 

function Ship_CrangeSb ( cha_role ) 						--????????????????
	local ship_crangesb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_CRANGE ) 
	return ship_crangesb  
end 




function Ship_DefSa ( cha_role ) 							--??????????????
	local ship_defsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_DEF ) / ATTR_RADIX
	return ship_defsa   
end 

function Ship_DefSb ( cha_role ) 							--??????????????
	local ship_defsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_DEF ) 
	return ship_defsb   
end 



function Ship_ResistSa ( cha_role ) 						--??????????????
	local ship_resistsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_RESIST ) / ATTR_RADIX
	return ship_resistsa   
end 

function Ship_ResistSb ( cha_role ) 						--??????????????
	local ship_resistsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_RESIST ) 
	return ship_resistsb   
end 



function Ship_MxhpSa ( cha_role ) 						--????????????????
	local ship_mxhpsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXUSE ) / ATTR_RADIX
	return ship_mxhpsa    
end 

function Ship_MxhpSb ( cha_role ) 						--????????????????
	local ship_mxhpsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXUSE ) 
	return ship_mxhpsb    
end 



function Ship_HrecSa ( cha_role ) 							--??????????????????
	local ship_hrecsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_USEREC ) / ATTR_RADIX
	return ship_hrecsa 
end 

function Ship_HrecSb ( cha_role ) 						--??????????????????
	local ship_hrecsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_USEREC ) 
	return ship_hrecsb 
end 



function Ship_SrecSa ( cha_role ) 							--??????????????????
	local ship_srecsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_EXP ) / ATTR_RADIX
	return ship_srecsa 
end 

function Ship_SrecSb ( cha_role ) 									--??????????????????
	local ship_srecsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_EXP ) 
	return ship_srecsb 
end 



function Ship_MspdSa ( cha_role ) 								--????????????????
	local ship_mspdsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MSPD ) / ATTR_RADIX
	return ship_mspdsa 
end 

function Ship_MspdSb ( cha_role ) 								--????????????????
	local ship_mspdsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MSPD ) 
	return ship_mspdsb 
end 



function Ship_MxspSa ( cha_role ) 									--?????????????????
	local ship_mxspsa=GetChaAttr( cha_role , ATTR_BOAT_SKILLC_MXSPLY ) / ATTR_RADIX
	return ship_mxspsa 
end 

function Ship_MxspSb ( cha_role ) 								--?????????????????
	local ship_mxspsb=GetChaAttr( cha_role , ATTR_BOAT_SKILLV_MXSPLY ) 
	return ship_mxspsb 
end 

--????????--------------------------------------------------------------------------------------------------------------------------------------------------

function Ship_Mnatk_final ( cha_role , ship_role )							--????????
	local ship_mnatk=  math.floor ( ( Ship_BSMnatk ( ship_role ) * Ship_MnatkSa ( cha_role ) + Ship_MnatkSb ( cha_role ) ) * MnatkSa ( ship_role ) + MnatkSb ( ship_role ) )
	return ship_mnatk 
end 

function Ship_Mnatk ( ship_role )										--??????
	local ship_mnatk=GetChaAttr( ship_role , ATTR_MNATK ) 
	return ship_mnatk 
end 

function Ship_Mxatk_final ( cha_role , ship_role )							--????????
	local ship_mxatk= math.floor ( ( Ship_BSMxatk ( ship_role ) * Ship_MxatkSa ( cha_role ) + Ship_MxatkSb ( cha_role ) ) * MxatkSa ( ship_role ) + MxatkSb ( ship_role ) )
	return ship_mxatk 
end 

function Ship_Mxatk ( ship_role )										--??????
	local ship_mxatk=GetChaAttr( ship_role , ATTR_MXATK ) 
	return ship_mxatk 
end 


	
function Ship_Adis_final ( cha_role , ship_role )							--????????
	local ship_adis= math.floor ( ( Ship_BSAdis ( ship_role ) * Ship_AdisSa ( cha_role ) + Ship_AdisSb ( cha_role ) )  ) 
	return ship_adis 
end 

function Ship_Adis ( ship_role )										--??????
	local ship_adis=GetChaAttr( ship_role , ATTR_ADIS ) 
	return ship_adis 
end 




function Ship_Cspd_final ( cha_role , ship_role )							--??????????
	local ship_cspd= math.floor ( ( Ship_BSCspd ( ship_role ) * Ship_CspdSa ( cha_role ) + Ship_CspdSb ( cha_role ) )  )
	return ship_cspd 
end 

function Ship_Cspd ( ship_role )										--????????
	local ship_cspd=GetChaAttr( ship_role , ATTR_BOAT_CSPD ) 
	return ship_cspd 
end 



function Ship_Aspd_final ( cha_role , ship_role ) 							--????????
	local ship_aspd= math.floor ((  Ship_BSAspd ( ship_role ) * Ship_AspdSa ( cha_role ) + Ship_AspdSb ( cha_role ) ) * AspdSa ( ship_role ) + AspdSb ( ship_role ) )
	return ship_aspd  
end 

function Ship_Aspd ( ship_role ) 										--??????
	local ship_aspd=GetChaAttr( ship_role , ATTR_ASPD ) 
	return ship_aspd  
end 



function Ship_Crange_final (  cha_role , ship_role ) 							--????????
	local ship_crange= math.floor ( ( Ship_BSCrange ( ship_role ) * Ship_CrangeSa ( cha_role ) + Ship_CrangeSb ( cha_role ) )  ) 
	return ship_crange  
end 

function Ship_Crange ( ship_role ) 										--??????
	local ship_crange=GetChaAttr( ship_role , ATTR_CRANGE ) 
	return ship_crange  
end 

function Ship_Def_final ( cha_role , ship_role ) 							--??????
	local ship_def= math.floor ( ( Ship_BSDef ( ship_role ) * Ship_DefSa ( cha_role ) + Ship_DefSb ( cha_role ) ) * DefSa ( ship_role ) + DefSb ( ship_role ) ) 
	return ship_def  
end 

function Ship_Def ( ship_role ) 										--????
	local ship_def=GetChaAttr( ship_role , ATTR_DEF ) 
	return ship_def  
end 



function Ship_Resist_final (  cha_role ,ship_role ) 							--??????
	local ship_resist= math.floor ( ( Ship_BSResist ( ship_role ) * Ship_ResistSa ( cha_role ) + Ship_ResistSb ( cha_role ) ) * ResistSa ( ship_role ) + ResistSb ( ship_role ) ) 
	return ship_resist  
end 

function Ship_Resistl ( ship_role ) 										--????
	local ship_resist=GetChaAttr( ship_role , ATTR_PDEF ) 
	return ship_resist  
end 



function Ship_Mxhp_final (  cha_role ,ship_role ) 							--????????
	local ship_mxhp= math.floor ( ( Ship_BSMxhp ( ship_role ) * Ship_MxhpSa ( cha_role ) + Ship_MxhpSb ( cha_role ) ) * MxhpSa ( ship_role ) + MxhpSb ( ship_role ) ) 
	return ship_mxhp  
end 

function Ship_Mxhp ( ship_role ) 										--??????
	local ship_mxhp=GetChaAttr( ship_role , ATTR_MXHP ) 
	return ship_mxhp  
end 

function Ship_Hp ( ship_role )										--??????
	local ship_hp=GetChaAttr( ship_role , ATTR_HP ) 
	return ship_hp  
end 

function Ship_Hrec_final (  cha_role ,ship_role ) 							--??????????
	local ship_hrec= math.floor ( ( Ship_BSHrec ( ship_role ) * Ship_HrecSa ( cha_role ) + Ship_HrecSb ( cha_role ) ) * HrecSa ( ship_role ) + HrecSb ( ship_role )  ) 
	return ship_hrec  
end 

function Ship_Hrec (  ship_role ) 										--????????
	local ship_hrec=GetChaAttr( ship_role , ATTR_HREC ) 
	return ship_hrec  
end 


function Ship_Srec_final (  cha_role ,ship_role ) 							--??????????
	local ship_srec= math.floor ( ( Ship_BSSrec ( ship_role ) * Ship_SrecSa ( cha_role ) + Ship_SrecSb ( cha_role ) ) * SrecSa ( ship_role ) + SrecSb ( ship_role ) ) 
	return ship_srec  
end 

function Ship_Srec ( ship_role ) 										--????????
	local ship_srec=GetChaAttr( ship_role , ATTR_SREC ) 
	return ship_srec  
end 




function Ship_Mspd_final (  cha_role ,ship_role ) 							--????????
	local ship_mspd= math.floor ( ( Ship_BSMspd ( ship_role ) * Ship_MspdSa ( cha_role ) + Ship_MspdSb ( cha_role ) ) * MspdSa ( ship_role ) + MspdSb ( ship_role ) ) 
	return ship_mspd  
end 

function Ship_Mspd ( ship_role ) 										--??????
	local ship_mspd=GetChaAttr( ship_role , ATTR_MSPD ) 
	return ship_mspd  
end 



function Ship_Mxsp_final (  cha_role ,ship_role ) 									--???????
	local ship_mxsp= math.floor ( ( Ship_BSMxsp ( ship_role ) * Ship_MxspSa ( cha_role ) + Ship_MxspSb ( cha_role ) ) * MxspSa ( ship_role ) + MxspSb ( ship_role ) ) 
	return ship_mxsp  
end 

function Ship_Mxsp ( ship_role ) 										--???????
	local ship_mxsp=GetChaAttr( ship_role , ATTR_MXSP ) 
	return ship_mxsp  
end 

function Ship_Sp ( ship_role )										--???????
	local ship_sp=GetChaAttr( ship_role , ATTR_SP ) 
	return ship_sp  
end 







function Percentage_Random(a) 
	local x,y=a*1000000000,math.random(0,1000000000) 
	local z 
	if y<=x then 
		z=1 
		else z=0 
	end 
	return z 
end 



function Dis(a,b,c,d) --[[?(a,b)?(c,d)??]]--
	local x1,y1,x2,y2=a,b,c,d 
---@diagnostic disable-next-line: deprecated
	local dis=math.pow( math.pow(x1-x2, 2) + math.pow(y1-y2, 2), 0.5) 
	return dis 
end 

function Check_Direction(a) 
	--LuaPrint("Enter function Check_Direction(a) --[[determine  character direction, x axis of center as 1, anticlockwise as 2, 3, 4, 5, 6, 7, 8?]--") 
	local direction=GetChaAttr(a, ATTR_DIREC) 
	local division 
	if ((direction>=337.5) and (direction<360)) or ((direction>=0) and (direction<22.5)) then 
		division=1 
	elseif (direction>=22.5) and (direction<67.5) then 
		division=2 
	elseif (direction>=67.5) and (direction<112.5) then 
		division=1 
	elseif (direction>=112.5) and (direction<157.5) then 
		division=8 
	elseif (direction>=157.5) and (direction<202.5) then 
		division=7 
	elseif (direction>=202.5) and (direction<247.5) then 
		division=6 
	elseif (direction>=247.5) and (direction<292.5) then 
		division=5 
	elseif (direction>=292.5) and (direction<337.5) then 
		division=4 
	else --LuaPrint("incorrect character angle direction".."\n" ) 
      return 
   end 

	--LuaPrint("Out function Check_Direction(a) --[[determine character direction, x axis with center as 1, anticlockwise as 2, 3, 4, 5, 6, 7, 8?]--") 
	return division 
end 


function Hp_Dmg(role,dmg) --[[??hp??????]]--

	local map_name_DEFER = GetChaMapName ( role )
	local Can_Pk_Garner2 = Is_NormalMonster (role)
	local T=0.1	
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
		if Can_Pk_Garner2 == 0 then
			dmg = dmg * T
	end
	end
	--LuaPrint("Enter function Hp_Dmg(role,dmg) --[[hp consumption management formula]]--") 
	--Notice("dmg3="..dmg)
	local statelv_mfd = GetChaStateLv ( role , STATE_MFD ) 
	local hp = Hp(role) 
	local sp = Sp(role) 
	if dmg <= 0 then 
		hp = hp - dmg 
		SetCharaAttr(hp, role, ATTR_HP )  
		return 
	end 
	
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0 then
		local Elf_Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Elf_Num , 0 , 1 )
		local PowerSheild = 0
		if CheckElfSkill == 2 then
			PowerSheild = ElfSKill_PowerSheild ( role , Elf_Item , Elf_Num , dmg )
			if PowerSheild ~= 0 then
				SystemNotice ( role , "\212\229\255 \224\234\242\232\226\232\240\238\226\224\235\224 \231\224\249\232\242\243,\243\240\238\237 \225\251\235 \239\238\227\235\238\249\184\237 " )
			end
			dmg = dmg - PowerSheild
		end
	end

	if statelv_mfd >= 1 then 
		sp_change = statelv_mfd * 0.25 + 0.5
	--local map_name_ATKER = GetChaMapName ( a )
	local map_name_DEFER = GetChaMapName ( role )
	local Can_Pk_Garner2 = Is_NormalMonster (role)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--	Notice("22")
			if Can_Pk_Garner2 == 0 then
				sp_change = statelv_mfd * 0.25 + 0.5
			end
		end
		local Check_Heilong  = CheckItem_Heilong ( role )
		if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.5 )
			if Percentage == 1 then
				  sp_change =  sp_change*1.5
				SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\237\224\226\251\234 \241\240\224\225\238\242\224\235 \253\244\244\229\234\242\232\226\237\229\233 ")
			end
		end
		local CheckItem_fighting = CheckItem_fighting ( role )
		local IsGarnerWiner = IsGarnerWiner(role)
		if CheckItem_fighting == 1 then
			if IsGarnerWiner == 1  then 
				local Percentage_1 = Percentage_Random ( 0.5 )
				if Percentage_1 == 1 then
					dmg = dmg*0.5
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
				end
			elseif IsGarnerWiner == 2  then
				local Percentage_2 = Percentage_Random ( 0.5 )
				if Percentage_2 == 1 then
					dmg = dmg*0.6
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 3  then
				local Percentage_3 = Percentage_Random ( 0.5 )
				if Percentage_3 == 1 then
					dmg = dmg*0.7
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 4  then
				local Percentage_4 = Percentage_Random ( 0.5 )
				if Percentage_4 == 1 then
					dmg = dmg*0.8
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 5 then
				local Percentage_5 = Percentage_Random ( 0.3 )
				if Percentage_5 == 1 then
					dmg = dmg*0.8
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
		
				end
			end	
		end
		if dmg / sp_change <= sp then 
			sp = math.floor ( sp - dmg/sp_change ) 
		else 
			hp =math.floor ( hp - ( dmg/sp_change - sp ) ) 
			sp = 0 
			RemoveState ( role , STATE_MFD ) 
		end 
	else
		local Check_Nianshou = CheckItem_Nianshou ( role )
		local CheckItem_fighting = CheckItem_fighting ( role )
		local IsGarnerWiner = IsGarnerWiner(role)
		if Check_Nianshou == 1 then
			local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				dmg = dmg * -1
				SystemNotice ( role , "Recieved blessing from Goddess. Drains enemy HP.")
			end
		end
		if CheckItem_fighting == 1 then
			if IsGarnerWiner == 1  then 
				local Percentage_1 = Percentage_Random ( 0.5 )
				if Percentage_1 == 1 then
					dmg = dmg*0.5
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
				end
			elseif IsGarnerWiner == 2  then
				local Percentage_2 = Percentage_Random ( 0.5 )
				if Percentage_2 == 1 then
					dmg = dmg*0.6
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 3  then
				local Percentage_3 = Percentage_Random ( 0.5 )
				if Percentage_3 == 1 then
					dmg = dmg*0.7
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 4  then
				local Percentage_4 = Percentage_Random ( 0.5 )
				if Percentage_4 == 1 then
					dmg = dmg*0.8
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
			
				end
			elseif IsGarnerWiner == 5 then
				local Percentage_5 = Percentage_Random ( 0.3 )
				if Percentage_5 == 1 then
					dmg = dmg*0.8
					SystemNotice ( role , "\192\234\242\232\226\232\240\238\226\224\237\224 \241\232\235\224 \241\229\242\224,\243\240\238\237 \247\224\241\242\232\247\237\238 \239\238\227\235\238\249\184\237" )
		
				end
			end	
		end
	
	--local map_name_ATKER = GetChaMapName ( role )
		local ZSExp = GetChaAttr( role , ATTR_CSAILEXP )
		if ZSExp > 0 and ZSExp < 100 then
			dmg = dmg * 0.945
		end
		if ZSExp >= 100 and ZSExp < 12100 then
			dmg = dmg * ( 0.95 - math.floor( math.pow( (ZSExp / 100) , 0.5 )) * 0.005)
		end
		hp = Hp(role) - dmg 
	end 
	SetCharaAttr(sp, role, ATTR_SP ) 
	SetCharaAttr(hp, role, ATTR_HP )  
	--LuaPrint("Out function Hp_Dmg(role,dmg) --[[HP consumption management formula]]--") 
end 


function Endure_Dmg ( role , dmg ) 
	local hp = Hp ( role ) - dmg 
	SetCharaAttr(hp, role, ATTR_HP ) 
end 
	

function Sp_Red(role,sp_reduce) --[[sp??????]]--
	--LuaPrint("Enter function Sp_Red(role,spreduce) --[[SP consumption management formula]]--") 
	local sp = Sp(role) - sp_reduce 
	--LG("sp_red", "before_sp = " , Sp(role) , " sp_reduce = " , sp_reduce , "final_sp = " , sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP ) 
	--LuaPrint("Out function Sp_Red(role,spreduce) --[[SP consumption management formula]]--") 
end 

function Coefficientadjust_Steady_atk()	--[[????????]]--
	--LuaPrint("Enter function Coefficientadjust_Steady_atk()	--[[Adjust stable attack modulus]]--") 
	local steady_atk_maxreduce = 0.9 
	local steady_atk_maxreducepoint = 0.99 
	local steady_atk_maxluk=1500 
	local a = steady_atk_maxreduce / steady_atk_maxluk 
	local b = steady_atk_maxreducepoint / steady_atk_maxluk 
	--LuaPrint("Out function Coefficientadjust_Steady_atk()	--[[adjust stable attack value]]--") 
	return a,b,steady_atk_maxreduce,steady_atk_maxreducepoint 
end 

function SetSteady_atk(a) --[[????????]]--
	--LuaPrint("Enter function SetSteady_atk(a) --[[set attack stability]]--") 
	local x,y,m,n = Coefficientadjust_Steady_atk() --[[????????]]--
	local sum=1 
	local atkstep={} --[[????????]]--
	local atk={} --[[????????????]]--
	atk[Mnatk_final(a) - 1 ] = 0 
	for i = Mnatk_final(a),  Mxatk_final(a), 1 do 
		atkstep[i] = 1 
	end 
	local maxreduce = math.min(m, Luk_final(a) * x ) 
	local reducepoint = math.min(n, Luk_final(a) * y ) * (Mxatk_final(a) - Mnatk_final(a) ) 
	if reducepoint==0 then 
		--LuaPrint("Non attacking wave".."\n") 
		atk[Mnatk_final(a)] = 1 
	return atk,sum 
	end --[[????????,????????????1]]--
	local steady_step = maxreduce / reducepoint 
	for i = 0, Mxatk_final(a) - Mnatk_final(a), 1 do 
		atkstep[ i + Mnatk_final(a) ] = atkstep [ i + Mnatk_final(a) ] - math.max(0, (maxreduce-i * steady_step) ) 
		sum = sum + atkstep[ i + Mnatk_final(a) ]  
		atk[ i + Mnatk_final(a) ] = sum 
	end 
	--local gatk = 0 
	--for i = Mnatk_final(a), Mxatk_final(a), 1 do 
	--ccc = (atk[i]-atk[i-1]) / sum 
	--gatk = gatk + i * ccc --[[?????]]--
	--end 
	--LuaPrint("Out function SetSteady_atk(a) --[[Set attack stability]]--") 
	return atk,sum 
end 
	
	
function CheckSteady_atk(a) --[[??????]]--
	--LuaPrint("Enter function CheckSteady_atk(a) --[[stablilze attack determination]]--") 
	local atk,sum = SetSteady_atk(a) 
	local x = math.random( 0, 10000 ) 
	local y = x * sum/10000 
	for i = Mnatk_final(a), Mxatk_final(a), 1 do 
      if y<=atk[i] then 
         return i 
      end 
   end 
	--LuaPrint ("error! No Hit Rate to Attack, return Min Attack".."\n") 
	--LuaPrint("Out function CheckSteady_atk(a) --[[stablilize attack determination]]--") 
	return Mnatk_fianl(a) 
end 
	

--	function  Skadd_Check( job , lv , tp , form_sklv)									--??????
--		LG( "Skadd", "enter function  Skadd_Check :" ) 
--		local itemuse = 0 
--		local cha_job = GetChaAttr( ATKER , ATTR_JOB ) 
--		if  cha_job ~= job then 
--			LG( "Skadd", "function Skadd:", "Unable to use. Class does not match" ) 
--			itemuse = 1 
--		end 
--		local cha_lv = GetChaAttr( ATKER , ATTR_LV ) 
--		if cha_lv < lv then 
--			LG( "Skadd", "function Skadd:", "Unable to use. Character level insufficient" ) 
--			itemuse = 2 
--		end 
--		local cha_tp = GetChaAttr( ATKER , ATTR_TP ) 
--		if cha_tp < tp then 
--			LG( "Skadd", "function Skadd:", "Unable to use. Insufficient skill point" ) 
--			itemuse = 3 
--		end 
--		if form_sklv > 0 then 
--			LG( "Skadd", "function Skadd:", "Unable to use. Already possessed this skill" ) 
--			itemuse = 4 
--		end 
--		LG( "Skadd", "out function  Skadd_Check :" ) 
--		return itemuse 
--	end 
	
function Lefthand_Atk ( role , atk )												--??????                        
	local sklv = GetSkillLv ( role , STATE_FSZ ) 
	add_atk = math.floor ( atk * ( 1.2 + sklv * 0.08 ) ) 
	return add_atk 
end 

function Check_Zmyj ( role , dmg_mul )												--????????
	local statelv = GetChaStateLv ( role , STATE_ZMYJ ) 
	local crt_rad = 0.2 + statelv * 0.02 
	if dmg_mul == 2 or dmg_mul == 1 then 
		a = Percentage_Random ( crt_rad ) 
		if a== 1 then 
			dmg_mul = 2 + statelv/2 
		end 
	end 
	return dmg_mul 
end 
	
function Check_Smyb ( role )													--????????
	local statelv = GetChaStateLv (role , STATE_SMYB ) 
	local hp = Hp ( role ) 
	local mxhp = Mxhp ( role ) 
	local atk_sa = 1 
	if hp <= mxhp * 0.2 and hp > 0 then 
		atk_sa = 1 + statelv * 0.1 
	end 
	local mnatk = Mnatk ( role ) * atk_sa 
	local mxatk = Mxatk ( role ) * atk_sa 
	return mnatk , mxatk 
end 


--????????,??????????——————————————————————————————————

function Check_Ys_Rem ( role_atk , role_def )	
	Check_State ( role_atk , role_def ) 
	if atk_statecheck[STATE_YS] >= 1 then 
		RemoveState ( role_atk , STATE_YS ) 
	end 
end 

function Check_Bshd (statelv) 
	local statetime = 3 + statelv * 1 
	return statetime 
end 

function Atk_Raise ( rad , atker , defer )			--??????
	local atk = rad * math.random ( Mnatk( atker ) , Mxatk ( atker ) ) 
	local defer_def = Def ( defer ) 
	local defer_resist = Resist ( defer ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist ) 
	return dmg 
end 

function TurnToCha ( role ) 
	local x_role = role 
	if ChaIsBoat ( role ) == 1 then 
		x_role = GetMainCha ( role ) 
	end 
	return x_role 
end 

function TurnToShip ( role ) 
	local x_role = role 
	if ChaIsBoat ( role ) == 0 then 
		x_role = GetCtrlBoat ( role ) 
		if x_role == nil then 
			LG ( "getshipid_err" , " get a nil shipid " ) 
		end 
	end 
	return x_role 
end 

function ALLExAttrSet ( role )				--??????????????
	if IsPlayer ( role ) == 0 then				--?????
		ExAttrSet ( role ) 
		return 
	end 
	if ChaIsBoat ( role ) == 0 then			--???????
		AttrRecheck ( role ) 
	else								--???????
		cha_role = GetMainCha ( role ) 
		ShipAttrRecheck ( cha_role , role ) 
	end 
end 

function Hp_Endure_Dmg ( role , dmg ) 
	if ChaIsBoat ( role ) == 0 then 
		Hp_Dmg ( role , dmg ) 
		local state_ys_lv =  GetChaStateLv (role , STATE_YS ) 
		if state_ys_lv >= 1 then 
			RemoveState ( role , STATE_YS ) 
		end 
	else 
		Endure_Dmg ( role , dmg ) 
	end 
end 

----????????------------------------------------------------------------------------------
function Boat_plus_MNATk( Lv , mnatk)
	local mnatk_new = 0
	
	if Lv < 1 then
		LG("Boat_plus_MNatk","Ship level is lower than 1")
		LG("Boat_plus_MNatk","1")
		return mnatk
	end
	
	if Lv > 100 then
		LG("Boat_plus_MNatk","Ship level higher than 100")
		LG("Boat_plus_MNatk","Ship level lower than 2")

		return mnatk
	end
	
	if Lv < 60 then
		LG ( "Boat_plus_MNatk" , mnatk ) 
		mnatk_new = ( 1 + ( Lv - 20 ) / 120 ) * mnatk
		LG("Boat_plus_MNatk","Ship level smaller than 3")

		return mnatk_new
	end
	
	if Lv >=60 then
		mnatk_new = ( 1 + ( 60 - 20 ) / 120 ) * mnatk + ( Lv - 60 ) * 5
		LG("Boat_plus_MNatk","Ship level lower than 4")

		return mnatk_new
	end
	

end

function Boat_plus_MXATk( Lv , mxatk)
	local mxatk_new = 0
	
	if Lv < 1 then
		LG("Boat_plus_MXatk","Ship level is lower than 1")
		return mxatk_new
	end
	
	if Lv > 100 then
		LG("Boat_plus_MXatk","Ship level higher than 100")
		return mxatk_new
	end
	
	if Lv < 60 then
		mxatk_new = ( 1 + ( Lv - 20 ) / 120 ) * mxatk
		return mxatk_new
	end
	
	if Lv >=60 then
		mxatk_new = ( 1 + ( 60 - 20 ) / 120 ) * mxatk + ( Lv - 60 ) * 5
		return mxatk_new
	end
	

end

function Boat_plus_def ( Lv , def )
	local def_new = 0
	
	if  Lv < 1 then
		LG("Boat_plus_def","Ship level is lower than 1")
		return def
	end
	
	if Lv > 100 then
		LG("Boat_plus_def","Ship level higher than 100")
		return def
	end
	
	if Lv < 60 then
		def_new = ( 1 + ( Lv - 20 ) / 120 ) * def
		LG ( "Boat_plus_def","def_new1 = " ,  def_new ) 
		return def_new

	end
	
	if Lv >= 60 then
		def_new = ( 1 + ( 60 - 20 ) / 120 ) * def + ( Lv - 60 ) * 3
		LG ( "Boat_plus_def","def_new2 = " ,  def_new ) 
		return def_new
	end
	

end

function Boat_plus_Mxhp ( Lv , Mxhp )
	local Mxhp_new = 0
	
	if Lv < 1 then
		LG("Boat_plus_Mxhp","Ship level is lower than 1")
		return Mxhp
	end
	
	if Lv > 100 then
		LG("Boat_plus_Mxhp","Ship level higher than 100")
		return Mxhp
	end
	
	if Lv < 60 then
		Mxhp_new = ( 1 + ( Lv - 20 ) / 120 ) * Mxhp
		LG ( "Boat_plus_def","def_new2 = " ,  Mxhp_new ) 
		return Mxhp_new
	end
	
	if Lv >= 60 then
		Mxhp_new = ( 1 + ( 60 - 20 ) / 120 ) * Mxhp + (Lv - 60 )  * 20
		LG ( "Boat_plus_def","def_new2 = " ,  Mxhp_new ) 
		return Mxhp_new
	end
end

function Boat_plus_Mspd ( Lv , Mspd )
	local Mspd_new = 0

	if Lv < 1 then
		LG("Boat_plus_Mspd","Ship level is lower than 1")
		return Mspd
	end
	
	if Lv >100 then
		LG("Boat_plus_Mspd","Ship level higher than 100")
		return Mspd
	end
	
	if Lv < 60 then
		Mspd_new = ( 1 + ( Lv -30) / 300 ) * Mspd
		return Mspd_new
	end

	if Lv >=60 then
		Mspd_new = ( 1 + ( 60 -30) / 300 ) * Mspd
		return Mspd_new
	end

end

--???????
function get_cha_guild_id(cha) 
    local ply_cha = CheckChaRole(cha) 
    if ply_cha == 1 then --????
        return GetChaGuildID(cha) 
    else 
        local map_copy = GetChaMapCopy(cha)
        local side_id = GetChaSideID(cha) 
		if side_id == 1 then
			return GetMapCopyParam2(map_copy, 4 ) 
		elseif side_id == 2 then
			return GetMapCopyParam2(map_copy, 3 ) 
		end
    end 

end

--????cha1,cha2???????
--??????1,????0
function is_teammate(cha1, cha2) 
    if cha1 == 0 or cha2 == 0 then 
        return 0 
    end 
    if cha1 == cha2 then 
        return 1 
    end
    local ply1 = GetChaPlayer(cha1) 
    local ply2 = GetChaPlayer(cha2) 
    if ply1 ~= 0 and ply2 ~= 0 then 
        if ply1 == ply2 then 
            return 1 
        end 
        local team_id1, team_id2 
        team_id1 = GetChaTeamID(cha1) 
        team_id2 = GetChaTeamID(cha2) 
        if team_id1 ~= 0 and team_id2 ~= 0 and team_id1 == team_id2 then 
            return 1 
        end 
    end 

    return 0 
end 

--????cha2???cha1????
--??????1,????0
function is_friend(cha1, cha2) 
--	SystemNotice ( cha1, "transferis_friend" ) 
    local friend_target = 1 
    local Map_type = GetChaMapType( cha1 )
    if CheckChaRole( cha1 ) == 0 and Map_type ~= 2 then			--??cha1???????????,?cha2??????,cha2?????
	if CheckChaRole( cha2 ) == 0 then							
		return 1 
	else 
		return 0 
	end 

    end
	   
--		SystemNotice ( cha1 , "1" ) 
--		SystemNotice ( cha1 , "Map_type ="..Map_type ) 
--	    if Map_type == 4 then									--??PK??????
--		local team = is_teammate(cha1, cha2) 
--		if team == 1 then 
--			return 1 
--		end 
--	    else
--		return 0
--	    end
		if Map_type == 1 then 
			if CheckChaRole ( cha1 ) == 1 then 
					if CheckChaRole( cha2 ) == 0 then							
						return 0 
					else 
						return 1 
					end 

			end 
		end 

		if Map_type == 4 then									--??PK??????
			if Is_NormalMonster (cha1) == 1 then						--??????????????
				if Is_NormalMonster (cha2) == 1 then 
					return 1 
				end 
			end 
			local team = is_teammate(cha1,cha2) 
			if team == 1 then 
				return 1 
			else 
				local guild_id1, guild_id2 
				guild_id1 = get_cha_guild_id(cha1) 
				guild_id2 = get_cha_guild_id(cha2) 
				if guild_id1 ~= 0 and guild_id2 ~= 0 and guild_id1 == guild_id2 then 
					return 1  
				else
					return 0 
				end
			end
			--local team = is_teammate(cha1,cha2) 
			--		if team == 1 then 
			--			return 1 
			--		else 
			--			return 0 
			--		end 
		end 

--	        SystemNotice ( cha1 , "2" ) 

	    if  Map_type ==3 then									--????????????
--		SystemNotice ( cha1 , "1" ) 
		    local team = is_teammate(cha1, cha2) 
--		    		SystemNotice ( cha1 , "2" ) 

		    if team == 1 then 
--		    		SystemNotice ( cha1 , "3" ) 
		        return 1 
		    else 
			return 0 
		    end
		   
	    end

	    if cha1 == 0 or cha2 == 0 then							--????
	        return 0 
	    end 
--		SystemNotice ( cha1 , "3" ) 
	    if Map_type == 2 then									--??PK????
		if Is_NormalMonster (cha1) == 1 then						--??????????????
			if Is_NormalMonster (cha2) == 1 then 
				return 1 
			end 
		end 
		local guild_id1, guild_id2 
		guild_id1 = get_cha_guild_id(cha1) 
		guild_id2 = get_cha_guild_id(cha2) 
		if guild_id1 ~= 0 and guild_id2 ~= 0 and guild_id1 == guild_id2 then 
			return 1 
		else 
			return 0 
		end

	    end 
	    if Map_type == 5 then									--??PK????
--		if Is_NormalMonster (cha1) == 1 then						--??????????????
--			if Is_NormalMonster (cha2) == 1then 
--				return 1 
--			end 
--		end 
		local guild_side_1, guild_side_2 
		guild_side_1 = GetChaSideID(cha1) 
		guild_side_2 = GetChaSideID(cha2) 
		--if guild_side_1 <= 100 and guild_side_1 > 0 and guild_side_2 <= 100 and guild_side_2 > 0 then
		if guild_side_1 == guild_side_2 then
			return 1 
		--elseif
		   --guild_side_1 > 100 and guild_side_1 <= 200 and guild_side_2 > 100 and guild_side_2 <= 200 then
			--return 1
	        else
		        return 0
		end

	    end 
--		SystemNotice ( cha1 , "4" ) 
--------
		--Plant the Bomb--
		------------------
		if Map_type == PTB.Conf.MapType then
			if (GetChaTypeID(cha2) == 1477) then
				return 1
			end
			return PTB.Friendly(cha1, cha2)
		end	
	    return friend_target 
 end 
--	    local is_plycha1 = CheckChaRole(cha1) 
--	    local is_plycha2 = CheckChaRole(cha2) 
--	    local can_PK1 = CheckChaPKState(cha1) 
--	    if can_PK1 == 0 then 
--	        if is_plycha1 ~= 0 and is_plycha2 ~= 0 then 
--	            return 1 
--	        end 
--	        if is_plycha1 == 0 and is_plycha2 == 0 then 
--	            return 1 
--	        end 
--	    end 
  --  end
--    return 0
-- end 

--?????
function Is_NormalMonster ( role )
  local cha = TurnToCha ( role )
  local Cha_Num = GetChaTypeID( cha )
  
  for i = 0 , UnNormalMonster_Num , 1 do
	if Cha_Num == UnNormalMonster_ID [i] then
		return 0
	end
  end
  

  return 1
  
end

--?????????????
function CheckMonsterDead ( role )
	if role == nil then
		return 1
	end
	if Hp(role) <= 0 then
		return 1
	end
	return 0
end

--????????
function ReCheck_Skill_Dmg ( MaxDmg , MinDmg , Ran )

	local a = 0
	a = Percentage_Random ( Ran / 100)
	if a == 1 then
	
		return MaxDmg
	else
	
		return MinDmg
	end
end

--??PK??????
function ReCheck_PK_Lv ( ATKER , DEFER )
	local Lv_atker = Lv ( ATKER )
	local Lv_defer = Lv ( DEFER )
	return Lv_atker - Lv_defer
end



--PK??????
function after_player_kill_player( ATKER, DEFER )

	SetCharaAttr(0, DEFER, ATTR_SP)
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	
	local MGPK_MapNameNum = 10
	local MGPK_MapName = {}
	
	MGPK_MapName[0]  = "puzzleworld"
	MGPK_MapName[1]  = "puzzleworld2"
	MGPK_MapName[2]  = "abandonedcity"
	MGPK_MapName[3]  = "abandonedcity2"
	MGPK_MapName[4]  = "abandonedcity3"
	MGPK_MapName[5]  = "darkswamp"
	MGPK_MapName[6]  = "hell"
	MGPK_MapName[7]  = "hell2"
	MGPK_MapName[8]  = "hell3"
	MGPK_MapName[9]  = "hell4"
	MGPK_MapName[10] = "hell5"
	
	local ATKER_Get_Ry = 0
	local DEFER_Get_Ry = 0
	
	local ATKER_Get_chaos = 0
	local DEFER_Get_chaos = 0
	local DEFER_Get1_Ry = 0
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" or map_name_ATKER == "07xmas2" or map_name_DEFER == "07xmas2" then
		local Lv_ATKER = Lv( ATKER )
		local Lv_DEFER = Lv( DEFER )
		local Lv_dif = Lv_ATKER - Lv_DEFER
		-- Равные уровни
		if Lv_ATKER == Lv_DEFER then
			ATKER_Get_chaos = 5
			DEFER_Get_chaos = -3
			SystemNotice ( ATKER , "Вы побеждаете противника и получаете 5 очков хаоса!" )
			SystemNotice ( DEFER , "Вас победил противник. Потеряно 3 очка хаоса!")
		end
		-- Уровень атакующего больше на 5
		if Lv_dif >= 1 and Lv_dif <= 5 then
			ATKER_Get_chaos = 5
			DEFER_Get_chaos = -3
			SystemNotice ( ATKER , "Вы побеждаете противника и получаете 5 очков хаоса!" )
			SystemNotice ( DEFER , "Вас победил противник. Потеряно 3 очка хаоса!")
		end
		-- Уровень атакующего больше на 10
		if Lv_dif >= 6 and Lv_dif <= 10 then
			ATKER_Get_chaos = 3
			DEFER_Get_chaos = -2
			SystemNotice ( ATKER , "Вы побеждаете противника и получаете 3 очка хаоса!" )
			SystemNotice ( DEFER , "Вас победил противник. Потеряно 2 очка хаоса!")
		end
		-- Уровень атакующего больше на 15
		if Lv_dif >= 11 and Lv_dif <= 15 then
			ATKER_Get_chaos = 2
			DEFER_Get_chaos = -1
			SystemNotice ( ATKER , "Вы побеждаете слабого противника и получаете 2 очка хаоса!" )
			SystemNotice ( DEFER , "Вас победил сильный противник. Потеряно 1 очко хаоса!")
		end
		-- Уровень атакующего больше 16
		if Lv_dif >= 16 then
			ATKER_Get_chaos = 1
			DEFER_Get_chaos = 0
			SystemNotice ( ATKER , "Вы побеждаете очень слабого противника и получаете 1 очка хаоса!" )
			SystemNotice ( DEFER , "Вас победил очень сильный противник. Хаос очки не теряются!")
		end
		-- Уровень атакующего меньше на 5
		if Lv_dif <= -1 and Lv_dif >= -5 then
			ATKER_Get_chaos = 5
			DEFER_Get_chaos = -3
			SystemNotice ( ATKER , "Вы побеждаете противника и получаете 3 очка хаоса!" )
			SystemNotice ( DEFER , "Вас победил противник. Потеряно 2 очка хаоса!")
		end
		-- Уровень атакующего меньше на 10
		if Lv_dif <= -6 and Lv_dif >= -10 then
			ATKER_Get_chaos = 7
			DEFER_Get_chaos = -4
			SystemNotice ( ATKER , "Вы побеждаете противника и получаете 3 очка хаоса!" )
			SystemNotice ( DEFER , "Вас победил противник. Потеряно 2 очка хаоса!")
		end
		-- Уровень атакующего меньше на 15
		if Lv_dif <= -11 and Lv_dif >= -15 then
			ATKER_Get_chaos = 9
			DEFER_Get_chaos = -5
			SystemNotice ( ATKER , "Вы побеждаете сильного противника и получаете 9 очков хаоса!" )
			SystemNotice ( DEFER , "Вас победил слабый противник. Потеряно 5 очков хаоса!")
		end
		-- Уровень атакующего меньше 16
		if Lv_dif <= -16 then
			ATKER_Get_chaos = 10
			DEFER_Get_chaos = -7
			SystemNotice ( ATKER , "Вы побеждаете очень сильного противника и получаете 10 очков хаоса!" )
			SystemNotice ( DEFER , "Вас победил очень слабый противник. Потеряно 7 очков хаоса!")
		end

--		local RongyuTpye = ITEMATTR_VAL_STR
--		local Kill_Num = 1
--		local Kill_attr = ITEMATTR_VAL_AGI
--		local Killed_attr = ITEMATTR_VAL_DEX
		local ATKER_medal = GetChaItem2 ( ATKER , 2 , 3849 )
		local DEFER_medal = GetChaItem2 ( DEFER , 2 , 3849 )
		local AtkerPoint = GetItemAttr ( ATKER_medal , ITEMATTR_MAXENERGY )
		local DeferPoint = GetItemAttr ( DEFER_medal , ITEMATTR_MAXENERGY )
		local AtkerPoint = AtkerPoint + ATKER_Get_chaos
		local DeferPoint = DeferPoint + DEFER_Get_chaos
			if DeferPoint <= 0 then
				DeferPoint = 0
			end
			if ATKER == DEFER then
				ATKER_Get_chaos = ATKER_Get_chaos - 1
			end
		SetItemAttr ( ATKER_medal , ITEMATTR_MAXENERGY , AtkerPoint)
		SetItemAttr ( DEFER_medal , ITEMATTR_MAXENERGY , DeferPoint)
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local map_copy = GetChaMapCopy ( ATKER )

		MapCopyNotice ( map_copy , Notice_map )
	
	end
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\213\224\238\241] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 ["..atk_name.."]"
		Notice ( Notice_all )
	end

	if map_name_ATKER == "07xmas2" or map_name_DEFER == "07xmas2" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\209\237\229\230\237\251\233 \194\238\233\237\251] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 ["..atk_name.."]"
		Notice ( Notice_all )
	end

	if map_name_ATKER == "heilong" or map_name_DEFER == "heilong" or map_name_ATKER == "heilong2" or map_name_DEFER == "heilong2" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "В Логовое Черного Дракона: ["..def_name.."] терпит поражение от ["..atk_name.."]"
		Notice ( Notice_all )
	end

	if map_name_ATKER == "jialebi" or map_name_DEFER == "jialebi" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\203\224\227\229\240\252 \204\184\240\242\226\251\245 \196\243\248] \200\227\240\238\234 "..def_name.." \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 "..atk_name.." "
		Notice ( Notice_all )
	end
	
	if map_name_ATKER == "magicsea" or map_name_DEFER == "magicsea" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\216\224\233\242\224\237] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 ["..atk_name.."]"
		Notice ( Notice_all )
	end
	
		if map_name_ATKER == "farmer1" or map_name_DEFER == "farmer1" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\206\241\242\240\238\226 \209\234\238\240\225\232] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 ["..atk_name.."]"
		Notice ( Notice_all )
	end

	if map_name_ATKER == "Hellchapter" or map_name_DEFER == "Hellchapter" then
                local atk_name = GetChaDefaultName ( ATKER )
                local def_name = GetChaDefaultName ( DEFER )
                local Notice_all = "[\192\228] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 ["..atk_name.."]"
                Notice ( Notice_all )
        end
		
	if map_name_ATKER == "bountypk" or map_name_DEFER == "bountypk" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\192\240\229\237\224] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 ["..atk_name.."]"
		Notice ( Notice_all )
	end
	
	if map_name_ATKER == "prisonisland" or map_name_DEFER == "prisonisland" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "[\206\241\242\240\238\226 \196\240\224\234\238\237\238\226] \200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 \232\227\240\238\234\224 ["..atk_name.."]"
		Notice ( Notice_all )
	end
	
	if map_name_ATKER == "teampk" or map_name_DEFER == "teampk" then
		local ATKER_RYZ = GetChaItem2 ( ATKER , 2 , 3849 )
		local DEFER_RYZ = GetChaItem2 ( DEFER , 2 , 3849 )
		local Lv_ATKER = Lv( ATKER )
		local Lv_DEFER = Lv( DEFER )
		local Lv_dif = Lv_ATKER - Lv_DEFER
		if Lv_dif < 10 and Lv_dif > -5 then
			ATKER_Get_Ry = 1
			DEFER_Get_Ry = -1
			--SystemNotice ( ATKER ,"Вы победили противника. Получено очков чести: "..ATKER_Get_Ry )
			--SystemNotice ( DEFER ,"Вы потерпели поражение. Потеряно очков чести: "..ATKER_Get_Ry )
		end
		
		if Lv_dif >= 10 then
			ATKER_Get_Ry = 0
			DEFER_Get_Ry = 0
			--SystemNotice ( ATKER , "Уровень побежденного противника слишком мал. Вы не получаете очков чести" )
		end
		
		if Lv_dif < -5 then
			ATKER_Get_Ry = 2
			DEFER_Get_Ry = -2
			--SystemNotice ( ATKER ,"Вы победили сильного противника и получаете "..ATKER_Get_Ry.." очков чести" )
			--SystemNotice ( DEFER ,"Вы убиты слабым игроком и теряете "..ATKER_Get_Ry.." очков чести" )
		end

		local RongyuTpye = ITEMATTR_VAL_STR
		local Kill_Num = 1
		local Kill_attr = ITEMATTR_VAL_AGI
		local Killed_attr = ITEMATTR_VAL_DEX
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local map_copy = GetChaMapCopy ( ATKER )
		local Notice_map = "["..def_name.."] \238\242\245\226\224\242\232\235 \226 \228\243\253\235\229 \238\242 ["..atk_name.."]"
--		SystemNotice( ATKER ,"Honor point gained")
		Add_ItemAttr_RYZ ( ATKER , ATKER_RYZ , RongyuTpye , ATKER_Get_Ry )
--		SystemNotice( ATKER , "Increases Kill count by")
		Add_ItemAttr_RYZ ( ATKER , ATKER_RYZ , Kill_attr , Kill_Num )
--		SystemNotice( DEFER ,"was killed. Honor points deducted by")
		Add_ItemAttr_RYZ ( DEFER ,DEFER_RYZ , RongyuTpye , DEFER_Get_Ry )
--		SystemNotice( DEFER , "Defeat Count increases by")	
		Add_ItemAttr_RYZ ( DEFER ,DEFER_RYZ , Killed_attr , Kill_Num )
		MapCopyNotice ( map_copy , Notice_map )

	end
	
	if map_name_ATKER == "secretgarden" or map_name_DEFER == "secretgarden" then
		local atk_name = GetChaDefaultName ( ATKER )
		local def_name = GetChaDefaultName ( DEFER )
		local Notice_all = "["..def_name.."] терпит поражение от ["..atk_name.."]"
		Notice ( Notice_all )
	end


	if map_name_ATKER == "guildwar" or map_name_DEFER == "guildwar" then

		local ATKER = TurnToCha ( ATKER )
		local DEFER = TurnToCha ( DEFER )
		--local Cha = TurnToCha(role) 
		local Num_shengsi_1= CheckBagItem(DEFER,2382)
                --Notice("Num_shengsi"..Num_shengsi)
	if Num_shengsi_1 >=1 then
		TakeItem( DEFER, 0,2382, 1 )    
                GiveItem ( ATKER , 0 , 2383  , 1 , 4 )
	
        else
	   if GetChaGuildID(DEFER) <= 100 and GetChaGuildID(DEFER) > 0 then
              GiveItem ( ATKER , 0 , 2858  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) > 100 and GetChaGuildID(DEFER) <= 200 then
	      GiveItem ( ATKER , 0 , 2859  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) == 0 then
		SystemNotice ( ATKER , "Цель не относится ни к Флоту, ни к Пиратам" )
	   end
	end
     end

   	if map_name_ATKER == "guildwar2" or map_name_DEFER == "guildwar2" then

		local ATKER = TurnToCha ( ATKER )
		local DEFER = TurnToCha ( DEFER )
		--local Cha = TurnToCha(role) 
		local Num_shengsi_2= CheckBagItem(DEFER,2382)
                --Notice("Num_shengsi"..Num_shengsi)
	if Num_shengsi_2 >=1 then
		TakeItem( DEFER, 0,2382, 1 )   
                GiveItem ( ATKER , 0 , 2383  , 1 , 4 )
	
        else
	   if GetChaGuildID(DEFER) <= 100 and GetChaGuildID(DEFER) > 0 then
              GiveItem ( ATKER , 0 , 2858  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) > 100 and GetChaGuildID(DEFER) <= 200 then
	      GiveItem ( ATKER , 0 , 2859  , 1 , 4 )
	   end
	   if GetChaGuildID(DEFER) == 0 then
			SystemNotice ( ATKER , "Цель не относится ни к Флоту, ни к Пиратам" )
	   end
	end
     end

	------
	-- Убийство в данжах
    local C_Map = 0
	for C_Map = 0 , MGPK_MapNameNum , 1 do
	    if  map_name_ATKER == MGPK_MapName[C_Map] then
	    
			local atk_name = GetChaDefaultName ( ATKER )
			local def_name = GetChaDefaultName ( DEFER )
			local map_copy = GetChaMapCopy ( ATKER )
			local Notice_map = "\200\227\240\238\234 ["..def_name.."] \242\229\240\239\232\242 \239\238\240\224\230\229\237\232\229 \238\242 ["..atk_name.."]"
			
			MapCopyNotice ( map_copy , Notice_map )
			
			ATKER = TurnToCha ( ATKER )
			DEFER = TurnToCha ( DEFER )
			
			local Have_TSWW = CheckBagItem( DEFER , 3846 )
			--ВУДУ
			if Have_TSWW <= 0 then
				Dead_Punish_ItemURE ( DEFER )
				MGPK_Dead_Punish_Exp ( DEFER )
			else
				local j = DelBagItem( DEFER , 3846 , 1 )
				if j == 0 then
					LG ( "NewItem" , "Ошибка при удалении Куклы Вуду" )
				else
					SystemNotice ( DEFER , "Кукла Вуду спасла тебя от потери опыта" )
				end
			end

	    end
	end
	
  if map_name_ATKER == "garner" or map_name_DEFER == "garner" then
		local side_ATKER = GetChaGuildType(ATKER)
        local side_DEFER = GetChaGuildType(DEFER)
        local ATKER_fame = GetChaAttr(ATKER, ATTR_FAME)
        local DEFER_fame = GetChaAttr(DEFER, ATTR_FAME)
        local ATKER_name = GetChaDefaultName(ATKER)
        local DEFER_name = GetChaDefaultName(DEFER)
        local ATKER_lv = GetChaAttr(ATKER, ATTR_LV)
        local DEFER_lv = GetChaAttr(DEFER, ATTR_LV)
        local ATKER_fame_add = 0
        local DEFER_fame_del = 0
        local rep_add_atker = 0
        local rep_del_defer = 0
        local honor_add = 0
        local ATKER_medal = GetChaItem2(ATKER, 2, 3849)
        local medal_num = CheckBagItem(ATKER, 3849)
        local Lv_dif = ATKER_lv - DEFER_lv
        local bonus = 2
        if Lv_dif < 21 then
            if side_ATKER == 1 and side_DEFER == 2 or side_ATKER == 2 and side_DEFER == 1 then
                    local percent = 2
                    local factor = 2
                   
                    if Lv_dif > 10 and Lv_dif < 20 then
                        rep_add_atker = math.floor(factor + DEFER_fame/100*percent/2)
                    elseif Lv_dif < -10 and Lv_dif < 0 then
                        rep_add_atker = math.floor(bonus*(factor + DEFER_fame/100*percent))
                        SystemNotice(ATKER, "\207\238\225\229\230\228\229\237 \238\247\229\237\252 \241\232\235\252\237\251\233 \239\240\238\242\232\226\237\232\234. "..bonus.."-\233 \225\238\237\243\241!")
                    else
                        rep_add_atker = math.floor(factor + DEFER_fame/100*percent)
                    end
                    if Lv_dif < -10 and Lv_dif < 0 then
                        rep_del_defer = math.floor(DEFER_fame/100*percent*bonus)
                        SystemNotice(DEFER, "\194\224\241 \239\238\225\229\228\232\235 \241\235\224\225\251\233 \239\240\238\242\232\226\237\232\234! "..bonus.."-\255 \239\238\242\229\240\255 \240\229\239\243\242\224\246\232\232!")
                    else
                        rep_del_defer = math.floor(DEFER_fame/100*percent)
                    end
                     ATKER_fame_add = rep_add_atker + ATKER_fame
                     DEFER_fame_del = DEFER_fame - rep_del_defer
                        if medal_num == 0 then
                            SystemNotice(ATKER, "\211 \194\224\241 \237\229\242 \236\229\228\224\235\232 \238\242\226\224\227\232. \194\251 \237\229 \239\238\235\243\247\224\229\242\229 \238\247\234\232 \247\229\241\242\232.")
                        else
                            local ATKER_honor = GetItemAttr(ATKER_medal, ITEMATTR_VAL_STR)
                            honor_add = 2
                            SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..honor_add.." \238\247\234\224 \247\229\241\242\232.")
                        end
                    SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..rep_add_atker.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
                    SystemNotice(DEFER, "\207\238\242\229\240\255\237\238 "..rep_del_defer.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
            elseif side_ATKER == 2 and side_DEFER == 2 then
                    local percent = 1
                    local factor = 1
                    if Lv_dif > 10 and Lv_dif < 20 then
                        rep_add_atker = math.floor(factor + DEFER_fame/100*percent/2)
                    elseif Lv_dif < -10 and Lv_dif < 0 then
                        rep_add_atker = math.floor(bonus*(factor + DEFER_fame/100*percent))
                        SystemNotice(ATKER, "\207\238\225\229\230\228\229\237 \238\247\229\237\252 \241\232\235\252\237\251\233 \239\240\238\242\232\226\237\232\234. "..bonus.."-\233 \225\238\237\243\241!")
                    else
                        rep_add_atker = math.floor(factor + DEFER_fame/100*percent)
                    end
                    if Lv_dif < -10 and Lv_dif < 0 then
                        rep_del_defer = math.floor(DEFER_fame/100*percent*bonus)
                        SystemNotice(DEFER, "\194\224\241 \239\238\225\229\228\232\235 \241\235\224\225\251\233 \239\240\238\242\232\226\237\232\234! "..bonus.."-\255 \239\238\242\229\240\255 \240\229\239\243\242\224\246\232\232!")
                    else
                        rep_del_defer = math.floor(DEFER_fame/100*percent)
                    end
                    ATKER_fame_add = rep_add_atker + ATKER_fame
                    DEFER_fame_del =  DEFER_fame - rep_del_defer
                        if medal_num == 0 then
                            SystemNotice(ATKER, "\211 \194\224\241 \237\229\242 \236\229\228\224\235\232 \238\242\226\224\227\232. \194\251 \237\229 \239\238\235\243\247\224\229\242\229 \238\247\234\232 \247\229\241\242\232.")
                        else
                            local ATKER_honor = GetItemAttr(ATKER_medal, ITEMATTR_VAL_STR)
                            honor_add = 1
                            SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..honor_add.." \238\247\234\238 \247\229\241\242\232.")
                        end
                    SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..rep_add_atker.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
                    SystemNotice(DEFER, "\207\238\242\229\240\255\237\238 "..rep_del_defer.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
            else       
                    local percent = 1
                    if Lv_dif > 10 and Lv_dif < 20 then
                        rep_add_atker = math.floor(DEFER_fame/100*percent/2)
                    elseif Lv_dif < -10 and Lv_dif < 0 then
                        rep_add_atker = math.floor(DEFER_fame/100*percent*bonus)
                        SystemNotice(ATKER, "\207\238\225\229\230\228\229\237 \238\247\229\237\252 \241\232\235\252\237\251\233 \239\240\238\242\232\226\237\232\234. "..bonus.."-\233 \225\238\237\243\241!")
                    else
                        rep_add_atker = math.floor(DEFER_fame/100*percent)
                    end
                    if Lv_dif < -10 and Lv_dif < 0 then
                        rep_del_defer = math.floor(DEFER_fame/100*percent*bonus)
                        SystemNotice(DEFER, "\194\224\241 \239\238\225\229\228\232\235 \241\235\224\225\251\233 \239\240\238\242\232\226\237\232\234! "..bonus.."-\255 \239\238\242\229\240\255 \240\229\239\243\242\224\246\232\232!")
                    else
                        rep_del_defer = math.floor(DEFER_fame/100*percent)
                    end
                    ATKER_fame_add = ATKER_fame  + rep_add_atker
                    DEFER_fame_del = DEFER_fame - rep_del_defer
                        if medal_num == 0 then
                            SystemNotice(ATKER, "\211 \194\224\241 \237\229\242 \236\229\228\224\235\232 \238\242\226\224\227\232. \194\251 \237\229 \239\238\235\243\247\224\229\242\229 \238\247\234\232 \247\229\241\242\232.")
                        else
                            local ATKER_honor = GetItemAttr(ATKER_medal, ITEMATTR_VAL_STR)
                            honor_add = 1
                            SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..honor_add.." \238\247\234\238 \247\229\241\242\232.")
                        end
                    SystemNotice(ATKER, "\207\238\235\243\247\229\237\238 "..rep_add_atker.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
                    SystemNotice(DEFER, "\207\238\242\229\240\255\237\238 "..rep_del_defer.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
            end
                    if rep_add_atker < 0 then
                        Notice("\200\227\240\238\234 "..ATKER_name.." \239\238\225\229\230\228\224\229\242 \232\227\240\238\234\224 "..DEFER_name..".")
                    else
                        if medal_num == 1 then
                          --  Notice("\200\227\240\238\234 "..ATKER_name.." \239\238\225\229\230\228\224\229\242 \232\227\240\238\234\224 "..DEFER_name.." \232 \239\238\235\243\247\224\229\242 "..rep_add_atker.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232 \232 "..honor_add.." \238\247\234\238(\234\224) \247\229\241\242\232.")   
                        else
                          --  Notice("\200\227\240\238\234 "..ATKER_name.." \239\238\225\229\230\228\224\229\242 \232\227\240\238\234\224 "..DEFER_name.." \232 \239\238\235\243\247\224\229\242 "..rep_add_atker.." \238\247\234\238\226 \240\229\239\243\242\224\246\232\232.")
                        end
                        SetChaAttrI(ATKER, ATTR_FAME, ATKER_fame_add)
                        SetChaAttrI(DEFER, ATTR_FAME, DEFER_fame_del)
                        Add_ItemAttr_RYZ(ATKER, ATKER_medal, ITEMATTR_VAL_STR, honor_add)
                        RefreshCha(ATKER)
                        RefreshCha(DEFER)
                    end
        else
                SystemNotice(ATKER, "\207\238\225\229\230\228\229\237 \241\235\232\248\234\238\236 \241\235\224\225\251\233 \239\240\238\242\232\226\237\232\234. \206\247\234\232 \240\229\239\243\242\224\246\232\232 \237\229 \239\238\235\243\247\229\237\251.")
                SystemNotice(DEFER, "\194\224\241 \239\238\225\229\228\232\235 \241\235\232\248\234\238\236 \241\232\235\252\237\251\233 \239\240\238\242\232\226\237\232\234. \206\247\234\232 \247\229\241\242\232 \237\229 \239\238\242\229\240\255\237\251.")
               --Notice("\200\227\240\238\234 "..ATKER_name.." \239\238\225\229\230\228\224\229\242 \232\227\240\238\234\224 "..DEFER_name..". \210\224\234 \234\224\234 "..ATKER_name.." \231\237\224\247\232\242\229\235\252\237\238 \241\232\235\252\237\229\229 \241\226\238\229\227\238 \239\240\238\242\232\226\232\237\232\234\224  (\240\224\231\237\232\246\224 "..Lv_dif.." \243\240\238\226\237\229\233) \238\247\234\232 \240\229\239\243\242\224\246\232\232 \232 \247\229\241\242\232 \238\237 \237\229 \239\238\235\243\247\224\229\242.")
        end
    end
 
end
--??PK??????
function MGPK_Dead_Punish_Exp ( dead )
	local map_name = GetChaMapName ( dead )
	dead = TurnToCha ( dead ) 
	local lv = GetChaAttr( dead, ATTR_LV ) 
	local exp_red 
	local exp = Exp(dead) 
	local nlexp = GetChaAttrI ( dead , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( dead , ATTR_CLEXP ) 
	local exp_per = math.min ( math.floor ( ( nlexp - clexp ) * 0.02 ) , math.max ( exp - clexp , 0 ) )	---?????????
	if  exp <= clexp then 
		exp_red = 0 
	else 
		exp_red = math.pow( lv , 2 ) * 20								---????????
	end 
	
	if exp_red > exp_per then										---???????????
		exp_red = exp_per
	end

	if Lv ( dead ) >= 80 then 
		exp_red = math.floor ( exp_red / 50 )
		exp_red_80 = exp_red * 50 
		SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
	else 
		SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
	end
	
	exp = Exp(dead) - exp_red

	SetChaAttrI( dead , ATTR_CEXP , exp ) 
	
	local name = GetChaDefaultName ( dead )
	
	LG ( "PKdie_exp" , "Character Name" , name , "Current Lv= ", lv , "Death EXP penalty= " , exp_red )
end 



--???????
function Add_ItemAttr_RYZ ( Cha_role ,role , attrtype , Num )
	local i = 0
	local attr_num = GetItemAttr ( role , attrtype )
--	SystemNotice ( Cha_role , "Operation antenumber value"..attr_num )
--	SystemNotice ( Cha_role , "Operation Value"..Num )
--	SystemNotice ( Cha_role , "Operation attribute"..attrtype )
	attr_num = attr_num + Num
	i = SetItemAttr ( role ,attrtype , attr_num )
	local attr_num_1 = GetItemAttr ( role , attrtype )
--	SystemNotice ( Cha_role , "value after operation"..attr_num_1 )
	if i == 0 then
		LG("RYZ_PK","add Honor attribute failed")
	end
	
end


--???????

--????
--??:????
--???:????
function Get_ItemAttr_Join ( Cha_role )

	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( Cha_role,3849 )

	if RYZ_Num <= 0 then
		return 0
	end

	local role_RYZ = GetChaItem2 ( Cha_role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_CON
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	return attr_num
	
end

--????
--??:????
--???:????
function Get_ItemAttr_Win ( Cha_role )

	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( Cha_role,3849 )

	if RYZ_Num <= 0 then
		return 0
	end	

	local role_RYZ = GetChaItem2 ( Cha_role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STA
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	return attr_num
	
end

--?????

function AddYongYuZhi( role ,  value )
	
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0 then
		SystemNotice ( role , "Does not possess Medal of Valor" )
		return 0
	
	end
	
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STR
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	local attr_num = attr_num + value
	local i = 0
	SetChaKitbagChange ( role , 0 )
	i = SetItemAttr ( role_RYZ ,attrtype , attr_num )
	
	if i == 0 then 
		return 0
	end
	if value > 0 then
		SystemNotice ( role , "Increases Honor points by "..value )
	end
	if value < 0 then
		local a = -1 * value
		SystemNotice ( role , "Deduct Honor Point"..a )
	end

	SynChaKitbag ( role , 7 )
	return 1
end



--????????
function TakeZuDuiGongXianDu( role , value )
	
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0 then
		SystemNotice ( role , "Does not possess Medal of Valor" )
		return 0
	
	end
	
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	local attr_num = attr_num - value
	local i = 0
	SetChaKitbagChange ( role , 0 )
	i = SetItemAttr ( role_RYZ ,attrtype , attr_num )
	
	if i == 0 then 
		return 0
	end
	if value < 0 then
		local a = value * -1
		SystemNotice ( role ,"Obtained Party Contribution points"..a )
	end
	if value > 0 then
		SystemNotice ( role ,"Party Contribution points deducted:"..value )
		LG("RYZ_Take_Zdgx" , " uses Team Contribution points, deducts "..value.."point")
	end
	SynChaKitbag ( role , 7 )
	return 1
end



--??????????????
function HasZuDuiGongXianDu ( role ,value )
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0 then
		return 0
	end

	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if attr_num >= value then
		return 1
	else
		return 0
	end
end

--???????????
function LessYongYuZhi( role , str , value )
		local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0 then
		return 0
	end

	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_VAL_STR
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if str == ">" then
		if attr_num > value then
			return 1
		end
	elseif str == "<" then
		if attr_num < value then
			return 1
		end
	elseif str == "=" then
		if attr_num == value then
			return 1
		end
	else
		LG("RYZ_PK","determine Honor character error")
	end


end

--???????????
function Add_RYZ_TeamPoint ( role ,count_num , add_num )
	local RYZ_Num = 0
	RYZ_Num = CheckBagItem( role,3849 )

	if RYZ_Num <= 0 then
		return
	end
	local role_RYZ = GetChaItem2 ( role , 2 , 3849 )
	local attrtype = ITEMATTR_MAXURE
	local attr_num = GetItemAttr ( role_RYZ , attrtype )
	if attr_num >= 1000 then
		return
	end
	attr_num = attr_num + add_num
	local a = math.min ( 1 , ( count_num - 2 ) * 0.3 )
	local b = 0
	b = Percentage_Random ( a )
	local i = 0
	if b == 1 then

		SetChaKitbagChange ( role , 0 )
		i = SetItemAttr ( role_RYZ ,attrtype , attr_num )

		if i == 0 then
			LG("RYZ_PK","Increase Party Contribution value failed")
			return
		end
		SynChaKitbag ( role , 7 )
	
		SystemNotice ( role ,"Obtain "..add_num.." point(s) of Team Contribution point")
	end
end

	

--????--------------------------------------------

--?????????

function Take_Atk_ItemURE ( role )
--	SystemNotice( role ,"deducts attacker weapon durability")
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 1 and boat == 0 then					---?????
--		SystemNotice ( role ,"starts to deduct")
		local Item_1 = 0
		local Item_2 = 0
		Item_1 = GetChaItem ( role , 1 , 6 )
		Item_2 = GetChaItem ( role , 1 , 9 )
		
		local Item_URE = 0
		local Take_Num = 1
		local i = 0
		local Item1_Type = Check_Repair_ItemType ( Item_1 )
		local Item2_Type = Check_Repair_ItemType ( Item_2 )
		
		if Item_1 ~= 0 and Item_1 ~= nil then
--			SystemNotice (role , "Left hand")
			local a = 0.03
			local b = Percentage_Random (a)
			
			if b == 1 and Item1_Type == 1 then
--				SystemNotice (role , "start to deduct left hand")
				Item_URE = GetItemAttr ( Item_1 , ITEMATTR_URE )
				if Item_URE < 50 then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_1 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","Weapon imbue failed")
				end
				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 6 , 0 )
				end
			end
		end
		
		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_2 ~= 0 and Item_2 ~= nil then
--			SystemNotice ( role ,"Right hand")
			local a = 0.03
			local b = Percentage_Random (a)
			if b == 1 and Item2_Type == 1 then
--				SystemNotice(role ,"start to deduct right hand")
				Item_URE = GetItemAttr ( Item_2 , ITEMATTR_URE )

				if Item_URE < 50 then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_2 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","Weapon imbue failed")
				end
				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 9 , 0 )
				end
			end
		end
	end


	
end

--?????????

function Take_Def_ItemURE ( role )
	local def = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if def == 1 and boat == 0 then						--?????
		local Item_1 = 0
		local Item_2 = 0
		local Item_3 = 0
		local Item_4 = 0

		Item_1 = GetChaItem ( role , 1 , 0 )
		Item_2 = GetChaItem ( role , 1 , 2 )
		Item_3 = GetChaItem ( role , 1 , 3 )
		Item_4 = GetChaItem ( role , 1 , 4 )
		
		local Item_URE = 0
		local Take_Num = 1
		local i = 0

		if Item_1 ~= 0 and Item_1 ~= nil then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1 then
				Item_URE = GetItemAttr ( Item_1 , ITEMATTR_URE )

				if Item_URE < 50 then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				

				i = SetItemAttr ( Item_1 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","add armor attribute failed")
				end
				
				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 0 , 0 )
				end
			end
		end
		
		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_2 ~= 0 and Item_2 ~= nil then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1 then
				Item_URE = GetItemAttr ( Item_2 , ITEMATTR_URE )

				if Item_URE < 50 then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				
				i = SetItemAttr ( Item_2 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","add armor attribute failed")
				end
				
				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 2 , 0 )
				end
			end
		end

		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_3 ~= 0 and Item_3 ~= nil then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1 then
				Item_URE = GetItemAttr ( Item_3 , ITEMATTR_URE )

				if Item_URE < 50 then
					Take_Num = 0
				end
				
				Item_URE = Item_URE - Take_Num
				
				
				i = SetItemAttr ( Item_3 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","add armor attribute failed")
				end

				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 3 , 0 )
				end
			end
		end

		Item_URE = 0
		Take_Num = 1
		i = 0
		
		if Item_4 ~= 0 and Item_4 ~= nil then
			local a = 0.015
			local b = Percentage_Random ( a )
			if b == 1 then
				Item_URE = GetItemAttr ( Item_4 , ITEMATTR_URE )
				
				if Item_URE < 50 then
					Take_Num = 0
				end

				Item_URE = Item_URE - Take_Num
				

				i = SetItemAttr ( Item_4 , ITEMATTR_URE , Item_URE )
				if i == 0 then
					LG("Item_URE","add armor attribute failed")
				end
				
				if Item_URE < 50 and Take_Num ~= 0 then
					SetChaEquipValid ( role , 4 , 0 )
				end
			end
		end
	end
end

--?????????
function Dead_Punish_ItemURE ( role )
	local Player = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	local Punish = 0.05
	
	Dead_Punish_Item_Num = 5							--????????
	
	local Dead_Punish_Item_WZ = { }
	Dead_Punish_Item_WZ [0] = 0
	Dead_Punish_Item_WZ [1] = 2
	Dead_Punish_Item_WZ [2] = 3
	Dead_Punish_Item_WZ [3] = 4
	Dead_Punish_Item_WZ [4] = 6
	Dead_Punish_Item_WZ [5] = 9

	local Dead_Punish_Item = { }
	Dead_Punish_Item [0] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [0] )
	Dead_Punish_Item [1] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [1] )
	Dead_Punish_Item [2] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [2] )
	Dead_Punish_Item [3] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [3] )
	Dead_Punish_Item [4] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [4] )
	Dead_Punish_Item [5] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [5] )

	if Player == 1 and boat == 0 then						--?????
		local Item_URE = 0
		local Item_MAXURE = 0
		local Take_Num = 0
		local i = 0
		local j = 0
		local k = 0								--??????
		for j = 0 , Dead_Punish_Item_Num , 1 do
				
			if Dead_Punish_Item[j] ~= 0 and Dead_Punish_Item[j] ~= nil then
				
				local ItemType_Check = Check_Repair_ItemType ( Dead_Punish_Item[j] )
				if ItemType_Check == 1 then
					Item_URE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE )
					Item_MAXURE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_MAXURE )
					Take_Num = math.floor ( Item_MAXURE * Punish )
					
					if Item_URE >= 50 then
						k = 1
					end

					Item_URE = Item_URE - Take_Num
					
					if Item_URE < 50 then
						Item_URE = 49
						
					end
					
					i = SetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE , Item_URE )
					if i == 0 then
						LG("Item_URE","Normal death deducts attribute failed"..j)
					end
					
					
					
					if k == 1 and Item_URE == 49 then
							SetChaEquipValid ( role , Dead_Punish_Item_WZ [j] , 0 )
					end


				end
				
			end
		end
		--SystemNotice ( role , "Death: 5% penalty off durability of equipment" )
		SystemNotice ( role , "\221\234\232\239\232\240\238\226\234\224 \225\251\235\224 \239\238\226\240\229\230\228\229\237\224 " )
	end

end

--PK???????

function PK_Dead_Punish_ItemURE ( role )
	local Player = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	local Punish = 0.05
	PK_Dead_Punish_Item_Num = 5							--????????
	
	local PK_Dead_Punish_Item_WZ = { }
	PK_Dead_Punish_Item_WZ [0] = 0
	PK_Dead_Punish_Item_WZ [1] = 2
	PK_Dead_Punish_Item_WZ [2] = 3
	PK_Dead_Punish_Item_WZ [3] = 4
	PK_Dead_Punish_Item_WZ [4] = 6
	PK_Dead_Punish_Item_WZ [5] = 9

	local PK_Dead_Punish_Item = { }
	PK_Dead_Punish_Item [0] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [0] )
	PK_Dead_Punish_Item [1] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [1] )
	PK_Dead_Punish_Item [2] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [2] )
	PK_Dead_Punish_Item [3] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [3] )
	PK_Dead_Punish_Item [4] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [4] )
	PK_Dead_Punish_Item [5] = GetChaItem ( role , 1 , PK_Dead_Punish_Item_WZ [5] )
	if Player == 1 and boat == 0 then						--?????
		local Item_URE = 0
		local Item_MAXURE = 0
		local Take_Num = 0
		local i = 0
		local j = 0
		local k = 0								--??????
		for j = 0 , PK_Dead_Punish_Item_Num , 1 do
				
			if PK_Dead_Punish_Item[j] ~= 0 and PK_Dead_Punish_Item[j] ~= nil then
				local ItemType_Check = Check_Repair_ItemType ( PK_Dead_Punish_Item[j] )
				
				if ItemType_Check == 1 then

					Item_URE = GetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_URE )
					Item_MAXURE = GetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_MAXURE )
					Take_Num = math.floor ( Item_MAXURE * Punish )
					
					if Item_URE >= 50 then
						k = 1
					end

					Item_URE = Item_URE - Take_Num
					if Item_URE < 50 then
						Item_URE = 49
						
					end

					i = SetItemAttr ( PK_Dead_Punish_Item[j] , ITEMATTR_URE , Item_URE )
					if i == 0 then
						LG("Item_URE","Normal death deducts attribute failed"..j)
					end
					
					
					
					if k == 1 and Item_URE == 49 then
							SetChaEquipValid ( role , Dead_Punish_Item_WZ [j] , 0 )
					end
				end
				
			end
		end
		SystemNotice ( role , "PK death penalty: Item durability dropped by 5%" )
	end
end



--?????????
function can_repair_item ( role_repair , role_want_repair , Item )
	local Check = 0
	local Sklv = 1
	Check = can_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
	return Check

end

--??????????

function can_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
	--	SystemNotice( role_want_repair , "Starts can_repair_item")
	local re_type = IsPlayer ( role_repair )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Money_Need = get_item_repair_money ( Item )
	local Money_Have = GetChaAttr ( role_want_repair , ATTR_GD )
	
	
--	SystemNotice ( role_want_repair , "Item_MAXURE= "..Item_MAXURE)
--	SystemNotice ( role_want_repair , "Item_URE= "..Item_URE)

--	SystemNotice ( role_want_repair , "requires gold"..Money_Need )
	
	if Item_MAXURE <= 2500 then
		SystemNotice( role_want_repair , "Items durability too low. Unable to repair" )
		return 0
	end
	if Item_MAXURE == Item_URE then								--????,????????
		SystemNotice( role_want_repair , "\194\229\249\252 \237\229 \237\243\230\228\224\229\242\241\255 \226 \240\229\236\238\237\242\229 ")
		return 0
	end

	if Money_Have < Money_Need then								--?????
		SystemNotice( role_want_repair , "\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224 \228\235\255 \240\229\236\238\237\242\224 ")
		return 0
	end

--	if re_type == 1 then
--		LG("Item_URE","Repair is human?")
--		return 0
--	end
	
	local i = 0
	i = Check_Repair_ItemType ( Item )
	if i == 1 then
		return 1
	end
	SystemNotice( role_want_repair , "Non-repairable item")

	return 0
end


--???????
function get_item_repair_money ( Item )
	local Money = 0
	local Sklv = 1
	Money = get_item_repair_moneyLua ( Item , Sklv )
	
	if Money < 1 then
		Money = 1
	end

	return Money
	
end

--??????????
function get_item_repair_moneyLua ( Item , Sklv )
	local Item_Lv = GetItemLv ( Item )
	local RepairPoint = math.floor ( math.pow(( Item_Lv / 10 ) , 1.7 )) - 1
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )

	local URE_repair = math.floor ( Item_MAXURE / 50 ) - math.floor ( Item_URE / 50 )
	local Money_Need = math.max ( ( URE_repair * RepairPoint ) , 1 )
	return Money_Need
end

--??????
function begin_repair_item ( role_repair , role_want_repair , Item )
	local Sklv = 1
	begin_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
end

--???????
function begin_repair_itemLua ( role_repair , role_want_repair , Item , Sklv )
--	SystemNotice( role_want_repair , "Start repairing items")
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Money_Need = get_item_repair_money ( Item )
	local Money_Have = GetChaAttr ( role_want_repair , ATTR_GD )
--	SystemNotice ( role_want_repair , "Money_Have = "..Money_Have)
--	SystemNotice ( role_want_repair , "deducts gold "..Money_Need)
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role_want_repair , ATTR_GD )
	ALLExAttrSet( role_want_repair )
--	SystemNotice ( role_want_repair , "Gold Deducted: " )
--	local a = 1
--	local b = 1
	local i = 0
	local j = 0
	
	
--	local URE_NeedRepair = ( Item_MAXURE - Item_URE ) - ( Item_MAXURE * 0.05 )
	
--	if URE_NeedRepair <= 0 then
--		b = 1
--	end

--	if b == 1 then
	Item_URE = Item_MAXURE
	i = SetItemAttr ( Item , ITEMATTR_URE , Item_URE )

	if i == 0 then 
		LG("Item_URE","Repair durability failed")
	end
	SystemNotice( role_want_repair ,"\208\229\236\238\237\242 \231\224\226\229\240\248\184\237 " )
--	else
--		local New_Item_MAXURE = math.floor ( Item_MAXURE * 0.95 )
--		i = SetItemAttr ( Item , ITEMATTR_URE , New_Item_MAXURE )
--		j = SetItemAttr ( Item , ITEMATTR_MAXURE , New_Item_MAXURE )
--		SystemNotice ( role_want_repair , "Repair completed" )
--		SystemNotice ( role_want_repair , "Very sorry, some part of durability cannot be restored. Maximum durability reduced to" )
--		if i == 0 then
--			LG("Item_URE","repair failed repair durability failed")
--		end
--		if j == 0 then
--			LG("Item_URE","repair failed repair max durability failed")
--		end
--	end
	return 1
end


--?????????????
function Check_Repair_ItemType ( Item )
	local Item_Type = GetItemType ( Item )
--	SystemNotice ( role_want_repair , "Item Type="..Item_Type )
	local i = 0
	for i = 0 , Item_CanRepair_Num , 1 do
		if Item_CanRepair_ID [i] == Item_Type then
			return 1
		end
	end
	return 0
end


-----????32?????----------------

--????
function GetNum_Part1 ( Num )
	local a = 0
	a = math.floor ( Num / 1000000000 )
	return a
end

function GetNum_Part2 ( Num )
	local a = 0
	local b = 0
	a = Num - GetNum_Part1 ( Num ) * 1000000000
	b = math.floor ( a / 10000000 )
	return b
end

function GetNum_Part3 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10000000 ) * 10000000
	b = math.floor ( a / 1000000 )
	return b
end

function GetNum_Part4 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000000 ) *1000000
	b = math.floor ( a / 10000 )
	return b
end

function GetNum_Part5 ( Num )
	local a = 0
	local b = 0
	a = Num -  math.floor ( Num / 10000 ) * 10000
	b = math.floor ( a / 1000 )
	return b
end

function GetNum_Part6 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 1000 ) *1000
	b = math.floor ( a / 10 )
	return b
end

function GetNum_Part7 ( Num )
	local a = 0
	local b = 0
	a = Num - math.floor ( Num / 10 ) *10
	b = math.floor ( a / 1 )
	return b
end

-- function GetNum_Test ( Num )
--	local a = 0
--	Notice ( "This is a testing message from Mars. Please be calm" )
--	Notice ( "Test value as"..Num )
--	a = GetNum_Part1( Num )
--	Notice ( " test numeric part 1= "..a)
--	a = GetNum_Part2( Num )
--	Notice ( " test numeric part 2 = "..a)
--	a = GetNum_Part3( Num )
--	Notice ( " test numeric part 3= "..a)
--	a = GetNum_Part4( Num )
--	Notice ( " test numeric part 4 = "..a)
--	a = GetNum_Part5( Num )
--	Notice ( " test numeric part 5= "..a)
--	a = GetNum_Part6( Num )
--	Notice ( " test numeric part 6 = "..a)
--	a = GetNum_Part7( Num )
--	Notice ( " test value part 7= "..a)
-- end


--????

function SetNum_Part1 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part1 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000000
	return Num
end

function SetNum_Part2 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part2 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000000
	return Num
end

function SetNum_Part3 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part3 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000000
	return Num
end

function SetNum_Part4 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part4 ( Num )
	b = Part_Num - a
	Num = Num + b * 10000
	return Num
end

function SetNum_Part5 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part5 ( Num )
	b = Part_Num - a
	Num = Num + b * 1000
	return Num
end

function SetNum_Part6 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part6 ( Num )
	b = Part_Num - a
	Num = Num + b * 10
	return Num
end

function SetNum_Part7 ( Num , Part_Num )
	local a = 0
	local b = 0
	a = GetNum_Part7 ( Num )
	b = Part_Num - a
	Num = Num + b * 1
	return Num
end


--function SetNum_Test ( Num )
--	local a = 0
--	Notice ( "This is testing from Mars. Please be calm" )
--	Notice ( "Test value as"..Num)
--	Num = SetNum_Part1 ( Num , 0 )
--	Notice ( "changed part one to"..Num )
--	Num = SetNum_Part2 ( Num , 12 )
--	Notice ( "edit part 2 as"..Num )
--	Num = SetNum_Part3 ( Num , 3 )
--	Notice ( "edit part 3 to"..Num )
--	Num = SetNum_Part4 ( Num , 45 )
--	Notice ( "edit part 4 as"..Num )
--	Num = SetNum_Part5 ( Num , 6 )
--	Notice ( "edit part 5 as"..Num )
--	Num = SetNum_Part6 ( Num , 78 )
--	Notice ( "edit part 6 as"..Num )
--	Num = SetNum_Part7 ( Num , 9 )
--	Notice ( "changed part 7 as"..Num )
--end



--???????--

function SetItemForgeParam_MonsterBaoliao ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Monster [j] then 
			k = j
			a = 200
		end
	end

	if k > MaxHole then
		k = MaxHole
	end
	
--	if k <= 1 then
--		k = 1
--	end

	if Item_Type == 49 or Item_Type == 50 then
		k = 0
	end

	Num = SetNum_Part1 ( Num , k )
	  
--	Notice(Num)
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0 then
		LG( "Creat_Item" , "set forging content failed" )
	end
end

function SetItemForgeParam_PlayerHecheng ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	
	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Hecheng [j] then 
			k = j
			a = 200
		end 
	end 
	
 	if k > MaxHole then
		k = MaxHole
	end

	if Item_Type == 49 or Item_Type == 50 then
		k = 0
	end


	Num = SetNum_Part1 ( Num , k ) 
	 
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0 then
		LG( "Creat_Item" , "set forging content failed" )
	end
end

function SetItemForgeParam_QuestAward ( item , Num , item_event )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
	local ItemID = GetItemID ( item )
	local MaxHole = GetItemHoleNum ( ItemID )
	local Item_Type = GetItemType ( item )

	
	for j = 0 , 3 , 1 do 
		if a <= Item_HoleNum_Mission_1 [j] then 
			k = j
			a = 200
		end 
	end 
	
  	if k > MaxHole then
		k = MaxHole
	end

	if item_event == QUEST_AWARD_SDJ then
		if k == 0 then
			k = 1
		end
	end

	if item_event == QUEST_AWARD_SCBOX then
		k = 2
	end

	if Item_Type == 49 or Item_Type == 50 then
		k = 0
	end

	Num = SetNum_Part1 ( Num , k ) 

	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0 then
		LG( "Creat_Item" , "set forging content failed" )
	end
end

function SetItemForgeParam_Npc_Sale ( item , Num )
	local i = 0 
	local j = 0
	local a = math.random ( 1, 100 ) 
	local k = 0
--	local ItemID = GetItemID ( Item )
--	local MaxHole = GetItemHoleNum ( ItemID )

--	for j = 0 , 3 , 1 do 
--		if a <= Item_HoleNum_Monster [i] then 
--			k = i
--			a = 200
--		end
--	end

--	if k > MaxHole then
--		k = MaxHole
--	end

	Num = SetNum_Part1 ( Num , k )
	  
--	Num = 2011000000
	i = SetItemForgeParam ( item , 1 , Num )
	if i == 0 then
		LG( "Creat_Item" , "set forging content failed" )
	end

end


--????????

--?????????

function GetFightGuildLevel()
--	????,??level
--	????????,??GuildLevel
	local Lv = 0
	local Now_Week = GetNowWeek()
	local Now_Time = GetNowTime()
	local CheckNum = Now_Week * 100 + Now_Time
	if CheckNum >= 422 and CheckNum < 522 then
		Lv = 2
	elseif CheckNum >= 522 and CheckNum < 622 then
		Lv = 1
	elseif CheckNum >= 622 and CheckNum < 700 then
		Lv = 3
	elseif CheckNum >= 0 and CheckNum < 22 then
		Lv = 3
	end

	return Lv
end


--??????????
--??:????
--???:??????,?????????
function GetFightGuildID( GuildLevel )
	local RedSide = 0
	local BlueSide = 0
	RedSide , BlueSide = GetChallengeGuildID ( GuildLevel )
	return RedSide,BlueSide
end

--??????
function GetNowWeek ( )
	local Now_Week = os.date("%w")
	local Now_WeekNum = tonumber(Now_Week)
	return Now_WeekNum
end

--??????
function GetNowTime ( )
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	return NowTimeNum
end


--??????

function CheckItem_Nianshou ( role )
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 0 or boat == 1 then		
		return 0
	end

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	local head = GetChaItem ( role , 1 , 0 )
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	local Head_ID = GetItemID ( head )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )

	if Body_ID ~= 0825  and Body_ID ~= 2549 then
		return 0
	end

	if Hand_ID ~= 0826  and Hand_ID ~= 2550 then
		return 0
	end

	if Foot_ID ~= 0827  and Foot_ID ~= 2551 then
		return 0
	end

	if Cha_Num == 4 then
		if Head_ID ~= 0828  and Head_ID ~= 2552 then
			return 0
		end
	end

	return 1
end

--??????

function CheckItem_Heilong ( role )
	local Atk = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	if Atk == 0 or boat == 1 then		
		return 0
	end

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )

	if Body_ID ~= 0845 and Body_ID ~= 2367 then
		return 0
	end

	if Hand_ID ~= 0846 and Hand_ID ~= 2368 then
		return 0
	end

	if Foot_ID ~= 0847 and Foot_ID ~= 2369 then
		return 0
	end

	return 1
end

---??????
function CheckItem_pirate ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
        if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000 then
	   return 0
	end
        if body_gem_id ~= 2530 and body_gem_id ~= 2533 and body_gem_id ~= 2536 and body_gem_id ~= 2539 and body_gem_id ~= 2542 and body_gem_id ~= 2545 then
	   return 0
        end
	if hand_gem_id ~= 2531 and hand_gem_id ~= 2534 and hand_gem_id ~= 2537 and hand_gem_id ~= 2540 and hand_gem_id ~= 2543 and hand_gem_id ~= 2546 then
	   return 0
	end
	if foot_gem_id ~= 2532 and foot_gem_id ~= 2535 and foot_gem_id ~= 2538 and foot_gem_id ~= 2541 and foot_gem_id ~= 2544 and foot_gem_id ~= 2547 then 
           return 0
	end	
	return 1
end
---??75BOSS
function CheckItem_Death ( role )

	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
       if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000 then
		body_gem_id=Body_ID
		hand_gem_id=Hand_ID
		foot_gem_id=Foot_ID
		if body_gem_id ~= 2817 and body_gem_id ~= 2820 and body_gem_id ~= 2823 and body_gem_id ~= 2826 and body_gem_id ~= 2829 and body_gem_id ~= 2832 then
		   return 0
		end
		if hand_gem_id ~= 2818 and hand_gem_id ~= 2821 and hand_gem_id ~= 2824 and hand_gem_id ~= 2827 and hand_gem_id ~= 2830 and hand_gem_id ~= 2833 then
		   return 0
		end
		if foot_gem_id ~= 2819 and foot_gem_id ~= 2822 and foot_gem_id ~= 2825 and foot_gem_id ~= 2828 and foot_gem_id ~= 2831 and foot_gem_id ~= 2834 then 
		   return 0
		end
	else
		if body_gem_id ~= 2817 and body_gem_id ~= 2820 and body_gem_id ~= 2823 and body_gem_id ~= 2826 and body_gem_id ~= 2829 and body_gem_id ~= 2832 then
		   return 0
		end
		if hand_gem_id ~= 2818 and hand_gem_id ~= 2821 and hand_gem_id ~= 2824 and hand_gem_id ~= 2827 and hand_gem_id ~= 2830 and hand_gem_id ~= 2833 then
		   return 0
		end
		if foot_gem_id ~= 2819 and foot_gem_id ~= 2822 and foot_gem_id ~= 2825 and foot_gem_id ~= 2828 and foot_gem_id ~= 2831 and foot_gem_id ~= 2834 then 
		   return 0
		end	 
	end
	return 1
end
--????

function CheckItem_fighting ( role )
	local cha = TurnToCha ( role )
	local Cha_Num = GetChaTypeID( cha )
	
	 
	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )

	 
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
        local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
        local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
        if  Body_ID<5000 or Hand_ID<5000 or Foot_ID<5000 then
	   return 0
	end
        if body_gem_id ~= 1124 then
	   return 0
        end
	if hand_gem_id ~= 1125 then
	   return 0
	end
	if foot_gem_id ~= 1126  then 
           return 0
	end
	 
	return 1
end
---????-------------------------------------------------

---??---------------------

function Suanming_Money ( role )
	local a = CheckSuanmingType ( role )			--????????
	if a == 1 then
		ShangShangQian_Money ( role )
	elseif a == 2 then
		ShangQian_Money ( role )
	elseif a == 3 then
		ZhongQian_Money ( role )
--		SystemNotice ( role , "Today looks good. Nothing special has happened" )
	elseif a == 4 then
		XiaQian_Money ( role )
	elseif a == 5 then
		XiaXiaQian_Money ( role )
	end
end

---???-------------------

function Suanming_Work ( role )
	local a = CheckSuanmingType ( role )
	if a == 1 then
		ShangShangQian_Work ( role )
	elseif a == 2 then
		ShangQian_Work ( role )
	elseif a == 3 then
		ZhongQian_Work ( role )
--		SystemNotice ( role , "Today looks good. Nothing special has happened" )
	elseif a == 4 then
		XiaQian_Work ( role )
	elseif a == 5 then
		XiaXiaQian_Work ( role )
	end
end


--????????

function CheckSuanmingType ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 10
	qian [1] = 35
	qian [2] = 55
	qian [3] = 85
	qian [4] = 100

	for i = 0 , 4 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	return b

end

--?????

function ShangShangQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 10
	qian [1] = 50
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local GiveMoneyNum = 0.01 * math.random ( 1 , 5 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		SystemNotice ( role , "Obtain some Gold by luck"..GiveMoneyNum_Notice.."% of extra gold" )
		QianAddMoney ( role , 1 , GiveMoneyNum )							----??,1????,2??????
	elseif b == 2 then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		SystemNotice ( role , "Получено "..time_Bei.." minutes of bonus increased drop rate" )
	elseif b == 3 then
		GiveItem ( role , 0 , 7481 , 1 , 0 )							---???
	end
end

--????

function ShangQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 60
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end
	
	if b == 1 then
		local GiveMoneyNum = 0.001 * math.random ( 1 , 9 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		SystemNotice ( role , "Obtain some Gold by luck"..GiveMoneyNum_Notice.."% of extra gold" )
		QianAddMoney ( role , 1 , GiveMoneyNum )
	elseif b == 2 then
		local Give_Money = 1000 * math.random ( 1 , 15 )
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 3 then
		local hp_role = Hp( role )
		local hp_dmg = math.floor ( hp_role * 0.9 )
		local Give_Money = math.random ( 10000 , 20000 )
		Hp_Endure_Dmg ( role , hp_dmg )
		QianAddMoney ( role , 2 , Give_Money )
		SystemNotice ( role , "Smash by some gold coins. Almost die! Who throw these coins!" )
	end
end

--????

function ZhongQian_Money ( role )
	SystemNotice ( role , "Today is so boring…nothing ever happens..." )
end


--????

function XiaQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Give_Money = math.random ( 100 , 5000 )
		Give_Money = Give_Money * -1
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2 then
		local GiveMoneyNum = 0.001 * math.random ( 1 , 9 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		SystemNotice ( role , "Accidentally loses"..GiveMoneyNum_Notice.."% of gold" )
		GiveMoneyNum = GiveMoneyNum * -1
		QianAddMoney ( role , 1 , GiveMoneyNum )
	end
	
end

--?????

function XiaXiaQian_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Give_Money = math.random ( 10000 , 30000 )
		Give_Money = Give_Money * -1
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2 then
		local GiveMoneyNum = 0.01 * math.random ( 1 , 2 )
		local GiveMoneyNum_Notice = GiveMoneyNum * 100
		SystemNotice ( role , "Accidentally loses"..GiveMoneyNum_Notice.."% of gold" )
		GiveMoneyNum = GiveMoneyNum * -1
		QianAddMoney ( role , 1 , GiveMoneyNum )
	end
end

--?????

function ShangShangQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 20
	qian [1] = 50
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local GiveExpNum = 0.01 * math.random ( 1 , 5 )
		local GiveExpNum_Notice = GiveExpNum * 100
		SystemNotice ( role , "Accidentally obtained "..GiveExpNum_Notice.."% EXP" )
		QianAddExp ( role , GiveExpNum , 1 )							----???,??2????????????????,??3???(1????,2????)
	elseif b == 2 then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		SystemNotice ( role , "Recieved blessing from Goddess Kara. Obtained "..time_Bei.." minutes of bonus experience increase" )
	elseif b == 3 then
		QianAddState ( role , 1 )								-----???,1 ??????,2?????
	end
end

--????

function ShangQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 100
--	qian [1] = 40
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 0 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 50 , 500 )
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--????

function ZhongQian_Work ( role )
	SystemNotice ( role , "Today is so boring, nothing ever happens..." )
end

--????

function XiaQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 100
--	qian [1] = 40
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 0 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 50 , 500 )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--?????

function XiaXiaQian_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 30
	qian [1] = 70
	qian [2] = 100
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local GiveExpNum = 0.01 * math.random ( 1 , 2 )
		local GiveExpNum_Notice = GiveExpNum * 100
		SystemNotice ( role , "Accidentally lost "..GiveExpNum_Notice.."% EXP" )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 1 )							----???,??2????????????????,??3???(1????,2????)
	elseif b == 2 then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 100 , 1000 )
		GiveExpNum = GiveExpNum * -1
		QianAddExp ( role , GiveExpNum , 2 )
	elseif b == 3 then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 1.1 )
		Hp_Endure_Dmg ( role , hp_dmg )
		SystemNotice ( role , "Character burst and strucked by lightning...." )
	end
end

--???

function QianAddMoney ( role , Type , Num )
	if Type == 1 then
		local Money_Have = GetChaAttr ( role , ATTR_GD )
		local Money_Add = Money_Have * Num

		Money_Have = Money_Have + Money_Add
		Money_Add = math.floor( Money_Add )

		Money_Have = math.floor ( Money_Have )

		SetCharaAttr ( Money_Have , role , ATTR_GD )
		ALLExAttrSet( role )
		
		if Money_Add > 0 then
			Num = Num * 100
			SystemNotice ( role , "God of Wealth drops a a bag of gold coins into your coin pouch"..Num.."% of your gold" )
			if Money_Add >= 200000 then
				local cha_name = GetChaDefaultName ( role )
				Notice ( cha_name.." draws a lot and obtained "..Money_Add.." Gold" )
			end
		elseif Money_Add < 0 then
			Num = Num * -100
			SystemNotice ( role , "God of Misfortune struck you! Loses "..Num.."% gold" )
		end
	
	elseif Type == 2 then
		local Money_Have = GetChaAttr ( role , ATTR_GD )
		local Money_Add = Num

		Money_Have = Money_Have + Money_Add

		if Money_Have < 0 then
			Money_Have = 0
		end

		SetCharaAttr ( Money_Have , role , ATTR_GD )
		ALLExAttrSet( role )
		if Num > 0 then
			if Num >= 200000 then
				local cha_name = GetChaDefaultName ( role )
				--Notice ( cha_name.." \232\241\239\238\235\252\231\238\226\224\235 \198\240\229\225\232\233 \212\238\240\242\243\237\251, \232 \239\238\235\243\247\232\235 "..Num.." \231\238\235\238\242\224 " )
			end
		elseif Num < 0 then
			Num = Num * -1
			SystemNotice ( role , "You found out that you have lost "..Num.." Gold" )
		end
	end
end

--????

function QianAddExp ( role , Num , type )
	local lv = GetChaAttr( role, ATTR_LV )
	local exp = Exp(role) 
	local nlexp = GetChaAttrI ( role , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( role , ATTR_CLEXP )
	local ThisLvexp = nlexp - clexp
	local ExpGet = ThisLvexp * Num
	
	if type == 2 then
		ExpGet = Num
		if lv >= 80 then
			ExpGet = math.floor ( ExpGet / 50 )
		end
	end

	ExpGet = math.floor ( ExpGet )

	exp = exp + ExpGet
	
	if exp > nlexp then
		exp = nlexp + math.floor ( ( exp - nlexp ) / 50 )
	end
	
	if exp < 0 then
		exp = 0
	end

	
	SetChaAttrI( role , ATTR_CEXP , exp )

	if lv >= 80 then
			ExpGet = ExpGet * 50
	end

	if ExpGet > 0 then
		
		SystemNotice ( role , "Accidentally obtained "..ExpGet.." EXP" )
		if ExpGet >= 200000 then
				local cha_name = GetChaDefaultName ( role )
				Notice ( cha_name.." draws a lot and obtained "..ExpGet.." EXP" )
		end
	elseif ExpGet < 0 then
		ExpGet = ExpGet * -1
		SystemNotice ( role , "Experience lost: "..ExpGet.." EXP" )
	end

end

--????

function QianAddState ( role , Type )

	local State = { }
	local StateName = { }

	State [0] = STATE_PKZDYS
	State [1] = STATE_PKSFYS
	State [2] = STATE_PKMNYS
	State [3] = STATE_PKJZYS
	State [4] = STATE_PKKBYS
	
	StateName [0] = "Attack"
	StateName [1] = "Defense"
	StateName [2] = "Max HP"
	StateName [3] = "Hit Rate"
	StateName [4] = "Attack Speed"

	local i = math.random ( 0 , 4 )
	local statelv = 0
	local TimeRange = 0
	if Type == 1 then
		TimeRange = 60
	elseif Type == 2 then
		TimeRange = 30
	end
	local statetime = math.random ( 1 , TimeRange )
	statetime = statetime * 60
	
	statelv = 10
	AddState ( role , role , State[i] , statelv , statetime ) 
	SystemNotice ( 	role , "You sense that your "..StateName[i].." has increased" )
	
end


--?????

function GiveGoldenMapItem ( role )
	local CheckRandom = math.random ( 1,100 )
	if CheckRandom >= 1 and CheckRandom <= 23 then
		local GiveMoney = 1000 * math.random ( 1, 20 )
		SystemNotice ( role , "Dug out pirates treasure. Obtained "..GiveMoney.."G" )
		AddMoney ( role , 0 , GiveMoney )
	elseif CheckRandom > 23 and CheckRandom <= 28 then
		XianJing ( role , 1 )
	elseif CheckRandom > 28 and CheckRandom <= 33 then
		XianJing ( role , 2 )
	elseif CheckRandom > 33 and CheckRandom <= 40 then
		SystemNotice ( role , "Today seems to be spining about. Don't know where it will spin to" )
		MapRandomtele ( role )
	else
		SystemNotice ( role , " dug out a hidden pirate treasure" )
		local item_type = BaoXiang_CBTBOX
		local item_type_rad = BaoXiang_CBTBOX_Rad 
		local item_type_count = BaoXiang_CBTBOX_Count 
		local maxitem = BaoXiang_CBTBOX_Mxcount						-- ????
		local item_quality = BaoXiang_CBTBOX_Qua
		local General = 0  
		local ItemId = 0 
		local Item_CanGet = GetChaFreeBagGridNum ( role )
	
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1							--??????
		for k = 1 , maxitem , 1 do				-- ??????????

			d = item_type_rad [ k ] + b

			 if a <= d and a > b then
				c = k
				break 
			end 
			b = d 

		end 
		if c == -1 then 
			ItemId = 3124 
		else 
			ItemId = item_type [c]  
			ItemCount = item_type_count [c] 
		end 
		GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		local GoodItem = {}
		GoodItem[0]	=	0110
		GoodItem[1]	=	0112
		GoodItem[2]	=	0114
		GoodItem[3]	=	0116
		GoodItem[4]	=	0118
		GoodItem[5]	=	0120
		GoodItem[6]	=	0151
		GoodItem[7]	=	0396
		GoodItem[8]	=	0398
		GoodItem[9]	=	0400
		GoodItem[10]	=	0402
		GoodItem[11]	=	0404
		GoodItem[12]	=	0406
		GoodItem[13]	=	0408
		GoodItem[14]	=	0411
		GoodItem[15]	=	0413
		GoodItem[16]	=	0588
		GoodItem[17]	=	0590
		GoodItem[18]	=	0592
		GoodItem[19]	=	0594
		GoodItem[20]	=	0596
		GoodItem[21]	=	0598
		GoodItem[22]	=	0600
		GoodItem[23]	=	0602
		GoodItem[24]	=	0748
		GoodItem[25]	=	0750
		GoodItem[26]	=	0752
		GoodItem[27]	=	0754
		GoodItem[28]	=	0756
		GoodItem[29]	=	0758
		GoodItem[30]	=	0760
		GoodItem[31]	=	0824
		GoodItem[32]	=	0860
		GoodItem[33]	=	0861
		GoodItem[34]	=	0862
		GoodItem[35]	=	0863

		local Good_C = 0
		for Good_C = 0 , 35 , 1 do
			if ItemId == GoodItem[Good_C] then
				local itemname = GetItemName ( ItemId ) 
				local cha_name = GetChaDefaultName ( role ) 
				local message = cha_name.."Откопал сокровища и получил "..itemname  
				Notice ( message )
			end
		end
	end
				

end
------???????????
function GiveGoldenMapItem_JLB ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"Недостаточно свободных слотов в инвентаре)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 35 )
	local itemname = ""
	if rad == 1 then
	GiveItem ( role , 0 , 7622  , 1 , 135 ) 
	itemname = "50 \208\229\239\243\242\224\246\232\232"
	elseif rad == 2 then
	GiveItem ( role , 0 , 7623  , 1 , 135 )  
	itemname = "100 \208\229\239\243\242\224\246\232\232"
	elseif rad == 3 then
	GiveItem ( role , 0 , 7620  , 1 , 135 )  
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224"
	elseif rad == 4 then
	GiveItem ( role , 0 , 7482  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232"
	elseif rad == 5 then
	GiveItem ( role , 0 , 7484  , 1 , 135 ) 
	itemname = "\209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 6 then
	GiveItem ( role , 0 , 7502  , 1 , 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 7 then
	GiveItem ( role , 0 , 7489  , 1 , 135 )  
	itemname = "\202\238\240\238\225\234\243 \241 \192\243\240\224\236\232"
	elseif rad == 8 then
	GiveItem ( role , 0 , 7624  , 1 , 135 ) 
	itemname = "500 \208\229\239\243\242\224\246\232\232"
	elseif rad == 9 then
	GiveItem ( role , 0 , 7502  , 1 , 135 ) 
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 10 then
	GiveItem ( role , 0 , 7502  , 1 , 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 11 then
	GiveItem ( role , 0 , 7502  , 1, 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 12 then
	GiveItem ( role , 0 , 7502  , 1 , 135 ) 
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 13 then
	GiveItem ( role , 0 , 578  , 1 , 135 ) 
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232"
	elseif rad == 14 then
	GiveItem ( role , 0 , 7502  , 1 , 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 15 then
	GiveItem ( role , 0 , 578  , 2 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (2\248\242) "
	elseif rad == 16 then
	GiveItem ( role , 0 , 7528  , 1, 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 17 then
	GiveItem ( role , 0 , 7625  , 1 , 135 ) 
	itemname = "10 \208\229\239\243\242\224\246\232\232"
	elseif rad == 18 then
	GiveItem ( role , 0 , 7622  , 1 , 135 )  
	itemname = "50 \208\229\239\243\242\224\246\232\232"
	elseif rad == 19 then
	GiveItem ( role , 0 , 7493  , 1 , 135 )  
	itemname = "\234\243\239\254\240\243 \228\238\241\242\238\232\237\241\242\226\238\236 500 \242\251\241\255\247"
	elseif rad == 20 then
	GiveItem ( role , 0 , 7620  , 2 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (2\248\242)"
	elseif rad == 21 then
	GiveItem ( role , 0 , 7620  , 3 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (3\248\242)"
	elseif rad == 22 then
	GiveItem ( role , 0 , 1145  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 1 \243\240\238\226\229\237\252"
	elseif rad == 23 then
	GiveItem ( role , 0 , 2729  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 2 \243\240\238\226\229\237\252"
	elseif rad == 24 then
	GiveItem ( role , 0 , 7528  , 1 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 25 then
	GiveItem ( role , 0 , 7467  , 1 , 135 ) 
	itemname = "\241\243\237\228\243\234 \202\253\235\229\233 100 \248\242\243\234"
	elseif rad == 26 then
	GiveItem ( role , 0 , 7456  , 1 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243"
	elseif rad == 27 then
	GiveItem ( role , 0 , 7456  , 2 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (2\248\242)"
	elseif rad == 28 then
	GiveItem ( role , 0 , 7456  , 3 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (3\248\242)"
	elseif rad == 29 then
	GiveItem ( role , 0 , 7456  , 4 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (4\248\242)"
	elseif rad == 30 then
	GiveItem ( role , 0 , 7456  , 5 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (5\248\242)"
	elseif rad == 31 then
	GiveItem ( role , 0 , 7528  , 1 , 135 )  
	itemname = "\215\224\241\242\252 \207\235\224\249\224 "
	elseif rad == 32 then
	GiveItem ( role , 0 , 3362  , 100 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (100\248\242) "
	elseif rad == 33 then
	GiveItem ( role , 0 , 7627  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \203\229\227\229\237\228\224\240\237\251\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 34 then
	GiveItem ( role , 0 , 3362  , 50 , 135 )  
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (50\248\242) "
	elseif rad == 35 then
	GiveItem ( role , 0 , 3362  , 150 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (150\248\242) "
	elseif rad == 36 then
	GiveItem ( role , 0 , 7628  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \204\232\244\232\247\229\241\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 37 then
	GiveItem ( role , 0 , 7496  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \194\229\235\232\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 38 then
	GiveItem ( role , 0 , 7503  , 1 , 135 ) 
	itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 39 then
	GiveItem ( role , 0 , 7528  , 1 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224 "
	elseif rad == 40 then
	GiveItem ( role , 0 , 7528  , 2 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224 (2\248\242) "
	elseif rad == 41 then
	GiveItem ( role , 0 , 7528  , 3 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224 (3\248\242) "
	elseif rad == 42 then
	GiveItem ( role , 0 , 5702  , 1 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224"
	elseif rad == 43 then
	GiveItem ( role , 0 , 5702  , 2 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (2\248\242)"
	elseif rad == 44 then
	GiveItem ( role , 0 , 5702  , 3 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (3\248\242 "
	elseif rad == 45 then
	GiveItem ( role , 0 , 5710  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224"
	elseif rad == 46 then
	GiveItem ( role , 0 , 5710  , 2 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (2\248\242)"
	elseif rad == 47 then
	GiveItem ( role , 0 , 5710  , 3 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (3\248\242)"
	elseif rad == 48 then
	GiveItem ( role , 0 , 7623  , 1 , 135 )  
	itemname = "100 \208\229\239\243\242\224\246\232\232"
	elseif rad == 49 then
	GiveItem ( role , 0 , 7620  , 1 , 135 )  
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224"
	elseif rad == 50 then
	GiveItem ( role , 0 , 7482  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232"
	elseif rad == 51 then
	GiveItem ( role , 0 , 7484  , 1 , 135 ) 
	itemname = "\209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 52 then
	GiveItem ( role , 0 , 7502  , 1 , 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 53 then
	GiveItem ( role , 0 , 7489  , 1 , 135 )  
	itemname = "\202\238\240\238\225\234\243 \241 \192\243\240\224\236\232"
	elseif rad == 54 then
	GiveItem ( role , 0 , 7624  , 1 , 135 ) 
	itemname = "500 \208\229\239\243\242\224\246\232\232"
	elseif rad == 55 then
	GiveItem ( role , 0 , 7482  , 2 , 135 ) 
	itemname = "\209\243\237\228\243\234 \243\235\243\247\248\229\237\232\255 \253\234\232\239\232\240\238\226\234\232 (2\248\242)"
	elseif rad == 56 then
	GiveItem ( role , 0 , 7482  , 1 , 135 )  
	itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232"
	elseif rad == 57 then
	GiveItem ( role , 0 , 7528  , 4 , 135 )  
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 58 then
	GiveItem ( role , 0 , 7528  , 1 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 59 then
	GiveItem ( role , 0 , 578  , 1 , 135 ) 
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232"
	elseif rad == 60 then
	GiveItem ( role , 0 , 578  , 3 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 \2453"
	elseif rad == 61 then
	GiveItem ( role , 0 , 578  , 2 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (2\248\242) "
	elseif rad == 62 then
	GiveItem ( role , 0 , 578  , 4 , 135 ) 
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (4\248\242)"
	elseif rad == 63 then
	GiveItem ( role , 0 , 7655  , 1 , 135 ) 
	itemname = "\203\238\242\229\240\229\233\237\251\233 \193\232\235\229\242 (\199\238\235\238\242\238)"
	elseif rad == 64 then
	GiveItem ( role , 0 , 7656  , 1 , 135 )  
	itemname = "\203\238\242\229\240\229\233\237\251\233 \193\232\235\229\242 (\202\253\235\252)"
	elseif rad == 65 then
	GiveItem ( role , 0 , 7493  , 1 , 135 )  
	itemname = "\234\243\239\254\240\243 \228\238\241\242\238\232\237\241\242\226\238\236 500 \242\251\241\255\247"
	elseif rad == 66 then
	GiveItem ( role , 0 , 7620  , 2 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (2\248\242)"
	elseif rad == 67 then
	GiveItem ( role , 0 , 7620  , 3 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (3\248\242)"
	elseif rad == 68 then
	GiveItem ( role , 0 , 1145  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 1 \243\240\238\226\229\237\252"
	elseif rad == 69 then
	GiveItem ( role , 0 , 2729  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 2 \243\240\238\226\229\237\252"
	elseif rad == 70 then
	GiveItem ( role , 0 , 7528  , 1 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 71 then
	GiveItem ( role , 0 , 7467  , 1 , 135 ) 
	itemname = "\241\243\237\228\243\234 \202\253\235\229\233 100 \248\242\243\234"
	elseif rad == 72 then
	GiveItem ( role , 0 , 7456  , 1 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243"
	elseif rad == 73 then
	GiveItem ( role , 0 , 7456  , 2 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (2\248\242)"
	elseif rad == 74 then
	GiveItem ( role , 0 , 7456  , 3 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (3\248\242)"
	elseif rad == 75 then
	GiveItem ( role , 0 , 7456  , 4 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (4\248\242)"
	elseif rad == 76 then
	GiveItem ( role , 0 , 7456  , 5 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (5\248\242)"
	elseif rad == 77 then
	GiveItem ( role , 0 , 7528  , 1 , 135 )  
	itemname = "\215\224\241\242\252 \207\235\224\249\224 "
	elseif rad == 78 then
	GiveItem ( role , 0 , 3362  , 100 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (100\248\242) "
	elseif rad == 79 then
	GiveItem ( role , 0 , 7627  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \203\229\227\229\237\228\224\240\237\251\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 80 then
	GiveItem ( role , 0 , 3362  , 50 , 135 )  
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (50\248\242) "
	elseif rad == 81 then
	GiveItem ( role , 0 , 3362  , 150 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (150\248\242) "
	elseif rad == 82 then
	GiveItem ( role , 0 , 7628  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \204\232\244\232\247\229\241\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 83 then
	GiveItem ( role , 0 , 7496  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \194\229\235\232\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 84 then
	GiveItem ( role , 0 , 7503  , 1 , 135 ) 
	itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 85 then
	GiveItem ( role , 0 , 7623  , 1 , 135 )  
	itemname = "100 \208\229\239\243\242\224\246\232\232"
	elseif rad == 86 then
	GiveItem ( role , 0 , 7620  , 1 , 135 )  
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224"
	elseif rad == 87 then
	GiveItem ( role , 0 , 7482  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232"
	elseif rad == 88 then
	GiveItem ( role , 0 , 7484  , 1 , 135 ) 
	itemname = "\209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 89 then
	GiveItem ( role , 0 , 7502  , 1 , 135 )  
	itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 90 then
	GiveItem ( role , 0 , 7489  , 1 , 135 )  
	itemname = "\202\238\240\238\225\234\243 \241 \192\243\240\224\236\232"
	elseif rad == 91 then
	GiveItem ( role , 0 , 7624  , 1 , 135 ) 
	itemname = "500 \208\229\239\243\242\224\246\232\232"
	elseif rad == 92 then
	GiveItem ( role , 0 , 7482  , 2 , 135 ) 
	itemname = "\209\243\237\228\243\234 \243\235\243\247\248\229\237\232\255 \253\234\232\239\232\240\238\226\234\232 (2\248\242)"
	elseif rad == 93 then
	GiveItem ( role , 0 , 7482  , 3 , 135 )  
	itemname = "\209\243\237\228\243\234 \243\235\243\247\248\229\237\232\255 \253\234\232\239\232\240\238\226\234\232 (3\248\242)"
	elseif rad == 94 then
	GiveItem ( role , 0 , 7482  , 4 , 135 )  
	itemname = "\209\243\237\228\243\234 \243\235\243\247\248\229\237\232\255 \253\234\232\239\232\240\238\226\234\232 (4\248\242)"
	elseif rad == 95 then
	GiveItem ( role , 0 , 7482  , 5 , 135 ) 
	itemname = "\209\243\237\228\243\234 \243\235\243\247\248\229\237\232\255 \253\234\232\239\232\240\238\226\234\232 (5\248\242)"
	elseif rad == 96 then
	GiveItem ( role , 0 , 578  , 1 , 135 ) 
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232"
	elseif rad == 97 then
	GiveItem ( role , 0 , 578  , 3 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 \2453"
	elseif rad == 98 then
	GiveItem ( role , 0 , 578  , 2 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (2\248\242) "
	elseif rad == 99 then
	GiveItem ( role , 0 , 578  , 4 , 135 ) 
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (4\248\242)"
	elseif rad == 100 then
	GiveItem ( role , 0 , 7657  , 1 , 135 ) 
	itemname = "\203\238\242\229\240\229\233\237\251\233 \193\232\235\229\242 (\208\229\239\243\242\224\246\232\255)"
	elseif rad == 101 then
	GiveItem ( role , 0 , 7528  , 1 , 135 )  
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 102 then
	GiveItem ( role , 0 , 7493  , 1 , 135 )  
	itemname = "\234\243\239\254\240\243 \228\238\241\242\238\232\237\241\242\226\238\236 500 \242\251\241\255\247"
	elseif rad == 103 then
	GiveItem ( role , 0 , 7620  , 2 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (2\248\242)"
	elseif rad == 104 then
	GiveItem ( role , 0 , 7620  , 3 , 135 ) 
	itemname = "\208\224\241\239\232\241\234\243 \213\224\238\241\224 (3\248\242)"
	elseif rad == 105 then
	GiveItem ( role , 0 , 1145  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 1 \243\240\238\226\229\237\252"
	elseif rad == 106 then
	GiveItem ( role , 0 , 2729  , 1 , 135 )  
	itemname = "\236\229\248\238\234 \241 \239\229\241\234\238\236 2 \243\240\238\226\229\237\252"
	elseif rad == 107 then
	GiveItem ( role , 0 , 7528  , 1 , 135 ) 
	itemname = "\215\224\241\242\252 \207\235\224\249\224"
	elseif rad == 108 then
	GiveItem ( role , 0 , 7467  , 1 , 135 ) 
	itemname = "\241\243\237\228\243\234 \202\253\235\229\233 100 \248\242\243\234"
	elseif rad == 109 then
	GiveItem ( role , 0 , 7456  , 1 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243"
	elseif rad == 110 then
	GiveItem ( role , 0 , 7456  , 2 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (2\248\242)"
	elseif rad == 111 then
	GiveItem ( role , 0 , 7456  , 3 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (3\248\242)"
	elseif rad == 112 then
	GiveItem ( role , 0 , 7456  , 4 , 135 ) 
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (4\248\242)"
	elseif rad == 113 then
	GiveItem ( role , 0 , 7456  , 5 , 135 )  
	itemname = "\240\224\241\239\232\241\234\224 \237\224 \197\228\243 (5\248\242)"
	elseif rad == 114 then
	GiveItem ( role , 0 , 578  , 5 , 135 )  
	itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (5\248\242) "
	elseif rad == 115 then
	GiveItem ( role , 0 , 3362  , 100 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (100\248\242) "
	elseif rad == 116 then
	GiveItem ( role , 0 , 7627  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \203\229\227\229\237\228\224\240\237\251\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 117 then
	GiveItem ( role , 0 , 3362  , 50 , 135 )  
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (50\248\242) "
	elseif rad == 118 then
	GiveItem ( role , 0 , 3362  , 150 , 135 ) 
	itemname = "\215\229\240\237\224\255 \198\229\236\247\243\230\232\237\224 (150\248\242) "
	elseif rad == 119 then
	GiveItem ( role , 0 , 7628  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \204\232\244\232\247\229\241\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 120 then
	GiveItem ( role , 0 , 7496  , 1 , 135 ) 
	itemname = "\204\229\248\238\234 \241 \194\229\235\232\234\232\236 \212\240\243\234\242\238\236 \212\229\232"
	elseif rad == 121 then
	GiveItem ( role , 0 , 7503  , 1 , 135 ) 
	itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 122 then
	GiveItem ( role , 0 , 5702  , 1 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224"
	elseif rad == 123 then
	GiveItem ( role , 0 , 5702  , 2 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (2\248\242)"
	elseif rad == 124 then
	GiveItem ( role , 0 , 5702  , 3 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (3\248\242 "
	elseif rad == 125 then
	GiveItem ( role , 0 , 5710  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224"
	elseif rad == 126 then
	GiveItem ( role , 0 , 5710  , 2 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (2\248\242)"
	elseif rad == 127 then
	GiveItem ( role , 0 , 5710  , 3 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (3\248\242)"
	elseif rad == 128 then
	GiveItem ( role , 0 , 5702  , 1 , 135 ) 
	itemname = "\202\235\254\247 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224"
	elseif rad == 129 then
	GiveItem ( role , 0 , 7503  , 1 , 135 ) 
	itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	elseif rad == 130 then
	GiveItem ( role , 0 , 7503  , 1 , 135 ) 
	itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232 "
	elseif rad == 131 then
	GiveItem ( role , 0 , 5713  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \207\240\229\228\229\235\224"
	elseif rad == 132 then
	GiveItem ( role , 0 , 5705  , 1 , 135 ) 
	itemname = "\202\235\254\247 \207\240\229\228\229\235\224"
	elseif rad == 133 then
	GiveItem ( role , 0 , 5710  , 3 , 135 ) 
	itemname = "\209\243\237\228\243\234 \232\231 \207\243\240\239\243\240\237\238\227\238 \202\240\232\241\242\224\235\235\224 (3\248\242)"
	elseif rad == 134 then
	GiveItem ( role , 0 , 7482  , 1 , 135 ) 
	itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232"
	elseif rad == 135 then
	GiveItem ( role , 0 , 7528  , 5 , 135 )
	itemname = "\215\224\241\242\252 \207\235\224\249\224 (5\248\242)"
	end	
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \240\224\241\234\238\239\224\235 \241\238\234\240\238\226\232\249\224, \232 \239\238\235\243\247\232\235 "..itemname )
end

--????

function CheckGetMapPos ( role , pos_x , pos_y , MapName )
--	SystemNotice ( role , "CheckPos" )
	local Cha_Boat = GetCtrlBoat ( role )
	local ChaIsBoat = 0
	if Cha_Boat ~= nil then
		role = Cha_Boat
	end

	local Cha_pos_x , Cha_pos_y = GetChaPos ( role )
	local map_name = GetChaMapName ( role )

	local Cha_x_min = pos_x * 100 - 400
	local Cha_x_max = pos_x * 100 + 400
	local Cha_y_min = pos_y * 100 - 400
	local Cha_y_max = pos_y * 100 + 400

	if map_name ~= MapName then
--		SystemNotice ( role , "map_name"..map_name)
--		SystemNotice ( role , "MapName"..MapName )
--		SystemNotice ( role , "mapname Error" )
		return 0 
	end 

	if Cha_pos_x < Cha_x_min or Cha_pos_x > Cha_x_max then
	
		return 0
	end

	if Cha_pos_y < Cha_y_min or Cha_pos_y > Cha_y_max then
		return 0
	end

	return 1
end
	
--????

---??---------------------

function SuanmingTeshu_Money ( role )
	local a = CheckSuanmingTypeTeshu ( role )			--????????
	if a == 1 then
		ShangShangQianTeshu_Money ( role )
	elseif a == 2 then
		ShangQianTeshu_Money ( role )
	elseif a == 3 then
		ZhongQian_Money ( role )
--		SystemNotice ( role , "Today looks good. Nothing special has happened" )

	end
end

---???-------------------

function SuanmingTeshu_Work ( role )
	local a = CheckSuanmingTypeTeshu ( role )
	if a == 1 then
		ShangShangQianTeshu_Work ( role )
	elseif a == 2 then
		ShangQianTeshu_Work ( role )
	elseif a == 3 then
		ZhongQian_Work ( role )
--		SystemNotice ( role , "Today looks good. Nothing special has happened" )
	end
end

--????
function CheckSuanmingTypeTeshu ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 1000
	qian [1] = 2000
	qian [2] = 3000
	
	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	return b

end

--???????

function ShangShangQianTeshu_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 5000
	qian [1] = 6000
	qian [2] = 10000
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 2 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local GiveMoneyNum = 7500 * math.random ( 10 , 100 )
		QianAddMoney ( role , 2 , GiveMoneyNum )							----??,1????,2??????
	elseif b == 2 then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		SystemNotice ( role , "Recieved blessing from Goddess Kara. Obtained "..time_Bei.." minutes of bonus increased drop rate" )
	elseif b == 3 then
		GiveItem ( role , 0 , 7482 , 1 , 0 )							---???
	end
end

--??????

function ShangQianTeshu_Money ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 6000
	qian [1] = 1000
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end
	
	if b == 1 then
		local Give_Money = 10000 * math.random ( 1 , 20 )
		QianAddMoney ( role , 2 , Give_Money )
	elseif b == 2 then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.9 )
		local Give_Money = math.random ( 10000 , 30000 )
		Hp_Endure_Dmg ( role , hp_dmg )
		QianAddMoney ( role , 2 , Give_Money )
		SystemNotice ( role , "Smash by some gold coins. Almost die! Who throw these coins!" )
	end
end


--???????

function ShangShangQianTeshu_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 3000
	qian [1] = 6000
	qian [2] = 9000
	qian [3] = 10000
--	qian [4] = 100

	for i = 0 , 3 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Lv_role = Lv ( role )
		local GiveExpNum = ( Lv_role * Lv_role * math.random ( 10 , 100 ) ) * ( 1 / math.max ( 1 , ( 50 - Lv_role ) ) )
		QianAddExp ( role , GiveExpNum , 2 )							
	elseif b == 2 then
		local statelv = 1
		local time_Bei = math.random ( 1 , 60 )
		local statetime = time_Bei * 60
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		SystemNotice ( role , "Recieved blessing from Goddess Kara. Obtained "..time_Bei.." minutes of bonus experience increase" )
	elseif b == 3 then
		QianAddState ( role , 1 )								-----???,1 ?????,2????
	elseif b == 4 then
		QianAddState ( role , 1 )								-----???,1 ?????,2????
		--QianAddStatePoint ( role , 1 )
	end
end

--??????

function ShangQianTeshu_Work ( role )
	local a = math.random ( 1 , 100 )
	local i = 0
	local b = 0
	local qian = { }
	qian [0] = 50
	qian [1] = 100
--	qian [2] = 60
--	qian [3] = 80
--	qian [4] = 100

	for i = 0 , 1 , 1 do
		if qian [i] >= a then
			b = i + 1
			break
		end
	end

	if b == 1 then
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * Lv_role * math.random ( 5 , 50 ) * ( 1 / math.max ( 1 , ( 50 - Lv_role ) ) )
		QianAddExp ( role , GiveExpNum , 2 )
	elseif b == 2 then
		QianAddState ( role , 2 )
	end
end

--?????
function QianAddStatePoint ( role , Num )
	local CheckNum = CheckStatePointHasGet ( role )
	local a = 1 / math.pow ( 2 , ( CheckNum - 1 ) )
	local check = Percentage_Random ( a )
	if check == 1 then
		local attr_ap = Attr_ap( role )
		local ap_extre = Num
		attr_ap = attr_ap + ap_extre 
		SetCharaAttr( attr_ap, role, ATTR_AP )
		local cha_name = GetChaDefaultName ( role )
		Notice ( cha_name.." draws a lot and obtained 1 bonus stat point" )
		LG ( "Add_StatePoint" , cha_name.."Obtained Attributes point: "..Num.." point" )
	else
		local Lv_role = Lv ( role )
		local GiveExpNum = Lv_role * math.random ( 100 , 1000 )
		QianAddExp ( role , GiveExpNum , 2 )
	end
end

--?????????
function CheckStatePointHasGet ( role )
	local str = GetChaAttr( role , ATTR_BSTR )
	local con = GetChaAttr( role , ATTR_BCON )
	local agi = GetChaAttr( role , ATTR_BAGI )
	local dex = GetChaAttr( role , ATTR_BDEX )
	local sta = GetChaAttr( role , ATTR_BSTA )
	local ap = GetChaAttr( role , ATTR_AP )
	local StatePointTotal_Have = str + con + agi + dex + sta + ap - 25
	local Lv_role = Lv ( role )
	local StatePointTotal = 3 + Lv_role + math.floor ( Lv_role / 10 ) * 4 + math.max ( 0 , ( Lv_role - 59 ) )
	local Check = StatePointTotal_Have - StatePointTotal
	return Check
end

--?????

function GetTheMapPos ( role , type )
--	SystemNotice( role ,"GetTheMapPos" )
	local MapList = { }
	
	MapList [0] = "NoMap"
	MapList [1] = "garner"
	MapList [2] = "magicsea"
	MapList [3] = "darkblue"

	local PosDateNum = 8
	local PosDateMap = {}
	local PosDateMax_X = {}
	local PosDateMin_X = {}
	local PosDateMax_Y = {}
	local PosDateMin_Y = {}
	
	PosDateMap [0]	=	1
	PosDateMap [1]	=	1
	PosDateMap [2]	=	1
	PosDateMap [3]	=	1
	PosDateMap [4]	=	2
	PosDateMap [5]	=	3
	PosDateMap [6]	=	1
	PosDateMap [7]	=	2
	PosDateMap [8]	=	1

	PosDateMax_X [0]	=	800
	PosDateMax_X [1]	=	940
	PosDateMax_X [2]	=	1023
	PosDateMax_X [3]	=	1012
	PosDateMax_X [4]	=	850
	PosDateMax_X [5]	=	2810
	PosDateMax_X [6]	=	380
	PosDateMax_X [7]	=	1420
	PosDateMax_X [8]	=	1614

	PosDateMin_X [0]	=	700
	PosDateMin_X [1]	=	840
	PosDateMin_X [2]	=	919
	PosDateMin_X [3]	=	912
	PosDateMin_X [4]	=	750
	PosDateMin_X [5]	=	2710
	PosDateMin_X [6]	=	280
	PosDateMin_X [7]	=	1320
	PosDateMin_X [8]	=	1514

	PosDateMax_Y [0]	=	1766
	PosDateMax_Y [1]	=	1350
	PosDateMax_Y [2]	=	1054
	PosDateMax_Y [3]	=	2950
	PosDateMax_Y [4]	=	3083
	PosDateMax_Y [5]	=	691
	PosDateMax_Y [6]	=	1725
	PosDateMax_Y [7]	=	3000
	PosDateMax_Y [8]	=	2695

	PosDateMin_Y [0]	=	1666
	PosDateMin_Y [1]	=	1250
	PosDateMin_Y [2]	=	1017
	PosDateMin_Y [3]	=	2850
	PosDateMin_Y [4]	=	2982
	PosDateMin_Y [5]	=	591
	PosDateMin_Y [6]	=	1675
	PosDateMin_Y [7]	=	2900
	PosDateMin_Y [8]	=	2615


	local PosDateGet = math.random ( 0 , PosDateNum )
--	SystemNotice ( role , "PosDateGet"..PosDateGet )

	local Pos_Map = PosDateMap[ PosDateGet ]
--	SystemNotice ( role , "Pos_Map"..Pos_Map )

	local Pos_X = math.random ( PosDateMin_X [PosDateGet] , PosDateMax_X [PosDateGet] )
--	SystemNotice ( role , "Pos_X"..Pos_X )
	local Pos_Y = math.random ( PosDateMin_Y [PosDateGet] , PosDateMax_Y [PosDateGet] )
--	SystemNotice ( role , "Pos_Y"..Pos_Y )
	
	return Pos_X , Pos_Y , Pos_Map
end
--??????????
function GetTheMapPos_JLB ( role , type )
	local MapList = { }
	MapList [0] = "NoMap"
	MapList [1] = "jialebi"

	local PosDateNum = 3
	local PosDateMap = {}
	local PosDateMax_X = {}
	local PosDateMin_X = {}
	local PosDateMax_Y = {}
	local PosDateMin_Y = {}
	
	PosDateMap [0]	=	1
	PosDateMap [1]	=	1
	PosDateMap [2]	=	1
	PosDateMap [3]	=	1

	PosDateMax_X [0]	=	476 
	PosDateMax_X [1]	=	460 
	PosDateMax_X [2]	=	469 
	PosDateMax_X [3]	=	477 

	PosDateMin_X [0]	=	466
	PosDateMin_X [1]	=	452
	PosDateMin_X [2]	=	462
	PosDateMin_X [3]	=	470

	PosDateMax_Y [0]	=	1052
	PosDateMax_Y [1]	=	980
	PosDateMax_Y [2]	=	1000
	PosDateMax_Y [3]	=	1048

	PosDateMin_Y [0]	=	1000 
	PosDateMin_Y [1]	=	954  
	PosDateMin_Y [2]	=	980  
	PosDateMin_Y [3]	=	1036 

----596,609
----629,953
	local PosDateGet = math.random ( 0 , PosDateNum )
	local Pos_Map = PosDateMap[ PosDateGet ]
	local Pos_X = math.random ( PosDateMin_X [PosDateGet] , PosDateMax_X [PosDateGet] )
	local Pos_Y = math.random ( PosDateMin_Y [PosDateGet] , PosDateMax_Y [PosDateGet] )
	return Pos_X , Pos_Y , Pos_Map
end



--??

function XianJing ( role ,type )
	if type == 1 then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.9 )
		Hp_Endure_Dmg ( role , hp_dmg )
		SystemNotice ( role , "\194\251 \237\224\242\234\237\243\235\232\241\252 \237\224 \239\240\238\234\235\255\242\251\233 \234\235\224\228,\226\224\248\224 \230\232\231\237\252 \226 \238\239\224\241\237\238\241\242\232!" ) 
	elseif type == 2 then
		local hp = Hp ( role )
		local hp_dmg = math.floor ( hp * 0.3 )
		Hp_Endure_Dmg ( role , hp_dmg )
		SystemNotice ( role , "\194\251 \239\238\239\224\235\232 \226 \239\232\240\224\242\241\234\243\254 \235\238\226\243\248\234\243,\226\224\248\232 \230\232\231\237\232 \243\236\229\237\252\248\229\237\251!" )
	end
end

function MapRandomtele ( role )

	local Birth ={}
	Birth[0]	=	"Argent City"
	Birth[1]	=	"Thundoria Castle"
	Birth[2]	=	"Shaitan City"
	Birth[3]	=	"Icicle Castle"
	Birth[4]	=	"Chaldea Haven"
	Birth[5]	=	"Andes Forest Haven"
	Birth[6]	=	"Abandon Mine Haven"
	Birth[7]	=	"Rockery Haven"
	Birth[8]	=	"Valhalla Haven"
	Birth[9]	=	"Solace Haven"
	Birth[10]	=	"Oasis Haven"
	Birth[11]	=	"Babul Haven"
	Birth[12]	=	"Icicle Haven"
	Birth[13]	=	"Atlantis Haven"
	Birth[14]	=	"Skeleton Haven"
	Birth[15]	=	"Icespire Haven"
	Birth[16]	=	"Zephyr Isle"
	Birth[17]	=	"Glacier Isle"
	Birth[18]	=	"Outlaw Isle"
	Birth[19]	=	"Isle of Chill"
	Birth[20]	=	"Canary Isle"
	Birth[21]	=	"Cupid Isle"
	Birth[22]	=	"Isle of Fortune"
	Birth[23]	=	"Thundoria Castle"
	Birth[23]	=	"Thundoria Harbor"
	Birth[24]	=	"Sacred Snow Mountain"
	Birth[25]	=	"Andes Forest Haven"
	Birth[26]	=	"Oasis Haven"
	Birth[27]	=	"Icespire Haven"
	Birth[28]	=	"Lone Tower Entrace"
	Birth[29]	=	"Barren Cavern Entrance"
	Birth[30]	=	"Abandon Mine 2"
	Birth[31]	=	"Silver Mine 2"
	Birth[32]	=	"Silver Mine 3"
	Birth[33]	=	"Abandon Mine 1"
	Birth[34]	=	"Lone Tower 2"
	Birth[35]	=	"Lone Tower 3"
	Birth[36]	=	"Lone Tower 4"
	Birth[37]	=	"Lone Tower 5"
	Birth[38]	=	"Lone Tower 6"
	Birth[39]	=	"Argent Bar"

	local PosRandom = math.random ( 0 , 39 )
	DelBagItem ( role , 1093 , 1 )
	MoveCity(role, Birth[PosRandom] )

end


--????????

function check_item_valid ( role , Item )
	local Item_type = GetItemType ( Item )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )

	if Item_type <= 29 or Item_type == 59 then
		if Item_URE ~= 0 and Item_URE <= 49 then
			return 0
		else
			return 1
		end
	end
	return 1
end


--?????
--??:????,????(?),????
--???:?
function cha_timer( role, freq, time )
	local resume_freq = 5
	local now_tick = GetChaParam( role, 1 )
	local is_role_living = -1
	SetChaParam( role, 1, now_tick + freq * time )
	Wings.ApplyEffect(role)
	VIPSystem.ApplyEffect(role)

	local Item_bg1 = GetChaItem ( role , 2 , 1  ) 
   local Get_Item_Type1 = GetItemType ( Item_bg1 ) 
   local ItemUse_siliao1 = GetChaItem ( role , 2 , 3  ) 
   local ItemUse_siliao_ID1 = GetItemID ( ItemUse_siliao1 ) 

   if Get_Item_Type1 == 59 then 
        local Elf_MEXP = GetItemAttr( Item_bg1 ,ITEMATTR_MAXENERGY ) 
        local Elf_EXP = GetItemAttr( Item_bg1 ,ITEMATTR_ENERGY ) 
        local Num_JLone = GetItemForgeParam ( Item_bg1 , 1 ) 
        local Part1_JLone = GetNum_Part1 ( Num_JLone ) 
        if Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==276 then --ID Fruit STR 
         local j = TakeItem(  role,0,276,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str_1 ( role , Item_Num , Item_bg1 ) --Great STR 
         end 
        elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==277 then --ID Fruit AGI 
         local j = TakeItem(  role,0,277,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_1 ( role , Item_Num , Item_bg1 ) --Great AGI 
         end 
        elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==278 then --ID Fruit DEX 
         local j = TakeItem(  role,0,278,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_1 ( role , Item_Num , Item_bg1 ) --Great DEX(Auto Great Zephyr Fish Floss) 
         end 
        elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==279 then --ID Fruit CON 
         local j = TakeItem(  role,0,279,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_1 ( role , Item_Num , Item_bg1 ) --Great CON 
         end 
        elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==280 then --ID Fruit STA 
         local j = TakeItem(  role,0,280,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_1 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
         
		elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==222 then --ID Fruit STA 
         local j = TakeItem(  role,0,222,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==223 then --ID Fruit STA 
         local j = TakeItem(  role,0,223,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==224 then --ID Fruit STA 
         local j = TakeItem(  role,0,224,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==225 then --ID Fruit STA 
         local j = TakeItem(  role,0,225,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==226 then --ID Fruit STA 
         local j = TakeItem(  role,0,226,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
  		 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7431 then --ID Fruit STA 
         local j = TakeItem(  role,0,7431,1) 
		 if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
        else 
          Lvup_Str_2 ( role , Item_Num , Item_bg1 ) --Great STA 
         end
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7430 then --ID Fruit STA 
         local j = TakeItem(  role,0,7430,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_2 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7433 then --ID Fruit STA 
         local j = TakeItem(  role,0,7433,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_2 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7419 then --ID Fruit STA 
         local j = TakeItem(  role,0,7419,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_2 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7434 then --ID Fruit STA 
         local j = TakeItem(  role,0,7434,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_2 ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
		
		elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7506 then --ID Fruit STA 
         local j = TakeItem(  role,0,7506,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str_3 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7505 then --ID Fruit STA 
         local j = TakeItem(  role,0,7505,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_3 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7507 then --ID Fruit STA 
         local j = TakeItem(  role,0,7507,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_3 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7504 then --ID Fruit STA 
         local j = TakeItem(  role,0,7504,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_3 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7508 then --ID Fruit STA 
         local j = TakeItem(  role,0,7508,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_3 ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
		  
		  elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7525 then --ID Fruit STA 
         local j = TakeItem(  role,0,7525,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str_4 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7524 then --ID Fruit STA 
         local j = TakeItem(  role,0,7524,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_4 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7526 then --ID Fruit STA 
         local j = TakeItem(  role,0,7526,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_4 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7523 then --ID Fruit STA 
         local j = TakeItem(  role,0,7523,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_4 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7527 then --ID Fruit STA 
         local j = TakeItem(  role,0,7527,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_4 ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
		  
		   elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7833 then --ID Fruit STA 
         local j = TakeItem(  role,0,7833,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str_5 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7832 then --ID Fruit STA 
         local j = TakeItem(  role,0,7832,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_5 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7834 then --ID Fruit STA 
         local j = TakeItem(  role,0,7834,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_5 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7831 then --ID Fruit STA 
         local j = TakeItem(  role,0,7831,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_5 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7835 then --ID Fruit STA 
         local j = TakeItem(  role,0,7835,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_5 ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
		  
		   elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7906 then --ID Fruit STA 
         local j = TakeItem(  role,0,7906,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Str_6 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7905 then --ID Fruit STA 
         local j = TakeItem(  role,0,7905,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Agi_6 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7907 then --ID Fruit STA 
         local j = TakeItem(  role,0,7907,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Dex_6 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7904 then --ID Fruit STA 
         local j = TakeItem(  role,0,7904,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Con_6 ( role , Item_Num , Item_bg1 ) --Great STA 
         end 
		 elseif  Elf_EXP>=Elf_MEXP and ItemUse_siliao_ID1==7908 then --ID Fruit STA 
         local j = TakeItem(  role,0,7908,1) 
         if j==0 then 
          SystemNotice ( role , "Deleting of Fruit failed!" ) 
         else 
          Lvup_Sta_6 ( role , Item_Num , Item_bg1 ) --Great STA 
		  end
		  
		 end
         end 
	local juluka_freq = 360
    local energy_resume = 360
    if math.mod(now_tick, juluka_freq) == 0 and now_tick > 0 then
        local map_name = GetChaMapName ( role )
        if map_name == "Pkteam" then
            local item_jiluka = GetChaItem( role, 2, 2)
            local item_id = GetItemID( item_jiluka )
            if item_id == 5724 then
                local energy = GetItemAttr(item_jiluka, ITEMATTR_ENERGY)
                if energy < 0 then
                    energy = 0
                elseif energy ==0 then
                SystemNotice ( role , "\194\224\248 \241\240\238\234 \237\224\234\224\231\224\237\232\255 \239\240\238\248\229\235. \207\238\227\238\226\238\240\232\242\229 \241 \205\224\247\224\235\252\237\232\234\238\236 \242\254\240\252\236\251." )
                else
                    energy = energy - energy_resume
                    SetItemAttr(item_jiluka, ITEMATTR_ENERGY, energy )
                end
            end
        end
    end
	-----------------------
	-- Восстановление ЖЗ --
	-----------------------
	if math.mod( now_tick, resume_freq ) == 0 and now_tick > 0 then 
		if is_role_living == -1 then
			is_role_living = IsChaLiving( role )
		end
		if is_role_living == 1 then 
			Resume( role )
		end 
	end

--------------------------------------------------
--		Функция свадебного бонуса (Начало)		--
--------------------------------------------------
	local cha = TurnToCha( role )
	local ring_bg = CheckBagItem( cha, 2520 )

	if ring_bg ~= 0 then
		local ring = GetChaItem2( cha, 2, 2520 )
		local mate_id = GetItemForgeParam( ring, 1 )
		if IsInTeam( cha ) == 1 then
			local Role_ID = GetRoleID( cha )
			local t = {}
			t[0] = cha
			t[1] = GetTeamCha( cha, 0 )
			t[2] = GetTeamCha( cha, 1 )
			t[3] = GetTeamCha( cha, 2 )
			t[4] = GetTeamCha( cha, 3 )
			for i = 1, 4 do
				if t[i] ~= nil then
					local Have_Ring = CheckBagItem( t[i], 2520 )
					if Have_Ring == 1 then	-- Проверка на наличие кольца
						local Item = GetChaItem2( t[i], 2, 2520 )
						local party_mate_id = GetItemForgeParam( Item, 1 )
						if Role_ID == party_mate_id then	-- Проверка на совпадение ID в кольце и персонажа
							local party_ID = GetRoleID( t[i] )
							if mate_id == party_ID then
								local pos_cha_x, pos_cha_y = GetChaPos( cha )
								local mate = TurnToCha( t[i] )
								local pos_mate_x, pos_mate_y = GetChaPos( mate )
								local distance = Distance( pos_cha_x, pos_cha_y, pos_mate_x, pos_mate_y )
								if distance <= 500 then
									AddState( role, role, STATE_WEDDING, 1, 3600 )
									RefreshCha( role )
								elseif distance >= 500 then
									RemoveState( cha, STATE_WEDDING )
								end
							end
						end
					end
				end
			end
		else if ( GetChaStateLv( cha, STATE_WEDDING ) ~= 0 ) then
				RemoveState( cha, STATE_WEDDING )
			end
		end
	end
--------------------------------------------------
--		Функция свадебного бонуса (Конец)		--
--------------------------------------------------

--------------------------------------------------
--						Феи						--
--------------------------------------------------
	local pet_freq = 60
	local Item_Elf = GetChaItem( role, 2, 1 )
	local Get_Elf_Type = GetItemType( Item_Elf )
	if Get_Elf_Type == 59 then
		local ure_type = GetItemAttr( Item_Elf, ITEMATTR_URE )
		if ure_type<=49 then
			SetChaKbItemValid2( role, Item_Elf, 0, 1 )
		else
			SetChaKbItemValid2( role, Item_Elf, 1, 1 )
		end
		local str = GetItemAttr( Item_Elf ,ITEMATTR_VAL_STR )	-- Сила
		local con = GetItemAttr( Item_Elf ,ITEMATTR_VAL_CON )	-- Телосложение
		local agi = GetItemAttr( Item_Elf ,ITEMATTR_VAL_AGI )	-- Ловкость
		local dex = GetItemAttr( Item_Elf ,ITEMATTR_VAL_DEX )	-- Точность
		local sta = GetItemAttr( Item_Elf ,ITEMATTR_VAL_STA )	-- Дух
		local Lv = str + agi + dex + con + sta	-- Уровень Феи
		if Lv > 2000 then										-- Если уровень феи выше 150, то время роста увеличивается
			pet_freq = pet_freq + ( Lv - 2000 ) * 1
		end
	end
	local sklv = GetChaStateLv( role, STATE_JLJSGZ )	-- Если применен Фрукт роста феи, время сокращается в 2 раза
	if sklv ~= 0 then
		pet_freq = math.floor( pet_freq * 0.5 )
	end
	if math.mod( now_tick, pet_freq ) == 0 and now_tick > 0 then
		if is_role_living == -1 then
			is_role_living = IsChaLiving( role )
		end
		if is_role_living == 1 then
			local Item_bg = GetChaItem( role, 2, 1 )
			local Get_Item_Type = GetItemType( Item_bg )
			local Item_siliao = GetChaItem( role, 2, 2 )
			local Item_siliao_ID = GetItemID( Item_siliao )
			if Get_Item_Type == 59 then
				local Elf_URE = GetItemAttr( Item_bg, ITEMATTR_URE )
				local Num_JLone = GetItemForgeParam( Item_bg, 1 )
				local Part1_JLone = GetNum_Part1( Num_JLone )
				if Elf_URE <= 30090 and Item_siliao_ID == 2312 then
					local j = TakeItem( role, 0, 2312, 1 )
					if j == 0 then
						SystemNotice( role , "\209\242\224\237\228\224\240\242\237\251\233 \239\224\229\234 \237\229 \232\241\239\238\235\252\231\238\226\224\237!" )
					else
						Elf_URE = Elf_URE + 2500
						SystemNotice( role, "\212\229\255 \224\226\242\238\236\224\242\232\247\229\241\234\232 \237\224\234\238\240\236\235\229\237\224" )
						SetItemAttr( Item_bg, ITEMATTR_URE, Elf_URE )
					end
				end

				----------------------------------------------------------
				-- Получение Монет фей, Эльф. печаток, Кор.эльф.печаток --
				----------------------------------------------------------
				local star_num = GetItemAttr( Item_bg, ITEMATTR_VAL_FUSIONID )
				star_num = star_num + 1
				if math.mod( star_num, 1 ) == 0 and Elf_URE >= 50 and Part1_JLone == 1 then
					GiveItemX( role, 0, 855, 1, 4 )
				end
				if math.mod( star_num, 2 ) == 0 and Elf_URE >= 50 and Part1_JLone ~= 1 then
					GiveItemX( role, 0, 855, 1, 4 )
				end
				if math.mod( star_num, 30 ) == 0 and Elf_URE >= 50 and Part1_JLone == 1 then
					GiveItemX( role, 0, 2588, 1, 4 )
				end
				if math.mod( star_num, 60 ) == 0 and Elf_URE >= 50 and Part1_JLone ~= 1 then
					GiveItemX( role, 0, 2588, 1, 4 )
				end
				if math.mod( star_num, 120 ) == 0 and Elf_URE >= 50 then
					GiveItemX( role, 0, 2588, 1, 4 )
				end
				if math.mod( star_num , 1200 ) == 0  and Elf_URE >= 50 then
					GiveItemX( role, 0, 2589, 1, 4 )
				end
				if star_num == 1200 then
					star_num = 0
				end
				SetItemAttr( Item_bg, ITEMATTR_VAL_FUSIONID, star_num )
				Take_ElfURE( role, Item_bg, 1, 0 )
				Give_ElfEXP( role, Item_bg, 1, 0 )
				end
				end
				end
Addons_gold(ignore, role, freq, time)
				end



--плащ
    -- local cha = TurnToCha ( role ) 
	-- local cha_type = GetChaTypeID ( cha )
	-- local Cape_bg = GetChaItem ( role , 2 , 4  )
	-- local Cape_id = GetItemID ( Cape_bg )
	-- if Cape_id == 7469 and cha_type == 1 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE1 , statelv , statetime )
		
	-- elseif Cape_id == 7658 and cha_type == 1 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE5 , statelv , statetime )
		
	-- elseif Cape_id == 7659 and cha_type == 1 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE9 , statelv , statetime )
		
	-- elseif Cape_id == 7469 and cha_type == 2 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE2 , statelv , statetime )	
		
	-- elseif Cape_id == 7658 and cha_type == 2 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE6 , statelv , statetime )	
		
	-- elseif Cape_id == 7659 and cha_type == 2 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE10 , statelv , statetime )		

	-- elseif Cape_id == 7469 and cha_type == 3 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE3 , statelv , statetime )		
		
	-- elseif Cape_id == 7658 and cha_type == 3 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE7 , statelv , statetime )	

	-- elseif Cape_id == 7659 and cha_type == 3 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE11 , statelv , statetime )				

	-- elseif Cape_id == 7469 and cha_type == 4 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE4 , statelv , statetime )		
		
	-- elseif Cape_id == 7658 and cha_type == 4 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE8 , statelv , statetime )		
		
	-- elseif Cape_id == 7659 and cha_type == 4 then
		-- local statelv = 1
		-- local statetime = 3600
		-- AddState ( role , role , STATE_CAPE12 , statelv , statetime )		
	-- else
		-- local statelv_cape1 = GetChaStateLv ( role , STATE_CAPE1 )
		-- if statelv_cape1~=0 then
		-- RemoveState ( role , STATE_CAPE1 ) 
		-- end
		-- local statelv_cape2 = GetChaStateLv ( role , STATE_CAPE2 )
		-- if statelv_cape2~=0 then
		-- RemoveState ( role , STATE_CAPE2 ) 
		-- end
		-- local statelv_cape3 = GetChaStateLv ( role , STATE_CAPE3 )
		-- if statelv_cape3~=0 then
		-- RemoveState ( role , STATE_CAPE3 ) 
		-- end
		-- local statelv_cape4 = GetChaStateLv ( role , STATE_CAPE4 )
		-- if statelv_cape4~=0 then
		-- RemoveState ( role , STATE_CAPE4 ) 
		-- end
	-- end


	
	
	

-----------------------The Strenght in the Heart
--function CheckItem_StrenghtOLU ( role )
--
--		--local Eric_XZDLL = GetEquipItemP(role,8)
--		local Eric_XZDLL = GetChaItem ( role , 1 , 8 )
--		local Eric_XZDLL_ID = GetItemID ( Eric_XZDLL )
--		if Eric_XZDLL_ID == 5827 then
--			local statelv = 1
--			local statetime = 3600
--			AddState ( role , role , STATE_XZDLL , statelv , statetime )
--		else
--			local statelv_XZDLL = GetChaStateLv ( role , STATE_XZDLL )
--				if statelv_XZDLL~=0 then
--					RemoveState ( role , STATE_XZDLL ) 
--				end
--		end
--end

-------????????????-------------------------------------
function Take_ElfURE ( role , Item , Type , Num )
	local Elf_URE = GetItemAttr( Item ,ITEMATTR_URE ) 
	--local Elf_MaxURE = GetItemAttr( Item ,ITEMATTR_MAXENERGY ) 
	if Type == 1 then
			--SystemNotice ( role , Elf_URE )
			if Elf_URE >49 then
			--SystemNotice ( role , "starts to deduct " )
                                    Elf_URE = math.max ( ( Elf_URE - 50 ) , 49 )
		                    SetItemAttr ( Item , ITEMATTR_URE , Elf_URE )
			else 
				SetChaKbItemValid2(role , Item , 0 , 1)
			end

	end
	if Type == 2 then
		if Elf_URE > 49 then
			 Elf_URE = math.max ( ( Elf_URE - Num ) , 49 )
			 SetItemAttr ( Item , ITEMATTR_URE , Elf_URE )
		else
			SetChaKbItemValid2(role , Item , 0 , 1)
		end

	end


end


-------??????--------------------------------------------------
function Give_ElfEXP ( role , Item ,Type , Num )
	local Elf_EXP =  GetItemAttr( Item ,ITEMATTR_ENERGY ) 
	local Elf_MaxEXP = GetItemAttr( Item ,ITEMATTR_MAXENERGY ) 
	local Elf_URE = GetItemAttr( Item ,ITEMATTR_URE ) 
	--local rad = math.random( 1 , Lv )  

	if Type == 1 then
			--SystemNotice ( role , Elf_EXP )
			--if rad == 1 then
			 if Elf_URE > 49 then
			   Elf_EXP = Elf_EXP + ELEEXP_GETRAD 
			    if Elf_EXP >= Elf_MaxEXP then
                               Elf_EXP = Elf_MaxEXP
			    end
			   SetItemAttr ( Item , ITEMATTR_ENERGY , Elf_EXP )
			  end
                        --end
        end 

end



--------------------------?????????--------------------------------------------
function Give_ElfURE ( role , Item  , Num )
	local Elf_URE =  GetItemAttr( Item ,ITEMATTR_URE )
	local Elf_MaxURE = GetItemAttr( Item ,ITEMATTR_MAXURE )
	--local Num = 10
        if Elf_URE<=49 then
	SetChaKbItemValid2(role , Item , 1 , 0)
	end
	--SystemNotice ( role , Elf_URE )

	Elf_URE = Elf_URE + Num

	if Elf_URE >= Elf_MaxURE  then
		
		Elf_URE = Elf_MaxURE
	end
	SetItemAttr ( Item , ITEMATTR_URE , Elf_URE )


end


--????????????????
function CheckElf_EXP ( role , Item )
	local Elf_EXP =  GetItemAttr( Item ,ITEMATTR_ENERGY )
	local Elf_MaxEXP =  GetItemAttr( Item ,ITEMATTR_MAXENERGY )


	if Elf_EXP >= Elf_MaxEXP then
	        return 1
	else
		return 0
	end
end

--????
function Lvup_Str ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_STR
	--SystemNotice(role ,attr_type )
	Elf_LvUp ( role , Item_Num , Item_Traget , attr_type ) 
end 
--????
function Lvup_Con ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_CON 
	Elf_LvUp ( role , Item_Num , Item_Traget , attr_type ) 
end 
--????
function Lvup_Agi ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_AGI 
	Elf_LvUp ( role , Item_Num , Item_Traget , attr_type ) 
end 
--????
function Lvup_Dex ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_DEX
	Elf_LvUp ( role , Item_Num , Item_Traget , attr_type ) 
end 
--????
function Lvup_Sta ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_STA 
	Elf_LvUp ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Str_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_STR
	--SystemNotice(role ,attr_type )
	Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Con_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type =  ITEMATTR_VAL_CON 
	Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Agi_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_AGI 
	Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Dex_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_DEX
	Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Sta_1 ( role , Item_Num ,Item_Traget ) 
	local attr_type = ITEMATTR_VAL_STA 
	Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type ) 
end 

function Lvup_Str_2 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_STR
--SystemNotice(role ,attr_type )
Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Con_2 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_CON 
Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Agi_2 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_AGI 
Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Dex_2 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_DEX
Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Sta_2 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_STA 
Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type ) 
end

function Lvup_Str_3 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_STR
--SystemNotice(role ,attr_type )
Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Con_3 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_CON 
Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Agi_3 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_AGI 
Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Dex_3 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_DEX
Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type ) 
end 
--??????
function Lvup_Sta_3 ( role , Item_Num ,Item_Traget ) 
local attr_type = ITEMATTR_VAL_STA 
Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type ) 
end

--прокачка феи
function Elf_LvUp ( role , Item_Num , Item_Traget , attr_type )       
        local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
	local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 
	local Lv = str + agi + dex + con + sta
	local attr_type_num = GetItemAttr( Item_Traget ,attr_type )
	local a = 1
	SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
	if Lv >= 200 then
		a = 0
	SystemNotice (role , "\196\235\255 \228\224\235\252\237\229\233\248\229\233 \239\240\238\234\224\247\234\232 \244\229\232 \232\241\239\238\235\252\231\243\233\242\229 \194\229\235\232\234\232\233 \212\240\243\234\242 \212\229\233 ")
	end
	local b = Percentage_Random ( a )
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) 
	if b == 1 then						
	        AddItemEffect(role , Item_Traget , 0  )
		item_energe = 0	
                attr_type_num = attr_type_num + 1
		SetItemAttr ( Item_Traget , attr_type , attr_type_num )
		local Item_MAXENERGY = 240 * ( Lv + 1 )
		if Item_MAXENERGY > 6480 then
			Item_MAXENERGY = 6480
		end
		local Item_MAXURE_NUM = Elf_MaxURE + 1000
		if Item_MAXURE_NUM > 32000 then
			Item_MAXURE_NUM = 32000
		end
		SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
		ResetItemFinalAttr(Item_Traget)
	        AddItemEffect(role , Item_Traget , 1  )
	else							
		item_energe = 0.5 * item_energe 
	end
		SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )
end

--????????(??)
function Elf_LvUp_1 ( role , Item_Num , Item_Traget , attr_type )       
        local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
	local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 
	local Lv = str + agi + dex + con + sta
	local attr_type_num = GetItemAttr( Item_Traget ,attr_type )
	local a = 1
	SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")
	if Lv >= 200 then
		a = 0
	SystemNotice (role , "\196\235\255 \228\224\235\252\237\229\233\248\229\233 \239\240\238\234\224\247\234\232 \244\229\232 \232\241\239\238\235\252\231\243\233\242\229 \194\229\235\232\234\232\233 \212\240\243\234\242 \212\229\233 ")	
	end
	local b = Percentage_Random ( a )
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) 
	if b == 1 then						
	        AddItemEffect(role , Item_Traget , 0  )
		item_energe = 0	
                attr_type_num = attr_type_num + 2
		SetItemAttr ( Item_Traget , attr_type , attr_type_num )
		local Item_MAXENERGY = 240 * ( Lv + 2 )
		
		if Item_MAXENERGY > 6480 then
			Item_MAXENERGY = 6480
		end
		local Item_MAXURE_NUM = Elf_MaxURE + 2000
		if Item_MAXURE_NUM > 32000 then
			Item_MAXURE_NUM = 32000
		end
		SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
		ResetItemFinalAttr(Item_Traget)
	        AddItemEffect(role , Item_Traget , 1  )
	else							
		item_energe = 0.5 * item_energe 
	end
		SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )
end

function Elf_LvUp_2 ( role , Item_Num , Item_Traget , attr_type )       --
        
        local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --??
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --??
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --??
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --??
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --??
    local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
    local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 

    local Lv = str + agi + dex + con + sta
    local attr_type_num = GetItemAttr( Item_Traget ,attr_type )
    local a = 1
    SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
    if Lv >= 500 then
        a = 0
   SystemNotice (role , "\196\235\255 \228\224\235\252\237\229\233\248\229\233 \239\240\238\234\224\247\234\232 \244\229\232,\232\241\239\238\235\252\231\243\233\242\229 \203\229\227\229\237\228\224\240\237\251\233 \212\240\243\234\242 \212\229\233 ")	
   end

    local b = Percentage_Random ( a )
    
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) --??????
        --local item_maxenerge = GetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ) --?????????
   
    if b == 1 then                        --???????,??????? -- ITEMATTR_ENERGY
            AddItemEffect(role , Item_Traget , 0  )
        item_energe = 0  
        
                attr_type_num = attr_type_num + 2
        SetItemAttr ( Item_Traget , attr_type , attr_type_num )

        local Item_MAXENERGY = 240 * ( Lv + 2 )
        
        if Item_MAXENERGY > 6480 then
            Item_MAXENERGY = 6480
        end


        local Item_MAXURE_NUM = Elf_MaxURE + 2000

        if Item_MAXURE_NUM > 32000 then
            Item_MAXURE_NUM = 32000
        end
        
        SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
        SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
        ResetItemFinalAttr(Item_Traget)
            AddItemEffect(role , Item_Traget , 1  )
    else                            --??????????????
        item_energe = 0.5 * item_energe   
    end
        SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )


end

function Elf_LvUp_3 ( role , Item_Num , Item_Traget , attr_type )       --
        
        local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --??
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --??
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --??
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --??
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --??
    local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
    local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 

    local Lv = str + agi + dex + con + sta
    local attr_type_num = GetItemAttr( Item_Traget ,attr_type )

    local a = 1
    SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
    if Lv >= 800 then
        a = 0
	SystemNotice (role , "\196\235\255 \228\224\235\252\237\229\233\248\229\233 \239\240\238\234\224\247\234\232 \244\229\232,\232\241\239\238\235\252\231\243\233\242\229 \193\238\230\229\241\242\226\229\237\237\251\233 \212\240\243\234\242 \212\229\233 ")	
    end
    
    local b = Percentage_Random ( a )
    
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) --??????
        --local item_maxenerge = GetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ) --?????????
   
    if b == 1 then                        --???????,??????? -- ITEMATTR_ENERGY
            AddItemEffect(role , Item_Traget , 0  )
        item_energe = 0 
        
                attr_type_num = attr_type_num + 2
        SetItemAttr ( Item_Traget , attr_type , attr_type_num )

        local Item_MAXENERGY = 240 * ( Lv + 2 )
        
        if Item_MAXENERGY > 6480 then
            Item_MAXENERGY = 6480
        end


        local Item_MAXURE_NUM = Elf_MaxURE + 2000

        if Item_MAXURE_NUM > 32000 then
            Item_MAXURE_NUM = 32000
        end
        
        SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
        SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
        ResetItemFinalAttr(Item_Traget)
            AddItemEffect(role , Item_Traget , 1  )
    else                            --??????????????
        item_energe = 0.5 * item_energe   
    end
        SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )


end

----------------------------------------
function Give_ElfEXP_MISSION ( role , num )						--??????????

	local Item = GetChaItem ( role , 2 ,  2  ) 
	local Elf_EXP =  GetItemAttr( Item ,ITEMATTR_ENERGY )		--????????
	local Elf_MaxEXP = GetItemAttr( Item ,ITEMATTR_MAXENERGY )	--????????
	local Elf_URE = GetItemAttr( Item ,ITEMATTR_URE )			--????????
	if Elf_URE <= 50 then									
		SystemNotice (role , "Fairy cannot gain any Growth as it is low on stamina")			--????50???????exp
		return 0 
	else 
		Elf_URE = Elf_URE - 40								--?????,????40???,????EXP
		SetItemAttr ( Item , ITEMATTR_URE , Elf_URE ) 
		num = math.min ( num , Elf_MaxEXP - Elf_EXP ) 
		SetItemAttr ( Item , ITEMATTR_ENERGY , num ) 
	end 
	return 1 
end 


-----------------------------------------------
function CheckElfHaveSkill ( Num , SkillType , SkillNum )
	--Notice( "BEGINCheckElfHaveSkill" )

	local Part2 = GetNum_Part2 ( Num )	--Get Num Part 1 ? Part 7
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )


	if Part3 == SkillType and Part2 == SkillNum then
		return 1

	elseif Part2 == SkillNum then
		return 2
	end
	
	if Part5 == SkillType and Part4 == SkillNum then
		return 1
	elseif Part4 == SkillNum then
		return 2
	end
	
	if Part7 == SkillType and Part6 == SkillNum then
		return 1
	elseif Part6 == SkillNum then
		return 2
	end
	
	return 0

end

----------------------------------------------------------

function AddElfSkill ( Item , SkillType , SkillNum )
	--Notice( "BEGINAddElfSkill" )
	

	local Num = GetItemForgeParam ( Item , 1 ) --??32???????	
	--Notice ( "Num= "..Num)
	local Part1 = GetNum_Part1 ( Num )	--Get Num Part 1 ? Part 7
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )

	if Part2 == SkillNum then
		Part3 = SkillType
		Num = SetNum_Part3 ( Num , Part3 )
		Num = SetNum_Part2 ( Num , Part2 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end
	
	if Part4 == SkillNum then
		Part5 = SkillType
		Num = SetNum_Part5 ( Num , Part5 )
		Num = SetNum_Part4 ( Num , Part4 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end

	if Part6 == SkillNum then
		 Part7 = SkillType
		Num = SetNum_Part7 ( Num , Part7 )
		Num = SetNum_Part6 ( Num , Part6 )
		SetItemForgeParam ( Item , 1 , Num )
		return 
	end

	local rad = math.random( 1 , 100 )   --?? 1,100                            
	if Part2 == 0 and Part3 == 0 then
		Part2 = SkillNum
		Part3 = SkillType
		Num = SetNum_Part3 ( Num , Part3 )
		Num = SetNum_Part2 ( Num , Part2 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
		if rad<= 30 then	
			Part2 = SkillNum
			Part3 = SkillType
			Num = SetNum_Part3 ( Num , Part3 )
			Num = SetNum_Part2 ( Num , Part2 )
			SetItemForgeParam ( Item , 1 , Num )
			return
		--?
		--???
		end
	end
	if Part4 == 0 and Part5 == 0 then
		Part4 = SkillNum
		Part5 = SkillType
		Num = SetNum_Part5 ( Num , Part5 )
		Num = SetNum_Part4 ( Num , Part4 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
		if rad> 30 and rad < 60 then
			Part4 = SkillNum
			Part5 = SkillType
			Num = SetNum_Part5 ( Num , Part5 )
			Num = SetNum_Part4 ( Num , Part4 )
			SetItemForgeParam ( Item , 1 , Num )
			return
			--?
			--???
		end
	end
	if Part6 == 0 and Part7 == 0 then
		Part6 = SkillNum
		Part7 = SkillType
		Num = SetNum_Part7 ( Num , Part7 )
		Num = SetNum_Part6 ( Num , Part6 )
		SetItemForgeParam ( Item , 1 , Num )
		return
	else
			Part6 = SkillNum
			Part7 = SkillType
			Num = SetNum_Part7 ( Num , Part7 )
			Num = SetNum_Part6 ( Num , Part6 )	
			SetItemForgeParam ( Item , 1 , Num )
		return
	end
end

------------------------------------------------------------------

function CheckHaveElf ( role )
	local Item = GetChaItem ( role , 2 , 1  ) --???????????
	if Item == nil then              --?Item == 0 ????
		return 0
	end
	
	local Item_Type =  GetItemType ( Item ) --Item ?????
	
	if Item_Type ~= 59 then
		return 0
	else
		local ELf_URE = GetItemAttr( Item ,ITEMATTR_URE )  --????

		if ELf_URE <= 49 then
			return 0
		end
	end
	--Notice("CheckHaveElf has been executed" )
	return Item

end

--????

--???
function ElfSKill_PowerSheild ( role , Elf_Item , Num , dmg )
	if dmg <= 0 then
		return 0
	end
	local role_hp = Hp ( role )
	local role_maxhp = Mxhp ( role )
	local havehp = role_maxhp / role_hp
	if havehp < 5 then
		return 0
	end
	local Elf_SheildLv = GetElfSkill_Lv ( Num , 1 )
	dmg = math.floor ( dmg * ( 0.3 + Elf_SheildLv * 0.15 )  ) 

	local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
	local Dmg_Take_rad = 10 
	local Elf_Dmg_CanTake = ( Item_URE - 50 ) / Dmg_Take_rad
	
	if Elf_Dmg_CanTake >= dmg then
		local Elf_URE_Take = math.floor ( dmg * Dmg_Take_rad )
		local Elf_URE_Notice = math.floor ( Elf_URE_Take / 50 )
		Take_ElfURE ( role , Elf_Item , 2 , Elf_URE_Take )
		SystemNotice ( role , "\212\229\255 \239\238\227\235\238\242\232\235\224 "..dmg.." \243\240\238\237\224 ")
		return dmg
	else
		SystemNotice ( role , "\211 \212\229\232 \237\229\228\238\241\242\224\242\238\247\237\238 \226\251\237\238\241\235\232\226\238\241\242\232 \228\235\255 \224\234\242\232\226\224\246\232\232 \237\224\226\251\234\224 \199\224\249\232\242\224 " )
		return 0
	end
end

--??????????
function GetElfSkill_Lv ( Num , SkillNum )
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )
	
	if SkillNum == Part2 then
		return Part3
	elseif SkillNum == Part4 then
		return Part5
	elseif SkillNum == Part6 then
		return Part7
	end
	return 0
end

--??

function ElfSKill_ElfCrt ( role , Elf_Item , Num )
	local Elf_SkillLv = GetElfSkill_Lv ( Num , 2 )
	local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
	if Item_URE < 50 then
		SystemNotice ( role , "\211 \212\229\232 \237\229\228\238\241\242\224\242\238\247\237\238 \226\251\237\238\241\235\232\226\238\241\242\232 \228\235\255 \224\234\242\232\226\224\246\232\232 \237\224\226\251\234\224 \193\229\240\241\229\240\234 " )
		return 0
	end
	local b = ( Elf_SkillLv * 2 + 1 )  * 0.01
	local a = Percentage_Random ( b )
	if a == 1 then
		
		Take_ElfURE ( role , Elf_Item , 2 , Elf_SkillLv )
		return 1
		
	else
		return 0
	end
end

--??

function ElfSkill_MagicAtk ( dmg , role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0 then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 3 )
		if CheckElfSkill == 2 then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 3 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50 then
				SystemNotice ( role , "Fairy does not have enough stamina to activate any skill" )
				return 0
			else
				if Elf_SkillLv == 1 then	
					Take_ElfURE ( role , Elf_Item , 2 , 1 )
					return dmg * 0.05 + 5 
				elseif Elf_SkillLv == 2 then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return dmg * 0.08 + 8
				elseif Elf_SkillLv == 3 then
					Take_ElfURE ( role , Elf_Item , 2 , 3 )
					return dmg * 0.1 + 10
				end
			end
		end
	end
	return 0
end


--??
function ElfSkill_HpResume ( role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0 then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 4 )
		if CheckElfSkill == 2 then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 4 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50 then
				SystemNotice ( role , "Fairy does not have enough stamina to activate any skill" )
				return 0
			else
				if Elf_SkillLv == 1 then	
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 10
				elseif Elf_SkillLv == 2 then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 20
				elseif Elf_SkillLv == 3 then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 35
				end
			end
		end
	end
	return 0
end


--??

function ElfSkill_SpResume ( role )
	local Elf_Item = CheckHaveElf ( role )
	if Elf_Item ~= 0 then
		local Num = GetItemForgeParam ( Elf_Item , 1 )
		local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 5 )
		if CheckElfSkill == 2 then
			local Elf_SkillLv = GetElfSkill_Lv ( Num , 5 )
			local Item_URE = GetItemAttr( Elf_Item , ITEMATTR_URE )
			if Item_URE <= 50 then
				SystemNotice ( role , "Fairy does not have enough stamina to activate any skill" )
				return 0
			else
				if Elf_SkillLv == 1 then	
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 10
				elseif Elf_SkillLv == 2 then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 20
				elseif Elf_SkillLv == 3 then
					Take_ElfURE ( role , Elf_Item , 2 , 2 )
					return 35
				end
			end
		end
	end
	return 0
end
--------------------------------???????
function CreditExchangeImpl( role, tp )
	local i = CheckBagItem( role,3849 )
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 3849 )
		local rongyu_num=GetItemAttr ( Item , ITEMATTR_VAL_STR )
		if rongyu_num<=0 then
			SystemNotice ( role , "You will not receive any blessing without a postive Honor value!")
			return
		end
		local middle=0
		if rongyu_num<30000 then
			middle=30000 - rongyu_num
		end
		middle= math.floor ( middle / 2 )
		local exp_star=GetChaAttr (  role , ATTR_CEXP )----------????
		local job = GetChaAttr(role, ATTR_JOB)
		local lv=GetChaAttr(role, ATTR_LV) 
		local money_num=rongyu_num*100
		local exp_num=rongyu_num*5+exp_star
		local rad=math.random(1,30000)
		local cha_type = GetChaTypeID ( role )
		local cha_namea = GetChaDefaultName ( role )
		LG( "star_rongyuzhichange_lg" ,cha_namea, tp , lv , exp_star , job , cha_type)
		if tp==0 or tp==1 or tp==2 then ----?????
			if lv>=15 and lv<=40 then
				money_num=rongyu_num*200
			elseif lv>=41 and lv<=60 then
				money_num=rongyu_num*250
			elseif lv>=61 then
				money_num=rongyu_num*300
			end
			AddMoney ( role , 0 , money_num ) 
		LG( "star_rongyuzhichange_lg" ,cha_namea.."tp==0 or tp==1 or tp==2 obtain gold"..money_num)
		elseif tp==3 or tp==4 or tp==5 then -----??????
			local dif_exp = rongyu_num*20+exp_star - DEXP[lv+1]
			if lv>=15 and lv<=30 then
				exp_num=rongyu_num*10+exp_star
				local a1= math.floor (rongyu_num*10 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=31 and lv<=40 then
				exp_num=rongyu_num*13+exp_star
				local a1= math.floor (rongyu_num*13 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=41 and lv<=50 then
				exp_num=rongyu_num*22+exp_star
				local a1= math.floor (rongyu_num*22 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=51 and lv<=60 then
				exp_num=rongyu_num*44+exp_star
				local a1= math.floor (rongyu_num*44 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=61 and lv<=70 then
				exp_num=rongyu_num*102+exp_star
				local a1= math.floor (rongyu_num*102 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=71 and  lv<=78 then
				exp_num=rongyu_num*270+exp_star
				local a1= math.floor (rongyu_num*270 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv==79 and dif_exp<=0 then 
				exp_num=rongyu_num*270+exp_star
				local a1= math.floor (rongyu_num*270 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv==79 and dif_exp>0 then 
				exp_num = dif_exp*0.02 + DEXP[lv+1]
				local a1= math.floor (rongyu_num*270)
				SystemNotice ( role , "Obtained EXP"..a1 )
			elseif lv>=80  then
				exp_num=rongyu_num*270*0.02+exp_star
				local a1= math.floor (rongyu_num*270 )
				SystemNotice ( role , "Obtained EXP"..a1 )
			end
			SetChaAttrI( role , ATTR_CEXP , exp_num )
			local lg_exp=exp_num-exp_star
			LG( "star_rongyuzhichange_lg" ,cha_namea.."tp==3 or tp==4 or tp==5 obtain experience"..lg_exp)
		elseif tp==6 or tp==7 or tp==8 then -----??????
			if lv>=15 and lv<=40 then
				if rad<=rongyu_num or rongyu_num>=30000 then
					GiveItem ( role , 0 , 3458  , 1 , 4 ) 
					LG( "star_rongyuzhichange_lg" ,cha_namea.."Lv>=15 and Lv<=40 will obtained equipment ID="..3458)
				elseif rad>rongyu_num and rad<=middle then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000 then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					SystemNotice ( role , "Obtained EXP"..a1 )
				end
			elseif lv>=41 and lv<=60 then
				if rad<=rongyu_num or rongyu_num>=30000 then
					local rad1=math.random(1,12)
					local Lg_ID=787
					if rad1==1 then
						Lg_ID=787
					elseif rad1==2 then
						Lg_ID=791
					elseif rad1==3 then
						Lg_ID=794
					elseif rad1==4 then
						Lg_ID=801
					elseif rad1==5 then
						Lg_ID=805
					elseif rad1==6 then
						Lg_ID=797
					elseif rad1==7 then
						Lg_ID=765
					elseif rad1==8 then
						Lg_ID=768
					elseif rad1==9 then
						Lg_ID=772
					elseif rad1==10 then
						Lg_ID=775
					elseif rad1==11 then
						Lg_ID=779
					elseif rad1==12 then
						Lg_ID=783
					end
					GiveItem ( role , 0 , Lg_ID  , 1 , 4 ) 
					LG( "star_rongyuzhichange_lg" ,cha_namea.."lv>=41 and lv<=60receive apparelID="..Lg_ID)
				elseif rad>rongyu_num and rad<=middle then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000 then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					SystemNotice ( role , "Obtained EXP "..a1 )
				end
			elseif lv>=61 then
				if rad<=rongyu_num or rongyu_num>=30000 then
				local rad2=math.random(1,3)
				local rad3=math.random(1,4)
					local Lg_ID=2530
					if job == 8 then --??
						if rad2==1 then
							Lg_ID=2530
						elseif rad2==2 then
							Lg_ID=2531
						elseif rad2==3 then
							Lg_ID=2532
						end
					elseif job == 9 then   --??
						if rad2==1 then
							Lg_ID=2533
						elseif rad2==2 then
							Lg_ID=2534
						elseif rad2==3 then
							Lg_ID=2535
						end
					elseif job == 12 then --???
						if rad2==1 then
							Lg_ID=2536
						elseif rad2==2 then
							Lg_ID=2537
						elseif rad2==3 then
							Lg_ID=2538
						end
					elseif job == 16 then ---- "Voyager"
						if cha_type~=4 then
							if rad2==1 then
								Lg_ID=2539
							elseif rad2==2 then
								Lg_ID=2540
							elseif rad2==3 then
								Lg_ID=2541
							end
						else
							if rad3==1 then
								Lg_ID=2539
							elseif rad3==2 then
								Lg_ID=2540
							elseif rad3==3 then
								Lg_ID=2541
							elseif rad3==4 then
								Lg_ID=2548
							end
						end
					elseif job == 13 then    ---- "Cleric"
						if cha_type~=4 then
							if rad2==1 then
								Lg_ID=2542
							elseif rad2==2 then
								Lg_ID=2543
							elseif rad2==3 then
								Lg_ID=2544
							end
						else
							if rad3==1 then
								Lg_ID=2542
							elseif rad3==2 then
								Lg_ID=2543
							elseif rad3==3 then
								Lg_ID=2544
							elseif rad3==4 then
								Lg_ID=2548
							end
						end
					elseif job == 14 then    ---- "Seal Master"
						if cha_type~=4 then
							if rad2==1 then
								Lg_ID=2545
							elseif rad2==2 then
								Lg_ID=2546
							elseif rad2==3 then
								Lg_ID=2547
							end
						else
							if rad3==1 then
								Lg_ID=2545
							elseif rad3==2 then
								Lg_ID=2546
							elseif rad3==3 then
								Lg_ID=2547
							elseif rad3==4 then
								Lg_ID=2548
							end
						end
					end
					GiveItem ( role , 0 , Lg_ID  , 1 , 4 ) 
					LG( "star_rongyuzhichange_lg" ,cha_namea.."Lv>61 obtain equipment ID="..Lg_ID)
				elseif rad>rongyu_num and rad<=middle then
					AddMoney ( role , 0 , money_num ) 
				elseif rad>middle and rad<=30000 then
					SetChaAttrI( role , ATTR_CEXP , exp_num )
					local a1= math.floor (rongyu_num*5 )
					SystemNotice ( role , "Obtained EXP "..a1 )
				end
			end			
		end
	SetItemAttr ( Item ,ITEMATTR_VAL_STR , 0 )
	end
end
-----------------------------
-----------------------------??????
function Elf_Attr_cs ( role , Item_JLone , Item_JLother )
	local Item_JLone_num={}
	local Item_JLother_num={}
	---??????????
	Item_JLone_num[1] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )	-- ?????? 26
	Item_JLone_num[2] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )	-- ?????? 27
	Item_JLone_num[3] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )	-- ?????? 28
	Item_JLone_num[4] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )	-- ?????? 29
	Item_JLone_num[5] = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )	-- ?????? 30
	Item_JLone_num[6] = GetItemAttr( Item_JLone ,ITEMATTR_URE )			--?? 
	Item_JLone_num[7] = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )		 --????
	Item_JLone_num[8] = Item_JLone_num[1] + Item_JLone_num[2] + Item_JLone_num[3] + Item_JLone_num[4] + Item_JLone_num[5]	----???????
	---???????????
	Item_JLother_num[1] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )	-- ??????  
	Item_JLother_num[2] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )	-- ??????  
	Item_JLother_num[3] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )	-- ??????  
	Item_JLother_num[4] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )	-- ??????  
	Item_JLother_num[5] = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )	-- ??????  
	Item_JLother_num[6] = GetItemAttr( Item_JLother ,ITEMATTR_URE )			--?? 
	Item_JLother_num[7] = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )		 --????
	Item_JLother_num[8] = Item_JLother_num[1] + Item_JLother_num[2] + Item_JLother_num[3] + Item_JLother_num[4] + Item_JLother_num[5]	----???????

	local m=0
	local n = 0
	local num_jlone=26
	local num_jlother=26
	local max_JLone_temp=Item_JLone_num[1]
	local max_JLother_temp=Item_JLother_num[1]
	for m=1,4,1 do
		if Item_JLone_num[m+1] >max_JLone_temp then
			max_JLone_temp=Item_JLone_num[m+1]
			num_jlone=m+26
		end
	end
	for n=1,4,1 do
		if Item_JLother_num[n+1] >max_JLother_temp then
			max_JLother_temp=Item_JLother_num[n+1]
			num_jlother=n+26
		end
	end

	max_JLone_temp = max_JLone_temp - 199
	max_JLother_temp = max_JLother_temp - 199
	local new_JLone_MAXENERGY = 240 * (Item_JLone_num[8] + 1 - 4 )
	if new_JLone_MAXENERGY > 6480 then
		new_JLone_MAXENERGY = 6480
	end
	local new_JLone_MAXURE = 5000 + 1000*(Item_JLone_num[8] - 4 )
	if new_JLone_MAXURE > 32000 then
		new_JLone_MAXURE = 32000
	end
	local new_JLother_MAXENERGY = 240 * (Item_JLother_num[8] + 1 - 4 )
	if new_JLother_MAXENERGY > 6480 then
		new_JLother_MAXENERGY = 6480
	end
	local new_JLother_MAXURE = 5000 + 1000*(Item_JLother_num[8] - 4 )
	if new_JLother_MAXURE > 32000 then
		new_JLother_MAXURE = 32000
	end
	----?????????
	SetItemAttr ( Item_JLone , num_jlone , max_JLone_temp )
	SetItemAttr ( Item_JLone , ITEMATTR_ENERGY , 240) 	
	SetItemAttr ( Item_JLone , ITEMATTR_MAXENERGY , new_JLone_MAXENERGY )
	SetItemAttr ( Item_JLone , ITEMATTR_URE , 5000 ) 	
	SetItemAttr ( Item_JLone , ITEMATTR_MAXURE , new_JLone_MAXURE ) 	
	----??????????
	SetItemAttr ( Item_JLother , num_jlother , max_JLother_temp )
	SetItemAttr ( Item_JLother , ITEMATTR_ENERGY , 240 ) 	
	SetItemAttr ( Item_JLother , ITEMATTR_MAXENERGY , new_JLother_MAXENERGY )
	SetItemAttr ( Item_JLother , ITEMATTR_URE , 5000 ) 	
	SetItemAttr ( Item_JLother , ITEMATTR_MAXURE , new_JLother_MAXURE )  	
end
function  TigerStart( ... )
	if arg.n ~= 4 then
		SystemNotice ( arg[1] , "Неверное значение параметра: "..arg.n )
		return 
	end	
	local num = {}
	local Item_type = {}
	local num_star = 0
	local n  = 0
	local m = 0
	local i = 0
	local q=0
	for n=1,9,1 do 
		local star = math.random ( 1 , 4700 )
		local ret1 = IsItemValid(star)
		if ret1 ~= LUA_TRUE then
			for m=1,300,1 do
				local ret2 = IsItemValid(star+m)
				if ret2 ~=LUA_TRUE then
				else
					num[n] = star+m
				end
			end
		else 
			num [n]=star
		end
	end
	for i=1,9,1 do
		Item_type[i] = GetItemType2( num [i] )
	end
	local NocLock =	KitbagLock(arg[1], 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( arg[1] , "\194\224\248 \232\237\226\229\237\242\224\240\252 \231\224\225\235\238\234\232\240\238\226\224\237 ")
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( arg[1] )	
	if Item_CanGet < 5 then
		SystemNotice( arg[1] ,"\205\243\230\237\238 5 \241\226\238\225\238\228\237\251\245 \236\229\241\242 \226 \232\237\226\229\237\242\224\240\229 ")
		return 0
	end
	local Money_Have = GetChaAttr ( arg[1]  , ATTR_GD )
	if Money_Have>1000000000 then
		SystemNotice (arg[1], "\211 \226\224\241 \225\238\235\252\248\229 1 \236\232\235\235\232\224\240\228\224 \231\238\235\238\242\224,\253\242\238 \238\239\224\241\237\238,\239\229\240\229\226\229\228\232\242\229 \229\227\238 \226 \234\243\239\254\240\251 ")
		return	
	end
	if arg[2]==1 then
		local j1 = TakeItem(  arg[1], 0,855, 5 )			        
		if j1==0 then
			SystemNotice ( arg[1] ,"\206\248\232\225\234\224 \239\240\232 \243\228\224\235\229\237\232\232 \204\238\237\229\242\251 \212\229\232 ")
			return
		end
	end
	if arg[3]==1 then
		local j2 = TakeItem(  arg[1], 0,855, 5 )			            
		if j2==0 then
			SystemNotice ( arg[1] ,"\206\248\232\225\234\224 \239\240\232 \243\228\224\235\229\237\232\232 \204\238\237\229\242\251 \212\229\232 ")
			return
		end		
	end
	if arg[4]==1 then
		local j3 = TakeItem(  arg[1], 0,855, 5 )			            
		if j3==0 then
			SystemNotice ( arg[1] ,"\206\248\232\225\234\224 \239\240\232 \243\228\224\235\229\237\232\232 \204\238\237\229\242\251 \212\229\232 ")
			return
		end		
	end
	local lhj_te_flg=0
	local lhj_yi_flg=0
	local lhj_hei_flg=0
	local now_day= os.date("%d")		
	local now_hour= os.date("%H")		
	local now_miniute= os.date("%M")	
	local now_scend=  os.date("%S")		
	now_day= tonumber(now_day)			
	now_hour= tonumber(now_hour)		
	now_miniute= tonumber(now_miniute)	 	
	now_scend= tonumber(now_scend)		
	local CheckTimeNum = now_day*86400 + now_hour*3600+now_miniute*60+now_scend
	if CheckTimeNum>NOWTIME_TE+86400 then
		NOWTIME_TE=CheckTimeNum
		lhj_te_flg=1
	end
	if CheckTimeNum>NOWTIME_YI+3600 then
		NOWTIME_YI=CheckTimeNum
		lhj_yi_flg=1
	end
	if CheckTimeNum>NOWTIME_HEI+518400 then
		NOWTIME_HEI=CheckTimeNum
		lhj_hei_flg=1
	end
	local num_s=0
	for num_s=1,3,1 do 
		if Item_type[num_s]>=1 and Item_type[num_s]<=11 then
			if Item_type[num_s+3] >=1 and Item_type[num_s+3]<=11 then
				num[num_s+3] = num[num_s]
			end
			if Item_type[num_s+6] >=1 and Item_type[num_s+6]<=11 then
				num[num_s+6] = num[num_s]
			end
		end
		if Item_type[num_s]>=22 and Item_type[num_s]<=29 then
			if Item_type[num_s+3] >=22 and Item_type[num_s+3]<=29 then
				num[num_s+3] = num[num_s]
			end
			if Item_type[num_s+6] >=22 and Item_type[num_s+6]<=29 then
				num[num_s+6] = num[num_s]
			end
		end
		if Item_type[num_s]>=36 and Item_type[num_s]<=66 then
			if Item_type[num_s+3] >=36 and Item_type[num_s+3]<=66 then
				num[num_s+3] = num[num_s]
			end
			if Item_type[num_s+6] >=36 and Item_type[num_s+6]<=66 then
				num[num_s+6] = num[num_s]
			end
		end
	end
	local j=0
	for j=1,9,1 do
		Item_type[j] = GetItemType2( num [j] )
		if num[j]==822 or num[j]==823 or num[j]==825 or num[j]==826 or num[j]==827 or num[j]==1116 or num[j]==1117 or num[j]==1118 or num[j]==46  or num[j]==1124  or num[j]==1125  or num[j]==1126  or num[j]==1127 or  num[j]==1057  or  num[j]==1060   or  num[j]==1063    or  num[j]==1066   or  num[j]==1034  or  num[j]==586  or  num[j]==762  or  num[j]==3061  or  num[j]==410   or  num[j]==2885  then
			num[j]=3360 
		end
		if num[j]>=845 and num[j]<=847 then
			local rad_s= math.random ( 1 , 40 )
			if rad_s>=3 or lhj_hei_flg==0 then
				num[j]=3360 
			end
		end
		
		if Item_type[j]~=1 and Item_type[j]~=2 and Item_type[j] ~=3 and Item_type[j] ~=4 and Item_type[j] ~=7 and Item_type[j] ~=9 and Item_type[j] ~=11 and Item_type[j] ~=22 and Item_type[j] ~=23 and Item_type[j] ~=24 and Item_type[j] ~=25 and Item_type[j] ~=26 and Item_type[j] ~=27 and Item_type[j] ~=29 and Item_type[j] ~=36 and Item_type[j] ~=47 and Item_type[j] ~=50 and Item_type[j] ~=57 and Item_type[j] ~=58 and Item_type[j] ~=60 and Item_type[j] ~=65 and Item_type[j] ~=66 then
			local eleven = math.random ( 1 , 1000 )	
			local new_id = math.random ( 3850 , 3875 )
			if eleven <= 328 then
				num[j]= new_id 
			elseif eleven >=1 and  eleven<=999 then
				num[j]=3360 
			else
				num[j]=194 
			end
		end
	end
	local rad1= 0
	local rad2= 0
	local rad3= 0
	local rad4= 0
	local rad5= 0
	local rad6= 0
	local rad7= 0
	local rad8= 0
	local rad9= 0
	local rad10= 0
	local rad11= 0
	
	local p=0
	local p=0
	for p=1,9,1 do
		if num[p]>=831 and num[p]<=842 then
			rad1=1
		end
		if num[p]>=2300 and num[p]<=2344 then
			rad2=1
		end
		if num[p]>=2367 and num[p]<=2407 then
			rad3=1
		end
		if num[p]>=2549 and num[p]<=2553 then
			rad4=1
		end
		if num[p]>=2588 and num[p]<=3061 then
			rad5=1
		end
		if num[p]>=3485 and num[p]<=3800 then
			rad6=1
		end
		if num[p]>=4311 and num[p]<=4313 then
			rad7=1
		end
		if num[p]>=28 and num[p]<=31 then
			rad8=1
		end
		if num[p]>=194 and num[p]<=227 then
			rad9=1
		end
		if num[p]>=276 and num[p]<=280 then
			rad10=1
		end
		local h=0
		for h=1,252,1 do
			if num[p]==LHJ_ID[h] then
				rad11=1
			end
		end
		if rad1==1 or  rad2==1 or rad3==1 or  rad4==1 or rad5==1 or rad6==1 or  rad7==1  or  rad8==1  or  rad9==1 or  rad10==1  or rad11==1 or  num[p]==5694 or num[p]==5695 or num[p]==5702 or num[p]==5703 or num[p]==5704 or num[p]==5705  or num[p]==5710 or num[p]==5711 or num[p]==5712 or num[p]==5713 or num[p]==7484 or num[p]==7485 or num[p]==7486 or num[p]==7489 or num[p]==7491 or num[p]==7492 or num[p]==7493 or num[p]==7494  or num[p]==7495 or num[p]==7483 or num[p]==7510 or num[p]==7511 or num[p]==7482 or num[p]==7469 then
		num[p]= new_id1 
		end
	end
	local reset_rad=math.random ( 1 , 100 )
	local kapian_rad=math.random ( 3850 , 3875 )
	if reset_rad>=47 and num[1]==num[3] and num[1]==num[5] and num[1]==num[7]  and num[1]==num[9]  then
		num[9]=kapian_rad
	end
	if reset_rad>=24 and num[2]==num[4] and num[2]==num[5] and num[2]==num[6]  and num[2]==num[8]  then
		num[8]=kapian_rad
	end
	if  num[1]==num[2] and num[1]==num[3] and num[1]==num[4]  and num[1]==num[6] and num[1]==num[7] and num[1]==num[8]  and num[1]==num[9] then
		if lhj_yi_flg==0 or reset_rad>=10 then
			num[9]=kapian_rad
		end
	end
	if  num[1]==num[2] and num[1]==num[3] and num[1]==num[4] and num[1]==num[5] and num[1]==num[6] and num[1]==num[7] and num[1]==num[8]  and num[1]==num[9] then
		if lhj_te_flg==0 or reset_rad>=2 then
			num[9]=kapian_rad
		end
	end
	return num[1] , num[2] , num[3] , num[4] , num[5] , num[6] , num[7] , num[8] , num[9] 
end

function TigerStop(...)
	if arg.n ~= 13 then
		SystemNotice ( arg[1] , "Неверное значение параметра: "..arg.n )
		return 
	end	
	local flag=0
	if arg[11]==1 and arg[12]==1 and arg[13]==1 then
		flag=1
	end
	local flag_myp=1
	if arg[2]==0 or arg[3]==0 or arg[4]==0 or arg[5]==0 or arg[6]==0 or arg[7]==0 or arg[8]==0 or  arg[9]==0 or arg[10]==0 or arg[2]==nil or arg[3]==nil or arg[4]==nil or arg[5]==nil or arg[6]==nil or arg[7]==nil or arg[8]==nil or  arg[9]==0 or arg[10]==nil then
		 flag_myp=0
		return 	
	end
	local new_id = math.random ( 3850 , 3875 )
	if arg[2] == arg[3] and arg[3] == arg[4] and arg[4] == arg[5]  and arg[5] == arg[6] and arg[6] == arg[7] and arg[7] == arg[8] and arg[8] == arg[9] and arg[9] == arg[10]  and arg[2]~=new_id and flag==1 and flag_myp==1 then 
		local cha_name4 = GetChaDefaultName ( arg[1] ) 
		local item_rad = math.random ( 1 , 9 )
		if item_rad==1 then
			item_rad_id=7502
		elseif item_rad==2 then
			item_rad_id=7502
		elseif item_rad>=3 or  item_rad<=8 then
			item_rad_id=7502
		else
			item_rad_id=7502
		end
		local itemname12 = GetItemName ( item_rad_id ) 
		local message4 = cha_name4.." \226\251\225\232\226\224\229\242 \226 \224\226\242\238\236\224\242\229 \235\238\242 \206\227\240\238\236\237\251\229 \193\238\227\224\242\241\242\226\224 \232 \226\251\232\227\240\251\226\224\229\242 \236\232\235\235\232\224\240\228 \231\238\235\238\242\224 \232 "..itemname12
		Notice ( message4 )
		SynTigerString ( arg[1] ," \226\251\225\232\226\224\229\242 \226 \224\226\242\238\236\224\242\229 \235\238\242 \206\227\240\238\236\237\251\229 \193\238\227\224\242\241\242\226\224 \232 \226\251\232\227\240\251\226\224\229\242 \236\232\235\235\232\224\240\228 \231\238\235\238\242\224 \232 "..itemname12 )
		AddMoney ( arg[1] , 0 , 1000000000 )
		GiveItem ( arg[1] , 0 , 7503  , 5 , 4  )
		GiveItem ( arg[1] , 0 , item_rad_id  , 1 , 4  )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s12=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , s12  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		LG( "LHJ_wanshou_lg" ,cha_name4,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
		
	end
	if arg[2] == arg[3] and arg[3] == arg[4] and arg[4] == arg[5] and arg[5] == arg[7] and arg[7] == arg[8] and arg[8] == arg[9] and arg[9] == arg[10]  and arg[2]~=new_id and flag==1  and flag_myp==1  then 
		
		local item_rad = math.random ( 1 , 8 )
		if item_rad==1 then
			item_rad_id=7477
		elseif item_rad==2 then
			item_rad_id=7478
		elseif item_rad==3 then
			item_rad_id=7479
		elseif item_rad==4 then
			item_rad_id=7480
		elseif item_rad==5 then
			item_rad_id=7481
		elseif item_rad==6 then
			item_rad_id=7476
		elseif item_rad==7 then
			item_rad_id=7451
		else
			item_rad_id=7453
		end
		local itemname11 = GetItemName ( item_rad_id ) 
		local cha_name3 = GetChaDefaultName ( arg[1] ) 
		local message3 = cha_name3.." \226\251\225\232\226\224\229\242 \235\238\242 \194\241\229\238\225\249\232\233 \207\240\224\231\228\237\232\234 \232 \226\251\232\227\240\251\226\224\229\242 50 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 \232 "..itemname11
		Notice ( message3 )
		SynTigerString ( arg[1] ," \207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \194\241\229\238\225\249\232\233 \207\240\224\231\228\237\232\234 \232 \239\238\235\243\247\232\235\232 50 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 \232 "..itemname11)
		AddMoney ( arg[1] , 0 , 50000000 )
		GiveItem ( arg[1] , 0 ,7503  , 1 , 4  )
		
		GiveItem ( arg[1] , 0 , item_rad_id  , 1 , 4  )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s11=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , s11  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		LG( "LHJ_putian_lg" ,cha_name3,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
		
	end
	if arg[3] == arg[5] and arg[5] == arg[6] and arg[6] == arg[7] and arg[7] == arg[9] and arg[3]~=new_id and flag==1  and flag_myp==1 then 
		local itemname2 = GetItemName ( arg[3] ) 
		local cha_name2 = GetChaDefaultName ( arg[1] ) 
		local message2 = cha_name2.." \226\251\225\232\226\224\229\242 \194\229\235\232\234\238\235\229\239\237\243\254 \196\229\241\255\242\234\243 \232 \239\238\235\243\247\224\229\242 5 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 "
		Notice ( message2 )
		SynTigerString( arg[1] ," \226\251\225\232\226\224\229\242 \194\229\235\232\234\238\235\229\239\237\243\254 \196\229\241\255\242\234\243 \232 \239\238\235\243\247\224\229\242 5 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 5000000 )
		GiveItem ( arg[1] , 0 ,7502  , 1 , 4  )
		if arg[3] ~= 3360 then 
			if arg[3] == 845 or arg[3] == 846 or arg[3] == 847 then
				local s10=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , s10  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			end
		end
		LG( "LHJ_shiquan_lg" ,cha_name2,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[2] == arg[4] and arg[4] == arg[6] and arg[6] == arg[8] and arg[8] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1  then 
		
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		local message1 = cha_name1.." \207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \211\228\224\247\237\243\254 \207\255\242\184\240\234\243 \232 \239\238\235\243\247\232\235\232 5 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 "
		Notice ( message1 )
		SynTigerString  ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \211\228\224\247\237\243\254 \207\255\242\184\240\234\243 \232 \239\238\235\243\247\232\235\232 5 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 3000000 )
		GiveItem ( arg[1] , 0 ,7502  , 1 , 4  )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s9=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , s9  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		LG( "LHJ_wufu_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[2] == arg[4] and arg[4] == arg[8] and arg[8] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 2 \241\229\231\238\237\224 \232 \226\251\232\227\240\224\235\232 2 \236\232\235\235\232\238\237\224 \231\238\235\238\242\224 ")
		SynTigerString  ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 2 \241\229\231\238\237\224 \232 \226\251\232\227\240\224\235\232 2 \236\232\235\235\232\238\237\224 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 2000000 )
		GiveItem ( arg[1] , 0 , 7482  , 1 , 4  )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s8=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , s8  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_siji_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[3] == arg[5] and arg[5] == arg[7] and arg[7] == arg[9] and arg[3]~=new_id and flag==1 and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \194\229\231\243\247\232\233 \208\184\226 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		SynTigerString  ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \194\229\231\243\247\232\233 \208\184\226 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 1000000 )
		GiveItem ( arg[1] , 0 ,578  , 1 , 4  )
		local rad_heishi=math.random ( 1 , 2 )
		if rad_heishi==1 then
			GiveItem ( arg[1] , 0 , 3087  , 1 , 4  )
		else
			GiveItem ( arg[1] , 0 , 3087  , 1 , 4  )			
		end
		if arg[3] ~= 3360 then 
			if arg[3] == 845 or arg[3] == 846 or arg[3] == 847 then
				local s7=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , s7  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_xiaokong_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[4] == arg[6] and arg[6] == arg[8] and arg[4]~=new_id and flag==1 and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \199\238\235\238\242\224\255 \196\232\224\227\238\237\224\235\252 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		SynTigerString ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \199\238\235\238\242\224\255 \196\232\224\227\238\237\224\235\252 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 1000000 )
		GiveItem ( arg[1] , 0 , 7484  , 1 , 4  )
		if arg[4] ~= 3360 then 
			if arg[4] == 845 or arg[4] == 846 or arg[4] == 847 then
				local s5=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[4]  , 1 , s5  )
			else 
				GiveItem ( arg[1] , 0 , arg[4]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[2] == arg[6] and arg[6] == arg[10] and arg[2]~=new_id and flag==1 and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \193\229\235\224\255 \196\232\224\227\238\237\224\235\252 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		SynTigerString  ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \193\229\235\224\255 \196\232\224\227\238\237\224\235\252 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 1000000 )
		GiveItem ( arg[1] , 0 , 7484  , 1 , 4  )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s6=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , s6  )
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[5] == arg[6] and arg[6] == arg[7] and arg[5]~=new_id and flag==1 and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \206\247\234\238 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		SynTigerString ( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \206\247\234\238 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 1000000 )
		if arg[5] ~= 3360 then 
			if arg[5] == 845 or arg[5] == 846 or arg[5] == 847 then
				local s4=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[5]  , 1 , s4  )
			else 
				GiveItem ( arg[1] , 0 , arg[5]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[2] == arg[5] and arg[5] == arg[8] and arg[11]==1 and arg[2]~=new_id and flag_myp==1 then 
		SystemNotice ( arg[1] ,"\215\243\242\238\234 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \203\229\227\234\238\229 \194\229\231\229\237\232\229 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		SynTigerString( arg[1] ,"\215\243\242\238\234 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \203\229\227\234\238\229 \194\229\231\229\237\232\229 \232 \226\251\232\227\240\224\235\232 1 \236\232\235\235\232\238\237 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 1000000 )
		if arg[2] ~= 3360 then 
			if arg[2] == 845 or arg[2] == 846 or arg[2] == 847 then
				local s1=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 ,arg[2]  , 1 , s1  )
			else 
				GiveItem ( arg[1] , 0 , arg[2]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[3] == arg[6] and arg[6] == arg[9] and arg[12]==1 and arg[3]~=new_id and flag_myp==1 then
		SystemNotice ( arg[1] ,"\205\229 \238\241\238\225\238 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \205\229\243\228\224\247\237\232\234 \232 \226\251\232\227\240\224\235\232 500 \242\251\241\255\247 \231\238\235\238\242\224 ")
		SynTigerString( arg[1] ,"\205\229 \238\241\238\225\238 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \205\229\243\228\224\247\237\232\234 \232 \226\251\232\227\240\224\235\232 500 \242\251\241\255\247 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 500000 )
		if arg[3] ~= 3360 then 
			if arg[3] == 845 or arg[3] == 846 or arg[3] == 847 then
				local s2=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , s2  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[3]  , 1 , 23  )
			end
		end	
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	if arg[4] == arg[7] and arg[7] == arg[10] and arg[13]==1 and arg[4]~=new_id and flag_myp==1 then
		SystemNotice ( arg[1] ,"\205\229 \238\241\238\225\238 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \205\229\243\228\224\247\237\232\234 \232 \226\251\232\227\240\224\235\232 500 \242\251\241\255\247 \231\238\235\238\242\224 ")
		SynTigerString( arg[1] ,"\205\229 \238\241\238\225\238 \239\238\231\228\240\224\226\235\255\229\236 \226\251 \226\251\225\232\235\232 \234\238\236\225\232\237\224\246\232\254 \205\229\243\228\224\247\237\232\234 \232 \226\251\232\227\240\224\235\232 500 \242\251\241\255\247 \231\238\235\238\242\224 ")
		AddMoney ( arg[1] , 0 , 500000 )
		if arg[4] ~= 3360 then 
			if arg[4] == 845 or arg[4] == 846 or arg[4] == 847 then
				local s3=math.random ( 12 , 18 )
				GiveItem ( arg[1] , 0 , arg[4]  , 1 , s3  )
			
			else 
				GiveItem ( arg[1] , 0 , arg[4]  , 1 , 23  )
			end
		end
		local cha_name1 = GetChaDefaultName ( arg[1] ) 
		LG( "LHJ_qita_lg" ,cha_name1,arg[2],arg[3],arg[4],arg[5],arg[6],arg[7],arg[8],arg[9],arg[10])
	end
	local star = 0
	local eleven = 0
	for star=2,8,3 do
		if arg[star] ==194 and arg[11] == 1 and flag_myp==1 then
			eleven =eleven +1
		end
	end
	for star=3,9,3 do
		if arg[star] ==194 and arg[12] == 1 and flag_myp==1 then
			eleven =eleven +1
		end
	end
	for star=4,10,3 do
		if arg[star] ==194 and arg[13] == 1 and flag_myp==1 then
			eleven =eleven +1
		end
	end
	if eleven==0 then
		SynTigerString( arg[1] ,"\215\229\236 \247\224\249\229 \226\251 \232\227\240\224\229\242\229,\242\229\236 \225\238\235\252\248\229 \248\224\237\241 \241\238\240\226\224\242\252 \234\243\248 ")
	else 
		SystemNotice ( arg[1] ,"\194 \242\229\234\243\249\229\233 \232\227\240\229 \226\251 \226\251\232\227\240\224\235\232 "..eleven.." \231\238\235\238\242\224 \232 \239\238\235\243\247\232\235\232 "..eleven.." \234\243\239\254\240 \237\224 500 \242\251\241\255\247 ")
		SynTigerString( arg[1] ,"\207\238\231\228\240\224\226\235\255\229\236, \226\251 \226\251\232\227\240\224\235\232 "..eleven.." \234\243\239\254\240 \237\224 500 \242\251\241\255\247 ")
		GiveItem ( arg[1] , 0 , 7493  , eleven , 4  )
	end
end
--function Change_FightingBook (character, npc)
--	local HonorBook_Num = 0
--	local HonorBook_Num = CheckBagItem( character,3849 )
--	local FightingBook_Num = 0
--	local FightingBook_Num = CheckBagItem( character,3849 )
--	local retbag = HasLeaveBagGrid( character, 1)
--	if retbag ~= LUA_TRUE then
--		SystemNotice(character,"You required 1 empty inventory slot to obtain Chaos Manual")
--		return 
--	end	
--	if FightingBook_Num> 0 then
--		SystemNotice( character , "You already possess a Chaos Manual")
--		return 0
--	end
--	
--	
--	
--	if	 HonorBook_Num <= 0 then
--		GiveItem ( character , 0 , 3849  , 1 , 97 )
--	else
--		GiveItem ( character , 0 , 3849  , 1 , 97 )
--		local Book2 =  GetChaItem2 ( character , 2 , 3849 )
--		local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
--		local KillNum=GetItemAttr ( Book2 , ITEMATTR_VAL_AGI)
--		local KilledNum=GetItemAttr ( Book2 , ITEMATTR_VAL_DEX)
--		local JionNum=GetItemAttr ( Book2 , ITEMATTR_VAL_CON)
--		local VictoryNum=GetItemAttr ( Book2 , ITEMATTR_VAL_STA)
--		local PartyContributeNum=GetItemAttr ( Book2 , ITEMATTR_MAXURE)
--		local Book = GetChaItem2 ( character , 2 , 3849 )
--		SetItemAttr ( Book , ITEMATTR_VAL_STR,HonorPoint)
--		SetItemAttr ( Book , ITEMATTR_VAL_AGI,KillNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_DEX,KilledNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_CON,JionNum)
--		SetItemAttr ( Book , ITEMATTR_VAL_STA,VictoryNum)
--		SetItemAttr ( Book , ITEMATTR_MAXURE,PartyContributeNum)
----		SetItemAttr ( Book2 , ITEMATTR_MAXENERGY,FightingPoint)
--		RemoveChaItem ( character , 3849 , 1 , 2 , -1, 2 , 1  )	
--		
--	end
--end

function Change_shanyao (character, npc)
	local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE then
		SystemNotice( character , "Ваш инвентарь заблокирован ")
		return 0
	end
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( character , "У вас нет Медали отваги ")
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 200 then
			SystemNotice( character , "У вас недостаточно очков чести ")
			return 0
		end
	local HonorPoint_X=HonorPoint-200
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		if Item_CanGet <= 0 then
			SystemNotice(character ,"У вас недостаточно свободных слотов в инвентаре ")
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2614  , 1 , 4 ) 
end

function Change_rongyao (character, npc)
local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE then
		SystemNotice( character , "Ваш инвентарь заблокирован ")
		return 0
	end
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( character , "У вас нет Медали отваги ")
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 2000 then
			SystemNotice( character , "У вас недостаточно очков чести ")
			return 0
		end
	local HonorPoint_X=HonorPoint-2000
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		if Item_CanGet <= 0 then
			SystemNotice(character ,"У вас недостаточно свободных слотов в инвентаре ")
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2615  , 1 , 4 )
end

function Change_huihuang (character, npc)
	local NocLock =	KitbagLock( character, 0 )
		if NocLock == LUA_FALSE then
		SystemNotice( character , "Ваш инвентарь заблокирован ")
		return 0
	end
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( character,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( character , "У вас нет Медали отваги ")
		return 0
		end
	local Book2 =  GetChaItem2 ( character , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
		if HonorPoint < 20000 then
			SystemNotice( character , "У вас недостаточно очков чести ")
			return 0
		end
	local HonorPoint_X=HonorPoint-20000
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	local Item_CanGet = GetChaFreeBagGridNum ( character )
		
		if Item_CanGet <= 0 then
			SystemNotice(character ,"У вас недостаточно свободных слотов в инвентаре ")
			UseItemFailed ( character )
			return
		end
	GiveItem ( character , 0 , 2616  , 1 , 4 )
end

function Eleven_Log_0( role ) 
	local cha_name = GetChaDefaultName ( role ) 
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	LG( "Eleven_Log_0" ,cha_name,lv,job)
end

function Eleven_Log( role,typ ) 
	local cha_name = GetChaDefaultName ( role ) 
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	LG( "Eleven_Log" ,cha_name,lv,job,typ)
end
-------------------------------------------------------------------------------------
--				Leo????????
-------------------------------------------------------------------------------------
function WGPrizeBegin( role , rightCount)
	local rightCountTemp = rightCount
	if rightCountTemp > 6 then
		rightCountTemp = 6
	end
	
	local isPrizeRandom = math.random(rightCountTemp,10)
	local retRandom = math.random ( 1 , 100 )
	local ret  = 1
	
	if isPrizeRandom > 5  then
		if math.mod ( retRandom , 6 ) == 0 then
			 ret = WGprize_1(role)
		end
		
		if math.mod ( retRandom , 6 ) == 1  then
			 ret = WGprize_2(role)
		end
		
		if math.mod ( retRandom , 6 ) == 2  then
			 ret = WGprize_3(role)
		end
		
		if math.mod ( retRandom , 6 ) == 3  then
			 ret = WGprize_4(role)
		end
		
		if math.mod ( retRandom , 6 ) == 4  then
			 ret = WGprize_5(role)
		end
		
		if math.mod ( retRandom , 6 ) == 5  then
			 ret = WGprize_6(role)
		end
		
		if ret ==1 then
			SystemNotice( role , "Return value error")
		end
	else
		SystemNotice( role , "You have answered correctly, but you failed to win any prizes" )
	end
end
function WGprize_1( role ) --??? LV * 10
	local expNow = GetChaAttr( role , ATTR_CEXP )
	local lvNow = GetChaAttr( role , ATTR_LV)
	
	SystemNotice( role , "Answered correctly and obtained  " .. lvNow*10 .. " experience points")
	SetChaAttrI(  role , ATTR_CEXP ,expNow+lvNow*10  )
	RefreshCha(role)
	return 0
end

function WGprize_2( role ) --??????
	local bloodMaxNow = GetChaAttr( role , ATTR_MXHP)
	SystemNotice( role , "Correct answer will restore your HP to max")
	SetChaAttrI( role , ATTR_HP ,bloodMaxNow  )
	RefreshCha(role)
	return 0
end

function WGprize_3(role) --??????
	local SPMaxNow = GetChaAttr( role , ATTR_MXSP)
	SystemNotice( role , " Correct answer will restore your SP to the max")
	SetChaAttrI( role , ATTR_SP, SPMaxNow  )
	RefreshCha(role)
	return 0
end

function WGprize_4(role) --??LV*1???
	local lvNow = GetChaAttr( role , ATTR_LV)
	SystemNotice( role , "Answered correctly and obtained  " .. lvNow .. " cake(s)")
	
	GiveItem( role , 0 , 1849  , lvNow , 4 )	
	return 0
end

function WGprize_5(role) --????1?
	SystemNotice( role , "Correct answer will give you 1 Old Ticket")
	
	GiveItem( role , 0 , 3141  , 1 , 4 )	
	return 0
end

function WGprize_6(role) --????
	local bloodMaxNow = GetChaAttr( role , ATTR_MXHP)
	local SPMaxNow = GetChaAttr( role , ATTR_MXSP)
	
	SystemNotice( role , "Correct answer will restore HP & SP to the max")
	
	SetChaAttrI( role , ATTR_HP ,bloodMaxNow  )
	SetChaAttrI( role , ATTR_SP ,SPMaxNow  )
	RefreshCha(role)
	return 0
end
-------------------------------------------------------------------------------------
--				Leo  end
-------------------------------------------------------------------------------------

--------????????---------bragi-----
	GetExp	=	{}		------------????????
	GetExp[1]	=	0
	GetExp[2]	=	5
	GetExp[3]	=	15
	GetExp[4]	=	35
	GetExp[5]	=	101
	GetExp[6]	=	250
	GetExp[7]	=	500
	GetExp[8]	=	1000
	GetExp[9]	=	1974
	GetExp[10]	=	3208
	GetExp[11]	=	4986
	GetExp[12]	=	7468
	GetExp[13]	=	10844
	GetExp[14]	=	15338
	GetExp[15]	=	21210
	GetExp[16]	=	28766
	GetExp[17]	=	38356
	GetExp[18]	=	50382
	GetExp[19]	=	65306
	GetExp[20]	=	83656
	GetExp[21]	=	106032
	GetExp[22]	=	133112
	GetExp[23]	=	165668
	GetExp[24]	=	204564
	GetExp[25]	=	250780
	GetExp[26]	=	305412
	GetExp[27]	=	369692
	GetExp[28]	=	444998
	GetExp[29]	=	532870
	GetExp[30]	=	635026
	GetExp[31]	=	753378
	GetExp[32]	=	890062
	GetExp[33]	=	1047438
	GetExp[34]	=	1228138
	GetExp[35]	=	1435074
	GetExp[36]	=	1671470
	GetExp[37]	=	1940892
	GetExp[38]	=	2247288
	GetExp[39]	=	2595010
	GetExp[40]	=	2988860
	GetExp[41]	=	3434132
	GetExp[42]	=	3936658
	GetExp[43]	=	4502856
	GetExp[44]	=	5139778
	GetExp[45]	=	5855180
	GetExp[46]	=	6657576
	GetExp[47]	=	7556310
	GetExp[48]	=	8561630
	GetExp[49]	=	9684764
	GetExp[50]	=	10938016
	GetExp[51]	=	12334856
	GetExp[52]	=	13890020
	GetExp[53]	=	15619622
	GetExp[54]	=	17541282
	GetExp[55]	=	19674240
	GetExp[56]	=	22039516
	GetExp[57]	=	24660044
	GetExp[58]	=	27560852
	GetExp[59]	=	30769230
	GetExp[60]	=	37746418
	GetExp[61]	=	45876427
	GetExp[62]	=	59571153
	GetExp[63]	=	75703638
	GetExp[64]	=	94615279
	GetExp[65]	=	116688304
	GetExp[66]	=	155291059
	GetExp[67]	=	186418013
	GetExp[68]	=	238159614
	GetExp[69]	=	298622278
	GetExp[70]	=	368975850
	GetExp[71]	=	450525549
	GetExp[72]	=	568409779
	GetExp[73]	=	679324744
	GetExp[74]	=	806544569
	GetExp[75]	=	952091724
	GetExp[76]	=	1188099236
	GetExp[77]	=	1480429211
	GetExp[78]	=	1776125584
	GetExp[79]	=	2091634902
	GetExp[80]	=	2425349810
	GetExp[81]	=	2440895086
	GetExp[82]	=	2458896515
	GetExp[83]	=	2479742169
	GetExp[84]	=	2503881436
	GetExp[85]	=	2531834707
	GetExp[86]	=	2564204594
	GetExp[87]	=	2601688923
	GetExp[88]	=	2645095775
	GetExp[89]	=	2695360909
	GetExp[90]	=	2753567934
	GetExp[91]	=	2820971668
	GetExp[92]	=	2899025191
	GetExp[93]	=	2989411170
	GetExp[94]	=	3094078133
	GetExp[95]	=	3215282476
	GetExp[96]	=	3355637105
	GetExp[97]	=	3518167765
	GetExp[98]	=	3706378269
	GetExp[99]	=	3924326032
	GetExp[100]	=	4176709541
	
function AddExp_1 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_1 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_1 = exp_up
	elseif lv_role > 20 and lv_role <= 30 then
		exp_1 = math.floor(exp_up * 0.8)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_1 = math.floor(exp_up * 0.2)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_1 = math.floor(exp_up * 0.2)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_1 = math.floor(exp_up * 0.058)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_1 = math.floor(exp_up * 0.0063)
	else
		exp_1 = math.floor(exp_up * 0.0025)
	end
	AddExp ( role, npc, exp_1, exp_1)
end

function AddExp_2 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_2 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_2 = exp_up
	elseif lv_role > 20 and lv_role <= 30 then
		exp_2 = math.floor(exp_up * 0.9)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_2 = math.floor(exp_up * 0.3)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_2 = math.floor(exp_up * 0.22)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_2 = math.floor(exp_up * 0.068)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_2 = math.floor(exp_up * 0.0073)
	else
		exp_2 = math.floor(exp_up * 0.0035)
	end
	AddExp ( role, npc, exp_2, exp_2)
end

function AddExp_3 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_3 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_3 = math.floor(exp_up * 1.2)
	elseif lv_role > 20 and lv_role <= 30 then
		exp_3 = math.floor(exp_up * 1)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_3 = math.floor(exp_up * 0.5)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_3 = math.floor(exp_up * 0.24)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_3 = math.floor(exp_up * 0.078)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_3 = math.floor(exp_up * 0.0083)
	else
		exp_3 = math.floor(exp_up * 0.0045)
	end
	AddExp ( role, npc, exp_3, exp_3)
end

function AddExp_4 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_4 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_4 = math.floor(exp_up * 1.4)
	elseif lv_role > 20 and lv_role <= 30 then
		exp_4 = math.floor(exp_up * 1)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_4 = math.floor(exp_up * 0.8)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_4 = math.floor(exp_up * 0.4)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_4 = math.floor(exp_up * 0.088)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_4 = math.floor(exp_up * 0.0083)
	else
		exp_4 = math.floor(exp_up * 0.0055)
	end
	AddExp ( role, npc, exp_4, exp_4)
end

function AddExp_5 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_5 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_5 = math.floor(exp_up * 1.6)
	elseif lv_role > 20 and lv_role <= 30 then
		exp_5 = math.floor(exp_up * 1.1)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_5 = math.floor(exp_up * 1)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_5 = math.floor(exp_up * 0.44)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_5 = math.floor(exp_up * 0.098)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_5 = math.floor(exp_up * 0.0093)
	else
		exp_5 = math.floor(exp_up * 0.0065)
	end
	AddExp ( role, npc, exp_5, exp_5)
end

function AddExp_6 ( role )
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_6 = 0
	if lv_role >= 1 and lv_role <=20 then
		exp_6 = math.floor(exp_up * 1.8)
	elseif lv_role > 20 and lv_role <= 30 then
		exp_6 = math.floor(exp_up * 1.2)
	elseif lv_role > 30 and lv_role <= 40 then
		exp_6 = math.floor(exp_up * 1.2)
	elseif lv_role > 40 and lv_role <= 50 then
		exp_6 = math.floor(exp_up * 0.5)
	elseif lv_role > 50 and lv_role <= 60 then
		exp_6 = math.floor(exp_up * 0.11)
	elseif lv_role > 60 and lv_role <= 70 then
		exp_6 = math.floor(exp_up * 0.0105)
	else
		exp_6 = math.floor(exp_up * 0.0075)
	end
	AddExp ( role, npc, exp_6, exp_6)
end

function CheckTeam ( role )
--	SystemNotice( role, "??1")
	local player = {}
	player[1] = role
	player[2] = GetTeamCha( role , 0 )
	player[3] = GetTeamCha( role , 1 )
	player[4] = GetTeamCha( role , 2 )
	player[5] = GetTeamCha( role , 3 )
	local n1 = 0
	local n2 = 0
	local n3 = 0

	for j = 0 , 5 , 1 do	
		if ValidCha( player[j] )== 1  then					--????????????????
			local lv_p = GetChaAttr ( player[j] , ATTR_LV )
--			SystemNotice( role, "??2")
--			SystemNotice( role, "????"..lv_p)
			if lv_p >= 20 and lv_p <= 30 then
				n1 = n1 + 1
			elseif lv_p > 30 and lv_p <= 40 then
				n2 = n2 + 1
			elseif lv_p > 40 then
				n3 = n3 + 1
			end
		end
	end
--	SystemNotice( role , "?????20?30???:"..n1..",31?40???:"..n2..",40?????:"..n3)
	if n1 >= 1 and n2 >= 1 and n3>= 1 then
		return LUA_TRUE
	end
end

function CheckTime ( role )
	local now_week= os.date("%w")		-------------???(???) 
	local now_hour= os.date("%H")		-------------? 
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)
--	SystemNotice( role, "??"..now_week.."??"..now_hour)
	if now_week == 6 then 
		if now_hour >= 18 and now_hour < 21 then
			return LUA_TRUE
		elseif now_hour >= 9 and now_hour < 12 then
			return LUA_TRUE
		end
	end
end


--Leo?????
function Can_Exchange(sSrcItem,sSrcNum,sTagItem,sTagNum)
	local Data
	for Data in ChangeItemList do
		 if ChangeItemList[Data][1] == sSrcItem and  ChangeItemList[Data][2] == sSrcNum and ChangeItemList[Data][3] == sTagItem and ChangeItemList[Data][4] == sTagNum then
			return LUA_TRUE
		 end
	end
	return LUA_FALSE
end


function CheckTeam1 ( role , value )
	local player = {}
	player[1] = role
	player[2] = GetTeamCha( role , 0 )
	player[3] = GetTeamCha( role , 1 )
	player[4] = GetTeamCha( role , 2 )
	player[5] = GetTeamCha( role , 3 )

	local n = 0

	for j = 0 , 5 , 1 do	
		if ValidCha( player[j] )== 1  then					--????????????????
			n = n+1
		end
	end
	if n >= value then
		return LUA_TRUE
	end
end

function SetTestTime ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------?
	local now_day= os.date("%d")		-------------?
	local now_hour= os.date("%H")		-------------?
	local now_miniute= os.date("%M")	-------------?
	local now_second=  os.date("%S")		-------------?
	now_month= tonumber(now_month)		-------------?     
	now_day= tonumber(now_day)			-------------?     
	now_hour= tonumber(now_hour)			-------------?     
	now_miniute= tonumber(now_miniute)	 	-------------?     
	now_second= tonumber(now_second)		-------------?
--	SystemNotice( role , "?????"..i)
--	SystemNotice( role , "?????"..now_month.."?"..now_day.."?"..now_hour.."?"..now_miniute.."?"..now_second.."?")
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 579 )
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------? 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------?  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------?
		SetItemAttr(Item, ITEMATTR_MAXENERGY, 0)
		SynChaKitbag(role,13)
		return LUA_TRUE
	end
end

function RenewTestTime1 ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------?
	local now_day= os.date("%d")		-------------?
	local now_hour= os.date("%H")		-------------?
	local now_miniute= os.date("%M")	-------------?
	local now_second=  os.date("%S")		-------------?
	now_month= tonumber(now_month)		-------------?     
	now_day= tonumber(now_day)			-------------?     
	now_hour= tonumber(now_hour)			-------------?     
	now_miniute= tonumber(now_miniute)	 	-------------?     
	now_second= tonumber(now_second)		-------------? 
--	SystemNotice( role , "?????"..i)
--	SystemNotice( role , "?????"..now_month.."?"..now_day.."?"..now_hour.."?"..now_miniute.."?"..now_second.."?")
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 579 )
--		SystemNotice( role , "1")
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
--		SystemNotice( role , "?n="..n)
		local old_month = GetItemAttr ( Item, ITEMATTR_VAL_STA )
		local old_day = GetItemAttr ( Item, ITEMATTR_VAL_STR )
		local old_hour = GetItemAttr ( Item, ITEMATTR_VAL_CON )
--		SystemNotice( role , "?month="..old_month)
--		SystemNotice( role , "?day="..old_day)
--		SystemNotice( role , "?hour="..old_hour)
		local old_miniute = GetItemAttr ( Item, ITEMATTR_VAL_DEX )
		local old_second = GetItemAttr ( Item, ITEMATTR_VAL_AGI )
--		SystemNotice( role , "?miniute="..old_miniute)
--		SystemNotice( role , "?second="..old_second)
		local used_time=(now_second - old_second)+(now_miniute - old_miniute)*60+(now_hour - old_hour)*3600+(now_day - old_day)*86400+(now_month - old_month)*259200
--		SystemNotice( role , "?????"..used_time)
		if used_time <= 30 then
			n = n + 1
		end
--		SystemNotice( role , "?????"..n)
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------? 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------?  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------?
		SetItemAttr(Item, ITEMATTR_MAXENERGY, n)
		SynChaKitbag(role,13)
		return LUA_TRUE
	end
end

function RenewTestTime2 ( role )
	local i = CheckBagItem( role,579 )
	local now_month= os.date("%m")		-------------?
	local now_day= os.date("%d")		-------------?
	local now_hour= os.date("%H")		-------------?
	local now_miniute= os.date("%M")	-------------?
	local now_second=  os.date("%S")		-------------?
	now_month= tonumber(now_month)		-------------?     
	now_day= tonumber(now_day)			-------------?     
	now_hour= tonumber(now_hour)			-------------?     
	now_miniute= tonumber(now_miniute)	 	-------------?     
	now_second= tonumber(now_second)		-------------?     
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 579 )
		SetItemAttr(Item, ITEMATTR_VAL_STA, now_month )		-------------? 	
		SetItemAttr(Item, ITEMATTR_VAL_STR, now_day )		-------------?  
		SetItemAttr(Item, ITEMATTR_VAL_CON, now_hour )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_DEX, now_miniute )		-------------?   
		SetItemAttr(Item, ITEMATTR_VAL_AGI, now_second )		-------------?
		return LUA_TRUE
	end
end


function CheckRightNum ( role )
	local i = CheckBagItem( role,579 )
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 579 )
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
		if n == 8 then
			return LUA_TRUE
		end
	end
end

function CheckErroNum ( role )
	local i = CheckBagItem( role,579 )
	if i==1 then
		local Item = GetChaItem2 ( role , 2 , 579 )
		local n = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
		if n < 8 then
			return LUA_TRUE
		end
	end
end

function CheckRealNpc ( role , value )
	local now_hour= os.date("%H")		-------------?
	now_hour= tonumber(now_hour)			-------------? 
	local n = ( now_hour/4 - math.floor ( now_hour/4 )) * 4
	if n == value then
		return LUA_TRUE
	else
		SystemNotice( role, "????????,?????????????")
	end
end

---------------------------------------------------kokora--------------------------------------------------

---------------------------------------------------????????????7200??????
function Givecrab( character  )	
	local c1=0
	local c2=0
	c1,c2 =MakeItem(character, 58, 1, 4)			--value????ID   C2????????????
	local Item_CRAB = GetChaItem ( character , 2 , c2 )			--??????? 2 ??? C2??????
	
	local CRAB_NOW = 7200                                                                              
	
	SetItemAttr(Item_CRAB, ITEMATTR_MAXENERGY, CRAB_NOW)						--??????
	SetItemAttr(Item_CRAB, ITEMATTR_ENERGY, CRAB_NOW)								 --??????,???????????
	RefreshCha( character )
	SystemNotice (character , "???????????2???????!" )
end


---------------------------------------------------???????????????????0
function crablife( character )
	local Crab_Num = 0
	Crab_Num = CheckBagItem(  character , 58 )		--?????58??????
	
	if Crab_Num == 1 then				--??58??????????1
		local crab = GetChaItem2 (  character , 2 , 58 )			--?????????ID?58??????
		local ENERGY = GetItemAttr(crab, ITEMATTR_ENERGY)
		if ENERGY ==0 then
			return LUA_TRUE
		end
	else
		SystemNotice( character, "?????????????")
	end

end

---------------------------------------------------kokora--------------------------------------------------

--???????

function GiveZNZItem ( role )
		SystemNotice(role ,"???")
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 10000 )
	--SystemNotice(role ,"star=="..star)
	if star<=8000 then
		GiveItem ( role , 0 , 2999  , 1 , 4  )
	elseif star>=8001 and star<=9500 then
		local el = math.random ( 1, 15 )
		if el<=5  then
			GiveItem ( role , 0 , 0227  , 1 , 4 )
		elseif el>=6 and el<=7 then
			GiveItem ( role , 0 , 3111  , 1 , 4 )
		elseif el>=8 and el<=9 then
			GiveItem ( role , 0 , 3109  , 1 , 4 )
		elseif el>=10 and el<=11 then
			GiveItem ( role , 0 , 3110  , 1 , 4 )
		elseif el>=12 and el<=13 then
			GiveItem ( role , 0 , 3112  , 1 , 4 )
		elseif el>=14 and el<=15 then
			GiveItem ( role , 0 , 3113  , 1 , 4 )
		end


	elseif star>=9501 and star<=9800 then
		local el1= math.random ( 1, 5 )
		if el1==1  then
			GiveItem ( role , 0 , 0863  , 1 , 4 )
			local message = cha_name.."????,?????????? ??" 
			Notice ( message )
		elseif el1==2 then
			GiveItem ( role , 0 , 0860  , 1 , 4 )
			local message1 = cha_name.."????,?????????? ???" 
			Notice ( message1 )
		elseif el1==3 then
			GiveItem ( role , 0 , 0861  , 1 , 4 )
			local message2 = cha_name.."????,?????????? ???" 
			Notice ( message2 )
		elseif el1==4 then
			GiveItem ( role , 0 , 0862  , 1 , 4 )
			local message3 = cha_name.."????,?????????? ??" 
			Notice ( message3 )
		elseif el1==5 then
			GiveItem ( role , 0 , 1028  , 1 , 4 )
			local message4 = cha_name.."????,?????????? ????" 
			Notice ( message4 )
		end
	
	
	elseif star>=9801 and star<=9998 then
		local el2= math.random ( 1, 100 )
		if el2<=50  then
			GiveItem ( role , 0 , 0992  , 1 , 4 )
			local message5 = cha_name.."????,?????????? ????" 
			Notice ( message5 )
		elseif el2>=51 and el2<=74 then
			GiveItem ( role , 0 , 0853  , 1 , 4 )
			local message6 = cha_name.."????,?????????? ??????" 
			Notice ( message6 )
		elseif el2>=75 and el2<=100 then
			GiveItem ( role , 0 , 1012  , 1 , 4 )
			local message7 = cha_name.."????,?????????? ????" 
			Notice ( message7 )
		end

	elseif star>=9899 and star<=10000 then
		local el3= math.random ( 1, 100 )
		if el3==63  then
			GiveItem ( role , 0 , 0096  , 1 , 4 )
			local message8= cha_name.."????,?????????? ????" 
			Notice ( message8 )
		elseif el3==98  then
			GiveItem ( role , 0 , 0094  , 1 , 4 )
			local message9 = cha_name.."????,?????????? ????" 
			Notice ( message9 )
		end
	end
end

-------------------------------------------------------------------------------------
--				Leo???????   
-------------------------------------------------------------------------------------
--???????
--ITEMATTR_FORGE                 ?? ?:0,1,2,3,4 ??   ???,??,??,??,??
--ITEMATTR_MAXENERGY            ????
--ITEMATTR_MAXURE          ????
--ITEMATTR_ENERGY                     ????
--ITEMATTR_URE                  ????

--??????
--ITEMATTR_URE                          ????
--ITEMATTR_MAXURE                  ????
---------------------------------------------------------------------------------
-- ????
-- Check_Skill_Rad( Skill_Level )                                              --????????????????
-- Check_Equip_Rad( Buff_Equip_ID )		                              --?????ID???????????
--  Check_Item_Rad(role)															  --????????????
-- Check_Exp_Increase( Book_ID )	                                          --???ID??????????
-- Add_BookEXP(role , Certificate , Book_ID , Skill_Level)    --????????????,?Reading_Book???
-- Take_BookDurability(role , Book)                                           --?????????????,?Reading_Book???
-- Reading_Book(role,Skill_Level)											   --             ???               ????,??????????????????????????
function Check_Skill_Rad( Skill_Level )			--??????????	
		local Skill_Rad												--Lua?????switch!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		if Skill_Level == 2 then
			Skill_Rad = 0.05
		elseif Skill_Level == 3 then
			Skill_Rad = 0.10
		elseif Skill_Level == 4 then
			Skill_Rad = 0.15
		elseif Skill_Level == 5 then
			Skill_Rad = 0.2
		else
			Skill_Rad = 0
		end

		return Skill_Rad
end

function Check_Equip_Rad( Buff_Equip_ID )		--???????????
		local Equip_Rad
		if Buff_Equip_ID == 3285 then
			Equip_Rad = 0.05
		elseif Buff_Equip_ID == 3287 then
			Equip_Rad = 0.1
		else
			Equip_Rad = 0
		end
		
		return Equip_Rad
end

function Check_Item_Rad(role)							--????????????
	local stateLV_Apple
	local Item_Rad
	
	stateLV_Apple = GetChaStateLv ( role , STATE_APPLE )		--????????
	
	if stateLV_Apple == 1 then
		Item_Rad = 0.3

	elseif stateLV_Apple == 2 then
		Item_Rad = 0.5
	else
		Item_Rad = 0
	end
	
	return Item_Rad
end

function Check_Exp_Increase( Book_ID )		--??ID??????????
		local Book_ID_mod
		local Book_Exp_Increase
		
		--????
		if Book_ID >= 3243 and Book_ID <= 3246 then            --???   ??
				Book_Exp_Increase = 1
		elseif Book_ID >= 3247 and Book_ID <= 3250 then     --??
				Book_Exp_Increase = 3
		elseif Book_ID >= 3251 and Book_ID <= 3254 then     --??
				Book_Exp_Increase =5
		elseif Book_ID >= 3255 and Book_ID <= 3260 then		--??  ??
				Book_Exp_Increase = 9
		elseif Book_ID >= 3261 and Book_ID <= 3266 then      --??
				Book_Exp_Increase = 13
		elseif Book_ID >= 3267 and Book_ID <= 3272 then       --??
				Book_Exp_Increase = 18
		elseif Book_ID >= 3273 and Book_ID <= 3278 then       --??????
				Book_Exp_Increase = 24
		else
				Book_Exp_Increase = 0
		end
		
		return Book_Exp_Increase
end

function Add_BookEXP(role , Certificate , Book_ID , Skill_Level)    --???????????,?Reading_Book???
		
		local Role_Level
		local Buff_Equip
		local Buff_Equip_ID
		local Exp_Increase				--?????
		local Skill_Rad
		local Equip_Rad
		local Item_Rad
		local DoubleEffect
		
		Role_Level = Lv( role )
		Buff_Equip= GetChaItem ( role , 1 , 6 )                        --???????
		Buff_Equip_ID = GetItemID( Buff_Equip )
		
		Skill_Rad = Check_Skill_Rad(Skill_Level)					--??????????
		Equip_Rad = Check_Equip_Rad(Buff_Equip_ID)		--??????????
		Item_Rad = Check_Item_Rad(role)								--????????????
		Exp_Increase = Check_Exp_Increase( Book_ID )		--??????

		Exp_Increase = Exp_Increase * ( 1 + Skill_Rad + Equip_Rad + Item_Rad )		--?????
		
		--?????
		local Book_Exp_Now = GetItemAttr( Certificate , ITEMATTR_ENERGY )			--?????
		local Book_Exp_Max =  GetItemAttr( Certificate , ITEMATTR_MAXENERGY )	--??????
		
		Book_Exp_Now = Book_Exp_Now + Exp_Increase
		
		if Book_Exp_Now >= Book_Exp_Max then
			Book_Exp_Now = Book_Exp_Max
		end
		
		SetItemAttr ( Certificate , ITEMATTR_ENERGY , Book_Exp_Now )
end

function  Take_BookDurability(role , Book , Certificate)  --???????????,?Reading_Book???
--		SystemNotice(role , "Deducting durability")		
		
		local Durability_Reduce = 250					--?????
		local Book_Dur_Now = GetItemAttr( Book , ITEMATTR_URE )
		local Book_Dur_Max = GetItemAttr( Book , ITEMATTR_MAXURE )
		
		local Certificate_Exp_Now = GetItemAttr( Certificate , ITEMATTR_ENERGY )	--????????
		local Certificate_Exp_Max = GetItemAttr( Certificate , ITEMATTR_MAXENERGY )	--?????????
		
		if Certificate_Exp_Now == Certificate_Exp_Max then
			SystemNotice(role, "\209\242\243\228\229\237\247\229\241\234\224\255 \202\224\240\242\224 \231\224\239\238\235\237\229\237\224 ")
			return 0
		end
		SystemNotice(role,"\207\238\235\243\247\229\237 \238\239\251\242 \237\224 \209\242\243\228\229\237\247\229\241\234\243\254 \202\224\240\242\243 ")
		Book_Dur_Now =  Book_Dur_Now - Durability_Reduce
		
		if Book_Dur_Now <=0 then
			Book_Dur_Now = 0
		end
		
		SetItemAttr ( Book , ITEMATTR_URE , Book_Dur_Now )
end

function Reading_Book(role,Skill_Level)			--????,???????????????
		--1:????????,????????
		--2:???????????
		--3:????:???????
		--4:????:??????
--		SystemNotice( role , "Star Reading" )
		
		local Book
		local Book_ID

		local Certificate
		local Certificate_ID
		
		Book = GetChaItem ( role , 1 , 9 )                        --???????
		Book_ID =  GetItemID( Book )           								   --????ID

		Certificate = GetChaItem ( role , 1 , 5 )                --???????
		Certificate_ID = GetItemID( Certificate )                 --????ID
		local Book_Dur = GetItemAttr( Book , ITEMATTR_URE )
		if Book_Dur > 0 then
			if  Certificate_ID == 3289 then							             	--??ID?????
				if  Book_ID >= 3243 and  Book_ID <= 3278 then
					Take_BookDurability( role , Book , Certificate)     --?????
					Add_BookEXP( role , Certificate , Book_ID,Skill_Level )	    --?????????
					Refreshcha( role )
				else
					SystemNotice(role,"\211 \226\224\241 \237\229\242 \202\237\232\227\232")
				end
			else
				SystemNotice(role,"\211 \226\224\241 \237\229\242 \209\242\243\228\229\237\247\229\241\234\238\233 \202\224\240\242\251 ")
			end
		else
			SystemNotice(role,"Book's durability reached 0, please get a new Book!")
		end
end

----?????
	Reading_Credit = {}
	Reading_Credit[0] = 150
	Reading_Credit[1] = 250
	Reading_Credit[2] = 400
	Reading_Credit[3] = 800
	Reading_Credit[4] = 4500	
	
----?????
	Reading_EXP = {}
	Reading_EXP[0] = 120
	Reading_EXP[1] = 700
	Reading_EXP[2] = 1700
	Reading_EXP[3] = 3000
	Reading_EXP[4] = 5000
	


-------????????????          --???
function CheckXSZExp( character )
	local xsz_num = 0
	xsz_num = CheckBagItem( character, 3289 )
	if xsz_num ~= 1 then
		--SystemNotice ( character , "Put the Student Card in your inventory!")
		return 0
	end
	local role_xsz = GetChaItem2 ( character , 2 , 3289 )
	local exp_xsz = GetItemAttr ( role_xsz , ITEMATTR_ENERGY )
	local mexp_xsz = GetItemAttr ( role_xsz, ITEMATTR_MAXENERGY)
	-- SystemNotice( character , ""..exp_xsz)
	-- SystemNotice( character , ""..mexp_xsz)
	if exp_xsz == mexp_xsz then
		return LUA_TRUE
	end

	return LUA_FALSE
end

------????????????
function CheckXSZCh( character )
	local xsz_num = 0
	xsz_num = CheckBagItem( character, 3289 )
	if xsz_num ~= 1 then
			--SystemNotice( character , "Put the Student Card in your inventory!")
			return 0
	end
	local role_xsz = GetChaItem2 ( character , 2 , 3289 )
	local ch_xsz = GetItemAttr ( role_xsz , ITEMATTR_URE )
	local mch_xsz = GetItemAttr ( role_xsz , ITEMATTR_MAXURE )
	if ch_xsz == mch_xsz then
		return LUA_TRUE
	end
	
	return	LUA_FALSE
end

function ReadBookTime()					---------------??READINGBOOK??????
--	Notice( "????")
	return 600*100
end

function ReadBookSkillId()				--------------??READINGBOOK??????
--	Notice( "??????")
	return 461
end

-------------------------------------------------------------------------------------
--				Leo  end
-------------------------------------------------------------------------------------
--??????????????--------function


function AuctionEnd (role)
	local sc = CheckBagItem( role, 3025 )	                    -------------080317kokora change	
	if sc <=0 then
		SystemNotice( role ,"?????????????")
		return 0
	end
	--local s = DelBagItem ( role , 3025 , 1 ) 
	local item_number = CheckBagItem( role, 3066 )		
	if item_number >=1 then
		SystemNotice( role ,"??????????????")
		return 0
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <2 then
		SystemNotice(role ,"????2?????")
		return 0
	end
	GiveItem ( role , 0 , 7722 , 10 , 4) ---------------????
	DelBagItem(role,3025,1)
	local r1=0
	local r2=0
	r1,r2 =MakeItem ( role , 3066  , 1 , 4 )
	local Item_new = GetChaItem ( role , 2 , r2 )
	
	----------????
	
	local now_month= os.date("%m")		-------------?
	local now_day= os.date("%d")		-------------?
	local now_hour= os.date("%H")		-------------? 
	local now_miniute= os.date("%M")	-------------?
	local now_day1= 0
	local now_month1= 0
	local now_hour1= 0
	local now_miniute1= 0
	    
	now_month= tonumber(now_month)		-------------?     
	now_day= tonumber(now_day)			-------------?    
	now_hour= tonumber(now_hour)		
	now_miniute= tonumber(now_miniute)
	local CheckDateNum = now_hour*100 +now_miniute

if CheckDateNum==1830  then 

	now_hour1= 18
	now_miniute1= 0
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12 then 
		 if now_day<=26 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>26 then 
		    now_day1=(now_day+5)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11 then 
		 if now_day<=25 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>25 then 
		    now_day1=(now_day+5)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2 then 
		 if now_day<=23 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>23 then 
		    now_day1=(now_day+5)-28
		    now_month1=now_month+1
		    	
	         end 

	end
	
elseif CheckDateNum==1910  then 
	now_hour1= 20
	now_miniute1= 10	
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12 then 
		 if now_day<=26 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>26 then 
		    now_day1=(now_day+5)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11 then 
		 if now_day<=25 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>25 then 
		    now_day1=(now_day+5)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2 then 
		 if now_day<=23 then 
		    now_day1=now_day+5
		    now_month1=now_month
		 elseif now_day>23 then 
		    now_day1=(now_day+5)-28
		    now_month1=now_month+1
	         end 
	end

elseif CheckDateNum==1950  then 
	now_hour1= 18
	now_miniute1= 0  
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12 then 
		 if now_day<=25 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>25 then 
		    now_day1=(now_day+6)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11 then 
		 if now_day<=24 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>24 then 
		    now_day1=(now_day+6)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2 then 
		 if now_day<=22 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>22 then 
		    now_day1=(now_day+6)-28
		    now_month1=now_month+1
	         end 
	end

elseif CheckDateNum==2030  then 

	 now_hour1= 20
	 now_miniute1= 10
	if now_month==1 or now_month==3 or now_month==5 or now_month==7 or now_month==8 or now_month==10 or now_month==12 then 
		 if now_day<=25 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>25 then 
		    now_day1=(now_day+6)-31
		    now_month1=now_month+1
	         end 
	end

	if now_month==4 or now_month==6 or now_month==9 or now_month==11 then 
		 if now_day<=24 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>24 then 
		    now_day1=(now_day+6)-30
		    now_month1=now_month+1
	         end 
	end

	if now_month==2 then 
		 if now_day<=22 then 
		    now_day1=now_day+6
		    now_month1=now_month
		 elseif now_day>22 then 
		    now_day1=(now_day+6)-28
		    now_month1=now_month+1
	         end 
	end

end
	--SystemNotice ( role , "now_month1=="..now_month1 )
	--SystemNotice ( role , "now_day1=="..now_day1 )
	--SystemNotice ( role , "now_hour1=="..now_hour1 )
	--SystemNotice ( role , "now_miniute1=="..now_miniute1 )
---------------------????
	SetItemAttr(Item_new, ITEMATTR_VAL_STA, now_month1 )		-------------? 	
	SetItemAttr(Item_new, ITEMATTR_VAL_STR, now_day1 )		-------------?  
	SetItemAttr(Item_new, ITEMATTR_VAL_CON, now_hour1 )		-------------? 
	SetItemAttr(Item_new, ITEMATTR_VAL_DEX, now_miniute1 )		-------------?
	SynChaKitbag(role,13)
end

--------------????
function YORN (role)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <2 then
		SystemNotice(role ,"????2?????")
		return  0
	end

	local item_number1 = CheckBagItem( role, 3066 )		
	if item_number1 >=1 then
		SystemNotice( role ,"??????????????")
		return 0
	end
	
	local item_number2 = CheckBagItem( role, 3078 )		
	if item_number2 >=1 then
		SystemNotice( role ,"??????????")
		return  0
	end
	
	local item_number3 = CheckBagItem( role, 3025 )		
	if item_number3 <1 then
		SystemNotice( role ,"????????????")
		return  0
	end
	 return  1
end

----???????????0
function HasReadExp( role )
		local xsz_num = 0
	xsz_num = CheckBagItem(  role, 3289 )
	if xsz_num ~= 1 then
		--SystemNotice (  role , "Put the Student Card in your inventory!")
		return 0
	end
	local role_xsz = GetChaItem2 (  role , 2 , 3289 )
	local exp_xsz = GetItemAttr ( role_xsz , ITEMATTR_ENERGY )
	
	if exp_xsz > 0 then
		return LUA_TRUE
	end
	
	return LUA_FALSE
end

---------------Fairy Coin Chest
function GiveBragiItem ( role , value )
	local pinzhi = 0
	local ChaName = GetChaDefaultName ( role )
	local a = math.random ( 1 , 100000000 )
	--SystemNotice ( role , "RP="..a)
--	if a >= 1 and a <= 14 then							----?75BOSS?
--		local Item_Id = a + 2330
--		local Item_Name = GetItemName ( Item_Id )
--		GiveItem ( role , 0 , Item_Id , 1 , 4 )
--		Notice ( "??"..ChaName.."????????,???????"..Item_Name)
--		LG ( "JLYBBOX" , "??"..ChaName.."??????????"..Item_Name)
--	elseif a >= 15 and a <= 33 then							-----?75BOSS?
--		local Item_Id = a + 2802
--		local Item_Name = GetItemName ( Item_Id )
--		GiveItem ( role , 0 , Item_Id , 1 , 4 )
--		Notice ( "??"..ChaName.."????????,???????"..Item_Name)
--		LG ( "JLYBBOX" , "??"..ChaName.."??????????"..Item_Name)
	if a >= 1 and a <= 10000000 then						------?1%??
		AddExpAll ( role , 1, 1, 2 )
	elseif a >= 10000001 and a <= 12200000 then					------?2%??
		AddExpAll ( role , 2, 2, 2 )
	elseif a >= 12200001 and a <= 42200000 then					------??
		--SystemNotice ( role , "??")
--		local minval = value 
--		local maxval = value * 10
--		--SystemNotice ( role , "???"..minval.."???"..maxval)
--		local b = math.random ( minval , maxval )
--		--SystemNotice ( role , "??"..b)
--		local Money_Add = b * 10000
--		AddMoney ( role , 0 , Money_Add )
		AddExpAll( role, 100000, 1000000, 1)
	elseif a >= 42200001 and a <= 62200000 then					------10???????
		GiveItem ( role , 0 , 3848 , 10 , 4 )
	elseif a >= 62200001 and a <= 65500000 then					------?????
		local c = math.random ( 1 , 35 )
		if c >= 1 and c <= 33 then
			local Item_Id = c + 3301					--Black Market Equipments
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		else
			local Item_Id = c + 54						--
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		end
	elseif a >= 65500001 and a <= 67500000 then					------3???????,3?SP???
		GiveItem ( role , 0 , 3098 , 3 , 4 )
		GiveItem ( role , 0 , 3099 , 3 , 4 )
	elseif a >= 67500001 and a <= 87500000 then					------??
		local d = math.random ( 1 , 16 )
		if d == 1 then 
			GiveItem ( role , 0 , 3056 , 3 , 4 )
		elseif d == 2 then
			GiveItem ( role , 0 , 3057 , 3 , 4 )
		elseif d == 3 then
			GiveItem ( role , 0 , 3058 , 3 , 4 )
		elseif d == 4 then
			GiveItem ( role , 0 , 3059 , 3 , 4 )
		elseif d == 5 then
			GiveItem ( role , 0 , 3060 , 3 , 4 )
		elseif d == 6 then
			GiveItem ( role , 0 , 3050 , 3 , 4 )
		elseif d == 7 then
			GiveItem ( role , 0 , 3051 , 3 , 4 )
		elseif d == 8 then
			GiveItem ( role , 0 , 3052 , 3 , 4 )
		elseif d == 9 then
			GiveItem ( role , 0 , 3053 , 3 , 4 )
		elseif d == 10 then
			GiveItem ( role , 0 , 3048 , 3 , 4 )
		elseif d == 11 then
			GiveItem ( role , 0 , 332 , 3 , 4 )
		elseif d == 12 then
			GiveItem ( role , 0 , 563 , 3 , 4 )
		elseif d == 13 then
			GiveItem ( role , 0 , 583 , 3 , 4 )
		elseif d == 14 then
			GiveItem ( role , 0 , 2447 , 3 , 4 )
		elseif d == 15 then
			GiveItem ( role , 0 , 2491 , 3 , 4 )
		elseif d == 16 then
			GiveItem ( role , 0 , 2844 , 3 , 4 )
		end
	elseif a >= 87500001 and a <= 93500000 then					----???
		GiveItem ( role , 0 , 885 , 1 , 4 )
	elseif a >= 93500001 and a <= 94500000 then					----??
		local e = math.random ( 1 , 11 )
		if e >= 1 and e <= 4 then
			local Item_Id = e + 859
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		else
			local Item_Id = e + 873
			GiveItem ( role , 0 , Item_Id , 1 , 4 )
		end
	else		
		local f = math.random ( 1 , 58 )
		if value == 1 then
			pinzhi = 4
		elseif value == 2 then
			pinzhi = 16
		elseif value == 3 then
			pinzhi = 22
		else
			SystemNotice( role , "Your character looks so good, I don't know what are you doing here.")
		end
		if f == 1 then
			GiveItem ( role , 0 , 0299 , 1 , pinzhi) 
		elseif f == 2 then
			GiveItem ( role , 0 , 0475 , 1 , pinzhi) 
		elseif f == 3 then
			GiveItem ( role , 0 , 0651 , 1 , pinzhi) 
		elseif f == 4 then
			GiveItem ( role , 0 , 0304 , 1 , pinzhi) 
		elseif f == 5 then
			GiveItem ( role , 0 , 0480 , 1 , pinzhi) 
		elseif f == 6 then
			GiveItem ( role , 0 , 0656 , 1 , pinzhi) 
		elseif f == 7 then
			GiveItem ( role , 0 , 0229 , 1 , pinzhi) 
		elseif f == 8 then
			GiveItem ( role , 0 , 653 , 1 , pinzhi)  
		elseif f == 9 then
			GiveItem ( role , 0 , 0230 , 1 , pinzhi) 
		elseif f == 10 then
			GiveItem ( role , 0 , 477 , 1 , pinzhi)  
		elseif f == 11 then
			GiveItem ( role , 0 , 0371 , 1 , pinzhi) 
		elseif f == 12 then
			GiveItem ( role , 0 , 0547 , 1 , pinzhi)  
		elseif f == 13 then
			GiveItem ( role , 0 , 0723 , 1 , pinzhi) 
		elseif f == 14 then
			GiveItem ( role , 0 , 0394 , 1 , pinzhi) 
		elseif f == 15 then
			GiveItem ( role , 0 , 0570 , 1 , pinzhi)  
		elseif f == 16 then
			GiveItem ( role , 0 , 0746 , 1 , pinzhi) 
		elseif f == 17 then
			GiveItem ( role , 0 , 0382 , 1 , pinzhi) 
		elseif f == 18 then
			GiveItem ( role , 0 , 0558 , 1 , pinzhi)  
		elseif f == 19 then
			GiveItem ( role , 0 , 0734 , 1 , pinzhi) 
		elseif f == 20 then
			GiveItem ( role , 0 , 2204 , 1 , pinzhi) 
		elseif f == 21 then
			GiveItem ( role , 0 , 0393 , 1 , pinzhi) 
		elseif f == 22 then
			GiveItem ( role , 0 , 0569 , 1 , pinzhi)  
		elseif f == 23 then
			GiveItem ( role , 0 , 0745 , 1 , pinzhi) 
		elseif f == 24 then
			GiveItem ( role , 0 , 2215 , 1 , pinzhi) 
		elseif f == 25 then
			GiveItem ( role , 0 , 0385 , 1 , pinzhi) 
		elseif f == 26 then
			GiveItem ( role , 0 , 0561 , 1 , pinzhi)  
		elseif f == 27 then
			GiveItem ( role , 0 , 0737 , 1 , pinzhi) 
		elseif f == 28 then
			GiveItem ( role , 0 , 2207 , 1 , pinzhi) 
		elseif f == 29 then
			GiveItem ( role , 0 , 0364 , 1 , pinzhi) 
		elseif f == 30 then
			GiveItem ( role , 0 , 0540 , 1 , pinzhi)  
		elseif f == 31 then
			GiveItem ( role , 0 , 0716 , 1 , pinzhi) 
		elseif f == 32 then
			GiveItem ( role , 0 , 2201 , 1 , pinzhi) 
		elseif f == 33 then
			GiveItem ( role , 0 , 0355 , 1 , pinzhi) 
		elseif f == 34 then
			GiveItem ( role , 0 , 0531 , 1 , pinzhi)  
		elseif f == 35 then
			GiveItem ( role , 0 , 0707 , 1 , pinzhi) 
		elseif f == 36 then
			GiveItem ( role , 0 , 2192 , 1 , pinzhi) 
		elseif f == 37 then
			GiveItem ( role , 0 , 0358 , 1 , pinzhi) 
		elseif f == 38 then
			GiveItem ( role , 0 , 0534 , 1 , pinzhi)  
		elseif f == 39 then
			GiveItem ( role , 0 , 0710 , 1 , pinzhi) 
		elseif f == 40 then
			GiveItem ( role , 0 , 2195 , 1 , pinzhi) 
		elseif f == 41 then
			GiveItem ( role , 0 , 0312 , 1 , pinzhi) 
		elseif f == 42 then
			GiveItem ( role , 0 , 0488 , 1 , pinzhi)  
		elseif f == 43 then
			GiveItem ( role , 0 , 0664 , 1 , pinzhi) 
		elseif f == 44 then
			GiveItem ( role , 0 , 0317 , 1 , pinzhi) 
		elseif f == 45 then
			GiveItem ( role , 0 , 0493 , 1 , pinzhi)  
		elseif f == 46 then
			GiveItem ( role , 0 , 0669 , 1 , pinzhi) 
		elseif f == 47 then
			GiveItem ( role , 0 , 0345 , 1 , pinzhi) 
		elseif f == 48 then
			GiveItem ( role , 0 , 0521 , 1 , pinzhi)  
		elseif f == 49 then
			GiveItem ( role , 0 , 0697 , 1 , pinzhi) 
		elseif f == 50 then
			GiveItem ( role , 0 , 0344 , 1 , pinzhi) 
		elseif f == 51 then
			GiveItem ( role , 0 , 0520 , 1 , pinzhi)  
		elseif f == 52 then
			GiveItem ( role , 0 , 0696 , 1 , pinzhi) 
		elseif f == 53 then
			GiveItem ( role , 0 , 0369 , 1 , pinzhi) 
		elseif f == 54 then
			GiveItem ( role , 0 , 0545 , 1 , pinzhi)  
		elseif f == 55 then
			GiveItem ( role , 0 , 0721 , 1 , pinzhi) 
		elseif f == 56 then
			GiveItem ( role , 0 , 0377 , 1 , pinzhi) 
		elseif f == 57 then
			GiveItem ( role , 0 , 0553 , 1 , pinzhi)  
		elseif f == 58 then
			GiveItem ( role , 0 , 0729 , 1 , pinzhi) 
		end
	end
end


	GetExp	=	{}		------------????????
	GetExp[1]	=	0
	GetExp[2]	=	5
	GetExp[3]	=	15
	GetExp[4]	=	35
	GetExp[5]	=	101
	GetExp[6]	=	250
	GetExp[7]	=	500
	GetExp[8]	=	1000
	GetExp[9]	=	1974
	GetExp[10]	=	3208
	GetExp[11]	=	4986
	GetExp[12]	=	7468
	GetExp[13]	=	10844
	GetExp[14]	=	15338
	GetExp[15]	=	21210
	GetExp[16]	=	28766
	GetExp[17]	=	38356
	GetExp[18]	=	50382
	GetExp[19]	=	65306
	GetExp[20]	=	83656
	GetExp[21]	=	106032
	GetExp[22]	=	133112
	GetExp[23]	=	165668
	GetExp[24]	=	204564
	GetExp[25]	=	250780
	GetExp[26]	=	305412
	GetExp[27]	=	369692
	GetExp[28]	=	444998
	GetExp[29]	=	532870
	GetExp[30]	=	635026
	GetExp[31]	=	753378
	GetExp[32]	=	890062
	GetExp[33]	=	1047438
	GetExp[34]	=	1228138
	GetExp[35]	=	1435074
	GetExp[36]	=	1671470
	GetExp[37]	=	1940892
	GetExp[38]	=	2247288
	GetExp[39]	=	2595010
	GetExp[40]	=	2988860
	GetExp[41]	=	3434132
	GetExp[42]	=	3936658
	GetExp[43]	=	4502856
	GetExp[44]	=	5139778
	GetExp[45]	=	5855180
	GetExp[46]	=	6657576
	GetExp[47]	=	7556310
	GetExp[48]	=	8561630
	GetExp[49]	=	9684764
	GetExp[50]	=	10938016
	GetExp[51]	=	12334856
	GetExp[52]	=	13890020
	GetExp[53]	=	15619622
	GetExp[54]	=	17541282
	GetExp[55]	=	19674240
	GetExp[56]	=	22039516
	GetExp[57]	=	24660044
	GetExp[58]	=	27560852
	GetExp[59]	=	30769230
	GetExp[60]	=	37746418
	GetExp[61]	=	45876427
	GetExp[62]	=	59571153
	GetExp[63]	=	75703638
	GetExp[64]	=	94615279
	GetExp[65]	=	116688304
	GetExp[66]	=	155291059
	GetExp[67]	=	186418013
	GetExp[68]	=	238159614
	GetExp[69]	=	298622278
	GetExp[70]	=	368975850
	GetExp[71]	=	450525549
	GetExp[72]	=	568409779
	GetExp[73]	=	679324744
	GetExp[74]	=	806544569
	GetExp[75]	=	952091724
	GetExp[76]	=	1188099236
	GetExp[77]	=	1480429211
	GetExp[78]	=	1776125584
	GetExp[79]	=	2091634902
	GetExp[80]	=	2425349810
	GetExp[81]	=	2440895086
	GetExp[82]	=	2458896515
	GetExp[83]	=	2479742169
	GetExp[84]	=	2503881436
	GetExp[85]	=	2531834707
	GetExp[86]	=	2564204594
	GetExp[87]	=	2601688923
	GetExp[88]	=	2645095775
	GetExp[89]	=	2695360909
	GetExp[90]	=	2753567934
	GetExp[91]	=	2820971668
	GetExp[92]	=	2899025191
	GetExp[93]	=	2989411170
	GetExp[94]	=	3094078133
	GetExp[95]	=	3215282476
	GetExp[96]	=	3355637105
	GetExp[97]	=	3518167765
	GetExp[98]	=	3706378269
	GetExp[99]	=	3924326032
	GetExp[100]	=	4176709541
	GetExp[101]	=	4297812541
	GetExp[102]	=	4399999999
	GetExp[101]	=	4499999999
	GetExp[104]	=	4599999999
	GetExp[105]	=	4699999999

function AddReadingBook ( role )
	local job = GetChaAttr( role, ATTR_JOB)
	local Book_Id = 0
	if job == 1 then
		Book_Id = 3243
	elseif job == 2 then
		Book_Id = 3244
	elseif job == 4 then
		Book_Id = 3246
	elseif job == 5 then
		Book_Id = 3245
	elseif job == 8 then
		Book_Id = 3256
	elseif job == 9 then
		Book_Id = 3255
	elseif job == 12 then
		Book_Id = 3257
	elseif job == 13 then
		Book_Id = 3258
	elseif job == 14 then
		Book_Id = 3259
	elseif job == 16 then
		Book_Id = 3260
	else
		Book_Id = 3288
	end
	GiveItem( role , 0, Book_Id, 1, 4 )
	return LUA_TRUE
end


function AddExpPer ( role , value )			----------??????????????????
	local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	local exp_up = GetExp[lv_next] - GetExp[lv_role]
	local exp_add = math.floor ( exp_up * value / 100 )
	local now_exp = GetChaAttr ( role , ATTR_CEXP )
	local new_exp = now_exp + exp_add
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , new_exp )
	SystemNotice( role , "??"..cha_name.."???"..exp_add.."???")
	return LUA_TRUE
end
function AddExpAll ( role, value1, value2, type)	------------------????
--	SystemNotice( role , "value1="..value1.."value2="..value2.."type="..type)
	local exp_now = GetChaAttr ( role, ATTR_CEXP )
	if type == 1 then							--------??????
		local exp_add = math.random ( value1, value2)
		local lv = GetChaAttr ( role, ATTR_LV )
		if lv < 80 then
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_add = exp_add/50
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	elseif type == 2 then							----------???????
		local per_exp = math.random ( value1, value2)
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv < 80 then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add = math.floor( ( exp_up * per_exp ) / 100 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		elseif lv >= 80 and lv < 100 then
			local lv_next = lv + 1
			local exp_up = GetExp[lv_next] - GetExp[lv]
			local exp_add =  math.floor ( ( exp_up * per_exp ) / 5000 )
			exp_new = exp_now + exp_add
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		else
			exp_new = exp_now + 10000
			SetChaAttrI( role , ATTR_CEXP , exp_new )
		end
	end
end


function AddExpNextLv1( role ) -----------------?????????
	local exp_add = GetChaAttr ( role, ATTR_NLEXP )
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , exp_add )	
	RefreshCha( role )
	Notice ( "??"..cha_name.."???,????,????1?")
	return LUA_TRUE
end

function AddExpNextLv2( role ) -----------------?????????
	local exp_add = GetChaAttr ( role, ATTR_NLEXP )
	local cha_name = GetChaDefaultName ( role )
	SetChaAttrI( role , ATTR_CEXP , exp_add )
	RefreshCha( role )
	Notice ( "??"..cha_name.."???,????,????1?")
	return LUA_TRUE
end


---------------------------------------------------??1440????????
function AddChaHJ( character  )	
	local c1=0
	local c2=0
	c1,c2 =MakeItem(character, 2967, 1, 4)			--value????ID   C2????????????
	local Item_Rwine = GetChaItem ( character , 2 , c2 )			--??????? 2 ??? C2??????
	
	local Rwine_NOW = 1440                                                                              
	
	SetItemAttr(Item_Rwine, ITEMATTR_MAXENERGY, Rwine_NOW)						--??????
	SetItemAttr(Item_Rwine, ITEMATTR_ENERGY, Rwine_NOW)								 --??????,???????????
	RefreshCha( character )
	SystemNotice (character , "?????????????2???????" )
end


---------------------------------------------------???????????0
function CheckHJ ( character )
	local Rwine_Num = 0
	Rwine_Num = CheckBagItem(  character , 2967 )		--?????2977??????
	if Rwine_Num == 1 then				--??2977??????????1
		local Rwine = GetChaItem2 (  character , 2 , 2967 )			--?????????ID?2977??????
		local ENERGY = GetItemAttr(Rwine, ITEMATTR_ENERGY)
		if ENERGY ==0 then
			return LUA_TRUE
		end
	else
		SystemNotice( character, "???????????????")
	end

end

function CreatBBBB( role , MonsterID )
	local x , y = GetChaPos(role)
	x = x + 10
	y = y + 10
	local Refresh = 3600
	local life = 3600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	local Role_ID = GetRoleID(role)	---------??
	BBBB[ Role_ID ] = new
	local hit = GetChaAttr( new , ATTR_HIT )
	--SystemNotice( role , "hit=="..hit )
	hit = 225
	SetCharaAttr ( hit , new , ATTR_HIT )
	--SystemNotice( role , "hit00=="..hit )



	return LUA_TRUE
end



function CheckBBBB( role )
	local Role_ID = GetRoleID(role)	
	local BBBB = BBBB[ Role_ID ]
	if BBBB~= nil and BBBB~= 0 then 
		local ISLive = ValidCha( BBBB )
		--SystemNotice( role , "ISLive==" ..ISLive)
		--local hit = GetChaAttr( BBBB , ATTR_HIT )
		--SystemNotice( role , "hit00==" ..hit)
		--if hit== 225 then
			local x01 , y01 = GetChaPos(role)
			local x02 , y02 = GetChaPos(BBBB)
			local X_red = math.abs( x01 - x02 )
			local Y_red = math.abs( y01 - y02 )
			if X_red <= 2000 and Y_red <= 2000 then
				KillCha( BBBB )-------??
				return LUA_TRUE
			else
				SystemNotice( role , "?????????????" )
				return LUA_FALSE
			end
		--else
			--SystemNotice( role , "????????????????!" )
			--return LUA_FALSE
		--end
	
	else
		SystemNotice( role , "?????????????" )
		return LUA_FALSE
	end
end

-----???????????-----
function ValentinesRingJudge(role)
	local Ring_Num = 0
	local t = {}			--?????????
		t[0] = role 
		t[1] = GetTeamCha(role, 0 )  
		t[2] = GetTeamCha(role, 1 )   
		t[3] = GetTeamCha(role, 2 )    
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--????????????
	t_Num[0]	= 0
	t_Num[1]	= 0
	t_Num[2]	= 0
	t_Num[3]	= 0
	t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil then
			local Ring_Num_Add = CheckBagItem(  t[i] , 2521 )	
			if Ring_Num_Add == 1 then

				local retbag = HasLeaveBagGrid(  t[i], 1)
				if retbag ~= LUA_TRUE then
					SystemNotice(role,"????????1?????")
					SystemNotice(t[i],"??????1?????")
					return LUA_FALSE
				end	
				local NocLock =KitbagLock( t[i], 0 )
				if NocLock == LUA_FALSE then
					SystemNotice( role , "????????")
					SystemNotice( t[i] , "??????")
					return LUA_FALSE
				end

				t_Num[i] = 1		--?????,????1,???????
				Ring_Num = Ring_Num + Ring_Num_Add	--??????????,???????
				local USED_Ring_Num = CheckBagItem(  t[i] , 2520 )	--?????????????????
				if USED_Ring_Num >= 1 then
					SystemNotice(role,"?????????")
					SystemNotice(t[i],"?????")
					return LUA_FALSE		
				end
			end
		end
	end
	
	if Ring_Num == 1 then				--??????????1,????????????
		return LUA_TRUE
	elseif Ring_Num > 1 then
		SystemNotice(role,"?????????……")
		return LUA_FALSE
	else
		SystemNotice(role,"??????")
		return LUA_FALSE
	end
end
-----?????????
function ValentinesRing(role)
	local Ring_Num = 0
	local t = {}			--?????????
		t[0] = role 
		t[1] = GetTeamCha(role, 0 )  
		t[2] = GetTeamCha(role, 1 )   
		t[3] = GetTeamCha(role, 2 )    
		t[4] = GetTeamCha(role, 3 )
	local t_Num = {}		--????????????
		t_Num[0]	= 0
		t_Num[1]	= 0
		t_Num[2]	= 0
		t_Num[3]	= 0
		t_Num[4]	= 0
	local i = 1
	for i = 1 , 4, 1 do
		if t[i] ~= nil then
			local Ring_Num_Add = CheckBagItem(  t[i] , 2521 )	
			if Ring_Num_Add == 1 then
				t_Num[i] = 1		--?????,????1,???????
				Ring_Num = Ring_Num + Ring_Num_Add	--??????????,???????
				local USED_Ring_Num = CheckBagItem(  t[i] , 2520 )	--?????????????????
				if USED_Ring_Num >= 1 then
					SystemNotice(role,"?????????")
					SystemNotice(t[i],"?????")
					return LUA_FALSE		
				end
			end
		end
	end
	
	if Ring_Num == 1 then				--??????????1,????????????
		local i = 1
		for i = 1 , 4 ,1 do
			if t_Num[i] == 1 then
				
				local RoleType = GetChaID(role)
				local TeamerType = GetChaID(t[i])
				if (RoleType<=2 and TeamerType>=3) or (RoleType>=3 and TeamerType<=2) then		--????
					--?????????????????
					local ID_Num = GetRoleID(role)	--????????ID?,???????

					GiveItem ( t[i] , 0 , 2520  , 1 , 4  )
					local a = DelBagItem ( t[i] , 2521 , 1) 

					local Item = GetChaItem2 ( t[i] , 2 , 2520 )	--??????????????
					
					local Num_JZ = GetItemForgeParam ( Item , 1 )
					Num_JZ = TansferNum ( Num_JZ )
					Num_JZ = ID_Num	---??????????ID?
					SetItemForgeParam ( Item , 1 , Num_JZ )
					AddChaSkill ( t[i] , SK_QLZX, 1 , 1 , 0 ) 
					--????????????????????
					local ID_Num1 = GetRoleID(t[i])	--???????ID?,???????

					GiveItem ( role , 0 , 2520  , 1 , 4  )
					local b = DelBagItem ( role , 2521 , 1) 

					local Item1 = GetChaItem2 ( role , 2 , 2520 )	--???????????????

					local Num_JZ1 = GetItemForgeParam ( Item1 , 1 )
					Num_JZ1 = TansferNum ( Num_JZ1 )
					Num_JZ1 = ID_Num1	---??????????ID?
					SetItemForgeParam ( Item1 , 1 , Num_JZ1 )
					AddChaSkill ( role , SK_QLZX, 1 , 1 , 0 ) 
				--	Notice("???")
				else
					SystemNotice(role,"????????……")
				end
			end
		end
		return LUA_TRUE
	elseif Ring_Num > 1 then
		SystemNotice(role,"?????????……")
		return LUA_FALSE
	else
		SystemNotice(role,"??????")
		return LUA_FALSE
	end
end

function Checksailexpless ( role , value )
	local sail_role = GetChaAttr ( role , ATTR_CSAILEXP )
	if sail_role < value then
		return LUA_TRUE
	end
end

function Checksailexpmore ( role , value )
	local sail_role = GetChaAttr ( role , ATTR_CSAILEXP )
	if sail_role >= value then
		return LUA_TRUE
	end
end




---------------------------------------------------?????????????????0
function ItemAttrNum( role ,p1,p2,p3,p4)----p1:????,p2:??????,p3:??????,p4:??(1),??(2),??(0),????(3),????(4)
	local ItemAttr={}
	ItemAttr[1]=ITEMATTR_VAL_STR
	ItemAttr[2]=ITEMATTR_VAL_AGI
	ItemAttr[3]=ITEMATTR_VAL_DEX
	ItemAttr[4]=ITEMATTR_VAL_CON
	ItemAttr[5]=ITEMATTR_VAL_STA
	ItemAttr[6]=ITEMATTR_URE
	ItemAttr[7]=ITEMATTR_ENERGY
	local item_num = 0
	local item=0	
	item_num = CheckBagItem(  role , p1  )		--?????p1??????-+
	
	if item_num~=1 then
		SystemNotice( role, "??????????????")
		return LUA_FALSE
	else
		item=GetChaItem2 (  role , 2 , p1 )-----------------?????
		local itemattrnum=GetItemAttr(item,ItemAttr[p2])--------????p2??
		if p4==0 and itemattrnum==p3 then ------------??????p3
			return LUA_TRUE
		elseif p4==1 and itemattrnum>p3 then ------------??????p3
			return LUA_TRUE
		elseif  p4==2 and itemattrnum<p3 then ------------??????p3
			return LUA_TRUE
		elseif  p4==3 and itemattrnum>=p3 then ------------????????p3
			return LUA_TRUE
		elseif  p4==4 and itemattrnum<=p3 then ------------????????p3
			return LUA_TRUE			
		else
			return LUA_FALSE			
		end
	end
end

---------------------------------------------------????????????--????
function CheckChaItem( role )
	local ItemBag = 2									
	local item = GetChaItem(role, 2, 2)                               --- ???????3??? 
	local itemattrnum = GetItemAttr(item, ITEMATTR_ENERGY)            ---???????3??? ????
	local itemtypenum = GetItemType(item)                             ---???????3??? ???
	local item_ID = GetItemID(item)	
	--local R1 = 0	
	if  item == nil then
		SystemNotice(role,"????????????????")
		return LUA_FALSE
	elseif item_ID == 5842  then
		SystemNotice(role,"??????????")
		return LUA_FALSE		
	elseif itemattrnum<3000 then
		SystemNotice( role, "????????????????????")
		return LUA_FALSE
	elseif itemtypenum~=1 and itemtypenum~=2 and itemtypenum~=3 and itemtypenum~=4 and itemtypenum~=5 and itemtypenum~=6 and itemtypenum~=7 and itemtypenum~=9 and itemtypenum~=10 and itemtypenum~=11 and itemtypenum~=22 and itemtypenum~=23 and itemtypenum~=24 then	 
		SystemNotice( role, "????????????????")
		return LUA_FALSE
	--elseif R1 == 0 then
		--SystemNotice( role, "??????")
		--return LUA_FALSE
	else		
		--RemoveChaItem ( role , item_ID , 1 , 2 , -1 , 2 , 0  )
		--RemoveChaItem ( role , 3669    , 1 , 1 , -1 , 2 , 1  )
		SystemNotice(role ,"Item_ID======"..item_ID)
		return LUA_TRUE
	end	
end


function ClearItemNum2( role )
	local ItemBag = 2									
	local item = GetChaItem(role, 2, 2)                               --- ???????3??? 
	local itemattrnum = GetItemAttr(item, ITEMATTR_ENERGY)            ---???????3??? ????
	local itemtypenum = GetItemType(item)                             ---???????3??? ???
	local item_ID = GetItemID(item)	
	--local R1 = 0	
	if  item == nil then
		--SystemNotice(role,"????????????????")
		return LUA_FALSE
	elseif item_ID == 5842  then
		--SystemNotice(role,"??????????")
		return LUA_FALSE		
	elseif itemattrnum<3000 then
		--SystemNotice( role, "????????????????????")
		return LUA_FALSE
	elseif itemtypenum~=1 and itemtypenum~=2 and itemtypenum~=3 and itemtypenum~=4 and itemtypenum~=5 and itemtypenum~=6 and itemtypenum~=7 and itemtypenum~=9 and itemtypenum~=10 and itemtypenum~=11 and itemtypenum~=22 and itemtypenum~=23 and itemtypenum~=24 then	 
		--SystemNotice( role, "????????????????")
		return LUA_FALSE
	else		
		SystemNotice(role ,"Item_ID======"..item_ID)
		return item_ID
	end
end


-----------?????? by Lee
function CheckTime_cpopen ( role )
	local now_week= os.date("%w")		-------------???(???) 
	local now_hour= os.date("%H")		-------------? 
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)
--	SystemNotice( role, "??"..now_week.."??"..now_hour)
	if now_week == 7 or now_week == 1 or  now_week == 2 or  now_week == 5 or  now_week == 3 or  now_week == 4  then
		if now_week == 6 then
			if now_hour <19 and now_hour > 20 then
				return LUA_TRUE
			end
	
		end
        end
end
-----------------?????? by eric
function CheckTime_cpcolse ( role )
	local now_week= os.date("%w")		-------------???(???) 
	local now_hour= os.date("%H")		-------------? 
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)
--	SystemNotice( role, "??"..now_week.."??"..now_hour)
	if now_week == 7 or now_week == 1 or  now_week == 2 or  now_week == 5 or  now_week == 3 or  now_week == 4  then
		if now_week == 6 then
			if now_hour <19 and now_hour > 22 then
				return LUA_TRUE
			end
		end
	end
end

------------???????  by Peter
function DuiHhuan1( role )
--		SystemNotice( role, "come here!11")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0 then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU   then   --??????             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --??????
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --??????
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --??????
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --??????
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --??????
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --???????
			 local  Nom1 =GetTicketItemno(crab, 1)         --??????
			local  Nom2 =GetTicketItemno(crab, 2)          --??????
			local  Nom3 =GetTicketItemno(crab, 3)          --??????
			local  Nom4 =GetTicketItemno(crab, 4)          --??????
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --??????
			local  Nom6 =GetTicketItemno(crab, 6)          --???????
			if  Nom1=="X" then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X" then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X" then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X" then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X" then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X" then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

			if  no1==Nom1 and  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6	then
				  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
--				SystemNotice( role, "return LUA_TRUE")
				return LUA_TRUE
			 else
--				SystemNotice( role, "return LUA_FALSE")
				return LUA_FALSE
			 end
		 end
end
     
---------------??????? by Peter
function DuiHhuan2( role )
--		SystemNotice( role, "come here!22")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0 then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU  then   --??????             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --??????
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --??????
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --??????
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --??????
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --??????
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --???????
			 local  Nom1 =GetTicketItemno(crab, 1)         --??????
			local  Nom2 =GetTicketItemno(crab, 2)          --??????
			local  Nom3 =GetTicketItemno(crab, 3)          --??????
			local  Nom4 =GetTicketItemno(crab, 4)          --??????
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --??????
			local  Nom6 =GetTicketItemno(crab, 6)          --???????
			if  Nom1=="X" then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X" then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X" then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X" then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X" then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X" then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		if  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6 then
			 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
---			SystemNotice( role, "return LUA_TRUE1")
			return LUA_TRUE
		elseif  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 and no1==Nom1 then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
---			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
		else
---			SystemNotice( role, "return LUA_FALSE")
			return LUA_FALSE
		end

	end

end
-------------??????? by Peter
function DuiHhuan3( role )
--		SystemNotice( role, "come here!33")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0 then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU  then   --??????             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --??????
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --??????
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --??????
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --??????
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --??????
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --???????
			 local  Nom1 =GetTicketItemno(crab, 1)         --??????
			local  Nom2 =GetTicketItemno(crab, 2)          --??????
			local  Nom3 =GetTicketItemno(crab, 3)          --??????
			local  Nom4 =GetTicketItemno(crab, 4)          --??????
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --??????
			local  Nom6 =GetTicketItemno(crab, 6)          --???????
			if  Nom1=="X" then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X" then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X" then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X" then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X" then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X" then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		
		if  no1==Nom1 and no2==Nom2 and no3==Nom3 and no4==Nom4  then
			  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
--			SystemNotice( role, "return LUA_TRUE1")
			return LUA_TRUE
		elseif  no2==Nom2 and no3==Nom3 and no4==Nom4 and no5==Nom5 then
			  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
--			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
                elseif  no3==Nom3 and no4==Nom4 and no5==Nom5 and no6==Nom6 then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
---			SystemNotice( role, "return LUA_TRUE2")
			return LUA_TRUE
		 else
---			SystemNotice( role, "return LUA_FALSE")
			return LUA_FALSE
	       end
	end
end
----------??????? by Peter
function DuiHhuan4( role )
--		SystemNotice( role, "come here!44")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0 then 
		return LUA_FALSE
		 end
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU  then   --??????             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --??????
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --??????
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --??????
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --??????
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --??????
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --???????
			 local  Nom1 =GetTicketItemno(crab, 1)         --??????
			local  Nom2 =GetTicketItemno(crab, 2)          --??????
			local  Nom3 =GetTicketItemno(crab, 3)          --??????
			local  Nom4 =GetTicketItemno(crab, 4)          --??????
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --??????
			local  Nom6 =GetTicketItemno(crab, 6)          --???????
			if  Nom1=="X" then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X" then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X" then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X" then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X" then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X" then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		 if  no1==Nom1 and  no2==Nom2 and no3==Nom3  then 
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			return LUA_TRUE
		  elseif no2==Nom2 and no3==Nom3 and no4==Nom4 then
		   RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		elseif no3==Nom3 and no4==Nom4 and no5==Nom5  then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		 elseif no4==Nom4 and no5 == Nom5 and no6 == Nom6  then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		 else
			return LUA_FALSE
		end
	 end
end
-------------??????? by Peter
function DuiHhuan5( role )
--		SystemNotice( role, "come here!55")
		local issue = GetLotteryIssue()
--		SystemNotice( role, "issue=="..issue)
		local crab = GetChaItem ( role , 2 , 0  )
		 local caipiaoID= GetItemID (crab)
		 local caipiaoqi = GetTicketIssue(crab)
--		SystemNotice( role, "caipiaoqi=="..caipiaoqi)
		local caipiaoU=issue-1
		if  caipiaoqi ==0 then 
		return LUA_FALSE
		 end
--		SystemNotice( role, "caipiaoU=="..caipiaoU)
		 if  caipiaoID==5828 and caipiaoqi == caipiaoU  then   --??????             
			 local  no1 =GetWinLotteryItemno(caipiaoU, 1)         --??????
--			SystemNotice( role, "no1=="..no1)
			local  no2 =GetWinLotteryItemno(caipiaoU, 2)          --??????
			local  no3 =GetWinLotteryItemno(caipiaoU, 3)          --??????
			local  no4 =GetWinLotteryItemno(caipiaoU, 4)          --??????
			local  no5 =GetWinLotteryItemno(caipiaoU, 5)          --??????
			local  no6 =GetWinLotteryItemno(caipiaoU, 6)          --???????
			 local  Nom1 =GetTicketItemno(crab, 1)         --??????
			local  Nom2 =GetTicketItemno(crab, 2)          --??????
			local  Nom3 =GetTicketItemno(crab, 3)          --??????
			local  Nom4 =GetTicketItemno(crab, 4)          --??????
--			SystemNotice( role, "Nom4=="..Nom4)
			local  Nom5 =GetTicketItemno(crab, 5)          --??????
--			SystemNotice( role, "Nom5=="..Nom5)
			local  Nom6 =GetTicketItemno(crab, 6)          --???????
--			SystemNotice( role, "Nom6=="..Nom6)
			if  Nom1=="X" then  
				Nom1=no1 
--				SystemNotice( role, "Nom1=="..Nom1)
			elseif   Nom2=="X" then  
				Nom2=no2  
--				SystemNotice( role, "Nom2=="..Nom2)
			elseif   Nom3=="X" then 
				Nom3=no3  
--				SystemNotice( role, "Nom3=="..Nom3)
			elseif   Nom4=="X" then 
				Nom4=no4  
--				SystemNotice( role, "Nom4=="..Nom4)
			elseif   Nom5=="X" then  
				Nom5=no5  
--				SystemNotice( role, "Nom5=="..Nom5)
			elseif   Nom6=="X" then  
				Nom6=no6  	
--				SystemNotice( role, "Nom6=="..Nom6)
			end

		 if  no1==Nom1 and  no2==Nom2 then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		elseif no2==Nom2 and no3==Nom3  then
		 RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		 elseif no3==Nom3 and no4==Nom4 then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		 elseif no4==Nom4 and no5==Nom5  then 
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		 elseif  no5==Nom5 and no6==Nom6 then
		  RemoveChaItem ( role , 5828, 1 , 2 , 0 , 2 , 1 , 1)                  --????????????
			 return LUA_TRUE
		else
			return LUA_FALSE
		end
	end
end

function FireworksChurch(role)
	local t = {} 
		t[0] = 839
		t[1] = 838
		t[2] = 366
		t[3] = 369
		t[4] = 363

	local i = math.random( 0, 4 )
	return PlayEffect( role, t[i] )
end

--[[???? ???? 
?????????95BB ????]]--
function CheckItem_ZHONGSHEN ( role )

	local body = GetChaItem ( role , 1 , 2 )
	local hand = GetChaItem ( role , 1 , 3 )
	local foot = GetChaItem ( role , 1 , 4 )
	local head = GetChaItem ( role , 1 , 0 )
	local Body_ID = GetItemID ( body )
	local Hand_ID = GetItemID ( hand )
	local Foot_ID = GetItemID ( foot )
	local Head_ID = GetItemID ( head )
            local body_gem_id = GetItemAttr ( body , ITEMATTR_VAL_FUSIONID )
            local hand_gem_id = GetItemAttr ( hand , ITEMATTR_VAL_FUSIONID )
	local foot_gem_id = GetItemAttr ( foot , ITEMATTR_VAL_FUSIONID )
	local head_gem_id = GetItemAttr ( head , ITEMATTR_VAL_FUSIONID )

		body_gem_id=Body_ID
		hand_gem_id=Hand_ID
		foot_gem_id=Foot_ID
		head_gem_id=Head_ID
	if body_gem_id ~= 6070 and body_gem_id ~= 6074 and body_gem_id ~= 6079 and body_gem_id ~= 6083 then
	   return 0
	end
	if hand_gem_id ~= 6071 and hand_gem_id ~= 6075 and hand_gem_id ~= 6080 and hand_gem_id ~= 6084 then
	   return 0
	end
	if foot_gem_id ~= 6072 and foot_gem_id ~= 6076 and foot_gem_id ~= 6081 and foot_gem_id ~= 6085 then 
	   return 0
	end
	if head_gem_id ~= 6073 and head_gem_id ~= 6077 and head_gem_id ~= 6078 and head_gem_id ~= 6082 then
	   return 0
	end
	return 1
end

--???? 95BB
function ZhongShenTaoZhuang(role,now_tick)
	local ZhongShen_Value = CheckItem_ZHONGSHEN (role)
	if ZhongShen_Value ~= 0 then
		local statelv = 1
		local statetime = 3600
		AddState ( role , role , STATE_zhongshen , statelv , statetime )
		return
	else
		local statelv_ZhongShen = GetChaStateLv ( role , STATE_zhongshen )
		if statelv_ZhongShen~=0 then
				RemoveState ( role ,STATE_zhongshen ) 
			return
			end
		return
	end
end

function Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
     local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --??
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --??
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --??
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --??
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --??
    local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
    local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 

    local Lv = str + agi + dex + con + sta
    local attr_type_num = GetItemAttr( Item_Traget ,attr_type )

    local a = 1
    SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
    if Lv >= 1000 then
        a = 0
	SystemNotice (role , "\212\229\255 \228\238\241\242\232\227\235\224 \241\226\238\229\227\238 \239\240\229\228\229\235\224 ")	
    end
    
    local b = Percentage_Random ( a )
    
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) --??????
        --local item_maxenerge = GetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ) --?????????
   
    if b == 1 then                        --???????,??????? -- ITEMATTR_ENERGY
            AddItemEffect(role , Item_Traget , 0  )
        item_energe = 0 
        
                attr_type_num = attr_type_num + 2
        SetItemAttr ( Item_Traget , attr_type , attr_type_num )

        local Item_MAXENERGY = 240 * ( Lv + 2 )
        
        if Item_MAXENERGY > 6480 then
            Item_MAXENERGY = 6480
        end


        local Item_MAXURE_NUM = Elf_MaxURE + 2000

        if Item_MAXURE_NUM > 32000 then
            Item_MAXURE_NUM = 32000
        end
        
        SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
        SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
        ResetItemFinalAttr(Item_Traget)
            AddItemEffect(role , Item_Traget , 1  )
    else                            --??????????????
        item_energe = 0.5 * item_energe   
    end
        SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )

end

function Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
     local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --??
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --??
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --??
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --??
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --??
    local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
    local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 

    local Lv = str + agi + dex + con + sta
    local attr_type_num = GetItemAttr( Item_Traget ,attr_type )

    local a = 1
    SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
    if Lv >= 1200 then
        a = 0
	SystemNotice (role , "\212\229\255 \228\238\241\242\232\227\235\224 \241\226\238\229\227\238 \239\240\229\228\229\235\224 ")	
    end
    
    local b = Percentage_Random ( a )
    
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) --??????
        --local item_maxenerge = GetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ) --?????????
   
    if b == 1 then                        --???????,??????? -- ITEMATTR_ENERGY
            AddItemEffect(role , Item_Traget , 0  )
        item_energe = 0 
        
                attr_type_num = attr_type_num + 2
        SetItemAttr ( Item_Traget , attr_type , attr_type_num )

        local Item_MAXENERGY = 240 * ( Lv + 2 )
        
        if Item_MAXENERGY > 6480 then
            Item_MAXENERGY = 6480
        end


        local Item_MAXURE_NUM = Elf_MaxURE + 2000

        if Item_MAXURE_NUM > 32000 then
            Item_MAXURE_NUM = 32000
        end
        
        SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
        SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
        ResetItemFinalAttr(Item_Traget)
            AddItemEffect(role , Item_Traget , 1  )
    else                            --??????????????
        item_energe = 0.5 * item_energe   
    end
        SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )

end

function Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
     local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --??
        local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --??
        local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --??
        local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --??
        local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --??
    local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
    local Elf_MaxURE = GetItemAttr(Item_Traget,ITEMATTR_MAXURE) 

    local Lv = str + agi + dex + con + sta
    local attr_type_num = GetItemAttr( Item_Traget ,attr_type )

    local a = 1
    SystemNotice (role , "\192\226\242\238\236\224\242\232\247\229\241\234\224\255 \239\240\238\234\224\247\234\224 \212\229\232 ")	
    if Lv >= 1400 then
        a = 0
	SystemNotice (role , "\212\229\255 \228\238\241\242\232\227\235\224 \241\226\238\229\227\238 \239\240\229\228\229\235\224 ")	
    end
    
    local b = Percentage_Random ( a )
    
        local item_energe = GetItemAttr( Item_Traget ,ITEMATTR_ENERGY ) --??????
        --local item_maxenerge = GetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ) --?????????
   
    if b == 1 then                        --???????,??????? -- ITEMATTR_ENERGY
            AddItemEffect(role , Item_Traget , 0  )
        item_energe = 0 
        
                attr_type_num = attr_type_num + 2
        SetItemAttr ( Item_Traget , attr_type , attr_type_num )

        local Item_MAXENERGY = 240 * ( Lv + 2 )
        
        if Item_MAXENERGY > 6480 then
            Item_MAXENERGY = 6480
        end


        local Item_MAXURE_NUM = Elf_MaxURE + 2000

        if Item_MAXURE_NUM > 32000 then
            Item_MAXURE_NUM = 32000
        end
        
        SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )
        SetItemAttr ( Item_Traget , ITEMATTR_MAXURE , Item_MAXURE_NUM )
        ResetItemFinalAttr(Item_Traget)
            AddItemEffect(role , Item_Traget , 1  )
    else                            --??????????????
        item_energe = 0.5 * item_energe   
    end
        SetItemAttr ( Item_Traget , ITEMATTR_ENERGY , item_energe )

end


function Lvup_Agi_4 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_AGI -- ??????????? - ??
Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Str_4 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STR -- ??????????? - ??
Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Con_4 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_CON -- ??????????? - ??
Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Dex_4 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_DEX -- ??????????? - ??
Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Sta_4 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STA -- ??????????? - ??
Elf_LvUp_4 ( role , Item_Num , Item_Traget , attr_type )
end


function Lvup_Agi_5 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_AGI -- ??????????? - ??
Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Str_5 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STR -- ??????????? - ??
Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Con_5 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_CON -- ??????????? - ??
Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Dex_5 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_DEX -- ??????????? - ??
Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Sta_5 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STA -- ??????????? - ??
Elf_LvUp_5 ( role , Item_Num , Item_Traget , attr_type )
end

function Lvup_Agi_6 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_AGI -- ??????????? - ??
Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Str_6 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STR -- ??????????? - ??
Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Con_6 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_CON -- ??????????? - ??
Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Dex_6 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_DEX -- ??????????? - ??
Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
end
function Lvup_Sta_6 ( role , Item_Num ,Item_Traget )
local attr_type = ITEMATTR_VAL_STA -- ??????????? - ??
Elf_LvUp_6 ( role , Item_Num , Item_Traget , attr_type )
end



function FastCombiner(cha,itemid,lvl)
	local CombineLvl = {}
	CombineLvl[2] = {pieces=2,fee=2000000}
	CombineLvl[3] = {pieces=4,fee=3000000}
	CombineLvl[4] = {pieces=8,fee=4000000}
	CombineLvl[5] = {pieces=16,fee=5000000}
	CombineLvl[6] = {pieces=32,fee=6000000}
	
	--! Check if Bag is locked
	if(KitbagLock(cha, 0) ~= LUA_TRUE)then 
		HelpInfo(cha,0,'Your bag is locked!') 
		return
	end 
      
	--! Check has money required for gem level
	local m = HasMoney(cha,CombineLvl[lvl].fee)
	if(m == 0)then
		HelpInfo(cha,0,'\194\224\236 \237\243\230\237\238 '..CombineLvl[lvl].fee..'G to combine!')
		return
	end
	
	--! Scan whole inventory and store gem slots location
	local bag,gemSlot,gemLv,array = GetKbCap(cha),0,0,{}
	for i = 0,bag-1 do
		gemSlot = GetChaItem(cha,2,i)
		if(GetItemID(gemSlot) == itemid)then
			gemLv = GetItemAttr(gemSlot,ITEMATTR_VAL_BaoshiLV)
			if(gemLv == 1)then
				table.insert(array,i)
			end
		end
	end
	
	--! Check if player has correct number of gems (Lv1)
	if(table.getn(array) < CombineLvl[lvl].pieces)then
		HelpInfo(cha,0,'\194\224\236 \237\243\230\237\238 '..CombineLvl[lvl].pieces..' '..GetItemName(itemid)..' \228\235\255 \234\238\236\225\232\237\232\240\238\226\224\237\232\255!')
		return
	end
	
	--! Remove gems
	local rem = 0
	for k,j in pairs(array) do
		if(rem < CombineLvl[lvl].pieces)then
			RemoveChaItem(cha,0,1,2,j,2,1)
			rem = rem + 1
		else
			break
		end
	end
	
	--! Give a message, take the money & the gem combined
	BickerNotice(cha,GetItemName(itemid)..' \243\241\239\229\248\237\238 \241\234\238\236\225\232\237\232\240\238\226\224\237 \228\238 '..lvl..' \243\240\238\226\237\255!')
	TakeMoney(cha,0,CombineLvl[lvl].fee)
	GiveItem(cha,0,itemid,1,100+lvl)
end

function AddSkillNPC ( role )
    local job = GetChaAttr(role, ATTR_JOB)    -- Проверям профессию персонажа
    if (job == 1) then                        -- Мечник
local sk_add = {}
sk_add[0] = SK_CHF;
sk_add[1] = SK_JDZZ;
sk_add[2] = SK_JSSL;
sk_add[3] = SK_GTYZ;
sk_add[4] = SK_HYZ;
sk_add[5] = SK_PJ;
sk_add[6] = SK_KB;
sk_add[7] = SK_HX;
	 
local sk_name = {}
sk_name[0] = "\205\224\241\236\229\248\234\224 ";
sk_name[1] = "\202\238\237\246\229\237\242\240\224\246\232\255 ";
sk_name[2] = "\204\224\241\242\229\240 \194\235\224\228\229\237\232\255 \204\229\247\238\236 ";
sk_name[3] = "\209\242\224\235\252\237\224\255 \194\238\235\255 ";
sk_name[4] = "\200\235\235\254\231\238\240\237\251\233 \211\228\224\240 ";
sk_name[5] = "\193\240\238\237\229\235\238\236 ";
sk_name[6] = "\193\229\240\241\229\240\234 ";
sk_name[7] = "\208\251\234 \210\232\227\240\224 "; 
	
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 7 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end   
    elseif (job == 2) then                    -- Охотник
local sk_add = {}
sk_add[0] = SK_GJSL;
sk_add[1] = SK_JFB;
sk_add[2] = SK_LZJ;
sk_add[3] = SK_FNQ;
sk_add[4] = SK_BDJ;
sk_add[5] = SK_LXJY;
sk_add[6] = SK_DJ;
	
local sk_name = {}
sk_name[0] = "\204\224\241\242\229\240 \209\242\240\229\235\234\238\226\238\227\238 \206\240\243\230\232\255 ";
sk_name[1] = "\207\243\242\252 \194\229\242\240\224 ";
sk_name[2] = "\196\226\238\233\237\238\233 \194\251\241\242\240\229\235 ";
sk_name[3] = "\194\238\238\228\243\248\229\226\235\229\237\232\229 ";
sk_name[4] = "\203\229\228\255\237\224\255 \209\242\240\229\235\224 ";
sk_name[5] = "\204\229\242\229\238\240\232\242\237\251\233 \196\238\230\228\252 ";
sk_name[6] = "\206\242\240\224\226\235\229\237\224\255 \209\242\240\229\235\224 ";
	
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 6 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 4) then                    -- Мореплавотель
local sk_add = {}
sk_add[0] = SK_JR;
sk_add[1] = SK_LJ;
sk_add[2] = SK_SL;
sk_add[3] = SK_BKZJ;
sk_add[4] = SK_JF;
sk_add[5] = SK_HZCR;

local sk_name = {}
sk_name[0] = "\211\241\229\240\228\232\229 ";
sk_name[1] = "\204\238\235\237\232\255 ";
sk_name[2] = "\194\238\228\238\242\238\234 ";
sk_name[3] = "\193\240\238\237\255 \232\231 \208\224\234\238\226\232\237 ";
sk_name[4] = "\210\238\240\237\224\228\238 ";
sk_name[5] = "\194\238\228\238\240\238\241\235\232 ";
	
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 5 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 5) then                    -- Знахарка
local sk_add = {}
sk_add[0] = SK_XZY;
sk_add[1] = SK_XLCZ;
sk_add[2] = SK_XLZH;
sk_add[3] = SK_SHPF;
sk_add[4] = SK_JSJC;
sk_add[5] = SK_HFS;
sk_add[6] = SK_FZLZ;
sk_add[7] = SK_FH;
	
local sk_name = {}
sk_name[0] = "\200\241\246\229\235\229\237\232\229 ";
sk_name[1] = "\207\240\232\231\240\224\247\237\251\233 \211\228\224\240 ";
sk_name[2] = "\207\240\232\231\240\224\247\237\251\233 \206\227\238\237\252 ";
sk_name[3] = "\199\224\234\224\235\234\224 ";
sk_name[4] = "\209\232\235\224 ";
sk_name[5] = "\194\238\241\241\242\224\237\238\226\235\229\237\232\229 ";
sk_name[6] = "\204\238\249\252 \193\243\240\232 ";
sk_name[7] = "\194\238\241\234\240\229\248\229\237\232\229 ";	
	
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 7 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end	
    elseif (job == 8) then                    -- Чемпион
local sk_add = {}
sk_add[0] = SK_CHF;
sk_add[1] = SK_JDZZ;
sk_add[2] = SK_JSSL;
sk_add[3] = SK_GTYZ;
sk_add[4] = SK_HYZ;
sk_add[5] = SK_PJ;
sk_add[6] = SK_KB;
sk_add[7] = SK_HX;
sk_add[8] = SK_PAX;
sk_add[9] = SK_JJSL;
sk_add[10] = SK_QHTZ;
sk_add[11] = SK_ZJ;
sk_add[12] = SK_LH;
sk_add[13] = SK_MNRX;
sk_add[14] = SK_SWZQ;
 
local sk_name = {}
sk_name[0] = "\205\224\241\236\229\248\234\224 ";
sk_name[1] = "\202\238\237\246\229\237\242\240\224\246\232\255 ";
sk_name[2] = "\204\224\241\242\229\240 \194\235\224\228\229\237\232\255 \204\229\247\238\236 ";
sk_name[3] = "\209\242\224\235\252\237\224\255 \194\238\235\255 ";
sk_name[4] = "\200\235\235\254\231\238\240\237\251\233 \211\228\224\240 ";
sk_name[5] = "\193\240\238\237\229\235\238\236 ";
sk_name[6] = "\193\229\240\241\229\240\234 ";
sk_name[7] = "\208\251\234 \210\232\227\240\224 "; 
sk_name[8] = "\208\251\234 ";
sk_name[9] = "\204\224\241\242\229\240 \193\238\235\252\248\238\227\238 \204\229\247\224 ";
sk_name[10] = "\211\241\232\235\229\237\232\229 ";
sk_name[11] = "\204\238\227\243\247\232\233 \211\228\224\240 ";
sk_name[12] = "\194\238\233 ";
sk_name[13] = "\202\240\238\226\224\226\251\233 \193\251\234 ";
sk_name[14] = "\207\229\240\226\238\225\251\242\237\224\255 \223\240\238\241\242\252 ";

local sk_lvl = 1    -- Уровень умения
 
for i = 0, 14 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 9) then                    -- Воитель
        -- Тело функции
local sk_add = {}
sk_add[0] = SK_CHF;
sk_add[1] = SK_JDZZ;
sk_add[2] = SK_JSSL;
sk_add[3] = SK_GTYZ;
sk_add[4] = SK_HYZ;
sk_add[5] = SK_PJ;
sk_add[6] = SK_KB;
sk_add[7] = SK_HX;
sk_add[8] = SK_FSZ;
sk_add[9] = SK_LQHB;
sk_add[10] = SK_PXKG;
sk_add[11] = SK_DB;
sk_add[12] = SK_GWZ;
sk_add[13] = SK_YS;
 
local sk_name = {}
sk_name[0] = "\205\224\241\236\229\248\234\224 ";
sk_name[1] = "\202\238\237\246\229\237\242\240\224\246\232\255 ";
sk_name[2] = "\204\224\241\242\229\240 \194\235\224\228\229\237\232\255 \204\229\247\238\236 ";
sk_name[3] = "\209\242\224\235\252\237\224\255 \194\238\235\255 ";
sk_name[4] = "\200\235\235\254\231\238\240\237\251\233 \211\228\224\240 ";
sk_name[5] = "\193\240\238\237\229\235\238\236 ";
sk_name[6] = "\193\229\240\241\229\240\234 ";
sk_name[7] = "\208\251\234 \210\232\227\240\224 "; 
sk_name[8] = "\208\243\225\234\224 \196\226\243\236\255 \204\229\247\224\236\232 ";
sk_name[9] = "\209\237\238\240\238\226\234\224 ";
sk_name[10] = "\202\240\238\226\224\226\238\229 \193\229\231\243\236\232\229 ";
sk_name[11] = "\223\228\238\226\232\242\251\233 \196\240\238\242\232\234 ";
sk_name[12] = "\210\229\237\229\226\238\233 \211\228\224\240 ";
sk_name[13] = "\209\234\240\251\242\237\238\241\242\252 ";

local sk_lvl = 1    -- Уровень умения
 
for i = 0, 13 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 12) then                    -- Стрелок
        -- Тело функции
local sk_add = {}
sk_add[0] = SK_GJSL;
sk_add[1] = SK_JFB;
sk_add[2] = SK_LZJ;
sk_add[3] = SK_FNQ;
sk_add[4] = SK_BDJ;
sk_add[5] = SK_LXJY;
sk_add[6] = SK_DJ;
sk_add[7] = SK_HQSL;
sk_add[8] = SK_RSD;
sk_add[9] = SK_TJ;
sk_add[10] = SK_SJ;
sk_add[11] = SK_BT;
sk_add[12] = SK_JGS;

local sk_name = {}
sk_name[0] = "\204\224\241\242\229\240 \209\242\240\229\235\234\238\226\238\227\238 \206\240\243\230\232\255 ";
sk_name[1] = "\207\243\242\252 \194\229\242\240\224 ";
sk_name[2] = "\196\226\238\233\237\238\233 \194\251\241\242\240\229\235 ";
sk_name[3] = "\194\238\238\228\243\248\229\226\235\229\237\232\229 ";
sk_name[4] = "\203\229\228\255\237\224\255 \209\242\240\229\235\224 ";
sk_name[5] = "\204\229\242\229\238\240\232\242\237\251\233 \196\238\230\228\252 ";
sk_name[6] = "\206\242\240\224\226\235\229\237\224\255 \209\242\240\229\235\224 ";
sk_name[7] = "\204\224\241\242\229\240 \206\227\237\229\241\242\240\229\235\252\237\238\227\238 \206\240\243\230\232\255 ";
sk_name[8] = "\199\224\230\232\227\224\242\229\235\252\237\224\255 \207\243\235\255 ";
sk_name[9] = "\202\224\235\229\247\224\249\232\233 \194\251\241\242\240\229\235 ";
sk_name[10] = "\206\241\235\224\225\235\229\237\232\229 ";
sk_name[11] = "\194\251\241\242\240\229\235 \226 \195\238\235\238\226\243 ";
 
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 12 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
    AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
end
    elseif (job == 13) then                    -- Целительница
        --Тело функции
local sk_add = {}
sk_add[0] = SK_XZY;
sk_add[1] = SK_XLCZ;
sk_add[2] = SK_XLZH;
sk_add[3] = SK_SHPF;
sk_add[4] = SK_JSJC;
sk_add[5] = SK_HFS;
sk_add[6] = SK_FZLZ;
sk_add[7] = SK_FH;
sk_add[8] = SK_SY;
sk_add[9] = SK_SYZY;
sk_add[10] = SK_JSFB;
sk_add[11] = SK_XLPZ;
sk_add[12] = SK_TSHD;
sk_add[13] = SK_HFWQ;
sk_add[14] = SK_CRXSF;

local sk_name = {}
sk_name[0] = "\200\241\246\229\235\229\237\232\229 ";
sk_name[1] = "\207\240\232\231\240\224\247\237\251\233 \211\228\224\240 ";
sk_name[2] = "\207\240\232\231\240\224\247\237\251\233 \206\227\238\237\252 ";
sk_name[3] = "\199\224\234\224\235\234\224 ";
sk_name[4] = "\209\232\235\224 ";
sk_name[5] = "\194\238\241\241\242\224\237\238\226\235\229\237\232\229 ";
sk_name[6] = "\204\238\249\252 \193\243\240\232 ";
sk_name[7] = "\194\238\241\234\240\229\248\229\237\232\229 ";
sk_name[8] = "\193\235\224\227\238\228\224\242\252 \195\238\241\239\238\228\237\255 ";
sk_name[9] = "\200\241\242\232\237\237\238\229 \199\240\229\237\232\229 ";
sk_name[10] = "\194\238\240\238\237\234\224 \210\238\240\237\224\228\238 ";
sk_name[11] = "\204\224\227\232\247\229\241\234\232\233 \217\232\242 ";
sk_name[12] = "\192\237\227\229\235\252\241\234\232\233 \217\232\242 ";
sk_name[13] = "\200\241\246\229\235\255\254\249\232\233 \200\241\242\238\247\237\232\234 ";

local sk_lvl = 1    -- Уровень умения
 
for i = 0, 14 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        --SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        --SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 14) then                    -- Колдунья
        -- Тело функции
local sk_add = {}
sk_add[0] = SK_XZY;
sk_add[1] = SK_XLCZ;
sk_add[2] = SK_XLZH;
sk_add[3] = SK_SHPF;
sk_add[4] = SK_JSJC;
sk_add[5] = SK_HFS;
sk_add[6] = SK_FZLZ;
sk_add[7] = SK_FH;
sk_add[8] = SK_SY;
sk_add[9] = SK_SYZY;
sk_add[10] = SK_ZZZH;
sk_add[11] = SK_SYNZ;
sk_add[12] = SK_AYZZ;
sk_add[13] = SK_XZFY;
 
local sk_name = {}
sk_name[0] = "\200\241\246\229\235\229\237\232\229 ";
sk_name[1] = "\207\240\232\231\240\224\247\237\251\233 \211\228\224\240 ";
sk_name[2] = "\207\240\232\231\240\224\247\237\251\233 \206\227\238\237\252 ";
sk_name[3] = "\199\224\234\224\235\234\224 ";
sk_name[4] = "\209\232\235\224 ";
sk_name[5] = "\194\238\241\241\242\224\237\238\226\235\229\237\232\229 ";
sk_name[6] = "\204\238\249\252 \193\243\240\232 ";
sk_name[7] = "\194\238\241\234\240\229\248\229\237\232\229 ";
sk_name[8] = "\193\235\224\227\238\228\224\242\252 \195\238\241\239\238\228\237\255 ";
sk_name[9] = "\200\241\242\232\237\237\238\229 \199\240\229\237\232\229 ";
sk_name[10] = "\207\240\238\234\235\255\242\251\233 \206\227\238\237\252 ";
sk_name[11] = "\193\229\231\228\238\237\237\238\229 \193\238\235\238\242\238 ";
sk_name[12] = "\208\238\241\247\229\240\234 \210\229\237\232 ";
sk_name[13] = "\207\229\247\224\242\252 \209\242\224\240\229\233\248\232\237\251 ";

local sk_lvl = 1    -- Уровень умения
 
for i = 0, 13 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    elseif (job == 16) then                    -- Покоритель Морей
        -- Тело функции
local sk_add = {}
sk_add[0] = SK_JR;
sk_add[1] = SK_LJ;
sk_add[2] = SK_SL;
sk_add[3] = SK_BKZJ;
sk_add[4] = SK_JF;
sk_add[5] = SK_HZCR;
sk_add[6] = SK_BKCJ;
sk_add[7] = SK_SF;
sk_add[8] = SK_XW;
sk_add[9] = SK_LM;
sk_add[10] = SK_MW;

 
local sk_name = {}
sk_name[0] = "\200\241\246\229\235\229\237\232\229 ";
sk_name[1] = "\207\240\232\231\240\224\247\237\251\233 \211\228\224\240 ";
sk_name[2] = "\207\240\232\231\240\224\247\237\251\233 \206\227\238\237\252 ";
sk_name[3] = "\199\224\234\224\235\234\224 ";
sk_name[4] = "\209\232\235\224 ";
sk_name[5] = "\194\238\241\241\242\224\237\238\226\235\229\237\232\229 ";
sk_name[6] = "\204\238\249\252 \193\243\240\232 ";
sk_name[7] = "\194\238\241\234\240\229\248\229\237\232\229 ";


sk_name[8] = "\194\232\245\240\252 ";
sk_name[9] = "\195\240\238\231\238\226\224\255 \199\224\226\229\241\224 ";
sk_name[10] = "\210\243\236\224\237 ";
 
local sk_lvl = 1    -- Уровень умения
 
for i = 0, 10 do
    local form_sklv = GetSkillLv( role , sk_add[i] )
 
    if form_sklv ~= 0 then
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i].."\243\230\229 \232\231\243\247\229\237\238 " )
    else
        AddChaSkill( role, sk_add[i], sk_lvl, 1, 1 )
        SystemNotice( role, "\211\236\229\237\232\229 "..sk_name[i]..""..sk_lvl.." \243\240\238\226\237\255 \232\231\243\247\229\237\238 " )
    end
end
    end
end
	
function Leaveprison ( role )
    AddState( role, role, STATE_BKDB, 10, 3600)
    local br = math.random ( 1, 3)
    if br==1 then
        SetSpawnPos ( role, "Shaitan City")
        MoveCity ( role, "Shaitan City")
    elseif br == 2 then
        SetSpawnPos ( role, "Shaitan City")
        MoveCity ( role, "Shaitan City")
    else
        SetSpawnPos ( role, "Shaitan City")
        MoveCity ( role, "Shaitan City")
    end
    return LUA_TRUE
end
 
function Checkjlktime ( role )
    local jiluka_num = CheckBagItem ( role, 5724)
    if jiluka_num == 1 then
        local jiluka = GetChaItem2 (  role , 2 , 5724 )
        local ENERGY = GetItemAttr(jiluka, ITEMATTR_ENERGY)
        if ENERGY ==0 then
            return LUA_TRUE
        end
    else
        SystemNotice( role, "\206\242\239\240\224\226\235\255\233\242\229\241\252 \234 \205\224\247\224\235\252\237\232\234\243 \242\254\240\252\236\251 (273, 212) \232 \243\231\237\224\233\242\229 \228\224\235\252\237\229\233\248\232\229 \243\234\224\231\224\237\232\255.")
    end
 
end
 
function Givejiluka ( role )
    local r1=0
    local r2=0
    r1,r2 =MakeItem ( role , 5724  , 1 , 4 )
    local Item_new = GetChaItem ( role , 2 , r2 )
    SetItemAttr( Item_new, ITEMATTR_ENERGY, 3600)
    SetItemAttr( Item_new, ITEMATTR_MAXENERGY, 3600)
    return LUA_TRUE
end


--Возвращает количество персонажей, которые в отряде с игроком.
function GetPlayerCountInPartyWithRole(role)

	local count = 0
	
	for i = 0, 4, 1 do
		if ValidCha(GetTeamCha(role , i)) == 1 then
			count = count + 1
		end
	end
	
	return count

end

--Проверяет расы персонажей.
function CheckChaType(player1, player2)

	local TypeFirstPlayer  = GetChaTypeID(player1)
	local TypeSecondPlayer = GetChaTypeID(player2)
	
	--Раса + раса
	if TypeFirstPlayer == TypeSecondPlayer then
		return 0
	end
	
	--Ланс + Карциз или Карциз + Ланс
	if TypeFirstPlayer == 1 and TypeSecondPlayer == 2 or
	   TypeFirstPlayer == 2 and TypeSecondPlayer == 1 then
		return 0
	end
	
	--Филисс + Ами или Ами + Филисс
	if TypeFirstPlayer == 3 and TypeSecondPlayer == 4 or
	   TypeFirstPlayer == 4 and TypeSecondPlayer == 3 then
		return 0
	end
	
	return 1
	
end

--Проверяет свадебные наряды
function CheckWeddingDress(role)

	local ChaType = GetChaTypeID(role)              --Раса персонажа
	local Body  = GetItemID(GetEquipItemP(role, 2)) --Тело
	local Glove = GetItemID(GetEquipItemP(role, 3)) --Перчатки
	local Shoes = GetItemID(GetEquipItemP(role, 4)) --Ботинки
	
	--Ланс
	if ChaType == 1 then
		if Body  ~= 5221 or
		   Glove ~= 5222 or
           Shoes ~= 5223 then
		   
			return 0
		end
		
	--Карциз
	elseif ChaType == 2 then
		if Body  ~= 5238 or
		   Glove ~= 5239 or
           Shoes ~= 5240 then
		   
			return 0
		end
	
	--Филлис
	elseif ChaType == 3 then
		if Body  ~= 5245 or
		   Glove ~= 5246 or
           Shoes ~= 5247 then
		   
			return 0
		end
		
	--Ами
	elseif ChaType == 4 then
		if Body  ~= 5253 or
		   Glove ~= 5254 or
           Shoes ~= 5255 then
		   
			return 0
		end
	
	--Неизвестно :) Вряд ли мы сюда попадем, но все равно вернем 0.
	else
		return 0
	end
	
	return 1
end

--Проверяет поженен персонаж или нет
function CheckIsMarried(role)
	
	local sc = CheckBagItem(role, 2520)
	if sc > 0 then
		return 0
	end
	
	return 1

end

--Выдача Свадебного сертификата
function GiveWeddingCertificate(role)


	
	--В отряде ли персонаж?
	if IsInTeam(role) == 0 then
		SystemNotice(role, "Чтобы получить Свадебный Сертификат молодожены должны быть в группе!")
		return 0
	end

	--Персонаж должен быть в отряде ТОЛЬКО со своей половинкой
	if GetPlayerCountInPartyWithRole(role) > 1 then
		SystemNotice(role, "Пожалуйста, останьтесь наедине в группе со своей половинкой!")
		return 0
	end

	
	local player = {}
	player[1] = role
	player[2] = GetTeamCha(role, 0)

	--Проверим, может из персонажей уже кто-то поженился
	if CheckIsMarried(player[1]) == 1 then
		SystemNotice(player[1], "Вы уже поженены!")
		SystemNotice(player[2], GetChaDefaultName(player[1]).." уже поженился на другом человеке!")
		
		return 0
	end
	
	if CheckIsMarried(player[2]) == 1 then
		SystemNotice(player[1], GetChaDefaultName(player[2]).." уже поженился на другом человеке!")
		SystemNotice(player[2], "Вы уже поженены!")
		
		return 0
	end
	
	--Проверим расы персонажей
	if CheckChaType(player[1], player[2]) == 0 then
		SystemNotice(player[1], GetChaDefaultName(player[2]).." неподоходящая для Вас пара!")
		SystemNotice(player[2], GetChaDefaultName(player[1]).." неподоходящая для Вас пара!")
		
		return 0
	end
	
	--Проверим свадебные наряды у обеих сторон
	if CheckWeddingDress(player[1]) == 0 then
		SystemNotice(player[1], "Наденьте свадебный наряд!")
		SystemNotice(player[2], "Ваша половинка должна надеть свадбеный наряд!")
		
		return 0
	end
	
	if CheckWeddingDress(player[2]) == 0 then
		SystemNotice(player[1], "Ваша половинка должна надеть свадбеный наряд!")
		SystemNotice(player[2], "Наденьте свадебный наряд!")
		
		return 0
	end
	
	--Проверим Кольцо Св. Валентина у обеих сторон
	local RingFirstPlayer = CheckBagItem(player[1], 2521)
	if RingFirstPlayer == 0 then
		SystemNotice(player[1], "У Вас нет Кольца Св. Валентина!")
		SystemNotice(player[2], "У Вашей половинки нет Кольца Св. Валентина!")
		
		return 0
	end
	
	local RingSecondPlayer = CheckBagItem(player[2], 2521)
	if RingSecondPlayer  == 0 then
		SystemNotice(player[1], "У Вашей половинки нет Кольца Св. Валентина!")
		SystemNotice(player[2], "У Вас нет Кольца Св. Валентина!")
		
		return 0
	end
	
	--Проверим наличие 10 000 000
	local MoneyPlayer = GetChaAttr(player[1] , ATTR_GD)
	if MoneyPlayer < WD_GOLD then
		SystemNotice(player[1], "У Вас недостаточно золота! Вам нужно "..WD_GOLD.." золота, чтобы получить Свадебный сертификат!")
		SystemNotice(player[2], "У Вашей половинки недостаточно золота! Требуется "..WD_GOLD.." золота!")
		
		return 0
	end
	
	--Проверим наличие Свадебного Сертификата.
	local CertificatePlayer = CheckBagItem(player[1], 2913)
	if CertificatePlayer == 1 then
		SystemNotice(player[1], "У Вас уже есть Свадебный сертификат! Очередь Вашей половинки!")
		SystemNotice(player[2], "Ваша очередь получать Свадебный сертификат!")
		
		return 0
	end
	
	--Проверим свободную ячейку в инвентаре
	local FreeSlots = GetChaFreeBagGridNum(player[1])
	if FreeSlots < 1 then 
		SystemNotice(player[1], "У вас нет свободных ячеек в инвентаре! Освободите одну.")
		SystemNotice(player[2], "У Вашей половинки нет свободных ячеек в инвентаре!")
		
		return 0
	end
	
	

	
	--1. Заберем деньги
	TakeMoney(player[1], nil, WD_GOLD)
	
	--2. Дадим  Свадебный Сертификат
	GiveItem(player[1], 0, 2913, 1, 1)
	
	--3. Обновим персонажа
	RefreshCha(player[1])
	
	--4. Скажем об этом второй половине
	if CheckBagItem(player[2], 2913) == 0 then
		SystemNotice(player[2], "Ваша половинка получила свадебный сертификат! Теперь Ваша очередь!")
	else
		SystemNotice(player[2], "Ваша половинка получила свадебный сертификат!")
	end

	
	return 1
	
end

--Конец аукциона
function AuctionEnd(role)


	--Проверки


	--Проверка наличия Ставочной карты
	local sc = CheckBagItem(role, 3025)	
	if sc <= 0 then
		SystemNotice(role, "\207\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232\242\229, \247\242\238 \243 \194\224\241 \241 \241\238\225\238\233 \229\241\242\252 \209\242\224\226\238\247\237\224\255 \234\224\240\242\238\247\234\224")
		return 0
	end
	
	--Проверка наличия Разрешительного Церковного Буклета
	local item_number = CheckBagItem(role, 3066)		
	if item_number >= 1 then
		SystemNotice(role, "\211 \194\224\241 \243\230\229 \229\241\242\252 \208\224\231\240\229\248\232\242\229\235\252\237\251\233 \214\229\240\234\238\226\237\251\233 \193\243\234\235\229\242!")
		return 0
	end
	
	--Проверка наличия 2-ух свободных ячеек в инвентаре
	local Item_CanGet = GetChaFreeBagGridNum(role)
	if Item_CanGet < 2 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \226 \232\237\226\229\237\242\224\240\229")
		return 0
	end
	

	
	--1. Выдаем 10 х Гостевой Сундук
	GiveItem (role, 0, 7722, 10, 4)
	--2. Забираем Ставочную карту
	DelBagItem(role, 3025, 1)
	
	--3. Настройка и выдача Разрешительного Церковного Буклета
	local r1 = 0
	local r2 = 0
	r1, r2 = MakeItem(role, 3066, 1, 4)
	local Item_new = GetChaItem(role, 2, r2)
	
	
	local now_month    = os.date("%m")
	local now_day      = os.date("%d")
	local now_hour     = os.date("%H") 
	local now_miniute  = os.date("%M")
	local now_day1     = 0
	local now_month1   = 0
	local now_hour1    = 0
	local now_miniute1 = 0
	    
	now_month   = tonumber(now_month)   
	now_day     = tonumber(now_day)  
	now_hour    = tonumber(now_hour)		
	now_miniute = tonumber(now_miniute)
	
	local CheckDateNum = now_hour * 100 + now_miniute

	--18:00
	if CheckDateNum == 1830 then 
		now_hour1    = 18
		now_miniute1 = 0
		if now_month == 1 or now_month == 3 or now_month == 5 or now_month == 7 or now_month == 8 or now_month == 10 or now_month == 12 then 
			if now_day <= 26 then 
				now_day1   = now_day + 5
				now_month1 = now_month
			elseif now_day > 26 then 
				now_day1   = (now_day + 5) - 31
				now_month1 = now_month + 1
			end 
		end
		if now_month == 4 or now_month == 6 or now_month == 9 or now_month == 11 then 
			if now_day <= 25 then 
				now_day1   = now_day + 5
				now_month1 = now_month
			elseif now_day > 25 then 
				now_day1   = (now_day + 5) - 30
				now_month1 = now_month + 1
			end 
		end
		if now_month == 2 then 
			if now_day <= 23 then 
				now_day1   = now_day + 5
				now_month1 = now_month
			elseif now_day > 23 then 
				now_day1   = (now_day + 5) - 28
				now_month1 = now_month + 1 	
			end 
		end
	--19:10
	elseif CheckDateNum == 1910 then 
		now_hour1    = 20
		now_miniute1 = 10	
		if now_month == 1 or now_month == 3 or now_month == 5 or now_month == 7 or now_month == 8 or now_month == 10 or now_month == 12 then 
			if now_day <= 26 then 
				now_day1   = now_day + 5
				now_month1 = now_month
			elseif now_day > 26 then 
				now_day1   = (now_day + 5) - 31
				now_month1 = now_month + 1
			end 
		end
		if now_month == 4 or now_month == 6 or now_month == 9 or now_month == 11 then 
			if now_day <= 25 then 
				now_day1   = now_day + 5
				now_month1 = now_month
			elseif now_day > 25 then 
				now_day1   = (now_day + 5) - 30
				now_month1 = now_month + 1
			end 
		end
		if now_month == 2 then 
			if now_day <= 23 then 
				now_day1 = now_day + 5
				now_month1 = now_month
			elseif now_day > 23 then 
				now_day1   = (now_day + 5) - 28
				now_month1 = now_month + 1
			end 
		end
	--19:50
	elseif CheckDateNum == 1950 then 
		now_hour1    = 18
		now_miniute1 = 0  
		if now_month == 1 or now_month == 3 or now_month == 5 or now_month == 7 or now_month == 8 or now_month == 10 or now_month == 12 then 
			if now_day <= 25 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 25 then 
				now_day1   = (now_day + 6) - 31
				now_month1 = now_month + 1
			end 
		end
		if now_month == 4 or now_month == 6 or now_month == 9 or now_month == 11 then 
			if now_day <= 24 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 24 then 
				now_day1   = (now_day + 6) - 30
				now_month1 = now_month + 1
			end 
		end
		if now_month == 2 then 
			if now_day <= 22 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 22 then 
				now_day1   = (now_day + 6) - 28
				now_month1 = now_month + 1
			end 
		end
	--20:30
	elseif CheckDateNum == 2030 then 
		 now_hour1    = 20
		 now_miniute1 = 10
		if now_month == 1 or now_month == 3 or now_month == 5 or now_month == 7 or now_month == 8 or now_month == 10 or now_month == 12 then 
			if now_day <= 25 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 25 then 
				now_day1   = (now_day + 6) - 31
				now_month1 = now_month + 1
			end 
		end
		if now_month == 4 or now_month == 6 or now_month == 9 or now_month == 11 then 
			if now_day <= 24 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 24 then 
				now_day1   = (now_day + 6) - 30
				now_month1 = now_month + 1
			end 
		end
		if now_month == 2 then 
			if now_day <= 22 then 
				now_day1   = now_day + 6
				now_month1 = now_month
			elseif now_day > 22 then 
				now_day1   = (now_day + 6) - 28
				now_month1 = now_month + 1
			end 
		end
	end

	SetItemAttr(Item_new, ITEMATTR_VAL_STA, now_month1)	
	SetItemAttr(Item_new, ITEMATTR_VAL_STR, now_day1)
	SetItemAttr(Item_new, ITEMATTR_VAL_CON, now_hour1)
	SetItemAttr(Item_new, ITEMATTR_VAL_DEX, now_miniute1)
	
	SynChaKitbag(role, 13)
end

--Проверка для участия на аукционе
function YORN(role)

	local Item_CanGet = GetChaFreeBagGridNum(role)
	if Item_CanGet < 2 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \226 \232\237\226\229\237\242\224\240\229")
		return  0
	end

	local item_number1 = CheckBagItem(role, 3066)		
	if item_number1 >= 1 then
		SystemNotice(role, "\211 \194\224\241 \243\230\229 \229\241\242\252 \208\224\231\240\229\248\232\242\229\235\252\237\251\233 \214\229\240\234\238\226\237\251\233 \193\243\234\235\229\242!")
		return 0
	end
	
	local item_number2 = CheckBagItem(role, 3078)		
	if item_number2 >= 1 then
		SystemNotice( role ,"\211 \194\224\241 \243\230\229 \229\241\242\252 \207\240\232\227\235\224\241\232\242\229\235\252\237\251\233 \225\232\235\229\242\251!")
		return  0
	end
	
	local item_number3 = CheckBagItem(role, 3025)		
	if item_number3 < 1 then
		SystemNotice( role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232\242\229, \247\242\238 \243 \194\224\241 \241 \241\238\225\238\233 \229\241\242\252 \209\242\224\226\238\247\237\224\255 \234\224\240\242\238\247\234\224")
		return  0
	end
	
	return  1
end

--Получение Гостевого Сундука (Пригласительных билетов)
function ChangeItem(character, npc)
	local Item_CanGet = GetChaFreeBagGridNum(character)
	if Item_CanGet < 1 then
		SystemNotice(character, "Требуется 1 свободная ячейка в инвентаре, чтобы получить Гостевой Сундук")
		return 0
	end
	
	local am1 = CheckBagItem(character, 3066 )			
	if am1 < 1 then
		SystemNotice(character, "У Вас нет Разрешительного Церковного Буклета!")
		return 0
	end
	
	local Money_Need = 50000
	local Money_Have = GetChaAttr(character, ATTR_GD)
	if Money_Need > Money_Have then
		SystemNotice(character, "Недостаточно денег! Нужно "..Money_Need.." монет.")
		return 0
	else
		TakeMoney(character, nil, Money_Need)
	end

	local r1 = 0
	local r2 = 0
	r1, r2 = MakeItem(character, 7722, 10 , 4)
	local Item_el = GetChaItem(character, 2, r2)

	local item_old    = GetChaItem2(character, 2, 3066)
	local old_month   = GetItemAttr(item_old, ITEMATTR_VAL_STA)	
	local old_day     = GetItemAttr(item_old, ITEMATTR_VAL_STR)
	local old_hour    = GetItemAttr(item_old, ITEMATTR_VAL_CON)  
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)
	

	SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month )
	SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day )  
	SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour )
	SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute )

	SynChaKitbag(character, 13)
end

--Запуск фейерверков свидетелей
function LaunchFirework(role, npc)
	PlayEffect(npc, math.random(1, WD_FIREWORK_COUNT))
end

--Свадьба
function Wedding(role)


	--Проверки и инициализация

	
	--В отряде ли персонаж?
	if IsInTeam(role) == 0 then
		SystemNotice(role, "Чтобы начать церемонию бракосочетания, Вы, вместе со своей половинкой, должны быть в группе!")
		return 0
	end

	--Персонаж должен быть в отряде ТОЛЬКО со своей половинкой
	if GetPlayerCountInPartyWithRole(role) > 1 then
		SystemNotice(role, "Пожалуйста, останьтесь наедине в группе со своей половинкой!")
		return 0
	end

	
	local player = {}
	player[1] = role
	player[2] = GetTeamCha(role, 0)

	
	--Проверим расы персонажей
	if CheckChaType(player[1], player[2]) == 0 then
		SystemNotice(player[1], GetChaDefaultName(player[2]).." неподоходящая д???Вас пара!")
		SystemNotice(player[2], GetChaDefaultName(player[1]).." неподоходящая для Вас пара!")
		
		return 0
	end
	
	--Проверим свадебные наряды у обеих сторон
	if CheckWeddingDress(player[1]) == 0 then
		SystemNotice(player[1], "Наденьте свадебный наряд!")
		SystemNotice(player[2], "Ваша половинка должна надеть свадбеный наряд!")
		
		return 0
	end
	
	if CheckWeddingDress(player[2]) == 0 then
		SystemNotice(player[1], "Ваша половинка должна надеть свадбеный наряд!")
		SystemNotice(player[2], "Наденьте свадебный наряд!")
		
		return 0
	end
	
	--Проверим К??????Св. Валентина у обеих сторон
	local RingFirstPlayer = CheckBagItem(player[1], 2521)
	if RingFirstPlayer == 0 then
		SystemNotice(player[1], "У Вас нет Кольца Св. Валентина!")
		SystemNotice(player[2], "У Вашей половинки нет Кольца Св. Валентина!")
		
		return 0
	end
	
	local RingSecondPlayer = CheckBagItem(player[2], 2521)
	if RingSecondPlayer  == 0 then
		SystemNotice(player[1], "У Вашей половинки нет Кольца Св. Валентина!")
		SystemNotice(player[2], "У Вас нет Кольца Св. Валентина!")
		
		return 0
	end
	
	--Проверим наличие Свадебного Сертификата у обеих сторон
	local CertificateFirstPlayer = CheckBagItem(player[1], 2913)
	if CertificateFirstPlayer == 1 then
		SystemNotice(player[1], "У Вас нет Свадебного сертификата!")
		SystemNotice(player[2], "У Вашей половинки нет Свадебного сертификата!")
		
		return 0
	end
	
	local CertificateSecondPlayer = CheckBagItem(player[2], 2913)
	if CertificateSecondPlayer == 1 then
		SystemNotice(player[1], "У Вашей половинки нет Свадебного сертификата!")
		SystemNotice(player[2], "У Вас нет Свадебного сертификата!")
		
		return 0
	end
	
	--Проверим свободную ячейку в инвентаре
	local FreeSlotsFirstPlayer = GetChaFreeBagGridNum(player[1])
	if FreeSlotsFirstPlayer < 1 then 
		SystemNotice(player[1], "У вас нет свободных ячеек в инвентаре! Освободите одну.")
		SystemNotice(player[2], "У Вашей половинки нет свободных ячеек в инвентаре!")
		
		return 0
	end
	
	local FreeSlotsSecondPlayer = GetChaFreeBagGridNum(player[2])
	if FreeSlotsFirstSecondPlayer < 1 then
		SystemNotice(player[1], "У Вашей половинки нет свободных ячеек в инвентаре!")
		SystemNotice(player[2], "У вас нет свободных ячеек в инвентаре! Освободите одну.")
		
		return 0
	end

	

	--Действие

	
	
	--1. Забираем Кольца Дня Св. Валентина
	TakeItem(player[1], 0, 2521, 1)
	TakeItem(player[2], 0, 2521, 1)
	
	--2. Забираем Свадебные сертификаты
	TakeItem(player[1], 0, 2913, 1)
	TakeItem(player[2], 0, 2913, 1)
	
	--3. Проиграем эффект сердечек на поженившихся персонажах
	PlayEffect(player[1], 370)
	PlayEffect(player[2], 370)
	
	--4. Учим скилл "Узы любви"
	AddChaSkill(player[1], SK_QLZX, 1, 1, 0)
	AddChaSkill(player[2], SK_QLZX, 1, 1, 0)
	
	--5. Выдаем и настраиваем кольца
	GiveItem(player[1], 0, 2520, 1, 4)
	GiveItem(player[2], 0, 2520, 1, 4)
	
	local FirstPlayerID  = GetRoleID(player[1]) 
	local SecondPlayerID = GetRoleID(player[2])
	
	local FirstPlayerRing  = GetChaItem2(player[1], 2, 2520)
	local SecondPlayerRing = GetChaItem2(player[2], 2, 2520)
	
	SetItemForgeParam(FirstPlayerRing, 1, SecondPlayerID) 
	SetItemForgeParam(SecondPlayerRing, 1, FirstPlayerID)
	
	--6. Выводим глобальное сообщение о свадьбе.
	local msg = "Поздравляем "..GetChaDefaultName(player[1]).. " и "..GetChaDefaultName(player[2]).." со сва?????? Желаем им самог??лучшего и т.п."
	Notice(msg)
	
	
	
	return 1
	
end


function Addons_gold(ignore, role, freq, time)
	local overflow = GetChaAttr( role , ATTR_GD )
	if overflow > 1800000000 then
		TakeMoney(role, 0, 1800000000)
		GiveItemX(role, 0, 7742, 18, 4)
		BickerNotice(role, "\209\232\241\242\229\236\224 \234\238\237\226\229\240\242\232\240\238\226\224\235\224 \226\224\248\229 \231\238\235\238\242\238 \226 \234\243\239\254\240\251 ")
	end	

end
	
function UnfuseNpc(role)
local Apparel = GetChaItem(role,2,3)
local ApparelID = GetItemID(Apparel)
local MainApparelID = ApparelID
if Apparel == nil then
HelpInfo(role,0,"\194\251 \228\238\235\230\237\251 \239\238\235\238\230\232\242\252 \226\229\249\252 \226 4 \241\235\238\242 \232\237\226\229\237\242\224\240\255. ")
return
end

if MainApparelID > 5000 then
MainApparelID = GetItemAttr(Apparel,ITEMATTR_VAL_FUSIONID)
else
HelpInfo(role,0,"\194 \226\224\248\229\233 \224\239\239\224\240\229\235\232 \238\242\241\243\242\241\242\226\243\229\242 \226\229\249\252! ")
return
end

local ApparelFusedID = GetItemAttr(Apparel,ITEMATTR_VAL_FUSIONID)
if ApparelFusedID == 0 then
HelpInfo(role,0,"\194 \226\224\248\229\233 \224\239\239\224\240\229\235\232 \238\242\241\243\242\241\242\226\243\229\242 \226\229\249\252! ")
return
end

local EquipGems = GetItemForgeParam(Apparel,1)
local r1 = 0
local r2 = 0
r1,r2 = MakeItem(role,MainApparelID,1,18)
GiveItem(role,0,ApparelID,1,1)
local Remove = 0
Remove = RemoveChaItem(role,MainApparelID,2,2,3,2,1)
if Remove == 0 then
HelpInfo(role,0,"\206\248\232\225\234\224 \243\228\224\235\229\237\232\255 \239\240\229\228\236\229\242\224! ")
return
end

local NewEquip = GetChaItem(role,2,r2)
local ParanTransfered = SetItemForgeParam(NewEquip,1,EquipGems)
if ParanTransfered == 0 then
HelpInfo(role,0,"\205\229 \243\228\224\235\238\241\252 \239\229\240\229\237\229\241\242\232 \245\224\240\224\234\242\229\240\232\241\242\232\234\232! ")
return
else
HelpInfo(role,0,"\194\229\249\252 \243\241\239\229\248\237\238 \226\251\242\224\249\229\237\224 \232\231 \224\239\239\224\240\229\235\232! ")
RefreshCha(role)
end
end	
	
	
function HandleChat( role, message )
	local r = 1
	if (message == "/test") then
		local Check_MF = GetChaAttr(role, ATTR_BMF)
		PopupNotice( role, "Шанс дропа - "..Check_MF)
		return 0
	end
	return r
end

-- Функция авторизации в игре
function AfterPlayerLogin(role)

 -- Отправляем клиенту время
 local packet = GetPacket()
 WriteCmd( packet, 615 )
 WriteDword( packet, os.time(os.date('*t')))
 SendPacket(role, packet) 

end

-- Кикнуть игрока --
function KickCha(role)
	local pkt = GetPacket()
	WriteCmd(pkt,1505)
	SendPacket(role,pkt)
end

-- Разговор
function ChaSay(role,target,text)
	local pkt = GetPacket()
	local tid = GetCharID( target )
	WriteCmd( pkt, 501 );
	WriteDword( pkt, tid );
	WriteString( pkt, text);
	SendPacket( role, pkt );
end

------ Контракты ------
function GetKontrakt(role, kontrakt_num, mob_id, kill_count)

	local m1,m2 = MakeItem ( role , 5803  , 1 , 65 )
	local Itemfinal = GetChaItem ( role , 2 , m2 )
	-- Назначаем контракту значения --
	-- ID монстра, которого нужно убить
	SetItemAttr(Itemfinal, ITEMATTR_VAL_STR , mob_id)
	-- Кол-во, которое нужно убить
	SetItemAttr(Itemfinal, ITEMATTR_VAL_AGI , kill_count)
	-- Номер контракта
	SetItemAttr(Itemfinal, ITEMATTR_VAL_CON , kontrakt_num)
	--Нужно для дебага, если будут еще ошибки.
	SystemNotice(role, GetItemID(Itemfinal)..":"..mob_id..":"..kill_count..":"..kontrakt_num)

	SynChaKitbag(role, 13)

end

--Удаляет 1 контракт
function DeleteKontrakt(role)
	DelBagItem(role, 5803, 1)
end

function npc_job (role)

	Talk(1, "Профессор: Вы хотите стать Мечником?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(1, "Мечник", MultiTrigger, GetMultiTrigger(), 1)

	Talk(2, "Профессор: Вы хотите стать Чемпионом?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 8)
	TriggerFailure(1, JumpPage, 11)
	Text(2, "Чемпион", MultiTrigger, GetMultiTrigger(), 1)

	Talk(3, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Мечник", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 2)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Стрелок", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	--Text(4, "Swordsman", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 2)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Стрелок", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "Целитель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "Мореплаватель", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "Целитель", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 9)
	TriggerFailure(1, JumpPage, 11)
	Text(6, "Воитель ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 12)
	TriggerFailure(1, JumpPage, 11)
	Text(7, "Стрелок ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 16)
	TriggerFailure(1, JumpPage, 11)
	Text(8, "Покоритель морей ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(9, "Профессор: Кем вы хотите стать?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 13)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "Клерик ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 14)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "Колдунья ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(10, "Профессор: у вас должен быть уровень "..JobCh.Level.First.." и "..JobCh.Money.First.." золота, чтобы получить первую профессию! ")
	Text(10, "Уйти ", CloseTalk)

	Talk(11, "Профессор: у вас должен быть уровень "..JobCh.Level.Second.." и "..JobCh.Money.Second.." золота, чтобы получить вторую профессию! ")
	Text(11, "Уйти ", CloseTalk)

	Talk(12, "Профессор: О чем вы беспокоитесь? У вас уже есть профессия! ")
	Text(12, "Уйти ", CloseTalk)

	InitTrigger()
	-- Carsise Swordman
	TriggerCondition(1, PfEqual, 0)
	TriggerCondition(1, IsCategory, 2)
	TriggerAction(1, JumpPage, 1)
	-- Carsise Champion
	TriggerCondition(2, PfEqual, 1)
	TriggerCondition(2, IsCategory, 2)
	TriggerAction(2, JumpPage, 2)
	-- Lance: Swordsman/Hunter/Explorer
	TriggerCondition(3, PfEqual, 0)
	TriggerCondition(3, IsCategory, 1)
	TriggerAction(3, JumpPage, 3)
	-- Phyllis: Swordsman/Hunter/Exporer/Herbalist
	TriggerCondition(4, PfEqual, 0)
	TriggerCondition(4, IsCategory, 3)
	TriggerAction(4, JumpPage, 4)
	-- Ami: Explorer/Herbalist
	TriggerCondition(5, PfEqual, 0)
	TriggerCondition(5, IsCategory, 4)
	TriggerAction(5, JumpPage, 5)
	-- Lance/Phyllis: Crusader
	TriggerCondition(6, PfEqual, 1)
	TriggerAction(6, JumpPage, 6)
	-- Lance/Phyllis: Sharpshooter
	TriggerCondition(7, PfEqual, 2)
	TriggerAction(7, JumpPage, 7)
	-- Lance/Phyllis/Ami: Voyager
	TriggerCondition(8, PfEqual, 4)
	TriggerAction(8, JumpPage, 8)
	-- Phyllis/Ami: Cleric/Seal Master
	TriggerCondition(9, PfEqual, 5)
	TriggerAction(9, JumpPage, 9)
	TriggerAction(10, JumpPage, 12)
	Start(GetMultiTrigger(), 10)

end

-- Обмен расписок +7 на самоцветы
function Exchange_7(role, GemLevel, Items, Prize)
	local data
	Combine = {}
	Combine[3] = {3,4}
	Combine[4] = {4,8}
	Combine[5] = {5,16}
	Combine[6] = {6,32}
	Combine[7] = {7,64}
	-- Для всего массива
	for data in Combine do
		-- Если уровень из функции равен уровню в массиве и вещей для комбайна хватает..
		if (GemLevel == Combine[data][1]) then
			local NewLevelGem = 100 + Combine[data][1] 
			if (HasItem( role, 7483, Combine[data][2] ) == 1 ) then
				TakeItem( role, 0, 7483, Combine[data][2] )    
				GiveItem( role, 0, Prize, 1, NewLevelGem)
			else
				HelpInfo(role, 0, "Для обмена ["..GetItemName(Prize).."] -["..data.."ур.]_Необходимо:_"..GetItemName(Items).." - "..Combine[data][2].."шт.")
			end
		end
	end
	
end

-- Проверка на день недели --
function CheckDay(role, day)
	-- Берем сегодняшний день недели
	local Now_Day = GetNowWeek()
	if Now_Day == day then
		return 1
	else
		return 0
	end
end

function exchange_sue_fast(role, count)
	if (count == 10) then
		TakeItem( role, 0, 7482, count )
		GiveItem( role, 0, math.random(7477, 7481), count, 31)
	elseif (count == 50) then
		TakeItem( role, 0, 7482, count )
		GiveItem( role, 0, math.random(7477, 7481), count, 31)
	elseif (count == 100) then
		TakeItem( role, 0, 7482, count )
		GiveItem( role, 0, math.random(7477, 7481), count, 31)
	end 
end