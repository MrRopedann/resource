--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "Loading NPCScript06.lua" )
--�������� ���������
function Exchange_Reputation()
	Talk( 1, "������! � ���� �������� ���� ������ �� ���������! " )
	Text( 1, "���� ������ �� 10 ", JumpPage, 2)
	Text( 1, "���� ������ �� 50 ", JumpPage, 3)
	Text( 1, "���� ������ �� 100 ", JumpPage, 4)
	Text( 1, "���� ������ �� 500 ", JumpPage, 5)
	Text( 1, "���� ������ �� 1000 ", JumpPage, 6)
	Text( 1, "����. ", CloseTalk )
	
	Talk( 2, "�������� ���������� ������� �� 10 ��������� � �������� �����. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10 )
		TriggerAction( 1, DelRoleCredit, 10 )
		TriggerAction( 1, GiveItem, 7625, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," �1 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100 )
		TriggerAction( 1, DelRoleCredit, 100 )
		TriggerAction( 1, GiveItem, 7625, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," �10 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7625, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 2," �100 �� ",MultiTrigger,GetMultiTrigger(),1)
	Text( 2, "����. ", CloseTalk )
	
	Talk( 3, "�������� ���������� ������� �� 50 ��������� � �������� �����. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 50 )
		TriggerAction( 1, DelRoleCredit, 50 )
		TriggerAction( 1, GiveItem, 7622, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," �1 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 500 )
		TriggerAction( 1, DelRoleCredit, 500 )
		TriggerAction( 1, GiveItem, 7622, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," �10 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 5000 )
		TriggerAction( 1, DelRoleCredit, 5000 )
		TriggerAction( 1, GiveItem, 7622, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 3," �100 �� ",MultiTrigger,GetMultiTrigger(),1)
	Text( 3, "����. ", CloseTalk )
	
	Talk( 4, "�������� ���������� ������� �� 100 ��������� � �������� �����. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100 )
		TriggerAction( 1, DelRoleCredit, 100 )
		TriggerAction( 1, GiveItem, 7623, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," �1 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7623, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," �10 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10000 )
		TriggerAction( 1, DelRoleCredit, 10000 )
		TriggerAction( 1, GiveItem, 7623, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 4," �100 �� ",MultiTrigger,GetMultiTrigger(),1)
	Text( 4, "����. ", CloseTalk )
	
	Talk( 5, "�������� ���������� ������� �� 500 ��������� � �������� �����. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 500 )
		TriggerAction( 1, DelRoleCredit, 500 )
		TriggerAction( 1, GiveItem, 7624, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," �1 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 5000 )
		TriggerAction( 1, DelRoleCredit, 5000 )
		TriggerAction( 1, GiveItem, 7624, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," �10 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 50000 )
		TriggerAction( 1, DelRoleCredit, 50000 )
		TriggerAction( 1, GiveItem, 7624, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 5," �100 �� ",MultiTrigger,GetMultiTrigger(),1)
	Text( 5, "����. ", CloseTalk )
	
	Talk( 6, "�������� ���������� ������� �� 1000 ��������� � �������� �����. " )
	InitTrigger()
		TriggerCondition( 1, HasCredit, 1000 )
		TriggerAction( 1, DelRoleCredit, 1000 )
		TriggerAction( 1, GiveItem, 7830, 1, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," �1 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 10000 )
		TriggerAction( 1, DelRoleCredit, 10000 )
		TriggerAction( 1, GiveItem, 7830, 10, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," �10 �� ",MultiTrigger,GetMultiTrigger(),1)
	InitTrigger()
		TriggerCondition( 1, HasCredit, 100000 )
		TriggerAction( 1, DelRoleCredit, 100000 )
		TriggerAction( 1, GiveItem, 7830, 100, 4 ) 
		TriggerFailure( 1, JumpPage, 7)
		Text( 6," �100 �� ",MultiTrigger,GetMultiTrigger(),1)
	Text( 6, "����. ", CloseTalk )
	
	Talk( 7, "� ��� ������������ ��������� ��� ������! ")
	Text( 7, "�����, �����. ", CloseTalk )
end

function t_povar ()
Talk( 1, "� ����� ������ �������! " )
Text( 1, " ��� �� ����? ", JumpPage, 2)

Talk( 2, "��������� ������ �� ��� " )
Text( 2, " ������� ", JumpPage, 3)
Text( 2, " ������ ", JumpPage, 4)
Text( 2, " ���������� ", JumpPage, 5)
Text( 2, " �������� ���� ", JumpPage, 6)
Text( 2, " ������������� ", JumpPage, 7)


Talk(3," ����� 5 ������� � � ���� 5 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7456,5 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2791,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 9)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," ����� 5 ������� � � ���� 5 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7456,5 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2792,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 9)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(5," ����� 5 ������� � � ���� 5 ����������� " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7456,5 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2793,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 9)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 5 ������� � � ���� 5 ���������� ���� " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7456,5 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2794,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 9)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(7," ����� 5 ������� � � ���� 5 ������������� " )
InitTrigger()
TriggerCondition( 1, HasItem,7456,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7456,5 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2804,5,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 9)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," �� ��� ������, ������� �������� ����? ����������! " )

end


function t_krilia ()

	Talk( 1, "��������,� ������� ���� ���,� ������ ���� ������ ��������� ������� " )
	Text( 1, "����������", BuyPage)


InitTrade  ()
Weapon(	7970	)
Weapon(	7971	)
Weapon(	7972	)
Weapon(	7973	)
Weapon(	7974	)
Weapon(	7975	)
Weapon(	7976	)
Weapon(	7977	)
Weapon(	7978	)
Weapon(	7979	)
Weapon(	7980	)
Weapon(	7981	)
Weapon(	7982	)
Weapon(	7983	)
Weapon(	7984	)
Weapon(	7985	)
Weapon(	7986	)
Weapon(	7987	)
Weapon(	7988	)
Weapon(	7989	)
Weapon(	7990	)
Weapon(	7991	)
	AddNpcMission ( 2039 )

end


function t_loterea ()

	Talk( 1, "�������,������ ����� �� ������� �������� ���� ����� � ����� ������������� �������! " )
	Text( 1, "��� " )

end

function t_ecxangert ()
    Talk( 1, "����������, ��������� ������ ��� ������� �������,�� ��������� ���� ���������,������� ������ �������� � ���� �� ������ ���� ���� " )
    Text( 1, "����� ", JumpPage, 2)

    Talk( 2, "������� " )
    Text( 2, "������ �������������� +1", JumpPage, 3)
    Text( 2, "������ ��������� ", JumpPage, 4)
    Text( 2, "������� � ������ ", JumpPage, 5)
    Text( 2, "������ ����� ", JumpPage, 6)
    Text( 2, "������ �������� ", JumpPage, 7)
    --Text( 2, "�������� �� ��� ", JumpPage, 8)
    --Text( 2, "����� � ������ ", JumpPage, 9)
    Text( 2, "����� ", JumpPage, 10)
	
	
	Talk( 10, "������� " )
    Text( 10, "������ ��������� ���������� ", JumpPage, 17)
	Text( 10, "����� ������ ", JumpPage, 18)
	Text( 10, "��������� ������ ", JumpPage, 19)
	Text( 10, "��������� ���� ", JumpPage, 20)
	Text( 10, "����� ����� ��� ", JumpPage, 21)
	Text( 10, "���� ���� ", JumpPage, 22)
	Text( 10, "���� ����� ", JumpPage, 23)
	Text( 10, "���� ����� ", JumpPage, 24)
	Text( 10, "���� ������ ", JumpPage, 25)


    Talk(3,"������ ������������� ������� ��� 1 ���� �������������,��������� 100 ��������� ")
    Text(3,"1 ����� ", JumpPage, 27)
	Text(3,"10 ���� ", JumpPage, 28)
	Text(3,"100 ���� ", JumpPage, 29)
	
	Talk(27,"������ ������������� ������� ��� 1 ���� �������������,��������� 100 ��������� ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 100 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 7453,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(27,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(28,"������ ������������� 10 ����,��������� 1000 ��������� ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 1000 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7453,10,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(28,"����� " ,MultiTrigger,GetMultiTrigger(),1)


	Talk(29,"������ ������������� 100 ����,��������� 10.000 ��������� ")
	InitTrigger()
    TriggerCondition( 1, HasCredit, 10000 )
    TriggerCondition( 1, HasLeaveBagGrid, 3 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 10000 )
    TriggerAction( 1, GiveItem, 7453,100,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(29,"����� " ,MultiTrigger,GetMultiTrigger(),1)


    Talk(4,"������ ��������� ����� ������ 2000 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,2000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 2000 )
    TriggerAction( 1, GiveItem, 7451,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(4,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(5,"������� � ������ ����� ������ 1000 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 7489,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(5,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(6,"������ ����� ����� ������ 500 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 7484,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(6,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(7,"������ �������� ����� ������ 150 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 684,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(7,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(8,"�������� �� ��� ����� ������ 5 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,5)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 5 )
    TriggerAction( 1, GiveItem, 7456,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(8,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(9,"����� � ������ 1 ������� - 100.����� � ������ 2 ������� - 300.����� � ������ 3 ������� - 500.����� � ������ 4 ������� - 750.����� � ������ 5 ������� - 1000 ")
    Text( 9, "1 ������� ", JumpPage, 11)
    Text( 9, "2 ������� ", JumpPage, 12)
	Text( 9, "3 ������� ", JumpPage, 13)
	Text( 9, "4 ������� ", JumpPage, 14)
	Text( 9, "5 ������� ", JumpPage, 15)


    Talk(11,"1 ������� ����� ������ 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 1145,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(11,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(12,"2 ������� ����� ������ 300 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,300)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 300 )
    TriggerAction( 1, GiveItem, 2729,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(12,"����� " ,MultiTrigger,GetMultiTrigger(),1)

    Talk(13,"3 ������� ����� ������ 500 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,500)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 500 )
    TriggerAction( 1, GiveItem, 2753,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(13,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(14,"4 ������� ����� ������ 750 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,750)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 750 )
    TriggerAction( 1, GiveItem, 2777,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(14,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(15,"5 ������� ����� ������ 1000 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,1000)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 1000 )
    TriggerAction( 1, GiveItem, 2801,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(15,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	 Talk(17,"������ ��������� ���������� ����� ������ 200 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,200)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 200 )
    TriggerAction( 1, GiveItem, 7482,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(17,"����� " ,MultiTrigger,GetMultiTrigger(),1)

	Talk(18,"����� ������ ����� 150 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 271,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(18,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(19,"��������� ������ ����� 150 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 5710,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(19,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(20,"��������� ���� ����� 150 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,150)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 150 )
    TriggerAction( 1, GiveItem, 5702,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(20,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(21,"����� ����� ��� ����� 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 578,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(21,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(22,"���� ���� ����� 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 267,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(22,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(23,"���� ����� ����� 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 268,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(23,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(24,"���� ����� ����� 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 269,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(24,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(25,"���� ������ ����� 100 ��������� ")
    InitTrigger()
    TriggerCondition( 1, HasCredit,100)
    TriggerCondition( 1, HasLeaveBagGrid, 1 )
    TriggerCondition( 1, KitbagLock, 0 )
    TriggerAction( 1, DelRoleCredit, 100 )
    TriggerAction( 1, GiveItem, 270,1,4 )
    TriggerFailure( 1, JumpPage, 16)
    Text(25,"����� " ,MultiTrigger,GetMultiTrigger(),1)
	
	Talk(16,"�� ������� ���� �������� ")
	
	
	AddNpcMission ( 922 )
	AddNpcMission ( 923 )
	
	
end

function t_lotterity ()
    Talk( 1, "������ �������,������ ����� �� ������� �������� � ���� ���� �����,������� � ���� ���������� ����� �� ������ ���,������,���� ���� ����!��� ��� ���������� �� � �����,����� ��� ���������� ����) " )
    Text( 1, "������ �� ���!) ", JumpPage, 2)
	
	end
	
function r_talk219()
	Talk( 1, "��������,��� ������� ������ ������� �������� " )
	Text( 1, "������ ", GoTo, 649, 873, "magicsea" )
	Text( 1, "���������� �� ������ ",JumpPage, 2 )

	Text( 2, "������� ", JumpPage, 3)
	Text( 2, "����� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "���� ����� ", JumpPage, 5)
	
	Talk( 4, "� ������ ������ ����� ������������: " )
	Text( 4, "����� ����� ", CloseTalk )
	

	Talk( 5, "���� �����,����� ����������� - 30 ������,������ ���������� ���������: " )
	Text( 5, "������ ���������� ��������� ", CloseTalk)
	Text( 5, "���� ���������� ��������� ", CloseTalk)
	Text( 5, "������ ������� ", CloseTalk)
	Text( 5, "������ ������������ 10 ����� ", CloseTalk)
	
	AddNpcMission	(223)
	AddNpcMission	(224)
	AddNpcMission	(225)
	AddNpcMission	(226)
	
	end
	
function GoTotim()
Talk( 1, "�����������,���� ���������,�� ���� ����� �� ���������������� ������!�������� � ������� ����� ���������� �������! " ) 
Text( 1, "������ ", JumpPage, 3 )
Text( 1, "������� ", JumpPage, 2 )
Text( 1, "���� ", JumpPage, 6 )
--Text( 1, "\194 \240\224\231\240\224\225\238\242\234\229 ", JumpPage, 5 )

Text( 2, "������ ����� ", GoTo, 355, 168, "CrystalShore" )

Text( 3, "������ ", GoTo, 648, 876, "magicsea" )
Text( 3, "\202\224\235\232\237\228\238\240 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 76, 100, "kisles" )
Text( 3, "\199\229\235\229\237\238\227\240\224\228 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 285, 367, "AUST" )
Text( 3, "\195\238\240\238\228 \198\232\231\237\232 (\196\238\228\229\235\251\226\224\229\236) ", GoTo, 156, 87, "AngelIsle" )

--Text( 4, "NEW 1. ", GoTo, 84, 78, "basement" )
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


--Text( 6, "\216\224\245\242\251 (\199\238\235\238\242\238) ", GoTo, 1366, 3029, "magicsea" )


Text( 7, "\205\224\231\224\228 ", JumpPage, 6 )
Text( 7, "\209\234\238\240\239\232\238\237\251 (\211\240. 750-800) ", GoTo, 622, 3050, "magicsea" )
Text( 7, "\194\238\235\234\232 (\211\240. 850-900) ", GoTo, 763, 2891, "magicsea" )
Text( 7, "\202\224\225\224\237\251 (\211\240. 950-1000) ", GoTo, 1013, 2930, "magicsea" )

 end
 
 
function GoTotiim()
Talk( 1, "������ " ) 
Text( 1, "����� ����� ", GoTo, 157, 129, "CrystalShore" )

end




