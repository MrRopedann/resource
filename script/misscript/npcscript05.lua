--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
print( "loading NPCScript05.lua" )


----------------------------------------------------------Appereal Carsise

function t_ledset()
	Talk( 1, "����������,�� ��� ��������� � ��� ����? " )
	Text( 1, "������� ������ (400 �������) ", JumpPage, 2)
	Text( 1, "������� ���������� (400 �������) ", JumpPage, 3)
	Text( 1, "������� ������ (400 �������) ", JumpPage, 4)
	Text( 1, "������� �������� (400 �������) ", JumpPage, 5)
	Text( 1, "������� ����� (400 �������) ", JumpPage, 6)

	Talk( 2, "������ ��������� �������� ������ �� �������� ����� ������: 100 ������� ����������,100 ���� �������,100,������� ��������� ������,100 ������� ������,100 ������� ������,� ��� �� 1000 ��� ����,1 ����� �������� ������,400 ��������� � 40.000.000 ������ " )
	InitTrigger()
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 7673, 100 )
	TriggerCondition( 1, HasItem, 7674, 100 )
	TriggerCondition( 1, HasItem, 7675, 100 )
	TriggerCondition( 1, HasItem, 7676, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 7673, 100 )
	TriggerAction( 1, TakeItem, 7674, 100 )
	TriggerAction( 1, TakeItem, 7675, 100 )
	TriggerAction( 1, TakeItem, 7676, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7684, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 2, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	Talk(3,"������� ")
	Text( 3, "����� ", JumpPage, 8)
	Text( 3, "�������� ", JumpPage, 9)
	Text( 3, "������� ", JumpPage, 10)

	Talk( 4, "�� ������ ����� ������ ������,� � ������� �������� ������� �������� ��� � �������.������� ������� �������� � �������� ������,���� ��������� - 5% " )
	Text( 4, "������� ", CloseTalk)

	Talk(5,"������ ��������� �������� �������� �� �������� ����� ������: 100 ������� ��������� ������,100,������� �����������,100 ������� ������,3 ����� ��������� �����,1 ����� �������,1 ����� �������� ������,400 ��������� � 40.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7675, 100 )
	TriggerCondition( 1, HasItem, 7612, 100 )
	TriggerCondition( 1, HasItem, 7676, 100 )
	TriggerCondition( 1, HasItem, 7441, 1 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7773, 3 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7675, 100 )
	TriggerAction( 1, TakeItem, 7612, 100 )
	TriggerAction( 1, TakeItem, 7676, 100 )
	TriggerAction( 1, TakeItem, 7441, 1 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7773, 3 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7672, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 5, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk(6,"������ ��������� ������� ����� �� ������� ����� ������:100 ������� �����������,100 ���� �������,100 ������� ������,1 ����� �������,1 ����� �������� �������,2 ����� ��������� �����,2 ����� �������� ������,2 ����� ������ �����������,2 ����� �������� ������,400 ��������� � 40.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 7612, 100 )
	TriggerCondition( 1, HasItem, 7673, 100 )
	TriggerCondition( 1, HasItem, 7674, 100 )
	TriggerCondition( 1, HasItem, 7441, 1 )
	TriggerCondition( 1, HasItem, 7777, 1 )
	TriggerCondition( 1, HasItem, 7773, 2 )
	TriggerCondition( 1, HasItem, 7774, 2 )
	TriggerCondition( 1, HasItem, 7775, 2 )
	TriggerCondition( 1, HasItem, 7776, 2 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 7612, 100 )
	TriggerAction( 1, TakeItem, 7673, 100 )
	TriggerAction( 1, TakeItem, 7674, 100 )
	TriggerAction( 1, TakeItem, 7441, 1 )
	TriggerAction( 1, TakeItem, 7777, 1 )
	TriggerAction( 1, TakeItem, 7773, 2 )
	TriggerAction( 1, TakeItem, 7774, 2 )
	TriggerAction( 1, TakeItem, 7775, 2 )
	TriggerAction( 1, TakeItem, 7776, 2 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7756, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 6, "����� ", MultiTrigger, GetMultiTrigger(), 1)

	
	Talk(7,"�� ������� ����! ")
	
	
	Talk(8,"������ ��������� ������� ����� �� ������� ����� ������: 1000 ��� ����,100 ������� ����������,100 ������� �����,1 ����� �������� �������,1 ����� �������� ������,1 ����� ������ �����������,1 ����� �������� ������,400 ��������� 40.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7757, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 8, "����� ", MultiTrigger, GetMultiTrigger(), 1)
	
	Talk(9,"������ ��������� ������� �������� �� ������� ����� ������: 1000 ��� ����,100 ������� ����������,100 ������� �����,1 ����� �������� �������,1 ����� �������� ������,1 ����� ������ �����������,1 ����� �������� ������,400 ��������� 40.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7758, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 9, "����� ", MultiTrigger, GetMultiTrigger(), 1)


	Talk(10,"������ ��������� ������� ������� �� ������� ����� ������: 1000 ��� ����,100 ������� ����������,100 ������� �����,1 ����� �������� �������,1 ����� �������� ������,1 ����� ������ �����������,1 ����� �������� ������,400 ��������� 40.000.000 ������ ")
	InitTrigger()
	TriggerCondition( 1, HasItem, 3457, 1000 )
	TriggerCondition( 1, HasItem, 7671, 100 )
	TriggerCondition( 1, HasItem, 2438, 100 )
	TriggerCondition( 1, HasItem, 7466, 1 )
	TriggerCondition( 1, HasItem, 7774, 1 )
	TriggerCondition( 1, HasItem, 7775, 1 )
	TriggerCondition( 1, HasItem, 7776, 1 )
	TriggerCondition( 1, HasCredit, 400 )
	TriggerCondition( 1, HasMoney, 40000000 )
	TriggerAction( 1, TakeItem, 3457, 1000 )
	TriggerAction( 1, TakeItem, 7671, 100 )
	TriggerAction( 1, TakeItem, 2438, 100 )
	TriggerAction( 1, TakeItem, 7466, 1 )
	TriggerAction( 1, TakeItem, 7774, 1 )
	TriggerAction( 1, TakeItem, 7775, 1 )
	TriggerAction( 1, TakeItem, 7776, 1 )
	TriggerAction( 1, DelRoleCredit, 400 )
	TriggerAction( 1, TakeMoney, 40000000 )
	TriggerAction( 1, GiveItem, 7759, 1 , 4)
	TriggerFailure( 1, JumpPage, 7 )
	Text( 10, "����� ", MultiTrigger, GetMultiTrigger(), 1)


end

function t_ledinfa()
	Talk( 1, "����� �� �����,��� ��� ����� �� ������������... " )
	Text( 1, "�������� � ������ ", GoTo, 644, 868, "magicsea" )
	Text( 1, "���������� �� ������� ", JumpPage, 2)
	
	Talk( 2, "������ ������� �� ���� ������,��� ��������� �����... " )
	Text( 2, "������� ", JumpPage, 3)
	Text( 2, "����� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "������� ����� ", JumpPage, 5)
	Text( 3, "����� ���������� ", JumpPage, 6)
	Text( 3, "������� ����� ", JumpPage, 7)

	Talk( 4, "� ������ ������ ����� ������������: " )
	Text( 4, "���� ������� ", JumpPage, 8)


	Talk( 5, "������� �����,����� ����������� - 30 ������,������ ���������� ���������: " )
	Text( 5, "������� ������ ", CloseTalk)
	Text( 5, "������� �������� ", CloseTalk)
	Text( 5, "���� ������� ", CloseTalk)
	Text( 5, "������� ������� ", CloseTalk)
	Text( 5, "����� ������ ", CloseTalk)
	Text( 5, "������ ������� ", CloseTalk)

	
	Talk( 6, "����� ����������,����� ����������� - 30 ������,������ ���������� ���������: " )
	Text( 6, "������� ������ ", CloseTalk)
	Text( 6, "������� �������� ", CloseTalk)
	Text( 6, "���� ������� ", CloseTalk)
	Text( 6, "������� ������� ", CloseTalk)
	Text( 6, "����� ������ ", CloseTalk)
	Text( 6, "������ ������� ", CloseTalk)
	
	Talk( 7, "������� �����,����� ����������� - 30 ������,������ ���������� ���������: " )
	Text( 7, "������� ������ ", CloseTalk)
	Text( 7, "������� �������� ", CloseTalk)
	Text( 7, "���� ������� ", CloseTalk)
	Text( 7, "������� ������� ", CloseTalk)
	Text( 7, "����� ������ ", CloseTalk)
	Text( 7, "������ ������� ", CloseTalk)
	
	Talk( 8, "���� �������,����� ����������� - 30 �����,������ ���������� ���������: " )
	Text( 8, "����� ������� ������� ", CloseTalk)
	Text( 8, "������ ��������� ���������� ", CloseTalk)
	Text( 8, "������� ����� ", CloseTalk)
	Text( 8, "���� �� ���������� ��������� ", CloseTalk)
	Text( 8, "������ �� ���������� ��������� ", CloseTalk)
end



function t_ledinfo()
	Talk( 1, "�� ���������� �� ����� 2,��� ������ ����� �������.����� �� ������ ��������� �������,� ��� �� �������� ��� ���������... " )
	Text( 1, "������� ", JumpPage, 2)
	Text( 1, "����� ", JumpPage, 3)

	Talk( 2, "� ������ ������ ����� ������������: " )
	Text( 2, "�������� ���� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "������ ", JumpPage, 5)
	Text( 3, "������ ������� ", JumpPage, 6)

	Talk( 4, "�������� ����,����� ����������� - 30 ������,������ ���������� ���������: " )
	Text( 4, "������� ��������� ", CloseTalk)
	Text( 4, "������ ��������� ������ ", CloseTalk)
	Text( 4, "������� ������ ", CloseTalk)
	Text( 4, "������ 10.000 ", CloseTalk)
	Text( 4, "������ ������� ", CloseTalk)

	
	Talk( 5, "������,����� ����������� - 30 �����,������ ���������� ���������: " )
	Text( 5, "���� ������� ", CloseTalk)
	Text( 5, "����� ������� ", CloseTalk)
	Text( 5, "������ ��������� ���������� ", CloseTalk)
	Text( 5, "�������� �� ������ ", CloseTalk)
	Text( 5, "���� �� ���������� ��������� ", CloseTalk)
	Text( 5, "���� �������� ������� ", CloseTalk)
	Text( 5, "���� ������� ������� ", CloseTalk)
	Text( 5, "������ 500.000 ", CloseTalk)
	
	Talk( 6, "������ �������,����� ����������� - 30 �����,������ ���������� ���������: " )
	Text( 6, "������ ������� ", CloseTalk)
	Text( 6, "������ �� ���������� ��������� ", CloseTalk)
	Text( 6, "������ �������� ������� ", CloseTalk)
	Text( 6, "������ ������� ������� ", CloseTalk)
	Text( 6, "������ ��������� ���������� ", CloseTalk)
	Text( 6, "������ 500.000 (2��) ", CloseTalk)
end

function JoJo_05 () -- Honor Exchanger

	Talk( 1, " Exchange 4M For 9999 Honor" )

	InitTrigger()
	TriggerCondition( 1, HasItem, 3849, 1 )
	TriggerCondition( 1, HasMoney, 4000000 )
	TriggerAction( 1, TakeMoney, 4000000 )
	TriggerAction( 1, AddCredit, 9999 )
	Text( 1, "obtain 9999 honor", MultiTrigger, GetMultiTrigger(), 1)

end


function JoJo_13 ()

	Talk( 1, "Hello! Reputation Shop!!" )
	Text( 1, "Learn Navigation Skill", BuyPage )
	Text(1,"Exchange Money To Reputation!",JumpPage,2)
	Text( 1, "Thanks [Close]", CloseTalk)
   
	InitTrigger()
	TriggerCondition( 1, HasMoney, 4000000 )
	TriggerAction( 1, TakeMoney, 4000000 )
	TriggerAction( 1, DelRoleCredit, -9999 )
	TriggerAction( 1, JumpPage, 3 )
	TriggerFailure( 1, JumpPage, 4 )
	Talk( 2, "If You Want Get 9999 Reputation, Pay Me 4 Millions Gold! And Dont Forget Say Thanks!" )
	Text( 2, "Get 9999 Reputation",  MultiTrigger, GetMultiTrigger(), 1 )
	Text( 2, "I Will Get Money Later [Close]", CloseTalk)

	Talk(3, "I Hope You Know How Use So Much Reputation!")

	Talk(4, "Sorry, But You Dont Have 4 Million Gold! Come Back When You Have!.")
	end 


function sky_07 ()
	
	
	Talk( 1, "\199\228\240\224\241\242\226\243\233, \243 \236\229\237\255 \229\241\242\252 \238\247\229\237\252 \236\237\238\227\238 \232\237\242\229\240\229\241\237\251\245 \226\229\249\229\233." )
	Text( 1, "\207\238\241\236\238\242\240\229\242\252", BuyPage )
	
	InitTrade()
	Weapon(	453	) 
	Weapon(	455	)
	Weapon(	3074	)
	Weapon(	3075	)
	Weapon(	891	)
	Weapon(	454	)
	Weapon(	890	)
	Defence(	3109	)
	Defence(	3110	)
	Defence(	3111	) 
	Defence(	3112	)
	Defence(	3113	)
	Other(	3300	)
	Other(	3301	)

end


function r_HeSToP3 ()

	--�����
	local CurMapName1 = "hell"


	--�������05
	local GoTo01X = 110
	local GoTo01Y = 230
	local GoTo01M = CurMapName1

	--�������06
	local GoTo02X = 225
	local GoTo02Y = 30
	local GoTo02M = CurMapName1

	--�������07
	local GoTo03X = 110
	local GoTo03Y = 150
	local GoTo03M = CurMapName1

	--�������08
	local GoTo04X = 230
	local GoTo04Y = 150
	local GoTo04M = CurMapName1

	Talk( 1, "\207\238\240\242\224\235\252\249\232\234 \224\225\224\228\228\238\237\224: \207\240\232\226\229\242! \198\229\235\224\229\248\252 \238\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237?" )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 05", JumpPage, 2 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 06", JumpPage, 3 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 07", JumpPage, 4 )
	Text( 1, "\206\242\239\240\224\226\232\242\252\241\255 \226 \224\225\224\228\228\238\237 08", JumpPage, 5 )
	Text( 1, "\211\233\242\232", CloseTalk )

	--�������05
	InitTrigger()
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	Talk( 2, " \192\225\224\228\228\238\237 05? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 2, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2)

	--�������06
	InitTrigger()
	TriggerAction( 2,  GoTo, GoTo02X, GoTo01Y, GoTo02M )
	Talk( 3, " \192\225\224\228\228\238\237 06? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 3, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2 )

	--�������07
	InitTrigger()
	TriggerAction( 2,  GoTo, GoTo03X, GoTo03Y, GoTo03M )
	Talk( 4, " \192\225\224\228\228\238\237 07? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 4, "\210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2 )

	--�������08
	InitTrigger()
	TriggerAction( 2, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	Talk( 5, " \192\225\224\228\228\238\237 08? \205\229\242 \239\240\238\225\235\229\236!" )
	Text( 5, " \210\229\235\229\239\238\240\242",MultiTrigger, GetMultiTrigger(), 2)

end



function PVP_npc()

	Talk( 1, "PvP \240\229\230\232\236" ) -- PvP �����
	Text( 1, "\194\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", JumpPage, 2) -- �������� PK ������
	Text( 1, " \194\251\234\235\254\247\232\242\252 PK \241\242\224\242\243\241  ", JumpPage, 3) -- ��������� PK ������
	
	InitTrigger()
	TriggerAction( 1, SetPkState, 1 ) -- ������������� PK ������ �� 1. �.�. ��������
	TriggerAction(1,SystemNotice, "\194\251 \226\238\248\235\232 \226 PK \241\242\224\242\243\241. \210\229\239\229\240\252 \194\251 \236\238\230\229\242\229 \237\224\239\224\228\224\242\252 \237\224 \228\240\243\227\232\245 \232\227\240\238\234\238\226, \243 \234\238\242\238\240\251\245 \242\238\230\229 \226\234\235\254\247\229\237 PK \241\242\224\242\243\241.  " ) -- ��������� � ������� "�� ����� � PK ������. ������ �� ������ �������� �� ������ �������, � ������� ���� ������� PK ������. " 
	TriggerFailure( 1, JumpPage, 4 ) -- ���� �� ������� �������� PK ������ ��� ������� �� 4 ��������
	Talk( 2, " \194\251 \228\229\233\241\242\226\232\242\229\235\252\237\238 \245\238\242\232\242\229 \226\234\235\254\247\232\242\252 PvP \240\229\230\232\236? ")
	Text( 2, " \194\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", MultiTrigger, GetMultiTrigger(), 1) --�������� PK ������
	
	InitTrigger()
	TriggerAction( 1, SetPkState, 0 ) -- ������������� PK ������ �� 0. �.�. ���������
	TriggerAction(1,SystemNotice, "PK ������ ��������." ) -- ��������� � ������� "PK ������ ��������." 
	TriggerFailure( 1, JumpPage, 4 ) -- ���� �� ������� �������� PK ������ ��� ������� �� 4 ��������
	Talk( 3, " \194\251 \228\229\233\241\242\226\232\242\229\235\252\237\238 \245\238\242\232\242\229 \226\251\234\235\254\247\232\242\252 PvP \240\229\230\232\236? " ) --�� ������������� ������ ��������� PvP �����?
	Text( 3, " \194\251\234\235\254\247\232\242\252 PK \241\242\224\242\243\241 ", MultiTrigger, GetMultiTrigger(), 1) -- ��������� PK ������


	Talk( 4, " \205\229 \243\228\224\235\238\241\252 \226\238\233\242\232 \226 PVP \240\229\230\232\236  " ) -- �� ������� ����� � PVP ����� 
	

end

function Spirit_10 () 

	Talk( 1, "Exchanger: �������� ������ !�������: 600 ���� ��������� ���� �� 95 ������ " )
	Text( 1, " ���������� ����� ( ������ ) ", JumpPage,3)
	Text( 1, " ����� ����� ( ����) ", JumpPage, 4)
	Text( 1, " �������������� ����� ( ���� ) ", JumpPage,5 )
	Text( 1, " ���������� ����� ( ���� ) ", JumpPage, 6)
	Text( 1, " ��������� �������� ", JumpPage,12 )
	Text( 12, " ���������� ������ ( ������ ) ", JumpPage, 14)
	Text( 12, " ����� ������ ( ���� ) ", JumpPage, 15)
	Text( 12, " �������������� ������ ( ���� ) ", JumpPage, 16)
	Text( 12, " ���������� ������ ( ���� ) ", JumpPage, 17)
	
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3499, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3500, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3501, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3502, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3503, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(13,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3511, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(14,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3512, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(15,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3513, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(16,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3514, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(17,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_11 () 

	Talk( 1, "Exchanger: �������� ������ !�������: 600 ���� ��������� ���� �� 95 ������ " )
	Text( 1, " ���������� ��������� ��������( ������ ) ", JumpPage,3)
	Text( 1, " ����� ��������� �������� ( ����) ", JumpPage,4)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3505, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3506, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_12 () 

	Talk( 1, "Exchanger: �������� ������ !�������: 600 ���� ��������� ���� �� 95 ������ " )
	Text( 1, " ���������� ������ ( ������ ) ", JumpPage, 3)
	Text( 1, " ����� ������ ( ���� ) ", JumpPage, 4)
	Text( 1, " �������������� ������ ( ���� ) ", JumpPage, 5)
	Text( 1, " ���������� ������ ( ���� ) ", JumpPage, 6)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3511, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3512, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3513, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3514, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_13 () 

	Talk( 1, "Exchanger: �������� ������ !�������: 600 ���� ��������� ���� �� 95 ������ " )
	Text( 1, " ���������� ���������� ( ������) ", JumpPage, 3)
	Text( 1, " ����� ���������� ( ���� ) ", JumpPage, 4)
	Text( 1, " �������������� ���������� ( ���� ) ", JumpPage, 5)
	Text( 1, " ���������� ���������� ( ���� ) ", JumpPage,6)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3515, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3516, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3517, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3518, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3519, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_14 () 

	Talk( 1, "Exchanger: �������� ������ !�������: 600 ���� ��������� ���� �� 95 ������ " )
	Text( 1, " ���������� ���������� ( ������ ) ", JumpPage,3)
	Text( 1, " ����� ���������� ( ���� ) ", JumpPage,4)
	Text( 1, " �������������� ���������� ( ���� ) ", JumpPage,5)
	Text( 1, " ���������� ���������� ( ���� ) ", JumpPage,6)
	Text( 1, " ��������� �������� ", JumpPage,12 )
	Text( 12, " ���������� ����������� ( ������) ", JumpPage,8)
	Text( 12, " ����� ����������� ( ���� ) ", JumpPage,9 )
	Text( 12, " �������������� ����������� ( ����) ", JumpPage, 10)
	Text( 12, " ���������� ����������� ( ����) ", JumpPage, 11)
	
	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3520, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(2,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3521, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(3,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3522, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(4,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3523, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3524, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3525, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(7,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3526, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(8,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3527, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(9,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3528, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(10,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 3555, 600 )	
	TriggerAction( 1, TakeItem, 3555, 600 )
	TriggerAction( 1, GiveItem, 3529, 1, 4 )
	TriggerAction( 1, JumpPage, 38 )
	TriggerFailure( 1, JumpPage, 37 )
	Text(11,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

end

function Spirit_Exc () 

	Talk( 1, "Exchanger:� ���������� ��� 95 ����� �� 20 ��� ������� ����:���������,�����������,�����������,���������,����!" )
	Text( 1, " ��� ����� ", JumpPage, 5 )
	Text( 1, " ��� ����������� ", JumpPage, 6 )
	Text( 1, " �������� ��� ", JumpPage, 7 )
	Text( 1, " ������ ���������� ", JumpPage, 8 )
	Text( 1, " ��������� ������ ", JumpPage, 9 )
	Text( 1, " ����������� ��� ", JumpPage, 10 )
	Text( 1, " ����� ������ ", JumpPage,11 )
	Text( 1, " ����� ����� ", JumpPage,12 )

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6165, 1 )	
	TriggerAction( 1, TakeItem, 6165, 1 )
	TriggerAction( 1, GiveItem, 3499, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6166, 1 )	
	TriggerAction( 1, TakeItem, 6166, 1 )
	TriggerAction( 1, GiveItem, 6097, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6167, 1 )	
	TriggerAction( 1, TakeItem, 6167, 1 )
	TriggerAction( 1, GiveItem, 3504, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(7,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6168, 1 )	
	TriggerAction( 1, TakeItem, 6168, 1 )
	TriggerAction( 1, GiveItem, 3509, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(8,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6169, 1 )	
	TriggerAction( 1, TakeItem, 6169, 1 )
	TriggerAction( 1, GiveItem, 3515, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(9,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6170, 1 )	
	TriggerAction( 1, TakeItem, 6170, 1 )
	TriggerAction( 1, GiveItem, 3510, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(10,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6171, 1 )	
	TriggerAction( 1, TakeItem, 6171, 1 )
	TriggerAction( 1, GiveItem, 3525, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(11,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 6231, 20 )	
	TriggerAction( 1, TakeItem, 6231, 20 )
	TriggerCondition( 1, HasItem, 6232, 20 )	
	TriggerAction( 1, TakeItem, 6232, 20 )
	TriggerCondition( 1, HasItem, 6233, 20 )	
	TriggerAction( 1, TakeItem, 6233, 20 )
	TriggerCondition( 1, HasItem, 6234, 20 )	
	TriggerAction( 1, TakeItem, 6234, 20 )
	TriggerCondition( 1, HasItem, 7138, 20 )	
	TriggerAction( 1, TakeItem, 7138, 20 )
	TriggerCondition( 1, HasItem, 6172, 1 )	
	TriggerAction( 1, TakeItem, 6172, 1 )
	TriggerAction( 1, GiveItem, 3520, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(12,"Obtain Item" ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "� ��� ��� ����������� �����!" )
	Talk( 27, "������ ����� ���� ������!" )
end

function JoJo_06 () -- Newbie Quests

	Talk( 1, "Newbie Quest:welcome here for Newbie Quest" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(1122)
	AddNpcMission(1130)
	AddNpcMission(1135)

	Text( 2, "Newbie Quest", JumpPage,3 )
	Text( 2, "Newbie Quest 2", JumpPage,4 )
	Text( 2, "Newbie Quest 3", JumpPage,5 )

	Talk( 3, "1620 | 3116 | 3130" )

	Talk( 4, "855" )

	Talk( 5, "2588" )
end

function JoJo_07 () -- Equips Quest

	Talk( 1, "Equips Quests" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(9977)
	AddNpcMission(9966)
	AddNpcMission(9955)
	AddNpcMission(9944)
	AddNpcMission(9933)
	AddNpcMission(9922)
	AddNpcMission(9911)

	Talk( 2, "2476" )
end

function JoJo_08 () -- Higher level Quest

	Talk( 1, "Higher Level Quests:Hi! im Leveler Quest" )
	Text( 1, "ID of Quest", JumpPage,2 )

	AddNpcMission(1123)
	AddNpcMission(1124)

	Text( 2, "Lv80-90", JumpPage,3 )
	Text( 2, "Lv90-150", JumpPage,4 )

	Talk( 3, "2605 | 3085 | 4783" )
	Talk( 4, "3453 | 3826" )
end

function ingrysty()
Talk( 1, "� ��������� ���� 45 �� 10 ����� ����������� " )
Text( 1, "���� ���� ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 684 , 10 , 786 , 1 , 1)
ExchangeDataX( 684 , 10 , 778 , 1 , 1)
ExchangeDataX( 684 , 10 , 774 , 1 , 1)
ExchangeDataX( 684 , 10 , 790 , 1 , 1)
ExchangeDataX( 684 , 10 , 764 , 1 , 1)
ExchangeDataX( 684 , 10 , 804 , 1 , 1)
ExchangeDataX( 684 , 10 , 793 , 1 , 1)
ExchangeDataX( 684 , 10 , 796 , 1 , 1)
ExchangeDataX( 684 , 10 , 771 , 1 , 1)
ExchangeDataX( 684 , 10 , 800 , 1 , 1)
ExchangeDataX( 684 , 10 , 767 , 1 , 1)
ExchangeDataX( 684 , 10 , 782 , 1 , 1)

end  

function ingrysty1()
Talk( 1, "� ��������� ���� 55 �� 1 ���������� ���� " )
Text( 1, "���� ���� ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 1028 , 1 , 877 , 1 , 1)
ExchangeDataX( 1028 , 1 , 815 , 1 , 1)
ExchangeDataX( 1028 , 1 , 810 , 1 , 1)
ExchangeDataX( 1028 , 1 , 809 , 1 , 1)
ExchangeDataX( 1028 , 1 , 808 , 1 , 1)
ExchangeDataX( 1028 , 1 , 807 , 1 , 1)
ExchangeDataX( 1028 , 1 , 805 , 1 , 1)
ExchangeDataX( 1028 , 1 , 801 , 1 , 1)
ExchangeDataX( 1028 , 1 , 787 , 1 , 1)
ExchangeDataX( 1028 , 1 , 783 , 1 , 1)
ExchangeDataX( 1028 , 1 , 779 , 1 , 1)
ExchangeDataX( 1028 , 1 , 775 , 1 , 1)
ExchangeDataX( 1028 , 1 , 772 , 1 , 1)
ExchangeDataX( 1028 , 1 , 768 , 1 , 1)
ExchangeDataX( 1028 , 1 , 765 , 1 , 1)
ExchangeDataX( 1028 , 1 , 791 , 1 , 1)
ExchangeDataX( 1028 , 1 , 794 , 1 , 1)
ExchangeDataX( 1028 , 1 , 797 , 1 , 1)
ExchangeDataX( 1028 , 1 , 811 , 1 , 1)
ExchangeDataX( 1028 , 1 , 812 , 1 , 1)

end  

function ingrysty2()
Talk( 1, "� ��������� ���� 65 �� 2 ���������� ���� " )
Text( 1, "���� ���� ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 1028 , 2 , 773 , 1 , 1)
ExchangeDataX( 1028 , 2 , 776 , 1 , 1)
ExchangeDataX( 1028 , 2 , 788 , 1 , 1)
ExchangeDataX( 1028 , 2 , 795 , 1 , 1)
ExchangeDataX( 1028 , 2 , 802 , 1 , 1)
ExchangeDataX( 1028 , 2 , 784 , 1 , 1)
ExchangeDataX( 1028 , 2 , 769 , 1 , 1)
ExchangeDataX( 1028 , 2 , 798 , 1 , 1)
ExchangeDataX( 1028 , 2 , 780 , 1 , 1)
ExchangeDataX( 1028 , 2 , 806 , 1 , 1)
ExchangeDataX( 1028 , 2 , 792 , 1 , 1)
ExchangeDataX( 1028 , 2 , 766 , 1 , 1)

end

function ingrysty3()
Talk( 1, "� ��������� ������ �������� �� ��� ������ ����������� " )
Text( 1, "���� ���� ", SendExchangeXData)

InitExchangeX()

ExchangeDataX( 681 , 2 , 7125 , 1 , 1)
ExchangeDataX( 7125 , 2 , 7126 , 1 , 1)
ExchangeDataX( 6249 , 10 , 7002 , 1 , 1)
ExchangeDataX( 6249 , 15 , 5702 , 1 , 1)
ExchangeDataX( 3116 , 35 , 1812 , 1 , 1)

end

function ghfr3 ()

	Talk( 1, "����� �� ����� ������������: ����� 10 ���������� ������, 10 ���� (�����, ������, �����, �����) " )
	Text( 1, "���� ���� ", JumpPage, 5)

	InitTrigger()
	Talk( 5, "� ��� ����� ��� ����? �� ����� ����������� " )
	TriggerCondition( 1, LvCheck, ">", 85 )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 271, 10 )
	TriggerCondition( 1, HasItem, 270, 10 )
	TriggerCondition( 1, HasItem, 269, 10 )
	TriggerCondition( 1, HasItem, 268, 10 )
	TriggerCondition( 1, HasItem, 267, 10 )	
	TriggerAction( 1, TakeItem, 271, 10 )
	TriggerAction( 1, TakeItem, 270, 10 )
	TriggerAction( 1, TakeItem, 269, 10 )
	TriggerAction( 1, TakeItem, 268, 10 )
	TriggerAction( 1, TakeItem, 267, 10 )
	TriggerAction( 1, GiveItem, 2941, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "����� ������ �� ������ " )
	Talk( 27, "����� ������ ������ " )

end

function ghfr9 ()

	Talk( 1, "� �������� �� ������ ����� � ���������! " )
	Text( 1, "������ ����� ", JumpPage, 5)
	Text( 1, "������ ��������� ", JumpPage, 6)

	InitTrigger()
	Talk( 5, "����� �� 10 ��������, 1;2;3 ����! " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2668, 10 )
	TriggerCondition( 1, HasItem, 2667, 10 )
	TriggerCondition( 1, HasItem, 2666, 10 )	
	TriggerAction( 1, TakeItem, 2668, 10 )
	TriggerAction( 1, TakeItem, 2667, 10 )
	TriggerAction( 1, TakeItem, 2666, 10 )
	TriggerAction( 1, GiveItem, 580, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 6, "����� �� 10 ��������, 1;2;3 ����! " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 2668, 10 )
	TriggerCondition( 1, HasItem, 2667, 10 )
	TriggerCondition( 1, HasItem, 2666, 10 )	
	TriggerAction( 1, TakeItem, 2668, 10 )
	TriggerAction( 1, TakeItem, 2667, 10 )
	TriggerAction( 1, TakeItem, 2666, 10 )
	TriggerAction( 1, GiveItem, 581, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "����� ������ �� ������ " )
	Talk( 27, "����� ������ ������ " )

end


function old2()


	Talk( 1,  "���������� ���: ��������, � ���� ���� ���������� ��� ��� ���, ������!) " )
	Text( 1,  "���������� ", BuyPage )
	Text( 1,  "������� ��� ", OpenEidolonMetempsychosis )

		InitTrade()
	Defence(	0280	)
	Defence(	0232	)
	Defence(	0233	)
	Defence(	0234	)
	Defence(	0235	)
        Defence(	0609	)
	Defence(	0279	)
	Defence(	0278	)
	Defence(	0277	)
	Defence(	0276	)
	Defence(	  226)
	Defence(	  225)
	Defence(	  222)
	Defence(	  224)
	Defence(	0260	)
	Defence(	0253	)
	Defence(	0250	)
	Defence(	0223	)
	Defence(	0247	)
	Defence(	0244	)
	Defence(	2312	)
	Defence(	3918	)
	Defence(      578	)
	Defence(    3919	)
	Defence(	 3920)
	Defence(	 3921)
	Defence(	 3922)
	Defence(	 3925)
	Other( 4540	)
	Other( 3443	)
	Other( 4533	)
	Other( 3437	)
	Other( 4530	)
	Other( 3436	)
	Other( 3434	)
	Other( 1196	)
	Other( 3436	)
	Other( 3442	)
	Other( 1253	)
	Other( 4537	)
	Other( 3444	)
	
end


function ghfr25 ()

	Talk( 1, "� �������� ����� ��� �� ��� ������ ������� " )
	Text( 1, "�� �� ������ ", JumpPage, 5)
	Text( 1, "�������� 10 ������ ", JumpPage, 6)
	--Text( 1, "������ ������� ", JumpPage, 7)
	--Text( 1, "����������� ������ ", JumpPage, 8)
	--Text( 1, "������ ������� ", JumpPage, 9)
	--Text( 1, "���������� ������ ", JumpPage, 10)
	--Text( 1, "�������� ������ ", JumpPage, 11)

	InitTrigger()
	Talk( 5, "�� 50 ��, � ���� ��� 50� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 855, 50 )	
	TriggerAction( 1, TakeItem, 855, 50 )
	TriggerAction( 1, AddMoney, 50000 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(5,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 6, "����� 300 �� ��� ������ �� 10 ������ " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 855, 300 )	
	TriggerAction( 1, TakeItem, 855, 300 )
	TriggerAction( 1, GiveItem, 4543, 10, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(6,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 7, "����� 100 ����������� ����� | 300 �������� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 935, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(7,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 8, "����� 100 ����������� ����� | 300 �������� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 906, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(8,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 9, "����� 100 ����������� ����� | 300 �������� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 905, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(9,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 10, "����� 100 ����������� ����� | 300 �������� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 904, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(10,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	InitTrigger()
	Talk( 11, "����� 100 ����������� ����� | 300 �������� ����� " )
	TriggerCondition( 1, HasLeaveBagGrid, 1 )
	TriggerCondition( 1, KitbagLock, 0 )
	TriggerCondition( 1, HasItem, 4915, 300 )
	TriggerCondition( 1, HasItem, 3370, 100 )	
	TriggerAction( 1, TakeItem, 4915, 300 )
	TriggerAction( 1, TakeItem, 3370, 100 )
	TriggerAction( 1, GiveItem, 142, 1, 4 )
	TriggerAction( 1, JumpPage, 27 )
	TriggerFailure( 1, JumpPage, 26 )
	Text(11,"�������� " ,MultiTrigger,GetMultiTrigger(),1)

	Talk( 26, "����� ������ �� ������ " )
	Talk( 27, "����� ������ ������ " )

end

function r_LiveExp()

	Talk( 1, "����������, � ��� �� 3��, 1 ������ ���� " )
	Text( 1, "�������� ", JumpPage, 2)

	Talk(2,"����� ������?) ")
	InitTrigger()
	TriggerCondition( 1, HasMoney, 3000000 )
	TriggerAction( 1, TakeMoney, 3000000 )
	TriggerAction( 1, AddExpAndType,2,20000,20000)
	TriggerFailure( 1, JumpPage, 3 )
	TriggerAction( 1, JumpPage, 4 )
	Text(2,"�� ",MultiTrigger,GetMultiTrigger(),1)

	Talk( 3, "� ��������� � ���� �� ������� ����� ")
	Talk( 4, "�� ������� 1 ������ ���� ")

end

function r_LiveEx()

	Talk( 1, "������ �� ����? " )
	--Text( 1, "������ ������������ ", JumpPage, 2)
	Text(1, "��� ", GoTo, 1751,914, "jialebi")


	Talk(2,"�� 100�� �� ��� �������� ")
	InitTrigger()
	TriggerCondition( 1, HasMoney, 100000000 )
	TriggerAction( 1, TakeMoney, 100000000 )
	TriggerAction( 1, GiveItem, 2235, 1, 4 )
	TriggerFailure( 1, JumpPage, 3 )
	TriggerAction( 1, JumpPage, 4 )
	Text(2,"�� ",MultiTrigger,GetMultiTrigger(),1)

	Talk( 3, "� ��������� � ���� �� ������� ����� ")
	Talk( 4, "�� ������� ������ ������������ ")

end

function r_Live()

	Talk(1, "���������� �����, ���� �� ������ ��������?")
	Text(1, "���������� ����� ", GoTo, 304, 305, "abandonedcity")
	Text(1, "������ ���� ", GoTo, 327, 333, "darkswamp")
	Text(1, "����", CloseTalk)

end

function npc_job ()

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

function dmg_99  ()
	
	
	Talk( 1, "������ � �������� �����!  " )
	Text( 1, "������", BuyPage )

	InitTrade()
Defence(	2583	)
Defence(	2553	)
Defence(	2584	)
Defence(		)
Defence(		)

end
function lol_bot33  ()
	
	
	Talk( 1, "������ � �������� �������!  " )
	Text( 1, "������", BuyPage )

	InitTrade()
Defence(	904	)
Defence(	906	)
Defence(	937	)
Defence(	936	)
Defence(	905	)
Defence(	141	)
Defence(	142	)
Defence(	935	)

end


function t_talkt1 ()
Talk( 1, "��� ������������ �������� �� ����������,��������� � � 4 ���� ��������� " )
Text( 1,  "�������� ", JumpPage, 2)
Text( 1,  "������ ��� �������� ", OpenGetStone )
Text( 1,  "������ ��� �������� ", UnfuseNpc )

Text( 2, " ������� ��� 2 ������! ", JumpPage, 3)
Text( 2, " ������� ��� 3 ������! ", JumpPage, 4)
Text( 2, " ������� ��� 4 ������! ", JumpPage, 5)
Text( 2, " ������� ��� 5 ������! ", JumpPage, 6)
Text( 2, " ������� ��� 6 ������! ", JumpPage, 7)
Text( 2, " ������� ��� 7 ������! ", JumpPage, 8)
Text( 2, " ������� ��� 8 ������! ", JumpPage, 9)
Text( 2, " ������� ��� 9 ������! ", JumpPage, 10)


Talk(3," ����� 2 �������� � 2 ������ ���������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,2 )
TriggerAction( 1, GiveItem, 885,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(3," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(4," ����� 4 �������� � 4 ������ ���������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,4 )
TriggerAction( 1, GiveItem, 885,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(4," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(5," ����� 8 �������� � 8 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,8 )
TriggerAction( 1, GiveItem, 885,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(5," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," ����� 16 �������� � 16 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,16 )
TriggerAction( 1, GiveItem, 885,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(7," ����� 32 �������� � 32 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,32 )
TriggerAction( 1, GiveItem, 885,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(8," ����� 64 �������� � 64 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,64 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,64 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,64 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,64 )
TriggerAction( 1, GiveItem, 885,1,107 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(8," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(9," ����� 128 �������� � 128 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,128 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,128 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,128 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,128 )
TriggerAction( 1, GiveItem, 885,1,108 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(9," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk(10," ����� 256 �������� � 256 ������ ��������! " )
InitTrigger()
TriggerCondition( 1, HasItem,3877,256 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,3362,256 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3877,256 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 3362,256 )
TriggerAction( 1, GiveItem, 885,1,109 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 14)
Text(10," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk(2," �� ��� ������, ������� �������� ����? ����������! " )

end


function t_derevpa()
Talk( 1, "����� ���������� � ������� ������,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 641, 875, "magicsea" )
Text( 1, "���������� �� ������� ", JumpPage, 2)

	Text( 2, "������� ", JumpPage, 3)
	Text( 2, "����� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "���� ", JumpPage, 5)
	
	Talk( 4, "� ������ ������ ����� ������������: " )
	Text( 4, "���� ������ ", JumpPage, 6)
	
	Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	Text( 5, "������� ", CloseTalk)
	Text( 5, "�������� �� ��� ", CloseTalk)
	Text( 5, "���� ���� ", CloseTalk)
	Text( 5, "������ ����� (10 ����) ", CloseTalk)
	Text( 5, "������ �� ", CloseTalk)
	Text( 5, "������ ������� ", CloseTalk)
	Text( 5, "������ �� 10 ����� ", CloseTalk)

	Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	Text( 6, "������ ������ (200 �������) ", CloseTalk)
	Text( 6, "����� ����� ", CloseTalk)
	Text( 6, "������ ��������� ���������� ", CloseTalk)
	Text( 6, "������ 100.000 ", CloseTalk)
	Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_derevband()
Talk( 1, "����� ���������� � ������ ��������,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "���� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "���� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_oazisph()
Talk( 1, "����� ���������� � �������� �����,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "���� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "���� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_cherepx()
Talk( 1, "����� ���������� � ���� �������,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "���� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "���� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_skelets()
Talk( 1, "����� ���������� � ������ ��������� ��������,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "���� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "���� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_pchoaz()
Talk( 1, "����� ���������� � ������ ��������� ��������,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 650, 874, "magicsea" )
-- Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "���� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "���� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end


function r_comb ()
Talk( 1, "������ ��� ���� ��� �����������,�� ����� ������ ��� �� ������ �� �� ������ �����! " )
Text( 1, " ��� +4 2 ������ ", JumpPage, 3)
Text( 1, " ��� +4 3 ������ ", JumpPage, 4)
Text( 1, " ��� +4 4 ������ ", JumpPage, 5)
Text( 1, " ��� +4 5 ������ ", JumpPage, 6)

Talk(3," ����� ���� ���� ����������? " )
Text( 3, " �������� ���� ", JumpPage, 11)
Text( 3, " �������� �������� ", JumpPage, 12)
Text( 3, " �������� ������������ ", JumpPage, 13)
Text( 3, " �������� �������� ", JumpPage, 14)
Text( 3, " �������� ���� ", JumpPage, 15)

Talk(4," ����� ���� ���� ����������? " )
Text( 4, " �������� ���� ", JumpPage, 16)
Text( 4, " �������� �������� ", JumpPage, 17)
Text( 4, " �������� ������������ ", JumpPage, 18)
Text( 4, " �������� �������� ", JumpPage, 19)
Text( 4, " �������� ���� ", JumpPage, 20)

Talk(5," ����� ���� ���� ����������? " )
Text( 5, " �������� ���� ", JumpPage, 21)
Text( 5, " �������� �������� ", JumpPage, 22)
Text( 5, " �������� ������������ ", JumpPage, 23)
Text( 5, " �������� �������� ", JumpPage, 24)
Text( 5, " �������� ���� ", JumpPage, 25)

Talk(6," ����� ���� ���� ����������? " )
Text( 6, " �������� ���� ", JumpPage, 26)
Text( 6, " �������� �������� ", JumpPage, 27)
Text( 6, " �������� ������������ ", JumpPage, 28)
Text( 6, " �������� �������� ", JumpPage, 29)
Text( 6, " �������� ���� ", JumpPage, 30)

Talk(11," ��� ����� ����� 2 ��������� � 2�� ������! " )

Text(11,'������',FastCombiner,6828,2)

Talk(12," ��� ����� ����� 2 ��������� � 2�� ������! " )

Text(12,'������',FastCombiner,6819,2)

Talk(13," ��� ����� ����� 2 ��������� � 2�� ������! " )

Text(13,'������',FastCombiner,6825,2)

Talk(14," ��� ����� ����� 2 ��������� � 2�� ������! " )

Text(14,'������',FastCombiner,6822,2)

Talk(15," ��� ����� ����� 2 ��������� � 2�� ������! " )

Text(15,'������',FastCombiner,6831,2)





Talk(16," ��� ����� ����� 4 ��������� � 3�� ������! " )

Text(16,'������',FastCombiner,6828,3)

Talk(17," ��� ����� ����� 4 ��������� � 3�� ������! " )

Text(17,'������',FastCombiner,6819,3)

Talk(18," ��� ����� ����� 4 ��������� � 3�� ������! " )

Text(18,'������',FastCombiner,6825,3)

Talk(19," ��� ����� ����� 4 ��������� � 3�� ������! " )

Text(19,'������',FastCombiner,6822,3)

Talk(20," ��� ����� ����� 4 ��������� � 3�� ������! " )

Text(20,'������',FastCombiner,6831,3)



Talk(21," ��� ����� ����� 8 ��������� � 4�� ������! " )

Text(21,'������',FastCombiner,6828,4)

Talk(22," ��� ����� ����� 8 ��������� � 4�� ������! " )

Text(22,'������',FastCombiner,6819,4)

Talk(23," ��� ����� ����� 8 ��������� � 4�� ������! " )

Text(23,'������',FastCombiner,6825,4)

Talk(24," ��� ����� ����� 8 ��������� � 4�� ������! " )

Text(24,'������',FastCombiner,6822,4)

Talk(25," ��� ����� ����� 8 ��������� � 4�� ������! " )

Text(25,'������',FastCombiner,6831,4)


Talk(26," ��� ����� ����� 16 ��������� � 5�� ������! " )

Text(26,'������',FastCombiner,6828,5)

Talk(27," ��� ����� ����� 16 ��������� � 5�� ������! " )

Text(27,'������',FastCombiner,6819,5)

Talk(28," ��� ����� ����� 16 ��������� � 5�� ������! " )

Text(28,'������',FastCombiner,6825,5)

Talk(29," ��� ����� ����� 16 ��������� � 5�� ������! " )

Text(29,'������',FastCombiner,6822,5)

Talk(30," ��� ����� ����� 16 ��������� � 5�� ������! " )

Text(30,'������',FastCombiner,6831,5)

Talk(31," �� ��� ������, ������� �������� ����? ����������! " )


end


function AddSkillNPC1()
    Talk( 1,  "������ ����: ������,� ������ ������� �� ����������.� ���� � ���� �� ������ ����� �������,�� ������ ������ �������� ����� " )
    Text( 1,  "���������� ", AddSkillNPC)
    Text( 1,  "� ������ ��� ", CloseTalk )
end

function r_chaoss()
	Talk( 1,  "������������� �����: � ��� �������� ���� ����������, � ���� ���������� �������� ��������. " )
	Text( 1,  "���������� ��� ����� ", Garner2GetWiner)
	Text( 1,  "����� � ��� ����� ", Garner2RequestReorder)
	
	AddNpcMission (2027 )
	
end

function r_gemsnefrit ()
Talk( 1, "������� � ���� ������ �������� �� ������ " )

Text( 1, " ������� ������ ", JumpPage, 2)
Text( 1, " Ƹ���� ������ ", JumpPage, 3)
Text( 1, " ����� ������ ", JumpPage, 4)


Talk(2," �������� ������ ������� ��������� " )

Text( 2, " 3 ������� ", JumpPage, 8)
Text( 2, " 4 ������� ", JumpPage, 9)
Text( 2, " 5 ������� ", JumpPage, 10)
Text( 2, " 6 ������� ", JumpPage, 11)
Text( 2, " 7 ������� ", JumpPage, 12)

Talk(3," �������� ������ ������� ��������� " )

Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)
Text( 3, " 6 ������� ", JumpPage, 16)
Text( 3, " 7 ������� ", JumpPage, 17)

Talk(4," �������� ������ ������� ��������� " )

Text( 4, " 3 ������� ", JumpPage, 18)
Text( 4, " 4 ������� ", JumpPage, 19)
Text( 4, " 5 ������� ", JumpPage, 20)
Text( 4, " 6 ������� ", JumpPage, 21)
Text( 4, " 7 ������� ", JumpPage, 22)

Talk(8," � ���� 4 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5751,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," � ���� 8 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5751,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," � ���� 16 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5751,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," � ���� 32 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5751,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," � ���� 64 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,64 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5751,1,107 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

---

Talk(13," � ���� 4 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5750,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," � ���� 8 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5750,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," � ���� 16 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5750,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," � ���� 32 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5750,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," � ���� 64 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,64 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5750,1,107 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)


---
Talk(18," � ���� 4 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5752,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," � ���� 8 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5752,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," � ���� 16 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5752,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," � ���� 32 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5752,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," � ���� 64 �������� �� ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7494,64 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7494,64 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5752,1,107 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 33)
Text(22," ����� ",MultiTrigger,GetMultiTrigger(),1)

end



function r_setstraja ()
Talk( 1, "��� ���� ������.��� ��� ������ ������� ��� ����� � ������ ̸����� ���.� ������������ ��������.������ �� ���� ������ � ������� ���� �����,�� ����� ��� ��� ���������� " )

Text( 1, " � ��� ��? ", JumpPage, 2)

Talk( 2, "����,������ ������! ������ �������� ��� ���� ������� ��� ������� ��� ������ ��������� � �������� �� �� ����,� ��� �� ���� �� ��� ����� ������, �� �� �������� ����� ���������� ������ " )
Text( 2, " �������� ��� � ������ ", JumpPage, 3)
Text( 2, " ��� ����� ������ ", JumpPage, 4)
Text( 2, " ��� ����� ������ ������ ", JumpPage, 5)
Text( 2, " ��� ����� ����� ������ ", JumpPage, 8)
Text( 2, " ��� ����� ������ ������ ", JumpPage, 6)
Text( 2, " ��� ����� ��������� ������ ", JumpPage, 7)


Talk( 3, "����: ���� 3 ���� ������.������ ����,������ �������� � ������ ��������.������ �� ��� ��������� ��� ���� ������. ������ ���� - �����,�������� - ��������,�������� - �������.����� ����� �������� ���� ����� 3 ����� � ������ ̸����� ��� " )
Text( 3, " ������� ", CloseTalk)
	
	InitTrigger()
	TriggerCondition( 2, NoItem, 266, 1 )
	TriggerCondition( 2, BankNoItem, 266, 1 )

	TriggerAction( 2, GiveItem, 266, 1, 4 )
	TriggerFailure( 2, JumpPage, 11 )
	
Talk( 4, "����,������ ��� ������ �� ��� � ����� ������� ������ �� ������,��� ��� � ���� �������� ���� ���! ��� �� �����,����� �� �����... " )
Text( 4, "������� � ��� ", MultiTrigger, GetMultiTrigger(), 2)


Talk( 5, "����:���� ���� ���������� ������ ������,� ����� �������� ��� �� 3 ���� ������,300 �������� ������,300 ������ ����,� 1 ������������� ������ 800 ��������� � 80.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,4092,3 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,2324,300 )
TriggerCondition( 1, HasItem,4571,300 )
TriggerCondition( 1, HasItem,6225,1 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 4092,3 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 2324,300 )
TriggerAction( 1, TakeItem, 4571,300 )
TriggerAction( 1, TakeItem, 6225,1 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7689,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(5," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk( 6, "����:������ �������� ��� ������ ��������� ���� ����� ������� � ����� �� ������?����� � ����� � ����:1 ���� ������,2500 ��� ����,5 ���� ̸����� ���,300 ������ ����,800 ��������� � 80.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,4092,1 )
TriggerCondition( 1, HasItem,3457,2500 )
TriggerCondition( 1, HasItem,7464,5 )
TriggerCondition( 1, HasItem,4571,300 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 4092,1 )
TriggerAction( 1, TakeItem, 3457,2500 )
TriggerAction( 1, TakeItem, 7464,5 )
TriggerAction( 1, TakeItem, 4571,300 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7790,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(6," ������ ",MultiTrigger,GetMultiTrigger(),1)


Talk( 7, "����:�� ������ �������� ���� ��������� ���������,���������� � ����� ��� � ����� �� ������.������ 2 ���� ������,5000 ��� ����,10 ���� ̸����� ���,500 ������ ����,800 ��������� � 80.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,3457,5000 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,4092,2 )
TriggerCondition( 1, HasItem,7464,10 )
TriggerCondition( 1, HasItem,4571,500 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 3457,5000 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 4092,2 )
TriggerAction( 1, TakeItem, 7464,10 )
TriggerAction( 1, TakeItem, 4571,500 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7791,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(7," ������ ",MultiTrigger,GetMultiTrigger(),1)

Talk( 8, "����:������,��� ��� ����� ���������,������� ������ �� ���,���� ��� ���� ��� ����� �� � ����� ���� � �� �����,������� � ������� � ������ ̸����� ���,� ��� �� 200 �������� ������,1 ������������� ������1 ����� ����,800 ��������� � 80.000.000 ������ " )
InitTrigger()
TriggerCondition( 1, HasItem,7512,1 )
TriggerCondition( 1, HasItem,2324,200 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasItem,6225,1 )
TriggerCondition( 1, HasItem,4571,1 )
TriggerCondition( 1, HasCredit, 800 )
TriggerCondition( 1, HasMoney, 80000000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7512,1 )
TriggerAction( 1, TakeItem, 2324,200 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, TakeItem, 6225,1 )
TriggerAction( 1, TakeItem, 4571,1 )
TriggerAction( 1, DelRoleCredit, 800 )
TriggerAction( 1, TakeMoney, 80000000 )
TriggerAction( 1, GiveItem, 7792,1,4 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 10)
Text(8," ����� ���� ����� � ������ ��� ",MultiTrigger,GetMultiTrigger(),1)
Text(8," ��� ��� ������ �����? ", JumpPage, 9)

Talk( 9, "����� ����� ����� ������ � ��������� ��������� � ������ " )

Talk( 11, " ����� ����� ��� ���� ������ 1 ������! " )
Talk( 10, " ������������ ���������� �����,���� ����! " )

end

function r_timnecrop ()
Talk( 1, "������,���� ����������! " )
Text( 1, " ���������� ", GoTo, 98, 113, "necropolis" )

AddNpcMission 	(2028)
AddNpcMission 	(2029)
AddNpcMission 	(2030)
AddNpcMission 	(2031)
AddNpcMission 	(2038)

end


function r_gemsdeaths ()
Talk( 1, " �� �������� � ������ ̸����� ���,����� � �������� ��������� ������� " )
Text( 1, " ������� +14 ���� ", JumpPage, 2)
Text( 1, " ������� +14 ������������ ", JumpPage, 3)
Text( 1, " ������� +14 �������� ", JumpPage, 4)
Text( 1, " ������� +14 �������� ", JumpPage, 5)
Text( 1, " ������� +14 ���� ", JumpPage, 6)

Talk( 2," �������� ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 7)
Text( 2, " 3 ������� ", JumpPage, 8)
Text( 2, " 4 ������� ", JumpPage, 9)
Text( 2, " 5 ������� ", JumpPage, 10)
Text( 2, " 6 ������� ", JumpPage, 11)

Talk( 3," �������� ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 12)
Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)
Text( 3, " 6 ������� ", JumpPage, 16)

Talk( 4," �������� ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 17)
Text( 4, " 3 ������� ", JumpPage, 18)
Text( 4, " 4 ������� ", JumpPage, 19)
Text( 4, " 5 ������� ", JumpPage, 20)
Text( 4, " 6 ������� ", JumpPage, 21)

Talk( 5," �������� ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 22)
Text( 5, " 3 ������� ", JumpPage, 23)
Text( 5, " 4 ������� ", JumpPage, 24)
Text( 5, " 5 ������� ", JumpPage, 25)
Text( 5, " 6 ������� ", JumpPage, 26)

Talk( 6," �������� ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 27)
Text( 6, " 3 ������� ", JumpPage, 28)
Text( 6, " 4 ������� ", JumpPage, 29)
Text( 6, " 5 ������� ", JumpPage, 30)
Text( 6, " 6 ������� ", JumpPage, 31)

Talk(7," ��� ����� ������ 2 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5845,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ��� ����� ������ 4 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5845,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ��� ����� ������ 8 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5845,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ��� ����� ������ 16 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5845,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ��� ����� ������ 32 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5845,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ��� ����� ������ 2 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5846,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ��� ����� ������ 4 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5846,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," ��� ����� ������ 8 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5846,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," ��� ����� ������ 16 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5846,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," ��� ����� ������ 32 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5846,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," ��� ����� ������ 2 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5849,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," ��� ����� ������ 4 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5849,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," ��� ����� ������ 8 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5849,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," ��� ����� ������ 16 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5849,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," ��� ����� ������ 32 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5849,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," ��� ����� ������ 2 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5848,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(22," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," ��� ����� ������ 4 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5848,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(23," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," ��� ����� ������ 8 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,8 )
TriggerAction( 1, GiveItem, 5848,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," ��� ����� ������ 16 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,16 )
TriggerAction( 1, GiveItem, 5848,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," ��� ����� ������ 32 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7510,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 5848,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(26," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," ��� ����� ������ 2 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,2 )
TriggerAction( 1, GiveItem, 5847,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," ��� ����� ������ 4 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,4 )
TriggerAction( 1, GiveItem, 5847,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," ��� ����� ������ 8 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,8 )
TriggerAction( 1, GiveItem, 5847,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," ��� ����� ������ 16 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,16 )
TriggerAction( 1, GiveItem, 5847,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," ��� ����� ������ 32 �������� +14 " )
InitTrigger()
TriggerCondition( 1, HasItem,7510,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7510,32 )
TriggerAction( 1, GiveItem, 5847,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," ������������ ���������� �����,���� ������� ���� " )
end

function r_newbicomb ()
Talk( 1, " � ����� � �������� �������,�� ������ ������! " )
Text( 1, " �������� �������� ", JumpPage, 2)
Text( 1, " �������� ������ ", JumpPage, 3)
Text( 1, " �������� �������� ", JumpPage, 4)
Text( 1, " ������� �������� ", JumpPage, 5)
Text( 1, " ��������� �������� ", JumpPage, 6)
Text( 1, " ����������� �������� ", JumpPage, 7)

Talk( 2," ������ ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 13)
Text( 2, " 3 ������� ", JumpPage, 14)
Text( 2, " 4 ������� ", JumpPage, 15)
Text( 2, " 5 ������� ", JumpPage, 16)

Talk( 3," ������ ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 17)
Text( 3, " 3 ������� ", JumpPage, 18)
Text( 3, " 4 ������� ", JumpPage, 19)
Text( 3, " 5 ������� ", JumpPage, 20)

Talk( 4," ������ ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 21)
Text( 4, " 3 ������� ", JumpPage, 22)
Text( 4, " 4 ������� ", JumpPage, 23)
Text( 4, " 5 ������� ", JumpPage, 24)

Talk( 5," ������ ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 25)
Text( 5, " 3 ������� ", JumpPage, 26)
Text( 5, " 4 ������� ", JumpPage, 27)
Text( 5, " 5 ������� ", JumpPage, 28)

Talk( 6," ������ ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 29)
Text( 6, " 3 ������� ", JumpPage, 30)
Text( 6, " 4 ������� ", JumpPage, 31)
Text( 6, " 5 ������� ", JumpPage, 32)

Talk( 7," ������ ������ ������� ��������� " )
Text( 7, " 2 ������� ", JumpPage, 8)
Text( 7, " 3 ������� ", JumpPage, 9)
Text( 7, " 4 ������� ", JumpPage, 10)
Text( 7, " 5 ������� ", JumpPage, 11)

Talk(8," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(8,'������',FastCombiner,881,2)

Talk(9," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(9,'������',FastCombiner,881,3)

Talk(10," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(10,'������',FastCombiner,881,4)

Talk(11," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(11,'������',FastCombiner,881,5)

Talk(13," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(13,'������',FastCombiner,878,2)

Talk(14," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(14,'������',FastCombiner,878,3)

Talk(15," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(15,'������',FastCombiner,878,4)

Talk(16," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(16,'������',FastCombiner,878,5)

Talk(17," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(17,'������',FastCombiner,863,2)

Talk(18," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(18,'������',FastCombiner,863,3)

Talk(19," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(19,'������',FastCombiner,863,4)

Talk(20," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(20,'������',FastCombiner,863,5)

Talk(21," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(21,'������',FastCombiner,880,2)

Talk(22," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(22,'������',FastCombiner,880,3)

Talk(23," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(23,'������',FastCombiner,880,4)

Talk(24," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(24,'������',FastCombiner,880,5)

Talk(25," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(25,'������',FastCombiner,882,2)

Talk(26," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(26,'������',FastCombiner,882,3)

Talk(27," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(27,'������',FastCombiner,882,4)

Talk(28," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(28,'������',FastCombiner,882,5)

Talk(29," ��� ����� ����� 2 ��������� � 2�� ������! " )
Text(29,'������',FastCombiner,883,2)

Talk(30," ��� ����� ����� 4 ��������� � 3�� ������! " )
Text(30,'������',FastCombiner,883,3)

Talk(31," ��� ����� ����� 8 ��������� � 4�� ������! " )
Text(31,'������',FastCombiner,883,4)

Talk(32," ��� ����� ����� 16 ��������� � 5�� ������! " )
Text(32,'������',FastCombiner,883,5)
end

function r_ghssdeaths ()
Talk( 1, " ������ �������� � ����� " )
Text( 1, " ������� +20 ���� ", JumpPage, 2)
Text( 1, " ������� +20 ������������ ", JumpPage, 3)
Text( 1, " ������� +20 �������� ", JumpPage, 4)
Text( 1, " ������� +20 �������� ", JumpPage, 5)
Text( 1, " ������� +20 ���� ", JumpPage, 6)

Talk( 2," �������� ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 7)
Text( 2, " 3 ������� ", JumpPage, 8)
Text( 2, " 4 ������� ", JumpPage, 9)
Text( 2, " 5 ������� ", JumpPage, 10)
Text( 2, " 6 ������� ", JumpPage, 11)

Talk( 3," �������� ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 12)
Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)
Text( 3, " 6 ������� ", JumpPage, 16)

Talk( 4," �������� ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 17)
Text( 4, " 3 ������� ", JumpPage, 18)
Text( 4, " 4 ������� ", JumpPage, 19)
Text( 4, " 5 ������� ", JumpPage, 20)
Text( 4, " 6 ������� ", JumpPage, 21)

Talk( 5," �������� ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 22)
Text( 5, " 3 ������� ", JumpPage, 23)
Text( 5, " 4 ������� ", JumpPage, 24)
Text( 5, " 5 ������� ", JumpPage, 25)
Text( 5, " 6 ������� ", JumpPage, 26)

Talk( 6," �������� ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 27)
Text( 6, " 3 ������� ", JumpPage, 28)
Text( 6, " 4 ������� ", JumpPage, 29)
Text( 6, " 5 ������� ", JumpPage, 30)
Text( 6, " 6 ������� ", JumpPage, 31)

Talk(7," ��� ����� ������ 2 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7615,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ��� ����� ������ 4 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7615,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ��� ����� ������ 8 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7615,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ��� ����� ������ 16 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7615,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ��� ����� ������ 32 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7615,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ��� ����� ������ 2 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7618,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ��� ����� ������ 4 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7618,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," ��� ����� ������ 8 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7618,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," ��� ����� ������ 16 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7618,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," ��� ����� ������ 32 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7618,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," ��� ����� ������ 2 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7619,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," ��� ����� ������ 4 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7619,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," ��� ����� ������ 8 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7619,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," ��� ����� ������ 16 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7619,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," ��� ����� ������ 32 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7619,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," ��� ����� ������ 2 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7617,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(22," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," ��� ����� ������ 4 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7617,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(23," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," ��� ����� ������ 8 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,8 )
TriggerAction( 1, GiveItem, 7617,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," ��� ����� ������ 16 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,16 )
TriggerAction( 1, GiveItem, 7617,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," ��� ����� ������ 32 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7620,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7617,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(26," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," ��� ����� ������ 2 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,2 )
TriggerAction( 1, GiveItem, 7616,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," ��� ����� ������ 4 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,4 )
TriggerAction( 1, GiveItem, 7616,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," ��� ����� ������ 8 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,8 )
TriggerAction( 1, GiveItem, 7616,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," ��� ����� ������ 16 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,16 )
TriggerAction( 1, GiveItem, 7616,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," ��� ����� ������ 32 �������� +20 " )
InitTrigger()
TriggerCondition( 1, HasItem,7620,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7620,32 )
TriggerAction( 1, GiveItem, 7616,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," ������������ ���������� �����,���� ������� ���� " )
end


function r_povar ()
Talk( 1, "������,� ���� ������� ���� ��������� " )

Text( 1, "����� ���� ", JumpPage, 2)
Text( 1, "���� ", BuyPage)
Text( 1, "�������� ���������� ", OpenItemFix )
Text( 1, "� ���� ������ ������ � ��������� ", JumpPage, 3)

InitTrade()
Weapon(	2236	)

Talk( 2, "��������� ��������� ����� � ������� ����� �������,�� ������� ��������� ���,����� ���� �.��� ����� ������ ������� ��� 2 ����������� ������ ���,10 �������� ����� (1000��),1000 ���������, 1 ������� ����� � 50.000.000 ������" )
Text( 2, "���� ������� ��� ", JumpPage, 6)
Text( 2, "����� �������� ", CloseTalk)


Talk( 3, "��������� �������� � ���� �������� ����������,������������ � ��������.��������� � ��� ������������ �������� ������������� �� ��������� � ��������� ������������� � ��������� ������������� ����� ��������� ����,��� �����,�������� ������,� ��� �� ��������� �������������� �������. " )
Text( 3, "��� �� ��������� ����������? ", JumpPage, 4)
Text( 3, "��� ������������ �����? ", JumpPage, 5)
Text( 3, "������� ", CloseTalk)

Talk( 4, "��������� ���������� ��������� ��� ������� �����.���� ���� ���������,�� �� ������� ������ ���. " )
Text( 4, "�������� ", CloseTalk)

Talk( 5, "���� ����� ���������� �����,��� ���������,���� � ��� � ������� ���������.����� ���� ������ �����.������ �������� �� ����������� ������,��� ������� �� ������� " )
Text( 5, "�������� ", CloseTalk)

Talk(6," � �������� ��� ���� ������ � ��� �����,��� ��� ����� �����?... " )
InitTrigger()
TriggerCondition( 1, HasItem,2589,2 )
TriggerCondition( 1, HasItem,7746,10 )
TriggerCondition( 1, HasItem,7727,1 )
TriggerCondition( 1, HasMoney, 50000000 )
TriggerCondition( 1, HasCredit, 1000 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2589,2 )
TriggerAction( 1, TakeItem, 7746,10 )
TriggerAction( 1, TakeItem, 7727,1 )
TriggerAction( 1, TakeMoney, 50000000 )
TriggerAction( 1, DelRoleCredit, 1000 )
TriggerAction( 1, GiveItem, 1064,1,4 )
TriggerFailure( 1, JumpPage, 32)
Text(6," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," ������������ ���������� �����,���� ������� ���� " )

AddNpcMission(214)
AddNpcMission(215)
end

function r_djektpf ()
Talk( 1, "������ " )
Text( 1, "������ ", GoTo, 645, 873, "magicsea" )
 end 
 


function r_elka ()
	
Talk( 1, " ����������� ���� ����! ����� ��� ��� ����� � �����, � ������� �������� �������� �������, � ����-������ ��� ���� �� ������� ��������� :)  " )
Text( 1, " ���� �������! ", JumpPage, 2)

Talk( 2, " �� � ������� ������ �������? " )
Text( 2, " ��! ", JumpPage, 3)

Talk(3," �� ���-��, ������� ��� 5 ���������� ��������, � �������� ������� �� ����-�������! ")
InitTrigger()
TriggerCondition( 1, HasItem,2887,5 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2887,5 )
TriggerAction( 1, GiveItem, 7414,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," ��, � ���� ���� �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "�� �������� ������� � ���� ���� �����! " ) -- �������� ���� �� ���������� ����

end

 function inet_mag()
 Talk( 1,  "������!� ������ �������� �������� �������� �� �����, ����� �� ������ ������ � ������� ���� � �������������� �� ������ xxxkeksonxxx " )
 Text( 1,  "���������� �������� ", SendExchangeData)

 InitExchange()

 ExchangeData( 7416 , 1 , 7355 , 1 , 1)
      ExchangeData( 7417 , 9 , 7320 , 1 , 1)
	ExchangeData( 7417 , 9 , 7321 , 1 , 1)
	ExchangeData( 7417 , 9 , 7322 , 1 , 1)
	ExchangeData( 7417 , 9 , 7323 , 1 , 1)
	ExchangeData( 7417 , 9 , 7324 , 1 , 1)
	ExchangeData( 7417 , 9 , 7325 , 1 , 1)
	ExchangeData( 7417 , 15 , 192 , 1 , 1)
	ExchangeData( 7417 , 8 , 7336 , 1 , 1)
	
end


function podarok_k ()

Talk( 1, " ������������!� ���� �������� ���������� ����� �� ��� ������� � �� ������!  " )
Text( 1, " ��, �����! ", JumpPage, 2)

Talk( 2, " �� � ����� �� ��������!!! " )
Text( 2, " ����� 6 ���������� ����� � �� �������� 1 ������� � ����� ��������! ", JumpPage, 3)
Text( 2, " ����� 1 ���������� ����� � �� �������� ������ ������! ", JumpPage, 4)
Text( 2, " ����� 3 ������� ���� 3��� � �� �������� 1 5��� ! ", JumpPage, 5)
Text( 2, " ����� 2 ������� ���� 4��� � �� �������� 1 5��� ! ", JumpPage, 6)

Talk(3," �� ���! ")
InitTrigger()
TriggerCondition( 1, HasItem,7338,6 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7338,6 )
TriggerAction( 1, GiveItem, 7414,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(3," ��� �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk(4," �� ���! ")
InitTrigger()
TriggerCondition( 1, HasItem,7338,1 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7338,1 )
TriggerAction( 1, GiveItem, 1780,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(4," �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk(5," �� ���! ")
InitTrigger()
TriggerCondition( 1, HasItem,2754,3 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2754,3 )
TriggerAction( 1, GiveItem, 2802,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(5," �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk(6," �� ���! ")
InitTrigger()
TriggerCondition( 1, HasItem,2778,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 2778,2 )
TriggerAction( 1, GiveItem, 2802,1,4 )
TriggerFailure( 1, JumpPage, 19)
Text(6," �������! ",MultiTrigger,GetMultiTrigger(),1)

Talk( 19, "�����, �� ��������� ����! " ) -- �������� ���� �� ���������� ����

end



function t_oazis()
Talk( 1, "����� ���������� � �����,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 642, 870, "magicsea" )
Text( 1, "���������� �� ������ ", JumpPage, 2)

	Text( 2, "������� ", JumpPage, 3)
	Text( 2, "����� ", JumpPage, 4)

	Talk( 3, "� ������ ������ ����� ������������: " )
	Text( 3, "��� ", JumpPage, 5)
	
	Talk( 4, "� ������ ������ ����� ������������: " )
	Text( 4, "��� ", JumpPage, 6)
	
	Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	Text( 5, "������� ", CloseTalk)
	Text( 5, "�������� �� ��� ", CloseTalk)
	Text( 5, "���� ���� ", CloseTalk)
	Text( 5, "������ ����� (10 ����) ", CloseTalk)
	Text( 5, "������ �� ", CloseTalk)
	Text( 5, "������ ������� ", CloseTalk)
	Text( 5, "������ �� 10 ����� ", CloseTalk)

	Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	Text( 6, "������ ������ (200 �������) ", CloseTalk)
	Text( 6, "����� ����� ", CloseTalk)
	Text( 6, "������ ��������� ���������� ", CloseTalk)
	Text( 6, "������ 100.000 ", CloseTalk)
	Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_oazisulit()
Talk( 1, "����� ���������� � �����,��� ���� ������ ������? " )
Text( 1, "�������� � ������ ", GoTo, 642, 870, "magicsea" )
Text( 1, "���������� �� ������ ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "��� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "��� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end

function t_skorptp()
Talk( 1, "������ " )
Text( 1, "�������� � ������ ", GoTo, 642, 870, "magicsea" )
Text( 1, "���������� �� ���� ", JumpPage, 2)

	-- Text( 2, "������� ", JumpPage, 3)
	-- Text( 2, "����� ", JumpPage, 4)

	-- Talk( 3, "� ������ ������ ����� ������������: " )
	-- Text( 3, "��� ", JumpPage, 5)
	
	-- Talk( 4, "� ������ ������ ����� ������������: " )
	-- Text( 4, "��� ", JumpPage, 6)
	
	-- Talk( 5, "����,����� ����������� - 20 ������,������ ���������� ���������: " )
	-- Text( 5, "������� ", CloseTalk)
	-- Text( 5, "�������� �� ��� ", CloseTalk)
	-- Text( 5, "���� ���� ", CloseTalk)
	-- Text( 5, "������ ����� (10 ����) ", CloseTalk)
	-- Text( 5, "������ �� ", CloseTalk)
	-- Text( 5, "������ ������� ", CloseTalk)
	-- Text( 5, "������ �� 10 ����� ", CloseTalk)

	-- Talk( 6, "���� ������,����� ����������� - 20 �����,������ ���������� ���������: " )
	-- Text( 6, "������ ���������� (200 �������) ", CloseTalk)
	-- Text( 6, "������ ������ (200 �������) ", CloseTalk)
	-- Text( 6, "����� ����� ", CloseTalk)
	-- Text( 6, "������ ��������� ���������� ", CloseTalk)
	-- Text( 6, "������ 100.000 ", CloseTalk)
	-- Text( 6, "������� ������ ����� ", CloseTalk)
	
end



function r_ghstimzgge ()
Talk( 1, " ������ �������� � +40 " )
Text( 1, " ������� +40 ���� ", JumpPage, 2)
Text( 1, " ������� +40 ������������ ", JumpPage, 3)
Text( 1, " ������� +40 �������� ", JumpPage, 4)
Text( 1, " ������� +40 �������� ", JumpPage, 5)
Text( 1, " ������� +40 ���� ", JumpPage, 6)

Talk( 2," �������� ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 7)
Text( 2, " 3 ������� ", JumpPage, 8)
Text( 2, " 4 ������� ", JumpPage, 9)
Text( 2, " 5 ������� ", JumpPage, 10)
Text( 2, " 6 ������� ", JumpPage, 11)

Talk( 3," �������� ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 12)
Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)
Text( 3, " 6 ������� ", JumpPage, 16)

Talk( 4," �������� ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 17)
Text( 4, " 3 ������� ", JumpPage, 18)
Text( 4, " 4 ������� ", JumpPage, 19)
Text( 4, " 5 ������� ", JumpPage, 20)
Text( 4, " 6 ������� ", JumpPage, 21)

Talk( 5," �������� ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 22)
Text( 5, " 3 ������� ", JumpPage, 23)
Text( 5, " 4 ������� ", JumpPage, 24)
Text( 5, " 5 ������� ", JumpPage, 25)
Text( 5, " 6 ������� ", JumpPage, 26)

Talk( 6," �������� ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 27)
Text( 6, " 3 ������� ", JumpPage, 28)
Text( 6, " 4 ������� ", JumpPage, 29)
Text( 6, " 5 ������� ", JumpPage, 30)
Text( 6, " 6 ������� ", JumpPage, 31)

Talk(7," ��� ����� ������ 2 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7820,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ��� ����� ������ 4 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7820,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ��� ����� ������ 8 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7820,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ��� ����� ������ 16 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7820,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ��� ����� ������ 32 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7820,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ��� ����� ������ 2 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7823,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ��� ����� ������ 4 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7823,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," ��� ����� ������ 8 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7823,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," ��� ����� ������ 16 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7823,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," ��� ����� ������ 32 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7823,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," ��� ����� ������ 2 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7824,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," ��� ����� ������ 4 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7824,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," ��� ����� ������ 8 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7824,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," ��� ����� ������ 16 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7824,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," ��� ����� ������ 32 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7824,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," ��� ����� ������ 2 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7822,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(22," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," ��� ����� ������ 4 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7822,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(23," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," ��� ����� ������ 8 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,8 )
TriggerAction( 1, GiveItem, 7822,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," ��� ����� ������ 16 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,16 )
TriggerAction( 1, GiveItem, 7822,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," ��� ����� ������ 32 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7825,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7822,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(26," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," ��� ����� ������ 2 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,2 )
TriggerAction( 1, GiveItem, 7821,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," ��� ����� ������ 4 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,4 )
TriggerAction( 1, GiveItem, 7821,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," ��� ����� ������ 8 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,8 )
TriggerAction( 1, GiveItem, 7821,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," ��� ����� ������ 16 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,16 )
TriggerAction( 1, GiveItem, 7821,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," ��� ����� ������ 32 �������� +40 " )
InitTrigger()
TriggerCondition( 1, HasItem,7825,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7825,32 )
TriggerAction( 1, GiveItem, 7821,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," ������������ ���������� �����,���� ������� ���� " )
end

function r_ckoruad ()

Talk( 1, "���� �� ����������� ������� ����,����� ������!� ���� ���� ������� ����� 5000,����� � ���� ���� � ���� ��������� ��������! " )
Text( 1, "�����!" )
 
AddNpcMission(2032)
AddNpcMission(2033)
AddNpcMission(2034)
AddNpcMission(2035)
AddNpcMission(2036)
AddNpcMission(2037)
 end 



function r_gggshmtt ()
Talk( 1, " ������ �������� � +30 " )
Text( 1, " ������� +30 ���� ", JumpPage, 2)
Text( 1, " ������� +30 ������������ ", JumpPage, 3)
Text( 1, " ������� +30 �������� ", JumpPage, 4)
Text( 1, " ������� +30 �������� ", JumpPage, 5)
Text( 1, " ������� +30 ���� ", JumpPage, 6)

Talk( 2," �������� ������ ������� ��������� " )
Text( 2, " 2 ������� ", JumpPage, 7)
Text( 2, " 3 ������� ", JumpPage, 8)
Text( 2, " 4 ������� ", JumpPage, 9)
Text( 2, " 5 ������� ", JumpPage, 10)
Text( 2, " 6 ������� ", JumpPage, 11)

Talk( 3," �������� ������ ������� ��������� " )
Text( 3, " 2 ������� ", JumpPage, 12)
Text( 3, " 3 ������� ", JumpPage, 13)
Text( 3, " 4 ������� ", JumpPage, 14)
Text( 3, " 5 ������� ", JumpPage, 15)
Text( 3, " 6 ������� ", JumpPage, 16)

Talk( 4," �������� ������ ������� ��������� " )
Text( 4, " 2 ������� ", JumpPage, 17)
Text( 4, " 3 ������� ", JumpPage, 18)
Text( 4, " 4 ������� ", JumpPage, 19)
Text( 4, " 5 ������� ", JumpPage, 20)
Text( 4, " 6 ������� ", JumpPage, 21)

Talk( 5," �������� ������ ������� ��������� " )
Text( 5, " 2 ������� ", JumpPage, 22)
Text( 5, " 3 ������� ", JumpPage, 23)
Text( 5, " 4 ������� ", JumpPage, 24)
Text( 5, " 5 ������� ", JumpPage, 25)
Text( 5, " 6 ������� ", JumpPage, 26)

Talk( 6," �������� ������ ������� ��������� " )
Text( 6, " 2 ������� ", JumpPage, 27)
Text( 6, " 3 ������� ", JumpPage, 28)
Text( 6, " 4 ������� ", JumpPage, 29)
Text( 6, " 5 ������� ", JumpPage, 30)
Text( 6, " 6 ������� ", JumpPage, 31)

Talk(7," ��� ����� ������ 2 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7925,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(7," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(8," ��� ����� ������ 4 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7925,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(8," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(9," ��� ����� ������ 8 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7925,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(9," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(10," ��� ����� ������ 16 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7925,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(10," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(11," ��� ����� ������ 32 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7925,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(11," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(12," ��� ����� ������ 2 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7928,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(12," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(13," ��� ����� ������ 4 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7928,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(13," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(14," ��� ����� ������ 8 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7928,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(14," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(15," ��� ����� ������ 16 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7928,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(15," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(16," ��� ����� ������ 32 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7928,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(16," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(17," ��� ����� ������ 2 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7929,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(17," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(18," ��� ����� ������ 4 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7929,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(18," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(19," ��� ����� ������ 8 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,8 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7929,1,104 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(19," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(20," ��� ����� ������ 16 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,16 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7929,1,105 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(20," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(21," ��� ����� ������ 32 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7929,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(21," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(22," ��� ����� ������ 2 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,2 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7927,1,102 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(22," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(23," ��� ����� ������ 4 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,4 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7927,1,103 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(23," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(24," ��� ����� ������ 8 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,8 )
TriggerAction( 1, GiveItem, 7927,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(24," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(25," ��� ����� ������ 16 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,16 )
TriggerAction( 1, GiveItem, 7927,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(25," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(26," ��� ����� ������ 32 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 ) --��� ������� �������� ����� ���� � � ����� ���������� ������ ���� � �������
TriggerCondition( 1, HasLeaveBagGrid, 1 ) --
TriggerCondition( 1, KitbagLock, 0 ) -- ��� ������� �������� ������������ �� ���������
TriggerAction( 1, TakeItem, 7930,32 ) -- ��� ������� "�������" �������� � � ����� ����������
TriggerAction( 1, GiveItem, 7927,1,106 ) -- ��� ������� ������ �������� (ID, ���-��)
TriggerFailure( 1, JumpPage, 32)
Text(26," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(27," ��� ����� ������ 2 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,2 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,2 )
TriggerAction( 1, GiveItem, 7926,1,102 )
TriggerFailure( 1, JumpPage, 32)
Text(27," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(28," ��� ����� ������ 4 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,4 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,4 )
TriggerAction( 1, GiveItem, 7926,1,103 )
TriggerFailure( 1, JumpPage, 32)
Text(28," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(29," ��� ����� ������ 8 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,8 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,8 )
TriggerAction( 1, GiveItem, 7926,1,104 )
TriggerFailure( 1, JumpPage, 32)
Text(29," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(30," ��� ����� ������ 16 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,16 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,16 )
TriggerAction( 1, GiveItem, 7926,1,105 )
TriggerFailure( 1, JumpPage, 32)
Text(30," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(31," ��� ����� ������ 32 �������� +30 " )
InitTrigger()
TriggerCondition( 1, HasItem,7930,32 )
TriggerCondition( 1, HasLeaveBagGrid, 1 )
TriggerCondition( 1, KitbagLock, 0 )
TriggerAction( 1, TakeItem, 7930,32 )
TriggerAction( 1, GiveItem, 7926,1,106 )
TriggerFailure( 1, JumpPage, 32)
Text(31," ����� ",MultiTrigger,GetMultiTrigger(),1)

Talk(32," ������������ ���������� �����,���� ������� ���� " )
end
