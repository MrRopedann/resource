function Item_Stoneeffect ( Stone_Type1 , Stone_Type2 , Stone_Type3 )
	if Stone_Type1 == Stone_Type2 then
		Stone_Type1 = -1
	end

	if Stone_Type1 == Stone_Type3 then
		Stone_Type1 = -1
	end
	
	if Stone_Type2 == Stone_Type3 then
		Stone_Type2 = -1
	end
	
	local jia = Stone_Type1 + Stone_Type2 + Stone_Type3
	local cheng = Stone_Type1 * Stone_Type2 * Stone_Type3
	if cheng > 0 then
		if jia == -1 then
			return 1
		elseif jia == 0 then
			return 2
		elseif jia == 1 then
			return 3
		elseif jia == 2 then
			return 4
		elseif jia == 6 then
			return 11
		elseif jia == 7 then
			return 12
		elseif jia == 8 then
			return 13
		elseif jia == 9 then
			return 14
		end
	elseif cheng < 0 then
		if jia == 2 then
			return 5
		elseif jia == 3 then
			return 6
		elseif jia == 4 then
			if cheng == -4 then
				return 7
			elseif cheng == -6 then
				return 8
			end
		elseif jia == 5 then
			return 9
		elseif jia == 6 then 
			return 10
		end
	end
	return 0
end


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


function Get_HoleNum ( Num )
	local a = GetNum_Part1 ( Num )
	return a
end

function Get_Stone_1 ( Num )
	local Stone_1 = 0
	Stone_1 = GetNum_Part2 ( Num )
	return Stone_1
end

function Get_StoneLv_1 ( Num )
	local Stone_1 = 0
	Stone_1 = GetNum_Part3 ( Num )
	return Stone_1
end

function Get_Stone_2 ( Num )
	local Stone_2 = 0
	Stone_2 = GetNum_Part4 ( Num )
	return Stone_2
end

function Get_StoneLv_2 ( Num )
	local Stone_2 = 0
	Stone_2 = GetNum_Part5 ( Num )
	return Stone_2
end

function Get_Stone_3 ( Num )
	local Stone_3 = 0
	Stone_3 = GetNum_Part6 ( Num )
	return Stone_3
end

function Get_StoneLv_3 ( Num )
	local Stone_3 = 0
	Stone_3 = GetNum_Part7 ( Num )
	return Stone_3
end


--Огненный самоцвет
function ItemHint_LieYanS ( Lv )
	local eff = Lv * 4
	local Hint = "\209\224\236\238\246\226\229\242: \192\242\224\234\224 +"..eff
	return Hint
end
--Самоцвет Ярости
function ItemHint_ZhiYanS ( Lv )
	local eff = Lv * 6
	local Hint = "\209\224\236\238\246\226\229\242: \192\242\224\234\224 +"..eff
	return Hint
end
--Взрывной самоцвет
function ItemHint_HuoYaoS ( Lv )
	local eff = Lv * 10
	local Hint = "\209\224\236\238\246\226\229\242: \192\242\224\234\224 +"..eff
	return Hint
end
--Люстриновый самоцвет
function ItemHint_MaNaoS ( Lv )
	local eff = Lv * 5
	local Hint = "\209\224\236\238\246\226\229\242: \216\224\237\241 \243\240\238\237\224 +"..eff
	return Hint
end
--Сияющий самоцвет
function ItemHint_HanYu ( Lv )
	local eff = Lv * 5
	local Hint = "\209\224\236\238\246\226\229\242: \199\224\249\232\242\224 +"..eff
	return Hint
end
--Блестящий самоцвет
function ItemHint_YueZhiX ( Lv )
	local eff = Lv * 100
	local Hint = "\209\224\236\238\246\226\229\242: \198\232\231\237\252 +"..eff
	return Hint
end
--Теневой самоцвет
function ItemHint_ShuiLingS ( Lv )
	local eff = Lv * 2
	local Hint = "\209\224\236\238\246\226\229\242: \211\234\235\238\237\229\237\232\229 +"..eff
	return Hint
end
--Самоцвет Духа
function ItemHint_ShengGuangS ( Lv )
	local eff = Lv * 1
	local Hint = "\209\224\236\238\246\226\229\242: \196\243\245 +"..eff
	return Hint
end
--Самоцвет Ветра
function ItemHint_FengLingS ( Lv )
	local eff = Lv * 5
	local Hint = "\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff
	return Hint
end
--Самоцвет удара
function ItemHint_YingYanS ( Lv )
	local eff = Lv * 5
	local Hint = "\193\238\237\243\241 \242\238\247\237\238\241\242\232 + "..eff
	return Hint
end
--Самоцвет колосса
function ItemHint_YanVitS ( Lv )
	local eff = Lv * 5
	local Hint = "\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff
	return Hint
end
--Самоцвет Ярости
function ItemHint_YanStrS ( Lv )
	local eff = Lv * 5
	local Hint = "\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff
	return Hint
