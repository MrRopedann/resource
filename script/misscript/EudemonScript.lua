--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------

print( "����㧪� EudemonScript.lua" )
print( "Eudemon init" )
print( "-------------------------------------------------------------------------------" )
print( "����㧪� ����:" )
print( "-------------------------------------------------------------------------------" )

--���������
JobCh = {}
JobCh.Money = {}
JobCh.Money.First = 5000	-- ������ ��� ��������� ������ ���������
JobCh.Money.Second = 50000	-- ������ ��� ��������� ������ ���������
JobCh.Level = {}
JobCh.Level.First = 9		-- ������� ��� ��������� ������ ���������
JobCh.Level.Second = 40		-- ������� ��� ��������� ������ ���������

function Eudemon()
	Talk(1, "���������: �� ������ ����� ��������?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(1, "������", MultiTrigger, GetMultiTrigger(), 1)

	Talk(2, "���������: �� ������ ����� ���������?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 8)
	TriggerFailure(1, JumpPage, 11)
	Text(2, "�������", MultiTrigger, GetMultiTrigger(), 1)

	Talk(3, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 1)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "������", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 2)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "�������", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(3, "�������������", MultiTrigger, GetMultiTrigger(), 1)

	Talk(4, "���������: ��� �� ������ �����?")
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
	Text(4, "�������", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "�������������", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(4, "��������", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 4)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "�������������", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.First - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.First, JobCh.Money.First)
	TriggerAction(1, TakeMoney, JobCh.Money.First)	
	TriggerAction(1, SetProfession, 5)
	TriggerFailure(1, JumpPage, 10)
	Text(5, "��������", MultiTrigger, GetMultiTrigger(), 1)

	Talk(6, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 9)
	TriggerFailure(1, JumpPage, 11)
	Text(6, "������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(7, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 12)
	TriggerFailure(1, JumpPage, 11)
	Text(7, "������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(8, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 16)
	TriggerFailure(1, JumpPage, 11)
	Text(8, "���������� ����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(9, "���������: ��� �� ������ �����?")
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 13)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "������ ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition(1, LvCheck, ">", JobCh.Level.Second - 1)
	TriggerCondition(1, HasMoney, JobCh.Money.Second, JobCh.Money.Second)
	TriggerAction(1, TakeMoney, JobCh.Money.Second)
	TriggerAction(1, SetProfession, 14)
	TriggerFailure(1, JumpPage, 11)
	Text(9, "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(10, "���������: � ��� ������ ���� ������� "..JobCh.Level.First.." � "..JobCh.Money.First.." ������, ����� �������� ������ ���������! ")
	Text(10, "���� ", CloseTalk)

	Talk(11, "���������: � ��� ������ ���� ������� "..JobCh.Level.Second.." � "..JobCh.Money.Second.." ������, ����� �������� ������ ���������! ")
	Text(11, "���� ", CloseTalk)

	Talk(12, "���������: � ��� �� ������������? � ��� ��� ���� ���������! ")
	Text(12, "���� ", CloseTalk)

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

function EudemonMission()
	InitTrigger()
	RegTrigger( 8889, 1 )

	DefineWorldMission( 1, "����� ���������� ", 1 )
	
	MisBeginTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� �������� (2223,2785). ��� ����� � ������� (2223,2785) � �������� ��������.<n><t>������� �����������!" )
	MisHelpTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� - ����� (2223,2785). ��� ����� � ������� (2223,2785) � �������� ��������.<n><t>������� �����������!" )
	MisBeginAction( AddMission, 1 )
	MisBeginAction( SetFlag, 1, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "����� <���������� �������� - ����� (2223,2785)> � ������ (2223,2785), ����� �������� ������ � ������� � ���������������.")

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 2, "����� ���������� ", 2 )
	
	MisBeginTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� ��������.��� ����� � ������� (877,3573) � �������� ��������.<n><t>������� �����������!" )
	MisHelpTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� - ������� (877,3573). ��� ����� � ������� (877,3573) � �������� ��������.<n><t>������� �����������!" )
	MisBeginAction( AddMission, 2 )
	MisBeginAction( SetFlag, 2, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "����� ���������� ��������,� �������(877,3573),����� ������ ���� ����!")

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 3, "����� ���������� ", 3 )
	
	MisBeginTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� - ������ (1315,507). ��� ����� � ������ (1315,507) � �������� ��������.<n><t>������� �����������!" )
	MisHelpTalk( "<t>����� ���������� � ������� ������!<n><t> ���, ������ ������������ ��������, ��������, �, ������� ��, ���������� � �����������. �� �������� ������ ����������� �����, � ����������, ��, ��������, ��������� ���������� �� ���� ��� �������������� � ������� � ��������� �� ����������� � ������!<n><t>����� ������ �������� ����� ����� ���������� - ������ (1315,507). ��� ����� � ������ (1315,507) � �������� ��������.<n><t>������� �����������!" )
	MisBeginAction( AddMission, 3 )
	MisBeginAction( SetFlag, 3, 1 )
	MisBeginAction(GiveItem, 436, 1, 4)
	MisNeed(MIS_NEED_DESP, "����� <j���������� �������� - ������ (1315,507)> � ������ (1315,507), ����� �������� ������ � ������� � ���������������.")

	MisResultCondition( AlwaysFailure )
	DefineWorldMission( 4, "�������� �������� ", 4 )

	MisBeginTalk( "<t>����� � <j����������� ����� 2 (135,137)> � ������� ������ ��������.<n><t>����� �� ������� ���, ����������� <y�������>. �������, � ��� ����� ����� 1 ���." )
	MisHelpTalk( "<t>����� � <j����������� ����� 2 (135,137)> � ������� ������ ��������.<n><t>����� �� ������� ���, ����������� <y�������>. �������, � ��� ����� ����� 1 ���." )
	MisBeginAction( AddMission, 4 )
	MisBeginAction(SystemNotice, "�������� �������: \"�������� ��������\"" )

	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "����� ������ <b��������> � ��������� ����������� �������, ����� ��������� ��� " )
	MisNeed(MIS_NEED_KILL, 99, 1, 10, 1)

	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 5, "��� ���, ���� ��� �������� ", 5 )
	
	MisBeginTalk( "<t>������ ����������� <b���������><n><t>������ �������� <j������ (1118,3611)>." )
	MisHelpTalk( "<t>������ ����������� <b���������><n><t>������ �������� <j������ (1118,3611)>." )
	MisBeginAction( AddMission, 5 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � ���, ���� �� ����� ���� ����������� ������. ������� <j������ � ����� (1118,3611)>.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 6, "�������� ������ ", 6 )
	
	MisBeginTalk( "<t>������, ��� ����� ���-�� �� ������������. �������� �� <j�������� - �������� � ����� (2272,2700)>." )
	MisHelpTalk( "<t>������, ��� ����� ���-�� �� ������������. �������� �� <j�������� - �������� � ����� (2272,2700)>." )
	MisBeginAction( AddMission, 6 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "���������� �� <j�������� - �������� � ����� (2272,2700)>")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 7, "��������� � ������ ", 7 )
	
	MisBeginTalk( "<t>������ ����� ���������� � <j����� (1320,585)>. ����� ������ � ������� �����." )
	MisHelpTalk( "<t>������ ����� ���������� � <j����� (1320,585)>. ����� ������ � ������� �����." )
	MisBeginAction( AddMission, 7 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � ������� ����� � <j����� � ����� (1320,585)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 8, "����� ������ ", 8 )
	
	MisBeginTalk( "<t>����� � ���� � ���� ���, ���� ������� ������������ �����: \" ����� ������, ����� ����������� � ������ ���, �������� �������� ���� ����\"...<n>�������� � <j������ (1672,3777)>. ����� ���� �� ������� �� ���� ���-�� �����..." )
	MisHelpTalk( "<t>����� � ���� � ���� ���, ���� ������� ������������ �����: \" ����� ������, ����� ����������� � ������ ���, �������� �������� ���� ����\"...<n>�������� � <j������ (1672,3777)>. ����� ���� �� ������� �� ���� ���-�� �����..." )
	MisBeginAction( AddMission, 8 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � <j������ (1672,3777)>. ����� � ����� ������ ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 9, "���� ����� ", 9 )
	
	MisBeginTalk( "<t>����� � ������ ������ �������� ������� �������, ����������� ����� ������ ���: \" ���� �����, ����� ����������� � ������ ���, �������� �������� ���� ����\"...<n>��� �� ���� �����, � �� �����. ����� ���� <j���� (1672,3777)> ����� ���-������?" )
	MisHelpTalk( "<t>����� � ������ ������ �������� ������� �������, ����������� ����� ������ ���: \" ���� �����, ����� ����������� � ������ ���, �������� �������� ���� ����\"...<n>��� �� ���� �����, � �� �����. ����� ���� <j���� (1672,3777)> ����� ���-������?" )
	MisBeginAction( AddMission, 9 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � <j������ (1672,3777)>. ����� � ����� ������ ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 10, "���������� ", 10 )
	
	MisBeginTalk( "<t>����� � ���������� ������ ������ �� ��� ������ �����, ������������ ����� �������� �� ���: \"����������, ������ ���� ��������� � � ������ ���� ������\"...<n><t>� ����� ����� � ���, ��� ����� ����������. � ��� ��� �������� ���� ���������? ����� ����, <j���� (1672,3777)> ����� ���� ���-��?" )
	MisHelpTalk( "<t>����� � ���������� ������ ������ �� ��� ������ �����, ������������ ����� �������� �� ���: \"����������, ������ ���� ��������� � � ������ ���� ������\"...<n><t>� ����� ����� � ���, ��� ����� ����������. � ��� ��� �������� ���� ���������? ����� ����, <j����> (1672,3777)> ����� ���� ���-��?" )
	MisBeginAction( AddMission, 10 )
	MisBeginAction( TakeItem, 4220, 1 )
	MisBeginAction( GiveItem, 4221, 1, 4 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � <j������ (1672,3777)>. ����� � ����� ������ ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 11, "����� ������ ", 11 )
	
	MisBeginTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� ���� � <j������ ������ - ����� (1346,451)>." )
	MisHelpTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� ���� � <j������ ������ - ����� (1346,451)>." )
	MisBeginAction( AddMission, 11 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � <j������ ������ - ����� (1346, 451)> � ����� ������.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 12, "���� ����� ", 12 )

	MisBeginTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� � <j��������� - �������� (2277, 2831)>." )
	MisHelpTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� � <j��������� - �������� (2277, 2831)>." )
	MisBeginAction( AddMission, 12 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "��� � ����� � ������ <j�������� - ������� (2277,2831)> � ���� �����.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 13, "���������� ", 13 )
	
	MisBeginTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� � <j���������� ������� - ��������� (2219,2749)>." )
	MisHelpTalk( "<t>� ��������, ��� ���� �����, �� �� �� ����� �������� ���. ������� ��� ������, ��� � ���� ��� ����� ��� ������������? ��.. � ����� ������ ���������. ������ ����� ���������� � <j���������� ������� - ��������� (2219,2749)>." )
	MisBeginAction( AddMission, 13 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "������ <b��������� ������� - �������� (2219,2749)> � ���������� ��������.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 14, "�������� ���� ", 14 )
	
	MisBeginTalk( "<t>����� � ��������� ��� �������� ����� ������, �� � �������� ����� ����� ������ �����������. �� ���� � �� ����� ����� ������ ��������, �� � ���� ������ �� ������ �������� ��������� �����. �� ������ ������ ������ ������ ��� �����. � ��������, ��� ����������� ��� ������� � ������ ������. ��� ������� ��� �������. *����� ���������, ������, �� ������������� ��� ����� �������� �������*<n><t>� ��������� ������� �������� ������������� <j��������� ������� - �������� (2219,2749)>. �� ������ ���� � ��������� ��������� ���, ��� ���������." )
	MisHelpTalk( "<t>����� � ��������� ��� �������� ����� ������, �� � �������� ����� ����� ������ �����������. �� ���� � �� ����� ����� ������ ��������, �� � ���� ������ �� ������ �������� ��������� �����. �� ������ ������ ������ ������ ��� �����. � ��������, ��� ����������� ��� ������� � ������ ������. ��� ������� ��� �������. *����� ���������, ������, �� ������������� ��� ����� �������� �������*<n><t>� ��������� ������� �������� ������������� <j��������� ������� - �������� (2219,2749)>. �� ������ ���� � ��������� ��������� ���, ��� ���������." )
	MisBeginAction( AddMission, 14 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "�������� � <b���������� ������� - ��������� (2219, 2749)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 15, "���� ���������� ", 15 )
	
	MisBeginTalk( "<t>� ������� ����, ������� ��������� � ���� � �����. �� �������� ��������� � �������. �������� �� ��, ��� �� ����, �� ������ ������������� ��������� ����� ����������. ������, � ���� ���� ����.." )
	MisHelpTalk( "<t>� ������� ����, ������� ��������� � ���� � �����. �� �������� ��������� � �������. �������� �� ��, ��� �� ����, �� ������ ������������� ��������� ����� ����������. ������, � ���� ���� ����.." )
	MisBeginAction( AddMission, 15 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "������� <r���� �������> <j������� - ������� (743,1534)> � ���� ���������� ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 16, "��������� ������ ", 16 )
	
	MisBeginTalk( "<t>\"� ��������� ������, ������� ��������� � ������� �����... ����������, �� �������� ��� �� ����, � ���������...\"<n><t> ��� ��� ����? � �����? ��� ��� ���� ������??? ���������� �������� �� ���� <r�����>." )
	MisHelpTalk( "<t>\" � ��������� ������, ������� ��������� � ������� �����... ����������, �� �������� ��� �� ����, � ���������...\"<n><t> ��� ��� ����? � �����? ��� ��� ���� ������??? ���������� �������� �� ���� <r�����>." )
	MisBeginAction( AddMission, 16 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "����� <j����� (1672,3777)>, ����� ������, ��� ��� ���� ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 17, "�������� ������������ ", 17 )
	
	MisBeginTalk( "<t>������, ����� ����� ������� �������� � ��������� ������ ����� �������� �� ���� ������ �����. ����� ����, ��� ������ ������� ������������ <r������ �������>." )
	MisHelpTalk( "<t>������, ����� ����� ������� �������� � ��������� ������ ����� �������� �� ���� ������ �����. ����� ����, ��� ������ ������� ������������ <r������ �������>." )
	MisBeginAction( AddMission, 17 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "������ <b��������� ������> <j������ ������� (2193,2730)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 18, "���� ������� ", 18 )
	
	MisBeginTalk( "<t>����� � ������� ������� ����� ����������� ��������� ������ �� ������� ������, ��������� ����� �������������. ����� ����� ���������� ��������, �������� �������� �����������, ������������� ���������� ���������� ��������� ������: \"����� ������ �������� � ����� ������. ������ �� ���� � ��������� �� ��������. ����� ����� ����� �������� �� ���������� ������, ����� �� ������� ��������� ���������.\" <n><t>��� �� ��� �������? ��������� ���� ����� ���-�� ��� ���." )
	MisHelpTalk( "<t>����� � ������� ������� ����� ����������� ��������� ������ �� ������� ������, ��������� ����� �������������. ����� ����� ���������� ��������, �������� �������� �����������, ������������� ���������� ���������� ��������� ������: \"����� ������ �������� � ����� ������. ������ �� ���� � ��������� �� ��������. ����� ����� ����� �������� �� ���������� ������, ����� �� ������� ��������� ���������.\" <n><t>��� �� ��� �������? ��������� ���� ����� ���-�� ��� ���." )
	MisBeginAction( AddMission, 18 )
	MisBeginAction( TakeItem, 4228, 1 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "����� <j�������� ����� (1672, 3777)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 19, "��������� ������� ", 19 )
	
	MisBeginTalk( "<t>������ ����, ��� <r��������� ����>! ��� ����� ����� ��� �� ������ �� ���������. ��� �������, ��� ���� ��� �� ������. ���������-��... ��� ���? ������, ��� ��� ��������, <p\"(1843, 1717)\">. ������ ����, ��� ���������� ���������!<n><t>�� ��� �� ����!? ������, �������� ������ ������� ���� � ������. ��� ������ ����, ���� � ������ ���� ����� �� <r��������� ����>, ��������� ���������� ��������������. ������ �� ��� �� � �����, �� ����� ������!" )
	MisHelpTalk( "<t>������ ����, ��� <r��������� ����>! ��� ����� ����� ��� �� ������ �� ���������. ��� �������, ��� ���� ��� �� ������. ���������-��... ��� ���? ������, ��� ��� ��������, <p\"(1843, 1717)\">. ������ ����, ��� ���������� ���������!<n><t>�� ��� �� ����!? ������, �������� ������ ������� ���� � ������. ��� ������ ����, ���� � ������ ���� ����� �� <r��������� ����>, ��������� ���������� ��������������. ������ �� ��� �� � �����, �� ����� ������!" )
	MisBeginAction( AddMission, 19 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "����������� <j� ����� (1843,1717)> � ��������� <r��������� ����> ����� �������, ��� ����� ")
	
	MisResultCondition( AlwaysFailure )
	MisResultAction(AddExp,100000,100000)
	MisResultAction(AddMoney,12000,12000)
	MisResultAction(AddExpAndType,2,30000,30000)
	MisResultAction(GiveItem,3462,20,4)

	DefineWorldMission( 20, "������������ ������� ", 20 )
	
	MisBeginTalk( "<t>����� ��� ����� ��������� �� ������� �������, � ������ ������� ����, ��� ���� �� ������� ��������.<n><t>����� � ���������, ����� ������� ������� � � ���� ����� �������� ������� ������. ������ ��� ���������� �������� ���� �������� �� ������������ �����.<n><t>�������� ����� � ��������� ������� � ����� - ��� ��� ������ �������������. ��� ���� �������� �� ������������ ����� ��, ��� �� �����, �� ��������� ��������� ���������� ������������ �������.<n><t>�� ������� � �����, <r������ - �������> � ����� (2272, 2700) ������ ���, ��� ���� ��������� ��������� � �������, �� ����� ������. �� ��� �� �� ���������� � ���?" )
	MisHelpTalk( "<t>����� ��� ����� ��������� �� ������� �������, � ������ ������� ����, ��� ���� �� ������� ��������.<n><t>����� � ���������, ����� ������� ������� � � ���� ����� �������� ������� ������. ������ ��� ���������� �������� ���� �������� �� ������������ �����.<n><t>�������� ����� � ��������� ������� � ����� - ��� ��� ������ �������������. ��� ���� �������� �� ������������ ����� ��, ��� �� �����, �� ��������� ��������� ���������� ������������ �������.<n><t>�� ������� � �����, <r������ - �������> � ����� (2272, 2700) ������ ���, ��� ���� ��������� ��������� � �������, �� ����� ������. �� ��� �� �� ���������� � ���?" )
	MisBeginAction( AddMission, 20 )
	MisBeginAction( SetRecord, 19 )
	MisBeginAction( ClearMission, 19 )
	MisBeginAction( TakeItem, 4230, 1 )
	MisBeginAction( GiveItem, 4231, 1, 4 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "������ ������� � ����� � �������� �� <j�������� - �������� (2272,2700)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 21, "������������ ����� ", 21 )
	
	MisBeginTalk( "<t>\"� ��� � ��� ������ �������, ����� ����� ������. ���� ����� ���������� � ���� ������ ������������ ���������. ���� ����� ���������� - ��� ��� ����� �����. �� ���� �� ������� ��� ���� ����� �����.<n><t> � �� ����� �������� � ���� ������ ��������, ����������� �����  ������. ������ ������� �������� ������ ��, ����� ������� ������ ���������� � �����-������ ������� ��� ���������� �� ���������. � ����� ���� ������, ����� ���� ��������� ����� ����� �������� ��� ��, ��� � ��� ������.<n><t>���� ���� ��������� ���� �������, � �������, ��� ������ ����� �� ���������� ������� � ���� ���������� ���. � ���� ���� ����� ��� ��������� <n> <t> �� ��� ������� ������, �� ����� �������� �� ���� <r������������� �����>, ����� ��� ���������� ��� ���� �����." )
	MisHelpTalk( "<t>\"� ��� � ��� ������ �������, ����� ����� ������. ���� ����� ���������� � ���� ������ ������������ ���������. ���� ����� ���������� - ��� ��� ����� �����. �� ���� �� ������� ��� ���� ����� �����.<n><t> � �� ����� �������� � ���� ������ ��������, ����������� �����  ������. ������ ������� �������� ������ ��, ����� ������� ������ ���������� � �����-������ ������� ��� ���������� �� ���������. � ����� ���� ������, ����� ���� ��������� ����� ����� �������� ��� ��, ��� � ��� ������.<n><t>���� ���� ��������� ���� �������, � �������, ��� ������ ����� �� ���������� ������� � ���� ���������� ���. � ���� ���� ����� ��� ��������� <n> <t> �� ��� ������� ������, �� ����� �������� �� ���� <r������������� �����>, ����� ��� ���������� ��� ���� �����." )
	MisBeginAction( AddMission, 21 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "��������� <j�������������� ����� - ��� (862,3303)> � ����������.")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 22, "������ ������ ", 22 )
	
	MisBeginTalk( "<t>�������, � ���� ���� �������� �������� ������� ��� ������� ��������� �����. �� ���� ���� ���� ������� ������.<n><t>�������� � ������� ���-�� ����. ������ ������ ������� � ����� ������� ���� ����� �� ����. <n><t>���� �� ��� �������? ���������..." )
	MisHelpTalk( "<t>�������, � ���� ���� �������� �������� ������� ��� ������� ��������� �����. �� ���� ���� ���� ������� ������.<n><t>�������� � ������� ���-�� ����. ������ ������ ������� � ����� ������� ���� ����� �� ����. <n><t>���� �� ��� �������? ���������..." )
	MisBeginAction( AddMission, 22 )
	MisBeginAction( TakeItem, 4237,1 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "����������� � <j������� (1497, 1707)> � ��������, ���� �� ��� ���-������ ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 24, "����� ������� ", 24)
	
	MisBeginTalk( "<t>���� � �� ������, ������� ������ ���� ������. ������ ����� ������ �������... � ����������, ��� ������������ � ����������� ��������. ����� ����� ��������� ������� ������������?<n><t>������ ���� ������������� ������� ����..." )
	MisHelpTalk( "<t>���� � �� ������, ������� ������ ���� ������. ������ ����� ������ �������... � ����������, ��� ������������ � ����������� ��������. ����� ����� ��������� ������� ������������?<n><t>������ ���� ������������� ������� ����..." )
	MisBeginAction( AddMission, 24 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "��������� ����� ������� � ����������� � ��� ������� ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 25, "����� ����� ������� ", 25)
	
	MisBeginTalk( "<t>��� ��� ����� ��� ������� ������ �������������?<n><t>����� �������� ���������...� �������, ��� ��� �������� �� ������...<n><t>����� ��� ����? �������� � ���� ������ ������, <b�������������� ������ - ����>, ����� ��� ������� ���� �� ��� �������." )
	MisHelpTalk( "<t>��� ��� ����� ��� ������� ������ �������������?<n><t>����� �������� ���������...� �������, ��� ��� �������� �� ������...<n><t>����� ��� ����? �������� � ���� ������ ������, <b�������������� ������ - ����>, ����� ��� ������� ���� �� ��� �������." )
	MisBeginAction( AddMission, 25 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "�������� � <j������������� ������ - ���� (862,3303)> � ������ � ��� ��� ����� ������� ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 26, "������������� ������ ", 26)
	
	MisBeginTalk( "<t>������� ����, ������� ��� �� ��������� ����. ��� ��� ����� � ��� �������� � ���� �������� ������� � �� ��������� ��� �����. �����������, � �����, ��� ������ ���� �����, ��� ������ � ���� �� ����, �� � �� ��� ���������� ����. ������� ���� ��������� ������������ ��, ��� � ��������� ������������ ����� �������, ����� ������� ���� ������? � �� ����, ���������� �� ��� � ���� ����, �� ��, ��� � ������������� ����, ��� ��� ��, ��� ���� ��� ������� �� ��������� ���� � �������, �����, ��������, ��� ����� �������.<n><t> ���, ��� ����� ����� ��������. � ���� �������� ������� ����� � ����� �������, �����, ��� ������� ����. ���������� � ������� ���� ���� ������ �����. ���, ��� �� ������ - �� ��, ��� ���� �������. ���� ����������� ���� ����� �������� ������� �������� ������." )
	MisHelpTalk( "<t>������� ����, ������� ��� �� ��������� ����. ��� ��� ����� � ��� �������� � ���� �������� ������� � �� ��������� ��� �����. �����������, � �����, ��� ������ ���� �����, ��� ������ � ���� �� ����, �� � �� ��� ���������� ����. ������� ���� ��������� ������������ ��, ��� � ��������� ������������ ����� �������, ����� ������� ���� ������? � �� ����, ���������� �� ��� � ���� ����, �� ��, ��� � ������������� ����, ��� ��� ��, ��� ���� ��� ������� �� ��������� ���� � �������, �����, ��������, ��� ����� �������.<n><t> ���, ��� ����� ����� ��������. � ���� �������� ������� ����� � ����� �������, �����, ��� ������� ����. ���������� � ������� ���� ���� ������ �����. ���, ��� �� ������ - �� ��, ��� ���� �������. ���� ����������� ���� ����� �������� ������� �������� ������." )
	MisBeginAction( AddMission, 26 )
	MisBeginAction( TakeItem, 4240, 1 )
	MisBeginAction( SetRecord, 370 )
	MisBeginAction( ClearMission, 370 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "��������� � <j���� ���������� (743,1534)> � ����� ������� ����� �� ����� ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 27, "�������� ������ ���� ", 27)
	
	MisBeginTalk( "<t>���� ��� � �� ������ ��������� � ������ ������, ������������ ������, �� ��� ���� �� ����� ��������� ��� ��� �������� ����� �������� �������. � ����� - � ������ ��� ������ ����� ���������, �� �������� ������ � ����� ��� ����� ���� ����� ����������. � �������, ��� ������ ��� ������ ����� ��������� ������� �� �����������. ��� - �������� ������.<n><t> � ������ ��������� �������, ��� ������ �������, ������ � ���� 1000 ������. ���������, ��� �� ������ ���� ��..." )
	MisHelpTalk( "<t>���� ��� � �� ������ ��������� � ������ ������, ������������ ������, �� ��� ���� �� ����� ��������� ��� ��� �������� ����� �������� �������. � ����� - � ������ ��� ������ ����� ���������, �� �������� ������ � ����� ��� ����� ���� ����� ����������. � �������, ��� ������ ��� ������ ����� ��������� ������� �����������. ��� - �������� ������.<n><t> � ������ ��������� �������, ��� ������ �������, ������ � ���� 1000 ������. ���������, ��� �� ������ ���� ��..." )
	MisBeginAction( AddMission, 27 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "������ <r������� ������> <j���� �� (3290,2512)> ")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 28, "������������ ���� ", 28)
	
	MisBeginTalk( "<t>���� � �� ��������, �� ��� ����� ���. �� �����������, ��� ��� ������� ������ ��� �� �����. ���� �� � ����� ��� ������ ����, ��� ����� � ����� ����� �������, �� � ������� �� ����� �� ����������. ������, ������� �� ���� � �� �����������. � ������ ���������, ����� �������� ���������� �� ����." )
	MisHelpTalk( "<t>���� � �� ��������, �� ��� ����� ���. �� �����������, ��� ��� ������� ������ ��� �� �����. ���� �� � ����� ��� ������ ����, ��� ����� � ����� ����� �������, �� � ������� �� ����� �� ����������. ������, ������� �� ���� � �� �����������. � ������ ���������, ����� �������� ���������� �� ����." )
	MisBeginAction( AddMission, 28 )
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "���������� � <j������� - ���� (3195,2506)> ")
	
	MisResultCondition( AlwaysFailure )
	
	DefineWorldMission( 29, "�������� ", 29)
	
	MisBeginTalk( "<t>� ���� ���� ������������ � ��������� �� �������� <r������ � �������>. ��� ������� �� ���� ������ ��������. � �� ���� ����������� � ���� �������� ��������� ���, ��������, ���� ����� ����, ��� ����� ��� ������. �� ��� �� �� ������� ��� ������ <r��������� ����� - ���> � ������, �������� �� ������������ ���?" )
	MisHelpTalk( "<t>� ���� ���� ������������ � ��������� �� �������� <r������ � �������>. ��� ������� �� ���� ������ ��������. � �� ���� ����������� � ���� �������� ��������� ���, ��������, ���� ����� ����, ��� ����� ��� ������. �� ��� �� �� ������� ��� ������ <r��������� ����� - ���> � ������, �������� �� ������������ ���?" )
	MisBeginAction( AddMission, 29 )
	MisBeginAction( SetRecord, 381 )
	MisBeginAction( ClearMission, 381 )
	MisBeginAction( TakeItem, 4253, 1, 4 )
	MisBeginAction( GiveItem, 4233, 1,4)
	MisCancelAction(SystemNotice, "������� ������ �������� " )
	MisNeed(MIS_NEED_DESP, "������ ��� <r��������� � �������> <j�������������� ����� - ��� (862, 3303)>")
	
	MisResultCondition( AlwaysFailure )

	DefineWorldMission( 30, "�������� ������ ", 30 )

	MisBeginTalk( "<t>������, ��� ������� <b������ ���������� �����>. ���� �� ���������, ������ � ���� �������������.<n><t>� �� ������� ��������� ����! ������, ������, �� �������, � �������� ����, ��� ������� ��������� �����. ������ ���, ���� �����������: 30 ��������� ������ ������, 30 ������� ������ ������, 30 ������ ������ ������ � 10 ���������� ������ �����. ��, ��� ���. ����� 4 �����������. ����� �� �������� �� ���, ������ ���� � ��� ����������� <b������� �����>, � �� ������� ���� ������� ��� �����.")
	MisHelpTalk( "<t>������, ��� ������� <b������ ���������� �����>. ���� �� ���������, ������ � ���� �������������.<n><t>� �� ������� ��������� ����! ������, ������, �� �������, � �������� ����, ��� ������� ��������� �����. ������ ���, ���� �����������: 30 ��������� ������ ������, 30 ������� ������ ������, 30 ������ ������ ������ � 10 ���������� ������ �����. ��, ��� ���. ����� 4 �����������. ����� �� �������� �� ���, ������ ���� � ��� ����������� <b������� �����>, � �� ������� ���� ������� ��� �����.")
	MisBeginAction(AddMission, 30)
	MisBeginAction(TakeItem, 4256, 1)
	MisBeginAction(AddTrigger, 301, TE_GETITEM, 4938, 30)
	MisBeginAction(AddTrigger, 302, TE_GETITEM, 4957, 30)
	MisBeginAction(AddTrigger, 303, TE_GETITEM, 4976, 30)
	MisBeginAction(AddTrigger, 304, TE_GETITEM, 4974, 10)
	MisCancelAction(SystemNotice, "������� ������ �������� " )

	MisNeed(MIS_NEED_DESP, "������ ���������� ������� � ������� ��������� ����������� <j������� ����� (2664,654)> ")
	MisNeed(MIS_NEED_ITEM, 4938, 30, 1, 30)
	MisNeed(MIS_NEED_ITEM, 4957, 30, 31, 30)
	MisNeed(MIS_NEED_ITEM, 4976, 30, 61, 30)
	MisNeed(MIS_NEED_ITEM, 4974, 10, 91, 10)

	MisResultCondition( AlwaysFailure )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4938 )
	TriggerAction( 1, AddNextFlag, 30, 1, 30 )
	RegCurTrigger( 301 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4957 )
	TriggerAction( 1, AddNextFlag, 30, 31, 30 )
	RegCurTrigger( 302 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4976 )
	TriggerAction( 1, AddNextFlag, 30, 61, 30 )
	RegCurTrigger( 303 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4974 )
	TriggerAction( 1, AddNextFlag, 30, 91, 10 )
	RegCurTrigger( 304 )
end
EudemonMission()