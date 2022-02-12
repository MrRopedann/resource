--------------------------------------------------------------------------
--									--
--									--
--		NPCScript07.lua Created by knight.gong 2005.7.12.	--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading NPCScript07.lua" )


function r_mi1kovay3()

	Talk( 1, " ������,� ���� �������� ���� �� ����� ������������ " )
	Text( 1, " �������� ", JumpPage, 2)

	Talk( 2, "\205\243 \226\238\242, \226\251\225\232\240\224\233 \247\242\238 \242\229\225\229 \237\224\228\238!" )
	Text( 2, "\202\224\240\242\224 \239\229\240\226\238\227\238 \239\229\240\229\240\238\230\228\229\237\232\255", JumpPage, 5)

	Talk(5," �������� ������ ����� �� 25 ����� ")
	InitTrigger()
	TriggerCondition( 1, HasItem,3457,25 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3457,25 )
	TriggerAction( 1, GiveItem, 2941,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(5,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk(6,"\207\238\236\229\237\255\242\252 \239\238\234\240\238\226\232\242\229\235\252\241\242\226\238 \225\238\227\232\237\232 \226\241\229\227\238 \237\224 1 \234\229\235\252?")
	InitTrigger()
	TriggerCondition( 1, HasItem,3457,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 3457,1 )
	TriggerAction( 1, GiveItem, 938,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(6,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk(7,"\207\238\236\229\237\255\242\252 \202\235\254\247 \247\229\240\237\238\227\238 \228\240\224\234\238\237\224 \237\224 \208\243\237\243 \194\242\238\240\238\227\238 \239\229\240\229\240\238\230\228\229\237\232\255?")
	InitTrigger()
	TriggerCondition( 1, HasItem,182,1 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerAction( 1, TakeItem, 182,1 )
	TriggerAction( 1, GiveItem, 5853,1,4 )
	TriggerFailure( 1, JumpPage, 17)
	Text(7,"\196\224",MultiTrigger,GetMultiTrigger(),1)

	Talk( 17, "\200\231\226\229\237\232, \237\238 \243 \242\229\225\255 \247\229\227\238\242\238 \237\229 \245\226\224\242\224\229\242 ..." )

end

function Unseal_75_1()

Talk( 1, " ����� �� ������ �������� ���� ���� � ��� �� 100 ���� " )
Text( 1, " 100 ���� ", JumpPage, 2)

Talk( 2, " ������ ����� ����� �� �����! " )
Text( 2, " 100 ���� ", JumpPage, 9)
Text( 2, " 100 ���� ", JumpPage, 10)
Text( 2, " 100 ���� ", JumpPage, 11)
Text( 2, " 100 ����� ", JumpPage, 12)
Text( 2, " ����.100 ���� ", JumpPage, 13)

Talk(9," ����� 500 ��� ����,������ ���(���� ����� � �.�) �� 150�� � 120�� ���� �� ���. ��.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0267,150 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0268,150 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0269,150 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0270,150 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2608,120 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,500 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 267,150 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 268,150 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 269,150 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 270,150 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2608,120 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerAction( 1, GiveItem, 826,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(9," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ����� 900 ��� ���� ������ ���(���� ����� � �.�) �� 180�� � 150 ���� �� ���. ��.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,900 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0267,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0268,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0269,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0270,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2608,150 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,900 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 267,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 268,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 269,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 270,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2608,150 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 825,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(10," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ����� 500 ��� ���� ������ ���(���� ����� � �.�) �� 180�� � 120 ���� �� ���. ��.! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0267,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0268,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0269,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0270,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2608,120 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,500 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 267,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 268,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 269,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 270,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2608,120 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 827,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(11," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ����� 500 ��� ���� ������ ���(���� ����� � �.�) �� 180�� � 80 ���� �� ���. ��. 200 ���� �������� � 300 ������� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,500 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0267,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0268,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0269,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0270,180 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2608,80 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2609,200 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2610,300 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,500 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 267,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 268,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 269,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 270,180 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2608,80 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2609,200 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2610,300 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 3334,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(12," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ����� 700 ��� ����,������ ���(���� ����� � �.�) �� 250�� � 220�� ���� �� ���. ��,130�� ���! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,700 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0267,250 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0268,250 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0269,250 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,0270,250 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2608,220 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,7355,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,700 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0267,250 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0268,250 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0269,250 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0270,250 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2608,220 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerAction( 1, TakeItem, 7355,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 1125,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(13," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )

end

function Unseal_75_3()

Talk( 1, " ����� �� ������ �������� ���� ���� �� �� 75��� ������ " )
Text( 1, " �����! ", JumpPage, 2)

Talk( 2, " ������ ����� ������ �� ������ ! " )
Text( 2, " 75 ��� �� ����� ", JumpPage, 8)
Text( 2, " 75 ����� �� ����� ", JumpPage, 9)
Text( 2, " 75 ���� �� ����� ", JumpPage, 10)
Text( 2, " 75 ���� �� �� ", JumpPage, 11)
Text( 2, " 75 ���� �� �� ", JumpPage, 12)
Text( 2, " 75 ����� �� ��� ", JumpPage, 13)

Talk(8," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2332,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(8," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2338,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(9," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2334,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(10," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2344,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(11," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2342,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(12," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(13," ����� 15 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,1 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 2336,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 16)
Text(13," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," ��-��-��! �� ���� �� �������! ����� ���� ��� ���� ������ " )
Text(14," ������! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end

function Unseal_95_2()
Talk( 1, " ��� �� �������� ����?! �� ������� ����� ����� �����?! ���?! ����� ����������! " )
Text( 1, " ��, ���� 95 ���� ����� ", JumpPage, 2)
Text( 1, " ��, ���� 95 ���� ��� ", JumpPage, 8)

Talk( 2, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 2, " ����� ������(����) ", JumpPage, 3)
Text( 2, " ���������� ������(����) ", JumpPage, 4)
Text( 2, " �������������� ������(��������) ", JumpPage, 5)
Text( 2, " ����������� ���(������� ���) ", JumpPage, 6)
Text( 2, " ���������� ������(������) ", JumpPage, 7)

Talk( 8, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 8, " ����� ����������(����) ", JumpPage, 9)
Text( 8, " ���������� ����������(����) ", JumpPage, 10)
Text( 8, " �������������� ����������(��������) ", JumpPage, 11)
Text( 8, " ��������� ������(������) ", JumpPage, 12)
Text( 8, " ���������� ����������(������) ", JumpPage, 13)

Talk(3," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6113,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6115,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6114,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6101,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ����� 35 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,35 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,35 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6112,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6117,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(9," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6119,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(10," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6118,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(11," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6100,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(12," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ����� 40 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,40 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,40 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 6116,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(13," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end

function r_talk04 ()

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 1, " ����: ������! � ��������� ����. ��� �� ����� ����� � �������? " )
	Text( 1, " ������ ��������� ", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 1, " ������ ���� �����! ", MultiTrigger,GetMultiTrigger(),2)
	--Text( 1, "Build Ship", JumpPage, 10)

	Talk( 2, " ����: ������, �� ������ ��������� ���� 200g. " )

	Talk( 3, " ����: ������! ��������� ����� 50g " )

	Talk( 4, "I do not have any letter. I guess you got the wrong person" )

	Talk( 5, "Ya? Forget it...Thank you. Take this reward for your hard work." )
		
	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReAll )
	TriggerCondition( 2, HasMoney, 200 )
	TriggerAction( 2, TakeMoney, 200 )
	TriggerAction( 2, ReAll )
	TriggerFailure( 2, JumpPage, 2 )

	Talk( 6, "Gina: Hello! I am Nurse Gina. Look for me if you are sick or injured!" )
	Text( 6, "Greater Heal", MultiTrigger,GetMultiTrigger(),2)

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 6 )
	TriggerCondition( 1, HasRecord, 500 )
	TriggerAction( 1, ReHp, 50 )
	TriggerCondition( 2, HasMoney, 50 )
	TriggerAction( 2, TakeMoney, 50 )
	TriggerAction( 2, ReHp,50 )
	TriggerFailure( 2, JumpPage, 3 )

	Text( 6, "Heal", MultiTrigger,GetMultiTrigger(),2)
	

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

function Unseal_65 ()
Talk( 1, " ��� �� �������� ����?! �� ������� ����� ����� �����?! ���?! ����� ����������! " )
Text( 1, " ��, ���� ����� +14 ", JumpPage, 2)

Talk( 2, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 2, " �� ��� +14 ", JumpPage, 3)
Text( 2, " �� ��� +14 ", JumpPage, 4)
Text( 2, " �� ��� +14 ", JumpPage, 5)
Text( 2, " �� ��� +14 ", JumpPage, 6)
Text( 2, " �� ��� +14 ", JumpPage, 7)


Talk(3," ����� 30 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,30 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7108,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ����� 30 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,25 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7110,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 30 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,25 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7109,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 30 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,25 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7112,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ����� 30 �����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,25 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,25 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7111,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end


function r_talk11 ()
Talk( 1, " ��� �� �������� ����?! �� ������� ����� ����� �����?! ���?! ����� ����������! " )
Text( 1, " ��, ���� ����� +14 ", JumpPage, 2)

Talk( 2, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 2, " �� ��� +14 ", JumpPage, 3)
Text( 2, " �� ��� +14  ", JumpPage, 4)
Text( 2, " �� ��� +14 ", JumpPage, 5)
Text( 2, " �� ��� +14 ", JumpPage, 6)
Text( 2, " �� ��� +14 ", JumpPage, 7)


Talk(3," ����� 15 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7108,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ����� 15 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7110,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 15 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7109,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 15 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7112,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ����� 15 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,15 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7111,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end

function r_talk06 ()
Talk( 1, " ��� �� �������� ����?! �� ������� ����� ����� �����?! ���?! ����� ����������! " )
Text( 1, " ��, ���� �� �������� ", JumpPage, 2)

Talk( 2, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 2, " 2�� �� ���� ", JumpPage, 3)
Text( 2, " 2�� �� �������  ", JumpPage, 4)
Text( 2, " 2�� �� ��� ", JumpPage, 5)
Text( 2, " 2�� ����� ", JumpPage, 6)
Text( 2, " 3�� �� ���� ", JumpPage, 7)
Text( 2, " 3�� �� ������� ", JumpPage, 8)
Text( 2, " 3�� �� ��� ", JumpPage, 9)
Text( 2, " 3�� �� ����� ", JumpPage, 10)


Talk(3," ����� 50 ��� ����, 99 �������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,50 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,99 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,50 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,99 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0136,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ����� 50�����, 99 �������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,99 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,50 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,99 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0139,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 50�����, 99�������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,99 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,50 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,99 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0132,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 50�����, 99�������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,50 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,99 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0129,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ����� 80 ��� ����, 90 �������, 15 ���.������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,50 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,271,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,80 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,90 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0271,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0137,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ����� 80 ��� ����, 90 �������, 15 ���.������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,50 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,271,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,80 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,90 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0271,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0140,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(8," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ����� 80 ��� ����, 90 �������, 15 ���.������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,50 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,271,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,90 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,90 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0271,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0133,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(9," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ����� 80�����, 90 �������, 15 ������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,60 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,1000,50 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,271,5 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,80 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 1000,90 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 0271,15 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 0130,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(10," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end

function forger ()
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
	Defence( 6946	)
	Defence( 890	)
	Defence()
	Defence( 456	)
	Defence( 1020	)
	Defence()
	Defence()
	Defence( 3074	)
	Defence( 3075	)	

end

function bank ()
	
	
	Talk( 1,  "������: ������! � ������ ������! � ����� ����� ���� ���� ������ ��� �������� �������! " )
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, OpenBank )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1,  "��������� (��������� 200 �������) ", MultiTrigger, GetMultiTrigger(), 1)
	Talk( 2,  "��������, �� �� ������ ����������� ���������� ������! " )



end 

function pricha()

	Talk( 1,  "����������: ������! �� ������� ������� ���� ������� ��������? " )
	Text( 1,  "������ �������������� �������������� ", BuyPage )
	Text( 1,  "� ���� ������� �������� ", JumpPage, 2)

	InitTrade()
	Weapon(	1807	)
	Weapon(	1805	)
	Weapon(	1804	)
	Weapon(	1806	)
	Weapon(	6106	)
	Defence(	1798	)
	Defence(	1800	)
	Defence(	1801	)
	Defence(	1803	)
	Defence(	1797	)
	Defence(	1799	)
	Defence(	1802	)
	Defence(	4610	)
	Defence(	4609	)
	Defence(	4607	)	
	Other(	931	)
	Other(	932	)
	Other(	933	)
	Other(	934	)
	Other(	1808	)
	Other(	1809	)
	Other(	1810	)
	Other(	1811	)
	
	InitTrigger()
	TriggerCondition( 1, HasItem, 1807, 1 )
	TriggerAction( 1, OpenHair )
	TriggerFailure( 1, JumpPage, 3 )
	Talk( 2,  "����������: �������. �� ��� ����������� �������������� ��������! ")
	Text( 2,  "��, � ���� ", MultiTrigger, GetMultiTrigger(), 1)
	Text( 2,  "������ ", CloseTalk )

	Talk( 3,  "����������: � ���� ��� �������������� ��������! ")


end

function vra43 ()

Talk( 1, " ������,� ���� �������� ���� ���� �� ���! " )
Text( 1, " ��, ���� ����!!! ", JumpPage, 2)

Talk( 2, " ������ ����� 10 ��� ���� � �� �������� 20 ������.������ � 20 ����������� �����! " )
Text( 2, " �����! ", JumpPage, 3)

Talk(3," ����� 10 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,10 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,10 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 1083,20,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerAction( 1, GiveItem, 4024,20,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1) 

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end

function shai ()
	
	
	Talk( 1,  "����: ������ � ���� ����� ��������� ����������. ���� �� ��������� �������� � ������ �����. " )
	Text( 1,  "���� ", BuyPage )
	Text( 1,  "���������� ���������� ", OpenUnite)
	Text( 1,  "���������� ����� ���������� ",JumpPage, 2 )
	Text( 1,  "������... ",CloseTalk )

	InitTrade()
	Other(	3206	)
	Other(	3208	)
	Other(	3205	)
	Other(	3242	)
	Other(	3210	)
	Other(	3207	)
	Other(	3211	)
	Other(	3215	)
	Other(	3212	)
	Other(	3209	)
	Other(	3220	)
	Other(	3222	)
	Other(	3219	)
	Other(	3218	)
	Other(	3216	)
	Other(	3223	)
	Other(	3217	)
	Other(	3224	)
	Other(	3225	)
	Other(	3226	)
	Other(	3294	)
	Other(	3295	)
	Other( 3296 )
	Other( 886 )
	--baby--�������Lv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
	Other(  2440    )

	AddNpcMission	(1161)
	AddNpcMission	(152)
	AddNpcMission	(153)
	AddNpcMission	(154)
	--AddNpcMission	(5500)

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
	Talk( 2,  "����: ��� ������������ ����� ���������� ���������� 1 ���������� ������, 10000 ������ � 10 ���� ����� �������� 3 ������. " )
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

	Talk( 3,  "����: �������� � �����������. " )
	Talk( 4,  "����: � ��� ��� ���� ����������� ������������ ��� ��������� ���� � ���������. �������� ����� � ��� ������������ ���������. " )

end 

function argent ()

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

function ledin ()
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
	Other( 3296 )
	--baby--�������Lv1
	Other(	2679	)
	Other(	2689	)
	Other(	2699	)
	Other(	2709	)
	--Leo
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

function fargite () 

	Talk( 1, "��� �� �������: ������, ���� �� ���������, �� � ����� �� ���������� ���� � ����-�������. ��������� =)" )
	Text( 1,  "��� ��? ",JumpPage, 3 )
	Text( 1,  "� ���� ��� ������? ",JumpPage, 4 )
	Text( 1,  "��� ����� �������� ���? ",JumpPage, 5 )
	Text( 1,  "��� ����� ����, ����? ", JumpPage, 6 )
	Text( 1,  "��� ����� ������? ", JumpPage, 7 )
	Text( 1,  "��� ��������� ���� �� 99 ��? ", JumpPage, 8 )
	Text( 1,  "��� ����� ����? ", JumpPage, 9 )
	Text( 1,  "��� ����� �������? ", JumpPage, 10 )


        Talk( 3, "� ������� �� ������� ������� ����-�������. ���� � ��� �������� ����� �� ���������, �� ����� ���� :)" )
	Text( 3,  "�����. ", JumpPage, 1)
	Talk( 4, "����� ���� ������� ����� �����������, ������� ��� ����� ���� ���� ������ ����� � ����, ���� �� ����� ���� ����, �� ������� ��� ����� ���� �� ������ 100 ���." )
	Text( 4,  "�����. ", JumpPage, 1)
	Talk( 5,  "� ������� � ������� ���� �������� �� ������ �����, ��� - �� �� �� � ������. " )
	Text( 5,  "�����. ", JumpPage, 1)
	Talk( 6,  "� ������� ����� � �������� �� ����� ���������� �� �����. " )
	Text( 6,  "�����. ", JumpPage, 1)
	Talk( 7,  "�� ����� ������� ������, ������� ����� ����� ����������� �������, �� ����� �������. " )
	Text( 7,  "�����. ", JumpPage, 1)
	Talk( 8,  "��� ��� ��������� ����, �������� ��?! ��������� ��� �� 10000. ���� ���� ����� ��������� �� �� 99, ����� ���� ������� ��������� � ��������, �� ������ ������������ ���������� ����� ����� � ����, � ����� � ����� ������������ � ������ ������ ��������� �� 99 ��. " )
	Text( 8,  "�����. ", JumpPage, 1)
	Talk( 9,  "���� �� �������, �� ���� ����� ���� � ���-����, ������� � �� ����� ����� ����������� ���� ����. ��������� �� �� ����� ������ �������. ��� � ����� �� ������ �������� ������� ������� ������� �������� � �������-���� �� ���� ���������� ����.  ���� �� ��� ������� �����, �� ������ ������� ���� � ��������� ����, ����������� �� �� ����� ������ �������, ������ ��� ���� �� ���, ������� � 00:00 " )
	Text( 9,  "�����. ", JumpPage, 1)
	Talk( 10,  "������� ����� ������� � ������ ���������� ����, �� 1 � 2 �����. ���� �� �������� ����������, ��� ��� ������ � ����� ������� ������. " )
	Text( 10,  "�����. ", JumpPage, 1)

end

function arenko ()

	Talk( 1,  "������������� �����: ������! � ������������� �����! �� ������� ����������� ���� ���� � ������� ����� ������ �������? " )	
	Text( 1,  "�������� ������ ������ ", JumpPage, 2)
	--Text( 1,  "����� ����� ", JumpPage, 3)
	Text( 1,  "�������� ���� ������ ������ ", JumpPage, 3)
	--Text( 1,  "�������� ����� ����������� ", SetSpawnPos,  "Arenaa")

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

function m_Certificate()
	Talk(1, "\209\226\255\249\229\237\237\232\234: \207\240\232\226\229\242\241\242\226\243\254, \255 \240\229\227\232\241\242\240\232\240\243\254 \225\240\224\234." )
	--Talk(1, "���������: �����������, � ����������� ����." )
	Text(1, "\223 \245\238\247\243 \243\231\237\224\242\252 \242\240\229\225\238\226\224\237\232\255 \234 \225\240\224\234\243.", JumpPage, 2)
	--Text(1, "� ���� ������ ���������� � �����.", JumpPage, 2)	
	Text(1, "\223 \245\238\247\243 \231\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252 \225\240\224\234.", JumpPage, 3)
	--Text(1, "� ���� ���������������� ����.", JumpPage, 3)	
	Text(1, "\199\224\240\229\227\232\241\242\240\232\240\238\226\224\242\252\241\255 \239\238\231\230\229.", CloseTalk)
	--Text(1, "������������������ �����.", CloseTalk)
	Text (1, "\223 \245\238\247\243 \239\238\235\243\247\232\242\252 \202\238\235\252\246\238 \228\237\255 \209\226. \194\224\235\229\237\242\232\237\224.", JumpPage, 4)
	--Text (1, "� ���� �������� ������ ��� ��. ���������.", JumpPage, 4) 	
	Text (1, "\223 \245\238\247\243 \208\224\231\226\229\241\242\232\241\252.", JumpPage, 7)
	--Text (1, "� ���� ����������.", JumpPage, 7)
	
	Talk(2, "\210\240\229\225\238\226\224\237\232\255: 1. \211 \236\238\235\238\228\238\230\229\237\238\226 \228\238\235\230\237\251 \225\251\242\252 \202\238\235\252\246\224 \209\226\255\242\238\227\238 \194\224\235\229\237\242\232\237\224. 2. \204\238\235\238\228\238\230\229\237\251 \196\238\235\230\237\251 \225\251\242\252 \226 \227\240\243\239\239\229. 3. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\240\232\237\229\241\242\232 10 \236\232\235\235\232\238\237\238\226 \231\238\235\238\242\251\245. 4. \202\224\230\228\251\233 \228\238\235\230\229\237 \239\238\235\243\247\232\242\252 \232 \238\242\234\240\251\242\252 \241\226\238\232 \241\243\237\228\243\234\232 \244\229\233.")
	--Talk(2, "����������: 1. � ����������� ������ ���� ������ ������� ���������. 2. ���������� ������ ���� � ������. 3. ������ ������ �������� 10 ��������� �������. 4. ������ ������ �������� � ������� ���� ������� ���.")	
	Text(2, "\213\238\240\238\248\238, \255 \239\238\237\255\235. \199\224\240\229\227\232\241\242\240\232\240\243\233\242\229!", JumpPage, 1)
	--Text(2, "������, � �����. ���������������!", JumpPage, 1)	
	Text(2, "\196\224\233\242\229 \239\238\228\243\236\224\242\252.", CloseTalk)
	--Text(2, "����� ��������.", CloseTalk)
	
	Talk(3, "\209\226\255\249\229\237\237\232\234: \197\241\235\232 \242\251 \227\238\242\238\226, \239\238\230\224\235\243\233\241\242\224, \239\238\228\242\226\229\240\228\232. \207\238\241\235\229 \240\229\227\232\241\242\240\224\246\232\232 \242\251 \239\238\235\243\247\232\248\252 \209\226\224\228\229\225\237\251\233 \209\229\240\242\232\244\232\234\224\242. \209 \237\232\236 \236\238\230\237\238 \205\224\247\224\242\252 \246\229\240\229\236\238\237\232\254 \241\226\224\228\252\225\251 \243 \194\238\235\248\229\225\237\232\234\224 \215\232\242\224\237\224")
	--Talk(3, "���������: ���� �� �����, ����������, ���������. ����� ����������� �� �������� ��������� ����������. � ��� ����� ������ ��������� ������� � ���������� ������")	
	Text(3, "\207\238\228\242\226\229\240\228\232\242\252", MarryCertificate)
	--Text(3, "�����������", MarryCertificate)	
	Text(3, "\196\224\233\242\229 \229\249\229 \240\224\231 \239\238\228\243\236\224\242\252.", CloseTalk)
	--Text(3, "����� ��� ��� ��������.", CloseTalk)

	Talk (4, "\209\226\255\249\229\237\237\232\234: \215\242\238\225\251 \232\231\227\238\242\238\226\232\242\252 \202\238\235\252\246\238 \228\237\255 \209\226. \194\224\235\229\237\242\232\237\224 \194\224\236 \237\229\238\225\245\238\228\232\236\238 \239\240\232\237\229\241\242\232: 10 \209\229\240\228\229\247\229\234 \203\254\225\226\232, 10 \209\229\240\228\229\247\229\234 \194\229\240\237\238\241\242\232 \232 10 \209\229\240\228\229\247\229\234 \194\231\224\232\236\238\239\238\237\232\236\224\237\232\229.")
	--Talk (4, "���������: ����� ���������� ������ ��� ��. ��������� ��� ���������� ��������: 3000 ��� ����, 35 ������ � 80 ��� �������� ��.")
	Text (4, "\194\238\242 \255 \239\240\232\237\229\241 \226\241\229 \237\229\238\225\245\238\228\232\236\251\229 \236\224\242\229\240\232\224\235\251.", JumpPage, 5)
	--Text (4, "��� � ������ ��� ����������� ���������.", JumpPage, 5)

	Talk (6, "\209\226\255\249\229\237\237\232\234: \200\231\226\232\237\232\242\229 \237\238 \243\226\224\241 \237\229\245\226\224\242\224\229\242 \237\229\238\225\245\238\228\232\236\251\245 \232\237\227\240\232\228\232\229\237\242\238\226 \232\235\232 \226\251 \243\230\229 \238\225\240\243\247\229\237\251.")
	--Talk (6, "���������: �������� �� ���� ��������� ����������� ������������ ��� �� ��� ��������.")

	InitTrigger ()
	TriggerCondition (1, HasItem, 3457, 3000)
	TriggerCondition (1, HasItem, 7355, 35)
	TriggerCondition (1, HasItem, 2608, 80)
	TriggerCondition( 1, NoItem, 2520, 1)
	TriggerCondition( 1, NoItem, 2521, 1)
	TriggerCondition( 1, BankNoItem, 2520, 1)
	TriggerCondition( 1, BankNoItem, 2521, 1)
	TriggerAction (1, TakeItem, 3457, 3000)
	TriggerAction (1, TakeItem, 7355, 35)
	TriggerAction (1, TakeItem, 2608, 80)
	TriggerAction (1, GiveItem, 2521, 1, 4)
	TriggerFailure (1, JumpPage, 6)
		Talk (5, "\209\226\255\249\229\237\237\232\234: \194\251 \243\226\229\240\229\237\251 \247\242\238 \245\238\242\232\242\229 \239\238\235\243\247\232\242\252 \253\242\238 \202\238\235\252\246\238?")
		--Talk (5, "���������: �� ������� ��� ������ �������� ��� ������?")
		Text (5, "\196\224 \245\238\247\243", MultiTrigger, GetMultiTrigger (), 1)
		--Text (5, "�� ����", MultiTrigger, GetMultiTrigger (), 1)

	InitTrigger ()
	TriggerCondition (1, HasItem, 2520, 1)
	TriggerCondition( 1, HasMoney, 10000000 )
	TriggerAction( 1, TakeMoney, 10000000 )
	TriggerAction (1, TakeItem, 2520, 1)
	TriggerAction (1, GiveItem, 2521, 1, 4)
	TriggerFailure (1, JumpPage, 6)
		Talk (7, "\209\226\255\249\229\237\237\232\234: \194\251 \243\226\229\240\229\237\251 \247\242\238 \245\238\242\232\242\229 \208\224\231\226\229\241\242\232\241\252?")
		--Talk (7, "���������: �� ������� ��� ������ ����������?")
		Text (7, "\196\224 \245\238\247\243", MultiTrigger, GetMultiTrigger (), 1)
		--Text (7, "�� ����", MultiTrigger, GetMultiTrigger (), 1)
end

function npc_eventer ()

Talk( 1, " ����������� ���� �����! � �������,���� �� ��� ��������� ������ ���, �� � ����� ���� ���� ������ ��������!(  " )
Text( 1, " ��, � �����! ", JumpPage, 2)

Talk( 2, " ���� ����� ����� ����� ������� ������,����� ��� �������� ����,��������� �������� ��������,�� 1 � �� 2(�������� � ��� ���: 1 ����� ����������� ������,5 ������,1 ���� ������� �������(�� ���) " )
Text( 2, " ���� 13 �������� ����� ���.�� ", JumpPage, 3)
Text( 2, " ���� ������� �������� ������ 5�� ", JumpPage, 4)
Text( 2, " ���� ������� �������� ������ 5�� ", JumpPage, 5)
Text( 2, " ���� ������� �������� ����� 5�� ", JumpPage, 6)
Text( 2, " ���� ������� �������� ���� 5�� ", JumpPage, 7)
Text( 2, " ���� ������� �������� ����� 5��  ", JumpPage, 8)

Talk(3," ������� �� ������ �� ��� � ���� ������?!(����� ������� ��������) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 2608,13,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ������� �� ������ �� ��� � ���� ������?! (����� ������� ���) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7108,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(4," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ������� �� ������ �� ��� � ���� ������?! (����� ������� ���) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7111,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(5," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ������� �� ������ �� ��� � ���� ������?! (����� ������� ��� ) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7110,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(6," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ������� �� ������ �� ��� � ���� ������?! (����� ������� ���) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7109,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(7," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ������� �� ������ �� ��� � ���� ������?! (����� ������� ���) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7112,1,105 )
TriggerFailure( 1, JumpPage, 19)
Text(8," ��, � ���� ���� ������! ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ������� �� ������ �� ��� � ���� ������?! (����� ������� �������) ")
InitTrigger()
TriggerCondition( 1, HasItem,2404,1 )
TriggerCondition( 1, HasItem,3757,1 )
TriggerCondition( 1, HasItem,7355,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2404,1 )
TriggerAction( 1, TakeItem, 3757,1 )
TriggerAction( 1, TakeItem, 7355,5 )
TriggerAction( 1, GiveItem, 7355,7,4 )
TriggerFailure( 1, JumpPage, 19)
Text(9," ��, � ����! ",MultiTrigger,GetMultiTrigger(),1)


Talk( 19, "�����, �� ��������� ����! " ) -- �������� ���� �� ���������� ����

end

function npc_avrora ()

Talk( 1, " ����������� ����! � ��� ������,���� �� ��� ��������� ������� ������, �� � ����� �� ��� ������� ������� �������!(  " )
Text( 1, " ��, � �����! ", JumpPage, 2)

Talk( 2, " ���� ����� �������� ��� 30 �� �������� ������,��� �������� � �������� ������.���� ��������� �� �������� ������� �����. " )
Text( 2, " ���� Gold PST ", JumpPage, 3)

Talk(3," ������� � ���� ���������!� �� �������� ���� ������� ")
InitTrigger()
TriggerCondition( 1, HasItem,7415,30 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7415,30 )
TriggerAction( 1, GiveItem, 7355,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," ��,� ������ ��� � ����������! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "�����, �� ��������� ����! " ) -- �������� ���� �� ���������� ����

end

function npc_kril ()

Talk( 1, " ����������� ����! � ���� ����������,���� �� ��� ��������� �� ��� � �������,�� �������� � ����� ����� ����������!!!(  " )
Text( 1, " ��, � �����! ", JumpPage, 2)

Talk( 2, " ���� ����� �������� ��� 20000 ��� ����,50 ����.�� ��� ��,50 ������,+14 ���� ���� ����� 7��,150 �������� ������. " )
Text( 2, " ���!!!����� ������. ", JumpPage, 3)

Talk(3," �� ��� � ��� � ������.")
InitTrigger()
TriggerCondition( 1, HasItem,7415,100 )
TriggerCondition( 1, HasItem,2608,40 )
TriggerCondition( 1, HasItem,3457,20000 )
TriggerCondition( 1, HasItem,7111,1,107 )
TriggerCondition( 1, HasItem,7110,1,107 )
TriggerCondition( 1, HasItem,7109,1,107 )
TriggerCondition( 1, HasItem,7112,1,107 )
TriggerCondition( 1, HasItem,7355,50 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7415,150 )
TriggerAction( 1, TakeItem, 2608,50 )
TriggerAction( 1, TakeItem, 3457,20000 )
TriggerAction( 1, TakeItem, 7111,1,107 )
TriggerAction( 1, TakeItem, 7110,1,107 )
TriggerAction( 1, TakeItem, 7109,1,107 )
TriggerAction( 1, TakeItem, 7112,1,107 )
TriggerAction( 1, TakeItem, 7355,50 )
TriggerAction( 1, GiveItem, 7319,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "�����, �� ��������� ���� ��� � �������� ���� � ����! " ) -- �������� ���� �� ���������� ����

end

function r_talk123 ()
Talk( 1, " ��� �� �������� ����?! �� ������� ����� ����� �����?! ���?! ����� ����������! " )
Text( 1, " ��, ���� ����� +14 ", JumpPage, 2)

Talk( 2, " ��, ������ �� �������� ���� � ������� �������! " )
Text( 2, " �� ��� +14(8��) ", JumpPage, 3)
Text( 2, " �� ��� +14(8��)  ", JumpPage, 4)
Text( 2, " �� ��� +14(8��) ", JumpPage, 5)
Text( 2, " �� ��� +14(8��) ", JumpPage, 6)
Text( 2, " �� ��� +14(8��) ", JumpPage, 7)


Talk(3," ����� 130 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7108,8,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," ����� 130 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7110,8,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," ����� 130 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7109,8,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 130 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7112,8,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(7," ����� 130 ��� ����! " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,130 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,130 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7111,8,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," �� ��� ������, ������� �������� ����? ����������! " )
Text(14," �����, ��������, ������ ��� �� ����!! ",CloseTalk )
Text(14," �������� ������! ",JumpPage, 1 )

end