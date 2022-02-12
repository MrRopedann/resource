--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- 2022		   		--
--- Discord - Graf#4664 --
--------------------------
print(  "Loading NPCScript01.lua " )

-----------------------------
-- Кузнец - Голди (Аргент) --
-----------------------------
function npc_kuznec ()
	Talk( 1,  "Кузнец - Голди:_Я могу помочь тебе в этом длинном _путешествии от новичка до Укротителя Морей! " )
	Text( 1,  "Торг ", BuyPage )
	Text( 1,  "Ремонт ", OpenRepair )
	Text( 1,  "Улучшение экипировки ", OpenItemTiChun)
	Text( 1,  "Улучшение аппарели ", OpenUpgrade)
	Text( 1,  "Вставить в аппарель ", OpenFusion)
	--Text( 1,  "Комбинация самоцветов ", OpenUnite)
	--Text( 1,  "Вставить самоцвет ", OpenForge)
	--Text( 1,  "Сделать слот ", OpenMilling)


	InitTrade()
	Weapon(	0453	)
	Weapon(	0454	)
	Weapon(	0891	)
	Weapon(	0890	)
	Weapon(	1020	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	0886	)

end 

------------------------------
-- Наставница Сина (Аргент) --
------------------------------

function Newbie_Sina()

	Talk( 1,  "Сиена: Привет! Я наставница Аргента! Если есть вопросы - обращайся! " )
	Text( 1,  "Звезда Единства ", JumpPage, 31 )
	Text( 1,  "Спасибо, я все понял ",  CloseTalk)
	InitTrigger()
	TriggerCondition( 1, NoItem, 1034, 1 )
	TriggerCondition( 1, NoItem, 1033, 1 )
	TriggerCondition( 1, BankNoItem, 1034, 1 )
	TriggerCondition( 1, BankNoItem, 1033, 1 )
	TriggerCondition( 1, EquipNoItem, 1034, 1 )
	TriggerCondition( 1, EquipNoItem, 1033, 1 )

	TriggerCondition( 1, LvCheck,  "< ", 41 )
	TriggerAction( 1, GiveItem, 1033, 1, 4 )
	TriggerFailure( 1, JumpPage, 6 )
	Talk( 31,  "Сиена: Звезда Единства - таинственный предмет из другого мира. Она способна накапливать опыт своего владельца, а затем при некоторых условиях отдавать весь накопленный опыт обратно. Кроме того по достижении 41 уровня вы сможете обменять Звезду Единства на экипировку своего класса на 50 уровень. " )
	Text( 31,  "Получить Звезду Единства ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 31,  "Обменять Звезду Единства ",JumpPage, 32 )

	Talk( 32, "Сиена: Спасибо за использование наших продуктов. По достижении 41 уровня вы можете обменять Звезду Единства на экипировку своего класса на 50 уровень. Вас это интересует? ")
	Text( 32,  "Получить оружие класса ", Transfer_TeamStar, 1)

	Talk( 6,  "Сиена: Простите, но вы не подходите по требованию. " )

    AddNpcMission ( 701 )
    AddNpcMission ( 702 )
    AddNpcMission ( 704 )
    AddNpcMission ( 706 )
    AddNpcMission ( 708 )
    AddNpcMission ( 200 )
    AddNpcMission   (402)
    AddNpcMission   (50)
    AddNpcMission   (51)
    AddNpcMission   (61)
    AddNpcMission   (62)
    AddNpcMission   (63)
    AddNpcMission   (64)
    AddNpcMission   (65)
    AddNpcMission   (82)
end
