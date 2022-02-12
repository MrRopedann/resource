--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- 2022		   		--
--- Discord - Graf#4664 --
--------------------------
print(  "Loading NPCScript01.lua " )

-----------------------------
-- ������ - ����� (������) --
-----------------------------
function npc_kuznec ()
	Talk( 1,  "������ - �����:_� ���� ������ ���� � ���� ������� _����������� �� ������� �� ���������� �����! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������ ", OpenRepair )
	Text( 1,  "��������� ���������� ", OpenItemTiChun)
	Text( 1,  "��������� �������� ", OpenUpgrade)
	Text( 1,  "�������� � �������� ", OpenFusion)
	--Text( 1,  "���������� ���������� ", OpenUnite)
	--Text( 1,  "�������� �������� ", OpenForge)
	--Text( 1,  "������� ���� ", OpenMilling)


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
-- ���������� ���� (������) --
------------------------------

function Newbie_Sina()

	Talk( 1,  "�����: ������! � ���������� �������! ���� ���� ������� - ���������! " )
	Text( 1,  "������ �������� ", JumpPage, 31 )
	Text( 1,  "�������, � ��� ����� ",  CloseTalk)
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
	Talk( 31,  "�����: ������ �������� - ������������ ������� �� ������� ����. ��� �������� ����������� ���� ������ ���������, � ����� ��� ��������� �������� �������� ���� ����������� ���� �������. ����� ���� �� ���������� 41 ������ �� ������� �������� ������ �������� �� ���������� ������ ������ �� 50 �������. " )
	Text( 31,  "�������� ������ �������� ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 31,  "�������� ������ �������� ",JumpPage, 32 )

	Talk( 32, "�����: ������� �� ������������� ����� ���������. �� ���������� 41 ������ �� ������ �������� ������ �������� �� ���������� ������ ������ �� 50 �������. ��� ��� ����������? ")
	Text( 32,  "�������� ������ ������ ", Transfer_TeamStar, 1)

	Talk( 6,  "�����: ��������, �� �� �� ��������� �� ����������. " )

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
