----------------------------------------------
--			������� skoob13					--
----------------------------------------------

print( "����㧪� MissionScript06.lua" )

jp					= JumpPage
amp					= AutoMissionPage
ct					= CloseTalk
am					= AddMission
MissionCheck 		= HasFlag
mc					= MissionCheck

function DuplicateMission001()
	DefineMission( 500, "������ ������� ", 500 )
	
	MisBeginTalk( "� ��� ����� �� ��� ����...���� ��� �������� ��� ����! � �� ���� ���� ��� ����! <n><t>�� ��� �� �� ������ ������� �������� ���� � ���� �������? � �������� ���� ������� ��������." )
	MisBeginCondition(LvCheck, ">", 29 )
	MisBeginCondition(NoMission, 500)
	MisBeginCondition(NoRecord, 500)
	MisBeginAction(AddMission, 500)
	MisBeginAction(AddTrigger, 5001, TE_GETITEM, 3916, 1 )
	MisCancelAction(ClearMission, 500)

	MisNeed(MIS_NEED_DESP, " ���� 1 ��������� ���� ��� ������� � ���� ������� (2222, 2889).")
	MisNeed(MIS_NEED_ITEM, 3916, 1, 10, 1)
		
	MisHelpTalk("���? ��� ������� �� ����� ��������� ���� ����? ��� �� �����? � ��� �� ����� ��� �� ��� � ���� ����� ����������...")
	MisResultTalk("����... ���� �������� ����... ������... �����.. ��.. ��������.")
	MisResultCondition(NoRecord, 500)
	MisResultCondition(HasMission, 500)
	MisResultCondition(HasItem, 3916, 1)
	MisResultAction(TakeItem, 3916, 1)
	MisResultAction(ClearMission, 500)
	MisResultAction(SetRecord, 500)
	MisResultAction(AddExp, 5000, 5000)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3916 )	
	TriggerAction( 1, AddNextFlag, 500, 10, 1 )
	RegCurTrigger( 5001 )


	DefineMission( 501, "��� �������!", 501 )
	
	MisBeginTalk( "<t>\206\233... \223 \237\229 \236\238\227\243 \238\242\226\251\234\237\243\242\252 \238\242 \226\232\237\224! \206\241\242\224\235\224\241\252 \239\238\241\235\229\228\237\255\255 \234\224\239\235\255... \192\233 \242\238\247\237\238 \241\229\234\240\229\242...<n><t>\222\237\251\233 \239\243\242\229\248\229\241\242\226\229\237\237\232\234, \224 \226\251 \231\237\224\229\242\229 \247\242\238 \241\228\229\235\224\229\242 \241 \194\224\236\232 \"\204\229\247\242\224 \196\243\237\234\224\237\224\" \232\231 \193\224\240\224 \192\240\227\229\237\242\224. \193\251\241\242\240\229\229 \239\240\232\242\224\249\232 \236\237\229 \229\227\238!<n><t>\205\229\236\237\238\227\238 \209\224\248\232\236\232 \242\238\230\229 \225\251 \237\229 \239\238\236\229\248\224\235\238... " )
	MisBeginCondition(NoMission, 501)
	MisBeginCondition(NoRecord, 501)
	MisBeginCondition(HasRecord, 500)
	MisBeginAction(AddMission, 501)
	MisBeginAction(AddTrigger, 5011, TE_GETITEM, 3926, 1 )
	MisBeginAction(AddTrigger, 5012, TE_GETITEM, 1478, 20 )
	MisCancelAction(ClearMission, 501)

	MisNeed(MIS_NEED_DESP, " ������ � ������� (2222, 2889) ����� 1 ������� ����� ������� � 20 ������.")
	MisNeed(MIS_NEED_ITEM, 3926, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 1478, 20, 20, 20)
		
	MisHelpTalk("���..���� ������ ����..��...��..����!")
	MisResultTalk(" �.. ����� ������� ����... �� ����� ������! <n><t>����� � ��� ������� �������� ������ �������, � ������ ������ �������������� ����� � ������ ��������. �� ����� � ���� � ����� �� ������� ������� ������� ����� ���� �� ��������. �� ����� �� ���������� �������, �� ������, ����� �� ������� ������� �������, ��� ������ �������� � ���!<n><t>����� ����� �������, �� ������� �������� ������ � ������� �� ���... � ����� �������� ������� � ������� ������ ������� ����� ����������� ��� ��� �������. ����� �������� � ��������� ����� � ���� ������!<n><t>��� �� ����� ����� �� ��� �� ��� ������ ������ ����� ������ �� ����� ������. ���� ���-�� ���� ������ ���������� �������� ������� � ������ �������� �� ���! ��� ��������� ��� ����! ������ � � ��������� ������� ��������� � ����� ������.<n><t>�� �� ������ ���? ���! ������ � ���������� �������, �� ���� ��� ������! ������ ��� ���� ������ ��� �������� �����... ������...")
	MisResultCondition(NoRecord, 501)
	MisResultCondition(HasMission, 501)
	MisResultCondition(HasItem, 3926, 1)
	MisResultCondition(HasItem, 1478, 20)
	MisResultAction(TakeItem, 3926, 1)
	MisResultAction(TakeItem, 1478, 20)
	MisResultAction(ClearMission, 501)
	MisResultAction(SetRecord, 501)
	MisResultAction(AddExp, 10000, 10000)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3926 )	
	TriggerAction( 1, AddNextFlag, 501, 10, 1 )
	RegCurTrigger( 5011 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 1478 )	
	TriggerAction( 1, AddNextFlag, 501, 20, 20 )
	RegCurTrigger( 5012 )

	DefineMission( 502, "����� ������� ", 502 )
	
	MisBeginTalk( "<t>�...����� �������? ������ ������ ����� ��� ��� ����.<n><t>� ��� �������� ���� ������ ����������� 1 ������� ������ ��������, 5 �������� �����, 5 ����-����� � 20 ������ �������. ��� ��� ������� �� ������.<n><t>� � ��� �����, �� ������ 2000 ������." )
	MisBeginCondition(NoMission, 502)
	MisBeginCondition(NoRecord, 502)
	MisBeginCondition(HasRecord, 500)
	MisBeginCondition(HasMission, 501)
	MisBeginAction(AddMission, 502)
	MisBeginAction(AddTrigger, 5021, TE_GETITEM, 4377, 1 )
	MisBeginAction(AddTrigger, 5022, TE_GETITEM, 3121, 5 )
	MisBeginAction(AddTrigger, 5023, TE_GETITEM, 3131, 5 )
	MisBeginAction(AddTrigger, 5024, TE_GETITEM, 4352, 20 )
	MisCancelAction(ClearMission, 502)

	MisNeed(MIS_NEED_ITEM, 4377, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 3121, 5, 15, 5)
	MisNeed(MIS_NEED_ITEM, 3131, 5, 20, 5)
	MisNeed(MIS_NEED_ITEM, 4352, 20, 30, 20)

	MisPrize(MIS_PRIZE_ITEM, 3926, 1, 4)
	MisPrizeSelAll()
		
	MisHelpTalk("���  ����� �������  ��������� ��� �����������... ")
	MisResultTalk("���! ������ ����! ��� ��� �� ��� ����� ������.")
	MisResultCondition(NoRecord, 502)
	MisResultCondition(HasMission, 502)
	MisResultCondition(HasItem, 4377, 1)
	MisResultCondition(HasItem, 3121, 5)
	MisResultCondition(HasItem, 3131, 5)
	MisResultCondition(HasItem, 4352, 20)
	MisResultCondition(HasMoney, 2000 )
	MisResultAction(TakeMoney, 2000 )
	MisResultAction(TakeItem, 4377, 1)
	MisResultAction(TakeItem, 3121, 5)
	MisResultAction(TakeItem, 3131, 5)
	MisResultAction(TakeItem, 4352, 20)
	MisResultAction(ClearMission, 502)
	MisResultAction(SetRecord, 502)
	MisResultAction(AddExp, 20000, 20000)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4377 )	
	TriggerAction( 1, AddNextFlag, 502, 10, 1 )
	RegCurTrigger( 5021 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3121 )	
	TriggerAction( 1, AddNextFlag, 502, 15, 5 )
	RegCurTrigger( 5022 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3131 )	
	TriggerAction( 1, AddNextFlag, 502, 20, 5 )
	RegCurTrigger( 5023 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4352 )	
	TriggerAction( 1, AddNextFlag, 502, 20, 20 )
	RegCurTrigger( 5024 )

	DefineMission( 503, "�������� ������ ���� ", 503 )
	
	MisBeginTalk( "<t>���� ������ ������ ���� ����, � ���� ����. � ��� ��� �� ����, �� �� ������ ���. ��� �� ����� ����� ��������� �������. ������� ��� 10 ������� ������.<n><t>������, �� ������ ������� ����� ��� ����� ������������, ���� �� ���?" )
	MisBeginCondition(NoMission, 503)
	MisBeginCondition(NoRecord, 503)
	MisBeginCondition(HasRecord, 501)
	MisBeginAction(AddMission, 503)
	MisBeginAction(AddTrigger, 5031, TE_GETITEM, 3434, 10 )
	MisBeginAction(AddTrigger, 5032, TE_GETITEM, 3435, 10 )
	MisBeginAction(AddTrigger, 5033, TE_GETITEM, 3436, 10 )
	MisBeginAction(AddTrigger, 5034, TE_GETITEM, 3437, 10 )
	MisCancelAction(ClearMission, 503)

	MisNeed(MIS_NEED_ITEM, 3434, 10, 10, 10)
	MisNeed(MIS_NEED_ITEM, 3435, 10, 20, 10)
	MisNeed(MIS_NEED_ITEM, 3436, 10, 30, 10)
	MisNeed(MIS_NEED_ITEM, 3437, 10, 40, 10)
		
	MisHelpTalk("��� ������ ���������... ��� ���� ���� �� ��� ����������.")
	MisResultTalk("��� ���� ������������...<n><t>� �������� ��� �� ����� ����! ���������, ��� ��� �� ������������ ����. ��� ����� ����� ������� ����������� ������������.<n><t>����� � �������� ������ ��� ����!")
	MisResultCondition(NoRecord, 503)
	MisResultCondition(HasMission, 503)
	MisResultCondition(HasItem, 3434, 10)
	MisResultCondition(HasItem, 3435, 10)
	MisResultCondition(HasItem, 3436, 10)
	MisResultCondition(HasItem, 3437, 10)
	MisResultAction(TakeItem, 3434, 10)
	MisResultAction(TakeItem, 3435, 10)
	MisResultAction(TakeItem, 3436, 10)
	MisResultAction(TakeItem, 3437, 10)
	MisResultAction(ClearMission, 503)
	MisResultAction(SetRecord, 503)
	MisResultAction(AddExp, 80000, 80000)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3434 )	
	TriggerAction( 1, AddNextFlag, 503, 10, 10 )
	RegCurTrigger( 5031 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3435 )	
	TriggerAction( 1, AddNextFlag, 503, 20, 10 )
	RegCurTrigger( 5032 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3436 )	
	TriggerAction( 1, AddNextFlag, 503, 30, 10 )
	RegCurTrigger( 5033 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3437 )	
	TriggerAction( 1, AddNextFlag, 503, 40, 10 )
	RegCurTrigger( 5034 )


	DefineMission(504,"�������� ������� ",504)
	
	MisBeginTalk("<t>��� ������� ���� ��������! � ����� ������ ����! ���� �� ������ ���� ������� ���! � ���� ����� ��� �� �����!<n><t>������ ���� �� ������. ���� �� ����� ��������, ����� �� ��� � ������� �� ���.<n><t>���� ���� ��� ����� ������ ���� ������!")

	MisBeginCondition(NoRecord, 504)
	MisBeginCondition(NoMission, 504)

	MisBeginAction(AddMission, 504)
	MisCancelAction(SystemNotice, "���� ����� �� ����� ���� ������")

	MisHelpTalk("<t>� ������� �� �����, ������� � �� ���� � ��� �������!")
	MisNeed(MIS_NEED_DESP, "����� ������ ��������")
	
	MisResultCondition(AlwaysFailure)

	DefineMission(505,"�������� ������� ",504,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>���� ������ ���� �� ���?<n><t>� ����... � ����� ���...")
	MisResultCondition(HasMission, 504)
	MisBeginCondition(NoRecord, 504)
	
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 25000, 25000)
	MisResultAction(ClearMission, 504)
	MisResultAction(SetRecord, 504)


	DefineMission(506,"������� �������� ",505)

	MisBeginTalk("<t>� ���� ������� ��� ��� ��������, ��� ����� ������ ��� ����. �� ��� ��� ��������? � ��� � ��� ��������! <n><t>�� ���� � ��������! � ����� � ��� �������� �� ������� �������! ��� ��� ���� �����, ��� ���� ��� ��� �����!<n><t>�� ��� �� �� ��� ������� ���?")

	MisBeginCondition(HasRecord, 504)
	MisBeginCondition(NoMission, 505)
	MisBeginCondition(NoRecord, 505)

	MisBeginAction(AddMission, 505)
	MisBeginAction(AddTrigger, 5051, TE_GETITEM, 2415, 1)
	
	MisNeed(MIS_NEED_ITEM, 2415, 1, 10, 1)
	MisCancelAction(SystemNotice, "���� ����� �� ����� ���� ������ ")

	MisHelpTalk("<t>����� �� �� ����� ��� ��������?")

	MisResultTalk("<t>��, ��� ���! ������� ���� ��������.")

	MisResultCondition(HasMission, 505)
	MisResultCondition(HasItem, 2415, 1)
	MisResultCondition(NoRecord,505)

	MisResultAction(AddExp, 250000, 250000)
	MisResultAction(AddMoney, 150000, 150000)
	MisResultAction(ClearMission, 505)
	MisResultAction(TakeItem, 2415,1)
	MisResultAction(SetRecord, 505)

	InitTrigger()
	TriggerCondition(1,IsItem, 2415)
	TriggerAction(1, AddNextFlag, 505, 10, 1)
	RegCurTrigger(5051)


	DefineMission(507,"�������� ����� ",506)
	
	MisBeginTalk("<t>��� ������. � �������� ��� ������ � ���������� �� ���� ��������.<n><t>�� ��� �� �� ������� ������ �����? �� ����� ���� ���!")

	MisBeginCondition(HasRecord, 505)
	MisBeginCondition(NoRecord, 506)
	MisBeginCondition(NoMission, 506)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 506)
	MisBeginAction(GiveItem, 2415,1,4)

	MisHelpTalk("<t>������ ���� �������������.")
	MisNeed(MIS_NEED_DESP, "������ �������� �������� ������ ������� ����� ")

	MisCancelAction(SystemNotice, "��� ������� �� ����� ���� ������� ")

	MisResultCondition(AlwaysFailure)

	DefineMission(508,"�������� ����� ",506, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>�� ����� ��������? �������, ������� ���� �������.<n><t>�������, � ��� ��������? � ��� ���. ������� ����.")
	MisResultCondition(HasMission, 506)
	MisResultCondition(NoRecord,506)
	MisResultCondition(HasItem, 2415, 1)

	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 25000, 25000)

	MisResultAction(TakeItem, 2415, 1)
	MisResultAction(ClearMission, 506)
	MisResultAction(SetRecord, 506)

	DefineMission(509,"�������� ������� ",507)
	
	MisBeginTalk("<t>�� ����� ���� ������, � ���� ������ ���������� ������. ������ �� �� ������ ��� � ����?<n><t>��� ������ ����� ������� ������ � ���������� ������� ���.")

	MisBeginCondition(HasRecord, 506)
	MisBeginCondition(NoRecord, 507)
	MisBeginCondition(NoMission, 507)

	MisBeginAction(AddMission, 507)
	MisBeginAction(AddTrigger, 5071, TE_GETITEM, 2384, 1)

	MisNeed(MIS_NEED_ITEM, 2384, 1, 10, 1)

	MisCancelAction(SystemNotice, "���� ����� �� ����� ���� ������ ")
	MisHelpTalk("<t>...��� ����� ����� ��� ����. ���. �� ������ ��� ���������� ������?")

	MisResultTalk("<t>��� �� ��� � �����, �� ��� �������� ��������.")

	MisResultCondition(HasMission, 507)
	MisResultCondition(HasItem, 2384, 1)
	MisResultCondition(NoRecord, 507)

	MisResultAction(TakeItem, 2384, 1)
	MisResultAction(AddExp, 200000, 200000)
	MisResultAction(AddMoney, 100000, 100000)

	MisResultAction(ClearMission, 507)
	MisResultAction(SetRecord, 507)

	InitTrigger()
	TriggerCondition(1, IsItem, 2384)
	TriggerAction(1, AddNextFlag, 507, 10, 1)
	RegCurTrigger(5071)

	DefineMission(573,"���������� ������ ",508)
	
	MisBeginTalk("<t>��� ������ �� ������ �� ��� � �����. � �������� �� ������� ����.<n><t>����...�� ��� �� �� ������� ��� � ����� �������? �� ����� ������ �� �� ���.")
	
	MisBeginBagNeed(1)
	MisBeginCondition(HasRecord, 507)
	MisBeginCondition(NoRecord, 508)
	MisBeginCondition(NoMission, 508)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 508)
	MisBeginAction(GiveItem, 2384, 1,4)

	MisCancelAction(SystemNotice, "���� ����� �� ����� ���� ������ ")

	MisHelpTalk("<t>��� ������ ����? ��� �� ��� �� ��� � ����?")
	MisNeed(MIS_NEED_DESP, "������� ��� ������ ����� ������� ")

	MisResultCondition(AlwaysFailure)


	DefineMission(574,"���������� ������ ", 508,COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)
	MisResultTalk("<t>���-�� � ��������! ��� ������ � ������� ���������� ����.<n><t>������ ������ ������ ������ ���...���� ������ ������� ���� ��� ����...")
	MisResultCondition(HasMission, 508)
	MisResultCondition(NoRecord, 508)
	MisResultCondition(HasItem, 2384, 1)

	MisResultAction(AddMoney, 25000, 25000)
	MisResultAction(TakeItem, 2384, 1)
	MisResultAction(ClearMission, 508)
	MisResultAction(SetRecord, 508)


	DefineMission(575,"������ ������ ����� ",509)
	
	MisBeginTalk("<t>� ������ ������� ������� � ���������� ������. �������� ����������� �� ����������� ��������.<n><t>� ����� �� ������ ������ �������.")

	MisBeginCondition(HasRecord, 508)
	MisBeginCondition(NoRecord, 509)
	MisBeginCondition(NoMission, 509)

	MisBeginAction(AddMission, 509)
	
	MisHelpTalk("<t>�� ��� �������� �������? ��� ����� ����������� ���� �� ��������!")
	MisNeed(MIS_NEED_DESP, "������ ����� ������� ��������� ��������� �����������.")
	
	MisCancelAction(SystemNotice, "���� ����� �� ����� ���� ������.")

	MisResultCondition(AlwaysFailure)

	DefineMission(576, "������ ������ ����� ", 509,COMPLETE_SHOW)
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>���� ��� �� ����? ���! �� ����� ������� ���� ������? ����� �� ������!<n><t>���... ������ ������� ��� �����?<n><t>������, �� ����� �� ����� ����� ���� � ��� ���� ����... � ���� ������������� ����������� �����.")

	MisResultCondition(HasMission, 509)
	MisResultCondition(NoRecord, 509)

	MisResultAction(AddMoney, 25000, 25000)
	MisResultAction(ClearMission, 509)
	MisResultAction(SetRecord, 509)

	DefineMission(577,"������� ���������� � ����� ",510)
	
	MisBeginTalk("<t>���� �� ������ ���� ������� ���! � ����� ������� ����������� ���� �������, �� ��� ��������� ���� ������ ��� ������!<n><t>�� ��� �� �� ������� ��� �������?<n><t>����! ��� �� ����� �������. ���������� ����� ��� ������� �� ������. ��� ������� �� ��������!")

	MisBeginCondition(HasRecord, 509)
	MisBeginCondition(NoRecord, 510)
	MisBeginCondition(NoMission, 510)
	
	MisBeginAction(AddMission, 510)
	MisBeginAction(AddTrigger, 5101, TE_GETITEM, 2416, 1)
	MisNeed(MIS_NEED_ITEM, 2416, 1, 10, 1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������ ")

	MisHelpTalk("<t>���� �� �� ������� ��� ������, � �� ������ �����.")

	MisResultTalk("<t>����� �����! � ���� ������� ����������� �������� ���� �� ������ ��� ������!")

	MisResultCondition(HasMission, 510)
	MisResultCondition(NoRecord, 510)
	MisResultCondition(HasItem, 2416, 1)
	
	MisResultAction(TakeItem, 2416, 1)
	MisResultAction(AddExp, 30000, 30000)
	MisResultAction(AddMoney, 35000, 35000)
	MisResultAction(ClearMission, 510)
	MisResultAction(SetRecord, 510)
	
	InitTrigger()
	TriggerCondition(1, IsItem, 2416)
	TriggerAction(1, AddNextFlag, 510, 10, 1)
	RegCurTrigger(5101)

	DefineMission(578,"������� ���������� � ����� ",511)
	
	MisBeginTalk("<t>��� � � ������� �����... � ����� �������...<n><t>�� � ����� ����������� � ��� �� ���� ������� �� �����������... �� ��� �� �� �������� �� ��� ������... �������� �� �� �������...<n><t>� ���� ����������� ���.... ���� ��� ������ ��� ������... �� �����..... �� ����� ��������.")

	MisBeginCondition(HasRecord, 510)
	MisBeginCondition(NoRecord, 511)
	MisBeginCondition(NoMission, 511)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 511)
	MisBeginAction(GiveItem, 2416, 1,4)
	MisHelpTalk("<t>��������... �������...")
	MisNeed(MIS_NEED_DESP, "<t>������ ����������� ���������� � ����� � ��������.")

	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisResultCondition(AlwaysFailure)

	DefineMission(579, "������� ���������� � ����� ", 511,COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)
	
	MisResultTalk("<t>������� ����������... �� � ���� �� ����...")
	MisResultCondition(HasMission, 511)
	MisResultCondition(NoRecord, 511)
	MisResultCondition(HasItem, 2416, 1)

	MisResultAction(AddMoney, 35000, 35000)
	MisResultAction(TakeItem, 2416, 1)
	MisResultAction(ClearMission, 511)
	MisResultAction(SetRecord, 511)

	DefineMission(580,"������� �������� ",512)

	MisBeginTalk("<t>� �������� ���� �����.<n><t>��� ���� ���������� � ������. � �� ���� ��� �������������, �� ��� �� �� ������� � ���� � ��������� ���? � �� ���� ��������.<n><t>� ���� �������� ��� �� �� �����!")

	MisBeginCondition(HasRecord, 511)
	MisBeginCondition(NoRecord, 512)
	MisBeginCondition(NoMission, 512)
	
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")
	MisBeginAction(AddMission, 512)
	MisHelpTalk("<t>� �������������� ��� ���������� �����...")
	MisNeed(MIS_NEED_DESP, "������ ��������. ����� �������� �����.")

	MisResultCondition(AlwaysFailure)


	DefineMission(581, "������� �������� ", 512,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>����� �������� ������� ����?<n><t>� ��� ���-�� ���������? � ���� ���� ���� �������, �� ��� �� ������������. ����� ��� �� ��� �� ������������.")

	MisResultCondition(HasMission, 512)
	MisResultCondition(NoRecord, 512)
	
	MisResultAction(AddMoney, 35000, 35000)
	MisResultAction(ClearMission, 512)
	MisResultAction(SetRecord, 512)

	DefineMission(582,"��������� ",513)

	MisBeginTalk("<t>��������� ������� �� �����, ������ ���� ������� ���. ��� �������� ��������� �� ��� ��� ��� ����.<n><t>�� ��� �� �� ������� ��� ��� ���������, � �������� �������� ����� ���������.<n><t>�� ���� ��� ���� ��� �� �������� ��������, ����.<n><t>����� � ���� ��, ��� �������� �� ������ ���������. � ����, ��� ��� ����������� ������� ������, � ������� ���� ������, ����� ������� ����� ���������.")
	
	MisBeginCondition(HasRecord, 512)
	MisBeginCondition(NoRecord, 513)
	MisBeginCondition(NoMission, 513)
	
	MisBeginAction(AddMission, 513)
	MisBeginAction(AddTrigger, 5131,TE_GETITEM, 2417, 1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisNeed(MIS_NEED_ITEM, 2417, 1, 10, 1)

	MisHelpTalk("<t>�� ������ ��� ���������?")

	MisResultTalk("<t> ��� ��� ����������... ��� ������������� ������ ���������. ������� ��� ���������� �������� ���.<n><t>!^($......%*#oa2......1&s?~*#^%!...... (������ ����� �������� �� �����-�� �������� � �� �������� �����!) �������! ��������� �����!")

	MisResultCondition(HasMission, 513)
	MisResultCondition(NoRecord, 513)
	MisResultCondition(HasItem, 2417, 1)
	
	MisResultAction(TakeItem, 2417, 1)
	MisResultAction(AddExp, 500000, 500000)
	MisResultAction(AddMoney, 800000, 800000)
	MisResultAction(ClearMission, 513)
	MisResultAction(SetRecord, 513)

	InitTrigger()
	TriggerCondition(1, IsItem, 2417)
	TriggerAction(1, AddNextFlag, 513, 10, 1)
	RegCurTrigger(5131)


	DefineMission(583,"��������� ",514)
	
	MisBeginTalk("<t>�� ����� ���������. �� ��� ��� �������� ������ �������.<n><t>��� �� ��������� � ���������� ������, ��� �� ������ ������������� ���!<n><t>������� ����� ������� ����������� ���! �� ������� ������ �� ���� �����.")

	MisBeginCondition(HasRecord, 513)
	MisBeginCondition(NoRecord, 514)
	MisBeginCondition(NoMission, 514)

	MisBeginAction(AddMission, 514)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisHelpTalk("<t>������ �� ��� �� �����?! ��� ������ �������! ���� �������!")
	MisNeed(MIS_NEED_DESP, "���������� ����� �� ����� �������, ��� ��������� ���� �����.")

	MisResultCondition(AlwaysFailure)

	DefineMission(584, "��������� ", 514,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>������. ������ �����������. �� � ����?")
	MisResultCondition(HasMission, 514)
	MisResultCondition(NoRecord, 514)

	MisResultAction(AddMoney, 30000, 30000)
	MisResultAction(ClearMission, 514)
	MisResultAction(SetRecord, 514)

	DefineMission(585,"��������� ������� ",515)
	
	MisBeginTalk("<t>����� �����������! � ������ ��! ��� ���� ����������!<n><t>��� ����, ������� ����� ����� �� ��������� ������ ������ ������� �� ��� �� �����, �� ���� �� ������ ��� ��� ������ � ������� ����!<n><t>�� ������ ������� ������ ���������!")
	MisBeginCondition(HasRecord, 514)
	MisBeginCondition(NoRecord, 515)
	MisBeginCondition(NoMission,515)
	
	MisBeginAction(AddMission, 515)
	MisBeginAction(AddTrigger, 5151, TE_KILL, 805, 1)
	MisBeginAction(AddTrigger, 5152, TE_GETITEM, 2428, 1)

	MisNeed(MIS_NEED_KILL, 805, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2428, 1,20, 1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisHelpTalk("<t>������ ���������!")

	MisResultTalk("<t>�������! � ����� ������� ������ ����������!")

	MisResultCondition(HasMission, 515)
	MisResultCondition(HasFlag, 515, 10)
	MisResultCondition(HasItem, 2428,1)
	MisResultCondition(NoRecord, 515)

	MisResultAction(TakeItem, 2428, 1)
	MisResultAction(ClearMission, 515)
	MisResultAction(SetRecord, 515)

	MisResultAction(AddExp, 500000,500000)
	MisResultAction(AddMoney, 800000,800000)

	InitTrigger()
	TriggerCondition(1,IsMonster, 805)
	TriggerAction(1,AddNextFlag, 515, 10, 1)
	RegCurTrigger(5151)

	InitTrigger()
	TriggerCondition(1, IsItem, 2428)
	TriggerAction(1, AddNextFlag , 515, 20, 1)
	RegCurTrigger(5152)


	DefineMission(586,"������� ",516)
	
	MisBeginTalk("<t>���, �������-�� �����������. � ������, ��� ���� � �������� ����������, �������.<n><t>� ��� �� ������� ��� �������. ������ �� �� ������� ��� �� ����� �����?<n><t>...���-�� ���� ����� ��� ����� �������?")

	MisBeginCondition(HasRecord, 515)
	MisBeginCondition(NoRecord, 516)
	MisBeginCondition(NoMission, 516)
	MisBeginBagNeed(1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisBeginAction(AddMission, 516)
	MisBeginAction(GiveItem, 2433, 1,4)
	MisHelpTalk("<t> ���... ������ � �������... �����!")
	MisNeed(MIS_NEED_DESP, "������ ������� �� ����� �������� � �������� �� �� ��������.")
	
	MisResultCondition(AlwaysFailure)

	DefineMission(587,"������� ",516,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>���...! ������� �� �����! �����-�� ������� ���!<n><t>���!!! ������ �������� �������...��� �� ���!")
	MisResultCondition(HasMission, 516)
	MisResultCondition(NoRecord, 516)
	MisResultCondition(HasItem, 2433, 1)
	
	MisResultAction(TakeItem, 2433, 1)
	MisResultAction(AddMoney, 30000, 30000)
	MisResultAction(ClearMission, 516)
	MisResultAction(SetRecord, 516)

	DefineMission(588,"������ �� ������ ",517)
	
	MisBeginTalk("<t>������ ��� ��� ���...<n><t>����� ��� ������ �������� �����������, � ������� �� ������ ��� �������.")

	MisBeginCondition(HasRecord, 516)
	MisBeginCondition(NoRecord, 517)
	MisBeginCondition(NoMission, 517)
	MisBeginBagNeed(1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisBeginAction(AddMission, 517)
	MisBeginAction(GiveItem, 2416, 1,4)
	MisHelpTalk("<t>���� ������� �� ������� �����...? ��...) ")
	MisNeed(MIS_NEED_DESP, "������ �������� ������� ������ �����������.")
	
	MisResultCondition(AlwaysFailure)

	DefineMission(589,"������ �� ������ ",517,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>��� ������� ������ �������...n><t>����� ���� �������, ���� ��� ����� ������ ��� �� ���������...<n><t>������ ������������, ��� ��������...")
	MisResultCondition(HasMission, 517)
	MisResultCondition(NoRecord, 517)
	MisResultCondition(HasItem, 2416, 1)
	
	MisResultAction(TakeItem, 2416, 1)
	MisResultAction(AddMoney, 30000, 30000)
	MisResultAction(ClearMission, 517)
	MisResultAction(SetRecord, 517)

	DefineMission(590,"������������� ���������� ",518)
	
	MisBeginTalk("<t>� ����� � �����... ���� ��� ������������� ����� ���� ����� ����� ��������� ���.<n><t>������ ��� ������� �� � ����� ��� � �� �����.")

	MisBeginCondition(HasRecord, 517)
	MisBeginCondition(NoRecord, 518)
	MisBeginCondition(NoMission, 518)
	MisBeginBagNeed(1)
	MisCancelAction(SystemNotice, "������ ����� �� ����� ���� ������.")

	MisBeginAction(AddMission, 518)
	MisBeginAction(GiveItem, 2435, 1,4)
	MisHelpTalk("<t>��������! � �������, ��� ������ ������ ��� � ��������� �����.")
	MisNeed(MIS_NEED_DESP, "������ ������� ����������� ��������.")
	
	MisResultCondition(AlwaysFailure)

	DefineMission(591,"������������� ���������� ",518,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>������� ������... �� ������ ������� �������.<n><t>������� ���...")
	MisResultCondition(HasMission, 518)
	MisResultCondition(NoRecord, 518)
	MisResultCondition(HasItem, 2435, 1)
	
	MisResultAction(TakeItem, 2435, 1)
	MisResultAction(AddMoney,300000, 300000)
	MisResultAction(ClearMission, 518)
	MisResultAction(SetRecord, 518)
end 
DuplicateMission001()