end
--Глаз черного дракона
function ItemHint_LongZhiTong ( Lv )
	local eff = Lv * 50
	local Hint = "\209\224\236\238\246\226\229\242: \192\242\224\234\224 +"..eff
	return Hint
end
--Душа Черного дракона
function ItemHint_LongZhiHun ( Lv )
	local eff = Lv * 3
	local Hint = "\209\224\236\238\246\226\229\242: \209\238\239\240\238\242\232\226\235\229\237\232\229 +"..eff
	return Hint
end
--Сердце черного дракона
function ItemHint_LongZhiXin ( Lv )
	local eff = Lv * 500
	local Hint = "\209\224\236\238\246\226\229\242: \198\232\231\237\252 +"..eff
	return Hint
end
--Самоцвет души
function ItemHint_GaNaZhiShen ( Lv )
	local eff =  Lv *5
	local Hint = "\209\224\236\238\246\226\229\242: \196\243\245 +"..eff
	return Hint
end
--Желтый нефрит
function ItemHint_HuangYu ( Lv )
	local eff =  Lv *10
	local Hint = "\209\224\236\238\246\226\229\242: \199\224\249\232\242\224 +"..eff
	return Hint
end
--Красный нефрит
function ItemHint_ChiYu ( Lv )
	local eff =  Lv *200
	local Hint = "\209\224\236\238\246\226\229\242: \198\232\231\237\252 +"..eff
	return Hint
end
--Зеленый нефрит
function ItemHint_QingYu ( Lv )
	local eff =  Lv *200
	local Hint = "\193\238\237\243\241 \204\224\234\241 \204\205 +"..eff
	return Hint
end
--Аура Чиатана
function ItemHint_XTLingGuang ( Lv )
	local eff =  Lv *10
	local Hint = "\193\238\237\243\241 \216\224\237\241 \202\240\232\242 +"..eff
	return Hint
end
--Удар Лока
function ItemHint_LKBiZhong ( Lv )
	local eff =  Lv *10
	local Hint = "\209\224\236\238\246\226\229\242: \216\224\237\241 \243\240\238\237\224 +"..eff
	return Hint
end
--Уклонение Бинга
function ItemHint_BBDuoShan ( Lv )
	local eff =  Lv *10
	local Hint = "\209\224\236\238\246\226\229\242: \211\234\235\238\237\229\237\232\229 +"..eff
	return Hint
end
--Защита Фенга
function ItemHint_FFDiYu ( Lv )
	local eff =  Lv *15
	local Hint = "\209\224\236\238\246\226\229\242: \199\224\249\232\242\224 +"..eff
	return Hint
end
--Усиление Акулы
function ItemHint_XKQiangHua ( Lv )
	local eff =  Lv *300
	local Hint = "\209\224\236\238\246\226\229\242: \198\232\231\237\252 +"..eff
	return Hint
end
--Сияние Азраила
function ItemHint_SShuiyao ( Lv )
	local eff =  Lv *8
	local Hint = "\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff
	return Hint
end
--Неупокоенный Азраил
function ItemHint_SSbusi ( Lv )
	local eff =  Lv *8
	local Hint = "\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff
	return Hint
end
--Свет Азраила
function ItemHint_SSguangmang ( Lv )
	local eff =  Lv *8
	local Hint = "\209\224\236\238\246\226\229\242: \196\243\245 +"..eff
	return Hint
end
--Соединение Азраила
function ItemHint_SSningju ( Lv )
	local eff =  Lv *8
	local Hint = "\209\224\236\238\246\226\229\242: \210\238\247\237\238\241\242\252 +"..eff
	return Hint
end
--Танец Азраила
function ItemHint_SSxuanwu ( Lv )
	local eff =  Lv *8
	local Hint = "\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff
	return Hint
end


function ItemHint_ABOLUO ( Lv )
	local Hint = "їЙТФЅвїЄЦжЛ№µДєЪП»"
	return Hint
end

function ItemHint_QIUBITE ( Lv )
	local Hint = "їЙТФЅвїЄЦжЛ№µДєЪП»"
	return Hint
end

function ItemHint_YADIANNA ( Lv )
	local Hint = "їЙТФЅвїЄЦжЛ№µДєЪП»"
	return Hint
end

function GetElfSkill ( Num )



end


function GetElfSkill ( Num )
	--local Part1 = GetNum_Part1 ( Num )
	local Part2 = GetNum_Part2 ( Num )
	local Part3 = GetNum_Part3 ( Num )
	local Part4 = GetNum_Part4 ( Num )
	local Part5 = GetNum_Part5 ( Num )
	local Part6 = GetNum_Part6 ( Num )
	local Part7 = GetNum_Part7 ( Num )

	return Part3 , Part2 , Part5 , Part4 , Part7 , Part6 

end
--Сломанный Самоцвет Ветра
function ItemHint_HLS( Lv )	
	local eff = Lv * 2	
	local Hint ="\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff	
	return Hint	
