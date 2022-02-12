print( "����㧪� MissionScript04.lua" )

jp= JumpPage
amp=AutoMissionPage
ct=CloseTalk
am=AddMission
MissionCheck = HasFlag
mc=MissionCheck

function CenterMission001()

	DefineMission( 400, "���������� �������� ", 400 )
	
	MisBeginTalk( "<t>������� ��� - ��� ������� �����, ������ ��������� � �������� ��������.<n><t>����, ��� ���������, <b�����>, ����� ����� � <p�������> ������������� �� ���� ����. �� ����� �� �� �� ��������� ��� � ���������� ��� ���� ��� ������� ���������?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 400)
	MisBeginCondition(NoMission, 400)
	MisBeginAction(AddMission, 400)
	MisCancelAction(ClearMission, 400)
		
	MisNeed(MIS_NEED_DESP, " ���������� � <b�����> � (1893, 2812)")
	
	MisHelpTalk(" ����� ������ ������ ����� ����, � ������� � ���� �� ������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 401, "���������� �������� ", 400, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t>������! ��������� �� ����� � �������, ��� ������ ��� ����. ��� ���������� � ��� �������� � ���� ������.")
	MisResultCondition(NoRecord, 400)
	MisResultCondition(HasMission, 400)
	MisResultAction(ClearMission, 400 )
	MisResultAction(SetRecord, 400 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)



	DefineMission( 402, "��������� �������� ", 401 )
	
	MisBeginTalk( "<t>������! �� �������� �� �����! � ��� ��� ������ � ������ �� ������ ����������� � ����������� ����������. ��� ��������� � ��� ���� ������ ��� ��� �� ���������� �������. �� �� ����� ���. <n> <t> �� ����� � �� ����� <b�������> � <p������> � �������� ��� �� ��� ���������?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 401)
	MisBeginCondition(NoMission, 401)
	MisBeginAction(AddMission, 401)
	MisCancelAction(ClearMission, 401)
		
	MisNeed(MIS_NEED_DESP, " ���������� � <b��������> � <p������> (789, 3112)")
	
	MisHelpTalk( " ��! �� ��� ���? �� ����� �������?")
	MisResultCondition(AlwaysFailure )

	DefineMission( 403, "��������� �������� ", 401, COMPLETE_SHOW )--��������� ��������
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�, ��� ������ ��� �������� ����, ��� ��� ���������, � �� ����� �� ��������� �������� ������� �� ������ �������. �� ����������, ��� ������ ���� �������, �� ����������� ���������� � ������, � �� �� ������� ����������� ���������� ������, � ��������� � ������� ��� ������� ������!")
	MisResultCondition(NoRecord, 401)
	MisResultCondition(HasMission, 401)
	MisResultAction(ClearMission, 401 )
	MisResultAction(SetRecord, 401 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)



	DefineMission( 404, "������������ ������ ", 402 )--������������ ������
	
	MisBeginTalk( "<t>������ ��� ����, �� ������������ ������. ��� ��������� �������� ������ ��� �� ���������.<n><t>� ������ ��� � <p�������� ����> �������� �������� ������ � ����� �� ������ �� ������. ������ �� � ��� �� ����������� � ��� �������������? � ������ ��� ���������������� ������ <b����>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 402)
	MisBeginCondition(NoMission, 402)
	MisBeginAction(AddMission, 402)
	MisCancelAction(ClearMission, 402)
		
	MisNeed(MIS_NEED_DESP, " ����� ������� � (798, 369).")
	
	MisHelpTalk( " ���������� ����� ������� ��� ����� ������. ���, ������, � ���������� ������ ����� ����� �� ������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 405, "������������ ������ ", 402, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� �� ���������� � ����� ������������ ��� ��� ��� ������ ��� <b������> �� ���.<n><t>�� ������� ���� ���������� ��� �� ��� ������������.")
	MisResultCondition(NoRecord, 402)
	MisResultCondition(HasMission, 402)
	MisResultAction(ClearMission, 402 )
	MisResultAction(SetRecord, 402 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 406, "� �������!", 403 )---� �������
	
	MisBeginTalk( "<t>������! � �� �������� ��� ������ ����� ��� ��.<n><t>������� � ������ ������ ��� ��� ��� �� ���������. ���� ��� ���������, � ���� ������������� ��� <b����������> � <p������>, ��� ��� ��� ����� ������� �����." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 403)
	MisBeginCondition(NoMission, 403)
	MisBeginAction(AddMission, 403)
	MisCancelAction(ClearMission, 403)
		
	MisNeed(MIS_NEED_DESP, " ������������� � <b����������> � ����� (779, 3098)")
	
	MisHelpTalk(" �� ������� ����������, �� �����������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 407, "� �������!", 403, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t> � �� �������� �� ����� ������. � ��� ��� �������, ��� ������� ��� ��������� ������!")
	MisResultCondition(NoRecord, 403)
	MisResultCondition(HasMission, 403)
	MisResultAction(ClearMission, 403 )
	MisResultAction(SetRecord, 403 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 408, "����������� � ������� ", 404 )
	
	MisBeginTalk( "<t>���������� ����. ������ ����� �������� �����, �� �������� ���������. <n> <t> ���� �� <p����> ������� ������ � ����. <n> <t>, ���� �� �� ������, ������ ���������� � ��������� ������ �� ������ <b�������>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 404)
	MisBeginCondition(NoMission, 404)
	MisBeginAction(AddMission, 404)
	MisCancelAction(ClearMission, 404)
		
	MisNeed(MIS_NEED_DESP, " ���������� � <b������> (1894, 2798)")
	
	MisHelpTalk(" ������������� � ������ � ����� � ���������� � �������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 409, "����������� � ������� ", 404, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� ���� � ���, � ��� ��� ��� ��� �������� �� ��� <b������>.")
	MisResultCondition(NoRecord, 404)
	MisResultCondition(HasMission, 404)
	MisResultAction(ClearMission, 404 )
	MisResultAction(SetRecord, 404 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 410, "������� ����-����� ", 405 )
	
	MisBeginTalk( "<t>��! �� �� �����.<n><t><b�������> � ���� � <p������� ����> �� ���������� ���� ������.<n><t> ������������� ������ � �������� ��." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 405)
	MisBeginCondition(NoMission, 405)
	MisBeginAction(AddMission, 405)
	MisCancelAction(ClearMission, 405)
		
	MisNeed(MIS_NEED_DESP, " ������� ������� � (803,352)")
	
	MisHelpTalk(" ���� �� ��� ����������� �������, ������� ����� ���������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 411, "������� ����-����� ", 405, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� � ��� ���� ��� ��� ��� ������������ <b�������>.<n><t>�� ������� ������, ������ � ���� ���� ��� ��� �������.")
	MisResultCondition(NoRecord, 405)
	MisResultCondition(HasMission, 405 )
	MisResultAction(ClearMission, 405 )
	MisResultAction(SetRecord, 405 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 412, "�������� �������� ", 406 )
	
	MisBeginTalk( "<t>������, ��� ����� ���� ������. � ������� �� �������� ������ � <p�����>. ������ ������� ����� ������ ����� �������� � �������� �� ���� ����� ������ ���. �� ���� �� �� �� ��������� <b�������> � ������, ��� �� �� ��� ��������� � ������ ����?" )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 406)
	MisBeginCondition(NoMission, 406)
	MisBeginAction(AddMission, 406)
	MisCancelAction(ClearMission, 406)
		
	MisNeed(MIS_NEED_DESP, " ����� <p�������> (789, 3112)")
	
	MisHelpTalk(" �� ��� ���? ������������� �� ������ ������� � �����.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 413, "�������� �������� ", 406, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������� �������! ��� ���� ��������, �� �� ������ �� �� ��������� ������.")
	MisResultCondition(NoRecord, 406)
	MisResultCondition(HasMission, 406 )
	MisResultAction(ClearMission, 406 )
	MisResultAction(SetRecord, 406 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 414, "������ ����� ", 407 )
	
	MisBeginTalk( "<t>���������� ����. ������ - ������� �����, � �� ����� � �� ����� ����������, ���� ������ ��� ��������. <n> <t> <p������> ������� ������ ����. <n> <t>, ������������� � ��������� ������ � ��������  <b�������>." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 407)
	MisBeginCondition(NoMission, 407)
	MisBeginAction(AddMission, 407)
	MisCancelAction(ClearMission, 407)
		
	MisNeed(MIS_NEED_DESP, " ������� ������� � ���� (1894, 2798)")
	
	MisHelpTalk( " �� �� ����� �������? ������������� � ����� � ������� ���!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 415, "������ ����� ", 407, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�! �� �� <b�������>. � ��������� ����� �� ���� ���� ���� �������.<n><t>�� ��� ��� �� - �����... ������...")
	MisResultCondition(NoRecord, 407)
	MisResultCondition(HasMission, 407 )
	MisResultAction(ClearMission, 407 )
	MisResultAction(SetRecord, 407 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 416, "������������� ��� ", 408 )
	
	MisBeginTalk( "<t>����� ��� �������!<n><t>��� ������� ����, <b����� ����>, ��������  � <p������� ���> 10 ��� �����. ������, ������� ������ ��� �� �����.<n><t>������������� � ���� � ��������� �� ��������������." )
	MisBeginCondition( LvCheck, ">", 9 )
	MisBeginCondition(NoRecord, 408)
	MisBeginCondition(NoMission, 408)
	MisBeginAction(AddMission, 408)
	MisCancelAction(ClearMission, 408)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ����� ���� � (795,363)")
	
	MisHelpTalk(" �� ��� �� ��? ������������� � ������ � ����� ����!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 417, "������������� ��� ", 408, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������� ��� �������, ��� �������������� ���� ��� ���!")
	MisResultCondition(NoRecord, 408)
	MisResultCondition(HasMission, 408 )
	MisResultAction(ClearMission, 408 )
	MisResultAction(SetRecord, 408 )
	MisResultAction(AddExp, 100, 100)
	MisResultAction(AddMoney, 300, 300)


	DefineMission( 418, "������������ �������� ", 409 )
	
	MisBeginTalk( "<t>������, � ���� �� �� ���������� � ������������.<n><t>�� ��� �� ����� ��� ����������������. ������� <p�������> � <p���� ������>. � �� ���� ��� ��� ���� �������." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 409)
	MisBeginCondition(NoMission, 409)
	MisBeginAction(AddMission, 409)
	MisCancelAction(ClearMission, 409)
		
	MisNeed(MIS_NEED_DESP, " ���������� � <p��������> �(1535,3071)")
	
	MisHelpTalk(" ������������� � ���� ������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 419, "������������ ��������", 409, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��� ��������������� <b�������>, ����� � ����� ����� ��� ��� ������.")
	MisResultCondition(NoRecord, 409)
	MisResultCondition(HasMission, 409 )
	MisResultAction(ClearMission, 409 )
	MisResultAction(SetRecord, 409 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)



	DefineMission( 420, "����������� �� ������", 410 )
	
	MisBeginTalk( "<t>��, � ��� ����.<n><t>� ��� ��� ����� �������. ��� ��������� �������� ��� �������� ������ ������.<n><t>����� <b������> �� ������ ��� ����� �������." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 410)
	MisBeginCondition(NoMission, 410)
	MisBeginAction(AddMission, 410)
	MisCancelAction(ClearMission, 410)
		
	MisNeed(MIS_NEED_DESP, " ����� <b������> � (1202, 3179)")
	
	MisHelpTalk(" ��� ���� �� �����! ������������� �� ������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 421, "����������� �� ������", 410, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��, � ������ � ���. <b������> ��� �� ������� � ��������.<n><t>�� ������� ������, �������� � ���� ����� ��� ��� ��������.")
	MisResultCondition(NoRecord, 410)
	MisResultCondition(HasMission, 410 )
	MisResultAction(ClearMission, 410 )
	MisResultAction(SetRecord, 410 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 422, "� ������� ������������� ", 411 )
	
	MisBeginTalk( "<t>������! �� ��������� ���������������, ����� �� �� ������ ����� ��� ���� ���������� �� ����? ��������� ����������� ��� �  <b�������> � <p���������>.<n><t>� ���� ���� ������� ������ ��� ���, �� �������� ���� ����!" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 411)
	MisBeginCondition(NoMission, 411)
	MisBeginAction(AddMission, 411)
	MisCancelAction(ClearMission, 411)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������� (1059, 661)")
	
	MisHelpTalk( " ������������� � ���������, ����� �� ����� ����� �����!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 423, "� ������� ������������� ", 411, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��� ��� ��� ������������ <b��� ���>, �� � ��� ��� ���������.")
	MisResultCondition(NoRecord, 411)
	MisResultCondition(HasMission, 411 )
	MisResultAction(ClearMission, 411 )
	MisResultAction(SetRecord, 411 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 424, "������ ������������ ", 412 )
	
	MisBeginTalk( "<t>������! � ���� �� ������ �����������.<n><t>�� ��� ��� ��� �� �����.<n><t>��������� <p���� ������>. ��� �� ������� ����� <b����������> � ���� �� ����� ������� �� ����� ��������� ��� ���." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 412)
	MisBeginCondition(NoMission, 412)
	MisBeginAction(AddMission, 412)
	MisCancelAction(ClearMission, 412)
		
	MisNeed(MIS_NEED_DESP, " ����� ���������� � (1526,3089)")
	
	MisHelpTalk( " ������������� � ���������� ����������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 425, "������ ������������ ", 412, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t><b�������> ����� ���� ����� ���������.<n><t>� ���� �� ��� ��������, ������ �� ��� ������������� ���������.")
	MisResultCondition(NoRecord, 412)
	MisResultCondition(HasMission, 412 )
	MisResultAction(ClearMission, 412 )
	MisResultAction(SetRecord, 412 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 426, "������� ������� ", 413 )
	
	MisBeginTalk( "<t>������, � ���� ���� ��� ��� �������, <b������>, ��� ������ ����� ��������� ��������� ���� �����, ���� ����� ���������. ������ �� �  <p���� ������> �������� ���� �������.<n><t>� ��������� � �� ���� � ���� �������� � �����, �� ����� �� �� ��������� ��� �� ����� �����?" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 413)
	MisBeginCondition(NoMission, 413)
	MisBeginAction(AddMission, 413)
	MisCancelAction(ClearMission, 413)
		
	MisNeed(MIS_NEED_DESP, " ��������� ������ (1202,3179)")
	
	MisHelpTalk( " ������������� � ���� ������ � ����� �����!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 427, "������� ������� ", 413, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������! ������ ��� ��� �� ������! �� ���������� �� ����, ����� ���� ���� � ���� ����� ����� ���.<n><t>������� �� ������!")
	MisResultCondition(NoRecord, 413)
	MisResultCondition(HasMission, 413 )
	MisResultAction(ClearMission, 413 )
	MisResultAction(SetRecord, 413 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 428, "������� ��� �������� ", 414 )
	
	MisBeginTalk( "<t>������. ��� ���� ������� ��� ����� ���������� �� �� ��� �� ��� ��� �������.<n><t>������ � <p���������> �� ����� �� ����� ������ ������� �������.<n><t>������� <b����>, �������� ���!" )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 414)
	MisBeginCondition(NoMission, 414)
	MisBeginAction(AddMission, 414)
	MisCancelAction(ClearMission, 414)
		
	MisNeed(MIS_NEED_DESP, " ������ ���� (1037, 671)")
	
	MisHelpTalk(" ������ ��������� ��������� � ���! n><t>�� ������� ��� �����.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 429, "������� ��� �������� ", 414, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������! ��� ������ ��� �� ��������.<n><t>�� ������� ������, � ���� ���� ���� ������� ��� ���!")
	MisResultCondition(NoRecord, 414)
	MisResultCondition(HasMission, 414 )
	MisResultAction(ClearMission, 414 )
	MisResultAction(SetRecord, 414 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 430, "����������� ", 415 )
	
	MisBeginTalk( "<t>���� �� ��� � ������ ������ ��������������� ������� ������ � ������� �� �������� �� ���� ����.<n><t>������ �� ��� �� ����������� � ��������� �����������, ������ ������ � ����������? ��� ������, <b�����������>, � ��������� ����� ���� � <p���� ������>.<n><t>������������� � ���� � ������� ��� �� �� ����, �� ����� ��� ��� �������." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 415)
	MisBeginCondition(NoMission, 415)
	MisBeginAction(AddMission, 415)
	MisCancelAction(ClearMission, 415)
		
	MisNeed(MIS_NEED_DESP, " ����� ������������ � ���� ������ (1526,3089)")
	
	MisHelpTalk(" � ��� ��� ��������, ������ ��������������� ������� ������! ������������� � ���� ������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 431, "����������� ", 415, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�! ��� ������ �� ��� ��� �������? ���������� ���� ��� ��� ����.")
	MisResultCondition(NoRecord, 415)
	MisResultCondition(HasMission, 415 )
	MisResultAction(ClearMission, 415 )
	MisResultAction(SetRecord, 415 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)



	DefineMission( 432, "������������ ������� ", 416 )
	
	MisBeginTalk( "<t>� ���� ��� �� �������� �����, �� ��� ��� ������ ������. ������������� � <p���� ������> � ������� <b����>. <n> <t> ��� ��� ������ ����������." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 416)
	MisBeginCondition(NoMission, 416)
	MisBeginAction(AddMission, 416)
	MisCancelAction(ClearMission, 416)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ���� (1209, 3196)" )
	
	MisHelpTalk( " ���? �� ��� ���? ���� �� ����� ����� ����� ���!" )
	MisResultCondition(AlwaysFailure )


	DefineMission( 433, "������������ ������� ", 416, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>���� ���� � ���� <b����> ��� �� ��� ��������� ��� ��� �� ������, ��� � ���� ��������� � ��� � ����, ��� ��������� �������� ���, ��� �� � ���� ��� ����� ����������� �����!")
	MisResultCondition(NoRecord, 416)
	MisResultCondition(HasMission, 416 )
	MisResultAction(ClearMission, 416 )
	MisResultAction(SetRecord, 416 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 434, "����������� �� �� ", 417 )
	
	MisBeginTalk( "<t>���� �� ��� � ������ ������ ��������������� ������� ������ � ������� �� �������� �� ���� ����.<n><t>������ �� ��� �� ����������� � ��������� �����������, ������ ������ � ����������? ��� ������, <b��������>, � ��������� ����� ���� � <p���������>.<n><t>������������� � ���� � ������� ��� �� �� ����, �� ����� ��� ��� �������." )
	MisBeginCondition( LvCheck, ">", 19 )
	MisBeginCondition(NoRecord, 417)
	MisBeginCondition(NoMission, 417)
	MisBeginAction(AddMission, 417)
	MisCancelAction(ClearMission, 417)
		
	MisNeed(MIS_NEED_DESP, " ����� ��������� (1028, 649)")
	
	MisHelpTalk(" ����� �� � ������� ���������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 435, "����������� �� �� ", 417, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��, �� ������� ������, ���������, �� ����� � ����� ����� ��� ��� ������.")
	MisResultCondition(NoRecord, 417)
	MisResultCondition(HasMission, 417 )
	MisResultAction(ClearMission, 417 )
	MisResultAction(SetRecord, 417 )
	MisResultAction(AddExp, 500, 500)
	MisResultAction(AddMoney, 550, 550)


	DefineMission( 436, "����� � ���� ", 418 )
	
	MisBeginTalk( "<t>�! ��� ���� �����, �� �������� ��� ��� �� �� ������ � ������!?<n><t>������������� � <p������> � <b�����>. ��� ������� ��� �������� ������� ������." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 418)
	MisCancelAction(ClearMission, 418)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (2247,2858)")
	
	MisHelpTalk( " ����� ���� � �������, ������������� ���� � ���������� � ���.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 437, "����� � ���� ", 418, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�� ����������, � ����� ��� ��������� ������� �������!!" )
	MisResultCondition(NoRecord, 418)
	MisResultCondition(HasMission, 418 )
	MisResultAction(ClearMission, 418 )
	MisResultAction(SetRecord, 418 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 438, "����� ����� �� ����!", 419 )
	
	MisBeginTalk( "<t>�� ������ �� ���� � ����? ����� ��� ����� �����.<n><t>��������� ��������� ��� �  <p������> � <b�����>. ��� ������ ��� ������� ���������." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 419)
	MisCancelAction(ClearMission, 419)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (2247,2858)")
	
	MisHelpTalk( " ����� ���� � �������, ������������� ���� � ���������� � ���." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 439, "����� ����� �� ����!", 419, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�� ����������, � ����� ��� ��������� ������� �������!!" )
	MisResultCondition(NoRecord, 419)
	MisResultCondition(HasMission, 419 )
	MisResultAction(ClearMission, 419 )
	MisResultAction(SetRecord, 419 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 440, "���������� ��� ", 420 )
	
	MisBeginTalk( "<t>�� ������ �� ���� � ����? ����� ��� ����� �����. <n> <t> ��������� ��������� ��� �  <p������> � <b�����>. ��� ������ ��� ������� ���������." )
	MisBeginCondition( LvCheck, ">", 24 )
	MisBeginCondition(NoRecord, 418)
	MisBeginCondition(NoRecord, 419)
	MisBeginCondition(NoRecord, 420)
	MisBeginCondition(NoMission, 418)
	MisBeginCondition(NoMission, 419)
	MisBeginCondition(NoMission, 420)
	MisBeginAction(AddMission, 420)
	MisCancelAction(ClearMission, 420)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (2247,2858)")
	
	MisHelpTalk( " ����� ���� � �������, ������������� ���� � ���������� � ���." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 441, "���������� ��� ", 420, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�� ����������, � ����� ��� ��������� ������� �������!!" )
	MisResultCondition(NoRecord, 420)
	MisResultCondition(HasMission, 420 )
	MisResultAction(ClearMission, 420 )
	MisResultAction(SetRecord, 420 )
	MisResultAction(AddExp, 1000, 1000)
	MisResultAction(AddMoney, 700, 700)



	DefineMission( 442, "���������� ��� �������� ", 421 )
	
	MisBeginTalk( "<t>���������, �� �������! �� ������ � <b��������� �����>. � ������ �� ���� �������, � ����� �������� ��� ������ ������� ��������.<n><t>���� �� ������ ��������� ������� �������� ������������� � ���� ����������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 421)
	MisCancelAction(ClearMission, 421)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ��������� ����� (2331, 2821)")
	
	MisHelpTalk( " �������������� � ������ � ���������� � ���������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 443, "���������� ��� �������� ", 421, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��! �� ������ ����� ������ ���������?<n><t>�������, �� ��� ��� ��� �����.")
	MisResultCondition(NoRecord, 421)
	MisResultCondition(HasMission, 421 )
	MisResultAction(ClearMission, 421 )
	MisResultAction(SetRecord, 421 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 444, "�������� ����� �������� ", 422 )
	
	MisBeginTalk( "<t>���������, �� �������! �� ������ � <b��������� �����>. � ������ �� ���� �������, � ����� �������� ��� ������ ������� ��������.<n><t>���� �� ������ ��������� ������� �������� ������������� � ���� ����������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 422)
	MisCancelAction(ClearMission, 422)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ��������� ����� (2331, 2821)")
	
	MisHelpTalk( " �������������� � ������ � ���������� � ���������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 445, "�������� ����� �������� ", 422, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��! �� ������ ����� ������ ���������?<n><t>�������, �� ��� ��� ��� �����.")
	MisResultCondition(NoRecord, 422)
	MisResultCondition(HasMission, 422 )
	MisResultAction(ClearMission, 422 )
	MisResultAction(SetRecord, 422 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)



	DefineMission( 446, "������� �������� ", 423 )
	
	MisBeginTalk( "<t>���������, �� �������! �� ������ � <b��������� �����>. � ������ �� ���� �������, � ����� �������� ��� ������ ������� ��������.<n><t>���� �� ������ ��������� ������� �������� ������������� � ���� ����������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 421)
	MisBeginCondition(NoRecord, 422)
	MisBeginCondition(NoRecord, 423)
	MisBeginCondition(NoMission, 421)
	MisBeginCondition(NoMission, 422)
	MisBeginCondition(NoMission, 423)
	MisBeginAction(AddMission, 423)
	MisCancelAction(ClearMission, 423)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ��������� ����� (2331, 2821)")
	
	MisHelpTalk( " �������������� � ������ � ���������� � ���������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 447, "������� �������� ", 423, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��! �� ������ ����� ������ ���������?<n><t>�������, �� ��� ��� ��� �����.")
	MisResultCondition(NoRecord, 423)
	MisResultCondition(HasMission, 423 )
	MisResultAction(ClearMission, 423 )
	MisResultAction(SetRecord, 423 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 448, "������ ������� ", 424 )
	
	MisBeginTalk( "<t>� �������!<n><t>���� <b�������>, �� ������ �� ��� ���� ��� ����� �������� � <p������>.<n><t>��������� ���, � �������, ��� �� ��������?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 424)
	MisBeginCondition(NoMission, 424)
	MisBeginAction(AddMission, 424)
	MisCancelAction(ClearMission, 424)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������� (1894, 2798)")
	
	MisHelpTalk( " ��������� �������, ����� ���." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 449, "������ ������� ", 424, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� ������� ����� ���� �� ������, ��� ���� ��� �� ������ ��� ������� �������. <n> <t> �� �� ����, � ��� �������������.")
	MisResultCondition(NoRecord, 424)
	MisResultCondition(HasMission, 424 )
	MisResultAction(ClearMission, 424 )
	MisResultAction(SetRecord, 424 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 450, "����� ", 425)
	
	MisBeginTalk( "<t>������� �������� ��������� ����� ����� �� ���� ����� <p��������� ���> � <p��������>. �� ������ ���������� �� ����� �����������.<n><t>������ �� ������ �� ���� ���������, ������� ������ ������� ����� ��������. ��������� ��� ������ ���������, ��������, ��������� ����� �����  <b������> �� ��������!<n><t>��������� ��� ��� �� �� �������� ����." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 425)
	MisBeginCondition(NoMission, 425)
	MisBeginAction(AddMission, 425)
	MisCancelAction(ClearMission, 425)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ����� (1136, 2778)" )
	
	MisHelpTalk( "������������� � ��������." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 451, "����� " , 425, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�� �� ���� ������? � ������ � �����������.")
	MisResultCondition(NoRecord, 425)
	MisResultCondition(HasMission, 425 )
	MisResultAction(ClearMission, 425 )
	MisResultAction(SetRecord, 425 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 452, "����� ", 426)
	
	MisBeginTalk( "<t><p������> ��� ������� �����. ���� ������ ������ �� ����� �������������.<n><t>� ����� ������ ���������� �������, � ����� ����� � �������� �����. <b���>, ��� <p������> � �� ��� ��� ��������� � ������������, �� ��� �� �� ��� �������� ��� �� ��������������.<n><t>����� �� ���������� � �����?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 426)
	MisBeginCondition(NoMission, 426)
	MisBeginAction(AddMission, 426)
	MisCancelAction(ClearMission, 426)
		
	MisNeed(MIS_NEED_DESP, " ���������� � �������� ����� ���� ������ (1346, 451)")
	
	MisHelpTalk( " ������������� � ����, ���� ��� ��� ������ �� ���������." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 453, "����� ", 426, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�, ��� ��� ����� �� ����� ������� ���, � ����� ������ �����.<n><t>������� �� ��, ��� �������� ������." )
	MisResultCondition(NoRecord, 426)
	MisResultCondition(HasMission, 426 )
	MisResultAction(ClearMission, 426 )
	MisResultAction(SetRecord, 426 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 454, "����������� ���� ", 427)
	
	MisBeginTalk( "<t>��-�� ������� ������ ��������������, � ������� �����������.<n><t>����� �������� ������� � ������.<n><t>��������� <b�����> � <p������>. �������� ��� ��������� ���� ������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 427)
	MisBeginCondition(NoMission, 427)
	MisBeginAction(AddMission, 427)
	MisCancelAction(ClearMission, 427)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (1883, 2805)")
	
	MisHelpTalk( " ������������� � ���������� � �����!" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 455, "����������� ���� ", 427, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� ���� � ���, � ��� ��� ��� <b������> �������� ���.<n><t>�� ������ ���� ���������� ������ �������.")
	MisResultCondition(NoRecord, 427)
	MisResultCondition(HasMission, 427 )
	MisResultAction(ClearMission, 427 )
	MisResultAction(SetRecord, 427 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 456, "������ ", 428 )
	
	MisBeginTalk( "<t>��� ��� ��� ���������?!<n><t>��� ������� ���� <b�����> ��������� <p��������>. ������, �� ������� �������� � ��� ��������� ���� ��������� �� ��������. <n> <t> �� ������� �� �� ��� ��� ��������� � ��������?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 428)
	MisBeginCondition(NoMission, 428)
	MisBeginAction(AddMission, 428)
	MisCancelAction(ClearMission, 428)
		
	MisNeed(MIS_NEED_DESP, " ����������� � �������� � �������� ������� ����� (1136, 2778)" )
	
	MisHelpTalk( "�� ��� �������� ��� ���?" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 457, "������ ", 428, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>����... ����... ��... � �������� ���� �����.<n><t>�������! � ������ �� ���� ����� ���������� ���.")
	MisResultCondition(NoRecord, 428)
	MisResultCondition(HasMission, 428 )
	MisResultAction(ClearMission, 428 )
	MisResultAction(SetRecord, 428 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 458, "����� ", 429 )
	
	MisBeginTalk( "<t>��, � ����� ����� ����� ������, �������� ������� ����.<n><t>������������ ������, <b�����> ����� ��� ����� �� ����. �� ���������� ��� � ���� �������?" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 429)
	MisBeginCondition(NoMission, 429)
	MisBeginAction(AddMission, 429)
	MisCancelAction(ClearMission, 429)
		
	MisNeed(MIS_NEED_DESP, " ������������� � (1294, 498)")
	
	MisHelpTalk(" ���������� ������������, ��� ������� �������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 459, "����� ", 429, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��� �����������, ��� ������� �������, ������� ��� �������� ��� �� ����!")
	MisResultCondition(NoRecord, 429)
	MisResultCondition(HasMission, 429 )
	MisResultAction(ClearMission, 429 )
	MisResultAction(SetRecord, 429 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 460, "����� ���� ", 430)
	
	MisBeginTalk( "<t>��-�� ������� ������ ��������������, � ������� �����������.<n><t>����� �������� ������� � ������.<n><t>��������� <b�����> � <p������>. �������� ��� ��������� ���� ������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 430)
	MisBeginCondition(NoMission, 430)
	MisBeginAction(AddMission, 430)
	MisCancelAction(ClearMission, 430)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (1883, 2805)")
	
	MisHelpTalk( " ������������� � ����� ������������ ������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 461, "����� ����", 430, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>�� � ��� ��� ��� �������������� <b������>? ��� ���? ������ � ����� �����? �������� ��� ��� �� �����, � �� � ���� ������������ ����������� ��� �� ������ ���� ������������� � �����.")
	MisResultCondition(NoRecord, 430)
	MisResultCondition(HasMission, 430 )
	MisResultAction(ClearMission, 430 )
	MisResultAction(SetRecord, 430 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 462, "����� �������� ", 431)
	
	MisBeginTalk( "<t>������. ��� ����, <b���������> ���� ��������� ��������, ����� ������ ��� � <p��������>. �� �������� ���� ����� ����� ��������.<n><t>� � �� ���� �����, ���� ������� ��!" )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 431)
	MisBeginCondition(NoMission, 431)
	MisBeginAction(AddMission, 431)
	MisCancelAction(ClearMission, 431)
		
	MisNeed(MIS_NEED_DESP, " ���������� � <b���������> � (1123, 2766)")
	
	MisHelpTalk( " �� ��������������� ����!" )
	MisResultCondition(AlwaysFailure )

	DefineMission( 463, "����� �������� ", 431, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��� ��� ��� �������� �� ��� �����, � ���� � ���!<n><t>� � ���� ���� ��� ��� ������ ���������.")
	MisResultCondition(NoRecord, 431)
	MisResultCondition(HasMission, 431 )
	MisResultAction(ClearMission, 431 )
	MisResultAction(SetRecord, 431 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 464, "������������ ", 432 )
	
	MisBeginTalk( "<t>���� ���, ��� ������� ��� �� ��� ���. ������ �� ��� �� ����������� � <p������>? <n> <t> ��� ������, <b�����>, ��� ��� ���� ������, ��� ������ � ���������.<n><t>���� �� �������, � ���� �������� ��� ������������." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 432)
	MisBeginCondition(NoMission, 432)
	MisBeginAction(AddMission, 432)
	MisCancelAction(ClearMission, 432)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ����� ������ (1294, 498)")
	
	MisHelpTalk(" ������������� � ������ � ���������� � �����!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 465, "������������ ", 432, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>� ���, ��� �� ���� ��� ��� ���������������  <b����>? �� ���� ���� �������! ���� � ��� �� ������������ � ����� ����� ��� ����� �� ������ ����� � ������������.")
	MisResultCondition(NoRecord, 432)
	MisResultCondition(HasMission, 432 )
	MisResultAction(ClearMission, 432 )
	MisResultAction(SetRecord, 432 )
	MisResultAction(AddExp, 2000, 2000)
	MisResultAction(AddMoney, 850, 850)


	DefineMission( 466, "������� ", 433 )
	
	MisBeginTalk( "<t>� ������� ����! ��� ����, <b����> ����� �������� ������ ����� ��������� ������� ������ <r����� �������>.<n><t>� �� � ��� ������� ���, �� ���� �������  <p������ ��������> �� ������� ����.<n><t>���������� ��������� ����� �����." )
	MisBeginCondition( LvCheck, ">", 29 )
	MisBeginCondition(NoRecord, 433)
	MisBeginCondition(NoMission, 433)
	MisBeginAction(AddMission, 433)
	MisCancelAction(ClearMission, 433)
		
	MisNeed(MIS_NEED_DESP, " ��������� <r����> (2142, 556)")
	
	MisHelpTalk("���������� ������������� �� ����� ��������!")
	MisResultCondition(AlwaysFailure )

	DefineMission( 467, "������� ", 433, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������� �������! ��� ������ ������ ������� ���� � � ���� ������ � ��� ��� ��� �������� ����.")
	MisResultCondition(NoRecord, 433)
	MisResultCondition(HasMission, 433 )
	MisResultAction(ClearMission, 433 )
	MisResultAction(SetRecord, 433 )
	MisResultAction(AddExp, 3500, 3500)
	MisResultAction(AddMoney, 1000, 1000)

	DefineMission( 468, "��������� ������� ", 434 )
	
	MisBeginTalk( "<t>������� ��������������! � ����� ����� �������, <b������� �����>, ������ ����, �� ��������. �������, � �������, ��� ��� ��������� � <p������� ���>. <n> <t>, ���� �� � ��������� ��������� �� ��� � ����� \"������ ������� \"?" )
	MisBeginCondition( LvCheck, ">", 39 )
	MisBeginCondition(NoRecord, 434)
	MisBeginCondition(NoMission, 434)
	MisBeginAction(AddMission, 434)
	MisCancelAction(ClearMission, 434)
		
	MisNeed(MIS_NEED_DESP, " ���������� � ������ (2664, 654)")
	
	MisHelpTalk( " ������� ����������� � ������� ���� ��� � ����� �� ��� �����.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 469, "��������� ������� ", 434, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������ ��� ��������� ������ �������. ��� �� �������� ��� ������� ������ �� ���� ������� ���� �����?!")
	MisResultCondition(NoRecord, 434)
	MisResultCondition(HasMission, 434 )
	MisResultAction(ClearMission, 434 )
	MisResultAction(SetRecord, 434 )
	MisResultAction(AddExp, 6000, 6000)	
	MisResultAction(AddMoney, 1000, 1000)


	DefineMission( 470, "��������� ��������� ", 435 )
	
	MisBeginTalk( "<t>� �������! �� ������ �������� ����? ��� ������, <b������-����>. �������, ��� ����������� � <p������>, � �� ���� � ���������, ��� ��� ������! <n> <t> ����� �� � ��������� �� ����� �����?" )
	MisBeginCondition( LvCheck, ">", 44 )
	MisBeginCondition(NoRecord, 435)
	MisBeginCondition(NoMission, 435)
	MisBeginAction(AddMission, 435)
	MisCancelAction(ClearMission, 435)
		
	MisNeed(MIS_NEED_DESP, " ��������� �������-���� (630, 2091)")
	
	MisHelpTalk( " ��������� �������-���� � ���������� ������." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 471, "��������� ��������� ", 435, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>��-��-��! ��� �������� ����� ������ ���� ��� ���� ������. ��� ����� �������� ��� ����.")
	MisResultCondition(NoRecord, 435)
	MisResultCondition(HasMission, 435 )
	MisResultAction(ClearMission, 435 )
	MisResultAction(SetRecord, 435 )
	MisResultAction(AddExp, 10000, 10000)	
	MisResultAction(AddMoney, 1100, 1100)


	DefineMission( 472, "���� ����-����� ", 436 )
	
	MisBeginTalk( "<t>� ������, ��� <p����-����> ��������� � ������� ����.<n><t>� ���� ��������������� ��� �������� ������ <b�������>, ���� �� �� ������." )
	MisBeginCondition( LvCheck, ">", 49 )
	MisBeginCondition(NoRecord, 436)
	MisBeginCondition(NoMission, 436)
	MisBeginAction(AddMission, 436)
	MisCancelAction(ClearMission, 436)
		
	MisNeed(MIS_NEED_DESP, " ������������� � ����-���� (706, 1465)")
	
	MisHelpTalk( " �� ������� ����� �����, ����� � ����-����." )
	MisResultCondition(AlwaysFailure )

	DefineMission( 473, "���� ����-����� ", 436, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������, �� ��� �� �� �����?<n><t>������, �� ���������� ������� ������ ������.")
	MisResultCondition(NoRecord, 436)
	MisResultCondition(HasMission, 436 )
	MisResultAction(ClearMission, 436 )
	MisResultAction(SetRecord, 436 )
	MisResultAction(AddExp, 16000, 16000)
	MisResultAction(AddMoney, 1200, 1200)


	DefineMission( 474, "�������� �������� ��� ", 437)
	
	MisBeginTalk( "<t>�������� ��� ��������, ��� ������� ���� �������.<n><t>�� ����� �� �� ��������� ����� ����� � <p������� �������>?" )
	MisBeginCondition( LvCheck, ">", 54 )
	MisBeginCondition(NoRecord, 437)
	MisBeginCondition(NoMission, 437)
	MisBeginAction(AddMission, 437)
	MisCancelAction(ClearMission, 437)
		
	MisNeed(MIS_NEED_DESP, " ������������� � ����� (529, 2458)")
	
	MisHelpTalk( " ������� ��� ����, �� ��� �� �� ����� ������������ � ������� �������.")
	MisResultCondition(AlwaysFailure )

	DefineMission( 475, "�������� �������� ��� ", 437, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk( "<t>������� �� ������. � ���� �� �����, ��� ����� ��� ��� ������ ���� ������ �������� ���.")
	MisResultCondition(NoRecord, 437)
	MisResultCondition(HasMission, 437 )
	MisResultAction(ClearMission, 437 )
	MisResultAction(SetRecord, 437 )
	MisResultAction(AddExp, 25000, 25000)
	MisResultAction(AddMoney, 1300, 1300)




----------------------------------------
--                                    --
--        ������ ������������         --
--                                    --
----------------------------------------


	DefineMission(476, "������ ������������ ", 438 )

	MisBeginTalk( "<t>������� ����������� ����-����� ������ ��� ������ �� ����.<n><t>������ � �� ���� ����� ����. ����� �� �� ���� ��������?<n><t>�� �� �������� ��������� �� ��� � ���������� ��� ��������.")
	MisBeginCondition(NoRecord, 438)
	MisBeginCondition(NoMission,438)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 438)
	MisCancelAction(ClearMission, 438)
	MisHelpTalk( "<t> �� ������������ �� ����, ���� ����������� ������!" )

	MisNeed(MIS_NEED_DESP, " �������� � ������������������ ������ ���������� ")

	MisResultCondition(AlwaysFailure)

	DefineMission( 477,"������ ������������ ", 438, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>���� ��� ��������� �� ���� ��� ��������. �� �� ������ � ������.")

	MisResultCondition(HasMission, 438)
	MisResultCondition(NoRecord, 438)
	MisResultCondition(HasNavyGuild)

	MisResultAction(ClearMission, 438)
	MisResultAction(SetRecord, 438)

	
	DefineMission(478, "������ ��� ������������ ", 439 )

	MisBeginTalk( "<t>��� ��� ��������� �� ���� ��������, ���������� ��������� ��� ������ ���.<n><t>� ������ ���������. ��� ������ ����� ������!")
	MisBeginCondition(HasRecord, 438)
	MisBeginCondition(NoRecord, 439)
	MisBeginCondition(NoMission,439)
	MisBeginCondition(HasNavyGuild)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 439)
	MisBeginAction(GiveItem, 2430, 1, 4)
	MisCancelAction(ClearMission, 439)
	MisHelpTalk( "<t> ���������� ���������!" )
	MisNeed(MIS_NEED_DESP, " ��������� � ����������." )

	MisResultCondition(AlwaysFailure)


	DefineMission( 479, "������ ��� ������������ ", 439, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>��� ����������� ������ ��� �������� ������? (���������).<n><t>������� ����, � ��� ��� �� ����������� ������.")

	MisResultCondition(HasMission, 439)
	MisResultCondition(NoRecord, 439)

	MisResultCondition(HasItem, 2430,1 )
	MisResultCondition(HasNavyGuild)

	MisResultAction(ClearMission, 439)
	MisResultAction(TakeItem, 2430,1 )
	MisResultAction(SetRecord, 439)
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 25000, 25000)



	DefineMission(480, "������ ����� ", 440 )

	MisBeginTalk( "<t>�� ������? �������� ����������� �����.<n><t>�� ����� ������������������ ������ ����� �������� ����������, �����̸����� ���� � �������� ��� � �������������� <r5 ���� ������>.")

	MisBeginCondition(HasRecord, 439)
	MisBeginCondition(NoMission, 440)
	MisBeginCondition(NoRecord, 440)
	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 440)
	MisBeginAction(AddTrigger, 4401, TE_GETITEM, 2386, 5)

	MisNeed(MIS_NEED_ITEM, 2386, 5, 10, 5)

	MisCancelAction(ClearMission, 440)
	
	MisHelpTalk( "<t> �� ��� ����� �������� ���� ������!")
	
	MisResultTalk( "<t> �� ��� � �����, �� �� ������ � ��� ��� �� �������������� � ����� � ����������?")

	MisResultCondition(HasMission, 440)
	MisResultCondition(NoRecord, 440)
	MisResultCondition(HasItem, 2386, 5)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem, 2386, 5)
	MisResultAction(ClearMission, 440)
	MisResultAction(SetRecord, 440)
	MisResultAction(AddExp, 250000, 250000)
	MisResultAction(AddMoney, 150000, 150000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2386)
	TriggerAction(1, AddNextFlag, 440, 10, 5)
	RegCurTrigger(4401)

	
	DefineMission( 481, "����������� ����� ", 441 )

	MisBeginTalk( "<t>����� ��� �� �������� ���, ���� ������ ��� ����������� �������. <n> <t> �� ����� ��� �� ����� �������� �������. �� ������ ������ ���� ����� � ���������� ����������� ��������. ��� ����������� ����� ��������! <n> <t> �� ����� �������� ����������! ������������� � ���� ���� � ��������� �����, ��� �� �������� ��� 8 ������� ����. ������� �������� � ������ ��� <p����� �����> <r��������� ������� ���>. <n> <t> � �� ����� ��� ��������, ��� ��� � ����� ����� ���. ����� ����!")


	MisBeginCondition(HasRecord, 440)
	MisBeginCondition(NoRecord, 441)
	MisBeginCondition(NoMission, 441)

	MisBeginCondition(HasNavyGuild)

	MisBeginAction(AddMission, 441)

	MisBeginAction(AddTrigger, 4411, TE_GETITEM, 2388, 1)--���, �������� 1
	MisBeginAction(AddTrigger, 4412, TE_GETITEM, 2389, 1)--2
	MisBeginAction(AddTrigger, 4413, TE_GETITEM, 2390, 1)--3
	MisBeginAction(AddTrigger, 4414, TE_GETITEM, 2391, 1)--4
	MisBeginAction(AddTrigger, 4415, TE_GETITEM, 2392, 1)--5
	MisBeginAction(AddTrigger, 4416, TE_GETITEM, 2393, 1)--6
	MisBeginAction(AddTrigger, 4417, TE_GETITEM, 2394, 1)--7
	MisBeginAction(AddTrigger, 4418, TE_GETITEM, 2395, 1)--�������� ���� 8
	MisBeginAction(AddTrigger, 4419, TE_GETITEM, 2441, 1)--���������

	MisNeed(MIS_NEED_ITEM, 2388, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2389, 1, 20, 1)
	MisNeed(MIS_NEED_ITEM, 2390, 1, 30, 1)
	MisNeed(MIS_NEED_ITEM, 2391, 1, 40, 1)
	MisNeed(MIS_NEED_ITEM, 2392, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2393, 1, 60, 1)
	MisNeed(MIS_NEED_ITEM, 2394, 1, 70, 1)
	MisNeed(MIS_NEED_ITEM, 2395, 1, 80, 1)
	MisNeed(MIS_NEED_ITEM, 2441, 1, 90, 1)

	MisCancelAction(ClearMission, 441)

	MisHelpTalk( "<t> �� �� ������ ��������� ����� ������ ����� ���� ���������!")
	
	MisResultTalk( "<t>���... ��� - ���... �� - ������������� ��� �����!<n><t>��� ����������! � �� ���� ������ �������� ������ ��������, � ������ ������... � �����... �� ��������� ������� �� ����� ��������.")

	MisResultCondition(HasMission, 441)
	MisResultCondition(NoRecord, 441)
	MisResultCondition(HasItem, 2388, 1)
	MisResultCondition(HasItem, 2389, 1)
	MisResultCondition(HasItem, 2390, 1)
	MisResultCondition(HasItem, 2391, 1)
	MisResultCondition(HasItem, 2392, 1)
	MisResultCondition(HasItem, 2393, 1)
	MisResultCondition(HasItem, 2394, 1)
	MisResultCondition(HasItem, 2395, 1)
	MisResultCondition(HasItem, 2441, 1)
	MisResultBagNeed(1)
	MisResultCondition(HasNavyGuild)

	MisResultAction(TakeItem, 2388, 1)
	MisResultAction(TakeItem, 2389, 1)
	MisResultAction(TakeItem, 2390, 1)
	MisResultAction(TakeItem, 2391, 1)
	MisResultAction(TakeItem, 2392, 1)
	MisResultAction(TakeItem, 2393, 1)
	MisResultAction(TakeItem, 2394, 1)
	MisResultAction(TakeItem, 2395, 1)
	MisResultAction(TakeItem, 2441, 1)

	MisResultAction(ClearMission, 441)
	MisResultAction(SetRecord, 441)
	MisResultAction(AddExp, 500000, 500000)
	MisResultAction(AddMoney, 500000, 500000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2388)
	TriggerAction(1, AddNextFlag, 441, 10, 1)
	RegCurTrigger(4411)

	InitTrigger()
	TriggerCondition(1, IsItem, 2389)
	TriggerAction(1, AddNextFlag, 441, 20, 1)
	RegCurTrigger(4412)

	InitTrigger()
	TriggerCondition(1, IsItem, 2390)
	TriggerAction(1, AddNextFlag, 441, 30, 1)
	RegCurTrigger(4413)

	InitTrigger()
	TriggerCondition(1, IsItem, 2391)
	TriggerAction(1, AddNextFlag, 441, 40, 1)
	RegCurTrigger(4414)

	InitTrigger()
	TriggerCondition(1, IsItem, 2392)
	TriggerAction(1, AddNextFlag, 441, 50, 1)
	RegCurTrigger(4415)

	InitTrigger()
	TriggerCondition(1, IsItem, 2393)
	TriggerAction(1, AddNextFlag, 441, 60, 1)
	RegCurTrigger(4416)

	InitTrigger()
	TriggerCondition(1, IsItem, 2394)
	TriggerAction(1, AddNextFlag, 441, 70, 1)
	RegCurTrigger(4417)

	InitTrigger()
	TriggerCondition(1, IsItem, 2395)
	TriggerAction(1, AddNextFlag, 441, 80, 1)
	RegCurTrigger(4418)

	InitTrigger()
	TriggerCondition(1, IsItem, 2441)
	TriggerAction(1, AddNextFlag, 441, 90, 1)
	RegCurTrigger(4419)



	DefineMission( 482, "��� ", 442 )

	MisBeginTalk( "<t>� ������� ��� ��� ������� ���� �� ����� �� � ������ ��� �� ����� �������� � ������ ������, �� ����� � ��������� �� ������� � �������� �����. <n> <t> ������������� � ���� � ��������� � ������� ���������, ����� ��� ����� � ���������� ������. ������������.")
	MisBeginCondition(NoRecord, 442)
	MisBeginCondition(NoMission,442)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 442)
	MisCancelAction(ClearMission, 442)
	MisHelpTalk( "<t> ������������, ��� �� ������ �������������!")

	MisNeed(MIS_NEED_DESP, " � ��� �� ���������!")

	MisResultCondition(AlwaysFailure)



	DefineMission( 483, "��� ", 442, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>���! �� ����� ������� � ������ ����? ��-��-��. ��� ������.<n><t>������������� ������� � ���� � ���������, ��� ���� �� ����� �� ���� ������, ����� ������� ���� � ������� ��������!")

	MisResultCondition(HasMission, 442)
	MisResultCondition(NoRecord, 442)
	MisBeginCondition(HasPirateGuild)

	MisResultAction(ClearMission, 442)
	MisResultAction(SetRecord, 442)

	DefineMission( 484, "���� ������ ����� ", 443 )

	MisBeginTalk( "<t>���-������ � ������ ��� �� ��������. �������� ��� ����� �����.<n><t>������� ���, ��� � ���� ����� ��� � ��������� � ������� � ���������� �������� ������.")
	MisBeginCondition(HasRecord, 442)
	MisBeginCondition(NoRecord, 443)
	MisBeginCondition(NoMission,443)
	MisBeginCondition(HasPirateGuild)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 443)

	MisCancelAction(ClearMission, 443)
	MisBeginAction(GiveItem, 2431, 1, 4)
	MisHelpTalk( "<t>���������� �������, ������������� � �������� ����������!" )

	MisNeed(MIS_NEED_DESP, "��������� ������ ������ �������� ����� ����� �����." )

	MisResultCondition(AlwaysFailure)



	DefineMission( 485, "���� ������ ����� ", 443, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure)

	MisResultTalk( "<t>��... ����, �� ��� �� ��������� ������ �� ����� �������������� ����������.<n><t>�� ������ ������� ����� ������ ���. ���������.")

	MisResultCondition(HasItem,2431,1)
	MisResultCondition(HasMission, 443)
	MisResultCondition(NoRecord, 443)
	MisResultCondition(HasPirateGuild)

	MisResultAction(ClearMission, 443)
	MisResultAction(TakeItem,2431,1)
	MisResultAction(SetRecord, 443)
	MisResultAction(AddExp, 10000, 10000)
	MisResultAction(AddMoney, 50000, 50000)


	DefineMission( 486, "��������� ���������� ���� ", 444 )

	MisBeginTalk( "<t>�� ������� �������� ����� ��� ������.<n><t>���� ������ ��� ����������, ��� �� ������������ ������ ����� �������.<n><t>��� ���� ��� ������� ������������ ����� ������ �������.")

	MisBeginCondition(HasRecord, 443)
	MisBeginCondition(NoRecord, 444)
	MisBeginCondition(NoMission, 444)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 444)---����, ���������� ����
	MisBeginAction(AddTrigger, 4441, TE_GETITEM, 2444, 1)--������ ������

	MisNeed(MIS_NEED_ITEM, 2444, 1, 10, 1)
	MisCancelAction(ClearMission, 444)

	MisHelpTalk( "<t>����� ��� �� ������� ������ �� �����, ����������� ����!" )

	MisResultTalk( "<t>�������! � ����� � ���." )

	MisResultCondition(NoRecord, 444)
	MisResultCondition(HasMission, 444)
	MisResultCondition(HasPirateGuild)
	MisResultCondition(HasItem,2444,1)

	MisResultAction(TakeItem, 2444, 1)
	MisResultAction(ClearMission, 444)
	MisResultAction(SetRecord, 444)

	MisResultAction(AddExp, 250000, 250000)
	MisResultAction(AddMoney, 150000, 150000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2444)
	TriggerAction(1, AddNextFlag, 444, 10, 1)
	RegCurTrigger(4441)

	
	DefineMission( 487, "����������� ", 445 )

	MisBeginTalk( "<t>�� ���� ����� ����� � ����� ����������� ���������.<n><t>�� ������ ������ ����� ��� ����� �������? � ���� ���� ������������� ��� ��� ������� � ��� ��� ��� ������� ������ ���. � ����� �� ����, �� ��� ������� ��� �� ��� �� �������� �� � ���� ��������.<n><t>� ������ ��� �������� ����������� ������ ������ � 40 ������� �����.")

	MisBeginCondition(HasRecord, 444)
	MisBeginCondition(NoRecord, 445)
	MisBeginCondition(NoMission, 445)
	MisBeginCondition(HasPirateGuild)

	MisBeginAction(AddMission, 445)
	MisBeginAction(AddTrigger, 4451, TE_GETITEM, 2427, 1)
	MisBeginAction(AddTrigger, 4452, TE_GETITEM, 2438, 40)
	

	MisNeed(MIS_NEED_ITEM, 2427, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2438, 40, 20, 40)
	

	MisCancelAction(ClearMission, 445)
	MisHelpTalk( "<t>�� �������, ��� ���� �� ��� ������ ������ ��� �� ���� ���������?" )

	MisResultTalk( "<t>� ��! ��� �� �����... (������ �������� ��� �� ���� �� �� �������� �����: ??????????????).<n><t>��������. � ���� ���������!")

	MisResultCondition(NoRecord, 445)
	MisResultCondition(HasMission, 445)
	MisResultCondition(HasItem, 2438, 40)
	MisResultCondition(HasItem, 2427, 1)
	MisResultCondition(HasPirateGuild)

	MisResultAction(TakeItem, 2438, 40)
	MisResultAction(TakeItem, 2427, 1)
	MisResultAction(ClearMission ,445)
	MisResultAction(SetRecord, 445)

	MisResultAction(AddExp, 500000,500000)
	MisResultAction(AddMoney, 800000, 800000)

	InitTrigger()
	TriggerCondition(1, IsItem, 2427)
	TriggerAction(1, AddNextFlag, 445, 10, 1)
	RegCurTrigger(4451)

	InitTrigger()
	TriggerCondition(1, IsItem, 2438)
	TriggerAction(1, AddNextFlag, 445, 20, 40)
	RegCurTrigger(4452)

end
CenterMission001()

