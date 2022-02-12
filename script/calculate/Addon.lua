------------------------------------
-- Файл: TempBagEquip.lua
-- Автор: V3ct0r form PkoDEV.NET
-- Версия 1.0 (19.07.2018)
------------------------------------
-- Как установить:
-- 1) Поместить данный файл в папку GameServer\Resource\sctipt\calculate;
-- 2) Открыть файл GameServer\Resource\sctipt\calculate\SkillEffect.lua и добавить в его начало строку:
---- dofile(GetResPath("script\\calculate\\TempBagEquip.lua"))
-- 3) Настроить этот файл (установить ID предметов из ItemInfo.txt и ID для эффектов из skilleff.txt);
-- 4) Добавить эффекты в файл skilleff.txt:
---- 200	Left Bracelet	-1	0	PIO_Equip_LeftBracelet_Add	PIO_Equip_LeftBracelet_Rem	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	-1	0	0	0	0	-1	0	0	0	0	0	0	0
---- 201	Right Bracelet	-1	0	PIO_Equip_RightBracelet_Add	PIO_Equip_RightBracelet_Rem	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	-1	0	0	0	0	-1	0	0	0	0	0	0	0
---- 202	Belt	-1	0	PIO_Equip_Belt_Add	PIO_Equip_Belt_Rem	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	-1	0	0	0	0	-1	0	0	0	0	0	0	0
---- 203	Handguard	-1	0	PIO_Equip_Handguard_Add	PIO_Equip_Handguard_Rem	1	0	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	-1	0	0	0	0	-1	0	0	0	0	0	0	0
-- 5) Добавить предметы в файл ItemInfo.txt
---- 7294	Lv65 Champion Belt	z10101	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	8,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	30	0	0	0	0	50	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 1st slot!
---- 7295	Lv65 Champion Bracelet	z10213	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	8,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	55,55	55,55	25,25	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7296	Lv65 Champion Handguard	z10207	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	8,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3,3	3,3	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!
---- 7297	Lv65 Crusader Belt	z10102	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	9,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	30	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 1st slot!
---- 7298	Lv65 Crusader Bracelet	z10214	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	9,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	35,35	35,35	0,0	0,0	0,0	5,5	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7299	Lv65 Crusader Handguard	z10208	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	9,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!
---- 7300	Lv65 Cleric Belt	z10103	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	13,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	50	0	0	0	0	0	0	30	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 1st slot!
---- 7301	Lv65 Cleric Bracelet	z10215	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	13,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	20,20	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	1,1	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7302	Lv65 Cleric Handguard	z10209	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	13,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!
---- 7303	Lv65 Seal Master Belt	z10104	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	14,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	50	0	0	0	0	0	0	0	30	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 1st slot!
---- 7304	Lv65 Seal Master Bracelet	z10216	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	14,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	20,20	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	1,1	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7305	Lv65 Seal Master Handguard	z10210	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	14,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!
---- 7306	Lv65 Voyager Belt	z10105	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	16,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	50	0	0	0	0	0	0	0	20	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7307	Lv65 Voyager Bracelet	z10217	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	16,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	25,25	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	1,1	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7308	Lv65 Voyager Handguard	z10211	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	16,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!
---- 7309	Lv65 Sharpshooter Belt	z10106	10130005	0	0	0	0	0	0	82	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	12,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	30	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 1st slot!
---- 7310	Lv65 Sharpshooter Bracelet	z10218	10130005	0	0	0	0	0	0	81	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	12,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	35,35	35,35	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	1,1	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 2nd or 3rd slot!
---- 7311	Lv65 Sharpshooter Handguard	z10212	10130005	0	0	0	0	0	0	83	0	0	0	0	0	1	1	1	1	1	1	15471	-1,-2,-2,-2	65	12,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	3,3	3,3	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,1000	10000,10000	0	0	0	0	0	0	0	0	0	PIO_Equip_Gear	0	0,0,0,0,0,0,0,0	0,0,0,0,0,0,0,0	0,0	0,0	0,0	Double click to equip on temporary bag. Effective only when placed on 4th slot!

print("Loading TempBagEquip.lua")

-- New equip types
local tyBracelet = 81
local tyBelt = 82
local tyHandguard = 83
	
-- New equip cells
local ceBraceletLeft  = 0
local ceBraceletRight  = 1
local ceBelt = 2
local ceHandguard = 3
	