end
--Треснутый Самоцвет Ветра
function ItemHint_HYS( Lv )	
	local eff = Lv * 3	
	local Hint ="\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff	
	return Hint	
end
--Неограненный Самоцвет Ветра
function ItemHint_HJS( Lv )	
	local eff = Lv * 4	
	local Hint ="\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff	
	return Hint	
end
--Сломанный Самоцвет Удара
function ItemHint_BLS( Lv )	
	local eff = Lv * 2	
	local Hint ="\196\238\239. \242\238\247\237\238\241\242\252 +"..eff	
	return Hint	
end
--Треснутый Самоцвет Удара
function ItemHint_BYS( Lv )	
	local eff = Lv * 3	
	local Hint ="\196\238\239. \242\238\247\237\238\241\242\252 +"..eff	
	return Hint	
end
--Неограненный Самоцвет Удара
function ItemHint_BJS( Lv )	
	local eff = Lv * 4	
	local Hint ="\196\238\239. \242\238\247\237\238\241\242\252 +"..eff	
	return Hint	
end
--Сломанный Самоцвет Колосса
function ItemHint_CLS( Lv )	
	local eff = Lv * 2	
	local Hint ="\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff	
	return Hint	
end
--Треснутый Самоцвет Колосса
function ItemHint_CYS( Lv )	
	local eff = Lv * 3	
	local Hint ="\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff	
	return Hint	
end
--Неограненный Самоцвет Колосса
function ItemHint_CJS( Lv )	
	local eff = Lv * 4	
	local Hint ="\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff	
	return Hint	
end
--Сломанный Самоцвет Ярости
function ItemHint_ZLS( Lv )	
	local eff = Lv * 2	
	local Hint ="\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff	
	return Hint	
end
--Треснутый Самоцвет Ярости
function ItemHint_ZYS( Lv )	
	local eff = Lv * 3	
	local Hint ="\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff	
	return Hint	
end
--Неограненный Самоцвет Ярости
function ItemHint_ZJS( Lv )	
	local eff = Lv * 4	
	local Hint ="\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff	
	return Hint	
end
--Сломанный Самоцвет Души
function ItemHint_QLS( Lv )	
	local eff = Lv * 2	
	local Hint ="\209\224\236\238\246\226\229\242: \196\243\245 +"..eff	
	return Hint	
end
--Треснутый Самоцвет Души
function ItemHint_QYS( Lv )	
	local eff = Lv * 3	
	local Hint ="\209\224\236\238\246\226\229\242: \196\243\245 +"..eff	
	return Hint	
end
--Неограненный Самоцвет Души
function ItemHint_QJS( Lv )	
	local eff = Lv * 4	
	local Hint ="\209\224\236\238\246\226\229\242: \196\243\245 +"..eff	
	return Hint	
end
--Великий Самоцвет Ярости
function ItemHint_GGR ( Lv )
	local eff = Lv * 14	
	local Hint ="\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff	
	return Hint	
end 
--Великий Самоцвет Души
function ItemHint_GGS ( Lv )
	local eff = Lv * 14	
	local Hint ="\209\224\236\238\246\226\229\242: \196\243\245 +"..eff	
	return Hint	
end 
--Великий Самоцвет Удара
function ItemHint_GGOS ( Lv )
	local eff = Lv * 14	
	local Hint ="\196\238\239. \242\238\247\237\238\241\242\252 +"..eff	
	return Hint	
end 
--Великий Самоцвет Колосса
function ItemHint_GGC ( Lv )
	local eff = Lv * 14	
	local Hint ="\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff	
	return Hint	
end 
--Великий Самоцвет Ветра
function ItemHint_GGW ( Lv )
	local eff = Lv * 14	
	local Hint ="\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff	
	return Hint	
end 

----

--Великий Самоцвет Ярости
function ItemHint_TTGGR ( Lv )
	local eff = Lv * 20	
	local Hint ="\209\224\236\238\246\226\229\242: \209\232\235\224 +"..eff	
	return Hint	
end 
--Великий Самоцвет Души
function ItemHint_TTGGS ( Lv )
	local eff = Lv * 20	
	local Hint ="\209\224\236\238\246\226\229\242: \196\243\245 +"..eff	
	return Hint	
end 
--Великий Самоцвет Удара
function ItemHint_TTGGOS ( Lv )
	local eff = Lv * 20	
	local Hint ="\196\238\239. \242\238\247\237\238\241\242\252 +"..eff	
	return Hint	
end 
--Великий Самоцвет Колосса
function ItemHint_TTGGC ( Lv )
	local eff = Lv * 20	
	local Hint ="\209\224\236\238\246\226\229\242: \210\229\235\238\241\235\238\230\229\237\232\229 +"..eff	
	return Hint	
end 
--Великий Самоцвет Ветра
function ItemHint_TTGGW ( Lv )
	local eff = Lv * 20	
	local Hint ="\209\224\236\238\246\226\229\242: \203\238\226\234\238\241\242\252 +"..eff	
	return Hint	
end 