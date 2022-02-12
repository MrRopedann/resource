--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading Init_Attr.lua" )

--Функция, без которой все сляжет
function Init_attr() 
	for i = 0, 240, 1 do						
		SetChaAttrMax( i, 100000000) 
	end 
end 
Init_attr() 

SetChaAttrMax( ATTR_LV		,	400			)	-- Максимальный уровень персонажа
SetChaAttrMax( ATTR_HP		,	2000000000		)	-- Максимальное количество жизней
SetChaAttrMax( ATTR_SP		,	2000000000		)	-- Максимальное количество маны
SetChaAttrMax( ATTR_JOB		,	100				)	-- Максимальное количество профессий
SetChaAttrMax( ATTR_CEXP	,	4200000000		)	-- 
SetChaAttrMax( ATTR_NLEXP	,	4200000000		)	-- 
SetChaAttrMax( ATTR_AP		,	50000			)	-- 
SetChaAttrMax( ATTR_TP		,	500				)	-- 
SetChaAttrMax( ATTR_GD		,	2000000000		)	-- 
SetChaAttrMax( ATTR_CLEXP	,	4200000000		)	-- 
SetChaAttrMax( ATTR_MXHP	,	2000000000		)	-- 
SetChaAttrMax( ATTR_MXSP	,	2000000000		)	-- 
SetChaAttrMax( ATTR_BSTR	,	400			)	-- Max STR Possible
SetChaAttrMax( ATTR_BDEX	,	400			)	-- Max ACC Possible
SetChaAttrMax( ATTR_BAGI	,	400			)	-- Max AGI Possible
SetChaAttrMax( ATTR_BCON	,	400			)	-- Max CON Possible
SetChaAttrMax( ATTR_BSTA	,	400			)	-- Max SPR Possible
SetChaAttrMax( ATTR_BLUK	,	150				)	-- Max LUK Possible
SetChaAttrMax( ATTR_BMXHP	,	2000000000		)	--     
SetChaAttrMax( ATTR_BMXSP	,	2000000000		)	--     
SetChaAttrMax( ATTR_BMNATK	,	200000000		)	-- 
SetChaAttrMax( ATTR_BMXATK	,	200000000		)	-- 
SetChaAttrMax( ATTR_BDEF	,	999999999		)	--     
SetChaAttrMax( ATTR_BHIT	,	99999999		)	--     
SetChaAttrMax( ATTR_BFLEE	,	99999999		)	--     
SetChaAttrMax( ATTR_BMF		,	99999999		)	--     
SetChaAttrMax( ATTR_BCRT	,	99999999		)	--     
SetChaAttrMax( ATTR_BHREC	,	99999999		)	-- 
SetChaAttrMax( ATTR_BSREC	,	99999999		)	--  
SetChaAttrMax( ATTR_BASPD	,	700				)	--   
SetChaAttrMax( ATTR_BADIS	,	99999999		)	--   
SetChaAttrMax( ATTR_BMSPD	,	99999999		)	--   
SetChaAttrMax( ATTR_BCOL	,	99999999		)	-- 
SetChaAttrMax( ATTR_MSPD	,	99999999		)	-- 
SetChaAttrMax( ATTR_LHAND_ITEMV	,	99999999	)	-- 
SetChaAttrMax( ATTR_BOAT_SHIP	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_HEADER	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_BODY	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_ENGINE	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_CANNON	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_PART	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_BERTH	,	100000		)	-- 
SetChaAttrMax( ATTR_BOAT_DBID	,	2000000000	)	-- 