-- Slot requirements 
local slot_req = {
	[tyBracelet]  = {ceBraceletLeft, ceBraceletRight},
	[tyBelt]  = {ceBelt},
	[tyHandguard] = {ceHandguard},
}
	
-- Job requirements
local job_req = {
	[8]  = {7294, 7295, 7296}, -- Champion
	[9]  = {7297, 7298, 7299}, -- Crusader
	[12] = {7309, 7310, 7311}, -- Sharpshooter
	[13] = {7300, 7301, 7302}, -- Cleric
	[14] = {7303, 7304, 7305}, -- Seal Master
	[16] = {7306, 7307, 7308}, -- Voyager
}

-- IDs for states (any unused IDs from skilleff.txt)
local stBraceletLeft = 208
local stBraceletRight = 209
local stBelt = 210
local stHandguard = 211


-- Prevent data reloading
if (TBE_NO_RELOAD == nil) then
	-- Item attr table
	item_attr = {}
	-- Characters table
	role_equip = {}
end
TBE_NO_RELOAD = true


-- Temp bag equip function
function PIO_Equip_Gear(role, Item)

	-- Help function to check if table has a value
	local function Contains(arr, val)
		for i = 1, table.getn(arr) do
			if (arr[i] == val) then 
				return true
			end
		end
		return false
	end
	
	-- Help function to check how many items in the temp bag
	local function CheckTempBagItem(role, id)
		local n = 0
		for i = 0, 15, 1 do
			local Cell = GetChaItem(role, 3, i)
			if (Cell ~= nil and GetItemID(Cell) == id) then
				n = n + 1
			end
		end
		return n	
	end
	
	-- Help function to get last free cell
	local function GetLastFreeCell(role)
		for i = 0, 15, 1 do
			local Cell = GetChaItem(role, 3, i)
			if (Cell == nil) then
				return i
			end
		end
		return -1	
	end
	
	-- The item ID and type
	local item_id = GetItemID(Item)
	local item_type = GetItemType(Item)
	
	-- Check that player is not in a boat
	if (ChaIsBoat(role) == 1) then
		BickerNotice(role, string.format("%s \237\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \226\238 \226\240\229\236\255 \239\235\224\226\224\237\232\255!", GetItemName(item_id)))
		--BickerNotice(role, string.format("%s не может быть использовано во время плавания!", GetItemName(item_id)))
		UseItemFailed(role)
		return
	end
	
	-- Check if temp bag has free slot
	local tmp_last_free_slot = GetLastFreeCell(role)
	if (tmp_last_free_slot == -1) then
		BickerNotice(role, string.format("\211 \226\224\241 \228\238\235\230\237\224 \225\251\242\252 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226\238 \226\240\229\236\229\237\237\238\233 \241\243\236\234\229 \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 %s!", GetItemName(item_id)))
		--BickerNotice(role, string.format("У вас должна быть 1 свободная ячейка во временной сумке чтобы использовать %s!", GetItemName(item_id)))
		UseItemFailed(role)
		return
	end
	
	-- Check job requirements
	local job_id = GetChaAttr(role, ATTR_JOB)
	if (job_req[job_id] == nil or Contains(job_req[job_id], item_id) == false) then
		BickerNotice(role, string.format("%s \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242 \242\240\229\225\238\226\224\237\232\255\236 \194\224\248\229\227\238 \234\235\224\241\241\224 \228\235\255 \232\241\239\238\235\252\231\238\226\224\237\232\255!", GetItemName(item_id)))
		--BickerNotice(role, string.format("%s не соответствует требованиям Вашего класса для использования!", GetItemName(item_id)))
		UseItemFailed(role)
		return
	end
	
	-- Check level requirements
	if (Lv(role) < 65) then
		BickerNotice(role, string.format("\194\224\248 \243\240\238\226\229\237\252 \228\238\235\230\229\237 \225\251\242\252 \237\229 \236\229\237\229\229 65 \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 %s!", GetItemName(item_id)))
		--BickerNotice(role, string.format("Ваш уровень должен быть не менее 65 чтобы использовать %s!", GetItemName(item_id)))
		UseItemFailed(role)
		return
	end
	
	-- Check if temp bag already has the item
	local item_num = CheckTempBagItem(role, item_id)
	if ( (item_num > 1 and item_type == tyBracelet) or
			(item_num > 0 and item_type ~= tyBracelet) ) then
		TakeItemBagTemp(role, 0, item_id, 1)
		GiveItem(role, 0, item_id, 1, 4)
		tmp_last_free_slot = tmp_last_free_slot - 1
	end
	
	-- Add the item to the temp bag
	if ( GiveItemX(role, 0, item_id, 1, 4) ) then
		-- Check if the item is equipped
		if (slot_req[item_type] ~= nil and 
					Contains(slot_req[item_type], tmp_last_free_slot) == true) then
			BickerNotice(role, string.format("\221\234\232\239\232\240\238\226\224\237\238: %s", GetItemName(item_id)))
			-- BickerNotice(role, string.format("Экипировано: %s", GetItemName(item_id)))
			
			if (tmp_last_free_slot == ceBraceletLeft) then
				AddState(role, role, stBraceletLeft, 1, 3600)
			elseif (tmp_last_free_slot == ceBraceletRight) then
				AddState(role, role, stBraceletRight, 1, 3600)
			elseif (tmp_last_free_slot == ceBelt) then
				AddState(role, role, stBelt, 1, 3600)
			elseif (tmp_last_free_slot == ceHandguard) then
				AddState(role, role, stHandguard, 1, 3600)
			end
			
		end
	end

