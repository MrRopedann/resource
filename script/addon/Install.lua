print( "------------------------------------" )
print( "------- Loading Install.lua --------" )

--Фикс характеристик
dofile(GetResPath("script/addon/ModuleStatev/ModuleStatev.lua"))
--Крылья с характеристиками
dofile(GetResPath("script/addon/WingEnchant/WingEnchant.lua"))
--VIP система
dofile(GetResPath("script/addon/VIPSystem/init.lua"))
--Ежедневные призы
dofile(GetResPath("script/addon/daily/daily.lua"))
--Скрипт Одинокой башни
dofile(GetResPath("script/addon/Lonetower/lonetower.lua"))
--Призы за ТОП 1-3
dofile(GetResPath("script/addon/RankingPrize/RankingPrize.lua"))
--Функции на проверку форжа в скриптах
dofile(GetResPath("script/addon/CheckForge/CheckForge.lua"))
--Банк гильдий через BuyPage у НПС
dofile(GetResPath("script/addon/GuildSystem/GuildBank.lua"))
--Система ресетов
dofile(GetResPath("script/addon/ResetSystem/rebornNPC.lua"))
--НПС Призыв мобов за лут
dofile(GetResPath("script/addon/SummonNPC/SummonNPC.lua"))
--Система улучшений через катализатор
dofile(GetResPath("script/addon/UpgradeSystem/UpgradeSystem.lua"))
--Плащ
dofile(GetResPath("script/addon/Cloak/CloakScript.lua"))
--Анти-бот
dofile(GetResPath("script/addon/AntiBot/anti_bot.lua"))

print( "------------------------------------" )