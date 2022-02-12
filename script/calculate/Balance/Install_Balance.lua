--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "------------------------------------" )
print( "--- Loading Install__Balance.lua ---" )
------------------------------
-- Загрузка Баланса классов --
------------------------------
--Новичок
dofile(GetResPath("script/calculate/Balance/Newbie.lua"))
--Мечник
dofile(GetResPath("script/calculate/Balance/Swordsman.lua"))
--Охотник
dofile(GetResPath("script/calculate/Balance/Hunter.lua"))
--Мореплаватель
dofile(GetResPath("script/calculate/Balance/Explorer.lua"))
--Знахарка
dofile(GetResPath("script/calculate/Balance/Herbalist.lua"))
--Чемпион
dofile(GetResPath("script/calculate/Balance/Champion.lua"))
--Воитель
dofile(GetResPath("script/calculate/Balance/Crusader.lua"))
--Стрелок
dofile(GetResPath("script/calculate/Balance/Sharpshooter.lua"))
--Целительница
dofile(GetResPath("script/calculate/Balance/Cleric.lua"))
--Колдунья
dofile(GetResPath("script/calculate/Balance/Seal_Master.lua"))
--Вой
dofile(GetResPath("script/calculate/Balance/Voyager.lua"))

print( "------------------------------------" )