end

-- Cha_timer Hook
local cha_timer_original = cha_timer
cha_timer = function(role, freq, time) 
	
	-- Call the original function
	cha_timer_original(role, freq, time)
	
	-- Our code for new equip
	local now_tick = GetChaParam(role, 1) 
	if (math.mod(now_tick, 1) == 0) then
		if (IsPlayer(role) == 1) then
			
			-- Get equip slots from temp bag
			local slLeftBracelet = GetChaItem(role, 3, ceBraceletLeft)
			local slRightBracelet = GetChaItem(role, 3, ceBraceletRight)
			local slBelt = GetChaItem(role, 3, ceBelt)
			local slHandguard = GetChaItem(role, 3, ceHandguard)
			
			-- Check left bracelet slot
			if (slLeftBracelet ~= nil and GetItemType(slLeftBracelet) == tyBracelet) then
				-- Add effect
				AddState(role, role, stBraceletLeft, 1, 3600)
			else
				-- Remove effect
				if (GetChaStateLv(role, stBraceletLeft) > 0) then
					RemoveState(role, stBraceletLeft)
				end
			end
			
			-- Check right bracelet slot
			if (slRightBracelet ~= nil and GetItemType(slRightBracelet) == tyBracelet) then
				-- Add effect
				AddState(role, role, stBraceletRight, 1, 3600)
			else
				-- Remove effect
				if (GetChaStateLv(role, stBraceletRight) > 0) then
					RemoveState(role, stBraceletRight)
				end
			end
			
			-- Check belt slot
			if (slBelt ~= nil and GetItemType(slBelt) == tyBelt) then
				-- Add effect
				AddState(role, role, stBelt, 1, 3600)
			else
				-- Remove effect
				if (GetChaStateLv(role, stBelt) > 0) then
					RemoveState(role, stBelt)
				end
			end
			
			-- Check handguard slot
			if (slHandguard ~= nil and GetItemType(slHandguard) == tyHandguard) then
				-- Add effect
				AddState(role, role, stHandguard, 1, 3600)
			else
				-- Remove effect
				if (GetChaStateLv(role, stHandguard) > 0) then
					RemoveState(role, stHandguard)
				end
			end
			
		end
	end
	
end

-- Hook for GetItemAttrRange function
local GetItemAttrRange_original = GetItemAttrRange
GetItemAttrRange = function(item_id, attr_id, type_id)
	
	local value = GetItemAttrRange_original(item_id, attr_id, type_id)
	if (item_attr[item_id] == nil) then
		item_attr[item_id] = {}
	end
	
	if (item_attr[item_id][attr_id] == nil) then
		item_attr[item_id][attr_id] = value
	end
	
	return value
end

-- Save item ID in the slot
function SaveItemId(role, cell_id, item_id)

	local cha_id = GetRoleID(role)
	if (role_equip[cha_id] == nil) then
		role_equip[cha_id] = {}
	end
	
	role_equip[cha_id][cell_id] = item_id
	
end

