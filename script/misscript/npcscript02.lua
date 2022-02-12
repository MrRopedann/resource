print( "Loading NPCScript02.lua" )

function for_test()
	Talk( 1,  "�������� ������ (��������) " )
	Text( 1,  "������� ",CloseTalk )
end

function t_kelili ()
	
	
	Talk( 1,  "������,�������������� ���� ���� ����,��� ����� ���������? " )
	Text( 1,  "�������������� ���� ���� ", JumpPage, 2)
	Text( 1,  "������� ���� ���� ", JumpPage, 3)
	Text( 1,  "�������������� ��������� ", JumpPage, 11)
	Text( 1,  "�������� ������ ", JumpPage, 24)
	
Talk( 2, "� ����� ����������� �� " )
Text( 2,  "����� ������� 10 ����  ", JumpPage, 4)
Text( 2,  "����� ������� 10 ���� (�10)  ", JumpPage, 6)
Text( 2,  "����� ������� 10 ���� (�100)  ", JumpPage, 27)
Text( 2,  "������� ������� 100 ����  ", JumpPage, 5)
Text( 2,  "������� ������� 100 ���� (�10)  ", JumpPage, 18)
Text( 2,  "������� ������� 100 ���� (�100)  ", JumpPage, 28)
Text( 2,  "�������� ������� 1000 ����  ", JumpPage, 19)
Text( 2,  "�������� ������� 1000 ���� (�10)  ", JumpPage, 29)

Talk( 3, "� �������� ������ �� ��� " )
--Text( 3,  "����� ������� 10 ���� (�10)  ", JumpPage, 8)
Text( 3,  "����� ������� 10 ���� (�100)  ", JumpPage, 22)
Text( 3,  "����� ������� 10 ���� (�1000)  ", JumpPage, 23)
Text( 3,  "������� ������� 50 ���� (�10)  ", JumpPage, 9)
Text( 3,  "������� ������� 50 ���� (�100)  ", JumpPage, 30)
Text( 3,  "������� ������� 50 ���� (�1000)  ", JumpPage, 31)
Text( 3,  "������� ������� 100 ���� (�10)  ", JumpPage, 16)
Text( 3,  "������� ������� 100 ���� (�100)  ", JumpPage, 17)
Text( 3,  "������� ������� 100 ���� (�1000)  ", JumpPage, 21)

Talk( 11, "������� ����� ��������,��� ��� ������� �� ����� " )
Text( 11,  "����������� 10 ���������  ", JumpPage, 15)
Text( 11,  "����������� 50 ���������  ", JumpPage, 12)
Text( 11,  "����������� 100 ���������  ", JumpPage, 13)
Text( 11,  "����������� 500 ���������  ", JumpPage, 14)
Text( 11,  "����������� 1000 ���������  ", JumpPage, 32)

Talk( 4, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,10 )
TriggerAction( 1, GiveItem, 7450,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(4," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 5, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,100 )
TriggerAction( 1, GiveItem, 7467,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(5," ����� ",MultiTrigger,GetMultiTrigger(),1)


Talk( 6, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,100 )
TriggerAction( 1, GiveItem, 7450,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(6," ����� ",MultiTrigger,GetMultiTrigger(),1)



Talk( 8, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7450,10 )
TriggerAction( 1, GiveItem, 3457,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(8," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 9, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7692,10 )
TriggerAction( 1, GiveItem, 3457,500,4 )
TriggerFailure( 1, JumpPage, 10)
Text(9," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 12, " ����� ���� ������ " )
InitTrigger()
TriggerCondition( 1, HasCredit, 50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, DelRoleCredit, 50 )
TriggerAction( 1, GiveItem, 7622,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)


Talk( 13, " ����� ���� ������ " )
InitTrigger()
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, GiveItem, 7623,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 14, " ����� ���� ������ " )
InitTrigger()
TriggerCondition( 1, HasCredit, 500 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, DelRoleCredit, 500 )
TriggerAction( 1, GiveItem, 7624,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 15, " ����� ���� ������ " )
InitTrigger()
TriggerCondition( 1, HasCredit, 10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, DelRoleCredit, 10 )
TriggerAction( 1, GiveItem, 7625,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)


Talk( 16, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7467,10 )
TriggerAction( 1, GiveItem, 3457,1000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(16," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 17, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7467,100 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(17," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 18, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7467,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(18," �������� ",MultiTrigger,GetMultiTrigger(),1)


Talk( 19, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7746,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(19," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 21, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7467,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7467,1000 )
TriggerAction( 1, GiveItem, 3457,100000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(21," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 22, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7450,100 )
TriggerAction( 1, GiveItem, 3457,1000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(22," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 23, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7450,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7450,1000 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(23," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 24, "��������� � ����� ������ " )
Text( 24,  "������� ������ �����  ", JumpPage, 25)
Text( 24,  "���������� ������ �����  ", JumpPage, 26)

Talk( 25, "���� ������� ������ ����� ������ 3 ������ �����" )
InitTrigger()
TriggerCondition( 1, HasItem,7484,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7484,3 )
TriggerAction( 1, GiveItem, 7502,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(25," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 26, "���� ���������� ������ ����� ������ 5 ������� ������� �����" )
InitTrigger()
TriggerCondition( 1, HasItem,7502,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7502,5 )
TriggerAction( 1, GiveItem, 7503,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(26," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 27, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,1000 )
TriggerAction( 1, GiveItem, 7450,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(27," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 28, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,10000 )
TriggerAction( 1, GiveItem, 7467,100,4 )
TriggerFailure( 1, JumpPage, 10)
Text(28," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 29, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,10000 )
TriggerAction( 1, GiveItem, 7746,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(29," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 30, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,100 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7692,100 )
TriggerAction( 1, GiveItem, 3457,5000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(30," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 31, "��������� � ����� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7692,1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7692,1000 )
TriggerAction( 1, GiveItem, 3457,20000,4 )
TriggerAction( 1, GiveItem, 3457,20000,4 )
TriggerAction( 1, GiveItem, 3457,10000,4 )
TriggerFailure( 1, JumpPage, 10)
Text(31," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 32, " ����� ���� ������ " )
InitTrigger()
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7830,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(32," ����� ",MultiTrigger,GetMultiTrigger(),1)


Talk( 10, "�� ���-�� �������! " )

	AddNpcMission ( 2026 )
end 

-------------------------------------------------------------------
--								--
--		�����ǣ���������С���		--
--		219533,270323				--
-------------------------------------------------------------------
function r_trade01 ()
	Talk( 1, "�����: ������! � ���� ������ ���� ������������ ������ ��� ����! " )
	Text( 1, "���� ", BuyPage)
	Text( 1, "������ ", OpenRepair)
	Text( 1, "������������� ", OpenUnite)
	Text( 1, "�������� �������� ", OpenForge)
	Text( 1, "������� ���� ", OpenMilling)
	Text( 1, "�������� � �������� ", OpenFusion)
	Text( 1, "��������� �������� ", OpenUpgrade)
	Text( 1, "�������� �������� ", OpenGetStone )
	Text( 1, "������� ������������ ", OpenItemFix )
	Text( 1,"������� ������������ ����� ",JumpPage,9)
	Talk(9,"�����: ��������� ������������ �����? ��� �������! � ����� �������� �� ��� ����! ")
	Text(9,"� ���� ��������������� ���� ����� ",CheckMetal)
	Text(9,"���, �������. ",CloseTalk)




	InitTrade()
	Weapon(	0008	)
	Weapon(	0196	)
	Weapon(	0197	)
	Weapon(	0198	)
	Weapon(	0001	)
	Weapon(	0010	)
	Weapon(	0002	)
	Weapon(	0011	)
	Weapon(	0003	)
	Weapon(	0012	)
	Weapon(	0013	)
	Weapon(	0014	)
	Weapon(	0022	)
	Weapon(	0005	)
	Weapon(	0023	)
	Weapon(	1388	)
	Weapon(	1389	)
	Weapon(	1390	)
	Weapon(	1391	)
	Weapon(	1392	)
	Weapon(	1395	)
	Weapon(	1396	)
	Weapon(	1397	)
	Weapon(	1398	)
	Weapon(	1399	)
	Weapon(	0121	)
	Weapon(	0122	)
	Weapon(	0123	)
	Weapon(	0124	)
	Weapon(	0125	)
	Weapon(	0126	)
	Weapon(	0015	)
	Weapon(	0020	)
	Weapon(	0016	)
	Weapon(	0021	)
	Weapon(	0004	)
	Weapon(	1370	)
	Weapon(	1371	)
	Weapon(	1372	)
	Weapon(	1373	)
	Weapon(	1377	)
	Weapon(	1378	)
	Weapon(	1379	)
	Weapon(	1380	)
	Weapon(	1381	)
	Weapon(	1382	)
	Weapon(	1386	)
	Weapon(	1387	)
	Weapon(	0073	)
	Weapon(	0080	)
	Weapon(	0074	)
	Weapon(	0081	)
	Weapon(	0075	)
	Weapon(	0082	)
	Weapon(	0076	)
	Weapon(	0083	)
	Weapon(	0077	)
	Weapon(	0084	)
	Weapon(	1415	)
	Weapon(	1416	)
	Weapon(	1417	)
	Weapon(	1418	)
	Weapon(	1419	)
	Weapon(	1422	)
	Weapon(	1423	)
	Weapon(	1424	)
	Weapon(	1425	)
	Weapon(	1426	)
	Weapon(	1443	)
	Weapon(	1444	)
	Weapon(	1445	)
	Weapon(	1446	)
	Weapon(	1447	)
	Weapon(	1450	)
	Weapon(	1451	)
	Weapon(	1452	)
	Weapon(	1460	)
	Weapon(	1461	)
	Defence( 455	)
	Defence( 453	)
	Defence()
	Defence()
	Defence( 891	)
	Defence( 6846	)
	Defence( 890	)
	Defence()
	Defence( 456	)
	Defence( 1020	)
	Defence()
	Defence()
	Defence( 3074	)
	Defence( 3075	)	



	Talk( 4, "�����: ����� ����� ������� ����������? ")
	Text( 4, "����� �������� ",JumpPage,5)
	Text( 4, "��������� ����� ", JumpPage,6)
	Text( 4, "����� ������ ", JumpPage,7)


	InitTrigger() --�?��????????
	TriggerCondition( 1, HasItem, 4358, 30 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 4358, 30 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1120, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(5, "�����: ��� ������������ ����� �������� ��� ���������� 30 ����� ������� ")
	Text( 5, "�������� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�?��????
	TriggerCondition( 1, HasItem, 4809, 30 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 4809, 30 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1121, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(6, "�����: ��� ������������ ��������� ����� ��� ���������� 30 ��������� ����� ")
	Text( 6, "�������� ",MultiTrigger, GetMultiTrigger(), 1) 
	
	InitTrigger() --�?��????
	TriggerCondition( 1, HasItem, 2419, 20 )
	--TriggerCondition( 1, HasItem, 3909, 2 )
        TriggerAction( 1, TakeItem, 2419, 20 )
	TriggerAction( 1, TakeItem,  3909, 2 )
	TriggerAction( 1, GiveItem,1122, 1,4 )
	TriggerFailure( 1, JumpPage, 8 ) 
	Talk(7, "�����: ��� ������������ ����� ������ ��� ���������� 30 ��������� ������ ")
	Text( 7, "�������� ",MultiTrigger, GetMultiTrigger(), 1) 
	
	Talk( 8, "�����: � ���� ��� ���� ����������� ����������� ��� ���� ��������� ������������ ")
	
	AddNpcMission ( 703 )
	AddNpcMission	(1044)
	AddNpcMission	(1096)
	AddNpcMission	(1155)
	AddNpcMission	(1207)
	AddNpcMission	(58)
	AddNpcMission	(59)
	AddNpcMission	(60)
	AddNpcMission(	1221	)


end
-----------------------------------------------------------------С�����������----------------------------------------------------------------------------------------------




------------------------------------------------------------------
--								--
--								--
------------------------����������˹����---------------------------
--			221925,274925				--
--								--
------------------------------------------------------------------
function r_talk01 ()
	
	Talk( 1,  "��� �� �������: ������������, �� ������ �� ������� � ���� �����. ���� �� � ��� �� ������? " )
	Text( 1,  "��� ��? ", JumpPage, 2)
	Text( 1,  "� ���� ��� ������? ", JumpPage, 3 )
	Text( 1,  "��� ����� �������� ���? ", JumpPage, 5 )
	Text( 1,  "��� ����� ����, ����? ", JumpPage, 6 )
	Text( 1,  "��� ����� ������? ", JumpPage, 7 )
	Text( 1,  "��� ��������� ���� �� 99 ��? ", JumpPage, 8 )
	Text( 1,  "��� ����� ����? ", JumpPage, 9 )
	Text( 1,  "��� ����� �������? ", JumpPage, 10 )
	
	Text( 1,  "� ����� ��� �����. �������. ", CloseTalk)

	Talk( 2,  "��� �� �������: � ������� �� ������� ������� ����-�������. ���� � ��� �������� ����� �� ���������, �� ����� ���� :) " )
	Text( 2,  "�����. ", JumpPage, 1)

	Talk( 3,  "��� �� �������: ����� ���� ������� ����� �����������, ������� ��� ����� ���� ���� ������ ����� � ����, ���� �� ����� ���� ����, �� ������� ��� ����� ���� �� ������ 100 ���. " )
	Text( 3,  "�����. ", JumpPage, 1)

	Talk( 5,  "��� �� �������: � ������� � ������� ���� �������� �� ������ �����, ��� - �� �� �� � ������. " )
	Text( 5,  "�����. ", JumpPage, 1)

	Talk( 6,  "��� �� �������: � ������� ����� � �������� �� ����� ���������� �� �����. " )
	Text( 6,  "�����. ", JumpPage, 1)

	Talk( 7,  "��� �� �������: �� ����� ������� ������, ������� ����� ����� ����������� �������, �� ����� �������. " )
	Text( 7,  "�����. ", JumpPage, 1)

	Talk( 8,  "��� �� �������: ��� ��� ��������� ����, �������� ��?! ��������� ��� �� 10000. ���� ���� ����� ��������� �� �� 99, ����� ���� ������� ��������� � ��������, �� ������ ������������ ���������� ����� ����� � ����, � ����� � ����� ������������ � ������ ������ ��������� �� 99 ��. " )
	Text( 8,  "�����. ", JumpPage, 1)

	Talk( 9,  "��� �� �������: �� ���� �� �������, �� ���� ����� ���� � ���-����, ������� � �� ����� ����� ����������� . ��������� �� �� ����� ������ �������. ���� ������������� � �����, ��� �������������� ������ �� ������ �������, ������ ��� ��� ��� ��� ���� � ������� �� ������� ������ ����. ��� � ����� �� ������ �������� ������� ������� ������� �������� �  �� ���� ���������� ����. ���� �� ��� ������� �����, �� ������ ������� ���� � ��������� ����, ����������� �� ������ ��� ���� �� ���, ������� � 00:00 " )
	Text( 9,  "�����. ", JumpPage, 1)

	Talk( 9,  "��� �� �������: ������� ����� ������� � ������ ���������� ����, �� 1 � 2 �����. ���� �� �������� ����������, ��� ��� ������ � ����� ������� ������. " )
	Text( 9,  "�����. ", JumpPage, 1)





----------------ע������

	AddNpcMission ( 203 )
	AddNpcMission ( 204 )
	AddNpcMission ( 205 )
	AddNpcMission ( 206 )
	AddNpcMission ( 221 )
	AddNpcMission ( 222 )
	AddNpcMission ( 1002 )
	AddNpcMission ( 1057 )
	AddNpcMission ( 1112 )
	AddNpcMission ( 1166 )
	AddNpcMission ( 55 )
	AddNpcMission ( 56 )
	AddNpcMission ( 57 )
	AddNpcMission ( 1220 )
	AddNpcMission ( 319 )
	AddNpcMission ( 325 )
	AddNpcMission ( 326 )
---------eleven
	AddNpcMission ( 5037 )	



	MisListPage(8)
end 
---------------<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<NPC ��˹���ء�������!
----------------------------------------------------------
--							--
--							--
--		������[������]				--
--							--
--		227725,276925				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk02 ()

	
	Talk( 1,  "������: ������������ ������� �������. " )
	Text( 1,  "�������� �����. ", JumpPage, 2)
	Text( 1,  "�������� 10 �������� �����. ", JumpPage, 3)
	Text( 1,  "�������� 100 �������� �����. ", JumpPage, 4)
	Text( 1,  "�������� 1000 �������� �����. ", JumpPage, 5)
	Text( 1,  "������� ����������. ", JumpPage, 7 )
	Text( 1,  "�� ��������... ", CloseTalk)
	
	
	Talk( 2,  "������: ����� ������� �������� ����� ���������� 1 ������ ����, 1 �������� ����������, 1 ��������� ������ � 1 ������ �����. " )
	Text( 2,  "������� �������� �����. ", GetChaName_21, 1 )

	Talk( 3,  "������: �� ������ �������� 10 �������� ����� �� 1 ������� �������. ")
	Text(3, "�������� ",  GetChaName_22, 1)

	Talk( 4,  "������: �� ������ �������� 100 �������� ����� �� 3 ��������� ����������. ")
	Text(4, "�������� ",  GetChaName_23, 1)

	Talk( 5,  "������: �� ������ �������� 1000 �������� ����� �� 1 ������� � ������� 4. ")
	Text(5, "�������� ",  GetChaName_24, 1)
	
	InitTrigger() --�Ի�����
	TriggerCondition( 1, HasItem, 3904, 15 )
	TriggerCondition( 1, HasItem, 3911, 15 )
	TriggerCondition( 1, HasItem, 4450, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeItem, 3904, 15 )
	TriggerAction( 1, TakeItem, 3911, 15 )
	TriggerAction( 1, TakeItem, 4450, 1 )
 	TriggerAction( 1, GiveItem, 3342, 1 ,4)
	TriggerFailure( 1, JumpPage, 9 ) 
	Talk( 7,  "������: ����� ��� 15 ������� ������, 15 ���������� �������, � 1 �������� ����� ��� ������ �� ����������. ")
	Text( 7,  "�����. ", MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 9,  "������ � ��� ��� ����������� ������������. ")

	MisListPage(1)

	AddNpcMission ( 282 )
	AddNpcMission ( 283 )
	AddNpcMission	(1026)
	AddNpcMission	(1084)
	AddNpcMission	(1137)
	AddNpcMission	(1189)
	AddNpcMission(	1224	)
	AddNpcMission(	373	)
	AddNpcMission(	374	)
	AddNpcMission(	388	)
--	AddNpcMission( 906 )



end 

function r_talk04 ()

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 1,  "�����: ������! � ��������� �����! ����� ���� ���� ������ ��� ������������. " )
	Text( 1,  "������� ��������� ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 1,  "��������� ", MultiTrigger,GetMultiTrigger(),2)
	--Text( 1,  "Build Ship ", JumpPage, 10)

	Talk( 2,  "�����: ����� ��������, �� ������� ��������� ����� 200 �������. � ��� ������������ �����! " )

	Talk( 3,  "�����: ����� ��������, �� ��������� ����� 50 �������. � ��� ������������ �����! " )

	Talk( 4,  "� �� ��� �������� ������. ������� �� ��������. " )

	Talk( 5,  "�������� ���. ��� �������� ������� �� ���� �������� ������. " )
		
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 6,  "�����: ������! � ��������� �����! ����� ���� ���� ������ ��� ������������. " )
	Text( 6,  "������� ��������� ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 6,  "��������� ", MultiTrigger,GetMultiTrigger(),2)
	

	InitTrigger()
	TriggerCondition( 1, HasMission, 53 )
	TriggerCondition( 1, HasFlag, 53, 1 )
	TriggerCondition( 1, NoRecord, 53 )
	TriggerCondition( 1, NoFlag, 53, 4 )
	TriggerCondition( 1, HasItem, 2304, 1 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 1 )

	Start( GetMultiTrigger(), 1 )
	AddNpcMission	(1048)
	AddNpcMission	(1210)
	AddNpcMission	(920)-----------------------------------------
	AddNpcMission	(921)

	MisListPage(6)
	
	-----��������
	AddNpcMission ( 6117 )
	AddNpcMission ( 6118 )
	AddNpcMission ( 6119 )
	AddNpcMission ( 6120 )

end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��ʿС�㡪����         ������



----------------------------------------------------------
----							--
--							--
--		������[�ư�Ů - ����]			--
--							--
--		225325,278875				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk05 ()

	Talk( 1,  "�����: ������, � �����! �� ������������� �����? �������� �� ������ ��� ����� ������������� �������... " )
	Text( 1,  "������ ���� ", BuyPage )
	Text(1,  "�������� ��������� ",JumpPage,4)
	Text(1,  "������ � ������������ �������� ",JumpPage,7)
	InitTrade()
	Other(	3916	)

	Talk( 2,  "�����: � ������� �� ����� ���� ������ ��������������? � ���� ���� � ������ ���. ���� �� ������ ��� ������, �� ��������� ��� 100000 �������. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerAction( 1, TakeMoney, 100000 )
	TriggerAction( 1, GiveItem, 4072, 1, 4 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2,  "���� ������ �������������� ", MultiTrigger,GetMultiTrigger(),1)

	Talk( 3,  "�����: ������� �� ������ ������������ �����. ��� ���� �� ��� ������! ������������� ��� �������� ����������� �����. " )

	Talk(4, "��������� ����� �����! �� ��� ������ �������� ��� �������� �������� ���������. ���������� ��������� �� ������ �������� ����� �� ����������� ��������. ")
	Text(4, "� ���� � ���� ���������. � ����� ����� �������� �������. ", JumpPage,5)

	Talk(5, "�������� ������ �������. ����� �� �������� ������� ���� ��������� ����� ���������. ")
	InitTrigger()
	TriggerCondition( 1, HasCredit,20 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 20 )
	TriggerAction( 1, GiveItem, 2602,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "������� ��������� ������� - ��������� 20 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,200 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 200 )
	TriggerAction( 1, GiveItem, 2603,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "������� ���������� �����. ��. - ��������� 200 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,2000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 2000 )
	TriggerAction( 1, GiveItem, 2604,1,4 )
	TriggerFailure( 1, JumpPage, 6)
	Text(5, "������� ���������� ���. ��. - ��������� 2000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)
	Talk(6, "���������� ��������� ���� �� � ��� ��������� ������ � ��������� � ��� �� ������ ���������� ���������. ���������� ��������� �� ������ �������� ���� ���� �������. ",CloseTalk)

	Talk(7, "������! �� ������ ������� � ������ ������ ������� � �������� ����������. ������ ��������� ���������� ��������� �� ������ �������� �� �� ����������� ��������. ")
	InitTrigger()
	TriggerCondition( 1, HasCredit,500 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 500 )
	TriggerAction( 1, GiveItem, 855,5,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "5 ����� ��� - ��������� 500 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,5000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 5000 )
	TriggerAction( 1, GiveItem, 3094,3,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "3 ��������� ���������� - ��������� 5000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,20000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 20000 )
	TriggerAction( 1, GiveItem, 0610,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "��������������� ���������� ������ - ��������� 20000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasCredit,50000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 50000 )
	TriggerAction( 1, GiveItem, 0885,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "��������� �������� 1 ������ - ��������� 50000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,200000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 200000 )
	TriggerAction( 1, GiveItem, 0862,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "�������� ������� - ��������� 200000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)


	InitTrigger()
	TriggerCondition( 1, HasCredit,600000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, DelRoleCredit, 600000 )
	TriggerAction( 1, GiveItem, 1012,1,4 )
	TriggerAction( 1, JumpPage,8 )
	TriggerFailure( 1, JumpPage, 6)
	Text(7, "�������� ���� - ��������� 600000 ����� ���������. " ,MultiTrigger,GetMultiTrigger(),1)

	Talk(8, "����� ���������� � ����������� ������! ��������� ������ ��� ���������� ����� ����. ")

	InitTrigger()
	TriggerCondition( 1, HasRecord, 255 )
	TriggerCondition( 1, NoItem, 4072, 1 )
	TriggerCondition( 1, NoRecord, 242 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )


	Start( GetMultiTrigger(), 1 )

	MisListPage(2)

	AddNpcMission ( 268 )
	AddNpcMission ( 269 )
	AddNpcMission ( 288 )
	AddNpcMission ( 502 )
	AddNpcMission ( 334 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ư�Ů - ���Ƚ���



----------------------------------------------------------
--							--
--							--
--		������[Сɽ��]				--
--							--
--		219350,273050				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk06 ()
	
	
	Talk( 1,  "����� �������: ���������� ��� ���� � ������� � �������? ��� � �������� ����� � ���� ���������� ����? � ������� �������� ����� ������ ����������� ���. " )
	--Text( 1,  "Learn Navigation Skill ", BuyPage )
	Text(1, "������� ��������� ������� ",JumpPage,2)
	Text( 1,  "������� �� ���������. ", CloseTalk)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 3933, 10 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, TakeItem, 3933, 10 )
	TriggerAction( 1, TakeMoney, 5000 )
	TriggerAction( 1, GiveItem, 1812, 1, 4 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "����� �������: �, ����� ��� ������ �����. � ��������� ����� �� ��� ���� ������� �� � ����� �������! ��������� ��� 10 ������� ������ � 5000 ������� � � ������ ��� ��� ��������� �������. " )
	Text( 2,  "������� ��������� ������� ",  MultiTrigger, GetMultiTrigger(), 1 )
	Text( 2,  "���, � ���������. ", CloseTalk)

	Talk(3,  "����� �������: ���, ������� ��������� �������. �� �������� ��� ���������� � ����������� �����. ��������� ���� ��� ����������� ���. ")

	Talk(4,  "����� �������: ��������, � ��� ��� 10 ������� ������ ��� 5000 �������. ")

	InitTrade()
	Other(	3243	)
	Other(	3244	)
	Other(	3245	)
	Other(	3246	)
	Other(	3247	)
	Other(	3248	)
	Other(	3249	)
	Other(	3250	)
	Other(	3251	)
	Other(	3252	)
	Other(	3253	)
	Other(	3254	)
	Other(	3255	)
	Other(	3256	)
	Other(	3257	)
	Other(	3258	)
	Other(	3259	)
	Other(	3260	)
	Other(	3261	)
	Other(	3262	)
	Other(	3263	)
	Other(	3264	)
	Other(	3265	)
	Other(	3266	)
	Other(	3267	)
	Other(	3268	)
	Other(	3269	)
	Other(	3270	)
	Other(	3271	)
	Other(	3272	)
	Other(	3273	)
	Other(	3274	)
	Other(	3275	)
	Other(	3276	)
	Other(	3277	)
	Other(	3278	)
	Other(	3279	)
	Other(	3280	)
	Other(	3281	)
	Other(	3282	)
	Other(	3283	)
	Other(	3284	)
	Other(	3285	)
	Other(	3286	)
	Other(	3287	)
	Other(	3288	)
	Other(	3289	)
	Other(	3290	)
	Other(	3291	)
	Other(	3292	)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3933, 10 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )

	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 748 )
	AddNpcMission	(1045)
	AddNpcMission	(1099)
	AddNpcMission	(1157)
	AddNpcMission	(758)
	AddNpcMission	(103)
	AddNpcMission	(191)
	AddNpcMission	(192)
	AddNpcMission	(193)
	AddNpcMission	(197)
	AddNpcMission(	1225	)
	AddNpcMission(	503	)
	AddNpcMission	(330)
	AddNpcMission	(331)
	AddNpcMission	(332)
	AddNpcMission	(335)
	AddNpcMission	(359)
	AddNpcMission	(360)
	AddNpcMission	(361)
	AddNpcMission	(362)
	AddNpcMission	(363)
	AddNpcMission	(364)
	AddNpcMission	(365)
	AddNpcMission	(366)
	AddNpcMission	(367)
	AddNpcMission	(368)
	AddNpcMission	(369)
	AddNpcMission	(370)
	AddNpcMission	(371)
	AddNpcMission	(522)
------------eleven
	AddNpcMission	(5058)
	AddNpcMission	(5062)
	

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Сɽ������






----------------------------------------------------------
--							--
--							--
--		������[�ӻ����� - ������]			--
--							--
--		225075,277025				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk07 ()

	Talk( 1,  "���������: ������! ���� � ���� ���-������ ������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )
	Text( 1,  "������� ����� ����������. ",JumpPage, 2 )

	InitTrade()
	Other(	3297	)
	Other(	3298	)
	Other(	3164	)
	Other(	3160	)
	Other(	3161	)
	Other(	3165	)
	Other(	3238	)
	Other(	3170	)
	Other(	3293	)
	Other(	3174	)
	Other(	3163	)
	Other(	3176	)
	Other(	3180	)
	Other(	3179	)
	Other(	3177	)
	Other(	3168	)
	Other(	3162	)
	Other(	3166	)
	Other(	3167	)
	Other(	3172	)
	Other(	3173	)
	Other(	3227	)
	Other(	3231	)
	Other(	3228	)
	Other(	3229	)
	Other(	3230	)
	Other(	3232	)
	Other(	3233	)
	Other(	3234	)
	Other(	3235	)
	Other(	3236	)
	Other(	3237	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other(	3141	)
	Other(	4602	)
	Other(	3296	)
	Other(	3299	)
	--baby--�������Lv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--leo
	Other(  2440    )
	--AddNpcMission	(5501)


	---bragi
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1624, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1624, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "��� �������� ����� ���������� ���������� 1 ���������� ������, 10000 ������ � 10 ����� �������� 3 ������. " )
	Text( 2,  "�������� ������� ����� �� ����� ����������. ", MultiTrigger, GetMultiTrigger(), 1)

	---InitTrigger()
	---TriggerCondition( 1, HasLeaveBagGrid, 1 )
	---TriggerCondition( 1, KitbagLock, 0 )
	---TriggerCondition( 1, HasItem, 2588, 1 )
	---TriggerCondition( 1, HasItem, 1842, 10 )
	---TriggerCondition( 1, HasMoney, 10000 )
	---TriggerAction( 1, TakeItem, 2588, 1 )
	---TriggerAction( 1, TakeItem, 1842, 10 )
	---TriggerAction( 1, TakeMoney, 10000 )
	---TriggerAction( 1, GiveItem, 2326, 1 , 4)
	---TriggerAction( 1, JumpPage, 3 )
	---TriggerFailure( 1, JumpPage, 4 )
	---Text( 2,  "Exchange Razor Tooth for Reality Mask ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4545, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4545, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ���� �� ����� ����������. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4543, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4543, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ �� ����� ����������. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1478, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1478, 10 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ �� ����� ����������. ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "��������: �������! ����� ���������� ������. " )
	Talk( 4,  "��������: �� �� ������ ���� ����������� ����������� ��� ��� ��������� ������������. " )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ӻ����� - ����������


----------------------------------------------------------
--							--
--							--
--		������[�����������]			--
--							--
--		227459,277722				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk08 ()

	Talk( 1,  "��������: ������! ����� �� �����������... ������... ������ ���. �� ����� ��������... " )
	Text( 1,  "������� ����������� ���� ", JumpPage, 2)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3122, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�� ������ ������������� ������� � �������� ����? ����� �� ������������� �� ������! " )
	Text( 2,  "������� ��� ����������� ������. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3117, 10 )
	TriggerAction( 1, TakeItem, 3117, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3123, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "������� ��� �� ������� �������. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3118, 10 )
	TriggerAction( 1, TakeItem, 3118, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3124, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 6 )
	Text( 2,  "������� ������� ���. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3119, 10 )
	TriggerAction( 1, TakeItem, 3119, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3125, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 7 )
	Text( 2,  "������� ��� ������ �������. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3120, 10 )
	TriggerAction( 1, TakeItem, 3120, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3126, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 2,  "������� ���������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "��������: ��� �� ��� �� ������! �� ������ � �� ������. " )
	Talk( 4,  "��������: ����� ������� 1 ��� ����������� ������ ���������� 10 ���������� ������� � 1 ������. " )
	Talk( 5,  "Margaret: ����� ������� 1 ��� �� ������� ������� ���������� 10 ������� ������� � 1 ������. " )
	Talk( 6,  "��������: ����� ������� 1 ������� ��� ���������� 10 ������ � 1 ������. " )
	Talk( 7,  "��������: ����� ������� 1 ��� ������ ������� ���������� 10 ������ ������� � 1 ������. " )
	Talk( 8,  "��������: ����� ������� 1 ���������� ���������� 10 �������� ������� � 1 ������. " )
	AddNpcMission	(1023)
	AddNpcMission	(1080)
	AddNpcMission	(1135)
	AddNpcMission	(1186)
	AddNpcMission(	1223	)
	




end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����������


----------------------------------------------------------
--							--
--							--

	--������[�õ��ϰ塤��������]		--
--							--
--		221150,278125				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk09 ()
	
	
	Talk( 1,  "������: ��� ���������� ������ ������ ��� �����? " )		
	Text( 1,  "������� ��������� ��� �����. ", JumpPage, 2)
	--Text( 1,  "���� Pet Items ", BuyPage )
	
	-- �������������� �����
	Text(1,  "����������� ������� ��������� ���� ", JumpPage, 10)
	Text(1,  "����������� �������������� ���� ", JumpPage, 13)

InitTrade()
	Other(	227	)
	Other(	5826	)
	Other(	5827	)
	Other(	5828	)
	Other(	578	) 
	Other(	262	)
	Other(	1015	)
	Other(	679	)
	Other(	222	)
	Other(	276	)
	Other(	5829	)
	Other(	5830	)
	Other(	223	)
	Other(	277	)
	Other(	5831	)
	Other(	5832	)
	Other(	224	)
	Other(	278	)
	Other(	5833	)
	Other(	5834	)
	Other(	225	)
	Other(	279	)
	Other(	5835	)
	Other(	5836	)
	Other(	226	)
	Other(	280	)
	Other(	5837	)
	Other(	5838	)
	Other(	244	)
	Other(	260	)
	Other(	253	)
	Other(	247	)
	Other(	250	)
	Other(	239	)
	Other(	608	)
	Other(	610	)
	Other(	3918	)
	Other(	3919	)
	Other(	3920	)
	Other(	3921	)
	Other(	3922	)
	Other(	3924	)
	Other(	3925	)
	Weapon(	2337	)
	Weapon(	5011	)
	Weapon(	3187	)
	Weapon(	3188	)
	Weapon(	3190	)
	Weapon(	3239	)
	Weapon(	3197	)
	Weapon(	3193	)
	Weapon(	3241	)
	Weapon(	3192	)
	Weapon(	3198	)
	Weapon(	3202	)
	Weapon(	3203	)
	Weapon(	3204	)
	Weapon(	3225	)
	Weapon(	3226	)
	Weapon(	3294	)
	Weapon(	3295	)
	Weapon(	3141	)
	Weapon(	4602	)
	Weapon( 3296 )
	--baby--�������Lv1
	Weapon(	2679	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	2709	)
	--Leog
	Weapon(  2440    )
	
---------------------�����ζ�Ļ���
	InitTrigger()
	TriggerCondition( 1, HasItem, 2886, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2886,10 )
	TriggerAction( 1, GiveItem, 2895, 1 , 4)
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 12)
	Talk( 10,  "�������: ��� ��������� 10 ���������� � 10000 ������. ")
	Text(10,  "����������� ",  MultiTrigger, GetMultiTrigger(), 1)

	Talk(11,  "�������: ��� ������� ���� �������! ������� �� ������� ��� ������ ����! " )

	Talk( 13,  "�������: ������ �������� �� ����� ���� �������������� ������! ")
	Text(13,  "������ �������������� ����. ",  JumpPage, 15)
	Text(13,  "������ �������������� ����. ",  JumpPage, 16)
	Text(13,  "������ �������������� ����. ", JumpPage, 17)
	---------------------���ʥ�����
	InitTrigger()
	TriggerCondition( 1, NoRecord, 815 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction( 1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 815 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 14 )
	Talk( 15,  "�������: ������� ������� ��������������� ���� �� ������. ��� ���������� 10 ������ ������� ���������� � 1 ��������������� ����. ����� �� ������ ��������� 10000 ������. � ����� ����������� ��������������� ���� ���� 3 ����! ")
	Text( 15,  "����������� ",  MultiTrigger, GetMultiTrigger(), 1)

	

	---------------------���ʥ�����
	InitTrigger()
	TriggerCondition( 1, HasRecord, 815 )
	TriggerCondition( 1, NoRecord, 816 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney,1000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 1000000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction(1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 816 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage, 18 )
	Talk(16,  "�������: ������� ������� ��������������� ���� �� ������. ��� ���������� 10 ������ ������� ���������� � 1 ��������������� ����. ����� �� ������ ��������� 1000000 ������. � ����� ����������� ��������������� ���� ���� 3 ����! ")
	Text( 16,  "����������� ",  MultiTrigger, GetMultiTrigger(), 1)

	---------------------���ʥ�����
	InitTrigger()
	TriggerCondition( 1, HasRecord, 816 )
	TriggerCondition( 1, NoRecord, 817 )
	TriggerCondition( 1, HasItem, 2895, 10 )
	TriggerCondition( 1, HasItem, 2894, 1 )
	TriggerCondition( 1, HasMoney, 10000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000000 )
	TriggerAction( 1, TakeItem, 2895,10 )
	TriggerAction( 1, TakeItem, 2894,1 )
	TriggerAction( 1, GiveItem, 2898, 1 , 4)
	TriggerAction( 1, SetRecord, 817 )
	TriggerAction( 1, JumpPage, 11 )
	TriggerFailure( 1, JumpPage,19 )
	Talk(17,  "�������: ������� ������� ��������������� ���� �� ������. ��� ���������� 10 ������ ������� ���������� � 1 ��������������� ����. ����� �� ������ ��������� 10000000 ������. � ����� ����������� ��������������� ���� ���� 3 ����! ")
	Text( 17,  "����������� ",  MultiTrigger, GetMultiTrigger(), 1)
	Talk( 14,  "�������: ������� �� �� ������ ���� ����������� ����������� ��� ���������� ������! ����� �� ������ ����� 1 ��������� ������ � ���������. �� ������� ��������������� ���� �������? �� ������� ����������� ��� ���� 3 ����! ")
	Talk( 18,  "�������: ������� �� �� ������ ���� ����������� ����������� ��� ���������� ������! ����� �� ������ ����� 1 ��������� ������ � ���������. �� ������� ��������������� ���� ������ ���? �� ������� ����������� ��� ���� 3 ����! ")
	Talk( 19,  "�������: ������� �� �� ������ ���� ����������� ����������� ��� ���������� ������! ����� �� ������ ����� 1 ��������� ������ � ���������. �� ������� ��������������� ���� � ������ ���? �� ������� ����������� ��� ���� 3 ����! ")
	Talk( 12,  "�������: ������� �� �� ������ ���� ����������� ����������� ��� ���������� ������! ����� �� ������ ����� 1 ��������� ������ � ���������. ")
------------------�����ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 1787, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1787, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1797, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�������: ����� ���� � ��� �� ���� �������� ��������� ������. � ���� ����������� ��� ��� ��������� ��� ������������� ��� �����. " )
	Text( 2,  "������� ������� ��������� ", MultiTrigger, GetMultiTrigger(), 1)
---------------------�����ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 1788, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1788, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1798, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "������� ��������� ��������� ", MultiTrigger, GetMultiTrigger(), 1)
---------------------�����ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 4606, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 4606, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 4607, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 2,  "������� ������ ��������� ", MultiTrigger, GetMultiTrigger(), 1)
---------------------�����ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 4608, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 4608, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 4609, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 9 )
	Text( 2,  "������� ���������� ��������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "�������: ������! �������� ���� ������������ ���������, ��������� ������ ��� ���. " )
	Talk( 4,  "�������: ����� ����������� 1 ������� ��������� ���������� 5 ������� ������, 1 ������ ���, 1 �������� ������ � 200 �������. " )
	Talk( 5,  "�������: ����� ����������� 1 ��������� ��������� ���������� 5 ��������� ������, 1 ������ ���, 1 �������� ������ � 200 �������. " )

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "< ", 2 )
	TriggerAction( 1, AddExp, 116688305, 116688305 )
	TriggerAction( 1, AddExpAndType,2,370500,370500)
	TriggerAction( 1, AddMoney, 1000000 )
	TriggerFailure( 1, JumpPage, 7 )
	Talk( 6,  "Marriam: To test PK, I will make you Lv 65 and add 1 million gold for you. " )
	Text( 6,  "Ok ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 7,  "Marriam: I only give this chance to level 1 new players. " )

	Talk( 8,  "�������: ����� ����������� 1 ������ ��������� ���������� 5 ������ ������, 1 ������ ���, 1 �������� ������ � 200 �������. " )
	Talk( 9,  "�������: ����� ����������� 1 ���������� ��������� ���������� 5 ���������� ������, 1 ������ ���, 1 �������� ������ � 200 �������. " )

	AddNpcMission	(1029)
	AddNpcMission	(1192)
	------------����-----------��Ϊ����-----------���֮��------------��������----------����̩
	--AddNpcMission	(5505)
	--AddNpcMission	(5506)
	--AddNpcMission	(5508)
	--AddNpcMission	(5509)
	--AddNpcMission	(5536)

end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�õ��ϰ塤��������




----------------------------------------------------------
--							--
--							--
--		������[��ķ]				--
--							--
--		222629,272668				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk11 ()
	
	
	Talk( 1,  "������: ������! � �������� ��� ���� ������� �������... ���������! �� �������! " )


	AddNpcMission	(1009)
	AddNpcMission	(1173)

	-----��������
	AddNpcMission ( 6123 )
	AddNpcMission ( 6124 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��ķ



----------------------------------------------------------
--							--
--							--
--		������[ˮ�֡�����]			--
--							--
--		235013,284694				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk12 ()
	
	
	Talk( 1,  "����: ������! � ����� ����. " )

--	InitTrigger()
--	TriggerCondition( 1, HasMission, 1043 )
--	TriggerCondition( 1, HasRecord, 1042 )
--	TriggerCondition( 1, NoRecord, 1058 )
--	TriggerAction( 1, JumpPage, 2 )
--	TriggerFailure( 1, JumpPage, 3 )
--	Text( 1,  "First question ",MultiTrigger, GetMultiTrigger(), 1 )
--
--	InitTrigger()
--	TriggerAction( 1, SetRecord, 1044 )
--	TriggerAction( 1, SetRecord, 1058 )
--	TriggerAction( 1, JumpPage, 4 )
--	Talk( 2,  "Is killing Mystic Shrubs fun? ")
--	Text( 2,  "Good ",MultiTrigger, GetMultiTrigger(), 1 )
--
--	InitTrigger()
--	TriggerAction( 1, SetRecord, 1045 )
--	TriggerAction( 1, SetRecord, 1058 )
--	TriggerAction( 1, JumpPage, 5 )
--	Text( 2,  "Not happy ",MultiTrigger, GetMultiTrigger(), 1  )
--
--
--	Talk( 3,  "Who are you? I do not know you! ")
--	Talk( 4,  "Good? Let's continue. ")
--	Talk( 5,  "No satisfied? Let's change another for you to kill ")

	AddNpcMission	(1039)
	AddNpcMission	(1202)
	AddNpcMission	(80)
	AddNpcMission	(81)
	AddNpcMission	(79)
	----------------����˹-����---01
	AddNpcMission	(5510)
--	AddNpcMission ( 6061 )
--	AddNpcMission ( 6062 )
--	AddNpcMission ( 6063 )
--	AddNpcMission ( 6064 )
--	AddNpcMission ( 6065 )
--	AddNpcMission ( 6066 )
--	AddNpcMission ( 6067 )
--	AddNpcMission ( 6068 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ˮ�֡�����


----------------------------------------------------------
--							--
--							--
--		������[���г��ɡ�Ħ����]			--
--							--
--		222050,270400				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk13 ()
	
	
	Talk( 1,  "������: ������! � ������ ������! � ����� ����� ���� ���� ������ ��� �������� �������! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (��������� 200 �������) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "��������, �� �� ������ ����������� ���������� ������! " )

	AddNpcMission	(1050)
	AddNpcMission	(1212)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���г��ɡ�Ħ����

----------------------------------------------------------
--							--
--							--
--		������[�����ٽ�������˹]			--
--							--
--		230228,270157				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk14 ()
	
	
	Talk( 1,  "������: ������, � ������� ������. ��� � ����� �������! " )
	

	InitTrigger()
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, GiveItem, 4082, 1, 4)
	Talk( 2,  "������: ���? �� �������� ������� ����������� ����? ��������� �� ����� � ���� ������������� ��� ����. � ������� �� 20000 ������ � ����� ��� ��� ������������! ")
	Text( 2,  "������, � ���� ������ ������� ����������� ����. ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasMission, 248 )
	TriggerCondition( 1, NoItem, 4082, 1 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerCondition( 2, HasRecord, 249 )
	TriggerCondition( 2, NoRecord, 250 )
	TriggerCondition( 2, NoItem, 4082, 1 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerFailure( 2, JumpPage, 1 )

	Start( GetMultiTrigger(), 2 )

	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 274 )
	AddNpcMission ( 275 )
	AddNpcMission ( 276 )
	AddNpcMission	(1016)
	AddNpcMission	(1179)
	AddNpcMission	(69)
	AddNpcMission	(70)
	AddNpcMission	(71)
	AddNpcMission	(194)
	AddNpcMission	(195)
	AddNpcMission	(196)
	AddNpcMission	(318)
	AddNpcMission	(323)
	AddNpcMission	(324)
----------eleven
	AddNpcMission	(5053)

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����ٽ�������˹



----------------------------------------------------------
--							--
--							--
--		������[ɳᰳǴ�ʹ��ϯ��]			--
--							--
--		225648,270640				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk15 ()
Talk( 1, " �������? " )

InitTrigger()
TriggerCondition( 1, HasMoney, 0 )
TriggerAction( 1, TakeMoney, 0 )
TriggerAction( 1, AddExp, 9000000 )

Text( 1, " ����� ", MultiTrigger, GetMultiTrigger(), 1)

end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ɳᰳǴ�ʹ��ϯ��


----------------------------------------------------------
--							--
--							--
--		������[�������̻�᳤�����׵���˹]		--
--							--
--		224207,274850				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk16 ()
	
	
	Talk( 1,  "�����: � ��������� � ������� �� ��� �������� � ���� ������. � ���� ������� ��� ��� ����� ����� ������� � �������. " )
	
	AddNpcMission ( 271 )
	AddNpcMission ( 277 )
	AddNpcMission ( 278 )
	AddNpcMission ( 280 )
	AddNpcMission ( 286 )
------------1.7
	AddNpcMission (5076 )
	AddNpcMission (5077 )
	AddNpcMission (5078 )
	AddNpcMission (5079 )
	AddNpcMission (5088 )
	AddNpcMission (5110 )
	AddNpcMission (5112 )
	AddNpcMission (5114 )
	AddNpcMission (5116 )
	AddNpcMission (5147 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�������̻�᳤�����׵���˹

----------------------------------------------------------
--							--
--							--
--		������[���ߡ���Ϳɽ��]			--
--							--
--		227208,270036				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk17 ()
	
	
	Talk( 1,  "�������: ������� ����� ����� ����� ������� �������! " )

	AddNpcMission ( 266 )
	AddNpcMission ( 267 )
	AddNpcMission ( 270 )
	AddNpcMission ( 272 )
	AddNpcMission ( 273 )
	AddNpcMission ( 337 )
	AddNpcMission ( 338 )
	AddNpcMission ( 554 )
	AddNpcMission ( 555 )
	AddNpcMission ( 901 )
	---------------����
	AddNpcMission	(5557)
	AddNpcMission	(5558)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���ߡ���Ϳɽ��

----------------------------------------------------------
--							--
--							--
--		������[�᳤��������]			--
--							--
--		224075,275275				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk18 ()
	
	
	Talk( 1,  "����: � ����� � ������ ��������� ���� ����� � � ������������� ����� ���� �� ������. " )
	
	AddNpcMission ( 76 )
	AddNpcMission ( 77 )
	AddNpcMission ( 78 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�᳤��������

----------------------------------------------------------
--							--
--							--
--		������[·�ˡ���]				--
--							--
--		221588,282819				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk19 ()
	
	
	Talk( 1,  "��������: �� ���� ������� �������� ���������� ����� ��� ������� ���������� �������. ��� ������! � ����� ������� � ����� �������� �����. ���� �� � ���� �� ������ �������� ������ 13, � ����� �� ��� �� ����� �������. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ���

----------------------------------------------------------
--							--
--							--
--		������[�ƹ��ҵ���]			--
--							--
--		236002,281965				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk20 ()
	
	
	Talk( 1,  "������: �? ���? �� ��� �� ������? ����� �� �� �� ������. " )
	
	AddNpcMission ( 500 )
	AddNpcMission ( 501 )
	AddNpcMission ( 358 )
	AddNpcMission ( 372 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ƹ��ҵ���

----------------------------------------------------------
--							--
--							--
--		������[���ꡤ�Ƶ�]			--
--							--
--		196225,269425				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk21 ()
	
	
	Talk( 1,  "�����: ������, � �����. � ��? ������� ��� �� ����� �� ����������� � ��������� �����. " )
	
	AddNpcMission ( 210 )
	AddNpcMission ( 211 )
	AddNpcMission	(1034)
	AddNpcMission	(1197)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���ꡤ�Ƶ�

----------------------------------------------------------
--							--
--							--
--		������[����ʦ��������]			--
--							--
--		173269,278261				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk22 ()
	
	
	Talk( 1,  "�������: ������ ������������ ����� ��� � ���! �� �� ���� ������� ����������� ����� ��� ��������. " )
	
	AddNpcMission	(1054)
	AddNpcMission	(1216)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����ʦ��������


----------------------------------------------------------
--							--
--							--
--		������[D���̡���˽��]			--
--							--
--		2298,2520				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk23 ()
	
	
	Talk( 1,  "������������� �����: ����������� ������? � ���� ���, � ��� �� ����������! " )
	
	AddNpcMission	(1000)
	AddNpcMission	(1164)
			--------���˽�
	--AddNpcMission	(5601)
	--AddNpcMission	(5602)
	--AddNpcMission	(5603)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<D���̡���˽��


----------------------------------------------------------
--							--
--							--
--		������[����˾��١���˹����]		--
--							--
--		71350,141619				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk24 ()
	
	
	Talk( 1,  "�������: ������! � ������� ����� ������� � ����������. �� ������� ������������� � ����� �������? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerCondition( 1, NoGuild )
	TriggerAction( 1, CreateGuild, 0 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "������� ������� ����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 2,  "�������: ����� ������� ������� ����� �� ������ ��������� 100000 ������ � �������� ������ ������. ��� �� �������� ���� �����������. " )
        
	AddNpcMission	(566)
	AddNpcMission	(477)
	AddNpcMission	(478)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����˾��١���˹����


----------------------------------------------------------
--							--
--							--
--		������[�ưɷ���Ա������]			--
--							--
--		99053,133465				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk25 ()
	
	
	Talk( 1,  "����: ������! �� ������� ��� ������ ������ 13? ��� ��� ����! � ����� �������� �������� ��� ������� ����� � ����� ����� ������� ��� ���! " )
	AddNpcMission	(1022)
	AddNpcMission	(1079)
	AddNpcMission	(1134)
	AddNpcMission	(1185)
	AddNpcMission	(378)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ưɷ���Ա������

----------------------------------------------------------
--							--
--							--
--		������[ˮ�֡��ϰ�]			--
--							--
--		108330,128563				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk26 ()
	
	
	Talk( 1,  "���: ������! � ����� ���. ������ ��������� � �������� ����, ��� ���� ����� �������� ��������, � �������� �����! ��� ������� ��� ���� ����� ��� ���. �, ��� ������ ����... " )
	AddNpcMission	(1038)
	AddNpcMission	(1092)
	AddNpcMission	(1150)
	AddNpcMission	(1201)
----------------����˹---ˮ�֡��ϰ�--01
	AddNpcMission (5535 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ˮ�֡��ϰ�






----------------------------------------------------------
--							--
--							--
--		������[��ҽ����ɳ]			--
--							--
--		77300,154900				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk28 ()
	
	
	Talk( 1,  "����: � ���� ��� �� �� ���? � ������� ������ ����������. �� ����� ���� �� ��������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)

	AddNpcMission	(1024)
	AddNpcMission	(1081)
	AddNpcMission	(1136)
	AddNpcMission	(1187)
	----------------1.7
	AddNpcMission (5130 )
	AddNpcMission (5131 )
	AddNpcMission (5132 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��ҽ����ɳ

----------------------------------------------------------
--							--
--							--
--		������[���г��ɡ��꿨��]			--
--							--
--		74300,153400				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk29 ()
	
	
	Talk( 1,  "�������: ����� ���������� � ���� ����������! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (200 �������) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "��������, � ��� ������������ ������ ��� ����� � ���������! " )

	AddNpcMission	(1049)
	AddNpcMission	(1103)
	AddNpcMission	(1159)
	AddNpcMission	(1211)
	AddNpcMission	(320)
	AddNpcMission	(375)
	AddNpcMission	(376)
	AddNpcMission	(377)
	AddNpcMission	(432)
	AddNpcMission	(560)
	AddNpcMission	(561)
	AddNpcMission	(542)
	AddNpcMission	(562)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���г��ɡ��꿨��


----------------------------------------------------------
--							--
--							--
--		������[���������ʸ�]			--
--							--
--		76662,144769				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk30 ()
	
	
	Talk( 1,  "����������: ���? ������? ����. " )
	Text( 1,  "�������� ", JumpPage, 2)
	Text( 1,  "������... ",CloseTalk )


----------------����ˮ��ɰ��Ƭ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1784, 10 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1784, 10 )
	TriggerAction( 1, GiveItem, 1785, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "����������: �����, �����, �����. � ��� ������ ����, ���� �����. " )
	Text( 2,  "�������� ����� ��������� ���������. ",MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 3,  "����������: ��� ����� ��������� ��������� �����. ����� ���� ����� ���� ����������� ������. " )
	Talk( 4,  "����������: ����� ����������� 1 ����� ��������� ��������� ��� ���������� 10 ��������� ����� � 200 ������. " )
	AddNpcMission	(1042)
	AddNpcMission	(1094)
	AddNpcMission	(1153)
	AddNpcMission	(1205)


	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���������ʸ�
----------------------------------------------------------
--							--
--							--
--		������[��Ů������]			--
--							--
--		74026,145143				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk31 ()
	
	
	Talk( 1,  "�����: ������! � ����� ������� ��������. ���� �� ������� ��� �� ������, �� ��������� ��� ����. " )
	
	Text( 1,  "������ ����-������� (��������) ", JumpPage,6 )
	Text( 1,  "������� ������ ", JumpPage,8 )
	Text( 1,  "������� ������ ", JumpPage,11 )
	Text( 1,  "������� �������� ", JumpPage,12 )
	Text( 1,  "������� ��������� ��� ����� ", JumpPage, 2)

	Talk( 6,  "�����: ���������� �������� ��������� � ������� �� ������ � ��������. ��� ������ ���������, ��� ����� ������ �������. �� ������� �����? �������� ��� ����� ����� ����������! " )

	InitTrigger()
	TriggerCondition( 1, NoRecord,834 )
	TriggerCondition( 1, NoRecord,835 )
	TriggerAction( 1, SetRecord, 833 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "����� ",MultiTrigger_1, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord,833 )
	TriggerCondition( 1, NoRecord,835 )
	TriggerAction( 1, SetRecord, 834 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "����� ",MultiTrigger_2, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord,834 )
	TriggerCondition( 1, NoRecord,833 )
	TriggerAction( 1, SetRecord, 835 )
	TriggerAction( 1, SetRecord, 836 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 6,  "������� ",MultiTrigger_3, GetMultiTrigger(), 1)

	Talk( 7,  "�����: ����� �����! " )
  



	InitTrigger()
	TriggerCondition( 1, HasRecord,833 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )
	TriggerAction( 1, SetLog  , 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 1 , 4)
	TriggerAction( 1, AddMoney, 10000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 8,  "�����: �������� 7 ������ ��� ��������� ������ ���� � �������� � ���������� ������. " )
	Text( 8,  "�������� ",MultiTrigger_0, GetMultiTrigger(), 1)



	InitTrigger()
	TriggerCondition( 1, HasRecord,834 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 3 , 4)
	TriggerAction( 1, AddMoney, 50000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 11,  "�����: �������� 7 ������ ��� ��������� ������ ���� � �������� � ���������� ������. " )
	Text( 11,  "�������� ",MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerCondition( 1, HasRecord,835 )
	TriggerCondition( 1, HasItem, 2944, 1 )
	TriggerCondition( 1, HasItem, 2945, 1 )
	TriggerCondition( 1, HasItem, 2946, 1 )
	TriggerCondition( 1, HasItem, 2947, 1 )
	TriggerCondition( 1, HasItem, 2948, 1 )
	TriggerCondition( 1, HasItem, 2949, 1 )
	TriggerCondition( 1, HasItem, 2950, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2944, 1 )
	TriggerAction( 1, TakeItem, 2945, 1 )
	TriggerAction( 1, TakeItem, 2946, 1 )
	TriggerAction( 1, TakeItem, 2947, 1 )
	TriggerAction( 1, TakeItem, 2948, 1 )
	TriggerAction( 1, TakeItem, 2949, 1 )
	TriggerAction( 1, TakeItem, 2950, 1 )

	TriggerAction( 1, GiveItem, 2942, 1 , 4)
	TriggerAction( 1, GiveItem, 2943, 1 , 4)
	TriggerAction( 1, GiveItem, 3094, 5 , 4)
	TriggerAction( 1, AddMoney, 80000 )
	TriggerAction( 1, JumpPage, 9 )
	TriggerFailure( 1, JumpPage, 10 )
	Talk( 12,  "�����: �������� 7 ������ ��� ��������� ������ ���� � �������� � ���������� ������. " )
	Text( 12,  "�������� ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10,  "�����: �� �� ������� ��� �������, ��� ��� ��������� ������������. �������� ����� � ��� ��� ��������� �����. ")
	Talk( 9,  "�����: ������ ������ ���� ���! ")
	Talk( 13,  "�����: �� ������ ������ ���� ����� ���� 1 ���! ")

	InitTrigger()
	TriggerCondition( 1, HasItem, 1789, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1789, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1799, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�����: ���������� ������� ��������? � ���������� ��� ��� ������ ���������! " )
	Text( 2,  "������� ������ ��������� ",MultiTrigger, GetMultiTrigger(), 1)
---------------������ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 1790, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1790, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1800, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "������� ������� ��������� ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "�����: ��� ���������, � ������� �� ���������! " )
	Talk( 4,  "�����: ����� ������� ������ ��������� ��������� 5 ������ ������, 1 ������ ���, 1 �������� ������ � 200 �������! " )
	Talk( 5,  "�����: ����� ������� ������� ��������� ��������� 5 ������� ������, 1 ������ ���, 1 �������� ������ � 200 �������! " )
	AddNpcMission	(1036)
	AddNpcMission	(1090)
	AddNpcMission	(1148)
	AddNpcMission	(1199)
	AddNpcMission	(867)
	AddNpcMission	(863)
	------------------------------------------
	AddNpcMission	(5536)
	AddNpcMission	(5537)
	AddNpcMission	(5538)
	AddNpcMission	(5539)
	AddNpcMission	(5540)
	AddNpcMission	(5541)

	AddNpcMission	(5542)
	AddNpcMission	(5543)
	AddNpcMission	(5544)
	AddNpcMission	(5545)
	AddNpcMission	(5546)
	AddNpcMission	(5547)

	AddNpcMission	(5548)
	AddNpcMission	(5549)
	AddNpcMission	(5550)
	AddNpcMission	(5551)
	AddNpcMission	(5552)


	AddNpcMission	(5597)
	AddNpcMission	(5600)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��Ů������


----------------------------------------------------------
--							--
--							--
--		������[ɳ�פ��������ʹ�����¼�]		--
--							--
--		71220,150827				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk32 ()
	
	
	Talk( 1,  "�����: ������! � ����� �������. � ��� ���� �������? ���� ��� ����� ���� � ���� �����! " )
	AddNpcMission	(1033)
	AddNpcMission	(1088)
	AddNpcMission	(1145)
	AddNpcMission	(1196)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ɳ�פ��������ʹ�����¼�

----------------------------------------------------------
--							--
--							--
--		������[�������ˡ��ݲ���ά˹]		--
--							--
--		74100,156300				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk33 ()
	
	
	Talk( 1,  "�����: ������! � ���� ������� � ���� ������. ����� ��� ��������� ���� ������. " )

	AddNpcMission	(1008)
	AddNpcMission	(1063)
	AddNpcMission	(1118)
	AddNpcMission	(1172)
	AddNpcMission	(850)
	AddNpcMission	(861)
	AddNpcMission	(868)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�������ˡ��ݲ���ά˹

----------------------------------------------------------
--							--
--							--
--		������[�ù��ϰ塤��������]		--
--							--
--		69761,154269				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk34 ()
	
	
	Talk( 1,  "������� ����: ��� ��������� �������, ��������� ��� ������������. " )
	AddNpcMission	(1030)
	AddNpcMission	(1086)
	AddNpcMission	(1139)
	AddNpcMission	(1193)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ù��ϰ塤��������

----------------------------------------------------------
--							--
--							--
--		������[��װ����������]			--
--							--
--		75450,151200				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk35 ()
	
	
	Talk( 1,  "������: ������! � ������ ������ �� �������! " )
	Text( 1,  "�������... ",CloseTalk )
	AddNpcMission	(1010)
	AddNpcMission	(1066)
	AddNpcMission	(1122)
	AddNpcMission	(1174)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��װ����������

----------------------------------------------------------
--							--
--							--
--		������[������פ��������ʹ��������]		--
--							--
--		74171,155325				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk36 ()
	
	
	Talk( 1,  "���: ������ ���� �������� ������� ��� ����� �������. ������. " )
	AddNpcMission	(1003)
	AddNpcMission	(1058)
	AddNpcMission	(1113)
	AddNpcMission	(1167)
--	AddNpcMission ( 6025 )
--	AddNpcMission ( 6026 )
--	AddNpcMission ( 6027 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<������פ��������ʹ��������

----------------------------------------------------------
--							--
--							--
--		������[�����������Կ�]			--
--							--
--		79600,148800				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk37 ()
	
	
	Talk( 1,  "������: ������! � �������� �������� ����������. " )
	Text( 1,  "������... ",CloseTalk )

	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 1 )
	TriggerCondition( 1, HasItem, 1673, 1 )
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerAction( 1, TakeItem, 1673, 1 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, SetProfession, 10 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 2 )
	TriggerCondition( 2, PfEqual, 1 )
	TriggerCondition( 2, HasItem, 1673, 1 )
	TriggerCondition( 2, HasMoney, 20000 )
	TriggerAction( 2, TakeItem, 1673, 1 )
	TriggerAction( 2, TakeMoney, 20000 )
	TriggerAction( 2, SetProfession, 10  )
	TriggerAction( 2, JumpPage, 3 )
	TriggerFailure( 2, JumpPage, 4 )

	Talk(2,  "Pirates and monsters are rampant nowadays. We are lacking of Swordsman to deal with them. Hmm...You look suitable to become a Swordsman. Want to consider being the one to defend the peace? ")
	Text(2,  "Ok, become a White Knight ", MultiTrigger, GetMultiTrigger(), 2)
	Text(2,  "No, it is good enough for now. ", CloseTalk)

	Talk(3,  "Keeping the peace is the job of a White Knight. Please remember this in your heart. ")

	Talk(4,  "Want to become a White Knight? Come back to me when you have reached Lv 40. You must train your swordsmanship well. Remember to bring 1 Strange Metal Fragment and 20000G as a proof of your training too. ")
	

	
	
	
		

	----------תְ��Ϊ����ʿ
	--TriggerCondition( 1, LvCheck,  "> ", 39 )
	--TriggerCondition( 1, IsCategory, 1 )
	--TriggerCondition( 1, PfEqual, 1 )
	--TriggerAction( 1, JumpPage, 2 )

	--TriggerCondition( 2, LvCheck,  "> ", 39 )
	--TriggerCondition( 2, IsCategory, 2 )
	--TriggerCondition( 2, PfEqual, 1 )
	--TriggerAction( 2, JumpPage, 2 )

-------------------ת�ѻ����ж�

	AddNpcMission	(1019)
	AddNpcMission	(1074)
	AddNpcMission	(1130)
	AddNpcMission	(1182)
	AddNpcMission	(852)
	AddNpcMission	(855)
	AddNpcMission	(865)
	AddNpcMission	(473)

	MisListPage(5)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����������Կ�

----------------------------------------------------------
--							--
--							--
--		������[�ӻ����ˡ����]			--
--							--
--		72500,155100				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk38 ()
	
	
	Talk( 1,  "����: ������! �� ������� ��� ��� �������. �� ������ �������� ������ � ����! " )
	Text( 1,  "������... ",CloseTalk )
	AddNpcMission	(1053)
	AddNpcMission	(1107)
	AddNpcMission	(1163)
	AddNpcMission	(1215)

		
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ӻ����ˡ����

----------------------------------------------------------
--							--
--							--
--		������[��Ů������]			--
--							--
--		101653,128642				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk39 ()
	
	
	Talk( 1,  "�����: �� ���� �� ������ ������. ��������� �� �� �������� �������? ��� ��������� � ������. ������� ������� �����. " )
	AddNpcMission	(1035)
	AddNpcMission	(1089)
	AddNpcMission	(1147)
	AddNpcMission	(1198)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��Ů������

----------------------------------------------------------
--							--
--							--
--		������[�����ܲ�ָ�ӹ١���.��˹��׼��]	--
--							--
--		80800,152100				--
---------------------2005-3-8-------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk40 ()
	
	
	Talk( 1,  "������� ���: � �������� ����� �������� ��� ������������. �� ������ ���������� ��� ���� �������������. " )
	AddNpcMission	(1017)
	AddNpcMission	(1071)
	AddNpcMission	(1127)
	AddNpcMission	(1180)
---------------����
	AddNpcMission	(5575)
	AddNpcMission	(5576)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����ܲ�ָ�ӹ١���.��˹��׼��

----------------------------------------------------------
--							--
--							--
--		������[�����ܲ���ı������������У]		--
--							--
--		65323,150512				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk41 ()
	
	
	Talk( 1,  "��������� �����: ������! ������� ��� �������� ���� ��������� �� ���� �����. ����. � ����� ���������� ��� ������������. " )
	
	AddNpcMission	(849)
	AddNpcMission	(856)
	AddNpcMission	(858)
	AddNpcMission	(860)
	AddNpcMission	(866)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����ܲ���ı������������У

----------------------------------------------------------
--							--
--							--
--		������[Ħ�����˺��ᡤ�ƶ�]		--
--							--
--		65146,158595				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk42 ()
	
	
	Talk( 1,  "����: �� ����� �������� ��� �� �������? �� ������������� �� ����! " )
	
	AddNpcMission	(851)
	AddNpcMission	(853)
	AddNpcMission	(854)
	AddNpcMission	(862)
	AddNpcMission	(864)


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Ħ�����˺��ᡤ�ƶ�

----------------------------------------------------------
--							--
--							--
--		������[����������]			--
--							--
--		71187,141438				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk43 ()
	
	
	Talk( 1,  "������: ������! � ������� ���� �����. �� � ��� ��� ������������ ��������� �����! " )

	AddNpcMission	(859)
	AddNpcMission	(857)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����������

----------------------------------------------------------
--							--
--							--
--		������[����������]			--
--							--
--		71536,141462				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk44 ()
	
	
	Talk( 1,  "�����: ������! ������� �� ����������� �� ���� � �������! " )

	AddNpcMission	(474)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����������

----------------------------------------------------------
--							--
--							--
--		������[·�ˡ���]				--
--							--
--		66976,155428				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk45 ()
	
	
	Talk( 1,  "���: ��������� ����� ������� ��� � �����. � ��������� ���� ����� ������ ����������. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ���


----------------------------------------------------------
--							--
--							--
--		������[·�ˡ��ͱ�]				--
--							--
--		99475,123473				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk46 ()
	
	
	Talk( 1,  "�����: ������! ������������� �� �� ������ �����? � ���������� ����������� ������ ���� �� �����, ������ �� ������������ ���� ������������. " )
	Text( 1,  "�������� ", JumpPage, 2)

--------------����ؽ�
	InitTrigger()
	TriggerCondition( 1, HasItem, 1782, 10 )
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, TakeItem, 1782, 10 )
	TriggerAction( 1, GiveItem, 1783, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�����: ��� ������ - ���������� ��������� ���������� ���� � ����. " )
	Text( 2,  "�������� ���������� ������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "�����: � ��� ��� ���������� �������. �� ��������� � �������. " )
	Talk( 4,  "�����: ���������� �������? ��������� ��� 10 ���������� ������� ���� � 2000 ������. " )
	
	--��������� �����
    AddNpcMission	(6256)
	AddNpcMission	(6257)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ��ͱ�

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[����١��ʵ�ά��]			--
--							--
--		86299,350092				--
 
-----------------------------------------------------------���￪ʼP������
function r_talk47 ()
	
	
	Talk( 1,  "���: ���������� ��� ����. �� ����������� ���� ������ ����! � ������ ��������� ������� " )
	Text( 1,  "�������� ", JumpPage, 2)
	
	AddNpcMission ( 203 )
	AddNpcMission ( 204 )
	AddNpcMission ( 205 )
	AddNpcMission ( 206 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����١��ʵ�ά��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[���峤����������.��]		--
--							--
--		90374,364023				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk48 ()
	
	
	Talk( 1,  "�������: ������, � ������������ �����. ���� � ��� �� ������? " )
	InitTrigger()
	TriggerCondition( 1, HasMission, 1014 )
	TriggerCondition( 1, HasRecord, 1013 )
	TriggerCondition( 1, NoRecord, 1059 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "������� ���� ������������ ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerCondition( 1, HasRecord, 1059 )
	TriggerCondition( 1, HasNOZSExp )
	TriggerCondition( 1, NoRecord, 1056 )
	TriggerAction( 1, JumpPage, 5 )
	TriggerFailure( 1, JumpPage, 6)
	Text( 1,  "������� ���� ������������ ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 1,  "�� �������� ", CloseTalk)


	InitTrigger()
	TriggerAction( 1, SetRecord, 1015 )
	TriggerAction( 1, SetRecord, 1059 )
	TriggerAction( 1, JumpPage, 4 )
	Talk( 2,  "�������: ��� ������������ ���� 2 ����. �� ������ ������� ����� �� ���. ������ - �������. ��� �� ���� ���������� ����� ������� ������� � ������� �������. ������ ���� - ������. ���� ���� ��� ����������. ")
	Text( 2,  "������� ���� ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerAction( 1, SetRecord, 1016 )
	TriggerAction( 1, SetRecord, 1059 )
	TriggerAction( 1, JumpPage, 4 )
	Text( 2,  "������ ���� ",MultiTrigger, GetMultiTrigger(), 1  )

	Talk( 3,  "�������: �� �� ������ ������� ���� ������������ ��� ��� ������� ")

	Talk( 4,  "�������: ����� ������ ���� �������� ����! ")


	InitTrigger()
	TriggerCondition( 1, HasRecord, 1016 )
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerAction( 1, ClearRecord, 1016 )
	TriggerAction( 1, SetRecord, 1015 )
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8)
	Talk( 5,  "�������: ����� ���� ������������ ��������� ������� ����. ������ �� ��������� �� ��� 5000000 ������? ")
	Text( 5,  "�������� �� ������� ���� ",MultiTrigger, GetMultiTrigger(), 1 )

	InitTrigger()
	TriggerCondition( 1, HasRecord, 1015 )
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerAction( 1, ClearRecord, 1015 )
	TriggerAction( 1, SetRecord, 1016 )
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8)
	Text( 5,  "�������� �� ������ ���� ",MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 6,  "�������: �� �� ������ ������� ���� ������������. ��� ���� ��� ������� ���������� � ����� ��������� ����. ")

	Talk( 7,  "�������: ������ �� ������ �������� ��������. ")

	Talk( 8,  "�������: � ��� ������������ ������ ��� ������ ���� ��� ������. ")

	AddNpcMission ( 231 )
	AddNpcMission ( 232 )
	AddNpcMission ( 234 )
	AddNpcMission	(1037)
	AddNpcMission	(1091)
	AddNpcMission	(1149)
	AddNpcMission	(1200)
	AddNpcMission(	1228	)
	AddNpcMission	(327)
	AddNpcMission	(339)
	AddNpcMission	(340)
	AddNpcMission ( 6017 )
	AddNpcMission ( 6018 )
	



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���峤����������.��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[���ߵ�����ŷ��]			--
--							--
--		86214,359121				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������


-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���ߵ�����ŷ��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[��װ������Ī��]			--
--							--
--		89463,360213				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk50 ()
	
	
	Talk( 1,  "����: � ������������� �������. ���������� ��� ����, �������� ��� ��� �� ������������. " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Defence(	0365	)
	Defence(	0541	)
	Defence(	0717	)
	Defence(	0372	)
	Defence(	0548	)
	Defence(	0724	)
	Defence(	0366	)
	Defence(	0542	)
	Defence(	0718	)
	Defence(	0373	)
	Defence(	0549	)
	Defence(	0725	)
	Defence(	0368	)
	Defence(	0544	)
	Defence(	0720	)
	Defence(	0374	)
	Defence(	0550	)
	Defence(	0726	)
	Defence(	0367	)
	Defence(	0543	)
	Defence(	0719	)
	Defence(	0375	)
	Defence(	0551	)
	Defence(	0727	)
	Defence(	0369	)
	Defence(	0545	)
	Defence(	0721	)
	Defence(	0376	)
	Defence(	0552	)
	Defence(	0728	)
	Defence(	0370	)
	Defence(	0546	)
	Defence(	0722	)
	Defence(	0378	)
	Defence(	0554	)
	Defence(	0730	)
	Defence(	0371	)
	Defence(	0547	)
	Defence(	0723	)
	Defence(	0379	)
	Defence(	0555	)
	Defence(	0731	)
	Defence(	0383	)
	Defence(	0559	)
	Defence(	0735	)
	Defence(	0359	)
	Defence(	0535	)
	Defence(	0711	)
	Defence(	0381	)
	Defence(	0557	)
	Defence(	0733	)
	Defence(	0360	)
	Defence(	0536	)
	Defence(	0712	)
	Defence(	0389	)
	Defence(	0565	)
	Defence(	0741	)
	Defence(	0361	)
	Defence(	0537	)
	Defence(	0713	)
	Defence(	0390	)
	Defence(	0566	)
	Defence(	0742	)
	Defence(	0362	)
	Defence(	0538	)
	Defence(	0714	)
	Defence(	0385	)
	Defence(	0561	)
	Defence(	0737	)
	Defence(	0363	)
	Defence(	0539	)
	Defence(	0715	)
	Defence(	0392	)
	Defence(	0568	)
	Defence(	0744	)
	Defence(	0388	)
	Defence(	0564	)
	Defence(	0740	)
	Defence(	0382	)
	Defence(	0558	)
	Defence(	0734	)
	Defence(	0391	)
	Defence(	0567	)
	Defence(	0743	)


	AddNpcMission ( 715 )
	AddNpcMission	(1011)
	AddNpcMission	(1068)
	AddNpcMission	(1123)
	AddNpcMission	(1175)
	AddNpcMission(	1230	)
	



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��װ������Ī��

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[���г��ɡ����˹]			--
--							--
--		90637,353900				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk51 ()
	
	
	Talk( 1,  "����: ������! ����� ���������� � ���� �������. ���� �� � ��� ���� ������? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (200 ������) ", MultiTrigger, GetMultiTrigger(), 1)
	--Text( 1,  "������� ����� ", BuyPage )
	Text( 1,  "������� ����� ", JumpPage, 3)
	Talk( 2,  "������, �� � ���� ������������ ����� �� ����� " )

	InitTrade()
	Weapon(	7476	)
	Weapon(	7491	)
	Weapon(	7492	)
	Weapon(	7493	)
	
	AddNpcMission	(1051)
	AddNpcMission	(1104)
	AddNpcMission	(1160)
	AddNpcMission	(1213)
	AddNpcMission(	1231	)
-------eleven
	AddNpcMission(	5012	)	
	
Talk( 3, "� ������� �������� ������ ������� ������ " )
--Text( 3,  "������ 10�� (10 ����)", JumpPage, 4)
--Text( 3,  "������ 10�� (50 ����)", JumpPage, 5)
--Text( 3,  "������ 50�� ", JumpPage, 6)
--Text( 3,  "������ 100�� ", JumpPage, 7)
Text( 3,  "������ 500.000 ", JumpPage, 8)
Text( 3,  "������ 500.000 10 ����", JumpPage, 7)
Text( 3,  "������ 1.000.000 ", JumpPage, 9)
Text( 3,  "������ 5.000.000 ", JumpPage, 10)
Text( 3,  "������ 50.000.000 ", JumpPage, 11)
Text( 3,  "������ 100.000.000", JumpPage, 12)
Text( 3,  "������ 500.000.000", JumpPage, 13)
Text( 3,  "������ 1.000.000.000", JumpPage, 14)
Talk( 4, "�� ��� ������� ����� " )
InitTrigger()
TriggerCondition( 1, HasItem,7476,10 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7476,10 )
TriggerAction( 1, AddMoney, 100000000 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(4," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 5, "������ ������� " )
InitTrigger()
TriggerCondition( 1, HasItem,7476,50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7476,50 )
TriggerAction( 1, AddMoney, 500000000 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(5," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 6, "������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7491,1 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7491,1 )
TriggerAction( 1, AddMoney, 50000000 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(6," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 7, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 5000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 5000000 )
TriggerAction( 1, GiveItem, 7493,10,4 )
TriggerFailure( 1, JumpPage, 10)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 8, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 500000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 500000 )
TriggerAction( 1, GiveItem, 7493,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 9, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 1000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 1000000 )
TriggerAction( 1, GiveItem, 854,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 10, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 5000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 5000000 )
TriggerAction( 1, GiveItem, 7734,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 11, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 50000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 50000000 )
TriggerAction( 1, GiveItem, 7735,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 12, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, GiveItem, 7742,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 13, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 500000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 500000000 )
TriggerAction( 1, GiveItem, 7736,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 14, "�� ��?! " )
InitTrigger()
TriggerCondition( 1, HasMoney, 1000000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeMoney, 1000000000 )
TriggerAction( 1, GiveItem, 7743,1,4 )
TriggerFailure( 1, JumpPage, 10)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)


	AddNpcMission ( 2024 )
	AddNpcMission ( 2025 )

end 

function r_talk52 ()
	
	
	Talk( 1,  "������: � ����� �������� �� ����, �� � ��������� �� �� ������������� ���� ��������� ����. " )
	Text( 1,  "������... ",CloseTalk )
	
	
	----------------תְ��Ϊѵ��ʦ
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 2 )
	TriggerCondition( 1, HasMoney, 20000 )
	TriggerCondition( 1, HasItem, 3364, 1 )
	TriggerAction( 1, TakeItem, 3364, 1 )
	TriggerAction( 1, TakeMoney, 20000 )
	TriggerAction( 1, SetProfession, 11 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 2 )
	TriggerCondition( 2, HasMoney, 20000 )
	TriggerCondition( 2, HasItem, 3364, 1 )
	TriggerAction( 2, TakeItem, 3364, 1 )
	TriggerAction( 2, TakeMoney, 20000 )
	TriggerAction( 2, SetProfession, 11  )
	TriggerAction( 2, JumpPage, 6 )
	TriggerFailure( 2, JumpPage, 7 )

	Talk(5,  "Sigh��it's a pity that you are not a Beast Tamer. I believed that you have the ability to become one. Let me teach you how! ")
	Text(5,  "Ok, I will become a Beast Tamer ", MultiTrigger, GetMultiTrigger(), 2)
	Text(5,  "No, it is good enough for now. ", CloseTalk)

	Talk(6,  "How is it? I knew you are born to be a Beast Tamer! ")

	Talk(7,  "Want to become a Beast Tamer? Come back to me when you have reached Lv 40. Train your hunter skills well as they are important foundation for you to advance further. Remember to bring 1 Clarity Crystal and 20000G too. ")


	--TriggerCondition( 2, LvCheck,  "> ", 39 )
	--TriggerCondition( 2, IsCategory, 1 )
	--TriggerCondition( 2, PfEqual, 2 )
	--TriggerAction( 2, JumpPage, 5 )
	--TriggerCondition( 3, LvCheck,  "> ", 39 )
	--TriggerCondition( 3, IsCategory, 3 )
	--TriggerCondition( 3, PfEqual, 2 )
	--TriggerAction( 3, JumpPage, 5 )
	

	--Start( GetMultiTrigger(), 1 )
	

	AddNpcMission ( 243 )
	AddNpcMission ( 244 )
	AddNpcMission	(1012)
	AddNpcMission	(1069)
	AddNpcMission	(1124)
	AddNpcMission	(1176)
	AddNpcMission	(88)
	AddNpcMission	(89)
	AddNpcMission	(90)
	AddNpcMission(	1232	)
	



	
	MisListPage(5)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�����ӳ�Ա������

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[������ͭͭ��]			--
--							--
--		90424,349871				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk53 ()
	
	
	Talk( 1,  "������:��� ��������� ����������,��������� ��� � ����� ��������� ���������� ���������� �����!��� ������ ��������� ���� ��������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "��������� ���������� ", OpenItemTiChun)
	Text( 1,  "���������� ���������� ", OpenUnite)
	Text( 1,  "�������� �������� ", OpenForge)
	Text( 1,  "��������� �������� ", OpenUpgrade)
	Text( 1,  "�������� � �������� ", OpenFusion)
	Text( 1,  "������� ���� ", OpenMilling)
	Text( 1,  "������ ", OpenRepair )


	InitTrade()
	Weapon(	0453	)
	Weapon(	0454	)
	Weapon(	0891	)
	Weapon(	0890	)
	Weapon(	1020	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	0886	)

	Defence( 6819	) 
	Defence( 6822	)
    Defence( 6825	) 
    Defence( 6828	) 
	Defence( 6831	)
	Defence( 0878	) 
	Defence( 0879	)
    Defence( 0880	) 
    Defence( 0881	) 
    Defence( 0882	)
	Defence( 0883	) 
	Defence( 0884	)
	Defence( 0887	) 
    
	Defence( 5772	) 
	Defence( 5773	)
    Defence( 5774	) 
    Defence( 5775	) 

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<������ͭͭ��




--------------------------------------------------------------������ͽ�� 
function mmm_talk04 ()
Talk( 1,  "������: ������! ����� � �������,� ���� ���� ������� �� �������! " )
Text( 1, " ������� �������� ", JumpPage, 2)
Text( 1, " �������� ���� ", JumpPage, 3)
Text( 1, " ���� ���� ", JumpPage, 4)
Text( 1, " ��������� ����� ", JumpPage, 5)
Text( 1, " ������ ����� ", JumpPage, 6)
Text( 1, " �������� ����� ", JumpPage, 7)

Talk( 2," ������ ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 8)
Text( 2, " 3 ������� ", JumpPage, 9)
Text( 2, " 4 ������� ", JumpPage, 10)
Text( 2, " 5 ������� ", JumpPage, 11)

Talk( 3," ������ ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 12)
Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)

Talk( 4," ������ ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 16)
Text( 4, " 3 ������� ", JumpPage, 17)
Text( 4, " 4 ������� ", JumpPage, 18)
Text( 4, " 5 ������� ", JumpPage, 19)

Talk( 5," ������ ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 20)
Text( 5, " 3 ������� ", JumpPage, 21)
Text( 5, " 4 ������� ", JumpPage, 22)
Text( 5, " 5 ������� ", JumpPage, 23)

Talk( 6," ������ ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 24)
Text( 6, " 3 ������� ", JumpPage, 25)
Text( 6, " 4 ������� ", JumpPage, 26)
Text( 6, " 5 ������� ", JumpPage, 27)

Talk( 7," ������ ������ ������� ��������� " )
Text( 7, " 2 ������� ", JumpPage, 28)
Text( 7, " 3 ������� ", JumpPage, 29)
Text( 7, " 4 ������� ", JumpPage, 30)
Text( 7, " 5 ������� ", JumpPage, 31)


Talk(8," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(8,'������',FastCombiner,884,2)

Talk(9," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(9,'������',FastCombiner,884,3)

Talk(10," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(10,'������',FastCombiner,884,4)

Talk(11," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(11,'������',FastCombiner,884,5)

Talk(12," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(12,'������',FastCombiner,887,2)

Talk(13," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(13,'������',FastCombiner,887,3)

Talk(14," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(14,'������',FastCombiner,887,4)

Talk(15," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(15,'������',FastCombiner,887,5)

Talk(16," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(16,'������',FastCombiner,5772,2)

Talk(17," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(17,'������',FastCombiner,5772,3)

Talk(18," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(18,'������',FastCombiner,5772,4)

Talk(19," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(19,'������',FastCombiner,5772,5)

Talk(20," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(20,'������',FastCombiner,5773,2)

Talk(21," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(21,'������',FastCombiner,5773,3)

Talk(22," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(22,'������',FastCombiner,5773,4)

Talk(23," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(23,'������',FastCombiner,5773,5)

Talk(24," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(24,'������',FastCombiner,5774,2)

Talk(25," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(25,'������',FastCombiner,5774,3)

Talk(26," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(26,'������',FastCombiner,5774,4)

Talk(27," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(27,'������',FastCombiner,5774,5)

Talk(28," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(28,'������',FastCombiner,5775,2)

Talk(29," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(29,'������',FastCombiner,5775,3)

Talk(30," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(30,'������',FastCombiner,5775,4)

Talk(31, "��� ����� ����� 16 ��������� � 5�� ������! " )
Text(31,'������',FastCombiner,5775,5)
end

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[����]				--
--							--
--		88307,352019				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk54 ()
	
	
	Talk( 1,  "�������� ���: ������! � ���� �������!��������� ������������ ������,�� ������� �������� ������� �� ������ ��� " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "��������� ��� ", OpenItemTiChun )
	Text( 1,  "������� ������ ��� 200-500 ", JumpPage, 2)
	Text( 1,  "����������� ������ ��� 500-800 ", JumpPage, 11)
	Text( 1,  "����� ����� ��� ", JumpPage, 8)
	Text( 1,  "�������� ��� ������� ", JumpPage, 17)
	
	Talk( 2," �������� ������ ����� " )
	Text( 2, " ����� ���� ", JumpPage, 3)
	Text( 2, " ����� �������� ", JumpPage, 4)
	Text( 2, " ����� �������� ", JumpPage, 5)
	Text( 2, " ����� ������������ ", JumpPage, 6)
	Text( 2, " ����� ���� ", JumpPage, 7)
	
	Talk( 8," ���������� ������ ����� ������ 30 ����� ���,� ����������� �� 500! " )
	Text( 8, " ���������� ������ ", JumpPage, 9)
	Text( 8, " ����������� ������ ", JumpPage, 10)
	
	Talk( 11," �������� ������ ����� " )
	Text( 11, " ����� ���� ", JumpPage, 12)
	Text( 11, " ����� �������� ", JumpPage, 13)
	Text( 11, " ����� �������� ", JumpPage, 14)
	Text( 11, " ����� ������������ ", JumpPage, 15)
	Text( 11, " ����� ���� ", JumpPage, 16)
	
	Talk( 17," ��� ������� ������ ��� ������ ���� ��������� 500 �������.��� ��� ������ ������� - 1000 �������.��� ��� ������� - 2000 �������! " )
	
	Talk( 3," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )

	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7431,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(3,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(3,"10 ������� ", JumpPage, 18)
	
	Talk(4," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7430,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(4,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(4,"10 ������� ", JumpPage, 19)
	
	Talk(5," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7433,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(5,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(5,"10 ������� ", JumpPage, 20)
	
	Talk(6," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7419,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(6,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(6,"10 ������� ", JumpPage, 21)
	
	Talk(7," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7434,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(7,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(7,"10 ������� ", JumpPage, 22)
	
	Talk(9," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2588,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,30,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(9,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(9,"10 ���� ", JumpPage, 28)
	
	Talk(10," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2589,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2589,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,500,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(10,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(12," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7506,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(12,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(12,"10 ������� ", JumpPage, 23)
	
	Talk(13," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7505,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(13,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(13,"10 ������� ", JumpPage, 24)
	
	Talk(14," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7507,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(14,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(14,"10 ������� ", JumpPage, 25)
	
	Talk(15," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7504,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(15,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(15,"10 ������� ", JumpPage, 26)
	
	Talk(16," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7508,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(16,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(16,"10 ������� ", JumpPage, 27)
	
	Talk(29," ������������ ���������� �����,���� ������������ ���� " )
	
	Talk(18," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7431,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(18,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7430,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(19,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7433,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(20,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7419,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(21,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7434,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(22,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7506,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(23,"����� ",MultiTrigger,GetMultiTrigger(),1)

	Talk(24," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7505,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(24,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7507,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(25,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(26," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7504,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(26,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(27," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7508,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(27,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2588,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,300,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(28,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
    Weapon(	0681	)
	Weapon(	2312	)
	Weapon(	0247	)
	Weapon(	0244	)
	Weapon(	0250	)
	Weapon(	0253	)
	Weapon(	0260	)
    Weapon(	0609	)
	Defence(	0222	)
	Defence(	0223	)
	Defence(	0224	)
	Defence(	0225	)
	Defence(	0226	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Other(  3300    )
	Other(  3462    )
	
	AddNpcMission ( 991 )
	AddNpcMission ( 906 )
	AddNpcMission ( 2041 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�ӻ����ˡ���ī]			--
--							--
--		84040,358567				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk55 ()
	
	
	Talk( 1,  "����: ������ � ���� ����� ��������� ����������. ���� �� ��������� �������� � ������ �����. " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "���������� ���������� ", OpenUnite)

	InitTrade()
	Weapon(	3206	)
	Weapon(	3208	)
	Weapon(	3205	)
	Weapon(	3242	)
	Weapon(	3210	)
	Weapon(	3207	)
	Weapon(	3211	)
	Weapon(	3215	)
	Weapon(	3212	)
	Weapon(	3209	)
	Weapon(	3220	)
	Weapon(	3222	)
	Weapon(	3219	)
	Weapon(	3218	)
	Weapon(	3216	)
	Weapon(	3223	)
    Weapon(	3217	)
	Weapon(	3224	) 
	Weapon(	3187	)
	Weapon(	3188	)
	Weapon(	3190	)
	Weapon(	3197	)
	Weapon(	3239	)
	Weapon(	3241	)
	Weapon(	3193	)
	Weapon(	3192	)
	Weapon(	3202	)
	Weapon(	3203	)
	Weapon(	3204	)
	Weapon(	3198	)
	Weapon(	3229	)
	Weapon(	3228	)
	Weapon(	3235	)
	Weapon(	3237	)
	Weapon(	3233	)
	Weapon(	3231	)
	Weapon(	3232	)
	Weapon(	3234	)
	Weapon(	3230	)
	Weapon(	3236	)
	Weapon(	3227	)
	Defence(	3160	)
	Defence(	3164	)
	Defence(	3238	)
	Defence(	3170	)
	Defence(	3176	)
	Defence(	3297	)
	Defence(	3174	)
	Defence(	3298	)
	Defence(	3293	)
	Defence(	3177	)
	Defence(	3163	)
	Defence(	3161	)
	Defence(	3179	)
	Defence(	3180	)
	Defence(	3165	)
	Defence(	3167	)
	Defence(	3168	)
	Defence(	3166	)	
	Defence(	3173	)
	Defence(	3162	)	
    Defence(	3172	)		
	Other(  3296    )
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
    Other(  2440     )
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ӻ����ˡ���ī

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�õ��ϰ塤����]			--
--							--
--		81035,349813				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk56 ()
	
	
	Talk( 1,  "�����: ������! �� ��� ������������? � ���� ���������� �������� ������� ��� �����! " )
	Text( 1,  "������� ������ ", JumpPage, 2)


--------------------�����������֭
	InitTrigger()
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasItem, 3121, 4 )
	TriggerCondition( 1, HasMoney, 50 )
	TriggerAction( 1, TakeMoney, 50 )
	TriggerAction( 1, TakeItem, 3121, 4 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 3127, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�����: ��� ������ � ���� ���� ������ �����������. � ��� ��������� ������� ����� ������! " )
	Text( 2,  "������� ��� �������� ������� ",MultiTrigger, GetMultiTrigger(), 1)

----------------�����ۺϹ�֭
	InitTrigger()
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasItem, 3122, 1 )
	TriggerCondition( 1, HasItem, 3123, 1 )
	TriggerCondition( 1, HasItem, 3124, 1 )
	TriggerCondition( 1, HasItem, 3125, 1 )
	TriggerCondition( 1, HasMoney, 50 )
	TriggerAction( 1, TakeMoney, 50 )
	TriggerAction( 1, TakeItem, 3122, 1 )
	TriggerAction( 1, TakeItem, 3123, 1 )
	TriggerAction( 1, TakeItem, 3124, 1 )
	TriggerAction( 1, TakeItem, 3125, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 3128, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "������� ��������� �������� ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "�����: ������� ��� �� �������� �����! ��������� ����������������! " )
	Talk( 4,  "�����: ��������, �� ��� ������������� 1 ���� �������� ������� ���������� 4 �������� ������, 1 �������� ������ � 50 ������. " )
	Talk( 5,  "�����: ��������, �� ��� ������������ 1 ���������� �������� ���������� 1 ��� ����������� ������, 1 ��� �� ������� �������, 1 ������� ���, 1 ��� �� ������ �������, 1 �������� ������ � 50 ������. " )
	AddNpcMission	(1138)
	AddNpcMission	(1161)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�õ��ϰ塤����

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[��ʿС�㡤����]			--
--							--
--		87954,356282				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk57 ()
	
	Talk( 1,  "�� ��� ����: ������! ������� ����������! " )
	Text( 1,  "���� ", BuyPage )
   
	Weapon(	3096    )
	Weapon(	3097	)
	Weapon(	3094    )
	Weapon(	3095	)
	Weapon(	5694	)
	Weapon(	5695	)
	Weapon(	0849	)
    Defence(	3088	)
	Defence(	3089	)
	Defence(	3090	)
	Defence(	3091	)
	Defence(	3092	)
	Defence(	3093	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	)
	Defence(	3112	)
	Defence(	3113	)
	Other(	3098	)
	Other(	3099	)
	Other(	7837	)
	Other(	7838	)
	Other(	3143	)
	--Other(	3105	)
	--Other(	3107	)
	Other(	3047	)
	Other(	2440	)
	Other(	3301	)
	Other(	3463	)
	Other(	4603	)
	Other(	2816	)
	
end

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��ʿС�㡤����

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�������¿�]			--
--							--
--		80262,364842				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk58 ()
	
	
	Talk( 1,  "�����: ������, � ����� �������-���������. � ��������� ������ � �� 7-�� ����� � ������ ����� ������������� ������� ������. ������ � ���� ��� �����������? � �� ����� �����! ���� " )
	AddNpcMission	(1125)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�������¿�

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[����ָ������˿��]			--
--							--
--		87614,357250				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����ָ������˿��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�������´���Ա����΢����У]		--
--							--
--		86507,364804				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk61 ()
	
	
	Talk( 1,  "������� ���: ������! � ������ �������-������ � ���� ������! " )
	AddNpcMission	(1126)
	AddNpcMission	(98)
	AddNpcMission	(99)
	AddNpcMission	(150)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�������´���Ա����΢����У

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[ɳᰳ��̻�᳤��������]		--
--							--
--		87362,354566				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk62 ()
	
	
	Talk( 1,  "�����: � ����� �������� �������� ����. ����� ���� � ������ ��� ����� �� ����� ������ ���� � ������ �� ����� �������. ���� ����� ������� ����� ���������� ���������. " )
	Text( 1,  "�� �������� ",CloseTalk )
	AddNpcMission	(1144)

	-----��������
	AddNpcMission ( 6115 )
	AddNpcMission ( 6116 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ɳᰳ��̻�᳤��������

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[·�ˡ�ɺ����]		--
--							--
--		84634,349945				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk63 ()
	
	
	Talk( 1,  "����: ������ ������� ������ ��������. � �������� ���� ������ ����� ���� �� ���� ��������. " )

--	AddNpcMission ( 6028 )
--	AddNpcMission ( 6029 )
--	AddNpcMission ( 6054 )
--	AddNpcMission ( 6055 )

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ�ɺ����

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[С������]			--
--							--
--		89875,368331				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk64 ()
	
	
	Talk( 1,  "����: ������! � ������ � ���� ��������� ������! ����� " )

	AddNpcMission ( 233 )
	---------------����
	AddNpcMission	(5565)
	AddNpcMission	(5566)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<С������

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�᳤������˾���]		--
--							--
--		87171,354774				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk65 ()
	
	
	Talk( 1,  "������: �� ������ �������, �� ������� �� ���������. " )
--	AddNpcMission ( 905 )
	----------------�����
	AddNpcMission ( 5604 )
	AddNpcMission ( 5605 )
	AddNpcMission ( 5606 )
	AddNpcMission ( 5607 )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�᳤������˾���

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[·�ˡ���]				--
--							--
--		79792,355469				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk66 ()
	
	
	Talk( 1,  "��: ������ ����� � ����� ������ �������. ��� ������������� ����� ������������. " )
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ���

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[ɳ�ˡ�����������]			--
--							--
--		108242,310135				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk67 ()
	
	
	Talk( 1,  "��������: � ������� ������� ���������! � ���� ������� ���� �������� � ������� ����� ����� ����! (� ����, �� ����� ������ �����) " )
	
	AddNpcMission ( 237 )
	AddNpcMission ( 238 )
	AddNpcMission ( 239 )
	AddNpcMission ( 240 )
	AddNpcMission ( 248 )
	AddNpcMission ( 557 )
--------eleven
	AddNpcMission (5011 )
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ɳ�ˡ�����������


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[�������ӡ���ɳ��]			--
--							--
--		125471,349171				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk68 ()
	
	
	Talk( 1,  "������: ���.. �� ���� � ����� ����������� ����� ����� �� ������ �����. ��� ������� ������ ��� �� ��� �����... " )
	Text( 1,  "������������� ", JumpPage, 2)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1785, 10 )
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, TakeItem, 1785, 10 )
	TriggerAction( 1, GiveItem, 1786, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "������: ����� ��������� ��������� ����� ��������� ��������. ������ �� �� ���������� ��� � �������� ��������? " )
	Text( 2,  "���������� �������� �������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "������: ��� �������� �������� �����. ��������� ���! " )
	Talk( 4,  "������: ��� �������� ��������� ��������� ���������� 10 ������ ��������� ��������� � 2000 ������. " )
	-------------eleven
	AddNpcMission ( 5010)
	AddNpcMission ( 5014)
	AddNpcMission ( 5033)
	AddNpcMission ( 5034)
	---------------����
	AddNpcMission	(5553)
	AddNpcMission	(5554)
	--��������� �����
	AddNpcMission	(6258)
	AddNpcMission	(6259)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�������ӡ���ɳ��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[����ר�ҡ�ɳ÷��]			--
--							--
--		66465,609367				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk69 ()
	
	
	Talk( 1,  "������: ������! � ������� ��������. " )
---------------����
	AddNpcMission	(5559)
	AddNpcMission	(5560)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����ר�ҡ�ɳ÷��


----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[ʥŮ������]			--
--							--
--		86248,330381				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk70 ()
	
	
	Talk( 1,  "���: ���������� ��� ����. ����� ���� ������������� ���� ����. � ��������� ����� ���. " )

	AddNpcMission ( 756 )
	AddNpcMission ( 341 )
	AddNpcMission ( 356 )
	AddNpcMission ( 357 )
	AddNpcMission ( 521 )
	AddNpcMission ( 539 )
	AddNpcMission ( 540 )
	AddNpcMission ( 541 )
	AddNpcMission ( 552 )
	AddNpcMission ( 553 )
	AddNpcMission ( 556 )

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ʥŮ������

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[·�ˡ�������]			--
--							--
--		93176,352977				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk71 ()
	
	
	Talk( 1,  "�����: ������ �� �� ��� � ������� ���� ������ �����? � ��� ����� �������� �����! " )
	
	AddNpcMission ( 210 )
	AddNpcMission ( 211 )
end
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ�������

----------------------------------------------------------
--							--
--							--
--		ɳᰳ�[����᳤������]			--
--							--
--		83171,354853				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk72 ()
	
	Talk( 1,  "������: ���� � ��������! ������ ������� ����� ����� �� 3 ����� ������� �������? ������ ������� ���� �����? " )
	Text( 1,  "��� 3 ������� ", ListChallenge)
	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����᳤������

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[����������]			--
--							--
--		134423,52988				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk73 ()
	
	
	Talk( 1,  "���: ����� ����������! � ������ ��� ���� ������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������ ", OpenRepair)
	Text( 1,  "�������� �������� ", OpenForge)
	Text( 1,  "������� ���� ", OpenMilling)
	Text( 1,  "�������� � �������� ", OpenFusion)
	Text( 1,  "��������� �������� ", OpenUpgrade)
	Text( 1,  "������ ",CloseTalk )

	Talk( 2,  "���: �������� ��������? ������ ������ ������� ����� ��� ��� ������. " )

	Talk( 3, "���: ������ ��������� ���-������? ��������� � �������, ���� ����������� ������ ����� �� ������� ����������� ���������. ������ ���, ��� �����������, � �������� � ������������ - ������ �� �������. ������ �� ������� ���������� ����������." )


	InitTrade()
	Weapon(	0008	)
	Weapon(	0196	)
	Weapon(	0197	)
	Weapon(	0198	)
	Weapon(	0025	)
	Weapon(	0032	)
	Weapon(	0026	)
	Weapon(	0033	)
	Weapon(	0027	)
	Weapon(	0034	)
	Weapon(	1400	)
	Weapon(	1401	)
	Weapon(	1402	)
	Weapon(	1403	)
	Weapon(	1404	)
	Weapon(	1405	)
	Weapon(	0037	)
	Weapon(	0038	)
	Weapon(	0039	)
	Weapon(	0044	)
	Weapon(	0040	)
	Weapon(	0045	)
	Weapon(	1406	)
	Weapon(	1407	)
	Weapon(	1408	)
	Weapon(	1409	)
	Weapon(	1413	)
	Weapon(	1414	)
	Weapon(	1410	)




	AddNpcMission ( 723 )
	AddNpcMission	(1041)
	AddNpcMission	(1093)
	AddNpcMission	(1152)
	AddNpcMission	(1204)
	AddNpcMission(	1233	)
	--��������� �����
	AddNpcMission	(6251)
	AddNpcMission	(6252)
	AddNpcMission	(6253)
	


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����������

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[�ӻ����ˡ���³]			--
--							--
--		135671,48320				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk74 ()
	Talk( 1,  "������: ������! � ���������� ������. ��� ���� ����� ���������� 10 ������, � ��� ���� ������� ��� ��� �����. �� ��� � ������ �������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )
	Text( 1,  "���������� ����� ���������� ",JumpPage, 2 )

	InitTrade()
	Other(	3187	)
	Other(	3188	)
	Other(	3190	)
	Other(	3239	)
	Other(	3197	)
	Other(	3193	)
	Other(	3241	)
	Other(	3192	)
	Other(	3198	)
	Other(	3202	)
	Other(	3203	)
	Other(	3204	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other(	3141	)
	Other(	4602	)
	Other(	4603	)
	Other(	4604	)
	Other( 3296 )
	--baby--�������Lv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
	Other(	1611	)
	Other(	1682	)
	Other(	1842	)
	Other(	1612	)
	Other(	1710	)
	Other(	1693	)
	Other(	4716	)
	Other(	1716	)
	Other(	1711	)
	Other(	3384	)
	Other(	3932	)
	Other(	1619	)
	Other(	2396	)
	Other(	1729	)
	Other(	4459	)
	Other(	1697	)
	Other(	1730	)
	Other(	1712	)
	Other(	1734	)
	Other(	1621	)
	Other(	1703	)
	Other(  2440    )


	AddNpcMission	(1052)
	AddNpcMission	(1106)
	AddNpcMission	(1162)
	AddNpcMission	(1214)
	AddNpcMission	(181)
	AddNpcMission	(182)
	AddNpcMission	(183)
	AddNpcMission	(1234)
	--AddNpcMission	(5502)

	---bragi
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1624, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1624, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "������: ��� ������������ ����� ���������� ���������� 1 ���������� ������, 10000 ������ � 10 ����� �������� 3 ������. " )
	Text( 2,  "�������� ������� ����� �� ����� ���������� ", MultiTrigger, GetMultiTrigger(), 1)

	---InitTrigger()
	---TriggerCondition( 1, HasLeaveBagGrid, 1 )
	---TriggerCondition( 1, KitbagLock, 0 )
	---TriggerCondition( 1, HasItem, 2588, 1 )
	---TriggerCondition( 1, HasItem, 1842, 10 )
	---TriggerCondition( 1, HasMoney, 10000 )
	---TriggerAction( 1, TakeItem, 2588, 1 )
	---TriggerAction( 1, TakeItem, 1842, 10 )
	---TriggerAction( 1, TakeMoney, 10000 )
	---TriggerAction( 1, GiveItem, 2326, 1 , 4)
	---TriggerAction( 1, JumpPage, 3 )
	---TriggerFailure( 1, JumpPage, 4 )
	---Text( 2,  "Exchange Razor Tooth for Reality Mask ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4545, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4545, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ���� �� ����� ���������� ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 4543, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 4543, 10 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ �� ����� ����������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2588, 1 )
	TriggerCondition( 1, HasItem, 1478, 10 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerAction( 1, TakeItem, 2588, 1 )
	TriggerAction( 1, TakeItem, 1478, 10 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 2326, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ �� ����� ���������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "������: ���, ������� ��� ��������. " )
	Talk( 4,  "Palpin: �� �� ������ ���� ����������� ������������  ��� � ��� ������������ ���������� ����� � ���������. ����� �������� ��� ��� ��������� ������������. " )
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ӻ����ˡ���³

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[ҩ���ϰ塤���]			--
--							--
--		135298,49926				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk75 ()
	
	
	Talk( 1,  "�����: ������! � ���� ������ ����� �� ���� ������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )
	
	Talk( 2,  "Daisha: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Argent or Shaitan by using the teleporter. " )
	Text( 2,  "���� ", BuyPage )
	Text( 2,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)
	--Leo
	Other(	1576	)
	Other(	4049	)
	Other(	4050	)
	Other(	1578	)
	Other(	4060	)
	Other(	4055	)
	Other(	4061	)
	Other(	2225	)
	Other(	4057	)
	Other(	1768	)

	---------------------��ҳ���9��
	--InitTrigger()
	--TriggerCondition( 1, LvCheck,  "> ", 8 )
	--TriggerCondition( 1, LvCheck,  "< ", 10 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerFailure( 1, JumpPage, 1 )
	--Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 727 )
	--AddNpcMission ( 735 )
	--AddNpcMission ( 746 )
	--AddNpcMission ( 747 )
	AddNpcMission	(1047)
	AddNpcMission	(1101)
	AddNpcMission	(1158)
	AddNpcMission	(1209)
	AddNpcMission(	1235	)
---------eleven	
	AddNpcMission(	5067)
	AddNpcMission(	593)
	AddNpcMission(	594	)
	AddNpcMission(	596	)	

	MisListPage(2)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ҩ���ϰ塤���


----------------------------------------------------------
--							--
--							--
--		���Ǳ�[��ʿС�㡤����]			--
--							--
--		131725,50169				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk76 ()
	
	
	Talk( 1,  "����: ������! � ���������� ����! ��������� � ���� �������� �� �������� � �� ���� ��� ����� ������. " )
	AddNpcMission	(1018)
	AddNpcMission	(1073)
	AddNpcMission	(1128)
	AddNpcMission	(1181)
	AddNpcMission(	1236	)
	



	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��ʿС�㡤����

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[����ָ��������¶��]		--
--							--
--		131577,50700				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk77 ()
	
	Talk( 1,  "������: ������! � ���������� ������. � ���� ����� ��� ��������� �������� �������. ������������� ������ �����! " )
	Text( 1,  "������ �������� ", JumpPage, 31 )
	Text( 1,  "� �� ����� ��� � ��� �������� ", JumpPage, 4 )
	Text( 1,  "������ � ������� � ��������� ", JumpPage, 11 )
	Text( 1,  "������ ���������� �������� ", JumpPage, 30 )
	Text( 1,  "�������, � ��� ����� ", CloseTalk )
--	Text( 1,  "�������, � ��� ����� ", CloseTalk )


	Talk( 4,  "������: ������ ��� �����, ��� ������ ����. ����� ��� ������ ���� ����� ��� ����� ������ ����. " )
	Text( 4,  "������ �� ��������� �������� ", JumpPage, 5 )
	Text( 4,  "������ � �������� �������� ", JumpPage, 7 )
	Text( 4,  "������ � �������� ��������� ", JumpPage, 8 )
	Text( 4,  "������ � �������� ������������ ", JumpPage, 9 )
	Text( 4,  "������ � �������� ������� ", JumpPage, 10 )

	Talk( 5,  "������: ������ ���������� �� ��, � ����� ��������� ������� �� �����������. ��� �� ������� ������ �������. " )
	Text( 5,  "����� � ������ ��������� ", JumpPage, 4 )
	Text( 5,  "�������, � ��� ����� ", CloseTalk )

--	Talk( 6,  "Look for me again if there is anything you don't understand ", CloseTalk )

	Talk( 7,  "������: ����� ������ ������� ����� ������ ��������. �� ����� ������ �������. ��������� � ������ ����� ������. " )
	Text( 7,  "����� � ������ ��������� ", JumpPage, 4 )
	Text( 7,  "�������, � ��� ����� ", CloseTalk )

	Talk( 8,  "������: ������ �������� �� ������ � ����������� ������ ������. � ���� ���� ��� ��� ������������. �� ��������� � �������� ���� ����� ������. " )
	Text( 8,  "����� � ������ ��������� ", JumpPage, 4 )
	Text( 8,  "�������, � ��� ����� ", CloseTalk )

	Talk( 9,  "������: ����� �� ������ �� �� � �� ������� �������� ���� ������� ���. ��� ���� �����������. � ������� ��� �� ������ ������������� � ����� ������� ����� ����� ����. ����� �� ������ �������� � ��� ����� �����������. " )
	Text( 9,  "����� � ������ ��������� ", JumpPage, 4 )
	Text( 9,  "�������, � ��� ����� ", CloseTalk )

	Talk( 10,  "������: ��������� - ������� ������� � ������ ������� �������. �� �������� ����� �� ���� �� ������. " )
	Text( 10,  "����� � ������ ��������� ", JumpPage, 4 )
	Text( 10,  "�������, � ��� ����� ", CloseTalk )

	InitTrigger()
	TriggerCondition( 1, NoRecord, 700 )
	TriggerCondition( 1, HasMission, 700 )
	TriggerCondition( 1, NoFlag, 700, 10 )
	TriggerAction( 1, SetFlag, 700, 10)
	TriggerAction( 1, JumpPage, 12 )
	TriggerFailure( 1, JumpPage, 12 )
	Talk( 11,  "������: ��� ��� ������ ������ ���������� ����� ����� ������. � ������� ��� � ���� ������. " )
	Text( 11,  "������ � ������� ", JumpPage, 12)
	Text( 11,  "������ � ������ ��������� ", JumpPage, 13)

	--Text( 11,  "������ � ������� ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, NoRecord, 700 )
	TriggerCondition( 1, HasMission, 700 )
	TriggerCondition( 1, NoFlag, 700, 20 )
	TriggerAction( 1, SetFlag, 700, 20)
	TriggerAction( 1, JumpPage, 13 )
	TriggerFailure( 1, JumpPage, 13 )
	--Text( 11,  "������ � ������ ��������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 12,  "������: ����� ���������� 4 ������� ������. ������ ����� ���� �����������. " )
	Text( 12,  "������ � �������� ", JumpPage, 14 )
	Text( 12,  "������ �� ��������� ", JumpPage, 15 )
--	Text( 12,  "Regarding Sailor ", JumpPage, 16 )
	Text( 12,  "������ �� �������������� ", JumpPage, 17 )
	Text( 12,  "������ �� ��������� ", JumpPage, 18 )
--	Text( 12,  "Regarding Artisan ", JumpPage, 19 )
--	Text( 12,  "Regarding Merchant ", JumpPage, 20 )
	Text( 12,  "� ��� �����. ���� ������ ��� ��� ������. ", JumpPage, 11 )

	Talk( 13,  "������: ����� ���������� 5 ������� ��������. ������ ������� ����� ����� ������������ �������� � 100. � ������� ��� �������� ����� 5. ������ ������� ��� ����� ���������� ��� 1 ����� �������� � ������. � ������ ���� � ��� ���� 5 ��������� ������, ������� �� ������ ��� " )
	Text( 13,  "������ � ���� ", JumpPage, 21 )
	Text( 13,  "������ � �������� ", JumpPage, 22 )
	Text( 13,  "������ � ������������ ", JumpPage, 23 )
	Text( 13,  "������ � ���� ", JumpPage, 24 )
	--Text( 13,  "Regarding Luck ", JumpPage, 25 )
	Text( 13,  "������ � �������� ", JumpPage, 26 )
	Text( 13,  "� ��� �����. ���� ������ ��� ��� ������. ", JumpPage, 11 )

	Talk( 14,  "������� ����� ����� ������� ���������� ������������� � ���� ����. �������� ����� ����� ������ ����, ������ ��� ������. ���� ������ ����� ��������, �� ���������� � ��������� ������ � �������. " )
	Text( 14,  "������ � ������ ������� ", JumpPage, 12)
	Text( 14,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 14,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 15,  "������: �������� ��� ������������ ����� ������������ ������ � ������������� ������. ��������� ����� ����� ������ ������ ��� ����. ����� ����� ��������� ���������� ��������� � ������� ��� � ������. " )
	Text( 15,  "������ � ������ ������� ", JumpPage, 12)
	Text( 15,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 15,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 16,  "������: Sailor is the strongest class in the sea. It is still unreleased in current version. " )
	Text( 16,  "������ � ������ ������� ", JumpPage, 12)
	Text( 16,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 16,  "�������, � ��� ����� ", JumpPage, 27)
	
	Talk( 17,  "������: ������������� ��� ������ ����� ��� ������� ������������. �������������� ����� ����� ������ ������, ���� ��� ���. ����� ����� �������������� �������� � ������ ������� � �������. " )
	Text( 17,  "������ � ������ ������� ", JumpPage, 12)
	Text( 17,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 17,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 18,  "������: ���������� ��� ����������� ������ ������ ����, �� ��� �� �������� ���������� ����. ����������� ����� ����� ������ ������ ��� ���. ����� ����� ����������� ��� ���������� ����� ������� � �������. " )
	Text( 18,  "������ � ������ ������� ", JumpPage, 12)
	Text( 18,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 18,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 19,  "������: ������: Artisan is the only class that can make item. They will be in-charge of building structures for the guild. It is still unreleased in current version. " )
	Text( 19,  "������ � ������ ������� ", JumpPage, 12)
	Text( 19,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 19,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 20,  "������: Merchant is the richest of all classes as they specialise in commerce. It is still unreleased in current version. " )
	Text( 20,  "������ � ������ ������� ", JumpPage, 12)
	Text( 20,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 20,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 21,  "������: ���� ������ �� ���������� ����. " )
	Text( 21,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 21,  "������ � ������ ������� ", JumpPage, 12)
	Text( 21,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 22,  "������: �������� ������ �� ��������� � �������� �����. " )
	Text( 22,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 22,  "������ � ������ ������� ", JumpPage, 12)
	Text( 22,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 23,  "������: ������������ ������ �� ���������� ����� � �� ������. " )
	Text( 23,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 23,  "������ � ������ ������� ", JumpPage, 12)
	Text( 23,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 24,  "������: ��� ������ �� ���������� ����, ���������� ������ � ���� �� ��������� �������. " )
	Text( 24,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 24,  "������ � ������ ������� ", JumpPage, 12)
	Text( 24,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 25,  "������: Luck increases Critical strike and Combine success rate " )
	Text( 25,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 25,  "������ � ������ ������� ", JumpPage, 12)
	Text( 25,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 26,  "������: �������� ������ �� ���� ����� � ���� ������������� �����. " )
	Text( 26,  "������ � ������ ��������� ", JumpPage, 13)
	Text( 26,  "������ � ������ ������� ", JumpPage, 12)
	Text( 26,  "�������, � ��� ����� ", JumpPage, 27)

	Talk( 27,  "������: �������! ��� ���� ���� ��� �� �����������. ")

	Talk( 28,  "������: ����� ������! �� ����� ������ ������ ������. ���������� ������ ���������� � ������� �������� � ����������� ����� ������. " )
	Text( 28,  "� �� ����� ��� � ��� �������� ", JumpPage, 4 )
	Text( 28,  "������ � ������� � ��������� ", JumpPage, 11 )
	Text( 28,  "�������, � ��� ����� ",  CloseTalk )

	Talk( 29,  "������: ������! ������ �� ������ ����������� � �������� ���������� � ��������� � ������� ������ ������. " )
	Text( 29,  "� �� ����� ��� � ��� �������� ", JumpPage, 4 )
	Text( 29,  "������ � ������� � ��������� ", JumpPage, 11 )
	Text( 29,  "�������, � ��� ����� ",  CloseTalk)

	Talk( 30,  "������: ����� ������ ���������� �������� �������� � ������� ������ � ���� �������. " )

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

	Talk( 31,  "������: ������ �������� - ������������ ������� �� ������� ����. ��� ������� �������� ����������� ���� �������, � ����� ��� ��������� �������� �������� ����������� ���������� ����� �����. ����� ���� �� ������ �������� ������ �������� �� ���������� ������ ������ �� 50 ������� ����� ���������� 41 ������. " )
	Text( 31,  "�������� ������ �������� ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 31,  "����� ������ �������� ",JumpPage, 32 )

	Talk( 32,  "������: ������� �� ������������� ����� ���������. �� ������ �������� ������ �������� �� ���������� ������ ������ �� 50 �������. ��� ��� ����������? ")
	Text( 32,  "�������� ������ ������ ", Transfer_TeamStar, 1)

	Talk( 6,  "������: ����� ��������, �� �� �� ��������� �� �����������. " )

	--InitTrigger()
	---------------------��ҳ���6����ɹ�ɪ����ս��ѵ������
	--TriggerCondition( 1, LvCheck,  "> ", 4 )
	--TriggerCondition( 1, LvCheck,  "< ", 9 )
	--TriggerCondition( 1, HasRecord, 716 )
	--TriggerAction( 1, JumpPage, 28 )
	--TriggerCondition( 2, LvCheck,  "> ", 8 )
	--TriggerCondition( 2, PfEqual, 0 )
	--TriggerAction( 2, JumpPage, 29 )
	--TriggerFailure( 2, JumpPage, 1 )

	--Start( GetMultiTrigger(), 2 )

	
	AddNpcMission ( 721 )
	AddNpcMission ( 722 )
	AddNpcMission ( 724 )
	AddNpcMission ( 726 )
	AddNpcMission ( 728 )
	AddNpcMission ( 201 )
	AddNpcMission 	(406)
	AddNpcMission 	(62)
	AddNpcMission 	(63)
	AddNpcMission 	(64)
	AddNpcMission 	(65)
	AddNpcMission 	(162)
	AddNpcMission 	(163)
	AddNpcMission 	(173)
	AddNpcMission 	(190)


	MisListPage(28)
	MisListPage(29)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����ָ��������¶��


----------------------------------------------------------
--							--
--							--
--		���Ǳ�[���Ǳ���ʿ����ŷ]		--
--							--
--		136573,57078				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk78 ()
	
	-------------------תְ˫��
	Talk( 1,  "���: ������! � ������� �������, ����� �������� �� �������. ���� ��� ��� ����������, �� ���� �������� ��������� ������� ����. " )

		----------------תְ��Ϊ����
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 9 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 0 )
	TriggerCondition( 1, HasMoney, 1000 )
	TriggerCondition( 1, HasItem, 3955, 1 )
	TriggerAction( 1, TakeItem, 3955, 1 )
	TriggerAction( 1, TakeMoney, 1000 )
	TriggerAction( 1, GiveItem, 3187, 1 , 4)
	TriggerAction( 1, GiveItem, 25, 1 , 4)
	TriggerAction( 1, SetProfession, 2 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerCondition( 2, LvCheck,  "> ", 7 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 0 )
	TriggerCondition( 2, HasMoney, 1000 )
	TriggerCondition( 2, HasItem, 3955, 1 )
	TriggerAction( 2, TakeItem, 3955, 1 )
	TriggerAction( 2, TakeMoney, 1000 )
	TriggerAction( 2, GiveItem, 3187, 1 , 4)
	TriggerAction( 2, GiveItem, 25, 1, 4)
	TriggerAction( 2, SetProfession, 2  )
	TriggerAction( 2, JumpPage, 3 )
	TriggerFailure( 2, JumpPage, 4 )

	Talk(2,  "Hi my friend. You have great reflexes, suitable to become a hunter. Why don't you become a hunter now? I believe that you will not be disappointed. ")
	Text(2,  "Ok, class change to be Hunter ", MultiTrigger, GetMultiTrigger(), 2)
	Text(2,  "No, it is good enough for now. ", CloseTalk)

	Talk(3,  "I have told you all I can about being a Hunter. Now its up to you to become the best Hunter. ")

	Talk(4,  "Want to be a Hunter? Only players Lv 8 and above who possess a Hunter Manual can register with me for 1000G. Muscular guy or little girl are not suitable. ")

	----------------תְ��Ϊ�ѻ���
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 39 )
	TriggerCondition( 1, IsCategory, 1 )
	TriggerCondition( 1, PfEqual, 2 )
	TriggerCondition( 1, HasMoney, 15000 )
	TriggerCondition( 1, HasItem, 3364, 1 )
	TriggerAction( 1, TakeItem, 3364, 1 )
	TriggerAction( 1, TakeMoney, 15000 )
	TriggerAction( 1, SetProfession, 12 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerCondition( 2, LvCheck,  "> ", 39 )
	TriggerCondition( 2, IsCategory, 3 )
	TriggerCondition( 2, PfEqual, 2 )
	TriggerCondition( 2, HasMoney, 15000 )
	TriggerCondition( 2, HasItem, 3364, 1 )
	TriggerAction( 2, TakeItem, 3364, 1 )
	TriggerAction( 2, TakeMoney, 15000 )
	TriggerAction( 2, SetProfession, 12  )
	TriggerAction( 2, JumpPage, 6 )
	TriggerFailure( 2, JumpPage, 7 )

	Talk(5,  "Sharpshoots nowadays only want to earn more money. They will kill anyone on sight as long as there is a bounty. Friend, it seems that you are suitable to become a sharpshooter. You have a good character and build. Would you consider to be one so that you might restore the glory of the Sharpshooters one day? ")
	Text(5,  "Ok, I will become a Sharpshooter ", MultiTrigger, GetMultiTrigger(), 2)
	Text(5,  "No, it is good enough for now. ", CloseTalk)

	Talk(6,  "Sharpshooters are not assassins. You must not forget the principles of the sharpshooters in the future. ")

	Talk(7,  "Want to become a Sharpshooter? Come back here when you are Lv 40. Remember to bring along 1 Clarity Crystal and 15000G too! ")

	--InitTrigger()

-------------------ת�����ж�
	--TriggerCondition( 1, LvCheck,  "> ", 9 )
	----TriggerCondition( 1, IsCategory, 1 )
	--TriggerCondition( 1, PfEqual, 0 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerCondition( 2, LvCheck,  "> ", 9 )
	--TriggerCondition( 2, IsCategory, 3 )
	--TriggerCondition( 2, PfEqual, 0 )
	--TriggerAction( 2, JumpPage, 2 )
	--TriggerFailure( 2, JumpPage, 1 )

----------------�ѻ���

	--TriggerCondition( 3, LvCheck,  "> ", 39 )
	--TriggerCondition( 3, IsCategory, 1 )
	--TriggerCondition( 3, PfEqual, 2 )
	--TriggerAction( 3, JumpPage, 5 )
	--TriggerCondition( 4, LvCheck,  "> ", 39 )
	--TriggerCondition( 4, IsCategory, 3 )
	--TriggerCondition( 4, PfEqual, 2 )
	--TriggerAction( 4, JumpPage, 5 )
	--TriggerFailure( 4, JumpPage, 1 )

	--Start( GetMultiTrigger(), 2 )
	
	--AddNpcMission ( 729 )
	AddNpcMission ( 101 )
	AddNpcMission ( 251 )
	AddNpcMission ( 252 )
	AddNpcMission ( 260 )
	AddNpcMission ( 261 )
	AddNpcMission 	(410)
	AddNpcMission 	(757)
	AddNpcMission 	(167)
	AddNpcMission 	(168)
	AddNpcMission 	(169)
	AddNpcMission 	(174)
	AddNpcMission 	(175)
	AddNpcMission 	(176)
	AddNpcMission 	(180)
	AddNpcMission 	(523)
	AddNpcMission(	1237	)
-------------eleven
	AddNpcMission(	5057	)
	AddNpcMission(	5061	)	
	AddNpcMission(	5069	)
----------1.7
	AddNpcMission(	5168	)
	AddNpcMission(	5090	)
	AddNpcMission (5097 )
	AddNpcMission (5098 )
	AddNpcMission (5099 )
	AddNpcMission (5100 )
	AddNpcMission (5111 )

	MisListPage(2)


	-----��������
	AddNpcMission ( 6125 )


end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���Ǳ���ʿ����ŷ

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[���Ǳ��̻�᳤��������]		--
--							--
--		129486,49842				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk79 ()
	
	
	Talk( 1,  "�����: ������! � ������������ ������, ����� ������� ������� ������. � ����� ��� ���� ������. " )
	Text( 1,  "������� ����������������� ����� ", JumpPage, 5)

	--------------------���������
	InitTrigger()
	TriggerCondition( 1, HasItem, 1779, 1 )
	TriggerCondition( 1, HasItem, 3138, 2 )
	TriggerCondition( 1, HasItem, 3137, 2 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3138, 2 )
	TriggerAction( 1, TakeItem, 3137, 2 )
	TriggerAction( 1, TakeItem, 1779, 1 )
	TriggerAction( 1, GiveItem, 3139, 1 , 4)
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 7 )
	Talk( 5,  "�����: �� �����, ��� ������� �������� ����� �������. ������ � ������ ����� ��������� �����! " )
	Text( 5,  "������� ���������� ",MultiTrigger, GetMultiTrigger(), 1)

	----------------�ϳ�ħ��ҩˮ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1779, 1 )
	TriggerCondition( 1, HasItem, 3133, 1 )
	TriggerCondition( 1, HasItem, 3134, 1 )
	TriggerCondition( 1, HasItem, 3135, 1 )
	TriggerCondition( 1, HasItem, 3136, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3133, 1 )
	TriggerAction( 1, TakeItem, 3134, 1 )
	TriggerAction( 1, TakeItem, 3135, 1 )
	TriggerAction( 1, TakeItem, 3136, 1 )
	TriggerAction( 1, TakeItem, 1779, 1 )
	TriggerAction( 1, GiveItem, 3140, 1 , 4)
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 8 )
	Text( 5,  "������� ��������� ����� ",MultiTrigger, GetMultiTrigger(), 1)

	Talk( 6,  "�����: ��� ��, ��� �� ����������. " )
	Talk( 7,  "�����: ����� ������� 1 ���������� ���������� 2 ���������, 2 ���������� ������, 1 ������ � 200 ������. " )
	Talk( 8,  "�����: ����� ������� 1 ��������� ����� ���������� 1 ��������� �����, 1 ��� ��������, 1 ����-����, 1 ������ ������� �����, 1 ������ � 200 ������. " )

	AddNpcMission 	(459)
	AddNpcMission 	(465)
	AddNpcMission 	(699)
	AddNpcMission 	(800)
	AddNpcMission	(1005)
	AddNpcMission	(1060)
	AddNpcMission	(1115)
	AddNpcMission	(1169)
	AddNpcMission(	1238	)
	--------------------1.7
	AddNpcMission ( 5084	)
	AddNpcMission ( 5085	)
	AddNpcMission ( 5086	)
	AddNpcMission ( 5087	)
	AddNpcMission (5143 )
	AddNpcMission (5144 )
	AddNpcMission (5145 )
	AddNpcMission (5146 )
	AddNpcMission (5151 )



end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�̻�᳤��������

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[���Ǳ����塤�����˹]		--
--							--
--		134652,45141				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk80 ()
	
	
	Talk( 1,  "���: ������� ���� ����� �������� ����� ����� ��� �������� ����� ������. ����� ��� ���� ����� � �������. " )
	Text( 1,  "������� ��������� ������� ",JumpPage, 2 )
	Text( 1,  "������... ",CloseTalk )


	Talk( 2,  "���: ����.. ������ ������� ��������� �������? ����� ��� ��� �� �����. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerAction( 1, CreateGuild, 1 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2,  "������� ��������� ������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "���: ����� ������� ��������� ������� �� ��� ������. ��� ����� �������� 1 ������ ������ � 100000 ������. " )


	AddNpcMission ( 253 )
	AddNpcMission ( 254 )
	AddNpcMission (	453 )
	AddNpcMission 	(698)
	AddNpcMission 	(801)
	AddNpcMission	(1004)
	AddNpcMission	(1059)
	AddNpcMission	(1114)
	AddNpcMission	(1168)
	AddNpcMission	(317)
	AddNpcMission	(321)
	AddNpcMission	(322)
-----------eleven
	AddNpcMission	(5045)
	AddNpcMission	(5046)
	AddNpcMission	(5047)

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���Ǳ����塤�����˹

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[���г��ɡ�������]		--
--							--
--		136058,51931				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk81 ()
	
	
	Talk( 1,  "�������: ����� ���������� � ���� ������! ��� � ���� ������? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (200 �������) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "��������, �� � ��� ������������ ����� ��� ����� � ���������. " )

	AddNpcMission	(1102)
	AddNpcMission	(187)
	AddNpcMission	(188)
	AddNpcMission	(189)
----------eleven
	AddNpcMission	(597)
	AddNpcMission	(598)	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<���г��ɡ�������

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[�ưɷ���Ա���Ű���]		--
--							--
--		131083,53031				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk82 ()
	
	
	Talk( 1,  "�������: ������������! �� �������� �� � ��� ���������� ������� ��� ����? " )
	Text( 1,  "������� ��������� ", JumpPage, 2)
	Text( 1,  "������� ��� ", JumpPage, 6)

-----------������ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 1792, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1792, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1802, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2,  "�������: �� ����������� � ��� �� ����������? �������� ���! " )
	Text( 2,  "������� ������� ��������� ", MultiTrigger, GetMultiTrigger(), 1)
-------------------------������ɫȾ����
	InitTrigger()
	TriggerCondition( 1, HasItem, 1793, 5 )
	TriggerCondition( 1, HasItem, 1657, 1 )
	TriggerCondition( 1, HasItem, 1778, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1793, 5 )
	TriggerAction( 1, TakeItem, 1657, 1 )
	TriggerAction( 1, TakeItem, 1778, 1 )
	TriggerAction( 1, GiveItem, 1803, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 2,  "������� ��������� ��������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "�������: ���, �� ��� �� ������� ������! " )
	Talk( 4,  "�������: ��� ������������� 1 �������� ��������� ����� 5 ������� ������, 1 ������ ���, 1 �������� ������ � 200 ������. " )
	Talk( 5,  "�������: ��� ������������� 1 ���������� ��������� ����� 5 ��������� ������, 1 ������ ���, 1 �������� ������ � 200 ������. " )

	InitTrigger()
	TriggerCondition( 1, HasItem, 1777, 1 )
	TriggerCondition( 1, HasItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 3116, 10 )
	TriggerAction( 1, TakeItem, 1777, 1 )
	TriggerAction( 1, GiveItem, 3122, 1 , 4)
	TriggerAction( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 8 )
	Talk( 6,  "�������: � ���� ������ ��� �� ���� ������! �� ����������� ������? " )
	Text( 6,  "������� ��� ����������� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 7,  "�������: ������� ��� ����� ������� ���, ��� � �������. " )

	Talk( 8,  "�������: ��������, �� ��� ������������� 1 ��� ����������� ������ ��������� 10 ���������� ������� � 1 ������. " )
	AddNpcMission	(1078)
	AddNpcMission	(389)

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ưɷ���Ա���Ű���

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[��װ����������]		--
--							--
--		134926,53992				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk83 ()
	
	
	Talk( 1,  "�����: ������, � ������� ������. � ���� �� ������ ����� ������ ������� � ������! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )
	
	InitTrade()
	Defence(	0305	)
	Defence(	0481	)
	Defence(	0657	)
	Defence(	0313	)
	Defence(	0487	)
	Defence(	0665	)
	Defence(	0306	)
	Defence(	0482	)
	Defence(	0658	)
	Defence(	0311	)
	Defence(	0489	)
	Defence(	0663	)
	Defence(	0307	)
	Defence(	0483	)
	Defence(	0659	)
	Defence(	0314	)
	Defence(	0490	)
	Defence(	0666	)
	Defence(	0310	)
	Defence(	0486	)
	Defence(	0662	)
	Defence(	0491	)
	Defence(	0315	)
	Defence(	0667	)
	Defence(	0312	)
	Defence(	0488	)
	Defence(	0664	)
	Defence(	0316	)
	Defence(	0492	)
	Defence(	0668	)
	Defence(	0317	)
	Defence(	0493	)
	Defence(	0669	)




	AddNpcMission ( 725 )
	AddNpcMission	(1067)
	AddNpcMission	(170)
	AddNpcMission	(171)
	AddNpcMission	(172)
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<��װ����������

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[�õ��ϰ塤Լɪ��]		--
--							--
--		129074,54098				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk84 ()
	
	
	Talk( 1,  "����: ����� ���������� � ��������� ������. � �� �������� ����. " )
	AddNpcMission	(1085)
	AddNpcMission	(184)
	AddNpcMission	(185)
	AddNpcMission	(186)

	

end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�õ��ϰ塤Լɪ��

----------------------------------------------------------
--							--
--							--
--		���Ǳ�[·�ˡ���]		--
--							--
--		133550,46900				--
----------------------------------------------------------
-----------------------------------------------------------���￪ʼP������
function r_talk85 ()
	
	
	Talk( 1,  "����: �� ������ ���� ���� �������? ��� ����� � ����������, ������� � �������. " )
	--Text( 1,  "Refine ", JumpPage, 2)
-------------------����ؽ��ʯ
	InitTrigger()
	TriggerCondition( 1, HasItem, 1781, 10 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 1781, 10 )
	TriggerAction( 1, GiveItem, 1782, 1 , 4)
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )	
	Talk( 2,  "Tink: I am not just a normal NPC. The game cannot do without me! Hoho! Let me prove it to you! " )
	Text( 2,  "Refine Terra Gold ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "Tink: Ok! This Terra Gold Ore is yours! " )
	Talk( 4,  "Tink: Tink: I have a method to make Terra Gold Ore. Pass me 10 Terra Gold Fragment and 200G and it'll be yours. " )

	AddNpcMission ( 6015 )
	AddNpcMission ( 6016 )
	AddNpcMission ( 6019 )
	AddNpcMission ( 6020 )
	AddNpcMission ( 6021 )
	AddNpcMission ( 6022 )
	AddNpcMission ( 6023 )
	AddNpcMission ( 6024 )

	
end 

-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<·�ˡ���





-- �����
function Npc_Tolik ()   
	Talk( 1, "����������� ����, �����! � ���� �� ������� ��������� ���������� �����! ")    
	Text( 1, "����. ", CloseTalk)
	
	-- ������
	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 2019 )--��� ������ �� ��������
	AddNpcMission ( 2020 )--��� ����������
	AddNpcMission ( 2021 )--��� ����
	AddNpcMission ( 2022 )--��� �������� � ���������
end

-- �������� ���������
function rep_Exchanger ()
    Talk( 1, "����������� ����, �����! ������ �������� ���� ��������� �� ���-�� �������?_�������: " )
    Text( 1, "����� � ������ ", JumpPage, 2)
	InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7958,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 1��(1 ����) - 1000 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,2000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 2000 )
    TriggerAction( 1, GiveItem, 7961,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 2��(1 ����) - 2000 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,3000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 3000 )
    TriggerAction( 1, GiveItem, 7964,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"VIP 3��(1 ����) - 3000 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 271,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 1,"����� ������ - 500 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	Text( 1, "------------>", JumpPage, 4)
    Text( 1, "���� ", CloseTalk )
	
	Talk( 2,"����� 3�. - 500 ���������;_����� 4�. - 800 ���������;_����� 5�. - 1000 ���������. ")
	InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 2753,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"�������� ����� 3 ��. " ,MultiTrigger,GetMultiTrigger(),1)

    InitTrigger()
    TriggerCondition( 1, HasCredit,800)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 800 )
    TriggerAction( 1, GiveItem, 2777,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"�������� ����� 4 ��. " ,MultiTrigger,GetMultiTrigger(),1)
	
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 2801,1,4 )
    TriggerFailure( 1, JumpPage, 3)
    Text( 2,"�������� ����� 5 ��. " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 3, "��� ������ ��� �� ������� ���������! ")
	Text( 3, "�����. ", CloseTalk )

	Talk(4, "������ ��������: ")
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 267,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"���� ���� - 350 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 268,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"���� ����� - 350 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 553500 )
    TriggerAction( 1, GiveItem, 269,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"���� ����� - 350 ���. " ,MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
    TriggerCondition( 1, HasCredit,350)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 350 )
    TriggerAction( 1, GiveItem, 270,1,4 )
    TriggerFailure( 1, JumpPage, 3)
	Text( 4,"���� ������ - 350 ���. " ,MultiTrigger,GetMultiTrigger(),1)
    Text( 4, "���� ", CloseTalk )

	-- ������
	AddNpcMission ( 922 )
	AddNpcMission ( 923 )
end

-- �����������
function Npc_Monday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 1 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� �������������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- �������
function Npc_Tuesday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 2 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ���������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- �����
function Npc_Wensday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 3 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- �������
function Npc_Thusday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 4 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ���������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- �������
function Npc_Friday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 5 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ��������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- �������
function Npc_Satturday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 6 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ��������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- ����������� 
function Npc_Sunday()
	InitTrigger()
	TriggerCondition( 1, CheckDay, 7 )
	TriggerFailure( 1, JumpPage, 2 )
	Start( GetMultiTrigger(), 1 )

	Talk( 2, "����������� ����, �����! � ������������ ������ �� ������������! ")
	Text( 2, "�����, �� �������! ", CloseTalk )
end

-- ���������
function Medsestra ()
	InitTrigger()
	TriggerAction( 1, ReAll )
	Start( GetMultiTrigger(),1 )
end

-- ������
function Buffer ()
	InitTrigger()
	TriggerAction( 1, MegaBuff )
	Start( GetMultiTrigger(), 1 )
end

-- �������� ���������
function Trade_Neck()
	Talk( 1, "����������� ����, ��������! ����� ����������� ���������? " )
	Text( 1, "���������� �����������! ", BuyPage)
	
	Other(	6662  )
	Other(	6661  )
	Other(	6660  )
	Other(	6659  )
	Other(	6658  )
	Other(	6657  )
	Other(	6656  )
	Other(	6655  )
	Other(	6654  )
	Other(	6653  )
	Other(	6652  )
	Other(	6651  )
	Other(	6650  )
	Other(	6649  )
	Other(	6648  )
	Other(	6647  )
	Other(	6648  )
	Other(	6647  )
	Other(	6646  )
	Other(	6645  )
	Other(	6644  )
	Other(	6643  )
	Other(	6642  )
	Other(	6641  )
	Other(	6640  )
	Other(	6639  )
	Other(	6638  )
	Other(	6904  )
	Other(	6905  )
	Other(	6906  )
	Other(	6907  )
	Other(	6908  )

end

-- �������� ���������� +7
function Exchange_gem_7 ()
	Talk( 1, "����������� ����, �����!_��������� � ���� ������ ����� +7_� ���� �� ������� ����� �������!. ")
	Text( 1, "������ ���� +7 ", JumpPage, 2)
	Text( 1, "������ ������������ +7 ", JumpPage, 3)
	Text( 1, "������ �������� +7 ", JumpPage, 4)
	Text( 1, "������ �������� +7 ", JumpPage, 5)
	Text( 1, "������ ���� +7 ", JumpPage, 6)
	Talk( 2," �������� ������ ���-�� ������� " )
	Text( 2, " 1 ������ ", JumpPage, 7)
	Text( 2, " 5 ������� ", JumpPage, 8)
	Text( 2, " 10 ������� ", JumpPage, 9)
	Talk( 3," �������� ������ ���-�� ������� " )
	Text( 3, " 1 ������ ", JumpPage, 10)
	Text( 3, " 5 ������� ", JumpPage, 11)
	Text( 3, " 10 ������� ", JumpPage, 12)
	Talk( 4," �������� ������ ���-�� ������� " )
	Text( 4, " 1 ������ ", JumpPage, 13)
	Text( 4, " 5 ������� ", JumpPage, 14)
	Text( 4, " 10 ������� ", JumpPage, 15)
	Talk( 5," �������� ������ ���-�� ������� " )
	Text( 5, " 1 ������ ", JumpPage, 16)
	Text( 5, " 5 ������� ", JumpPage, 17)
	Text( 5, " 10 ������� ", JumpPage, 18)
	Talk( 6," �������� ������ ���-�� ������� " )
	Text( 6, " 1 ������ ", JumpPage, 19)
	Text( 6, " 5 ������� ", JumpPage, 20)
	Text( 6, " 10 ������� ", JumpPage, 21)
	-- ���� +7
	Talk(7," ��� ����� ������ 1 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5205,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," ��� ����� ������ 5 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5205,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," ��� ����� ������ 10 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5205,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- ������������ +7
	Talk(10," ��� ����� ������ 1 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5204,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," ��� ����� ������ 5 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5204,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," ��� ����� ������ 10 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5204,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +7
	Talk(13," ��� ����� ������ 1 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5202,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," ��� ����� ������ 5 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5202,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," ��� ����� ������ 10 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5202,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +7
	Talk(16," ��� ����� ������ 1 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5203,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," ��� ����� ������ 5 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5203,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," ��� ����� ������ 10 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5203,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	-- ��� +7
	Talk(19," ��� ����� ������ 1 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5206,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," ��� ����� ������ 5 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5206,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," ��� ����� ������ 10 �������� +7! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7483,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7483,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5206,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"������� �����!_������������ ���������� ����� � ���������,_���� ����������� ������ ���������� �������� +7 " )
end

function Exchange_gem_14 ()
	Talk( 1, "����������� ����, �����!_��������� � ���� ������ ����� +14_� ���� �� ������� ����� �������!. ")
	Text( 1, "������ ���� +14 ", JumpPage, 2)
	Text( 1, "������ ������������ +14 ", JumpPage, 3)
	Text( 1, "������ �������� +14 ", JumpPage, 4)
	Text( 1, "������ �������� +14 ", JumpPage, 5)
	Text( 1, "������ ���� +14 ", JumpPage, 6)
	Talk( 2," �������� ������ ���-�� ������� " )
	Text( 2, " 1 ������ ", JumpPage, 7)
	Text( 2, " 5 ������� ", JumpPage, 8)
	Text( 2, " 10 ������� ", JumpPage, 9)
	Talk( 3," �������� ������ ���-�� ������� " )
	Text( 3, " 1 ������ ", JumpPage, 10)
	Text( 3, " 5 ������� ", JumpPage, 11)
	Text( 3, " 10 ������� ", JumpPage, 12)
	Talk( 4," �������� ������ ���-�� ������� " )
	Text( 4, " 1 ������ ", JumpPage, 13)
	Text( 4, " 5 ������� ", JumpPage, 14)
	Text( 4, " 10 ������� ", JumpPage, 15)
	Talk( 5," �������� ������ ���-�� ������� " )
	Text( 5, " 1 ������ ", JumpPage, 16)
	Text( 5, " 5 ������� ", JumpPage, 17)
	Text( 5, " 10 ������� ", JumpPage, 18)
	Talk( 6," �������� ������ ���-�� ������� " )
	Text( 6, " 1 ������ ", JumpPage, 19)
	Text( 6, " 5 ������� ", JumpPage, 20)
	Text( 6, " 10 ������� ", JumpPage, 21)
	-- ���� +14
	Talk(7," ��� ����� ������ 1 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5210,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," ��� ����� ������ 5 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5210,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," ��� ����� ������ 10 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5210,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- ������������ +14
	Talk(10," ��� ����� ������ 1 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5209,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," ��� ����� ������ 5 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5209,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," ��� ����� ������ 10 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5209,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +14
	Talk(13," ��� ����� ������ 1 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5207,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," ��� ����� ������ 5 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5207,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," ��� ����� ������ 10 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5207,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +14
	Talk(16," ��� ����� ������ 1 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5208,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," ��� ����� ������ 5 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5208,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," ��� ����� ������ 10 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5208,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	-- ��� +14
	Talk(19," ��� ����� ������ 1 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5211,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," ��� ����� ������ 5 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5211,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," ��� ����� ������ 10 �������� +14! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7510,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7510,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5211,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"������� �����!_������������ ���������� �����,_���� ����������� ������ ���������� �������� +14 " )
end
function Exchange_gem_20 ()
	Talk( 1, "����������� ����, �����!_��������� � ���� ������ ����� +20_� ���� �� ������� ����� �������!. ")
	Text( 1, "������ ���� +20 ", JumpPage, 2)
	Text( 1, "������ ������������ +20 ", JumpPage, 3)
	Text( 1, "������ �������� +20 ", JumpPage, 4)
	Text( 1, "������ �������� +20 ", JumpPage, 5)
	Text( 1, "������ ���� +20 ", JumpPage, 6)
	Talk( 2," �������� ������ ���-�� ������� " )
	Text( 2, " 1 ������ ", JumpPage, 7)
	Text( 2, " 5 ������� ", JumpPage, 8)
	Text( 2, " 10 ������� ", JumpPage, 9)
	Talk( 3," �������� ������ ���-�� ������� " )
	Text( 3, " 1 ������ ", JumpPage, 10)
	Text( 3, " 5 ������� ", JumpPage, 11)
	Text( 3, " 10 ������� ", JumpPage, 12)
	Talk( 4," �������� ������ ���-�� ������� " )
	Text( 4, " 1 ������ ", JumpPage, 13)
	Text( 4, " 5 ������� ", JumpPage, 14)
	Text( 4, " 10 ������� ", JumpPage, 15)
	Talk( 5," �������� ������ ���-�� ������� " )
	Text( 5, " 1 ������ ", JumpPage, 16)
	Text( 5, " 5 ������� ", JumpPage, 17)
	Text( 5, " 10 ������� ", JumpPage, 18)
	Talk( 6," �������� ������ ���-�� ������� " )
	Text( 6, " 1 ������ ", JumpPage, 19)
	Text( 6, " 5 ������� ", JumpPage, 20)
	Text( 6, " 10 ������� ", JumpPage, 21)
	-- ���� +20
	Talk(7," ��� ����� ������ 1 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5215,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," ��� ����� ������ 5 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5215,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," ��� ����� ������ 10 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5215,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- ������������ +20
	Talk(10," ��� ����� ������ 1 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5214,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," ��� ����� ������ 5 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5214,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," ��� ����� ������ 10 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5214,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +20
	Talk(13," ��� ����� ������ 1 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5212,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," ��� ����� ������ 5 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5212,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," ��� ����� ������ 10 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5212,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +20
	Talk(16," ��� ����� ������ 1 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5213,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," ��� ����� ������ 5 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5213,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," ��� ����� ������ 10 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5213,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	-- ��� +20
	Talk(19," ��� ����� ������ 1 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5216,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," ��� ����� ������ 5 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5216,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," ��� ����� ������ 10 �������� +20! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7620,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7620,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5216,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"������� �����!_������������ ���������� ����� � ���������,_���� ����������� ������ ���������� �������� +20 " )
end
function Exchange_gem_30 ()
	Talk( 1, "����������� ����, �����!_��������� � ���� ������ ����� +30_� ���� �� ������� ����� �������!. ")
	Text( 1, "������ ���� +30 ", JumpPage, 2)
	Text( 1, "������ ������������ +30 ", JumpPage, 3)
	Text( 1, "������ �������� +30 ", JumpPage, 4)
	Text( 1, "������ �������� +30 ", JumpPage, 5)
	Text( 1, "������ ���� +30 ", JumpPage, 6)
	Talk( 2," �������� ������ ���-�� ������� " )
	Text( 2, " 1 ������ ", JumpPage, 7)
	Text( 2, " 5 ������� ", JumpPage, 8)
	Text( 2, " 10 ������� ", JumpPage, 9)
	Talk( 3," �������� ������ ���-�� ������� " )
	Text( 3, " 1 ������ ", JumpPage, 10)
	Text( 3, " 5 ������� ", JumpPage, 11)
	Text( 3, " 10 ������� ", JumpPage, 12)
	Talk( 4," �������� ������ ���-�� ������� " )
	Text( 4, " 1 ������ ", JumpPage, 13)
	Text( 4, " 5 ������� ", JumpPage, 14)
	Text( 4, " 10 ������� ", JumpPage, 15)
	Talk( 5," �������� ������ ���-�� ������� " )
	Text( 5, " 1 ������ ", JumpPage, 16)
	Text( 5, " 5 ������� ", JumpPage, 17)
	Text( 5, " 10 ������� ", JumpPage, 18)
	Talk( 6," �������� ������ ���-�� ������� " )
	Text( 6, " 1 ������ ", JumpPage, 19)
	Text( 6, " 5 ������� ", JumpPage, 20)
	Text( 6, " 10 ������� ", JumpPage, 21)
	-- ���� +30
	Talk(7," ��� ����� ������ 1 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5220,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," ��� ����� ������ 5 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5220,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," ��� ����� ������ 10 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5220,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- ������������ +30
	Talk(10," ��� ����� ������ 1 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5219,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," ��� ����� ������ 5 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5219,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," ��� ����� ������ 10 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5219,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +30
	Talk(13," ��� ����� ������ 1 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5217,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," ��� ����� ������ 5 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5217,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," ��� ����� ������ 10 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5217,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +30
	Talk(16," ��� ����� ������ 1 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5218,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," ��� ����� ������ 5 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5218,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," ��� ����� ������ 10 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5218,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	-- ��� +30
	Talk(19," ��� ����� ������ 1 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5221,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," ��� ����� ������ 5 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5221,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," ��� ����� ������ 10 �������� +30! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7930,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7930,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5221,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"������� �����!_������������ ���������� ����� � ���������,_���� ����������� ������ ���������� �������� +30 " )
end
function Exchange_gem_40 ()
	Talk( 1, "����������� ����, �����!_��������� � ���� ������ ����� +40_� ���� �� ������� ����� �������!. ")
	Text( 1, "������ ���� +40 ", JumpPage, 2)
	Text( 1, "������ ������������ +40 ", JumpPage, 3)
	Text( 1, "������ �������� +40 ", JumpPage, 4)
	Text( 1, "������ �������� +40 ", JumpPage, 5)
	Text( 1, "������ ���� +40 ", JumpPage, 6)
	Talk( 2," �������� ������ ���-�� ������� " )
	Text( 2, " 1 ������ ", JumpPage, 7)
	Text( 2, " 5 ������� ", JumpPage, 8)
	Text( 2, " 10 ������� ", JumpPage, 9)
	Talk( 3," �������� ������ ���-�� ������� " )
	Text( 3, " 1 ������ ", JumpPage, 10)
	Text( 3, " 5 ������� ", JumpPage, 11)
	Text( 3, " 10 ������� ", JumpPage, 12)
	Talk( 4," �������� ������ ���-�� ������� " )
	Text( 4, " 1 ������ ", JumpPage, 13)
	Text( 4, " 5 ������� ", JumpPage, 14)
	Text( 4, " 10 ������� ", JumpPage, 15)
	Talk( 5," �������� ������ ���-�� ������� " )
	Text( 5, " 1 ������ ", JumpPage, 16)
	Text( 5, " 5 ������� ", JumpPage, 17)
	Text( 5, " 10 ������� ", JumpPage, 18)
	Talk( 6," �������� ������ ���-�� ������� " )
	Text( 6, " 1 ������ ", JumpPage, 19)
	Text( 6, " 5 ������� ", JumpPage, 20)
	Text( 6, " 10 ������� ", JumpPage, 21)
	-- ���� +40
	Talk(7," ��� ����� ������ 1 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5225,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(8," ��� ����� ������ 5 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5225,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(9," ��� ����� ������ 10 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5225,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- ������������ +40
	Talk(10," ��� ����� ������ 1 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(11," ��� ����� ������ 5 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(12," ��� ����� ������ 10 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +40
	Talk(13," ��� ����� ������ 1 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5222,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(14," ��� ����� ������ 5 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5222,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(15," ��� ����� ������ 10 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5222,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)
	-- �������� +40
	Talk(16," ��� ����� ������ 1 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(17," ��� ����� ������ 5 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(18," ��� ����� ������ 10 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5223,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	-- ��� +40
	Talk(19," ��� ����� ������ 1 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5226,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(20," ��� ����� ������ 5 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,5 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5226,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)
	Talk(21," ��� ����� ������ 10 �������� +40! " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7825,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7825,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 5226,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 22)
	Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)	
	Talk(22,"������� �����!_������������ ���������� ����� � ���������_���� ����������� ������ ���������� �������� +40 " )
end

-- �������� ���
function exchange_sue()
	Talk( 1, "����������� ����, �����! ������ �������� ���� ���? ������� ����������! ")
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,10 )
	TriggerAction( 1, exchange_sue_fast, 10 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"��� �10 ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,50 )
	TriggerAction( 1, exchange_sue_fast, 50 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"��� �50 ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
	TriggerCondition( 1, HasItem,7482,100 )
	TriggerAction( 1, exchange_sue_fast, 100 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(1,"��� �100 ",MultiTrigger,GetMultiTrigger(),1)


	Text( 1, "����. ", CloseTalk)

	Talk(10, "���-�� ����� �� ���! ")
	Text(10, "������� �����. ", CloseTalk)
end

-- ����� ��������(��������� ������� � �������� ����������)
function straj_Newbie()
	Talk( 1, "����������� ����, �����!_�������� ��������� � ������� ���� ��������� �����!_� ������ � ���������� �� ����. ")
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, GetKontrakt, 4, 3000, 50 )
	Text( 1, "�������� �������� ", MultiTrigger, GetMultiTrigger(), 1)
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, GetKontrakt, 5, 294, 20 )
	Text( 1, "�������� ����� ", MultiTrigger, GetMultiTrigger(), 1)
	--	InitTrigger()
	--	TriggerCondition( 1, LvCheck, "<", 101 )
	--	TriggerFailure( 1, JumpPage, 2 )
	--	TriggerAction( 1, GetKontrakt, 6, 3000, 300 )
	--Text( 1, "VIP �������� ", MultiTrigger, GetMultiTrigger(), 1)
		InitTrigger()
		TriggerCondition( 1, LvCheck, "<", 101 )
		TriggerFailure( 1, JumpPage, 2 )
		TriggerAction( 1, DeleteKontrakt )
	Text( 1, "������� 1 �������� ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 1, "����. ", CloseTalk )
	
	Talk( 2, "����� ������������ ���� ����������, ����� ���� ������ 100 ������. ")
	Text( 2, "", CloseTalk)
end

-- �������� ����������(����, ������� � ��)
function sell_all ()
	
	Talk( 1,  "������! ������ � ��� �������, � ������ ����� �����������! " )
	Text( 1,  "���������� ����������� ", BuyPage )
   
	Weapon(	3096    )
	Weapon(	3097	)
	Weapon(	3094    )
	Weapon(	3095	)
	Weapon(	0849	)
    Defence(	3088	)
	Defence(	3089	)
	Defence(	3090	)
	Defence(	3091	)
	Defence(	3092	)
	Defence(	3093	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	)
	Defence(	3112	)
	Defence(	3113	)
	Other(	3098	)
	Other(	3099	)
	Other(	7837	)
	Other(	7838	)
	Other(	3143	)
	Other(	3047	)
	Other(	2440	)
	Other(	3301	)
	Other(	3463	)
	Other(	4603	)
	Other(	2816	)
	
end

-- �������� � �������
function Tp_all()
	Talk( 1, "����������� ����, ��������! ���� ������ ������� �� ���� ���? " ) 
	--Text( 1, "������ ", JumpPage, 3 )
	Text( 1, "������� ", JumpPage, 2 )
	Text( 1, "���� ", JumpPage, 6 )
	--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )
	
	Text( 2, "\206\241\242\240\238\226 \196\230\229\234\224 ", GoTo, 1503, 1036, "magicsea" )
	Text( 2, "\206\241\242\240\238\226 \209\242\243\230\232 ", GoTo, 77, 199, "stuja" )
	--Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
	--Text( 2, "������ ����� ", GoTo, 77, 199, "stuja" )
	--Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
	--Text( 2, "\206\241\242\240\238\226 \213\253\235\235\238\243\232\237\224 ", GoTo, 160,140, "halloween" )
	--Text( 2, "\206\241\242\240\238\226 \209\234\238\240\225\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 99, 103, "farmer1" )
	Text( 2, "������ ������ ", GoTo, 56, 90, "fishing" )
	--Text( 2, "\206\241\242\240\238\226 \210\251\234\226 ", GoTo, 160, 140, "halloween" )
	--Text( 2, "\196\224\235\229\229 ", JumpPage, 4 )
	
	--Text( 3, "\195\238\240\238\228 \209\243\228\252\225\251 ", GoTo, 157, 128, "CrystalShore" )
	--Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
	--Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
	--Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )
	--Text( 4, "NEW 2. ", GoTo, 98, 113, "necropolis" )
	
	
	--Text( 5, "1 ", GoTo, 311, 297, "eastgoaf" )
	--Text( 5, "2 ", GoTo, 56, 252, "eastgoaf" )
	--Text( 5, "3 ", GoTo, 889, 526, "eastgoaf" )
	--Text( 5, "4 ", GoTo, 768,661, "eastgoaf" )
	--Text( 5, "5 ", GoTo, 777,730, "eastgoaf" )
	--Text( 5, "6 ", GoTo, 612,626, "jialebi" )
	--Text( 5, "7 ", GoTo, 1263,1008, "jialebi" )
	--Text( 5, "8 ", GoTo, 947,837, "jialebi" )
	--Text( 5, "9 ", GoTo, 1247,601, "jialebi" )
	
	Talk( 6, "�������, � ����� ���� ������ �������: ")
	Text( 6, "����� (������ ������) ", GoTo, 1139, 297, "magicsea" )
	Text( 6, "������� ������ (��. 200) ", GoTo, 639, 568, "magicsea" )
	--Text( 6, "\208\238\249\224 \215\229\240\229\239\224\245 (\211\240. 230-300) ", GoTo, 983, 455, "magicsea" )
	--Text( 6, "\203\224\227\229\240\252 \207\243\241\242\251\237\237\251\245 \209\234\229\235\229\242\238\226 (\211\240. 350-400) ", GoTo, 951, 319, "magicsea" )
	--Text( 6, "\207\247\229\235\232\237\251\233 \206\224\231\232\241 (\211\240. 450-500) ", GoTo, 868, 393, "magicsea" )
	--Text( 6, "\203\224\227\229\240\252 \206\224\231\232\241 (\211\240. 550-600) ", GoTo, 564, 383, "magicsea" )
	--Text( 6, "\211\235\232\242\238\247\237\251\233 \206\224\231\232\241 (\211\240. 650-700) ", GoTo, 466, 395, "magicsea" )
	--Text( 6, "\196\224\235\229\229 ", JumpPage, 7 )
	
	--Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
	--Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 357, 181, "magicsea" )
	--Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 451, 189, "magicsea" )
	--Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 536, 185, "magicsea" )

 end

 function Npc_Jessika ()
	Talk( 1, "����������� ����, �����!_��� ���� ����� ������ ���� ����? " )
	Text( 1, "���� ���-������ ������ ", BuyPage)
	Text( 1, "���� ", CloseTalk)

	InitTrade()
	Weapon(	3343	)
	Weapon(	3077	)
	Weapon(	2870	)
	Weapon(	3355	)
	Weapon(	3351	)
	Weapon(	3352	)
	Weapon(	3353	)
	Weapon(	4264	)
	Weapon(	4265	)
	Weapon(	4266	)
	Weapon(	4267	)
	Weapon(	4268	)
	Weapon(	4269	)
	Weapon(	4270	)

	AddNpcMission ( 919 )
	AddNpcMission ( 924 )
	AddNpcMission ( 2040 )
end

--����
function npc_bank ()
	
	Talk( 1, "������! ����� ���������� � ���� �������. ���� �� � ���-���� ������? " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (50000 ������) ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 1,  "������� ����� ", JumpPage, 3)
	Talk( 2,  "������, �� � ���� ������������ ����� �� ����� " )
	
	Talk( 3, "� ������� �������� ������ ������� ������ " )
	--Text( 3,  "������ 10�� (10 ����)", JumpPage, 4)
	--Text( 3,  "������ 10�� (50 ����)", JumpPage, 5)
	--Text( 3,  "������ 50�� ", JumpPage, 6)
	--Text( 3,  "������ 100�� ", JumpPage, 7)
	Text( 3,  "������ 500.000 ", JumpPage, 8)
	Text( 3,  "������ 500.000 10 ����", JumpPage, 7)
	Text( 3,  "������ 1.000.000 ", JumpPage, 9)
	Text( 3,  "������ 5.000.000 ", JumpPage, 10)
	Text( 3,  "������ 50.000.000 ", JumpPage, 11)
	Text( 3,  "������ 100.000.000", JumpPage, 12)
	Text( 3,  "������ 500.000.000", JumpPage, 13)
	Text( 3,  "������ 1.000.000.000", JumpPage, 14)
	Talk( 4, "�� ��� ������� ����� " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7476,10 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7476,10 )
	TriggerAction( 1, AddMoney, 100000000 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(4," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 5, "������ ������� " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7476,50 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7476,50 )
	TriggerAction( 1, AddMoney, 500000000 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(5," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 6, "������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem,7491,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 7491,1 )
	TriggerAction( 1, AddMoney, 50000000 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 10)
	Text(6," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 7, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, GiveItem, 7493,10,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 8, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 500000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 500000 )
	TriggerAction( 1, GiveItem, 7493,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 9, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 1000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 1000000 )
	TriggerAction( 1, GiveItem, 854,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 10, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 5000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 5000000 )
	TriggerAction( 1, GiveItem, 7734,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 11, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 50000000 )
	TriggerAction( 1, GiveItem, 7735,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 12, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, GiveItem, 7742,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 13, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 500000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 500000000 )
	TriggerAction( 1, GiveItem, 7736,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk( 14, "�� ��?! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 1000000000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeMoney, 1000000000 )
	TriggerAction( 1, GiveItem, 7743,1,4 )
	TriggerFailure( 1, JumpPage, 10)
	Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)


	AddNpcMission (	2024	)
	AddNpcMission (	2025	)
	AddNpcMission (	1051	)
	AddNpcMission (	1104	)
	AddNpcMission (	1160	)
	AddNpcMission (	1213	)
	AddNpcMission (	1231	)
	AddNpcMission (	5012	)	
end 



--��� � �����
function npc_fairy ()
	
	Talk( 1,  "�������� ���: ������! � ���� �������!��������� ������������ ������,�� ������� �������� ������� �� ������ ��� " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "��������� ��� ", OpenItemTiChun )
	Text( 1,  "������� ������ ��� 200-500 ", JumpPage, 2)
	Text( 1,  "����������� ������ ��� 500-800 ", JumpPage, 11)
	Text( 1,  "����� ����� ��� ", JumpPage, 8)
	Text( 1,  "�������� ��� ������� ", JumpPage, 17)
	
	Talk( 2," �������� ������ ����� " )
	Text( 2, " ����� ���� ", JumpPage, 3)
	Text( 2, " ����� �������� ", JumpPage, 4)
	Text( 2, " ����� �������� ", JumpPage, 5)
	Text( 2, " ����� ������������ ", JumpPage, 6)
	Text( 2, " ����� ���� ", JumpPage, 7)
	
	Talk( 8," ���������� ������ ����� ������ 30 ����� ���,� ����������� �� 500! " )
	Text( 8, " ���������� ������ ", JumpPage, 9)
	Text( 8, " ����������� ������ ", JumpPage, 10)
	
	Talk( 11," �������� ������ ����� " )
	Text( 11, " ����� ���� ", JumpPage, 12)
	Text( 11, " ����� �������� ", JumpPage, 13)
	Text( 11, " ����� �������� ", JumpPage, 14)
	Text( 11, " ����� ������������ ", JumpPage, 15)
	Text( 11, " ����� ���� ", JumpPage, 16)
	
	Talk( 17," ��� ������� ������ ��� ������ ���� ��������� 500 �������.��� ��� ������ ������� - 1000 �������.��� ��� ������� - 2000 �������! " )
	
	Talk( 3," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )

	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7431,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(3,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(3,"10 ������� ", JumpPage, 18)
	
	Talk(4," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7430,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(4,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(4,"10 ������� ", JumpPage, 19)
	
	Talk(5," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7433,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(5,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(5,"10 ������� ", JumpPage, 20)
	
	Talk(6," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7419,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(6,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(6,"10 ������� ", JumpPage, 21)
	
	Talk(7," ��� ����� ������ 1 �������� ��� (������ �� ����� � ����� � �������� 1-4 � ���������) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7434,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(7,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(7,"10 ������� ", JumpPage, 22)
	
	Talk(9," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2588,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,30,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(9,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(9,"10 ���� ", JumpPage, 28)
	
	Talk(10," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2589,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2589,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,500,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(10,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(12," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7506,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(12,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(12,"10 ������� ", JumpPage, 23)
	
	Talk(13," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7505,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(13,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(13,"10 ������� ", JumpPage, 24)
	
	Talk(14," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7507,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(14,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(14,"10 ������� ", JumpPage, 25)
	
	Talk(15," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7504,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(15,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(15,"10 ������� ", JumpPage, 26)
	
	Talk(16," ��� ����� ������ 1 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,1 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7508,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(16,"1 ����� ",MultiTrigger,GetMultiTrigger(),1)
	Text(16,"10 ������� ", JumpPage, 27)
	
	Talk(29," ������������ ���������� �����,���� ������������ ���� " )
	
	Talk(18," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7431,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(18,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7430,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(19,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7433,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(20,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7419,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(21,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22," ��� ����� ������ 10 ���������� ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,1028,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1028,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7434,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(22,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7506,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(23,"����� ",MultiTrigger,GetMultiTrigger(),1)

	Talk(24," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7505,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(24,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7507,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(25,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(26," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7504,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(26,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(27," ��� ����� ������ 10 ������ ������ ��� (������ �� ����� � ����� � ������ ̸����� ���) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,4832,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 4832,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 7508,10,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(27,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28," ������� ��������� �� �� ������� ������� (850,3553) " )
	InitTrigger()
	TriggerCondition( 1, HasItem,2588,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 2588,10 ) -- ��� ������� "�������" �������� � � ����� ����������
	TriggerAction( 1, GiveItem, 855,300,4 ) -- ��� ������� ������ �������� (ID, ���-��)
	TriggerFailure( 1, JumpPage, 29)
	Text(28,"����� ",MultiTrigger,GetMultiTrigger(),1)
	
    Weapon(	0681	)
	Weapon(	2312	)
	Weapon(	0247	)
	Weapon(	0244	)
	Weapon(	0250	)
	Weapon(	0253	)
	Weapon(	0260	)
    Weapon(	0609	)
	Defence(	0222	)
	Defence(	0223	)
	Defence(	0224	)
	Defence(	0225	)
	Defence(	0226	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Other(  3300    )
	Other(  3462    )
	
	AddNpcMission ( 991 )
	AddNpcMission ( 906 )
	AddNpcMission ( 2041 )

end 

--����� 200 ���������, ����� � �����
function Pauk_200 ()   
Talk( 1, "������! �� ��� ����� �� ���� �����? �������, ��� �� ������ ��������: ")    
Text( 1, "��������� � ������ ", GoTo, 667, 839, "magicsea" )
Text( 1, "������ ����� ", JumpPage, 5)
Text( 1, "������ �������� ", JumpPage, 3)
Text( 1, "������ ������ ", JumpPage, 4)



Talk(3,"��� ��������� �������� ��������, ������� ���:_1. ���� ���� - 900��;_2. ׸���� ��������� - 300��;_3. �� - 150��;_4. ����� �������� ����� - 1��;_5. ����� ����� - 3��;_6. ��������� - 200��;_7. ������ - 20 ���������. ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 )
TriggerCondition( 1, HasItem,3362,300 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,3 )
TriggerCondition( 1, HasItem,4441,150 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,900 )
TriggerAction( 1, TakeItem, 3362,300 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,3 )
TriggerAction( 1, TakeItem, 4441,150 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7755,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," �������� �������� ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(4,"����� �������� ������ �����, ������� ���:_1. ���� ���� - 450��;_2. ׸���� ��������� - 150��;_3. �� - 75��;_4. ����� �������� ����� - 1��;_5. ����� ����� - 1��;_6. ��������� - 200��;_7. ������ - 20 ���������. " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,450 )
TriggerCondition( 1, HasItem,3362,150 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,1 )
TriggerCondition( 1, HasItem,4441,75 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,450 )
TriggerAction( 1, TakeItem, 3362,150 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,1 )
TriggerAction( 1, TakeItem, 4441,75 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7754,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4,"�������� ������ ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"����� �������� ������� �����, ������� ���:_1. �������� - 200��;_2. �� - 200��;_3. ����� �������� ����� - 1��;)_4. ����� ������ ������� - 1��;_5. ����� ����� - 2��;_6. ��������� - 200��;_7. ������ - 20 ���������. " )
InitTrigger()
TriggerCondition( 1, HasItem,1728,200 )
TriggerCondition( 1, HasItem,4441,200 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,2 )
TriggerCondition( 1, HasItem,7461,1 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 1728,200 )
TriggerAction( 1, TakeItem, 4441,200 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,2 )
TriggerAction( 1, TakeItem, 7461,1 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7753,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(5,"�������� ������� ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," �� ������� ����! " )

end

--������ ������
function Mirniy_navik ()
	
	Talk( 1,  "������! ������������� ������� ��������? � ���� ������� �����! " )
	Text( 1,  "���������� ����������� ", BuyPage )
   
	Weapon(	3296	)
	Weapon(	3226    )
	Weapon(	3225	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	3288	)
	Defence( 3279	)
	
	--������
	AddNpcMission	(221)
	AddNpcMission	(222)
end

-- �������� �����
function app_lanc () 

	Talk( 1, "����������� ����, �����! ������ ���������� ��������� �� �����? " )
	Text( 1, "���������� �����������", BuyPage)

	InitTrade  ()
	Weapon(	15013	)
	Weapon(	15021	)
	Weapon(	15029	)
	Weapon(	15017	)
	Weapon(	15025	)
	Weapon(	15033	)
	Weapon(	15041	)
	Weapon(	15045	)
	Weapon(	15049	)
	Weapon(	15057	)
	Weapon(	15061	)
	Weapon(	15065	)
	Weapon(	15075	)
	Weapon(	15076	)
	Weapon(	15077	)
	Weapon(	15119	)
	Weapon(	15120	)
	Weapon(	15121	)
	Weapon(	15123	)
	Weapon(	15124	)
	Weapon(	15125	)
	Weapon(	15127	)
	Weapon(	15128	)
	Weapon(	15129	)
	Weapon(	15154	)
	Weapon(	15155	)
	Weapon(	15156	)
	Weapon(	15157	)
	Weapon(	15158	)
	Weapon(	15159	)
	Weapon(	15160	)
	Weapon(	15161	)
	Weapon(	15162	)
	Weapon(	15205	)
	Weapon(	15206	)
	Weapon(	15207	)
	Weapon(	15221	)
	Weapon(	15222	)
	Weapon(	15223	)
	Weapon(	15224	)
	Weapon(	15225	)
	Weapon(	15226	)
	Weapon(	15227	)
	Weapon(	15228	)
	Weapon(	15229	)
	Weapon(	15264	)
	Weapon(	15265	)
	Weapon(	15266	)
	Weapon(	15288	)
	Weapon(	15289	)
	Weapon(	15290	)
	Weapon(	15303	)
	Weapon(	15304	)
	Weapon(	15305	)
	Weapon(	15316	)
	Weapon(	15317	)
	Weapon(	15318	)
	Weapon(	15341	)
	Weapon(	15342	)
	Weapon(	15343	)
	Weapon(	15357	)
	Weapon(	15358	)
	Weapon(	15359	)
	Weapon(	15373	)
	Weapon(	15374	)
	Weapon(	15375	)
	Weapon(	15389	)
	Weapon(	15390	)
	Weapon(	15391	)
	Weapon(	15405	)
	Weapon(	15406	)
	Weapon(	15432	)
	Weapon(	15433	)
	Weapon(	15436	)
	Weapon(	15440	)
	Weapon(	15444	)
	Weapon(	15457	)
	Weapon(	15458	)
	Weapon(	15459	)
	Weapon(	15488	)
	Weapon(	15489	)
	Weapon(	15490	)
	Weapon(	15501	)
	Weapon(	15502	)
	Weapon(	15503	)
	Weapon(	15946	)
	Weapon(	15947	)
	Weapon(	15948	)
	Weapon(	15762	)
	Weapon(	15763	)
	Defence(	15522	)
	Defence(	15523	)
	Defence(	15524	)
	Defence(	15538	)
	Defence(	15539	)
	Defence(	15540	)
	Defence(	15554	)
	Defence(	15555	)
	Defence(	15556	)
	Defence(	15570	)
	Defence(	15571	)
	Defence(	15572	)
	Defence(	15578	)
	Defence(	15579	)
	Defence(	15580	)
	Defence(	15594	)
	Defence(	15595	)
	Defence(	15596	)
	Defence(	15652	)
	Defence(	15653	)
	Defence(	15654	)
	Defence(	15662	)
	Defence(	15663	)
	Defence(	15664	)
	Defence(	15678	)
	Defence(	15679	)
	Defence(	15680	)
	Defence(	15727	)
	Defence(	15728	)
	Defence(	15729	)
	Defence(	15743	)
	Defence(	15744	)
	Defence(	15745	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15971	)
	Defence(	15972	)
	Defence(	15973	)
	Defence(	15992	)
	Defence(	15993	)
	Defence(	15994	)
	Defence(	16344	)
	Defence(	16345	)
	Defence(	16346	)
	Defence(	16353	)
	Defence(	16354	)
	Defence(	16355	)
	Defence(	16369	)
	Defence(	16370	)
	Defence(	16371	)
	Defence(	16385	)
	Defence(	16386	)
	Defence(	16387	)
	Defence(	16401	)
	Defence(	16402	)
	Defence(	16403	)
	Defence(	16417	)
	Defence(	16418	)
	Defence(	16419	)
	Defence(	16433	)
	Defence(	16434	)
	Defence(	16435	)
	Defence(	16449	)
	Defence(	16450	)
	Defence(	16451	)
	Defence(	16465	)
	Defence(	16466	)
	Defence(	16467	)
	Defence(	16481	)
	Defence(	16482	)
	Defence(	16483	)
	Defence(	16521	)
	Defence(	16522	)
	Defence(	16523	)
	Defence(	16545	)
	Defence(	16546	)
	Defence(	16547	)
	Defence(	16549	)
	Defence(	16550	)
	Defence(	16551	)
	Defence(	16553	)
	Defence(	16554	)
	Defence(	16555	)
	Defence(	16561	)
	Defence(	16562	)
	Defence(	16563	)
	Defence(	16577	)
	Defence(	16578	)
	Defence(	16579	)
	Defence(	16537	)
	Defence(	16538	)
	Defence(	16539	)
	Other(	15122	)
	Other(	15126	)
	Other(	15220	)
	Other(	15287	)
	Other(	15945	)
	Other(	15472	)
	Other(	15476	)
	Other(	15480	)
	Other(	15484	)
	Other(	15456	)
	Other(	15404	)
	Other(	15388	)
	Other(	15372	)
	Other(	15356	)
	Other(	15315	)
	Other(	15569	)
	Other(	15577	)
	Other(	15521	)
	Other(	15537	)
	Other(	15553	)
	Other(	15593	)
	Other(	15651	)
	Other(	15661	)
	Other(	15677	)
	Other(	15726	)
	Other(	15742	)
	Other(	15965	)
	Other(	15970	)
	Other(	15843	)
end

-- �������� ������
function app_carcis() 

	Talk( 1, "����������� ����, �����! ������ ���������� ��������� �� �������? " )
	Text( 1, "���������� ����������� ", BuyPage)

	InitTrade()
	Weapon(	15014	)
	Weapon(	15018	)
	Weapon(	15022	)
	Weapon(	15026	)
	Weapon(	15030	)
	Weapon(	15034	)
	Weapon(	15039	)
	Weapon(	15040	)
	Weapon(	15042	)
	Weapon(	15046	)
	Weapon(	15050	)
	Weapon(	15058	)
	Weapon(	15062	)
	Weapon(	15066	)
	Weapon(	15084	)
	Weapon(	15085	)
	Weapon(	15086	)
	Weapon(	15087	)
	Weapon(	15088	)
	Weapon(	15089	)
	Weapon(	15090	)
	Weapon(	15091	)
	Weapon(	15092	)
	Weapon(	15093	)
	Weapon(	15094	)
	Weapon(	15095	)
	Weapon(	15096	)
	Weapon(	15097	)
	Weapon(	15098	)
	Weapon(	15107	)
	Weapon(	15108	)
	Weapon(	15109	)
	Weapon(	15111	)
	Weapon(	15112	)
	Weapon(	15113	)
	Weapon(	15115	)
	Weapon(	15116	)
	Weapon(	15117	)
	Weapon(	15195	)
	Weapon(	15196	)
	Weapon(	15197	)
	Weapon(	15231	)
	Weapon(	15232	)
	Weapon(	15233	)
	Weapon(	15235	)
	Weapon(	15236	)
	Weapon(	15237	)
	Weapon(	15238	)
	Weapon(	15239	)
	Weapon(	15240	)
	Weapon(	15267	)
	Weapon(	15268	)
	Weapon(	15269	)
	Weapon(	15292	)
	Weapon(	15293	)
	Weapon(	15294	)
	Weapon(	15306	)
	Weapon(	15307	)
	Weapon(	15308	)
	Weapon(	15320	)
	Weapon(	15321	)
	Weapon(	15322	)
	Weapon(	15345	)
	Weapon(	15346	)
	Weapon(	15347	)
	Weapon(	15361	)
	Weapon(	15362	)
	Weapon(	15363	)
	Weapon(	15377	)
	Weapon(	15378	)
	Weapon(	15379	)
	Weapon(	15393	)
	Weapon(	15394	)
	Weapon(	15395	)
	Weapon(	15408	)
	Weapon(	15409	)
	Weapon(	15434	)
	Weapon(	15435	)
	Weapon(	15437	)
	Weapon(	15441	)
	Weapon(	15445	)
	Weapon(	15461	)
	Weapon(	15462	)
	Weapon(	15463	)
	Weapon(	15491	)
	Weapon(	15492	)
	Weapon(	15493	)
	Weapon(	15504	)
	Weapon(	15505	)
	Weapon(	15506	)
	Weapon(	15574	)
	Weapon(	15575	)
	Weapon(	15576	)
	Weapon(	16592	)
	Weapon(	16593	)
	Defence(	15526	)
	Defence(	15527	)
	Defence(	15528	)
	Defence(	15542	)
	Defence(	15543	)
	Defence(	15544	)
	Defence(	15558	)
	Defence(	15559	)
	Defence(	15560	)
	Defence(	15582	)
	Defence(	15583	)
	Defence(	15584	)
	Defence(	15598	)
	Defence(	15599	)
	Defence(	15600	)
	Defence(	15656	)
	Defence(	15657	)
	Defence(	15658	)
	Defence(	15666	)
	Defence(	15667	)
	Defence(	15668	)
	Defence(	15682	)
	Defence(	15683	)
	Defence(	15684	)
	Defence(	15731	)
	Defence(	15732	)
	Defence(	15733	)
	Defence(	15747	)
	Defence(	15748	)
	Defence(	15749	)
	Defence(	15950	)
	Defence(	15951	)
	Defence(	15952	)
	Defence(	15969	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15975	)
	Defence(	15976	)
	Defence(	15977	)
	Defence(	15793	)
	Defence(	15794	)
	Defence(	15795	)
	Defence(	15783	)
	Defence(	15784	)
	Defence(	15785	)
	Defence(	16336	)
	Defence(	16345	)
	Defence(	16346	)
	Defence(	16357	)
	Defence(	16358	)
	Defence(	16359	)
	Defence(	16373	)
	Defence(	16374	)
	Defence(	16375	)
	Defence(	16389	)
	Defence(	16390	)
	Defence(	16391	)
	Defence(	16405	)
	Defence(	16406	)
	Defence(	16407	)
	Defence(	16421	)
	Defence(	16422	)
	Defence(	16423	)
	Defence(	16437	)
	Defence(	16438	)
	Defence(	16439	)
	Defence(	16453	)
	Defence(	16454	)
	Defence(	16455	)
	Defence(	16469	)
	Defence(	16470	)
	Defence(	16471	)
	Defence(	16485	)
	Defence(	16486	)
	Defence(	16487	)
	Defence(	16525	)
	Defence(	16526	)
	Defence(	16527	)
	Defence(	16517	)
	Defence(	16518	)
	Defence(	16519	)
	Defence(	16541	)
	Defence(	16542	)
	Defence(	16543	)
	Defence(	16585	)
	Defence(	16586	)
	Defence(	16587	)
	Defence(	16588	)
	Defence(	16589	)
	Defence(	16590	)
	Defence(	16595	)
	Defence(	16596	)
	Defence(	16597	)
	Defence(	16598	)
	Defence(	16599	)
	Defence(	16600	)
	Defence(	16602	)
	Defence(	16603	)
	Defence(	16604	)
	Other(	15573	)
	Other(	15557	)
	Other(	15541	)
	Other(	15485	)
	Other(	15473	)
	Other(	15477	)
	Other(	15481	)
	Other(	15460	)
	Other(	15106	)
	Other(	15407	)
	Other(	15392	)
	Other(	15218	)
	Other(	15110	)
	Other(	15114	)
	Other(	15230	)
	Other(	15234	)
	Other(	15291	)
	Other(	15319	)
	Other(	15360	)
	Other(	15376	)
	Other(	15581	)
	Other(	15597	)
	Other(	15665	)
	Other(	15525	)
	Other(	15655	)
	Other(	15730	)
	Other(	15746	)
	Other(	15949	)
	Other(	15965	)
	Other(	15974	)
	Other(	15681	)
	Other(	15792	)
	Other(	15843	)
end

-- �������� ������
function app_fillis () 

	Talk( 1, "����������� ����, �����! ������ ���������� ��������� �� ������? " )
	Text( 1, "���������� �����������! ", BuyPage)

	InitTrade()
	Weapon(	15015	)
	Weapon(	15019	)
	Weapon(	15023	)
	Weapon(	15027	)
	Weapon(	15031	)
	Weapon(	15035	)
	Weapon(	15043	)
	Weapon(	15047	)
	Weapon(	15051	)
	Weapon(	15059	)
	Weapon(	15063	)
	Weapon(	15081	)
	Weapon(	15082	)
	Weapon(	15083	)
	Weapon(	15084	)
	Weapon(	15085	)
	Weapon(	15086	)
	Weapon(	15087	)
	Weapon(	15088	)
	Weapon(	15089	)
	Weapon(	15090	)
	Weapon(	15091	)
	Weapon(	15092	)
	Weapon(	15093	)
	Weapon(	15094	)
	Weapon(	15095	)
	Weapon(	15096	)
	Weapon(	15097	)
	Weapon(	15098	)
	Weapon(	15143	)
	Weapon(	15144	)
	Weapon(	15145	)
	Weapon(	15147	)
	Weapon(	15148	)
	Weapon(	15149	)
	Weapon(	15151	)
	Weapon(	15152	)
	Weapon(	15153	)
	Weapon(	15166	)
	Weapon(	15167	)
	Weapon(	15168	)
	Weapon(	15169	)
	Weapon(	15170	)
	Weapon(	15171	)
	Weapon(	15172	)
	Weapon(	15173	)
	Weapon(	15174	)
	Weapon(	15202	)
	Weapon(	15203	)
	Weapon(	15204	)
	Weapon(	15241	)
	Weapon(	15242	)
	Weapon(	15243	)
	Weapon(	15245	)
	Weapon(	15246	)
	Weapon(	15247	)
	Weapon(	15249	)
	Weapon(	15250	)
	Weapon(	15251	)
	Weapon(	15270	)
	Weapon(	15271	)
	Weapon(	15272	)
	Weapon(	15296	)
	Weapon(	15297	)
	Weapon(	15298	)
	Weapon(	15309	)
	Weapon(	15310	)
	Weapon(	15311	)
	Weapon(	15324	)
	Weapon(	15325	)
	Weapon(	15326	)
	Weapon(	15349	)
	Weapon(	15350	)
	Weapon(	15351	)
	Weapon(	15365	)
	Weapon(	15366	)
	Weapon(	15367	)
	Weapon(	15381	)
	Weapon(	15382	)
	Weapon(	15383	)
	Weapon(	15397	)
	Weapon(	15398	)
	Weapon(	15399	)
	Weapon(	15411	)
	Weapon(	15412	)
	Weapon(	15416	)
	Weapon(	15417	)
	Weapon(	15418	)
	Weapon(	15426	)
	Weapon(	15427	)
	Weapon(	15438	)
	Weapon(	15442	)
	Weapon(	15446	)
	Weapon(	15466	)
	Weapon(	15467	)
	Defence(	15494	)
	Defence(	15495	)
	Defence(	15496	)
	Defence(	15507	)
	Defence(	15508	)
	Defence(	15509	)
	Defence(	15530	)
	Defence(	15531	)
	Defence(	15532	)
	Defence(	15546	)
	Defence(	15547	)
	Defence(	15548	)
	Defence(	15562	)
	Defence(	15563	)
	Defence(	15564	)
	Defence(	15586	)
	Defence(	15587	)
	Defence(	15588	)
	Defence(	15602	)
	Defence(	15603	)
	Defence(	15604	)
	Defence(	15660	)
	Defence(	15670	)
	Defence(	15671	)
	Defence(	15672	)
	Defence(	15686	)
	Defence(	15687	)
	Defence(	15688	)
	Defence(	15735	)
	Defence(	15736	)
	Defence(	15737	)
	Defence(	15851	)
	Defence(	15852	)
	Defence(	15853	)
	Defence(	15954	)
	Defence(	15955	)
	Defence(	15956	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15979	)
	Defence(	15980	)
	Defence(	15981	)
	Defence(	15987	)
	Defence(	15988	)
	Defence(	15989	)
	Defence(	15753	)
	Defence(	15755	)
	Other(	15142	)
	Other(	15146	)
	Other(	15150	)
	Other(	15219	)
	Other(	15244	)
	Other(	15248	)
	Other(	15295	)
	Other(	15323	)
	Other(	15364	)
	Other(	15380	)
	Other(	15396	)
	Other(	15410	)
	Other(	15464	)
	Other(	15474	)
	Other(	15478	)
	Other(	15482	)
	Other(	15484	)
	Other(	15529	)
	Other(	15545	)
	Other(	15561	)
	Other(	15585	)
	Other(	15601	)
	Other(	15659	)
	Other(	15669	)
	Other(	15685	)
	Other(	15734	)
	Other(	15850	)
	Other(	15953	)
	Other(	15965	)
	Other(	15978	)
	Other(	15986	)
	Other(	15756	)
	Other(	15760	)
	Other(	15776	)
	Other(	15843	)
	Other(	15760	)
end 

-- �������� ���
function app_ami () 

	Talk( 1, "����������� ����, �����! ������ ���������� ��������� �� ���? " )
	Text( 1, "���������� �����������! ", BuyPage)
	
	InitTrade()
	Weapon(	15016	)
	Weapon(	15020	)
	Weapon(	15024	)
	Weapon(	15028	)
	Weapon(	15032	)
	Weapon(	15036	)
	Weapon(	15044	)
	Weapon(	15048	)
	Weapon(	15052	)
	Weapon(	15060	)
	Weapon(	15064	)
	Weapon(	15068	)
	Weapon(	15132	)
	Weapon(	15133	)
	Weapon(	15135	)
	Weapon(	15136	)
	Weapon(	15137	)
	Weapon(	15139	)
	Weapon(	15140	)
	Weapon(	15141	)
	Weapon(	15175	)
	Weapon(	15176	)
	Weapon(	15177	)
	Weapon(	15179	)
	Weapon(	15180	)
	Weapon(	15181	)
	Weapon(	15183	)
	Weapon(	15184	)
	Weapon(	15185	)
	Weapon(	15187	)
	Weapon(	15188	)
	Weapon(	15189	)
	Weapon(	15191	)
	Weapon(	15192	)
	Weapon(	15193	)
	Weapon(	15198	)
	Weapon(	15199	)
	Weapon(	15200	)
	Weapon(	15253	)
	Weapon(	15254	)
	Weapon(	15255	)
	Weapon(	15257	)
	Weapon(	15258	)
	Weapon(	15259	)
	Weapon(	15261	)
	Weapon(	15262	)
	Weapon(	15263	)
	Weapon(	15273	)
	Weapon(	15274	)
	Weapon(	15275	)
	Weapon(	15300	)
	Weapon(	15301	)
	Weapon(	15302	)
	Weapon(	15312	)
	Weapon(	15313	)
	Weapon(	15314	)
	Weapon(	15328	)
	Weapon(	15329	)
	Weapon(	15330	)
	Weapon(	15353	)
	Weapon(	15354	)
	Weapon(	15355	)
	Weapon(	15369	)
	Weapon(	15370	)
	Weapon(	15371	)
	Weapon(	15385	)
	Weapon(	15386	)
	Weapon(	15387	)
	Weapon(	15401	)
	Weapon(	15402	)
	Weapon(	15403	)
	Weapon(	15414	)
	Weapon(	15415	)
	Weapon(	15419	)
	Weapon(	15420	)
	Weapon(	15421	)
	Weapon(	15429	)
	Weapon(	15430	)
	Weapon(	15431	)
	Weapon(	15439	)
	Weapon(	15443	)
	Weapon(	15447	)
	Weapon(	15469	)
	Weapon(	15470	)
	Weapon(	15471	)
	Weapon(	15498	)
	Weapon(	15499	)
	Weapon(	15500	)
	Defence(	15511	)
	Defence(	15512	)
	Defence(	15513	)
	Defence(	15517	)
	Defence(	15518	)
	Defence(	15519	)
	Defence(	15534	)
	Defence(	15535	)
	Defence(	15536	)
	Defence(	15550	)
	Defence(	15551	)
	Defence(	15552	)
	Defence(	15566	)
	Defence(	15567	)
	Defence(	15568	)
	Defence(	15590	)
	Defence(	15591	)
	Defence(	15592	)
	Defence(	15606	)
	Defence(	15607	)
	Defence(	15608	)
	Defence(	15674	)
	Defence(	15675	)
	Defence(	15676	)
	Defence(	15690	)
	Defence(	15691	)
	Defence(	15692	)
	Defence(	15739	)
	Defence(	15740	)
	Defence(	15741	)
	Defence(	15855	)
	Defence(	15856	)
	Defence(	15857	)
	Defence(	15958	)
	Defence(	15959	)
	Defence(	15960	)
	Defence(	15966	)
	Defence(	15967	)
	Defence(	15968	)
	Defence(	15987	)
	Defence(	15988	)
	Defence(	15989	)
	Defence(	15983	)
	Defence(	15984	)
	Defence(	15985	)
	Defence(	15779	)
	Defence(	15780	)
	Defence(	15781	)
	Other(	15037	)
	Other(	15038	)
	Other(	15056	)
	Other(	15069	)
	Other(	15130	)
	Other(	15131	)
	Other(	15134	)
	Other(	15138	)
	Other(	15178	)
	Other(	15182	)
	Other(	15186	)
	Other(	15190	)
	Other(	15194	)
	Other(	15201	)
	Other(	15252	)
	Other(	15256	)
	Other(	15260	)
	Other(	15299	)
	Other(	15327	)
	Other(	15352	)
	Other(	15368	)
	Other(	15384	)
	Other(	15400	)
	Other(	15413	)
	Other(	15428	)
	Other(	15468	)
	Other(	15475	)
	Other(	15479	)
	Other(	15483	)
	Other(	15487	)
	Other(	15497	)
	Other(	15510	)
	Other(	15533	)
	Other(	15549	)
	Other(	15565	)
	Other(	15589	)
	Other(	15605	)
	Other(	15673	)
	Other(	15689	)
	Other(	15738	)
	Other(	15854	)
	Other(	15957	)
	Other(	15965	)
	Other(	15982	)
	Other(	15986	)
	Other(	15766	)
	Other(	15778	)
	Other(	15843	)
end 

-- �������� ������
function app_weapon () 

	Talk( 1, "����������� ����, ��������! ������ ���������� ��������� �� ������? " )
	Text( 1, "���������� �����������! ", BuyPage)

	InitTrade()
	Weapon(	15001	)
	Weapon(	15002	)
	Weapon(	15003	)
	Weapon(	15004	)
	Weapon(	15005	)
	Weapon(	15006	)
	Weapon(	15007	)
	Weapon(	15008	)
	Weapon(	15009	)
	Weapon(	15010	)
	Weapon(	15011	)
	Weapon(	15012	)
	Weapon(	15053	)
	Weapon(	15054	)
	Weapon(	15055	)
	Weapon(	15070	)
	Weapon(	15071	)
	Weapon(	15072	)
	Weapon(	15073	)
	Weapon(	15099	)
	Weapon(	15100	)
	Weapon(	15103	)
	Weapon(	15104	)
	Weapon(	15105	)
	Weapon(	15208	)
	Weapon(	15209	)
	Weapon(	15210	)
	Weapon(	15211	)
	Weapon(	15212	)
	Weapon(	15213	)
	Weapon(	15214	)
	Weapon(	15215	)
	Weapon(	15216	)
	Weapon(	15217	)
	Weapon(	15276	)
	Weapon(	15277	)
	Weapon(	15278    )
	Weapon( 15279    )
    Defence( 15280  )
	Defence( 15281  )
	Defence( 15282  )
	Defence( 15283  )
	Defence( 15284  )
	Defence( 15285  )
	Defence( 15286  )
	Defence( 15448  )
	Defence( 15449  )
	Defence( 15450  )
	Defence( 15451  )
	Defence( 15452  )
	Defence( 15453  )
	Defence( 15454  )
	Defence( 15455  )
	Defence( 15609  )
	Defence( 15610  )
	Defence( 15611  )
	Defence( 15612  )
	Defence( 15613  )
	Defence( 15614  )
	Defence( 15615  )
	Defence( 15616  )
	Defence( 15617  )
	Defence( 15618  )
	Defence( 15619  )
	Defence( 15620  )
	Defence( 15621  )
	Defence( 15622  )
	Defence( 15625  )
	Defence( 15626  )
	Defence( 15627  )
	Defence( 15628  )
	Defence( 15629  )
	Defence( 15630  )
	Defence( 15631  )
	Defence( 15632  )
	Defence( 15633  )
	Defence( 15634  )
	Defence( 15635  )
	Defence( 15636  )
	Defence( 15637  )
	Other( 15638  )
	Other( 15639  )
	Other( 15640  )
	Other( 15641  )
	Other( 15642  )
	Other( 15643  )
	Other( 15696  )
	Other( 15697  )
	Other( 15990  )
	Other( 15991  )
end

-- ��������� �������
function Pirat_guilds ()
	Talk( 1, "����������� ����, �����! ������� ������ � ��������� ��������? �������, ��� ���� ����������: ")
	InitTrigger()
	TriggerCondition( 1, IsGuildType, 1 )
	TriggerAction( 1, ListAllGuild, 1 )
	TriggerCondition( 2, IsGuildType, 0 )
	TriggerAction( 2, JumpPage, 3 )
	TriggerCondition( 3, NoGuild )
	TriggerAction( 3, ListAllGuild, 1 )
	TriggerFailure( 3, JumpPage, 4 )
	Text( 1, "���������� ��������� �������! ", MultiTrigger, GetMultiTrigger(), 3)
	Text( 1, "������� ��������� ������� ",JumpPage, 2 )
	
	Talk( 2, "����� ������� ��������� �������, ��� �����:_1. ������ ������ - 1��;_2. ������ - 100 ���������. " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, CreateGuild, 1 )
	TriggerFailure( 1, JumpPage, 3 )
	Text( 2, "������� ��������� �������! ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3, "� �� ����� ������� �����! ������� ��� ����! ")
	
	Talk( 4, "�� ��������� ���� ��������! ����� ������� ��������� �������, ��� �����:_1. ������ ������ - 1��;_2. ������ - 100 ���������. " )
end

--�������� �������
function Flot_Guilds ()
	Talk( 1, "����������� ����, �����! ������� ������ � �������� ��������? �������, ��� ���� ����������: ")
	
	InitTrigger()
	TriggerCondition( 1, IsGuildType, 0 )
	TriggerAction( 1, ListAllGuild, 0 )
	TriggerCondition( 2, IsGuildType, 1 )
	TriggerAction( 2, JumpPage, 3 )
	TriggerCondition( 3, NoGuild )
	TriggerAction( 3, ListAllGuild, 0 )
	TriggerFailure( 3, JumpPage, 3 )
	Text( 1, "���������� �������� �������! ", MultiTrigger, GetMultiTrigger(), 3)
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerCondition( 1, HasItem, 1780, 1 )
	TriggerCondition( 1, NoGuild )
	TriggerAction( 1, CreateGuild, 0 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "������� �������� �������! ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 2,  "�� ��������� ���� ��������! ����� ������� �������� �������, ��� �����:_1. ������ ������ - 1��;_2. ������ - 100 ���������." )

	Talk( 3, "�� �� ������������ � �����. � �� ���� ������ ��� ������� ����������! ")
end
function r_NewbieCouch ()
	Talk( 1,  "����������� ����, �����! ����� ���������� �� ��� ������, ��� ����� �������� � ��������� ���������� ������������ ������ ������ " )
	Text( 1,  "�������� ������ ������ ", JumpPage, 2)

	Talk( 2,  "���������: ����� �������� ������ ������ �� ������ ���� 25 ������ � ��������� 50000 ������. ������ ������ ���������� ��� ���� ������ � ��������� � ���. ����� ��������� �� ������ ����� ����������. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	AddNpcMission ( 711 )
	AddNpcMission ( 200 )
	AddNpcMission ( 920 ) --������� �������
	AddNpcMission ( 921 )--����
end 

-- ������������� �����
function r_chaoss()
	Talk( 1,  "������������� �����: � ��� �������� ���� ����������, � ���� ���������� �������� ��������. " )
	Text( 1,  "���������� ��� ����� ", Garner2GetWiner)
	Text( 1,  "����� � ��� ����� ", Garner2RequestReorder)
	
	AddNpcMission (2027 )
	
end




------------------------------------------------------------
-- ͨ�þ������ű�
------------------------------------------------------------

function r_talk87 ()

	Talk( 1,  "������������� �����: ������! � ������������� �����! �� ������� ����������� ���� ���� � ������� ����� ������ �������? " )	
	Text( 1,  "�������� ������ ������ ", JumpPage, 2)
	--Text( 1,  "����� ����� ", JumpPage, 3)
	Text( 1,  "�������� ���� ������ ������ ", JumpPage, 3)
	Text( 1,  "�������� ����� ����������� ", SetSpawnPos,  "Arenaa")

	Talk( 2,  "������������� �����: ����� �������� ������ ������ �� ������ ���� 25 ������ � ��������� 50000 ������. ������ ������ ���������� ��� ���� ������ � ��������� � ���. ����� ��������� �� ������ ����� ����������. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 4 )
	Text( 2,  "�������� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "������������� �����: ��� ������������� ���������� ����� �� ������ �������� ���� ���� ������ ������ �� ���� �����. ��������� 1 ���� ����� ����� 10 ����� ������ ������ � 500 ������. " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 10 )
	TriggerCondition( 1, HasMoney, 500 )
	TriggerAction( 1, TakeMoney, 500 )
	TriggerAction( 1, TakeOffer, 10 )
	TriggerAction( 1, AddCredit, 1 )
	TriggerFailure( 1, JumpPage, 5 )
	Text( 3,  "�������� 10 ����� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 50 )
	TriggerCondition( 1, HasMoney, 2500 )
	TriggerAction( 1, TakeMoney, 2500 )
	TriggerAction( 1, TakeOffer, 50 )
	TriggerAction( 1, AddCredit, 5 )
	TriggerFailure( 1, JumpPage, 11 )
	Text( 3,  "�������� 50 ����� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 100 )
	TriggerCondition( 1, HasMoney, 5000 )
	TriggerAction( 1, TakeMoney, 5000 )
	TriggerAction( 1, TakeOffer, 100 )
	TriggerAction( 1, AddCredit, 10 )
	TriggerFailure( 1, JumpPage, 12 )
	Text( 3,  "�������� 100 ����� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)
	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, LessCredit,  "< ", 0 )
	TriggerCondition( 1, HasOffer, 300 )
	TriggerCondition( 1, HasMoney, 15000 )
	TriggerAction( 1, TakeMoney, 15000 )
	TriggerAction( 1, TakeOffer, 300 )
	TriggerAction( 1, AddCredit, 30 )
	TriggerFailure( 1, JumpPage, 13 )
	Text( 3,  "�������� 300 ����� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 4,  "������������� �����: �������� �� �� �� ��������� �� ����������. ����� �������� � ��� ��� ���� ������ ������. " )

	Talk( 5,  "������������� �����: ��� ������ ����� ������ ������ �� ������ ����� ������������� �����, ����� ���� ��������� 10 ����� ������ ������ � 500 ������ �� ������ ���� �����. " )

	Talk( 6,  "������������� �����: Regarding Honor system as followed " )
	Text( 6,  "Regarding Battle Count ", JumpPage, 7)
	Text( 6,  "Regarding Challenge Honor ", JumpPage, 8)
	Text( 6,  "Regarding Victory Honor ", JumpPage, 9)
	Text( 6,  "Regarding Escape Penalty ", JumpPage, 10)

	Talk( 7,  "������������� �����: Each battle will increase battle count by 1 " )

	Talk( 8,  "������������� �����: Each kill will increase Kill count by 1 and 1 Honor point (Opponent lower by 10 levels will not have any Honor. Those higher by 10 levels will earn a bonus 1 Honor). Vice versa for those defeated in challenge. " )

	Talk( 9,  "������������� �����: Each victory to the party will increase victory count by 1 and gain Honor points according to the differences between the average level of the two parties. " )

	Talk( 10,  "������������� �����: Each time a party escape or quit battle, System will deduct Honor points according to the average level of both party and an additional of 2 Honor points per person. The other party will gain Honor points based on those lost by the party. " )

	Talk( 11,  "������������� �����: Hi! To exchange 50 Party Contribution points for 5 Honor points, you will need to have 50 Party Contribution points, 2500G and a negative Honor value. " )

	Talk( 12,  "������������� �����: Hi, 100 Party Contribution points can be exchanged for 10 Honor points. You also need to pay 5000G and have a negative Honor point value in order to exchange. " )

	Talk( 13,  "������������� �����: Hi, exchanging 300 Party Contribution points for 30 Honor points requires 300 Party Contribution points, 15000G and negative Honor points " )

end



------------------------------------------------------------
-- �����ǡ���Ѳ�߱������˹
------------------------------------------------------------

function r_talk88 ()

	Talk( 1,  "�������: ������, � ����� �������. ������ ������� ���������� ����� ���������, � ������� ���������� ���� �� �������. �� �� ������ � ���� ��������� �������� �����. ��� ������ ��� ���������� ��� ��������? " )

	Talk( 2,  "Marcusa: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). Explorer look for Little Daniel at (2193, 2730). You can reach Icicle or Shaitan by using the teleporter. " )


	---------------------��ҳ���9��
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 730 )
	--AddNpcMission ( 736 )
	--AddNpcMission ( 737 )
	AddNpcMission ( 400 )
	AddNpcMission ( 52 )
	AddNpcMission ( 53 )
	AddNpcMission ( 54 )

	MisListPage(2)

end

------------------------------------------------------------
-- ɳᰳǡ���Ѳ�߱�������
------------------------------------------------------------

function r_talk89 ()

	Talk( 1,  "�����: ������, � ���������� ��������� � ������. ������ ���������, ��������� �������� ������! " )
	
	Talk( 2,  "Michael: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Icicle or Argent by using the teleporter. " )

	---------------------��ҳ���9��
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 731 )
	--AddNpcMission ( 740 )
	--AddNpcMission ( 741 )
	AddNpcMission ( 235 )
	AddNpcMission ( 236 )
	AddNpcMission ( 241 )
	AddNpcMission ( 242 )
	AddNpcMission 	(412)
	AddNpcMission 	(85)
	AddNpcMission 	(86)
	AddNpcMission 	(87)
	AddNpcMission 	(922)--------------------------------------------
	AddNpcMission 	(923)
	AddNpcMission 	(924)------------


	MisListPage(2)

end

------------------------------------------------------------
-- ���Ǳ�����Ѳ�߱���СĪ
------------------------------------------------------------

function r_talk90 ()

	Talk( 1,  "����� ��: � ���������� ��������� � ��� ������ ������� ����. � ��� ��� � ����� ��� ���� ������ ����� ������? ����� � ������ ������ ��� ���... " )

	Talk( 2,  "Little Mo: Very well! You have progressed to Lv 9. You can choose your class at Lv 10. Go now to the related NPC to start your trial for the class you wish to become. Swordsman look for Peter in Argent City at (2192, 2767). Herbalist look for High Priest - Gannon in Shaitan City at (862, 3500). Hunter look for Swordsman - Ray in Icicle Castle at (1365, 570). You can reach Icicle or Shaitan by using the teleporter. " )

	---------------------��ҳ���9��
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 8 )
	TriggerCondition( 1, LvCheck,  "< ", 10 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	Start( GetMultiTrigger(), 1 )

	--AddNpcMission ( 732 )
	--AddNpcMission ( 742 )
	--AddNpcMission ( 743 )
	AddNpcMission ( 255 )
	AddNpcMission ( 256 )
	AddNpcMission 	(408)
	AddNpcMission 	(164)
	AddNpcMission 	(165)
	AddNpcMission 	(166)
	AddNpcMission 	(177)
	AddNpcMission 	(178)
	AddNpcMission 	(179)


	MisListPage(2)

end

------------------------------------------------------------
-- ɳᰳǡ���ҩ�����ˡ�ɳ����
------------------------------------------------------------

function r_talk91 ()

	Talk( 1,  "����: ������! � �������� �������! � ���� ���� ��� �� ������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )
	
	Talk( 2,  "Shala: Very good. You have advanced to Lv9. You can select a class at Lv 10. Now is the time for you to make a decision. Look for Peter in Argent City at (2192, 2767) if you want to become a Swordsman. Look for High Priest - Gannon in Shaitan City at (862, 3500) to be a Herbalist. To be a Hunter, look for Swordsman Ray in Icicle City at (1365, 570). As the journey to Argent and Icicle is too far, look for the Teleporter to teleport you there in an instant. " )
	Text( 2,  "���� ", BuyPage )
	Text( 2,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	Other(	3143	)
	--Leo
	Other(	1576	)
	Other(	4049	)
	Other(	4050	)
	Other(	1578	)
	Other(	4060	)
	Other(	4055	)
	Other(	4061	)
	Other(	2225	)
	Other(	4057	)
	Other(	1768	)


	---------------------��ҳ���9��
	--InitTrigger()
	--TriggerCondition( 1, LvCheck,  "> ", 8 )
	--TriggerCondition( 1, LvCheck,  "< ", 10 )
	--TriggerAction( 1, JumpPage, 2 )
	--TriggerFailure( 1, JumpPage, 1 )
	--Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 717 )
	--AddNpcMission ( 734 )
	--AddNpcMission ( 744 )
	--AddNpcMission ( 745 )

	MisListPage(2)

end 

------------------------------------------------------------
--�����ӵ�ѩԭ    ����ҽ������������
------------------------------------------------------------

function r_talk92 ()

	Talk( 1,  "����: ������! � ������� ������! ��� ����� ����� ������ �����? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission(	471	)
	AddNpcMission(	472	)
	AddNpcMission	(753)
	
end

------------------------------------------------------------
-- ����ɭ�֡�������ҽ��������ϣ��
------------------------------------------------------------

function r_talk93 ()

	Talk( 1,  "��������: ������! � ������� ������! ��� ��� ����������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission(	1442	)
	AddNpcMission (	1900	)

	---------------����
	AddNpcMission	(5567)
	AddNpcMission	(5568)
--	AddNpcMission ( 6052 )
--	AddNpcMission ( 6053 )
	


	
end

------------------------------------------------------------
-- �¶�άƽԭ-----����
------------------------------------------------------------

function r_talk94 ()

	Talk( 1,  "�����: �������� �� ������� ��� � �����������, �� � ���� ���� ������������ �������. � ��� ������� ���? " )

end

------------------------------------------------------------
-- ��������վ-----���϶�
------------------------------------------------------------

function r_talk95 ()

	Talk( 1,  "������: ��� ����� ���� ����� �������� ������ ����, ����� ��������� �� � ������� �������. ��� ��� ��� ��������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
		
	AddNpcMission	(1065)
	AddNpcMission	(	869	)
	AddNpcMission	(	872	)
	AddNpcMission	(	874	)
	AddNpcMission	(	878	)
	AddNpcMission	(	886	)
	AddNpcMission	(	889	)
	AddNpcMission	(	470	)
	AddNpcMission(	1738	)
	AddNpcMission (	1927	)
	AddNpcMission (	1948	)

	------------------����
	--AddNpcMission (5504	)



end

------------------------------------------------------------
-- �¶�άƽԭ-----ϯ��
------------------------------------------------------------

function r_talk96 ()

	Talk( 1,  "�������: ��� � ������ ������� ��� � ���� � ������� �����. ���� " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----������
------------------------------------------------------------


------------------------------------------------------------
-- �¶�άƽԭ-----����
------------------------------------------------------------

function r_talk98 ()

	Talk( 1,  "����: ��� ���� �����! � � ���� ������������� � ����� � ���� �������. " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----³³
------------------------------------------------------------

function r_talk99 ()

	Talk( 1,  "����: ����. �� ������ �������� ���? " )

	AddNpcMission(	1736	)
	AddNpcMission (	1925	)
	AddNpcMission (	1946	)

	---------------����
	AddNpcMission	(5561)
	AddNpcMission	(5562)
--	AddNpcMission ( 6040 )
--	AddNpcMission ( 6041 )



end

------------------------------------------------------------
-- �¶�άƽԭ-----�µ�˹.����
------------------------------------------------------------

function r_talk100()

	Talk( 1,  "�������: � ��� ����... �� ��� �� ����� ���� ���������� �� ������ ������� � ������� ������������� ����������. " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----÷��
------------------------------------------------------------

function r_talk101()

	Talk( 1,  "�������: ���� ������ ���������� �������, �� �������� �����. " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----�Ų���
------------------------------------------------------------

function r_talk102()

	Talk( 1,  "�����: � ������� ������ �����-����������. ������ � ������ ��� ��� ��������� � �������. " )

	AddNpcMission 	(603)
	AddNpcMission 	(608)
	AddNpcMission 	(613)
	AddNpcMission 	(615)
	AddNpcMission 	(618)


end

------------------------------------------------------------
-- �¶�άƽԭ-----С���ɭ
------------------------------------------------------------

function r_talk103()

	Talk( 1,  "��������� ����: ���� ��������� ��� ������������� � ������������. �� �������� ���� ��������? " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----�꼧����
------------------------------------------------------------

function r_talk104()

	Talk( 1,  "������� ����: � ����� ������ ������������ ����� � ������� ����� ������ �������. ��� ���������� ���������� ���� ������� �����. " )

end

------------------------------------------------------------
-- �¶�άƽԭ-----��������
------------------------------------------------------------

function r_talk105()

	Talk( 1,  "�����: ���������� ������? � ������� �������� ����� ���� � �����! ��� ������� 4 ������ � 108 ����. " )

	AddNpcMission 	(451)
	AddNpcMission 	(457)
	AddNpcMission 	(621)
	AddNpcMission 	(625)
	AddNpcMission(	1590	)
	AddNpcMission (	1902	)
	AddNpcMission (	1940	)

	




end

------------------------------------------------------------
-- �¶�άƽԭ-----��������
------------------------------------------------------------

function r_talk106()

	Talk( 1,  "����� ����: ������ ������ ������ ��� ������ �����? � ���������? � ���� ��� ������... " )

	AddNpcMission 	(689)
	AddNpcMission	(1109)
	AddNpcMission(	1579	)
	AddNpcMission (	1918	)





end

------------------------------------------------------------
-- �¶�άƽԭ-----�����˹
------------------------------------------------------------

function r_talk107()

	Talk( 1,  "�����������: ����� �������! ��� ������ �� �� �������� � ��� ������? " )
	AddNpcMission 	(425)
	AddNpcMission 	(431)
	AddNpcMission 	(436)
	AddNpcMission 	(442)
	AddNpcMission 	(448)
	AddNpcMission 	(601)
	AddNpcMission 	(607)
	AddNpcMission 	(610)
	AddNpcMission 	(612)
	AddNpcMission	(1001)
	AddNpcMission	(1165)



end

------------------------------------------------------------
-- �¶�άƽԭ-----�Ͽ��ɭ
------------------------------------------------------------

function r_talk108()

	Talk( 1,  "������ ����: � ���� ������ ���� � ������ ����� �� ����������� ������ � ��������� � �����������. " )

	AddNpcMission	(475)

end

------------------------------------------------------------
-- �¶�άƽԭ-----�����б�
------------------------------------------------------------

function r_talk109()

	Talk( 1,  "�����, ������! ��� ������� �������." )

end

------------------------------------------------------------
-- ���˻�Į-----��������˹
------------------------------------------------------------

function r_talk110()

	Talk( 1,  "�������: ��� ����� ��������, ������ ������� �� ������ ����� �� ����� �������. ��� ���������. " )

	AddNpcMission 	(411)
	AddNpcMission 	(669)
	AddNpcMission 	(675)
	AddNpcMission 	(678)
	AddNpcMission 	(680)
	AddNpcMission	(1075)



end

------------------------------------------------------------
-- ���˻�Į-----�׶�����
------------------------------------------------------------

function r_talk111()

	Talk( 1,  "�������: ������! ��� ������ �������� ���� ����. � �� ���� ��������� ���� �� ���� ������ ���� ��� ��������. " )


end

------------------------------------------------------------
-- ���˻�Į-----�¸�ɭ
------------------------------------------------------------

function r_talk112()

	Talk( 1,  "��������: ���� ����� ����� � ������ ������ �������� �����������. " )

	AddNpcMission	(1111)


end

------------------------------------------------------------
-- ���˻�Į-----�����ǡ��Ʒ�
------------------------------------------------------------

function r_talk113()

	Talk( 1,  "������: ������! � ������!. " )
	AddNpcMission	(1131)

end

------------------------------------------------------------
-- ���˻�Į-----�ϵ�����
------------------------------------------------------------

function r_talk114()

	Talk( 1,  "������: ����������������! ������� ���������� � �������� �����! " )

	AddNpcMission 	(640)
	AddNpcMission 	(644)
	AddNpcMission 	(645)
	AddNpcMission 	(646)
	AddNpcMission 	(651)
	AddNpcMission	(1119)
	AddNpcMission(	1437	)
	AddNpcMission (	1911	)
--	AddNpcMission ( 6038 )
--	AddNpcMission ( 6039 )

	





end

------------------------------------------------------------
-- ���˻�Į-----�������˹
------------------------------------------------------------

function r_talk115()

	Talk( 1,  "����� �����: � �������� � ������� ���������� ������. �� ��� ��� � ���� ��� ���, �� � �������� � �����, � �������� ���� ������� ���������� ������. " )
	AddNpcMission	(1120)


end

------------------------------------------------------------
-- ���˻�Į-----÷�����ǡ�è��
------------------------------------------------------------

function r_talk116()

	Talk( 1,  "�����: ������ �� ��� ��������? �� ������� �� ������ �����-������?               �� ��,� ���,������ ����� � ����������   1000 � ���� �������� ����� ��������! " )
	
	AddNpcMission	(2023)

end

------------------------------------------------------------
-- ���˻�Į-----�ŵ����ˡ���ǽ
------------------------------------------------------------

function r_talk117()

	Talk( 1,  "�����: ��� ������ ��� � ������� ������� ��������? � �� ������� ������� �������, ������ � ��� �� ������ � ������ �����. " )

end

------------------------------------------------------------
-- ���˻�Į-----����˹����ɳ
------------------------------------------------------------

function r_talk118()

	Talk( 1,  "��������: � �� ����� ����� ���� ������. " )
	
	AddNpcMission ( 257 )
	AddNpcMission ( 258 )
	AddNpcMission ( 259 )
	AddNpcMission 	(435)
	AddNpcMission 	(686)
	AddNpcMission 	(691)
	AddNpcMission 	(693)
	AddNpcMission 	(694)
	AddNpcMission	(1082)



end

------------------------------------------------------------
-- ���˻�Į-----ͨ���ߡ��¹���
------------------------------------------------------------

function r_talk119()

	Talk( 1,  "������ ������� �����: � ���� ������ ��, ��� ������ �� �����. " )

	AddNpcMission 	(804)
	AddNpcMission 	(808)
	
	AddNpcMission	(	468	)
	AddNpcMission(	1586	)
	AddNpcMission (	1920	)

	
---------------����
	AddNpcMission	(5585)
	AddNpcMission	(5586)



end

------------------------------------------------------------
-- ���˻�Į-----������˹�����
------------------------------------------------------------

function r_talk120()

	Talk( 1,  "���������: � �� ������� ������� ��������� ������� ��� ���������� ����������. ��� �������� ���� �����. " )

	AddNpcMission 	(407)
	AddNpcMission 	(638)
	AddNpcMission 	(642)
	AddNpcMission(	1438	)
	AddNpcMission (	1912	)

	



end

------------------------------------------------------------
-- ���˻�Į-----���ﰬ�ǡ�����
------------------------------------------------------------

function r_talk121()

	Talk( 1,  "�����: �, ��� ��? ��� ����... � ������ ��� �����? " )

	
	AddNpcMission	(	870	)
	AddNpcMission	(	875	)
	AddNpcMission	(	876	)
	AddNpcMission	(	880	)
	AddNpcMission	(	882	)
	AddNpcMission	(	885	)
	AddNpcMission	(	888	)
	AddNpcMission	(	891	)
	AddNpcMission	(	892	)
	AddNpcMission(	1735	)
	AddNpcMission (	1924	)
	AddNpcMission (	1945	)

	


end

------------------------------------------------------------
-- ���˻�Į-----��������
------------------------------------------------------------

function r_talk122()

	Talk( 1,  "�����: ������ �������� ��� ������������ ����. ������ ������ �� ������� ����. " )

	AddNpcMission 	(428)
	AddNpcMission 	(812)
	AddNpcMission	(1025)
	AddNpcMission	(1188)


end

------------------------------------------------------------
-- ���˻�Į-----����
------------------------------------------------------------

function r_talk123()

	Talk( 1,  "���: � ���� ���� ���� �� ����� ���. ������ � ����� ����������. " )

end

------------------------------------------------------------
-- ���˻�Į-----��ķ
------------------------------------------------------------

function r_talk124()

	Talk( 1,  "���: � ���� ���� ���� �� ����� ���. ������ � ����� ����������. " )

end

------------------------------------------------------------
-- ���˻�Į-----����������΢��
------------------------------------------------------------

function r_talk125()

	Talk( 1,  "���������� ����: ������ ��� �����, �� ��� �� ����... " )

end

------------------------------------------------------------
-- ���˻�Į-----ޱ���
------------------------------------------------------------

function r_talk126()

	Talk( 1,  "�����: �� ������ ������� �� �������� ��� � ������, �� ������ ������� �� �������� ��� � ������, � ������� ������� �� �������� ��� � ����� �� ������. ������ ������ �������� ��. " )

	AddNpcMission 	(685)
	AddNpcMission 	(688)
	AddNpcMission 	(690)
	AddNpcMission	(1097)
--	AddNpcMission ( 6034 )
--	AddNpcMission ( 6035 )


end
------------------------------------------------------------
-- ���˻�Į-----����������
------------------------------------------------------------
function r_talk127()
Talk( 1,  "������� ����. ������� �������, �������������� ���� �� ������! " )
	
	InitTrigger()
	TriggerCondition( 1, HasRecord, 1557 )
	TriggerCondition( 1, NoRecord, 1558 )
	TriggerCondition( 1, NoRecord, 1559 )
	TriggerCondition( 1, NoRecord, 1560 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "������!! ",MultiTrigger, GetMultiTrigger(), 1 )


	InitTrigger()
	TriggerCondition( 1, HasMission, 1561 )
	TriggerCondition( 1, HasRecord, 1558 )
	TriggerCondition( 1, HasRecord, 1559 )
	TriggerCondition( 1, NoRecord, 1569 )
	TriggerCondition( 1, NoRecord, 1561 )
	TriggerAction( 1, JumpPage, 6 )
	TriggerFailure( 1, JumpPage, 3)
	Text( 1,  "������ �����! ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 1,  "� ������ �������� ���� ",JumpPage, 3  )
	
	InitTrigger()
	TriggerAction( 1, SetRecord, 1558 )
	TriggerAction( 1, SetRecord, 1559 )
	TriggerAction( 1, JumpPage, 4 )
	Talk( 2,  "������� ����: ��� ��������� ������ - ���� ��� ������? ")
	Text(2,  "������ ", MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerAction( 1, SetRecord, 1558 )
	TriggerAction( 1, SetRecord, 1560 )
	TriggerAction( 1, JumpPage, 5 )
	Text(2,  "���� ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk( 3,  "������� ����: ������� �������, � ����� ������. ���� ��� ������ �������, �� ���������� ��������! ")
	Talk( 10,  "������� ����: ������� �������, �� �������� �����������! ��������� ����� ������ ��� ���������. ")

	Talk( 4,  "������� ����: ����������! �� �����! ")

	Talk( 5,  "������� ����: ����� �� ���� ��������� ������ ��������? ")
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1563 )
	TriggerAction( 1, JumpPage, 7 )
	Talk( 6,  "������� ����: ������ � �������� ���������� � �����. ��� �������? ")
	Text( 6,  "�������� ",MultiTrigger, GetMultiTrigger(), 1 )
	Text( 6,  "������ ",JumpPage, 10  )

	Talk( 7,  "������� ����: ������� �������� �������. ���� ��������, ������� �������� �������� ������� �����. ")
	Text( 7,  "��������� ������ ",JumpPage, 8  )
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1564 )
	TriggerAction( 1, JumpPage, 9 )
	Talk( 8,  "������� ����: � ����� ���������� ������ � �������� � ��������� �����. ��� �������? ")
	Text( 8,  "�������� � ��������� ����� ",MultiTrigger, GetMultiTrigger(), 1 )
	

	InitTrigger()
	TriggerAction( 1, SetRecord, 1562 )
	TriggerAction( 1, SetRecord, 1565 )
	TriggerAction( 1, JumpPage, 9 )
	Text( 8,  "������ ",MultiTrigger, GetMultiTrigger(), 1  )

	Talk( 9,  "������� ����: ������ �� �������, ������ ��� �������� � ��������� ����� ��������� ������! ")
	--Start( GetMultiTrigger(), 1 )
	AddNpcMission 	(417)
	AddNpcMission 	(674)
	AddNpcMission 	(676)
	AddNpcMission 	(681)
	AddNpcMission	(1064)
	AddNpcMission	(752)

	
	------------------1.7
	AddNpcMission (5153 )
	AddNpcMission (5154 )
	AddNpcMission (5155 )
	AddNpcMission (5156 )
	AddNpcMission (5157 )
	AddNpcMission (5159 )
	end

------------------------------------------------------------
-- ���˻�Į-----�ޱ�˹������
------------------------------------------------------------

function r_talk128()

	Talk( 1,  "�����: ����� � ��� ��������� ��� ���� ����� ���� � ��� ������ � ������ �� ����. � ����� �� ������� �����. " )

end

------------------------------------------------------------
-- ���˻�Į-----��á�Ƥ��
------------------------------------------------------------

function r_talk129()

	Talk( 1,  "��� ���: ��... ��� ��? �� ����� ����? " )

	AddNpcMission 	(623)
	AddNpcMission 	(627)
	AddNpcMission 	(634)
	AddNpcMission	(1031)
	AddNpcMission	(1194)
	AddNpcMission(	1591	)
	AddNpcMission (	1905	)
	AddNpcMission (	1941	)

	---------------����
	AddNpcMission	(5583)
	AddNpcMission	(5584)



end

------------------------------------------------------------
-- ������˹��ԭ-----���򡤱�Ȫ
------------------------------------------------------------

function r_talk130()

	Talk( 1,  "���: ��� ��� ��������� � ������. �� ��� ������? " )
---------------����
	AddNpcMission	(5581)
	AddNpcMission	(5582)
end

------------------------------------------------------------
-- ������˹��ԭ-----��˹��С��
------------------------------------------------------------

function r_talk131()

	Talk( 1,  "�����: ��� ���� ���� �������� ��������� ����������. �� � �� ���� ���������� ��������� ��������. " )

end

------------------------------------------------------------
-- ������˹��ԭ-----���׶�����
------------------------------------------------------------

function r_talk132()

	Talk( 1,  "����: ���� ���� ���� " )
	AddNpcMission	(1061)
	AddNpcMission	(1007)
	AddNpcMission	(1062)
	AddNpcMission	(1117)
	AddNpcMission	(1171)


end

------------------------------------------------------------
-- ������˹��ԭ-----����ķ������
------------------------------------------------------------

function r_talk133()

	Talk( 1,  "������: �� ������� � ������������ ������� ��������? � ��� ��� ��� ����� ���. " )

end

------------------------------------------------------------
-- ������˹��ԭ-----������ķ
------------------------------------------------------------

function r_talk134()

	Talk( 1,  "�����: �� 3 ��� ������ � �� ���� ������. � ���������? " )
	AddNpcMission	(1083)

end

------------------------------------------------------------
-- ������˹��ԭ-----������ķ
------------------------------------------------------------

function r_talk135()

	Talk( 1,  "������: ���� �� �� �������� ��� ������ ��� ������������ ������, �� ����� �� �������� �� ����. " )
	AddNpcMission	(1098)

end


------------------------------------------------------------
-- ������˹��ԭ-----������
------------------------------------------------------------

function r_talk136()

	Talk( 1,  "�����: � ��������� ������� ���� �� ����������. ���� � �������, �� ������ �� ���������. " )

	AddNpcMission ( 262 )
	AddNpcMission ( 263 )
	AddNpcMission ( 264 )
	AddNpcMission ( 265 )
	AddNpcMission	(1056)


end

------------------------------------------------------------
-- ������˹��ԭ-----�ն����
------------------------------------------------------------

function r_talk137()

	Talk( 1,  "������: ������... ����� ����� ������... " )
	AddNpcMission	(1072)

end

------------------------------------------------------------
-- ������˹��ԭ-----Լɪ����
------------------------------------------------------------

function r_talk138()

	Talk( 1,  "���: � �������� ���������. ��� ������ ���������� ������ ���������. " )
	AddNpcMission	(1105)

end

------------------------------------------------------------
-- ������˹��ԭ-----��ݮ����
------------------------------------------------------------

function r_talk139()

	Talk( 1,  "����������: �� ������ ��� ������� �������? ��� ����� ������� � ������. " )
---------------����
	AddNpcMission	(5555)
	AddNpcMission	(5556)
end

------------------------------------------------------------
-- ������˹��ԭ-----����
------------------------------------------------------------

function r_talk140()

	Talk( 1,  "���: ������, � ���. ��� �� ����� �������? " )

end

------------------------------------------------------------
-- ������˹��ԭ-----��ɺ��
------------------------------------------------------------

function r_talk141()

	Talk( 1,  "�������: � ��� ���. ����� ��������� ��� ������. " )

end

------------------------------------------------------------
-- ������˹��ԭ-----��ŵ��
------------------------------------------------------------

function r_talk142()

	Talk( 1,  "�������: � ������������ � ���� ��� ��� ���������. ��������� ���� ��� �������� ��� ��������? " )

end

------------------------------------------------------------
-- ������˹��ԭ-----ղķ˹
------------------------------------------------------------

function r_talk143()

	Talk( 1,  "��������: � ������ ��� � ���� ���� ��������� �������. " )

end

------------------------------------------------------------
-- ������˹��ԭ-----¶��������
------------------------------------------------------------

function r_talk144()

	Talk( 1,  "����: ������ ����������! " )

end

------------------------------------------------------------
-- ������˹��ԭ-----�������
------------------------------------------------------------

function r_talk145()

	Talk( 1,  "�������: � ������ ����������� ������ ��������. ������ � �������� ��� ������� ��� � ��� ���� ��������� �������. " )

end

------------------------------------------------------------
-- ������˹��ԭ-----��������
------------------------------------------------------------

function r_talk146()

	Talk( 1,  "��������� �����: ������� � �������� ������� � ����. ������ ����� ������� ��� ��� ����� ����� �������������� ��������. " )

	AddNpcMission 	(622)
	AddNpcMission 	(624)
	AddNpcMission 	(628)
	AddNpcMission 	(630)
	AddNpcMission 	(636)
	AddNpcMission	(1006)
	AddNpcMission	(1170)
	AddNpcMission(	1592	)
	AddNpcMission (	1906	)
	AddNpcMission (	1942	)
--	AddNpcMission ( 6036 )
--	AddNpcMission ( 6037 )

	



end

------------------------------------------------------------
-- ������˹��ԭ-----����
------------------------------------------------------------

function r_talk147()

	Talk( 1,  "�����: ��� ��� ����� �����! ����� �����, ����� ����... � ���������� � ���� ����� �����. " )

	AddNpcMission ( 401 )
	AddNpcMission 	(810)
	AddNpcMission	(1040)
	AddNpcMission	(1203)
	AddNpcMission(	1433	)
	AddNpcMission (	1909	)

	
---------------����
	AddNpcMission	(5579)
	AddNpcMission	(5580)





end

------------------------------------------------------------
-- ������˹��ԭ-----������
------------------------------------------------------------

function r_talk148()

	Talk( 1,  "�����: ������, � ����� ������ ��� ��� ����. � ��? " )

end

------------------------------------------------------------
-- ������˹��ԭ-----��Ъ��÷�ַ�
------------------------------------------------------------

function r_talk149()

	Talk( 1,  "������ ����: ��� ������ ��� �������... " )

end

------------------------------------------------------------
-- ���Ǳ�-----ˮ�֡����ϼ�
------------------------------------------------------------

function r_talk156()

	Talk( 1,  "����: ������! � ������ ����� � ������! ���������� � ���� ������? " )

end

------------------------------------------------------------
-- ���￩������վ-----����
------------------------------------------------------------

function r_talk157()

	Talk( 1,  "������: � ������ ���� ���� � �� � �����. ��� ������� ��� �������. " )

	AddNpcMission 	(419)
	AddNpcMission 	(460)
	AddNpcMission 	(600)
	AddNpcMission 	(604)
	AddNpcMission 	(606)
	AddNpcMission 	(611)
	AddNpcMission 	(614)
	AddNpcMission 	(619)
	AddNpcMission	(1028)
	AddNpcMission	(1191)
	AddNpcMission(	1434	)
	AddNpcMission (	1903	)

	---------------����
	AddNpcMission	(5587)
	AddNpcMission	(5588)

--	AddNpcMission ( 6042 )
--	AddNpcMission ( 6043 )


end

------------------------------------------------------------
-- ���￩������վ-----������
------------------------------------------------------------

function r_talk158()

	Talk( 1,  "�����: ��� �� ������ ������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(450)
	AddNpcMission 	(452)
	AddNpcMission 	(602)
	AddNpcMission 	(605)
	AddNpcMission 	(609)
	AddNpcMission 	(616)
	AddNpcMission 	(617)
	AddNpcMission(	1435	)
	AddNpcMission (	1904	)

	



	
end

------------------------------------------------------------
-- �߶�ŵ����վ-----����˹
------------------------------------------------------------

function r_talk159()

	Talk( 1,  "���������: ������� � �������, ����� ����. " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	
	AddNpcMission 	(463)
	AddNpcMission 	(620)
	AddNpcMission 	(626)
	AddNpcMission 	(629)
	AddNpcMission 	(631)
	AddNpcMission 	(632)
	AddNpcMission 	(633)
	AddNpcMission 	(635)
	AddNpcMission 	(637)
	AddNpcMission	(1015)
	AddNpcMission	(1178)
	AddNpcMission(	1593	)
	AddNpcMission (	1907	)
	AddNpcMission (	1943	)

	


end

------------------------------------------------------------
-- �Ͽ󲹸�վ-----�￨��
------------------------------------------------------------

function r_talk160()

	Talk( 1,  "����: ������! � �������� ����. ��� ����� � ������������! " )

	AddNpcMission ( 223 )
	AddNpcMission ( 224 )
	AddNpcMission ( 225 )
	AddNpcMission ( 226 )
	AddNpcMission ( 227 )
	AddNpcMission ( 228 )
	AddNpcMission ( 229 )
	AddNpcMission ( 230 )
	AddNpcMission	(1055)
	AddNpcMission	(1217)
	AddNpcMission(	1432	)
	AddNpcMission (	1908	)

	



	
end

------------------------------------------------------------
-- �Ͽ󲹸�վ-----�￨��
------------------------------------------------------------

function r_talk161()

	Talk( 1,  "������: � ��� ���� ����... � ������� � ������� ���� �������. " )

	AddNpcMission ( 284 )
	AddNpcMission ( 285 )
	AddNpcMission ( 311 )
	--��������� �����
	AddNpcMission	(6272)
	AddNpcMission	(6273)
	AddNpcMission	(6274)
end

------------------------------------------------------------
-- �Ͽ󲹸�վ-----���龫
------------------------------------------------------------

function r_talk162()

	Talk( 1,  "����: ������, � ����. ����� ��� ������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(455)
	AddNpcMission 	(461)
	AddNpcMission 	(811)
	AddNpcMission 	(814)
	AddNpcMission	(1013)
	AddNpcMission	(1014)
	AddNpcMission	(1177)

	-----��������
	AddNpcMission ( 6121 )
	AddNpcMission ( 6122 )

	
end

------------------------------------------------------------
-- ���ò���վ-----�մ�
------------------------------------------------------------

function r_talk163()

	Talk( 1,  "�����: � �� ���� ��������, �� ��� ��������� ��������� ���� �������� ������ ����. � � ���� ������� ��������! " )
	AddNpcMission	(1027)
	AddNpcMission	(1190)
----------------1.7
	AddNpcMission (5139 )
	AddNpcMission (5140 )
	AddNpcMission (5141 )
--	AddNpcMission ( 6044 )
--	AddNpcMission ( 6045 )

end

------------------------------------------------------------
-- ���ò���վ-----�������
------------------------------------------------------------

function r_talk164()

	Talk( 1,  "����: ������ ��� ����. �� �������� � ����� ������� ����� �� ������� � ����� ������? " )

end

------------------------------------------------------------
-- ���ò���վ-----������
------------------------------------------------------------

function r_talk165()

	Talk( 1,  "����: ������! ���� �� ��� ��, ��� ��� �����? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)
	---------------����
	AddNpcMission	(5563)
	AddNpcMission	(5564)
end

------------------------------------------------------------
-- �Ͳ�����վ-----ĢĢ
------------------------------------------------------------

function r_talk166()

	Talk( 1,  "����: ������, � ����. � ���� �� ������ ������ �������� ����! " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	3098	)

end

------------------------------------------------------------
-- ɳȪ����վ-----ά��
------------------------------------------------------------

function r_talk167()

	Talk( 1,  "������: � ����� ������! � ���� ����� ��� ��������� ��� �������! " )

	AddNpcMission 	(418)
	AddNpcMission 	(641)
	AddNpcMission 	(650)
	AddNpcMission	(1156)

	
end


------------------------------------------------------------
-- ɳȪ����վ-----�Ʒ�
------------------------------------------------------------

function r_talk168()

	Talk( 1,  "��� ���: ������, � ��� ���. " )

	AddNpcMission 	(422)
	AddNpcMission 	(639)
	AddNpcMission 	(648)
	AddNpcMission	(1121)
	AddNpcMission(	1439	)
	AddNpcMission (	1916	)

	---------------����
	--AddNpcMission (5503	)

---------------����
	AddNpcMission	(5569)
	AddNpcMission	(5572)

	
end

------------------------------------------------------------
-- ɳȪ����վ-----����
------------------------------------------------------------

function r_talk169()

	Talk( 1,  "������: � ���� ��������� ���� ������. � ��� �� ����������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(403)
	AddNpcMission 	(413)
	AddNpcMission 	(420)
	AddNpcMission 	(643)
	AddNpcMission 	(647)
	AddNpcMission 	(649)
	AddNpcMission 	(652)
	AddNpcMission	(1140)
	AddNpcMission(	1440	)
	AddNpcMission (	1917	)

	----------------1.7
	AddNpcMission (5124 )
	AddNpcMission (5125 )
	AddNpcMission (5126 )
end

------------------------------------------------------------
-- ������˹����վ-----���
------------------------------------------------------------

function r_talk170()

	Talk( 1,  "�����: � ������ ����� ��� ����. � ����� ��� ���� ����� �����������, ��� ����� �����������. " )

	AddNpcMission 	(429)
	AddNpcMission 	(464)
	AddNpcMission 	(466)
	AddNpcMission 	(684)
	AddNpcMission 	(696)
	AddNpcMission 	(697)
	AddNpcMission	(1108)

----------------1.7
	AddNpcMission (5136 )
	AddNpcMission (5137 )
	AddNpcMission (5138 )

end

------------------------------------------------------------
-- ɳȪ����վ-----��������
------------------------------------------------------------

function r_talk171()

	Talk( 1,  "������: ������! �� ������ ������� �����? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(423)
	AddNpcMission 	(440)
	AddNpcMission 	(446)
	AddNpcMission 	(462)
	AddNpcMission 	(683)
	AddNpcMission 	(687)
	AddNpcMission 	(692)
	AddNpcMission 	(695)
	AddNpcMission(	1580	)
	AddNpcMission (	1919	)
	AddNpcMission (	1955	)

	




end

------------------------------------------------------------
-- ����Ӫ�ز���վ-----��˾
------------------------------------------------------------

function r_talk172()

	Talk( 1,  "�����: �������-�������� ���������. " )

	AddNpcMission 	(802)
	AddNpcMission 	(807)
	AddNpcMission	(1100)
	AddNpcMission(	1587	)
	AddNpcMission (	1921	)
	AddNpcMission (	1922	)
----------------1.7
	AddNpcMission (5127 )
	AddNpcMission (5128 )
	AddNpcMission (5129 )
--	AddNpcMission ( 6046 )
--	AddNpcMission ( 6047 )

	


end

------------------------------------------------------------
-- ����Ӫ�ز���վ-----��������
------------------------------------------------------------

function r_talk173()

	Talk( 1,  "����: ������! ���������� � ����� ������ ��������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(467)
	AddNpcMission 	(803)
	AddNpcMission(	1588	)
	AddNpcMission (	1923	)
	AddNpcMission (	1944	)

	





end

------------------------------------------------------------
-- ��������վ-----�׿��ʷ���
------------------------------------------------------------

function r_talk174()

	Talk( 1,  "��������: ��� ���� ���������� �������� ����������� � ������ ���� � ����� ������ �� ���. " )

	
	AddNpcMission	(	871	)
	AddNpcMission	(	873	)
	AddNpcMission	(	879	)
	AddNpcMission	(	887	)
	AddNpcMission	(	890	)
	AddNpcMission	(	893	)
	AddNpcMission(	1737	)
	AddNpcMission (	1926	)
	AddNpcMission (	1947	)

	



end

------------------------------------------------------------
-- ��������վ-----����
------------------------------------------------------------

function r_talk175()

	Talk( 1,  "����: � ��������� ����, ��� ���� ���������� �� ��������� ������. ������� ���� �� ���� �� ����� ����. " )

	AddNpcMission 	(405)
	AddNpcMission 	(432)
	AddNpcMission 	(668)
	AddNpcMission 	(672)
	AddNpcMission 	(673)
	AddNpcMission 	(677)
	AddNpcMission	(1087)
	AddNpcMission(	1429	)
	AddNpcMission (	1928	)
---------------����
	AddNpcMission	(5589)
	AddNpcMission	(5590)
--	AddNpcMission ( 6050 )
--	AddNpcMission ( 6051 )
	




end

------------------------------------------------------------
-- ��������վ-----����үү
------------------------------------------------------------

function r_talk176()

	Talk( 1,  "������������ ������: ���� � � ������� �������, �� � ������� ������� ���������. " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	1847	)
	Other(	1848	)
	Other(	1849	)

	AddNpcMission 	(430)
	AddNpcMission 	(434)
	AddNpcMission 	(670)
	AddNpcMission 	(671)
	AddNpcMission 	(679)
	AddNpcMission 	(682)
	AddNpcMission	(1070)
	AddNpcMission(	1430	)
	AddNpcMission (	1929	)

	---------------1.7
	AddNpcMission (5148 )
	AddNpcMission (5150 )
	AddNpcMission (5152 )
	AddNpcMission (5158 )
	AddNpcMission (5160 )
	AddNpcMission (5161 )
	AddNpcMission (5162 )
	AddNpcMission (5163 )
	AddNpcMission (5164 )
	AddNpcMission (5165 )
	AddNpcMission (5166 )
	AddNpcMission (5169 )


end


------------------------------------------------------------
-- ����Ӫ�ز���վ-----��̩
------------------------------------------------------------

function r_talk177()

	Talk( 1,  "���: � ���� ������������ ������, ��������� �� ����� ������� ����������. " )

	AddNpcMission 	(805)
	AddNpcMission 	(806)
	AddNpcMission(	1589	)
	AddNpcMission (	1934	)
	AddNpcMission (	1949	)

	




	
end

------------------------------------------------------------
-- �¶�άƽԭ-----�������ˡ���ķ
------------------------------------------------------------

function r_talk221()

	Talk( 1,  "�����: � ����� �������� �������. � ���� ���� ����� ����������. ������ ���������? " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "�������������� ������� ������� ", JumpPage, 2 )
	Text( 1,  "������... ",CloseTalk )


	Talk( 2,  "�����: ������ ����� �������� ����� �� ��������. ������ ����� �������� �����, ������ ����� - �����, ������ ������ ���������� � ������, � ������ ����� ����� �������� � ����������. ")


	InitTrade()
	Weapon(	0817	)
	Weapon(	0818	)
	Weapon(	0867	)
	Weapon(	0868	)
	Weapon(	0872	)
	Weapon(	0873	)
	Weapon(	0635	)
	Weapon(	0636	)



end




------------------------------------------------------------
-- ������-----��װ�����������
------------------------------------------------------------
function r_talk222()


	Talk( 1,  "����: ������! � ����� �������. � ������ ����� ���� ������! " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	0335	)
	Defence(	0511	)
	Defence(	0687	)
	Defence(	0336	)
	Defence(	0512	)
	Defence(	0688	)
	Defence(	0338	)
	Defence(	0514	)
	Defence(	0690	)
	Defence(	0337	)
	Defence(	0513	)
	Defence(	0689	)
	Defence(	0340	)
	Defence(	0516	)
	Defence(	0692	)
	Defence(	0339	)
	Defence(	0515	)
	Defence(	0691	)
	Defence(	0341	)
	Defence(	0517	)
	Defence(	0693	)
	Defence(	0342	)
	Defence(	0518	)
	Defence(	0694	)
	Defence(	0345	)
	Defence(	0521	)
	Defence(	0697	)
	Defence(	0343	)
	Defence(	0519	)
	Defence(	0695	)
	Defence(	0380	)
	Defence(	0556	)
	Defence(	0732	)
	Defence(	0351	)
	Defence(	0527	)
	Defence(	0703	)
	Defence(	0386	)
	Defence(	0562	)
	Defence(	0738	)
	Defence(	0352	)
	Defence(	0528	)
	Defence(	0704	)
	Defence(	0350	)
	Defence(	0526	)
	Defence(	0702	)
	Defence(	0354	)
	Defence(	0530	)
	Defence(	0706	)
	Defence(	0353	)
	Defence(	0529	)
	Defence(	0705	)
	Defence(	0356	)
	Defence(	0532	)
	Defence(	0708	)
	Defence(	0355	)
	Defence(	0531	)
	Defence(	0707	)
	Defence(	0357	)
	Defence(	0533	)
	Defence(	0709	)
----------------1.7
	AddNpcMission (5118 )
	AddNpcMission (5119 )
	AddNpcMission (5120 )

end
------------------------------------------------------------
-- ��֮��-----����
------------------------------------------------------------
function r_talk223()


	Talk( 1,  "����: ������, � ���������� ������� �����. ��� � ���� ������? " )
	Text( 1,  "��������� � ������ ", GoTo, 1318, 510,  "darkblue " )

end


------------------------------------------------------------
-- ��ѩ��-----����������
------------------------------------------------------------
function r_talk224()


	Talk( 1,  "����� �������: ������! � ����� � � ��������! " )

	AddNpcMission ( 306 )
	AddNpcMission ( 307 )
	AddNpcMission ( 308 )

end

------------------------------------------------------------
-- ��ɳ��-----�ܿ˴���
------------------------------------------------------------
function r_talk225()


	Talk( 1,  "������� ����: ������! � �����, ������ � ��������! ���� ��� ����������! " )

	AddNpcMission ( 309 )
	AddNpcMission ( 310 )
	AddNpcMission ( 312 )
	AddNpcMission ( 313 )
	AddNpcMission ( 314 )
	AddNpcMission ( 315 )
	AddNpcMission ( 316 )
	AddNpcMission ( 328 )
	AddNpcMission ( 329 )
	AddNpcMission ( 333 )
	AddNpcMission ( 336 )
	AddNpcMission ( 483 )
	AddNpcMission ( 484 )
end


------------------------------------------------------------
-- ���Ǳ��³�-----³����
------------------------------------------------------------
function r_talk226()


	Talk( 1,  "���: ��� ���� ����� ��������� ���������� ��� ������������. " )
	
	Talk( 2,  "Luke: My brother loves to create trouble for me��always expecting me to clear the mess. Sigh�� ")
	Text( 2,  "I lost the ring you gave me ", JumpPage, 3)

	InitTrigger()
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 4144, 1 , 4)
	TriggerAction( 1, JumpPage, 4 )
	TriggerFailure( 1, JumpPage, 5 )
	Talk( 3,  "Luke: You lost such an expensive ring? Pay me 50000G and I will remake for you. ")
	Text( 3,  "Okay, heres 50000G. ", MultiTrigger, GetMultiTrigger(), 1 )
	Text( 3,  "This is extortion! I do not have so much ", CloseTalk )

	Talk( 4,  "Luke: Keep it well, this ring is for you ")

	Talk( 5,  "Luke: You don't seems to have enough gold...Its 50000G... ")

	InitTrigger()
	-----------��������������۽�ָ,���Ƕ��˲�����
	TriggerCondition( 1, HasRecord, 260 )
	TriggerCondition( 1, NoRecord, 262 )
	TriggerCondition( 1, NoItem, 4144, 1 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, JumpPage, 1 )
	
	Start( GetMultiTrigger(), 1 )

	AddNpcMission ( 296 )
	AddNpcMission ( 297 )
	AddNpcMission ( 298 )
	AddNpcMission ( 302 )
	AddNpcMission ( 303 )

end


------------------------------------------------------------
-- ����Ӫ�ز���վ-----��������ʦ
------------------------------------------------------------
function r_talk227()

	Talk( 1,  "������ �����: ������ ������ ��� � ���� ������� ��������. �������� ������ ��� �� ����� �����. " )

	AddNpcMission ( 299 )
	AddNpcMission ( 300 )
	AddNpcMission ( 469 )
	AddNpcMission ( 391 )
	----------------1.7
	AddNpcMission (5121 )
	AddNpcMission (5122 )
	AddNpcMission (5123 )
end

------------------------------------------------------------
-- �����ӵ²���վ-----���ϡ�������
------------------------------------------------------------
function r_talk228()

	Talk( 1,  "������ �������: � ����� �� � ����� ���������� �����... � �� ��� ������������. " )
	
	AddNpcMission ( 837 )
	AddNpcMission ( 838 )
	AddNpcMission ( 839 )

end

------------------------------------------------------------
-- �����ӵ²���վ-----������΢��
------------------------------------------------------------
function r_talk229()

	Talk( 1,  "�������� ����: ���������� �� �������� ����� �������� ������� ��� ����. " )

	AddNpcMission ( 840 )
---------------����
	AddNpcMission	(5591)
	AddNpcMission	(5592)
--	AddNpcMission ( 6048 )
--	AddNpcMission ( 6049 )

end

------------------------------------------------------------
-- �����ӵ²���վ-----?��ħ��
------------------------------------------------------------
function r_talk230()

	Talk( 1,  "�� ����: ��� � ���� ���� ������� �������� ����! " )

	AddNpcMission ( 844 )
	AddNpcMission ( 841 )
	AddNpcMission ( 842 )
	AddNpcMission ( 843 )

end

------------------------------------------------------------
-- �����ӵ²���վ-----���ݡ���ʯ
------------------------------------------------------------
function r_talk231()

	Talk( 1,  "����� �����������: � �������� �� ������ �������! �� ��� ��� ���������� ��� ��� ������ � �������. " )

	AddNpcMission ( 845 )
	AddNpcMission ( 846 )
	AddNpcMission ( 847 )
	AddNpcMission ( 848 )

end

------------------------------------------------------------
-- ��������վ-----��ά�����
------------------------------------------------------------
function r_talk232()

	Talk( 1,  "����: ����� ����� ������� ����� � �� ���� ���� ����� ���������� �����. ��� ����� �� ������. " )
	
	AddNpcMission ( 877 )
	AddNpcMission ( 883 )
	AddNpcMission ( 884 )


end

------------------------------------------------------------
-- ��������վ-----���ġ���
------------------------------------------------------------
function r_talk233()

	Talk( 1,  "����� �����: � ���� ���������� �� �������. " )

	AddNpcMission ( 881 )
end

------------------------------------------------------------
-- �Ͽ󲹸�վ-----��Ʒ���ˡ�����
------------------------------------------------------------
function r_talk235()

	Talk( 1,  "�����: � ������ ��������� �������� � ������. ����� ��� ��� �� ������������? " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4611	)
	Defence(	4612	)
	Defence(	4613	)
	Defence(	4614	)
	Defence(	4615	)
	Defence(	4616	)
	Defence(	4617	)
	Defence(	4618	)
	Defence(	4619	)
	Defence(	4620	)

end

------------------------------------------------------------
-- ����ɭ�ֲ���վ-----��Ʒ���ˡ����
------------------------------------------------------------
function r_talk236()

	Talk( 1,  "�����: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4626	)
	Defence(	4627	)
	Defence(	4628	)
	Defence(	4629	)
	Defence(	4630	)
	Defence(	4631	)
	Defence(	4632	)
	Defence(	4633	)
	Defence(	4634	)
	Defence(	4635	)
end

------------------------------------------------------------
-- �߶�ŵ����վ-----��Ʒ���ˡ�������
------------------------------------------------------------
function r_talk237()

	Talk( 1,  "�������: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4631	)
	Defence(	4632	)
	Defence(	4633	)
	Defence(	4634	)
	Defence(	4635	)
	Defence(	4636	)
	Defence(	4637	)
	Defence(	4638	)
	Defence(	4639	)
	Defence(	4640	)

end

------------------------------------------------------------
-- ������-----��Ʒ���ˡ�ά�˶�
------------------------------------------------------------
function r_talk238()

	Talk( 1,  "������: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4641	)
	Defence(	4642	)
	Defence(	4643	)
	Defence(	4644	)
	Defence(	4645	)
	Defence(	4646	)
	Defence(	4647	)
	Defence(	4648	)
	Defence(	4649	)
	Defence(	4650	)
	Defence(	4706	)
	Defence(	4707	)
	Defence(	4708	)
	Defence(	4709	)
	Defence(	4711	)
	Defence(	4712	)
	Defence(	4713	)
	Defence(	4714	)
	Defence(	4715	)

end

------------------------------------------------------------
-- �����ӵ²���վ-----��Ʒ���ˡ�����
------------------------------------------------------------
function r_talk239()

	Talk( 1,  "���: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4651	)
	Defence(	4652	)
	Defence(	4653	)
	Defence(	4654	)
	Defence(	4655	)
	Defence(	4656	)
	Defence(	4657	)
	Defence(	4658	)
	Defence(	4659	)
	Defence(	4660	)

end

------------------------------------------------------------
-- �Ͳ�����վ-----��Ʒ���ˡ�����
------------------------------------------------------------
function r_talk240()

	Talk( 1,  "�������� - ������: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4666	)
	Defence(	4667	)
	Defence(	4668	)
	Defence(	4669	)
	Defence(	4671	)
	Defence(	4672	)
	Defence(	4673	)
	Defence(	4674	)
	Defence(	4675	)
	Defence(	4676	)
	Defence(	4677	)
	Defence(	4678	)
	Defence(	4679	)
	Defence(	4681	)
	Defence(	4682	)
	Defence(	4683	)
	Defence(	4684	)
	Defence(	4685	)

end

------------------------------------------------------------
-- ��������վ-----��Ʒ���ˡ����
------------------------------------------------------------
function r_talk241()

	Talk( 1,  "������: � ������ ������������� ������ � ��������. ����������, �������� ��� ���-������ ������������. " )
	Text( 1,  "���� ", BuyPage )

	InitTrade()
	Defence(	4686	)
	Defence(	4687	)
	Defence(	4688	)
	Defence(	4689	)
	Defence(	4691	)
	Defence(	4692	)
	Defence(	4693	)
	Defence(	4694	)
	Defence(	4695	)
	Defence(	4696	)
	Defence(	4697	)
	Defence(	4698	)
	Defence(	4699	)
	Defence(	4701	)
	Defence(	4702	)
	Defence(	4703	)
	Defence(	4704	)
	Defence(	4705	)

end


------------------------------------------------------------
-- ������-----��ϴ��
------------------------------------------------------------
function r_talk252()
	
	InitFuncList()
	AddFuncList( GiveItem,	0817	,	1	,	4)
	AddFuncList( GiveItem,	0818	,	1	,	4)
	AddFuncList( GiveItem,	0819	,	1	,	4)
	AddFuncList( GiveItem,	0867	,	1	,	4)
	AddFuncList( GiveItem,	0868	,	1	,	4)
	AddFuncList( GiveItem,	0869	,	1	,	4)
	AddFuncList( GiveItem,	0872	,	1	,	4)
	AddFuncList( GiveItem,	0873	,	1	,	4)
	AddFuncList( GiveItem,	0874	,	1	,	4)
	AddFuncList( GiveItem,	1630	,	2	,	4)
	AddFuncList( GiveItem,	1631	,	1	,	4)
	AddFuncList( GiveItem,	1632	,	1	,	4)
	AddFuncList( GiveItem,	1633	,	2	,	4)
	AddFuncList( GiveItem,	1634	,	1	,	4)
	AddFuncList( GiveItem,	1635	,	1	,	4)
	AddFuncList( GiveItem,	1636	,	2	,	4)
	AddFuncList( GiveItem,	1637	,	1	,	4)
	AddFuncList( GiveItem,	1638	,	1	,	4)
	AddFuncList( GiveItem,	1639	,	2	,	4)
	AddFuncList( GiveItem,	1640	,	1	,	4)
	AddFuncList( GiveItem,	1641	,	1	,	4)
	AddFuncList( GiveItem,	1642	,	2	,	4)
	AddFuncList( GiveItem,	1643	,	1	,	4)
	AddFuncList( GiveItem,	1644	,	1	,	4)
	AddFuncList( GiveItem,	3360	,	1	,	4)
	AddFuncList( GiveItem,	3361	,	1	,	4)
	AddFuncList( GiveItem,	3362	,	1	,	4)
	AddFuncList( GiveItem,	3363	,	1	,	4)
	AddFuncList( GiveItem,	3364	,	1	,	4)
	AddFuncList( GiveItem,	3365	,	1	,	4)
	AddFuncList( GiveItem,	3366	,	1	,	4)
	AddFuncList( GiveItem,	3367	,	1	,	4)
	AddFuncList( GiveItem,	3425	,	1	,	4)
	AddFuncList( GiveItem,	3426	,	1	,	4)
	AddFuncList( GiveItem,	3427	,	1	,	4)
	AddFuncList( GiveItem,	3428	,	1	,	4)
	AddFuncList( GiveItem,	3429	,	1	,	4)
	AddFuncList( GiveItem,	3430	,	1	,	4)
	AddFuncList( GiveItem,	3431	,	1	,	4)
	AddFuncList( GiveItem,	3432	,	1	,	4)
	AddFuncList( GiveItem,	3433	,	1	,	4)
	AddFuncList( GiveItem,	1804	,	1	,	4)
	AddFuncList( GiveItem,	1805	,	1	,	4)
	AddFuncList( GiveItem,	1806	,	1	,	4)
	AddFuncList( GiveItem,	1807	,	1	,	4)
	AddFuncList( GiveItem,	1808	,	1	,	4)
	AddFuncList( GiveItem,	1809	,	1	,	4)
	AddFuncList( GiveItem,	1810	,	1	,	4)
	AddFuncList( GiveItem,	1811	,	1	,	4)
	AddFuncList( GiveItem,	1787	,	1	,	4)
	AddFuncList( GiveItem,	1788	,	1	,	4)
	AddFuncList( GiveItem,	1789	,	1	,	4)
	AddFuncList( GiveItem,	1790	,	1	,	4)
	AddFuncList( GiveItem,	1791	,	1	,	4)
	AddFuncList( GiveItem,	1792	,	1	,	4)
	AddFuncList( GiveItem,	1793	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)
	AddFuncList( GiveItem,	3932	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3930	,	1	,	4)
	AddFuncList( GiveItem,	3931	,	1	,	4)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3927, 1 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3927, 1 )
	TriggerAction( 1, RandFunction, GetFuncList(), GetNumFunc() )
	TriggerFailure( 1, JumpPage, 2 )
	Talk( 1,  "��� ����� ������ ����������, ��������� �������� ����� �����. " )
	Text( 1,  "�������� ����� ", MultiTrigger, GetMultiTrigger(), 1)
	--Text( 1,  "�������� �������������� ������� ", JumpPage, 3)

	InitTrigger()
	TriggerCondition( 1, HasItem, 2892, 1 )
	TriggerCondition( 1, HasMoney, 10000 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 10000 )
	TriggerAction( 1, TakeItem, 2892, 1 )
	TriggerAction( 1, GiveItem, 2893, 1 , 4)
	TriggerAction( 1, JumpPage, 4)
	TriggerFailure( 1, JumpPage, 2 )
	Talk( 3,  "��... ����� ������� �������. ����� �� ��������� ��� �������� ��������� 10000 ������! " )
	Text( 3,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 4,  "����� �������� ������! ������ � �������� �������! " )
	Talk( 2,  "���������� ��������. � ��� ������������ ����� ��� ��� ��������� ��� �������. " )
end


------------------------------------------------------------
-- ���Ŷӳ�-----����ѧ��
------------------------------------------------------------
function r_talk253()
	
	Talk( 1,  "�������������: ������! � �������� � ������� ��������������. � ����� ������ ������� ����������. ��� � ���� ������? " )
	Text( 1,  "��������� �� ������ ���� ", JumpPage, 3)

	Talk( 3,  "�������������: ������, � ������ ���. ��� ������ ����� �������, ����� �� ����� ������ ��������� ����.  " )
	Text( 3,  "������ ������� ������ ", JumpPage, 6)
	Text( 3,  "����� ������� ", JumpPage, 7)
	Text( 3,  "����� ������������ ", JumpPage, 8)
	Text( 3,  "������ ������������ ", JumpPage, 9)
	Text( 3,  "���� ������������ ", JumpPage, 10)
	Text( 3,  "���� ������������ ", JumpPage, 11)
	Text( 3,  "������ ������������ ", JumpPage, 12)
	Text( 3,  "������ --> ", JumpPage, 4)

	Talk( 4,  "�������������: ������, � ������ ���. ��� ������ ����� �������, ����� �� ����� ������ ��������� ����. " )
	Text( 4,  "����� ������������ ", JumpPage, 13)
	Text( 4,  "��� ������������ ", JumpPage, 14)
	Text( 4,  "����� ������������ ", JumpPage, 15)
	Text( 4,  "��� ������������ ", JumpPage, 16)
	Text( 4,  "������ ����������� ", JumpPage, 17)
	Text( 4,  "�������� ������������ ", JumpPage, 18)
	Text( 4,  "������ ������������ ", JumpPage, 19)
	Text( 4,  "������ --> ", JumpPage, 5)

	Talk( 5,  "�������������: ������, � ������ ���. ��� ������ ����� �������, ����� �� ����� ������ ��������� ����. " )
	Text( 5,  "�������� ������������ ", JumpPage, 20)
	Text( 5,  "������� ������������ ", JumpPage, 21)
	Text( 5,  "�������� ��������� ", JumpPage, 22)
	Text( 5,  "������ ����������� ", JumpPage, 23)
	Text( 5,  "�������� ������� ������ ", JumpPage, 24)
	Text( 5,  "������ ������� ������ ", JumpPage, 25)
	Text( 5,  "������� �������� ������������ ", JumpPage, 26)
	Text( 5,  "������ ������������ ", JumpPage, 27)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1912, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1912, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 791, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 6,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1915, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1915, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 794, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 7,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1908, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1908, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 787, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 8,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1926, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1926, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 805, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 9,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1900, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1900, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 779, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 10,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1886, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1886, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 765, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 11,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1889, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1889, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 768, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 12,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1904, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1904, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 783, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 13,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1893, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1893, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 772, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 14,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1896, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1896, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 775, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 15,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1922, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1922, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 801, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 16,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1918, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1918, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 797, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 17,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1988, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1988, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0807, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 18,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 18,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1989, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1989, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0808, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 19,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 19,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1990, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1990, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0809, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 20,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 20,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1991, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1991, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0810, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 21,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 21,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1992, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1992, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0811, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 22,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 22,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()
	TriggerCondition( 1, HasItem, 1994, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1994, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0813, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 23,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 23,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1993, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1993, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0812, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 24,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 24,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1995, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1995, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0814, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 25,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 25,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1996, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1996, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0815, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 26,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 26,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1997, 1 )
	TriggerCondition( 1, HasItem, 3433, 5 )
	TriggerCondition( 1, HasItem, 3427, 10 )
	TriggerCondition( 1, HasItem, 3430, 10 )
	TriggerCondition( 1, HasMoney, 600000 )
	TriggerAction( 1, TakeMoney, 600000 )
	TriggerAction( 1, TakeItem, 1997, 1 )
	TriggerAction( 1, TakeItem, 3433, 5 )
	TriggerAction( 1, TakeItem, 3427, 10 )
	TriggerAction( 1, TakeItem, 3430, 10 )
	TriggerAction( 1, GiveItem, 0877, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 27,  "�������������: ��� ������ ������ � ����� �������� ��� �����������: ������������ �������, 5 ��� ���, 10 ��� ���, 10 ��� ��� � 600000 ������. " )
	Text( 27,  "����� ������  ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 30,  "�������������: ����� ��������, �� � ��� ��� ����� ������������. � �� ���� ����� ������. " )


end

------------------------------------------------------------
-- ����֮��-----����ѧ��
------------------------------------------------------------
function r_talk254()
	
	Talk( 1,  "�������������: ������! � ���������� � ������� ��������������.� ��������� ������������� ������������ ������. ���� �� � ��� �� ������? " )
	Text( 1,  "������ � ����������� ������ ", JumpPage, 2)

	Talk( 2,  "�������������: � ��������� ������������� ������������ ������ ��� ������ �����. � ���� ������� ������ � ��������� ��� ��������� �����. " )
	Text( 2,  "����� ������ ", JumpPage, 3)
	
	Talk( 3,  "�������������: � ����������� ������ ���� ����� ����������� ������������ ���������� ������. �� ���� ������ � �������� ������� ������ � ���� �����. � ���� �� ������ ����� ������? " )
	Text( 3,  "��� �������� ", JumpPage, 6)
	Text( 3,  "������� ���� ", JumpPage, 7)
	Text( 3,  "����� �������� ", JumpPage, 8)
	Text( 3,  "��� ������ ", JumpPage, 9)
	Text( 3,  "������ ������ ", JumpPage, 10)
	Text( 3,  "������� ������ ", JumpPage, 11)
	Text( 3,  "������ �������� ������ ", JumpPage, 12)
	Text( 3,  "������ ������������� ", JumpPage, 13)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1920, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1920, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 799, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 6,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1924, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1924, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 803, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 7,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1906, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1906, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 785, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 8,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1891, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1891, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 770, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 9,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1898, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1898, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 777, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 10,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1902, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1902, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 781, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 11,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1910, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1910, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 789, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 12,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1884, 1 )
	TriggerCondition( 1, HasItem, 3431, 5 )
	TriggerCondition( 1, HasItem, 3428, 5 )
	TriggerCondition( 1, HasItem, 3425, 10 )
	TriggerCondition( 1, HasMoney, 200000 )
	TriggerAction( 1, TakeMoney, 200000 )
	TriggerAction( 1, TakeItem, 1884, 1 )
	TriggerAction( 1, TakeItem, 3431, 5  )
	TriggerAction( 1, TakeItem, 3428, 5 )
	TriggerAction( 1, TakeItem, 3425, 10)
	TriggerAction( 1, GiveItem, 763, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "�������������: ����� ����� ������ � ����� �������� ��� ����������� - ������������ �������, 5 ��� ��, 5 ��� ���, 10 ��� ���� � 200000 ������. " )
	Text( 13,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "�������������: ��������, �� � ��� ��� ��������������� ���������. " )

end

------------------------------------------------------------
-- ħ������-----����ѧ��
------------------------------------------------------------
function r_talk255()
	
	Talk( 1,  "�������������: ������! � ���������� � ������� ��������������. � ��������� ������������� ��������� ���� �������. ���� � ��� ��� �� ������? " )
	Text( 1,  "������ � ���� ������� ", JumpPage, 2)

	Talk( 2,  "�������������: � ��������� �������������� ���� ������� ��� ������ �����, � ���� ������� ��������� � ������������ ��� ����� � ������� ���. " )
	Text( 2,  "Unseal curse ", JumpPage, 3)
	
	Talk( 3,  "�������������: � ���� ������� �������� ����� ���������, ������������ �����. ���� � ��� ���� ������� � ������� ����, �� � �������� ����������� ��� ��� ���. " )
	Text( 3,  "����� ���������� ", JumpPage, 6)
	Text( 3,  "������� ������� ", JumpPage, 7)
	Text( 3,  "���� ������� ", JumpPage, 8)
	Text( 3,  "���������� ���������� ", JumpPage, 9)
	Text( 3,  "������� ���������� ", JumpPage, 10)
	Text( 3,  "������� ���������� ", JumpPage, 11)
	Text( 3,  "���� ���������� ", JumpPage, 12)
	Text( 3,  "������ --> ", JumpPage, 4)

	Talk( 4,  "�������������: � ���� ������� �������� ����� ���������, ������������ �����. ���� � ��� ���� ������� � ������� ����, �� � �������� ����������� ��� ��� ���. " )
	Text( 4,  "������ ���������� ", JumpPage, 13)
	Text( 4,  "���� ���������� ", JumpPage, 14)
	Text( 4,  "������ ���������� ", JumpPage, 15)
	Text( 4,  "������ ������� ", JumpPage, 16)
	Text( 4,  "����� ������� ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1909, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1909, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 788, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 6,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1927, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1927, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 806, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 7,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1923, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1923, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 802, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 8,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1894, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1894, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 773, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 9,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1905, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1905, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 784, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 10,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1901, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1901, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 780, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 11,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1913, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1913, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 792, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 12,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1897, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1897, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 776, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 13,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1887, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1887, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 766, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 14,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1890, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1890, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 769, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 15,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1919, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1919, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 798, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 16,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1916, 1 )
	TriggerCondition( 1, HasItem, 3457, 5 )
	TriggerCondition( 1, HasItem, 3456, 10 )
	TriggerCondition( 1, HasItem, 3455, 20 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1916, 1 )
	TriggerAction( 1, TakeItem, 3457, 5  )
	TriggerAction( 1, TakeItem, 3456, 10 )
	TriggerAction( 1, TakeItem, 3455, 20)
	TriggerAction( 1, GiveItem, 795, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "�������������: ��� ������ ������ � ����� �������� ���� ����� �������� - ������������ �������, 5 ��� ����, 10 ��� ��, 20 ��� ��� � 800000 ������. " )
	Text( 17,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "�������������: ��������, �� � ��� ��� ���� ����������� ���������. " )

end


------------------------------------------------------------
-- ��������-----����ѧ�Ҷӳ�
------------------------------------------------------------
function r_talk256()
	
	Talk( 1,  "�������������: ������! � ���������� � ������� ��������������. � ��������� �������������� ��������� ������ ����. ���� � ��� ��� �� ������? " )
	Text( 1,  "������ � ������ ���� ", JumpPage, 2)

	Talk( 2,  "�������������: � ��������� �������������� ������ ���� ��� ������ �����. ����� ����� ������ � ��������� ������ ���� �� ������ �������� ��� ��������� ����. ����� ���� ���� �� ������� ������� ������� ����� � ���� ���������� ��� ��� �������� ��������. " )
	Text( 2,  "����� ������", JumpPage, 3)
	Text( 2,  "������ � �������� �������� ", JumpPage, 5)
	
	Talk( 3,  "�������������: � ������ ���� ���� ����� ��������� � ������� �����. �� ����� ������ ��� � �������� ������� ��� ������. ���� � ��� ���� ������� � ������� �����, �� � ������ ���. " )
	Text( 3,  "���� ������� ", JumpPage, 6)
	Text( 3,  "���� ���������� ����� ", JumpPage, 7)
	Text( 3,  "������� ���������� ������� ", JumpPage, 8)
	Text( 3,  "����� ���������� ", JumpPage, 9)
	Text( 3,  "����� ������ ", JumpPage, 10)
	Text( 3,  "������ ������� ", JumpPage, 11)
	Text( 3,  "������ ���������� ", JumpPage, 12)
	Text( 3,  "������ --> ", JumpPage, 4)

	Talk( 4,  "�������������: � ������ ���� ���� ����� ��������� � ������� �����. �� ����� ������ ��� � �������� ������� ��� ������. ���� � ��� ���� ������� � ������� �����, �� � ������ ���. " )
	Text( 4,  "���� ���������� ", JumpPage, 13)
	Text( 4,  "������� ��� ���������� ", JumpPage, 14)
	Text( 4,  "��� ���������� ", JumpPage, 15)
	Text( 4,  "������������ ������ ���������� ", JumpPage, 16)
	Text( 4,  "������� ���������� ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 3930, 5 )
	TriggerCondition( 1, HasItem, 3931, 1 )
	TriggerCondition( 1, HasItem, 3932, 5 )
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, TakeItem, 3930, 5 )
	TriggerAction( 1, TakeItem, 3931, 1 )
	TriggerAction( 1, TakeItem, 3932, 5 )
	TriggerAction( 1, GiveItem, 3934, 1, 4 )
	TriggerFailure( 1, JumpPage, 31 )
	Talk( 5,  "�������������: ��� ������������ ��������� �������� ����������: 5 ������ �����, 1 ���������, 5 ������ �����. " )
	Text( 5,  "������� �������� �������� ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1911, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1911, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 790, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 6,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1885, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1885, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 764, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 7,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1925, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1925, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 804, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 8,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1907, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1907, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 786, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 9,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1914, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1914, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 793, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 10,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1917, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1917, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 796, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 11,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1895, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1895, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 774, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 12,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1899, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1899, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 778, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 13,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1892, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1892, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 771, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 14,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1921, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1921, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 800, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 15,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1888, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1888, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 767, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 16,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1903, 1 )
	TriggerCondition( 1, HasItem, 3432, 5 )
	TriggerCondition( 1, HasItem, 3426, 10 )
	TriggerCondition( 1, HasItem, 3429, 5 )
	TriggerCondition( 1, HasMoney, 400000 )
	TriggerAction( 1, TakeMoney, 400000 )
	TriggerAction( 1, TakeItem, 1903, 1 )
	TriggerAction( 1, TakeItem, 3432, 5  )
	TriggerAction( 1, TakeItem, 3426, 10)
	TriggerAction( 1, TakeItem, 3429, 5 )
	TriggerAction( 1, GiveItem, 782, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "�������������: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 5 ��� ���, 10 ��� ���, 5 ��� ��� � 400000 ������. " )
	Text( 17,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "�������������: ��������, �� � ��� ��� ���� ����������� ���������. " )

	Talk( 31,  "�������������: ��������, �� � ��� ��� ���� ����������� ���������. " )


end


------------------------------------------------------------
-- ������-----�Ĺ�
------------------------------------------------------------
function r_talk242()
	Talk( 14,  "�����: ����� ��� �������� ��� ��������� ��������� �������� ������. " )
	InitTrigger() 
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0860, 3, 101 )
	TriggerFailure( 1, JumpPage, 15 )
	Text( 14,  "�������� 3 ��������� ����� ",MultiTrigger, GetMultiTrigger(), 1) 
	InitTrigger() 
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0861, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "�������� 3 ��������� ����� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger()
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0862, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "�������� 3 ��������� ������� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 3 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 0863, 3,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "�������� 3 ��������� ������ ",MultiTrigger, GetMultiTrigger(), 1) 
	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem,2899, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2899, 1 )
	TriggerAction( 1, GiveItem, 1012, 1,101 )
	TriggerFailure( 1, JumpPage, 15 )
        Text( 14,  "�������� 1 �������� ���� ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 15,  "�����: ����� ����������! � ��� ��� �������� ��� ������������ ���������  " )
	Talk( 16,  "� ����� �����! " )

	Talk( 1,  "�����: ������! � �������� ����� �����. � ��� ���� ��� �� ��� ����? ")
	Text( 1,  "�������� �� �������������� �������� ", JumpPage, 14 )
    Text( 1,  "�������� �� �������� ", JumpPage, 5 )
	Text( 1,  "�������� �� ���������� �������� ", JumpPage, 12 )
	Text( 1,  "�������� �� ��������� �������� 1 ������ ", JumpPage, 2 )
	Text( 1,  "�������� �� ��������� �������� 2 ������ ", JumpPage, 3 )
	Text( 1,  "�������� �� ��������� �������� ", JumpPage, 4 )
	Text( 1,  "������ --> ", JumpPage, 21 )
	Talk( 21,  "�����: ������! � �������� ����� �����. � ��� ���� ��� �� ��� ����? ")
	Text( 21,  "��������� �������� ", JumpPage, 17 )
    Text( 21,  "���������� ������ ������� ", JumpPage, 6 )
	Text( 21,  "�������� ������ ����� ", JumpPage, 20 )		-------�±��һ�
	Text( 21,  "�������� ���������� ��� ", JumpPage, 10 )
	Text( 21,  "<-- ����� ", JumpPage, 1 )
      
	
	Talk( 2,  "�����: ��� ��� �������� �� ��������� �������� 1 ������ ��� ��������� ���������� ���������, � ����� ��� 1 ���������� ��������� 1 ������. ")
	Text( 2,  "�������� ", TransferDiamond, 1)

	Talk( 3,  "�����: ��� ��� �������� �� ��������� �������� 2 ������ ��� ��������� ���������� ���������, � ����� ��� 1 ���������� ��������� 2 ������. ")
	Text( 3,  "�������� ", TransferDiamond, 2)

	Talk( 4,  "�����: ��� ��� �������� �� ��������� �������� ��� ��������� 1 ���������� ��������� 1 ������ ")
	Text( 4,  "�������� ", TransferDiamond, 3)

	Talk( 5,  "�����: ��� ��� 1 �������� �� �������� ��� ��������� 1 ���������� ��������� 1 ������ ")
	Text( 5,  "�������� ", TransferDiamond, 4)



	Talk( 17,  "�����: � ��� ���� ��������� ��������? ")
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 2238, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2238, 1 )
 	TriggerAction( 1, GiveItem, 2306, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "� ���� ���� ��������� �������� 8 ",MultiTrigger, GetMultiTrigger(), 1)


	InitTrigger()--�һ�Ħ����ʯ
	TriggerCondition( 1, HasItem, 2240, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2240, 1 )
 	TriggerAction( 1, GiveItem, 1028, 1 ,4)
	TriggerAction( 1,JumpPage, 19 )------------------
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "� ���� ���� ��������� �������� 6 ",MultiTrigger, GetMultiTrigger(), 1)

	Text( 17,  "� ���� ���� ��������� �������� 6 ",JumpPage, 19)
	Talk(19, "�����: �� ������ ��������? ")
	Text( 19,  "�������� ",GetChaName_5, 1)

	InitTrigger()--�һ�����Ӳ��99��
	TriggerCondition( 1, HasItem, 2237, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2237, 1 )
 	TriggerAction( 1, GiveItem, 855, 99 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "� ���� ���� ��������� �������� 9 ",MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()-- �һ�����ͼֽ "Encrypted Blueprint "����
	TriggerCondition( 1, HasItem, 2239, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2239, 1 )
 	TriggerAction( 1, GiveItem, 1001, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "� ���� ���� ��������� �������� 7 ",MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()--�һ����ٳɳ���1��
	TriggerCondition( 1, HasItem, 2241, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 2241, 1 )
 	TriggerAction( 1, GiveItem, 0578, 1 ,4)
	TriggerFailure( 1, JumpPage, 18 )
	Text( 17,  "� ���� ���� ��������� �������� 5 ",MultiTrigger, GetMultiTrigger(), 1)
	Text( 17,  "����� ����� ��������� �������� ", GetChaName_4, 1)



	Talk( 18,  "�����: ������� �� �� ������ ���������� ��������� ��������. ��������� ����� ��� ��� ��������� �� ������������ � ������� ���� �� ���� ��������� �����. ")

 	InitTrigger() --�ϳ���Ըʯ
	TriggerCondition( 1, HasItem, 3905, 5 )
	TriggerCondition( 1, HasItem, 3907, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3905, 5 )
	TriggerAction( 1, TakeItem, 3907, 1 )
 	TriggerAction( 1, GiveItem, 3906, 1 ,4)
	TriggerFailure( 1, JumpPage, 8 )
	Talk( 6,  "�����: ��������� ��� 5 ������ ������ �������� 1 ����������� ����� ��� ������ �� 1 ���������� ������ ������� ")
	Text( 6,  "������������� ",MultiTrigger, GetMultiTrigger(), 1)        
 	
	Talk( 8,  "�����: �� �� ������ ������ ���������� ������ ������ ������� ��� ������������� �����. ��������� ����� ��� � ��� ������� ���� �� 1 ��������� ����� � ���������. ")

	InitTrigger() --�һ����¾���
	TriggerCondition( 1, HasItem, 3342, 2 )
	TriggerCondition( 1, HasItem, 3337, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3342, 2 )
	TriggerAction( 1, TakeItem, 3337, 1 )
	TriggerAction( 1, GiveItem, 3335, 1 ,4)
	TriggerFailure( 1, JumpPage, 11 ) 
	Talk( 10,  "�����: ��������� ��� 2 ����������� � 1 ���� ��� ��� ������ �� ���������� ���. ���� ��� ����� ����� � �������� � ����� �����. ")
	Text( 10,  "�������� ",MultiTrigger, GetMultiTrigger(), 1) 
   
	Talk( 11,  "� ��� ��� ����� ������������ ��� ������. �������� ����� � ��� ��� ��������� ���� � ��������� ��� �� ������������. ")
	
	Talk( 12,  "�����: ����� ��� 1 �������� �� ���������� �������� ��� ������ �� ���������� ��������. ")

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0863, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "�������� �������� ������ ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid,1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 1012, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "�������� �������� ���� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0862, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "�������� �������� ������� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1)
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0861, 1,101 )
	TriggerFailure( 1, JumpPage, 13 ) 
        Text( 12,  "�������� �������� ����� ",MultiTrigger, GetMultiTrigger(), 1) 

	InitTrigger() --�߼���ʯ�һ�ȯ
	TriggerCondition( 1, HasItem, 0333, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
        TriggerAction( 1, TakeItem, 0333, 1 )
	TriggerAction( 1, GiveItem, 0860, 1, 101 )
	TriggerFailure( 1, JumpPage, 13 ) 
	Text( 12,  "�������� �������� ����� ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 13,  "�����: � ��� ��� �������� �� ���������� ��������! �������� ����� ��� ��������� ���������� ��� ������������. ")
	
	Talk( 20,  "�����: � ������ ������ ������? � ��� ����? � ��� �� ��� ������������ ����� " )
	InitTrigger() --99������֮��10��
	TriggerCondition( 1, HasItem,3095, 99 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3915, 99 )
	TriggerAction( 1, GiveItem, 2440, 10, 4 )
	TriggerFailure( 1, JumpPage, 21 )
	Text( 20,  "�������� 99 ������� �� ����� ��������� ���������� ",MultiTrigger, GetMultiTrigger(), 1) 
	
	InitTrigger() --100�����Ƹ�1��
	TriggerCondition( 1, HasItem,3097, 99 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3915, 100 )
	TriggerAction( 1, GiveItem, 3096, 1,4 )
	TriggerFailure( 1, JumpPage, 21 )
	Text( 20,  "�������� 99 ������� �� ������� ��������� ����� ",MultiTrigger, GetMultiTrigger(), 1) 

	Talk( 21,  "�����: � ��� ��� ������������ ���������� ���������! �������� ����� ��� ��������� ���������� ��� ������������. ") 

end
------------------------------------------------------------
-- ������-----�רԱ
------------------------------------------------------------
function mmm_talk01()
	Talk( 1,  "������� �����������: ��� ���� ����������� ��� ���������� ������������ �� ������ ������ � ����. ")
--	Text( 1, bganswer1_13, JumpPage, 13)
--	Text( 1, bganswer1_14, JumpPage, 14)
--	Text( 1, bganswer1_15, JumpPage, 15)
--	Text( 1, bganswer1_16, JumpPage, 16)
--	Text( 1, bganswer1_17, JumpPage, 17)
	--Text( 1,  "Lucky Alphabet Card Exchange " ,JumpPage, 18 )

	InitTrigger()
	TriggerCondition( 1, HasRecord, 1007 )
	TriggerAction( 1, ClearRecord, 1000 )
	TriggerAction( 1, ClearRecord, 1001 )
	TriggerAction( 1, ClearRecord, 1002 )
	TriggerAction( 1, ClearRecord, 1003 )
	TriggerAction( 1, ClearRecord, 1004 )
	TriggerAction( 1, ClearRecord, 1005 )
	TriggerAction( 1, ClearRecord, 1006 )
	TriggerAction( 1, ClearRecord, 1007 )
	TriggerAction( 1, JumpPage, 20)
	TriggerFailure( 1, JumpPage, 21)
	Text( 1,  "Start challenge again " ,MultiTrigger, GetMultiTrigger(), 1)

	----------------11.20-11.26	
	InitTrigger()						----50W������
	TriggerCondition( 1, CheckZMKTime )
	TriggerCondition( 1, HasItem, 3869, 1 )			----t
	TriggerCondition( 1, HasItem, 3864, 1 )			----0
	TriggerCondition( 1, HasItem, 3865, 1 )			----p

	TriggerAction( 1, TakeItem,   3869, 1 )
	TriggerAction( 1, TakeItem,   3864, 1 )
	TriggerAction( 1, TakeItem,   3865, 1 )
	TriggerAction( 1, AddMoney, 500000)
	TriggerFailure( 1, JumpPage, 19 )
	Talk( 18,  "Pappa: This week's lucky combination is: top. Exchangable for 500000G. ")
	Text(18,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 19,  "Pappa: Do you have enough Cards on you? Please check if your inventory is binded! ")
	Talk( 20,  "You can take the challenge of Hexathlon again now! ")
	Talk( 21,  "you can do the challenge now.please don't joke with me.i'm busy now. ")
	-----��������
	AddNpcMission ( 6114 )


	----------------11.27-12.3
--	InitTrigger()					----10�����ɽ���
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3858, 1 )			----i
--	TriggerCondition( 1, HasItem, 3856, 2 )			----g
--	TriggerCondition( 1, HasItem, 3869, 1 )			----t
--	TriggerCondition( 1, HasItem, 3864, 1 )			----0
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--
--	TriggerAction( 1, TakeItem,   3858, 1 )
--	TriggerAction( 1, TakeItem,   3856, 2 )
--	TriggerAction( 1, TakeItem,   3869, 1 )
--	TriggerAction( 1, TakeItem,   3864, 1 )
--	TriggerAction( 1, TakeItem,   3865, 1 )
--	TriggerAction( 1, GiveItem, 3844, 10, 4)
--	TriggerFailure( 1, JumpPage, 19 )
--	Talk( 18,  "Pappa: This week's lucky combination is: iggtop. Exchangable for 10 Heaven's Berry. ")
--	Text(18,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)


	---------------12.4-12.10
--	InitTrigger()						----��������10��+5�����ɽ���
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3857, 1 )			----h
--	TriggerCondition( 1, HasItem, 3864, 2 )			----0
--	TriggerCondition( 1, HasItem, 3869, 2 )			----t
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--
--	TriggerAction( 1, TakeItem, 3857, 1 )			----h
--	TriggerAction( 1, TakeItem, 3864, 2 )			----0
--	TriggerAction( 1, TakeItem, 3869, 2 )			----t
--	TriggerAction( 1, TakeItem, 3865, 1 )			----p
--	TriggerAction( 1, GiveItem, 3844, 5, 4)
--	TriggerAction( 1, GiveItem, 3846, 10, 4)
--	TriggerFailure( 1, JumpPage, 19 )
--	Talk( 18,  "Pappa: This week's lucky combination is: hottop. Exchangable for 10 Voodoo Doll and 5 Heaven's Berry. ")
--	Text(18,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	---------------12.11-12.17
--	InitTrigger()						----����
--	TriggerCondition( 1, CheckZMKTime )
--	TriggerCondition( 1, HasItem, 3869, 2 )			----t
--	TriggerCondition( 1, HasItem, 3850, 2 )			----a
--	TriggerCondition( 1, HasItem, 3861, 1 )			----l
--	TriggerCondition( 1, HasItem, 3854, 2 )			----e
--	TriggerCondition( 1, HasItem, 3868, 2 )			----s
--	TriggerCondition( 1, HasItem, 3864, 1 )			----o
--	TriggerCondition( 1, HasItem, 3855, 1 )			----f
--	TriggerCondition( 1, HasItem, 3865, 1 )			----p
--	TriggerCondition( 1, HasItem, 3858, 1 )			----i
--	TriggerCondition( 1, HasItem, 3867, 1 )			----r
--
--	TriggerAction( 1, TakeItem, 3869, 2 )			----t
--	TriggerAction( 1, TakeItem, 3850, 2 )			----a
--	TriggerAction( 1, TakeItem, 3861, 1 )			----l
--	TriggerAction( 1, TakeItem, 3854, 2 )			----e
--	TriggerAction( 1, TakeItem, 3868, 2 )			----s
--	TriggerAction( 1, TakeItem, 3864, 1 )			----o
--	TriggerAction( 1, TakeItem, 3855, 1 )			----f
--	TriggerAction( 1, TakeItem, 3865, 1 )			----p
--	TriggerAction( 1, TakeItem, 3858, 1 )			----i
--	TriggerAction( 1, TakeItem, 3867, 1 )			----r
--	TriggerAction( 1, GiveItem, 0845, 1, 4)
--	TriggerAction( 1, GiveItem, 0846, 1, 4)
--	TriggerAction( 1, GiveItem, 0847, 1, 4)
--	TriggerAction( 1, GiveItem, 0848, 1, 4)
--	Talk( 18,  "Pappa: This week's lucky combination is: talesofpirates. Exchangable for A set of Black Dragon apparel. ")
--	Text(18,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

--	Talk( 13, bgtalk13)
--	Talk( 14, bgtalk14)
--	Talk( 15, bgtalk15)
--	Talk( 16, bgtalk16)
--	Talk( 17, bgtalk17)

end

------------------------------------------------------------
-- ������-----��ԭ
------------------------------------------------------------
function mmm_talk02()
	Talk( 1,  "�� ����: ��... ����� ������� ������� �����... ")
	AddNpcMission ( 902 )
	AddNpcMission ( 903 )
	AddNpcMission ( 904 )
end
-----------------------------------------------------------
---ɳᰳ�---�������Ա�����ö�
-----------------------------------------------------------
function e_talk01 ()
	Talk( 1,  "�����: ������������ ����� ���������� ����� ��� ��� ��������� � ���������� ������� ���. ����� ������� ������� ��� �������������� � ��� ��������� �� 4 ������. " )
	Text( 1,  "����������� ��� ������ ��������� " ,JumpPage, 2)
	Text( 1,  "������� ���������� ��� ", JumpPage, 3)
	Text( 1,  "������� ��� ", OpenEidolonMetempsychosis )
	Talk( 2,  "�����: ��� ������ ��������� ����� ������� ������ �������������� � ��������. ����� ���� ��� ����, ��������, ������������, ���� � �������� ����� ������� ��������������� ����� � ������ ��������� ��� ������������� ��������. ��� ����� � ��� ��� ���� ������� ����������� ��������� ����� � ���������� ����� ��������������. � ����� ������� �������� ������� ��� ��� �����. ")	
	Talk( 3,  "�����: �� ������� ���������� ��� ������ ��������� ����� ������ ������� ���������. ����� ���� � ������� ���� ���� ���� �����������. ����� ��� ����������? ")
	Text( 3,  "������� ��� ��������� ��� ���� ", JumpPage, 4  )
	Text( 3,  "������� ��� ��������� ��� ������������ ", JumpPage, 5  )
	Text( 3,  "������� ��� ��������� ��� �������� ", JumpPage, 6  )
	Text( 3,  "������� ��� ��������� ��� ���� ", JumpPage, 7  )
	Text( 3,  "������� ��� ��������� ��� �������� ", JumpPage, 8  )
	Text( 3,  "������� ��� ��������� ��� ����� ", JumpPage, 9 )
	Text( 3,  "������� ��� ��������� ��� ��� ", JumpPage, 10 )
	Text( 3,  "������� ��� ��������� ����� �������� ", JumpPage, 11 )	
	Talk(  4,  "�����: ��� ��������� ��� ���� ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� ����, 10 ���������� �������� ���������, 10 ������ ���������� ����� � ������� ������. ")
	Talk(  5,  "�����: ��� ��������� ��� ������������ ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� ���������, 10 ��������� �������� ��������, 10 ������ ���������� ������� � ������� ������. ")
	Talk(  6,  "�����: ��� ��������� ��� �������� ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� �������, 10 ������ �����, 10 ������� ������ � ������� ������. ")
	Talk(  7,  "�����: ��� �������� ��� ���� ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� ����������, 10 ������� ��������, 10 ������ ���������� ������� � ������� ������. ")
	Talk(  8,  "�����: ��� �������� ��� �������� ���������� - 2 ��� ������ 20 ������, 1 ������ �����, 10 ��������� �����, 10 �������� ������ � ������� ������. ")
	Talk(  9,  "�����: ��� �������� ��� ����� ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� �������, 10 �������� ���� ��������, 10 ������ ���������� ����� � ������� ������. ")
	Talk(  10,  "�����: ��� �������� ��� ��� ���������� - 2 ��� ������ 20 ������, 1 ������������ ����� �����, 10 ������ ���������� �������� ���������, 10 ������ ����� � ������� ������. ")
	Talk(  11,  "�����: ��� �������� ����� �������� �� ����� �������� ����� ����� ������������. ��� ����� ���������� ���� 2 ��� ����� ������ 20 ������. ��� ���������� ��� ����� � ����� ������ ���� ����������� ��������� ����� �������� ����� �������� �� ������ ���� ���. ")

-----------eleven
	AddNpcMission ( 5019 )
	AddNpcMission ( 5032 )

	--------------------1.7
	AddNpcMission ( 5080	)
	AddNpcMission ( 5081	)
	AddNpcMission ( 5082	)
	AddNpcMission ( 5083	)
	AddNpcMission (5117 )
	AddNpcMission (5142 )
	AddNpcMission (5149 )
end 

------------------------------Ѱ����ʧ�İ���
function el_talk01()
	Talk( 1,  "��������� �����: ��������� ������, � �� ��������� � ���� ����... ")	
	AddNpcMission ( 907 )
	AddNpcMission ( 911 )
	AddNpcMission ( 912 )
	AddNpcMission ( 917 )
end
function el_talk02()
	Talk( 1,  "�������: � ������� ���� ��������... ")
	AddNpcMission ( 908 )
	AddNpcMission ( 909 )
	AddNpcMission ( 910 )
end
-----------------------------------------------------------
---����---��������
-----------------------------------------------------------
-------------------------------------��������
function el_talk03()
	Talk( 1,  "������������ ������: � �� ������� ��� �� ��� ������ �������������... ")	


	AddNpcMission ( 918 )
--------eleven
	AddNpcMission ( 5018 )
	AddNpcMission ( 5020 )
	AddNpcMission ( 5021)
	AddNpcMission ( 5022)
end
-----------------------------------------------------------
---������---���ص�¯��
-----------------------------------------------------------
function star_talk02 ()
	Talk( 1,  "���� ����������: ��� �� ��� ��������? ������� �� ������ ����� �������� ����? " )
	Text( 1,  "�������� ������� ", JumpPage, 2 )
	Text( 1,  "��������� ������� ������ ", OpenItemTiChun )
	Text( 1,  "������� ������� ", OpenItemEnergy )
	Text( 1,  "�������� �������� ", OpenGetStone )
	Text( 1,  "�������� ���������� ", OpenItemFix )
	Talk( 2,  "���� ����������: � ������ �� ���� �������� �� � ���. �������� ����. " )
	Text( 2,  "�� ��������� ������ ������, ������ ������� ������� � ���������� ����� 70 ������. ", JumpPage, 3)
	Text( 2,  "������ � ������� ������� ", JumpPage, 4 )
	Text( 2,  "������ � ������������ ��������� ", JumpPage, 5 )
	Text( 2,  "������ � ������� ������������ ", JumpPage, 6)
	Talk( 3,  "���� ����������: � ������� ���� ������� �� ������ �������� ����� ������, ����� ������� ������� ��� ���������� ����� 70 ������ � ����� ������ 75 ������. ����������� � ������� ��������� ����������. " )
	Talk( 4,  "���� ����������: �� ������ �������� ���� ������ ��������� ������ �������. �������� �������������� ������� �������� �������� �� 50 �� 1000 ������� �������, � �������������� ������������ �������� �������� �� 1500 ������� �������. ����� ������������� ������� ��������! " )
	Talk( 5,  "���� ����������: ���������� ��������� �� ����� ���� ������ ����. ������� ������������ ��������� ����� ����� ������ ������������ ���������. ����� ���������� ������� ������������ ��������� ����������� �� 1 �������. ���������� ������� ��������� ������� 1 ����� �������. ")
	Text( 5,  "������ ������������ ��������� ", JumpPage, 7 )
	Talk( 6,  "���� ����������: ������������� ����� ������ ������������ ����������� �����, �������� �����������, ������ ����, ������� ������������. �������������� ������� �������� ��������� ������������� 1 ���������� �����������. ������� ���������� ����������� ������ ���� ����� ������ ������������� �����������. " )
	Talk( 7,  "���� ����������: ������� ��� ������� � 3 ������� ��� �������. � ������ ����� �������� ������ 3 ������, �� ������ �������� �������� 2 ������ � � ������� ���� ������� ������� 1 ������. ��� ���������� �� ������� �������� ������ 3 ������, � � ������ ����� ����� �������� ������ 2 ������. ���������� ������ ���� � 1 ����� ����������. " )
end 
-----------------------------------------------------------
---����---������
-----------------------------------------------------------
function star_talk03 ()
	Talk( 1,  "�������: ������! ��������� �����? " )
	Text( 1,  "������ ��� ���� ", JumpPage, 2 )
	Text( 1,  "������ � ������� ", OpenTiger )
	Talk( 2,  "�������: ������ ���� ������� ������� 5 ����� ���. ������ �� ������ ����� ���������� ���. ��� ������ �� �������, ��� ���� ���� �� ������! " )
end 
--------------------------------------Ѫ�ȵĸ߸�Ь
function el_talk04 ()
	
	Talk( 1,  "����� �������: ��... ��... ��� �� ��� ������ ���... " )-------------(2249,2705)
	AddNpcMission ( 919 )
end

-----------------------------------------------------------
---ӡ�ڰ��ɡ���˹
-----------------------------------------------------------
function llleo_talk01()
	Talk( 1,  "������� �����: � ����� ����� ���� ������. �� ������ ����� �� ����?" )
	Text( 1,  "������ ������ ", JumpPage, 2)

	Talk( 2,  "������� �����: ����� ���� ��� ��� ������� ������� �� 2 ���������, � ������ �� ������ ���� � ������ �� 2 ��������� ������������. � ������ ���� ������ ������ ����������� �������� ������. ������ ������������� �� ����� � ���. ���� �� ������ ��� �����������, �� � ��� ������. " )
	Text( 2,  "����� ������ ", JumpPage, 3)
	
	Talk( 3,  "������� �����: �������������� ����������� ���������� ������� ��������� ���������� �������. ������ ������������� ���������� ��� ����� ������� �������� ���������� ���. ��� �� ���������� ������� ����� ���� - ���������� ����. " )
	Text( 3,  "����� ���������� ", JumpPage, 6)
	Text( 3,  "������� ������� ", JumpPage, 7)
	Text( 3,  "���� ������� ", JumpPage, 8)
	Text( 3,  "���������� ���������� ", JumpPage, 9)
	Text( 3,  "������� ���������� ", JumpPage, 10)
	Text( 3,  "������� ���������� ", JumpPage, 11)
	Text( 3,  "���� ���������� ", JumpPage, 12)
	Text( 3,  "������ --> ", JumpPage, 4)

	Talk( 4,  "������� �����: �������������� ����������� ���������� ������� ��������� ���������� �������. ������ ������������� ���������� ��� ����� ������� �������� ���������� ���. ��� �� ���������� ������� ����� ���� - ���������� ����. " )
	Text( 4,  "������ ���������� ", JumpPage, 13)
	Text( 4,  "���� ���������� ", JumpPage, 14)
	Text( 4,  "������ ���������� ", JumpPage, 15)
	Text( 4,  "������ ������� ", JumpPage, 16)
	Text( 4,  "����� ������� ", JumpPage, 17)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1909, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1909, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 788, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 6,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 6,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1927, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1927, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 806, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 7,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 7,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1923, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1923, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 802, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 8,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 8,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1894, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1894, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 773, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 9,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 9,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1905, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1905, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 784, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 10,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 10,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1901, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1901, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 780, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 11,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 11,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1913, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1913, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 792, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 12,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 12,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1897, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1897, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 776, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 13,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 13,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1887, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1887, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 766, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 14,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 14,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1890, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1890, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 769, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 15,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 15,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1919, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1919, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 798, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 16,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 16,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1916, 1 )
	TriggerCondition( 1, HasItem, 1028, 1 )
	TriggerCondition( 1, HasMoney, 800000 )
	TriggerAction( 1, TakeMoney, 800000 )
	TriggerAction( 1, TakeItem, 1916, 1 )
	TriggerAction( 1, TakeItem, 1028, 1  )
	TriggerAction( 1, GiveItem, 795, 1, 4 )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 17,  "������� �����: ��� ������ ������ � ����� �������� ��� ���������� - ������������ �������, 1 ���������� ���� � 800000 ������. " )
	Text( 17,  "����� ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 30,  "�������� �����: ��������, �� � ��� ��� ���� ����������� ���������. " )

end

function t_haos ()

	Talk( 1,  "������������� �����: � ��� �������� ���� ����������, � ���� ���������� �������� ��������. " )
	Text( 1,  "�������� ������ ������ ", JumpPage, 2)
	Text( 1,  "�������� ������� ", JumpPage ,7)
	Text( 1,  "���������� ��� ����� ", Garner2GetWiner)
	Text( 1,  "����� � ��� ����� ", Garner2RequestReorder)
	Text( 1,  "������ � ����� ����� ", JumpPage ,3)
	Text( 1,  "������ � ����� ������ ������� ", JumpPage ,13)

	Talk( 2,  "������������� �����: ����� �������� ������ ������ �� ������ ���� 25 ������ � ��������� 50000 ������. ������ ������ ���������� ��� ���� ������ � ��������� � ���. ����� ��������� �� ������ ����� ����������. " )
	InitTrigger()
	TriggerCondition( 1, LvCheck,  "> ", 25 )
	TriggerCondition( 1, HasMoney, 50000 )
	TriggerCondition( 1, NoItem, 3849, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerAction( 1, TakeMoney, 50000 )
	TriggerAction( 1, GiveItem, 3849, 1, 97 )
	TriggerFailure( 1, JumpPage, 23 )
	Text( 2,  "�������� ������ ������ ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 3,  "������������� �����: ����������� ��� ��������� ��������, ������ ����� � ������ ����� ���� ������ ����������. " )
	Text( 3, "������ � ����� ����� ",JumpPage ,4)
	Text( 3, "������ � ���������� ����� ",JumpPage ,6)


	Talk( 4,  "������������� �����: �� ������ �������� ���� ����� �������� ����������� �������� ������ ������. ��� ���� ������������ � ���� ������ ������. " )
	Talk( 23,  "������������� �����: �������� �� �� �� ��������� �� ����������. ����� �������� � ��� ��� ���� ������ ������. " )
	Talk( 6,  "������������� �����: ����� ����� �������� � ���� �������� ������ �����, �������� ���� ����� � �������� ���� �����. ��� ������� ������� ������ ����� �������� ������������ ����� � ����������� �� ��������� � ��� �����. " )

	Talk( 7,  "������������� �����: ����������� �� ���, ���� ������ �������� ������ ����. " )
	Text( 7, "�������� ����������� �������� ����� ",JumpPage ,8)
	Text( 7, "�������� ������ ����� ",JumpPage ,9)
	Text( 7, "�������� �� ������� ������ ����� ",JumpPage ,10)
	Text( 7, "�������� ���� ",SendExchangeXData)
	Text( 7, "�������� ������ ����� ",JumpPage ,12)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1031, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1031, 1 )
	TriggerAction( 1, GiveItem, 2609, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )

	Talk( 8,  "������������� �����: ���������� 1 ������ ������� ������ " )
	Text( 8,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1032, 1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1032, 1 )
	TriggerAction( 1, GiveItem, 1134, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )
	
	Talk( 9,  "Chaos ������������� �����: ���������� 1 ������� ������ ����� " )
	Text( 9,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	InitTrigger()
	TriggerCondition( 1, HasItem, 1031, 5 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 1031, 5 )
	TriggerAction( 1, GiveItem, 1032, 1, 4 )
	TriggerFailure( 1, JumpPage, 11 )

	Talk( 10,  "������������� �����: ���������� 5 ������ ������� ������" )
	Text( 10,  "�������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 11,  "������������� �����: ������� ���� ��� �������� ��� ����������� ��������. ����� �� �������� ���������� 1 ��������� ����� � ���������. " )

	Talk( 12,  "������������� �����: ������� ����� ��� ������ �����, �������� ������ � ������ �����������. ��� ������� ��� ��������� 200, 2000 � 20000 ����� ��������� ��������������. " )
	Text( 12,  "�������� ������ ����� ", Change_shanyao)
	Text( 12,  "�������� �������� ������ ", Change_rongyao)
	Text( 12,  "�������� ������ ����������� ", Change_huihuang)

	Talk( 13,  "������������� �����: ���� ������ ������� ��������� ������� �������� ��������� �������� �� ����� ����������. ����� ����� � ���� ������ ������� ����� ������ ���� ��� ������� 20 ������ � ������, � ��������� ���������� ������. " )

	--��������� �����
	AddNpcMission	(6268)
	AddNpcMission	(6269)

end 

function b_talk25 ()
	Popup( LifeSkillBegin , 3 )	

end 

function b_talk26 ()
	Popup( LifeSkillBegin , 2 )	

end 

function b_talk27 ()
	Popup( LifeSkillBegin , 0 )
end 

function b_talk28 ()
	Popup( LifeSkillBegin , 1 )	

end 

function leo_talkaa()
	Talk( 1,  "���������� ��� ���� �������! �������� �����������! " )
	Text( 1,  "���������� �������� ", SendExchangeXData)

	
	--�һ�������Ʒ ID,����,�һ�������Ʒ����,�����ֵ
	InitExchangeX()

	ExchangeDataX(	3989	,	99	,	3999	,	20	,	1)
	ExchangeDataX(	3990	,	99	,	4000	,	20	,	1)
	ExchangeDataX(	3991	,	99	,	4001	,	20	,	1)
	ExchangeDataX(	3992	,	99	,	4002	,	20	,	1)
	ExchangeDataX(	3993	,	99	,	4003	,	20	,	1)
	ExchangeDataX(	3994	,	99	,	4004	,	20	,	1)
	ExchangeDataX(	3995	,	99	,	4005	,	20	,	1)
	ExchangeDataX(	3996	,	99	,	4006	,	20	,	1)
	ExchangeDataX(	3997	,	99	,	4007	,	20	,	1)
	ExchangeDataX(	3998	,	99	,	4008	,	20	,	1)

end

function leo_talkbb()
	Talk( 1,  "������� ������! �� ��������� ���� �� ������ ��� ���� ������! " )
	Text( 1,  "� ���� ���� ������ ", SendExchangeXData)

	
	--�һ�������Ʒ ID,����,�һ�������Ʒ����,�����ֵ
	InitExchangeX()

	ExchangeDataX(	4029	,	99	,	4039	,	20	,	1)
	ExchangeDataX(	4030	,	99	,	4040	,	20	,	1)
	ExchangeDataX(	4031	,	99	,	4041	,	20	,	1)
	ExchangeDataX(	4032	,	99	,	4042	,	20	,	1)
	ExchangeDataX(	4033	,	99	,	4043	,	20	,	1)
	ExchangeDataX(	4034	,	99	,	4044	,	20	,	1)
	ExchangeDataX(	4035	,	99	,	4045	,	20	,	1)
	ExchangeDataX(	4036	,	99	,	4046	,	20	,	1)
	ExchangeDataX(	4037	,	99	,	4047	,	20	,	1)
	ExchangeDataX(	4038	,	99	,	4048	,	20	,	1)
	ExchangeDataX(	1670	,	99	,	1671	,	20	,	1)
	ExchangeDataX(	1668	,	99	,	3368	,	20	,	1)
	ExchangeDataX(	1667	,	99	,	3360	,	20	,	1)
	ExchangeDataX(	1642	,	99	,	1643	,	20	,	1)
	ExchangeDataX(	4825	,	99	,	1638	,	20	,	1)
	ExchangeDataX(	1633	,	99	,	1641	,	20	,	1)
	ExchangeDataX(	1782	,	99	,	1769	,	20	,	1)
	ExchangeDataX(	2815	,	99	,	1775	,	20	,	1)
	ExchangeDataX(	1674	,	99	,	1767	,	20	,	1)
	ExchangeDataX(	4832	,	99	,	2901	,	20	,	1)

end

function leo_talkcc ()
	Talk( 1,  "�� ��������� ������ � �������� ������� �����. �� ����������! ����� ��������� � ����." )
	Text( 1,  "����� ��������� �� ���� ����. ", SendExchangeXData)

	InitExchangeX()
	ExchangeDataX(	855	,	60	,	2617	,	1	,	1)
	ExchangeDataX(	2588	,	3	,	2619	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2622	,	1	,	1)
	ExchangeDataX(	2589	,	5	,	2624	,	1	,	1)
	ExchangeDataX(	2588	,	3	,	2640	,	1	,	1)
	ExchangeDataX(	855	,	60	,	2641	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2642	,	1	,	1)
	ExchangeDataX(	2588	,	20	,	2643	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2644	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2649	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1055	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1056	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1058	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1059	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1061	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1062	,	1	,	1)
	ExchangeDataX(	855	,	100	,	1064	,	1	,	1)
	ExchangeDataX(	2588	,	100	,	1065	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2680	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2681	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2682	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2683	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2684	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2685	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2690	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2691	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2692	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2693	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2694	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2695	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2700	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2701	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2702	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2703	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2704	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2705	,	1	,	1)
	ExchangeDataX(	855	,	10	,	2710	,	1	,	1)
	ExchangeDataX(	855	,	50	,	2711	,	1	,	1)
	ExchangeDataX(	855	,	300	,	2712	,	1	,	1)
	ExchangeDataX(	2588	,	10	,	2713	,	1	,	1)
	ExchangeDataX(	2588	,	50	,	2714	,	1	,	1)
	ExchangeDataX(	2588	,	300	,	2715	,	1	,	1)

end
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<�ϳɽ���Ա
-----����Ա-��
function max_talka1()
	Talk( 1,  "��������: ������, � ��������! � ���� ������ ��� � ����������, � �������� �� ����������� ��� ������������� ����������� ��� �������. " )
	Text( 1,  "��� �� ���������� ��� �������? ", JumpPage ,2)
	Text( 1,  "� ���� ������������ ����������? ", JumpPage ,7)
	Text( 1,  "��� �������� ����������? ", JumpPage ,3)
	Text( 1,  "��� ����� �������������? ", JumpPage ,4)
	Text( 1,  "�������, � ��� ���� ", JumpPage ,6)

	Talk( 2,  "��������: ���������� ��� ������� ��� ������������ ����������. �� ��������� �������� �������� ���������� ������ ��������. " )
	Text( 2,  "� ���� ������ ������ ������", JumpPage ,1)
	Text( 2,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 3,  "��������: �� ������ ����������� ���, ���������� � ����������� ��� �������. ����� ��������� ��� �������� � ���������� ������. � ��� ������ ���� ��������������� �����. " )
	Text( 3,  "��� ����� ���� ������ ����������? ", JumpPage ,5)
	Text( 3,  "�� ������� ��������� �����������? ", JumpPage ,9)
	Text( 3,  "� ���� ������ ������ ������ ", JumpPage ,1)
	Text( 3,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 4,  "��������: ������������� ����� ������� � ������. ������������� ������ ������������� �������� � ��������� ������ ���������. " )
	Text( 4,  "��� ����� �������� �����������? ", JumpPage ,8)
	Text( 4,  "� ���� ������ ������ ������", JumpPage ,1)
	Text( 4,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 5,  "��������: �� ����������, ������������� ����������� ���������� ���������. ������ ��� ������� �� ��������� ������������� ������� � �����������. ")
	Text( 5,  "� ���� ������ ������ ������ ", JumpPage ,1)
	Text( 5,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 6,  "��������: ������� � ��� ��� ������� ������! ")
	Text( 6,  "���������� ", CloseTalk)

	Talk( 7,  "��������: ������� �� ������. ������ ������� ��� �������� ������ ����������� �� ������� � �����������. ")
	Text( 7,  "� ���� ������ ������ ������ ", JumpPage ,1)
	Text( 7,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 8,  "��������: ������������ ����� �������� � ��������� ���������, � ����� ��� ������� �� ������. " )
	Text( 8,  "� ���� ������ ������ ������ ", JumpPage ,1)
	Text( 8,  "�������... �������� ������ ���. ", CloseTalk)

	Talk( 9,  "��������: ���������� ��� ����������� ��� ������� �������. ������ �� �������� ��� ������� ����������� ��� ������� ������ ���� �� ������ ������ ������ �������. " )
	Text( 9,  "� ���� ������ ������ ������ ", JumpPage ,1)
	Text( 9,  "�������... �������� ������ ���. ", CloseTalk)

end

-----��������
function max_talka2()
	Talk( 1,  "������� ������: ������! � ������� ������. ����� �� ����� � ���� ����� ��������� �������! ��� � ���� ������? " )
	Text( 1,  "� ���� ������ ��� � ���� �������� ", JumpPage ,2)
	Text( 1,  "� ���� �������� ���������? ", JumpPage ,3)
	Text( 1,  "�� ������ ������� ���� ��������? ", JumpPage ,4)
	Text( 1,  "��� ����� ����� ��� �� ������? ", JumpPage ,5)
	Text( 1,  "� ������ �������� ����... ", JumpPage ,6)

	Talk( 2,  "������� ������: ��� ������������� ���� ��� ��������� �����. ����� ����� ��������! " )
	Text( 2,  "������ ������ ������� ", JumpPage ,1)
	Text( 2,  "������� �������, � ��� �����. ", CloseTalk)

	Talk( 3,  "������� ������: ��, �������. �� ������� �� ������ ������� ��������������� �����. ����� ������ ����� ���������� � �����������. " )
	Text( 3,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 3,  "������� �������, � ��� �����. ", CloseTalk)

	Talk( 4,  " ������� ������: ��������� - ������� �����. �� ������ ��� ��������� ����������� �����. ����� ���������� ��� � ��������������� �������, ������ � ��� ����������. ����� ���������� ��������� ��������� ��� �����������. �� ��������� ����� ��� ���� ����� ��� �����������, ��� � �������! " )
	Text( 4,  "When will the fire be just nice? ", JumpPage ,7)
	Text( 4,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 4,  "������� �������, � ��� �����. ", CloseTalk)

	Talk( 5,  "������� ������: ���� ���� ��������� ��� ���������� �����������, �� ��� ����� �� ������ �������� ����, �� � ������ ����. " )
	Text( 5,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 5,  "������� �������, � ��� �����. ", CloseTalk)

	Talk( 6,  "������� ������: ������� � ��� ��� ������� �����������! ")
	Text( 6,  "I'm really just passing by ", CloseTalk)

	Talk( 7,  "������� ������: ����� ������ ��������� �� �������� �������� �� 75% ����� ����. �� ��������� �� ����! ")
	Text( 7,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 7,  "������� �������, � ��� �����. ", CloseTalk)

end

-----��¯��ʦ��÷��
function max_talka3()
	Talk( 1,  "����������� ����: ������! �� ����� ����? " )
	Text( 1,  "������� ��� ����� ������ ���� ", JumpPage ,2)
	Text( 1,  "��� ������������ ����? ", JumpPage ,3)
	Text( 1,  "������� ����� ���� ", JumpPage ,4)
	Text( 1,  "� ������ �������� ���� ", JumpPage ,5)


	Talk( 2,  "����������� ����: ���� ������������ ��� ������������ ����������. " )
	Text( 2,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 2,  "�������! � ��� �����. ", CloseTalk)

	Talk( 3,  "����������� ����: ����� ������������ ���� ��� ���������� ������� ����� �������. ����� ������ �� ������ ���������� � �����������. " )
	Text( 3,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 3,  "�������! � ��� �����. ", CloseTalk)

	Talk( 4,  "����������� ����: �� ������ ����� ��� � ��������������� �������. ����� ���� ��� ����������� ����������, ������ � ��� ����������� ����������. �� �������� ���������� ���������� � ���������� �������. " )
	Text( 4,  "��� ������ ������ ����? ", JumpPage ,7)
	Text( 4,  "�������! � ��� �����. ", CloseTalk)

	Talk( 7,  "����������� ����: � �������� ������������ �� ������ �������� �������� � ����������� ����������. ������ ��� ��������� �������� ���������� ���������� � ����� ������� ����� �������. " )
	Text( 7,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 7,  "�������! � ��� �����. ", CloseTalk)

	Talk( 5,  "����������� ����: �� ����? ��� ����� ��� �������? ")
	Text( 5,  "� ������ �������� ����... ", CloseTalk)

end

-----�о���
function max_talka4()
	Talk( 1,  "����������: ������! ��� � ���� ��� ��� �������? " )
	Text( 1,  "��� ��� ����� � ����?", JumpPage ,2)
	Text( 1,  "� ���� ������������ ��������� �������? ", JumpPage ,3)
	Text( 1,  "��� �������� ��������� �������? ", JumpPage ,4)
	Text( 1,  "��� ����� ���������� ���������? ", JumpPage ,5)
	Text( 1,  "� ������ ������� ���� ", JumpPage ,6)


	Talk( 2,  "����������: ��� ���� ��������� ����������� - ��������� ��������. �� ���������� ��� ��� ������� ��������. " )
	Text( 2,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 2,  "�������! � ��� �����. ", CloseTalk)

	Talk( 3,  "����������: ������� ������� ����� ������������. ����� ������ ����� ������ � �����������. " )
	Text( 3,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 3,  "�������! � ��� �����. ", CloseTalk)

	Talk( 4,  "����������: ��� ���������� ����� ��� � ��������������� �������. ����� ������� ����� ����������, ����� � ��� ����������� ����������. " )
	Text( 4,  "����� ����� ���� ���������? ", JumpPage ,7)
	Text( 4,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 4,  "�������! � ��� �����. ", CloseTalk)

	Talk( 5,  "����������: ����� ���������� ��������� ��������. ���� ��� ���������� ��������� � ���������� �������, �� �� �� ������ ������������ � ����������. " )
	Text( 5,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 5,  "�������! � ��� �����. ", CloseTalk)

	Talk( 6,  "����������: ������ ��� ��... ")
	Text( 6,  "� ������ ������� ����... ", CloseTalk)

	Talk( 7,  "����������: ��������� �� �� ���������, �� � ������� �� ������ ���������� ���������. ����� �������� �������� �������� ���� ������� ��������������� �����. ")
	Text( 7,  "� ���� ������ ������ ������� ", JumpPage ,1)
	Text( 7,  "�������! � ��� �����. ", CloseTalk)
end

---------------------ʥ����
function el_talk05 ()
	
	Talk( 1,  "�������������� ���: � ����� ����� ����! ������ ������ ���� ������� ��������������! " )
	Text( 1,  "�������� �������������� ",JumpPage, 2  )
	
	Talk ( 2,  "�������������� ���: �� ������ �������� ���� ��������������? ��� ��������� 1 �������������� �������� � 1000 ������. " )
	Text( 2,  "� ���� �������� ���� �������������� ",JumpPage, 3  )
	
	Talk( 3,  "�������������� ���: �� ����������� ��� ��� � ���� ����! ����� ��� ��������� �����! ")
	Text(3, "� ���� �������� �������������� ",  GetChaName_0, 1)
	Text( 3,  "������ --> ",JumpPage, 6  )

	Talk( 6,  "�������������� ���: �� ����������� ��� ��� � ���� ����! ����� ��� ��������� �����! ")
	Text(6, "� ���� �������� �������������� ",  GetChaName_1, 1)
	Text( 6,  "������ --> ",JumpPage, 7  )
	Text( 6,  "<-- ����� ",JumpPage, 3  )

	Talk( 7,  "�������������� ���: �� ����������� ��� ��� � ���� ����! ����� ��� ��������� �����! ")
	Text(7, "� ���� �������� �������������� ",  GetChaName_2, 1)
	Text( 7,  "������ --> ",JumpPage, 8  )
	Text( 7,  "<-- ����� ",JumpPage, 6  )

	Talk( 8,  "�������������� ���: �� ����������� ��� ��� � ���� ����! ����� ��� ��������� �����! ")
	Text(8, "� ���� �������� �������������� ",  GetChaName_3, 1)
	Text( 8,  "<-- ����� ",JumpPage, 7  )
---------------------------------------------------------------------------------------------------------------	
end

----------------------------------------����˹-------------------------
--------------------------------��į֮��6��(51300,26900)
--------------------------------------eleven------------------------------------------
function el_talk07 ()

	InitTrigger()
	TriggerCondition( 1, HasMission, 1300 )
	TriggerCondition( 1, LvCheck,  "> ", 74 )
	TriggerCondition( 1, HasCredit,9999 )
	TriggerCondition( 1, NoRecord, 1300 )
	TriggerCondition( 1, NoRecord, 1301 )
	TriggerAction( 1, JumpPage, 2 )
	TriggerFailure( 1, CloseTalk  )

	Talk( 1,  "���������: � ������ ������! �� ����������� �� ���� ���� � ���� ������ 75 ������ � 9999 ����� ���������. " )
	Text( 1,  "������! ",MultiTrigger, GetMultiTrigger(), 1 )

	Talk( 2,  "���������: ����� �������� ��������� �� ������ �������� �� ��������� ��������! ����� �� ���� ������� ������� � �������� ���������� ��������? " )
	Text( 2,  "���������� ��� ",JumpPage, 3  )
	Text( 2,  "��������� ����������� ",JumpPage, 4  )
	Text( 2,  "������� ������������ ",JumpPage, 3  )---------
	Text( 2,  "�������� ������ ",JumpPage, 32  )

	Talk( 3,  "���������: �� ������ ��� �����������! ������... ��� ����� �����? " )
	Text( 3,  "����� ",JumpPage, 4  )
	Text( 3,  "��� ",JumpPage, 32  )
	Text( 3,  "��������� ����� ",JumpPage,5  )
	Text( 3,  "�� ��� ",JumpPage, 2  )
	Text( 3,  "���� ",JumpPage, 4  )--------------
	Text( 3,  "�� ���� ���� ",JumpPage, 4  )

	Talk( 4,  "���������: ��� �� ���� �������������� �������� ������������ ��� ������������?" )
	Text( 4,  "������ ����� �������� � ������ ���� ",JumpPage, 5  )
	Text( 4,  "����� ��������� �������� � ���-�������� ",JumpPage, 5  )
	Text( 4,  "����� ��������� �������� � ���������� ",JumpPage, 2  )
	Text( 4,  "����� ����������� �������� � ������ ���� ",JumpPage, 32 )
	Text( 4,  "������� ����� �������. �������� ",JumpPage, 6  )
	Text( 4,  "���-�������� � ���������� ",JumpPage, 19  )-----------
	Text( 4,  "����� ��������� �������� ",JumpPage, 5  )


	Talk( 5,  "���������: �������� ������� �� ������������ ������� ���...? " )
	Text( 5,  "����������� ����� ",JumpPage, 32  )
	Text( 5,  "����� ����� ������ ",JumpPage, 6  )
	Text( 5,  "������ ����� ",JumpPage, 3  )
	Text( 5,  "�������� ����� ",JumpPage, 22  )----------
	Text( 5,  "��� ����� ������ ",JumpPage, 7  )
	Text( 5,  "����� ���� ",JumpPage, 7  )
	Text( 5,  "����� ������ ����� ",JumpPage, 32  )

	Talk( 6,  "���������: ����� ��������� ����� �������� � ����? " )
	Text( 6,  "���� � ��� ",JumpPage, 4  )
	Text( 6,  "��� � ���� ",JumpPage, 8  )
	Text( 6,  "������ ",JumpPage, 7  )
	Text( 6,  "������� ",JumpPage, 32  )
	Text( 6,  "��� ��������� ",JumpPage, 32  )
	Text( 6,  "������� ������������ ",JumpPage, 32  )
	Text( 6,  "������ ",JumpPage, 7  )-----------------
	Text( 6,  "������ ",JumpPage, 7  )

	Talk( 7,  "���������: ��� ���� ���������� ������������ �����? " )
	Text( 7,  "��� ������� ��� ",JumpPage, 32  )
	Text( 7,  "��� ������ ",JumpPage, 8  )----------
	Text( 7,  "��� ������� ",JumpPage, 9  )
	Text( 7,  "��� ���������� �������� ������� ",JumpPage, 5  )
	Text( 7,  "��� ������� ",JumpPage, 32  )

	Talk( 8,  "���������: ��� ����� ������� ������? " )
	Text( 8,  "�������� ",JumpPage, 3  )
	Text( 8,  "������� ���� ",JumpPage, 32  )
	Text( 8,  "�������������� ",JumpPage, 32  )
	Text( 8,  "������� ",JumpPage, 9  )--------
	Text( 8,  "���� ",JumpPage, 7  )
	Text( 8,  "���������� �������� ",JumpPage, 9  )

	Talk( 9,  "���������: ����� ����������� �� ���� ��������� ������? " )
	Text( 9,  "�� ������ �������� ������ ���� ",JumpPage, 4  )
	Text( 9,  "���� - ���������� ��� ���� �� ",JumpPage, 10 )-----------
	Text( 9,  "����� �� ����� ���� ������ ",JumpPage, 32  )
	Text( 9,  "���� �� ����� ������ ������������ ������� ",JumpPage, 23 )
	Text( 9,  "��������� ���� ��� ������ ������� ",JumpPage, 6  )

	Talk( 10,  "���������: �������� ������� ����� ��� �������. ��� ����...  " )
	Text( 10,  "10 ��� ����� ",JumpPage, 5  )
	Text( 10,  "������� ����� ",JumpPage, 5  )
	Text( 10,  "����� �� �������� ������������� ",JumpPage, 32 )
	Text( 10,  "����� �� ������ ������ � ������ ",JumpPage, 8  )
	Text( 10,  "������ ��� �� �������� � ����� ",JumpPage, 11  )-----------
	Text( 10,  "����� ���� ��� ��� ������ ������",JumpPage, 32  )
	Text( 10,  "����� ������ � ��������� ��������� ������� ����� ",JumpPage, 8  )


	Talk( 11,  "���������: ��� �� ������� ����� ��� �����? " )
	Text( 11,  "25 ������ ����������� ������ ",JumpPage, 32 )
	Text( 11,  "������ ������� ",JumpPage, 30  )
	Text( 11,  "�������� �������-�������� ",JumpPage, 13  )
	Text( 11,  "�������� ������� ������� ",JumpPage, 2  )
	Text( 11,  "���������� ����������� ������� ",JumpPage, 13  )---------------
	Text( 11,  "�������������� ���� ",JumpPage, 32  )
	Text( 11,  "��� ���������� �������. ",JumpPage, 28  )

	Talk( 30,  "���������: �� ����� ������� �������������!"  )
	Text( 30,  "����� --> ",JumpPage, 32  )
	Talk( 31,  "���������: �� ���������� �� ������ ��� �� ������� ���� �����!" )
	Text( 31,  "����� --> ",JumpPage, 32  )



	--Talk( 12,  "���������: Which of the below description is wrong? " )
	--Text( 12,  "Minelli is the High Priest's secretary ",JumpPage, 32 )
	--Text( 12,  "You can win Black Dragon equipment from Lucky Chance ",JumpPage, 3 )
	--Text( 12,  "Ditto knows how to concort the Reverse Love Potion. ",JumpPage,8 )
	--Text( 12,  "Roland is the most desired lover ",JumpPage, 10 )
	--Text( 12,  "Kentaro feels that Mas is a very clever person ",JumpPage, 13 )---------------
	--Text( 12,  "Horrific Cursed Corpse is near Ascaron at (360, 1340) ",JumpPage, 5 )
	--Text( 12,  "Merman Prince used to be just a frog ",JumpPage, 13 )
	--Text( 12,  "Minelli used to be Carsise's lover ",JumpPage, 13 )

	Talk( 13,  "���������: ��� �� ���� ���������� �������? " )
	Text( 13,  "����� ������� ���������� ��� ���������� ",JumpPage, 5 )
	Text( 13,  "������ �������� ����������� ���������� ",JumpPage, 3 )
	Text( 13,  "����� ������ �� ���������� ����� ���������� ��������� ",JumpPage, 32 )
	Text( 13,  "��������� ����������- ������� ��������*1000 ������ ",JumpPage, 14 )
	Text( 13,  "�� ������ ������ ��������� ������ �� 1 ����� ",JumpPage, 10 )
	Text( 13,  "������� ������������ ��������� ���� ��� ������������ � ���� ",JumpPage, 14 )-----------------
	Text( 13,  "��� ������������� ������� ",JumpPage, 8 )

	Talk( 14,  "���������: ��� ����� ����� ���������� ����? " )
	Text( 14,  "������� ",JumpPage, 4 )
	Text( 14,  "����� � ������������ ������� ",JumpPage, 32 )
	Text( 14,  "������� ������ � �������� ������ ",JumpPage, 7 )
	Text( 14,  "����� � ������������ ������� ",JumpPage, 15 )
	Text( 14,  "����� � ����� ",JumpPage, 15 )-----------------
	Text( 14,  "������������ ������� � ������� ����� ",JumpPage, 8 )
	Text( 14,  "������� � ������� ����� ",JumpPage, 12 )


	Talk( 15,  "���������: ����� �� ������������� ���� ����� �������� ������? " )
	Text( 15,  "����������������� ����� ",JumpPage,13 )
	Text( 15,  "���������� ������ ",JumpPage, 32 )
	Text( 15,  "������� ������ ",JumpPage, 16 )--------------
	Text( 15,  "���������� ����� ",JumpPage, 5 )
	Text( 15,  "��� ������ ",JumpPage, 4 )
	Text( 15,  "��������� ������� ���� ",JumpPage, 16 )
	Text( 15,  "�������� �������� ",JumpPage, 9 )

	Talk( 16,  "���������: ��� ���������? " )
	Text( 16,  "������������ �������: � ����� ����� ",JumpPage, 32 )
	Text( 16,  "������� ������: ����� ����� �� � ����. ",JumpPage, 17 )-----------
	Text( 16,  "�����: ������������ ������ �� � ���� ������.",JumpPage, 17 )
	Text( 16,  "�����: � ���� ���������� ������ ��� ����� ���������. ",JumpPage, 5 )
	Text( 16,  "���� ��: � ���� ��� �������� �� �����, ������� �� �������� ����. ",JumpPage, 10 )
	Text( 16,  "����� �������: � ���� �������� �� ������ ����� ",JumpPage, 15 )

	Talk( 17,  "���������: �� ������ ������ � ��� ����? " )
	Text( 17,  "����� ",JumpPage, 32 )
	Text( 17,  "� ����� ����� ",JumpPage, 32 )
	Text( 17,  "� ������ ",JumpPage, 32 )
	Text( 17,  "� �����! ",JumpPage, 32 )
	Text( 17,  "� �����!! ",JumpPage, 18 )-----------------
	Text( 17,  "� �����!!! ",JumpPage, 5 )
	Text( 17,  "���� ��� �����... ",JumpPage, 15 )

	Talk( 18,  "���������: ����� ������� �������� ����� ��������� ����? " )
	Text( 18,  "������� ",JumpPage, 5 )
	Text( 18,  "���������� � ���� ",JumpPage, 14 )
	Text( 18,  "������������ ",JumpPage, 2 )
	Text( 18,  "���� ",JumpPage, 9 )
	Text( 18,  "������ ",JumpPage, 12 )
	Text( 18,  "������ � �������� ���� ",JumpPage, 10 )
	Text( 18,  "������ � ������ ",JumpPage, 12 )------------------
	Text( 18,  "���� ���� ",JumpPage, 4 )


	Talk( 19,  "���������: �� ������� ������ ������ ������? " )
	Text( 19,  "� ������ ",JumpPage, 21  )
	Text( 19,  "� ������ ������� ",JumpPage, 20  )
	Text( 19,  "� ������ �������� ",JumpPage, 32  )

	Talk( 20,  "���������: ���������� �������� ����� " )
	Text( 20,  "������ -->",JumpPage, 3  )

	Talk( 21,  "���������: ����������� ��� ������� ��� ������! " )
	Text( 21,  "����������� ",JumpPage, 5  )

	Talk( 22,  "���������: �� ������� ������ ������ ������? " )
	Text( 22,  "� ������ ",JumpPage, 24  )
	Text( 22,  "� ������ ������� ",JumpPage, 20  )
	Text( 22,  "� ������ �������� ",JumpPage, 32  )


	Talk( 23,  "���������: �� ������� ������ ������ ������? " )
	Text( 23,  "� ������ ",JumpPage, 25  )
	Text( 23,  "� ������ ������� ",JumpPage, 8  )
	Text( 23,  "� ������ �������� ",JumpPage, 32  )

	Talk( 24,  "���������: ���� - ��� ������� ����� ����� �������! ")
	Text( 24,  "������ -->",JumpPage, 6   )
	Talk( 25,  "���������: ���������� ����������� ����. �� ������ ��������� ��� �� �����! ")
	Text( 25,  "������ -->",JumpPage, 32  )

	Talk( 26,  "���������: �� ������� ������ ������ ������? " )
	Text( 26,  "� ������ ",JumpPage, 28  )
	Text( 26,  "� ������ ������� ",JumpPage, 27  )
	Text( 26,  "� ������ �������� ",JumpPage, 32  )

	Talk( 27,  "���������: ��� �������� �������� ��� ���������� �����. "   )
	Text( 27,  "������ -->",JumpPage, 12  )

	Talk( 28,  "���������: �� ������� ������������. ��� �� ����������� ������. "  )
	Text( 28,  "������ -->",JumpPage, 32  )



	InitTrigger()
	TriggerCondition( 1, HasMission, 1300 )
	TriggerCondition( 1, NoRecord, 1300 )
	TriggerAction( 1, SetRecord, 1301 )
	TriggerAction( 1, JumpPage, 29 )
	
	Talk( 12,  "���������: � ����� ��� ������� ���������. �� ������ �����������? "  )
	Text( 12,  "���� ",MultiTrigger, GetMultiTrigger(), 1  )
	Text( 12,  "��� ",JumpPage, 2  )

	Talk( 29,  "���������: ����������! ���� �������� ������ ��� ���������! ����� � �������� ���� ����. " )

	Talk(32,  "���������: �� ��� �����? " )
	Text( 32,  "���, � ���� ����������� �����! ",JumpPage, 2  )
	Text( 32,  "� ������, ������� ����� ����. ",CloseTalk  )
	AddNpcMission	(6001)
	AddNpcMission	(6002)
	
		
end 
-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����˹



----------------------------------------����˹��ͼͼ-------------------------
--------------------------------ħ���������(26600,25900)
--------------------------------------eleven------------------------------------------

function el_talk08 ()


	Talk( 1,  "����� ����: �������������� ���! 3 ��� � 2 ���� � ������ �������. ��������� ������! " )
	 
	 AddNpcMission	(6010)
	AddNpcMission	(6011)
	AddNpcMission	(6012)
	AddNpcMission	(6013)
	AddNpcMission	(6014)

	end
	-----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<����˹��ͼͼ
	
	--��ʹ
	
function Leo_talkQ()
	Talk(1, "������������� �������, ������ � ����������! � ������ ��� ��������� � ����. ")
	Text(1, "������ ����������� ",JumpPage,2)
	Text(1, "������ ������ " , OpenGMSend)
	Text(1, "��������� ������ " , OpenGMRecv)
	
	Talk(2, "� �������� ����. � ������� �� ������� � ��������� ����� ������ �� ���. ������ �� ������ ����� ������ 256 ������ ��� 128 ����. ������������ �� ������ ������ ���� 1 ������. ���� �� �� �������� �� ���� ������ ������ ������ �� �� �������. ���������� ��������� ������� ������ ��������� ����! ")
	Text(2, "� ����� " , CloseTalk)
end


-------------------------bargi-----------------------------
function smzh_talk ()

Text( 1, "�������� � ������ ", GoTo, 891, 3575, "magicsea" )
Text( 1, "���������� �� ������� ", JumpPage, 2)

	Text( 2, "������� ", JumpPage, 3)
	Text( 2, "����� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "������� ", JumpPage, 5)
	Text( 3, "������������ ", JumpPage, 6)
	Text( 3, "������� �������� ", JumpPage, 7)
	Text( 3, "����� �������� ", JumpPage, 8)
	
	Talk( 4, "� ������ ������ ����� ������������: " )
	Text( 4, "������ ������� ", JumpPage, 9)
	Text( 4, "������ ������� ", JumpPage, 10)

	Talk( 5, "�������,����� ����������� - 5 �����,������ ���������� ���������: " )
	Text( 5, "�������� �� �������� +7 ", CloseTalk)
	Text( 5, "�������� �� ��� ", CloseTalk)
	Text( 5, "���� ���� ", CloseTalk)
	Text( 5, "������ ����� (10 ����) ", CloseTalk)
	Text( 5, "10 ��������� ", CloseTalk)
	Text( 5, "������ ������� ", CloseTalk)
	Text( 5, "������ ������������ 10 ����� ", CloseTalk)
	Text( 5, "������ ������������ 50 ����� ", CloseTalk)
	Text( 5, "������ ��������� ���������� ", CloseTalk)
	Text( 5, "������ ��������� ", CloseTalk)

	Talk( 6, "������������,����� ����������� - 5 �����,������ ���������� ���������: " )
	Text( 6, "�������� �� �������� +7 ", CloseTalk)
	Text( 6, "�������� �� ��� ", CloseTalk)
	Text( 6, "���� ���� ", CloseTalk)
	Text( 6, "������ ����� (10 ����) ", CloseTalk)
	Text( 6, "10 ��������� ", CloseTalk)
	Text( 6, "������ ������� ", CloseTalk)
	Text( 6, "������ ������������ 10 ����� ", CloseTalk)
	Text( 6, "������ ������������ 50 ����� ", CloseTalk)
	Text( 6, "������ ��������� ���������� ", CloseTalk)
	Text( 6, "������ ��������� ", CloseTalk)
	
	Talk( 7, "������� ��������,����� ����������� - 5 �����,������ ���������� ���������: " )
	Text( 7, "�������� �� �������� +7 ", CloseTalk)
	Text( 7, "�������� �� ��� ", CloseTalk)
	Text( 7, "���� ���� ", CloseTalk)
	Text( 7, "������ ����� (10 ����) ", CloseTalk)
	Text( 7, "10 ��������� ", CloseTalk)
	Text( 7, "������ ������� ", CloseTalk)
	Text( 7, "������ ������������ 10 ����� ", CloseTalk)
	Text( 7, "������ ������������ 50 ����� ", CloseTalk)
	Text( 7, "������ ��������� ���������� ", CloseTalk)
	Text( 7, "������ ��������� ", CloseTalk)
	
	Talk( 8, "����� ��������,����� ����������� - 5 �����,������ ���������� ���������: " )
	Text( 8, "�������� �� �������� +7 ", CloseTalk)
	Text( 8, "�������� �� ��� ", CloseTalk)
	Text( 8, "���� ���� ", CloseTalk)
	Text( 8, "������ ����� (10 ����) ", CloseTalk)
	Text( 8, "10 ��������� ", CloseTalk)
	Text( 8, "������ ������� ", CloseTalk)
	Text( 8, "������ ������������ 10 ����� ", CloseTalk)
	Text( 8, "������ ������������ 50 ����� ", CloseTalk)
	Text( 8, "������ ��������� ���������� ", CloseTalk)
	Text( 8, "������ ��������� ", CloseTalk)

	Talk( 9, "������ �������,����� ����������� - 40 �����,������ ���������� ���������: " )
	Text( 9, "����� ������ ������� ", CloseTalk)
	Text( 9, "������ ��������� ���������� ", CloseTalk)
	Text( 9, "������ ������������ 500 ����� ", CloseTalk)
	Text( 9, "���� ���������� ��������� ", CloseTalk)
	Text( 9, "������ ���������� ��������� ", CloseTalk)
	Text( 9, "50 ��������� ", CloseTalk)
	Text( 9, "������ ����� ", CloseTalk)
	Text( 9, "������ ����� (100 ����) ", CloseTalk)
	Text( 9, "������ ��������� ", CloseTalk)
	
	Talk( 10, "������ �������,����� ����������� - 1 ���,������ ���������� ���������: " )
	Text( 10, "������ ��������� ���������� ", CloseTalk)
	Text( 10, "�������� �� �������� +7 �� 1 �� 8 ����", CloseTalk)
	Text( 10, "�������� �� �������� +20 ", CloseTalk)
end 

function leo_talkzz ()
	Talk(1, "������! � ��� ���������. � ������� ������� ������ ��������� ��������. ")
	Text( 1, "�������� � ������ ������������ ",JumpPage,3)
	 
	Talk(3,  "������! � ��� �������� � ������ ������������? ����� ������ ���������. � ���� �� ������ ������������ ���� �����. ")
	Text( 3,  "������������ ",GetChaName_25, 1) 
end



function simplepro_01 () 

	Talk( 1, "������! � ���� ���� ������� ����� ���, � �� ��� �� ����� � ��������." )
	Text( 1, "���� ���� ", BuyPage)
	Text( 1,  "������� ��� ", OpenEidolonMetempsychosis )

	InitTrade()
	Weapon(	3918	)
	Weapon(	3919	)
	Weapon(	3920	)
	Weapon(	3921	)
	Weapon(	3922	)
	Weapon(	3924	)
	Weapon(	3925	)
	Defence(	0679	)
	Defence(	0244	)
	Defence(	0247	)
	Defence(	0250	)
	Defence(	0253	)
	Defence(	0260	)
	Defence(	0276	)
	Defence(	0277	)
	Defence(	0278	)
	Defence(	0279	)
	Defence(	0280	)
	Defence(	0578	)
 	Other( 4531 )
 	Other( 3435 )
 	Other( 4540 )
 	Other( 3443 )
 	Other( 1196 )
 	Other( 3436 )
 	Other( 4533 )
	Other( 3437 )
 	Other( 1253 )
 	Other( 3442 )
 	Other( 4537 )
 	Other( 3444 )
 	Other( 4530 )
 	Other( 3434 )




end

function ghfr()

	Talk(1, "������! ������ �����, ���� �� ������ �����������:")
	Text(1, "4 ������� ! ", GoTo, 153, 905, "jialebi")
	Text(1, "5 ������� !", GoTo, 27, 26, "hell") 
	Text(1, "6 ������� !", GoTo, 220, 26, "hell")
	Text(1, "7 ������� !", GoTo, 230, 150, "hell") 
	Text(1, "8 ������� !", GoTo, 110, 230, "hell")
  	Text(1, "�������� �������� ",JumpPage,2)
	Text(2, "10 ������� !", GoTo, 31, 31, "hell3")
	Text(2, "11 ������� !", GoTo, 153, 32, "hell3")
	Text(2, "12 ������� !", GoTo, 269, 30, "hell3")
	Text(2, "13 ������� !", GoTo, 30, 150, "hell3")
	Text(2, "14 ������� !", GoTo, 273, 151, "hell3")
  	Text(2, "�������� �������� ",JumpPage,3)
	Text(3, "15 ������� !", GoTo, 31, 269, "hell3")
	Text(3, "16 ������� !", GoTo, 150, 269, "hell3")
	Text(3, "17 ������� !", GoTo, 273, 266, "hell3")
	Text(3, "������ �� !", GoTo, 769, 667, "eastgoaf")
	Text(3, "����", CloseTalk)

end

function ghfr1()

	Talk(1, "������! ������ �����, ���� �� ������ �����������:")
	Text(1, "�������� ����� 2 ", GoTo, 35, 21, "lonetower") 
	Text(1, "�������� ����� 3 ", GoTo, 120, 406, "lonetower")
	Text(1, "�������� ����� 4 ", GoTo, 320, 175, "lonetower") 
	Text(1, "�������� ����� 5 ", GoTo, 483, 121, "lonetower")
	Text(1, "�������� ����� 6 ", GoTo, 494, 297, "lonetower")
	Text(3, "����", CloseTalk)

end

function ghfr2()

	Talk(1, "������! ������ �����, ���� �� ������ �����������:")
	Text(1, "��������� ���� ", GoTo, 1517, 3091, "garner")
	Text(1, "��������� ��� ", GoTo, 1007, 2966, "garner")
	Text(1, "�������� ", GoTo, 1120, 2773, "garner")
	Text(1, "������� ������� ", GoTo, 535, 2433, "garner")
	Text(1, "���������� ����� ", GoTo, 633, 2100, "garner")
	Text(3, "����", CloseTalk)

end

function ghfr7()

	Talk(1, "������! ������ �����, ���� �� ������ �����������:")
	Text(1, "����������� ����� ", GoTo, 1903, 2807, "garner")
	Text(3, "����", CloseTalk)

end


function lala ()

	Talk( 1,  "������, � ��������� ����� ����������� �����! " )
	Text( 1,  "�������� ����� ����������� ", SetSpawnPos,  "Arenaa")

end

function ghfr10()

	Talk(1, "������! ������ �����, ���� �� ������ �����������:")
	Text(1, "����������� ����� ", GoTo, 2232, 2787, "garner")
	Text(1, "����", CloseTalk)

end

function r_bilet ()
	
	Talk( 1,  "������:������! ������������� ������� ��������? �������... " )
	Text( 1,  "���� ", BuyPage )
   
	Weapon(	3296	)
	Weapon(	3226    )
	Weapon(	3225	)
	Weapon(	2689	)
	Weapon(	2699	)
	Weapon(	3288	)
	Defence( 3279	)

AddNpcMission	(221)
AddNpcMission	(222)

end

function leo_talkaa()
	Talk( 1,  "���������� ��� ���� �������! �������� �����������! " )
	Text( 1,  "���������� �������� ", SendExchangeXData)

	
	--�һ�������Ʒ ID,����,�һ�������Ʒ����,�����ֵ
	InitExchangeX()

	ExchangeDataX(	3989	,	99	,	3999	,	20	,	1)
	ExchangeDataX(	3990	,	99	,	4000	,	20	,	1)
	ExchangeDataX(	3991	,	99	,	4001	,	20	,	1)
	ExchangeDataX(	3992	,	99	,	4002	,	20	,	1)
	ExchangeDataX(	3993	,	99	,	4003	,	20	,	1)
	ExchangeDataX(	3994	,	99	,	4004	,	20	,	1)
	ExchangeDataX(	3995	,	99	,	4005	,	20	,	1)
	ExchangeDataX(	3996	,	99	,	4006	,	20	,	1)
	ExchangeDataX(	3997	,	99	,	4007	,	20	,	1)
	ExchangeDataX(	3998	,	99	,	4008	,	20	,	1)

end

function t_ecxange ()
Talk( 1, "����������: ����������� ����, ����� ���� ������ ��������� � �������� ����� ����� � ��� �� ����� ������ �� ���������� ������� � ����������,������ ����� ������� " )
--Text( 1, "���������� �����������. ", SendExchangeData)
Text( 1, "��� ", CloseTalk)
    InitExchange() 
    ExchangeData(    7459    ,    1    ,    2842    ,    1    ,    1) 
	ExchangeData(    3457    ,    500    ,    7487    ,    1    ,    1)
	ExchangeData(    7461    ,    1    ,    7488    ,    1    ,    1) 
	ExchangeData(    7461    ,    1    ,    7531    ,    1    ,    1) 
	ExchangeData(    7498    ,    1    ,    7497    ,    1    ,    1) 
	ExchangeData(    7499    ,    1    ,    7500    ,    1    ,    1) 
	
end

function t_jora ()   
Talk( 1, "����������� ����, �����!_��� ���� ������? ")    
Text( 1, "������ ������ (100 �������) ",JumpPage,2)
Text( 1, "���������� ������ (100 �������) ",JumpPage,3)
Text( 1, "����. ", CloseTalk )


Talk(2,"�������� ������ ������ ����� ������ 250 ��� ����,100 ׸���� ��������,1 ����� �������� ����� �������,100 ��������� � 10.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,250 )
TriggerCondition( 1, HasItem,3362,100 )
TriggerCondition( 1, HasItem,7704,1 )
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasMoney, 10000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,250 )
TriggerAction( 1, TakeItem, 3362,100 )
TriggerAction( 1, TakeItem, 7704,1 )
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, TakeMoney, 10000000 )
TriggerAction( 1, GiveItem, 2842,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 4)
Text(2,"�������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(3,"�������� ���������� ������ ����� ������ 500 ��� ����,100 ׸���� ��������,1 ����� ��������� ����������,100 ��������� � 10.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 )
TriggerCondition( 1, HasItem,3362,100 )
TriggerCondition( 1, HasItem,7761,1 )
TriggerCondition( 1, HasCredit, 100 )
TriggerCondition( 1, HasMoney, 10000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,500 )
TriggerAction( 1, TakeItem, 3362,100 )
TriggerAction( 1, TakeItem, 7761,1 )
TriggerAction( 1, DelRoleCredit, 100 )
TriggerAction( 1, TakeMoney, 10000000 )
TriggerAction( 1, GiveItem, 7487,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 4)
Text(3,"�������� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 4, "�� ������� ����... " )
Text( 4, "����. ", CloseTalk )

AddNpcMission	(990)
AddNpcMission	(999)
AddNpcMission	(1000)
AddNpcMission	(217)
AddNpcMission	(218)
AddNpcMission	(219)
AddNpcMission	(220)
end

function r_kacer ()
	
Talk( 1, " �������? " )

InitTrigger()
TriggerCondition( 1, HasMoney, 0 )
TriggerAction( 1, TakeMoney, 0 )
TriggerAction( 1, AddExp, 9000000 )

Text( 1, " ����� ", MultiTrigger, GetMultiTrigger(), 1)

end

function t_puct ()   
Talk( 1, " ����������,� ����� ����� ��� ��� ��������� ����� � ���� ������ ���-�� �� ������� ")    
Text( 1, " �����,������� ", JumpPage, 3)

end

function t_bija ()   
Talk( 1, "���� �� � �� ������� ������-�����,�� ������ �� �� �����������... ")    
Text( 1, "������ ����� ", JumpPage, 5)
Text( 1, "������ �������� ", JumpPage, 3)
Text( 1, "������ ������ ", JumpPage, 4)



Talk(3," ����� 900 �����,300 ׸���� ��������,150 ����,1 ����� �������� �����,3 ����� �����,200 ��������� � 20.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 )
TriggerCondition( 1, HasItem,3362,300 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,3 )
TriggerCondition( 1, HasItem,4441,150 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,900 )
TriggerAction( 1, TakeItem, 3362,300 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,3 )
TriggerAction( 1, TakeItem, 4441,150 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7755,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," ���� ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," ����� 450 �����,150 ׸���� ��������,75 ����,1 ����� �������� �����,1 ����� �����,200 ��������� � 20.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,450 )
TriggerCondition( 1, HasItem,3362,150 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,1 )
TriggerCondition( 1, HasItem,4441,75 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3457,450 )
TriggerAction( 1, TakeItem, 3362,150 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,1 )
TriggerAction( 1, TakeItem, 4441,75 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7754,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4," ���� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 200 ��������,200 ����,1 ����� �������� �����,1 ����� ������ �������,2 ����� �����,200 ���������,� 20.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,1728,200 )
TriggerCondition( 1, HasItem,4441,200 )
TriggerCondition( 1, HasItem,7458,1 )
TriggerCondition( 1, HasItem,7762,2 )
TriggerCondition( 1, HasItem,7461,1 )
TriggerCondition( 1, HasCredit, 200 )
TriggerCondition( 1, HasMoney, 20000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 1728,200 )
TriggerAction( 1, TakeItem, 4441,200 )
TriggerAction( 1, TakeItem, 7458,1 )
TriggerAction( 1, TakeItem, 7762,2 )
TriggerAction( 1, TakeItem, 7461,1 )
TriggerAction( 1, DelRoleCredit, 200 )
TriggerAction( 1, TakeMoney, 20000000 )
TriggerAction( 1, GiveItem, 7753,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(5," ���� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," �� ������� ����! " )

end

function t_new ()   
Talk( 1, " �����������! ���� ��� � �� ���� ����� � �����,������ ����� ���� ������������ ����� � ������� ")    
Text( 1, " ����������� ", JumpPage, 3)
end

function t_tolik ()   
Talk( 1, " ������,���� ���������� ������ ��������� ���� ������ ")    
Text( 1, " ������ ", JumpPage, 3)

	AddNpcMission ( 207 )
	AddNpcMission ( 208 )
	AddNpcMission ( 209 )
	AddNpcMission ( 212 )
	AddNpcMission ( 213 )
	AddNpcMission ( 216 )
	AddNpcMission ( 2019 )--��� ������ �� ��������
	AddNpcMission ( 2020 )--��� ����������
	AddNpcMission ( 2021 )--��� ����
	AddNpcMission ( 2022 )--��� �������� � ���������
end



function t_weaponsabs ()   
Talk( 1, " ����������,� ���� �������� ��������� ����� ����! ")    
Text( 1, " ������ ��������� ", JumpPage, 3)
Text( 1, " ���������� ��������� ", JumpPage, 4)



Talk(3," �� ������ �������� ������ ���������?���� ������, ������� ��� ���� �����,�����,�����,��,�� � ��� �� 1 �����,5 ���� �������,5 ���� �������,1 ���� ���������,600 ��������� � 60.000.000 ������,� ����� � ��� ���� ���.���� �� ������ ����� ������ ��������� � ����� (882,3580) ")
InitTrigger()
TriggerCondition( 1, HasItem,2927,1 )
TriggerCondition( 1, HasItem,2928,1 )
TriggerCondition( 1, HasItem,2929,1 )
TriggerCondition( 1, HasItem,2930,1 )
TriggerCondition( 1, HasItem,2931,1 )
TriggerCondition( 1, HasItem,2932,1 )
TriggerCondition( 1, HasItem,7666,5 )
TriggerCondition( 1, HasItem,7781,5 )
TriggerCondition( 1, HasItem,7786,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2927,1 )
TriggerAction( 1, TakeItem, 2928,1 )
TriggerAction( 1, TakeItem, 2929,1 )
TriggerAction( 1, TakeItem, 2930,1 )
TriggerAction( 1, TakeItem, 2931,1 )
TriggerAction( 1, TakeItem, 2932,1 )
TriggerAction( 1, TakeItem, 7666,5 )
TriggerAction( 1, TakeItem, 7781,5 )
TriggerAction( 1, TakeItem, 7786,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7687,1,1 )
TriggerFailure( 1, JumpPage, 8)
Text(3," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," �� ������ �������� ����� ���������?����� ���� ����� �������� ��� �������� �����,�����(����),�����(���������),�����(���),�����(���),������������,��������,������������� �� 1 �����,600 ��������� �  60.000.000 � �� �������� ���.���� �� ������ ����� ������ ��������� � ����� (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7778,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 8)
Text(5," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," �� ������ �������� �������� ���������?����� ���� ����� �������� ��� �������� �����,�����(����),�����(���������),�����(���),�����(���),������������,��������,������������� �� 1 �����,600 ��������� �  60.000.000 � �� �������� ���.���� �� ������ ����� ������ ��������� � ����� (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7779,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 8)
Text(6," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," �� ������ �������� ������� ���������?����� ���� ����� �������� ��� �������� �����,�����(����),�����(���������),�����(���),�����(���),������������,��������,������������� �� 1 �����,600 ��������� �  60.000.000 � �� �������� ���.���� �� ������ ����� ������ ��������� � ����� (882,3580) " )
InitTrigger()
TriggerCondition( 1, HasItem,2846,1 )
TriggerCondition( 1, HasItem,2847,1 )
TriggerCondition( 1, HasItem,2848,1 )
TriggerCondition( 1, HasItem,2849,1 )
TriggerCondition( 1, HasItem,2850,1 )
TriggerCondition( 1, HasItem,2851,1 )
TriggerCondition( 1, HasItem,2852,1 )
TriggerCondition( 1, HasItem,2853,1 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 2846,1 )
TriggerAction( 1, TakeItem, 2847,1 )
TriggerAction( 1, TakeItem, 2848,1 )
TriggerAction( 1, TakeItem, 2849,1 )
TriggerAction( 1, TakeItem, 2850,1 )
TriggerAction( 1, TakeItem, 2851,1 )
TriggerAction( 1, TakeItem, 2852,1 )
TriggerAction( 1, TakeItem, 2853,1 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7780,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 8)
Text(7," �������� ",MultiTrigger,GetMultiTrigger(),1)



Talk(4," ��� ���� ����������? " )
Text(4," ����� ", JumpPage, 5)
Text(4," �������� ", JumpPage, 6)
Text(4," ������� ", JumpPage, 7)


Talk(8," �� ������� ����! " )
end

function t_abbbijewap ()   
Talk( 1, " �����������,� ���� ���� ���� ���������...  ")    
Text( 1, " ����� ��������� (600 �������) ", JumpPage, 3)
Text( 1, " ��������� ��������� (600 �������) ", JumpPage, 4)
Text( 1, " ������ ��������� (600 �������) ", JumpPage, 5)



Talk(3," ���...����� ��������� ����� ������,�� �� ����� ABADDON � 50 ������ ������ � ����� ���� ���� ���,�� �� � ��� �� ������ 600 ��������� � 60.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,3850,2 )
TriggerCondition( 1, HasItem,3851,1 )
TriggerCondition( 1, HasItem,3853,2 )
TriggerCondition( 1, HasItem,3864,1 )
TriggerCondition( 1, HasItem,3863,1 )
TriggerCondition( 1, HasItem,2857,50 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3850,2 )
TriggerAction( 1, TakeItem, 3851,1 )
TriggerAction( 1, TakeItem, 3853,2 )
TriggerAction( 1, TakeItem, 3864,1 )
TriggerAction( 1, TakeItem, 3863,1 )
TriggerAction( 1, TakeItem, 2857,50 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7665,1,1 )
TriggerFailure( 1, JumpPage, 6)
Text(3," �������� ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," ���� ���������� ���� ������ �������� ���� ������� ���������,�� ��������� ���������,�� � ����� �� ��� �������� 5 ���� ��������, 50 ������ ������,�� 5 ��� ������� ���������(�� �� ������� ����� � ������ �������� 1-4),� ������� �� ���� ����� BIJA,� ��� �� �� �������� 600 ��������� � 60.000.000 ������,�� � ���������� ���� �� " )
InitTrigger()
TriggerCondition( 1, HasItem,7463,5 )
TriggerCondition( 1, HasItem,6231,5 )
TriggerCondition( 1, HasItem,6232,5 )
TriggerCondition( 1, HasItem,6233,5 )
TriggerCondition( 1, HasItem,6234,5 )
TriggerCondition( 1, HasItem,3851,1 )
TriggerCondition( 1, HasItem,3858,1 )
TriggerCondition( 1, HasItem,3859,1 )
TriggerCondition( 1, HasItem,3850,1 )
TriggerCondition( 1, HasItem,2857,50 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7463,5 )
TriggerAction( 1, TakeItem, 6231,5 )
TriggerAction( 1, TakeItem, 6232,5 )
TriggerAction( 1, TakeItem, 6233,5 )
TriggerAction( 1, TakeItem, 6234,5 )
TriggerAction( 1, TakeItem, 3851,1 )
TriggerAction( 1, TakeItem, 3858,1 )
TriggerAction( 1, TakeItem, 3859,1 )
TriggerAction( 1, TakeItem, 3850,1 )
TriggerAction( 1, TakeItem, 2857,50 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7664,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 6)
Text(4," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ������ �������� ��� ������� ������ �� ������ ���������? �� 25 ������ ������,5 ���� ��������,�� 2 ���� ������� ���������(����� ����� � ������ �������� 1-4) 600 ��������� �    60.000.000 � ������ � " )
InitTrigger()
TriggerCondition( 1, HasItem,2857,25 )
TriggerCondition( 1, HasItem,7463,5 )
TriggerCondition( 1, HasItem,6231,2 )
TriggerCondition( 1, HasItem,6232,2 )
TriggerCondition( 1, HasItem,6233,2 )
TriggerCondition( 1, HasItem,6234,2 )
TriggerCondition( 1, HasCredit, 600 )
TriggerCondition( 1, HasMoney, 60000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 2857,25 )
TriggerAction( 1, TakeItem, 7463,5 )
TriggerAction( 1, TakeItem, 6231,2 )
TriggerAction( 1, TakeItem, 6232,2 )
TriggerAction( 1, TakeItem, 6233,2 )
TriggerAction( 1, TakeItem, 6234,2 )
TriggerAction( 1, DelRoleCredit, 600 )
TriggerAction( 1, TakeMoney, 60000000 )
TriggerAction( 1, GiveItem, 7663,1,1 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 6)
Text(5," �������� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," �� ������� ����! " )
	

end 

function t_ecxang743 ()   
Talk( 1, " ��� ������� ����� ������ � ����� ������� ")    
Text( 1, " ������ ������� ������������ ", JumpPage, 3)
Text( 1, " ������ ������� ������������ ", JumpPage, 4)
Text( 1, " ������ �������� ������������ ", JumpPage, 5)


Talk(3," � ���� �� ���� 20 ���� �������,���� �����,���� ����� � ���� ��������.3 ����� ����� �����.�� 1 ����� ����������� � ���������� �����.�� ���� ���� �� ��� ��� �� ��������� 50 �������� ����� (1000��),15.000 ���������,50 ���� �����,50 ���� ����� � 5 ������������ �����.�� ��, �� ������ ��� 100.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,7654,20 )
TriggerCondition( 1, HasItem,7652,20 )
TriggerCondition( 1, HasItem,7653,20 )
TriggerCondition( 1, HasItem,7463,20 )
TriggerCondition( 1, HasItem,7632,3 )
TriggerCondition( 1, HasItem,7630,1 )
TriggerCondition( 1, HasItem,7631,1 )
TriggerCondition( 1, HasItem,7746,50 )
TriggerCondition( 1, HasItem,7621,50 )
TriggerCondition( 1, HasItem,7626,50 )
TriggerCondition( 1, HasItem,7614,5 )
TriggerCondition( 1, HasCredit, 15000 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7654,20 )
TriggerAction( 1, TakeItem, 7652,20 )
TriggerAction( 1, TakeItem, 7653,20 )
TriggerAction( 1, TakeItem, 7463,20)
TriggerAction( 1, TakeItem, 7632,3 )
TriggerAction( 1, TakeItem, 7630,1 )
TriggerAction( 1, TakeItem, 7631,1 )
TriggerAction( 1, TakeItem, 7746,50 )
TriggerAction( 1, TakeItem, 7621,50 )
TriggerAction( 1, TakeItem, 7626,50 )
TriggerAction( 1, TakeItem, 7614,5 )
TriggerAction( 1, DelRoleCredit, 15000 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, GiveItem, 2235,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," ���� �� ������,����� ���� ��� �� 1 ����� �����,�����,����� �����,����������� �����,���������� �����.�� 2 ����� ������� ��������,����,��������� ����,�������� �������,������� ��������,�������� �����,������ � �����.� 5 ���� �������,� ��� �� 100 ���� �����,100 ���� ����� � 25.000 ��������� " )
InitTrigger()
TriggerCondition( 1, HasItem,7652,1 )
TriggerCondition( 1, HasItem,7653,1 )
TriggerCondition( 1, HasItem,7630,1 )
TriggerCondition( 1, HasItem,7631,1 )
TriggerCondition( 1, HasItem,7632,1 )
TriggerCondition( 1, HasItem,7642,2 )
TriggerCondition( 1, HasItem,7648,2 )
TriggerCondition( 1, HasItem,7647,2 )
TriggerCondition( 1, HasItem,7649,2 )
TriggerCondition( 1, HasItem,7650,2 )
TriggerCondition( 1, HasItem,7651,2 )
TriggerCondition( 1, HasItem,7634,2 )
TriggerCondition( 1, HasItem,7635,2 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7621,100 )
TriggerCondition( 1, HasItem,7626,100 )
TriggerCondition( 1, HasCredit, 25000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7652,1 )
TriggerAction( 1, TakeItem, 7653,1 )
TriggerAction( 1, TakeItem, 7630,1 )
TriggerAction( 1, TakeItem, 7631,1 )
TriggerAction( 1, TakeItem, 7632,1 )
TriggerAction( 1, TakeItem, 7642,2 )
TriggerAction( 1, TakeItem, 7648,2 )
TriggerAction( 1, TakeItem, 7647,2 )
TriggerAction( 1, TakeItem, 7649,2 )
TriggerAction( 1, TakeItem, 7650,2 )
TriggerAction( 1, TakeItem, 7651,2 )
TriggerAction( 1, TakeItem, 7634,2 )
TriggerAction( 1, TakeItem, 7635,2 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7621,100 )
TriggerAction( 1, TakeItem, 7626,100 )
TriggerAction( 1, DelRoleCredit, 25000 )
TriggerAction( 1, GiveItem, 6949,1,4 )
TriggerFailure( 1, JumpPage, 6)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ������ ������� ����� ������ ����� " )

Talk(6," �� ������� ����! " )

end


function t_dragset ()   
Talk( 1, "�������� � ���,�� �������� ����� ������ ��������� �������,�� ��� �� �� ������� �� ������ �������� � �������� ��� ��� ���?� � ����� ������ ������� ��,��� ���� ������� .� ���� ���� ���� �������� �������,����� ������,��� ������ ���� ������� ����� ������� ")    
Text( 1, "������ ������� (������� 1000) ", JumpPage, 3)
Text( 1, "�������� ������� (������� 1000) ", JumpPage, 4)
Text( 1, "������� ������� (������� 1000) ", JumpPage, 5)
Text( 1, "����� ������� (������� 1000) ", JumpPage, 6)
Text( 1, "������ ������� (������� 1000) ", JumpPage, 7)
Text( 1, "��������� ������� (������� 1000) ", JumpPage, 8)

Talk(3,"���������� ������? ������ �������� 500 ��� �������,1000 ׸���� ��������(������ ��������),5000 �����.10 ���� �������(����).�� 10 ���� ��������� ����,����,�������� �������,������� �������� � �������� �����,� ��� �� 1000 ��������� � 100.000.000 ������ ")
InitTrigger()
TriggerCondition( 1, HasItem,7646,500 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,5000 )
TriggerCondition( 1, HasItem,7647,10 )
TriggerCondition( 1, HasItem,7654,10 )
TriggerCondition( 1, HasItem,7648,10 )
TriggerCondition( 1, HasItem,7649,10 )
TriggerCondition( 1, HasItem,7650,10 )
TriggerCondition( 1, HasItem,7651,10 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,500 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,5000 )
TriggerAction( 1, TakeItem, 7647,10 )
TriggerAction( 1, TakeItem, 7654,10 )
TriggerAction( 1, TakeItem, 7648,10 )
TriggerAction( 1, TakeItem, 7649,10 )
TriggerAction( 1, TakeItem, 7650,10 )
TriggerAction( 1, TakeItem, 7651,10 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7800,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(3,"����� ",MultiTrigger,GetMultiTrigger(),1)


Talk(4,"��� �������� ����� �������� 250 ��� �������,1000 ׸���� ��������(������ ��������),2500 �����.5 ���� �������(����).�� 5 ���� ��������� ����,����,�������� �������,������� �������� � �������� �����,� ��� �� 1000 ��������� � 100.000.000 ������  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,250 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,250 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7801,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(4,"����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"���� ������� �������,����� ����� �������� 250 ��� �������,1000 ׸���� ��������(������ ��������),2500 �����.5 ���� �������(����).�� 5 ���� ��������� ����,����,�������� �������,������� �������� � �������� �����,� ��� �� 1000 ��������� � � 100.000.000 ������  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,250 )
TriggerCondition( 1, HasItem,3362,1000 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,250 )
TriggerAction( 1, TakeItem, 3362,1000 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7802,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(5,"����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6,"��� ����� ����� �������� 300 ��� �������.10 ���� �������(����).�� 3 ����� ��������� ����,����,�������� �������,������� �������� � �������� �����,� ��� �� 1000 ��������� � 100.000.000 ������  " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,300 )
TriggerCondition( 1, HasItem,7654,10 )
TriggerCondition( 1, HasItem,7647,3 )
TriggerCondition( 1, HasItem,7648,3 )
TriggerCondition( 1, HasItem,7649,3 )
TriggerCondition( 1, HasItem,7650,3 )
TriggerCondition( 1, HasItem,7651,3 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,300 )
TriggerAction( 1, TakeItem, 7654,10 )
TriggerAction( 1, TakeItem, 7647,3 )
TriggerAction( 1, TakeItem, 7648,3 )
TriggerAction( 1, TakeItem, 7649,3 )
TriggerAction( 1, TakeItem, 7650,3 )
TriggerAction( 1, TakeItem, 7651,3 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7799,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(6," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(7,"��� ������ ���� �����������,300 ��� �������,5 ���� �������(����).�� 3 ����� ��������� ����,����,�������� �������,������� �������� � �������� �����,1000 ��������� � 100.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7646,300 )
TriggerCondition( 1, HasItem,7654,5 )
TriggerCondition( 1, HasItem,7647,3 )
TriggerCondition( 1, HasItem,7648,3 )
TriggerCondition( 1, HasItem,7649,3 )
TriggerCondition( 1, HasItem,7650,3 )
TriggerCondition( 1, HasItem,7651,3 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7646,300 )
TriggerAction( 1, TakeItem, 7654,5 )
TriggerAction( 1, TakeItem, 7647,3 )
TriggerAction( 1, TakeItem, 7648,3 )
TriggerAction( 1, TakeItem, 7649,3 )
TriggerAction( 1, TakeItem, 7650,3 )
TriggerAction( 1, TakeItem, 7651,3 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7797,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(8,"��� �������� ���� �����������,500 ������������ ����� �������,500 ��� �������,20 ���� �������(����).�� 5 ����� ��������� ����,����,�������� �������,������� �������� � �������� �����,1000 ��������� � 100.000.000 ������  " )
InitTrigger()
TriggerCondition( 1, HasItem,3067,500 )
TriggerCondition( 1, HasItem,7646,500 )
TriggerCondition( 1, HasItem,7654,20 )
TriggerCondition( 1, HasItem,7647,5 )
TriggerCondition( 1, HasItem,7648,5 )
TriggerCondition( 1, HasItem,7649,5 )
TriggerCondition( 1, HasItem,7650,5 )
TriggerCondition( 1, HasItem,7651,5 )
TriggerCondition( 1, HasMoney, 100000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 3067,500 )
TriggerAction( 1, TakeItem, 7646,500 )
TriggerAction( 1, TakeItem, 7654,20 )
TriggerAction( 1, TakeItem, 7647,5 )
TriggerAction( 1, TakeItem, 7648,5 )
TriggerAction( 1, TakeItem, 7649,5 )
TriggerAction( 1, TakeItem, 7650,5 )
TriggerAction( 1, TakeItem, 7651,5 )
TriggerAction( 1, TakeMoney, 100000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 7798,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(8,"���� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11,"�� ������� ����! " )

end

function t_gamplaw ()   

Talk( 1, "������,���� �� �������� ��� 50 ������ ����� � 5000 ���������,�� � ��� ������ ��� ����� �������� ������� �� ������� �����! " ) 
Text( 1, "����� ", JumpPage, 3)
Text( 1, "��������� ����� ", JumpPage, 5)

Talk(3," �����, ����� ��� ���� �� ���� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,5000)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 5000 )
TriggerAction( 1, GiveItem, 7681,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ���� ��������� ����� ������ 10 ������ ����� � 40 ��������� " )
Text( 5, "��������� ���� ", JumpPage, 7)
Text( 5, "��������� �������� ", JumpPage, 8)
Text( 5, "��������� ������������ ", JumpPage, 9)
Text( 5, "��������� �������� ", JumpPage, 10)
Text( 5, "��������� ���� ", JumpPage, 11)

Talk(7," �������, ����� ��� ���� �� ���� ����! " )
Text( 7, "��������� ���� 1��", JumpPage, 12)
Text( 7, "��������� ���� 5��", JumpPage, 13)

Talk(12," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7705,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(12," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7705,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(13," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(8," �������, ����� ��� ���� �� ���� ����! " )
Text( 8, "��������� �������� 1��", JumpPage, 14)
Text( 8, "��������� �������� 5��", JumpPage, 15)

Talk(14," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7706,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(14," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7706,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(15," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(9," �����, ����� ��� ���� �� ���� ����! " )
Text( 9, "��������� ������������ 1��", JumpPage, 16)
Text( 9, "��������� ������������ 5��", JumpPage, 17)


Talk(16," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7707,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(16," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7707,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(17," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," �����, ����� ��� ���� �� ���� ����! " )
Text( 10, "��������� �������� 1��", JumpPage, 18)
Text( 10, "��������� �������� 5��", JumpPage, 19)

Talk(18," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7708,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(18," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7708,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(19," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," �����, ����� ��� ���� �� ���� ����! " )
Text( 11, "��������� ���� 1��", JumpPage, 20)
Text( 11, "��������� ���� 5��", JumpPage, 21)


Talk(20," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,10 )
TriggerCondition( 1, HasCredit,40)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,10 )
TriggerAction( 1, DelRoleCredit, 40 )
TriggerAction( 1, GiveItem, 7709,1,4 )
TriggerFailure( 1, JumpPage, 4)
Text(20," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," ������� �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,7528,50 )
TriggerCondition( 1, HasCredit,400)
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7528,50 )
TriggerAction( 1, DelRoleCredit, 400 )
TriggerAction( 1, GiveItem, 7709,5,4 )
TriggerFailure( 1, JumpPage, 4)
Text(21," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," �� ��������� ����! " )
end

function t_gzbtplaw ()   

Talk( 1, "�� ������� ���� ����� � �� �� ����,��� �������� ������� � ��� ���������� ������ ���������� ����� 3.500������,��� ����� ������ �������� ������,�� ��� �� ���� �����������!�� ��������� ������ ���� ��� ��� � ����� �������� ������,����� ������ � ������� ������ " ) 
Text( 1, " ��� ", BuyPage)


InitTrade  ()
Weapon(	2941	)
Weapon(	6947	)
Weapon(	6948	)
Weapon(	7489	)
Weapon(	7532	)
Weapon(	7533	)
Weapon(	7477	)
Weapon(	7478	)
Weapon(	7479	)
Weapon(	7480	)
Weapon(	7481	)
Weapon(	7451	)
Weapon(	7456	)
Weapon(	7455	)
Weapon(	7668	)
Weapon(	7528	)
Weapon(	7670	)
Weapon(	7702	)
--Weapon(	7681	)
--Weapon(	7683	)
--Weapon(	7682	)
--Weapon(	5702	)
--Weapon(	5710	)


end

function garoldtp()
Talk( 1, "������ ", JumpPage, 2 )
Text( 1, "�������� � ������ ", GoTo, 643, 877, "magicsea" )
Text( 1, "���������� �� ������� ", JumpPage, 2)

 end
 
function Instance_NPC()
	InitTrigger()
	TriggerCondition( 1, Instance_DayCheck, 1 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerFailure( 1, JumpPage, 4 )
	Start( GetMultiTrigger(), 1 )
	Talk(1,"������ ������,���� �� ������ ������� �������,����� ������� �� �� ������� ����� ����� ����? " )
	Text(1,"�� ������ ! ",Instance_RegParty)
	Text(1,"��������� ��������� ������� ",Instance_ConfirmParty)
	Text(1,"�������� ��� ����������� ",JumpPage,2)
	Text(1,"���������� ",JumpPage,3)
	
end


function Hell_tele01 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 82
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele02 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 105
        local GoTo01Y = 146
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������? " ) 
        Text( 1, "������� ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "������� ������ ��� ��������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele03 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 89
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

       Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele04 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 95
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������? " ) 
        Text( 1, "������� ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "������� ������ ��� ��������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele05 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 165
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele06 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 160
        local GoTo01Y = 99
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������? " ) 
        Text( 1, "������� ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "������� ������ ��� ��������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele07 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 164
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele08 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 160
        local GoTo01Y = 147
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������? " ) 
        Text( 1, "������� ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
        TriggerAction( 2,  GoTo, GoTo01X, GoTo01Y, GoTo01M )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "������� ������ ��� ��������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
         

end

function Hell_tele09 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 237
        local GoTo01Y = 116
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele10 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 237
        local GoTo01Y = 126
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele11 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 126
        local GoTo01Y = 35
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele12 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 129
        local GoTo01Y = 35
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele13 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 14
        local GoTo01Y = 124
        local GoTo01M = CurMapName1
   

         Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele14 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 14
        local GoTo01Y = 119
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele15 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 131
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele16 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 125
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

      Talk( 1, "��������: ��� �� ������ ������,����� ��� 1 ������ ��� " ) 
        Text( 1, "������ ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6879, 1 )
	TriggerAction( 1, TakeItem, 6879, 1 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "�����? " )
        Text( 2, "�� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "� ������ ��� " , JumpPage, 1 )

        Talk( 5, "� ���� �� ������� ������ ���! " )
         

end

function Hell_tele17 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 59
        local GoTo01Y = 37
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: �� ������? " ) 
        Text( 1, "��! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6882, 2 )
	TriggerAction( 1, TakeItem, 6882, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "��������: ��� ������� � ������� ����� ��� 2 ����� ������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "��������� " , JumpPage, 1 )

        Talk( 5, "������������ ������! " )
         

end

function Hell_tele18 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 188
        local GoTo01Y = 34
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: �� ������? " ) 
        Text( 1, "��! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6883, 2 )
	TriggerAction( 1, TakeItem, 6883, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "��������: ��� ������� � ������� ����� ��� 2 ����� �������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "��������� " , JumpPage, 1 )

        Talk( 5, "������������ ������! " )
         

end

function Hell_tele19 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 60
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: �� ������? " ) 
        Text( 1, "��! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6880, 2 )
	TriggerAction( 1, TakeItem, 6880, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "��������: ��� ������� � ������� ����� ��� 2 ����� ��������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "��������� " , JumpPage, 1 )

        Talk( 5, "������������ ������! " )
         

end

function Hell_tele20 ()

        --Maps--Mazes
        local CurMapName1 = "Hellchapter"

        --Forsaken City(FC)
        local GoTo01X = 190
        local GoTo01Y = 214
        local GoTo01M = CurMapName1
   

        Talk( 1, "��������: �� ������? " ) 
        Text( 1, "��! ",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
	TriggerCondition( 1, HasItem, 6881, 2 )
	TriggerAction( 1, TakeItem, 6881, 2 ) 
        TriggerFailure( 1, JumpPage, 5 )
        Talk( 2, "��������: ��� ������� � ������� ����� ��� 2 ����� ���������� " )
        Text( 2, "����� ",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "��������� " , JumpPage, 1 )

        Talk( 5, "������������ ������! " )
         

end


function Hell_ad ()

		Talk( 1, "������,� ��� ����� ��������� ���������� ���������� 1200 ������,�� ��� �������... " )
        Text( 1, "������� ���� � �� ", GoTo, 119, 119, "Hellchapter" )
		Text( 1, "���������� ��� (1200 �������) ",  JumpPage, 2)
		
		Talk( 2, "������� �� ����� ��� ������� ��������� � �������� �� ������ ���.. " )
		Text( 2, "������",  JumpPage, 3)
		Text( 2, "����������",  JumpPage, 4)
		
	Talk( 3, "�������� � �������� �� ���� ����.��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7803, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 3, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 4, "������ ���������� ������ ���������� ���������� �� ���.. " )
	Text( 4, "����� ",  JumpPage, 5)
	Text( 4, "������",  JumpPage, 6)
	Text( 4, "��������",  JumpPage, 7)
	Text( 4, "������� ",  JumpPage, 8)
	Text( 4, "������ ",  JumpPage, 9)
	Text( 4, "�������� ",  JumpPage, 10)
	
	
	Talk( 5, "����� ������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7806, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 5, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 6, "���������� ������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7807, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 6, "����� ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 7, "���������� ��������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7808, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 7, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 8, "���������� �������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7809, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 8, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 9, "���������� ������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7804, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 9, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10, "���������� ��������? ����� ��� ��� �� 5 ���� �������,���������,���������� � ��������,� ��� �� 100 ������ ������,100 ������ �����,100 ������ ���,20 ������ ���������,1200 ��������� � 120.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7737, 5 )
	TriggerCondition( 1, HasItem, 7738, 5 )
	TriggerCondition( 1, HasItem, 7739, 5 )
	TriggerCondition( 1, HasItem, 7740, 5 )
	TriggerCondition( 1, HasItem, 6879, 100 )
	TriggerCondition( 1, HasItem, 6884, 100 )
	TriggerCondition( 1, HasItem, 6886, 100 )
	TriggerCondition( 1, HasItem, 6885, 20 )
	TriggerCondition( 1, HasCredit, 1200 )
	TriggerCondition( 1, HasMoney, 120000000 )
	TriggerAction( 1, TakeItem, 7737, 5 )
	TriggerAction( 1, TakeItem, 7738, 5 )
	TriggerAction( 1, TakeItem, 7739, 5 )
	TriggerAction( 1, TakeItem, 7740, 5 )
	TriggerAction( 1, TakeItem, 6879, 100)
	TriggerAction( 1, TakeItem, 6884, 100 )
	TriggerAction( 1, TakeItem, 6886, 100 )
	TriggerAction( 1, TakeItem, 6885, 20 )
	TriggerAction( 1, DelRoleCredit, 1200 )
	TriggerAction( 1, TakeMoney, 120000000 )
	TriggerAction( 1, GiveItem, 7805, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 10, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 20, "�� ���������� ��������� ��� ������! " )     
end

function r_rybak ()	
	
	Talk( 1,  "������,������ ����������? " )
	Text( 1,  "���� ", BuyPage )
	
	Weapon(	7726	)
	Weapon(	7733	)
	
	
	end
	
function t_tpfish ()

        --Maps--Mazes
        local CurMapName1 = "fishing"

        --Forsaken City(FC)
        local GoTo01X = 63
        local GoTo01Y = 49
        local GoTo01M = CurMapName1
   

        Talk( 1, "��� �� ������ � ������ �������,������� ��� �� 10 ���� ������� ���� ���." ) 
        Text( 1, "������",  JumpPage, 2) 

        InitTrigger()
        TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M  )
		TriggerCondition( 1, HasItem, 7727, 10 )
		TriggerCondition( 1, HasItem, 7728, 10 )
		TriggerCondition( 1, HasItem, 7729, 10 )
		TriggerCondition( 1, HasItem, 7730, 10 )
		TriggerCondition( 1, HasItem, 7731, 10 )
		TriggerCondition( 1, HasItem, 7732, 10 )
		TriggerAction( 1, TakeItem, 7727, 10 ) 
		TriggerAction( 1, TakeItem, 7728, 10 )
		TriggerAction( 1, TakeItem, 7729, 10 )
		TriggerAction( 1, TakeItem, 7730, 10 )
		TriggerAction( 1, TakeItem, 7731, 10 )
		TriggerAction( 1, TakeItem, 7732, 10 )
        TriggerFailure( 2, JumpPage, 5 )
        Talk( 2, "�� �����? " )
        Text( 2, "��",MultiTrigger, GetMultiTrigger(), 2)
        Text( 2, "����� ��������" , JumpPage, 1 )

        Talk( 5, "������������ ����." )
       
end


function t_tpfisr ()
Talk( 1, "������ " )
Text( 1, "������ ", GoTo, 642, 870, "magicsea" )
end
-------Sacred War Administrator

function roico_talk()

	Talk( 1, "� ���� ����� ����� ���������� ���������� ������,�� �� ������� =) " )
	--Text( 1, "�������� �������� ��������� �� �� ",JumpPage, 2 )
	Text( 1, "�������� ��� ��� ������ ", JumpPage, 2 )
	
	Talk( 2, "� ������� ������ ���� 3 ������� �� ����,���� ����� ��� ���� ������ �������,�� �� �������� ���� �� ��� ���������� ������� � ������� � �����.���� �� ������������ ��� ���� ������� �� ����� �� ������� ������ ��� ��������� �������� �������! " )
	Text( 2, "������� ", CloseTalk )



end

function r_abatp()

	Talk(1, "��� ���� ����� �����? ")
	Text(1, "������ ���� � ������ ", JumpPage, 2 )
	Text(1, "���� ��������� ", JumpPage, 3 )
	
	Talk(2, "���?  ")
	Text(2, "�� ", GoTo, 647, 869, "magicsea")
	Text(2, "��� ", CloseTalk )	
	
	Talk(3,"���..� ����� ������� ��� ��������� 5 �������� ����� (1000��),500 ��������� � 50.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7746, 5 )
	TriggerCondition( 1, HasCredit, 500 )
	TriggerCondition( 1, HasMoney, 50000000 )
	TriggerAction( 1, TakeItem, 7746, 5 )
	TriggerAction( 1, DelRoleCredit, 500 )
	TriggerAction( 1, TakeMoney, 50000000 )
	TriggerAction( 1, GiveItem, 7786, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	TriggerFailure( 1, JumpPage, 5 )
	Text(3, "������� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(5,"�� ���������� ���� ")


end

function r_abatp2()

	Talk(1, "��� ���� ����� �����? ")
	Text(1, "������ ���� � ������ ", JumpPage, 2 )
	Text(1, "���������� ���� ", GoTo, 28, 30, "hell")

	Talk(2, "���?  ")
	Text(2, "�� ", GoTo, 647, 869, "magicsea")
	Text(2, "��� ", CloseTalk )	
	
end

function r_abatp3()

	Talk(1, "��� ���� ����� �����? ")
	Text(1, "������ ���� � ������ ", JumpPage, 2 )
	Text(1, "���������� ���� ", GoTo, 225, 31, "hell")

	Talk(2, "���?  ")
	Text(2, "�� ", GoTo, 647, 869, "magicsea")
	Text(2, "��� ", CloseTalk )	
	
end

function r_abatp4()

	Talk(1, "��� ���� ����� �����? ")
	Text(1, "������ ���� � ������ ", JumpPage, 2 )
	Text(1, "���������� ���� ", GoTo, 222, 220, "hell")

	Talk(2, "���?  ")
	Text(2, "�� ", GoTo, 647, 869, "magicsea")
	Text(2, "��� ", CloseTalk )	
	
end

function t_gemssetqua()
Talk( 1, "������� ���� ����� ���� �������� � ��������...����� ����� ���������� �� ���� ���������...� ���� ��� ��� ��������� � ������ �������� 100 ��� ")    
Text( 1, "���� ̸������ (100 �������) ", JumpPage, 2)

Talk(2,"������ ������� ��� - 2 ������,������ - 3,��������� - 4,����� - 5 ")
Text(2, "2 ������� ", JumpPage, 3)
Text(2, "3 ������� ", JumpPage, 4)
Text(2, "4 ������� ", JumpPage, 5)
Text(2, "5 ������� ", JumpPage, 6)

Talk(3,"������� ����� ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,2 )
TriggerAction( 1, GiveItem, 7811,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(3,"����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(4,"������� ����� ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,3 )
TriggerAction( 1, GiveItem, 7812,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(4,"����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(5,"������� ����� ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,4 )
TriggerAction( 1, GiveItem, 7813,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(5,"����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(6,"������� ����� ")
InitTrigger()
TriggerCondition( 1, HasItem,7810,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7810,5 )
TriggerAction( 1, GiveItem, 7814,1,4 )
TriggerFailure( 1, JumpPage, 11)
Text(6,"����� ",MultiTrigger,GetMultiTrigger(),1)

end

function t_kuppf()
Talk( 1, "������ " )
Text( 1, "������ ", GoTo, 869, 3608, "magicsea" )
end

function ckorb_t ()

		Talk( 1, "�������,����� ���� �� ����� ���� ������ ��� �������? " )
        Text( 1, "� ����� ", GoTo, 68, 60, "farmer1" )
		Text( 1, "���������� ������ (1400 �������) ",  JumpPage, 2)
		
		Talk( 2, "�� ����,�� ������������� ������ ���� �������?���� ��� ������,����� ������� ��,��� ���� ���������� " )
		Text( 2, "������",  JumpPage, 3)
		Text( 2, "����������",  JumpPage, 4)
		
	Talk( 3, "������ ����� 5 ���� ��.���� �����,��.Ҹ���� ���� �����,��.��� � ��.�������,� ��� �� �� 20 ���� ���� �����,Ҹ���� ���� �����,��� � �������,�� ���� ����� 150 Ǹ��� ������,1 ����� ������� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 20 )
	TriggerCondition( 1, HasItem, 7897, 20 )
	TriggerCondition( 1, HasItem, 7899, 20 )
	TriggerCondition( 1, HasItem, 7901, 20 )
	TriggerCondition( 1, HasItem, 7914, 150 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 20)
	TriggerAction( 1, TakeItem, 7897, 20 )
	TriggerAction( 1, TakeItem, 7899, 20 )
	TriggerAction( 1, TakeItem, 7901, 20 )
	TriggerAction( 1, TakeItem, 7914, 150 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7887, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 3, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 4, "������� " )
	Text( 4, "����� ",  JumpPage, 5)
	Text( 4, "������",  JumpPage, 6)
	Text( 4, "��������",  JumpPage, 7)
	Text( 4, "������� ",  JumpPage, 8)
	Text( 4, "������ ",  JumpPage, 9)
	Text( 4, "�������� ",  JumpPage, 10)
	
	
	Talk( 5, "��� ����� ����� �� 5 ���� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 10 ���� ���� �����,Ҹ���� ���� �����,��� � �������,200 Ǹ��� ������,1 ����� ������� ������,1400 ��������� � 140.000.000 ������   " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 10 )
	TriggerCondition( 1, HasItem, 7897, 10 )
	TriggerCondition( 1, HasItem, 7899, 10 )
	TriggerCondition( 1, HasItem, 7901, 10 )
	TriggerCondition( 1, HasItem, 7914, 200 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 10)
	TriggerAction( 1, TakeItem, 7897, 10 )
	TriggerAction( 1, TakeItem, 7899, 10 )
	TriggerAction( 1, TakeItem, 7901, 10 )
	TriggerAction( 1, TakeItem, 7914, 200)
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7890, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 5, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	
	Talk( 6, "��� ������� ����� �� 5 ���� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 5 ���� ���� �����,Ҹ���� ���� �����,��� � �������,1 ����� ������� ������,100 ��������� ���,100 Ǹ��� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 5 )
	TriggerCondition( 1, HasItem, 7898, 5 )
	TriggerCondition( 1, HasItem, 7900, 5 )
	TriggerCondition( 1, HasItem, 7902, 5 )
	TriggerCondition( 1, HasItem, 7895, 5 )
	TriggerCondition( 1, HasItem, 7897, 5 )
	TriggerCondition( 1, HasItem, 7899, 5 )
	TriggerCondition( 1, HasItem, 7901, 5 )
	TriggerCondition( 1, HasItem, 7910, 100 )
	TriggerCondition( 1, HasItem, 7914, 100 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 5 )
	TriggerAction( 1, TakeItem, 7898, 5 )
	TriggerAction( 1, TakeItem, 7900, 5 )
	TriggerAction( 1, TakeItem, 7902, 5 )
	TriggerAction( 1, TakeItem, 7895, 5 )
	TriggerAction( 1, TakeItem, 7897, 5 )
	TriggerAction( 1, TakeItem, 7899, 5 )
	TriggerAction( 1, TakeItem, 7901, 5 )
	TriggerAction( 1, TakeItem, 7910, 100)
	TriggerAction( 1, TakeItem, 7914, 100 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7891, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 6, "����� ", MultiTrigger, GetMultiTrigger(), 1)


	Talk( 7, "��� �������� ����� �� 3 ����� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 3 ����� ���� �����,Ҹ���� ���� �����,��� � �������,1 ����� ������� ������,50 ����� ������,50 Ǹ��� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 3 )
	TriggerCondition( 1, HasItem, 7898, 3 )
	TriggerCondition( 1, HasItem, 7900, 3 )
	TriggerCondition( 1, HasItem, 7902, 3 )
	TriggerCondition( 1, HasItem, 7895, 3 )
	TriggerCondition( 1, HasItem, 7897, 3 )
	TriggerCondition( 1, HasItem, 7899, 3 )
	TriggerCondition( 1, HasItem, 7901, 3 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7911, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 3 )
	TriggerAction( 1, TakeItem, 7898, 3 )
	TriggerAction( 1, TakeItem, 7900, 3 )
	TriggerAction( 1, TakeItem, 7902, 3 )
	TriggerAction( 1, TakeItem, 7895, 3 )
	TriggerAction( 1, TakeItem, 7897, 3 )
	TriggerAction( 1, TakeItem, 7899, 3 )
	TriggerAction( 1, TakeItem, 7901, 3 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7911, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7892, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 7, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 8, "��� ������� ����� �� 3 ����� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 3 ����� ���� �����,Ҹ���� ���� �����,��� � �������,1 ����� ������� ������,50 ������� �����,50 Ǹ��� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 3 )
	TriggerCondition( 1, HasItem, 7898, 3 )
	TriggerCondition( 1, HasItem, 7900, 3 )
	TriggerCondition( 1, HasItem, 7902, 3 )
	TriggerCondition( 1, HasItem, 7895, 3 )
	TriggerCondition( 1, HasItem, 7897, 3 )
	TriggerCondition( 1, HasItem, 7899, 3 )
	TriggerCondition( 1, HasItem, 7901, 3 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7912, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 3 )
	TriggerAction( 1, TakeItem, 7898, 3 )
	TriggerAction( 1, TakeItem, 7900, 3 )
	TriggerAction( 1, TakeItem, 7902, 3 )
	TriggerAction( 1, TakeItem, 7895, 3 )
	TriggerAction( 1, TakeItem, 7897, 3 )
	TriggerAction( 1, TakeItem, 7899, 3 )
	TriggerAction( 1, TakeItem, 7901, 3 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7912, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7893, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 8, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 9, "��� ������ ����� �� 6 ���� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 6 ����� ���� �����,Ҹ���� ���� �����,��� � �������,1 ����� ������� ������,50 ������� �����,50 Ǹ��� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 6 )
	TriggerCondition( 1, HasItem, 7898, 6 )
	TriggerCondition( 1, HasItem, 7900, 6 )
	TriggerCondition( 1, HasItem, 7902, 6 )
	TriggerCondition( 1, HasItem, 7895, 6 )
	TriggerCondition( 1, HasItem, 7897, 6 )
	TriggerCondition( 1, HasItem, 7899, 6 )
	TriggerCondition( 1, HasItem, 7901, 6 )
	TriggerCondition( 1, HasItem, 7914, 50 )
	TriggerCondition( 1, HasItem, 7913, 50 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 6 )
	TriggerAction( 1, TakeItem, 7898, 6 )
	TriggerAction( 1, TakeItem, 7900, 6 )
	TriggerAction( 1, TakeItem, 7902, 6 )
	TriggerAction( 1, TakeItem, 7895, 6 )
	TriggerAction( 1, TakeItem, 7897, 6 )
	TriggerAction( 1, TakeItem, 7899, 6 )
	TriggerAction( 1, TakeItem, 7901, 6 )
	TriggerAction( 1, TakeItem, 7914, 50)
	TriggerAction( 1, TakeItem, 7913, 50 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7888, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 9, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 10, "��� �������� ����� �� 12 ���� ������� ���,������� �������,������� ���� �����,�� Ҹ���� ���� �����,�� 12 ���� ���� �����,Ҹ���� ���� �����,��� � �������,1 ����� ������� ������,100 ��������� ����,100 ����� ������,100 ������ ���,100 ������� �����,100 Ǹ��� ������,1400 ��������� � 140.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7896, 12 )
	TriggerCondition( 1, HasItem, 7898, 12 )
	TriggerCondition( 1, HasItem, 7900, 12 )
	TriggerCondition( 1, HasItem, 7902, 12 )
	TriggerCondition( 1, HasItem, 7895, 12 )
	TriggerCondition( 1, HasItem, 7897, 12 )
	TriggerCondition( 1, HasItem, 7899, 12 )
	TriggerCondition( 1, HasItem, 7901, 12 )
	TriggerCondition( 1, HasItem, 7910, 100 )
	TriggerCondition( 1, HasItem, 7911, 100 )
	TriggerCondition( 1, HasItem, 7912, 100 )
	TriggerCondition( 1, HasItem, 7913, 100 )
	TriggerCondition( 1, HasItem, 7914, 100 )
	TriggerCondition( 1, HasItem, 7903, 1 )
	TriggerCondition( 1, HasCredit, 1400 )
	TriggerCondition( 1, HasMoney, 140000000 )
	TriggerAction( 1, TakeItem, 7896, 12 )
	TriggerAction( 1, TakeItem, 7898, 12 )
	TriggerAction( 1, TakeItem, 7900, 12 )
	TriggerAction( 1, TakeItem, 7902, 12 )
	TriggerAction( 1, TakeItem, 7895, 12 )
	TriggerAction( 1, TakeItem, 7897, 12 )
	TriggerAction( 1, TakeItem, 7899, 12 )
	TriggerAction( 1, TakeItem, 7901, 12 )
	TriggerAction( 1, TakeItem, 7910, 100)
	TriggerAction( 1, TakeItem, 7911, 100 )
	TriggerAction( 1, TakeItem, 7912, 100 )
	TriggerAction( 1, TakeItem, 7913, 100 )
	TriggerAction( 1, TakeItem, 7914, 100 )
	TriggerAction( 1, TakeItem, 7903, 1 )
	TriggerAction( 1, DelRoleCredit, 1400 )
	TriggerAction( 1, TakeMoney, 140000000 )
	TriggerAction( 1, GiveItem, 7889, 1 , 4)
    TriggerFailure( 1, JumpPage, 20 )
	Text( 10, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk( 20, "�� ���������� ��������� ��� ������! " )     
end

--����� ������
function Angel_Reset()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 4999)
	TriggerCondition( 2, NPCcheck_Reset, 0 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "����� ���������� � ���, ����� ���� ���� 999 ������ � �� ����� ������� ������. ")    
Text( 12, "���� ", CloseTalk	)

Talk( 1, "����� �������� ������ �����, �����:_25 ����� �����;_25 �������;_25 �������;_1 ������;_1.000.000.000 ������. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "�����������. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "�������. ", CloseTalk )

Talk( 3, "� ��� �� ������� �����, ����� ��������� ������ �����! ")    
Text( 3, "���� ", CloseTalk	)

end

--����� ������ 2
function Angel_Reset_2()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 1199)
	TriggerCondition( 2, NPCcheck_Reset, 1 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "����� ���������� � ���, ����� ���� ���� 1199 ������ � �� ����� ������� ������. ")    
Text( 12, "���� ", CloseTalk	)

Talk( 1, "����� �������� ������ �����, �����:_50 ����� �����;_50 �������;_50 �������;_2 ������;_1.000.000.000 ������. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "�����������. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "�������. ", CloseTalk )

Talk( 3, "� ��� �� ������� �����, ����� ��������� ������ �����! ")    
Text( 3, "���� ", CloseTalk	)

end

--����� ������ 3
function Angel_Reset_3()
	InitTrigger()
	-- Carsise Swordman
	TriggerCondition( 2, LvCheck, ">", 1399)
	TriggerCondition( 2, NPCcheck_Reset, 2 )
	TriggerAction( 2, JumpPage, 1 )
	TriggerFailure( 2, JumpPage, 12 )
	Start( GetMultiTrigger(),2 )


Talk( 12, "����� ���������� � ���, ����� ���� ���� 1399 ������ � �� ����� �������� ������. ")    
Text( 12, "���� ", CloseTalk	)

Talk( 1, "����� �������� ������ �����, �����:_100 ����� �����;_100 �������;_100 �������;_3 ������;_1.000.000.000 ������. ")
		InitTrigger () 
		TriggerAction (1, Reset_Graf ) 
		TriggerFailure (1, JumpPage, 3) 
		Text (1, "�����������. ", MultiTrigger, GetMultiTrigger (), 2) 
Text( 1, "�������. ", CloseTalk )

Talk( 3, "� ��� �� ������� �����, ����� ��������� ������ �����! ")    
Text( 3, "���� ", CloseTalk	)

end

function gatkvostr()
Talk( 1, "������ � ���� ����� ������� �� ����� ������� ", JumpPage, 2 )
Text( 1, "�������� � ������ ", GoTo, 891, 3575, "magicsea" )
Text( 1, "��� ", JumpPage, 2)

 end

function GoToWhere()
Talk( 1, "\208\224\228\224 \226\224\241 \226\232\228\229\242\252 " ) 
Text( 1, "\195\238\240\238\228\224 ", JumpPage, 3 )
Text( 1, "\206\241\242\240\238\226\224 ", JumpPage, 2 )
Text( 1, "\199\238\237\251 ", JumpPage, 6 )
--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )

Text( 2, "\206\241\242\240\238\226 \196\230\229\234\224 ", GoTo, 1503, 1036, "magicsea" )
Text( 2, "\206\241\242\240\238\226 \209\242\243\230\232 ", GoTo, 77, 199, "stuja" )
Text( 2, "\206\241\242\240\238\226 \202\243\239\232\228\238\237\224 ", GoTo, 158, 59, "cupid" )
--Text( 2, "\206\241\242\240\238\226 \213\253\235\235\238\243\232\237\224 ", GoTo, 160,140, "halloween" )
--Text( 2, "\206\241\242\240\238\226 \209\234\238\240\225\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 99, 103, "farmer1" )
Text( 2, "\206\241\242\240\238\226 \208\251\225\224\234\238\226 ", GoTo, 56, 90, "fishing" )
Text( 2, "\206\241\242\240\238\226 \210\251\234\226 ", GoTo, 160, 140, "halloween" )
--Text( 2, "\196\224\235\229\229 ", JumpPage, 4 )

Text( 3, "\195\238\240\238\228 \209\243\228\252\225\251 ", GoTo, 157, 128, "CrystalShore" )
Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )
--Text( 4, "NEW 2. ", GoTo, 98, 113, "necropolis" )


Text( 5, "1 ", GoTo, 311, 297, "eastgoaf" )
Text( 5, "2 ", GoTo, 56, 252, "eastgoaf" )
Text( 5, "3 ", GoTo, 889, 526, "eastgoaf" )
Text( 5, "4 ", GoTo, 768,661, "eastgoaf" )
Text( 5, "5 ", GoTo, 777,730, "eastgoaf" )
Text( 5, "6 ", GoTo, 612,626, "jialebi" )
Text( 5, "7 ", GoTo, 1263,1008, "jialebi" )
Text( 5, "8 ", GoTo, 947,837, "jialebi" )
Text( 5, "9 ", GoTo, 1247,601, "jialebi" )


Text( 6, "\216\224\245\242\251 (\199\238\235\238\242\238) ", GoTo, 1139, 297, "magicsea" )
Text( 6, "\196\229\240\229\226\237\255 \207\224\243\234\238\226 (\211\240. 200) ", GoTo, 639, 568, "magicsea" )
Text( 6, "\208\238\249\224 \215\229\240\229\239\224\245 (\211\240. 230-300) ", GoTo, 983, 455, "magicsea" )
Text( 6, "\203\224\227\229\240\252 \207\243\241\242\251\237\237\251\245 \209\234\229\235\229\242\238\226 (\211\240. 350-400) ", GoTo, 951, 319, "magicsea" )
Text( 6, "\207\247\229\235\232\237\251\233 \206\224\231\232\241 (\211\240. 450-500) ", GoTo, 868, 393, "magicsea" )
Text( 6, "\203\224\227\229\240\252 \206\224\231\232\241 (\211\240. 550-600) ", GoTo, 564, 383, "magicsea" )
Text( 6, "\211\235\232\242\238\247\237\251\233 \206\224\231\232\241 (\211\240. 650-700) ", GoTo, 466, 395, "magicsea" )
Text( 6, "\196\224\235\229\229 ", JumpPage, 7 )

Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 357, 181, "magicsea" )
Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 451, 189, "magicsea" )
Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 536, 185, "magicsea" )

 end
------------------------------------------------------------
-- ???????
----------------------------------------------------------

function telepotrow ()
Talk( 1, "\204\237\229 \242\224\234 \237\240\224\226\232\242\241\255 \253\242\238 \230\224\240\234\238\229 \241\238\235\237\246\229,\237\229 \245\238\247\229\248\252 \239\240\238\227\243\235\255\242\241\255? " )
Text( 1, "\216\224\233\242\224\237 ", GoTo, 891, 3575, "magicsea" )
	
end

function t_socrovi ()
Talk( 1, "\204\237\238\227\232\229 \238\245\238\242\237\232\234\232 \231\224 \241\238\234\240\238\226\232\249\224\236\232 \242\224\234 \232 \237\229 \226\229\240\237\243\235\232\241\252.... " )
Text( 1, "\206\242\226\229\228\232 \236\229\237\255 \226 \199\224\235\232\226 \209\238\234\240\238\226\232\249 ", GoTo, 620, 951, "jialebi" )
	
end

------------------------------------------------------------
-- ???????
------------------------------------------------------------

function JoJo_99 () -- Pirate Chest

	Talk( 1, "Hello! Iam Story Question" )
	Text( 1, "\202\243\239\232\242\252", BuyPage)

	InitTrade()
	Weapon(	854  )
	Weapon(	127  )
	Weapon(	776  )
	Weapon(	784  )
	Weapon(	773  )
	Weapon(	802  )
	Weapon(	2820  )
	Weapon(	2817  )
	Weapon(	2339  )
	Weapon(	2821  )
	Weapon(	2822  )
	Weapon(	2332  )
	Weapon(	2338  )
	Weapon(	2337  )
	Weapon(	2823  )
	Weapon(	2824  )
	Weapon(	2825  )
	Weapon(	864  )
	Weapon(	865  )
	Weapon(	866  )
	Weapon(	885  )
	Weapon(	5845  )
	Weapon(	5846  )
	Weapon(	5847  )
	Weapon(	5848  )
	Weapon(	5849  )
	Weapon(	1145  )
	Weapon(	2729  )
	Weapon(	2753  )
	Weapon(	2777  )
	Weapon(	2801  )
	Weapon(	2794  )
	Weapon(	2367  )
	Weapon(	0807  )
	Weapon(	0808  )
	Weapon(	0809  )
	Weapon(	0810  )
	Weapon(	0811  )
	Weapon(	0812  )
	Weapon(	0813  )
	Weapon(	0814  )
	Weapon(	0815  )
	Weapon(	3404  ) 
	Weapon(	3416  )
	Weapon(	3417  )
	Weapon(	3418  )
	Weapon(	3419  )
	Weapon(	3420  )
	Weapon(	2941  )
	Defence(	585	) -- Wings of Light
	Defence(	4976	) -- Nature's Whisper
	Defence(	4938	) -- Hammer of Thunder
	Defence(	4957	) -- Eye of Lighting
	Defence(	4974	) -- Morning Bell
	Defence(	860	) -- Ray's Fury
	Defence(	861	) -- Kiss of Nic
	Defence(	862	) -- Consecration of Priestess
	Defence(	863	) -- Peter's Call
	Defence(	1012	) -- Daniel's Regret
	Defence(	5773	) -- Nimble Venturer
	Defence(	5774	) -- Soul Generator
	Defence(	2956	) -- Daniel's Regret
	Defence(	2326	) -- Nimble Venturer
	Defence(	2844	) -- Soul Generator

	Defence(	5775	) -- Daniel's Regret
	Defence(	5772	) -- Nimble Venturer
	Defence(	5771	) -- Daniel's Regret
	Defence(	5770	) -- Nimble Venturer

	Defence(	5751	) -- Daniel's Regret
	Defence(	5772	) -- Nimble Venturer
	Defence(	5771	) -- Daniel's Regret
	Defence(	5770	) -- Nimble Venturer

	Other(	584	) -- Skeletar Chest of Swordsman
	Other(	3880	) -- Skeletar Chest of Hunter
	Other(	3882	) -- Skeletar Chest of Herbalist
	Other(	1134	) -- Skeletar Chest of Explorer
	Other(	2898	) -- Incantation Chest of Crusader
	Other(	2953	) -- Incantation Chest of Champion
	Other(	3338	) -- Incantation Chest of Sharpshooter
	Other(	2988	) -- Incantation Chest of Cleric
	Other(	1083	) -- Incantation Chest of Seal Master
	Other(	1854	) -- Incantation Chest of Voyager
	Other(	3116	) -- Evanescence Chest of Crusader
	Other(	1858	) -- Evanescence Chest of Champion
	Other(	3458	) -- Evanescence Chest of Sharpshooter
	Other(	1854	) -- Evanescence Chest of Cleric
	Other(	3414	) -- Evanescence Chest of Seal Master
	Other(	3415	) -- Evanescence Chest of Voyager
	Other(	3416	) -- Enigma Chest of Crusader
	Other(	3417	) -- Enigma Chest of Champion
	Other(	3418	) -- Enigma Chest of Sharpshooter
	Other(	3419	) -- Enigma Chest of Cleric
	Other(	3420	) -- Enigma Chest of Seal Master
	Other(	3421	) -- Enigma Chest of Voyager



end

------------------------------------------------------------
-- ??????
------------------------------------------------------------

function island()
	local CancelSelectTalk = "������, � �������� ����� "
	local CancelSelectPage = 27
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName3 = "eastgoaf"
	local CurMapName4 = "lonetower"
	local CurMapName5 = "darkblue"
	
	local GoTo01X = 3260
	local GoTo01Y = 3280
	local GoTo01M = CurMapName1
	
	local GoTo02X = 2273
	local GoTo02Y = 1122
	local GoTo02M = CurMapName1
	
	local GoTo03X = 3590
	local GoTo03Y = 755
	local GoTo03M = CurMapName1
	
	local GoTo04X = 2376
	local GoTo04Y = 725
	local GoTo04M = CurMapName2
	
	local GoTo05X = 1730
	local GoTo05Y = 3775
	local GoTo05M = CurMapName2
	
	local GoTo06X = 2529
	local GoTo06Y = 2406
	local GoTo06M = CurMapName2
	
	local GoTo07X = 1631
	local GoTo07Y = 1974
	local GoTo07M = CurMapName5
	
	local GoTo08X = 2231
	local GoTo08Y = 2788
	local GoTo08M = CurMapName1
	
	Talk( 1, "�������: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 1, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 1, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 1, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 1, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 1, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 1, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 1, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 1, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 2, "������: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 2, "������� � ������ ", JumpPage, 21 )
	Text( 2, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 2, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 2, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 2, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 2, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 2, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 2, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 3, "�����: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 3, "������� � ������ ", JumpPage, 21 )
	Text( 3, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 3, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 3, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 3, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 3, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 3, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 3, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 4, "�����: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 4, "������� � ������ ", JumpPage, 21 )
	Text( 4, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 4, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 4, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 4, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 4, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 4, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 4, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 5, "�����: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 5, "������� � ������ ", JumpPage, 21 )
	Text( 5, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 5, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 5, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 5, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 5, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 5, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 5, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 6, "�����: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 6, "������� � ������ ", JumpPage, 21 )
	Text( 6, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 6, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 6, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 6, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 6, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 6, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 6, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 7, "�����: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 7, "������� � ������ ", JumpPage, 21 )
	Text( 7, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 7, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 7, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 7, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 7, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 7, "������� �� ������ ����� ", JumpPage, 20 )
	Text( 7, "�������� ����� ����������� ", JumpPage, 25 )
	
	Talk( 8, "��������: ������, � ��������� ����������. ��������� ����������� 2000 �������. ���� ������ �����������? " )
	Text( 8, "������� � ������ ", JumpPage, 21 )
	Text( 8, "������� �� ������ ������ ", JumpPage, 14 )
	Text( 8, "������� �� ���������� ������ ", JumpPage, 15 )
	Text( 8, "������� �� ������ ����������� ", JumpPage, 16 )
	Text( 8, "������� �� ������ ����� ", JumpPage, 17 )
	Text( 8, "������� �� ������ �������� ", JumpPage, 18 )
	Text( 8, "������� �� ������ �������� ", JumpPage, 19 )
	Text( 8, "�������� ����� ����������� ", JumpPage, 25 )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 14, "������� �� ������ ������? ��� �������! ��������� 2000 ������� " )
	Text( 14, "������� ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 14, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 15, "������� �� ���������� ������? ��� �������! ��������� 2000 ������� " )
	Text( 15, "������� ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 15, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 16, "������� �� ������ �����������? ��� �������! ��������� 2000 ������� " )
	Text( 16, "������� ",MultiTrigger, GetMultiTrigger(), 1 )   
	Text( 16, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 17, "������� �� ������ �����? ��� �������! ��������� 2000 ������� " )
	Text( 17, "������� ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 17, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 18, "������� �� ������ ��������? ��� �������! ��������� 2000 ������� " )
	Text( 18, "������� ",MultiTrigger, GetMultiTrigger(), 1 )  
	Text( 18, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 19, "������� �� ������ ��������? ��� �������! ��������� 2000 ������� " )
	Text( 19, "������� ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 19, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo07X, GoTo07Y, GoTo07M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 20, "������� �� ������ �����? ��� �������! ��������� 2000 ������� " )
	Text( 20, "������� ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 20, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo08X, GoTo08Y, GoTo08M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 21, "������� � ������? ��� �������! ��������� 2000 ������� " )
	Text( 21, "������� ",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 21, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, SetSpawnPos, "Argent City")
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, SetSpawnPos, "Zephyr Isle")
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, SetSpawnPos, "Glacier Isle")
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, SetSpawnPos, "Outlaw Isle")
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, SetSpawnPos, "Isle of Chill")
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, SetSpawnPos, "Canary Isle")
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, SetSpawnPos, "Cupid Isle")
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, SetSpawnPos, "Isle of Fortune")
	TriggerFailure( 8, JumpPage, 28 )
	Talk( 25, "�������� ����� �����������? " )
	Text( 25, "��, ���������� ������ ", MultiTrigger, GetMultiTrigger(), 8 )
	Text( 25, "���, ������� ",CloseTalk )
	
	Talk( 26, "��������, � ��� ������������ ����� ��� �����������! " )
	
	Talk( 27, "����� ���� ���� ����������� ������ ", CloseTalk )
	
    Talk( 28, "���������� �������� ����� ����������! ", CloseTalk )
	
	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, JumpPage, 3 )
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, JumpPage, 4 )
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, JumpPage, 5)
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, JumpPage, 6 )
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, JumpPage, 7)
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, JumpPage, 8 )
	Start( GetMultiTrigger(), 8 )
end

function r_talk221()

	Talk( 1, "Lamon:???? ????? ??? ??????" )
	Text( 1, "??", BuyPage )
	Text( 1, "??????????", JumpPage, 2 )
	Text( 1, "???...",CloseTalk )


	Talk( 2, "Lamon: Corals can be recharged. In the sea, there are many regions. Wind corals need to go to Wind region, Thunder corals to Thunder region and Fog coral to Fog regions...I remember that there is a Thunder region near Argent at (2500, 2850). You can try it there. Remember to equip back the coral after it is recharged.")
	InitTrade()
	Weapon(	0508	)
	Weapon(	0509	)
	Weapon(	0510	)
	Weapon(	0522	)
	Weapon(	0523	)
	Weapon(	0498	)
	Weapon(	0503	)
	Weapon(	0504	)
	Weapon(	0505	)
	Weapon(	0506	)
	Weapon(	0872	)--Fog Coral Lvl 1
	Weapon(	0873	)--Fog Coral Lvl 2
	Weapon(	0874	)--Fog Coral Lvl 3
	Weapon(	0875	)--Fog Coral Lvl 4
	Weapon( 0876	)--Fog Coral Lvl 5
	Weapon(	0635	)
	Weapon(	0636	)
	Weapon(	0637	)
	Weapon(	0638	)
	Weapon(	0639	)
end
function Spirit_04()
	Talk(1, "???! ??? ??? ?? ? ??? ??????:") 
	Text(1, "?? ??? 1", GoTo, 175, 206, "mjing1") 
	Text(1, "?? ??? 2", GoTo, 175, 206, "mjing2") 
	Text(1, "?? ??", GoTo, 205, 264, "mjing3")
	Text(1, "?? ?? 2", GoTo, 205, 264, "mjing4")
	Text(1, "??????????? ?????!", GoTo, 185, 186, "shalan2")  
	Text(1, "??", CloseTalk)
end

function t_abaddon()
Talk( 1, "\193\243\228\252 \238\241\242\240\238\230\237\229\229" )
Text( 1, "\194\238\233\242\232 \226 \192\225\224\228\228\238\237 1 ", GoTo, 154, 786, "jialebi" )
Text( 1, "\205\224\247\224\242\252 \200\241\239\251\242\224\237\232\229... ", GoTo, 28, 30, "hell" )
end

function t_drakon()
Talk( 1, " \207\240\232\226\229\242,\255 \236\238\227\243 \238\242\239\240\224\226\232\242\252 \242\229\225\255 \237\224 \206\241\242\240\238\226 \196\240\224\234\238\237\238\226 " )
Text( 1, " \206\242\239\240\224\226\232\242\241\255 ", GoTo, 275, 209, "prisonisland" )
 end
 
 function t_elizatp()
Talk( 1, " \205\229 \225\238\232\248\252\241\255 \239\243\242\229\248\229\241\242\226\238\226\224\242\252 \226 \253\242\232\245 \234\240\224\255\245?\202\238\227\228\224 \242\238 \231\228\229\241\252 \225\251\235\232 \235\254\228\232,\237\238 \226 \238\228\232\237 \228\229\237\252 \239\240\232\235\229\242\229\235\232 \228\240\224\234\238\237\251 \232 \243\237\232\247\242\238\230\232\235\232 \241\235\224\226\237\251\233 \227\238\240\238\228 \192\235\252\244\245\229\233\236... " )
Text( 1, " \207\240\238\226\238\228\232 \236\229\237\255 \226 \216\224\233\242\224\237 ", GoTo, 642, 874, "magicsea" )

 end
 
 --������
function prison_talk01 ()
    Talk ( 1, "\205\243 \239\240\232\226\229\242 \239\235\238\242\226\224,\237\229 \225\238\241\252 \238\242 \241\242\240\224\245\224 \243\230\229 \228\243\236\224\229\248\252 \234\224\234 \225\251 \239\238\241\234\238\240\229\229 \238\242 \241\254\228\224 \241\225\229\230\224\242\252... ")
    Text ( 1, "\211\231\237\224\242\252 \241\239\238\241\238\225 \234\224\234 \226\251\225\240\224\242\252\241\255 \232\231 \242\254\240\252\236\251", JumpPage, 2)
 
    Talk ( 2, "\197\241\242\252 \242\240\232 \241\239\238\241\238\225\224 \226\251\225\240\224\242\252\241\255 \238\242\241\254\228\224.\197\241\235\232 \234\238\237\229\247\237\238 \243 \242\229\225\255 \234\232\248\234\224 \237\229 \242\238\237\234\224! ")
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 1", JumpPage, 3)
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 2", JumpPage, 4)
    Text ( 2, "\209\239\238\241\238\225 \237\238\236\229\240 3", JumpPage, 5)
 
    Talk ( 3, "\209\239\238\241\238\225 1: \194\251 \236\238\230\229\242\229 \239\238\228\238\233\242\232 \234 \205\224\228\231\232\240\224\242\229\235\254,\239\238\235\243\247\232\242\252 \196\229\235\238 \238 \224\240\229\241\242\229.\207\238\236\229\241\242\232\226 \253\242\238\242 \228\238\234\243\236\229\237\242 \226 \242\240\229\242\232\233 \241\235\238\242 \226\224\248\229\227\238 \232\237\226\229\237\242\224\240\255,\232 \239\240\238\225\251\226 2 \247\224\241\224 \226 \242\254\240\252\236\229,\226\251 \241\236\238\230\229\242\229 \238\225\236\229\237\255\242\252 \229\227\238 \237\224 \241\226\238\225\238\228\243 ")
    Text ( 3, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 3, "\211\233\242\232", CloseTalk)
 
    Talk ( 4, "\209\239\238\241\238\225 \237\238\236\229\240 2: \200\231\226\229\241\242\237\238,\247\242\238 \243 \195\235\224\226\251 \199\224\234\235\254\247\229\237\237\251\245 \229\241\242\252 \196\238\234\243\236\229\237\242 \237\224 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229.\197\241\235\232 \242\251 \241\236\238\230\229\248 \226\231\255\242\252 \229\227\238 \241\232\235\238\233, \242\238\227\228\224 \242\251 \225\243\228\229\248\252 \238\241\226\238\225\238\230\228\229\237 \205\224\228\231\232\240\224\242\229\235\229\236. ")
    Text ( 4, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 4, "\211\233\242\232", CloseTalk)
 
    Talk ( 5, "\209\239\238\241\238\225 \237\238\236\229\240 3: \197\241\235\232 \243 \226\224\241 \229\241\242\252 \210\224\235\238\237 \207\238\241\235\243\248\237\238\227\238 \195\240\224\230\228\224\237\232\237\224, \226\251 \242\224\234\230\229 \236\238\230\229\242\229 \239\240\232\237\229\241\242\232 \229\229 \205\224\228\231\232\240\224\242\229\235\254 \242\254\240\252\236\251 \232 \236\238\235\232\242\252 \238\225 \238\241\226\238\225\238\230\228\229\237\232\232.")
    Text ( 5, "\194\229\240\237\243\242\252\241\255 \237\224 \239\240\229\228\251\228\243\249\243\254 \241\242\240\224\237\232\246\243", JumpPage, 2)
    Text ( 5, "\211\233\242\232", CloseTalk)
 
    AddNpcMission   (6231)
end
 
function prison_talk02 ()
    Talk ( 1, "\199\228\240\224\226\241\242\226\243\233.\210\251 \237\224\245\238\228\232\248\252\241\255 \237\224 \236\238\229\233 \242\229\240\240\232\242\238\240\232\232.\199\228\229\241\252 \255 \243\241\242\224\237\238\226\232\235 \241\226\238\232 \239\240\224\226\232\235\224 \232 \242\251 \228\238\235\230\229\237\237 \232\245 \241\238\225\235\254\228\224\242\252.\207\238\237\255\242\237\238?!")
    InitTrigger()
    TriggerCondition( 1, NoItem, 5724, 1 )
    TriggerCondition( 1, HasRecord, 1280 )
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, GiveItem, 5724, 1, 4)
    TriggerAction( 1, JumpPage, 2)
    TriggerFailure( 1, JumpPage, 5)
    Text ( 1, "\223 \245\238\247\243 \239\238\235\243\247\232\242\252 \196\229\235\238 \238 \192\240\229\241\242\229", MultiTrigger, GetMultiTrigger(), 1)
    Text ( 1, "\223 \245\238\247\243 \226\251\225\240\224\242\252\241\255 \238\242\241\254\228\224...", JumpPage, 4)
 
    Talk ( 2, "\205\229 \231\224\225\243\228\252\242\229 \239\238\236\229\241\242\232\242\252 \196\229\235\238 \238 \192\240\229\241\242\229 \226 \242\240\229\242\232\233 \241\235\238\242 \226\224\248\229\227\238 \232\237\226\229\237\242\224\240\255.")
 
    Talk ( 4, "\197\241\235\232 \243 \226\224\241 \229\241\242\252 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229 \232\235\232 \226\251 \238\242\225\251\235\232 \241\226\238\233 \241\240\238\234 \237\224\234\224\231\224\237\232\255,\242\238 \226\251 \236\238\230\229\242\229 \239\238\234\232\237\243\242\252 \242\229\240\240\232\242\238\240\232\254 \242\254\240\252\236\251.")
    InitTrigger()
    TriggerCondition( 1, Checkjlktime )
    TriggerAction( 1, TakeItem, 5724, 1)
    TriggerAction( 1, Leaveprison )
    TriggerCondition( 2, HasItem, 5723, 1)
    TriggerAction( 2, TakeItem, 5723, 1)
    TriggerAction( 2, Leaveprison )
    TriggerFailure( 2, JumpPage, 6)
    Text ( 4, "\207\238\242\226\229\240\228\232\242\252 \226\251\245\238\228", MultiTrigger, GetMultiTrigger(), 2)
    Text ( 4, "\223 \238\241\242\224\254\241\252 \231\228\229\241\252", CloseTalk)
 
    Talk ( 5, "\194\251 \237\229 \236\238\230\229\242\229 \226\231\255\242\252 \196\229\235\238 \238 \192\240\229\241\242\229!\207\240\238\226\229\240\252\242\229,\231\224\234\238\237\247\232\235\232 \235\232 \226\251 \234\226\229\241\242 [\207\243\242\252 \206\241\226\238\225\238\230\228\229\237\232\255].\197\241\235\232 \226\251 \229\227\238 \226\251\239\238\235\237\232\235\232 \232 \226\241\229 \229\249\229 \237\229 \236\238\230\229\242\229 \226\231\255\242\252 \196\229\235\238 \238 \192\240\229\241\242\229,\239\240\238\226\229\240\252\242\229 \226\224\248 \232\237\226\229\237\242\224\240\252 (\197\241\242\252 \235\232 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \232 \238\237 \237\229 \231\224\225\235\238\234\232\240\238\226\224\237).\194\229\241\252\236\224 \226\238\231\236\238\230\237\238 \247\242\238 \226\251 \243\230\229 \239\238\235\243\247\232\235\232 \238\228\237\238 \196\229\235\238 \238 \192\240\229\241\242\229.")
    Talk ( 6, "\194\251\239\238\235\237\229\237\251 \237\229 \226\241\229 \243\241\235\238\226\232\255.\194\251 \238\241\242\224\229\242\229\241\252 \231\228\229\241\252.")
 
    AddNpcMission   (6230)
 
end

function prison_talk03 ()
    Talk ( 1, "\204\224\241\242\229\240: \207\240\232\226\229\242 \226\232\237\238\226\224\242\251\233,\237\243 \247\242\238 \230\229 \245\238\247\229\248\252 \226\251\225\240\224\242\252\241\255 \238\242 \241\254\228\224 \240\224\237\252\248\229 \241\240\238\234\224? ")
    Text ( 1, "\196\224", JumpPage, 2)
 
    Talk ( 2, "\210\238\227\228\224 \242\229\225\229 \239\238\242\240\229\225\243\229\242\241\255 \245\238\240\238\248\229\237\252\234\238 \239\238\240\224\225\238\242\224\242\252.\207\240\232\237\229\241\232 \236\237\229 100 \210\254\240\229\236\237\238\233 \208\243\228\251,\232 100 \210\254\240\229\236\237\251\245 \193\240\184\226\229\237,\226 \231\224\236\229\237 \255 \228\238\227\238\226\238\240\254\241\252 \241 \205\224\247\224\235\252\237\232\234\238\236!")
    Text ( 2, "\194\238\242 \238\237\232!", JumpPage, 3)

    Talk ( 3, "\197\241\235\232 \243 \226\224\241 \229\241\242\252 \196\238\241\240\238\247\237\238\229 \206\241\226\238\225\238\230\228\229\237\232\229 \232\235\232 \226\251 \238\242\225\251\235\232 \241\226\238\233 \241\240\238\234 \237\224\234\224\231\224\237\232\255,\242\238 \226\251 \236\238\230\229\242\229 \239\238\234\232\237\243\242\252 \242\229\240\240\232\242\238\240\232\254 \242\254\240\252\236\251,\239\238\227\238\226\238\240\232\226 \241 \205\224\247\224\235\252\237\232\234\238\236! ")
    InitTrigger()
    TriggerCondition( 1, HasItem, 1670, 100)
	TriggerCondition( 1, HasItem, 7659, 100)
	TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
	TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
	TriggerAction( 1, TakeItem, 1670, 100)
	TriggerAction( 1, TakeItem, 7659, 100)
	TriggerAction( 1, GiveItem, 5723, 1, 4)
    TriggerFailure( 1, JumpPage, 5)
    Text(3,"\213\238\240\238\248\238 ",MultiTrigger,GetMultiTrigger(),1)

 
    Talk ( 5, "\204\229\237\255 \237\229 \238\225\236\224\237\243\242\252! ")
 
 
end


--���������
--������ ��� ������ ��������� ������������

function wedding_npc01()
 
    Talk(1, "\209\226\255\249\229\237\237\232\234: \207\240\232\226\229\242\241\242\226\243\254, \255 \240\229\227\232\241\242\240\232\240\243\254 \225\240\224\234." )
    Text(1, "\223 \245\238\247\243 \243\231\237\224\242\252 \242\240\229\225\238\226\224\237\232\255 \234 \225\240\224\234\243.", JumpPage, 2)
    Text(1, "\223 \245\238\247\243 \231\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252 \225\240\224\234.", JumpPage, 3)
    Text(1, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
   
   
    Talk(2, "\210\240\229\225\238\226\224\237\232\255: 1. \211 \236\238\235\238\228\238\230\229\237\238\226 \228\238\235\230\237\251 \225\251\242\252 \202\238\235\252\246\224 \209\226\255\242\238\227\238 \194\224\235\229\237\242\232\237\224. 2. \204\238\235\238\228\238\230\229\237\251 \196\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229. 3. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\240\232\237\229\241\242\232 10 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\251\245. 4. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\238\235\243\247\232\242\252 \232 \238\242\234\240\251\242\252 \241\226\238\232 \241\243\237\228\243\234\232 \244\229\233.")
    Text(2, "\213\238\240\238\248\238, \255 \239\238\237\255\235. \199\224\240\229\227\232\241\242\240\232\240\243\233\242\229!", JumpPage, 3)
    Text(2, "\196\224\233\242\229 \239\238\228\243\236\224\242\252...", CloseTalk)
   
   
    Talk(3, "\209\226\255\249\229\237\237\232\234: \197\241\235\232 \242\251 \227\238\242\238\226, \239\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232. \207\238\241\235\229 \240\229\227\232\241\242\240\224\246\232\232 \242\251 \239\238\235\243\247\232\248\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \209 \237\232\236 \236\238\230\237\238 \237\224\247\224\242\252 \246\229\240\229\236\238\237\232\254 \241\226\224\228\252\225\251 \243 \194\238\235\248\229\225\237\232\234\224 \215\232\242\224\237\224")
   
    InitTrigger()
    TriggerCondition(1, MarryCertificate)
    TriggerAction(1, JumpPage, 4)
    TriggerFailure(1, JumpPage, 5)
    Text(3, "\207\238\228\242\226\229\240\228\232\242\252", MultiTrigger, GetMultiTrigger(), 1)
    Text(3, "\196\224\233\242\229 \229\249\229 \240\224\231 \239\238\228\243\236\224\242\252.", CloseTalk)
   
   
    Talk(4, "\209\226\255\249\229\237\237\232\234: \207\238\231\228\240\224\226\235\255\254! \210\251 \242\238\235\252\234\238 \247\242\238 \239\238\235\243\247\232\235 \209\226\224\228\229\225\237\251\233 \241\229\240\242\232\244\232\234\224\242! \221\242\238 \241\224\236\251\233 \239\229\240\226\251\233 \248\224\227 \234 \225\240\224\234\243. \210\229\239\229\240\252 \238\247\229\240\229\228\252 \242\226\238\229\233 \239\238\235\238\226\232\237\234\232, \229\241\235\232 \243 \237\229\229 \226\241\229 \229\249\229 \237\229\242 \209\226\224\228\229\225\237\238\227\238 \241\229\240\242\232\244\232\234\224\242\224...")
    Text(4, "\209\239\224\241\232\225\238!", CloseTalk)
   
   
    Talk(5, "\209\226\255\249\229\237\237\232\234: \205\229 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \241\238\225\235\254\228\229\237\251! \207\238\230\224\235\243\233\241\242\224, \238\231\237\224\234\238\236\252\241\255 \241 \242\240\229\225\238\226\224\237\232\255\236\232 \234 \225\240\224\234\243.")
    Text(5, "\211\231\237\224\242\252 \241 \242\240\229\225\238\226\224\237\232\255\236\232 \234 \225\240\224\234\243.", JumpPage, 2)
    Text(5, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
 
end
 

--�������
--������ ���:
-- * ������� ������� �� ��������� ������
-- * ���������� ��������� �� �������
-- * ������� ����������� �� �������

function wedding_npc02()
   
    Talk( 1, "\204\224\233\235\224\228\224: \225\238\227 \236\232\235\238\241\229\240\228\229\237. \223 \239\240\232\227\235\224\248\224\254 \242\229\225\255 \237\224 \209\226\255\242\243\254 \231\229\236\235\254 \232\236\229\237\229\236 \241\226\238\229\227\238 \227\238\241\239\238\228\232\237\224!" )
    Text( 1, "\206 \214\229\240\234\226\232", JumpPage, 17)
 
    Talk( 17, "\204\224\233\235\224\228\224: \213\238\247\229\248\252 \224\240\229\237\228\238\226\224\242\252 \214\229\240\234\238\226\252? \223 \236\238\227\243 \241\228\229\235\224\242\252 \241\229\227\238\228\237\255 \241\234\232\228\234\243." )
    Text( 17, "\202\240\224\242\234\238\229 \238\239\232\241\224\237\232\229 \246\229\240\234\226\232", JumpPage, 6)
    Text( 17, "\214\229\240\234\238\226\237\224\255 \241\242\224\226\234\224", ListAuction)
    Text( 17, "\202\243\239\232\242\252 \225\232\235\229\242 \226 \246\229\240\234\238\226\252", JumpPage, 2 )
    Text( 17, "\202\243\239\232\242\252 \239\240\232\227\235\224\248\229\237\232\255", JumpPage, 5)
 
    InitTrigger()
    TriggerCondition( 1, HasMoney,5000 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerAction( 1, TakeMoney, 5000 )
    TriggerAction(1, GiveItem, 3024, 1 , 4)
    TriggerAction( 1, JumpPage, 3)
    TriggerFailure( 1, JumpPage, 4 )
    Talk(2, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\252 \253\242\238 \236\229\241\242\238 \227\228\229 \237\224\247\232\237\224\229\242\241\255 \241\247\224\241\242\252\229, \227\228\229 \235\254\225\238\226\252 \253\242\238 \227\235\224\226\237\238\229. \207\240\232\245\238\228\232 \237\224 \253\234\241\234\243\240\241\232\254 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234 \241 17:00 \228\238 17:10. \225\232\235\229\242 \241\242\238\232\242 \226\241\229\227\238 5000 \231\238\235\238\242\251\245.")
    Text(2, "\207\238\228\242\226\229\240\228\232\242\252 \239\238\234\243\239\234\243",  MultiTrigger, GetMultiTrigger(), 1)
 
    Talk(3, "\207\240\232\227\235\224\248\224\229\236 \237\224 \253\234\241\234\243\240\241\232\254 \226\238 \226\240\229\236\229\237\232.")
    Talk(4, "\204\224\233\235\224\228\224: \211 \242\229\225\255 \237\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224! \200\235\232 \231\224\225\235\238\234\232\240\238\226\224\237 \232\237\226\229\237\242\224\240\252. \207\238\236\237\232, \237\243\230\237\224 1 \239\243\241\242\224\255 \255\247\229\233\234\224.")
   
    Talk( 5, "\204\224\233\235\224\228\224: \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \228\235\255 \239\238\235\243\247\229\237\232\255 \241\238\238\242\226\229\242\241\242\226\243\254\249\232\245 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\245 \225\232\235\229\242\238\226. \202\224\230\228\251\229 10 \234\243\241\238\247\234\238\226 \239\240\232\227\235\224\241\232\242\229\235\252\237\238\227\238 \225\232\235\229\242\224 \241\238\241\242\224\226\235\255\254\242 \229\228\232\237\238\229 \246\229\235\238\229. 50 000 \231\238\235\238\242\251\245 \228\238\235\230\237\238 \225\251\242\252 \243\239\235\224\247\229\237\238 \231\224 1 \248\242\243\234\243. \207\240\232\227\235\224\241\232 \228\240\243\231\229\233 \237\224 \226\229\247\229\240\232\237\234\243!" )
    Text( 5, "\207\238\228\242\226\229\240\228\232\242\252 \239\238\234\243\239\234\243", ChangeItem, 1)
   
    Talk( 6, "\204\224\233\235\224\228\224: \206 \247\229\236 \242\251 \245\238\247\229\248\252 \243\231\237\224\242\252?" )
    Text( 6, "\206 \239\238\241\229\249\229\237\232\232", JumpPage, 7)
    Text( 6, "\206 \214\229\240\234\238\226\237\238\236 \224\243\234\246\232\238\237\229", JumpPage, 8)
    Text( 6, "\206\225 \232\241\239\238\235\252\231\238\226\224\237\232\232 \246\229\240\226\234\232", JumpPage, 9)
    Text( 6, "\206 \208\224\231\240\229\248\229\237\232\232 \214\229\240\234\226\232", JumpPage, 10)
 
    Talk( 7, "\204\224\233\235\224\228\224: \200\227\240\238\234\232 \234\238\242\238\240\251\229 \234\243\239\232\235\232 \225\232\235\229\242\251 \226 \246\229\240\234\238\226\252 \236\238\227\243\242 \239\238\241\229\242\232\242\252 \229\229 \241 17:00 \228\238 17:10 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234.")
    Text( 7, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 7, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 8, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\237\251\233 \192\243\234\246\232\238\237 \239\240\238\245\238\228\232\242 \241 18:00 \228\238 20:30 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234. \204\232\237\232\236\224\235\252\237\251\233 \248\224\227 \224\243\234\246\232\238\237\224: \209\242\224\226\238\247\237\224\255 \234\224\240\242\238\247\234\224. \214\229\240\229\236\238\237\232\232 \239\240\238\226\238\228\255\242\241\255 \239\238 2 \234\224\230\228\251\233 \226\251\245\238\228\237\238\233.")
    Text( 8, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 8, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 9, "\204\224\233\235\224\228\224: \214\229\240\234\238\226\237\251\233 \192\243\234\246\232\238\237 \239\238\228\229\235\229\237 \237\224 4 \239\229\240\232\238\228\224. \207\238\225\229\228\232\242\229\235\252 \239\238\235\243\247\224\229\242 \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \232 10 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\245 \225\232\235\229\242\238\226.")
    Text( 9, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 9, "\205\224\231\224\228", JumpPage, 6)
 
    Talk( 10, "\204\224\233\235\224\228\224: \208\224\231\240\229\248\229\237\232\229 \214\229\240\234\226\232 \239\238\231\226\238\235\232\242 \234\243\239\232\242\252 \239\240\232\227\235\224\241\232\242\229\235\252\237\251\229 \225\232\235\229\242\251, \228\226\238\233\237\238\229 \237\224\230\224\242\232\229 \239\238 \208\224\231\240\229\248\229\237\232\254 \239\229\240\229\236\229\241\242\232\242 \242\229\225\255 \226 \246\229\240\234\238\226\252. \209\239\243\241\242\255 2 \247\224\241\224 \226\241\229 \243\247\224\241\242\237\232\234\232 \225\243\228\243\242 \226\238\231\226\240\224\249\229\237\251 \226 \216\224\233\242\224\237.")
    Text( 10, "\207\238\228\242\226\229\240\228\232\242\252", CloseTalk)
    Text( 10, "\205\224\231\224\228", JumpPage, 6)
end
 

--���������
--������ ��� ������� �����������

function wedding_npc03()
 
    InitTrigger()
    TriggerCondition(1, CheckWeddingTime)
    TriggerAction(1, JumpPage, 1)
    TriggerFailure(1, JumpPage, 3)
    Start(GetMultiTrigger(), 1)
   
    Talk (1, "\209\226\232\228\229\242\229\235\252: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
 
    InitTrigger()
    TriggerCondition( 1, HasMoney, 200)
    TriggerAction(1, TakeMoney, 200)
    TriggerAction(1, LaunchFirework)
    TriggerFailure(1, JumpPage, 2)
 
    Text(1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
    Text(1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
 
    Talk(2, "\209\226\232\228\229\242\229\235\252: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
    Text(2, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
   
    Talk(3, "\209\226\232\228\229\242\229\235\252: \207\240\232\226\229\242! \202\224\234 \242\229\225\229 \226 \246\229\240\234\226\232?")
end
 

--�������������
--������ ��� ������� �����������

function wedding_npc04()
 
    InitTrigger()
    TriggerCondition(1, CheckWeddingTime)
    TriggerAction(1, JumpPage, 1)
    TriggerFailure(1, JumpPage, 3)
    Start(GetMultiTrigger(), 1)
   
    Talk (1, "\209\226\232\228\229\242\229\235\252\237\232\246\224: \207\240\232\226\229\242. \199\224 200 \231\238\235\238\242\251\245 \255 \236\238\227\243 \243\241\242\240\238\232\242\252 \228\235\255 \230\229\237\232\245\224 \241 \237\229\226\229\241\242\238\233 \227\240\224\237\228\232\238\231\237\251\233 \241\224\235\254\242. \213\238\247\229\248\252?")
 
    InitTrigger()
    TriggerCondition(1, HasMoney, 200)
    TriggerAction(1, TakeMoney, 200)
    TriggerAction(1, LaunchFirework)
    TriggerFailure(1, JumpPage, 2)
 
    Text (1, "\202\238\237\229\247\237\238!", MultiTrigger, GetMultiTrigger(), 1)
    Text (1, "\205\229\242, \241\239\224\241\232\225\238.", CloseTalk)
 
    Talk (2, "\209\226\232\228\229\242\229\235\252\246\224: \200\231\226\232\237\232\242\229, \237\238 \243 \194\224\241 \237\229\242 \228\229\237\229\227.")
    Text (2, "\196\238 \241\226\232\228\224\237\232\255.", CloseTalk)
   
    Talk(3, "\209\226\232\228\229\242\229\235\252\237\232\246\224: \207\240\232\226\229\242! \202\224\234 \242\229\225\229 \226 \246\229\240\234\226\232?")
end
 

--��������������
--������ ��� ������� ����������

function wedding_npc05()

	InitTrigger()
    TriggerAction(1, Marry)
    TriggerFailure(1, JumpPage, 4)
   
    Talk(1, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \193\229\240\229\248\252 \235\232 \242\251 \226  \231\224\234\238\237\237\251\229 \230\229\237\251(\236\243\230\252\255) \253\242\238\227\238 \247\229\235\238\226\229\234\224? \209\238\227\235\224\241\229\237(\224) \235\232 \242\251 \232 \226 \227\238\240\229 \232 \226 \240\224\228\238\241\242\232 \225\251\242\252 \241 \237\232\236?" )
    Text(1, "\196\224. \223 \241\238\227\235\224\241\229\237(\224).", MultiTrigger, GetMultiTrigger(), 1)
    Text(1, "\204\237\229 \237\224\228\238 \239\238\228\243\236\224\242\252...", CloseTalk)
   
    Talk(2, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \207\238\231\228\240\224\226\235\255\229\236 \194\224\241! \210\229\239\229\240\252 \194\251 \236\243\230 \232 \230\229\237\224!")
    Talk(3, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \223 \237\229 \236\238\227\243 \226\229\237\247\224\242\252 \194\224\241! \205\229 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \241\238\225\235\254\228\229\237\251!")
   
    Talk(4, "\207\229\240\226\238\241\226\255\249\229\237\237\232\234: \199\228\240\224\226\241\242\226\243\233, \243\228\224\247\237\238\233 \253\234\241\234\243\240\241\232\232 \239\238 \246\229\240\234\226\232...")
   
end

function reading_talk01 ()
 
    Talk (1, "\221\234\231\224\236\229\237\224\242\238\240: \205\224\228\229\254\241\252 \242\251 \226\241\184 \226\251\243\247\232\235? ")
        --Talk (1, "�����������: � ����������� ������, ���� �������� ���� ��������� �����. ������ ������������ ����� � ���������, ����� ������� ���������.")
 
    InitTrigger ()
    TriggerCondition (1, HasItem, 3279, 1)
    TriggerCondition (1, HasItem, 3289, 1)
    TriggerAction (1, checkcytime)
    TriggerFailure (1, JumpPage, 4)
    Text (1, "\207\229\240\229\226\238\228 \238\239\251\242\224 \241 \234\224\240\242\251", MultiTrigger, GetMultiTrigger (), 1)
        --Text (1, "������� ����� � �����.", MultiTrigger, GetMultiTrigger (), 1)
 
    Text (1, "\210\240\229\225\238\226\224\237\232\255 \228\235\255 \239\229\240\229\226\238\228\224 \238\239\251\242\224", JumpPage, 5)
        --Text (1, "���������� ��� �������� �����.", JumpPage, 5)
   
    Text (1, "\215\242\238 \229\249\229 \231\224 \242\229\241\242\232\240\238\226\224\237\232\229? ", JumpPage, 6)
        --Text (1, "��� ��� �� ������������?", JumpPage, 6)
 
    Talk (4, "\221\234\231\224\236\229\237\224\242\238\240: \194 \242\226\238\229\236 \232\237\226\229\237\242\224\240\229 \237\229\242 \209\242\243\228\229\237\247\229\241\234\238\233 \234\224\240\242\251!")
        --Talk (4, "�����������: � ����� ��������� ��� ������������ �����!")
 
    Talk (5, "\221\234\231\224\236\229\237\224\242\238\240: \210\240\229\225\238\226\224\237\232\255 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255 \241\242\240\238\227\232. \194 \242\226\238\229\236 \240\254\234\231\224\234\229 \228\238\235\230\237\224 \225\251\242\252 \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224.")
        --Talk (5, "�����������: ���������� ��� ����������� ������������ ������. � ����� ������� ������ ���� ������������ �����.")
 
    Talk (6, "\221\234\231\224\236\229\237\224\242\238\240: \194 \240\254\234\231\224\234\229 \228\238\235\230\237\224 \225\251\242\252 \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224 \228\235\255 \237\224\247\224\235\224 \242\229\241\242\232\240\238\226\224\237\232\255. \207\238\241\235\229 \226\251\239\238\235\237\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255, \194\224\236 \225\243\228\229\242 \226\251\228\224\237 \242\224\225\229\235\252 \238\225 \243\241\239\229\226\224\229\236\238\241\242\232 \226 \241\238\238\242\226\229\241\242\226\232\232 \241 \194\224\248\232\236\232 \243\241\239\229\245\224\236\232..")
        --Talk (6, "�����������: � ������� ������ ���� ������������ ����� ��� ������ ������������. ����� ���������� ������������, ��� ����� ����� ������ �� ������������ � ����������� � ������ ��������..")
 
    AddNpcMission (112)
 
end
 
function reading_talk02 () 
	Talk (1, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \223 \239\229\240\229\226\238\228\237\238\233 \253\234\231\224\236\229\237\224\242\238\240 \203\229\228\251\237\232. \223 \239\240\238\228\224\254 \242\229\241\242\238\226\251\229 \231\224\228\224\237\232\255 \228\235\255 \207\229\240\229\226\238\228\237\238\227\238 \253\234\231\224\236\229\237\224.")
		--Talk (1, "���������� �����������: � ���������� ����������� ������. � ������ �������� ������� ��� ����������� ��������.") 

	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, HasLeaveBagGrid, 1) 
	TriggerCondition (1, HasNoItem, 3280) 
	TriggerCondition (1, HasNoItem, 3281) 
	TriggerCondition (1, HasNoItem, 3282) 
	TriggerAction (1, AddChaItem7) 
	TriggerFailure (1, JumpPage, 2) 
	Text (1, "\223 \245\238\242\229\235 \225\251 \231\224\225\240\224\242\252 \242\229\241\242\238\226\251\229 \231\224\228\224\237\232\255!", MultiTrigger, GetMultiTrigger (), 1)
		--Text (1, "� ����� �� ������� �������� �������!", MultiTrigger, GetMultiTrigger (), 1) 

	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, CheckKJNum) 
	TriggerCondition (1, HasItem, 3280, 1) 
	TriggerCondition (1, HasItem, 3282, 1) 
	TriggerAction (1, AddChaItem8) 
	TriggerAction (1, TakeItem, 3282, 1) 
	TriggerFailure (1, JumpPage, 3) 
	Text (1, "\223 \226\251\239\238\235\237\232\235 \242\229\241\242 \232 \245\238\247\243 \239\238\235\243\247\232\242\252 \210\224\225\229\235\252 \243\241\239\229\226\224\229\236\238\241\242\232!", MultiTrigger, GetMultiTrigger (), 2) 
		--Text (1, "� �������� ���� � ���� �������� ������ ������������!", MultiTrigger, GetMultiTrigger (), 2) 
	
	InitTrigger () 
	TriggerCondition (1, CheckXSZCh) 
	TriggerCondition (1, HasItem, 3289, 1) 
	TriggerCondition (1, HasItem, 3281, 1) 
 	TriggerAction (1, checksjtime) 
 	TriggerFailure (1, JumpPage, 4)
	Text (1, "\194\238\231\252\236\232 \242\224\225\229\235\252 \232 \239\240\238\226\229\240\252 \241\226\238\232 \240\229\231\243\235\252\242\224\242\251!", MultiTrigger, GetMultiTrigger (), 1) 
		--Text (1, "������ ������ � ������� ���� ����������!", MultiTrigger, GetMultiTrigger (), 1) 

	Text (1, "\202\224\234\232\229 \242\240\229\225\238\226\224\237\232\255 \228\235\255 \239\240\238\245\238\230\228\229\237\232\255 \242\229\241\242\232\240\238\226\224\237\232\255?", JumpPage, 5) 
		--Text (1, "����� ���������� ��� ����������� ������������?", JumpPage, 5) 

	Text (1, "\215\242\238 \232\231 \241\229\225\255 \239\240\229\228\241\242\224\226\235\255\229\242 \242\229\241\242\232\240\238\226\224\237\232\229?", JumpPage, 6)
		--Text (1, "��� �� ���� ������������ ������������?", JumpPage, 6) 
 
	Talk (2, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\251 \237\229 \236\238\230\229\248\252 \237\224\247\224\242\252 \242\229\241\242. \207\240\238\226\229\240\252, \247\242\238 \226\241\229 \242\240\229\225\238\226\224\237\232\255 \226\251\239\238\235\237\229\237\251.") 
		--Talk (2, "���������� �����������: �� �� ������ ������ ����. �������, ��� ��� ���������� ���������.") 

	Talk (3, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \211 \242\229\225\255 \228\238\235\230\237\224 \225\251\242\252 \238\228\237\224 \225\243\236\224\227\224 \241 \242\229\241\242\238\236 \232 \238\228\232\237 \235\232\241\242 \241 \238\242\226\229\242\224\236\232 \228\235\255 \239\238\235\243\247\229\237\232\255 \242\224\225\229\235\255.") 
		--Talk (3, "���������� �����������: � ���� ������ ���� ���� ������ � ������ � ���� ���� � �������� ��� ��������� ������.") 

	Talk (4, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \211 \242\229\225\255 \237\229\242 \210\224\225\229\235\255 \243\241\239\229\226\224\229\236\238\241\242\232.")
		--Talk (4, "���������� �����������: � ���� ��� ������ ������������.") 

	Talk (5, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\240\229\225\238\226\224\237\232\255 \228\235\255 \243\247\224\241\242\232\255 \226 \207\229\240\229\226\238\228\237\238\236 \221\234\231\224\236\229\237\229 \241\235\229\228\243\254\249\232\229: \209\242\243\228\229\237\247\229\241\234\224\255 \234\224\240\242\224 \241 \239\238\235\237\251\236 \234\238\235\232\247\229\241\242\226\238\236 \238\239\251\242\224. \192 \242\224\234 \230\229, \243 \242\229\225\255 \237\229 \228\238\235\230\237\238 \225\251\242\252 \242\229\241\242\238\226\251\245 \225\243\236\224\227, \235\232\241\242\238\226 \241 \238\242\226\229\242\224\236\232 \232 \242\224\225\229\235\229\233 \243\241\239\229\226\224\229\236\238\241\242\232.")
		--Talk (5, "���������� �����������: ���������� ��� ������� � ���������� �������� ���������: ������������ ����� � ������ ����������� �����. � ��� ��, � ���� �� ������ ���� �������� �����, ������ � �������� � ������� ������������.") 

	Talk (6, "\207\229\240\229\226\238\228\237\238\233 \221\234\231\224\236\229\237\224\242\238\240: \210\251 \228\238\230\229\237 \239\238\235\243\247\232\242\252 \242\229\241\242 \239\229\240\229\228 \237\224\247\224\235\238\236 \207\229\240\229\226\238\228\237\238\227\238 \221\234\231\224\236\229\237\224. \207\238\241\235\229 \231\224\226\229\240\248\229\237\232\255 \242\229\225\229 \228\224\228\243\242 \235\232\241\242 \228\235\255 \238\242\226\229\242\238\226. \207\240\232\237\229\241\232 \236\237\229 \229\227\238 \232 \239\238\235\243\247\232\248\252 \242\224\225\229\235\252 \241 \238\246\229\237\234\238\233. \223 \237\224\227\240\224\230\243 \242\229\225\255 \239\238 \243\241\239\229\226\224\229\236\238\241\242\232.") 
		--Talk (6, "���������� �����������: �� ����� �������� ���� ����� ������� ����������� ��������. ����� ���������� ���� ����� ���� ��� �������. ������� ��� ��� � �������� ������ � �������. � ������� ���� �� ������������.") 
 
	AddNpcMission (6138) 

end

 function t_ckorb()
Talk( 1, " \206\241\242\240\238\226 \209\234\238\240\225\232,\242\238 \236\229\241\242\238 \227\228\229 \235\254\228\232 \242\229\240\255\254\242 \239\238\241\235\229\228\237\254\254 \237\224\228\229\230\228\243,\231\240\255 \226\251 \241\254\228\224 \239\240\232\248\235\232.... " )
Text( 1, " \207\240\238\226\238\228\232 \236\229\237\255 \226 \216\224\233\242\224\237 ", GoTo, 643, 871, "magicsea" )

 end