-- Get saved item ID
function GetSavedItemId(role, cell_id)

	local cha_id = GetRoleID(role)
	if (role_equip[cha_id][cell_id] ~= nil) then
		return role_equip[cha_id][cell_id]
	end
	
	return 0
end

-- Get saved item attr
function GetSavedItemAttr(item_id, attr_id)
	
	if (item_attr[item_id][attr_id] ~= nil) then
		return item_attr[item_id][attr_id]
	end
	
	return 0
end

-- Apply item attrs
function ApplyItemAttr(role, cell_id)

	-- Get the item descriptor
	local Item = GetChaItem(role, 3, cell_id)
	if (Item ~= nil) then
	
		-- Get the item ID
		local item_id = GetItemID(Item)
		
		-- Add VALUE attrs to character
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_STR) + GetItemAttrRange(item_id, ITEMATTR_VAL_STR, 0), role, ATTR_STATEV_STR) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_AGI) + GetItemAttrRange(item_id, ITEMATTR_VAL_AGI, 0), role, ATTR_STATEV_AGI) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_DEX) + GetItemAttrRange(item_id, ITEMATTR_VAL_DEX, 0), role, ATTR_STATEV_DEX) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_CON) + GetItemAttrRange(item_id, ITEMATTR_VAL_CON, 0), role, ATTR_STATEV_CON) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_STA) + GetItemAttrRange(item_id, ITEMATTR_VAL_STA, 0), role, ATTR_STATEV_STA) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_LUK) + GetItemAttrRange(item_id, ITEMATTR_VAL_LUK, 0), role, ATTR_STATEV_LUK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_ASPD) + GetItemAttrRange(item_id, ITEMATTR_VAL_ASPD, 0), role, ATTR_STATEV_ASPD) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_ADIS) + GetItemAttrRange(item_id, ITEMATTR_VAL_ADIS, 0), role, ATTR_STATEV_ADIS) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MNATK) + GetItemAttrRange(item_id, ITEMATTR_VAL_MNATK, 0), role, ATTR_STATEV_MNATK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXATK) + GetItemAttrRange(item_id, ITEMATTR_VAL_MXATK, 0), role, ATTR_STATEV_MXATK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_DEF) + GetItemAttrRange(item_id, ITEMATTR_VAL_DEF, 0), role, ATTR_STATEV_DEF) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXHP) + GetItemAttrRange(item_id, ITEMATTR_VAL_MXHP, 0), role, ATTR_STATEV_MXHP) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXSP) + GetItemAttrRange(item_id, ITEMATTR_VAL_MXSP, 0), role, ATTR_STATEV_MXSP) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_FLEE) + GetItemAttrRange(item_id, ITEMATTR_VAL_FLEE, 0), role, ATTR_STATEV_FLEE) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_HIT) + GetItemAttrRange(item_id, ITEMATTR_VAL_HIT, 0), role, ATTR_STATEV_HIT) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_CRT) + GetItemAttrRange(item_id, ITEMATTR_VAL_CRT, 0), role, ATTR_STATEV_CRT) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MF) + GetItemAttrRange(item_id, ITEMATTR_VAL_MF, 0), role, ATTR_STATEV_MF) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_HREC) + GetItemAttrRange(item_id, ITEMATTR_VAL_HREC, 0), role, ATTR_STATEV_HREC) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_SREC) + GetItemAttrRange(item_id, ITEMATTR_VAL_SREC, 0), role, ATTR_STATEV_SREC) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MSPD) + GetItemAttrRange(item_id, ITEMATTR_VAL_MSPD, 0), role, ATTR_STATEV_MSPD) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_COL) + GetItemAttrRange(item_id, ITEMATTR_VAL_COL, 0), role, ATTR_STATEV_COL) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_PDEF) + GetItemAttrRange(item_id, ITEMATTR_VAL_PDEF, 0), role, ATTR_STATEV_PDEF) 
		
		-- Add COEF attrs to character
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_STR) + GetItemAttrRange(item_id, ITEMATTR_COE_STR, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_STR)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_AGI) + GetItemAttrRange(item_id, ITEMATTR_COE_AGI, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_AGI)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_DEX) + GetItemAttrRange(item_id, ITEMATTR_COE_DEX, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_DEX)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_CON) + GetItemAttrRange(item_id, ITEMATTR_COE_CON, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_CON)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_STA) + GetItemAttrRange(item_id, ITEMATTR_COE_STA, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_STA)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_LUK) + GetItemAttrRange(item_id, ITEMATTR_COE_LUK, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_LUK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_ASPD) + GetItemAttrRange(item_id, ITEMATTR_COE_ASPD, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_ASPD)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_ADIS) + GetItemAttrRange(item_id, ITEMATTR_COE_ADIS, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_ADIS)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MNATK) + GetItemAttrRange(item_id, ITEMATTR_COE_MNATK, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MNATK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXATK) + GetItemAttrRange(item_id, ITEMATTR_COE_MXATK, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXATK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_DEF) + GetItemAttrRange(item_id, ITEMATTR_COE_DEF, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_DEF)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXHP) + GetItemAttrRange(item_id, ITEMATTR_COE_MXHP, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXHP)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXSP) + GetItemAttrRange(item_id, ITEMATTR_COE_MXSP, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXSP)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_FLEE) + GetItemAttrRange(item_id, ITEMATTR_COE_FLEE, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_FLEE)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_HIT) + GetItemAttrRange(item_id, ITEMATTR_COE_HIT, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_HIT)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_CRT) + GetItemAttrRange(item_id, ITEMATTR_COE_CRT, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_CRT)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MF) + GetItemAttrRange(item_id, ITEMATTR_COE_MF, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MF)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_HREC) + GetItemAttrRange(item_id, ITEMATTR_COE_HREC, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_HREC)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_SREC) + GetItemAttrRange(item_id, ITEMATTR_COE_SREC, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_SREC)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MSPD) + GetItemAttrRange(item_id, ITEMATTR_COE_MSPD, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MSPD)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_COL) + GetItemAttrRange(item_id, ITEMATTR_COE_COL, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_COL)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_PDEF) + GetItemAttrRange(item_id, ITEMATTR_COE_PDEF, 0)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_PDEF)
	
		-- Refresh character attrs
		ALLExAttrSet(role) 
		
		-- Save item id
		SaveItemId(role, cell_id, item_id)
		
	end
	
end

-- Remove item attrs
function RemoveItemAttr(role, cell_id)
	
	-- Get the item ID
	local item_id = GetSavedItemId(role, cell_id)
	if (item_id ~= 0) then
		
		-- Remove VALUE item attrs
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_STR) - GetSavedItemAttr(item_id, ITEMATTR_VAL_STR), role, ATTR_STATEV_STR) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_AGI) - GetSavedItemAttr(item_id, ITEMATTR_VAL_AGI), role, ATTR_STATEV_AGI) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_DEX) - GetSavedItemAttr(item_id, ITEMATTR_VAL_DEX), role, ATTR_STATEV_DEX) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_CON) - GetSavedItemAttr(item_id, ITEMATTR_VAL_CON), role, ATTR_STATEV_CON) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_STA) - GetSavedItemAttr(item_id, ITEMATTR_VAL_STA), role, ATTR_STATEV_STA) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_LUK) - GetSavedItemAttr(item_id, ITEMATTR_VAL_LUK), role, ATTR_STATEV_LUK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_ASPD) - GetSavedItemAttr(item_id, ITEMATTR_VAL_ASPD), role, ATTR_STATEV_ASPD) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_ADIS) - GetSavedItemAttr(item_id, ITEMATTR_VAL_ADIS), role, ATTR_STATEV_ADIS) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MNATK) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MNATK), role, ATTR_STATEV_MNATK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXATK) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MXATK), role, ATTR_STATEV_MXATK) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_DEF) - GetSavedItemAttr(item_id, ITEMATTR_VAL_DEF), role, ATTR_STATEV_DEF) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXHP) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MXHP), role, ATTR_STATEV_MXHP) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MXSP) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MXSP), role, ATTR_STATEV_MXSP) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_FLEE) - GetSavedItemAttr(item_id, ITEMATTR_VAL_FLEE), role, ATTR_STATEV_FLEE) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_HIT) - GetSavedItemAttr(item_id, ITEMATTR_VAL_HIT), role, ATTR_STATEV_HIT) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_CRT) - GetSavedItemAttr(item_id, ITEMATTR_VAL_CRT), role, ATTR_STATEV_CRT) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MF) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MF), role, ATTR_STATEV_MF) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_HREC) - GetSavedItemAttr(item_id, ITEMATTR_VAL_HREC), role, ATTR_STATEV_HREC) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_SREC) - GetSavedItemAttr(item_id, ITEMATTR_VAL_SREC), role, ATTR_STATEV_SREC) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_MSPD) - GetSavedItemAttr(item_id, ITEMATTR_VAL_MSPD), role, ATTR_STATEV_MSPD) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_COL) - GetSavedItemAttr(item_id, ITEMATTR_VAL_COL), role, ATTR_STATEV_COL) 
		SetCharaAttr(GetChaAttr(role, ATTR_STATEV_PDEF) - GetSavedItemAttr(item_id, ITEMATTR_VAL_PDEF), role, ATTR_STATEV_PDEF) 
		
		-- Remove COEF item attrs
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_STR) - GetSavedItemAttr(item_id, ITEMATTR_COE_STR)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_STR)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_AGI) - GetSavedItemAttr(item_id, ITEMATTR_COE_AGI)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_AGI)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_DEX) - GetSavedItemAttr(item_id, ITEMATTR_COE_DEX)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_DEX)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_CON) - GetSavedItemAttr(item_id, ITEMATTR_COE_CON)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_CON)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_STA) - GetSavedItemAttr(item_id, ITEMATTR_COE_STA)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_STA)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_LUK) - GetSavedItemAttr(item_id, ITEMATTR_COE_LUK)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_LUK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_ASPD) - GetSavedItemAttr(item_id, ITEMATTR_COE_ASPD)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_ASPD)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_ADIS) - GetSavedItemAttr(item_id, ITEMATTR_COE_ADIS)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_ADIS)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MNATK) - GetSavedItemAttr(item_id, ITEMATTR_COE_MNATK)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MNATK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXATK) - GetSavedItemAttr(item_id, ITEMATTR_COE_MXATK)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXATK)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_DEF) - GetSavedItemAttr(item_id, ITEMATTR_COE_DEF)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_DEF)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXHP) - GetSavedItemAttr(item_id, ITEMATTR_COE_MXHP)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXHP)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MXSP) - GetSavedItemAttr(item_id, ITEMATTR_COE_MXSP)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MXSP)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_FLEE) - GetSavedItemAttr(item_id, ITEMATTR_COE_FLEE)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_FLEE)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_HIT) - GetSavedItemAttr(item_id, ITEMATTR_COE_HIT)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_HIT)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_CRT) - GetSavedItemAttr(item_id, ITEMATTR_COE_CRT)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_CRT)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MF) - GetSavedItemAttr(item_id, ITEMATTR_COE_MF)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MF)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_HREC) - GetSavedItemAttr(item_id, ITEMATTR_COE_HREC)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_HREC)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_SREC) - GetSavedItemAttr(item_id, ITEMATTR_COE_SREC)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_SREC)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_MSPD) - GetSavedItemAttr(item_id, ITEMATTR_COE_MSPD)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_MSPD)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_COL) - GetSavedItemAttr(item_id, ITEMATTR_COE_COL)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_COL)
		SetCharaAttr(math.floor(((GetChaAttr(role, ATTR_STATEC_PDEF) - GetSavedItemAttr(item_id, ITEMATTR_COE_PDEF)) / ATTR_RADIX ) * ATTR_RADIX), role, ATTR_STATEC_PDEF)
		
		-- Refresh character attrs
		ALLExAttrSet(role)
		
	end
	
end

-- Left bracelet effect 
function PIO_Equip_LeftBracelet_Add(role, statelv)
	ApplyItemAttr(role, ceBraceletLeft)
end

function PIO_Equip_LeftBracelet_Rem(role, statelv)
	RemoveItemAttr(role, ceBraceletLeft)
end

-- Right bracelet effect 
function PIO_Equip_RightBracelet_Add(role, statelv)
	ApplyItemAttr(role, ceBraceletRight)
end

function PIO_Equip_RightBracelet_Rem(role, statelv)
	RemoveItemAttr(role, ceBraceletRight)
end

-- Belt effect 
function PIO_Equip_Belt_Add(role, statelv)
	ApplyItemAttr(role, ceBelt)
end

function PIO_Equip_Belt_Rem(role, statelv)
	RemoveItemAttr(role, ceBelt)
end

-- Handguard effect
function PIO_Equip_Handguard_Add(role, statelv)
	ApplyItemAttr(role, ceHandguard)
end

function PIO_Equip_Handguard_Rem(role, statelv)
	RemoveItemAttr(role, ceHandguard)
end